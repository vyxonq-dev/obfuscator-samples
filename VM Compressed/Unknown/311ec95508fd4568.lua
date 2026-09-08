-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 400, 0, 300)
Frame.Position = UDim2.new(0.5, -200, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.BorderSizePixel = 5
Frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
Frame.Parent = ScreenGui
Frame.BackgroundTransparency = 0.1

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(0, 380, 0, 50)
TitleLabel.Position = UDim2.new(0, 10, 0, 10)
TitleLabel.Text = "Unlock the Script"
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 24
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0, 360, 0, 40)
TextBox.Position = UDim2.new(0, 20, 0, 70)
TextBox.PlaceholderText = "Enter the key"
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 18
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BorderSizePixel = 2
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.Parent = Frame

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(0, 360, 0, 40)
GetKeyButton.Position = UDim2.new(0, 20, 0, 120)
GetKeyButton.Text = "Get Key"
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.TextSize = 18
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 122, 255)
GetKeyButton.BorderSizePixel = 0
GetKeyButton.Parent = Frame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0, 360, 0, 40)
SubmitButton.Position = UDim2.new(0, 20, 0, 170)
SubmitButton.Text = "Submit"
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextSize = 18
SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitButton.BackgroundColor3 = Color3.fromRGB(34, 193, 195)
SubmitButton.BorderSizePixel = 0
SubmitButton.Parent = Frame

local Key = "Key_2342$"

-- Function to copy the Discord link
GetKeyButton.MouseButton1Click:Connect(function()
    setclipboard("https://discord.gg/TwjJX4qh")
end)

-- Function to check the entered key and load the script
SubmitButton.MouseButton1Click:Connect(function()
    if TextBox.Text == Key then
        if game.PlaceId == 16732694052 then
            ScreenGui:Destroy() -- Close the GUI after script is loaded
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Script8383/Frostwar/refs/heads/main/RonixHubBooty.lua"))()

        else
            ScreenGui:Destroy() -- Close the GUI after script is loaded
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Script8383/Frostwar/refs/heads/main/Protected_9709560269650768.txt"))()
        end
    else
        TextBox.Text = "Incorrect Key, Try Again."
        TextBox.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for error
    end
end)
