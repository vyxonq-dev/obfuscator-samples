-- Remote Go Brr v0.2.0
if shared.AEH_Cleanup then pcall(shared.AEH_Cleanup) end
shared.AEH_Running = true
local SessionId = tick()
shared.AEH_SessionId = SessionId

local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local CoreGui           = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService       = game:GetService("HttpService")
local LocalPlayer       = Players.LocalPlayer

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local IsInitializing = true
local OriginalNotify = Rayfield.Notify
Rayfield.Notify = function(self, data)
    if IsInitializing then return end
    OriginalNotify(self, data)
end

local Config = {
    Enabled        = false,
    FireIntervalMs = 100,
    GlobalKeybinds = true,
    MinIntervalMs  = nil,
    MaxIntervalMs  = nil,
    AntiAFK        = false,
    ShowNonFirable = false,
    AutoSave       = true,
    HideCursor     = false,
    ToggleUIKey    = "LeftControl",
}

local Connections    = {}
local Hooked         = {}
local HookedCount    = 0
local TotalFireCount = 0
local IsLogging      = false
local RemoteLog      = {}
local ExcludeList    = {}
local SpyHookActive  = shared.AEH_SpyHookActive or false
local BrowseResults  = {}
local SavePrefix     = "RemoteGoBrr/" .. game.PlaceId .. "_"
local HookedDirty    = true
local LastStatsText  = ""
local ActiveTime     = 0
local ScanPath       = "ReplicatedStorage"
local IsAutoFiring   = false
local CDLog          = {}

if makefolder then pcall(makefolder, "RemoteGoBrr") end

-- // Utility
local function formatNumber(n)
    if n >= 1000000 then return string.format("%.1fM", n / 1000000)
    elseif n >= 1000 then return string.format("%.1fK", n / 1000) end
    return tostring(n)
end

local function fullPath(inst)
    local parts = {}
    local cur = inst
    while cur and cur ~= game do
        table.insert(parts, 1, cur.Name)
        cur = cur.Parent
    end
    return table.concat(parts, ".")
end

local function parseArgs(argStr)
    if not argStr or argStr == "" then return {n = 0} end
    local fn_str = "local function p(...) local t = {...}; t.n = select('#', ...); return t end return p(" .. argStr .. ")"
    local fn = loadstring(fn_str)
    if fn then
        local env = setmetatable({
            LocalPlayer = LocalPlayer, Player = LocalPlayer,
            workspace = workspace, game = game,
        }, { __index = getfenv() })
        setfenv(fn, env)
        local ok, result = pcall(fn)
        if ok and type(result) == "table" then return result end
    end
    return {n = 0}
end

local function isFirable(inst)
    return inst:IsA("RemoteEvent") or inst:IsA("UnreliableRemoteEvent")
end

local function shortClass(inst)
    if inst:IsA("UnreliableRemoteEvent") then return "Unreliable"
    elseif inst:IsA("RemoteEvent")       then return "Remote"
    elseif inst:IsA("RemoteFunction")    then return "Function"
    elseif inst:IsA("BindableEvent")     then return "Bindable"
    elseif inst:IsA("Folder")            then return "Folder"
    else return inst.ClassName end
end

local function shortClassFromName(className)
    if className == "UnreliableRemoteEvent" then return "Unreliable"
    elseif className == "RemoteEvent" then return "Remote"
    elseif className == "RemoteFunction" then return "Function"
    elseif className == "BindableEvent" then return "Bindable"
    else return className end
end

local function isUIVisible()
    local ok, visible = pcall(function() return Rayfield:IsVisible() end)
    return ok and visible
end

-- // Save / Load
local function saveHookedRemotes()
    if not writefile or IsInitializing or not Config.AutoSave then return end
    local hooks = {}
    for remote, hookData in pairs(Hooked) do
        if remote and remote.Parent then
            table.insert(hooks, {
                path       = fullPath(remote),
                argString  = hookData.argString or "",
                intervalMs = hookData.intervalMs,
                burstLimit = hookData.burstLimit,
            })
        end
    end
    
    local payload = {
        version = "2",
        hooks = hooks,
        config = {
            fireInterval = Config.FireIntervalMs,
            minInterval = Config.MinIntervalMs,
            maxInterval = Config.MaxIntervalMs,
            antiAFK = Config.AntiAFK,
            globalKeybinds = Config.GlobalKeybinds,
            showNonFirable = Config.ShowNonFirable,
            autoSave = Config.AutoSave,
            hideCursor = Config.HideCursor,
            toggleUIKey = Config.ToggleUIKey
        }
    }
    pcall(writefile, SavePrefix .. "hooked.json", HttpService:JSONEncode(payload))
end

local function saveExcludeList()
    if not writefile or IsInitializing then return end
    local names = {}
    for name in pairs(ExcludeList) do table.insert(names, name) end
    pcall(writefile, SavePrefix .. "exclude.json", HttpService:JSONEncode(names))
end

-- // Forward Declarations
local hookRemote, unhookRemote, clearAll
local refreshHookedList, refreshStatus
local refreshExcludeList
local doScanRemotes, doStartSpy, doStopSpy, toggleSpy, doCopyResults
local AutoSaveToggle, HideCursorToggle

-- // Load Functions
local function loadHookedRemotes()
    if not readfile then return end
    local ok, raw = pcall(readfile, SavePrefix .. "hooked.json")
    if not ok or not raw or raw == "" then return end
    local decoded
    local ok2 = pcall(function() decoded = HttpService:JSONDecode(raw) end)
    if not ok2 or not decoded then return end

    local entries = decoded
    if type(decoded) == "table" and decoded.version == "2" then
        entries = decoded.hooks
        if decoded.config then
            local c = decoded.config
            local oldInit = IsInitializing
            IsInitializing = true
            if c.fireInterval then Config.FireIntervalMs = c.fireInterval; if IntervalInput then IntervalInput:Set(tostring(c.fireInterval)) end end
            if c.minInterval ~= nil and c.maxInterval ~= nil then
                Config.MinIntervalMs = c.minInterval
                Config.MaxIntervalMs = c.maxInterval
                if JitterInput then JitterInput:Set(c.minInterval .. "-" .. c.maxInterval) end
            elseif c.minInterval == nil and c.maxInterval == nil then
                Config.MinIntervalMs = nil
                Config.MaxIntervalMs = nil
                if JitterInput then JitterInput:Set("") end
            end
            if c.antiAFK ~= nil then Config.AntiAFK = c.antiAFK; if AFKToggle then AFKToggle:Set(c.antiAFK) end end
            if c.globalKeybinds ~= nil then Config.GlobalKeybinds = c.globalKeybinds; if GlobalKeyToggle then GlobalKeyToggle:Set(c.globalKeybinds) end end
            if c.showNonFirable ~= nil then Config.ShowNonFirable = c.showNonFirable; if ShowNonFirableToggle then ShowNonFirableToggle:Set(c.showNonFirable) end end
            if c.autoSave ~= nil then Config.AutoSave = c.autoSave; if AutoSaveToggle then AutoSaveToggle:Set(c.autoSave) end end
            if c.hideCursor ~= nil then Config.HideCursor = c.hideCursor; if HideCursorToggle then HideCursorToggle:Set(c.hideCursor) end; pcall(function() game:GetService("UserInputService").MouseIconEnabled = not c.hideCursor end) end
            IsInitializing = oldInit
        end
    end

    local loaded = 0
    local failed = {}
    for _, entry in ipairs(entries) do
        local parts = string.split(entry.path, ".")
        local current = game
        local valid = true
        for _, name in ipairs(parts) do
            local child = current:FindFirstChild(name)
            if not child then valid = false; break end
            current = child
        end
        if valid and isFirable(current) and not Hooked[current] then
            hookRemote(current, entry.argString or "")
            if entry.intervalMs then Hooked[current].intervalMs = entry.intervalMs end
            if entry.burstLimit then Hooked[current].burstLimit = entry.burstLimit end
            loaded = loaded + 1
        else
            table.insert(failed, { path = entry.path, argString = entry.argString or "", intervalMs = entry.intervalMs, burstLimit = entry.burstLimit })
        end
    end

    if #failed > 0 then
        task.delay(5, function()
            local retryLoaded = 0
            for _, entry in ipairs(failed) do
                local parts = string.split(entry.path, ".")
                local current = game
                local valid = true
                for _, name in ipairs(parts) do
                    local child = current:FindFirstChild(name)
                    if not child then valid = false; break end
                    current = child
                end
                if valid and isFirable(current) and not Hooked[current] then
                    hookRemote(current, entry.argString)
                    if entry.intervalMs then Hooked[current].intervalMs = entry.intervalMs end
                    if entry.burstLimit then Hooked[current].burstLimit = entry.burstLimit end
                    retryLoaded = retryLoaded + 1
                end
            end
            if retryLoaded > 0 then
                HookedDirty = true
                if refreshHookedList then refreshHookedList() end
                Rayfield:Notify({ Title = "Retry loaded " .. retryLoaded, Content = "Late-spawning remotes restored.", Duration = 3 })
            end
        end)
    end

    if loaded > 0 then
        Rayfield:Notify({
            Title   = "Loaded " .. loaded .. " remote(s)",
            Content = #failed > 0 and (#failed .. " pending retry...") or "All restored.",
            Duration = 4,
        })
    end
