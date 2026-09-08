local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, -20)
title.Text = "Key System Enchanted Hub"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Parent = frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragInput = nil
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local KeySystem = Instance.new("TextBox")
KeySystem.Size = UDim2.new(1, 0, 0.5, 0)
KeySystem.Position = UDim2.new(0, 0, 0, 0)
KeySystem.Text = "Enter the Key"
KeySystem.TextColor3 = Color3.new(0, 0, 0)
KeySystem.BackgroundTransparency = 0.5
KeySystem.BackgroundColor3 = Color3.new(1, 1, 1)
KeySystem.TextWrapped = true
KeySystem.Parent = frame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.5, 0, 0.5, 0)
SubmitButton.Position = UDim2.new(0, 0, 0.5, 0)
SubmitButton.Text = "Submit"
SubmitButton.Parent = frame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Parent = frame

CloseButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Position = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Text = "Copy Key Link"
GetKeyButton.Parent = frame
--------------------------------------------------------------------------
SubmitButton.MouseButton1Click:Connect(function()
    local KeySystem = KeySystem.Text
    if KeySystem == "iblameaabis" then   
screenGui:Destroy()

local Library = loadstring(game:HttpGetAsync("https://github.com/ActualMasterOogway/Fluent-Renewed/releases/latest/download/Fluent.luau"))()
local SaveManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/SaveManager.luau"))()
local InterfaceManager = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ActualMasterOogway/Fluent-Renewed/master/Addons/InterfaceManager.luau"))()
 
local Window = Library:CreateWindow{
    Title = "Nebula Hub | Game: Muscle Legends | Version [v.1.8.1]",
    SubTitle = "by iblameaabis ¦ ttvkaiser fucker",
    TabWidth = 160,
    Size = UDim2.fromOffset(1087, 690.5),
    Resize = true, -- Resize this ^ Size according to a 1920x1080 screen, good for mobile users but may look weird on some devices
    MinSize = Vector2.new(470, 380),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Amethyst Dark",
    MinimizeKey = Enum.KeyCode.RightControl -- Used when theres no MinimizeKeybind
}

-- Fluent Renewed provides ALL 1544 Lucide 0.469.0 https://lucide.dev/icons/ Icons and ALL 9072 Phosphor 2.1.0 https://phosphoricons.com/ Icons for the tabs, icons are optional
local Tabs = {
  Home = Window:CreateTab{
    	Title = "Home",
    	Icon = "house"
    },
    Main = Window:CreateTab{
        Title = "Main",
        Icon = "phosphor-users-bold"
    },
  	Rocks = Window:CreateTab{
        Title = "Rocks",
        Icon = "mountain"
    },
	  Rebirth = Window:CreateTab{
        Title = "Auto Rebirths",
        Icon = "biceps-flexed"
    },
  	Killing = Window:CreateTab{
        Title = "Auto Kill",
        Icon = "skull"
    },
	Teleport = Window:CreateTab{
        Title = "Teleport",
        Icon = "tree-palm"
    },
	Status = Window:CreateTab{
        Title = "Status",
        Icon = "circle-plus"
    },
	Misc = Window:CreateTab{
        Title = "Misc",
        Icon = "command"
    },
    Settings = Window:CreateTab{
        Title = "Settings",
        Icon = "settings"
    }
}
local Options = Library.Options

Library:Notify{
    Title = "Welcome to Nebula Hub",
    Content = "Nebula Hub supports 6 games!",
    SubContent = "This game is muscle legends and currently in beta!", -- Optional
    Duration = 13 -- Set to nil to make the notification not disappear
}

Tabs.Home:AddSection("Discord Server Link")

Tabs.Home:CreateButton({
    Title = "Click to Copy Link",
    Description = "This allows you to join our Discord server and get update pings and more.",
    Callback = function()
        Window:Dialog({
            Title = "Join Our Discord",
            Content = "Would you like to copy the invite link to our Discord server?",
            Buttons = {
                {
                    Title = "Confirm",
                    Callback = function()
                        local link = "https://discord.gg/YOUR_INVITE"
                        setclipboard(link)
                        print("Copied Discord link to clipboard.")
                    end
                }
            }
        })
    end
})

Tabs.Home:AddSection("Local Player Configurations")

local speed = 16 -- default speed

-- input speed
local Input = Tabs.Home:AddInput("Input", {
    Title = "Speed Input",
    Default = tostring(speed),
    Placeholder = "Enter Speed",
    Numeric = true,
    Finished = false,
    Callback = function(Value)
        local num = tonumber(Value)
        if num then
            speed = num
            print("Speed set to:", speed)
            if Options.MyToggle.Value then
                applySpeed()
            end
        end
    end
})

-- enable speed toggle
local Toggle = Tabs.Home:AddToggle("MyToggle", {
    Title = "Enable Speed",
    Default = false
})

-- utilty to apply speed
local function applySpeed()
    local player = game.Players.LocalPlayer
    if not player then return end

    local char = player.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Options.MyToggle.Value and speed or 16
        end
    end
end

-- toggle handlee
Toggle:OnChanged(function()
    print("Toggle changed:", Options.MyToggle.Value)
    applySpeed()
end)

-- reaply speed when reseted
local player = game.Players.LocalPlayer
player.CharacterAdded:Connect(function(char)
    char:WaitForChild("Humanoid") -- Ensure humanoid exists
    if Options.MyToggle.Value then
        task.wait(0.1) -- slight delay to ensure stability
        applySpeed()
    end
end)

-- indinre jump togllw
local ToggleInfiniteJump = Tabs.Home:AddToggle("Toggle_InfiniteJump", {Title = "Infinite Jump", Default = false})
ToggleInfiniteJump:OnChanged(function()
    if Options.Toggle_InfiniteJump.Value then
        local UserInputService = game:GetService("UserInputService")
        local Player = game.Players.LocalPlayer
        local Character = Player.Character or Player.CharacterAdded:Wait()
        local Humanoid = Character:WaitForChild("Humanoid")

        -- connecttion on ro jumps
        _G.InfiniteJumpConnection = UserInputService.JumpRequest:Connect(function()
            if Options.Toggle_InfiniteJump.Value then
                Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
        print("Infinite Jump enabled")
    else
        if _G.InfiniteJumpConnection then
            _G.InfiniteJumpConnection:Disconnect()
            _G.InfiniteJumpConnection = nil
        end
        print("Infinite Jump disabled")
    end
end)

-- no xlip togle
local ToggleNoClip = Tabs.Home:AddToggle("Toggle_NoClip", {Title = "No Clip", Default = false})
ToggleNoClip:OnChanged(function()
    local RunService = game:GetService("RunService")
    local Player = game.Players.LocalPlayer

    if Options.Toggle_NoClip.Value then
        _G.NoclipConnection = RunService.Stepped:Connect(function()
            local Character = Player.Character
            if Character then
                for _, part in pairs(Character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
        print("No Clip enabled")
    else
        if _G.NoclipConnection then
            _G.NoclipConnection:Disconnect()
            _G.NoclipConnection = nil
        end
        print("No Clip disabled")
    end
end)

Tabs.Main:AddSection("Auto Farm")

local Toggle = Tabs.Main:CreateToggle("AutoRep", {Title = "Auto Lift", Default = false})
Toggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while Toggle.Value do
                game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer("rep")
                task.wait(0.1)
            end
        end)
    end
end)

local Toggle = Tabs.Main:CreateToggle("AutoNormalPunch", {
    Title = "Auto Normal Punch",
    Default = false
})

Toggle:OnChanged(function(state)
    while state and Toggle.Value do
        local player = game.Players.LocalPlayer
        local char = game.Workspace:FindFirstChild(player.Name)
        local punchTool = player.Backpack:FindFirstChild("Punch") or (char and char:FindFirstChild("Punch"))

        if punchTool then
            if punchTool.Parent ~= char then
                punchTool.Parent = char -- Equip
                task.wait(0.1)
            end

            -- Set normal attack delay
            local attackTime = punchTool:FindFirstChild("attackTime")
            if attackTime then
                attackTime.Value = 0.35
            end

            -- Simulate tool activation (plays animation)
            punchTool:Activate()
        else
            warn("Punch tool not found")
            Toggle:SetValue(false)
        end

        task.wait()
    end
end)

local autoWeightToggle = Tabs.Main:CreateToggle("AutoWeight", {Title = "Auto Weight", Default = false})
autoWeightToggle:OnChanged(function(state)
    if state then
        task.spawn(function()
            while autoWeightToggle.Value do
                local tool = game.Players.LocalPlayer.Character:FindFirstChild("Weight")
                if tool and tool:IsA("Tool") then
                    tool:Activate()
                end
                task.wait(0.2)
            end
        end)
    end
end)

local autoPushupToggle = Tabs.Main:CreateToggle("AutoPushups", {Title = "Auto Pushups", Default = false})
autoPushupToggle:OnChanged(function(state)
    if state then
        task.spawn(function()
            while autoPushupToggle.Value do
                local tool = game.Players.LocalPlayer.Character:FindFirstChild("Pushups")
                if tool and tool:IsA("Tool") then
                    tool:Activate()
                end
                task.wait(0.2)
            end
        end)
    end
end)

local autoSitupToggle = Tabs.Main:CreateToggle("AutoSitups", {Title = "Auto Situps", Default = false})
autoSitupToggle:OnChanged(function(state)
    if state then
        task.spawn(function()
            while autoSitupToggle.Value do
                local tool = game.Players.LocalPlayer.Character:FindFirstChild("Situps")
                if tool and tool:IsA("Tool") then
                    tool:Activate()
                end
                task.wait(0.2)
            end
        end)
    end
end)

local autoHandstandToggle = Tabs.Main:CreateToggle("AutoHandstands", {Title = "Auto Handstands", Default = false})
autoHandstandToggle:OnChanged(function(state)
    if state then
        task.spawn(function()
            while autoHandstandToggle.Value do
                local tool = game.Players.LocalPlayer.Character:FindFirstChild("Handstand")
                if tool and tool:IsA("Tool") then
                    tool:Activate()
                end
                task.wait(0.2)
            end
        end)
    end
end)

Tabs.Main:AddSection("Auto Fast Farm")

local Toggle = Tabs.Main:CreateToggle("AutoPunchWithAnim", {
    Title = "Auto Fast Punch",
    Default = false
})

Toggle:OnChanged(function(state)
    while state and Toggle.Value do
        local player = game.Players.LocalPlayer
        local char = game.Workspace:FindFirstChild(player.Name)
        local punchTool = player.Backpack:FindFirstChild("Punch") or (char and char:FindFirstChild("Punch"))

        if punchTool then
            if punchTool.Parent ~= char then
                punchTool.Parent = char -- Equip
                task.wait(0.1) -- small delay to ensure it's equipped
            end

            -- Fast punch tweak
            local attackTime = punchTool:FindFirstChild("attackTime")
            if attackTime then
                attackTime.Value = 0
            end

            -- Simulate tool activation (triggers animation + event)
            punchTool:Activate()
        else
            warn("Punch tool not found")
            Toggle:SetValue(false)
        end

        task.wait()
    end
end)

local fastWeightToggle = Tabs.Main:CreateToggle("FastWeight", {Title = "Auto Fast Weight", Default = false})

fastWeightToggle:OnChanged(function(state)
    while state and fastWeightToggle.Value do
        local player = game.Players.LocalPlayer
        local char = player.Character
        local tool = player.Backpack:FindFirstChild("Weight") or (char and char:FindFirstChild("Weight"))

        if tool then
            if tool.Parent ~= char then
                tool.Parent = char
                task.wait(0.1)
            end

            local workoutTime = tool:FindFirstChild("workoutTime")
            if workoutTime then
                workoutTime.Value = 0
            end

            tool:Activate()
        end

        task.wait()
    end
end)

local fastPushupToggle = Tabs.Main:CreateToggle("FastPushups", {Title = "Auto Fast Pushups", Default = false})

fastPushupToggle:OnChanged(function(state)
    while state and fastPushupToggle.Value do
        local player = game.Players.LocalPlayer
        local char = player.Character
        local tool = player.Backpack:FindFirstChild("Pushups") or (char and char:FindFirstChild("Pushups"))

        if tool then
            if tool.Parent ~= char then
                tool.Parent = char
                task.wait(0.1)
            end

            local pushupTime = tool:FindFirstChild("pushupTime")
            if pushupTime then
                pushupTime.Value = 0
            end

            tool:Activate()
        end

        task.wait()
    end
end)

local fastSitupToggle = Tabs.Main:CreateToggle("FastSitups", {Title = "Auto Fast Situps", Default = false})

fastSitupToggle:OnChanged(function(state)
    while state and fastSitupToggle.Value do
        local player = game.Players.LocalPlayer
        local char = player.Character
        local tool = player.Backpack:FindFirstChild("Situps") or (char and char:FindFirstChild("Situps"))

        if tool then
            if tool.Parent ~= char then
                tool.Parent = char
                task.wait(0.1)
            end

            local situpTime = tool:FindFirstChild("situpTime")
            if situpTime then
                situpTime.Value = 0
            end

            tool:Activate()
        end

        task.wait()
    end
end)

local fastHandstandToggle = Tabs.Main:CreateToggle("FastHandstands", {Title = "Auto Fast Handstands", Default = false})

fastHandstandToggle:OnChanged(function(state)
    while state and fastHandstandToggle.Value do
        local player = game.Players.LocalPlayer
        local char = player.Character
        local tool = player.Backpack:FindFirstChild("Handstand") or (char and char:FindFirstChild("Handstand"))

        if tool then
            if tool.Parent ~= char then
                tool.Parent = char
                task.wait(0.1)
            end

            local handstandTime = tool:FindFirstChild("handstandTime")
            if handstandTime then
                handstandTime.Value = 0
            end

            tool:Activate()
        end

        task.wait()
    end
end)

Tabs.Main:AddSection("Auto Jungle")

local jungleBenchToggle = Tabs.Main:CreateToggle("JungleBench", {Title = "Auto Jungle Bench", Default = false})
jungleBenchToggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while jungleBenchToggle.Value do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8629.88086, 64.8842468, 1855.03467))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bench"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

