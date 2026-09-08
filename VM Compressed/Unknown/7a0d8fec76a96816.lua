-- ==============================================================================
-- PJR CUSTOM MASTER PANEL HUB (PART 1 OF 2)
-- Copy and execute this piece first.
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("PJR_MasterPanelHub") then
	CoreGui.PJR_MasterPanelHub:Destroy()
end

if CoreGui:FindFirstChild("PJR_MinimizedWatermark") then
	CoreGui.PJR_MinimizedWatermark:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PJR_MasterPanelHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 340, 0, 440)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 10)
MainCorner.Parent = MainFrame

local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextSize = 15
TitleBar.Font = Enum.Font.GothamBold
TitleBar.Text = "  PJR Master Hub (Pt. 1)"
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 10)
TitleCorner.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.TextColor3 = Color3.fromRGB(220, 50, 50)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
	pcall(function()
		if CoreGui:FindFirstChild("PJR_MinimizedWatermark") then
			CoreGui.PJR_MinimizedWatermark:Destroy()
		end
	end)
end)

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Name = "ScrollingContainer"
ScrollingFrame.Size = UDim2.new(1, -20, 1, -120)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 48)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 360)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = ScrollingFrame

local function createButtonSection(layoutOrder, titleText, buttonText, buttonColor, callback)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, -10, 0, 75)
	container.BackgroundTransparency = 1
	container.LayoutOrder = layoutOrder
	container.Parent = ScrollingFrame
	
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 20)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(200, 200, 220)
	label.TextSize = 12
	label.Font = Enum.Font.GothamBold
	label.Text = titleText
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container
	
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 42)
	btn.Position = UDim2.new(0, 0, 0, 22)
	btn.BackgroundColor3 = buttonColor
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 13
	btn.Font = Enum.Font.GothamBold
	btn.Text = buttonText
	btn.Parent = container
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = btn
	
	btn.MouseButton1Click:Connect(callback)
end

