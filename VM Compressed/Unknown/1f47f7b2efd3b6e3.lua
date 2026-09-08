-- Ozen Hub - Ultimate Script Hub with Enhanced WindUI
-- Premium game scripts hub with amazing UI features
-- 25+ GAMES SUPPORTED

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagessus/WindUI/main/main.lua"))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer

-- Enhanced loading notification
StarterGui:SetCore("SendNotification", {
    Title = "🔥 Ozen Hub - Loading",
    Text = "Premium Universal Script Hub initializing...",
    Duration = 4,
    Icon = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
})

-- Set WindUI properties with enhanced visuals
WindUI.TransparencyValue = 0.1
WindUI:SetTheme("Dark")

-- Create main window with premium settings
local Window = WindUI:CreateWindow({
    Title = "🔥 Ozen Hub",
    Icon = "sparkles",
    Author = "25+ GAMES SUPPORTED",
    Folder = "OzenHub",
    Size = UDim2.fromOffset(650, 550),
    Theme = "Dark",
    HidePanelBackground = false,
    Acrylic = true,
    HideSearchBar = false,
    SideBarWidth = 220,
    BackgroundImage = "rbxassetid://9997192723",
    BackgroundImageTransparency = 0.8,
})

-- Enhanced notification function with emojis
local function showNotification(title, content, duration, icon)
    WindUI:Notify({
        Title = title,
        Content = content,
        Duration = duration or 4,
        Icon = icon or "check-circle"
    })
end

-- Premium script loader with enhanced feedback
local function loadScript(scriptName, scriptUrl, description, gameName)
    showNotification("🔄 Loading...", scriptName .. " is being loaded...", 2)
    
    local success, result = pcall(function()
        local scriptContent = game:HttpGet(scriptUrl, true)
        if not scriptContent or scriptContent == "" then
            error("❌ Empty script content received")
        end
        local loadedFunction = loadstring(scriptContent)
        if not loadedFunction then
            error("❌ Failed to compile script")
        end
        loadedFunction()
        return true
    end)
    
    if success then
        showNotification("✅ " .. scriptName, "🎮 " .. description .. "\n✨ Successfully loaded for " .. gameName, 5, "rocket")
    else
        showNotification("❌ " .. scriptName, "💥 Failed to load: " .. tostring(result), 6, "alert-triangle")
    end
end

-- Function to add Aham Hub and YARHM buttons to any tab
local function addUniversalScripts(tab, gameName)
    -- Aham Hub Button
    tab:Button({
        Title = "🎮 Aham Hub Script",
        Desc = "Universal script for " .. gameName .. " - 25+ games support",
        Icon = "cpu",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-AHAM-HUB-52379"))()
            showNotification("🎮 Aham Hub", "Loaded Aham Hub for " .. gameName .. "!", 4, "cpu")
        end
    })
    
    -- YARHM Button
    tab:Button({
        Title = "⚡ YARHM Script",
        Desc = "Universal script for " .. gameName .. " - All games support",
        Icon = "zap",
        Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403"))()
            showNotification("⚡ YARHM", "Loaded YARHM for " .. gameName .. "!", 4, "zap")
        end
    })
end

-- Enhanced button creator with emojis and better styling
local function createScriptButton(tab, name, description, url, gameName, emoji)
    tab:Button({
        Title = emoji .. " " .. name,
        Desc = description,
        Icon = "external-link",
        Callback = function()
            loadScript(name, url, description, gameName)
        end
    })
end

-- Create premium organized tabs with emojis
local HomeTab = Window:Tab({
    Icon = "home",
    Title = "🏠 Home"
})

local PopularTab = Window:Tab({
    Icon = "trending-up",
    Title = "⭐ Popular Games"
})

local MM2Tab = Window:Tab({
    Icon = "swords",
    Title = "🗡️ Murder Mystery 2"
})

local BladeBallTab = Window:Tab({
    Icon = "sword",
    Title = "⚔️ Blade Ball"
})

local BedwarsTab = Window:Tab({
    Icon = "bed",
    Title = "🛏️ BedWars"
})

local StealBrainrotTab = Window:Tab({
    Icon = "brain",
    Title = "🧠 Steal a Brainrot"
})

local RivalsTab = Window:Tab({
    Icon = "trophy",
    Title = "⚔️ Rivals"
})

