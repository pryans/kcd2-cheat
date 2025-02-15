-- ============================================================================
-- help functions and constants
-- ============================================================================
Cheat.g_money_id = "5ef63059-322e-4e1b-abe8-926e100c770e"

function Cheat:get_strength()
    return player.soul:GetStatLevel("strength")
end

function Cheat:get_agility()
    return player.soul:GetStatLevel("agility")
end

function Cheat:get_vitality()
    return player.soul:GetStatLevel("vitality")
end

function Cheat:get_speech()
    return player.soul:GetStatLevel("speech")
end

function Cheat:add_money(amount)
    -- This code crashes....
    --[[
  local moneyItem = ItemManager.CreateItem(Cheat.g_money_id, 1, amount * 10)
  player.inventory:AddItem(moneyItem)
  ]]
    player.inventory:CreateItem(Cheat.g_money_id, 1, amount * 10)
    Game.ShowItemsTransfer(Cheat.g_money_id, amount)
    return true
end

function Cheat:get_money()
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

-- ============================================================================
-- cheat_no_clip / cheat_clip
-- ============================================================================
Cheat:createCommand("cheat_no_clip", "Cheat:cheat_clip_mode(2)", nil, "Turns off player collision detection.", "Turn Off", "cheat_no_clip")
Cheat:createCommand("cheat_clip", "Cheat:cheat_clip_mode(0)", nil, "Turns on player collision detection.", "Turn On", "cheat_clip")
function Cheat:cheat_clip_mode(mode)
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
-- cheat_loc
-- ============================================================================
Cheat.cheat_loc_args = {
    default_arg = 'save',
    save = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "The name of the location to save.") end,
}

Cheat:createCommand("cheat_loc", "Cheat:loc(%line)", Cheat.cheat_loc_args,
    "Shows player's world location and saves it if a name is provided.",
    "Type to console", "cheat_loc")
function Cheat:loc(line)
    local loc = player:GetWorldPos();
    -- print all attributes of loc 
    for k, v in pairs(loc) do
        Cheat:logInfo("  %s = %s", k, tostring(v))
    end

    local locString = string.format("x=%d y=%d z=%d", loc.x, loc.y, loc.z)
    Cheat:logInfo("Player's location: %s", locString)
    local args = Cheat:argsProcess(line, Cheat.cheat_loc_args)
    local save, saveErr = Cheat:argsGet(args, "save")
    if save then
        Cheat:logInfo("Saving location: %s to [%s].", locString, tostring(save))
        Cheat.saved_locations[save] = loc
    end
    return loc
end

Cheat:createCommand("cheat_loc_show_saved", "Cheat:loc_show_saved()", nil,
    "Shows all saved locations.",
    "Type to console", "cheat_loc_show_saved")
function Cheat:loc_show_saved()
    for k, v in pairs(Cheat.saved_locations) do
        Cheat:logInfo("Location: %s  --  x=%d y=%d z=%d", k, v.x, v.y, v.z)
    end
end

Cheat:createCommand("cheat_loc_show_saved", "Cheat:loc_show_saved()", nil,
    "Shows all saved locations.",
    "Type to console", "cheat_loc_show_saved")
function Cheat:loc_show_saved()
    for k, v in pairs(Cheat.saved_locations) do
        Cheat:logInfo("Location: %s  --  x=%d y=%d z=%d", k, v.x, v.y, v.z)
    end
end

-- ============================================================================
-- cheat_set_state
-- ============================================================================
Cheat.cheat_set_state_args = {
    state = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "One of: health, stamina, exhaust, hunger, or .") end,
    value = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The number to assign to the given state.") end
}
Cheat:createCommand("cheat_set_state", "Cheat:cheat_set_state(%line)", Cheat.cheat_set_state_args,
    "Sets one of the player's states to the given value.",
    "Set health to 100 points", "cheat_set_state state:health value:100",
    "Set stamina to 100 points", "cheat_set_state state:stamina value:100",
    "Set hunger to 100 points", "cheat_set_state state:hunger value:100",
    "Set exhaust to 100 points", "cheat_set_state state:exhaust value:100")
