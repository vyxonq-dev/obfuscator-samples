-- [[ 🛠️ UI CONFIGURATION ]]
local UI_Settings = {
    ButtonSize = UDim2.new(0, 55, 0, 55), 
    HoverSize = UDim2.new(0, 60, 0, 60), 
    
    ContainerAnchor = Vector2.new(1, 1),      
    ContainerPos = UDim2.new(1, -15, 1, -15), 
    ContainerSize = UDim2.new(0, 170, 0, 170),
    
    RunPos = UDim2.new(0.65, 0, 0, 0),     
    SJumpPos = UDim2.new(0.15, 0, 0.15, 0),
    DashPos = UDim2.new(0, 0, 0.65, 0)     
}

-- [[ CENTRAL SYSTEM - CONFIGURATION v6.4 (Veridian Real Custom API) ]]
local Settings = {
    Creator = "EllenGroqAI",
    Version = "6.4",
    
    WalkSpeed = 16,
    SprintSpeed = 28, 
    DashVelocity = 55,
    DashDuration = 0.8,
    JumpHeight = 50,
    JumpForwardPower = 150,
    
    SprintDrain = 10.0,
    NormalJumpCost = 25.0,
    
    StartDashCD = 15,
    StartJumpCD = 25,
    
    MaxStatLevel = 200,
    MaxSkillLevel = 15,
    
    UltDuration = 120,
    UltCooldown = 400,
    
    PointGainInterval = 60,
    PointsPerInterval = 10,
    
    SacrificeStaminaReq = 1500,
    SacrificePointsGain = 100
}

local DASH_SOUND = "rbxassetid://2428506580"
local JUMP_SOUND = "rbxassetid://12222200"
local ULT_SOUND = "rbxassetid://156747284"
local SACRIFICE_SOUND = "rbxassetid://156747284"

local player = game.Players.LocalPlayer
local uis = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local camera = workspace.CurrentCamera

local character, humanoid, hrp, loadedAnim
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://46196309"

local function playActionSound(id)
    pcall(function()
        if not hrp then return end
        local s = Instance.new("Sound")
        s.SoundId = id; s.Volume = 2; s.Parent = hrp; s:Play()
        game:GetService("Debris"):AddItem(s, 2)
    end)
end

local function setupCharacter(char)
    character = char
    humanoid = char:WaitForChild("Humanoid")
    hrp = char:WaitForChild("HumanoidRootPart")
    loadedAnim = humanoid:LoadAnimation(animation)
    loadedAnim.Looped = true
end

if player.Character then setupCharacter(player.Character) end
player.CharacterAdded:Connect(setupCharacter)

-- Dynamic States
local capLevel, regenLevel, dashSkillLevel, jumpSkillLevel = 1, 1, 1, 1
local upgradePoints = 0
local maxStamina, currentStamina = 500, 500
local sacrificeActive, isSprinting = false, false
local dashOnCooldown, jumpOnCooldown = false, false
local dashTimeLeft, jumpTimeLeft = 0, 0
local ultActive, ultOnCooldown = false, false
local ultCooldownLeft, ultDurationLeft = 0, 0

-- [[ 🐾 โหลด VERIDIAN LIBRARY (URL ใหม่ของมึง) ]]
local Success, VeridianLibrary = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/modcreate1641-collab/VeridianProject/refs/heads/main/veridianlib.lua"))()
end)

if not Success or type(VeridianLibrary) ~= "table" then 
    return warn("❌ เชี่ยยย! โหลด UI Library ไม่ขึ้น หรือลิงก์ตายวะเนี่ย ลองเช็คดูใหม่ไอ้สัส!") 
end

-- [[ 🪟 สร้าง Window หลัก ตามโครงสร้างของมึง ]]
local Window = VeridianLibrary:CreateWindow({  
    Name = "CENTRAL SYSTEM v6.4",  
    Logo = "https://raw.githubusercontent.com/modcreate1641-collab/Fluffy/refs/heads/main/1779757802572.png",  
    Discord = "https://discord.gg/WKWDuYMVRN"
})  

if not Window then return warn("❌ สร้าง Window ไม่สำเร็จ ไอ้ควายเอ๊ย!") end

local Logs = {}

-- [[ TAB 1: UPGRADE CENTER ]]
local TabUpgrade = Window:CreateTab("🔼 Upgrade")

