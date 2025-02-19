-- ============================================================================
-- helpers
-- ============================================================================
Cheat.g_perk_database = nil
Cheat.g_perk_database_search_fields = { "perk_id", "perk_lname", "perk_name" }

function Cheat:initPerkDatabase()
    Cheat:logDebug("initPerkDatabase: Started...")

    Cheat.g_perk_database = {}
    for _, perk in pairs(Cheat:loadDatabase("perk")) do
        perk.perk_lname = Cheat:getLocalizedPerkName(perk)
        table.insert(Cheat.g_perk_database, perk)
    end

    if Cheat.g_perk_database then
        Cheat:logDebug("Done loading perk database (%s)", tostring(#Cheat.g_perk_database))
    else
        Cheat:logError("Failed to load perk database.")
    end

    Cheat:logDebug("initPerkDatabase: Done")
end

function Cheat:findPerks(searchOperation)
    return Cheat:findRows(Cheat.g_perk_database, searchOperation, Cheat.g_perk_database_search_fields)
end

function Cheat:findPerk(searchOperation)
    return Cheat:findRow(Cheat.g_perk_database, searchOperation, Cheat.g_perk_database_search_fields)
end

function Cheat:getPerkDisplayText(perk)
    if not perk then
        return "nil"
    end

    local data = {}
    for k, v in pairs(perk) do
        if k ~= "perk_id" and k ~= "perk_lname" and k ~= "perk_name" then
            if not Cheat:isBlank(v) then
                data[k] = v
            end
        end
    end

    local name = Cheat:getFormattedNames(perk.perk_name, perk.perk_lname)
    return string.format("name=%s id=%s %s",
        name,
        tostring(perk.perk_id),
        Cheat:serializeTable(data))
end

-- bugged via hasPerkId
function Cheat:hasPerkName(perkName)
    local perk = Cheat:findPerk({ exact = true, searchKey = perkName })
    if perk then
        return Cheat:hasPerkId(perk.perk_id)
    else
        return false
    end
end

-- bugged. only works on 97 or 865 perks.
-- the rest will always report false even when player has it.
function Cheat:hasPerkId(perkId)
    return player.soul:HasPerk(perkId, false);
end

-- bugged via hasPerkId
function Cheat:getPerks()
    local perks = {}
    for _, perk in pairs(Cheat:findPerks()) do
        if Cheat:hasPerkId(perk.perk_id) then
            table.insert(perks, perk)
        end
    end
    return perks
end

-- bugged via hasPerkId
function Cheat:getPerkCount()
    return #Cheat:getPerks()
end

-- bugged via hasPerkId
function Cheat:addPerk(idOrName)
    local perk = Cheat:findPerk({ exact = true, searchKey = idOrName })
    if perk then
        player.soul:AddPerk(perk.perk_id) -- doesn't return anything
        return Cheat:hasPerkId(perk.perk_id)
    end
    return false
end

function Cheat:addAllPerks()
    for _, perk in pairs(Cheat:findPerks()) do
        player.soul:AddPerk(perk.perk_id)
    end
end

-- bugged via hasPerkId
function Cheat:removePerk(idOrName)
    local perk = Cheat:findPerk({ exact = true, searchKey = idOrName })
    if perk then
        player.soul:RemovePerk(perk.perk_id) -- doesn't return anything
        return not Cheat:hasPerkId(perk.perk_id)
    end
    return false
end

function Cheat:removeAllPerks()
    for _, perk in pairs(Cheat:findPerks()) do
        player.soul:RemovePerk(perk.perk_id)
    end
    return true
end

function Cheat:setupPerkTest()
    -- pick 2 of the 97 perks that Cheat:hasPerkId works on
    return Cheat:removeAllPerks()
        and Cheat:addPerk("Escape artist")
        and Cheat:addPerk("Red Herring")
        and Cheat:getPerkCount() >= 2 -- there are unremovable perks
        and Cheat:hasPerkName("Escape artist")
        and Cheat:hasPerkName("Red Herring")
end

-- bugged via hasPerkId
function Cheat:logPerkCVS()
    for _, perk in pairs(Cheat:findPerks()) do
        local owned = Cheat:hasPerkId(perk.perk_id)
        Cheat:logDebug("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s", tostring(owned), tostring(perk.perk_lname or ""), tostring(perk.autolearnable or ""), tostring(perk.visibility or ""), tostring(perk.icon_id or ""), tostring(perk.parent_id or ""), tostring(perk.metaperk_id or ""), tostring(perk.ui_priority or ""), tostring(perk.perk_name or ""), tostring(perk.perk_id or ""), tostring(perk.exclude_in_game_mode or ""), tostring(perk.level or ""), tostring(perk.perk_ui_desc or ""), tostring(perk.stat_selector or ""), tostring(perk.perk_ui_name or ""), tostring(perk.perk_ui_lore_desc or ""), tostring(perk.skill_selector or ""))
    end
end

-- ============================================================================
-- cheat_find_perks
-- ============================================================================
Cheat:createCommand("cheat_find_perks", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    },
    "Displays all perks that match the given query.\n" ..
    "$4NOTE: This command shows all perks in the database.\n" ..
    "$4Some perks may be part of quests or other game\n" ..
    "$4mechanics or not intented for the player to use.",
    "Show all perks", "cheat_find_perks",
    "Shows all perks with 'Hands' in their names", "cheat_find_perks any:Hands",
    "Shows the perk named 'Viper II'", "cheat_find_perks exact:Viper II")
function Cheat:cheat_find_perks(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    local perks = Cheat:findPerks(searchOperation)
    if not perks or #perks == 0 then
        Cheat:logError("No perks found matching [%s].", Cheat:serializeTable(searchOperation))
        return false, nil
    end

    for _, perk in ipairs(perks) do
        Cheat:logInfo("Perk: %s", Cheat:getPerkDisplayText(perk))
    end
    return true, perks
end

-- ============================================================================
-- cheat_add_perk
-- ============================================================================
Cheat:createCommand("cheat_add_perk", {
        i_know_what_i_am_doing = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "Enables this command.") end,
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    },
    "Adds matching perks to the player.\n" ..
    "$4NOTE: It isn't possible to know exact what perks the player has or were added/removed.\n" ..
    "$4This command will just log the perks it tried to add.\n" ..
    "$4Some perks may be part of quests or other game mechanics or not intented for the player to use.",
    "Adds the perk 'Deft hands II' by ID", "cheat_add_perk exact:b4b0c345-e8c3-4b9e-890a-e77549596131",
    "Adds the perk 'Viper' perk by full name", "cheat_add_perk exact:Viper",
    "Adds all perks with 'Hands' in their names", "cheat_add_perk any:Hands")
function Cheat:cheat_add_perk(c)
    if not c.i_know_what_i_am_doing then
        Cheat:logError("IQ test failed.")
        return false
    end

    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_add_perk ?")
        return false
    end

    local perks = Cheat:findPerks(searchOperation)
    if not perks or #perks == 0 then
        Cheat:logWarn("No perk found matching [%s].", Cheat:serializeTable(searchOperation))
        return false
    end

    for _, perk in pairs(perks) do
        Cheat:addPerk(perk.perk_id)
        Cheat:logInfo("Added Perk: %s", Cheat:getPerkDisplayText(perk))
    end

    Cheat:logInfo("Added perks matching [%s].", Cheat:serializeTable(searchOperation))
    return true
end

-- ============================================================================
-- cheat_remove_perk
-- ============================================================================
Cheat:createCommand("cheat_remove_perk", {
        i_know_what_i_am_doing = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "Enables this command.") end,
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end
    },
    "Removes matching perks from the player.\n" ..
    "$4NOTE: It isn't possible to know exact what perks the player has or were added/removed.\n" ..
    "$4This command will just log the perks it tried to remove.\n" ..
    "$4Some perks may be part of quests or other game mechanics or not intented for the player to use.",
    "Removes the perk 'Deft hands II' by ID", "cheat_remove_perk exact:b4b0c345-e8c3-4b9e-890a-e77549596131",
    "Removes the perk 'Viper' perk by full name", "cheat_remove_perk exact:Viper",
    "Removes all perks with 'Hands' in their names", "cheat_remove_perk any:Hands")
