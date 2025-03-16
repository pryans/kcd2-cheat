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

function Cheat:getSoulCategoryKeys()
    local categories = {}
    table.insert(categories, "Boar")
    table.insert(categories, "Pig")
    table.insert(categories, "Bull")
    table.insert(categories, "Cow")
    table.insert(categories, "Hare")
    table.insert(categories, "Horse")
    table.insert(categories, "Men")
    table.insert(categories, "Women")
    table.insert(categories, "Red Doe")
    table.insert(categories, "Roe Doe")
    table.insert(categories, "Red Stag")
    table.insert(categories, "Roe Buck")
    table.insert(categories, "Sheep")
    table.insert(categories, "Ram")
    table.insert(categories, "Wild Dog")
    table.insert(categories, "Dog")
    table.insert(categories, "Wolf")
    table.insert(categories, "Bandit")
    table.insert(categories, "Soldier")
    return categories
end

Cheat.g_soul_category_database = nil
Cheat.g_soul_category_keys = Cheat:getSoulCategoryKeys()

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

    Cheat.g_soul_category_database = {}
    Cheat.g_soul_category_keys = Cheat:getSoulCategoryKeys()

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

            -- social_class_id="104" social_class_name="banditLeader"

            -- social_class_id="105" social_class_name="cumanLeader"
            -- social_class_id="43" social_class_name="cuman"

            -- social_class_id="106" social_class_name="ruffianLeader"
            -- social_class_id="51" social_class_name="ruffian"

            if soul.social_class_id == 38 then
                -- social_class_id="38" social_class_name="bandit"
                Cheat:addSoulToCategory("Bandit", "NPC", soul)
            elseif soul.social_class_id == 33 then
                -- social_class_id="33" social_class_name="soldier"
                Cheat:addSoulToCategory("Soldier", "NPC", soul)
            else
                Cheat:addSoulToCategory("Men", "NPC", soul)
            end
        elseif soul.soul_archetype_id == SOUL_ARCHETYPE.NPC_FEMALE then
            -- NPC_Female_? 961
            -- NPC_Female_herbalist 1
            -- NPC_Female_none 4

            if soul.social_class_id == 55 then
                -- social_class_id="55" social_class_name="bathhouseMaid"
                Cheat:addSoulToCategory("Maid", "NPC_Female", soul)
            elseif soul.social_class_id == 62 then
                -- social_class_id="62" social_class_name="bathhouseAbbess"
                Cheat:addSoulToCategory("Abbess", "NPC_Female", soul)
            else
                Cheat:addSoulToCategory("Women", "NPC_Female", soul)
            end
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

            if soul.social_class_id == 120 then
                -- dog_aggressive
                Cheat:addSoulToCategory("Wild Dog", "WildDog", soul)
            end
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

    -- socialClass = npcEntity.soul:GetSocialClass().Name,
    -- factionID = npcEntity.soul:GetFactionID(),

    local entityInfo = {
        id = Cheat:getEntityId(entity) or "?",
        class = Cheat:getEntityClass(entity) or "?",
        name = Cheat:getEntityName(entity) or "?",
        lname = Cheat:getLocalizedEntityName(entity) or "?",
        loc = Cheat:serializeTable(entity:GetWorldPos()),
        health = Cheat:getEntityHealth(entity)
    }

    --Cheat:tprint(entity)

    Cheat:logDebug("EntityInfo: %s", Cheat:serializeTable(entityInfo))
    return entityInfo
end

---findEntities
---@param searchOperation table|nil
---@param range number|nil
---@param classes table|nil
---@return table
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

                local lname = Cheat:getLocalizedEntityName(entity)
                if lname then
                    table.insert(names, lname)
                end

                local entityName = Cheat:getEntityName(entity)
                if entityName and entityName ~= lname then
                    table.insert(names, entityName)
                end

                for _, name in ipairs(names) do
                    local nameLower = Cheat:toLower(Cheat:trimToNil(name))
                    if nameLower then
                        local foundExact = searchOperation.exact and nameLower == searchKeyLower
                        local foundAny = not searchOperation.exact and string.find(nameLower, searchKeyLower, 1, true)
                        if foundExact or foundAny then
                            table.insert(matchingEntities, entity)
                            Cheat:logDebug("Found: %s", Cheat:getEntityDisplayText(entity))
                            break
                        end
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

---findNpcs
---@param searchOperation table|nil
---@param range number|nil
---@return table
function Cheat:findNpcs(searchOperation, range)
    return Cheat:findEntities(searchOperation, range, { "NPC", "NPC_Female", "Horse" })
end

