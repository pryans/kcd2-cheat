---@diagnostic disable: deprecated
-- ============================================================================
-- debug functions
-- ============================================================================
function Cheat:dump_all()
    for key, value in pairs(_G) do
        Cheat:logWarn("\n==============================================================================")
        if value then
            if type(value) == "table" then
                Cheat:logWarn("%s (%s)", tostring(key), type(value))
                Cheat:logWarn("==== META METHODS:")
                Cheat:print_methods(getmetatable(value))
                Cheat:logWarn("==== METHODS:")
                Cheat:print_methods(value)
            else
                Cheat:logWarn("%s (%s) = [%s]", tostring(key), type(value), tostring(value))
            end
        end
    end
end

function Cheat:print_methods(object, filter)
    if not object then
        Cheat:logDebug("Object is nil")
        return
    end

    for key, _ in pairs(object) do
        local keyUpper = Cheat:toUpper(key)
        local filterUpper = Cheat:toUpper(filter)
        if Cheat:isBlank(filter) or (keyUpper and filterUpper and string.find(keyUpper, filterUpper, 1, true)) then
            Cheat:logInfo(key)
        end
    end
end

function Cheat:print_all_tables(object, tableName, showMethods)
    if not object then
        object = _G
    end

    if not Cheat:isBlank(tableName) then
        tableName = Cheat:toUpper(tableName)
    else
        tableName = nil
    end

    if showMethods ~= true and showMethods ~= false then
        showMethods = false
    end

    for key, value in pairs(object) do
        if not tableName or (tableName and tableName ~= Cheat:toUpper(key)) then
            local getKeyType = loadstring("return type(" .. key .. ")")
            if getKeyType and getKeyType() == "table" then
                Cheat:logWarn("TABLE: " .. key)
                if showMethods then
                    local getTable = loadstring("return " .. key)
                    if getTable then
                        Cheat:print_methods(getTable())
                    end
                end
            end
        end
    end
end

function Cheat:print_all_functions(object)
    if not object then
        object = _G
    end

    for key, value in pairs(object) do
        local getKeyType = loadstring("return type(" .. key .. ")")
        if getKeyType and getKeyType() == "function" then
            Cheat:logWarn("BEGIN FUNC:" .. key)
            local func = loadstring("print_method_args(" .. key .. ")")
            if func then
                func()
            end
        end
    end
end

function Cheat:tprint(tbl, indent)
    if not indent then
        indent = 0
    end
    for k, v in pairs(tbl) do
        local formatting = string.rep("  ", indent) .. tostring(k) .. ": "
        if type(v) == "table" then
            Cheat:logDebug(formatting)
            Cheat:tprint(v, indent + 1)
        else
            Cheat:logDebug(formatting .. tostring(v))
        end
    end
end

function Cheat:setup_hook()
    debug.sethook(function (event, line)
        Cheat:logWarn("event=" .. event .. " line=" .. tostring(line))
        Cheat:tprint(debug.getinfo(2, "flLnSu"))
        if event == "call" then
            local i = 1
            while true do
                local name, value = debug.getlocal(2, i)
                if name or value then
                    Cheat:logDebug("    local name=" .. name .. " value=" .. tostring(value))
                    i = i + 1
                else
                    break
                end
            end
        end
    end, "crl")
    Cheat:logDebug("hook set")
end

function Cheat:print_method_args(f)
    Cheat:logDebug("begin - print_method_args")

    local calltracer = function (event, line)
        Cheat:logWarn("event=" .. event .. " line=" .. tostring(line))
        Cheat:tprint(debug.getinfo(2, "flLnSu"))
        if event == "call" then
            local i = 1
            while true do
                local name, value = debug.getlocal(2, i)
                if name or value then
                    Cheat:logDebug("    local name=" .. name .. " value=" .. tostring(value))
                    i = i + 1
                else
                    break
                end
            end
        end
    end
    Cheat:logDebug("tracter function created")
    debug.sethook(calltracer, "crl")
    Cheat:logDebug("debug hook set")

    f()

    debug.sethook()
    Cheat:logDebug("end - print_method_args")
