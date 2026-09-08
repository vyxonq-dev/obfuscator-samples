local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local uis = game:GetService("UserInputService")
local ts = game:GetService("TeleportService")

local noclip
local inf_jump_connection
local checkpoint_pos
local saved_pos
local RGB_code_out
local RGB_code_fill

local window = WindUI:CreateWindow({
	Title = "Universal Admin Script",
	Author = "Team Void",
	Icon = "scroll"
})

local player_tab = window:Tab({
	Title = "Player",
	Icon = "user"
}) 

local speed_slider = player_tab:Slider({
	Title = "Walk speed",
	Desc = "Change your walk speed.",
	Step = 1,
	Value = {
		Min = 16, 
		Max = 250,
		Default = 16
	},
	Callback = function(Value)
		local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

		humanoid.WalkSpeed = Value
	end
})

local jump_slider = player_tab:Slider({
	Title = "Jump power",
	Desc = "Change your jump power",
	Step = 1,
	Value = {
		Min = 50,
		Max = 250,
		Default = 50
	},
	Callback = function(Value)
		local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

		humanoid.JumpPower = Value
	end
})

local noclip_toggle = player_tab:Toggle({
	Title = "Noclip",
	Desc = "Enable/Disable Noclip. (Walk through walls)",
	Type = "Checkbox",
	Icon = "check",
	Callback = function(state)
		noclip = state
	end
})

task.spawn(function()
	while task.wait(0.1) do
		if noclip then
			for _, part in game.Players.LocalPlayer.Character:GetDescendants() do
				if part:IsA("BasePart") then
					part.CanCollide = false
				end
			end
		else
			for _, part in game.Players.LocalPlayer.Character:GetDescendants() do
				if part:IsA("BasePart") then
					part.CanCollide = true
				end
			end
		end
	end
end)

local inf_jump_toggle = player_tab:Toggle({
	Title = "Infinite jump",
	Desc = "Enable/Disable infinite jump. (Jump even in the air)",
	Type = "Checkbox",
	Icon = "check",
	Callback = function(state)
		local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

		if state then
			inf_jump_connection = uis.JumpRequest:Connect(function()
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end)
		else
			inf_jump_connection:Disconnect()
		end
	end
})

local misc_tab = window:Tab({
	Title = "Misc",
	Icon = "file-code"
})

local inf_yield_button = misc_tab:Button({
	Title = "Infinite Yield",
	Desc = "Load Infinite Yield...",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/edgeiy/infiniteyield/master/source"))()
	end
})

local fly_gui_button = misc_tab:Button({
	Title = "Fly Gui v3",
	Desc = "Load Fly Gui v3...",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
	end
})

local emote_player_button = misc_tab:Button({
	Title = "FE emote player",
	Desc = "Load FE emote player",
	Callback = function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/TreeByte403/1696d3247e439ae9dae72886605eefb8/raw/79bfe23cad711042de7510986ed486a90d50c8c7/FE_emote_script.lua"))()
	end
})

local rejoin_button = misc_tab:Button({
	Title = "Rejoin",
	Desc = "Rejoin the same exact server.",
	Callback = function()
		ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
	end
})

local checkpoint_button = misc_tab:Button({
	Title = "Set checkpoint.",
	Desc = "Set a checkpoint. (You will respawn at the place you setted the checkpoint)",
	Callback = function()
		local player = game.Players.LocalPlayer
		checkpoint_pos = player.Character:WaitForChild("HumanoidRootPart").CFrame

		player.CharacterAdded:Connect(function()
			local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

			hrp.CFrame = checkpoint_pos
		end)
	end
})

local teleport_tab = window:Tab({
	Title = "Teleport",
	Icon = "lightbulb"
})

for _, player in game.Players:GetPlayers() do
	local player_button = teleport_tab:Button({
		Title = player.Name,
		Desc = "Teleport to player " ..  player.Name,
		Callback = function()
			local target_hrp = player.Character:WaitForChild("HumanoidRootPart")
			local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

			hrp.CFrame = target_hrp.CFrame
		end
	})
end

local player_divider = teleport_tab:Divider()

local save_position_button = teleport_tab:Button({
	Title = "Save position",
	Desc = "Save your position. You can later teleport to the position.",
	Callback = function()
		local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

		saved_pos = hrp.CFrame
	end
})

local save_teleport_button = teleport_tab:Button({
	Title = "Teleport to saved position",
	Desc = "Teleport to the position you saved.",
	Callback = function()
		local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

		hrp.CFrame = saved_pos
	end
})

local save_divider = teleport_tab:Divider()

local visuals_tab = window:Tab({
	Title = "Visuals",
	Icon = "eye"
})

local esp_everyone_toggle = visuals_tab:Toggle({
	Title = "ESP",
	Desc = "Enable/Disable ESP. (See everyone through walls.)",
	Type = "Checkbox",
	Icon = "check",
	Callback = function(state)
		if state then
			for _, player in game.Players:GetPlayers() do
				if player ~= game.Players.LocalPlayer then
					local highlight = Instance.new("Highlight")

					highlight.Name = "HHighlight"
					highlight.OutlineColor = RGB_code_out
					highlight.FillColor = RGB_code_fill
					highlight.Parent = player.Character
				end
			end
		else
			for _, player in game.Players:GetPlayers() do
				for _, obj in player.Character:GetDescendants() do
					if obj.Name == "HHighlight" then
						obj:Destroy()
					end
				end
			end
		end
	end
})

local esp_divider = visuals_tab:Divider()

local esp_outline_dropdown = visuals_tab:Dropdown({
	Title = "ESP Outline color",
	Desc = "The color you'll select, will be the outline color for the ESP.",
	Values = {"Red", "Green", "Blue", "Yellow", "Orange"},
	Value = "Blue",
	AllowNone = false,
	Callback = function(option)
		if option == "Blue" then
			RGB_code_out = Color3.fromRGB(0, 0, 255)
		elseif option == "Red" then
			RGB_code_out = Color3.fromRGB(255, 0, 0)
		elseif option == "Green" then
			RGB_code_out = Color3.fromRGB(0, 255, 0)
		elseif option == "Yellow" then
			RGB_code_out = Color3.fromRGB(255, 255, 0)
		elseif option == "Orange" then
			RGB_code_out = Color3.fromRGB(255, 165, 0)
		end
	end
})

local esp_fill_dropdown = visuals_tab:Dropdown({
	Title = "ESP Fill color",
	Desc = "The color you'll select, will be the fill color for the ESP.",
	Values = {"Red", "Green", "Blue", "Yellow", "Orange"},
	Value = "Blue",
	AllowNone = false,
	Callback = function(option)
		if option == "Blue" then
			RGB_code_fill = Color3.fromRGB(0, 0, 255)
		elseif option == "Red" then
			RGB_code_fill = Color3.fromRGB(255, 0, 0)
		elseif option == "Green" then
			RGB_code_fill = Color3.fromRGB(0, 255, 0)
		elseif option == "Yellow" then
			RGB_code_fill = Color3.fromRGB(255, 255, 0)
		elseif option == "Orange" then
			RGB_code_fill = Color3.fromRGB(255, 165, 0)
		end
	end
})
