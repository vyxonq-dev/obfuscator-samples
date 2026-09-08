local StarterGui = game:GetService("StarterGui")
local HttpService = game:GetService("HttpService")

local fileName = "savedKey.txt"
local isScriptRunning = false

local function saveKey(key)
    writefile(fileName, key)
end

local function loadSavedKey()
    if isfile(fileName) then
        return readfile(fileName)
    end
    return nil
end

local function showKeyLinkNotification()
    local bindableFunction = Instance.new("BindableFunction")
    
    function bindableFunction.OnInvoke(response)
        if response == "Yes" then
            setclipboard("https://link-hub.net/1277016/keysystem")
        end
    end
    
    StarterGui:SetCore("SendNotification", {
        Title = "Key Link";
        Text = "Copy key link?";
        Duration = 10;
        Button1 = "Yes";
        Button2 = "No";
        Callback = bindableFunction
    })
end

local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local CheckButton = Instance.new("TextButton")
local StatusLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

MainFrame.Name = "KeySystem"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
MainFrame.Size = UDim2.new(0, 300, 0, 200)

TextLabel.Parent = MainFrame
TextLabel.BackgroundTransparency = 1
TextLabel.Position = UDim2.new(0, 0, 0, 10)
TextLabel.Size = UDim2.new(1, 0, 0, 30)
TextLabel.Font = Enum.Font.GothamBold
TextLabel.Text = "Key System"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20

KeyInput.Name = "KeyInput"
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
KeyInput.Position = UDim2.new(0.1, 0, 0.3, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0, 30)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = "Enter kry..."
KeyInput.Text = ""
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextSize = 14

CheckButton.Name = "CheckButton"
CheckButton.Parent = MainFrame
CheckButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
CheckButton.Position = UDim2.new(0.2, 0, 0.6, 0)
CheckButton.Size = UDim2.new(0.6, 0, 0, 30)
CheckButton.Font = Enum.Font.GothamBold
CheckButton.Text = "Check Key"
CheckButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckButton.TextSize = 14

StatusLabel.Name = "StatusLabel"
StatusLabel.Parent = MainFrame
StatusLabel.BackgroundTransparency = 1
StatusLabel.Position = UDim2.new(0, 0, 0.8, 0)
StatusLabel.Size = UDim2.new(1, 0, 0, 30)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.TextSize = 14

local function verifyKeyWithServer(inputKey)
    local success, result = pcall(function()
        return game:HttpGet("https://pastebin.com/raw/148zgJ4D")
    end)
    
    if success then
        local correctKey = result:gsub("%s+", "")
        return inputKey == correctKey
    end
    return false
end

local function showKeySystem()
    MainFrame.Visible = true
    showKeyLinkNotification()
end

local function hideKeySystem()
    MainFrame.Visible = false
end

local function runMainScript()
    isScriptRunning = true
    loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Server9"))()
end

local function checkKey(inputKey)
    local keyToCheck = inputKey or KeyInput.Text:gsub("%s+", "")
    
    if verifyKeyWithServer(keyToCheck) then
        saveKey(keyToCheck)
        getgenv().Key = keyToCheck
        
        StatusLabel.Text = "Key Valid!"
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
        wait(1)
        hideKeySystem()
        
        if not isScriptRunning then
            runMainScript()
        end
        
        return true
    else
        if inputKey then
            if isfile(fileName) then
                delfile(fileName)
            end
            showKeySystem()
        end
        
        StatusLabel.Text = "Key didn't Valid!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
        return false
    end
end

local savedKey = loadSavedKey()
if savedKey then
    hideKeySystem()
    if not checkKey(savedKey) then
        showKeySystem()
        KeyInput.Text = ""
    end
else
    showKeySystem()
end

CheckButton.MouseButton1Click:Connect(function()
    checkKey()
end)


local mt = getrawmetatable(game)
local old = mt.__namecall
setreadonly(mt, false)
mt.__namecall = newcclosure(function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    if method == "HttpGet" then
        return old(self, ...)
    end
    return old(self, ...)
end)
setreadonly(mt, true)