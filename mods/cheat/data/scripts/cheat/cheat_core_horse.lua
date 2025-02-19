--[[

-- take ownership of a horse
player.player:SetPlayerHorse(Cheat:getTargetedEntity().id)

-- userdata:
-- GetHorseId() == entity.id
local horseId = player.player:GetHorseId()
local horse = System.GetEntity(horseId)

-- userdata:
-- GetPlayerHorse() == entity.this.id == entity.soul.__ThisWUID
local horseWuid = player.player:GetPlayerHorse()
local horse = XGenAIModule.GetEntityByWUID(horseWuid)

horse.actor:RequestItemExchange(player.id)
player.player:HorseInspect(horse.id)
player.human:Mount(horse.id)
player.human:ForceDismount()

]]

-- ============================================================================
-- helpers
-- ============================================================================
function Cheat:getPlayerHorse()
    local horseWuid = player.player:GetPlayerHorse()

    if horseWuid == __null then
        return nil
    end

    return XGenAIModule.GetEntityByWUID(horseWuid)
end

--[[
function Cheat:findHorses(searchKey)
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
]]

function Cheat:logHorseInfo(horse)
    if not horse then
        Cheat:logError("horse is nil")
        return
    end

    local horseName = Cheat:getFormattedNames(Cheat:getEntityName(horse), Cheat:getLocalizedEntityName(horse))
    local playerHorse = Cheat:getPlayerHorse()
    local isPlayerHorse = playerHorse and playerHorse.id == horse.id
    local info = {
        agility = horse.soul:GetStatLevel("agility"),
        courage = horse.soul:GetStatLevel("courage"),
        hearing = horse.soul:GetStatLevel("hearing"),
        strength = horse.soul:GetStatLevel("strength"),
        vision = horse.soul:GetStatLevel("vision"),
        vitality = horse.soul:GetStatLevel("vitality"),
        health = horse.soul:GetState("health"),
        stamina = horse.soul:GetState("stamina"),
        exhaust = horse.soul:GetState("exhaust"),
        hunger = horse.soul:GetState("hunger"),
        walk = tostring(horse.AIMovementAbility.walkSpeed),
        run = tostring(horse.AIMovementAbility.runSpeed),
        sprint = tostring(horse.AIMovementAbility.sprintSpeed),
        price = horse.soul:GetDerivedStat("cnp") * 10
    }

    local ownedFunc = function () if isPlayerHorse then return "(Owned) " else return "" end end
    Cheat:logInfo("== %s Information %s==", horseName, ownedFunc())
    Cheat:logTwoColumnTable(info)
end

-- ============================================================================
-- cheat_find_horses
-- ============================================================================
--[[
Cheat:createCommand("cheat_find_horses", {
        token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of a horse's name. Leave blank to list all horses.") end
    },
    "Find and display stats of horses.",
    "List all horses", "cheat_find_horses token:",
    "Find all horses in MRH stable", "cheat_find_horses token:mrh")
function Cheat:cheat_find_horses(c)
    Cheat:findHorses(c.token)
end
]]

-- ============================================================================
-- cheat_horse_own
-- ============================================================================
Cheat:createCommand("cheat_horse_own", nil,
    "Makes the currently targeted horse the player's horse.",
    "Takes ownership of the horse", "cheat_horse_own")
function Cheat:cheat_horse_own(c)
    if Cheat:NotPlayerCharacter() then
        return
    end

    local target = Cheat:getTargetedEntity()

    if not target or target.class ~= "Horse" then
        Cheat:logError("You must target a horse.")
        return false
    end

    player.player:SetPlayerHorse(target.id)
    Cheat:logInfo("Set player horse to [%s].", Cheat:getLocalizedEntityName(target))
    Cheat:logHorseInfo(target)
    return true
end

-- ============================================================================
-- cheat_horse_teleport
-- ============================================================================
Cheat:createCommand("cheat_horse_teleport", nil,
    "Teleports your horse to you.",
    "Teleport your horse to you", "cheat_horse_teleport")
function Cheat:cheat_horse_teleport()
    local horse = Cheat:getPlayerHorse()
    if not horse then
        Cheat:logError("You don't own a horse.")
        return false
    end
    horse:SetWorldPos(Cheat:createSpawnVectorFromVector(true, player:GetWorldPos(), 1.5, 0.2));
    Cheat:logInfo("Teleported your horse to you.")
    return true
end

-- ============================================================================
-- cheat_horse_wash
-- ============================================================================
Cheat:createCommand("cheat_horse_wash", nil,
    "Washes targeted or owned horse.",
    "Wash the horse", "cheat_horse_wash")
function Cheat:cheat_horse_wash()
    local target = Cheat:getTargetedEntity()
    if not target or target.class ~= "Horse" then
        target = Cheat:getPlayerHorse()
    end

    if not target then
        Cheat:logWarn("Nothing to wash, target a horse or get your own.")
        return false
    end

    target.actor:WashDirtAndBlood(1, 1)
    Cheat:logInfo("Horse %s all clean!", Cheat:getLocalizedEntityName(target))
    return true
end

-- ============================================================================
-- cheat_horse_info
-- ============================================================================
Cheat:createCommand("cheat_horse_info", nil,
    "Shows information about targeted or owned horse.",
    "Show horse info", "cheat_horse_info")
function Cheat:cheat_horse_info()
    local target = Cheat:getTargetedEntity()
    if not target or target.class ~= "Horse" then
        target = Cheat:getPlayerHorse()
    end

    if not target then
        Cheat:logWarn("Nothing to know, target a horse or get your own.")
        return false
    end

    Cheat:logHorseInfo(target)
    return true
end

-- ============================================================================
-- cheat_horse_new
-- ============================================================================
Cheat:createCommand("cheat_horse_new", nil,
    "Create a horse for you if you don't already have one.",
    "A new horse", "cheat_horse_new")
function Cheat:cheat_horse_new()
    if Cheat:getPlayerHorse() then
        Cheat:logError("You already have a horse.")
        return
    end

    local horse = Cheat:proxy("cheat_spawn", "id:6 radius:2 count:1")[1]
    player.player:SetPlayerHorse(horse.id)
    Cheat:logInfo("You've got a brand new horse.", Cheat:getLocalizedEntityName(horse))
    return true
end

-- ============================================================================
-- cheat_horse_release
-- ============================================================================
Cheat:createCommand("cheat_horse_release", nil,
    "Releases your currently owned horse.",
    "Release horse", "cheat_horse_release")
function Cheat:cheat_horse_release()
    if not Cheat:getPlayerHorse() then
        Cheat:logError("You don't own a horse.")
        return
    end

    player.player:SetPlayerHorse(__null)
    Cheat:logInfo("Your horse has been released.")
    return true
end

-- ============================================================================
-- cheat_horse_inventory
-- ============================================================================
Cheat:createCommand("cheat_horse_inventory", nil,
    "Opens inventory of targeted or owned horse.",
    "Open horse inventory", "cheat_horse_inventory")
function Cheat:cheat_horse_inventory()
    local target = Cheat:getTargetedEntity()
    if not target or target.class ~= "Horse" then
        target = Cheat:getPlayerHorse()
    end

    if not target then
        Cheat:logWarn("Target a horse or get your own.")
        return false
    end

    target.actor:RequestItemExchange(player.id)
    Cheat:logInfo("Trading with horse started.")
    return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_horses.lua loaded")
