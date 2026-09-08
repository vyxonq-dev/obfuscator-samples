local r0_0 = game:GetService("Players")
local r1_0 = game:GetService("HttpService")
local r2_0 = game:GetService("TweenService")
local r3_0 = game:GetService("RunService")
local r4_0 = game:GetService("ReplicatedStorage")
if game.GameId ~= 7671049560 then
    warn("Script only runs on Game ID: 7671049560. Current Game ID: " .. tostring(game.GameId))
    return
end
local r5_0 = r4_0:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services")
    :WaitForChild("ProximityService"):WaitForChild("RF"):WaitForChild("Purchase")
local r6_0 = nil
local r7_0, r8_0 = pcall(function()
    r6_0 = loadstring(game:HttpGet("https://github.com/biggaboy212/Maclib/releases/latest/download/maclib.txt"))() -- MAC LIB
end)
if not r7_0 or not r6_0 then
    warn("Error loading UI Library (MacLib): " .. tostring(r8_0))
    return
end
local r9_0 = {
    FileName = "HTHubTheForgeConfig_" .. r0_0.LocalPlayer.Name .. ".json",
    DefaultConfig = {
        SelectedRockType = nil,
        AutoMineEnabled = false,
        SelectedEnemyType = nil,
        SelectedDistance = 6,
        AutoFarmEnemyEnabled = false,
        SelectedMineDistance = 6,
        SelectedPotionName = {},
        AutoBuyAndUsePotionEnabled = false,
        SelectedItemName = nil,
        AutoSellItemEnabled = false,
        AntiAFKEnabled = true,
        ESPRockEnabled = false,
        ESPEnemyEnabled = false,
        ESPPlayerEnabled = false,
        MineTweenSpeed = 35,
        EnemyTweenSpeed = 35
    },
    CurrentConfig = {},
    SaveConfig = function()
        local r0_87, r1_87 = pcall(function()
            writefile(r9_0.FileName, r1_0:JSONEncode(r9_0.CurrentConfig))
        end)
        if not r0_87 then
            warn("Failed to save config:", r1_87)
        end
    end,
    LoadConfig = function()
        local r0_37, r1_37 = pcall(function()
            if isfile and isfile(r9_0.FileName) then
                return readfile(r9_0.FileName)
            end
            return nil
        end)
        if r0_37 and r1_37 then
            r9_0.CurrentConfig = r1_0:JSONDecode(r1_37)
        else
            r9_0.CurrentConfig = table.clone(r9_0.DefaultConfig)
            r9_0.SaveConfig()
        end
    end
}
r9_0.LoadConfig()
local r10_0 = r0_0.LocalPlayer.Name
local r11_0 = r6_0:Window({
    Title = "HT HUB | The Forge",
    Subtitle = "Hello, " .. r10_0,
    Size = UDim2.fromOffset(720, 500),
    DragStyle = 1,
    DisabledWindowControls = {},
    ShowUserInfo = true,
    Keybind = Enum.KeyCode.LeftAlt,
    AcrylicBlur = true
})
local function r12_0(r0_24, r1_24, r2_24)
    if r11_0 and r11_0.Notify then
        local r3_24 = r11_0
        local r5_24 = {
            Title = r0_24 or r11_0.Settings.Title,
            Description = r1_24 or "",
            Lifetime = r2_24 or 4
        }
        r3_24:Notify(r5_24)
    else
        print("[Notify]", tostring(r0_24), tostring(r1_24))
    end
end
r6_0:SetFolder("HTHubTheForge")
local r13_0 = r11_0:TabGroup()
local r14_0 = {
    Farm = r13_0:Tab({
        Name = "Farm",
        Image = "rbxassetid://10734923549"
    }),
    Shop = r13_0:Tab({
        Name = "Shop",
        Image = "rbxassetid://10734952273"
    }),
    Teleport = r13_0:Tab({
        Name = "Teleport",
        Image = "rbxassetid://10747381992"
    }),
    Settings = r13_0:Tab({
        Name = "Settings",
        Image = "rbxassetid://10734950309"
    })
}
local r15_0 = r9_0.CurrentConfig.AutoMineEnabled
if type(r15_0) ~= "boolean" then
    r15_0 = r9_0.DefaultConfig.AutoMineEnabled
end
local r16_0 = r9_0.CurrentConfig.SelectedRockType
if type(r16_0) == "string" then
    r16_0 = {r16_0}
elseif type(r16_0) ~= "table" then
    r16_0 = {}
end
local r17_0 = tonumber(r9_0.CurrentConfig.SelectedMineDistance) or r9_0.DefaultConfig.SelectedMineDistance
if r17_0 < 1 or 10 < r17_0 then
    r17_0 = r9_0.DefaultConfig.SelectedMineDistance
end
local r18_0 = math.clamp(tonumber(r9_0.CurrentConfig.MineTweenSpeed) or r9_0.DefaultConfig.MineTweenSpeed, 1, 50)
local r19_0 = {}
local r20_0 = nil
local r21_0 = {}
local r22_0 = 10
local r23_0 = false
local r24_0 = nil
local r25_0 = nil
local r26_0 = r9_0.CurrentConfig.SelectedEnemyType
if type(r26_0) ~= "table" then
    r26_0 = {}
end
local r27_0 = tonumber(r9_0.CurrentConfig.SelectedDistance) or r9_0.DefaultConfig.SelectedDistance
if r27_0 < 1 or 10 < r27_0 then
    r27_0 = r9_0.DefaultConfig.SelectedDistance
end
local r28_0 = math.clamp(tonumber(r9_0.CurrentConfig.EnemyTweenSpeed) or r9_0.DefaultConfig.EnemyTweenSpeed, 1, 50)
local r29_0 = r9_0.CurrentConfig.AutoFarmEnemyEnabled
if type(r29_0) ~= "boolean" then
    r29_0 = r9_0.DefaultConfig.AutoFarmEnemyEnabled
end
local r30_0 = r9_0.CurrentConfig.AntiAFKEnabled
if type(r30_0) ~= "boolean" then
    r30_0 = r9_0.DefaultConfig.AntiAFKEnabled
end
local r31_0 = {}
local r32_0 = nil
local r33_0 = r9_0.CurrentConfig.ESPRockEnabled
if type(r33_0) ~= "boolean" then
    r33_0 = r9_0.DefaultConfig.ESPRockEnabled
end
local r34_0 = r9_0.CurrentConfig.ESPEnemyEnabled
if type(r34_0) ~= "boolean" then
    r34_0 = r9_0.DefaultConfig.ESPEnemyEnabled
end
local r35_0 = r9_0.CurrentConfig.ESPPlayerEnabled
if type(r35_0) ~= "boolean" then
    r35_0 = r9_0.DefaultConfig.ESPPlayerEnabled
end
local r36_0 = {}
local r37_0 = {}
local r38_0 = {}
local r39_0 = 300
local r40_0 = false
local r41_0 = nil
local r42_0 = {}
local r43_0 = nil
local r44_0 = r9_0.CurrentConfig.SelectedPotionName
if type(r44_0) == "string" then
    r44_0 = {r44_0}
elseif type(r44_0) ~= "table" then
    r44_0 = {}
end
local r45_0 = r9_0.CurrentConfig.AutoBuyAndUsePotionEnabled
if type(r45_0) ~= "boolean" then
    r45_0 = r9_0.DefaultConfig.AutoBuyAndUsePotionEnabled
end
local r46_0 = false
local r47_0 = {}
local r48_0 = r9_0.CurrentConfig.SelectedItemName
if type(r48_0) == "string" then
    r48_0 = {r48_0}
elseif type(r48_0) ~= "table" then
    r48_0 = {}
end
local r49_0 = r9_0.CurrentConfig.AutoSellItemEnabled
if type(r49_0) ~= "boolean" then
    r49_0 = r9_0.DefaultConfig.AutoSellItemEnabled
end
local r50_0 = nil
local r51_0 = false
local r52_0 = {}
local r53_0 = nil
local r54_0 = {}
local r55_0 = nil
local r56_0 = {
    Farm = r14_0.Farm:Section({
        Side = "Left"
    }),
    Enemy = r14_0.Farm:Section({
        Side = "Right"
    }),
    ShopPotion = r14_0.Shop:Section({
        Side = "Left"
    }),
    SellItem = r14_0.Shop:Section({
        Side = "Right"
    }),
    TeleportNPC = r14_0.Teleport:Section({
        Side = "Left"
    }),
    TeleportShop = r14_0.Teleport:Section({
        Side = "Right"
    }),
    SettingsInfo = r14_0.Settings:Section({
        Side = "Left"
    }),
    SettingsPlayer = r14_0.Settings:Section({
        Side = "Right"
    }),
    SettingsMisc = r14_0.Settings:Section({
        Side = "Right"
    })
}
r56_0.Farm:Header({
    Name = "Mine"
})
local function r57_0(r0_36, r1_36)
    if not r0_36 or #r0_36 == 0 then
        return nil
    end
    if not r1_36 then
        return r0_36[1]
    end
    for r5_36, r6_36 in ipairs(r0_36) do
        if r6_36 == r1_36 then
            return r6_36
        end
    end
    return r0_36[1]
end
local function r58_0()
    r19_0 = {}
    local r0_30 = {}
    local r1_30 = r4_0:FindFirstChild("Assets")
    if not r1_30 then
        return r19_0
    end
    local r2_30 = r1_30:FindFirstChild("Rocks")
    if not r2_30 then
        return r19_0
    end
    for r6_30, r7_30 in ipairs(r2_30:GetDescendants()) do
        if r7_30:IsA("Model") then
            local r8_30 = r7_30.Name
            if typeof(r8_30) == "string" and r8_30 ~= "" and not r8_30:match("^%d+$") and not r0_30[r8_30] then
                r0_30[r8_30] = true
                table.insert(r19_0, r8_30)
            end
        end
    end
    table.sort(r19_0)
    return r19_0
end
local function r59_0(r0_89)
    local r1_89 = {}
    if not r0_89 or r0_89 == "" then
        return r1_89
    end
    local r2_89 = workspace:FindFirstChild("Rocks")
    if not r2_89 then
        return r1_89
    end
    for r6_89, r7_89 in ipairs(r2_89:GetDescendants()) do
        if r7_89:IsA("BasePart") then
            local r8_89 = r7_89:FindFirstAncestorWhichIsA("Model")
            if r8_89 and r8_89.Name == r0_89 then
                table.insert(r1_89, r7_89)
            end
        end
    end
    return r1_89
