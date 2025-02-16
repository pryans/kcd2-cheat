-- ============================================================================
-- cheat_teleport
-- ============================================================================
Cheat:createCommand("cheat_teleport", {
        x = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "X coordinate") end,
        y = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Y coordinate") end,
        z = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "Z coordinate") end
    },
    "Teleports the player to the given coordinates.\n" ..
    "$8You can end up in the air or under the map.\n" ..
    "$8I suggest saving your game and turn on immortality first.",
    "Type to console", "cheat_teleport x:3000 y:1500 z:300")
function Cheat:teleport(c)
    player:SetWorldPos({ x = c.x, y = c.y, z = c.z });
    Cheat:logInfo("Teleported to x=%d y=%d z=%d", c.x, c.y, c.z)
end

-- ============================================================================
-- cheat_teleport_to_checkpoint
-- ============================================================================
Cheat:createCommand("cheat_teleport_to_checkpoint", nil, "Teleport to your map checkpoint.")
function Cheat:cheat_teleport_to_checkpoint()
    if not Cheat.g_map_cursor_point then
        Cheat:logError("Mark a checkpoint on your map.")
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
-- cheat_teleport_to_npc
-- ============================================================================
Cheat:createCommand("cheat_teleport_to_npc", {

    },
    "Finds an NPC or list of NPCs and teleports to any of them.\n" ..
    "$8This only works if the NPC has been loaded into the world.\n" ..
    "$8Defaults to last NPC in the list if no num argument received.",
    "Teleport to Bara", "cheat_tp_to_npc exact:bara")
function Cheat:cheat_teleport_to_npc(c)
    -- TODO
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_teleport.lua loaded")
