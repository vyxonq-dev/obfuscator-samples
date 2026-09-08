--yes the script is open source now :)

repeat
    wait()
until game:IsLoaded() == true

local REP = true

if REP == true then
    if _G.Celerity == true then
        warn("Already Executed A Celerity Script. | Celerity")
        wait(1234567890)
    else
        warn("Executing Celerity. | Celerity")
    end
end

_G.Celerity = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Key = loadstring(game:HttpGet('https://raw.githubusercontent.com/isaberjan420/Roblox/refs/heads/main/Key'))()

local Players = game:GetService("Players")
local Replicated_Storage = game:GetService("ReplicatedStorage")
local Run_Service = game:GetService("RunService")
local Debris = game:GetService("Debris")
getgenv().Intensity = 1
getgenv().Rate = 1
getgenv().Table_Whitelist = {"Roblox"}
getgenv().Raw_Ping = 100
local Local_Player = Players.LocalPlayer
local Current_Target = ""
local Smart_Loop_Teleport_State = false
local Smart_Velocity_State = false
local Loop_Targeted_Slap_State = false
local Slap_Aura_State = false
local Hyper_Form_State = false
local ampersand = "&"
local AF = true
local Targeted_Part = "Head"
local Slap_Animation_State = false
local EV = true
local PM = .001

getgenv().Upper_Barrier = workspace.Arena["main island"].Grass:Clone()
Upper_Barrier.Parent = Replicated_Storage
Upper_Barrier.Transparency = 1
Upper_Barrier.Size = Vector3.new(2, 2048, 2048)
Upper_Barrier.Position = Vector3.new(0, -9.15, 0)
Upper_Barrier.Name = "Upper Barrier"
Upper_Barrier.CastShadow = false
Upper_Barrier.Locked = true

getgenv().Lower_Barrier = workspace.Arena.island4.Grass:Clone()
Lower_Barrier.Parent = Replicated_Storage
Lower_Barrier.Transparency = 1
Lower_Barrier.Size = Vector3.new(2, 2048, 2048)
Lower_Barrier.Position = Vector3.new(0, -19.7, 0)
Lower_Barrier.Name = "Lower Barrier"
Lower_Barrier.CastShadow = false
Lower_Barrier.Locked = true

getgenv().Bottom_Barrier = workspace.Arena.island4.Grass:Clone()
Bottom_Barrier.Parent = Replicated_Storage
Bottom_Barrier.Transparency = 1
Bottom_Barrier.Size = Vector3.new(5, 2048, 2048)
Bottom_Barrier.Position = Vector3.new(0, -49990, 0)
Bottom_Barrier.Name = "Bottom Barrier"
Bottom_Barrier.CastShadow = false
Bottom_Barrier.Locked = true
Bottom_Barrier.Touched:Connect(function(Part)
    if Part.Parent.Name == Local_Player.Name and Part.Parent:IsA("Model") then
        Local_Player.Character.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        Part.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
        Part.Parent:MoveTo(Vector3.new(0, 10, 0))
    end
end)

--Pre Functions--

local function PNP(Part)
    local Ping = ((Raw_Ping*PM)+(Players.LocalPlayer:GetNetworkPing()*2))/2
    --local Calculation = Part.Position + ((Part.AssemblyLinearVelocity + Part.AssemblyAngularVelocity:Cross(Part.Position - Part.AssemblyCenterOfMass)) * Ping)
    local Calculation = Part.Position + ((Part.AssemblyLinearVelocity*1.1)*Ping)
    return Calculation
end

local function Is_Number(Number)
    if tonumber(Number) > 1 and tonumber(Number) < 1000 then
        return true
    end
end

local function Not_Ragdolled(Character)
    local Decision = true
    for i, v in ipairs(Character:GetChildren()) do
        local Name = string.lower(v.Name)
        if string.match(Name, "fake") then
            Decision = false
        end
    end
    return Decision
end

local function Not_Reversed(Character)
    local Decision = true
    for i, v in ipairs(Character:GetChildren()) do
        if v.Name == "Reversed" then
            Decision = false
        end
    end
    return Decision
end

local function Equipped(Character)
    local Decision = false
    pcall(function()
        for i, v in ipairs(Character:GetChildren()) do
            if v:IsA("Tool") then
                Decision = true
            end
        end
    end)
    return Decision
