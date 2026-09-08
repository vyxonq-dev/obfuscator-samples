
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("Open For Free", "Default")

local tab = DrRayLibrary.newTab("Yin Hub Logs", "ImageIdHere")
local tab1 = DrRayLibrary.newTab("Auto Keys Farm", "7733965118")
local tab2 = DrRayLibrary.newTab("Shop", "7734056813")
local tab3 = DrRayLibrary.newTab("Player", "7734056813")

tab.newLabel("Created Script Made By Cici")
tab.newLabel("Version v2.0")
tab.newLabel("Added Auto Skip Chest Tap")

tab2.newToggle("Auto Skip Chest Tap", "", false, function(toggleState)
    if toggleState then
_G.skip = true
while _G.skip == true do
game:GetService("ReplicatedStorage").Assets.Remotes.Misc.FinishCase:FireServer()
wait(0.1)
end
    else
_G.skip = false
while _G.skip == true do
game:GetService("ReplicatedStorage").Assets.Remotes.Misc.FinishCase:FireServer()
wait(0.1)
end
    end
end)

tab2.newButton("Server Hop", "", function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Jelly-plays/Rejoin-script/main/obf_L744By559M18BbuseSG6en8r1zL31daK9060LV7WyvmS4bQp92aONWfwRE36FdcZ.lua.txt"))();
end)

tab1.newToggle("Auto 1 Keys Win", "Easy Obby", false, function(toggleState)
    if toggleState then
_G.test = true
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-382.766113, 11.4353085, -1270.64185, 0, 0, -1, 0, 1, 0, 1, 0, 0)
wait(0.1)
end
    else
_G.test = false
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-382.766113, 11.4353085, -1270.64185, 0, 0, -1, 0, 1, 0, 1, 0, 0)
wait(0.1)
end
    end
end)

tab1.newToggle("Auto 2 Keys Win", "Normal Obby", false, function(toggleState)
    if toggleState then
_G.test = true
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.766113, 11.4353027, -1729.64185, 0, 0, -1, 0, 1, 0, 1, 0, 0)
wait(0.1)
end
    else
_G.test = false
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.766113, 11.4353027, -1729.64185, 0, 0, -1, 0, 1, 0, 1, 0, 0)
wait(0.1)
end
    end
end)

tab1.newToggle("Auto 2 Keys Win", "Random Paths", false, function(toggleState)
    if toggleState then
_G.test = true
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-885.108276, 11.4353104, -288.733185, 1, 0, 0, 0, 1, 0, 0, 0, 1)
wait(0.1)
end
    else
_G.test = false
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-885.108276, 11.4353104, -288.733185, 1, 0, 0, 0, 1, 0, 0, 0, 1)
wait(0.1)
end
    end
end)

tab1.newToggle("Auto 4 Keys Win", "Troll Obby", false, function(toggleState)
    if toggleState then
_G.test = true
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(807.856934, 11.4353027, -230.640015, -1, 0, 0, 0, 1, 0, 0, 0, -1)
wait(0.1)
end
    else
_G.test = false
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(807.856934, 11.4353027, -230.640015, -1, 0, 0, 0, 1, 0, 0, 0, -1)
wait(0.1)
end
    end
end)

tab1.newToggle("Auto 4 Keys Win", "Funny Obby", false, function(toggleState)
    if toggleState then
_G.test = true
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1094.85693, 11.4353027, -348.640015, -1, 0, 0, 0, 1, 0, 0, 0, -1)
wait(0.1)
end
    else
_G.test = false
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1094.85693, 11.4353027, -348.640015, -1, 0, 0, 0, 1, 0, 0, 0, -1)
wait(0.1)
end
    end
end)

tab1.newToggle("Auto 4 Keys Win", "Hard Obby", false, function(toggleState)
    if toggleState then
_G.test = true
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.765625, 11.4353027, 1236.98193, 0, 0, 1, 0, 1, -0, -1, 0, 0)
wait(0.1)
end
    else
_G.test = false
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-264.765625, 11.4353027, 1236.98193, 0, 0, 1, 0, 1, -0, -1, 0, 0)
wait(0.1)
end
    end
end)

