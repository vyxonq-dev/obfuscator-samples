-- [[ SERVICES ]]
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Stats = game:GetService("Stats")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

-- [[ UI INITIALIZATION ]]
local Modal = loadstring(game:HttpGet("https://github.com/lxte/Modal/releases/latest/download/main.lua"))()
local Window = Modal:CreateWindow({
    Title = "Repz hub",
    SubTitle = "Catalog Avatar Creator",
    Size = UDim2.fromOffset(450, 400),
    MinimumSize = Vector2.new(300, 250),
    Transparency = 0,
    Icon = "rbxthumb://type=Asset&id=7041939546&w=150&h=150", 
})

-- Force the Dark theme immediately
Window:SetTheme("Dark")

-- [[ GLOBAL STATE ]]
getgenv().WearLoop = false
getgenv().RainbowSkin = false
getgenv().LikeLoop = false
getgenv().SaveLoop = false
getgenv().Noclip = false
getgenv().InfJump = false

-- Movement States
getgenv().JumpBoostEnabled = false
getgenv().JumpPowerValue = 50
getgenv().FlyEnabled = false
getgenv().FlySpeed = 50

-- Clipboard & Mimic States
getgenv().CurrentClipboardPlayerId = nil
getgenv().CurrentClipboardPlayerName = "None"
local AvatarClipboardLabel = nil

getgenv().MimicPlayerName = ""
getgenv().IsMimicking = false

-- ESP State
getgenv().ESPEnabled = false

-- Flight Variables
local flightMover = nil
local flightGyro = nil
local camera = workspace.CurrentCamera

-- [[ HELPER: COLOR CONVERTER ]]
local function toRGBTable(color)
    return { ["r"] = color.R * 255, ["g"] = color.G * 255, ["b"] = color.B * 255, ["IsRGBTable"] = true }
end

-- [[ HELPER: SERIALIZE DESC ]]
local function serializeDescription(desc)
    return {
        ["HeadColor"] = toRGBTable(desc.HeadColor), ["TorsoColor"] = toRGBTable(desc.TorsoColor),
        ["LeftArmColor"] = toRGBTable(desc.LeftArmColor), ["RightArmColor"] = toRGBTable(desc.RightArmColor),
        ["LeftLegColor"] = toRGBTable(desc.LeftLegColor), ["RightLegColor"] = toRGBTable(desc.RightLegColor),
        ["Shirt"] = desc.Shirt, ["Pants"] = desc.Pants, ["GraphicTShirt"] = desc.GraphicTShirt, ["Face"] = desc.Face,
        ["Head"] = desc.Head, ["Torso"] = desc.Torso, ["LeftArm"] = desc.LeftArm, ["RightArm"] = desc.RightArm,
        ["LeftLeg"] = desc.LeftLeg, ["RightLeg"] = desc.RightLeg, ["HairAccessory"] = desc.HairAccessory,
        ["FaceAccessory"] = desc.FaceAccessory, ["BackAccessory"] = desc.BackAccessory, ["WaistAccessory"] = desc.WaistAccessory,
        ["NeckAccessory"] = desc.NeckAccessory, ["ShouldersAccessory"] = desc.ShouldersAccessory, ["FrontAccessory"] = desc.FrontAccessory,
        ["HatAccessory"] = desc.HatAccessory, ["HeightScale"] = desc.HeightScale, ["WidthScale"] = desc.WidthScale,
        ["ProportionScale"] = desc.ProportionScale, ["DepthScale"] = desc.DepthScale, ["HeadScale"] = desc.HeadScale,
        ["BodyTypeScale"] = desc.BodyTypeScale, ["WalkAnimation"] = desc.WalkAnimation, ["MoodAnimation"] = desc.MoodAnimation,
        ["ClimbAnimation"] = desc.ClimbAnimation, ["FallAnimation"] = desc.FallAnimation, ["RunAnimation"] = desc.RunAnimation,
        ["SwimAnimation"] = desc.SwimAnimation, ["IdleAnimation"] = desc.IdleAnimation, ["JumpAnimation"] = desc.JumpAnimation
    }
