local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "ipako hub (test)",
   Icon = 0,
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ShowText = "Rayfield",
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})
local Tab = Window:CreateTab("Examination", 4483362458)
local Button = Tab:CreateButton({
   Name = "Auto Get Badges",
   -- Callback должен быть функцией. Внутри функции мы получаем скрипт и выполняем его.
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet('https://raw.githubusercontent.com/Harlen911/Scripts/refs/heads/main/Examination%20Get%20all%20badges')
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Button = Tab:CreateButton({
   Name = "Vanith",
   -- Callback должен быть функцией. Внутри функции мы получаем скрипт и выполняем его.
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/Snipez-Dev/Rbx-Scripts/refs/heads/main/Examination")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Tab = Window:CreateTab("Arsenal", 4483362458)
local Button = Tab:CreateButton({
   Name = "insanity.xyz 'best script solara don't supported'",
   -- Callback должен быть функцией. Внутри функции мы получаем скрипт и выполняем его.
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/jaysterrz/insanity.xyz/refs/heads/main/InsanityLoader.lua")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Button = Tab:CreateButton({
   Name = "yoxi hub",
   -- Callback должен быть функцией. Внутри функции мы получаем скрипт и выполняем его.
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/Yomkaa/YOXI-HUB/refs/heads/main/loader")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Tab = Window:CreateTab("Counter blox", 4483362458)
local Button = Tab:CreateButton({
   Name = "solaris.lol",
   -- Callback должен быть функцией. Внутри функции мы получаем скрипт и выполняем его.
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Button = Tab:CreateButton({
   Name = "Skinchanger",
   -- Callback должен быть функцией. Внутри функции мы получаем скрипт и выполняем его.
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/MMoonDzn/AuroraChanger/refs/heads/main/loader.lua")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Tab = Window:CreateTab("BloxStrike", 4483362458)
local Button = Tab:CreateButton({
   Name = "StellarHub",
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://pandadevelopment.net/virtual/file/f46a7eb5a71f1048")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Tab = Window:CreateTab("The Lost Front", 4483362458)
local Button = Tab:CreateButton({
   Name = "Sniper Hub Keyless",
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/pubmain/sniper-bin/main/Loader.luau")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Button = Tab:CreateButton({
   Name = "Nigginality Hub",
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/combatlegnd/combatlegnd/refs/heads/main/NH-Loader")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Tab = Window:CreateTab("Defuse Division", 4483362458)
local Button = Tab:CreateButton({
   Name = "Homohack 'best for defuse division'",
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/dementiaenjoyer/homohack/refs/heads/main/loader.lua")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Button = Tab:CreateButton({
   Name = "Zeferus.fun",
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/necodehacks/RobloxScripts/refs/heads/main/defuse_divison.lua")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
local Tab = Window:CreateTab("Decaying Winter", 4483362458)
local Button = Tab:CreateButton({
   Name = "Nigginality hub",
   Callback = function()
      local ok, res = pcall(function()
         local s = game:HttpGet("https://raw.githubusercontent.com/necodehacks/RobloxScripts/refs/heads/main/defuse_divison.lua")
         return loadstring(s)()
      end)
      if not ok then
         warn("Ошибка при выполнении кнопки:", res)
      end
   end,
})
