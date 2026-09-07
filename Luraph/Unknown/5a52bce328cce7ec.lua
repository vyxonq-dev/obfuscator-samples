-------- zwag n dante were here 
if not LPH_OBFUSCATED then
    LPH_JIT_MAX = function(...)
        return (...)
    end
    LPH_NO_VIRTUALIZE = function(...)
        return (...)
    end
end

LPH_JIT_MAX(function()
-- // Variables (Too Lazy To Make It To One Local)
local Shhhh = getgenv().Shhhh
local OldSilentAimPart = Shhhh.Silent.Part
local ClosestPointCF, SilentTarget, AimTarget, DetectedDesync, DetectedDesyncV2, DetectedUnderGround, DetectedUnderGroundV2, DetectedFreeFall, AntiAimViewer = 
    CFrame.new(), 
    nil, 
    nil, 
    false, 
    false, 
    false, 
    false, 
    false, 
    true
local Script = {Functions = {}, Friends = {}, Drawing = {}, EspPlayers = {}}

local Players, Client, Mouse, RS, Camera, GuiS, Uis, Ran =
    game:GetService("Players"),
    game:GetService("Players").LocalPlayer,
    game:GetService("Players").LocalPlayer:GetMouse(),
    game:GetService("RunService"),
    game:GetService("Workspace").CurrentCamera,
    game:GetService("GuiService"),
    game:GetService("UserInputService"),
    math.random

-- // Drawing For AimAssist And SilentAim
Script.Drawing.SilentCircle = Drawing.new("Circle")
Script.Drawing.SilentCircle.Color = Color3.new(1,1,1)
Script.Drawing.SilentCircle.Thickness = 1

Script.Drawing.AimAssistCircle = Drawing.new("Circle")
Script.Drawing.AimAssistCircle.Color = Color3.new(1,1,1)
Script.Drawing.AimAssistCircle.Thickness = 1

-- // Chat Check
Client.Chatted:Connect(function(Msg)
    if Msg == Shhhh.Commands.CrashMode then
        while true do end
    end
    local Splitted = string.split(Msg, " ")
    if Splitted[1] and Splitted[2] and Shhhh.Commands.Enabled then
        if Splitted[1] == Shhhh.Commands.Silent_Prediction then
            Shhhh.Silent.PredictionVelocity = Splitted[2]
        elseif Splitted[1] == Shhhh.Commands.Silent_Fov_Size then
            Shhhh.SilentFov.Radius = Splitted[2]
        elseif Splitted[1] == Shhhh.Commands.Silent_Fov_Show then
            if Splitted[2] == "true" then
                Shhhh.SilentFov.Visible = true
            else
                Shhhh.SilentFov.Visible = false
            end
        elseif Splitted[1] == Shhhh.Commands.Silent_Enabled then
            if Splitted[2] == "true" then
                Shhhh.Silent.Enabled = true
            else
                Shhhh.Silent.Enabled = false 
            end
        elseif Splitted[1] == Shhhh.Commands.Silent_HitChance then
            Shhhh.Silent.HitChance = Splitted[2]
        elseif Splitted[1] == Shhhh.Commands.AimAssist_Prediction then
            Shhhh.AimAssist.PredictionVelocity = Splitted[2]
        elseif Splitted[1] == Shhhh.Commands.AimAssist_Fov_Size then
            Shhhh.AimAssistFov.Radius = Splitted[2]
        elseif Splitted[1] == Shhhh.Commands.AimAssist_Fov_Show then
            if Splitted[2] == "true" then
                Shhhh.AimAssistFov.Visible = true
            else
                Shhhh.AimAssistFov.Visible = false
            end
        elseif Splitted[1] == Shhhh.Commands.AimAssist_Enabled then
            if Splitted[2] == "true" then
                Shhhh.AimAssist.Enabled = true
            else
                Shhhh.AimAssist.Enabled = false
            end
        elseif Splitted[1] == Shhhh.Commands.AimAssist_SmoothX then
            Shhhh.AimAssist.Smoothness_X = Splitted[2]
        elseif Splitted[1] == Shhhh.Commands.AimAssist_SmoothY then
            Shhhh.AimAssist.Smoothness_Y = Splitted[2]
        elseif Splitted[1] == Shhhh.Commands.AimAssist_Shake then
            Shhhh.AimAssist.ShakeValue = Splitted[2]
        end
    end
end)

-- // KeyDown Check
Mouse.KeyDown:Connect(function(Key)
    local Keybind = Shhhh.AimAssist.Key:lower()
    if Key == Keybind then
        if Shhhh.AimAssist.Enabled then
            IsTargetting = not IsTargetting
            if IsTargetting then
                Script.Functions.GetClosestPlayer2()
            else
                if AimTarget ~= nil then
                    AimTarget = nil
                    IsTargetting = false
                end
            end
        end
    end
    local Keybind2 = Shhhh.Silent.Keybind:lower()
    if Key == Keybind2 and Shhhh.Silent.UseKeybind then
        Shhhh.Silent.Enabled = not Shhhh.Silent.Enabled
        if Shhhh.Both.SendNotification then
            game.StarterGui:SetCore("SendNotification",{
                Title = "Shhhh.lol",
                Text = "Silent Aim: " .. tostring(Shhhh.Silent.Enabled),
                Icon = "rbxassetid://12601056015",
                Duration = 1
            })
        end
    end
    local Keybind3 = Shhhh.Both.UnderGroundKey:lower()
    if Key == Keybind3 and Shhhh.Both.UseUnderGroundKeybind then
        Shhhh.Both.DetectUnderGround = not Shhhh.Both.DetectUnderGround
        if Shhhh.Both.SendNotification then
            game.StarterGui:SetCore("SendNotification",{
                Title = "Shhhh.lol",
                Text = "UnderGround Resolver: " .. tostring(Shhhh.Both.DetectUnderGround),
                Icon = "rbxassetid://12601056015",
                Duration = 1
            })
        end
    end
    local Keybind4 = Shhhh.Both.DetectDesyncKey:lower()
    if Key == Keybind4 and Shhhh.Both.UsDetectDesyncKeybind then
        Shhhh.Both.DetectDesync = not Shhhh.Both.DetectDesync
        if Shhhh.Both.SendNotification then
            game.StarterGui:SetCore("SendNotification",{
                Title = "Shhhh.lol",
                Text = "Desync Resolver: " .. tostring(Shhhh.Both.DetectDesync),
                Icon = "rbxassetid://12601056015",
                Duration = 1
            })
        end
    end
    local Keybind5 = Shhhh.Both.LayKeybind:lower()
    if Key == Keybind5 and Shhhh.Both.UseLay then
        local Args = {
            [1] = "AnimationPack",
            [2] = "Lay"
        }
        game:GetService("ReplicatedStorage"):FindFirstChild("MainEvent"):FireServer(unpack(Args))
    end
    local Keybind6 = Shhhh.Esp.EspKey:lower()
    if Key == Keybind6 and Shhhh.Esp.UseEspKeybind then
		if Shhhh.Esp.HoldMode then
			Shhhh.Esp.Enabled = true
		else
			Shhhh.Esp.Enabled = not Shhhh.Esp.Enabled
		end
    end
end)

-- // KeyUp Check
Mouse.KeyUp:Connect(function(Key)
    local Keybind = Shhhh.Esp.EspKey:lower()
    if Key == Keybind and Shhhh.Esp.UseEspKeybind and Shhhh.Esp.HoldMode then
		Shhhh.Esp.Enabled = false
    end
    local Keybind2 = Shhhh.AimAssist.Key:lower()
    if Key == Keybind2 and Shhhh.AimAssist.Enabled and Shhhh.AimAssist.HoldMode then
        IsTargetting = false
		AimTarget = nil
    end
end)

-- // Disabled If AntiAimViewer Is On
if Shhhh.Silent.AntiAimViewer then
    AntiAimViewer = false
else
    AntiAimViewer = true
end

-- // Blocks Mouse Triggering
game:GetService("ContextActionService"):BindActionAtPriority(
    "LeftMouseBlock",
    function()
        if AntiAimViewer == false and Shhhh.Silent.AntiAimViewer and Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
            return Enum.ContextActionResult.Sink
        else
            return Enum.ContextActionResult.Pass
        end
    end,
    true,
    Enum.ContextActionPriority.Low.Value,
    Enum.UserInputType.MouseButton1
)

-- // Delaying The Mouse Trigger
Uis.InputBegan:connect(function(input)
    if input.UserInputType == Enum.UserInputType[Shhhh.Silent.TriggerBotKey] and Shhhh.Silent.UseTriggerBotKeybind then
        Shhhh.Silent.TriggerBot = true
    end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and Shhhh.Silent.AntiAimViewer and Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
        if AntiAimViewer == false then
            AntiAimViewer = true
            mouse1click()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            mouse1press()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            AntiAimViewer = false
        end
    end
end)

-- // Helps With Automatics
Uis.InputEnded:connect(function(input)
    if input.UserInputType == Enum.UserInputType[Shhhh.Silent.TriggerBotKey] and Shhhh.Silent.UseTriggerBotKeybind then
        Shhhh.Silent.TriggerBot = true
    end
    if input.UserInputType == Enum.UserInputType.MouseButton1 and Shhhh.Silent.AntiAimViewer and Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
        if AntiAimViewer == false then
            AntiAimViewer = true
            mouse1click()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            mouse1click()
            RS.RenderStepped:Wait()
            RS.RenderStepped:Wait()
            AntiAimViewer = true
        end
    end
end)

-- // Checks If The Player Is Alive
Script.Functions.Alive = LPH_NO_VIRTUALIZE(function(Plr)
    if Plr and Plr.Character and Plr.Character:FindFirstChild("HumanoidRootPart") ~= nil and Plr.Character:FindFirstChild("Humanoid") ~= nil and Plr.Character:FindFirstChild("Head") ~= nil then
        return true
    end
    return false
end)

-- // Checks If Player Is On Your Screen
Script.Functions.OnScreen = LPH_NO_VIRTUALIZE(function(Object)
    local _, screen = Camera:WorldToScreenPoint(Object.Position)
    return screen
end)

-- // Gets Magnitude From Part Position And Mouse
Script.Functions.GetMagnitudeFromMouse = LPH_NO_VIRTUALIZE(function(Part)
    local PartPos, OnScreen = Camera:WorldToScreenPoint(Part.Position)
    if OnScreen then
        local Magnitude = (Vector2.new(PartPos.X, PartPos.Y) - Vector2.new(Mouse.X, Mouse.Y)).Magnitude
        return Magnitude
    end
    return math.huge
end)

-- // Makes Random Number With Vector3 
Script.Functions.RandomVec = LPH_NO_VIRTUALIZE(function(Number, Multi)
    return (Vector3.new(Ran(-Number, Number), Ran(-Number, Number), Ran(-Number, Number)) * Multi or 1)
end)

-- // Checks If The Player Is Behind A Wall Or Something Else
Script.Functions.RayCastCheck = LPH_NO_VIRTUALIZE(function(Part, PartDescendant)
    local Character = Client.Character or Client.CharacterAdded.Wait(Client.CharacterAdded)
    local Origin = Camera.CFrame.Position

    local RayCastParams = RaycastParams.new()
    RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist
    RayCastParams.FilterDescendantsInstances = {Character, Camera}

    local Result = Workspace.Raycast(Workspace, Origin, Part.Position - Origin, RayCastParams)
    
    if (Result) then
        local PartHit = Result.Instance
        local Visible = (not PartHit or Instance.new("Part").IsDescendantOf(PartHit, PartDescendant))
        
        return Visible
    end
    return false
end)

-- // Gets The Part From An Object
Script.Functions.GetParts = LPH_NO_VIRTUALIZE(function(Object)
    if string.find(Object.Name, "Gun") then
        return
    end
    if table.find({"Part", "MeshPart", "BasePart"}, Object.ClassName) then
        return true
    end
end)

-- // Random Number To Compare
Script.Functions.CalculateChance = LPH_NO_VIRTUALIZE(function(Percentage)
    Percentage = math.floor(Percentage)
    local chance = math.floor(Random.new().NextNumber(Random.new(), 0, 1) * 100) / 100

    return chance < Percentage / 100
end)

-- // Check If Crew Folder Is A Thing
Script.Functions.FindCrew = LPH_NO_VIRTUALIZE(function(Player)
	if Player:FindFirstChild("DataFolder") and Player.DataFolder:FindFirstChild("Information") and Player.DataFolder.Information:FindFirstChild("Crew") and Client:FindFirstChild("DataFolder") and Client.DataFolder:FindFirstChild("Information") and Client.DataFolder.Information:FindFirstChild("Crew") then
        if Client.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= nil and Player.DataFolder.Information:FindFirstChild("Crew").Value ~= "" and Client.DataFolder.Information:FindFirstChild("Crew").Value ~= "" then 
			return true
		end
	end
	return false
end)

-- // Splits The Gun Name And Splits []
Script.Functions.GetGunName = LPH_NO_VIRTUALIZE(function(Name)
    local split = string.split(string.split(Name, "[")[2], "]")[1]
    return split
end)

-- // Gets Current Gun
Script.Functions.GetCurrentWeaponName = LPH_NO_VIRTUALIZE(function()
    if Client.Character and Client.Character:FindFirstChildWhichIsA("Tool") then
       local Tool =  Client.Character:FindFirstChildWhichIsA("Tool")
       if string.find(Tool.Name, "%[") and string.find(Tool.Name, "%]") and not string.find(Tool.Name, "Wallet") and not string.find(Tool.Name, "Phone") then
          return Script.Functions.GetGunName(Tool.Name)
       end
    end
    return nil
end)

-- // Drawing Function With Property Attached
Script.Functions.NewDrawing = LPH_NO_VIRTUALIZE(function(Type, Properties)
    local NewDrawing = Drawing.new(Type)

    for i,v in next, Properties or {} do
        NewDrawing[i] = v
    end
    return NewDrawing
end)

-- // Draws For The New Players Joining For Esp
Script.Functions.NewPlayer = LPH_NO_VIRTUALIZE(function(Player)
    Script.EspPlayers[Player] = {
        Name = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255,2550, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        BoxOutline = Script.Functions.NewDrawing("Square", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        Box = Script.Functions.NewDrawing("Square", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1, Visible = false}),
        HealthBarOutline = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 0, 0), Thickness = 3, Visible = false}),
        HealthBar = Script.Functions.NewDrawing("Line", {Color = Color3.fromRGB(0, 255, 0), Thickness = 1, Visible = false}),
        HealthText = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(0, 255, 0), Outline = true, Visible = false, Center = true, Size = 13, Font = 0}),
        Distance = Script.Functions.NewDrawing("Text", {Color = Color3.fromRGB(255, 255, 255), Outline = true, Visible = false, Center = true, Size = 13, Font = 0})
    }