local jungleBarToggle = Tabs.Main:CreateToggle("JungleBar", {Title = "Auto Jungle Bar Lift", Default = false})
jungleBarToggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while jungleBarToggle.Value do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8678.05566, 14.5030098, 2089.25977))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bar Lift"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

local jungleSquatToggle = Tabs.Main:CreateToggle("JungleSquat", {Title = "Auto Jungle Squat", Default = false})
jungleSquatToggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while jungleSquatToggle.Value do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8374.25586, 34.5933418, 2932.44995))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Squat"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

Tabs.Main:AddSection("Auto Equip")

local equipWeightToggle = Tabs.Main:CreateToggle("EquipWeight", {Title = "Auto Equip Weight", Default = false})
equipWeightToggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while equipWeightToggle.Value do
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
                if tool then tool.Parent = game.Players.LocalPlayer.Character end
                task.wait(0.1)
            end
        end)
    end
end)

local equipPushupToggle = Tabs.Main:CreateToggle("EquipPushups", {Title = "Auto Equip Pushups", Default = false})
equipPushupToggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while equipPushupToggle.Value do
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
                if tool then tool.Parent = game.Players.LocalPlayer.Character end
                task.wait(0.1)
            end
        end)
    end
end)

local equipSitupToggle = Tabs.Main:CreateToggle("EquipSitups", {Title = "Auto Equip Situps", Default = false})
equipSitupToggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while equipSitupToggle.Value do
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
                if tool then tool.Parent = game.Players.LocalPlayer.Character end
                task.wait(0.1)
            end
        end)
    end
