local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()



local Window = Rayfield:CreateWindow({
   Name = "Futa Hub",
   Icon = 0,
   LoadingTitle = "Futa Hub",
   LoadingSubtitle = "grimmkiel",
   ShowText = "Rayfield",
   Theme = "Default",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, 
      FileName = "Futa Hub"
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

local Tab = Window:CreateTab("Main", 4483362458)

local Section = Tab:CreateSection("Main Stuff")

Rayfield:Notify({
   Title = "kill yourself",
   Content = "I own you fag",
   Duration = 6.5,
   Image = 4483362458,
})

local Button = Tab:CreateButton({
   Name = "inf money and gems 'don't spam it will break.'",
   Callback = function()
   for _ = 1, 1000 do game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("MysteryBoxEvent"):FireServer() end
   end,
})

local Button = Tab:CreateButton({
   Name = "Loop Spins 'Rejoin to make stop 'becomes laggy''",
   Callback = function()
   while true do
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinRequestEvent"):FireServer()

    
    wait(0.5)

    
    local args = {
        1
    }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SpinWheelPrizeEvent"):FireServer(unpack(args))

   
    wait(1)
end

   end,
})

local Button = Tab:CreateButton({
   Name = "Loop Rebirth",
   Callback = function()
   while true do
    local args = {
        0,
        50000,
        150
    }
    
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("RebirthConfirmEvent"):FireServer(unpack(args))
    
    wait(0)
end


   end,
})
