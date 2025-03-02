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
    nvr = nervousness
    cnp = horse_price = cnp * 10
    drt = dirtiness
    sml = stench
    bad = related to crime
    con = conspicuousness
    bld = bloodiness
    charisma
    frg = fragrance
    upr = unconscious protection
    sco = stamina consumption, used on companion/horse buffs like perk_fast_as_a_wind_ii_companion to lower rate of consumption va sco*0.95, small is better
    xpm = xp multiplier
    sdn = crime_punishment_brand sdn+1
    brn = crime_punishment_brand brn+0.5 (brand)
    grm = perk_sympatak grm*1.1 | crime_punishment_brand grm*0.5  (good reputation multiplier)
    brm = perk_oportunista brm-0.1 = If you lose your Reputation, the drop will be 10% less. (bad reputation multiplier)
    itd = perk_art_of_preservation itd*0.5 = The raw food and herbs you have in your inventory will spoil 50% slower. (item decary)

    itd*0.5,brm*0.5,grm*2,xpm*2,fsm*1.5,con*0.75,noi*.75,sco*0.75

    fsm = movement speed?
    vib = visibility
            item_torch: vision+5,vib+3.5
            invisibility: vib=-10,con=-10

    crouch	vib-0.5,fsm*0.3,con-0.5,noi*0.5
    sprint	fsm*2,noi+0.1,noi*1.5
    cheat_invisible con=-100,evi=-100,lpv=-100,nbi=-10,noi=-100,ors=-10

    # wud
WeaponUsageDamageMod
-- lerp(1, MaxFencingWeaponUsageMod, Fencing / SkillCap)

# edm
EquipmentUseDamageMultiplier

# ewd
EquippedWeaponUseDamageMultiplier

# itd
Item spoil decay rate

# cdw
ClinchDamageToWeapon

# dee
DamageToEnemyEquipment

# dew
DamageToEnemyWeapon
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
