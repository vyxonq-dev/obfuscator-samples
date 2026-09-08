-- You're here to skid? Well, I can't stop you

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

local antiRagdollEnabled = false
local antiRagdollConnection
local stealV2Enabled = false
local stealV2Part
local stealV2InvisiblePart

local lockBasePositions = {
    Vector3.new(1734, 66, -567),
    Vector3.new(1833, 66, -568),
    Vector3.new(1933, 66, -567),
    Vector3.new(2032, 66, -568),
    Vector3.new(2034, 66, -301),
    Vector3.new(1933, 66, -301),
    Vector3.new(1834, 66, -301)
}

local Window = Fluent:CreateWindow({
    Title = "XXMZ",
    SubTitle = "Steal a Meme",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local MainTab = Window:AddTab({ Title = "Main", Icon = "home" })

local function toggleStealV2(enabled)
    stealV2Enabled = enabled
    
    if enabled then
        if character and character:FindFirstChild("HumanoidRootPart") then
            local currentPosition = character.HumanoidRootPart.Position
            local teleportPosition = Vector3.new(currentPosition.X, currentPosition.Y + 110, currentPosition.Z)
            character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
        end
        
        stealV2Part = Instance.new("Part")
        stealV2Part.Name = "StealV2_Visual"
        stealV2Part.Anchored = true
        stealV2Part.CanCollide = false
        stealV2Part.Transparency = 0.7
        stealV2Part.Color = Color3.fromRGB(255, 0, 0)
        stealV2Part.Material = Enum.Material.ForceField
        
        local pos1 = Vector3.new(1654, 141, -238)
        local pos2 = Vector3.new(2168, 141, -584)
        
        local centerX = (pos1.X + pos2.X) / 2
        local centerY = (pos1.Y + pos2.Y) / 2
        local centerZ = (pos1.Z + pos2.Z) / 2
        
        local sizeX = math.abs(pos2.X - pos1.X)
        local sizeY = 5
        local sizeZ = math.abs(pos2.Z - pos1.Z)
        
        stealV2Part.Position = Vector3.new(centerX, centerY, centerZ)
        stealV2Part.Size = Vector3.new(sizeX, sizeY, sizeZ)
        stealV2Part.Parent = workspace
        
        stealV2InvisiblePart = Instance.new("Part")
        stealV2InvisiblePart.Name = "StealV2_Platform"
        stealV2InvisiblePart.Anchored = true
        stealV2InvisiblePart.CanCollide = true
        stealV2InvisiblePart.Transparency = 1
        stealV2InvisiblePart.Color = Color3.fromRGB(0, 255, 0)
        stealV2InvisiblePart.Material = Enum.Material.Plastic
        stealV2InvisiblePart.Position = Vector3.new(centerX, centerY + 3, centerZ)
        stealV2InvisiblePart.Size = Vector3.new(sizeX, 1, sizeZ)
        stealV2InvisiblePart.Parent = workspace
        
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Steal V2 ativado! Teleportado para centro da área + plataforma criada!",
            Duration = 3
        })
    else
        if stealV2Part then
            stealV2Part:Destroy()
            stealV2Part = nil
        end
        
        if stealV2InvisiblePart then
            stealV2InvisiblePart:Destroy()
            stealV2InvisiblePart = nil
        end
        
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Steal V2 desativado! Área visual e plataforma removidas.",
            Duration = 3
        })
    end
end

local function toggleAntiRagdoll(enabled)
    antiRagdollEnabled = enabled
    
    if enabled then
        antiRagdollConnection = RunService.Heartbeat:Connect(function()
            if character and character:FindFirstChild("Humanoid") then
                local humanoid = character.Humanoid
                if humanoid.PlatformStand then
                    humanoid.PlatformStand = false
                end
                if humanoid.Sit then
                    humanoid.Sit = false
                end
                if humanoid:GetState() == Enum.HumanoidStateType.Ragdoll or 
                   humanoid:GetState() == Enum.HumanoidStateType.FallingDown then
                    humanoid:ChangeState(Enum.HumanoidStateType.Running)
                end
            end
        end)
        
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Anti Ragdoll ativado!",
            Duration = 3
        })
    else
        if antiRagdollConnection then
            antiRagdollConnection:Disconnect()
            antiRagdollConnection = nil
        end
        
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Anti Ragdoll desativado!",
            Duration = 3
        })
    end
