local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "▪️ DITB HUB V2 ▪️",
    LoadingTitle = "▪️ DITB HUB ▪️",
    LoadingSubtitle = "Made by: @xenlover",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "Big Hub"
    },
    Discord = {
        Enabled = true,
        Invite = "zWrSB6D94q",
        RememberJoins = false
    },
    KeySystem = false,
    KeySettings = {
        Title = "Untitled",
        Subtitle = "Key System",
        Note = "No method of obtaining the key is provided",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
    }
})

print("▪️ DITB HUB ▪️ (Made by @xenlover)Enjoy the Script!")

local TabVisuals = Window:CreateTab("🔎 Visuals")
local SectionVisuals = TabVisuals:CreateSection("Visuals")

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local espEnabled = false
local distanceLabels = {}
local espConnection
local function createCardLabels(player)
    if player == Players.LocalPlayer then return end
    local character = player.Character
    if character and character:FindFirstChild("Head") then
        local humanoid = character:FindFirstChild("Humanoid")
        if humanoid and humanoid.Health <= 0 then
            return
        end
        local head = character.Head
        local cardFolder = Workspace:FindFirstChild(player.Name) and Workspace[player.Name]:FindFirstChild("Cards")
        if cardFolder then
            local cardLabels = distanceLabels[player] or {}
            for i, card in ipairs(cardFolder:GetChildren()) do
                local cardLabel = cardLabels[i]
                if not cardLabel then
                    cardLabel = Instance.new("BillboardGui")
                    cardLabel.Adornee = head
                    cardLabel.Size = UDim2.new(0, 70, 0, 15) -- Reduced size from 100,20 to 70,15
                    cardLabel.StudsOffset = Vector3.new(0, 2.5 + (i * 0.6), 0) -- Reduced spacing from 0.8 to 0.6
                    cardLabel.AlwaysOnTop = true
                    cardLabel.Parent = head
                    local cardTextLabel = Instance.new("TextLabel")
                    cardTextLabel.Size = UDim2.new(1, 0, 1, 0)
                    cardTextLabel.BackgroundTransparency = 1
                    cardTextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
                    cardTextLabel.TextStrokeTransparency = 0.3
                    cardTextLabel.TextScaled = true
                    cardTextLabel.Font = Enum.Font.GothamBold
                    cardTextLabel.TextSize = 10 -- Reduced from 14 to 10
                    cardTextLabel.Text = card.Name
                    cardTextLabel.Parent = cardLabel
                    cardLabels[i] = cardLabel
                end
                cardLabels[i].TextLabel.Text = card.Name
                cardLabels[i].Enabled = espEnabled
            end
            distanceLabels[player] = cardLabels
            for i = #cardFolder:GetChildren() + 1, #cardLabels do
                cardLabels[i].Enabled = false
            end
        end
    end
end
local function updateCardLabels()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Head") then
            createCardLabels(player)
        end
    end
end
local function onPlayerDied(player)
    if distanceLabels[player] then
        for _, label in ipairs(distanceLabels[player]) do
            label.Enabled = false
        end
        distanceLabels[player] = nil
    end
end
local function toggleESP(value)
    espEnabled = value
    if espEnabled then
        if espConnection then
            espConnection:Disconnect()
        end
        espConnection = RunService.Heartbeat:Connect(function()
            updateCardLabels()
        end)
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                local humanoid = player.Character:FindFirstChild("Humanoid")
                if humanoid then
                    humanoid.Died:Connect(function()
                        onPlayerDied(player)
                    end)
                end
            end
        end
    else
        if espConnection then
            espConnection:Disconnect()
        end
        for _, labels in pairs(distanceLabels) do
            for _, label in ipairs(labels) do
                label.Enabled = false
            end
        end
        distanceLabels = {}
    end
end
local ToggleESP = TabVisuals:CreateToggle({
    Name = "Cards ESP",
    CurrentValue = false,
    Flag = "ESP2",
    Callback = function(Value)
        toggleESP(Value)
    end,
})

