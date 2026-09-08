-- ErrorReporter - Bypass
-- Uses multiple parallel threads to circumvent Roblox's ~100/sec RemoteEvent rate limit

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ErrorReported = ReplicatedStorage.RemoteEvents.ErrorReported

local totalFired   = 0
local sessionStart = os.time()
local farmActive   = false
local farmThreads  = {}
local farmAmount   = 1000
local farmInterval = 2

-- How many parallel threads to use for bypass (each bypasses the rate limit independently)
-- 10 threads = ~10x the normal fire rate
local THREAD_COUNT = 10

-- === Window ===
local Window = Rayfield:CreateWindow({
    Name = "Make an Error ",
    LoadingTitle = "Uses RemoteEvent, In ALPHA",
    LoadingSubtitle = "by nixon, keyless as always.",
    ConfigurationSaving = {
        Enabled = false,
    },
    KeySystem = false,
})

-- === Tabs ===
local ErrorsTab   = Window:CreateTab("Errors",   "alert-triangle")
local InstantTab  = Window:CreateTab("Instant",  "zap")
local AutoFarmTab = Window:CreateTab("AutoFarm", "repeat")
local StatsTab    = Window:CreateTab("Stats",    "bar-chart-2")

-- ============================================================
--  SHARED UTILITIES
-- ============================================================

local function formatNumber(n)
    if n >= 1000000 then
        return string.format("%.2fM", n / 1000000)
    elseif n >= 1000 then
        return string.format("%.1fK", n / 1000)
    else
        return tostring(n)
    end
end

local function sessionTime()
    local elapsed = os.time() - sessionStart
    local h = math.floor(elapsed / 3600)
    local m = math.floor((elapsed % 3600) / 60)
    local s = elapsed % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

-- Splits a burst across N parallel threads to bypass per-thread rate limit
local function fireParallel(amount, threads)
    threads = threads or THREAD_COUNT
    local perThread = math.floor(amount / threads)
    local remainder = amount - (perThread * threads)
    local done = 0
    local total = threads

    for t = 1, threads do
        local share = perThread + (t == 1 and remainder or 0)
        task.spawn(function()
            for i = 1, share do
                ErrorReported:FireServer()
                totalFired += 1
            end
        end)
    end
end

-- ============================================================
--  ERRORS TAB
-- ============================================================

ErrorsTab:CreateSection("Burst Fire")

local function fireErrors(amount)
    fireParallel(amount)
    Rayfield:Notify({
        Title = "Errors Fired",
        Content = "Fired " .. formatNumber(amount) .. " - Total: " .. formatNumber(totalFired),
        Duration = 2,
        Image = "alert-triangle",
    })
end

local bursts = {1, 10, 50, 100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 1000000}

for _, amount in ipairs(bursts) do
    local label
    if amount >= 1000000 then
        label = "Add " .. (amount/1000000) .. "M Errors"
    elseif amount >= 1000 then
        label = "Add " .. (amount/1000) .. "K Errors"
    else
        label = "Add " .. amount .. " Error" .. (amount == 1 and "" or "s")
    end

    ErrorsTab:CreateButton({
        Name = label,
        Callback = function()
            task.spawn(fireErrors, amount)
        end,
    })
end

ErrorsTab:CreateSection("Custom Amount")

local customAmount = 1

ErrorsTab:CreateInput({
    Name = "Add X Errors",
    PlaceholderText = "Enter amount (e.g. 250)",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            customAmount = math.floor(num)
        end
    end,
})

ErrorsTab:CreateButton({
    Name = "Fire Custom Amount",
    Callback = function()
        task.spawn(fireErrors, customAmount)
    end,
})

ErrorsTab:CreateSection("Danger Zone")

ErrorsTab:CreateButton({
    Name = "Fire 10M Errors",
    Callback = function()
        task.spawn(fireErrors, 10000000)
    end,
})

