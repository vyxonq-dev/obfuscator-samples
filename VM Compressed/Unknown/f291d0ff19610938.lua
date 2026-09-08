local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Moon hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "8",
   LoadingSubtitle = "by KICKBOXING267",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

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
      Title = "KEY",
      Subtitle = "Key System",
      Note = "just a relax", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})


local Tab = Window:CreateTab("Home", 10723407389) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Hello my script", Content = "Thanks you, from script = KICKBOXING267/KICKALL"})

local Paragraph = Tab:CreateParagraph({Title = "UI / Rayfield", Content = "Rayfield library by sirius"})

local Divider = Tab:CreateDivider()

local Paragraph = Tab:CreateParagraph({Title = "Home!", Content = "Welcome to Moon hub! Thanks for useing script"})

local Tab = Window:CreateTab("Scripts/Games/FE", 10734943448) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Tab", Content = "Tab Scripts or games"})

local Button = Tab:CreateButton({
   Name = "Infinite yleld",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "CMD-X",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "VenomX",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/fratelevostru9999/src/refs/heads/main/VenomX%20Fling%20Things%20And%20People",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "BlitzT Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/main/FTAP.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Verbal hub v3",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/refs/heads/main/Verbal%20Hub%20V3",true))()
})

local Button = Tab:CreateButton({
   Name = "Bruton hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/bruton-lua/Brookhaven/refs/heads/main/BRUTON"))()
})

local Button = Tab:CreateButton({
   Name = "Hat hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "FE Krystal Dance V3",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Choose.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Super ring parts v6 by lukas",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Pshade",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Foxname",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Voidware",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Chaos hub",
   Callback = function()
   loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/edf95b2a45470046"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Lyra hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/repositoryredzlib/Lyrapainel/refs/heads/main/Main.txt"))()
})

local Button = Tab:CreateButton({
   Name = "Sander XY",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/kigredns/testUIDK/refs/heads/main/panel.lua"))()
})

local Button = Tab:CreateButton({
   Name = "Dex",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/UltramixSecondDev/Dex-Script-Viewer-FIXED-/refs/heads/main/Notepad.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Solara hub",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/Wfe784Xn/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "ULTIMATE TROLLING GUI V5",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/rmdi1m55/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Btools Tool",
   Callback = function()
   loadstring(game:HttpGet("https://pastebin.com/raw/FBKJTUyw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "F3X Tool",
   Callback = function()
   loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
   end,
})


local Button = Tab:CreateButton({
   Name = "Nameless",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/lololofffff/Nameless/refs/heads/main/lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Luna hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/lololofffff/Luna/refs/heads/main/lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "[V1.5] Universal Emote Player ",
   Callback = function()
   loadstring(game:HttpGet("https://api.droply.lol/raw/Emotes.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Minloader hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/lololofffff/Minloader/refs/heads/main/lua"))()
   end,
})

local Tab = Window:CreateTab("Players/local", 10747373176) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Tab", Content = "Tab Edit player"})

local Button = Tab:CreateButton({
   Name = "No Legs",
   Callback = function()
   loadstring(game:HttpGet('https://github.com/popoffroblox/No-Legs/raw/refs/heads/main/main.lua', true))()
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {30, 100},
   Increment = 10,
   Suffix = "Power",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V
   end,
})

local Slider = Tab:CreateSlider({
   Name = "JumpPower",
   Range = {30, 100},
   Increment = 10,
   Suffix = "Power",
   CurrentValue = 10,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   game.Players.LocalPlayer.Character.Humanoid.JumpPower = V
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Enabled)
   local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

   end,
})

local Button = Tab:CreateButton({
   Name = "Delete inf jump",
   Callback = function()
      local InfiniteJumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Super speed",
   Callback = function()
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = 100
   end,
})


local Button = Tab:CreateButton({
   Name = "Sit",
   Callback = function()
      game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").Sit = true
   end,
})

local Button = Tab:CreateButton({
   Name = "Drift r6/r15",
   Callback = function()
      if game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R6 then
 
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 60
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = 20
game:GetService("Players").LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://129342287"
game:GetService("Players").LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "rbxassetid://129342287"
game:GetService("Players").LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "rbxassetid://129342287"
game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "rbxassetid://129342287"
game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "rbxassetid://129342287"
game:GetService("Players").LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "rbxassetid://129342287"
for i, thing in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if thing.ClassName == "Part" then
thing.CustomPhysicalProperties = PhysicalProperties.new(0.04, 0, 0)
end
end
local r6height = "-1.03"
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").HipHeight = r6height
 
elseif game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R15 then
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = 60
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = 20
game:GetService("Players").LocalPlayer.Character.Animate.walk.WalkAnim.AnimationId = "rbxassetid://3360694441"
game:GetService("Players").LocalPlayer.Character.Animate.run.RunAnim.AnimationId = "rbxassetid://3360694441"
game:GetService("Players").LocalPlayer.Character.Animate.fall.FallAnim.AnimationId = "rbxassetid://3360694441"
game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation1.AnimationId = "rbxassetid://3360694441"
game:GetService("Players").LocalPlayer.Character.Animate.idle.Animation2.AnimationId = "rbxassetid://3360694441"
game:GetService("Players").LocalPlayer.Character.Animate.jump.JumpAnim.AnimationId = "rbxassetid://3360694441"
for i, thing in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if thing.ClassName == "MeshPart" then
thing.CustomPhysicalProperties = PhysicalProperties.new(0.04, 0, 0)
end
end
local r15height = "0.56"
game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").HipHeight = r15height
end 
   end,
})


local Tab = Window:CreateTab("Moblie/Script", 10723416765) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Tab", Content = "Tab Moblie scripting"})