end

local function Slap_Animation_Function()
    if (Slap_Animation_State and Slap_Aura_State and Equipped(Local_Player.Character)) or (Slap_Animation_State and Loop_Targeted_Slap_State and Equipped(Local_Player.Character)) then
        local AX = Local_Player.Character:FindFirstChildWhichIsA("Humanoid").Animator:LoadAnimation(Replicated_Storage.Slap)
        AX:Play()
    end
end

local function Not_Any_Rock(Character)
    local Decision = true
    for i, v in ipairs(Character:GetChildren()) do
        if v.Name == "rock" or v.Name == "stevebody" or v.Name == "Sphere" then
            Decision = false
        end
    end
    return Decision
end

local function E_FLAG(Character)
    pcall(function()
        if string.match(Character.Head.Nametag.TextLabel.Text, "(Exploiter)") then
            --pass
        else
            Character.Head.Nametag.TextLabel.Text = Character.Head.Nametag.TextLabel.Text.." (Exploiter)"
        end
    end)
end

local function Not_Shield(Character)
    local Decision = true
    for i, v in ipairs(Character:GetDescendants()) do
        if string.match(v.Name, "Shield") then
            Decision = false
        end
    end
    return Decision
end

local function Snatch_Age()
    local len = string.len("Server age in minutes: ")
    return (string.sub(workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text, len))
end

local function Cooldown(Character)
    local Decision = false
    pcall(function()
        if Character.LastSlappedBy.Value == Local_Player.Name then
            Decision = true
        end
    end)
    return Decision
end

local function Slappable(Character)
    local Decision = false
    if Character.isInArena.Value == true then
        Decision = true
    elseif Character.IsInDefaultArena.Value == true then
        Decision = true
    end
    return Decision
end

local function Get_Closest_Player()
    local Ping = Raw_Ping*PM
    local Influence = Ping/4
    local Closest_Player = Local_Player
    local Minimum_Distance = 1234522267898
    local FD = 200
    for i, v in ipairs(Players:GetPlayers()) do
        local Character = v.Character
        local nr = Not_Reversed(Character)
        local nar = Not_Any_Rock(Character)
        local ns = Not_Shield(Character)
        if v == Local_Player or v.Name == Local_Player.Name or ns == false or Character:FindFirstChildWhichIsA("Humanoid").Health < .1 or table.find(Table_Whitelist, v.Name) or nr == false or nar == false then
            --pass
        else
            local y = Not_Ragdolled(Character)
            local b = Slappable(Character)
            if y == true and b == true then
                local Distance = ((Character.Head.Position - (Character.Head.AssemblyLinearVelocity*Influence)) - (Local_Player.Character.Head.Position + (Local_Player.Character.Head.AssemblyLinearVelocity*Influence))).Magnitude
                if Distance < Minimum_Distance then
                    Minimum_Distance = Distance
                    Closest_Player = v
                    FD = Distance
                end
            end
        end
    end
    return {Closest_Player, FD}
end

local function Slap_Closest()
    local X = Get_Closest_Player()[1]
    local Y = X.Character:FindFirstChild(Targeted_Part)
    Replicated_Storage.KSHit:FireServer(Y)
end

local function Safe_Pos(Position)
    local Decision = true
    local total = Position.Magnitude
    if total > 40000 then
        Decision = false
    end
    return Decision
end

local function Smart_Teleport(Part)
    local NewPos = PNP(Part)
    local Res = CFrame.new(NewPos) * Local_Player.Character.PrimaryPart.CFrame.Rotation
    if Safe_Pos(NewPos) == true then
        Local_Player.Character:SetPrimaryPartCFrame(Res)
    end
    Local_Player.Character.PrimaryPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
end

local function Teleport(Position)
    Local_Player.Character:MoveTo(Position)
end

local function Create_Velocity()
    while task.wait(.02) do
        pcall(function()
            local Result = true
            for i, v in ipairs(Local_Player.Character.HumanoidRootPart:GetChildren()) do
                if v.Name == "Celerity" then
                    Result = false
                end
            end
            if Result == true then
                local Velocity = Instance.new("BodyPosition", Local_Player.Character.HumanoidRootPart)
                Velocity.Name = "Celerity"
                Velocity.MaxForce = Vector3.new(0, 0, 0)
                Velocity.P = 10000
                Velocity.D = 100
            end
        end)
    end
