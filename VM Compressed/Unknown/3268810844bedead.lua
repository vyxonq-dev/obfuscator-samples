-- Auto Block Rayfield Script (Full Features)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local PlayerGui = lp:WaitForChild("PlayerGui")
local Humanoid, Animator

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
local Window = Rayfield:CreateWindow({
Name = "Auto Block Hub",
LoadingTitle = "Auto Block Script",
LoadingSubtitle = "by Skibidi Shots",
ConfigurationSaving = {
Enabled = true,
FolderName = "AutoBlockHub",
FileName = "Settings"
},
Discord = {Enabled = false},
KeySystem = false
})

local AutoBlockTab = Window:CreateTab("Auto Block", 4483362458)
local PredictiveTab = Window:CreateTab("Predictive Auto Block", 4483362458)
local FakeBlockTab = Window:CreateTab("Fake Block", 4483362458)
local AutoPunchTab = Window:CreateTab("Auto Punch", 4483362458)
local CustomAnimationsTab = Window:CreateTab("Custom Animations", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)



-- Anim Ids
local autoBlockTriggerAnims = {
    "126830014841198", "126355327951215", "121086746534252", "18885909645",
    "98456918873918", "105458270463374", "83829782357897", "125403313786645",
    "118298475669935", "82113744478546", "70371667919898", "99135633258223",
    "97167027849946", "109230267448394", "139835501033932", "126896426760253",
    "109667959938617", "126681776859538", "129976080405072", "121293883585738",
    "81639435858902", "137314737492715",
    "92173139187970"
}

-- State Variables
local autoBlockOn = false
local strictRangeOn = false
local looseFacing = true
local detectionRange = 18

local predictiveBlockOn = false
local detectionRange = 10
local edgeKillerDelay = 3
local killerInRangeSince = nil
local predictiveCooldown = 0

local autoPunchOn = false
local flingPunchOn = false
local flingPower = 10000
local hiddenfling = false
local aimPunch = false

local customBlockEnabled = false
local customBlockAnimId = ""
local customPunchEnabled = false
local customPunchAnimId = ""

local infiniteStamina = false

local lastBlockTime = 0
local lastPunchTime = 0
local lastBlockTpTime = 0

local blockAnimIds = {
"72722244508749",
"96959123077498"
}
local punchAnimIds = {
"87259391926321"
}

local customChargeEnabled = false
local customChargeAnimId = ""
local chargeAnimIds = { "106014898528300" }

-- Infinite Stamina
local function enableInfiniteStamina()
    local success, StaminaModule = pcall(function()
        return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
    end)
    if not success or not StaminaModule then return end

    StaminaModule.StaminaLossDisabled = true

    task.spawn(function()
        while infiniteStamina and StaminaModule do
            task.wait(0.1)
            StaminaModule.Stamina = StaminaModule.MaxStamina
            StaminaModule.StaminaChanged:Fire()
        end
    end)
end


-- GUI Toggles
AutoBlockTab:CreateToggle({
Name = "Auto Block",
CurrentValue = false,
Callback = function(Value) autoBlockOn = Value end
})

AutoBlockTab:CreateToggle({
Name = "Strict Range",
CurrentValue = false,
Callback = function(Value) strictRangeOn = Value end
})

local facingCheckEnabled = true

AutoBlockTab:CreateToggle({
    Name = "Enable Facing Check",
    CurrentValue = true,
    Callback = function(Value)
        facingCheckEnabled = Value
    end
})

AutoBlockTab:CreateDropdown({
Name = "Facing Check",
Options = {"Loose", "Strict"},
CurrentOption = "Loose",
Callback = function(Option) looseFacing = Option == "Loose" end
})

AutoBlockTab:CreateInput({
Name = "Detection Range",
PlaceholderText = "18",
RemoveTextAfterFocusLost = false,
Callback = function(Text)
detectionRange = tonumber(Text) or detectionRange
end
})

