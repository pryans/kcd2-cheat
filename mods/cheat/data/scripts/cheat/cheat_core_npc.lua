-- GetEntities
-- GetEntitiesByClass
-- GetEntitiesInSphere
-- GetEntitiesInSphere(self:GetPos(), 50);

--"Localization/english_xml/text_ui_soul_def.xml"
--Cheat:soulNames = CryAction.LoadXML("Localization/english_xml/text_ui_soul_def.xml","Localization/english_xml/text_ui_soul.xml");
-- Cheat:logInfo("soul name localization table loaded [%s]", tostring(Cheat.soulNames))
--Cheat:print_methods(Cheat.soulNames)
--Cheat:logInfo("--")

-- System.GetEntitiesInSphere(player:GetPos(), range)

-- cheat_eval return #System.GetEntitiesByClass("Hare")

--[[
[DEBUG] inventory:
[DEBUG]   __this: userdata: 000001D4D879B618
[DEBUG] actor:
[DEBUG]   __this: userdata: 000000000007FFA4
[DEBUG] id: userdata: 000000000007FFA4
[DEBUG] __this: userdata: 000001D3265CFF00
[DEBUG] PropertiesInstance:
[DEBUG] AI:
[DEBUG] class: NPC
[DEBUG] soul:
[DEBUG]   __ThisWUID: userdata: 0500000000000594
[DEBUG] InitialPosition:
[DEBUG]   y: 2019.41
[DEBUG]   x: 1986.8
[DEBUG]   z: 64.2633
[DEBUG] human:
[DEBUG]   __this: userdata: 000000000007FFA4
[DEBUG] this:
[DEBUG]   id: userdata: 0500000000000594
[DEBUG]   context:
[DEBUG]     animation:
[DEBUG]   name: taboryUCesty_archery_urs
[DEBUG]   currentSUBB:
[DEBUG] Properties:
[DEBUG]   LipSync:
[DEBUG]     TransitionQueueSettings:
[DEBUG]   Script:
[DEBUG]   CharacterSounds:
[DEBUG]   Rendering:

data.foodName = XGenAIModule.GetEntityByWUID(data.animal):GetName()
XGenAIModule.GetEntityByWUID(x.soul)
data.UIName = XGenAIModule.GetEntityByWUID(data.soul).soul:GetNameStringId()
text_ui_soul.xml
Database.LoadTable("text_ui_soul");Database.GetTableInfo(tableName)
#Database.LoadTable("soul");Cheat:log(tostring(Database.GetTableInfo("soul").LineCount))

for _,x in pairs(System.GetEntitiesInSphere(player:GetPos(), 20)) do Cheat:log(Cheat:getEntityName(x)) end

#local xml = require "xml"; Cheat:log(type(xml))

#Cheat:log(System.LoadTextFile("Localization/text_ui_soul.xml"))

-- Get UI Name ID:
for _,x in pairs(System.GetEntitiesInSphere(player:GetPos(), 20)) do if x.class=="NPC" then System.Log(x.soul:GetNameStringId()) end end
ex:
char_HAJNY_HRUSKA_uiName
soul_ui_name_huntsman

-- Get Entity Name ID:
for _,x in pairs(System.GetEntitiesInSphere(player:GetPos(), 20)) do if x.class=="NPC" then System.Log(x:GetAIName()) end end
for _,x in pairs(System.GetEntitiesInSphere(player:GetPos(), 20)) do if x.class=="NPC" then System.Log(x:GetName()) end end
for _,x in pairs(System.GetEntitiesInSphere(player:GetPos(), 20)) do if x.class=="NPC" then System.Log(x.this.name) end end
for _,x in pairs(System.GetEntitiesInSphere(player:GetPos(), 20)) do if x.class=="NPC" then Cheat:log(EntityUtils.GetName(x)) end end
ex:
taboryUCesty_archery_urs
taboryUCesty_archery_urs_son

-- Skald Character:
<skald_character
    age="3"
    body_type="4"
    description_string_name="char_HAJNY_HRUSKA_description"
    gender="0"
    history_string_name="char_HAJNY_HRUSKA_history"
    image1="true"
    image2="false"
    image3="false"
    image4="true"
    master_role_name="EVENT_TABORY_LUKOSTRELBA_URS"
    mortality_id="0"
    owner="Jan Zeman"
    physical_description_string_name="char_HAJNY_HRUSKA_physicalDescription"
    skald_character_full_name_string_name="char_HAJNY_HRUSKA_fullName"
    skald_character_name="char_HAJNY_HRUSKA"
    streaming_string_name="char_HAJNY_HRUSKA_streaming"
    ui_name_string_name="char_HAJNY_HRUSKA_uiName"
    unique_assets="7"
    voice_categories="generic christian"
    voice_id="234" />
]]