end)

-- // Gets The Closest Part From Cursor
Script.Functions.GetClosestBodyPart = LPH_NO_VIRTUALIZE(function(Char)
    local Distance = math.huge
    local ClosestPart = nil
    local Filterd = {}

    if not (Char and Char:IsA("Model")) then
        return ClosestPart
    end

    local Parts = Char:GetChildren()
    for _, v in pairs(Parts) do
        if Script.Functions.GetParts(v) and Script.Functions.OnScreen(v) then
            table.insert(Filterd, v)
            for _, Part in pairs(Filterd) do                
                local Magnitude = Script.Functions.GetMagnitudeFromMouse(Part)
                if Magnitude < Distance then
                    ClosestPart = Part
                    Distance = Magnitude
                end
            end
        end
    end
    return ClosestPart
end)

-- // Gets The Closest Point From Cursor
Script.Functions.GetClosestPointOfPart = LPH_NO_VIRTUALIZE(function(Part)
    local NearestPosition = nil
    if Part ~= nil then
        local Hit, Half = Mouse.Hit.Position, Part.Size * 0.5
        local Transform = Part.CFrame:PointToObjectSpace(Mouse.Hit.Position)
        NearestPosition = Part.CFrame * Vector3.new(math.clamp(Transform.X, -Half.X, Half.X),math.clamp(Transform.Y, -Half.Y, Half.Y),math.clamp(Transform.Z, -Half.Z, Half.Z))
    end
    return NearestPosition
end)

