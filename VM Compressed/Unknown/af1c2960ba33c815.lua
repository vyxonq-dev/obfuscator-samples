--[[
    ╔═══════════════════════════════════════╗
    ║        Fixz Hub | Rivals FPS         ║
    ║         Key System Protected          ║
    ╚═══════════════════════════════════════╝
]]

repeat task.wait() until game:IsLoaded()

-- Anti-Kick Protection
pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Anti-Kick/main/Anti-Kick.lua"))()
end)

-- Key System Config
local VALID_KEY = "Fixz2025"
local DISCORD_LINK = "https://discord.gg/G4AuBncANE"

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- Main Script Function
local function LoadMainScript()
    print("🔄 Loading Fixz Hub...")
    
    -- Wait for character
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    task.wait(1)
    
    -- Variables
    local utility = require(ReplicatedStorage.Modules.Utility)
    local camera = Workspace.CurrentCamera
    local aimbotEnabled = false
    local fovRadius = 100
    local espEnabled = false
    local speedEnabled = false
    local speedValue = 50
    local jumpPowerEnabled = false
    local jumpPowerValue = 50
    local noclipEnabled = false
    local infiniteJumpEnabled = false
    local Connections = {}
    
    -- FOV Circle
    local fovCircle = Drawing.new("Circle")
    fovCircle.Color = Color3.fromRGB(255, 255, 255)
    fovCircle.Thickness = 2
    fovCircle.NumSides = 100
    fovCircle.Filled = false
    fovCircle.Visible = false
    
    -- Functions
    local function get_players()
        local entities = {}
        for _, child in ipairs(Workspace:GetChildren()) do
            if child:FindFirstChildOfClass("Humanoid") then
                table.insert(entities, child)
            elseif child.Name == "HurtEffect" then
                for _, hurt_player in ipairs(child:GetChildren()) do
                    if hurt_player.ClassName ~= "Highlight" then
                        table.insert(entities, hurt_player)
                    end
                end
            end
        end
        return entities
    end
    
    local function get_closest_player()
        local closest, closest_distance = nil, fovRadius
        local character = LocalPlayer.Character
        if not character then return end
        
        for _, player in ipairs(get_players()) do
            if player == LocalPlayer then continue end
            if not player:FindFirstChild("HumanoidRootPart") or not player:FindFirstChild("Head") then continue end
            
            local position, onScreen = camera:WorldToViewportPoint(player.HumanoidRootPart.Position)
            if not onScreen then continue end
            
            local center = Vector2.new(camera.ViewportSize.X / 2, camera.ViewportSize.Y / 2)
            local distance = (center - Vector2.new(position.X, position.Y)).Magnitude
            
            if distance < closest_distance then
                closest = player
                closest_distance = distance
            end
        end
        return closest
    end
    
    -- Silent Aim Hook
    local old = utility.Raycast
    utility.Raycast = function(...)
        local arguments = {...}
        if aimbotEnabled and #arguments > 0 and arguments[4] == 999 then
            local closest = get_closest_player()
            if closest then
                arguments[3] = closest.Head.Position
            end
        end
        return old(table.unpack(arguments))
    end
    
    print("✅ Hooks initialized")
    
    -- Load Wind UI
    local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
    
    print("✅ Wind UI loaded")
    
    local Window = WindUI:CreateWindow({
        Title = "Fixz Hub | Rivals",
        Icon = "rbxassetid://10723434711",
        Author = "Fixz Development",
        Folder = "FixzHub/Rivals",
        Size = UDim2.fromOffset(480, 350),
        Transparent = false,
        Theme = "Dark",
        SideBarWidth = 170,
    })
    
    print("✅ Window created")
    
    -- Tabs
    local Combat = Window:Tab({ Title = "Combat", Icon = "crosshair" })
    local Visual = Window:Tab({ Title = "Visuals", Icon = "eye" })
    local Player = Window:Tab({ Title = "Player", Icon = "user" })
    local Misc = Window:Tab({ Title = "Misc", Icon = "settings" })
    
    -- Combat Tab
    Combat:Section({ Title = "Aimbot" })
    
    Combat:Toggle({
        Title = "Silent Aim",
        Default = false,
        Callback = function(v)
            aimbotEnabled = v
            WindUI:Notify(v and "Silent Aim Enabled!" or "Silent Aim Disabled!", 3)
        end
    })
    
    Combat:Slider({
        Title = "FOV Range",
        Value = { Min = 50, Max = 500, Default = 100 },
        Callback = function(v)
            fovRadius = v
        end
    })
    
    Combat:Toggle({
        Title = "Show FOV Circle",
        Default = false,
        Callback = function(v)
            fovCircle.Visible = v
        end
    })
    
    -- Visual Tab
    Visual:Section({ Title = "ESP" })
    
    local highlightInstances = {}
    Visual:Toggle({
        Title = "Player Highlights",
        Default = false,
        Callback = function(v)
            espEnabled = v
            if v then
                for _, player in pairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character then
                        local highlight = Instance.new("Highlight")
                        highlight.Parent = player.Character
                        highlight.FillTransparency = 0.5
                        highlight.OutlineTransparency = 1
                        highlight.FillColor = Color3.fromRGB(255, 0, 0)
                        highlightInstances[player] = highlight
                    end
                end
                
                Connections["Rainbow"] = task.spawn(function()
                    local hue = 0
                    while espEnabled do
                        hue = (hue + 0.02) % 1
                        local color = Color3.fromHSV(hue, 1, 1)
                        for _, highlight in pairs(highlightInstances) do
                            if highlight then
                                highlight.FillColor = color
                                highlight.OutlineColor = color
                            end
                        end
                        task.wait(0.02)
                    end
                end)
                
                WindUI:Notify("ESP Enabled!", 3)
            else
                for _, highlight in pairs(highlightInstances) do
                    if highlight then highlight:Destroy() end
                end
                highlightInstances = {}
                WindUI:Notify("ESP Disabled!", 3)
            end
        end
    })
    
    -- Player Tab
    Player:Section({ Title = "Movement" })
    
    Player:Toggle({
        Title = "Speed Hack",
        Default = false,
        Callback = function(v)
            speedEnabled = v
        end
    })
    
    Player:Slider({
        Title = "Walk Speed",
        Value = { Min = 50, Max = 200, Default = 50 },
        Callback = function(v)
            speedValue = v
        end
    })
    
    Player:Toggle({
        Title = "Jump Power",
        Default = false,
        Callback = function(v)
            jumpPowerEnabled = v
        end
    })
    
    Player:Slider({
        Title = "Jump Height",
        Value = { Min = 50, Max = 100, Default = 50 },
        Callback = function(v)
            jumpPowerValue = v
        end
    })
    
    Player:Toggle({
        Title = "Infinite Jump",
        Default = false,
        Callback = function(v)
            infiniteJumpEnabled = v
        end
    })
    
    Player:Toggle({
        Title = "Noclip",
        Default = false,
        Callback = function(v)
            noclipEnabled = v
        end
    })
    
    -- Misc Tab
    Misc:Section({ Title = "Information" })
    
    Misc:Button({
        Title = "Copy Discord Link",
        Callback = function()
            setclipboard(DISCORD_LINK)
            WindUI:Notify("Discord link copied!", 3)
        end
    })
    
    Misc:Button({
        Title = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
        end
    })
    
    Misc:Paragraph({
        Title = "Fixz Hub | Rivals",
        Content = "Version: 1.0.0\n\nFeatures:\n• Silent Aim\n• Rainbow ESP\n• Speed & Jump Hacks\n• Infinite Jump\n• Noclip\n• Anti-Kick\n\nDiscord: discord.gg/G4AuBncANE"
    })
    
    -- Update Loops
    Connections["RenderStepped"] = RunService.RenderStepped:Connect(function()
        local screenSize = camera.ViewportSize
        fovCircle.Position = Vector2.new(screenSize.X / 2, screenSize.Y / 2)
        fovCircle.Radius = fovRadius
        
        -- Speed Hack
        if speedEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.WalkSpeed = speedValue
            end
        end
        
        -- Jump Power
        if jumpPowerEnabled and LocalPlayer.Character then
            local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.JumpPower = jumpPowerValue
            end
        end
        
        -- Noclip
        if noclipEnabled and LocalPlayer.Character then
            for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end)
    
    -- Infinite Jump
    Connections["InfJump"] = UserInputService.JumpRequest:Connect(function()
        if infiniteJumpEnabled then
            local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState("Jumping")
            end
        end
    end)
    
    WindUI:Notify("Fixz Hub loaded successfully!", 5)
    print("✅ Fixz Hub | Rivals loaded successfully!")
