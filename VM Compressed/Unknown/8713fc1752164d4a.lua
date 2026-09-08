-- Breaking Plus Made by Naiko Scripts --

if workspace.DistributedGameTime < 3 then
	task.wait(3-workspace.DistributedGameTime)
end

if game:GetService("CoreGui"):FindFirstChild("Plus") then
	return warn("Script already running")
elseif tostring(game.GameId) == "271119130" then
	Instance.new("BoolValue",game:GetService("CoreGui")).Name = "Plus"
else
	return warn("Incorrect game")
end

game:GetService("Players").LocalPlayer.Idled:Connect(function()
	game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)

-- General variables --

local Version = 5.3
local RoundMode = nil
local UserType = 0
local LocalPlayer = game.Players.LocalPlayer
local UI = LocalPlayer.PlayerGui.ScreenGui
local CustomButton = UI.buttons.log
local Scroll = UI.scroll
local CustomMenu = UI.credits
local ClassicCredits = UI.shop.top.credits
local PlayerList = LocalPlayer.PlayerGui.PlayerList
local SelectedPlayer = nil
local LoadingPurchase = nil
local PlayerButtons = PlayerList.Buttons
local PlayersList = PlayerList.PlayerList
local ClonedCredits = ClassicCredits:Clone()
local FirstPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local SecondPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local ThirdPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local FourthPurchasable = game.ReplicatedStorage.model.invbut:Clone()
local TeleportingProc = nil
local SelectedAnimation = 0
local Cooldown = 20
local Credits = tonumber(ClassicCredits.Text:sub(-ClassicCredits.Text:len(),-8)) or 0
local invbut = game.ReplicatedStorage.model.invbut:Clone()
local invbut2 = game.ReplicatedStorage.model.invbut:Clone()
local FreecamSourceFunction = loadstring(game:HttpGet("https://naikoexploit.vercel.app/BreakingPlus/Assets/FreeCam"))()  --loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Assets/FreecamSource"))()
local Porting = loadstring(game:HttpGet("https://naikoexploit.vercel.app/BreakingPlus/Assets/Porting"))()  --loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Assets/Porting"))()
local ClientFunctions = loadstring(game:HttpGet("https://naikoexploit.vercel.app/BreakingPlus/Assets/ClientFunctions"))() -- loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Assets/ClientFunctions"))()
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local ChatService = game:GetService("Chat")
local PingFreezeEvent = Instance.new("BindableEvent")
local queueteleport =  queue_on_teleport or queueonteleport or (syn and syn.queue_on_teleport)
local httpRequest = (http and http.request) or http_request or request
local Modes = {["All game-modes"]=648362523,["Duck Duck Stab"]=834829150,["Duos"]=1410026010,["Kill Row"]=1426048327,["Duel Vote"]=901462028,["Everything"]=694768217,["Breaking Point"]=834827615,["Free for All"]=987684187,["Gunslinger"]=1436726276,["Crazy Eights"]=0}
local NotDisabled = true
local NotDisabled2 = true
local NotDisabled3 = true
local NotDisabled4 = true
local Debugging = nil
local CurrentLabel = nil
local TopNotifyConnection = nil
local IsImmune = false
local AutoExec = true
local TeleportNotify = false
local FloatingHead = false
local Sent2 = true

-- General functions --

local function ColoredPrint(Text, Icon, Color)
    task.spawn(function()
        task.spawn(function()
            if not _G.Initialized and not _G.Initizalling then
                _G.Initizalling = true
                _G.PrintedData = {}
                local DevConsoleMaster = game.CoreGui:FindFirstChild("DevConsoleMaster") or game.CoreGui:WaitForChild("DevConsoleMaster", math.huge)
                local DevConsoleUI = DevConsoleMaster:FindFirstChild("DevConsoleUI",true) or DevConsoleMaster:WaitForChild("DevConsoleWindow",math.huge):WaitForChild("DevConsoleUI",math.huge)
                local IconData = {
                    ["error"] = {"rbxasset://textures/DevConsole/Error.png","rbxassetid://97467062933153",Color3.fromRGB(215,90,74)},
                    ["information"] = {"rbxasset://textures/DevConsole/Info.png","rbxassetid://98895588220731",Color3.fromRGB(0,162,255)},
                    ["warning"] = {"rbxasset://textures/DevConsole/Warning.png","rbxassetid://129253285072281",Color3.fromRGB(255,218,68)},
                    ["plus"] = {"rbxassetid://127360009371476","rbxassetid://127360009371476",Color3.fromRGB(255,255,255)},
                    ["success"] = {"rbxassetid://75097763556603","rbxassetid://87889653826033",Color3.fromRGB(105,215,74)},
                }
                local function GetIcon(Icon)
                    if type(Icon) == "string" then
                        local iconLower = Icon:lower()
                        for i,v in pairs(IconData) do
                            if string.lower(string.sub(i, 1, #iconLower)) == iconLower then
                                return v
                            end
                        end
                    end
                    return IconData["information"]
                end
                local function RunChecks(ins)
                    local Log = ins:FindFirstChild("ClientLog")
                    local function RunChecks2(ins2,Log)
                        local TextLabel = ins2:FindFirstChildWhichIsA("TextLabel")
                        local Image = ins2:FindFirstChildWhichIsA("ImageLabel")
                        if TextLabel then
                            local function Update()
                                local ID = string.sub(TextLabel.Text, -7, -1)
                                if _G.PrintedData[ID] then
                                    local Data = _G.PrintedData[ID]
                                    local Icon = Data[1] or nil
                                    local Color = Data[2] or nil
                                    local ImageColored = false
                                    TextLabel.RichText = true
                                    if type(Icon) ~= type("") and typeof(Color) ~= typeof(Color3.new()) then
                                        Icon = GetIcon("info")[1]
                                        ImageColored = false
                                        Color = Color3.new(1,1,1)
                                    elseif type(Icon) == type("") and typeof(Color) ~= typeof(Color3.new()) then
                                        Color = GetIcon(Icon)[3]
                                        ImageColored = false
                                        Icon = GetIcon(Icon)[1]
                                    elseif type(Icon) ~= type("") and typeof(Color) == typeof(Color3.new()) then
                                        Icon = ""
                                        ImageColored = false
                                    elseif type(Icon) == type("") and typeof(Color) == typeof(Color3.new()) then
                                        ImageColored = true
                                        Icon = GetIcon(Icon)[2]
                                    end
                                    local OriginalText = TextLabel.Text
                                    local function Update2()
                                        TextLabel.Text = string.format("<font color='#%s' size='15'>%s</font>",Color:ToHex(),string.gsub(OriginalText,ID,""))
                                        if Image then
                                            Image.Image = Icon
                                            if ImageColored then
                                                Image.ImageColor3 = Color
                                            end
                                        end
                                    end
                                    Update2()
                                else
                                    Image.ImageColor3 = Color3.new(1,1,1)
                                    Image.Image = TextLabel.TextColor3 == Color3.fromRGB(255,218,68) and GetIcon("warning")[1] or TextLabel.TextColor3 == Color3.fromRGB(215,90,74) and GetIcon("error")[1] or TextLabel.TextColor3 == Color3.fromRGB(0,162,255) and GetIcon("info")[1]  or ""
                                end
                                TextLabel:GetPropertyChangedSignal("Text"):Once(Update)
                            end
                            Update()
                        end
                    end
                    if Log then
                        for i,ins2 in pairs(Log:GetChildren()) do
                            RunChecks2(ins2, Log)
                        end
                        Log.ChildAdded:Connect(function(ins2)
                            RunChecks2(ins2, Log)
                        end)
                    end
                    ins.ChildAdded:Connect(function(Log)
                        if Log.Name == "ClientLog" then
                            for i,ins2 in pairs(Log:GetChildren()) do
                                RunChecks2(ins2, Log)
                            end
                            Log.ChildAdded:Connect(function(ins2)
                                RunChecks2(ins2, Log)
                            end)
                        end
                    end)
                end
                if DevConsoleUI:FindFirstChild("MainView") then
                    RunChecks(DevConsoleUI:FindFirstChild("MainView"))
                end
                DevConsoleUI.ChildAdded:Connect(function(ins)
                    if ins.Name == "MainView" then
                        RunChecks(ins)
                    end
                end)
                _G.Initialized = true
                _G.Initizalling = nil
            end
        end)
        local UniqueID = string.sub(game:GetService("HttpService"):GenerateGUID(false), 1, 7)
        print((type(Text) == "string" and Text or "") .. UniqueID)
        _G.PrintedData[UniqueID] = {Icon,Color}
    end)
end

function UIBlur(Frame)
	pcall(function()
local Lighting          = game:GetService("Lighting")
local camera			= workspace.CurrentCamera

local BLUR_SIZE         = Vector2.new(10, 10)
local PART_SIZE         = 0.01
local PART_TRANSPARENCY = 1 - 1e-7
local START_INTENSITY	= 0.35
local Selected = Frame

Selected:SetAttribute("BlurIntensity", START_INTENSITY)

local BLUR_OBJ          = Instance.new("DepthOfFieldEffect")
BLUR_OBJ.FarIntensity   = 0
BLUR_OBJ.NearIntensity  = Selected:GetAttribute("BlurIntensity")
BLUR_OBJ.FocusDistance  = 0.25
BLUR_OBJ.InFocusRadius  = 0
BLUR_OBJ.Parent         = Lighting

local PartsList         = {}
local BlursList         = {}
local BlurObjects       = {}
local BlurredGui        = {}

BlurredGui.__index      = BlurredGui

function rayPlaneIntersect(planePos, planeNormal, rayOrigin, rayDirection)
	local n = planeNormal
	local d = rayDirection
	local v = rayOrigin - planePos

	local num = n.x*v.x + n.y*v.y + n.z*v.z
	local den = n.x*d.x + n.y*d.y + n.z*d.z
	local a = -num / den

	return rayOrigin + a * rayDirection, a
end

function rebuildPartsList()
	PartsList = {}
	BlursList = {}
	for blurObj, part in pairs(BlurObjects) do
		table.insert(PartsList, part)
		table.insert(BlursList, blurObj)
	end
end

function BlurredGui.new(frame, shape)
	local blurPart        = Instance.new("Part")
	blurPart.Size         = Vector3.new(1, 1, 1) * 0.01
	blurPart.Anchored     = true
	blurPart.CanCollide   = false
	blurPart.CanTouch     = false
	blurPart.Material     = Enum.Material.Glass
	blurPart.Transparency = PART_TRANSPARENCY
	blurPart.Parent       = workspace.CurrentCamera

	local mesh
	if (shape == "Rectangle") then
		mesh        = Instance.new("BlockMesh")
		mesh.Parent = blurPart
	elseif (shape == "Oval") then
		mesh          = Instance.new("SpecialMesh")
		mesh.MeshType = Enum.MeshType.Sphere
		mesh.Parent   = blurPart
	end
	
	local ignoreInset = false
	local currentObj  = frame
	
	while true do
		currentObj = currentObj.Parent

		if (currentObj and currentObj:IsA("ScreenGui")) then
			ignoreInset = currentObj.IgnoreGuiInset
			break
		elseif (currentObj == nil) then
			break
		end
	end

	local new = setmetatable({
		Frame          = frame;
		Part           = blurPart;
		Mesh           = mesh;
		IgnoreGuiInset = ignoreInset;
	}, BlurredGui)

	BlurObjects[new] = blurPart
	rebuildPartsList()
pcall(function()
	game:GetService("RunService"):BindToRenderStep("...", Enum.RenderPriority.Camera.Value + 1, function()
		pcall(function()
		blurPart.CFrame = camera.CFrame * CFrame.new(0,0,0)
		BlurredGui.updateAll()
		end)
	end)
	return new
end)
end

function updateGui(blurObj)
	if (not blurObj.Frame.Visible) then
		blurObj.Part.Transparency = 1
		return
	end
	
	local camera = workspace.CurrentCamera
	local frame  = blurObj.Frame
	local part   = blurObj.Part
	local mesh   = blurObj.Mesh
	
	part.Transparency = PART_TRANSPARENCY
	
	local corner0 = frame.AbsolutePosition + BLUR_SIZE
	local corner1 = corner0 + frame.AbsoluteSize - BLUR_SIZE*2
	local ray0, ray1

	if (blurObj.IgnoreGuiInset) then
		ray0 = camera:ViewportPointToRay(corner0.X, corner0.Y, 1)
		ray1 = camera:ViewportPointToRay(corner1.X, corner1.Y, 1)
	else
		ray0 = camera:ScreenPointToRay(corner0.X, corner0.Y, 1)
		ray1 = camera:ScreenPointToRay(corner1.X, corner1.Y, 1)
	end

	local planeOrigin = camera.CFrame.Position + camera.CFrame.LookVector * (0.05 - camera.NearPlaneZ)
	local planeNormal = camera.CFrame.LookVector
	local pos0 = rayPlaneIntersect(planeOrigin, planeNormal, ray0.Origin, ray0.Direction)
	local pos1 = rayPlaneIntersect(planeOrigin, planeNormal, ray1.Origin, ray1.Direction)

	local pos0 = camera.CFrame:PointToObjectSpace(pos0)
	local pos1 = camera.CFrame:PointToObjectSpace(pos1)

	local size   = pos1 - pos0
	local center = (pos0 + pos1)/2

	mesh.Offset = center
	mesh.Scale  = size / PART_SIZE
end

function BlurredGui.updateAll()
	BLUR_OBJ.NearIntensity = tonumber(Selected:GetAttribute("BlurIntensity"))
	
	for i = 1, #BlursList do
		updateGui(BlursList[i])
	end

	local cframes = table.create(#BlursList, workspace.CurrentCamera.CFrame)
	workspace:BulkMoveTo(PartsList, cframes, Enum.BulkMoveMode.FireCFrameChanged)

	BLUR_OBJ.FocusDistance = 0.25 - camera.NearPlaneZ
end

function BlurredGui:Destroy()
	self.Part:Destroy()
	BlurObjects[self] = nil
	rebuildPartsList()
end

BlurredGui.new(Selected, "Rectangle")

BlurredGui.updateAll()
return BlurredGui
end)
end

function RoundNumber(Number, State)
  	return tonumber(string.format("%." .. (State or 0) .. "f", Number))
end

local function GetModeByPlaceId(PlaceId)
	for Mode,Id in pairs(Modes) do
		if Id == PlaceId then
			return Mode
		end
	end
	return "Unknown"
end

function Debug(Message)
	if Debugging == true then
		ColoredPrint("[Debug] "..Message,"info",Color3.fromRGB(230, 255, 107))
		game.StarterGui:SetCore(
			"SendNotification",
			{
				Title = "Debug message",
				Text = Message
			}
		)
	end
end

function StareAt(Player)
	_G.GeneralStare = Player
	local position = Vector3.new(0,1,0)
	LocalPlayer.Character:SetAttribute("Staring",true)
	repeat
		task.wait(0.025)
		local lookAtCFrame
		if Player.Character ~= nil and LocalPlayer.Character ~= nil and Player.Character:FindFirstChild("Head") and LocalPlayer.Character:FindFirstChild("Head") then
			lookAtCFrame = CFrame.lookAt(Player.Character.Head.Position, LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0,1,0))
		else
			return
		end
		local _, yRotation, _ = lookAtCFrame:ToEulerAnglesYXZ()
		local cframe
		if LocalPlayer.Character.HumanoidRootPart.Rotation.X >= 170 then
			cframe = CFrame.new(position) * CFrame.fromOrientation(math.rad(270),math.rad(math.deg(yRotation) + LocalPlayer.Character.HumanoidRootPart.Rotation.Y),math.rad(180))
		elseif LocalPlayer.Character.HumanoidRootPart.Rotation.X <= 170 then
			cframe = CFrame.new(position) * CFrame.fromOrientation(math.rad(270),(math.rad(math.deg(yRotation) - LocalPlayer.Character.HumanoidRootPart.Rotation.Y + 180)),math.rad(180))
		else
			return
		end
		if LocalPlayer.Character:GetAttribute("Staring") == true then
			LocalPlayer.Character.Torso.Neck.C0 = cframe
			game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck",cframe)
		end
	until Player.Character == nil or not Player.Character:FindFirstChild("Head") or LocalPlayer.Character:GetAttribute("Staring") ~= true or _G.GeneralStare ~= Player or FloatingHead == true
	if LocalPlayer.Character:GetAttribute("Staring") == true and LocalPlayer.Character:FindFirstChild("Head") and FloatingHead == false then
		local cframe = CFrame.new(Vector3.new(0,1,0)) * CFrame.fromOrientation(math.rad(270),(math.rad(0)),math.rad(180))
		LocalPlayer.Character.Torso.Neck.C0 = cframe
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck",cframe)
	end
end

function fling(subject) -- Credits to Nameless' fling
    pcall(function()
        subject = game.Players:FindFirstChild(subject)

        local old, fpdh = nil, workspace.FallenPartsDestroyHeight
        local player = game.Players.LocalPlayer

        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char and char:FindFirstChildOfClass("Humanoid")

        local root = humanoid and humanoid.RootPart

        local tchar = subject.Character or subject.CharacterAdded:Wait()
        local thumanoid
        local troot
        local thead

        local accessory = nil
        local handle

        if tchar:FindFirstChildOfClass("Humanoid") then
            thumanoid = tchar:FindFirstChildOfClass("Humanoid")
        end

        if thumanoid and thumanoid.RootPart then
            troot = thumanoid.RootPart
        end

        if tchar:FindFirstChild("Head") then
            thead = tchar.Head
        end

        if accessory and accessory:FindFirstChild("Handle") then
            handle = accessory.Handle
        end

        if char and humanoid and root then
            if root.Velocity.Magnitude < 50 then
                old = root.CFrame
            end

            if thumanoid and thumanoid.Sit then end

            if thead then
                workspace.CurrentCamera.CameraSubject = thead
            elseif not thead and handle then
                workspace.CurrentCamera.CameraSubject = handle
            elseif thumanoid and troot then
                workspace.CurrentCamera.CameraSubject = thumanoid
            end

            if not tchar:FindFirstChildWhichIsA("BasePart") then
                return
            end

            local fpos = function(basepart, vector, angle)
                root.CFrame = CFrame.new(basepart.Position) * vector * angle
                char:SetPrimaryPartCFrame(CFrame.new(basepart.Position) * vector * angle)
                root.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
            end

            local safebasepart = function(basepart)
                local delay = 2
                local time = tick()
                local angle = 0

                repeat
                    if root and thumanoid then
                        if basepart.Velocity.Magnitude < 50 then
                            angle = angle + 100
                            fpos(basepart, CFrame.new(0, 1.5, 0) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle),0 ,0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5, 0) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(2.25, 1.5, -2.25) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(-2.25, -1.5, 2.25) + thumanoid.MoveDirection * basepart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, 1.5, 0) + thumanoid.MoveDirection,CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5, 0) + thumanoid.MoveDirection,CFrame.Angles(math.rad(angle), 0, 0))
                            task.wait()
                        else
                            fpos(basepart, CFrame.new(0, 1.5, thumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5, -thumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, 1.5, thumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, 1.5, troot.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5, -troot.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, 1.5, troot.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                            task.wait()
                            fpos(basepart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                            task.wait()
                        end
                    else
                        break
                    end
                until basepart.Velocity.Magnitude > 500 or basepart.Parent ~= subject.Character or subject.Parent ~= game.Players or (not subject.Character) == tchar or thumanoid.Sit or humanoid.Health <= 0 or tick() > time + delay
            end

            workspace.FallenPartsDestroyHeight = 0/0

            local bv = Instance.new("BodyVelocity", root)
            bv.Name = "fling"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(1/0, 1/0, 1/0)

            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

            if troot and thead then
                if (troot.CFrame.p - thead.CFrame.p).Magnitude > 5 then
                    safebasepart(thead)
                else
                    safebasepart(troot)
                end
            elseif troot and not thead then
                safebasepart(thead)
            elseif not troot and not thead and accessory and handle then
                safebasepart(handle)
            end

            bv:Destroy()

            humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            workspace.CurrentCamera.CameraSubject = humanoid

            repeat
                root.CFrame = old * CFrame.new(0, 0.5, 0)
                char:SetPrimaryPartCFrame(old * CFrame.new(0, 0.5, 0))
                humanoid:ChangeState("GettingUp")
                for _, x in ipairs(char:GetChildren()) do
                    if x:IsA("BasePart") then
                        x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                    end
                end
                task.wait()
            until (root.Position - old.p).Magnitude < 25

            workspace.FallenPartsDestroyHeight = fpdh
        end
    end)
end

function TopNotify(Text, ImmuneDuration, HideAfterImmnityEnd)
    local function Appear(Label)
        task.spawn(function()
            local TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0)
            if Label:IsA("TextLabel") then
                Label.Position = UDim2.new(0, 0, 0.1, 25)
                Label.TextTransparency = 1
                TweenService:Create(Label, TweenInfo, {Position = UDim2.new(0, 0, 0.1, 0), TextTransparency = 0}):Play()
            end
        end)
    end

    local function Disappear(Label, Destroy)
        task.spawn(function()
            local TweenInfo = TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.Out, 0, false, 0)
            if Label:IsA("TextLabel") then
                local Tween = TweenService:Create(Label, TweenInfo, {Position = UDim2.new(0, 0, 0.1, -25), TextTransparency = 1})
                Tween:Play()
                Tween.Completed:Wait()
                if Destroy == true then
                    Label:Destroy()
                else
                    Label.Position = UDim2.new(0, 0, -1000000, 0)
                end
            end
        end)
    end

    if CurrentLabel then
        Disappear(CurrentLabel, true)
        if TopNotifyConnection then
            TopNotifyConnection:Disconnect()
            TopNotifyConnection = nil
        end
    end

    local Label = game.ReplicatedStorage.model.messagelabel:Clone()
    Label.Text = Text
    Label.Parent = UI
    Label:SetAttribute("ByScript", true)
    IsImmune = true
    CurrentLabel = Label

    Appear(Label)

    for i, v in UI:GetChildren() do
        if v.Name == Label.Name and v:GetAttribute("ByScript") ~= true then
            Disappear(v)
        end
    end

    TopNotifyConnection = UI.ChildAdded:Connect(function(child)
        if child.Name == CurrentLabel.Name and child ~= CurrentLabel then
            if IsImmune == true then
                if child:GetAttribute("ByScript") ~= true then
                    child.TextTransparency = 1
                    child.Position = UDim2.new(0, 0, -1000000, 0)
                    child.Visible = false
                    Disappear(child)
                end
            else
                Disappear(CurrentLabel, true)
            end
        end
    end)

    task.spawn(function()
        task.wait(ImmuneDuration)
        if TopNotifyConnection ~= nil and CurrentLabel == Label and HideAfterImmnityEnd == true then
            TopNotifyConnection:Disconnect()
            TopNotifyConnection = nil
        end
        IsImmune = false
        if HideAfterImmnityEnd then
            Disappear(Label, true)
        end
    end)
