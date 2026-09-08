-- Modern Pilots Executor UI Script (Enhanced with Inbuilt UI and Close Button)

-- Features:

--   • Black main window with a neon green outline and divider lines.

--   • Header with a vibrant rainbow gradient.

--   • A code input TextBox with placeholder text.

--   • Three buttons along the bottom:

--         - "open ui for inbuilt scripts": toggles a draggable UI with a gray background,

--           rounded corners, and a scrolling frame containing 5 buttons.

--         - "close": when clicked, destroys the executor UI.

--         - "execute": runs the code entered in the code box using loadstring.

--   • In the external UI for inbuilt scripts, the 5 buttons are set as follows:

--         1. "Esp" runs loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Reworked-esp-38524"))()

--         2. "dex" runs loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-DEX-Explorer-29920"))()

--         3. "Console" runs loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-betterConsole-v1-40680"))()

--         4. "fly gui" runs loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Flight-v3-40046"))()

--         5. "nameless admin" runs loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-nameless-admin-so-good-38584"))()

--

-- Note: This script uses exploit functions like loadstring.

--       Ensure your executor supports these functions.

local CoreGui = game:GetService("CoreGui")

-- Create the main ScreenGui

local ScreenGui = Instance.new("ScreenGui")

ScreenGui.Name = "PilotsExecutorUI"

ScreenGui.ResetOnSpawn = false

ScreenGui.Parent = CoreGui

------------------------------------------------------

-- Main Frame: Black background with a neon green outline, draggable.

------------------------------------------------------

local MainFrame = Instance.new("Frame")

MainFrame.Name = "MainFrame"

MainFrame.Size = UDim2.new(0, 600, 0, 400)

MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)

MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

MainFrame.Active = true

MainFrame.Draggable = true

MainFrame.Parent = ScreenGui

local mainFrameStroke = Instance.new("UIStroke")

mainFrameStroke.Color = Color3.fromRGB(0, 255, 0)

mainFrameStroke.Thickness = 3

mainFrameStroke.Parent = MainFrame

local mainFrameCorner = Instance.new("UICorner")

mainFrameCorner.CornerRadius = UDim.new(0, 16)

mainFrameCorner.Parent = MainFrame

------------------------------------------------------

-- Header: Bold text with a vibrant rainbow gradient.

------------------------------------------------------

local Header = Instance.new("TextLabel")

Header.Name = "Header"

Header.Parent = MainFrame

Header.Size = UDim2.new(1, 0, 0, 50)

Header.Position = UDim2.new(0, 0, 0, 0)

Header.BackgroundTransparency = 1

Header.Text = "Welcome to pilots executor"

Header.Font = Enum.Font.GothamBlack

Header.TextScaled = true

Header.TextColor3 = Color3.new(1, 1, 1)

Header.TextStrokeTransparency = 0

local headerGradient = Instance.new("UIGradient")

headerGradient.Parent = Header

headerGradient.Color = ColorSequence.new({

    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),    -- Red

    ColorSequenceKeypoint.new(0.2, Color3.fromRGB(255, 127, 0)),  -- Orange

    ColorSequenceKeypoint.new(0.4, Color3.fromRGB(255, 255, 0)),  -- Yellow

    ColorSequenceKeypoint.new(0.6, Color3.fromRGB(0, 255, 0)),    -- Green

    ColorSequenceKeypoint.new(0.8, Color3.fromRGB(0, 0, 255)),    -- Blue

    ColorSequenceKeypoint.new(1, Color3.fromRGB(139, 0, 255))     -- Violet

})

headerGradient.Transparency = NumberSequence.new(0)

------------------------------------------------------

-- Divider Line 1: Below the header.

------------------------------------------------------

local Divider1 = Instance.new("Frame")

Divider1.Name = "Divider1"

Divider1.Parent = MainFrame

Divider1.Size = UDim2.new(0, 580, 0, 2)

Divider1.Position = UDim2.new(0, 10, 0, 50)

Divider1.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

Divider1.BorderSizePixel = 0

------------------------------------------------------

-- Code TextBox: Where users enter their Roblox Lua code.

------------------------------------------------------

local CodeBox = Instance.new("TextBox")

CodeBox.Name = "CodeBox"

CodeBox.Parent = MainFrame

