
 local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("behold")

local b = w:CreateFolder("Those who are dead")

b:Button("Always Headshot",function(bool)
  
local MAMAMIA = getrawmetatable(game)
local SPEGGITI = MAMAMIA.__namecall
setreadonly(MAMAMIA,false)
MAMAMIA.__namecall = newcclosure(function(self, ...)
  local args = {...}
  if getnamecallmethod() == 'FireServer' and self.Name == 'RE' then
    if args[1] == "aa" then
    args[2][1]= {

            ["AI"] = args[2][1]["AI"],
            ["Velocity"] = args[2][1]["Velocity"] --[[Vector3]],
            ["Special"] = "H"
        

}
    end
end
  return SPEGGITI(self, unpack(args))
end)
end)
b:Button("Damage Mod",function(bool)
loadstring(game:HttpGet('https://raw.githubusercontent.com/yeerma/such/main/those%20who%20reman.lua'))()
end)
b:Button("Item Esp",function(bool)

function CreateESPPart(BodyPart,color)
local ESPPartparent = BodyPart
local Box = Instance.new("BoxHandleAdornment")
Box.Size = BodyPart.Size + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = ESPPartparent
Box.Color3 = color
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = BodyPart
end

local zombs = game:GetService("Workspace").Ignore.Items:getChildren()
for i=1,#zombs do
local bodypart = zombs[i]:getChildren()
for i=1,#bodypart do
if bodypart[i].ClassName == "Part" then
CreateESPPart(bodypart[i], Color3.fromRGB(0,255,0))
end
end
end

game:GetService("Workspace").Ignore.Items:Connect(function(zomb)
wait(1)
local bodypart = zomb:getChildren()
for i=1,#bodypart do
if bodypart[i].ClassName == "Part" then
CreateESPPart(bodypart[i], Color3.fromRGB(0,255,0))
end
end
end)

end)
b:Button("infinite ammo",function(bool)
local Services = setmetatable({}, {
    __index = function(self, index)
        return game:GetService(index)
    end
})

local Local = setmetatable({
        Player = Services.Players.LocalPlayer,
        Client = Services.Players.LocalPlayer.PlayerScripts.Client,
        Mouse = Services.Players.LocalPlayer:GetMouse(),
        Camera = workspace:FindFirstChildOfClass("Camera")
    }, {
    __index = function(self, index)
        if index == "Character" then
            return Services.Players.LocalPlayer.Character
        else
            return rawget(self, index)
        end
    end
})

local aimtarget = nil
local Settings = {}

local Game = {
    Client = getsenv(Local.Client),
    Bullets = require(Local.Client.Bullets),
    Interact = require(Local.Client.Interact),
    Nevermore = require(Services.ReplicatedStorage.Nevermore)
}

local Modules = {
    Perks = require(Services.ReplicatedStorage.Modules.Perks)
}

local inset = Services.GuiService:GetGuiInset()
local Cheats = {}
local YOffsets = {}
local ToggleXOffsets = {}
local XOffsets = {24}

local uiElements = {}

local TextESPS = {}
local ObjectiveESPS = {}
local Items = workspace.Ignore.Items
local Infected = workspace.Entities.Infected
local Objectives = workspace.World.Objectives


local ViewportSize = Local.Camera.ViewportSize

local Target = Drawing.new("Text")
Target.Text = "Target: None"
Target.Size = 0
Target.Outline = true
Target.Center = true
Target.Color = Color3.new(1, 0, 0)
Target.Position = Vector2.new(ViewportSize.X/2, ViewportSize.Y-40)
Target.Visible = false

local function baseText(text, size, outline, center, color, vector)
    local Text = Drawing.new("Text")
    Text.Text = tostring(text)
    Text.Size = size
    Text.Outline = outline
    Text.Center = center
    Text.Color = color
    Text.Position = vector
    Text.Visible = false
    return Text
end

local PrimaryColor = Color3.new(1,1,1)
local SecondaryColor = Color3.new(1,0,0)
local SelectedColor = Color3.new(1, 0, 0)
local EnteredColor = Color3.fromRGB(100, 40, 170)

-- title --

local Title1 = baseText("thats", 0, false, false, PrimaryColor, Vector2.new(24, inset.Y))
local Title2 = baseText("crazy", 0, false, false, SecondaryColor, Vector2.new(24 + Title1.TextBounds.X, inset.Y))

local bX = 1
local bY = 1
local IsEntered = false
local ToggleQueue = {}

local function addCategory(Name, Color)
    local Title2 = baseText(Name, 0, true, false, PrimaryColor, Vector2.new(XOffsets[#Cheats+1], inset.Y + 40))
    table.insert(Cheats, {})
end

local function addCheat(Name, Category, Data)
    Data.index = Data.Default or 0
    YOffsets[Category] = YOffsets[Category] or 62
    
    local Offset = YOffsets[Category]
    local Cheat = baseText(Name..": ", 18, true, false, Color3.new(1, 1, 1), Vector2.new(XOffsets[Category], inset.Y + Offset))
    ToggleXOffsets[Category] = ToggleXOffsets[Category] or 0
    if ToggleXOffsets[Category] < Cheat.TextBounds.X + 5 then
        ToggleXOffsets[Category] = Cheat.TextBounds.X + 5
        local newXOff = XOffsets[Category] + ToggleXOffsets[Category]
        for i,v in pairs(Cheats[Category]) do
            v.Core.Position = Vector2.new(newXOff, v.Core.Position.Y)
        end
        XOffsets[Category + 1] = newXOff + 50
    end
    local starter, starterColor
    if Data.Data then
        starter = Data.Data[Data.index + 1]
        starterColor = Data.Colors[Data.index + 1]
    elseif Data.Range then
        Data.Range[3] = Data.Range[3] or 1
        starter = Data.index
        starterColor = Data.Colors[1]:lerp(Data.Colors[2], Data.index / (Data.Range[2] - Data.Range[1]))
    end
    Settings[Name] = starter
    local Core = baseText(starter, 18, true, false, starterColor, Vector2.new(XOffsets[Category] + ToggleXOffsets[Category], inset.Y + Offset))
    
    Data.Cheat = Cheat
    Data.Core = Core

    if Data.Data then
        Data.LeftDown = function(self)
            Data.index = (Data.index - 1) % #Data.Data
            Core.Text = Data.Data[Data.index + 1]
            Core.Color = Data.Colors[Data.index + 1]
            Settings[Name] = Core.Text
            if Data.Callback then
                Data.Callback(Core.Text)
            end
        end
        Data.RightDown = function(self)
            Data.index = (Data.index + 1) % #Data.Data
            Core.Text = Data.Data[Data.index + 1]
            Core.Color = Data.Colors[Data.index + 1]
            Settings[Name] = Core.Text
            if Data.Callback then
                Data.Callback(Core.Text)
            end
        end
        Data.LeftUp = function() end
        Data.RightUp = function() end
    else
        local leftDown
        Data.LeftDown = function(self)
            leftDown = true
        end
        Data.LeftUp = function(self)
            leftDown = false
        end

        local rightDown
        Data.RightDown = function(self)
            rightDown = true
        end
        Data.RightUp = function(self)
            rightDown = false
        end

        Services.RunService.RenderStepped:connect(function()
            if IsEntered then
                if leftDown then
                    local realIndex = Data.index - Data.Range[3] - Data.Range[1]
                    local newMod = Data.Range[2] - Data.Range[1]
                    Data.index = (realIndex % newMod) + Data.Range[1]
                    Core.Text = tostring(Data.index)
                    Core.Color = Data.Colors[1]:lerp(Data.Colors[2], Data.index / (Data.Range[2] - Data.Range[1]))
                    Settings[Name] = Data.index
                    if Data.Callback then
                        Data.Callback(Core.Text)
                    end
                elseif rightDown then
                    local realIndex = Data.index + Data.Range[3] - Data.Range[1]
                    local newMod = Data.Range[2] - Data.Range[1]
                    Data.index = (realIndex % newMod) + Data.Range[1]
                    Core.Text = tostring(Data.index)
                    Core.Color = Data.Colors[1]:lerp(Data.Colors[2], Data.index / (Data.Range[2] - Data.Range[1]))
                    Settings[Name] = Data.index
                    if Data.Callback then
                        Data.Callback(Core.Text)
                    end
                end
            end
        end)
    end

    YOffsets[Category] = Offset + 20
    table.insert(Cheats[Category], Data)
end

local function updatePos(Vector)
    bX = bX - Vector.X
    bX = min(bX, #Cheats)
    bX = max(bX, 1)
    bY = bY - Vector.Y
    bY = min(bY, #Cheats[bX])
    bY = max(bY, 1)
    Cheats[bX][bY].Cheat.Color = SelectedColor
end

min = math.min
max = math.max
Services.UserInputService.InputBegan:Connect(function(input)
    if Services.UserInputService:GetFocusedTextBox() then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.Return then
            IsEntered = not IsEntered
            if IsEntered then
                Cheats[bX][bY].Cheat.Color = Color3.fromRGB(74, 10, 131)
            else
                Cheats[bX][bY].Cheat.Color = SelectedColor
            end
        end
        if not IsEntered then
            if input.KeyCode == Enum.KeyCode.Up then
                Cheats[bX][bY].Cheat.Color = Color3.new(1, 1, 1)
                updatePos(Vector2.new(0,1))
            end
            if input.KeyCode == Enum.KeyCode.Down then
                Cheats[bX][bY].Cheat.Color = Color3.new(1, 1, 1)
                updatePos(Vector2.new(0,-1))
            end
            if input.KeyCode == Enum.KeyCode.Left then
                Cheats[bX][bY].Cheat.Color = Color3.new(1, 1, 1)
                updatePos(Vector2.new(1,0))
            end
            if input.KeyCode == Enum.KeyCode.Right then
                Cheats[bX][bY].Cheat.Color = Color3.new(1, 1, 1)
                updatePos(Vector2.new(-1,0))
            end
        else
            if input.KeyCode == Enum.KeyCode.Left then
                Cheats[bX][bY]:LeftDown()
            end
            if input.KeyCode == Enum.KeyCode.Right then
                Cheats[bX][bY]:RightDown()
            end
        end
    end
end)

Services.UserInputService.InputEnded:Connect(function(input)
    if Services.UserInputService:GetFocusedTextBox() then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if IsEntered then
            if input.KeyCode == Enum.KeyCode.Left then
                Cheats[bX][bY]:LeftUp()
            end
            if input.KeyCode == Enum.KeyCode.Right then
                Cheats[bX][bY]:RightUp()
            end
        end
    end
end)



local function Rainbow(speed, saturation, brightness) 
	if speed == nil then
		speed = 3
	end
	if saturation == nil then
		saturation = 0.5
	end
	if brightness == nil then
		brightness = 1
	end
	return Color3.fromHSV(math.sin((tick() / (3/speed)) % 1), saturation, brightness) 
end

local function CreateText(p)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = p
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = false
    BillboardGui.Adornee = p
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 0, 0, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 0, 0, 0)
    TextLabel.Font = Enum.Font.Code
    TextLabel.Text = p.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 14.000
    TextLabel.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
    TextLabel.TextStrokeTransparency = 1.000

    table.insert(TextESPS, BillboardGui)
end

local function CreateObjectiveText(p)
    local BillboardGui = Instance.new("BillboardGui")
    local TextLabel = Instance.new("TextLabel")

    BillboardGui.Parent = p
    BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    BillboardGui.Active = false
    BillboardGui.Adornee = p
    BillboardGui.AlwaysOnTop = true
    BillboardGui.LightInfluence = 1.000
    BillboardGui.Size = UDim2.new(0, 0, 0, 0)

    TextLabel.Parent = BillboardGui
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.BackgroundTransparency = 1.000
    TextLabel.Size = UDim2.new(0, 0, 0, 0)
    TextLabel.Font = Enum.Font.Code
    TextLabel.Text = p.Name
    TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextLabel.TextSize = 0.000
    TextLabel.TextStrokeColor3 = Color3.fromRGB(50, 50, 50)
    TextLabel.TextStrokeTransparency = 1

    table.insert(ObjectiveESPS, BillboardGui)

    while TextLabel.Parent do
        wait()
        TextLabel.TextColor3 = Rainbow(3, 0.7, 1)
    end
end
pcall(function()
addCategory("Gun Mods")

addCheat("Infinite Mag", 1, {
    Data = {"OFF", "ON"},
    Colors = {Color3.new(1,1,1), Color3.new(1,0,0)}
})

    addCheat("Infinite Ammo", 1, {
    Data = {"OFF", "ON"},
    Colors = {Color3.new(1,1,1), Color3.new(1,0,0)}
})
end)



Services.RunService.RenderStepped:connect(updateCircle)

local function getCorners(obj, size)
	local corners = {
		Vector3.new(obj.X+size.X/2, obj.Y+size.Y/2, obj.Z+size.Z/2);
		Vector3.new(obj.X-size.X/2, obj.Y+size.Y/2, obj.Z+size.Z/2);
		
		Vector3.new(obj.X-size.X/2, obj.Y-size.Y/2, obj.Z-size.Z/2);
		Vector3.new(obj.X+size.X/2, obj.Y-size.Y/2, obj.Z-size.Z/2);
		
		Vector3.new(obj.X-size.X/2, obj.Y+size.Y/2, obj.Z-size.Z/2);
		Vector3.new(obj.X+size.X/2, obj.Y+size.Y/2, obj.Z-size.Z/2);
		
		Vector3.new(obj.X-size.X/2, obj.Y-size.Y/2, obj.Z+size.Z/2);
		Vector3.new(obj.X+size.X/2, obj.Y-size.Y/2, obj.Z+size.Z/2);
	}
	return corners
end

local index = 0
local White = Color3.new(1,1,1)
local v2 = Vector2.new
local function createESPModule(zombie)
    index = index + 1
    local bruh = index
    local Module = {}
    local Steps = 0
    Module.Object = {
        Box = Drawing.new("Square"),
        Tracer = Drawing.new("Line"),
        Name = Drawing.new("Text"),
        Chams = Instance.new("Folder", game.CoreGui)
    }

    -- Init

    Module.Disable = function(self)
        self.Object.Box.Visible = false
        self.Object.Tracer.Visible = false
        self.Object.Name.Visible = false
        for i,v in pairs(self.Object.Chams:GetChildren()) do
            v.Transparency = 1
        end
    end

    Module.CalculateColor = function(self)
        if zombie == aimtarget then
            return White
        else
            return Color3.new(1,0,0)
        end
    end

    Module.EnableBox = function(self, xMin, yMin, xMax, yMax)
        local Box = self.Object.Box
        Box.Visible = false
        Box.Color = self:CalculateColor()
        Box.Thickness = 1
        Box.Transparency = 0.7
        Box.Position = v2(xMin, yMin)
        Box.Size = v2(0, 0)
    end

    Module.EnableTracer = function(self, xMin, yMin, xMax, yMax)
        local Tracer = self.Object.Tracer
        Tracer.Visible = true
        Tracer.Color = self:CalculateColor()
        Tracer.Thickness = 1
        Tracer.From = v2(Local.Camera.ViewportSize.X/2, Local.Camera.ViewportSize.Y)

        local half = (xMax-xMin)/2
        Tracer.To = v2(xMin + half, yMax)
    end

    Module.EnableName = function(self, xMin, yMin, xMax, yMax)
        local Name = self.Object.Name
        Name.Visible = false
        Name.Color = self:CalculateColor()

        Name.Size = 0
        Name.Center = true
        Name.Outline = true

        Name.Text = zombie.Name

        local half = (xMax-xMin)/2
        Name.Position = v2(xMin + half, yMin - Name.TextBounds.Y)
    end

    Module.EnableChams = function(self)
        for i,v in pairs(self.Object.Chams:GetChildren()) do
            v.Transparency = 1
        end
    end

    zombie.ChildAdded:connect(function(p)
        if Settings["Chams"] == "ON" and p:IsA("BasePart") then
            local Cham = Instance.new("BoxHandleAdornment", Module.Object.Chams)
            Cham.Adornee = p
            Cham.AlwaysOnTop = true
            Cham.ZIndex = 1
            Cham.Transparency = 1
            Cham.Size = ((p.Name ~= "Head" and p.Size) or Vector3.new(1,1,1))
            Cham.Color3 = Module:CalculateColor()
        end
    end)

    Module.Update = function(self)  
        local cf, size = zombie:GetBoundingBox()

        local allCorners = getCorners(cf, size)

        local xMin = Local.Camera.ViewportSize.X
        local yMin = Local.Camera.ViewportSize.Y
        local xMax = 0
        local yMax = 0

        local OnScreen = false
        for i,v in pairs(allCorners) do
            local pos, ons = Local.Camera:WorldToViewportPoint(v)
            if pos.X > xMax then
                xMax = pos.X
            elseif pos.X < xMin then
                xMin = pos.X
            end
            
            if pos.Y > yMax then
                yMax = pos.Y
            elseif pos.Y < yMin then
                yMin = pos.Y
            end

            if ons then
                OnScreen = true
            end
        end

        if OnScreen then
            local switch = {
                Settings["Chams"] == "ON",
                Settings["Tracers"] == "ON",
                Settings["Boxes"] == "ON",
                Settings["Names"] == "ON" --toggles
            }

            if switch[1] then 
                self:EnableChams()
            else
                for i,v in pairs(self.Object.Chams:GetChildren()) do
                    v.Transparency = 1
                end
            end
            if switch[2] then 
                self:EnableTracer(xMin, yMin, xMax, yMax)
            else
                self.Object.Tracer.Visible = false
            end
            if switch[3] then 
                self:EnableBox(xMin, yMin, xMax, yMax)
            else
                self.Object.Box.Visible = false
            end
            if switch[4] then 
                self:EnableName(xMin, yMin, xMax, yMax) 
            else
                self.Object.Name.Visible = false
            end
        else
            self:Disable()
        end
    end

    Module.Unbind = function(self)
        self:Disable()
        Services.RunService:UnbindFromRenderStep("zombie"..bruh)
    end

    Services.RunService:BindToRenderStep("zombie"..bruh, 1, function()
        Steps = Steps + 1
        if Steps % 2 == 0 then return end
        if not zombie or not zombie:FindFirstChild("Head") then
            return Module:Unbind()
        end
        local pos, onscreen = Local.Camera:WorldToScreenPoint(zombie.Head.Position)
        if not onscreen then
            return Module:Disable()
        end
        Module:Update()
    end)

    return Module
end




Items.ChildAdded:connect(function(v)
    if Settings["Item ESP"] == "ON" then
        CreateText(v)
    end
end)

Objectives.ChildAdded:connect(function(v)
    if Settings["Objective ESP"] == "ON" then
        CreateObjectiveText(v)
    end
end)

Infected.ChildAdded:connect(createESPModule)

Cheats[bX][bY].Cheat.Color = SelectedColor

old = hookfunction(getrawmetatable(game).__namecall, function(self, ...)
	local method = getnamecallmethod()
	local args = {...}

	if args[1] == "CheatKick" then 
		print("blocked attempt")
		return
    end

    if method == "FireServer" and args[1] == "GenerateExplosion" then
        local v75 = nil;
        local v76 = string.reverse(tostring(Game.Nevermore:GetTime() * 1 + 1337));
        local v77 = string.sub(v76, string.len(v76) - 5, string.len(v76) - 3) .. string.sub(v76, 1, string.len(v76) - 10) .. string.sub(v76, string.len(v76) - 2, string.len(v76)) .. string.sub(v76, string.len(v76) - 9, string.len(v76) - 6);
        v75 = "";
        for v78 = 1, string.len(v77) do
            local v79 = string.sub(v77, v78, v78);
            local v80 = v79;
            if u4[v79] then
                v80 = u4[v79];
            end;
            v75 = v75 .. v80;
        end;
        print(v75, args[2])
    end
    
    if method == "FireServer" and typeof(args[2]) == "table" and typeof(args[1]) == "string" then
        if args[1] == "GlobalReplicate" or args[1] == "UpdateMag" then
            return old(self, ...)
        end
        if args[2]["AIs"] and Settings["Instakill"] == "ON" then
            for i,v in pairs(args[2]["AIs"][1]) do
                if typeof(v) == "number" then
                    args[2]["AIs"][1][i] = 500
                    return old(self, unpack(args))
                end
            end
        end
    end

	return old(self, unpack(args))
end)

local function GetDistanceSq3(v1, v2) -- yeah optimization
	local a = v2.x - v1.x
	local b = v2.y - v1.y
	local c = v2.z - v1.z
    return a*a + b*b + c*c
end

local function GetDistanceSq(v1, v2) -- yeah optimization
    local a = v2.X - v1.X
    local b = v2.Y - v1.Y
    return (a*a) + (b*b)
end;

local gravReset = nil

Local.Player.CharacterAdded:connect(function(c)
    hum = c:WaitForChild("Humanoid")
    if Settings["Fly"] == "ON" then
        if gravReset then
            gravReset:Disconnect()
        end
        workspace.Gravity = 0
        local function swimDied()
            workspace.Gravity = 198.2
        end
        gravReset = hum.Died:connect(swimDied)
        hum:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Flying,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Landed,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Physics,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Running,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)
        hum:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)
        hum:ChangeState(Enum.HumanoidStateType.Swimming)
    end
end)

local up = Game.Interact.Update
Game.Interact.Update = function(p15, p16, p17, p18, p19, p20, p21, p22)
    if p16.Equipped then
        if p16.WeaponModule.Stats.Mag and Settings["Infinite Mag"] == "OFF" then
            p18[p16.Equipped].Mag = p16.WeaponModule.Stats.Mag
        end
        if p16.WeaponModule.Stats.Pool and Settings["Infinite Ammo"] == "OFF" then
            p18[p16.Equipped].Pool = p16.WeaponModule.Stats.Pool
        end
        if p16.WeaponModule.Stats.RPM then
        end
        for i,v in pairs({"VerticleRecoil", "HorizontalRecoil", "RecoilShake"}) do
            if Settings["No Recoil"] == "ON" then
                p18[p16.Equipped][v] = 0
            else
                p18[p16.Equipped][v] = p16.WeaponModule.Stats[v]
            end
        end
        p16.Perks = Modules.Perks.Marksman
    end
    return up(p15, p16, p17, p18, p19, p20, p21, p22)
end

Fire = Game.Bullets.Fire
Game.Bullets.Fire = function(p16, p17, p18, p19, p20, p21, p22)
    if p21 and Settings["Silent Aim"] == "ON" then
        if aimtarget and aimtarget:FindFirstChild("Head") then 
            local pos, onscreen = Local.Camera:WorldToScreenPoint(aimtarget.Head.Position)
            if Settings["Visible Only"] == "ON" and onscreen then
                local ignorelist = {Local.Camera, Local.Player.Character, aimtarget}
                local parts = Local.Camera:GetPartsObscuringTarget({aimtarget.Head.Position}, ignorelist)
                onscreen = #parts == 0
            end
            if onscreen then
                p19 = math.random()*100 < tonumber(Settings["Headshot Rate"]) and aimtarget.Head.CFrame or aimtarget.Torso.CFrame
            end
		end
	end
	return Fire(p16, p17, p18, p19, p20, p21, p22)
end

local function GetNearestPlayerCFrame()
    local shortestDistance = math.huge
    local target

    for i, v in pairs(Infected:GetChildren()) do
        if v:FindFirstChild("Head") then
            local pos, onscreen = Local.Camera:WorldToScreenPoint(v.Head.Position)
            if onscreen then
                local magnitude = GetDistanceSq3(pos, Vector3.new(Local.Mouse.X, Local.Mouse.Y, 0))
                if Settings["FOV Circle"] == "ON" and GetDistanceSq(pos, Vector2.new(Local.Mouse.X, Local.Mouse.Y)) < tonumber(Settings["FOV Circle Radius"]) then

                end
                if magnitude < shortestDistance then
                    target = v
                    shortestDistance = magnitude
                end
            end
        end
    end

    return target
end

end)