function Cheat:createUniqueEntityName(entityClass)
    local entityName = nil
    repeat
        entityName = "cheat_" .. entityClass .. tostring(math.random(1, 100000000))
    until System.GetEntityByName(entityName) == nil
    return entityName
end

function Cheat:spawnEntity(entityName, entityClass, entitySoulId, avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear)
    if not entityName then
        entityName = Cheat:createUniqueEntityName(entityClass)
    end
    --[[
    Soul
        soul_id
        soul_name
        soul_archetype_id
        soul_vip_class_id
        brain_id
    Brain
        brain_id
        brain_name

    For Skald characters the soul has a skald_character_name

    Skald Character
        skald_character_name
    Soul
        skald_character_name

    Spawn Parmas (PathfindDebugUtils)
        spawnParams.Name = SoulName = brain_name
        spawnParams.SharedSoulGuid = SoulSharedGUID = soul_id

    Pebbles the horse:
    name = tsem_sedivka
    soul_id = 4e5abeff-f19e-0eab-0921-a24611c4ad8f

    [DEBUG] Targeted Entity: inventory=table: 0000023F2ED6D280 inspectableByPlayer=true class=Horse AI=table: 0000023F2ED3E5C0 this=table: 0000023F2FA0FF00 actor=table: 0000023F2F5BD840 mountableByPlayer=true mountIsLegalFromAI=false soul=table: 0000023F2ED6DCC0 __this=userdata: 0000023E627CF300 PropertiesInstance=table: 0000023F2F5BDFC0 id=userdata: 000000000002D54A mountIsLegal=false horse=table: 0000023F2F5BD800 Properties=table: 0000023F2F5BEFC0 mountableByPlayerDisabledFromAI=false
    [DEBUG] EntityInfo: health=100 name=tsem_sedivka l1name=gray id=userdata: 050000000000028A class=Horse loc=y=2060.53 x=2282.11 z=108.438 l2name=pebbles

    Not Pebbles
    [DEBUG] Targeted Entity: inventory=table: 0000023F2EE7D0C0 actor=table: 0000023F2EE7DE40 mountableByPlayer=true mountIsLegalFromAI=false id=userdata: 00000000003BFD89 __this=userdata: 0000023E6475C700 PropertiesInstance=table: 0000023F2EE7E140 class=Horse AI=table: 0000023F2EE7CA00 mountableByPlayerDisabledFromAI=false inspectableByPlayer=true soul=table: 0000023F2EE7D100 mountIsLegal=false horse=table: 0000023F2EE7D080 this=table: 0000023F2EE7C9C0 Properties=table: 0000023F2EE7E580
    [DEBUG] EntityInfo: health=100 name=tsem_sedivka l1name=horse id=userdata: 05000000000005C8 class=Horse loc=y=2071 x=2276 z=108.2 l2name=horse

    Cheat:spawnEntity("tsem_sedivka", "Horse", "4e5abeff-f19e-0eab-0921-a24611c4ad8f", true, player:GetWorldPos(), 3, 1)

        <skald_character
            migration_string_name="char_KUN_SEDIVKA_migration"
            other_string_name="char_KUN_SEDIVKA_other"
            protection_string_name="char_KUN_SEDIVKA_protections"
            skald_character_full_name_string_name="char_KUN_SEDIVKA_fullName"
            skald_character_name="char_KUN_SEDIVKA"
            streaming_string_name="char_KUN_SEDIVKA_streaming"
            ui_name_string_name="char_KUN_SEDIVKA_uiName"

        <soul
            brain_id="7f6a8b2d-9b2b-4500-9f7b-fc8f3a135029"
            skald_character_name="char_KUN_SEDIVKA"
            social_class_id="97"
            soul_archetype_id="3"
            soul_class_id="7"
            soul_id="4e5abeff-f19e-0eab-0921-a24611c4ad8f"
            soul_name="tsem_sedivka"
            soul_vip_class_id="0"
    ]]
    local params = {
        name = entityName,
        class = entityClass,
        position = Cheat:createSpawnVectorFromVector(avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear),
        orientation = player:GetWorldPos(),
        scale = 1,
        archetype = nil,
        properties = {},
        propertiesInstance = {}
    }

    -- doesn't work
    -- XGenAIModule.SpawnEntity({Name = "Test Pebbles", ClassName = "Horse", SharedSoulGuid = "4e5abeff-f19e-0eab-0921-a24611c4ad8f", Pos = player:GetWorldPos()})

    -- non of these put the correct soul on the entity
    params.soul = entitySoulId
    params.SharedSoulGuid = entitySoulId            -- XGenAIModule.SpawnEntity(spawnParams)
    params.properties.SharedSoulGuid = entitySoulId -- System.SpawnEntity / horse.Properties.sharedSoulGuid /Not on pebbles

    Cheat:logDebug("== spawn params ======================")
    Cheat:tprint(params)
    local entity = System.SpawnEntity(params)
    Cheat:logDebug("== spawned entity ======================")
    Cheat:tprint(entity)

    if entity then
        Cheat:logInfo("Spawned: %s", Cheat:serializeTable(Cheat:getEntityInfo(entity)))
    else
        Cheat:logError("Failed to spawn entity: %s", Cheat:serializeTable(params))
    end

    return entity
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

    local name = Cheat:getFormattedNames(entityInfo.name, entityInfo.lname)
    return string.format("name=%s class=%s loc=%s health=%s",
        name,
        tostring(entityInfo.class),
        tostring(entityInfo.loc),
        tostring(entityInfo.health))
