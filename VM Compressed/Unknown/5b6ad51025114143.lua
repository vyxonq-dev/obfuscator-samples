local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
local Window = Rayfield:CreateWindow({
   Name = "#kman.rs🎭",
   Icon = 0,
   LoadingTitle = "98%",
   LoadingSubtitle = "by #kman.rs🎭",
   Theme = "Default",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "123"
   },
   Discord = {
      Enabled = true,
      Invite = "https://discord.gg/8A6k73JqCM",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "#kman.rs",
      Subtitle = "123",
      Note = "join for get key: discord.gg/8A6k73JqCM",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"discord.gg/8A6k73JqCM"}
   }
})
 
-- Main Tab
local MainTab = Window:CreateTab("Main", 4483362458)
local MainSection = MainTab:CreateSection("Main Functions")
 
local Button = MainTab:CreateButton({
   Name = "Click for get OP melee",
   Callback = function()

--BUY BEST POWER
local args = {
    [1] = "Warp",
    [2] = 0
}

game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("BuyPower"):FireServer(unpack(args))

   end,
})

local Button = MainTab:CreateButton({
   Name = "Click for get FREE OP PET",
   Callback = function()

local args = {
    [1] = "Abyss",
    [2] = "Phoenix",
    [3] = 87358947358343535894735834353
}

game:GetService("ReplicatedStorage"):WaitForChild("PEV"):WaitForChild("Hatch"):FireServer(unpack(args))

   end,
})


-- Inf S Toggle
MainTab:CreateToggle({
   Name = "Inf Strenght",
   Info = "Toggle to enable or disable automatic rebirths.",
   CurrentValue = false,
   Flag = "AutoRebirthToggle", -- Unique identifier for configuration saving
   Callback = function(Value)
      _G.AutoRebirth = Value -- Update the global variable based on toggle state
      if _G.AutoRebirth then
         spawn(function()
            while _G.AutoRebirth do
               task.wait(0)

--INF POWER
local args = {
    [1] = 997548375835636
}

game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("Train"):FireServer(unpack(args))
            end
         end)
         print("Auto Rebirth Activated!")
      else
         print("Auto Rebirth Deactivated!")
      end
   end,
})


-- Inf W Toggle
MainTab:CreateToggle({
   Name = "Inf Wins",
   Info = "Toggle to enable or disable automatic rebirths.",
   CurrentValue = false,
   Flag = "AutoRebirthToggle", -- Unique identifier for configuration saving
   Callback = function(Value)
      _G.AutoRebirth = Value -- Update the global variable based on toggle state
      if _G.AutoRebirth then
         spawn(function()
            while _G.AutoRebirth do
               task.wait(0)

--INF WINS
local args = {
    [1] = 997548375835636
}

game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("WinGain"):FireServer(unpack(args))

            end
         end)
         print("Auto Rebirth Activated!")
      else
         print("Auto Rebirth Deactivated!")
      end
   end,
})

-- Inf Rebirths Toggle
MainTab:CreateToggle({
   Name = "Inf Rebirth",
   Info = "Toggle to enable or disable automatic rebirths.",
   CurrentValue = false,
   Flag = "AutoRebirthToggle", -- Unique identifier for configuration saving
   Callback = function(Value)
      _G.AutoRebirth = Value -- Update the global variable based on toggle state
      if _G.AutoRebirth then
         spawn(function()
            while _G.AutoRebirth do
               task.wait(0)

--INF REBIRTHS
local args = {
    [1] = 0
}

game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("HealthAdd"):FireServer(unpack(args))

            end
         end)
         print("Auto Rebirth Activated!")
      else
         print("Auto Rebirth Deactivated!")
      end
   end,
})

-- Inf Enchant Toggle
MainTab:CreateToggle({
   Name = "Inf Enchantment",
   Info = "Toggle to enable or disable automatic rebirths.",
   CurrentValue = false,
   Flag = "AutoRebirthToggle", -- Unique identifier for configuration saving
   Callback = function(Value)
      _G.AutoRebirth = Value -- Update the global variable based on toggle state
      if _G.AutoRebirth then
         spawn(function()
            while _G.AutoRebirth do
               task.wait(0)

--INF ENCHANTMENT
local args = {
    [1] = 3,
    [2] = 99999999999999999999999999999999999999999999
}

game:GetService("ReplicatedStorage"):WaitForChild("Event"):WaitForChild("Enchanted"):FireServer(unpack(args))


            end
         end)
         print("Auto Rebirth Activated!")
      else
         print("Auto Rebirth Deactivated!")
      end
   end,
})

-- Main Tab
local MainTab = Window:CreateTab("Links", 4483362458)
local MainSection = MainTab:CreateSection("Main Functions")
 
local Button = MainTab:CreateButton({
   Name = "Discord link",
   Callback = function()
   setclipboard("https://discord.gg/8A6k73JqCM")
   toclipboard("https://discord.gg/8A6k73JqCM")
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Youtube",
   Callback = function()
setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Tiktok Profile",
   Callback = function()
setclipboard("https://www.tiktok.com/@kman.rs")
toclipboard("https://www.tiktok.com/@kman.rs")
   end,
})
 
Rayfield:LoadConfiguration()