local RunService = game:GetService("RunService")
local fullbrightEnabled = false
local originalLighting = {
    FogEnd = game.Lighting.FogEnd,
    TintColor = game.Lighting.ColorCorrection.TintColor,
    FogColor = game.Lighting.FogColor,
    Ambient = game.Lighting.Ambient
}

local function toggleFullbright(value)
    fullbrightEnabled = value
    if fullbrightEnabled then
        RunService.Heartbeat:Connect(function()
            if fullbrightEnabled then
                game.Lighting.FogEnd = math.max(game.Lighting.FogEnd, originalLighting.FogEnd)
                game.Lighting.ColorCorrection.TintColor = originalLighting.TintColor
                game.Lighting.FogColor = originalLighting.FogColor
                game.Lighting.Ambient = originalLighting.Ambient
            end
        end)
    end
end

local ToggleFullbright = TabVisuals:CreateToggle({
    Name = "Fullbright (See in dark)",
    CurrentValue = false,
    Flag = "Fullbright",
    Callback = function(Value)
        toggleFullbright(Value)
    end,
})

local TabMain = Window:CreateTab("♠️ Game")
local SectionMain = TabMain:CreateSection("Main")

local Paragraph = TabMain:CreateParagraph({Title = "Atention", Content = "Execute Auto-Shoot once per match!"})

local Button = TabMain:CreateButton({
   Name = "Auto-Shoot in Duels",
   Callback = function()
      local LocalPlayer = game.Players.LocalPlayer
      local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

      local CurrentCamera = workspace.CurrentCamera
      local Duel = workspace:WaitForChild("Duel")

      if workspace:FindFirstChild("injected") then
         Rayfield:Notify({
   Title = "Error",
   Content = "Auto-Shoot has already been executed.",
   Duration = 5,
   Image = nil,
})
         return
      end

      if not Duel then
         Rayfield:Notify({
   Title = "Error",
   Content = "You are not in a match!",
   Duration = 5,
   Image = nil,
})
         return
      end

      Rayfield:Notify({
   Title = "Success",
   Content = "Auto-Shoot executed sucessfully.",
   Duration = 5,
   Image = nil,
})

      local function fireAtTarget(targetPlayer)
         if not targetPlayer or targetPlayer == LocalPlayer then return end
         game.ReplicatedStorage.Remote.PickPlayerRevolver:FireServer(targetPlayer)
      end

      game:GetService("RunService").Heartbeat:Connect(function()
         if Duel.Active.Value and (Duel.Player1.Value == LocalPlayer or Duel.Player2.Value == LocalPlayer) then
            print("1")

            local opponentPlayer = nil
            if Duel.Player1.Value == LocalPlayer then
               opponentPlayer = Duel.Player2.Value
            elseif Duel.Player2.Value == LocalPlayer then
               opponentPlayer = Duel.Player1.Value
            end

            if opponentPlayer then
               fireAtTarget(opponentPlayer)
            end
         end
      end)

      local injectedScript = Instance.new("LocalScript")
      injectedScript.Name = "injected"
      injectedScript.Parent = workspace
   end,
})

local Button = TabMain:CreateButton({
    Name = "Reveal Hidden Cards",
    Callback = function()
        local player = game.Players.LocalPlayer
        local cardsFolder = workspace:WaitForChild(player.Name):WaitForChild("Cards")

        local hiddenCards = {}

        for _, card in ipairs(cardsFolder:GetChildren()) do
            if card:FindFirstChild("isHidden") then
                table.insert(hiddenCards, card.Name)
            end
        end

        if #hiddenCards > 0 then
            Rayfield:Notify({
                Title = "Hidden Cards",
                Content = "Hidden Cards: " .. table.concat(hiddenCards, ", "),
                Duration = 5,
                Image = nil,
            })
        else
            Rayfield:Notify({
                Title = "No Hidden Cards",
                Content = "You dont have any hidden cards!",
                Duration = 5,
                Image = nil,
            })
        end
    end,
})