AutoBlockTab:CreateParagraph({
    Title = "⚠️ Warning",
    Content = "DONT USE FAKE BLOCK WHILE USING BLOCK TP"
})

AutoBlockTab:CreateParagraph({
    Title = "",
    Content = "INCREASE RANGE WHEN UR USING BLOCK TP TOO, ATLEAST LIKE 30 OR SMTH"
})

local blockTPEnabled = false

AutoBlockTab:CreateToggle({
    Name = "Block TP",
    CurrentValue = false,
    Callback = function(Value)
        blockTPEnabled = Value
    end
})


PredictiveTab:CreateToggle({
    Name = "Predictive Auto Block",
    CurrentValue = false,
    Callback = function(Value)
        predictiveBlockOn = Value
    end,
})

PredictiveTab:CreateInput({
    Name = "Detection Range",
    PlaceholderText = "10",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local num = tonumber(text)
        if num then
            detectionRange = num
        end
    end,
})


PredictiveTab:CreateSlider({
    Name = "Edge Killer",
    Range = {0, 7},
    Increment = 0.1,
    CurrentValue = 3,
    Callback = function(val)
        edgeKillerDelay = val
    end,
})

PredictiveTab:CreateParagraph({
    Title = "Edge Killer",
    Content = "how many secs until it blocks (resets when killer gets out of range)"
})

FakeBlockTab:CreateButton({
    Name = "Load Fake Block",
    Callback = function()
        pcall(function()
            local fakeGui = PlayerGui:FindFirstChild("FakeBlockGui")
            if not fakeGui then
                local success, result = pcall(function()
                    return loadstring(game:HttpGet("https://pastebin.com/raw/ztnYv27k"))()
                end)
                if not success then
                    warn("❌ Failed to load Fake Block GUI:", result)
                end
            else
                fakeGui.Enabled = true
                print("✅ Fake Block GUI enabled")
            end
        end)
    end
})

AutoPunchTab:CreateToggle({
Name = "Auto Punch",
CurrentValue = false,
Callback = function(Value) autoPunchOn = Value end
})

AutoPunchTab:CreateToggle({
Name = "Fling Punch",
CurrentValue = false,
Callback = function(Value) flingPunchOn = Value end
})

AutoPunchTab:CreateToggle({
Name = "Punch Aimbot",
CurrentValue = false,
Callback = function(Value) aimPunch = Value end
})

local predictionValue = 4

AutoPunchTab:CreateSlider({
    Name = "Aim Prediction",
    Range = {0, 10},
    Increment = 0.1,
    Suffix = "studs",
    CurrentValue = predictionValue,
    Flag = "PredictionSlider",
    Callback = function(Value)
        predictionValue = Value
    end,
})

AutoPunchTab:CreateSlider({
Name = "Fling Power",
Range = {5000, 50000000000000},
Increment = 1000000,
CurrentValue = 10000,
Callback = function(Value) flingPower = Value end
})

CustomAnimationsTab:CreateInput({
Name = "Custom Block Animation",
PlaceholderText = "AnimationId",
RemoveTextAfterFocusLost = false,
Callback = function(Text) customBlockAnimId = Text end
})

CustomAnimationsTab:CreateToggle({
Name = "Enable Custom Block Animation",
CurrentValue = false,
Callback = function(Value) customBlockEnabled = Value end
})

CustomAnimationsTab:CreateInput({
Name = "Custom Punch Animation (not for M3/M4)",
PlaceholderText = "AnimationId",
RemoveTextAfterFocusLost = false,
Callback = function(Text) customPunchAnimId = Text end
})

CustomAnimationsTab:CreateToggle({
Name = "Enable Custom Punch Animation",
CurrentValue = false,
Callback = function(Value) customPunchEnabled = Value end
})

CustomAnimationsTab:CreateInput({
    Name = "Charge Animation ID",
    PlaceholderText = "Put animation ID here",
    RemoveTextAfterFocusLost = false,
    Callback = function(input)
        customChargeAnimId = input
    end,
})

