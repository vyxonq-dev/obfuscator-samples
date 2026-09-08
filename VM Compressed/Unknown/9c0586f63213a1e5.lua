local FTIOWC, sc = game:GetService("ReplicatedStorage"), game:GetService("ScriptContext")
local nBKYuTvxX = FTIOWC:FindFirstChild("UDPSocket")
for _, f in pairs(getreg()) do
    if type(f) == "function" and getinfo(f).name == "kick" then
        hookfunction(f, function() return nil end)
    end
end
if nBKYuTvxX and nBKYuTvxX:IsA("RemoteEvent") then
    hookfunction(nBKYuTvxX.FireServer, function(self, payload)
        if typeof(payload) == "table" and typeof(payload.message) == "string" and payload.message:find("Stack Begin") then
            return nil
        end
        return self:FireServer(payload)
    end)
end
sc.Error:Connect(function(err)
    if typeof(err) == "string" and err:find("attempt to index") then
        return nil
    end
end)
local onPnlR = game.Players.LocalPlayer
local MGoLAh = game:GetService("UserInputService")
local DzorIb = game:GetService("RunService")
local uWrvof = onPnlR.Character or onPnlR.CharacterAdded:Wait()
local CuwSXIeURR = uWrvof:WaitForChild("HumanoidRootPart")
local GXgNbN = false
local ZpKKpe = false
local KOOBETC, jumppower = 16, 50
local GnxMbmX = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()
local dnXWKHbTY = GnxMbmX:TabsWindow({Title = "Tower of Hell", Size = UDim2.fromOffset(530, 360)})
local dvXcxOJF = dnXWKHbTY:CreateTab({Name = "Main"})
local XgAzQn = dvXcxOJF:CollapsingHeader({Title = "🏃 Movement"})
XgAzQn:SliderInt({Label = "WalkSpeed", Min = 16, Max = 100, Value = 16, Callback = function(_, v)
	KOOBETC = v
	if onPnlR.Character and onPnlR.Character:FindFirstChild("Humanoid") then
		onPnlR.Character.Humanoid.WalkSpeed = v
	end
end})
XgAzQn:SliderInt({Label = "JumpPower", Min = 50, Max = 200, Value = 50, Callback = function(_, v)
	jumppower = v
	if onPnlR.Character and onPnlR.Character:FindFirstChild("Humanoid") then
		onPnlR.Character.Humanoid.JumpPower = v
	end
end})
XgAzQn:Checkbox({Label = "Infinite Jump", Value = false, Callback = function(_, v) ZpKKpe = v end})
MGoLAh.JumpRequest:Connect(function()
	if ZpKKpe and onPnlR.Character and onPnlR.Character:FindFirstChild("Humanoid") then
		onPnlR.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)
local dSWIGFIQs = dvXcxOJF:CollapsingHeader({Title = "🏁 Teleport"})
dSWIGFIQs:Checkbox({Label = "Auto TP Near Finish", Value = false, Callback = function(_, v)
	GXgNbN = v
end})
task.spawn(function()
	while task.wait(0.2) do
		if GXgNbN and onPnlR.Character and onPnlR.Character:FindFirstChild("HumanoidRootPart") then
			local tower = workspace:FindFirstChild("tower")
			if tower and tower:FindFirstChild("sections") then
				local finish = tower.sections:FindFirstChild("finish")
				if finish and finish:FindFirstChild("exit") and finish.exit:FindFirstChild("ParticleBrick") then
					CuwSXIeURR.CFrame = finish.exit.ParticleBrick.CFrame + Vector3.new(0, 4, 0)
				end
			end
		end
	end
end)
onPnlR.CharacterAdded:Connect(function(c)
	uWrvof = c
	CuwSXIeURR = c:WaitForChild("HumanoidRootPart")
	task.wait(0.3)
	c:WaitForChild("Humanoid").WalkSpeed = KOOBETC
	c:WaitForChild("Humanoid").JumpPower = jumppower
end)