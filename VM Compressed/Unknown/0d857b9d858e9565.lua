--// Hydra Productions | Steel A Object Hub (Rayfield Rework with permanent "T" key and button)

--// Services
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

--// Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

--// Window Setup
local Window = Rayfield:CreateWindow({
    Name = "Hydra Hub",
    LoadingTitle = "Hydra Productions",
    LoadingSubtitle = "by Hydra Productions",
    ConfigurationSaving = { Enabled = false },
    KeySystem = false
})

--// Tabs
local MainTab = Window:CreateTab("Main", 4483362458)
local AutoTab = Window:CreateTab("Auto", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

--// Remote Events
local completeTutorial = ReplicatedStorage:WaitForChild("Events"):WaitForChild("CompleteTutorial")
local x2Luck = ReplicatedStorage:WaitForChild("Events"):WaitForChild("X2LuckActivated")

--// Main Tab Buttons
MainTab:CreateButton({
    Name = "Complete Tutorial & Rejoin",
    Callback = function()
        completeTutorial:FireServer()
        TeleportService:Teleport(game.PlaceId, LocalPlayer)
    end,
})
--// Auto Tab Variables
local AutoStealSecretsEnabled = false
local selectedSecrets = {}

--// Utility: Get safe position
local function getSafePosition(obj)
    if obj:IsA("BasePart") then
        return obj.Position + Vector3.new(0,5,0)
    elseif obj:IsA("Model") then
        local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
        if part then
            obj.PrimaryPart = part
            return part.Position + Vector3.new(0,5,0)
        end
    end
    return nil
end

--// Function: Teleport to own plot
local function teleportToOwnPlot()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    local plotsFolder = Workspace:WaitForChild("Plots")
    local plot = plotsFolder:FindFirstChild(LocalPlayer.Name)

    if plot then
        local pos
        if plot:IsA("Model") and plot.PrimaryPart then
            pos = plot.PrimaryPart.Position + Vector3.new(0,5,0)
        elseif plot:IsA("BasePart") then
            pos = plot.Position + Vector3.new(0,5,0)
        else
            warn("Plot found but improperly set up.")
            return
        end
        hrp.CFrame = CFrame.new(pos)
        hrp.Velocity = Vector3.zero
        hrp.RotVelocity = Vector3.zero
        print("✨ Teleported back to own plot!")
    else
        warn("No plot found for player.")
    end
end

--// Function: Enable Instant ProximityPrompt
local function enableInstantPrompt()
    RunService.RenderStepped:Connect(function()
        for _, prompt in ipairs(Workspace:GetDescendants()) do
            if prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 0
            end
        end
    end)
    print("⚡ Instant ProximityPrompt enabled!")
end

--// Function: Steal Logic
local function stealSecrets()
    local allPlayers = Players:GetPlayers()
    if #allPlayers <= 1 then return end

    local targetPlayer
    repeat
        targetPlayer = allPlayers[math.random(1, #allPlayers)]
    until targetPlayer ~= LocalPlayer

    local plot = Workspace.Plots:FindFirstChild(targetPlayer.Name)
    if not plot then return end

    local objectsFolder = plot:FindFirstChild("Objects")
    if not objectsFolder then return end

    local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    for _, secretName in ipairs(selectedSecrets) do
        local objectName = secretName:match("^(.-)%s*%-") or secretName
        local targetObject = objectsFolder:FindFirstChild(objectName)

        if targetObject then
            local pos = getSafePosition(targetObject)
            if pos then
                hrp.CFrame = CFrame.new(pos)
                hrp.Velocity = Vector3.zero
                hrp.RotVelocity = Vector3.zero
                print("✨ Teleported to " .. objectName .. " in " .. targetPlayer.Name .. "'s plot")

                local prompt = targetObject:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt then
                    fireproximityprompt(prompt, prompt.HoldDuration or 1)
                    print("✅ Interacted with " .. objectName)
                else
                    print("⚠️ No ProximityPrompt found on " .. objectName)
                end

                task.wait(0.5)
            end
        end
    end

    -- teleport back to your base
    teleportToOwnPlot()
end

--// Auto Steal Toggle
AutoTab:CreateToggle({
    Name = "Auto Steal Secrets (Must click E on your own)",
    CurrentValue = false,
    Flag = "AutoStealSecrets",
    Callback = function(value)
        AutoStealSecretsEnabled = value
        if value then
            print("✅ Auto Steal Secrets enabled!")
            task.spawn(function()
                while AutoStealSecretsEnabled do
                    if #selectedSecrets > 0 then
                        stealSecrets()
                        task.wait(5)
                    else
                        print("⚠️ No secrets selected.")
                        task.wait(1)
                    end
                end
            end)
        else
            print("❌ Auto Steal Secrets disabled!")
        end
    end
})

--// Secrets Dropdown (Multi-Select)
AutoTab:CreateDropdown({
    Name = "Select Secrets",
    Options = {
        "Michael Huang - 40B",
        "Cary Huang - 30B",
        "Black Hole - 5B",
        "Bell - 3B",
        "The Sun - 900M",
        "Yin-Yang - 500M",
        "MePhone4 - 500M",
        "Kratcy - 300M",
        "Profily - 100M",
        "Toalettrule - 100M",
        "Clock (ITFT) - 100M",
        "Polka Dot - 50M",
        "Yigroish Bottle - 50M",
        "Yoshka - 50M",
        "Taco (II) - 25M",
        "Tissues (II) - 10M",
        "One - 10M",
        "Gaty - 3M"
    },
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "SecretDropdown",
    Callback = function(options)
        selectedSecrets = options
        print("Selected secrets:")
        for _, secret in ipairs(options) do
            print(" - " .. secret)
        end
    end
})

--// Misc Buttons
MiscTab:CreateButton({
    Name = "Teleport Back to Base [t]",
    Callback = function()
        teleportToOwnPlot()
    end
})

MiscTab:CreateButton({
    Name = "Enable Instant Prompts",
    Callback = function()
        enableInstantPrompt()
    end,
})

--// Noclip Toggle
local noclipConnection
MiscTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(state)
        local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        if state then
            noclipConnection = RunService.Stepped:Connect(function()
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
            end)
            print("🟢 Noclip Enabled")
        else
            if noclipConnection then
                noclipConnection:Disconnect()
                noclipConnection = nil
            end
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = true
                end
            end
            print("🔴 Noclip Disabled")
        end
    end
})

--// Permanent "T" Keybind to teleport back to base
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.T then
            teleportToOwnPlot()
        end
    end
end)

print("✅ Hydra Productions Hub Loaded with permanent 'T' keybind and button for teleport!")