end
local function r60_0(r0_27)
    local r2_27 = r0_0.LocalPlayer.Character
    if not r2_27 then
        return nil
    end
    local r3_27 = r2_27:FindFirstChild("HumanoidRootPart")
    if not r3_27 then
        return nil
    end
    local r4_27 = r59_0(r0_27)
    local r5_27 = nil
    local r6_27 = math.huge
    for r10_27, r11_27 in ipairs(r4_27) do
        if r11_27 and r11_27.Parent then
            local r12_27 = (r3_27.Position - r11_27.Position).Magnitude
            if r12_27 < r6_27 then
                r6_27 = r12_27
                r5_27 = r11_27
            end
        end
    end
    return r5_27
end
local function r61_0(r0_16)
    if not r0_16 or #r0_16 == 0 then
        return false
    end
    local r2_16 = r0_0.LocalPlayer.Character
    if not r2_16 then
        return false
    end
    if not r2_16:FindFirstChild("HumanoidRootPart") then
        return false
    end
    local r4_16 = r0_16
    local r5_16 = false
    for r9_16, r10_16 in ipairs(r0_16) do
        if r10_16 == "All" then
            r5_16 = true
            break
        end
    end
    if r5_16 then
        r4_16 = r19_0
    end
    local r6_16 = tick()
    for r10_16, r11_16 in ipairs(r4_16) do
        for r16_16, r17_16 in ipairs(r59_0(r11_16)) do
            if r17_16 and r17_16.Parent then
                local r18_16 = r21_0[r17_16]
                if not r18_16 or r22_0 <= r6_16 - r18_16 then
                    return true
                end
            end
        end
    end
    return false
end
local function r62_0(r0_67)
    if not r0_67 or #r0_67 == 0 then
        return nil
    end
    local r2_67 = r0_0.LocalPlayer.Character
    if not r2_67 then
        return nil
    end
    local r3_67 = r2_67:FindFirstChild("HumanoidRootPart")
    if not r3_67 then
        return nil
    end
    local r4_67 = r0_67
    local r5_67 = false
    for r9_67, r10_67 in ipairs(r0_67) do
        if r10_67 == "All" then
            r5_67 = true
            break
        end
    end
    if r5_67 then
        r4_67 = r19_0
    end
    local r6_67 = nil
    local r7_67 = math.huge
    local r8_67 = tick()
    for r12_67, r13_67 in ipairs(r4_67) do
        for r18_67, r19_67 in ipairs(r59_0(r13_67)) do
            if r19_67 and r19_67.Parent then
                local r20_67 = r21_0[r19_67]
                if r20_67 and r8_67 - r20_67 >= r22_0 then
                    r21_0[r19_67] = nil
                end
                if not r20_67 or r22_0 <= r8_67 - r20_67 then
                    local r21_67 = (r3_67.Position - r19_67.Position).Magnitude
                    if r21_67 < r7_67 then
                        r7_67 = r21_67
                        r6_67 = r19_67
                    end
                end
            end
        end
    end
    return r6_67
end
local function r63_0()
    local r0_80 = r0_0.LocalPlayer
    if not r0_80 then
        return false
    end
    local r1_80 = r0_80:FindFirstChild("PlayerGui")
    if not r1_80 then
        return false
    end
    local r2_80 = r1_80:FindFirstChild("Notifications")
    if not r2_80 then
        return false
    end
    local r3_80 = r2_80:FindFirstChild("Screen")
    if not r3_80 then
        return false
    end
    local r4_80 = r3_80:FindFirstChild("NotificationsFrame")
    if not r4_80 then
        return false
    end
    for r8_80, r9_80 in ipairs(r4_80:GetChildren()) do
        if r9_80:IsA("Frame") and r9_80.Name == "TextFrame" then
            local r10_80 = r9_80:FindFirstChild("TextLabel", true)
            if r10_80 and r10_80:IsA("TextLabel") and
                (r10_80.Text or ""):lower():find("someone else is already mining this rock.", 1, true) then
                return true
            end
        end
    end
    return false
end
local function r64_0()
    local r1_64 = r0_0.LocalPlayer.Character
    if not r1_64 then
        return false
    end
    local r2_64 = r1_64:FindFirstChild("HumanoidRootPart")
    if not r2_64 then
        return false
    end
    if r24_0 then
        r24_0:Disconnect()
        r24_0 = nil
    end
    local r3_64 = r2_64.Position
    r2_64.CFrame = CFrame.new(Vector3.new(r3_64.X, r39_0, r3_64.Z))
    r23_0 = true
    local r5_64 = r2_64:FindFirstChild("BodyVelocity")
    if not r5_64 then
        r5_64 = Instance.new("BodyVelocity")
        r5_64.MaxForce = Vector3.new(4000, 4000, 4000)
        r5_64.Parent = r2_64
    end
    local r6_64 = r1_64
    r24_0 = r3_0.Heartbeat:Connect(function()
        if not r15_0 or not r23_0 or r0_0.LocalPlayer.Character ~= r6_64 or not r2_64 or not r2_64.Parent or r46_0 then
            if r24_0 then
                r24_0:Disconnect()
                r24_0 = nil
            end
            r23_0 = false
            return
        end
        local r0_65 = r2_64.Position
        local r1_65 = Vector3.new(r0_65.X, r39_0, r0_65.Z)
        r2_64.CFrame = CFrame.new(r1_65, r1_65 + r2_64.CFrame.LookVector * Vector3.new(1, 0, 1))
        if r5_64 then
            r5_64.Velocity = Vector3.new(0, 0, 0)
        end
    end)
    return true
end
local function r65_0()
    if currentTween then
        pcall(function()
            currentTween:Cancel()
        end)
        currentTween = nil
    end
    if r25_0 then
        pcall(function()
            r25_0:Cancel()
        end)
        r25_0 = nil
    end
    local r0_81 = r0_0.LocalPlayer.Character
    local r1_81 = r0_81 and r0_81:FindFirstChild("HumanoidRootPart")
    local r2_81 = r0_81 and r0_81:FindFirstChildOfClass("Humanoid")
    if r1_81 then
        for r6_81, r7_81 in ipairs(r1_81:GetChildren()) do
            if r7_81:IsA("BodyVelocity") or r7_81:IsA("BodyPosition") or r7_81:IsA("BodyGyro") then
                r7_81:Destroy()
            end
        end
        r1_81.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    end
    if r2_81 then
        r2_81:ChangeState(Enum.HumanoidStateType.Freefall)
    end
    r23_0 = false
    r40_0 = false
end
local function r66_0(r0_28)
    local r2_28 = r0_0.LocalPlayer.Character
    if not r2_28 then
        return false
    end
    local r3_28 = r2_28:FindFirstChild("HumanoidRootPart")
    if not r3_28 or not r0_28 or not r0_28.Parent then
        return false
    end
    local r4_28 = r0_28.Position
    local r5_28 = Vector3.new(r4_28.X, r39_0, r4_28.Z)
    local r6_28 = r3_28.Position
    local r8_28 = (Vector3.new(r6_28.X, 0, r6_28.Z) - Vector3.new(r5_28.X, 0, r5_28.Z)).Magnitude / r18_0
    local r9_28 = CFrame.new(r5_28, r0_28.Position)
    if r25_0 then
        pcall(function()
            r25_0:Cancel()
        end)
        r25_0 = nil
    end
    local r10_28 = r2_0:Create(r3_28, TweenInfo.new(r8_28, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = r9_28
    })
    r25_0 = r10_28
    r10_28:Play()
    r10_28.Completed:Wait()
    r25_0 = nil
    return true
end
local function r67_0(r0_59, r1_59)
    if not r0_59 or not r1_59 or r1_59 == "" then
        return
    end
    local r2_59 = r0_59:FindFirstAncestorWhichIsA("Model")
    if not r2_59 or r2_59.Name ~= r1_59 then
        return
    end
    local r3_59 = {"Pickaxe"}
    local r4_59 = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild(
        "Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RF"):WaitForChild("ToolActivated")
    local r6_59 = r0_0.LocalPlayer.Character
    if not r6_59 then
        return
    end
    local r7_59 = r6_59:FindFirstChild("HumanoidRootPart")
    if not r7_59 then
        return
    end
    local r8_59 = r6_59
    if r24_0 then
        r24_0:Disconnect()
        r24_0 = nil
    end
    r7_59.CFrame = CFrame.new(r0_59.Position + Vector3.new(0, -(r17_0 or 3), 0), r0_59.Position + Vector3.new(0, 5, 0))
    r23_0 = false
    local r12_59 = workspace.CurrentCamera
    local r13_59 = r12_59 and r12_59.CameraSubject
    if r12_59 and r0_59 and r0_59.Parent then
        r12_59.CameraSubject = r0_59
    end
    local r14_59 = r7_59.AssemblyAngularVelocity
    r7_59.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    local r15_59 = r7_59:FindFirstChild("BodyVelocity")
    if not r15_59 then
        r15_59 = Instance.new("BodyVelocity")
        r15_59.MaxForce = Vector3.new(4000, 4000, 4000)
        r15_59.Velocity = Vector3.new(0, 0, 0)
        r15_59.Parent = r7_59
    end
    local r16_59 = nil
    r16_59 = r3_0.Heartbeat:Connect(function()
        if not r15_0 or not r2_59 or not r2_59.Parent or r0_0.LocalPlayer.Character ~= r8_59 or not r7_59 or
            not r7_59.Parent or r46_0 then
            if r16_59 then
                r16_59:Disconnect()
            end
            local r0_61 = workspace.CurrentCamera
            if r0_61 and r13_59 then
                r0_61.CameraSubject = r13_59
            end
            return
        end
        local r0_61 = r0_59
        if r0_61 and r0_61.Parent then
            r7_59.CFrame = CFrame.new(r0_61.Position + Vector3.new(0, -(r17_0 or 3), 0),
                r0_61.Position + Vector3.new(0, 5, 0))
            if r15_59 then
                r15_59.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end)
    while r15_0 do
        local r17_59 = r0_0.LocalPlayer.Character
        if r17_59 == r8_59 and r7_59 then
            r17_59 = r7_59.Parent
            if r17_59 then
                r17_59 = r46_0
                if not r17_59 and r2_59 then
                    r17_59 = r2_59.Parent
                    if r17_59 then
                        r17_59 = r63_0()
                        if r17_59 then
                            if r0_59 then
                                r17_59 = r0_59.Parent
                                if r17_59 then
                                    r17_59 = r21_0
                                    r17_59[r0_59] = tick()
                                    break
                                else
                                    break
                                end
                            else
                                break
                            end
                        else
                            pcall(function()
                                r4_59:InvokeServer(unpack(r3_59))
                            end)
                            task.wait(0.15)
                        end
                    else
                        break
                    end
                else
                    break
                end
            else
                break
            end
        else
            break
        end
    end
    if r16_59 then
        r16_59:Disconnect()
    end
    if r15_59 and r15_59.Parent then
        r15_59:Destroy()
    end
    if r7_59 and r7_59.Parent then
        r7_59.AssemblyAngularVelocity = r14_59
    end
    local r17_59 = workspace.CurrentCamera
    if r17_59 and r13_59 then
        r17_59.CameraSubject = r13_59
    end
    if r15_0 then
        r64_0()
    end
