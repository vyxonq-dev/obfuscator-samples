--[[
      This File has been automatically renamed and variable-renamed for better readability.
      (Always verify before using)
]]

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer
local syn = syn
if syn then
  syn = syn.request or http_request or request or http and http.request
else
--   goto label_16
end
local apiUrl = "https://kaleidoscopic-sundae-9598c0.netlify.app/.netlify/functions/verify-key"
local clientId = tostring(game:GetService("RbxAnalyticsService"):GetClientId())
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local statusLabel = Instance.new("TextLabel")
local discordButton = Instance.new("TextButton")
local checkKeyButton = Instance.new("TextButton")
local getKeyButton = Instance.new("TextButton")
local keyTextBox = Instance.new("TextBox")
local closeButton = Instance.new("TextButton")
local imageLabel = Instance.new("ImageLabel")
screenGui.Name = "KeySystemUI"
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
mainFrame.Name = "MainFrame"
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(178, 34, 34)
mainFrame.Size = UDim2.new(0, 442, 0, 225)
mainFrame.Position = UDim2.new(0.338, 0, 0.303, 0)
mainFrame.Active = true
mainFrame.Draggable = true
titleLabel.Parent = mainFrame
titleLabel.BackgroundTransparency = 1
titleLabel.Position = UDim2.new(0.443, 0, 0.02, 0)
titleLabel.Size = UDim2.new(0, 200, 0, 40)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "RYNIX HUB"
titleLabel.TextSize = 30
titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
statusLabel.Parent = mainFrame
statusLabel.BackgroundTransparency = 1
statusLabel.Position = UDim2.new(0.443, 0, 0.22, 0)
statusLabel.Size = UDim2.new(0, 200, 0, 25)
statusLabel.Font = Enum.Font.GothamBold
statusLabel.Text = ""
statusLabel.TextSize = 18
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
discordButton.Parent = mainFrame
discordButton.BackgroundColor3 = Color3.fromRGB(255, 76, 76)
discordButton.Position = UDim2.new(0.544, 0, 0.723, 0)
discordButton.Size = UDim2.new(0, 110, 0, 32)
discordButton.Font = Enum.Font.SourceSansBold
discordButton.Text = "Discord"
discordButton.TextSize = 17
checkKeyButton.Parent = mainFrame
checkKeyButton.BackgroundColor3 = Color3.fromRGB(255, 76, 76)
checkKeyButton.Position = UDim2.new(0.418, 0, 0.508, 0)
checkKeyButton.Size = UDim2.new(0, 110, 0, 32)
checkKeyButton.Font = Enum.Font.SourceSansBold
checkKeyButton.Text = "Check Key"
checkKeyButton.TextSize = 17
getKeyButton.Parent = mainFrame
getKeyButton.BackgroundColor3 = Color3.fromRGB(255, 76, 76)
getKeyButton.Position = UDim2.new(0.686, 0, 0.505, 0)
getKeyButton.Size = UDim2.new(0, 110, 0, 32)
getKeyButton.Font = Enum.Font.SourceSansBold
getKeyButton.Text = "Get Key"
getKeyButton.TextSize = 17
keyTextBox.Parent = mainFrame
keyTextBox.Position = UDim2.new(0.46, 0, 0.305, 0)
keyTextBox.Size = UDim2.new(0, 185, 0, 35)
keyTextBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
keyTextBox.Text = ""
keyTextBox.TextSize = 17
keyTextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
closeButton.Parent = mainFrame
closeButton.BackgroundTransparency = 1
closeButton.Position = UDim2.new(0.936, 0, 0.027, 0)
closeButton.Size = UDim2.new(0, 28, 0, 19)
closeButton.Text = "X"
closeButton.TextSize = 14
imageLabel.Parent = mainFrame
imageLabel.BackgroundTransparency = 1
imageLabel.Position = UDim2.new(-0.001, 0, -0.004, 0)
imageLabel.Size = UDim2.new(0, 174, 0, 225)
imageLabel.Image = "rbxassetid://71404330458124"
checkKeyButton.MouseButton1Click:Connect(function()
  local enteredKey = keyTextBox.Text
  if enteredKey == "" then
    statusLabel.Text = "ENTER A KEY!"
    return
  end
  statusLabel.Text = "CHECKING..."
  local requestResult = nil
  if not pcall(function()
    requestResult = syn({
      Url = apiUrl .. "?key=" .. enteredKey .. "&hwid=" .. clientId,
      Method = "GET",
    })
  end) or not requestResult or not requestResult.Body then
    statusLabel.Text = "REQUEST FAILED"
    return
  end
  local responseData = nil
  pcall(function()
    responseData = HttpService:JSONDecode(requestResult.Body)
  end)
  if responseData then
    if responseData.blocked then
      statusLabel.Text = "HWID BLOCKED!"
    elseif responseData.success then
      if responseData.expires_at and tonumber(responseData.expires_at) < os.time() then
        statusLabel.Text = "KEY EXPIRED!"
        return
      end
      statusLabel.Text = "Key Valid"
      wait(0.8)
      screenGui:Destroy()
      loadstring(game:HttpGet("https://pandadevelopment.net/virtual/file/f78d8adb015a347c"))()
    else
      statusLabel.Text = "Invalid Key"
    end
  else
    statusLabel.Text = "INVALID RESPONSE"
  end
end)
discordButton.MouseButton1Click:Connect(function()
  setclipboard("https://discord.gg/MGuEGvGkBA")
  statusLabel.Text = "DISCORD COPIED!"
end)
getKeyButton.MouseButton1Click:Connect(function()
  setclipboard("https://discord.gg/MGuEGvGkBA")
  statusLabel.Text = "GET KEY IN DISCORD!"
end)
closeButton.MouseButton1Click:Connect(function()
  screenGui:Destroy()
end)
-- label_16:
-- close: Players