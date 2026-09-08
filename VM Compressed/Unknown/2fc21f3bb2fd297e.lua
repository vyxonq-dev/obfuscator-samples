-- [[ ECLIPSE VIPER: FORCE EQUIP UPDATE ]] --
_G.Running = true
_G.SelectedWeapon = "Currently Holding"

-- // LARGE TOP-SCREEN NOTIFICATION
local function CustomNotify(title, text)
    local CoreGui = game:GetService("CoreGui")
    if CoreGui:FindFirstChild("ViperNotify") then CoreGui.ViperNotify:Destroy() end
    local NotificationGui = Instance.new("ScreenGui", CoreGui)
    NotificationGui.Name = "ViperNotify"
    local Banner = Instance.new("Frame", NotificationGui)
    Banner.Size = UDim2.new(0, 280, 0, 60)
    Banner.Position = UDim2.new(0.5, -140, 0, -80)
    Banner.BackgroundColor3 = Color3.fromRGB(5, 10, 5)
    Banner.BorderColor3 = Color3.fromRGB(0, 255, 120)
    Banner.BorderSizePixel = 2
    Instance.new("UICorner", Banner)

    local TL = Instance.new("TextLabel", Banner)
    TL.Size = UDim2.new(1, 0, 0.4, 0)
    TL.Text = title:upper()
    TL.TextColor3 = Color3.fromRGB(0, 255, 120)
    TL.Font = Enum.Font.SourceSansBold
    TL.TextSize = 18
    TL.BackgroundTransparency = 1

    local TX = Instance.new("TextLabel", Banner)
    TX.Size = UDim2.new(1, 0, 0.5, 0)
    TX.Position = UDim2.new(0, 0, 0.4, 0)
    TX.Text = text
    TX.TextColor3 = Color3.new(1, 1, 1)
    TX.Font = Enum.Font.SourceSansBold
    TX.TextSize = 16
    TX.BackgroundTransparency = 1

    Banner:TweenPosition(UDim2.new(0.5, -140, 0, 20), "Out", "Back", 0.5, true)
    task.delay(3, function()
        if Banner and Banner.Parent then
            Banner:TweenPosition(UDim2.new(0.5, -140, 0, -80), "In", "Quad", 0.5, true, function() NotificationGui:Destroy() end)
        end
    end)
end