end
r19_0 = r58_0()
local r68_0 = {"All"}
for r72_0, r73_0 in ipairs(r19_0) do
    table.insert(r68_0, r73_0)
end
r20_0 = r56_0.Farm:Dropdown({
    Name = "Select Rock",
    Multi = true,
    Required = false,
    Options = r68_0,
    Default = r16_0,
    Callback = function(r0_75)
        if typeof(r0_75) == "table" then
            r16_0 = {}
            local r1_75 = false
            for r5_75, r6_75 in pairs(r0_75) do
                if r6_75 then
                    if r5_75 == "All" then
                        r1_75 = true
                    else
                        table.insert(r16_0, r5_75)
                    end
                end
            end
            if r1_75 then
                r16_0 = {}
                for r5_75, r6_75 in ipairs(r19_0) do
                    table.insert(r16_0, r6_75)
                end
                if r20_0 and r20_0.UpdateSelection then
                    r20_0:UpdateSelection(r16_0)
                end
            end
        end
        if not r16_0 or #r16_0 == 0 then
            r16_0 = {}
            r9_0.CurrentConfig.SelectedRockType = {}
        else
            r9_0.CurrentConfig.SelectedRockType = r16_0
        end
        r9_0.SaveConfig()
    end
}, "SelectRockDropdown")
if r16_0 and r20_0 and r20_0.UpdateSelection then
    r20_0:UpdateSelection(r16_0)
end
r56_0.Farm:Button({
    Name = "Refresh Rock List",
    Callback = function()
        r19_0 = r58_0()
        local r0_4 = {"All"}
        for r4_4, r5_4 in ipairs(r19_0) do
            table.insert(r0_4, r5_4)
        end
        if r20_0 then
            if r20_0.ClearOptions then
                r20_0:ClearOptions()
            end
            if r20_0.InsertOptions then
                r20_0:InsertOptions(r0_4)
            end
            if r16_0 and r20_0.UpdateSelection then
                r20_0:UpdateSelection(r16_0)
            end
        end
    end
}, "RefreshRockListButton")
local r69_0 = r56_0.Farm:Dropdown({
    Name = "Select Distance",
    Multi = false,
    Required = false,
    Options = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"},
    Default = tostring(r17_0),
    Callback = function(r0_50)
        if typeof(r0_50) == "table" then
            for r4_50, r5_50 in pairs(r0_50) do
                if r5_50 then
                    r0_50 = r4_50
                    break
                end
            end
        end
        local r1_50 = tonumber(r0_50)
        if r1_50 and 1 <= r1_50 and r1_50 <= 10 then
            r17_0 = r1_50
            r9_0.CurrentConfig.SelectedMineDistance = r17_0
            r9_0.SaveConfig()
        end
    end
}, "SelectMineDistanceDropdown")
if r17_0 and r69_0 and r69_0.UpdateSelection then
    r69_0:UpdateSelection(tostring(r17_0))
end
r56_0.Farm:Slider({
    Name = "Tween Speed (1-50)",
    Default = r18_0,
    Minimum = 1,
    Maximum = 50,
    DisplayMethod = "Value",
    Precision = 1,
    Callback = function(r0_53)
        local r1_53 = math.clamp(tonumber(r0_53) or r18_0, 1, 50)
        r18_0 = r1_53
        r9_0.CurrentConfig.MineTweenSpeed = r1_53
        r9_0.SaveConfig()
        if r15_0 and not r46_0 then
            if r25_0 then
                pcall(function()
                    r25_0:Cancel()
                end)
                r25_0 = nil
            end
            r23_0 = false
            r64_0()
        end
    end
}, "MineTweenSpeedSlider")
r56_0.Farm:Toggle({
    Name = "Auto Mine",
    Default = r15_0,
    Callback = function(r0_2)
        r15_0 = r0_2
        r9_0.CurrentConfig.AutoMineEnabled = r0_2
        r9_0.SaveConfig()
        if r0_2 then
            if not r16_0 or #r16_0 == 0 then
                r12_0("Mine", "Please select a rock type!", 4)
            else
                r64_0()
            end
        else
            r23_0 = false
            if r24_0 then
                r24_0:Disconnect()
                r24_0 = nil
            end
            r65_0()
        end
    end
}, "AutoMineToggle")
task.spawn(function()
    while task.wait(0.3) do
        local r0_91 = r15_0
        if r0_91 then
            r0_91 = r16_0
            if r0_91 then
                r0_91 = #r16_0
                if r0_91 > 0 then
                    r0_91 = r46_0
                    if not r0_91 then
                        r0_91 = r0_0.LocalPlayer
                        local r1_91 = r0_91.Character
                        local r2_91 = r1_91 and r1_91:FindFirstChild("HumanoidRootPart")
                        if r2_91 and not r23_0 then
                            r64_0()
                            task.wait(0.2)
                        end
                        if r1_91 and r2_91 then
                            local r3_91 = nil
                            local r4_91 = math.huge
                            local r6_91 = r16_0
                            for r8_91, r9_91 in ipairs(r6_91) do
                                for r14_91, r15_91 in ipairs(r59_0(r9_91)) do
                                    if r15_91 and r15_91.Parent then
                                        local r16_91 = r21_0[r15_91]
                                        local r17_91 = tick()
                                        if (not r16_91 or r17_91 - r16_91 >= r22_0) and r16_91 then
                                            r21_0[r15_91] = nil
                                        end
                                        if not r16_91 or r22_0 <= r17_91 - r16_91 then
                                            local r18_91 = r2_91.Position
                                            local r19_91 = r15_91.Position
                                            local r20_91 = (Vector3.new(r18_91.X, 0, r18_91.Z) -
                                                               Vector3.new(r19_91.X, 0, r19_91.Z)).Magnitude
                                            if r20_91 < r4_91 then
                                                r4_91 = r20_91
                                                r3_91 = r15_91
                                            end
                                        end
                                    end
                                end
                            end
                            if r3_91 then
                                r66_0(r3_91)
                                local r5_91 = r3_91:FindFirstAncestorWhichIsA("Model")
                                if r5_91 then
                                    r6_91 = r5_91.Name or nil
                                end
                                r67_0(r3_91, r6_91)
                            end
                        end
                    end
                end
            end
        end
    end
end)
task.spawn(function()
    while task.wait(5) do
        local r0_3 = tick()
        local r1_3 = {}
        for r5_3, r6_3 in pairs(r21_0) do
            if r22_0 <= r0_3 - r6_3 or not r5_3 or not r5_3.Parent then
                table.insert(r1_3, r5_3)
            end
        end
        for r5_3, r6_3 in ipairs(r1_3) do
            r21_0[r6_3] = nil
        end
    end
end)
r56_0.Enemy:Header({
    Name = "Enemy"
})
local function r70_0(r0_14)
    if not r0_14 or r0_14 == "" then
        return nil
    end
    local r1_14 = r0_14:gsub("%d+$", "")
    if r1_14 == "" then
        return nil
    end
    return r1_14:gsub("%s+$", "")
end
local function r71_0()
    r31_0 = {}
    local r0_9 = {}
    local r1_9 = r4_0:FindFirstChild("Assets")
    if not r1_9 then
        return r31_0
    end
    local r2_9 = r1_9:FindFirstChild("Mobs")
    if not r2_9 then
        return r31_0
    end
    for r6_9, r7_9 in ipairs(r2_9:GetDescendants()) do
        if r7_9:IsA("Model") and r7_9.Name ~= "Model" then
            local r8_9 = r70_0(r7_9.Name)
            if r8_9 and r8_9 ~= "" and not r0_9[r8_9] then
                r0_9[r8_9] = true
                table.insert(r31_0, r8_9)
            end
        end
    end
    table.sort(r31_0)
    return r31_0
end
local function r72_0()
    r42_0 = {}
    local r0_66 = r4_0:FindFirstChild("Assets")
    if not r0_66 then
        return r42_0
    end
    local r1_66 = r0_66:FindFirstChild("Extras")
    if not r1_66 then
        return r42_0
    end
    local r2_66 = r1_66:FindFirstChild("Potion")
    if not r2_66 then
        return r42_0
    end
    for r6_66, r7_66 in ipairs(r2_66:GetChildren()) do
        if r7_66:IsA("Model") then
            table.insert(r42_0, r7_66.Name)
        end
    end
    table.sort(r42_0)
    return r42_0
end
local function r73_0(r0_102)
    local r1_102 = {}
    if not r0_102 or r0_102 == "" then
        return r1_102
    end
    local r2_102 = workspace:FindFirstChild("Living")
    if not r2_102 then
        return r1_102
    end
    for r6_102, r7_102 in ipairs(r2_102:GetChildren()) do
        if r7_102:IsA("Model") and r70_0(r7_102.Name) == r0_102 then
            table.insert(r1_102, r7_102)
        end
    end
    return r1_102
end
local function r74_0(r0_90)
    if not r0_90 or not r0_90.Parent then
        return true
    end
    local r1_90 = r0_90:FindFirstChild("Status")
    if r1_90 and r1_90:FindFirstChild("Dead") then
        return true
    end
    return false
