-- ============================================================================
-- cheat_teleport
-- ============================================================================
Cheat.cheat_teleport_args = {
    x = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "X coordinate") end,
    y = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "Y coordinate") end,
    z = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, nil, showHelp, "Z coordinate") end
}

Cheat:createCommand("cheat_teleport", "Cheat:teleport(%line)", Cheat.cheat_teleport_args,
"Teleports the player to the given coordinates.\n$8You can end up in the air or under the map.\n$8I suggest saving your game and turn on immortality first.",
"Type to console", "cheat_teleport x:3000 y:1500 z:300", "Move only one axis", "cheat_teleport z:200")
function Cheat:teleport(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_teleport_args)
    local loc = player:GetWorldPos();
    local nx, nxErr = Cheat:argsGet(args, "x")
    local ny, nyErr = Cheat:argsGet(args, "y")
    local nz, nzErr = Cheat:argsGet(args, "z")
    if nxErr and not nyErr and not nzErr then
        return false, nil
    end

    local newX = nx or loc.x
    local newY = ny or loc.y
    local newZ = nz or loc.z

    player:SetWorldPos({ x = newX, y = newY, z = newZ });
    Cheat:logInfo("Teleported player to x=%d y=%d z=%d", newX, newY, newZ)
end

-- ============================================================================
-- cheat_teleport_trosky and cheat_teleport_kuttenberg
-- ============================================================================

Cheat.cheat_teleport_places = {
    default_arg = "place",
    place = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Place to teleport to") end,
}

function Cheat:init_teleport_places_trosky()
    self.places_trosky = {
        { name = "Apollonia", x = 2804, y = 2087, z = 110 },
        { name = "Apollonia", x = 2763, y = 2482, z = 117, comment = "Hermit" },
        { name = "Bozhena", x = 1497, y = 1984, z = 17 },
        { name = "Capon's Camp", x = 2547, y = 3041, z = 92 },
        { name = "Kuttenberg Cart", x = 2644, y = 1531, z = 88 },
        { name = "Nevabok", x = 2088, y = 1344, z = 15, comment = "Mill"},
        { name = "Nevabok", x = 1932, y = 1142, z = 52, comment = "Fortress"},
        { name = "Nomad's camp", x = 1062, y = 1884, z = 31 },
        { name = "Rocktower Pond", x = 733, y = 1879, z = 12 },
        { name = "Schdiar - West Farm", x = 2405, y = 1420, z = 67 },
        { name = "Semine", x = 1613, y = 1594, z = 78 },
        { name = "Semine", x = 1136, y = 1392, z = 11, comment = "Lower Mill" },
        { name = "Tachov", x = 1991, y = 2510, z = 115 },
        { name = "Troskowitz", x = 2314, y = 2045, z = 107 },
        { name = "Trosky", x = 2419, y = 2652, z = 199 },
        { name = "Vidlak Pond", x = 1248, y = 2692, z = 19,},
        { name = "Zhelejov", x = 1773, y = 1976, z = 42 },
        { name = "Zhelejov", x = 1658, y = 2161, z = 34, comment = "Wagoners' Inn" },
    }

    local helpText = "Teleports the player to the given place in Trosky region.\nDo not use in Kuttenberg region\n$8\n$8\n$8Supported places:\n$8"
    helpText = helpText .. Cheat:printLocations(self.places_trosky)

    --System.AddCCommand('cheat_teleport_trosky', 'Cheat:teleport_to(%line)', helpText)
    Cheat:createCommand("cheat_teleport_trosky", "Cheat:teleport_trosky(%line)", Cheat.cheat_teleport_places, helpText,
        "Teleport to Apollonia", "cheat_teleport_trosky apollonia",
        "Teleport to Apollonia (Hermit)", "cheat_teleport_trosky apollonia hermit",
        "Teleport to Bozhena", "cheat_teleport_trosky 3",
        "Teleport to saved location 'saved 1'", "cheat_teleport_trosky saved 1")
end

