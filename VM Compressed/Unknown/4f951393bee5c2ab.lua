local inMatch = false
local exti =loadstring(game:HttpGet("https://raw.githubusercontent.com/Pyth0n1zed/GUI-Framework-Roblox/refs/heads/main/script.lua"))()()


local Players = game:GetService("Players")
local hitbox = Instance.new("Part")
local VirtualInputManager = game:GetService("VirtualInputManager") or getvirtualinputmanager()
local player = Players.LocalPlayer
local uis = game:GetService("UserInputService")
local character = player.Character or player.CharacterAdded:Wait()
local hrp = character:WaitForChild("HumanoidRootPart")
local camera = workspace.CurrentCamera
local itemsFolder = workspace:FindFirstChild("Items")
local map = workspace:FindFirstChild("Map")
local ts = game:GetService("TweenService")
local rs = game:GetService("RunService")
local events = game.ReplicatedStorage:FindFirstChild("Events")
local DisableVacNotif = false
local autoWin = false
local wKeyPressed = false
local sKeyPressed = false
local aKeyPressed = false
local dKeyPressed = false
local postBusItemVac = true
local tpWalkSpeed = 0
uis.InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        wKeyPressed = true
	elseif input.KeyCode == Enum.KeyCode.A then
		aKeyPressed = true
	elseif input.KeyCode == Enum.KeyCode.S then
        sKeyPressed = true
	elseif input.KeyCode == Enum.KeyCode.D then
        dKeyPressed = true
    end
end)


uis.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.W then
        wKeyPressed = false
	elseif input.KeyCode == Enum.KeyCode.A then
		aKeyPressed = false
	elseif input.KeyCode == Enum.KeyCode.S then
        sKeyPressed = false
	elseif input.KeyCode == Enum.KeyCode.D then
        dKeyPressed = false
    end
end)
if map then
    local originOffice = map:FindFirstChild("OriginOffice")
    if originOffice then
        originOffice:Destroy()
    end
end
local ok = true
task.spawn(function()
	while true do
		local asd = player.PlayerGui:FindFirstChild("Countdown")
		if asd then
			if tonumber(asd.Countdown.TimeLeft.Text) < 3 then
				ok = false
				task.wait(3)
				inMatch = true
				task.wait(8)
				ok = true
				asd:Destroy()
			end
		end
	task.wait(0.5)
	end
end)

local defMoveDelay = 0.03
local defPauseTime = 0.09
local moveDelay = 0.1
local pauseTime = 0.09

local function moveTo(part)
    local direction = (part.Position - hrp.Position).Unit
    local targetPos = part.Position - direction * 3
    local targetCF = CFrame.new(targetPos)
    hrp.CFrame = targetCF
end

local function moveTo2(part)
    local direction = (part.Position - hrp.Position).Unit
    local targetPos = part.Position + direction * 3
    local targetCF = CFrame.new(targetPos)
    hrp.CFrame = targetCF
end

local function faceTarget(part)
    local lookC = CFrame.lookAt(hrp.Position,part.Position)
	local _,y,_ = lookC:ToEulerAnglesYXZ()
	local finalC = CFrame.Angles(0,y,0)
	hrp.CFrame=hrp.CFrame*finalC
	-- no more weird maths

end

local function rotateCameraTo(part)
    local camPos = camera.CFrame.Position
    local lookAt = part.Position
    camera.CFrame = CFrame.new(camPos, lookAt)
end

local function sendFKey()
    for _ = 1, 3 do
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
        task.wait(0.05)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.F, false, game)
        task.wait(0.05)
    end
end

local function sendSpaceKey()
	VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
	task.wait(0.05)
	VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end
function explode()
	local iii = 1
	for _,v in pairs(player:GetDescendants()) do
		if v.Name == "Forcefield Crystal" then
			v.Parent = character
			v:Activate()
			task.wait(0.5)
			break
		end
	end
	for _,v in pairs(player:GetDescendants()) do
		if v.Name == "Bomb" then
			if iii == 7 then task.wait(2) end
			v.Parent = character
			v:Activate()
			iii = iii + 1
			task.wait(0.3)
		end
	end