end)

local equipHandstandToggle = Tabs.Main:CreateToggle("EquipHandstands", {Title = "Auto Equip Handstands", Default = false})
equipHandstandToggle:OnChanged(function(State)
    if State then
        task.spawn(function()
            while equipHandstandToggle.Value do
                local tool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstand")
                if tool then tool.Parent = game.Players.LocalPlayer.Character end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Rebirth (Normal)
local autoRebirthToggle = Tabs.Rebirth:CreateToggle("AutoRebirth", {Title = "Auto Rebirth (Normal)", Default = false})
autoRebirthToggle:OnChanged(function(State)
	if State then
		task.spawn(function()
			while autoRebirthToggle.Value do
				game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthRemote"):InvokeServer("rebirthRequest")
				task.wait(0.1)
			end
		end)
	end
end)

-- Auto Size 2
local autoSize2Toggle = Tabs.Rebirth:CreateToggle("AutoSize2", {Title = "Auto Size 2", Default = false})
autoSize2Toggle:OnChanged(function(State)
	if State then
		autoSizeLoop = task.spawn(function()
			while autoSize2Toggle.Value do
				game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 2)
				task.wait()
			end
		end)
	else
		if autoSizeLoop then
			task.cancel(autoSizeLoop)
			autoSizeLoop = nil
		end
	end
end)

-- Hide All Frames
local hideFramesToggle = Tabs.Rebirth:CreateToggle("HideAllFrames", {Title = "Hide All Frames", Default = false})
hideFramesToggle:OnChanged(function(State)
	local rSto = game:GetService("ReplicatedStorage")
	for _, obj in pairs(rSto:GetChildren()) do
		if obj:IsA("Instance") and obj.Name:match("Frame$") then
			obj.Visible = not State
		end
	end
end)

-- Label
Tabs.Rebirth:AddSection("OP Stuff")

-- Fast Rebirths
local fastRebirthsToggle = Tabs.Rebirth:CreateToggle("FastRebirths", {Title = "Fast Rebirths", Default = false})
fastRebirthsToggle:OnChanged(function(State)
	if State then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/0o0o0o0o0o0o0o0o0o0o0o0o/0o0o0o0o/refs/heads/main/Kk"))()
	end
end)

-- Speed Grind (No Rebirth)
local speedGrindToggle = Tabs.Rebirth:CreateToggle("SpeedGrind", {Title = "Fast Grind (No Rebirth)", Default = false})
speedGrindToggle:OnChanged(function(State)
	if State then
		for i = 1, 12 do
			task.spawn(function()
				while speedGrindToggle.Value do
					game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
					task.wait(0.083)
				end
			end)
		end
	end
end)

Tabs.Rocks:AddSection("Auto Punch Rocks")

local selectrock = ""

local function punchRock(requiredDurability, rockName)
    getgenv().autoFarm = true
    while getgenv().autoFarm and selectrock == rockName do
        task.wait()
        local player = game.Players.LocalPlayer
        if player.Durability.Value >= requiredDurability then
            for _, v in pairs(game.Workspace.machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == requiredDurability and player.Character:FindFirstChild("LeftHand") and player.Character:FindFirstChild("RightHand") then
                    firetouchinterest(v.Parent.Rock, player.Character.RightHand, 0)
                    firetouchinterest(v.Parent.Rock, player.Character.RightHand, 1)
                    firetouchinterest(v.Parent.Rock, player.Character.LeftHand, 0)
                    firetouchinterest(v.Parent.Rock, player.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
end

-- jungle Rock
local jungleToggle = Tabs.Rocks:CreateToggle("JungleRock", {Title = "Auto Punch Jungle Rock (10M)", Default = false})
jungleToggle:OnChanged(function()
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = Options.JungleRock.Value
    if Options.JungleRock.Value then punchRock(10000000, selectrock) end
end)

-- muscle king Rock
local kingToggle = Tabs.Rocks:CreateToggle("KingRock", {Title = "Auto Punch Muscle King Rock (5M)", Default = false})
kingToggle:OnChanged(function()
    selectrock = "Muscle King Gym Rock"
    getgenv().autoFarm = Options.KingRock.Value
    if Options.KingRock.Value then punchRock(5000000, selectrock) end
end)

-- Legend Rock
local legendToggle = Tabs.Rocks:CreateToggle("LegendRock", {Title = "Auto Punch Legend Rock (1M)", Default = false})
legendToggle:OnChanged(function()
    selectrock = "Legend Gym Rock"
    getgenv().autoFarm = Options.LegendRock.Value
    if Options.LegendRock.Value then punchRock(1000000, selectrock) end
end)

-- Inferno Rock
local infernoToggle = Tabs.Rocks:CreateToggle("InfernoRock", {Title = "Auto Punch Inferno Rock (750K)", Default = false})
infernoToggle:OnChanged(function()
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = Options.InfernoRock.Value
    if Options.InfernoRock.Value then punchRock(750000, selectrock) end
end)

-- Mythical Rock
local mythToggle = Tabs.Rocks:CreateToggle("MythRock", {Title = "Auto Punch Mythical Rock (400K)", Default = false})
mythToggle:OnChanged(function()
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = Options.MythRock.Value
    if Options.MythRock.Value then punchRock(400000, selectrock) end
end)

-- Frost Rock
local frostToggle = Tabs.Rocks:CreateToggle("FrostRock", {Title = "Auto Punch Frost Rock (150K)", Default = false})
frostToggle:OnChanged(function()
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = Options.FrostRock.Value
    if Options.FrostRock.Value then punchRock(150000, selectrock) end
end)

-- Tiny Rock
local tinyToggle = Tabs.Rocks:CreateToggle("TinyRock", {Title = "Auto Punch Tiny Rock (0)", Default = false})
tinyToggle:OnChanged(function()
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = Options.TinyRock.Value
    if Options.TinyRock.Value then punchRock(0, selectrock) end
end)

-- Auto Punch Toggle (No Animation)
local Toggle = Tabs.Killing:CreateToggle("AutoPunchNoAnim", {Title = "Auto Punch (No Anim)", Default = false})
Toggle:OnChanged(function(state)
    while state and Toggle.Value do
        local player = game.Players.LocalPlayer
        local char = game.Workspace:FindFirstChild(player.Name)
        local punchTool = player.Backpack:FindFirstChild("Punch") or (char and char:FindFirstChild("Punch"))

        if punchTool then
            if punchTool.Parent ~= char then
                punchTool.Parent = char -- Equip
            end

            player.muscleEvent:FireServer("punch", "rightHand")
            player.muscleEvent:FireServer("punch", "leftHand")
        else
            warn("Punch tool not found")
            Toggle:SetValue(false) -- Stop if tool not found
        end
        task.wait()
    end
end)

-- Speed Punch Button
Tabs.Killing:CreateButton({
    Title = "Fast Punch",
    Callback = function()
        local player = game.Players.LocalPlayer
        local punch = player.Backpack:FindFirstChild("Punch") or (game.Workspace:FindFirstChild(player.Name) and game.Workspace[player.Name]:FindFirstChild("Punch"))
        if punch and punch:FindFirstChild("attackTime") then
            punch.attackTime.Value = 0.065
        end
    end
})

-- Normal Punch Button
Tabs.Killing:CreateButton({
    Title = "Normal Punch",
    Callback = function()
        local player = game.Players.LocalPlayer
        local punch = player.Backpack:FindFirstChild("Punch") or (game.Workspace:FindFirstChild(player.Name) and game.Workspace[player.Name]:FindFirstChild("Punch"))
        if punch and punch:FindFirstChild("attackTime") then
            punch.attackTime.Value = 0.35
        end
    end
})

	-- Whitelist Table
local whitelist = {}
local playerList = {}

-- Create Dropdown
local Dropdown = Tabs.Killing:AddDropdown("WhitelistDropdown", {
    Title = "Whitelist Player(s)",
    Values = {},
    Multi = true,
    Default = {},
})

-- Populate initially
for _, player in ipairs(game.Players:GetPlayers()) do
    table.insert(playerList, player.Name)
end
Dropdown:SetValues(playerList)

-- Update on PlayerAdded
game.Players.PlayerAdded:Connect(function(player)
    table.insert(playerList, player.Name)
    Dropdown:SetValues(playerList)
end)

-- Update on PlayerRemoving
game.Players.PlayerRemoving:Connect(function(player)
    for i, name in ipairs(playerList) do
        if name == player.Name then
            table.remove(playerList, i)
            break
        end
    end
    Dropdown:SetValues(playerList)
end)

-- Sync whitelist
Dropdown:OnChanged(function(selectedPlayers)
    table.clear(whitelist)
    for _, name in ipairs(selectedPlayers) do
        whitelist[name] = true
    end
    print("Whitelisted:", selectedPlayers)
end)

local AutokillToggle = Tabs.Killing:CreateToggle("AutoKill", {Title = "Auto Kill", Default = false})
AutokillToggle:OnChanged(function(state)
    while state and AutokillToggle.Value do
        local player = game.Players.LocalPlayer

        -- Auto punch setup
        local punch = player.Backpack:FindFirstChild("Punch") or (player.Character and player.Character:FindFirstChild("Punch"))
        if punch and punch:FindFirstChild("attackTime") then
            punch.attackTime.Value = 0.065
        end

        -- Auto kill logic
        for _, target in ipairs(game.Players:GetPlayers()) do
            if target ~= player and not whitelist[target.Name] then
                local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
                local rHand = player.Character and player.Character:FindFirstChild("RightHand")
                local lHand = player.Character and player.Character:FindFirstChild("LeftHand")

                if root and rHand and lHand then
                    firetouchinterest(rHand, root, 1)
                    firetouchinterest(lHand, root, 1)
                    firetouchinterest(rHand, root, 0)
                    firetouchinterest(lHand, root, 0)
                end
            end
        end

        task.wait(0.1)
    end
end)

-- Target Kill
local targetPlayerName = nil
Tabs.Killing:CreateInput("TargetPlayerBox", {
    Title = "Player Username",
    Default = "",
    Placeholder = "Enter exact username...",
    Callback = function(text)
        targetPlayerName = text
    end
})

local Toggle = Tabs.Killing:CreateToggle("AutoKillTarget", {Title = "Auto Kill Player", Default = false})
Toggle:OnChanged(function(state)
    while state and Toggle.Value do
        local player = game.Players.LocalPlayer
        local target = game.Players:FindFirstChild(targetPlayerName)

        if target and target ~= player then
            local root = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
            local rHand = player.Character and player.Character:FindFirstChild("RightHand")
            local lHand = player.Character and player.Character:FindFirstChild("LeftHand")

            if root and rHand and lHand then
                firetouchinterest(rHand, root, 1)
                firetouchinterest(lHand, root, 1)
                firetouchinterest(rHand, root, 0)
                firetouchinterest(lHand, root, 0)
            end
        end
        task.wait(0.1)
    end
end)

-- Tiny Island
Tabs.Teleport:CreateButton({
    Title = "Tiny Island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.8626194, 6.0588026, 2087.88672, -0.999396682, -9.72631931e-09, 0.034730725, -6.63278898e-09, 1, 8.91870684e-08, -0.034730725, 8.8902901e-08, -0.999396682)
    end
})

-- Starter Island
Tabs.Teleport:CreateButton({
    Title = "Starter Island",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226.252472, 8.1526947, 219.366516, -0.00880406145, 3.58277887e-08, -0.999961257, -4.41204939e-08, 1, 3.62176351e-08, 0.999961257, 4.44376482e-08, -0.00880406145)
    end
})

-- Beach
Tabs.Teleport:CreateButton({
    Title = "Beach",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-365.798309, 44.5082932, -501.618591, 0.00878552441, -6.19950713e-09, 0.999961436, -4.37451603e-10, 1, 6.20358964e-09, -0.999961436, -4.91936492e-10, 0.00878552441)
    end
})

-- Frost Gym
Tabs.Teleport:CreateButton({
    Title = "Frost Gym",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2933.47998, 29.6399612, -579.946045, 0.0345239155, -1.03010173e-07, 0.999403894, 1.03015294e-08, 1, 1.02715752e-07, -0.999403894, 6.74923806e-09, 0.0345239155)
    end
})