end

local function loadExcludeList()
    if not readfile then return end
    local ok, raw = pcall(readfile, SavePrefix .. "exclude.json")
    if not ok or not raw or raw == "" then return end
    local ok2, decoded = pcall(function() return HttpService:JSONDecode(raw) end)
    if not ok2 or not decoded then return end
    for _, name in ipairs(decoded) do ExcludeList[name] = true end
    if refreshExcludeList then refreshExcludeList() end
end

local function resolveHookedRemote(text)
    local idx = tonumber(text)
    if idx then
        local i = 0
        for remote, data in pairs(Hooked) do
            i = i + 1
            if i == idx then return remote, data end
        end
        return nil, nil
    end
    for remote, data in pairs(Hooked) do
        if remote.Name == text then return remote, data end
    end
    return nil, nil
end

local function getSavedProfiles()
    local names = {}
    if listfiles then
        local ok, files = pcall(listfiles, "RemoteGoBrr")
        if ok and type(files) == "table" then
            for _, file in ipairs(files) do
                local match = string.match(file, game.PlaceId .. "_profile_(.+)%.json$")
                if match then table.insert(names, match) end
            end
        end
    end
    if #names == 0 then return {"(None)"} end
    return names
end

-- // Pre-load UI keybind before Window creation
do
    if readfile then
        local ok, raw = pcall(readfile, SavePrefix .. "hooked.json")
        if ok and raw and raw ~= "" then
            pcall(function()
                local d = HttpService:JSONDecode(raw)
                if d and d.config and d.config.toggleUIKey then
                    Config.ToggleUIKey = d.config.toggleUIKey
                end
            end)
        end
    end
end

-- // Window
local Window = Rayfield:CreateWindow({
    Name            = "Remote Go Brr v0.2.0",
    Icon            = 0,
    LoadingTitle    = "Remote Go Brr",
    LoadingSubtitle = "v0.2.0",
    Theme           = "Default",
    ToggleUIKeybind = Enum.KeyCode[Config.ToggleUIKey] or Enum.KeyCode.LeftControl,
    ConfigurationSaving = {
        Enabled = false
    },
})

-- // Tab 1 - Main
local MainTab = Window:CreateTab("Main", "zap")

MainTab:CreateSection("Auto-Fire & Configuration")

local StatusLabel = MainTab:CreateParagraph({ Title = "Engine", Content = "OFF  |  0 hooked" })
local StatsLabel = MainTab:CreateParagraph({ Title = "Stats", Content = "Total: 0  |  0/sec" })

local AutoToggle, IntervalInput, JitterInput, SpyToggle, AFKToggle, GlobalKeyToggle, ShowNonFirableToggle

AutoToggle = MainTab:CreateToggle({
    Name = "Enable Auto-Fire  [F]",
    CurrentValue = false,
    Flag = "RH_Enabled",
    Callback = function(val)
        Config.Enabled = val
        if refreshStatus then refreshStatus() end
        Rayfield:Notify({
            Title   = val and "Auto-Fire ON" or "Auto-Fire OFF",
            Content = val and (HookedCount .. " remote(s)") or "Stopped",
            Duration = 2,
        })
    end,
})

IntervalInput = MainTab:CreateInput({
    Name = "Base Interval (ms)",
    CurrentValue = "100",
    PlaceholderText = "100",
    RemoveTextAfterFocusLost = false,
    Flag = "IntervalInput",
    Callback = function(text)
        local num = tonumber(text)
        if not num then Rayfield:Notify({ Title = "Error", Content = "Enter a number", Duration = 2 }); return end
        num = math.floor(math.max(1, num))
        Config.FireIntervalMs = num
        if not IsInitializing then saveHookedRemotes() end
        Rayfield:Notify({ 
            Title = "Interval Set", 
            Content = num .. "ms  (~" .. string.format("%.0f", 1000/num) .. "/sec)", 
            Duration = 2 
        })
    end,
})

JitterInput = MainTab:CreateInput({
    Name = "Random Range (Min-Max)",
    CurrentValue = "",
    PlaceholderText = "e.g. 50-200 (leave blank to disable)",
    RemoveTextAfterFocusLost = false,
    Flag = "JitterInput",
    Callback = function(text)
        if text == "" or not string.find(text, "[-%,]") then
            Config.MinIntervalMs = nil
            Config.MaxIntervalMs = nil
            if not IsInitializing then saveHookedRemotes() end
            if text ~= "" then
                Rayfield:Notify({ Title = "Format Error", Content = "Use MIN-MAX or MIN,MAX", Duration = 2 })
            else
                Rayfield:Notify({ Title = "Randomization Disabled", Content = "Using base interval.", Duration = 2 })
            end
            return
        end
        local min, max = string.match(text, "(%d+)[-%,](%d+)")
        if min and max then
            Config.MinIntervalMs = math.floor(tonumber(min))
            Config.MaxIntervalMs = math.floor(tonumber(max))
            if not IsInitializing then saveHookedRemotes() end
            Rayfield:Notify({ 
                Title = "Random Range Set", 
                Content = min .. "ms to " .. max .. "ms", 
                Duration = 2 
            })
        else
            Rayfield:Notify({ Title = "Error", Content = "Invalid format. Use e.g. 50-200", Duration = 2 })
        end
    end,
})

MainTab:CreateSection("Hooked Remotes")

local HookedParagraph = MainTab:CreateParagraph({ Title = "Hooked (0)", Content = "None yet. Use Browse or Spy tab." })

MainTab:CreateButton({ Name = "Clear All  [X]", Callback = function() if clearAll then clearAll() end end })

MainTab:CreateSection("Remote Actions")

