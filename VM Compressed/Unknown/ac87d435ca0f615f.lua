local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "★ EROBIT - V20 FINAL ★",
   LoadingTitle = "🎵 MUSIC HUB RESTORED ⚡",
   LoadingSubtitle = "by EroBit - Nur funktionierende Sektionen",
   ConfigurationSaving = { Enabled = false }
})

-- SERVICES
local player = game.Players.LocalPlayer
local camera = workspace.CurrentCamera
local runService = game:GetService("RunService")
local userInput = game:GetService("UserInputService")

-- SETTINGS
_G.WalkSpeed = 16
_G.FlySpeed = 50
_G.Flying = false
_G.NoClip = false
_G.LoopSound = false
local CurrentSound = nil

-- ==========================================
-- MOVEMENT TAB
-- ==========================================
local MoveTab = Window:CreateTab("Movement", 4483362458)

MoveTab:CreateToggle({
    Name = "Fly V3", 
    CurrentValue = false, 
    Callback = function(v) 
        _G.Flying = v 
        local char = player.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local root = char.HumanoidRootPart
            if v then
                local bg = Instance.new("BodyGyro", root); bg.Name = "FlyGyro"; bg.P = 9e4; bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9); bg.CFrame = root.CFrame
                local bv = Instance.new("BodyVelocity", root); bv.Name = "FlyVelocity"; bv.Velocity = Vector3.new(0,0,0); bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                char.Humanoid.PlatformStand = true
            else
                if root:FindFirstChild("FlyGyro") then root.FlyGyro:Destroy() end
                if root:FindFirstChild("FlyVelocity") then root.FlyVelocity:Destroy() end
                char.Humanoid.PlatformStand = false
            end
        end
    end
})

MoveTab:CreateSlider({Name = "Speed", Range = {16, 500}, Increment = 5, CurrentValue = 50, Callback = function(v) _G.WalkSpeed = v _G.FlySpeed = v end})
MoveTab:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(v) _G.NoClip = v end})

-- ==========================================
-- 🎵 MUSIC HUB
-- ==========================================
local MusicTab = Window:CreateTab("Music Hub", 4483362458)

local function play(id)
    if CurrentSound then CurrentSound:Stop(); CurrentSound:Destroy() end
    local s = Instance.new("Sound", game:GetService("SoundService"))
    s.SoundId = "rbxassetid://" .. tostring(id):gsub("%D", "")
    s.Volume = 5
    s.Looped = _G.LoopSound
    s:Play()
    CurrentSound = s
end

MusicTab:CreateSection("📥 Insert Manual ID")
MusicTab:CreateInput({
    Name = "Test any ID",
    PlaceholderText = "ID hier einfügen...",
    Callback = function(Text) play(Text) end
})

MusicTab:CreateButton({Name = "⛔ STOP ALL", Callback = function() if CurrentSound then CurrentSound:Stop(); CurrentSound:Destroy(); CurrentSound = nil end end})

-- PHONK SEKTION
MusicTab:CreateSection("⚡ Phonk")
local pList = {
    ["Metamorphosis V2"] = "15689451063",
    ["Sahara (Hard)"] = "15689445424",
    ["Keraunos (Fixed)"] = "17422168798"
}
for n, id in pairs(pList) do MusicTab:CreateButton({Name = "⚡ "..n, Callback = function() play(id) end}) end

-- FUNK SEKTION
MusicTab:CreateSection("🔥 Funk")
local fList = {
    ["Funk Do Boom"] = "128275554636610",
    ["Slowed Funk"] = "123047130884626",
    ["Bass Boosted"] = "101241740024903"
}
for n, id in pairs(fList) do MusicTab:CreateButton({Name = "🔥 "..n, Callback = function() play(id) end}) end

-- OTTOMAN BASS
MusicTab:CreateSection("🌙 Ottoman Bass")
local tList = {
    ["Ela (Hype Version)"] = "93666258819111",
    ["Fight Kulüp 2"] = "134366188285514",
    ["Derdim Olsun"] = "86802355429172"
}
for n, id in pairs(tList) do MusicTab:CreateButton({Name = "🌙 "..n, Callback = function() play(id) end}) end

-- ==========================================
-- ENGINE LOOP
-- ==========================================
runService.RenderStepped:Connect(function()
    local char = player.Character
    if char and char:FindFirstChild("Humanoid") then
        if not _G.Flying then char.Humanoid.WalkSpeed = _G.WalkSpeed end
        if _G.NoClip then
            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end
    
    if _G.Flying and char and char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("FlyVelocity") then
        local root = char.HumanoidRootPart
        local direction = Vector3.new(0,0,0)
        if userInput:IsKeyDown(Enum.KeyCode.W) then direction = direction + camera.CFrame.LookVector end
        if userInput:IsKeyDown(Enum.KeyCode.S) then direction = direction - camera.CFrame.LookVector end
        if userInput:IsKeyDown(Enum.KeyCode.A) then direction = direction - camera.CFrame.RightVector end
        if userInput:IsKeyDown(Enum.KeyCode.D) then direction = direction + camera.CFrame.RightVector end
        root.FlyVelocity.Velocity = direction * _G.FlySpeed
        root.FlyGyro.CFrame = camera.CFrame
    end
end)