TabUpgrade:CreateButton({
    Name = "Upgrade Capacity (Max 200)",
    Callback = function()
        if upgradePoints > 0 and capLevel < 200 then upgradePoints -= 1; capLevel += 1; maxStamina = 500 + ((capLevel - 1) * 50) end 
    end
})

TabUpgrade:CreateButton({
    Name = "Upgrade Regen (Max 200)",
    Callback = function()
        if upgradePoints > 0 and regenLevel < 200 then upgradePoints -= 1; regenLevel += 1 end 
    end
})

TabUpgrade:CreateButton({
    Name = "Dash Mastery (Max 15)",
    Callback = function()
        if upgradePoints > 0 and dashSkillLevel < 15 then upgradePoints -= 1; dashSkillLevel += 1 end 
    end
})

TabUpgrade:CreateButton({
    Name = "S-Jump Mastery (Max 15)",
    Callback = function()
        if upgradePoints > 0 and jumpSkillLevel < 15 then upgradePoints -= 1; jumpSkillLevel += 1 end 
    end
})

-- [[ TAB 2: GOD STATUS ]]
local TabStatus = Window:CreateTab("📊 Status")

-- แก้ไขตรงนี้: สั่งสร้าง Label แบบส่ง String ตรงๆ ตาม API ของมึง
Logs.Point = TabStatus:CreateLabel("Upgrade Points: 0")
Logs.Stam = TabStatus:CreateLabel("Stamina: 500 / 500")
Logs.Cap = TabStatus:CreateLabel("Capacity Level: 1/200")
Logs.Regen = TabStatus:CreateLabel("Regen Level: 1/200")
Logs.Dash = TabStatus:CreateLabel("Dash Level: 1/15")
Logs.Jump = TabStatus:CreateLabel("S-Jump Level: 1/15")

-- [[ TAB 3: SANCTUARY ]]
local TabSanctuary = Window:CreateTab("🔥 Sanctuary")

TabSanctuary:CreateButton({
    Name = "PERFORM SACRIFICE (+100 Pts)",
    Callback = function()
        if currentStamina >= Settings.SacrificeStaminaReq and not sacrificeActive then 
            currentStamina -= Settings.SacrificeStaminaReq; upgradePoints += Settings.SacrificePointsGain; sacrificeActive = true; playActionSound(SACRIFICE_SOUND)
            task.delay(10, function() sacrificeActive = false end) 
        end 
    end
})

Logs.Ult = TabSanctuary:CreateLabel("Ultimate: Locked")

TabSanctuary:CreateButton({
    Name = "ACTIVATE ULTIMATE (NO CD)",
    Callback = function()
        local isUnlocked = (dashSkillLevel >= 15 and jumpSkillLevel >= 15 and regenLevel >= 50 and capLevel >= 72)
        if isUnlocked and not ultOnCooldown and not ultActive then
            ultActive = true; ultDurationLeft = Settings.UltDuration; playActionSound(ULT_SOUND)
            task.spawn(function()
                while ultDurationLeft > 0 do ultDurationLeft -= 1; task.wait(1) end
                ultActive = false; ultOnCooldown = true; ultCooldownLeft = Settings.UltCooldown
                while ultCooldownLeft > 0 do ultCooldownLeft -= 1; task.wait(1) end
                ultOnCooldown = false
            end)
        end
    end
})

-- [[ SCREEN UI (ปุ่มกดหน้าจอสำหรับ Mobile/ความสวยงาม) ]]
local screenGui = Instance.new("ScreenGui", player.PlayerGui); screenGui.Name = "CentralVisuals"; screenGui.ResetOnSpawn = false

local staminaback = Instance.new("Frame", screenGui); staminaback.Size = UDim2.new(0, 250, 0, 15); staminaback.Position = UDim2.new(0.5, -125, 0.9, 0); staminaback.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Instance.new("UICorner", staminaback).CornerRadius = UDim.new(1, 0)
local staminaFill = Instance.new("Frame", staminaback); staminaFill.Size = UDim2.new(1, 0, 1, 0); staminaFill.BackgroundColor3 = Color3.fromRGB(0, 255, 128)
Instance.new("UICorner", staminaFill).CornerRadius = UDim.new(1, 0)
local UIStrokeStam = Instance.new("UIStroke", staminaback)
UIStrokeStam.Color = Color3.fromRGB(50, 50, 50); UIStrokeStam.Thickness = 2

