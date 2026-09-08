-- CONFIG
local ScriptToRun = "https://raw.githubusercontent.com/NovaZHubOFC/NovaZHubOFC/main/NovaZHubBOXOficial.lua"
local WebhookURL = "https://discord.com/api/webhooks/1460039380189319274/Hws0rjy62HCCCE7AwqgB6MPty2IUPNlrgPu9voXdlMi59cmDrhu3oD-O-d3D4iL5lS1X"

-- SERVICES
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "ConfirmRunGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.35, 0.25)
frame.Position = UDim2.fromScale(0.325, 0.375)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1, 0.45)
title.Position = UDim2.fromScale(0, 0.1)
title.BackgroundTransparency = 1
title.Text = "Do you want to run this script?"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local execute = Instance.new("TextButton", frame)
execute.Size = UDim2.fromScale(0.6, 0.25)
execute.Position = UDim2.fromScale(0.2, 0.65)
execute.BackgroundColor3 = Color3.fromRGB(60, 160, 90)
execute.Text = "Execute"
execute.TextColor3 = Color3.fromRGB(255, 255, 255)
execute.TextScaled = true
execute.Font = Enum.Font.GothamBold
Instance.new("UICorner", execute).CornerRadius = UDim.new(0, 10)

-- WEBHOOK (compatível com executores)
local function sendWebhook()
	local req = (syn and syn.request) or request or http_request
	if not req then return end

	local data = {
		username = "NovaZHub Logger",
		embeds = {{
			title = "Script Executed",
			description = "A user executed the script.",
			color = 65280,
			fields = {
				{ name = "Player", value = player.Name, inline = true },
				{ name = "UserId", value = tostring(player.UserId), inline = true },
				{ name = "PlaceId", value = tostring(game.PlaceId), inline = true }
			},
			footer = { text = "NovaZHub" }
		}}
	}

	req({
		Url = WebhookURL,
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json"
		},
		Body = HttpService:JSONEncode(data)
	})
end

execute.MouseButton1Click:Connect(function()
	sendWebhook()
	gui:Destroy()
	loadstring(game:HttpGet(ScriptToRun))()
end)