end

-- use for debugging in console
-- #dump(x)
---@diagnostic disable-next-line: lowercase-global
function dump(value)
    if value == nil then
        Cheat:logDebug("nil")
    elseif type(value) == "table" then
        local count = 0
        for k, _ in pairs(value) do
            count = count + 1
        end
        if count > 0 then
            Cheat:tprint(value)
        else
            Cheat:logDebug("empty table")
        end
    else
        Cheat:logDebug(tostring(value))
    end
end

function Cheat:entityDumper(entity)
    if not entity then
        entity = Cheat:getTargetedEntity()
    end

    local states = { "health", "stamina", "hunger", "exhaust", "karma", "alcoholism" }
    local foundStates = {}
    for _, state in ipairs(states) do
        local value = entity.soul:GetState(state)
        if value then
            foundStates[state] = value
        end
    end

    local stats = { "strength", "agility", "vitality", "speech", "vision", "hearing", "barter", "courage", "storyProgress" }
    local foundStats = {}
    for _, stat in ipairs(stats) do
        local value = entity.soul:GetStatLevel(stat)
        if value then
            foundStats[stat] = value
        end
    end

    --[[
    alp = potion/consumables all have alp+1?
    cnp = horse_price (cnp * 10)
    xpm = xp multiplier
    cap = capacity/inventory max weight (perk_mule cap+12)
    itd = item decay (perk_art_of_preservation itd*0.5 = The raw food and herbs you have in your inventory will spoil 50% slower.)
    hlh = health loss hit?  (godmode: hlh=0) (0=best, high=worst)

    edm = equipment damage multiplier (edm*0.9 = 10% equipment damage reduction)
    ewd = equipment weapon damage multiplier
    wud = polearm equipment damage multiplier (perk_hardwood wud*0.75 Polearm weapons will get damaged 25% slower)
    itd = item decay rate (spoil rate)
    cdw = clinch damage to weapon
    dee = damage to enemy equipment (perk_heavy_tip dee+0.15)
    dew = damage to enemy weapon
    mor = morale (test_zero_morale mor=0) (morale_max mor=1)
    skpr = stealthkill_protection skpr=1
    apr = vip_attackprotonly_remove apr=0
    alo = armor load (test_suppressArmorLoad_zero alo=0)
    ain = from KCD1, not used? (perk_companion_mouth_full_of_teeth ain*1.3) (perk_bloodletter ain*1.3)
    pbs = (limited_combat pbs*2) (item_shield pbs+0.3)
    cag = (slow_attack_rate cag=0.5) (combat_passivity cag=0) (limited_combat cag=1) (targeted by opponent ranged wpn cag+0.5)
    was = (battle_accuracy_debuff was*10) (HC perk Shakes was*1.6) (log: 11.5)

    --Statuses--------------------------
    poi = poisoned (bane poisin: poi=1)

    --Stamina--------------------------
    ard = stamina loss when aiming (ard*0.5 decreases Stamina loss when aiming by 50%.)
    rst = max stamina vs health (rst%1.75 maximum Stamina decreases with health 75% less) (Overeating rst<0.8 maximum Stamina is lowered)
    slh = stamina loss hit? (godmode: slh=0) (0=best, high=worst)
    sco = stamina consumption (godmode: sco=0)
    srg = stamina recovery growth (tutorial srg=100, alcoholism srg*0.9)
    src = stamina recovery consumption (test_stamina_boost: srg*2,src*0.5)
    sls = defence cost (Artemisia: sls*0.85 defence cost 15% less Stamina)
    mst = max stamina (Buck's Blood:mst*1.3 Increases Stamina by 30%)
    StaminaSprint = sprinting costs 20% less Stamina StaminaSprint*0.8
    StaminaCooldownDefault=0,
    StaminaCooldownAttack=0,
    StaminaCooldownDodge=0,
    StaminaCooldownHit=0,
    StaminaCooldownBlock=0,
    StaminaCooldownWeaponRaised=0

    1. decouple health and stamina rst%2
    2. stamina never stop regenerating due to combat StaminaCooldownDefault=0,StaminaCooldownAttack=0,StaminaCooldownDodge=0,StaminaCooldownHit=0,StaminaCooldownBlock=0,StaminaCooldownWeaponRaised=0
    3. don't lose stamina when hit slh=0
    4. regen stamina ??

    rst%2,slh=0,StaminaCooldownDefault=0,StaminaCooldownAttack=0,StaminaCooldownDodge=0,StaminaCooldownHit=0,StaminaCooldownBlock=0,StaminaCooldownWeaponRaised=0

    --Enery--------------------------
    exh = exhaust rate (Cockerel: exh*0.8 Energy decreases 20% slower) (nighthawk: exh=0.0 do not lose Energy)

    --Attack--------------------------
    wac = weapon attack cost/stamina (overloaded: wac*2) (Artemisia:wac*0.65=attack 30% less stamina) (Arm of Beowulf:wac*1.2=20% more Stamina)
    wat = weapon attack damage (Arm of Beowulf: wat*0.8 = attack 20% weaker) (Greater Attack: wat*2)
    asp = attack speed (overloaded: asp-0.5)  (Arm of Beowulf: asp-0.3 = Attacks 30% slower)

    --Defence--------------------------
    defense = defense (defense_debuff defense*0.1)
    dsl = dodge speed (overloaded: dsl*0.1)

    --Mortality--------------------------
    imm = immortality (imm=1)
    ies = Suppresses the effects of injury (ies=1)
    ibi = bleed speed, 1=normal <1=faster >1=slower (Thickblooded perk:ibi*2 slows bleeding) (heavy_bleeding: ibi*0.75)
    upr = unconscious protection
    fdm = fall damage

    --Movement--------------------------
    LimitRun = prevent run (overloaded)
    LimitSprint = prevent sprint (overloaded)
    Run = run speed  (overloaded:Run-1)
    Walk = walk speed (overloaded:Walk-0.1)
    fsm = movement speed? doesn't seem to work (sprint fsm*2) (crouch fsm*0.3)s
    rms = run movemeent speed multiplier

    --Reputation--------------------------
    grm = good reputation multiplier (perk_sympatak grm*1.1 | crime_punishment_brand grm*0.5)
    brm = bad reputation multiplier (perk_oportunista brm-0.1 = If you lose your Reputation, the drop will be 10% less)

    --Crime--------------------------
    bad = related to crime
    sdn = crime_punishment_brand sdn+1
    brn = crime_punishment_brand brn+0.5 (brand)

    --Awareness--------------------------
    charisma =
    con = conspicuousness (invisibility:con=-10)
    noi = noise
    vib = visibility (item_torch:vib+3.5) (invisibility:vib=-10)
    vision = (item_torch:vision+5) (nighthawk: vision*1.5)
    hearing =
    ors = (Aesop: ors=-1 decreases animal attentiveness. Dogs don't notice you.)
    owl = see in dark (nighthawk: owl+1)

    --Roleplay--------------------------
    bld = bloodiness
    frg = fragrance
    nvr = nervousness
    drt = dirtiness
    sml = stench
    ald = Eliminates drunkenness ald=0
    apa = decreases drunkenness apa+0.05, temporarily reduces effects of alcoholism apa+1
    hod = removes hangover hod=0
    shr = Sleeping heals you four times faster shr*4
    ser = Sleeping increases Energy two times faster ser*2
    prs = persuade (max_persuade prs=30)

    cheate preset 1
        itd*0.5,brm*0.5,grm*2,xpm*2,fsm*1.5,con*0.75,noi*.75,sco*0.25
    combat tutorial
        hlh=0,slh=0,sco=0,srg=100,StaminaCooldownDefault=0,StaminaCooldownAttack=0,StaminaCooldownDodge=0,StaminaCooldownHit=0,StaminaCooldownBlock=0,StaminaCooldownWeaponRaised=0
    god_mode	
        imm=1,hlh=0,slh=0,sco=0,src=0,wac=0,asp=1,wat=100,strength=100,agility=100,vitality=100,defense=100,fencing=100,weapon_sword=100,weapon_unarmed=100,srg=100,health+100/s
    crouch
        vib-0.5,fsm*0.3,con-0.5,noi*0.5
    sprint
        fsm*2,noi+0.1,noi*1.5
    cheat_invisible
        con=-100,evi=-100,lpv=-100,nbi=-10,noi=-100,ors=-10
    limited_combat
        dsl=0,cos=0,pbs*2,cag=1
    targeted by opponent (ranged wpn)" buff_params="cag+0.5,map*0.75"
    perk_racing_horse_companion" buff_params="cap*0.8,rms*1.15"

    ]]
    -- player.soul:GetDerivedStat('hac', {}, self.secondChancesPerks)
    local derivedStats = { "charisma", "rch", "cse", "vib", "evi", "con", "mst", "mhs", "hlt", "sdt", "fov", "vir", "tsr", "dtf", "dbf", "pt1", "pt5", "dai", "bnc", "hac", "hde", "lfu", "lio", "cap", "alo", "oad", "owa", "wud", "lvl", "noi", "fsm", "nrs", "rsb", "rsa", "ble", "ibi", "bow", "cow", "aco", "caw", "rcw", "mor", "dem", "mcf", "obe", "psr", "xpm", "osl", "mos", "ore", "caf", "rdq", "erq", "sle", "coc", "ufo", "mut", "prb", "fpa", "apa", "cag", "def", "dru", "poi", "pos", "ran", "iex", "hcm", "was", "grm", "brm", "drt", "sml", "smi", "frg", "hko", "enc", "fdm", "sma", "bma", "hgs", "pds", "sha", "pbm", "rml", "hml", "bso", "bld", "bba", "arr", "jrm", "sur", "imm", "apr", "ppr", "ltp", "upr", "skpr", "kopr", "cds", "edm", "prc", "cdw", "eqw", "pla", "wbc", "cbi", "nbi", "alc", "map", "adm", "alm", "hov", "btw", "owl", "rms", "deb", "ach", "prs", "imp", "drd", "crc", "dmt", "mgt", "bad", "nrv", "vag", "mag", "aag", "red", "drv", "pmc", "sdn", "brn", "plr", "bea", "kko", "sse", "ies", "lrm", "prm", "uvh", "uva", "StaminaCooldownDefault", "StaminaCooldownWeaponRaised", "StaminaCooldownAttack", "StaminaCooldownDodge", "StaminaCooldownHit", "StaminaCooldownBlock", "StaminaCooldownBrokenBlock", "StaminaCooldownCollisionHit", "StaminaCooldownJump", "StaminaCooldownFallDamage", "StaminaCooldownArcherySelfHarm", "StaminaCooldownSharpeningDoPedal", "StaminaCooldownBlacksmithingStroke", "StaminaCooldownBlacksmithingExhaustingStroke", "cnp", "cbp", "csp", "slp", "cep", "icp", "crp", "dfe", "csc", "hvp", "pqe", "sks", "sst", "sss", "xst", "xag", "xvi", "xsw", "xcr", "xsu", "xhw", "xma", "xsc", "srr", "bap", "alp", "atd", "ams", "rcx", "lfb", "tba", "nrw", "fac", "ahe", "apo", "ano", "fpd", "eph", "rpd", "rpr", "rpa", "hla", "rpp", "efd", "aml", "lgp" }
    local foundDerivedStats = {}
    for _, stat in ipairs(derivedStats) do
        local value = entity.soul:GetDerivedStat(stat)
        if value then
            foundDerivedStats[stat] = value
        end
    end

    local info = {
        name = Cheat:getEntityName(entity),
        states = foundStates,
        stats = foundStats,
        dstats = foundDerivedStats
    }

    Cheat:tprint(info)
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_debug.lua loaded")
