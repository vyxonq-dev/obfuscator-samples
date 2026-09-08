local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Blinded Hub",
   Icon = 0, 
   LoadingTitle = "Blinded Hub Is Loading...",
   LoadingSubtitle = "by DamnedZen",
   Theme = "Ocean",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "BlindedHubConfig", 
      FileName = "Big Hub"
   },
   KeySystem = false
})

-- TABS
local VisualsTab = Window:CreateTab("Visuals", nil)
local MoveTab = Window:CreateTab("Movement", nil)
local MiscTab = Window:CreateTab("Misc", nil)

-- SECTIONS
local VisualsSection = VisualsTab:CreateSection("ESP & Visuals")
local MoveSection = MoveTab:CreateSection("Exploits")
local MiscSection = MiscTab:CreateSection("Utilities")

-- VARIABLES
local ESPEnabled = false
local HitboxEnabled = false
local NoclipEnabled = false
local InfJumpEnabled = false

local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = game.Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- LOGIC: NOCLIP
RunService.Stepped:Connect(function()
    if NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- LOGIC: INF JUMP
UserInputService.JumpRequest:Connect(function()
    if InfJumpEnabled then
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

-- LOGIC: ESP UPDATER (Distance & Toggle Sync)
RunService.RenderStepped:Connect(function()
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local head = char:FindFirstChild("Head")
            local root = char:FindFirstChild("HumanoidRootPart")
            
            -- Update Distance Text
            if head and head:FindFirstChild("BlindedNameTag") then
                local tag = head.BlindedNameTag
                local label = tag:FindFirstChildOfClass("TextLabel")
                if label then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local dist = math.floor((root.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude)
                        label.Text = string.format("%s\n[%d studs]", player.DisplayName or player.Name, dist)
                    end
                end
            end

            -- Sync Visibility
            local hl = char:FindFirstChild("BlindedHighlight")
            if hl then hl.Enabled = ESPEnabled end
            
            local box = char:FindFirstChild("BlindedHitbox")
            if box then box.Visible = HitboxEnabled end
            
            if head and head:FindFirstChild("BlindedNameTag") then
                head.BlindedNameTag.Enabled = ESPEnabled
            end
        end
    end
end)

-- LOGIC: ESP & HITBOX CREATION
local function ApplyESP(player)
    if player == LocalPlayer then return end

    local function CreateESP()
        local char = player.Character or player.CharacterAdded:Wait()
        local head = char:WaitForChild("Head", 5)
        local root = char:WaitForChild("HumanoidRootPart", 5)
        if not head or not root then return end

        -- Highlight ESP
        if not char:FindFirstChild("BlindedHighlight") then
            local highlight = Instance.new("Highlight")
            highlight.Name = "BlindedHighlight"
            highlight.Adornee = char
            highlight.FillColor = Color3.fromRGB(0, 255, 255)
            highlight.FillTransparency = 0.5
            highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
            highlight.Enabled = ESPEnabled
            highlight.Parent = char
        end

        -- Hitbox Visual (SelectionBox)
        if not char:FindFirstChild("BlindedHitbox") then
            local box = Instance.new("SelectionBox")
            box.Name = "BlindedHitbox"
            box.Adornee = char
            box.Color3 = Color3.fromRGB(255, 0, 0)
            box.LineThickness = 0.05
            box.SurfaceColor3 = Color3.fromRGB(255, 0, 0)
            box.SurfaceTransparency = 0.8
            box.Visible = HitboxEnabled
            box.Parent = char
        end

        -- Name & Distance Tag
        if not head:FindFirstChild("BlindedNameTag") then
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "BlindedNameTag"
            billboard.Adornee = head
            billboard.Size = UDim2.new(0, 150, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Enabled = ESPEnabled
            billboard.Parent = head

            local label = Instance.new("TextLabel")
            label.BackgroundTransparency = 1
            label.Size = UDim2.new(1, 0, 1, 0)
            label.Text = player.DisplayName or player.Name
            label.TextColor3 = Color3.fromRGB(255, 255, 255)
            label.TextStrokeTransparency = 0
            label.TextSize = 14
            label.Font = Enum.Font.SourceSansBold
            label.Parent = billboard
        end
    end

    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        CreateESP()
    end)
    
    if player.Character then CreateESP() end
end

-- UI: VISUALS
local ESPToggle = VisualsTab:CreateToggle({
   Name = "Player ESP & Distance",
   CurrentValue = false,
   Flag = "ESP_Toggle",
   Callback = function(Value)
      ESPEnabled = Value
   end,
})

local HitboxToggle = VisualsTab:CreateToggle({
   Name = "Show Player Hitboxes",
   CurrentValue = false,
   Flag = "Hitbox_Toggle",
   Callback = function(Value)
      HitboxEnabled = Value
   end,
})

-- UI: MOVEMENT
local NoclipToggle = MoveTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Flag = "Noclip_Toggle",
   Callback = function(Value)
      NoclipEnabled = Value
   end,
})

local InfJumpToggle = MoveTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfJump_Toggle",
   Callback = function(Value)
      InfJumpEnabled = Value
   end,
})

-- UI: MISC
local RejoinButton = MiscTab:CreateButton({
   Name = "Rejoin Server",
   Callback = function()
      TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
   end,
})

local ServerHopButton = MiscTab:CreateButton({
   Name = "Server Hop",
   Callback = function()
      local url = "games.roproxy.com" .. game.PlaceId .. "/servers/Public?sortOrder=Desc&limit=100"
      
      local success, result = pcall(function()
         return HttpService:JSONDecode(game:HttpGet(url))
      end)

      if success and result and result.data then
         for _, v in pairs(result.data) do
            if v.playing < v.maxPlayers and v.id ~= game.JobId then
               TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id, LocalPlayer)
               return
            end
         end
         Rayfield:Notify({Title = "Server Hop", Content = "No other servers found.", Duration = 3})
      else
         warn("Server Hop Error: " .. tostring(result))
         Rayfield:Notify({Title = "Error", Content = "Failed to fetch server list.", Duration = 3})
      end
   end,
})

-- INITIALIZE
for _, player in pairs(game.Players:GetPlayers()) do
    ApplyESP(player)
end
game.Players.PlayerAdded:Connect(ApplyESP)
