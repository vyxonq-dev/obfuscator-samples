local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Military Tycoon H-Hub",
   LoadingTitle = "Military Tycoon ScriptHub",
   LoadingSubtitle = "by H-Man",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "H-Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key System",
      Subtitle = "Subscribe to H-Man",
      ("https://pastebin.com/raw/Z7XhfMYW"),
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/Z7XhfMYW"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Main", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Have you Subscribed to H-Man yet?",
   Content = "Link in GUI",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Yes!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})

local Button = MainTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
 --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="H-Hub"; Text="The H-Hub Infinite Jump exploit is ready!"; Duration=5;})

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

local Button = MainTab:CreateButton({
   Name = "NoClip",
   Callback = function()
        local Noclip = nil
local Clip = nil

function noclip()
	Clip = false
	local function Nocl()
		if Clip == false and game.Players.LocalPlayer.Character ~= nil then
			for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA('BasePart') and v.CanCollide and v.Name ~= floatName then
					v.CanCollide = false
				end
			end
		end
		wait(0.21) -- basic optimization
	end
	Noclip = game:GetService('RunService').Stepped:Connect(Nocl)
end

function clip()
	if Noclip then Noclip:Disconnect() end
	Clip = true
end

noclip() -- to toggle noclip() and clip()
   end,
})

local Button = MainTab:CreateButton({
   Name = "ctrl+click teleport",
   Callback = function()
        --Makes sure this script is only executed once
if _G.WRDClickTeleport == nil then
	_G.WRDClickTeleport = true
	
	local player = game:GetService("Players").LocalPlayer
	local UserInputService = game:GetService("UserInputService")
	 --Wanted to avoid using mouse instance, but UIS^ is very tedious to get mouse hit position
	local mouse = player:GetMouse()

	--Waits until the player's mouse is found
	repeat wait() until mouse
	
	UserInputService.InputBegan:Connect(function(input, gameProcessed)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			--Only click teleport if the toggle is enabled
			if _G.WRDClickTeleport and UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
				player.Character:MoveTo(Vector3.new(mouse.Hit.x, mouse.Hit.y, mouse.Hit.z)) 
			end
		end
	end)
--Just toggle instead of re-executing the script
else
	_G.WRDClickTeleport = not _G.WRDClickTeleport
	--Notify
	if _G.WRDClickTeleport then
		game.StarterGui:SetCore("SendNotification", {Title="H-Hub"; Text="Click teleport enabled"; Duration=5;})
	else
		game.StarterGui:SetCore("SendNotification", {Title="H-Hub"; Text="Click teleport disabled"; Duration=5;})
	end
end
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "SpeedSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local TeleportTab = Window:CreateTab("Teleports", nil) -- Title, Image
local Section = TeleportTab:CreateSection("Bank")

local Button = TeleportTab:CreateButton({
    Name = "Bank Front Door",
    Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(14, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-325.4371032714844, 124.03305053710938, -393.24945068359375)}):Play()
    end,
})

local Button = TeleportTab:CreateButton({
   Name = "Bank Vault",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(15, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-329.8420104980469, 47.53304672241211, -400.5674133300781)}):Play()
   end,
})

local Section = TeleportTab:CreateSection("Flags")

local Button = TeleportTab:CreateButton({
   Name = "Flag 1",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(15, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-289.6873474121094, 116.49667358398438, -1292.4759521484375)}):Play()
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Flag 2",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(16, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(956.42333984375, 117.27957916259766, -716.7061157226562)}):Play()
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Flag 3",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(16, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-888.767578125, 116.50255584716797, 293.92962646484375)}):Play()
   end,
})

local Button = TeleportTab:CreateButton({
   Name = "Flag 4",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(16.5, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(291.7763977050781, 116.50255584716797, 1077.2401123046875)}):Play()
   end,
})

local EliteTab = Window:CreateTab("Elite Mission", nil) -- Title, Image
local Section = EliteTab:CreateSection("Elite Mission1")

