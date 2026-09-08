--==================================================
-- KEY SYSTEM
--==================================================
local KEY = "Hyper V2"
local KEY_LINK = "https://linkvertise.com/3645747/UkXeKg1aekw6?o=sharing" -- MUDA AQUI

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Debris = game:GetService("Debris")
local lp = Players.LocalPlayer

local keyGui = Instance.new("ScreenGui", game.CoreGui)
keyGui.ResetOnSpawn = false

local frame = Instance.new("Frame", keyGui)
frame.Size = UDim2.new(0, 320, 0, 170)
frame.Position = UDim2.new(0.5, -160, 0.5, -85)
frame.BackgroundColor3 = Color3.fromRGB(25,25,35)
Instance.new("UICorner", frame)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "Hyper Admin Key"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(140,180,255)
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0.9,0,0,32)
box.Position = UDim2.new(0.05,0,0.28,0)
box.PlaceholderText = "Digite a chave..."
box.BackgroundColor3 = Color3.fromRGB(35,35,50)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.Gotham
box.TextSize = 14
Instance.new("UICorner", box)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(0.9,0,0,30)
button.Position = UDim2.new(0.05,0,0.55,0)
button.Text = "Confirmar"
button.BackgroundColor3 = Color3.fromRGB(60,70,140)
button.TextColor3 = Color3.new(1,1,1)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
Instance.new("UICorner", button)

local linkBtn = Instance.new("TextButton", frame)
linkBtn.Size = UDim2.new(0.9,0,0,28)
linkBtn.Position = UDim2.new(0.05,0,0.78,0)
linkBtn.Text = "🔑 Pegar Link da Key"
linkBtn.BackgroundColor3 = Color3.fromRGB(45,45,65)
linkBtn.TextColor3 = Color3.fromRGB(180,255,180)
linkBtn.Font = Enum.Font.Gotham
linkBtn.TextSize = 13
Instance.new("UICorner", linkBtn)

local unlocked = false

button.MouseButton1Click:Connect(function()
	if box.Text == KEY then
		unlocked = true
		keyGui:Destroy()
	else
		box.Text = ""
		box.PlaceholderText = "Chave incorreta 😈"
	end
end)

linkBtn.MouseButton1Click:Connect(function()
	if setclipboard then
		setclipboard(KEY_LINK)
		linkBtn.Text = "Link copiado 😈🔥"
	else
		linkBtn.Text = "Executor sem clipboard"
	end
end)

repeat task.wait() until unlocked

--==================================================
-- CONFIG
--==================================================
local CURRENT_THEME = "Dark"

--==================================================
-- LOAD WINDUI
--==================================================
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

--==================================================
-- WINDOW
--==================================================
local Window = WindUI:CreateWindow({
    Title = "Hyper Admin",
    Author = lp.Name,
    Icon = "shield",
    Folder = "HyperAdmin",
    Theme = CURRENT_THEME
})

--==================================================
-- TABS
--==================================================
local BasicTab  = Window:Tab({Title="Basic",  Icon="user"})
local AdminTab  = Window:Tab({Title="Admin",  Icon="crown"})
local FunTab    = Window:Tab({Title="Fun",    Icon="zap"})
local MusicTab  = Window:Tab({Title="Music",  Icon="music"})
local SkyTab    = Window:Tab({Title="Sky",    Icon="cloud"})

--==================================================
-- BASIC
--==================================================
local flying = false
local noclip = false
local flyConn

BasicTab:Slider({
    Title="WalkSpeed",
    Value={Min=0,Max=300,Default=16},
    Callback=function(v)
        local h = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if h then h.WalkSpeed = v end
    end
})

BasicTab:Slider({
    Title="JumpPower",
    Value={Min=0,Max=300,Default=50},
    Callback=function(v)
        local h = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if h then h.JumpPower = v end
    end
})

BasicTab:Toggle({
    Title="Fly",
    Default=false,
    Callback=function(state)
        flying = state
        local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end

        if state then
            local bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "Fly"
            bv.MaxForce = Vector3.new(9e9,9e9,9e9)

            flyConn = RunService.RenderStepped:Connect(function()
                if bv.Parent and flying then
                    bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80
                end
            end)
        else
            if flyConn then flyConn:Disconnect() end
            if hrp:FindFirstChild("Fly") then hrp.Fly:Destroy() end
        end
    end
})

RunService.Stepped:Connect(function()
    if noclip and lp.Character then
        for _,v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.CanCollide=false end
        end
    end
end)

BasicTab:Toggle({
    Title="Noclip",
    Default=false,
    Callback=function(v) noclip=v end
})

BasicTab:Button({
    Title="Fling (Você)",
    Callback=function()
        local hrp=lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Velocity=Vector3.new(9999,9999,9999)
            hrp.RotVelocity=Vector3.new(9999,9999,9999)
        end
    end
})

--==================================================
-- ADMIN
--==================================================
local adminTarget=""

AdminTab:Input({
    Title="Nome do Jogador",
    Placeholder="Player",
    Callback=function(v) adminTarget=v end
})

local function getTarget()
    return Players:FindFirstChild(adminTarget) or lp
end

AdminTab:Toggle({
    Title="Rainbow Player",
    Default=false,
    Callback=function(state)
        _G.Rainbow = state

        task.spawn(function()
            while _G.Rainbow and lp.Character do
                for _,v in pairs(lp.Character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Color = Color3.fromHSV(tick()%5/5,1,1)
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

--==================================================
-- FUN
--==================================================
local funTarget=""

FunTab:Input({
    Title="Nome do Jogador",
    Placeholder="Player",
    Callback=function(v) funTarget=v end
})

FunTab:Button({
    Title="Fling Jogador",
    Callback=function()
        local t=Players:FindFirstChild(funTarget)
        if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then
            local hrp=t.Character.HumanoidRootPart
            hrp.Velocity=Vector3.new(9999,9999,9999)
            hrp.RotVelocity=Vector3.new(9999,9999,9999)
        end
    end
})

--==================================================
-- MUSIC
--==================================================
local sound=Instance.new("Sound",workspace)

MusicTab:Input({
    Title="Music ID",
    Placeholder="rbxassetid",
    Callback=function(id)
        sound.SoundId="rbxassetid://"..id
    end
})

MusicTab:Button({Title="Play",Callback=function() sound.Looped=true sound:Play() end})
MusicTab:Button({Title="Stop",Callback=function() sound:Stop() end})

--==================================================
-- SKY
--==================================================
SkyTab:Button({
    Title="Clone no Céu",
    Callback=function()
        local c=lp.Character
        if not c then return end
        local clone=c:Clone()
        clone.Parent=workspace
        for _,v in pairs(clone:GetDescendants()) do
            if v:IsA("Script") or v:IsA("LocalScript") then v:Destroy() end
        end
        local hrp=clone:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.Anchored=true
            hrp.CFrame=CFrame.new(0,500,0)
        end
    end
})
