-- ============================================================================
-- argument functions
-- ============================================================================
function Cheat:argsParse(line)
    -- this method is designed to parse a string of args passed to a console command
    -- some interesting things to note
    -- 1. you can't pass = sign as an arg to a console command, no idea why but it acts a terminator for the passed string (KCD 1 and 2)
    -- 2. you can't pass multiple arguments, has to be 1 string

    if line == nil then
        Cheat:logDebug("no args passed")
        return {}
    end

    Cheat:logDebug("parsing args line [%s]", tostring(line))
    local args = {}
    local key = nil

    if not line then
        return args
    end

    local words = string.gmatch(string.gsub(line, ":", ": "), "%S+")

    for word in words do
        if Cheat:endsWith(word, ":") then
            if key then
                Cheat:logDebug("parsed key=[%s] value=[%s]", key, args[key])
            end
            key = string.sub(word, 0, string.len(word) - 1)
            args[key] = nil
        elseif key then
            if args[key] == nil then
                args[key] = word
            else
                args[key] = args[key] .. " " .. word
            end
        else
            -- no open key and read a token that isn not a key
            -- user syntax error
            break
        end
    end

    return args
end

function Cheat:argsProcess(line, cmdArgsSet, cmdName)
    local results = {}
    local displayHelp = false
    if cmdArgsSet then
        local args = Cheat:argsParse(line)
        local argsEmpty = next(args) == nil
        if argsEmpty and cmdArgsSet.default_arg then
            args[cmdArgsSet.default_arg] = line
            Cheat:logDebug("Using default argument [%s] with value [%s].", cmdArgsSet.default_arg, line)
        end
        if args then
            for key, val in pairs(cmdArgsSet) do
                if key ~= "default_arg" then
                    local value, valueErr = val(args, key, false)

                    if valueErr then
                        displayHelp = true
                    end

                    local result = {}
                    result.value = value
                    result.valueErr = valueErr

                    results[key] = result
                end
            end
        end
    end

    if displayHelp then
        if cmdName then
            -- This is the only way to display all the newlines in the console help text
            System.ExecuteCommand(cmdName .. " ?")
        end
    end

    return results
end

function Cheat:argsGet(args, name)
    return args[name].value, args[name].valueErr
end

function Cheat:argsGetRequired(args, argName, showHelp, help)
    if showHelp then
        return "($4required$5) " .. help
    end

    local returnValue = nil
    local returnErr = false
    local argValue = args[argName]
    if not Cheat:isBlank(argValue) then
        returnValue = argValue
        Cheat:logDebug("Read required argument [" .. argName .. "] with value [" .. tostring(argValue) .. "].")
    else
        Cheat:logError("Missing required argument [" .. argName .. "].")
        returnErr = true
    end
    return returnValue, returnErr
end

function Cheat:argsGetRequiredBoolean(args, argName, showHelp, help)
    if showHelp then
        return "($4required boolean$5) " .. help
    end

    local returnValue = nil
    local returnErr = false
    local argValue = args[argName]
    if not Cheat:isBlank(argValue) then
        if Cheat:isBoolean(argValue) then
            returnValue = Cheat:toBoolean(argValue)
            Cheat:logDebug("Read required argument [" .. argName .. "] with value [" .. tostring(returnValue) .. "].")
        else
            Cheat:logError("Value for argument [" .. argName .. "] is not a boolean.")
            returnErr = true
        end
    else
        Cheat:logError("Missing required argument [" .. argName .. "].")
        returnErr = true
    end
    return returnValue, returnErr
end

function Cheat:argsGetRequiredNumber(args, argName, showHelp, help)
    if showHelp then
        return "($4required number$5) " .. help
    end

    local returnValue = nil
    local returnErr = false
    local argValue = args[argName]
    if not Cheat:isBlank(argValue) then
        if Cheat:isNumber(argValue) then
            returnValue = tonumber(argValue)
            Cheat:logDebug("Read required argument [%s] with value [%s].", tostring(argName), tostring(returnValue))
        else
            Cheat:logError("Value for argument [%s] is not a number.", tostring(argName))
            returnErr = true
        end
    else
        Cheat:logError("Missing required argument [%s].", tostring(argName))
        returnErr = true
    end
    return returnValue, returnErr
end

function Cheat:argsGetOptional(args, argName, defaultValue, showHelp, help)
    if showHelp then
        return "($3optional$5) " .. help
    end

    local returnValue = nil
    local returnErr = false
    local argValue = args[argName]
    if not Cheat:isBlank(argValue) then
        returnValue = argValue
        Cheat:logDebug("Read optional argument [%s] with value [%s].", tostring(argName), tostring(argValue))
    else
        Cheat:logDebug("Using default value [%s] for optional argument [%s].", tostring(defaultValue), tostring(argName))
        returnValue = defaultValue
    end
    return returnValue, returnErr
