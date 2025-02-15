if Cheat.isCommandLineBuild then
  System = {}
  System["AddCCommand"] = function(cmdName, cmdFunc, cmdHelp)
    --Cheat:logDebug("Fake System.AddCCommand(%s, %s, %s) called . ", cmdName, cmdFunc, cmdHelp)
  end

  System["LogAlways"] = function(value)
    --Cheat:logDebug("Fake System.LogAlways called.")
  end

  System["ExecuteCommand"] = function(command)
    --Cheat:logDebug("Fake System.ExecuteCommand called.")
  end

  Script = {}
  Script["SetTimer"] = function(millis, func)
    --Cheat:logDebug("Fake Script.SetTimer called.")
  end

  UIAction = {}
  UIAction["RegisterActionListener"] = function(table, actionName, eventName, callbackFunctionName)
    --Cheat:logDebug("Fake UIAction.RegisterActionListener called.")
  end

  UIAction["RegisterElementListener"] = function(table, elementName, instanceID, eventName, callbackFunctionName)
    --Cheat:logDebug("Fake UIAction.RegisterElementListener called.")
  end

  UIAction["RegisterEventSystemListener"] = function(table, eventSystem, eventName, callbackFunctionName)
    --Cheat:logDebug("Fake UIAction.RegisterEventSystemListener called.")
  end

  Cheat:logWarn("Stubs Active")

  -- ============================================================================
  -- end
  -- ============================================================================
  Cheat:logDebug("cheat_stubs.lua loaded")
end
