local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/suwiwydbwiwbsjsjHub/Orion-Libray-transparente-/refs/heads/main/README.md')))()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local SoccerBalls = workspace.WorkspaceCom["001_SoccerBalls"]

local selectedPlayer = nil

local Window = OrionLib:MakeWindow({
	Name = "Fling ball lol",
	HidePremium = false,
	IntroText = "Ball Fling",
	SaveConfig = false
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local playerNames = {}
for _, p in ipairs(Players:GetPlayers()) do
	if p ~= player then
		table.insert(playerNames, p.Name)
	end
end

Tab:AddDropdown({
	Name = "Selecionar Jogador",
	Default = "",
	Options = playerNames,
	Callback = function(Value)
		selectedPlayer = Players:FindFirstChild(Value)
	end
})

Tab:AddButton({
	Name = "fling ball",
	Callback = function()
		if not selectedPlayer then
			OrionLib:MakeNotification({
				Name = "Erro",
				Content = "Nenhum jogador selecionado.",
				Time = 3
			})
			return
		end

		local MyBall = SoccerBalls:FindFirstChild("Soccer" .. player.Name)
		if not MyBall then
			if not player.Backpack:FindFirstChild("SoccerBall") then
				local args = {
					[1] = "PickingTools",
					[2] = "SoccerBall"
				}
				game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
				task.wait()
				player.Backpack.SoccerBall.Parent = player.Character
				repeat
					MyBall = SoccerBalls:FindFirstChild("Soccer" .. player.Name)
					task.wait()
				until MyBall
				player.Character.SoccerBall.Parent = player.Backpack
			else
				player.Backpack.SoccerBall.Parent = player.Character
				repeat
					MyBall = SoccerBalls:FindFirstChild("Soccer" .. player.Name)
					task.wait()
				until MyBall
				player.Character.SoccerBall.Parent = player.Backpack
			end
		end

		local target = selectedPlayer
		local TCharacter = target.Character or target.CharacterAdded:Wait()
		local THumanoidRootPart = TCharacter:WaitForChild("HumanoidRootPart")

		for _, v in pairs(MyBall:GetChildren()) do
			if v:IsA("BodyMover") then
				v:Destroy()
			end
		end

		local bodyVelocity = Instance.new("BodyVelocity", MyBall)
		bodyVelocity.Velocity = Vector3.new(9e8, 9e8, 9e8)
		bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

		local bv = Instance.new("BodyVelocity", THumanoidRootPart)
		bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
		bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bv.P = 1e9

		workspace.CurrentCamera.CameraSubject = THumanoidRootPart

		repeat
			local parts = {}
			for _, v in pairs(TCharacter:GetDescendants()) do
				if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
					table.insert(parts, v)
				end
			end
			for _, part in ipairs(parts) do
				MyBall.CFrame = part.CFrame
				task.wait(1 / 6000)
			end
			task.wait(1 / 6000)
		until THumanoidRootPart.Velocity.Magnitude > 5000 or TCharacter.Humanoid.Health == 0 or target.Parent ~= game.Players

		workspace.CurrentCamera.CameraSubject = player.Character:WaitForChild("HumanoidRootPart")
	end
})