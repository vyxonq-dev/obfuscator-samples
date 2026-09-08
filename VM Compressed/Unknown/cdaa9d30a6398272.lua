local ScreenGui = Instance.new("ScreenGui")

local Frame = Instance.new("Frame")

local KeyBox = Instance.new("TextBox")

local GetKeyBtn = Instance.new("TextButton")

local NextBtn = Instance.new("TextButton")

local Title = Instance.new("TextLabel")

-- Настройка GUI

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui

Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

Frame.BorderSizePixel = 0

Frame.Position = UDim2.new(0.5, -150, 0.5, -75)

Frame.Size = UDim2.new(0, 300, 0, 150)

Frame.Active = true

Frame.Draggable = true

Title.Name = "Title"

Title.Parent = Frame

Title.BackgroundColor3 = Color3.fromRGB(35, 35, 35)

Title.BorderSizePixel = 0

Title.Size = UDim2.new(1, 0, 0, 30)

Title.Font = Enum.Font.SourceSans

Title.Text = "Key Menu | KRT Hub"

Title.TextColor3 = Color3.fromRGB(255, 255, 255)

Title.TextSize = 20.000

KeyBox.Name = "KeyBox"

KeyBox.Parent = Frame

KeyBox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

KeyBox.BorderSizePixel = 0

KeyBox.Position = UDim2.new(0.1, 0, 0.3, 0)

KeyBox.Size = UDim2.new(0.8, 0, 0, 25)

KeyBox.Font = Enum.Font.SourceSans

KeyBox.PlaceholderText = "Enter key:"

KeyBox.Text = ""

KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)

KeyBox.TextSize = 16.000

GetKeyBtn.Name = "GetKeyBtn"

GetKeyBtn.Parent = Frame

GetKeyBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

GetKeyBtn.BorderSizePixel = 0

GetKeyBtn.Position = UDim2.new(0.1, 0, 0.55, 0)

GetKeyBtn.Size = UDim2.new(0.35, 0, 0, 25)

GetKeyBtn.Font = Enum.Font.SourceSans

GetKeyBtn.Text = "Get key"

GetKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

GetKeyBtn.TextSize = 16.000

NextBtn.Name = "NextBtn"

NextBtn.Parent = Frame

NextBtn.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

NextBtn.BorderSizePixel = 0

NextBtn.Position = UDim2.new(0.55, 0, 0.55, 0)

NextBtn.Size = UDim2.new(0.35, 0, 0, 25)

NextBtn.Font = Enum.Font.SourceSans

NextBtn.Text = "Nеxt"

NextBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

NextBtn.TextSize = 16.000

-- Функционал кнопок

GetKeyBtn.MouseButton1Click:Connect(function()

    setclipboard("https://t.me/KRTHub_keyBot")

    game:GetService("StarterGui"):SetCore("SendNotification", {

        Title = "Key Menu",

        Text = "Link copied to clipboard!",

        Duration = 3

    })

end)

NextBtn.MouseButton1Click:Connect(function()

    if KeyBox.Text == "KRT_1K83S" then

        ScreenGui:Destroy()

        loadstring(game:HttpGet("https://pastefy.app/Wyd6vkwt/raw"))()()

        game:GetService("StarterGui"):SetCore("SendNotification", {

            Title = "Key Menu",

            Text = "Wrong key!",

            Duration = 3

        })

    end

end)