end

local function Edit_Velocity(Part)
    for i, v in ipairs(Local_Player.Character.HumanoidRootPart:GetChildren()) do
        if v.Name == "Celerity" then
            local NewPos = PNP(Part)
            if Safe_Pos(NewPos) == true then
                v.Position = NewPos
            end
        end
    end
end

local function Velocity_State_Loop()
    while task.wait(.02) do
        pcall(function()
            for i, v in ipairs(Local_Player.Character.HumanoidRootPart:GetChildren()) do
                for i, v in ipairs(Local_Player.Character.HumanoidRootPart:GetChildren()) do
                    if v.Name == "Celerity" then
                        if Smart_Velocity_State == true then
                            v.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                        else
                            v.MaxForce = Vector3.new(0, 0, 0)
                        end
                    end
                end
            end
        end)
    end
end

local function God_Mode()
    local Check = Slappable(Local_Player.Character)
    if Check == true then
        Local_Player.Character:FindFirstChildWhichIsA("Humanoid").Health = 0
        Local_Player.CharacterAdded:Wait()
        wait(.5)
    end
    Teleport(Vector3.new(-4.088, 10, 1.836))
end

local function Identify(PlaceId)
    if PlaceId == 124596094333302 then
        return "New Players"
    elseif PlaceId == 6403373529 then
        return "Regular"
    elseif PlaceId == 11520107397 then
        return "Killstreak"
    elseif PlaceId == 9015014224 then
        return "No One Shot Gloves"
    else
        return "Unkown"
    end
end

local function Return_Player_Character_Root(Hint)
    local Player = nil
    local True_Hint = string.lower(Hint)
    for i, v in ipairs(Players:GetPlayers()) do
        local True_Name = string.lower(v.Name)
        local True_Display_Name = string.lower(v.DisplayName)
        if string.match(True_Name, True_Hint) or string.match(True_Display_Name, True_Hint) then
            Player = v
        end
    end
    return Player.Character:FindFirstChild(Targeted_Part)
end

--Pre Functions--
local Window = Rayfield:CreateWindow({
    Name = "Celerity | Slap Battles",
    Icon = "crown",
    LoadingTitle = "Celerity",
    LoadingSubtitle = "By Celerity",
    Theme = {
        TextColor = Color3.fromRGB(240, 240, 240),
    
        Background = Color3.fromRGB(25, 15, 15),
        Topbar = Color3.fromRGB(40, 20, 20),
        Shadow = Color3.fromRGB(15, 5, 5),
    
        NotificationBackground = Color3.fromRGB(35, 20, 20),
        NotificationActionsBackground = Color3.fromRGB(60, 30, 30),
    
        TabBackground = Color3.fromRGB(50, 25, 25),
        TabStroke = Color3.fromRGB(90, 40, 40),
        TabBackgroundSelected = Color3.fromRGB(120, 40, 40),
        TabTextColor = Color3.fromRGB(240, 240, 240),
        SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
    
        ElementBackground = Color3.fromRGB(45, 20, 20),
        ElementBackgroundHover = Color3.fromRGB(70, 30, 30),
        SecondaryElementBackground = Color3.fromRGB(35, 15, 15),
        ElementStroke = Color3.fromRGB(100, 50, 50),
        SecondaryElementStroke = Color3.fromRGB(80, 40, 40),
    
        SliderBackground = Color3.fromRGB(150, 50, 50),
        SliderProgress = Color3.fromRGB(200, 60, 60),
        SliderStroke = Color3.fromRGB(220, 80, 80),
    
        ToggleBackground = Color3.fromRGB(35, 10, 10),
        ToggleEnabled = Color3.fromRGB(200, 50, 50),
        ToggleDisabled = Color3.fromRGB(80, 40, 40),
        ToggleEnabledStroke = Color3.fromRGB(230, 70, 70),
        ToggleDisabledStroke = Color3.fromRGB(100, 50, 50),
        ToggleEnabledOuterStroke = Color3.fromRGB(50, 25, 25),
        ToggleDisabledOuterStroke = Color3.fromRGB(40, 20, 20),
    
        DropdownSelected = Color3.fromRGB(60, 30, 30),
        DropdownUnselected = Color3.fromRGB(45, 20, 20),
    
        InputBackground = Color3.fromRGB(30, 10, 10),
        InputStroke = Color3.fromRGB(90, 40, 40),
        PlaceholderColor = Color3.fromRGB(160, 100, 100)
    },

    DisableRayfieldPrompts = true,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
    Enabled = false,
    FolderName = nil,
    FileName = "Celerity"
    },

    Discord = {
    Enabled = false,
    Invite = "https://discord.gg/mnUfGWEbXH",
    RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
    Title = "Celerity",
    Subtitle = "Key System",
    Note = "Join The Discord",
    FileName = "CKey",
    SaveKey = true,
    GrabKeyFromSite = false,
    Key = {Celerity_Key}
    }
})

