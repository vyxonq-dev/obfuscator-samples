local GET_KEY_URL = "https://link-center.net/1374420/kgAKcyzrFMvN"
local GITHUB_KEYS_URL = "https://pastefy.app/00J5lsvY/raw"

local HttpService = game:GetService("HttpService")

local fSetClipboard = setclipboard or toclipboard

local function getHWID()
    local success, hwid = pcall(function()
        return game:GetService("RbxAnalyticsService"):GetClientId()
    end)
    return success and hwid or HttpService:GenerateGUID(false)
end

local function validateKey(key)
    local hwid = getHWID()

    local success, response = pcall(function()
        return game:HttpGet(GITHUB_KEYS_URL)
    end)
    
    if not success then
        return false, "Network error: Unable to connect to the server. Please check your internet connection."
    end
    
    local validKeys = {}
    
    if string.find(response, ",") then
        for validKey in string.gmatch(response, "([^,]+)") do
            validKey = validKey:match("^%s*(.-)%s*$") -- trim whitespace
            if validKey ~= "" then
                table.insert(validKeys, validKey)
            end
        end
    else
        -- Try line-separated format
        for validKey in string.gmatch(response, "([^\n]+)") do
            validKey = validKey:match("^%s*(.-)%s*$") -- trim whitespace
            if validKey ~= "" then
                table.insert(validKeys, validKey)
            end
        end
    end
    
    local trimmedKey = key:match("^%s*(.-)%s*$")
    
    for _, validKey in ipairs(validKeys) do
        if trimmedKey == validKey then
            return true, "Key validated successfully! Loading script..."
        end
    end
    
    return false, "Invalid key. Please get a valid key and try again."
end

local function createKeySystemGUI(scriptURL)
    repeat task.wait(1) until game:IsLoaded()
    
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local TextBox = Instance.new("TextBox")
    local GetKeyButton = Instance.new("TextButton")
    local CheckKeyButton = Instance.new("TextButton")
    local StatusLabel = Instance.new("TextLabel")
    
    ScreenGui.Name = "KeySystemGUI"
    ScreenGui.Parent = game.CoreGui
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.ResetOnSpawn = false
    
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Frame.BorderSizePixel = 2
    Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    Frame.Position = UDim2.new(0.5, -175, 0.5, -125)
    Frame.Size = UDim2.new(0, 350, 0, 250)
    Frame.Active = true
    
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Title.BorderSizePixel = 0
    Title.Size = UDim2.new(1, 0, 0, 45)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "KEY SYSTEM"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 22
    
    TextBox.Parent = Frame
    TextBox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TextBox.BorderSizePixel = 1
    TextBox.BorderColor3 = Color3.fromRGB(60, 60, 60)
    TextBox.Position = UDim2.new(0, 20, 0, 65)
    TextBox.Size = UDim2.new(1, -40, 0, 35)
    TextBox.Font = Enum.Font.Gotham
    TextBox.PlaceholderText = "Enter your key here..."
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    TextBox.TextSize = 14
    TextBox.ClearTextOnFocus = false
    
    GetKeyButton.Parent = Frame
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(50, 120, 255)
    GetKeyButton.BorderSizePixel = 0
    GetKeyButton.Position = UDim2.new(0, 20, 0, 115)
    GetKeyButton.Size = UDim2.new(0.5, -25, 0, 35)
    GetKeyButton.Font = Enum.Font.GothamBold
    GetKeyButton.Text = "Get Key"
    GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyButton.TextSize = 15
    
    -- Check Key Button
    CheckKeyButton.Parent = Frame
    CheckKeyButton.BackgroundColor3 = Color3.fromRGB(50, 200, 100)
    CheckKeyButton.BorderSizePixel = 0
    CheckKeyButton.Position = UDim2.new(0.5, 5, 0, 115)
    CheckKeyButton.Size = UDim2.new(0.5, -25, 0, 35)
    CheckKeyButton.Font = Enum.Font.GothamBold
    CheckKeyButton.Text = "Check Key"
    CheckKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    CheckKeyButton.TextSize = 15
    

    StatusLabel.Parent = Frame
    StatusLabel.BackgroundTransparency = 1
    StatusLabel.Position = UDim2.new(0, 20, 0, 165)
    StatusLabel.Size = UDim2.new(1, -40, 0, 65)
    StatusLabel.Font = Enum.Font.Gotham
    StatusLabel.Text = "Welcome! Click 'Get Key' to get your access key, then enter it above and click 'Check Key'."
    StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    StatusLabel.TextSize = 13
    StatusLabel.TextWrapped = true
    StatusLabel.TextYAlignment = Enum.TextYAlignment.Top

    GetKeyButton.MouseButton1Click:Connect(function()
        pcall(function()
            fSetClipboard(GET_KEY_URL)
        end)
        StatusLabel.Text = "Key link copied to clipboard! Paste it in your browser to get your key."
        StatusLabel.TextColor3 = Color3.fromRGB(100, 200, 255)
    end)

    CheckKeyButton.MouseButton1Click:Connect(function()
        local enteredKey = TextBox.Text
        
        if enteredKey == "" or #enteredKey < 1 then
            StatusLabel.Text = "Error: Please enter a valid key (minimum 10 characters)."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        
        StatusLabel.Text = "Validating key, please wait..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)

        task.spawn(function()
            local success, message = validateKey(enteredKey)
            
            if success then
                StatusLabel.Text = "✓ Key validated! Loading script..."
                StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
                
                task.wait(1)
                
                ScreenGui:Destroy()
                
                if scriptURL then
                    local scriptSuccess, scriptErr = pcall(function()
                        loadstring(game:HttpGet(scriptURL))()
                    end)
                    if not scriptSuccess then
                        warn("Failed to load script: " .. tostring(scriptErr))
                    end
                end
            else
                StatusLabel.Text = "✗ Validation failed: " .. (message or "")
                StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            end
        end)
    end)
    
    print("Key System Loaded! Please enter your key to continue.")
end

local KeySystem = {}

function KeySystem:Load(scriptURL)
    createKeySystemGUI(scriptURL)
end

return KeySystem
