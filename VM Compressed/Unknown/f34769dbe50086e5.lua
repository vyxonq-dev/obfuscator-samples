--madeby Vann--
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "Vann Scripthub",
    Icon = "maximize", -- lucide icon
    Author = "by Vann ",
    Folder = "MySuperHub",
 
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "CottonCandy",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.50,
    HideSearchBar = true,
    ScrollBarEnabled = false,
 
    -- ↓ Optional. You can remove it.
    --[[ You can set 'rbxassetid://' or video to Background.
        'rbxassetid://':
            Background = "rbxassetid://", -- rbxassetid
        Video:
            Background = "video:YOUR-RAW-LINK-TO-VIDEO.webm", -- video 
    --]]
 
    -- ↓ Optional. You can remove it.
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
 
    --       remove this all, 
    -- !  ↓  if you DON'T need the key system
    KeySystem = { 
        -- ↓ Optional. You can remove it.
        Key = { "Vann-520-basic", "1" },
 
        Note = "",
 
        -- ↓ Optional. You can remove it.
        Thumbnail = {
            Image = "rbxassetid://",
            Title = "Thumbnail",
        },
 
        -- ↓ Optional. You can remove it.
        URL = "YOUR LINK TO GET KEY (Discord, Linkvertise, Pastebin, etc.)",
 
        -- ↓ Optional. You can remove it.
        SaveKey = true, -- automatically save and load the key.
 
        -- ↓ Optional. You can remove it.
        -- API = {} ← Services. Read about it below ↓
    },
})
 
local Tab = Window:Tab({
    Title = "scripts",
    Icon = "scroll-text", -- optional
    Locked = false,
})
 
local Button = Tab:Button({
    Title = "Excavator By 00de0l",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://pastefy.app/ug6v3dyk/raw'))()
    end
})
local Button = Tab:Button({
    Title = "S3cr3t v1",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/WLpY4JAA/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Deathdosla by 00de0l",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/FVBs34eb/raw"))()
    end
})
local Button = Tab:Button({
    Title = "McDonalds",
    Desc = "",
    Locked = false,
    Callback = function()
    local obj = game:GetObjects("rbxassetid://4572305378")[1]
obj.Parent = workspace
    end
})
local Button = Tab:Button({
    Title = "Mega Coffee",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/N7iqVqPy/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Ciggarrete",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/y8DYC1Lk"))()
    end
})
local Button = Tab:Button({
    Title = "Venguim logo by 00de0l",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/XSSHMtuF/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "Project Xperius",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/XHAw1PmE/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "Megma revival",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/8YNEmqGc/raw"))()
    end
})
local Button = Tab:Button({
    Title = "segma v4",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/a2VxTbDs/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Secret Service Agent Base",
    Desc = "",
    Locked = false,
    Callback = function()
    local obj = game:GetObjects("rbxassetid://7245216352")[1]
obj.Parent = workspace
 
local base = obj:WaitForChild("Base")
    end
})
local Button = Tab:Button({
    Title = "Pepsi gui v19",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/4QtUj8wC/raw"))()
    end
})
local Button = Tab:Button({
    Title = "MD by cle0n",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/YnAWPTSM/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "SheldonSS",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/WQIxbW4t/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Burger King",
    Desc = "",
    Locked = false,
    Callback = function()
    local obj = game:GetObjects("rbxassetid://17344126644")[1]
obj.Parent = workspace
    end
})
local Button = Tab:Button({
    Title = "Mosque",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/ErWjbvXC/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Luayhen SSP",
    Desc = "",
    Locked = false,
    Callback = function()
    getgenv().RemoveCredits=false
loadstring(game:HttpGet("https://pastefy.app/lobSgKWB/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Grandosla by 00de0l",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/kdE1b05N/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "team EPR Gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/jzbjYwrg"))()
    end
})
local Button = Tab:Button({
    Title = "Vann and TreeZX Scripthub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/EpJj225y"))()
    end
})
local Button = Tab:Button({
    Title = "Polaria remake by S3cr3t",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/pUs2hYI5/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Vann gui dev version",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/Hzd9kKrx/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "Darius v13",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/uL9nsuX8/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Project soulhack62 v2",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/28HF3BtT"))()
    end
})
local Button = Tab:Button({
    Title = "Gui by s3cr3t",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/yhlKUP9v/raw"))()
    end
})
local Button = Tab:Button({
    Title = "S3cr3t gui",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/FuCEflEY/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Project S3mex",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/74rIm3NW/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Venguim by s3cr3t",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/j3yYUlLX/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Project S3cr3t v2",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/dngZX2tP/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Project T1x5",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/KH77SbRu"))()
    end
})
local Button = Tab:Button({
    Title = "Project Soulhack v3",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/rFQykm91"))()
    end
})
local Button = Tab:Button({
    Title = "Sledgehammer by 00de0l",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/7GOfHGXD/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Plane",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/eeOmAGQB/raw"))()
    end
})
local Button = Tab:Button({
    Title = "SSP by broken spawn and 1x1x1x11",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/YxquFEAR",true))()
    end
})
local Button = Tab:Button({
    Title = "Roblox SS Executor",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/bvawnSDa",true))()
    end
})
local Button = Tab:Button({
    Title = "Project S3cr3t Ultimate",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/FfKpPBgi/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "SSP by luayhen old",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/g4EHHDc7/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Sheldoni by Champions",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/WQIxbW4t/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Map hub",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/iqkHg0jm"))()
    end
})
local Button = Tab:Button({
    Title = "Thank you project upgrade",
    Desc = "",
    Locked = false,
    Callback = function()
 
    end
})
local Button = Tab:Button({
    Title = "Soulhack62 SS/Executor",
    Desc = "",
    Locked = false,
    Callback = function()
 
    end
})
local Button = Tab:Button({
    Title = "loadstring hax",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastebin.com/raw/innnyYTP"))()
    end
})
local Button = Tab:Button({
    Title = "project S3cr3t latest",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/ztfui56k/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Full function excavator",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet('https://pastefy.app/ug6v3dyk/raw'))()
    end
})
local Button = Tab:Button({
    Title = "Classic house",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/wWcCu5Rj/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Grandosla by 00de0l full function",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/kdE1b05N/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "arabic map",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/HZvrfLES/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "Project Euphoria (old)",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/TEST19983/Realrhejrj/refs/heads/main/Refjf",true))()
    end
})
local Button = Tab:Button({
    Title = "Project Euphoria v2 remake",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/MD4xvkgS/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Soulhack62 SS/Executor",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/plEj00XG/raw",true))()
    end
})
local Button = Tab:Button({
    Title = "Road rogue",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/9gxSdisY/raw"))()
    end
})
local Button = Tab:Button({
    Title = "k00p v11",
    Desc = "",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/rI7DmyrJ/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Stummy Guns",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastebin.com/raw/3XPaYv08",true))()
    end
})
local Button = Tab:Button({
    Title = "Dex Honey Lua",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/Nk1lefZ2/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Project Brokenspawn v5.1.0",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/KsPxulpZ/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Private Gui by Joxnaxeex",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/3ZSMrM2X/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Project S3cr3t Update v6",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/dMdu0dKu/raw"))()
    end
})
local Button = Tab:Button({
    Title = "Project S3cr3t Update v5",
    Desc = "",
    Locked = false,
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/ztfui56k/raw"))()
    end
})