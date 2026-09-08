--[[
	Scripts of wearedevs.net

    All scripts from Here:
    https://wearedevs.net/scripts/filter?tags=featured
]]

-- Load the external UI library from GitHub
local Library = loadstring(
    Game:HttpGet(
        'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/LibWareUISource'
    )
)()

-- Create the main window for the UI
local MainWindow = Library:NewWindow('WRD Scripts')

-- Create a new section/tab in the main window
local PlayerTab = MainWindow:NewSection('Player')
local ESPTab = MainWindow:NewSection('ESP')
local ExtraTab = MainWindow:NewSection('Extra')

------------------------------------------------
-- Noclip Toggle
------------------------------------------------
local walkThroughWallsEnabled = false
local hrpConnection
local touchedParts = {} -- keep track of parts touched

PlayerTab:CreateToggle('Noclip', function(state)
    walkThroughWallsEnabled = state

    -- Disconnect previous HRP event if exists
    if hrpConnection then
        hrpConnection:Disconnect()
        hrpConnection = nil
    end

    local Players = game:GetService('Players')
    local LocalPlayer = Players.LocalPlayer

    -- Restore all touched parts if toggle is off
    if not walkThroughWallsEnabled then
        for part, originalCanCollide in pairs(touchedParts) do
            if part and part.Parent then
                part.CanCollide = originalCanCollide
            end
        end
        touchedParts = {}

        game.StarterGui:SetCore('SendNotification', {
            Title = 'WRD UI',
            Text = '❌ Noclip Disabled',
            Duration = 2,
        })
        return
    else
        game.StarterGui:SetCore('SendNotification', {
            Title = 'WRD UI',
            Text = '✅ Noclip Enabled',
            Duration = 2,
        })
    end

    local function onTouched(part)
        if not walkThroughWallsEnabled then
            return
        end
        if not part:IsA('BasePart') then
            return
        end
        if not part.Anchored then
            return
        end
        if not part.CanCollide then
            return
        end

        local character = LocalPlayer.Character
        if not character then
            return
        end

        local hrp = character:FindFirstChild('HumanoidRootPart')
        if not hrp then
            return
        end

        -- Prevent disabling floors below player
        if part.Position.Y < (hrp.Position.Y - hrp.Size.Y) then
            return
        end

        -- Save original CanCollide before disabling
        touchedParts[part] = part.CanCollide
        part.CanCollide = false
    end

    local function setup()
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = char:WaitForChild('HumanoidRootPart')
        hrpConnection = hrp.Touched:Connect(onTouched)
    end

    if LocalPlayer.Character then
        setup()
    end

    LocalPlayer.CharacterAdded:Connect(setup)
end)

------------------------------------------------
-- Infinite Jump Toggle
------------------------------------------------
local infiniteJumpEnabled = false
local UserInputService = game:GetService('UserInputService')
local Players = game:GetService('Players')
local LocalPlayer = Players.LocalPlayer

PlayerTab:CreateToggle('Infinite Jump', function(state)
    infiniteJumpEnabled = state

    if infiniteJumpEnabled then
        game.StarterGui:SetCore('SendNotification', {
            Title = 'WRD UI',
            Text = '✅ Infinite Jump Enabled',
            Duration = 2,
        })
    else
        game.StarterGui:SetCore('SendNotification', {
            Title = 'WRD UI',
            Text = '❌ Infinite Jump Disabled',
            Duration = 2,
        })
    end
end)

-- Listen for spacebar press
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then
        return
    end
    if
        input.UserInputType == Enum.UserInputType.Keyboard
        and input.KeyCode == Enum.KeyCode.Space
    then
        if infiniteJumpEnabled then
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass('Humanoid')
                if humanoid then
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                    task.wait()
                    humanoid:ChangeState(Enum.HumanoidStateType.Seated)
                end
            end
        end
    end
end)