local Info = Window:CreateTab("Info", "info")

local Player_Count = Info:CreateLabel("Players: "..#Players:GetPlayers())

local azyb1 = (Identify(game.PlaceId))

local azyb2 = (Snatch_Age())

local Server_Type = Info:CreateLabel("Server Type: "..azyb1)

local Server_Age = Info:CreateLabel("Server Age: "..azyb2.." Minutes")

local Slap_Aura = Window:CreateTab("Slap Aura", "sword")

local MS1 = Slap_Aura:CreateSection("Customization "..ampersand.." Usage")

local Glove_Picker = Slap_Aura:CreateDropdown({
    Name = "Glove",
    Options = {"Killstreak"},
    CurrentOption = {"Killstreak"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
    --pass
    end,
})

local Target_Part_Dropdown = Slap_Aura:CreateDropdown({
    Name = "Target Part",
    Options = {"Head", "Torso", "HumanoidRootPart"},
    CurrentOption = {"Head"},
    MultipleOptions = false,
    Flag = "Dropdown1",
    Callback = function(Options)
    Targeted_Part = Options[1]
    end,
})

local Slap_Animation_Toggle = Slap_Aura:CreateToggle({
    Name = "Slap Animation",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    Slap_Animation_State = Value
    end,
})

local Slap_Aura_Toggle = Slap_Aura:CreateToggle({
    Name = "Slap Aura",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    Slap_Aura_State = Value
    end,
})

local Exploter_Combat = Window:CreateTab("Exploiter Combat", "swords")

local MS2 = Exploter_Combat:CreateSection("Customization "..ampersand.." Usage")

local Gameplay = Window:CreateTab("Gameplay", "gamepad")

local silly = Gameplay:CreateSection("silly stuff :3")

local Hyper_Form_Toggle = Gameplay:CreateToggle({
    Name = "Hyper Form",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    Hyper_Form_State = Value
    end,
})

local Intensity_Slider = Gameplay:CreateSlider({
    Name = "Intensity",
    Range = {1, 100},
    Increment = 1,
    Suffix = "Intensity",
    CurrentValue = 1,
    Flag = "Slider1",
    Callback = function(Value)
    Intensity = Value
    end,
})

local Rate_Slider = Gameplay:CreateSlider({
    Name = "Rate",
    Range = {1, 100},
    Increment = 1,
    Suffix = "Rate",
    CurrentValue = 1,
    Flag = "Slider1",
    Callback = function(Value)
    Rate = Value
    end,
})

local Anti_Slapstick_Toggle = Gameplay:CreateToggle({
    Name = "Anti Lag",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    --pass
    end,
})

workspace.DescendantAdded:Connect(function(d)
    if Anti_Slapstick_Toggle.CurrentValue == true then
        local Lower = string.lower(d.Name)
        if string.match(Lower, "charge") or string.match(Lower, "cartoon") or string.match(Lower, "blur") then
            wait(.01)
            d:Destroy()
        end
    end
end)

local function Glove()
    local Glove = nil
    for i, v in ipairs(Local_Player.Backpack:GetChildren()) do
        if v:IsA("Tool") then
            Glove = v
        end
    end
    for i, v in ipairs(Local_Player.Character:GetChildren()) do
        if v:IsA("Tool") then
            Glove = v
        end
    end
    return Glove
end

local function Process(Clone)
    workspace.Lobby.Teleport1.CanTouch = false
    Local_Player.Character:FindFirstChildWhichIsA("Humanoid").Health = 0
    Local_Player.CharacterAdded:Wait()
    wait(.5)
    Local_Player.Character:MoveTo(Vector3.new(0, 0, 0))
    Clone.Parent = Local_Player.Backpack
    wait(.1)
    Clone.Parent = Local_Player.Character
    workspace.Lobby.Teleport1.CanTouch = true
    warn("Glove God Mode Loaded. | Celerity")
end

local God_Button = Gameplay:CreateButton({
    Name = "Glove God Mode",
    Callback = function()
    local x, y = pcall(Slappable, Local_Player.Character)
    if y == true then
        local a, b = pcall(Glove)
        local Clone = b:Clone()
        Clone.Parent = Replicated_Storage
        pcall(Process, Clone)
    end
    end,
})

local Whitelist_Section = Gameplay:CreateSection("Whitelist")

local Whitelist_Dropdown = Gameplay:CreateDropdown({
    Name = "Whitelist",
    Options = {"Pick Players"},
    CurrentOption = {"Pick Players"},
    MultipleOptions = true,
    Flag = "Dropdown1",
    Callback = function(Options)
    Table_Whitelist = Options
    end,
})

local function Update_Players_List()
    local t = {}
    for _, v in ipairs(Players:GetPlayers()) do
        if v ~= Local_Player then
            table.insert(t, v.Name)
        end
    end
    Whitelist_Dropdown:Refresh(t)
    Table_Whitelist = {}
end

Update_Players_List()

local Refresh_List = Gameplay:CreateButton({
    Name = "Refresh Player List",
    Callback = function()
    Update_Players_List()
    end,
})

local Target = Exploter_Combat:CreateInput({
    Name = "Target",
    CurrentValue = "",
    PlaceholderText = "Enter Target",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
    Current_Target = Text
    end,
})

local Ping = Exploter_Combat:CreateInput({
    Name = "Ping",
    CurrentValue = "",
    PlaceholderText = "Your Ping",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
    local a, y = pcall(Is_Number, Text)
    if y == true then
        Raw_Ping = tonumber(Text)
        warn("Ping Set To "..Text..". | Celerity")
    end
    end,
})

local Auto_Target = Exploter_Combat:CreateButton({
    Name = "Auto Pick Target",
    Callback = function()
    local x, y = pcall(Get_Closest_Player)
    Target:Set(y[1].Name)
    end,
})

local Smart_Teleport_Toggle = Exploter_Combat:CreateToggle({
    Name = "Smart Teleport (4 Dimensional)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    Smart_Loop_Teleport_State = Value
    end,
})

local Smart_Velocity_Toggle = Exploter_Combat:CreateToggle({
    Name = "Smart Teleport (3 Dimensional)",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    Smart_Velocity_State = Value
    end,
})

local Protection = Gameplay:CreateSection("Protection")

local God_Mode_Button = Gameplay:CreateButton({
    Name = "God Mode",
    Callback = function()
    local x, y = pcall(God_Mode)
    end,
})

local Upper_Barrier_Toggle = Gameplay:CreateToggle({
    Name = "Upper Barrier",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    if Value == true then
        Upper_Barrier.Parent = workspace
    elseif Value == false then
        Upper_Barrier.Parent = Replicated_Storage
    end
    end,
})

local Lower_Barrier_Toggle = Gameplay:CreateToggle({
    Name = "Lower Barrier",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    if Value == true then
        Lower_Barrier.Parent = workspace
    elseif Value == false then
        Lower_Barrier.Parent = Replicated_Storage
    end
    end,
})

local Bottom_Barrier_Toggle = Gameplay:CreateToggle({
    Name = "Bottom Barrier",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    if Value == true then
        Bottom_Barrier.Parent = workspace
    elseif Value == false then
        Bottom_Barrier.Parent = Replicated_Storage
    end
    end,
})

local COD = workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]

local Anti_Cube_Of_Death = Gameplay:CreateToggle({
    Name = "Anti Cube-Of-Death",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    if Value == true then
        COD.Part.Size = Vector3.new(10, 10, 10)
        COD.Part.CanCollide = true
        COD.CanTouch = false
        COD.Part.Locked = true
    elseif Value == false then
        COD.Part.Size = Vector3.new(1, 1, 1)
        COD.Part.CanCollide = false
        COD.CanTouch = true
        COD.Part.Locked = true
    end
    end,
})

local Targeted_Slap_Toggle = Exploter_Combat:CreateToggle({
    Name = "Loop Targeted Slap",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
    Loop_Targeted_Slap_State = Value
    end,
})

local Anti_Fling_Toggle = Exploter_Combat:CreateToggle({
    Name = "Anti Fling",
    CurrentValue = true,
    Flag = "Toggle1",
    Callback = function(Value)
    AF = Value
    end,
})

local function Update_Players()
    Player_Count:Set("Players: "..#Players:GetPlayers())
end

local function Update_Server_Type()
    local type = (Identify(game.PlaceId))
    Server_Type:Set("Server Type: "..type)
end

local function Update_Server_Age()
    local x = (Snatch_Age())
    Server_Age:Set("Server Age: "..x.." Minutes")
end

local function Targeted_Slap_Loop()
    while true do
        local Delay = .57
        local Fast_Delay = .45
        local dvdr = 1
        if Loop_Targeted_Slap_State == true then
            pcall(function()
                local b = Return_Player_Character_Root(Current_Target)
                dvdr = b.AssemblyLinearVelocity.Magnitude
                Replicated_Storage.KSHit:FireServer(b)
            end)
        end
        if dvdr > 3000 then
            task.wait()
        elseif dvdr > 1500 then
            task.wait(Fast_Delay)
        else
            wait(Delay)
        end
    end
end

local function Ultra_Instinct(Character)
    local Decision = false
    for i, v in ipairs(Character:GetChildren()) do
        if string.match(v.Name, "Ultra") then
            Decision = true
        end
    end
    return Decision
end

local function Slap_Aura_Loop()
    while task.wait(.02) do
        if (Slap_Aura_State == true and Loop_Targeted_Slap_State == false) == true then
            pcall(function()
                local b = Get_Closest_Player()
                local z = Cooldown(b[1].Character)
                local f = Ultra_Instinct(b[1].Character)
                local sqrt = b[2]
                if sqrt < 80 then
                    if f == true then
                        Slap_Closest()
                        wait(.7)
                        warn("Ultra Instinct Detected. | Celerity")
                    elseif z == true then
                        Slap_Closest()
                        wait(.6)
                    else
                        Slap_Closest()
                        wait(.5)
                    end
                end
            end)
        end
    end
end

local ohString1 = "fullcharged"
local ttt = 1

local function Hyper_Form_Loop()
    while true do
        if Hyper_Form_State == true then
            for i = 1, Intensity do
                game:GetService("ReplicatedStorage").slapstick:FireServer(ohString1)
            end
        end
    task.wait(ttt/Rate)
    end
end

local function Update_Players_Loop()
    while task.wait(.1) do
        local x, y = pcall(Update_Players)
    end
end

local function ONO()
    while task.wait(.5) do
        if Smart_Teleport_Toggle.CurrentValue == true then
            Smart_Loop_Teleport_State = false
            task.wait(.025)
            Smart_Loop_Teleport_State = Smart_Teleport_Toggle.CurrentValue
        end
    end
end

local function SA()
    while true do
        local Time = (math.random(500, 900)/1000)
        pcall(Slap_Animation_Function)
        task.wait(Time)
    end
end

local function AFA()
    if AF == true then
        if Local_Player.Character.HumanoidRootPart.AssemblyLinearVelocity.X < -500 or Local_Player.Character.HumanoidRootPart.AssemblyLinearVelocity.X > 500 or Local_Player.Character.HumanoidRootPart.AssemblyLinearVelocity.Y < -400 or Local_Player.Character.HumanoidRootPart.AssemblyLinearVelocity.Y > 400 or Local_Player.Character.HumanoidRootPart.AssemblyLinearVelocity.Z < -500 or Local_Player.Character.HumanoidRootPart.AssemblyLinearVelocity.Z > 500 or Local_Player.Character.HumanoidRootPart.AssemblyAngularVelocity.X < -50 or Local_Player.Character.HumanoidRootPart.AssemblyAngularVelocity.X > 50 or Local_Player.Character.HumanoidRootPart.AssemblyAngularVelocity.Y < -50 or Local_Player.Character.HumanoidRootPart.AssemblyAngularVelocity.Y > 50 or Local_Player.Character.HumanoidRootPart.AssemblyAngularVelocity.Z < -50 or Local_Player.Character.HumanoidRootPart.AssemblyAngularVelocity.Z > 50 then
            if Smart_Velocity_State == false then Local_Player.Character.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0) Local_Player.Character.Head.AssemblyLinearVelocity = Vector3.new(0, 0, 0) end
            Local_Player.Character.HumanoidRootPart.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            Local_Player.Character.Head.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
            warn("Fling Stop Attempt. | Celerity")
        end
    end
end

local function AFC()
    while task.wait(.02) do
        pcall(function()
            if AF == true then
                for i, v in ipairs(Players:GetPlayers()) do
                    if v ~= Local_Player then
                        for a, b in ipairs(v.Character:GetChildren()) do
                            if b:IsA("BasePart") then
                                local level = 1
                                pcall(function()
                                    level = b.AssemblyLinearVelocity.Magnitude
                                end)
                                b.CanCollide = false
                                if level > 1500 then
                                    b.Anchored = true
                                    if EV == true then
                                        E_FLAG(b.Parent)
                                    end
                                    task.delay(1, function()
                                        b.Anchored = false
                                        b.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
                                    end)
                                end
                            end
                        end
                    end
                end
            end
        end)
    end
end

local function Anti_FlingA()
    pcall(AFA)
end

local CO1 = coroutine.create(Update_Players_Loop)
--local CO2 = coroutine.create(Smart_Teleport_Loop)
local CO3 = coroutine.create(Targeted_Slap_Loop)
local CO4 = coroutine.create(Slap_Aura_Loop)
local CO5 = coroutine.create(Hyper_Form_Loop)
local CO6 = coroutine.create(ONO)
local CO7 = coroutine.create(Update_Server_Type)
local CO8 = coroutine.create(Update_Server_Age)
local CO9 = coroutine.create(SA)
local CO10 = coroutine.create(Velocity_State_Loop)
local CO11 = coroutine.create(Create_Velocity)
coroutine.resume(CO1)
--coroutine.resume(CO2)
coroutine.resume(CO3)
coroutine.resume(CO4)
coroutine.resume(CO5)
coroutine.resume(CO6)
coroutine.resume(CO7)
coroutine.resume(CO8)
coroutine.resume(CO9)
coroutine.resume(CO10)
coroutine.resume(CO11)
--Barrier Neutralizer--

for i, v in ipairs(workspace:GetDescendants()) do
    local Dangerous = {"AntiDefaultArena", "Antidream", "ArenaBarrier", "DEATHBARRIER", "DEATHBARRIER2", "dedBarrier"}
    if table.find(Dangerous, v.Name) then
        v:Destroy() 
    end
end

for _, v in ipairs(workspace.Lobby.LobbyFrame:GetDescendants()) do
    if v:IsA("TouchTransmitter") then
        v.Parent.CanTouch = false
        v:Destroy()
    end
end

for _, v in ipairs(workspace.Lobby.brazil:GetDescendants()) do
    if v:IsA("TouchTransmitter") then
        v.Parent.CanTouch = false
        v:Destroy()
    end
end

--Barrier Neutralizer--

Run_Service.RenderStepped:Connect(function()
    if Smart_Loop_Teleport_State == true then
        pcall(function()
            local b = Return_Player_Character_Root(Current_Target)
            Smart_Teleport(b)
        end)
    end
end)

Run_Service.RenderStepped:Connect(function()
    if Smart_Velocity_State == true then
        pcall(function()
            local b = Return_Player_Character_Root(Current_Target)
            Edit_Velocity(b)
        end)
    end
end)

Run_Service.RenderStepped:Connect(Anti_FlingA)

coroutine.resume(coroutine.create(AFC))

Rayfield:Notify({
    Title = "Celerity",
    Content = "Celerity Loaded, Enjoy A Seamless Experience!",
    Duration = 6.5,
    Image = 4483362458,
})