end

-- Key System
local function ShowKeySystem()
    local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
    
    local success, Obsidian = pcall(function()
        return loadstring(game:HttpGet(repo .. "Library.lua"))()
    end)
    
    if not success then
        warn("Failed to load key system UI")
        return
    end

    local Window = Obsidian:CreateWindow({
        Title = "Fixz Hub | Rivals",
        Footer = "Key System",
        ToggleKeybind = Enum.KeyCode.RightControl,
        DisableSearch = true,
        ShowCustomCursor = false,
        Icon = "rbxassetid://140278037137417",
        Size = UDim2.fromOffset(400, 300),
        Center = true,
        AutoShow = true
    })

    local Tabs = { KeyTab = Window:AddKeyTab("Key", "key") }

    Tabs.KeyTab:AddLabel({ Text = "Fixz Hub | Rivals FPS", Size = 20 })
    Tabs.KeyTab:AddLabel({ Text = "Get key from discord.gg/G4AuBncANE", Size = 17 })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard(DISCORD_LINK)
            Obsidian:Notify("Discord link copied!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox(VALID_KEY, function(Success, ReceivedKey)
        print("Key validation:", Success, ReceivedKey)
        if Success then
            print("✅ Key accepted! Loading script...")
            Obsidian:Notify("Key accepted! Loading script...", 3)
            task.wait(1)
            Obsidian:Unload()
            task.wait(0.5)
            
            local success, err = pcall(LoadMainScript)
            if not success then
                warn("Error loading main script:", err)
            end
        else
            print("❌ Wrong key!")
            Obsidian:Notify("Wrong key! Get it from Discord.", 5)
        end
    end)
end

-- Start Key System
print("🔑 Starting key system...")
ShowKeySystem()