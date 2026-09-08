if game.CoreGui:FindFirstChild("KHui_TOH") then
	warn("Koala Scripts Has Already Ran, Expect A Lot Of Bugs And Glitches.")
	game.CoreGui.KHui_TOH:Destroy()
	task.wait(1)
end

local KHLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/KoalaGuy-100/Koala-Hacks/refs/heads/main/KHLib/Vmj1.luau"))()
local UI = KHLib.new(game.CoreGui, "KHui_TOH")

local UserInputService = game:GetService("UserInputService")

local MainTab = UI.newtab("Main", "MainTab")

local InstantWin = MainTab:CreateInput("Activate", "Tween To The Top.", "InstantWin").Activate
local AllItems = MainTab:CreateInput("Activate", "Give All Items.", "AllItems").Activate
local PlrInvincible = MainTab:CreateInput("Toggle", "Player Invincibility.", "PlrInvicible").Input
local PlrSpeed = MainTab:CreateInput("TextBox", "Player WalkSpeed.", "PlrSpeed").TextBox
local PlrJumpPower = MainTab:CreateInput("TextBox", "Player Jump Power.", "PlrJumpPower").TextBox

local ForceInvincible = false

-- # MODIFY UI
UI.Title.Text = "Koala Scripts - Tower Of Hell"

-- # COMMANDS
InstantWin.MouseButton1Down:Connect(function()
	if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
		ForceInvincible = true

		local Tween = game:GetService("TweenService"):Create(
			game.Players.LocalPlayer.Character.HumanoidRootPart,
			TweenInfo.new(
				math.abs((game.Workspace.tower.sections.finish.exit.ParticleBrick.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude) / 64,
				Enum.EasingStyle.Linear
			),
			{CFrame = game.Workspace.tower.sections.finish.exit.ParticleBrick.CFrame}
		)

		Tween:Play()
		Tween.Completed:Wait()
		ForceInvincible = false
		game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
	end
end)

AllItems.MouseButton1Down:Connect(function()
	for i, v in pairs(game.ReplicatedStorage.Gear:GetChildren()) do
		if v:IsA("Tool") then
			v:Clone().Parent = game.Players.LocalPlayer.Backpack
		end
	end
end)

-- # TOGGLE KEY
function ToggleUI()
	if UI.Instance.Main.Visible == false then
		UI.Instance.Main.Visible = true
		UI.Instance.Open.Visible = false
	else
		UI.Instance.Main.Visible = false
		UI.Instance.Open.Visible = true
	end
end
UserInputService.InputBegan:Connect(function(Input, GameProcessed)
	if Input.KeyCode == Enum.KeyCode.LeftAlt and not GameProcessed then
		ToggleUI()
	end
end)

-- # TICK FUNCTION
while task.wait() do
	-- # END
	if not game.CoreGui:FindFirstChild("KHui_TOH") then
		warn("Koala Script: ENDED.")
		break
	end

	-- • INVINCIBLE
	if (PlrInvincible.Value or ForceInvincible) and game.Players.LocalPlayer.Character then
		if game.Players.LocalPlayer.Character:FindFirstChild("KillScript") then
		game.Players.LocalPlayer.Character.KillScript.Disabled = true
		end
	elseif game.Players.LocalPlayer.Character then
		if game.Players.LocalPlayer.Character:FindFirstChild("KillScript") then
		game.Players.LocalPlayer.Character.KillScript.Disabled = false
		end
	end

	-- • SPEED
	if tonumber(PlrSpeed.Text) and game.Players.LocalPlayer.Character then
		if game.Players.LocalPlayer.Character:FindFirstChild("speedscript") then
			game.Players.LocalPlayer.Character.speedscript.Disabled = true
	end
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(PlrSpeed.Text)
	elseif game.Players.LocalPlayer.Character then
		if game.Players.LocalPlayer.Character:FindFirstChild("speedscript") then
			game.Players.LocalPlayer.Character.speedscript.Disabled = false
		end
		-- game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = game.ReplicatedStorage.globalSpeed.Value # disabled (checking)
	end

	-- • JUMP POWER
	if tonumber(PlrJumpPower.Text) and game.Players.LocalPlayer.Character then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = tonumber(PlrJumpPower.Text)
	elseif game.Players.LocalPlayer.Character then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
	end
end
