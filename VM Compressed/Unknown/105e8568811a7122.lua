local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the main window
local Window = Rayfield:CreateWindow({
    Name = "World.Io Script",
    LoadingTitle = "Loading Tools...",
    LoadingSubtitle = "by Sisa_turs2",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SisaDebug",
        FileName = "DebugConfig"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvite", 
        RememberJoins = true 
    },
    KeySystem = false,
})

-- =============================================
-- TAB 1: GAMEPASSES
-- =============================================
local GamepassTab = Window:CreateTab("Gamepass", 4483362458) 

GamepassTab:CreateLabel(",⚠️WARNING: Some Gamepasses may or may not work!⚠️", 4483362458)

local function setGamepassBool(name, state)
    local player = game:GetService("Players").LocalPlayer
    local folder = player:FindFirstChild("GamepassFolder")
    if folder then
        local valueObj = folder:FindFirstChild(name)
        if valueObj and valueObj:IsA("BoolValue") then
            valueObj.Value = state
        end
    end
end

-- Toggles (Shortened for brevity, include your full list here)
local gpasses = {"2X SPEED", "3X CLAIM", "EMPIRE PACK", "SPECIAL PACK", "STARTSIZE1", "STARTSIZE2", "STATE PACK", "VIP", "X2 MONEY"}
for _, name in pairs(gpasses) do
    GamepassTab:CreateToggle({
        Name = name,
        CurrentValue = false,
        Flag = "Toggle_"..name:gsub(" ",""), 
        Callback = function(Value) setGamepassBool(name, Value) end,
    })
end

-- =============================================
-- TAB 2: MISC
-- =============================================
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- WalkSpeed Slider
MiscTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 300},
    Increment = 1,
    Suffix = "Studs/s",
    CurrentValue = 16,
    Flag = "Slider_WalkSpeed", 
    Callback = function(Value)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

-- TP Tool Button
MiscTab:CreateButton({
    Name = "Give TP Tool",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "TP Tool"
        
        tool.Activated:Connect(function()
            local pos = mouse.Hit.p
            game.Players.LocalPlayer.Character:MoveTo(pos)
        end)
        
        tool.Parent = game.Players.LocalPlayer.Backpack
        
        Rayfield:Notify({
            Title = "Tool Given",
            Content = "TP Tool added to your inventory!",
            Duration = 3,
            Image = 4483362458,
        })
    end,
})

-- Remove Borders Button
MiscTab:CreateButton({
    Name = "Remove Borders",
    Callback = function()
        local borders = workspace:FindFirstChild("HexBorders")
        if borders then
            borders:Destroy()
            Rayfield:Notify({Title = "Success", Content = "Borders removed!", Duration = 3})
        end
    end,
})

-- =============================================
-- TAB 3: CREDITS
-- =============================================
local CreditsTab = Window:CreateTab("Credits", 4483362458)
CreditsTab:CreateLabel("Made by Sisa_turs2 <3")
CreditsTab:CreateLabel("I'm not a greedy person so it's keyless ;) ")

Rayfield:LoadConfiguration()