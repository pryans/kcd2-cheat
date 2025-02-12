--[[
		<buff_class buff_class_id="0" buff_class_name="Testing Stat Buff" />
		<buff_class buff_class_id="1" buff_class_name="System Buff" />
		<buff_class buff_class_id="2" buff_class_name="Weapon Skill Buff" />
		<buff_class buff_class_id="3" buff_class_name="Testing Combat Buff" />
		<buff_class buff_class_id="4" buff_class_name="Perk Buff" />
		<buff_class buff_class_id="5" buff_class_name="Injury" />
		<buff_class buff_class_id="6" buff_class_name="Heal" />
		<buff_class buff_class_id="7" buff_class_name="Poison" />
		<buff_class buff_class_id="8" buff_class_name="Perception" />
		<buff_class buff_class_id="9" buff_class_name="Overeat" />
		<buff_class buff_class_id="10" buff_class_name="Alcohol" />
		<buff_class buff_class_id="12" buff_class_name="Item Buff" />
		<buff_class buff_class_id="13" buff_class_name="Potion" />
		<buff_class buff_class_id="14" buff_class_name="Food Poison" />
		<buff_class buff_class_id="15" buff_class_name="Script System" />
		<buff_class buff_class_id="16" buff_class_name="Unconsciousness" />
		<buff_class buff_class_id="17" buff_class_name="Hangover" />
		<buff_class buff_class_id="18" buff_class_name="Satisfaction" />
		<buff_class buff_class_id="19" buff_class_name="Perfume" />
		<buff_class buff_class_id="20" buff_class_name="Punishment" />
		<buff_class buff_class_id="21" buff_class_name="ForcedDrunkenness" />

    <buff_ui_visibility buff_ui_visibility_id="0" buff_ui_visibility_name="None" />
		<buff_ui_visibility buff_ui_visibility_id="1" buff_ui_visibility_name="HUD" />
		<buff_ui_visibility buff_ui_visibility_id="2" buff_ui_visibility_name="Inventory" />
		<buff_ui_visibility buff_ui_visibility_id="3" buff_ui_visibility_name="HUDandInventory" />
		<buff_ui_visibility buff_ui_visibility_id="4" buff_ui_visibility_name="OnLocationEntered" />

    <buff_ui_type buff_ui_type_id="1" buff_ui_type_name="Buff" />
		<buff_ui_type buff_ui_type_id="2" buff_ui_type_name="Debuff" />
		<buff_ui_type buff_ui_type_id="3" buff_ui_type_name="InjuryDebuff" />
		<buff_ui_type buff_ui_type_id="4" buff_ui_type_name="Perk" />

    <buff_lifetime buff_lifetime_id="0" buff_lifetime_name="ShortTerm" />
		<buff_lifetime buff_lifetime_id="1" buff_lifetime_name="LongTerm" />

    <buff_family buff_family_id="1" buff_family_name="AesopPotion" />
		<buff_family buff_family_id="2" buff_family_name="Antidote" />
		<buff_family buff_family_id="3" buff_family_name="AquaVitalisPotion" />
		<buff_family buff_family_id="4" buff_family_name="ArtemisiaPotion" />
		<buff_family buff_family_id="5" buff_family_name="BanePotion" />
		<buff_family buff_family_id="6" buff_family_name="BardPotion" />
		<buff_family buff_family_id="7" buff_family_name="BowmansBrew" />
		<buff_family buff_family_id="8" buff_family_name="BucksBloodPotion" />
		<buff_family buff_family_id="9" buff_family_name="ChamomileDecoction" />
		<buff_family buff_family_id="10" buff_family_name="CockerelPotion" />
		<buff_family buff_family_id="11" buff_family_name="DollmakerPotion" />
		<buff_family buff_family_id="12" buff_family_name="Embrocation" />
		<buff_family buff_family_id="13" buff_family_name="HairODogPotion" />
		<buff_family buff_family_id="14" buff_family_name="LullabayPotion" />
		<buff_family buff_family_id="15" buff_family_name="MarigoldDecoction" />
		<buff_family buff_family_id="16" buff_family_name="NighthawkPotion" />
		<buff_family buff_family_id="17" buff_family_name="PadfootPotion" />
		<buff_family buff_family_id="18" buff_family_name="PainkillerPotion" />
		<buff_family buff_family_id="19" buff_family_name="SavegamePotion" />
		<buff_family buff_family_id="20" buff_family_name="FoodAgiExpMultiplier" />
		<buff_family buff_family_id="21" buff_family_name="FoodStrExpMultiplier" />
		<buff_family buff_family_id="22" buff_family_name="FoodVitExpMultiplier" />
		<buff_family buff_family_id="23" buff_family_name="AlcoholCraving" />
		<buff_family buff_family_id="24" buff_family_name="FoodPoisoning" />

    <buff_exclusivity _comment="allows multiple instances of the same buff on one target" buff_exclusivity_id="0" buff_exclusivity_name="NoExclusivity" />
		<buff_exclusivity _comment="more instances of the same buff (the same id) are not allowed on one target" buff_exclusivity_id="1" buff_exclusivity_name="IdExclusive" />
		<buff_exclusivity _comment="more buffs with the same modifier are not allowed on one target" buff_exclusivity_id="2" buff_exclusivity_name="ModExclusive" />
		<buff_exclusivity _comment="more buffs belonging to the same class are not allowed" buff_exclusivity_id="3" buff_exclusivity_name="ClassExclusive" />
		<buff_exclusivity _comment="more buffs are not allowed on one target" buff_exclusivity_id="4" buff_exclusivity_name="TargetExclusive" />
]]
-- ============================================================================
-- find_buff
-- ============================================================================
function Cheat:find_buffs(searchKey)
    local tableName = "buff"
    Database.LoadTable(tableName)
    local tableInfo = Database.GetTableInfo(tableName)
    local rows = tableInfo.LineCount - 1
    local search_key_upper = nil
    local buffs = {}

    if not Cheat:isBlank(searchKey) then
        search_key_upper = Cheat:toUpper(searchKey)
    end

    for i = 0, rows do
        local buff_row = Database.GetTableLine(tableName, i)
        local buff_id_upper = Cheat:toUpper(buff_row.buff_id)
        local buff_name_upper = Cheat:toUpper(buff_row.buff_name)
        local found = false

        if search_key_upper then
            found = (buff_id_upper == search_key_upper) or (string.find(buff_name_upper, search_key_upper, 1, true) ~= nil)
        else
            found = true
        end

        if found then
            local buff = {}
            buff.buff_id = tostring(buff_row.buff_id)
            buff.buff_name = tostring(buff_row.buff_name)
            buff.buff_data = {}

            for k, v in pairs(buff_row) do
                if k and v and k ~= "buff_id" and k ~= "buff_name" and not Cheat:isBlank(v) then
                    buff.buff_data[k] = v
                end
            end

            table.insert(buffs, buff)
        end
    end

    Cheat:logDebug("Returning [%s] buffs for search token [%s].", tostring(#buffs), tostring(searchKey))
    return buffs
end

function Cheat:find_buff(searchKey)
    local buffs = Cheat:find_buffs(searchKey)
    local buff_id = nil
    local buff_name = nil

    if buffs and #buffs > 0 then
        buff_id = buffs[#buffs].buff_id
        buff_name = buffs[#buffs].buff_name
        Cheat:logDebug("Returning buff [%s] with id [%s].", buff_name, buff_id)
    end

    return buff_id, buff_name
end

-- ============================================================================
-- cheat_find_buffs
-- ============================================================================
Cheat.cheat_find_buffs_args = {
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of a the buff's name. Leave empty to list all buffs.") end
}
Cheat:createCommand("cheat_find_buffs", "Cheat:cheat_find_buffs(%line)", Cheat.cheat_find_buffs_args,
    "Finds all of the buffs that match the given token.",
    "Show all buffs", "cheat_find_buffs token:",
    "Show all buffs with 'heal' in their name", "cheat_find_buffs token:heal")
function Cheat:cheat_find_buffs(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_buffs_args, "cheat_find_buffs")
    local token, tokenErr = Cheat:argsGet(args, "token")
    if tokenErr then
        return false
    end

    local buffs = Cheat:find_buffs(token)
    if #buffs == 0 then
        return false
    end

    for _, buff in ipairs(buffs) do
        Cheat:logInfo("Buff: name=%s id=%s %s", buff.buff_id, buff.buff_name, Cheat:serializeTable(buff.buff_data))
    end
    return true
end

-- ============================================================================
-- cheat_add_buff
-- ============================================================================
Cheat.cheat_add_buff_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The buff ID or all or part of a the buff's name. Uses last match from cheat_find_buffs.") end
}
Cheat:createCommand("cheat_add_buff", "Cheat:cheat_add_buff(%line)", Cheat.cheat_add_buff_args,
    "Adds the given buff to the player.",
    "Adds the last buff with 'heal' in its name", "cheat_add_buff id:heal",
    "Adds the buff poor_hearing buff by ID", "cheat_add_buff id:29336a21-dd76-447b-a4f0-94dd6b9db466",
    "Adds the buff healthEatSleep_instant buff by full name", "cheat_add_buff id:healthEatSleep_instant")
function Cheat:cheat_add_buff(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_buff_args, "cheat_add_buff")
    local id, idErr = Cheat:argsGet(args, "id")
    if idErr then
        return false
    end

    local buff_id, buff_name = Cheat:find_buff(id)
    if Cheat:isBlank(buff_id) then
        Cheat:logError("buff [%s] not found.", tostring(id))
        return false
    end

    player.soul:AddBuff(buff_id)
    Cheat:logInfo("Added buff [%s] to player.", tostring(buff_name))
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

Cheat.cheat_add_potion_buff_args = {
    id = function (args, name, showHelp)
        local helpText = Cheat:createHelpForLookupTable(Cheat.potion_buffs, "The potion ID or all/part of potion name. Supported potions:\n")
        return Cheat:argsGetRequired(args, name, showHelp, helpText)
    end,
}
Cheat:createCommand("cheat_add_potion_buff", "Cheat:cheat_add_potion_buff(%line)", Cheat.cheat_add_potion_buff_args,
    "Adds a potion buff to the player.")
function Cheat:cheat_add_potion_buff(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_potion_buff_args, "cheat_add_potion_buff")
    local id, idErr = Cheat:argsGet(args, "id")
    if idErr then
        return false
    end

    for k, v in pairs(Cheat.potion_buffs) do
        if k == id or string.find(v.name, id) then
            player.soul:AddBuff(v.id)
            Cheat:logInfo("Added potion [%s] to player.", tostring(v.name))
            return true
        end
    end

    Cheat:logError("No potion id or name matches [%s].", id)
    return false
end

-- ============================================================================
-- cheat_remove_buff
-- ============================================================================
Cheat.cheat_remove_buff_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The buff ID or all or part of a the buff's name. Uses last match from cheat_find_buffs.") end
}
Cheat:createCommand("cheat_remove_buff", "Cheat:cheat_remove_buff(%line)", Cheat.cheat_remove_buff_args,
    "Removes the given buff from the player.",
    "Removes the last buff with 'heal' in its name", "cheat_remove_buff id:heal",
    "Removes the buff poor_hearing buff by ID", "cheat_remove_buff id:29336a21-dd76-447b-a4f0-94dd6b9db466",
    "Removes the buff healthEatSleep_instant buff by full name", "cheat_remove_buff id:healthEatSleep_instant")
function Cheat:cheat_remove_buff(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_remove_buff_args, "cheat_remove_buff")
    local id, idErr = Cheat:argsGet(args, "id")
    if idErr then
        return false
    end

    local buff_id, buff_name = Cheat:find_buff(id)
    if Cheat:isBlank(buff_id) then
        Cheat:logError("Buff [%s] not found.", tostring(id))
        return false
    end

    if player.soul:RemoveAllBuffsByGuid(buff_id) <= 0 then
        Cheat:logError("Player does not have buff [%s]", buff_name)
        return false
    end

    Cheat:logInfo("Removed buff [%s] from player.", buff_name)
    return true
end

-- ============================================================================
-- cheat_remove_all_buffs
-- ============================================================================
Cheat:createCommand("cheat_remove_all_buffs", "Cheat:cheat_remove_all_buffs()", nil,
    "Removes all buffs from the player.",
    "Remove all buffs", "cheat_remove_all_buffs")
function Cheat:cheat_remove_all_buffs()
    local buffs = Cheat:find_buffs()
    local buffs_removed = 0;
    for _, buff in ipairs(buffs) do
        if player.soul:RemoveAllBuffsByGuid(buff.buff_id) > 0 then
            buffs_removed = buffs_removed + 1
            Cheat:logInfo("Removed buff [%s] from player.", tostring(buff.buff_name))
        end
    end
    Cheat:logInfo("Removed [%s] buffs from player.", tostring(buffs_removed))
    return buffs_removed > 0
end

-- ============================================================================
-- cheat_add_buff_heal
-- ============================================================================
Cheat:createCommand("cheat_add_buff_heal", "Cheat:cheat_add_buff_heal()", nil,
    "Stop bleeding, removes injuries, and restores all health, stamina, hunger, and exhaust.",
    "Heal bleeding and injuries", "cheat_add_buff_heal")
function Cheat:cheat_add_buff_heal()
    if Cheat:cheat_add_buff("id:46683e3b-e261-412f-b402-99ee17dda62a") then
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
Cheat:createCommand("cheat_add_buff_immortal", "Cheat:cheat_add_buff_immortal()", nil,
    "Adds permanent buff to make the player immortal plus fast healing (health 100/s).\n$3Use cheat_remove_buff_immortal to remove this.",
    "Add immortality", "cheat_add_buff_immortal")
function Cheat:cheat_add_buff_immortal()
    Cheat:cheat_add_buff_heal()
    if Cheat:cheat_add_buff("id:6cf0aa39-e09c-42fa-bf67-10f2d03991b7") then
        Cheat:logInfo("Immortality buffs added.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_remove_buff_immortal
-- ============================================================================
Cheat:createCommand("cheat_remove_buff_immortal", "Cheat:cheat_remove_buff_immortal()", nil,
    "Removes the buffs making the player immortal.",
    "Remove immortality", "cheat_remove_buff_immortal")
function Cheat:cheat_remove_buff_immortal()
    if Cheat:cheat_remove_buff("id:6cf0aa39-e09c-42fa-bf67-10f2d03991b7") then
        Cheat:logInfo("Immortality buffs removed.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_add_buff_invisible
-- ============================================================================
Cheat:createCommand("cheat_add_buff_invisible", "Cheat:cheat_add_buff_invisible()", nil,
    "Adds permanent invisible buff to player.\n$8Set visibility, conspicuousness and noise to zero.\n$3Use cheat_remove_buff_invisible to remove this.",
    "Add invisible buff to player", "cheat_add_buff_invisible")
function Cheat:cheat_add_buff_invisible()
    if Cheat:cheat_add_buff("id:a218b534-b2a5-11ed-afa1-0242ac120002") then
        Cheat:logInfo("Invisibility buff added.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_remove_buff_invisible
-- ============================================================================
Cheat:createCommand("cheat_remove_buff_invisible", "Cheat:cheat_remove_buff_invisible()", nil,
    "Removes invisible buff from player.",
    "Remove invisible buff from player", "cheat_remove_buff_invisible")
function Cheat:cheat_remove_buff_invisible()
    if Cheat:cheat_remove_buff("id:a218b534-b2a5-11ed-afa1-0242ac120002") then
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

    Cheat:testAssert("cheat_find_buffs", Cheat:cheat_find_buffs("token:potion_aqua_vitalis_4"))

    Cheat:testAssert("cheat_add_buff", Cheat:cheat_add_buff("id:potion_aqua_vitalis_4"))
    Cheat:testAssert("cheat_remove_all_buffs", Cheat:cheat_remove_all_buffs())

    Cheat:testAssert("cheat_add_buff", Cheat:cheat_add_buff("id:potion_aqua_vitalis_4"))
    Cheat:testAssert("cheat_remove_buff", Cheat:cheat_remove_buff("id:potion_aqua_vitalis_4"))

    Cheat:testAssert("cheat_add_buff_invisible", Cheat:cheat_add_buff_invisible())
    Cheat:testAssert("cheat_remove_buff_invisible", Cheat:cheat_remove_buff_invisible())

    Cheat:testAssert("cheat_add_buff_immortal", Cheat:cheat_add_buff_immortal())
    Cheat:testAssert("cheat_remove_buff_immortal", Cheat:cheat_remove_buff_immortal())

    Cheat:testAssert("cheat_add_buff_heal", Cheat:cheat_add_buff_heal())

    Cheat:testAssert("cheat_add_potion_buff 00", Cheat:cheat_add_potion_buff("id:00"))
    Cheat:testAssert("cheat_add_potion_buff 01", Cheat:cheat_add_potion_buff("id:01"))
    Cheat:testAssert("cheat_add_potion_buff 02", Cheat:cheat_add_potion_buff("id:02"))
    Cheat:testAssert("cheat_add_potion_buff 03", Cheat:cheat_add_potion_buff("id:03"))
    Cheat:testAssert("cheat_add_potion_buff 04", Cheat:cheat_add_potion_buff("id:04"))
    Cheat:testAssert("cheat_add_potion_buff 05", Cheat:cheat_add_potion_buff("id:05"))
    Cheat:testAssert("cheat_add_potion_buff 06", Cheat:cheat_add_potion_buff("id:06"))
    Cheat:testAssert("cheat_add_potion_buff 07", Cheat:cheat_add_potion_buff("id:07"))
    Cheat:testAssert("cheat_add_potion_buff 08", Cheat:cheat_add_potion_buff("id:08"))
    Cheat:testAssert("cheat_add_potion_buff 09", Cheat:cheat_add_potion_buff("id:09"))
    Cheat:testAssert("cheat_add_potion_buff 10", Cheat:cheat_add_potion_buff("id:10"))
    Cheat:testAssert("cheat_remove_all_buffs", Cheat:cheat_remove_all_buffs())

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_buffs.lua loaded")
