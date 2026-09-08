local sound = Instance.new("Sound")
sound.Name = ""
sound.Parent = game:GetService("Players").LocalPlayer
sound.SoundId = "rbxassetid://81733232182014"
sound.Volume = 2 -- Sound start

game:GetService("StarterGui"):SetCore("SendNotification", {
Title = "Script loading..",
Text = "Wait..",
Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150"}) --Notification

sound:Play()
sound.Ended:Wait()
sound:Destroy() --Sound end
getgenv().gethui = function() return game:GetService("CoreGui") end
loadstring(game:HttpGet(getgenv().script))() --load script