--[[
function Cheat:GetEntityName(entity)
    if (type(entity) == "userdata") then
        local e = System.GetEntity(entity)
        if (e) then
            return e:GetName()
        end
    elseif (type(entity) == "table") then
        return entity:GetName()
    end
    return ""
end

System.GetEntityByName(name)

function EntityUtils.DumpEntities()
    local ents = System.GetEntities()
    System.Log("Entities dump")
    for idx, e in pairs(ents) do
        local pos = e:GetPos()
        local ang = e:GetAngles()
        System.Log("[" .. tostring(e.id) .. "]..name=" .. e:GetName() .. " clsid=" .. e.class .. format(" pos=%.03f,%.03f,%.03f", pos.x, pos.y, pos.z) ..
            format(" ang=%.03f,%.03f,%.03f", ang.x, ang.y, ang.z))
    end
end

function EntityUtils.Teleport(entityName, targetName)
    local entity = System.GetEntityByName(entityName)
    local target = System.GetEntityByName(targetName)
    entity:SetWorldPos(target:GetWorldPos())
end
]]

-- ============================================================================
-- helpers
-- ============================================================================

local SOUL_ARCHETYPE = {
    NPC = 0,
    NPC_FEMALE = 1,
    NPC_CHILD = 2,
    HORSE = 3,
    SHEEP_EWE = 4,
    HARE = 5,
    PIG = 6,
    HEN = 7,
    DOG = 8,
    RED_DEER_STAG = 9,
    RED_DEER_DOE = 10,
    ROE_DEER_BUCK = 11,
    CATTLE_COW = 12,
    HERO = 13,
    BOAR = 14,
    HERO_FEMALE = 15,
    WOLF = 16,
    WILD_DOG = 17,
    CATTLE_BULL = 18,
    ROE_DEER_HIND = 19,
    SHEEP_RAM = 20
}

local SOUL_CLASS = {
    NONE = 0,
    PLAYER = 5,
    HORSE = 7,
    WAR_HORSE = 8,
    HARE = 14,
    CUMAN = 15,
    PIG = 16,
    SHEEP_EWE = 17,
    DOG = 18,
    NEUHOF_COLLIERS_BANDITS = 19,
    RED_DEER_STAG = 21,
    RED_DEER_DOE = 22,
    CATTLE_COW = 23,
    ROE_DEER_BUCK = 24,
    PIG_DOMESTIC = 25,
    ENEMY_CAMPS_BANDITS = 26,
    ENEMY_CAMPS_CUMANS = 27,
    HERBALIST = 28,
    INNKEEPER = 29,
    WOLF = 30,
    WILD_DOG = 31,
    CATTLE_BULL = 32,
    ROE_DEER_HIND = 33,
    SHEEP_RAM = 34
}

Cheat.g_soul_database = {}
Cheat.g_soul_keys = {}

function Cheat:addSoul(soulKey, entityClass, soul)
    -- entityClass is the name of the Lua class to use?
    if not Cheat.g_soul_database[soulKey] then
        Cheat.g_soul_database[soulKey] = {
            souls = {},
            entityClass = entityClass
        }
    end
    table.insert(Cheat.g_soul_database[soulKey].souls, soul)
end

