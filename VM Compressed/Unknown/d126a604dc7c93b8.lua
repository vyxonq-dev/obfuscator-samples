if not game:IsLoaded() then game.Loaded:Wait() end

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")

-- Destroy old GUI
if CoreGui:FindFirstChild("PineapplePack") then
    CoreGui.PineapplePack:Destroy()
end

local THEME = {
    Background = Color3.fromRGB(15, 15, 15),
    Dark = Color3.fromRGB(25, 25, 25),
    Yellow = Color3.fromRGB(255, 255, 0),
    White = Color3.fromRGB(255, 255, 255),
    LightDark = Color3.fromRGB(45, 45, 45),
    Green = Color3.fromRGB(0, 255, 0),
    Red = Color3.fromRGB(180, 0, 0),
}

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PineapplePack"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

-- Main Frame
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0, 680, 0, 400)
Main.Position = UDim2.new(0.5, -340, 0.5, -200)
Main.BackgroundColor3 = THEME.Background
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = Main

-- Title Bar
local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.BackgroundColor3 = THEME.Dark
TitleBar.Parent = Main

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 1, 0)
Title.BackgroundTransparency = 1
Title.Text = "🍍 Pineapple Pack"
Title.TextColor3 = THEME.Yellow
Title.Font = Enum.Font.GothamBold
Title.TextSize = 22
Title.Parent = TitleBar

-- Status Text
local StatusText = Instance.new("TextLabel")
StatusText.Name = "StatusText"
StatusText.Size = UDim2.new(0.9, 0, 0, 100)
StatusText.Position = UDim2.new(0.5, 0, 0.45, 0)
StatusText.AnchorPoint = Vector2.new(0.5, 0.5)
StatusText.BackgroundTransparency = 1
StatusText.Text = "Checking experience..."
StatusText.TextColor3 = THEME.White
StatusText.Font = Enum.Font.Gotham
StatusText.TextSize = 18
StatusText.TextWrapped = true
StatusText.TextXAlignment = Enum.TextXAlignment.Center
StatusText.TextYAlignment = Enum.TextYAlignment.Center
StatusText.Parent = Main

-- ====================== GAME DETECTION ======================
local placeId = game.PlaceId
print("Pineapple Pack → Current PlaceId:", placeId)

local function loadScript(url)
    if url and url ~= "" then
        local success, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if not success then
            warn("Pineapple Pack failed to load script:", err)
        end
    end
end



if placeId == 8737602449 then -- Pls Donate
    StatusText.Text = "Detected: Pls Donate!"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
    loadScript("https://pastebin.com/raw/BQB9jb61")

elseif placeId == 155615604 then -- Prison Life
    StatusText.Text = "Detected: Prison Life!"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
    loadScript("https://pastebin.com/raw/TJ1UKr25")

elseif placeId == 192800  then -- Work At A Pizza Place
    StatusText.Text = "Detected: Work At A Pizza Place!"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
    loadScript("https://pastebin.com/raw/1aWdGQr7")  -- you can change to the other one if preferred
elseif placeId == 3082002798 then
    StatusText.Text = "Detected: T-titans Battlegrounds!"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://pastebin.com/raw/RMXJ1mfL"))()
elseif placeId == 189707 then
    StatusText.Text = "Detected: Natural Disaster Survival!"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
    loadstring(game:HttpGet("https://pastebin.com/raw/kkAMdi2k"))()
elseif placeId == 6507422231 then
    StatusText.Text = "Detected: Twilight Daycare! (CHECK POPUP)"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
	loadstring(game:HttpGet("https://pastebin.com/raw/Wc02D3Dq"))()
--https://pastebin.com/BkYZ47Su
elseif placeId == 6961824067 then
    StatusText.Text = "Detected: AutoFarm FTAP"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
	loadstring(game:HttpGet("https://pastebin.com/raw/BkYZ47Su"))()

elseif placeId == 3851622790 then
    StatusText.Text = "Detected: Break in story!"
    StatusText.TextColor3 = THEME.Green
    task.wait(2)
    ScreenGui:Destroy()
	loadstring(game:HttpGet("https://pastebin.com/raw/5iQXpSKh))()
else
    -- Unsupported Game
    StatusText.Text = "Unsupported experience <: \nLoad universal script?"
    StatusText.TextColor3 = THEME.Yellow
    StatusText.Size = UDim2.new(0.9, 0, 0, 120)

    -- Yes Button
    local yesBtn = Instance.new("TextButton")
    yesBtn.Size = UDim2.new(0.35, 0, 0, 55)
    yesBtn.Position = UDim2.new(0.1, 0, 0.68, 0)
    yesBtn.BackgroundColor3 = THEME.Green
    yesBtn.Text = "Yes"
    yesBtn.TextColor3 = THEME.White
    yesBtn.Font = Enum.Font.GothamBold
    yesBtn.TextSize = 20
    yesBtn.Parent = Main
    Instance.new("UICorner", yesBtn).CornerRadius = UDim.new(0, 8)

    -- No Button
    local noBtn = Instance.new("TextButton")
    noBtn.Size = UDim2.new(0.35, 0, 0, 55)
    noBtn.Position = UDim2.new(0.55, 0, 0.68, 0)
    noBtn.BackgroundColor3 = THEME.Red
    noBtn.Text = "No, thanks!"
    noBtn.TextColor3 = THEME.White
    noBtn.Font = Enum.Font.GothamBold
    noBtn.TextSize = 20
    noBtn.Parent = Main
    Instance.new("UICorner", noBtn).CornerRadius = UDim.new(0, 8)

    yesBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
        loadScript("https://pastebin.com/raw/dwV9GGnS")
    end)

    noBtn.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)
end


-- don't steal without creds :D