local actionContainer = Instance.new("Frame", screenGui)
actionContainer.AnchorPoint = UI_Settings.ContainerAnchor
actionContainer.Position = UI_Settings.ContainerPos
actionContainer.Size = UI_Settings.ContainerSize
actionContainer.BackgroundTransparency = 1

local function createCircleBtn(parent, name, pos, color, keyHint)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UI_Settings.ButtonSize 
    btn.AnchorPoint = Vector2.new(0.5, 0.5) 
    btn.Position = pos; btn.Text = name .. "\n["..keyHint.."]"; btn.BackgroundColor3 = color
    btn.TextColor3 = Color3.new(1,1,1); btn.Font = Enum.Font.GothamBold; btn.TextSize = 10
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.new(1, 1, 1); stroke.Transparency = 0.5; stroke.Thickness = 1.5

    btn.MouseEnter:Connect(function() tweenService:Create(btn, TweenInfo.new(0.2), {Size = UI_Settings.HoverSize}):Play() end)
    btn.MouseLeave:Connect(function() tweenService:Create(btn, TweenInfo.new(0.2), {Size = UI_Settings.ButtonSize}):Play() end)
    
    return btn
end

local sprintBtn = createCircleBtn(actionContainer, "RUN", UI_Settings.RunPos, Color3.fromRGB(0, 120, 210), "Shift")
local jumpBtn = createCircleBtn(actionContainer, "S-JUMP", UI_Settings.SJumpPos, Color3.fromRGB(40,40,45), "E")
local dashBtn = createCircleBtn(actionContainer, "DASH", UI_Settings.DashPos, Color3.fromRGB(20,20,20), "Q")

-- [[ MOVEMENT LOGIC ]]
local function executeDash()
    if not ultActive and dashOnCooldown then return end
    local cost = 70 - ((dashSkillLevel - 1) * 2)
    if currentStamina >= cost then
        currentStamina -= cost; playActionSound(DASH_SOUND)
        if loadedAnim then loadedAnim:Play() end
        local bv = Instance.new("BodyVelocity", hrp); bv.MaxForce = Vector3.new(1e6, 1e6, 1e6) 
        local dashStartTime = tick()
        local steerConnection
        
        tweenService:Create(dashBtn, TweenInfo.new(0.1), {Size = UDim2.new(0, 45, 0, 45)}):Play()
        task.delay(0.1, function() tweenService:Create(dashBtn, TweenInfo.new(0.2), {Size = UI_Settings.ButtonSize}):Play() end)

        steerConnection = runService.RenderStepped:Connect(function()
            local elapsed = tick() - dashStartTime
            if elapsed >= Settings.DashDuration or not bv.Parent then
                steerConnection:Disconnect(); if loadedAnim then loadedAnim:Stop() end
                return
            end
            local faceDir = hrp.CFrame.LookVector * Vector3.new(1, 0, 1)
            bv.Velocity = faceDir.Unit * Settings.DashVelocity
        end)
        task.wait(Settings.DashDuration); if bv then bv:Destroy() end
        if not ultActive then
            dashOnCooldown = true; dashTimeLeft = Settings.StartDashCD - ((dashSkillLevel - 1) * 0.8)
            task.spawn(function()
                while dashTimeLeft > 0 do dashTimeLeft -= 0.1; dashBtn.Text = string.format("%.1f\n[Q]", dashTimeLeft); task.wait(0.1) end
                dashBtn.Text = "DASH\n[Q]"; dashOnCooldown = false
            end)
        end
    end
end

local function executeSuperJump()
    if not ultActive and jumpOnCooldown then return end
    local cost = 120 - ((jumpSkillLevel - 1) * 3)
    if currentStamina >= cost then
        currentStamina -= cost; playActionSound(JUMP_SOUND)
        hrp.AssemblyLinearVelocity = Vector3.new(0, Settings.JumpHeight, 0) + (hrp.CFrame.LookVector * Settings.JumpForwardPower)
        
        tweenService:Create(jumpBtn, TweenInfo.new(0.1), {Size = UDim2.new(0, 45, 0, 45)}):Play()
        task.delay(0.1, function() tweenService:Create(jumpBtn, TweenInfo.new(0.2), {Size = UI_Settings.ButtonSize}):Play() end)

        if not ultActive then
            jumpOnCooldown = true; jumpTimeLeft = Settings.StartJumpCD - ((jumpSkillLevel - 1) * 1.2)
            task.spawn(function()
                while jumpTimeLeft > 0 do jumpTimeLeft -= 0.1; jumpBtn.Text = string.format("%.1f\n[E]", jumpTimeLeft); task.wait(0.1) end
                jumpBtn.Text = "S-JUMP\n[E]"; jumpOnCooldown = false
            end)
        end
    end
