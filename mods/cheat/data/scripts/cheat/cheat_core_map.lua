--[[

wh_rpg_undiscoverAll
Undiscover all POI and locations.

wh_rpg_discoverLocation
Discover a named RPG location.

wh_rpg_discoverAll
Reveal and discover all POI and locations.

wh_rpg_dumpLocations
Dump all RPG locations.

wh_rpg_resetLocations
Reset all RPG locations.

wh_rpg_getLocation
Get current RPG location.

wh_rpg_removePOI
Remove procedural POI.

wh_rpg_discoverPOI
Discover all POI.

wh_rpg_discover
Reveal only positions of all POI and locations.

player_revealFow
Reveals fog of war over the entire map.

]]

-- ============================================================================
-- cheat_reveal_map
-- ============================================================================
Cheat:createCommand("cheat_reveal_map", nil,
    "Adds a perk/buff to reveal all maps.$4 This cannot be undone.",
    "Reveal the maps", "cheat_reveal_map")
function Cheat:cheat_reveal_map(c)
    player.soul:AddPerk("34e03c47-de53-482f-b3f5-555e7e36d70c")
    Cheat:logInfo("Map revealed.")
    return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_map.lua loaded")
