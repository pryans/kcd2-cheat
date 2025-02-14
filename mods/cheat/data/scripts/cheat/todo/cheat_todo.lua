-- ============================================================================
-- cheat_set_wanted_level
-- ============================================================================
Cheat.cheat_set_wanted_level_args = {
    level = function (args, name, showHelp)
        return Cheat:argsGetRequiredNumber(args, name, showHelp,
            "0=not wanted, 1=wanted for money, 2=wanted for jail, 3=wanted dead")
    end,
}
--[[
  Cheat:createCommand("cheat_set_wanted_level", "Cheat:cheat_set_wanted_level(%line)", Cheat.cheat_set_wanted_level_args,
    "Set or clears the player's wanted level. This doesn't affect faction reputation.",
    "Clear wanted status", "cheat_set_wanted_level level:0",
    "Make the guards kill me on sight", "cheat_set_wanted_level level:4")
  ]]
function Cheat:cheat_set_wanted_level(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_wanted_level_args)
    local level, levelErr = Cheat:argsGet(args, "level")

    if not levelErr then
        if level < 0 then
            level = 0
        end

        if level > 3 then
            level = 3
        end

        -- #UIAction.CallFunction("hud", 0, "SetWantedState", 1)
        -- #UIAction.CallFunction("hud", 0, "SetTrespassState", 1)

        Game.SetWantedLevel(level)
        Cheat:logInfo("Player's wanted level set to [%s].", tostring(level))
        return true
    end
    return false
end

-- ============================================================================
-- cheat_unlock_recipes
-- ============================================================================
--[[
Cheat:createCommand("cheat_unlock_recipes", "Cheat:cheat_unlock_recipes()", nil,
  "Saw this code to unlock recipes in a pak file.\n$8I have no idea what this really does or if it works.\n$8Let me know.",
  "Unlock all recipes", "cheat_unlock_recipes")
]]
function Cheat:cheat_unlock_recipes()
    if Cheat:NotPlayerCharacter() then
        return false
    end

    --[[
          <rpg_param rpg_param_key="AlchemyDecayedHerbQuality" rpg_param_value="0.01" />
          <rpg_param rpg_param_key="AlchemyDryHerbQuality" rpg_param_value="0.3" />
          <rpg_param rpg_param_key="AlchemyPotionBaseQualityWeight" rpg_param_value="0" />
          <rpg_param rpg_param_key="AlchemyRecipeStepsTolerance" rpg_param_value="4" />
          <rpg_param rpg_param_key="AlchemyResourcesQualityWeight" rpg_param_value="0.2" />
          <rpg_param rpg_param_key="AlchemyResultCoefToFirstQuality" rpg_param_value="0.9" />
          <rpg_param rpg_param_key="AlchemyResultCoefToSecondQuality" rpg_param_value="0.7" />
          <rpg_param rpg_param_key="AlchemyXPMultiplierSecondQualityPotion" rpg_param_value="1.35" />
          <rpg_param rpg_param_key="AlchemyXPMultiplierThirdQualityPotion" rpg_param_value="2" />
    ]]
    for i = 2, 26 do
        for y = 1, 5 do RPG.UnlockRecipe(player, i, y); end
    end
    Cheat:logInfo("Recipies unlocked.")
    return true
end
