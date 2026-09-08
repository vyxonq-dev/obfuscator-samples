local HttpService = game:GetService(string.char(72, 116, 116, 112, 83, 101, 114, 118, 105, 99, 101))
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild(string.char(80, 108, 97, 121, 101, 114, 71, 117, 105))
local COPY_LINK = string.char(104, 116, 116, 112, 115, 58, 47, 47, 119, 111, 114, 107, 46, 105, 110, 107, 47, 50, 57, 99, 70, 47, 102, 97, 49, 55, 52, 97, 49, 97, 45, 54, 50, 56, 49, 45, 52, 53, 55, 49, 45, 98, 49, 97, 48, 45, 51, 101, 48, 54, 97, 98, 55, 55, 50, 52, 49, 55)
local VALIDATE_URL = string.char(104, 116, 116, 112, 115, 58, 47, 47, 119, 111, 114, 107, 46, 105, 110, 107, 47, 95, 97, 112, 105, 47, 118, 50, 47, 116, 111, 107, 101, 110, 47, 105, 115, 86, 97, 108, 105, 100, 47)
local SINGLE_USE = false
local screen = Instance.new(string.char(83, 99, 114, 101, 101, 110, 71, 117, 105))
screen.Name = string.char(83, 97, 105, 108, 111, 114, 65, 117, 116, 104, 95, 70, 105, 110, 97, 108)
screen.ResetOnSpawn = false
screen.Parent = playerGui
local mainFrame = Instance.new(string.char(70, 114, 97, 109, 101))
mainFrame.Size = UDim2.new(0, 360, 0, 180)
mainFrame.Position = UDim2.new(0.5, -180, 0.5, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Parent = screen
local mainCorner = Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114))
mainCorner.CornerRadius = UDim.new(0, 4)
mainCorner.Parent = mainFrame
local accent = Instance.new(string.char(70, 114, 97, 109, 101))
accent.Size = UDim2.new(1, 0, 0, 2)
accent.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
accent.BorderSizePixel = 0
accent.Parent = mainFrame
local title = Instance.new(string.char(84, 101, 120, 116, 76, 97, 98, 101, 108))
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = string.char(83, 65, 73, 76, 79, 82, 32, 80, 73, 69, 67, 69, 32, 124, 32, 65, 85, 84, 72)
title.TextColor3 = Color3.fromRGB(220, 220, 220)
title.Font = Enum.Font.Code
title.TextSize = 14
title.Parent = mainFrame
local keyBox = Instance.new(string.char(84, 101, 120, 116, 66, 111, 120))
keyBox.Size = UDim2.new(0.85, 0, 0, 35)
keyBox.Position = UDim2.new(0.075, 0, 0.38, 0)
keyBox.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
keyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
keyBox.PlaceholderText = string.char(80, 97, 115, 116, 101, 32, 107, 101, 121, 32, 104, 101, 114, 101, 46, 46, 46)
keyBox.Text = ""
keyBox.Font = Enum.Font.Code
keyBox.TextSize = 13
keyBox.TextTruncate = Enum.TextTruncate.AtEnd
keyBox.ClearTextOnFocus = false
keyBox.Parent = mainFrame
local padding = Instance.new(string.char(85, 73, 80, 97, 100, 100, 105, 110, 103))
padding.PaddingLeft = UDim.new(0, 12)
padding.PaddingRight = UDim.new(0, 12)
padding.Parent = keyBox
local inputCorner = Instance.new(string.char(85, 73, 67, 111, 114, 110, 101, 114))
inputCorner.CornerRadius = UDim.new(0, 3)
inputCorner.Parent = keyBox
local btnFrame = Instance.new(string.char(70, 114, 97, 109, 101))
btnFrame.Size = UDim2.new(0.85, 0, 0, 35)
btnFrame.Position = UDim2.new(0.075, 0, 0.68, 0)
btnFrame.BackgroundTransparency = 1
btnFrame.Parent = mainFrame
local getKeyBtn = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
getKeyBtn.Size = UDim2.new(0.48, 0, 1, 0)
getKeyBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
getKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
getKeyBtn.Text = string.char(71, 69, 84, 32, 75, 69, 89)
getKeyBtn.Font = Enum.Font.Code
getKeyBtn.TextSize = 12
getKeyBtn.Parent = btnFrame
local verifyBtn = Instance.new(string.char(84, 101, 120, 116, 66, 117, 116, 116, 111, 110))
verifyBtn.Size = UDim2.new(0.48, 0, 1, 0)
verifyBtn.Position = UDim2.new(0.52, 0, 0, 0)
verifyBtn.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
verifyBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
verifyBtn.Text = string.char(86, 69, 82, 73, 70, 89)
verifyBtn.Font = Enum.Font.Code
verifyBtn.TextSize = 12
verifyBtn.Parent = btnFrame
local function validateKey(key)
if not key or key == "" then return false end
local url = VALIDATE_URL .. HttpService:UrlEncode(key)
if SINGLE_USE then
url = url .. string.char(63, 100, 101, 108, 101, 116, 101, 84, 111, 107, 101, 110, 61, 49)
end
local success, response = pcall(function()
return game:HttpGet(url)
end)
if not success then return false end
local data = HttpService:JSONDecode(response)
return data and data.valid == true
end
getKeyBtn.MouseButton1Click:Connect(function()
if setclipboard then
setclipboard(COPY_LINK)
getKeyBtn.Text = string.char(67, 79, 80, 73, 69, 68, 33)
task.wait(1.5)
getKeyBtn.Text = string.char(71, 69, 84, 32, 75, 69, 89)
end
end)
verifyBtn.MouseButton1Click:Connect(function()
local enteredKey = keyBox.Text:gsub(string.char(37, 115, 43), "")
verifyBtn.Text = string.char(67, 72, 69, 67, 75, 73, 78, 71, 46, 46, 46)
if validateKey(enteredKey) then
verifyBtn.Text = string.char(71, 82, 65, 78, 84, 69, 68)
verifyBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
task.wait(0.3)
screen:Destroy()
loadstring(game:HttpGet(string.char(104, 116, 116, 112, 115, 58, 47, 47, 97, 112, 105, 46, 108, 117, 97, 114, 109, 111, 114, 46, 110, 101, 116, 47, 102, 105, 108, 101, 115, 47, 118, 52, 47, 108, 111, 97, 100, 101, 114, 115, 47, 98, 49, 102, 51, 48, 51, 51, 49, 101, 49, 97, 102, 57, 97, 98, 54, 101, 57, 54, 102, 99, 56, 48, 99, 100, 48, 48, 98, 50, 48, 97, 57, 46, 108, 117, 97)))()
else
verifyBtn.Text = string.char(73, 78, 86, 65, 76, 73, 68)
verifyBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
task.wait(2)
verifyBtn.Text = string.char(86, 69, 82, 73, 70, 89)
verifyBtn.BackgroundColor3 = Color3.fromRGB(50, 205, 50)
end
end)