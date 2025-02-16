Cheat.g_no_lockpicks_required = false
Cheat.cheat_picking_args = {
    nolockpicks = function (args, name, showHelp) return Cheat:argsGetOptionalBoolean(args, name, false, showHelp, "If true, lockpicks are not required to bypass minigamee.") end
}

-- ============================================================================
-- helpers
-- ============================================================================

local fakeStash = {
    id = 1234,
    nDirection = -1,
    bNeedUpdate = 0,
    Properties = {
        Lock = {
            bCanLockPick = true
        }
    },
    bLocked = true,
    Unlock = function () end,
    Open = function (player) end
}

local fakeDoor = {
    id = 1234,
    lockpickable = true,
    bLocked = true,
    IsOnKeySide = function ()
        return 1
    end,
    nUserId = 0,
    Unlock = function ()
    end,
    OnUsed = function (user, slot)
    end
}

function Cheat:lockpickStash(s, user, slot)
    Cheat:logDebug("Stash:OnUsedHold() Override")
    Cheat:logDebug("nDirection=%s", tostring(s.nDirection))
    Cheat:logDebug("bNeedUpdate=%s", tostring(s.bNeedUpdate))
    Cheat:logDebug("bCanLockPick=%s", tostring(s.Properties.Lock.bCanLockPick))
    Cheat:logDebug("bLocked=%s", tostring(s.bLocked))

    if (s.nDirection == 0 or s.bNeedUpdate == 1) then
        return false
    end
    local nNewDirection = -s.nDirection
    if (nNewDirection == 1) then
        if ((s.Properties.Lock.bCanLockPick == true) and (s.bLocked == true)) then
            Cheat:logDebug("Stash:OnUsedHold() Inside")
            if Cheat.g_no_lockpicks_required or Cheat:hasItem(Cheat.g_lockpick_id) then
                if Cheat.g_no_lockpicks_required or Cheat:removeItemById(Cheat.g_lockpick_id, 1, false, true, true) then
                    s:Unlock()
                    s:Open(player)
                    Cheat:logDebug("Stash Unlocked")
                    return true
                end
            else
                Cheat:logWarn("Cannot unlock stash, you don't have any lockpicks.")
                Minigame.StartLockPicking(s.id)
            end
        end
    end
    return false
end

function Cheat:lockpickDoor(s, user, slot)
    Cheat:logDebug("AnimDoor:Lockpick() Override")
    Cheat:logDebug("lockpickable=%s", tostring(s.lockpickable))
    Cheat:logDebug("bLocked=%s", tostring(s.bLocked))
    Cheat:logDebug("IsOnKeySide=%s", tostring(s:IsOnKeySide()))
    Cheat:logDebug("nUserId=%s", tostring(s.nUserId))

    if s.lockpickable and (s.bLocked == true) and s:IsOnKeySide() == 1 and (s.nUserId == 0) then
        Cheat:logDebug("AnimDoor:Lockpick() Inside")
        if Cheat.g_no_lockpicks_required or Cheat:hasItem(Cheat.g_lockpick_id) then
            if Cheat.g_no_lockpicks_required or Cheat:removeItemById(Cheat.g_lockpick_id, 1, false, true, true) then
                s:Unlock()
                s:OnUsed(user, slot)
                Cheat:logDebug("Door Unlocked")
                return true
            end
        else
            Cheat:logWarn("Cannot unlock door, you don't have any lockpicks.")
            Minigame.StartLockPicking(s.id)
        end
    end
    return false
end

-- ============================================================================
-- cheat_no_stash_lockpicking
-- ============================================================================
Cheat:createCommand("cheat_no_stash_lockpicking", Cheat.cheat_picking_args,
    "Bypass stash lockpicking but consumes a lockpick.\n" ..
    "$4Restarting the game reverts this effect.",
    "Turn off lockpicking minigame on stashes", "cheat_no_stash_lockpicking",
    "Turn off lockpicking minigame on stashes and disable lockpick requirement", "cheat_no_stash_lockpicking nolockpicks:true")
function Cheat:cheat_no_stash_lockpicking(c)
    Cheat.g_no_lockpicks_required = c.nolockpicks

    for key, value in pairs(Stash) do
        if key == "OnUsedHold" then
            Stash[key] = function (self, user, slot)
                Cheat:lockpickStash(self, user, slot)
            end
            Cheat:logDebug("Replaced Stash:OnUsedHold() function.")
        end
    end
    Cheat:logInfo("Stash Lockpicking Disabled")
    return true
end

-- ============================================================================
-- cheat_no_door_lockpicking
-- ============================================================================
Cheat:createCommand("cheat_no_door_lockpicking", Cheat.cheat_picking_args,
    "Bypass door lockpicking but consumes a lockpick.\n" ..
    "$4Restarting the game reverts this effect.",
    "Turn off lockpicking minigame on doors", "cheat_no_door_lockpicking",
    "Turn off lockpicking minigame on doors and disable lockpick requirement", "cheat_no_door_lockpicking nolockpicks:true")
