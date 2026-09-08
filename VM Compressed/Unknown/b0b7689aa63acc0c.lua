local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Auto-copy Linkvertise link to clipboard
local keyLink = "link-hub.net/2559507/WR7MXJRHfaEc"
setclipboard(keyLink)

local Window = Rayfield:CreateWindow({
   Name = "🔥 VNGEx Hub | Universal - Namoblox",
   LoadingTitle = "VNGEx Universal Loading...",
   LoadingSubtitle = "by Namoblox",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "VNGEx_Configs",
      FileName = "MainConfig"
   },
   KeySystem = true,
   KeySettings = {
      Title = "VNGEx Hub | Key System",
      Subtitle = "Get key to continue",
      Note = "Link copied to clipboard! Or get it here: " .. keyLink,
      FileName = "VNGExKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"ThisIskey"} -- Exact key: ThisIskey
   }
})

local ScriptTab = Window:CreateTab("📜 Script Collection", 4483345998)

-- SECTION BLOX FRUITS (MỚI THÊM)
ScriptTab:CreateSection("⭐ Highlights")

ScriptTab:CreateButton({
   Name = "🍎 Load VNGEx Blox Fruits (GOD MODE)",
   Callback = function()
      Rayfield:Notify({Title = "VNGEx Hub", Content = "Executing Blox Fruits God Mode...", Duration = 3})
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Namoblox/8721a139b4c0e3ed5ddbc71fbc425f99/raw/Blox%2520Fruits.lua"))()
   end,
})

-- SECTION CÁC SCRIPT KHÁC
ScriptTab:CreateSection("Featured Scripts")

ScriptTab:CreateButton({
   Name = "🎥 Load FreeCam",
   Callback = function()
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Namoblox/c80e642ce3c6753a2561edcfb9bc4c27/raw/FreeCam.lua"))()
   end,
})

ScriptTab:CreateButton({
   Name = "🖼️ Load VNGEx Gui",
   Callback = function()
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Namoblox/426ecebefb8f90d6f9647eb6c1965b99/raw/VNGEx%2520Gui"))()
   end,
})

ScriptTab:CreateButton({
   Name = "🎯 Load Blind Shot",
   Callback = function()
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Namoblox/7892fef1d9654015c1430d2a4332e52b/raw/Blind%2520Shot"))()
   end,
})

ScriptTab:CreateButton({
   Name = "🚀 Load Just A VNGEx Hub",
   Callback = function()
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Namoblox/aff6ae9c77b533aadb19b5bd50bb6b8b/raw/Just%20A%20VNGEx%20Hub"))()
   end,
})

ScriptTab:CreateButton({
   Name = "🌊 Load Escape Tsunami (Brainrot)",
   Callback = function()
      loadstring(game:HttpGet("https://gist.githubusercontent.com/Namoblox/4059e1bd88016b8978082ea10f54021f/raw/ExcapeTFB.lua"))()
   end,
})

local PlayerTab = Window:CreateTab("🏃 Player", 4483345998)
PlayerTab:CreateSlider({
   Name = "Walk Speed", 
   Range = {16, 500}, 
   Increment = 1, 
   Suffix = "Speed", 
   CurrentValue = 16, 
   Flag = "P1", 
   Callback = function(V) 
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V 
      end
   end
})

PlayerTab:CreateSlider({
   Name = "Jump Power", 
   Range = {50, 500}, 
   Increment = 1, 
   Suffix = "Power", 
   CurrentValue = 50, 
   Flag = "P2", 
   Callback = function(V) 
      if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = V 
      end
   end
})

local SettingsTab = Window:CreateTab("⚙️ Settings", 4483345998)
SettingsTab:CreateButton({
   Name = "🔄 Rejoin Server", 
   Callback = function() 
      game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer) 
   end
})

Rayfield:Notify({
   Title = "Access Granted!", 
   Content = "Welcome to VNGEx Hub by Namoblox", 
   Duration = 5
})