CodeBox.Size = UDim2.new(0, 500, 0, 200)

CodeBox.Position = UDim2.new(0, 50, 0, 60)

CodeBox.BackgroundColor3 = Color3.fromRGB(80, 80, 80)

CodeBox.PlaceholderText = "-- Write your Roblox Lua code here"

CodeBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)

CodeBox.Text = ""

CodeBox.Font = Enum.Font.SourceSansBold

CodeBox.TextScaled = true

CodeBox.TextColor3 = Color3.fromRGB(240, 240, 240)

CodeBox.MultiLine = true

local codeBoxCorner = Instance.new("UICorner")

codeBoxCorner.CornerRadius = UDim.new(0, 12)

codeBoxCorner.Parent = CodeBox

------------------------------------------------------

-- Divider Line 2: Separates the code input area from the button section.

------------------------------------------------------

local Divider2 = Instance.new("Frame")

Divider2.Name = "Divider2"

Divider2.Parent = MainFrame

Divider2.Size = UDim2.new(0, 580, 0, 2)

Divider2.Position = UDim2.new(0, 10, 0, 270)

Divider2.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

Divider2.BorderSizePixel = 0

------------------------------------------------------

-- Button Section: Three horizontally arranged buttons.

------------------------------------------------------

-- Positions:

-- "open ui for inbuilt scripts" at x = 20,

-- "close" (formerly the paste button) at x = 220,

-- "execute" at x = 420.

-- 1. Open UI for Inbuilt Scripts Button

local OpenUIButton = Instance.new("TextButton")

OpenUIButton.Name = "OpenUIButton"

OpenUIButton.Parent = MainFrame

OpenUIButton.Size = UDim2.new(0, 150, 0, 45)

OpenUIButton.Position = UDim2.new(0, 20, 0, 300)

OpenUIButton.Text = "open ui for inbuilt scripts"

OpenUIButton.Font = Enum.Font.Gotham

OpenUIButton.TextScaled = true

OpenUIButton.TextColor3 = Color3.fromRGB(255, 255, 255)

OpenUIButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local openBtnCorner = Instance.new("UICorner")

openBtnCorner.CornerRadius = UDim.new(0, 12)

openBtnCorner.Parent = OpenUIButton

local openBtnStroke = Instance.new("UIStroke")

openBtnStroke.Color = Color3.fromRGB(255, 255, 255)

openBtnStroke.Thickness = 2

openBtnStroke.Parent = OpenUIButton

-- 2. Close Button (formerly "paste from clipboard")

local CloseButton = Instance.new("TextButton")

CloseButton.Name = "CloseButton"

CloseButton.Parent = MainFrame

CloseButton.Size = UDim2.new(0, 150, 0, 45)

CloseButton.Position = UDim2.new(0, 220, 0, 300)

CloseButton.Text = "close"

CloseButton.Font = Enum.Font.Gotham

CloseButton.TextScaled = true

CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

CloseButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local closeBtnCorner = Instance.new("UICorner")

closeBtnCorner.CornerRadius = UDim.new(0, 12)

closeBtnCorner.Parent = CloseButton

local closeBtnStroke = Instance.new("UIStroke")

closeBtnStroke.Color = Color3.fromRGB(255, 255, 255)

closeBtnStroke.Thickness = 2

closeBtnStroke.Parent = CloseButton

-- When clicked, the Close button will destroy the entire ScreenGui (closing the executor UI).

CloseButton.MouseButton1Click:Connect(function()

    ScreenGui:Destroy()

end)

-- 3. Execute Button: Runs the code entered in the code box.

local ExecuteButton = Instance.new("TextButton")

ExecuteButton.Name = "ExecuteButton"

ExecuteButton.Parent = MainFrame

ExecuteButton.Size = UDim2.new(0, 150, 0, 45)

ExecuteButton.Position = UDim2.new(0, 420, 0, 300)

ExecuteButton.Text = "execute"

ExecuteButton.Font = Enum.Font.Gotham

ExecuteButton.TextScaled = true

ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)

ExecuteButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local executeBtnCorner = Instance.new("UICorner")

executeBtnCorner.CornerRadius = UDim.new(0, 12)

executeBtnCorner.Parent = ExecuteButton

local executeBtnStroke = Instance.new("UIStroke")

