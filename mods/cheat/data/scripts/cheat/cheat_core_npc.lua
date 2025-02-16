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

Cheat.g_souls_by_name = {}
Cheat.g_soul_category_database = {}
Cheat.g_soul_category_keys = {}
table.insert(Cheat.g_soul_category_keys, "Boar")
table.insert(Cheat.g_soul_category_keys, "Pig")
table.insert(Cheat.g_soul_category_keys, "Bull")
table.insert(Cheat.g_soul_category_keys, "Cow")
table.insert(Cheat.g_soul_category_keys, "Hare")
table.insert(Cheat.g_soul_category_keys, "Horse")
table.insert(Cheat.g_soul_category_keys, "Men")
table.insert(Cheat.g_soul_category_keys, "Women")
table.insert(Cheat.g_soul_category_keys, "Red Doe")
table.insert(Cheat.g_soul_category_keys, "Roe Doe")
table.insert(Cheat.g_soul_category_keys, "Red Stag")
table.insert(Cheat.g_soul_category_keys, "Roe Buck")
table.insert(Cheat.g_soul_category_keys, "Sheep")
table.insert(Cheat.g_soul_category_keys, "Ram")
table.insert(Cheat.g_soul_category_keys, "Wild Dog")
table.insert(Cheat.g_soul_category_keys, "Dog")
table.insert(Cheat.g_soul_category_keys, "Wolf")

function Cheat:addSoulToCategory(soulKey, entityClass, soul)
    -- entityClass is the name of the Lua class to use?
    if not Cheat.g_soul_category_database[soulKey] then
        Cheat.g_soul_category_database[soulKey] = {
            souls = {},
            entityClass = entityClass
        }
    end
    table.insert(Cheat.g_soul_category_database[soulKey].souls, soul)
end