function Cheat:cheat_remove_perk(c)
    if not c.i_know_what_i_am_doing then
        Cheat:logError("IQ test failed.")
        return false
    end

    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_remove_perk ?")
        return false
    end

    local perks = Cheat:findPerks(searchOperation)
    if not perks or #perks == 0 then
        Cheat:logWarn("No perks found matching [%s].", Cheat:serializeTable(searchOperation))
        return false
    end

    for _, perk in pairs(perks) do
        Cheat:removePerk(perk.perk_id)
        Cheat:logInfo("Removed Perk: %s", Cheat:getPerkDisplayText(perk))
    end

    Cheat:logInfo("Removed perks matching [%s].", Cheat:serializeTable(searchOperation))
    return true
end

-- ============================================================================
-- cheat_remove_all_perks
-- ============================================================================
Cheat:createCommand("cheat_remove_all_perks", {
        i_know_what_i_am_doing = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "Enables this command.") end,
    },
    "Removes all possible perks from the player.\n" ..
    "$4This commands 1st calls cheat_reset_perks to remove visible perks and refund perk points.\n" ..
    "$4Then we attempt to remove each perk from the perk database from the player.\n" ..
    "$4There is no way to know what perks were removed.\n" ..
    "$4Some perks may be part of quests or other game mechanics or not intented for the player to use.",
    "Remove all perks", "cheat_remove_all_perks")
