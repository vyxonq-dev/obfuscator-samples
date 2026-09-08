-- [[ VICE CITY 2 CUSTOM HUB ]]
-- Framework: Rayfield UI Library
-- Features: Movement, Teleports

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create the main Cheat Window interface
local Window = Rayfield:CreateWindow({
   Name = "Vice City 2 Underworld Hub",
   LoadingTitle = "Initializing...",
   ConfigurationSaving = { Enabled = false },
   KeySystem = false
})

local LocalPlayerTab = Window:CreateTab("Player Tweaks")
local TeleportTab = Window:CreateTab("Map Teleports")

-- =========================================================
-- [PLAYER TWEAKS]
-- =========================================================
LocalPlayerTab:CreateSlider({
   Name = "WalkSpeed", Range = {16, 250}, CurrentValue = 16,
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

-- =========================================================
-- [TELEPORTS]
-- =========================================================
TeleportTab:CreateButton({
   Name = "Teleport to South Bronx",
   Callback = function() game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120, 5, -340) end,
})
