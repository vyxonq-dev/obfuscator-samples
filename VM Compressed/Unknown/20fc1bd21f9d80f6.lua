local ArrayField = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library"))()
--Documentation url: https://docs.sirius.menu/community/arrayfield

local Window = ArrayField:CreateWindow({
        Name = "Frost’s Dahoodian Hub revamped💭",
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
        Name = "aura Gui👀",
        Info = {
            Title = 'aura lock + camlock 🥶',
            Description = 'This gives u a gui for dh 🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/luaarmorsystem/lua-armor-whitelisting/main/aura.cc/customer%3B-%2316229"))()
            print('Pressed')
        end,
    })
    MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "Nyula👀",
        Info = {
            Title = 'Nyula 😭',
            Description = 'This Gives u Nyula’s script🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/nyulachan/nyula/main/nyula", true))()
-- executer krampus/ro-exec
        end,
  })

MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "q tool👀",
        Info = {
            Title = 'Q tool 😭',
            Description = 'Gives u the q keybind🫣',
        },
        Interact = 'Changable',
        Callback = function()
-- 다른 스크립트 정의
local function AnotherScript()
    print(loadstring(game:HttpGet("https://pastebin.com/raw/MGFAE2uF"))())
    -- 이곳에 원하는 스크립트 코드를 추가합니다.
end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScreenGui"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local ButtonEmoji = Instance.new("TextButton")
ButtonEmoji.Name = "ButtonEmoji"
ButtonEmoji.Parent = ScreenGui
ButtonEmoji.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ButtonEmoji.Position = UDim2.new(0, 0, 0.454706937, 0)
ButtonEmoji.Size = UDim2.new(0, 90, 0, 38)
ButtonEmoji.Font = Enum.Font.SourceSans
ButtonEmoji.Text = "Q tool👑"
ButtonEmoji.TextColor3 = Color3.fromRGB(248, 248, 248)
ButtonEmoji.TextSize = 28.000
ButtonEmoji.Draggable = true

-- 마우스 클릭 및 터치 입력 이벤트 처리
ButtonEmoji.MouseButton1Click:Connect(function()
    print("😎 Button Pressed!")
    -- 😎 버튼을 클릭했을 때 다른 스크립트 실행
    AnotherScript()
end)
        end,
  })

MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "jayden cc👀",
        Info = {
            Title = 'jayden cc 😭',
            Description = 'Jayden cc🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/X3TJpNDL"))();
        end,
  })

MainTab:CreateSpacing(nil,10)
local Button = MainTab:CreateButton({
        Name = "Kirbs Ware👀",
        Info = {
            Title = 'Kirbs Ware 😭',
            Description = 'Anti Lock And aimviewer 🫣',
        },
        Interact = 'Changable',
        Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/wenny69420/KirbswareScripts/main/MobileV3'))()
        end,
  })