function Cheat:init_teleport_places_kuttenberg()
    self.places_kuttenberg = {
        { name = "Bohunowitz", x = 1993, y = 3441, z = 103 },
        { name = "Bylany", x = 1699, y = 1035, z = 102 },
        { name = "Danemark", x = 1589, y = 183, z = 57 },
        { name = "Devil's Den", x = 2905, y = 2919, z = 107 },
        { name = "Grund", x = 3215, y = 2187, z = 95 },
        { name = "Horschan", x = 2617, y = 2628, z = 133 },
        { name = "Kuttenberg", x = 3168, y = 678, z = 52, comment = "Center"},
        { name = "Kuttenberg", x = 3182, y = 973, z = 56, comment = "Northern entrance"},
        { name = "Kuttenberg", x = 3168, y = 333, z = 29, comment = "Southern entrance"},
        { name = "Kuttenberg", x = 2967, y = 907, z = 66, comment = "Western entrance"},
        { name = "Maleshov", x = 555, y = 354, z = 111 },
        { name = "Miskowitz", x = 1554, y = 1981, z = 145 },
        { name = "Pschitoky", x = 2301, y = 1824, z = 130 },
        { name = "Old Kutna", x = 3068, y = 1358, z = 101 },
        { name = "Old Lhota", x = 627, y = 947, z = 97 },
        { name = "Opatowitz", x = 1789, y = 2972, z = 159 },
        { name = "Raborsch", x = 1576, y = 3813, z = 114 },
        { name = "Sigismund Camp", x = 1664, y = 2808, z = 184, comment = "Center"},
        { name = "Sigismund Camp", x = 1764, y = 2732, z = 171, comment = "Eastern entrance"},
        { name = "Sigismund Camp", x = 1724, y = 2852, z = 172, comment = "Northern entrance"},
        { name = "Sigismund Camp", x = 1642, y = 2736, z = 185, comment = "Southern entrance"},
        { name = "Sigismund Camp", x = 1576, y = 2823, z = 189, comment = "Western entrance"},
        { name = "Suchdol", x = 698, y = 3287, z = 141 },
        { name = "Sedletz Monastery", x = 3898, y = 749, z = 29 },
        { name = "Trosky Cart", x = 439, y = 3729, z = 132 },
        { name = "Wysoka", x = 425, y = 2489, z = 219 },
    }

    local helpText = "Teleports the player to the given place in Kuttenberg region.\nDo not use in Trosky region\n$8\n$8\n$8Supported places:\n$8"
    helpText = helpText .. Cheat:printLocations(self.places_kuttenberg)

    --System.AddCCommand('cheat_teleport_to', 'Cheat:teleport_to(%line)', helpText)
    Cheat:createCommand("cheat_teleport_kuttenberg", "Cheat:teleport_kuttenberg(%line)", Cheat.cheat_teleport_kuttenberg_args, helpText,
        "Teleport to Bohunowitz", "cheat_teleport_kuttenberg place:bohunowitz",
        "Teleport to Bylany", "cheat_teleport_kuttenberg bylany",
        "Teleport to Danemark", "cheat_teleport_kuttenberg 3",
        "Teleport to saved location 'saved 1'", "cheat_teleport_kuttenberg saved 1")
end

Cheat:init_teleport_places_trosky()
Cheat:init_teleport_places_kuttenberg()

function Cheat:teleport_trosky(line)
    Cheat:teleport_to_places(line, self.places_trosky, {
        region = "trosky",
    })
end

function Cheat:teleport_kuttenberg(line)
    Cheat:teleport_to_places(line, self.places_kuttenberg, {
        region = "kuttenberg",
    })
end

function Cheat:teleport_to_places(line, places, options)
    if player.soul:GetGender() == 2 then
        Cheat:logError("You can't use this command while playing Thereza!")
        return
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_teleport_places)
    local placeArg = Cheat:argsGet(args, "place")

    if places[tonumber(placeArg)] ~= nil then
        local place = places[tonumber(placeArg)]
        local placeName = place.name
        if place.comment ~= nil then
            placeName = placeName .. " (" .. place.comment .. ")"
        end
        Cheat:logDebug("Teleporting to %s", placeName)
        Cheat:teleport("x:" .. place.x .. " y:" .. place.y .. " z:" .. place.z)
        return nil
    else
        Cheat:logDebug("Checking saved locations for [%s].", placeArg)
        if Cheat.saved_locations and Cheat.saved_locations[placeArg] ~= nil then
            Cheat:logDebug("Found saved location for [%s].", placeArg)
            player:SetWorldPos(Cheat.saved_locations[placeArg]);
            return nil
        end

        for k, place in ipairs(places) do
            local placeFullName = place.name
            if place.comment ~= nil then
                placeFullName = placeFullName .. " " .. place.comment
            end
            if Cheat:toUpper(placeArg) == Cheat:toUpper(placeFullName) then
                Cheat:teleport("x:" .. place.x .. " y:" .. place.y .. " z:" .. place.z)
                return nil
            end
        end
    end
    Cheat:logError("Invalid Place - For a list of supported places type: 'cheat_teleport_%s ?'", options.region)
