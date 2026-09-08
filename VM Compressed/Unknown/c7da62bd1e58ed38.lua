local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- GLOBAL SOUND SETTINGS
local function PlayClickSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://91741510066624"
    sound.Volume = 10
    sound.Parent = game:GetService("SoundService")
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 1)
end

local function PlayExecuteSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://71262389650741"
    sound.Volume = 10
    sound.Parent = game:GetService("SoundService")
    sound:Play()
    game:GetService("Debris"):AddItem(sound, 5)
end

PlayExecuteSound()

local Window = Rayfield:CreateWindow({
   Name = "👑 DÈMØNKIÑG HUB V3 👑",
   LoadingTitle = "DÈMØNKIÑG HUB V3",
   LoadingSubtitle = "KING ŌF NEW SMITH",
   ConfigurationSaving = { Enabled = true, FolderName = "DemonkingHub", FileName = "Main" },
   KeySystem = false
})

local TargetPlayer = nil
local BangSpeed = 1
local PhonkVolume = 5
local Toggles = { 
    Bang = false, MouthBang = false, Headsit = false, FrontHeadsit = false, 
    Orbit = false, Fling = false, Noclip = false, FlyWalk = false,
    AntiVoid = false, AntiBang = false, AntiFling = false, AntiSit = false, AntiAFK = false
}

local function GetPlayer(name)
    name = name:lower()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.Name:lower():sub(1, #name) == name or p.DisplayName:lower():sub(1, #name) == name then return p end
    end
    return nil
end

-- TAB 1: INFO 👑
local Tab1 = Window:CreateTab("INFO 👑", 4483362458)
Tab1:CreateLabel("MADE BY DÈMØNKIÑG 😎")
Tab1:CreateLabel("👑 DÈMØNKIÑG-KING ŌF NEW SMITH 💀😈")
Tab1:CreateLabel("ROBLOX ID-Demonking74709")
Tab1:CreateLabel("JO LE PANGA USSE KARO NANGA?🤣")
Tab1:CreateLabel("TOH MERE SHERO AAG LAGA DO?🔥")
Tab1:CreateLabel("INSTAGRAM ID > demonking74700")

-- TAB 2: TROLL 🌚
local Tab2 = Window:CreateTab("TROLL 🌚", 4483362458)
Tab2:CreateInput({Name = "TARGET NAME", PlaceholderText = "Enter Name", Callback = function(Text) PlayClickSound() TargetPlayer = GetPlayer(Text) end})
Tab2:CreateInput({Name = "SPEED", PlaceholderText = "Default 1", Callback = function(Text) BangSpeed = tonumber(Text) or 1 end})
Tab2:CreateButton({Name = "GOTO TARGET", Callback = function() PlayClickSound() if TargetPlayer and TargetPlayer.Character then game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame end end})
Tab2:CreateToggle({Name = "VIEW TARGET", CurrentValue = false, Callback = function(v) PlayClickSound() if v and TargetPlayer and TargetPlayer.Character then workspace.CurrentCamera.CameraSubject = TargetPlayer.Character.Humanoid else workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid end end})
Tab2:CreateToggle({Name = "BANG", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.Bang = v spawn(function() while Toggles.Bang and task.wait() do pcall(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1.1 + math.sin(tick() * (BangSpeed * 20)) * 0.8) end) end end) end})
Tab2:CreateToggle({Name = "MOUTH BANG", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.MouthBang = v spawn(function() while Toggles.MouthBang and task.wait() do pcall(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.Head.CFrame * CFrame.new(0, 0.2, -1.2 - math.sin(tick() * (BangSpeed * 20)) * 0.8) * CFrame.Angles(0, math.pi, 0) end) end end) end})
Tab2:CreateToggle({Name = "HEADSIT", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.Headsit = v spawn(function() while Toggles.Headsit and task.wait() do pcall(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.Head.CFrame * CFrame.new(0, 0.5 + math.sin(tick() * (BangSpeed * 20)) * 0.5, 0) end) end end) end})
Tab2:CreateToggle({Name = "FRONTHEADSIT", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.FrontHeadsit = v spawn(function() while Toggles.FrontHeadsit and task.wait() do pcall(function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.Head.CFrame * CFrame.new(0, 0.4, -0.2 - math.sin(tick() * (BangSpeed * 25)) * 0.5) * CFrame.Angles(0, math.pi, 0) end) end end) end})
Tab2:CreateToggle({Name = "ORBIT", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.Orbit = v spawn(function() local angle = 0 while Toggles.Orbit and task.wait() do pcall(function() angle = angle + (0.2 * BangSpeed) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, angle, 0) * CFrame.new(0, 0, 5) end) end end) end})
Tab2:CreateToggle({Name = "FLING", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.Fling = v spawn(function() while Toggles.Fling and task.wait() do pcall(function() local lp = game.Players.LocalPlayer.Character lp.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame lp.HumanoidRootPart.Velocity = Vector3.new(0, 8000, 0) lp.HumanoidRootPart.RotVelocity = Vector3.new(0, 15000, 0) end) end end) end})

