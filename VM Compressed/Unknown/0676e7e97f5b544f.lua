-- [[ THE GLITCHER ]] --
local Global = (getgenv and getgenv()) or shared
Global.GelatekReanimateConfig = {
    ["AnimationsDisabled"] = true, 
    ["R15ToR6"] = false,
    ["DontBreakHairWelds"] = false,
    ["PermanentDeath"] = false,
    ["Headless"] = false,
    ["TorsoFling"] = true,
    ["BulletEnabled"] = true,
    ["BulletConfig"] = {
        ["RunAfterReanimate"] = true,
        ["LockBulletOnTorso"] = true
    }
}

-- Reanimate Yükle
loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()

task.wait(5)

local rs = game:GetService("RunService")
local lp = game.Players.LocalPlayer
local sine = 0

-- [[ BILLBOARD GUI ]] --
local function CreateBillboard(parent)
    local bill = Instance.new("BillboardGui", parent)
    bill.Name = "GlitchBoard"
    bill.Size = UDim2.new(0, 250, 0, 60)
    bill.Adornee = parent
    bill.StudsOffset = Vector3.new(0, 3.5, 0)
    bill.AlwaysOnTop = true

    local lbl = Instance.new("TextLabel", bill)
    lbl.Size = UDim2.new(1, 0, 1, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = "THE GLITCHER"
    lbl.TextColor3 = Color3.new(1, 1, 1)
    lbl.TextStrokeTransparency = 0
    lbl.Font = Enum.Font.Code
    lbl.TextSize = 28
    return lbl
end

-- [[ ANA DÖNGÜ ]] --
rs.RenderStepped:Connect(function(dt)
    local char = workspace:FindFirstChild("GelatekReanimate") or lp.Character
    if not char or not char:FindFirstChild("Torso") then return end

    local head = char:FindFirstChild("Head")
    if head and not head:FindFirstChild("GlitchBoard") then
        CreateBillboard(head)
    end

    local success, err = pcall(function()
        local hum = char:FindFirstChildOfClass("Humanoid")
        local torso = char.Torso
        local neck = torso:FindFirstChild("Neck")
        local root = char.HumanoidRootPart:FindFirstChild("RootJoint")
        local r_arm = torso:FindFirstChild("Right Shoulder")
        local l_arm = torso:FindFirstChild("Left Shoulder")
        local r_leg = torso:FindFirstChild("Right Hip")
        local l_leg = torso:FindFirstChild("Left Hip")

        sine = sine + (dt * 20) -- Genel akış hızı
        local lerpSpeed = 0.12 -- Geçişleri daha da ağırlaştırdım
        local isWalking = hum.MoveDirection.Magnitude > 0
        local cf = CFrame.new
        local ang = CFrame.Angles
        local s = math.sin

        -- [[ BILLBOARD GLITCH ]] --
        if head and head:FindFirstChild("GlitchBoard") then
            local lbl = head.GlitchBoard.TextLabel
            if math.random(1, 15) > 12 then
                lbl.TextColor3 = Color3.fromRGB(math.random(50, 255), 0, 0)
                lbl.Position = UDim2.new(0, math.random(-8, 8), 0, math.random(-8, 8))
                lbl.Text = "TH3 GL1TC#ER"
            else
                lbl.TextColor3 = Color3.new(1, 1, 1)
                lbl.Position = UDim2.new(0, 0, 0, 0)
                lbl.Text = "THE GLITCHER"
            end
        end

        if isWalking then
            -- WALK (KAFA 99 / VÜCUT 0.3 - ÇOK YAVAŞ)
            if root then root.C0 = root.C0:Lerp(ang(-2.0943, 0, 3.1415), lerpSpeed) end
            if neck then neck.C0 = neck.C0:Lerp(cf(0, 1, 0) * ang(-1.5707 + 1.7453 * s(sine * 99), 0, 3.1415), lerpSpeed) end
            
            -- Bacaklar ve kollar iyice ağırlaştı
            if r_leg then r_leg.C0 = r_leg.C0:Lerp(cf(1, -1, 0) * ang(0.698 * s(sine * 0.3), 1.5707, 0), lerpSpeed) end
            if l_leg then l_leg.C0 = l_leg.C0:Lerp(cf(-1, -1, 0) * ang(-0.698 * s(sine * 0.3), -1.5707, 0), lerpSpeed) end
            if r_arm then r_arm.C0 = r_arm.C0:Lerp(cf(1, 0.5, 0) * ang(0.349, 1.5707, 0), lerpSpeed) end
            if l_arm then l_arm.C0 = l_arm.C0:Lerp(cf(-1, 0.5, 0) * ang(0.349, -1.5707, 0), lerpSpeed) end
        else
            -- IDLE (KAFA 99 / VÜCUT 0.2 - SÜZÜLME)
            if neck then neck.C0 = neck.C0:Lerp(cf(0, 1, 0) * ang(-1.5707 + 1.7453 * s(sine * 99), 0, 3.1415), lerpSpeed) end
            
            -- Kollar çok yavaş inip çıkıyor
            if r_arm then r_arm.C0 = r_arm.C0:Lerp(cf(1, 0.5 + 0.3 * s(sine * 0.2), 0) * ang(0.698, 1.5707, 0), lerpSpeed) end
            if l_arm then l_arm.C0 = l_arm.C0:Lerp(cf(-1, 0.5 + 0.3 * s(sine * 0.2), 0) * ang(0.698, -1.5707, 0), lerpSpeed) end
            if r_leg then r_leg.C0 = r_leg.C0:Lerp(cf(1, -1, 0) * ang(0.698, 1.5707, 0), lerpSpeed) end
            if l_leg then l_leg.C0 = l_leg.C0:Lerp(cf(-1, -1, 0) * ang(0.698, -1.5707, 0), lerpSpeed) end
        end
    end)
end)
--BY OLDHACAFRD !WARNED DO NOT PERMİSSONED TO CHSNGE OR EDİT !
