local ScreenGui = Instance.new("ScreenGui")
local mainframe = Instance.new("Frame")
local titleFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local icon = Instance.new("ImageLabel")
local separator = Instance.new("Frame")
local textbox = Instance.new("TextBox")
local EncodeButton = Instance.new("TextButton")
local ClearButton = Instance.new("TextButton")
local CopyButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local gradient = Instance.new("UIGradient")
local statusLabel = Instance.new("TextLabel")

-- GUI Setup
ScreenGui.Name = "FreeObfuscateGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

mainframe.Name = "MainFrame"
mainframe.Parent = ScreenGui
mainframe.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainframe.Size = UDim2.new(0.4, 0, 0.6, 0)
mainframe.AnchorPoint = Vector2.new(0.5, 0.5)
mainframe.Position = UDim2.new(0.5, 0, 0.5, 0)
mainframe.BorderSizePixel = 0
mainframe.Active = true
mainframe.Draggable = true

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = mainframe

gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(30, 30, 30)), ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))}
gradient.Parent = mainframe

titleFrame.Parent = mainframe
titleFrame.Size = UDim2.new(1, 0, 0.1, 0)
titleFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleFrame.BorderSizePixel = 0
local TitleFrameCorner = Instance.new("UICorner")
TitleFrameCorner.CornerRadius = UDim.new(0, 8)
TitleFrameCorner.Parent = titleFrame

icon.Parent = titleFrame
icon.Size = UDim2.new(0.08, 0, 0.8, 0)
icon.Position = UDim2.new(0.02, 0, 0.1, 0)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://1234567890" -- Replace with actual image ID

