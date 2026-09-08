local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Premium Ultra Hub V4 | All-In-One",
   LoadingTitle = "hasso hub doors Hazırlanıyor...",
   LoadingSubtitle = "Hoş geldin, hasso hun dorrs!",
   ConfigurationSaving = { Enabled = true, FolderName = "UltraHubConfig" },
   KeySystem = false, -- ANAHTAR SİSTEMİ KAPATILDI
})

-- DEĞİŞKENLER
local LP = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Noclip = false
local Flying = false
local FlySpeed = 50
local InfJump = false
local AutoClicker = false
local HitboxSize = 2
local Spinbot = false

-- SEKMELER
local MainTab = Window:CreateTab("Hareket", 4483362458)
local CombatTab = Window:CreateTab("Savaş & Hitbox", 4483362458)
local VisualTab = Window:CreateTab("Görsel (ESP)", 4483362458)
local TeleportTab = Window:CreateTab("Işınlanma", 4483362458)
local TrollTab = Window:CreateTab("Troll & Eğlence", 4483362458)
local PlayerTab = Window:CreateTab("Oyuncu & Sistem", 4483362458)

--- [HAREKET SİSTEMİ] ---
MainTab:CreateToggle({
   Name = "Noclip (Duvarlardan Geçme)",
   CurrentValue = false,
   Callback = function(Value)
      Noclip = Value
      game:GetService("RunService").Stepped:Connect(function()
         if Noclip and LP.Character then
            for _, v in pairs(LP.Character:GetDescendants()) do
               if v:IsA("BasePart") then v.CanCollide = false end
            end
         end
      end)
   end,
})

MainTab:CreateToggle({
   Name = "Uçma (Mobil Fly)",
   CurrentValue = false,
   Callback = function(Value)
      Flying = Value
      local Root = LP.Character:WaitForChild("HumanoidRootPart")
      if Flying then
         local BV = Root:FindFirstChild("UltraFly") or Instance.new("BodyVelocity", Root)
         BV.Name = "UltraFly"
         BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
         task.spawn(function()
            while Flying do
               BV.Velocity = Camera.CFrame.LookVector * FlySpeed
               task.wait()
            end
            BV:Destroy()
         end)
      end
   end,
})

MainTab:CreateSlider({
   Name = "Hız Ayarı",
   Range = {10, 500},
   Increment = 10,
   CurrentValue = 50,
   Callback = function(v) FlySpeed = v end,
})

MainTab:CreateToggle({
   Name = "Sonsuz Zıplama",
   CurrentValue = false,
   Callback = function(v) InfJump = v end,
})

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfJump and LP.Character:FindFirstChildOfClass("Humanoid") then 
        LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") 
    end
end)

--- [SAVAŞ & PVP] ---
CombatTab:CreateSlider({
   Name = "Hitbox Genişliği",
   Range = {2, 100},
   Increment = 1,
   CurrentValue = 2,
   Callback = function(v) HitboxSize = v end,
})

CombatTab:CreateButton({
   Name = "Hitboxları Aktif Et",
   Callback = function()
      for _, v in pairs(game.Players:GetPlayers()) do
         if v ~= LP and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            v.Character.HumanoidRootPart.Size = Vector3.new(HitboxSize, HitboxSize, HitboxSize)
            v.Character.HumanoidRootPart.Transparency = 0.8
            v.Character.HumanoidRootPart.CanCollide = false
            v.Character.HumanoidRootPart.Color = Color3.fromRGB(255, 0, 0)
         end
      end
   end,
})

--- [GÖRSEL (ESP)] ---
VisualTab:CreateToggle({
   Name = "Oyuncu ESP (Highlight)",
   CurrentValue = false,
   Callback = function(Value)
      for _, p in pairs(game.Players:GetPlayers()) do
         if p ~= LP and p.Character then
            local h = p.Character:FindFirstChildOfClass("Highlight") or Instance.new("Highlight", p.Character)
            h.Enabled = Value
         end
      end
   end,
})

--- [IŞINLANMA] ---
local SelectedPlayer = ""
local Dropdown = TeleportTab:CreateDropdown({
   Name = "Oyuncu Seç",
   Options = {},
   CurrentOption = "",
   Callback = function(Option) SelectedPlayer = Option end,
})

task.spawn(function()
   while task.wait(5) do
      local pList = {}
      for _, v in pairs(game.Players:GetPlayers()) do
         if v.Name ~= LP.Name then table.insert(pList, v.Name) end
      end
      Dropdown:Refresh(pList)
   end
end)

TeleportTab:CreateButton({
   Name = "Seçilen Oyuncuya Git",
   Callback = function()
      if SelectedPlayer ~= "" and game.Players:FindFirstChild(SelectedPlayer) then
         LP.Character.HumanoidRootPart.CFrame = game.Players[SelectedPlayer].Character.HumanoidRootPart.CFrame
      end
   end,
})

--- [OYUNCU & SİSTEM] ---
PlayerTab:CreateButton({
   Name = "Anti-AFK Aktif Et",
   Callback = function()
       local vu = game:GetService("VirtualUser")
       LP.Idled:Connect(function()
           vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
           task.wait(1)
           vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
       end)
       Rayfield:Notify({Title = "Anti-AFK", Content = "Atılma Engellendi!", Duration = 3})
   end,
})

Rayfield:LoadConfiguration()