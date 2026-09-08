
loadstring(game:HttpGet("https://raw.githubusercontent.com/oldhacfard/The-script1/refs/heads/main/Luauscript.luau"))()
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 4623059912")
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-net")
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-sh")

game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("by oldhacfard lighting cannon")

--By oldhacfard my main acconut
wait("4")
local lp = game:GetService("Players").LocalPlayer
local rs = game:GetService("RunService")
local char = lp.Character

--Messge
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("-gh 4623059912")

-- Orijinal animasyonları durdur
local hum = char:WaitForChild("Humanoid")
local animate = char:FindFirstChild("Animate")
if animate then animate.Disabled = true end
for _, v in pairs(hum:GetPlayingAnimationTracks()) do v:Stop() end

local tor = char:WaitForChild("Torso")
local root = char:WaitForChild("HumanoidRootPart")

-- Motorları Tanımla
local joints = {
    root = root:WaitForChild("RootJoint"),
    neck = tor:WaitForChild("Neck"),
    rs = tor:WaitForChild("Right Shoulder"),
    ls = tor:WaitForChild("Left Shoulder"),
    rh = tor:WaitForChild("Right Hip"),
    lh = tor:WaitForChild("Left Hip")
}

-- CFrame fonksiyonu
local function cf(p, r) 
    return CFrame.new(p) * CFrame.fromEulerAnglesXYZ(math.rad(r.X), math.rad(r.Y), math.rad(r.Z)) 
end

-- Idle animasyonu pozisyonları
local targets = {}

local BrownCharmerHair_CF
local VarietyShades02_CF

local state = "idle" -- sadece idle için

-- Ses sürekli çalsın
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://133868932267574"
sound.Looped = true
sound.Volume = 1
sound.Parent = root
sound:Play()

-- Idle pozisyonları
if state == "idle" then
    targets.root = cf(Vector3.new(0,0,2), Vector3.new(9,0,0))
    targets.neck = cf(Vector3.new(0,0,0), Vector3.new(19,0,0))
    targets.rs = cf(Vector3.new(0,1,0.9), Vector3.new(0,99,99))
    targets.ls = cf(Vector3.new(0,0,0), Vector3.new(0,0,-99))
    targets.rh = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
    targets.lh = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
    BrownCharmerHair_CF = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
    VarietyShades02_CF = cf(Vector3.new(0,0,0), Vector3.new(0,0,0))
end

-- Animasyon loop (idle)
local counter = 0
rs.Stepped:Connect(function()
    counter = counter + 0.05

    for name, joint in pairs(joints) do
        local cframeTarget = targets[name]
        if cframeTarget then
            local pos, rot = Vector3.new(0,0,0), Vector3.new(0,0,0)
            
            -- Eğer neck ise ufak salınım ekleyelim
            if name == "neck" then
                local sinX = math.sin(counter) * 5
                local sinY = math.sin(counter * 0.5) * 3
                rot = Vector3.new(sinX, sinY, 0)
                joint.Transform = cf(Vector3.new(0,0,0), rot) * cframeTarget
            elseif name == "root" then
                local offsetY = math.sin(counter*0.8)*0.1
                joint.Transform = cf(Vector3.new(0,offsetY,0), Vector3.new(0,0,0)) * cframeTarget
            else
                joint.Transform = cframeTarget
            end
        end
    end
end)
