local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "UserXD Premium 👑",
   LoadingTitle = "Injecting Bypass...",
   LoadingSubtitle = "By UserXD",
   ConfigurationSaving = {
      Enabled = false 
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false,
   Theme = "Light"
})

local MainTab = Window:CreateTab("🌍 Farming", "home")
local VisualsTab = Window:CreateTab("👁️ Visuals (ESP)", "eye")
local PlayerTab = Window:CreateTab("👤 Player", "user")
local SecurityTab = Window:CreateTab("🛡️ Security", "shield")
local MiscTab = Window:CreateTab("⚙️ Misc", "settings")

local autoTeleportW1Enabled = false
local autoTeleportW2Enabled = false
local autoSpeedEnabled = false
local teleportDelay = 0.2
local speedDelay = 0.6
local antiBanEnabled = true

local espEnabled = false
local espColor = Color3.fromRGB(255, 0, 0)
local espHighlights = {}

pcall(function()
    local oldNamecall
    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
        local method = getnamecallmethod()
        if antiBanEnabled and not checkcaller() and self == game.Players.LocalPlayer then
            if method == "Kick" or method == "kick" then
                return wait(9e9) 
            end
        end
        return oldNamecall(self, ...)
    end)
end)

task.spawn(function()
    while true do
        if autoTeleportW1Enabled then
            pcall(function()
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPart = workspace:FindFirstChild("GiveWins")
                    if targetPart then
                        local btn = targetPart:FindFirstChild("Button14")
                        if btn and btn:FindFirstChild("Touch") then
                            player.Character.HumanoidRootPart.CFrame = btn.Touch.CFrame
                        end
                    end
                end
            end)
        end
        task.wait(teleportDelay)
    end
end)

task.spawn(function()
    while true do
        if autoTeleportW2Enabled then
            pcall(function()
                local player = game.Players.LocalPlayer
                if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPart = workspace:FindFirstChild("GiveWins")
                    if targetPart then
                        local btn = targetPart:FindFirstChild("Button13")
                        if btn and btn:FindFirstChild("Touch") then
                            player.Character.HumanoidRootPart.CFrame = btn.Touch.CFrame
                        end
                    end
                end
            end)
        end
        task.wait(teleportDelay)
    end
end)

task.spawn(function()
    local VirtualInputManager = game:GetService("VirtualInputManager")
    while true do
        if autoSpeedEnabled then
            pcall(function() VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.S, false, game) end)
            task.wait(speedDelay)
            pcall(function() VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.S, false, game) end)
            
            if not autoSpeedEnabled then continue end
            
            pcall(function() VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.W, false, game) end)
            task.wait(speedDelay)
            pcall(function() VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game) end)
        else
            task.wait(0.1) 
        end
    end
end)

local function createESP(player)
    if player == game.Players.LocalPlayer then return end
    
    local function applyToCharacter(character)
        if espHighlights[player] then
            espHighlights[player]:Destroy()
        end
        
        local highlight = Instance.new("Highlight")
        highlight.Name = player.Name .. "_ESP"
        highlight.FillColor = espColor
        highlight.OutlineColor = Color3.new(1, 1, 1)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        
        pcall(function()
            highlight.Parent = game:GetService("CoreGui")
        end)
        if not highlight.Parent then
            highlight.Parent = character
        end
        
        highlight.Adornee = character
        espHighlights[player] = highlight
        highlight.Enabled = espEnabled
    end
    
    if player.Character then applyToCharacter(player.Character) end
    player.CharacterAdded:Connect(applyToCharacter)
end

local function removeESP(player)
    if espHighlights[player] then
        espHighlights[player]:Destroy()
        espHighlights[player] = nil
    end
end

for _, player in pairs(game.Players:GetPlayers()) do
    createESP(player)
end
game.Players.PlayerAdded:Connect(createESP)
game.Players.PlayerRemoving:Connect(removeESP)


SecurityTab:CreateSection("Bypass & Security")
SecurityTab:CreateToggle({
   Name = "🛡️ Anti-Kick / Anti-Ban Active",
   CurrentValue = true,
   Flag = "AntiBanTog", 
   Callback = function(Value)
      antiBanEnabled = Value
   end,
})

MainTab:CreateSection("Teleport")
MainTab:CreateToggle({ Name = "🌌 Auto Teleport (World 1)", CurrentValue = false, Flag = "TeleportW1Tog", Callback = function(Value) autoTeleportW1Enabled = Value end })
MainTab:CreateToggle({ Name = "🌋 Auto Teleport (World 2)", CurrentValue = false, Flag = "TeleportW2Tog", Callback = function(Value) autoTeleportW2Enabled = Value end })
MainTab:CreateSlider({ Name = "⏱️ Teleport Delay", Range = {0.1, 3}, Increment = 0.1, Suffix = "s", CurrentValue = 0.2, Flag = "TeleportDelTog", Callback = function(Value) teleportDelay = Value end })

MainTab:CreateSection("Auto Farming")
MainTab:CreateToggle({
   Name = "⚡ Auto Speed",
   CurrentValue = false,
   Flag = "AutoSpeedTog",
   Callback = function(Value)
      autoSpeedEnabled = Value
      if not Value then
          pcall(function()
              local VirtualInputManager = game:GetService("VirtualInputManager")
              VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.W, false, game)
              VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.S, false, game)
          end)
      end
   end,
})
MainTab:CreateSlider({ Name = "⏱️ Speed Movement Delay", Range = {0.1, 2}, Increment = 0.1, Suffix = "s", CurrentValue = 0.6, Flag = "SpeedDelTog", Callback = function(Value) speedDelay = Value end })

VisualsTab:CreateSection("Player ESP (Wallhack)")
VisualsTab:CreateToggle({
   Name = "👁️ Enable ESP",
   CurrentValue = false,
   Flag = "ESPTog",
   Callback = function(Value)
      espEnabled = Value
      for _, highlight in pairs(espHighlights) do
          if highlight then highlight.Enabled = Value end
      end
   end,
})
VisualsTab:CreateColorPicker({
    Name = "🎨 ESP Color",
    Color = Color3.fromRGB(255,0,0),
    Flag = "ESPCol",
    Callback = function(Value)
        espColor = Value
        for _, highlight in pairs(espHighlights) do
            if highlight then highlight.FillColor = Value end
        end
    end
})

PlayerTab:CreateSection("Character Control")
PlayerTab:CreateSlider({
   Name = "🏃 WalkSpeed",
   Range = {16, 500},
   Increment = 1,
   Suffix = " WS",
   CurrentValue = 16,
   Flag = "WSTog",
   Callback = function(Value)
       pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end)
   end,
})
PlayerTab:CreateSlider({
   Name = "🦘 JumpPower",
   Range = {50, 500},
   Increment = 1,
   Suffix = " JP",
   CurrentValue = 50,
   Flag = "JPTog",
   Callback = function(Value)
       pcall(function() game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value end)
   end,
})
PlayerTab:CreateToggle({
   Name = "🚀 Infinite Jump",
   CurrentValue = false,
   Flag = "InfJTog",
   Callback = function(Value)
       _G.InfJump = Value
   end,
})

local UserInputService = game:GetService("UserInputService")
UserInputService.JumpRequest:Connect(function()
    if _G.InfJump then
        pcall(function()
            game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end)
    end
end)

MiscTab:CreateSection("UI Control")
MiscTab:CreateButton({ Name = "🗑️ Destroy UI", Callback = function() Rayfield:Destroy() end })