-- // DRAGGABLE PERF BAR + ROUNDED DROPDOWN
local function CreatePerfOverlay()
    local CoreGui = game:GetService("CoreGui")
    local Player = game.Players.LocalPlayer
    if CoreGui:FindFirstChild("Eclipse_Perf") then CoreGui.Eclipse_Perf:Destroy() end

    local PerfGui = Instance.new("ScreenGui", CoreGui)
    PerfGui.Name = "Eclipse_Perf"

    local MainBar = Instance.new("Frame", PerfGui)
    MainBar.Size = UDim2.new(0, 320, 0, 50)
    MainBar.Position = UDim2.new(0.5, -160, 0, 80)
    MainBar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    MainBar.BorderColor3 = Color3.fromRGB(0, 255, 120)
    MainBar.BorderSizePixel = 2
    MainBar.Active = true
    MainBar.Draggable = true 
    Instance.new("UICorner", MainBar).CornerRadius = UDim.new(0, 8)

    local StatsLabel = Instance.new("TextLabel", MainBar)
    StatsLabel.Size = UDim2.new(0.65, 0, 1, 0)
    StatsLabel.Position = UDim2.new(0, 12, 0, 0)
    StatsLabel.TextColor3 = Color3.fromRGB(0, 255, 150)
    StatsLabel.Font = Enum.Font.SourceSansBold
    StatsLabel.TextSize = 18
    StatsLabel.BackgroundTransparency = 1
    StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
    StatsLabel.RichText = true 

    local DropButton = Instance.new("TextButton", MainBar)
    DropButton.Size = UDim2.new(0.3, 0, 0.6, 0)
    DropButton.Position = UDim2.new(0.66, 0, 0.2, 0)
    DropButton.Text = "WEAPONS ▼"
    DropButton.TextSize = 12
    DropButton.Font = Enum.Font.SourceSansBold
    DropButton.TextColor3 = Color3.fromRGB(0, 255, 120)
    DropButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", DropButton).CornerRadius = UDim.new(0, 6)

    local DropList = Instance.new("ScrollingFrame", MainBar)
    DropList.Size = UDim2.new(1, 0, 0, 0)
    DropList.Position = UDim2.new(0, 0, 1, 8)
    DropList.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    DropList.BorderSizePixel = 0
    DropList.Visible = false
    DropList.ScrollBarThickness = 4
    DropList.ScrollBarImageColor3 = Color3.fromRGB(0, 255, 120)
    Instance.new("UIListLayout", DropList).Padding = UDim.new(0, 3)
    Instance.new("UICorner", DropList).CornerRadius = UDim.new(0, 10)

    -- // IMPROVED EQUIP LOGIC
    local function ForceEquip(weaponName)
        local character = Player.Character or Player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local tool = Player.Backpack:FindFirstChild(weaponName)
        
        if tool then
            humanoid:EquipTool(tool)
            -- Double Check
            task.wait(0.1)
            if not character:FindFirstChild(weaponName) then
                tool.Parent = character -- Direct parent method if Humanoid fails
            end
        end
    end

    DropButton.MouseButton1Click:Connect(function()
        if not DropList.Visible then
            for _, c in pairs(DropList:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
            local inv = {"Currently Holding"}
            for _, t in pairs(Player.Backpack:GetChildren()) do table.insert(inv, t.Name) end
            
            DropList.CanvasSize = UDim2.new(0, 0, 0, #inv * 32)
            for _, n in pairs(inv) do
                local b = Instance.new("TextButton", DropList)
                b.Size = UDim2.new(0.95, 0, 0, 28)
                b.Text = "  " .. n
                b.TextSize = 14
                b.Font = Enum.Font.SourceSansBold
                b.TextColor3 = Color3.new(1, 1, 1)
                b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                b.TextXAlignment = Enum.TextXAlignment.Left
                Instance.new("UICorner", b).CornerRadius = UDim.new(0, 5)
                
                b.MouseButton1Click:Connect(function()
                    _G.SelectedWeapon = n
                    DropList.Visible = false
                    DropList.Size = UDim2.new(1, 0, 0, 0)
                    
                    if n ~= "Currently Holding" then
                        ForceEquip(n)
                    end
                    
                    CustomNotify("Viper Armed", n)
                end)
            end
            DropList.Visible = true
            DropList:TweenSize(UDim2.new(1, 0, 0, 160), "Out", "Quart", 0.3, true)
        else
            DropList:TweenSize(UDim2.new(1, 0, 0, 0), "In", "Quart", 0.2, true, function() DropList.Visible = false end)
        end
    end)

    task.spawn(function()
        while true do
            if _G.Running == false then
                if PerfGui then PerfGui:Destroy() end
                if CoreGui:FindFirstChild("ViperNotify") then CoreGui.ViperNotify:Destroy() end
                break
            end
            pcall(function()
                local fps = math.floor(1 / game:GetService("RunService").RenderStepped:Wait())
                local ping = math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue())
                local pingHex = (ping > 300 and "#FF3232") or (ping > 150 and "#FFE632") or "#00FF96"
                StatsLabel.Text = string.format("FPS: %d | MS: <font color='%s'>%d</font>\nUSE: %s", fps, pingHex, ping, _G.SelectedWeapon)
            end)
            task.wait(0.5)
        end
    end)
end

-- // EXECUTION
pcall(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    loadstring(game:HttpGet("https://pastebin.com/raw/GzFAqvxy"))()
    CreatePerfOverlay()
    CustomNotify("Eclipse Viper", "Force Equip Active!")
end)