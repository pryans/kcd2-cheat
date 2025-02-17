-- ============================================================================
-- settings
-- ============================================================================
Cheat.g_localization_enabled = true

-- ============================================================================
-- database
-- ============================================================================
Cheat.g_localization_soul_database = nil
Cheat.g_localization_item_database = nil

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
            local value1 = Cheat:trimToNil(cells[2])
            local value2 = Cheat:trimToNil(cells[3])

            if key and value1 then
                -- field 1 vs 2 can be formal and informal, or singular and plural, or ?
                luaTableResult[key] = {
                    l1name = value1,
                    l2name = value2
                }
            end
        end

        rowStartIndex = rowEndIndex + #rowEndTag
    end

    return luaTableResult
end

function Cheat:initLocalizationDatabase()
    --[[
    text_rich_presence.xml
    text_ui_dialog.xml
    text_ui_ingame.xml
    text_ui_items.xml
    text_ui_menu.xml
    text_ui_menus.xml
    text_ui_minigames.xml
    text_ui_misc.xml
    text_ui_quest.xml
    text_ui_soul.xml
    text_ui_tutorials.xml
    ]]
    Cheat.g_localization_soul_database = Cheat:xmlLoadLocalizationDatabase("Localization/text_ui_soul.xml")
    Cheat.g_localization_item_database = Cheat:xmlLoadLocalizationDatabase("Localization/text_ui_items.xml")
end

---Searches localization databases for the given keys and returns the match localization table or nil.
---@param databases table|nil array of databases to search
---@param keys table|nil array of search keys
---@return table|nil { l1name = "", l2name = "" }
function Cheat:findLocalizedNames(databases, keys)
    if not databases then return nil end
    if not keys then return nil end
    for _, database in ipairs(databases) do
        for _, key in ipairs(keys) do
            if database and key then
                local lnames = database[key]
                if lnames then
                    return lnames
                end
            end
        end
    end
    return nil
end

-- ============================================================================
-- soul
-- ============================================================================
function Cheat:getLocalizedSoulName(soul)
    if not soul then
        return nil
    end

    local lname = soul:GetNameStringId()

    if Cheat.g_localization_enabled then
        local lnames = Cheat:findLocalizedNames({ Cheat.g_localization_soul_database }, { soul:GetNameStringId() })

        if lnames then
            if lnames.l1name then
                lname = lnames.l1name
            elseif lnames.l2name then
                lname = lnames.l2name
            end
        end
    end

    return lname
end

-- ============================================================================
-- item
-- ============================================================================
function Cheat:getLocalizedItemName(item)
    if not item then
        return nil
    end

    local lname = item.name

    if Cheat.g_localization_enabled then
        local keys = {}
        if item["uiname"] then table.insert(keys, item.uiname) end
        if item["name"] then table.insert(keys, item.name) end

        local lnames = Cheat:findLocalizedNames({ Cheat.g_localization_item_database }, keys)

        if lnames then
            if lnames.l2name then
                lname = lnames.l2name
            elseif lnames.l1name then
                lname = lnames.l1name
            end
        end
    end

    return lname
end

-- ============================================================================
-- entity
-- ============================================================================
function Cheat:getLocalizedEntityName(entity)
    if not entity then
        return nil
    end

    if (type(entity) == "userdata") then
        entity = System.GetEntity(entity)
    end

    local lname = nil

    if not lname and entity["soul"] then
        lname = Cheat:getLocalizedSoulName(entity.soul)
    end

    if not lname and entity["uiname"] then
        lname = Cheat:getLocalizedItemName(entity)
    end

    if not lname then
        lname = entity:GetName()
    end

    return lname
end

-- ============================================================================
-- buff
-- ============================================================================
function Cheat:getLocalizedBuffName(buff)
    if not buff then
        return nil
    end

    local lname = buff.buff_name

    if Cheat.g_localization_enabled then
        local keys = {}
        if buff["buff_ui_name"] then table.insert(keys, buff.buff_ui_name) end
        if buff["buff_name"] then table.insert(keys, buff.buff_name) end
        local lnames = Cheat:findLocalizedNames({ Cheat.g_localization_soul_database }, keys)

        if lnames then
            if lnames.l1name then
                lname = lnames.l1name
            elseif lnames.l2name then
                lname = lnames.l2name
            end
        end
    end

    return lname