-- Mythical Gym
Tabs.Teleport:CreateButton({
    Title = "Mythical Gym",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2659.50635, 21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, -4.98585742e-08, 1, -6.37288338e-08, -0.000502891606, 6.37037516e-08, 0.999999881)
    end
})

-- Eternal Gym
Tabs.Teleport:CreateButton({
    Title = "Eternal Gym",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7176.19141, 45.394104, -1106.31421, 0.971191287, -2.38377185e-09, 0.238301158, 1.41694778e-09, 1, 4.22844915e-09, -0.238301158, -3.76897269e-09, 0.971191287)
    end
})

-- Legend Gym
Tabs.Teleport:CreateButton({
    Title = "Legend Gym",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4446.91699, 1004.46698, -3983.76074, -0.999961317, -1.97616366e-08, 0.00879266672, -1.93830077e-08, 1, 4.31365149e-08, -0.00879266672, 4.29661292e-08, -0.999961317)
    end
})

-- Muscle King
Tabs.Teleport:CreateButton({
    Title = "Muscle King",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8626, 15, -5730)
    end
})

-- Jungle Gym
Tabs.Teleport:CreateButton({
    Title = "Jungle Gym",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8137, 28, 2820)
    end
})

Tabs.Status:AddSection("Stats Gained")

local function abbreviateNumber(value)
    if value >= 1e15 then
        return string.format("%.1fQa", value / 1e15)
    elseif value >= 1e12 then
        return string.format("%.1fT", value / 1e12)
    elseif value >= 1e9 then
        return string.format("%.1fB", value / 1e9)
    elseif value >= 1e6 then
        return string.format("%.1fM", value / 1e6)
    elseif value >= 1e3 then
        return string.format("%.1fK", value / 1e3)
    else
        return tostring(value)
    end