-- ==============================================================================
-- BUTTON 1: gear slapped
-- ==============================================================================
createButtonSection(1, "gear slapped", "Load Custom Command Panel", Color3.fromRGB(50, 120, 220), function()
	pcall(function()
		local TextChatService = game:GetService("TextChatService")
		local LogService = game:GetService("LogService")
		local Debris = game:GetService("Debris")
		local Mouse = LocalPlayer:GetMouse()

		task.spawn(function()
			pcall(function()
				if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
					local bubbleConfig = TextChatService:FindFirstChild("BubbleChatConfiguration")
					if bubbleConfig then bubbleConfig.Enabled = false end
				else
					local ChatService = game:GetService("Chat")
					ChatService.BubbleChatEnabled = false
				end
			end)
		end)

		local panelGui = Instance.new("ScreenGui")
		panelGui.Name = "PJR_CustomAdminPanelGUI"
		panelGui.Parent = CoreGui
		panelGui.ResetOnSpawn = false

		local Container = Instance.new("Frame")
		Container.Name = "CustomAdminPanel"
		Container.Parent = panelGui
		Container.BackgroundColor3 = Color3.fromRGB(12, 12, 14)
		Container.Position = UDim2.new(0.05, 0, 0.1, 0)
		Container.Size = UDim2.new(0.3, 0, 0.75, 0)
		Container.Active = true
		Container.Draggable = true 
		Container.BorderSizePixel = 0

		local ContainerCorner = Instance.new("UICorner")
		ContainerCorner.CornerRadius = UDim.new(0, 10)
		ContainerCorner.Parent = Container

		local ContainerStroke = Instance.new("UIStroke")
		ContainerStroke.Color = Color3.fromRGB(45, 45, 55)
		ContainerStroke.Thickness = 2
		ContainerStroke.Parent = Container

		local TopLabel = Instance.new("TextButton")
		TopLabel.Name = "DragHandle"
		TopLabel.Parent = Container
		TopLabel.Size = UDim2.new(1, 0, 0.08, 0)
		TopLabel.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
		TopLabel.Text = "⚡ HOLD & DRAG PANEL ⚡"
		TopLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		TopLabel.Font = Enum.Font.SourceSansBold
		TopLabel.TextSize = 15
		TopLabel.AutoButtonColor = false

		local TopCorner = Instance.new("UICorner")
		TopCorner.CornerRadius = UDim.new(0, 10)
		TopCorner.Parent = TopLabel

		local ScrollFrame = Instance.new("ScrollingFrame")
		ScrollFrame.Parent = Container
		ScrollFrame.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
		ScrollFrame.Position = UDim2.new(0, 0, 0.09, 0)
		ScrollFrame.Size = UDim2.new(1, 0, 0.91, 0)
		ScrollFrame.CanvasSize = UDim2.new(0, 0, 3.4, 0) 
		ScrollFrame.ScrollBarThickness = 6
		ScrollFrame.BorderSizePixel = 0

		local UIListLayout = Instance.new("UIListLayout")
		UIListLayout.Parent = ScrollFrame
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 6)
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center

		local MaximizeBtn = Instance.new("TextButton")
		MaximizeBtn.Parent = Container
		MaximizeBtn.Size = UDim2.new(1, 0, 1, 0)
		MaximizeBtn.Visible = false
		MaximizeBtn.Text = "➕ OPEN PANEL"
		MaximizeBtn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		MaximizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		MaximizeBtn.Font = Enum.Font.SourceSansBold
		MaximizeBtn.TextSize = 18
		local MaxCorner = Instance.new("UICorner")
		MaxCorner.CornerRadius = UDim.new(0, 10)
		MaxCorner.Parent = MaximizeBtn

		local activeLoops = { explode = false, fly = false, ff = false, fling = false, sword = false }
		local antiAdminActive = false
		local antiFlingActive = false
		local gunSystemActive = false

		local function sendChatMessage(text)
			pcall(function()
				if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
					local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
					if channel then channel:SendAsync(text) end
				else
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(text, "All")
				end
			end)
		end

		local function createInnerButton(text, color, onClick)
			local btn = Instance.new("TextButton")
			btn.Parent = ScrollFrame
			btn.Size = UDim2.new(0.92, 0, 0.052, 0)
			btn.BackgroundColor3 = color
			btn.Font = Enum.Font.SourceSansBold
			btn.Text = text
			btn.TextColor3 = Color3.fromRGB(255, 255, 255)
			btn.TextSize = 14.00
			btn.BorderSizePixel = 0
			
			local btnCorner = Instance.new("UICorner")
			btnCorner.CornerRadius = UDim.new(0, 6)
			btnCorner.Parent = btn
			
			btn.MouseButton1Click:Connect(onClick)
			return btn
		end

		local function runCommandLoop(commandPrefix, loopKey, buttonObj, originalText)
			if activeLoops[loopKey] then
				activeLoops[loopKey] = false
				buttonObj.Text = originalText
				buttonObj.BackgroundColor3 = Color3.fromRGB(45, 45, 50)
				return
			end

			activeLoops[loopKey] = true
			buttonObj.Text = "🛑 STOP " .. commandPrefix:upper()
			buttonObj.BackgroundColor3 = Color3.fromRGB(200, 30, 30)

			task.spawn(function()
				while activeLoops[loopKey] do
					local currentPlayers = Players:GetPlayers()
					local executedAny = false
					for i = 1, #currentPlayers do
						if not activeLoops[loopKey] then break end
						local targetPlayer = currentPlayers[i]
						if targetPlayer ~= LocalPlayer then
							sendChatMessage(commandPrefix .. " " .. targetPlayer.Name)
							executedAny = true
							task.wait(1.0)
						end
					end
					if not executedAny then task.wait(1.0) end
				end
			end)
		end

		local b1 = createInnerButton("💥 CYCLE: ;EXPLODE [USER]", Color3.fromRGB(35, 35, 40), function() end)
		b1.MouseButton1Click:Connect(function() runCommandLoop(";explode", "explode", b1, "💥 CYCLE: ;EXPLODE [USER]") end)

		local b2 = createInnerButton("✈️ CYCLE: ;FLY [USER]", Color3.fromRGB(35, 35, 40), function() end)
		b2.MouseButton1Click:Connect(function() runCommandLoop(";fly", "fly", b2, "✈️ CYCLE: ;FLY [USER]") end)

		local b3 = createInnerButton("🛡️ CYCLE: ;FORCEFIELD [USER]", Color3.fromRGB(35, 35, 40), function() end)
		b3.MouseButton1Click:Connect(function() runCommandLoop(";forcefield", "ff", b3, "🛡️ CYCLE: ;FORCEFIELD [USER]") end)

		local b4 = createInnerButton("🌀 CYCLE: ;FLING [USER]", Color3.fromRGB(35, 35, 40), function() end)
		b4.MouseButton1Click:Connect(function() runCommandLoop(";fling", "fling", b4, "🌀 CYCLE: ;FLING [USER]") end)

		local b5 = createInnerButton("⚔️ CYCLE: ;GIVE SWORD [USER]", Color3.fromRGB(35, 35, 40), function() end)
		b5.MouseButton1Click:Connect(function() runCommandLoop(";give sword", "sword", b5, "⚔️ CYCLE: ;GIVE SWORD [USER]") end)

		createInnerButton("💥 GLOBAL: ;EXPLODE", Color3.fromRGB(160, 70, 10), function() sendChatMessage(";explode") end)
		createInnerButton("✈️ GLOBAL: ;FLY", Color3.fromRGB(160, 70, 10), function() sendChatMessage(";fly") end)
		createInnerButton("🛡️ GLOBAL: ;FORCEFIELD", Color3.fromRGB(160, 70, 10), function() sendChatMessage(";forcefield") end)
		createInnerButton("🌀 GLOBAL: ;FLING", Color3.fromRGB(160, 70, 10), function() sendChatMessage(";fling") end)
		createInnerButton("⚔️ GLOBAL: ;SWORD", Color3.fromRGB(160, 70, 10), function() sendChatMessage(";sword") end)

		createInnerButton("👑 EXECUTE: MOD GAMEPASS", Color3.fromRGB(0, 100, 220), function()
			pcall(function()
				local args = { "buyAdmin", "Mod", 0 }
				game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("mapManagerRemote"):FireServer(unpack(args))
			end)
		end)

		createInnerButton("🩸 EXECUTE: KILL ALL SWORD", Color3.fromRGB(220, 0, 80), function()
			pcall(function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Rawbr10/test/refs/heads/main/Kill%20All%20Script%20Universal"))()
			end)
		end)

		local GunBtn = createInnerButton("🔫 EQUIP: AK-47 HIT LOG", Color3.fromRGB(10, 130, 80), function() end)
		GunBtn.MouseButton1Click:Connect(function()
			if gunSystemActive then
				gunSystemActive = false
				GunBtn.Text = "🔫 EQUIP: AK-47 HIT LOG"
				GunBtn.BackgroundColor3 = Color3.fromRGB(10, 130, 80)
				pcall(function()
					local existingGun = LocalPlayer.Backpack:FindFirstChild("AK-47") or (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("AK-47"))
					if existingGun then existingGun:Destroy() end
				end)
				return
			end

			gunSystemActive = true
			GunBtn.Text = "🛑 UN-EQUIP GUN ENGINE"
			GunBtn.BackgroundColor3 = Color3.fromRGB(180, 25, 25)

			local CustomAk = Instance.new("Tool")
			CustomAk.Name = "AK-47"
			CustomAk.RequiresHandle = true
			
			local Handle = Instance.new("Part")
			Handle.Name = "Handle"
			Handle.Size = Vector3.new(0.2, 0.2, 0.2)
			Handle.Transparency = 1 
			Handle.CanCollide = false
			Handle.Parent = CustomAk

			CustomAk.Parent = LocalPlayer:WaitForChild("Backpack")
			if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
				LocalPlayer.Character.Humanoid:EquipTool(CustomAk)
			end

			CustomAk.Activated:Connect(function()
				if not gunSystemActive then return end
				local mousePos = Mouse.Hit.p
				local char = LocalPlayer.Character
				if not char or not char:FindFirstChild("HumanoidRootPart") then return end
				
				local startPos = char.HumanoidRootPart.Position
				local raycastParams = RaycastParams.new()
				raycastParams.FilterDescendantsInstances = {char}
				raycastParams.FilterType = Enum.RaycastFilterType.Exclude
				local rayResult = workspace:Raycast(startPos, (mousePos - startPos).Unit * 600, raycastParams)

				local targetPlayer = nil
				if rayResult and rayResult.Instance then
					local hitModel = rayResult.Instance:FindFirstAncestorOfClass("Model")
					if hitModel then targetPlayer = Players:GetPlayerFromCharacter(hitModel) end
				end

				if targetPlayer and targetPlayer ~= LocalPlayer then
					task.spawn(function()
						task.wait(1.5)
						sendChatMessage(";explode " .. targetPlayer.Name)
						task.wait(0.5)
						if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
						if not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then return end
						
						local originPoint = LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0.5, 0)
						local endPoint = targetPlayer.Character.HumanoidRootPart.Position
						local currentDir = (endPoint - originPoint).Unit

						local Bullet = Instance.new("Part")
						Bullet.Name = "VisualBullet"
						Bullet.Size = Vector3.new(0.15, 0.15, 1.2)
						Bullet.Color = Color3.fromRGB(255, 215, 0)
						Bullet.Material = Enum.Material.Neon
						Bullet.CanCollide = false
						Bullet.Anchored = true
						Bullet.CFrame = CFrame.new(originPoint, endPoint)
						Bullet.Parent = workspace

						local distance = (endPoint - originPoint).Magnitude
						local travelTime = distance / 550
						local tween = game:GetService("TweenService"):Create(Bullet, TweenInfo.new(travelTime, Enum.EasingStyle.Linear), {
							CFrame = CFrame.new(endPoint, endPoint + currentDir)
						})
						tween:Play()
						Debris:AddItem(Bullet, travelTime + 0.02)
					end)
				end
			end)
		end)

		local AntiAdminBtn = createInnerButton("🛡️ ANTI-ADMIN COMMANDS: OFF", Color3.fromRGB(10, 70, 130), function() end)
		AntiAdminBtn.MouseButton1Click:Connect(function()
			antiAdminActive = not antiAdminActive
			if antiAdminActive then
				AntiAdminBtn.Text = "🛡️ ANTI-ADMIN COMMANDS: ON"
				AntiAdminBtn.BackgroundColor3 = Color3.fromRGB(10, 150, 90)
			else
				AntiAdminBtn.Text = "🛡️ ANTI-ADMIN COMMANDS: OFF"
				AntiAdminBtn.BackgroundColor3 = Color3.fromRGB(10, 70, 130)
			end
		end)

		local AntiFlingBtn = createInnerButton("🌀 ANTI-FLING/SHIELD: OFF", Color3.fromRGB(90, 10, 110), function() end)
		AntiFlingBtn.MouseButton1Click:Connect(function()
			antiFlingActive = not antiFlingActive
			if antiFlingActive then
				AntiFlingBtn.Text = "🌀 ANTI-FLING/SHIELD: ON"
				AntiFlingBtn.BackgroundColor3 = Color3.fromRGB(10, 150, 90)
			else
				AntiFlingBtn.Text = "🌀 ANTI-FLING/SHIELD: OFF"
				AntiFlingBtn.BackgroundColor3 = Color3.fromRGB(90, 10, 110)
			end
		end)

		local function checkCommandLog(message)
			if not antiAdminActive then return end
			local lowerMsg = message:lower()
			local myName = LocalPlayer.Name:lower()
			if (lowerMsg:find(";kill") or lowerMsg:find(";explode") or lowerMsg:find(";fling") or lowerMsg:find(";punish")) and lowerMsg:find(myName) then
				local char = LocalPlayer.Character
				if char then
					for _, part in pairs(char:GetDescendants()) do
						if part:IsA("Weld") or part:IsA("MoverConstraint") or part:IsA("BodyVelocity") then part:Destroy() end
					end
				end
			end
		end
		LogService.MessageOut:Connect(function(m) checkCommandLog(m) end)
		TextChatService.MessageReceived:Connect(function(t) checkCommandLog(t.Text) end)

		task.spawn(function()
			while true do
				task.wait(0.1)
				if antiFlingActive and LocalPlayer.Character then
					for _, p in pairs(Players:GetPlayers()) do
						if p ~= LocalPlayer and p.Character then
							for _, part in pairs(p.Character:GetDescendants()) do
								if part:IsA("BasePart") then part.CanCollide = false end
							end
						end
					end
				end
			end
		end)

		createInnerButton("🔽 MINIMIZE PANEL", Color3.fromRGB(20, 20, 25), function()
			ScrollFrame.Visible = false
			TopLabel.Visible = false
			Container.Size = UDim2.new(0.18, 0, 0.08, 0)
			MaximizeBtn.Visible = true
		end)

		MaximizeBtn.MouseButton1Click:Connect(function()
			MaximizeBtn.Visible = false
			ScrollFrame.Visible = true
			TopLabel.Visible = true
			Container.Size = UDim2.new(0.3, 0, 0.75, 0)
		end)

		local CreditLabel = Instance.new("TextLabel")
		CreditLabel.Parent = ScrollFrame
		CreditLabel.Size = UDim2.new(0.95, 0, 0.04, 0)
		CreditLabel.BackgroundTransparency = 1
		CreditLabel.Text = "made by PJR☑️"
		CreditLabel.TextColor3 = Color3.fromRGB(150, 150, 160)
		CreditLabel.Font = Enum.Font.SourceSansBold
		CreditLabel.TextSize = 16.00
	end)
