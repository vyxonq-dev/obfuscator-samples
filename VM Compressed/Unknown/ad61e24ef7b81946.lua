local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
	Name = "Quantum XV Beta🥀",
	Icon = 0,
	LoadingTitle = "Temporary",
	LoadingSubtitle = "by Rig6",
	ShowText = "Quantum",
	Theme = "Default",

	ToggleUIKeybind = "K",

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false,

	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil,
		FileName = "qxv"
	},

	Discord = {
		Enabled = false,
		Invite = "noinvitelink",
		RememberJoins = true
	},

	KeySystem = false,
	KeySettings = {
		Title = "Untitled",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided",
		FileName = "Key",
		SaveKey = true,
		GrabKeyFromSite = false,
		Key = {"Hello"}
	}
})

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")

local MainTab = Window:CreateTab("Main", 0)

MainTab:CreateSection("Main")

MainTab:CreateButton({
	Name = "Auto-Build",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/w1oxn-umcs/umcs/refs/heads/main/auto-build'))()
	end
})

MainTab:CreateInput({
	Name = "Announcement (useless)",
	CurrentValue = "",
	PlaceholderText = "Write announcement here",
	RemoveTextAfterFocusLost = true,
	Flag = "Input1",
	Callback = function(Text)
		local fancyIntro = "📢ANNOUNCEMENT📢: "
		for i = 1, 3 do
			pcall(function()
				TextChatService.TextChannels.RBXGeneral:SendAsync(fancyIntro .. Text)
			end)
			task.wait(0.5)
		end
	end
})

MainTab:CreateButton({
	Name = "Fly",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/w1oxn-umcs/umcs/refs/heads/main/fly'))()
	end
})
function say(t)
  TextChatService.TextChannels.RBXGeneral:SendAsync(";" .. t)
end
MainTab:CreateToggle({
	Name = "Auto Save-Enlightenment",
	CurrentValue = false,
	Flag = "enlightenment",
	Callback = function(Value)
autoperm = Value
local localplr = game.Players.LocalPlayer
local count = 0

game:GetService("RunService").Heartbeat:Connect(function()
    if autoperm and localplr.Character and count < 2 then
        if localplr.Character:FindFirstChild("The Arkenstone") then
            say("reset me")
            count += 1
        end
    end
end)
	end
})
MainTab:CreateButton({
	Name = "Unperm enlighten others",
	Callback = function()
	for i = 1, 2 do
       say("enlighten o")
    end

     for i = 1, 10 do
      say("clearinv o")
      wait(0)
     end
	end
})
MainTab:CreateButton({
	Name = "Steal B-TOOLS",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/w1oxn-umcs/umcs/refs/heads/main/btools'))()
	end
})

MainTab:CreateToggle({
	Name = "Loop R6",
	CurrentValue = false,
	Flag = "r6",
	Callback = function(Value)
		Activo = Value
		if Value then
			task.spawn(function()
				while Activo do
					pcall(function()
						TextChatService.TextChannels.RBXGeneral:SendAsync(";r6 o")
					end)
					task.wait(0.001)
				end
			end)
		end
	end
})

MainTab:CreateToggle({
	Name = "Lockdown",
	CurrentValue = false,
	Flag = "lockdown",
	Callback = function(Value)
		Active = Value
		if Value then
			task.spawn(function()
				local commands = {";freeze o", ";glitch o", ";mute o", ";jail o", ";iq 0 o", ";blind o", ";myopic o", ";clearinv o"}
				while Active do
					for _, cmd in ipairs(commands) do
						pcall(function()
							TextChatService.TextChannels.RBXGeneral:SendAsync(cmd)
						end)
						task.wait(0.001)
						if not Active then break end
					end
				end
			end)
		end
	end
})

MainTab:CreateToggle({
	Name = "Reset",
	CurrentValue = false,
	Flag = "reset",
	Callback = function(Value)
		ResetActive = Value
		if Value then
			task.spawn(function()
				while ResetActive do
					pcall(function()
						TextChatService.TextChannels.RBXGeneral:SendAsync(";reset o")
					end)
					task.wait(0.001)
				end
			end)
		end
	end
})
