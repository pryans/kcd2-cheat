-- ============================================================================
-- database
-- ============================================================================
Cheat.g_skill_database = nil
Cheat.g_skill_database_search_fields = { "skill_id", "skill_lname", "skill_name" }

function Cheat:initSkillDatabase()
    Cheat:logDebug("initSkillDatabase: Started...")

    Cheat.g_skill_database = {}
    for _, skill in pairs(Cheat:loadDatabase("skill")) do
        skill.skill_lname = Cheat:getLocalizedSkillName(skill)
        table.insert(Cheat.g_skill_database, skill)
    end

    if Cheat.g_skill_database then
        Cheat:logDebug("Done loading skill database (%s)", tostring(#Cheat.g_skill_database))
    else
        Cheat:logError("Failed to load skill database.")
    end

    Cheat:logDebug("initSkillDatabase: Done")
end

function Cheat:findSkills(searchOperation)
    return Cheat:findRows(Cheat.g_skill_database, searchOperation, Cheat.g_skill_database_search_fields)
end

function Cheat:findSkill(searchOperation)
    return Cheat:findRow(Cheat.g_skill_database, searchOperation, Cheat.g_skill_database_search_fields)
end

-- ============================================================================
-- helpers
-- ============================================================================

---getSkillLevel
---@param name string
---@return number
function Cheat:getSkillLevel(name)
    return player.soul:GetSkillLevel(name)
end

function Cheat:getSkillDisplayText(skill)
    if not skill then
        return "nil"
    end

    local data = {}
    for k, v in pairs(skill) do
        if k ~= "skill_id" and k ~= "skill_lname" and k ~= "skill_name" then
            if not Cheat:isBlank(v) then
                data[k] = v
            end
        end
    end

    local name = Cheat:getFormattedNames(skill.skill_name, skill.skill_lname)
    return string.format("name=%s id=%s %s",
        name,
        tostring(skill.skill_id),
        Cheat:serializeTable(data))
end

-- ============================================================================
-- cheat_find_skills
-- ============================================================================
Cheat:createCommand("cheat_find_skills", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
    },
    "Displays skills matching the given query.",
    "Show all skills", "cheat_find_skills",
    "Shows all skills with '?' in their names", "cheat_find_skills any:?",
    "Shows the skill named '?'", "cheat_find_skills exact:?")
function Cheat:cheat_find_skills(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    local skills = Cheat:findSkills(searchOperation)
    if not skills or #skills == 0 then
        Cheat:logError("No skills found matching [%s].", Cheat:serializeTable(searchOperation))
        return false, nil
    end

    for _, skill in ipairs(skills) do
        Cheat:logInfo("Skill: %s", Cheat:getSkillDisplayText(skill))
    end
    return true, skills
end

-- ============================================================================
-- cheat_set_skill_level
-- ============================================================================
Cheat:createCommand("cheat_set_skill_level", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
        level = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The desired level for the given skill (max %s).", tostring(RPG.SkillCap))) end
    },
    "Sets player's skill to the given level.",
    "Set player's lockpicking skill to level 20", "cheat_set_skill_level exact:lockpicking level:20",
    "Set player's bow skill to level 20", "cheat_set_skill_level exact:18 level:20")
function Cheat:cheat_set_skill_level(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_set_skill_level ?")
        return false
    end

    local skill = Cheat:findSkill(searchOperation)
    if not skill then
        Cheat:logError("Skill [%s] not found.", tostring(c.skill))
        return false
    end

    local minValue = player.soul:GetSkillLevel(skill.skill_name)
    if c.level <= minValue then
        Cheat:logError("Skill level can only be increased. Skill [%s] is level [%s], new level must be higher.",
            tostring(skill.skill_name), tostring(minValue))
        return false
    end

    local maxValue = RPG.SkillCap
    if c.level > maxValue then
        Cheat:logError("Skill level cannot exceed skill cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToSkillLevel(skill.skill_name, c.level)
    Cheat:logInfo("Set skill [%s] to level [%s].", tostring(skill.skill_name), tostring(c.level))
    return true
end

-- ============================================================================
-- cheat_add_skill_levels
-- ============================================================================
Cheat:createCommand("cheat_add_skill_levels", {
        any = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields partially.") end,
        exact = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "Matches fields exactly.") end,
        levels = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The levels to add to the skill (max %s). Level cannot lowered.", tostring(RPG.SkillCap))) end
    },
    "Adds levels to a player's skill.\n$4 WARNING: A skill's level cannot lowered once set.",
    "Add 5 levels to player's marksmanship.", "cheat_add_skill_levels exact:marksmanship levels:5")
function Cheat:cheat_add_skill_levels(c)
    local searchOperation = nil
    if c.exact then
        searchOperation = { exact = true, searchKey = c.exact }
    elseif c.any then
        searchOperation = { exact = false, searchKey = c.any }
    end

    if not searchOperation then
        Cheat:logError("Must provide one of: exact, any")
        System.ExecuteCommand("cheat_add_skill_levels ?")
        return false
    end

    local skill = Cheat:findSkill(searchOperation)
    if not skill then
        Cheat:logError("Skill [%s] not found.", tostring(c.skill))
        return false
    end

    local level = player.soul:GetSkillLevel(skill.skill_name) + c.levels

    local minValue = player.soul:GetSkillLevel(skill.skill_name)
    if level <= minValue then
        Cheat:logError("Skill level can only be increased. Skill [%s] is level [%s], new level must be higher.",
            tostring(skill.skill_name), tostring(minValue))
        return false
    end

    local maxValue = RPG.SkillCap
    if level > maxValue then
        Cheat:logError("Skill level cannot exceed skill cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToSkillLevel(skill.skill_name, level)
    Cheat:logInfo("Added [%s] levels to skill [%s], new level is [%s].",
        tostring(c.levels), tostring(skill.skill_name), tostring(level))
    return true
end

-- ============================================================================
-- test_core_player
-- ============================================================================
function Cheat:test_core_skills()
    Cheat:beginTests("test_core_skills")

    local skills, skill, result = nil, nil, nil

    -- findSkills all
    skills = Cheat:findSkills(nil)
    Cheat:testAssert("findSkills all skills", #skills >= 30)

    -- findSkill not found
    skill = Cheat:findSkill({ exact = true, searchKey = "this skill doesn't exist" })
    Cheat:testAssert("findSkill fakeskill", skill == nil)

    -- findSkill found
    skill = Cheat:findSkill({ exact = true, searchKey = "marksmanship" })
    Cheat:testAssert("findSkill fakeskill", skill ~= nil)
    if skill then
        Cheat:testAssertEquals("findSkill marksmanship", skill.skill_id, 19)
        Cheat:testAssertEquals("findSkill marksmanship", skill.skill_lname, "Marksmanship")
    end

    -- cheat_find_skills exact
    Cheat:testAssert("cheat_find_skills exact 1", Cheat:proxy("cheat_find_skills", "exact:marksmanship"))

    -- cheat_find_skills any
    result, skills = Cheat:proxy("cheat_find_skills", "any:weapon")
    Cheat:testAssert("cheat_find_skills any 1", result and skills and #skills >= 7)

    -- cheat_set_skill_level
    Cheat:testAssertFalse("cheat_set_skill_level invalid 1", Cheat:proxy("cheat_set_skill_level", ""))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 2", Cheat:proxy("cheat_set_skill_level", "exact:marksmanship"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 3", Cheat:proxy("cheat_set_skill_level", "level:1"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 4", Cheat:proxy("cheat_set_skill_level", "exact:invalidskillname"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 5", Cheat:proxy("cheat_set_skill_level", "exact:marksmanship level:0"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 6", Cheat:proxy("cheat_set_skill_level", "exact:marksmanship level:-1"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 7", Cheat:proxy("cheat_set_skill_level", "exact:marksmanship level:99"))

    Cheat:testAssert("cheat_set_skill_level marksmanship 1", Cheat:proxy("cheat_set_skill_level", "exact:marksmanship level:20"))
    Cheat:testAssert("cheat_set_skill_level marksmanship 2", Cheat:getSkillLevel("marksmanship") == 20)

    -- cheat_add_skill_levels
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 1", Cheat:proxy("cheat_add_skill_levels", ""))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 2", Cheat:proxy("cheat_add_skill_levels", "exact:marksmanship"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 3", Cheat:proxy("cheat_add_skill_levels", "levels:1"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 4", Cheat:proxy("cheat_add_skill_levels", "exact:notaskill"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 5", Cheat:proxy("cheat_add_skill_levels", "exact:marksmanship levels:0"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 6", Cheat:proxy("cheat_add_skill_levels", "exact:marksmanship levels:-1"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 7", Cheat:proxy("cheat_add_skill_levels", "exact:marksmanship levels:99"))

    Cheat:testAssert("cheat_add_skill_levels marksmanship 1", Cheat:proxy("cheat_add_skill_levels", "exact:marksmanship levels:1"))
    Cheat:testAssert("cheat_add_skill_levels marksmanship 2", Cheat:getSkillLevel("marksmanship") == 21)

    Cheat:endTests()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_skills.lua loaded")
