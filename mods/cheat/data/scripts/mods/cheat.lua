Cheat = {}
Cheat.version = "__VERSION__"
Cheat.isCommandLineBuild = false
Cheat.devHome = "E:/KCD2Modding/kcd2-cheat"
Cheat.commands = {}

function Cheat:loadFile(file)
    System.LogAlways("Loading file [" .. tostring(file) .. "] ...")
    Script.ReloadScript(file)
end

function Cheat:onInit()
    --System.LogAlways("Cheat:OnInit")
    Cheat:loadFile("scripts/cheat/cheat_util.lua")
    Cheat:loadFile("scripts/cheat/cheat_args.lua")
    Cheat:loadFile("scripts/cheat/cheat_localization.lua")
    Cheat:loadFile("scripts/cheat/cheat_debug.lua")
    Cheat:loadFile("scripts/cheat/cheat_stubs.lua")
    Cheat:loadFile("scripts/cheat/cheat_console.lua")

    Cheat:loadFile("scripts/cheat/cheat_core_buffs.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_items.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_map.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_npc.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_picking.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_player.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_time.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_weather.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_storage.lua")

    -- todo next
    Cheat:loadFile("scripts/cheat/cheat_core_perks.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_skills.lua")

    --Cheat:loadFile("scripts/cheat/cheat_core_factions.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_horses.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_merchants.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_physics.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_quests.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_teleport.lua")

    Cheat:logInfo("Loaded KCD2 Cheat version %s", Cheat.version)

    --[[

    Cheat:test_core_player()
    Cheat:test_core_buffs()
    Cheat:test_core_items()
    Cheat:test_core_time()
    Cheat:test_core_weather()
    Cheat:test_core_picking()
    Cheat:test_core_storage()

    ]]
end

function Cheat:onSystemStarted()
    Cheat:logDebug("Cheat:onSystemStarted")

    Cheat:initLocalizationDatabase()

    -- these databases use the localization database
    Cheat:initItemDatabase()
    Cheat:initSoulsDatabase()
end

function Cheat:onQuickLoadingStart()
    Cheat:logDebug("Cheat:onQuickLoadingStart")
end

function Cheat:onLoadingComplete()
    Cheat:logDebug("Cheat:onLoadingComplete")
end

function Cheat:onGameplayStarted()
    Cheat:logDebug("Cheat:onGameplayStarted")
    Cheat:cheat_timer(true)
end

function Cheat:onGamePause()
    Cheat:logDebug("Cheat:onGamePause")
    Cheat:cheat_timer(false)
end

function Cheat:onGameResume()
    Cheat:logDebug("Cheat:onGameResume")
    Cheat:cheat_timer(true)
end

Cheat:onInit()
