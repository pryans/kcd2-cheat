---@diagnostic disable: deprecated
-- ============================================================================
-- debug functions
-- ============================================================================
function Cheat:dump_all()
    for key, value in pairs(_G) do
        Cheat:logWarn("\n==============================================================================")
        if value then
            if type(value) == "table" then
                Cheat:logWarn("%s (%s)", tostring(key), type(value))
                Cheat:logWarn("==== META METHODS:")
                Cheat:print_methods(getmetatable(value))
                Cheat:logWarn("==== METHODS:")
                Cheat:print_methods(value)
            else
                Cheat:logWarn("%s (%s) = [%s]", tostring(key), type(value), tostring(value))
            end
        end
    end
end

function Cheat:print_db_table(tableName, filter, debug)
    if not Database.LoadTable(tableName) then
        Cheat:logError("Unable to load table [%s].", tostring(tableName))
        return
    end

    local tableInfo = Database.GetTableInfo(tableName)
    if not tableInfo then
        Cheat:logError("Table [%s] not found.", tostring(tableName))
        return
    end

    if tableInfo.LineCount == 0 then
        Cheat:logInfo("Table [%s] is empty.", tostring(tableName))
        return
    end

    local rows = tableInfo.LineCount - 1

    for i = 0, rows do
        local tableline = Database.GetTableLine(tableName, i)
        if tableline then
            local displayLine = ""
            for key, value in pairs(tableline) do
                if debug then
                    Cheat:logDebug("Pair key=[%s] value=[%s].", tostring(key), tostring(value))
                end

                if not Cheat:isBlank(filter) then
                    if string.find(string.upper(key), string.upper(filter)) or string.find(string.upper(tostring(value)), string.upper(filter)) then
                        displayLine = displayLine .. " " .. key .. "=" .. tostring(value)
                    end
                else
                    displayLine = displayLine .. " " .. key .. "=" .. tostring(value)
                end
            end

            if not Cheat:isBlank(displayLine) then
                Cheat:logInfo(displayLine)
            end
        else
            Cheat:logError("Read nil table line (this is a bug).")
        end
    end
end

function Cheat:print_methods(object, filter)
    if not object then
        Cheat:logDebug("Object is nil")
        return
    end

    for key, _ in pairs(object) do
        if Cheat:isBlank(filter) or string.find(Cheat:toUpper(key), Cheat:toUpper(filter), 1, true) then
            Cheat:logInfo(key)
        end
    end
end

function Cheat:print_all_tables(object, tableName, showMethods)
    if not object then
        object = _G
    end

    if not Cheat:isBlank(tableName) then
        tableName = Cheat:toUpper(tableName)
    else
        tableName = nil
    end

    if showMethods ~= true and showMethods ~= false then
        showMethods = false
    end

    for key, value in pairs(object) do
        if not tableName or (tableName and tableName ~= Cheat:toUpper(key)) then
            local getKeyType = loadstring("return type(" .. key .. ")")
            if getKeyType and getKeyType() == "table" then
                Cheat:logWarn("TABLE: " .. key)
                if showMethods then
                    local getTable = loadstring("return " .. key)
                    if getTable then
                        Cheat:print_methods(getTable())
                    end
                end
            end
        end
    end
end

function Cheat:print_all_functions(object)
    if not object then
        object = _G
    end

    for key, value in pairs(object) do
        local getKeyType = loadstring("return type(" .. key .. ")")
        if getKeyType and getKeyType() == "function" then
            Cheat:logWarn("BEGIN FUNC:" .. key)
            local func = loadstring("print_method_args(" .. key .. ")")
            if func then
                func()
            end
        end
    end
end

function Cheat:tprint(tbl, indent)
    if not indent then
        indent = 0
    end
    for k, v in pairs(tbl) do
        local formatting = string.rep("  ", indent) .. tostring(k) .. ": "
        if type(v) == "table" then
            Cheat:logDebug(formatting)
            Cheat:tprint(v, indent + 1)
        else
            Cheat:logDebug(formatting .. tostring(v))
        end
    end
end

function Cheat:setup_hook()
    debug.sethook(function (event, line)
        Cheat:logWarn("event=" .. event .. " line=" .. tostring(line))
        Cheat:tprint(debug.getinfo(2, "flLnSu"))
        if event == "call" then
            local i = 1
            while true do
                local name, value = debug.getlocal(2, i)
                if name or value then
                    Cheat:logDebug("    local name=" .. name .. " value=" .. tostring(value))
                    i = i + 1
                else
                    break
                end
            end
        end
    end, "crl")
    Cheat:logDebug("hook set")
end

function Cheat:print_method_args(f)
    Cheat:logDebug("begin - print_method_args")

    local calltracer = function (event, line)
        Cheat:logWarn("event=" .. event .. " line=" .. tostring(line))
        Cheat:tprint(debug.getinfo(2, "flLnSu"))
        if event == "call" then
            local i = 1
            while true do
                local name, value = debug.getlocal(2, i)
                if name or value then
                    Cheat:logDebug("    local name=" .. name .. " value=" .. tostring(value))
                    i = i + 1
                else
                    break
                end
            end
        end
    end
    Cheat:logDebug("tracter function created")
    debug.sethook(calltracer, "crl")
    Cheat:logDebug("debug hook set")

    f()

    debug.sethook()
    Cheat:logDebug("end - print_method_args")
end

-- use for debugging in console
-- #dump(x)
function dump(value)
    if not value then
        Cheat:logDebug("nil")
    elseif type(value) == "table" then
        local count = 0
        for k, _ in pairs(value) do
            count = count + 1
        end
        if count > 0 then
            Cheat:tprint(value)
        else
            Cheat:logDebug("empty table")
        end
    else
        Cheat:logDebug(tostring(value))
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_debug.lua loaded")