function Cheat:initSoulsDatabase()
    Cheat:logDebug("initSoulsDatabase: Started...")

    local souls = Cheat:loadDatabase("soul")

    for _, soul in ipairs(souls) do
        if soul.soul_archetype_id == SOUL_ARCHETYPE.BOAR then
            -- Boar_pig
            Cheat:addSoul("Boar", "Boar", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.PIG then
            -- Pig_?
            -- Pig_pig
            Cheat:addSoul("Pig", "Pig", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.CATTLE_BULL then
            -- CattleBull_cattle_bull 2
            Cheat:addSoul("Bull", "CattleBull", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.CATTLE_COW then
            -- CattleCow_cattle_cow 12
            Cheat:addSoul("Cow", "CattleCow", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.HARE then
            -- Hare_hare 1
            Cheat:addSoul("Hare", "Hare", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.HERO or soul.soul_class_id == SOUL_CLASS.PLAYER then
            -- Hero_? 1
            -- Hero_player 2
            -- NPC_player 1
            Cheat:addSoul("Hero", "Player", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.HORSE then
            -- Horse_? 44
            -- Horse_horse 565
            Cheat:addSoul("Horse", "Horse", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.NPC then
            -- NPC_none 19
            -- NPC_? 6054
            Cheat:addSoul("Men", "NPC", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.NPC_FEMALE then
            -- NPC_Female_? 961
            -- NPC_Female_herbalist 1
            -- NPC_Female_none 4
            Cheat:addSoul("Women", "NPC_Female", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.RED_DEER_DOE then
            -- RedDeerDoe_red_deer_doe 3
            Cheat:addSoul("Red Doe", "RedDeerDoe", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.ROE_DEER_HIND then
            -- RoeDeerHind_roe_deer_hind 1
            Cheat:addSoul("Roe Doe", "RoeDeerHind", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.RED_DEER_STAG then
            -- RedDeerStag_red_deer_stag 11
            Cheat:addSoul("Red Stag", "RedDeerStag", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.ROE_DEER_BUCK then
            -- RoeDeerBuck_red_deer_buck 1
            -- RoeDeerBuck_red_deer_stag 1
            Cheat:addSoul("Roe Buck", "RoeDeerBuck", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.SHEEP_EWE then
            -- SheepEwe_sheep_ewe 16
            Cheat:addSoul("Sheep", "SheepEwe", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.SHEEP_RAM then
            -- SheepRam_sheep_ram 4
            Cheat:addSoul("Ram", "SheepRam", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.WILD_DOG or soul.soul_class_id == SOUL_CLASS.WILD_DOG then
            -- Dog_wilddog 153
            -- WildDog_dog 11
            Cheat:addSoul("Wild Dog", "WildDog", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.DOG or soul.soul_class_id == SOUL_CLASS.DOG then
            -- Dog_dog 3
            Cheat:addSoul("Dog", "Dog", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.WOLF or soul.soul_class_id == SOUL_CLASS.WOLF then
            --  Wolf_wolf 79
            Cheat:addSoul("Wolf", "Wolf", soul)
        else
            Cheat:logError("No bucket for soul.")
        end
    end

    for soulKey, soulsInfo in pairs(Cheat.g_soul_database) do
        table.insert(Cheat.g_soul_keys, soulKey)
        Cheat:logDebug("Loaded [%s] souls into soul key [%s].", #soulsInfo.souls, soulKey)
    end

    Cheat:logDebug("initSoulsDatabase: Done")
end

function Cheat:hasSoul(entity)
    if entity and entity["soul"] then
        return entity.soul ~= nil
    end
    return false
end

function Cheat:isClass(entity, className)
    if entity and entity["class"] then
        return entity.class == className
    end
    return false
end

function Cheat:isNpc(entity)
    return Cheat:hasSoul(entity) and Cheat:isClass(entity, "NPC")
end

function Cheat:getEntityName(entity)
    if (type(entity) == "userdata") then
        local e = System.GetEntity(entity)
        if (e) then
            return e:GetName()
        end
    elseif (type(entity) == "table") then
        return entity:GetName()
    end
    return nil
end

function Cheat:getLocalizedEntityNames(entity)
    if entity then
        if entity["soul"] then
            return Cheat:getLocalizedSoulNames(entity.soul)
        else
            Cheat:logError("getLocalizedEntityNames - entity has no soul")
        end
    end
    return nil
end

function Cheat:getEntityId(entity)
    if entity and entity["this"] and entity.this["id"] then
        return tostring(entity.this.id)
    end
    return nil
end

function Cheat:getEntityClass(entity)
    if entity and entity["class"] then
        return tostring(entity.class)
    end
    return nil
end

--# for _,x in pairs(System.GetEntitiesInSphere(player:GetPos(), 20)) do Cheat:log(tostring(Cheat:getEntityClass(x))) end
--# for _ in 1,10 do Cheat:log("hi") end
function Cheat:getTargetedEntity()
    local from = player:GetPos()
    from.z = from.z + 1.615

    local dir = System.GetViewCameraDir()
    local rayDistance = 50
    dir = VectorUtils.Scale(dir, rayDistance)

    local skip = player.id;
    local hitData = {}
    local hits = Physics.RayWorldIntersection(from, dir, 1, ent_all, skip, nil, hitData)
    --Cheat:logDebug("hits=" .. tostring(hits))
    --Cheat:logDebug("foundent=" .. tostring(hits > 0 and hitData[1].entity))
    if hits > 0 then
        if hitData[1]["entity"] then
            Cheat:logDebug("Found: %s", Cheat:serializeTable(hitData[1].entity))
            return hitData[1].entity
        end
    end
    return nil
end

function Cheat:getEntityInfo(entity)
    if not entity then
        Cheat:logWarn("logEntityInfo call on nil entity.")
        return
    end

    local names = Cheat:getLocalizedEntityNames(entity)

    local entityInfo = {
        ename = Cheat:getEntityName(entity) or "?",
        l1name = names and names.field1 or "?",
        l2name = names and names.field2 or "?",
        id = Cheat:getEntityId(entity) or "?",
        class = Cheat:getEntityClass(entity) or "?",
        loc = Cheat:serializeTable(entity:GetWorldPos())
    }

    return entityInfo
end

function Cheat:findEntities(searchKey, range, class)
    local entities = nil
    if range then
        entities = System.GetEntitiesInSphere(player:GetPos(), Cheat:max(range, 0))
    else
        entities = System.GetEntities()
    end

    local searchKeyLower = Cheat:toLower(Cheat:trimToNil(searchKey))
    local matchingEntities = {}
    for _, entity in pairs(entities) do
        if Cheat:isClass(entity, class) then
            if searchKeyLower then
                local names = { Cheat:getEntityName(entity) }
                local localizedNames = Cheat:getLocalizedEntityNames(entity)
                if localizedNames then
                    table.insert(names, localizedNames.field1)
                    table.insert(names, localizedNames.field2)
                end

                for _, name in ipairs(names) do
                    local nameLower = Cheat:toLower(Cheat:trimToNil(name))
                    if string.find(nameLower, searchKeyLower, 1, true) then
                        table.insert(matchingEntities, entity)
                        Cheat:logDebug("Found: %s", Cheat:serializeTable(entity))
                    end
                end
            else
                Cheat:logDebug("Found: %s", Cheat:serializeTable(entity))
                table.insert(matchingEntities, entity)
            end
        end
    end
    Cheat:logDebug("Found [%d] matching entities for [%s] [%s] [%s]", #matchingEntities, tostring(searchKey), tostring(range), tostring(class))
    return matchingEntities
end

-- #Cheat:log(tostring( Cheat:findNpcs("Hrushka", 5)[1]:GetWorldPos() ))

function Cheat:findNpcs(searchKey, range)
    return Cheat:findEntities(searchKey, range, "NPC")
end

function Cheat:createUniqueEntityName(entityClass)
    local entityName = nil
    repeat
        entityName = "cheat_" .. entityClass .. tostring(math.random(1, 100000000))
    until System.GetEntityByName(entityName) == nil
end

function Cheat:spawmEntity(entityName, entityClass, entitySoul, avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear)
    if not entityName then
        entityName = Cheat:createUniqueEntityName(entityClass)
    end

    local spawnParams = {}
    spawnParams.class = entityClass
    spawnParams.position = Cheat:createSpawnVectorFromVector(avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear)
    spawnParams.orientation = player:GetWorldPos()
    spawnParams.name = entityName
    spawnParams.properties = {}
    spawnParams.properties.sharedSoulGuid = entitySoul

    local entity = System.SpawnEntity(spawnParams)
    if entity then
        Cheat:logInfo("Spawned: %s", Cheat:serializeTable(Cheat:getEntityInfo(entity)))
    end
end

-- ============================================================================
-- cheat_kill_npc
-- ============================================================================
Cheat.cheat_kill_npc_args = {
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of the NPC's name.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The kill radius around player. Default 5.") end,
}
Cheat:createCommand("cheat_kill_npc", "Cheat:cheat_kill_npc(%line)", Cheat.cheat_kill_npc_args,
    "Kills all the killable NPCs within the given radius of the player.",
    "Kill everything.", "cheat_kill_npc radius:200",
    "Kill Father Godwin.", "cheat_kill_npc token:Godwin radius:2",
    "Kill all bandits near the player.", "cheat_kill_npc token:bandit radius:20")
function Cheat:cheat_kill_npc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_kill_npc_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    if tokenErr or radiusErr then
        return false
    end

    local npcs = Cheat:findNpcs(token, radius)
    if not npcs or #npcs == 0 then
        Cheat:logError("No NPCs matching [%s] found in radius [%s].", token, tostring(radius))
        return false
    end

    for _, npc in ipairs(npcs) do
        npc.soul:DealDamage(9999, 9999)
        Cheat:logInfo("Killed: %s", Cheat:serializeTable(Cheat:getEntityInfo(npc)))
    end
    return true
end

-- ============================================================================
-- cheat_resurrect_npc
-- ============================================================================
Cheat.cheat_resurrect_npc_args = {
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of the NPC's name.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The resurrection radius around player. Default 5.") end,
}
Cheat:createCommand("cheat_resurrect_npc", "Cheat:cheat_resurrect_npc(%line)", Cheat.cheat_resurrect_npc_args,
    "Resurrects all dead NPCs within the given radius of the player.",
    "Resurrect everything.", "cheat_resurrect_npc radius:200",
    "Resurrect Father Godwin.", "cheat_resurrect_npc token:Godwin radius:2",
    "Resurrects all bandits near the player.", "cheat_resurrect_npc token:bandit radius:10")
function Cheat:cheat_resurrect_npc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_resurrect_npc_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    local radius, radiusErr = Cheat:argsGet(args, "radius")

    if tokenErr or radiusErr then
        return false
    end

    local npcs = Cheat:findNpcs(token, radius)
    if not npcs or #npcs == 0 then
        Cheat:logError("No NPCs matching [%s] found in radius [%s].", token, tostring(radius))
        return false
    end

    for _, npc in ipairs(npcs) do
        if npc:IsDead() then
            npc.actor:ReviveToDefaults()
            --npc:SetWorldPos(entity.entityPosition)
            Cheat:logInfo("Resurrected: %s", Cheat:serializeTable(Cheat:getEntityInfo(npc)))
        end
    end
    return true
end

-- ============================================================================
-- cheat_find_npc
-- ============================================================================
Cheat.cheat_find_npc_args = {
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of the NPC's name.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "The search radius around player.") end,
}
Cheat:createCommand("cheat_find_npc", "Cheat:cheat_find_npc(%line)", Cheat.cheat_find_npc_args,
    "Finds and shows information about an NPC.\n$8This only works if the NPC has been loaded into the world.",
    "Find Father Godwin", "cheat_find_npc token:godwin",
    "Find all NPS near player.", "cheat_find_npc radius:5")
function Cheat:cheat_find_npc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_npc_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    if tokenErr or radiusErr then
        return false
    end

    local npcs = Cheat:findNpcs(token, radius)
    if not npcs or #npcs == 0 then
        Cheat:logError("No NPCs matching [%s] found in radius [%s].", token, tostring(radius))
        return false
    end

    for _, npc in ipairs(npcs) do
        Cheat:logInfo("Found: %s", Cheat:serializeTable(Cheat:getEntityInfo(npc)))
    end
    return true
end

-- ============================================================================
-- cheat_teleport_npc_to_loc
-- ============================================================================
Cheat.cheat_teleport_npc_to_loc_args = {
    token = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "All or part of the NPC's name.") end,
    x = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "X coordinate.") end,
    y = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Y coordinate.") end,
    z = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Z coordinate.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The teleport radius around the x,y,z target. Default 5.") end,
    max = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 10, showHelp, "The maximum NPCs to teleport. Default 10.") end
}
Cheat:createCommand("cheat_teleport_npc_to_loc", "Cheat:cheat_teleport_npc_to_loc(%line)", Cheat.cheat_teleport_npc_to_loc_args,
    "Teleports one or more NPCs to the given coordinates. Use cheat_loc to get locations.",
    "Teleport Father Godwin to somewhere...", "cheat_teleport_npc_to_loc token:Father_Godwin x:1 y:2 z:3")
function Cheat:cheat_teleport_npc_to_loc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_teleport_npc_to_loc_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    local x, xErr = Cheat:argsGet(args, "x")
    local y, yErr = Cheat:argsGet(args, "y")
    local z, zErr = Cheat:argsGet(args, "z")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    local max, maxErr = Cheat:argsGet(args, "max")
    if tokenErr or xErr or yErr or zErr or radiusErr or maxErr then
        return false
    end

    local npcs = Cheat:findNpcs(token)
    if not npcs or #npcs == 0 then
        Cheat:logError("No NPCs matching [%s] found.", token)
        return false
    end

    local teleportCount = 0
    for _, npc in ipairs(npcs) do
        if teleportCount < max then
            npc:SetWorldPos(Cheat:createSpawnVectorFromPosition(false, x, y, z, radius));
            teleportCount = teleportCount + 1
            Cheat:logInfo("Teleported: %s", Cheat:serializeTable(Cheat:getEntityInfo(npc)))
        else
            break
        end
    end
    return true
end

-- ============================================================================
-- cheat_teleport_npc_to_player
-- ============================================================================
Cheat.cheat_teleport_npc_to_player_args = {
    token = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "All or part of the NPC's name.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The teleport radius around the player. Default 5") end,
    max = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The maximum NPCs to teleport. Default 1.") end
}
Cheat:createCommand("cheat_teleport_npc_to_player", "Cheat:cheat_teleport_npc_to_player(%line)", Cheat.cheat_teleport_npc_to_player_args,
    "Teleports one or more NPCs to the player's location.",
    "Teleport Bara to the player.", "cheat_teleport_npc_to_player token:bara")
function Cheat:cheat_teleport_npc_to_player(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_teleport_npc_to_player_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    local max, maxErr = Cheat:argsGet(args, "max")
    if tokenErr or radiusErr or maxErr then
        return false
    end

    local npcs = Cheat:findNpcs(token)
    if not npcs or #npcs == 0 then
        Cheat:logError("No NPCs matching [%s] found.", token)
        return false
    end

    local playerPosition = player:GetWorldPos();
    local teleportCount = 0
    for _, npc in ipairs(npcs) do
        if teleportCount < max then
            npc:SetWorldPos(Cheat:createSpawnVectorFromPosition(false, playerPosition, radius));
            teleportCount = teleportCount + 1
            Cheat:logInfo("Teleported: %s", Cheat:serializeTable(Cheat:getEntityInfo(npc)))
        else
            break
        end
    end
    return true
end

-- ============================================================================
-- cheat_kill
-- ============================================================================
Cheat:createCommand("cheat_kill", "Cheat:cheat_kill()", nil, "Kills the player's current target.")
function Cheat:cheat_kill()
    local entity = Cheat:getTargetedEntity()
    if entity then
        local entityInfo = Cheat:getEntityInfo(entity)
        if Cheat:hasSoul(entity) then
            Cheat.entity_target.soul:DealDamage(9999, 9999)
            Cheat:logInfo("Killed: %s", Cheat:serializeTable(entityInfo))
        else
            Cheat:logError("Targeted entity has no soul, can't kill it.")
            Cheat:logError("Targeted: %s", Cheat:serializeTable(entityInfo))
        end
    else
        Cheat:logWarn("You are not targeting anything.")
    end
end

-- ============================================================================
-- cheat_spawn
-- ============================================================================
Cheat.cheat_spawn_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The spawn type ID.") end,
    count = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "Number of things to spawn. Default 1.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 10, showHelp, "The spawn radius around the player. Default 10.") end
}
Cheat:createCommand("cheat_spawn", "Cheat:cheat_spawn(%line)", Cheat.cheat_spawn_args,
    "Spawns entities. Enter the ID (number) from this list:\n" .. Cheat:formatArrayAsList(Cheat.g_soul_keys, 3)
    "Spawn 10 bandits", "cheat_spawn id:pig count:10")
function Cheat:cheat_spawn(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_spawn_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local count, countErr = Cheat:argsGet(args, "count")
    local radius, radiusErr = Cheat:argsGet(args, "radius")

    if idErr or countErr or radiusErr then
        return false
    end

    if not Cheat.g_soul_keys[id] then
        Cheat:logError("Spawn type ID [%s] does not exist.", tostring(id))
        return false
    end

    local soulKey = Cheat.g_soul_keys[id]
    local soulsInfo = Cheat.g_soul_database[soulKey]

    if not soulsInfo then
        Cheat:logError("Soul key [%s] not found. (Report this bug)", tostring(soulKey))
        return false
    end

    for _ = 1, Cheat:max(count, 1) do
        local entityName       = nil                                               -- auto generate
        local entityClass      = soulsInfo.entityClass
        local entitySoul       = soulsInfo.souls[math.random(1, #soulsInfo.souls)] -- pick a random soul
        local avoidSpawnCenter = true                                              -- don't spawn on top of player
        local spawnCenter      = player:GetWorldPos()                              -- center of spawn area
        local spawnRadius      = radius                                            -- size of spawn area
        local spawnNear        = 2                                                 -- how far from the center we need to be
        Cheat:spawmEntity(entityName, entityClass, entitySoul, avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear)
    end
end

-- ============================================================================
-- cheat_spawn_npc
-- ============================================================================
Cheat.cheat_spawn_npc_args = {
    token = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The sould ID, all/part of the soul name, or all/part of localized soul name.") end
}
Cheat:createCommand("cheat_spawn_npc", "Cheat:cheat_spawn_npc(%line)", Cheat.cheat_spawn_npc_args,
    "Searches through the database of souls and spawns 1 NPC for each match.\n$8" ..
    "This is intended to be used to spawn specific NPCs.\n$8" ..
    "The list of souls is in v_soul_character_data.xml in tables.pak.",
    "Spawn Olena by name (spawns 2 NPCs, 1 is invisible)", "cheat_spawn_npc token:olena",
    "Spawn all NPCs with 'father' in their name", "cheat_spawn_npc token:father",
    "Spawn by soul ID", "cheat_spawn_npc token:4d69f4f4-6b78-7b1f-5a61-8fa8045b7aac",
    "Spawn by ui name", "cheat_spawn_npc token:char_452_uiName")
function Cheat:cheat_spawn_npc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_spawn_npc_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    if tokenErr then
        return false
    end

    local searchKey = Cheat:toLower(token)
    for soulKey, soulInfo in pairs(Cheat.g_soul_database) do
        if string.find(soulKey, searchKey, 1, true) then
            break
        end
    end

    local souls = Cheat:find_soul(token, true)
    if souls and #souls > 0 then
        for i, soul in ipairs(souls) do
            Cheat:spawmEntity(nil, "NPC", soul.soul_id, nil, nil)
        end
    else
        Cheat:logError("Soul [%s] not found.", token)
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_npc.lua loaded")
