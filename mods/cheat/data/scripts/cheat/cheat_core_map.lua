-- ============================================================================
-- cheat_reveal_map
-- ============================================================================
Cheat:createCommand("cheat_reveal_map", "Cheat:cheat_reveal_map()", nil,
  "Reveals the entire map (removes fog of war).",
  "Reveal the entire map", "cheat_reveal_map")
function Cheat:cheat_reveal_map()
  Cheat:cheat_add_perk("id:34e03c47-de53-482f-b3f5-555e7e36d70c")
  Cheat:logInfo("Map revealed.")
  return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_map.lua loaded")
