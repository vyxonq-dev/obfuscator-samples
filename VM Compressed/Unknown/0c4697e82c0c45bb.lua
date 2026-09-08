local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Sxlid Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Sxlid Hub",
   LoadingSubtitle = "No Scripts Are Mine",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "EasyHubTest"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "86GP39JV", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Sxlid Hub | Key",
      Subtitle = "Key System",
      Note = "Join Discord for Key |https://discord.gg/86GP39JV", -- Use this to tell the user how to get a key
      FileName = "SxlidHubKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/jLngggsV"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main Scripts", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Universal")

Rayfield:Notify({
   Title = "Succesful Execution",
   Content = "https://discord.gg/86GP39JV",
   Duration = 6.5,
   Image = 10269749,
    })

local Button = MainTab:CreateButton({
   Name = "Infinite Jump Toggle",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump
if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "WalkSpeed Slider",
   Range = {1, 350},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "sliderws", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Input = MainTab:CreateInput({
   Name = "Walkspeed",
   PlaceholderText = "1-500",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Text)
   end,
})

local Button = MainTab:CreateButton({
   Name = "System Broken | Telporting, Emotes, Animations & More",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script"))()
   end,
})


local Toggle = MainTab:CreateToggle({
   Name = "Esp | Press H after Toggle | Dont turn toggle off after use",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(v)
_G.ESPToggle = v
-- Table of colours to choose from
local colourTable = {
    Green = Color3.fromRGB(0, 255, 0),
    Blue = Color3.fromRGB(0, 0, 255),
    Red = Color3.fromRGB(255, 0, 0),
    Yellow = Color3.fromRGB(255, 255, 0),
    Orange = Color3.fromRGB(255, 165, 0),
    Purple = Color3.fromRGB(128, 0, 128)
}
local colourChosen = colourTable.Red -- Change "Red" to whatever colour you like from the table above, feel free to add other colours as well.
_G.ESPToggle = false -- This is the variable used for enabling/disabling ESP. If you are using a GUI library, or your own custom GUI, then set this variable to the callback function. 

-- Services and lp
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

-- The following screen gui, frame and button creation may be deleted if you are using a custom GUI library. 
-- Create the screen gui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ESPToggleGui"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Create a frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(1, 0, 1, 0) 
mainFrame.BackgroundTransparency = 1  
mainFrame.Parent = screenGui

-- Create the button
local toggleButton = Instance.new("TextButton") 
toggleButton.Name = "ToggleButton"
toggleButton.Size = UDim2.new(0, 200, 0, 50)
toggleButton.Position = UDim2.new(0.5, -100, 0.5, -25)
toggleButton.Text = "Toggle ESP"
toggleButton.Parent = mainFrame

local function getCharacter(player)
    return Workspace:FindFirstChild(player.Name)
end

-- Add highlights to players
local function addHighlightToCharacter(player, character)
    if player == LocalPlayer then return end  -- Skip local player
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart and not humanoidRootPart:FindFirstChild("Highlight") then
        local highlightClone = Instance.new("Highlight")  -- Create a new Highlight instance
        highlightClone.Name = "Highlight"
        highlightClone.Adornee = character
        highlightClone.Parent = humanoidRootPart
        highlightClone.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        highlightClone.FillColor = colourChosen
        highlightClone.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlightClone.FillTransparency = 0.5
    end
end

-- Remove highlights from player
local function removeHighlightFromCharacter(character)
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if humanoidRootPart then
        local highlightInstance = humanoidRootPart:FindFirstChild("Highlight")
        if highlightInstance then
            highlightInstance:Destroy()
        end
    end
end

-- Function to update highlights based on the value of _G.ESPToggle
local function updateHighlights()
    for _, player in pairs(Players:GetPlayers()) do
        local character = getCharacter(player)
        if character then
            if _G.ESPToggle then
                addHighlightToCharacter(player, character)
            else
                removeHighlightFromCharacter(character)
            end
        end
    end
end

-- Connect events through RenderStepped to loop
RunService.RenderStepped:Connect(function()
    updateHighlights()
end)

-- Add highlight to joining players
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if _G.ESPToggle then
            addHighlightToCharacter(player, character)
        end
    end)
end)

-- Remove highlights from leaving players
Players.PlayerRemoving:Connect(function(playerRemoved)
    local character = playerRemoved.Character
    if character then
        removeHighlightFromCharacter(character)
    end
end)

-- The following code may be deleted if you are using a custom GUI library. 

-- Toggle ESP Button Text based on variable status
toggleButton.MouseButton1Click:Connect(function()
    _G.ESPToggle = not _G.ESPToggle
    if _G.ESPToggle then
        toggleButton.Text = "ESP ON"
    else
        toggleButton.Text = "ESP OFF"
    end
end)

-- Initial button text
if _G.ESPToggle then
    toggleButton.Text = "ESP ON"
else
    toggleButton.Text = "ESP OFF"
end

-- Keybind to toggle GUI visibility
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if input.KeyCode == Enum.KeyCode.H and not gameProcessed then -- Change Enum.KeyCode.H to another key if you want to, e.g. Enum.KeyCode.P for "P" Key.
        mainFrame.Visible = not mainFrame.Visible
    end
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "Anti Afk",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KazeOnTop/Rice-Anti-Afk/main/Wind", true))()
   end,
})