function Cheat:cheat_set_state(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_state_args, "cheat_set_state")
    local state, stateErr = Cheat:argsGet(args, "state")
    local value, valueErr = Cheat:argsGet(args, "value")
    if stateErr or valueErr then
        return false
    end

    local values = { health = true, stamina = true, hunger = true, exhaust = true }
    if not values[Cheat:toLower(state)] then
        Cheat:logError("Invalid state [%s].", tostring(state))
        return false
    end

    player.soul:SetState(state, value)
    Cheat:logInfo("Set state [%s] to value [%s].", tostring(state), tostring(value))
    return true
end

-- ============================================================================
-- cheat_set_stat_level
-- ============================================================================
Cheat.cheat_set_stat_level_args = {
    stat = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "One of: strength, agility, vitality, or speech.") end,
    level = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The desired level for the given stat (max %s).", tostring(RPG.StatCap))) end
}
Cheat:createCommand("cheat_set_stat_level", "Cheat:cheat_set_stat_level(%line)", Cheat.cheat_set_stat_level_args,
    "Sets one of the player's stats to the given level.\n$4 WARNING: A stat's level cannot lowered once set.",
    "Set player's strength to level 20", "cheat_set_stat_level stat:strength level:20",
    "Set player's agility to level 5", "cheat_set_stat_level stat:agility level:5")
function Cheat:cheat_set_stat_level(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_stat_level_args, "cheat_set_stat_level")
    local stat, statErr = Cheat:argsGet(args, "stat")
    local level, levelErr = Cheat:argsGet(args, "level")
    if statErr or levelErr then
        return false
    end

    local values = { strength = true, agility = true, vitality = true, speech = true }
    if not values[Cheat:toLower(stat)] then
        Cheat:logError("Invalid stat [%s].", tostring(stat))
        return false
    end

    local minValue = player.soul:GetStatLevel(stat)
    if level <= minValue then
        Cheat:logError("Stat level can only be increased. Stat [%s] is level [%s], new level must be higher.", tostring(stat), tostring(minValue))
        return false
    end

    local maxValue = RPG.StatCap
    if level > maxValue then
        Cheat:logError("Stat level cannot exceed stat cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToStatLevel(stat, level)
    Cheat:logInfo("Set stat [%s] to level [%s].", tostring(stat), tostring(level))
    return true
end

-- ============================================================================
-- cheat_add_stat_levels
-- ============================================================================
Cheat.cheat_add_stat_levels_args = {
    stat = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "One of: strength, agility, vitality, or speech.") end,
    levels = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The levels to add to the stat (max %s). Level cannot lowered.", tostring(RPG.StatCap))) end
}
Cheat:createCommand("cheat_add_stat_levels", "Cheat:cheat_add_stat_levels(%line)", Cheat.cheat_add_stat_levels_args,
    "Adds levels to a player's stat.\n$4 WARNING: A stat's level cannot lowered once set.",
    "Add 5 levels to player's strength.", "cheat_add_stat_levels stat:str levels:5")
function Cheat:cheat_add_stat_levels(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_stat_levels_args, "cheat_add_stat_levels")
    local stat, statErr = Cheat:argsGet(args, "stat")
    local levels, levelErr = Cheat:argsGet(args, "levels")
    if statErr or levelErr then
        return false
    end

    local values = { strength = true, agility = true, vitality = true, speech = true }
    if not values[Cheat:toLower(stat)] then
        Cheat:logError("Invalid stat [%s].", tostring(stat))
        return false
    end

    local level = player.soul:GetStatLevel(stat) + levels

    local minValue = player.soul:GetStatLevel(stat)
    if level <= minValue then
        Cheat:logError("Stat level can only be increased. Stat [%s] is level [%s], new level must be higher.", tostring(stat), tostring(minValue))
        return false
    end

    local maxValue = RPG.StatCap
    if level > maxValue then
        Cheat:logError("Stat level cannot exceed stat cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToStatLevel(stat, level)
    Cheat:logInfo("Adds [%s] levels to stat [%s], new level is [%s].", tostring(levels), tostring(stat), tostring(level))
    return true
end

-- ============================================================================
-- cheat_add_money
-- ============================================================================
Cheat.cheat_add_money_args = {
    amount = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, "The amount of groschen to add.") end
}
Cheat:createCommand("cheat_add_money", "Cheat:cheat_add_money(%line)", Cheat.cheat_add_money_args,
    "Adds the given amount of groschen to the player's inventory.",
    "Add 200 groschen", "cheat_add_money amount:200")