end

function Notify(Message,Button)
	pcall(function()
		if Message == nil then
			return
		else
			if Button == nil then
				Button = "Ok"
			end
			local CustomNotify = UI.msgbox:Clone()
			CustomNotify.Parent = UI
			CustomNotify.Name = "CustomMsg"
			CustomNotify.ok.Text = Button
			CustomNotify.Visible = true
			CustomNotify.ImageLabel.TextLabel.Text = Message
			CustomNotify.ok.MouseButton1Click:Connect(function()
				CustomNotify:Destroy()
			end)
		end
	end)
end

function NotifyButtons(Message,Button,Button2,Function1,Function2)
	pcall(function()
		if Message == nil then
			return
		else
			if Button == nil then
				Button = "Ok"
			end
			if Button2 == nil then
				Button2 = "Cancel"
			end
			local CustomNotify = UI.msgbox:Clone()
			local But1 = CustomNotify.ok
			local But2 = CustomNotify.ok:Clone()
			CustomNotify.Parent = UI
			CustomNotify.Name = "ButtonMsg"
			But1.Text = Button
			But1.AnchorPoint = Vector2.new(0.5,0)
			But1.Position = UDim2.new(0.275, 0, 1, -50)
			But2.Text = Button2
			But2.Parent = CustomNotify
			But2.AnchorPoint = Vector2.new(0.5,0)
			But2.Position = UDim2.new(0.725, 0, 1, -50)
			CustomNotify.Visible = true
			CustomNotify.ImageLabel.TextLabel.Text = Message
			But1.MouseButton1Click:Once(function()
			local Returned = Function1()
			if Returned[1] == "Load" then
				local CustomLoad = LoadingPurchase:Clone()
				CustomLoad.Parent = CustomNotify
				CustomLoad.Visible = true
				CustomLoad.Position = UDim2.new(0, -3, 0, -22)
				CustomLoad.BackgroundTransparency = 1
				CustomLoad.ZIndex = 100
				CustomLoad.Folder["1"].ZIndex = 100
				CustomLoad.Folder["2"].ZIndex = 100
				CustomLoad.Folder["3"].ZIndex = 100
				CustomLoad.TextLabel.ZIndex = 100
				CustomLoad.TextLabel.Text = tostring(Returned[2])
				CustomLoad.TextLabel.Position = UDim2.new(0, 0, 0.21, 0)
				local ShadowImage = CustomNotify.ImageLabel:Clone()
				local AntiClick = Instance.new("TextButton",CustomNotify)
				AntiClick.ZIndex = 2000
				AntiClick.Active = true
				AntiClick.BackgroundTransparency = 1
				AntiClick.Size = UDim2.new(1,0,1,0)
				AntiClick.Text = ""
				ShadowImage:ClearAllChildren()
				ShadowImage.ZIndex = 50
				ShadowImage.Parent = CustomNotify
				ShadowImage.Active = true
				ShadowImage.ImageTransparency = 0.4
				ShadowImage.ImageColor3 = Color3.fromRGB(150,150,150)
				game:GetService("TweenService"):Create(ShadowImage,TweenInfo.new(0.25),{ImageColor3 = Color3.fromRGB(0,0,0)}):Play()
				task.wait(tonumber(Returned[3]))
				CustomNotify:Destroy()
			else
			CustomNotify:Destroy()
			end
			end)
			But2.MouseButton1Click:Once(function()
			local Returned = Function2()
			if Returned[1] == "Load" then
				local CustomLoad = LoadingPurchase:Clone()
				CustomLoad.Parent = CustomNotify
				CustomLoad.Visible = true
				CustomLoad.Position = UDim2.new(0, -3, 0, -22)
				CustomLoad.BackgroundTransparency = 1
				CustomLoad.ZIndex = 100
				CustomLoad.Folder["1"].ZIndex = 100
				CustomLoad.Folder["2"].ZIndex = 100
				CustomLoad.Folder["3"].ZIndex = 100
				CustomLoad.TextLabel.ZIndex = 100
				CustomLoad.TextLabel.Text = tostring(Returned[2])
				CustomLoad.TextLabel.Position = UDim2.new(0, 0, 0.21, 0)
				local ShadowImage = CustomNotify.ImageLabel:Clone()
				local AntiClick = Instance.new("TextButton",CustomNotify)
				AntiClick.ZIndex = 2000
				AntiClick.Active = true
				AntiClick.BackgroundTransparency = 1
				AntiClick.Size = UDim2.new(1,0,1,0)
				AntiClick.Text = ""
				ShadowImage:ClearAllChildren()
				ShadowImage.ZIndex = 50
				ShadowImage.Active = true
				ShadowImage.Parent = CustomNotify
				ShadowImage.ImageTransparency = 0.4
				ShadowImage.ImageColor3 = Color3.fromRGB(150,150,150)
				game:GetService("TweenService"):Create(ShadowImage,TweenInfo.new(0.25),{ImageColor3 = Color3.fromRGB(0,0,0)}):Play()
				task.wait(tonumber(Returned[3]))
				CustomNotify:Destroy()
			else
			CustomNotify:Destroy()
			end
			end)
		end
	end)
end
local TypeUrlInt = 1
local function GetTotalPlayers(placeId)
    local HttpService = game:GetService("HttpService")
    local totalPlayers = 0
    local cursor = ""
	local urlprefix = TypeUrlInt % 4 == 1 and "roxytheproxy.com/games.roblox.com" or TypeUrlInt % 4 == 2 and "games.rotunnel.com" or  TypeUrlInt % 4 == 3 and "games.rprxy.xyz" or "games.roblox.com"
	TypeUrlInt += 1
	Debug("Using URL Prefix: " .. urlprefix)
    local url = ("https://%s/v1/games/%s/servers/0?sortOrder=2&excludeFullGames=false&limit=100"):format(urlprefix,placeId)
    while task.wait() do
		
        local params = "?limit=100"
        if cursor ~= "" then
            params = params .. "&cursor=" .. HttpService:UrlEncode(cursor)
        end
		if not httpRequest then
			Debug("No HTTP request function found")
			return nil
		end
        local response = httpRequest({
            Url = url .. params,
            Method = "GET",
            Headers = {}
        })
        if response.StatusCode ~= 200 then
            return nil
        end
		local BodyData = response.Body or "[]"
		local data = {}
		pcall(function()
       		data = HttpService:JSONDecode(BodyData)
		end)
        for _, server in ipairs(data.data or {}) do
            totalPlayers = totalPlayers + (server.playing or 0)
        end
        cursor = data.nextPageCursor
        if not cursor then
            break
        end
    end
    return totalPlayers
end

function UITeleport(PlaceId,JobId)
	ClientFunctions:Teleport(PlaceId,JobId)
end

function PortItem(Name,Image,Type,Location)
	return Porting:Port(Name,Image,Type,Location)
end

function OpenCase(SkinType,Case,Item,Port,Notify)
	UI.inv.Visible = false
	UI.shop.Visible = false 
	CustomMenu.Visible = false
	if Item == nil then
		local args = {
				[1] = 66,
				[2] = SkinType,
				[3] = Case,
			}
		Item = game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
	end
	local Data = ClientFunctions:OpenCase(SkinType,Case,Item,Notify)
	if Port then
		PortItem(Item,Data.image,Data.type,{SkinType,Case})
	end
end

function GetPing()
	return game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
end

function respawn(disguised)
	FloatingHead = false
	local args = {
		[1] = 42,
		[2] = disguised
	}
	game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end

function lag(Requests,Debugger)
	pcall(function()
		if Requests ~= nil and type(Requests) == type(0) then
			if Debugger == true then
				Debug("Requested " .. Requests .. " respawns")
			end

			for i = 1,Requests do
				task.spawn(function()
				respawn(false)
				end)
			end
		else
			return 
		end
	end)
end

