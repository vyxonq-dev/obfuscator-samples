-- Fixz Hub- Universal Script Loader
-- Created by fixz64
-- Loads scripts for multiple games with Rayfield UI

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Get current game info
local MarketplaceService = game:GetService("MarketplaceService")
local gameId = game.PlaceId
local gameName = "Unknown Game"

pcall(function()
    local gameInfo = MarketplaceService:GetProductInfo(gameId)
    gameName = gameInfo.Name
end)

-- Script database with game IDs
local Scripts = {
    {
        name = "Steal A Brainrot",
        gameIds = {109983668079237}, -- Add actual game ID
        url = "https://pastebin.com/raw/qpM7LXge",
        status = "⚠️ Broken"
    },
    {
        name = "Criminal Tycoon",
        gameIds = {14218711698}, -- Add actual game ID
        url = "https://pastebin.com/raw/V5FRJsTV",
        status = "✅ Working"
    },
    {
        name = "[FPS] Flick",
        gameIds = {136801880565837}, -- Add actual game ID
        url = "https://pastebin.com/raw/bS9ckh52",
        status = "✅ Working"
    },
    {
        name = "Flee The Facility",
        gameIds = {893973440}, -- Flee The Facility game ID
        url = "https://pastebin.com/raw/2MGFafAf",
        status = "✅ Working"
    },
    {
        name = "[🔁]Build a Zoo",
        gameIds = {105555311806207}, -- Add actual game ID
        url = "https://pastebin.com/raw/M7Ny7BQj",
        status = "⚠️ Broken"
    },
    {
        name = "Legends Of Speed",
        gameIds = {3101667897}, -- Legends Of Speed game ID
        url = "https://pastebin.com/raw/xV6qn5py",
        status = "🔑 Key System"
    },
    {
        name = "Arsenal",
        gameIds = {286090429}, -- Arsenal game ID
        url = "https://pastebin.com/raw/f8u4cbkH",
        status = "✅ Working"
    },
    {
        name = "Go Fishing!",
        gameIds = {116605585218149}, -- Add actual game ID
        url = "https://pastebin.com/raw/P0qwhgbX",
        status = "✅ Working"
    },
    {
        name = "Meme Sea",
        gameIds = {10260193230}, -- Add actual game ID
        url = "https://pastebin.com/raw/X7iQpTVF",
        status = "✅ Working"
    },
    {
        name = "⛏️ Dig to Earth's CORE!",
        gameIds = {81440632616906}, -- Add actual game ID
        url = "https://pastebin.com/raw/SAqXh9d1",
        status = "✅ Working"
    },
    {
        name = "[⭐] Create a Factory [🏭]",
        gameIds = {98632918083844}, -- Add actual game ID
        url = "https://pastebin.com/raw/qjASiFen",
        status = "✅ Working"
    }
}

-- Find supported script for current game
local supportedScript = nil
for _, script in ipairs(Scripts) do
    for _, id in ipairs(script.gameIds) do
        if id == gameId then
            supportedScript = script
            break
        end
    end
    if supportedScript then break end
end

-- Create Rayfield Window
local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub - Universal Loader",
    LoadingTitle = "Fixz Hub",
    LoadingSubtitle = "by fixz64 on dc",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "KoumalaHub"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = false
    },
    KeySystem = false
})

-- Game Info Tab
local GameTab = Window:CreateTab("all my script 🌌", nil)

local GameSection = GameTab:CreateSection("Current Game")

GameTab:CreateLabel("Game: " .. gameName)
GameTab:CreateLabel("Place ID: " .. tostring(gameId))

if supportedScript then
    GameTab:CreateLabel("Status: ✅ Script Available!")
    GameTab:CreateLabel("Script: " .. supportedScript.name)
    GameTab:CreateLabel("Status: " .. supportedScript.status)
else
    GameTab:CreateLabel("Status: ❌ No script available for this game")
end

-- Scripts Tab
local ScriptsTab = Window:CreateTab("📜 All Scripts", nil)

local ScriptsSection = ScriptsTab:CreateSection("Available Scripts")

