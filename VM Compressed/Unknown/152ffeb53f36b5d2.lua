
--1. rules: it is forbidden to change the credit name, this script was created by @im_patrick you will be charged dcma for changing the credit
--2. rules: changing the code using AI and claiming it as your own is not allowed

if patricknpcpanel then return end; patricknpcpanel = true

local github = "https://raw.githubusercontent.com/randomstring0/fe-source/refs/heads/main/NPC"
local load = loadstring(game:HttpGet(github .. "/module.Luau"))()

saved = loadstring(game:HttpGet(github .. "/table.luau"))()



local save = saved or {}

local g2l = load.G2L
local new = load.create()

local lighting = game:GetService("Lighting")
local tweenservice = game:GetService("TweenService")
local rs = game:GetService("RunService")
local ws = game:GetService("Workspace")
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local mouse = lp:GetMouse()

local fast = TweenInfo.new(.5, Enum.EasingStyle.Exponential)
local medium = TweenInfo.new(.67)
local slow = TweenInfo.new(.8)

local rad = 150
local currentnpc

local highlight = Instance.new("Highlight")
highlight.Parent = lp
highlight.FillTransparency = 1
highlight.OutlineTransparency = 1

local light = function(adornee, color)
	task.spawn(function()
		highlight.Adornee = adornee
		highlight.OutlineColor = color
		tweenservice:Create(highlight, medium, {OutlineTransparency  = 0}):Play()
		task.wait(.5)
		tweenservice:Create(highlight, medium, {OutlineTransparency  = 1}):Play()
	end)	
end

local isnpc = function(ins)
	local humanoid = ins:FindFirstChildOfClass("Humanoid")
	local player = plrs:GetPlayerFromCharacter(ins)

	if humanoid and not player then
		return ins 
	end

	return nil
end