CustomAnimationsTab:CreateToggle({
    Name = "Custom Charge Animation",
    CurrentValue = false,
    Callback = function(value)
        customChargeEnabled = value
    end,
})

-- Button to run Infinite Yield
MiscTab:CreateButton({
    Name = "Run Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})

-- Message below the button
MiscTab:CreateParagraph({
    Title = "Tip",
    Content = 'Run Infinite Yield and type "antifling" so punch fling works better.'
})

MiscTab:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Callback = function(value)
        infiniteStamina = value
        if infiniteStamina then
            enableInfiniteStamina()
        else
            local success, StaminaModule = pcall(function()
                return require(game.ReplicatedStorage.Systems.Character.Game.Sprinting)
            end)
            if success and StaminaModule then
                StaminaModule.StaminaLossDisabled = false
            end
        end
    end
})

-- Helpers
local function fireRemoteBlock()
local args = {"UseActorAbility", "Block"}
ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Network"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
end

local function isFacing(localRoot, targetRoot)
    if not facingCheckEnabled then
        return true
    end

    local dir = (localRoot.Position - targetRoot.Position).Unit
    local dot = targetRoot.CFrame.LookVector:Dot(dir)
    return looseFacing and dot > -0.3 or dot > 0
end

local function playCustomAnim(animId, isPunch)
    if not Humanoid then
        warn("Humanoid missing")
        return
    end

    if not animId or animId == "" then
        warn("No animation ID provided")
        return
    end

    local now = tick()
    local lastTime = isPunch and lastPunchTime or lastBlockTime
    if now - lastTime < 1 then
        return
    end

    -- Stop other known anims
    for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
        local animNum = tostring(track.Animation.AnimationId):match("%d+")
        if table.find(isPunch and punchAnimIds or blockAnimIds, animNum) then
            track:Stop()
        end
    end

    -- Create and load the animation
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. animId

    local success, track = pcall(function()
        return Humanoid:LoadAnimation(anim)
    end)

    if success and track then
        print("✅ Playing custom " .. (isPunch and "punch" or "block") .. " animation:", animId)
        track:Play()
        if isPunch then
            lastPunchTime = now
        else
            lastBlockTime = now
        end
    else
        warn("❌ Failed to load or play custom animation: " .. animId)
    end
end

-- Fling coroutine
coroutine.wrap(function()
    local hrp, c, vel, movel = nil, nil, nil, 0.1
    while true do
        RunService.Heartbeat:Wait()
        if hiddenfling then
            while hiddenfling and not (c and c.Parent and hrp and hrp.Parent) do
                RunService.Heartbeat:Wait()
                c = lp.Character
                hrp = c and c:FindFirstChild("HumanoidRootPart")
            end
            if hiddenfling then
                vel = hrp.Velocity
                hrp.Velocity = vel * flingPower + Vector3.new(0, flingPower, 0)
                RunService.RenderStepped:Wait()
                hrp.Velocity = vel
                RunService.Stepped:Wait()
                hrp.Velocity = vel + Vector3.new(0, movel, 0)
                movel = movel * -1
            end
        end
    end
end)()

