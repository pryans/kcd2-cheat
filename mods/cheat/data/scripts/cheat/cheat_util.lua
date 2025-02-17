Cheat.g_database_cache = {}

function Cheat:loadDatabase(databaseName)
    if not Cheat.g_database_cache[databaseName] then
        -- force load into memory or you might get 0 rows depending on load order
        Database.LoadTable(databaseName)

        ---@diagnostic disable-next-line: undefined-field
        local lineCount = Database.GetTableInfo(databaseName).LineCount

        local database = {}
        for n = 0, lineCount - 1 do
            table.insert(database, Database.GetTableLine(databaseName, n))
        end
        Cheat.g_database_cache[databaseName] = database
        Cheat:logDebug("Returning loaded+cached db[%s] lineCount[%s] loadCount[%s]",
            tostring(databaseName), tostring(lineCount), tostring(#database))
    else
        Cheat:logDebug("Returning cached DB [%s]", databaseName)
    end
    return Cheat.g_database_cache[databaseName]
end

---findRows
---@param database table the database to search
---@param searchOperation table|nil
---@param fields table array of field names to match on
---@return table
function Cheat:findRows(database, searchOperation, fields)
    if not searchOperation then
        searchOperation = { exact = false, searchKey = nil }
    end
    local searchKeyUpper = Cheat:toUpper(Cheat:trimToNil(searchOperation.searchKey))
    local foundRows = {}

    for _, row in ipairs(database) do
        if searchKeyUpper then
            for _, field in ipairs(fields) do
                if row[field] then
                    local searchText = Cheat:trimToNil(Cheat:toUpper(row[field]))
                    if searchOperation.exact then
                        if searchText == searchKeyUpper then
                            table.insert(foundRows, row)
                            break
                        end
                    else
                        if searchText and string.find(searchText, searchKeyUpper, 1, true) then
                            table.insert(foundRows, row)
                            break
                        end
                    end
                end
            end
        else
            table.insert(foundRows, row)
        end
    end

    Cheat:logDebug("Found [%s] rows for search token [%s].", tostring(#foundRows), Cheat:serializeTable(searchOperation))
    return foundRows
end

---findRow
---@param database table the database to search
---@param searchOperation table|nil
---@param fields table array of field names to match on
---@return table|nil
function Cheat:findRow(database, searchOperation, fields)
    local rows = Cheat:findRows(database, searchOperation, fields)
    local row = nil
    if rows and #rows > 0 then
        row = rows[#rows]
        Cheat:logDebug("Found Row: %s", Cheat:serializeTable(row))
    end
    return row
end

function Cheat:findDatabaseRows(databaseName, searchOperation)
    local database = Cheat:loadDatabase(databaseName)
    return Cheat:findRows(database, searchOperation, { databaseName .. "_id", databaseName .. "_name" })
end

function Cheat:findDatabaseRow(databaseName, searchOperation)
    local database = Cheat:loadDatabase(databaseName)
    return Cheat:findRow(database, searchOperation, { databaseName .. "_id", databaseName .. "_name" })
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
    local tagsLoaded = 0
    while true do
        ---@diagnostic disable-next-line: cast-local-type
        ni, j, c, label, xarg, empty = string.find(xml, "<(%/?)([%w:]+)(.-)(%/?)>", i)
        if not ni then break end
        if empty == "/" then
            -- empty element tag
            if onTagFunction(label, Cheat:xmlParseAttributes(xarg)) then
                tagsLoaded = tagsLoaded + 1
            end
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
            if onTagFunction(toclose.label, toclose.xarg) then
                tagsLoaded = tagsLoaded + 1
            end
        end
        i = j + 1
    end
    return tagsLoaded
end

function Cheat:xmlLoadDatabase(xmlFile, onTagFunction)
    -- function onTagFunction(str:tag, table:attributes)
    -- libs/tables/item/item.xml

    --- Cheat:logDebug("Loading XML database [%s] ...", xmlFile)

    if not xmlFile or not onTagFunction then
        return false
    end

    local xml = System.LoadTextFile(xmlFile)
    if not xml then
        return false
    end

    local tagsLoaded = Cheat:xmlReadTags(xml, onTagFunction)
    if tagsLoaded > 0 then
        Cheat:logDebug("Finished loading [%d] tags from XML database [%s]", tagsLoaded, xmlFile)
    else
        Cheat:logError("Failed to load data from XML database [%s]", xmlFile)
    end
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
    if not t then
        return "nil"
    end

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

function Cheat:getSortedKeys(inputTable)
    local sortedKeys = {}
    for key in pairs(inputTable) do
        table.insert(sortedKeys, key)
    end
    table.sort(sortedKeys)
    return sortedKeys
end

function Cheat:logTwoColumnTable(table_to_print)
    -- Check if the input is a table
    if type(table_to_print) ~= "table" then
        Cheat:logError("Input must be a table.")
        return
    end

    -- Find the maximum length of the keys (for left alignment of the first column)
    local max_key_width = 0
    for key, _ in pairs(table_to_print) do
        local key_str = tostring(key) or "?"
        local key_len = string.len(key_str)
        if key_len > max_key_width then
            max_key_width = key_len
        end
    end

    -- Print the table in two columns
    for key, value in pairs(table_to_print) do
        local key_str = tostring(key) or "?"
        local value_str = tostring(value) or "?"

        -- Calculate padding to ensure left alignment and no overlap
        local padding_needed = max_key_width - string.len(key_str)
        local padding = string.rep(" ", padding_needed)

        -- Print the key (left-aligned), padding, and the value (left-aligned)
        Cheat:logInfo(key_str .. padding .. "  " .. value_str) -- Added "  " for a small gap between columns
    end
end

-- ============================================================================
-- string functions
-- ============================================================================

---isBlank
---@param value string|nil
---@return boolean
function Cheat:isBlank(value)
    return value == nil or value == ""
end

---toUpper
---@param value string|nil
---@return string|nil
function Cheat:toUpper(value)
    if value then
        -- string.upper fails if passed nil
        return string.upper(value)
    else
        return value
    end
end

---toLower
---@param value string|nil
---@return string|nil
function Cheat:toLower(value)
    if value then
        -- string.lower fails if passed nil
        return string.lower(value)
    else
        return value
    end
end

---startsWith
---@param text string
---@param key string
---@return boolean
function Cheat:startsWith(text, key)
    return key == "" or string.sub(text, 1, string.len(key)) == key
end

---endsWith
---@param text string
---@param key string
---@return boolean
function Cheat:endsWith(text, key)
    return key == "" or string.sub(text, -string.len(key)) == key
end

---trim
---@param value string|nil
---@return string|nil
function Cheat:trim(value)
    if value and type(value) == "string" then
        value = value:gsub("^%s+", ""):gsub("%s+$", "")
        return value
    else
        return value
    end
end

---trimToNil
---@param value string|nil
---@return string|nil
function Cheat:trimToNil(value)
    value = Cheat:trim(value)
    if Cheat:isBlank(value) then
        return nil
    end
    return value
end

-- ============================================================================
-- math functions
-- ============================================================================

---min
---@param x number
---@param y number
---@return number
function Cheat:min(x, y)
    if x < y then
        return x
    else
        return y
    end
end

---max
---@param x number
---@param y number
---@return number
function Cheat:max(x, y)
    if x > y then
        return x
    else
        return y
    end
end

---truncate
---@param number any
---@return integer
function Cheat:truncate(number)
    local truncated_number, _ = math.modf(number) -- Discard fractional part with '_'
    return truncated_number
end

---clamp
---@param value number
---@param min number
---@param max number
---@return number
function Cheat:clamp(value, min, max)
    if value < min then
        return min
    end

    if value > max then
        return max
    end

    return value
end

---isNear
---@param v1 number
---@param v2 number
---@param nearDistance number
---@return boolean
function Cheat:isNear(v1, v2, nearDistance)
    return math.abs(v1 - v2) <= nearDistance
end

---createSpawnVectorFromVector
---@param avoidCenter boolean
---@param position table vector x,y,z
---@param radius number
---@param near number
---@return table vector x,y,z
function Cheat:createSpawnVectorFromVector(avoidCenter, position, radius, near)
    if not radius or radius < 0 then
        radius = 0
    end

    if not near or near < 0 then
        near = 0
    end

    -- need to avoid an infinite loop
    if avoidCenter and radius - near < 0.1 then
        Cheat:logWarn("changed radius/near from [%s/%s] to [10/2]", tostring(radius), tostring(near))
        radius = 10
        near = 2
    end

    -- TODO/TBD: make sure zPos isn't under the ground
    while true do
        local spawnX = math.random(position.x - radius, position.x + radius)
        local spawnY = math.random(position.y - radius, position.y + radius)
        if avoidCenter then
            -- used to make sure spawn point isn't on top of the player
            if not (Cheat:isNear(spawnX, position.x, near) and Cheat:isNear(spawnY, position.y, near)) then
                return { x = spawnX, y = spawnY, z = position.z }
            end
        else
            return { x = spawnX, y = spawnY, z = position.z }
        end
    end
end

---createSpawnVectorFromPosition
---@param avoidCenter boolean
---@param xPos number
---@param yPos number
---@param zPos number
---@param radius number
---@param near number
---@return table vector x,y,z
function Cheat:createSpawnVectorFromPosition(avoidCenter, xPos, yPos, zPos, radius, near)
    return Cheat:createSpawnVectorFromVector(avoidCenter, { x = xPos, y = yPos, z = zPos }, radius, near)
end

---distanceToPlayer
---@param entity table An entity with a GetWorldPos
---@return number
function Cheat:distanceToPlayer(entity)
    local v1 = g_Vectors.temp_v1
    entity:GetWorldPos(v1)

    local v2 = g_Vectors.temp_v2
    player:GetWorldPos(v2)

    local v3 = g_Vectors.temp_v3
    v3 = VectorUtils.Subtract(v2, v1)

    ---@diagnostic disable-next-line: return-type-mismatch
    return VectorUtils.Length(v3)
end

---rayCastUnderPoint
---@param x number
---@param y number
---@param rayHeight number
---@param rayDistance number
---@return integer hits
---@return table hitData
function Cheat:rayCastUnderPoint(x, y, rayHeight, rayDistance)
    local from = { x = x, y = y, z = rayHeight }
    local dir = { x = 0, y = 0, z = -1 }
    dir = VectorUtils.Scale(dir, rayDistance)
    local skip = player.id;
    local hitData = {}
    local hits = Physics.RayWorldIntersection(from, dir, 1, ent_all, skip, nil, hitData)
    if not hits then
        hits = 0
    end
    return hits, hitData
end

---getGroundHeight
---@param x number
---@param y number
---@return number|nil groundHeight Will be nil if ground wasn't hit by the ray.
function Cheat:getGroundHeight(x, y)
    local rayHeight = 1000
    local rayDistance = 2000
    local hits, hitData = Cheat:rayCastUnderPoint(x, y, rayHeight, rayDistance)
    if hits > 0 then
        for _, hit in pairs(hitData) do
            Cheat:logDebug("Hit: %s", Cheat:serializeTable(hit))
        end
        return rayHeight - hitData[1].dist
    else
        return nil
    end
end

---stringToVector
---@param value string Any string of 3 numbers separated by whitespace or punctuation.
---@return table vector x,y,z
function Cheat:stringToVector(value)
    -- Replace all non-digits with spaces
    local digit_string = string.gsub(value, "[^0-9.]", " ")

    -- Tokenize the string by whitespace and get the first 3 tokens
    local tokens = {}
    local count = 0
    for token in string.gmatch(digit_string, "%S+") do -- %S+ matches one or more non-whitespace characters
        count = count + 1
        if count <= 3 then
            table.insert(tokens, token)
        else
            break
        end
    end

    local vector = {}
    vector.x = tokens[1] or nil
    vector.y = tokens[2] or nil
    vector.z = tokens[3] or nil
    return vector
end

-- ============================================================================
-- type functions
-- ============================================================================

---isBoolean
---@param value any
---@return boolean
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

---toBoolean
---@param value any
---@return boolean|nil
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

---isNumber
---@param value any
---@return boolean
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
    System.LogAlways(value)
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
Cheat.g_cheat_test_info = nil
Cheat.g_cheat_test_suite = nil

function Cheat:beginTestSuite(logOff)
    logOff = logOff or false

    Cheat.g_cheat_test_suite = {
        result = nil,
        logOff = logOff
    }
end

function Cheat:endTestSuite()
    Cheat:logDebug("")
    Cheat:logDebug("=== Test Suite Results ===")
    for _, info in ipairs(Cheat.g_cheat_test_suite) do
        Cheat:log(info.result)

        for _, message in ipairs(info.failures) do
            Cheat:log(message)
        end
    end
    Cheat:logDebug("")

    Cheat.g_cheat_test_info = nil
    Cheat.g_cheat_test_suite = nil
end

function Cheat:beginTests(name, logOff)
    -- default to off
    logOff = logOff or true

    -- test suite overrides local setting
    if Cheat.g_cheat_test_suite then
        logOff = Cheat.g_cheat_test_suite.logOff
    end

    Cheat.g_cheat_test_info = {
        name = name,
        pass = 0,
        fail = 0,
        logOff = logOff,
        result = nil,
        failures = {}
    }

    if Cheat.g_cheat_test_suite then
        table.insert(Cheat.g_cheat_test_suite, Cheat.g_cheat_test_info)
    end

    Cheat:log(string.format("$4[TEST] Starting test set [%s].", tostring(name)))

    if logOff then
        Cheat:logOff()
    end
end

function Cheat:endTests()
    if Cheat.g_cheat_test_info.logOff then
        Cheat:logOn()
    end

    if Cheat.g_cheat_test_info.fail > 0 then
        Cheat.g_cheat_test_info.result = string.format("$4[FAIL] Test set [%s] failed with fail=[%s] pass[%s].",
            tostring(Cheat.g_cheat_test_info.name),
            tostring(Cheat.g_cheat_test_info.fail),
            tostring(Cheat.g_cheat_test_info.pass))

        for _, message in ipairs(Cheat.g_cheat_test_info.failures) do
            Cheat:log(message)
        end
    else
        Cheat.g_cheat_test_info.result = string.format("$3[PASS] Test set [%s] passed with fail=[%s] pass[%s].",
            tostring(Cheat.g_cheat_test_info.name),
            tostring(Cheat.g_cheat_test_info.fail),
            tostring(Cheat.g_cheat_test_info.pass))
    end

    Cheat:log(Cheat.g_cheat_test_info.result)
    Cheat.g_cheat_test_info = nil
end

function Cheat:testPass(message)
    if Cheat.g_cheat_test_info then
        Cheat.g_cheat_test_info.pass = Cheat.g_cheat_test_info.pass + 1
    end
    Cheat:log(string.format("$3[PASS] %s", tostring(message)))
end

function Cheat:testFail(message)
    message = string.format("$4[FAIL] %s", tostring(message))
    if Cheat.g_cheat_test_info then
        Cheat.g_cheat_test_info.fail = Cheat.g_cheat_test_info.fail + 1
        table.insert(Cheat.g_cheat_test_info.failures, message)
    end
    Cheat:log(message)
end

function Cheat:testAssert(message, value)
    if value then
        Cheat:testPass(message)
    else
        Cheat:testFail(message)
    end
end

function Cheat:testAssertFalse(message, value)
    if not value then
        Cheat:testPass(message)
    else
        Cheat:testFail(message)
    end
end

function Cheat:testAssertEquals(message, actualValue, expectedValue)
    message = string.format("%s: actual[%s] expected[%s]", message, tostring(actualValue), tostring(expectedValue))
    if actualValue == expectedValue then
        Cheat:testPass(message)
    else
        Cheat:testFail(message)
    end
end

function Cheat:testAssertEqualsFloat(message, actualValue, expectedValue, maxDifference)
    local diff = nil

    if actualValue and expectedValue and maxDifference then
        diff = math.abs(actualValue - expectedValue)
    end

    message = string.format("%s: actual[%s] expected[%s] maxDifference[%s] (diff=%s)",
        message, tostring(actualValue), tostring(expectedValue), tostring(maxDifference), tostring(diff))

    if not diff or diff >= maxDifference then
        Cheat:testFail(message)
    else
        Cheat:testPass(message)
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_util.lua loaded")
