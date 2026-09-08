local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Swift hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Swift Hub loading",
   LoadingSubtitle = "by Swift",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "K5tF8tfS5", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Swift hub | key",
      Subtitle = "Link in discord",
      Note = "Join server from Misc tab", -- Use this to tell the user how to get a key
      FileName = "Swifthubkey", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/MKaqVKZB"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Join our discord for more features",
   Content = "Free Key in discord",
   Duration = 6.5,
   Image = nil,
})

local Slider = MainTab:CreateSlider({
   Name = "Speed slider",
   Range = {0, 300},
   Increment = 1,
   Suffix = "speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "infinite jump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

UserInputService.JumpRequest:Connect(function()
	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if not humanoid then return end

	humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
end)
   end,
})

local Button = MainTab:CreateButton({
   Name = "OP aimbot GUI",
   Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-EZ-Aim-Universal-Aimbot-OP-215779"))()
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "noclip",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer

local connection

local function setNoclip(character)
	for _, part in ipairs(character:GetDescendants()) do
		if part:IsA("BasePart") then
			part.CanCollide = false
		end
	end
end

connection = RunService.Stepped:Connect(function()
	if not script.Enabled then
		return
	end

	local character = player.Character
	if character then
		setNoclip(character)
	end
end)
   end,
})

local Toggle = MainTab:CreateToggle({
   Name = "Fly",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local flySpeed = 60

local bodyVelocity = nil
local bodyGyro = nil
local flying = false

local function startFly()
	if flying then return end
	if not script.Enabled then return end

	local character = player.Character
	if not character then return end

	local root = character:FindFirstChild("HumanoidRootPart")
	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if not root or not humanoid then return end

	flying = true

	bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodyVelocity.Velocity = Vector3.zero
	bodyVelocity.Parent = root

	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bodyGyro.P = 10000
	bodyGyro.CFrame = root.CFrame
	bodyGyro.Parent = root

	humanoid.PlatformStand = true
end

local function stopFly()
	if not flying then return end

	flying = false

	if bodyVelocity then
		bodyVelocity:Destroy()
		bodyVelocity = nil
	end

	if bodyGyro then
		bodyGyro:Destroy()
		bodyGyro = nil
	end

	local character = player.Character
	if character then
		local humanoid = character:FindFirstChildOfClass("Humanoid")

		if humanoid then
			humanoid.PlatformStand = false
		end
	end
end

-- Only start/stop when your button changes Enabled
script:GetPropertyChangedSignal("Enabled"):Connect(function()
	if script.Enabled then
		startFly()
	else
		stopFly()
	end
end)

-- Flying movement
RunService.RenderStepped:Connect(function()
	if not script.Enabled or not flying then
		return
	end

	local character = player.Character
	if not character then return end

	local root = character:FindFirstChild("HumanoidRootPart")
	if not root or not bodyVelocity or not bodyGyro then return end

	local direction = Vector3.zero

	if UserInputService:IsKeyDown(Enum.KeyCode.W) then
		direction += camera.CFrame.LookVector
	end

	if UserInputService:IsKeyDown(Enum.KeyCode.S) then
		direction -= camera.CFrame.LookVector
	end

	if UserInputService:IsKeyDown(Enum.KeyCode.D) then
		direction += camera.CFrame.RightVector
	end

	if UserInputService:IsKeyDown(Enum.KeyCode.A) then
		direction -= camera.CFrame.RightVector
	end

	if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
		direction += Vector3.new(0, 1, 0)
	end

	if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		direction -= Vector3.new(0, 1, 0)
	end

	if direction.Magnitude > 0 then
		direction = direction.Unit
	end

	bodyVelocity.Velocity = direction * flySpeed

	bodyGyro.CFrame = CFrame.lookAt(
		root.Position,
		root.Position + camera.CFrame.LookVector
	)
end)

-- Handle respawning
player.CharacterAdded:Connect(function()
	stopFly()

	task.wait(0.2)

	if script.Enabled then
		startFly()
	end
end)
   end,
})