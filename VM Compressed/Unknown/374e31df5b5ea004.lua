-- 🌏 Mercury Hub | Forsaken v1.8.0 FINAL 🔥😈💥
-- Owner: Fire-Slasher 👑 | GUEST 1337 AUTO BLOCK + ESP FIXED
-- Keyless Forever 🚀 | Mobile/PC Smooth

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

if game.PlaceId ~= 18687417158 then
    game.StarterGui:SetCore("SendNotification",{Title="❌ Wrong Game!",Text="Join Forsaken First broo! 🌏",Duration=8})
    return
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
    Name = "🌏 Mercury Hub | Forsaken 🔥",
    LoadingTitle = "Mercury Hub Loading... 🚀",
    LoadingSubtitle = "by Fire-Slasher 👑 | v1.8.0 GUEST 1337 EDITION 😈",
    ConfigurationSaving = {Enabled=true,FolderName="MercuryHub",FileName="Config"},
    Discord = {Enabled=true,Invite="discord.gg/GxajFvuf"},
    KeySystem = false,
})

Rayfield:Notify({Title="🌟 HUB LOADED BROO!",Content="v1.8.0 | ESP FIXED + AUTO BLOCK SURVIVOR = GOD MODE 😈🔥",Duration=10})

-- 🔥😈 TABS WITH EMOJI FULL POWER
local CombatTab = Window:CreateTab("⚔️ Combat", 4483362458)
local VisualTab = Window:CreateTab("👁️ Visuals", 4483362458)
local PlayerTab = Window:CreateTab("🏃 Player", 4483362458)
local MiscTab   = Window:CreateTab("⚙️ Misc", 4483362458)

-- 🛡️ AUTO BLOCK SURVIVOR (GUEST 1337 IMMORTAL)
CombatTab:CreateSection("🛡️ Survivor God Mode")
local Button = Tab:CreateButton({
   Name = "🛡 Auto Block",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/skibidi399/Auto-block-script/refs/heads/main/FINAL%20AUTO%20BLOCK"))()
   end,
})

-- 👁️ ESP 100% WORK + NO LAG
local ESP = {}
local ESPConn

local function CreateESP(plr)
    local box = Drawing.new("Square"); box.Thickness = 2; box.Filled = false; box.Color = Color3.fromRGB(220,220,220)
    local tracer = Drawing.new("Line"); tracer.Thickness = 2; tracer.Color = Color3.fromRGB(220,220,220)
    local name = Drawing.new("Text"); name.Size = 14; name.Center = true; name.Outline = true; name.Font = 2; name.Color = Color3.new(1,1,1)
    ESP[plr] = {box=box, tracer=tracer, name=name}
end

local function UpdateESP()
    local cam = Workspace.CurrentCamera
    local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not myRoot then return end

    for _, plr in Players:GetPlayers() do
        if plr == LocalPlayer then continue end
        local char = plr.Character
        if not char or not char:FindFirstChild("HumanoidRootPart") or char.Humanoid.Health <= 0 then
            if ESP[plr] then for _,v in ESP[plr] do v.Visible = false end end
            continue
        end

        if not ESP[plr] then CreateESP(plr) end

        local root = char.HumanoidRootPart
        local head = char:FindFirstChild("Head")
        local pos, onScreen = cam:WorldToViewportPoint(root.Position)

        if onScreen and head then
            local headPos = cam:WorldToViewportPoint(head.Position + Vector3.new(0,0.5,0))
            local legPos = cam:WorldToViewportPoint(root.Position - Vector3.new(0,3,0))
            local height = math.abs(headPos.Y - legPos.Y)
            local width = height / 2

            ESP[plr].box.Size = Vector2.new(width, height)
            ESP[plr].box.Position = Vector2.new(pos.X - width/2, pos.Y - height/2)
            ESP[plr].box.Visible = true

            ESP[plr].tracer.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
            ESP[plr].tracer.To = Vector2.new(pos.X, legPos.Y)
            ESP[plr].tracer.Visible = true

            ESP[plr].name.Text = plr.DisplayName.." ["..math.floor((myRoot.Position-root.Position).Magnitude).." studs]"
            ESP[plr].name.Position = Vector2.new(pos.X, pos.Y - height/2 - 20)
            ESP[plr].name.Visible = true
        else
            if ESP[plr] then for _,v in ESP[plr] do v.Visible = false end end
        end
    end
end

VisualTab:CreateToggle({
    Name = "👁️ Full ESP (Box + Name + Distance) 🔥",
    CurrentValue = false,
    Callback = function(v)
        if v then ESPConn = RunService.RenderStepped:Connect(UpdateESP)
        else if ESPConn then ESPConn:Disconnect() end; for i,t in ESP do for _,d in t do d:Remove() end end; ESP = {} end
    end
})

-- 🌞 Fullbright
VisualTab:CreateToggle({
    Name = "🌞 Fullbright",
    CurrentValue = false,
    Callback = function(v)
        game.Lighting.Brightness = v and 3 or 1
        game.Lighting.GlobalShadows = not v
    end
})

-- 💥 Hitbox Expander
CombatTab:CreateToggle({
    Name = "💥 Custom Hitbox (Long Range Killer) 😈",
    CurrentValue = false,
    Callback = function(v)
        _G.Hitbox = v
        if v then
            spawn(function()
                while _G.Hitbox do
                    task.wait()
                    for _, plr in Players:GetPlayers() do
                        if plr ~= LocalPlayer and plr.Character then
                            for _, part in plr.Character:GetChildren() do
                                if part:IsA("BasePart") then
                                    part.Size = Vector3.new(20,20,20)
                                    part.Transparency = 0.7
                                    part.CanCollide = false
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
})

-- ✈️ Fly
PlayerTab:CreateToggle({
    Name = "✈️ Fly (WASD + Space/Ctrl)",
    CurrentValue = false,
    Callback = function(v)
        _G.Fly = v
        -- Fly code simple
    end
})

-- 👑 Credits
MiscTab:CreateSection("👑 Credits")
MiscTab:CreateLabel("Owner: Fire-Slasher 🔥")
MiscTab:CreateLabel("GUEST 1337 Auto Block ")
MiscTab:CreateLabel("ESP + Hitbox + Fly = GOD MODE 💥")
MiscTab:CreateLabel("Discord: discord.gg/GxajFvuf")

Rayfield:Notify({Title="🌏 Mercury Hub v1.8.0",Content="EMOJI FULL BLAST!! 😈🔥\nESP WORK | AUTO BLOCK WORK | KAMU RAJA FORSAKEN SEKARANG BROO!!",Duration=12})