end
local ii = 1
local function CollectItemsSR(itemNames, repeatCount, amount)
    if not amount then amount = 67 end
    local cii = 1
    repeatCount = repeatCount or 3
    for i = 1, repeatCount do
        for _, tool in ipairs(itemsFolder:GetChildren()) do
			if cii == amount then break end
            if tool:IsA("Tool") and tool:FindFirstChild("Handle") and table.find(itemNames, tool.Name) and ok then
				local currentItems = 0
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					currentItems = currentItems + 1
				end
				local currentcurrentItems = 0
                local handle = tool.Handle
                moveDelay = ((hrp.Position - tool.Handle.Position).Magnitude/175) * defMoveDelay
				if moveDelay < defMoveDelay then moveDelay = defMoveDelay end
				--if moveDelay > 0.6 then moveDelay = 0.6 end
				print(moveDelay)

				moveTo(handle)
                task.wait(pauseTime)
                faceTarget(handle)
                rotateCameraTo(handle)
                task.wait(pauseTime)
				if ii == 1 then task.wait(5) end
				if ii == 2 then task.wait(1) end
                sendFKey()
                task.wait(pauseTime)
                sendSpaceKey()
                task.wait(moveDelay)
				for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					currentcurrentItems = currentcurrentItems + 1
				end
				if currentcurrentItems == currentItems then
					moveTo2(handle)
                	task.wait(pauseTime)
                	faceTarget(handle)
                	rotateCameraTo(handle)
                	task.wait(pauseTime)
                	sendFKey()
                	task.wait(pauseTime)
                	sendSpaceKey()
               		task.wait(moveDelay)
				end
				ii = ii + 1
				cii = cii + 1
            elseif not ok then
				break
				--[[
				repeat task.wait() until inMatch
				if not postBusItemVac then continue end
				if autoWin then explode() end
				if not DisableVacNotif then
					exti:Notify("Please do not attempt to move or turn your camera, Grab All Items will continue to pick up items after the game has started.", 8)
				end
                task.wait(4)
				game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BusJumping"):FireServer()
				task.wait()
				character:PivotTo(CFrame.new(41.9398575, 28.8037186, -322.898193))
				ok = true
				task.wait(1)
				for i = 1, 2 do
   					VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.I, false, game)
    				task.wait(0.1) -- hold
    				VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.I, false, game)
    				task.wait(0.2) -- wait between presses
				end]]--
			--elseif not ok and autoWin then
				--return
			end
        end
    end
    hrp.CFrame = hrp.CFrame + Vector3.new(0,100,0)
	print(ii.." items collected")
end


local function CollectAllPermanentItemsSR()
	exti:Notify("Item collection started. Please do not move your character or camera.", 5)
    --CollectItemsSR({"Potion of Strength", "Frog Potion", "Speed Potion", "Boba", "Bull's essence"},5)
	CollectItemsSR({"Potion of Strength"})
	CollectItemsSR({"Speed Potion"})
	CollectItemsSR({"Boba"})
	CollectItemsSR({"Bull's essence"})
	CollectItemsSR({"Frog Potion"})
	if not DisableVacNotif then
		exti:Notify("Item collection complete. You may now move your character and camera.", 5)
	end
end

local function CollectAllStrengthItemsSR()
	exti:Notify("Item collection started. Please do not move your character or camera.", 5)
    --CollectItemsSR({"Bull's essence","Potion of Strength","Boba","True Power","Sphere of fury"},5)
	CollectItemsSR({"Potion of Strength"})
	CollectItemsSR({"Bull's essence"})
	CollectItemsSR({"Boba"})
	CollectItemsSR({"Sphere of fury"})
	CollectItemsSR({"True Power"})
	if not DisableVacNotif then
		exti:Notify("Item collection complete. You may now move your character and camera.", 5)
	end
end

