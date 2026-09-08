local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

-- Configuration & Game Data
local CurrentGameID = game.PlaceId
local GameData = {
    [5938036553] = {
        Name = "Frontlines",
        Options = {
            {Title = "Legacy", Script = "https://raw.githubusercontent.com/vexascripts/Roblox-Scripts/refs/heads/main/FRONTLINES"},
            -- FIXED RAW LINKS BELOW --
            {Title = "Stable", Script = "https://raw.githubusercontent.com/catto-kyro/frontlines/refs/heads/main/aimbot"},
            {Title = "!Beta!", Script = "https://raw.githubusercontent.com/kyro-scripts/cattohub/refs/heads/main/beta"}
        }
    },
    [136372246050123] = {
        Name = "Stick Battles 🍢",
        Options = {
            {Title = "Load Stick Battles Script", Script = "https://raw.githubusercontent.com/vexascripts/Roblox-Scripts/refs/heads/main/Stick%20Battles%20🍢"}
        }
    },
    [1215581239] = {
        Name = "DoomSpire",
        Options = {
            {Title = "Load DoomSpire Script", Script = "https://raw.githubusercontent.com/vexascripts/Roblox-Scripts/refs/heads/main/DoomSpire"}
        }
    }
}

-- Create Window
local Window = Fluent:CreateWindow({
    Title = "KyroHub",
    SubTitle = "by Catto",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- Blur effect
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Current Game", Icon = "home" }),
    Games = Window:AddTab({ Title = "Games List", Icon = "list" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

-- [[ TAB: CURRENT GAME (AUTO-DETECTION) ]]
local detected = GameData[CurrentGameID]

if detected then
    Tabs.Main:AddParagraph({
        Title = "Detected: " .. detected.Name,
        Content = "Place ID: " .. CurrentGameID
    })

    for _, btn in ipairs(detected.Options) do
        Tabs.Main:AddButton({
            Title = btn.Title,
            Description = "Executes external script via loadstring",
            Callback = function()
                Fluent:Notify({ Title = "Loading...", Content = "Executing: " .. btn.Title, Duration = 3 })
                task.spawn(function()
                    loadstring(game:HttpGet(btn.Script))()
                end)
            end
        })
    end
else
    Tabs.Main:AddParagraph({
        Title = "Unsupported Game",
        Content = "This game is not currently in the database. Use the Games List tab to teleport."
    })
end

-- [[ TAB: GAMES LIST (TELEPORT HUB) ]]
Tabs.Games:AddParagraph({
    Title = "Game Selection",
    Content = "Select a game to teleport and load its specific scripts."
})

for id, data in pairs(GameData) do
    Tabs.Games:AddButton({
        Title = "Join " .. data.Name,
        Description = "ID: " .. id,
        Callback = function()
            Window:Dialog({
                Title = "Teleport Confirmation",
                Content = "Are you sure you want to teleport to " .. data.Name .. "?",
                Buttons = {
                    {
                        Title = "Yes",
                        Callback = function()
                            TeleportService:Teleport(id, Players.LocalPlayer)
                        end
                    },
                    { Title = "Cancel" }
                }
            })
        end
    })
end

-- [[ SETTINGS ]]
Tabs.Settings:AddButton({
    Title = "Destroy UI",
    Description = "Safely close the hub",
    Callback = function()
        Window:Destroy()
    end
})

Fluent:Notify({
    Title = "Hub Loaded",
    Content = detected and "Detected " .. detected.Name or "Ready to use.",
    Duration = 5
})

Window:SelectTab(1)
