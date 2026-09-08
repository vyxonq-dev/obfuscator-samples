-- Ultimate Sephirre Hub v4
-- Key: glibglobglabber

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

--------------------------------------------------
-- GUI ROOT
--------------------------------------------------
local gui = Instance.new("ScreenGui")
gui.Name = "UltimateSephirreHubV4"
gui.Parent = game.CoreGui
gui.ResetOnSpawn = false

--------------------------------------------------
-- KEY GUI
--------------------------------------------------
local keyFrame = Instance.new("Frame", gui)
keyFrame.Size = UDim2.fromScale(0.8,0.35)
keyFrame.Position = UDim2.fromScale(0.1,0.33)
keyFrame.BackgroundColor3 = Color3.fromRGB(25,25,25)
keyFrame.Active = true
keyFrame.Draggable = true
Instance.new("UICorner", keyFrame)

local keyTitle = Instance.new("TextLabel", keyFrame)
keyTitle.Size = UDim2.new(1,0,0.3,0)
keyTitle.BackgroundTransparency = 1
keyTitle.Text = "Ultimate Sephirre Hub v4"
keyTitle.Font = Enum.Font.GothamBold
keyTitle.TextScaled = true
keyTitle.TextColor3 = Color3.fromRGB(0,170,255)

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.fromScale(0.9,0.25)
keyBox.Position = UDim2.fromScale(0.05,0.4)
keyBox.PlaceholderText = "Enter Key"
keyBox.Text = ""
keyBox.TextScaled = true
keyBox.Font = Enum.Font.Gotham
keyBox.BackgroundColor3 = Color3.fromRGB(40,40,40)
keyBox.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", keyBox)

local unlock = Instance.new("TextButton", keyFrame)
unlock.Size = UDim2.fromScale(0.6,0.2)
unlock.Position = UDim2.fromScale(0.2,0.7)
unlock.Text = "UNLOCK"
unlock.Font = Enum.Font.GothamBold
unlock.TextScaled = true
unlock.BackgroundColor3 = Color3.fromRGB(0,170,255)
unlock.TextColor3 = Color3.new(0,0,0)
Instance.new("UICorner", unlock)