-- // Gets The Closest Player For Cursor (Silent Aim)
Script.Functions.GetClosestPlayer = LPH_NO_VIRTUALIZE(function()
    local Target = nil
    local Closest = math.huge
    local HitChance = Script.Functions.CalculateChance(Shhhh.Silent.HitChance)

    if not HitChance then
        return nil
    end
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart") then
            if not Script.Functions.OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if Shhhh.Silent.WallCheck and not Script.Functions.RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            if Shhhh.Silent.CheckIf_KO and v.Character:FindFirstChild("BodyEffects") then
                local KoCheck = v.Character.BodyEffects:FindFirstChild("K.O").Value
                local Grabbed = v.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
                if KoCheck or Grabbed then
                    continue
                end
            end
            if Shhhh.Silent.CheckIf_TargetDeath and v.Character:FindFirstChild("Humanoid") then
                if v.Character.Humanoid.health < 4 then
                    continue
                end
            end
            if Shhhh.Both.VisibleCheck and v.Character:FindFirstChild("Head") then
                if v.Character.Head.Transparency > 0.5 then
                    continue
                end
            end
            if Shhhh.Both.CrewCheck and Script.Functions.FindCrew(v) and v.DataFolder.Information:FindFirstChild("Crew").Value == Client.DataFolder.Information:FindFirstChild("Crew").Value then
                continue
            end
            if Shhhh.Both.TeamCheck then
                if v.Team ~= Client.Team then
                    continue
                end
            end
            if Shhhh.Both.FriendCheck then
                if not table.find(Script.Friends, v.UserId) then
                    continue
                end
            end
            local Distance = Script.Functions.GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if (Distance < Closest and Script.Drawing.SilentCircle.Radius + 10 > Distance) then
                Closest = Distance
                Target = v
            end
        end
    end

    SilentTarget = Target
end)

