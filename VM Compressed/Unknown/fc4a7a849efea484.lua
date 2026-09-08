local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "The script Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Ty for executing",
   LoadingSubtitle = "by tomasmoi6",
   ShowText = "The Script", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu â enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "TheHub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "Key is in my roblox bio (tomasmoi6new)", -- Use this to tell the user how to get a key
      FileName = "THESCRIPTKEY", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/Uj5RkHj3"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Tab = Window:CreateTab("Random", nil) -- Title, Image

local Slider = Tab:CreateSlider({
   Name = "Slider Example",
   Range = {0, 1000},
   Increment = 1,
   Suffix = "Bananas",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        local Toggle = Tab:CreateToggle({
   Name = "Toggle Example",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Click%20Teleport.lua"))()
   end,
})
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Infjump",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        getgenv().infJump = arg
    _G.infinjump = not _G.infinjum
    if getgenv().infJump == false then
        _G.infinjump = false
    else
        _G.infinjump = true
    end
    if not getgenv().iIIIiIIIIIIiiiIIIII then
        if _G.infinJumpStarted == nil then
            _G.infinJumpStarted = true
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
                    getgenv().iIIIiIIIIIIiiiIIIII = true
                end
            end)
        end
    end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "ESP MM2",
   CurrentValue = false,
   Flag = "Esp", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        -- [[ Rscripts Risk Notice ]]
-- This script is not verified by rscripts.net. Deal with caution.
--
-- Stay safe:
--   â¢ Never log in on unofficial Roblox sites or lookalike domains.
--   â¢ Real Roblox links use roblox.com (check the .com ending).
--   â¢ Treat fake Roblox login / "claim reward" pages as phishing.
-- [[ End Rscripts Risk Notice ]]
        loadstring(game:HttpGet("https://gist.githubusercontent.com/maks1165/6e13d98a9b523488cfc850dd7699a668/raw/5068cc3deb3973685b5b2a0a4f9af1803464e0bc/MM2%2520ESP%2520ROLES%2520VIEW"))()
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Universal ESP",
   CurrentValue = false,
   Flag = "Universal ESP", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/UniversalEspUI.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Fly",
   Callback = function()
        local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")

local flying = false
local bodyVelocity
local bodyGyro

local speed = 30

local function startFlying()
	flying = true

	bodyVelocity = Instance.new("BodyVelocity")
	bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bodyVelocity.Velocity = Vector3.zero
	bodyVelocity.Parent = rootPart

	bodyGyro = Instance.new("BodyGyro")
	bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
	bodyGyro.P = 10000
	bodyGyro.Parent = rootPart

	RunService:BindToRenderStep("Fly", Enum.RenderPriority.Character.Value, function()
		local camera = workspace.CurrentCamera
		local moveDirection = Vector3.zero

		if UserInputService:IsKeyDown(Enum.KeyCode.W) then
			moveDirection += camera.CFrame.LookVector
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.S) then
			moveDirection -= camera.CFrame.LookVector
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.A) then
			moveDirection -= camera.CFrame.RightVector
		end

		if UserInputService:IsKeyDown(Enum.KeyCode.D) then
			moveDirection += camera.CFrame.RightVector
		end

		if moveDirection.Magnitude > 0 then
			bodyVelocity.Velocity = moveDirection.Unit * speed
		else
			bodyVelocity.Velocity = Vector3.zero
		end

		bodyGyro.CFrame = camera.CFrame
	end)
end

local function stopFlying()
	flying = false

	RunService:UnbindFromRenderStep("Fly")

	if bodyVelocity then
		bodyVelocity:Destroy()
	end

	if bodyGyro then
		bodyGyro:Destroy()
	end
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if input.KeyCode == Enum.KeyCode.E then
		if flying then
			stopFlying()
		else
			startFlying()
		end
	end
end)

player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = character:WaitForChild("Humanoid")
	rootPart = character:WaitForChild("HumanoidRootPart")
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Noclip (Press N to toggle)",
   Callback = function()
      local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local noclip = false

