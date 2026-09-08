-- [[ 🛠 ADMIN HUB ]] --

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Window = Fluent:CreateWindow({
    Title = "🛠 Admin Hub",
    SubTitle = "Sistema de Moderação",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark"
})

local Tabs = {
    Main = Window:AddTab({ Title = "Comandos", Icon = "shield" }),
}

local TargetName = ""
local Viewing = false
local Floating = false
local Flying = false
local FloatPart = nil

-- Função para achar jogador
local function GetPlayer(name)
    name = name:lower()
    for _, p in pairs(Players:GetPlayers()) do
        if p.Name:lower():sub(1, #name) == name or p.DisplayName:lower():sub(1, #name) == name then
            return p
        end
    end
end

-- [[ LÓGICA DOS COMANDOS ]] --

local Actions = {
    View = function(name)
        local p = GetPlayer(name or TargetName)
        if p and p.Character then
            Viewing = not Viewing
            if Viewing then
                Camera.CameraSubject = p.Character.Humanoid
                Fluent:Notify({Title = "Admin Hub", Content = "Espiando: " .. p.Name})
            else
                Camera.CameraSubject = LocalPlayer.Character.Humanoid
                Fluent:Notify({Title = "Admin Hub", Content = "Câmera resetada."})
            end
        end
    end,

    Goto = function(name)
        local p = GetPlayer(name or TargetName)
        if p and p.Character then
            LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame
        end
    end,

    Kick = function(name)
        local p = GetPlayer(name or TargetName)
        if p then
            p:Kick("\n\n🛠 [ADMIN HUB]\n\nkitado pelo admin hub 🛠")
        end
    end,

    Kill = function(name)
        local p = GetPlayer(name or TargetName)
        if p and p.Character then
            p.Character:BreakJoints()
        end
    end,

    Freeze = function(name)
        local p = GetPlayer(name or TargetName)
        if p and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.Anchored = not hrp.Anchored
            end
        end
    end,

    Jail = function(name)
        local p = GetPlayer(name or TargetName)
        if p and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            local jailName = "Jail_" .. p.Name
            if workspace:FindFirstChild(jailName) then
                workspace[jailName]:Destroy()
                if hrp then hrp.Anchored = false end
            else
                local box = Instance.new("Part", workspace)
                box.Name = jailName
                box.Size = Vector3.new(7, 9, 7)
                box.CFrame = hrp.CFrame
                box.Anchored = true
                box.Material = Enum.Material.Ice
                box.Transparency = 0.5
                box.Color = Color3.fromRGB(0, 255, 255)
                if hrp then hrp.Anchored = true end
            end
        end
    end,

    Fire = function(name)
        local p = GetPlayer(name or TargetName)
        if p and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp:FindFirstChild("AdminFire") then
                hrp.AdminFire:Destroy()
                _G.FireLoop = false
            else
                local f = Instance.new("Fire", hrp)
                f.Name = "AdminFire"
                _G.FireLoop = true
                task.spawn(function()
                    while _G.FireLoop and p.Character do
                        p.Character:BreakJoints()
                        task.wait(1)
                    end
                end)
            end
        end
    end,

    Float = function()
        Floating = not Floating
        if Floating then
            FloatPart = Instance.new("Part", workspace)
            FloatPart.Size = Vector3.new(10, 1, 10)
            FloatPart.Anchored = true
            FloatPart.Transparency = 0.6
            task.spawn(function()
                while Floating do
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        FloatPart.CFrame = LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -3.5, 0)
                    end
                    task.wait()
                end
                if FloatPart then FloatPart:Destroy() end
            end)
        else
            if FloatPart then FloatPart:Destroy() end
        end
    end,

    Fly = function()
        Flying = not Flying
        local speed = 50
        if Flying then
            local bv = Instance.new("BodyVelocity", LocalPlayer.Character.HumanoidRootPart)
            bv.Name = "FlyBV"
            bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
            task.spawn(function()
                while Flying do
                    bv.Velocity = Camera.CFrame.LookVector * speed
                    task.wait()
                end
                bv:Destroy()
            end)
        end
    end
}

-- [[ UI - ENTRADA DE TEXTO ]] --

Tabs.Main:AddInput("TargetInput", {
    Title = "Nome do Jogador",
    Placeholder = "Digite o nome...",
    Callback = function(Value) TargetName = Value end
})

-- [[ BOTOES DA INTERFACE ]] --

local Buttons = {"View", "Goto", "Kick", "Kill", "Freeze", "Jail", "Fire", "Float", "Fly"}
for _, btn in pairs(Buttons) do
    Tabs.Main:AddButton({
        Title = btn,
        Callback = function() Actions[btn]() end
    })
end

-- [[ SISTEMA DE COMANDOS PELO CHAT ]] --

LocalPlayer.Chatted:Connect(function(msg)
    local args = msg:split(" ")
    local cmd = args[1]:lower()
    local arg2 = args[2]

    if cmd == ";view" then Actions.View(arg2)
    elseif cmd == ";goto" then Actions.Goto(arg2)
    elseif cmd == ";kick" then Actions.Kick(arg2)
    elseif cmd == ";kill" then Actions.Kill(arg2)
    elseif cmd == ";frezze" or cmd == ";freeze" then Actions.Freeze(arg2)
    elseif cmd == ";jail" then Actions.Jail(arg2)
    elseif cmd == ";fire" then Actions.Fire(arg2)
    elseif cmd == ";float" then Actions.Float()
    elseif cmd == ";fly" then Actions.Fly()
    end
end)

Fluent:Notify({Title = "Admin Hub", Content = "Script carregado! Use ;comando ou a GUI."})
