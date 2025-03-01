-- ============================================================================
-- cheat_reveal_map
-- ============================================================================
Cheat:createCommand("cheat_reveal_map", nil,
    "Adds a perk/buff to reveal all maps.\n" ..
    "$4This retroactively impacts all saves on the playline and cannot be undone.",
    "Reveal the maps", "cheat_reveal_map")
function Cheat:cheat_reveal_map(c)
    --  <buff buff_class_id="4" buff_exclusivity_id="1" buff_id="fc4f748f-2057-4919-b327-db1893356c39" buff_lifetime_id="1" buff_name="perk_discoverer" buff_ui_type_id="4" duration="-1" icon_id="0" implementation="Cpp:ReadingCartographer" is_persistent="true" />
    -- #player.soul:RemovePerk("34e03c47-de53-482f-b3f5-555e7e36d70c");player.soul:RemoveAllBuffsByGuid("fc4f748f-2057-4919-b327-db1893356c39")
    -- player.soul:RemoveAllBuffsByGuid("fc4f748f-2057-4919-b327-db1893356c39")
    player.soul:AddPerk("34e03c47-de53-482f-b3f5-555e7e36d70c")
    Cheat:logInfo("Map revealed.")
    return true
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_map.lua loaded")