end
local function r75_0(r0_43)
    local r2_43 = r0_0.LocalPlayer.Character
    if not r2_43 then
        return nil
    end
    local r3_43 = r2_43:FindFirstChild("HumanoidRootPart")
    if not r3_43 then
        return nil
    end
    local r4_43 = r73_0(r0_43)
    local r5_43 = nil
    local r6_43 = math.huge
    for r10_43, r11_43 in ipairs(r4_43) do
        if not r74_0(r11_43) and r11_43 and r11_43.Parent then
            local r12_43 = r11_43:FindFirstChild("HumanoidRootPart") or r11_43.PrimaryPart or
                               r11_43:FindFirstChildWhichIsA("BasePart", true)
            if r12_43 then
                local r13_43 = (r3_43.Position - r12_43.Position).Magnitude
                if r13_43 < r6_43 then
                    r6_43 = r13_43
                    r5_43 = r11_43
                end
            end
        end
    end
    return r5_43
end
local function r76_0(r0_55)
    if not r0_55 or not r0_55.Parent then
        return true
    end
    local r1_55 = r0_55:FindFirstChild("Status")
    if r1_55 and r1_55:FindFirstChild("Dead") then
        return true
    end
    return false
end
local r77_0 = nil
local function r78_0()
    local r1_99 = r0_0.LocalPlayer.Character
    if not r1_99 then
        return false
    end
    local r2_99 = r1_99:FindFirstChild("HumanoidRootPart")
    if not r2_99 then
        return false
    end
    if r41_0 then
        r41_0:Disconnect()
        r41_0 = nil
    end
    local r3_99 = r2_99.Position
    r2_99.CFrame = CFrame.new(Vector3.new(r3_99.X, r39_0, r3_99.Z))
    r40_0 = true
    local r5_99 = r2_99:FindFirstChild("BodyVelocity")
    if not r5_99 then
        r5_99 = Instance.new("BodyVelocity")
        r5_99.MaxForce = Vector3.new(4000, 4000, 4000)
        r5_99.Parent = r2_99
    end
    local r6_99 = r1_99
    r41_0 = r3_0.Heartbeat:Connect(function()
        if not r29_0 or not r40_0 or r0_0.LocalPlayer.Character ~= r6_99 or not r2_99 or not r2_99.Parent or r46_0 then
            if r41_0 then
                r41_0:Disconnect()
                r41_0 = nil
            end
            r40_0 = false
            return
        end
        local r0_100 = r2_99.Position
        local r1_100 = Vector3.new(r0_100.X, r39_0, r0_100.Z)
        r2_99.CFrame = CFrame.new(r1_100, r1_100 + r2_99.CFrame.LookVector * Vector3.new(1, 0, 1))
        if r5_99 then
            r5_99.Velocity = Vector3.new(0, 0, 0)
        end
    end)
    return true
end
local function r79_0(r0_44)
    local r2_44 = r0_0.LocalPlayer.Character
    if not r2_44 then
        return false
    end
    local r3_44 = r2_44:FindFirstChild("HumanoidRootPart")
    if not r3_44 or not r0_44 or not r0_44.Parent then
        return false
    end
    local r4_44 = r0_44:FindFirstChild("HumanoidRootPart") or r0_44.PrimaryPart or
                      r0_44:FindFirstChildWhichIsA("BasePart", true)
    if not r4_44 then
        return false
    end
    if r77_0 then
        pcall(function()
            r77_0:Cancel()
        end)
    end
    local r5_44 = r4_44.Position
    local r6_44 = Vector3.new(r5_44.X, r39_0, r5_44.Z)
    local r7_44 = r3_44.Position
    r77_0 = r2_0:Create(r3_44,
        TweenInfo.new((Vector3.new(r7_44.X, 0, r7_44.Z) - Vector3.new(r6_44.X, 0, r6_44.Z)).Magnitude / r28_0,
            Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
            CFrame = CFrame.new(r6_44, r4_44.Position)
        })
    r77_0:Play()
    return true
end
local function r80_0(r0_104, r1_104)
    if not r0_104 or not r1_104 or r1_104 == "" then
        return
    end
    if not r0_104 or not r0_104.Parent then
        return
    end
    local r2_104 = {"Weapon"}
    local r3_104 = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild(
        "Knit"):WaitForChild("Services"):WaitForChild("ToolService"):WaitForChild("RF"):WaitForChild("ToolActivated")
    local r5_104 = r0_0.LocalPlayer.Character
    if not r5_104 then
        return
    end
    local r6_104 = r5_104:FindFirstChild("HumanoidRootPart")
    if not r6_104 then
        return
    end
    local r7_104 = r5_104
    if r77_0 then
        pcall(function()
            r77_0.Completed:Wait()
        end)
    end
    if r41_0 then
        r41_0:Disconnect()
        r41_0 = nil
    end
    local r8_104 = r0_104:FindFirstChild("HumanoidRootPart") or r0_104.PrimaryPart or
                       r0_104:FindFirstChildWhichIsA("BasePart", true)
    if not r8_104 then
        return
    end
    r6_104.CFrame = CFrame.new(r8_104.Position + Vector3.new(0, -r27_0, 0), r8_104.Position + Vector3.new(0, 5, 0))
    r40_0 = false
    local r11_104 = workspace.CurrentCamera
    local r12_104 = r11_104.CameraSubject
    local r13_104 = r0_104:FindFirstChildOfClass("Humanoid")
    if r13_104 then
        r11_104.CameraSubject = r13_104
    end
    local r14_104 = r6_104.AssemblyAngularVelocity
    r6_104.AssemblyAngularVelocity = Vector3.new(0, 0, 0)
    local r15_104 = r6_104:FindFirstChild("BodyVelocity")
    if not r15_104 then
        r15_104 = Instance.new("BodyVelocity")
        r15_104.MaxForce = Vector3.new(4000, 4000, 4000)
        r15_104.Velocity = Vector3.new(0, 0, 0)
        r15_104.Parent = r6_104
    end
    local r16_104 = nil
    r16_104 = r3_0.Heartbeat:Connect(function()
        if not r29_0 or not r0_104 or not r0_104.Parent or r76_0(r0_104) or r0_0.LocalPlayer.Character ~= r7_104 or
            not r6_104 or not r6_104.Parent or r46_0 then
            if r16_104 then
                r16_104:Disconnect()
            end
            local r0_106 = workspace.CurrentCamera
            if r0_106 and r12_104 then
                r0_106.CameraSubject = r12_104
            end
            return
        end
        if r8_104 and r6_104 and r6_104.Parent then
            r6_104.CFrame = CFrame.new(r8_104.Position + Vector3.new(0, -r27_0, 0),
                r8_104.Position + Vector3.new(0, 5, 0))
            if r15_104 then
                r15_104.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end)
    while r29_0 do
        local r17_104 = r0_0.LocalPlayer.Character
        if r17_104 == r7_104 and r6_104 then
            r17_104 = r6_104.Parent
            if r17_104 then
                r17_104 = r46_0
                if r17_104 then
                    break
                else
                    r17_104 = r76_0(r0_104)
                    if r17_104 then
                        break
                    elseif r0_104 then
                        r17_104 = r0_104.Parent
                        if not r17_104 then
                            break
                        else
                            pcall(function()
                                r3_104:InvokeServer(unpack(r2_104))
                            end)
                            task.wait(0.15)
                        end
                    else
                        break
                    end
                end
            else
                break
            end
        else
            break
        end
    end
    if r77_0 then
        pcall(function()
            r77_0:Cancel()
        end)
        r77_0 = nil
    end
    if r16_104 then
        r16_104:Disconnect()
    end
    if r15_104 and r15_104.Parent then
        r15_104:Destroy()
    end
    if r6_104 and r6_104.Parent then
        r6_104.AssemblyAngularVelocity = r14_104
    end
    local r17_104 = workspace.CurrentCamera
    if r17_104 and r12_104 then
        r17_104.CameraSubject = r12_104
    end
    if r29_0 then
        r78_0()
    end
end
r31_0 = r71_0()
local r81_0 = {"All"}
for r85_0, r86_0 in ipairs(r31_0) do
    table.insert(r81_0, r86_0)
end
r32_0 = r56_0.Enemy:Dropdown({
    Name = "Select Enemy",
    Multi = true,
    Required = false,
    Options = r81_0,
    Default = r26_0,
    Callback = function(r0_86)
        if typeof(r0_86) == "table" then
            r26_0 = {}
            local r1_86 = false
            for r5_86, r6_86 in pairs(r0_86) do
                if r6_86 then
                    if r5_86 == "All" then
                        r1_86 = true
                    else
                        table.insert(r26_0, r5_86)
                    end
                end
            end
            if r1_86 then
                r26_0 = {}
                for r5_86, r6_86 in ipairs(r31_0) do
                    table.insert(r26_0, r6_86)
                end
                if r32_0 and r32_0.UpdateSelection then
                    r32_0:UpdateSelection(r26_0)
                end
            end
        end
        if not r26_0 or #r26_0 == 0 then
            r26_0 = {}
            r9_0.CurrentConfig.SelectedEnemyType = {}
        else
            r9_0.CurrentConfig.SelectedEnemyType = r26_0
        end
        r9_0.SaveConfig()
    end
}, "SelectEnemyDropdown")
if r26_0 and r32_0 and r32_0.UpdateSelection then
    for r85_0, r86_0 in ipairs(r31_0) do
        if r86_0 == r26_0 then
            r32_0:UpdateSelection(r26_0)
            break
        end
    end
end
r56_0.Enemy:Button({
    Name = "Refresh Enemy List",
    Callback = function()
        r31_0 = r71_0()
        local r0_101 = {"All"}
        for r4_101, r5_101 in ipairs(r31_0) do
            table.insert(r0_101, r5_101)
        end
        if r32_0 then
            if r32_0.ClearOptions then
                r32_0:ClearOptions()
            end
            if r32_0.InsertOptions then
                r32_0:InsertOptions(r0_101)
            end
            if r26_0 and r32_0.UpdateSelection then
                r32_0:UpdateSelection(r26_0)
            end
        end
    end
}, "RefreshEnemyListButton")
local r82_0 = r56_0.Enemy:Dropdown({
    Name = "Select Distance",
    Multi = false,
    Required = false,
    Options = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10"},
    Default = tostring(r27_0),
    Callback = function(r0_23)
        if typeof(r0_23) == "table" then
            for r4_23, r5_23 in pairs(r0_23) do
                if r5_23 then
                    r0_23 = r4_23
                    break
                end
            end
        end
        local r1_23 = tonumber(r0_23)
        if r1_23 and 1 <= r1_23 and r1_23 <= 10 then
            r27_0 = r1_23
            r9_0.CurrentConfig.SelectedDistance = r27_0
            r9_0.SaveConfig()
        end
    end
}, "SelectDistanceDropdown")
if r27_0 and r82_0 and r82_0.UpdateSelection then
    r82_0:UpdateSelection(tostring(r27_0))
