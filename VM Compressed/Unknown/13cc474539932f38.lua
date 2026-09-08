local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "lolskiz client",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "hi",
   LoadingSubtitle = "by lolipop",
   ShowText = "lolskiz client", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "lolskiz client"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})


local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

local Section = Tab:CreateSection("ëxpĺøitz")

local Button = Tab:CreateButton({
   Name = "remove cooldowns(re-equip sword)",
   Callback = function()
   for _, obj in pairs(getgc(true)) do
  if typeof(obj) == "function" then
    local n = debug.info(obj, "n")
    if n == "_onCooldown" then
      hookfunction(obj, function(...)
        return false
      end)
    end
  end
end
   end,
})

local Button = Tab:CreateButton({
   Name = "remove slowness on slash",
   Callback = function()
   
local WeaponModule = require(game:GetService("ReplicatedStorage").Modules.ClientGameHandler.ClientCombatHandler.CombatControllers.AttackController) 


local original_buildWeaponData = WeaponModule._buildWeaponData


WeaponModule._buildWeaponData = function(p16, p17)
    
    local data = original_buildWeaponData(p16, p17)
    
    
    if data then
        data.shouldSlow = false
        data.slowMult = 1
        data.slowTime = 0
        
        
        
    end
    
    return data
end
   end,
})

local Button = Tab:CreateButton({
   Name = "shitty esp",
   Callback = function()
   local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local function checkVisuals(character)
	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return end
	
	if root.Transparency ~= 0 then
		root.Transparency = 0
	end
	
	for _, part in ipairs(character:GetChildren()) do
		if part:IsA("BasePart") or part:IsA("Decal") then
			if part.Name ~= "HumanoidRootPart" and part.Transparency > 0.5 then
				part.Transparency = 0
			end
		end
	end
end

RunService.Heartbeat:Connect(function()
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character then
			checkVisuals(player.Character)
		end
	end
end)

   end,
})