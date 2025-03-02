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
