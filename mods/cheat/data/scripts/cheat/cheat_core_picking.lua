-- ============================================================================
-- cheat_no_stash_lockpicking
-- ============================================================================
Cheat:createCommand("cheat_no_stash_lockpicking", "Cheat:cheat_no_stash_lockpicking()", nil,
    "Bypass stash lockpicking but consumes a lockpick.\n$8Restarting the game reverts this effect.",
    "Turn off lockpicking minigame on stashes.", "cheat_no_stash_lockpicking")
function Cheat:cheat_no_stash_lockpicking()
    for key, value in pairs(Stash) do
        if key == "OnUsedHold" then
            Stash[key] = function (self, user, slot)
                Cheat:logDebug("Stash:OnUsedHold() Override")
                if (self.nDirection == 0 or self.bNeedUpdate == 1) then
                    return
                end
                local nNewDirection = -self.nDirection
                if (nNewDirection == 1) then
                    if ((self.Properties.Lock.bCanLockPick == true) and (self.bLocked == true)) then
                        if Cheat:hasItem(Cheat.g_lockpick_id) then
                            Cheat:removeItem(Cheat.g_lockpick_id, 1, true)
                            self:Unlock()
                            self:Open(player)
                            Cheat:logDebug("Stash Unlocked")
                        else
                            Cheat:logWarn("Cannot unlock stash, you don't have any lockpicks.")
                            Minigame.StartLockPicking(self.id)
                        end
                    end
                end
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
Cheat:createCommand("cheat_no_door_lockpicking", "Cheat:cheat_no_door_lockpicking()", nil,
    "Bypass door lockpicking but consumes a lockpick.\n$8Restarting the game reverts this effect.",
    "Turn off lockpicking minigame on doors.", "cheat_no_door_lockpicking")
function Cheat:cheat_no_door_lockpicking()
    for key, value in pairs(AnimDoor) do
        if key == "Lockpick" then
            AnimDoor[key] = function (self, user, slot)
                Cheat:logDebug("AnimDoor:Lockpick() Override")
                if self.lockpickable and (self.bLocked == true) and self:IsOnKeySide() == 1 and (self.nUserId == 0) then
                    if Cheat:hasItem(Cheat.g_lockpick_id) then
                        Cheat:removeItem(Cheat.g_lockpick_id, 1, true)
                        self:Unlock()
                        self:OnUsed(user, slot)
                        Cheat:logDebug("Door Unlocked")
                    else
                        Cheat:logWarn("Cannot unlock door, you don't have any lockpicks.")
                        Minigame.StartLockPicking(self.id)
                    end
                end
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
Cheat:createCommand("cheat_no_lockpicking", "Cheat:cheat_no_lockpicking()", nil,
    "Bypass door and stash lockpicking but consumes a lockpick.\n$8Restarting the game reverts this effect.",
    "Turn off lockpicking minigames on doors and stashes.", "cheat_no_lockpicking")
function Cheat:cheat_no_lockpicking()
    Cheat:cheat_no_stash_lockpicking()
    Cheat:cheat_no_door_lockpicking()
    return true
end

-- ============================================================================
-- cheat_no_pickpocketing
-- ============================================================================
Cheat:createCommand("cheat_no_pickpocketing", "Cheat:cheat_no_pickpocketing()", nil,
    "Bypass pickpocketing minigame.\n$8They can still catch you.\n$8Restarting the game reverts this effect.",
    "Turn off pickpocketing minigame.", "cheat_no_pickpocketing")
function Cheat:cheat_no_pickpocketing()
    for key, value in pairs(BasicAIActions) do
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
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_picking.lua loaded")