end)

-- ==============================================================================
-- BUTTON 2: infinite range for TSB
-- ==============================================================================
createButtonSection(2, "infinite range for TSB", "Load Hitbox Expander", Color3.fromRGB(50, 160, 120), function()
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/HitboxExpander/refs/heads/main/Release"))()
	end)
end)

print("PJR Master Hub Part 1 Loaded Successfully.")
-- ==============================================================================
-- PJR CUSTOM MASTER PANEL HUB (PART 2 OF 2)
-- Copy and execute this piece right after Part 1.
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = CoreGui:WaitForChild("PJR_MasterPanelHub", 5)
if not ScreenGui then
	warn("PJR_MasterPanelHub not found! Please run Part 1 first.")
	return
end

local MainFrame = ScreenGui:WaitForChild("MainFrame")
local ScrollingFrame = MainFrame:WaitForChild("ScrollingContainer")

local function createButtonSection(layoutOrder, titleText, buttonText, buttonColor, callback)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, -10, 0, 75)
	container.BackgroundTransparency = 1
	container.LayoutOrder = layoutOrder
	container.Parent = ScrollingFrame
	
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 20)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(200, 200, 220)
	label.TextSize = 12
	label.Font = Enum.Font.GothamBold
	label.Text = titleText
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container
	
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 42)
	btn.Position = UDim2.new(0, 0, 0, 22)
	btn.BackgroundColor3 = buttonColor
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 13
	btn.Font = Enum.Font.GothamBold
	btn.Text = buttonText
	btn.Parent = container
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = btn
	
	btn.MouseButton1Click:Connect(callback)
