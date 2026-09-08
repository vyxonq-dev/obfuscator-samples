
--[[
If your the developer and looking at this, get a life and learn how to make a game properly.
]]
-- // Constants \\ --
-- [ Services ] --
local Services = setmetatable({}, {__index = function(Self, Index)
	local NewService = game.GetService(game, Index)
	if NewService then
		Self[Index] = NewService
	end
	return NewService
end})

-- [ Modules ] --
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

-- [ LocalPlayer ] --
local LocalPlayer = Services.Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- [ Raycast Parameters ] --
local RaycastParameters = RaycastParams.new()
RaycastParameters.IgnoreWater = true
RaycastParameters.FilterType = Enum.RaycastFilterType.Blacklist
RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

-- [ Drawing ] --
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2.5
FOVCircle.Color = Color3.fromRGB(200, 200, 200)
FOVCircle.NumSides = 25
FOVCircle.Radius = 250

-- [ Metatable ] --
local RawMetatable = getrawmetatable(game)
local __Index = RawMetatable.__index

-- // Variables \\ --
-- [ Info ] --
local SilentAIMEnabled = false
local TeamCheck = true
local VisibilityCheck = true
local KillAura = false
local AuraRadius = 100
local EndPoint = false

local Settings = {
    Enabled = true;
    Target = "Head";
    Targets = {
        ["Head"] = 25;
        ["HumanoidRootPart"] = 50;
    };
    FOV = 250;
    FOVCircle = true;
}

-- [ Closest ] --
local Target = nil

-- // Functions \\ --
local function ValidCharacter(Character)
    if Character then
        local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
        return (Humanoid and Humanoid.Health ~= 0 and Character.PrimaryPart and Character:FindFirstChildWhichIsA("ForceField") == nil) and true or false
    end
    return false
end

local function NotObstructing(Destination, Ancestor, Distance)
    -- [ Raycast ] --
    RaycastParameters.FilterDescendantsInstances = {LocalPlayer.Character}

    local Origin = LocalPlayer.Character.PrimaryPart.CFrame.Position
    local Direction = (Destination - Origin).Unit * (Distance or 500)
    local RayResult = workspace:Raycast(Origin, Direction, RaycastParameters) or {
        Instance = nil;
        Position = Origin + Direction;
        Material = Enum.Material.Air;
    }

    if RayResult.Instance and (RayResult.Instance:IsDescendantOf(Ancestor) or RayResult.Instance == Ancestor) then
        return true
    end

    -- [ Obstructed ] --
    return false
end

local function ClosestPlayerToCursor(Distance)
    local MousePosition = Services.UserInputService:GetMouseLocation()
    local Closest = nil
    local ShortestDistance = Distance or math.huge
    for i, v in ipairs(Services.Players:GetPlayers()) do
        if v ~= LocalPlayer and ValidCharacter(v.Character) and (not TeamCheck or v.Team ~= LocalPlayer.Team) then
            local ViewportPosition, OnScreen = Camera:WorldToViewportPoint(v.Character.PrimaryPart.Position)
            local Magnitude = (Vector2.new(ViewportPosition.X, ViewportPosition.Y) - MousePosition).Magnitude
            if OnScreen == true and Magnitude < ShortestDistance and (not VisibilityCheck or NotObstructing(v.Character[Settings.Target].Position, v.Character)) then
                Closest = v
                ShortestDistance = Magnitude
            end
        end
    end
    return Closest
end

local function GetGun(Name)
    for i,v in ipairs(LocalPlayer.Character:GetChildren()) do
        if string.match(tostring(v.Name), Name) and v:IsA("Tool") then
            return v
        end
    end

    for i,v in ipairs(LocalPlayer.Backpack:GetChildren()) do
        if string.match(tostring(v.Name), Name) and v:IsA("Tool") then
            return v
        end
    end
end

local function Shoot(Position)
    local Gun = GetGun("Sniper")
    if Gun then
        local Handle = Gun.Handle
        local GunSenv = getsenv(Gun.GunScript_Local)
        EndPoint = Position
        GunSenv.Fire(Handle)
        EndPoint = false
    else
        Services.ReplicatedStorage.Gamepass:FireServer("swatsniper")
    end
end

local function Kill(Player)
    Shoot(Player.Character.Head.CFrame)
end

local function Rocket(Position)
    local Gun = GetGun("RPG")
    if Gun then
        EndPoint = Position
        Gun:Activate()
        EndPoint = false
    else
        Services.ReplicatedStorage.Gamepass:FireServer("swatrpg")
    end
end

-- // User Interface \\ --
-- [ Window ] --
local Window = Material.Load({
    Title = "Subjugation X",
    Style = 3,
    SizeX = 400,
    SizeY = 450,
    Theme = "Dark",
    ColorOverrides = {}
})

-- [ Assists ] --
local Assists = Window.New({
    Title = "Assists"
})

Assists.Toggle({
    Text = "Silent Aim",
    Callback = function(State)
        SilentAIMEnabled = State
    end,
    Enabled = false
})

Assists.Slider({
    Text = "Field of View",
    Callback = function(Value)
        Settings.FOV = Value
    end,
    Min = 50,
    Max = 500,
    Def = 250
})

