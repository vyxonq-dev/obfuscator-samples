-- LOL GUI V1 - by L0OLKIDD0
local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LOL_GUI"
gui.ResetOnSpawn = false
gui.Parent = plr:WaitForChild("PlayerGui")

-- notification
game:GetService("StarterGui"):SetCore("SendNotification", { 
	Title = "Made by L0OLKIDD0";
	Text = "SUB AND ENJOY!";
	Icon = "rbxthumb://type=Asset&id=91918175264782&w=150&h=150"})
Duration = 15;

-- Main Frame
local main = Instance.new("Frame")
local originalSize = UDim2.new(0, 460, 0, 350)
main.Size = originalSize
main.Position = UDim2.new(0.5, -230, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
title.Text = "LOL GUI V1"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.TextStrokeTransparency = 0.8
title.Parent = main

-- Status Label
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -10, 0, 20)
status.Position = UDim2.new(0, 5, 0, 32)
status.BackgroundTransparency = 1
status.TextColor3 = Color3.fromRGB(255, 255, 255)
status.Font = Enum.Font.SourceSans
status.TextSize = 14
status.Text = ""
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = main

-- Minimize Button
local minimizeBtn = Instance.new("TextButton")
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
minimizeBtn.Position = UDim2.new(1, -30, 0, 2)
minimizeBtn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
minimizeBtn.Text = "-"
minimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeBtn.Font = Enum.Font.SourceSansBold
minimizeBtn.TextSize = 18
minimizeBtn.BorderSizePixel = 0
minimizeBtn.Parent = main
local minimized = false

-- Scrollable Frame
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 1, -60)
scrollFrame.Position = UDim2.new(0, 0, 0, 55)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 6
scrollFrame.CanvasSize = UDim2.new(0,0,0,0)
scrollFrame.Parent = main

-- UIListLayout
local listLayout = Instance.new("UIListLayout")
listLayout.Padding = UDim.new(0, 5)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Parent = scrollFrame

-- Update CanvasSize automatically
listLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollFrame.CanvasSize = UDim2.new(0,0,0,listLayout.AbsoluteContentSize.Y + 10)
end)

-- Run script function
local function runScriptString(str)
    if not str or str == "" then return false, "Empty script" end
    local ok, err = pcall(function()
        local f, lerr = loadstring(str)
        if not f then error("loadstring error: "..tostring(lerr)) end
        local s_ok, s_err = pcall(f)
        if not s_ok then error("runtime error: "..tostring(s_err)) end
    end)
    return ok, err
end

-- Create button function
local function createButton(name, script)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, -10, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(80,0,0)
    btn.TextColor3 = Color3.fromRGB(255,255,255)
    btn.Font = Enum.Font.SourceSansBold
    btn.TextSize = 15
    btn.Text = name
    btn.BorderSizePixel = 0
    btn.Parent = scrollFrame

    btn.MouseButton1Click:Connect(function()
        if script ~= "" then
            status.Text = "Running: "..name
            local ok, runerr = runScriptString(script)
            if ok then
                status.Text = "Executed: "..name
            else
                status.Text = "Error: "..tostring(runerr)
                warn("Script error for "..name..": "..tostring(runerr))
            end
        else
            status.Text = "Empty button clicked: "..name
        end
    end)
end