-- // Gets Closest Player From Mouse (AimAssist)
Script.Functions.GetClosestPlayer2 = LPH_NO_VIRTUALIZE(function()
    local Target = nil
    local Distance = nil
    local Closest = math.huge
    
    for _, v in pairs(Players:GetPlayers()) do
        if v.Character and v ~= Client and v.Character:FindFirstChild("HumanoidRootPart") then
            if not Script.Functions.OnScreen(v.Character.HumanoidRootPart) then 
                continue 
            end
            if Shhhh.AimAssist.WallCheck and not Script.Functions.RayCastCheck(v.Character.HumanoidRootPart, v.Character) then 
                continue 
            end
            local Distance = Script.Functions.GetMagnitudeFromMouse(v.Character.HumanoidRootPart)

            if Distance < Closest then
                if (Shhhh.AimAssist.UseCircleRadius and Script.Drawing.AimAssistCircle.Radius + 10 < Distance) then continue end
                Closest = Distance
                Target = v
            end
        end
    end

    if Script.Functions.Alive(Target) then
		if Shhhh.Both.VisibleCheck then
			if Target.Character.Head.Transparency > 0.5 then
				return nil
			end
		end
		if Shhhh.Both.CrewCheck and Script.Functions.FindCrew(Target) and Target.DataFolder.Information:FindFirstChild("Crew").Value == Client.DataFolder.Information:FindFirstChild("Crew").Value then
			return nil
		end
	end
    if Shhhh.Both.TeamCheck and Target then
        if Target.Team == Client.Team then
            return nil
        end
    end
    if Shhhh.Both.FriendCheck then
        if table.find(Script.Friends, Target.UserId) then
            return nil
        end
    end
    
    AimTarget = Target
end)

