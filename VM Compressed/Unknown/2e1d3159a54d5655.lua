local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

WindUI.TransparencyValue = 0.3
WindUI:SetTheme("Crimson")

local Window = WindUI:CreateWindow({
    Title = "Spectrum X Hub",
    Icon = "strikethrough",
    Author = "by iXSpectre",
    Folder = "SpectrumXLoader",
    Size = UDim2.fromOffset(700, 600),
    Theme = "Crimson",
    HidePanelBackground = false,
    HideSearchBar = false,
    Acrylic = true,
    Transparency = 0.3,
    Background = "rbxassetid://135054241794297"
})

task.wait(0.3)
Window:ToggleTransparency(true)

local GameScripts = {
    {
        Name = "Fisch",
        Description = "Spectrum X - Auto Fish, Zone Fishing, Auto Sell, Auto Quest, Auto SecondSea and much more...",
        Icon = "zap",
        Color = Color3.fromRGB(255, 165, 0),
        Loadstring = "loadstring(game:HttpGet('https://raw.githubusercontent.com/NumbZer0/Spectrum-X/refs/heads/main/FischBeta.lua'))()"
    },
    {
        Name = "Volleyball Legends", 
        Description = "Spectrum X - Ball Hitbox, Premonition, Instant Rolls",
        Icon = "volleyball",
        Color = Color3.fromRGB(0, 255, 255),
        Loadstring = "loadstring(game:HttpGet('https://raw.githubusercontent.com/NumbZer0/Spectrum-X/refs/heads/main/VolleyBallLegends.lua'))()"
    },
    {
        Name = "Universal Aimbot",
        Description = "Spectrum Aim - Aimbot Universal",
        Icon = "crosshair",
        Color = Color3.fromRGB(255, 0, 0),
        Loadstring = "loadstring(game:HttpGet('https://raw.githubusercontent.com/NumbZer0/Spectrum-X/refs/heads/main/SpectrumAim.lua'))()"
    }
}

local MainSection = Window:Section({ Title = "All Hubs", Opened = true })
local GamesTab = MainSection:Tab({ Title = "Spectrum X", Icon = "library" })

GamesTab:Section({
    Title = "Supported Games",
    TextSize = 22,
    TextColor = Color3.fromRGB(220, 20, 60)
})

GamesTab:Section({
    Title = "click on the script you want to use!",
    TextSize = 14,
    TextTransparency = 0.3
})

GamesTab:Divider()

local function executarScript(scriptLoadstring, gameName)
    WindUI:Notify({
        Title = "Spectrum X",
        Content = "Starting... " .. gameName .. "...",
        Icon = "loader",
        Duration = 2
    })
    
    task.wait(1.5)
    
    local success, errorMsg = pcall(function()
        loadstring(scriptLoadstring)()
    end)
    
    if success then
        WindUI:Notify({
            Title = "Spectrum X",
            Content = gameName .. " loaded successfully!",
            Icon = "check",
            Duration = 3
        })
    else
        WindUI:Notify({
            Title = "Error",
            Content = "Failed to load " .. gameName .. "\n" .. errorMsg,
            Icon = "x",
            Duration = 5
        })
    end
end

for _, game in ipairs(GameScripts) do
    local GameSection = GamesTab:Section({
        Title = game.Name,
        Icon = game.Icon
    })
    
    GameSection:Paragraph({
        Title = game.Name,
        Desc = game.Description,
        Image = game.Icon,
        ImageSize = 20,
        Color = game.Color
    })
    
    GameSection:Button({
        Title = "Load " .. game.Name,
        Icon = "play",
        Variant = "Primary",
        Callback = function()
            executarScript(game.Loadstring, game.Name)
        end
    })
    
    GameSection:Button({
        Title = "Copy Loadstring",
        Icon = "copy",
        Variant = "Tertiary",
        Callback = function()
            setclipboard(game.Loadstring)
            WindUI:Notify({
                Title = "Copied!",
                Content = game.Name .. " loadstring copied",
                Duration = 2
            })
        end
    })
    
    GameSection:Divider()
end

local InfoSection = GamesTab:Section({
    Title = "Information",
    Icon = "info"
})

InfoSection:Paragraph({
    Title = "About Spectrum X",
    Desc = "Main hub for all Spectrum X scripts",
    Image = "crown",
    ImageSize = 18,
    Color = Color3.fromRGB(220, 20, 60)
})

