-- Load Compkiller UI Library
local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()

-- Loader Animation
Compkiller:Loader("rbxassetid://120245531583106", 2.5).yield()

-- Create Notification system
local Notifier = Compkiller.newNotify()

-- Create Window
local Window = Compkiller.new({
    Name = "The Great Caua x CompKiller",
    Keybind = "RightShift",
    Logo = "rbxassetid://120245531583106",
    Scale = Compkiller.Scale.Window,
    TextSize = 15,
})

-- Watermark
local Watermark = Window:Watermark()
Watermark:AddText({ Icon = "user", Text = "The Great Caua" })
Watermark:AddText({ Icon = "clock", Text = Compkiller:GetDate() })
local TimeText = Watermark:AddText({ Icon = "timer", Text = "TIME" })
task.spawn(function()
    while true do
        task.wait(1)
        TimeText:SetText(Compkiller:GetTimeNow())
    end
end)
Watermark:AddText({ Icon = "server", Text = Compkiller.Version })

-- Executor Detection
local function getExecutor()
    local executorName = ""
    if syn then
        executorName = "Synapse X"
    elseif getexecutorname then
        executorName = getexecutorname()
    elseif isexecutorattached then
        executorName = "Krnl"
    end
    return executorName
end

local executor = getExecutor()
if executor == "Solara" then
    game:GetService("Players").LocalPlayer:Kick("Solara will get support soon")

elseif executor == "Plutora" or executor == "JJSploit" then
    game:GetService("Players").LocalPlayer:Kick("Plutora/JJSploit is too weak")
end

-- Teleport Tab
local TeleportTab = Window:DrawTab({
    Name = "Teleport Locations",
    Icon = "map",
    Type = "Single"
})
local TeleportSection = TeleportTab:DrawSection({ Name = "Locations", Position = "left" })

local locations = {
    Apatite = Vector3.new(-466, -110, 205),
    Serpentine = Vector3.new(-167, -231, 1060),
    Volcano = Vector3.new(729, 13, 668),
    Waterfall = Vector3.new(102, 21, 584)
}

for name, position in pairs(locations) do
    TeleportSection:AddButton({
        Name = name,
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(position + Vector3.new(0, 4, 0))
            end
        end
    })
end

TeleportSection:AddButton({
    Name = "Rejoin",
    Callback = function()
        local player = game.Players.LocalPlayer
        game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, player)
    end
})

-- Combat Tab
local CombatTab = Window:DrawTab({
    Name = "Combat",
    Icon = "crosshair",
    Type = "Single"
})
local CombatSection = CombatTab:DrawSection({ Name = "PvP Tools", Position = "left" })

CombatSection:AddButton({
    Name = "Aimlock",
    Callback = function()
        local player = game.Players.LocalPlayer
        local closestPlayer = nil
        local shortestDistance = math.huge
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local distance = (v.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                if distance < shortestDistance then
                    shortestDistance = distance
                    closestPlayer = v
                end
            end
        end
        if closestPlayer then
            local cam = workspace.CurrentCamera
            cam.CFrame = CFrame.new(cam.CFrame.Position, closestPlayer.Character.HumanoidRootPart.Position)
        end
    end
})

CombatSection:AddButton({
    Name = "Hitbox Extender",
    Callback = function()
        for _, v in pairs(game.Players:GetPlayers()) do
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local hrp = v.Character.HumanoidRootPart
                hrp.Size = Vector3.new(10, 10, 10)
                hrp.Transparency = 0.5
                hrp.CanCollide = false
            end
        end
    end
})

-- Combat Teleport to Player
local CombatTeleportSection = CombatTab:DrawSection({ Name = "Teleport to Player", Position = "right" })
local targetPlayer = nil
local toggleTeleport = false
CombatTeleportSection:AddDropdown({
    Name = "Select Player",
    Options = function()
        local plrs = {}
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer then
                table.insert(plrs, p.Name)
            end
        end
        return plrs
    end,
    Callback = function(val)
        targetPlayer = game.Players:FindFirstChild(val)
    end
})
CombatTeleportSection:AddToggle({
    Name = "Teleport Over Player",
    Callback = function(val)
        toggleTeleport = val
        task.spawn(function()
            while toggleTeleport do
                task.wait(0.1)
                if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    local hrp = targetPlayer.Character.HumanoidRootPart
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = hrp.CFrame + Vector3.new(0,5,0)
                end
            end
        end)
    end
})

-- Auto Tab
local AutoTab = Window:DrawTab({ Name = "Auto", Icon = "settings-2", Type = "Single" })
local AutoSection = AutoTab:DrawSection({ Name = "Auto Features", Position = "left" })

AutoSection:AddButton({
    Name = "Farm Spinel",
    Callback = function()
        -- Custom farming logic here
    end,
    Description = "Auto get key, find island and hop server to get unlimited Spinel"
})

AutoSection:AddButton({
    Name = "Full Health",
    Callback = function()
        -- Full health logic
    end
})

AutoSection:AddButton({
    Name = "Auto Water",
    Callback = function()
        -- Auto refill water at 39%
    end
})

AutoSection:AddButton({
    Name = "Auto Food",
    Callback = function()
        -- Auto refill food at 39%
    end
})

AutoSection:AddSlider({
    Name = "Speed Boost",
    Min = 16,
    Max = 100,
    Default = 16,
    Callback = function(val)
        if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
        end
    end
})

-- Olivine Tab
local OlivineTab = Window:DrawTab({ Name = "Olivine", Icon = "anchor", Type = "Single" })
local OlivineSection = OlivineTab:DrawSection({ Name = "Olivine Tools", Position = "left" })
OlivineSection:AddButton({
    Name = "Bypass Noclip & Auto Pull Lever",
    Callback = function()
        -- Logic for noclip & lever pull
    end
})

-- Settings Tab
local SettingsTab = Window:DrawTab({ Name = "Settings", Icon = "settings-3", Type = "Single" })
local SettingsSection = SettingsTab:DrawSection({ Name = "General", Position = "left" })
SettingsSection:AddParagraph({
    Title = "Settings Info",
    Content = "Future settings can be added here."
})

-- Notifier
Notifier.new({
    Title = "Welcome",
    Content = "The Great Caua script loaded successfully! To close UI click CK Compkiller on Top right corner",
    Duration = 5,
    Icon = "rbxassetid://120245531583106"
})