end

function Cheat:argsGetOptionalBoolean(args, argName, defaultValue, showHelp, help)
    if showHelp then
        return "($3optional boolean$5) " .. help
    end

    local returnValue = nil
    local returnErr = false
    local argValue = args[argName]
    if not Cheat:isBlank(argValue) then
        if Cheat:isBoolean(argValue) then
            returnValue = Cheat:toBoolean(argValue)
            Cheat:logDebug("Read optional argument [" .. argName .. "] with value [" .. tostring(returnValue) .. "].")
        else
            Cheat:logError("Value [" .. tostring(argValue) .. "] for argument [" .. argName .. "] is not a boolean.")
            returnErr = true
        end
    else
        Cheat:logDebug("Using default value [" .. tostring(defaultValue) .. "] for optional argument [" .. argName .. "].")
        returnValue = defaultValue
    end
    return returnValue, returnErr
end

function Cheat:argsGetOptionalNumber(args, argName, defaultValue, showHelp, help)
    if showHelp then
        return "($3optional number$5) " .. help
    end

    local returnValue = nil
    local returnErr = false
    local argValue = args[argName]
    if not Cheat:isBlank(argValue) then
        if Cheat:isNumber(argValue) then
            returnValue = tonumber(argValue)
            Cheat:logDebug("Read optional argument [" .. argName .. "] with value [" .. tostring(returnValue) .. "].")
        else
            Cheat:logError("Value [" .. tostring(argValue) .. "] for argument [" .. argName .. "] is not a number.")
            returnErr = true
        end
    else
        Cheat:logDebug("Using default value [" .. tostring(defaultValue) .. "] for optional argument [" .. argName .. "].")
        returnValue = defaultValue
    end
    return returnValue, returnErr
end