local GameTab = Window:CreateTab("Game Exploits", 4483362458) -- Title, Image
local GameSection = GameTab:CreateSection("⛩️Anime Games⛩️")

local Button = GameTab:CreateButton({
   Name = "Jujutsu Infinite",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Script-Games/refs/heads/main/Jujutsu%20Infinite.lua"))()
end,
})
local Button = GameTab:CreateButton({
   Name = "Kings Legacy",
   Callback = function()
--[[
    WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
getgenv().RaidUI = false -- For Hidden Raid Mode true = show and false = hidden
getgenv().CustomDistance = 8 -- For Bug Can't Swipe Distance
loadstring(game:HttpGet("https://raw.githubusercontent.com/ChopLoris/ArcHub/main/main.lua"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Bloxfruits | Mobile Only",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Grand Piece Online",
   Callback = function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/3259542ebb994ec69311a5dfdc23daa5.lua"))()
   end,
})

local Section = GameTab:CreateSection("🔫Shooting Games🔫")

local Button = GameTab:CreateButton({
   Name = "Rivals Aimbot/Esp",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubRivals"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "AirHub Universal Esp & Aimbot",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
   end,
})

local Button = GameTab:CreateButton({
   Name = "Arsenal Aimbot/Esp & More",
   Callback = function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
loadstring(game:HttpGet("https://raw.githubusercontent.com/sytcal/SkiddedTech/main/Arsenal"))()
   end,
})

local Button = MainTab:CreateButton({
   Name = "Infinite Yield Admin",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
   end,
})

local Section = GameTab:CreateSection("Misc/Random games")

local Button = GameTab:CreateButton({
   Name = "Fisch",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
  end,
})

local Button = GameTab:CreateButton({
   Name = "🏈Nfl Universe🏈",
   Callback = function()
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/03624f832da93e45f8dc1d8234f7bfca.lua"))()
   end,
})

local Section = GameTab:CreateSection("I WILL ADD MORE I JUST MADE THIS")

local MiscTab = Window:CreateTab("Misc", 4483362458) -- Title, Image
local Section = MiscTab:CreateSection("Misc")

local Button = MiscTab:CreateButton({
   Name = "Discord",
   Callback = function()
Rayfield:Notify({
   Title = "https://discord.gg/86GP39JV",
   Content = "https://discord.gg/86GP39JV",
   Duration = 6.5,
   Image = "rewind",
})
   end,
})

local Button = MiscTab:CreateButton({
   Name = "Destroy Interface",
   Callback = function()
Rayfield:Destroy()
   end,
})
