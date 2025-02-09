Cheat.g_database_cache = {}

function Cheat:loadDatabase(databaseName)
    local database = {}
    if not Cheat.g_database_cache[databaseName] then
        local lineCount = Database.GetTableInfo(databaseName).LineCount
        for n = 0, lineCount - 1 do
            table.insert(database, Database.GetTableLine(databaseName, n))
        end
        Cheat.g_database_cache[databaseName] = database
    end
    return database
end

function Cheat:findRows(database, searchKey, rowIdKey, rowNameKey)
    local searchKeyUpper = nil
    local foundRows = {}

    if not Cheat:isBlank(searchKey) then
        searchKeyUpper = Cheat:toUpper(searchKey)
    end

    for _, row in ipairs(database) do
        local rowIdUpper = Cheat:toUpper(row[rowIdKey])
        local rowNameUpper = Cheat:toUpper(row[rowNameKey])
        local found = false

        if searchKeyUpper then
            found = (rowIdUpper == searchKeyUpper) or (string.find(rowNameUpper, searchKeyUpper, 1, true) ~= nil)
        else
            found = true
        end

        if found then
            local foundRow = {}
            foundRow.id = tostring(row[rowIdKey])
            foundRow.name = tostring(row[rowNameKey])
            --foundRow.data = {}

            for k, v in pairs(row) do
                if k and v and k ~= rowIdKey and k ~= rowNameKey and not Cheat:isBlank(v) then
                    --foundRow.data[k] = v
                    foundRow[k] = v
                end
            end

            table.insert(foundRows, foundRow)
        end
    end

    Cheat:logDebug("Found [%s] rows for search token [%s].", tostring(#foundRows), tostring(searchKey))
    return foundRows
end

function Cheat:findRow(database, searchKey, rowIdKey, rowNameKey)
    local rows = Cheat:findRows(database, searchKey, rowIdKey, rowNameKey)
    local row = nil
    if rows and #rows > 0 then
        row = rows[#rows]
        Cheat:logDebug("Found row [%s] with id [%s].", row[rowNameKey], row[rowIdKey])
    end
    return row
end

function Cheat:findDatabaseRows(databaseName, searchKey)
    local database = Cheat:loadDatabase(databaseName)
    return Cheat:findRows(database, searchKey, databaseName .. "_id", databaseName .. "_name")
end

function Cheat:findDatabaseRow(databaseName, searchKey)
    local database = Cheat:loadDatabase(databaseName)
    return Cheat:findRow(database, searchKey, databaseName .. "_id", databaseName .. "_name")
end

function Cheat:xmlParseAttributes(xml)
    local attributes = {}
    string.gsub(xml, "([%-%w]+)=([\"'])(.-)%2", function (w, _, a)
        attributes[w] = a
    end)
    return attributes
end

function Cheat:xmlReadTags(xml, onTagFunction)
    xml = string.gsub(xml, '<?xml version="1.0" encoding="us-ascii"?>', "")
    local stack = {}
    local top = {}
    table.insert(stack, top)
    local ni, c, label, xarg, empty
    local i, j = 1, 1
    while true do
        ---@diagnostic disable-next-line: cast-local-type
        ni, j, c, label, xarg, empty = string.find(xml, "<(%/?)([%w:]+)(.-)(%/?)>", i)
        if not ni then break end
        if empty == "/" then
            -- empty element tag
            onTagFunction(label, Cheat:xmlParseAttributes(xarg))
        elseif c == "" then
            -- start tag
            top = { label = label, xarg = Cheat:xmlParseAttributes(xarg) }
            table.insert(stack, top)
        else
            -- end tag
            local toclose = table.remove(stack)
            top = stack[#stack]
            if #stack < 1 then
                Cheat:logError("nothing to close with [%s]", label)
            end
            if toclose.label ~= label then
                Cheat:logError("trying to close [%s] with [%s]", toclose.label, label)
            end
            onTagFunction(toclose.label, toclose.xarg)
        end
        i = j + 1
    end
end

function Cheat:xmlLoadDatabase(xmlFile, onTagFunction)
    -- function onTagFunction(str:tag, table:attributes)
    -- libs/tables/item/item.xml

    Cheat:logDebug("Loading XML database file [%s]", xmlFile)

    if not xmlFile or not onTagFunction then
        return false
    end

    local xml = System.LoadTextFile(xmlFile)
    if not xml then
        return false
    end

    Cheat:xmlReadTags(xml, onTagFunction)
    return true
end

-- ============================================================================
-- player functions
-- ============================================================================
function Cheat:NotPlayerCharacter()
    if player.soul:GetGender() ~= enum_humanGender.male and player.soul:GetGender() ~= enum_humanGender.female then
        Cheat:logError("You cannot be playing as another character to use this command.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- table functions
-- ============================================================================

function Cheat:createLookupTable(...)
    local args_array = { n = select("#", ...), ... }
    local lookup_table = {}
    for _, v in ipairs(args_array) do
        lookup_table[v] = true
    end
    return lookup_table
end

function Cheat:packTable(...)
    return { n = select("#", ...), ... }
end

function Cheat:serializeTable(t)
    local s = ""
    for k, v in pairs(t) do
        if #s > 0 then
            s = s .. " "
        end
        s = s .. string.format("%s=%s", tostring(k), tostring(v))
    end
    return s
end

function Cheat:createHelpForLookupTable(lookupTable, helpPrefix)
    local sortedKeys = {}
    for key in pairs(lookupTable) do
        table.insert(sortedKeys, key)
    end
    table.sort(sortedKeys)

    local helpText = helpPrefix
    for _, k in ipairs(sortedKeys) do
        helpText = helpText .. string.format("$3      %s %s\n", k, lookupTable[k].name)
    end

    return helpText
end

function Cheat:formatArrayAsList(dataArray, numColumns)
    local columns = {}
    for i = 1, numColumns do
        columns[i] = {}
    end

    local maxColumnWidths = {}
    for i = 1, numColumns do
        maxColumnWidths[i] = 0
    end

    local colIndex = 1
    for i, w in ipairs(dataArray) do
        local digit_padding = ""
        if i < 10 then
            digit_padding = " "
        end
        local entry = digit_padding .. "$8" .. tostring(i) .. " = " .. w
        table.insert(columns[colIndex], entry)
        maxColumnWidths[colIndex] = math.max(maxColumnWidths[colIndex], #entry) -- Track max width
        colIndex = colIndex % numColumns + 1                                    -- Cycle through columns
    end

    local list = ""
    for row = 1, #columns[1] do
        for col = 1, numColumns do
            local entry = columns[col][row] or "" -- Get entry or empty string if row is shorter in this column
            local padding = ""
            if entry ~= "" then
                local neededPadding = maxColumnWidths[col] - #entry
                padding = string.rep(" ", neededPadding) -- Create padding spaces
            end
            list = list .. entry .. padding
            if col < numColumns then
                list = list .. "    " -- Column spacing
            end
        end
        list = list .. "\n" -- New line after each row
    end

    return list
end

function Cheat:lowercaseTableKeys(inputTable)
    local newTable = {}
    for key, value in pairs(inputTable) do
        if type(key) == "string" then
            newTable[string.lower(key)] = value
        else
            newTable[key] = value
        end
    end
    return newTable
end

-- ============================================================================
-- string functions
-- ============================================================================
function Cheat:isBlank(value)
    return value == nil or value == ""
end

function Cheat:toUpper(value)
    if not Cheat:isBlank(value) then
        -- string.upper fails if passed nil
        return string.upper(value)
    else
        return value
    end
end

function Cheat:toLower(value)
    if not Cheat:isBlank(value) then
        -- string.lower fails if passed nil
        return string.lower(value)
    else
        return value
    end
end

function Cheat:endsWith(String, End)
    return End == "" or string.sub(String, -string.len(End)) == End
end

-- ============================================================================
-- math functions
-- ============================================================================
function Cheat:min(x, y)
    if x < y then
        return x
    else
        return y
    end
end

function Cheat:max(x, y)
    if x > y then
        return x
    else
        return y
    end
end

function Cheat:truncate(number)
    if number >= 0 then
        return math.floor(number)
    else
        return math.ceil(number)
    end
end

function Cheat:clamp(value, min, max)
    -- can't clamp nil
    if not value then
        return nil
    end

    if value < min then
        return min
    end

    if value > max then
        return max
    end

    return value
end

-- ============================================================================
-- type functions
-- ============================================================================
function Cheat:isBoolean(value)
    if type(value) ~= "boolean" then
        local testValue = Cheat:toUpper(tostring(value))
        if testValue == "TRUE" or testValue == "FALSE" then
            return true
        else
            return false
        end
    else
        return true
    end
end

function Cheat:toBoolean(value)
    if type(value) ~= "boolean" then
        local testValue = Cheat:toUpper(tostring(value))
        if testValue == "TRUE" then
            return true
        elseif testValue == "FALSE" then
            return false
        else
            return nil
        end
    else
        return value
    end
end

function Cheat:isNumber(value)
    local testValue = tonumber(value)
    if testValue then
        return true
    else
        return false
    end
end

-- ============================================================================
-- logging functions
-- ============================================================================
Cheat.g_cheat_log_level_debug = 3
Cheat.g_cheat_log_level_info = 2
Cheat.g_cheat_log_level_warn = 1
Cheat.g_cheat_log_level_error = 0
Cheat.g_cheat_log_level_off = -1
Cheat.g_cheat_last_log_level = nil
Cheat.g_cheat_log_level = Cheat.g_cheat_log_level_debug

function Cheat:logSetLevel(level)
    Cheat.g_cheat_log_level = level
end

function Cheat:logOff()
    if Cheat.g_cheat_log_level ~= Cheat.g_cheat_log_level_off then
        Cheat.g_cheat_last_log_level = Cheat.g_cheat_log_level
        Cheat.g_cheat_log_level = Cheat.g_cheat_log_level_off
    end
end

function Cheat:logOn()
    if Cheat.g_cheat_log_level == Cheat.g_cheat_log_level_off then
        Cheat.g_cheat_log_level = Cheat.g_cheat_last_log_level
    end
end

function Cheat:log(value)
    if Cheat.isCommandLineBuild == false then
        System.LogAlways(value)
    else
        print(value)
    end
end

function Cheat:logIsDebugEnabled()
    return Cheat.g_cheat_log_level >= Cheat.g_cheat_log_level_debug
end

function Cheat:logDebug(message, ...)
    if Cheat:logIsDebugEnabled() then
        Cheat:log(string.format("$3[DEBUG] " .. message, ...))
    end
end

function Cheat:logIsInfoEnabled()
    return Cheat.g_cheat_log_level >= Cheat.g_cheat_log_level_info
end

function Cheat:logInfo(message, ...)
    if Cheat:logIsInfoEnabled() then
        Cheat:log(string.format("$5[INFO] " .. message, ...))
    end
end

function Cheat:logIsWarnEnabled()
    return Cheat.g_cheat_log_level >= Cheat.g_cheat_log_level_warn
end

function Cheat:logWarn(message, ...)
    if Cheat:logIsWarnEnabled() then
        Cheat:log(string.format("$6[WARN] " .. message, ...))
    end
end

function Cheat:logIsErrorEnabled()
    return Cheat.g_cheat_log_level >= Cheat.g_cheat_log_level_error
end

function Cheat:logError(message, ...)
    if Cheat:logIsErrorEnabled() then
        Cheat:log(string.format("$4[ERROR] " .. message, ...))
    end
end

-- ============================================================================
-- testing functions
-- ============================================================================
Cheat.g_cheat_test_fail = 0
Cheat.g_cheat_test_pass = 0
Cheat.g_cheat_test_name = nil

function Cheat:testEnabled()
    return Cheat:logIsDebugEnabled() or Cheat.isCommandLineBuild
end

function Cheat:beginTest(name)
    Cheat:log(string.format("$4[TEST] Starting test set [%s].", tostring(name)))
    Cheat:logOff()
    Cheat.g_cheat_test_fail = 0
    Cheat.g_cheat_test_pass = 0
    Cheat.g_cheat_test_name = name
end

function Cheat:endTest()
    Cheat:logOn()
    if Cheat.g_cheat_test_fail > 0 then
        Cheat:log(string.format("$4[TEST] Test set [%s] failed with fail=[%s] pass[%s].", tostring(Cheat.g_cheat_test_name),
            tostring(Cheat.g_cheat_test_fail), tostring(Cheat.g_cheat_test_pass)))
    else
        Cheat:log(string.format("$4[TEST] Test set [%s] passed with fail=[%s] pass[%s].", tostring(Cheat.g_cheat_test_name),
            tostring(Cheat.g_cheat_test_fail), tostring(Cheat.g_cheat_test_pass)))
    end
end

function Cheat:testAssert(name, value)
    if not value then
        Cheat:log(string.format("$4[FAIL] %s", tostring(name)))
        Cheat.g_cheat_test_fail = Cheat.g_cheat_test_fail + 1
    else
        Cheat:log(string.format("$3[PASS] %s", tostring(name)))
        Cheat.g_cheat_test_pass = Cheat.g_cheat_test_pass + 1
    end
end

function Cheat:testAssertFalse(name, value)
    if value then
        Cheat:log(string.format("$4[FAIL] %s", tostring(name)))
        Cheat.g_cheat_test_fail = Cheat.g_cheat_test_fail + 1
    else
        Cheat:log(string.format("$3[PASS] %s", tostring(name)))
        Cheat.g_cheat_test_pass = Cheat.g_cheat_test_pass + 1
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_util.lua loaded")