tab1.newToggle("Auto 7 Keys Win", "Insane Obby", false, function(toggleState)
    if toggleState then
_G.test = true
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-382.765869, 11.4353075, 1338.54126, 0, 0, 1, 0, 1, -0, -1, 0, 0)
wait(0.1)
end
    else
_G.test = false
while _G.test == true do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-382.765869, 11.4353075, 1338.54126, 0, 0, 1, 0, 1, -0, -1, 0, 0)
wait(0.1)
end
    end
end)

tab2.newButton("Buy Basic Chest", "You Need Key 1", function()
local args = {
    [1] = "BasicCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
end)
tab2.newButton("Buy Rare Chest", "You Need Key 3", function()
local args = {
    [1] = "RareCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
end)

tab2.newButton("Buy Gold Chest", "You Need Key 5", function()
local args = {
    [1] = "GoldCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
end)

tab2.newButton("Buy Legendary Chest", "You Need Key 25", function()
local args = {
    [1] = "LegendaryCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
end)

tab2.newToggle("Auto Buy Basic Chest", "", false, function(toggleState)
    if toggleState then
_G.Basic = true
while _G.Basic == true do
local args = {
    [1] = "BasicCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    else
_G.Basic = false
while _G.Basic == true do
local args = {
    [1] = "BasicCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    end
end)

tab2.newToggle("Auto Buy Rare Chest", "", false, function(toggleState)
    if toggleState then
_G.Rare = true
while _G.Rare == true do
local args = {
    [1] = "RareCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    else
_G.Rare = false
while _G.Rare == true do
local args = {
    [1] = "RareCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    end
end)

tab2.newToggle("Auto Buy Gold Chest", "", false, function(toggleState)
    if toggleState then
_G.Gold = true
while _G.Gold == true do
local args = {
    [1] = "GoldCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    else
_G.Gold = false
while _G.Gold == true do
local args = {
    [1] = "GoldCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    end
end)

tab2.newToggle("Auto Buy Legendary Chest", "", false, function(toggleState)
    if toggleState then
_G.Leg = true
while _G.Leg == true do
local args = {
    [1] = "LegendaryCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    else
_G.Leg = false
while _G.Leg == true do
local args = {
    [1] = "LegendaryCase"
}

game:GetService("ReplicatedStorage").Assets.Remotes.Misc.BuyCase:FireServer(unpack(args))
wait(0.1)
end
    end
end)

tab3.newSlider("Speed", "", 300, true, function(s)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

tab3.newButton("Infinite yield", "Admin Command script", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

tab3.newButton("Anti AFK Script", "", function()
wait(0.5)local ba=Instance.new("ScreenGui")
local ca=Instance.new("TextLabel")local da=Instance.new("Frame")
local _b=Instance.new("TextLabel")local ab=Instance.new("TextLabel")ba.Parent=game.CoreGui
ba.ZIndexBehavior=Enum.ZIndexBehavior.Sibling;ca.Parent=ba;ca.Active=true
ca.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ca.Draggable=true
ca.Position=UDim2.new(0.698610067,0,0.098096624,0)ca.Size=UDim2.new(0,370,0,52)
ca.Font=Enum.Font.SourceSansSemibold;ca.Text="Anti AFK Script"ca.TextColor3=Color3.new(0,1,1)
ca.TextSize=22;da.Parent=ca
da.BackgroundColor3=Color3.new(0.196078,0.196078,0.196078)da.Position=UDim2.new(0,0,1.0192306,0)
da.Size=UDim2.new(0,370,0,107)_b.Parent=da
_b.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)_b.Position=UDim2.new(0,0,0.800455689,0)
_b.Size=UDim2.new(0,370,0,21)_b.Font=Enum.Font.Arial;_b.Text="Idk"
_b.TextColor3=Color3.new(0,1,1)_b.TextSize=20;ab.Parent=da
ab.BackgroundColor3=Color3.new(0.176471,0.176471,0.176471)ab.Position=UDim2.new(0,0,0.158377,0)
ab.Size=UDim2.new(0,370,0,44)ab.Font=Enum.Font.ArialBold;ab.Text="Status: Active"
ab.TextColor3=Color3.new(0,1,1)ab.TextSize=20;local bb=game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
bb:CaptureController()bb:ClickButton2(Vector2.new())
ab.Text="Roblox tried to kick u but i kicked him instead"wait(2)ab.Text="Status : Active"end)
end)