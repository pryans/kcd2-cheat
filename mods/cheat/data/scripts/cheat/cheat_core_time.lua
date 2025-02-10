-- ============================================================================
-- cheat_get_time
-- ============================================================================
Cheat:createCommand("cheat_get_time", "Cheat:cheat_get_time()", nil,
    "Logs information about game time.",
    "Get game time", "cheat_get_time")
function Cheat:cheat_get_time()
    local gameTimeInSeconds = Calendar.GetWorldTime()
    local days = math.floor(gameTimeInSeconds / 86400)
    local hours = (gameTimeInSeconds / 3600) % 24
    local minutes = (gameTimeInSeconds / 60) % 60
    local seconds = gameTimeInSeconds % 60
    local time = string.format("days=%.3d time=%.2d:%.2d:%.2d speed=%d worldTimePaused=%s", days, hours, minutes, seconds, Calendar.GetWorldTimeRatio(), tostring(Calendar.IsWorldTimePaused()))
    Cheat:logInfo("Current game time: %s", time)
    return true;
end

-- ============================================================================
-- cheat_set_time
-- ============================================================================
Cheat.cheat_set_time_args = {
    hours = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The number of hours.") end,
}
Cheat:createCommand("cheat_set_time", "Cheat:cheat_set_time(%line)", Cheat.cheat_set_time_args,
    "Moved time forward the given number of hours.",
    "Move 5 hours forward", "cheat_set_time hours:5")
function Cheat:cheat_set_time(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_time_args)
    local hours, hoursErr = Cheat:argsGet(args, "hours")
    if hoursErr then
        return false
    end

    Cheat:cheat_get_time()
    Calendar.SetWorldTime(Calendar.GetWorldTime() + (hours * 3600))
    XGenAIModule.SendMessageToEntity(player.this.id, "timekeeper:recalculate", "");
    Cheat:logInfo("Time moved forward [%s] hours.", tostring(hours))
    Cheat:cheat_get_time()
    return true
end

-- ============================================================================
-- cheat_set_time_speed
-- ============================================================================
Cheat.cheat_set_time_speed_args = {
    ratio = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The ratio between real time and game time. Default 15.") end,
}
Cheat:createCommand("cheat_set_time_speed", "Cheat:cheat_set_time_speed(%line)", Cheat.cheat_set_time_speed_args,
    "Set the game time speed as a ratio between real time and game time.\n$8A high ratio, like 1000, is faster. Default is 15.",
    "Speed up game time", "cheat_set_time_speed ratio:1000")
function Cheat:cheat_set_time_speed(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_time_speed_args)
    local ratio, ratioErr = Cheat:argsGet(args, "ratio")
    if ratioErr then
        return false
    end

    if ratio < 0 then
        ratio = 0
    end

    Calendar.SetWorldTimeRatio(ratio)
    Cheat:logInfo("Set game speed to [%s].", tostring(ratio))

    if ratio == 0 then
        if not Calendar.IsFakedTimeOfDay() then
            Calendar.SetFakeTimeOfDay(Calendar.GetWorldHourOfDay())
        end
    else
        if Calendar.IsFakedTimeOfDay() then
            Calendar.UnfakeTimeOfDay()
        end
    end

    Cheat:cheat_get_time()
    return true
end

-- ============================================================================
-- test_core_time
-- ============================================================================
function Cheat:test_core_time()
    Cheat:beginTest("test_core_time")

    -- cheat_get_time
    Cheat:testAssert("cheat_get_time", Cheat:cheat_get_time())

    -- cheat_set_time
    Cheat:testAssertFalse("cheat_set_time invalid 1", Cheat:cheat_set_time(""))
    Cheat:testAssertFalse("cheat_set_time invalid 2", Cheat:cheat_set_time("hours:"))
    Cheat:testAssertFalse("cheat_set_time invalid 3", Cheat:cheat_set_time("hours:asdv"))

    local expected = Cheat:truncate(Calendar.GetWorldHourOfDay() + 1)
    Cheat:testAssert("cheat_set_time 1", Cheat:cheat_set_time("hours:1"))
    Cheat:testAssert("cheat_set_time 2", expected == Cheat:truncate(Calendar.GetWorldHourOfDay()))

    -- cheat_set_time_speed
    Cheat:testAssertFalse("cheat_set_time_speed invalid 1", Cheat:cheat_set_time_speed(""))
    Cheat:testAssertFalse("cheat_set_time_speed invalid 2", Cheat:cheat_set_time_speed("ratio:"))
    Cheat:testAssertFalse("cheat_set_time_speed invalid 3", Cheat:cheat_set_time_speed("ratio:asdv"))

    Cheat:testAssert("cheat_set_time_speed 1", Cheat:cheat_set_time_speed("ratio:30"))
    Cheat:testAssert("cheat_set_time_speed 2", Calendar.GetWorldTimeRatio() == 30)
    Cheat:testAssertFalse("cheat_set_time_speed 3", Calendar.IsFakedTimeOfDay())

    Cheat:testAssert("cheat_set_time_speed 1", Cheat:cheat_set_time_speed("ratio:0"))
    Cheat:testAssert("cheat_set_time_speed 2", Calendar.GetWorldTimeRatio() == 0)
    Cheat:testAssert("cheat_set_time_speed 3", Calendar.IsFakedTimeOfDay())

    Cheat:testAssert("cheat_set_time_speed reset", Cheat:cheat_set_time_speed("ratio:15"))

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_time.lua loaded")
