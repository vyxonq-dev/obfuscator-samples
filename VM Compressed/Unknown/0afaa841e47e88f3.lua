local rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local player = game.Players.LocalPlayer
local hmd = player.Character:WaitForChild("Humanoid")
local hmdRoot = player.Character:WaitForChild("HumanoidRootPart")
local isAutoMoney = false
local isAutoSlotMachine = false
local autoMoneyInterval = 0.4
local autoSlotMachineInterval = 5
local slotMachineRange = 50
local casinoLocations = {
    { name = "Casino 1", pos = CFrame.new(-30.950384, 2.9725637, -39.012817) },
    { name = "Casino 2", pos = CFrame.new(40.180858, 2.9725637, -40.567486) },
    { name = "Casino 3", pos = CFrame.new(141.165283, 3.1722884, -36.25274) },
    { name = "Casino 4", pos = CFrame.new(262.475525, 3.0125637, -34.956154) },
    { name = "Casino 5", pos = CFrame.new(385.546203, 2.9725637, -30.454376) },
    { name = "Casino 6", pos = CFrame.new(656.78375, 3.01656, 26.4067668) },
}

player.CharacterAdded:Connect(function(character)
    hmd = character:WaitForChild("Humanoid")
    hmdRoot = character:WaitForChild("HumanoidRootPart")
end)

local window = rayfield:CreateWindow({
    Name = "Dep simulator script | by k1llm3sixy",
    Icon = 0,
    LoadingTitle = "meow",
    LoadingSubtitle = "by k1llm3sixy",
    ShowText = "Rayfield",
    Theme = "Amethyst",

    ToggleUIKeybind = Enum.KeyCode.K,

    DisableRayfieldPrompts = true,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "meow"
    },

    Discord = { Enabled = false, Invite = "noinvitelink", RememberJoins = true },

    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = { "Hello" }
    }
})

local mainTab = window:CreateTab("Main")
local playerTab = window:CreateTab("Player")
local gameTab = window:CreateTab("Game")
local miscTab = window:CreateTab("Misc")

mainTab:CreateSection("Money stuff")
mainTab:CreateButton({
    Name = "Add money",
    Callback = function()
        toggleMoney()
    end
})

mainTab:CreateToggle({
    Name = "Auto money",
    Callback = function()
        isAutoMoney = not isAutoMoney
        task.spawn(toggleMoney(true))
    end
})

mainTab:CreateSlider({
    Name = "Auto money interval (seconds)",
    Range = { 0.0, 3.0 },
    Increment = 0.1,
    Suffix = "sec",
    CurrentValue = 0.4,
    Flag = "AutoMoneyIntervalSlider",
    Callback = function(interval)
        autoMoneyInterval = interval
    end
})

mainTab:CreateSection("Slot machines stuff")
mainTab:CreateButton({
    Name = "Activate slot machines",
    Callback = function()
        task.spawn(toggleSlotMachines())
    end
})

mainTab:CreateToggle({
    Name = "Auto slot machines",
    Callback = function()
        isAutoSlotMachine = not isAutoSlotMachine
        task.spawn(toggleSlotMachines(true))
    end
})

mainTab:CreateSlider({
    Name = "Slot machine range",
    Range = { 0, 1000 },
    Increment = 10,
    Suffix = "studs",
    CurrentValue = 50,
    Flag = "SlotMachineRangeSlider",
    Callback = function(range)
        slotMachineRange = range
    end
})

mainTab:CreateSlider({
    Name = "Slot machine interval",
    Range = { 2, 10 },
    Increment = 1,
    Suffix = "sec",
    CurrentValue = 5,
    Flag = "SlotMachineIntervalSlider",
    Callback = function(interval)
        autoSlotMachineInterval = interval
    end
})

playerTab:CreateSlider({
    Name = "Walk speed",
    Range = { 0, 100 },
    Increment = 1,
    Suffix = "",
    CurrentValue = hmd.WalkSpeed,
    Flag = "WalkSpeedSlider",
    Callback = function(speed)
        hmd.WalkSpeed = speed
    end
})

playerTab:CreateSlider({
    Name = "Jump power",
    Range = { 0, 500 },
    Increment = 1,
    Suffix = "",
    CurrentValue = hmd.JumpPower,
    Flag = "JumpPowerSlider",
    Callback = function(power)
        hmd.JumpPower = power
    end
})

gameTab:CreateSection("Casino teleports")
for _, loc in ipairs(casinoLocations) do
    gameTab:CreateButton({
        Name = loc.name,
        Callback = function()
            hmdRoot.CFrame = loc.pos
        end
    })
end

miscTab:CreateButton({
    Name = "Unload script",
    Callback = function()
        isAutoMoney = false
        isAutoSlotMachine = false
        rayfield:Destroy()
    end
})

function toggleMoney(auto)
    local function addMoney()
        game:GetService("ReplicatedStorage").AddMoneyRequest:FireServer("SmartfonVictor")
    end

    if auto then
        while isAutoMoney do
            addMoney()
            task.wait(autoMoneyInterval)
        end
    else
        addMoney()
    end
end

function toggleSlotMachines(auto)
    local function useSlotMachines()
        local aparats = workspace:FindFirstChild("Aparats")
        if aparats then
            for _, aparat in pairs(aparats:GetChildren()) do
                if aparat.Name ~= "CasinoApparat" then continue end

                local lever = aparat:FindFirstChild("Lever")
                if lever and lever:IsA("Part") then
                    local distance = math.floor((hmdRoot.Position - lever.Position).Magnitude)
                    if distance <= slotMachineRange then
                        local detector = lever:FindFirstChild("ClickDetector")
                        if detector and detector:IsA("ClickDetector") then
                            fireclickdetector(detector)
                        end
                    end
                end
            end
        end
    end

    if auto then
        while isAutoSlotMachine do
            useSlotMachines()
            task.wait(autoSlotMachineInterval)
        end
    else
        useSlotMachines()
    end
end