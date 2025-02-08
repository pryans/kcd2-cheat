--[[
    Opening paks in mods/Cheat2/data/*.pak
    Loading lua init script for mod cheat2 ...
    Loading and executing script file 'scripts/mods/cheat2.lua'...

    Script.DumpLoadedScripts()
    Script.LoadScript("scripts/Cheat2.lua")
    Script.ReloadScript("scripts/systems/cheat.lua")
    System.LogAlways(cheat.versionMajor)
    for _, item in ipairs(System.ScanDirectory('scripts/', SCANDIR_ALL)) do System.LogAlways(item) end

    for k,v in pairs(System) do System.LogAlways(k) end

    function cheat.test()
    System.LogAlways("test")
]]