local _version = "1.6.63"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. _version .. "/main.lua"))() 

WindUI:AddTheme({
    Name = "My Theme", -- theme name
    
    -- example of gradient (available for all values. e.g. Button, Icon, Text...)   --
    Icon = WindUI:Gradient({                                                      
        ["0"] = { Color = Color3.fromHex("#ffffff"), Transparency = 0 },            
        ["100"]   = { Color = Color3.fromHex("#000000"), Transparency = 0 },        
    }, {                                                                            
        Rotation = 0,                                                               
    }),   

    Toggle = WindUI:Gradient({                                                      
        ["0"] = { Color = Color3.fromHex("#32ff00"), Transparency = 0 },           
        ["100"]   = { Color = Color3.fromHex("#eeff00"), Transparency = 0 },        
    }, {                                                                            
        Rotation = 0,                                                               
    }),

	Slider = WindUI:Gradient({                                                      
        ["0"] = { Color = Color3.fromHex("#ff0000"), Transparency = 0 },           
        ["100"]   = { Color = Color3.fromHex("#00c8ff"), Transparency = 0 },        
    }, {                                                                            
        Rotation = 0,                                                               
    }),                                                                         
    
})

local Window = WindUI:CreateWindow({
    Title = "BaeMinh Hub | TSB",
    Icon = "badge-check", -- lucide icon
    Author = "by BaeMinh_Real",
    Folder = "MySuperHub",
    
    -- ↓ This all is Optional. You can remove it.
    Background = "rbxassetid://72048146615669",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 560),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "My Theme",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.65,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("Join My Discord :3")
        end,
    },
})

