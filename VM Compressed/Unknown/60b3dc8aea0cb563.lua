-- Ultra Stylish Intro Script for Roblox Executors
local function createIntro()
    -- Create a ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "StylishIntro"
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui
    
    -- Create Background Frame
    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Position = UDim2.new(0, 0, 0, 0)
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BackgroundTransparency = 0.5
    background.Parent = screenGui

    -- Create Text Label
    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0.5, 0, 0.2, 0)
    textLabel.Position = UDim2.new(0.25, 0, 0.4, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = "TSB SCRIPT (IDK IF IS OP)"
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Font = Enum.Font.GothamBlack
    textLabel.TextSize = 50
    textLabel.TextStrokeTransparency = 0.8
    textLabel.TextStrokeColor3 = Color3.fromRGB(0, 255, 255)
    textLabel.Parent = screenGui

    -- Create Stylish Animation
    for i = 1, 10 do
        textLabel.TextTransparency = i * 0.1
        wait(0.05)
    end

    -- Play Sound (Not looping)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://2621754201" -- Sound ID set to 2621754201
    sound.Volume = 1
    sound.Parent = game.Workspace
    sound:Play()

    -- Wait for 2 seconds while showing the text
    wait(2)

    -- Execute Loadstring code
    local loadstringCode = [[
        local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TSB SCRIPT V1 (idk if is op)",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "TSB SCRIPT (IDK IF IS OP)",
   LoadingSubtitle = "by SHUTTHISDOWNORZLSE",
   Theme = "Light", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Tsb Script V1!",
      Subtitle = "Tsb Script Need The Key To Get Access To The Gui!",
      Note = "Get The Key: https://pastebin.com/raw/KxrqVAfL", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"DontCopyOrYouAreGay"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local HomeTab = Window:CreateTab("Home", 4483362458) -- Title, Image

local Label = HomeTab:CreateLabel("Thank For Using This Script!", "rewind")

local Label = HomeTab:CreateLabel("I Hope You Will Like It!", "rewind")

local Label = HomeTab:CreateLabel("Youtube: The Editer Man + Scripter", "rewind")

local Label = HomeTab:CreateLabel("Roblox: SHUTTHISDOWNORZLSE", "rewind")

local Label = HomeTab:CreateLabel("TikTok: script874", "rewind")

local Label = HomeTab:CreateLabel("Enjoy Using This Script! I Hope You Will Enjoy It!", "rewind")

local CheatTab = Window:CreateTab("Cheat", 4483362458) -- Title, Image

local Button = CheatTab:CreateButton({
   Name = "Fe KJ gui by: SHUTTHISDOWNORZLSE",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/pHp51vir"))()
   end,
})

local Button = CheatTab:CreateButton({
   Name = "Fling All🙏",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/zqyDSUWX"))()
   end,
})

local Slider = CheatTab:CreateSlider({
   Name = "Speed :)",
   Range = {0, 100},
   Increment = 10,
   Suffix = "WalkSpeed",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
local player = game.Players.LocalPlayer
repeat wait() until player.Character.Humanoid
local humanoid = player.Character.Humanoid
local character = player.Character or player.CharacterAdded:Wait()
local UserInputService = game:GetService("UserInputService")
   end,
})

local Slider = CheatTab:CreateSlider({
   Name = "JumpPower",
   Range = {0, 100},
   Increment = 10,
   Suffix = "PowerJump",
   CurrentValue = 10,
   Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
local player = game.Players.LocalPlayer
repeat wait() until player.Character.Humanoid
local humanoid = player.Character.Humanoid
local character = player.Character or player.CharacterAdded:Wait()
local UserInputService = game:GetService("UserInputService")
   end,
})

local Button = CheatTab:CreateButton({
   Name = "Void Kill",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/louismich4el/ItsLouisPlayz-Scripts/main/VOID%20V2%20TSB.lua"))()
   end,
})

local Button = CheatTab:CreateButton({
   Name = "Streak Notifier",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/L7ALcFn5"))()
   end,
})

local Button = CheatTab:CreateButton({
   Name = "Auto Kyoto",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/Z7DawZJB/raw"))()
   end,
})

local Button = CheatTab:CreateButton({
   Name = "Run tool",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/zwgM0pdn"))()
   end,
})

local ClientTab = Window:CreateTab("Client Sided", 4483362458) -- Title, Image

local Button = ClientTab:CreateButton({
   Name = "??? (DONT CLICK!!!)",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-C00lkidd-28102"))()
   end,
})

local Button = ClientTab:CreateButton({
   Name = "Empty",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/wLEiERdS"))()
   end,
})

local Button = ClientTab:CreateButton({
   Name = "Empty",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/wLEiERdS"))()
   end,
})

local Button = ClientTab:CreateButton({
   Name = "Empty",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/wLEiERdS"))()
   end,
})

local MovesTab = Window:CreateTab("Movesets", 4483362458) -- Title, Image

local Button = MovesTab:CreateButton({
   Name = "SAITAMA TO KADEJ",
   Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/KJ-The-Strongest-Battlegrounds-Baldy-To-KJ-26712"))()
   end,
})

local Button = MovesTab:CreateButton({
   Name = "Saitama to jun",
   Callback = function()
getgenv().BetterGraphics = true -- Gives you fog and a custom sky. Set this to true/false to toggle
getgenv().sendChat = true -- Sends the subtitles as messages too. Set this to true/false to toggle

loadstring(game:HttpGet("https://raw.githubusercontent.com/Mc4121ban/Source/refs/heads/main/omg%20ratter.lua.creck"))()
   end,
})

local Button = MovesTab:CreateButton({
   Name = "Saitama To Gojo",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Doumaix/qqwrxxxx/main/gojo_v2.4.lua"))()
   end,
})

local Button = MovesTab:CreateButton({
   Name = "Empty",
   Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/wLEiERdS"))()
   end,
})

local UpdTab = Window:CreateTab("Update Log", 4483362458) -- Title, Image

local Label = UpdTab:CreateLabel("Update Will Appear Here", "rewind")
    ]]
    loadstring(loadstringCode)()

    -- Clean up after intro
    screenGui:Destroy()
end

-- Call function to create the intro
createIntro()