function Cheat:runTests()
    Cheat:beginTest("cheat_args.lua")
    local testval, testerr = nil, nil

    local argstest = {}
    argstest["a_string"] = "the string"
    argstest["a_number"] = 73
    argstest["a_string_number"] = "73"
    argstest["a_false_boolean"] = false
    argstest["a_string_false_boolean"] = false
    argstest["a_true_boolean"] = true
    argstest["a_string_true_boolean"] = true
    argstest["empty_token"] = ""
    argstest["nil_token"] = nil

    -- required
    testval, testerr = Cheat:argsGetRequired(argstest, "a_string")
    Cheat:testAssert("didn't get required string", testval == "the string" and not testerr)

    testval, testerr = Cheat:argsGetRequiredNumber(argstest, "a_number")
    Cheat:testAssert("didn't get required number", testval == 73 and not testerr)

    testval, testerr = Cheat:argsGetRequiredBoolean(argstest, "a_false_boolean")
    Cheat:testAssert("didn't get required false boolean", testval == false and not testerr)

    testval, testerr = Cheat:argsGetRequiredBoolean(argstest, "a_true_boolean")
    Cheat:testAssert("didn't get required true boolean", testval == true and not testerr)

    testval, testerr = Cheat:argsGetRequired(argstest, "does not exist")
    Cheat:testAssert("incorrectly got required string", testval == nil and testerr == true)

    testval, testerr = Cheat:argsGetRequiredNumber(argstest, "a_false_boolean")
    Cheat:testAssert("incorrectly got required boolean", testval == nil and testerr == true)

    testval, testerr = Cheat:argsGetRequiredBoolean(argstest, "a_number")
    Cheat:testAssert("incorrectly got required number", testval == nil and testerr == true)

    -- optional
    testval, testerr = Cheat:argsGetOptional(argstest, "a_string", "the 2nd string")
    Cheat:testAssert("didn't get optional string", testval == "the string" and not testerr)

    testval, testerr = Cheat:argsGetOptionalNumber(argstest, "a_number", 37)
    Cheat:testAssert("didn't get optional number", testval == 73 and not testerr)

    testval, testerr = Cheat:argsGetOptionalNumber(argstest, "a_string_number", 37)
    Cheat:testAssert("didn't get optional string number", testval == 73 and not testerr)

    testval, testerr = Cheat:argsGetOptionalBoolean(argstest, "a_false_boolean", true)
    Cheat:testAssert("didn't get optional false boolean", testval == false and not testerr)

    testval, testerr = Cheat:argsGetOptionalBoolean(argstest, "a_string_false_boolean", true)
    Cheat:testAssert("didn't get optional string false boolean", testval == false and not testerr)

    testval, testerr = Cheat:argsGetOptionalBoolean(argstest, "a_true_boolean", false)
    Cheat:testAssert("didn't get optional true boolean", testval == true and not testerr)

    testval, testerr = Cheat:argsGetOptionalBoolean(argstest, "a_string_true_boolean", false)
    Cheat:testAssert("didn't get optional string true boolean", testval == true and not testerr)

    testval, testerr = Cheat:argsGetOptional(argstest, "does not exist", "the 2nd string")
    Cheat:testAssert("didn't get optional default string", testval == "the 2nd string" and testerr == false)

    testval, testerr = Cheat:argsGetOptionalNumber(argstest, "does not exist", 97)
    Cheat:testAssert("didn't get optional default number", testval == 97 and testerr == false)

    testval, testerr = Cheat:argsGetOptionalBoolean(argstest, "does not exist", true)
    Cheat:testAssert("didn't get optional default boolean", testval == true and testerr == false)

    testval, testerr = Cheat:argsGetOptionalNumber(argstest, "a_false_boolean", 79)
    Cheat:testAssert("incorrectly got optional boolean", testval == nil and testerr == true)

    testval, testerr = Cheat:argsGetOptionalBoolean(argstest, "a_number", false)
    Cheat:testAssert("incorrectly got optional number", testval == nil and testerr == true)

    testval, testerr = Cheat:argsGetOptional(argstest, "empty_token", nil)
    Cheat:testAssert("didn't get optional empty token", testval == nil and testerr == false)

    testval, testerr = Cheat:argsGetOptional(argstest, "nil_token", nil)
    Cheat:testAssert("didn't get optional nil token", testval == nil and testerr == false)


    local argsSet = {
        token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "token help") end
    }

    local args = Cheat:argsProcess("token:test123", argsSet)
    local testToken, testTokenErr = Cheat:argsGet(args, "token")
    Cheat:testAssert("didn't get correct test token value got: " .. tostring(testToken),
        testToken == "test123" and testTokenErr == false)

    local argsSetWithDefault = {
        default_arg = "token",
        token = function (args, name, showHelp) return Cheat:argsGetOptional(args, name, nil, showHelp, "token help") end
    }

    local args = Cheat:argsProcess("test123", argsSetWithDefault)
    local testToken, testTokenErr = Cheat:argsGet(args, "token")
    Cheat:testAssert("didn't get correct test token value got: " .. tostring(testToken),
        testToken == "test123" and testTokenErr == false)

    testval = Cheat:argsParse("x:1")
    Cheat:testAssert("didn't parse x:1", testval["x"] == "1")

    testval = Cheat:argsParse("x:1 y:2")
    Cheat:testAssert("didn't parse x:1 y:2", testval["x"] == "1" and testval["y"] == "2")

    testval = Cheat:argsParse("x:foo y:bar")
    Cheat:testAssert("didn't parse x:foo y:bar", testval["x"] == "foo" and testval["y"] == "bar")

    testval = Cheat:argsParse("x:foo bar y:hellow world")
    Cheat:testAssert("didn't parse x:foo bar y:hellow world", testval["x"] == "foo bar" and testval["y"] == "hellow world")

    testval = Cheat:argsParse(" x: foo bar   y: hellow world  ")
    Cheat:testAssert("didn't parse x: foo bar y: hellow world",
        testval["x"] == "foo bar" and testval["y"] == "hellow world")


    local test_args = {
        file = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The file to execute.") end
    }
    local testargs = Cheat:argsProcess("", test_args)
    local testfilename, testfilenameErr = Cheat:argsGet(testargs, "file")
    Cheat:testAssert("didn't return missing file argument error", testfilename == nil and testfilenameErr == true)


    local test_args = {
        file = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The file to execute.") end
    }
    local testargs = Cheat:argsProcess("asdf", test_args)
    local testfilename, testfilenameErr = Cheat:argsGet(testargs, "file")
    Cheat:testAssert("didn't return missing file argument error on no colon input",
        testfilename == nil and testfilenameErr == true)


    local test_args = {
        file = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The file to execute.") end
    }
    local testargs = Cheat:argsProcess(nil, test_args)
    local testfilename, testfilenameErr = Cheat:argsGet(testargs, "file")
    Cheat:testAssert("didn't return missing file argument error on nil input",
        testfilename == nil and testfilenameErr == true)

    Cheat:endTest()
end

if Cheat:testEnabled() then
    Cheat:runTests()
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_args.lua loaded")
