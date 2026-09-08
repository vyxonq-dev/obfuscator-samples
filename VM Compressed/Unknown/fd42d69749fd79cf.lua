local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/DrRay-UI-Library/main/DrRay.lua"))()
local window = DrRayLibrary:Load("Eyes The Horror Games", "Default")

local tab = DrRayLibrary.newTab("Yin Logs", "ImageIdHere")
local tab1 = DrRayLibrary.newTab("Inf win, And Teleport", "ImageIdHere")
local tab2 = DrRayLibrary.newTab("Esp", "ImageIdHere")
local tab3 = DrRayLibrary.newTab("Player", "ImageIdHere")

tab.newLabel("Created Script By Cici")
tab.newLabel("version 1.0")
tab.newLabel("Update Logs")
tab.newLabel("Coming Soon")

tab1.newInput("MoneyBags", "Set a value number for MoneyBags", function(a)
   for i = 1, tonumber(a) do
local args = {
    [1] = "bag",
    [2] = a
}
game:GetService("ReplicatedStorage").Events.Mission:FireServer(unpack(args))
end
end)

tab1.newLabel("Teleport Floor")
tab1.newButton("Floor 3", "", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(265.018433, 28.8453426, 52.7641487, 1, 0, 0, 0, 0, -2, 0, 1, 0)
end)

tab1.newButton("Floor 2", "", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(257.84198, 16.3111267, -46.9365692, -0.38268733, 0, 0.923877954, 0, 1, 0, -0.923877954, 0, -0.38268733)
end)

tab1.newButton("Floor 1", "", function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(204.94989, 9.00046825, -8.35001183, 1, 0, 0, 0, 1, 0, 0, 0, 1)
end)

tab2.newButton("Esp Monster", "", function()
text = "Monster" -- Replace this with what you want the tall guy to show up as for the ESP.
item = game:GetService("Workspace").Krasue.Torso
local BillboardGui = Instance.new("BillboardGui")
local TextLabel = Instance.new("TextLabel")
BillboardGui.Parent = item
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.Active = true
BillboardGui.AlwaysOnTop = true
BillboardGui.LightInfluence = 1
BillboardGui.Size = UDim2.new(0, 200, 0, 50)
BillboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
TextLabel.Parent = BillboardGui
TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = text
TextLabel.TextColor3 = Color3.new(255, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14
TextLabel.TextWrapped = true
end)

tab3.newSlider("Speed", "", 300, false, function(s)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

tab3.newButton("Infinite yield", "Admin Command script", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

tab3.newButton("Anti AFK Script", "", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/Yu13RUkY'))()
end)