end

-- [[ HELPER: DEVICE CHECKER ]]
local function getAssumePlayerDeviceString(targetPlayer)
    if not targetPlayer then return "❓ Unknown" end
    local assumedDevice = "❓ Unknown"
    pcall(function()
        local platform = tostring(gethiddenproperty(targetPlayer, "OsPlatform"))
        if platform then
            platform = string.lower(platform)
            if string.find(platform, "android") or string.find(platform, "ios") then assumedDevice = "Mobile 📱"
            elseif string.find(platform, "xbox") or string.find(platform, "playstation") then assumedDevice = "Console 🎮"
            elseif string.find(platform, "windows") or string.find(platform, "osx") or string.find(platform, "linux") then assumedDevice = "PC ⌨️" end
        end
    end)
    return assumedDevice
end

-- [[ PURPLE ESP SYSTEM ]]
local function createESP(player)
    if player == LocalPlayer then return end
    
    local function setup(char)
        local root = char:WaitForChild("HumanoidRootPart", 5)
        local head = char:WaitForChild("Head", 5)
        if not root or not head then return end

        local highlight = Instance.new("Highlight")
        highlight.Name = "PurpleESP_Highlight"
        highlight.FillColor = Color3.fromRGB(170, 0, 255)
        highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
        highlight.FillTransparency = 0.5
        highlight.OutlineTransparency = 0
        highlight.Adornee = char
        highlight.Enabled = getgenv().ESPEnabled
        highlight.Parent = char

        local billboard = Instance.new("BillboardGui")
        billboard.Name = "PurpleESP_Billboard"
        billboard.AlwaysOnTop = true
        billboard.Size = UDim2.new(0, 200, 0, 50)
        billboard.StudsOffset = Vector3.new(0, 3, 0)
        billboard.Adornee = head
        billboard.Enabled = getgenv().ESPEnabled
        billboard.Parent = head

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.fromRGB(170, 0, 255)
        label.TextStrokeTransparency = 0
        label.TextScaled = false
        label.TextSize = 14
        label.Font = Enum.Font.SourceSansBold
        label.Parent = billboard

        local connection
        connection = RunService.RenderStepped:Connect(function()
            if not char or not char:Parent() or not root or not head then
                connection:Disconnect()
                return
            end
            
            highlight.Enabled = getgenv().ESPEnabled
            billboard.Enabled = getgenv().ESPEnabled
            
            if getgenv().ESPEnabled and camera then
                local dist = math.floor((root.Position - camera.CFrame.Position).Magnitude)
                label.Text = player.Name .. "\n[" .. dist .. " Studs]"
            end
        end)
    end
    
    if player.Character then setup(player.Character) end
    player.CharacterAdded:Connect(setup)
end

for _, p in ipairs(Players:GetPlayers()) do createESP(p) end
Players.PlayerAdded:Connect(createESP)


-- [[ 1. INFO TAB ]]
local InfoTab = Window:AddTab("Info")
InfoTab:New("Title")({ Title = "Inspired by zynlope ❤️" })
InfoTab:New("Title")({ Title = "UI made by lxte on scriptblox ❤️" })
InfoTab:New("Title")({ Title = "This script was made by kasen." })


-- [[ 2. AVATAR TAB ]]
local AvatarTab = Window:AddTab("Avatar")
AvatarTab:New("Title")({ Title = "Avatar Management & Copying" })

AvatarClipboardLabel = AvatarTab:New("Title")({ Title = "UI Clipboard: None" })