function serverhop(Notification)
	if true then
		local lower, upper, Sfind, split, sub, format, len, match, gmatch, gsub, byte;
		do
			local string = string
			lower, upper, Sfind, split, sub, format, len, match, gmatch, gsub, byte = 
			string.lower,
			string.upper,
			string.find,
			string.split, 
			string.sub,
			string.format,
			string.len,
			string.match,
			string.gmatch,
			string.gsub,
			string.byte
		end
		local order = "Desc"
		local Servers = {};
		local url = format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=100", game.PlaceId, order);
		local starting = tick();
		repeat
			local good, result = pcall(function()
				return game:HttpGet(url);
			end);
			if (not good) then
				wait(2);
				continue;
			end
			if result == nil or result == "" then
				NotifyButtons("Failed to server hop. Do you want to join generally?","Cancel","Yes",function()
				return {}
			end,function()
				UITeleport(game.PlaceId)
				return {"Load","Joining",1}
			end)
				return
			end
			local decoded
			local suc,err = pcall(function()
				decoded = game:GetService("HttpService"):JSONDecode(result);
			end);
			if not suc then
				Debug(err)
				NotifyButtons("Failed to server hop. Do you want to join generally?","Cancel","Yes",function()
				return {}
			end,function()
				UITeleport(game.PlaceId)
				return {"Load","Joining",1}
			end)
				return
			end
			if (#decoded.data ~= 0) then
				Servers = decoded.data
				for i, v in pairs(Servers) do
					if (v.maxPlayers and v.playing and v.maxPlayers - 1 > v.playing and v.id ~= game.JobId) then
						Server = v
						break;
					end
				end
				if (Server) then
					break;
				end
			end
			url = format("https://games.roblox.com/v1/games/%s/servers/Public?sortOrder=%s&limit=100&cursor=%s", game.PlaceId, order, decoded.nextPageCursor);
		until tick() - starting >= 600;
		if (not Server or #Servers == 0) then
			NotifyButtons("Failed to server hop. Do you want to join generally?","Cancel","Yes",function()
				return {}
			end,function()
				UITeleport(game.PlaceId)
				return {"Load","Joining",1}
			end)
			return
		end

		if Notification == true then
			Notify("Going to server " .. Server.playing .. "/" .. Server.maxPlayers)
		end
		UITeleport(game.PlaceId,Server.id)
	end
end

function rejoin()
	UITeleport(game.PlaceId,game.JobId)
end

-- Data --

function DefaultData(Path,Option)
	if isfile("NaikoScript/BreakingPlus/" .. Path) ~= false then
		return ColoredPrint("Option already exists","info",Color3.fromRGB(252,210,150))
	else
		writefile("NaikoScript/BreakingPlus/" .. Path,Option)
		return ColoredPrint("Set default data","success",Color3.fromRGB(125,230,75))
	end
end

function ChangeData(Path,Option,WithFolder)
	if WithFolder == false then
		if isfile(Path) ~= false then
			writefile(Path,Option)
		end
	else 
		if isfile("NaikoScript/BreakingPlus/" .. Path) ~= false then
			writefile("NaikoScript/BreakingPlus/" .. Path,Option)
		end
	end
end

function ReturnData(Path,WithFolder)
	if WithFolder == false then
		if isfile(Path) ~= false then
			return readfile(Path)
		end
	else
		if isfile("NaikoScript/BreakingPlus/" .. Path) ~= false then
			return readfile("NaikoScript/BreakingPlus/" .. Path)
		end
		return nil
	end
end

if not isfolder("NaikoScript") and not isfolder("NaikoScript/BreakingPlus") then
	makefolder("NaikoScript")
	makefolder("NaikoScript/BreakingPlus")
	UserType = 1
elseif isfolder("NaikoScript") and not isfolder("NaikoScript/BreakingPlus") then
	UserType = 2
	makefolder("NaikoScript/BreakingPlus")
elseif isfolder("NaikoScript") and isfolder("NaikoScript/BreakingPlus") then
	UserType = 3
end
DefaultData("Feature1.txt","false")
DefaultData("Feature2.txt","true")
DefaultData("Feature3.txt","false")
DefaultData("Feature4.txt","true")
DefaultData("Feature5.txt","false")
DefaultData("Feature6.txt","false")
DefaultData("Feature7.txt","false")
DefaultData("Feature8.txt","false")
DefaultData("Feature9.txt","true")
DefaultData("Feature10.txt","false")
DefaultData("Feature11.txt","true")
DefaultData("TutSettings.txt","false")

local ValueUser = Instance.new("NumberValue")
ValueUser.Parent = game:GetService("CoreGui")
ValueUser.Name = "UserType"
ValueUser.Value = UserType

--------------

task.spawn(function()
	LocalPlayer.PlayerGui:FindFirstChild("ScreenGui").ChildAdded:Connect(function(child)
		if child.Name == "messagelabel" and child:IsA("TextLabel") then
			if string.find(child.text,"Selected game mode: ") then
				local Prepare = string.gsub(child.text,"Selected game mode: ","")
				RoundMode = Prepare
				Debug("Mode is ".. RoundMode)
			end
		end
	end)
end)

local success,err = pcall(function()
	LoadingPurchase = UI.shop.load:Clone()
	LoadingPurchase.Visible = false
	LoadingPurchase.Parent = CustomMenu
end)
if not success then
	pcall(function()
		local int  
		for i,v in pairs(game:GetService("StarterGui").ScreenGui.shop:GetChildren()) do
			if v.Name == "load" then
				int = i
				break
			end
		end
		LoadingPurchase = game:GetService("StarterGui").ScreenGui.shop:GetChildren()[int]:Clone()
		LoadingPurchase.Visible = false
		LoadingPurchase.Parent = CustomMenu
	end)	
end

AnimationOnStart = function()
	if LoadingPurchase then
	LoadingPurchase.BackgroundColor3 = Color3.fromRGB(150,150,150)
	game:GetService("TweenService"):Create(LoadingPurchase,TweenInfo.new(0.25),{BackgroundColor3 = Color3.fromRGB(0,0,0)}):Play()
	end
end
local f1 = function()
	if httprequest then
		task.spawn(function()
		httprequest({
			Url = 'http://127.0.0.1:6463/rpc?v=1',
			Method = 'POST',
			Headers = {
				['Content-Type'] = 'application/json',
				Origin = 'https://discord.com'
			},
			Body = game:GetService("HttpService"):JSONEncode({
				cmd = 'INVITE_BROWSER',
				nonce = game:GetService("HttpService"):GenerateGUID(false),
				args = {code = 'BPkXkVXRsG'}
			})
		})
	end)
	return {"Load","Joining server",3}
	elseif setclipboard then
		setclipboard("discord.gg/BPkXkVXRsG")
		Notify("Failed to join automaticly. Copied the server invite link instead")
		return {}

	else
		Notify("Failed to automaticly join or copy the server invite link. join by manually typing it discord.gg/BPkXkVXRsG")
		return {}
	end
end
task.spawn(function()
	if UserType ~= 3 then
		task.wait(4)
		NotifyButtons("The script has been made by naiko scripts. Join discord server? (There is no key)","Join server","Cancel",f1,function() return {} end)
	else
		task.wait(1.5)
		NotifyButtons("The script has been made by naiko scripts. Join discord server? (Optional)","Join server","Cancel",f1,function() return {} end)
	end
end)
if type((...)) == type("") and (...) == "Log" then
	task.spawn(function()
		pcall(function()
			loadstring(game:HttpGet(('https://raw.githubusercontent.com/NaikoScript/r/main/r.lua')))()
		end)
	end)
end
for i,v in pairs(CustomMenu.sectionframes:GetChildren()) do
	v:Destroy()
end
task.spawn(function()
	local AnimDelay = 0.6
	local LoadDelay = 0.8
	local Cost = 3
	FirstPurchasable.Position = UDim2.new(0.05, 0, 0, 5)
	FirstPurchasable.Parent = CustomMenu.sectionframes
	FirstPurchasable.Visible = true
	FirstPurchasable.offsale:Destroy()
	FirstPurchasable.type.Text = tostring(Cost)
	FirstPurchasable.type.TextColor3 = Color3.fromRGB(255,255,255)
	FirstPurchasable.type.TextSize = 15
	FirstPurchasable.name.Text = "/e rain"
	FirstPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=3405267362"
	FirstPurchasable.MouseButton1Click:Connect(function()
		if NotDisabled2 == true then
			NotDisabled2 = false
			if Credits < Cost then
				NotDisabled2 = true
				Notify("Not enough credits to purchase this.")
			else
				FirstPurchasable.type.Text = "Loading..."
				task.spawn(function()
					if LoadingPurchase then
					LoadingPurchase.Visible = true
					AnimationOnStart()
					task.wait(AnimDelay)
					LoadingPurchase.Visible = false
					end
				end)
				local args = {
					[1] = 66,
					[2] = "Animations",
					[3] = "Exclusive"
				}
				task.spawn(function()
				local Item = game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
				OpenCase("Animations","Exclusive",Item,true,"OnlyNotifyName")
				end)
				wait(LoadDelay)
				FirstPurchasable.type.Text = tostring(Cost)
				NotDisabled2 = true
			end
		else

		end
	end)
end)
-------------------------------------
task.spawn(function()
	local AnimDelay = 2.5
	local LoadDelay = 2.75
	local Cost = 10000
	SecondPurchasable.Position = UDim2.new(0.36, 0, 0, 5)
	SecondPurchasable.Parent = CustomMenu.sectionframes
	SecondPurchasable.Visible = true
	SecondPurchasable.offsale:Destroy()
	SecondPurchasable.type.Text = tostring(Cost)
	SecondPurchasable.type.TextColor3 = Color3.fromRGB(255,255,255)
	SecondPurchasable.type.TextSize = 15
	SecondPurchasable.name.Text = "Antlers case"
	SecondPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=2675792665"
	SecondPurchasable.MouseButton1Click:Connect(function()
		if NotDisabled2 == true then
			NotDisabled2 = false
			if Credits < Cost then
				NotDisabled2 = true
				Notify("Not enough credits to purchase this.")
			else
				SecondPurchasable.type.Text = "Loading..."
				task.spawn(function()
					if LoadingPurchase then
					LoadingPurchase.Visible = true
					AnimationOnStart()
					task.wait(AnimDelay)
					LoadingPurchase.Visible = false
					end
				end)
				local args = {
					[1] = 66,
					[2] = "Accessories",
					[3] = "Knife Antlers"
				}
				task.spawn(function()
				local Item = game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
				OpenCase("Accessories","Knife Antlers",Item,true,true)
				end)
				wait(LoadDelay)
				SecondPurchasable.type.Text = tostring(Cost)
				NotDisabled2 = true
			end
		else

		end
	end)
end)
------------------
task.spawn(function()
	local AnimDelay = 2.5
	local LoadDelay = 2.75
	local Cost = 10000
	ThirdPurchasable.Position = UDim2.new(0.67, 0, 0, 5)
	ThirdPurchasable.Parent = CustomMenu.sectionframes
	ThirdPurchasable.Visible = true
	ThirdPurchasable.offsale:Destroy()
	ThirdPurchasable.type.Text = tostring(Cost)
	ThirdPurchasable.type.TextColor3 = Color3.fromRGB(255,255,255)
	ThirdPurchasable.type.TextSize = 15
	ThirdPurchasable.name.Text = "Candy Crown"
	ThirdPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=4544072210"
	ThirdPurchasable.MouseButton1Click:Connect(function()
		if NotDisabled2 == true then
			NotDisabled2 = false
			if Credits < Cost then
				NotDisabled2 = true
				Notify("Not enough credits to purchase this.")
			else
				ThirdPurchasable.type.Text = "Loading..."
				task.spawn(function()
					if LoadingPurchase then
					LoadingPurchase.Visible = true
					AnimationOnStart()
					task.wait(AnimDelay)
					LoadingPurchase.Visible = false
					end
				end)
				local args = {
					[1] = 66,
					[2] = "Knife Skins",
					[3] = "Winter Gift"
				}
				task.spawn(function()
				local Item = game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
				OpenCase("Knife Skins","Winter Gift",Item,true,true)
				end)
				wait(LoadDelay)
				ThirdPurchasable.type.Text = tostring(Cost)
				NotDisabled2 = true
			end
		else

		end
	end)
end)
if true then
task.spawn(function()
	local AnimDelay = 7
	local LoadDelay = 7
	local Cost = 0
	local Purchasable = game.ReplicatedStorage.model.invbut:Clone()
	local NotDisabled = true
	Purchasable.Position = UDim2.new(1.1, 0, 0, 25)
	Purchasable.Parent = CustomMenu.sectionframes
	Purchasable.Visible = false
	Purchasable.offsale:Destroy()
	Purchasable.type.Text = tostring(Cost)
	Purchasable.type.TextColor3 = Color3.fromRGB(255,255,255)
	Purchasable.type.TextSize = 15
	Purchasable.name.Text = "Pink Cosmic"
	Purchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=4525655285"
	task.spawn(function()
		while true do
			for i,v in {4525655285, 4525657340, 4525657935, 4525658211, 4525658718, 4525658989, 4525659251, 4525659491, 4525659730, 4525660072, 4525660535, 4525660761, 4525660984, 4525661319, 4525661516, 4525661699, 4525661885, 4525662252, 4525662432, 4525662648} do
				Purchasable.Image = `https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId={v}`
				wait()
			end
		end
	end)
	Purchasable.MouseButton1Click:Connect(function()
		if NotDisabled == true then
			NotDisabled = false
			if Credits < Cost then
				NotDisabled = true
				Notify("Not enough credits to purchase this.")
			else
				Purchasable.type.Text = "Loading..."
				task.spawn(function()
					if LoadingPurchase then
						LoadingPurchase.Visible = true
						AnimationOnStart()
						task.wait(AnimDelay)
						LoadingPurchase.Visible = false
					end
				end)
				task.spawn(function()
					print("GETTING THAT PINK COSMIC YEAHHHH")
					OpenCase("Knife Skins","Craft","Pink Cosmic",true,true)
				end)
				task.wait(LoadDelay)
				Purchasable.type.Text = tostring(Cost)
				NotDisabled = true
			end
		end
	end)
end)
end
------------------
task.spawn(function()
	local AnimDelay = 2.5
	local LoadDelay = 2.75
	local Cost = 10000
	FourthPurchasable.Position = UDim2.new(0.05, 0, 0, 115)
	FourthPurchasable.Parent = CustomMenu.sectionframes
	FourthPurchasable.Visible = true
	FourthPurchasable.offsale:Destroy()
	FourthPurchasable.type.Text = tostring(Cost)
	FourthPurchasable.type.TextColor3 = Color3.fromRGB(255,255,255)
	FourthPurchasable.type.TextSize = 15
	FourthPurchasable.name.Text = "Royal Red"
	FourthPurchasable.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=2676022029"
	FourthPurchasable.MouseButton1Click:Connect(function()
		if NotDisabled2 == true then
			NotDisabled2 = false
			if Credits < Cost then
				NotDisabled2 = true
				Notify("Not enough credits to purchase this.")
			else
				FourthPurchasable.type.Text = "Loading..."
				task.spawn(function()
					if LoadingPurchase then
					LoadingPurchase.Visible = true
					AnimationOnStart()
					task.wait(AnimDelay)
					LoadingPurchase.Visible = false
					end
				end)
				local args = {
					[1] = 66,
					[2] = "Chair Skins",
					[3] = "Winter"
				}
				task.spawn(function()
				local Item = game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(unpack(args))
				OpenCase("Chair Skins","Winter",Item,true,true)
				end)
				wait(LoadDelay)
				FourthPurchasable.type.Text = tostring(Cost)
				NotDisabled2 = true
			end
		else

		end
	end)
end)
----------
local Die = nil
local SpamSound = nil
local HiddenNames = false
local HideBlood = false

task.spawn(function()
	while task.wait(0.1) do
		if HiddenNames == true then
			for i,Player in pairs(game.Players:GetPlayers()) do
				if Player.Character ~= nil and Player.Character:FindFirstChildOfClass("Humanoid") then
					local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
					if Humanoid.DisplayDistanceType == Enum.HumanoidDisplayDistanceType.None and not Humanoid:GetAttribute("hidename2") == true then
						Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
						Humanoid.NameDisplayDistance = 100
						Humanoid:SetAttribute("hidename",true)
					elseif Humanoid.Sit == true then
						Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Subject
						Humanoid.NameDisplayDistance = 100
						Humanoid:SetAttribute("hidename2",true)
					end
				end
			end
		elseif HiddenNames == false then
			for i,Player in pairs(game.Players:GetPlayers()) do
				if Player.Character ~= nil and Player.Character:FindFirstChildOfClass("Humanoid") then
					local Humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
					if Humanoid:GetAttribute("hidename") == true then
						Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
					elseif Humanoid:GetAttribute("hidename2") == true and LocalPlayer.Character ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
						Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
					end
				end
			end
	end end
end)

task.spawn(function()
	local Path = game:GetService("ReplicatedStorage").model.Sound
	repeat
		if SpamSound == true then
			Path.Playing = true
			Path.TimePosition = math.random(10,75)/100
		end
		task.wait(0.5)
	until Path.Parent == nil
end)

task.spawn(function()
	task.spawn(function()
		repeat
			task.wait()
		until game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") ~= nil
		task.wait()
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Died:Wait()
		if Die == true then
			Die = false
			lag(2,true)
			task.wait(0.01)
			Die = true
		end
	end)
	game.Players.LocalPlayer.CharacterAppearanceLoaded:Connect(function(char)
		task.spawn(function()
			repeat
				task.wait()
			until char:FindFirstChildOfClass("Humanoid") ~= nil
			char:FindFirstChildOfClass("Humanoid").Died:Wait()
			if Die == true then
				Die = false
				lag(2,true)
				task.wait(0.01)
				Die = true
			end
		end)
	end)
end)
local function SettingsToggleButton(Frame,DoFunction,UndoFunction)
	local Button = Frame.Autosave.ImageButton
	local AnimationHappening = false
	Button.MouseButton1Click:Connect(function()
		task.spawn(function()
			task.spawn(function()
				if Button.fill.Visible == true then
					Button.fill.Visible = false
				else
					Button.fill.Visible = true
				end
			end)
			AnimationHappening = true
			game:GetService("TweenService"):Create(Button.glow,TweenInfo.new(0.175),{ImageTransparency = 0}):Play()
			task.wait(0.175)
			game:GetService("TweenService"):Create(Button.glow,TweenInfo.new(0.175),{ImageTransparency = 1}):Play()
			task.wait(0.185)
			AnimationHappening = false
		end)
		if Button.fill.Visible == false then
			UndoFunction()
		else
			DoFunction()
		end
	end)
	Button.MouseEnter:Connect(function()
		game:GetService("TweenService"):Create(Button.glow,TweenInfo.new(0.2),{ImageTransparency = 0.7}):Play()
	end)
	Button.MouseLeave:Connect(function()
		if AnimationHappening == false then
			game:GetService("TweenService"):Create(Button.glow,TweenInfo.new(0.2),{ImageTransparency = 1}):Play()
		end
	end)
end
--
local SettingScroll = UI.setting.ScrollingFrame
local Settings = SettingScroll:FindFirstChild("performance"):Clone()
local General = SettingScroll:FindFirstChild("general")
repeat task.wait() until Settings:FindFirstChild("sframe") ~= nil
local Feature = Settings:FindFirstChild("sframe")
local Feature2 = Feature:Clone()
local Feature3 = Feature:Clone()
local Feature4 = Feature:Clone()
local Feature5 = Feature:Clone()
local Feature6 = Feature:Clone()
local Feature7 = Feature:Clone()
local Feature8 = Feature:Clone()
local Feature9 = Feature:Clone()
local Feature10 = Feature:Clone()
local Feature11 = Feature:Clone()
local Display2 = Feature:Clone()
Feature.TextLabel.Text = "Hide Blood"
Feature2.TextLabel.Text = "Improve UI"
Feature3.TextLabel.Text = "FullBright"
Feature4.TextLabel.Text = "Auto ServerHop"
Feature5.TextLabel.Text = "Play Loud Noise"
Feature6.TextLabel.Text = "Debug Messages"
Feature7.TextLabel.Text = "Legacy Autofarm"
Feature8.TextLabel.Text = "Show Hidden Names"
Feature9.TextLabel.Text = "Auto execute"
Feature10.TextLabel.Text = "Teleport Notify"
Feature11.TextLabel.Text = "Fix chat"
Display2.TextLabel.Text = "Display Knife 2"
Feature5.Parent = Settings
Feature6.Parent = Settings
Feature4.Parent = Settings
Feature3.Parent = Settings
Feature2.Parent = Settings
Feature7.Parent = Settings
Feature8.Parent = Settings
Feature9.Parent = Settings
Feature10.Parent = Settings
Feature11.Parent = Settings
Display2.Parent = General
Feature2.Position = UDim2.new(0,0,0,55)
Feature3.Position = UDim2.new(0,0,0,85)
Feature4.Position = UDim2.new(0,0,0,115)
Feature5.Position = UDim2.new(0,0,0,145)
Feature6.Position = UDim2.new(0,0,0,175)
Feature7.Position = UDim2.new(0,0,0,205)
Feature8.Position = UDim2.new(0,0,0,235)
Feature9.Position = UDim2.new(0,0,0,265)
Feature10.Position = UDim2.new(0,0,0,295)
Feature11.Position = UDim2.new(0,0,0,325)
Display2.Position = UDim2.new(0,0,0,145)
Settings.Parent = SettingScroll
Settings.Name = "breakingplus"
local UIGradient = Instance.new("UIGradient")
UIGradient.Parent = Settings:FindFirstChild("TextLabel")
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,255,174)),
    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(0, 160, 255)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 160, 255))
})
Settings:FindFirstChild("TextLabel").Text = "Breaking +"
Settings.Position = UDim2.new(0, 0, 0, 600)

local UIBluring = false
local Animations = false
local DoingAnimation = false
local Legacy = true
local AutoServerHop = true
local SavedPosition = Vector2.new(0,0)
local SavedPosition2 = Vector2.new(0,0)
local DisplayKnifeOrigin = nil
local BindEvent = Instance.new("BindableEvent")

for i,v in pairs(General:GetChildren()) do
	if v.TextLabel.Text == "Display Knife" then
		DisplayKnifeOrigin = v
	end
end

for i,v in pairs(General:GetChildren()) do
	if v.Position.Y.Offset > 145 or v.Position.Y.Offset == 145 and v ~= Display2 then
		v.Position = v.Position + UDim2.new(0,0,0,30)
	end
end