local Button = EliteTab:CreateButton({
   Name = "Teleport to Elite Missions",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(15, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(376.2667236328125, 123.30692291259766, 331.76019287109375)}):Play()
   end,
})

local Button = EliteTab:CreateButton({
   Name = "Teleport to Gate 1",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(4, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-6355.7021484375, 153.09991455078125, -52.386287689208984)}):Play()
   end,
})

local Button = EliteTab:CreateButton({
   Name = "Teleport to Gate 2",
   Callback = function()
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-6463.5927734375, 153.09996032714844, 25.907737731933594)}):Play()
   end,
})

local Button = EliteTab:CreateButton({
   Name = "Teleport to Gate 3",
   Callback = function()
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-6562.251953125, 160.09991455078125, 244.31150817871094)}):Play()
   end,
})

local Button = EliteTab:CreateButton({
   Name = "Teleport to Drill/Elevator",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-6560.12255859375, 160.61651611328125, 402.3182373046875)}):Play()
   end,
})

local Button = EliteTab:CreateButton({
   Name = "Teleport to Generator",
   Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-6571.9208984375, 128.0394744873047, 268.2109069824219)}):Play()
   end,
})

local Toggle = EliteTab:CreateToggle({
   Name = "AutoFarm Elite Mission1",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
local vim = game:GetService('VirtualInputManager')
local input = {
    hold = function(key, time)
        vim:SendKeyEvent(true, key, false, nil)
        wait(time)
        vim:SendKeyEvent(false, key, false, nil)
    end,
    press = function(key)
        vim:SendKeyEvent(true, key, false, nil)
        wait(0.005)
        vim:SendKeyEvent(false, key, false, nil)
    end
}

local function teleportToGateAndHoldE(gatePosition, waitTime, teleportTime)
    local player = game.Players.LocalPlayer
    local tweenService = game:GetService("TweenService")
    local character = player.Character
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    -- Teleport to the gate with a tween
    local tweenInfo = TweenInfo.new(teleportTime, Enum.EasingStyle.Linear)
    local teleportCFrame = CFrame.new(gatePosition)
    local teleportTween = tweenService:Create(humanoidRootPart, tweenInfo, {CFrame = teleportCFrame})
    teleportTween:Play()
    teleportTween.Completed:Wait()

    -- Simulate holding "E" for 6 seconds using your custom input library
    input.press(Enum.KeyCode.E)
    input.hold(Enum.KeyCode.E, 6)

    -- Wait for the specified waitTime
    wait(waitTime)
end

-- Example usage with the provided coordinates and wait times
local gatePositions = {
    {Vector3.new(343.339599609375, 123.30692291259766, 330.3838806152344), 36, 16},
    {Vector3.new(-6216.46923828125, 122.22490692138672, 454.86944580078125), 1, 1},
    {Vector3.new(-6355.7021484375, 153.09991455078125, -52.386287689208984), 1, 1},
    {Vector3.new(-6463.5927734375, 153.09996032714844, 25.907737731933594), 1, 1},
    {Vector3.new(-6562.251953125, 160.09991455078125, 244.31150817871094), 1, 1},
    {Vector3.new(-6561.84326171875, 160.09991455078125, 393.8031921386719), 1, 1},
    {Vector3.new(-6557.51220703125, 160.61656188964844, 406.480224609375), 58, 1},
    {Vector3.new(-6572.67431640625, 128.69883728027344, 270.0470275878906), 8, 1}
}

for _, data in pairs(gatePositions) do
    teleportToGateAndHoldE(data[1], data[2], data[3])
end
   end,
})

local MiscTab = Window:CreateTab("Misc", nil) -- Title, Image
local Section = MiscTab:CreateSection("YouTube Link")

local Button = MiscTab:CreateButton({
   Name = "Subscribe to H-Man",
   Callback = function()
		setclipboard("https://www.youtube.com/channel/UCh3g4w-hdtL-JeZDae7jdLQ")
   end,
})