executeBtnStroke.Color = Color3.fromRGB(255, 255, 255)

executeBtnStroke.Thickness = 2

executeBtnStroke.Parent = ExecuteButton

ExecuteButton.MouseButton1Click:Connect(function()

    local userCode = CodeBox.Text

    if type(loadstring) ~= "function" then

        warn("loadstring is not available as a function. Operation aborted.")

        return

    end

    local success, codeFunc = pcall(loadstring, userCode)

    if success and type(codeFunc) == "function" then

        local execSuccess, execResult = pcall(codeFunc)

        if not execSuccess then

            warn("Error executing code: " .. tostring(execResult))

        end

    else

        warn("Error loading code: " .. tostring(codeFunc))

    end

end)

------------------------------------------------------

-- Open UI for Inbuilt Scripts

------------------------------------------------------

OpenUIButton.MouseButton1Click:Connect(function()

    local existingUI = ScreenGui:FindFirstChild("InbuiltScriptUI")

    if existingUI then

        existingUI:Destroy()

        return

    end

    local inbuiltUI = Instance.new("Frame")

    inbuiltUI.Name = "InbuiltScriptUI"

    inbuiltUI.Size = UDim2.new(0, 300, 0, 400)

    inbuiltUI.Position = UDim2.new(0.5, -150, 0.5, -200)

    inbuiltUI.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

    inbuiltUI.Active = true

    inbuiltUI.Draggable = true

    inbuiltUI.Parent = ScreenGui

    local inbuiltUICorner = Instance.new("UICorner")

    inbuiltUICorner.CornerRadius = UDim.new(0, 16)

    inbuiltUICorner.Parent = inbuiltUI

    local scrollFrame = Instance.new("ScrollingFrame")

    scrollFrame.Name = "ScrollFrame"

    scrollFrame.Parent = inbuiltUI

    scrollFrame.BackgroundTransparency = 1

    scrollFrame.Size = UDim2.new(1, -20, 1, -20)

    scrollFrame.Position = UDim2.new(0, 10, 0, 10)

    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 270)

    scrollFrame.ScrollBarThickness = 8

    for i = 1, 5 do

        local scriptButton = Instance.new("TextButton")

        scriptButton.Name = "ScriptButton" .. i

        scriptButton.Parent = scrollFrame

        scriptButton.Size = UDim2.new(1, -10, 0, 40)

        scriptButton.Position = UDim2.new(0, 5, 0, (i - 1) * 50)

        scriptButton.Font = Enum.Font.Gotham

        scriptButton.TextScaled = true

        scriptButton.TextColor3 = Color3.fromRGB(255, 255, 255)

        scriptButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

        local scriptBtnCorner = Instance.new("UICorner")

        scriptBtnCorner.CornerRadius = UDim.new(0, 10)

        scriptBtnCorner.Parent = scriptButton

        if i == 1 then

            scriptButton.Text = "Esp"

            scriptButton.MouseButton1Click:Connect(function()

                if type(loadstring) == "function" then

                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Reworked-esp-38524"))()

                else

                    warn("loadstring is not available as a function.")

                end

            end)

        elseif i == 2 then

            scriptButton.Text = "dex"

            scriptButton.MouseButton1Click:Connect(function()

                if type(loadstring) == "function" then

                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-DEX-Explorer-29920"))()

                else

                    warn("loadstring is not available as a function.")

                end

            end)

        elseif i == 3 then

            scriptButton.Text = "Console"

            scriptButton.MouseButton1Click:Connect(function()

                if type(loadstring) == "function" then

                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-betterConsole-v1-40680"))()

                else

                    warn("loadstring is not available as a function.")

                end

            end)

        elseif i == 4 then

            scriptButton.Text = "fly gui"

            scriptButton.MouseButton1Click:Connect(function()

                if type(loadstring) == "function" then

                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Flight-v3-40046"))()

                else

                    warn("loadstring is not available as a function.")

                end

            end)

        elseif i == 5 then

            scriptButton.Text = "nameless admin"

            scriptButton.MouseButton1Click:Connect(function()

                if type(loadstring) == "function" then

                    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-nameless-admin-so-good-38584"))()

                else

                    warn("loadstring is not available as a function.")

                end

            end)

        end

    end

end)