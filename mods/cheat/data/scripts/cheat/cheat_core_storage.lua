-- ============================================================================
-- helpers
-- ============================================================================
Cheat.g_stash_types = {
    Master = 1,
    Owned  = 2,
    World  = 3,
}

Cheat.g_stash_last_opened = nil

function Cheat:getStashes(searchOperation)
    local stashDatabase = {}
    for name, id in pairs(Cheat.g_stash_types) do
        stashDatabase[id] = { name = name, stashes = {} }
    end

    for _, stash in pairs(System.GetEntitiesByClass("Stash")) do
        local data = {}
        data.pos = stash:GetWorldPos()
        data.name = Cheat:getLocalizedName(stash) or "none"
        data.distance = Cheat:distanceToPlayer(stash)
        data.stashWuid = XGenAIModule.GetMyWUID(stash)
        data.stashOwnerWuid = XGenAIModule.GetOwner(data.stashWuid)
        data.stashOwnerName = Cheat:getLocalizedName(XGenAIModule.GetEntityByWUID(data.stashOwnerWuid)) or "none"
        data.stashHome = XGenAIModule.FindLinks(data.stashOwnerWuid, "home")
        data.masterLinks = XGenAIModule.FindLinks(data.stashWuid, "masterStash")
        data.slaveLinks = XGenAIModule.FindLinks(data.stashWuid, "slaveStash")
        data.isMasterStash = #data.masterLinks > 0 or #data.slaveLinks > 0
        data.playerWuid = XGenAIModule.GetMyWUID(player)
        data.stash = stash

        local type = nil
        if data.isMasterStash then
            type = Cheat.g_stash_types.Master
            data.stashOwnerName = "Player"
        elseif data.stashOwnerWuid == data.playerWuid then
            type = Cheat.g_stash_types.Owned
            data.stashOwnerName = "Player"
        else
            type = Cheat.g_stash_types.World
        end

        if type and stashDatabase[type] then
            local matched = false
            local shouldLog = false

            -- no point in filtering player stashes
            if type > 2 and searchOperation and searchOperation.searchKey then
                local searchKeyLower = Cheat:toLower(searchOperation.searchKey)
                local nameLower = Cheat:toLower(data.name)
                local ownerLower = Cheat:toLower(data.stashOwnerName)
                if searchOperation.exact then
                    if nameLower == searchKeyLower or ownerLower == searchKeyLower then
                        shouldLog = true
                        matched = true
                    end
                else
                    if string.find(nameLower, searchKeyLower, 1, true) or string.find(ownerLower, searchKeyLower, 1, true) then
                        shouldLog = true
                        matched = true
                    end
                end
            else
                matched = true
            end

            if matched then
                table.insert(stashDatabase[type].stashes, data)
                if shouldLog then
                    Cheat:logInfo("%s Stash: index=%s owner=%s pos=%s distance=%s name=%s",
                        tostring(stashDatabase[type].name),
                        tostring(#stashDatabase[type].stashes),
                        tostring(data.stashOwnerName),
                        tostring(Cheat:serializeTable(data.pos)),
                        tostring(data.distance),
                        tostring(data.name))
                end
            end
        else
            Cheat:logError("Unknown stash type [%s].", tostring(type))
        end
    end

    return stashDatabase
end

-- ============================================================================
-- cheat_stash
-- ============================================================================
Cheat.cheat_stash_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    type = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The stash type: 1=master(default), 2=owned, 3=world") end,
    index = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The stash index.") end
}
Cheat:createCommand("cheat_stash", "Cheat:cheat_stash(%line)", Cheat.cheat_stash_args,
    "Opens your master stash by default. Can open any stash.",
    "Open your master stash", "cheat_stash",
    "Open your 1st owned stash", "cheat_stash type:2 index:1",
    "Open your 1st world stash", "cheat_stash type:3 index:1")
