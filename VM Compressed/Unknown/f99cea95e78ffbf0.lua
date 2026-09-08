--[[
    SKULL KEY SYSTEM 💀
    Local Hub / Skull Animation / VexonHub Loader
    Blacklist Protection System
]]

local KEY = "SKULL-1337" -- <<=== YOUR KEY
local DISCORD = "https://discord.gg/MFwf9JFmb"

-- === MANUAL BLACKLIST TABLE ===
local BLACKLIST = {
    -- Add usernames or IDs to block
    -- Format: ["Username"] = true,  or  [ID_number] = true,
    
    -- Examples by username:
    ["deathkiller10095"] = true,
    ["hunterixo"] = true, 
    ["sjsjsjsjsjsn168"] = true, 
    
    -- Examples by ID:
    [816366968] = true,
    [8921970261] = true,
}

local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr:WaitForChild("PlayerGui"))
gui.ResetOnSpawn = false

-- === SMOOTH SKULL ANIMATION (REDUCED COUNT) ===
local skullHolder = Instance.new("Frame", gui)
skullHolder.Size = UDim2.new(1, 0, 1, 0)
skullHolder.BackgroundTransparency = 1
skullHolder.Name = "SkullBackground"

local skulls = {}
for i = 1, 15 do -- Reduced from 35 to 15
    local s = Instance.new("TextLabel", skullHolder)
    s.Size = UDim2.new(0, 40, 0, 40)
    s.Position = UDim2.new(math.random(), 0, math.random(), 0)
    s.BackgroundTransparency = 1
    s.Text = (math.random(1, 2) == 1) and "💀" or "☠️"
    s.TextScaled = true
    s.TextColor3 = Color3.fromRGB(255, 255, 255)
    s.TextTransparency = math.random(10, 40) / 100
    s.ZIndex = 1
    table.insert(skulls, s)

    task.spawn(function()
        local speed = math.random(20, 40) / 100 -- Different speeds for each skull
        local startX = math.random()
        local startY = math.random()
        local angle = 0
        
        while s.Parent do
            angle = angle + speed
            local x = startX + math.sin(angle * 0.5) * 0.1
            local y = startY + math.cos(angle * 0.3) * 0.1
            
            s.Position = UDim2.new(x, 0, y, 0)
            s.Rotation = math.sin(angle) * 15
            s.TextSize = 30 + math.sin(angle * 2) * 10
            s.TextTransparency = 0.2 + math.sin(angle * 1.5) * 0.2
            
            task.wait(0.05) -- Smoother animation
        end
    end)
end

-- === KEY INPUT WINDOW ===
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 200) -- Slightly taller
main.Position = UDim2.new(0.5, -160, 0.45, -100)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 2
main.BorderColor3 = Color3.fromRGB(255, 50, 50)
main.ZIndex = 2

local UICorner = Instance.new("UICorner", main)
UICorner.CornerRadius = UDim.new(0, 10)

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, -20, 0, 40)
title.Position = UDim2.new(0, 10, 0, 10)
title.BackgroundTransparency = 1
title.Text = "💀 SKULL KEY SYSTEM 💀"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBlack
title.ZIndex = 3

local input = Instance.new("TextBox", main)
input.Size = UDim2.new(0.9, 0, 0, 40)
input.Position = UDim2.new(0.05, 0, 0.35, 0)
input.PlaceholderText = "Enter Skull Key..."
input.Text = ""
input.ClearTextOnFocus = false
input.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Font = Enum.Font.Gotham
input.TextScaled = true
input.ZIndex = 3

local UICorner2 = Instance.new("UICorner", input)
UICorner2.CornerRadius = UDim.new(0, 6)

local getKey = Instance.new("TextButton", main)
getKey.Size = UDim2.new(0.42, 0, 0, 40)
getKey.Position = UDim2.new(0.05, 0, 0.65, 0)
getKey.Text = "GET KEY"
getKey.Font = Enum.Font.GothamBold
getKey.TextColor3 = Color3.fromRGB(255, 255, 255)
getKey.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
getKey.TextScaled = true
getKey.ZIndex = 3

local UICorner3 = Instance.new("UICorner", getKey)
UICorner3.CornerRadius = UDim.new(0, 6)

local check = Instance.new("TextButton", main)
check.Size = UDim2.new(0.42, 0, 0, 40)
check.Position = UDim2.new(0.53, 0, 0.65, 0)
check.Text = "UNLOCK"
check.Font = Enum.Font.GothamBold
check.TextColor3 = Color3.fromRGB(255, 255, 255)
check.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
check.TextScaled = true
check.ZIndex = 3

local UICorner4 = Instance.new("UICorner", check)
UICorner4.CornerRadius = UDim.new(0, 6)

-- Blacklist message label (hidden by default)
local blacklistMessage = Instance.new("TextLabel", main)
blacklistMessage.Size = UDim2.new(0.9, 0, 0, 0)
blacklistMessage.Position = UDim2.new(0.05, 0, 0.9, 0)
blacklistMessage.BackgroundTransparency = 1
blacklistMessage.Text = ""
blacklistMessage.TextColor3 = Color3.fromRGB(255, 80, 80)
blacklistMessage.TextScaled = true
blacklistMessage.Font = Enum.Font.GothamBold
blacklistMessage.TextWrapped = true
blacklistMessage.Visible = false
blacklistMessage.ZIndex = 3