new:mainbutton(save["1"].title, save["1"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			local hum = currentnpc:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:ChangeState(save["1"].val)
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["2"].title, save["2"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			if lp and lp.Character then
				local char = lp.Character
				currentnpc:PivotTo(char:GetPivot())
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["3"].title, save["3"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part then
			if lp and lp.Character then
				local char = lp.Character
				char:PivotTo(currentnpc:GetPivot())
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)


local chr, cons
new:maintoggle(save["4"].title, save["4"].des, function(a)
	if a then
		if currentnpc then
			local part = currentnpc:FindFirstChild("HumanoidRootPart")
			if part and partowner(part) then
				if lp and lp.Character then
					chr = lp.Character
					lp.Character = currentnpc
					ws.CurrentCamera.CameraSubject = currentnpc:FindFirstChild("HumanoidRootPart")
					-- idea from sonle
					local move = 0.01
					cons = rs.PreSimulation:Connect(function()
						local hum = lp.Character:FindFirstChildOfClass("Humanoid")
						if lp.Character and hum then
							hum.RootPart.CFrame += vector.create(0,move,0)
							move = -move
						else
							if cons then
								cons:Disconnect()
								cons = nil
							end
						end
					end)
				end
			else
				light(currentnpc, Color3.fromRGB(255, 0, 0))
			end
		end
	else
		if chr then
			lp.Character = chr
			ws.CurrentCamera.CameraSubject = chr.Humanoid
			chr = nil
			if cons then
				cons:Disconnect()
				cons = nil
			end
		end
	end
end)

new:mainbutton(save["5"].title, save["5"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			if lp and lp.Character then
				local char = lp.Character
				currentnpc:PivotTo(CFrame.new(0, 1000, 0))
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["6"].title, save["6"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			local hum = currentnpc:FindFirstChildOfClass("Humanoid")
			if hum then
				hum.Sit = not hum.Sit
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

new:mainbutton(save["7"].title, save["7"].des, function()
	if currentnpc then
		local part = currentnpc:FindFirstChild("HumanoidRootPart")
		if part and partowner(part) then
			local hum = currentnpc:FindFirstChildOfClass("Humanoid")
			if hum then
				hum:ChangeState(save["7"].val)
			end
		else
			light(currentnpc, Color3.fromRGB(255, 0, 0))
		end
	end
end)

local con, follownpc
follownpc = new:maintoggle(save["8"].title, save["8"].des, function(a)
	if a then
		con = rs.RenderStepped:Connect(function()
			if currentnpc then
				local part = currentnpc:FindFirstChild("HumanoidRootPart")
				if part and partowner(part) then
					local hum = currentnpc:FindFirstChildOfClass("Humanoid")
					if hum then
						local hrp=lp.Character:FindFirstChild("HumanoidRootPart")
						if hrp then
							hum:MoveTo(hrp.Position + Vector3.new(-4,0,0))
						end
					end
				else
					light(currentnpc, Color3.fromRGB(255, 0, 0))
					if con then
						follownpc:swich(false)
						con:Disconnect()
						con = nil
					end
				end
			else
				if con then
					follownpc:swich(false)
					con:Disconnect()
					con = nil
				end
			end
		end)
	else
		if con then
			con:Disconnect()
			con = nil
		end
	end
end)


local con1
new:extratoggle(save["9"].title, function(a)
	if a then
		con1 = rs.Stepped:Connect(function()
			local hrp1 = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
			if not hrp1 then return end

			local nbp = ws:GetPartBoundsInRadius(hrp1.Position, 13)
			for _, part in pairs(nbp) do
				local model = part:FindFirstAncestorOfClass("Model")
				if model and isnpc(model) then
					local npc = model
					local hrp = npc:FindFirstChild("HumanoidRootPart")
					if hrp and partowner(hrp) and not hrp.Anchored and npc ~= lp.Character then
						local hum = npc:FindFirstChildOfClass("Humanoid")
						if hum then
							hum:ChangeState(save["9"].val)
						end
					end
				end
			end
		end)
	else
		if con1 then
			con1:Disconnect()
			con1 = nil
		end
	end
end)


local con2
new:extratoggle(save["10"].title, function(a)
	if a then
		con2 = rs.Stepped:Connect(function()
			local hrp1 = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
			if not hrp1 then return end

			local nbp = ws:GetPartBoundsInRadius(hrp1.Position, 13)
			for _, part in pairs(nbp) do
				local model = part:FindFirstAncestorOfClass("Model")
				if model and isnpc(model) then
					local npc = model
					local hrp = npc:FindFirstChild("HumanoidRootPart")
					if hrp and partowner(hrp) and not hrp.Anchored and npc ~= lp.Character then
						local hum = npc:FindFirstChildOfClass("Humanoid")
						if hum then
							hum:ChangeState(save["10"].val)
						end
					end
				end
			end
		end)
	else
		if con2 then
			con2:Disconnect()
			con2 = nil
		end
	end
end)




mouse.Button1Down:Connect(function()
	if clicknpc and mouse.Target and mouse.Target.Parent:FindFirstChild("HumanoidRootPart") then
		if mouse.Target.Parent:FindFirstChild("HumanoidRootPart").Anchored == false then
			if not plrs:GetPlayerFromCharacter(mouse.Target.Parent) then
				if partowner(mouse.Target.Parent:FindFirstChild("HumanoidRootPart")) then
					currentnpc = mouse.Target.Parent
					light(currentnpc, Color3.fromRGB(0, 255, 0))
				else
					light(mouse.Target.Parent, Color3.fromRGB(255, 0, 0))
				end
			end
		else
			light(mouse.Target.Parent, Color3.fromRGB(255, 0, 0))
		end
	end
end)

rs.RenderStepped:Connect(function()
	if sethiddenproperty then
		sethiddenproperty(lp,"SimulationRadius",rad)
	else
		lp.SimulationRadius=rad
	end
end)


return g2l, require;