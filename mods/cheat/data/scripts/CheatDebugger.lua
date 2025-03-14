CheatDebugger = {}

CheatDebugger.fontSize = 1.75
CheatDebugger.lineHeight = 15

function CheatDebugger:Enable()
    if not CheatDebugger.g_insstance then
        CheatDebugger.g_insstance = System.SpawnEntity({ class = "CheatDebugger" })
    end
end

function CheatDebugger:Disable()
    if CheatDebugger.g_insstance then
        System.RemoveEntity(CheatDebugger.g_insstance.id)
        CheatDebugger.g_insstance = nil
    end
end

function CheatDebugger:OnPropertyChange()
    System.LogAlways("CheatDebugger:OnPropertyChange()")
end

function CheatDebugger:OnReset()
    System.LogAlways("CheatDebugger:OnReset()")
end

function CheatDebugger:OnInit()
    System.LogAlways("CheatDebugger:OnInit()")
    self:Activate(1)
end

local states = { "health", "stamina", "hunger", "exhaust", "karma", "alcoholism" }
local stats = { "strength", "agility", "vitality", "speech", "vision", "hearing", "barter", "courage", "storyProgress" }
local derivedStats = { "charisma", "rch", "cse", "vib", "evi", "con", "mst", "mhs", "hlt", "sdt", "fov", "vir", "tsr", "dtf", "dbf", "pt1", "pt5", "dai", "bnc", "hac", "hde", "lfu", "lio", "cap", "alo", "oad", "owa", "wud", "lvl", "noi", "fsm", "nrs", "rsb", "rsa", "ble", "ibi", "bow", "cow", "aco", "caw", "rcw", "mor", "dem", "mcf", "obe", "psr", "xpm", "osl", "mos", "ore", "caf", "rdq", "erq", "sle", "coc", "ufo", "mut", "prb", "fpa", "apa", "cag", "def", "dru", "poi", "pos", "ran", "iex", "hcm", "was", "grm", "brm", "drt", "sml", "smi", "frg", "hko", "enc", "fdm", "sma", "bma", "hgs", "pds", "sha", "pbm", "rml", "hml", "bso", "bld", "bba", "arr", "jrm", "sur", "imm", "apr", "ppr", "ltp", "upr", "skpr", "kopr", "cds", "edm", "prc", "cdw", "eqw", "pla", "wbc", "cbi", "nbi", "alc", "map", "adm", "alm", "hov", "btw", "owl", "rms", "deb", "ach", "prs", "imp", "drd", "crc", "dmt", "mgt", "bad", "nrv", "vag", "mag", "aag", "red", "drv", "pmc", "sdn", "brn", "plr", "bea", "kko", "sse", "ies", "lrm", "prm", "uvh", "uva", "StaminaCooldownDefault", "StaminaCooldownWeaponRaised", "StaminaCooldownAttack", "StaminaCooldownDodge", "StaminaCooldownHit", "StaminaCooldownBlock", "StaminaCooldownBrokenBlock", "StaminaCooldownCollisionHit", "StaminaCooldownJump", "StaminaCooldownFallDamage", "StaminaCooldownArcherySelfHarm", "StaminaCooldownSharpeningDoPedal", "StaminaCooldownBlacksmithingStroke", "StaminaCooldownBlacksmithingExhaustingStroke", "cnp", "cbp", "csp", "slp", "cep", "icp", "crp", "dfe", "csc", "hvp", "pqe", "sks", "sst", "sss", "xst", "xag", "xvi", "xsw", "xcr", "xsu", "xhw", "xma", "xsc", "srr", "bap", "alp", "atd", "ams", "rcx", "lfb", "tba", "nrw", "fac", "ahe", "apo", "ano", "fpd", "eph", "rpd", "rpr", "rpa", "hla", "rpp", "efd", "aml", "lgp" }

local currentEntity = nil
local currentEntityStats = {}

local lastEntity = nil
local lastEntityStats = {}

function CheatDebugger:DrawText(x, y, text)
    System.DrawText(x, y, text, CheatDebugger.fontSize)
    return CheatDebugger.lineHeight + y
end

function CheatDebugger:OnUpdate(dt)
    Cheat:logOff()
    local currentEntity = Cheat:getTargetedEntity()
    Cheat:logOn()
    if not currentEntity then
        currentEntity = player
    end

    local x = 100
    local y = 100
    local buffer = nil

    y = CheatDebugger:DrawText(x, y, "Cheat Debugger Active")
    y = CheatDebugger:DrawText(x, y, "Entity: " .. Cheat:getEntityName(currentEntity))

    buffer = ""
    for _, state in ipairs(states) do
        local value = currentEntity.soul:GetState(state)
        currentEntityStats[state] = value
        buffer = buffer .. " " .. state .. "=" .. string.format("%.2f", value)
    end
    y = CheatDebugger:DrawText(x, y, buffer)

    buffer = ""
    for _, stat in ipairs(stats) do
        local value = currentEntity.soul:GetStatLevel(stat)
        currentEntityStats[stat] = value
        buffer = buffer .. " " .. stat .. "=" .. string.format("%.2f", value)
    end
    y = CheatDebugger:DrawText(x, y, buffer)

    buffer = ""
    local cols = 1
    local maxColumns = 6
    for _, stat in ipairs(derivedStats) do
        if string.len(stat) == 3 and stat ~= "wbc" then
            local value = currentEntity.soul:GetDerivedStat(stat)
            currentEntityStats[stat] = value
            local vs = string.format("%.2f", value)
            local vslen = string.len(vs)
            local padding = string.rep(" ", 6 - vslen)
            buffer = buffer .. " " .. stat .. "=" .. vs .. padding
            cols = cols + 1
            if cols == maxColumns then
                y = CheatDebugger:DrawText(x, y, buffer)
                cols = 1
                buffer = ""
            end
        end
    end

    buffer = ""
    for _, stat in ipairs(derivedStats) do
        if string.len(stat) ~= 3 then
            local value = currentEntity.soul:GetDerivedStat(stat)
            currentEntityStats[stat] = value
            local vs = string.format("%.2f", value)
            buffer = buffer .. " " .. stat .. "=" .. vs
        end
    end
    y = CheatDebugger:DrawText(x, y, buffer)
end