local HyperShotTab = Window:Tab({
    Icon = "target",
    Title = "💉 HyperShot"
})

local GrowGardenTab = Window:Tab({
    Icon = "sprout",
    Title = "🌱 Grow a Garden"
})

local DoorsTab = Window:Tab({
    Icon = "door-closed",
    Title = "🚪 Doors"
})

local AriseTab = Window:Tab({
    Icon = "users",
    Title = "🎭 Arise Crossover"
})

local ArsenalTab = Window:Tab({
    Icon = "crosshair",
    Title = "🎯 Arsenal"
})

local BloxFruitsTab = Window:Tab({
    Icon = "ship",
    Title = "🚢 Blox Fruits"
})

local BuildBaseTab = Window:Tab({
    Icon = "castle",
    Title = "🏰 Build ur Base"
})

local PlantsBrainrotsTab = Window:Tab({
    Icon = "leaf",
    Title = "🌿 Plants Vs Brainrots"
})

local FishItTab = Window:Tab({
    Icon = "fish",
    Title = "🐟 Fish It!"
})

local BrookhavenTab = Window:Tab({
    Icon = "city",
    Title = "🏡 BrookHavenRP"
})

local CutTreesTab = Window:Tab({
    Icon = "tree",
    Title = "🌲 Cut Trees"
})

local MvsSTab = Window:Tab({
    Icon = "gun",
    Title = "🔫 Murderers VS Sheriffs"
})

local DeadRailsTab = Window:Tab({
    Icon = "train",
    Title = "🚂 Dead Rails"
})

local DaHoodTab = Window:Tab({
    Icon = "map-pin",
    Title = "🚗 DaHood"
})

local AnimeEternalTab = Window:Tab({
    Icon = "dragon",
    Title = "🐚 Anime Eternal"
})

local ForsakenTab = Window:Tab({
    Icon = "skull",
    Title = "🔪 Forsaken"
})

local AdoptMeTab = Window:Tab({
    Icon = "heart",
    Title = "🐾 Adopt Me!"
})

local InkGameTab = Window:Tab({
    Icon = "pen-tool",
    Title = "🖊️ Ink Game"
})

local StrongestBattlegroundsTab = Window:Tab({
    Icon = "fist",
    Title = "✋ The Strongest Battlegrounds"
})

local NightsForestTab = Window:Tab({
    Icon = "tree",
    Title = "🌲 99 Nights In The Forest"
})

local PetSimulator99Tab = Window:Tab({
    Icon = "paw-print",
    Title = "🐾 Pet Simulator 99"
})

local OtherGamesTab = Window:Tab({
    Icon = "gamepad",
    Title = "🎮 Other Games"
})

local ToolsTab = Window:Tab({
    Icon = "tool",
    Title = "⚙️ Tools"
})

local SettingsTab = Window:Tab({
    Icon = "settings",
    Title = "⚡ Settings"
})

-- Home Tab with premium welcome
HomeTab:Section({ Title = "🎉 Welcome to Ozen Hub", TextSize = 22 })
HomeTab:Divider()

HomeTab:Paragraph({
    Title = "🔥 Ozen Hub - Universal Script Hub",
    Desc = "🎮 Premium scripts for your favorite games!\n✨ No keys required • Regular updates • Best performance"
})

HomeTab:Paragraph({
    Title = "👤 User Info",
    Desc = "Welcome, " .. LocalPlayer.Name .. "!\n🎯 Ready to enhance your gaming experience!"
})

-- Quick stats section
HomeTab:Section({ Title = "📊 Quick Stats", TextSize = 18 })
HomeTab:Divider()

local StatsLabel = HomeTab:Paragraph({
    Title = "🔄 Loading statistics...",
    Desc = "Ozen Hub - Premium Performance"
})

-- Real-time performance monitoring
spawn(function()
    while true do
        local fps = math.round(1 / RunService.RenderStepped:Wait())
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()
        local memory = math.round(game:GetService("Stats"):GetMemoryUsageMbForTag(Enum.DeveloperMemoryType.Script))
        
        StatsLabel:Set({
            Title = string.format("⚡ %d FPS | 📡 %d ms | 💾 %d MB", fps, ping, memory),
            Desc = "🎮 Ozen Hub - Running Smoothly"
        })
        wait(2)
    end
end)

