-- ============================================================================
-- createCommand
-- ============================================================================
Cheat.g_command_registry = {}
Cheat.g_command_proxies = {}

function Cheat:proxy(cmdName, line)
    Cheat:logDebug("commandProxy: name[%s], line[%s]", tostring(cmdName), tostring(line))

    local argsSet = Cheat.g_command_registry[cmdName].cmdArgsSet
    local cmdContext = {}
    if argsSet then
        local args = Cheat:argsProcess(line, argsSet)
        local hasErrors = false
        for argName, _ in pairs(args) do
            local argValue, argErr = Cheat:argsGet(args, argName)
            cmdContext[argName] = argValue
            if argErr then
                hasErrors = true
            end
        end

        if hasErrors then
            System.ExecuteCommand(cmdName .. " ?")
            return false
        end
    else
        cmdContext.line = line
    end

    Cheat:logDebug("commandProxy: name[%s], context[%s]", tostring(cmdName), Cheat:serializeTable(cmdContext))
    return Cheat[cmdName](Cheat, cmdContext)
end

function Cheat:createCommand(cmdName, cmdArgsSet, cmdDocs, ...)
    if not Cheat.g_command_registry[cmdName] then
        local cmdHelp = "$8" .. cmdDocs .. "$8\n"

        if cmdArgsSet then
            cmdHelp = cmdHelp .. "\n$8Arguments:$8\n"
            for key, val in pairs(cmdArgsSet) do
                cmdHelp = cmdHelp .. "\t$6" .. tostring(key) .. ": $5" .. tostring(val(nil, key, true)) .. "\n"
            end
        end

        local examples = Cheat:packTable(...)
        if examples and #examples > 0 then
            --Cheat:logDebug("examples = " .. tostring(#examples))
            cmdHelp = cmdHelp .. "\n$8Examples:$8\n"
            local i = 1
            while i < examples.n do
                cmdHelp = cmdHelp .. "\t$6" .. tostring(examples[i]) .. ":\n\t$5" .. tostring(examples[i + 1]) .. "\n\n"
                --Cheat:logDebug(cmdHelp)
                i = i + 2
            end
        end

        Cheat.g_command_registry[cmdName] = { cmdName = cmdName, cmdArgsSet = cmdArgsSet, cmdHelp = cmdHelp }

        local proxyFunctionName = "g_command_proxies_" .. cmdName
        Cheat[proxyFunctionName] = function (self, line)
            Cheat:logDebug("Function Proxy: %s(%s)", tostring(proxyFunctionName), tostring(line))
            Cheat:proxy(cmdName, line)
        end

        local proxyFunction = "Cheat:" .. proxyFunctionName .. "(%line)"
        System.AddCCommand(cmdName, proxyFunction, cmdHelp)
    else
        Cheat:logError("Console command [%s] is already registered.", tostring(cmdName))
    end
end

function Cheat:createCommandAlias(aliasName, aliasTarget)
    Cheat:logDebug("here createCommandAlias")

    if Cheat.g_command_registry[aliasName] then
        Cheat:logError("A command with name [%s] already exists.", tostring(aliasName))
        return false
    end

    local target = Cheat.g_command_registry[aliasTarget]
    if not target then
        Cheat:logError("Alias target command [%s] not found.", tostring(aliasTarget))
        return false
    end

    Cheat.g_command_registry[aliasName] = target
    local proxyFunctionName = "g_command_proxies_" .. target.cmdName
    local proxyFunction = "Cheat:" .. proxyFunctionName .. "(%line)"
    System.AddCCommand(aliasName, proxyFunction, target.cmdHelp)
    Cheat:logInfo("Created alias [%s] with target [%s].", tostring(aliasName), tostring(aliasTarget))
    return true
end

function Cheat:createCommandLegacy(cmdName, cmdFunc, cmdArgsSet, cmdDocs, ...)
    if not Cheat.g_command_registry[cmdName] then
        local cmdHelp = "$8" .. cmdDocs .. "$8\n"

        if cmdArgsSet then
            cmdHelp = cmdHelp .. "\n$8Arguments:$8\n"
            for key, val in pairs(cmdArgsSet) do
                cmdHelp = cmdHelp .. "\t$6" .. tostring(key) .. ": $5" .. tostring(val(nil, key, true)) .. "\n"
            end
        end

        local examples = Cheat:packTable(...)
        if examples and #examples > 0 then
            --Cheat:logDebug("examples = " .. tostring(#examples))
            cmdHelp = cmdHelp .. "\n$8Examples:$8\n"
            local i = 1
            while i < examples.n do
                cmdHelp = cmdHelp .. "\t$6" .. tostring(examples[i]) .. ":\n\t$5" .. tostring(examples[i + 1]) .. "\n\n"
                --Cheat:logDebug(cmdHelp)
                i = i + 2
            end
        end

        Cheat.g_command_registry[cmdName] = { cmdName = cmdName, cmdFunc = cmdFunc, cmdArgsSet = cmdArgsSet, cmdHelp = cmdHelp }
        System.AddCCommand(cmdName, cmdFunc, cmdHelp)
    else
        Cheat:logError("Console command [%s] is already registered to function [%s].", tostring(cmdName), tostring(cmdFunc))
    end
end

-- ============================================================================
-- cheat_alias
-- ============================================================================
Cheat:createCommand("cheat_alias", {
        name = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Name of the new command.") end,
        target = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Existing cheat command to execute.") end,
    },
    "Creates an alias for a cheat command.",
    "Alias cheat_teleport_to_checkpoint to 'cgoto'", "cheat_alias name:cgoto target:cheat_teleport_to_checkpoint")
function Cheat:cheat_alias(c)
    Cheat:createCommandAlias(c.name, c.target)
end

-- ============================================================================
-- cheat_save
-- ============================================================================
Cheat:createCommand("cheat_save", nil,
    "This instantly saves your game. No item requirements or save limits.",
    "Save your game", "cheat_save")
function Cheat:cheat_save()
    -- probably not needed..
    -- Game.RemoveSaveLock() -- throws an error
    if not Game.IsLoadingEngineSaveGame() then
        Game.SaveGameViaResting()
        return true
    else
        Cheat:logError("Wait for the game to finish loading.")
    end
    return false
end

-- ============================================================================
-- cheat timer system
-- ============================================================================
Cheat.g_cheat_timer_id = nil
Cheat.g_cheat_timer_period_millis = 1000
Cheat.g_cheat_timer_callbacks = {}

function Cheat:cheat_timer_callback(nTimerId)
    --Cheat:logDebug("cheat_timer_callback")
    Cheat.g_cheat_timer_id = Script.SetTimer(Cheat.g_cheat_timer_period_millis, function (nTimerId) Cheat:cheat_timer_callback(nTimerId) end)
    for key, value in pairs(Cheat.g_cheat_timer_callbacks) do
        --Cheat:logDebug("call [%s]", tostring(key))
        value()
    end
end

function Cheat:cheat_timer(enabled)
    if enabled == true and Cheat.g_cheat_timer_id == nil then
        Cheat.g_cheat_timer_id = Script.SetTimer(Cheat.g_cheat_timer_period_millis, function (nTimerId) Cheat:cheat_timer_callback(nTimerId) end)
        Cheat:logInfo("cheat timer on [%s] every [%s] ms", tostring(Cheat.g_cheat_timer_id), tostring(Cheat.g_cheat_timer_period_millis))
    end

    if enabled == false and Cheat.g_cheat_timer_id ~= nil then
        Script.KillTimer(Cheat.g_cheat_timer_id)
        Cheat.g_cheat_timer_id = nil
        Cheat:logInfo("cheat timer off")
    end
end

function Cheat:cheat_timer_register(name, func)
    Cheat.g_cheat_timer_callbacks[name] = func
end

-- ============================================================================
-- EventSystemListener
-- ============================================================================
function Cheat:EventSystemListener(actionName, eventName, argTable)
    Cheat:logDebug("EventSystemListener: actionName[%s] eventName[%s]", tostring(actionName), tostring(eventName))
    if Cheat:logIsDebugEnabled() then
        if argTable then
            Cheat:tprint(argTable)
        end
    end

    if actionName == "System" and eventName == "OnSystemStarted" then
        Cheat:onSystemStarted()
    end

    if actionName == "System" and eventName == "OnQuickLoadingStart" then
        Cheat:onQuickLoadingStart()
    end

    if actionName == "System" and eventName == "OnLoadingComplete" then
        Cheat:onLoadingComplete()
    end

    if actionName == "System" and eventName == "OnGameplayStarted" then
        Cheat:onGameplayStarted()
    end

    if actionName == "System" and eventName == "OnGamePause" then
        Cheat:onGamePause()
    end

    if actionName == "System" and eventName == "OnGameResume" then
        Cheat:onGameResume()
    end
end

UIAction.RegisterEventSystemListener(Cheat, "", "", "EventSystemListener")

-- ============================================================================
-- ElementListener
-- ============================================================================
Cheat.g_map_cursor_point = nil
function Cheat:ElementListener(elementName, instanceId, eventName, argTable)
    Cheat:logDebug("ElementListener: elementName[%s] instanceId[%s] eventName[%s]",
        tostring(elementName), tostring(instanceId), tostring(eventName))
    if Cheat:logIsDebugEnabled() then
        if argTable then
            Cheat:tprint(argTable)
        end
    end

    if argTable[0] == "ui_apse_checkpoint_add" then
        local cursor = {
            x = UIAction.CallFunction("ApseMap", instanceId, "GetCurrentCursorPosX"),
            y = UIAction.CallFunction("ApseMap", instanceId, "GetCurrentCursorPosY"),
        }
        Cheat.g_map_cursor_point = cursor
        Cheat:logDebug("Cheat:ElementListener: ui_apse_checkpoint_add [%s]", Cheat:serializeTable(cursor))
    end
end

UIAction.RegisterElementListener(Cheat, "ApseMap", -1, "", "ElementListener")

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_console.lua loaded")
