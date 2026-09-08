local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/c8db6d194077f39a806c645243d359187b9b4370/source')))()
local Window = OrionLib:MakeWindow({Name = "ColdTeam X", HidePremium = false, SaveConfig = true, IntroEnabled = false})
print("work")

local Tib = Window:MakeTab({
    Name = "ColdTeam X stealling",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})


local noClipSpeed = 16
local noClipEnabled = false


local savedCFrame = nil


local speedBoostEnabled = false


local function TeleportUp()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local teleportHeight = 150
        local currentPosition = rootPart.CFrame.p
        local newPosition = Vector3.new(currentPosition.X, currentPosition.Y + teleportHeight, currentPosition.Z)
        local newCFrame = CFrame.new(newPosition) * CFrame.Angles(0, 0, 0)
        rootPart.CFrame = newCFrame
    end
end


local function TeleportDown()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local teleportHeight = -150
        local currentPosition = rootPart.CFrame.p
        local newPosition = Vector3.new(currentPosition.X, currentPosition.Y + teleportHeight, currentPosition.Z)
        local newCFrame = CFrame.new(newPosition) * CFrame.Angles(0, 0, 0)
        rootPart.CFrame = newCFrame
    end
end


local function ToggleNoClip()
    noClipEnabled = not noClipEnabled
    local character = game.Players.LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = noClipEnabled and 0 or 16
            humanoid.JumpPower = noClipEnabled and 0 or 50

            for _, part in pairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = not noClipEnabled
                end
            end
        end
    end
end

local function ToggleSpeedBoost()
    speedBoostEnabled = not speedBoostEnabled
    print("Speed Boost " .. (speedBoostEnabled and "Enabled" or "Disabled"))
end

local function SaveCFrame()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        savedCFrame = rootPart.CFrame
        print("CFrame saved!")
    else
        print("Character or HumanoidRootPart not found!")
    end
end

local function LoadCFrame()
    if savedCFrame then
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            rootPart.CFrame = savedCFrame
            print("CFrame loaded!")
        else
            print("Character or HumanoidRootPart not found!")
        end
    else
        print("No CFrame saved!")
    end
end


local function CreatePlatform()
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local platformSize = Vector3.new(4, 0.5, 4)
        local platformPosition = rootPart.Position - Vector3.new(0, 2, 0)
        local platform = Instance.new("Part")
        platform.Size = platformSize
        platform.CFrame = CFrame.new(platformPosition)
        platform.Anchored = true
        platform.CanCollide = true
        platform.Parent = workspace
        platform.Material = Enum.Material.Neon
        platform.Color = Color3.fromRGB(100, 149, 237)

        local tweenInfo = TweenInfo.new(
            2,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.Out,
            0,
            false,
            0
        )

        local tween = game:GetService("TweenService"):Create(platform, tweenInfo, {Transparency = 1})
        tween:Play()

        tween.Completed:Connect(function()
            platform:Destroy()
        end)

        delay(5, function()
            if platform and platform.Parent then
                platform:Destroy()
            end
        end)
    end
end


Tib:AddButton({
    Name = "Teleport Up (Keybind: T)",
    Callback = function()
        TeleportUp()
    end
})

Tib:AddButton({
    Name = "Teleport Down (Keybind: C)",
    Callback = function()
        TeleportDown()
    end
})

Tib:AddButton({
    Name = "Toggle NoClip (Keybind: N)",
    Callback = function()
        ToggleNoClip()
    end
})

Tib:AddButton({
    Name = "Save CFrame (Keybind: P)",
    Callback = function()
        SaveCFrame()
    end
})

Tib:AddButton({
    Name = "Load CFrame (Keybind: L)",
    Callback = function()
        LoadCFrame()
    end
})

Tib:AddButton({
    Name = "Create Platform (Keybind: E)",
    Callback = function()
        CreatePlatform()
    end
})

Tib:AddButton({
    Name = "Toggle Speed Boost (Keybind: B)",
    Callback = function()
        ToggleSpeedBoost()
    end
})

local UserInputService = game:GetService("UserInputService")

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end

    if input.KeyCode == Enum.KeyCode.T then
        TeleportUp()
    elseif input.KeyCode == Enum.KeyCode.C then
        TeleportDown()
    elseif input.KeyCode == Enum.KeyCode.L then
       LoadCFrame()
	elseif input.KeyCode == Enum.KeyCode.N then
        ToggleNoClip()
    elseif input.KeyCode == Enum.KeyCode.P then
        SaveCFrame()
    elseif input.KeyCode == Enum.KeyCode.B then
        ToggleSpeedBoost()
    elseif input.KeyCode == Enum.KeyCode.E then
        CreatePlatform()
    end
end)

game:GetService("RunService").RenderStepped:Connect(function(dt)
    local character = game.Players.LocalPlayer.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        local moveDirection = Vector3.new(0, 0, 0)

        if UserInputService:IsKeyDown(Enum.KeyCode.W) then
            moveDirection = moveDirection + rootPart.CFrame.LookVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.A) then
            moveDirection = moveDirection - rootPart.CFrame.RightVector
        elseif UserInputService:IsKeyDown(Enum.KeyCode.D) then
            moveDirection = moveDirection + rootPart.CFrame.RightVector
        end

        if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
            moveDirection = moveDirection + Vector3.new(0, 1, 0)
        elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
            moveDirection = moveDirection - Vector3.new(0, 1, 0)
        end

        if moveDirection.Magnitude > 0 then
            if noClipEnabled or speedBoostEnabled then
                moveDirection = moveDirection.Unit * noClipSpeed * dt
                rootPart.CFrame = rootPart.CFrame + moveDirection
            end
        end
    end
end)

OrionLib:Init()