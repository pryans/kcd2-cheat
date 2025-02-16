-- ============================================================================
-- cheat_teleport
-- ============================================================================
Cheat:createCommand("cheat_teleport", nil,
    "Teleports the player to the given (x,y,z) coordinates.\n" ..
    "$8Save and use immortality to avoid instant death when teleporting to unknow locations.\n" ..
    "$8Supports any format in x,y,z order. 1 2 3 | 1,2,3 | x:1 y:2 z:3",
    "Type to console", "cheat_teleport 2460 1995 112")
function Cheat:cheat_teleport(c)
    local target = Cheat:stringToVector(c.line)
    player:SetWorldPos(target);
    Cheat:logInfo("Teleported to:", Cheat:serializeTable(target))
end

-- ============================================================================
-- cheat_teleport_to_checkpoint
-- ============================================================================
Cheat:createCommand("cheat_teleport_to_checkpoint", nil,
    "Teleport to your map checkpoint. Open your map and right click to place a checkpoint (red flag).")
function Cheat:cheat_teleport_to_checkpoint()
    if not Cheat.g_map_cursor_point then
        Cheat:logError("Mark a checkpoint on your map.")
        System.ExecuteCommand("cheat_teleport_to_checkpoint ?")
        return false
    end

    local groundHeight = Cheat:getGroundHeight(Cheat.g_map_cursor_point.x, Cheat.g_map_cursor_point.y)
    if not groundHeight then
        Cheat:logError("No ground detected under map checkpoint.")
        return false
    end

    player:SetWorldPos({ Cheat.g_map_cursor_point.x, Cheat.g_map_cursor_point.y, groundHeight + 0.2 });
    return true
end

-- ============================================================================
-- cheat_teleport_npc_to_loc
-- ============================================================================
Cheat:createCommand("cheat_teleport_npc_to_loc", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
        x = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "X coordinate.") end,
        y = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Y coordinate.") end,
        z = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Z coordinate.") end,
        radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1.5, showHelp, "The teleport radius around the x,y,z target. Default 1.5.") end,
        max = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The maximum NPCs to teleport. Default 1.") end
    },
    "Teleports one or more NPCs to the given coordinates. Use cheat_loc to get locations.",
    "Teleport Bara to somewhere...", "cheat_teleport_npc_to_loc exact:Bara x:2344 y:2052 z:108")
function Cheat:cheat_teleport_npc_to_loc(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_teleport_npc_to_loc ?")
        return false, nil
    end

    local npcs = Cheat:findNpcs(searchOperation)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(c.radius))
        return false, nil
    end

    local teleportCount = 0
    for _, npc in ipairs(npcs) do
        if teleportCount < c.max then
            npc:SetWorldPos(Cheat:createSpawnVectorFromPosition(false, c.x, c.y, c.z, c.radius, 0));
            teleportCount = teleportCount + 1
            Cheat:logInfo("Teleported NPC: %s", Cheat:getEntityDisplayText(npc))
        else
            break
        end
    end
    return true, npcs
end

-- ============================================================================
-- cheat_teleport_npc_to_player
-- ============================================================================
Cheat:createCommand("cheat_teleport_npc_to_player", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
        radius = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1.5, showHelp, "The teleport radius around the player. Default 1.5") end,
        max = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The maximum NPCs to teleport. Default 1.") end
    },
    "Teleports one or more NPCs to the player's location.",
    "Teleport Bara to the player.", "cheat_teleport_npc_to_player exact:bara",
    "Teleport all bandits to the player.", "cheat_teleport_npc_to_player any:bandit radius:50")
function Cheat:cheat_teleport_npc_to_player(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_teleport_npc_to_player ?")
        return false, nil
    end

    local npcs = Cheat:findNpcs(searchOperation)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(c.radius))
        return false, nil
    end

    local playerPosition = player:GetWorldPos();
    local teleportCount = 0
    for _, npc in ipairs(npcs) do
        if teleportCount < c.max then
            npc:SetWorldPos(Cheat:createSpawnVectorFromVector(true, playerPosition, c.radius, 0.2));
            teleportCount = teleportCount + 1
            Cheat:logInfo("Teleported: %s", Cheat:getEntityDisplayText(npc))
        else
            break
        end
    end
    return true, npcs
end

-- ============================================================================
-- cheat_teleport_to_npc
-- ============================================================================
Cheat:createCommand("cheat_teleport_to_npc", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    },
    "Finds an NPC or list of NPCs and teleports to any of them.\n" ..
    "$8This only works if the NPC has been loaded into the world.\n" ..
    "$8Defaults to last NPC in the list if no num argument received.",
    "Teleport to Bara", "cheat_teleport_to_npc exact:bara")
function Cheat:cheat_teleport_to_npc(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_teleport_to_npc ?")
        return false, nil
    end

    local npcs = Cheat:findNpcs(searchOperation)
    if not npcs or #npcs == 0 then
        Cheat:logWarn("No NPCs matching [%s] found in radius [%s].", Cheat:serializeTable(searchOperation), tostring(c.radius))
        return false, nil
    end

    player:SetWorldPos(Cheat:createSpawnVectorFromVector(true, npcs[1]:GetWorldPos(), 1, 0.2));
    Cheat:logInfo("Teleported to NPC: %s", Cheat:getEntityDisplayText(npcs[1]))
    return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_teleport.lua loaded")