end

local function lockBaseTeleport()
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Personagem não encontrado!",
            Duration = 3
        })
        return
    end
    
    local originalPosition = character.HumanoidRootPart.CFrame
    
    Fluent:Notify({
        Title = "XXMZ",
        Content = "Iniciando Lock Base...",
        Duration = 2
    })
    
    spawn(function()
        for i, position in pairs(lockBasePositions) do
            character.HumanoidRootPart.CFrame = CFrame.new(position)
            wait(0.05)
        end
        
        wait(0.05)
        character.HumanoidRootPart.CFrame = originalPosition
        
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Lock Base concluído! Voltou à posição original.",
            Duration = 3
        })
    end)
end

local function stealTeleport()
    if character and character:FindFirstChild("HumanoidRootPart") then
        local currentPosition = character.HumanoidRootPart.Position
        local newPosition = Vector3.new(currentPosition.X, currentPosition.Y + 20, currentPosition.Z)
        character.HumanoidRootPart.CFrame = CFrame.new(newPosition)
        
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Steal executado! (+20 blocos)",
            Duration = 3
        })
    end
end

local function teleportToStealArea()
    if character and character:FindFirstChild("HumanoidRootPart") then
        local centerX = (1654 + 2168) / 2
        local centerZ = (-238 + -584) / 2
        local teleportPosition = Vector3.new(centerX, 201, centerZ)
        
        character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
        
        Fluent:Notify({
            Title = "XXMZ",
            Content = "Teleportado para área Steal V2!",
            Duration = 3
        })
    end
end

local AntiRagdollToggle = MainTab:AddToggle("AntiRagdollToggle", {
    Title = "Anti Ragdoll",
    Description = "Impede que o personagem seja derrubado ou entre em ragdoll",
    Default = false
})

AntiRagdollToggle:OnChanged(function(value)
    toggleAntiRagdoll(value)
end)

local StealV2Toggle = MainTab:AddToggle("StealV2Toggle", {
    Title = "Steal V2",
    Description = "Cria área visual + plataforma invisível e teleporta para lá",
    Default = false
})

StealV2Toggle:OnChanged(function(value)
    toggleStealV2(value)
end)

local LockBaseButton = MainTab:AddButton({
    Title = "Lock Base",
    Description = "Teleporta em sequência para todas as posições da base e volta",
    Callback = function()
        lockBaseTeleport()
    end
})

local StealButton = MainTab:AddButton({
    Title = "Steal",
    Description = "Teleporta 20 blocos acima da posição atual",
    Callback = function()
        stealTeleport()
    end
})

local TeleportAreaButton = MainTab:AddButton({
    Title = "Ir para Área Steal",
    Description = "Teleporta diretamente para a área do Steal V2",
    Callback = function()
        teleportToStealArea()
    end
})

MainTab:AddParagraph({
    Title = "Como usar:",
    Content = "1. 'Anti Ragdoll' impede quedas\n2. 'Steal V2' cria área visual + plataforma sólida\n3. 'Lock Base' faz tour nas posições\n4. 'Steal' teleporta +20 blocos\n5. 'Ir para Área Steal' teleporta para a área"
})

player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    
    if antiRagdollEnabled then
        toggleAntiRagdoll(false)
        wait(0.1)
        toggleAntiRagdoll(true)
    end
    
    if stealV2Enabled then
        toggleStealV2(false)
    end
end)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("XXMZ")
SaveManager:SetFolder("XXMZ/configs")

InterfaceManager:BuildInterfaceSection(MainTab)
SaveManager:BuildConfigSection(MainTab)

Window:SelectTab(1)
SaveManager:LoadAutoloadConfig()

Fluent:Notify({
    Title = "XXMZ",
    Content = "GUI carregada com sucesso! Versão corrigida com plataforma sólida!",
    Duration = 5
})