-- TAB 3: SHIELD 🛡️
local Tab3 = Window:CreateTab("SHIELD 🛡️", 4483362458)
Tab3:CreateToggle({Name = "Anti void on off", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.AntiVoid = v spawn(function() while Toggles.AntiVoid and task.wait() do pcall(function() local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart if hrp.Position.Y < -15 then hrp.Velocity = Vector3.new(0, 0, 0) hrp.CFrame = CFrame.new(hrp.Position.X, 50, hrp.Position.Z) end end) end end) end})
Tab3:CreateToggle({Name = "Anti bang on off", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.AntiBang = v spawn(function() while Toggles.AntiBang and task.wait(0.1) do pcall(function() local char = game.Players.LocalPlayer.Character char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 1000, 0) task.wait(0.1) char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, -1000, 0) end) end end) end})
Tab3:CreateToggle({Name = "Anti fling on off", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.AntiFling = v spawn(function() while Toggles.AntiFling and task.wait() do pcall(function() local lp = game.Players.LocalPlayer.Character if lp:FindFirstChild("HumanoidRootPart") then lp.HumanoidRootPart.Velocity = Vector3.new(0,0,0) lp.HumanoidRootPart.RotVelocity = Vector3.new(0,0,0) end end) end end) end})
Tab3:CreateToggle({Name = "Anti sit on off", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.AntiSit = v spawn(function() while Toggles.AntiSit and task.wait() do pcall(function() game.Players.LocalPlayer.Character.Humanoid.Sit = true end) end end) end})
Tab3:CreateToggle({Name = "Anti afk on off", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.AntiAFK = v if v then game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true else game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false end end})
Tab3:CreateButton({Name = "ANTI FAKEOUT", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/80Nva2Fj"))() end})

-- TAB 4: SPAM 💀 (UPDATED & NEW ADDED)
local Tab4 = Window:CreateTab("SPAM 💀", 4483362458)
Tab4:CreateButton({Name = "DÈMØNKIÑG V3 SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/Bxx1Yfwv"))() end})
Tab4:CreateButton({Name = "FORBID SPAMMER", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Forbid-Spammer-149128"))() end})
Tab4:CreateButton({Name = "MUSIC SPAMMER", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Forbid-Music-145775"))() end})
Tab4:CreateButton({Name = "NAMELESS X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/JcJqZpV0"))() end})
Tab4:CreateButton({Name = "NERO X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/DwP9N7pc"))() end})
Tab4:CreateButton({Name = "ATUL X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/RXycpNk5"))() end})
Tab4:CreateButton({Name = "MANCHIIIO X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/P4krXarc"))() end})
Tab4:CreateButton({Name = "GAGANN X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/jTfgTNGD"))() end})
Tab4:CreateButton({Name = "ZETA X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/sHDFS7zQ"))() end})
Tab4:CreateButton({Name = "CHIFUYU X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/L59teFv9"))() end})
Tab4:CreateButton({Name = "MINATO X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/hg1wiN4K"))() end})
Tab4:CreateButton({Name = "VEGITA X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/2dve92Zi"))() end})
Tab4:CreateButton({Name = "MIKEY X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/jaFee21g"))() end})
Tab4:CreateButton({Name = "KINGSHARK X DÈMØNKIÑG SPAM", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/VDmRcL0a"))() end})

-- TAB 5: Other 📁
local Tab5 = Window:CreateTab("Other 📁", 4483362458)
Tab5:CreateToggle({Name = "FLY WALK ON/OFF", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.FlyWalk = v spawn(function() local bg = Instance.new("BodyGyro", game.Players.LocalPlayer.Character.HumanoidRootPart) bg.P = 9e4 bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) bg.cframe = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame local bv = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart) bv.velocity = Vector3.new(0, 0.1, 0) bv.maxForce = Vector3.new(9e9, 9e9, 9e9) while Toggles.FlyWalk and task.wait() do pcall(function() game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true local cam = workspace.CurrentCamera.CFrame bv.velocity = (cam.LookVector * (game.Players.LocalPlayer.Character.Humanoid.WalkSpeed * 2)) bg.cframe = cam end) end bg:Destroy() bv:Destroy() game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false end) end})
Tab5:CreateToggle({Name = "Speed 300 on off", CurrentValue = false, Callback = function(v) PlayClickSound() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v and 300 or 16 end})
Tab5:CreateToggle({Name = "Inf jump on off", CurrentValue = false, Callback = function(v) PlayClickSound() _G.InfJump = v game:GetService("UserInputService").JumpRequest:Connect(function() if _G.InfJump then game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping") end end) end})
Tab5:CreateToggle({Name = "Noclip on off", CurrentValue = false, Callback = function(v) PlayClickSound() Toggles.Noclip = v game:GetService("RunService").Stepped:Connect(function() if Toggles.Noclip then for _, part in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do if part:IsA("BasePart") then part.CanCollide = false end end end end) end})
Tab5:CreateButton({Name = "3F STALKER", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-3F-Stalker-Hub-147717"))() end})
Tab5:CreateButton({Name = "Copy Ninja", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/4etfSURt"))() end})
Tab5:CreateButton({Name = "Sky destroyer", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-sky-destroyer-V2-AXEZZ-110640"))() end})
Tab5:CreateButton({Name = "Emote", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gaze-emote-74592"))() end})
Tab5:CreateButton({Name = "Rejoin", Callback = function() PlayClickSound() game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) end})
Tab5:CreateButton({Name = "Server hop", Callback = function() PlayClickSound() loadstring(game:HttpGet("https://pastebin.com/raw/m888X7p3"))() end})

-- TAB 6: PHONK 🎶
local Tab6 = Window:CreateTab("PHONK 🎶", 4483362458)
local CurrentPhonk = nil
Tab6:CreateSlider({Name = "PHONK VOLUME", Range = {0, 10}, Increment = 1, CurrentValue = 5, Callback = function(Value) PhonkVolume = Value if CurrentPhonk then CurrentPhonk.Volume = Value end end})
local function PlayPhonk(id) if CurrentPhonk then CurrentPhonk:Stop() CurrentPhonk:Destroy() end CurrentPhonk = Instance.new("Sound", game:GetService("SoundService")) CurrentPhonk.SoundId = "rbxassetid://"..id CurrentPhonk.Volume = PhonkVolume CurrentPhonk:Play() end
Tab6:CreateButton({Name = "PHONK 1", Callback = function() PlayClickSound() PlayPhonk("140691985128867") end})
Tab6:CreateButton({Name = "PHONK 2", Callback = function() PlayClickSound() PlayPhonk("140504265985079") end})
Tab6:CreateButton({Name = "PHONK 3", Callback = function() PlayClickSound() PlayPhonk("138682744064257") end})
Tab6:CreateButton({Name = "PHONK 4", Callback = function() PlayClickSound() PlayPhonk("121130248495127") end})
Tab6:CreateButton({Name = "PHONK 5", Callback = function() PlayClickSound() PlayPhonk("136079183541105") end})
Tab6:CreateButton({Name = "PHONK 6", Callback = function() PlayClickSound() PlayPhonk("129980503970607") end})
Tab6:CreateButton({Name = "PHONK 7", Callback = function() PlayClickSound() PlayPhonk("119560785746143") end})
Tab6:CreateButton({Name = "STOP-ALL", Callback = function() PlayClickSound() if CurrentPhonk then CurrentPhonk:Stop() end end})

Rayfield:Notify({Title = "👑 DÈMØNKIÑG HUB V3 👑", Content = "DÈMØNKIÑG-KING ŌF NEW SMITH!💀", Duration = 5, Image = 4483362458})