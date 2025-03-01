-- ============================================================================
-- help functions and constants
-- ============================================================================
Cheat.g_money_id = "5ef63059-322e-4e1b-abe8-926e100c770e"
Cheat.g_player_states = { health = true, stamina = true, hunger = true, exhaust = true, karma = false, alcoholism = true }
Cheat.g_player_stats = { strength = true, agility = true, vitality = true, speech = true }

function Cheat:getStrength()
    return player.soul:GetStatLevel("strength")
end

function Cheat:getAgility()
    return player.soul:GetStatLevel("agility")
end

function Cheat:getVitality()
    return player.soul:GetStatLevel("vitality")
end

function Cheat:getSpeech()
    return player.soul:GetStatLevel("speech")
end

function Cheat:changeMoney(amount)
    if amount > 0 then
        player.inventory:CreateItem(Cheat.g_money_id, 1, amount * 10)
    else
        player.inventory:DeleteItemOfClass(Cheat.g_money_id, -amount * 10)
    end
    Game.ShowItemsTransfer(Cheat.g_money_id, amount)
    return true
end

function Cheat:getMoney()
    return player.inventory:GetCountOfClass(Cheat.g_money_id) / 10
end

function Cheat:set_health(amount)
    return player.soul:SetState("health", amount)
end

function Cheat:get_health()
    return player.soul:GetState("health")
end

function Cheat:set_stamina(amount)
    return player.soul:SetState("stamina", amount)
end

function Cheat:get_stamina()
    return player.soul:GetState("stamina")
end

function Cheat:set_hunger(amount)
    return player.soul:SetState("hunger", amount)
end

function Cheat:get_hunger()
    return player.soul:GetState("hunger")
end

function Cheat:set_exhaust(amount)
    return player.soul:SetState("exhaust", amount)
end

function Cheat:get_exhaust()
    return player.soul:GetState("exhaust")
end

function Cheat:setClipMode(mode)
    -- 0 normal
    -- 1 no collision, no gravity, no ground
    -- 2 no collision, gravity, ground
    -- 3 collision, gravity, ground
    -- 4 collision, gravity, ground
    -- 5 no collision, no gravity, no ground (walk in flat plain into ground/air)
    -- 6 collision, no gravity, ground
    -- 7 normal
    mode = tonumber(mode)
    player:SetColliderMode(mode)
    if mode == 0 then
        Cheat:logInfo("Clip On")
    elseif mode == 2 then
        Cheat:logInfo("Clip Off")
    else
        Cheat:logInfo("Collider Mode = %s", tostring(mode))
    end
    return true
end

-- ============================================================================
-- cheat_no_clip / cheat_clip
-- ============================================================================
Cheat:createCommand("cheat_no_clip", nil, "Turns off player collision detection.", "Turn Off", "cheat_no_clip")
function Cheat:cheat_no_clip()
    return Cheat:setClipMode(2)
end

Cheat:createCommand("cheat_clip", nil, "Turns on player collision detection.", "Turn On", "cheat_clip")
function Cheat:cheat_clip()
    return Cheat:setClipMode(0)
end

-- ============================================================================
-- cheat_loc
-- ============================================================================
Cheat:createCommand("cheat_loc", nil, "Shows player's world location.", "Type to console", "cheat_loc")
function Cheat:cheat_loc()
    local loc = player:GetWorldPos();
    Cheat:logInfo("Player's location x=%d y=%d z=%d", loc.x, loc.y, loc.z)
    return loc
end

-- ============================================================================
-- cheat_get_states
-- ============================================================================
Cheat:createCommand("cheat_get_states", nil, "Displays the player's states.")
function Cheat:cheat_get_states(c)
    local states = {}
    for state, _ in pairs(Cheat.g_player_states) do
        states[state] = player.soul:GetState(state)
    end
    Cheat:logTwoColumnTable(states)
    return true, states
end

-- ============================================================================
-- cheat_set_state
-- ============================================================================
Cheat:createCommand("cheat_set_state", {
        state = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The state to set.") end,
        value = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The number to assign to the given state.") end
    },
    "Sets one of the player's states to the given value.\n" ..
    "$8Valid states are: health, stamina, exhaust, hunger, and alcoholism.",
    "Set health to 100 points", "cheat_set_state state:health value:100")
