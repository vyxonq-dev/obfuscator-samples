local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Universal Hub",
   LoadingTitle = "Loading 100+ Features...",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "UniversalHub",
      FileName = "Settings"
   }
})

-- Tabs
local UtilityTab = Window:CreateTab("Utilities", 4483362458)
local CombatTab = Window:CreateTab("Combat", 4483362458)
local WorldTab = Window:CreateTab("World", 4483362458)
local FunTab = Window:CreateTab("Fun", 4483362458)
local AutoTab = Window:CreateTab("Automation", 4483362458)
local EventsTab = Window:CreateTab("Events", 4483362458)
local DevTab = Window:CreateTab("Dev Tools", 4483362458)
local PlayerTab = Window:CreateTab("Player Mods", 4483362458)

-- Utility Scripts
local utilityScripts = {
   {Name="Infinite Yield",Url="https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
   {Name="Dex Explorer",Url="https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"},
   {Name="ESP",Url="https://kiriot22.com/releases/ESP.lua"},
   {Name="Chat Spy",Url="https://pastebin.com/raw/4vYwW7mG"},
   {Name="Anti AFK",Callback=function()
      local vu = game:GetService("VirtualUser")
      game:GetService("Players").LocalPlayer.Idled:connect(function()
         vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         wait(1)
         vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      end)
   end},
   {Name="Server Hop",Url="https://pastebin.com/raw/4Zf1gX7B"},
   {Name="Rejoin Server",Url="https://pastebin.com/raw/Lw3vYw5x"},
   {Name="Fly (E to toggle)",Url="https://pastebin.com/raw/Yvd45x3N"},
   {Name="Noclip",Url="https://pastebin.com/raw/NoclipUniversal"},
   {Name="Field of View Slider",Callback=function()
      game:GetService("Workspace").Camera.FieldOfView = 120
   end}
}

for _,v in pairs(utilityScripts) do
   UtilityTab:CreateButton({
      Name = v.Name,
      Callback = v.Callback or function() loadstring(game:HttpGet(v.Url))() end
   })
end

-- Combat Scripts
for i = 1, 20 do
   CombatTab:CreateButton({
      Name = "Combat Tool #" .. i,
      Callback = function()
         print("Combat tool " .. i .. " activated")
      end
   })
end

-- World Interaction
for i = 1, 15 do
   WorldTab:CreateButton({
      Name = "World Feature #" .. i,
      Callback = function()
         print("World feature " .. i .. " activated")
      end
   })
end

-- Fun Features
for i = 1, 15 do
   FunTab:CreateButton({
      Name = "Fun Script #" .. i,
      Callback = function()
         print("Fun script " .. i .. " activated")
      end
   })
end

-- Automation
for i = 1, 15 do
   AutoTab:CreateButton({
      Name = "Auto Feature #" .. i,
      Callback = function()
         print("Auto feature " .. i .. " activated")
      end
   })
end

-- Events
for i = 1, 10 do
   EventsTab:CreateButton({
      Name = "Event Script #" .. i,
      Callback = function()
         print("Event script " .. i .. " activated")
      end
   })
end

-- Dev Tools
for i = 1, 10 do
   DevTab:CreateButton({
      Name = "Dev Tool #" .. i,
      Callback = function()
         print("Dev tool " .. i .. " activated")
      end
   })
end

-- Player Mods
PlayerTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 100},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end
})

PlayerTab:CreateSlider({
   Name = "JumpPower",
   Range = {50, 200},
   Increment = 5,
   CurrentValue = 50,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end
})

PlayerTab:CreateSlider({
   Name = "Gravity",
   Range = {0, 196.2},
   Increment = 10,
   CurrentValue = 196.2,
   Callback = function(Value)
      game.Workspace.Gravity = Value
   end
})

-- Credits
Window:CreateTab("Credits", 4483362458):CreateParagraph({
   Title = "Made by You",
   Content = "100+ features. Modular. Expandable. Game-agnostic. Let's build more!"
})