Window:EditOpenButton({
    Title = "Open BaeMinh Hub",
    Icon = "file-terminal",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new( -- gradient
        Color3.fromHex("7A73A1"), 
        Color3.fromHex("44424F")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

Window:Tag({
    Title = "TSB",
    Icon = "gamepad-2",
    Color = Color3.fromHex("#8000ff"),
    Radius = 13, -- from 0 to 13
})

Window:Tag({
    Title = "v1.2.5",
    Icon = "github",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 13, -- from 0 to 13
})

Window:Tag({
    Title = "BETA",
    Icon = "code",
    Color = Color3.fromHex("#000000"),
    Radius = 13, -- from 0 to 13
})

local FPSTag = Window:Tag({
    Title = "FPS: 0",
    Color = Color3.fromRGB(100, 150, 255),
})
 
local RunService = game:GetService("RunService")
local lastUpdate = tick()
local frameCount = 0
 
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    local now = tick()
    
    if now - lastUpdate >= 1 then
        local fps = math.floor(frameCount / (now - lastUpdate))
        FPSTag:SetTitle("FPS: " .. fps)
        
        if fps >= 50 then
            FPSTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
        elseif fps >= 30 then
            FPSTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
        else
            FPSTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
        end
        
        
        frameCount = 0
        lastUpdate = now
    end
end)

local PingTag = Window:Tag({
    Title = "Ping: 0ms",
    Color = Color3.fromRGB(100, 200, 255),
})
 
task.spawn(function()
    while true do
        local success, ping = pcall(function()
            local Stats = game:GetService("Stats")
            local pingValue = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
            return math.floor(pingValue)
        end)
        
        if success and ping then
            PingTag:SetTitle("Ping: " .. ping .. "ms")
            
            if ping <= 50 then
                PingTag:SetColor(Color3.fromRGB(0, 255, 0)) -- Green
            elseif ping <= 100 then
                PingTag:SetColor(Color3.fromRGB(255, 200, 0)) -- Yellow
            elseif ping <= 200 then
                PingTag:SetColor(Color3.fromRGB(255, 150, 0)) -- Orange
            else
                PingTag:SetColor(Color3.fromRGB(255, 0, 0)) -- Red
            end
        end
        
        task.wait(2)
    end
end)

-- ===== GLOBAL STATE (DUY NHẤT) =====
local MasterEnabled = false
local CombatEnabled = false
local CamlockEnabled = false
local CurrentTarget = nil

--//Movesets
local MovesetsTab = Window:Tab({
    Title = "Movesets",
    Desc = "Only u see", -- optional
    Icon = "eye", -- lucide icon or "rbxassetid://" or URL. optional
    IconColor = Color3.fromHex("a3a3a3"), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = false, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local SaitamaSection = MovesetsTab:Section({
    Title = "Saitama",
    Desc = "Only you see", -- optional
    Icon = "rbxassetid://15114667107", -- lucide icon or "rbxassetid://". optional
    IconColor = Color3.fromRGB(255, 0, 0), -- custom icon color. optional
    TextSize = 20, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0, -- title transparency. optional
    DescTextTransparency = 0.5, -- description transparency. optional
})

local Button = SaitamaSection:Button({
    Title = "Sukuna",
    Desc = "by (idk)", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/damir512/whendoesbrickdie/main/tspno.txt",true))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Gojo",
    Desc = "by i.am.an.agent", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/KJ-The-Strongest-Battlegrounds-battleground-gojo-script-saitama-to-gojo-26980"))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Kars",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OfficialAposty/RBLX-Scripts/refs/heads/main/UltimateLifeForm.lua"))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Wally West",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Nova2ezz/west/refs/heads/main/Protected_4638864115822087.lua.txt"))()
    end
})

local Button = SaitamaSection:Button({
    Title = "MAFIOSO",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lovelymoonlight/Lovelymoonlight/refs/heads/main/Baldy%20to%20mafioso'))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Beerus",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sparksnaps/Beerus-The-Destroyer/refs/heads/main/Lua"))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Madara",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        getgenv().Cutscene = False -- //𝖲𝖤𝖳 𝖨𝖳 "𝖥𝖠𝖫𝖲𝖤" 𝖨𝖥 𝖴 𝖣𝖮𝖭'𝖳 𝖶𝖠𝖭𝖳 𝖢𝖴𝖳𝖲𝖢𝖤𝖭𝖤 𝖠𝖭𝖣 𝖨𝖥 𝖴 𝖶𝖠𝖭𝖳 "𝖳𝖱𝖴𝖤" 𝖨𝖳\

		loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/SCRIPTSBYVEUX/refs/heads/main/BoombasticLol.lua.txt"))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Golden Head",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        getgenv().stand = false --- if you want golden to be your pookie bear I mean to be your stand
		getgenv().ken = false ---set true if you want to play flappy bird 
		getgenv().Spawn = true ---set true if you want cutscenes spawn animation 
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Saitama%20to%20golden%20sigma'))() 
    end
})

local Button = SaitamaSection:Button({
    Title = "Jun",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/GoldenHeads2/f66279000c58a020e894a6db44914838/raw/62e53e1acacec0b38b43cd0f594292c32e09c39b/gistfile1.txt"))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Mahito",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        getgenv().Swordm1= true -- set true if you want have sword thing on mahito m1
		getgenv().night = false  -- set true if you want night 
		getgenv().plushie = false ---set true if you want plushie mahito 
		getgenv().blackflash = true ---set true if you want v1 truly black flash
		getgenv().chat = false ---set true if you visual to other pov that your mahito
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Kenjihin69/Kenjihin69/refs/heads/main/Mahito%20v2%20sigma%20tp%20exploit'))()
    end
})

local Button = SaitamaSection:Button({
    Title = "Naruto",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LolnotaKid/NarutoBeatUpSasukeAss/refs/heads/main/NarutoCums"))()
    end
})

local GarouSection = MovesetsTab:Section({
    Title = "Garou",
    Desc = "Only you see", -- optional
    Icon = "rbxassetid://15124465439", -- lucide icon or "rbxassetid://". optional
    IconColor = Color3.fromRGB(0, 255, 255), -- custom icon color. optional
    TextSize = 20, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0, -- title transparency. optional
    DescTextTransparency = 0.5, -- description transparency. optional
})

local Button = GarouSection:Button({
    Title = "Gabriel",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/damir512/youinsinificants/main/insignificantFuck.txt",true))()
    end
})

local Button = GarouSection:Button({
    Title = "Void Garou",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Void%20Reaper%20Obfuscated.txt"))()
    end
})

local Button = GarouSection:Button({
    Title = "Mastery Deku",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/xKextYP5"))()
    end
})

local Button = GarouSection:Button({
    Title = "SONIC.EXE",
    Desc = "by GoldenHead", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/4zLt8a2P/raw"))()
    end
})
--//Help: Tech and Tool
local MainTab = Window:Tab({
    Title = "Main",
    Desc = "Have you in PvP", -- optional
    Icon = "heart-handshake", -- lucide icon or "rbxassetid://" or URL. optional
    IconColor = Color3.fromHex("#00ffee"), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = false, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local TechSection = MainTab:Section({
    Title = "Tech",
    Desc = "Tech will have you cool in PvP", -- optional
    Icon = "star", -- lucide icon or "rbxassetid://". optional
    IconColor = Color3.fromRGB(235, 255, 0), -- custom icon color. optional
    TextSize = 20, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0.05, -- title transparency. optional
    DescTextTransparency = 0.4, -- description transparency. optional
})

local Button = TechSection:Button({
    Title = "Surfing Tech",
    Desc = "by Notpaki", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/GarouSurfingTech/refs/heads/main/Protected_2674673126232747.lua"))()
    end
})

local Button = TechSection:Button({
    Title = "Lethal Revamp",
    Desc = "by Notpaki",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/InstantLethalRevamp/refs/heads/main/Protected_6977817281150270.lua"))()
    end
})

local Button = TechSection:Button({
    Title = "Reflex Tech",
    Desc = "by Notpaki",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/ReflexTech/refs/heads/main/Protected_7459802026542834.lua"))()
    end
})

local Paragraph = TechSection:Paragraph({
    Title = "PC user:",
    Desc = "M1 Reset: R\nEmote Dash: T\nRotation: H\n\nby mvp_kfc",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "app-window",
            Title = "M1 Reset",
            Callback = function()
				getgenv().keybinds = {
					m1reset = Enum.KeyCode.R,  -- M1 Reset 
					emotedash = Enum.KeyCode.T, -- Emote Dash
					rotation = Enum.KeyCode.H   -- Auto Rotation
				}
				
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Slaphello/M1-Reset-And-Emote-Dash-TSB-OLD-/refs/heads/main/M1R%26ED%20TSB"))() 
			end,
        }
    }
})

local Paragraph = TechSection:Paragraph({
    Title = "PC user:",
    Desc = "V to select player\nC to use side dash assit\nRightAlt to on/off UI\nby Nopaki",
    Image = "",
    ImageSize = 30,
    Thumbnail = "",
    ThumbnailSize = 80,
    Locked = false,
    Buttons = {
        {
            Icon = "app-window",
            Title = "Side Dash",
            Callback = function()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/FakeDash/refs/heads/main/Protected_5833389828844912.lua"))()
			end,
        }
    }
})

local Button = TechSection:Button({
    Title = "Oreo Tech",
    Desc = "by Notpaki",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/OreoTech/refs/heads/main/Protected_6856895483929371.lua"))()
    end
})

local Button = TechSection:Button({
    Title = "Lethal Dash",
    Desc = "by Notpaki",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/InstantLethal/refs/heads/main/Protected_5983112998592296.lua"))()
    end
})

local Button = TechSection:Button({
    Title = "Instant Twisted",
    Desc = "by Notpaki",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/InstantTwistedRevamp/refs/heads/main/Protected_7455521176683315.lua"))()
    end
})

local Button = TechSection:Button({
    Title = "SUPA v3",
    Desc = "by Merebennie",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://api.getpolsec.com/scripts/hosted/ea0b7cbd8c395e01ec38271794b2559808d26501bd6e6e30c48660759a7db7b3.lua"))()
    end
})

local Button = TechSection:Button({
    Title = "Kiba",
    Desc = "by (idk)",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/kietsonphongthanhnghia-a11y/Uhyeah/refs/heads/main/Protected_1425045629292384.lua.txt"))()
    end
})

local Button = TechSection:Button({
    Title = "Auto Kyoto",
    Desc = "by Notpaki",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyborg883/KyotoTechRework/refs/heads/main/Protected_9378660372508532.lua"))()
    end
})

local ToolsSection = MainTab:Section({
    Title = "Tools",
    Desc = "Tools will have you in PvP", -- optional
    Icon = "crosshair", -- lucide icon or "rbxassetid://". optional
    IconColor = Color3.fromRGB(235, 255, 0), -- custom icon color. optional
    TextSize = 20, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0.05, -- title transparency. optional
    DescTextTransparency = 0.4, -- description transparency. optional
})

local AIMGroup = ToolsSection:Group({})

--==============================
-- AIM GROUP TOGGLES (WindUI 1.6.3)
--==============================

AIMGroup:Toggle({
    Title = "Silent Aim",
    Desc = "Select nearest player",
    Icon = "power", -- lucide icon or "rbxassetid://". optional
    Value = false, -- initial state. optional
    Type = "Toggle", -- "Toggle" or "Checkbox". optional
    Color = Color3.fromRGB(100, 200, 100), -- custom color. optional
    Locked = false, -- disable toggle. optional
    Flag = "my_toggle", -- for config saving. optional
    Callback = function(state)
        MasterEnabled = state

        if state then
            CreateFloatingToggle()
        else
            DestroyFloatingToggle()
            CombatEnabled = false
            CurrentTarget = nil
            ClearAura()
            ClearTracer()
        end
    end
})

AIMGroup:Toggle({
    Title = "Cam Lock",
    Desc = "Select nearest player",
    Icon = "power", -- lucide icon or "rbxassetid://". optional
    Value = false, -- initial state. optional
    Type = "Toggle", -- "Toggle" or "Checkbox". optional
    Color = Color3.fromRGB(100, 200, 100), -- custom color. optional
    Locked = false, -- disable toggle. optional
    Flag = "my_toggle", -- for config saving. optional
    Callback = function(state)
        MasterEnabled = state

        if state then
            CreateCamlockUI()
        else
            DestroyCamlockUI()

            CamlockEnabled = false
            CamlockTarget = nil
            CamRemoveAura()
        end
    end
})

--==============================
-- SILENT AIM (NO CAM LOCK)
--==============================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Aura = nil
local LOCK_DISTANCE = 80

local TracerBeam
local TracerA0
local TracerA1

-- Aura
local function CreateAura(char)
    if Aura then Aura:Destroy() end
    Aura = Instance.new("Highlight")
    Aura.Name = "SilentAimAura"
    Aura.FillColor = Color3.fromRGB(0,255,100)
    Aura.OutlineColor = Color3.fromRGB(255,255,255)
    Aura.FillTransparency = 0.5
    Aura.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    Aura.Parent = char
end

local function ClearAura()
    if Aura then
        Aura:Destroy()
        Aura = nil
    end
end

-- Nearest player
local function GetNearestPlayer()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end

    local root = char.HumanoidRootPart
    local nearest, dist = nil, LOCK_DISTANCE

    for _,plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character then
            local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
            local hum = plr.Character:FindFirstChild("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local d = (hrp.Position - root.Position).Magnitude
                if d < dist then
                    dist = d
                    nearest = plr
                end
            end
        end
    end

    return nearest
end

local function CreateTracer(myChar, targetChar)
    if TracerBeam then TracerBeam:Destroy() end

    local myHRP = myChar:FindFirstChild("HumanoidRootPart")
    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not myHRP or not targetHRP then return end

    TracerA0 = Instance.new("Attachment")
    TracerA0.Name = "TracerA0"
    TracerA0.Parent = myHRP

    TracerA1 = Instance.new("Attachment")
    TracerA1.Name = "TracerA1"
    TracerA1.Parent = targetHRP

    TracerBeam = Instance.new("Beam")
    TracerBeam.Name = "SilentAimTracer"
    TracerBeam.Attachment0 = TracerA0
    TracerBeam.Attachment1 = TracerA1
    TracerBeam.FaceCamera = true
    TracerBeam.Width0 = 0.15
    TracerBeam.Width1 = 0.15
    TracerBeam.LightEmission = 1
    TracerBeam.Transparency = NumberSequence.new(0.1)
    TracerBeam.Color = ColorSequence.new(Color3.fromRGB(0,255,100))
    TracerBeam.Parent = myHRP
end

local function ClearTracer()
    if TracerBeam then TracerBeam:Destroy() end
    if TracerA0 then TracerA0:Destroy() end
    if TracerA1 then TracerA1:Destroy() end
    TracerBeam = nil
    TracerA0 = nil
    TracerA1 = nil
end

-- Main loop
RunService.RenderStepped:Connect(function()
    if not (MasterEnabled and CombatEnabled) then return end

    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end

    if not CurrentTarget
        or not CurrentTarget.Character
        or not CurrentTarget.Character:FindFirstChild("Humanoid")
        or CurrentTarget.Character.Humanoid.Health <= 0
    then
        ClearAura()
        ClearTracer()
        CurrentTarget = GetNearestPlayer()
        if CurrentTarget and CurrentTarget.Character then
            CreateAura(CurrentTarget.Character)
            CreateTracer(char, CurrentTarget.Character)
        end
        return
    end

    local targetHRP = CurrentTarget.Character:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end

    -- ONLY ROTATE CHARACTER (NO CAMERA)
    char.HumanoidRootPart.CFrame = CFrame.new(
        char.HumanoidRootPart.Position,
        Vector3.new(
            targetHRP.Position.X,
            char.HumanoidRootPart.Position.Y,
            targetHRP.Position.Z
        )
    )
end)

--==============================
-- SILENT AIM FLOATING UI (1:1 STYLE)
--==============================
local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer

local FloatingGui
local Root
local ToggleCircle
local Bubble

local dragging = false
local dragStart, startPos

function CreateFloatingToggle()
    if FloatingGui then return end

    FloatingGui = Instance.new("ScreenGui")
    FloatingGui.Name = "SilentAimFloating"
    FloatingGui.IgnoreGuiInset = true
    FloatingGui.ResetOnSpawn = false
    FloatingGui.Parent = player.PlayerGui

    -- ROOT PILL
    Root = Instance.new("Frame")
    Root.Size = UDim2.fromOffset(240, 46)
    Root.Position = UDim2.new(0.5, -120, 0.15, 0)
    Root.BackgroundColor3 = Color3.fromRGB(65,65,65)
    Root.BackgroundTransparency = 0.15
    Root.Parent = FloatingGui
    Instance.new("UICorner", Root).CornerRadius = UDim.new(1,0)

    -- TEXT
    local text = Instance.new("TextLabel")
    text.Size = UDim2.new(1, -70, 1, 0)
    text.Position = UDim2.new(0, 20, 0, 0)
    text.BackgroundTransparency = 1
    text.Text = "Silent Aim"
    text.Font = Enum.Font.GothamMedium
    text.TextSize = 16
    text.TextXAlignment = Enum.TextXAlignment.Left
    text.TextColor3 = Color3.fromRGB(230,230,230)
    text.Parent = Root

    -- TOGGLE CIRCLE (RIGHT)
    ToggleCircle = Instance.new("Frame")
    ToggleCircle.Size = UDim2.fromOffset(28,28)
    ToggleCircle.Position = UDim2.new(1, -38, 0.5, -14)
    ToggleCircle.BackgroundColor3 = Color3.fromRGB(140,140,140)
    ToggleCircle.Parent = Root
    Instance.new("UICorner", ToggleCircle).CornerRadius = UDim.new(1,0)

    -- BUBBLE ON/OFF
    Bubble = Instance.new("TextLabel")
    Bubble.Size = UDim2.fromOffset(40,22)
    Bubble.Position = UDim2.new(1, -42, 1, 4)
    Bubble.BackgroundColor3 = Color3.fromRGB(55,55,55)
    Bubble.Text = "OFF"
    Bubble.TextColor3 = Color3.fromRGB(230,230,230)
    Bubble.Font = Enum.Font.GothamBold
    Bubble.TextSize = 13
    Bubble.Parent = Root
    Instance.new("UICorner", Bubble).CornerRadius = UDim.new(1,0)

    -- INPUT (DRAG)
    Root.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
        or i.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = i.Position
            startPos = Root.Position
        end
    end)

    Root.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
        or i.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)

    UIS.InputChanged:Connect(function(i)
        if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement
        or i.UserInputType == Enum.UserInputType.Touch) then
            local delta = i.Position - dragStart
            Root.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)

    -- TOGGLE LOGIC
    Root.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1
        or i.UserInputType == Enum.UserInputType.Touch then

            CombatEnabled = not CombatEnabled

            if CombatEnabled then
                ToggleCircle.BackgroundColor3 = Color3.fromRGB(90,220,120)
                Bubble.Text = "ON"
            else
                ToggleCircle.BackgroundColor3 = Color3.fromRGB(140,140,140)
                Bubble.Text = "OFF"
                CurrentTarget = nil
                ClearAura()
                ClearTracer()
            end
        end
    end)
end

function DestroyFloatingToggle()
    if FloatingGui then
        FloatingGui:Destroy()
        FloatingGui = nil
    end
end

--==============================
-- CAM LOCK (FIXED VERSION)
--==============================

local CamlockTarget = nil

local CamGui
local CamRoot
local CamToggleCircle
local CamBubble

local CamLOCK_DISTANCE = 120
local CamPREDICTION = 0.12
local CamSMOOTHNESS = 0.18

local Camera = workspace.CurrentCamera
local CamLastValid = 0
local CamGrace = 0.25

--==============================
-- FIND TARGET
--==============================
local function CamIsValid(plr)
	if not plr or not plr.Character then return false end

	local hum = plr.Character:FindFirstChildOfClass("Humanoid")
	local hrp = plr.Character:FindFirstChild("HumanoidRootPart")

	if not hum or not hrp then return false end
	if hum.Health <= 0 then return false end

	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return false end

	local dist = (hrp.Position - myChar.HumanoidRootPart.Position).Magnitude
	return dist <= CamLOCK_DISTANCE
end

local function CamFindTarget()
	local myChar = LocalPlayer.Character
	if not myChar or not myChar:FindFirstChild("HumanoidRootPart") then return nil end

	local root = myChar.HumanoidRootPart
	local nearest, bestDist = nil, CamLOCK_DISTANCE

	for _,plr in ipairs(Players:GetPlayers()) do
		if plr ~= LocalPlayer and plr.Character then
			local hum = plr.Character:FindFirstChildOfClass("Humanoid")
			local hrp = plr.Character:FindFirstChild("HumanoidRootPart")

			if hum and hrp and hum.Health > 0 then
				local d = (hrp.Position - root.Position).Magnitude
				if d < bestDist then
					bestDist = d
					nearest = plr
				end
			end
		end
	end

	return nearest
end

--==============================
-- CAMLOCK AURA
--==============================

local CamHighlight = Instance.new("Highlight")
CamHighlight.FillColor = Color3.fromRGB(255, 80, 80)
CamHighlight.OutlineColor = Color3.fromRGB(255,255,255)
CamHighlight.FillTransparency = 0.6
CamHighlight.OutlineTransparency = 0.2
CamHighlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
CamHighlight.Enabled = false
CamHighlight.Parent = game:GetService("CoreGui")

local function CamAttachAura(plr)
	if plr and plr.Character then
		CamHighlight.Adornee = plr.Character
		CamHighlight.Enabled = true
	end
end

local function CamRemoveAura()
	CamHighlight.Enabled = false
	CamHighlight.Adornee = nil
end

--==============================
-- CAMLOCK LOOP
--==============================
RunService.RenderStepped:Connect(function()
	if not (MasterEnabled and CamlockEnabled) then
		CamRemoveAura()
		return
	end

	if not CamIsValid(CamlockTarget) then
		if tick() - CamLastValid < CamGrace then
			return
		end

		CamlockTarget = CamFindTarget()
		if not CamlockTarget then
			CamRemoveAura()
			return
		end

		CamAttachAura(CamlockTarget)
	end

	CamLastValid = tick()

	local hrp = CamlockTarget.Character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local predicted = hrp.Position + (hrp.AssemblyLinearVelocity * CamPREDICTION)

	local currentCF = Camera.CFrame
	local targetCF = CFrame.new(currentCF.Position, predicted)

	Camera.CFrame = currentCF:Lerp(targetCF, CamSMOOTHNESS)
end)

--==============================
-- FLOATING CAMLOCK UI
--==============================
local FloatingGui
local Root
local ToggleCircle
local Bubble

local dragging = false
local dragStart, startPos

function CreateCamlockUI()
	if CamGui then return end

	CamGui = Instance.new("ScreenGui")
	CamGui.Name = "CamLockFloating"
	CamGui.IgnoreGuiInset = true
	CamGui.ResetOnSpawn = false
	CamGui.Parent = LocalPlayer.PlayerGui

	CamRoot = Instance.new("Frame")
	CamRoot.Size = UDim2.fromOffset(240, 46)
	CamRoot.Position = UDim2.new(0.5, -120, 0.25, 0)
	CamRoot.BackgroundColor3 = Color3.fromRGB(65,65,65)
	CamRoot.BackgroundTransparency = 0.15
	CamRoot.Parent = CamGui
	Instance.new("UICorner", CamRoot).CornerRadius = UDim.new(1,0)

	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, -70, 1, 0)
	text.Position = UDim2.new(0, 20, 0, 0)
	text.BackgroundTransparency = 1
	text.Text = "Cam Lock"
	text.Font = Enum.Font.GothamMedium
	text.TextSize = 16
	text.TextXAlignment = Enum.TextXAlignment.Left
	text.TextColor3 = Color3.fromRGB(230,230,230)
	text.Parent = CamRoot

	CamToggleCircle = Instance.new("Frame")
	CamToggleCircle.Size = UDim2.fromOffset(28,28)
	CamToggleCircle.Position = UDim2.new(1, -38, 0.5, -14)
	CamToggleCircle.BackgroundColor3 = Color3.fromRGB(140,140,140)
	CamToggleCircle.Parent = CamRoot
	Instance.new("UICorner", CamToggleCircle).CornerRadius = UDim.new(1,0)

	CamBubble = Instance.new("TextLabel")
	CamBubble.Size = UDim2.fromOffset(40,22)
	CamBubble.Position = UDim2.new(1, -42, 1, 4)
	CamBubble.BackgroundColor3 = Color3.fromRGB(55,55,55)
	CamBubble.Text = "OFF"
	CamBubble.TextColor3 = Color3.fromRGB(230,230,230)
	CamBubble.Font = Enum.Font.GothamBold
	CamBubble.TextSize = 13
	CamBubble.Parent = CamRoot
	Instance.new("UICorner", CamBubble).CornerRadius = UDim.new(1,0)

	--==============================
	-- DRAG SYSTEM (PC + MOBILE)
	--==============================
	local dragging = false
	local dragStart
	local startPos

	CamRoot.InputBegan:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1
		or i.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = i.Position
			startPos = CamRoot.Position
		end
	end)

	CamRoot.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1
		or i.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	UIS.InputChanged:Connect(function(i)
		if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement
		or i.UserInputType == Enum.UserInputType.Touch) then
			local delta = i.Position - dragStart
			CamRoot.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	--==============================
	-- TOGGLE
	--==============================
	CamRoot.InputEnded:Connect(function(i)
		if i.UserInputType == Enum.UserInputType.MouseButton1
		or i.UserInputType == Enum.UserInputType.Touch then

			CamlockEnabled = not CamlockEnabled

			if CamlockEnabled then
				CamToggleCircle.BackgroundColor3 = Color3.fromRGB(90,220,120)
				CamBubble.Text = "ON"
			else
				CamToggleCircle.BackgroundColor3 = Color3.fromRGB(140,140,140)
				CamBubble.Text = "OFF"
				CamlockTarget = nil
				CamRemoveAura()
			end
		end
	end)
