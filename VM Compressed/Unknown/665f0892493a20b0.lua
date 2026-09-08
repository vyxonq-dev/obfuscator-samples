  -- ⭐ STAR LOGGER: PRO EDITION (FIXED)
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "StarLoggerFixedFinal"

-- MAIN FRAME
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BackgroundTransparency = 0.15
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -190)
MainFrame.Size = UDim2.new(0, 520, 0, 380)
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)

-- RAINBOW STROKE
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Thickness = 3
local UIGradient = Instance.new("UIGradient", UIStroke)
UIGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 255))
})
task.spawn(function() while task.wait() do UIGradient.Rotation = UIGradient.Rotation + 2 end end)

-- TITLE
local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "⭐ STAR LOGGER"
Title.Font = Enum.Font.FredokaOne
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 22
Title.BackgroundTransparency = 1

-- NAVIGATION
local TabsFrame = Instance.new("Frame", MainFrame)
TabsFrame.Position = UDim2.new(0, 10, 0, 60)
TabsFrame.Size = UDim2.new(0, 110, 1, -70)
TabsFrame.BackgroundTransparency = 1
Instance.new("UIListLayout", TabsFrame).Padding = UDim.new(0, 8)

local ContentFrame = Instance.new("Frame", MainFrame)
ContentFrame.Position = UDim2.new(0, 130, 0, 60)
ContentFrame.Size = UDim2.new(1, -140, 1, -70)
ContentFrame.BackgroundTransparency = 1 -- NO MORE BLUE BOX

local function createTab(name)
    local btn = Instance.new("TextButton", TabsFrame)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.Text = name
    btn.Font = Enum.Font.FredokaOne
    btn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", btn)
    
    local page = Instance.new("ScrollingFrame", ContentFrame)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.Visible = false
    page.BackgroundTransparency = 1 -- NO MORE GRAY BOX
    page.ScrollBarThickness = 2
    page.AutomaticCanvasSize = Enum.AutomaticSize.Y
    
    local layout = Instance.new("UIListLayout", page)
    layout.Padding = UDim.new(0, 10)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(ContentFrame:GetChildren()) do v.Visible = false end
        page.Visible = true
    end)
    return page
end

local LoggerPage = createTab("Logger")
local ScriptsPage = createTab("Scripts")
local ToolsPage = createTab("Tools")

-- --- LOGGER PAGE ---
local BoomboxBox = Instance.new("TextBox", LoggerPage)
BoomboxBox.Size = UDim2.new(0.95, 0, 0, 40)
BoomboxBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BoomboxBox.PlaceholderText = "Audio ID..."
BoomboxBox.Text = ""
BoomboxBox.Font = Enum.Font.FredokaOne
BoomboxBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", BoomboxBox)

local Controls = Instance.new("Frame", LoggerPage)
Controls.Size = UDim2.new(0.95, 0, 0, 40)
Controls.BackgroundTransparency = 1
Instance.new("UIListLayout", Controls).FillDirection = Enum.FillDirection.Horizontal
Instance.new("UIListLayout", Controls).Padding = UDim.new(0, 5)

local Preview = Instance.new("Sound", game.Workspace)
local function btn(txt, color, parent, fn)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(0.31, 0, 1, 0)
    b.BackgroundColor3 = color
    b.Text = txt
    b.Font = Enum.Font.FredokaOne
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(fn)
end

btn("PLAY", Color3.fromRGB(0, 180, 80), Controls, function()
    Preview.SoundId = "rbxassetid://" .. BoomboxBox.Text:match("%d+")
    Preview:Play()
end)
btn("STOP", Color3.fromRGB(200, 50, 50), Controls, function() Preview:Stop() end)
btn("SCAN", Color3.fromRGB(0, 120, 255), Controls, function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Sound") and v.SoundId ~= "" then
            local id = v.SoundId:match("%d+")
            if id and #id > 5 then -- ANTI-SPAM: Ignores IDs like "3"
                local l = Instance.new("TextButton", LoggerPage)
                l.Size = UDim2.new(0.9, 0, 0, 35)
                l.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
                l.Text = "ID: " .. id
                l.Font = Enum.Font.FredokaOne
                l.TextColor3 = Color3.fromRGB(220, 220, 220)
                Instance.new("UICorner", l)
                l.MouseButton1Click:Connect(function()
                    BoomboxBox.Text = id
                    setclipboard(id)
                end)
            end
        end
    end
end)

-- --- SCRIPTS PAGE ---
local IY = Instance.new("TextButton", ScriptsPage)
IY.Size = UDim2.new(0.9, 0, 0, 40)
IY.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
IY.Text = "Infinite Yield"
IY.Font = Enum.Font.FredokaOne
IY.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", IY)
IY.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)

local Soon = Instance.new("TextLabel", ScriptsPage)
Soon.Size = UDim2.new(1, 0, 0, 30)
Soon.BackgroundTransparency = 1
Soon.Text = "More coming soon! (Maybe)"
Soon.Font = Enum.Font.FredokaOne
Soon.TextColor3 = Color3.fromRGB(150, 150, 150)
Soon.TextSize = 14

-- --- TOOLS PAGE ---
local PFP = Instance.new("ImageLabel", ToolsPage)
PFP.Size = UDim2.new(0, 80, 0, 80)
PFP.Image = Players:GetUserThumbnailAsync(Player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
PFP.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", PFP).CornerRadius = UDim.new(1, 0)

local Name = Instance.new("TextLabel", ToolsPage)
Name.Size = UDim2.new(1, 0, 0, 30)
Name.BackgroundTransparency = 1
Name.Text = Player.Name
Name.Font = Enum.Font.FredokaOne
Name.TextColor3 = Color3.new(1, 1, 1)

local Stats = Instance.new("TextLabel", ToolsPage)
Stats.Size = UDim2.new(1, 0, 0, 100)
Stats.BackgroundTransparency = 1
Stats.Text = "Loading..."
Stats.Font = Enum.Font.FredokaOne
Stats.TextColor3 = Color3.new(0.8, 0.8, 0.8)

task.spawn(function()
    while task.wait(0.5) do
        local fps = math.floor(workspace:GetRealPhysicsFPS())
        local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
        Stats.Text = "FPS: "..fps.."\nPing: "..ping.."\nAge: "..Player.AccountAge.." Days\nTime: "..os.date("%X")
    end
end)

local RJ = Instance.new("TextButton", ToolsPage)
RJ.Size = UDim2.new(0.9, 0, 0, 35)
RJ.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
RJ.Text = "REJOIN SERVER"
RJ.Font = Enum.Font.FredokaOne
RJ.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", RJ)
RJ.MouseButton1Click:Connect(function() game:GetService("TeleportService"):Teleport(game.PlaceId, Player) end)

LoggerPage.Visible = true
