--Made By: Shag420

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "ALBURG ST. PRISON GUI : Shag420", HidePremium = false, SaveConfig = false, ConfigFolder = ""})
local vu = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
prompt.HoldDuration = -1
end)

OrionLib:MakeNotification({
	Name = "Credits:",
	Content = "Shag420",
	Image = "rbxassetid://0",
	Time = 10
})
local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Made By:","Shag420")
Tab:AddParagraph("Discord Server:","https://discord.gg/PPt7ukrUmV")
Tab:AddLabel("Warning : 150K Money Cap")
Tab:AddToggle({
	Name = "[Fast] Box Auto-Farm : $100-$200 Per Second",
	Default = false,
	Callback = function(Value)

getgenv().BOXY = Value

while BOXY do
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Jobs["Box Delivery"].DontDeleteTheseObjects.GetJobPart.CFrame + Vector3.new(0,6,0)
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, game.Workspace.Map.Jobs["Box Delivery"].DontDeleteTheseObjects.GetJobPart.CFrame.p)
fireproximityprompt(game.Workspace.Map.Jobs["Box Delivery"].DontDeleteTheseObjects.GetJobPart.ProximityPrompt,1)
firetouchinterest(game.Workspace.Map.Jobs["Box Delivery"].DontDeleteTheseObjects.TargetPart, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 1)
firetouchinterest(game.Workspace.Map.Jobs["Box Delivery"].DontDeleteTheseObjects.TargetPart, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, 0)
task.wait() 
end

end    
})
Tab:AddToggle({
	Name = "[Slow] Dish Washing Auto-Farm : $30 Per 5-7 Seconds",
	Default = false,
	Callback = function(Value)

getgenv().washy = Value
if washy == true then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Jobs["Dish Washing"].Giver.CFrame
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, game.Workspace.Map.Jobs["Dish Washing"].Giver.CFrame.p)
task.wait(0.25)
fireproximityprompt(game.Workspace.Map.Jobs["Dish Washing"].Giver.ProximityPrompt,1)
else
--nothing
end
while washy do
if game.Players.LocalPlayer.Backpack:FindFirstChild("Cloth") then
    game.Players.LocalPlayer.Backpack:FindFirstChild("Cloth").Parent = game.Players.LocalPlayer.Character
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Map.Jobs["Dish Washing"].Part.CFrame
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, game.Workspace.Map.Jobs["Dish Washing"].Part.CFrame.p)
fireproximityprompt(game.Workspace.Map.Jobs["Dish Washing"].Part.ProximityPrompt,1)
task.wait()
end
end    
})
Tab:AddToggle({
	Name = "Open/Close Safe",
	Default = false,
	Callback = function(Value)

game.Players.LocalPlayer.PlayerGui.Inventory.Background.Visible = Value

end    
})

local Tab = Window:MakeTab({
	Name = "Items/Outfits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Made By:","Shag420")
for i,v in next, game.Workspace.ETC.Givers:GetDescendants() do
    if v:IsA("ProximityPrompt") then
Tab:AddButton({
	Name = v.ObjectText,
	Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
task.wait(0.25)
fireproximityprompt(v,1)
  	end    
})
end
end
Tab:AddLabel("Outfits")
for i,v in next, game.Workspace.Map.Prison.Inside:GetDescendants() do
    if v:IsA("ProximityPrompt") then
        if v.ActionText == "Put On" then
Tab:AddButton({
	Name = v.Parent.Parent.name,
	Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
task.wait(0.25)
fireproximityprompt(v,1)
  	end    
})
end
end
end
local Tab = Window:MakeTab({
	Name = "Shops",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Made By:","Shag420")

for i,v in next, game.Workspace:GetDescendants() do
    if v:IsA("ProximityPrompt") then
        if string.find(v.ActionText,"Shop") then
Tab:AddButton({
	Name = v.ActionText,
	Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
task.wait(0.25)
fireproximityprompt(v,1)
  	end    
})
end
end
end

local Tab = Window:MakeTab({
	Name = "Fun",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Made By:","Shag420")

Tab:AddButton({
	Name = "Turn Alarm On/Off",
	Callback = function()
        fireclickdetector(game.Workspace.AlarmSystem.Switches.Switch.Select.ClickDetector)
  	end    
})

local Tab = Window:MakeTab({
	Name = " BM Items [GP]",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddParagraph("Made By:","Shag420")
Tab:AddLabel("!!MUST OWN THE BLACKMARKET GAMEPASS!!")
for i,v in next, game.Workspace.ETC["Black Market Dealer"]:GetDescendants() do
    if v:IsA("ProximityPrompt") then
Tab:AddButton({
	Name = v.ActionText,
	Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Parent.CFrame
workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p, v.Parent.CFrame.p)
task.wait(0.25)
fireproximityprompt(v,1)
  	end    
})
end
end
local Tab = Window:MakeTab({
	Name = "Chat Commands",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420")
Tab:AddLabel("Type these into chat eg. /pay {amount}, /handto {user}")
Tab:AddLabel("Usernames for /handto can be simplified")
Tab:AddLabel("---------------------------------------------------------")
Tab:AddLabel("/ck")
for i,v in next, game.Workspace.ETC.Scripts.Commands:GetChildren() do
Tab:AddLabel(v.Name)
end
Tab:AddLabel("/handto {user}")
local Tab = Window:MakeTab({
    Name = "Misc.",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420")
Tab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
          loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
      end    
})

Tab:AddButton({
	Name = "Reset",
	Callback = function()
      	game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Dead)
  	end    
})