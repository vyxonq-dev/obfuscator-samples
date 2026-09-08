-----------------------------------------------------
-- WINDUI BASE
-----------------------------------------------------

local Version = "1.6.53"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" ..
Version .. "/main.lua"))()

WindUI:AddTheme({
    Name = "Royal Void",
    Accent = WindUI:Gradient({
        ["0"]   = { Color = Color3.fromHex("#FF3366"), Transparency = 0 },
        ["50"]  = { Color = Color3.fromHex("#1E90FF"), Transparency = 0 },
        ["100"] = { Color = Color3.fromHex("#9B30FF"), Transparency = 0 },
    }, { Rotation = 45 }),

    Dialog = Color3.fromHex("#0A0011"),
    Outline = Color3.fromHex("#1E90FF"),
    Text = Color3.fromHex("#FFE6FF"),
    Placeholder = Color3.fromHex("#B34A7F"),
    Background = Color3.fromHex("#050008"),
    Button = Color3.fromHex("#FF00AA"),
    Icon = Color3.fromHex("#0066CC")
})

local Window = WindUI:CreateWindow({
    Title = "Legend Hub X Speed Legends",
    Icon = "zap",
    Author = "by DarkHub",
    Folder = "LegendHub",
    Size = UDim2.fromOffset(500, 350),
    Transparent = true,
    Theme = "Royal Void",
    ScrollBarEnabled = true,
    HideSearchBar = true,
    NewElements = true,
})

Window:EditOpenButton({
    Title = "LegendHub",
    Icon = "star",
    CornerRadius = UDim.new(0,25),
    StrokeThickness = 2,
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromHex("#FF3366")),
        ColorSequenceKeypoint.new(0.5, Color3.fromHex("#1E90FF")),
        ColorSequenceKeypoint.new(1, Color3.fromHex("#9B30FF"))
    }),
    Draggable = true,
})

WindUI:Notify({
    Title = "LegendHub",
    Content = "Loaded Successfully!",
    Duration = 4,
    Icon = "check"
})

-----------------------------------------------------
-- VARIÁVEIS
-----------------------------------------------------

local AutoOrb = false
local OrbDelay = 0.1
local OrbMultiplier = 1

local autoRebirth = false
local autoRace = false
local autoHoops = false

local AutoStep = false
local AutoBestPets = false

-----------------------------------------------------
-- FUNÇÕES
-----------------------------------------------------

local function CollectOrbs()
    local rs = game:GetService("ReplicatedStorage")
    local e = rs:FindFirstChild("rEvents") and rs.rEvents:FindFirstChild("orbEvent")

    if e then
        e:FireServer("collectOrb","Red Orb","City")
        e:FireServer("collectOrb","Gem","City")
        e:FireServer("collectOrb","Blue Orb","City")
        e:FireServer("collectOrb","Orange Orb","City")
    end
end

local function StartAutoOrb()
    task.spawn(function()
        while AutoOrb do
            for i = 1, OrbMultiplier do
                pcall(CollectOrbs)
            end
            task.wait(OrbDelay)
        end
    end)
end

local function StartAutoRebirth()
    task.spawn(function()
        while autoRebirth do
            pcall(function()
                game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer("rebirthRequest")
            end)
            task.wait(0.2)
        end
    end)
end

local function StartAutoRace()
    task.spawn(function()
        while autoRace do
            pcall(function()
                game:GetService("ReplicatedStorage").rEvents.raceEvent:FireServer("joinRace")
            end)
            task.wait(0.2)
        end
    end)
end

local function StartAutoHoops()
    task.spawn(function()
        local hoops = workspace:WaitForChild("Hoops")
        while autoHoops do
            local plr = game.Players.LocalPlayer.Character
            if plr and plr:FindFirstChild("Head") then
                for _, h in ipairs(hoops:GetChildren()) do
                    h.CFrame = plr.Head.CFrame
                end
                task.wait(0.4)
                for _, h in pairs(hoops:GetChildren()) do
                    h.Position = Vector3.new(0,0,0)
                end
            end
            task.wait(0.6)
        end
    end)
end

local function StartAutoStep()
    task.spawn(function()
        while AutoStep do
            pcall(function()
                game:GetService("ReplicatedStorage").rEvents.stepEvent:FireServer("addStep")
            end)
            task.wait(0.05)
        end
    end)
end