-- Quick actions
HomeTab:Section({ Title = "🚀 Quick Actions", TextSize = 18 })
HomeTab:Divider()

HomeTab:Button({
    Title = "📱 Join Discord",
    Desc = "Join our community for updates and support!",
    Icon = "users",
    Callback = function()
        setclipboard("https://discord.gg/pNfrgHeede")
        showNotification("📱 Discord", "🔗 Invite link copied to clipboard!", 4, "users")
    end
})

HomeTab:Button({
    Title = "🔄 Refresh Hub",
    Desc = "Reload the hub for latest updates",
    Icon = "refresh-cw",
    Callback = function()
        showNotification("🔄 Refreshing", "Ozen Hub is reloading...", 3, "refresh-cw")
        wait(2)
        Window:SelectTab(1)
    end
})

-- Popular Games Tab
PopularTab:Section({ Title = "⭐ Most Popular Scripts", TextSize = 20 })
PopularTab:Divider()

createScriptButton(
    PopularTab,
    "Infinite Yield",
    "Advanced admin commands with extensive features",
    "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
    "Universal",
    "👑"
)

createScriptButton(
    PopularTab,
    "Orca Hub",
    "Universal script hub for multiple games",
    "https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua",
    "Universal",
    "🐋"
)

createScriptButton(
    PopularTab,
    "Dark Dex",
    "Powerful script explorer and decompiler",
    "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua",
    "Universal",
    "🔍"
)

-- Add Aham Hub and YARHM to Popular tab
addUniversalScripts(PopularTab, "All Games")

-- Murder Mystery 2 Tab
MM2Tab:Section({ Title = "🗡️ Murder Mystery 2 Scripts", TextSize = 18 })
MM2Tab:Divider()

createScriptButton(
    MM2Tab,
    "MM2 TravHub",
    "Complete MM2 features - No Key Required",
    "https://raw.githubusercontent.com/mm2scripthub/TravHub/refs/heads/main/MurderMystery2",
    "Murder Mystery 2",
    "🌙"
)

createScriptButton(
    MM2Tab,
    "MM2 AUTOFARM",
    "Admin commands and tools - No Key Required",
    "https://raw.githubusercontent.com/renardofficiel/game/refs/heads/main/MurderMystery2/main.lua",
    "Murder Mystery 2",
    "🛡️"
)

-- Add Aham Hub and YARHM to MM2 tab
addUniversalScripts(MM2Tab, "Murder Mystery 2")

-- BladeBall Tab
BladeBallTab:Section({ Title = "⚔️ Blade Ball Scripts", TextSize = 18 })
BladeBallTab:Divider()

createScriptButton(
    BladeBallTab,
    "Blade Ball Bakugan",
    "Auto parry and prediction - No Key Required",
    "https://raw.githubusercontent.com/SoyAdriYT/PitbullHubX/refs/heads/main/PitbullHubX.lua",
    "Blade Ball",
    "🔥"
)

createScriptButton(
    BladeBallTab,
    "Blade Ball Laws Hub",
    "Advanced blade mechanics - No Key Required",
    "https://raw.githubusercontent.com/LawsHub/loader/refs/heads/main/loader.lua",
    "Blade Ball",
    "⚖️"
)

-- Add Aham Hub and YARHM to BladeBall tab
addUniversalScripts(BladeBallTab, "Blade Ball")

-- BedWars Tab
BedwarsTab:Section({ Title = "🛏️ BedWars Scripts", TextSize = 18 })
BedwarsTab:Divider()

createScriptButton(
    BedwarsTab,
    "BedWars Rust Hub",
    "Complete BedWars features - No Key Required",
    "https://raw.githubusercontent.com/0xEIite/rust/main/NewMainScript.lua",
    "BedWars",
    "🦀"
)

createScriptButton(
    BedwarsTab,
    "BedWars Vape V4",
    "Premium BedWars script with advanced features",
    "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua",
    "BedWars",
    "💨"
)

-- Add Aham Hub and YARHM to BedWars tab
addUniversalScripts(BedwarsTab, "BedWars")

-- Steal a Brainrot Tab
StealBrainrotTab:Section({ Title = "🧠 Steal a Brainrot Scripts", TextSize = 18 })
StealBrainrotTab:Divider()

