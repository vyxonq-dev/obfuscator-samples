-- Fixz Hub | 99 Night
-- Discord: discord.gg/G4AuBncANE

repeat task.wait() until game:IsLoaded()

-- Key System Config
local VALID_KEY = "Fixz2025"
local DISCORD_LINK = "https://discord.gg/G4AuBncANE"
local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local showKeyGUI = true

-- Main Script Function
function LoadMainScript()
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    
    local Window = WindUI:CreateWindow({
        Title = "Fixz Hub | 99 Night",
        Icon = "palette",
        Author = "Fixz Hub",
        Folder = "FixzHub",
        Size = UDim2.fromOffset(550, 350),
        Theme = "Dark",
        User = {
            Enabled = true,
            Anonymous = true,
            Callback = function() end
        },
        SideBarWidth = 200,
    })
    
    local Tabs = {
        Main = Window:Section({ Title = "Player", Opened = true }),
        Play = Window:Section({ Title = "Play Game", Opened = true }),
        Misc = Window:Section({ Title = "Misc", Opened = true }),
    }
    
    local TabHandles = {
        Player = Tabs.Main:Tab({ Title = "Speed & Jump", Icon = "layout-grid", Desc = "" }),
        Esp = Tabs.Main:Tab({ Title = "Esp & Item", Icon = "layout-grid", Desc = "" }),
        Chest = Tabs.Main:Tab({ Title = "Auto Chest", Icon = "layout-grid", Desc = "" }),
        Camp = Tabs.Play:Tab({ Title = "Camp Fire", Icon = "layout-grid", Desc = "" }),
        Create = Tabs.Play:Tab({ Title = "Create", Icon = "layout-grid", Desc = "" }),
        Tree = Tabs.Play:Tab({ Title = "Tree Farm", Icon = "layout-grid", Desc = "" }),
        Noclip = Tabs.Misc:Tab({ Title = "Noclip", Icon = "layout-grid", Desc = "" }),
        FlyUp = Tabs.Misc:Tab({ Title = "Fly Up", Icon = "layout-grid", Desc = "" }),
    }
    
    -- Speed Boost
    TabHandles.Player:Toggle({
        Title = "Speed Boost",
        Value = false,
        Callback = function(state)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = state and 130 or 16
        end
    })
    
    -- Speed Boost 60
    TabHandles.Player:Toggle({
        Title = "Speed Boost (60)",
        Value = false,
        Callback = function(state)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = state and 60 or 16
        end
    })
    
    -- Inf Jump
    TabHandles.Player:Toggle({
        Title = "Inf Jump",
        Value = false,
        Callback = function(state)
            local UIS = game:GetService("UserInputService")
            if state then
                _G.InfJumpConn = UIS.JumpRequest:Connect(function()
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    if character then
                        local humanoid = character:FindFirstChildOfClass("Humanoid")
                        if humanoid then
                            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        end
                    end
                end)
            else
                if _G.InfJumpConn then
                    _G.InfJumpConn:Disconnect()
                    _G.InfJumpConn = nil
                end
            end
        end
    })
    
    -- Custom Speed Slider
    TabHandles.Player:Slider({
        Title = "Custom Speed",
        Value = { Min = 16, Max = 300, Default = 16 },
        Callback = function(value)
            _G.CustomSpeed = value
        end
    })
    
    -- Custom Speed Toggle
    TabHandles.Player:Toggle({
        Title = "Enable Custom Speed",
        Value = false,
        Callback = function(state)
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = state and (_G.CustomSpeed or 16) or 16
        end
    })
    
    -- ESP Player
    TabHandles.Esp:Paragraph({ Title = "ESP Player" })
    
    TabHandles.Esp:Toggle({
        Title = "Enable ESP Player",
        Value = false,
        Callback = function(state)
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    local function applyEsp(char)
                        local head = char:FindFirstChild("Head")
                        if head then
                            local billboard = head:FindFirstChild("EspBillboard")
                            if state then
                                if not billboard then
                                    billboard = Instance.new("BillboardGui")
                                    billboard.Name = "EspBillboard"
                                    billboard.AlwaysOnTop = true
                                    billboard.Size = UDim2.new(0, 200, 0, 50)
                                    billboard.StudsOffset = Vector3.new(0, 3, 0)
                                    billboard.Parent = head
                                    
                                    local label = Instance.new("TextLabel")
                                    label.Name = "EspLabel"
                                    label.BackgroundTransparency = 1
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.TextColor3 = Color3.fromRGB(0, 255, 0)
                                    label.TextStrokeTransparency = 0
                                    label.Font = Enum.Font.SourceSansBold
                                    label.TextSize = 14
                                    label.Text = ""
                                    label.Parent = billboard
                                end
                            else
                                if billboard then billboard:Destroy() end
                            end
                        end
                    end
                    if player.Character then applyEsp(player.Character) end
                    player.CharacterAdded:Connect(applyEsp)
                end
            end
        end
    })
    
    -- ESP Name
    TabHandles.Esp:Toggle({
        Title = "ESP Name",
        Value = false,
        Callback = function(state)
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head and head:FindFirstChild("EspBillboard") then
                        local label = head.EspBillboard.EspLabel
                        if state then
                            label.Text = "Name: " .. player.Name
                        else
                            label.Text = ""
                        end
                    end
                end
            end
        end
    })
    
    -- Auto Chest
    TabHandles.Chest:Toggle({
        Title = "Auto Open Chest",
        Value = false,
        Callback = function(v)
            local player = game.Players.LocalPlayer
            local hrp = player.Character and player.Character:WaitForChild("HumanoidRootPart")
            if not _G.AutoChest then _G.AutoChest = {running = false, originalCFrame = nil} end
            
            if v then
                if _G.AutoChest.running then return end
                _G.AutoChest.running = true
                _G.AutoChest.originalCFrame = hrp.CFrame
                
                task.spawn(function()
                    while _G.AutoChest.running do
                        for _, obj in ipairs(workspace:GetDescendants()) do
                            if obj:IsA("Model") and string.find(obj.Name, "Item Chest") then
                                local part = obj.PrimaryPart or obj:FindFirstChildWhichIsA("BasePart")
                                if part and hrp then
                                    hrp.CFrame = part.CFrame + Vector3.new(0, 6, 0)
                                    for _, prompt in ipairs(obj:GetDescendants()) do
                                        if prompt:IsA("ProximityPrompt") then
                                            fireproximityprompt(prompt, math.huge)
                                        end
                                    end
                                    task.wait(4)
                                end
                            end
                        end
                        task.wait(0.1)
                    end
                end)
            else
                _G.AutoChest.running = false
                if _G.AutoChest.originalCFrame then
                    hrp.CFrame = _G.AutoChest.originalCFrame
                end
            end
        end
    })
    
    -- Auto Camp Log
    TabHandles.Camp:Toggle({
        Title = "Auto Camp (Log)",
        Value = false,
        Callback = function(v)
            if v then
                _G.AutoLog = true
                local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                task.spawn(function()
                    while _G.AutoLog do
                        for _, m in pairs(workspace:GetDescendants()) do
                            if m:IsA("Model") and m.Name == "Log" and m.PrimaryPart and hrp then
                                hrp.CFrame = m.PrimaryPart.CFrame
                                m:SetPrimaryPartCFrame(CFrame.new(0.54, 12.5, -0.72))
                                task.wait(0.2)
                            end
                        end
                        task.wait()
                    end
                end)
            else
                _G.AutoLog = false
            end
        end
    })
    
    -- Auto Camp Coal
    TabHandles.Camp:Toggle({
        Title = "Auto Camp (Coal)",
        Value = false,
        Callback = function(v)
            if v then
                _G.AutoCoal = true
                local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                task.spawn(function()
                    while _G.AutoCoal do
                        for _, m in pairs(workspace:GetDescendants()) do
                            if m:IsA("Model") and m.Name == "Coal" and m.PrimaryPart and hrp then
                                hrp.CFrame = m.PrimaryPart.CFrame
                                m:SetPrimaryPartCFrame(CFrame.new(0.54, 12.5, -0.72))
                                task.wait(0.2)
                            end
                        end
                        task.wait()
                    end
                end)
            else
                _G.AutoCoal = false
            end
        end
    })
    
    -- Auto Chop Tree
    TabHandles.Tree:Toggle({
        Title = "Auto Chop Tree",
        Value = false,
        Callback = function(v)
            local player = game.Players.LocalPlayer
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
            _G.AutoChop = v
            if v then
                task.spawn(function()
                    while _G.AutoChop do
                        for _, tree in pairs(workspace:GetDescendants()) do
                            if tree:IsA("Model") and tree.Name == "Small Tree" and tree.PrimaryPart and hrp then
                                hrp.CFrame = tree.PrimaryPart.CFrame + Vector3.new(0, 0, -3)
                                task.wait(1)
                            end
                        end
                        task.wait()
                    end
                end)
            end
        end
    })
    
    -- Noclip
    TabHandles.Noclip:Toggle({
        Title = "Basic Noclip",
        Value = false,
        Callback = function(v)
            local player = game.Players.LocalPlayer
            local character = player.Character
            _G.Noclip = v
            while _G.Noclip do
                for _, part in pairs(character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = false
                    end
                end
                task.wait()
            end
        end
    })
    
    -- Fly Up
    TabHandles.FlyUp:Toggle({
        Title = "Fly Up (All Time)",
        Value = false,
        Callback = function(v)
            local player = game.Players.LocalPlayer
            local character = player.Character
            local hrp = character:FindFirstChild("HumanoidRootPart")
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            _G.FlyUp = v
            
            if v and hrp and humanoid then
                humanoid.PlatformStand = true
                task.spawn(function()
                    while _G.FlyUp do
                        local targetY = hrp.Position.Y + 300
                        hrp.Velocity = Vector3.new(0, 0, 0)
                        hrp.CFrame = CFrame.new(hrp.Position.X, targetY, hrp.Position.Z)
                        task.wait()
                    end
                    humanoid.PlatformStand = false
                end)
            end
        end
    })
    
    WindUI:Notify("Fixz Hub loaded successfully!", 5)
end

if showKeyGUI then
    local Obsidian = loadstring(game:HttpGet(repo .. "Library.lua"))()

    local Window = Obsidian:CreateWindow({
        Title = "Fixz Hub | 99 Night",
        Footer = "Key System",
        ToggleKeybind = Enum.KeyCode.RightControl,
        SetMobileButtonSide = "Left",
        DisableSearch = true,
        ShowCustomCursor = false,
        Icon = "rbxassetid://135799847160092",
        IconSize = UDim2.fromOffset(40, 40),
        Size = UDim2.fromOffset(400, 300),
        Center = true,
        AutoShow = true
    })

    local Tabs = {
        KeyTab = Window:AddKeyTab("Key", "key"),
    }

    Tabs.KeyTab:AddLabel({
        Text = "Fixz Hub Key System",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.KeyTab:AddLabel({
        Text = "Get key from discord.gg/G4AuBncANE",
        DoesWrap = true,
        Size = 17,
    })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard(DISCORD_LINK)
            Obsidian:Notify("Discord link copied to clipboard!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox(VALID_KEY, function(Success, ReceivedKey)
        if Success then
            Obsidian:Unload()
            LoadMainScript()
        else
            Obsidian:Notify("Wrong key! Get the key from our Discord.", 5)
        end
    end)
else
    -- Key is valid, load main script directly
    LoadMainScript()
end