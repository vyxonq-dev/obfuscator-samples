
-- MY SCRIPTING SKILLZ IS BAD :<

-- Shits Stuffz
getgenv().settings = {
    AlwaysClicking = false,
	ClickingMode = "MouseButton1Click",
	AttackNearestEnemiez = false,
	SelectedEnemiez = nil,
	AttackSelectedEnemiez = false,
}

local enemiez = {}
for i, v in pairs(workspace._ENEMIES[game:GetService("Players").LocalPlayer:GetAttribute("CurrentArea")]:GetChildren()) do
	if table.find(enemiez, v.Name) then
		-- do nothing yes absolutely do nothing
	else
		table.insert(enemiez, v.Name)
	end
end
local GetClosestBitches = (newcclosure(function()
    local distance = 9e9
	local bitches
    for i,v in pairs(workspace._ENEMIES[game:GetService("Players").LocalPlayer:GetAttribute("CurrentArea")]:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < distance then
                distance = mag
                bitches = v
            end
        end
    end
    return bitches
end))
local GetClosestBitches2 = (newcclosure(function() -- for attack selected enemiez
    local distance = 1000
	local bitches
    for i,v in pairs(workspace._ENEMIES[game:GetService("Players").LocalPlayer:GetAttribute("CurrentArea")]:GetChildren()) do
        if v:IsA("Model") and v:FindFirstChild("Torso") and v.Name == settings.SelectedEnemiez then
            local mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
            if mag < distance then
                distance = mag
                bitches = v
            end
        end
    end
    return bitches
end))
local KillClosestBitches = (newcclosure(function()
	local args = {[1] = {[1] = {[1] = "\3",[2] = "Click",[3] = "Execute",[4] = GetClosestBitches()}}}
	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))	
end))
local KillClosestBitches2 = (newcclosure(function()
	local args = {[1] = {[1] = {[1] = "\3",[2] = "Click",[3] = "Execute",[4] = GetClosestBitches2()}}}
	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))	
end))
local FireSignalButtonClick = (newcclosure(function() firesignal(game:GetService("Players").LocalPlayer.PlayerGui._SIDE.Buttons["3"].Frame.Click.MouseButton1Click) end))
local RemoteEventClick = (newcclosure(function() 
	local args = {[1] = {[1] = {[1] = "\3",[2] = "Click",[3] = "Execute"}}} 
	game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args)) 
end))

-- Ui
local dexed = loadstring(game:HttpGet('https://raw.githubusercontent.com/Breadido/Dexed/main/source.lua'))()
local ui = dexed.SetupUI("Anime Soul X Simulator | Made By Breadido | Discord: breadido")
local page = ui.CreatePage("Main")

local enemiezList = page.CreateDropdown("Select Enemies", enemiez,function(a)
	settings.SelectedEnemiez = a
end)
game:GetService("Players").LocalPlayer:GetAttributeChangedSignal("CurrentArea"):Connect(function()
	table.clear(enemiez)
	enemiezList.ClearDropdownList()
	task.wait(0.1)
	for i, v in pairs(workspace._ENEMIES[game:GetService("Players").LocalPlayer:GetAttribute("CurrentArea")]:GetChildren()) do
		if table.find(enemiez, v.Name) then
			-- do nothing yes absolutely do nothing
		else
			table.insert(enemiez, v.Name)
		end
	end
	for i, v in pairs(enemiez) do
		enemiezList.CreateOption(v)
	end
end)
page.CreateToggle("Attack Selected Enemies", function(a)
	settings.AttackSelectedEnemiez = a
end)

page.CreateToggle("Attack Auras", function(a)
	settings.AttackNearestEnemiez = a
end)

page.CreateDropdown("Clicking Mode", {"MouseButton1Click","RemoteEventClick"},function(a)
	settings.ClickingMode = a
end)

page.CreateToggle("Always Clicking", function(a)
	settings.AlwaysClicking = a
end)

-- Loops(i use heartbeat loop because i wanna try it because why not :>)
game:GetService("RunService").Heartbeat:connect(function()
	if settings.AlwaysClicking then
		if settings.ClickingMode == "MouseButton1Click" then
			FireSignalButtonClick()
		else
			RemoteEventClick()
		end
	end
end)
game:GetService("RunService").Heartbeat:connect(function()
	if settings.AttackNearestEnemiez then
		KillClosestBitches()
		task.wait(0.155)
	end
end)
game:GetService("RunService").Heartbeat:connect(function()
	if settings.AttackSelectedEnemiez then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = GetClosestBitches2().Torso.CFrame * CFrame.new(0,0,3)
		KillClosestBitches2()
		task.wait(0.25)
	end
end)
