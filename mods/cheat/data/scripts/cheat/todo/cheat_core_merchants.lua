-- ============================================================================
-- cheat_set_all_merchants_fence
-- ============================================================================
Cheat.cheat_set_all_merchants_fence_args = {
  enable = function (args, name, showHelp) return Cheat:argsGetRequiredBoolean(args, name, showHelp, "true or false") end,
}

Cheat:createCommandLegacy("cheat_set_all_merchants_fence", "Cheat:cheat_set_all_merchants_fence(%line)",
  Cheat.cheat_set_all_merchants_fence_args,
  "Flags all merchants so they accept stolen goods.\n$8Restarting the game reverts this effect.",
  "Turn it on", "cheat_set_all_merchants_fence enable:true",
  "Turn it off", "cheat_set_all_merchants_fence enable:false")
function Cheat:cheat_set_all_merchants_fence(line)
  local args = Cheat:argsProcess(line, Cheat.cheat_set_all_merchants_fence_args)
  local enable, enableErr = Cheat:argsGet(args, "enable")
  if not enableErr then
    SocialClass.defaultValues.dealsWithStolenItems = enable
    Cheat:logInfo("default dealsWithStolenItems[%s]", tostring(enable))

    for socialClassName, socialClassTable in pairs(SocialClass.data) do
      socialClassTable["dealsWithStolenItems"] = enable
      Cheat:logInfo("%s dealsWithStolenItems[%s]", tostring(socialClassName), tostring(enable))
    end

    Cheat:logInfo("Done.")
    return true
  end
  return false
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_merchants.lua loaded")