titleLabel.Parent = titleFrame
titleLabel.Text = "Free Obfuscate Script"
titleLabel.Size = UDim2.new(0.9, 0, 1, 0)
titleLabel.Position = UDim2.new(0.1, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextScaled = true
titleLabel.BorderSizePixel = 0

separator.Parent = mainframe
separator.Size = UDim2.new(1, 0, 0, 1)
separator.Position = UDim2.new(0, 0, 0.1, 0)
separator.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
separator.BorderSizePixel = 0

textbox.Parent = mainframe
textbox.Size = UDim2.new(0.92, 0, 0.65, 0)
textbox.Position = UDim2.new(0.04, 0, 0.16, 0)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextColor3 = Color3.fromRGB(220, 220, 220)
textbox.PlaceholderText = "Enter Script to Obfuscate..."
textbox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
textbox.ClearTextOnFocus = false
textbox.TextWrapped = true
textbox.TextXAlignment = Enum.TextXAlignment.Left
textbox.TextYAlignment = Enum.TextYAlignment.Top
textbox.TextScaled = false
textbox.MultiLine = true
textbox.Font = Enum.Font.SourceSans
textbox.RichText = false
textbox.Text = ""
local TextboxCorner = Instance.new("UICorner")
TextboxCorner.CornerRadius = UDim.new(0, 6)
TextboxCorner.Parent = textbox

EncodeButton.Parent = mainframe
EncodeButton.Text = "Obfuscate"
EncodeButton.Size = UDim2.new(0.3, 0, 0.1, 0)
EncodeButton.Position = UDim2.new(0.05, 0, 0.85, 0)
EncodeButton.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
EncodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EncodeButton.Font = Enum.Font.Gotham
EncodeButton.TextScaled = true
local ButtonCorner = Instance.new("UICorner")
ButtonCorner.CornerRadius = UDim.new(0, 8)
ButtonCorner.Parent = EncodeButton

ClearButton.Parent = mainframe
ClearButton.Text = "Clear"
ClearButton.Size = UDim2.new(0.3, 0, 0.1, 0)
ClearButton.Position = UDim2.new(0.35, 0, 0.85, 0)
ClearButton.BackgroundColor3 = Color3.fromRGB(180, 70, 70)
ClearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearButton.Font = Enum.Font.Gotham
ClearButton.TextScaled = true
local ClearButtonCorner = Instance.new("UICorner")
ClearButtonCorner.CornerRadius = UDim.new(0, 8)
ClearButtonCorner.Parent = ClearButton

CopyButton.Parent = mainframe
CopyButton.Text = "Copy"
CopyButton.Size = UDim2.new(0.3, 0, 0.1, 0)
CopyButton.Position = UDim2.new(0.65, 0, 0.85, 0)
CopyButton.BackgroundColor3 = Color3.fromRGB(70, 180, 130)
CopyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyButton.Font = Enum.Font.Gotham
CopyButton.TextScaled = true
local CopyButtonCorner = Instance.new("UICorner")
CopyButtonCorner.CornerRadius = UDim.new(0, 8)
CopyButtonCorner.Parent = CopyButton

statusLabel.Parent = mainframe
statusLabel.Text = ""
statusLabel.Size = UDim2.new(0.92, 0, 0.05, 0)
statusLabel.Position = UDim2.new(0.04, 0, 0.92, 0)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.Font = Enum.Font.Gotham
statusLabel.TextScaled = true

-- Button Hover Effects
local originalEncodeColor = EncodeButton.BackgroundColor3
EncodeButton.MouseEnter:Connect(function()
    EncodeButton.BackgroundColor3 = Color3.fromRGB(90, 150, 200)
end)
EncodeButton.MouseLeave:Connect(function()
    EncodeButton.BackgroundColor3 = originalEncodeColor
end)

local originalClearColor = ClearButton.BackgroundColor3
ClearButton.MouseEnter:Connect(function()
    ClearButton.BackgroundColor3 = Color3.fromRGB(200, 90, 90)
end)
ClearButton.MouseLeave:Connect(function()
    ClearButton.BackgroundColor3 = originalClearColor
end)

local originalCopyColor = CopyButton.BackgroundColor3
CopyButton.MouseEnter:Connect(function()
    CopyButton.BackgroundColor3 = Color3.fromRGB(90, 200, 150)
end)
CopyButton.MouseLeave:Connect(function()
    CopyButton.BackgroundColor3 = originalCopyColor
end)

-- Obfuscation Logic
local obfuscatedScript = ""

EncodeButton.MouseButton1Click:Connect(function()
    local source = textbox.Text
    if source == "" then
        statusLabel.Text = "Error: No script to obfuscate."
        return
    end

    -- Validate Lua script
    local success, errorMsg = pcall(function() loadstring(source) end)
    if not success then
        statusLabel.Text = "Error: Invalid Lua script - " .. errorMsg
        return
    end

    -- Base64 Encoding
    local function toBase64(data)
        local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
        return ((data:gsub('.', function(x) 
            local r, b = '', x:byte()
            for i = 8, 1, -1 do r = r .. (b % 2^i - b % 2^(i - 1) > 0 and '1' or '0') end
            return r
        end) .. '0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
            if (#x < 6) then return '' end
            local c = 0
            for i = 1, 6 do c = c + (x:sub(i, i) == '1' and 2^(6 - i) or 0) end
            return b:sub(c + 1, c + 1)
        end) .. ({ '', '==', '=' })[#data % 3 + 1])
    end

    local base64Encoded = toBase64(source)
    obfuscatedScript = "loadstring((function(b64) local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' local function decode(str) local t={} for i=1,#str do local c=str:sub(i,i) if c~='=' then local idx=b:find(c)-1 t[#t+1]=('%06d'):format(tonumber(idx):tobinary()) end end local bin=table.concat(t) local pad=#bin%8 bin=bin..string.rep('0',8-pad) local r='' for i=1,#bin,8 do r=r..string.char(tonumber(bin:sub(i,i+7),2)) end return r end return decode(b64) end)(\"" .. base64Encoded .. "\"))()"
    
    statusLabel.Text = "Obfuscation successful!"
end)

ClearButton.MouseButton1Click:Connect(function()
    textbox.Text = ""
    statusLabel.Text = ""
    obfuscatedScript = ""
end)

CopyButton.MouseButton1Click:Connect(function()
    if obfuscatedScript == "" then
        statusLabel.Text = "Error: No obfuscated script to copy."
        return
    end

    local success = false
    if setclipboard then
        setclipboard(obfuscatedScript)
        success = true
    elseif syn and syn.write_clipboard then
        syn.write_clipboard(obfuscatedScript)
        success = true
    elseif Clipboard and Clipboard.set then
        Clipboard.set(obfuscatedScript)
        success = true
    end

    statusLabel.Text = success and "Copied to clipboard!" or "Error: Unable to copy."
end)

print("Free Obfuscate Script GUI loaded successfully")