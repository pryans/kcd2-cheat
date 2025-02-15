-- ============================================================================
-- find_perk
-- ============================================================================
function Cheat:find_perk(searchKey, returnAll, findAny)
    local tableName = "perk"
    Database.LoadTable(tableName)
    local tableInfo = Database.GetTableInfo(tableName)
    local rows = tableInfo.LineCount - 1
    local searchKeyUpper = Cheat:toUpper(searchKey)
    local perk_id = nil
    local perk_name = nil
    local perks = {}

    for i = 0, rows do
        local rowInfo = Database.GetTableLine(tableName, i)
        local found = false

        if not Cheat:isBlank(searchKeyUpper) then
            if Cheat:toUpper(rowInfo.perk_id) == searchKeyUpper then
                found = true
            end

            if string.find(Cheat:toUpper(rowInfo.perk_name), searchKeyUpper, 1, true) then
                found = true
            end
        else
            found = true
        end

        if found and (findAny or rowInfo.visibility ~= 0) then
            perk_id = rowInfo.perk_id
            perk_name = rowInfo.perk_name

            if returnAll then
                local perk = {}
                perk.perk_id = perk_id
                perk.perk_name = perk_name
                table.insert(perks, perk)
            end

            Cheat:logInfo("Found perk [%s] with id [%s].", tostring(perk_name), tostring(perk_id))
        end
    end

    if returnAll then
        Cheat:logDebug("Returning [%s] perks.", tostring(#perks))
        return perks
    else
        Cheat:logDebug("Returning perk [%s] with id [%s].", tostring(perk_name), tostring(perk_id))
        return perk_id, perk_name
    end
end

-- ============================================================================
-- cheat_find_perks
-- ============================================================================
Cheat.cheat_find_perks_args = {
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of a the perk's name. Leave empty to list all perks.") end,
    any = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "Whether to not filter out perks you can't select yourself") end
}
Cheat:createCommand("cheat_find_perks", "Cheat:cheat_find_perks(%line)", Cheat.cheat_find_perks_args,
    "Finds all of the perks that match the given token.",
    "Show all perks", "cheat_find_perks token:",
    "Show all perks with 'hunt' in their name", "cheat_find_perks token:hunt")
function Cheat:cheat_find_perks(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_perks_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    local any = Cheat:argsGet(args, "any")
    if not tokenErr then
        Cheat:find_perk(token, nil, any)
        return true
    end
    return false
end

-- ============================================================================
-- cheat_add_perk
-- ============================================================================
Cheat.cheat_add_perk_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The perk ID or all or part of a the perk's name. Uses last match from cheat_find_perks.") end,
    any = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "Whether to not filter out perks you can't select yourself") end
}
Cheat:createCommand("cheat_add_perk", "Cheat:cheat_add_perk(%line)", Cheat.cheat_add_perk_args,
    "Adds the given perk to the player.",
    "Adds the last perk with 'hunt' in its name", "cheat_add_perk id:hunt",
    "Adds the perk juggler perk by ID", "cheat_add_perk id:09a5f2a0-d59f-42c2-a80c-bec9ad7ca168",
    "Adds the perk general_speech perk by full name", "cheat_add_perk id:general_speech")
function Cheat:cheat_add_perk(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_perk_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local any = Cheat:argsGet(args, "any")
    if not idErr then
        local perk_id, perk_name = Cheat:find_perk(id, nil, any)
        if not Cheat:isBlank(perk_id) then
            player.soul:AddPerk(perk_id)
            Cheat:logInfo("Added perk [%s] to player.", tostring(perk_name))
            return true
        else
            Cheat:logError("Perk [%s] not found.", tostring(id))
        end
    end
    return false
end

-- ============================================================================
-- cheat_add_all_perks
-- ============================================================================
Cheat.cheat_add_all_perks_args = {
    exclude = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true then negative, test, and obsolete of perks are excluded.") end,
    any = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "Whether to not filter out perks you can't select yourself") end
}
Cheat:createCommand("cheat_add_all_perks", "Cheat:cheat_add_all_perks(%line)", Cheat.cheat_add_all_perks_args,
    "Adds all perks to the player.",
    "Add all perks", "cheat_add_all_perks exclude:true",
    "Add all perks including negative, test, and obsolete perks", "cheat_add_all_perks exclude:false")
function Cheat:cheat_add_all_perks(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_all_perks_args)
    local exclude, excludeErr = Cheat:argsGet(args, "exclude")
    local any = Cheat:argsGet(args, "any")
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

        local perks = Cheat:find_perk(nil, true, any)
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

-- ============================================================================
-- cheat_remove_perk
-- ============================================================================
Cheat.cheat_remove_perk_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The perk ID or all or part of a the perk's name. Uses last match from cheat_find_perks.") end,
    any = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "Whether to not filter out perks you can't select yourself") end
}
Cheat:createCommand("cheat_remove_perk", "Cheat:cheat_remove_perk(%line)", Cheat.cheat_remove_perk_args,
    "Removes the given perk from the player.",
    "Removes the last perk with 'hunt' in its name", "cheat_remove_perk id:hunt",
    "Removes the perk juggler by ID", "cheat_remove_perk id:09a5f2a0-d59f-42c2-a80c-bec9ad7ca168",
    "Removes the perk golden_tongue by full name.", "cheat_remove_perk id:golden_tongue")
function Cheat:cheat_remove_perk(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_remove_perk_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local any = Cheat:argsGet(args, "any")
    if not idErr then
        local perk_id, perk_name = Cheat:find_perk(id, nil, any)
        if not Cheat:isBlank(perk_id) then
            player.soul:RemovePerk(perk_id)
            Cheat:logInfo("Removed perk [%s] from player.", tostring(perk_name))
            return true
        else
            Cheat:logError("Perk [%s] not found.", tostring(id))
        end
    end
    return false
end

-- ============================================================================
-- cheat_remove_all_perks
-- ============================================================================
Cheat:createCommand("cheat_remove_all_perks", "Cheat:cheat_remove_all_perks()", nil,
    "Removes all perks from the player.",
    "Remove all perks", "cheat_remove_all_perks")
function Cheat:cheat_remove_all_perks(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_remove_perk_args)
    local any = Cheat:argsGet(args, "any")
    local perks = Cheat:find_perk(nil, true, any)
    if perks then
        for i, perk in pairs(perks) do
            player.soul:RemovePerk(perk.perk_id)
            Cheat:logInfo("Removed perk [%s] from player.", tostring(perk.perk_name))
        end
        Cheat:logInfo("All perks removed.")
    else
        Cheat:logError("No perks found in perk database.")
    end
    return true
end

-- ============================================================================
-- cheat_reset_perks
-- ============================================================================
Cheat:createCommand("cheat_reset_perks", "Cheat:cheat_reset_perks()", nil,
    "Resets all visible Perks.",
    "Reset all Perks", "cheat_reset_perks")
function Cheat:cheat_reset_perks()
    Cheat:cheat_add_buff("id:c8b0d038-a503-44cc-85a5-7f753a09eb6e")
    Cheat:logInfo("All perks have been reset.")
    return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_perks.lua loaded")