end

-- Paragraph containers
local paragraphs = {
    TimeSpent = Tabs.Status:CreateParagraph("TimeSpent", {
        Title = "Time Spent",
        Content = "Time spent in this server: 00:00",
        TitleAlignment = "Middle",
        ContentAlignment = Enum.TextXAlignment.Center
    }),
    StrengthGained = Tabs.Status:CreateParagraph("StrengthGained", {
        Title = "Strength",
        Content = "Strength gained: 0",
        TitleAlignment = "Middle",
        ContentAlignment = Enum.TextXAlignment.Center
    }),
    DurabilityGained = Tabs.Status:CreateParagraph("DurabilityGained", {
        Title = "Durability",
        Content = "Durability gained: 0",
        TitleAlignment = "Middle",
        ContentAlignment = Enum.TextXAlignment.Center
    }),
    AgilityGained = Tabs.Status:CreateParagraph("AgilityGained", {
        Title = "Agility",
        Content = "Agility gained: 0",
        TitleAlignment = "Middle",
        ContentAlignment = Enum.TextXAlignment.Center
    }),
    KillsGained = Tabs.Status:CreateParagraph("KillsGained", {
        Title = "Kills",
        Content = "Kills gained: 0",
        TitleAlignment = "Middle",
        ContentAlignment = Enum.TextXAlignment.Center
    }),
    EvilKarmaGained = Tabs.Status:CreateParagraph("EvilKarmaGained", {
        Title = "Evil Karma",
        Content = "Evil Karma gained: 0",
        TitleAlignment = "Middle",
        ContentAlignment = Enum.TextXAlignment.Center
    }),
    GoodKarmaGained = Tabs.Status:CreateParagraph("GoodKarmaGained", {
        Title = "Good Karma",
        Content = "Good Karma gained: 0",
        TitleAlignment = "Middle",
        ContentAlignment = Enum.TextXAlignment.Center
    })
}