StealBrainrotTab:Button({
    Title = "☂️ Steal a Brainrot Umbrella",
    Desc = "Complete Brainrot script package - MOLYN Development",
    Icon = "umbrella",
    Callback = function()
        loadScript("Brainrot Umbrella", "https://raw.githubusercontent.com/Atom1gg/Umbrella/refs/heads/main/Loader.lua", "Complete Brainrot script", "Steal a Brainrot")
    end
})

StealBrainrotTab:Button({
    Title = "🚀 MOLYN Brainrot Script",
    Desc = "Keyless script for Steal a Brainrot",
    Icon = "zap",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        showNotification("🧠 MOLYN Brainrot", "Loaded MOLYN Brainrot script!", 4, "brain")
    end
})

-- Add Aham Hub and YARHM to StealBrainrot tab
addUniversalScripts(StealBrainrotTab, "Steal a Brainrot")

-- Rivals Tab
RivalsTab:Section({ Title = "⚔️ Rivals Scripts", TextSize = 18 })
RivalsTab:Divider()

createScriptButton(
    RivalsTab,
    "RIVALS Rise",
    "Advanced Rivals script with auto features",
    "https://raw.githubusercontent.com/ShadowBey01/SHWX-Team-Rise-Scripts/refs/heads/main/Games/Rise%20(Rivals).lua",
    "Rivals",
    "🚀"
)

-- Add Aham Hub and YARHM to Rivals tab
addUniversalScripts(RivalsTab, "Rivals")

-- HyperShot Tab
HyperShotTab:Section({ Title = "💉 HyperShot Scripts", TextSize = 18 })
HyperShotTab:Divider()

-- Add Aham Hub and YARHM to HyperShot tab
addUniversalScripts(HyperShotTab, "HyperShot")

-- Grow a Garden Tab
GrowGardenTab:Section({ Title = "🌱 Grow a Garden Scripts", TextSize = 18 })
GrowGardenTab:Divider()

createScriptButton(
    GrowGardenTab,
    "Grow a Garden Soluna",
    "Auto farming and garden management",
    "https://soluna-script.vercel.app/grow-a-garden.lua",
    "Grow a Garden",
    "🌱"
)

-- Add Aham Hub and YARHM to GrowGarden tab
addUniversalScripts(GrowGardenTab, "Grow a Garden")

-- Doors Tab
DoorsTab:Section({ Title = "🚪 Doors Scripts", TextSize = 18 })
DoorsTab:Divider()

createScriptButton(
    DoorsTab,
    "DOORS Saturn Hub",
    "Complete Doors script with entity avoidance",
    "https://raw.githubusercontent.com/JScripter-Lua/Saturn_Hub_Products/refs/heads/main/Saturn_Hub_Doors.lua",
    "Doors",
    "🪐"
)

createScriptButton(
    DoorsTab,
    "DOORS Velocity X",
    "Speed and survival features for Doors",
    "https://raw.githubusercontent.com/DasVelocity/VelocityX/refs/heads/main/VelocityX.lua",
    "Doors",
    "💨"
)

-- Add Aham Hub and YARHM to Doors tab
addUniversalScripts(DoorsTab, "Doors")

-- Arise Crossover Tab
AriseTab:Section({ Title = "🎭 Arise Crossover Scripts", TextSize = 18 })
AriseTab:Divider()

-- Add Aham Hub and YARHM to Arise tab
addUniversalScripts(AriseTab, "Arise Crossover")

-- Arsenal Tab
ArsenalTab:Section({ Title = "🎯 Arsenal Scripts", TextSize = 18 })
ArsenalTab:Divider()

createScriptButton(
    ArsenalTab,
    "Arsenal Vapa v2 Hub",
    "Aimbot and ESP for Arsenal",
    "https://raw.githubusercontent.com/Nickyangtpe/Vapa-v2/refs/heads/main/Vapav2-Arsenal.lua",
    "Arsenal",
    "🎨"
)

createScriptButton(
    ArsenalTab,
    "Arsenal Tbao Hub",
    "Complete Arsenal script package",
    "https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal",
    "Arsenal",
    "🐯"
)

