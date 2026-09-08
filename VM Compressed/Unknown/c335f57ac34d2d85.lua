local CORRECT_KEY = "4EAS-2026-TOP"
local DISCORD_LINK = "https://discord.gg/F4DQ28548"
local EnteredKey = ""

-- Key Penceresi için Fluent Yüklemesi
local FluentKey = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local KeyWindow = FluentKey:CreateWindow({
    Title = "4EAS Hub",
    SubTitle = "Key System",
    TabWidth = 140,
    Size = UDim2.fromOffset(450, 280),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local KeyTab = KeyWindow:AddTab({ Title = "Key System", Icon = "key" })

KeyTab:AddInput("KeyInput", {
    Title = "Enter Key",
    Default = "",
    Placeholder = "Key here...",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        EnteredKey = Value
    end
})

-- Verify Key (Üstte)
KeyTab:AddButton({
    Title = "Verify Key",
    Description = "Verifies the key and unlocks the menu.",
    Callback = function()
        if EnteredKey == CORRECT_KEY then
            FluentKey:Notify({
                Title = "Success",
                Content = "Key verified! Loading hub...",
                Duration = 2
            })
            
            KeyWindow:Destroy()
            task.wait(0.3)

            -- Çökmeyi önlemek için ana menüye özel temiz Fluent örneği yükleniyor
            local FluentMain = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

            local MainWindow = FluentMain:CreateWindow({
                Title = "4EAS Hub",
                SubTitle = "by lord4eas",
                TabWidth = 160,
                Size = UDim2.fromOffset(580, 460),
                Acrylic = true,
                Theme = "Dark",
                MinimizeKey = Enum.KeyCode.LeftControl
            })

            local GamesTab = MainWindow:AddTab({ Title = "GAMES", Icon = "gamepad" })

            GamesTab:AddButton({
                Title = "Muscle Legends Script",
                Description = "Loads the main Muscle Legends script.",
                Callback = function()
                    loadstring(game:HttpGet("https://pastebin.com/raw/fYQRTUVb"))()
                end
            })

            GamesTab:AddButton({
                Title = "Muscle Legends Server Hop Kill Mini",
                Description = "Loads the Server Hop Kill Mini script.",
                Callback = function()
                    loadstring(game:HttpGet("https://pastebin.com/raw/DSq015uK"))()
                end
            })

            GamesTab:AddButton({
                Title = "Murderers VS Sheriffs Duels Script",
                Description = "Loads the Murderers VS Sheriffs Duels script.",
                Callback = function()
                    loadstring(game:HttpGet("https://pastebin.com/raw/iLYhC2bK"))()
                end
            })

            GamesTab:AddButton({
                Title = "Chicken Farm Script",
                Description = "Loads the Chicken Farm script.",
                Callback = function()
                    loadstring(game:HttpGet("https://pastebin.com/raw/jfRE0HiS"))()
                end
            })

            MainWindow:SelectTab(1)
        else
            FluentKey:Notify({
                Title = "Error",
                Content = "Invalid Key! Please try again.",
                Duration = 4
            })
        end
    end
})

-- Get Key (Altta)
KeyTab:AddButton({
    Title = "Get Key",
    Description = "Copies the Discord invite link.",
    Callback = function()
        if setclipboard then
            setclipboard(DISCORD_LINK)
            FluentKey:Notify({
                Title = "Copied",
                Content = "Discord link copied to clipboard!",
                Duration = 4
            })
        else
            FluentKey:Notify({
                Title = "Error",
                Content = "Your executor does not support clipboard copying.",
                Duration = 4
            })
        end
    end
})

KeyWindow:SelectTab(1)
