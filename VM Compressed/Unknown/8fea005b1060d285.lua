local Libary = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

workspace.FallenPartsDestroyHeight = -math.huge

local Window = Libary:MakeWindow({

    Title = "angel hub| Brookhaven RP ",

    SubTitle = "by: Akira and Hiro and Of Shelby",

    LoadText = "Loading angel hub",

    Flags = "Nick"

})

Window:AddMinimizeButton({

    Button = { Image = "rbxassetid://93186491388473", BackgroundTransparency = 0 },

    Corner = { CornerRadius = UDim.new(35, 1) },

})

local InfoTab = Window:MakeTab({ Title = "Info", Icon = "rbxassetid://15309138473" })

InfoTab:AddSection({ "Script Information" })

InfoTab:AddParagraph({ "Owner / Developer:", "Akira and Hiro And Of Shelby." })

InfoTab:AddParagraph({ "Collaborations:", "Blue, sukuna, Magekko, fx client hub, Star, Toddy" })

InfoTab:AddParagraph({ "You are using:", "angel hub Brookhaven " })

InfoTab:AddParagraph({"Your executor:", executor})

InfoTab:AddSection({ "Rejoin" })

InfoTab:AddButton({

    Name = "Rejoin",

    Callback = function()

        local TeleportService = game:GetService("TeleportService")

        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)

    end

})

local TrollTab = Window:MakeTab({ Title = "Troll Scripts", Icon = "rbxassetid://13364900349" })

TrollTab:AddSection({ "Black Hole" })

TrollTab:AddButton({

    Name = "Black Hole",

    Description = "Activating this will pull parts towards your character",

    Callback = function()

        local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local Workspace = game:GetService("Workspace")

local angle = 1

local radius = 10

local blackHoleActive = false

local function setupPlayer()

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

    local Folder = Instance.new("Folder", Workspace)

    local Part = Instance.new("Part", Folder)

    local Attachment1 = Instance.new("Attachment", Part)

    Part.Anchored = true

    Part.CanCollide = false

    Part.Transparency = 1

    return humanoidRootPart, Attachment1

end

local humanoidRootPart, Attachment1 = setupPlayer()

if not getgenv().Network then

    getgenv().Network = {

        BaseParts = {},

        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)

    }

    Network.RetainPart = function(part)

        if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then

            table.insert(Network.BaseParts, part)

            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)

            part.CanCollide = false

        end

    end

    local function EnablePartControl()

        LocalPlayer.ReplicationFocus = Workspace

        RunService.Heartbeat:Connect(function()

            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)

            for _, part in pairs(Network.BaseParts) do

                if part:IsDescendantOf(Workspace) then

                    part.Velocity = Network.Velocity

                end

            end

        end)

    end

    EnablePartControl()

end

local function ForcePart(v)

    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then

        for _, x in next, v:GetChildren() do

            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then

                x:Destroy()

            end

        end

        if v:FindFirstChild("Attachment") then

            v:FindFirstChild("Attachment"):Destroy()

        end

        if v:FindFirstChild("AlignPosition") then

            v:FindFirstChild("AlignPosition"):Destroy()

        end

        if v:FindFirstChild("Torque") then

            v:FindFirstChild("Torque"):Destroy()

        end

        v.CanCollide = false

        

        local Torque = Instance.new("Torque", v)

        Torque.Torque = Vector3.new(1000000, 1000000, 1000000)

        local AlignPosition = Instance.new("AlignPosition", v)

        local Attachment2 = Instance.new("Attachment", v)

        Torque.Attachment0 = Attachment2

        AlignPosition.MaxForce = math.huge

        AlignPosition.MaxVelocity = math.huge

        AlignPosition.Responsiveness = 500

        AlignPosition.Attachment0 = Attachment2

        AlignPosition.Attachment1 = Attachment1

    end

end

local function toggleBlackHole()

    blackHoleActive = not blackHoleActive

    if blackHoleActive then

        for _, v in next, Workspace:GetDescendants() do

            ForcePart(v)

        end

        Workspace.DescendantAdded:Connect(function(v)

            if blackHoleActive then

                ForcePart(v)

            end

        end)

        spawn(function()

            while blackHoleActive and RunService.RenderStepped:Wait() do

                angle = angle + math.rad(2)

                local offsetX = math.cos(angle) * radius

                local offsetZ = math.sin(angle) * radius

                Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)

            end

        end)

    else

        Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)

    end

