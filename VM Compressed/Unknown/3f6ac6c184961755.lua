--https://docs.sirius.menu/rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Destructible menu",
   Icon = 0, -- Use 0 for no icon
   LoadingTitle = "Ultimate TSB Hub",
   LoadingSubtitle = "by Padoru_Flora",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "TETPA Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
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

local Tab = Window:CreateTab("F3X", 483057120) -- Title, Image

Rayfield:Notify({
   Title = "Notification",
   Content = "Hii",
   Duration = 6.5,
   Image = "home",
})

local Button = Tab:CreateButton({
   Name = "LNicky F3X Gui v3.60",
   Callback = function()
     loadstring(game:HttpGet('https://gist.githubusercontent.com/KemonoFurry/df08b68a44a249318c75eaa7d6828aef/raw/4197b3baf39d0af814b37b065168ee74de28a315/gistfile1.txt'))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Draw in Chat",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/_/refs/heads/main/a"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Krystal Dance V3 Modded",
   Callback = function()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/sparezirt/Script/refs/heads/main/.github/workflows/JustABaseplate.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Oxide Reanimation",
   Callback = function()
     loadstring(game:HttpGet("https://gist.github.com/KemonoFurry/b0278de38a4a7f199e9d315db2f0ce14/raw/848538519599c64ebb39a13f44925001369ede4a/gistfile1.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "skebob (use any reanimations)",
   Callback = function()
     loadstring(game:HttpGet("https://gist.github.com/KemonoFurry/ce69d6877bd54e2cc6a5dd9235b5685c/raw/fd8fd35d5eb2eab65828af03a91b0cbee6a2a2d1/gistfile1.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "CurrentAngle V2 (Reanimation)",
   Callback = function()
     loadstring(game:HttpGet("https://gist.github.com/KemonoFurry/aa3dbb00f46758bc89b6d51ade5ab23e/raw/af2b6ce79a17989590bbdd900ab4519eac1ee711/gistfile1.txt"))()
   end,
})