local function createMyParagraphStats()
    local player = game.Players.LocalPlayer
    if not player then return end

    local leaderstats = player:WaitForChild("leaderstats")
    local strengthStat = leaderstats:WaitForChild("Strength")
    local durabilityStat = player:WaitForChild("Durability")
    local agilityStat = player:WaitForChild("Agility")
    local killsStat = leaderstats:WaitForChild("Kills")
    local evilKarmaStat = player:WaitForChild("evilKarma")
    local goodKarmaStat = player:WaitForChild("goodKarma")

    local initialStrength = strengthStat.Value
    local initialDurability = durabilityStat.Value
    local initialAgility = agilityStat.Value
    local initialKills = killsStat.Value
    local initialEvilKarma = evilKarmaStat.Value
    local initialGoodKarma = goodKarmaStat.Value

    local startTime = tick()

    local function updateParagraphs()
        paragraphs.StrengthGained:SetContent("Strength gained: " .. abbreviateNumber(strengthStat.Value - initialStrength))
        paragraphs.DurabilityGained:SetContent("Durability gained: " .. abbreviateNumber(durabilityStat.Value - initialDurability))
        paragraphs.AgilityGained:SetContent("Agility gained: " .. abbreviateNumber(agilityStat.Value - initialAgility))
        paragraphs.KillsGained:SetContent("Kills gained: " .. abbreviateNumber(killsStat.Value - initialKills))
        paragraphs.EvilKarmaGained:SetContent("Evil Karma gained: " .. abbreviateNumber(evilKarmaStat.Value - initialEvilKarma))
        paragraphs.GoodKarmaGained:SetContent("Good Karma gained: " .. abbreviateNumber(goodKarmaStat.Value - initialGoodKarma))
    end

    local function updateTimeSpent()
        local timeSpent = tick() - startTime
        local minutes = math.floor(timeSpent / 60)
        local seconds = math.floor(timeSpent % 60)
        paragraphs.TimeSpent:SetContent(string.format("Time spent in this server: %02d:%02d", minutes, seconds))
    end

    -- Connect stat changes to updates
    strengthStat.Changed:Connect(updateParagraphs)
    durabilityStat.Changed:Connect(updateParagraphs)
    agilityStat.Changed:Connect(updateParagraphs)
    killsStat.Changed:Connect(updateParagraphs)
    evilKarmaStat.Changed:Connect(updateParagraphs)
    goodKarmaStat.Changed:Connect(updateParagraphs)

    -- Update loop for time
    game:GetService("RunService").Heartbeat:Connect(updateTimeSpent)

    -- Initial refresh
    updateParagraphs()
