-- ============================================================================
-- createCommand
-- ============================================================================
function Cheat:createCommand(cmdName, cmdFunc, cmdArgsSet, cmdDocs, ...)
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

    if Cheat.isCommandLineBuild then
        cmdHelp = " \n \n[size=4][b]" .. cmdName .. "[/b][/size]" .. "\n" .. cmdHelp
        cmdHelp = cmdHelp:gsub("$8Arguments:$8", "[b]Arguments:[/b]")
        cmdHelp = cmdHelp:gsub("$8Examples:$8", "[b]Examples:[/b]")

        for i = 1, 9 do
            cmdHelp = cmdHelp:gsub("$" .. tostring(i), "")
        end

        --print(cmdHelp)

        local helpFile = io.open(Cheat.devHome .. "/Source/Docs/help.txt", "a+")
        if helpFile then
            helpFile:write(cmdHelp)
            helpFile:flush()
            helpFile:close()
        end

        table.insert(Cheat.commands, cmdName)
    end

    System.AddCCommand(cmdName, cmdFunc, cmdHelp)
end

-- ============================================================================
-- cheat_save
-- ============================================================================
Cheat:createCommand("cheat_save", "Cheat:cheat_save()", nil,
    "This instantly saves your game. No item requirements or save limits.",
    "Save your game", "cheat_save")
function Cheat:cheat_save()
    -- probably not needed..
    Game.RemoveSaveLock()
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
-- end
-- ============================================================================
Cheat:logDebug("cheat_console.lua loaded")
