Workspace.Camera.FieldOfView = 95 -- CHANGED: Set FieldOfView to 95
-- For Music local sound = game.Workspace:FindFirstChild("Music")
local sound = game.Workspace:FindFirstChild("Music")
if sound then
-- Function to check if a sound effect already exists
local function findEffect(className)
for _, effect in ipairs(sound:GetChildren()) do
if effect:IsA(className) then
return effect
end
end
return nil
end

-- Add EqualizerSoundEffect if not present
local eq = findEffect("EqualizerSoundEffect")
if not eq then
eq = Instance.new("EqualizerSoundEffect")
eq.Parent = sound
eq.Enabled = true
eq.HighGain = 0
eq.LowGain = 0
eq.MidGain = 0
end

-- Add ReverbSoundEffect if not present
local reverbEffect = findEffect("ReverbSoundEffect")
if not reverbEffect then
reverbEffect = Instance.new("ReverbSoundEffect")
reverbEffect.Parent = sound
reverbEffect.Enabled = false
reverbEffect.DecayTime = 0.1
reverbEffect.Density = 0
reverbEffect.DryLevel = 0
reverbEffect.WetLevel = 0
end

end

-- Check if the sound instance exists
if not sound then
warn("No sound instance named 'Music' found in Workspace!")
-- We will not return here as the rest of the script is for the GUI and will still work.
end

local Lighting = game:GetService("Lighting")
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
Name = "Bear [Alpha] Hub!",
Icon = 0,
LoadingTitle = "Loading Bear Script...",
LoadingSubtitle = "by El_VireXus",
Theme = "Grey", 
DisableRayfieldPrompts = false,
DisableBuildWarnings = false,
ConfigurationSaving = {
Enabled = true,
FolderName = nil,
FileName = "ConfigOne"
},
Discord = {
Enabled = false,
Invite = "noinvitelink",
RememberJoins = true
},
KeySystem = false,
KeySettings = {
Title = "Untitled",
Subtitle = "Key System",
Note = "No method of obtaining the key is provided",
FileName = "Key",
SaveKey = true,
GrabKeyFromSite = false,
Key = {"Hello"}
}
})

Rayfield:Notify({
Title = "Bear [Alpha] Hub!", -- Updated Title
Content = "Script is now fully loaded!", -- Updated Content
Duration = 2, -- CHANGED: Duration set to 2
Image = "check",
})

local Tab = Window:CreateTab("Main", "menu") -- RENAMED: from "Main Settings" to "Main"

local Section = Tab:CreateSection("Useful Scripts") -- RENAMED: from "Utility Scripts" to "Useful Scripts"

-- BUTTON: Endless Stamina
local Button = Tab:CreateButton({
	Name = "Endless Stamina",
	Callback = function()
		local Players = game:GetService("Players")
		local LocalPlayer = Players.LocalPlayer

		-- stop double enable lol
		if _G.EndlessStaminaActive then
			Rayfield:Notify({
				Title = "Bear [Alpha] Hub!",
				Content = "Endless Stamina already on bro",
				Duration = 3,
				Image = "alert-triangle",
			})
			return
		end
		_G.EndlessStaminaActive = true

		-- main stamina thingy
		local function enableEndlessStamina()
			local success, err = pcall(function()
				local playerGui = LocalPlayer:WaitForChild("PlayerGui")
				local gameUI = playerGui:WaitForChild("GameUI")
				local inGameDisplay = gameUI:WaitForChild("InGameDisplay")
				local staminaDisplay = inGameDisplay:WaitForChild("StaminaDisplay")

				local current = staminaDisplay:WaitForChild("Current") -- number go down lol
				local frame = staminaDisplay:WaitForChild("Frame")
				local fill =
					frame:FindFirstChild("Fill")
					or frame:FindFirstChildWhichIsA("Frame")
					or frame:FindFirstChildWhichIsA("ImageLabel")

				-- loop forever hehe
				task.spawn(function()
					while _G.EndlessStaminaActive do
						if current and current.Value == 26 then
							current.Value = 100 -- back to full yay
						end

						if fill then
							fill.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
						end

						if frame then
							frame.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
						end

						task.wait(0.05)
					end
				end)
			end)

			if not success then
				warn("stamina ui not found yet lol", err)
			end
		end

		-- run now
		task.spawn(enableEndlessStamina)

		-- rerun on respawn
		LocalPlayer.CharacterAdded:Connect(function()
			task.wait(2)
			if _G.EndlessStaminaActive then
				task.spawn(enableEndlessStamina)
			end
		end)

		Rayfield:Notify({
			Title = "Bear [Alpha] Hub!",
			Content = "Endless Stamina ON ⚡",
			Duration = 5,
			Image = "zap",
		})

		print("endless stamina enabled yoo")
	end,
})
-- END OF Endless Stamina Button

-- NEW BUTTON ADDED: Auto Sprint
local Button = Tab:CreateButton({
Name = "Auto Sprint (Useful for juking)",
Callback = function()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Wait for character
local function getChar()
local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
return char, hum
end

local Character, Humanoid = getChar()

-- Reconnect on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
Character = char
Humanoid = char:WaitForChild("Humanoid")
end)

--// GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Sprintgui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.05, 0, 0.3, 0)
Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Text = "Auto sprint"
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = Frame

local StartBtn = Instance.new("TextButton")
StartBtn.Text = "Start"
StartBtn.Size = UDim2.new(0.5, 0, 0, 30)
StartBtn.Position = UDim2.new(0, 0, 0, 40)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
StartBtn.TextColor3 = Color3.new(1,1,1)
StartBtn.Parent = Frame

local StopBtn = Instance.new("TextButton")
StopBtn.Text = "Stop"
StopBtn.Size = UDim2.new(0.5, 0, 0, 30)
StopBtn.Position = UDim2.new(0.5, 0, 0, 40)
StopBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
StopBtn.TextColor3 = Color3.new(1,1,1)
StopBtn.Parent = Frame

local MinBtn = Instance.new("TextButton")
MinBtn.Text = "-"
MinBtn.Size = UDim2.new(0, 30, 0, 30)
MinBtn.Position = UDim2.new(1, -30, 0, 0)
MinBtn.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MinBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinBtn.Parent = Frame

--// State
local enabled = false
local minimized = false
local JukeDistance = 25.5
local WalkSpeed = 16
local SprintSpeed = 27

--// Detection Loop
RunService.Heartbeat:Connect(function()
if enabled and Character and Humanoid then
local isThreat = false
for _, plr in ipairs(Players:GetPlayers()) do
if plr ~= LocalPlayer and plr.Team and plr.Team.Name:lower():find("bear") then
local enemyChar = plr.Character
if enemyChar and enemyChar:FindFirstChild("HumanoidRootPart") then
local dist = (Character.HumanoidRootPart.Position - enemyChar.HumanoidRootPart.Position).Magnitude
if dist <= JukeDistance then
isThreat = true
break
end
end
end
end
-- Adjust speed
if isThreat then
Humanoid.WalkSpeed = SprintSpeed
else
Humanoid.WalkSpeed = WalkSpeed
end
end
end)

--// Button Logic
StartBtn.MouseButton1Click:Connect(function()
enabled = true
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
StopBtn.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
end)

StopBtn.MouseButton1Click:Connect(function()
enabled = false
Humanoid.WalkSpeed = WalkSpeed -- reset on stop
StopBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
StartBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
end)

MinBtn.MouseButton1Click:Connect(function()
minimized = not minimized
if minimized then
for _, obj in ipairs(Frame:GetChildren()) do
if obj ~= Title and obj ~= MinBtn then
obj.Visible = false
end
end
Frame.Size = UDim2.new(0, 200, 0, 30)
else
for _, obj in ipairs(Frame:GetChildren()) do
obj.Visible = true
end
Frame.Size = UDim2.new(0, 200, 0, 100)
end
end)
print("Bear [Alpha] Hub!: Auto Sprint (Bear Evasion) Executed✔")
end,
})
-- END OF NEW BUTTON