-- Original 22 buttons
local originalButtons = {
    {Name='Axur Bypasser v2', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Axur-Bypasser-V2-48316'))()"},
    {Name='Ban Hammer', Script="loadstring(game:HttpGet('https://pastebin.com/raw/zGhJpZcg'))()"},
    {Name='Server Admin', Script="loadstring(game:HttpGet('https://raw.githubusercontent.com/gObl00x/Pendulum-Fixed-AND-Others-Scripts/refs/heads/main/Server%20Admin'))()"},
    {Name='Caducus', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Caducus-the-fallen-god-script-53019'))()"},
    {Name='Backflip & Frontflip', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Universal-Frontflip-and-Backflip-Tools-47199'))()"},
    {Name='Fling GUI', Script="loadstring(game:HttpGet('https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt'))()"},
    {Name='FE Fly', Script="loadstring(game:HttpGet('https://pastebin.com/raw/eKjmz6Hj'))()"},
    {Name='Goner', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Goner-47954'))()"},
    {Name='Kidnap', Script="loadstring(game:HttpGet('https://pastebin.com/raw/vP2D2vnC'))()"},
    {Name='Super Ring Parts', Script="loadstring(game:HttpGet('https://pastefy.app/QhY8pcfk/raw'))()"},
    {Name='Spectrum Glitcher', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Spectrum-Glitcher-47547'))()"},
    {Name='Sit GUI', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Sit-gui-51529'))()"},
    {Name='FE John Doe', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-John-Doe-Script-46855'))()"},
    {Name='Grab Knife', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Grab-knife-v4-24753'))()"},
    {Name='suicide gun', Script="loadstring(game:HttpGet('https://pastefy.app/xxRyJ8xN/raw'))()"},
    {Name='Xester-v1', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Xester-V1-46145'))()"},
    {Name='Xester-Astra', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Xester-astra-44171'))()"},
    {Name='Xester-Monster', Script="loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-Roblox-VEREUS-monster-script-3746'))()"},
    {Name='fe guest 666', Script='loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-Guest-666-Only-anims-are-fe-53309"))()'},
    {Name='bluudud', Script='loadstring(game:HttpGet("https://pastebin.com/raw/CcHxT0Gj"))()'},
    {Name='Pandora fe', Script='loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Pandora-Fe-55559"))()'},
    {Name='Forsaken C00lkidd', Script='loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-C00lKidd-Forsaken-UNIVERSAL-FOR-R6-44107"))()'},
}

-- Create original buttons
for _, cfg in ipairs(originalButtons) do
    createButton(cfg.Name, cfg.Script)
end

-- Empty buttons individually (all separate)
createButton("black niga",'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-JOHN-DOE-GUI-40303"))()')
createButton("forsaken john doe", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-forsaken-cript-builder-john-doe-script-40004"))()')
createButton("ultra john doe", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Client-Replication-ULTRA-JOHN-DOE-39837"))()')
createButton("Nekos Hub v2", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Nekos-Hub-V2-41014"))()')
createButton("ultimate troll gui", 'loadstring(game:HttpGet("https://pastefy.app/eQA7OWqN/raw"))()')
createButton("cartola hub", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-Cartola-Hub-47454"))()')
createButton("no fe snake", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Avtor1zaTion/NO-FE-SNAKE/refs/heads/main/NO-FE-Snake.txt'))()")
createButton("ps", 'loadstring(game:HttpGet("https://gist.githubusercontent.com/Tesker-103/ed48b3ae8120b0c040584b661cbda063/raw/210408b3f107dc740a4c9b832bfa647f92aa25d1/FreePrivateServerGUI"))()')
createButton("john doe", 'loadstring(game:HttpGet("https://pastebin.com/raw/JwUdxg8y"))()')
createButton("Fe Sin Dragon", 'loadstring(game:HttpGet("https://pastebin.com/raw/2aRWmwRF"))()')
createButton("sus gui", 'loadstring(game:HttpGet("https://protected-roblox-scripts.onrender.com/2219bf48b54cd405ed94c32097f07c21"))()')
createButton("flash", 'loadstring(game:HttpGet("https://pastefy.app/hUB1FSPB/raw"))()')
createButton("time stop", 'loadstring(game:HttpGet("https://pastebin.com/raw/pzxK2xx7"))()')
createButton("Ro-Xploit 6.0", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ro-xploit-6-9233"))()')
createButton("the snail", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-THE-Snail-script-V2-41060"))()')
createButton("gojo", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gojo-21950"))()')
createButton("delta keyboard", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()')
createButton("MLG GUN", 'loadstring(game:HttpGet("https://gist.githubusercontent.com/zupersponge/8c39ed77f2817679294d70aff18d479d/raw/ed5e04b72c4fa77b8bf522d7275abf64ae585416/MLG%2520Gun%2520Script%2520ROBLOX"))()')
createButton("RobHub", 'loadstring(game:HttpGet("https://pastebin.com/raw/KSvbtcPE"))()')
createButton("Fe Big Hand", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/hand"))()')
createButton("raining tacos 1", 'loadstring(game:HttpGet("https://pastebin.com/raw/D0yLFy5Y"))()')
createButton("raining tacos 2", 'loadstring(game:HttpGet("https://pastebin.com/raw/Yx05z4L5"))()')
createButton("L0OLKIDD0 executor", 'loadstring(game:HttpGet("https://pastebin.com/raw/iGCRYy1A"))()')
createButton("L0OLKIDD0 backdoor", 'loadstring(game:HttpGet("https://pastebin.com/raw/pyxmE9KF"))()')
createButton("LOL dance", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/L0OLKIDD0/K1ng-dance/refs/heads/main/K1NG%20dance"))()')
createButton("hacker x", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Hacker%20X"))()')
createButton("epic dancezz", 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Epik-R6-Dancezz-42246"))()')
createButton("no more games", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/L0OLKIDD0/No-more-games-tool/refs/heads/main/No%20more%20games%20tool"))()')
createButton("ban hammer", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/nicolasbarbosa323/ban-hammer/refs/heads/main/ban"))()')
createButton("su tart", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Sutart"))()')
createButton("mystic", 'loadstring(game:HttpGet("https://pastefy.app/7R72UhO9/raw"))()')
createButton("scary donald McDonald", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/HappyCow91/RobloxScripts/refs/heads/main/ClientSided/clown.lua"))()')
createButton("gyatt r15 fe", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/L0OLKIDD0/Gyatt-fe-script-r15/refs/heads/main/Gyatt%20fe%20r15"))()')
createButton("john doe eyes effect", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/L0OLKIDD0/John-doe-eyes-effect/refs/heads/main/John%20doe%20eyes%20effect"))()')
createButton("LOL SOUND", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/L0OLKIDD0/LOL-SOUND/refs/heads/main/Lol%20sound"))()')
createButton("hd admin fe", 'loadstring(game:HttpGet("https://pastebin.com/raw/ruSm9UBf", true))()')

-- Close button
local bottomClose = Instance.new("TextButton")
bottomClose.Size = UDim2.new(1,0,0,30)
bottomClose.Position = UDim2.new(0,0,1,-30)
bottomClose.BackgroundColor3 = Color3.fromRGB(120,0,0)
bottomClose.TextColor3 = Color3.fromRGB(255,255,255)
bottomClose.Font = Enum.Font.SourceSansBold
bottomClose.TextSize = 18
bottomClose.Text = "Close"
bottomClose.BorderSizePixel = 0
bottomClose.Parent = main
bottomClose.MouseButton1Click:Connect(function() gui:Destroy() end)

-- Minimize button function
minimizeBtn.MouseButton1Click:Connect(function()
    if not minimized then
        main.Size = UDim2.new(0,200,0,40)
        scrollFrame.Visible = false
        bottomClose.Visible = false
        status.Visible = false
        minimized = true
        minimizeBtn.Text = "+"
    else
        main.Size = originalSize
        scrollFrame.Visible = true
        bottomClose.Visible = true
        status.Visible = true
        minimized = false
        minimizeBtn.Text = "-"
    end
end)

-- GUI Toggle Button (Always top-right)
local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 40, 0, 25)
toggleBtn.AnchorPoint = Vector2.new(1,0)
toggleBtn.Position = UDim2.new(1, -5, 0, 5)
toggleBtn.BackgroundColor3 = Color3.fromRGB(180,0,0)
toggleBtn.TextColor3 = Color3.fromRGB(255,255,255)
toggleBtn.Font = Enum.Font.SourceSansBold
toggleBtn.TextSize = 18
toggleBtn.Text = "Hide"
toggleBtn.BorderSizePixel = 0
toggleBtn.Parent = gui

local guiVisible = true
toggleBtn.MouseButton1Click:Connect(function()
    guiVisible = not guiVisible
    main.Visible = guiVisible
    if guiVisible then
        toggleBtn.Text = "Hide"
    else
        toggleBtn.Text = "Show"
    end
end)

-- Mobile tweaks
gui.DisplayOrder = 999
gui.IgnoreGuiInset = true
