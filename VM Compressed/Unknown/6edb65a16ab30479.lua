local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local playerGui = player:WaitForChild("PlayerGui")

-- --- NOTIFICATION SYSTEM (ENGLISH) ---
local function Notify(title, message, color)
    local notifyGui = playerGui:FindFirstChild("BX_Notify") or Instance.new("ScreenGui", playerGui)
    notifyGui.Name = "BX_Notify"
    notifyGui.DisplayOrder = 100
    
    local container = Instance.new("Frame", notifyGui)
    container.Size = UDim2.new(0, 260, 0, 80)
    container.Position = UDim2.new(1, 50, 0.8, 0) -- Starts off-screen
    container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    container.BorderSizePixel = 2
    container.BorderColor3 = color or Color3.fromRGB(0, 0, 0)

    local t = Instance.new("TextLabel", container)
    t.Size = UDim2.new(0.8, 0, 0.4, 0); t.Position = UDim2.new(0, 10, 0.1, 0)
    t.Text = tostring(title):upper(); t.Font = Enum.Font.SourceSansBold
    t.TextSize = 16; t.TextColor3 = Color3.new(0,0,0); t.BackgroundTransparency = 1; t.TextXAlignment = Enum.TextXAlignment.Left

    local m = Instance.new("TextLabel", container)
    m.Size = UDim2.new(0.9, 0, 0.4, 0); m.Position = UDim2.new(0, 10, 0.5, 0)
    m.Text = tostring(message); m.TextSize = 14; m.Font = Enum.Font.SourceSans
    m.BackgroundTransparency = 1; m.TextXAlignment = Enum.TextXAlignment.Left; m.TextWrapped = true

    local closeBtn = Instance.new("TextButton", container)
    closeBtn.Size = UDim2.new(0, 25, 0, 25); closeBtn.Position = UDim2.new(1, -30, 0, 5)
    closeBtn.Text = "X"; closeBtn.BorderSizePixel = 1; closeBtn.BackgroundColor3 = Color3.new(1,1,1)

    -- Entrance Animation
    container:TweenPosition(UDim2.new(1, -280, 0.8, 0), "Out", "Quart", 0.5, true)

    local function Leave()
        container:TweenPosition(UDim2.new(1, 50, 0.8, 0), "In", "Quart", 0.5, true, function()
            container:Destroy()
        end)
    end

    closeBtn.MouseButton1Click:Connect(Leave)
    task.delay(5, Leave) -- Auto-leave after 5 seconds
end

-- --- SPINNING LOGO (120x120) ---
local logoGui = Instance.new("ScreenGui", playerGui)
logoGui.Name = "LogoGui"; logoGui.ResetOnSpawn = false

local logoButton = Instance.new("ImageButton", logoGui)
logoButton.Size = UDim2.new(0, 120, 0, 120) 
logoButton.Position = UDim2.new(0, 40, 0.8, 0)
logoButton.Image = "rbxassetid://113894403478758"
logoButton.BackgroundTransparency = 1
logoButton.AnchorPoint = Vector2.new(0.5, 0.5)

task.spawn(function()
    while true do
        logoButton.Rotation = logoButton.Rotation + 1
        task.wait(0.01)
    end
end)

-- --- LOGO CLICK MESSAGE ---
local msgFrame = Instance.new("Frame", logoGui)
msgFrame.Size = UDim2.new(0, 320, 0, 160)
msgFrame.Position = UDim2.new(0.5, -160, -0.5, 0)
msgFrame.BackgroundColor3 = Color3.new(1, 1, 1)
msgFrame.BorderSizePixel = 2
msgFrame.BackgroundTransparency = 1

local msgText = Instance.new("TextLabel", msgFrame)
msgText.Size = UDim2.new(1, -20, 1, -20); msgText.Position = UDim2.new(0, 10, 0, 10)
msgText.Text = "Thank For execute my Script Follow me in Tiktok Gato Osvaldo Or Roblox Perfil Lucas1029285 Thanks for executed script"
msgText.Font = Enum.Font.SourceSansItalic; msgText.TextSize = 18; msgText.TextWrapped = true
msgText.BackgroundTransparency = 1; msgText.TextTransparency = 1