ErrorsTab:CreateButton({
    Name = "Reset Total Counter",
    Callback = function()
        totalFired = 0
        sessionStart = os.time()
        Rayfield:Notify({
            Title = "Counter Reset",
            Content = "Total fired and session timer have been reset.",
            Duration = 2,
            Image = "refresh-cw",
        })
    end,
})

-- ============================================================
--  INSTANT ERRORS TAB
-- ============================================================

InstantTab:CreateSection("Instant Burst")

local function fireInstant(amount)
    fireParallel(amount)
    Rayfield:Notify({
        Title = "Instantly Fired",
        Content = "Instantly fired " .. formatNumber(amount) .. " - Total: " .. formatNumber(totalFired),
        Duration = 2,
        Image = "zap",
    })
end

local instantBursts = {1, 10, 50, 100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 1000000}

for _, amount in ipairs(instantBursts) do
    local label
    if amount >= 1000000 then
        label = "Instantly Add " .. (amount/1000000) .. "M Errors"
    elseif amount >= 1000 then
        label = "Instantly Add " .. (amount/1000) .. "K Errors"
    else
        label = "Instantly Add " .. amount .. " Error" .. (amount == 1 and "" or "s")
    end

    InstantTab:CreateButton({
        Name = label,
        Callback = function()
            task.spawn(fireInstant, amount)
        end,
    })
end

InstantTab:CreateSection("Custom Amount")

local instantCustomAmount = 1

InstantTab:CreateInput({
    Name = "Instantly Add X Errors",
    PlaceholderText = "Enter amount (e.g. 250)",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            instantCustomAmount = math.floor(num)
        end
    end,
})

InstantTab:CreateButton({
    Name = "Instantly Fire Custom Amount",
    Callback = function()
        task.spawn(fireInstant, instantCustomAmount)
    end,
})

InstantTab:CreateSection("Danger Zone")

InstantTab:CreateButton({
    Name = "Instantly Fire 10M Errors",
    Callback = function()
        task.spawn(fireInstant, 10000000)
    end,
})

-- ============================================================
--  AUTOFARM TAB
-- ============================================================

AutoFarmTab:CreateSection("Farm Settings")

AutoFarmTab:CreateInput({
    Name = "Errors per Batch",
    PlaceholderText = "Default: 1000",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            farmAmount = math.floor(num)
        end
    end,
})

AutoFarmTab:CreateInput({
    Name = "Interval (seconds)",
    PlaceholderText = "Default: 2",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            farmInterval = num
        end
    end,
})

AutoFarmTab:CreateInput({
    Name = "Bypass Threads",
    PlaceholderText = "Default: 10 (more = faster)",
    RemoveTextAfterFocusLost = false,
    Callback = function(value)
        local num = tonumber(value)
        if num and num > 0 then
            THREAD_COUNT = math.floor(num)
        end
    end,
})

AutoFarmTab:CreateSection("Control")

AutoFarmTab:CreateToggle({
    Name = "Enable AutoFarm",
    CurrentValue = false,
    Callback = function(state)
        farmActive = state

        if farmActive then
            -- Cancel any leftover threads
            for _, t in ipairs(farmThreads) do
                task.cancel(t)
            end
            farmThreads = {}

            Rayfield:Notify({
                Title = "AutoFarm Started [BYPASS]",
                Content = "Firing " .. formatNumber(farmAmount) .. " errors every " .. farmInterval .. "s across " .. THREAD_COUNT .. " threads",
                Duration = 3,
                Image = "repeat",
            })

            -- Spawn THREAD_COUNT parallel farm threads
            local perThread = math.floor(farmAmount / THREAD_COUNT)
            local remainder = farmAmount - (perThread * THREAD_COUNT)

            for t = 1, THREAD_COUNT do
                local share = perThread + (t == 1 and remainder or 0)
                local thread = task.spawn(function()
                    while farmActive do
                        for i = 1, share do
                            ErrorReported:FireServer()
                            totalFired += 1
                        end
                        task.wait(farmInterval)
                    end
                end)
                table.insert(farmThreads, thread)
            end
        else
            for _, t in ipairs(farmThreads) do
                task.cancel(t)
            end
            farmThreads = {}
            farmActive  = false

            Rayfield:Notify({
                Title = "AutoFarm Stopped",
                Content = "Total errors fired: " .. formatNumber(totalFired),
                Duration = 3,
                Image = "square",
            })
        end
    end,
})