local function updateCharacter(char)
	character = char
end

player.CharacterAdded:Connect(updateCharacter)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then
		return
	end

	if input.KeyCode == Enum.KeyCode.N then
		noclip = not noclip
		print("Noclip:", noclip and "PÃ¤Ã¤llÃ¤" or "Pois")
	end
end)

RunService.Stepped:Connect(function()
	if noclip and character then
		for _, part in ipairs(character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Button Example",
   Callback = function()
      local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer

local espEnabled = false
local highlights = {}

local function createESP(character)
	if character:FindFirstChild("PinkESP") then
		return
	end

	local highlight = Instance.new("Highlight")
	highlight.Name = "PinkESP"
	highlight.FillColor = Color3.fromRGB(255, 0, 255)
	highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
	highlight.FillTransparency = 0.4
	highlight.OutlineTransparency = 0
	highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	highlight.Enabled = espEnabled
	highlight.Parent = character

	highlights[character] = highlight
end

local function setupPlayer(player)
	if player == localPlayer then
		return
	end

	if player.Character then
		createESP(player.Character)
	end

	player.CharacterAdded:Connect(function(character)
		task.wait(1)
		createESP(character)
	end)
end

for _, player in ipairs(Players:GetPlayers()) do
	setupPlayer(player)
end

Players.PlayerAdded:Connect(setupPlayer)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.B then
		espEnabled = not espEnabled

		for _, highlight in pairs(highlights) do
			highlight.Enabled = espEnabled
		end

		if espEnabled then
			print("Pink ESP: PÃÃLLÃ")
		else
			print("Pink ESP: POIS")
		end
	end
end)
   end,
})

local Tab = Window:CreateTab("AimBot", nil) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Aimlock Q",
   Callback = function()
      local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local locked = false
local target = nil

local function getClosestPlayer()
	local closest
	local shortestDistance = math.huge

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= localPlayer and player.Character then
			local head = player.Character:FindFirstChild("Head")
			local humanoid = player.Character:FindFirstChild("Humanoid")

			if head and humanoid and humanoid.Health > 0 then
				local distance = (head.Position - camera.CFrame.Position).Magnitude

				if distance < shortestDistance then
					shortestDistance = distance
					closest = player
				end
			end
		end
	end

	return closest
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.Q then
		if locked then
			locked = false
			target = nil
			print("Aim Lock: OFF")
		else
			target = getClosestPlayer()

			if target then
				locked = true
				print("Aim Lock:", target.Name)
			end
		end
	end
end)

RunService.RenderStepped:Connect(function()
	if locked and target and target.Character then
		local head = target.Character:FindFirstChild("Head")
		local humanoid = target.Character:FindFirstChild("Humanoid")

		if head and humanoid and humanoid.Health > 0 then
			camera.CFrame = CFrame.new(camera.CFrame.Position, head.Position)
		else
			locked = false
			target = nil
		end
	end
end)
   end,
})

local Tab = Window:CreateTab("Misc",nil) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Anti fling",
   Callback = function()
		local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

local MAX_VELOCITY = 100

local function protectCharacter(character)
	local root = character:WaitForChild("HumanoidRootPart")

	RunService.Heartbeat:Connect(function()
		if root and root.Parent then
			local velocity = root.AssemblyLinearVelocity

			if velocity.Magnitude > MAX_VELOCITY then
				root.AssemblyLinearVelocity = Vector3.zero
				root.AssemblyAngularVelocity = Vector3.zero
			end
		end
	end)
end

if player.Character then
	protectCharacter(player.Character)
end

player.CharacterAdded:Connect(protectCharacter)
   end,
})