AvatarTab:New("Input")({
    Title = "Search Player to Copy",
    Description = "Type a player's name to instantly add their outfit to the UI clipboard.",
    Placeholder = "Username...",
    Callback = function(text)
        local target = nil
        local lowerText = string.lower(text)
        
        for _, p in ipairs(Players:GetPlayers()) do
            if string.lower(p.Name) == lowerText or string.lower(p.DisplayName) == lowerText or string.find(string.lower(p.Name), lowerText) then
                target = p
                break
            end
        end

        if target then
            getgenv().CurrentClipboardPlayerId = target.UserId
            getgenv().CurrentClipboardPlayerName = target.Name
            if AvatarClipboardLabel then AvatarClipboardLabel:SetTitle("UI Clipboard: " .. target.Name) end
            if Window and Window.Notify then Window:Notify({ Title = "Copied!", Description = "Stored " .. target.Name .. " in your UI clipboard.", Duration = 3, Type = "Success" }) end
        else
            if Window and Window.Notify then Window:Notify({ Title = "Not Found", Description = "Could not find player: " .. text, Duration = 3, Type = "Error" }) end
        end
    end
})

AvatarTab:New("Button")({
    Title = "Load Avatar R15",
    Description = "Forces your character to wear the outfit of the player in the clipboard as an R15 rig.",
    Callback = function()
        if getgenv().CurrentClipboardPlayerId then
            local target = Players:GetPlayerByUserId(getgenv().CurrentClipboardPlayerId)
            if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
                local hum = target.Character:FindFirstChildOfClass("Humanoid")
                pcall(function() ReplicatedStorage.CatalogGuiRemote:InvokeServer({["Properties"] = serializeDescription(hum:GetAppliedDescription()), ["Action"] = "CreateAndWearHumanoidDescription", ["RigType"] = Enum.HumanoidRigType.R15}) end)
            else
                if Window and Window.Notify then Window:Notify({ Title = "Wait!", Description = "Target player for clipboard not found in server.", Duration = 3, Type = "Error" }) end
            end
        end
    end,
})

AvatarTab:New("Button")({
    Title = "Load Avatar R6",
    Description = "Forces your character to wear the outfit of the player in the clipboard as an R6 rig.",
    Callback = function()
        if getgenv().CurrentClipboardPlayerId then
            local target = Players:GetPlayerByUserId(getgenv().CurrentClipboardPlayerId)
            if target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") then
                local hum = target.Character:FindFirstChildOfClass("Humanoid")
                pcall(function() ReplicatedStorage.CatalogGuiRemote:InvokeServer({["Properties"] = serializeDescription(hum:GetAppliedDescription()), ["Action"] = "CreateAndWearHumanoidDescription", ["RigType"] = Enum.HumanoidRigType.R6}) end)
            else
                if Window and Window.Notify then Window:Notify({ Title = "Wait!", Description = "Target player for clipboard not found in server.", Duration = 3, Type = "Error" }) end
            end
        end
    end,
})

AvatarTab:New("Button")({
    Title = "Reset to Roblox Avatar",
    Description = "Resets your in-game avatar back to your original Roblox outfit.",
    Callback = function() pcall(function() ReplicatedStorage.Events.OutfitManagement:FireServer("ResetAvatar") end) end,
})

AvatarTab:New("Button")({
    Title = "Save Currently Wearing Avatar",
    Description = "Saves whatever you are currently wearing directly to your outfit collection.",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
            local hum = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            local date = os.date("*t")
            local outfitName = string.format("Wearing Save - %d/%d/%d", date.year, date.month, date.day)
            pcall(function() ReplicatedStorage.Events.SavedOutfitsRemote:InvokeServer({["OutfitName"] = outfitName, ["Configs"] = serializeDescription(hum:GetAppliedDescription()), ["Action"] = "CreateNewOutfit"}) end)
        end
    end,
})