function Cheat:cheat_stash(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_stash_args, "cheat_stash")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    local type, typeErr = Cheat:argsGet(args, "type")
    local index, indexErr = Cheat:argsGet(args, "index")
    if anyErr or exactErr or typeErr or indexErr then
        return false
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    else
        searchOperation = { exact = false, searchKey = nil }
    end

    local stashDatabase = Cheat:getStashes(searchOperation)

    Cheat:logInfo("==== Stash Stats ====")
    for id, stashInfo in pairs(stashDatabase) do
        local rangeMax = #stashInfo.stashes
        local rangeMin = math.min(1, rangeMax)
        local range = ""
        if rangeMax > 0 then
            range = string.format("index:%d-%d", rangeMin, rangeMax)
        end
        Cheat:logInfo("name=%s type=%s count=%s %s",
            tostring(stashInfo.name),
            tostring(id),
            tostring(rangeMax),
            tostring(range))
    end

    if stashDatabase[type] then
        local stashesInfo = stashDatabase[type]
        if stashesInfo.stashes[index] then
            local stashInfo = stashesInfo.stashes[index]
            --Cheat:tprint(stashInfo)
            Cheat:logInfo("Opening [%s Stash] (owner=%s type=%s index=%s).",
                tostring(stashesInfo.name), tostring(stashInfo.stashOwnerName), tostring(type), tostring(index))

            if Cheat.g_stash_last_opened and Cheat.g_stash_last_opened.beingUsedByPlayer then
                Cheat:logWarn("Close the current stash.")
                return false
            end
            Cheat.g_stash_last_opened = stashInfo.stash
            stashInfo.stash:Open(player)
            return true
        else
            Cheat:logError("Invalid stash index. (type=%s index=%s).", tostring(type), tostring(index))
            return false
        end
    else
        Cheat:logError("Invalid stash type. (type=%s index=%s).", tostring(type), tostring(index))
        return false
    end
end

-- ============================================================================
-- cheat_inventory
-- ============================================================================
Cheat.cheat_inventory_args = {
    any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
    exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end
}
Cheat:createCommand("cheat_inventory", "Cheat:cheat_inventory(%line)", Cheat.cheat_inventory_args,
    "Opens the targeted or matching NPC's inventory.",
    "Open a random horse's inventory", "cheat_inventory any:horse",
    "Open Bara's inventory", "cheat_inventory exact:bara",
    "Open inventory of current target", "cheat_inventory")
function Cheat:cheat_inventory(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_inventory_args, "cheat_inventory")
    local any, anyErr = Cheat:argsGet(args, "any")
    local exact, exactErr = Cheat:argsGet(args, "exact")
    if anyErr or exactErr then
        return false, nil
    end

    local searchOperation = nil
    if exact then
        searchOperation = { exact = true, searchKey = exact }
    elseif any then
        searchOperation = { exact = false, searchKey = any }
    end

    local npcs = {}
    if searchOperation then
        npcs = Cheat:findNpcs(searchOperation, nil)
        if not npcs or #npcs == 0 then
            Cheat:logWarn("No NPCs matching [%s] found.", Cheat:serializeTable(searchOperation))
            return false
        end
    else
        local target = Cheat:getTargetedEntity()
        if target then
            table.insert(npcs, target)
        else
            Cheat:logWarn("You don't have a target.")
            return false
        end
    end

    local npc = npcs[#npcs]
    if npc.actor then
        Cheat:logInfo("Opening inventory of NPC: %s", Cheat:getEntityDisplayText(npc))
        npc.actor:RequestItemExchange(player.id);
        return true
    else
        Cheat:logWarn("No inventory for NPC: %s", Cheat:getEntityDisplayText(npc))
        return false
    end
end

-- ============================================================================
-- test_core_storage
-- ============================================================================
function Cheat:test_core_storage()
    Cheat:beginTest("test_core_storage")

    Cheat:testAssert("cheat_stash", Cheat:cheat_stash())
    Cheat:testAssert("cheat_inventory", Cheat:cheat_inventory("cheat_inventory exact:bara"))

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_storage.lua loaded")
