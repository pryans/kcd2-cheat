-- ============================================================================
-- helpers
-- ============================================================================
Cheat.g_buff_database = nil
Cheat.g_buff_database_search_fields = { "buff_id", "buff_name_localized", "buff_name" }

function Cheat:getLocalizedBuffName(buff)
    local names = Cheat:getLocalizedNames(Cheat.g_localization_soul_database, buff.buff_ui_name)
    local name = buff.buff_name
    if names and names.field1 then
        name = names.field1
    elseif names and names.field2 then
        name = names.field2
    end
    return name
end

function Cheat:initBuffDatabase()
    Cheat:logDebug("initBuffDatabase: Started...")

    Cheat.g_buff_database = {}
    for _, buff in pairs(Cheat:loadDatabase("buff")) do
        if not Cheat:startsWith(buff.buff_name, "perk_") then
            buff.buff_name_localized = Cheat:getLocalizedBuffName(buff)
            table.insert(Cheat.g_buff_database, buff)
        end
    end

    if Cheat.g_buff_database then
        Cheat:logDebug("Done loading buff database (%s)", tostring(#Cheat.g_buff_database))
    else
        Cheat:logError("Failed to load buff database.")
    end

    Cheat:logDebug("initBuffDatabase: Done")
end

function Cheat:findBuffs(searchOperation)
    return Cheat:findRows(Cheat.g_buff_database, searchOperation, Cheat.g_buff_database_search_fields)
end

function Cheat:findBuff(searchOperation)
    return Cheat:findRow(Cheat.g_buff_database, searchOperation, Cheat.g_buff_database_search_fields)
end

function Cheat:getBuffDisplayText(buff)
    if not buff then
        return "nil"
    end
    -- Create a console friendly version of the item.
    local data = {}
    for k, v in pairs(buff) do
        if k ~= "buff_id" and k ~= "buff_name_localized" then
            if not Cheat:isBlank(v) then
                data[k] = v
            end
        end
    end
    local name = Cheat:getLocalizedBuffName(buff)
    return string.format("name=%s id=%s %s", tostring(buff.buff_name_localized), tostring(buff.buff_id), Cheat:serializeTable(data))
end

-- ============================================================================
-- cheat_find_buffs
-- ============================================================================
Cheat:createCommand("cheat_find_buffs", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    },
    "Find, and logs, all matching buffs.",
    "Show all buffs", "cheat_find_buffs",
    "Show all buffs with 'heal' in their name", "cheat_find_buffs any:heal")
function Cheat:cheat_find_buffs(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    local buffs = Cheat:findBuffs(searchOperation)
    if not buffs or #buffs == 0 then
        Cheat:logError("No buffs found matching [%s].", Cheat:serializeTable(searchOperation))
        return false
    end

    for _, buff in ipairs(buffs) do
        Cheat:logInfo("Buff: %s", Cheat:getBuffDisplayText(buff))
    end
    return true
end

-- ============================================================================
-- cheat_add_buff
-- ============================================================================
Cheat:createCommand("cheat_add_buff", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    },
    "Adds matching buffs to the player.",
    "Adds all bufss with 'heal' in their name", "cheat_add_buff any:heal",
    "Adds the buff poor_hearing buff by ID", "cheat_add_buff exact:29336a21-dd76-447b-a4f0-94dd6b9db466",
    "Adds the buff healthEatSleep_instant buff by full name", "cheat_add_buff exact:healthEatSleep_instant")
function Cheat:cheat_add_buff(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_add_buff ?")
        return false
    end

    local buffs = Cheat:findBuffs(searchOperation)
    if not buffs or #buffs == 0 then
        Cheat:logWarn("No buff found matching [%s].", Cheat:serializeTable(searchOperation))
        return false
    end

    local buffsAdded = 0
    for _, buff in pairs(buffs) do
        if player.soul:AddBuff(buff.buff_id) then
            Cheat:logInfo("Buff Added: %s", Cheat:getBuffDisplayText(buff))
            buffsAdded = buffsAdded + 1
        else
            Cheat:logWarn("Add Buff Failed: %s", Cheat:getBuffDisplayText(buff))
        end
    end

    Cheat:logInfo("Added [%s] buffs to player.", tostring(buffsAdded))
    return true
end

-- ============================================================================
-- cheat_add_potion_buff
-- ============================================================================
Cheat.potion_buffs = {}
Cheat.potion_buffs["00"] = { name = "Saviour Schnapps", id = "24c8edfc-a310-4f98-8adc-37de87514c38" }
Cheat.potion_buffs["01"] = { name = "Aqua Vitalis", id = "7f89c355-d3c6-4f61-9774-3a3898372ab7" }
Cheat.potion_buffs["02"] = { name = "Embrocation", id = "b1075629-edcd-4be0-bbbc-28c63a7f61be" }
Cheat.potion_buffs["03"] = { name = "Bowman's Brew", id = "71afe0a0-fa45-42f1-a07d-acd3d02bfc0f" }
Cheat.potion_buffs["04"] = { name = "Padfoot", id = "c14174d4-a381-4129-a935-62bb031901d3" }
Cheat.potion_buffs["05"] = { name = "Nighthawk", id = "7f16793c-4d42-4d63-a912-d93d51b92289" }
Cheat.potion_buffs["06"] = { name = "Bard", id = "ea76c3af-bfb1-4e89-9157-d82f028b8572" }
Cheat.potion_buffs["07"] = { name = "Aesop", id = "1ff0e4a0-c09c-40be-b31e-fcb98b8ae0df" }
Cheat.potion_buffs["08"] = { name = "Chamomile Brew", id = "34adf873-92b4-4166-b85b-a0fcaacb760c" }
Cheat.potion_buffs["09"] = { name = "Marigold Deoction", id = "b6bd097c-f092-469d-984a-e673f4cdd03c" }
Cheat.potion_buffs["10"] = { name = "Hair o' the Dog", id = "cf87b636-408a-403e-b0ac-87eb323aabd4" }
local helpText = Cheat:createHelpForLookupTable(Cheat.potion_buffs, "The potion ID or all/part of potion name. Supported potions:\n")
Cheat:createCommand("cheat_add_potion_buff", {
        id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, helpText) end,
    },
    "Adds a potion buff to the player.")
function Cheat:cheat_add_potion_buff(c)
    for k, v in pairs(Cheat.potion_buffs) do
        if k == c.id or string.find(v.name, c.id) then
            player.soul:AddBuff(v.id)
            Cheat:logInfo("Added Potion [%s] to player.", tostring(v.name))
            return true
        end
    end

    Cheat:logError("No potion id or name matches [%s].", c.id)
    return false
end

-- ============================================================================
-- cheat_remove_buff
-- ============================================================================
Cheat:createCommand("cheat_remove_buff", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end
    },
    "Removes matching buffs from the player.",
    "Removes all buffs with 'heal' in the name", "cheat_remove_buff any:heal",
    "Removes the buff poor_hearing buff by ID", "cheat_remove_buff exact:29336a21-dd76-447b-a4f0-94dd6b9db466",
    "Removes the buff healthEatSleep_instant buff by full name", "cheat_remove_buff exact:healthEatSleep_instant")