-- Add Aham Hub and YARHM to Arsenal tab
addUniversalScripts(ArsenalTab, "Arsenal")

-- Blox Fruits Tab
BloxFruitsTab:Section({ Title = "🚢 Blox Fruits Scripts", TextSize = 18 })
BloxFruitsTab:Divider()

createScriptButton(
    BloxFruitsTab,
    "Blox Fruits Hub",
    "Auto farm and boss fighting features",
    "https://raw.githubusercontent.com/farrelghibran/demon/main/source.app",
    "Blox Fruits",
    "👹"
)

createScriptButton(
    BloxFruitsTab,
    "GoldenHUB Blox",
    "Premium Blox Fruits automation",
    "https://paste.myconan.net/489742.txt",
    "Blox Fruits",
    "🏆"
)

-- Add Aham Hub and YARHM to BloxFruits tab
addUniversalScripts(BloxFruitsTab, "Blox Fruits")

-- Build ur Base Tab
BuildBaseTab:Section({ Title = "🏰 Build ur Base Scripts", TextSize = 18 })
BuildBaseTab:Divider()

-- Add Aham Hub and YARHM to BuildBase tab
addUniversalScripts(BuildBaseTab, "Build ur Base")

-- Plants Vs Brainrots Tab
PlantsBrainrotsTab:Section({ Title = "🌿 Plants Vs Brainrots Scripts", TextSize = 18 })
PlantsBrainrotsTab:Divider()

-- Add Aham Hub and YARHM to PlantsBrainrots tab
addUniversalScripts(PlantsBrainrotsTab, "Plants Vs Brainrots")

-- Fish It Tab
FishItTab:Section({ Title = "🐟 Fish It! Scripts", TextSize = 18 })
FishItTab:Divider()

FishItTab:Button({
    Title = "⚡ MOLYN Fish It Script",
    Desc = "Keyless fishing script - MOLYN Development",
    Icon = "fish",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        showNotification("🐟 MOLYN Fish It", "Loaded MOLYN Fish It script!", 4, "fish")
    end
})

-- Add Aham Hub and YARHM to FishIt tab
addUniversalScripts(FishItTab, "Fish It!")

-- Brookhaven Tab
BrookhavenTab:Section({ Title = "🏡 BrookHavenRP Scripts", TextSize = 18 })
BrookhavenTab:Divider()

BrookhavenTab:Button({
    Title = "🏠 MOLYN Brookhaven Script",
    Desc = "Keyless Brookhaven script - Credits: BRUTON",
    Icon = "city",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        showNotification("🏙️ MOLYN Brookhaven", "Loaded MOLYN Brookhaven script!", 4, "city")
    end
})

-- Add Aham Hub and YARHM to Brookhaven tab
addUniversalScripts(BrookhavenTab, "BrookHavenRP")

-- Cut Trees Tab
CutTreesTab:Section({ Title = "🌲 Cut Trees Scripts", TextSize = 18 })
CutTreesTab:Divider()

-- Add Aham Hub and YARHM to CutTrees tab
addUniversalScripts(CutTreesTab, "Cut Trees")

-- Murderers VS Sheriffs Tab
MvsSTab:Section({ Title = "🔫 Murderers VS Sheriffs Duels Scripts", TextSize = 18 })
MvsSTab:Divider()

-- Add Aham Hub and YARHM to MvsS tab
addUniversalScripts(MvsSTab, "Murderers VS Sheriffs")

-- Dead Rails Tab
DeadRailsTab:Section({ Title = "🚂 Dead Rails Scripts", TextSize = 18 })
DeadRailsTab:Divider()

DeadRailsTab:Button({
    Title = "💰 MOLYN Dead Rails Script",
    Desc = "Auto farm bonds - Credits: HANG/Tora",
    Icon = "dollar-sign",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        showNotification("🚂 MOLYN Dead Rails", "Loaded MOLYN Dead Rails script!", 4, "train")
    end
})

-- Add Aham Hub and YARHM to DeadRails tab
addUniversalScripts(DeadRailsTab, "Dead Rails")

-- DaHood Tab
DaHoodTab:Section({ Title = "🚗 DaHood Scripts", TextSize = 18 })
DaHoodTab:Divider()

-- Add Aham Hub and YARHM to DaHood tab
addUniversalScripts(DaHoodTab, "DaHood")