function Cheat:initSoulsDatabase()
    Cheat:logDebug("initSoulsDatabase: Started...")

    local souls = Cheat:loadDatabase("soul")

    for _, soul in ipairs(souls) do
        if soul.soul_archetype_id == SOUL_ARCHETYPE.BOAR then
            -- Boar_pig
            Cheat:addSoulToCategory("Boar", "Boar", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.PIG then
            -- Pig_?
            -- Pig_pig
            Cheat:addSoulToCategory("Pig", "Pig", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.CATTLE_BULL then
            -- CattleBull_cattle_bull 2
            Cheat:addSoulToCategory("Bull", "CattleBull", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.CATTLE_COW then
            -- CattleCow_cattle_cow 12
            Cheat:addSoulToCategory("Cow", "CattleCow", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.HARE then
            -- Hare_hare 1
            Cheat:addSoulToCategory("Hare", "Hare", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.HERO or soul.soul_class_id == SOUL_CLASS.PLAYER then
            -- Hero_? 1
            -- Hero_player 2
            -- NPC_player 1
            --table.insert(Cheat.g_soul_category_keys, "Hero")
            -- spawning these will crashed my game
            -- Cheat:addSoulToCategory("Hero", "Player", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.HORSE then
            -- Horse_? 44
            -- Horse_horse 565
            Cheat:addSoulToCategory("Horse", "Horse", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.NPC then
            -- NPC_none 19
            -- NPC_? 6054
            Cheat:addSoulToCategory("Men", "NPC", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.NPC_FEMALE then
            -- NPC_Female_? 961
            -- NPC_Female_herbalist 1
            -- NPC_Female_none 4
            Cheat:addSoulToCategory("Women", "NPC_Female", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.RED_DEER_DOE then
            -- RedDeerDoe_red_deer_doe 3
            Cheat:addSoulToCategory("Red Doe", "RedDeerDoe", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.ROE_DEER_HIND then
            -- RoeDeerHind_roe_deer_hind 1
            Cheat:addSoulToCategory("Roe Doe", "RoeDeerHind", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.RED_DEER_STAG then
            -- RedDeerStag_red_deer_stag 11
            Cheat:addSoulToCategory("Red Stag", "RedDeerStag", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.ROE_DEER_BUCK then
            -- RoeDeerBuck_red_deer_buck 1
            -- RoeDeerBuck_red_deer_stag 1
            Cheat:addSoulToCategory("Roe Buck", "RoeDeerBuck", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.SHEEP_EWE then
            -- SheepEwe_sheep_ewe 16
            Cheat:addSoulToCategory("Sheep", "SheepEwe", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.SHEEP_RAM then
            -- SheepRam_sheep_ram 4
            Cheat:addSoulToCategory("Ram", "SheepRam", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.WILD_DOG or soul.soul_class_id == SOUL_CLASS.WILD_DOG then
            -- Dog_wilddog 153
            -- WildDog_dog 11
            Cheat:addSoulToCategory("Wild Dog", "WildDog", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.DOG or soul.soul_class_id == SOUL_CLASS.DOG then
            -- Dog_dog 3
            Cheat:addSoulToCategory("Dog", "Dog", soul)
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.WOLF or soul.soul_class_id == SOUL_CLASS.WOLF then
            --  Wolf_wolf 79
            Cheat:addSoulToCategory("Wolf", "Wolf", soul)
        else
            Cheat:logError("No bucket for soul.")
        end
    end

    for soulKey, soulsInfo in pairs(Cheat.g_soul_category_database) do
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

function Cheat:isClasses(entity, classNames)
    for _, className in pairs(classNames) do
        if Cheat:isClass(entity, className) then
            return true
        end
    end
    return false
end

function Cheat:isNpc(entity)
    return Cheat:hasSoul(entity) and (Cheat:isClass(entity, "NPC") or Cheat:isClass(entity, "NPC_Female"))
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

function Cheat:getEntityHealth(entity)
    if entity and entity["actor"] then
        return entity.actor:GetHealth()
    else
        return nil
    end
end

function Cheat:getTargetedEntity()
    local from = player:GetPos()
    from.z = from.z + 1.615

    local dir = System.GetViewCameraDir()
    local rayDistance = 50
    dir = VectorUtils.Scale(dir, rayDistance)

    local skip = player.id;
    local hitData = {}
    local hits = Physics.RayWorldIntersection(from, dir, 1, ent_all, skip, nil, hitData)
    Cheat:logDebug("Hit Data: %s", Cheat:serializeTable(hitData))
    if hits > 0 then
        if hitData[1]["entity"] then
            Cheat:logDebug("Targeted Entity: %s", Cheat:serializeTable(hitData[1].entity))
            return hitData[1].entity
        end
    end
    return nil
end

function Cheat:getEntityInfo(entity)
    if not entity then
        Cheat:logWarn("logEntityInfo call on nil entity.")
        return nil
    end

    local names = Cheat:getLocalizedEntityNames(entity)

    -- socialClass = npcEntity.soul:GetSocialClass().Name,
    -- factionID = npcEntity.soul:GetFactionID(),

    local entityInfo = {
        id = Cheat:getEntityId(entity) or "?",
        class = Cheat:getEntityClass(entity) or "?",
        name = Cheat:getEntityName(entity) or "?",
        l1name = names and names.field1 or "?",
        l2name = names and names.field2 or "?",
        loc = Cheat:serializeTable(entity:GetWorldPos()),
        health = Cheat:getEntityHealth(entity)
    }

    Cheat:logDebug("EntityInfo: %s", Cheat:getEntityInfoDisplayText(entityInfo))
    return entityInfo
end

function Cheat:findEntities(searchOperation, range, classes)
    if not searchOperation then
        searchOperation = { exact = false, searchKey = nil }
    end

    local entities = nil
    if range then
        entities = System.GetEntitiesInSphere(player:GetPos(), Cheat:max(range, 0))
    else
        entities = System.GetEntities()
    end

    local searchKeyLower = Cheat:toLower(Cheat:trimToNil(searchOperation.searchKey))
    local matchingEntities = {}
    for _, entity in pairs(entities) do
        if not classes or Cheat:isClasses(entity, classes) then
            if searchKeyLower then
                local names = {}
                local localizedNames = Cheat:getLocalizedEntityNames(entity)
                if localizedNames then
                    table.insert(names, localizedNames.field1)
                    table.insert(names, localizedNames.field2)
                else
                    local entityName = Cheat:getEntityName(entity)
                    if entityName then
                        table.insert(names, entityName)
                    end
                end

                for _, name in ipairs(names) do
                    local nameLower = Cheat:toLower(Cheat:trimToNil(name))
                    local found = (searchOperation.exact and nameLower == searchKeyLower) or (not searchOperation.exact and string.find(nameLower, searchKeyLower, 1, true))
                    if found then
                        table.insert(matchingEntities, entity)
                        Cheat:logDebug("Found: %s", Cheat:getEntityDisplayText(entity))
                        break
                    end
                end
            else
                Cheat:logDebug("Found: %s", Cheat:getEntityDisplayText(entity))
                table.insert(matchingEntities, entity)
            end
        end
    end
    Cheat:logDebug("Found [%d] matching entities for [%s] [%s] [%s]", #matchingEntities, Cheat:serializeTable(searchOperation), tostring(range), Cheat:serializeTable(classes))
    return matchingEntities
end

function Cheat:findNpcs(searchOperation, range)
    return Cheat:findEntities(searchOperation, range, { "NPC", "NPC_Female", "Horse" })
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

    --[[

    <skald_character age="3" body_type="4" description_string_name="char_HAJNY_HRUSKA_description" gender="0"
        history_string_name="char_HAJNY_HRUSKA_history" image1="true" image2="false" image3="false" image4="true"
        master_role_name="EVENT_TABORY_LUKOSTRELBA_URS" mortality_id="0" owner="Jan Zeman"
        physical_description_string_name="char_HAJNY_HRUSKA_physicalDescription"
        skald_character_full_name_string_name="char_HAJNY_HRUSKA_fullName"
        skald_character_name="char_HAJNY_HRUSKA"
        streaming_string_name="char_HAJNY_HRUSKA_streaming"
        ui_name_string_name="char_HAJNY_HRUSKA_uiName"
        unique_assets="7" voice_categories="generic christian" voice_id="234" />


        localized.cell2/3
            -> localized.cell1 (uiname)
                -> skald_character.ui_name_string_name

        entity.name(taboryUCesty_archery_urs)
            ->  <InventoryPreset Name="inventory_taboryUCesty_archery_urs">
                    <ClothingPresetRef Name="taboryUCesty_archery_urs" />
                    <WeaponPresetRef Name="taboryUCesty_archery_urs" />
                    <InventoryPresetRef Name="pockets_huntsman" />
                    <PresetItem Name="beer" Amount="1" />
                    <PresetItem Name="water" Amount="1" />
                    <PresetItem Name="repairKit_tailorsSmall" Amount="1" />
                </InventoryPreset>
            -> soul.soul_name -> soul.soul_id
                <soul
                    brain_id="4b914d1c-724a-a92d-3e6b-d183d35b8b98"
                    digestion_multiplier="0"
                    factionName="eventNPCs_civilians_friends"
                    initial_clothing_dirt="0"
                    skald_character_name="char_HAJNY_HRUSKA" social_class_id="88"
                    soul_archetype_id="0"
                    soul_id="c82be12b-76e1-4da5-88c9-6b1c50aa080b"
                    soul_name="taboryUCesty_archery_urs"
                    soul_vip_class_id="0"
                    xp_multiplier="0" />
    ]]

    --[[
    local spawnParams = {}
    spawnParams.class = entityClass
    spawnParams.position = Cheat:createSpawnVectorFromVector(avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear)
    spawnParams.orientation = player:GetWorldPos()
    spawnParams.name = entityName
    spawnParams.properties = {}
    spawnParams.properties.sharedSoulGuid = entitySoul
    Cheat:logDebug(Cheat:serializeTable(spawnParams))
    local entity = System.SpawnEntity(spawnParams)

    System.GetEntity("taboryUCesty_archery_urs")
    System.SpawnEntity({ name = "taboryUCesty_archery_urs", class = "NPC", sharedSoulGuid = "c82be12b-76e1-4da5-88c9-6b1c50aa080b", position = player:GetWorldPos() })
    ]]

    local params = {
        name = entityName,
        class = entityClass,
        position = Cheat:createSpawnVectorFromVector(avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear),
        orientation = player:GetWorldPos(),
        scale = 1,
        archetype = nil,
        soul = entitySoul,
        properties = {},
        propertiesInstance = {}
    }

    local entity = System.SpawnEntity(params)
    if entity then
        Cheat:logInfo("Spawned: %s", Cheat:serializeTable(Cheat:getEntityInfo(entity)))
    else
        Cheat:logError("Failed to spawn entity: %s", Cheat:serializeTable(params))
    end
end

function Cheat:spawn()
    -- System.RemoveEntity(Cheat:getTargetedEntity().id)
    -- System.Log(tostring(Cheat:getTargetedEntity():Reset()))

    local sp                      = {}
    sp.ClassName                  = "NPC"
    sp.Name                       = "taboryUCesty_archery_urs"
    sp.SoulGuid                   = "c82be12b-76e1-4da5-88c9-6b1c50aa080b"
    sp.Properties                 = {}
    sp.PercepDestinationrObjectAI = false
    sp.PerceptibleObjectAI        = false
    sp.Pos                        = player:GetWorldPos()
    sp.Rot                        = player:GetAngles()

    System.SpawnEntity({ class = "Boar", position = player:GetWorldPos() }) --, name = "taboryUCesty_archery_urs", properties = {SoulGuid = "c82be12b-76e1-4da5-88c9-6b1c50aa080b"}})

    Cheat:logInfo("before spawn")
    local entity = XGenAIModule.SpawnEntity(sp)
    if entity then
        Cheat:logInfo("Spawned: %s", Cheat:serializeTable(Cheat:getEntityInfo(entity)))
    else
        Cheat:logError("crap")
    end
end

function Cheat:getEntityInfoDisplayText(entityInfo)
    if not entityInfo then
        return "nil"
    end

    local name = entityInfo.name
    if entityInfo.l1name then
        name = entityInfo.l1name
    end
    if entityInfo.l2name then
        name = entityInfo.l2name
    end

    return string.format("name=%s class=%s loc=%s health=%s", tostring(name), tostring(entityInfo.class), tostring(entityInfo.loc), tostring(entityInfo.health))
end

function Cheat:getEntityDisplayText(entity)
    return Cheat:getEntityInfoDisplayText(Cheat:getEntityInfo(entity))
end

-- ============================================================================
-- cheat_find_npc
-- ============================================================================
Cheat.cheat_find_npc_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "The search radius around player.") end,
}
Cheat:createCommandLegacy("cheat_find_npc", "Cheat:cheat_find_npc(%line)", Cheat.cheat_find_npc_args,
    "Finds NPCs loaded into the world.",
    "Find any NPC with 'hunt' in name", "cheat_find_npc any:hunt",
    "Find NPC with name exact matching 'Bara'", "cheat_find_npc exact:bara",
    "Find all NPCs near player.", "cheat_find_npc radius:5")
function Cheat:cheat_find_npc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_npc_args, "cheat_find_npc")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    if anyErr or exactErr or radiusErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    local npcs = Cheat:findNpcs(searchOperation, radius)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(radius))
        return false, nil
    end

    for _, npc in ipairs(npcs) do
        Cheat:logInfo("Found: %s", Cheat:getEntityDisplayText(npc))
    end
    return true, npcs
end

-- ============================================================================
-- cheat_revive_npc
-- ============================================================================
Cheat.cheat_revive_npc_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The resurrection radius around player. Default 5.") end,
}
Cheat:createCommandLegacy("cheat_revive_npc", "Cheat:cheat_revive_npc(%line)", Cheat.cheat_revive_npc_args,
    "(Does not work yet) Revives dead NPCs by name or within the given radius of the player.",
    "Revive everything.", "cheat_revive_npc radius:200",
    "Revive Father Godwin.", "cheat_revive_npc exact:bara",
    "Revives all bandits near the player.", "cheat_revive_npc any:bandit radius:10")
function Cheat:cheat_revive_npc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_revive_npc_args, "cheat_revive_npc")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    if anyErr or exactErr or radiusErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    local npcs = Cheat:findNpcs(searchOperation, radius)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(radius))
        return false, nil
    end

    for _, npc in ipairs(npcs) do
        if Cheat:getEntityHealth(npc) <= 0 then
            -- turns npc into a zombie
            -- seems like the ai is no longer running
            npc.actor:Revive(true)

            -- #Cheat:getTargetedEntity().Reset(self, true, true);
            -- Cheat:getTargetedEntity().actor:Reset(true, true)
            -- Cheat:getTargetedEntity():OnReset(true)
            --npc:Reset()
            --npc.actor:InitialSetup(true)
            --npc.soul:SetState("health", 100)
            --npc:ReviveInEditor()
            --npc.actor:Revive(true)
            --npc.soul:Revive()
            --npc:SetWorldPos(entity.entityPosition)
            Cheat:logInfo("Resurrected: %s", Cheat:getEntityDisplayText(npc))
        end
    end
    return true, npcs
end

-- ============================================================================
-- cheat_teleport_npc_to_loc
-- ============================================================================
Cheat.cheat_teleport_npc_to_loc_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    x = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "X coordinate.") end,
    y = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Y coordinate.") end,
    z = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Z coordinate.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The teleport radius around the x,y,z target. Default 5.") end,
    max = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 10, showHelp, "The maximum NPCs to teleport. Default 10.") end
}
Cheat:createCommandLegacy("cheat_teleport_npc_to_loc", "Cheat:cheat_teleport_npc_to_loc(%line)", Cheat.cheat_teleport_npc_to_loc_args,
    "Teleports one or more NPCs to the given coordinates. Use cheat_loc to get locations.",
    "Teleport Bara to somewhere...", "cheat_teleport_npc_to_loc exact:Bara x:1 y:2 z:3")
function Cheat:cheat_teleport_npc_to_loc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_teleport_npc_to_loc_args, "cheat_teleport_npc_to_loc")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local x, xErr = Cheat:argsGet(args, "x")
    local y, yErr = Cheat:argsGet(args, "y")
    local z, zErr = Cheat:argsGet(args, "z")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    local max, maxErr = Cheat:argsGet(args, "max")
    if anyErr or exactErr or xErr or yErr or zErr or radiusErr or maxErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        return false, nil
    end

    local npcs = Cheat:findNpcs(searchOperation)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(radius))
        return false, nil
    end

    local teleportCount = 0
    for _, npc in ipairs(npcs) do
        if teleportCount < max then
            npc:SetWorldPos(Cheat:createSpawnVectorFromPosition(false, x, y, z, radius, 0));
            teleportCount = teleportCount + 1
            Cheat:logInfo("Teleported: %s", Cheat:getEntityDisplayText(npc))
        else
            break
        end
    end
    return true, npcs
end

-- ============================================================================
-- cheat_teleport_npc_to_player
-- ============================================================================
Cheat.cheat_teleport_npc_to_player_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The teleport radius around the player. Default 5") end,
    max = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The maximum NPCs to teleport. Default 1.") end
}
Cheat:createCommandLegacy("cheat_teleport_npc_to_player", "Cheat:cheat_teleport_npc_to_player(%line)", Cheat.cheat_teleport_npc_to_player_args,
    "Teleports one or more NPCs to the player's location.",
    "Teleport Bara to the player.", "cheat_teleport_npc_to_player exact:bara",
    "Teleport all bandits to the player.", "cheat_teleport_npc_to_player any:bandit radius:50")
function Cheat:cheat_teleport_npc_to_player(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_teleport_npc_to_player_args, "cheat_teleport_npc_to_player")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    local max, maxErr = Cheat:argsGet(args, "max")
    if anyErr or exactErr or radiusErr or maxErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        return false, nil
    end

    local npcs = Cheat:findNpcs(searchOperation)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(radius))
        return false, nil
    end

    local playerPosition = player:GetWorldPos();
    local teleportCount = 0
    for _, npc in ipairs(npcs) do
        if teleportCount < max then
            npc:SetWorldPos(Cheat:createSpawnVectorFromVector(true, playerPosition, radius, 2));
            teleportCount = teleportCount + 1
            Cheat:logInfo("Teleported: %s", Cheat:getEntityDisplayText(npc))
        else
            break
        end
    end
    return true, npcs
end

-- ============================================================================
-- cheat_target
-- ============================================================================
Cheat:createCommandLegacy("cheat_target", "Cheat:cheat_target()", nil, "shows information about your current target.")
function Cheat:cheat_target()
    local entity = Cheat:getTargetedEntity()
    if entity then
        Cheat:logInfo("Targeted: %s", Cheat:getEntityDisplayText(entity))
    else
        Cheat:logWarn("You are not targeting anything.")
    end
end

-- ============================================================================
-- cheat_kill
-- ============================================================================
Cheat:createCommandLegacy("cheat_kill", "Cheat:cheat_kill()", nil, "Kills the player's current target.")
function Cheat:cheat_kill()
    local entity = Cheat:getTargetedEntity()
    if entity then
        local entityInfo = Cheat:getEntityInfo(entity)
        if Cheat:hasSoul(entity) then
            entity.soul:DealDamage(9999, 9999)
            Cheat:logInfo("Killed: %s", Cheat:getEntityInfoDisplayText(entityInfo))
        else
            Cheat:logError("Targeted entity has no soul, can't kill it.")
            Cheat:logError("Targeted: %s", Cheat:getEntityInfoDisplayText(entityInfo))
        end
    else
        Cheat:logWarn("You are not targeting anything.")
    end
end

-- ============================================================================
-- cheat_mass_kill
-- ============================================================================
Cheat.cheat_kill_npc_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 10, showHelp, "The kill radius around player. Default 10.") end,
}
Cheat:createCommandLegacy("cheat_mass_kill", "Cheat:cheat_mass_kill(%line)", Cheat.cheat_kill_npc_args,
    "Kills all the killable entities within the given radius of the player.",
    "Kill everything within 200 units of player", "cheat_mass_kill radius:200",
    "Kill Bara", "cheat_mass_kill exact:bara",
    "Kills all bandits near the player", "cheat_mass_kill any:bandit radius:20")