local Button = Tab:CreateButton({
Name = "Player Hitbox Controller", -- NEW BUTTON
Callback = function()
-- Global Variables (Keep these at the top)
_G.HeadSize = 10
_G.Disabled = true -- True means the custom hitboxes are active

-- Configuration for the GUI
local HEAD_SIZE_MIN = 0
local HEAD_SIZE_MAX = 50

-- References to Roblox Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Function to set up the hitbox on a character
local function setupHitbox(character)
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return
    end

    local HumanoidRootPart = character.HumanoidRootPart
    -- Only update if the custom size is not 0
    if _G.HeadSize > 0 then
        HumanoidRootPart.Size = Vector3.new(_G.HeadSize, _G.HeadSize, _G.HeadSize)
        HumanoidRootPart.Transparency = 0.7
        HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
        HumanoidRootPart.Material = Enum.Material.Neon
        HumanoidRootPart.CanCollide = false
    else
        -- Reset to default size (assuming default is Vector3.new(2, 2, 2) for HRP,
        -- but exploits might not be able to get the true default, so we'll just
        -- set Transparency to 1 and let the game handle the rest of the default properties.)
        HumanoidRootPart.Transparency = 1
        -- The rest of the properties are often controlled by the server/client
        -- to prevent issues, we will mostly focus on making it invisible
    end
end

-- Main Logic Loop (Don't Touch)
RunService.RenderStepped:Connect(function()
    if _G.Disabled then
        -- Iterate over all players
        for _, player in ipairs(Players:GetPlayers()) do
            -- Skip the local player
            if player.Name ~= LocalPlayer.Name and player.Character then
                -- Use pcall for safety in an exploit environment
                pcall(setupHitbox, player.Character)
            end
        end
    end
end)


--- GUI Creation ---

-- ScreenGui: The container for all GUI elements
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "HitboxController"
-- Change: Make the ScreenGui property 'ResetOnSpawn' false for persistence
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

-- Frame: The main panel
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 200, 0, 150)
Frame.Position = UDim2.new(0.5, -100, 0.5, -75) -- Centered
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderColor3 = Color3.fromRGB(15, 15, 15)
Frame.Active = true
Frame.Draggable = true -- Allows the user to move it
Frame.Parent = ScreenGui

-- Title Label
local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Position = UDim2.new(0, 0, 0, 0)
Title.Text = "Player hitbox customization"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 18
Title.Parent = Frame

-- --- Minimize Button ---
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 25, 1, 0)
MinimizeButton.Position = UDim2.new(1, -25, 0, 0) -- Top right corner of the Title
MinimizeButton.Text = "–" -- The minimize symbol
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
MinimizeButton.Font = Enum.Font.SourceSansBold
MinimizeButton.TextSize = 20
MinimizeButton.Parent = Title

local isMinimized = false
local originalFrameSize = Frame.Size -- Store the full size

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized

    if isMinimized then
        -- Minimize: Change Frame size and button text
        Frame.Size = UDim2.new(0, 200, 0, 25) -- Only the title bar is visible
        MinimizeButton.Text = "+" -- Change to a 'maximize' symbol
    else
        -- Restore: Change Frame size and button text
        Frame.Size = originalFrameSize
        MinimizeButton.Text = "–" -- Change back to the 'minimize' symbol
    end
end)
-- --- End Minimize Button ---


-- Hitbox Size Text Box Label
local SizeLabel = Instance.new("TextLabel")
SizeLabel.Size = UDim2.new(1, -20, 0, 20)
SizeLabel.Position = UDim2.new(0, 10, 0, 35)
SizeLabel.Text = "Hitbox Size (0 - 50, Current: ".._G.HeadSize..")"
SizeLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SizeLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SizeLabel.TextXAlignment = Enum.TextXAlignment.Left
SizeLabel.Font = Enum.Font.SourceSans
SizeLabel.TextSize = 14
SizeLabel.Parent = Frame

-- Hitbox Size Text Box (Input for _G.HeadSize)
local SizeTextBox = Instance.new("TextBox")
SizeTextBox.Size = UDim2.new(1, -20, 0, 25)
SizeTextBox.Position = UDim2.new(0, 10, 0, 60)
SizeTextBox.PlaceholderText = tostring(_G.HeadSize)
SizeTextBox.Text = tostring(_G.HeadSize)
SizeTextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SizeTextBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SizeTextBox.Font = Enum.Font.SourceSans
SizeTextBox.TextSize = 16
SizeTextBox.Parent = Frame

-- Input Handling for Text Box
SizeTextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local newSize = tonumber(SizeTextBox.Text)

        if newSize and newSize >= HEAD_SIZE_MIN and newSize <= HEAD_SIZE_MAX then
            _G.HeadSize = newSize
            SizeLabel.Text = "Hitbox Size (0 - 50, Current: ".._G.HeadSize..")"
            print("Hitbox Size set to: " .. _G.HeadSize)
        else
            -- If input is invalid, reset the Text Box text to the current valid size
            SizeTextBox.Text = tostring(_G.HeadSize)
            print("Invalid input! Must be a number between "..HEAD_SIZE_MIN.." and "..HEAD_SIZE_MAX..".")
        end
    end