-- Anime Eternal Tab
AnimeEternalTab:Section({ Title = "🐚 Anime Eternal Scripts", TextSize = 18 })
AnimeEternalTab:Divider()

-- Add Aham Hub and YARHM to AnimeEternal tab
addUniversalScripts(AnimeEternalTab, "Anime Eternal")

-- Forsaken Tab
ForsakenTab:Section({ Title = "🔪 Forsaken Scripts", TextSize = 18 })
ForsakenTab:Divider()

-- Add Aham Hub and YARHM to Forsaken tab
addUniversalScripts(ForsakenTab, "Forsaken")

-- Adopt Me Tab
AdoptMeTab:Section({ Title = "🐾 Adopt Me! Scripts", TextSize = 18 })
AdoptMeTab:Divider()

-- Add Aham Hub and YARHM to AdoptMe tab
addUniversalScripts(AdoptMeTab, "Adopt Me!")

-- Ink Game Tab
InkGameTab:Section({ Title = "🖊️ Ink Game Scripts", TextSize = 18 })
InkGameTab:Divider()

-- Add Aham Hub and YARHM to InkGame tab
addUniversalScripts(InkGameTab, "Ink Game")

-- The Strongest Battlegrounds Tab
StrongestBattlegroundsTab:Section({ Title = "✋ The Strongest Battlegrounds Scripts", TextSize = 18 })
StrongestBattlegroundsTab:Divider()

-- Add Aham Hub and YARHM to StrongestBattlegrounds tab
addUniversalScripts(StrongestBattlegroundsTab, "The Strongest Battlegrounds")

-- 99 Nights In The Forest Tab
NightsForestTab:Section({ Title = "🌲 99 Nights In The Forest Scripts", TextSize = 18 })
NightsForestTab:Divider()

NightsForestTab:Button({
    Title = "🌙 MOLYN 99 Nights Script",
    Desc = "Survival script for 99 Nights",
    Icon = "moon",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/XDZB6xCY/raw"))()
        showNotification("🌲 MOLYN 99 Nights", "Loaded MOLYN 99 Nights script!", 4, "tree")
    end
})

-- Add Aham Hub and YARHM to NightsForest tab
addUniversalScripts(NightsForestTab, "99 Nights In The Forest")

-- Pet Simulator 99 Tab
PetSimulator99Tab:Section({ Title = "🐾 Pet Simulator 99 Scripts", TextSize = 18 })
PetSimulator99Tab:Divider()

-- Add Aham Hub and YARHM to PetSimulator99 tab
addUniversalScripts(PetSimulator99Tab, "Pet Simulator 99")

-- Other Games Tab
OtherGamesTab:Section({ Title = "🎮 Other Popular Games", TextSize = 18 })
OtherGamesTab:Divider()

createScriptButton(
    OtherGamesTab,
    "99 Nights Vortex Hub",
    "Complete survival features - No Key Required",
    "https://api.luarmor.net/files/v3/loaders/80aed6b06a7e38e8260a1b82638ff65b.lua",
    "99 Nights",
    "🌙"
)

createScriptButton(
    OtherGamesTab,
    "RIVALS Rise",
    "Advanced Rivals script with auto features",
    "https://raw.githubusercontent.com/ShadowBey01/SHWX-Team-Rise-Scripts/refs/heads/main/Games/Rise%20(Rivals).lua",
    "Rivals",
    "🚀"
)

-- Enhanced Tools Tab with premium features
ToolsTab:Section({ Title = "⚙️ Premium Tools", TextSize = 20 })
ToolsTab:Divider()

-- Enhanced Fly System
local flyEnabled = false
local flySpeed = 50
local bodyVelocity, bodyGyro

