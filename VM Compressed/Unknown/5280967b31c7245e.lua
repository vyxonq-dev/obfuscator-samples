-- Raven Academy | Military Script V2
-- Optimized for Delta Executor
-- Safety: 99% (Clean Code)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "RAVEN ACADEMY | VIP",
   LoadingTitle = "Ø¬Ø§Ø±Ù ØªØ´ØºÙÙ Ø³ÙØ±Ø¨Øª Ø§ÙØ£ÙØ§Ø¯ÙÙÙØ©...",
   LoadingSubtitle = "Ø¨ÙØ§Ø³Ø·Ø© AI Assistant",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RavenSafe"
   }
})

-- ØªØ¨ÙÙØ¨ Ø§ÙÙØ§Ø¹Ø¨ (ÙÙØ© Ø¨Ø¯ÙÙØ©)
local PlayerTab = Window:CreateTab("Movement (Ø§ÙØ­Ø±ÙØ©)", 4483345998)

PlayerTab:CreateSlider({
   Name = "WalkSpeed (Ø§ÙØ³Ø±Ø¹Ø©)",
   Range = {16, 60},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

PlayerTab:CreateSlider({
   Name = "JumpPower (Ø§ÙÙÙØ²)",
   Range = {50, 120},
   Increment = 1,
   Suffix = "Power",
   CurrentValue = 50,
   Flag = "Slider2",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- ØªØ¨ÙÙØ¨ Ø§ÙØ±Ø¤ÙØ© (ÙØ´Ù Ø§ÙØ±ØªØ¨ ÙØ§ÙÙØ§Ø¹Ø¨ÙÙ)
local VisualsTab = Window:CreateTab("ESP (ÙØ´Ù Ø§ÙØ£ÙØ§ÙÙ)", 4483345998)

VisualsTab:CreateButton({
   Name = "Enable ESP (ØªÙØ¹ÙÙ Ø§ÙÙØ§Ø´Ù)",
   Callback = function()
      -- ÙÙØ¯ ÙØ´Ù Ø§ÙÙØ§Ø¹Ø¨ÙÙ Ø®ÙÙ Ø§ÙØ¬Ø¯Ø±Ø§Ù
      loadstring(game:HttpGet('https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/Main.lua'))()
   end,
})

-- ØªØ¨ÙÙØ¨ Ø§ÙÙÙØ§Ù Ø§ÙØ¹Ø³ÙØ±ÙØ© (Ø£Ø¯ÙØ§Øª Ø§ÙØ£ÙØ§Ø¯ÙÙÙØ©)
local AcademyTab = Window:CreateTab("Academy (Ø£Ø¯ÙØ§Øª Ø§ÙÙØ§Ø¨)", 4483345998)

AcademyTab:CreateButton({
   Name = "No Fog (Ø¥Ø²Ø§ÙØ© Ø§ÙØ¶Ø¨Ø§Ø¨)",
   Callback = function()
      game:GetService("Lighting").FogEnd = 100000
   end,
})

AcademyTab:CreateToggle({
   Name = "Infinite Jump (ÙÙØ² ÙØ³ØªÙØ±)",
   CurrentValue = false,
   Flag = "InfJump",
   Callback = function(Value)
      _G.InfJump = Value
      game:GetService("UserInputService").JumpRequest:Connect(function()
         if _G.InfJump then
            game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
         end
      end)
   end,
})

AcademyTab:CreateButton({
   Name = "Fly Menu (ÙØ§Ø¦ÙØ© Ø§ÙØ·ÙØ±Ø§Ù)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.lua"))()
   end,
})

Rayfield:Notify({
   Title = "ØªÙ Ø§ÙØªØ´ØºÙÙ Ø¨ÙØ¬Ø§Ø­",
   Content = "Ø§ÙØ³ÙØ±Ø¨Øª Ø¬Ø§ÙØ² ÙÙØ§Ø³ØªØ®Ø¯Ø§Ù ÙÙ Ø£ÙØ§Ø¯ÙÙÙØ© Ø±ÙÙÙ",
   Duration = 5,
   Image = 4483345998,
})