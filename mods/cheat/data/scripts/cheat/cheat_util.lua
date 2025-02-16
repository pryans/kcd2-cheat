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

function Cheat:xmlLoadLocalizationDatabase(xmlFile)
    Cheat:logDebug("Loading XML localization database file [%s]", xmlFile)

    if not xmlFile then
        return false, nil
    end

    local xml = System.LoadTextFile(xmlFile)
    if not xml then
        return false, nil
    end

    local luaTableResult = {}
    local rowStartTag = "<Row>"
    local rowEndTag = "</Row>"
    local cellStartTag = "<Cell>"
    local cellEndTag = "</Cell>"

    local rowStartIndex = 1
    while true do
        rowStartIndex, _ = string.find(xml, rowStartTag, rowStartIndex, true)
        if not rowStartIndex then
            break -- No more rows found
        end

        local rowEndIndex = string.find(xml, rowEndTag, rowStartIndex, true)
        if not rowEndIndex then
            break -- Malformed XML, row start but no end
        end

        local rowContent = string.sub(xml, rowStartIndex + #rowStartTag, rowEndIndex - 1)
        local cells = {}
        local cellStartIndex = 1
        while true do
            cellStartIndex, _ = string.find(rowContent, cellStartTag, cellStartIndex, true)
            if not cellStartIndex then
                break -- No more cells in this row
            end

            local cellEndIndex = string.find(rowContent, cellEndTag, cellStartIndex, true)
            if not cellEndIndex then
                break -- Malformed XML, cell start but no end in this row
            end

            local cellValue = string.sub(rowContent, cellStartIndex + #cellStartTag, cellEndIndex - 1)
            table.insert(cells, cellValue)
            cellStartIndex = cellEndIndex + #cellEndTag
        end

        if #cells >= 1 then
            local key = Cheat:trimToNil(cells[1])
            local value1 = Cheat:toLower(Cheat:trimToNil(cells[2]))
            local value2 = Cheat:toLower(Cheat:trimToNil(cells[3]))

            if key and value1 then
                -- field 1 vs 2 can be formal and inforaml, or singular and plural
                luaTableResult[key] = {
                    field1 = value1,
                    field2 = value2
                }
            end
        end

        rowStartIndex = rowEndIndex + #rowEndTag
    end

    return luaTableResult
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

-- ============================================================================
-- string functions
-- ============================================================================
function Cheat:isBlank(value)
    return value == nil or value == ""
end

function Cheat:toUpper(value)
    if value then
        -- string.upper fails if passed nil
        return string.upper(value)
    else
        return value
    end
end

function Cheat:toLower(value)
    if value then
        -- string.lower fails if passed nil
        return string.lower(value)
    else
        return value
    end
end

function Cheat:startsWith(text, key)
    return key == "" or string.sub(text, 1, string.len(key)) == key
end

function Cheat:endsWith(text, key)
    return key == "" or string.sub(text, -string.len(key)) == key
end

function Cheat:trim(value)
    if value and type(value) == "string" then
        value = value:gsub("^%s+", ""):gsub("%s+$", "")
        return value
    else
        return value
    end
end

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
    if number then
        local truncated_number, _ = math.modf(number) -- Discard fractional part with '_'
        return truncated_number
    end
    return nil
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

function Cheat:isNear(v1, v2, nearDistance)
    return math.abs(v1 - v2) <= nearDistance
end

function Cheat:createSpawnVectorFromVector(avoidCenter, position, radius, near)
    if not radius or radius < 0 then
        radius = 0
    end

    if not near or near < 0 then
        near = 0
    end

    -- need to avoid an infinite loop
    if avoidCenter and radius - near < 2 then
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

function Cheat:createSpawnVectorFromPosition(avoidCenter, xPos, yPos, zPos, radius, near)
    return Cheat:createSpawnVectorFromVector(avoidCenter, { x = xPos, y = yPos, z = zPos }, radius, near)
end

function Cheat:distanceToPlayer(entity)
    local v1 = g_Vectors.temp_v1
    entity:GetWorldPos(v1)

    local v2 = g_Vectors.temp_v2
    player:GetWorldPos(v2)

    local v3 = g_Vectors.temp_v3
    v3 = VectorUtils.Subtract(v2, v1)

    return VectorUtils.Length(v3)
end

function Cheat:rayCastUnderPoint(x, y, rayHeight, rayDistance)
    local from = { x = x, y = y, z = rayHeight }
    local dir = { x = 0, y = 0, z = -1 }
    dir = VectorUtils.Scale(dir, rayDistance)
    local skip = player.id;
    local hitData = {}
    local hits = Physics.RayWorldIntersection(from, dir, 1, ent_all, skip, nil, hitData)
    return hits, hitData
end

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

function Cheat:testAssert(message, value)
    if not value then
        Cheat:log(string.format("$4[FAIL] %s", tostring(message)))
        Cheat.g_cheat_test_fail = Cheat.g_cheat_test_fail + 1
    else
        Cheat:log(string.format("$3[PASS] %s", tostring(message)))
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

function Cheat:testAssertEquals(name, actualValue, expectedValue)
    if actualValue ~= expectedValue then
        Cheat:log(string.format("$4[FAIL] %s actualValue [%s] ~= expectedValue [%s]",
            name, tostring(actualValue), tostring(expectedValue)))
        Cheat.g_cheat_test_fail = Cheat.g_cheat_test_fail + 1
    else
        Cheat:log(string.format("$3[PASS] %s actualValue [%s] ~= expectedValue [%s]",
            name, tostring(actualValue), tostring(expectedValue)))
        Cheat.g_cheat_test_pass = Cheat.g_cheat_test_pass + 1
    end
end

function Cheat:testAssertEqualsFloat(name, actualValue, expectedValue, maxDifference)
    local diff = nil

    if actualValue and expectedValue and maxDifference then
        diff = math.abs(actualValue - expectedValue)
    end

    if not diff or diff >= maxDifference then
        Cheat:log(string.format("$4[FAIL] %s actualValue [%s] ~= expectedValue [%s], maxDifference [%s] (diff=%s)",
            name, tostring(actualValue), tostring(expectedValue), tostring(maxDifference), tostring(diff)))
        Cheat.g_cheat_test_fail = Cheat.g_cheat_test_fail + 1
    else
        Cheat:log(string.format("$3[PASS] %s actualValue [%s] ~= expectedValue [%s] maxDifference [%s]",
            name, tostring(actualValue), tostring(expectedValue), tostring(maxDifference)))
        Cheat.g_cheat_test_pass = Cheat.g_cheat_test_pass + 1
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_util.lua loaded")