AvatarTab:New("Button")({
    Title = "Save Everyones Avatar",
    Description = "Automatically saves the current outfit of every single player in the server to your outfits collection.",
    Callback = function()
        task.spawn(function()
            for _, target in ipairs(Players:GetPlayers()) do
                if target == LocalPlayer or not target.Character then continue end
                local hum = target.Character:FindFirstChildOfClass("Humanoid")
                if hum then
                    pcall(function()
                        local props = serializeDescription(hum:GetAppliedDescription())
                        ReplicatedStorage.CatalogGuiRemote:InvokeServer({["Properties"] = props, ["Action"] = "CreateAndWearHumanoidDescription", ["RigType"] = hum.RigType})
                        task.wait(0.5)
                        ReplicatedStorage.Events.SavedOutfitsRemote:InvokeServer({["OutfitName"] = target.Name .. "'s Steal", ["Configs"] = props, ["Action"] = "CreateNewOutfit"})
                    end)
                    task.wait(2.5) 
                end
            end
            if Window and Window.Notify then Window:Notify({ Title = "Success!", Description = "Finished saving everyones outfit! Check your saved outfits.", Duration = 5, Type = "Success" }) end
        end)
    end,
})

AvatarTab:New("Toggle")({
    Title = "Rainbow Avatar (can be laggy)",
    Description = "Smoothly and rapidly shifts the skin color of your avatar through all colors.",
    DefaultValue = false,
    Callback = function(Value)
        getgenv().RainbowSkin = Value
        if Value then
            task.spawn(function()
                local hue = 0
                while getgenv().RainbowSkin do
                    hue = (hue + 0.01) % 1
                    local color = Color3.fromHSV(hue, 1, 1)
                    ReplicatedStorage.CatalogGuiRemote:InvokeServer({["Action"] = "UpdateHumanDescProperties", ["Properties"] = {["HeadColor"]=color, ["TorsoColor"]=color, ["LeftArmColor"]=color, ["RightArmColor"]=color, ["LeftLegColor"]=color, ["RightLegColor"]=color}})
                    task.wait(0.08)
                end
            end)
        end
    end,
})


-- [[ 3. LOCAL TAB ]]
local LocalTab = Window:AddTab("Local")
LocalTab:New("Title")({ Title = "Character Modification" })

LocalTab:New("Toggle")({
    Title = "Purple ESP",
    Description = "See players through walls with Name, Studs, and a Purple Highlight.",
    DefaultValue = false,
    Callback = function(Value) getgenv().ESPEnabled = Value end
})

