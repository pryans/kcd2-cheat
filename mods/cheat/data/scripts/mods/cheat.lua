Cheat = {}
Cheat.version = "__VERSION__"

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
    Cheat:loadFile("scripts/cheat/cheat_debug.lua")
    Cheat:loadFile("scripts/cheat/cheat_console.lua")

    Cheat:loadFile("scripts/cheat/cheat_localization.lua")

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
    Cheat:loadFile("scripts/cheat/cheat_core_perks.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_skills.lua")
    Cheat:loadFile("scripts/cheat/cheat_core_physics.lua")

    --Cheat:loadFile("scripts/cheat/cheat_core_factions.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_merchants.lua")
    --Cheat:loadFile("scripts/cheat/cheat_core_quests.lua")

    -- do last so we can setup default bindings for some console commands
    Cheat:loadFile("scripts/cheat/cheat_core_actions.lua")

    -- default bindings before autoexec so mod users can reset all the defaults if they want
    Cheat:registerAction("5", "press", function () Cheat:cheat_save() end)

    Cheat:logInfo("Loaded KCD2 Cheat version %s", Cheat.version)
end

function Cheat:loadDatabases()
    Cheat:initLocalizationDatabase()

    -- these databases use the localization database
    Cheat:initSoulsDatabase()
    Cheat:initBuffDatabase()
    Cheat:initPerkDatabase()
    Cheat:initSkillDatabase()
    Cheat:initItemDatabase()
end

function Cheat:dumpDatabases()
    local getCSVSafeString = function (value)
        value = Cheat:trimToNil(tostring(value))
        if value then
            -- value = string.gsub(value, ",", "\\,") -- not needed with double quotes
            value = string.gsub(value, "\"", "")
            return "\"" .. value .. "\""
        else
            return ""
        end
    end

    local getLocalizedDesc = function (database, soulNameKey, soulDescKey)
        local soulDescSearchKeys = {}
        if soulDescKey then
            table.insert(soulDescSearchKeys, soulDescKey)
        elseif soulNameKey then
            local soulDescKey1 = soulNameKey .. "_desc"
            local soulDescKey2 = string.gsub(soulNameKey, "_name", "_desc")
            table.insert(soulDescSearchKeys, soulDescKey1)
            table.insert(soulDescSearchKeys, soulDescKey2)
        else
            return ""
        end

        local lnames = Cheat:findLocalizedNames({ database }, soulDescSearchKeys)
        local lname = ""
        if lnames then
            if lnames.l2name then
                lname = lnames.l2name
            elseif lnames.l1name then
                lname = lnames.l1name
            end
        end
        return lname
    end

    -- buffs
    System.LogAlways("_BEGIN_BUFFS_")
    System.LogAlways(string.format("id,name,params,description"))
    for _, buff in ipairs(Cheat.g_buff_database) do
        local id = getCSVSafeString(buff.buff_id)
        local name = getCSVSafeString(Cheat:getLocalizedBuffName(buff))
        local params = getCSVSafeString(buff.buff_params)
        local desc = getCSVSafeString(getLocalizedDesc(Cheat.g_localization_soul_database, nil, buff.buff_desc))
        System.LogAlways(string.format("%s,%s,%s,%s", id, name, params, desc))
    end
    System.LogAlways("_END_BUFFS_")

    -- perks
    System.LogAlways("_BEGIN_PERKS_")
    System.LogAlways(string.format("id,name,description"))
    for _, perk in ipairs(Cheat.g_perk_database) do
        local id = getCSVSafeString(perk.perk_id)
        local name = getCSVSafeString(Cheat:getLocalizedPerkName(perk))
        local desc = getCSVSafeString(getLocalizedDesc(Cheat.g_localization_soul_database, nil, perk.perk_ui_desc))
        System.LogAlways(string.format("%s,%s,%s", id, name, desc))
    end
    System.LogAlways("_END_PERKS_")

    -- skills
    System.LogAlways("_BEGIN_SKILLS_")
    System.LogAlways(string.format("id,name,description"))
    for _, skill in ipairs(Cheat.g_skill_database) do
        local id = getCSVSafeString(skill.skill_id)
        local name = getCSVSafeString(Cheat:getLocalizedSkillName(skill))
        local desc = getCSVSafeString(getLocalizedDesc(Cheat.g_localization_soul_database, nil, skill.skill_desc_nolevel))
        System.LogAlways(string.format("%s,%s,%s", id, name, desc))
    end
    System.LogAlways("_END_SKILLS_")

    -- items
    System.LogAlways("_BEGIN_ITEMS_")
    System.LogAlways(string.format("id,name,description"))
    for _, item in ipairs(Cheat.g_item_database) do
        local id = getCSVSafeString(item.id)
        local name = getCSVSafeString(Cheat:getLocalizedItemName(item))
        local desc = getCSVSafeString(getLocalizedDesc(Cheat.g_localization_item_database, nil, item.uiinfo))
        System.LogAlways(string.format("%s,%s,%s", id, name, desc))
    end
    System.LogAlways("_END_ITEMS_")

    System.LogAlways("Dump Finished")
end

function Cheat:runTestSuite()
    Cheat:beginTestSuite(false)

    Cheat:test_args()
    Cheat:test_localization()

    Cheat:test_core_player()
    Cheat:test_core_buffs()
    Cheat:test_core_perks()
    Cheat:test_core_skills()
    Cheat:test_core_items()
    Cheat:test_core_time()
    Cheat:test_core_weather()
    Cheat:test_core_picking()
    Cheat:test_core_storage()

    Cheat:endTestSuite()
end

function Cheat:onSystemStarted()
    Cheat:logDebug("Cheat:onSystemStarted")
    Cheat:loadDatabases()
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
    Cheat:startPhysics()
    Cheat:autoexec()
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