local function StartAutoBestPets()
    task.spawn(function()
        while AutoBestPets do
            pcall(function()
                game:GetService("ReplicatedStorage").rEvents.petEquipEvent:FireServer("best")
            end)
            task.wait(5)
        end
    end)
end

-----------------------------------------------------
-- TABS
-----------------------------------------------------

local Main = Window:Tab({ Title = "Main", Icon = "home" })
local Teleport = Window:Tab({ Title = "Teleports", Icon = "map" })
local Settings = Window:Tab({ Title = "Settings", Icon = "settings" })

-----------------------------------------------------
-- MAIN TAB
-----------------------------------------------------

Main:Toggle({
    Title = "Auto Orb",
    Icon = "sparkles",
    Desc = "Coleta orbs automaticamente",
    Value = false,
    Callback = function(v)
        AutoOrb = v
        if v then StartAutoOrb() end
    end
})

Main:Slider({
    Title = "Orb Delay",
    Desc = "Tempo entre coletas",
    Step = 0.01,
    Value = { Min = 0.01, Max = 1, Default = 0.1 },
    Callback = function(v) OrbDelay = v end
})

Main:Slider({
    Title = "Orb Multiplier",
    Desc = "Quantidade de coletas por ciclo",
    Step = 1,
    Value = { Min = 1, Max = 20, Default = 1 },
    Callback = function(v) OrbMultiplier = v end
})

Main:Toggle({
    Title = "Auto Rebirth",
    Icon = "refresh-cw",
    Desc = "Renascimento automático",
    Value = false,
    Callback = function(v)
        autoRebirth = v
        if v then StartAutoRebirth() end
    end
})

Main:Toggle({
    Title = "Auto Race",
    Icon = "flag",
    Desc = "Entra nas corridas automaticamente",
    Value = false,
    Callback = function(v)
        autoRace = v
        if v then StartAutoRace() end
    end
})

Main:Toggle({
    Title = "Auto Hoops",
    Icon = "circle",
    Desc = "Teleporta hoops para você",
    Value = false,
    Callback = function(v)
        autoHoops = v
        if v then StartAutoHoops() end
    end
})

Main:Toggle({
    Title = "Auto Step",
    Desc = "Ganha Steps automaticamente",
    Icon = "zap",
    Value = false,
    Callback = function(v)
        AutoStep = v
        if v then StartAutoStep() end
    end
})

Main:Toggle({
    Title = "Auto Equip Best Pets",
    Desc = "Equipe automaticamente os melhores pets",
    Icon = "paw-print",
    Value = false,
    Callback = function(v)
        AutoBestPets = v
        if v then StartAutoBestPets() end
    end
})

Main:Button({
    Title = "Redeem Codes",
    Desc = "Resgata todos os códigos",
    Icon = "ticket",
    Callback = function()
        local remote = game:GetService("ReplicatedStorage").rEvents.codeRemote
        remote:InvokeServer("speedchampion000")
        remote:InvokeServer("SPRINT250")
        remote:InvokeServer("hyper250")
        remote:InvokeServer("legends500")
        remote:InvokeServer("sparkles300")
        remote:InvokeServer("Launch200")

        WindUI:Notify({
            Title = "Codes",
            Content = "Todos os códigos foram usados!",
            Duration = 3,
            Icon = "check"
        })
    end
})

-----------------------------------------------------
-- TELEPORTES
-----------------------------------------------------

local Areas = {
    Jungle  = CFrame.new(1361,26,12878),
    Magma   = CFrame.new(-11053,218,4904),
    City    = CFrame.new(-9684,60,3093),
    Highway = CFrame.new(-13097,218,5913)
}

for name, cf in pairs(Areas) do
    Teleport:Button({
        Title = name,
        Icon = "map-pin",
        Callback = function()
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = cf end
        end
    })
end

-----------------------------------------------------
-- SETTINGS
-----------------------------------------------------

Settings:Button({
    Title = "Unload UI",
    Icon = "door-open",
    Desc = "Fecha a interface",
    Callback = function()
        WindUI:Unload()
    end
})

-----------------------------------------------------
-- ANTI-AFK & ANTI-KICK
-----------------------------------------------------

for _,v in ipairs(getconnections(game.Players.LocalPlayer.Idled)) do
    v:Disable()
end

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall

mt.__namecall = function(self,...)
    local m = getnamecallmethod()
    if m == "Kick" or m == "kick" then
        return warn("AntiKick bloqueado.")
    end
    return old(self,...)
end

print("LegendHub WindUI Loaded ✔")