function Cheat:cheat_remove_buff(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_remove_buff ?")
        return false
    end

    local buffs = Cheat:findBuffs(searchOperation)
    if not buffs or #buffs == 0 then
        Cheat:logWarn("No buffs found matching [%s].", Cheat:serializeTable(searchOperation))
        return false
    end

    local buffsRemoved = 0
    for _, buff in pairs(buffs) do
        if player.soul:RemoveAllBuffsByGuid(buff.buff_id) > 0 then
            Cheat:logInfo("Buff Removed: %s", Cheat:getBuffDisplayText(buff))
            buffsRemoved = buffsRemoved + 1
        else
            Cheat:logWarn("Remove Buff Failed: %s", Cheat:getBuffDisplayText(buff))
        end
    end

    Cheat:logInfo("Removed [%s] buffs from player.", tostring(buffsRemoved))
    return true
end

-- ============================================================================
-- cheat_remove_all_buffs
-- ============================================================================
Cheat:createCommand("cheat_remove_all_buffs", nil,
    "Removes all buffs from the player.",
    "Remove all buffs", "cheat_remove_all_buffs")
function Cheat:cheat_remove_all_buffs()
    local buffs = Cheat:findBuffs()
    local buffs_removed = 0;
    for _, buff in ipairs(buffs) do
        if player.soul:RemoveAllBuffsByGuid(buff.buff_id) > 0 then
            buffs_removed = buffs_removed + 1
            Cheat:logInfo("Removed Buff: %s", tostring(buff.buff_name))
        end
    end
    Cheat:logInfo("Removed [%s] buffs from player.", tostring(buffs_removed))
    return buffs_removed > 0
end

-- ============================================================================
-- cheat_add_buff_heal
-- ============================================================================
Cheat:createCommand("cheat_add_buff_heal", nil,
    "Stop bleeding, removes injuries, and restores all health, stamina, hunger, and exhaust.",
    "Heal bleeding and injuries", "cheat_add_buff_heal")
function Cheat:cheat_add_buff_heal()
    if Cheat:proxy("cheat_add_buff", "exact:46683e3b-e261-412f-b402-99ee17dda62a") then
        Cheat:logInfo("Injuries Removed.")

        for i = 1, 6, 1 do player.soul:HealBleeding(1, i) end
        Cheat:logInfo("Bleeding Stopped.")

        player.soul:SetState("health", 1000)
        player.soul:SetState("stamina", 1000)
        player.soul:SetState("hunger", 100)
        player.soul:SetState("exhaust", 100)
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_add_buff_immortal
-- ============================================================================
Cheat:createCommand("cheat_add_buff_immortal", nil,
    "Adds permanent buff to make the player immortal plus fast healing (health 100/s).\n$3Use cheat_remove_buff_immortal to remove this.",
    "Add immortality", "cheat_add_buff_immortal")
function Cheat:cheat_add_buff_immortal()
    Cheat:proxy("cheat_add_buff_heal")
    if Cheat:proxy("cheat_add_buff", "exact:6cf0aa39-e09c-42fa-bf67-10f2d03991b7") then
        Cheat:logInfo("Immortality buffs added.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_remove_buff_immortal
-- ============================================================================
Cheat:createCommand("cheat_remove_buff_immortal", nil,
    "Removes the buffs making the player immortal.",
    "Remove immortality", "cheat_remove_buff_immortal")
function Cheat:cheat_remove_buff_immortal()
    if Cheat:proxy("cheat_remove_buff", "exact:6cf0aa39-e09c-42fa-bf67-10f2d03991b7") then
        Cheat:logInfo("Immortality buffs removed.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_add_buff_invisible
-- ============================================================================
Cheat:createCommand("cheat_add_buff_invisible", nil,
    "Adds permanent invisible buff to player.\n$8Set visibility, conspicuousness and noise to zero.\n$3Use cheat_remove_buff_invisible to remove this.",
    "Add invisible buff to player", "cheat_add_buff_invisible")
function Cheat:cheat_add_buff_invisible()
    if Cheat:proxy("cheat_add_buff", "exact:a218b534-b2a5-11ed-afa1-0242ac120002") then
        Cheat:logInfo("Invisibility buff added.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_remove_buff_invisible
-- ============================================================================
Cheat:createCommand("cheat_remove_buff_invisible", nil,
    "Removes invisible buff from player.",
    "Remove invisible buff from player", "cheat_remove_buff_invisible")
function Cheat:cheat_remove_buff_invisible()
    if Cheat:proxy("cheat_remove_buff", "exact:a218b534-b2a5-11ed-afa1-0242ac120002") then
        Cheat:logInfo("Invisibility buff removed.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- test_core_buffs
-- ============================================================================
function Cheat:test_core_buffs()
    Cheat:beginTest("test_core_buffs")

    Cheat:testAssert("cheat_find_buffs", Cheat:proxy("cheat_find_buffs", "exact:potion_aqua_vitalis_4"))
    Cheat:testAssert("cheat_find_buffs", Cheat:proxy("cheat_find_buffs", "any:potion_aqua_vitalis_4"))

    Cheat:testAssert("cheat_add_buff", Cheat:proxy("cheat_add_buff", "any:potion_aqua_vitalis_4"))
    Cheat:testAssert("cheat_remove_all_buffs", Cheat:proxy("cheat_remove_all_buffs"))

    Cheat:testAssert("cheat_add_buff", Cheat:proxy("cheat_add_buff", "exact:potion_aqua_vitalis_4"))
    Cheat:testAssert("cheat_remove_all_buffs", Cheat:proxy("cheat_remove_all_buffs"))

    Cheat:testAssert("cheat_add_buff", Cheat:proxy("cheat_add_buff", "any:potion_aqua_vitalis_4"))
    Cheat:testAssert("cheat_remove_buff", Cheat:proxy("cheat_remove_buff", "any:potion_aqua_vitalis_4"))

    Cheat:testAssert("cheat_add_buff", Cheat:proxy("cheat_add_buff", "any:potion_aqua_vitalis_4"))
    Cheat:testAssert("cheat_remove_buff", Cheat:proxy("cheat_remove_buff", "exact:potion_aqua_vitalis_4"))

    Cheat:testAssert("cheat_add_buff_invisible", Cheat:proxy("cheat_add_buff_invisible"))
    Cheat:testAssert("cheat_remove_buff_invisible", Cheat:proxy("cheat_remove_buff_invisible"))

    Cheat:testAssert("cheat_add_buff_immortal", Cheat:proxy("cheat_add_buff_immortal"))
    Cheat:testAssert("cheat_remove_buff_immortal", Cheat:proxy("cheat_remove_buff_immortal"))

    Cheat:testAssert("cheat_add_buff_heal", Cheat:proxy("cheat_add_buff_heal"))

    Cheat:testAssert("cheat_add_potion_buff 00", Cheat:proxy("cheat_add_potion_buff", "id:00"))
    Cheat:testAssert("cheat_add_potion_buff 01", Cheat:proxy("cheat_add_potion_buff", "id:01"))
    Cheat:testAssert("cheat_add_potion_buff 02", Cheat:proxy("cheat_add_potion_buff", "id:02"))
    Cheat:testAssert("cheat_add_potion_buff 03", Cheat:proxy("cheat_add_potion_buff", "id:03"))
    Cheat:testAssert("cheat_add_potion_buff 04", Cheat:proxy("cheat_add_potion_buff", "id:04"))
    Cheat:testAssert("cheat_add_potion_buff 05", Cheat:proxy("cheat_add_potion_buff", "id:05"))
    Cheat:testAssert("cheat_add_potion_buff 06", Cheat:proxy("cheat_add_potion_buff", "id:06"))
    Cheat:testAssert("cheat_add_potion_buff 07", Cheat:proxy("cheat_add_potion_buff", "id:07"))
    Cheat:testAssert("cheat_add_potion_buff 08", Cheat:proxy("cheat_add_potion_buff", "id:08"))
    Cheat:testAssert("cheat_add_potion_buff 09", Cheat:proxy("cheat_add_potion_buff", "id:09"))
    Cheat:testAssert("cheat_add_potion_buff 10", Cheat:proxy("cheat_add_potion_buff", "id:10"))
    Cheat:testAssert("cheat_remove_all_buffs", Cheat:proxy("cheat_remove_all_buffs"))

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_buffs.lua loaded")