-- [ Destruction ] --
local Destruction = Window.New({
    Title = "Destruction"
})

Destruction.Toggle({
    Text = "Kill Aura",
    Callback = function(State)
        KillAura = State
    end,
    Enabled = false
})

Destruction.Slider({
    Text = "Aura Radius",
    Callback = function(Value)
        AuraRadius = Value
    end,
    Min = 50,
    Max = 500,
    Def = 250
})

Destruction.Button({
    Text = "Kill-All",
    Callback = function()
        local RPG = GetGun("RPG")
        local Humanoid = LocalPlayer.Character.Humanoid
        pcall(Humanoid.EquipTool, Humanoid, RPG)
    
        local Start = LocalPlayer.Character.PrimaryPart.CFrame
        for i,v in ipairs(Services.Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
                if ValidCharacter(v.Character) then
                    local StartTime = time()
                    repeat
                        pcall(function()
                            LocalPlayer.Character.Humanoid.Sit = false
                            LocalPlayer.Character.PrimaryPart.CFrame = v.Character.PrimaryPart.CFrame * CFrame.new(0, 0, 2.5)
                        end)
                        Kill(v)
                        if time() - StartTime > 2.5 then
                            Rocket(v.Character.PrimaryPart.CFrame)
                        end
                        Services.RunService.Heartbeat:Wait()
                        if not ValidCharacter(v.Character) then
                            break
                        end
                    until v.Character.Humanoid.Health <= 0 or v.Team == LocalPlayer.Team
                end
            end
        end
        EndPoint = false
    
        pcall(function()
            LocalPlayer.Character.Humanoid.Sit = false
            LocalPlayer.Character.PrimaryPart.CFrame = Start
            pcall(Humanoid.EquipTool, Humanoid, nil)
            RPG.Parent = LocalPlayer.Backpack
        end)
    end
})

Destruction.Button({
    Text = "Crash Server",
    Callback = function()
        local Gun = GetGun("Sniper")
        if Gun then
            local Handle = Gun.Handle
            local GunSettings = require(Gun.Setting)
            for i,v in ipairs(Services.Players:GetPlayers()) do
                if ValidCharacter(v.Character) then
                    for i = 1, 2 do
                        Services.ReplicatedStorage.VisualizeBullet:FireServer(
                            nil,
                            Handle,
                            GunSettings.MuzzleOffset,
                            v.Character.PrimaryPart.Position,
                            workspace.Model,
                            Services.ReplicatedStorage,
                            GunSettings.HitSoundIDs[math.random(1, #GunSettings.HitSoundIDs)],
                            {true, math.huge, math.huge},
                            {math.huge, math.huge, BrickColor.White(), 0, Enum.Material.Neon, 500},
                            true,
                            GunSettings.Piercing == -1 and GunSettings.VisualizerEnabled or false
                        )
                    end
                end
            end
        end
    end
})

-- [ Teleports ] --
local Teleports = Window.New({
    Title = "Teleports"
})

Teleports.Dropdown({
    Text = "Choose a Location",
    Callback = function(Value)
        local TeleportCFrame = CFrame.new()
        if Value == "Swat Base" then
            local SwatSensors = workspace.Model.PROXSENSORS.SWATSensors:GetChildren()
            local Sensor = nil
            for i,v in ipairs(SwatSensors[math.random(1, #SwatSensors)]:GetChildren()) do
                if v.Material == Enum.Material.DiamondPlate then
                    Sensor = v
                    break
                end
            end
            TeleportCFrame = Sensor.CFrame * CFrame.new(0, 5, 0)
        elseif Value == "Criminal Base" then
            local CriminalSensors = workspace.Model.PROXSENSORS.CRIMSensors:GetChildren()
            local Sensor = nil
            for i,v in ipairs(CriminalSensors[math.random(1, #CriminalSensors)]:GetChildren()) do
                if v.Material == Enum.Material.DiamondPlate then
                    Sensor = v
                    break
                end
            end
            TeleportCFrame = Sensor.CFrame * CFrame.new(0, 5, 0)
        elseif Value == "Lobby" then
            TeleportCFrame = CFrame.new(102.5, 220, -245)
        elseif Value == "Above Lobby" then
            TeleportCFrame = CFrame.new(102.5, 275, -245)
        else
            Window.Banner({
                Text = "Invalid Selection!"
            })
            return "Invalid Selection"
        end
        LocalPlayer.Character.HumanoidRootPart.CFrame = TeleportCFrame
        return true
    end,
    Options = {"Swat Base", "Criminal Base", "Lobby", "Above Lobby"}
})

-- [ Miscellaneous ] --
local Miscellaneous = Window.New({
    Title = "Miscellaneous"
})

Miscellaneous.Dropdown({
    Text = "Change Team",
    Callback = function(Value)
        if Value == "Swat" then
            Services.ReplicatedStorage.Remotes.TeamSwatChangeFire:FireServer()
        elseif Value == "Criminal" then
            Services.ReplicatedStorage.Remotes.TeamCrimChangeFire:FireServer()
        else
            Window.Banner({
                Text = "Invalid Selection!"
            })
        end
    end,
    Options = {"Swat", "Criminal"}
})

Miscellaneous.Dropdown({
    Text = "Generate Shield",
    Callback = function(Value)
        local CardString = nil
        local CardName = nil
        local ShieldMachine = nil
        if Value == "Swat Shield" then
            CardString = "swatkeycard"
            CardName = "KeyCardSWAT"
            ShieldMachine = workspace.Model.OnSwatMachine
        elseif Value == "Criminal Shield" then
            CardString = "crimkeycard"
            CardName = "KeyCardCRIM"
            ShieldMachine = workspace.Model.OnCrimMachine
        else
            Window.Banner({
                Text = "Invalid Selection!"
            })
            return "Invalid Selection"
        end

        local Start = LocalPlayer.Character.HumanoidRootPart.CFrame
        local Keycard = Services.ReplicatedStorage.Gamepass:FireServer(CardString)
        repeat
            Services.RunService.RenderStepped:Wait()
            Keycard = GetGun(CardName)
        until Keycard

        if ShieldMachine.timerONOFF.Value then
            Window.Banner({
                Text = "Shield in Cooldown!"
            })
            return
        end
        for i = 1, 250 do
            Keycard.Parent = LocalPlayer.Character
            LocalPlayer.Character.HumanoidRootPart.CFrame = ShieldMachine.CFrame * CFrame.new(0, 0, 1)
            Services.RunService.Stepped:Wait()
            if ShieldMachine.OnOff.Value then
                Window.Banner({
                    Text = "Shield Generated!"
                })
                break
            end
        end

        LocalPlayer.Character.HumanoidRootPart.CFrame = Start
    end,
    Options = {"Swat Shield", "Criminal Shield"}
})

Miscellaneous.Dropdown({
    Text = "Destroy Shield",
    Callback = function(Value)
        local Shield;
        if Value == "Swat Shield" then
            for i,v in ipairs(workspace.Model:GetChildren()) do
                if v:FindFirstChildWhichIsA("Humanoid", true) then
                    if string.match(tostring(v), "SWAT") and string.match(tostring(v), "Generator") then
                        Shield = v:FindFirstChildWhichIsA("Model")
                        break
                    end
                end
            end
        elseif Value == "Criminal Shield" then
            for i,v in ipairs(workspace.Model:GetChildren()) do
                if v:FindFirstChildWhichIsA("Humanoid", true) then
                    if string.match(tostring(v), "CRIM") and string.match(tostring(v), "Generator") then
                        Shield = v:FindFirstChildWhichIsA("Model")
                        break
                    end
                end
            end
        else
            Window.Banner({
                Text = "Invalid Selection!"
            })
            return "Invalid Selection"
        end
        if not Shield then
            Window.Banner({
                Text = "Shield not found!"
            })
            return "No Shield"
        end
        for i = 1, 250 do
            LocalPlayer.Character.HumanoidRootPart.CFrame = Shield.Head.CFrame
            Shoot(Shield.HumanoidRootPart.CFrame)
            Services.RunService.Stepped:Wait()
            if Shield.OnOff.Value == false or Shield.Humanoid.Health <= 0 then
                Window.Banner({
                    Text = "Shield Destroyed!"
                })
                return "Shield Destroyed!"
            end
        end
    end,
    Options = {"Swat Shield", "Criminal Shield"}
})

-- [ Credits ] --
local Credits = Window.New({
    Title = "Credits"
})

Credits.Button({
    Text = "Creator - OminousVibes#7259",
    Callback = function()
        setclipboard("OminousVibes#7259")
    end
})

Credits.Button({
    Text = "Moral Support - OtarDev#0101",
    Callback = function()
        setclipboard("OtarDev#0101")
    end
})

-- // Metatable \\ --
setreadonly(RawMetatable, false)

RawMetatable.__index = newcclosure(function(Self, Index)
    if checkcaller() == false then
        if typeof(Self) == "Instance" and (Self:IsA("PlayerMouse") or Self:IsA("Mouse")) then
            if Index == "Hit" then
                if EndPoint then
                    return EndPoint
                end
                if SilentAIMEnabled == true and Target then
                    return Target.Character[Settings.Target].CFrame
                end
            end
        end
    end
    return __Index(Self, Index)
end)

setreadonly(RawMetatable, true)

-- // Event Listeners \\ --
Services.RunService.RenderStepped:Connect(function()
    Target = ClosestPlayerToCursor(Settings.FOV or 250)

    if KillAura then
        for i,v in ipairs(Services.Players:GetPlayers()) do
            if v ~= LocalPlayer and v.Team ~= LocalPlayer.Team then
                if ValidCharacter(v.Character) and NotObstructing(v.Character.PrimaryPart.Position, v.Character, AuraRadius) then
                    Kill(v)
                end
            end
        end
    end

    -- [ Drawing ] --
    FOVCircle.Visible = not not Settings.Enabled and SilentAIMEnabled
    FOVCircle.Radius = Settings.FOV
    FOVCircle.Position = Services.UserInputService:GetMouseLocation()
end)