LocalTab:New("Slider")({
    Title = "Walk Speed",
    Description = "Adjusts movement speed. Default is 16.",
    Default = 16, Minimum = 16, Maximum = 250, DecimalCount = 0,
    Callback = function(Value)
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

local function updateJump()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        local hum = LocalPlayer.Character.Humanoid
        hum.UseJumpPower = true
        hum.JumpPower = getgenv().JumpBoostEnabled and getgenv().JumpPowerValue or 50
    end
end

LocalTab:New("Toggle")({
    Title = "Enable Jump Boost",
    Description = "Turn this on to use your custom jump power.",
    DefaultValue = false,
    Callback = function(Value)
        getgenv().JumpBoostEnabled = Value
        updateJump()
    end,
})

LocalTab:New("Slider")({
    Title = "Jump Power",
    Description = "Increases jump power.",
    Default = 50, Minimum = 50, Maximum = 300, DecimalCount = 0,
    Callback = function(Value)
        getgenv().JumpPowerValue = Value
        updateJump()
    end,
})

LocalTab:New("Toggle")({
    Title = "Infinite Jump",
    Description = "Jump while mid-air.",
    DefaultValue = false,
    Callback = function(Value) getgenv().InfJump = Value end,
})
UserInputService.JumpRequest:Connect(function()
    if getgenv().InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

LocalTab:New("Toggle")({
    Title = "Noclip",
    Description = "Disable collision for your character.",
    DefaultValue = false,
    Callback = function(Value) getgenv().Noclip = Value end,
})

local function toggleFly(state)
    getgenv().FlyEnabled = state
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    
    local hrp = char.HumanoidRootPart
    
    if state then
        char.Humanoid.PlatformStand = true
        flightMover = Instance.new("BodyVelocity", hrp)
        flightMover.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        flightMover.Velocity = Vector3.new(0, 0, 0)
        
        flightGyro = Instance.new("BodyGyro", hrp)
        flightGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        flightGyro.P = 10000
        flightGyro.CFrame = camera.CFrame
    else
        char.Humanoid.PlatformStand = false
        if flightMover then flightMover:Destroy() end
        if flightGyro then flightGyro:Destroy() end
    end
end

LocalTab:New("Toggle")({
    Title = "Enable Flight (Manual)",
    Description = "Works for PC & Mobile automatically. Steer with movement.",
    DefaultValue = false,
    Callback = function(Value) toggleFly(Value) end
})

LocalTab:New("Slider")({
    Title = "Fly Speed",
    Description = "Set speed to fly.",
    Default = 50, Minimum = 10, Maximum = 200, DecimalCount = 0,
    Callback = function(Value) getgenv().FlySpeed = Value end
})

RunService.RenderStepped:Connect(function()
    local char = LocalPlayer.Character
    if not char then return end
    
    if getgenv().Noclip then
        for _, part in pairs(char:GetDescendants()) do
            if part:IsA("BasePart") and part.CanCollide then
                part.CanCollide = false
            end
        end
    end
    
    if getgenv().FlyEnabled and char:FindFirstChild("Humanoid") then
        local hum = char.Humanoid
        if flightMover and flightGyro then
            flightGyro.CFrame = camera.CFrame
            local moveDir = hum.MoveDirection
            if moveDir.Magnitude > 0 then
                flightMover.Velocity = moveDir * getgenv().FlySpeed
            else
                flightMover.Velocity = Vector3.new(0, 0, 0)
            end
        end
    end
end)


-- [[ 4. OTHER SCRIPTS TAB ]]
local OtherTab = Window:AddTab("Other Scripts")

OtherTab:New("Title")({ Title = "Chat Mimic" })

OtherTab:New("Input")({
    Title = "Target Player to Mimic",
    Description = "Type the name of the player you want to copy in chat.",
    Placeholder = "Username...",
    Callback = function(text)
        getgenv().MimicPlayerName = string.lower(text)
        if Window and Window.Notify then Window:Notify({ Title = "Target Set", Description = "Now targeting: " .. text, Duration = 2, Type = "Info" }) end
    end
})

OtherTab:New("Toggle")({
    Title = "Enable Chat Mimic",
    Description = "Automatically send whatever your target says into the chat.",
    DefaultValue = false,
    Callback = function(Value) getgenv().IsMimicking = Value end
})

local function onPlayerChatted(player, message)
    if getgenv().IsMimicking and getgenv().MimicPlayerName ~= "" then
        if string.lower(player.Name) == getgenv().MimicPlayerName or string.lower(player.DisplayName) == getgenv().MimicPlayerName or string.find(string.lower(player.Name), getgenv().MimicPlayerName) then
            if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
                local channel = TextChatService.TextChannels:FindFirstChild("RBXGeneral")
                if channel then channel:SendAsync(message) end
            else
                local chatEvents = ReplicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
                if chatEvents and chatEvents:FindFirstChild("SayMessageRequest") then
                    chatEvents.SayMessageRequest:FireServer(message, "All")
                end
            end
        end
    end
end

for _, p in ipairs(Players:GetPlayers()) do
    if p ~= LocalPlayer then p.Chatted:Connect(function(msg) onPlayerChatted(p, msg) end) end
end
Players.PlayerAdded:Connect(function(p) p.Chatted:Connect(function(msg) onPlayerChatted(p, msg) end) end)


OtherTab:New("Title")({ Title = "External Hubs & Scripts" })

OtherTab:New("Button")({
    Title = "Infinite Yield",
    Description = "Universal admin command script.",
    Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end
})

OtherTab:New("Button")({
    Title = "Dex Explorer",
    Description = "View and edit game files.",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))() end
})

OtherTab:New("Button")({
    Title = "CMD-X",
    Description = "Universal admin command hub.",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))() end
})

OtherTab:New("Button")({
    Title = "Nameless Admin",
    Description = "Fun FE admin script.",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))() end
})

