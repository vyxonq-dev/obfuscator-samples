local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Dinosaur Arcade GUI", HidePremium = false, SaveConfig = false, ConfigFolder = "Dinosaur Arcade GUI Config"})

OrionLib:MakeNotification({
	Name = "Credits:",
	Content = "Shag420#6729",
	Image = "rbxassetid://0",
	Time = 10
})

local Tab = Window:MakeTab({
	Name = "Auto-Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddButton({
	Name = "Pickup Spawned Items : May be kicked : High Chance",
	Callback = function()
for i,v in pairs(game:GetService("Workspace").Malicious.SpawnedItems:GetDescendants()) do
if v:IsA("Part") then
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(10, Enum.EasingStyle.Linear)
tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = v.CFrame + Vector3.new(0, 10, 0)}):Play()
wait(10.5)
for i,v in pairs(game:GetDescendants()) do
if v:IsA("ProximityPrompt") then
fireproximityprompt(v)
end
end
wait(1)
end
end
end
})

Tab:AddButton({
	Name = "Get Fossils : May get kicked",
	Callback = function()
        for i,v in pairs(game:GetService("Workspace").GameMap.Fossils:GetDescendants()) do
            if v.Name == "Position" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Value)
            wait(0.5)
            for count = 1,5 do
            for i,v in pairs(game:GetDescendants()) do
            if v:IsA("ProximityPrompt") then
            fireproximityprompt(v)
            end
            end
            wait(2)
            end
            wait(3.5)
            end
            end
end
})

Tab:AddButton({
	Name = "Goto Jerry : Buy or Sell Items",
	Callback = function()
        tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(10, Enum.EasingStyle.Linear)
        tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(game:GetService("Workspace").Jerry.Position.Value)}):Play()
    end
})

-----------------------------------------------------------------

local Tab = Window:MakeTab({
	Name = "Pack Options",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddTextbox({
	Name = "Make Pack",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
workspace.GameFunctions.PackFunctions.leavePack:InvokeServer()
wait(0.1)
local args = {
    [1] = Value
}

workspace.GameFunctions.PackFunctions.createPack:InvokeServer(unpack(args))
    end	  
})

Tab:AddButton({
	Name = "Invite All To Pack",
	Callback = function()
        for i,v in next, game.Players:GetChildren() do
            local args = {
                [1] = v 
            }
            
            workspace.GameFunctions.PackFunctions.sendInvite:InvokeServer(unpack(args))
            end
    end
})

Tab:AddButton({
	Name = "Kick All From Pack",
	Callback = function()
        for i,v in next, game.Players:GetChildren() do
            local args = {
                [1] = v.UserId
            }
            
            workspace.GameFunctions.PackFunctions.kickMember:InvokeServer(unpack(args))
            end
    end
})

Tab:AddColorpicker({
	Name = "Pack Color",
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(Value)
	local args = {
    [1] = Value --[[Color3]]
}

workspace.GameFunctions.PackFunctions.changePackColor:InvokeServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Rainbow Pack Color",
	Callback = function()
    getgenv().rainbow = true
    while rainbow do
    wait(0.5)
    local args = {
        [1] = Color3.fromRGB(math.random(1,255), math.random(1,255), math.random(1,255))
    }
    
    workspace.GameFunctions.PackFunctions.changePackColor:InvokeServer(unpack(args))
end
    end
})

Tab:AddButton({
	Name = "Stop Rainbow Pack Color",
	Callback = function()
    getgenv().rainbow = false
    end
})
OrionLib:Init()