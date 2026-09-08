local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Blood hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield",
   LoadingSubtitle = "by kickboxing",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes
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
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "Discord, key.", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"COPYBLOODHUB26117272721093432912"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Paragraph = Tab:CreateParagraph({Title = " Creator Hello!", Content = "Button Main"})
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
   Name = "Tornado v6",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol"))()
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
   Name = "C00lkidd menu",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/UnknownOfficial666/c00lkidd-gui/refs/heads/main/gui.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Hat hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"))()
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

local Tab = Window:CreateTab("Graphics", 10747373176) -- Title, Image
local Paragraph = Tab:CreateParagraph({Title = "Hello!", Content = "Button Graphics"})
local Button = Tab:CreateButton({
   Name = "Pshade Visual",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/randomstring0/pshade-ultimate/refs/heads/main/src/cd.lua'))()
   end,
})

local Tab = Window:CreateTab("", 4483362458) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Hello!", Content = "Hello! Thanks you me script [Blood hub]"})

Rayfield:Notify({
   Title = "Notification",
   Content = "Thanks you for script",
   Duration = 6.5,
   Image = 4483362458,
})
