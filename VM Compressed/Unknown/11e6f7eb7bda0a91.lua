local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Balls",
   Icon = 0,
   LoadingTitle = "Balls Hub",
   LoadingSubtitle = "by 9ftrev",
   Theme = "Serenity",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Balls Hub"
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

local Tab = Window:CreateTab("Tab Example", 4483362458)
local Section = Tab:CreateSection("Section Example")
local Divider = Tab:CreateDivider()

Rayfield:Notify({
   Title = "Thanks For Executing!",
   Content = "Recommend Me Something discord:9ftrev",
   Duration = 6.5,
   Image = 4483362458,
})

local Button = Tab:CreateButton({
   Name = "Button That Gives 100 Walkspeed",
   Callback = function()
       -- Get the local player
       local player = game.Players.LocalPlayer
       -- Set the walk speed to 100
       player.Character.Humanoid.WalkSpeed = 100
       -- Notify the player
       Rayfield:Notify({
           Title = "Walkspeed Changed!",
           Content = "Your walkspeed has been set to 100.",
           Duration = 5,
           Image = 4483362458,
       })
   end
})

local Toggle = Tab:CreateToggle({
   Name = "Toggle That Turn On And Off",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
   end,
})