end

-- ============================================================================
-- cheat_tp_bc (BANDIT CAMPS)
-- ============================================================================
Cheat.cheat_tp_bc_args = {
    id = function(args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to bandit camp") end,
}

Cheat:createCommand("cheat_tp_bc", "Cheat:tp_bc(%line)", Cheat.cheat_tp_bc_args,
"Teleports the player to the given bandit camp.\n$8\n$8\n$8By the pond bandit camp",
"Type to console", "cheat_tp_bc id:1")
function Cheat:tp_bc(line)
    local gender = player.soul:GetGender()
    local args = Cheat:argsProcess(line, Cheat.cheat_tp_bc_args)
    local nplace, nplaceErr = Cheat:argsGet(args, 'id')

    local places = {}
    places["1"] = "x:902 y:1994 z:13"

    if gender ~= 2 then
        if not nplaceErr then
            if places[Cheat:toUpper(nplace)] ~= nil then
                Cheat:teleport(places[Cheat:toUpper(nplace)])
            else
                Cheat:logError("Invalid Camp - For a list of supported camps type: 'cheat_tp_bc ?'")
            end
        end
    else
        Cheat:logError("You can't use this command while playing Thereza!")
    end
end
-- ============================================================================
-- cheat_tp_bh (BATH HOUSES)
-- ============================================================================
Cheat.cheat_tp_bh_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to bath house") end,
}