-- // Server Side Mouse Position Changer
local OldIndex = nil 
OldIndex = hookmetamethod(game, "__index", LPH_NO_VIRTUALIZE(function(self, Index)
    if not checkcaller() and Mouse and self == Mouse and Index == "Hit" and Shhhh.Silent.Enabled and AntiAimViewer then
        if Script.Functions.Alive(SilentTarget) and Players[tostring(SilentTarget)].Character:FindFirstChild(Shhhh.Silent.Part) then
            local EndPoint = nil
            local TargetCF = nil
            local TargetVel = Players[tostring(SilentTarget)].Character.HumanoidRootPart.Velocity
            local TargetMov = Players[tostring(SilentTarget)].Character.Humanoid.MoveDirection

            if Shhhh.Silent.ClosestPoint then
                TargetCF = ClosestPointCF
            else
                TargetCF = Players[tostring(SilentTarget)].Character[Shhhh.Silent.Part].CFrame
            end

            if Shhhh.Both.DetectDesync then
                local Magnitude = TargetVel.magnitude
                local Magnitude2 = TargetMov.magnitude
                if Magnitude > Shhhh.Both.DesyncDetection then
                    DetectedDesync = true
                elseif Magnitude < 1 and Magnitude2 > 0.01 then
                    DetectedDesync = true
                elseif Magnitude > 5 and Magnitude2 < 0.01 then
                    DetectedDesync = true
                else
                    DetectedDesync = false
                end
            else
                DetectedDesync = false
            end
            if Shhhh.Silent.AntiGroundShots then
                if TargetVel.Y < Shhhh.Silent.WhenAntiGroundActivate then
                    DetectedFreeFall = true
                else
                    DetectedFreeFall = false
                end
            end
            if Shhhh.Both.DetectUnderGround then 
                if TargetVel.Y < Shhhh.Both.UnderGroundDetection then            
                    DetectedUnderGround = true
                else
                    DetectedUnderGround = false
                end
            else
                DetectedUnderGround = false
            end
            
            if TargetCF ~= nil then
                if DetectedDesync then
                    local MoveDirection = TargetMov * 16
                    EndPoint = TargetCF + (MoveDirection * Shhhh.Silent.PredictionVelocity)
                elseif DetectedUnderGround then
                    EndPoint = TargetCF + (Vector3.new(TargetVel.X, 0, TargetVel.Z) * Shhhh.Silent.PredictionVelocity)
                elseif DetectedFreeFall then
                    EndPoint = TargetCF + (Vector3.new(TargetVel.X, (TargetVel.Y * Shhhh.Silent.AntiGroundValue), TargetVel.Z) * Shhhh.Silent.PredictionVelocity)
                elseif Shhhh.Silent.PredictMovement then
                    EndPoint = TargetCF + (Vector3.new(TargetVel.X, (TargetVel.Y * 0.5), TargetVel.Z) * Shhhh.Silent.PredictionVelocity)
                else
                    EndPoint = TargetCF
                end
                if Shhhh.Silent.Humanize then
                    local HumanizeValue = Shhhh.Silent.HumanizeValue 
                    EndPoint = (EndPoint + Script.Functions.RandomVec(HumanizeValue, 0.01))
                end
            end

			if EndPoint ~= nil then
				local Real = OldIndex(self, Index)
				local NoXYZ = (CFrame.new(-Real.X, -Real.Y, -Real.Z) * Real)
				return (Index == "Hit" and (EndPoint * NoXYZ))
            end
        end
    end
    return OldIndex(self, Index)
end))

-- // Silent Aim Misc
Script.Functions.SilentMisc = LPH_NO_VIRTUALIZE(function()
    if Shhhh.Silent.Enabled and Script.Functions.Alive(SilentTarget) then
        if Shhhh.Silent.UseAirPart then
            if SilentTarget.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                   Shhhh.Silent.Part = Shhhh.Silent.AirPart
            else
                Shhhh.Silent.Part = OldSilentAimPart
            end
        end
        if Shhhh.Silent.TriggerBot then
			mouse1click()
		end
    end
     if Shhhh.Silent.AutoPrediction then
        local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
        if ping < 10 then
            Shhhh.Silent.PredictionVelocity = 0.07
        elseif ping < 20 then
            Shhhh.Silent.PredictionVelocity = 0.155
        elseif ping < 30 then
            Shhhh.Silent.PredictionVelocity = 0.132
        elseif ping < 40 then
            Shhhh.Silent.PredictionVelocity = 0.136
        elseif ping < 50 then
            Shhhh.Silent.PredictionVelocity = 0.130
        elseif ping < 60 then
            Shhhh.Silent.PredictionVelocity = 0.136
        elseif ping < 70 then
            Shhhh.Silent.PredictionVelocity = 0.138
        elseif ping < 80 then
            Shhhh.Silent.PredictionVelocity = 0.138
        elseif ping < 90 then
            Shhhh.Silent.PredictionVelocity = 0.146
        elseif ping < 100 then
            Shhhh.Silent.PredictionVelocity = 0.14322
        elseif ping < 110 then
            Shhhh.Silent.PredictionVelocity = 0.146
        elseif ping < 120 then
            Shhhh.Silent.PredictionVelocity = 0.149
        elseif ping < 130 then
            Shhhh.Silent.PredictionVelocity = 0.151
        elseif ping < 140 then
            Shhhh.Silent.PredictionVelocity = 0.1223333
        elseif ping < 150 then
            Shhhh.Silent.PredictionVelocity = 0.15
        elseif ping < 160 then
            Shhhh.Silent.PredictionVelocity = 0.16
        elseif ping < 170 then
            Shhhh.Silent.PredictionVelocity = 0.1923111
        elseif ping < 180 then
            Shhhh.Silent.PredictionVelocity = 0.19284
        elseif ping > 180 then
            Shhhh.Silent.PredictionVelocity = 0.166547
        end
    end
end)

