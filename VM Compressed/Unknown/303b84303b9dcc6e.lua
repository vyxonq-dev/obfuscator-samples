local ArrayField = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library"))()
--Documentation url: https://docs.sirius.menu/community/arrayfield

local Window = ArrayField:CreateWindow({
        Name = "Frost’s Blox Fruits Hub💭",
        LoadingTitle = "Frost’s Hub 💭",
        LoadingSubtitle = "by FrostYT",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil, -- Create a custom folder for your hub/game
            FileName = "ArrayField"
        },
        Discord = {
            Enabled = true,
            Invite = "PcF3FWTGC9", -- The Discord invite code, do not include discord.gg/
            RememberJoins = true -- Set this to false to make them join the discord every time they load it up
        },
        KeySystem = true, -- Set this to true to use our key system
        KeySettings = {
            Title = "Frost’s Hub 💭",
            Subtitle = "Key System",
            Note = "Join the discord For Key (https://discord.gg/PcF3FWTGC9)",
            FileName = "Frost’s Hub key 🔑 ",
            SaveKey = True,
            GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like ArrayField to get the key from
            Key = {"Key972",'Key972'},
            Actions = {
                [1] = {
                    Text = 'nil',
                    OnPress = function()
                    end,
                }
            },
        }
    })
    local MainTab = Window:CreateTab("Tab Example", nil) -- Title, Image
    local MainTab2 = Window:CreateTab("Main 📝") -- Title, Image
    local MainSection = MainTab:CreateSection("Scripts 🫶",true) -- The 2nd argument is to tell if its only a Title and doesnt contain element
    MainTab:CreateSpacing(nil,10)
    local Button = MainTab:CreateButton({
        Name = "Windy-Hub Gui👀",
        Info = {
            Title = 'Windy Hub🥶',
            Description = 'Windy Hub🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ItzWindy01/WindyXBypass/main/Rewrite.lua"))() 
            print('Pressed')
        end,
    })
    MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "neva Hub👀",
        Info = {
            Title = 'neva hub 😭',
            Description = 'Neva hub🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/VEZ2/NEVAHUB/main/2'))()
        end,
  })

MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "Infinite Hub👀",
        Info = {
            Title = 'Infinite hub😭',
            Description = 'Infinite hub🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/mkhoidzvl13/Infinite-Hub/main/Infinite.txt"))()
        end,
  })

MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "Xeter Hub👀",
        Info = {
            Title = 'Xeter Hub 😭',
            Description = 'Xeter Hub🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Loader/main/Xeter.lua"))()
        end,
  })

MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "Ripper Hub👀",
        Info = {
            Title = 'Ripper Hub 😭',
            Description = 'Ripper Hub🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/hajibeza/Module/main/Mobile_Script.lua'))();
        end,
  })
