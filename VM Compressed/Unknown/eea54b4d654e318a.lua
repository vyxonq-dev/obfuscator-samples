local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local Window = WindUI:CreateWindow({
    Title = "QUANGLOVUONG🤓🤯☝️☝️[NEW-BETA]",
    Icon = "montitor", -- lucide icon
    Author = "Quang",
    Folder = "QUANGLOVUONG",
    
    -- ↓ This all is Optional. You can remove it.
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    
   
            Background = "rbxassetid://107284185028",
        
    
    -- ↓ Optional. You can remove it.
    User = {
        Enabled = true,
        Anonymous = true,
        Callback = function()
            print("clicked")
        end,
    },
    
})
local Tab = Window:Tab({
    Title = "🍍Script Blox Fruit🍍",
    Icon = "solar:cursor-square-bold", -- optional
    Locked = false,
})
local Button = Tab:Button({
    Title = "NAGIHUB✳️",
    Desc = "KEY : coresfruit",
    Locked = false,
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/platformdiamond/BloxFruits-/refs/heads/main/Blox%20fruit"))()    
    end
})                                                                                                                                                              

 local Button = Tab:Button({
    Title = "King-Rua-Hub🏅🐢",
    Desc = "",
    Locked = false,
    Callback = function()
        repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer loadstring(game:HttpGet("https://raw.githubusercontent.com/shinichi-dz/phucshinyeuem/refs/heads/main/KingRuaHub.lua"))()
    end
})
local Button = Tab:Button({
    Title = "Tuấn Anh IOS🍎",
    Desc = "",
    Locked = false,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AnhTuanDzai-Hub/TuanAnhIOS/refs/heads/main/TuanAnhIOS.lua"))()
    end
})
local Button = Tab:Button({
    Title = "🤖Trẩu-hubv9🤖",
    Desc = "",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/trungdao2k4/buffalo/refs/heads/main/traurobloxv9.lua"))() 
    end
})
local Button = Tab:Button({
    Title = "ServerhopV1🖨",
    Desc = "",
    Locked = false,
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/xSync-gg/VisionX/refs/heads/main/Server_Finder.lua"))()
    end
})
local Tab = Window:Tab({
Title = "⚙️Config⚙️",
    Icon = "solar:cursor-square-bold", -- optional
    Locked = false,
})                                                                                                                                                                                                                   
local Dropdown = Tab:Dropdown({
    Title = "🌃⚙️Chỉnh Hình Nền HACK QUANGLOVUONG⚙️🖼",
    Values = {
        {
            Title = "Con Mèo Cười=)",
            Desc = "mèo hahaha",
            Icon = "solar:cursor-square-bold",
            Callback = function() 
              Window:SetBackgroundImage("rbxassetid://107284084185028")
            end
        },
        {
            Title = "Mặc Định",
            Desc = "bình thường",
            Icon = "solar:cursor-square-bold",
            Callback = function() 
                Window:SetBackgroundImage("rbxassetid://id-here")
            end
        },
        {
            Title = "Gojo vs Sukuna tết",
            Desc = "",
            Icon = "",
            Callback = function() 
              Window:SetBackgroundImage("rbxassetid://94514085778725")  
            end
        },
        { Type = "Divider", },
        {
            Title = "SẮP CÓ",
            Desc = "",
            Icon = "",
            Callback = function() 
                print("Clicked 'Delete file'")
            end
        },
    }
})
    