function Cheat:cheat_remove_all_perks(c)
    if not c.i_know_what_i_am_doing then
        Cheat:logError("IQ test failed.")
        return false
    end

    -- try and refund everything theen brute force remove the rest
    if Cheat:cheat_reset_perks() and Cheat:removeAllPerks() then
        Cheat:logInfo("All possible perks removed.")
        return true
    else
        Cheat:logError("Failed to remove all perks.")
    end

    return false
end

-- ============================================================================
-- cheat_add_all_perks
-- ============================================================================
--[[
Cheat:createCommand("cheat_add_all_perks", {
        exclude = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true then negative, test, and obsolete of perks are excluded.") end,
        any = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "Whether to not filter out perks you can't select yourself") end
    },
    "Adds all perks to the player.",
    "Add all perks", "cheat_add_all_perks exclude:true",
    "Add all perks including negative, test, and obsolete perks", "cheat_add_all_perks exclude:false")
function Cheat:cheat_add_all_perks(c)
    local gender = player.soul:GetGender()

    if gender ~= 2 then
        local excludes = {}
        -- Should be excluded anyway because of negative impacts to gameplay
        excludes["80825cd9-7d7b-440f-aa57-75807e83aed9"] = true  -- Always drunk
        excludes["fa299718-b1eb-4664-8769-25f82fb95de9"] = true  -- LimitSprint
        excludes["12c75fff-d00d-4cb0-8c27-4a8e4838dc14"] = true  -- test_dummy_perk
        excludes["519db599-76d4-4703-8c31-486fae00e473"] = true  -- test_recipe
        excludes["a51bfbf1-f60b-40d2-ae3e-830127523862"] = true  -- test_subperk
        excludes["e97c3ca4-04bc-4dfc-bd80-8002280c7c14"] = true  -- test_metaperk
        excludes["775dcec-5dcd-48e7-810d-1fc97e4e203e"] = true   -- Combo srt 04 cut mace OBSOLETE
        excludes["b74821b-9312-4e76-9c22-d2a38ba9dd06"] = true   -- Combo srt 05 diagonalstrike mace OBSOLETE"
        excludes["b89f2c7-e5f3-415f-aec7-32d7655a94ba"] = true   -- Combo srt 03 pommelstrike axe OBSOLETE"
        excludes["9ec2cf8-6e0b-4468-a7d1-7e538b676467"] = true   -- Combo srt 05 diagonalstrike axe OBSOLETE"
        excludes["974b67f-0785-43ce-b51f-9779ecf42fb1"] = true   -- Combo srt 03 pommelstrike shs OBSOLETE"
        excludes["574c37d-08af-4576-bcfd-29ccfa79e5ba"] = true   -- Combo srt 03 pommelstrike mace OBSOLETE"
        excludes["8d9d23f-e293-4980-abd4-a3046b929771"] = true   -- Combo srt 04 cut OBSOLETE"
        excludes["3f6c0eb-1b03-46ad-89f5-7eda9e4ab548"] = true   -- Combo srt 04 cut axe OBSOLETE"

        excludes["80825cd9-7d7b-440f-aa57-75807e83aed9"] = false -- Always drunk
        excludes["fa299718-b1eb-4664-8769-25f82fb95de9"] = false -- LimitSprint
        excludes["12c75fff-d00d-4cb0-8c27-4a8e4838dc14"] = false -- test_dummy_perk
        excludes["519db599-76d4-4703-8c31-486fae00e473"] = false -- test_recipe
        excludes["a51bfbf1-f60b-40d2-ae3e-830127523862"] = false -- test_subperk
        excludes["e97c3ca4-04bc-4dfc-bd80-8002280c7c14"] = false -- test_metaperk
        excludes["775dcec-5dcd-48e7-810d-1fc97e4e203e"] = false  -- Combo srt 04 cut mace OBSOLETE
        excludes["b74821b-9312-4e76-9c22-d2a38ba9dd06"] = false  -- Combo srt 05 diagonalstrike mace OBSOLETE"
        excludes["b89f2c7-e5f3-415f-aec7-32d7655a94ba"] = false  -- Combo srt 03 pommelstrike axe OBSOLETE"
        excludes["9ec2cf8-6e0b-4468-a7d1-7e538b676467"] = false  -- Combo srt 05 diagonalstrike axe OBSOLETE"
        excludes["974b67f-0785-43ce-b51f-9779ecf42fb1"] = false  -- Combo srt 03 pommelstrike shs OBSOLETE"
        excludes["574c37d-08af-4576-bcfd-29ccfa79e5ba"] = false  -- Combo srt 03 pommelstrike mace OBSOLETE"
        excludes["8d9d23f-e293-4980-abd4-a3046b929771"] = false  -- Combo srt 04 cut OBSOLETE"
        excludes["3f6c0eb-1b03-46ad-89f5-7eda9e4ab548"] = false  -- Combo srt 04 cut axe OBSOLETE"

        -- charlitoti
        -- here is an extension of the excludes perk to exclude aswell the hardcore negative perks:
        excludes["37433f7b-9c2e-48e2-bce7-af8d34b403c8"] = true -- Nightmares
        excludes["5ef31fc4-244e-40ac-b088-03e5730ff5c1"] = true -- Claustrophobia
        excludes["6402905d-6cfa-4666-80bf-2a70b0b82bd1"] = true -- Haemophilia
        excludes["aa725966-98eb-4db2-8cd5-ad3d43b13f14"] = true -- Numbskull
        excludes["b9aa28f1-ccbb-4c0c-9718-c218f01d749b"] = true -- Consumption
        excludes["b59a2f39-faf4-4a1d-88c2-c059dadc6abb"] = true -- Shakes
        excludes["ce2fe289-4c26-45c0-803b-32627d288765"] = true -- Tapeworm
        excludes["d2105041-120b-4c06-8e61-1948a5fdf65d"] = true -- Somnambulant
        excludes["fbedb426-410c-4614-952a-1086b6f6554f"] = true -- Brittle Bones
        excludes["4d51ba41-2c10-4281-9308-fcfed1fe0276"] = true -- Woman in a Man's World

        -- WileCoyote68
        -- some more Hardcore related Perks
        excludes["d6916a36-f36e-4f7a-947b-d54ba84726f7"] = true -- Ascetic
        excludes["9a5842cb-6dc1-4602-a585-aa99bfc9eb16"] = true -- Insomniac
        excludes["305dd4f2-6923-42cb-a14d-2af07dff2863"] = true -- Revenant
        excludes["f1f439cd-7636-4060-8a8b-233153f7f685"] = true -- Thickblooded

        -- Tied to quests, progress or training
        excludes["636f75c0-8f7e-4942-8928-4e1a84d79298"] = true -- Bailman
        excludes["a66149e3-71a7-440a-b287-60c23efbe6a9"] = true -- Cuman Killer
        excludes["7c804de3-ed00-4cd3-aa99-4220a66c7036"] = true -- Dodger
        excludes["47709bf7-3bd8-493f-aca3-05b005f166d8"] = true -- Feint
        excludes["0a3d5815-b962-4198-b003-1eb0a7459903"] = true -- Hunting Permit
        excludes["d2da2217-d46d-4cdb-accb-4ff860a3d83e"] = true -- Perfect Block
        excludes["084dd7fd-daee-4041-bae1-c58a0c132292"] = true -- Relieved
        excludes["0dd2c3df-9f61-4743-b5ca-8c3ac39fb57d"] = true -- Resistance

        local perks = Cheat:findPerk(nil, true, any)
        if perks then
            for i, perk in pairs(perks) do
                if not exclude or not excludes[perk.perk_id] then
                    player.soul:AddPerk(perk.perk_id)
                    Cheat:logInfo("Added perk [%s] to player.", tostring(perk.perk_name))
                else
                    Cheat:logInfo("Excluded perk [%s].", tostring(perk.perk_name))
                end
            end
            Cheat:logInfo("All perks added.")
        else
            Cheat:logError("No perks found in perk database.")
        end
    else
        Cheat:logError("You can't use this command when you're playing Thereza!")
    end
    return true
end

]]

