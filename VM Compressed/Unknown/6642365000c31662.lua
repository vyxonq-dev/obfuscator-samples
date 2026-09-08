local LOGO_ID = 72067422159294

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local IntroGui = Instance.new("ScreenGui")
IntroGui.Name = "GM_Intro"
IntroGui.ResetOnSpawn = false
IntroGui.Parent = CoreGui

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 800, 0, 800)
Logo.Position = UDim2.new(0.5, -400, 0.5, -400)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://" .. LOGO_ID
Logo.ScaleType = Enum.ScaleType.Fit
Logo.ImageTransparency = 1
Logo.Parent = IntroGui

TweenService:Create(Logo, TweenInfo.new(1.5, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
task.wait(1.8)

task.wait(2.5)

local fadeOut = TweenService:Create(Logo, TweenInfo.new(1.2, Enum.EasingStyle.Quint), {ImageTransparency = 1})
fadeOut:Play()
fadeOut.Completed:Wait()

IntroGui:Destroy()

game.StarterGui:SetCore("SendNotification", {
    Title = "GM";
    Text = "Intro finished – Loading main script...";
    Duration = 3;
})

print("GM Intro finished → Loading main script...")
loadstring(game:HttpGet("https://raw.githubusercontent.com/terminatedfear/Game-Focused-0.01-beta-version-/refs/heads/main/Game%20Focused%200.01%20fixed%20Bugs%20only.txt"))()