end)

-- Toggle Button (For _G.Disabled)
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(1, -20, 0, 30)
ToggleButton.Position = UDim2.new(0, 10, 0, 100)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.TextSize = 18
ToggleButton.Parent = Frame

-- Function to update the toggle button's appearance
local function updateToggleButton()
    if _G.Disabled then
        ToggleButton.Text = "Status: ON"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(50, 200, 50) -- Green
    else
        ToggleButton.Text = "Status: OFF"
        ToggleButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50) -- Red
    end
end

-- Initial button setup
updateToggleButton()

-- Button click event
ToggleButton.MouseButton1Click:Connect(function()
    _G.Disabled = not _G.Disabled -- Toggle the status
    updateToggleButton()
    print("Hitbox Toggled: " .. (_G.Disabled and "ON" or "OFF"))
    
    -- When disabling, try to reset properties to default (by setting Transparency to 1)
    if not _G.Disabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Name ~= LocalPlayer.Name and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                pcall(function()
                    player.Character.HumanoidRootPart.Transparency = 1
                    -- Other properties (Size, Material, BrickColor) are often
                    -- automatically reverted by the game when a client stops
                    -- forcefully setting them, but setting Transparency is key.
                end)
            end
        end
    end
end)
print("Bear [Alpha] Hub!: Player Hitbox Controller Executed✔")
end,
})

local Button = Tab:CreateButton({
Name = "Infinite Yield Script", -- Updated Name
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
print("Bear [Alpha] Hub!: Infinite Yield Executed✔") -- Updated Print
end,
})

local Button = Tab:CreateButton({
Name = "Dex Explorer Script", -- Updated Name
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
print("Bear [Alpha] Hub!: Dex Explorer Executed✔") -- Updated Print
end,
})

-- NEW BUTTON ADDED HERE
local Button = Tab:CreateButton({
Name = "BEAR (Alpha) Alpha Gui V6 OP",
Callback = function()
loadstring(game:HttpGet("https://rawscripts.net/raw/BEAR-(Alpha)-Alpha-Gui-V5-OP-27925"))()
print("Bear [Alpha] Hub!: BEAR (Alpha) Alpha Gui V5 OP Executed")
end,
})
-- END OF NEW BUTTON

-- Button for Emote GUI [R15 Only] WAS REMOVED.

local Button = Tab:CreateButton({
Name = "OP Fling GUI", -- Updated Name
Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/4nYEdANe"))()
print("Bear [Alpha] Hub!: Fling GUI Loaded✔") -- Updated Print
end,
})

-- New Auto Farm Button
local Button = Tab:CreateButton({
Name = "Auto farm script woohoo!",
Callback = function()
-- Services
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local CoreGui = game:GetService("CoreGui")

-- Prevent duplicate execution
if _G.AutoQuidzCollectorRunning then
StarterGui:SetCore("SendNotification", {
Title = "Script Already Running",
Text = "The Auto Quidz Collector is already running!",
Duration = 5
})
return
end
_G.AutoQuidzCollectorRunning = true

-- GUI Setup    
local ScreenGui = Instance.new("ScreenGui")    
ScreenGui.ResetOnSpawn = false -- GUI persists after respawn    
ScreenGui.Parent = CoreGui    

local MainFrame = Instance.new("Frame")    
MainFrame.Size = UDim2.new(0, 200, 0, 150)    
MainFrame.Position = UDim2.new(0.5, -100, 0.1, 0)    
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)    
MainFrame.BorderSizePixel = 2    
MainFrame.Draggable = true    
MainFrame.Active = true    
MainFrame.Parent = ScreenGui    

local Title = Instance.new("TextLabel")    
Title.Size = UDim2.new(1, 0, 0, 25)    
Title.Text = "Auto Quidz Collector"    
Title.TextColor3 = Color3.new(1, 1, 1)    
Title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)    
Title.Parent = MainFrame    

local QuidzCounter = Instance.new("TextLabel")    
QuidzCounter.Size = UDim2.new(1, 0, 0, 25)    
QuidzCounter.Position = UDim2.new(0, 0, 0, 30)    
QuidzCounter.Text = "Quidz Collected: 0"    
QuidzCounter.TextColor3 = Color3.new(1, 1, 1)    
QuidzCounter.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)    
QuidzCounter.Parent = MainFrame    

local LevelCounter = Instance.new("TextLabel")    
LevelCounter.Size = UDim2.new(1, 0, 0, 25)    
LevelCounter.Position = UDim2.new(0, 0, 0, 60)    
LevelCounter.Text = "Level: 1"    
LevelCounter.TextColor3 = Color3.new(1, 1, 1)    
LevelCounter.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)    
LevelCounter.Parent = MainFrame    

local StartButton = Instance.new("TextButton")    
StartButton.Size = UDim2.new(1, 0, 0, 30)    
StartButton.Position = UDim2.new(0, 0, 0, 90)    
StartButton.Text = "Start"    
StartButton.TextColor3 = Color3.new(0, 1, 0)    
StartButton.BackgroundColor3 = Color3.new(0, 1, 0)    
StartButton.Parent = MainFrame    

local StopButton = Instance.new("TextButton")    
StopButton.Size = UDim2.new(1, 0, 0, 30)    
StopButton.Position = UDim2.new(0, 0, 0, 120)    
StopButton.Text = "Stop"    
StopButton.TextColor3 = Color3.new(1, 1, 1)    
StopButton.BackgroundColor3 = Color3.new(1, 0, 0)    
StopButton.Parent = MainFrame    

local MinimizeButton = Instance.new("TextButton")    
MinimizeButton.Size = UDim2.new(0, 50, 0, 25)    
MinimizeButton.Position = UDim2.new(1, -50, 0, 0)    
MinimizeButton.Text = "-"    
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)    
MinimizeButton.BackgroundColor3 = Color3.new(0.8, 0.5, 0)    
MinimizeButton.Parent = MainFrame    

-- Variables    
local collecting = false    
local quidzPosition = Vector3.new(408.13, 31.94, -26.91) -- Quidz position    
local cooldown = 0.7 -- Cooldown (unused in the provided loop structure but kept for reference)    
local quidzCollected = 0    
local level = 1    
local quidzPerLevel = 10    
local quidzIncreaseAmount = 5    
local interval = 9    
local doubleQuidz = false  -- New variable for gamepass    

-- Check for Double Quidz Gamepass    
local function checkDoubleQuidz()    
    local gamepassId = 12345678  -- Replace with your actual Double Quidz gamepass ID    
    if LocalPlayer:HasPass(gamepassId) then    
        doubleQuidz = true    
    end    