-- // The AimAssist Mouse Dragging/Check Functions
Script.Functions.MouseChanger = LPH_NO_VIRTUALIZE(function()
    if Shhhh.AimAssist.Enabled and Script.Functions.Alive(AimTarget) and Players[tostring(AimTarget)].Character:FindFirstChild(Shhhh.AimAssist.Part) and Script.Functions.OnScreen(Players[tostring(AimTarget)].Character[Shhhh.AimAssist.Part]) then
        local EndPosition = nil
        local TargetPos = Players[tostring(AimTarget)].Character[Shhhh.AimAssist.Part].Position
        local TargetVel = Players[tostring(AimTarget)].Character[Shhhh.AimAssist.Part].Velocity
        local TargetMov = Players[tostring(AimTarget)].Character.Humanoid.MoveDirection

        if Shhhh.Both.DetectDesync then
            local Magnitude = TargetVel.magnitude
            local Magnitude2 = TargetMov.magnitude
            if Magnitude > Shhhh.Both.DesyncDetection then
                DetectedDesyncV2 = true
            elseif Magnitude < 1 and Magnitude2 > 0.01 then
                DetectedDesyncV2 = true
            elseif Magnitude > 5 and Magnitude2 < 0.01 then
                DetectedDesyncV2 = true
            else
                DetectedDesyncV2 = false
            end
        else
            DetectedDesyncV2 = false
        end
        if Shhhh.Both.DetectUnderGround then 
            if TargetVel.Y < Shhhh.Both.UnderGroundDetection then            
                DetectedUnderGroundV2 = true
            else
                DetectedUnderGroundV2 = false
            end
        else
            DetectedUnderGroundV2 = false
        end

        if Script.Functions.Alive(Client) then
            if Shhhh.AimAssist.DisableLocalDeath then
                if Client.Character.Humanoid.health < 4 then
                    AimTarget = nil
                    IsTargetting = false
                    return
                end
            end
            if Shhhh.AimAssist.DisableOutSideCircle then
                local Magnitude = Script.Functions.GetMagnitudeFromMouse(AimTarget.Character.HumanoidRootPart)
                if Script.Drawing.AimAssistCircle.Radius < Magnitude then
                    AimTarget = nil
                    IsTargetting = false
                    return
                end
            end
        end

        if Shhhh.AimAssist.DisableOn_KO and AimTarget.Character:FindFirstChild("BodyEffects") then 
            local KoCheck = AimTarget.Character.BodyEffects:FindFirstChild("K.O").Value
            local Grabbed = AimTarget.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil
            if KoCheck or Grabbed then
                AimTarget = nil
                IsTargetting = false
                return
            end
        end
        if Shhhh.AimAssist.DisableTargetDeath then
            if AimTarget.Character.Humanoid.health < 4 then
                AimTarget = nil
                IsTargetting = false
                return
            end
        end

        if DetectedDesyncV2 and Shhhh.AimAssist.PredictMovement then
            local MoveDirection = TargetMov * 16
            EndPosition = Camera:WorldToScreenPoint(TargetPos + (MoveDirection * Shhhh.AimAssist.PredictionVelocity))
        elseif DetectedUnderGroundV2 and Shhhh.AimAssist.PredictMovement then
            EndPosition = Camera:WorldToScreenPoint(TargetPos + (Vector3.new(TargetVel.X, 0, TargetVel.Z) * Shhhh.AimAssist.PredictionVelocity))
        elseif Shhhh.AimAssist.PredictMovement then
            if Shhhh.AimAssist.UseShake and Script.Functions.Alive(Client) then
                local Shake = Shhhh.AimAssist.ShakeValue / 100
                local Mag = math.ceil((TargetPos - Client.Character.HumanoidRootPart.Position).Magnitude)
                EndPosition = Camera:WorldToScreenPoint(TargetPos + (TargetVel * Shhhh.AimAssist.PredictionVelocity) + Script.Functions.RandomVec(Mag * Shake, 0.1))
            else
                EndPosition = Camera:WorldToScreenPoint(TargetPos + (TargetVel * Shhhh.AimAssist.PredictionVelocity))
            end
        else
            if Shhhh.AimAssist.UseShake and Script.Functions.Alive(Client) then
                local Shake = Shhhh.AimAssist.ShakeValue / 100
                local Mag = math.ceil((TargetPos - Client.Character.HumanoidRootPart.Position).Magnitude)
                EndPosition = Camera:WorldToScreenPoint(TargetPos + Script.Functions.RandomVec(Mag * Shake, 0.1))
            else
                EndPosition = Camera:WorldToScreenPoint(TargetPos)
            end
        end

        if EndPosition ~= nil then
            local InCrementX = (EndPosition.X - Mouse.X) * Shhhh.AimAssist.Smoothness_X
            local InCrementY = (EndPosition.Y - Mouse.Y) * Shhhh.AimAssist.Smoothness_Y
            mousemoverel(InCrementX, InCrementY)
        end
    end
end)