ToolsTab:Toggle({
    Title = "🚀 Flight System",
    Desc = "Toggle flying mode (WASD + Space/Shift)",
    Value = false,
    Callback = function(state)
        if state then
            -- Start flying
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                local rootPart = character:FindFirstChild("HumanoidRootPart")
                
                if humanoid and rootPart then
                    flyEnabled = true
                    
                    bodyVelocity = Instance.new("BodyVelocity")
                    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)
                    bodyVelocity.Parent = rootPart
                    
                    bodyGyro = Instance.new("BodyGyro")
                    bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
                    bodyGyro.CFrame = rootPart.CFrame
                    bodyGyro.Parent = rootPart
                    
                    humanoid.PlatformStand = true
                    showNotification("🚀 Flight", "Flight activated! Use WASD + Space/Shift", 4, "rocket")
                end
            end
        else
            -- Stop flying
            flyEnabled = false
            if bodyVelocity then bodyVelocity:Destroy() end
            if bodyGyro then bodyGyro:Destroy() end
            
            local character = LocalPlayer.Character
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then humanoid.PlatformStand = false end
            end
            showNotification("🚀 Flight", "Flight deactivated", 3, "landmark")
        end
    end
})

ToolsTab:Slider({
    Title = "🎯 Flight Speed",
    Desc = "Adjust flying movement speed",
    Value = { Min = 20, Max = 200, Default = 50 },
    Callback = function(value)
        flySpeed = value
    end
})

-- NoClip System
local noclipEnabled = false
ToolsTab:Toggle({
    Title = "👻 NoClip Mode",
    Desc = "Walk through walls and objects",
    Value = false,
    Callback = function(state)
        noclipEnabled = state
        showNotification("👻 NoClip", state and "NoClip activated!" or "NoClip deactivated", 3, "ghost")
    end
})

-- Speed Control
local walkSpeedValue = 16
ToolsTab:Slider({
    Title = "💨 Walk Speed",
    Desc = "Adjust character movement speed",
    Value = { Min = 16, Max = 200, Default = 16 },
    Callback = function(value)
        walkSpeedValue = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.WalkSpeed = value end
    end
})

-- Jump Power Control
local jumpPowerValue = 50
ToolsTab:Slider({
    Title = "🦘 Jump Power",
    Desc = "Adjust character jump height",
    Value = { Min = 50, Max = 500, Default = 50 },
    Callback = function(value)
        jumpPowerValue = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid.JumpPower = value end
    end
})

-- Infinite Jump
local infiniteJumpEnabled = false
ToolsTab:Toggle({
    Title = "∞ Infinite Jump",
    Desc = "Jump infinitely by holding spacebar",
    Value = false,
    Callback = function(state)
        infiniteJumpEnabled = state
        showNotification("∞ Jump", state and "Infinite jump activated!" or "Infinite jump deactivated", 3, "activity")
    end
})

-- Flight movement handler
RunService.RenderStepped:Connect(function()
    if flyEnabled and bodyVelocity and bodyGyro and LocalPlayer.Character then
        local rootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local camera = workspace.CurrentCamera
        
        if rootPart and camera then
            local moveDirection = Vector3.new(0, 0, 0)
            
            -- Movement inputs
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                moveDirection = moveDirection + camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                moveDirection = moveDirection - camera.CFrame.LookVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                moveDirection = moveDirection - camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                moveDirection = moveDirection + camera.CFrame.RightVector
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                moveDirection = moveDirection + Vector3.new(0, 1, 0)
            end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                moveDirection = moveDirection - Vector3.new(0, 1, 0)
            end
            
            -- Apply movement
            bodyVelocity.Velocity = moveDirection * flySpeed
            bodyGyro.CFrame = camera.CFrame
        end
    end
    
    -- NoClip handler
    if noclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Infinite jump handler
UserInputService.JumpRequest:Connect(function()
    if infiniteJumpEnabled and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then humanoid:ChangeState("Jumping") end
    end
end)

-- Character reset handler
LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(1) -- Wait for character to load
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = walkSpeedValue
        humanoid.JumpPower = jumpPowerValue
    end
    
    -- Restart flight if it was enabled
    if flyEnabled then
        task.wait(2)
        -- Re-enable flight (you would call the flight function here)
    end
end)

-- Premium Settings Tab
SettingsTab:Section({ Title = "🎨 UI Customization", TextSize = 20 })
SettingsTab:Divider()

-- Theme selector with emojis
local themes = {
    "Dark 🌙", 
    "Light ☀️", 
    "Darker 🌑", 
    "Luna 🌕", 
    "Aqua 🌊",
    "Purple 💜",
    "Red ❤️"
}