--------------------------------------------------
-- HUB CREATION
--------------------------------------------------
local function createHub()
	keyFrame:Destroy()

	--------------------------------------------------
	-- MAIN FRAME
	--------------------------------------------------
	local main = Instance.new("Frame", gui)
	main.Size = UDim2.fromScale(0.9,0.85)
	main.Position = UDim2.fromScale(0.05,1)
	main.BackgroundColor3 = Color3.fromRGB(20,20,20)
	main.Active = true
	main.Draggable = true
	Instance.new("UICorner", main)

	-- OPEN ANIMATION
	TweenService:Create(
		main,
		TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{Position = UDim2.fromScale(0.05,0.075)}
	):Play()

	--------------------------------------------------
	-- TOP BUTTONS
	--------------------------------------------------
	local close = Instance.new("TextButton", main)
	close.Size = UDim2.fromScale(0.08,0.07)
	close.Position = UDim2.fromScale(0.9,0.01)
	close.Text = "X"
	close.TextScaled = true
	close.TextColor3 = Color3.new(1,0,0)
	close.BackgroundTransparency = 1

	local del = Instance.new("TextButton", main)
	del.Size = UDim2.fromScale(0.08,0.07)
	del.Position = UDim2.fromScale(0.82,0.01)
	del.Text = "D"
	del.TextScaled = true
	del.TextColor3 = Color3.new(1,0,0)
	del.BackgroundTransparency = 1

	--------------------------------------------------
	-- FLOATING ICON
	--------------------------------------------------
	local icon = Instance.new("TextButton", gui)
	icon.Size = UDim2.fromScale(0.07,0.1)
	icon.Position = UDim2.fromScale(0.02,0.5)
	icon.Text = "↻"
	icon.TextScaled = true
	icon.TextColor3 = Color3.fromRGB(0,170,255)
	icon.BackgroundColor3 = Color3.fromRGB(20,20,20)
	icon.Visible = false
	icon.Active = true
	icon.Draggable = true
	Instance.new("UICorner", icon)

	close.MouseButton1Click:Connect(function()
		TweenService:Create(
			main,
			TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
			{Position = UDim2.fromScale(0.05,1)}
		):Play()
		task.wait(0.35)
		main.Visible = false
		icon.Visible = true
	end)

	icon.MouseButton1Click:Connect(function()
		main.Visible = true
		TweenService:Create(
			main,
			TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
			{Position = UDim2.fromScale(0.05,0.075)}
		):Play()
		icon.Visible = false
	end)

	del.MouseButton1Click:Connect(function()
		gui:Destroy()
	end)

	--------------------------------------------------
	-- TABS (LEFT SIDE)
	--------------------------------------------------
	local tabFrame = Instance.new("Frame", main)
	tabFrame.Size = UDim2.fromScale(0.25,0.85)
	tabFrame.Position = UDim2.fromScale(0,0.1)
	tabFrame.BackgroundTransparency = 1

	local content = Instance.new("Frame", main)
	content.Size = UDim2.fromScale(0.7,0.8)
	content.Position = UDim2.fromScale(0.28,0.15)
	content.BackgroundTransparency = 1

	local pages = {}

	local function makeTab(name,order)
		local b = Instance.new("TextButton", tabFrame)
		b.Size = UDim2.fromScale(0.95,0.12)
		b.Position = UDim2.fromScale(0.025,0.02 + (order-1)*0.14)
		b.Text = name
		b.TextScaled = true
		b.Font = Enum.Font.Gotham
		b.BackgroundColor3 = Color3.fromRGB(45,45,45)
		b.TextColor3 = Color3.new(1,1,1)
		Instance.new("UICorner", b)

		local p = Instance.new("Frame", content)
		p.Size = UDim2.fromScale(1,1)
		p.BackgroundTransparency = 1
		p.Visible = false
		pages[name] = p

		b.MouseButton1Click:Connect(function()
			for _,v in pairs(pages) do v.Visible = false end
			p.Visible = true
		end)
	end

	makeTab("Universal",1)
	makeTab("Other Hubs",2)
	makeTab("Item Giver",3)
	makeTab("Misc",4)

	pages["Universal"].Visible = true

	--------------------------------------------------
	-- BUTTON HELPER
	--------------------------------------------------
	local function button(parent,text,y,func)
		local b = Instance.new("TextButton", parent)
		b.Size = UDim2.fromScale(0.7,0.12)
		b.Position = UDim2.fromScale(0.15,y)
		b.Text = text
		b.TextScaled = true
		b.Font = Enum.Font.Gotham
		b.BackgroundColor3 = Color3.fromRGB(50,50,50)
		b.TextColor3 = Color3.new(1,1,1)
		Instance.new("UICorner", b)
		b.MouseButton1Click:Connect(func)
	end

	--------------------------------------------------
	-- UNIVERSAL TAB
	--------------------------------------------------
	local infJump = false

	button(pages["Universal"],"Infinite Jump",0.05,function()
		infJump = not infJump
	end)

	local function bindJump(char)
		local hum = char:WaitForChild("Humanoid")
		hum.StateChanged:Connect(function(_,state)
			if infJump and state == Enum.HumanoidStateType.Freefall then
				hum:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end
	if player.Character then bindJump(player.Character) end
	player.CharacterAdded:Connect(bindJump)

	button(pages["Universal"],"Fly (Up Boost)",0.22,function()
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			local bv = Instance.new("BodyVelocity", hrp)
			bv.Velocity = Vector3.new(0,80,0)
			bv.MaxForce = Vector3.new(1e5,1e5,1e5)
			task.wait(0.25)
			bv:Destroy()
		end
	end)

	button(pages["Universal"],"ESP (Highlight)",0.39,function()
		for _,p in pairs(Players:GetPlayers()) do
			if p ~= player and p.Character then
				if not p.Character:FindFirstChild("ESP") then
					local h = Instance.new("Highlight", p.Character)
					h.Name = "ESP"
					h.FillColor = Color3.fromRGB(255,0,0)
				end
			end
		end
	end)

	--------------------------------------------------
	-- OTHER HUBS TAB
	--------------------------------------------------
	button(pages["Other Hubs"],"Sirius Hub",0.05,function()
		loadstring(game:HttpGet("https://sirius.menu/script"))()
	end)

	button(pages["Other Hubs"],"XVC Hub",0.22,function()
		loadstring(game:HttpGet("https://pastebin.com/raw/6kEi5iAE"))()
	end)

	button(pages["Other Hubs"],"Coolgui Reborn RC7",0.39,function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MiRw3b/c00lgui-v3rx/main/c00lguiv3rx.lua"))()
	end)

	--------------------------------------------------
	-- ITEM GIVER TAB
	--------------------------------------------------
	button(pages["Item Giver"],"TP Tool",0.05,function()
		local tool = Instance.new("Tool", player.Backpack)
		tool.Name = "TP Tool"

		tool.Activated:Connect(function()
			local pos = UIS:GetMouseLocation()
			local ray = camera:ViewportPointToRay(pos.X,pos.Y)
			local hit = workspace:Raycast(ray.Origin,ray.Direction*500)
			if hit and player.Character then
				player.Character:MoveTo(hit.Position)
			end
		end)
	end)

	button(pages["Item Giver"],"Linked Sword",0.22,function()
		local obj = game:GetObjects("rbxassetid://125013769")[1]
		obj.Parent = player.Backpack
	end)

	--------------------------------------------------
	-- MISC TAB
	--------------------------------------------------
	button(pages["Misc"],"Infinite Yield",0.1,function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua"))()
	end)

	button(pages["Misc"],"Nameless Admin",0.27,function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
	end)
end

--------------------------------------------------
-- KEY CHECK
--------------------------------------------------
unlock.MouseButton1Click:Connect(function()
	if keyBox.Text == "glibglobglabber" then
		createHub()
	else
		keyBox.Text = ""
		keyBox.PlaceholderText = "Wrong Key"
	end
end)