function Cheat:cheat_add_money(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_money_args, "cheat_add_money")
    local amount, amountErr = Cheat:argsGet(args, "amount")
    if amountErr then
        return false
    end

    if amount <= 0 then
        Cheat:logError("Invalid money amount.")
        return false
    end

    local oldMoney = Cheat:get_money()
    if Cheat:add_money(amount) then
        local newMoney = Cheat:get_money()
        Cheat:logInfo("Added [%s] to player inventory. (%s => %s) ", tostring(amount), tostring(oldMoney), tostring(newMoney))
        return true
    else
        return false
    end
end

-- ============================================================================
-- cheat_set_bow_reticle
-- ============================================================================
Cheat.cheat_set_bow_reticle_args = {
    enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
}
Cheat:createCommand("cheat_set_bow_reticle", "Cheat:cheat_set_bow_reticle(%line)", Cheat.cheat_set_bow_reticle_args,
    "Enables or disables the bow reticle. Won't take effect if bow is drawn.",
    "Turn it on", "cheat_set_bow_reticle enable:true",
    "Turn it off", "cheat_set_bow_reticle enable:false")
function Cheat:cheat_set_bow_reticle(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_bow_reticle_args, "cheat_set_bow_reticle")
    local enable, enableErr = Cheat:argsGet(args, "enable")
    if enableErr then
        return false
    end

    if enable then
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
Cheat.cheat_set_compass_args = {
    enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
}
Cheat:createCommand("cheat_set_compass", "Cheat:cheat_set_compass(%line)", Cheat.cheat_set_compass_args,
    "Enables or disables the compass.",
    "Turn it on", "cheat_set_compass enable:true",
    "Turn it off", "cheat_set_compass enable:false")
function Cheat:cheat_set_compass(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_compass_args, "cheat_set_compass")
    local enable, enableErr = Cheat:argsGet(args, "enable")
    if enableErr then
        return false
    end

    if enable then
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
Cheat.cheat_set_hud_args = {
    enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
}
Cheat:createCommand("cheat_set_hud", "Cheat:cheat_set_hud(%line)", Cheat.cheat_set_hud_args,
    "Enables or disables the hud.",
    "Turn it on", "cheat_set_hud enable:true",
    "Turn it off", "cheat_set_hud enable:false")
function Cheat:cheat_set_hud(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_hud_args, "cheat_set_hud")
    local enable, enableErr = Cheat:argsGet(args, "enable")
    if not enableErr then
        if enable then
            System.ExecuteCommand("wh_ui_ShowHud 1")
            Cheat:logInfo("HUD on.")
        else
            System.ExecuteCommand("wh_ui_ShowHud 0")
            Cheat:logInfo("HUD off.")
        end
        return true
    end
    return false
end

-- ============================================================================
-- cheat_set_statusbar
-- ============================================================================
Cheat.cheat_set_statusbar_args = {
    enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
}
Cheat:createCommand("cheat_set_statusbar", "Cheat:cheat_set_statusbar(%line)", Cheat.cheat_set_statusbar_args,
    "Enables or disables the statusbar.",
    "Turn it on", "cheat_set_statusbar enable:true",
    "Turn it off", "cheat_set_statusbar enable:false")
function Cheat:cheat_set_statusbar(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_statusbar_args, "cheat_set_statusbar")
    local enable, enableErr = Cheat:argsGet(args, "enable")
    if not enableErr then
        if enable then
            System.ExecuteCommand("wh_ui_ShowStats 1")
            Cheat:logInfo("Statusbar on.")
        else
            System.ExecuteCommand("wh_ui_ShowStats 0")
            Cheat:logInfo("Statusbar off.")
        end
        return true
    end
    return false
end

-- ============================================================================
-- cheat_set_third_person
-- ============================================================================
Cheat.cheat_set_third_person_args = {
    enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
}
Cheat:createCommand("cheat_set_third_person", "Cheat:cheat_set_third_person(%line)", Cheat.cheat_set_third_person_args,
    "Enables or disables the third person view.",
    "Turn it on", "cheat_set_third_person enable:true",
    "Turn it off", "cheat_set_third_person enable:false")