end

LocalPlayer.CharacterAdded:Connect(function()

    humanoidRootPart, Attachment1 = setupPlayer()

    if blackHoleActive then

        toggleBlackHole() -- Re-toggle to apply to new character

    end

end)

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()

local window = library:Window("Project LKB")

window:Slider("Blackhole Radius",1,100,10, function(Value)

   radius = Value

end)

window:Toggle("Blackhole", true, function(Value)

       if Value then

            toggleBlackHole()

        else

            blackHoleActive = false

        end

end)

spawn(function()

    while true do

        RunService.RenderStepped:Wait()

        if blackHoleActive then

            angle = angle + math.rad(angleSpeed)

        end

    end

end)

toggleBlackHole()

    end

})

TrollTab:AddSection({ "Pull Parts" })

TrollTab:AddButton({

    Name = "Pull Parts",

    Description = "To use, get close to the selected player",

    Callback = function()

        -- Gui to Lua

-- Version: 3.2

-- Instances:

local Gui = Instance.new("ScreenGui")

local Main = Instance.new("Frame")

local Box = Instance.new("TextBox")

local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

local Label = Instance.new("TextLabel")

local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

local Button = Instance.new("TextButton")

local UITextSizeConstraint_3 = Instance.new("UITextSizeConstraint")

--Properties:

Gui.Name = "PullPartsGUI"

Gui.Parent = gethui()

Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "MainFrame"

Main.Parent = Gui

Main.BackgroundColor3 = Color3.fromRGB(75, 75, 75)

Main.BorderColor3 = Color3.fromRGB(0, 0, 0)

Main.BorderSizePixel = 0

Main.Position = UDim2.new(0.335954279, 0, 0.542361975, 0)

Main.Size = UDim2.new(0.240350261, 0, 0.166880623, 0)

Main.Active = true

Main.Draggable = true

Box.Name = "Box"

Box.Parent = Main

Box.BackgroundColor3 = Color3.fromRGB(95, 95, 95)

Box.BorderColor3 = Color3.fromRGB(0, 0, 0)

Box.BorderSizePixel = 0

Box.Position = UDim2.new(0.0980926454, 0, 0.218712583, 0)

Box.Size = UDim2.new(0.801089942, 0, 0.364963502, 0)

Box.FontFace = Font.new("rbxasset://fonts/families/SourceSansSemibold.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

Box.PlaceholderText = "Player here"

Box.Text = ""

Box.TextColor3 = Color3.fromRGB(255, 255, 255)

Box.TextScaled = true

Box.TextSize = 31.000

Box.TextWrapped = true

UITextSizeConstraint.Parent = Box

UITextSizeConstraint.MaxTextSize = 31

Label.Name = "Label"

Label.Parent = Main

Label.BackgroundColor3 = Color3.fromRGB(95, 95, 95)

Label.BorderColor3 = Color3.fromRGB(0, 0, 0)

Label.BorderSizePixel = 0

Label.Size = UDim2.new(1, 0, 0.160583943, 0)

Label.FontFace = Font.new("rbxasset://fonts/families/Nunito.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)

Label.Text = "Bring Parts | Made by: Lusquinha_067"

Label.TextColor3 = Color3.fromRGB(255, 255, 255)

Label.TextScaled = true

Label.TextSize = 14.000

Label.TextWrapped = true

UITextSizeConstraint_2.Parent = Label

UITextSizeConstraint_2.MaxTextSize = 21

Button.Name = "Button"

Button.Parent = Main

Button.BackgroundColor3 = Color3.fromRGB(95, 95, 95)

Button.BorderColor3 = Color3.fromRGB(0, 0, 0)

Button.BorderSizePixel = 0

Button.Position = UDim2.new(0.183284417, 0, 0.656760991, 0)

Button.Size = UDim2.new(0.629427791, 0, 0.277372271, 0)

Button.Font = Enum.Font.Nunito

Button.Text = "Bring | Off"

Button.TextColor3 = Color3.fromRGB(255, 255, 255)

Button.TextScaled = true

Button.TextSize = 28.000

Button.TextWrapped = true

UITextSizeConstraint_3.Parent = Button

UITextSizeConstraint_3.MaxTextSize = 28

-- Scripts:

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")

local character

local humanoidRootPart

mainStatus = true

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)

	if input.KeyCode == Enum.KeyCode.RightControl and not gameProcessedEvent then		mainStatus = not mainStatus

		Main.Visible = mainStatus

	end

end)

local Folder = Instance.new("Folder", Workspace)

local Part = Instance.new("Part", Folder)

local Attachment1 = Instance.new("Attachment", Part)

Part.Anchored = true

Part.CanCollide = false

Part.Transparency = 1

if not getgenv().Network then

	getgenv().Network = {

		BaseParts = {},

		Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)

	}

	Network.RetainPart = function(Part)

		if Part:IsA("BasePart") and Part:IsDescendantOf(Workspace) then

			table.insert(Network.BaseParts, Part)

			Part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)

			Part.CanCollide = false

		end

	end

	local function EnablePartControl()

		LocalPlayer.ReplicationFocus = Workspace

		RunService.Heartbeat:Connect(function()

			sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)

			for _, Part in pairs(Network.BaseParts) do

				if Part:IsDescendantOf(Workspace) then

					Part.Velocity = Network.Velocity

				end

			end

		end)

	end

	EnablePartControl()

