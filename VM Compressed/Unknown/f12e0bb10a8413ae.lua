--by oldhacfard

local StarterGui = game:GetService("StarterGui")
local workspace = game:GetService("Workspace")

-- Fonksiyon: Bildirim + ses
local function sendNotificationWithSound(title, text, duration)
    StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration
    })
    -- Ses efektini çal
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://17582299860"
    sound.Volume = 1
    sound.PlayOnRemove = true
    sound.Parent = workspace
    sound:Destroy() -- PlayOnRemove ile bir kez çalacak
end

-- 1. Bildirim
sendNotificationWithSound("Oldhacfards Reanimation", "Reanimate loaded", 4)
wait(4)

-- 2. Bildirim
sendNotificationWithSound("Warned", "This reanimate not by me myworlds", 4)
wait(4)

-- 3. Bildirim
local duration = 7
sendNotificationWithSound("Reanimating by Oldhacfard", "Duration: "..duration.."s", duration)
warn("Reanimating by Oldhacfard")
wait(duration)

-- Loadstring ile Reanimate
loadstring(game:HttpGet("https://raw.githubusercontent.com/oldhacfard/The-script/refs/heads/main/Reanimate.luau"))()
