local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "James_Playz GUI",
   Icon = 0,
   LoadingTitle = "James_Playz Testing",
   LoadingSubtitle = "by James_Playz On YouTube",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "JPTGUIS",
      FileName = "JPTHCK"
   },
   Discord = {
      Enabled = true,
      Invite = "XXyH9mGT",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "James_Playz GUI",
      Subtitle = "Key System",
      Note = "Key at discord.gg/XXyH9mGT in Keys channel",
      FileName = "JPGUI",
      SaveKey = true,
      GrabKeyFromSite = true,
      Key = {"https://pastebin.com/raw/ztT1rdxi"}
   }
})

-- Main Tabs and Sections
local MainTab = Window:CreateTab("Main", nil)
local MainSection = MainTab:CreateSection("Main")

local PlayerTab = Window:CreateTab("Local Player", nil)
local PlayerSection = PlayerTab:CreateSection("Humanoid")

local JailTab = Window:CreateTab("Jailbreak", nil)
local JailSection = JailTab:CreateSection("Jailbreak")

local LumberTab = Window:CreateTab("LT2", nil)
local LumberSection = LumberTab:CreateSection("Lumber Tycoon 2")

local FischTab = Window:CreateTab("Fisch", nil)
local FischSection = FischTab:CreateSection("Fisch")

local PetgoTab = Window:CreateTab("Pets Go", nil)
local PetgoSection = PetgoTab:CreateSection("Pets Go")

local Pet99Tab = Window:CreateTab("PS99", nil)
local Pet99Section = Pet99Tab:CreateSection("Pets Simulator 99")

local BloxFruitsTab = Window:CreateTab("BloxFruits", nil)
local BloxFruitsSection = BloxFruitsTab:CreateSection("BloxFruits")

local GuiTab = Window:CreateTab("Gui", nil)
local GuiSection = GuiTab:CreateSection("Gui")

local Tab2 = Window:CreateTab("Tab 2", nil)
local Tab2Section = Tab2:CreateSection("Tab 2 Section")

local Tab3 = Window:CreateTab("Tab 3", nil)
local Tab3Section = Tab3:CreateSection("Tab 3 Section")

local Tab4 = Window:CreateTab("Tab 4", nil)
local Tab4Section = Tab4:CreateSection("Tab 4 Section")

local Tab5 = Window:CreateTab("Tab 5", nil)
local Tab5Section = Tab5:CreateSection("Tab 5 Section")

-- Buttons for Tab 1 to Tab 5
GuiTab:CreateButton({
   Name = "2016 CoreGui",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/nsJFUhwa"))()
   end,
})

GuiTab:CreateButton({
   Name = "JP Interface CoreGui (In Development",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/3gaV98Dh"))()
   end,
})

Tab2:CreateButton({
   Name = "Button 2",
   Callback = function()
      print("Button 2 clicked!")
   end,
})

Tab3:CreateButton({
   Name = "Button 3",
   Callback = function()
      print("Button 3 clicked!")
   end,
})

Tab4:CreateButton({
   Name = "Button 4",
   Callback = function()
      print("Button 4 clicked!")
   end,
})

Tab5:CreateButton({
   Name = "Button 5",
   Callback = function()
      print("Button 5 clicked!")
   end,
})

-- New toggle variables for timing
local lowDetailModeActive = false
local lowDetailLoopRunning = false
local twoMinLoopActive = false
local twoMinLoopRunning = false

-- Function for executing every 30 seconds
local function startLowDetailModeLoop()
    lowDetailLoopRunning = true
    while lowDetailModeActive do
        -- Execute the Low Detail Mode script
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/qtu4MBV0"))()
        end)

        if not success then
            warn("Failed to load Low Detail Mode script: " .. errorMessage)
        else
            print("Low Detail Mode script executed successfully")
        end

        -- Wait 30 seconds before executing again
        wait(30)
    end
end

-- Function for executing every 2 minutes
local function startTwoMinLoop()
    twoMinLoopRunning = true
    while twoMinLoopActive do
        -- Execute the Low Detail Mode script
        local success, errorMessage = pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/qtu4MBV0"))()
        end)

        if not success then
            warn("Failed to load Low Detail Mode script: " .. errorMessage)
        else
            print("Low Detail Mode script executed successfully")
        end

        -- Wait 2 minutes before executing again
        wait(120)
    end
end

-- Creating the toggles for execution intervals
local LowDetailModeToggle = MainTab:CreateToggle({
   Name = "Low Detail Mode (Every 30s)",
   CurrentValue = false,
   Callback = function(Value)
      lowDetailModeActive = Value
      if Value then
         if not lowDetailLoopRunning then
            startLowDetailModeLoop()
         end
      else
         lowDetailLoopRunning = false
         print("Low Detail Mode (30s) stopped.")
      end
   end,
})

local TwoMinToggle = MainTab:CreateToggle({
   Name = "Low Detail Mode (Every 2m)",
   CurrentValue = false,
   Callback = function(Value)
      twoMinLoopActive = Value
      if Value then
         if not twoMinLoopRunning then
            startTwoMinLoop()
         end
      else
         twoMinLoopRunning = false
         print("Low Detail Mode (2m) stopped.")
      end
   end,
})