OtherTab:New("Button")({
    Title = "Find All Player Devices",
    Description = "Scans all players and displays an *assumed* device based on hidden properties.",
    Callback = function()
        local deviceListString = "Assume Device List:\n\n"
        for _, player in ipairs(Players:GetPlayers()) do
            local device = getAssumePlayerDeviceString(player)
            deviceListString = deviceListString .. string.format("- %s: %s\n", player.Name, device)
        end
        if Window and Window.Notify then Window:Notify({ Title = "Player Devices Found!", Description = deviceListString, Duration = 20, Type = "Info" }) end
    end,
})


-- [[ 5. SETTINGS TAB ]]
local SettingsTab = Window:AddTab("Settings")
SettingsTab:New("Title")({ Title = "UI & Server Control" })

SettingsTab:New("Dropdown")({
    Title = "UI Theme",
    Description = "Changes UI visual aesthetic.",
    Options = { "Dark", "Extra Dark", "Red", "Blue", "Cyan", "Green", "Purple", "Christmas", "St. Patrick's Day", "Valentine's Day", "Halloween" },
    Default = "Dark",
    Callback = function(Theme)
        if Theme == "Dark" then Window:SetTheme("Dark")
        elseif Theme == "Red" then Window:SetTheme("Rose")
        elseif Theme == "Green" then Window:SetTheme("Emerald")
        end
    end,
})

SettingsTab:New("Button")({
    Title = "Server Hop",
    Description = "Teleport to a new server.",
    Callback = function() Window:Notify({ Title = "Server Hop", Description = "Finding a new server...", Duration = 3, Type = "Info" }) end,
})

SettingsTab:New("Button")({
    Title = "Rejoin Server",
    Description = "Rejoin this exact server.",
    Callback = function() TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer) end,
})

SettingsTab:New("Title")({ Title = "Live Statistics" })
local StatsDisplay = SettingsTab:New("Button")({ Title = "Calculating Stats...", Description = "FPS, Ping, Uptime", Callback = function() end })
RunService.RenderStepped:Connect(function(deltaTime)
    local fps = math.floor(1 / deltaTime)
    local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
    local uptime = math.floor(workspace.DistributedGameTime)
    local mins, secs = math.floor(uptime / 60), uptime % 60
    local status = fps < 20 or ping > 200 and "🔴" or (fps < 45 or ping > 100 and "🟡" or "🟢")
    StatsDisplay:SetTitle(string.format("%s FPS: %d | Ping: %dms | Uptime: %dm %ds", status, fps, ping, mins, secs))
end)


-- [[ 6. ANTI-LAG TAB ]]
local AntiLagTab = Window:AddTab("Anti-Lag")
AntiLagTab:New("Title")({ Title = "Performance Boosters" })

AntiLagTab:New("Button")({
    Title = "Boost FPS",
    Description = "Deletes heavy effects, smooths terrain, optimizes rendering.",
    Callback = function()
        local g, w, l, t = game, game.Workspace, game.Lighting, game.Workspace.Terrain
        for _, v in pairs(w:GetDescendants()) do
            if v.Name == "Effects" and v:IsA("Folder") then v:Destroy()
            elseif v:IsA("BasePart") and not (v.Parent and v.Parent:FindFirstChild("Humanoid")) then v.Material = Enum.Material.SmoothPlastic; v.Reflectance = 0; v.CastShadow = false
            elseif v:IsA("Decal") or v:IsA("Texture") then v.Transparency = 1
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then v.Enabled = false
            elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") or v:IsA("Sparkles") then v.Enabled = false
            elseif v:IsA("Explosion") then v:Destroy()
            end
        end
        for _, e in pairs(l:GetChildren()) do
            if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then e.Enabled = false end
        end
        t.WaterWaveSize, t.WaterWaveSpeed, t.WaterReflectance, t.WaterTransparency = 0, 0, 0, 0
        pcall(function() sethiddenproperty(t, "Decoration", false) end)
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        Window:Notify({ Title = "FPS Boosted", Description = "Effects deleted & FPS optimized!", Duration = 3, Type = "Success" })
    end
})