end    

-- Teleport Function    
local function teleportToQuidz()    
    local character = LocalPlayer.Character    
    if character and character:FindFirstChild("HumanoidRootPart") then    
        print("Teleporting to Quidz...") -- Debugging    
        character.HumanoidRootPart.CFrame = CFrame.new(quidzPosition)    
    end    
end    

-- Collection Function    
local function startCollecting()    
    if not collecting then    
        collecting = true    
        while collecting do    
            teleportToQuidz()    

            -- Adjust quidz increase based on the gamepass    
            local quidzToAdd = doubleQuidz and quidzIncreaseAmount * 2 or quidzIncreaseAmount    
            quidzCollected = quidzCollected + quidzToAdd    
            QuidzCounter.Text = "Quidz Collected: " .. quidzCollected    
                
            -- Level up    
            if quidzCollected >= level * quidzPerLevel then    
                level = level + 1    
                LevelCounter.Text = "Level: " .. level    
            end    
                
            print("Quidz Collected: ", quidzCollected) -- Debugging    
            wait(interval) -- Wait 9 secs before next collection    
        end    
    end    
end    

-- Stop Collecting    
local function stopCollecting()    
    collecting = false    
    print("Stopped collecting.") -- Debugging    
end    

-- Minimize GUI    
local minimized = false    
MinimizeButton.MouseButton1Click:Connect(function()    
    minimized = not minimized    
    for _, child in pairs(MainFrame:GetChildren()) do    
        if (child:IsA("TextButton") and child.Name ~= "CloseButton") or child:IsA("TextLabel") then    
            child.Visible = not minimized    
        end    
    end    
    MinimizeButton.Visible = true -- Keep minimize button visible    
    Title.Visible = true -- Keep title visible    
end)    

-- Button Clicks    
StartButton.MouseButton1Click:Connect(startCollecting)    
StopButton.MouseButton1Click:Connect(stopCollecting)    

-- Keep GUI on Respawn    
LocalPlayer.CharacterAdded:Connect(function()    
    wait(1)    
    MainFrame.Parent = ScreenGui    
end)    

-- Notice Message    
StarterGui:SetCore("SendNotification", {    
    Title = "AFK Mode Warning",    
    Text = "Turn on AFK mode! If not, you'll get banned. If on, you're safe!",    
    Duration = 9    
})    
print("Bear [Alpha] Hub!: Auto Farm Script Executed✔")

end,

})

-- NEW BUTTON: Auto Win (Teleport)
local Button = Tab:CreateButton({
Name = "Auto Win (Teleport)", -- New Name
Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeleportGUI"
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.Text = "Auto win"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "Minimize"
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -30, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Parent = frame

local startButton = Instance.new("TextButton")
startButton.Name = "Start"
startButton.Size = UDim2.new(1, 0, 0, 40)
startButton.Position = UDim2.new(0, 0, 0, 40)
startButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
startButton.Text = "Start Teleport"
startButton.TextColor3 = Color3.fromRGB(255, 255, 255)
startButton.Parent = frame

local stopButton = Instance.new("TextButton")
stopButton.Name = "Stop"
stopButton.Size = UDim2.new(1, 0, 0, 40)
stopButton.Position = UDim2.new(0, 0, 0, 80)
stopButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
stopButton.Text = "Stop Teleport"
stopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
stopButton.Parent = frame

local isTeleporting = false
local originalPosition = nil
local teleportLoop = nil
local targetPosition = Vector3.new(350827390697472, -102946297610240, 531412713209856)
local minimized = false

minimizeButton.MouseButton1Click:Connect(function()
    if minimized then
        frame.Size = UDim2.new(0, 200, 0, 150)
        startButton.Visible = true
        stopButton.Visible = true
        minimizeButton.Text = "-"
        minimized = false
    else
        frame.Size = UDim2.new(0, 200, 0, 30)
        startButton.Visible = false
        stopButton.Visible = false
        minimizeButton.Text = "+"
        minimized = true
    end
end)

startButton.MouseButton1Click:Connect(function()
    if not isTeleporting then
        originalPosition = humanoidRootPart.Position
        isTeleporting = true
        teleportLoop = game:GetService("RunService").Heartbeat:Connect(function()
            if character and humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(targetPosition)
            end
        end)
    end
end)

stopButton.MouseButton1Click:Connect(function()
    if isTeleporting then
        if teleportLoop then
            teleportLoop:Disconnect()
            teleportLoop = nil
        end
        isTeleporting = false
        if originalPosition and character and humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
        end
    end
end)

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoidRootPart = newChar:WaitForChild("HumanoidRootPart")
    if isTeleporting then
        if teleportLoop then
            teleportLoop:Disconnect()
        end
        teleportLoop = game:GetService("RunService").Heartbeat:Connect(function()
            if character and humanoidRootPart then
                humanoidRootPart.CFrame = CFrame.new(targetPosition)
            end
        end)
    end
end)
print("Bear [Alpha] Hub!: Auto Win Script Executed✔")

end,
})

-- UPDATED BUTTON: Remove Alien AI (Treat AlienAI as the Container/Model)
local Button = Tab:CreateButton({
Name = "Remove Alien AI (Permanent)",
Callback = function()
    local workspace = game.Workspace
    local found = false
    
    -- The function now destroys the ENTIRE passed object/container,
    -- and sets up a persistence check on its parent.
    local function destroyAlienContainer(alienObject)
        if alienObject and alienObject.Name == "AlienAI" then
            local parent = alienObject.Parent
            
            -- 1. Destroy the entire AlienAI object (Model, Folder, Part, etc.)
            alienObject:Destroy()
            found = true
            
            -- 2. Set up persistence listener on the parent (if it exists)
            if parent then
                -- Check for new instances being added to the parent
                parent.ChildAdded:Connect(function(child)
                    if child.Name == "AlienAI" then
                        child:Destroy()
                        Rayfield:Notify({
                            Title = "Bear [Alpha] Hub!",
                            Content = "Re-added AlienAI object destroyed!",
                            Duration = 3,
                            Image = "trash-2",
                        })
                        print("Bear [Alpha] Hub!: Re-added AlienAI object destroyed!")
                    end
                end)
            end
        end
    end
    
    -- Search all descendants of the workspace for *any* object named "AlienAI"
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant.Name == "AlienAI" then
            -- Note: We no longer check if it is a script.
            destroyAlienContainer(descendant)
        end
    end

    if found then
        Rayfield:Notify({
            Title = "Bear [Alpha] Hub!",
            Content = "Alien AI Container/Model removed and persistence enabled!",
            Duration = 5,
            Image = "trash-2",
        })
        print("Bear [Alpha] Hub!: Alien AI Container/Model removed and persistence enabled✔")
    else
        Rayfield:Notify({
            Title = "Bear [Alpha] Hub!",
            Content = "No AlienAI object found in Workspace!",
            Duration = 3,
            Image = "alert-triangle",
        })
        print("Bear [Alpha] Hub!: No AlienAI object found in Workspace!")
    end
end,
})
-- END OF UPDATED BUTTON: Remove Alien AI

