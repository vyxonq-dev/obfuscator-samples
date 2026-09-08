-- POWERED BY: THE LUA | LAND🏝️
-- TESTER BY: ERIC,YOMATE,ZORO,MR.FILIPINO & YASUF SHOWCASE🏝️

pcall(function() game.CoreGui:FindFirstChild("LandNDGui"):Destroy() end)
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local sg = Instance.new("ScreenGui")
sg.Name = "LandNDGui"
sg.Parent = game.CoreGui
sg.ResetOnSpawn = false

-- The Best Script Ever!🏝️

local main = Instance.new("Frame")
main.Size = UDim2.new(0, 430, 0, 480)
main.Position = UDim2.new(0.13, 0, 0.13, 0)
main.BackgroundColor3 = Color3.fromRGB(50, 180, 220)
main.Active = true
main.Draggable = true
main.Parent = sg
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 16)

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -12, 1, -12)
scroll.Position = UDim2.new(0, 6, 0, 6)
scroll.BackgroundTransparency = 1
scroll.CanvasSize = UDim2.new(0, 0, 0, 1800)
scroll.ScrollBarThickness = 8
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Active = true

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0, 7)
layout.SortOrder = Enum.SortOrder.LayoutOrder

local title = Instance.new("TextLabel")
title.Text = "🏝️Lua | Land Natural Disaster 🏝️"
title.Size = UDim2.new(1, 0, 0, 44)
title.Font = Enum.Font.GothamBold
title.TextSize = 25
title.TextColor3 = Color3.fromRGB(255, 255, 210)
title.BackgroundTransparency = 1
title.LayoutOrder = 0
title.Parent = scroll

local function notify(msg, dur)
    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Land Natural Disaster",
            Text = msg,
            Duration = dur or 2.5
        })
    end)
end

local function addButton(txt, cb)
    local btn = Instance.new("TextButton")
    btn.Text = txt
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 18
    btn.Size = UDim2.new(1, -14, 0, 40)
    btn.BackgroundColor3 = Color3.fromRGB(80, 200, 240)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Parent = scroll
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
    btn.LayoutOrder = #scroll:GetChildren()
    btn.MouseButton1Click:Connect(cb)
    return btn
end

addButton("🏝️Seven7 Hub🏝️", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Seven7-lua/Roblox/refs/heads/main/Scripts/Games/Natural-Disaster-Survival.lua"))()
    notify("Seven7 Hub loaded!", 3)
end)

addButton("🏝️Six Hub🏝️", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/ySixxNz/Natural-Desastre/Six-Hub/NaturalDisaster'))()
    notify("Key Is: sixhub_key2024nicelol", 15)
end)

addButton("🏝️YokaiScript Hub🏝️", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Codexxscripts/Script/refs/heads/main/Protected_7867058958573066.lua.txt"))()
    notify("YokaiScript Hub loaded!", 3)
end)

addButton("🏝️Eclipse Hub🏝️", function()
    getgenv().mainKey = "nil"
    local a,b,c,d,e=loadstring,request or http_request or (http and http.request) or (syn and syn.request),assert,tostring,"https://api.eclipsehub.xyz/auth"
    c(a and b,"Executor not Supported")
    a(b({Url=e.."?key="..d(mainKey),Headers={["User-Agent"]="Eclipse"}}).Body)()
    notify("Eclipse Hub loaded!", 3)
end)

addButton("🏝️Nds Hub🏝️", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/KaterHub-Inc/NaturalDisasterSurvival/refs/heads/main/main.lua"))()
    notify("Nds Hub loaded!", 3)
end)

addButton("🏝️Rawnder🏝️", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/NaturalDisaster'))()
    notify("Rawnder loaded!", 3)
end)

addButton("🏝️Natural Disaster By: TheRobloxScripter🏝️", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/deway357/NaturalDisasterSurvival-Script/refs/heads/main/Script.lua"))()
    notify("Natural Disaster By: TheRobloxScripter loaded!", 3)
end)

addButton("🏝️Super Ring Parts (NO TEXT)🏝️", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LiverMods/Rawnder-NTDR/main/RingParts.lua"))()
    notify("Super Ring Parts loaded!", 3)
end)

addButton("🏝️Discord Server🏝️", function()
    setclipboard("https://discord.gg/Ms4SVXBaYT")
    notify("Discord link copied to clipboard!\nhttps://discord.gg/Ms4SVXBaYT", 5)
end)