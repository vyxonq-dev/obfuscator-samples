--// All Hub Loader GUI

--// by floxsfox

-- Services

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local CoreGui = game:GetService("CoreGui")

-- Destroy old gui kalau ada

if CoreGui:FindFirstChild("AllHubMenu") then

    CoreGui.AllHubMenu:Destroy()

end

-- ScreenGui

local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "AllHubMenu"

ScreenGui.Parent = CoreGui

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ScreenGui.ResetOnSpawn = false

-- Main Frame

local MainFrame = Instance.new("Frame")

MainFrame.Size = UDim2.new(0, 200, 0, 300)

MainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)

MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

MainFrame.BackgroundTransparency = 0.2

MainFrame.BorderSizePixel = 0

MainFrame.Active = true

MainFrame.Draggable = true

MainFrame.Parent = ScreenGui

-- UICorner

local Corner = Instance.new("UICorner", MainFrame)

Corner.CornerRadius = UDim.new(0, 12)

-- Title

local Title = Instance.new("TextLabel")

Title.Size = UDim2.new(1, -10, 0, 25)

Title.Position = UDim2.new(0, 5, 0, 5)

Title.BackgroundTransparency = 1

Title.Text = "menu5"

Title.TextColor3 = Color3.fromRGB(255, 255, 255)

Title.TextScaled = true

Title.Font = Enum.Font.GothamBold

Title.Parent = MainFrame

-- Credits

local Credits = Instance.new("TextLabel")

Credits.Size = UDim2.new(0, 100, 0, 15)

Credits.Position = UDim2.new(1, -105, 0, 5)

Credits.BackgroundTransparency = 1

Credits.Text = "by floxsfox"

Credits.TextColor3 = Color3.fromRGB(0, 255, 255) 

Credits.TextScaled = true

Credits.Font = Enum.Font.Gotham

Credits.Parent = MainFrame

-- Scrolling Frame

local Scroll = Instance.new("ScrollingFrame")

Scroll.Size = UDim2.new(1, -10, 1, -40)

Scroll.Position = UDim2.new(0, 5, 0, 35)

Scroll.BackgroundTransparency = 1

Scroll.BorderSizePixel = 0

Scroll.ScrollBarThickness = 4

Scroll.CanvasSize = UDim2.new(0, 0, 0, 1200) 

Scroll.Parent = MainFrame

-- UIListLayout

local Layout = Instance.new("UIListLayout")

Layout.Parent = Scroll

Layout.Padding = UDim.new(0, 4)

-- Data list script

local Scripts = {

    {"Tiger X Hub", "https://raw.githubusercontent.com/balintTheDevX/Tiger-X-V3/main/Tiger%20X%20V3.5%20Fixed", Color3.fromRGB(0,255,0)}, 

    {"Avtor Hub", "https://raw.githubusercontent.com/Avtor1zaTion/Avtor/main/AvtorHub", Color3.fromRGB(128,128,128)}, 

    {"Ghost Hub", "https://raw.githubusercontent.com/GhostPlayer352/Test4/main/GhostHub", Color3.fromRGB(255,255,255)}, 

    {"System Broken", "https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script", Color3.fromRGB(0,255,255)}, 

    {"Sans Hub", "https://raw.githubusercontent.com/DyyITT/SansMobaHub/refs/heads/main/Free-Script-SansMoba", Color3.fromRGB(0,0,255)}, 

    {"Infinite Yield", "IY", Color3.fromRGB(255,0,0)}, 

    {"Backdoor", "https://raw.githubusercontent.com/etgaby33/sb1.2.0/refs/heads/main/sb1.2.0lua.txt", Color3.fromRGB(255,0,255)}, 

    {"Wild Hub", "https://raw.githubusercontent.com/noob-scripts/some-scripts/refs/heads/master/Wild%20Hub/loader.lua", Color3.fromRGB(128,0,255)}, 

    {"Ropanel", "https://raw.githubusercontent.com/vexinity99/roblox-scripts/refs/heads/main/Ro-Panel", Color3.fromRGB(255,255,0)}, 

    {"Xelium Hub", "https://pastebin.com/raw/NGSwyg4u", Color3.fromRGB(150,100,200)}, 

    {"Auto Farming Hub", "https://pastebin.com/raw/hFfvAmKN", Color3.fromRGB(200,200,200)},

    {"Neptune Hub", "https://raw.githubusercontent.com/Clonelis/Scripts/refs/heads/main/NeptuneHub.lua", Color3.fromRGB(100,200,255)},

    {"Luasploit", "https://raw.githubusercontent.com/sdzfrgefdfrgxg/LuaSploit-Hub/refs/heads/main/LuaSploit%20Hub%20-%20Rayfield%20UI", Color3.fromRGB(200,150,255)},

    {"Paradise Hub", "https://script.fadedis.xyz/script.lua", Color3.fromRGB(255,150,150)},

    {"XVC Script Hub", "https://pastebin.com/raw/Piw5bqGq", Color3.fromRGB(150,255,150)},

    {"Vexon Hub", "https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/VexonHub", Color3.fromRGB(255,200,50)},

    {"Solara Hub", "https://pastee.dev/r/E5p31WS0", Color3.fromRGB(255,100,200)},

    {"Syrek Hub", "https://raw.githubusercontent.com/Joshingtonn123/JoshScript/refs/heads/main/SyrexUniversalHub", Color3.fromRGB(150,150,255)},

    {"Style Hub", "https://raw.githubusercontent.com/nig2aotsos/Roblox/refs/heads/main/Style-Hub(0.8)", Color3.fromRGB(255,100,100)},

    {"Polaria", "https://pastefy.app/JmaD2ivk/raw", Color3.fromRGB(0,200,200)}, 

    {"Pendulum Hub", "https://raw.githubusercontent.com/Tescalus/Pendulum-Hubs-Source/main/Pendulum%20Hub%20V5.lua", Color3.fromRGB(200,100,255)}, 

    {"Nameless", "https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source", Color3.fromRGB(255,255,100)}, 

    {"Bladeball Hub", "https://raw.githubusercontent.com/scriptshubs1/BladeBall-Script/refs/heads/main/ScriptV1", Color3.fromRGB(255,150,50)},

    {"Dragon Hub", "https://raw.githubusercontent.com/ahmadsgamer2/Dragon-Hub/main/Script-Execute.lua", Color3.fromRGB(0,200,100)},

    {"Chaos Hub", "https://rawscripts.net/raw/Brookhaven-RP-Chaos-Hub-V1-28545", Color3.fromRGB(200,50,50)}

}

-- Fungsi bikin tombol

for _, data in ipairs(Scripts) do

    local Name, URL, Color = data[1], data[2], data[3]

    local Btn = Instance.new("TextButton")

    Btn.Size = UDim2.new(1, -5, 0, 30)

    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

    Btn.Text = Name

    Btn.TextColor3 = Color

    Btn.TextScaled = true

    Btn.Font = Enum.Font.GothamBold

    Btn.Parent = Scroll

    local Corner = Instance.new("UICorner", Btn)

    Corner.CornerRadius = UDim.new(0, 8)

    Btn.MouseButton1Click:Connect(function()

        if URL == "IY" then

            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

        else

            loadstring(game:HttpGet(URL))()

        end

    end)

end