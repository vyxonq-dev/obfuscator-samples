-- // Games \\

-- // Emergency Hamburg \\
if game.PlaceId == 7711635737 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Chromeyc/roblox/main/Vystro%20Hub/Games/Emergency%20Hamburg.lua"))()
end
-- // Arsenal \\
if game.PlaceId == 286090429 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Chromeyc/roblox/main/Vystro%20Hub/Games/Arsenal.lua"))()
end
-- // Studs Jumps but every 5 second u get +1 jump \\
if game.PlaceId == 12033633822 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Chromeyc/roblox/refs/heads/main/Vystro%20Hub/Games/studs.lua"))()
end
-- // [UPD]Roblox But Every Second You Get +1 Jump Power \\
if game.PlaceId == 12581519500 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Chromeyc/roblox/refs/heads/main/Vystro%20Hub/Games/Jump"))()
end
-- // [UPDATE] Ability Wars \\
if game.PlaceId == 8260276694 or game.PlaceId == 10201596675 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Chromeyc/roblox/refs/heads/main/Vystro%20Hub/Games/Ability%20Wars.lua"))()
end
-- // Shindo Life \\
if game.PlaceId == 4616652839 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Chromeyc/roblox/refs/heads/main/Vystro%20Hub/Games/Shindolife.lua"))()
end

-- // More Soon \\


-- // Notifications Bubble \\

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
screenGui.IgnoreGuiInset = true


local notificationFrame = Instance.new("Frame")
notificationFrame.Size = UDim2.new(0, 400, 0, 100)
notificationFrame.Position = UDim2.new(0.5, 0, 1, 100) 
notificationFrame.AnchorPoint = Vector2.new(0.5, 1) 
notificationFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
notificationFrame.BackgroundTransparency = 0.3
notificationFrame.BorderSizePixel = 0
notificationFrame.Parent = screenGui
notificationFrame.Visible = false
notificationFrame.ClipsDescendants = true


local uiCorner = Instance.new("UICorner")
uiCorner.CornerRadius = UDim.new(0, 20)
uiCorner.Parent = notificationFrame


local checkmarkIcon = Instance.new("ImageLabel")
checkmarkIcon.Size = UDim2.new(0, 40, 0, 40)
checkmarkIcon.Position = UDim2.new(0, 15, 0, 30)
checkmarkIcon.BackgroundTransparency = 1
checkmarkIcon.Image = "rbxassetid://17091251473" 
checkmarkIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
checkmarkIcon.Parent = notificationFrame


local thanksText = Instance.new("TextLabel")
thanksText.Size = UDim2.new(1, -80, 0, 30) 
thanksText.Position = UDim2.new(0, 65, 0, 20)
thanksText.BackgroundTransparency = 1
thanksText.Font = Enum.Font.GothamBold
thanksText.Text = "Thanks!"
thanksText.TextSize = 24
thanksText.TextColor3 = Color3.fromRGB(255, 255, 255)
thanksText.TextXAlignment = Enum.TextXAlignment.Left
thanksText.Parent = notificationFrame


local messageText = Instance.new("TextLabel")
messageText.Size = UDim2.new(1, -80, 0, 40) 
messageText.Position = UDim2.new(0, 65, 0, 50)
messageText.BackgroundTransparency = 1
messageText.Font = Enum.Font.Gotham
messageText.Text = "Thanks For Using Our Script, Enjoy!\nJoin the Discord .gg/4fyWnejzK4"
messageText.TextSize = 16
messageText.TextColor3 = Color3.fromRGB(200, 200, 200)
messageText.TextXAlignment = Enum.TextXAlignment.Left
messageText.TextWrapped = true
messageText.Parent = notificationFrame


local TweenService = game:GetService("TweenService")
local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)


notificationFrame.Visible = true
local showTween = TweenService:Create(notificationFrame, tweenInfo, {Position = UDim2.new(0.5, 0, 0.9, 0)})
showTween:Play()

wait(4)


local fadeOutDuration = 1
local fadeTween = TweenService:Create(notificationFrame, TweenInfo.new(fadeOutDuration, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {BackgroundTransparency = 1})
fadeTween:Play()


local function fadeOutElement(element)
    local fadeOutTween = TweenService:Create(element, TweenInfo.new(fadeOutDuration), {TextTransparency = 1})
    fadeOutTween:Play()
end

fadeOutElement(thanksText)
fadeOutElement(messageText)
local fadeOutTweenIcon = TweenService:Create(checkmarkIcon, TweenInfo.new(fadeOutDuration), {ImageTransparency = 1})
fadeOutTweenIcon:Play()


fadeTween.Completed:Connect(function()
    screenGui:Destroy()
end)
