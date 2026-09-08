local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local CorrectKey = "2005-BRYU-V110-WORM"
local KeyFileName = "WormHub_KeySave.txt"

-- [[ 🔑 PERMANENT AUTO-SAVE SYSTEM ]] --
local function CheckSavedKey()
    if isfile(KeyFileName) then
        local content = readfile(KeyFileName)
        if content == CorrectKey then
            return true
        end
    end
    return false
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Eğer key zaten kayıtlıysa sistemi atla (KeySystem = false yap)
local KeySystemEnabled = not CheckSavedKey()

local Window = Rayfield:CreateWindow({
   Name = "🐍 WORM HUB | LEGACY FINAL",
   LoadingTitle = "Checking Key & Systems...",
   ConfigurationSaving = { Enabled = false },
   KeySystem = KeySystemEnabled, 
   KeySettings = {
      Title = "WORM HUB | SECURITY",
      Subtitle = "Key System",
      Note = "Join our Discord for the key: https://discord.gg/ExYXzKCp",
      FileName = "WormHub_RayfieldKey", 
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {CorrectKey}
   }
})

-- Key girildiğinde dosyaya kaydet (Bir sonraki sefere sormasın diye)
if KeySystemEnabled then
    task.spawn(function()
        while task.wait(1) do
            -- Menü açıldıysa key doğru girilmiştir
            if Window then
                writefile(KeyFileName, CorrectKey)
                break
            end
        end
    end)
end

-- [[ ⚙️ SETTINGS & FIXES (UNCHANGED) ]] --
local Settings = {
    Speed = 0, JumpForce = 50, FlyEnabled = false,
    FlySpeed = 50, NoClip = false, GodMode = true, InfJump = true
}

-- [[ 🛡️ IMMORTALITY ]] --
local function ApplyGod()
    local char = LocalPlayer.Character
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if hum then
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        hum.MaxHealth = math.huge
        hum.Health = math.huge
    end
end

-- [[ 🚀 ENGINE & JUMP FIX ]] --
RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if root and hum then
        if not Settings.FlyEnabled then hum:ChangeState(Enum.HumanoidStateType.Running) end
        if Settings.Speed > 0 and hum.MoveDirection.Magnitude > 0 and not Settings.FlyEnabled then
            root.CFrame = root.CFrame + (hum.MoveDirection * (Settings.Speed / 50))
        end
        if Settings.FlyEnabled then
            local flyDir = Vector3.new(0,0,0)
            local cam = workspace.CurrentCamera.CFrame
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then flyDir = flyDir + cam.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then flyDir = flyDir - cam.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then flyDir = flyDir - cam.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then flyDir = flyDir + cam.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then flyDir = flyDir + Vector3.new(0,1,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then flyDir = flyDir - Vector3.new(0,1,0) end
            root.Velocity = flyDir * Settings.FlySpeed
            hum.PlatformStand = true
        else
            hum.PlatformStand = false
        end
        if Settings.NoClip or Settings.FlyEnabled then
            for _, v in pairs(char:GetDescendants()) do
                if v:IsA("BasePart") then v.CanCollide = false end
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if Settings.InfJump and not Settings.FlyEnabled then
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if root and hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
            root.Velocity = Vector3.new(root.Velocity.X, Settings.JumpForce, root.Velocity.Z)
        end
    end
end)

-- [[ 🏠 UI TABS ]] --
local Main = Window:CreateTab("🚀 Main Cheats", 4483345998)
Main:CreateSlider({Name = "Walk Speed", Range = {0, 150}, Increment = 1, CurrentValue = 0, Callback = function(v) Settings.Speed = v end})
Main:CreateSlider({Name = "Jump Force", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(v) Settings.JumpForce = v end})
Main:CreateToggle({Name = "NoClip", CurrentValue = false, Callback = function(v) Settings.NoClip = v end})

local FlyTab = Window:CreateTab("🕊️ Fly Settings", 4483345998)
FlyTab:CreateToggle({Name = "Enable Fly", CurrentValue = false, Callback = function(v) Settings.FlyEnabled = v end})
FlyTab:CreateSlider({Name = "Fly Speed", Range = {10, 500}, Increment = 5, CurrentValue = 50, Callback = function(v) Settings.FlySpeed = v end})

local GodTab = Window:CreateTab("🛡️ God Mode", 4483345998)
GodTab:CreateToggle({Name = "Immortality", CurrentValue = true, Callback = function(v) Settings.GodMode = v if v then ApplyGod() end end})
GodTab:CreateToggle({Name = "Infinite Jump", CurrentValue = true, Callback = function(v) Settings.InfJump = v end})

local DiscordTab = Window:CreateTab("💬 Discord", 4483345998)
DiscordTab:CreateButton({Name = "Copy Discord Link", Callback = function() setclipboard("https://discord.gg/ExYXzKCp") end})

ApplyGod()
LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5) if Settings.GodMode then ApplyGod() end end)