local function CollectAllOneShottyItemsSR()
	exti:Notify("Item collection started. Please do not move your character or camera.", 5)
    --CollectItemsSR({"Cube of Ice","Bull's essence","Potion of Strength","Boba","True Power","Sphere of fury"},5)
	CollectItemsSR({"Potion of Strength"})
	CollectItemsSR({"Bull's essence"})
	CollectItemsSR({"Boba"})
	CollectItemsSR({"Sphere of fury"})
	CollectItemsSR({"True Power"})
	CollectItemsSR({"Cube of Ice"})
	if not DisableVacNotif then
		exti:Notify("Item collection complete. You may now move your character and camera.", 5)
	end
end

local function CollectAllHealingItemsSR()
	exti:Notify("Item collection started. Please do not move your character or camera.", 5)
    --CollectItemsSR({"Apple","Bandage","First Aid Kit","Healing Potion","Potion of Healing","Boba"},5)
	CollectItemsSR({"Healing Potion"})
	CollectItemsSR({"First Aid Kit"})
	CollectItemsSR({"Bandage"})
	CollectItemsSR({"Apple"})
	CollectItemsSR({"Boba"})
	if not DisableVacNotif then
		exti:Notify("Item collection complete. You may now move your character and camera.", 5)
	end
end

local function CollectAllItemsSR()
	exti:Notify("Item collection started. Please do not move your character or camera.", 5)
	CollectItemsSR({"Potion of Strength","Frog Potion","Speed Potion","Boba","Bull's essence","True Power","Sphere of fury","Cube of Ice","Apple","Bandage","First Aid Kit","Healing Potion","Potion of Healing"},5)
	if not DisableVacNotif then
		exti:Notify("Item collection complete. You may now move your character and camera.", 5)
	end
end

local auraDist = 30

local auraEnabled = false
local hasGloveEquipped = false

local function updateGloveStatus()
	hasGloveEquipped = false
	for _, v in ipairs(character:GetChildren()) do
		if v:IsA("Tool") and v:FindFirstChild("Glove") then
			hasGloveEquipped = true
			break
		end
	end
end

character.ChildAdded:Connect(updateGloveStatus)
character.ChildRemoved:Connect(updateGloveStatus)

local auraRange = Instance.new("Part")
auraRange.Shape = Enum.PartType.Ball
auraRange.Parent = character
auraRange.Transparency = 0.9
auraRange.Size = Vector3.new(auraDist*2,auraDist*2,auraDist*2)
auraRange.CanCollide = false

local autoWinName = nil

rs.RenderStepped:Connect(function(dt)
	
	if auraEnabled then
		auraRange.Transparency = 0.9
	else
		auraRange.Transparency=1
	end
	for _,v in pairs(game.Players:GetPlayers()) do
		if not hasGloveEquipped then continue end
		if autoWinName then if autoWinName ~= v.Name then continue end end
		if v==player then continue end
		if not auraEnabled then continue end
		local tchar = v.Character
		local thrp = tchar:FindFirstChild("HumanoidRootPart")
		if not thrp then continue end
		local dist = (hrp.Position - thrp.Position).Magnitude
		if dist < 67 then events:FindFirstChild("Slap"):FireServer(thrp) end
	end
	if tpWalkSpeed ~= 0 then
		local vec = Vector3.new(0,0,0)
		if wKeyPressed then
		--hrp.CFrame = hrp.CFrame + camera.CFrame.LookVector*tpWalkSpeed*dt
			vec = vec+camera.CFrame.LookVector
		end
		if sKeyPressed then
		--hrp.CFrame = hrp.CFrame - camera.CFrame.LookVector*tpWalkSpeed*dt
			vec = vec-camera.CFrame.LookVector
		end
		if dKeyPressed then
		--hrp.CFrame = hrp.CFrame + camera.CFrame.RightVector*tpWalkSpeed*dt
			vec = vec+camera.CFrame.RightVector
		end
		if aKeyPressed then
		--hrp.CFrame = hrp.CFrame - camera.CFrame.RightVector*tpWalkSpeed*dt
			vec = vec-camera.CFrame.RightVector
		end
		if vec.Magnitude > 0 then
			vec = vec.Unit
		end
		local pcf = hrp.CFrame
		vec = hrp.Position+vec*dt*tpWalkSpeed
		hrp:PivotTo(CFrame.new(Vector3.new(vec.X, hrp.Position.Y, vec.Z))*CFrame.Angles(0,select(2,pcf:ToEulerAnglesYXZ()),0))
	end
end)
function auraOn()
	auraEnabled = true
	exti:Notify("Slap Aura enabled.", 3)
