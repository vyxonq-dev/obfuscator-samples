if not game:IsLoaded() then
	repeat
		task.wait()
	until game:IsLoaded()
end

local cloneref = function(...)
	return ...
end

local Missing = function(t, f, fallback)
	return type(f) == t and f or fallback
end

local cloneref = Missing("function",cloneref,function(...)
	return ...
end)

local Service = setmetatable({},{__index = function(self, name)
	return cloneref(game:GetService(name))
end})

do 
	ReplicatedStorage = Service.ReplicatedStorage
	Players = Service.Players
	StarterGui = Service.StarterGui
    VirtualInputManager = Service.VirtualInputManager
	VirtualUser = Service.VirtualUser


	Client = Players.LocalPlayer
	Character = Client.Character or Client.CharacterAdded:Wait()
	Humanoid = Character:WaitForChild("Humanoid")
	RootPart = Character:WaitForChild("HumanoidRootPart")
	UserId = Client.UserId
	PlayerGui = Client:WaitForChild("PlayerGui")
	Backpack = Client:WaitForChild("Backpack")

    Quest = ReplicatedStorage.Modules.Client.TalkNpc.Quests

	func = {}
end

local game = game
if typeof(game) ~= "Instance" then
	game = workspace.Parent
end

local function c() return getgenv() end

local Config_Manager = loadstring(game:HttpGet("https://raw.githubusercontent.com/Yenixs/Blockspin-Premium/refs/heads/main/Config-Manager"))() Config_Manager.SC()

do 
	do
		for _, conn in pairs(getconnections(Client.Idled)) do
			if conn.Disable then
				conn:Disable()
			elseif conn.Disconnect then
				conn:Disconnect()
			end
		end
	end
end

Client.CharacterAdded:Connect(function(newCharacter)
	Character = newCharacter
	Humanoid = Character:WaitForChild("Humanoid")
	RootPart = Character:WaitForChild("HumanoidRootPart")
	Backpack = Client:WaitForChild("Backpack")
end)

local function GetDistanceRoot(Objective)
	if typeof(Objective) == "Instance" then
		if Objective:IsA("BasePart") then
			return (Objective.Position - RootPart.Position).Magnitude
		else
			return 0
		end
	elseif typeof(Objective) == "Vector3" then
		return (Objective - RootPart.Position).Magnitude
	elseif typeof(Objective) == "CFrame" then 
		return (Objective.Position - RootPart.Position).Magnitude
	end
	return 0
end

local function InRaya(Path, contion)
	local ClosestTarget = nil
	local ShortestDistance = math.huge

	for _, Object in pairs(Path) do
		if contion(Object) then
			local Distance = (Object:GetPivot().Position - RootPart.Position).Magnitude
			if Distance < ShortestDistance then
				ShortestDistance = Distance
				ClosestTarget = Object
			end
		end
	end

	return ClosestTarget
end

local function Teleport(targetCF)
    RootPart.CFrame = targetCF
end

local function ForceStopTween()
	_G['StopTween'] = true
	task.wait()
	_G['StopTween'] = false
end

local function GetDataQuest()
	local playerLevel = Client.Data.Level.Value
	local bestQuest,bestMaxLv,mon = nil,-math.huge,nil

	for _, quest in pairs(workspace:FindFirstChild('TalkNpc'):FindFirstChild('QuestGiver'):GetChildren()) do
		local minLv, maxLv = quest.Name:match("Lv%.?(%d+)%-Lv%.?(%d+)")
		minLv = tonumber(minLv) 
        maxLv = tonumber(maxLv)
		if minLv and maxLv then
			if playerLevel >= minLv and playerLevel <= maxLv then
				if maxLv > bestMaxLv then
					bestMaxLv = maxLv
					bestQuest = quest
				end
			end
		end
	end

    if bestQuest then 
        local a = Quest:FindFirstChild(bestQuest.Name) and require(Quest:FindFirstChild(bestQuest.Name).Quest)
        mon = a.Target
    end

	return {
		[1] = bestQuest,
		[2] = mon
	}
end

local function AcceptQuest(QuestName)
    for i,v in pairs(require(ReplicatedStorage.Modules.Client.TalkNpc.Quests:FindFirstChild(QuestName))()) do 
        for _,b in pairs(v) do 
            if typeof(b) == "table" then 
                for _,n in pairs(b) do 
                    return n['OnChosen']()
                end
            end
        end
    end
end

local function GetAllAI()
    local a = {}

    for i,v in pairs(workspace:FindFirstChild('AI/Player'):GetDescendants()) do 
        if v:IsA('Model') then 
            table.insert(a,v)
        end
    end

    return a
end

local function Attack()
    if not Client:GetAttribute('isUsingWeapon') then 
        repeat task.wait()
        	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        until Client:GetAttribute('isUsingWeapon')
    else 
		ReplicatedStorage:WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer({"NormalAttack","\002"})
		VirtualUser:Button1Down(Vector2.new(1, 1))
		VirtualUser:Button1Up(Vector2.new(1, 1))
    end