logoButton.MouseButton1Click:Connect(function()
    TweenService:Create(msgFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    TweenService:Create(msgText, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    msgFrame:TweenPosition(UDim2.new(0.5, -160, 0.4, 0), "Out", "Back", 0.6, true)
    
    task.wait(6)
    
    TweenService:Create(msgFrame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(msgText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    msgFrame:TweenPosition(UDim2.new(0.5, -160, -0.5, 0), "In", "Quart", 0.5, true)
end)

-- --- MAIN EXECUTOR (SQUARE STYLE) ---
local mainGui = Instance.new("ScreenGui", playerGui)
mainGui.Name = "BuilderX_Main"; mainGui.ResetOnSpawn = false

local main = Instance.new("Frame", mainGui)
main.Size = UDim2.new(0, 600, 0, 350)
main.Position = UDim2.new(0.5, -300, 0.5, -175)
main.BackgroundColor3 = Color3.new(1, 1, 1); main.BorderSizePixel = 1
main.Active = true; main.Draggable = true

local function createHeader(txt, size, pos, tSize)
    local l = Instance.new("TextLabel", main)
    l.Size = size; l.Position = pos; l.BackgroundColor3 = Color3.new(1, 1, 1)
    l.BorderSizePixel = 1; l.Text = txt; l.Font = Enum.Font.SourceSans; l.TextSize = tSize or 16
    return l
end

createHeader("made by\nGato Osvaldo", UDim2.new(0.2, 0, 0.15, 0), UDim2.new(0, 0, 0, 0))
createHeader("builderx", UDim2.new(0.4, 0, 0.15, 0), UDim2.new(0.2, 0, 0, 0), 32)
createHeader("made by\nGato Osvaldo", UDim2.new(0.2, 0, 0.15, 0), UDim2.new(0.6, 0, 0, 0))
createHeader("Cloud Hub", UDim2.new(0.2, 0, 0.15, 0), UDim2.new(0.8, 0, 0, 0), 20)

local editor = Instance.new("TextBox", main)
editor.Size = UDim2.new(0.75, -20, 0.55, 0); editor.Position = UDim2.new(0.02, 0, 0.2, 0)
editor.MultiLine = true; editor.PlaceholderText = "Paste script here..."; editor.Text = ""
editor.BackgroundColor3 = Color3.fromRGB(160, 160, 160); editor.BorderSizePixel = 1
editor.Font = Enum.Font.Code; editor.ClearTextOnFocus = false

local execBtn = Instance.new("TextButton", main)
execBtn.Size = UDim2.new(0.35, 0, 0.12, 0); execBtn.Position = UDim2.new(0.02, 0, 0.82, 0)
execBtn.Text = "Execute"; execBtn.BackgroundColor3 = Color3.new(1, 1, 1); execBtn.BorderSizePixel = 1

local wipeBtn = Instance.new("TextButton", main)
wipeBtn.Size = UDim2.new(0.35, 0, 0.12, 0); wipeBtn.Position = UDim2.new(0.40, 0, 0.82, 0)
wipeBtn.Text = "Wipe"; wipeBtn.BackgroundColor3 = Color3.new(1, 1, 1); wipeBtn.BorderSizePixel = 1

local listFrame = Instance.new("ScrollingFrame", main)
listFrame.Size = UDim2.new(0.2, -10, 0.75, 0); listFrame.Position = UDim2.new(0.8, 5, 0.2, 0)
listFrame.BackgroundColor3 = Color3.new(1, 1, 1); listFrame.BorderSizePixel = 1
Instance.new("UIListLayout", listFrame).Padding = UDim.new(0, 5)

local function addScript(name, code)
    local b = Instance.new("TextButton", listFrame)
    b.Size = UDim2.new(0.95, 0, 0, 35); b.Text = name; b.BackgroundColor3 = Color3.new(1, 1, 1); b.BorderSizePixel = 1
    b.MouseButton1Click:Connect(function()
        Notify("Script Manager", "Running " .. name, Color3.fromRGB(0, 150, 255))
        loadstring(code)()
    end)
end

-- --- LISTA DE SCRIPTS ATUALIZADA ---
addScript("Assassin", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Ice0002/Assassin/main/Script"))()')
addScript("Pandora", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/pandora"))()')
addScript("Red Sword", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ProBypasserHax1/Idkkk/refs/heads/main/Red%20Sword%20Pickaxe.txt"))()')
addScript("Ban Lua", 'loadstring(game:HttpGet("https://pastefy.app/Nh7FVtvC/raw"))()')
addScript("Glock.txt", 'loadstring(game:HttpGet("https://pastebin.com/raw/NgrMvNXZ"))()')
addScript("Dead Eye", 'loadstring(game:HttpGet("https://pastebin.com/raw/pKQ70ey7"))()')
addScript("Plasma Shotgun", 'loadstring(game:HttpGet("https://pastebin.com/raw/CDawtPMV"))()')
addScript("Teclado", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()')

-- NOVOS SCRIPTS ADICIONADOS
addScript("Rainbow Banisher", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Rainbow%20Banisher"))()')
addScript("Kirito Blades", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/nicolasbarbosa323/the-angel/refs/heads/main/Kirito%20Blades.txt"))()')
addScript("Assignment", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/TEST19983/Assigment/refs/heads/main/Assignment"))()')
addScript("Pastefy Script", 'loadstring(game:HttpGet("https://pastefy.app/1RhJtgDi/raw"))()')

execBtn.MouseButton1Click:Connect(function()
    if editor.Text ~= "" then
        Notify("Executor", "Script executed successfully!", Color3.fromRGB(0, 200, 100))
        loadstring(editor.Text)()
    end
end)

wipeBtn.MouseButton1Click:Connect(function()
    editor.Text = ""
    Notify("Executor", "Editor cleared.", Color3.fromRGB(255, 100, 0))
end)

Notify("BuilderX", "Gato Osvaldo Loaded!", Color3.fromRGB(0, 0, 0))
