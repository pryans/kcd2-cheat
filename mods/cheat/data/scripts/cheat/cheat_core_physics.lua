Cheat.g_cheat_hover_enabled = false
Cheat.g_cheat_push_enabled = false
Cheat.g_cheat_sprint_enabled = false
Cheat.g_physics_tick = 0
Cheat.g_physics_tick_rate = 60
Cheat.g_physics_timer_delay = 1000 / Cheat.g_physics_tick_rate
Cheat.g_physics_timer = nil
Cheat.g_physics_hover_force = 9.81 / Cheat.g_physics_tick_rate
Cheat.g_physics_push_force = 3
Cheat.g_physics_sprint_force = 4
Cheat.g_physics_down_force = 9.8 / Cheat.g_physics_tick_rate

CHEAT_GLOBAL_PHYSICS_CALLBACK = function (nTimerId)
    local usingPhysics = Cheat.g_cheat_hover_enabled or Cheat.g_cheat_push_enabled or Cheat.g_cheat_sprint_enabled
    local mass = player:GetPhysicalStats().mass
    local upDir = { x = 0, y = 0, z = 1 }
    local downDir = { x = 0, y = 0, z = -1 }
    local hoverForce = mass * Cheat.g_physics_hover_force
    local pushForce = mass * Cheat.g_physics_push_force
    local sprintForce = mass * Cheat.g_physics_sprint_force
    local downForce = mass * Cheat.g_physics_down_force

    if usingPhysics then
        player:AwakePhysics(1)

        if Cheat.g_cheat_hover_enabled then
            player:AddImpulse(-1, player:GetWorldPos(), upDir, hoverForce);
        end

        if Cheat.g_cheat_push_enabled then
            player:AddImpulse(-1, player:GetWorldPos(), player:GetWorldDir(), pushForce);
        end

        if Cheat.g_cheat_sprint_enabled then
            -- push player down into the ground for friction
            -- if the player leaves the ground things get crazy
            player:AddImpulse(-1, player:GetWorldPos(), downDir, downForce);
            player:AddImpulse(-1, player:GetWorldPos(), player:GetWorldDir(), sprintForce);
        end
    else
        -- normal walking uses physics? turning this off breaks normal movement
        --player:AwakePhysics(0)
    end

    Script.SetTimer(Cheat.g_physics_timer_delay, CHEAT_GLOBAL_PHYSICS_CALLBACK)
    Cheat.g_physics_tick = Cheat.g_physics_tick + 1
end

function Cheat:startPhysics()
    if not Cheat.g_physics_timer then
        Script.KillTimer(Cheat.g_physics_timer)
    end
    Cheat.g_physics_timer = Script.SetTimer(0, CHEAT_GLOBAL_PHYSICS_CALLBACK)
end

function Cheat:stopPhysics()
    if Cheat.g_physics_timer then
        Script.KillTimer(Cheat.g_physics_timer)
    end
    Cheat.g_physics_timer = nil
end

-- ============================================================================
-- cheat_hover
-- ============================================================================
Cheat:createCommand("cheat_phys_hover", nil, "Uses the physics system to make the player hover.\n$8This is a toggle command.\n$8This command is intended to be bound to a key.")
function Cheat:cheat_phys_hover()
    if not Cheat.g_cheat_hover_enabled then
        Cheat.g_cheat_hover_enabled = true
    else
        Cheat.g_cheat_hover_enabled = false
    end
end

-- ============================================================================
-- cheat_push
-- ============================================================================
Cheat:createCommand("cheat_phys_push", nil, "Uses the physics system to push the player in the direction they are looking.\n$8This is a toggle command.\n$8This command is intended to be bound to a key.")
function Cheat:cheat_phys_push()
    if not Cheat.g_cheat_push_enabled then
        Cheat.g_cheat_push_enabled = true
    else
        Cheat.g_cheat_push_enabled = false
    end
end

-- ============================================================================
-- cheat_sprint
-- ============================================================================
Cheat:createCommand("cheat_phys_sprint", nil, "Uses the physics system to push the player in the direction they are looking (and down for friction).\n$8This is a toggle command.\n$8This command is intended to be bound to a key.")
function Cheat:cheat_phys_sprint()
    if not Cheat.g_cheat_sprint_enabled then
        Cheat.g_cheat_sprint_enabled = true
    else
        Cheat.g_cheat_sprint_enabled = false
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_physics.lua loaded")