InfoSection:Paragraph({
    Title = "Instructions",
    Desc = "1. Click on the desired game\n2. Wait for it to load\n3. Use the script functions!",
    Image = "book-open-text",
    ImageSize = 16
})

InfoSection:Paragraph({
    Title = "Discord:",
    Desc = "Join us to stay up to date with all the updates, or also to report bugs and ask for help if you need it.",
    Image = "sparkles",
    ImageSize = 14,
    Color = Color3.fromRGB(150, 150, 150)
})

InfoSection:Button({
    Title = "Join Discord Server",
    Icon = "fingerprint",
    Variant = "Primary",
    Callback = function()
        setclipboard("https://discord.gg/R9Cg8rgrcT")
        WindUI:Notify({
            Title = "Discord Copied",
            Content = "Discord link copied to clipboard!",
            Image = "check",
            Duration = 3
        })
    end
})

Tabs.Config:Paragraph({
    Title = "Configuration Manager",
    Desc = "Save and load your settings",
    Image = "save",
    ImageSize = 20,
    Color = "White"
})

local configName = "default"
local configFile = nil
local MyPlayerData = {
    name = "Player1",
    level = 1,
    inventory = { "sword", "shield", "potion" }
}

Tabs.Config:Input({
    Title = "Config Name",
    Value = configName,
    Callback = function(value)
        configName = value or "default"
    end
})

local ConfigManager = Window.ConfigManager
if ConfigManager then
    ConfigManager:Init(Window)
    
    Tabs.Config:Button({
        Title = "loc:SAVE_CONFIG",
        Icon = "save",
        Variant = "Primary",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            
            configFile:Register("featureToggle", featureToggle)
            configFile:Register("intensitySlider", intensitySlider)
            configFile:Register("testDropdown", testDropdown)
            configFile:Register("themeDropdown", themeDropdown)
            configFile:Register("transparencySlider", transparencySlider)
            
            configFile:Set("playerData", MyPlayerData)
            configFile:Set("lastSave", os.date("%Y-%m-%d %H:%M:%S"))
            
            if configFile:Save() then
                WindUI:Notify({ 
                    Title = "loc:SAVE_CONFIG", 
                    Content = "Saved as: "..configName,
                    Icon = "check",
                    Duration = 3
                })
            else
                WindUI:Notify({ 
                    Title = "Error", 
                    Content = "Failed to save config",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })

    Tabs.Config:Button({
        Title = "loc:LOAD_CONFIG",
        Icon = "folder",
        Callback = function()
            configFile = ConfigManager:CreateConfig(configName)
            local loadedData = configFile:Load()
            
            if loadedData then
                if loadedData.playerData then
                    MyPlayerData = loadedData.playerData
                end
                
                local lastSave = loadedData.lastSave or "Unknown"
                WindUI:Notify({ 
                    Title = "loc:LOAD_CONFIG", 
                    Content = "Loaded: "..configName.."\nLast save: "..lastSave,
                    Icon = "refresh-cw",
                    Duration = 5
                })
                
                Tabs.Config:Paragraph({
                    Title = "Player Data",
                    Desc = string.format("Name: %s\nLevel: %d\nInventory: %s", 
                        MyPlayerData.name, 
                        MyPlayerData.level, 
                        table.concat(MyPlayerData.inventory, ", "))
                })
            else
                WindUI:Notify({ 
                    Title = "Error", 
                    Content = "Failed to load config",
                    Icon = "x",
                    Duration = 3
                })
            end
        end
    })
else
    Tabs.Config:Paragraph({
        Title = "Config Manager Not Available",
        Desc = "This feature requires ConfigManager",
        Image = "alert-triangle",
        ImageSize = 20,
        Color = "White"
    })
end

Window:Section({ 
    Title = "Spectrum X it's always the best :3",
    TextSize = 12,
    TextTransparency = 0.5
})

task.wait(1)
WindUI:Notify({
    Title = "Spectrum X Loader",
    Content = "Main hub loaded successfully!",
    Icon = "rocket",
    Duration = 4
})

Window:OnClose(function()
    print("Spectrum X Loader closed")
end)

Window:OnDestroy(function()
    print("Spectrum X Loader destroyed")
end)