function Cheat:cheat_set_state(c)
    if not Cheat.g_player_states[Cheat:toLower(c.state)] then
        Cheat:logError("State [%s] is invalid or read-only.", tostring(c.state))
        System.ExecuteCommand("cheat_set_state ?")
        return false
    end

    player.soul:SetState(c.state, c.value)
    Cheat:logInfo("Set state [%s] to value [%s].", tostring(c.state), tostring(c.value))
    return true
end

-- ============================================================================
-- cheat_set_stat_level
-- ============================================================================
Cheat:createCommand("cheat_set_stat_level", {
        stat = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "One of: strength, agility, vitality, or speech.") end,
        level = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The desired level for the given stat (max %s).", tostring(RPG.StatCap))) end
    },
    "Sets one of the player's stats to the given level.\n$4 WARNING: A stat's level cannot lowered once set.",
    "Set player's strength to level 20", "cheat_set_stat_level stat:strength level:20",
    "Set player's agility to level 5", "cheat_set_stat_level stat:agility level:5")
function Cheat:cheat_set_stat_level(c)
    local values = { strength = true, agility = true, vitality = true, speech = true }
    if not values[Cheat:toLower(c.stat)] then
        Cheat:logError("Invalid stat [%s].", tostring(c.stat))
        return false
    end

    local minValue = player.soul:GetStatLevel(c.stat)
    if c.level <= minValue then
        Cheat:logError("Stat level can only be increased. Stat [%s] is level [%s], new level must be higher.", tostring(c.stat), tostring(minValue))
        return false
    end

    local maxValue = RPG.StatCap
    if c.level > maxValue then
        Cheat:logError("Stat level cannot exceed stat cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToStatLevel(c.stat, c.level)
    Cheat:logInfo("Set stat [%s] to level [%s].", tostring(c.stat), tostring(c.level))
    return true
end

-- ============================================================================
-- cheat_add_stat_levels
-- ============================================================================
Cheat:createCommand("cheat_add_stat_levels", {
        stat = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "One of: strength, agility, vitality, or speech.") end,
        levels = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The levels to add to the stat (max %s). Level cannot lowered.", tostring(RPG.StatCap))) end
    },
    "Adds levels to a player's stat.\n$4 WARNING: A stat's level cannot lowered once set.",
    "Add 5 levels to player's strength.", "cheat_add_stat_levels stat:str levels:5")