end

function DestroyCamlockUI()
	if CamGui then
		CamGui:Destroy()
		CamGui = nil
	end
end

ToolsSection:Divider()

local Button = ToolsSection:Button({
    Title = "Trash-can man",
    Desc = "Use Saitama if u want ULT",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yes1nt/yes/refs/heads/main/Trashcan%20Man",true))()
    end
})

local Button = ToolsSection:Button({
    Title = "Hitbox expander",
    Desc = "Use Deady Ninja for auto load after die",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-SION-ELTNAM-ATLASIA-61168"))()
    end
})

-- ================= SERVICES =================
local asd = game:GetService("RunService")
local qwe = game:GetService("Players").LocalPlayer
local zxc = game:GetService("UserInputService")

-- ================= UI =================
local ppp = Instance.new("ScreenGui")
ppp.Name = "InvisibleSemiGodmodeGUI"
ppp.ResetOnSpawn = false
ppp.Parent = qwe:WaitForChild("PlayerGui")

local mmm = Instance.new("Frame")
mmm.Size = UDim2.new(0, 300, 0, 150)
mmm.Position = UDim2.new(0.5, -150, 0.4, -75)
mmm.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mmm.BorderSizePixel = 0
mmm.AnchorPoint = Vector2.new(0.5, 0.5)
mmm.Parent = ppp
mmm.ClipsDescendants = true
mmm.BackgroundTransparency = 0.15
mmm.AutoLocalize = false
mmm.Name = "MainFrame"
mmm.Active = true
mmm.Draggable = true
mmm.Visible = false

local uuu = Instance.new("UICorner")
uuu.CornerRadius = UDim.new(0, 12)
uuu.Parent = mmm

local ttt = Instance.new("TextLabel")
ttt.Size = UDim2.new(1, 0, 0, 40)
ttt.BackgroundTransparency = 1
ttt.Text = "BaeMinhReal - Semi Godmode"
ttt.TextXAlignment = Enum.TextXAlignment.Center
ttt.TextYAlignment = Enum.TextYAlignment.Center
ttt.TextStrokeTransparency = 0.6
ttt.Font = Enum.Font.GothamBold
ttt.TextSize = 24
ttt.TextColor3 = Color3.fromRGB(255, 255, 255)
ttt.Parent = mmm

local bbb = Instance.new("TextButton")
bbb.Size = UDim2.new(0, 120, 0, 40)
bbb.Position = UDim2.new(0.5, -60, 0, 60)
bbb.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
bbb.BorderSizePixel = 0
bbb.Font = Enum.Font.GothamSemibold
bbb.TextSize = 20
bbb.TextColor3 = Color3.fromRGB(255, 255, 255)
bbb.Text = "Off"
bbb.AutoButtonColor = false
bbb.Parent = mmm

local ccc = Instance.new("UICorner")
ccc.CornerRadius = UDim.new(0, 8)
ccc.Parent = bbb

-- ================= LOGIC (GIỮ NGUYÊN) =================
local hhh = false
local iii = "rbxassetid://136370737633649"
local jjj = nil
local kkk = nil
local lll = qwe.Character or qwe.CharacterAdded:Wait()
local nnn = lll:WaitForChild("Humanoid")

local function ooo()
    if not kkk then return end
    if not jjj or not jjj.IsPlaying then
        local rrr = Instance.new("Animation")
        rrr.AnimationId = iii
        jjj = kkk:LoadAnimation(rrr)
        jjj:Play()
        jjj.TimePosition = 4.56
        jjj:AdjustSpeed(0)
    end
end

local function sss()
    if jjj and jjj.IsPlaying then
        jjj:Stop()
        jjj = nil
    end
end

local function vvv(qqq)
    lll = qqq
    nnn = qqq:WaitForChild("Humanoid")
    kkk = nnn:FindFirstChildOfClass("Animator")
    if hhh then
        ooo()
    end
end

kkk = nnn:FindFirstChildOfClass("Animator")
qwe.CharacterAdded:Connect(vvv)

local www
local function xxx()
    hhh = not hhh

    if hhh then
        ooo()
        bbb.Text = "On"
        bbb.BackgroundColor3 = Color3.fromRGB(0, 170, 255)

        if www then www:Disconnect() end
        www = asd.Heartbeat:Connect(function()
            if lll and lll:FindFirstChild("HumanoidRootPart") then
                local yyy = lll.HumanoidRootPart
                local zzz = yyy.CFrame
                yyy.CFrame = zzz * CFrame.new(0, -6, 0)
                asd.RenderStepped:Wait()
                yyy.CFrame = zzz
            end
        end)
    else
        sss()
        bbb.Text = "Off"
        bbb.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        if www then
            www:Disconnect()
            www = nil
        end
    end
end

bbb.MouseButton1Click:Connect(xxx)

-- ================= KHÓA PHÍM Q THEO UI =================
local uiEnabled = false

zxc.InputBegan:Connect(function(input, gp)
    if gp then return end
    if not uiEnabled then return end -- UI chưa bật → bỏ qua Q

    if input.KeyCode == Enum.KeyCode.Q then
        xxx()
    end
end)

asd.Heartbeat:Connect(function()
    if hhh then
        ooo()
    end
end)

asd.RenderStepped:Connect(function()
    if hhh and jjj and jjj.IsPlaying then
        sss()
    end
end)

-- ================= WINDUI (CHỈ UI) =================
ToolsSection:Toggle({
    Title = "Semi-godmode UI",
    Desc = "Mở / tắt giao diện Semi-godmode",
    Icon = "layout-dashboard",
    Default = false,
    Flag = "semi_godmode_ui",

    Callback = function(state)
        uiEnabled = state
        mmm.Visible = state

        -- UI TẮT → ÉP TẮT SEMI-GODMODE
        if not state and hhh then
            xxx()
        end
    end
})

ToolsSection:Button({
    Title = "Open UI Fling Player",
    Desc = "by BaeMinhReal", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/ngm2807-sudo/7155874edfab6e1d774d5017ea0b3018/raw/32e909c874a9a5192fd52fd5afe4579e1c74cdb9/flingplayer.lua"))()
    end
})

--==================================================
-- UI SECTION
--==================================================
local AutoKillSection = MainTab:Section({
	Title = "Auto Kill",
	Desc = "Kill Player Select",
	Icon = "skull",
    TextSize = 20, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0, -- title transparency. optional
    DescTextTransparency = 0.5, -- description transparency. optional
})

--==================================================
-- SERVICES
--==================================================
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

--==================================================
-- PLAYER
--==================================================
local player = Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local hrp = char:WaitForChild("HumanoidRootPart")

player.CharacterAdded:Connect(function(newChar)
	char = newChar
	hrp = char:WaitForChild("HumanoidRootPart")
end)

--==================================================
-- STATE
--==================================================
local targetPlayer = nil
local killEnabled = false
local orbitEnabled = false
local nameInput = ""

--==================================================
-- AURA
--==================================================
local currentHighlight
local auraConn
local targetCharConn

