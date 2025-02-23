-- ============================================================================
-- find_faction
-- ============================================================================
function Cheat:find_faction(searchKey)
  local searchKeyUpper = nil
  local faction_id = nil
  local faction_name = nil

  if not Cheat:isBlank(searchKey) then
    searchKeyUpper = Cheat:toUpper(tostring(searchKey))
  end

  for i, faction in ipairs(RPG.GetFactions()) do
    local found = false

    if not Cheat:isBlank(searchKeyUpper) then
      if Cheat:toUpper(tostring(faction:GetId())) == searchKeyUpper then
        found = true
      end

      if string.find(Cheat:toUpper(faction:GetName()), searchKeyUpper, 1, true) then
        found = true
      end
    else
      found = true
    end

    if found then
      faction_id = faction:GetId()
      faction_name = faction:GetName()
      local faction_rep = faction:GetReputation()
      local faction_base_rep = faction:GetBaseReputation()
      local faction_angriness = faction:GetAngriness()
      Cheat:logInfo("Found faction id=[%s] name=[%s] rep=[%s] baserep=[%s] angriness=[%s]",
        tostring(faction_id), tostring(faction_name), tostring(faction_rep), tostring(faction_base_rep),
        tostring(faction_angriness))
    end
  end
  Cheat:logDebug("Returning faction [%s] with id [%s].", tostring(faction_name), tostring(faction_id))
  return faction_id, faction_name
end

-- ============================================================================
-- faction_add_rep
-- ============================================================================
function Cheat:faction_add_rep(key, val)
  local faction_id, faction_name = Cheat:find_faction(key)
  if faction_id then
    local faction = RPG.GetFactionById(faction_id)
    faction:AddReputation(tonumber(val))
    Cheat:logInfo("Added [%s] reputation to faction [%s].", tostring(val), tostring(faction_name))
    Cheat:find_faction(faction_id)
  end
end

-- ============================================================================
-- faction_add_angriness
-- ============================================================================
function Cheat:faction_add_angriness(key, val)
  local faction_id, faction_name = Cheat:find_faction(key)
  if faction_id then
    local faction = RPG.GetFactionById(faction_id)
    faction:AddAngriness(tonumber(val))
    Cheat:logInfo("Added [%s] angriness to faction [%s].", tostring(val), tostring(faction_name))
    Cheat:find_faction(faction_id)
  end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_factions.lua loaded")