end

createMyParagraphStats()

-- Permanent Shift Lock Button
Tabs.Misc:CreateButton({
    Title = "Permanent Shift Lock",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/CjNsnSDy'))()
    end
})

-- Anti AFK Button
Tabs.Misc:CreateButton({
    Title = "Anti AFK",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()
    end
})

local LockPosToggle = Tabs.Misc:CreateToggle("LockCharPos", {
    Title = "ðŸ§Š Lock Character Position",
    Default = false
})

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local hrp = nil
local anchorConn = nil

LockPosToggle:OnChanged(function(state)
    hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

    if state and hrp then
        anchorConn = RunService.Stepped:Connect(function()
            if hrp then
                hrp.Anchored = true
            end
        end)
    else
        if anchorConn then
            anchorConn:Disconnect()
            anchorConn = nil
        end
        if hrp then
            hrp.Anchored = false
        end
    end
end)

-- Optional: Re-lock when character respawns
player.CharacterAdded:Connect(function(char)
    hrp = char:WaitForChild("HumanoidRootPart", 5)
    if LockPosToggle.Value and hrp then
        hrp.Anchored = true
    end
end)

-- Disable Trade Toggle
Tabs.Misc:CreateToggle("DisableTrade", {Title = "Disable Trade", Default = false}):OnChanged(function(state)
    local tradeEvent = game:GetService("ReplicatedStorage").rEvents.tradingEvent
    if state then
        tradeEvent:FireServer("disableTrading")
    else
        tradeEvent:FireServer("enableTrading")
    end
end)

-- Hide Pets Toggle
Tabs.Misc:CreateToggle("HidePets", {Title = "Hide Pets", Default = false}):OnChanged(function(state)
    local petEvent = game:GetService("ReplicatedStorage").rEvents.showPetsEvent
    if state then
        petEvent:FireServer("hidePets")
    else
        petEvent:FireServer("showPets")
    end
end)

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Library)
InterfaceManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes{}

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Library:Notify{
    Title = "Nebula Hub",
    Content = "The script has been loaded.",
    Duration = 1
}

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig() 

  end
end)
GetKeyButton.MouseButton1Click:Connect(function()
 setclipboard("https://rekonise.com/get-key-of-enchanted-hub-3p3up") 
end)
