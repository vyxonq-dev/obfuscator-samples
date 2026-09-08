-- Creación del ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local GetKeyLabel = Instance.new("TextLabel")
local KeyBox = Instance.new("TextBox")
local CheckKeyBtn = Instance.new("TextButton")
local GetKeyBtn = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- Configuración del ScreenGui
ScreenGui.Name = "KeySystem"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false  -- Evita que se reinicie al respawn

-- Configuración del Frame principal
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)  -- Color oscuro como el de la derecha
MainFrame.Size = UDim2.new(0, 300, 0, 200)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true  -- Permite mover el Frame

-- Configuración del título
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.SourceSansSemibold
Title.Text = "ShifeScripts - Key System"
Title.TextColor3 = Color3.fromRGB(220, 220, 220)  -- Color claro como el de la derecha
Title.TextSize = 20
Title.TextStrokeTransparency = 0.9

-- Configuración del texto "Get Key For ShifeScripts"
GetKeyLabel.Name = "GetKeyLabel"
GetKeyLabel.Parent = MainFrame
GetKeyLabel.BackgroundTransparency = 1
GetKeyLabel.Position = UDim2.new(0.5, -100, 0.2, 0)
GetKeyLabel.Size = UDim2.new(0, 200, 0, 25)
GetKeyLabel.Font = Enum.Font.SourceSans
GetKeyLabel.Text = "Get Key For ShifeScripts"
GetKeyLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
GetKeyLabel.TextSize = 16

-- Configuración de la caja de texto para ingresar la llave
KeyBox.Name = "KeyBox"
KeyBox.Parent = MainFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)  -- Color oscuro de fondo
KeyBox.Position = UDim2.new(0.5, -125, 0.4, 0)
KeyBox.Size = UDim2.new(0, 250, 0, 30)
KeyBox.Font = Enum.Font.SourceSans
KeyBox.PlaceholderText = "Enter Key..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
KeyBox.TextSize = 18
KeyBox.TextXAlignment = Enum.TextXAlignment.Center

-- Configuración del botón "Check Key"
CheckKeyBtn.Name = "CheckKeyBtn"
CheckKeyBtn.Parent = MainFrame
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Color oscuro del botón
CheckKeyBtn.Position = UDim2.new(0.1, 0, 0.7, 0)
CheckKeyBtn.Size = UDim2.new(0, 120, 0, 30)
CheckKeyBtn.Font = Enum.Font.SourceSansBold
CheckKeyBtn.Text = "Check Key"
CheckKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
CheckKeyBtn.TextSize = 18

-- Configuración del botón "Get Key"
GetKeyBtn.Name = "GetKeyBtn"
GetKeyBtn.Parent = MainFrame
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Color oscuro del botón
GetKeyBtn.Position = UDim2.new(0.55, 0, 0.7, 0)
GetKeyBtn.Size = UDim2.new(0, 120, 0, 30)
GetKeyBtn.Font = Enum.Font.SourceSansBold
GetKeyBtn.Text = "Get Key"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
GetKeyBtn.TextSize = 18

-- Botón de cierre (X)
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundTransparency = 1  -- Transparente como el de la derecha
CloseButton.Position = UDim2.new(0.92, 0, 0, 0)
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(200, 200, 200)  -- Texto gris claro
CloseButton.TextSize = 16

-- Función para cerrar la GUI
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Función del botón "Check Key"
CheckKeyBtn.MouseButton1Click:Connect(function()
    local enteredKey = KeyBox.Text
    if enteredKey == "UCrvd63k" then
        print("Key Correct")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Alexcirer/Alexcirer/refs/heads/main/v20p"))()
        ScreenGui:Destroy()  -- Elimina la GUI después de ejecutar el script
    else
        KeyBox.Text = "Incorrect Key!"
        wait(2)  -- Esperar 2 segundos para que el usuario vea el mensaje
        KeyBox.Text = ""  -- Limpiar el texto
    end
end)

-- Función del botón "Get Key" para copiar el enlace
GetKeyBtn.MouseButton1Click:Connect(function()
    setclipboard("https://rekonise.com/get-key-mz2tn")
    print("Link copied to clipboard!")

    -- Mostrar el mensaje en la caja de texto
    KeyBox.Text = "Copied! Paste in your Browser."
    
    -- Esperar 5 segundos antes de limpiar el texto
    wait(5)
    KeyBox.Text = ""  -- Limpia el texto de la caja
end)
