-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

-- ReGui
local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua"))()
local PrefabsId = "rbxassetid://71968920594655"

ReGui:Init({
    Prefabs = game:GetService("InsertService"):LoadLocalAsset(PrefabsId)
})

local Window = ReGui:TabsWindow({
    Title = "Animal Simulator SOLIN HUB",
    Size = UDim2.new(0, 400, 0, 400),
}):Center()

-- REMOTES
local attackRemote = ReplicatedStorage:WaitForChild("jdskhfsIIIllliiIIIdchgdIiIIIlIlIli")
local skillsRemote = ReplicatedStorage:WaitForChild("SkillsInRS"):WaitForChild("RemoteEvent")

-- FOLDERS
local map = Workspace:WaitForChild("MAP")
local dummiesFolder = map:WaitForChild("dummies")
local folder5k = map:FindFirstChild("5k_dummies")
local bossesList = { "ROCKY","Griffin","BOOSBEAR","BOSSDEER","CENTAUR","CRABBOSS","DragonGiraffe","LavaGorilla" }

-- FLAGS
local AF = { coins=false, bosses=false, dummies=false, dummies5k=false, tpDummy=false, tpDummy5k=false }
local PVP = { killAura=false }

-- UTILS
local function getCharacter()
    local c = player.Character or player.CharacterAdded:Wait()
    return c, c:WaitForChild("Humanoid"), c:WaitForChild("HumanoidRootPart")
end

local function getAliveHumanoid(model)
    local hum = model and model:FindFirstChildOfClass("Humanoid")
    if hum and hum.Health > 0 then return hum end
end

local function findDummy(folder)
    for _, d in ipairs(folder:GetChildren()) do
        local hum = getAliveHumanoid(d)
        if hum then return d, hum end
    end
end

-- AUTO FARM FUNCTIONS
local function autoCoins()
    while AF.coins do
        local events = ReplicatedStorage:FindFirstChild("Events")
        local coinEvent = events and events:FindFirstChild("CoinEvent")
        if coinEvent then coinEvent:FireServer() end
        task.wait(1)
    end
end

local function attackLoop(flag, folder)
    while AF[flag] do
        local dummy, hum = findDummy(folder)
        if dummy and hum and dummy:FindFirstChild("HumanoidRootPart") then
            local pos = dummy.HumanoidRootPart.Position
            attackRemote:FireServer(hum, 2)
            skillsRemote:FireServer(pos, "NewFireball")
            skillsRemote:FireServer(pos, "NewLightningball")
        end
        task.wait(0.05)
    end
end

local function farmBosses()
    while AF.bosses do
        local npcFolder = Workspace:FindFirstChild("NPC")
        if npcFolder then
            for _, name in ipairs(bossesList) do
                local boss = npcFolder:FindFirstChild(name)
                local hum = getAliveHumanoid(boss)
                if hum then attackRemote:FireServer(hum, 5) end
            end
        end
        task.wait(1)
    end
end

-- PVP FUNCTIONS
local function killAuraLoop()
    while PVP.killAura do
        local _, _, hrp = getCharacter()
        local closest = nil
        local shortest = math.huge
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (p.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
                if dist < shortest then
                    shortest = dist
                    closest = p
                end
            end
        end
        if closest then
            attackRemote:FireServer(closest.Character:FindFirstChildOfClass("Humanoid"), 1)
        end
        task.wait(0.1)
    end
end

-- FIREBALL TOOL
local function giveFireball()
    if player.Backpack:FindFirstChild("Fireball") or player.Character:FindFirstChild("Fireball") then
        return
    end
    local tool = Instance.new("Tool")
    tool.Name = "Fireball"
    tool.RequiresHandle = false
    tool.CanBeDropped = false
    tool.ManualActivationOnly = false
    tool.Parent = player:FindFirstChildOfClass("Backpack") or player.Backpack

    local mouse = player:GetMouse()
    tool.Activated:Connect(function()
        if skillsRemote then
            skillsRemote:FireServer(mouse.Hit.Position, "NewFireball")
        end
    end)
end

giveFireball()
player.CharacterAdded:Connect(function()
    task.wait(1)
    giveFireball()
end)

-- UI: FARM TAB
local FarmTab = Window:CreateTab({ Name = "Farm" })
FarmTab:Checkbox({ Value=false, Label="Auto Coins", Callback=function(self, Value) AF.coins=Value if Value then task.spawn(autoCoins) end end})
FarmTab:Checkbox({ Value=false, Label="Auto Dummy", Callback=function(self, Value) AF.dummies=Value if Value then task.spawn(function() attackLoop("dummies", dummiesFolder) end) end end})
FarmTab:Checkbox({ Value=false, Label="Auto Dummy 5k", Callback=function(self, Value) AF.dummies5k=Value if Value then task.spawn(function() attackLoop("dummies5k", folder5k) end) end end})
FarmTab:Checkbox({ Value=false, Label="Auto Bosses", Callback=function(self, Value) AF.bosses=Value if Value then task.spawn(farmBosses) end end})
FarmTab:Checkbox({ Value=false, Label="TP to Dummy", Callback=function(self, Value) AF.tpDummy=Value end})
FarmTab:Checkbox({ Value=false, Label="TP to Dummy 5k", Callback=function(self, Value) AF.tpDummy5k=Value end})

-- UI: PvP TAB
local PvPTab = Window:CreateTab({ Name = "PvP" })
PvPTab:Checkbox({ Value=false, Label="Kill Aura", Callback=function(self, Value) PVP.killAura=Value if Value then task.spawn(killAuraLoop) end end})

-- UI: Troll TAB
local TrollTab = Window:CreateTab({ Name = "Troll" })
TrollTab:Label({ Text = "Coming Soon..." })

-- UI: Skin / Events TAB
local SkinEventsTab = Window:CreateTab({ Name = "Skin / Events" })
SkinEventsTab:Label({ Text = "Coming Soon..." })

-- UI: Miscellaneous TAB
local MiscTab = Window:CreateTab({ Name = "Miscellaneous" })
MiscTab:Label({ Text = "Coming Soon..." })

-- UI: Webhook TAB
local WebhookTab = Window:CreateTab({ Name = "Webhook" })
WebhookTab:Label({ Text = "Coming Soon..." })

-- UI: Settings TAB
local SettingsTab = Window:CreateTab({ Name = "Settings" })
SettingsTab:Label({ Text = "[V] Toggle UI remove sound and GUI of reward" })
SettingsTab:Label({ Text = "if you have a problem please join in our discord support link server: https://discord.gg/4tH9dxBK" })

-- UI: Script TAB
local ScriptTab = Window:CreateTab({ Name = "Script" })
ScriptTab:Label({ Text = "Coming Soon..." })

-- UI: Read Me TAB
local ReadMeTab = Window:CreateTab({ Name = "Read Me" })
ReadMeTab:Label({ Text = "• This UI library was created by depso. Thanks.\n• Owner Of Script: Solin\n• Script & Management By: awb04" })

-- SAFE CHECK & UNIFIED TP
RunService.RenderStepped:Connect(function()
    local _, _, hrp = getCharacter()
    local targetDummy
    if AF.tpDummy5k and folder5k then
        targetDummy = findDummy(folder5k)
    elseif AF.tpDummy then
        targetDummy = findDummy(dummiesFolder)
    end
    if targetDummy and targetDummy[1] and targetDummy[1]:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame = targetDummy[1].HumanoidRootPart.CFrame + Vector3.new(0,0,4)
    end
end)
