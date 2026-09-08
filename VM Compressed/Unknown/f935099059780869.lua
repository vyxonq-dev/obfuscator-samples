local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Seven7-lua/Roblox/refs/heads/main/Librarys/Orion/Orion.lua')))()
local Window = OrionLib:MakeWindow({Name = "Kaka Hub | A long Hike", HidePremium = false, SaveConfig = true, ConfigFolder = "KakaHub"})

local MainTab = Window:MakeTab({
	Name = "Main Tab",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local AutoCutEnabled = false
local DistanceBoxValue = 25
local DelayBoxValue = 0.2

local function findLandGensFolder()
    return workspace:FindFirstChild("LandGens")
end

MainTab:AddTextbox({
    Name = "Max Distance",
    Default = tostring(DistanceBoxValue),
    TextDisappear = false,
    Callback = function(Value)
        DistanceBoxValue = tonumber(Value) or 25
    end
})

MainTab:AddTextbox({
    Name = "Delay Between Cuts (Seconds)",
    Default = tostring(DelayBoxValue),
    TextDisappear = false,
    Callback = function(Value)
        DelayBoxValue = tonumber(Value) or 0.2
    end
})

MainTab:AddToggle({
    Name = "Auto Cut Tree",
    Default = false,
    Callback = function(Value)
        AutoCutEnabled = Value
        task.spawn(function()
            while AutoCutEnabled do
                local localPlr = game.Players.LocalPlayer
                local char = localPlr.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local landGensFolder = findLandGensFolder()
                    if landGensFolder then
                        for _, baseplate in ipairs(landGensFolder:GetChildren()) do
                            if baseplate.Name:match("^Baseplate_%d+$") then
                                local treesFolder = baseplate:FindFirstChild("Trees")
                                if treesFolder then
                                    for _, tree in ipairs(treesFolder:GetChildren()) do
                                        local trunk = tree:FindFirstChild("Trunk")
                                        if trunk and (hrp.Position - trunk.Position).Magnitude <= DistanceBoxValue then
                                            pcall(function()
                                                game:GetService("ReplicatedStorage").Remotes.HitTree:FireServer(trunk)
                                            end)
                                            task.wait(DelayBoxValue)
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

local AutoPull = false

MainTab:AddLabel("Fishing")

MainTab:AddToggle({
	Name = "Auto Pull",
	Default = false,
	Callback = function(state)
		AutoPull = state
		task.spawn(function()
			while AutoPull do
				pcall(function()
					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RodPull"):FireServer()
				end)
				task.wait(0.01)
			end
		end)
	end
})

MainTab:AddLabel("Bone")

local autoBone = false

MainTab:AddToggle({
	Name = "Auto Collect Bone",
	Default = false,
	Callback = function(state)
		autoBone = state
		task.spawn(function()
			while autoBone do
				local bone = workspace:FindFirstChild("Objects") and workspace.Objects:FindFirstChild("Bone")
				if bone then
					local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
					if hrp then
						hrp.CFrame = bone.CFrame + Vector3.new(0, 3, 0)
						task.wait(0.2)
						pcall(function()
							local args = { bone }
							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CollectBone"):FireServer(unpack(args))
						end)
					end
				end
				task.wait(0.5)
			end
		end)
	end
})

MainTab:AddLabel("Melee")


local autoMelee = false

MainTab:AddToggle({
	Name = "Auto Melee Hit",
	Default = false,
	Callback = function(state)
		autoMelee = state
		task.spawn(function()
			while autoMelee do
				local plr = game.Players.LocalPlayer
				local char = plr.Character
				if char then
					local tool = char:FindFirstChildOfClass("Tool")
					if tool then
						local args = { tool }
						pcall(function()
							game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MeleeSwing"):FireServer(unpack(args))
						end)
					end
				end
				task.wait(0.001)
			end
		end)
	end
})

MainTab:AddLabel("Bring Item")

local SelectedItems = {}

local function refreshItems()
    local items = {}
    local uniqueNames = {} -- Track unique names to avoid duplicates
    for _, obj in pairs(workspace.Objects:GetChildren()) do
        if not uniqueNames[obj.Name] then
            table.insert(items, obj.Name)
            uniqueNames[obj.Name] = true
        end
    end
    return items
end

local ItemDropdown = MainTab:AddDropdown({
    Name = "Choose Items",
    Default = "",
    Options = refreshItems(),
    Callback = function(value)
        if not table.find(SelectedItems, value) then
            table.insert(SelectedItems, value)
        end
    end
})

MainTab:AddButton({
    Name = "Bring Items",
    Callback = function()
        local plrHRP = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not plrHRP then return end
        for _, itemName in pairs(SelectedItems) do
            local obj = workspace.Objects:FindFirstChild(itemName)
            if obj then
                if obj:IsA("Model") and obj.PrimaryPart then
                    pcall(function()
                        obj:SetPrimaryPartCFrame(plrHRP.CFrame)
                    end)
                elseif obj:IsA("BasePart") then
                    pcall(function()
                        obj.CFrame = plrHRP.CFrame
                    end)
                end
            end
        end
    end
})

MainTab:AddButton({
    Name = "Refresh Items",
    Callback = function()
        ItemDropdown:Refresh(refreshItems())
        SelectedItems = {}
    end
})

workspace.Objects.ChildAdded:Connect(function()
    ItemDropdown:Refresh(refreshItems())
end)

workspace.Objects.ChildRemoved:Connect(function()
    ItemDropdown:Refresh(refreshItems())
end)

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PlayerTab = Window:MakeTab({
    Name = "Player",
    PremiumOnly = false
})

local function getPlayerNames()
    local names = {}
    local uniqueNames = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and not uniqueNames[plr.Name] then
            table.insert(names, plr.Name)
            uniqueNames[plr.Name] = true
        end
    end
    return names
end

local function getHumanoid()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
end

LocalPlayer.CharacterAdded:Connect(function(character)
    wait(0.1)
    local humanoid = character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = PlayerTab:GetSliderValue("WalkSpeed") or 16
    humanoid.JumpPower = PlayerTab:GetSliderValue("JumpPower") or 50
end)

PlayerTab:AddSlider({
    Name = "WalkSpeed",
    Min = 16,
    Max = 500,
    Default = 16,
    Color = Color3.fromRGB(0, 255, 0),
    Increment = 1,
    ValueName = "speed",
    Callback = function(value)
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
})

PlayerTab:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 500,
    Default = 50,
    Color = Color3.fromRGB(0, 255, 255),
    Increment = 1,
    ValueName = "jump",
    Callback = function(value)
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.JumpPower = value
            humanoid.UseJumpPower = true
        end
    end
})

local SelectedPlayer = nil
local PlayerDropdown = PlayerTab:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = getPlayerNames(),
    Callback = function(value)
        SelectedPlayer = value
    end
})

PlayerTab:AddButton({
    Name = "Refresh Players",
    Callback = function()
        PlayerDropdown:Refresh(getPlayerNames())
        SelectedPlayer = nil
    end
})

PlayerTab:AddButton({
    Name = "Teleport to Player",
    Callback = function()
        if SelectedPlayer then
            local target = Players:FindFirstChild(SelectedPlayer)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = CFrame.new(target.Character.HumanoidRootPart.Position + Vector3.new(0, 3, 0))
                else
                    warn("Local player's HumanoidRootPart not found")
                end
            else
                warn("Target player or their HumanoidRootPart not found")
            end
        else
            warn("No player selected")
        end
    end
})

Players.PlayerAdded:Connect(function()
    PlayerDropdown:Refresh(getPlayerNames())
end)

Players.PlayerRemoving:Connect(function()
    PlayerDropdown:Refresh(getPlayerNames())
end)

local DupeTab = Window:MakeTab({
	Name = "Dupe",
	PremiumOnly = false
})

local DupeItemName = ""
local DupeAmount = 3

DupeTab:AddTextbox({
	Name = "Item Name",
	Default = "",
	TextDisappear = false,
	Callback = function(value)
		DupeItemName = value
	end
})

DupeTab:AddTextbox({
	Name = "Amount",
	Default = "3",
	TextDisappear = false,
	Callback = function(value)
		local num = tonumber(value)
		if num then DupeAmount = num end
	end
})

DupeTab:AddButton({
	Name = "Dupe Item",
	Callback = function()
		if DupeItemName ~= "" then
			local item = workspace:FindFirstChild("Objects") and workspace.Objects:FindFirstChild(DupeItemName)
			if item then
				for i = 1, DupeAmount do
					local args = {DupeItemName, item}
					game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PickupItem"):FireServer(unpack(args))
					task.wait()
				end
			end
		end
	end
})

DupeTab:AddButton({
    Name = "Drop Everything",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local backpack = player:WaitForChild("Backpack")
        local char = player.Character

        if char then
            for _, tool in pairs(char:GetChildren()) do
                if tool:IsA("Tool") then
                    local args = {tool}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DropTool"):FireServer(unpack(args))
                end
            end
        end

        if backpack then
            for _, tool in pairs(backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    local args = {tool}
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("DropTool"):FireServer(unpack(args))
                end
            end
        end
    end
})

DupeTab:AddLabel("Money")
DupeTab:AddLabel("Read How it work on dc update log")

local dupeAmount = 4

DupeTab:AddButton({
	Name = "Dupe",
	Callback = function()
		local nearestPrompt, shortestDist = nil, math.huge
		local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
		if not hrp then return end

		for _, v in pairs(workspace:GetDescendants()) do
			if v:IsA("ProximityPrompt") then
				local dist = (v.Parent.Position - hrp.Position).Magnitude
				if dist < shortestDist then
					shortestDist = dist
					nearestPrompt = v
				end
			end
		end

		if nearestPrompt then
			for i = 1, dupeAmount do
				fireproximityprompt(nearestPrompt)
				task.wait(0.1)
			end
		end
	end
})

DupeTab:AddTextbox({
	Name = "Amount",
	Default = "4",
	TextDisappear = false,
	Callback = function(Value)
		dupeAmount = tonumber(Value) or 4
	end
})

DupeTab:AddLabel("Bone")

DupeTab:AddTextbox({
	Name = "Amount",
	Default = "5",
	TextDisappear = false,
	Callback = function(value)
		dupe = tonumber(value) or 5
	end
})

DupeTab:AddButton({
	Name = "Dupe Bone",
	Callback = function()
		for i = 1, dupe do
			local bone = workspace:FindFirstChild("Objects") and workspace.Objects:FindFirstChild("Bone")
			if bone then
				local args = { bone }
				game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CollectBone"):FireServer(unpack(args))
			end
		end
	end
})

local FarmTab = Window:MakeTab({
    Name = "Farm Tab",
    PremiumOnly = false
})

local AutoFarmBoneActive = false
local TweenService = game:GetService("TweenService")
local LocalPlayer = game.Players.LocalPlayer
local HRP = LocalPlayer.Character and LocalPlayer.Character:WaitForChild("HumanoidRootPart")
local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local CollectBoneRemote = Remotes:WaitForChild("CollectBone")

local pathPoints = {
    Vector3.new(38, -65, -288),
    Vector3.new(38, -65, -382309)
}

local tweenSpeed = 5

FarmTab:AddTextbox({
    Name = "Tween Speed",
    Default = "5",
    TextDisappear = false,
    Callback = function(value)
        local num = tonumber(value)
        if num then
            tweenSpeed = num
        end
    end
})

FarmTab:AddToggle({
    Name = "Auto Farm Bone (beta)",
    Default = false,
    Callback = function(state)
        AutoFarmBoneActive = state
        if state then
            task.spawn(function()
                local index = 1
                while AutoFarmBoneActive do
                    local bone = workspace:FindFirstChild("Objects") and workspace.Objects:FindFirstChild("Bone")
                    if bone then
                        HRP.CFrame = CFrame.new(bone.Position)
                        pcall(function()
                            CollectBoneRemote:FireServer(bone)
                        end)
                        task.wait(0.1)
                    else
                        local targetPos = pathPoints[index]
                        local distance = (HRP.Position - targetPos).Magnitude
                        local tweenInfo = TweenInfo.new(distance / tweenSpeed, Enum.EasingStyle.Linear)
                        local tweenGoal = {CFrame = CFrame.new(targetPos)}
                        local tween = TweenService:Create(HRP, tweenInfo, tweenGoal)
                        tween:Play()
                        tween.Completed:Wait()
                        index = index + 1
                        if index > #pathPoints then
                            index = 1
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

FarmTab:AddToggle({
	Name = "Auto Collect Bone",
	Default = false,
	Callback = function(state)
		autoBone = state
		task.spawn(function()
			while autoBone do
				local bone = workspace:FindFirstChild("Objects") and workspace.Objects:FindFirstChild("Bone")
				if bone then
					pcall(function()
						local args = { bone }
						game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("CollectBone"):FireServer(unpack(args))
					end)
				end
				task.wait(0.5)
			end
		end)
	end
})

FarmTab:AddLabel("Use Auto Collect Bone in Main Tab")

local StructureBoneFarm = false
local Player = game.Players.LocalPlayer
local hrp = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")

local points = {
    Vector3.new(38, -65, -8221),
    Vector3.new(38, -65, -10424),
    Vector3.new(38, -65, -15747),
    Vector3.new(38, -65, -12860),
    Vector3.new(38, -65, -18997),
    Vector3.new(38, -65, -5908)
}

FarmTab:AddToggle({
    Name = "Structure Bone Farm",
    Default = false,
    Callback = function(state)
        StructureBoneFarm = state
        task.spawn(function()
            while StructureBoneFarm do
                for i, point in ipairs(points) do
                    if not StructureBoneFarm then break end
                    if Player.Character and hrp then
                        hrp.CFrame = CFrame.new(point)
                        task.wait(5)
                    end
                end
            end
        end)
    end
})

local CreditTab = Window:MakeTab({
    Name = "Credit",
    PremiumOnly = false
})

CreditTab:AddLabel("Discord Link:")
CreditTab:AddButton({
    Name = "Copy Discord",
    Callback = function()
        setclipboard("https://discord.gg/asKMJe9f")
    end
})

CreditTab:AddLabel("YouTube Link:")
CreditTab:AddButton({
    Name = "Copy YouTube",
    Callback = function()
        setclipboard("https://youtube.com/@kaka_tu")
    end
})

OrionLib:Init()

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Toggleui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = ScreenGui
Toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Toggle.BackgroundTransparency = 0.5
Toggle.Position = UDim2.new(0, 0, 0.454706937, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Draggable = true

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0.2, 0)
Corner.Parent = Toggle

local Image = Instance.new("ImageLabel")
Image.Name = "Icon"
Image.Parent = Toggle
Image.Size = UDim2.new(1, 0, 1, 0)
Image.BackgroundTransparency = 1
Image.Image = "rbxassetid://74892949275665"

local Corner2 = Instance.new("UICorner")
Corner2.CornerRadius = UDim.new(0.2, 0)
Corner2.Parent = Image

Toggle.MouseButton1Click:Connect(function()
	OrionLib:ToggleUi()
end)
