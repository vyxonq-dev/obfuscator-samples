-- [[ 1. ADIM: Gelatek Config Ayarları ]] --
local Global = (getgenv and getgenv()) or shared
Global.GelatekReanimateConfig = {
    ["AnimationsDisabled"] = true, 
    ["R15ToR6"] = false,
    ["DontBreakHairWelds"] = false,
    ["PermanentDeath"] = false,
    ["Headless"] = false, 
    ["TeleportBackWhenVoided"] = false,
    ["AlignReanimate"] = false,
    ["FullForceAlign"] = false,
    ["FasterHeartbeat"] = false,
    ["DynamicalVelocity"] = false,
    ["DisableTweaks"] = false,
    ["OptimizeGame"] = false,
    ["LoadLibrary"] = false,
    ["DetailedCredits"] = false,
    ["TorsoFling"] = true,
    ["BulletEnabled"] = true,
    ["BulletConfig"] = {
        ["RunAfterReanimate"] = true,
        ["LockBulletOnTorso"] = true
    }
}

-- [[ 2. ADIM: Reanimate Scriptini Yükle ]] --
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()

-- [[ 3. ADIM: 5 SANİYE BEKLEME VE TANIMLAMALAR ]] --
task.wait(5) -- Reanimate'in tam oturması için 5 saniye bekliyor

local rs = game:GetService("RunService")
local lp = game.Players.LocalPlayer
local char = workspace:FindFirstChild("GelatekReanimate") or lp.Character
local hum = char:WaitForChild("Humanoid")

-- Matematiksel Fonksiyonlar ve Değişkenler
local sine = 0
local cf = CFrame.new
local angles = CFrame.Angles
local sin = math.sin

-- cfMul (Senin kodundaki CFrame çarpımı için)
local function cfMul(c1, c2)
    return c1 * c2
end

-- Varsayılan Roblox animasyonlarını durdur
pcall(function()
    local oldAnimate = char:FindFirstChild("Animate")
    if oldAnimate then oldAnimate:Destroy() end
    for _, v in pairs(hum:GetPlayingAnimationTracks()) do v:Stop() end
end)

-- [[ 4. ADIM: ÖZEL MATEMATİKSEL ANİMASYON DÖNGÜSÜ ]] --
rs.RenderStepped:Connect(function(dt)
    -- Karakter kontrolü
    if not char or not char.Parent then 
        char = workspace:FindFirstChild("GelatekReanimate") or lp.Character
        return 
    end
    
    sine = sine + dt
    local deltaTime = 0.2 -- Yumuşatma hızı (Lerp)

    pcall(function()
        local torso = char:FindFirstChild("Torso")
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not torso or not rootPart then return end
        
        -- Eklem Tanımlamaları (İstediğin formatta)
        local Neck = torso:FindFirstChild("Neck")
        local Root_J = rootPart:FindFirstChild("RootJoint")
        local Arm_R = torso:FindFirstChild("Right Shoulder")
        local Arm_L = torso:FindFirstChild("Left Shoulder")
        local Leg_R = torso:FindFirstChild("Right Hip")
        local Leg_L = torso:FindFirstChild("Left Hip")
        local Acc_Weld = char:FindFirstChild("AccessoryWeld", true)

        -- --- SENİN VERDİĞİN ÖZEL KODLARIN UYGULANMASI ---
        
        -- Sağ Kol (Arm_R)
        if Arm_R then
            Arm_R.C0 = Arm_R.C0:Lerp(cfMul(cf(0.9, 0.5, 0), angles(2.6179938779914944, 15.865042900628456, 0)), deltaTime)
        end

        -- Sol Kol (Arm_L)
        if Arm_L then
            Arm_L.C0 = Arm_L.C0:Lerp(cfMul(cf(-1.2, 0.5, 0), angles(2.443460952792061, -0.6981317007977318, 0)), deltaTime)
        end

        -- Boyun (Neck) + Glitch/Titreme Efekti (sine*999)
        if Neck then
            Neck.C0 = Neck.C0:Lerp(cfMul(cf(0, 1, 0), angles(-1.5707963267948966 + 2.1467549799530254 * sin(sine * 999), 0, 3.141592653589793)), deltaTime)
        end

        -- Gövde (Root_J)
        if Root_J then
            Root_J.C0 = Root_J.C0:Lerp(cfMul(cf(0, 2, 0), angles(-1.5707963267948966, 0, 3.141592653589793)), deltaTime)
        end

        -- Sol Bacak (Leg_L)
        if Leg_L then
            Leg_L.C0 = Leg_L.C0:Lerp(cfMul(cf(-1, -1, 0), angles(0, -1.5707963267948966 - 0.3490658503988659 * sin(sine * 1), 0)), deltaTime)
        end

        -- Sağ Bacak (Leg_R)
        if Leg_R then
            Leg_R.C0 = Leg_R.C0:Lerp(cfMul(cf(1, -1, 0), angles(0, 1.5707963267948966 + 0.3490658503988659 * sin(sine * 1), 0)), deltaTime)
        end

        -- Aksesuar Kaynağı (Eğer varsa)
        if Acc_Weld then
            Acc_Weld.C0 = Acc_Weld.C0:Lerp(cf(8.657480066176504e-09, 0.34999990463256836, 0.2497277557849884), deltaTime)
        end
    end)
end)
