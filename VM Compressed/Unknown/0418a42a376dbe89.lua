local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Slap Battles But Bad | WaponGameHolder", "BloodTheme")
 
local MainTab = Window:NewTab("Main")
local MainTab1 = MainTab:NewSection("MainScripts")
 
--Buttons
 
MainTab1:NewButton("Destroy Portal", "Breaks Default Portal", function()
for i,v in pairs(workspace.Lobby:GetChildren()) do
    if v.Name == "default stand" then
        if v:FindFirstChild("Hitbox") then
            if v.Hitbox:FindFirstChild("ClickDetector") then
                if v.Hitbox.ClickDetector.GloveToChange.Value == "Charge" then
                    fireclickdetector(v.Hitbox.ClickDetector)
                end
            end
        end
    end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(14.443, 377.948, 411.27)
wait(0.1)
for i,v in pairs(workspace.Lobby:GetChildren()) do
    if v.Name == "default stand" then
        if v:FindFirstChild("Hitbox") then
            if v.Hitbox:FindFirstChild("ClickDetector") then
                if v.Hitbox.ClickDetector.GloveToChange.Value == "Default" then
                    fireclickdetector(v.Hitbox.ClickDetector)
                end
            end
        end
    end
end
end)
 
MainTab1:NewButton("AutoGiveAllBadges", "gives all touch badges in game", function()
local startpositionofplayer = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
for i,v in pairs(workspace:GetChildren()) do
    if v.Name == "Badge Giver (open me)" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(1)
    end
end
for i,v in pairs(workspace.Lobby:GetChildren()) do
    if v.Name == "Badge Giver (open me)" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(1)
    end
end
for i,v in pairs(workspace.Map:GetChildren()) do
    if v.Name == "Badge Giver (open me)" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(1)
    end
end
for i,v in pairs(workspace["ship map"]:GetChildren()) do
    if v.Name == "Badge Giver (open me)" then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
        wait(1)
    end
end
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Map["ULTRA INSTINCT PART"].CFrame
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.82, -3.54, 1279.45)
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = startpositionofplayer
end)
local stop = true
MainTab1:NewButton("SpamSlapEntireLobby", "keep your glove in your inventory and to stop equip the glove", function()
stop = not stop
while wait(1) do
for i,v in pairs(game.Players:GetPlayers()) do
    if v.Name ~= game.Players.LocalPlayer.Name and stop == false then
        game:GetService("Players").LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Event:FireServer("slash", v.Character, Vector3.new(0, 0, 0))
    end
end
end
end)
local username = ""
MainTab1:NewTextBox("FramePersonName", "Frame person textbox for FrameSlapEveryone", function(txt)
    username = txt
end)
MainTab1:NewButton("FrameSlapEveryone", "for this too work they must have a glove equipped", function()
while wait(1) do
for i,v in pairs(game.Players:GetPlayers()) do
    if game.Players:FindFirstChild(username) and v.Name ~= username then
        game:GetService("Players")[username].Character:FindFirstChildOfClass("Tool").Event:FireServer("slash", v.Character, Vector3.new(0, 0, 0))
    end
end
end
end)
MainTab1:NewButton("500Power", "sets any glove you have to 500 power", function()
    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Power.Value = 500
end)
MainTab1:NewButton("9999Power", "sets any glove you have to 9999 power", function()
    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Power.Value = 9999
end)
local reachenabled = false
MainTab1:NewToggle("ReachGlove", "Click on someone from far away and you slap them", function(state)
    if state then
        reachenabled = true
        local mouse = game.Players.LocalPlayer:GetMouse()
mouse.Button1Down:Connect(function()
    local hit = mouse.Target
    if hit and hit:IsA("BasePart") and hit.Parent:FindFirstChild("Humanoid") and reachenabled == true then
        -- the player clicked on a part
        local tool = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool")
        local char = game:GetService("Players").LocalPlayer.Character
        local velocity=char:WaitForChild("HumanoidRootPart").CFrame.LookVector*tool:WaitForChild("Power").Value
        local victimplayer = hit.Parent
        game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Tool").Event:FireServer("slash", victimplayer, velocity)
        -- do something with the part, like changing its color or position
    end
end)
else
    reachenabled = false
    end
end)
MainTab1:NewToggle("Anti Kick Glove", "as soon as anyone pulls out the kick glove it slaps themself", function(state)
print(state)
	while wait(0.1) do
		if state then
			for i,v in pairs(game.Players:GetPlayers()) do
				if v.Character:FindFirstChild("sus") then
				local tool = v.Character.sus
					local velocity=game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame.LookVector*tool:WaitForChild("Power").Value
        			local victimplayer = v.Character
        			v.Character:FindFirstChild("sus").Event:FireServer("slash", victimplayer, velocity)
				end
			end
		end
	end
end)
MainTab1:NewToggle("Show Admin Panel", "shows the admin panel like THE REAL ONE", function(state)
print(state)
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("Dien't") then
game.Players.LocalPlayer.PlayerGui["Dien't"].TextButton.Visible = state
else
warn("show admin panel broke cuz of update")
end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("touchey") then
game.Players.LocalPlayer.PlayerGui["touchey"].TextButton.Visible = state
else
warn("show admin panel broke cuz of update")
end
end)
MainTab1:NewToggle("Show Killstreak buttons", "gives you kills for kill streak(IM NOT KIDDING THIS IS SERVER SIDE)", function(state)
print(state)
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("kill button 1") then
game.Players.LocalPlayer.PlayerGui["kill button 1"].SlapsUIButton.Visible = state
else
warn("show admin panel broke cuz of update")
end
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("kill bitton 2") then
game.Players.LocalPlayer.PlayerGui["kill bitton 2"].SlapsUIButton.Visible = state
else
warn("show admin panel broke cuz of update")
end
end)