-- Player Tab Sliders
local Slider = PlayerTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 1000},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local JumpPowerSlider = PlayerTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 1000},
   Increment = 10,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "JumpPowerSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

local MaxHealthSlider = PlayerTab:CreateSlider({
   Name = "Max Health",
   Range = {0, 10000},
   Increment = 10,
   Suffix = "Health",
   CurrentValue = 100,
   Flag = "MaxHealthSlider",
   Callback = function(Value)
      local humanoid = game.Players.LocalPlayer.Character.Humanoid
      humanoid.MaxHealth = Value
      humanoid.Health = math.min(humanoid.Health, humanoid.MaxHealth)
   end,
})

local CurrentHealthSlider = PlayerTab:CreateSlider({
   Name = "Current Health",
   Range = {0, 10000},
   Increment = 10,
   Suffix = "Health",
   CurrentValue = 100,
   Flag = "CurrentHealthSlider",
   Callback = function(Value)
      local humanoid = game.Players.LocalPlayer.Character.Humanoid
      humanoid.Health = math.min(Value, humanoid.MaxHealth)
   end,
})

game:GetService("RunService").Heartbeat:Connect(function()
   local humanoid = game.Players.LocalPlayer.Character.Humanoid
   humanoid.MaxHealth = 10000
   humanoid.Health = math.min(humanoid.Health, humanoid.MaxHealth)
end)

local FOVSlider = PlayerTab:CreateSlider({
   Name = "Field of View",
   Range = {30, 110},
   Increment = 1,
   Suffix = "FOV",
   CurrentValue = game.Workspace.CurrentCamera.FieldOfView,
   Flag = "FOVSlider",
   Callback = function(Value)
      game.Workspace.CurrentCamera.FieldOfView = Value
   end,
})

-- Buttons for BloxFruits
BloxFruitsTab:CreateButton({
   Name = "BloxFruits (No Key)",
   Callback = function()
      local success, errorMessage = pcall(function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/realredz/BloxFruits/refs/heads/main/Source.lua"))()
      end)
      
      if not success then
         warn("Failed to load BloxFruits script: " .. errorMessage)
      else
         print("BloxFruits script executed successfully")
      end
   end,
})

-- Buttons for Jailbreak
JailTab:CreateButton({
   Name = "Jailbreak (God Hub, Key)",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Jailbreak-BEST-OP-SCRIPT-WITH-LOTS-OP-FEATURES-18726"))()
   end,
})

JailTab:CreateButton({
   Name = "Jailbreak (Project Auto/Auto Arrest, No Key)",
   Callback = function()
      loadstring(game:HttpGet("http://scripts.projectauto.xyz/AutoArrestV3"))()
   end,
})

JailTab:CreateButton({
   Name = "Jailbreak (Project Auto/Auto Rob, No Key)",
   Callback = function()
      loadstring(game:HttpGet("http://scripts.projectauto.xyz/AutoRobV4"))()
   end,
})

-- Buttons for Main Tab
MainTab:CreateButton({
   Name = "Dex (Client Side Explorer, No Key)",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/GFmpBbLX"))()
   end,
})

MainTab:CreateButton({
   Name = "Infinite Yield Reborn (No Key)",
   Callback = function()
      loadstring(game:HttpGet("https://pastebin.com/raw/LaNjeAYW"))()
   end,
})

-- Buttons for Lumber Tab
LumberTab:CreateButton({
   Name = "Dark X V5.0 (No Key)",
   Callback = function()
      loadstring(game:HttpGet("https://web.archive.org/web/20240325130258/https://raw.githubusercontent.com/darkxwin/darkxsourcethinkyoutousedarkx/main/darkx"))()
   end,
})

LumberTab:CreateButton({
   Name = "Luware V3.5 (No Key)",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Lumber-Tycoon-2-Luware-17204"))()
   end,
})

LumberTab:CreateButton({
   Name = "Kron Hub (No Key)",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Lumber-Tycoon-2-Kron-Hub-New-Release-21047"))()
   end,
})

-- Buttons for Fisch Tab
FischTab:CreateButton({
   Name = "Fisch (God Hub, Key)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/kiciahook/kiciahook/refs/heads/main/loader.lua"))()
   end,
})

FischTab:CreateButton({
   Name = "Fisch (Ather Hub, Key)",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Fisch-AtherHub-24347"))()
   end,
})

-- Buttons for Petgo Tab
PetgoTab:CreateButton({
   Name = "Pets Go (Ather Hub, No Key)",
   Callback = function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/PETS-GO!-AtherHub-22060"))()
   end,
})

-- Buttons for Pet99 Tab
Pet99Tab:CreateButton({
   Name = "Pets Simulator 99 (Zap Hub, Key)",
   Callback = function()
      loadstring(game:HttpGet("https://zaphub.xyz/Exec"))()
   end,
})
























