-- ============================================================================
-- cheat_reset_perks
-- ============================================================================
Cheat:createCommand("cheat_reset_perks", nil,
    "Added a buff that will removed all perks visible on the player's perk sheet.\n" ..
    "This will refund perk points, up to the max you're earned.")
function Cheat:cheat_reset_perks()
    if Cheat:proxy("cheat_add_buff", "exact:c8b0d038-a503-44cc-85a5-7f753a09eb6e") then
        Cheat:logInfo("All perks have been reset.")
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_add_all_codex_perks
-- ============================================================================
Cheat:createCommand("cheat_add_all_codex_perks", nil, "Adds all perks related to the codex.")
function Cheat:cheat_add_all_codex_perks()
    player.soul:AddAllCodexPerks()
    Cheat:logInfo("All codex perks added.")
    return true
end

-- ============================================================================
-- test_core_perks
-- ============================================================================
function Cheat:test_core_perks()
    Cheat:beginTests("test_core_perks")

    local result, perks, perk, count = nil, nil, nil, nil

    -- findPerks all
    perks = Cheat:findPerks(nil)
    Cheat:testAssert("findPerks all perks", #perks > 400)

    -- findPerk not found
    perk = Cheat:findPerk({ exact = true, searchKey = "this perk doesn't exist" })
    Cheat:testAssert("findPerk fakeperk", perk == nil)

    -- findPerk found
    perk = Cheat:findPerk({ exact = true, searchKey = "headbutt" })
    Cheat:testAssert("findPerk headbutt 1", perk ~= nil)
    if perk then
        Cheat:testAssertEquals("findPerk headbutt 2", perk.perk_id, "29904729-cd69-498a-bdfc-0fb1c69aed44")
        Cheat:testAssertEquals("findPerk headbutt 3", perk.perk_lname, "Headbutt")
    end

    -- cheat_find_perks exact
    Cheat:testAssert("cheat_find_perks exact 1", Cheat:proxy("cheat_find_perks", "exact:Heavy Duty"))

    -- cheat_find_perks any
    result, perks = Cheat:proxy("cheat_find_perks", "any:head")
    Cheat:testAssert("cheat_find_perks any 1", result and perks and #perks >= 3)

    -- cheat_add_perk invalid
    Cheat:testAssertFalse("cheat_add_perk invalid 1", Cheat:proxy("cheat_add_perk", nil))

    -- cheat_add_perk valid
    Cheat:testAssert("cheat_add_perk valid 1", Cheat:removeAllPerks())
    Cheat:testAssert("cheat_add_perk valid 2", Cheat:hasPerkName("Escape artist") == false)
    Cheat:testAssert("cheat_add_perk valid 3", Cheat:proxy("cheat_add_perk", "exact:Escape artist i_know_what_i_am_doing:true"))
    Cheat:testAssert("cheat_add_perk valid 4", Cheat:hasPerkName("Escape artist"))

    -- cheat_remove_perk invalid
    Cheat:testAssertFalse("cheat_remove_perk invalid 1", Cheat:proxy("cheat_remove_perk", nil))

    -- cheat_remove_perk valid
    Cheat:testAssert("cheat_remove_perk 1", Cheat:setupPerkTest())
    Cheat:testAssert("cheat_remove_perk 2", Cheat:proxy("cheat_remove_perk", "exact:Escape artist i_know_what_i_am_doing:true"))
    Cheat:testAssert("cheat_remove_perk 3", Cheat:hasPerkName("Escape artist") == false)

    -- cheat_remove_all_perks
    Cheat:testAssert("cheat_remove_all_perks 1", Cheat:setupPerkTest())
    count = Cheat:getPerkCount()
    Cheat:testAssert("cheat_remove_all_perks 2", Cheat:proxy("cheat_remove_all_perks", "i_know_what_i_am_doing:true"))
    Cheat:testAssert("cheat_remove_all_perks 3", Cheat:getPerkCount() == count - 2)

    -- cheat_reset_perks
    Cheat:testAssert("cheat_reset_perks 1", Cheat:setupPerkTest())
    count = Cheat:getPerkCount()
    Cheat:testAssert("cheat_reset_perks 2", Cheat:proxy("cheat_reset_perks", nil))
    Cheat:testAssert("cheat_reset_perks 3", Cheat:getPerkCount() == count - 1) -- only removes the vis=2 perk from setupPerkTest

    -- cheat_add_all_codex_perks
    Cheat:testAssert("cheat_add_all_codex_perks 1", Cheat:removeAllPerks())
    Cheat:testAssert("cheat_add_all_codex_perks 2", Cheat:proxy("cheat_add_all_codex_perks", nil))
    Cheat:testAssertEquals("cheat_add_all_codex_perks 3", Cheat:getPerkCount(), 0) -- none of the added entries show in the count

    Cheat:endTests()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_perks.lua loaded")
