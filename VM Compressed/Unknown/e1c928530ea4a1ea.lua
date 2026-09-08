local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- --- CONFIG ---
local CorrectKey = "1TAP-V6-99XQ-B24K" -- Post this in your Discord #key channel
local DiscordLink = "https://discord.gg/Bb9xNFpzCN"
local MainScriptURL = "https://raw.githubusercontent.com/joyaich5522-design/Onetap.lua/refs/heads/main/%5BFPS%5D%20One%20tap%20-%20Hub"

-- --- UI SETUP ---
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OneTap_Loader"
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 260, 0, 220)
KeyFrame.Position = UDim2.new(0.5, -130, 0.5, -110)
KeyFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
KeyFrame.Parent = ScreenGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 15)

-- Cyan Glow Border
local Border = Instance.new("Frame")
Border.Size = UDim2.new(1, 2, 1, 2)
Border.Position = UDim2.new(0, -1, 0, -1)
Border.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Border.ZIndex = 0
Border.Parent = KeyFrame
Instance.new("UICorner", Border).CornerRadius = UDim.new(0, 16)

-- Title
local T = Instance.new("TextLabel")
T.Size = UDim2.new(1, 0, 0, 45)
T.Text = "ONE TAP - AUTH"
T.TextColor3 = Color3.fromRGB(0, 255, 255)
T.Font = Enum.Font.GothamBold
T.TextSize = 18
T.BackgroundTransparency = 1
T.ZIndex = 2
T.Parent = KeyFrame

-- Mobile-Friendly Text Box
local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.85, 0, 0, 45)
KeyInput.Position = UDim2.new(0.075, 0, 0.3, 0)
KeyInput.PlaceholderText = "Paste Key Here..."
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
KeyInput.TextColor3 = Color3.new(1, 1, 1)
KeyInput.Font = Enum.Font.Gotham
KeyInput.ZIndex = 2
KeyInput.Parent = KeyFrame
Instance.new("UICorner", KeyInput)

-- Submit Button
local Submit = Instance.new("TextButton")
Submit.Size = UDim2.new(0.85, 0, 0, 40)
Submit.Position = UDim2.new(0.075, 0, 0.58, 0)
Submit.Text = "LOGIN"
Submit.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
Submit.TextColor3 = Color3.fromRGB(20, 20, 20)
Submit.Font = Enum.Font.GothamBold
Submit.ZIndex = 2
Submit.Parent = KeyFrame
Instance.new("UICorner", Submit)

-- Discord Button
local GetKey = Instance.new("TextButton")
GetKey.Size = UDim2.new(0.85, 0, 0, 30)
GetKey.Position = UDim2.new(0.075, 0, 0.82, 0)
GetKey.Text = "GET KEY (DISCORD)"
GetKey.BackgroundTransparency = 1
GetKey.TextColor3 = Color3.fromRGB(150, 150, 150)
GetKey.Font = Enum.Font.Gotham
GetKey.TextSize = 12
GetKey.ZIndex = 2
GetKey.Parent = KeyFrame

-- --- LOGIC ---
GetKey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DiscordLink)
        GetKey.Text = "INVITE COPIED!"
        task.wait(2)
        GetKey.Text = "GET KEY (DISCORD)"
    end
end)

Submit.MouseButton1Click:Connect(function()
    if KeyInput.Text == CorrectKey then
        Submit.Text = "VERIFYING..."
        Submit.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
        
        task.wait(1)
        
        local success, err = pcall(function()
            loadstring(game:HttpGet(MainScriptURL))()
        end)
        
        if success then
            ScreenGui:Destroy()
        else
            Submit.Text = "LOAD ERROR!"
            warn(err)
        end
    else
        KeyInput.Text = ""
        KeyInput.PlaceholderText = "INVALID KEY"
        Submit.Text = "ACCESS DENIED"
        Submit.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1.5)
        Submit.Text = "LOGIN"
        Submit.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    end
end)