end
r56_0.Enemy:Slider({
    Name = "Tween Speed (1-50)",
    Default = r28_0,
    Minimum = 1,
    Maximum = 50,
    DisplayMethod = "Value",
    Precision = 1,
    Callback = function(r0_39)
        local r1_39 = math.clamp(tonumber(r0_39) or r28_0, 1, 50)
        r28_0 = r1_39
        r9_0.CurrentConfig.EnemyTweenSpeed = r1_39
        r9_0.SaveConfig()
        if r29_0 and not r46_0 then
            if r77_0 then
                pcall(function()
                    r77_0:Cancel()
                end)
                r77_0 = nil
            end
            r40_0 = false
            r78_0()
        end
    end
}, "EnemyTweenSpeedSlider")
r56_0.Enemy:Toggle({
    Name = "Auto Farm Enemy",
    Default = r29_0,
    Callback = function(r0_56)
        r29_0 = r0_56
        r9_0.CurrentConfig.AutoFarmEnemyEnabled = r0_56
        r9_0.SaveConfig()
        if r0_56 then
            if not r26_0 then
                r12_0("Enemy", "Please select an enemy type!", 4)
            else
                r78_0()
            end
        else
            r40_0 = false
            if r41_0 then
                r41_0:Disconnect()
                r41_0 = nil
            end
            r65_0()
        end
    end
}, "AutoFarmEnemyToggle")
task.spawn(function()
    while true do
        local r0_97 = r29_0
        if r0_97 then
            r0_97 = r26_0
            if r0_97 then
                r0_97 = #r26_0
                if r0_97 > 0 then
                    r0_97 = r46_0
                    if not r0_97 then
                        r0_97 = r15_0
                        if r0_97 then
                            r0_97 = r16_0
                            if r0_97 then
                                r0_97 = #r16_0
                                if r0_97 ~= 0 then
                                    r0_97 = not r61_0(r16_0)
                                end
                            end
                        else
                            r0_97 = true
                        end
                    end
                else
                    r0_97 = false
                end
            end
        end
        if r0_97 then
            local r2_97 = r0_0.LocalPlayer.Character
            local r3_97 = r2_97 and r2_97:FindFirstChild("HumanoidRootPart")
            if r3_97 and not r40_0 then
                r78_0()
                task.wait(0.2)
            end
            if r2_97 and r3_97 then
                local r4_97 = nil
                local r5_97 = math.huge
                local r6_97 = r26_0
                local r7_97 = false
                for r11_97, r12_97 in ipairs(r26_0) do
                    if r12_97 == "All" then
                        r7_97 = true
                        break
                    end
                end
                if r7_97 then
                    r6_97 = r31_0
                end
                for r11_97, r12_97 in ipairs(r6_97) do
                    local r13_97 = r75_0(r12_97)
                    if r13_97 and r3_97 then
                        local r14_97 = r13_97:FindFirstChild("HumanoidRootPart") or r13_97.PrimaryPart or
                                           r13_97:FindFirstChildWhichIsA("BasePart", true)
                        if r14_97 then
                            local r15_97 = r3_97.Position
                            local r16_97 = r14_97.Position
                            local r17_97 =
                                (Vector3.new(r15_97.X, 0, r15_97.Z) - Vector3.new(r16_97.X, 0, r16_97.Z)).Magnitude
                            if r17_97 < r5_97 then
                                r5_97 = r17_97
                                r4_97 = r13_97
                            end
                        end
                    end
                end
                if r4_97 then
                    if not r76_0(r4_97) then
                        r79_0(r4_97)
                        r80_0(r4_97, r70_0(r4_97.Name))
                    else
                        task.wait(0.1)
                    end
                else
                    task.wait(0.1)
                end
            end
        else
            task.wait(0.3)
        end
    end
end)
r56_0.ShopPotion:Header({
    Name = "Shop Potion"
})
local r83_0 = nil
local function r84_0()
    local r1_70 = r0_0.LocalPlayer.Character
    if not r1_70 then
        return false
    end
    local r2_70 = r1_70:FindFirstChild("HumanoidRootPart")
    if not r2_70 then
        return false
    end
    local r3_70 = game.PlaceId
    local r4_70 = nil
    if r3_70 == 76558904092080 then
        r4_70 = Vector3.new(-153.73959721191406, 27.377073287963867, 116.34660339355469)
    elseif r3_70 == 129009554587176 then
        r4_70 = Vector3.new(-96.84030151367188, 20.6254825592041, -43.52947235107422)
    else
        r4_70 = Vector3.new(-153.73959721191406, 27.377073287963867, 116.34660339355469)
    end
    local r6_70 = math.clamp((r2_70.Position - r4_70).Magnitude / 5, 3, 12)
    local r7_70 = CFrame.new(r4_70, r4_70 + r2_70.CFrame.LookVector * Vector3.new(1, 0, 1))
    if r83_0 then
        pcall(function()
            r83_0:Cancel()
        end)
        r83_0 = nil
    end
    local r8_70 = r2_0:Create(r2_70, TweenInfo.new(r6_70, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
        CFrame = r7_70
    })
    r83_0 = r8_70
    r8_70:Play()
    local r9_70 = false
    r8_70.Completed:Connect(function()
        r9_70 = true
    end)
    while not r9_70 do
        if not r45_0 then
            pcall(function()
                r8_70:Cancel()
            end)
            r83_0 = nil
            return false
        end
        task.wait(0.05)
    end
    r83_0 = nil
    return true
end
r42_0 = r72_0()
r43_0 = r56_0.ShopPotion:Dropdown({
    Name = "Select Potion",
    Multi = true,
    Required = false,
    Options = r42_0,
    Default = r44_0,
    Callback = function(r0_58)
        if typeof(r0_58) == "table" then
            r44_0 = {}
            for r4_58, r5_58 in pairs(r0_58) do
                if r5_58 then
                    table.insert(r44_0, r4_58)
                end
            end
        else
            r44_0 = {}
        end
        if not r44_0 or #r44_0 == 0 then
            r44_0 = {}
            r9_0.CurrentConfig.SelectedPotionName = {}
        else
            r9_0.CurrentConfig.SelectedPotionName = r44_0
        end
        r9_0.SaveConfig()
    end
}, "SelectPotionDropdown")
if r44_0 and 0 < #r44_0 and r43_0 and r43_0.UpdateSelection then
    r43_0:UpdateSelection(r44_0)