end

local function ForcePart(v)

	if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then

		for _, x in ipairs(v:GetChildren()) do

			if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then

				x:Destroy()

			end

		end

		if v:FindFirstChild("Attachment") then

			v:FindFirstChild("Attachment"):Destroy()

		end

		if v:FindFirstChild("AlignPosition") then

			v:FindFirstChild("AlignPosition"):Destroy()

		end

		if v:FindFirstChild("Torque") then

			v:FindFirstChild("Torque"):Destroy()

		end

		v.CanCollide = false

		local Torque = Instance.new("Torque", v)

		Torque.Torque = Vector3.new(100000, 100000, 100000)

		local AlignPosition = Instance.new("AlignPosition", v)

		local Attachment2 = Instance.new("Attachment", v)

		Torque.Attachment0 = Attachment2

		AlignPosition.MaxForce = math.huge

		AlignPosition.MaxVelocity = math.huge

		AlignPosition.Responsiveness = 200

		AlignPosition.Attachment0 = Attachment2

		AlignPosition.Attachment1 = Attachment1

	end

end

local blackHoleActive = false

local DescendantAddedConnection

local function toggleBlackHole()

	blackHoleActive = not blackHoleActive

	if blackHoleActive then

		Button.Text = "Bring Parts | On"

		for _, v in ipairs(Workspace:GetDescendants()) do

			ForcePart(v)

		end

		DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v)

			if blackHoleActive then

				ForcePart(v)

			end

		end)

		spawn(function()

			while blackHoleActive and RunService.RenderStepped:Wait() do

				Attachment1.WorldCFrame = humanoidRootPart.CFrame

			end

		end)

	else

		Button.Text = "Bring Parts | Off"

		if DescendantAddedConnection then

			DescendantAddedConnection:Disconnect()

		end

	end

end

local function getPlayer(name)

	local lowerName = string.lower(name)

	for _, p in pairs(Players:GetPlayers()) do

		local lowerPlayer = string.lower(p.Name)

		if string.find(lowerPlayer, lowerName) then

			return p

		elseif string.find(string.lower(p.DisplayName), lowerName) then

			return p

		end

	end

end

local player = nil

local function VDOYZQL_fake_script() -- Box.Script 

	local script = Instance.new('Script', Box)

	script.Parent.FocusLost:Connect(function(enterPressed)

		if enterPressed then

			player = getPlayer(Box.Text)

			if player then

				Box.Text = player.Name

				print("Player found:", player.Name)

			else

				print("Player not found")

			end

		end

	end)

end

coroutine.wrap(VDOYZQL_fake_script)()

local function JUBNQKI_fake_script() -- Button.Script 

	local script = Instance.new('Script', Button)

	script.Parent.MouseButton1Click:Connect(function()

		if player then

			character = player.Character or player.CharacterAdded:Wait()

			humanoidRootPart = character:WaitForChild("HumanoidRootPart")

			toggleBlackHole()

		else

			print("Player is not selected")

		end

	end)

end

coroutine.wrap(JUBNQKI_fake_script)()

    end

})

TrollTab:AddSection({ "Invisible" })