end

function Cheat:getEntityDisplayText(entity)
    return Cheat:getEntityInfoDisplayText(Cheat:getEntityInfo(entity))
end

-- ============================================================================
-- cheat_find_npc
-- ============================================================================
Cheat:createCommand("cheat_find_npc", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
        radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "The search radius around player.") end,
    },
    "Finds NPCs loaded into the world.",
    "Find any NPC with 'hunt' in name", "cheat_find_npc any:hunt",
    "Find NPC with name exact matching 'Bara'", "cheat_find_npc exact:bara",
    "Find all NPCs near player.", "cheat_find_npc radius:5")
function Cheat:cheat_find_npc(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    local npcs = Cheat:findNpcs(searchOperation, c.radius)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(c.radius))
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
Cheat:createCommand("cheat_revive_npc", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
        radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 5, showHelp, "The resurrection radius around player. Default 5.") end,
    },
    "(Does not work yet) Revives dead NPCs by name or within the given radius of the player.",
    "Revive everything.", "cheat_revive_npc radius:200",
    "Revive Father Godwin.", "cheat_revive_npc exact:bara",
    "Revives all bandits near the player.", "cheat_revive_npc any:bandit radius:10")
function Cheat:cheat_revive_npc(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    local npcs = Cheat:findNpcs(searchOperation, c.radius)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(c.radius))
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
-- cheat_target
-- ============================================================================
Cheat:createCommand("cheat_target", nil, "shows information about your current target.")
function Cheat:cheat_target()
    local entity = Cheat:getTargetedEntity()
    if entity then
        Cheat:tprint(entity)
        Cheat:logInfo("Targeted: %s", Cheat:getEntityDisplayText(entity))
    else
        Cheat:logWarn("You are not targeting anything.")
    end
end

-- ============================================================================
-- cheat_kill
-- ============================================================================
Cheat:createCommand("cheat_kill", nil, "Kills the player's current target.")
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
Cheat:createCommand("cheat_mass_kill", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
        radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 10, showHelp, "The kill radius around player. Default 10.") end,
    },
    "Kills all the killable entities within the given radius of the player.",
    "Kill everything within 200 units of player", "cheat_mass_kill radius:200",
    "Kill Bara", "cheat_mass_kill exact:bara",
    "Kills all bandits near the player", "cheat_mass_kill any:bandit radius:20")
function Cheat:cheat_mass_kill(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    local entities = Cheat:findEntities(searchOperation, c.radius, nil)
    if not entities or #entities == 0 then
        Cheat:logWarn("No entities matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(c.radius))
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
Cheat:createCommand("cheat_spawn", {
        id = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The spawn type ID.") end,
        count = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "Number of things to spawn. Default 1.") end,
        radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 10, showHelp, "The spawn radius around the player. Default 10.") end
    },
    "(Working in progress) Spawns entities. Enter the ID (number) from this list:\n" .. Cheat:formatArrayAsList(Cheat.g_soul_category_keys, 3),
    "Spawn 5 pigs within radius 3 of player", "cheat_spawn id:2 count:5 radius:3")
