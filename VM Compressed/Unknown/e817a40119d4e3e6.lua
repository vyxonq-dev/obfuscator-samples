--If you steal this, it will be sent to the owner.
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Version = "1.4.0"
local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI/" .. Version))()
local Window = WindUI:CreateWindow({
    Title = "Arena Chaos", -- UI Title
    Icon = "rbxassetid://99083837785762", -- Url or rbxassetid or lucide
    Author = "Valvvm and Peelup", -- Author & Creator
    Folder = "CloudHub", -- Folder name for saving data (And key)
    Size = UDim2.fromOffset(580, 460), -- UI Size
    KeySystem = { -- Creates key system
        Key = "ValvvmFictionCamara", -- key
        Note = "Key in discord", -- Note
        URL = "https://discord.gg/zrg6Gwbc", -- URL To get key (example: Discord)
        SaveKey = false, -- Saves the key in the folder specified above
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
    Title = "Admin Free",
    Icon = "folder", -- lucide or rbxassetid
})
local Button = Tab:Button({
    Title = "Admin V3 Free",
    Desc = "Admin V3",
    Callback = function()
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function showImageButton()
    local commandsPannel = playerGui:WaitForChild("CommandsPannel", 10)
    if not commandsPannel then
        warn("CommandsPannel not found")
        return
    end

    commandsPannel.Enabled = true

    local imageButton = commandsPannel:WaitForChild("ImageButton", 10)
    if not imageButton then
        warn("ImageButton not found inside CommandsPannel")
        return
    end

    imageButton.Visible = true
end

player.CharacterAdded:Connect(function()
    showImageButton()
end)

showImageButton()
end,
})
local Input = Tab:Input({
    Title = "HitboxM1",
    Desc = "HitboxChangerM1",
    Value = "0",
    PlaceholderText = "Enter the new name for the hitbox...",
    ClearTextOnFocus = false,
    Callback = function(Text)
        print("Buscando y renombrando a:", Text)
        
        local hitBoxesFolder = workspace:FindFirstChild("HitBoxes")

        if hitBoxesFolder then
            local dmgPointFolder = hitBoxesFolder:FindFirstChild("DmgPoint")
            
            if dmgPointFolder then
                for _, hitBox in ipairs(dmgPointFolder:GetChildren()) do
                    if hitBox.Name == "M1HitBox" then
                        hitBox.Name = Text
                        print("Renombrado", "M1HitBox", "a", hitBox.Name)
                    end
                end
            else
                warn("No se encontró la carpeta DmgPoint dentro de HitBoxes.")
            end
        else
            warn("No se encontró la carpeta HitBoxes.")
        end
    end
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
