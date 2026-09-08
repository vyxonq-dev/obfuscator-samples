local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Yin Hub (Old Script) (Discontinued)",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Yin Hub Brookhaven Rp",
   LoadingSubtitle = "by ArceusX_Roblox123",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "YinHub"
   }
})

local Tab = Window:CreateTab("RIP", 4483362458) -- Title, Image
local Label = Tab:CreateLabel("Yin Hub Script Removed Sorry", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Label = Tab:CreateLabel("New Script Alya Hub Here", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Label = Tab:CreateLabel("Execute Script (AlyaHub)", 4483362458, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Button = Tab:CreateButton({
   Name = "Alya Hub (Brookhaven Rp)",
   Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/BgmCBDBe"))()
   end,
})