end

-- ==============================================================================
-- BUTTON 3: Wall combo? anyone in anywhere in TSB
-- ==============================================================================
createButtonSection(3, "Wall combo? anyone in anywhere in TSB", "Load Targeter Script", Color3.fromRGB(180, 120, 40), function()
	pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Okaygotenitsme/Pokorenie-nebes-Hub/refs/heads/main/WallComboAnywhere.lua"))()
	end)
end)

-- ==============================================================================
-- BUTTON 4: troll friends 😂 (Opens Panel with its own Exact Code)
-- ==============================================================================
local button4ExactCode = [[-- ==============================================================================
-- TROLL SCRIPT PANEL (EXACT CODE FOR BUTTON 4)
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

if CoreGui:FindFirstChild("PJR_CommandListGui") then
	CoreGui.PJR_CommandListGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PJR_CommandListGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 500, 0, 400)
MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local TitleBar = Instance.new("TextLabel")
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
TitleBar.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleBar.TextSize = 16
TitleBar.Font = Enum.Font.GothamBold
TitleBar.Text = "  Full Command Suite Reference (; = Prefix)"
TitleBar.TextXAlignment = Enum.TextXAlignment.Left
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 40, 0, 40)
CloseButton.Position = UDim2.new(1, -40, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.TextColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.TextSize = 18
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "X"
CloseButton.Parent = TitleBar

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

local ScrollingFrame = Instance.new("ScrollingFrame")
ScrollingFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollingFrame.Position = UDim2.new(0, 10, 0, 50)
ScrollingFrame.BackgroundTransparency = 1
ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 1100)
ScrollingFrame.ScrollBarThickness = 6
ScrollingFrame.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = ScrollingFrame

