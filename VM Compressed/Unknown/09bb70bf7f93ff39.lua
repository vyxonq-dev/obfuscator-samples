local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local player = Players.LocalPlayer
local mouse = player:GetMouse()

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DoorsModesHub"

local loadingFrame = Instance.new("Frame", gui)
loadingFrame.Size = UDim2.new(0.5,0,0.15,0)
loadingFrame.Position = UDim2.new(0.25,0,0.4,0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
loadingFrame.BorderSizePixel = 0

local loadingBarBG = Instance.new("Frame", loadingFrame)
loadingBarBG.Size = UDim2.new(0.9,0,0.25,0)
loadingBarBG.Position = UDim2.new(0.05,0,0.55,0)
loadingBarBG.BackgroundColor3 = Color3.fromRGB(40,40,40)
loadingBarBG.BorderSizePixel = 0

local loadingBar = Instance.new("Frame", loadingBarBG)
loadingBar.Size = UDim2.new(0,0,1,0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0,255,0)
loadingBar.BorderSizePixel = 0

local loadingText = Instance.new("TextLabel", loadingFrame)
loadingText.Size = UDim2.new(1,0,0.4,0)
loadingText.Position = UDim2.new(0,0,0.1,0)
loadingText.Text = "Loading Hub..."
loadingText.TextColor3 = Color3.fromRGB(255,255,255)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.SourceSansBold
loadingText.TextScaled = true

for i = 1,100 do
	loadingBar.Size = UDim2.new(i/100,0,1,0)
	wait(0.02)
end

loadingFrame:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/idkman60093/Doors-Modes/refs/heads/main/Doors-Modes-Hub-V24-(Alpha)"))()
