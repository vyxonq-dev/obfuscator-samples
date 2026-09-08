local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Version = "1.4.0"
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI/" .. Version))()
local Window = WindUI:CreateWindow({
    Title = "Arena Chaos V3", -- UI Title
    Icon = "rbxassetid://99083837785762", -- Url or rbxassetid or lucide
    Author = "Valvvm and Peelup", -- Author & Creator
    Folder = "CloudHub", -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(580, 460), -- UI Size
    KeySystem = { -- Creates key system
        Key = "ShadowDiva", -- key
        Note = "Key in discord", -- Note
        URL = "https://discord.gg/purc6CXt", -- URL To get key (example: Discord)
        SaveKey = true, -- Saves the key in the folder specified above
    }, 
    Transparent = true,-- UI Transparency
    Theme = "Dark", -- UI Theme
    SideBarWidth = 170, -- UI Sidebar Width (number)
    HasOutline = true, -- Adds Outlines to the window
})
local Notification = WindUI:Notify({
    Title = "Merry Christmas!",
    Content = "Happy to see you!",
    Duration = 5,
})
local Tab = Window:Tab({
    Title = "Hitbox",
    Icon = "folder", -- lucide or rbxassetid
})
local Toggle = Tab:Toggle({
    Title = "FOV Toggle",
    Desc = "Activate or deactivate FOV",
    Value = false,
    Callback = function(state)
        local fov = 100
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Players = game:GetService("Players")
        local Cam = game.Workspace.CurrentCamera

        local FOVring = Drawing.new("Circle")
        FOVring.Thickness = 2
        FOVring.Color = Color3.fromRGB(128, 0, 128)
        FOVring.Filled = false
        FOVring.Radius = fov
        FOVring.Position = Cam.ViewportSize / 2

        local function updateDrawings()
            local camViewportSize = Cam.ViewportSize
            FOVring.Position = camViewportSize / 2
        end

        local function lookAt(target)
            local lookVector = (target - Cam.CFrame.Position).unit
            local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector)
            Cam.CFrame = newCFrame
        end

        local function getClosestPlayerInFOV(trg_part)
            local nearest = nil
            local last = math.huge
            local playerMousePos = Cam.ViewportSize / 2

            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= Players.LocalPlayer then
                    local part = player.Character and player.Character:FindFirstChild(trg_part)
                    if part then
                        local ePos, isVisible = Cam:WorldToViewportPoint(part.Position)
                        local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude

                        if distance < last and isVisible and distance < fov then
                            last = distance
                            nearest = player
                        end
                    end
                end
            end

            return nearest
        end

        if state then
            FOVring.Visible = true
            RunService:BindToRenderStep("FOVUpdate", Enum.RenderPriority.Camera.Value + 1, function()
                updateDrawings()
                local closest = getClosestPlayerInFOV("Head")
                if closest and closest.Character:FindFirstChild("Head") then
                    lookAt(closest.Character.Head.Position)
                end
            end)
        else
            FOVring.Visible = false
            RunService:UnbindFromRenderStep("FOVUpdate")
        end

        local function onKeyDown(input)
            if input.KeyCode == Enum.KeyCode.Delete then
                Toggle.Value = false
                FOVring.Visible = false
                RunService:UnbindFromRenderStep("FOVUpdate")
            end
        end

        UserInputService.InputBegan:Connect(onKeyDown)
    end,
})
local Button = Tab:Button({
    Title = "Hitbox",
    Desc = "Hitbox Fr 20",
    Callback = function()
local HeadSize = 20
local IsDisabled = true
local IsTeamCheckEnabled = false 

game:GetService('RunService').RenderStepped:Connect(function()
    if IsDisabled then
        local localPlayer = game:GetService('Players').LocalPlayer
        if not localPlayer then return end
        
        local localPlayerTeam = localPlayer.Team
        
        for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
            if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Size = Vector3.new(HeadSize, HeadSize, HeadSize)
                    humanoidRootPart.Transparency = 0.7
                    humanoidRootPart.BrickColor = BrickColor.new("Really blue")
                    humanoidRootPart.Material = Enum.Material.Neon
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)
    end,
})
local Tab = Window:Tab({
    Title = "Kills Client/fe",
    Icon = "folder", -- lucide or rbxassetid
})
local Section = Tab:Section({ 
    Title = "Kills Value",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Slider = Tab:Slider({
    Title = "Kills",
    Step = 1,
    Value = {
        Min = 0,
        Max = 100000000,
        Default = 0,
    },
    Callback = function(value)
        local player = game.Players.LocalPlayer
        
        if player and player:FindFirstChild("leaderstats") then
            local leaderstats = player.leaderstats
            
            if leaderstats:FindFirstChild("Kills") then
                local kills = leaderstats.Kills
                kills.Value = value
                print("El valor de Kills ha sido cambiado a " .. value)
            else
                print("No se encontró el valor de Kills.")
            end
        else
            print("El jugador no tiene la carpeta leaderstats.")
        end
    end
})
local Tab = Window:Tab({
    Title = "Skills Inf",
    Icon = "folder", -- lucide or rbxassetid
})
local Section = Tab:Section({ 
    Title = "Sonic Skills inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "Spindash",
    Desc = "Spindash Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.SpinDash.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "HomingAttack",
    Desc = "HomingAttack Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.HomingAttack.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "SpeedSlider",
    Desc = "SpeedSlider Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.SpeedSlicer.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "FlashTornado",
    Desc = "FlashTornado Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.FlashTornado.Event:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "Knuckles Skills inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "RissingCut",
    Desc = "RissingCut Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.RisingUppercut.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "PummelGrab",
    Desc = "PummelGrab Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.PummelGrab.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "DropKick",
    Desc = "DropKick Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.DropKick.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "RockWave",
    Desc = "RockWave Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.RockWave.Event:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "EXE Skills inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "EXEcution",
    Desc = "EXEcution Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.EXEcution.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "RedRing",
    Desc = "RedRing Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.RedRing.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "DemonDrive",
    Desc = "DemonDrive Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.DemonDrive.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "Fatality",
    Desc = "Fatality Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.Fatality.Event:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "Normal Skills inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "M1",
    Desc = "M1 Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.M1Main.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "M2",
    Desc = "M2 Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.M1Main.Event2:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "M3",
    Desc = "M3 Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.M1Main.Event3:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "M4",
    Desc = "M4 Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.M1Main.Event4:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "Abilities Comun inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "Dash",
    Desc = "Dash Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.Dash.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "Parry",
    Desc = "Parry Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.Parry.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "BoostStart",
    Desc = "BoostStart Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.Dash.BoostStart:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "CancelBoost",
    Desc = "CancelBoost Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.Dash.CancelBoost:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "Awakening",
    Desc = "Awakening Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.Awakening.Event:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "Sonic Skills Awaking inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "Blink",
    Desc = "Blink Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Blink.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "CosmicZoom",
    Desc = "CosmicZoom Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2CosmicZoom.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "SonicBoom",
    Desc = "SonicBoom Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2SonicBoom.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "SuperSpinDash",
    Desc = "SuperSpinDash Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2SuperSpinDash.Event:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "Knuckles Skills Awaking inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "P2Suplex",
    Desc = "P2Suplex Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Suplex.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "P2OnSlaught",
    Desc = "OnSlaught Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Onslaught.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "P2Burrow",
    Desc = "P2Burrow Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Burrow.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "P2Burrow Cancel",
    Desc = "P2Burrow Cancel Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Burrow.Event2:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "EXE Skills Awaking inf",
    TextXAlignment = "Left",
    TextSize = 17, -- Default Size
})
local Button = Tab:Button({
    Title = "P2Impatience",
    Desc = "P2Impatience Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Impatience.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "P2Bloodlust",
    Desc = "P2Bloodlust Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Bloodlust.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "P2Decoy",
    Desc = "P2Decoy Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Decoy.Event:FireServer()
    end,
})
local Button = Tab:Button({
    Title = "P2Brurality",
    Desc = "P2Brutality Inf",
    Callback = function()
game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2Brutality.Event:FireServer()
    end,
})
local Section = Tab:Section({ 
    Title = "Tails Inf",
    TextXAlignment = "Left",
    TextSize = 17
})

local ButtonChargeShot = Tab:Button({
    Title = "ChargeShot",
    Desc = "ChargeShot Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.ChargeShot.Event:FireServer()
    end,
})

local ButtonRocketKick = Tab:Button({
    Title = "RocketKick",
    Desc = "RocketKick Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.RocketKick.Event:FireServer()
    end,
})

local ButtonTailSweep = Tab:Button({
    Title = "TailsSweep",
    Desc = "TailsSweep Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.TailSweep.Event:FireServer()
    end,
})

local ButtonBombToss = Tab:Button({
    Title = "BombToss",
    Desc = "BombToss Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.BombToss.Event:FireServer()
    end,
})

local SectionAwakeningTails = Tab:Section({ 
    Title = "Awaking Tails",
    TextXAlignment = "Left",
    TextSize = 17
})

local ButtonRapidFire = Tab:Button({
    Title = "RapidFire",
    Desc = "RapidFire Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2RapidFire.Event:FireServer()
    end,
})

local ButtonNeonBlast = Tab:Button({
    Title = "NeonBlast",
    Desc = "NeonBlast Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2NeonBlast.Event:FireServer()
    end,
})

local ButtonCrashLanding = Tab:Button({
    Title = "CrashLanding",
    Desc = "CrashLanding Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2CrashLanding.Event:FireServer()
    end,
})

local ButtonAirStrike = Tab:Button({
    Title = "AirStrike",
    Desc = "AirStrike Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.P2AirStrike.Fire:FireServer()
    end,
})

local SectionShadowInf = Tab:Section({ 
    Title = "Shadow Inf",
    TextXAlignment = "Left",
    TextSize = 17
})

local ButtonChaosSpear = Tab:Button({
    Title = "ChaosSpear",
    Desc = "ChaosSpear Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.ChaosSpear.Event:FireServer()
    end,
})

local ButtonDrivingImpact = Tab:Button({
    Title = "DrivingImpact",
    Desc = "DrivingImpact Inf",
    Callback = function()
        game:GetService("Players").LocalPlayer.Character.CurrentSkills.DrivingImpact.Event:FireServer()
    end,
})

local TabGamepass = Window:Tab({
    Title = "Gamepass",
    Icon = "folder"
})

local SectionFree = TabGamepass:Section({ 
    Title = "Free",
    TextXAlignment = "Left",
    TextSize = 17
})

local ButtonFreeGamepass = TabGamepass:Button({
    Title = "Shadow Free Gamepass",
    Desc = "Gamepass",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Valvvvm/Arena-of-Chaos-Free-Tails/refs/heads/main/Free%20Tails"))()
    end,
})