local commandsData = {
	{cmd = ";kill [name]", desc = "Instantly kills the target player."},
	{cmd = ";killall", desc = "Kills all players / triggers server kill."},
	{cmd = ";jail [name]", desc = "Locks the target player inside a persistent jail box."},
	{cmd = ";unjail [name]", desc = "Releases the target player from the jail box."},
	{cmd = ";speed [name] [val]", desc = "Sets custom walk speed for the target."},
	{cmd = ";slow [name]", desc = "Slows down target player walk speed."},
	{cmd = ";unspeed [name]", desc = "Resets target player speed back to normal (16)."},
	{cmd = ";spin [name]", desc = "Makes the target player spin around continuously."},
	{cmd = ";unspin [name]", desc = "Stops the target player from spinning."},
	{cmd = ";freeze [name]", desc = "Anchors and freezes the target player in place."},
	{cmd = ";thaw [name]", desc = "Unfreezes the target player."},
	{cmd = ";jump [name]", desc = "Forces the target player to jump."},
	{cmd = ";fling [name]", desc = "Sends the target player flying across the map."},
	{cmd = ";sit [name]", desc = "Forces the target player into a sitting animation."},
	{cmd = ";cleartools [name]", desc = "Deletes all tools currently in target's inventory."},
	{cmd = ";blind [name]", desc = "Blinds the target player with a black screen overlay."},
	{cmd = ";unblind [name]", desc = "Removes the blind screen effect."},
	{cmd = ";kick [name]", desc = "Kicks the target player out of the game session."},
	{cmd = ";ban [name]", desc = "Bans and kicks the target player permanently from session."},
	{cmd = ";rejoin [name]", desc = "Forces the target player to rejoin the experience."},
	{cmd = ";respawn [name]", desc = "Respawns or refreshes the target player's character."},
	{cmd = ";god [name]", desc = "Gives the target player infinite health/godmode."},
	{cmd = ";ungod [name]", desc = "Removes godmode from the target player."},
	{cmd = ";invis [name]", desc = "Makes the target player's character fully invisible."},
	{cmd = ";vis [name]", desc = "Makes the target player's character visible again."}
}