for i,v in pairs(SettingScroll:GetChildren()) do
	if v ~= General then
		v.Position = v.Position + UDim2.new(0,0,0,30)
	end
end
local server = UI:FindFirstChild("server1")
local Scale = Instance.new("UIScale")
Scale.Parent = server
local Tween = game:GetService("TweenService"):Create(server,TweenInfo.new(0.4,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{Size = UDim2.new(0,250,0,300)})
local Tween2 = game:GetService("TweenService"):Create(server,TweenInfo.new(0.2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{Size = UDim2.new(0,250,0,0)})
local Tween3 = game:GetService("TweenService"):Create(Scale,TweenInfo.new(0.8,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Scale = 0})
game:GetService("Workspace").disguise.SurfaceGui.noother.Part.ClickDetector.MouseClick:Connect(function()
	CustomMenu.Visible = false
	for i,v in pairs(UI:GetChildren()) do
		if v.Name == "setting" or v.Name == "trade" or v.Name == "shop" or v.Name == "inv" or v.Name == "tradelog" then
			v.Visible = false
		end
	end
	if Animations == true then
		server.Size = UDim2.new(0,250,0,0)
		Scale.Scale = 1
		Tween3:Cancel()
		Tween2:Cancel()
		Tween:Play()
		server.ScrollingFrame.CanvasPosition = SavedPosition2
	end
end)

local Clone3 = server.TextButton:Clone()
server.TextButton:Destroy()
Clone3.Parent = server
Clone3.MouseButton1Click:Connect(function()
	if Animations == true then
		SavedPosition2 = server.ScrollingFrame.CanvasPosition
		server.Size = UDim2.new(0,250,0,300)
		if server:FindFirstChild("FriendsOnline") then
			server.FriendsOnline.Visible = false
		end
		Scale.Scale = 1
		Tween:Cancel()
		Tween2:Play()
		Tween3:Play()
		task.wait(0.2)
		server.Visible = false
	else
		server.Visible = false
	end
end)

local table32 = {}
local function tween(p75, p76, p77, p78)
	p78 = p78 or 1
	for key20, val20 in pairs(table32) do
		if val20.obj ~= p75 or val20.property ~= p76 then continue end
		table32[key20] = {
			obj = p75,
			property = p76,
			e = p77,
			inc = p78
		}
		return
	end
	local u100 = tick() .. math.random()
	table32[u100] = {
		obj = p75,
		property = p76,
		e = p77,
		inc = p78
	}
	spawn(function()
		while task.wait() do
			if game:GetService("RunService").Heartbeat:Wait() then
				local v219 = table32[u100]
				local v220 = p75
				local v221 = p76
				local v222 = p75[p76]
				v220[v221] = v222 + (v219.e - v222) * v219.inc
				if math.abs(p75[p76] - v219.e) >= 0.01 then continue end
				table32[u100] = nil
				p75[p76] = v219.e
				return
			end
			return
		end
	end)
end
local function bottombuttonhover(p141)
	p141.MouseEnter:connect(function()
		tween(p141, "ImageTransparency", 0, 0.2)
		tween(p141.TextLabel, "TextTransparency", 0, 0.2)
	end)
	p141.MouseLeave:connect(function()
		tween(p141, "ImageTransparency", 0.5, 0.2)
		tween(p141.TextLabel, "TextTransparency", 0.5, 0.2)
	end)
	p141.MouseButton1Down:connect(function()
		tween(p141, "ImageTransparency", 0.5, 0.2)
		tween(p141.TextLabel, "TextTransparency", 0.5, 0.2)
	end)
end
server.friends.Visible = false
server.friends:GetPropertyChangedSignal("Visible"):Connect(function()
	server.friends.Visible = false
end)
local ClonedFriends = server.friends:Clone()
ClonedFriends.Parent = server
ClonedFriends.Name = "FriendsOnline"
ClonedFriends.Position = UDim2.new(1, 0, 1, -28)
ClonedFriends.ScaleType = Enum.ScaleType.Slice
ClonedFriends.SliceCenter = Rect.new(22, 19, 228, 81)
ClonedFriends.Size = UDim2.new(0, 250, 0, 0) -- 170
ClonedFriends.AnchorPoint = Vector2.new(0, 1)


local function GetAmount(UI,Delete)
	local Amount = 0
	for i,v in UI:GetChildren() do
		if v.Name == "friendframe" then
			if Delete then
				v:Destroy()
			end
			Amount += 1
		end
	end
	return Amount
end

local Turn = 0
local Friends = {}

local function UpdateFriendsList()
	local NewFriends = {}
	local success, page = pcall(function() return game.Players:GetFriendsAsync(LocalPlayer.UserId) end)
	if success then
		repeat
			local info = page:GetCurrentPage()
			local Done = 0
			for i, friendInfo in pairs(info) do
				task.spawn(function()
					local Status,Nil,PlaceId,JobId = game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(51, friendInfo.Id)
					friendInfo["PlaceId"] = PlaceId
					friendInfo["JobId"] = JobId
					if PlaceId and JobId then
					table.insert(NewFriends, friendInfo)
					else
					--Debug("Friend " .. friendInfo.Username .. " | " .. tostring(PlaceId) .. " | " .. tostring(JobId) )
					end
					Done += 1
				end)
			end
			repeat task.wait() until Done >= #info
			if not page.IsFinished then 
				page:AdvanceToNextPageAsync()
			end
			task.wait(0.005)
		until page.IsFinished
		Friends = table.clone(NewFriends)
	end
end	
task.spawn(function()
	UpdateFriendsList()
	while task.wait(15) do
		task.spawn(function()
			UpdateFriendsList()
		end)
	end
end)
workspace.disguise.SurfaceGui.noother.Part.ClickDetector.MouseClick:connect(function(Player)
	local FriendsOnlineFrame = ClonedFriends
	local Turn2 = workspace.DistributedGameTime
	Turn = Turn2
	FriendsOnlineFrame.Visible = false
	GetAmount(FriendsOnlineFrame, true)
	Debug("Active Friends: " .. #Friends)
	local Size = 30
	local Amount = 0
	for _, PlayerData in pairs(Friends) do
			if GetAmount(FriendsOnlineFrame) == 20 then break elseif game.Players:FindFirstChild(PlayerData.Username) or PlayerData.PlaceId == nil or PlayerData.JobId == game.JobId then continue end
			if Turn ~= Turn2 then continue end
			task.wait(0.15 / math.clamp(Amount / 2.5,1,5))
			if Turn ~= Turn2 then continue end
			if Amount == 0 then
			FriendsOnlineFrame.Visible = true
			end
			local v214 = game:GetService("ReplicatedStorage").model.friendframe:Clone()
			v214.TextLabel.Text = PlayerData.Username:sub(1, 10)
			Size += 35
			Amount += 1
			ClonedFriends.Size = UDim2.new(0, 250, 0, Size)
			v214.ImageLabel.Image = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. PlayerData.Id .. "&width=420&height=420&format=png"
			v214.back.MouseButton1Down:connect(function()
				if game.JobId ~= PlayerData.JobId and PlayerData.JobId ~= nil and PlayerData.PlaceId ~= nil then
					UITeleport(PlayerData.PlaceId, PlayerData.JobId)
				else
					Notify("Failed to teleport")
				end
			end)
			v214.playing.Text = GetModeByPlaceId(PlayerData.PlaceId)
			v214.Position = UDim2.new(0, 0, 0, GetAmount(FriendsOnlineFrame) * 35 + 20)
			v214.Parent = FriendsOnlineFrame
			bottombuttonhover(v214.back)
	end
end)

-- Because of api timeout limitation issues it might not work all of the time (blame roblox with their servers api) (⚠️adding this code is likely to bug out server hop feature⚠️)
task.spawn(function()
while task.wait(11) do
	if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled and not UserInputService.MouseEnabled then
		Debug("Disabled player count on server to prevent crashes (mobile detected)")
		break
	end
	for i,v in server.ScrollingFrame:GetChildren() do
		if v.Name == "trash" then
			local GameModeName = v:FindFirstChild("TextLabel")
			local PlaceId,OriginalName = nil,nil
			for modeName, placeId in Modes do
				if string.find(string.lower(GameModeName.Text), string.lower(modeName),nil,true) then
					PlaceId = placeId
					OriginalName = modeName
					Debug("Found mode: " .. OriginalName .. " with PlaceId: " .. PlaceId)
					break
				end
			end
			if type(PlaceId) == type(1) and PlaceId ~= Modes["All game-modes"] then
				local TotalPlayers = GetTotalPlayers(PlaceId)
				if TotalPlayers then
					GameModeName.Text = OriginalName .. " | " .. TotalPlayers
				else
					Debug("Failed to get total players for mode: " .. OriginalName)
					--GameModeName.Text = OriginalName
				end
				task.wait(6.5)
			else
				local Data = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games?universeIds=271119130"))
				if Data and Data.data and Data.data[1] and Data.data[1].playing then
					local TotalPlayers = Data.data[1].playing
					GameModeName.Text = "All game-modes | " .. tostring(math.round(TotalPlayers * 0.93)) -- 93% because of the other modes being counted too
				else
					Debug("Failed to get total players for All game-modes")
					--GameModeName.Text = "All game-modes"
				end
			end
		end
	end
end
end)
--]]

local setting = UI.setting
local Scale = Instance.new("UIScale")
Scale.Parent = setting
local Tween = game:GetService("TweenService"):Create(setting,TweenInfo.new(0.4,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{Size = UDim2.new(0,250,0,240)})
local Tween2 = game:GetService("TweenService"):Create(setting,TweenInfo.new(0.2,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{Size = UDim2.new(0,250,0,0)})
local Tween3 = game:GetService("TweenService"):Create(Scale,TweenInfo.new(0.8,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{Scale = 0})
DoingAnimation = false
local Clone = UI.buttons.setting:Clone()
UI.buttons.setting:Destroy()
Clone.Parent = UI.buttons

Clone.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(Clone,TweenInfo.new(0.25),{ImageTransparency = 0}):Play()
	game:GetService("TweenService"):Create(Clone.TextLabel,TweenInfo.new(0.25),{TextTransparency = 0}):Play()
end)
Clone.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(Clone,TweenInfo.new(0.25),{ImageTransparency = 0.5}):Play()
	game:GetService("TweenService"):Create(Clone.TextLabel,TweenInfo.new(0.25),{TextTransparency = 0.5}):Play()
end)

Clone.MouseButton1Down:Connect(function()
	for i,v in pairs(UI:GetChildren()) do
		if v.Name == "Breaking+" or v.Name == "trade" or v.Name == "shop" or v.Name == "inv" or v.Name == "tradelog" or v.Name == "server1"  then
			v.Visible = false
		end
	end
	ClonedFriends.Visible = false
	if Animations == true then
		if DoingAnimation == true then
			return
		end
	local	normal = not setting.Visible
		setting.Visible = not setting.Visible
if normal == true then
	DoingAnimation = true
setting.Size = UDim2.new(0,250,0,0)
Scale.Scale = 1
Tween3:Cancel()
Tween2:Cancel()
Tween:Play()
setting.ScrollingFrame.CanvasPosition = SavedPosition
task.wait(0.4)
DoingAnimation = false
elseif normal == false then
	SavedPosition = setting.ScrollingFrame.CanvasPosition
	DoingAnimation = true
	setting.Visible = true
	setting.Size = UDim2.new(0,250,0,240)
	Scale.Scale = 1
	Tween:Cancel()
	Tween2:Play()
	Tween3:Play()
	task.wait(0.2)
	DoingAnimation = false
	setting.Visible = false
end
else
	setting.Visible = not setting.Visible
end
end)
local Clone2 = setting.TextButton:Clone()
setting.TextButton:Destroy()
Clone2.Parent = setting
Clone2.MouseButton1Click:Connect(function()
	if Animations == true then
	DoingAnimation = true
	SavedPosition = setting.ScrollingFrame.CanvasPosition
setting.Size = UDim2.new(0,250,0,240)
Scale.Scale = 1
Tween:Cancel()
Tween2:Play()
Tween3:Play()
task.wait(0.2)
DoingAnimation = false
setting.Visible = false
	else
		setting.Visible = false
	end
end)

	
for i, Selection in pairs (setting:GetChildren()) do
	if Selection:IsA("GuiBase2d") then
		local Parent = Selection:FindFirstAncestorWhichIsA("GuiBase")
		if Parent ~= nil then
		Selection.Size = UDim2.new(Selection.Size.X.Offset/Parent.AbsoluteSize.X + Selection.Size.X.Scale, 0, Selection.Size.Y.Offset/Parent.AbsoluteSize.Y + Selection.Size.Y.Scale, 0)
		Selection.Position = UDim2.new(Selection.Position.X.Offset/Parent.AbsoluteSize.X + Selection.Position.X.Scale, 0, Selection.Position.Y.Offset/Parent.AbsoluteSize.Y  + Selection.Position.Y.Scale, 0)
		end	
	end
end

	
for i, Selection in pairs (server:GetChildren()) do
	if Selection:IsA("GuiBase2d") and not Selection == ClonedFriends then
		local Parent = Selection:FindFirstAncestorWhichIsA("GuiBase")
		if Parent ~= nil then
		Selection.Size = UDim2.new(Selection.Size.X.Offset/Parent.AbsoluteSize.X + Selection.Size.X.Scale, 0, Selection.Size.Y.Offset/Parent.AbsoluteSize.Y + Selection.Size.Y.Scale, 0)
		Selection.Position = UDim2.new(Selection.Position.X.Offset/Parent.AbsoluteSize.X + Selection.Position.X.Scale, 0, Selection.Position.Y.Offset/Parent.AbsoluteSize.Y  + Selection.Position.Y.Scale, 0)
		end	
	end
end

for i,v in pairs(UI.buttons:GetChildren()) do
	if v ~= CustomButton then
		v.MouseButton1Down:Connect(function()
			CustomMenu.Visible = false
			server.Visible = false
			ClonedFriends.Visible = false
		end)
	end
end

task.spawn(function()
if ReturnData("TutSettings.txt") == "false" then
UI.setting.Visible = false
local Tween = game:GetService("TweenService"):Create(Clone,TweenInfo.new(0.75,Enum.EasingStyle.Linear),{ImageColor3 = Color3.fromRGB(100,15,15)})
local Tween2 = game:GetService("TweenService"):Create(Clone,TweenInfo.new(0.75,Enum.EasingStyle.Linear),{ImageColor3 = Color3.fromRGB(255, 255, 255)})
Tween:Play()
local Connection
local OpenedSettings = false
local Connection2
Connection2 = Tween2.Completed:Connect(function()
if OpenedSettings == false then
Tween:Play()
else
Connection2:Disconnect()
end
end)
Connection = Tween.Completed:Connect(function()
if OpenedSettings == false then
Tween2:Play()
else
Connection2:Disconnect()
end
end)
Clone.MouseButton1Down:Once(function()
OpenedSettings = true
ChangeData("TutSettings.txt","true")
Tween:Pause()
Tween2:Play()
UI.setting.ScrollingFrame.CanvasPosition = Vector2.new(0,0)
UI.setting.ScrollingFrame.ScrollingEnabled = false
task.wait(0.25)
game:GetService("TweenService"):Create(UI.setting.ScrollingFrame,TweenInfo.new(4,Enum.EasingStyle.Circular,Enum.EasingDirection.Out),{CanvasPosition = Vector2.new(0,980)}):Play() -- remember to change this
task.wait(4)
UI.setting.ScrollingFrame.ScrollingEnabled = true
end)
end
end)
local Invite = "discord.gg/jpwg5Dcr2D"
UI.loading:GetPropertyChangedSignal("Text"):Connect(function()
	if UI.loading.Text == "" then
		UI.loading.Text = Invite
	end
end)
if UI.loading.Text == "" then
	UI.loading.Text = Invite
end
UI.loading:GetPropertyChangedSignal("GuiState"):Connect(function()
	if UI.loading.GuiState == Enum.GuiState.Press then
		pcall(function()
			setclipboard(Invite)
			TopNotify("Copied invite link to clipboard")
		end)
	end
end)

local function CreateBlurHitbox(Origin,Position,Size,Radius,Anchor)
	local UICorner = Instance.new("UICorner")
	local Frame = Instance.new("Frame")
	Frame.AnchorPoint = Anchor
	Frame.Position = Position
	Frame.Size = Size
	Frame.Visible = Origin.Visible
	Frame.Name = "UIBlurFrame"
	Frame.BackgroundTransparency = 1
	Frame.Parent = Origin
	UICorner.Parent = Frame
	UICorner.CornerRadius = Radius
	UIBlur(Frame)
	BindEvent.Event:Connect(function()
	if UIBluring == true then
		Frame.Visible = Origin.Visible
	else
		Frame.Visible = false
	end
	end)
	Origin.Changed:Connect(function()
	if UIBluring == true then
		Frame.Visible = Origin.Visible
	else
		Frame.Visible = false
	end
	end)
end

for i,v in pairs(UI:GetChildren()) do
	if v.Name == "rank" then
	CreateBlurHitbox(v,UDim2.new(0.5,0,0.5,0),UDim2.new(0.94,0,0.9,0),UDim.new(0,12),Vector2.new(0.5,0.5))
	elseif v.Name == "setting" then
	CreateBlurHitbox(v,UDim2.new(0.5,0,0.5,0),UDim2.new(0.94,0,0.95,0),UDim.new(0,12),Vector2.new(0.5,0.5))
	elseif v.Name == "profile" then
	CreateBlurHitbox(v,UDim2.new(0.5,0,0.5,0),UDim2.new(0.95,0,0.91,0),UDim.new(0,12),Vector2.new(0.5,0.5))
	elseif v.Name == "server1" then
	CreateBlurHitbox(v,UDim2.new(0.5,0,0.025,0),UDim2.new(0.94,0,0.86,0),UDim.new(0,12),Vector2.new(0.5,0))
	CreateBlurHitbox(ClonedFriends,UDim2.new(0.5,0,0.055,0),UDim2.new(0.94,0,0.86,0),UDim.new(0,12),Vector2.new(0.5,0))
	elseif v.Name == "decision" then
	CreateBlurHitbox(v,UDim2.new(0,0,0,0),UDim2.new(1,0,1,0),UDim.new(0,10),Vector2.new(0,0))
	end
end

Display2Function = function()
	DisplayKnifeOrigin.Autosave.ImageButton.fill.ImageTransparency = 1
	DisplayKnifeOrigin.Autosave.ImageButton.ImageTransparency = 0
	game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(53,"Display Knife",false)
	game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(53,"Display Knife 2",true)
end
Display2UnFunction = function()
	game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(53,"Display Knife 2",false)
end
SettingsToggleButton(Display2,Display2Function,Display2UnFunction)
	if LocalPlayer.settings:FindFirstChild("Display Knife 2").Value == false then
		Display2.Autosave.ImageButton.fill.Visible = false
		Display2.Autosave.ImageButton.fill.ImageTransparency = 0
		Display2UnFunction()
	elseif LocalPlayer.settings:FindFirstChild("Display Knife 2").Value == true then
		Display2.Autosave.ImageButton.fill.Visible = true
		Display2.Autosave.ImageButton.fill.ImageTransparency = 0
		Display2Function()
	else
		Display2.Autosave.ImageButton.fill.Visible = false
		Display2.Autosave.ImageButton.fill.ImageTransparency = 0
		Display2UnFunction()
	end
	LocalPlayer.settings["Display Knife"]:GetPropertyChangedSignal("Value"):Connect(function()
		if LocalPlayer.settings["Display Knife"].Value == true then
		Display2.Autosave.ImageButton.fill.Visible = false
		Display2.Autosave.ImageButton.fill.ImageTransparency = 0
		end
	end)



	
	Feature11Function = function()
		local MainChatWindow = game:GetService("TextChatService"):FindFirstChild("ChatWindowConfiguration") or game:GetService("TextChatService"):WaitForChild("ChatWindowConfiguration")
		if MainChatWindow then
			MainChatWindow.Enabled = false
		end
		ChangeData("Feature11.txt","true")
	end
	Feature11UnFunction = function()
		local MainChatWindow = game:GetService("TextChatService"):FindFirstChild("ChatWindowConfiguration") or game:GetService("TextChatService"):WaitForChild("ChatWindowConfiguration")
		if MainChatWindow then
			MainChatWindow.Enabled = true
		end
		ChangeData("Feature11.txt","false")
	end
	SettingsToggleButton(Feature11,Feature11Function,Feature11UnFunction)
	pcall(function()
		if ReturnData("Feature11.txt") == "false" then
			Feature11.Autosave.ImageButton.fill.Visible = false
			Feature11.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature11UnFunction()
		elseif ReturnData("Feature11.txt") == "true" then
			Feature11.Autosave.ImageButton.fill.Visible = true
			Feature11.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature11Function()
		else
			Feature11.Autosave.ImageButton.fill.Visible = false
			Feature11.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature11Function()
			DefaultData("Feature11.txt","true")
		end
	end)



	Feature10Function = function()
		TeleportNotify = true
		ChangeData("Feature10.txt","true")
	end
	Feature10UnFunction = function()
		TeleportNotify = false
		ChangeData("Feature10.txt","false")
	end
	SettingsToggleButton(Feature10,Feature10Function,Feature10UnFunction)
	pcall(function()
		if ReturnData("Feature10.txt") == "false" then
			Feature10.Autosave.ImageButton.fill.Visible = false
			Feature10.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature10UnFunction()
		elseif ReturnData("Feature10.txt") == "true" then
			Feature10.Autosave.ImageButton.fill.Visible = true
			Feature10.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature10Function()
		else
			Feature10.Autosave.ImageButton.fill.Visible = false
			Feature10.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature10UnFunction()
			DefaultData("Feature10.txt","false")
		end
	end)


	Feature9Function = function()
		AutoExec = true
		ChangeData("Feature9.txt","true")
	end
	Feature9UnFunction = function()
		AutoExec = false
		ChangeData("Feature9.txt","false")
	end
	SettingsToggleButton(Feature9,Feature9Function,Feature9UnFunction)
	pcall(function()
		if ReturnData("Feature9.txt") == "false" then
			Feature9.Autosave.ImageButton.fill.Visible = false
			Feature9.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature9UnFunction()
		elseif ReturnData("Feature9.txt") == "true" then
			Feature9.Autosave.ImageButton.fill.Visible = true
			Feature9.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature9Function()
		else
			Feature9.Autosave.ImageButton.fill.Visible = true
			Feature9.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature9Function()
			DefaultData("Feature9.txt","true")
		end
	end)


	Feature8Function = function()
		HiddenNames = true
		ChangeData("Feature8.txt","true")
	end
	Feature8UnFunction = function()
		HiddenNames = false
		ChangeData("Feature8.txt","false")
	end
	SettingsToggleButton(Feature8,Feature8Function,Feature8UnFunction)
	pcall(function()
		if ReturnData("Feature8.txt") == "false" then
			Feature8.Autosave.ImageButton.fill.Visible = false
			Feature8.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature8UnFunction()
		elseif ReturnData("Feature8.txt") == "true" then
			Feature8.Autosave.ImageButton.fill.Visible = true
			Feature8.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature8Function()
		else
			Feature8.Autosave.ImageButton.fill.Visible = false
			Feature8.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature8UnFunction()
			DefaultData("Feature8.txt","false")
		end
	end)

Feature7Function = function()
	Legacy = true
	if workspace.DistributedGameTime > 40 then
		NotifyButtons("This feature causes more frequent ping lag but may give more credits, do you want to turn it on?","No","Yes",
		function()
			Feature7.Autosave.ImageButton.fill.Visible = false
			Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
			Feature7UnFunction()
			return {"Load","Turning off",1.8}
		end,function()
			return {}
		end)
	end
	ChangeData("Feature7.txt","true")
end
Feature7UnFunction = function()
	Legacy = false
	ChangeData("Feature7.txt","false")
end
SettingsToggleButton(Feature7,Feature7Function,Feature7UnFunction)
pcall(function()
	if ReturnData("Feature7.txt") == "false" then
		Feature7.Autosave.ImageButton.fill.Visible = false
		Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature7UnFunction()
	elseif ReturnData("Feature7.txt") == "true" then
		Feature7.Autosave.ImageButton.fill.Visible = true
		Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature7Function()
	else
		Feature7.Autosave.ImageButton.fill.Visible = false
		Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature7UnFunction()
		DefaultData("Feature7.txt","false")
	end
end)

Feature6Function = function()
	ChangeData("Feature6.txt","true")
	Debugging = true
	Debug("Started debugging")
end
Feature6UnFunction = function()
	ChangeData("Feature6.txt","false")
	Debugging = false
	Debug("Stopped debugging")
end
SettingsToggleButton(Feature6,Feature6Function,Feature6UnFunction)
pcall(function()
	if ReturnData("Feature6.txt") == "false" then
		Feature6.Autosave.ImageButton.fill.Visible = false
		Feature6.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature6UnFunction()
	elseif ReturnData("Feature6.txt") == "true" then
		Feature6.Autosave.ImageButton.fill.Visible = true
		Feature6.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature6Function()
	else
		Feature6.Autosave.ImageButton.fill.Visible = false
		Feature6.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature6UnFunction()
		DefaultData("Feature6.txt","false")
	end
end)

Feature5Function = function()
	ChangeData("Feature5.txt","true")
	SpamSound = true
	Debug("Started spamming loud sounds")
end
Feature5UnFunction = function()
	ChangeData("Feature5.txt","false")
	SpamSound = false
	Debug("Stopped spamming loud sounds")
end
SettingsToggleButton(Feature5,Feature5Function,Feature5UnFunction)
pcall(function()
	if ReturnData("Feature5.txt") == "false" then
		Feature5.Autosave.ImageButton.fill.Visible = false
		Feature5.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature5UnFunction()
	elseif ReturnData("Feature5.txt") == "true" then
		Feature5.Autosave.ImageButton.fill.Visible = true
		Feature5.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature5Function()
	else
		Feature5.Autosave.ImageButton.fill.Visible = true
		Feature5.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature5UnFunction()
		DefaultData("Feature5.txt","false")
		
	end
end)

Feature4Function = function()
	ChangeData("Feature4.txt","true")
	AutoServerHop = true
	Debug("Started automatily server hopping")
end
Feature4UnFunction = function()
	ChangeData("Feature4.txt","false")
	AutoServerHop = false
	Debug("Stopped automatily server hopping")
end
SettingsToggleButton(Feature4,Feature4Function,Feature4UnFunction)
pcall(function()
	if ReturnData("Feature4.txt") == "false" then
		Feature4.Autosave.ImageButton.fill.Visible = false
		Feature4.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature4UnFunction()
	elseif ReturnData("Feature4.txt") == "true" then
		Feature4.Autosave.ImageButton.fill.Visible = true
		Feature4.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature4Function()
	else
		Feature4.Autosave.ImageButton.fill.Visible = false
		Feature4.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature4Function()
		DefaultData("Feature4.txt","true")
		
	end
end)

Feature3Function = function()
	ChangeData("Feature3.txt","true")
	game.Lighting.Ambient = Color3.fromRGB(100,100,100)
	game.Lighting.Brightness = 5
	Debug("Enabled fullbright")
end
Feature3UnFunction = function()
	ChangeData("Feature3.txt","false")
	game.Lighting.Ambient = Color3.fromRGB(0,0,0)
	game.Lighting.Brightness = 0
	Debug("Disabled fullbright")
end
SettingsToggleButton(Feature3,Feature3Function,Feature3UnFunction)
pcall(function()
	if ReturnData("Feature3.txt") == "false" then
		Feature3.Autosave.ImageButton.fill.Visible = false
		Feature3.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature3UnFunction()
	elseif ReturnData("Feature3.txt") == "true" then
		Feature3.Autosave.ImageButton.fill.Visible = true
		Feature3.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature3Function()
	else
		Feature3.Autosave.ImageButton.fill.Visible = false
		Feature3.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature3UnFunction()
		DefaultData("Feature3.txt","false")
	end
end)
local BloodUI 
for i,v in pairs(game:GetService("CoreGui"):QueryDescendants("ImageLabel #HurtOverlay")) do
	BloodUI = v
	break
end
FeatureFunction = function()
	ChangeData("Feature1.txt","true")
	HideBlood = true
	BloodUI.ImageTransparency = 1
	Debug("Started hiding blood")
end
FeatureUnFunction = function()
	ChangeData("Feature1.txt","false")
	HideBlood = false
	BloodUI.ImageTransparency = 0
	Debug("Stopped hiding blood")
end
SettingsToggleButton(Feature,FeatureFunction,FeatureUnFunction)
pcall(function()
	if ReturnData("Feature1.txt") == "false" then
		Feature.Autosave.ImageButton.fill.Visible = false
		Feature.Autosave.ImageButton.fill.ImageTransparency = 0
		FeatureUnFunction()
	elseif ReturnData("Feature1.txt") == "true" then
		Feature.Autosave.ImageButton.fill.Visible = true
		Feature.Autosave.ImageButton.fill.ImageTransparency = 0
		FeatureFunction()
	else
		Feature.Autosave.ImageButton.fill.Visible = false
		Feature.Autosave.ImageButton.fill.ImageTransparency = 0
		FeatureUnFunction()
		DefaultData("Feature1.txt","false")
	end
end)
Feature2Function = function()
	ChangeData("Feature2.txt","true")
	UIBluring = true
	Animations = true
	BindEvent:Fire()
	local Value = Instance.new("Model",game.CoreGui)
	Value.Name = "ImproveUI"
	UI.setting.ImageLabel.ImageColor3 = Color3.fromRGB(15,15,15)
	UI.server1.ImageLabel.ImageColor3 = Color3.fromRGB(15,15,15)
	UI.profile.ImageLabel.ImageColor3 = Color3.fromRGB(20,20,20)
	UI.rank.ImageLabel.ImageColor3 = Color3.fromRGB(20,20,20)
	ClonedFriends.ImageColor3 = Color3.fromRGB(15,15,15)
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(0,10)
	local UICorner2 = Instance.new("UICorner")
	UICorner2.CornerRadius = UDim.new(0,5)
	UICorner:Clone().Parent = UI.decision
	UICorner2:Clone().Parent = UI.decision.public
	UICorner2:Clone().Parent = UI.decision.secret
	UI.decision.secret.BackgroundColor3 = Color3.fromRGB(5,5,5)
	task.spawn(function()
		UI.shop.sectionframes.ChildAdded:Wait()
		if ReturnData("Feature2.txt") == "true" then
			local found = false
			local thefound = nil
			for i,v in pairs(UI.shop.sectionbuttons:GetChildren()) do
				if v:FindFirstChild("TextLabel") and v:FindFirstChild("TextLabel").Text == "Other" then
					thefound = v:FindFirstChild("ImageButton")
					found = true
				end
			end
			if found == true then
				thefound.Image = "rbxassetid://17375911551"
			end
		end
	end)
	local found = false
	local thefound = nil
	for i,v in pairs(UI.shop.sectionbuttons:GetChildren()) do
		if v:FindFirstChild("TextLabel") and v:FindFirstChild("TextLabel").Text == "Other" then
			thefound = v:FindFirstChild("ImageButton")
			found = true
		end
	end
	if found == true then
		thefound.Image = "rbxassetid://17375911551"
	end
	Debug("Added improvements to the UI")
end
Feature2UnFunction = function()
	ChangeData("Feature2.txt","false")
	UIBluring = false
	Animations = false
	BindEvent:Fire()
	server.UIScale.Scale = 1
	if game.CoreGui:FindFirstChild("ImproveUI") then
		UI.decision.secret.BackgroundColor3 = Color3.fromRGB(27,27,27)
		UI.server1.ImageLabel.ImageColor3 = Color3.fromRGB(30,30,30)
		UI.setting.ImageLabel.ImageColor3 = Color3.fromRGB(30,30,30)
		UI.profile.ImageLabel.ImageColor3 = Color3.fromRGB(30,30,30)
		UI.rank.ImageLabel.ImageColor3 = Color3.fromRGB(30,30,30)
		ClonedFriends.ImageColor3 = Color3.fromRGB(30,30,30)
		UI.decision.secret:FindFirstChild("UICorner"):Destroy()
		UI.decision.public:FindFirstChild("UICorner"):Destroy()
		UI.decision:FindFirstChild("UICorner"):Destroy()
		game.CoreGui:FindFirstChild("ImproveUI"):Destroy()
		if UI.setting:FindFirstChild("BlurFrame") then
			UI.setting:FindFirstChild("BlurFrame").Visible = false
			task.wait()
			UI.setting:FindFirstChild("BlurFrame"):Destroy()
			workspace.CurrentCamera:ClearAllChildren()
			for i,v in game.Lighting:GetChildren() do
				if v.Name == "DepthOfField" then
					v:Destroy()
			end
			end
		end
		local found = false
		local thefound = nil
		for i,v in pairs(UI.shop.sectionbuttons:GetChildren()) do
			if v:FindFirstChild("TextLabel") and v:FindFirstChild("TextLabel").Text == "Other" then
				thefound = v:FindFirstChild("ImageButton")
				found = true
			end
		end
		if found == true then
			thefound.Image = "rbxassetid://0"
		end
	else
	end
	Debug("Removed the improvements to the UI")
end
if ReturnData("Feature2.txt") == "false" then
	Feature2.Autosave.ImageButton.fill.Visible = false
	Feature2.Autosave.ImageButton.fill.ImageTransparency = 0
	Feature2UnFunction()
elseif ReturnData("Feature2.txt") == "true" then
	Feature2.Autosave.ImageButton.fill.Visible = true
	Feature2.Autosave.ImageButton.fill.ImageTransparency = 0
	Feature2Function()
else
	Feature2.Autosave.ImageButton.fill.Visible = true
	Feature2.Autosave.ImageButton.fill.ImageTransparency = 0
	Feature2Function()
	DefaultData("Feature2.txt","true")
end
SettingsToggleButton(Feature2,Feature2Function,Feature2UnFunction)
SettingScroll.CanvasSize = UDim2.new(0, 0, 0, 980)
UI.buttons.shop.ImageButton.Position = UDim2.new(1.025,0,0,35)
UI.version.Text = GetModeByPlaceId(game.PlaceId) .. " | V" .. tostring(Version)
UI.version.TextXAlignment = Enum.TextXAlignment.Left
UI.version.Position = UI.version.Position + UDim2.new(0,10,0,0)
UI.version.Size = UDim2.new(0, 400, 0, 25)
task.spawn(function()
	local OriginalText = UI.version.Text
	UI.version.Text = OriginalText .. " | " .. (RoundNumber(tonumber(GetPing()),2) or "0") .. " ms"
	while task.wait(1) do
		UI.version.Text = OriginalText .. " | " .. (RoundNumber(tonumber(GetPing()),2) or "0") .. " ms"
	end
end)
local BackgroundUI =   UI.mockinv.top.everydivine:Clone()
BackgroundUI.Parent = CustomMenu.top 
BackgroundUI.Visible = true
BackgroundUI.ImageColor3 = Color3.fromRGB(0, 255, 196)
BackgroundUI.ImageTransparency = 0.45
CustomMenu.top.TextButton.ZIndex = 2
ClonedCredits.Parent = CustomMenu.top
ClonedCredits.ZIndex = 2
local Rejoin = UI.buttons.inv:Clone()
Rejoin.Parent = CustomMenu
Rejoin.Name = "rejoin"
Rejoin.Position = UDim2.new(0.375, 0, 0.75, 35)
Rejoin.ImageColor3 = Color3.fromRGB(47, 121, 255)
Rejoin.TextLabel.Text = "Rejoin"
Rejoin.MouseButton1Click:Connect(function()
	rejoin(true)
end)
Rejoin.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(Rejoin,TweenInfo.new(0.25),{ImageTransparency = 0}):Play()
end)
Rejoin.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(Rejoin,TweenInfo.new(0.25),{ImageTransparency = 0.5}):Play()
end)
local Respawn = UI.buttons.inv:Clone()
Respawn.Parent = CustomMenu
Respawn.Name = "respawn"
Respawn.Position = UDim2.new(0.65, 0, 0.625, 35)
Respawn.ImageColor3 = Color3.fromRGB(255, 255, 255)
Respawn.TextLabel.Text = "Respawn"
Respawn.MouseButton1Click:Connect(function()
	respawn(false)
end)
Respawn.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(Respawn,TweenInfo.new(0.25),{ImageTransparency = 0}):Play()
end)
Respawn.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(Respawn,TweenInfo.new(0.25),{ImageTransparency = 0.5}):Play()
end)
local RefreshCooldown = false
local Refresh = UI.buttons.inv:Clone()
Refresh.Parent = CustomMenu
Refresh.Name = "refresh"
Refresh.Position = UDim2.new(0.65, 0, 0.5, 35)
Refresh.ImageColor3 = Color3.fromRGB(255, 255, 255)
Refresh.TextLabel.Text = "Refresh"
Refresh.MouseButton1Click:Connect(function()
	if not RefreshCooldown then
		RefreshCooldown = true
	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		local OldPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame
		local CamPos = workspace.CurrentCamera.CFrame
		respawn(false)
		LocalPlayer.CharacterAdded:Once(function(char)
			repeat
				RunService.Heartbeat:Wait()
			until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = OldPos
			RefreshCooldown = false
			wait()
			workspace.CurrentCamera.CFrame = CamPos
			
		end)
	elseif game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
		local OldPos = game.Players.LocalPlayer.Character:FindFirstChild("Torso").CFrame
		local CamPos = workspace.CurrentCamera.CFrame
		respawn(false)
		LocalPlayer.CharacterAdded:Once(function(char)
			repeat
				RunService.Heartbeat:Wait()
			until game.Players.LocalPlayer.Character:FindFirstChild("Torso")
			game.Players.LocalPlayer.Character:FindFirstChild("Torso").CFrame = OldPos
			RefreshCooldown = false
			wait()
			workspace.CurrentCamera.CFrame = CamPos
		end)
	else
		Notify("Could not refresh | Did not find torso/root. (Suggest to respawn instead)")
	end
end
end)
Refresh.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(Refresh,TweenInfo.new(0.25),{ImageTransparency = 0}):Play()
end)
Refresh.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(Refresh,TweenInfo.new(0.25),{ImageTransparency = 0.5}):Play()
end)
local ServerHop = UI.buttons.inv:Clone()
local ServerHopCoolDown = false
ServerHop.Parent = CustomMenu
ServerHop.Name = "serverhop"
ServerHop.Position = UDim2.new(0.65, 0, 0.75, 35)
ServerHop.ImageColor3 = Color3.fromRGB(166, 255, 137)
ServerHop.TextLabel.Text = "Server hop"