--// Update Size/Position Of Circle
Script.Functions.UpdateFOV = LPH_NO_VIRTUALIZE(function()
    if (not Script.Drawing.SilentCircle and not Script.Drawing.AimAssistCircle) then
        return Script.Drawing.SilentCircle and Script.Drawing.AimAssistCircle
    end
    
    Script.Drawing.AimAssistCircle.Visible = Shhhh.AimAssistFov.Visible
    Script.Drawing.AimAssistCircle.Filled = Shhhh.AimAssistFov.Filled
    Script.Drawing.AimAssistCircle.Color = Shhhh.AimAssistFov.Color
    Script.Drawing.AimAssistCircle.Transparency = Shhhh.AimAssistFov.Transparency
    Script.Drawing.AimAssistCircle.Position = Vector2.new(Mouse.X, Mouse.Y + GuiS:GetGuiInset().Y)
	Script.Drawing.AimAssistCircle.Radius = Shhhh.AimAssistFov.Radius * 3
    
    Script.Drawing.SilentCircle.Visible = Shhhh.SilentFov.Visible
    Script.Drawing.SilentCircle.Color = Shhhh.SilentFov.Color
    Script.Drawing.SilentCircle.Filled = Shhhh.SilentFov.Filled
    Script.Drawing.SilentCircle.Transparency = Shhhh.SilentFov.Transparency
    Script.Drawing.SilentCircle.Position = Vector2.new(Mouse.X, Mouse.Y + GuiS:GetGuiInset().Y)
	Script.Drawing.SilentCircle.Radius = Shhhh.SilentFov.Radius * 3
	
    if Shhhh.RangeFov.Enabled or Shhhh.GunFov.Enabled then
		local CurrentGun = Script.Functions.GetCurrentWeaponName()
		if Shhhh.GunFov.Enabled then
			local WeaponSettings = Shhhh.GunFov[CurrentGun]
			if WeaponSettings ~= nil then
				Shhhh.SilentFov.Radius = WeaponSettings.Fov
			end
		end
		if Shhhh.RangeFov.Enabled then
			local WeaponSettingsV2 = Shhhh.RangeFov[CurrentGun]
			if WeaponSettingsV2 ~= nil then
				if Script.Functions.Alive(SilentTarget) and Script.Functions.Alive(Client) then
                    local Magnitude = (SilentTarget.Character.HumanoidRootPart.Position - Client.Character.HumanoidRootPart.Position).Magnitude
					if Magnitude < Shhhh.RangeFov.Close_Activation then
						Shhhh.SilentFov.Radius = WeaponSettingsV2.Close
					elseif Magnitude < Shhhh.RangeFov.Medium_Activation then
						Shhhh.SilentFov.Radius = WeaponSettingsV2.Med
					elseif Magnitude < Shhhh.RangeFov.Far_Activation then
						Shhhh.SilentFov.Radius = WeaponSettingsV2.Far
					end
				end
			end
		end
	end
end)

-- // Updates Esp Posistions
Script.Functions.UpdateEsp = LPH_NO_VIRTUALIZE(function()
    for i,v in pairs(Script.EspPlayers) do
        if Shhhh.Esp.Enabled and i ~= Client and i.Character and i.Character:FindFirstChild("Humanoid") and i.Character:FindFirstChild("HumanoidRootPart") and i.Character:FindFirstChild("Head") then
            local Hum = i.Character.Humanoid
            local Hrp = i.Character.HumanoidRootPart
            
            local Vector, OnScreen = Camera:WorldToViewportPoint(i.Character.HumanoidRootPart.Position)
            local Size = (Camera:WorldToViewportPoint(Hrp.Position - Vector3.new(0, 3, 0)).Y - Camera:WorldToViewportPoint(Hrp.Position + Vector3.new(0, 2.6, 0)).Y) / 2
            local BoxSize = Vector2.new(math.floor(Size * 1.5), math.floor(Size * 1.9))
            local BoxPos = Vector2.new(math.floor(Vector.X - Size * 1.5 / 2), math.floor(Vector.Y - Size * 1.6 / 2))
            local BottomOffset = BoxSize.Y + BoxPos.Y + 1

            if OnScreen then
                if Shhhh.Esp.Name.Enabled then
                    v.Name.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BoxPos.Y - 16)
                    v.Name.Outline = Shhhh.Esp.Name.OutLine
                    v.Name.Text = tostring(i)
                    v.Name.Color = Shhhh.Esp.Name.Color
                    v.Name.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.Name.Font = 0
                    v.Name.Size = 16

                    v.Name.Visible = true
                else
                    v.Name.Visible = false
                end
                if Shhhh.Esp.Distance.Enabled and Client.Character and Client.Character:FindFirstChild("HumanoidRootPart") then
                    v.Distance.Position = Vector2.new(BoxSize.X / 2 + BoxPos.X, BottomOffset)
                    v.Distance.Outline = Shhhh.Esp.Distance.OutLine
                    v.Distance.Text = "[" .. math.floor((Hrp.Position - Client.Character.HumanoidRootPart.Position).Magnitude) .. "m]"
                    v.Distance.Color = Shhhh.Esp.Distance.Color
                    v.Distance.OutlineColor = Color3.fromRGB(0, 0, 0)
                    BottomOffset = BottomOffset + 15

                    v.Distance.Font = 0
                    v.Distance.Size = 16

                    v.Distance.Visible = true
                else
                    v.Distance.Visible = false
                end
                if Shhhh.Esp.Box.Enabled then
                    v.BoxOutline.Size = BoxSize
                    v.BoxOutline.Position = BoxPos
                    v.BoxOutline.Visible = Shhhh.Esp.Box.OutLine
                    v.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
    
                    v.Box.Size = BoxSize
                    v.Box.Position = BoxPos
                    v.Box.Color = Shhhh.Esp.Box.Color
                    v.Box.Visible = true
                else
                    v.BoxOutline.Visible = false
                    v.Box.Visible = false
                end
                if Shhhh.Esp.HealthBar.Enabled then
                    v.HealthBar.From = Vector2.new((BoxPos.X - 5), BoxPos.Y + BoxSize.Y)
                    v.HealthBar.To = Vector2.new(v.HealthBar.From.X, v.HealthBar.From.Y - (Hum.Health / Hum.MaxHealth) * BoxSize.Y)
                    v.HealthBar.Color = Shhhh.Esp.HealthBar.Color
                    v.HealthBar.Visible = true

                    v.HealthBarOutline.From = Vector2.new(v.HealthBar.From.X, BoxPos.Y + BoxSize.Y + 1)
                    v.HealthBarOutline.To = Vector2.new(v.HealthBar.From.X, (v.HealthBar.From.Y - 1 * BoxSize.Y) -1)
                    v.HealthBarOutline.Color = Color3.fromRGB(0, 0, 0)
                    v.HealthBarOutline.Visible = Shhhh.Esp.HealthBar.OutLine
                else
                    v.HealthBarOutline.Visible = false
                    v.healthBar.Visible = false
                end
                if Shhhh.Esp.HealthText.Enabled then
                    v.HealthText.Text = tostring(math.floor((Hum.Health / Hum.MaxHealth) * 100 + 0.5))
                    v.HealthText.Position = Vector2.new((BoxPos.X - 20), (BoxPos.Y + BoxSize.Y - 1 * BoxSize.Y) -1)
                    v.HealthText.Color = Shhhh.Esp.HealthText.Color
                    v.HealthText.OutlineColor = Color3.fromRGB(0, 0, 0)
                    v.HealthText.Outline = Shhhh.Esp.HealthText.OutLine

                    v.HealthText.Font = 0
                    v.HealthText.Size = 16

                    v.HealthText.Visible = true
                else
                    v.HealthText.Visible = false
                end
            else
                v.Name.Visible = false
                v.BoxOutline.Visible = false
                v.Box.Visible = false
                v.HealthBarOutline.Visible = false
                v.HealthBar.Visible = false
                v.HealthText.Visible = false
                v.Distance.Visible = false
            end
        else
            v.Name.Visible = false
            v.BoxOutline.Visible = false
            v.Box.Visible = false
            v.HealthBarOutline.Visible = false
            v.HealthBar.Visible = false
            v.HealthText.Visible = false
            v.Distance.Visible = false
        end
    end