end

local function handleSprint(state)
    isSprinting = state
    if state then
        sprintBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
        tweenService:Create(camera, TweenInfo.new(0.3), {FieldOfView = 90}):Play() 
    else
        sprintBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 210)
        tweenService:Create(camera, TweenInfo.new(0.3), {FieldOfView = 70}):Play() 
    end
end

-- [[ KEYBIND SYSTEM ]]
uis.InputBegan:Connect(function(input, gpe)
    if gpe then return end 
    if input.KeyCode == Enum.KeyCode.LeftShift then handleSprint(true) end
    if input.KeyCode == Enum.KeyCode.Q then executeDash() end
    if input.KeyCode == Enum.KeyCode.E then executeSuperJump() end
end)

uis.InputEnded:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.LeftShift then handleSprint(false) end
end)

dashBtn.MouseButton1Click:Connect(executeDash)
jumpBtn.MouseButton1Click:Connect(executeSuperJump)
sprintBtn.MouseButton1Down:Connect(function() handleSprint(true) end)
sprintBtn.MouseButton1Up:Connect(function() handleSprint(false) end)

uis.JumpRequest:Connect(function()
    if humanoid and humanoid.FloorMaterial ~= Enum.Material.Air then
        if currentStamina >= Settings.NormalJumpCost then
            currentStamina -= Settings.NormalJumpCost
        else
            humanoid.Jump = false
        end
    end
end)

-- [[ TICK LOOP (อัปเดตข้อมูลบนหน้าจอ) ]]
runService.Heartbeat:Connect(function(dt)
    if not humanoid then return end
    if isSprinting and humanoid.MoveDirection.Magnitude > 0 and currentStamina > 0 then
        humanoid.WalkSpeed = Settings.SprintSpeed
        currentStamina = math.max(0, currentStamina - (Settings.SprintDrain * dt))
    else
        humanoid.WalkSpeed = Settings.WalkSpeed
        if currentStamina < maxStamina and not sacrificeActive then
            local regenAmt = 5 + ((regenLevel - 1) * 2)
            currentStamina = math.min(maxStamina, currentStamina + (regenAmt * dt))
        end
    end
    
    staminaFill.Size = UDim2.new(math.clamp(currentStamina/maxStamina, 0, 1), 0, 1, 0)
    
    -- อัปเดตข้อความ Label ในแท็บ Status โดยใช้ฟังก์ชัน :Set()
    if Logs.Point then
        Logs.Point:Set("Upgrade Points: " .. math.floor(upgradePoints))
        Logs.Stam:Set(string.format("Stamina: %d / %d", currentStamina, maxStamina))
        Logs.Cap:Set("Capacity Level: " .. capLevel .. "/200")
        Logs.Regen:Set("Regen Level: " .. regenLevel .. "/200")
        Logs.Dash:Set("Dash Level: " .. dashSkillLevel .. "/15")
        Logs.Jump:Set("S-Jump Level: " .. jumpSkillLevel .. "/15")
        
        local isUnlocked = (dashSkillLevel >= 15 and jumpSkillLevel >= 15 and regenLevel >= 50 and capLevel >= 72)
        if ultActive then Logs.Ult:Set("ULT ACTIVE: " .. math.ceil(ultDurationLeft) .. "s")
        elseif ultOnCooldown then Logs.Ult:Set("ULT CD: " .. math.ceil(ultCooldownLeft) .. "s")
        elseif isUnlocked then Logs.Ult:Set("Ultimate: READY")
        else Logs.Ult:Set("Ultimate: LOCKED (Need max skills)") end
    end
end)

task.spawn(function() while true do task.wait(Settings.PointGainInterval); upgradePoints += Settings.PointsPerInterval end end)