ServerHop.MouseButton1Click:Connect(function()
if not ServerHopCoolDown then
	ServerHopCoolDown = true
	task.spawn(function()
	serverhop(true)
	end)
	task.wait(2)
	ServerHopCoolDown = false
end
end)
ServerHop.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(ServerHop,TweenInfo.new(0.25),{ImageTransparency = 0}):Play()
end)
ServerHop.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(ServerHop,TweenInfo.new(0.25),{ImageTransparency = 0.5}):Play()
end)
local Lag = UI.buttons.inv:Clone()
Lag.Parent = CustomMenu
Lag.Name = "lag"
Lag.Position = UDim2.new(0.095, 0, 0.75, 35)
Lag.ImageColor3 = Color3.fromRGB(155, 0, 0)
Lag.TextLabel.Text = "Lag server"
local Sent = false
task.spawn(function()
	while task.wait() do
		if Sent == true then
			lag(4,false)
		end
	end
end)
Lag.MouseButton1Click:Connect(function()
	if Sent == false then
		Lag.TextLabel.Text = "Stop lagging"
		Sent = true
	else
		Lag.TextLabel.Text = "Lag server"
		Sent = false
	end
end)
Lag.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(Lag,TweenInfo.new(0.25),{ImageTransparency = 0}):Play()
end)
Lag.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(Lag,TweenInfo.new(0.25),{ImageTransparency = 0.5}):Play()
end)
task.spawn(function()
	task.wait(0.25)
	ClonedCredits.Text = ClassicCredits.Text
	Credits = tonumber(ClassicCredits.Text:sub(-ClassicCredits.Text:len(),-8)) or 0
	ClassicCredits.Changed:Connect(function()
		ClonedCredits.Text = ClassicCredits.Text
		Credits = tonumber(ClassicCredits.Text:sub(-ClassicCredits.Text:len(),-8)) or 0
	end)
end)
local AutoFarm = UI.buttons.inv:Clone()
AutoFarm.Parent = CustomMenu
AutoFarm.Name = "autofarm"
AutoFarm.Position = UDim2.new(0.375, 0, 0.625, 35)
AutoFarm.ImageColor3 = Color3.fromRGB(255, 60, 0)
AutoFarm.TextLabel.Text = "Disable autofarm"
AutoFarm.TextLabel.TextSize = 11
local function ToggleAutoFarm()
	if Sent2 == true then
		Sent2 = false
		TopNotify("Autofarm disabled",2.5,true)
		AutoFarm.ImageColor3 = Color3.fromRGB(0, 225, 225)
		AutoFarm.TextLabel.Text = "Enable autofarm"
		if game.PlaceId == Modes["All game-modes"] and GetPing() > 2000 then
		respawn(false) -- helps you know when it turns off when your ping is high
		end
	else
		Sent2 = true
		TopNotify("Autofarm enabled",2.5,true)
		AutoFarm.ImageColor3 = Color3.fromRGB(255, 60, 0)
		AutoFarm.TextLabel.Text = "Disable autofarm"
		if game.PlaceId ~= Modes["All game-modes"] then
			NotifyButtons("You need to teleport to the correct mode to autofarm","Teleport","Cancel",function() UITeleport(648362523) return {"Load","Teleporting",1} end,function() ToggleAutoFarm() return {} end)
		end
	end
