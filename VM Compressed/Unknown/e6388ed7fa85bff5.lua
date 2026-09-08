
-- env & module loading

getgenv().AirHub = {}

pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xaviersupreme/FemboyHub/refs/heads/main/modules/aimbot.lua"))() end)
pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/xaviersupreme/FemboyHub/refs/heads/main/modules/esp.lua"))() end)


-- fuckass ui lib loader

local Library = loadstring(game:GetObjects("rbxassetid://7657867786")[1].Source)()
if not Library then
    warn("FEMBOY HUB: CRITICAL FAILURE - Could not load UI Library.")
    return
end


-- services and refs

task.wait(0.5) -- waits for modules to fully load and populate the environment
local Aimbot, WallHack = getgenv().AirHub.Aimbot, getgenv().AirHub.WallHack
if not (Aimbot and WallHack) then
    warn("FEMBOY HUB: CRITICAL FAILURE - modules did not load correctly. The script cannot continue.")
    return
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Parts = {"Head", "HumanoidRootPart", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "LeftUpperLeg", "RightFoot", "RightLowerLeg", "LowerTorso", "RightUpperLeg"}
local Fonts = {"UI", "System", "Plex", "Monospace"}
local TracersType = {"Bottom", "Center", "Mouse"}
local HealthBarPos = {"Top", "Bottom", "Left", "Right"}

-- runtime variables for player mods
local IsFlying = false
local FlyBodyGyro, FlyBodyVelocity = nil, nil
local OriginalWalkSpeed, OriginalJumpPower = 16, 50


-- main UI & femboy theme

Library.UnloadCallback = function()
	if Aimbot and Aimbot.Functions and Aimbot.Functions.Exit then Aimbot.Functions:Exit() end
	if WallHack and WallHack.Functions and WallHack.Functions.Exit then WallHack.Functions:Exit() end
	getgenv().AirHub = nil
end


-- theme
local FemboyTheme = [[{"__Designer.Colors.topGradient":"DB83B3","__Designer.Colors.section":"E6A2C4","__Designer.Colors.hoveredOptionBottom":"FFB5E1","__Designer.Background.ImageAssetID":"rbxassetid://","__Designer.Colors.selectedOption":"E6A2C4","__Designer.Colors.unselectedOption":"2E2530","__Designer.Files.WorkspaceFile":"FemboyHub","__Designer.Colors.unhoveredOptionTop":"211524","__Designer.Colors.outerBorder":"291a2e","__Designer.Background.ImageColor":"FFFFFF","__Designer.Colors.tabText":"FADDFE","__Designer.Colors.elementBorder":"1C121F","__Designer.Background.ImageTransparency":70,"__Designer.Colors.background":"211524","__Designer.Colors.innerBorder":"4A3152","__Designer.Colors.bottomGradient":"E6A2C4","__Designer.Colors.sectionBackground":"2E2530","__Designer.Colors.hoveredOptionTop":"FFB5E1","__Designer.Colors.otherElementText":"E6C4FF","__Designer.Colors.main":"FFB5E1","__Designer.Colors.elementText":"FFE3F8","__Designer.Colors.unhoveredOptionBottom":"2E2530","__Designer.Background.UseBackgroundImage":true}]]

-- main window creationnn
local MainFrame = Library:CreateWindow({
	Name = "Femboy Hub",
	Theme = FemboyTheme,
    Themeable = {
		Info = "some shit does not work, im workin on it :3",
		Credit = false
	}
})


-- tabs

local AimbotTab = MainFrame:CreateTab({ Name = "Aimbot" })
local VisualsTab = MainFrame:CreateTab({ Name = "Visuals" })
local CrosshairTab = MainFrame:CreateTab({ Name = "Crosshair" })
local PlayerTab = MainFrame:CreateTab({ Name = "Player Mods" })


-- aimbot tab

local Values = AimbotTab:CreateSection({ Name = "Values" })
local Checks = AimbotTab:CreateSection({ Name = "Checks" })
local ThirdPerson = AimbotTab:CreateSection({ Name = "Third Person" })
local FOV_Values = AimbotTab:CreateSection({ Name = "Field Of View", Side = "Right" })
local FOV_Appearance = AimbotTab:CreateSection({ Name = "FOV Circle Appearance", Side = "Right" })

