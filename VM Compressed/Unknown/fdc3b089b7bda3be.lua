-- JJS OP SCRIPT Key System
-- Key: JJSRAZZY
-- When correct key entered, runs:
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript"))()

local KEY = "JJSRAZZY"
local REMOTE_URL = "https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript"

-- UI creation
local CoreGui = (gethui and gethui()) or (syn and syn.protect_gui and (function() local g=Instance.new("ScreenGui"); g.Name="JJSKeySystemGUI"; g.Parent = game:GetService("CoreGui"); return g end)()) or game:GetService("CoreGui")
if not CoreGui then CoreGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") end

-- Remove old GUI if exists
if CoreGui:FindFirstChild("JJSKeySystem") then
    CoreGui.JJSKeySystem:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "JJSKeySystem"
screenGui.ResetOnSpawn = false
screenGui.Parent = CoreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 420, 0, 180)
frame.Position = UDim2.new(0.5, -210, 0.4, -90)
frame.BackgroundColor3 = Color3.fromRGB(18, 125, 75) -- deep green
frame.BorderSizePixel = 0
frame.Parent = screenGui

local uic = Instance.new("UICorner")
uic.CornerRadius = UDim.new(0, 14)
uic.Parent = frame

-- Title bar
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 48)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "JJS OP SCRIPT"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.fromRGB(240,240,240)
title.Parent = frame

-- Subtitle / instructions
local sub = Instance.new("TextLabel")
sub.Size = UDim2.new(1, -20, 0, 28)
sub.Position = UDim2.new(0, 10, 0, 48)
sub.BackgroundTransparency = 1
sub.Text = "Enter your key to continue"
sub.Font = Enum.Font.Gotham
sub.TextSize = 14
sub.TextColor3 = Color3.fromRGB(220,220,220)
sub.TextXAlignment = Enum.TextXAlignment.Left
sub.Parent = frame

-- TextBox (key input)
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(1, -20, 0, 34)
inputBox.Position = UDim2.new(0, 10, 0, 80)
inputBox.BackgroundColor3 = Color3.fromRGB(232, 245, 236) -- light greenish
inputBox.PlaceholderText = "Enter key..."
inputBox.Text = ""
inputBox.ClearTextOnFocus = false
inputBox.Font = Enum.Font.Gotham
inputBox.TextSize = 16
inputBox.TextColor3 = Color3.fromRGB(30,30,30)
inputBox.Parent = frame

local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0, 10)
inputCorner.Parent = inputBox

-- Status label
local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -20, 0, 20)
status.Position = UDim2.new(0, 10, 0, 120)
status.BackgroundTransparency = 1
status.Text = ""
status.Font = Enum.Font.Gotham
status.TextSize = 14
status.TextColor3 = Color3.fromRGB(255,200,80)
status.TextXAlignment = Enum.TextXAlignment.Left
status.Parent = frame

-- Submit button
local submit = Instance.new("TextButton")
submit.Size = UDim2.new(0, 120, 0, 34)
submit.Position = UDim2.new(1, -130, 0, 120)
submit.BackgroundColor3 = Color3.fromRGB(32, 180, 95) -- vibrant green
submit.Text = "Submit"
submit.Font = Enum.Font.GothamBold
submit.TextSize = 16
submit.TextColor3 = Color3.fromRGB(255,255,255)
submit.Parent = frame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 10)
submitCorner.Parent = submit

-- Close button (top-right small)
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 28, 0, 28)
closeBtn.Position = UDim2.new(1, -34, 0, 8)
closeBtn.BackgroundColor3 = Color3.fromRGB(220,70,70)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 14
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 8)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Helper to attempt executing remote script safely
local function executeRemote(url)
    status.TextColor3 = Color3.fromRGB(200,200,200)
    status.Text = "Fetching and executing script..."
    local ok, res = pcall(function()
        local http = game:HttpGet or (syn and syn.request and function(u) return syn.request({Url = u, Method = "GET"}).Body end) or nil
        if not http then
            -- try game:HttpGet if available
            return game:HttpGet(url)
        end
        return http(url)
    end)
    if not ok or not res then
        status.TextColor3 = Color3.fromRGB(255,120,120)
        status.Text = "Failed to fetch script."
        return
    end

    -- attempt loadstring or load
    local loader = loadstring or load
    if not loader then
        status.TextColor3 = Color3.fromRGB(255,120,120)
        status.Text = "Executor does not support loadstring/load."
        return
    end

    local succ, err = pcall(function()
        local fn = loader(res)
        if type(fn) == "function" then
            fn()
        else
            error("Loaded chunk is not a function.")
        end
    end)

    if succ then
        status.TextColor3 = Color3.fromRGB(140,255,160)
        status.Text = "Script executed successfully."
        wait(1.2)
        screenGui:Destroy()
    else
        status.TextColor3 = Color3.fromRGB(255,120,120)
        status.Text = "Script execution failed: "..tostring(err)
    end
end

submit.MouseButton1Click:Connect(function()
    local entered = tostring(inputBox.Text or ""):gsub("%s+", "") -- trim spaces
    if entered == "" then
        status.TextColor3 = Color3.fromRGB(255,200,80)
        status.Text = "Please enter the key."
        return
    end
    if entered == KEY then
        -- correct
        status.TextColor3 = Color3.fromRGB(140,255,160)
        status.Text = "Key valid. Running script..."
        -- execute in pcall to avoid crashing UI
        spawn(function()
            pcall(function()
                executeRemote(REMOTE_URL)
            end)
        end)
    else
        status.TextColor3 = Color3.fromRGB(255,140,140)
        status.Text = "Incorrect key."
    end
end)

-- Optional: allow pressing Enter to submit
inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        submit.MouseButton1Click:Fire()
    end
end)