end
if game.PlaceId ~= Modes["All game-modes"] or (LocalPlayer:FindFirstChild("settings") and LocalPlayer.settings:FindFirstChild("Afk") and LocalPlayer.settings.Afk.Value == true)  then
	ToggleAutoFarm()
end
AutoFarm.MouseButton1Click:Connect(ToggleAutoFarm)

task.spawn(function()
    while task.wait(260) do
        if GetPing() > 4858 then
            PingFreezeEvent:Fire(GetPing())
            task.wait(0.5)
        end
    end
end)

PingFreezeEvent.Event:Connect(function()
	if Legacy == true then
	NotifyButtons("It has been detected that you have ping freeze/lag while 'Legacy' autofarm is turned on, would you like to turn it off?","Cancel","Yes",function()
		return {}
	end,function()
		Feature7.Autosave.ImageButton.fill.Visible = false
		Feature7.Autosave.ImageButton.fill.ImageTransparency = 0
		Feature7UnFunction()
		return {"Load","Turning off",2.5}
	end)
	elseif Sent2 == true then
		NotifyButtons("It has been detected that you have ping freeze/lag while the autofarm is turned on would you like to turn it off?","Cancel","Yes",function()
		return {}
	end,
	function()
		Sent2 = false
		TopNotify("Autofarm disabled",2.5,true)
		AutoFarm.ImageColor3 = Color3.fromRGB(0, 225, 225)
		AutoFarm.TextLabel.Text = "Enable autofarm"
		return {"Load","Turning off",2.5}
	end)
	end
end)

AutoFarm.MouseEnter:Connect(function()
	game:GetService("TweenService"):Create(AutoFarm,TweenInfo.new(0.25),{ImageTransparency = 0}):Play()
end)
AutoFarm.MouseLeave:Connect(function()
	game:GetService("TweenService"):Create(AutoFarm,TweenInfo.new(0.25),{ImageTransparency = 0.5}):Play()
end)

CustomMenu.Name = "Breaking+"
CustomMenu.top.TextLabel:FindFirstChildOfClass("ImageLabel"):Destroy()
CustomMenu.top.TextLabel.Text = "Breaking +"
CustomMenu.top.TextLabel.ZIndex = 2
CustomMenu.sectionframes.ClipsDescendants = false
CustomButton.ImageColor3 = Color3.fromRGB(0,200,125)
CustomButton.Position = UDim2.new(0, -200, 0, 140)
CustomButton.TextLabel.Text = "Breaking +"
CustomButton.Name = "Breaking+"
CustomButton.Visible = true
game:GetService("TweenService"):Create(CustomButton,TweenInfo.new(0.5),{Position = UDim2.new(0, 0, 0, 140)}):Play()
	

function SittingAnimationPlayer(char)
	repeat task.wait() until char:FindFirstChildOfClass("Humanoid") ~= nil
	if char:FindFirstChildOfClass("Humanoid") ~= nil then
		local Humanoid = char:FindFirstChildOfClass("Humanoid")
		Humanoid.Seated:Connect(function(Sitting,Part)
			if Sitting == true then
				task.wait()
				local Animation = Instance.new("Animation")
				Animation.AnimationId = "rbxassetid://" .. tostring(SelectedAnimation)
				local AnimationRebel = Instance.new("Animation")
				AnimationRebel.AnimationId = "rbxassetid://3200332361"
				local SittingAnimationPoseCustom = Humanoid:LoadAnimation(Animation)
				local SittingAnimationExtraRebel
				SittingAnimationPoseCustom.Priority = Enum.AnimationPriority.Action3
				SittingAnimationPoseCustom.Looped = true
				SittingAnimationPoseCustom:Play(0)
				SittingAnimationPoseCustom:AdjustWeight(1,0)
				if SelectedAnimation == 140290021376754 then
					task.wait(.1)
					SittingAnimationExtraRebel = Humanoid:LoadAnimation(AnimationRebel)
					SittingAnimationExtraRebel.Priority = Enum.AnimationPriority.Action3
					SittingAnimationExtraRebel.Looped = true
					SittingAnimationExtraRebel:Play(0.2)
					SittingAnimationPoseCustom:AdjustSpeed(1.524)
					SittingAnimationExtraRebel:AdjustWeight(0.875,0)
				end
				Humanoid.Seated:Once(function(Sitting,Part)
					if Sitting == false then
						SittingAnimationPoseCustom.Looped = false
						SittingAnimationPoseCustom:Stop(0.2)
						if SittingAnimationExtraRebel then
							SittingAnimationExtraRebel.Looped = false
							SittingAnimationExtraRebel:Stop(0.2)
						end
					end
				end)
			end
		end)
	end
end

if LocalPlayer.Character then
	SittingAnimationPlayer(LocalPlayer.Character)
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(char)
	SittingAnimationPlayer(char)
end)

function AddEmote(ID,Name,Icon)
	Debug("Added emote ID:"..ID.." Name:"..Name)
	task.spawn(function()
		UI.inv.sectionframes:GetChildren()[4].TextLabel.Visible = false
		local invbut = invbut:Clone()
		invbut.Image = "rbxassetid://" .. Icon
		invbut.name.Text = Name
		invbut.type.Text = ""
		invbut.type.TextColor3 = Color3.fromRGB(255, 79, 82)
		invbut.Parent = UI.inv.sectionframes:GetChildren()[4]
		invbut.MouseButton1Down:Connect(function()
			if invbut.BorderSizePixel == 0 then
				invbut.BorderSizePixel = 2
				game:GetService("ReplicatedStorage").RemoteEvent:FireServer(55,"Animations")
				SelectedAnimation = ID
				for i,v in pairs(UI.inv.sectionframes:GetChildren()[4].GridOrder:GetChildren()) do
					if v ~= invbut and v:IsA("ImageButton") then
						v.BorderSizePixel = 0
					end
				end
			else
				invbut.BorderSizePixel = 0
				SelectedAnimation = 0
			end
		end)
	end)
end

local function addvipchairs()
	task.wait(1.4)
	task.spawn(function()
		Debug("Added Stellar Chair")
		local invbut = invbut:Clone()
		UI.inv.sectionframes:GetChildren()[3].TextLabel.Visible = false
	invbut.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=3422633744"
	invbut.name.Text = "Stellar"
	invbut.type.Text = "Legendary"
	invbut.type.TextColor3 = Color3.fromRGB(255, 79, 82)
	invbut.Parent = UI.inv.sectionframes:GetChildren()[3]
	invbut.MouseButton1Down:Connect(function()
		if invbut.BorderSizePixel == 0 then
		invbut.BorderSizePixel = 2
		game:GetService("ReplicatedStorage").RemoteEvent:FireServer(55,"Chair Skins","Space","Stellar")
	for i,v in pairs(UI.inv.sectionframes:GetChildren()[3].GridOrder:GetChildren()) do
		if v ~= invbut and v:IsA("ImageButton") then
			v.BorderSizePixel = 0
		end
	end
	else
		invbut.BorderSizePixel = 0
	end
	end)
	end)
	
	task.spawn(function()
		Debug("Added Blue Galaxy Chair")
		local invbut2 = invbut2:Clone()
		invbut2.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=1077205771"
		invbut2.name.Text = "Blue Galaxy"
		invbut2.type.Text = "Legendary"
		invbut2.type.TextColor3 = Color3.fromRGB(255, 79, 82)
		invbut2.Parent = UI.inv.sectionframes:GetChildren()[3]
		invbut2.MouseButton1Down:Connect(function()
			if invbut2.BorderSizePixel == 0 then
			invbut2.BorderSizePixel = 2
			game:GetService("ReplicatedStorage").RemoteEvent:FireServer(55,"Chair Skins","Space","Blue Galaxy")
		for i,v in pairs(UI.inv.sectionframes:GetChildren()[3].GridOrder:GetChildren()) do
			if v ~= invbut2 and v:IsA("ImageButton") then
				v.BorderSizePixel = 0
			end
		end
		else
			invbut2.BorderSizePixel = 0
		end
		end)
		end)
	end


