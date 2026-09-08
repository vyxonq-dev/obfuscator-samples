--[[ 🐍 BLACKMAMBA PRO V59 | KEY SYSTEM + V51 ENGINE ]]
local P = game:GetService("Players").LocalPlayer

-- [[ 🔑 CONFIGURATION ]]
local Settings = {
    Key = "MAMBA24",
    Discord = "https://discord.gg/HDhES2V6",
    Version = "V59"
}

-- [[ 🖥️ KEY SYSTEM UI ]]
local function ShowKeySystem()
    local G = Instance.new("ScreenGui", P.PlayerGui)
    G.Name = "MambaKeySystem"
    G.ResetOnSpawn = false
    
    local M = Instance.new("Frame", G)
    M.Size = UDim2.new(0, 320, 0, 180)
    M.Position = UDim2.new(0.5, -160, 0.5, -90)
    M.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    M.Active = true
    M.Draggable = true
    Instance.new("UICorner", M)
    
    local Stroke = Instance.new("UIStroke", M)
    Stroke.Color = Color3.fromRGB(200, 0, 0)
    Stroke.Thickness = 2

    local TLabel = Instance.new("TextLabel", M)
    TLabel.Size = UDim2.new(1, 0, 0, 45)
    TLabel.Text = "🐍 BLACKMAMBA HUB | " .. Settings.Version
    TLabel.TextColor3 = Color3.new(1, 1, 1)
    TLabel.BackgroundTransparency = 1
    TLabel.Font = Enum.Font.SourceSansBold
    TLabel.TextSize = 18
    
    local Input = Instance.new("TextBox", M)
    Input.Size = UDim2.new(0.85, 0, 0, 35)
    Input.Position = UDim2.new(0.075, 0, 0.35, 0)
    Input.PlaceholderText = "Paste Key Here..."
    Input.Text = ""
    Input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Input.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", Input)
    
    local VerifyBtn = Instance.new("TextButton", M)
    VerifyBtn.Size = UDim2.new(0.4, 0, 0, 35)
    VerifyBtn.Position = UDim2.new(0.075, 0, 0.65, 0)
    VerifyBtn.Text = "Verify Key"
    VerifyBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 0)
    VerifyBtn.TextColor3 = Color3.new(1, 1, 1)
    VerifyBtn.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", VerifyBtn)
    
    local GetKeyBtn = Instance.new("TextButton", M)
    GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 35)
    GetKeyBtn.Position = UDim2.new(0.525, 0, 0.65, 0)
    GetKeyBtn.Text = "Get Key in Discord"
    GetKeyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    GetKeyBtn.TextColor3 = Color3.new(1, 1, 1)
    GetKeyBtn.Font = Enum.Font.SourceSansBold
    Instance.new("UICorner", GetKeyBtn)

    -- [[ UI LOGIC ]]
    GetKeyBtn.MouseButton1Click:Connect(function()
        setclipboard(Settings.Discord)
        GetKeyBtn.Text = "Link Copied!"
        task.wait(2)
        GetKeyBtn.Text = "Get Key in Discord"
    end)

    VerifyBtn.MouseButton1Click:Connect(function()
        if Input.Text == Settings.Key then
            G:Destroy()
            LaunchMainScript() -- Dito tatawagin yung Main Script
        else
            Input.Text = ""
            Input.PlaceholderText = "INVALID KEY!"
            task.wait(2)
            Input.PlaceholderText = "Paste Key Here..."
        end
    end)
end

