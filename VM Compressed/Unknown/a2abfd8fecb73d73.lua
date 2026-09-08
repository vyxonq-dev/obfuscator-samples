

--by dark_angel


debugX = true

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "NovaFlow Hub",
   Icon = 0,
   LoadingTitle = "NovaFlow Hub",
   LoadingSubtitle = "by dark_angel",
   Theme = "Ocean",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = false,
      FolderName = "NovaFlowl",
      FileName = "NovaFlow Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "tEap5SgQ",
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
local Tab = Window:CreateTab("Free Cars", 4483362458) -- Title, Image

local Section = Tab:CreateSection("FREE PASS SPAWNER")

local Button = Tab:CreateButton({
    Name = "Track Spawner",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui["Pistaa"].Track.Visible = true
    end,
})
local Button = Tab:CreateButton({
    Name = "F1 Spawner",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui["F1Pasee"].Formula.Visible = true
    end,
})
local Button = Tab:CreateButton({
    Name = "Admin Vehicle Spawn",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui["AdminVehicles"].Vehicles.Visible = true
    end,
})
local Button = Tab:CreateButton({
    Name = "Classic Spawner",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui["ClassicPass"].Classic.Visible = true
    end,
})
Rayfield:LoadConfiguration()