-- NEW BUTTON ADDED: @ZhouTaiDev (ZhouTai)'s BEAR Script
local Button = Tab:CreateButton({
Name = "@ZhouTaiDev (ZhouTai)'s BEAR Script",
Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/r4k1xv3L"))()
print("Bear [Alpha] Hub!: @ZhouTaiDev (ZhouTai)'s BEAR Script Executed✔")
end,
})
-- END OF NEW BUTTON


local Divider = Tab:CreateDivider()

local Section = Tab:CreateSection("Lighting & Movement") -- Updated Section Name

local Button = Tab:CreateButton({
Name = "Activate Fullbright Mode", -- Updated Name
Callback = function()
Lighting.Brightness = 2
Lighting.ClockTime = 14
Lighting.FogEnd = 100000
Lighting.GlobalShadows = false
Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
print("Bear [Alpha] Hub!: Fullbright Activated✔") -- Updated Print
end,
})

local Button = Tab:CreateButton({
Name = "Restore Default Lighting", -- Updated Name
Callback = function()
Lighting.Brightness = 2
Lighting.ClockTime = 0
Lighting.GlobalShadows = true
Lighting.FogEnd = 120
Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
print("Bear [Alpha] Hub!: Lighting Reverted✔") -- Updated Print
end,
})

local Button = Tab:CreateButton({
Name = "Spectator Lighting Mode", -- Updated Name
Callback = function()
Lighting.Brightness = 2
Lighting.ClockTime = 0
Lighting.FogEnd = 100000
Lighting.GlobalShadows = false
Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
print("Bear [Alpha] Hub!: Spectator Lighting Activated✔") -- Updated Print
end,
})

local Slider = Tab:CreateSlider({
Name = "Player Walkspeed", -- Updated Name
Range = {16, 250},
Increment = 1,
Suffix = "Speed", -- Updated Suffix
CurrentValue = 16,
Flag = "SliderWalkspeed", -- Flag changed for uniqueness
Callback = function(v)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end,
})

local Slider = Tab:CreateSlider({
Name = "Player JumpPower", -- Updated Name
Range = {50, 500},
Increment = 1,
Suffix = "Power", -- Updated Suffix
CurrentValue = 50,
Flag = "SliderJumpPower", -- Flag changed for uniqueness
Callback = function(v)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end,
})

local Button = Tab:CreateButton({
Name = "Reset Walkspeed (Default)", -- Updated Name
Callback = function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
print("Bear [Alpha] Hub!: Walkspeed Reset to 16✔") -- Updated Print
end,
})

local Button = Tab:CreateButton({
Name = "Reset Bear Walkspeed (18)", -- Updated Name
Callback = function()
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 18
print("Bear [Alpha] Hub!: Bear Walkspeed Reset to 18✔") -- Updated Print
end,
})

local Divider = Tab:CreateDivider()

local Section = Tab:CreateSection("Visual Enhancements") -- Updated Section Name

local Button = Tab:CreateButton({
Name = "Toggle Name ESP", -- RENAMED for a toggle function
Callback = function()
    -- Global variable to track the ESP state
    _G.IsNameESPActive = _G.IsNameESPActive or false
    _G.IsNameESPActive = not _G.IsNameESPActive -- Toggle the state
    
    local Players = game:GetService("Players")
    local Teams = game:GetService("Teams")
    local LocalPlayer = Players.LocalPlayer
    
    -- Function to create the BillboardGui ESP
    local function createBillboardGui(character)
        local player = Players:GetPlayerFromCharacter(character)
        -- Stop if it's the LocalPlayer
        if player == LocalPlayer then 
            return 
        end
    
        local head = character:FindFirstChild("Head")
        if head then
            -- Remove existing BillboardGui if it exists (for a clean update)
            local existingGui = head:FindFirstChild("BearESP")
            if existingGui then
                existingGui:Destroy()
            end
            
            if _G.IsNameESPActive then -- Only create if active
                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "BearESP"
                billboardGui.AlwaysOnTop = true
                billboardGui.MaxDistance = 9999999999999
                billboardGui.Size = UDim2.new(0, 200, 0, 50)
                billboardGui.Adornee = head
                billboardGui.Parent = head
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.Text = character.Name
                textLabel.Parent = billboardGui
            
                if player then
                    if player.Team and player.Team.Name == "Bear" then
                        textLabel.TextColor3 = Color3.new(1, 0, 0) -- Red (Bear)
                    else
                        textLabel.TextColor3 = Color3.new(1, 1, 1) -- White (Survivor/Other)
                    end
                end
            end
        end
    end
    
    -- Function to clear all ESP Guis
    local function clearAllESP()
        for _, player in Players:GetPlayers() do
            local character = player.Character
            if character then
                local head = character:FindFirstChild("Head")
                if head then
                    local existingGui = head:FindFirstChild("BearESP")
                    if existingGui then
                        existingGui:Destroy()
                    end
                end
            end
        end
    end

    -- Update ESP for all existing players
    local function updateAllPlayersESP()
        for _, player in Players:GetPlayers() do
            local character = player.Character
            if character then
                createBillboardGui(character)
            end
        end
    end
    
    -- Global connections table to manage listeners
    _G.ESPConnections = _G.ESPConnections or {}
    
    if _G.IsNameESPActive then
        -- Activation Logic
        
        -- 1. Create ESP for current characters
        updateAllPlayersESP()
        
        -- 2. Connect new listeners (disconnect old ones first if any remain)
        for _, conn in ipairs(_G.ESPConnections) do conn:Disconnect() end
        _G.ESPConnections = {}

        -- Listener for new players and character respawns
        local playerAddedConn = Players.PlayerAdded:Connect(function(player)    
            local charAddedConn = player.CharacterAdded:Connect(createBillboardGui)    
            table.insert(_G.ESPConnections, charAddedConn)
        end)
        table.insert(_G.ESPConnections, playerAddedConn)

        for _, player in Players:GetPlayers() do
            if player ~= LocalPlayer then
                local charAddedConn = player.CharacterAdded:Connect(createBillboardGui)
                table.insert(_G.ESPConnections, charAddedConn)
            end
        end

        -- 3. Run the periodic update loop (if not already running)
        -- We'll just rely on the PlayerAdded/CharacterAdded for simplicity
        -- The original script's 5s update loop:
        _G.ESPUpdateTask = task.spawn(function()    
            while _G.IsNameESPActive do    
                task.wait(5)    
                if _G.IsNameESPActive then
                    updateAllPlayersESP()    
                end
            end
            _G.ESPUpdateTask = nil
        end)
        
        Rayfield:Notify({    
            Title = "Bear [Alpha] Hub!",
            Content = "Name ESP is **Active**!",
            Duration = 2,
            Image = "check",
        })    
        print("Bear [Alpha] Hub!: Name ESP Activated!")
        
    else
        -- Deactivation Logic
        
        -- 1. Disconnect all listeners
        for _, conn in ipairs(_G.ESPConnections) do conn:Disconnect() end
        _G.ESPConnections = {}
        
        -- 2. Clear all existing ESP visuals
        clearAllESP()
        
        -- 3. Stop the periodic update loop (by setting IsNameESPActive to false, the loop will exit)
        -- Note: We don't need to explicitly stop the task as the `while _G.IsNameESPActive` loop will stop it.
        
        Rayfield:Notify({    
            Title = "Bear [Alpha] Hub!",
            Content = "Name ESP is **Inactive**!",
            Duration = 2,
            Image = "x",
        })    
        print("Bear [Alpha] Hub!: Name ESP Deactivated!")
    end
end,
})