--[[
Cheat:createCommand("cheat_tp_bh", "Cheat:tp_bh(%line)", Cheat.cheat_tp_bh_args,
    "Teleports the player to the given bath house.\n$8\n$8\n$8Supported places:\n$8LEDETCHKO (1), RATTAY (2), SASAU (3), TALMBERG (4)",
    "Type to console", "cheat_tp_bh id:1")
]]
function Cheat:tp_bh(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local gender = player.soul:GetGender()
    local args = Cheat:argsProcess(line, Cheat.cheat_tp_bh_args)
    --local args = string.gsub(tostring(line), "place:", "")
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    local places = {}
    places["1"] = "x:2042 y:1282 z:28"
    places["2"] = "x:2380 y:595 z:31"
    places["3"] = "x:959 y:1317 z:19"
    places["4"] = "x:2390 y:2810 z:89"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid Bath House - For a list of supported bath houses type: 'cheat_tp_bh ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_cb (CHARCOAL-BURNER CAMPS)
-- ============================================================================
Cheat.cheat_tp_cb_args = {
    id = function (args, name, showHelp)
        return Cheat:argsGetRequired(args, name, showHelp,
            "Teleport to charcoal-burner camp")
    end,
}

--[[
Cheat:createCommand("cheat_tp_cb", "Cheat:tp_cb(%line)", Cheat.cheat_tp_cb_args,
    "Teleports the player to the given charcoal-burner camp.\n$8\n$8\n$8Supported places:\n$8NEUHOF NORTH (1), NEUHOF SOUTH (2), RATTAY (3), ROVNA (4), SASAU (5), TALMBERG (6)",
    "Type to console", "cheat_tp_cb id:1")
]]
function Cheat:tp_cb(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_cb_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    local places = {}
    places["1"] = "x:3256 y:2122 z:127"
    places["2"] = "x:3634 y:942 z:86"
    places["3"] = "x:1909 y:677 z:28"
    places["4"] = "x:1316 y:3316 z:62"
    places["5"] = "x:343 y:1981 z:18"
    places["6"] = "x:2695 y:2317 z:102"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid Camp - For a list of supported camps type: 'cheat_tp_cb ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_ee (EASTER EGGS)
-- ============================================================================

-- Many thanks to the people of the Kingdom Come: Deliverance Wiki for collecting all the cool easter eggs
-- I didn't include easter eggs for wich a dlc is required (Drone, Spooky Camera)
-- For more Information visit: https://kingdom-come-deliverance.fandom.com/wiki/Easter_eggs

Cheat.cheat_tp_ee_args = {
    id = function (args, name, showHelp)
        return Cheat:argsGetRequired(args, name, showHelp,
            "Teleport to charcoal-burner camp")
    end,
}

--[[
Cheat:createCommand("cheat_tp_ee", "Cheat:tp_ee(%line)", Cheat.cheat_tp_ee_args,
    "Teleports the player to the given easter egg location.\n$8\n$8\n$8Supported places:\n$8HANSEL AND GRETEL (1), HARRY POTTER (2), OTASÁNEK (3), THE GODFATHER (4),\n$8UFO (5), WOLVERINE (6), DEAD WITCH (7), GRIFFIN NEST (8), PILE OF TIRES (9),\n$8SECRET CHURCH CHEST (10), MURDERER'S HOUSE (11), TRAFFIC CONE I (12), TRAFFIC CONE II (13)",
    "Type to console", "cheat_tp_ee id:1")
]]
function Cheat:tp_ee(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_ee_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    local places = {}
    places["1"] = "x:2787 y:3147 z:142"
    places["2"] = "x:411 y:1229 z:18"
    places["3"] = "x:3474 y:430 z:131"
    places["4"] = "x:3671 y:3299 z:153"
    places["5"] = "x:2750 y:152 z:146"
    places["6"] = "x:3529 y:2007 z:155"
    places["7"] = "x:3470 y:904 z:77"
    places["8"] = "x:2350 y:1510 z:65"
    places["9"] = "x:231 y:2185 z:72"
    places["10"] = "x:2500 y:581 z:87"
    places["11"] = "x:3298 y:313 z:106"
    places["12"] = "x:1423 y:634 z:132"
    places["13"] = "x:2256 y:2008 z:131"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid easter egg - For a list of supported easter egg locations type: 'cheat_tp_ee ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_gn (WOODLAND GARDENS)
-- ============================================================================
Cheat.cheat_tp_gn_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to garden") end,
}

--[[
Cheat:createCommand("cheat_tp_gn", "Cheat:tp_gn(%line)", Cheat.cheat_tp_gn_args,
    "Teleports the player to the given woodland garden.\n$8Use a number between 1 and 38 to teleport to a specific garden",
    "Type to console", "cheat_tp_gn id:1")
]]
function Cheat:tp_gn(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_gn_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    -- Credit goes to https://kingdomcomemap.github.io/#1.97/2325.6/1592.8
    -- one garden was doubled. Removed it (WileCoyote68)
    local places = {}
    places["1"] = "x:974 y:3896 z:62"
    places["2"] = "x:427 y:3670 z:40"
    places["3"] = "x:1205 y:3681 z:32"
    places["4"] = "x:128 y:3326 z:109"
    places["5"] = "x:2330 y:3518 z:160"
    places["6"] = "x:3554 y:3581 z:156"
    places["7"] = "x:2812 y:3233 z:151"
    places["8"] = "x:3092 y:2675 z:179"
    places["9"] = "x:3632 y:2622 z:168"
    places["10"] = "x:1731 y:2977 z:132"
    places["11"] = "x:1630 y:2868 z:122"
    places["12"] = "x:1215 y:2641 z:27"
    places["13"] = "x:1917 y:2553 z:128"
    places["14"] = "x:2617 y:2459 z:136"
    places["15"] = "x:924 y:2356 z:50"
    places["16"] = "x:991 y:2321 z:55"
    places["17"] = "x:957 y:2275 z:62"
    places["18"] = "x:1181 y:2151 z:74"
    places["19"] = "x:541 y:1850 z:83"
    places["20"] = "x:1484 y:1764 z:35"
    places["21"] = "x:1102 y:1252 z:43"
    places["22"] = "x:784 y:908 z:124"
    places["23"] = "x:1204 y:744 z:66"
    places["24"] = "x:1581 y:1272 z:36"
    places["25"] = "x:1897 y:1064 z:29"
    places["26"] = "x:2307 y:616 z:40"
    places["27"] = "x:2836 y:766 z:94"
    places["28"] = "x:3143 y:504 z:71"
    places["29"] = "x:3170 y:331 z:137"
    places["30"] = "x:3604 y:725 z:102"
    places["31"] = "x:3803 y:1121 z:107"
    places["32"] = "x:3830 y:1681 z:121"
    places["33"] = "x:3280 y:1979 z:154"
    places["34"] = "x:2868 y:1626 z:131"
    places["35"] = "x:2572 y:1871 z:138"
    places["36"] = "x:2559 y:2031 z:162"
    places["37"] = "x:2159 y:1524 z:65"
    places["38"] = "x:1860 y:1519 z:80"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid Garden - For a list of supported gardens type: 'cheat_tp_gn ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_hl (HERBALISTS)
-- ============================================================================
Cheat.cheat_tp_hl_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to herbalist") end,
}

--[[
Cheat:createCommand("cheat_tp_hl", "Cheat:tp_hl(%line)", Cheat.cheat_tp_hl_args,
    "Teleports the player to the given herbalist.\n$8\n$8\n$8Supported herbalists:\n$8GERTRUDE (1), KUNHUTA (2), NEUHOF (3), SAMOPESH (4)",
    "Type to console", "cheat_tp_hl id:1")
]]
function Cheat:tp_hl(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_hl_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    local places = {}
    places["1"] = "x:2318 y:3295 z:150"
    places["2"] = "x:1980 y:1624 z:100"
    places["3"] = "x:3247 y:1518 z:117"
    places["4"] = "x:948 y:2338 z:53"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid Herbalist - For a list of supported herbalists type: 'cheat_tp_hl ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_ml (MILLS)
-- ============================================================================
Cheat.cheat_tp_ml_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to herbalist") end,
}

--[[
Cheat:createCommand("cheat_tp_ml", "Cheat:tp_ml(%line)", Cheat.cheat_tp_ml_args,
    "Teleports the player to the given mill.\n$8\n$8\n$8Supported mills:\n$8BUDIN (1), KATZEK (2), KOHELNITZ (3), LEDETCHKO (4),\n$8MERHOJED WINDMILL (5), RATTAY (6), UZHITZ WINDMILL (7)",
    "Type to console", "cheat_tp_ml id:1")
]]
function Cheat:tp_ml(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_ml_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    local places = {}
    places["1"] = "x:1405 y:1463 z:19"
    places["2"] = "x:1602 y:1838 z:20"
    places["3"] = "x:2823 y:1232 z:25"
    places["4"] = "x:2099 y:1317 z:27"
    places["5"] = "x:2041 y:2313 z:165"
    places["6"] = "x:2451 y:693 z:28"
    places["7"] = "x:2771 y:3683 z:194"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid Mill - For a list of supported mills type: 'cheat_tp_ml ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_tvn (TAVERNS)
-- ============================================================================
Cheat.cheat_tp_tvn_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to tavern") end,
}

--[[
Cheat:createCommand("cheat_tp_tvn", "Cheat:tp_tvn(%line)", Cheat.cheat_tp_tvn_args,
    "Teleports the player to the given taverns.\n$8\n$8\n$8Supported places:\n$8RATTAY_EAST (1), GLADE (2), TALMBERG (3), WAGONERS (4), RATTAY_WEST (5), WHEEL (6)",
    "Type to console", "cheat_tp_tvn id:1")
]]
function Cheat:tp_tvn(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_tvn_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    local places = {}
    places["1"] = "x:2718 y:625 z:95"
    places["2"] = "x:2849 y:1913 z:156"
    places["3"] = "x:2395 y:2727 z:87"
    places["4"] = "x:938 y:1424 z:24"
    places["5"] = "x:2635 y:620 z:89"
    places["6"] = "x:2915 y:733 z:108"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid Tavern - For a list of supported taverns type: 'cheat_tp_tvn ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_tr (TREASURE MAPS)
-- ============================================================================
Cheat.cheat_tp_tr_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to treasure") end,
}

--[[
Cheat:createCommand("cheat_tp_tr", "Cheat:tp_tr(%line)", Cheat.cheat_tp_tr_args,
    "Teleports the player to the given treasure.\n$8\n$8\n$8Each map has its own number:\n$8\n$8For Treasure Maps use: 1 to 25 and\n$8For Ancient Treasure Maps use: 26 to 30",
    "Type to console", "cheat_tp_tr id:1")
]]
function Cheat:tp_tr(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_tr_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    -- All treasure locations. I preferred arabic numerals to roman
    -- numerals because it is much easier to visit all of them in order.
    -- (You normally only need to change one digit and re-run the command)
    local places = {}
    places["1"] = "x:645 y:1916 z:111"
    places["2"] = "x:384 y:1820 z:22"
    places["3"] = "x:220 y:1687 z:73"
    places["4"] = "x:2777 y:1451 z:107"
    places["5"] = "x:2084 y:2056 z:126"
    places["6"] = "x:2265 y:1592 z:114"
    places["7"] = "x:1860 y:1525 z:81"
    places["8"] = "x:2330 y:1125 z:51"
    places["9"] = "x:864 y:3280 z:21"
    places["10"] = "x:1683 y:943 z:41"
    places["11"] = "x:1445 y:1137 z:37"
    places["12"] = "x:3182 y:338 z:136"
    places["13"] = "x:3604 y:717 z:100"
    places["14"] = "x:3696 y:1258 z:87"
    places["15"] = "x:2948 y:1316 z:85"
    places["16"] = "x:486 y:2571 z:21"
    places["17"] = "x:764 y:2572 z:20"
    places["18"] = "x:2496 y:2805 z:101"
    places["19"] = "x:856 y:1341 z:18"
    places["20"] = "x:734 y:3696 z:32"
    places["21"] = "x:658 y:3142 z:41"
    places["22"] = "x:594 y:608 z:159"
    places["23"] = "x:1020 y:3968 z:52"
    places["24"] = "x:900 y:3848 z:67"
    places["25"] = "x:212 y:3480 z:77"
    places["26"] = "x:3879 y:889 z:159"
    places["27"] = "x:877 y:262 z:180"
    places["28"] = "x:3158 y:3835 z:167"
    places["29"] = "x:1727 y:778 z:76"
    places["30"] = "x:475 y:3864 z:39"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError(
                "Invalid Treasure Map Location - For a list of supported treasure map locations type: 'cheat_tp_tr ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_wc (WOODCUTTER CAMPS)
-- ============================================================================
Cheat.cheat_tp_wc_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "Teleport to tavern") end,
}

--[[
Cheat:createCommand("cheat_tp_wc", "Cheat:tp_wc(%line)", Cheat.cheat_tp_wc_args,
    "Teleports the player to the given woodcutter camp.\n$8\n$8\n$8Supported places:\n$8LEDETCHKO (1), RATTAY (2), RATTAY_WOODS (3), TALMBERG (4), UZHITZ (5)",
    "Type to console", "cheat_tp_wc id:1")
]]
function Cheat:tp_wc(line)
    if Cheat:NotPlayerCharacter() then
        return false
    end

    local args = Cheat:argsProcess(line, Cheat.cheat_tp_wc_args)
    local nplace, nplaceErr = Cheat:argsGet(args, "id")

    local places = {}
    places["1"] = "x:1631 y:1447 z:65"
    places["2"] = "x:1950 y:926 z:71"
    places["3"] = "x:2697 y:1742 z:132"
    places["4"] = "x:2221 y:3153 z:131"
    places["5"] = "x:2296 y:3833 z:155"

    if not nplaceErr then
        if places[Cheat:toUpper(nplace)] ~= nil then
            Cheat:teleport(places[Cheat:toUpper(nplace)])
        else
            Cheat:logError("Invalid Camp - For a list of supported camps type: 'cheat_tp_wc ?'")
        end
    end
end

-- ============================================================================
-- cheat_tp_to_npc
-- ============================================================================
Cheat.cheat_tp_to_npc_args = {
    id = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "All or part of the NPC's name.") end,
    num = function (args, name, showHelp)
        return Cheat:argsGetOptionalNumber(args, name, 0, showHelp,
            "Optional: The NPC's number in the list if there's more than one.\n$8Keep it greater than 0.")
    end
}

--[[
Cheat:createCommand("cheat_tp_to_npc", "Cheat:tp_to_npc(%line)", Cheat.cheat_tp_to_npc_args,
    "Finds an NPC or list of NPCs and teleports to any of them.\n$8This only works if the NPC has been loaded into the world.\n$8Defaults to last NPC in the list if no num argument received.",
    "Teleport to Father Godwin", "cheat_tp_to_npc id:godwin")
]]
function Cheat:tp_to_npc(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_tp_to_npc_args)
    local id, idErr = Cheat:argsGet(args, "id")
    local num, numErr = Cheat:argsGet(args, "num")
    if not idErr and not numErr then
        Cheat:cheat_find_npc("token:" .. id)
        local npcs = Cheat:findNpc(id)

        if num == nil or num <= 0 then
            num = #npcs
        end

        if num > #npcs then
            Cheat:logError("Sorry, this number is greater than the amount of found NPCS.")
            return
        end
        if npcs and #npcs > 0 then
            local nx = npcs[num]:GetWorldPos().x
            local ny = npcs[num]:GetWorldPos().y
            local nz = npcs[num]:GetWorldPos().z
            Cheat:teleport("x:" .. nx .. " y:" .. ny .. " z:" .. nz)
        else
            Cheat:logError("NPC [%s] not found.", id)
        end
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_teleport.lua loaded")