function Cheat:cheat_set_third_person(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_third_person_args, "cheat_set_third_person")
    local enable, enableErr = Cheat:argsGet(args, "enable")
    if not enableErr then
        if enable then
            System.ExecuteCommand("wh_pl_FollowEntity dude")
            Cheat:logInfo("Third person view on.")
        else
            System.ExecuteCommand("wh_pl_FollowEntity 0")
            Cheat:logInfo("Third person view off.")
        end
        return true
    end
    return false
end

-- ============================================================================
-- cheat_wash_dirt_and_blood
-- ============================================================================
Cheat:createCommand("cheat_wash_dirt_and_blood", "Cheat:cheat_wash_dirt_and_blood()", nil,
    "Washes all blood and dirt from the player.",
    "Wash yourself and your horse", "cheat_wash_dirt_and_blood")
function Cheat:cheat_wash_dirt_and_blood()
    player.actor:WashDirtAndBlood(1, 1)
    Cheat:logInfo("All Clean!")
    return true
end

-- ============================================================================
-- cheat_charm
-- ============================================================================
Cheat:createCommand("cheat_charm", "Cheat:cheat_charm()", nil,
    "Automates your morning routine of bath-haircut-sex for maximum Charisma bonus.\n$8Washes all dirt and blood and applies Fresh Cut and Smitten buffs.",
    "Wash yourself and add Charisma buffs", "cheat_charm")
function Cheat:cheat_charm()
    if Cheat:NotPlayerCharacter() then
        return false
    end

    Cheat:cheat_wash_dirt_and_blood()
    Cheat:cheat_add_buff("id:fresh_cut")
    Cheat:cheat_add_buff("id:alpha_male_in_love")
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
            local realAmount = Cheat:min(stamina + Cheat.g_passive_stamina_regen_amount,
                Cheat.g_passive_stamina_regen_highwater)
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
            local realAmount = Cheat:min(exhaust + Cheat.g_passive_exhaust_regen_amount,
                Cheat.g_passive_exhaust_regen_highwater)
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
Cheat.cheat_set_regen_args = {
    enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true to enable state regen; false to disable") end,
    state = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The state to regen: all, health, stamina, or exhaust.") end,
    amount = function (args, name, showHelp) return Cheat:argsGetOptionalNumber(args, name, 1, showHelp, "The amount to regen every second. (Default 1)") end
}
Cheat:createCommand("cheat_set_regen", "Cheat:cheat_set_regen(%line)", Cheat.cheat_set_regen_args,
    "Regenerates player health, stamina, hunger, or exhaust over time; pulses once per second.",
    "Adds 5 to all states every second.", "cheat_set_regen enable:true state:all amount:5",
    "Adds 5 to player's health every second.", "cheat_set_regen enable:true state:health amount:5",
    "Disable all state regeneration.", "cheat_set_regen enable:false state:all")
function Cheat:cheat_set_regen(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_regen_args, "cheat_set_regen")
    local enable, enableErr = Cheat:argsGet(args, "enable")
    local state, stateErr = Cheat:argsGet(args, "state")
    local amount, amountErr = Cheat:argsGet(args, "amount")

    if enableErr or stateErr or amountErr then
        return
    end

    local values = { all = true, health = true, stamina = true, hunger = true, exhaust = true }
    if not values[Cheat:toLower(state)] then
        Cheat:logError("Invalid state [%s].", tostring(state))
        return false
    end

    if state == "health" or state == "all" then
        Cheat.g_passive_health_regen = enable
        if enable then
            Cheat.g_passive_health_regen_amount = amount
        end
        Cheat:logInfo("Heath regen state [%s] and amount [%s].", tostring(Cheat.g_passive_health_regen), tostring(Cheat.g_passive_health_regen_amount))
    end

    if state == "stamina" or state == "all" then
        Cheat.g_passive_stamina_regen = enable
        if enable then
            Cheat.g_passive_stamina_regen_amount = amount
        end
        Cheat:logInfo("Stamina regen state [%s] and amount [%s].", tostring(Cheat.g_passive_stamina_regen), tostring(Cheat.g_passive_stamina_regen_amount))
    end

    if state == "hunger" or state == "all" then
        Cheat.g_passive_hunger_regen = enable
        if enable then
            Cheat.g_passive_hunger_regen_amount = amount
        end
        Cheat:logInfo("Hunger regen state [%s] and amount [%s].", tostring(Cheat.g_passive_hunger_regen), tostring(Cheat.g_passive_hunger_regen_amount))
    end

    if state == "exhaust" or state == "all" then
        Cheat.g_passive_exhaust_regen = enable
        if enable then
            Cheat.g_passive_exhaust_regen_amount = amount
        end
        Cheat:logInfo("Exhaust regen state [%s] and amount [%s].", tostring(Cheat.g_passive_exhaust_regen), tostring(Cheat.g_passive_exhaust_regen_amount))
    end

    return true