-- Auto block + punch detection loop
RunService.RenderStepped:Connect(function()
    local myChar = lp.Character
    if not myChar then return end
    local myRoot = myChar:FindFirstChild("HumanoidRootPart")
    Humanoid = myChar:FindFirstChildOfClass("Humanoid")
        -- Auto Block: Trigger block if a valid animation is played by a killer
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= lp and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            local animTracks = hum and hum:FindFirstChildOfClass("Animator") and hum:FindFirstChildOfClass("Animator"):GetPlayingAnimationTracks()

            if hrp and myRoot and (hrp.Position - myRoot.Position).Magnitude <= detectionRange then
                for _, track in ipairs(animTracks or {}) do
                    local id = tostring(track.Animation.AnimationId):match("%d+")
                    if table.find(autoBlockTriggerAnims, id) then
                        if autoBlockOn and (not strictRangeOn or (hrp.Position - myRoot.Position).Magnitude <= detectionRange) then
                            if isFacing(myRoot, hrp) then
                                fireRemoteBlock()
                                if customBlockEnabled and customBlockAnimId ~= "" then
                                    playCustomAnim(customBlockAnimId, false)
                                end
                            end
                        end
                    end
                end
            end
        end
    end

    -- Detect if player is playing a block animation, and blockTP is enabled
    if blockTPEnabled and Humanoid and tick() - lastBlockTpTime >= 5 then
        for _, track in ipairs(Humanoid:GetPlayingAnimationTracks()) do
            local animId = tostring(track.Animation.AnimationId):match("%d+")
            if animId == "72722244508749" or animId == "96959123077498" then
                local myRoot = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                if myRoot then
                    local killers = {"c00lkidd", "Jason", "JohnDoe", "1x1x1x1", "Noli"}
                    for _, name in ipairs(killers) do
                        local killer = workspace:FindFirstChild("Players")
                            and workspace.Players:FindFirstChild("Killers")
                            and workspace.Players.Killers:FindFirstChild(name)

                        if killer and killer:FindFirstChild("HumanoidRootPart") then
                            lastBlockTpTime = tick()

                            task.spawn(function()
                                local startTime = tick()
                                while tick() - startTime < 0.5 do
                                    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                                        local myRoot = lp.Character.HumanoidRootPart
                                        local targetHRP = killer.HumanoidRootPart
                                        local direction = targetHRP.CFrame.LookVector
                                        local tpPosition = targetHRP.Position + direction * 6
                                        myRoot.CFrame = CFrame.new(tpPosition)
                                    end
                                    task.wait()
                                end
                            end)

                            break
                        end
                    end
                end
                break
            end
        end
    end

    -- Predictive Auto Block: Check killer range and time
    if predictiveBlockOn and tick() > predictiveCooldown then
        local killersFolder = workspace:FindFirstChild("Players") and workspace.Players:FindFirstChild("Killers")
        local myChar = lp.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local myHum = myChar and myChar:FindFirstChild("Humanoid")

        if killersFolder and myHRP and myHum then
            local killerInRange = false

            for _, killer in ipairs(killersFolder:GetChildren()) do
                local hrp = killer:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local dist = (myHRP.Position - hrp.Position).Magnitude
                    if dist <= detectionRange then
                        killerInRange = true
                        break
                    end
                end
            end

            -- Handle killer entering range
            if killerInRange then
                if not killerInRangeSince then
                    killerInRangeSince = tick()  -- Start the timer when the killer enters the range
                elseif tick() - killerInRangeSince >= edgeKillerDelay then
                    -- Block if the killer has stayed in range long enough
                    fireRemoteBlock()
                    predictiveCooldown = tick() + 2  -- Set cooldown to avoid blocking too quickly again
                    killerInRangeSince = nil  -- Reset the timer
                end
            else
                killerInRangeSince = nil  -- Reset timer if the killer leaves range
            end
        end
    end



    -- Auto Punch
    if autoPunchOn then
        local gui = PlayerGui:FindFirstChild("MainUI")
        local punchBtn = gui and gui:FindFirstChild("AbilityContainer") and gui.AbilityContainer:FindFirstChild("Punch")
        local charges = punchBtn and punchBtn:FindFirstChild("Charges")

        if charges and charges.Text == "1" then
            local killerNames = {"c00lkidd", "Jason", "JohnDoe", "1x1x1x1", "Noli"}
            for _, name in ipairs(killerNames) do
                local killer = workspace:FindFirstChild("Players")
                    and workspace.Players:FindFirstChild("Killers")
                    and workspace.Players.Killers:FindFirstChild(name)

                if killer and killer:FindFirstChild("HumanoidRootPart") then
                    local root = killer.HumanoidRootPart
                    local myChar = lp.Character
                    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                    if root and myRoot and (root.Position - myRoot.Position).Magnitude <= 10 then

                        -- Aim Punch: Constant look at killer with prediction
                        if aimPunch then
                            local humanoid = myChar:FindFirstChild("Humanoid")
                            if humanoid then
                                humanoid.AutoRotate = false
                            end

                            task.spawn(function()
                                local start = tick()
                                while tick() - start < 2 do
                                    if myRoot and root and root.Parent then
                                        local predictedPos = root.Position + (root.CFrame.LookVector * predictionValue)
                                        myRoot.CFrame = CFrame.lookAt(myRoot.Position, predictedPos)
                                    end
                                    task.wait()
                                end
                                -- Reset movement after aim
                                if humanoid then
                                    humanoid.AutoRotate = true
                                end
                            end)
                        end

                        -- Trigger punch GUI button
                        for _, conn in ipairs(getconnections(punchBtn.MouseButton1Click)) do
                            pcall(function()
                                conn:Fire()
                            end)
                        end

                        -- Fling Punch: Constant TP 2 studs in front of killer for 1 second
                        if flingPunchOn then
                            hiddenfling = true
                            local targetHRP = root
                            task.spawn(function()
                                local start = tick()
                                while tick() - start < 1 do
                                    if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") and targetHRP and targetHRP.Parent then
                                        local frontPos = targetHRP.Position + (targetHRP.CFrame.LookVector * 2)
                                        lp.Character.HumanoidRootPart.CFrame = CFrame.new(frontPos, targetHRP.Position)
                                    end
                                    task.wait()
                                end
                                hiddenfling = false
                            end)
                        end

                        -- Play custom punch animation if enabled
                        if customPunchEnabled and customPunchAnimId ~= "" then
                            playCustomAnim(customPunchAnimId, true)
                        end

                        break -- Only punch one killer per frame
                    end
                end
            end
        end
    end

end)