function Cheat:cheat_spawn(c)
    if not Cheat.g_soul_category_keys[c.id] then
        Cheat:logError("Spawn type ID [%s] does not exist.", tostring(c.id))
        return false
    end

    local soulKey = Cheat.g_soul_category_keys[c.id]
    local soulsInfo = Cheat.g_soul_category_database[soulKey]

    if not soulsInfo then
        Cheat:logError("Soul key [%s] not found. (Report this bug)", tostring(soulKey))
        return false
    end

    local soul = soulsInfo.souls[math.random(1, #soulsInfo.souls)]
    local spawned = {}
    for _ = 1, Cheat:max(c.count, 1) do
        local entityName       = nil                   -- auto generate
        local entityClass      = soulsInfo.entityClass -- Lua class name: 'NCP', 'Horse', etc
        local entitySoul       = soul.soul_id          -- pick a random soul
        local avoidSpawnCenter = true                  -- don't spawn on top of player
        local spawnCenter      = player:GetWorldPos()  -- center of spawn area
        local spawnRadius      = c.radius              -- size of spawn area
        local spawnNear        = 0.2                   -- how far from the center we need to be
        local entity           = Cheat:spawnEntity(entityName, entityClass, entitySoul, avoidSpawnCenter, spawnCenter, spawnRadius, spawnNear)
        table.insert(spawned, entity)
    end
    return spawned
end

-- ============================================================================
-- cheat_transfer_items
-- ============================================================================
Cheat:createCommand("cheat_transfer_items", {
    any = function(args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Partial Match NPC Name") end,
    exact = function(args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Accurate matching of NPC names") end,
    to = function(args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 0, showHelp, "Transfer items to self(0), horse(1), stash(2) or delete(-1). Default 0.") end
    },
    "Transfer all items of the target or matching NPC to the player.",
    "Transfer all items from current target to the player", "cheat_transfer_items",
    "Transfer all items from Bara to the player", "cheat_transfer_items exact:bara",
    "Transfer all items from current target to the horse", "cheat_transfer_items to:1",
    "Transfer all items from current target to the stash", "cheat_transfer_items to:2",
    "Delete all items from current target", "cheat_transfer_items to:-1")
function Cheat:cheat_transfer_items(c)
    local search = c.exact and { exact = true, searchKey = c.exact } or
        c.any and { exact = false, searchKey = c.any } or nil

    local npcs = search and Cheat:findNpcs(search, nil) or { Cheat:getTargetedEntity() }

    local to = c.to
    if to < -1 or to > 2 then
        Cheat:logWarn("Invalid transfer target [%s]. Must be 0, 1, 2, or -1.", tostring(to))
        return false
    end
    Cheat:logInfo("Transfer target: %s", to == 0 and "Player" or to == 1 and "Horse" or to == 2 and "Stash" or "Delete")

    if not npcs or #npcs == 0 then
        Cheat:logWarn("Target NPC not found")
        return false
    end

    local target
    local targetInventory
    if to ~= -1 then
        if to == 0 then
            target = player
        elseif to == 1 then
            target = Cheat:getPlayerHorse()
        elseif to == 2 then
            local stashDatabase = Cheat:getStashes({ exact = false, searchKey = nil })
            if not stashDatabase or #stashDatabase == 0 then
                Cheat:logWarn("No stash found.")
                return false
            end
            local stashesInfo = stashDatabase[1]
            if not stashesInfo.stashes or #stashesInfo.stashes == 0 then
                Cheat:logWarn("Stash inventory not found.")
                return false
            end
            local stashInfo = stashesInfo.stashes[1]
            Cheat:logInfo("Opening [%s Stash] (owner=%s type=%s index=%s).", tostring(stashesInfo.name), tostring(stashInfo.stashOwnerName), tostring(c.type), tostring(c.index))
            target = XGenAIModule.GetEntityByWUID(stashInfo.stash:GetInventoryToOpen())
        end

        if not target or not target.inventory or not target.inventory.CreateItem then
            Cheat:logWarn("Target inventory is invalid or does not exist.")
            return false
        end
        targetInventory = target.inventory
    end

    for _, npc in ipairs(npcs) do
        if npc.actor then
            Cheat:logInfo("Processing NPC: %s", Cheat:getEntityDisplayText(npc))
            local inventory = npc.inventory
            if inventory then
                local currentItems = {}
                for _, userdata in pairs(inventory:GetInventoryTable() or {}) do
                    table.insert(currentItems, userdata)
                end

                for _, userdata in ipairs(currentItems) do
                    local itemInstance = ItemManager.GetItem(userdata)
                    if itemInstance then
                        local itemDefinition = Cheat:getItem(itemInstance.class)
                        if itemDefinition then
                            if to ~= -1 then
                                if targetInventory:CreateItem(itemInstance.class, itemInstance.health, itemInstance.amount) then
                                    ItemManager.RemoveItem(userdata)
                                    Cheat:logInfo("Transferred item: %s *%s", itemDefinition.name, itemInstance.amount)
                                    Game.ShowItemsTransfer(itemInstance.class, itemInstance.amount)
                                end
                            else
                                ItemManager.RemoveItem(userdata)
                                Cheat:logInfo("Deleted item: %s *%s", itemDefinition.name, itemInstance.amount)
                            end
                        end
                    end
                end
            else
                Cheat:logWarn("No inventory system for this NPC")
            end
        else
            Cheat:logWarn("Invalid NPC entity: %s", npc.name or "?")
        end
    end
    Cheat:logInfo("All items have been processed.")
    return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_npc.lua loaded")