end

-- ============================================================================
-- test_core_player
-- ============================================================================
function Cheat:test_core_player()
    Cheat:beginTest("test_core_player")

    -- loc
    local loc = Cheat:loc()
    Cheat:testAssert("loc 1", loc ~= nil)
    Cheat:testAssert("loc 2", loc.x ~= nil and loc.x ~= 0)
    Cheat:testAssert("loc 3", loc.y ~= nil and loc.y ~= 0)
    Cheat:testAssert("loc 4", loc.z ~= nil)

    -- cheat_add_money
    Cheat:testAssertFalse("money invalid 1", Cheat:cheat_add_money(""))
    Cheat:testAssertFalse("money invalid 2", Cheat:cheat_add_money("amount:"))
    Cheat:testAssertFalse("money invalid 3", Cheat:cheat_add_money("amount:asdf"))
    Cheat:testAssertFalse("money invalid 4", Cheat:cheat_add_money("amount:-1"))
    Cheat:testAssertFalse("money invalid 5", Cheat:cheat_add_money("amount:0"))
    local expectedMoney = Cheat:get_money() + 100
    Cheat:testAssert("money 1", Cheat:cheat_add_money("amount:100"))
    Cheat:testAssert("money 2", Cheat:get_money() == expectedMoney)

    -- cheat_set_stat_level
    Cheat:testAssertFalse("cheat_set_stat_level invalid 1", Cheat:cheat_set_stat_level(""))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 2", Cheat:cheat_set_stat_level("stat:strength"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 3", Cheat:cheat_set_stat_level("level:1"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 4", Cheat:cheat_set_stat_level("stat:str"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 5", Cheat:cheat_set_stat_level("stat:strength level:0"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 6", Cheat:cheat_set_stat_level("stat:strength level:-1"))
    Cheat:testAssertFalse("cheat_set_stat_level invalid 7", Cheat:cheat_set_stat_level("stat:strength level:99"))

    Cheat:testAssert("cheat_set_stat_level strength 1", Cheat:cheat_set_stat_level("stat:strength level:20"))
    Cheat:testAssert("cheat_set_stat_level strength 2", Cheat:get_strength() == 20)
    Cheat:testAssert("cheat_set_stat_level vitality 1", Cheat:cheat_set_stat_level("stat:vitality level:20"))
    Cheat:testAssert("cheat_set_stat_level vitality 2", Cheat:get_vitality() == 20)
    Cheat:testAssert("cheat_set_stat_level agility 1", Cheat:cheat_set_stat_level("stat:agility level:20"))
    Cheat:testAssert("cheat_set_stat_level agility 2", Cheat:get_agility() == 20)
    Cheat:testAssert("cheat_set_stat_level speech 1", Cheat:cheat_set_stat_level("stat:speech level:20"))
    Cheat:testAssert("cheat_set_stat_level speech 2", Cheat:get_speech() == 20)

    -- cheat_add_stat_levels
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 1", Cheat:cheat_add_stat_levels(""))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 2", Cheat:cheat_add_stat_levels("stat:strength"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 3", Cheat:cheat_add_stat_levels("levels:1"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 4", Cheat:cheat_add_stat_levels("stat:str"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 5", Cheat:cheat_add_stat_levels("stat:strength levels:0"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 6", Cheat:cheat_add_stat_levels("stat:strength levels:-1"))
    Cheat:testAssertFalse("cheat_add_stat_levels invalid 7", Cheat:cheat_add_stat_levels("stat:strength levels:99"))

    Cheat:testAssert("cheat_add_stat_levels strength 1", Cheat:cheat_add_stat_levels("stat:strength levels:1"))
    Cheat:testAssert("cheat_add_stat_levels strength 2", Cheat:get_strength() == 21)
    Cheat:testAssert("cheat_add_stat_levels vitality 1", Cheat:cheat_add_stat_levels("stat:vitality levels:1"))
    Cheat:testAssert("cheat_add_stat_levels vitality 2", Cheat:get_vitality() == 21)
    Cheat:testAssert("cheat_add_stat_levels agility 1", Cheat:cheat_add_stat_levels("stat:agility levels:1"))
    Cheat:testAssert("cheat_add_stat_levels agility 2", Cheat:get_agility() == 21)
    Cheat:testAssert("cheat_add_stat_levels speech 1", Cheat:cheat_add_stat_levels("stat:speech levels:1"))
    Cheat:testAssert("cheat_add_stat_levels speech 2", Cheat:get_speech() == 21)

    -- cheat_set_state
    Cheat:testAssertFalse("cheat_set_state invalid 1", Cheat:cheat_set_state(""))
    Cheat:testAssertFalse("cheat_set_state invalid 2", Cheat:cheat_set_state("state:health"))
    Cheat:testAssertFalse("cheat_set_state invalid 3", Cheat:cheat_set_state("value:50"))
    Cheat:testAssertFalse("cheat_set_state invalid 4", Cheat:cheat_set_state("state:invalid value:50"))

    Cheat:testAssert("cheat_set_state health 50", Cheat:cheat_set_state("state:health value:50"))
    Cheat:testAssert("check health 50", Cheat:get_health() == 50)
    Cheat:testAssert("cheat_set_state stamina 50", Cheat:cheat_set_state("state:stamina value:50"))
    Cheat:testAssert("check stamina 50", Cheat:get_stamina() == 50)
    Cheat:testAssert("cheat_set_state hunger 50", Cheat:cheat_set_state("state:hunger value:50"))
    Cheat:testAssert("check hunger 50", Cheat:get_hunger() == 50)
    Cheat:testAssert("cheat_set_state exhaust 50", Cheat:cheat_set_state("state:exhaust value:50"))
    Cheat:testAssert("check exhaust 50", Cheat:get_exhaust() == 50)

    -- cheat_set_regen
    Cheat:testAssertFalse("cheat_set_regen invalid 1", Cheat:cheat_set_regen(""))
    Cheat:testAssertFalse("cheat_set_regen invalid 2", Cheat:cheat_set_regen("enable:true"))
    Cheat:testAssertFalse("cheat_set_regen invalid 3", Cheat:cheat_set_regen("state:health"))
    Cheat:testAssertFalse("cheat_set_regen invalid 4", Cheat:cheat_set_regen("enable:x state:health amount:5"))
    Cheat:testAssertFalse("cheat_set_regen invalid 5", Cheat:cheat_set_regen("enable:true state:x amount:5"))
    Cheat:testAssertFalse("cheat_set_regen invalid 6", Cheat:cheat_set_regen("enable:true state:health amount:x"))

    Cheat:testAssert("cheat_set_regen health 1", Cheat:cheat_set_regen("enable:true state:health amount:5"))
    Cheat:testAssert("cheat_set_regen stamina 1", Cheat:cheat_set_regen("enable:true state:stamina amount:5"))
    Cheat:testAssert("cheat_set_regen hunger 1", Cheat:cheat_set_regen("enable:true state:hunger amount:5"))
    Cheat:testAssert("cheat_set_regen exhaust 1", Cheat:cheat_set_regen("enable:true state:exhaust amount:5"))

    Cheat:testAssert("cheat_set_regen disable all ", Cheat:cheat_set_regen("enable:false state:all"))
    Cheat:testAssert("cheat_set_regen enable all", Cheat:cheat_set_regen("enable:true state:all amount:5"))

    -- cheat_wash_dirt_and_blood
    Cheat:testAssert("cheat_wash_dirt_and_blood", Cheat:cheat_wash_dirt_and_blood())

    -- cheat_charm
    Cheat:testAssert("cheat_charm", Cheat:cheat_charm())

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_player.lua loaded")
