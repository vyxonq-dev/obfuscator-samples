-- Load Rayfield
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Copy Discord Invite to Clipboard
setclipboard("https://discord.gg/qkbfCJ87SN") -- Replace with your invite
game.StarterGui:SetCore("SendNotification", {
    Title = "Discord Copied",
    Text = "Join Discord for the key!",
    Duration = 5
})

-- Main Window with Key System
local Window = Rayfield:CreateWindow({
    Name = "Astro Hub",
    LoadingTitle = "Astro Hub",
    LoadingSubtitle = "By Astro",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "AstroHubConfig"
    },
    Discord = {
        Enabled = false
    },
    KeySystem = true,
    KeySettings = {
        Title = "Key Required",
        Subtitle = "Get the key from Discord",
        Note = "Discord invite copied to clipboard",
        FileName = "AstroHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = { "DuckyIsHungryGDABhHDUJHhwudhuahijoomomom1122881536282917" } -- Replace with your actual key
    }
})

-- Simple Notify Function
function notify(title, text)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = 5
    })
end

-- Helper: Create Tab and Buttons
local function createGameTab(name, icon, scripts)
    local tab = Window:CreateTab(name, icon or 4483362458)
    for _, script in ipairs(scripts) do
        tab:CreateButton({
            Name = script.name,
            Callback = script.callback
        })
    end
end

-- Universal Tab
local UniversalTab = Window:CreateTab("Universal", 4483362458)
UniversalTab:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
        notify("Universal", "Nameless Admin Loaded")
    end
})
UniversalTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        notify("Universal", "Rejoining...")
    end
})
UniversalTab:CreateButton({
    Name = "Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        notify("Universal", "Anti-AFK Enabled")
    end
})

-- Supported Game PlaceIds
local Supported = {
    [6403373529] = "Slap Battle",
    [17625359962] = "Rivals",
    [18687417158] = "Forsaken",
    [12543955401] = "Blade Ball",
    [13822889] = "Blox Fruits",
    [286090429] = "Arsenal",
    [17574618959] = "Just a Baseplate",
    [10449761463] = "The Strongest Battle Grounds"
}

-- Game Detection
local id = game.PlaceId
local name = Supported[id]

if name then
    -- Blox Fruits
    if name == "Blox Fruits" then
        createGameTab("Blox Fruits", nil, {
            {
                name = "JohnnyCheeseHub",
                callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/rbw4/main/JonnyCheeseHub"))()
                    notify("Blox Fruits", "JohnnyCheeseHub Loaded")
                end
            },
            {
                name = "rEDZ HUB",
                callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/redz-hub/bloxfruits/main/redz.lua"))()
                    notify("Blox Fruits", "rEDZ Loaded")
                end
            },
            {
                name = "PiHub (Keyless)",
                callback = function()
                    _G.Key = ""
                    loadstring(game:HttpGet("https://pi-hub.pages.dev/scripts/bloxfruit.lua"))()
                    notify("Blox Fruits", "PiHub Loaded")
                end
            }
        })

    -- Forsaken
    elseif name == "Forsaken" then
        createGameTab("Forsaken", nil, {
            {
                name = "B0bbyHub",
                callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/BobJunior1/ForsakenBoi/refs/heads/main/B0bbyHub"))()
                    notify("Forsaken", "B0bbyHub Loaded")
                end
            },
            {
                name = "YARHM",
                callback = function()
                    local src = ""
                    pcall(function()
                        src = game:HttpGet("https://yarhm.mhi.im/scr", false)
                    end)
                    if src == "" then
                        notify("YARHM", "Using Offline Version")
                        src = game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.19/yarhm.lua", false)
                    end
                    loadstring(src)()
                    notify("Forsaken", "YARHM Loaded")
                end
            },
            {
                name = "ExploitingIsFun Loader",
                callback = function()
                    loadstring(game:HttpGet("https://cdn.exploitingis.fun/loader", true))()
                    notify("Forsaken", "Loader Loaded")
                end
            }
        })

    -- Just a Baseplate
    elseif name == "Just a Baseplate" then
        createGameTab("Just a Baseplate", nil, {
            {
                name = "Hat Script",
                callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/inkdupe/hat-scripts/refs/heads/main/updatedhathub.lua"))()
                    notify("Baseplate", "Hat Script Loaded")
                end
            }
        })

    -- The Strongest Battle Grounds
    elseif name == "The Strongest Battle Grounds" then
        createGameTab("Strongest BG", nil, {
            {
                name = "XDevHub Beta",
                callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Emerson2-creator/Scripts-Roblox/refs/heads/main/XDevHubBeta.lua"))()
                    notify("Strongest BG", "XDevHub Loaded")
                end
            },
            {
                name = "ZerTex",
                callback = function()
                    loadstring(game:HttpGet("https://raw.githubusercontent.com/Viunze/ZerTex/refs/heads/main/Zertex.lua"))()
                    notify("Strongest BG", "ZerTex Loaded")
                end
            }
        })

    -- Placeholder tabs for other supported games
    else
        createGameTab(name, nil, {
            {
                name = "No scripts yet",
                callback = function()
                    notify(name, "Scripts coming soon!")
                end
            }
        })
    end
else
    Window:CreateTab("Unsupported Game", 4483362458)
end