for i, data in ipairs(commandsData) do
	local itemBox = Instance.new("Frame")
	itemBox.Size = UDim2.new(1, -10, 0, 45)
	itemBox.BackgroundColor3 = Color3.fromRGB(40, 40, 50)
	itemBox.BorderSizePixel = 0
	itemBox.Parent = ScrollingFrame
	
	local boxCorner = Instance.new("UICorner")
	boxCorner.CornerRadius = UDim.new(0, 6)
	boxCorner.Parent = itemBox
	
	local cmdLabel = Instance.new("TextLabel")
	cmdLabel.Size = UDim2.new(0, 190, 1, 0)
	cmdLabel.Position = UDim2.new(0, 10, 0, 0)
	cmdLabel.BackgroundTransparency = 1
	cmdLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
	cmdLabel.TextSize = 13
	cmdLabel.Font = Enum.Font.Code
	cmdLabel.Text = data.cmd
	cmdLabel.TextXAlignment = Enum.TextXAlignment.Left
	cmdLabel.Parent = itemBox
	
	local descLabel = Instance.new("TextLabel")
	descLabel.Size = UDim2.new(1, -210, 1, 0)
	descLabel.Position = UDim2.new(0, 200, 0, 0)
	descLabel.BackgroundTransparency = 1
	descLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
	descLabel.TextSize = 13
	descLabel.Font = Enum.Font.Gotham
	descLabel.Text = data.desc
	descLabel.TextXAlignment = Enum.TextXAlignment.Left
	descLabel.TextWrapped = true
	descLabel.Parent = itemBox
end

print("Troll Script Panel Loaded Successfully.")]]

