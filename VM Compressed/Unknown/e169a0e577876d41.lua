--------------------------------------------------
-- Rayfield UI
--------------------------------------------------
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "⚡ Surfing and Slide",
    LoadingTitle = "Loading please wait",
    LoadingSubtitle = "Tensura Hub",
    ConfigurationSaving = { Enabled = false }
})

--------------------------------------------------
-- Services
--------------------------------------------------
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------
-- VARIABLES
--------------------------------------------------
local AntiLag = false
local AntiKick = false
local AutoRace = false
local AutoWin = false

--------------------------------------------------
-- FUNCTIONS
--------------------------------------------------
local function EnableAntiLag()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
            v.CastShadow = false
        elseif v:IsA("Decal") or v:IsA("Texture") then
            v:Destroy()
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then
            v.Enabled = false
        end
    end
    settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
end

local oldNamecall
local function EnableAntiKick()
    if oldNamecall then return end
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        if getnamecallmethod() == "Kick" then
            return
        end
        return oldNamecall(self, ...)
    end)
end

--------------------------------------------------
-- TAB: Performance
--------------------------------------------------
local PerfTab = Window:CreateTab("⚡ Performance", 4483362458)

PerfTab:CreateToggle({
    Name = "Anti-Lag (Mobile FPS Boost)",
    CurrentValue = false,
    Callback = function(Value)
        AntiLag = Value
        if AntiLag then
            EnableAntiLag()
        end
    end
})

--------------------------------------------------
-- TAB: Protection
--------------------------------------------------
local ProtectTab = Window:CreateTab("🛡 Protection", 4483362458)

ProtectTab:CreateToggle({
    Name = "Anti-Kick",
    CurrentValue = false,
    Callback = function(Value)
        AntiKick = Value
        if AntiKick then
            EnableAntiKick()
        end
    end
})

--------------------------------------------------
-- TAB: Eggs
--------------------------------------------------
local EggTab = Window:CreateTab("🥚 Eggs", 4483362458)

EggTab:CreateParagraph({
    Title = "Notice",
    Content = "For smoother gameplay and reduced lag, it is recommended to rejoin the server after buying pets. This helps keep performance stable and prevents issues."
})

EggTab:CreateButton({
    Name = "Buy Best Egg (15B)",
    Callback = function()
        for i = 1, 30 do
            ReplicatedStorage
                :WaitForChild("Remote")
                :WaitForChild("Egg")
                :FireServer("TryOpenEgg", "Egg12", 1)
            task.wait(0.15)
        end

        Rayfield:Notify({
            Title = "Finished",
            Content = "Egg buying complete. Rejoining is recommended for best performance.",
            Duration = 4
        })
    end
})

--------------------------------------------------
-- TAB: Race
--------------------------------------------------
local RaceTab = Window:CreateTab("🏁 Race", 4483362458)

RaceTab:CreateToggle({
    Name = "Auto Race",
    CurrentValue = false,
    Callback = function(Value)
        AutoRace = Value
        task.spawn(function()
            while AutoRace do
                ReplicatedStorage
                    :WaitForChild("Remote")
                    :WaitForChild("Race")
                    :FireServer("StartRace")
                task.wait(1)
            end
        end)
    end
})

RaceTab:CreateToggle({
    Name = "Auto Win",
    CurrentValue = false,
    Callback = function(Value)
        AutoWin = Value

        -- Smart dependency: Auto Win requires Auto Race
        if AutoWin and not AutoRace then
            AutoRace = true
        end

        task.spawn(function()
            while AutoWin do
                ReplicatedStorage
                    :WaitForChild("Remote")
                    :WaitForChild("Race")
                    :FireServer("GetWin")

                ReplicatedStorage
                    :WaitForChild("Remote")
                    :WaitForChild("Race")
                    :FireServer("EndRace")

                task.wait(0.3)
            end
        end)
    end
})

--------------------------------------------------
-- TAB: Rejoin
--------------------------------------------------
local RejoinTab = Window:CreateTab("🔄 Rejoin", 4483362458)

RejoinTab:CreateButton({
    Name = "Rejoin with Anti-Lag",
    Callback = function()
        EnableAntiLag()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

RejoinTab:CreateButton({
    Name = "Rejoin with Anti-Lag + Anti-Kick",
    Callback = function()
        EnableAntiLag()
        EnableAntiKick()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end
})

--------------------------------------------------
-- TAB: Daily
--------------------------------------------------
local DailyTab = Window:CreateTab("🎁 Daily", 4483362458)

DailyTab:CreateToggle({
    Name = "Auto Claim Daily",
    CurrentValue = false,
    Callback = function(Value)
        task.spawn(function()
            while Value do
                ReplicatedStorage
                    :WaitForChild("Remote")
                    :WaitForChild("Daily")
                    :FireServer("TryClaim")
                task.wait(5)
            end
        end)
    end
})

--------------------------------------------------
-- END
--------------------------------------------------
Rayfield:Notify({
    Title = "Loaded",
    Content = "Tensura Hub Ready 🔥",
    Duration = 5
})