local Divider = Tab:CreateDivider()

local Section = Tab:CreateSection("Miscellaneous Functions") -- Updated Section Name

local Button = Tab:CreateButton({
Name = "Disable Round Cutscene GUIs", -- Updated Name
Callback = function()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:FindFirstChild("PlayerGui")
if not PlayerGui then return end

local function MuteSoundsInGui(gui)
for _, sound in ipairs(gui:GetDescendants()) do
if sound:IsA("Sound") then
sound.Volume = 0
end
end
end

local function CheckForCutscene()    
    local cutscene = PlayerGui:FindFirstChild("Cutscene")    
    local cutsceneDeluxe = PlayerGui:FindFirstChild("CutsceneDeluxe")    
    if cutscene then    
        MuteSoundsInGui(cutscene)    
        cutscene.Enabled = false -- Disable the Cutscene GUI    
    end    
    if cutsceneDeluxe then    
        MuteSoundsInGui(cutsceneDeluxe)    
        cutsceneDeluxe.Enabled = false -- Disable the CutsceneDeluxe GUI    
    end    
end    

-- Initial check    
CheckForCutscene()    

-- Listen for new GUI elements being added    
PlayerGui.ChildAdded:Connect(function(child)    
    if child.Name == "Cutscene" or child.Name == "CutsceneDeluxe" then    
        MuteSoundsInGui(child)    
        child.Enabled = false -- Disable the GUI when added    
    end    
end)    

-- Periodically check every 2 seconds    
task.spawn(function()    
    while true do    
        CheckForCutscene()    
        task.wait(2)    
    end    
end)    
print("Bear [Alpha] Hub!: Cutscene GUIs Disabled✔")

end,

})


---

local Tab = Window:CreateTab("Puzzles", "puzzle")

local Section = Tab:CreateSection("Puzzle Location Highlighters") -- Updated Section Name
local Label = Tab:CreateLabel("This highlights all the puzzles. You need to click it again every new round.", "activity") -- Updated Label

local Button = Tab:CreateButton({
Name = "Activate Puzzle ESP", -- Updated Name
Callback = function()
-- Puzzle ESP Start
local function addHighlight(object)
local highlight = Instance.new("Highlight")
highlight.Adornee = object
highlight.FillColor = Color3.new(1, 1, 0) -- Yellow color
highlight.Parent = object
end

-- Check for PuzzleBin and Puzzle | Cheese
local puzzleBin = workspace:FindFirstChild("PuzzleBin")
if puzzleBin then
local puzzleCheese = puzzleBin:FindFirstChild("Puzzle | Cheese")
if puzzleCheese then
print("Puzzle | Cheese folder found inside PuzzleBin.")
addHighlight(puzzleCheese)
-- Check for a part named "Cheese" inside "Puzzle | Cheese"
local cheesePart = puzzleCheese:FindFirstChild("Cheese")
if cheesePart then
print("Part named 'Cheese' found inside Puzzle | Cheese.")
addHighlight(cheesePart)
else
print("Part named 'Cheese' not found inside Puzzle | Cheese.")
end
else
print("Puzzle | Cheese folder not found inside PuzzleBin.")
end

-- Check for DecorCheese group inside PuzzleBin    
    local decorCheese = puzzleBin:FindFirstChild("DecorCheese")    
    if decorCheese then    
        print("DecorCheese group found inside PuzzleBin.")    
        addHighlight(decorCheese)    
    else    
        print("DecorCheese group not found inside PuzzleBin.")    
    end    

    -- Check for Memory group inside PuzzleBin    
    local memoryGroup = puzzleBin:FindFirstChild("Memory")    
    if memoryGroup then    
        print("Memory group found inside PuzzleBin.")    
        addHighlight(memoryGroup)    
    else    
        print("Memory group not found inside PuzzleBin.")    
    end    

    -- Check for CheeseAltar group inside PuzzleBin    
    local cheeseAltarGroup = puzzleBin:FindFirstChild("CheeseAltar")    
    if cheeseAltarGroup then    
        print("CheeseAltar group found inside PuzzleBin.")    
        addHighlight(cheeseAltarGroup)    
    else    
        print("CheeseAltar group not found inside PuzzleBin.")    
    end    
    local colorCodeGroup = puzzleBin:FindFirstChild("ColorCode")    
    if colorCodeGroup then    
        print("ColorCode group found inside PuzzleBin.")    
        addHighlight(colorCodeGroup)    
    else    
        print("ColorCode group not found inside PuzzleBin.")    
    end    

    -- Check for Wire group inside PuzzleBin    
    local wireGroup = puzzleBin:FindFirstChild("Wire")    
    if wireGroup then    
        print("Wire group found inside PuzzleBin.")    
        addHighlight(wireGroup)    
    else    
        print("Wire group not found inside PuzzleBin.")    
    end    

    -- Check for all groups named "Wire" inside PuzzleBin    
    local foundWires = false    
    for _, child in puzzleBin:GetChildren() do    
        if child.Name == "Wire" then    
            print("Group named 'Wire' found inside PuzzleBin.")    
            addHighlight(child)    
            foundWires = true    
        end    
    end    
    if not foundWires then    
        print("No group named 'Wire' found inside PuzzleBin.")    
    end    
else    
    print("PuzzleBin folder not found.")    
end    

-- Check for _Entities inside Map    
local mapGroup = workspace:FindFirstChild("Map")    
if mapGroup then    
    local entitiesFolder = mapGroup:FindFirstChild("_Entities")    
    if entitiesFolder then    
        print("_Entities folder found inside Map.")    
        -- Check for Cheese group inside _Entities    
        local cheeseGroup = entitiesFolder:FindFirstChild("Cheese")    
        if cheeseGroup then    
            print("Cheese group found inside _Entities.")    
            addHighlight(cheeseGroup)    
        else    
            print("Cheese group not found inside _Entities.")    
        end    
            
        -- Check for VSH group inside Map (Correction: this check should be inside the entitiesFolder check or on mapGroup)    
        -- The original script had it slightly wrong, assuming 'entitiesFolder' is used for the inner check    
        local vshGroup = entitiesFolder:FindFirstChild("VHS")    
        if vshGroup then    
            print("VHS group found inside _Entities.")    
            addHighlight(vshGroup)    
        else    
            print("VHS group not found inside _Entities.")    
        end    
    else    
        print("_Entities folder not found inside Map.")    
    end    
else    
    print("Map group not found.")    
end    
-- Puzzle Esp End    
Rayfield:Notify({    
    Title = "Bear [Alpha] Hub!", -- Updated Title    
    Content = "Puzzle ESP Activated!", -- Updated Content    
    Duration = 2, -- CHANGED: Duration set to 2
    Image = "puzzle",    
})    
print("Bear [Alpha] Hub!: Puzzle ESP Activated!") -- Updated Print

end,

})