------------------------------------------------
-- Gravity Switch Toggle
------------------------------------------------
local gravitySwitchEnabled = false
local defaultGravity = workspace.Gravity

PlayerTab:CreateToggle('Gravity Switch', function(state)
    gravitySwitchEnabled = state

    if gravitySwitchEnabled then
        workspace.Gravity = 0
        game.StarterGui:SetCore('SendNotification', {
            Title = 'WRD UI',
            Text = '✅ Gravity Disabled',
            Duration = 2,
        })
    else
        workspace.Gravity = defaultGravity
        game.StarterGui:SetCore('SendNotification', {
            Title = 'WRD UI',
            Text = '❌ Gravity Restored',
            Duration = 2,
        })
    end
end)

------------------------------------------------
-- Fly Toggle (UI only, no keybind)
------------------------------------------------
local flyEnabled = false
local flyLoop = nil
local ctrl = { f = 0, b = 0, l = 0, r = 0 }
local lastctrl = { f = 0, b = 0, l = 0, r = 0 }
local speed = 0
local maxspeed = 50 -- fixed fly speed
local bg, bv
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()

-- Get torso safely (R6 or R15)
local function getTorso()
    local char = plr.Character or plr.CharacterAdded:Wait()
    return char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
end

local function startFly()
    local torso = getTorso()
    if not torso then
        return
    end

    flyEnabled = true
    bg = Instance.new('BodyGyro', torso)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = torso.CFrame
    bv = Instance.new('BodyVelocity', torso)
    bv.velocity = Vector3.new(0, 0.1, 0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

    flyLoop = game:GetService('RunService').RenderStepped:Connect(function()
        local char = plr.Character
        if not char or not char:FindFirstChildOfClass('Humanoid') then
            return
        end

        char:FindFirstChildOfClass('Humanoid').PlatformStand = true

        if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then
            speed = speed + 0.5 + (speed / maxspeed)
            if speed > maxspeed then
                speed = maxspeed
            end
        elseif speed ~= 0 then
            speed = speed - 1
            if speed < 0 then
                speed = 0
            end
        end

        if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then
            bv.velocity = (
                (workspace.CurrentCamera.CFrame.LookVector * (ctrl.f + ctrl.b))
                + (
                    (workspace.CurrentCamera.CFrame * CFrame.new(
                        ctrl.l + ctrl.r,
                        (ctrl.f + ctrl.b) * 0.2,
                        0
                    )).p
                    - workspace.CurrentCamera.CFrame.p
                )
            ) * speed
            lastctrl = { f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r }
        elseif speed ~= 0 then
            bv.velocity = (
                (
                    workspace.CurrentCamera.CFrame.LookVector
                    * (lastctrl.f + lastctrl.b)
                )
                + (
                    (workspace.CurrentCamera.CFrame * CFrame.new(
                        lastctrl.l + lastctrl.r,
                        (lastctrl.f + lastctrl.b) * 0.2,
                        0
                    )).p
                    - workspace.CurrentCamera.CFrame.p
                )
            ) * speed
        else
            bv.velocity = Vector3.new(0, 0.1, 0)
        end

        bg.CFrame = workspace.CurrentCamera.CFrame
            * CFrame.Angles(
                -math.rad((ctrl.f + ctrl.b) * 50 * speed / maxspeed),
                0,
                0
            )
    end)

    game.StarterGui:SetCore('SendNotification', {
        Title = 'WRD UI',
        Text = '✅ Fly Enabled (Use WASD to move)',
        Duration = 3,
    })
end

local function stopFly()
    flyEnabled = false
    if flyLoop then
        flyLoop:Disconnect()
        flyLoop = nil
    end
    if bg then
        bg:Destroy()
        bg = nil
    end
    if bv then
        bv:Destroy()
        bv = nil
    end
    if plr.Character and plr.Character:FindFirstChildOfClass('Humanoid') then
        plr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end

    game.StarterGui:SetCore('SendNotification', {
        Title = 'WRD UI',
        Text = '❌ Fly Disabled',
        Duration = 3,
    })
end

-- Fly Toggle
PlayerTab:CreateToggle('Fly', function(state)
    if state then
        startFly()
    else
        stopFly()
    end
end)

-- WASD Movement
mouse.KeyDown:Connect(function(key)
    if key:lower() == 'w' then
        ctrl.f = 1
    elseif key:lower() == 's' then
        ctrl.b = -1
    elseif key:lower() == 'a' then
        ctrl.l = -1
    elseif key:lower() == 'd' then
        ctrl.r = 1
    end
end)

mouse.KeyUp:Connect(function(key)
    if key:lower() == 'w' then
        ctrl.f = 0
    elseif key:lower() == 's' then
        ctrl.b = 0
    elseif key:lower() == 'a' then
        ctrl.l = 0
    elseif key:lower() == 'd' then
        ctrl.r = 0
    end
end)

------------------------------------------------
-- Dex Explorer Button
------------------------------------------------
ExtraTab:CreateButton('Dex Explorer', function()
    loadstring(
        game:HttpGet(
            'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/DexExplorer.lua'
        )
    )()
    game.StarterGui:SetCore('SendNotification', {
        Title = 'WRD UI',
        Text = '✅ Dex Explorer Loaded',
        Duration = 3,
    })
end)

------------------------------------------------
-- Infinite Yield Button
------------------------------------------------
ExtraTab:CreateButton('Infinite Yield', function()
    loadstring(
        game:HttpGet(
            'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Tabs/InfiniteYield.lua'
        )
    )()
    game.StarterGui:SetCore('SendNotification', {
        Title = 'WRD UI',
        Text = '✅ Infinite Yield Loaded',
        Duration = 3,
    })
end)

------------------------------------------------
-- UNC Checker Button
------------------------------------------------
ExtraTab:CreateButton('UNC Checker', function()
    loadstring(
        game:HttpGet(
            'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/UNCChecker.lua'
        )
    )()
    game.StarterGui:SetCore('SendNotification', {
        Title = 'WRD UI',
        Text = '✅ UNC Checker Loaded (Press F9)',
        Duration = 3,
    })
end)

------------------------------------------------
-- Credits Function
------------------------------------------------
local CreditFunc = loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Tabs/Credits.lua'
    )
)()