local function applyAura(plr)
	if auraConn then auraConn:Disconnect() auraConn = nil end
	if targetCharConn then targetCharConn:Disconnect() targetCharConn = nil end
	if currentHighlight then currentHighlight:Destroy() currentHighlight = nil end
	if not plr then return end

	local function attach(char)
		if not killEnabled then return end

		local hl = Instance.new("Highlight")
		hl.Adornee = char
		hl.Parent = char
		hl.FillTransparency = 0.35
		hl.OutlineTransparency = 0
		hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		currentHighlight = hl

		auraConn = RunService.RenderStepped:Connect(function()
			local h = (tick() * 0.6) % 1
			local c = Color3.fromHSV(h, 1, 1)
			hl.FillColor = c
			hl.OutlineColor = c
		end)
	end

	if plr.Character then
		attach(plr.Character)
	end

	targetCharConn = plr.CharacterAdded:Connect(function(char)
		if plr == targetPlayer then
			attach(char)
		end
	end)
end

--==================================================
-- CAMERA
--==================================================
local cam = workspace.CurrentCamera
local camConn

local function setCameraTarget(plr)
	if camConn then camConn:Disconnect() camConn = nil end
	if not plr then return end

	local function hook(char)
		if not killEnabled then return end
		local hum = char:WaitForChild("Humanoid", 5)
		if hum then
			cam.CameraSubject = hum
		end
	end

	if plr.Character then
		hook(plr.Character)
	end

	camConn = plr.CharacterAdded:Connect(function(char)
		if plr == targetPlayer and killEnabled then
			hook(char)
		end
	end)
end

local function resetCamera()
	if camConn then camConn:Disconnect() camConn = nil end
	if player.Character then
		cam.CameraSubject = player.Character:WaitForChild("Humanoid")
	end
end

--==================================================
-- NEAREST PLAYER
--==================================================
local function getNearestPlayer()
	local nearest
	local minDist = math.huge

	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= player and plr.Character then
			local hrp2 = plr.Character:FindFirstChild("HumanoidRootPart")
			local hum = plr.Character:FindFirstChildOfClass("Humanoid")

			if hrp2 and hum and hum.Health > 0 then
				local dist = (hrp.Position - hrp2.Position).Magnitude
				if dist < minDist then
					minDist = dist
					nearest = plr
				end
			end
		end
	end

	return nearest
end

--==================================================
-- TARGET UPDATE
--==================================================
local function updateTarget()
	-- ===== MODE: USERNAME =====
	if nameInput ~= "" then
		local plr = Players:FindFirstChild(nameInput)
		if not plr then return end -- player rời server

		targetPlayer = plr

		-- nếu đã bật thì apply lại
		if killEnabled then
			applyAura(targetPlayer)
			setCameraTarget(targetPlayer)
		end
		return
	end

	-- ===== MODE: NEAREST =====
	local newTarget = getNearestPlayer()

	if newTarget ~= targetPlayer then
		if auraConn then auraConn:Disconnect() auraConn = nil end
		if targetCharConn then targetCharConn:Disconnect() targetCharConn = nil end
		if currentHighlight then currentHighlight:Destroy() currentHighlight = nil end

		targetPlayer = newTarget

		if killEnabled and targetPlayer then
			applyAura(targetPlayer)
			setCameraTarget(targetPlayer)
		end
	end
end

--==================================================
-- ORBIT
--==================================================
local radius = 5.5
local heightMin = -1.5
local heightMax = 2
local teleportSpeed = 2

local function randomOffset()
	local dir = Vector3.new(
		math.random(-100,100),
		0,
		math.random(-100,100)
	).Unit

	local height = math.random() * (heightMax - heightMin) + heightMin
	return dir * radius + Vector3.new(0, height, 0)
end

RunService.RenderStepped:Connect(function()
	if not orbitEnabled or not targetPlayer or not targetPlayer.Character then return end

	local root = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	local hum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
	if not root or not hum or hum.Health <= 0 then return end

	for _ = 1, teleportSpeed do
		hrp.CFrame = CFrame.new(root.Position + randomOffset(), root.Position)
	end
end)

--==================================================
-- INPUT
--==================================================
local function tapKey(key, delay)
	VirtualInputManager:SendKeyEvent(true, key, false, game)
	task.wait(delay or 0.05)
	VirtualInputManager:SendKeyEvent(false, key, false, game)
end

--==================================================
-- AUTO KILL LOOP
--==================================================
task.spawn(function()
	while task.wait(0.1) do
		if not killEnabled or not targetPlayer or not targetPlayer.Character then continue end

		local thrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
		local thum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
		local comm = char and char:FindFirstChild("Communicate")

		if not hrp or not thrp or not thum or not comm then continue end

		if thum.Health <= 0 then
			if thum.Health <= 0 then
				-- username mode: chờ respawn
				if nameInput ~= "" then
					repeat task.wait(0.3) until
						not killEnabled
						or (targetPlayer.Character
						and targetPlayer.Character:FindFirstChildOfClass("Humanoid")
						and targetPlayer.Character.Humanoid.Health > 0)
				else
					-- nearest mode
					targetPlayer = nil
					updateTarget()
				end
				continue
			end
		end

		if (hrp.Position - thrp.Position).Magnitude > 6 then continue end

		comm:FireServer({ Goal = "LeftClick", Mobile = true })
		task.wait(0.15)

		tapKey(Enum.KeyCode.Q, 0.1)
		tapKey(Enum.KeyCode.One)
		tapKey(Enum.KeyCode.Two)
		tapKey(Enum.KeyCode.Three)
		tapKey(Enum.KeyCode.Four)

		task.wait(0.15)

		tapKey(Enum.KeyCode.G, 0.15)
		tapKey(({Enum.KeyCode.One,Enum.KeyCode.Two,Enum.KeyCode.Three,Enum.KeyCode.Four})[math.random(1,4)])
	end
end)

RunService.Heartbeat:Connect(function()
	if not killEnabled then return end
	if nameInput ~= "" then return end -- ❗ username thì KHÔNG auto đổi

	if not targetPlayer then
		updateTarget()
		return
	end

	if not targetPlayer.Character then
		targetPlayer = nil
		updateTarget()
		return
	end

	local hum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
	if not hum or hum.Health <= 0 then
		targetPlayer = nil
		updateTarget()
	end
end)
--==================================================
-- UI INPUT + TOGGLE
--==================================================
AutoKillSection:Input({
	Title = "Enter username to kill",
	Desc = "No username = nearest",
	Icon = "skull", -- lucide icon or "rbxassetid://". optional
	Placeholder = "Enter username...",
	Callback = function(text)
		nameInput = text
	end
})

AutoKillSection:Toggle({
	Title = "Auto Kill",
	Desc = "Kill player selected", -- optional
	Default = false,
	Callback = function(state)
		killEnabled = state
		orbitEnabled = state

		if state then
			updateTarget()
		else
			if auraConn then auraConn:Disconnect() auraConn = nil end
			if targetCharConn then targetCharConn:Disconnect() targetCharConn = nil end
			if currentHighlight then currentHighlight:Destroy() currentHighlight = nil end
			resetCamera()
			targetPlayer = nil
		end
	end
})