Values:AddToggle({ Name = "Enabled", Value = Aimbot.Settings.Enabled, Callback = function(New) Aimbot.Settings.Enabled = New end })
Values:AddToggle({ Name = "Toggle", Value = Aimbot.Settings.Toggle, Callback = function(New) Aimbot.Settings.Toggle = New end })
Values:AddDropdown({ Name = "Lock Part", Value = Aimbot.Settings.LockPart, Callback = function(New) Aimbot.Settings.LockPart = New end, List = Parts, Nothing = "Head" })
Values:AddTextbox({ Name = "Hotkey", Value = Aimbot.Settings.TriggerKey, Callback = function(New) Aimbot.Settings.TriggerKey = New end })
Values:AddSlider({ Name = "Sensitivity", Value = Aimbot.Settings.Sensitivity, Callback = function(New) Aimbot.Settings.Sensitivity = New end, Min = 0, Max = 1, Decimals = 2 })

Checks:AddToggle({ Name = "Team Check", Value = Aimbot.Settings.TeamCheck, Callback = function(New) Aimbot.Settings.TeamCheck = New end })
Checks:AddToggle({ Name = "Wall Check", Value = Aimbot.Settings.WallCheck, Callback = function(New) Aimbot.Settings.WallCheck = New end })
Checks:AddToggle({ Name = "Alive Check", Value = Aimbot.Settings.AliveCheck, Callback = function(New) Aimbot.Settings.AliveCheck = New end })

ThirdPerson:AddToggle({ Name = "Enable Third Person", Value = Aimbot.Settings.ThirdPerson, Callback = function(New) Aimbot.Settings.ThirdPerson = New end })
ThirdPerson:AddSlider({ Name = "Sensitivity", Value = Aimbot.Settings.ThirdPersonSensitivity, Callback = function(New) Aimbot.Settings.ThirdPersonSensitivity = New end, Min = 0.1, Max = 5, Decimals = 1 })

FOV_Values:AddToggle({ Name = "Enabled", Value = Aimbot.FOVSettings.Enabled, Callback = function(New) Aimbot.FOVSettings.Enabled = New end })
FOV_Values:AddToggle({ Name = "Visible", Value = Aimbot.FOVSettings.Visible, Callback = function(New) Aimbot.FOVSettings.Visible = New end })
FOV_Values:AddSlider({ Name = "Amount", Value = Aimbot.FOVSettings.Amount, Callback = function(New) Aimbot.FOVSettings.Amount = New end, Min = 10, Max = 300 })