-- Cooldown tracking for each replacement type
local lastReplaceTime = {
    block = 0,
    punch = 0,
    charge = 0,
}

-- Continuous custom animation replacer (runs forever if toggled on)
task.spawn(function()
    while true do
        RunService.Heartbeat:Wait()

        local char = lp.Character
        if not char then continue end

        local humanoid = char:FindFirstChildOfClass("Humanoid")
        local animator = humanoid and humanoid:FindFirstChildOfClass("Animator")
        if not animator then continue end

        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            local animId = tostring(track.Animation.AnimationId):match("%d+")

            -- Block animation replacement
            if customBlockEnabled and customBlockAnimId ~= "" and table.find(blockAnimIds, animId) then
                if tick() - lastReplaceTime.block >= 3 then
                    lastReplaceTime.block = tick()
                    track:Stop()
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://" .. customBlockAnimId
                    local newTrack = animator:LoadAnimation(newAnim)
                    newTrack:Play()
                    break
                end
            end

            -- Punch animation replacement
            if customPunchEnabled and customPunchAnimId ~= "" and table.find(punchAnimIds, animId) then
                if tick() - lastReplaceTime.punch >= 3 then
                    lastReplaceTime.punch = tick()
                    track:Stop()
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://" .. customPunchAnimId
                    local newTrack = animator:LoadAnimation(newAnim)
                    newTrack:Play()
                    break
                end
            end

            -- Charge animation replacement
            if customChargeEnabled and customChargeAnimId ~= "" and table.find(chargeAnimIds, animId) then
                if tick() - lastReplaceTime.charge >= 3 then
                    lastReplaceTime.charge = tick()
                    track:Stop()
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://" .. customChargeAnimId
                    local newTrack = animator:LoadAnimation(newAnim)
                    newTrack:Play()
                    break
                end
            end
        end
    end
end)

-- Readd infinite stamina
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    if infiniteStamina then
        enableInfiniteStamina()
    end
end)
