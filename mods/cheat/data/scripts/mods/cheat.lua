Cheat = {}
Cheat.version = "__VERSION__"
Cheat.runTests = "__RUNTESTS__"

function Cheat:loadFile(file)
    System.LogAlways("Loading file [" .. tostring(file) .. "] ...")
    Script.ReloadScript(file)
end

function Cheat:autoexec()
    Cheat:logInfo("Running Autoexec")

    local autoexecFile = "scripts/cheat/autoexec.txt"
    local autoexecCommands = System.LoadTextFile(autoexecFile)
    if not autoexecCommands or Cheat:isBlank(autoexecCommands) then
        Cheat:logWarn("Autoexe file [%s] is empty.", autoexecFile)
        return false
    end

    local count = 0
    for line in string.gmatch(autoexecCommands, "([^\n]*)\n?") do
        local commandLine = Cheat:trimToNil(line)
        if commandLine then
            if not Cheat:startsWith(commandLine, "#") then
                count = count + 1
                Cheat:logInfo("Running command [%s]", commandLine)
                System.ExecuteCommand(commandLine)
            else
                Cheat:logInfo("Skipping comment [%s]", commandLine)
            end
        end
    end

    Cheat:logInfo("Autoexec completed running [%] commands.", count)
end

function Cheat:onInit()
    System.LogAlways("Cheat:OnInit")

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
    Cheat:loadFile("scripts/cheat/cheat_core_teleport.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_horse.lua")

    -- todo next
    Cheat:loadFile("scripts/cheat/cheat_core_perks.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_skills.lua")

    --Cheat:loadFile("scripts/cheat/cheat_core_factions.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_merchants.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_physics.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_quests.lua")

    Cheat:logInfo("Loaded KCD2 Cheat version %s", Cheat.version)
end

function Cheat:onSystemStarted()
    Cheat:logDebug("Cheat:onSystemStarted")

    Cheat:initLocalizationDatabase()

    -- these databases use the localization database
    Cheat:initBuffDatabase()
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

    if Cheat.runTests then
        Cheat:beginTestSuite(false)

        Cheat:test_args()
        Cheat:test_core_player()
        Cheat:test_core_buffs()
        Cheat:test_core_skills()
        Cheat:test_core_items()
        Cheat:test_core_time()
        Cheat:test_core_weather()
        Cheat:test_core_picking()
        Cheat:test_core_storage()

        Cheat:endTestSuite()
    else
        Cheat:cheat_timer(true)
        Cheat:autoexec()
    end
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
