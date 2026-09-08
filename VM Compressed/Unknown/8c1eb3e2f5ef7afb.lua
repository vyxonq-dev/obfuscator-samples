-- SyntaxHub Key System GUI (English)
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KeySystemGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

-- Frame principal transparente con bordes redondeados
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 380, 0, 220)
mainFrame.Position = UDim2.new(0.5, -190, 0.5, -110)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
mainFrame.BackgroundTransparency = 0.35
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Bordes redondeados
local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 18)
uiCorner.Parent = mainFrame

-- Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "SyntaxHub Key System"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

-- Input para la key
local keyBox = Instance.new("TextBox")
keyBox.Size = UDim2.new(0.85, 0, 0, 45)
keyBox.Position = UDim2.new(0.075, 0, 0.38, 0)
keyBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
keyBox.BackgroundTransparency = 0.1
keyBox.Text = ""
keyBox.PlaceholderText = "Enter key here..."
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.TextSize = 16
keyBox.Font = Enum.Font.Gotham
keyBox.ClearTextOnFocus = false
keyBox.Parent = mainFrame

local boxCorner = Instance.new("UICorner")
boxCorner.CornerRadius = UDim.new(0, 10)
boxCorner.Parent = keyBox

-- Botón Get Key
local getKeyButton = Instance.new("TextButton")
getKeyButton.Size = UDim2.new(0.4, 0, 0, 40)
getKeyButton.Position = UDim2.new(0.08, 0, 0.68, 0)
getKeyButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
getKeyButton.Text = "Get Key"
getKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyButton.TextSize = 15
getKeyButton.Font = Enum.Font.GothamBold
getKeyButton.Parent = mainFrame

local getCorner = Instance.new("UICorner")
getCorner.CornerRadius = UDim.new(0, 10)
getCorner.Parent = getKeyButton

-- Botón Submit
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.4, 0, 0, 40)
submitButton.Position = UDim2.new(0.52, 0, 0.68, 0)
submitButton.BackgroundColor3 = Color3.fromRGB(0, 200, 80)
submitButton.Text = "Submit Key"
submitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
submitButton.TextSize = 15
submitButton.Font = Enum.Font.GothamBold
submitButton.Parent = mainFrame

local submitCorner = Instance.new("UICorner")
submitCorner.CornerRadius = UDim.new(0, 10)
submitCorner.Parent = submitButton

-- Función Get Key (copia el link y muestra mensaje)
getKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://link-target.net/3830582/o1Q2XO4YWZun")
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✅ Copied!";
        Text = "The key link has been copied to your clipboard.\nOpen it in your browser to get the key.",
        Duration = 6;
    })
end)

-- Función Submit Key
submitButton.MouseButton1Click:Connect(function()
    local enteredKey = keyBox.Text:gsub("%s+", ""):lower()
    
    if enteredKey == "syntaxhub" then
        -- Key correcta
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "✅ Success";
            Text = "Correct key! Loading script...";
            Duration = 5;
        })
        
        -- Cargar el script
        loadstring(game:HttpGet("https://gist.githubusercontent.com/angelscripts9/cc181e0ead0914da81faa356b7933922/raw/"))()
        
        -- Cerrar GUI
        screenGui:Destroy()
    else
        -- Key incorrecta
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "❌ Incorrect Key";
            Text = "The key you entered is wrong. Please try again.";
            Duration = 5;
        })
        keyBox.Text = ""
    end
end)

-- Hacer el GUI arrastrable
local dragging = false
local dragInput
local dragStart
local startPos

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and input == dragInput then
        local delta = input.Position - dragStart
        mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)