end

func['AutoFarmLevel'] = function()
	while task.wait() do
		xpcall(function()
			if c().AutoFarmLevel then 
				if GetDataQuest()[1] and GetDataQuest()[2] then 
                    if not PlayerGui.HUD:FindFirstChild('Quest') then 
                        if GetDistanceRoot(GetDataQuest()[1]:GetPivot().Position) > 4 then 
                            Teleport(CFrame.new(GetDataQuest()[1]:GetPivot().Position))
                        else 
                            AcceptQuest(GetDataQuest()[1].Name)
                        end
                    else 
                        local Closet = InRaya(GetAllAI(),function(v)
                            return table.find(GetDataQuest()[2],v.Name) and v:FindFirstChild('Humanoid').Health > 0 and PlayerGui.HUD:FindFirstChild('Quest')
                        end)

                        if Closet then 
                            repeat task.wait()
                                Teleport(CFrame.new(Closet:GetPivot().Position - Vector3.new(0, 4, 0)) * CFrame.Angles(math.rad(90), 0, 0))
                                Attack()
                            until Closet:FindFirstChild('Humanoid').Health <= 0 or not PlayerGui.HUD:FindFirstChild('Quest') or not c().AutoFarmLevel
                        end
                    end
                end
			else
				ForceStopTween()
			end
		end,function(d) print(d) end)
	end
end

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
	Title = "Yenix Exploit || Kanom Tokyo",
	Icon = "github",
	Author = "By #pow",
	Folder = "Pow",
	Size = UDim2.fromOffset(400, 400),
	Theme = "Dark",
	Transparent = true,
	Resizable = true,
	OpenButton = {
		Title = "Pow",
		CornerRadius = UDim.new(1,0),
		StrokeThickness = 3,
		Enabled = true,
		Draggable = true,
		OnlyMobile = false,

		Color = ColorSequence.new(Color3.fromRGB(50, 168, 131),Color3.fromRGB(50, 168, 131))
	},
})

local Tabs = {
	General = Window:Tab({Title = "General", Icon = "library"}),
}

Tabs.General:Select()

local function Section(Tab,Text)
	local Section = Tab:Section({ 
		Title = Text,
		Box = false,
		TextSize = 17,
		Opened = true,
	})
	return Section
end

local function Tg(def,Tab,Description,Title,Keys,Callback)
	local taskThread
	local toggle = Tab:Toggle({
		Title = Title,
		Desc = Description,
		Value = c()[Keys] or def,
		Callback = function(state)
			Config_Manager.S()[Keys] = state
			c()[Keys] = state
			if Callback and typeof(Callback) == "function" then
				Callback(state)
			end
			if not state then 
				if taskThread then
					task.cancel(taskThread)
					taskThread = nil
				end
			end

			if state then 
				if func[Keys] then
					taskThread = task.spawn(function() func[Keys]() end)
				end
			end
			Config_Manager.SG()
		end
	})
	if toggle then toggle.Callback(c()[Keys]) end
	return toggle 
end

local function Slider(Tab,Title,Steps,Mins,Maxs,Def,Keys)
	local slider = Tab:Slider({
		Flag = Title,
		Title = Title,
		Step = Steps,
		Value = {
			Min = Mins,
			Max = Maxs,
			Default = c()[Keys] or Def,
		},
		Callback = function(value)
			Config_Manager.S()[Keys] = value 
			c()[Keys] = value 
			Config_Manager.SG()
		end
	})
	if slider then slider.Callback(c()[Keys] or Def) end
	return slider
end

local function Input(Tab, Title, Keys)
	local input = Tab:Input({
		Title = Title,
		Type = "Input",
		Placeholder = "Enter here...",
		Callback = function(value)
			Config_Manager.S()[Keys] = value
			c()[Keys] = value
			Config_Manager.SG()
		end
	})
	return input
end

local function Dropdown(Tab, Title, Keys, Values, Multi)
	local dropdown = Tab:Dropdown({
		Title = Title,
		Values = Values or {"nigger","Back"},
		Multi = Multi or false,
		AllowNone = false, 
		Value = c()[Keys] or Values[1], 
		Callback = function(option)
			Config_Manager.S()[Keys] = option
			c()[Keys] = option
			Config_Manager.SG()
		end
	})
	if dropdown and dropdown.Callback then
		dropdown.Callback(c()[Keys] or (Multi and {} or Values[1]))
	end
	return dropdown
end

local function Button(Tab, Title, Desc, Callback)
	local button = Tab:Button({
		Title = Title,
		Desc = Desc,
		Locked = false,
		Callback = function()
			if Callback then Callback() end
		end
	})

	return button
end

do 
	local Main = Section(Tabs.General, "Auto Farm Level")
	Tg(false, Main, "Automatically to farm level for you.", "Auto Farm Level", "AutoFarmLevel")
end