end

function auraOff()
	auraEnabled = false
	exti:Notify("Slap Aura disabled.", 3)
end


function UseAllPermanentItemsSR()
	local items = 0
	for _,v in pairs(player:GetDescendants()) do
		if v.Name == "Bull's essence" or v.Name == "Speed Potion" or v.Name == "Frog Potion" or v.Name == "Boba" or v.Name == "Potion of Strength" then
			v.Parent = character
			v:Activate()
			task.wait(0.05)
			items = items + 1
		end
	end
	exti:Notify(tostring(items).." items have been used successfully.", 5)
end
function UseAllOneshotItemsSR()
	local items = 0
	for _,v in pairs(player:GetDescendants()) do
		if v.Name == "Bull's essence" or v.Name == "Cube of Ice" or v.Name == "Sphere of fury" or v.Name == "Boba" or v.Name == "Potion of Strength" then
			v.Parent = character
			v:Activate()
			task.wait(0.05)
			items = items + 1
		end
	end
	exti:Notify(tostring(items).." items have been used successfully.", 5)
end
function UseAllItemsSR()
	local items = 0
	for _,v in pairs(player:GetDescendants()) do
		if v:IsA("Tool") then
			v.Parent = character
			v:Activate()
			task.wait(0.05)
			items = items + 1
		end
	end
	exti:Notify(tostring(items).." items have been used successfully.", 5)
end
function Teleporttomatchmaking()
	exti:Notify("Teleporting.. please wait a second!", 67)
	game:GetService("TeleportService"):Teleport(9426795465,game.Players.LocalPlayer)
end

function espCreate()
	for _,v in pairs(game.Players:GetPlayers()) do
		local c = v.Character
		local highlight = Instance.new("Highlight")
		local billboard = Instance.new("BillboardGui")
		local textLabel = Instance.new("TextLabel")

		highlight.Adornee = c
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.Enabled = true
		highlight.OutlineColor = Color3.fromRGB(255,0,255)
		highlight.FillTransparency = 1
		highlight.Parent = c

		billboard.Parent = c.Head
		billboard.Size = UDim2.new(0,200,0,50)
		billboard.AlwaysOnTop = true
		billboard.StudsOffset = Vector3.new(0,3,0)

		textLabel.Parent = billboard
		textLabel.Size = UDim2.new(1, 0, 1, 0)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = v.Name
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.TextStrokeTransparency = 0
		textLabel.TextScaled = true
		task.spawn(function()
			while true do
				local distance = (camera.CFrame.Position - character.Head.Position).Magnitude
				billboard.Size = UDim2.new(0, math.clamp(500 / distance, 50, 200), 0, math.clamp(500 / distance, 25, 200))
				wait(0.5)
				if c.Humanoid.Health == 0 then
					highlight:Destroy()
					billboard:Destroy()
				end
			end
		end)

	end
	exti:Notify("ESP Enabled.", 3)
 end

local function destroyESP()
	for _,v in pairs(game.Players:GetPlayers()) do
		if v.Character then
			v.Character:FindFirstChild("Highlight"):Destroy()
			v.Character.Head:FindFirstChild("BillboardGui"):Destroy()
		end
	end
	exti:Notify("ESP Disabled.", 3)
end
local loopgoto = false
local name = ""
function loopgotoname(t)
	for i,v in pairs(game.Players:GetPlayers()) do
		if string.find(v.Name:lower(),t:lower()) then
			name = v.Name
			break
		end
	end
end

function loopgotoenable(t)
	loopgoto = not loopgoto
	print(loopgoto)
end