end
r56_0.ShopPotion:Button({
    Name = "Refresh Potion List",
    Callback = function()
        local r0_21 = r72_0()
        if r43_0 then
            if r43_0.ClearOptions then
                r43_0:ClearOptions()
            end
            if r43_0.InsertOptions then
                r43_0:InsertOptions(r0_21)
            end
            if r44_0 and 0 < #r44_0 and r43_0.UpdateSelection then
                r43_0:UpdateSelection(r44_0)
            end
        end
        r12_0("Shop Potion", "�ã cập nhật danh sách potion.", 3)
    end
}, "RefreshPotionListButton")
r56_0.ShopPotion:Toggle({
    Name = "Auto Buy And Use",
    Default = r45_0,
    Callback = function(r0_22)
        r45_0 = r0_22
        r9_0.CurrentConfig.AutoBuyAndUsePotionEnabled = r0_22
        r9_0.SaveConfig()
        if r0_22 and (not r44_0 or #r44_0 == 0) then
            r12_0("Shop Potion", "Chưa chọn potion!", 3)
        end
    end
}, "AutoBuyAndUsePotionToggle")
local function r85_0(r0_41)
    if not r0_41 or r0_41 == "" then
        return nil
    end
    return ({
        MovementSpeedPotion1 = "SpeedPotion1",
        LuckyPotion1 = "LuckPotion1"
    })[r0_41] or r0_41
end
local function r86_0(r0_17)
    local r1_17 = r0_0.LocalPlayer
    if not r1_17 then
        return false
    end
    local r2_17 = r1_17:FindFirstChild("PlayerGui")
    if not r2_17 then
        return false
    end
    local r3_17 = r2_17:FindFirstChild("Hotbar")
    if not r3_17 then
        return false
    end
    local r4_17 = r3_17:FindFirstChild("Perks")
    if not r4_17 then
        return false
    end
    if r4_17:FindFirstChild(r85_0(r0_17)) then
        return true
    end
    if r4_17:FindFirstChild(r0_17) then
        return true
    end
    return false
end
task.spawn(function()
    local r0_47 = r4_0:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services")
        :WaitForChild("ToolService"):WaitForChild("RF"):WaitForChild("ToolActivated")
    while true do
        task.wait(0.5)
        if r45_0 then
            local r1_47 = r44_0
            if r1_47 then
                r1_47 = #r44_0
                if r1_47 == 0 then
                    r46_0 = false
                    r1_47 = r24_0
                    if r1_47 then
                        r24_0:Disconnect()
                        r1_47 = nil
                        r24_0 = r1_47
                    end
                    r1_47 = r41_0
                    if r1_47 then
                        r41_0:Disconnect()
                        r1_47 = nil
                        r41_0 = r1_47
                    end
                    r23_0 = false
                    r1_47 = false
                    r40_0 = r1_47
                end
            end
        else
        end
        r46_0 = true
        local r1_47 = r24_0
        if r1_47 then
            r24_0:Disconnect()
            r1_47 = nil
            r24_0 = r1_47
        end
        r1_47 = r41_0
        if r1_47 then
            r41_0:Disconnect()
            r1_47 = nil
            r41_0 = r1_47
        end
        r23_0 = false
        r40_0 = false
        r1_47 = r0_0.LocalPlayer
        local r2_47 = r1_47 and r1_47:FindFirstChild("Backpack")
        local r3_47 = false
        local r4_47 = r1_47 and r1_47:FindFirstChild("PlayerGui")
        if r4_47 then
            local r5_47 = r4_47:FindFirstChild("Main")
            local r6_47 = r5_47 and r5_47:FindFirstChild("Screen")
            local r7_47 = r6_47 and r6_47:FindFirstChild("Hud")
            local r8_47 = r7_47 and r7_47:FindFirstChild("Gold")
            if r8_47 and r8_47:IsA("TextLabel") and (tonumber((r8_47.Text or ""):gsub("[^%d%.]", "")) or 0) >= 600 then
                r3_47 = true
            end
        end
        if r45_0 and r3_47 then
            for r8_47, r9_47 in ipairs(r44_0) do
                if not r45_0 then
                    break
                else
                    if r2_47 and r2_47:FindFirstChild(r9_47) then
                        pcall(function()
                            r0_47:InvokeServer(unpack({r9_47}))
                        end)
                    elseif not r86_0(r9_47) and r45_0 and r84_0() and r45_0 then
                        pcall(function()
                            r5_0:InvokeServer(unpack({r9_47, 3}))
                        end)
                        task.wait(1)
                    end
                end
            end
        end
        r46_0 = false
    end
end)
r56_0.SellItem:Header({
    Name = "Sell Item"
})
local function r87_0()
    r47_0 = {}
    local r0_13 = r4_0:FindFirstChild("Assets")
    if not r0_13 then
        return r47_0
    end
    local r1_13 = r0_13:FindFirstChild("Ores")
    if not r1_13 then
        return r47_0
    end
    for r5_13, r6_13 in ipairs(r1_13:GetChildren()) do
        if r6_13:IsA("Model") then
            table.insert(r47_0, r6_13.Name)
        end
    end
    table.sort(r47_0)
    return r47_0
end
local function r88_0(r0_57)
    local r1_57 = r0_0.LocalPlayer
    if not r1_57 then
        return 0
    end
    local r2_57 = r1_57:FindFirstChild("PlayerGui")
    if not r2_57 then
        return 0
    end
    local r3_57 = r2_57:FindFirstChild("Menu")
    if not r3_57 then
        return 0
    end
    local r4_57 = r3_57:FindFirstChild("Frame")
    if not r4_57 then
        return 0
    end
    local r5_57 = r4_57:FindFirstChild("Frame")
    if not r5_57 then
        return 0
    end
    local r6_57 = r5_57:FindFirstChild("Menus")
    if not r6_57 then
        return 0
    end
    local r7_57 = r6_57:FindFirstChild("Stash")
    if not r7_57 then
        return 0
    end
    local r8_57 = r7_57:FindFirstChild("Background")
    if not r8_57 then
        return 0
    end
    local r9_57 = r8_57:FindFirstChild(r0_57)
    if not r9_57 then
        return 0
    end
    local r10_57 = r9_57:FindFirstChild("Main")
    if not r10_57 then
        return 0
    end
    local r11_57 = r10_57:FindFirstChild("Quantity")
    if not r11_57 or not r11_57:IsA("TextLabel") then
        return 0
    end
    return tonumber((r11_57.Text or ""):gsub("[^%d]", "")) or 0
end
local function r89_0()
    local r0_46 = {}
    for r4_46, r5_46 in ipairs(r47_0) do
        local r6_46 = r88_0(r5_46)
        if r6_46 > 0 then
            table.insert(r0_46, r5_46 .. " (" .. tostring(r6_46) .. ")")
        else
            table.insert(r0_46, r5_46)
        end
    end
    return r0_46
end
r47_0 = r87_0()
local function r90_0()
    local r0_85 = {}
    for r4_85, r5_85 in ipairs(r48_0 or {}) do
        local r6_85 = r88_0(r5_85)
        if r6_85 > 0 then
            table.insert(r0_85, r5_85 .. " (" .. tostring(r6_85) .. ")")
        else
            table.insert(r0_85, r5_85)
        end
    end
    return r0_85
end
local r91_0 = r56_0.SellItem:Dropdown({
    Name = "Select Item",
    Multi = true,
    Required = false,
    Options = r89_0(),
    Default = r90_0(),
    Callback = function(r0_63)
        if typeof(r0_63) == "table" then
            r48_0 = {}
            for r4_63, r5_63 in pairs(r0_63) do
                if r5_63 then
                    table.insert(r48_0, r4_63:gsub("%s*%(%d+%)", ""))
                end
            end
        else
            r48_0 = {}
        end
        r9_0.CurrentConfig.SelectedItemName = r48_0
        r9_0.SaveConfig()
    end
}, "SelectItemDropdown")
if r48_0 and 0 < #r48_0 and r91_0 and r91_0.UpdateSelection then
    local r92_0 = r90_0()
    if #r92_0 > 0 then
        r91_0:UpdateSelection(r92_0)
    end
end
r56_0.SellItem:Button({
    Name = "Refresh Item List",
    Callback = function()
        r47_0 = r87_0()
        if r91_0 then
            local r1_12 = r89_0()
            if r91_0.ClearOptions then
                r91_0:ClearOptions()
            end
            if r91_0.InsertOptions then
                r91_0:InsertOptions(r1_12)
            end
            if r48_0 and 0 < #r48_0 then
                local r2_12 = {}
                for r6_12, r7_12 in ipairs(r48_0) do
                    for r11_12, r12_12 in ipairs(r1_12) do
                        if r12_12:gsub("%s*%(%d+%)", "") == r7_12 then
                            table.insert(r2_12, r12_12)
                            break
                        end
                    end
                end
                if 0 < #r2_12 and r91_0.UpdateSelection then
                    r91_0:UpdateSelection(r2_12)
                end
            end
        end
    end
}, "RefreshItemListButton")
r56_0.SellItem:Toggle({
    Name = "Auto Sell Item",
    Default = r49_0,
    Callback = function(r0_1)
        r49_0 = r0_1
        r9_0.CurrentConfig.AutoSellItemEnabled = r0_1
        r9_0.SaveConfig()
        if r0_1 then
            if not r48_0 or #r48_0 == 0 then
                r12_0("Sell Item", "Please select an item!", 3)
            else
                r50_0 = nil
                r51_0 = false
            end
        else
            r50_0 = nil
            r51_0 = false
        end
    end
}, "AutoSellItemToggle")
task.spawn(function()
    local r0_18 = r4_0:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services")
        :WaitForChild("DialogueService"):WaitForChild("RF"):WaitForChild("RunCommand")
    local r1_18 = r4_0:WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services")
        :WaitForChild("ProximityService"):WaitForChild("RF"):WaitForChild("ForceDialogue")
    while true do
        task.wait(1)
        if r49_0 then
            local r2_18 = r48_0
            if r2_18 then
                r2_18 = #r48_0
                if r2_18 > 0 then
                    r2_18 = r50_0
                    if not r2_18 then
                        r2_18 = workspace:FindFirstChild("Proximity")
                        if r2_18 then
                            local r3_18 = r2_18:FindFirstChild("Greedy Cey")
                            if r3_18 then
                                r50_0 = r3_18
                            end
                        end
                    end
                    r2_18 = r50_0
                    if r2_18 then
                        r2_18 = r51_0
                        if not r2_18 then
                            pcall(function()
                                r1_18:InvokeServer(unpack({r50_0, "SellConfirmMisc"}))
                            end)
                            r51_0 = true
                            task.wait(0.5)
                        end
                    end
                    r2_18 = r50_0
                    if r2_18 then
                        r2_18 = r51_0
                        if r2_18 then
                            r2_18 = {}
                            local r3_18 = false
                            for r7_18, r8_18 in ipairs(r48_0) do
                                local r9_18 = r88_0(r8_18)
                                if r9_18 > 0 then
                                    r2_18[r8_18] = r9_18
                                    r3_18 = true
                                end
                            end
                            if r3_18 then
                                pcall(function()
                                    r0_18:InvokeServer(unpack({"SellConfirm", {
                                        Basket = r2_18
                                    }}))
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
end)
task.spawn(function()
    while true do
        task.wait(3)
        if r91_0 then
            local r0_52 = r89_0()
            if r91_0.ClearOptions then
                r91_0:ClearOptions()
            end
            if r91_0.InsertOptions then
                r91_0:InsertOptions(r0_52)
            end
            if r48_0 and #r48_0 > 0 then
                local r1_52 = {}
                for r5_52, r6_52 in ipairs(r48_0) do
                    for r10_52, r11_52 in ipairs(r0_52) do
                        if r11_52:gsub("%s*%(%d+%)", "") == r6_52 then
                            table.insert(r1_52, r11_52)
                            break
                        end
                    end
                end
                if #r1_52 > 0 and r91_0.UpdateSelection then
                    r91_0:UpdateSelection(r1_52)
                end
            end
        end
    end
end)
r56_0.TeleportNPC:Header({
    Name = "Tween To NPC"
})
local function r92_0()
    r52_0 = {}
    local r0_92 = workspace:FindFirstChild("Proximity")
    if not r0_92 then
        return r52_0
    end
    for r4_92, r5_92 in ipairs(r0_92:GetChildren()) do
        if r5_92:IsA("Model") and not r5_92.Name:lower():find("potion") then
            table.insert(r52_0, r5_92.Name)
        end
    end
    table.sort(r52_0)
    return r52_0
end
local function r93_0()
    r54_0 = {}
    local r0_15 = workspace:FindFirstChild("Shops")
    if not r0_15 then
        return r54_0
    end
    for r4_15, r5_15 in ipairs(r0_15:GetChildren()) do
        if r5_15:IsA("Model") then
            table.insert(r54_0, r5_15.Name)
        end
    end
    table.sort(r54_0)
    return r54_0
end
local function r94_0(r0_103, r1_103)
    local r3_103 = r0_0.LocalPlayer.Character
    if not r3_103 then
        r12_0("Teleport", "Character not found!", 3)
        return false
    end
    local r4_103 = r3_103:FindFirstChild("HumanoidRootPart")
    local r5_103 = nil
    if not r4_103 then
        r12_0("Teleport", "HumanoidRootPart not found!", 3)
        r5_103 = false
        return r5_103
    end
    if r1_103 then
        r5_103 = workspace:FindFirstChild("Proximity")
        if not r5_103 then
            r5_103 = workspace:FindFirstChild("Shops")
        end
    else
    end
    if not r5_103 then
        r12_0("Teleport", "Không tìm thấy folder!", 3)
        return false
    end
    local r6_103 = r5_103:FindFirstChild(r0_103)
    if not r6_103 then
        r12_0("Teleport", "Không tìm thấy " .. r0_103 .. "!", 3)
        return false
    end
    local r7_103 = r6_103:FindFirstChild("HumanoidRootPart") or r6_103.PrimaryPart or
                       r6_103:FindFirstChildWhichIsA("BasePart", true)
    if not r7_103 then
        r12_0("Teleport", "Không tìm thấy phần tử của " .. r0_103 .. "!", 3)
        return false
    end
    local r8_103 = r7_103.Position + Vector3.new(0, 3, 0)
    local r12_103 = r2_0:Create(r4_103,
        TweenInfo.new(math.clamp((r4_103.Position - r8_103).Magnitude / 10, 1.5, 8), Enum.EasingStyle.Linear,
            Enum.EasingDirection.Out), {
            CFrame = CFrame.new(r8_103, r7_103.Position)
        })
    r12_103:Play()
    r12_103.Completed:Wait()
    r12_0("Teleport", "Tweened to " .. r0_103, 3)
    return true
end
r52_0 = r92_0()
local r95_0 = r56_0.TeleportNPC:Dropdown({
    Name = "Select NPC",
    Multi = false,
    Required = false,
    Options = r52_0,
    Default = r53_0,
    Callback = function(r0_25)
        if typeof(r0_25) == "table" then
            for r4_25, r5_25 in pairs(r0_25) do
                if r5_25 then
                    r0_25 = r4_25
                    break
                end
            end
        end
        if not r0_25 or r0_25 == "" then
            r53_0 = nil
        else
            r53_0 = r0_25
        end
    end
}, "SelectNPCDropdown")
r56_0.TeleportNPC:Button({
    Name = "Refresh NPC List",
    Callback = function()
        local r0_42 = r92_0()
        r52_0 = r0_42
        if r95_0 then
            if r95_0.ClearOptions then
                r95_0:ClearOptions()
            end
            if r95_0.InsertOptions then
                r95_0:InsertOptions(r0_42)
            end
            if r53_0 and r95_0.UpdateSelection then
                r95_0:UpdateSelection(r53_0)
            end
        end
        r12_0("Teleport", "Updated NPC list.", 3)
    end
}, "RefreshNPCListButton")
r56_0.TeleportNPC:Button({
    Name = "Tween To NPC",
    Callback = function()
        if not r53_0 then
            r12_0("Teleport", "Please select an NPC!", 3)
        else
            r94_0(r53_0, true)
        end
    end
}, "TweenToNPCButton")
r56_0.TeleportShop:Header({
    Name = "Tween To Shop"
})
r54_0 = r93_0()
local r96_0 = r56_0.TeleportShop:Dropdown({
    Name = "Select Shop",
    Multi = false,
    Required = false,
    Options = r54_0,
    Default = r55_0,
    Callback = function(r0_77)
        if typeof(r0_77) == "table" then
            for r4_77, r5_77 in pairs(r0_77) do
                if r5_77 then
                    r0_77 = r4_77
                    break
                end
            end
        end
        if not r0_77 or r0_77 == "" then
            r55_0 = nil
        else
            r55_0 = r0_77
        end
    end
}, "SelectShopDropdown")
r56_0.TeleportShop:Button({
    Name = "Refresh Shop List",
    Callback = function()
        local r0_26 = r93_0()
        r54_0 = r0_26
        if r96_0 then
            if r96_0.ClearOptions then
                r96_0:ClearOptions()
            end
            if r96_0.InsertOptions then
                r96_0:InsertOptions(r0_26)
            end
            if r55_0 and r96_0.UpdateSelection then
                r96_0:UpdateSelection(r55_0)
            end
        end
        r12_0("Teleport", "Updated shop list.", 3)
    end
}, "RefreshShopListButton")
r56_0.TeleportShop:Button({
    Name = "Tween To Shop",
    Callback = function()
        if not r55_0 then
            r12_0("Teleport", "Please select a shop!", 3)
        else
            r94_0(r55_0, false)
        end
    end
}, "TweenToShopButton")
r56_0.SettingsInfo:Header({
    Name = "Script Information"
})
r56_0.SettingsInfo:Label({
    Text = "The Forge Script\nPlayer: " .. r10_0
})
r56_0.SettingsInfo:Button({
    Name = "Copy Player Name",
    Callback = function()
        if setclipboard then
            setclipboard(r10_0)
            r12_0("Notification", "Copied player name.", 3)
        else
            r12_0("Notification", r10_0, 3)
        end
    end
}, "CopyPlayerNameButton")
r56_0.SettingsInfo:SubLabel({
    Text = "Shortcut: Left Alt (or mobile icon) to hide/show UI"
})
local function r97_0(r0_68, r1_68, r2_68)
    local r3_68 = r0_68:FindFirstChild("ESPBillboard")
    if not r3_68 then
        r3_68 = Instance.new("BillboardGui")
        r3_68.Name = "ESPBillboard"
        r3_68.Size = UDim2.new(0, 200, 0, 50)
        r3_68.StudsOffset = Vector3.new(0, 3, 0)
        r3_68.AlwaysOnTop = true
        r3_68.Adornee = r0_68
        r3_68.Parent = r0_68
        local r4_68 = Instance.new("TextLabel")
        r4_68.Name = "ESPLabel"
        r4_68.Size = UDim2.new(1, 0, 1, 0)
        r4_68.BackgroundTransparency = 1
        r4_68.TextColor3 = Color3.fromRGB(255, 255, 255)
        r4_68.TextStrokeTransparency = 0.5
        r4_68.TextSize = 14
        r4_68.Font = Enum.Font.GothamBold
        r4_68.Parent = r3_68
    end
    local r4_68 = r3_68:FindFirstChild("ESPLabel")
    if r4_68 then
        r4_68.Text = r1_68 .. "\n" .. string.format("%.1f", r2_68) .. " studs"
    end
    return r3_68
end
local function r98_0()
    if not r33_0 then
        return
    end
    if not r16_0 or #r16_0 == 0 then
        for r3_74, r4_74 in pairs(r36_0) do
            if r4_74 and r4_74.Parent then
                r4_74:Destroy()
            end
        end
        r36_0 = {}
        return
    end
    local r1_74 = r0_0.LocalPlayer.Character
    if not r1_74 then
        return
    end
    local r2_74 = r1_74:FindFirstChild("HumanoidRootPart")
    if not r2_74 then
        return
    end
    local r3_74 = {}
    local r4_74 = false
    for r8_74, r9_74 in ipairs(r16_0) do
        if r9_74 == "All" then
            r4_74 = true
            break
        else
            r3_74[r9_74] = true
        end
    end
    local r5_74 = workspace:FindFirstChild("Rocks")
    if not r5_74 then
        return
    end
    local r6_74 = {}
    for r10_74, r11_74 in ipairs(r5_74:GetDescendants()) do
        if r11_74:IsA("BasePart") and r11_74.Parent then
            local r12_74 = r11_74:FindFirstAncestorWhichIsA("Model")
            if r12_74 and r12_74.Name ~= "" and (r4_74 or r3_74[r12_74.Name]) then
                r6_74[r11_74] = r12_74.Name
            end
        end
    end
    for r10_74, r11_74 in pairs(r36_0) do
        if not r6_74[r10_74] or not r10_74.Parent then
            if r11_74 and r11_74.Parent then
                r11_74:Destroy()
            end
            r36_0[r10_74] = nil
        end
    end
    for r10_74, r11_74 in pairs(r6_74) do
        local r12_74 = (r2_74.Position - r10_74.Position).Magnitude
        local r13_74 = r36_0[r10_74]
        if not r13_74 or not r13_74.Parent then
            r13_74 = r97_0(r10_74, r11_74, r12_74)
            r36_0[r10_74] = r13_74
        else
            local r14_74 = r13_74:FindFirstChild("ESPLabel")
            if r14_74 then
                r14_74.Text = r11_74 .. "\n" .. string.format("%.1f", r12_74) .. " studs"
            end
        end
    end
end
local function r99_0()
    if not r34_0 then
        return
    end
    if not r26_0 or #r26_0 == 0 then
        for r3_78, r4_78 in pairs(r37_0) do
            if r4_78 and r4_78.Parent then
                r4_78:Destroy()
            end
        end
        r37_0 = {}
        return
    end
    local r1_78 = r0_0.LocalPlayer.Character
    if not r1_78 then
        return
    end
    local r2_78 = r1_78:FindFirstChild("HumanoidRootPart")
    if not r2_78 then
        return
    end
    local r3_78 = {}
    local r4_78 = false
    for r8_78, r9_78 in ipairs(r26_0) do
        if r9_78 == "All" then
            r4_78 = true
            break
        else
            r3_78[r9_78] = true
        end
    end
    local r5_78 = workspace:FindFirstChild("Living")
    if not r5_78 then
        return
    end
    local r6_78 = {}
    for r10_78, r11_78 in ipairs(r5_78:GetChildren()) do
        if r11_78:IsA("Model") and r11_78.Name ~= "Model" and not r76_0(r11_78) then
            local r12_78 = r11_78:FindFirstChild("HumanoidRootPart") or r11_78.PrimaryPart or
                               r11_78:FindFirstChildWhichIsA("BasePart", true)
            if r12_78 then
                local r13_78 = r70_0(r11_78.Name) or r11_78.Name
                if r4_78 or r3_78[r13_78] then
                    r6_78[r11_78] = {
                        rootPart = r12_78,
                        name = r13_78
                    }
                end
            end
        end
    end
    for r10_78, r11_78 in pairs(r37_0) do
        if not r6_78[r10_78] or not r10_78.Parent or r76_0(r10_78) then
            if r11_78 and r11_78.Parent then
                r11_78:Destroy()
            end
            r37_0[r10_78] = nil
        end
    end
    for r10_78, r11_78 in pairs(r6_78) do
        local r12_78 = r11_78.rootPart
        local r13_78 = r11_78.name
        local r14_78 = (r2_78.Position - r12_78.Position).Magnitude
        local r15_78 = r37_0[r10_78]
        if not r15_78 or not r15_78.Parent then
            r15_78 = r97_0(r12_78, r13_78, r14_78)
            r37_0[r10_78] = r15_78
        else
            if r15_78.Adornee ~= r12_78 then
                r15_78.Adornee = r12_78
            end
            local r16_78 = r15_78:FindFirstChild("ESPLabel")
            if r16_78 then
                r16_78.Text = r13_78 .. "\n" .. string.format("%.1f", r14_78) .. " studs"
            end
        end
    end
end
local function r100_0()
    if not r35_0 then
        return
    end
    local r0_7 = r0_0.LocalPlayer
    local r1_7 = r0_7.Character
    if not r1_7 then
        return
    end
    local r2_7 = r1_7:FindFirstChild("HumanoidRootPart")
    if not r2_7 then
        return
    end
    local r3_7 = {}
    for r7_7, r8_7 in ipairs(r0_0:GetPlayers()) do
        if r8_7 ~= r0_7 then
            local r9_7 = r8_7.Character
            local r10_7 = r9_7 and
                              (r9_7:FindFirstChild("HumanoidRootPart") or r9_7.PrimaryPart or
                                  r9_7:FindFirstChildWhichIsA("BasePart", true))
            if r10_7 and r9_7.Parent then
                r3_7[r8_7] = r10_7
            end
        end
    end
    for r7_7, r8_7 in pairs(r38_0) do
        if not r3_7[r7_7] or not r7_7.Character or not r3_7[r7_7].Parent then
            if r8_7 and r8_7.Parent then
                r8_7:Destroy()
            end
            r38_0[r7_7] = nil
        end
    end
    for r7_7, r8_7 in pairs(r3_7) do
        local r9_7 = (r2_7.Position - r8_7.Position).Magnitude
        local r10_7 = r38_0[r7_7]
        if not r10_7 or not r10_7.Parent then
            r10_7 = r97_0(r8_7, r7_7.Name, r9_7)
            r38_0[r7_7] = r10_7
        else
            if r10_7.Adornee ~= r8_7 then
                r10_7.Adornee = r8_7
            end
            local r11_7 = r10_7:FindFirstChild("ESPLabel")
            if r11_7 then
                r11_7.Text = r7_7.Name .. "\n" .. string.format("%.1f", r9_7) .. " studs"
            end
        end
    end
end
task.spawn(function()
    while task.wait(0.1) do
        local r0_98 = r33_0
        if r0_98 then
            r98_0()
        else
            r0_98 = pairs
            for r3_98, r4_98 in r0_98(r36_0) do
                if r4_98 and r4_98.Parent then
                    r4_98:Destroy()
                end
            end
            r0_98 = {}
            r36_0 = r0_98
        end
        r0_98 = r34_0
        if r0_98 then
            r99_0()
        else
            r0_98 = pairs
            for r3_98, r4_98 in r0_98(r37_0) do
                if r4_98 and r4_98.Parent then
                    r4_98:Destroy()
                end
            end
            r0_98 = {}
            r37_0 = r0_98
        end
        r0_98 = r35_0
        if r0_98 then
            r100_0()
        else
            r0_98 = pairs
            for r3_98, r4_98 in r0_98(r38_0) do
                if r4_98 and r4_98.Parent then
                    r4_98:Destroy()
                end
            end
            r0_98 = {}
            r38_0 = r0_98
        end
    end
end)
r56_0.SettingsMisc:Header({
    Name = "Misc"
})
r56_0.SettingsMisc:Toggle({
    Name = "Anti AFK",
    Default = r30_0,
    Callback = function(r0_11)
        r30_0 = r0_11
        r9_0.CurrentConfig.AntiAFKEnabled = r0_11
        r9_0.SaveConfig()
        local r1_11 = r12_0
        local r2_11 = "Anti AFK"
        local r3_11 = nil
        if r0_11 then
            r3_11 = "Enabled"
            if not r3_11 then
                r3_11 = "Disabled"
            end
        else
        end
        r1_11(r2_11, r3_11 .. " Anti AFK", 3)
    end
}, "AntiAFKToggle")
r56_0.SettingsMisc:Toggle({
    Name = "ESP Rock",
    Default = r33_0,
    Callback = function(r0_5)
        r33_0 = r0_5
        r9_0.CurrentConfig.ESPRockEnabled = r0_5
        r9_0.SaveConfig()
        local r1_5 = r12_0
        local r2_5 = "ESP Rock"
        local r3_5 = nil
        if r0_5 then
            r3_5 = "Enabled"
            if not r3_5 then
                r3_5 = "Disabled"
            end
        else
        end
        r1_5(r2_5, r3_5 .. " ESP Rock", 3)
        if not r0_5 then
            for r4_5, r5_5 in pairs(r36_0) do
                if r5_5 and r5_5.Parent then
                    r5_5:Destroy()
                end
            end
            r36_0 = {}
        end
    end
}, "ESPRockToggle")
r56_0.SettingsMisc:Toggle({
    Name = "ESP Enemy",
    Default = r34_0,
    Callback = function(r0_84)
        r34_0 = r0_84
        r9_0.CurrentConfig.ESPEnemyEnabled = r0_84
        r9_0.SaveConfig()
        local r1_84 = r12_0
        local r2_84 = "ESP Enemy"
        local r3_84 = nil
        if r0_84 then
            r3_84 = "Enabled"
            if not r3_84 then
                r3_84 = "Disabled"
            end
        else
        end
        r1_84(r2_84, r3_84 .. " ESP Enemy", 3)
        if not r0_84 then
            for r4_84, r5_84 in pairs(r37_0) do
                if r5_84 and r5_84.Parent then
                    r5_84:Destroy()
                end
            end
            r37_0 = {}
        end
    end
}, "ESPEnemyToggle")
r56_0.SettingsPlayer:Header({
    Name = "Player"
})
r56_0.SettingsPlayer:Toggle({
    Name = "ESP Player",
    Default = r35_0,
    Callback = function(r0_51)
        r35_0 = r0_51
        r9_0.CurrentConfig.ESPPlayerEnabled = r0_51
        r9_0.SaveConfig()
        local r1_51 = r12_0
        local r2_51 = "ESP Player"
        local r3_51 = nil
        if r0_51 then
            r3_51 = "Enabled"
            if not r3_51 then
                r3_51 = "Disabled"
            end
        else
        end
        r1_51(r2_51, r3_51 .. " ESP Player", 3)
        if not r0_51 then
            for r4_51, r5_51 in pairs(r38_0) do
                if r5_51 and r5_51.Parent then
                    r5_51:Destroy()
                end
            end
            r38_0 = {}
        end
    end
}, "ESPPlayerToggle")
local r101_0 = {
    UIBlurToggle = r11_0:GlobalSetting({
        Name = "UI Blur",
        Default = r11_0:GetAcrylicBlurState(),
        Callback = function(r0_8)
            r11_0:SetAcrylicBlurState(r0_8)
            local r1_8 = r12_0
            local r2_8 = r11_0.Settings.Title
            local r3_8 = nil
            if r0_8 then
                r3_8 = "Enabled"
                if not r3_8 then
                    r3_8 = "Disabled"
                end
            else
            end
            r1_8(r2_8, r3_8 .. " UI Blur", 4)
        end
    }),
    NotificationToggle = r11_0:GlobalSetting({
        Name = "Notifications",
        Default = r11_0:GetNotificationsState(),
        Callback = function(r0_79)
            r11_0:SetNotificationsState(r0_79)
            local r1_79 = r12_0
            local r2_79 = r11_0.Settings.Title
            local r3_79 = nil
            if r0_79 then
                r3_79 = "Enabled"
                if not r3_79 then
                    r3_79 = "Disabled"
                end
            else
            end
            r1_79(r2_79, r3_79 .. " Notifications", 4)
        end
    }),
    UserInfoToggle = r11_0:GlobalSetting({
        Name = "Show User Info",
        Default = r11_0:GetUserInfoState(),
        Callback = function(r0_69)
            r11_0:SetUserInfoState(r0_69)
            local r1_69 = r12_0
            local r2_69 = r11_0.Settings.Title
            local r3_69 = nil
            if r0_69 then
                r3_69 = "Showing"
                if not r3_69 then
                    r3_69 = "Redacted"
                end
            else
            end
            r1_69(r2_69, r3_69 .. " User Info", 4)
        end
    })
}
r14_0.Farm:Select()
r11_0.onUnloaded(function()
    r12_0("HT HUB | The Forge", "UI has been closed.", 3)
end)
r6_0:LoadAutoLoadConfig()
task.spawn(function()
    while task.wait(5) do
        pcall(r9_0.SaveConfig)
    end
end)
task.spawn(function()
    local r0_95 = game:GetService("VirtualUser")
    local r1_95 = r0_0.LocalPlayer
    while true do
        task.wait(120)
        if r30_0 then
            pcall(function()
                local r0_96 = workspace.CurrentCamera
                if r0_96 then
                    r0_95:Button2Down(Vector2.new(0, 0), r0_96.CFrame)
                    task.wait(1)
                    r0_95:Button2Up(Vector2.new(0, 0), r0_96.CFrame)
                end
                print("Anti-AFK running at:", os.time())
            end)
        end
    end
end)
task.spawn(function()
    local r0_31, r1_31 = pcall(function()
        if not getgenv().LoadedTheForgeMobileUI == true then
            getgenv().LoadedTheForgeMobileUI = true
            local r0_32 = Instance.new("ScreenGui")
            local r1_32 = Instance.new("ImageButton")
            local r2_32 = Instance.new("UICorner")
            if syn and syn.protect_gui then
                syn.protect_gui(r0_32)
                r0_32.Parent = game:GetService("CoreGui")
            elseif gethui then
                r0_32.Parent = gethui()
            else
                r0_32.Parent = game:GetService("CoreGui")
            end
            r0_32.Name = "TheForge_MobileUIButton"
            r0_32.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            r0_32.ResetOnSpawn = false
            r1_32.Parent = r0_32
            r1_32.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
            r1_32.BackgroundTransparency = 0.8
            r1_32.Position = UDim2.new(0.9, 0, 0.1, 0)
            r1_32.Size = UDim2.new(0, 50, 0, 50)
            r1_32.Image = "rbxassetid://90319448802378"
            r1_32.Draggable = true
            r1_32.Transparency = 0.2
            r2_32.CornerRadius = UDim.new(0, 200)
            r2_32.Parent = r1_32
            r1_32.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(r1_32, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.5,
                    Transparency = 0
                }):Play()
            end)
            r1_32.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(r1_32, TweenInfo.new(0.2), {
                    BackgroundTransparency = 0.8,
                    Transparency = 0.2
                }):Play()
            end)
            r1_32.MouseButton1Click:Connect(function()
                game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftAlt, false, game)
                task.wait(0.1)
                game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.LeftAlt, false, game)
            end)
        end
    end)
    if not r0_31 then
        warn("Error creating mobile UI button (HT HUB | The Forge): " .. tostring(r1_31))
    end
end)
r12_0("HT HUB | The Forge", "Script loaded successfully!\nPress Left Alt or mobile icon to hide/show UI", 5)
print("HTHubTheForge.lua loaded successfully!")