local MainActionType = "Unhook"
MainTab:CreateDropdown({
    Name = "Action Type",
    Options = {"Unhook", "Pause/Resume"},
    CurrentOption = {"Unhook"},
    MultipleOptions = false,
    Flag = "MainActionDropdown",
    Callback = function(Options) MainActionType = Options[1] or Options end,
})

MainTab:CreateInput({
    Name = "Remote",
    CurrentValue = "",
    PlaceholderText = "name or index number",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if text == "" then return end
        local remote, data = resolveHookedRemote(text)
        if not remote then
            Rayfield:Notify({ Title = "Not hooked", Content = text, Duration = 2 })
            return
        end
        if MainActionType == "Unhook" then
            unhookRemote(remote)
        elseif MainActionType == "Pause/Resume" then
            if data then
                data.paused = not data.paused
                HookedDirty = true
                if refreshHookedList then refreshHookedList() end
                Rayfield:Notify({ Title = data.paused and "Paused" or "Resumed", Content = remote.Name, Duration = 2 })
            end
        end
    end,
})

MainTab:CreateSection("Per-Remote Tuning")

local TuneRemoteField = ""
local TuneActionType = "Set Arguments"

MainTab:CreateInput({
    Name = "Remote",
    CurrentValue = "",
    PlaceholderText = "name or index number",
    RemoveTextAfterFocusLost = false,
    Callback = function(text) TuneRemoteField = text end,
})

MainTab:CreateDropdown({
    Name = "Setting to Change",
    Options = {"Set Arguments", "Set Interval (ms)", "Set Burst Limit", "Check Info"},
    CurrentOption = {"Set Arguments"},
    MultipleOptions = false,
    Flag = "TuneActionDropdown",
    Callback = function(Options) TuneActionType = Options[1] or Options end,
})

MainTab:CreateInput({
    Name = "Value",
    CurrentValue = "",
    PlaceholderText = "e.g. 33 or false,1",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if TuneRemoteField == "" then
            Rayfield:Notify({ Title = "Error", Content = "Set target remote first.", Duration = 2 })
            return
        end
        local targetRemote, _ = resolveHookedRemote(TuneRemoteField)
        if not targetRemote then
            Rayfield:Notify({ Title = "Not hooked", Content = TuneRemoteField, Duration = 2 })
            return
        end
        local data = Hooked[targetRemote]
        if TuneActionType == "Set Arguments" then
            data.argString = text
            data.args = parseArgs(text)
            HookedDirty = true
            saveHookedRemotes()
            Rayfield:Notify({ Title = "Args set", Content = targetRemote.Name .. " = " .. (text == "" and "(none)" or text), Duration = 2 })
        elseif TuneActionType == "Set Interval (ms)" then
            local ms = tonumber(text)
            if ms then
                data.intervalMs = ms
                HookedDirty = true
                saveHookedRemotes()
                Rayfield:Notify({ Title = "Interval set", Content = targetRemote.Name .. " @ " .. ms .. "ms", Duration = 2 })
            else
                Rayfield:Notify({ Title = "Error", Content = "Must be a number", Duration = 2 })
            end
        elseif TuneActionType == "Set Burst Limit" then
            local limit = tonumber(text)
            if limit then
                data.burstLimit = limit
                data.burstNotified = false
                data.fireCount = 0
                HookedDirty = true
                saveHookedRemotes()
                Rayfield:Notify({ Title = "Burst set", Content = targetRemote.Name .. " limit " .. limit, Duration = 2 })
            else
                Rayfield:Notify({ Title = "Error", Content = "Must be a number", Duration = 2 })
            end
        elseif TuneActionType == "Check Info" then
            local interval = data.intervalMs and (data.intervalMs .. "ms (custom)") or (Config.FireIntervalMs .. "ms (global)")
            local burst = data.burstLimit and (data.fireCount .. "/" .. data.burstLimit) or "None"
            local args = data.argString ~= "" and data.argString or "(none)"
            local state = data.paused and "PAUSED" or "Active"
            Rayfield:Notify({
                Title = targetRemote.Name .. " Info",
                Content = "State: " .. state ..
                    "\nInterval: " .. interval ..
                    "\nBurst: " .. burst ..
                    "\nFired: " .. formatNumber(data.fireCount) ..
                    "\nArgs: " .. args,
                Duration = 8
            })
        end
    end,
})

MainTab:CreateSection("Auto Clicker")

local ClickerEnabled = false
local ClickerIntervalMs = 100
local ClickerMode = "Toggle"
local ClickerHeld = false
local ClickerToggle

ClickerToggle = MainTab:CreateToggle({
    Name = "LMB Auto Clicker",
    CurrentValue = false,
    Flag = "RGB_AutoClicker",
    Callback = function(val) ClickerEnabled = val end,
})

MainTab:CreateDropdown({
    Name = "Clicker Mode",
    Options = {"Toggle", "Hold"},
    CurrentOption = {"Toggle"},
    MultipleOptions = false,
    Flag = "RGB_ClickerMode",
    Callback = function(Options) ClickerMode = Options[1] or Options end,
})

MainTab:CreateInput({
    Name = "Click Interval (ms)",
    CurrentValue = "100",
    PlaceholderText = "100",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local num = tonumber(text)
        if num then ClickerIntervalMs = math.floor(math.max(1, num)) end
    end,
})

task.spawn(function()
    while shared.AEH_Running and shared.AEH_SessionId == SessionId do
        local active = ClickerEnabled and (ClickerMode == "Toggle" or ClickerHeld)
        if active and not isUIVisible() then
            mouse1click()
            task.wait(ClickerIntervalMs / 1000)
        else
            task.wait(0.1)
        end
    end
end)

-- // Tab 2 - Browse
local BrowseTab = Window:CreateTab("Browse", "folder")

BrowseTab:CreateSection("Scan")

BrowseTab:CreateInput({
    Name = "Scan Path",
    CurrentValue = "ReplicatedStorage",
    PlaceholderText = "e.g. ReplicatedStorage.remotes",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        if text == "" then ScanPath = "ReplicatedStorage"; return end
        ScanPath = text
    end,
})

local BrowseParagraph = BrowseTab:CreateParagraph({ Title = "Scan Results", Content = "Scan to populate." })

doScanRemotes = function(fullGame)
    local target
    if fullGame then
        target = game
    else
        target = game
        for _, part in ipairs(string.split(ScanPath, ".")) do
            if part ~= "" then
                target = target:FindFirstChild(part)
                if not target then
                    BrowseParagraph:Set({ Title = "Error", Content = "Path not found: " .. ScanPath })
                    return
                end
            end
        end
    end

    BrowseResults = {}
    local lines = {}
    local idx = 0

    for _, desc in ipairs(target:GetDescendants()) do
        if isFirable(desc) then
            idx = idx + 1
            if idx > 1500 then break end
            table.insert(BrowseResults, desc)
            local hooked = Hooked[desc] and " [HOOKED]" or ""
            table.insert(lines,
                idx .. ".  " .. desc.Name ..
                "  (" .. shortClass(desc) .. ")" .. hooked ..
                (fullGame and ("\n      " .. fullPath(desc)) or ""))
        end
    end

    if Config.ShowNonFirable and not fullGame then
        table.insert(lines, "")
        table.insert(lines, "-- Non-firable --")
        local nfc = 0
        for _, desc in ipairs(target:GetDescendants()) do
            if not isFirable(desc) and #desc:GetChildren() == 0 then
                nfc = nfc + 1
                if nfc > 500 then break end
                table.insert(lines, "    " .. desc.Name .. "  (" .. shortClass(desc) .. ")")
            end
        end
    end

    BrowseParagraph:Set({
        Title   = idx .. " firable" .. (fullGame and " (game-wide)" or ""),
        Content = #lines > 0 and table.concat(lines, "\n") or "None found.",
    })
