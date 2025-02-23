-- ============================================================================
-- helpers
-- ============================================================================
Cheat.g_action_callbacks = {}

---buildActionKey
---@param slot string
---@param type string
---@return string
function Cheat:buildActionKey(slot, type)
    return tostring(slot) .. ":" .. tostring(type)
end

---registerAction
---@param slot string
---@param type string
---@param funcPointer function
---@return boolean
function Cheat:registerAction(slot, type, funcPointer)
    if not funcPointer then
        return false
    end

    local key = Cheat:buildActionKey(slot, type)

    if not Cheat.g_action_callbacks[key] then
        Cheat.g_action_callbacks[key] = {}
    end

    table.insert(Cheat.g_action_callbacks[key], funcPointer)
    return true
end

---publishAction
---@param slot string
---@param type string
---@return boolean
function Cheat:publishAction(slot, type)
    local key = Cheat:buildActionKey(slot, type)

    local eventHandlers = Cheat.g_action_callbacks[key]
    if not eventHandlers or #eventHandlers == 0 then
        Cheat:logInfo("Nothing is bound to action slot [%s] type [%s].", tostring(slot), tostring(type))
        return false
    end

    for _, funcPointer in ipairs(eventHandlers) do
        pcall(funcPointer)
    end

    return true
end

---resetAction
---@param slot string
---@param type string
---@return boolean
function Cheat:resetAction(slot, type)
    local key = Cheat:buildActionKey(slot, type)

    if Cheat.g_action_callbacks[key] then
        Cheat.g_action_callbacks[key] = {}
        Cheat:logInfo("Reset action slot [%s] type [%s].", tostring(slot), tostring(type))
        return true
    else
        Cheat:logInfo("Nothing is bound to action slot [%s] type [%s].", tostring(slot), tostring(type))
        return false
    end
end

---resetAllActions
function Cheat:resetAllActions()
    Cheat.g_action_callbacks = {}
    Cheat:logInfo("All action reset.")
end

-- ============================================================================
-- cheat_action
-- ============================================================================
Cheat:createCommand("cheat_action", {
        slot = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Action Slot") end,
        type = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Action Type") end,
    },
    "This command is used by the Cheat-Keys optional mod to publish keyboard press/hold events to Cheat mod.\n" ..
    "This command can be used to manually simulate a key press as well.",
    "Simulate pressing F5.", "cheat_action slot:1 type:press")
function Cheat:cheat_action(c)
    return Cheat:publishAction(c.slot, c.type)
end

-- ============================================================================
-- cheat_action_reset
-- ============================================================================
Cheat:createCommand("cheat_action_reset", {
        slot = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Action Slot") end,
        type = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Action Type") end,
    },
    "Removes all commands bound to the given action.")
function Cheat:cheat_action_reset(c)
    return Cheat:resetAction(c.slot, c.type)
end

-- ============================================================================
-- cheat_action_reset_all
-- ============================================================================
Cheat:createCommand("cheat_action_reset_all", nil, "Removes all commands bound to all actions.")
function Cheat:cheat_action_reset_all(c)
    return Cheat:resetAllActions()
end

-- ============================================================================
-- cheat_action_begin_binding
-- ============================================================================
Cheat.g_action_binding_stage = nil
Cheat:createCommand("cheat_action_begin_binding", {
        slot = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Action Slot") end,
        type = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Action Type") end,
    },
    "Begins binding commands to the given action slot and type.\n" ..
    "$8Use cheat_action_bind_console_command and cheat_action_bind_lua_code to bind 1+ commands to the action.\n" ..
    "$8Use cheat_action_end_binding to complete the process.")
function Cheat:cheat_action_begin_binding(c)
    Cheat.g_action_binding_stage = {
        slot = c.slot,
        type = c.type,
        callbacks = {},
    }
    Cheat:logInfo("Binding started for action slot [%s] type [%s].",
        tostring(Cheat.g_action_binding_stage.slot),
        tostring(Cheat.g_action_binding_stage.type))
    return true
end

-- ============================================================================
-- cheat_action_bind_console_command
-- ============================================================================
Cheat:createCommand("cheat_action_bind_console_command", nil, "Binds a console command to the current action.")
function Cheat:cheat_action_bind_console_command(c)
    if not Cheat.g_action_binding_stage then return false end
    local callback = function () System.ExecuteCommand(c.line) end
    table.insert(Cheat.g_action_binding_stage.callbacks, callback)
    Cheat:logInfo("Bound command [%s] (function %s) to action slot [%s] type [%s].",
        tostring(c.line),
        tostring(callback),
        tostring(Cheat.g_action_binding_stage.slot),
        tostring(Cheat.g_action_binding_stage.type))
    return true
end

-- ============================================================================
-- cheat_action_bind_lua_code
-- ============================================================================
Cheat:createCommand("cheat_action_bind_lua_code", nil, "Binds lua code to the current action.")
function Cheat:cheat_action_bind_lua_code(c)
    if not Cheat.g_action_binding_stage then return false end
    local callback = function () loadstring(c.line)() end
    table.insert(Cheat.g_action_binding_stage.callbacks, callback)
    Cheat:logInfo("Bound lua code [%s] (function %s) to action slot [%s] type [%s].",
        tostring(c.line),
        tostring(callback),
        tostring(Cheat.g_action_binding_stage.slot),
        tostring(Cheat.g_action_binding_stage.type))
    return true
end

-- ============================================================================
-- cheat_action_end_binding
-- ============================================================================
Cheat:createCommand("cheat_action_end_binding", nil, "Ends binding a command to the given action slot and type.")
function Cheat:cheat_action_end_binding(c)
    if not Cheat.g_action_binding_stage then return false end
    for _, functionPointer in ipairs(Cheat.g_action_binding_stage.callbacks) do
        Cheat:registerAction(Cheat.g_action_binding_stage.slot, Cheat.g_action_binding_stage.type, functionPointer)
        Cheat:logInfo("Registered function [%s] to action slot [%s] type [%s].",
            tostring(functionPointer),
            tostring(Cheat.g_action_binding_stage.slot),
            tostring(Cheat.g_action_binding_stage.type))
    end
    Cheat.g_action_binding_stage = nil
    Cheat:logInfo("Binding finished for action slot [%s] type [%s].",
        tostring(Cheat.g_action_binding_stage.slot),
        tostring(Cheat.g_action_binding_stage.type))
    return true
end

--[[

]]

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_actions.lua loaded")
