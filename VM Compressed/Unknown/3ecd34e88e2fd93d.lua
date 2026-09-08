local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create "Get Key" GUI (Shows while Key System is active)
local KeyGUI = Instance.new("ScreenGui")
local KeyButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

KeyGUI.Name = "NagisHubKeyHelper"
KeyGUI.Parent = game.CoreGui
KeyGUI.DisplayOrder = 999

KeyButton.Name = "GetKeyButton"
KeyButton.Parent = KeyGUI
KeyButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyButton.Position = UDim2.new(0, 10, 0.5, 0)
KeyButton.Size = UDim2.new(0, 100, 0, 40)
KeyButton.Font = Enum.Font.SourceSansBold
KeyButton.Text = "Get Key"
KeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyButton.TextSize = 14
KeyButton.Active = true
KeyButton.Draggable = true

UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = KeyButton

KeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/ggXduDCxVw")
    Rayfield:Notify({
        Title = "Copied!",
        Content = "Discord link copied to clipboard.",
        Duration = 3,
        Image = 4483362458,
    })
end)

-- Initialize Window
local Window = Rayfield:CreateWindow({
   Name = "Nagi's Hub Tower of Hell",
   LoadingTitle = "Created by mikageereo",
   LoadingSubtitle = "by mikageereo",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "NagisHub",
      FileName = "ToH_Config"
   },
   Discord = {
      Enabled = false,
      Invite = "ggXduDCxVw",
      RememberJoins = true
   },
   KeySystem = true,
   KeySettings = {
      Title = "Nagi's Hub | Key System",
      Subtitle = "Key System",
      Note = "Join the discord for the key!",
      FileName = "NagisHubKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"MIKAGEHELL"}
   }
})

-- Remove help button once authenticated
KeyGUI:Destroy()

local MainTab = Window:CreateTab("Main Features", 4483362458)

-- Warning Section
MainTab:CreateSection("⚠️ WARNING")
MainTab:CreateParagraph({
    Title = "USE WITH EXTREME CAUTION", 
    Content = "This script modifies game behavior. Teleporting can trigger anti-cheat bans. Use at your own risk."
})

local UtilsSection = MainTab:CreateSection("Utilities")

MainTab:CreateButton({
   Name = "Teleport to End",
   Callback = function()
      local tower = game:GetService("Workspace"):FindFirstChild("tower")
      local finish = tower and tower:FindFirstChild("sections") and tower.sections:FindFirstChild("finish")
      
      if finish and finish:FindFirstChild("FinishGlow") then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = finish.FinishGlow.CFrame + Vector3.new(0, 5, 0)
          Rayfield:Notify({
             Title = "Teleported",
             Content = "Successfully arrived at the end of the obby.",
             Duration = 3,
             Image = 4483362458,
          })
      else
          Rayfield:Notify({
             Title = "Error",
             Content = "Wait for the tower to load before teleporting!",
             Duration = 5,
             Image = 4483362458,
          })
      end
   end,
})

MainTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end,
})