-- [[ 🚀 MAIN SCRIPT ENGINE (V51 FIX) ]]
function LaunchMainScript()
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local Window = Rayfield:CreateWindow({
       Name = "🐍 BLACKMAMBA HUB🤫",
       LoadingTitle = "🤫Mamba Hub",
       LoadingSubtitle = "by Alpuerto and Saveron🤫",
       ConfigurationSaving = { Enabled = false }
    })

    -- SERVICES
    local Msg = game:GetService("ReplicatedStorage"):WaitForChild("Msg", 15)
    local RE, RF, TF = Msg.RemoteEvent, Msg.RemoteFunction, Msg.TalkFunc

    getgenv().Mamba = {
        SellEquipped = false, Wheat = false, Speed = 16,
        Jump = false, Noclip = false, Harvest = false,
        AutoEgg = false, BuyPotion = false, PotionID = 15000001
    }
    local T = getgenv().Mamba

    -- [[ TABS ]]
    local FarmTab = Window:CreateTab("Auto Farm", nil)
    local PlayerTab = Window:CreateTab("Player Hacks", nil)

    FarmTab:CreateSection("Money & Selling")
    FarmTab:CreateToggle({Name = "Auto Sell (Equipped Only)", CurrentValue = false, Callback = function(v) T.SellEquipped = v end})
    FarmTab:CreateToggle({Name = "Auto Collect Products", CurrentValue = false, Callback = function(v) T.Wheat = v end})

    FarmTab:CreateSection("Harvesting & Eggs")
    FarmTab:CreateToggle({Name = "Auto Harvest (Scan All)", CurrentValue = false, Callback = function(v) T.Harvest = v end})
    FarmTab:CreateToggle({Name = "Auto Place Eggs", CurrentValue = false, Callback = function(v) T.AutoEgg = v end})

    FarmTab:CreateSection("Potion Shop")
    FarmTab:CreateDropdown({
       Name = "Select Potion",
       Options = {"Small Potion", "Medium Potion", "Large Potion"},
       CurrentOption = "Small Potion",
       Callback = function(Option)
          if Option == "Small Potion" then T.PotionID = 15000001
          elseif Option == "Medium Potion" then T.PotionID = 15000002
          elseif Option == "Large Potion" then T.PotionID = 15000003 end
       end,
    })
    FarmTab:CreateToggle({Name = "Auto Buy Potion", CurrentValue = false, Callback = function(v) T.BuyPotion = v end})

    PlayerTab:CreateSlider({Name = "WalkSpeed", Range = {16, 300}, Increment = 1, CurrentValue = 16, Callback = function(v) T.Speed = v end})
    PlayerTab:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(v) T.Noclip = v end})

    -- [[ ENGINE LOOP ]]
    task.spawn(function()
        while task.wait(0.7) do
            pcall(function()
                if T.Harvest then
                    for x = 1, 5 do for y = 1, 5 do for lvl = 1, 5 do
                        RF:InvokeServer("\230\148\182\232\142\183\230\176\180\230\158\156", {x, y, lvl})
                    end end end
                end
                if T.SellEquipped then
                    for _, v in pairs(P.Character:GetChildren()) do
                        if v:IsA("Model") and tonumber(v.Name) then
                            RF:InvokeServer("\230\163\128\230\159\165Tool\229\174\140\230\149\180\230\128\167", 240)
                            RE:FireServer("\232\167\166\229\143\145\229\175\185\232\175\157", 1010101)
                            TF:InvokeServer("\229\141\150\230\142\137\230\139\191\231\157\128\231\154\132\229\174\157\231\137\169", {tonumber(v.Name)})
                            RF:InvokeServer("\230\148\190\231\189\174")
                        end
                    end
                end
                if T.AutoEgg then
                    local hrp = P.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then RF:InvokeServer("\230\148\190\231\189\174\232\155\139", hrp.CFrame * CFrame.new(0, -1, -8)) end
                end
                if T.BuyPotion then
                    RF:InvokeServer("\232\180\173\228\185\176\233\173\148\230\179\149\232\141\175\230\176\180", {T.PotionID, 1})
                end
                if T.Wheat then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("Model") and tonumber(v.Name) then
                            RE:FireServer("\233\162\134\229\143\150\229\138\168\231\137\169\232\181\154\231\154\132\233\146\177", tonumber(v.Name))
                        end
                    end
                end
            end)
        end
    end)

    game:GetService("RunService").Stepped:Connect(function()
        pcall(function()
            if P.Character and P.Character:FindFirstChild("Humanoid") then
                P.Character.Humanoid.WalkSpeed = T.Speed
                if T.Noclip then
                    for _, v in pairs(P.Character:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = false end
                    end
                end
            end
        end)
    end)
    Rayfield:Notify({Title = "Ang Cute Ni Saveron😜", Content = "Pero Mas Cute Si Alpuerto😝!", Duration = 5})
end

-- START LOADER
ShowKeySystem()
