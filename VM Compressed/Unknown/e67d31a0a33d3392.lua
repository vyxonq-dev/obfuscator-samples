local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "1O2P3Z4A0K GUI V1",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

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

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Tab Example", 4483362458) -- Title, Image
local Section = Tab:CreateSection("Section Example")
local Button = Tab:CreateButton({
   Name = "Skybox",
   Callback = function()
local s = Instance.new("Sky")
s.Name = "Sky"
s.Parent = game.Lighting
local skyboxID = 128280393158440
s.SkyboxBk = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxDn = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxFt = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxLf = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxRt = "http://www.roblox.com/asset/?id="..skyboxID
s.SkyboxUp = "http://www.roblox.com/asset/?id="..skyboxID
game.Lighting.TimeOfDay = 12
   -- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Spam Decal",
   Callback = function()
decalID = 128280393158440
function exPro(root)
for _, v in pairs(root:GetChildren()) do
if v:IsA("Decal") and v.Texture ~= "http://www.roblox.com/asset/?id="..decalID then
v.Parent = nil
elseif v:IsA("BasePart") then
v.Material = "Plastic"
v.Transparency = 0
local One = Instance.new("Decal", v)
local Two = Instance.new("Decal", v)
local Three = Instance.new("Decal", v)
local Four = Instance.new("Decal", v)
local Five = Instance.new("Decal", v)
local Six = Instance.new("Decal", v)
One.Texture = "http://www.roblox.com/asset/?id="..decalID
Two.Texture = "http://www.roblox.com/asset/?id="..decalID
Three.Texture = "http://www.roblox.com/asset/?id="..decalID
Four.Texture = "http://www.roblox.com/asset/?id="..decalID
Five.Texture = "http://www.roblox.com/asset/?id="..decalID
Six.Texture = "http://www.roblox.com/asset/?id="..decalID
One.Face = "Front"
Two.Face = "Back"
Three.Face = "Right"
Four.Face = "Left"
Five.Face = "Top"
Six.Face = "Bottom"
end
exPro(v)
end
end
function asdf(root)
for _, v in pairs(root:GetChildren()) do
asdf(v)
end
end
exPro(game.Workspace)
asdf(game.Workspace)
   -- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "jumpscare",
   Callback = function()
local image = "128280393158440" --put your id
local sound = "6018028320" --put your sound
local seconds = 10 --time to destroy the gui
local speed = 1 --audio playbackspeed, for bypass
local start = 0 --audio time position, for bypas to
local volume = 10 --audio volume

local jumpscare = Instance.new("ScreenGui")
jumpscare.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
jumpscare.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") --ðŸ§�ðŸ¤¨...localplayer?
local label = Instance.new("ImageLabel", jumpscare)
label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
label.BorderColor3 = Color3.fromRGB(0, 0, 0)
label.BorderSizePixel = 0
label.Size = UDim2.new(1, 0, 1, 0)
label.Image = "rbxassetid://"..image
local audio = Instance.new("Sound", game.SoundService)
audio.SoundId = "rbxassetid://"..sound
audio.PlaybackSpeed = speed
audio.TimePosition = start
audio.Volume = volume
audio:Play()
wait(seconds)

jumpscare:Destroy()
   -- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Fire",
   Callback = function()
local size = 100 --your size here
local speed = 10

local fire = Instance.new("Fire")
for _, all in pairs(game:GetDescendants()) do
	if all:IsA("Part") or all:IsA("MeshPart") then
		fire.Parent = all
	end
end
fire.Size = size
fire.Heat = speed
   -- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "messenge",
   Callback = function()
local text = "1O2P3Z4A0K: LOL IS GAME GET HACK" --your text here
local duration = 5
local message = Instance.new("Message", game.Workspace)
message.Text = text
wait(duration)
message:Destroy()
   -- The function that takes place when the button is pressed
   end,
})
local Button = Tab:CreateButton({
   Name = "Hint",
   Callback = function()
local text = "1O2P3Z4A0K WAS HERE | https://discord.gg/mkpr9Pht " --your text here

local hint = Instance.new("Hint", game.Workspace)
hint.Text = text
hint.Name = text
hint.Changed:Connect(function()
	hint.Text = text
	hint.Name = text
	
end)
hint.ChildAdded:Connect(function()
	for _, a in pairs(hint:GetDescendants()) do
		a:Destroy()
	end
end)
   -- The function that takes place when the button is pressed
   end,
})