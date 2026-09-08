local args = {
    [1] = workspace.Worlds:FindFirstChild("2"):FindFirstChild("NPC'S"):FindFirstChild("6")
}

game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Start:FireServer(unpack(args))
local targetPlaceId = 17645141868

local function teleportToGame()
    local player = game.Players.LocalPlayer
    if game.PlaceId ~= targetPlaceId then
        game:GetService("TeleportService"):Teleport(targetPlaceId, player)
    else
        print("Already in the correct game!")
    end
end

if game.PlaceId ~= targetPlaceId then
    print("Not in the correct game. Teleporting...")
    teleportToGame()
    return
end

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local Window = OrionLib:MakeWindow({Name = "Auto Clicker Script", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionConfig"})

--// Enable the checkbox \\--
_G.AutoClick = false
_G.AutoUpgrade = false
_G.AutoSpin = false
_G.AutoClaimRewards = false
_G.AutoHatch = false
_G.SelectedEgg = "Basic Egg"

local function AutoClick()
    while _G.AutoClick do
        game:GetService("ReplicatedStorage").Library.Knit.Services.TrainingService.RE.Train:FireServer()
        wait(0.1)
    end
end

local function AutoUpgrade()
    if _G.AutoUpgrade then
        for i = 2, 100 do
            local args = {[1] = i}
            game:GetService("ReplicatedStorage").Library.Knit.Services.ClicksService.RE.Equip:FireServer(unpack(args))
            wait(0.1)
        end
        _G.AutoUpgrade = false
    end
end

local function AutoSpin()
    while _G.AutoSpin do
        game:GetService("ReplicatedStorage").Library.Knit.Services.SpinService.RF.Spin:InvokeServer()
        wait(60)
    end
end

local function AutoClaimRewards()
    while _G.AutoClaimRewards do
        game:GetService("ReplicatedStorage").Library.Knit.Services.DailyService.RF.Claim:InvokeServer()
        wait(3600)

        for i = 1, 12 do
            local args = {[1] = i}
            game:GetService("ReplicatedStorage").Library.Knit.Services.GiftsService.RF.Claim:InvokeServer(unpack(args))
            wait(60)
        end
    end
end

local function AutoHatchEggs()
    while _G.AutoHatch do
        local args = {
            [1] = _G.SelectedEgg,
            [2] = "Single"
        }
        game:GetService("ReplicatedStorage").Library.Knit.Services.EggService.RE.HatchEgg:FireServer(unpack(args))
        wait(1)
    end
end

--// Main Tab \\--
local mainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

mainTab:AddButton({
	Name = "Pressed this to join my discord",
	Callback = function()
      		setclipboard("https://discord.com/invite/Yb6JNPAm3u")
  	end    
})

mainTab:AddToggle({
    Name = "Auto Click",
    Default = false,
    Callback = function(Value)
        _G.AutoClick = Value
        if Value then
            AutoClick()
        end
    end
})

mainTab:AddToggle({
    Name = "Auto Upgrade",
    Default = false,
    Callback = function(Value)
        _G.AutoUpgrade = Value
        if Value then
            AutoUpgrade()
        end
    end
})

mainTab:AddToggle({
    Name = "Auto Spin",
    Default = false,
    Callback = function(Value)
        _G.AutoSpin = Value
        if Value then
            AutoSpin()
        end
    end
})

mainTab:AddToggle({
    Name = "Auto Claim Rewards",
    Default = false,
    Callback = function(Value)
        _G.AutoClaimRewards = Value
        if Value then
            AutoClaimRewards()
        end
    end
})

--// Fight Tab \\--
local FightTab = Window:MakeTab({
    Name = "Fight",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local selectedNumber1to5 = 1
local selectedNumber6to10 = 6
local autoTapEnabled = false

FightTab:AddDropdown({
    Name = "World 2",
    Default = "1",
    Options = {"1", "2", "3", "4", "5"},
    Callback = function(value)
        selectedNumber1to5 = tonumber(value)
    end
})

FightTab:AddDropdown({
    Name = "World 2",
    Default = "6",
    Options = {"6", "7", "8", "9", "10"},
    Callback = function(value)
        selectedNumber6to10 = tonumber(value)
    end
})

local function startAutomation()
    while autoTapEnabled do
        local npcPath1to5 = workspace.Worlds:FindFirstChild("2"):FindFirstChild("NPC'S"):FindFirstChild(tostring(selectedNumber1to5))
        local npcPath6to10 = workspace.Worlds:FindFirstChild("2"):FindFirstChild("NPC'S"):FindFirstChild(tostring(selectedNumber6to10))

        if npcPath1to5 then
            local args = {[1] = npcPath1to5}
            game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Start:FireServer(unpack(args))
            game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Ready:FireServer()
            game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Update:FireServer()
        end

        if npcPath6to10 then
            local args = {[1] = npcPath6to10}
            game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Start:FireServer(unpack(args))
            game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Ready:FireServer()
            game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Update:FireServer()
        end

        wait(0.1)
    end
end

FightTab:AddToggle({
    Name = "Start Automation",
    Default = false,
    Callback = function(value)
        autoTapEnabled = value
        if autoTapEnabled then
            startAutomation()
        end
    end
})

--// Eggs Tab \\--
local EggsTab = Window:MakeTab({
    Name = "Eggs",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

EggsTab:AddDropdown({
    Name = "Select Egg",
    Default = "Basic Egg",
    Options = {"Basic Egg", "Forest Egg", "Ninja Egg"},
    Callback = function(value)
        _G.SelectedEgg = value
    end
})

EggsTab:AddToggle({
    Name = "Auto Hatch Eggs",
    Default = false,
    Callback = function(value)
        _G.AutoHatch = value
        if _G.AutoHatch then
            AutoHatchEggs()
        end
    end
})

game:GetService("ReplicatedStorage").Library.Knit.Services.FightService.RE.Update:FireServer()

OrionLib:Init()
