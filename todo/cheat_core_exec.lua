-- file IO no longer seems to work on KCD 1.93
-- this file is no longer loaded from main.lua

function Cheat:execReset()
    Cheat.execList = {}
    Cheat.execListIndex = 1
    Cheat.execListTimerId = nil
    Cheat.execListTimerDelayMs = 0
end

-- ============================================================================
-- processExecList
-- ============================================================================
function Cheat:processExecList(nTimerId)
    while true do
        local command = Cheat.execList[Cheat.execListIndex]
        if command then
            Cheat.execListIndex = Cheat.execListIndex + 1
            Cheat:logInfo("Running command [%s].", tostring(command))
            System.ExecuteCommand(command)
            if Cheat.execListTimerDelayMs > 0 then
                Cheat.execListTimerI = Script.SetTimer(Cheat.execListTimerDelayMs,
                    function (nTimerId) Cheat:processExecList(nTimerId) end)
                Cheat.execListTimerDelayMs = 0
                return
            end
        else
            Cheat:execReset()
            return
        end
    end
end

-- ============================================================================
-- cheat_exec_delay
-- ============================================================================
Cheat.cheat_exec_delay_args = {
    ms = function (args, name, showHelp)
        return Cheat:argsGetRequiredNumber(args, name, showHelp,
            "The number of milliseconds to delay the next command.")
    end,
}

Cheat:createCommandLegacy("cheat_exec_delay", "Cheat:cheat_exec_delay(%line)", Cheat.cheat_exec_delay_args,
    "Sets the number of milliseconds to delay execution of the next command.",
    "1 second delay", "cheat_exec_delay ms:1000")
function Cheat:cheat_exec_delay(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_exec_delay_args)
    local ms, msErr = Cheat:argsGet(args, "ms")
    if not msErr then
        Cheat.execListTimerDelayMs = ms
    end
end

-- ============================================================================
-- cheat_exec_file
-- ============================================================================
Cheat.cheat_exec_file_args = {
    file = function (args, name, showHelp) return Cheat:argsGetRequired(args, name, showHelp, "The file to execute.") end
}

Cheat:createCommandLegacy("cheat_exec_file", "Cheat:cheat_exec_file(%line)", Cheat.cheat_exec_file_args,
    "Executes a file of console commands. Use an absolute path or\n$8path relative to SteamLibrary\\steamapps\\common\\KingdomComeDeliverance.",
    "Manually run autocheat.txt", "cheat_exec_file file:Data\\autocheat.txt")
function Cheat:cheat_exec_file(line)
    local args = Cheat:argsProcess(line, Cheat.cheat_exec_file_args)
    local filename, filenameErr = Cheat:argsGet(args, "file")
    if not filenameErr then
        local file, fileErr = io.open(filename, "r")
        if file and not fileErr then
            Cheat:logInfo("Loading commands from file [%s].", filename)
            Cheat:execReset()
            while true do
                local command = file:read("*line")
                if command then
                    table.insert(Cheat.execList, command)
                else
                    break
                end
            end
            file:close()
            Cheat:logInfo("Executing [%d] commands.", #Cheat.execList)
            Cheat:processExecList(0)
        else
            Cheat:logError("Unable to open file [%s].", filename)
        end
    end
end

-- ============================================================================
-- cheat_auto_exec
-- ============================================================================
Cheat:createCommandLegacy("cheat_auto_exec", "Cheat:cheat_auto_exec()", nil,
    "This command does nothing and is here for documentation only.\n$8" ..
    "You can run cheat commands automatically when a level loads by placing them in file Data\autocheat.txt.\n$8" ..
    "This is useful for commands that are not permanent.")
function Cheat:cheat_auto_exec()
    local filename = "Data\\autocheat.txt"
    local file, fileErr = io.open(filename, "r")
    if file and not fileErr then
        Cheat:logInfo("Loading commands from file [%s].", filename)
        Cheat:execReset()
        while true do
            local command = file:read("*line")
            if command then
                table.insert(Cheat.execList, command)
            else
                break
            end
        end
        file:close()
        Cheat:logInfo("Executing [%d] commands.", #Cheat.execList)
        Cheat:processExecList(0)
    else
        Cheat:logWarn("Unable to open file [%s]. You can ignore this if you aren't using autocheat.txt.", filename)
    end
end

-- ============================================================================
-- end
-- ============================================================================
Cheat:logDebug("cheat_core_exec.lua loaded")
