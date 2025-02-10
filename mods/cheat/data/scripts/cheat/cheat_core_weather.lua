Cheat.g_weather = {}
table.insert(Cheat.g_weather, "cloudless_sunny")
table.insert(Cheat.g_weather, "cloudless_sunny_B")
table.insert(Cheat.g_weather, "semicloudy_clear")
table.insert(Cheat.g_weather, "semicloudy_clear_B")
table.insert(Cheat.g_weather, "cloudy_no_rain")
table.insert(Cheat.g_weather, "cloudy_no_rain_B")
table.insert(Cheat.g_weather, "cloudy_no_rain_C")
table.insert(Cheat.g_weather, "cloudy_frequent_showers")
table.insert(Cheat.g_weather, "cloudy_frequent_showers_B")
table.insert(Cheat.g_weather, "foggy_drizzly_light")
table.insert(Cheat.g_weather, "foggy_drizzly")
table.insert(Cheat.g_weather, "foggy_drizzly_B")
table.insert(Cheat.g_weather, "foggy_storm")
table.insert(Cheat.g_weather, "foggy_storm_B")
table.insert(Cheat.g_weather, "foggy_storm_no_rain")
table.insert(Cheat.g_weather, "dream")
table.insert(Cheat.g_weather, "x_enviro_probe_burnin")
table.insert(Cheat.g_weather, "q_M01_M02_dreamy_moonlight")
table.insert(Cheat.g_weather, "q_M02_dark_woods")
table.insert(Cheat.g_weather, "q_M10_Godwin_intermission")
table.insert(Cheat.g_weather, "q_M12_Apolena_night")
table.insert(Cheat.g_weather, "q_M12_Trosky")
table.insert(Cheat.g_weather, "q_M31_Suchdol_arrival")
table.insert(Cheat.g_weather, "q_M44_Burning_Maleshov")
table.insert(Cheat.g_weather, "q_M48_foggy_no_rain")
table.insert(Cheat.g_weather, "q_M50_desperate_defence")
table.insert(Cheat.g_weather, "q_S31_storm_no_rain")
table.insert(Cheat.g_weather, "q_S50_Tonies")
table.insert(Cheat.g_weather, "q_dream")
table.insert(Cheat.g_weather, "x_UI_tod")
table.insert(Cheat.g_weather, "summer_overcast")
table.insert(Cheat.g_weather, "summer_overcast_B")
table.insert(Cheat.g_weather, "summer_overcast_B_no_rain")

-- ============================================================================
-- cheat_set_weather
-- ============================================================================
Cheat.cheat_set_weather_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The weather type ID.") end,
    transition = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 30, showHelp, "The number of real world seconds to transition the weather. Default 30.") end,
}
Cheat:createCommand("cheat_set_weather", "Cheat:cheat_set_weather(%line)", Cheat.cheat_set_weather_args,
    "Sets the weather to the given weather ID.\n" .. Cheat:formatArrayAsList(Cheat.g_weather, 3),
    "Set weather to foggy storm", "cheat_set_weather id:6")
function Cheat:cheat_set_weather(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_weather_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local transition, transitionErr = Cheat:argsGet(args, "transition")
    if idErr or transitionErr then
        return false
    end

    if not Cheat.g_weather[id] then
        Cheat:logError("Weather ID [%s] does not exist.", tostring(id))
        return false
    end

    EnvironmentModule.BlendTimeOfDay(Cheat.g_weather[id], transition * Calendar.GetWorldTimeRatio(), true)
    Cheat:logInfo("Set weather to [%s].", Cheat.g_weather[id])
    return true
end

-- ============================================================================
-- test_core_weather
-- ============================================================================
function Cheat:test_core_weather()
    Cheat:beginTest("cheat_set_weather")

    Cheat:testAssertFalse("cheat_set_weather invalid 1", Cheat:cheat_set_weather(""))
    Cheat:testAssertFalse("cheat_set_weather invalid 2", Cheat:cheat_set_weather("id:-1"))
    Cheat:testAssertFalse("cheat_set_weather invalid 3", Cheat:cheat_set_weather("id:1 transition:abc"))
    Cheat:testAssert("cheat_set_weather 1", Cheat:cheat_set_weather("id:1 transition:0"))

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_weather.lua loaded")
