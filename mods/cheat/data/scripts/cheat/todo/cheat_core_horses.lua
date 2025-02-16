--[[


local horse = player.player:GetPlayerHorse()
if horse == __null then return end

horse = assert(XGenAIModule.GetEntityByWUID(horse), "Cannot locate player's horse entity")

player.human:ForceDismount()
horse:SetWorldPos(System.GetEntityByName('horseCutsceneTeleport'):GetWorldPos())



#System.GetEntityByName('q_conquest_playerHorse'):SetPos({x = 2375.35, y = 2756.05, z = 88.89} );
#local h = System.GetEntityByName('Horse1'); if h then h:SetWorldPos({x=0,y=0,z=0}) end;
#local h = System.GetEntitiesByClass('Horse')[1]; if h then h:SetWorldPos({x=0,y=0,z=0}) end;

<soul_class hunting_coef="0.25" soul_class_courage="0" soul_class_id="7" soul_class_name="horse" />
<soul_class hunting_coef="0.25" soul_class_courage="0" soul_class_id="8" soul_class_name="war horse" />

// soul__tsem.xml
<soul brain_id="7f6a8b2d-9b2b-4500-9f7b-fc8f3a135029" digestion_multiplier="0"
	factionName="trosecko_settlements_semin_commonFolk_tradersAndCraftmans_horsetrader"
	initial_clothing_dirt="0" skald_character_name="char_KUN_SEDIVKA"
	social_class_id="97"
	soul_archetype_id="3"
	soul_class_id="7"
	soul_id="4e5abeff-f19e-0eab-0921-a24611c4ad8f"
	soul_name="tsem_sedivka"
	soul_vip_class_id="0"
	xp_multiplier="0" />

EntityCommon.MakeSpawnable(InventoryDummyHorse)
Horsetraders



enum_horseHandler_operation = {
	['PlayerHorseAdded'] = 3;
	['PlayerHorseRemoved'] = 4;
	['ResetValidHorsesCount'] = 5;
	['Unknown'] = 0;
	['ValidHorseAdded'] = 1;
	['ValidHorseRemoved'] = 2;
};

enum_HorseCommands = {
	['Autopilot_Dash'] = 31;
	['Autopilot_Run'] = 29;
	['Autopilot_Sprint'] = 30;
	['Autopilot_Walk'] = 28;
	['ClearPlayerHorse'] = 3;
	['ComeToMe'] = 1;
	['CreateFormation'] = 4;
	['CustomBehavior'] = 19;
	['Dash'] = 27;
	['Eat'] = 17;
	['GoInFormation'] = 16;
	['GoToHome'] = 14;
	['GoToPath'] = 15;
	['GoToPoint'] = 11;
	['GoToPointExact'] = 12;
	['GoToWaypoints'] = 13;
	['Halt'] = 0;
	['OnDismount'] = 23;
	['OnLead'] = 18;
	['OnMount'] = 22;
	['Reserve'] = 20;
	['ReserveRelease'] = 21;
	['RideHome'] = 8;
	['RideInFormation'] = 10;
	['RidePath'] = 9;
	['RidePoint'] = 5;
	['RidePointExact'] = 6;
	['RideWaypoints'] = 7;
	['Run'] = 25;
	['SetPlayerHorse'] = 2;
	['Sprint'] = 26;
	['Walk'] = 24;
};

]]









-- ============================================================================
-- find_horse
-- ============================================================================
function Cheat:find_horse(searchKey)
    local searchKeyUpper = Cheat:toUpper(searchKey)
    local horsesData = {}
    local horse_name = nil

    for stableCode, stableData in pairs(Horsetraders.__data__.stables) do
        for _, horseData in pairs(stableData.horses) do
            table.insert(horsesData, horseData)
        end
    end

    for _, horseData in ipairs(horsesData) do
        local entity = System.GetEntityByName(horseData.name)
        if entity then
            local agi = tostring(entity.soul:GetStatLevel("agi"))
            local cou = tostring(entity.soul:GetStatLevel("cou"))
            local str = tostring(entity.soul:GetStatLevel("str"))
            local vit = tostring(entity.soul:GetStatLevel("vit"))
            local total = tostring(tonumber(agi) + tonumber(cou) + tonumber(str) + tonumber(vit))

            local found = false
            if not Cheat:isBlank(searchKeyUpper) then
                if string.find(Cheat:toUpper(horseData.name), searchKeyUpper, 1, true) then
                    found = true
                end
            else
                found = true
            end

            if found then
                horse_name = horseData.name
                Cheat:logInfo("Found horse [%s] agi[%s] cou[%s] str[%s] vit[%s] total[%s].", tostring(horse_name), agi, cou, str,
                    vit, total)
            end
        else
            Cheat:logError("Horse [%s] not found (entity couldn't be loaded/found, load the level?).", tostring(horseData.name))
        end
    end
    Cheat:logDebug("Returning horse [%s].", tostring(horse_name))
    return horse_name