function Cheat:cheat_add_stat_levels(c)
    local values = { strength = true, agility = true, vitality = true, speech = true }
    if not values[Cheat:toLower(c.stat)] then
        Cheat:logError("Invalid stat [%s].", tostring(c.stat))
        return false
    end

    local level = player.soul:GetStatLevel(c.stat) + c.levels

    local minValue = player.soul:GetStatLevel(c.stat)
    if level <= minValue then
        Cheat:logError("Stat level can only be increased. Stat [%s] is level [%s], new level must be higher.", tostring(c.stat), tostring(minValue))
        return false
    end

    local maxValue = RPG.StatCap
    if level > maxValue then
        Cheat:logError("Stat level cannot exceed stat cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToStatLevel(c.stat, level)
    Cheat:logInfo("Added [%s] levels to stat [%s], new level is [%s].", tostring(c.levels), tostring(c.stat), tostring(level))
    return true
end

-- ============================================================================
-- cheat_add_money
-- ============================================================================
Cheat:createCommand("cheat_add_money", {
        amount = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The amount of groschen to add or remove.") end
    },
    "Adds the given amount of groschen to the player's inventory.",
    "Add 200 groschen", "cheat_add_money amount:200",
    "Remove 200 groschen", "cheat_add_money amount:-200")
function Cheat:cheat_add_money(c)
    local oldMoney = Cheat:getMoney()
    if Cheat:changeMoney(c.amount) then
        local newMoney = Cheat:getMoney()
        if newMoney > oldMoney then
            Cheat:logInfo("Added [%s] groschen. (%s => %s) ", tostring(c.amount), tostring(oldMoney), tostring(newMoney))
        else
            Cheat:logInfo("Removed [%s] groschen. (%s => %s) ", tostring(c.amount), tostring(oldMoney), tostring(newMoney))
        end
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_set_bow_reticle
-- ============================================================================
Cheat:createCommand("cheat_set_bow_reticle", {
        enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
    },
    "Enables or disables the bow reticle. Won't take effect if bow is drawn.",
    "Turn it on", "cheat_set_bow_reticle enable:true",
    "Turn it off", "cheat_set_bow_reticle enable:false")
function Cheat:cheat_set_bow_reticle(c)
    if c.enable then
        System.ExecuteCommand("wh_pl_showfirecursor 1")
        System.ExecuteCommand("wh_ui_ShowCursor 1")
        Cheat:logInfo("Bow reticle on.")
    else
        System.ExecuteCommand("wh_pl_showfirecursor 0") -- this doesn't turn the cursor off if you dont have a bow equipped?
        System.ExecuteCommand("wh_ui_ShowCursor 0")     -- this turns it off
        Cheat:logInfo("Bow reticle off.")
    end
    return true
end

-- ============================================================================
-- cheat_set_compass
-- ============================================================================
Cheat:createCommand("cheat_set_compass", {
        enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
    },
    "Enables or disables the compass.",
    "Turn it on", "cheat_set_compass enable:true",
    "Turn it off", "cheat_set_compass enable:false")
function Cheat:cheat_set_compass(c)
    if c.enable then
        System.ExecuteCommand("wh_ui_showCompass 1")
        Cheat:logInfo("Compass on.")
    else
        System.ExecuteCommand("wh_ui_showCompass 0")
        Cheat:logInfo("Compass off.")
    end
    return true
end

-- ============================================================================
-- cheat_set_hud
-- ============================================================================
Cheat:createCommand("cheat_set_hud", {
        enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
    },
    "Enables or disables the hud.",
    "Turn it on", "cheat_set_hud enable:true",
    "Turn it off", "cheat_set_hud enable:false")
function Cheat:cheat_set_hud(c)
    if c.enable then
        System.ExecuteCommand("wh_ui_ShowHud 1")
        Cheat:logInfo("HUD on.")
    else
        System.ExecuteCommand("wh_ui_ShowHud 0")
        Cheat:logInfo("HUD off.")
    end
    return true
end

-- ============================================================================
-- cheat_set_statusbar
-- ============================================================================
Cheat:createCommand("cheat_set_statusbar", {
        enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
    },
    "Enables or disables the statusbar.",
    "Turn it on", "cheat_set_statusbar enable:true",
    "Turn it off", "cheat_set_statusbar enable:false")
function Cheat:cheat_set_statusbar(c)
    if c.enable then
        System.ExecuteCommand("wh_ui_ShowStats 1")
        Cheat:logInfo("Statusbar on.")
    else
        System.ExecuteCommand("wh_ui_ShowStats 0")
        Cheat:logInfo("Statusbar off.")
    end
    return true
end

-- ============================================================================
-- cheat_set_third_person
-- ============================================================================
Cheat:createCommand("cheat_set_third_person", {
        enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
    },
    "Enables or disables the third person view.",
    "Turn it on", "cheat_set_third_person enable:true",
    "Turn it off", "cheat_set_third_person enable:false")
function Cheat:cheat_set_third_person(c)
    if c.enable then
        System.ExecuteCommand("wh_pl_FollowEntity dude")
        Cheat:logInfo("Third person view on.")
    else
        System.ExecuteCommand("wh_pl_FollowEntity 0")
        Cheat:logInfo("Third person view off.")
    end
    return true
end

-- ============================================================================
-- cheat_wash
-- ============================================================================
Cheat:createCommand("cheat_wash", nil,
    "Washes all blood and dirt from current target or the player.",
    "Wash yourself or your current target", "cheat_wash")
function Cheat:cheat_wash()
    local target = Cheat:getTargetedEntity()
    if target and target.actor then
        target.actor:WashDirtAndBlood(1, 1)
    else
        player.actor:WashDirtAndBlood(1, 1)
    end
    Cheat:logInfo("All Clean!")
    return true
end

-- ============================================================================
-- cheat_charm
-- ============================================================================
Cheat:createCommand("cheat_charm", nil,
    "Automates your morning routine by washing yourself and restoring health, stamina,\n" ..
    "$8hunger, and exhaust which results in a temporary boost to your charisma.",
    "Get ready for the day", "cheat_charm")
function Cheat:cheat_charm()
    if Cheat:NotPlayerCharacter() then
        return false
    end

    Cheat:proxy("cheat_add_buff", "exact:df36eb08-a2b4-4cbc-8a8e-737eb51904bc")
    player.actor:WashDirtAndBlood(1, 1)
    player.soul:SetState("health", 1000)
    player.soul:SetState("stamina", 1000)
    player.soul:SetState("hunger", 100)
    player.soul:SetState("exhaust", 100)
    Cheat:logInfo("All Clean and dandy!")
    return true
end

-- ============================================================================
-- g_passive_stamina_regen
-- ============================================================================
Cheat.g_passive_stamina_regen = false
Cheat.g_passive_stamina_regen_amount = 1
Cheat.g_passive_stamina_regen_highwater = 100

Cheat:cheat_timer_register("g_passive_stamina_regen", function ()
    if Cheat.g_passive_stamina_regen then
        local stamina = player.soul:GetState("stamina")

        if stamina > Cheat.g_passive_stamina_regen_highwater then
            Cheat.g_passive_stamina_regen_highwater = stamina
            Cheat:logDebug("current stamina highwater [%s]", tostring(Cheat.g_passive_stamina_regen_highwater))
        end

        if stamina < Cheat.g_passive_stamina_regen_highwater then
            local realAmount = Cheat:min(stamina + Cheat.g_passive_stamina_regen_amount, Cheat.g_passive_stamina_regen_highwater)
            player.soul:SetState("stamina", realAmount)
            --Cheat:logDebug("+%s stamina (%s)", tostring(realAmount), tostring(stamina))
        end
    end
end)

-- ============================================================================
-- g_passive_exhaust_regen
-- ============================================================================
Cheat.g_passive_exhaust_regen = false
Cheat.g_passive_exhaust_regen_amount = 1
Cheat.g_passive_exhaust_regen_highwater = 100

Cheat:cheat_timer_register("g_passive_exhaust_regen", function ()
    if Cheat.g_passive_exhaust_regen then
        local exhaust = player.soul:GetState("exhaust")

        if exhaust > Cheat.g_passive_exhaust_regen_highwater then
            Cheat.g_passive_exhaust_regen_highwater = exhaust
            Cheat:logDebug("current exhaust highwater [%s]", tostring(Cheat.g_passive_exhaust_regen_highwater))
        end

        if exhaust < Cheat.g_passive_exhaust_regen_highwater then
            local realAmount = Cheat:min(exhaust + Cheat.g_passive_exhaust_regen_amount, Cheat.g_passive_exhaust_regen_highwater)
            player.soul:SetState("exhaust", realAmount)
            --Cheat:logDebug("+%s exhaust (%s)", tostring(realAmount), tostring(exhaust))
        end
    end
end)

-- ============================================================================
-- g_passive_hunger_regen
-- ============================================================================
Cheat.g_passive_hunger_regen = false
Cheat.g_passive_hunger_regen_amount = 1
Cheat.g_passive_hunger_regen_highwater = 100

Cheat:cheat_timer_register("g_passive_hunger_regen", function ()
    if Cheat.g_passive_hunger_regen then
        local hunger = player.soul:GetState("hunger")

        if hunger > Cheat.g_passive_hunger_regen_highwater then
            Cheat.g_passive_hunger_regen_highwater = hunger
            Cheat:logDebug("current hunger highwater [%s]", tostring(Cheat.g_passive_hunger_regen_highwater))
        end

        if hunger < Cheat.g_passive_hunger_regen_highwater then
            local realAmount = Cheat:min(hunger + Cheat.g_passive_hunger_regen_amount, Cheat.g_passive_hunger_regen_highwater)
            player.soul:SetState("hunger", realAmount)
            --Cheat:logDebug("+%s hunger (%s)", tostring(realAmount), tostring(hunger))
        end
    end
end)

-- ============================================================================
-- g_passive_health_regen
-- ============================================================================
Cheat.g_passive_health_regen = false
Cheat.g_passive_health_regen_amount = 1
Cheat.g_passive_health_regen_highwater = 100

Cheat:cheat_timer_register("g_passive_health_regen", function ()
    if Cheat.g_passive_health_regen then
        local health = player.soul:GetState("health")
        local maxHealth = player.actor:GetMaxHealth();

        if health > Cheat.g_passive_health_regen_highwater then
            Cheat.g_passive_health_regen_highwater = health
            Cheat:logDebug("current health highwater [%s]", tostring(Cheat.g_passive_health_regen_highwater))
        end

        if health < Cheat.g_passive_health_regen_highwater then
            local realAmount = Cheat:min(health + Cheat.g_passive_health_regen_amount, Cheat.g_passive_health_regen_highwater)
            player.soul:SetState("health", realAmount)
            --Cheat:logDebug("+%s health (%s)(%s)", tostring(realAmount), tostring(health), tostring(maxHealth))
        end
    end
end)

-- ============================================================================
-- cheat_set_regen
-- ============================================================================
Cheat:createCommand("cheat_set_regen", {
        enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true to enable state regen; false to disable") end,
        state = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The state to regen: all, health, stamina, or exhaust.") end,
        amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The amount to regen every second. (Default 1)") end
    },
    "Regenerates player health, stamina, hunger, or exhaust over time; pulses once per second.",
    "Adds 5 to all states every second.", "cheat_set_regen enable:true state:all amount:5",
    "Adds 5 to player's health every second.", "cheat_set_regen enable:true state:health amount:5",
    "Disable all state regeneration.", "cheat_set_regen enable:false state:all")
function Cheat:cheat_set_regen(c)
    local values = { all = true, health = true, stamina = true, hunger = true, exhaust = true }
    if not values[Cheat:toLower(c.state)] then
        Cheat:logError("Invalid state [%s].", tostring(c.state))
        return false
    end

    if c.state == "health" or c.state == "all" then
        Cheat.g_passive_health_regen = c.enable
        if c.enable then
            Cheat.g_passive_health_regen_amount = c.amount
        end
        Cheat:logInfo("Heath regen state [%s] and amount [%s].", tostring(Cheat.g_passive_health_regen), tostring(Cheat.g_passive_health_regen_amount))
    end

    if c.state == "stamina" or c.state == "all" then
        Cheat.g_passive_stamina_regen = c.enable
        if c.enable then
            Cheat.g_passive_stamina_regen_amount = c.amount
        end
        Cheat:logInfo("Stamina regen state [%s] and amount [%s].", tostring(Cheat.g_passive_stamina_regen), tostring(Cheat.g_passive_stamina_regen_amount))
    end

    if c.state == "hunger" or c.state == "all" then
        Cheat.g_passive_hunger_regen = c.enable
        if c.enable then
            Cheat.g_passive_hunger_regen_amount = c.amount
        end
        Cheat:logInfo("Hunger regen state [%s] and amount [%s].", tostring(Cheat.g_passive_hunger_regen), tostring(Cheat.g_passive_hunger_regen_amount))
    end

    if c.state == "exhaust" or c.state == "all" then
        Cheat.g_passive_exhaust_regen = c.enable
        if c.enable then
            Cheat.g_passive_exhaust_regen_amount = c.amount
        end
        Cheat:logInfo("Exhaust regen state [%s] and amount [%s].", tostring(Cheat.g_passive_exhaust_regen), tostring(Cheat.g_passive_exhaust_regen_amount))
    end

    return true
end

-- ============================================================================
-- test_core_player
-- ============================================================================
function Cheat:test_core_player()
    Cheat:beginTests("test_core_player")

    -- cheat_loc
    local loc = Cheat:cheat_loc()
    Cheat:testAssert("loc 1", loc ~= nil)
    Cheat:testAssert("loc 2", loc.x ~= nil and loc.x ~= 0)
    Cheat:testAssert("loc 3", loc.y ~= nil and loc.y ~= 0)
    Cheat:testAssert("loc 4", loc.z ~= nil)

    -- cheat_add_money
    Cheat:testAssertFalse("money invalid 1", Cheat:proxy("cheat_add_money", ""))
    Cheat:testAssertFalse("money invalid 2", Cheat:proxy("cheat_add_money", "amount:"))
    Cheat:testAssertFalse("money invalid 3", Cheat:proxy("cheat_add_money", "amount:asdf"))

    local expectedMoney = Cheat:getMoney() + 100
    Cheat:testAssert("money add 1", Cheat:proxy("cheat_add_money", "amount:100"))
    Cheat:testAssert("money add 2", Cheat:getMoney() == expectedMoney)

    Cheat:changeMoney(Cheat:getMoney())
    expectedMoney = Cheat:getMoney() - 50
    Cheat:testAssert("money remove 1", Cheat:proxy("cheat_add_money", "amount:-50"))
    Cheat:testAssert("money remove 2", Cheat:getMoney() == expectedMoney)

    -- cheat_set_stat_level
    Cheat:testAssertFalse("cheat_set_stat_level invalid 1", Cheat:proxy("cheat_set_stat_level", ""))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 2", Cheat:proxy("cheat_set_stat_level", "stat:strength"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 3", Cheat:proxy("cheat_set_stat_level", "level:1"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 4", Cheat:proxy("cheat_set_stat_level", "stat:str"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 5", Cheat:proxy("cheat_set_stat_level", "stat:strength level:0"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 6", Cheat:proxy("cheat_set_stat_level", "stat:strength level:-1"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 7", Cheat:proxy("cheat_set_stat_level", "stat:strength level:99"))

    Cheat:testAssert("cheat_set_stat_level strength 1", Cheat:proxy("cheat_set_stat_level", "stat:strength level:20"))
    Cheat:testAssert("cheat_set_stat_level strength 2", Cheat:getStrength() == 20)
    Cheat:testAssert("cheat_set_stat_level vitality 1", Cheat:proxy("cheat_set_stat_level", "stat:vitality level:20"))
    Cheat:testAssert("cheat_set_stat_level vitality 2", Cheat:getVitality() == 20)
    Cheat:testAssert("cheat_set_stat_level agility 1", Cheat:proxy("cheat_set_stat_level", "stat:agility level:20"))
    Cheat:testAssert("cheat_set_stat_level agility 2", Cheat:getAgility() == 20)
    Cheat:testAssert("cheat_set_stat_level speech 1", Cheat:proxy("cheat_set_stat_level", "stat:speech level:20"))
    Cheat:testAssert("cheat_set_stat_level speech 2", Cheat:getSpeech() == 20)

    -- cheat_add_stat_levels
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 1", Cheat:proxy("cheat_add_stat_levels", ""))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 2", Cheat:proxy("cheat_add_stat_levels", "stat:strength"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 3", Cheat:proxy("cheat_add_stat_levels", "levels:1"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 4", Cheat:proxy("cheat_add_stat_levels", "stat:str"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 5", Cheat:proxy("cheat_add_stat_levels", "stat:strength levels:0"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 6", Cheat:proxy("cheat_add_stat_levels", "stat:strength levels:-1"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 7", Cheat:proxy("cheat_add_stat_levels", "stat:strength levels:99"))

    Cheat:testAssert("cheat_add_stat_levels strength 1", Cheat:proxy("cheat_add_stat_levels", "stat:strength levels:1"))
    Cheat:testAssert("cheat_add_stat_levels strength 2", Cheat:getStrength() == 21)
    Cheat:testAssert("cheat_add_stat_levels vitality 1", Cheat:proxy("cheat_add_stat_levels", "stat:vitality levels:1"))
    Cheat:testAssert("cheat_add_stat_levels vitality 2", Cheat:getVitality() == 21)
    Cheat:testAssert("cheat_add_stat_levels agility 1", Cheat:proxy("cheat_add_stat_levels", "stat:agility levels:1"))
    Cheat:testAssert("cheat_add_stat_levels agility 2", Cheat:getAgility() == 21)
    Cheat:testAssert("cheat_add_stat_levels speech 1", Cheat:proxy("cheat_add_stat_levels", "stat:speech levels:1"))
    Cheat:testAssert("cheat_add_stat_levels speech 2", Cheat:getSpeech() == 21)

    -- cheat_set_state
    Cheat:testAssertFalse("cheat_set_state invalid 1", Cheat:proxy("cheat_set_state", ""))
    Cheat:testAssertFalse("cheat_set_state invalid 2", Cheat:proxy("cheat_set_state", "state:health"))
    Cheat:testAssertFalse("cheat_set_state invalid 3", Cheat:proxy("cheat_set_state", "value:50"))
    Cheat:testAssertFalse("cheat_set_state invalid 4", Cheat:proxy("cheat_set_state", "state:invalid value:50"))
    Cheat:testAssertFalse("cheat_set_state invalid 5", Cheat:proxy("cheat_set_state", "state:karma value:50")) --karma read-only

    Cheat:testAssert("cheat_set_state valid 1", Cheat:proxy("cheat_set_state", "state:health value:10"))
    Cheat:testAssert("cheat_set_state valid 2", Cheat:proxy("cheat_set_state", "state:stamina value:20"))
    Cheat:testAssert("cheat_set_state valid 3", Cheat:proxy("cheat_set_state", "state:hunger value:30"))
    Cheat:testAssert("cheat_set_state valid 4", Cheat:proxy("cheat_set_state", "state:exhaust value:40"))
    Cheat:testAssert("cheat_set_state valid 5", Cheat:proxy("cheat_set_state", "state:alcoholism value:50"))

    -- cheat_get_states
    local result, playerStates = Cheat:proxy("cheat_get_states")
    Cheat:testAssert("cheat_get_states 1", result and playerStates and type(playerStates) == "table")
    Cheat:testAssert("cheat_get_states 2", playerStates and playerStates["health"] == 10)
    Cheat:testAssert("cheat_get_states 3", playerStates and playerStates["stamina"] == 20)
    Cheat:testAssert("cheat_get_states 4", playerStates and playerStates["hunger"] == 30)
    Cheat:testAssert("cheat_get_states 5", playerStates and playerStates["exhaust"] == 40)
    Cheat:testAssert("cheat_get_states 6", playerStates and playerStates["alcoholism"] == 50)
    Cheat:testAssert("cheat_get_states 7", playerStates and playerStates["karma"] == 0) --karma read-only

    -- cheat_set_regen
    Cheat:testAssertFalse("cheat_set_regen invalid 1", Cheat:proxy("cheat_set_regen", ""))
    Cheat:testAssertFalse("cheat_set_regen invalid 2", Cheat:proxy("cheat_set_regen", "enable:true"))
    Cheat:testAssertFalse("cheat_set_regen invalid 3", Cheat:proxy("cheat_set_regen", "state:health"))
    Cheat:testAssertFalse("cheat_set_regen invalid 4", Cheat:proxy("cheat_set_regen", "enable:x state:health amount:5"))
    Cheat:testAssertFalse("cheat_set_regen invalid 5", Cheat:proxy("cheat_set_regen", "enable:true state:x amount:5"))
    Cheat:testAssertFalse("cheat_set_regen invalid 6", Cheat:proxy("cheat_set_regen", "enable:true state:health amount:x"))

    Cheat:testAssert("cheat_set_regen health 1", Cheat:proxy("cheat_set_regen", "enable:true state:health amount:5"))
    Cheat:testAssert("cheat_set_regen stamina 1", Cheat:proxy("cheat_set_regen", "enable:true state:stamina amount:5"))
    Cheat:testAssert("cheat_set_regen hunger 1", Cheat:proxy("cheat_set_regen", "enable:true state:hunger amount:5"))
    Cheat:testAssert("cheat_set_regen exhaust 1", Cheat:proxy("cheat_set_regen", "enable:true state:exhaust amount:5"))

    Cheat:testAssert("cheat_set_regen disable all ", Cheat:proxy("cheat_set_regen", "enable:false state:all"))
    Cheat:testAssert("cheat_set_regen enable all", Cheat:proxy("cheat_set_regen", "enable:true state:all amount:5"))

    -- cheat_wash
    Cheat:testAssert("cheat_wash", Cheat:cheat_wash())

    -- cheat_charm
    Cheat:testAssert("cheat_charm", Cheat:cheat_charm())

    Cheat:endTests()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_player.lua loaded")