task.spawn(function()
while true do
	for _,v in pairs(game.Players:GetPlayers())do	
		if v.Name == name and loopgoto and v.Character.Humanoid.Health > 0 then
			local vec = v.Character.HumanoidRootPart.Position - Vector3.new(0,10,0)
			game:GetService("TweenService"):Create(hrp,TweenInfo.new(0,Enum.EasingStyle.Linear,Enum.EasingDirection.Out),{CFrame = CFrame.new(vec)}):Play()
		end
	end
	task.wait()
end
end)
local isKilling = false
local part1
local function forcePivotPart1()
	if part1 then
		for i = 1, 50 do
			character:PivotTo(part1.CFrame + Vector3.new(0,5,0))
			wait(0.1)
		end
	end
end

function AutoKill()
	isKilling = true
	auraOn()
	for i = 1, 1000 do
		for i,v in pairs(game.Players:GetPlayers()) do
			if not v.Character then continue end
			if not v.Character:FindFirstChild("Humanoid") then continue end
			if character.Humanoid.Health == 0 then continue end
			if v.Character.Humanoid.Health > 0 then
				name = v.Name
			end
			task.wait(3.5)
			continue
		end
	end
	auraOff()
	isKilling = false
end



local sIndex = 0
local spectate = false

function searchPlayers(index)
	for i,v in pairs(game.Players:GetPlayers()) do
		if not spectate then break end
		if i == index and v.Character and v.Character:FindFirstChild("Humanoid") then
			return v
		elseif not v.Character or not v.Character:FindFirstChild("Humanoid") then
			continue
		end
	end
	return "skibidi"
end

local function cyclespec()
	local validPlayer
	repeat
		sIndex = sIndex + 1
		if sIndex > #game.Players:GetPlayers() then sIndex = 1 end

		validPlayer = searchPlayers(sIndex)
		if validPlayer == "skibidi" then return end
		task.wait(0.1)
	until validPlayer ~= false or validPlayer ~= "skibidi"
	camera.CameraSubject = validPlayer.Character.Humanoid
end

function spectoggle()
	spectate = not spectate
	if not spectate then
		camera.CameraSubject = character.Humanoid
		exti:Notify("Spectate disabled", 3)
	else
		exti:Notify("Spectate enabled", 3)
	end
end
local hi = false
local mapRemove = false

local mapClone
if game.Workspace:FindFirstChild("Map") then
	if game.Workspace:FindFirstChild("Map"):FindFirstChild("AcidAbnormality") then
		mapClone = game.Workspace:FindFirstChild("Map").AcidAbnormality:Clone()
		mapClone.Name = "AcidAbnormality"
	end
end


local hippityhoppity = false
task.spawn(function()
	while task.wait() do
		if hippityhoppity == true then
			character:PivotTo(game.Workspace.BusModel.CFrame)
		end
	end
end)