function Cheat:cheat_no_door_lockpicking(c)
    Cheat.g_no_lockpicks_required = c.nolockpicks

    for key, value in pairs(AnimDoor) do
        if key == "Lockpick" then
            AnimDoor[key] = function (self, user, slot)
                Cheat:lockpickDoor(self, user, slot)
            end
            Cheat:logDebug("Replaced AnimDoor:Lockpick() function.")
        end
    end
    Cheat:logInfo("Door Lockpicking Disabled")
    return true
end

-- ============================================================================
-- cheat_no_lockpicking
-- ============================================================================
Cheat:createCommand("cheat_no_lockpicking", Cheat.cheat_picking_args,
    "Bypass door and stash lockpicking but consumes a lockpick.\n" ..
    "$4Restarting the game reverts this effect.",
    "Turn off lockpicking minigames on doors and stashes", "cheat_no_lockpicking",
    "Turn off lockpicking minigames on doors and stashes and disable lockpick requirement", "cheat_no_lockpicking nolockpicks:true")
function Cheat:cheat_no_lockpicking(c)
    Cheat:proxy("cheat_no_stash_lockpicking", "nolockpicks:" .. tostring(c.nolockpicks))
    Cheat:proxy("cheat_no_door_lockpicking", "nolockpicks:" .. tostring(c.nolockpicks))
    return true
end

-- ============================================================================
-- cheat_no_pickpocketing
-- ============================================================================
Cheat:createCommand("cheat_no_pickpocketing", nil,
    "Bypass pickpocketing minigame, however NPCs can still notice you committing a crime.\n" ..
    "$4Restarting the game reverts this effect.",
    "Turn off pickpocketing minigame", "cheat_no_pickpocketing")
function Cheat:cheat_no_pickpocketing()
    for key, _ in pairs(BasicAIActions) do
        if key == "OnPickpocketing" then
            BasicAIActions[key] = function (self, user, slotId)
                Cheat:logDebug("BasicAIActions:OnPickpocketing() Override")
                self.actor:RequestItemExchange(user.id);
            end
            Cheat:logDebug("Replaced BasicAIActions:OnPickpocketing() function.")
        end
    end
    Cheat:logInfo("Pickpocketing Disabled")
    return true
end

-- ============================================================================
-- test_core_picking
-- ============================================================================
function Cheat:test_core_picking()
    Cheat:beginTest("test_core_picking")
    Cheat:removeAllItems()

    Cheat.g_no_lockpicks_required = true
    Cheat:testAssert("Cheat:lockpickStash", Cheat:lockpickStash(fakeStash, nil, nil))
    Cheat:testAssert("Cheat:lockpickDoor", Cheat:lockpickDoor(fakeDoor, nil, nil))

    Cheat.g_no_lockpicks_required = false
    Cheat:addItemByName("lockpick", 2, 1, nil, false, false, true)
    Cheat:testAssert("Cheat:lockpickStash", Cheat:lockpickStash(fakeStash, nil, nil))
    Cheat:testAssert("Cheat:lockpickDoor", Cheat:lockpickDoor(fakeDoor, nil, nil))

    -- no lockpicks
    Cheat:testAssertFalse("Cheat:lockpickStash", Cheat:lockpickStash(fakeStash, nil, nil))
    Cheat:testAssertFalse("Cheat:lockpickDoor", Cheat:lockpickDoor(fakeDoor, nil, nil))

    Cheat:testAssert("cheat_no_stash_lockpicking 1", Cheat:proxy("cheat_no_stash_lockpicking", "nolockpicks:true"))
    Cheat:testAssert("cheat_no_stash_lockpicking 2", Cheat.g_no_lockpicks_required)
    Cheat:testAssert("cheat_no_stash_lockpicking 3", Cheat:proxy("cheat_no_stash_lockpicking", "nolockpicks:false"))
    Cheat:testAssertFalse("cheat_no_stash_lockpicking 4", Cheat.g_no_lockpicks_required)

    Cheat:testAssert("cheat_no_door_lockpicking 1", Cheat:proxy("cheat_no_door_lockpicking", "nolockpicks:true"))
    Cheat:testAssert("cheat_no_door_lockpicking 2", Cheat.g_no_lockpicks_required)
    Cheat:testAssert("cheat_no_door_lockpicking 3", Cheat:proxy("cheat_no_door_lockpicking", "nolockpicks:false"))
    Cheat:testAssertFalse("cheat_no_door_lockpicking 4", Cheat.g_no_lockpicks_required)

    Cheat:testAssert("cheat_no_lockpicking 1", Cheat:proxy("cheat_no_lockpicking", "nolockpicks:true"))
    Cheat:testAssert("cheat_no_lockpicking 2", Cheat.g_no_lockpicks_required)
    Cheat:testAssert("cheat_no_lockpicking 3", Cheat:proxy("cheat_no_lockpicking", "nolockpicks:false"))
    Cheat:testAssertFalse("cheat_no_lockpicking 4", Cheat.g_no_lockpicks_required)

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_picking.lua loaded")