end

-- ============================================================================
-- cheat_localization
-- ============================================================================
Cheat:createCommand("cheat_localization", {
        enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "If true, localized naming will be used.") end
    },
    "Controls localization of names.",
    "Enable localized names", "cheat_localization enable:true",
    "Disable localized names", "cheat_localization enable:false")
function Cheat:cheat_localization(c)
    Cheat.g_localization_enabled = c.enable
    if Cheat.g_localization_enabled then
        Cheat:logInfo("Localization is on")
    else
        Cheat:logInfo("Localization is off")
    end
    return true
end

-- ============================================================================
-- test_localization
-- ============================================================================
function Cheat:test_localization()
    Cheat:beginTests("test_localization")

    -- make sure real databases loaded
    Cheat:testAssert("g_localization_soul_database loaded", Cheat.g_localization_soul_database)
    Cheat:testAssert("g_localization_item_database loaded", Cheat.g_localization_item_database)

    -- basic testing of Cheat:findLocalizedNames(databases, keys) using real databases
    Cheat:testAssert("findLocalizedNames invalid 1", Cheat:findLocalizedNames({}, {}) == nil)
    Cheat:testAssert("findLocalizedNames invalid 2", Cheat:findLocalizedNames(nil, nil) == nil)
    Cheat:testAssert("findLocalizedNames invalid 3", Cheat:findLocalizedNames({}, nil) == nil)
    Cheat:testAssert("findLocalizedNames invalid 4", Cheat:findLocalizedNames(nil, {}) == nil)
    Cheat:testAssert("findLocalizedNames invalid 5", Cheat:findLocalizedNames({ Cheat.g_localization_soul_database }, nil) == nil)
    Cheat:testAssert("findLocalizedNames invalid 6", Cheat:findLocalizedNames({ Cheat.g_localization_soul_database }, {}) == nil)
    Cheat:testAssert("findLocalizedNames invalid 7", Cheat:findLocalizedNames(nil, { "buff_alcoholism_level3" }) == nil)
    Cheat:testAssert("findLocalizedNames invalid 8", Cheat:findLocalizedNames({}, { "buff_alcoholism_level3" }) == nil)

    Cheat:testAssert("findLocalizedNames not found", Cheat:findLocalizedNames({ Cheat.g_localization_soul_database }, { "---fake---" }) == nil)

    local lnames = Cheat:findLocalizedNames({ Cheat.g_localization_soul_database }, { "buff_alcoholism_level3" }) or {}
    Cheat:testAssertEquals("findLocalizedNames found 1", lnames.l1name, "Desire")
    Cheat:testAssertEquals("findLocalizedNames found 2", lnames.l2name, "Desire")


    -- ========================================================================
    -- Mock based testing
    -- ========================================================================

    -- Mock soul database
    local localization_soul_database_backup_ref = Cheat.g_localization_soul_database
    Cheat.g_localization_soul_database = {
        soul_key_1 = { l1name = "LS1", l2name = "LS1" },
        soul_key_2 = { l1name = "LS2" },
        soul_key_3 = { l2name = "LS3" },
    }

    -- Mock item database
    local localization_item_database_backup_ref = Cheat.g_localization_item_database
    Cheat.g_localization_item_database = {
        item_key_1 = { l1name = "Localized Item 1", l2name = "LI1" },
        item_key_2 = { l2name = "Localized Item 2" },
        item_key_3 = { l1name = "Localized Item 3" },
    }


    -- ========================================================================
    -- Cheat:getLocalizedSoulName(buff)
    -- ========================================================================

    -- Test case 1: soul is nil
    Cheat:testAssert("getLocalizedSoulName nil soul", Cheat:getLocalizedSoulName(nil) == nil)

    -- Test case 2: Cheat.g_localization_enabled is false
    Cheat.g_localization_enabled = false
    local mockSoul1 = { GetNameStringId = function () return "soul_name_1" end }
    Cheat:testAssertEquals("getLocalizedSoulName localization disabled", Cheat:getLocalizedSoulName(mockSoul1), "soul_name_1")
    Cheat.g_localization_enabled = true

    -- Test case 3: Cheat.g_localization_enabled is true, database has entry
    local mockSoul2 = { GetNameStringId = function () return "soul_key_1" end }
    Cheat:testAssertEquals("getLocalizedSoulName localization enabled, found l1name", Cheat:getLocalizedSoulName(mockSoul2), "LS1")
    local mockSoul3 = { GetNameStringId = function () return "soul_key_2" end }
    Cheat:testAssertEquals("getLocalizedSoulName localization enabled, found l2name", Cheat:getLocalizedSoulName(mockSoul3), "LS2")

    -- Test case 4: Cheat.g_localization_enabled is true, database does not have entry
    local mockSoul4 = { GetNameStringId = function () return "soul_name_not_found" end }
    Cheat:testAssertEquals("getLocalizedSoulName localization enabled, not found", Cheat:getLocalizedSoulName(mockSoul4), "soul_name_not_found")


    -- ========================================================================
    -- Cheat:getLocalizedItemName(item)
    -- ========================================================================

    -- Test case 1: item is nil
    Cheat:testAssert("getLocalizedItemName nil item", Cheat:getLocalizedItemName(nil) == nil)

    -- Test case 2: Cheat.g_localization_enabled is false
    Cheat.g_localization_enabled = false
    Cheat:testAssertEquals("getLocalizedItemName localization disabled",
        Cheat:getLocalizedItemName({ name = "item_name_1" }), "item_name_1")
    Cheat.g_localization_enabled = true

    -- Test case 3: Cheat.g_localization_enabled is true, database has entry for uiname (l2name priority)
    Cheat:testAssertEquals("getLocalizedItemName localization enabled, found uiname l2name",
        Cheat:getLocalizedItemName({ name = "item_name_2", uiname = "item_key_1" }), "LI1")

    -- Test case 4: Cheat.g_localization_enabled is true, database has entry for name, l1name only in db
    Cheat:testAssertEquals("getLocalizedItemName localization enabled, found name l1name only",
        Cheat:getLocalizedItemName({ name = "item_key_3" }), "Localized Item 3")

    -- Test case 5: Cheat.g_localization_enabled is true, database has entry for name l2name only in db
    Cheat:testAssertEquals("getLocalizedItemName localization enabled, found name l2name only",
        Cheat:getLocalizedItemName({ name = "item_key_2" }), "Localized Item 2")

    -- Test case 6: Cheat.g_localization_enabled is true, database has entry for name, l1name and l2name in db
    Cheat:testAssertEquals("getLocalizedItemName localization enabled, found name l2name",
        Cheat:getLocalizedItemName({ name = "item_key_1" }), "LI1")

    -- Test case 6: Cheat.g_localization_enabled is true, database does not have entry, uses item.name
    Cheat:testAssertEquals("getLocalizedItemName localization enabled, not found",
        Cheat:getLocalizedItemName({ name = "item_name_not_found", uiname = "item_uiname_not_found" }), "item_name_not_found")


    -- ========================================================================
    -- Cheat:getLocalizedEntityName(buff)
    -- ========================================================================

    -- Test case 1: entity is nil
    Cheat:testAssert("getLocalizedEntityName nil entity", Cheat:getLocalizedEntityName(nil) == nil)

    -- Test case 2: entity is userdata (mocking userdata is skipped, assuming table input for test)

    -- Test case 3: entity has soul
    local mockEntity1 = { soul = mockSoul2, uiname = "item_name_entity1", name = "entity_name_1" } -- soul mockSoul2 uses "soul_key_1"
    Cheat:testAssertEquals("getLocalizedEntityName has soul", Cheat:getLocalizedEntityName(mockEntity1), "LS1")

    -- Test case 4: entity has uiname (item) but no soul
    local mockEntity2 = { uiname = "item_key_1", name = "entity_name_2" } -- item mockItem2 uiname "item_key_1"
    Cheat:testAssertEquals("getLocalizedEntityName has uiname", Cheat:getLocalizedEntityName(mockEntity2), "LI1")

    -- Test case 5: entity has neither soul nor uiname, fallback to GetName()
    local mockEntity3 = { name = "entity_name_3", GetName = function () return "Entity Name 3" end }
    Cheat:testAssertEquals("getLocalizedEntityName fallback to GetName", Cheat:getLocalizedEntityName(mockEntity3), "Entity Name 3")


    -- ========================================================================
    -- Cheat:getLocalizedBuffName(buff)
    -- ========================================================================

    -- Test case 1: buff is nil
    Cheat:testAssert("getLocalizedBuffName nil buff", Cheat:getLocalizedBuffName(nil) == nil)

    -- Test case 2: Cheat.g_localization_enabled is false
    Cheat.g_localization_enabled = false
    local mockBuff1 = { buff_name = "buff_name_1", buff_ui_name = "buff_uiname_1" }
    Cheat:testAssertEquals("getLocalizedBuffName localization disabled", Cheat:getLocalizedBuffName(mockBuff1), "buff_name_1")
    Cheat.g_localization_enabled = true -- Re-enable for other tests

    -- Test case 3: Cheat.g_localization_enabled is true, database has entry
    Cheat:testAssertEquals("getLocalizedBuffName localization enabled, found l1name",
        Cheat:getLocalizedBuffName({ buff_name = "buff_name_2", buff_ui_name = "soul_key_1" }), "LS1")

    Cheat:testAssertEquals("getLocalizedBuffName localization enabled, found l2name",
        Cheat:getLocalizedBuffName({ buff_name = "buff_name_3", buff_ui_name = "soul_key_2" }), "LS2")

    Cheat:testAssertEquals("getLocalizedBuffName find l1 with uiname", Cheat:getLocalizedBuffName({ buff_ui_name = "soul_key_1" }), "LS1")
    Cheat:testAssertEquals("getLocalizedBuffName find l2 with uiname", Cheat:getLocalizedBuffName({ buff_ui_name = "soul_key_3" }), "LS3")
    Cheat:testAssertEquals("getLocalizedBuffName find l1 with name", Cheat:getLocalizedBuffName({ buff_name = "soul_key_1" }), "LS1")
    Cheat:testAssertEquals("getLocalizedBuffName find l2 with name", Cheat:getLocalizedBuffName({ buff_name = "soul_key_3" }), "LS3")

    -- Test case 4: Cheat.g_localization_enabled is true, database does not have entry
    local mockBuff4 = { buff_name = "buff_name_not_found", buff_ui_name = "buff_uiname_not_found" }
    Cheat:testAssertEquals("getLocalizedBuffName localization enabled, not found", Cheat:getLocalizedBuffName(mockBuff4), "buff_name_not_found")


    -- ========================================================================
    -- cheat_localization
    -- ========================================================================
    Cheat:testAssertFalse("cheat_localization invalid", Cheat:proxy("cheat_localization", ""))
    Cheat:testAssert("cheat_localization off 1", Cheat:proxy("cheat_localization", "enable:false"))
    Cheat:testAssert("cheat_localization off 2", Cheat.g_localization_enabled == false)
    Cheat:testAssert("cheat_localization on 1", Cheat:proxy("cheat_localization", "enable:true"))
    Cheat:testAssert("cheat_localization on 2", Cheat.g_localization_enabled)

    -- ========================================================================
    -- cleanup
    -- ========================================================================
    Cheat.g_localization_soul_database = localization_soul_database_backup_ref
    Cheat.g_localization_item_database = localization_item_database_backup_ref
    Cheat.g_localization_enabled = true
    Cheat:endTests()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_localization.lua loaded")