--//Info
local InfoTab = Window:Tab({
    Title = "Info",
    Desc = "Info of script!", -- optional
    Icon = "info", -- lucide icon or "rbxassetid://" or URL. optional
    IconColor = Color3.fromRGB(0, 0, 0), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = false, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

InfoTab:Paragraph({
    Title = "Server Discord",
    Desc = "join our server discord to get more info",
    Image = "info",
    ImageSize = 50,
    Thumbnail = "rbxassetid://89219114409901",
    ThumbnailSize = 280,
    Color = Color3.fromRGB(88, 101, 242),
    Buttons = {
        {
            Title = "Copy Link",
            Icon = "link",
            Callback = function()
                setclipboard("https://discord.gg/vtcTrc8gKv")
            end
        }
    }
})

local Paragraph = InfoTab:Paragraph({
    Title = "UPDATE SCRIPT:",
    Color = "White",
    Desc = "[+] Fixed CamLock\n[+] Added Fling Player\n[+] Added Number Hardtekk(music)\n[+] Remove Sleeping City Funk(music)",
})

local PlayerTab = Window:Tab({
    Title = "Player",
    Desc = "Help you have best experience", -- optional
    Icon = "circle-user", -- lucide icon or "rbxassetid://" or URL. optional
    IconColor = Color3.fromRGB(10, 70, 250), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = false, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local BoomboxSection = PlayerTab:Section({
    Title = "Boombox",
    Desc = "Help you have best experience", -- optional
    Icon = "music", -- lucide icon or "rbxassetid://". optional
    TextSize = 20, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0, -- title transparency. optional
    DescTextTransparency = 0.5, -- description transparency. optional
})

local MusicList = {
    ["Mercy - Living Stone"] = 112545816639972,
    ["My ordinary life - Living Stone"] = 131387015642491,
    ["Discord - Living Stone"] = 77595469047336,
    ["Young Girl A"] = 117044716417145,
	["The World Revolving"] = 126101283149087,
    ["Finale - Undertale"] = 117064854285259,
    ["Last Breath"] = 97889274347145,
    ["Stronger Than You (Chara Ver)"] = 74109325185963,
    ["Stronger Than You (Frisk Ver)"] = 92969307461807,
    ["Number Hardtekk (Slowed)"] = 82696338249251,
}

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local camera = workspace.CurrentCamera

local Sound
local SelectedMusic = "Mercy - Living Stone"
local CurrentVolume = 0.5
local IsLooped = false

local function CreateSound()
	if Sound then
		pcall(function()
			Sound:Stop()
			Sound:Destroy()
		end)
	end

	Sound = Instance.new("Sound")
	Sound.Name = "BoomboxSound"
	Sound.Parent = camera -- 🔥 QUAN TRỌNG: local 2D sound
	Sound.Volume = CurrentVolume
	Sound.Looped = IsLooped
	Sound.SoundId = "rbxassetid://" .. MusicList[SelectedMusic]

	Sound:Stop() -- reset state
end

-- init
CreateSound()

-- nếu camera bị reset (hiếm nhưng nên có)
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	camera = workspace.CurrentCamera
	if Sound then
		Sound.Parent = camera
	end
end)

local Dropdown = BoomboxSection:Dropdown({
    Title = "Select Music",
    Desc = "Choose music you want",
    Values = {
        "Mercy - Living Stone",
        "My ordinary life - Living Stone",
        "Discord - Living Stone",
        {
            Type = "Divider",
        },
        "Young Girl A",
        {
            Type = "Divider",
        },
		"The World Revolving",
        "Finale - Undertale",
        "Last Breath",
        "Stronger Than You (Chara Ver)",
        "Stronger Than You (Frisk Ver)",
        {
            Type = "Divider",
        },
        "Number Hardtekk (Slowed)"
    },
    Value = "Mercy - Living Stone",
    Multi = false,
    Locked = false,
    Callback = function(selected)
        SelectedMusic = selected
        if Sound then
            Sound.SoundId = "rbxassetid://" .. MusicList[selected]
            Sound:Stop()
            Sound.TimePosition = 0
        end
    end
})

local BoomboxGroup = BoomboxSection:Group({})

BoomboxGroup:Button({
    Title = "Play",
    Desc = "press button to play music", -- optional
    Icon = "circle-play",
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
        Callback = function()
            if not Sound then return end

            if Sound.SoundId == "" then
                Sound.SoundId = "rbxassetid://" .. MusicList[SelectedMusic]
            end

            Sound:Stop()
            Sound.TimePosition = 0
            Sound:Play()
        end
})

BoomboxGroup:Button({
    Title = "Stop",
    Desc = "press button to stop music", -- optional
    Icon = "circle-stop",
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
        Callback = function()
            if Sound then
                Sound:Stop()
            end
        end
})

local Toggle = BoomboxSection:Toggle({
    Title = "Loop",
    Desc = "Loop music on/off",
    Icon = "repeat",
    Value = false,
    Type = "Toggle",
    Color = Color3.fromRGB(100, 200, 100),
    Locked = false,
        Callback = function(state)
            IsLooped = state
            if Sound then
                Sound.Looped = state
            end
        end
})

local Slider = BoomboxSection:Slider({
    Title = "Volume",
    Desc = "Default is 50", -- optional
    Value = {
        Min = 0, -- minimum value
        Max = 1000, -- maximum value
        Default = 50 -- initial value
    },
    Step = 10, -- increment step (use 0.1 for floats). optional
    Locked = false, -- disable slider. optional
    Flag = "my_slider", -- for config saving. optional
        Callback = function(value)
            CurrentVolume = value / 100
            if Sound then
                Sound.Volume = CurrentVolume
            end
        end
})

local VisualSection = PlayerTab:Section({
    Title = "Visual",
    Desc = "Only you see", -- optional
    Icon = "zap", -- lucide icon or "rbxassetid://". optional
    IconColor = Color3.fromRGB(100, 100, 255), -- custom icon color. optional
    TextSize = 19, -- title text size. optional
    TextXAlignment = "Center", -- "Left", "Center", "Right". optional
    Box = true, -- show box around section. optional
    BoxBorder = true, -- show border on box. optional
    Opened = false, -- section expanded by default. optional
    FontWeight = Enum.FontWeight.SemiBold, -- title font weight. optional
    DescFontWeight = Enum.FontWeight.Medium, -- description font weight. optional
    TextTransparency = 0, -- title transparency. optional
    DescTextTransparency = 0.5, -- description transparency. optional
})

local Button = VisualSection:Button({
    Title = "Golden Shoulder",
    Desc = "Elemental Crystal Golem", -- optional
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
	Callback = function()
		local function Accs(AccsName, char, Mesh, Texture, Scale, CF, Welded, Angle)
			local acc = Instance.new("Accessory")
			acc.Name = AccsName
			acc.Parent = char

			local handle = Instance.new("Part")
			handle.Name = "Handle"
			handle.Size = Vector3.new(1,1,1)
			handle.Anchored = false
			handle.Massless = true
			handle.CanCollide = false
			handle.Parent = acc

			local mesh = Instance.new("SpecialMesh")
			mesh.MeshId = Mesh
			mesh.TextureId = Texture
			mesh.Scale = Scale
			mesh.Parent = handle

			local weld = Instance.new("Weld")
			weld.Part0 = handle
			weld.Part1 = char:WaitForChild(Welded)
			weld.C0 = CF * Angle
			weld.Parent = handle
		end

		local lp = game.Players.LocalPlayer
		local char = lp.Character or lp.CharacterAdded:Wait()

		-- xóa nếu đã tồn tại
		if char:FindFirstChild("GoldenShoulder") then
			char.GoldenShoulder:Destroy()
		end

		-- Elemental Crystal Golem Shoulder Rock
		Accs(
			"GoldenShoulder",
			char,
			"rbxassetid://4307568890", -- Mesh
			"rbxassetid://4307568951", -- Texture
			Vector3.new(1,1,1),
			CFrame.new(-0.6, -1.3, 0), -- chỉnh vị trí
			"Right Arm",               -- weld vào tay phải
			CFrame.Angles(0, 0, 0)
		)
	end
})

-- SERVICES
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

local lp = Players.LocalPlayer

-- SOUND
local soundId = nil
local lastKills = nil

local sound = Instance.new("Sound")
sound.Name = "KillSound"
sound.Volume = 1
sound.Looped = false
sound.Parent = SoundService

------------------------------------------------
-- THEO DÕI LEADERSTATS -> KILLS
------------------------------------------------
local function watchKills()
	local leaderstats = lp:WaitForChild("leaderstats", 10)
	if not leaderstats then return end

	local kills = leaderstats:FindFirstChild("Kills")
	if not kills or not kills:IsA("ValueBase") then return end

	lastKills = kills.Value

	kills:GetPropertyChangedSignal("Value"):Connect(function()
		if not soundId then return end

		-- chỉ play khi Kills THAY ĐỔI
		if kills.Value ~= lastKills then
			lastKills = kills.Value
			sound:Play()
		end
	end)
end

------------------------------------------------
-- INPUT UI
------------------------------------------------
local Input = PlayerTab:Input({
	Title = "Kill Sound",
	Desc = "Only Public Server",
	Placeholder = "Enter Sound ID",
	Callback = function(text)
		text = tostring(text):gsub("%s+", "")

		-- TẮT SOUND
		if text == "" then
			soundId = nil
			sound:Stop()
			return
		end

		-- BẬT SOUND
		if tonumber(text) then
			soundId = "rbxassetid://" .. text
			sound.SoundId = soundId

			watchKills()
		end
	end
})

--==============================
-- FIX LAG MAX (BUTTON / KEEP SOUND)
--==============================
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local FixLagEnabled = false
local Connections = {}

--==============================
-- UTILS
--==============================
local function DisconnectAll()
    for _, c in pairs(Connections) do
        if c then c:Disconnect() end
    end
    table.clear(Connections)
end

local function KillVFX(obj)
    if obj:IsA("ParticleEmitter")
    or obj:IsA("Trail")
    or obj:IsA("Beam")
    or obj:IsA("Fire")
    or obj:IsA("Smoke")
    or obj:IsA("Explosion")
    or obj:IsA("Highlight") then
        pcall(function()
            obj.Enabled = false
            obj:Destroy()
        end)
    end
end

--==============================
-- PURGE WORKSPACE (LIGHT MODE)
--==============================
local function PurgeWorkspace()
    for _, obj in ipairs(workspace:GetDescendants()) do
        KillVFX(obj)

        if obj:IsA("BasePart") then
            obj.CastShadow = false
            obj.Material = Enum.Material.Plastic
            obj.Reflectance = 0
        elseif obj:IsA("Decal") or obj:IsA("Texture") then
            obj.Transparency = 1
        end
    end
end

--==============================
-- BLOCK FUTURE VFX
--==============================
local function BlockFutureVFX()
    Connections[#Connections + 1] =
        workspace.DescendantAdded:Connect(function(obj)
            if FixLagEnabled then
                KillVFX(obj)
            end
        end)
end

--==============================
-- REMOVE ALL TREES (FULL MODEL)
--==============================
local function RemoveAllTrees()
    local map = workspace:FindFirstChild("Map")
    if not map then return end

    local treesFolder = map:FindFirstChild("Trees")
    if not treesFolder then return end

    for _, tree in ipairs(treesFolder:GetChildren()) do
        if tree:IsA("Model") and tree.Name == "Tree" then
            tree:Destroy()
        end
    end
end

--==============================
-- BLOCK TREE RESPAWN
--==============================
local function BlockTreeRespawn()
    local map = workspace:FindFirstChild("Map")
    if not map then return end

    local treesFolder = map:FindFirstChild("Trees")
    if not treesFolder then return end

    Connections[#Connections + 1] =
        treesFolder.ChildAdded:Connect(function(child)
            if FixLagEnabled and child:IsA("Model") and child.Name == "Tree" then
                child:Destroy()
            end
        end)
end

--==============================
-- FPS COUNTER
--==============================
local FPSGuiCreated = false
local FPSConnection

local function CreateFPSCounter()
    if FPSGuiCreated then return end
    FPSGuiCreated = true

    local gui = Instance.new("ScreenGui")
    gui.Name = "FixLag_FPS"
    gui.ResetOnSpawn = false
    gui.Parent = gethui and gethui() or CoreGui

    local label = Instance.new("TextLabel")
    label.Size = UDim2.fromOffset(120, 28)
    label.Position = UDim2.new(0, 12, 1, -120)
    label.BackgroundTransparency = 0.3
    label.BackgroundColor3 = Color3.fromRGB(15,15,15)
    label.BorderSizePixel = 0
    label.TextColor3 = Color3.fromRGB(0,255,100)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 16
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.Text = "FPS: --"
    label.Parent = gui

    Instance.new("UICorner", label).CornerRadius = UDim.new(0,6)

    local frames = 0
    local lastTime = tick()

    FPSConnection = RunService.RenderStepped:Connect(function()
        frames += 1
        if tick() - lastTime >= 1 then
            label.Text = " FPS: " .. frames
            frames = 0
            lastTime = tick()
        end
    end)
end
--==============================
-- TOAST FUNCTION
--==============================
local ToastShown = false

local function ShowFixLagToast()
    if ToastShown then return end
    ToastShown = true

    local TweenService = game:GetService("TweenService")

    local gui = Instance.new("ScreenGui")
    gui.Name = "BaeMinhFixLagToast"
    gui.ResetOnSpawn = false
    gui.Parent = gethui and gethui() or CoreGui

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.fromOffset(320, 60)
    frame.Position = UDim2.fromScale(0.5, 0.15)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    frame.BackgroundTransparency = 1
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0,14)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Thickness = 1.2
    stroke.Color = Color3.fromRGB(0,255,150)
    stroke.Transparency = 1

    local text = Instance.new("TextLabel", frame)
    text.Size = UDim2.fromScale(1,1)
    text.BackgroundTransparency = 1
    text.Text = "BaeMinhReal - Fix Lag ✅"
    text.Font = Enum.Font.GothamBold
    text.TextSize = 18
    text.TextColor3 = Color3.fromRGB(0,255,150)
    text.TextTransparency = 1

    -- FADE IN
    TweenService:Create(frame, TweenInfo.new(0.4), {
        BackgroundTransparency = 0.15
    }):Play()
    TweenService:Create(text, TweenInfo.new(0.4), {
        TextTransparency = 0
    }):Play()
    TweenService:Create(stroke, TweenInfo.new(0.4), {
        Transparency = 0
    }):Play()

    -- HOLD + FADE OUT
    task.delay(3, function()
        TweenService:Create(frame, TweenInfo.new(0.4), {
            BackgroundTransparency = 1
        }):Play()
        TweenService:Create(text, TweenInfo.new(0.4), {
            TextTransparency = 1
        }):Play()
        TweenService:Create(stroke, TweenInfo.new(0.4), {
            Transparency = 1
        }):Play()

        task.delay(0.5, function()
            gui:Destroy()
        end)
    end)
end

--==============================
-- MAIN BUTTON CALLBACK
--==============================
local function ApplyFixLag_Button()
    FixLagEnabled = not FixLagEnabled

    if FixLagEnabled then
        ShowFixLagToast() -- ✅ CHỈ HIỆN KHI BẬT
        CreateFPSCounter()

        -- Lighting tối giản
        for _, v in ipairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") then
                v.Enabled = false
            end
        end

        Lighting.GlobalShadows = false
        Lighting.FogEnd = 1e9
        Lighting.Brightness = 1

        PurgeWorkspace()
        RemoveAllTrees()
        BlockTreeRespawn()
        BlockFutureVFX()

        warn("[FIX LAG] MAX MODE ENABLED")
    else
        DisconnectAll()
        Lighting.GlobalShadows = true
        warn("[FIX LAG] DISABLED")
    end
end

--==============================
-- BUTTON IN PLAYER TAB
--==============================
PlayerTab:Button({
    Title = "Fix Lag MAX (Boost)",
    Desc = "Remove VFX + Shadow + FULL Trees  + ...",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = ApplyFixLag_Button
})


--// Emote Limited
local EmoteTab = Window:Tab({
    Title = "Emote Limeted",
    Desc = "Visual Emote Limeted", -- optional
    Icon = "sparkles", -- lucide icon or "rbxassetid://" or URL. optional
    IconColor = Color3.fromRGB(240, 240, 0), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = false, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

EmoteTab:Button({
    Title = "Final Stand",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Animation
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://113876851900426"
humanoid:LoadAnimation(anim):Play()

-- VFX bind
task.delay(0.1, function()
    local acc = Instance.new("Accessory")
    acc.Name = "#EmoteHolder_" .. math.random(1, 100000)
    acc.Parent = character
    acc:SetAttribute("EmoteProperty", true)

    require(ReplicatedStorage.Emotes.VFX):MainFunction({
        Character = character,
        vfxName = "Final Stand",
        SpecificModule = ReplicatedStorage.Emotes.VFX,
        AnimSent = 113876851900426,
        RealBind = acc,
    })
end)

-- SOUND + AURA
task.delay(9, function()
    if not character or not character.Parent then return end
    if not workspace:FindFirstChild("Live") then return end
    if not workspace.Live:FindFirstChild(character.Name) then return end

    -- LOOP SOUND (GIỮ NGUYÊN SOURCE)
    local sounds = {
        {SoundId = "rbxassetid://112446641141594", Volume = 1},
        {SoundId = "rbxassetid://98080224862986", Volume = 0.3},
    }

    for _,info in pairs(sounds) do
        local s = Instance.new("Sound")
        s.SoundId = info.SoundId
        s.Volume = info.Volume
        s.Looped = true
        s.Parent = character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart")
        s:Play()

        task.delay(60, function()
            TweenService:Create(s, TweenInfo.new(0.5), {Volume = 0}):Play()
            task.delay(0.75, function()
                if s then s:Destroy() end
            end)
        end)
    end

    -- AURA (FS)
    local auraClone = ReplicatedStorage.Emotes.VFX.VfxMods.FS.vfx.Aura:Clone()

    for _,part in pairs(auraClone:GetChildren()) do
        local charPart = character:FindFirstChild(part.Name)
        if part.Name == "HumanoidRootPart" then
            charPart = character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart")
        end

        if charPart then
            for _,fx in pairs(part:GetChildren()) do
                if fx:IsA("ParticleEmitter") then
                    fx.LockedToPart = true
                end

                fx:SetAttribute("LimitedAura", true)
                fx.Parent = charPart

                task.delay(60, function()
                    if fx:IsA("ParticleEmitter") then
                        fx.Enabled = false
                    else
                        for _,sub in pairs(fx:GetChildren()) do
                            if sub:IsA("ParticleEmitter") then
                                sub.Enabled = false
                            end
                        end
                    end
                end)

                task.delay(65, function()
                    if fx then fx:Destroy() end
                end)
            end
        end
    end

    auraClone:Destroy()
end)

    end
})

EmoteTab:Button({
    Title = "Inner Rage",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- màu fallback (source gốc thiếu)
local v3189 = Color3.fromRGB(
    math.random(100,255),
    math.random(50,150),
    math.random(50,150)
)

local v67 = Color3.fromRGB(math.random(0,255), math.random(0,255), math.random(0,255))
local vu68 = {}

-- animation đầu
local v69 = Instance.new("Animation")
v69.AnimationId = "rbxassetid://96993907314948"
local v70 = humanoid:LoadAnimation(v69)
v70:Play()

-- animation tiếp
v70.Stopped:Connect(function()
    local v71 = Instance.new("Animation")
    v71.AnimationId = "rbxassetid://127234845846317"
    humanoid:LoadAnimation(v71):Play()
end)

-- holder
local vu72 = Instance.new("Accessory")
vu72.Name = "#EmoteHolder_" .. math.random(1,100000)
vu72.Parent = character
CollectionService:AddTag(vu72, "emoteendstuff"..character.Name)

-- VFX chính
require(ReplicatedStorage.Emotes.VFX):MainFunction({
    Character = character,
    vfxName = "Energy Explosion",
    AnimSent = 96993907314948,
    RealBind = vu72,
    NoInsertion = true,
    Colour = v67,
})

local vu73, vu74, vu75 = {}, {}, {}

-- xử lý tóc + aura
task.delay(1.3, function()
    if not vu72.Parent then return end

    for _,acc in pairs(character.FakeHead:GetChildren()) do
        if acc:IsA("Accessory")
        and acc:FindFirstChild("Handle")
        and acc.Handle:FindFirstChild("HairAttachment") then

            local handle = acc.Handle
            table.insert(vu74, handle)

            for _,mesh in pairs(handle:GetChildren()) do
                if mesh:IsA("SpecialMesh") then
                    mesh:SetAttribute("basetext", mesh.TextureId)
                end
            end
        end
    end

    for _,hair in pairs(vu74) do
        local clone = hair:Clone()
        table.insert(vu73, clone)

        local weld = Instance.new("Weld")
        weld.Part0 = clone
        weld.Part1 = hair
        weld.Parent = clone

        clone.Parent = workspace.Thrown
        hair.Transparency = 1

        TweenService:Create(hair, TweenInfo.new(0.25), {Transparency = 0}):Play()

        local mesh = hair:FindFirstChildOfClass("SpecialMesh")
        if mesh then
            mesh.TextureId = ""
            local glow = ReplicatedStorage.Resources.DeathEffect.Template:Clone()
            glow.Color3 = Color3.new(v3189.R*5, v3189.G*5, v3189.B*5)
            glow.Parent = clone
        end
    end

    vu68[character] = {hairs = vu74, destroy = vu73}

    -- aura holder
    local auraHolder = Instance.new("Folder")
    auraHolder.Name = "AuraHolder"
    auraHolder:SetAttribute("LimAura", true)
    auraHolder:SetAttribute("EmoteEffect", true)
    auraHolder.Parent = character

    task.delay(203, function()
        if auraHolder then auraHolder:Destroy() end
    end)

    -- aura real
    for _,obj in pairs(ReplicatedStorage.Emotes.AuraReal:GetChildren()) do
        local clone = obj:Clone()
        clone:SetAttribute("LimAura", true)

        if clone:IsA("Attachment") then
            clone.Parent = character.PrimaryPart
        else
            local weld = Instance.new("Weld")
            weld.Part0 = character.PrimaryPart
            weld.Part1 = clone
            weld.Parent = clone
        end

        for _,fx in pairs(clone:GetDescendants()) do
            if fx:IsA("ParticleEmitter") or fx:IsA("PointLight") then
                fx.Enabled = false
                fx:SetAttribute("LimitedAura", true)
                fx:SetAttribute("InnerRageAura", true)

                if fx:IsA("ParticleEmitter") then
                    fx.Color = ColorSequence.new(v3189)
                end
                if fx:IsA("PointLight") then
                    fx.Color = v3189
                    fx.Brightness = 1.3
                end

                table.insert(vu75, fx)
            end
        end

        task.delay(203, function()
            if clone then clone:Destroy() end
        end)
    end
end)

-- bật aura + đổi anim
task.delay(5.3, function()
    if not vu72.Parent then return end

    for _,fx in pairs(vu75) do
        fx.Enabled = true
    end

    task.wait(0.05)

    for _,track in pairs(humanoid:GetPlayingAnimationTracks()) do
        if track.Animation.AnimationId == "rbxassetid://127234845846317" then
            track:Stop()
            local v132 = Instance.new("Animation")
            v132.AnimationId = "rbxassetid://117177504280717"
            humanoid:LoadAnimation(v132):Play()
        end
    end
end)

    end
})

EmoteTab:Button({
    Title = "Shadow Eruption",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--========================
-- START SOUND (delay-based)
--========================
local soundList = {
    {
        SoundId = "rbxassetid://117425361961655",
        Volume = 0,
        ParentTorso = true,
    },
}

for delayTime, info in pairs(soundList) do
    task.delay(delayTime, function()
        local s = Instance.new("Sound")
        s.SoundId = info.SoundId
        s.Volume = info.Volume or 1
        s.Looped = info.Looped or false
        s.Parent = info.ParentTorso
            and (character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart"))
            or workspace
        s:Play()
    end)
end

--========================
-- ANIMATION
--========================
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://121032789756540"
humanoid:LoadAnimation(anim):Play()

--========================
-- MAIN VFX
--========================
task.delay(0.1, function()
    local acc = Instance.new("Accessory")
    acc.Name = "#EmoteHolder_" .. math.random(1, 100000)
    acc.Parent = character

    require(ReplicatedStorage.Emotes.VFX):MainFunction({
        Character = character,
        vfxName = "Shadow Eruption",
        SpecificModule = ReplicatedStorage.Emotes.VFX,
        AnimSent = 121032789756540,
        RealBind = acc,
    })
end)

--========================
-- AURA + LOOP SOUND
--========================
task.delay(8.1, function()
    if not character or not character.Parent then return end
    if not workspace:FindFirstChild("Live") then return end
    if not workspace.Live:FindFirstChild(character.Name) then return end

    -- Aura holder
    local auraFolder = Instance.new("Folder")
    auraFolder.Name = "AuraHolder"
    auraFolder.Parent = character

    -- ⚠️ THAY THẾ script.auraNew
    -- 👉 PHẢI TỒN TẠI Ở ReplicatedStorage
    local auraSource = ReplicatedStorage:WaitForChild("Emotes"):WaitForChild("AuraNew")

    for _,part in pairs(auraSource:GetChildren()) do
        local charPart = character:FindFirstChild(part.Name)
        if charPart then
            local clone = part:Clone()
            clone.Parent = auraFolder
            clone:SetAttribute("LimitedAura", true)

            task.delay(65, function()
                if clone then clone:Destroy() end
            end)

            for _,fx in pairs(clone:GetDescendants()) do
                if fx:IsA("Trail") or fx:IsA("Beam") or fx:IsA("ParticleEmitter") then
                    fx.Enabled = true
                    task.delay(60, function()
                        if fx then fx.Enabled = false end
                    end)
                end
            end
        end
    end

    -- LOOP SOUND
    local loopSound = Instance.new("Sound")
    loopSound.SoundId = "rbxassetid://128082194939921"
    loopSound.Looped = true
    loopSound.Volume = 1
    loopSound.Parent = character:FindFirstChild("Torso") or character:FindFirstChild("HumanoidRootPart")
    loopSound:Play()

    Debris:AddItem(loopSound, 80)

    task.delay(60, function()
        TweenService:Create(loopSound, TweenInfo.new(1), {Volume = 0}):Play()
        Debris:AddItem(loopSound, 1.2)

        for _,v in pairs(character:GetDescendants()) do
            if v:GetAttribute("aura") then
                if v:IsA("ParticleEmitter") or v:IsA("Beam") or v:IsA("Trail") then
                    v.Enabled = false
                    Debris:AddItem(v, 5)
                end
            end
        end
    end)
end)

    end
})

EmoteTab:Button({
    Title = "Divine Form",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--==============================
-- DELAYED AURA (7.14s)
--==============================
task.spawn(function()
    task.wait(7.14)

    local char = player.Character
    if not char then return end

    local auraSource =
        ReplicatedStorage.Emotes.VFX.VfxMods.Evolved.vfx.Folder

    local auraFolder = Instance.new("Folder")
    auraFolder.Name = "AuraHolder"
    auraFolder:SetAttribute("DivineForm", true)
    auraFolder:SetAttribute("LimAura", true)
    auraFolder:SetAttribute("EmoteEffect", true)
    auraFolder.Parent = char

    for _,obj in pairs(auraSource:GetChildren()) do
        if obj:IsA("BasePart") then
            local bodyPart = char:FindFirstChild(obj.Name)
            if bodyPart then
                local clone = obj:Clone()
                clone.Transparency = 1
                clone.Massless = true
                clone.Name = tostring(math.random(1, 1000))
                clone:SetAttribute("LimAura", true)
                clone.Parent = auraFolder

                local weld = Instance.new("Weld")
                weld.Part0 = bodyPart
                weld.Part1 = clone
                weld.Parent = clone

                for _,fx in pairs(clone:GetDescendants()) do
                    if fx:IsA("ParticleEmitter") or fx:IsA("Beam") then
                        fx:SetAttribute("LimitedAura", true)
                        task.delay(240, function()
                            if fx then fx.Enabled = false end
                        end)
                    end
                end

                task.delay(244, function()
                    if clone and clone.Parent then
                        clone:Destroy()
                    end
                end)
            end
        end
    end
end)

--==============================
-- MAIN ANIMATION
--==============================
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://116187503451999"
humanoid:LoadAnimation(anim):Play()

--==============================
-- MAIN VFX BIND
--==============================
local acc = Instance.new("Accessory")
acc.Name = "#EmoteHolder_" .. math.random(1, 100000)
acc.Parent = character
acc:SetAttribute("EmoteProperty", true)

require(ReplicatedStorage.Emotes.VFX):MainFunction({
    Character = character,
    vfxName = "Divine Form",
    SpecificModule = ReplicatedStorage.Emotes.VFX,
    AnimSent = 116187503451999,
    RealBind = acc,
})

--==============================
-- SECOND AURA (7s)
--==============================
task.delay(7, function()
    if not acc or not acc.Parent then return end
    if not workspace:FindFirstChild("Live") then return end
    if not workspace.Live:FindFirstChild(character.Name) then return end

    local auraFolder = Instance.new("Folder")
    auraFolder.Name = "AuraHolder"
    auraFolder:SetAttribute("DivineForm", true)
    auraFolder:SetAttribute("LimAura", true)
    auraFolder:SetAttribute("EmoteEffect", true)
    auraFolder.Parent = character

    local auraSource =
        ReplicatedStorage.Emotes.VFX.VfxMods.Evolved.vfx.Folder

    for _,obj in pairs(auraSource:GetChildren()) do
        if obj:IsA("BasePart") then
            local bodyPart = character:FindFirstChild(obj.Name)
            if bodyPart then
                local clone = obj:Clone()
                clone.Transparency = 1
                clone.Massless = true
                clone.Name = tostring(math.random(1, 1000))
                clone:SetAttribute("LimAura", true)
                clone.Parent = auraFolder

                local weld = Instance.new("Weld")
                weld.Part0 = bodyPart
                weld.Part1 = clone
                weld.Parent = clone

                for _,fx in pairs(clone:GetDescendants()) do
                    if fx:IsA("ParticleEmitter") or fx:IsA("Beam") then
                        fx:SetAttribute("LimitedAura", true)
                        task.delay(2, function()
                            if fx then fx.Enabled = false end
                        end)
                    end
                end

                task.delay(4, function()
                    if clone and clone.Parent then
                        clone:Destroy()
                    end
                end)
            end
        end
    end
end)

    end
})

EmoteTab:Button({
    Title = "The Strongest",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local character = Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--==============================
-- SOUND SEQUENCE (GIỮ TIMING GỐC)
--==============================
local soundTable = {
    [0] = {
        SoundId = "rbxassetid://117787451950766",
        Volume = 2,
    },
    [0.01] = {
        SoundId = "rbxassetid://97998065677521",
        Volume = 1.85,
    },
    [2.29] = {
        SoundId = "rbxassetid://99535007576182",
        Volume = 2,
        Looped = true,
    },
}

for delayTime, data in pairs(soundTable) do
    task.delay(delayTime, function()
        local sound = Instance.new("Sound")
        sound.SoundId = data.SoundId
        sound.Volume = data.Volume or 1
        sound.Looped = data.Looped or false
        sound.Parent = workspace
        sound:Play()
    end)
end

--==============================
-- ANIMATION
--==============================
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://86505219150915"
humanoid:LoadAnimation(anim):Play()

--==============================
-- VFX BIND (0.1s)
--==============================
task.delay(0.1, function()
    local bind = Instance.new("Folder")
    bind.Name = "PrideBind"
    bind.Parent = character
    bind:SetAttribute("EmoteProperty", true)

    require(ReplicatedStorage.Emotes.VFX):MainFunction({
        Character = character,
        vfxName = "Boss Raid",
        SpecificModule = ReplicatedStorage.Emotes.VFX,
        AnimSent = 86505219150915,
        RealBind = bind,
    })
end)

    end
})

EmoteTab:Button({
    Title = "Boundless Rage",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Debris = game:GetService("Debris")

-- SAFE CHARACTER
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--==============================
-- ANIMATION
--==============================
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://107649573628906"
humanoid:LoadAnimation(anim):Play()

local emoteAcc = nil
local noRotateFolder = nil

--==============================
-- MAIN VFX + NO ROTATE (0.1s)
--==============================
task.delay(0.1, function()
    emoteAcc = Instance.new("Accessory")
    emoteAcc.Name = "#EmoteHolder_" .. math.random(1, 100000)
    emoteAcc.Parent = character
    emoteAcc:SetAttribute("EmoteProperty", true)

    require(ReplicatedStorage.Emotes.VFX):MainFunction({
        Character = character,
        vfxName = "Boundless Rage",
        SpecificModule = ReplicatedStorage.Emotes.VFX,
        AnimSent = 107649573628906,
        RealBind = emoteAcc,
    })

    noRotateFolder = Instance.new("Folder")
    noRotateFolder.Name = "NoRotate"
    noRotateFolder.Parent = character
    noRotateFolder:SetAttribute("EmoteProperty", true)
end)

--==============================
-- AURA + LOOP SOUND (4s)
--==============================
task.delay(4, function()
    if not character or not character.Parent then return end

    -- ❌ bỏ workspace.Live cứng → tránh crash
    local auraTemplate =
        ReplicatedStorage.Emotes.VFX.VfxMods.Boundless.vfx.AuraChar:Clone()

    Debris:AddItem(auraTemplate, 5)

    if noRotateFolder and noRotateFolder.Parent then
        noRotateFolder:Destroy()
    end

    -- LOOP SOUND
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://81055990581650"
    sound.Looped = true
    sound.Volume = 1
    sound.Name = "CrushEmoteAmbience"
    sound.Parent =
        character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("Torso")
        or character

    sound:Play()

    -- APPLY AURA
    for _,part in pairs(auraTemplate:GetChildren()) do
        if part:IsA("BasePart") then
            local charPart = character:FindFirstChild(part.Name)
            if charPart then
                for _,obj in pairs(part:GetChildren()) do
                    if obj:IsA("Attachment") or obj:IsA("ParticleEmitter") then
                        local clone = obj:Clone()
                        clone.Parent = charPart
                        clone:SetAttribute("LimitedAura", true)

                        -- FADE OUT + SOUND STOP
                        task.delay(60, function()
                            TweenService:Create(
                                sound,
                                TweenInfo.new(0.5),
                                { Volume = 0 }
                            ):Play()

                            task.delay(0.75, function()
                                if sound and sound.Parent then
                                    sound:Destroy()
                                end
                            end)

                            if clone:IsA("ParticleEmitter") then
                                clone.Enabled = false
                            else
                                for _,fx in pairs(clone:GetChildren()) do
                                    if fx:IsA("ParticleEmitter") or fx:IsA("Beam") then
                                        fx.Enabled = false
                                    end
                                end
                            end
                        end)

                        task.delay(65, function()
                            if clone and clone.Parent then
                                clone:Destroy()
                            end
                        end)
                    end
                end
            end
        end
    end

    auraTemplate:Destroy()
end)

    end
})

EmoteTab:Button({
    Title = "The Fallen",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- SAFE CHARACTER
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

--==============================
-- ANIMATION
--==============================
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://133818134745501"
humanoid:LoadAnimation(anim):Play()

--==============================
-- VFX + SOUND (0.1s)
--==============================
task.delay(0.1, function()
    if not character or not character.Parent then return end

    -- REMOVE OLD EFFECT
    local old = character:FindFirstChild("DismantleEffect")
    if old then
        old:Destroy()
    end

    -- ACCESSORY BIND
    local acc = Instance.new("Accessory")
    acc.Name = "DismantleEffect"
    acc.Parent = character
    acc:SetAttribute("EmoteEffect", true)

    require(ReplicatedStorage.Emotes.VFX):MainFunction({
        Character = character,
        vfxName = "Pride",
        SpecificModule = ReplicatedStorage.Emotes.VFX,
        AnimSent = 133818134745501,
        RealBind = acc,
        CanRotate = true,
    })

    -- SOUND (FIX PARENT)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://93369149563360"
    sound.Volume = 2
    sound.Looped = false
    sound.Parent =
        character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("Torso")
        or character

    sound:Play()
end)

    end
})

EmoteTab:Button({
    Title = "True Aura",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = false, -- disable button. optional
    LockedTitle = "Locked", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()

        --==============================
        -- SERVICES (GIỮ NGUYÊN)
        --==============================
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local CollectionService = game:GetService("CollectionService")

        local character = Players.LocalPlayer.Character
        if not character then return end

        local humanoid = character:FindFirstChild("Humanoid")
        if not humanoid then return end

        --==============================
        -- ANIMATION
        --==============================
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://103668868712897"
        humanoid:LoadAnimation(anim):Play()

        task.delay(0.1, function()
            if not character or not character.Parent then return end

            --==============================
            -- ACCESSORY BIND
            --==============================
            local acc = Instance.new("Accessory")
            acc.Name = "#EmoteHolder_" .. math.random(1, 100000)
            acc.Parent = character

            CollectionService:AddTag(acc, "emoteendstuff" .. character.Name)

            require(ReplicatedStorage.Emotes.VFX):MainFunction({
                Character = character,
                vfxName = "True Aura",
                SpecificModule = ReplicatedStorage.Emotes.VFX,
                AnimSent = 103668868712897,
                RealBind = acc,
            })

            --==============================
            -- SPECIAL USER CHECK (GIỮ NGUYÊN, KHÔNG SỬA LOGIC)
            --==============================
            local root = character.PrimaryPart

            if tostring(character) == "YungCrepetics" and root then
                task.delay(6.3, function()
                    if acc and acc.Parent then
                        for _, part in pairs(
                            workspace:GetPartBoundsInRadius(root.Position, 40)
                        ) do
                            local _ = part:GetAttribute("IsTree") or part.Name == "TreeRoot"
                            local hum = part.Parent:FindFirstChildOfClass("Humanoid")

                            if hum and hum.Name ~= "FakeHumanoid" then
                                local _ = hum == humanoid
                            end
                        end
                    end
                end)
            end

            --==============================
            -- SOUND (R6 ONLY → TORSO)
            --==============================
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://83049960731792"
            sound.Volume = 3
            sound.Looped = false
            sound.Parent = character:FindFirstChild("Torso")

            if sound.Parent then
                sound:Play()
            end
        end)
    end
})

EmoteTab:Button({ --//BUG
    Title = "Eternal Seal",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = true, -- disable button. optional
    LockedTitle = "Bug", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local torso = character:WaitForChild("Torso") -- R6

--==============================
-- ANIMATION + MAIN VFX
--==============================
task.spawn(function()
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://100255267749203"
    humanoid:LoadAnimation(anim):Play()

    local silent = Instance.new("Sound")
    silent.SoundId = "rbxassetid://79605009444651"
    silent.Volume = 0
    silent.Parent = torso
    silent:Play()

    local bind = Instance.new("Folder")
    bind.Name = "RuthlessBind"
    bind.Parent = character
    bind:SetAttribute("EmoteProperty", true)

    require(ReplicatedStorage.Emotes.VFX):MainFunction({
        Character = character,
        vfxName = "Eternal Seal",
        SpecificModule = ReplicatedStorage.Emotes.VFX,
        AnimSent = 100255267749203,
        RealBind = bind,
    })
end)

--==============================
-- SOUND
--==============================
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://79605009444651"
sound.Volume = 2
sound.Parent = torso
sound:Play()

--==============================
-- THROWN FOLDER
--==============================
local thrown = Workspace:FindFirstChild("Thrown")
if not thrown then
    thrown = Instance.new("Folder")
    thrown.Name = "Thrown"
    thrown.Parent = Workspace
end

local tracked = {}

local function register(obj)
    obj:SetAttribute("EmoteProperty", true)
    CollectionService:AddTag(obj, "emoteendstuff" .. character.Name)
    table.insert(tracked, obj)
    obj.Parent = thrown
end

--==============================
-- CLONE MODELS
--==============================
local Prison = ReplicatedStorage.Emotes.PrisonRealmRig:Clone()
local Prism = ReplicatedStorage.Emotes.RealmPrism:Clone()
local Strings = ReplicatedStorage.Emotes.Strings:Clone()

register(Prison)
register(Prism)
register(Strings)

--==============================
-- WELD (GIỮ NGUYÊN LOGIC GỐC)
--==============================
for _,model in pairs({
    Prison,
    Prism,
    unpack(Strings:GetChildren())
}) do
    model.PrimaryPart.Anchored = false

    local weld = Instance.new("Weld")
    weld.Part0 = character.PrimaryPart or torso
    weld.Part1 = model.PrimaryPart
    weld.C0 = model:GetAttribute("Offset") -- ⚠️ QUAN TRỌNG
    weld.Parent = model.PrimaryPart
end

--==============================
-- BONE SOUND
--==============================
local boneSound = Instance.new("Sound")
boneSound.SoundId = "rbxassetid://116434570262349"
boneSound.Volume = 2
boneSound.Parent = Prison:FindFirstChild("Bone_L", true)
boneSound:Play()

--==============================
-- MODEL ANIMATIONS
--==============================
local function playAnim(model, id)
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. id

    local controller =
        model:FindFirstChild("AnimationController")
        or model:FindFirstChildOfClass("Humanoid")

    if controller then
        controller:LoadAnimation(anim):Play()
    end
end

playAnim(Prison, 132931842051377)
playAnim(Prism, 73313263538976)

local ids = {
    115400109213203,
    129152881643120,
    116148929833466,
    106613129685108,
    85535076926939,
    136688312702757,
}

for i, id in ipairs(ids) do
    local stringModel = Strings:FindFirstChild("String" .. i)
    if stringModel then
        playAnim(stringModel, id)
    end
end

--==============================
-- ANTI FREEZE (GIỮ PLAYER DI CHUYỂN)
--==============================
RunService.RenderStepped:Connect(function()
    if character and character.Parent then
        for _,p in pairs(character:GetDescendants()) do
            if p:IsA("BasePart") and p.Anchored then
                p.Anchored = false
            end
        end
    end
end)

    end
})

EmoteTab:Button({ --//BUG
    Title = "World Cutting Slash",
    Desc = "Limited Emote",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    IconAlign = "Right", -- "Left" or "Right". optional
    Locked = true, -- disable button. optional
    LockedTitle = "Soon", -- text shown when locked. optional
    Justify = "Between", -- "Between" or "Center". optional
    Flag = "my_button", -- for config saving. optional
    Callback = function()
        --...
    end
})

local SettingsTab = Window:Tab({
    Title = "Settings",
    Desc = "setting of script!", -- optional
    Icon = "settings", -- lucide icon or "rbxassetid://" or URL. optional
    IconColor = Color3.fromRGB(0, 0, 0), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = false, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local Dropdown = SettingsTab:Dropdown({
    Title = "Select Theme",
    Values = {
        {
            Title = "Hutao 1",
            Desc = "my wife :>",
            Icon = "image-up",
            Callback = function() 
                Window:SetBackgroundImage("rbxassetid://72048146615669")
            end
        },
        {
            Title = "Hutao 2",
            Desc = "Hutao :3",
            Icon = "image-up",
            Callback = function() 
                Window:SetBackgroundImage("rbxassetid://108791580780762")
            end
        },
		{ Type = "Divider", },
        {
            Title = "Chara 1",
            Desc = "Chara GT",
            Icon = "image-up",
            Callback = function() 
                Window:SetBackgroundImage("rbxassetid://117011100817764")
            end
        },
        {
            Title = "Chara 2",
            Desc = "X!Chara",
            Icon = "image-up",
            Callback = function() 
                Window:SetBackgroundImage("rbxassetid://112943919766922")
            end
        },
		{ Type = "Divider", },
		{
            Title = "Frisk 1",
            Desc = "Frisk GT",
            Icon = "image-up",
            Callback = function() 
                Window:SetBackgroundImage("rbxassetid://139131717590518")
            end
        },
		{
            Title = "Frisk 2",
            Desc = "X!Frisk",
            Icon = "image-up",
            Callback = function() 
                Window:SetBackgroundImage("rbxassetid://110901432936996")
            end
        },
    }
})

local MiscTab = Window:Tab({
    Title = "Misc",
    Desc = "some feature", -- optional
    Icon = "table-of-contents", -- lucide icon or "rbxassetid://" or URL. optional
    IconColor = Color3.fromRGB(255, 255, 255), -- custom icon color. optional
    IconShape = "Square", -- "Square" or "Circle". optional
    IconThemed = true, -- use theme colors. optional
    Locked = false, -- disable tab interaction. optional
    ShowTabTitle = false, -- show title inside tab. optional
    Border = true, -- add border around tab. optional
})

local Players = game:GetService("Players")

-- Paragraph WindUI
local ServerInfoParagraph = MiscTab:Paragraph({
    Title = "📊 Server Info",
    Desc = "Loading..."
})

-- format uptime
local function formatTime(sec)
    local h = math.floor(sec / 3600)
    local m = math.floor((sec % 3600) / 60)
    local s = math.floor(sec % 60)
    return string.format("%02dh %02dm %02ds", h, m, s)
end

-- update loop
task.spawn(function()
    while true do
        local currentPlayers = #Players:GetPlayers()
        local maxPlayers = Players.MaxPlayers
        local placeId = game.PlaceId
        local jobId = game.JobId
        local uptime = workspace.DistributedGameTime

        ServerInfoParagraph:SetDesc(
            "👥 Players: "..currentPlayers.." / "..maxPlayers..
            "\n👀 PlaceId: "..placeId..
            "\n⌚ Session Time: "..formatTime(uptime)..
            "\n🧩 JobId: "..jobId
        )

        task.wait(1)
    end
end)

MiscTab:Divider()

local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------
-- COPY JOB ID
--------------------------------------------------
MiscTab:Button({
    Title = "📋 Copy JobId",
    Desc = "Copy current server JobId",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    Value = false, -- initial state. optional
    Type = "Toggle", -- "Toggle" or "Checkbox". optional
    Locked = false, -- disable toggle. optional
    Flag = "my_toggle", -- for config saving. optional
    Callback = function()
        if setclipboard then
            setclipboard(game.JobId)
        end
    end
})

--------------------------------------------------
-- JOIN JOB ID
--------------------------------------------------

local Input = MiscTab:Input({
    Title = "👾 Join JobID",
	Placeholder = "Paste JobId & Enter",
    Callback = function(text)
        if text and text ~= "" then
            TeleportService:TeleportToPlaceInstance(game.PlaceId, text, LocalPlayer)
        end
    end
})

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

MiscTab:Button({
    Title = "🔄 Rejoin Server",
    Desc = "Rejoin current server",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    Value = false, -- initial state. optional
    Type = "Toggle", -- "Toggle" or "Checkbox". optional
    Locked = false, -- disable toggle. optional
    Flag = "my_toggle", -- for config saving. optional
    Callback = function()
        pcall(function()
            TeleportService:TeleportToPlaceInstance(
                game.PlaceId,
                game.JobId,
                LocalPlayer
            )
        end)
    end
})

MiscTab:Divider()

--------------------------------------------------
-- SERVER HOP CORE
--------------------------------------------------
local function getServers(maxPages)
    local servers = {}
    local cursor = ""
    local pages = 0

    repeat
        pages += 1
        local url =
            "https://games.roblox.com/v1/games/"
            .. game.PlaceId
            .. "/servers/Public?sortOrder=Asc&limit=100"
            .. (cursor ~= "" and "&cursor=" .. cursor or "")

        local success, res = pcall(function()
            return HttpService:JSONDecode(game:HttpGet(url))
        end)

        if not success or not res or not res.data then break end

        for _, srv in ipairs(res.data) do
            if srv.playing < srv.maxPlayers and srv.id ~= game.JobId then
                table.insert(servers, srv)
            end
        end

        cursor = res.nextPageCursor
    until not cursor or pages >= (maxPages or 5)

    return servers
end

--------------------------------------------------
-- RANDOM SERVER HOP
--------------------------------------------------
MiscTab:Button({
    Title = "🎲 Hop Server",
    Desc = "Random public server",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    Value = false, -- initial state. optional
    Type = "Toggle", -- "Toggle" or "Checkbox". optional
    Locked = false, -- disable toggle. optional
    Flag = "my_toggle", -- for config saving. optional
    Callback = function()
        local servers = getServers(6)
        if #servers == 0 then return end

        local low, mid, high = {}, {}, {}

        for _, srv in ipairs(servers) do
            local ratio = srv.playing / srv.maxPlayers

            if ratio <= 0.3 then
                table.insert(low, srv)
            elseif ratio <= 0.7 then
                table.insert(mid, srv)
            else
                table.insert(high, srv)
            end
        end

        -- build available buckets
        local buckets = {}
        if #low > 0 then table.insert(buckets, low) end
        if #mid > 0 then table.insert(buckets, mid) end
        if #high > 0 then table.insert(buckets, high) end
        if #buckets == 0 then return end

        -- random bucket FIRST (equal chance)
        local chosenBucket = buckets[math.random(1, #buckets)]
        local pick = chosenBucket[math.random(1, #chosenBucket)]

        task.wait(0.2)
        TeleportService:TeleportToPlaceInstance(
            game.PlaceId,
            pick.id,
            LocalPlayer
        )
    end
})

--------------------------------------------------
-- LOWEST PLAYER SERVER
--------------------------------------------------
MiscTab:Button({
    Title = "👥 Hop Lowest Player ",
    Desc = "Join server have low player",
    Icon = "mouse-pointer-click", -- lucide icon or "rbxassetid://". optional
    Value = false, -- initial state. optional
    Type = "Toggle", -- "Toggle" or "Checkbox". optional
    Locked = false, -- disable toggle. optional
    Flag = "my_toggle", -- for config saving. optional
    Callback = function()
        local HttpService = game:GetService("HttpService")
        local TeleportService = game:GetService("TeleportService")
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local servers = {}
        local cursor = ""

        repeat
            local url =
                "https://games.roblox.com/v1/games/"
                .. game.PlaceId
                .. "/servers/Public?sortOrder=Asc&limit=100"
                .. (cursor ~= "" and "&cursor=" .. cursor or "")

            local success, res = pcall(function()
                return HttpService:JSONDecode(game:HttpGet(url))
            end)

            if success and res and res.data then
                for _, srv in ipairs(res.data) do
                    if srv.playing
                        and srv.playing >= 1
                        and srv.playing < srv.maxPlayers
                        and srv.id ~= game.JobId then

                        table.insert(servers, srv)
                    end
                end
                cursor = res.nextPageCursor
            else
                break
            end
        until not cursor or #servers >= 200

        table.sort(servers, function(a, b)
            return a.playing < b.playing
        end)

        if servers[1] then
            pcall(function()
                TeleportService:TeleportToPlaceInstance(
                    game.PlaceId,
                    servers[1].id,
                    LocalPlayer
                )
            end)
        end
    end
})













