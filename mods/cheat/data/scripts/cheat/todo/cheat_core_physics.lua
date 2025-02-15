-- ============================================================================
-- cheat_hover
-- ============================================================================
Cheat.g_cheat_hover_enabled = false
Cheat.g_cheat_hover_force = 1
Cheat.g_cheat_hover_timer_id = nil
Cheat.g_cheat_hover_timer_period_millis = 50

function Cheat:onHover(nTimerId)
  if Cheat.g_cheat_hover_enabled then
    local pos = { x = 0, y = 0, z = 0 }
    CopyVector(pos, player:GetWorldPos());
    player:AwakePhysics(1);
    player:AddImpulse(-1, pos, g_Vectors.v001, player:GetPhysicalStats().mass * Cheat.g_cheat_hover_force);
    Cheat.g_cheat_hover_timer_id = Script.SetTimer(Cheat.g_cheat_hover_timer_period_millis,
      function(nTimerId) Cheat:onHover(nTimerId) end)
  end
end

Cheat:createCommand("cheat_phys_hover", "Cheat:hover()", nil,
  "Use F1 key to toggle hover on and off.\n$8This uses physics to push the player slightly up.\n$8This is intended to be used with F2 push.")
function Cheat:hover()
  if not Cheat.g_cheat_hover_enabled then
    Cheat.g_cheat_hover_enabled = true
    Cheat.g_cheat_hover_timer_id = Script.SetTimer(Cheat.g_cheat_hover_timer_period_millis,
      function(nTimerId) Cheat:onHover(nTimerId) end)
    --Cheat:logInfo("Hover On")
  else
    Cheat.g_cheat_hover_enabled = false
    --Cheat:logInfo("Hover Off")
    if Cheat.g_cheat_hover_timer_id then
      Script.KillTimer(Cheat.g_cheat_hover_timer_id)
      Cheat.g_cheat_hover_timer_id = nil
    end
  end
end

-- ============================================================================
-- cheat_push
-- ============================================================================
Cheat.g_cheat_push_enabled = false
Cheat.g_cheat_push_force = 10
Cheat.g_cheat_push_timer_id = nil
Cheat.g_cheat_push_timer_period_millis = 50

function Cheat:onPush(nTimerId)
  if Cheat.g_cheat_push_enabled then
    local pos = { x = 0, y = 0, z = 0 }
    local dir = { x = 0, y = 0, z = 0 }
    CopyVector(pos, player:GetWorldPos());
    CopyVector(dir, player:GetWorldDir());
    player:AwakePhysics(1);
    player:AddImpulse(-1, pos, dir, player:GetPhysicalStats().mass * Cheat.g_cheat_push_force);
    Cheat.g_cheat_push_timer_id = Script.SetTimer(Cheat.g_cheat_push_timer_period_millis,
      function(nTimerId) Cheat:onPush(nTimerId) end)
  end
end

Cheat:createCommand("cheat_phys_push", "Cheat:push()", nil,
  "Use F2 key to toggle push on and off.\n$8This uses physics to push the player forward.\n$8This is intended to be used with F1 hover.")
function Cheat:push()
  if not Cheat.g_cheat_push_enabled then
    Cheat.g_cheat_push_enabled = true
    Cheat.g_cheat_push_timer_id = Script.SetTimer(Cheat.g_cheat_push_timer_period_millis,
      function(nTimerId) Cheat:onPush(nTimerId) end)
  else
    Cheat.g_cheat_push_enabled = false
    if Cheat.g_cheat_push_timer_id then
      Script.KillTimer(Cheat.g_cheat_push_timer_id)
      Cheat.g_cheat_push_timer_id = nil
    end
  end
end

-- ============================================================================
-- cheat_sprint
-- ============================================================================
Cheat.g_cheat_sprint_enabled = false
Cheat.g_cheat_sprint_force = 8
Cheat.g_cheat_sprint_timer_id = nil
Cheat.g_cheat_sprint_timer_period_millis = 50
Cheat.g_cheat_down_vector = { x = 0, y = 0, z = -1 }

function Cheat:onSprint(nTimerId)
  if Cheat.g_cheat_sprint_enabled then
    local pos = { x = 0, y = 0, z = 0 }
    local dir = { x = 0, y = 0, z = 0 }
    CopyVector(pos, player:GetWorldPos());
    CopyVector(dir, player:GetWorldDir());
    player:AwakePhysics(1);
    -- push player down into the ground for friction
    -- if the player leaves the ground things get crazy
    player:AddImpulse(-1, pos, Cheat.g_cheat_down_vector, player:GetPhysicalStats().mass * 9.81);
    player:AddImpulse(-1, pos, dir, player:GetPhysicalStats().mass * Cheat.g_cheat_sprint_force);
    Cheat.g_cheat_sprint_timer_id = Script.SetTimer(Cheat.g_cheat_sprint_timer_period_millis,
      function(nTimerId) Cheat:onSprint(nTimerId) end)
  end