createButtonSection(4, "troll friends 😂", "Copy Troll Script (Command Suite)", Color3.fromRGB(180, 50, 120), function()
	pcall(function()
		if setclipboard then
			setclipboard(button4ExactCode)
		end
	end)
	
	if CoreGui:FindFirstChild("PJR_CodeViewerModal") then
		CoreGui.PJR_CodeViewerModal:Destroy()
	end
	
	local modalGui = Instance.new("ScreenGui")
	modalGui.Name = "PJR_CodeViewerModal"
	modalGui.ResetOnSpawn = false
	modalGui.Parent = CoreGui
	
	local modalFrame = Instance.new("Frame")
	modalFrame.Size = UDim2.new(0, 450, 0, 360)
	modalFrame.Position = UDim2.new(0.5, -225, 0.5, -180)
	modalFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
	modalFrame.BorderSizePixel = 0
	modalFrame.Active = true
	modalFrame.Draggable = true
	modalFrame.Parent = modalGui
	
	local modalCorner = Instance.new("UICorner")
	modalCorner.CornerRadius = UDim.new(0, 8)
	modalCorner.Parent = modalFrame
	
	local modalTitle = Instance.new("TextLabel")
	modalTitle.Size = UDim2.new(1, 0, 0, 40)
	modalTitle.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
	modalTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
	modalTitle.TextSize = 14
	modalTitle.Font = Enum.Font.GothamBold
	modalTitle.Text = "  Troll Script Copied & Code Preview"
	modalTitle.TextXAlignment = Enum.TextXAlignment.Left
	modalTitle.Parent = modalFrame
	
	local topCopyBtn = Instance.new("TextButton")
	topCopyBtn.Size = UDim2.new(0, 130, 0, 28)
	topCopyBtn.Position = UDim2.new(1, -140, 0, 6)
	topCopyBtn.BackgroundColor3 = Color3.fromRGB(50, 160, 100)
	topCopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	topCopyBtn.TextSize = 12
	topCopyBtn.Font = Enum.Font.GothamBold
	topCopyBtn.Text = "📋 Copy Code"
	topCopyBtn.Parent = modalTitle
	
	local topCopyCorner = Instance.new("UICorner")
	topCopyCorner.CornerRadius = UDim.new(0, 6)
	topCopyCorner.Parent = topCopyBtn
	
	topCopyBtn.MouseButton1Click:Connect(function()
		pcall(function()
			if setclipboard then
				setclipboard(button4ExactCode)
			end
		end)
		topCopyBtn.Text = "✅ Copied!"
		task.delay(1.5, function()
			topCopyBtn.Text = "📋 Copy Code"
		end)
	end)
	
	local textBox = Instance.new("TextBox")
	textBox.Size = UDim2.new(1, -20, 1, -100)
	textBox.Position = UDim2.new(0, 10, 0, 50)
	textBox.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
	textBox.TextColor3 = Color3.fromRGB(200, 220, 255)
	textBox.TextSize = 12
	textBox.Font = Enum.Font.Code
	textBox.MultiLine = true
	textBox.ClearTextOnFocus = false
	textBox.TextXAlignment = Enum.TextXAlignment.Left
	textBox.TextYAlignment = Enum.TextYAlignment.Top
	textBox.Text = button4ExactCode
	textBox.Parent = modalFrame
	
	local okBtn = Instance.new("TextButton")
	okBtn.Size = UDim2.new(1, -20, 0, 35)
	okBtn.Position = UDim2.new(0, 10, 1, -45)
	okBtn.BackgroundColor3 = Color3.fromRGB(50, 120, 220)
	okBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
	okBtn.TextSize = 14
	okBtn.Font = Enum.Font.GothamBold
	okBtn.Text = "Close Window"
	okBtn.Parent = modalFrame
	
	local okCorner = Instance.new("UICorner")
	okCorner.CornerRadius = UDim.new(0, 6)
	okCorner.Parent = okBtn
	
	okBtn.MouseButton1Click:Connect(function()
		modalGui:Destroy()
	end)
end)

-- ==============================================================================
-- FOOTER AREA: Watermark & Minimize Button
-- ==============================================================================
local FooterContainer = Instance.new("Frame")
FooterContainer.Size = UDim2.new(1, -20, 0, 60)
FooterContainer.Position = UDim2.new(0, 10, 1, -65)
FooterContainer.BackgroundTransparency = 1
FooterContainer.Parent = MainFrame

