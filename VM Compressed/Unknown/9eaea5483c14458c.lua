local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Stepka hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "ERROR 918",
   LoadingSubtitle = "by Script5r and T1",
   ShowText = "Nothing", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "h", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "010101"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = false -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "G5T K4Y",
      Subtitle = "Idk",
      Note = "Get the key on https://loot-link.com/s?cGwPRBEj", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Iam01"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

Rayfield:Notify({
   Title = "The script's are not made by us",
   Content = "All of the scripts are not made by us (except T1hub)",
   Duration = 6.5,
   Image = "message-square-warning",
})

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://428495297"

sound.Parent = game.Players.LocalPlayer.PlayerGui
sound:Play()

local Tab = Window:CreateTab("S C R I P T", "code")

local Button = Tab:CreateButton({
   Name = "Sans",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/SkyeMoz/Main/refs/heads/main/Resul/Scripts/Uploads/Upload/Survival%20Instinct",true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "GEI SAS",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "infinite yleld",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "No Legs",
   Callback = function()
   loadstring(game:HttpGet('https://github.com/popoffroblox/No-Legs/raw/refs/heads/main/main.lua', true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Jerk off R6",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Jerk off R15",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "C00lkidd's menu",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownOfficial666/c00lkidd-gui/refs/heads/main/gui.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Dex",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/bloxftuit1b-dev/Shadow-Mohammed-M7D/refs/heads/main/O.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "CMD-X",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Dex (v3)",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua", true))()
   end,
})

local Button = Tab:CreateButton({
   Name = "AWE Hub Best Keyless Slap Royale Script",
   Callback = function()
  loadstring(game:HttpGet('https://raw.githubusercontent.com/screptmaster/awe-hub/main/slap-royale.lua'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Solara Hub",
   Callback = function()
   loadstring(game:HttpGet("https://pastefy.app/Wfe784Xn/raw"))()
   end,
})

local Tab = Window:CreateTab("(R6 & R15) FE Movement Animation", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Script",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Gazer-Ha/Gaze-stuff/refs/heads/main/Fe%20Better%3F%20Movement"))()
   end,
})

local Tab = Window:CreateTab("Player", 10747373176) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Creator", Content = "Button Player"})

local Button = Tab:CreateButton({
   Name = "Esp",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Yahahahau/Ultimate-Esp-v1/refs/heads/main/Ultimate%20esp%20v1.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Walkfling",
   Callback = function()
   if game:GetService("ReplicatedStorage"):FindFirstChild("juisdfj0i32i0eidsuf0iok") then
		 hiddenfling = true
	 else
		 hiddenfling = true
		 detection = Instance.new("Decal")
		 detection.Name = "juisdfj0i32i0eidsuf0iok"
		 detection.Parent = game:GetService("ReplicatedStorage")
		 local function fling()
			 local hrp, c, vel, movel = nil, nil, nil, 0.1
			 while true do
				 game:GetService("RunService").Heartbeat:Wait()
				 if hiddenfling then
					 local lp = game.Players.LocalPlayer
					 while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
						 game:GetService("RunService").Heartbeat:Wait()
						 c = lp.Character
						 hrp = c:FindFirstChild("HumanoidRootPart") or c:FindFirstChild("Torso") or c:FindFirstChild("UpperTorso")
					 end
					 if hiddenfling then
						 vel = hrp.Velocity
						 hrp.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
						 game:GetService("RunService").RenderStepped:Wait()
						 if c and c.Parent and hrp and hrp.Parent then
							 hrp.Velocity = vel
						 end
						 game:GetService("RunService").Stepped:Wait()
						 if c and c.Parent and hrp and hrp.Parent then
							 hrp.Velocity = vel + Vector3.new(0, movel, 0)
							 movel = movel * -1
						 end
					 end
				 end
			 end
		 end
		 
		 fling()
	 end
   end,
})

local Button = Tab:CreateButton({
   Name = "Drift FE R6-R15",
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

local Label = Tab:CreateLabel("This is bugged!!1!", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

local Tab = Window:CreateTab("Credits", 4483362458) -- Title, Image

local Label = Tab:CreateLabel("Thank you for testing my script!", 4483362458, Color3.fromRGB(0, 255, 0), false) -- Title, Icon, Color, IgnoreTheme

local Label = Tab:CreateLabel("By the way get the fuck out of here", 4483362458, Color3.fromRGB(0, 255, 0), false) -- Title, Icon, Color, IgnoreTheme

local Button = Tab:CreateButton({
   Name = "Copy discord server link",
   Callback = function()
    setclipboard("https://discord.gg/v7uUxDQe")
   end,
})

local Tab = Window:CreateTab("Msdoors", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "doors",
   Callback = function()
  loadstring(game:HttpGet("https://www.msdoors.xyz/script"))()
   end,
})

local Tab = Window:CreateTab("T1 hub (DOORS)", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Hub",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/t1hub2/Brib-testing-2/refs/heads/main/Code.lua"))()
   end,
})

local Tab = Window:CreateTab("T E S T", 4483362458)

local Button = Tab:CreateButton({
   Name = "Msg with sound",
   Callback = function()
Rayfield:Notify({
   Title = "Test",
   Content = "Yeah test what did you think",
   Duration = 6.5,
   Image = "rewind",
})

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://428495297"

sound.Parent = game.Players.LocalPlayer.PlayerGui
sound:Play()
   end,
})

local Tab = Window:CreateTab("Dead Rails", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Neox Hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/NEOXHUBMAIN/refs/heads/main/loader", true))()
   end,
})