function Cheat:cheat_mass_kill(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_kill_npc_args, "cheat_mass_kill")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local radius, radiusErr = Cheat:argsGet(args, "radius")
    if anyErr or exactErr or radiusErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    local entities = Cheat:findEntities(searchOperation, radius)
    if not entities or #entities == 0 then
        Cheat:logWarn("No entities matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(radius))
        return false, nil
    end

    for _, entity in ipairs(entities) do
        if entity and Cheat:hasSoul(entity) and entity ~= player then
            entity.soul:DealDamage(9999, 9999)
            Cheat:logInfo("Killed: %s", Cheat:getEntityDisplayText(entity))
        end
    end
    return true, entities
end

-- ============================================================================
-- cheat_spawn
-- ============================================================================
Cheat.cheat_spawn_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The spawn type ID.") end,
    count = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "Number of things to spawn. Default 1.") end,
    radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 10, showHelp, "The spawn radius around the player. Default 10.") end
}
Cheat:createCommandLegacy("cheat_spawn", "Cheat:cheat_spawn(%line)", Cheat.cheat_spawn_args,
    "(Working in progress) Spawns entities. Enter the ID (number) from this list:\n" .. Cheat:formatArrayAsList(Cheat.g_soul_category_keys, 3),
    "Spawn 10 bandits", "cheat_spawn id:pig count:10")
function Cheat:cheat_spawn(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_spawn_args, "cheat_spawn")
    local id, idErr = Cheat:argsGet(args, "id")
    local count, countErr = Cheat:argsGet(args, "count")
    local radius, radiusErr = Cheat:argsGet(args, "radius")

    if idErr or countErr or radiusErr then
        return false
    end

    if not Cheat.g_soul_category_keys[id] then
        Cheat:logError("Spawn type ID [%s] does not exist.", tostring(id))
        return false
    end

    local soulKey = Cheat.g_soul_category_keys[id]
    local soulsInfo = Cheat.g_soul_category_database[soulKey]

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
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_npc.lua loaded")