end

-- ============================================================================
-- show_horse_stats
-- ============================================================================
function Cheat:show_horse_stats()
    local entity = XGenAIModule.GetEntityByWUID(player.player:GetPlayerHorse());
    if entity then
        -- none of these can be changed at runtime it seems
        local agi = tostring(entity.soul:GetStatLevel("agi"))        -- confirmed 17
        local cou = tostring(entity.soul:GetStatLevel("cou"))        -- confirmed 17.85
        local str = tostring(entity.soul:GetStatLevel("str"))        -- confirmed 17
        local vit = tostring(entity.soul:GetStatLevel("vit"))        -- confirmed 17
        local health = tostring(entity.soul:GetState("health"))      -- confirmed 100 (same as entity.actor:GetHealth())
        local stamina = tostring(entity.soul:GetState("stamina"))    -- confirmed 450
        local capacity = tostring(entity.soul:GetDerivedStat("cap")) --confirmed 268
        local walk = tostring(entity.AIMovementAbility.walkSpeed)
        local run = tostring(entity.AIMovementAbility.runSpeed)
        local sprint = tostring(entity.AIMovementAbility.sprintSpeed)
        Cheat:logInfo("horse agi[%s] cou[%s] str[%s] vit[%s] health[%s] stamina[%s] cap[%s] walk[%s] run[%s] sprint[%s]", agi,
            cou, str, vit, health, stamina, capacity, walk, run, sprint)
    end
end

-- ============================================================================
-- cheat_find_horses
-- ============================================================================
Cheat.cheat_find_horses_args = {
    token = function (args, name, showHelp)
        return Cheat:argsGetOptional(args, name, nil, showHelp,
            "All or part of a horse's name. Leave blank to list all horses.")
    end
}

Cheat:createCommandLegacy("cheat_find_horses", "Cheat:cheat_find_horses(%line)", Cheat.cheat_find_horses_args,
    "Find and display stats of horses.",
    "List all horses", "cheat_find_horses token:",
    "Find all horses in MRH stable", "cheat_find_horses token:mrh")
function Cheat:cheat_find_horses(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_horses_args)
    local token, tokenErr = Cheat:argsGet(args, "token")

    if not tokenErr then
        Cheat:find_horse(token)
    end
end

-- ============================================================================
-- cheat_set_horse
-- ============================================================================
Cheat.cheat_set_horse_args = {
    id = function (args, name, showHelp)
        return Cheat:argsGetRequired(args, name, showHelp,
            "The UUID or all or part of a horse's name (last match is used).")
    end
}

Cheat:createCommandLegacy("cheat_set_horse", "Cheat:cheat_set_horse(%line)", Cheat.cheat_set_horse_args,
    "Sets the player's horse. Use command cheat_find_horses to display a list of horse UUIDs.",
    "Set horse by name part", "cheat_set_horse id:mrh_05",
    "Remove horse", "cheat_set_horse id:nil")
function Cheat:cheat_set_horse(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_horse_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local gender = player.soul:GetGender()
    if not idErr and gender ~= 2 then
        if id == "nil" then
            player.player:SetPlayerHorse(nil)
            Cheat:logInfo("Removed player horse.")
            return true
        end
        local horseName = Cheat:find_horse(id)
        local horse = System.GetEntityByName(horseName)
        player.player:SetPlayerHorse(horse.id)
        Cheat:logInfo("Set player horse to [%s].", tostring(horseName))
        Cheat:show_horse_stats()
        return true
    else
        Cheat:logError("Thereza can't own a horse!")
    end
    return false
end

-- ============================================================================
-- cheat_teleport_horse
-- ============================================================================
Cheat:createCommandLegacy("cheat_teleport_horse", "Cheat:cheat_teleport_horse()", nil,
    "Teleports your horse to you.",
    "Teleport your horse to you", "cheat_teleport_horse")
function Cheat:cheat_teleport_horse()
    local horse = XGenAIModule.GetEntityByWUID(player.player:GetPlayerHorse());
    local playerPosition = player:GetWorldPos();
    local gender = player.soul:GetGender()
    if horse and gender ~= 2 then
        horse:SetWorldPos({ x = playerPosition.x - 1, y = playerPosition.y - 1, z = playerPosition.z });
        Cheat:logInfo("Teleported your horse to you.")
    elseif gender == 2 then
        Cheat:logError("Theresa doesn't own a horse!")
    else
        Cheat:logError("You don't have a horse.")
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_horses.lua loaded")
