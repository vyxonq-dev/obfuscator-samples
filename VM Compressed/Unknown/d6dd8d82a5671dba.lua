-- hi but coolest
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetNotificationLower(true)

WindUI:AddTheme({
    Name = "Midnight",
    Accent = WindUI:Gradient({
        ["0"] = { Color = Color3.fromHex("#2e004f"), Transparency = 0.2 },
        ["100"] = { Color = Color3.fromHex("#8d09b5"), Transparency = 0.2 },
    }, { Rotation = 45 }),
    Accent = "#a855f7",
    Dialog = "#2E004F",
    Outline = "#6b21a8",
    Text = "#f3e8ff",
    Placeholder = "#d8b4fe",
    Background = "#2e004f",
    Button = "#9333ea",
    Icon = "#e9d5ff",
})

local Window = WindUI:CreateWindow({
    Title = "Midnight - Survive Lebron 2",
    Icon = "moon", -- lucide icon
    Author = "Yeahblxr",
    Folder = "Midnight survive bron",
    
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Midnight",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = true,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
})

local Tab = Window:Tab({
    Title = "Main",
    Icon = "house",
    Locked = false,
})


--------------------------------------------------------------------
--                 Teleport to Lever
--------------------------------------------------------------------

local function getLeverNames()
    local names = {}
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name:match("^Lever_%d+$") then
            table.insert(names, v.Name)
        end
    end
    table.sort(names, function(a, b)
        return tonumber(a:match("%d+")) < tonumber(b:match("%d+"))
    end)
    return names
end
local leverNames = getLeverNames()
local function getModelCFrame(model)
    if not model:IsA("Model") then return end
    local primary = model.PrimaryPart
    if primary then
        return primary.CFrame
    else
        for _, p in ipairs(model:GetDescendants()) do
            if p:IsA("BasePart") then
                return p.CFrame
            end
        end
    end
end


local Dropdown = Tab:Dropdown({
    Title = "Teleport to Lever",
    Values = #leverNames > 0 and leverNames or {"No levers found"},
    Value = leverNames[1] or "None",
    Callback = function(selected)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then
            warn("No HumanoidRootPart found!")
            return
        end

        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("Model") and v.Name == selected then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid and humanoid.SeatPart then
                    humanoid.Sit = false
                    task.wait(0.1)
                end

                local targetCFrame = getModelCFrame(v)
                if targetCFrame then
                    root.CFrame = targetCFrame + Vector3.new(0, 7, 0)
                    print("Teleported to " .. selected)
                else
                    warn("Failed to find a CFrame for " .. selected)
                end
                return
            end
        end

        warn("Could not find model: " .. selected)
    end
})

-------------------------------
--  Refresh Levers
-------------------------------
local RefreshButton = Tab:Button({
    Title = "Refresh Levers",
    Desc = "Updates the lever list in the dropdown",
    Locked = false,
    Callback = function()
        leverNames = getLeverNames()
        Dropdown:Refresh(leverNames)
        WindUI:Notify({
    Title = "Refreshed",
    Content = "Lever list refreshed",
    Duration = 3,
    Icon = "refresh-cw",
})
    end
})

Tab:Divider()
--------------------------------------------------------------------
--                 Teleport to MasterLever
--------------------------------------------------------------------

local Button = Tab:Button({
    Title = "Teleport to Master Lever",
    Desc = "Instantly teleports you to the MasterLever model",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then return warn("No HumanoidRootPart found!") end

        local target = workspace:FindFirstChild("MasterLever", true)
        if not target or not target:IsA("Model") then
            return warn("MasterLever model not found!")
        end

        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid and humanoid.SeatPart then
            humanoid.Sit = false
            task.wait(0.1)
        end

        local targetCFrame = getModelCFrame(target)
        if targetCFrame then
            root.CFrame = targetCFrame + Vector3.new(0, 3, 0)
            print("Teleported to MasterLever")
        else
            warn("Failed to find a valid CFrame for MasterLever")
        end
    end
})

