local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "ScriptX",
    LoadingTitle = "ScriptX V2",
    LoadingSubtitle = "V2",
    ConfigurationSaving = {
        Enabled = false
    }
})

local UniversalTab = Window:CreateTab("Universal", 4483345998)

local toggles = {
    AutoStart = false,
    Easy = false,
    Normal = false,
    Hard = false,
    Insane = false,
    Impossible = false
}

local difficulties = {
    Easy = "dif_easy",
    Normal = "dif_normal",
    Hard = "dif_hard",
    Insane = "dif_insane",
    Impossible = "dif_impossible"
}

task.spawn(function()
    while task.wait(1) do
        if toggles.AutoStart then
            pcall(function()
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("RestartGame"):InvokeServer()
            end)
        end
    end
end)

for diffName, diffValue in pairs(difficulties) do
    task.spawn(function()
        while task.wait(1) do
            if toggles[diffName] then
                pcall(function()
                    local args = { diffValue }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceDifficultyVote"):InvokeServer(unpack(args))
                end)
            end
        end
    end)
end

UniversalTab:CreateToggle({ Name = "Auto-Start", CurrentValue = false, Callback = function(v) toggles.AutoStart = v end })
UniversalTab:CreateToggle({ Name = "Easy", CurrentValue = false, Callback = function(v) toggles.Easy = v end })
UniversalTab:CreateToggle({ Name = "Normal", CurrentValue = false, Callback = function(v) toggles.Normal = v end })
UniversalTab:CreateToggle({ Name = "Hard", CurrentValue = false, Callback = function(v) toggles.Hard = v end })
UniversalTab:CreateToggle({ Name = "Insane", CurrentValue = false, Callback = function(v) toggles.Insane = v end })
UniversalTab:CreateToggle({ Name = "Impossible", CurrentValue = false, Callback = function(v) toggles.Impossible = v end })

-- === Maps Tab (Toggles instead of Buttons) ===
local MapsTab = Window:CreateTab("Maps", 4483345998)

local unitOptions = {
    "unit_tomato_plant","unit_frozen_plant","unit_electric_beetroot","unit_brightflower",
    "unit_dragon_head","unit_buff_carrot","unit_molten_flower","unit_big_mushroom",
    "unit_dual_blossom","unit_rosebeam","unit_passionfruit","unit_laser_plant",
    "unit_pineapple","unit_banana","unit_zapper","unit_stray_cat","unit_corn",
    "unit_golem","unit_buff_corn","unit_stump","unit_passionfruit","unit_pesticider",
    "unit_timekeeper"
}

local selectedUnit = "unit_tomato_plant"
MapsTab:CreateDropdown({
    Name = "Select Unit",
    Options = unitOptions,
    CurrentOption = "unit_tomato_plant",
    Callback = function(option) selectedUnit = option end
})

local mapToggles = {}
local mapLocations = {
    GARDEN = Vector3.new(-332.231, 61.6803, -134.2561),
    JUNGLE = Vector3.new(-334.794, 61.6803, -121.4182),
    TROPICAL = Vector3.new(-73.5750, -30.6875, 125.3259),
    TOXIC = Vector3.new(-25.9643, 2, 313.9538)
}

for mapName, pos in pairs(mapLocations) do
    mapToggles[mapName] = false
    MapsTab:CreateToggle({
        Name = "Place in " .. mapName,
        CurrentValue = false,
        Callback = function(v) mapToggles[mapName] = v end
    })

    task.spawn(function()
        while task.wait(1) do
            if mapToggles[mapName] then
                pcall(function()
                    local args = {
                        selectedUnit,
                        {
                            Valid = true,
                            Rotation = 180,
                            CF = CFrame.new(pos, pos + Vector3.new(0, 0, -1)),
                            Position = pos
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("PlaceUnit"):InvokeServer(unpack(args))
                end)
            end
        end
    end)
end

-- === Summons Tab ===
local SummonsTab = Window:CreateTab("Summons", 4483345998)

local summonOptions = { "ub_classic_v4", "ub_corrupted" }
local selectedSummon = "ub_classic_v4"
local summonAmount = 1

SummonsTab:CreateDropdown({
    Name = "Select Unit Box",
    Options = summonOptions,
    CurrentOption = "ub_classic_v4",
    Callback = function(option) selectedSummon = option end
})

SummonsTab:CreateSlider({
    Name = "Amount",
    Range = { 1, 100 },
    Increment = 1,
    Suffix = "",
    CurrentValue = 1,
    Callback = function(value) summonAmount = value end
})

SummonsTab:CreateButton({
    Name = "Buy Selected Amount",
    Callback = function()
        pcall(function()
            local args = { selectedSummon, summonAmount }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("BuyUnitBox"):InvokeServer(unpack(args))
        end)
    end
})

SummonsTab:CreateButton({
    Name = "Buy Timekeeper",
    Callback = function()
        pcall(function()
            local args = { "unit_timekeeper" }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("BuyUnitWithSeeds"):InvokeServer(unpack(args))
        end)
    end
})

SummonsTab:CreateButton({
    Name = "Claim Group Reward",
    Callback = function()
        pcall(function()
            local args = { true }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("CheckJoinedGroup"):InvokeServer(unpack(args))
        end)
    end
})

-- === Playback Tab ===
local PlaybackTab = Window:CreateTab("Playback", 4483345998)

local recording = false
local recordedEvents = {}
local recordStart = 0

PlaybackTab:CreateButton({
    Name = "Start Recording",
    Callback = function()
        recordedEvents = {}
        recordStart = tick()
        recording = true
    end
})

PlaybackTab:CreateButton({
    Name = "Stop Recording",
    Callback = function()
        recording = false
    end
})

PlaybackTab:CreateButton({
    Name = "Start Playback",
    Callback = function()
        task.spawn(function()
            for _, ev in ipairs(recordedEvents) do
                task.wait(ev.time)
                pcall(function()
                    ev.remote:InvokeServer(unpack(ev.args))
                end)
            end
        end)
    end
})

-- Hook into remote calls
local ReplicatedStorage = game:GetService("ReplicatedStorage")
for _, rf in ipairs(ReplicatedStorage:WaitForChild("RemoteFunctions"):GetChildren()) do
    if rf:IsA("RemoteFunction") then
        local oldInvoke = rf.InvokeServer
        rf.InvokeServer = function(self, ...)
            if recording then
                table.insert(recordedEvents, {
                    remote = self,
                    args = {...},
                    time = tick() - recordStart
                })
            end
            return oldInvoke(self, ...)
        end
    end
end

-- === Credits Tab ===
local CreditsTab = Window:CreateTab("Credits", 4483345998)

CreditsTab:CreateParagraph({Title = "ScriptX Unstable Release V2", Content = ""})
CreditsTab:CreateParagraph({Title = "Discord", Content = "https://discord.gg/CFZQvsqPD2"})