task.spawn(function()
	while task.wait(0.8) do
		if not UI.inv.sectionframes:GetChildren()[5]:FindFirstChild("GridOrder") then
for i,v in pairs(UI.inv.sectionframes:GetChildren()) do
    local MainFrame = Instance.new("Frame")
    local GridLayout = Instance.new("UIGridLayout")
    local Padding = Instance.new("UIPadding")
    local RarityOrder = {Exotic=-6,Divine = -5,Legendary = -4,Rare = -3,Uncommon = -2,Common = -1}
    MainFrame.Parent = v
    MainFrame.BackgroundTransparency = 1
    MainFrame.Size = UDim2.new(1,0,1,0)
    MainFrame.Name = "GridOrder"
    Padding.Parent = MainFrame
    Padding.PaddingTop = UDim.new(0,5)
    Padding.PaddingLeft = UDim.new(0,20)
    GridLayout.CellPadding = UDim2.new(0,18,0,10)
    GridLayout.Parent = MainFrame
    GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
    for i,v in pairs(v:GetChildren()) do
        if v:IsA("ImageButton") then
			v.LayoutOrder = RarityOrder[tostring(v.type.Text)] or Random.new((function(str) local seed = 0 for i = 1, #str do seed = seed + string.byte(str, i) end return seed end)(tostring(v.type.Text))):NextInteger(-7, -100)
			v.Parent = MainFrame
			v.MouseButton1Down:Connect(function()
				for i,v3 in pairs(MainFrame:GetChildren()) do
					if v3 ~= v and v3:IsA("ImageButton") then
						v3.BorderSizePixel = 0
					end
				end
				end)
        end
    end
	v.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 10)
    v.ChildAdded:Connect(function(v2)
        task.wait()
        if v2:IsA("ImageButton") then
            v2.LayoutOrder = RarityOrder[tostring(v2.type.Text)] or Random.new((function(str) local seed = 0 for i = 1, #str do seed = seed + string.byte(str, i) end return seed end)(tostring(v2.type.Text))):NextInteger(-7, -100)
			v2.Parent = MainFrame
			v2.MouseButton1Down:Connect(function()
			for i,v3 in pairs(MainFrame:GetChildren()) do
				if v3 ~= v2 and v3:IsA("ImageButton") then
					v3.BorderSizePixel = 0
				end
			end
			end)
        end
		v.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 10)
    end)
end
task.wait(0.5)
	task.spawn(function()
	addvipchairs()
	local AnimationNamesAvailable = {Sway = {3200586606,3200675416},Rebel = {3200332361,2104492097},Slouch = {2040237465,2036596243},Sleep = {2040220399,2039295925},Tuck = {1236272531,1234316036},L = {955953327,958005778},Lean = {936006882,942467432},Chill = {942556290,942467847}}

	for i,v in pairs(UI.inv.sectionframes:GetChildren()[4].GridOrder:GetChildren()) do
		table.foreachi(AnimationNamesAvailable,function(ii,vv) if ii == v.name.Text then AnimationNamesAvailable[ii] = false end end)
	end
	for EmoteName,v in pairs(AnimationNamesAvailable) do
		if v ~= false then
			AddEmote(v[1],EmoteName,v[2])
			task.wait()
		end
	end
	end)
end
end
end)

local Player = nil

function PlayerExecute()
	Player = SelectedPlayer
	if Player ~= LocalPlayer then
		repeat
			task.wait()
		until (#PlayerButtons:GetChildren() == 3 or #PlayerButtons:GetChildren() == 4) and Player ~= LocalPlayer
		local ExtraPixels = 0
		if #PlayerButtons:GetChildren() == 4 then
			ExtraPixels = 27
		end
		local Cloned = PlayerButtons:FindFirstChild("button") or PlayerButtons:WaitForChild("button")
		Cloned = Cloned:Clone()
		local Cloned2 = Cloned:Clone()
		local Cloned3 = Cloned:Clone()
		local Cloned4 = Cloned:Clone()
		PlayerButtons.Size = UDim2.new(0,130,0,207 + ExtraPixels)
		Cloned.Position = UDim2.new(2, 0, 0, 81 + ExtraPixels)
		Cloned.Parent = PlayerButtons
		Cloned.TextLabel.Text = "Trade"
		Cloned.ImageColor3 = Color3.fromRGB(14, 35, 14)
		Cloned.button.ImageColor3 = Color3.fromRGB(85, 170, 0)
		-- Button 2 
		Cloned2.Position = UDim2.new(2, 0, 0, 108 + ExtraPixels)
		Cloned2.Parent = PlayerButtons
		Cloned2.TextLabel.Text = "Fling"
		Cloned2.ImageColor3 = Color3.fromRGB(41, 24, 24)
		Cloned2.button.ImageColor3 = Color3.fromRGB(58, 31, 31)
		-- Button 3
		Cloned3.Position = UDim2.new(2, 0, 0, 135 + ExtraPixels)
		Cloned3.Parent = PlayerButtons
		Cloned3.TextLabel.Text = "Head Stare"
		Cloned3.ImageColor3 = Color3.fromRGB(35, 30, 59)
		Cloned3.button.ImageColor3 = Color3.fromRGB(23, 12, 53)
		-- Button 4
		if Cooldown > workspace.DistributedGameTime then
			Cloned4.Visible = false
		end
		Cloned4.Position = UDim2.new(2, 0, 0, 162 + ExtraPixels)
		Cloned4.Parent = PlayerButtons
		Cloned4.TextLabel.Text = "Spam Notifications"
		Cloned4.ImageColor3 = Color3.fromRGB(75, 53, 24)
		Cloned4.button.ImageColor3 = Color3.fromRGB(54, 40, 10)
		Debug("Set buttons | " .. Player.Name .. " |  Current state : ".. tostring(PlayerButtons.Visible) .. " | Amount of buttons : ".. tostring(#PlayerButtons:GetChildren()))
		local Connection
		Connection = PlayerButtons:FindFirstChild("button").Changed:Connect(function()
		if PlayerButtons:FindFirstChild("button") and PlayerButtons:FindFirstChild("button").Position.X.Scale ~= 0 then
		Cloned.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale,0,0,81 + ExtraPixels)
		Cloned2.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale,0,0,108 + ExtraPixels)
		Cloned3.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale,0,0,135 + ExtraPixels)
		Cloned4.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale,0,0,162 + ExtraPixels)
			else
				Connection:Disconnect()
		end
	end)
		Cloned.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Cloned.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 0.8}):Play()
		end)
		Cloned.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Cloned.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 1}):Play()
		end)
		Cloned.MouseButton1Click:Connect(function()
			PlayerButtons.Visible = false
			TopNotify("Sent a trade request to "..Player.Name, 2.75, true)
			game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(73,Player)
		end)

		Cloned2.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Cloned2.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 0.8}):Play()
		end)
		Cloned2.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Cloned2.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 1}):Play()
		end)
		Cloned2.MouseButton1Click:Connect(function()
			PlayerButtons.Visible = false
			if Player.Character ~= nil and Player.Character.Humanoid ~= nil and Player.Character.Humanoid.Sit == false then
				if FloatingHead == false then
					fling(Player.Name)
				else
					Notify("You must disable float head before flinging someone")
				end
			else
				Notify("Failed to fling user (they possibly are in the match)","ok")
			end
		end)

		Cloned3.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Cloned2.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 0.8}):Play()
		end)
		Cloned3.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Cloned2.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 1}):Play()
		end)
		Cloned3.MouseButton1Click:Connect(function()
			PlayerButtons.Visible = false
			if Player.Character ~= nil and Player.Character.Head ~= nil then
			StareAt(Player)
			else
				Notify("Failed to stare at user (they didn't have a character/head)","ok")
			end
		end)

		Cloned4.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Cloned4.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 0.8}):Play()
		end)
		Cloned4.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Cloned4.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 1}):Play()
		end)
		Cloned4.MouseButton1Click:Connect(function()
			PlayerButtons.Visible = false
			Cooldown = workspace.DistributedGameTime + 15
			NotifyButtons("Are you sure you want to spam duo request notifications on " .. Player.Name .. "?","Yes","No",function() for i = 1,50 do if Player ~= nil then game:GetService("ReplicatedStorage").RemoteEvent:FireServer(39, Player) else Notify("Failed to spam notifications (player left during spam)","ok") return {} end end return {"Load","Spamming",1.5} end,function() return {} end)
		end)
	else
		repeat
			task.wait()
		until #PlayerButtons:GetChildren() == 1
		local Cloned = PlayerButtons:FindFirstChild("button")
		PlayerButtons.Size = UDim2.new(0,130,0,90)
		Cloned = Cloned:Clone()
		local Cloned2 = Cloned:Clone()
		Cloned.Position = UDim2.new(2, 0, 0, 27)
		Cloned.Parent = PlayerButtons
		Cloned.TextLabel.Text = "Headless"
		Cloned.ImageColor3 = Color3.fromRGB(38, 11, 11)
		Cloned.button.ImageColor3 = Color3.fromRGB(125, 15, 15)
		-- Button 2
		Cloned2.Position = UDim2.new(2, 0, 0, 54)
		Cloned2.Parent = PlayerButtons
		if FloatingHead == false then
		Cloned2.TextLabel.Text = "Head Float"
		else
		Cloned2.TextLabel.Text = "Head Unfloat"
		end
		Cloned2.ImageColor3 = Color3.fromRGB(17, 43, 33)
		Cloned2.button.ImageColor3 = Color3.fromRGB(19, 43, 35)
		local Connection
		Connection = PlayerButtons:FindFirstChild("button").Changed:Connect(function()
		if PlayerButtons:FindFirstChild("button") and PlayerButtons:FindFirstChild("button").Position.X.Scale ~= 0 then
		Cloned.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale,0,0,27)
		Cloned2.Position = UDim2.new(PlayerButtons:FindFirstChild("button").Position.X.Scale,0,0,54)
			else
				Connection:Disconnect()
		end
		end)
		Cloned.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Cloned.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 0.8}):Play()
		end)
		Cloned.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Cloned.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 1}):Play()
		end)
		Cloned.MouseButton1Click:Connect(function()
			PlayerButtons.Visible = false
			LocalPlayer.Character.Torso.Neck.C0 = CFrame.new(0, 250, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
			game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck",(CFrame.new(0,-100,0) * CFrame.Angles(-1.6130179166793823, 0, 3)))
		end)

		Cloned2.MouseEnter:Connect(function()
			game:GetService("TweenService"):Create(Cloned2.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 0.8}):Play()
		end)
		Cloned2.MouseLeave:Connect(function()
			game:GetService("TweenService"):Create(Cloned2.button,TweenInfo.new(0.1, Enum.EasingStyle.Linear),{ImageTransparency = 1}):Play()
		end)
		Cloned2.MouseButton1Click:Connect(function()
			PlayerButtons.Visible = false
			if FloatingHead == false then
			Debug("Enabled head float")
			FloatingHead = true
			if LocalPlayer.Character:FindFirstChild("Head") then
			LocalPlayer.Character.Head.CanCollide = false
			LocalPlayer.Character.Head.Massless = true
			else
				Notify("Failed to make head float (you didn't have a head)","ok")
				return
			end
			local Attach = Instance.new("Attachment",LocalPlayer.Character.Torso)
			FreecamSourceFunction()
			TopNotify("Enabled freecam for head float (will make ur head go to your camera)", 4,true)
			repeat
				if LocalPlayer.Character:FindFirstChild("Torso") and LocalPlayer.Character:FindFirstChild("Torso"):FindFirstChild("Neck") and Attach.Parent ~= nil then
					Attach.WorldCFrame = workspace.CurrentCamera.CFrame
					LocalPlayer.Character.Torso.Neck.C0 = (Attach.CFrame * CFrame.fromOrientation(math.rad(270),(math.rad(0)),math.rad(180)))
					game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck",((Attach.CFrame * CFrame.fromOrientation(math.rad(270),(math.rad(0)),math.rad(180)))))
				else
					break
				end
				task.wait()
			until Attach.Parent == nil or FloatingHead == false
			if Attach.Parent ~= nil and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health ~= 0 then
				LocalPlayer.Character.Torso.Neck.C0 = CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, 0)
				game:GetService("ReplicatedStorage").RemoteEvent:FireServer("neck",((LocalPlayer.Character.Torso.Neck.C0--[[Attach.CFrame --[[* CFrame.fromOrientation(math.rad(270),(math.rad(0)),math.rad(180))]])))
			end
			FreecamSourceFunction()
			FloatingHead = false
			Debug("Disabled head float")
		else
			FloatingHead = false
		end
		end)
	end
end

game.Players.PlayerRemoving:Connect(function(Player)
	local UserId = Player.UserId
	task.wait(2.5)
	local worked = false
	for i = 1,4 do
		if TeleportNotify and worked ~= true then
			local Status,Nil,PlaceId,JobId = game:GetService("ReplicatedStorage").RemoteFunction:InvokeServer(51, UserId)
			local function callback(Text)
				if Text == "Join" then
					UITeleport(PlaceId, JobId)
				end
			end
			if game.JobId ~= JobId and JobId ~= nil and PlaceId ~= nil then
				worked = true
				local NotificationBindable = Instance.new("BindableFunction")
				NotificationBindable.OnInvoke = callback
				game:GetService("StarterGui"):SetCore("SendNotification",{Title="@" .. Player.Name,Icon = game.Players:GetUserThumbnailAsync(UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420),Text="Has gone to " .. GetModeByPlaceId(PlaceId), Duration=7,Button1 = "Join", Button2 = "Cancel", Callback = NotificationBindable})
			end
			task.wait(1.5)
		end
		if worked == true then
			break
		end
	end
end)
local function tween2(p2, p3, p4, p5, p6, p7)
			local table22 = {}
			table22[p3] = p4
			game:GetService("TweenService"):Create(p2, TweenInfo.new(p5, p6 or Enum.EasingStyle.Quint, p7 or Enum.EasingDirection.Out), table22):Play()
		end
task.spawn(function()
	local Chat
	local EventFire = Instance.new("BindableEvent")
	EventFire.Event:Once(function()
		function get(p71)
			return game.ReplicatedStorage.model[p71]:Clone()
		end
		local LOG = {}
		local Emojis = {
			bruh = 3226470215,
			fr = 3226486329,
			thinking = 3226514216,
			oof = 3227779790,
			nou = 3240035371,
			yt = 3240035692,
			fist = 3240152511,
			facepalm = {
				3240144180,
				3240144180,
				3240144180,
				3240144180,
				3240144180,
				3240144180,
				3240144334,
				3240144674,
				3240144777,
				3240144910,
				3240146369,
				3240146369,
				3240146369,
				3240146369,
				3240146369,
				3240146369,
				3240146527,
				3240146690,
				3240146842
			},
			cat = 3364792873,
			clap = {
				3364796449,
				3364796449,
				3364797127,
				3364797127
			},
			dab = 4168119667
		}
		local Lurk = false
		local function message(p268, p269, p270, p271, p272, p273)

			p269 = p269:sub(1, 500)
			local v70 = get("chatframe")
			if p268 then
				v70.TextButton.Text = p268 .. ": "
			else
				v70.TextButton.Text = ""
			end
			if p268 == "help=" then
				v70.TextButton.Text = "       "
				game.ReplicatedStorage.Model:FindFirstChild("Info"):Clone().Parent = v70.TextButton
			end
			if p270 then
				v70.TextButton.TextColor3 = p270
			end
			if p271 then
				v70.TextLabel.TextColor3 = p271
			end
			v70.Parent = Chat
			v70.TextButton.Size = UDim2.new(0, v70.TextButton.TextBounds.X, 0, 25)
			v70.TextLabel.Text = p269
			if p273 then
				local orgtxt = Instance.new("StringValue", v70.TextLabel)
				orgtxt.Name = "orgtxt"
				orgtxt.Value = p273 or p269 or ""
			end
			if p272 then
				local userid = Instance.new("IntValue", v70.TextLabel)
				userid.Name = "userid"
				userid.Value = p272 or 0
			end
			local find_ret1, find_ret2 = p269:find(":%a*:")
			if find_ret1 and #p269 == find_ret2 then
				local u141 = Emojis[p269:lower():sub(2, #p269 - 1)]
				if u141 then
					local u167 = get("chatemoji")
					u167.Position = UDim2.new(0, v70.TextButton.Size.X.Offset + 15 + (u141 == 4168119667 and 0 or 0), 0, 0)
					if u141 == 4168119667 then
						u167.Size = UDim2.new(0, 30, 0, 30)
					end
					u167.Parent = v70
					v70.TextLabel.Text = ""
					if type(u141) == "table" then
						spawn(function()
							while u167.Parent do
								for _, val215 in pairs(u141) do
									u167.Image = "rbxassetid://" .. val215
									wait()
								end
							end
						end)
					else
						u167.Image = "rbxassetid://" .. u141
					end
					if LOG[1] then
						LOG[1].Size = UDim2.new(1, 0, 0, LOG[1].TextLabel.TextBounds.Y + 20)
					end
				end
			end
			v70.TextLabel.Position = UDim2.new(0, v70.TextButton.Size.X.Offset, 0, 2)
			v70.TextLabel.Size = UDim2.new(1, -v70.TextButton.Size.X.Offset, 1, 0)
			v70.Size = UDim2.new(1, 0, 0, v70.TextLabel.TextBounds.Y)
			table.insert(LOG, 1, v70)
			v70.Name = 0
			v70.Position = UDim2.new(0, 0, 1, 0)
			local v71 = -5
			for _, val83 in pairs(LOG) do
				v71 = v71 - val83.Size.Y.Offset - 3
				val83:TweenPosition(UDim2.new(0, 0, 1, v71), "Out", "Quint", 0.5, true)
				val83.Name = tonumber(val83.Name) + 1
			end
			if #LOG > 15 then
				for index34 = 15, #LOG do
					Chat[tostring(index34)]:Destroy()
					table.remove(LOG, 15)
				end
			end
			if LOG[15] then
				Chat["15"]:Destroy()
				table.remove(LOG, 15)
			end
			local v72 = -5
			for _, val84 in pairs(LOG) do
				v72 = v72 - val84.Size.Y.Offset - 3
			end
			Chat.CanvasSize = UDim2.new(0, 0, 0, -v72)
			if not Lurk then
				Chat.CanvasPosition = Vector2.new(0, -v72)
				return
			end
			if #LOG == 14 then
				tween2(Chat, "CanvasPosition", Chat.CanvasPosition + Vector2.new(0, 5 - v70.Size.Y.Offset - 3), 0.5)
			end
		end
		Chat.MouseEnter:connect(function()
			Lurk = true
			tween2(Chat, "ScrollBarImageTransparency", 0.5, 0.5)
			tween2(Chat, "CanvasPosition", Chat.CanvasPosition, 0.01)
		end)
		Chat.MouseLeave:connect(function()
			Lurk = false
			tween2(Chat, "ScrollBarImageTransparency", 1, 1)
			tween2(Chat, "CanvasPosition", Vector2.new(0, Chat.CanvasSize.Y.Offset - Chat.AbsoluteWindowSize.Y), 1)
		end)

		game.ReplicatedStorage.RemoteEvent.OnClientEvent:Connect(function(...)
		local DataTable = table.pack(...)
		if DataTable[1] == 51 then
			DataTable["n"] = nil
			table.remove(DataTable,1)
			local User = game:GetService("Players"):FindFirstChild(DataTable[1]:gsub("[%[%]]",""))
			if User and User:IsA("Player") and User.Character ~= nil and User.Character:FindFirstChild("Head") then
				game:GetService("Chat"):Chat(User.Character:FindFirstChild("Head"),DataTable[2] or " ",Enum.ChatColor.White)
			end
			message(table.unpack(DataTable))
		end
		end)
		Chat.Visible = not LocalPlayer.settings["Hide Chat"].Value
		LocalPlayer.settings["Hide Chat"]:GetPropertyChangedSignal("Value"):Connect(function()
			Chat.Visible = not LocalPlayer.settings["Hide Chat"].Value
		end)
	end)
	if not UI:FindFirstChild("chat") then
		Chat = game.StarterGui:FindFirstChild("ScreenGui"):FindFirstChild("chat"):Clone()
		Chat.Parent = LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
		Chat.Visible = true
		EventFire:Fire()
	else
		local ConnectionChat; ConnectionChat = UI.ChildRemoved:Connect(function(v)
			if v.Name == "chat" then
				Chat = game.StarterGui:FindFirstChild("ScreenGui"):FindFirstChild("chat"):Clone()
				Chat.Parent = LocalPlayer.PlayerGui:FindFirstChild("ScreenGui")
				Chat.Visible = true
				EventFire:Fire()
				ConnectionChat:Disconnect()
			end
		end)
	end
end)
task.spawn(function()
	local Shopdata =  loadstring(game:HttpGet("https://naikoexploit.vercel.app/BreakingPlus/Assets/Shopdata"))() --loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Assets/shopdata.lua"))()
	local TypeColors = {
		Common = Color3.fromRGB(255, 255, 255),
		Rare = Color3.fromRGB(25, 255, 190),
		Uncommon = Color3.fromRGB(255, 245, 184),
		Legendary = Color3.fromRGB(255, 79, 82),
		Divine = Color3.fromRGB(255, 204, 0)
	}
	local TypeSort = {
		Divine = 1,
		Legendary = 2,
		Rare = 3,
		Uncommon = 4,
		Common = 5,
		["nil"] = 6
	}
	local SectionSort = {
		["Gun Skins"] = 1,
		["Knife Skins"] = 2,
		["Chair Skins"] = 3,
		["Animations"] = 4,
		["Accessories"] = 5,
		["Effects"] = 6
	}
	local SectionSortNames = {
		{
			"A L L",
			nil
		},
		{
			"G U N S",
			"Gun Skins"
		},
		{
			"K N I V E S",
			"Knife Skins"
		},
		{
			"C H A I R S",
			"Chair Skins"
		},
		{
			"A C C E S S O R I E S",
			"Accessories"
		},
		{
			"A N I M A T I O N S",
			"Animations"
		},
		{
			"E F F E C T S",
			"Effects"
		}
	}
	local function GetItemDetails(Section,Case,Item)
		if not Case and not Item then
			return Shopdata.sections[Section]
		end
		if Case and not Item then
			return Shopdata.sections[Section].gifts[Case]
		end
		if not Case and Item then
			for i, v in pairs(Shopdata.sections[Section].gifts) do
				for i, v2 in pairs(v.items) do
					if v2.name ~= Item then continue end
					return v2
				end
			end
		end
		if Shopdata.sections[Section] and Shopdata.sections[Section].gifts[Case] then
			for i, v in pairs(Shopdata.sections[Section].gifts[Case].items) do
				if v.name ~= Item then continue end
				return v
			end
		end
		return nil
	end

	if not ChatService:CanUserChatAsync(LocalPlayer.UserId) then
		local TradeUI = UI:WaitForChild("outtradesend"):WaitForChild("tradesend")
		local HideButton = TradeUI:FindFirstChildOfClass("ImageButton"):FindFirstChildOfClass("TextLabel")
		if TradeUI then
			local LeftSideScroll = TradeUI:FindFirstChild("ScrollingFrame"):Clone()
			local Content = LeftSideScroll:FindFirstChildOfClass("ScrollingFrame")
			local OtherUserText = TradeUI.theirs:FindFirstChildOfClass("TextLabel")
			for i,v in Content:QueryDescendants("ImageButton") do v:Destroy() end
			Content.AutomaticCanvasSize = Enum.AutomaticSize.Y
			LeftSideScroll.Name = "ScrollingFrame2"
			LeftSideScroll.Parent = TradeUI
			LeftSideScroll.Position = UDim2.fromScale(0,0)
			LeftSideScroll.AnchorPoint = Vector2.new(HideButton and HideButton.Text == "SHOW" and 0 or 1,0)
			LeftSideScroll.Frame.TextBox.Text = ""
			HideButton:GetPropertyChangedSignal("Text"):Connect(function()
				TweenService:Create(LeftSideScroll,TweenInfo.new(0.5,Enum.EasingStyle.Quint),{AnchorPoint = Vector2.new(HideButton and HideButton.Text == "SHOW" and 0 or 1,0)}):Play()
				LeftSideScroll.Interactable = HideButton and HideButton.Text == "HIDE"
			end)
			
			LeftSideScroll.sec.down.MouseEnter:connect(function()
				tween2(LeftSideScroll.sec.ImageButton, "ImageColor3", Color3.fromRGB(48, 48, 48), 0.3)
				tween2(LeftSideScroll.sec.down, "ImageColor3", Color3.fromRGB(101, 101, 101), 0.3)
			end)
			LeftSideScroll.sec.down.MouseLeave:connect(function()
				tween2(LeftSideScroll.sec.ImageButton, "ImageColor3", Color3.fromRGB(38, 38, 38), 0.6)
				tween2(LeftSideScroll.sec.down, "ImageColor3", Color3.fromRGB(91, 91, 91), 0.6)
			end)
			local table11 = {}
			function table11.search(p193)
				local lower_ret = LeftSideScroll.Frame.TextBox.Text:lower()
				if lower_ret ~= "" then
					if LeftSideScroll.Frame.search.ImageTransparency == 0 then
						LeftSideScroll.Frame.ImageButton.Rotation = -10
						tween2(LeftSideScroll.Frame.ImageButton, "Rotation", 0, 1, Enum.EasingStyle.Elastic)
						LeftSideScroll.Frame.ImageButton.Size = UDim2.new(0, 1, 0, 1)
						LeftSideScroll.Frame.ImageButton:TweenSize(UDim2.new(0, 17, 0, 17), "Out", "Quad", 0.1, true)
					end
					tween2(LeftSideScroll.Frame.search, "ImageTransparency", 1, 0.2)
					tween2(LeftSideScroll.Frame.ImageButton, "ImageTransparency", 0, 0.2)
					for _, child104 in pairs(LeftSideScroll.ScrollingFrame:GetChildren()) do
						if not child104:IsA("ImageButton") then continue end
						local lower_ret2 = child104.name.Text:lower()
						if lower_ret2:find(lower_ret) or lower_ret:find(lower_ret2) then
							child104.Visible = child104:GetAttribute("ShouldBeVisible")
							continue
						end
						child104.Visible = false
					end
					tween2(LeftSideScroll.ScrollingFrame, "CanvasSize", UDim2.new(0, 0, 0, LeftSideScroll.ScrollingFrame.UIGridLayout.AbsoluteContentSize.Y), 0.25)
					if not p193 then
						tween2(LeftSideScroll.ScrollingFrame, "CanvasPosition", Vector2.new(0, 0), 0.25)
					end
				else
					tween2(LeftSideScroll.Frame.search, "ImageTransparency", 0, 0.2)
					tween2(LeftSideScroll.Frame.ImageButton, "ImageTransparency", 1, 0.2)
					for _, child105 in pairs(LeftSideScroll.ScrollingFrame:GetChildren()) do
						if not child105:IsA("ImageButton") then continue end
						child105.Visible = child105:GetAttribute("ShouldBeVisible")
					end
					tween2(LeftSideScroll.ScrollingFrame, "CanvasSize", UDim2.new(0, 0, 0, LeftSideScroll.ScrollingFrame.UIGridLayout.AbsoluteContentSize.Y), 0.25)
					if not p193 then
						tween2(LeftSideScroll.ScrollingFrame, "CanvasPosition", Vector2.new(0, 0), 0.25)
					end
				end
			end
			function table11.diffsec()
				tween2(LeftSideScroll.sec.ImageButton, "ImageColor3", Color3.fromRGB(200, 200, 200), 0.3)
				tween2(LeftSideScroll.sec.down, "ImageColor3", Color3.fromRGB(20, 20, 20), 0.3)
				tween2(LeftSideScroll.sec.TextLabel, "TextColor3", Color3.fromRGB(20, 20, 20), 0.3)
				delay(0.1, function()
					tween2(LeftSideScroll.sec.ImageButton, "ImageColor3", Color3.fromRGB(38, 38, 38), 0.6)
					tween2(LeftSideScroll.sec.down, "ImageColor3", Color3.fromRGB(91, 91, 91), 0.6)
					tween2(LeftSideScroll.sec.TextLabel, "TextColor3", Color3.fromRGB(118, 118, 118), 0.6)
				end)
				local t_showonly = table11.showonly
				local v47 = nil
				for key42, val42 in pairs(SectionSortNames) do
					if t_showonly ~= val42[2] then continue end
					v47 = key42
					break
				end
				local u113 = SectionSortNames[v47 + 1] and v47 + 1 or 1
				spawn(function()
					for index42 = 1, #SectionSortNames[u113][1] do
						LeftSideScroll.sec.TextLabel.Text = SectionSortNames[u113][1]:sub(1, index42)
						game:GetService("RunService").Heartbeat:wait()
						if LeftSideScroll.sec.TextLabel.Text ~= SectionSortNames[u113][1]:sub(1, index42) then break end
					end
				end)
				table11.showonly = SectionSortNames[u113][2]
				for i,v in Content:GetChildren() do
					if v:IsA("ImageButton") then
						if table11.showonly ~= nil and not v.Name:find(table11.showonly) then
							v:SetAttribute("ShouldBeVisible",false)
							v.Visible = false
						else
							v:SetAttribute("ShouldBeVisible",true)
							v.Visible = true
						end
					end
				end
			end
			LeftSideScroll.sec.down.MouseButton1Click:connect(function()
				table11.diffsec()
			end)
			LeftSideScroll.Frame.TextBox:GetPropertyChangedSignal("Text"):connect(function()
				table11.search()
			end)
			LeftSideScroll.Frame.ImageButton.MouseEnter:connect(function()
				tween2(LeftSideScroll.Frame.ImageButton, "ImageColor3", Color3.fromRGB(170, 170, 170), 0.5)
			end)
			LeftSideScroll.Frame.ImageButton.MouseLeave:connect(function()
				tween2(LeftSideScroll.Frame.ImageButton, "ImageColor3", Color3.fromRGB(117, 117, 117), 0.5)
			end)
			LeftSideScroll.Frame.ImageButton.MouseButton1Down:connect(function()
				if LeftSideScroll.Frame.search.ImageTransparency ~= 0 then
					LeftSideScroll.Frame.TextBox.Text = ""
				end
			end)
			local function Startup()
				for i,v in Content:QueryDescendants("ImageButton") do v:Destroy() end
				local OthersUsername = OtherUserText.Text
				if OthersUsername ~= "" and Players:FindFirstChild(OthersUsername) then
					local OtherUser = Players:FindFirstChild(OthersUsername)
					local Event = game:GetService("ReplicatedStorage").RemoteFunction
					local InventoryData = Event:InvokeServer(58,OtherUser)
					LeftSideScroll.Frame.TextBox.Text = ""
					for Section,v in InventoryData do
						for Case,v2 in v do
							for i3,Item in v2 do
								local ItemData = GetItemDetails(Section,Case,Item)
								local Images = ItemData.image
								local InstanceName = string.format("%s/%s",Item,Section)
								local InvbutItem = Content:FindFirstChild(InstanceName)
								if not InvbutItem then
									InvbutItem = game.ReplicatedStorage.model.tradebutton:Clone()
									InvbutItem.ZIndex = 1
									for i,v in InvbutItem:GetChildren() do v.ZIndex = 1 end
									InvbutItem.Parent = Content
									InvbutItem.Name = InstanceName
									InvbutItem.Interactable = false
									InvbutItem.LayoutOrder = SectionSort[Section] * 100 + TypeSort[tostring(ItemData.type)]
									InvbutItem.type.Text = ItemData.type or ""
									InvbutItem.type.TextColor3 = TypeColors[ItemData.type or "Common"]
									InvbutItem.name.Text = ItemData.fixedname or ItemData.name
									InvbutItem.times.Visible = false
									InvbutItem.times.Value:GetPropertyChangedSignal("Value"):Connect(function()
										InvbutItem.times.Visible = true
										InvbutItem.times.Text = tostring(InvbutItem.times.Value.Value) .. "x"
									end)
									task.spawn(function()
										if Case ~= "Basic" and Images then
											InvbutItem.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. (tostring(type(Images) == type({}) and Images[1] or Images):gsub("%D+",""))
											if type(Images) == type({}) and #Images > 1 then
												while InvbutItem and InvbutItem.Parent do
													for i,v in Images do
														InvbutItem.Image = "https://www.roblox.com/Thumbs/Asset.ashx?width=100&height=100&assetId=" .. tostring(v)
														wait()
													end
												end
											end
										end
									end)
								else
									InvbutItem.times.Value.Value = InvbutItem.times.Value.Value + 1
								end
								if table11.showonly ~= nil and not InvbutItem.Name:find(table11.showonly) then
									InvbutItem:SetAttribute("ShouldBeVisible",false)
									InvbutItem.Visible = false
								else
									InvbutItem:SetAttribute("ShouldBeVisible",true)
									InvbutItem.Visible = true
								end
							end
						end
					end
				end
			end

			OtherUserText:GetPropertyChangedSignal("Text"):Connect(Startup)
			TradeUI.Parent:GetPropertyChangedSignal("Visible"):Connect(function()
				if TradeUI.Parent.Visible == true then
					Startup()
				end
			end)
			if TradeUI.Parent.Visible == true then
				Startup()
			end
		end
	end
end)

LocalPlayer.OnTeleport:Once(function(State)
	if AutoExec and queueteleport then
		queueteleport('loadstring(game:HttpGet("https://naikoexploit.vercel.app/BreakingPlus"))()')   --queueteleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Breaking-Plus/main/Script"))()')
	end
end)

for i,v in pairs(PlayersList:GetChildren()) do
	if v:IsA("Frame") and v:FindFirstChild("name") and v.name:FindFirstChild("TextButton") then
		if v.name:FindFirstChild("TextLabel").Text == LocalPlayer.Name then
			for i,v in v:GetChildren() do	
				if v:IsA("ImageLabel") then
					v.ImageColor3 = Color3.fromRGB(70,70,70)
				end
			end
		end
		v.name:FindFirstChild("TextButton").MouseButton1Click:Connect(function()
			SelectedPlayer = game.Players:FindFirstChild(v.name:FindFirstChild("TextLabel").Text)
			PlayerExecute()
		end)
	end
end
PlayersList.ChildAdded:Connect(function(v)
	if v:IsA("Frame") and v:FindFirstChild("name") and v.name:FindFirstChild("TextButton") then
		v.name:FindFirstChild("TextButton").MouseButton1Click:Connect(function()
			SelectedPlayer = game.Players:FindFirstChild(v.name:FindFirstChild("TextLabel").Text)
			PlayerExecute()
		end)
	end
end)

local function CheckTradeBanned(v)
	repeat task.wait() until game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned") or task.wait(3)
	if game.Players:FindFirstChild(v.Name) and game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned") and game.Players:FindFirstChild(v.Name):FindFirstChild("tradebanned").Value == true then
		v.grad.ImageColor3 = Color3.fromRGB(255, 195, 195)
		v.TextLabel.TextColor3 = Color3.fromRGB(133, 47, 47)
		v.ImageLabel.ImageColor3 = Color3.fromRGB(35, 27, 27)
		local SendButton = v.send 
		SendButton.Visible = true
		SendButton.ImageColor3 = Color3.fromRGB(214, 41, 65)
		SendButton.TextLabel.Text = "🚫"
		SendButton.TextLabel.TextTransparency = 0.5
		SendButton:GetPropertyChangedSignal("Visible"):Connect(function()
			SendButton.Visible = true
		end)
	end
end

task.spawn(function()
	for i,v in pairs(UI.trade.Frame.ScrollingFrame:GetChildren()) do
		CheckTradeBanned(v)
	end
end)

UI.trade.Frame.ScrollingFrame.ChildAdded:Connect(function(v)
	CheckTradeBanned(v)
end)

CustomMenu.top.TextButton.MouseButton1Click:Connect(function()
	CustomMenu.Visible = not CustomMenu.Visible
end)

CustomButton.MouseButton1Down:Connect(function()
	CustomMenu.Visible = not CustomMenu.Visible
	for i,v in pairs(UI:GetChildren()) do
		task.spawn(function()
			if v.Name == "setting" or v.Name == "trade" or v.Name == "shop" or v.Name == "inv" or v.Name == "tradelog" or v.Name == "server1" then
				v.Visible = false
			end
		end)
	end
end)
task.spawn(function()
	while task.wait(1) do
		if #game.Players:GetPlayers() < 8 and Sent2 == true and AutoServerHop == true then

			game.StarterGui:SetCore(
				"SendNotification",
				{
					Title = "Notification",
					Text = "Server hopping automaticly"
				}
			)
			if TeleportProc == nil then
				TeleportProc = true
				serverhop(true)
				wait(15)
			end
		end
	end
end)

LocalPlayer.CharacterRemoving:Connect(function()
		FloatingHead = false
end)

if game.PlaceId == Modes["All game-modes"]  then
	repeat wait() until game:IsLoaded()
	game.StarterGui:SetCore(
		"SendNotification",
		{
			Title = "Notification",
			Text = "Breaking + | V" .. tostring(Version) .. " | loaded successfully.",
			Icon = "rbxassetid://10698497706"
		})
		TopNotify("Breaking + | V" .. tostring(Version) .. " | loaded successfully.", 3.65, true)
	while task.wait() do
		if Sent2 == true and LocalPlayer:FindFirstChild("settings") and LocalPlayer.settings:FindFirstChild("Afk") and LocalPlayer.settings.Afk.Value == false then
			task.wait()
			if Legacy == true then
				pcall(function()
					game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
				end)
				spawn(function()
					for i, v in pairs(game.Players:GetPlayers()) do
						if v.Name == game.Players.LocalPlayer.Name then
						else
							pcall(function()
								game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
							end)
						end
					end
				end)
			else
			if RoundMode == "Breaking Point" or RoundMode == "Who Did It" then
				pcall(function()
					game:GetService("ReplicatedStorage").RemoteEvent:FireServer(16, "public")
				end)
					spawn(function()
						for i, v in pairs(game.Players:GetPlayers()) do
							if v.Name == game.Players.LocalPlayer.Name then
							else
								pcall(function()
									game:GetService("ReplicatedStorage").RemoteEvent:FireServer(30, v)
								end)
							end
						end
					end)
			end
		end
		else
			task.wait(0.5)
		end
	end
else
	game.StarterGui:SetCore(
		"SendNotification",
		{
			Title = "Notification",
			Text = "You need to teleport to the correct mode to autofarm"
		}
	)
	task.delay(8,function()
		NotifyButtons("You need to teleport to the correct mode to autofarm","Teleport","Cancel",function() UITeleport(648362523) return {"Load","Teleporting",1} end,function() return {} end)
	end)
end
ColoredPrint("Breaking plus has loaded successfully","success",Color3.fromRGB(0,200,125))