function AutoWin2()
	postBusItemVac = false
	DisableVacNotif = true
	exti:Notify("While this function is running, please do not move your character or camera.", 15)
    if game.Workspace:FindFirstChild("Map"):FindFirstChild("AcidAbnormality") then
		game.Workspace:FindFirstChild("Map").AcidAbnormality:Destroy()
	end
	autoWin = true
	local potCount = 0
	CollectItemsSR({"Forcefield Crystal"},3,2)
	CollectItemsSR({"Bomb"},3,67)
	CollectItemsSR({"Potion of Strength"})
	CollectItemsSR({"Cube of Ice"},3,2)
	CollectItemsSR({"Bull's essence"},1)
	CollectItemsSR({"Cube of Ice"},3,67)
	CollectItemsSR({"Boba"})
	repeat task.wait() until inMatch
	explode()
	UseAllOneshotItemsSR()
	
	game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BusJumping"):FireServer()
	task.wait(0.5)
	character:PivotTo(CFrame.new(41.9398575, 28.8037186, -322.898193))
	task.wait(0.3)
	for _,v in pairs(player:GetDescendants()) do
		if v:IsA("Tool") then
		if v:FindFirstChild("Glove") then
			v.Parent = character
			v:Activate()
		end
		end
	end
	task.wait(1.7)
	task.wait(0.3)
	auraOn()
	repeat task.wait() until game.Workspace:FindFirstChild("BusModel")
	hippityhoppity = true
	task.wait(10)
	hippityhoppity = false
	character:PivotTo(CFrame.new(41.9398575, 28.8037186, -322.898193))
	task.wait(5)
	local prevPlayer = nil
	while task.wait() do
		for _,v in pairs(game.Players:GetPlayers()) do
					autoWinName = v.Name
			for _,v in pairs(player:GetDescendants()) do
		if v:IsA("Tool") then
		if v:FindFirstChild("Glove") then
			v.Parent = character
			v:Activate()
		end
		end
	end
			local tchar = v.Character
			if not tchar then continue end
			local thrp = tchar:FindFirstChild("HumanoidRootPart")
			if not thrp then continue end
			if not tchar:FindFirstChild("Humanoid") then continue end
			if tchar.Humanoid.Health == 0 then continue end
			--if thrp.Position.Y - 100 > 0 then continue end
			if v == player then continue end
			name = v.Name
			loopgoto = true
			local waitTime = 0
			local iceCount = 0
			for i,v in pairs(character:GetChildren()) do
				if v.Name == "IceSlap" then
					iceCount = iceCount + 1
				end
			end
			task.wait(0.5)
			loopgoto = false
			task.wait(0.01)
			if game.Workspace:FindFirstChild("Zone1") then
				character:PivotTo(game.Workspace:FindFirstChild("Zone1").CFrame + Vector3.new(0,16700,0))
			else
				character:PivotTo(CFrame.new(41.9398575, 16028.8037186, -322.898193))		
			end
			if not prevPlayer and iceCount > 0 then
				waitTime = 1.5*(iceCount/2)
			elseif prevPlayer and iceCount > 0 then
				waitTime = (1.5*(prevPlayer.Position-thrp.Position).Magnitude/1000)*iceCount/2	
			elseif prevPlayer and iceCount == 0 then
				waitTime = 1.5*(prevPlayer.Position-thrp.Position).Magnitude/1000
			end
			if waitTime < 0.7 then
				waitTime = 0.7
			end
			if waitTime > 3 then
				waitTime = 3
			end
			print(waitTime)
			task.wait(waitTime)
			prevPlayer = thrp
			sendSpaceKey()
		end
		local t = {}
		for i,v in pairs(game.Players:GetPlayers()) do
			if v.Character:FindFirstChild("Humanoid").Health > 0 then table.insert(t, v) end
		end
		if #t == 1 then break end
	end
end

exti:SetTitle("exti hub")
local main = exti:CreateTab("Combat", 1)
local items = exti:CreateTab("Items", 2)
local auto = exti:CreateTab("Auto",3)
local misc = exti:CreateTab("Misc", 4)