end

Cheat:createCommand("cheat_phys_sprint", "Cheat:sprint()", nil,
  "Use F3 key to toggle sprinting on and off.\n$8This uses physics to push the player forward (and down for friction).")
function Cheat:sprint()
  if not Cheat.g_cheat_sprint_enabled then
    Cheat.g_cheat_sprint_enabled = true
    Cheat.g_cheat_sprint_timer_id = Script.SetTimer(Cheat.g_cheat_sprint_timer_period_millis,
      function(nTimerId) Cheat:onSprint(nTimerId) end)
  else
    Cheat.g_cheat_sprint_enabled = false
    if Cheat.g_cheat_sprint_timer_id then
      Script.KillTimer(Cheat.g_cheat_sprint_timer_id)
      Cheat.g_cheat_sprint_timer_id = nil
    end
  end
end

-- player.gameParams type = table methods = yes metamethods = no
--    jumpHeight=1
--    sprintMultiplier=1.5
--    strafeMultiplier=.75
--    backwardMultiplier=.7
--    slopeSlowdown=3

-- cheat_eval return player.gameParams.slopeSlowdown
-- ent:AddImpulse( -1, pos, g_Vectors.v001, UpImpulse );
-- cheat_eval Cheat:print_methods(player:GetPhysicalStats())
-- flags=1.84617...
-- gravity=-13
-- mass=80

-- SetCharacterPhysicParams
-- ActivatePlayerPhysics


-- all cheats, don't work
function Cheat:set_timewarp()
  -- Time of fade in during PB time warp defined relative to hit point.
  System.SetCVar("wh_cs_TimeWarpFadeIn", 0)

  --Time of fade out during PB time warp defined relative to hit point.
  System.SetCVar("wh_cs_TimeWarpFadeOut", 0)

  --Time of fade out during PB time warp defined relative to hit point.
  System.SetCVar("wh_cs_TimeWarpDuration", 0)

  --Time warp maximum bias of duration to start or end of hit point (0 / 1).
  System.SetCVar("wh_cs_TimeWarpBias", 0)

  --Speed of PB time warp for player. 1 - disabled
  System.SetCVar("wh_cs_TimeWarpPBFadeSpeedForPlayer", 1)

  --Speed of PB time warp for player's opponent. 1 - disabled
  System.SetCVar("wh_cs_TimeWarpPBFadeSpeedForOpp", 1)

  --Speed of Dodge time warp for player. 1 - disabled
  System.SetCVar("wh_cs_TimeWarpDodgeFadeSpeedForPlayer", 1)

  --Speed of Dodge time warp for player's opponent. 1 - disabled
  System.SetCVar("wh_cs_TimeWarpDodgeFadeSpeedForOpp", 1)

  Cheat:logInfo("done")
end

-- cheat_eval Cheat:cheat_set_player_physics(5,0,0)
function Cheat:cheat_set_player_physics(p_gravity, p_zerog, p_air_control)
  -- does not work
  --System.SetCVar( "p_gravity_z", tonumber(p_gravity))
  --Cheat:logInfo("gravity=" .. tostring(System.GetCVar("p_gravity_z")))
  --return

  local originalFunc = _G["EntityUpdateGravity"]
  _G["EntityUpdateGravity"] = function(ent)
    Cheat:logInfo("new method")

    if ent.type ~= "Player" then
      Cheat:logInfo("calling orig")
      originalFunc(ent)
      return
    end

    Cheat:logInfo("gravity=" .. tostring(ent:GetPhysicalStats().gravity))

    if not ent.TempPhysicsParams then
      ent:AwakePhysics(1);
    end
    ent.TempPhysicsParams = {
      gravity = -p_gravity,
      gravityz = p_gravity,
      freefall_gravityz = p_gravity,
      lying_gravityz = p_gravity,
      zeroG = p_zerog,
      air_control = p_air_control,
    };
    ent:SetPhysicParams(PHYSICPARAM_PLAYERDYN, ent.TempPhysicsParams);
    Cheat:logInfo("gravity=" .. tostring(ent:GetPhysicalStats().gravity))
  end

  EntityUpdateGravity(player)
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_physics.lua loaded")