--------------------------------------------------------------------
--                 Instant proximity prompt
--------------------------------------------------------------------

local Button = Tab:Button({
    Title = "Instant Proximity Prompt",
    Desc = "Disable the cooldown for proximity prompts",
    Locked = false,
    Callback = function()
        local function SetupProximityPrompt(prompt)
    prompt.HoldDuration = 0
end

workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ProximityPrompt") then
        SetupProximityPrompt(descendant)
    end
end)

for _, prompt in ipairs(workspace:GetDescendants()) do
    if prompt:IsA("ProximityPrompt") then
        SetupProximityPrompt(prompt)
    end
end
    end
})

--------------------------------------------------------------------
--                 Teleport to spawn
--------------------------------------------------------------------
local Button = Tab:Button({
    Title = "Teleport to Spawn",
    Desc = "Teleports to Back to lobby area",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local root = character:FindFirstChild("HumanoidRootPart")
        if not root then
            warn("No HumanoidRootPart found!")
            return
        end

        root.CFrame = CFrame.new(27, 95, 28)
        print("Teleported to (27, 95, 28)")
    end
})

--------------------------------------------------------------------
--                 Cframe flyd
--------------------------------------------------------------------

local RunService = game:GetService("RunService")
local CFspeed = 50
local CFloop

local Toggle = Tab:Toggle({
    Title = "Fly",
    Desc = "Toggle fly on or off",
    Icon = "wind",
    Type = "Checkbox",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        if not player.Character then return warn("No character found!") end
        local char = player.Character
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local Head = char:WaitForChild("Head")

        if state then
            humanoid.PlatformStand = true
            Head.Anchored = true
            if CFloop then CFloop:Disconnect() end

            CFloop = RunService.Heartbeat:Connect(function(deltaTime)
                local moveDirection = humanoid.MoveDirection * (CFspeed * deltaTime)
                local headCFrame = Head.CFrame
                local camera = workspace.CurrentCamera
                local cameraCFrame = camera.CFrame
                local cameraOffset = headCFrame:ToObjectSpace(cameraCFrame).Position
                cameraCFrame = cameraCFrame * CFrame.new(-cameraOffset.X, -cameraOffset.Y, -cameraOffset.Z + 1)
                local cameraPosition = cameraCFrame.Position
                local headPosition = headCFrame.Position

                local objectSpaceVelocity = CFrame.new(cameraPosition, Vector3.new(headPosition.X, cameraPosition.Y, headPosition.Z)):VectorToObjectSpace(moveDirection)
                Head.CFrame = CFrame.new(headPosition) * (cameraCFrame - cameraPosition) * CFrame.new(objectSpaceVelocity)
            end)
            print("CFrame Fly Enabled")
        else
            if CFloop then CFloop:Disconnect() end
            humanoid.PlatformStand = false
            Head.Anchored = false
            print("CFrame Fly Disabled")
        end
    end
})

Tab:Divider()

--------------------------------------------------------------------
--                 Fullbright
--------------------------------------------------------------------
local Button = Tab:Button({
    Title = "Fullbright",
    Desc = "Lets you see in the dark.",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yeahblxr/Scripts/refs/heads/main/Fullbright.lua"))()
    end
})

--------------------------------------------------------------------
--                 No Fog
--------------------------------------------------------------------
local Button = Tab:Button({
    Title = "Remove fog",
    Desc = "Removes the fog.",
    Locked = false,
    Callback = function()
         local function removeFog()
    local lighting = game:GetService("Lighting")
    lighting.FogEnd = 1e10
    lighting.FogStart = 1e10
    lighting.FogColor = Color3.new(1, 1, 1)
end



removeFog()

game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(removeFog)
game:GetService("Lighting"):GetPropertyChangedSignal("FogStart"):Connect(removeFog)
game:GetService("Lighting"):GetPropertyChangedSignal("FogColor"):Connect(removeFog)

game:GetService("Lighting").Changed:Connect(removeFog)
    end
})