TrollTab:AddButton({

    Name = "Become Invisible",

    Description = "Become invisible FE",

Callback = function()

        

        local args = {

    [1] = {

        [1] = 102344834840946,

        [2] = 70400527171038,

        [3] = 0,

        [4] = 0,

        [5] = 0,

        [6] = 0

    }

}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeCharacterBody"):InvokeServer(unpack(args))

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(111858803548721)

local allaccessories = {}

for zxcwefwfecas, xcaefwefas in ipairs({

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.BackAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.FaceAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.FrontAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.NeckAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.HatAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.HairAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.ShouldersAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.WaistAccessory,

    game.Players.LocalPlayer.Character.Humanoid.HumanoidDescription.GraphicTShirt

}) do

    for scacvdfbdb in string.gmatch(xcaefwefas, "%d+") do

        table.insert(allaccessories, tonumber(scacvdfbdb))

    end

end

wait()

for asdwr,asderg in ipairs(allaccessories) do

    task.spawn(function()

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Wear"):InvokeServer(asderg)

        print(asderg)

    end)

end

    end

})

TrollTab:AddSection({ "RGB Avatar" })

local colors = { "Bright red", "Lime green", "Bright blue", "Bright yellow", "Bright cyan", "Hot pink", "Royal purple" }

local rgbEnabled = false

local function changeColor(color)

    local args = { color }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(args))

end

local function toggleRGBCharacter(enabled)

    rgbEnabled = enabled

    if rgbEnabled then

        while rgbEnabled do

            for _, color in ipairs(colors) do

                if not rgbEnabled then return end

                changeColor(color)

                wait(0.5)

            end

        end

    end

end

TrollTab:AddToggle({

    Name = "RGB Character",

    Description = "Makes your character RGB",

    Default = false,

    Callback = function(value)

        toggleRGBCharacter(value)

    end

})

TrollTab:AddSection({ "RGB Hair" })

local hairColors = {

    Color3.new(1, 1, 0), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 1),

    Color3.new(0, 1, 0), Color3.new(0.5, 0, 1), Color3.new(1, 0.647, 0), Color3.new(0, 1, 1)

}

local isActive = false

local function changeHairColor()

    local i = 1

    while isActive do

        if not isActive then break end

        local args = { [1] = "ChangeHairColor2", [2] = hairColors[i] }

        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Max1y"):FireServer(unpack(args))

        wait(0.1)

        i = i % #hairColors + 1

    end

end

TrollTab:AddToggle({

    Name = "RGB Hair",

    Description = "Makes your hair RGB",

    Default = false,

    Callback = function(value)

        isActive = value

        if isActive then

            changeHairColor()

        end

    end

})

-- Tab 4: Anti Sit

TrollTab:AddSection({ "Anti Sit" })

TrollTab:AddToggle({

    Name = "Anti Sit",

    Description = "Prevents your character from sitting",

    Default = false,

    Callback = function(Value)

        local player = game.Players.LocalPlayer

        local connections = {}

        local runService = game:GetService("RunService")

        local function preventSitting(humanoid)

            if humanoid then

                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                local sitConnection = humanoid.StateChanged:Connect(function(_, newState)

                    if newState == Enum.HumanoidStateType.Seated then

                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

                    end

                end)

                table.insert(connections, sitConnection)

            end

        end

        local function monitorCharacter()

            local function onCharacterAdded(character)

                local humanoid = character:WaitForChild("Humanoid")

                preventSitting(humanoid)

            end

            local characterAddedConnection = player.CharacterAdded:Connect(onCharacterAdded)

            table.insert(connections, characterAddedConnection)

            if player.Character then

                onCharacterAdded(player.Character)

            end

        end

        local function resetSitting()

            for _, connection in ipairs(connections) do

                connection:Disconnect()

            end

            connections = {}

            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

            if humanoid then

                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)

            end

        end

        if Value then

            monitorCharacter()

            local heartbeatConnection = runService.Heartbeat:Connect(function()

                local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

                if humanoid then

                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                end

            end)

            table.insert(connections, heartbeatConnection)

        else

            resetSitting()

        end

    end

})

local Troll = Window:MakeTab({ Title = "Troll Players", Icon = "rbxassetid://131153193945220" })

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local VirtualInputManager = game:GetService("VirtualInputManager")

local RunService = game:GetService("RunService")

local cam = workspace.CurrentCamera

local selectedPlayerName = nil

local methodKill = nil

getgenv().Target = nil

local Character = LocalPlayer.Character

local Humanoid = Character and Character:WaitForChild("Humanoid")

local RootPart = Character and Character:WaitForChild("HumanoidRootPart")

-- Function to clean up the couch

local function cleanupCouch()

    l