ScriptsTab:CreateParagraph({
    Title = "Info",
    Content = "Click any button below to load the script for that game. Some scripts may require you to be in the correct game."
})

-- Create buttons for each script
for _, script in ipairs(Scripts) do
    local buttonText = script.name .. " " .. script.status
    
    ScriptsTab:CreateButton({
        Name = buttonText,
        Callback = function()
            Rayfield:Notify({
                Title = "Loading Script",
                Content = "Loading " .. script.name .. "...",
                Duration = 3,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                        end
                    },
                },
            })
            
            -- Load the script
            local success, err = pcall(function()
                loadstring(game:HttpGet(script.url))()
            end)
            
            if success then
                Rayfield:Notify({
                    Title = "Success",
                    Content = script.name .. " loaded successfully!",
                    Duration = 5,
                    Image = 4483362458,
                    Actions = {
                        Ignore = {
                            Name = "Okay!",
                            Callback = function()
                            end
                        },
                    },
                })
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Failed to load " .. script.name .. ". Error: " .. tostring(err),
                    Duration = 6.5,
                    Image = 4483362458,
                    Actions = {
                        Ignore = {
                            Name = "Okay!",
                            Callback = function()
                            end
                        },
                    },
                })
            end
        end,
    })
end

-- Quick Load Tab (for current game)
if supportedScript then
    local QuickTab = Window:CreateTab("⚡ Quick Load", nil)
    
    local QuickSection = QuickTab:CreateSection("Quick Load for " .. gameName)
    
    QuickTab:CreateButton({
        Name = "🚀 Load " .. supportedScript.name,
        Callback = function()
            Rayfield:Notify({
                Title = "Quick Loading",
                Content = "Loading script for current game...",
                Duration = 3,
                Image = 4483362458,
                Actions = {
                    Ignore = {
                        Name = "Okay!",
                        Callback = function()
                        end
                    },
                },
            })
            
            local success, err = pcall(function()
                loadstring(game:HttpGet(supportedScript.url))()
            end)
            
            if success then
                Rayfield:Notify({
                    Title = "Success",
                    Content = "Script loaded successfully!",
                    Duration = 5,
                    Image = 4483362458,
                    Actions = {
                        Ignore = {
                            Name = "Okay!",
                            Callback = function()
                            end
                        },
                    },
                })
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Failed to load script. Error: " .. tostring(err),
                    Duration = 6.5,
                    Image = 4483362458,
                    Actions = {
                        Ignore = {
                            Name = "Okay!",
                            Callback = function()
                            end
                        },
                    },
                })
            end
        end,
    })
    
    QuickTab:CreateParagraph({
        Title = "Script Status",
        Content = supportedScript.status
    })
end

-- Info Tab
local InfoTab = Window:CreateTab("ℹ️ Info", nil)

local InfoSection = InfoTab:CreateSection("About Koumala Hub")

InfoTab:CreateParagraph({
    Title = "Created by mem0rify",
    Content = "Universal script loader for multiple Roblox games. Select any script from the Scripts tab to load it."
})

InfoTab:CreateParagraph({
    Title = "How to Use",
    Content = "1. Check the Game Info tab to see if your current game is supported\n2. Go to Scripts tab and click any button to load that script\n3. If available, use Quick Load tab for instant loading"
})

InfoTab:CreateParagraph({
    Title = "Script Status Legend",
    Content = "✅ Working - Script is functional\n⚠️ Patched - Script may not work\n🔑 Key System - Requires key/Discord"
})

InfoTab:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Rayfield:Destroy()
    end,
})

-- Notification on load
Rayfield:Notify({
    Title = "Fixz Hub Loaded",
    Content = "Universal Script Loader by fixz64",
    Duration = 5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "Okay!",
            Callback = function()
            end
        },
    },
})

print("========================================")
print("Fixz Hub - Universal Loader")
print("Created by: fixz64")
print("Current Game: " .. gameName)
print("Place ID: " .. tostring(gameId))
if supportedScript then
    print("Supported Script: " .. supportedScript.name)
else
    print("No specific script for this game")
end
print("========================================")