local Button = Tab:CreateButton({
Name = "Show Color Code Clue", -- Updated Name
Callback = function()
--Show Color Code Script Start
local puzzleBin = workspace:FindFirstChild("PuzzleBin")
if puzzleBin then
local colorCodeGroup = puzzleBin:FindFirstChild("ColorCode")
if colorCodeGroup then
local cluePart = colorCodeGroup:FindFirstChild("Clue")
if cluePart then
local surfaceGui = cluePart:FindFirstChild("Note")
if surfaceGui and surfaceGui:IsA("SurfaceGui") then
local frame = surfaceGui:FindFirstChildOfClass("Frame")
if frame then
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ColorRevealGui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
local mainFrame = Instance.new("Frame")
mainFrame.Name = "Main"
mainFrame.Size = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.BackgroundColor3 = Color3.fromRGB(36, 27, 66)
mainFrame.BackgroundTransparency = 0.7
mainFrame.Parent = screenGui
local corner = Instance.new("UICorner")
corner.Parent = mainFrame
local CloseButton = Instance.new("ImageButton")
CloseButton.Name = "Close"
CloseButton.Size = UDim2.new(0, 50, 0, 50)
CloseButton.Position = UDim2.new(1, 0, 0, 0)
CloseButton.AnchorPoint = Vector2.new(1, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1
CloseButton.Image = "rbxassetid://13207238741"
CloseButton.Parent = mainFrame
CloseButton.MouseButton1Click:Connect(function()
screenGui:Destroy()
end)
local clonedFrame = frame:Clone()
clonedFrame.Parent = mainFrame
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
print("Bear [Alpha] Hub!: Color Code Clue Revealed✔")
else
warn("Frame not found inside SurfaceGui 'Note'.")
end
else
warn("SurfaceGui 'Note' not found or is not a SurfaceGui.")
end
else
warn("Part 'Clue' not found inside ColorCode group.")
end
else
warn("ColorCode group not found inside PuzzleBin.")
end
else
warn("PuzzleBin folder not found.")
end
--Show Color Code Script End
end,
})


---

local Tab = Window:CreateTab("Fun Customizer", "ferris-wheel") -- Updated Tab Name

local Button = Tab:CreateButton({
Name = "Give Spob a ':3' Face", -- Updated Name
Callback = function()
-- Get the player and their head
local player = game.Players.LocalPlayer
local head = player.Character.Head
-- Check if the player is in the "Bear" team
if player.Team.Name == "Bear" then
-- Check if the head has a decal
local decal = head:FindFirstChild("Decal")
if decal then
-- Change the decal's Texture ID
decal.Texture = "rbxassetid://109891608761602" --- rbxassetid://18371796935
print("Bear [Alpha] Hub!: Bear face changed to :3 ✔")
else
print("Bear [Alpha] Hub!: Decal not found on Bear's head.")
end
else
print("Bear [Alpha] Hub!: You must be the Bear to use this feature.")
end
end,
})

local Input = Tab:CreateInput({
Name = "Apply Custom Bear Image ID", -- Updated Name
CurrentValue = "9180622670",
PlaceholderText = "Input valid Image ID Here", -- Updated Placeholder
RemoveTextAfterFocusLost = true,
Flag = "InputCustomBearImage", -- Flag changed for uniqueness
Callback = function(Text1)
local Players = game:GetService("Players")
local Teams = game:GetService("Teams")
local CustomImageText = "rbxassetid://" .. Text1 -- Updated variable name
local bearTeam = Teams:FindFirstChild("Bear")
if bearTeam then
for _, player in Players:GetPlayers() do
if player.Team == bearTeam then
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
if humanoidRootPart then
-- Check for the existing BillboardGui
local billboardGui = humanoidRootPart:FindFirstChildOfClass("BillboardGui")
if billboardGui then
local idleImage = billboardGui:FindFirstChild("Idle")
local walk1Image = billboardGui:FindFirstChild("Walk1")
local walk2Image = billboardGui:FindFirstChild("Walk2")
if idleImage and walk1Image and walk2Image then
idleImage.Image = CustomImageText
walk1Image.Image = CustomImageText
walk2Image.Image = CustomImageText
print("Bear [Alpha] Hub!: Updated BillboardGui images for:", player.Name) -- Updated Print
else
print("Bear [Alpha] Hub!: Missing one or more ImageLabels in BillboardGui for:", player.Name) -- Updated Print
end
else
print("Bear [Alpha] Hub!: No BillboardGui found for:", player.Name) -- Updated Print
end

-- Check for the BillboardGui named "SkinGui"
local skinGui = humanoidRootPart:FindFirstChild("SkinGui")
if skinGui then
local idleImage = skinGui:FindFirstChild("Idle")
local walk1Image = skinGui:FindFirstChild("Walk1")
local walk2Image = skinGui:FindFirstChild("Walk2")
if idleImage and walk1Image and walk2Image then
idleImage.Image = CustomImageText
walk1Image.Image = CustomImageText
walk2Image.Image = CustomImageText
print("Bear [Alpha] Hub!: Updated SkinGui images for:", player.Name) -- Updated Print
else
print("Bear [Alpha] Hub!: Missing one or more ImageLabels in SkinGui for:", player.Name) -- Updated Print
end
else
print("Bear [Alpha] Hub!: No SkinGui found for:", player.Name) -- Updated Print
end
else
print("Bear [Alpha] Hub!: No HumanoidRootPart found for:", player.Name) -- Updated Print
end
end
end
else
print("Bear [Alpha] Hub!: Bear team not found") -- Updated Print
end
end,

})
-- Fun Tab End


---

local Tab = Window:CreateTab("Custom Songs", "music")

local Section = Tab:CreateSection("Custom Music Loader") -- Updated Section Name

local Label = Tab:CreateLabel("How to use: Go inside your exploit workspace folder and create a folder named 'Music' (Exactly like that or it wont work). Put your music files here.", "activity") -- Updated Label

local Label = Tab:CreateLabel("Do not forget to put the full music file name with extension! Example: song.mp3", "file") -- Updated Label

local Button = Tab:CreateButton({
Name = "Remove Ambient Reverb", -- Updated Name
Callback = function()
local SoundService = game:GetService("SoundService")
SoundService.AmbientReverb = Enum.ReverbType.NoReverb
print("Bear [Alpha] Hub!: Ambient Reverb Removed✔")
end,
})

local Button = Tab:CreateButton({
Name = "Add Default Ambient Reverb", -- Updated Name
Callback = function()
local SoundService = game:GetService("SoundService")
SoundService.AmbientReverb = Enum.ReverbType.Hangar
print("Bear [Alpha] Hub!: Ambient Reverb Added✔")
end,
})

local Button = Tab:CreateButton({
Name = "Mute Game Music [Temporary]", -- Updated Name
Callback = function()
local M = workspace.Music
M.SoundId = "rbxassetid://"
M.PlaybackSpeed = 1
M.TimePosition = 0
M.Playing = true
M.Looped = true
Rayfield:Notify({
Title = "Bear [Alpha] Hub!", -- Updated Title
Content = "Music Muted✔", -- Updated Content
Duration = 2, -- CHANGED: Duration set to 2
Image = "volume-off",
})
end,
})

local Slider = Tab:CreateSlider({
Name = "Music Volume", -- Updated Name
Range = {0, 2},
Increment = 0.1,
Suffix = "Volume",
CurrentValue = 1,
Flag = "SliderVolume", -- Flag changed for uniqueness
Callback = function(v)
local M = workspace.Music
M.Volume = v
end,
})

local Input = Tab:CreateInput({
Name = "Enter Song File Name",
PlaceholderText = "song.mp3/wav/ogg",
RemoveTextAfterFocus = false,
Callback = function(text)
local musicFolderPath = "Music"
-- Check if the "Music" folder exists
if not isfolder(musicFolderPath) then
warn("Folder not found: " .. musicFolderPath)
return
end
local fileName = text -- Get the filename from the TextBox
local filePath = musicFolderPath .. "/" .. fileName
-- Check if the file exists before playing
if isfile(filePath) then
sound.SoundId = getcustomasset(filePath) -- Set the SoundId to the custom asset
sound.Volume = 1
sound.TimePosition = 0
sound:Play() -- Play the sound
print("Bear [Alpha] Hub!: Playing custom song: " .. filePath)
Rayfield:Notify({
Title = "Bear [Alpha] Hub!",
Content = "Custom Music Loaded✔",
Duration = 2, -- CHANGED: Duration set to 2
Image = "music",
})
else
warn("File not found: " .. filePath)
end
end
})

local Section = Tab:CreateSection("Sound Effects (SFX) Settings") -- Updated Section Name

local Input = Tab:CreateInput({
Name = "Playback Speed (Input)", -- Updated Name
CurrentValue = "",
PlaceholderText = "1",
RemoveTextAfterFocusLost = false,
Flag = "InputPlaybackSpeed", -- Flag changed for uniqueness
Callback = function(Text)
local M = workspace.Music
M.PlaybackSpeed = Text
end,
})

local Slider = Tab:CreateSlider({
Name = "Playback Speed (Slider)", -- Updated Name
Range = {0, 12},
Increment = 0.01,
Suffix = "Amount",
CurrentValue = 1,
Flag = "SliderPlaybackSpeed", -- Flag changed for uniqueness
Callback = function(v)
local M = workspace.Music
M.PlaybackSpeed = v
end,
})

local Divider = Tab:CreateDivider()

local Section = Tab:CreateSection("Visualizers")

local Button = Tab:CreateButton({
Name = "Activate FOV Music Visualizer", -- Updated Name
Callback = function()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
-- Reference your sound instance in the workspace.
local sound = workspace:WaitForChild("Music")
-- Configuration variables
local BASE_FOV = 85 -- CHANGED: Default Field of View is now 85.
local MAX_EXTRA_FOV = 120 -- Maximum additional FOV.
local TWEEN_TIME = 0.1 -- Tween duration.
local SCALING_FACTOR = 35 -- Factor to scale bass value (adjust as needed).
-- Function to get a value representing bass
local function getBassValue()
local spectrumData
local success = pcall(function() spectrumData = sound:GetSpectrumData() end)
if not success or not spectrumData or #spectrumData == 0 then
-- Fallback to overall loudness if spectrum data is unavailable.
return sound.PlaybackLoudness
end
-- Use the first 20% of bins (bass frequencies)
local bassCount = math.max(1, math.floor(#spectrumData * 0.2))
local bassSum = 0
for i = 1, bassCount do
bassSum = bassSum + spectrumData[i]
end
local averageBass = bassSum / bassCount
return averageBass
end
-- Function to update the camera's FOV based on bass data.
local function updateCameraFOV()
local bassValue = getBassValue()
-- Calculate additional FOV based on the bass value.
local additionalFOV = math.clamp(bassValue / SCALING_FACTOR, 0, MAX_EXTRA_FOV)
local targetFOV = BASE_FOV + additionalFOV
local tween = TweenService:Create(
camera,
TweenInfo.new(TWEEN_TIME, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
{FieldOfView = targetFOV}
)
tween:Play()
end
-- Update every frame.
RunService.RenderStepped:Connect(function()
updateCameraFOV()
end)
print("Bear [Alpha] Hub!: FOV Visualizer Activated✔")
end,
})