SettingsTab:Dropdown({
    Title = "🎭 UI Theme",
    Desc = "Change the interface theme and colors",
    Values = themes,
    Value = "Dark 🌙",
    Callback = function(value)
        local themeName = string.gsub(value, " [%p%w]*$", "") -- Remove emoji
        WindUI:SetTheme(themeName)
        showNotification("🎭 Theme", "UI theme set to: " .. value, 3, "palette")
    end
})

-- Transparency control
SettingsTab:Slider({
    Title = "🔍 UI Transparency",
    Desc = "Adjust window transparency level",
    Value = { Min = 0, Max = 1, Default = 0.1, Step = 0.05 },
    Callback = function(value)
        WindUI.TransparencyValue = value
        Window:ToggleTransparency(value > 0)
    end
})

-- Keybind settings
SettingsTab:Keybind({
    Title = "⌨️ UI Toggle Key",
    Desc = "Key to show/hide the interface",
    Value = "RightControl",
    Callback = function(key)
        Window:SetToggleKey(Enum.KeyCode[key])
        showNotification("⌨️ Keybind", "UI toggle key set to: " .. key, 3, "keyboard")
    end
})

-- Configuration system
SettingsTab:Section({ Title = "💾 Configuration", TextSize = 18 })
SettingsTab:Divider()

local configName = "ozen_hub"
SettingsTab:Input({
    Title = "📝 Config Name",
    Desc = "Name for saving/loading settings",
    Value = configName,
    Callback = function(value)
        configName = value or "ozen_hub"
    end
})

SettingsTab:Button({
    Title = "💾 Save Configuration",
    Desc = "Save all current settings and preferences",
    Icon = "save",
    Callback = function()
        local configData = {
            WalkSpeed = walkSpeedValue,
            JumpPower = jumpPowerValue,
            FlySpeed = flySpeed,
            Theme = "Dark",
            Transparency = 0.1
        }
        
        if writefile then
            writefile(configName .. "_config.json", game:GetService("HttpService"):JSONEncode(configData))
            showNotification("💾 Saved", "Configuration saved successfully!", 3, "save")
        else
            showNotification("❌ Error", "Your executor doesn't support file writing", 4, "alert-triangle")
        end
    end
})

SettingsTab:Button({
    Title = "📂 Load Configuration",
    Desc = "Load saved settings and preferences",
    Icon = "folder",
    Callback = function()
        if readfile and isfile(configName .. "_config.json") then
            local configData = game:GetService("HttpService"):JSONDecode(readfile(configName .. "_config.json"))
            
            -- Apply loaded settings
            if configData.WalkSpeed then
                walkSpeedValue = configData.WalkSpeed
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then humanoid.WalkSpeed = walkSpeedValue end
            end
            
            showNotification("📂 Loaded", "Configuration loaded successfully!", 3, "folder")
        else
            showNotification("❌ Error", "No saved configuration found", 4, "alert-triangle")
        end
    end
})

-- Reset everything
SettingsTab:Button({
    Title = "🔄 Reset Everything",
    Desc = "Reset all settings to default values",
    Icon = "refresh-cw",
    Callback = function()
        WindUI:SetTheme("Dark")
        WindUI.TransparencyValue = 0.1
        walkSpeedValue = 16
        jumpPowerValue = 50
        flySpeed = 50
        
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = 16
            humanoid.JumpPower = 50
        end
        
        showNotification("🔄 Reset", "All settings restored to default!", 3, "refresh-cw")
    end
})

-- Final initialization with premium effects
Window:SelectTab(1)
Window:UnlockAll()

Window:OnClose(function()
    showNotification("🔥 Ozen Hub", "UI hidden! Press RightControl to reopen.", 3, "eye-off")
end)

Window:OnOpen(function()
    showNotification("🎉 Ozen Hub - Ready!", "Premium Universal Script Hub loaded!\n🎮 Enjoy enhanced gaming!", 5, "sparkles")
end)

-- Auto-apply character settings
LocalPlayer.CharacterAdded:Connect(function(character)
    task.wait(1)
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = walkSpeedValue
        humanoid.JumpPower = jumpPowerValue
    end
end)

wait(1)
-- Customization ui 
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebulla-Softworks/Luna-Interface/refs/heads/main/source.lua"))()

setclipboard("https://discord.gg/pNfrgHeede")
print("🎉 Ozen Hub - Premium Universal Script Hub Loaded Successfully!")