end

BrowseTab:CreateButton({ Name = "Scan Path  [G]", Callback = function() if doScanRemotes then doScanRemotes(false) end end })
BrowseTab:CreateButton({ Name = "Full Game Scan", Callback = function() if doScanRemotes then doScanRemotes(true) end end })

ShowNonFirableToggle = BrowseTab:CreateToggle({
    Name = "Show non-firable remotes in scan",
    CurrentValue = false,
    Flag = "RGB_ShowNonFirable",
    Callback = function(val) 
        Config.ShowNonFirable = val 
        if not IsInitializing then saveHookedRemotes() end
    end,
})

BrowseTab:CreateSection("Hook from List")

BrowseTab:CreateInput({
    Name = "Remote",
    CurrentValue = "",
    PlaceholderText = "1  or  1,3  or  all",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if #BrowseResults == 0 then Rayfield:Notify({ Title = "Scan first", Duration = 2 }); return end
        text = string.lower(string.gsub(text, "%s+", ""))
        local toHook = {}
        if text == "all" then
            for i = 1, #BrowseResults do table.insert(toHook, i) end
        else
            for part in string.gmatch(text, "[^,]+") do
                local num = tonumber(part)
                if num and BrowseResults[num] then table.insert(toHook, num) end
            end
        end
        if #toHook == 0 then return end
        local names = {}
        for _, i in ipairs(toHook) do
            local r = BrowseResults[i]
            if r and not Hooked[r] then
                hookRemote(r, "")
                table.insert(names, r.Name .. " (" .. shortClass(r) .. ")")
            end
        end
        Rayfield:Notify({ Title = "Hooked " .. #names, Content = table.concat(names, "\n"), Duration = 3 })
    end,
})

BrowseTab:CreateSection("Quick Actions")

local QuickActionType = "Hook"
BrowseTab:CreateDropdown({
    Name = "Action Type",
    Options = {"Hook", "Copy Code"},
    CurrentOption = {"Hook"},
    MultipleOptions = false,
    Flag = "BrowseActionType",
    Callback = function(Options) QuickActionType = Options[1] or Options end,
})

BrowseTab:CreateInput({
    Name = "Remote",
    CurrentValue = "",
    PlaceholderText = "e.g. click_xp",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if text == "" then return end
        local remote = ReplicatedStorage:FindFirstChild(text, true) or game:FindFirstChild(text, true)
        if not remote or not isFirable(remote) then
            Rayfield:Notify({ Title = "Not found or not firable", Content = text, Duration = 2 })
            return
        end
        if QuickActionType == "Copy Code" then
            local path = fullPath(remote)
            local args = Hooked[remote] and Hooked[remote].argString or ""
            local method = remote:IsA("RemoteFunction") and "InvokeServer" or "FireServer"
            local code = "game." .. path .. ":" .. method .. "(" .. args .. ")"
            if setclipboard then
                setclipboard(code)
                Rayfield:Notify({ Title = "Copied Code", Content = code, Duration = 3 })
            end
        else
            if Hooked[remote] then Rayfield:Notify({ Title = "Already hooked", Duration = 2 }); return end
            hookRemote(remote, "")
            Rayfield:Notify({ Title = "Hooked", Content = remote.Name .. " (" .. shortClass(remote) .. ")", Duration = 3 })
        end
    end,
})

-- // Tab 3 - Spy
local SpyTab = Window:CreateTab("Spy", "search")

SpyTab:CreateSection("Controls")

local SpyStatusLabel = SpyTab:CreateParagraph({ Title = "Spy Status", Content = "Idle" })
local LogParagraph = SpyTab:CreateParagraph({ Title = "Captured", Content = "--" })

SpyToggle = SpyTab:CreateToggle({
    Name = "Active Spy  [H]",
    CurrentValue = false,
    Flag = "RGB_SpyToggle",
    Callback = function(val)
        if val then
            if not IsLogging then doStartSpy() end
        else
            if IsLogging then doStopSpy() end
        end
    end,
})

SpyTab:CreateInput({
    Name = "Hook Remote",
    CurrentValue = "",
    PlaceholderText = "1  or  1,3  or  all",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if #RemoteLog == 0 then Rayfield:Notify({ Title = "Run spy first", Duration = 2 }); return end
        text = string.lower(string.gsub(text, "%s+", ""))
        local toHook = {}
        if text == "all" then
            for i = 1, #RemoteLog do table.insert(toHook, i) end
        else
            for part in string.gmatch(text, "[^,]+") do
                local num = tonumber(part)
                if num and RemoteLog[num] then table.insert(toHook, num) end
            end
        end
        if #toHook == 0 then Rayfield:Notify({ Title = "Invalid input", Duration = 2 }); return end
        local names = {}
        for _, idx in ipairs(toHook) do
            local entry = RemoteLog[idx]
            if entry and not Hooked[entry.remote] then
                hookRemote(entry.remote, "")
                table.insert(names, entry.name)
            end
        end
        Rayfield:Notify({ Title = "Hooked " .. #names, Content = table.concat(names, "\n"), Duration = 3 })
    end,
})

doStartSpy = function()
    if IsLogging then Rayfield:Notify({ Title = "Already running", Duration = 2 }); return end
    if not hookmetamethod then Rayfield:Notify({ Title = "Error", Content = "hookmetamethod not available", Duration = 3 }); return end

    RemoteLog = {}
    IsLogging = true
    SpyStatusLabel:Set({ Title = "Spy Status", Content = "RUNNING - click things in-game" })

    if not SpyHookActive then
        SpyHookActive = true
        shared.AEH_SpyHookActive = true
        local oldNc
        oldNc = hookmetamethod(game, "__namecall", function(self, ...)
            local method = getnamecallmethod()
            if IsLogging then
                if IsAutoFiring then
                    return oldNc(self, ...)
                end
                local isFire   = (method == "FireServer" and (self:IsA("RemoteEvent") or self:IsA("UnreliableRemoteEvent")))
                local isInvoke = (method == "InvokeServer" and self:IsA("RemoteFunction"))
                if (isFire or isInvoke) and not ExcludeList[self.Name] and not Hooked[self] then
                    local already = false
                    for _, entry in ipairs(RemoteLog) do
                        if entry.name == self.Name then already = true; break end
                    end
                    if not already then
                        local argStrs = {}
                        for _, arg in ipairs({...}) do
                            local t = typeof(arg)
                            if t == "string" then table.insert(argStrs, '"' .. tostring(arg) .. '"')
                            elseif t == "Instance" then table.insert(argStrs, fullPath(arg))
                            else table.insert(argStrs, tostring(arg)) end
                        end
                        if #RemoteLog >= 1000 then table.remove(RemoteLog, 1) end
                        table.insert(RemoteLog, {
                            remote = self, name = self.Name, class = self.ClassName,
                            path = fullPath(self), argStrs = argStrs,
                        })
                    end
                end
            end
            return oldNc(self, ...)
        end)
    end

    Rayfield:Notify({ Title = "Spy Started", Content = "Click buttons in-game, then Stop.", Duration = 3 })
end

doStopSpy = function()
    if not IsLogging then return end
    IsLogging = false
    if SpyToggle then SpyToggle:Set(false) end
    SpyStatusLabel:Set({ Title = "Spy Status", Content = "Stopped  (" .. #RemoteLog .. " captured)" })
    Rayfield:Notify({ Title = "Spy Stopped", Content = #RemoteLog .. " remote(s) captured.", Duration = 3 })

    if #RemoteLog == 0 then
        LogParagraph:Set({ Title = "Nothing Captured", Content = "No remotes fired. Check exclude list." })
        return
    end

    local lines = {}
    for i, entry in ipairs(RemoteLog) do
        local cls = shortClassFromName(entry.class)
        local args = #entry.argStrs > 0 and table.concat(entry.argStrs, ", ") or "(no args)"
        lines[i] = i .. ".  " .. entry.name .. "  (" .. cls .. ")" ..
                   "\n     " .. entry.path ..
                   "\n     Args: " .. args
    end
    LogParagraph:Set({ Title = "Captured " .. #RemoteLog, Content = table.concat(lines, "\n\n") })
end

toggleSpy = function()
    if IsLogging then doStopSpy() else doStartSpy() end
    if SpyToggle then SpyToggle:Set(IsLogging) end
end

doCopyResults = function()
    if #RemoteLog == 0 then Rayfield:Notify({ Title = "Nothing to copy", Content = "Run spy first.", Duration = 2 }); return end
    local lines = {}
    for i, entry in ipairs(RemoteLog) do
        local args = #entry.argStrs > 0 and table.concat(entry.argStrs, ", ") or "(no args)"
        lines[i] = i .. ". " .. entry.name .. " - " .. entry.path .. " - Args: " .. args
    end
    if setclipboard then
        setclipboard(table.concat(lines, "\n"))
        Rayfield:Notify({ Title = "Copied", Content = #RemoteLog .. " remote(s)", Duration = 2 })
    else
        Rayfield:Notify({ Title = "Error", Content = "setclipboard not available", Duration = 3 })
    end
end

SpyTab:CreateButton({ Name = "Copy Results  [C]", Callback = function() if doCopyResults then doCopyResults() end end })

SpyTab:CreateSection("Exclude List")

local ExcludeParagraph = SpyTab:CreateParagraph({ Title = "Excluded (0)", Content = "Add names to filter from spy." })

refreshExcludeList = function()
    local names = {}
    for name in pairs(ExcludeList) do table.insert(names, "- " .. name) end
    ExcludeParagraph:Set({
        Title   = "Excluded (" .. #names .. ")",
        Content = #names > 0 and table.concat(names, "\n") or "None.",
    })
end

local ExcludeActionType = "Add"
SpyTab:CreateDropdown({
    Name = "Action Type",
    Options = {"Add", "Remove"},
    CurrentOption = {"Add"},
    MultipleOptions = false,
    Flag = "ExcludeActionDropdown",
    Callback = function(Options) ExcludeActionType = Options[1] or Options end,
})

SpyTab:CreateInput({
    Name = "Name",
    CurrentValue = "",
    PlaceholderText = "e.g. Received",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if text == "" then return end
        if ExcludeActionType == "Add" then
            ExcludeList[text] = true
            refreshExcludeList()
            saveExcludeList()
        elseif ExcludeActionType == "Remove" then
            if ExcludeList[text] then
                ExcludeList[text] = nil
                refreshExcludeList()
                saveExcludeList()
            end
        end
    end,
})

SpyTab:CreateSection("ClickDetectors")

local CDSpyEnabled = false
local CDSpyConn = nil
local CDParagraph = SpyTab:CreateParagraph({ Title = "ClickDetectors (0)", Content = "Activate ClickDetector Spy, then click parts." })

local function refreshCDList()
    if #CDLog == 0 then
        CDParagraph:Set({ Title = "ClickDetectors (0)", Content = "Activate ClickDetector Spy, then click parts." })
    else
        local lines = {}
        for i, entry in ipairs(CDLog) do
            lines[i] = i .. ". " .. entry.parentName .. " (max: " .. entry.maxDist .. ")\n     " .. entry.path
        end
        CDParagraph:Set({ Title = "ClickDetectors (" .. #CDLog .. ")", Content = table.concat(lines, "\n\n") })
    end
end

SpyTab:CreateToggle({
    Name = "ClickDetector Spy",
    CurrentValue = false,
    Flag = "RGB_CDSpy",
    Callback = function(val)
        CDSpyEnabled = val
        if val then
            CDLog = {}
            refreshCDList()
            local UIS = game:GetService("UserInputService")
            local Camera = workspace.CurrentCamera
            CDSpyConn = UIS.InputBegan:Connect(function(input, processed)
                if not CDSpyEnabled then return end
                if processed then return end
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
                local ray = Camera:ViewportPointToRay(input.Position.X, input.Position.Y)
                local params = RaycastParams.new()
                params.FilterType = Enum.RaycastFilterType.Exclude
                params.FilterDescendantsInstances = {}
                local result = workspace:Raycast(ray.Origin, ray.Direction * 5000, params)
                if result and result.Instance then
                    local part = result.Instance
                    local cd = part:FindFirstChildWhichIsA("ClickDetector")
                    if not cd and part.Parent then cd = part.Parent:FindFirstChildWhichIsA("ClickDetector") end
                    if cd then
                        local already = false
                        for _, entry in ipairs(CDLog) do
                            if entry.detector == cd then already = true; break end
                        end
                        if not already then
                            table.insert(CDLog, {
                                detector = cd,
                                path = cd:GetFullName(),
                                parentName = cd.Parent and cd.Parent.Name or "?",
                                maxDist = cd.MaxActivationDistance,
                            })
                            refreshCDList()
                        end
                        Rayfield:Notify({ Title = "Captured", Content = cd.Parent.Name .. " (max: " .. cd.MaxActivationDistance .. ")", Duration = 2 })
                    else
                        Rayfield:Notify({ Title = "No ClickDetector", Content = part.Name, Duration = 2 })
                    end
                end
            end)
            table.insert(Connections, CDSpyConn)
            Rayfield:Notify({ Title = "CD Spy ON", Content = "Click on parts to capture their ClickDetectors.", Duration = 3 })
        else
            if CDSpyConn then CDSpyConn:Disconnect(); CDSpyConn = nil end
            Rayfield:Notify({ Title = "CD Spy OFF", Content = #CDLog .. " captured.", Duration = 2 })
        end
    end,
})

SpyTab:CreateInput({
    Name = "Fire ClickDetector",
    CurrentValue = "",
    PlaceholderText = "index from list above",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        local idx = tonumber(text)
        if not idx or not CDLog[idx] then
            Rayfield:Notify({ Title = "Invalid", Content = "Enter a valid index.", Duration = 2 })
            return
        end
        local entry = CDLog[idx]
        if fireclickdetector and entry.detector and entry.detector.Parent then
            fireclickdetector(entry.detector)
            Rayfield:Notify({ Title = "Fired", Content = entry.parentName, Duration = 2 })
        else
            Rayfield:Notify({ Title = "Error", Content = "Detector unavailable or fireclickdetector missing.", Duration = 3 })
        end
    end,
})

local CDDistanceMode = "Infinite (math.huge)"
local CDCustomDistance = 100

SpyTab:CreateDropdown({
    Name = "Max Distance Mode",
    Options = {"Infinite (math.huge)", "Custom Value"},
    CurrentOption = {"Infinite (math.huge)"},
    MultipleOptions = false,
    Flag = "RGB_CDDistMode",
    Callback = function(Options) CDDistanceMode = Options[1] or Options end,
})

SpyTab:CreateInput({
    Name = "Custom Distance Value",
    CurrentValue = "100",
    PlaceholderText = "Enter number",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local num = tonumber(text)
        if num then CDCustomDistance = num end
    end,
})

SpyTab:CreateButton({
    Name = "Apply Max Distance",
    Callback = function()
        local dist = (CDDistanceMode == "Infinite (math.huge)") and math.huge or CDCustomDistance
        local count = 0
        for _, desc in ipairs(game:GetDescendants()) do
            if desc:IsA("ClickDetector") then
                desc.MaxActivationDistance = dist
                count = count + 1
            end
        end
        Rayfield:Notify({ Title = "Distance Applied", Content = count .. " ClickDetector(s) set to " .. tostring(dist), Duration = 3 })
    end,
})

SpyTab:CreateButton({
    Name = "Scan ClickDetectors",
    Callback = function()
        local detectors = {}
        for _, desc in ipairs(game:GetDescendants()) do
            if desc:IsA("ClickDetector") then
                table.insert(detectors, {
                    path = desc:GetFullName(),
                    maxDist = desc.MaxActivationDistance,
                    parent = desc.Parent and desc.Parent.Name or "nil",
                })
            end
        end
        if #detectors == 0 then
            Rayfield:Notify({ Title = "No ClickDetectors", Content = "None found in game.", Duration = 3 })
            return
        end
        local lines = {}
        for i, d in ipairs(detectors) do
            if i > 50 then table.insert(lines, "... +" .. (#detectors - 50) .. " more"); break end
            lines[i] = i .. ". " .. d.parent .. " (max: " .. d.maxDist .. ")"
        end
        Rayfield:Notify({ Title = #detectors .. " ClickDetector(s)", Content = table.concat(lines, "\n"), Duration = 10 })
        if setclipboard then
            local full = {}
            for i, d in ipairs(detectors) do
                full[i] = i .. ". " .. d.path .. " | MaxDist: " .. d.maxDist
            end
            setclipboard(table.concat(full, "\n"))
            Rayfield:Notify({ Title = "Copied to clipboard", Duration = 2 })
        end
    end,
})

-- // Tab 4 - Settings
local SettingsTab = Window:CreateTab("Settings", "settings")

SettingsTab:CreateSection("Profiles")

local ProfileDropdown
local SavedProfilesList = getSavedProfiles()

local function loadProfileData(name)
    if not name or name == "" or name == "(None)" then return end
    
    local ok, raw = pcall(readfile, SavePrefix .. "profile_" .. name .. ".json")
    if not ok or not raw then 
        Rayfield:Notify({ Title = "Not found", Content = name, Duration = 2 })
        return 
    end
    if clearAll then clearAll() end
    local decoded
    pcall(function() decoded = HttpService:JSONDecode(raw) end)
    if type(decoded) ~= "table" then return end
    
    local entries = decoded
    if decoded.version == "2" then
        entries = decoded.hooks
        if decoded.config then
            local c = decoded.config
            local oldInit = IsInitializing
            IsInitializing = true
            if c.fireInterval then Config.FireIntervalMs = c.fireInterval; if IntervalInput then IntervalInput:Set(tostring(c.fireInterval)) end end
            if c.minInterval ~= nil and c.maxInterval ~= nil then
                Config.MinIntervalMs = c.minInterval
                Config.MaxIntervalMs = c.maxInterval
                if JitterInput then JitterInput:Set(c.minInterval .. "-" .. c.maxInterval) end
            elseif c.minInterval == nil and c.maxInterval == nil then
                Config.MinIntervalMs = nil
                Config.MaxIntervalMs = nil
                if JitterInput then JitterInput:Set("") end
            end
            if c.antiAFK ~= nil then Config.AntiAFK = c.antiAFK; if AFKToggle then AFKToggle:Set(c.antiAFK) end end
            if c.globalKeybinds ~= nil then Config.GlobalKeybinds = c.globalKeybinds; if GlobalKeyToggle then GlobalKeyToggle:Set(c.globalKeybinds) end end
            if c.showNonFirable ~= nil then Config.ShowNonFirable = c.showNonFirable; if ShowNonFirableToggle then ShowNonFirableToggle:Set(c.showNonFirable) end end
            if c.autoSave ~= nil then Config.AutoSave = c.autoSave; if AutoSaveToggle then AutoSaveToggle:Set(c.autoSave) end end
            if c.hideCursor ~= nil then Config.HideCursor = c.hideCursor; if HideCursorToggle then HideCursorToggle:Set(c.hideCursor) end; pcall(function() game:GetService("UserInputService").MouseIconEnabled = not c.hideCursor end) end
            IsInitializing = oldInit
        end
    end
    
    local loaded = 0
    for _, entry in ipairs(entries) do
        local parts = string.split(entry.path, ".")
        local current = game
        for _, p in ipairs(parts) do
            current = current:FindFirstChild(p)
            if not current then break end
        end
        if current and isFirable(current) then
            hookRemote(current, entry.argString or "")
            if entry.intervalMs then Hooked[current].intervalMs = entry.intervalMs end
            if entry.burstLimit then Hooked[current].burstLimit = entry.burstLimit end
            loaded = loaded + 1
        end
    end
    Rayfield:Notify({ Title = "Profile Loaded", Content = name .. " - " .. loaded .. " remote(s)", Duration = 3 })
    saveHookedRemotes()
end

ProfileDropdown = SettingsTab:CreateDropdown({
    Name = "Load Profile",
    Options = SavedProfilesList,
    CurrentOption = {SavedProfilesList[1] or "(None)"},
    MultipleOptions = false,
    Flag = "ProfileDropdown",
    Callback = function(Options)
        local selected = Options[1] or Options
        loadProfileData(selected)
    end,
})

SettingsTab:CreateInput({
    Name = "Save New Profile",
    CurrentValue = "",
    PlaceholderText = "Type a name and press Enter",
    RemoveTextAfterFocusLost = true,
    Callback = function(name)
        if name == "" then return end
        local hooks = {}
        for remote, hookData in pairs(Hooked) do
            if remote and remote.Parent then
                table.insert(hooks, {
                    path = fullPath(remote), argString = hookData.argString or "",
                    intervalMs = hookData.intervalMs, burstLimit = hookData.burstLimit,
                })
            end
        end
        local payload = {
            version = "2",
            hooks = hooks,
            config = {
                fireInterval = Config.FireIntervalMs,
                minInterval = Config.MinIntervalMs,
                maxInterval = Config.MaxIntervalMs,
                antiAFK = Config.AntiAFK,
                globalKeybinds = Config.GlobalKeybinds,
                showNonFirable = Config.ShowNonFirable,
                autoSave = Config.AutoSave,
                hideCursor = Config.HideCursor
            }
        }
        pcall(writefile, SavePrefix .. "profile_" .. name .. ".json", HttpService:JSONEncode(payload))
        Rayfield:Notify({ Title = "Profile Saved", Content = name .. " (" .. #hooks .. " remotes + settings)", Duration = 3 })
        
        SavedProfilesList = getSavedProfiles()
        if ProfileDropdown then ProfileDropdown:Refresh(SavedProfilesList) end
    end,
})

SettingsTab:CreateSection("Keybinds")

SettingsTab:CreateKeybind({
    Name = "Toggle Auto-Fire",
    CurrentKeybind = "F",
    HoldToInteract = false,
    Flag = "RH_ToggleKey",
    Callback = function()
        if not Config.GlobalKeybinds and not isUIVisible() then return end
        Config.Enabled = not Config.Enabled
        AutoToggle:Set(Config.Enabled)
        if refreshStatus then refreshStatus() end
    end,
})

SettingsTab:CreateKeybind({
    Name = "Scan Remotes",
    CurrentKeybind = "G",
    HoldToInteract = false,
    Flag = "RGB_Key_Scan",
    Callback = function()
        if not Config.GlobalKeybinds and not isUIVisible() then return end
        if doScanRemotes then doScanRemotes(false) end
    end,
})

SettingsTab:CreateKeybind({
    Name = "Start/Stop Spy",
    CurrentKeybind = "H",
    HoldToInteract = false,
    Flag = "RGB_Key_Spy",
    Callback = function()
        if not Config.GlobalKeybinds and not isUIVisible() then return end
        if toggleSpy then toggleSpy() end
    end,
})

SettingsTab:CreateKeybind({
    Name = "Clear All",
    CurrentKeybind = "X",
    HoldToInteract = false,
    Flag = "RGB_Key_ClearAll",
    Callback = function()
        if not Config.GlobalKeybinds and not isUIVisible() then return end
        if clearAll then clearAll() end
    end,
})

SettingsTab:CreateKeybind({
    Name = "Copy Spy Results",
    CurrentKeybind = "C",
    HoldToInteract = false,
    Flag = "RGB_Key_CopySpy",
    Callback = function()
        if not Config.GlobalKeybinds and not isUIVisible() then return end
        if doCopyResults then doCopyResults() end
    end,
})

SettingsTab:CreateKeybind({
    Name = "Toggle Auto Clicker",
    CurrentKeybind = "V",
    HoldToInteract = false,
    Flag = "RGB_Key_Clicker",
    Callback = function()
        if not Config.GlobalKeybinds and not isUIVisible() then return end
        ClickerEnabled = not ClickerEnabled
        if ClickerToggle then ClickerToggle:Set(ClickerEnabled) end
    end,
})

GlobalKeyToggle = SettingsTab:CreateToggle({
    Name = "Global Keybinds",
    CurrentValue = true,
    Flag = "RGB_GlobalKeybinds",
    Callback = function(val) 
        Config.GlobalKeybinds = val
        if not IsInitializing then saveHookedRemotes() end
        Rayfield:Notify({
            Title   = val and "Global Keybinds Enabled" or "Global Keybinds Disabled",
            Content = val and "Hotkeys now work when UI is closed." or "Hotkeys now only work when UI is open.",
            Duration = 4,
        })
    end,
})

SettingsTab:CreateSection("General")

AFKToggle = SettingsTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Flag = "RGB_AntiAFK",
    Callback = function(val)
        Config.AntiAFK = val
        if not IsInitializing then saveHookedRemotes() end
        if val then
            local vu = game:GetService("VirtualUser")
            if not vu then return end
            local conn
            conn = Players.LocalPlayer.Idled:Connect(function()
                if not shared.AEH_Running or not Config.AntiAFK then
                    if conn then conn:Disconnect() end
                    return
                end
                vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
                task.wait(0.1)
                vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
            end)
            table.insert(Connections, conn)
            Rayfield:Notify({ 
                Title = "Anti-AFK active", 
                Content = "Idle detection bypassed.",
                Duration = 2 
            })
        end
    end,
})

AutoSaveToggle = SettingsTab:CreateToggle({
    Name = "Auto-Save",
    CurrentValue = true,
    Flag = "RGB_AutoSave",
    Callback = function(val)
        Config.AutoSave = val
        Rayfield:Notify({ Title = val and "Auto-Save ON" or "Auto-Save OFF", Duration = 2 })
    end,
})

HideCursorToggle = SettingsTab:CreateToggle({
    Name = "Hide Custom Cursor",
    CurrentValue = false,
    Flag = "RGB_HideCursor",
    Callback = function(val)
        Config.HideCursor = val
        pcall(function() game:GetService("UserInputService").MouseIconEnabled = not val end)
        if not IsInitializing then saveHookedRemotes() end
        Rayfield:Notify({ Title = val and "Custom Cursor Hidden" or "Custom Cursor Restored", Duration = 2 })
    end,
})

-- // Hold-mode listener for Auto Clicker
do
    local UIS = game:GetService("UserInputService")
    local holdConn1 = UIS.InputBegan:Connect(function(input, processed)
        if processed then return end
        if ClickerMode == "Hold" and input.KeyCode == Enum.KeyCode.V then
            ClickerHeld = true
        end
    end)
    local holdConn2 = UIS.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.V then
            ClickerHeld = false
        end
    end)
    table.insert(Connections, holdConn1)
    table.insert(Connections, holdConn2)
end

SettingsTab:CreateInput({
    Name = "UI Toggle Key (applies next run)",
    CurrentValue = Config.ToggleUIKey,
    PlaceholderText = "e.g. Insert, LeftControl",
    RemoveTextAfterFocusLost = true,
    Callback = function(text)
        if text == "" then return end
        if Enum.KeyCode[text] then
            Config.ToggleUIKey = text
            if not IsInitializing then saveHookedRemotes() end
            Rayfield:Notify({ Title = "UI Key saved", Content = text .. " (applies next execution)", Duration = 3 })
        else
            Rayfield:Notify({ Title = "Invalid key", Content = text .. " is not a valid KeyCode.", Duration = 3 })
        end
    end,
})


-- // Hook / Unhook
refreshStatus = function()
    local state = Config.Enabled and "ON" or "OFF"
    local rate  = string.format("%.1f", 1000 / Config.FireIntervalMs)
    StatusLabel:Set({ Title = "Engine", Content = state .. "  |  " .. HookedCount .. " hooked  |  " .. rate .. "/sec" })
end

refreshHookedList = function()
    if HookedCount == 0 then
        HookedParagraph:Set({ Title = "Hooked (0)", Content = "None yet. Use Browse or Spy tab." })
    else
        local lines = {}
        local i = 0
        for remote, data in pairs(Hooked) do
            if remote and remote.Parent then
                i = i + 1
                local cls   = shortClass(remote)
                local args  = data.argString ~= "" and ("  -> " .. data.argString) or ""
                local fires = data.fireCount > 0 and ("  x" .. formatNumber(data.fireCount)) or ""
                local stat  = data.paused and " [PAUSED]" or ""
                local intv  = data.intervalMs and (" @" .. data.intervalMs .. "ms") or ""
                local burst = data.burstLimit and (" [" .. data.fireCount .. "/" .. data.burstLimit .. "]") or ""
                table.insert(lines, i .. ". " .. remote.Name .. "  (" .. cls .. ")" .. args .. intv .. burst .. fires .. stat)
            end
        end
        HookedParagraph:Set({ Title = "Hooked (" .. HookedCount .. ")", Content = table.concat(lines, "\n") })
    end
    refreshStatus()
    HookedDirty = false
end

hookRemote = function(remote, argString)
    if Hooked[remote] then return end
    local conn = remote.AncestryChanged:Connect(function(_, parent)
        if not parent then unhookRemote(remote) end
    end)
    table.insert(Connections, conn)
    Hooked[remote] = {
        conn = conn, args = parseArgs(argString or ""), argString = argString or "",
        fireCount = 0, intervalMs = nil, burstLimit = nil, burstNotified = false,
        lastFired = 0, nextFireTime = 0, errorCount = 0, paused = false,
    }
    HookedCount = HookedCount + 1
    HookedDirty = true
    refreshHookedList()
    saveHookedRemotes()
end

unhookRemote = function(remote)
    local data = Hooked[remote]
    if not data then return end
    if data.conn then
        data.conn:Disconnect()
        for i, c in ipairs(Connections) do
            if c == data.conn then table.remove(Connections, i); break end
        end
    end
    local name  = remote.Name
    local fires = data.fireCount
    Hooked[remote] = nil
    HookedCount = HookedCount - 1
    HookedDirty = true
    refreshHookedList()
    Rayfield:Notify({ Title = "Unhooked: " .. name, Content = "Fired " .. formatNumber(fires) .. " times", Duration = 2 })
    saveHookedRemotes()
end

clearAll = function()
    local n = HookedCount
    for _, data in pairs(Hooked) do
        if data.conn then data.conn:Disconnect() end
    end
    Hooked = {}
    Connections = {}
    HookedCount = 0
    TotalFireCount = 0
    HookedDirty = true
    refreshHookedList()
    Rayfield:Notify({ 
        Title = "Cleared " .. n .. " remote(s)", 
        Content = "Hooks removed successfully.",
        Duration = 2 
    })
    saveHookedRemotes()
end

task.spawn(function()
    local lastCount = 0
    local lastTime  = tick()
    local lastRateUpdate = tick()
    local lastUIUpdate = 0
    local displayRate = 0

    while shared.AEH_Running and shared.AEH_SessionId == SessionId do
        RunService.Heartbeat:Wait()
        local now = tick()
        if Config.Enabled and HookedCount > 0 then
            ActiveTime = ActiveTime + (now - lastTime)
        end
        if now - lastRateUpdate >= 1 then
            local delta = math.max(0, TotalFireCount - lastCount)
            displayRate = delta / (now - lastRateUpdate)
            lastCount = TotalFireCount
            lastRateUpdate = now
        end
        local timeStr = string.format("%dm %02ds", math.floor(ActiveTime / 60), math.floor(ActiveTime % 60))

        local newStats = "Total: " .. formatNumber(TotalFireCount) ..
                         "  |  " .. string.format("%.1f", displayRate) .. "/sec" ..
                         "  |  " .. timeStr

        if newStats ~= LastStatsText then
            StatsLabel:Set({ Title = "Stats", Content = newStats })
            LastStatsText = newStats
        end

        if HookedDirty and now - lastUIUpdate >= 0.1 then
            refreshHookedList()
            lastUIUpdate = now
        end

        lastTime = now
    end
end)

-- // Auto-Fire Engine
task.spawn(function()
    while shared.AEH_Running and shared.AEH_SessionId == SessionId do
        if Config.Enabled and HookedCount > 0 then
            local now = tick()
            for remote, data in pairs(Hooked) do
                if data.paused then continue end
                if now < data.nextFireTime then continue end
                if data.burstLimit and data.fireCount >= data.burstLimit then
                    if not data.burstNotified then
                        data.burstNotified = true
                        task.defer(function()
                            Rayfield:Notify({ Title = "Burst done", Content = remote.Name .. " - " .. data.burstLimit .. " fires", Duration = 3 })
                            unhookRemote(remote)
                        end)
                    end
                    continue
                end
                if not remote or not remote.Parent then task.defer(unhookRemote, remote); continue end

                local ok, err = pcall(function()
                    IsAutoFiring = true
                    if data.args and data.args.n and data.args.n > 0 then
                        remote:FireServer(unpack(data.args, 1, data.args.n))
                    else
                        remote:FireServer()
                    end
                    IsAutoFiring = false
                end)
                IsAutoFiring = false

                if ok then
                    data.lastFired = now
                    local perRemoteInt = data.intervalMs
                    local minMs = Config.MinIntervalMs or (perRemoteInt or Config.FireIntervalMs)
                    local maxMs = Config.MaxIntervalMs or (perRemoteInt or Config.FireIntervalMs)
                    if perRemoteInt then
                        minMs = perRemoteInt
                        maxMs = perRemoteInt
                    end
                    if minMs > maxMs then minMs, maxMs = maxMs, minMs end
                    local intervalSec
                    if minMs == maxMs then
                        intervalSec = minMs / 1000
                    else
                        intervalSec = (minMs + math.random() * (maxMs - minMs)) / 1000
                    end
                    data.nextFireTime = now + math.max(0.001, intervalSec)
                    data.fireCount = data.fireCount + 1
                    TotalFireCount = TotalFireCount + 1
                    data.errorCount = 0
                    HookedDirty = true
                else
                    data.errorCount = (data.errorCount or 0) + 1
                    if data.errorCount >= 10 then
                        data.paused = true
                        HookedDirty = true
                        Rayfield:Notify({ Title = "Auto-paused", Content = remote.Name .. " - " .. data.errorCount .. " errors", Duration = 5 })
                    end
                    warn("[RGB] " .. remote.Name .. " (" .. data.errorCount .. "): " .. tostring(err))
                end
            end
        end
        task.wait(0.001)
    end
end)

-- // Cleanup
shared.AEH_Cleanup = function()
    shared.AEH_Running = false
    IsLogging = false
    shared.AEH_SpyHookActive = nil
    for _, conn in ipairs(Connections) do pcall(function() conn:Disconnect() end) end
    for _, data in pairs(Hooked) do if data.conn then pcall(function() data.conn:Disconnect() end) end end
    if #RemoteLog > 0 and setclipboard then
        local lines = {}
        for i, entry in ipairs(RemoteLog) do
            local args = #entry.argStrs > 0 and table.concat(entry.argStrs, ", ") or "(no args)"
            lines[i] = i .. ". " .. entry.name .. " - " .. entry.path .. " - Args: " .. args
        end
        pcall(setclipboard, table.concat(lines, "\n"))
    end
    pcall(function() Rayfield:Destroy() end)
    pcall(function() game:GetService("UserInputService").MouseIconEnabled = true end)
    shared.AEH_Cleanup = nil
    shared.AEH_Running = nil
    shared.AEH_SessionId = nil
end

-- // Init
refreshStatus()
refreshHookedList()
loadExcludeList()
refreshExcludeList()
loadHookedRemotes()

IsInitializing = false

-- // Post-init UI sync
pcall(function() if IntervalInput then IntervalInput:Set(tostring(Config.FireIntervalMs)) end end)
pcall(function()
    if JitterInput then
        if Config.MinIntervalMs and Config.MaxIntervalMs then
            JitterInput:Set(Config.MinIntervalMs .. "-" .. Config.MaxIntervalMs)
        else
            JitterInput:Set("")
        end
    end
end)
pcall(function() if AutoToggle then AutoToggle:Set(Config.Enabled) end end)
pcall(function() if AFKToggle then AFKToggle:Set(Config.AntiAFK) end end)
pcall(function() if GlobalKeyToggle then GlobalKeyToggle:Set(Config.GlobalKeybinds) end end)
pcall(function() if ShowNonFirableToggle then ShowNonFirableToggle:Set(Config.ShowNonFirable) end end)
pcall(function() if AutoSaveToggle then AutoSaveToggle:Set(Config.AutoSave) end end)
pcall(function() if HideCursorToggle then HideCursorToggle:Set(Config.HideCursor) end end)
if refreshStatus then refreshStatus() end
if refreshHookedList then refreshHookedList() end

Rayfield:Notify({ 
    Title   = "Loading Complete", 
    Content = HookedCount .. " hooks & settings loaded.", 
    Duration = 5 
})
