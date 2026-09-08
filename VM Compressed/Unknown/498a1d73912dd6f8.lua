-- ui doesnt work on xeno, so basically it doesnt work for xeno, sorry!
-- ill make a xeno compatible version later, but for now, use any execs that are not xeno.

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local ScriptVersion = "2.0.2"
local Executor = "Unknown"
local LocalPlayer = Players.LocalPlayer

local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Snxdfer/back-ups-for-libs/refs/heads/main/OrionModified.lua"))()

local Window = OrionLib:MakeWindow({
    Name = "coords finder | v" .. tostring(ScriptVersion) .. " | .gg/jB4yJgn3pE",
    HidePremium = false,
    SaveConfig = false,
    SearchBar = false,
    IntroEnabled = true,
    IntroText = "made by 00Fazee (elrandom#1311)",
    IntroIcon = "rbxassetid://120907355927374",
    ShowIcon = true,
    Icon = "rbxassetid://120907355927374",
    ConfigFolder = "coordsfinderv2"
})

local InformationTab = Window:MakeTab({
    Name = "Information",
    Icon = "rbxassetid://10723415903",
    PremiumOnly = false
})

local InfoSection = InformationTab:AddSection({
	Name = "Information"
})

if identifyexecutor then
    local Success, Result = pcall(identifyexecutor)
    if Success and Result then
        Executor = tostring(Result)
    end
end

local Supported = "Yes"
if string.lower(Executor):find("xeno") then
    Supported = "No"
end

InfoSection:AddParagraph("Executor: " .. Executor, "Supported: " .. Supported)

local MainTab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://10723407389",
    PremiumOnly = false
})

local function Notify(title, content, imageID, time)
    OrionLib:MakeNotification({
        Name = tostring(title or "coords finder"),
        Content = tostring(content or ""),
        Image = imageID and (tostring(imageID):find("rbxassetid://") and tostring(imageID) or "rbxassetid://" .. tostring(imageID)) or "rbxassetid://4483345998",
        Time = tonumber(time) or 5
    })
end

local function toClipboard(str)
    local setcb = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
    if setcb then
        setcb(str)
    else
        Notify("coords finder | error", "your exploit doesn't support setclipboard", "rbxassetid://10747384394", 5)
        warn("[coords finder | clipboard error]: setclipboard not available")
    end
end

local function GetPositionText(hrp)
    if not hrp then return "Position: N/A" end
    local pos = hrp.Position
    return string.format("Position: %d, %d, %d", math.floor(pos.X), math.floor(pos.Y), math.floor(pos.Z))
end

local PositionSection = MainTab:AddSection({
	Name = "Position Section"
})

local PositionLabel = PositionSection:AddLabel("Waiting for Character...")

local TweenTime = 3

task.spawn(function()
    while true do
        task.wait()

        local character = LocalPlayer.Character
        if not character then
            PositionLabel:Set("Waiting for Character...")
            LocalPlayer.CharacterAdded:Wait()
            continue
        end

        local hrp = character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            PositionLabel:Set("Waiting for HumanoidRootPart...")
            character:WaitForChild("HumanoidRootPart", 10)
            continue
        end

        PositionLabel:Set(GetPositionText(hrp))
    end
end)

PositionSection:AddButton({
    Name = "Copy Position",
    Callback = function()
        local character = LocalPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            Notify("coords finder | error", "HumanoidRootPart not found", "rbxassetid://10747384394", 5)
            return
        end

        toClipboard(tostring(hrp.Position))
        Notify("coords finder | success", "Position copied to clipboard!", "rbxassetid://6023426945", 5)
    end
})

local NormalSection = MainTab:AddSection({
	Name = "Normal Section"
})

NormalSection:AddButton({
    Name = "Generate Teleport Script (Instant)",
    Callback = function()
        local character = LocalPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            Notify("coords finder | error", "HumanoidRootPart not found", "rbxassetid://10747384394", 5)
            return
        end

        local pos = hrp.Position
        local teleportScript = string.format([[
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

HumanoidRootPart.CFrame = CFrame.new(%s, %s, %s)
]], pos.X, pos.Y, pos.Z)

        toClipboard(teleportScript)
        Notify("coords finder | success", "Teleport script copied to clipboard!", "rbxassetid://6023426945", 5)
    end
})

local TweenSection = MainTab:AddSection({
	Name = "Tween Section"
})

TweenSection:AddSlider({
    Name = "Tween Time",
    Min = 1,
    Max = 50,
    Default = 3,
    Increment = 0.5,
    ValueName = "Seconds",
    Callback = function(value)
        TweenTime = value
    end
})

TweenSection:AddButton({
    Name = "Generate Tween Script",
    Callback = function()
        local character = LocalPlayer.Character
        local hrp = character and character:FindFirstChild("HumanoidRootPart")
        if not hrp then
            Notify("coords finder | error", "HumanoidRootPart not found", "rbxassetid://10747384394", 5)
            return
        end

        local pos = hrp.Position
        local tweenScript = string.format([[
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local tweenInfo = TweenInfo.new(%s, Enum.EasingStyle.Linear)
TweenService:Create(HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(%s, %s, %s)}):Play()
]], TweenTime, pos.X, pos.Y, pos.Z)

        toClipboard(tweenScript)
        Notify("coords finder | success", "Tween script copied to clipboard!", "rbxassetid://6023426945", 5)
    end
})

local CreditsTab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://74007982981741",
    PremiumOnly = false
})

local CreditsSection = CreditsTab:AddSection({
	Name = "Credits"
})

CreditsSection:AddLabel("thanks for using my coords finder script")
CreditsSection:AddLabel("made by 00Fazee (elrandom#1311)")
CreditsSection:AddLabel("join my discord: discord.gg/jB4yJgn3pE")

OrionLib:Init()
