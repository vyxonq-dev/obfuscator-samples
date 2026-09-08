local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "TSB Moveset",
   Icon = 0, -- Use 0 for no icon
   LoadingTitle = "TSB god",
   LoadingSubtitle = "by AHFGG00900171",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default",

   ToggleUIKeybind = "C",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Padoru Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = false
   },

   KeySystem = false,
   KeySettings = {
      Title = "Key is 1488",
      Subtitle = "Key System",
      Note = "Key: 1488",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"1488"}
   }
})

local Tab = Window:CreateTab("AHFGG00900171_SCRIPTS", 87642604695954) -- Title, Image

Rayfield:Notify({
   Title = "Notification",
   Content = "Hii",
   Duration = 6.5,
   Image = "home",
})

local Button = Tab:CreateButton({
   Name = "VEXOR (saitama)",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VEXOR.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "FAVILLA (garou)",
   Callback = function()
        getgenv().Rate = .03
        --idle aura rate

        getgenv().nocam = false
        --changes if 1 is a cutscene or not

        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/FAVILLA.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "KuyJuy (Character Menu)",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/4ntrax7w7v9/4ntrax-Scripts/refs/heads/main/KKJ-Moveset"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "ARCAURA (garou)",
   Callback = function()
        getgenv().OptimizeUltimate = true
        --self explanatory
        getgenv().ReduceUltFlash = true
        --self explanatory
        getgenv().Move1Insta = false
        --set it to false if you dont want the first move to instant kill
        getgenv().LowQualityMode = false
        --set to true if you have a shit pc (like me)
        getgenv().BetaConsole = false
        --its a console menu so you can modify each settings whenever you want
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/ARCAURA.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "VOLTA (sonic)",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VOLTA.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Unsealed Gojo",
   Callback = function()
 loadstring(game:HttpGet("https://pastebin.com/raw/zF6Rdky0"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Star glitchers",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SG_DEMO.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "SION ELTNAM ATLASIA (sonic)",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/SIONELTNAMATLASIA.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "AKIHA VERMILION (monster form)",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/AKIHA_VERMILLION.lua"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "MULTIPHEX",
   Callback = function()
 loadstring(game:HttpGet("https://gist.githubusercontent.com/KemonoFurry/98aad9df0599c395f61f2e88e9ec0c90/raw/9b44363123f2c36401ded5be8525b84c2ef063f6/gistfile1.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "gojo (saitama (not by me))",
   Callback = function()
    getgenv().morph = false
    loadstring(game:HttpGet("https://raw.githubusercontent.com/skibiditoiletfan2007/BaldyToSorcerer/refs/heads/main/LatestV2.lua"))()
   end,
})