FOV_Appearance:AddToggle({ Name = "Filled", Value = Aimbot.FOVSettings.Filled, Callback = function(New) Aimbot.FOVSettings.Filled = New end })
FOV_Appearance:AddSlider({ Name = "Transparency", Value = Aimbot.FOVSettings.Transparency, Callback = function(New) Aimbot.FOVSettings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
FOV_Appearance:AddSlider({ Name = "Sides", Value = Aimbot.FOVSettings.Sides, Callback = function(New) Aimbot.FOVSettings.Sides = New end, Min = 3, Max = 60 }) -- this shit does not work for some reason
FOV_Appearance:AddSlider({ Name = "Thickness", Value = Aimbot.FOVSettings.Thickness, Callback = function(New) Aimbot.FOVSettings.Thickness = New end, Min = 1, Max = 50 })
FOV_Appearance:AddColorpicker({ Name = "Color", Value = Aimbot.FOVSettings.Color, Callback = function(New) Aimbot.FOVSettings.Color = New end })
FOV_Appearance:AddColorpicker({ Name = "Locked Color", Value = Aimbot.FOVSettings.LockedColor, Callback = function(New) Aimbot.FOVSettings.LockedColor = New end })


-- visuals ui

local WallHackChecks = VisualsTab:CreateSection({ Name = "Checks" })
local ESPSettings = VisualsTab:CreateSection({ Name = "ESP Settings" })
local BoxesSettings = VisualsTab:CreateSection({ Name = "Boxes Settings" })
local ChamsSettings = VisualsTab:CreateSection({ Name = "Chams Settings", Side = "Right" })
local TracersSettings = VisualsTab:CreateSection({ Name = "Tracers Settings", Side = "Right" })
local HeadDotsSettings = VisualsTab:CreateSection({ Name = "Head Dots Settings", Side = "Right" })
local HealthBarSettings = VisualsTab:CreateSection({ Name = "Health Bar Settings", Side = "Right" })

WallHackChecks:AddToggle({ Name = "Enabled", Value = WallHack.Settings.Enabled, Callback = function(New) WallHack.Settings.Enabled = New end })
WallHackChecks:AddToggle({ Name = "Team Check", Value = WallHack.Settings.TeamCheck, Callback = function(New) WallHack.Settings.TeamCheck = New end })
WallHackChecks:AddToggle({ Name = "Alive Check", Value = WallHack.Settings.AliveCheck, Callback = function(New) WallHack.Settings.AliveCheck = New end })

ESPSettings:AddToggle({ Name = "Enabled", Value = WallHack.Visuals.ESPSettings.Enabled, Callback = function(New) WallHack.Visuals.ESPSettings.Enabled = New end })
ESPSettings:AddToggle({ Name = "Outline", Value = WallHack.Visuals.ESPSettings.Outline, Callback = function(New) WallHack.Visuals.ESPSettings.Outline = New end })
ESPSettings:AddToggle({ Name = "Display Distance", Value = WallHack.Visuals.ESPSettings.DisplayDistance, Callback = function(New) WallHack.Visuals.ESPSettings.DisplayDistance = New end })
ESPSettings:AddToggle({ Name = "Display Health", Value = WallHack.Visuals.ESPSettings.DisplayHealth, Callback = function(New) WallHack.Visuals.ESPSettings.DisplayHealth = New end })
ESPSettings:AddToggle({ Name = "Display Name", Value = WallHack.Visuals.ESPSettings.DisplayName, Callback = function(New) WallHack.Visuals.ESPSettings.DisplayName = New end })
ESPSettings:AddSlider({ Name = "Offset", Value = WallHack.Visuals.ESPSettings.Offset, Callback = function(New) WallHack.Visuals.ESPSettings.Offset = New end, Min = -30, Max = 30 })
ESPSettings:AddColorpicker({ Name = "Text Color", Value = WallHack.Visuals.ESPSettings.TextColor, Callback = function(New) WallHack.Visuals.ESPSettings.TextColor = New end })
ESPSettings:AddColorpicker({ Name = "Outline Color", Value = WallHack.Visuals.ESPSettings.OutlineColor, Callback = function(New) WallHack.Visuals.ESPSettings.OutlineColor = New end })
ESPSettings:AddSlider({ Name = "Text Transparency", Value = WallHack.Visuals.ESPSettings.TextTransparency, Callback = function(New) WallHack.Visuals.ESPSettings.TextTransparency = New end, Min = 0, Max = 1, Decimals = 2 })
ESPSettings:AddSlider({ Name = "Text Size", Value = WallHack.Visuals.ESPSettings.TextSize, Callback = function(New) WallHack.Visuals.ESPSettings.TextSize = New end, Min = 8, Max = 24 })
ESPSettings:AddDropdown({ Name = "Text Font", Value = Fonts[WallHack.Visuals.ESPSettings.TextFont + 1], Callback = function(New) WallHack.Visuals.ESPSettings.TextFont = Drawing.Fonts[New] end, List = Fonts, Nothing = "UI" })

BoxesSettings:AddToggle({ Name = "Enabled", Value = WallHack.Visuals.BoxSettings.Enabled, Callback = function(New) WallHack.Visuals.BoxSettings.Enabled = New end })
BoxesSettings:AddSlider({ Name = "Transparency", Value = WallHack.Visuals.BoxSettings.Transparency, Callback = function(New) WallHack.Visuals.BoxSettings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
BoxesSettings:AddSlider({ Name = "Thickness", Value = WallHack.Visuals.BoxSettings.Thickness, Callback = function(New) WallHack.Visuals.BoxSettings.Thickness = New end, Min = 1, Max = 5 })
BoxesSettings:AddSlider({ Name = "Scale Increase (For 3D)", Value = WallHack.Visuals.BoxSettings.Increase, Callback = function(New) WallHack.Visuals.BoxSettings.Increase = New end, Min = 1, Max = 5 })
BoxesSettings:AddColorpicker({ Name = "Color", Value = WallHack.Visuals.BoxSettings.Color, Callback = function(New) WallHack.Visuals.BoxSettings.Color = New end })
BoxesSettings:AddDropdown({ Name = "Type", Value = WallHack.Visuals.BoxSettings.Type == 1 and "3D" or "2D", Callback = function(New) WallHack.Visuals.BoxSettings.Type = New == "3D" and 1 or 2 end, List = {"3D", "2D"}, Nothing = "3D" })
BoxesSettings:AddToggle({ Name = "Filled (2D Square)", Value = WallHack.Visuals.BoxSettings.Filled, Callback = function(New) WallHack.Visuals.BoxSettings.Filled = New end })

ChamsSettings:AddToggle({ Name = "Enabled", Value = WallHack.Visuals.ChamsSettings.Enabled, Callback = function(New) WallHack.Visuals.ChamsSettings.Enabled = New end })
ChamsSettings:AddToggle({ Name = "Filled", Value = WallHack.Visuals.ChamsSettings.Filled, Callback = function(New) WallHack.Visuals.ChamsSettings.Filled = New end })
ChamsSettings:AddToggle({ Name = "Entire Body (For R15)", Value = WallHack.Visuals.ChamsSettings.EntireBody, Callback = function(New) WallHack.Visuals.ChamsSettings.EntireBody = New end })
ChamsSettings:AddSlider({ Name = "Transparency", Value = WallHack.Visuals.ChamsSettings.Transparency, Callback = function(New) WallHack.Visuals.ChamsSettings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
ChamsSettings:AddSlider({ Name = "Thickness", Value = WallHack.Visuals.ChamsSettings.Thickness, Callback = function(New) WallHack.Visuals.ChamsSettings.Thickness = New end, Min = 0, Max = 3 })
ChamsSettings:AddColorpicker({ Name = "Color", Value = WallHack.Visuals.ChamsSettings.Color, Callback = function(New) WallHack.Visuals.ChamsSettings.Color = New end })

TracersSettings:AddToggle({ Name = "Enabled", Value = WallHack.Visuals.TracersSettings.Enabled, Callback = function(New) WallHack.Visuals.TracersSettings.Enabled = New end })
TracersSettings:AddSlider({ Name = "Transparency", Value = WallHack.Visuals.TracersSettings.Transparency, Callback = function(New) WallHack.Visuals.TracersSettings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
TracersSettings:AddSlider({ Name = "Thickness", Value = WallHack.Visuals.TracersSettings.Thickness, Callback = function(New) WallHack.Visuals.TracersSettings.Thickness = New end, Min = 1, Max = 5 })
TracersSettings:AddColorpicker({ Name = "Color", Value = WallHack.Visuals.TracersSettings.Color, Callback = function(New) WallHack.Visuals.TracersSettings.Color = New end })
TracersSettings:AddDropdown({ Name = "Start From", Value = TracersType[WallHack.Visuals.TracersSettings.Type], Callback = function(New) WallHack.Visuals.TracersSettings.Type = table.find(TracersType, New) end, List = TracersType, Nothing = "Bottom" })

HeadDotsSettings:AddToggle({ Name = "Enabled", Value = WallHack.Visuals.HeadDotSettings.Enabled, Callback = function(New) WallHack.Visuals.HeadDotSettings.Enabled = New end })
HeadDotsSettings:AddToggle({ Name = "Filled", Value = WallHack.Visuals.HeadDotSettings.Filled, Callback = function(New) WallHack.Visuals.HeadDotSettings.Filled = New end })
HeadDotsSettings:AddSlider({ Name = "Transparency", Value = WallHack.Visuals.HeadDotSettings.Transparency, Callback = function(New) WallHack.Visuals.HeadDotSettings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
HeadDotsSettings:AddSlider({ Name = "Thickness", Value = WallHack.Visuals.HeadDotSettings.Thickness, Callback = function(New) WallHack.Visuals.HeadDotSettings.Thickness = New end, Min = 1, Max = 5 })
HeadDotsSettings:AddSlider({ Name = "Sides", Value = WallHack.Visuals.HeadDotSettings.Sides, Callback = function(New) WallHack.Visuals.HeadDotSettings.Sides = New end, Min = 3, Max = 60 })
HeadDotsSettings:AddColorpicker({ Name = "Color", Value = WallHack.Visuals.HeadDotSettings.Color, Callback = function(New) WallHack.Visuals.HeadDotSettings.Color = New end })

HealthBarSettings:AddToggle({ Name = "Enabled", Value = WallHack.Visuals.HealthBarSettings.Enabled, Callback = function(New) WallHack.Visuals.HealthBarSettings.Enabled = New end })
HealthBarSettings:AddDropdown({ Name = "Position", Value = HealthBarPos[WallHack.Visuals.HealthBarSettings.Type], Callback = function(New) WallHack.Visuals.HealthBarSettings.Type = (New == "Top" and 1 or New == "Bottom" and 2 or New == "Left" and 3 or 4) end, List = HealthBarPos, Nothing = "Left" })
HealthBarSettings:AddSlider({ Name = "Transparency", Value = WallHack.Visuals.HealthBarSettings.Transparency, Callback = function(New) WallHack.Visuals.HealthBarSettings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
HealthBarSettings:AddSlider({ Name = "Size", Value = WallHack.Visuals.HealthBarSettings.Size, Callback = function(New) WallHack.Visuals.HealthBarSettings.Size = New end, Min = 2, Max = 10 })
HealthBarSettings:AddSlider({ Name = "Offset", Value = WallHack.Visuals.HealthBarSettings.Offset, Callback = function(New) WallHack.Visuals.HealthBarSettings.Offset = New end, Min = -30, Max = 30 })
HealthBarSettings:AddColorpicker({ Name = "Outline Color", Value = WallHack.Visuals.HealthBarSettings.OutlineColor, Callback = function(New) WallHack.Visuals.HealthBarSettings.OutlineColor = New end })


-- crosshair tabs

local CrosshairSettings = CrosshairTab:CreateSection({ Name = "Settings" })
local CrosshairSettings_CenterDot = CrosshairTab:CreateSection({ Name = "Center Dot Settings", Side = "Right" })

CrosshairSettings:AddToggle({ Name = "Enabled", Value = WallHack.Crosshair.Settings.Enabled, Callback = function(New) WallHack.Crosshair.Settings.Enabled = New end })
CrosshairSettings:AddToggle({ Name = "Mouse Cursor", Value = UserInputService.MouseIconEnabled, Callback = function(New) UserInputService.MouseIconEnabled = New end })
CrosshairSettings:AddColorpicker({ Name = "Color", Value = WallHack.Crosshair.Settings.Color, Callback = function(New) WallHack.Crosshair.Settings.Color = New end })
CrosshairSettings:AddSlider({ Name = "Transparency", Value = WallHack.Crosshair.Settings.Transparency, Callback = function(New) WallHack.Crosshair.Settings.Transparency = New end, Min = 0, Max = 1, Decimals = 2 })
CrosshairSettings:AddSlider({ Name = "Size", Value = WallHack.Crosshair.Settings.Size, Callback = function(New) WallHack.Crosshair.Settings.Size = New end, Min = 8, Max = 24 })
CrosshairSettings:AddSlider({ Name = "Thickness", Value = WallHack.Crosshair.Settings.Thickness, Callback = function(New) WallHack.Crosshair.Settings.Thickness = New end, Min = 1, Max = 5 })
CrosshairSettings:AddSlider({ Name = "Gap Size", Value = WallHack.Crosshair.Settings.GapSize, Callback = function(New) WallHack.Crosshair.Settings.GapSize = New end, Min = 0, Max = 20 })
CrosshairSettings:AddDropdown({ Name = "Position", Value = "Mouse", Callback = function(New) WallHack.Crosshair.Settings.Type = New == "Mouse" and 1 or 2 end, List = {"Mouse", "Center"}, Nothing = "Mouse" })

CrosshairSettings_CenterDot:AddToggle({ Name = "Center Dot", Value = WallHack.Crosshair.Settings.CenterDot, Callback = function(New) WallHack.Crosshair.Settings.CenterDot = New end })
CrosshairSettings_CenterDot:AddColorpicker({ Name = "Center Dot Color", Value = WallHack.Crosshair.Settings.CenterDotColor, Callback = function(New) WallHack.Crosshair.Settings.CenterDotColor = New end })
CrosshairSettings_CenterDot:AddSlider({ Name = "Center Dot Size", Value = WallHack.Crosshair.Settings.CenterDotSize, Callback = function(New) WallHack.Crosshair.Settings.CenterDotSize = New end, Min = 1, Max = 6 })


-- player mods shit

local FlyToggleObject = PlayerTab:CreateSection({ Name = "Fly" })
local WSJSTab = PlayerTab:CreateSection({ Name = "WalkSpeed / JumpPower", Side="Right" })

getgenv().Player_FlySpeed = 50; getgenv().Player_FlyKey = Enum.KeyCode.F; getgenv().Player_WalkSpeedValue = 32; getgenv().Player_JumpPowerValue = 75

local FlyToggle = FlyToggleObject:AddToggle({Name = "Enable Fly", Value = false, Callback = function(state)
    IsFlying = state; local char, root, hum = LocalPlayer.Character, LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    if not (char and root and hum) then return end
    if IsFlying then
        if FlyBodyGyro then FlyBodyGyro:Destroy() end; if FlyBodyVelocity then FlyBodyVelocity:Destroy() end
        FlyBodyGyro = Instance.new("BodyGyro", root); FlyBodyGyro.MaxTorque, FlyBodyGyro.P = Vector3.new(math.huge, math.huge, math.huge), 20000
        FlyBodyVelocity = Instance.new("BodyVelocity", root); FlyBodyVelocity.MaxForce, FlyBodyVelocity.P = Vector3.new(math.huge, math.huge, math.huge), 10000
        hum:ChangeState(Enum.HumanoidStateType.Physics)
    else
        if FlyBodyGyro then FlyBodyGyro:Destroy(); FlyBodyGyro = nil end; if FlyBodyVelocity then FlyBodyVelocity:Destroy(); FlyBodyVelocity = nil end
        hum:ChangeState(Enum.HumanoidStateType.Running)
    end
end})
FlyToggleObject:AddSlider({Name = "Fly Speed", Value = 50, Min = 10, Max = 200, Callback = function(v) getgenv().Player_FlySpeed = v end})

local WalkSpeedToggle = WSJSTab:AddToggle({Name = "WalkSpeed", Value = false, Callback = function(v) local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if hum then hum.WalkSpeed = v and getgenv().Player_WalkSpeedValue or OriginalWalkSpeed end end})
WSJSTab:AddSlider({Name = "Speed Value", Value = 32, Min = 16, Max = 200, Callback = function(v) getgenv().Player_WalkSpeedValue = v; if WalkSpeedToggle.Value then local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if hum then hum.WalkSpeed = v end end end})
local JumpPowerToggle = WSJSTab:AddToggle({Name = "JumpPower", Value = false, Callback = function(v) local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if hum then hum.JumpPower = v and getgenv().Player_JumpPowerValue or OriginalJumpPower end end})
WSJSTab:AddSlider({Name = "JS Value", Value = 75, Min = 50, Max = 300, Callback = function(v) getgenv().Player_JumpPowerValue = v; if JumpPowerToggle.Value then local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if hum then hum.JumpPower = v end end end})


-- functions tab & connections

RunService.RenderStepped:Connect(function()
    pcall(function()
        if IsFlying then
            local camCF, moveVector = Camera.CFrame, Vector3.new()
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then moveVector += camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then moveVector -= camCF.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then moveVector -= camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then moveVector += camCF.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then moveVector += Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then moveVector -= Vector3.new(0,1,0) end
            if FlyBodyGyro then FlyBodyGyro.CFrame = camCF end
            if FlyBodyVelocity then FlyBodyVelocity.Velocity = moveVector.Magnitude > 0 and moveVector.Unit * getgenv().Player_FlySpeed or Vector3.new(0,0,0) end
        end
    end)
end)

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == getgenv().Player_FlyKey then
        FlyToggle:Set(not FlyToggle.Value)
    end
end)

LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(0.5)
    local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if hum then OriginalWalkSpeed, OriginalJumpPower = hum.WalkSpeed, hum.JumpPower end
    if WalkSpeedToggle.Value then hum.WalkSpeed = getgenv().Player_WalkSpeedValue end
    if JumpPowerToggle.Value then hum.JumpPower = getgenv().Player_JumpPowerValue end
end)

local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid"); if hum then OriginalWalkSpeed, OriginalJumpPower = hum.WalkSpeed, hum.JumpPower end