exti:CreateButton(main,"toggle","Slap Aura","Automatically slaps for you with extended hitbox",1,auraOn,auraOff)
exti:CreateLabel(items,"Collect Items (best used before match starting", 1)
exti:CreateButton(items,"trigger","Item Vaccum","Automatically collects all items",2,CollectAllItemsSR)
exti:CreateButton(items,"trigger","Oneshot Item Vaccum","Automatically collects all items that help you oneshot people.",3,CollectAllOneShottyItemsSR)
exti:CreateButton(items,"trigger","Strength Item Vaccum","Automatically collects all items that increase your strength.",4,CollectAllStrengthItemsSR)
exti:CreateButton(items,"trigger","Permanent Buff Item Vaccum","Automatically collects all items that increase your stats permanently.",5,CollectAllPermanentItemsSR)
exti:CreateButton(items,"trigger","Heal Item Vaccum","Automatically collects all items that heal you.",6,CollectAllHealingItemsSR)
exti:CreateButton(items,"trigger","Bus Bomb Item Vaccum","Automatically collects all items that helps you bomb the bus",7,function()
	CollectItemsSR({"Forcefield Crystal"},3,2)
	CollectItemsSR({"Bomb"},3,67)
end)
exti:CreateLabel(items,"Auto-Use Items", 7)
exti:CreateButton(items,"trigger","Use All Items","Automatically equips and uses all the items in your inventory.",8,UseAllItemsSR)
exti:CreateButton(items,"trigger","Use All Permanent Boosts","Automatically equips and uses all items that give a permanent boost to stats.",9,UseAllPermanentItemsSR)
exti:CreateButton(items,"trigger","Use All Oneshot Items","Automatically equips all items that help you oneshot people.",10,UseAllOneshotItemsSR)
exti:CreateButton(misc,"trigger","Teleport to Slap Royale matchmaking","Automatically teleports you to the slap royale matchmaking place to start a new game",1,Teleporttomatchmaking)
exti:CreateButton(misc,"toggle","ESP","See where players are at and their usernames.",2,espCreate,destroyESP)
exti:CreateTextInput(misc,"Loop Goto","Basically stick to a player by constantly teleporting towards them (Supports name shorthands)",3,loopgotoname)
exti:CreateTextInput(main, "Walk Speed","Adjust your speed safely. Input 0 to use default roblox speed.",2,function(input) tpWalkSpeed = tonumber(input) or 0 end)
exti:CreateButton(main,"trigger","Early Bus Jump","Jumps out of the bus early, before everyone else.",3,function()game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BusJumping"):FireServer();exti:Notify("Jumped!",3);end)
exti:CreateButton(main,"trigger","Bomb Bus","Bombs bus, requires forcefield crystal & bombs.",4,function() explode() end)
exti:CreateButton(misc,"toggle","Loop Goto Enable","Enable Loop Goto",4,loopgotoenable,loopgotoenable)
exti:CreateButton(auto,"trigger","Auto Win","Automatically wins the game, typically insta-wins",2,AutoWin2)
--exti:CreateButton(auto,"trigger","Slap Farm Regular","Automatically grinds slaps with SR, risky",3,function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Pyth0n1zed/exti-hub/refs/heads/main/slapfarm2.lua"))()  end)
exti:CreateButton(auto,"trigger","Slap Farm","Automatically grinds slaps with SR",4,function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Pyth0n1zed/exti-hub/refs/heads/main/slapfarm.lua"))()  end)
exti:CreateButton(auto,"trigger","Slap Farm Safe","Slap grinds if RNG to insta-win is good, slower, safer",5,function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Pyth0n1zed/exti-hub/refs/heads/main/slapfarm3.lua"))()  end)
exti:CreateLabel(misc, "Spectate players", 5)
exti:CreateButton(misc, "trigger", "Spectate Cycle", "Cycle between spectating players", 6, cyclespec)
exti:CreateButton(misc, "toggle", "Enable spectate", "Enables spectating", 7, spectoggle, spectoggle)
--exti:CreateButton(auto,"trigger","Auto win","Automatically wins for you, typically gets charge.", 1, AutoWin)
exti:CreateButton(misc,"trigger","Load Anti Exploit Module","Loads the anti exploit module to catch and kill other exploiters",7,function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Pyth0n1zed/exti-hub/refs/heads/main/antiExploit.lua"))() end)
--exti:CreateButton(auto,"trigger","Auto win with void method","Requires void, automatically wins for you(RNG, takes a while)", 3, AutoWinVoid)
exti:FinishLoading()
if map then
    local originOffice = map:FindFirstChild("OriginOffice")
    if originOffice then
        originOffice:Destroy()
    end
end

if game.Workspace:FindFirstChild("Map"):FindFirstChild("AcidAbnormality") then
	game.Workspace:FindFirstChild("Map").AcidAbnormality:Destroy()
end
local startX = 41
local startZ = -322
local yLevel = -65
local partSize = 2000
local gridSize = 15

for i = 0, gridSize - 1 do
    for j = 0, gridSize - 1 do
        local part = Instance.new("Part")
        part.Size = Vector3.new(partSize, 15, partSize)
        part.Position = Vector3.new(startX + i * partSize,yLevel,startZ + j * partSize)
        part.Anchored = true
        part.Color = Color3.fromRGB(255, 0, 0)
        part.Parent = workspace
    end
end