local Button = Tab:CreateButton({
   Name = "Dropkick R6 and press F",
   Callback = function()
		local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = game.Players.LocalPlayer

local DropkickEvent = ReplicatedStorage:WaitForChild("DropkickEvent")

local cooldown = false

local ANIMATION_ID = "rbxassetid://OMA_ANIMAATIO_ID"

local function dropkick()
	if cooldown then return end
	cooldown = true

	local character = player.Character
	if not character then return end

	local humanoid = character:FindFirstChild("Humanoid")

	if humanoid then
		local animation = Instance.new("Animation")
		animation.AnimationId = ANIMATION_ID

		local track = humanoid:LoadAnimation(animation)
		track:Play()
	end

	-- kertoo serverille ettÃ¤ potku alkaa
	DropkickEvent:FireServer()

	task.wait(2)
	cooldown = false
end

UserInputService.InputBegan:Connect(function(input, processed)
	if processed then return end

	if input.KeyCode == Enum.KeyCode.F then
		dropkick()
	end
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Dropkick R6 press F",
   Callback = function()
		local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DropkickEvent = ReplicatedStorage:WaitForChild("DropkickEvent")

local cooldown = false

local ANIMATION_ID = "rbxassetid://127764273000599"

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if gameProcessed then return end

	if input.KeyCode == Enum.KeyCode.F and not cooldown then
		cooldown = true

		local player = game.Players.LocalPlayer
		local character = player.Character
		local humanoid = character and character:FindFirstChild("Humanoid")

		if humanoid then
			local animation = Instance.new("Animation")
			animation.AnimationId = ANIMATION_ID

			local track = humanoid:LoadAnimation(animation)
			track.Priority = Enum.AnimationPriority.Action
			track:Play()
		end

		DropkickEvent:FireServer()

		task.wait(2)
		cooldown = false
	end
end)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DropkickEvent = ReplicatedStorage:WaitForChild("DropkickEvent")

local RANGE = 7
local POWER = 120

DropkickEvent.OnServerEvent:Connect(function(player)

	local character = player.Character
	if not character then return end

	local root = character:FindFirstChild("HumanoidRootPart")
	if not root then return end

	local hitbox = Instance.new("Part")
	hitbox.Size = Vector3.new(5,5,6)
	hitbox.Transparency = 1
	hitbox.CanCollide = false
	hitbox.Massless = true
	hitbox.CFrame = root.CFrame * CFrame.new(0,0,-4)
	hitbox.Parent = workspace

	local alreadyHit = {}

	hitbox.Touched:Connect(function(hit)
		local enemy = hit.Parent
		local enemyHumanoid = enemy:FindFirstChild("Humanoid")
		local enemyRoot = enemy:FindFirstChild("HumanoidRootPart")

		if enemyHumanoid and enemyRoot and enemy ~= character then
			
			if alreadyHit[enemy] then return end
			alreadyHit[enemy] = true

			local direction = (enemyRoot.Position - root.Position).Unit

			enemyRoot.AssemblyLinearVelocity =
				direction * POWER + Vector3.new(0,60,0)
		end
	end)

	game.Debris:AddItem(hitbox,0.4)
end)

   end,
})

local Button = Tab:CreateButton({
   Name = "Dropkick WORKS",
   Callback = function()
		-- [[ Rscripts Risk Notice ]]
-- This script is not verified by rscripts.net. Deal with caution.
--
-- Stay safe:
--   â¢ Never log in on unofficial Roblox sites or lookalike domains.
--   â¢ Real Roblox links use roblox.com (check the .com ending).
--   â¢ Treat fake Roblox login / "claim reward" pages as phishing.
-- [[ End Rscripts Risk Notice ]]
loadstring(game:HttpGet("https://pastebin.com/raw/8XCgheRD"))()
   end,
})

local Tab = Window:CreateTab("CREDITs", nil) -- Title, Image

local Paragraph = Tab:CreateParagraph({Title = "Credits", Content = "Universal ESP:zzerexx ScriptBlox"})
local Paragraph = Tab:CreateParagraph({Title = "Mm2 ESP", Content = "Hacker_normal8 RScripts"})
local Paragraph = Tab:CreateParagraph({Title = "Infjump", Content = "Zenoxa ScriptBlox"})