-- Execute the Credits function
CreditFunc(Window, Library)

------------------------------------------------
-- ESP Window
------------------------------------------------

-- Default ESP settings (all start disabled)
_G.WRDESPEnabled = _G.WRDESPEnabled or false
_G.WRDESPBoxes = _G.WRDESPBoxes or true
_G.WRDESPTeamColors = _G.WRDESPTeamColors or true
_G.WRDESPTracers = _G.WRDESPTracers or false
_G.WRDESPNames = _G.WRDESPNames or true

-- ESP Toggles
ESPTab:CreateToggle('Enable ESP', function(state)
    _G.WRDESPEnabled = state
end, _G.WRDESPEnabled)

ESPTab:CreateToggle('Boxes', function(state)
    _G.WRDESPBoxes = state
end, _G.WRDESPBoxes)

ESPTab:CreateToggle('Team Colors', function(state)
    _G.WRDESPTeamColors = state
end, _G.WRDESPTeamColors)

ESPTab:CreateToggle('Tracers', function(state)
    _G.WRDESPTracers = state
end, _G.WRDESPTracers)

ESPTab:CreateToggle('Names', function(state)
    _G.WRDESPNames = state
end, _G.WRDESPNames)

-- Only load the ESP script once
if not _G.WRDESPLoaded then
    -- Run ESP script
    loadstring(
        game:HttpGet(
            'https://raw.githubusercontent.com/DozeIsOkLol/LibWare/refs/heads/main/games/Misc/ESPScript.lua'
        )
    )()
    _G.WRDESPLoaded = true
end
