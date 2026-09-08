local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🐍 <b>MAMBA MENTALITY HUB</b> | V107",
   LoadingTitle = "🐍 LEGACY HUB",
   LoadingSubtitle = "by Mamba Mentality",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "MambaConfigs",
      FileName = "MainHub"
   },
   -- [[ RAYFIELD KEY SYSTEM START ]]
   KeySystem = true,
   KeySettings = {
      Title = "🐍 MAMBA KEY SYSTEM",
      Subtitle = "Join Discord for the Key",
      Note = ":https://discord.gg/HDhES2V6",
      FileName = "MambaKeyData",
      SaveKey = true, 
      GrabKeyFromSite = false,
      Key = {"MAMBA24"}, -- Ito ang password
      Actions = {
            [1] = {
                Text = "GET KEY (DISCORD)",
                OnPress = function()
                    setclipboard("https://discord.gg/HDhES2V6")
                    Rayfield:Notify({
                        Title = "COPIED!",
                        Content = "Discord link copied to clipboard.",
                        Duration = 5,
                    })
                end,
            }
        }
   },
   Theme = "Green"
})

-- [[ SETTINGS ]]
_G.AutoCollect = false
_G.AutoUpgradeBase = false
_G.AutoBuySpeed = false
_G.AutoUpgradeCar = false
_G.GhostMode = true
_G.InfJump = false

local RS = game:GetService("ReplicatedStorage")
local Remotes = {
    Collect = RS:WaitForChild("RemoteEvents"):WaitForChild("CollectMoney"),
    Speed = RS:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeSpeed"),
    Car = RS:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeCar"),
    Base = RS:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeBase")
}

-- [[ TABS ]]
local MainTab = Window:CreateTab("🔥 Auto Farm", 4483362458)
local WorldTab = Window:CreateTab("🌊 World", 4483362458)
local PlayerTab = Window:CreateTab("👤 Player", 4483362458)
local TeleportTab = Window:CreateTab("📍 Teleports", 4483362458)

-- [[ MAIN TAB: AUTO FARM ]]
MainTab:CreateSection("MANAGEMENT")

MainTab:CreateToggle({
   Name = "Auto Collect Money",
   CurrentValue = false,
   Callback = function(Value) _G.AutoCollect = Value end,
})

MainTab:CreateSection("AUTOMATION")

MainTab:CreateToggle({
   Name = "Auto Buy Base (Buttons/Floors)",
   CurrentValue = false,
   Callback = function(Value) _G.AutoUpgradeBase = Value end,
})

MainTab:CreateToggle({
   Name = "Auto Buy Speed",
   CurrentValue = false,
   Callback = function(Value) _G.AutoBuySpeed = Value end,
})

MainTab:CreateToggle({
   Name = "Auto Upgrade All Cars",
   CurrentValue = false,
   Callback = function(Value) _G.AutoUpgradeCar = Value end,
})

-- [[ WORLD TAB: GHOST MODE ]]
WorldTab:CreateSection("ENVIRONMENT")

WorldTab:CreateToggle({
   Name = "Ghost Mode (Anti-Tsunami)",
   CurrentValue = true,
   Callback = function(Value) _G.GhostMode = Value end,
})

WorldTab:CreateButton({
   Name = "Clean Tsunami Visuals",
   Callback = function()
       for _, v in pairs(workspace:GetDescendants()) do
           if v.Name:lower():find("tsunami") or v.Name:lower():find("water") then
               pcall(function() v:Destroy() end)
           end
       end
   end,
})

-- [[ PLAYER TAB ]]
PlayerTab:CreateSection("CHARACTER MODS")

PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 400},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Callback = function(Value)
       if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
           game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
       end
   end,
})

PlayerTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Callback = function(Value) _G.InfJump = Value end,
})

-- [[ TELEPORT TAB ]]
TeleportTab:CreateSection("WARP LOCATIONS")

TeleportTab:CreateButton({
   Name = "Warp: Main Base",
   Callback = function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(97.75, 3.36, -80.54)
   end,
})

TeleportTab:CreateButton({
   Name = "Warp: Cosmic Area",
   Callback = function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2275.61, -2.74, -18.12)
   end,
})

-- [[ 🚀 THE CORE ENGINE ]]
task.spawn(function()
    while task.wait(0.6) do
        pcall(function()
            if _G.AutoCollect then
                for i = 1, 50 do Remotes.Collect:FireServer("Slot"..i) end
            end
            
            if _G.AutoUpgradeBase then
                task.spawn(function() Remotes.Base:InvokeServer() end)
            end
            
            if _G.AutoBuySpeed then 
                task.spawn(function() Remotes.Speed:InvokeServer() end) 
            end
            
            if _G.AutoUpgradeCar then
                for i = 1, 50 do 
                    task.spawn(function() Remotes.Car:InvokeServer("Slot"..i) end) 
                end
            end
            
            if _G.GhostMode then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v.Name:lower():find("tsunami") or v.Name:lower():find("water") then
                        if v:IsA("TouchTransmitter") then v:Destroy() end
                        if v:IsA("BasePart") then v.CanTouch = false v.Transparency = 0.8 end
                    end
                end
            end
        end)
    end
end)

-- Inf Jump Logic
game:GetService("UserInputService").JumpRequest:Connect(function()
    if _G.InfJump and game.Players.LocalPlayer.Character then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end
end)

Rayfield:Notify({
   Title = "🐍 MAMBA V107 ACTIVE",
   Content = "Enjoy farming, Prime!",
   Duration = 5,
})
