-- [[ 🐍 WORM HUB | STABLE v7.6 - PERMANENT KEY FIX ]] --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ 💾 CUSTOM SAVE SYSTEM ]] --
local KeyFile = "WormHub_KeySafe.txt"
local function SaveKeyLocal(key)
    writefile(KeyFile, key)
end

local function ReadKeyLocal()
    if isfile(KeyFile) then
        return readfile(KeyFile)
    end
    return nil
end

local MainKey = "WORM-1000-SUBS-PROG"
local BoosterKeyConstant = "WORM-BOOSTER-GOLD-882"

-- Eğer key zaten kayıtlıysa sistemi bypass etmesi için ayar
local savedKey = ReadKeyLocal()
local shouldSkipKey = (savedKey == MainKey or savedKey == BoosterKeyConstant)

local Window = Rayfield:CreateWindow({
   Name = "🐍 WORM HUB | FIFA Super Soccer",
   LoadingTitle = "Worm Hub Global v7.6",
   ConfigurationSaving = { Enabled = true, FolderName = "WormHubData", FileName = "SoccerConfig" },
   KeySystem = not shouldSkipKey, -- Key kayıtlıysa sistemi hiç açma
   KeySettings = {
      Title = "WORM HUB | Main Access",
      Subtitle = "Join Discord for Key",
      Note = "Key is saved permanently after first use!",
      FileName = "WormHubKey_Save",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {MainKey, BoosterKeyConstant}
   }
})

-- Key girildiğinde dosyaya kaydet (İlk giriş için)
if not shouldSkipKey then
    SaveKeyLocal(MainKey) 
end

local Settings = { Speed = 0, JumpForce = 50 }
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- [[ 🚀 MOVEMENT ENGINE (STABLE) ]] --
RunService.Stepped:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    local hum = char and char:FindFirstChildOfClass("Humanoid")
    if root and hum then
        if Settings.Speed > 0 and hum.MoveDirection.Magnitude > 0 then
            root.CFrame = root.CFrame + (hum.MoveDirection * (Settings.Speed / 65))
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    local char = LocalPlayer.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")
    if root and Settings.JumpForce > 50 then
        root.Velocity = Vector3.new(root.Velocity.X, Settings.JumpForce, root.Velocity.Z)
    end
end)

-- [[ 🏠 MOVEMENT TAB ]] --
local Main = Window:CreateTab("⚽ Movement", 4483345998)
Main:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 150},
   Increment = 1,
   CurrentValue = 0,
   Callback = function(v) Settings.Speed = v end,
})
Main:CreateSlider({
   Name = "Jump Power",
   Range = {50, 250},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(v) Settings.JumpForce = v end,
})

-- [[ 🏆 PLAYER PROFILE (BOOSTER SECTION) ]] --
local Economy = Window:CreateTab("🏆 Player Profile", 4483345998)
Economy:CreateLabel("⚠️ Only Server Boosters can access Gold & Level features!")
local GoldSection = Economy:CreateSection("--- Booster Verification ---")

local BoosterFeaturesActive = false

Economy:CreateInput({
   Name = "Enter Booster Key",
   PlaceholderText = "Paste Booster Key Here...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
        if Text == BoosterKeyConstant then
            Rayfield:Notify({Title = "SUCCESS", Content = "Booster Features Unlocked!", Duration = 5})
            BoosterFeaturesActive = true
        else
            Rayfield:Notify({Title = "ERROR", Content = "Invalid Booster Key!", Duration = 5})
            BoosterFeaturesActive = false
        end
   end,
})

local function UpdateStat(statName, amount)
    if not BoosterFeaturesActive then 
        Rayfield:Notify({Title = "LOCKED", Content = "Please enter a valid Booster Key first!", Duration = 5})
        return 
    end
    local stats = LocalPlayer:FindFirstChild("leaderstats")
    if stats then
        local stat = stats:FindFirstChild(statName) or stats:FindFirstChild("Gold") or stats:FindFirstChild("Level")
        if stat then stat.Value = stat.Value + amount end
    end
end

Economy:CreateSection("--- Gold Features ---")
Economy:CreateButton({
   Name = "Add +1,000 Gold",
   Callback = function() UpdateStat("Gold", 1000) end,
})

Economy:CreateSection("--- Level Features ---")
Economy:CreateButton({
   Name = "+10 Levels",
   Callback = function() UpdateStat("Level", 10) end,
})

-- [[ 📢 COMMUNITY TAB ]] --
local Community = Window:CreateTab("📢 Community", 4483345998)
Community:CreateButton({
   Name = "Copy Discord Invite Link",
   Callback = function()
        setclipboard("https://discord.gg/ExYXzKCp")
        Rayfield:Notify({Title = "WORM HUB", Content = "Discord link copied!", Duration = 5})
   end,
})