AutoFarmTab:CreateSection("Quick Presets")

local presets = {
    {name = "Low  - 100 / 5s",    amount = 100,    interval = 5,   threads = 2},
    {name = "Mid  - 1K / 2s",     amount = 1000,   interval = 2,   threads = 5},
    {name = "High - 10K / 1s",    amount = 10000,  interval = 1,   threads = 10},
    {name = "Nuke - 100K / 0.5s", amount = 100000, interval = 0.5, threads = 20},
}

for _, preset in ipairs(presets) do
    AutoFarmTab:CreateButton({
        Name = "Preset: " .. preset.name,
        Callback = function()
            farmAmount   = preset.amount
            farmInterval = preset.interval
            THREAD_COUNT = preset.threads
            Rayfield:Notify({
                Title = "Preset Applied",
                Content = formatNumber(preset.amount) .. " errors every " .. preset.interval .. "s - " .. preset.threads .. " threads - toggle farm to apply.",
                Duration = 3,
                Image = "settings",
            })
        end,
    })
end

-- ============================================================
--  STATS TAB
-- ============================================================

StatsTab:CreateSection("Session Stats")

StatsTab:CreateButton({
    Name = "Check Stats",
    Callback = function()
        local elapsed   = os.time() - sessionStart
        local perSecond = elapsed > 0 and math.floor(totalFired / elapsed) or 0
        local perMin    = perSecond * 60
        Rayfield:Notify({
            Title = "Session Stats",
            Content =
                "Total Fired: "  .. formatNumber(totalFired)  .. "\n" ..
                "Session Time: " .. sessionTime()             .. "\n" ..
                "Errors/sec: "   .. formatNumber(perSecond)   .. "\n" ..
                "Errors/min: "   .. formatNumber(perMin)      .. "\n" ..
                "Threads: "      .. THREAD_COUNT,
            Duration = 6,
            Image = "bar-chart-2",
        })
    end,
})

StatsTab:CreateButton({
    Name = "Check Session Time",
    Callback = function()
        Rayfield:Notify({
            Title = "Session Time",
            Content = "Running for: " .. sessionTime(),
            Duration = 3,
            Image = "clock",
        })
    end,
})

StatsTab:CreateSection("Milestones")

local milestones = {1000, 10000, 100000, 1000000, 10000000}

StatsTab:CreateButton({
    Name = "Check Milestone Progress",
    Callback = function()
        local next = nil
        for _, m in ipairs(milestones) do
            if totalFired < m then
                next = m
                break
            end
        end
        if next then
            local remaining = next - totalFired
            local pct = math.floor((totalFired / next) * 100)
            Rayfield:Notify({
                Title = "Milestone Progress",
                Content =
                    "Next: "      .. formatNumber(next)      .. "\n" ..
                    "Progress: "  .. pct                     .. "%\n" ..
                    "Remaining: " .. formatNumber(remaining) .. " errors",
                Duration = 5,
                Image = "award",
            })
        else
            Rayfield:Notify({
                Title = "All Milestones Reached!",
                Content = "You've surpassed 10M errors. Legend.",
                Duration = 4,
                Image = "award",
            })
        end
    end,
})

StatsTab:CreateSection("Reset")

StatsTab:CreateButton({
    Name = "Reset Everything",
    Callback = function()
        totalFired   = 0
        sessionStart = os.time()
        for _, t in ipairs(farmThreads) do
            task.cancel(t)
        end
        farmThreads = {}
        farmActive  = false
        Rayfield:Notify({
            Title = "Full Reset",
            Content = "Counter, session timer and all farm threads have been reset.",
            Duration = 3,
            Image = "refresh-cw",
        })
    end,
})