end)

-- // Client Fps (EXECUTES PER FRAME)
RS.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function()
    Script.Functions.GetClosestPlayer()
    Script.Functions.SilentMisc()
    Script.Functions.MouseChanger()
end))

-- // Server Tick (EXECUTES PER TICK)
RS.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function()
    Script.Functions.UpdateEsp()
    Script.Functions.UpdateFOV()
    if Shhhh.Silent.Enabled and Shhhh.Silent.ClosestPoint and Script.Functions.Alive(SilentTarget) and Players[tostring(SilentTarget)].Character:FindFirstChild(Shhhh.Silent.Part) then
        local ClosestPoint = Script.Functions.GetClosestPointOfPart(Players[tostring(SilentTarget)].Character[Shhhh.Silent.Part])
        ClosestPointCF = CFrame.new(ClosestPoint.X, ClosestPoint.Y, ClosestPoint.Z)
    end
    if Shhhh.AimAssist.Enabled and Script.Functions.Alive(AimTarget) and Shhhh.Silent.ClosestPart and Script.Functions.Alive(SilentTarget) then
        local currentpart = tostring(Script.Functions.GetClosestBodyPart(AimTarget.Character))
        if Shhhh.AimAssist.ClosestPart then
			Shhhh.AimAssist.Part = currentpart
		end
        if Shhhh.Silent.ClosestPart then
            Shhhh.Silent.Part = currentpart
            OldSilentAimPart = Shhhh.Silent.Part
        end
        return
    end
    if Shhhh.AimAssist.Enabled and Shhhh.AimAssist.ClosestPart and Script.Functions.Alive(AimTarget) then
        Shhhh.AimAssist.Part = tostring(Script.Functions.GetClosestBodyPart(AimTarget.Character))
    end
    if Shhhh.Silent.Enabled and Shhhh.Silent.ClosestPart and Script.Functions.Alive(SilentTarget) then
        Shhhh.Silent.Part = tostring(Script.Functions.GetClosestBodyPart(SilentTarget.Character))
        OldSilentAimPart = Shhhh.Silent.Part
    end
end))

-- // Checks Everyone In The Server And Puts It In A Table
for _, Player in ipairs(Players:GetPlayers()) do
    if (Player ~= Client and Client:IsFriendsWith(Player.UserId)) then
        table.insert(Script.Friends, Player)
    end
    Script.Functions.NewPlayer(Player)
end

-- // Checks When Players Joins And Adds Them To A Table
Players.PlayerAdded:Connect(function(Player)
    if (Client:IsFriendsWith(Player.UserId)) then
        table.insert(Script.Friends, Player)
    end
    Script.Functions.NewPlayer(Player)
end)

-- // Checks If A Player Left And Removes Them From The Table
Players.PlayerRemoving:Connect(function(Player)
    local i = table.find(Script.Friends, Player)
    if (i) then
        table.remove(Script.Friends, i)
    end
    for i,v in pairs(Script.EspPlayers[Player]) do
        v:Remove()
    end
    Script.EspPlayers[Player] = nil
end)

end)() 