AntiLagTab:New("Button")({
    Title = "Reduce Lag",
    Description = "Shadows & lighting off, light version of FPS boost.",
    Callback = function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") then obj.CastShadow = false
            elseif obj:IsA("ParticleEmitter") or obj:IsA("Trail") then obj.Enabled = false
            elseif obj.Name == "Effects" and obj:IsA("Folder") then obj:Destroy()
            end
        end
        for _, effect in pairs(game.Lighting:GetChildren()) do if effect:IsA("PostEffect") then effect.Enabled = false end end
        Window:Notify({ Title = "Lag Reduced", Description = "Lag reduction applied!", Duration = 3, Type = "Success" })
    end
})

AntiLagTab:New("Button")({
    Title = "Remove All Textures",
    Description = "Deletes all decals/textures, uses smooth plastic.",
    Callback = function()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Decal") or obj:IsA("Texture") then obj:Destroy()
            elseif obj:IsA("BasePart") then obj.Material = Enum.Material.SmoothPlastic; obj.Reflectance = 0
            elseif obj.Name == "Effects" and obj:IsA("Folder") then obj:Destroy()
            end
        end
        Window:Notify({ Title = "Textures Removed", Description = "Textures & effects have been wiped!", Duration = 3, Type = "Success" })
    end
})

AntiLagTab:New("Button")({
    Title = "Optimize Network",
    Description = "Optimizes data replication for lower ping.",
    Callback = function()
        pcall(function() settings().Network.IncomingReplicationLag, settings().Network.PhysicsSend, settings().Network.FreeMemoryOnDisconnect = 0, 1, true end)
        for _, obj in pairs(workspace:GetDescendants()) do if obj.Name == "Effects" and obj:IsA("Folder") then obj:Destroy() end end
        Window:Notify({ Title = "Network Optimized", Description = "Network settings optimized!", Duration = 3, Type = "Success" })
    end
})

-- [[ 7. PROXIMITY PROMPT FRAMEWORK ]]
local function attachProximityPrompt(character, player)
    -- Ignore ourselves
    if player == LocalPlayer then return end
    
    -- Wait for the HumanoidRootPart explicitly
    local rootPart = character:WaitForChild("HumanoidRootPart", 5)
    if not rootPart then return end
    
    -- Prevent duplicate prompts
    if rootPart:FindFirstChild("AvatarStealPrompt") then return end

    local deviceString = getAssumePlayerDeviceString(player)

    -- Create the ProximityPrompt inside the HumanoidRootPart
    local prompt = Instance.new("ProximityPrompt")
    prompt.Name = "AvatarStealPrompt"
    prompt.ActionText = "Copy Avatar"
    prompt.ObjectText = player.Name .. " (" .. deviceString .. ")"
    prompt.KeyboardKeyCode = Enum.KeyCode.E
    prompt.RequiresLineOfSight = false
    prompt.MaxActivationDistance = 15
    prompt.HoldDuration = 0.5
    prompt.Parent = rootPart

    prompt.Triggered:Connect(function()
        getgenv().CurrentClipboardPlayerId = player.UserId
        getgenv().CurrentClipboardPlayerName = player.Name
        
        if AvatarClipboardLabel then 
            AvatarClipboardLabel:SetTitle("UI Clipboard: " .. player.Name) 
        end
        
        if Window and Window.Notify then 
            Window:Notify({ 
                Title = "Copied to UI!", 
                Description = "Stored " .. player.Name .. "'s avatar inside the hub.", 
                Duration = 3, 
                Type = "Success" 
            }) 
        end
    end)
end

-- Attach to current players
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        if player.Character then attachProximityPrompt(player.Character, player) end
        player.CharacterAdded:Connect(function(char) attachProximityPrompt(char, player) end)
    end
end

-- Attach to future joining players
Players.PlayerAdded:Connect(function(player) 
    player.CharacterAdded:Connect(function(char) attachProximityPrompt(char, player) end) 
end)

-- Swaps default tab to Avatar
Window:SetTab("Avatar")
