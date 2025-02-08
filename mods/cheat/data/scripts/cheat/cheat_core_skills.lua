-- ============================================================================
-- helper methods
-- ============================================================================
function Cheat:get_skill_level(name)
    return player.soul:GetSkillLevel(name)
end

function Cheat:find_skills(searchKey)
    local tableName = "skill"
    Database.LoadTable(tableName)
    local tableInfo = Database.GetTableInfo(tableName)
    local rows = tableInfo.LineCount - 1
    local search_key_upper = nil
    local skills = {}

    if not Cheat:isBlank(searchKey) then
        search_key_upper = Cheat:toUpper(searchKey)
    end

    for i = 0, rows do
        local skill_row = Database.GetTableLine(tableName, i)
        local skill_id_upper = Cheat:toUpper(skill_row.skill_id)
        local skill_name_upper = Cheat:toUpper(skill_row.skill_name)
        local found = false

        if search_key_upper then
            found = (skill_id_upper == search_key_upper) or (string.find(skill_name_upper, search_key_upper, 1, true) ~= nil)
        else
            found = true
        end

        if found then
            local skill = {}
            skill.skill_id = tostring(skill_row.skill_id)
            skill.skill_name = tostring(skill_row.skill_name)
            skill.skill_data = {}

            for k, v in pairs(skill_row) do
                if k and v and k ~= "skill_id" and k ~= "skill_name" and not Cheat:isBlank(v) then
                    skill.skill_data[k] = v
                end
            end

            table.insert(skills, skill)
        end
    end

    Cheat:logDebug("Returning [%s] skills for search token [%s].", tostring(#skills), tostring(searchKey))
    return skills
end

function Cheat:find_skill(searchKey)
    local skills = Cheat:find_skills(searchKey)
    local skill_id = nil
    local skill_name = nil

    if skills and #skills > 0 then
        skill_id = skills[#skills].skill_id
        skill_name = skills[#skills].skill_name
        Cheat:logDebug("Returning skill [%s] with id [%s].", skill_name, skill_id)
    end

    return skill_id, skill_name
end

-- ============================================================================
-- cheat_find_skills
-- ============================================================================
Cheat.cheat_find_skills_args = {
    token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "All or part of a the skill's name. Leave empty to list all skills.") end
}
Cheat:createCommand("cheat_find_skills", "Cheat:cheat_find_skills(%line)", Cheat.cheat_find_skills_args,
    "Finds all of the skills that match the given token.",
    "Show all skills", "cheat_find_skills token:",
    "Show all skills with 'pick' in their name", "cheat_find_skills token:pick")
function Cheat:cheat_find_skills(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_find_skills_args)
    local token, tokenErr = Cheat:argsGet(args, "token")
    if tokenErr then
        return false
    end

    local skills = Cheat:find_skills(token)
    if #skills == 0 then
        return false
    end

    for _, skill in ipairs(skills) do
        Cheat:logInfo("Skill: name=%s id=%s %s", skill.skill_name, skill.skill_id, Cheat:serializeTable(skill.skill_data))
    end
    return true
end

-- ============================================================================
-- cheat_set_skill_level
-- ============================================================================
Cheat.cheat_set_skill_level_args = {
    skill = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The skill name, full or partial, or ID. Use cheat_find_skills to list all skills.") end,
    level = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The desired level for the given skill (max %s).", tostring(RPG.SkillCap))) end
}
Cheat:createCommand("cheat_set_skill_level", "Cheat:cheat_set_skill_level(%line)", Cheat.cheat_set_skill_level_args,
    "Sets player's skill to the given level.",
    "Set player's lockpicking skill to level 20", "cheat_set_skill_level skill:lockpicking level:20",
    "Set player's bow skill to level 20", "cheat_set_skill_level skill:18 level:20")
function Cheat:cheat_set_skill_level(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_set_skill_level_args)
    local skill, skillErr = Cheat:argsGet(args, "skill")
    local level, levelErr = Cheat:argsGet(args, "level")
    if skillErr or levelErr then
        return false
    end

    local _, skill_name = Cheat:find_skill(skill)
    if not skill_name then
        Cheat:logError("Skill [%s] not found.", tostring(skill))
        return false
    end

    local minValue = player.soul:GetSkillLevel(skill_name)
    if level <= minValue then
        Cheat:logError("Skill level can only be increased. Skill [%s] is level [%s], new level must be higher.", tostring(skill_name), tostring(minValue))
        return false
    end

    local maxValue = RPG.SkillCap
    if level > maxValue then
        Cheat:logError("Skill level cannot exceed skill cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToSkillLevel(skill_name, level)
    Cheat:logInfo("Set skill [%s] to level [%s].", tostring(skill_name), tostring(level))
    return true
end

-- ============================================================================
-- cheat_add_skill_levels
-- ============================================================================
Cheat.cheat_add_skill_levels_args = {
    skill = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "One of: marksmanship, agility, vitality, or speech.") end,
    levels = function (args, name, showHelp) return Cheat:argsGetRequiredNumber(args, name, showHelp, string.format("The levels to add to the skill (max %s). Level cannot lowered.", tostring(RPG.SkillCap))) end
}
Cheat:createCommand("cheat_add_skill_levels", "Cheat:cheat_add_skill_levels(%line)", Cheat.cheat_add_skill_levels_args,
    "Adds levels to a player's skill.\n$4 WARNING: A skill's level cannot lowered once set.",
    "Add 5 levels to player's marksmanship.", "cheat_add_skill_levels skill:str levels:5")
function Cheat:cheat_add_skill_levels(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_add_skill_levels_args)
    local skill, skillErr = Cheat:argsGet(args, "skill")
    local levels, levelErr = Cheat:argsGet(args, "levels")
    if skillErr or levelErr then
        return false
    end

    local _, skill_name = Cheat:find_skill(skill)
    if not skill_name then
        Cheat:logError("Skill [%s] not found.", tostring(skill))
        return false
    end

    local level = player.soul:GetSkillLevel(skill_name) + levels

    local minValue = player.soul:GetSkillLevel(skill_name)
    if level <= minValue then
        Cheat:logError("Skill level can only be increased. Skill [%s] is level [%s], new level must be higher.", tostring(skill_name), tostring(minValue))
        return false
    end

    local maxValue = RPG.SkillCap
    if level > maxValue then
        Cheat:logError("Skill level cannot exceed skill cap [%s].", tostring(maxValue))
        return false
    end

    player.soul:AdvanceToSkillLevel(skill_name, level)
    Cheat:logInfo("Added [%s] levels to skill [%s], new level is [%s].", tostring(levels), tostring(skill_name), tostring(level))
    return true
end

-- ============================================================================
-- test_core_player
-- ============================================================================
function Cheat:test_core_skills()
    Cheat:beginTest("test_core_skills")

    -- find_skills
    local skills = Cheat:find_skills(nil)
    Cheat:testAssert("find_skills all skills", #skills > 1)

    -- find_skill
    local id1, name1 = Cheat:find_skill("fakeskill")
    Cheat:testAssert("find_skill fakeskill", id1 == nil and name1 == nil)

    local id2, name2 = Cheat:find_skill("marksmanship")
    Cheat:testAssert("find_skill marksmanship", id2 == "19" and name2 == "marksmanship")

    -- cheat_find_skills
    Cheat:testAssert("cheat_find_skills marksmanship 1", Cheat:cheat_find_skills("token:marksmanship"))

    -- cheat_set_skill_level
    Cheat:testAssertFalse("cheat_set_skill_level invalid 1", Cheat:cheat_set_skill_level(""))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 2", Cheat:cheat_set_skill_level("skill:marksmanship"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 3", Cheat:cheat_set_skill_level("level:1"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 4", Cheat:cheat_set_skill_level("skill:invalidskillname"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 5", Cheat:cheat_set_skill_level("skill:marksmanship level:0"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 6", Cheat:cheat_set_skill_level("skill:marksmanship level:-1"))
    Cheat:testAssertFalse("cheat_set_skill_level invalid 7", Cheat:cheat_set_skill_level("skill:marksmanship level:99"))

    Cheat:testAssert("cheat_set_skill_level marksmanship 1", Cheat:cheat_set_skill_level("skill:marksmanship level:20"))
    Cheat:testAssert("cheat_set_skill_level marksmanship 2", Cheat:get_skill_level("marksmanship") == 20)

    -- cheat_add_skill_levels
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 1", Cheat:cheat_add_skill_levels(""))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 2", Cheat:cheat_add_skill_levels("skill:marksmanship"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 3", Cheat:cheat_add_skill_levels("levels:1"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 4", Cheat:cheat_add_skill_levels("skill:notaskill"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 5", Cheat:cheat_add_skill_levels("skill:marksmanship levels:0"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 6", Cheat:cheat_add_skill_levels("skill:marksmanship levels:-1"))
    Cheat:testAssertFalse("cheat_add_skill_levels invalid 7", Cheat:cheat_add_skill_levels("skill:marksmanship levels:99"))

    Cheat:testAssert("cheat_add_skill_levels marksmanship 1", Cheat:cheat_add_skill_levels("skill:marksmanship levels:1"))
    Cheat:testAssert("cheat_add_skill_levels marksmanship 2", Cheat:get_skill_level("marksmanship") == 21)

    Cheat:endTest()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_skills.lua loaded")
