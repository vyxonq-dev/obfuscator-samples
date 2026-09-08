getgenv().SecureMode = true
getgenv().HomeAloneScriptActive = false
Lighting = game:GetService("Lighting")
local plr = game.Players.LocalPlayer
plr.CameraMode = Enum.CameraMode.Classic
local char = plr.Character
plr:GetPropertyChangedSignal("CameraMode"):Connect(function()
	if plr.CameraMode ~= Enum.CameraMode.Classic then
		plr.CameraMode = Enum.CameraMode.Classic
		plr.CameraMaxZoomDistance = 0.5
	end	
end)
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()
function notify(text,raw)
	if text then
		local convert = 5
		if raw then	
			convert = tonumber(raw)
		end
		Rayfield:Notify({
			Title = "Home Alone script",
			Content = text,
			Duration = convert,
		})
	end
end
--------------------
-- store walls to use later
store = workspace
if getgenv().HomeAloneScriptActive == false then
getgenv().HomeAloneScriptActive = true
store = Instance.new("Model")
store.Parent = workspace
store.Name = "WallStorage"
for a,b in workspace:GetChildren() do
	if b.Name == "Smooth Block Model" then
		if b.Color == Color3.fromRGB(215, 197, 154) then
			b.Parent = store
		end
	end
end
end


---------------------
local Window = Rayfield:CreateWindow({
	Name = "Home Alone script",
	LoadingTitle = "Loading...",
	LoadingSubtitle = "Game: Home Alone[HORROR]",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "IALGScripts",
		FileName = "HomeAloneConfig"
	}
})
local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image
local Tab2 = Window:CreateTab("Local/player", 4483362458) -- Title, Image
notify("Script loaded. TIP: If you on pc, right click to unlock mouse!",5)
local ws40 = false
local ws30 = false
Tab2:CreateButton({
	Name = "Enable jump power",
	Callback = function()
		game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
	end,
})
Tab2:CreateButton({
	Name = "Loop 40 walk speed (FAST)",
	Callback = function()
		local hum = game.Players.LocalPlayer.Character.Humanoid
		hum.WalkSpeed = 40
		ws30 = false
		ws40 = true
		print("Enabled 40 WS")
		hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
			if hum.WalkSpeed ~= 40 and ws30 == false then
				hum.WalkSpeed = 40
			end
		end)
	end
})
Tab2:CreateButton({
	Name = "Loop 30 walk speed (Recommended with noclip)",
	Callback = function()
		local hum = game.Players.LocalPlayer.Character.Humanoid
		hum.WalkSpeed = 30
		ws30 = true
		ws40 = false
		print("Enabled 30 WS")
		hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
			if hum.WalkSpeed ~= 40 and ws40 == false then
				hum.WalkSpeed = 30
			end
		end)
	end
})
local MonsterESPToggle = Tab:CreateToggle({
	Name = "Monster ESP (Enable before blackout!)",
	CurrentValue = false,
	Flag = "MonstersESP",
	Callback = function(Value)
		workspace.ChildAdded:Connect(function(bb)
			if bb.Name == "Crawler" or bb.Name == "Gurg" and Value == true then
				notify("⚠️ALERT: ENTITY <"..bb.Name.."> HAS BEEN SPAWNED!!⚠️")
				local newesp = Instance.new("Highlight")
				newesp.Parent = bb
				newesp.Name = "ESPGYRGUSA"
			end
		end)
		if Value == false then
			for a,bb in pairs(workspace:GetChildren()) do
				if bb.Name == "Crawler" or bb.Name == "Gurg" then
					if bb:WaitForChild("ESPGYRGUSA",0.001) then
						bb:Destroy()
					end
				end
			end
		end
	end
})
local intbool = false
local FastInteractToggle = Tab:CreateToggle({
	Name = "Fast interact",
	CurrentValue = false,
	Flag = "FastInteract",
	Callback = function(Value)
	intbool = Value
	while Value == true and intbool == true do
	wait(0.1)
		if intbool == false then
			break
		end
		for a,b in game:GetDescendants() do
			if b:IsA("ProximityPrompt") then
				if not b:GetAttribute("GenericHoldDuration") then
				b:SetAttribute("GenericHoldDuration",b.HoldDuration) 
				end
				if Value == true then
					b.HoldDuration = 0
				elseif Value == false and b:GetAttribute("GenericHoldDuration") then
					b.HoldDuration = b:GetAttribute("GenericHoldDuration") -- reset to back
				end
			end
			end
		end
	end
})
Tab2:CreateButton({
	Name = "Unload",
	Callback = function()
		Rayfield:Destroy()
	end
})
local noclipbool = false
local NoclipToggle = Tab:CreateToggle({
	Name = "Walk hack/noclip (for walls and doors, can undo!)",
	CurrentValue = false,
	Flag = "NoclipVal",
	Callback = function(Value)
		noclipbool = Value
		while Value == true and noclipbool == true do
			wait(0.1)
			for a,b in pairs(workspace.WallStorage:GetChildren()) do
				b.Transparency = 1
				b.CanCollide = false
			end
		for a,b in pairs(workspace.Doors:GetDescendants()) do
			if b:IsA("BasePart") then
				b.Transparency = num
				b.CanCollide = newval
			end
		end
			if noclipbool == false then
				for a,b in pairs(workspace.WallStorage:GetChildren()) do
						b.Transparency = 0
						b.CanCollide = true
				end
				for a,b in pairs(workspace.Doors:GetDescendants()) do
					if b:IsA("BasePart") and b.Name == "blocker" then
						b.Transparency = num
						b.CanCollide = newval
					end
				end
				break
			end
	end
	end
})

local randbool = false

local FullbrightToggle = Tab:CreateToggle({
	Name = "Fullbright",
	CurrentValue = false,
	Flag = "Fullbright",
	Callback = function(Value)
		randbool = Value -- update random bool (i named like that because why not) also help 
		Lighting.Brightness = 0
		Lighting.ClockTime = 3
		Lighting.FogEnd = 60
		Lighting.GlobalShadows = true
		Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
		while Value == true and randbool == true do
			wait(0.1)
			if randbool == false then
				break
			end
			if Value == true and randbool == true then
				Lighting.Brightness = 2
				Lighting.ClockTime = 14
				Lighting.FogEnd = 100000
				Lighting.GlobalShadows = false
				Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
			end
		end
	end
})