local WatermarkLabel = Instance.new("TextLabel")
WatermarkLabel.Size = UDim2.new(1, 0, 0, 20)
WatermarkLabel.BackgroundTransparency = 1
WatermarkLabel.TextColor3 = Color3.fromRGB(150, 150, 170)
WatermarkLabel.TextSize = 12
WatermarkLabel.Font = Enum.Font.GothamBold
WatermarkLabel.Text = "Made by PJR ☑️ (Fully Loaded)"
WatermarkLabel.TextXAlignment = Enum.TextXAlignment.Center
WatermarkLabel.Parent = FooterContainer

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(1, 0, 0, 32)
MinimizeButton.Position = UDim2.new(0, 0, 0, 22)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.TextSize = 12
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.Text = "Minimize Hub 🗕"
MinimizeButton.Parent = FooterContainer

local MinBtnCorner = Instance.new("UICorner")
MinBtnCorner.CornerRadius = UDim.new(0, 6)
MinBtnCorner.Parent = MinimizeButton

MinimizeButton.MouseButton1Click:Connect(function()
	MainFrame.Visible = false
	
	if CoreGui:FindFirstChild("PJR_MinimizedWatermark") then
		CoreGui.PJR_MinimizedWatermark:Destroy()
	end
	
	local miniGui = Instance.new("ScreenGui")
	miniGui.Name = "PJR_MinimizedWatermark"
	miniGui.ResetOnSpawn = false
	miniGui.Parent = CoreGui
	
	local miniFrame = Instance.new("TextButton")
	miniFrame.Size = UDim2.new(0, 160, 0, 38)
	miniFrame.Position = UDim2.new(0, 20, 0, 20)
	miniFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 38)
	miniFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
	miniFrame.TextSize = 12
	miniFrame.Font = Enum.Font.GothamBold
	miniFrame.Text = "Made by PJR ☑️"
	miniFrame.Active = true
	miniFrame.Draggable = true
	miniFrame.Parent = miniGui
	
	local miniCorner = Instance.new("UICorner")
	miniCorner.CornerRadius = UDim.new(0, 8)
	miniCorner.Parent = miniFrame
	
	miniFrame.MouseButton1Click:Connect(function()
		miniGui:Destroy()
		MainFrame.Visible = true
	end)
end)

print("PJR Master Hub Part 2 Loaded Successfully.")
-- ==============================================================================
-- PJR CUSTOM MASTER PANEL HUB (PART 3 OF 2)
-- Copy and execute this piece right after Part 2.
-- ==============================================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = CoreGui:WaitForChild("PJR_MasterPanelHub", 5)
if not ScreenGui then
	warn("PJR_MasterPanelHub not found! Please run Part 1 and Part 2 first.")
	return
end

local MainFrame = ScreenGui:WaitForChild("MainFrame")
local ScrollingFrame = MainFrame:WaitForChild("ScrollingContainer")

local function createButtonSection(layoutOrder, titleText, buttonText, buttonColor, callback)
	local container = Instance.new("Frame")
	container.Size = UDim2.new(1, -10, 0, 75)
	container.BackgroundTransparency = 1
	container.LayoutOrder = layoutOrder
	container.Parent = ScrollingFrame
	
	local label = Instance.new("TextLabel")
	label.Size = UDim2.new(1, 0, 0, 20)
	label.BackgroundTransparency = 1
	label.TextColor3 = Color3.fromRGB(200, 200, 220)
	label.TextSize = 12
	label.Font = Enum.Font.GothamBold
	label.Text = titleText
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.Parent = container
	
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 42)
	btn.Position = UDim2.new(0, 0, 0, 22)
	btn.BackgroundColor3 = buttonColor
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 13
	btn.Font = Enum.Font.GothamBold
	btn.Text = buttonText
	btn.Parent = container
	
	local btnCorner = Instance.new("UICorner")
	btnCorner.CornerRadius = UDim.new(0, 6)
	btnCorner.Parent = btn
	
	btn.MouseButton1Click:Connect(callback)
end

-- ==============================================================================
-- BUTTON 5: touch fling
-- ==============================================================================
createButtonSection(5, "touch fling", "Load Touch Fling Script", Color3.fromRGB(160, 50, 50), function()
	pcall(function()
		loadstring(game:HttpGet("https://pastebin.com/raw/LgZwZ7ZB", true))()
	end)
end)

print("PJR Master Hub Part 3 Loaded Successfully.")
