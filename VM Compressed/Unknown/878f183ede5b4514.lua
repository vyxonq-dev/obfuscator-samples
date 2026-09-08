local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local StarterGui = game:GetService("StarterGui")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "WelcomeOverlay"
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false

local bg = Instance.new("Frame", gui)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.Position = UDim2.new(0, 0, 0, 0)
bg.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

local uiCorner = Instance.new("UICorner", bg)
uiCorner.CornerRadius = UDim.new(0, 0)

local label = Instance.new("TextLabel", bg)
label.Size = UDim2.new(1, -40, 0, 80)
label.Position = UDim2.new(0.5, 0, 0.5, 0)
label.AnchorPoint = Vector2.new(0.5, 0.5)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.Text = ""

local fullText = "Made by youcannotsth"
local typeSpeed = 4

task.spawn(function()
	for i = 1, #fullText do
		label.Text = string.sub(fullText, 1, i)
		task.wait(1 / typeSpeed)
	end

	task.wait(1.5)

	local tweenOutBG = TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1})
	local tweenOutLabel = TweenService:Create(label, TweenInfo.new(0.5), {TextTransparency = 1})

	tweenOutBG:Play()
	tweenOutLabel:Play()
	tweenOutBG.Completed:Wait()

	gui:Destroy()

	local success, err = pcall(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JeckAsChristopher/h/main/shaders.lua"))()
	end)

	local TextChatService = game:GetService("TextChatService")
local systemChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXSystem")

systemChannel:DisplaySystemMessage(
  "<font color='#FFC8FF' face='SourceSansBold' size='20'>Made by youcannotsth</font>"
    )

	-- Optional error notification
	if not success then
		StarterGui:SetCore("SendNotification", {
			Title = "Shader Load Failed",
			Text = tostring(err),
			Duration = 5
		})
	end
end)