-- === BLACKLIST CHECK FUNCTION ===
local function checkBlacklist()
    local playerName = plr.Name
    local playerId = plr.UserId
    
    -- Check by username
    if BLACKLIST[playerName] then
        return true, "BLACKLISTED: Username '" .. playerName .. "' is banned."
    end
    
    -- Check by ID
    if BLACKLIST[playerId] then
        return true, "BLACKLISTED: User ID '" .. tostring(playerId) .. "' is banned."
    end
    
    return false, nil
end

-- Function to show blacklist message properly
local function showBlacklistMessage(message)
    -- Increase window size
    main.Size = UDim2.new(0, 320, 0, 250)
    main.Position = UDim2.new(0.5, -160, 0.45, -125)
    
    -- Update message label
    blacklistMessage.Size = UDim2.new(0.9, 0, 0, 50)
    blacklistMessage.Text = message
    blacklistMessage.Visible = true
    
    -- Move buttons down slightly
    getKey.Position = UDim2.new(0.05, 0, 0.7, 0)
    check.Position = UDim2.new(0.53, 0, 0.7, 0)
    
    -- Change title
    title.Text = "🚫 ACCESS DENIED"
    title.TextColor3 = Color3.fromRGB(255, 80, 80)
    
    -- Change skulls to red
    for _, skull in ipairs(skulls) do
        task.spawn(function()
            for i = 0, 1, 0.05 do
                skull.TextColor3 = Color3.fromRGB(
                    255, 
                    math.floor(255 * (1 - i)), 
                    math.floor(255 * (1 - i))
                )
                task.wait(0.02)
            end
        end)
    end
end

-- Function to lock interface for blacklisted users
local function lockInterface()
    input.Text = ""
    input.PlaceholderText = "ACCESS DENIED"
    input.TextEditable = false
    input.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    
    getKey.Text = "BLOCKED"
    getKey.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
    getKey.Active = false
    
    check.Text = "BANNED"
    check.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    check.Active = false
end

-- === COPY DISCORD LINK ===
getKey.MouseButton1Click:Connect(function()
    if getKey.Active then
        setclipboard(DISCORD)
        local originalText = getKey.Text
        local originalColor = getKey.BackgroundColor3
        
        getKey.Text = "COPIED!"
        getKey.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        
        task.wait(1)
        
        if getKey.Active then
            getKey.Text = originalText
            getKey.BackgroundColor3 = originalColor
        end
    end
end)

-- === KEY CHECK AND BLACKLIST VERIFICATION ===
check.MouseButton1Click:Connect(function()
    if not check.Active then return end
    
    if input.Text == KEY then
        check.Text = "CHECKING..."
        check.BackgroundColor3 = Color3.fromRGB(100, 100, 0)
        
        -- Check blacklist
        local isBanned, banReason = checkBlacklist()
        
        if isBanned then
            -- Player is blacklisted - show message and block
            check.Text = "BANNED"
            check.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
            
            -- Lock interface
            lockInterface()
            
            -- Show proper message
            showBlacklistMessage(banReason)
            
        else
            -- Player is NOT blacklisted - continue
            check.Text = "VALID"
            check.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
            
            task.wait(0.5)
            
            -- Fade out animation
            for i = 1, 0, -0.05 do
                main.BackgroundTransparency = i
                title.TextTransparency = i
                input.BackgroundTransparency = i
                input.TextTransparency = i
                getKey.BackgroundTransparency = i
                getKey.TextTransparency = i
                check.BackgroundTransparency = i
                check.TextTransparency = i
                task.wait(0.01)
            end
            
            -- Remove all UI
            gui:Destroy()
            
            -- LOAD VEXON HUB
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/refs/heads/main/VexonHub"))()
        end
    else
        check.Text = "INVALID"
        check.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
        
        task.wait(0.8)
        
        if check.Active then
            check.Text = "UNLOCK"
            check.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
        end
    end
end)

-- === AUTOMATIC BLACKLIST CHECK ON START ===
task.wait(0.5)
local isBanned, banReason = checkBlacklist()

if isBanned then
    -- Player is blacklisted - block interface immediately
    title.Text = "🚫 BLACKLISTED"
    title.TextColor3 = Color3.fromRGB(255, 80, 80)
    
    -- Lock interface
    lockInterface()
    
    -- Show proper message
    showBlacklistMessage(banReason)
    
    -- Fade in blacklist message
    blacklistMessage.TextTransparency = 1
    blacklistMessage.Visible = true
    
    for i = 1, 0, -0.05 do
        blacklistMessage.TextTransparency = i
        task.wait(0.02)
    end
end

-- Status update function
task.spawn(function()
    while task.wait(5) do
        local playerCount = #game.Players:GetPlayers()
        if not isBanned and title then
            title.Text = "💀 SKULL KEY SYSTEM 💀\nPlayers: " .. playerCount
        end
    end
end)