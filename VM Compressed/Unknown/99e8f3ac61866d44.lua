local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Main Menu",
   LoadingTitle = "Loading Script...",
   LoadingSubtitle = "Rayfield Interface",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false
})

-- Create Tabs
local ESPTab = Window:CreateTab("ESP", 4483362458)
local RobberTab = Window:CreateTab("Robber", 4483362458)
local PoliceTab = Window:CreateTab("Police", 4483362458)

-- Helper Functions
local Players = game:GetService("Players")

local function createHighlight(character, color)
    if not character then return end
    local highlight = character:FindFirstChild("PlayerHighlight")
    if not highlight then
        highlight = Instance.new("Highlight")
        highlight.Name = "PlayerHighlight"
        highlight.Parent = character
    end
    highlight.FillColor = color
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0
end

local function applyESP(checkPoliceOnly, checkSmugglerOnly)
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local hasHat = player.Character:FindFirstChild("PolicemanHat") ~= nil
            
            if checkPoliceOnly and hasHat then
                createHighlight(player.Character, Color3.fromRGB(0, 100, 255)) -- Blue
            elseif checkSmugglerOnly and not hasHat then
                createHighlight(player.Character, Color3.fromRGB(255, 0, 0)) -- Red
            elseif not checkPoliceOnly and not checkSmugglerOnly then
                if hasHat then
                    createHighlight(player.Character, Color3.fromRGB(0, 100, 255))
                else
                    createHighlight(player.Character, Color3.fromRGB(255, 0, 0))
                end
            end
        end
    end
end

-- ESP Tab Elements
local policeLooping = false
ESPTab:CreateToggle({
   Name = "ESP All Police (Loop 10s)",
   CurrentValue = false,
   Flag = "PoliceESPLoop",
   Callback = function(Value)
      policeLooping = Value
      task.spawn(function()
         while policeLooping do
            applyESP(true, false)
            task.wait(10)
         end
      end)
   end,
})

local smugglerLooping = false
ESPTab:CreateToggle({
   Name = "ESP All Smuggler (Loop 10s)",
   CurrentValue = false,
   Flag = "SmugglerESPLoop",
   Callback = function(Value)
      smugglerLooping = Value
      task.spawn(function()
         while smugglerLooping do
            applyESP(false, true)
            task.wait(10)
         end
      end)
   end,
})

ESPTab:CreateButton({
   Name = "ESP All",
   Callback = function()
      applyESP(false, false)
   end,
})

-- Robbers Tab Elements
RobberTab:CreateButton({
   Name = "Trigger TouchInterest",
   Callback = function()
      local target = workspace:FindFirstChild("Map") 
         and workspace.Map:FindFirstChild("WalkTo") 
         and workspace.Map.WalkTo:FindFirstChild("Explosion")
      
      local localPlayer = Players.LocalPlayer
      local hrp = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

      if target and hrp and firetouchinterest then
         firetouchinterest(hrp, target, 0)
         task.wait(0.1)
         firetouchinterest(hrp, target, 1)
      end
   end,
})

-- Police Tab Elements
PoliceTab:CreateLabel("Coming Soon!")
