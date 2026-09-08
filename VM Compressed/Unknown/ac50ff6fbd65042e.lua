-- DarkAdmin
-- over 154 Commands rn with usefull
-- Made by Pilipino Dev Love <3

repeat task.wait() until game:IsLoaded()
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

Service = setmetatable({}, {
    __index = function(self, name)
        local success, cache = pcall(function()
            return cloneref(game:GetService(name))
        end)
        if success then
            rawset(self, name, cache)
            return cache
        else
            error("Invalid Roblox Service: " .. tostring(name))
        end
    end
})

CollectionService = Service.CollectionService
TweenService = Service.TweenService
UserInputService = Service.UserInputService
InsertService = Service.InsertService
Players = Service.Players
Player = Service.Players.LocalPlayer
CoreGui = Service.CoreGui
Virtual = Service.VirtualInputManager
StarterGui = Service.StarterGui
RunService = Service.RunService 

local CommandSystem = {
	commands = {}
}

function CommandSystem:AddCmd(data)
	local command = {
		Title = data.Title or "NoName",
		Alias = data.Alias or {},
		HasArgs = data.Args or false,
		Variables = data.Variables or {"me"},
		SelfCallback = data.SelfCallback or {},
		Callback = data.Callback or function() end
	}
	table.insert(self.commands, command)
end

function CommandSystem:GetMatchingCommands(text)
	if text == "" then
		return {}
	end
	
	local exactMatches = {}
	local startsWithMatches = {}
	local containsMatches = {}
	local lowerText = text:lower()
	
	for _, cmd in ipairs(self.commands) do
		local cmdLower = cmd.Title:lower()
		
		if cmdLower == lowerText then
			table.insert(exactMatches, cmd)
		elseif cmdLower:sub(1, #lowerText) == lowerText then
			table.insert(startsWithMatches, cmd)
		elseif cmdLower:find(lowerText, 1, true) then
			table.insert(containsMatches, cmd)
		else
			for _, alias in ipairs(cmd.Alias) do
				local aliasLower = alias:lower()
				if aliasLower == lowerText then
					table.insert(exactMatches, cmd)
					break
				elseif aliasLower:sub(1, #lowerText) == lowerText then
					table.insert(startsWithMatches, cmd)
					break
				elseif aliasLower:find(lowerText, 1, true) then
					table.insert(containsMatches, cmd)
					break
				end
			end
		end
	end
	
	local matches = {}
	for _, cmd in ipairs(exactMatches) do table.insert(matches, cmd) end
	for _, cmd in ipairs(startsWithMatches) do table.insert(matches, cmd) end
	for _, cmd in ipairs(containsMatches) do table.insert(matches, cmd) end
	
	return matches
end



function CommandSystem:ExecuteCommand(text)
	local lowerText = text:lower()
	local args = {}
	for word in text:gmatch("%S+") do
		table.insert(args, word)
	end
	
	local commandWord = args[1] and args[1]:lower() or lowerText
	
	for _, cmd in ipairs(self.commands) do
		if cmd.Title:lower() == commandWord then
			if cmd.HasArgs and #cmd.Variables > 0 then
				local parsedArgs = {}
				
				for i, varType in ipairs(cmd.Variables) do
					local argIndex = i + 1
					
					local selfCallbackValue = nil
					if cmd.SelfCallback then
						if type(cmd.SelfCallback) == "table" then
							selfCallbackValue = cmd.SelfCallback[i]
						else
							selfCallbackValue = (i == 1) and cmd.SelfCallback or nil
						end
					end
					
					if varType == "Player" then
						local playerArg = args[argIndex]
						if playerArg then
							local players = GetPlayer(playerArg)
							if players then
								table.insert(parsedArgs, players)
							else
								NotificationLibrary:SendNotification("Error", "Player not found", 2)
								return true
							end
						else
							if selfCallbackValue == "me" or selfCallbackValue == true then
								table.insert(parsedArgs, {Player})
							elseif selfCallbackValue then
								local players = GetPlayer(selfCallbackValue)
								if players then
									table.insert(parsedArgs, players)
								else
									table.insert(parsedArgs, {Player})
								end
							else
								NotificationLibrary:SendNotification("Error", "Player argument required", 2)
								return true
							end
						end
					elseif varType == "Number" then
						local numArg = tonumber(args[argIndex])
						if numArg then
							table.insert(parsedArgs, numArg)
						else
							if selfCallbackValue and type(selfCallbackValue) == "number" then
								table.insert(parsedArgs, selfCallbackValue)
							else
								NotificationLibrary:SendNotification("Error", "Invalid Number", 3)
								return true
							end
						end
					elseif varType == "String" then
						local strArg = args[argIndex]
						if strArg then
							table.insert(parsedArgs, strArg)
						else
							if selfCallbackValue and type(selfCallbackValue) == "string" then
								table.insert(parsedArgs, selfCallbackValue)
							else
								table.insert(parsedArgs, "")
							end
						end
					elseif varType == "Text" then
						local textArgs = {}
						for j = argIndex, #args do
							table.insert(textArgs, args[j])
						end
						local textResult = table.concat(textArgs, " ")
						if textResult == "" and selfCallbackValue and type(selfCallbackValue) == "string" then
							table.insert(parsedArgs, selfCallbackValue)
						else
							table.insert(parsedArgs, textResult)
						end
						break
					end
				end
				
				if #parsedArgs > 0 and parsedArgs[1] and type(parsedArgs[1]) == "table" then
					for _, targetPlayer in ipairs(parsedArgs[1]) do
						local callbackArgs = {targetPlayer}
						for i = 2, #parsedArgs do
							table.insert(callbackArgs, parsedArgs[i])
						end
						cmd.Callback(table.unpack(callbackArgs))
					end
				else
					cmd.Callback(table.unpack(parsedArgs))
				end
			else
				cmd.Callback()
			end
			return true
		end
	end
	
	for _, cmd in ipairs(self.commands) do
		for _, alias in ipairs(cmd.Alias) do
			if alias:lower() == commandWord then
				if cmd.HasArgs and #cmd.Variables > 0 then
					local parsedArgs = {}
					
					for i, varType in ipairs(cmd.Variables) do
						local argIndex = i + 1
						
						local selfCallbackValue = nil
						if cmd.SelfCallback then
							if type(cmd.SelfCallback) == "table" then
								selfCallbackValue = cmd.SelfCallback[i]
							else
								selfCallbackValue = (i == 1) and cmd.SelfCallback or nil
							end
						end
						
						if varType == "Player" then
							local playerArg = args[argIndex]
							if playerArg then
								local players = GetPlayer(playerArg)
								if players then
									table.insert(parsedArgs, players)
								else
									NotificationLibrary:SendNotification("Error", "Player not found", 2)
									return true
								end
							else
								if selfCallbackValue == "me" or selfCallbackValue == true then
									table.insert(parsedArgs, {Player})
								elseif selfCallbackValue then
									local players = GetPlayer(selfCallbackValue)
									if players then
										table.insert(parsedArgs, players)
									else
										table.insert(parsedArgs, {Player})
									end
								else
									NotificationLibrary:SendNotification("Error", "Player argument required", 2)
									return true
								end
							end
						elseif varType == "Number" then
							local numArg = tonumber(args[argIndex])
							if numArg then
								table.insert(parsedArgs, numArg)
							else
								if selfCallbackValue and type(selfCallbackValue) == "number" then
									table.insert(parsedArgs, selfCallbackValue)
								else
									NotificationLibrary:SendNotification("Error", "Invalid number", 2)
									return true
								end
							end
						elseif varType == "String" then
							local strArg = args[argIndex]
							if strArg then
								table.insert(parsedArgs, strArg)
							else
								if selfCallbackValue and type(selfCallbackValue) == "string" then
									table.insert(parsedArgs, selfCallbackValue)
								else
									table.insert(parsedArgs, "")
								end
							end
						elseif varType == "Text" then
							local textArgs = {}
							for j = argIndex, #args do
								table.insert(textArgs, args[j])
							end
							local textResult = table.concat(textArgs, " ")
							if textResult == "" and selfCallbackValue and type(selfCallbackValue) == "string" then
								table.insert(parsedArgs, selfCallbackValue)
							else
								table.insert(parsedArgs, textResult)
							end
							break
						end
					end
					
					if #parsedArgs > 0 and parsedArgs[1] and type(parsedArgs[1]) == "table" then
						for _, targetPlayer in ipairs(parsedArgs[1]) do
							local callbackArgs = {targetPlayer}
							for i = 2, #parsedArgs do
								table.insert(callbackArgs, parsedArgs[i])
							end
							cmd.Callback(table.unpack(callbackArgs))
						end
					else
						cmd.Callback(table.unpack(parsedArgs))
					end
				else
					cmd.Callback()
				end
				return true
			end
		end
	end
	
	return false
end

function SetUpChatCommands()
    local prefix = ":"
    
    function OnChat(message)
        if message:sub(1, #prefix) == prefix then
            local command = message:sub(#prefix + 1)
            CommandSystem:ExecuteCommand(command)
        end
    end
    
    Player.Chatted:Connect(OnChat)
end

local G2L = {}

G2L["DarkAdmin_1"] = Instance.new("ScreenGui", game:GetService("CoreGui"))
G2L["DarkAdmin_1"]["Name"] = "DarkAdmin"
G2L["DarkAdmin_1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling
G2L["DarkAdmin_1"]["ResetOnSpawn"] = false

CollectionService:AddTag(G2L["DarkAdmin_1"], "main")

G2L["CommandFrame_2"] = Instance.new("Frame", G2L["DarkAdmin_1"])
G2L["CommandFrame_2"]["BorderSizePixel"] = 0
G2L["CommandFrame_2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["CommandFrame_2"]["Size"] = UDim2.new(0, 0, 0, 40)
G2L["CommandFrame_2"]["Position"] = UDim2.new(0, 230, 0, -46)
G2L["CommandFrame_2"]["Name"] = "CommandFrame"
G2L["CommandFrame_2"]["BackgroundTransparency"] = 0.1
G2L["CommandFrame_2"]["Visible"] = false
G2L["CommandFrame_2"]["ClipsDescendants"] = false

G2L["UICorner_3"] = Instance.new("UICorner", G2L["CommandFrame_2"])
G2L["UICorner_3"]["CornerRadius"] = UDim.new(0, 20)

G2L["UIGradient_4"] = Instance.new("UIGradient", G2L["CommandFrame_2"])
G2L["UIGradient_4"]["Color"] = ColorSequence.new{
	ColorSequenceKeypoint.new(0.000, Color3.fromRGB(5, 5, 5)),
	ColorSequenceKeypoint.new(1.000, Color3.fromRGB(40, 40, 40))
}

G2L["UIStroke_CommandFrame"] = Instance.new("UIStroke", G2L["CommandFrame_2"])
G2L["UIStroke_CommandFrame"]["Thickness"] = 0
G2L["UIStroke_CommandFrame"]["Color"] = Color3.fromRGB(255, 255, 255)
G2L["UIStroke_CommandFrame"]["Transparency"] = 1

G2L["Frame_5"] = Instance.new("Frame", G2L["CommandFrame_2"])
G2L["Frame_5"]["BorderSizePixel"] = 0
G2L["Frame_5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["Frame_5"]["Size"] = UDim2.new(0, 190, 0, 28)
G2L["Frame_5"]["Position"] = UDim2.new(0, 8, 0, 6)
G2L["Frame_5"]["BackgroundTransparency"] = 1

G2L["UICorner_6"] = Instance.new("UICorner", G2L["Frame_5"])
G2L["UICorner_6"]["CornerRadius"] = UDim.new(0, 25)

G2L["TextBox_7"] = Instance.new("TextBox", G2L["Frame_5"])
G2L["TextBox_7"]["CursorPosition"] = -1
G2L["TextBox_7"]["PlaceholderColor3"] = Color3.fromRGB(156, 156, 156)
G2L["TextBox_7"]["BorderSizePixel"] = 0
G2L["TextBox_7"]["TextSize"] = 20
G2L["TextBox_7"]["TextColor3"] = Color3.fromRGB(211, 211, 211)
G2L["TextBox_7"]["BackgroundColor3"] = Color3.fromRGB(142, 142, 142)
G2L["TextBox_7"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
G2L["TextBox_7"]["PlaceholderText"] = "Command Bar :"
G2L["TextBox_7"]["Size"] = UDim2.new(0, 190, 0, 28)
G2L["TextBox_7"]["Text"] = ""
G2L["TextBox_7"]["BackgroundTransparency"] = 1
G2L["TextBox_7"]["TextXAlignment"] = Enum.TextXAlignment.Center

G2L["UICorner_8"] = Instance.new("UICorner", G2L["TextBox_7"])
G2L["UICorner_8"]["CornerRadius"] = UDim.new(0, 20)

G2L["UIStroke_a"] = Instance.new("UIStroke", G2L["TextBox_7"])
G2L["UIStroke_a"]["Thickness"] = 0.3

G2L["UIStroke_b"] = Instance.new("UIStroke", G2L["Frame_5"])
G2L["UIStroke_b"]["Thickness"] = 0.5
G2L["UIStroke_b"]["Color"] = Color3.fromRGB(99, 99, 99)

G2L["AutocompleteFrame"] = Instance.new("Frame", G2L["CommandFrame_2"])
G2L["AutocompleteFrame"]["BorderSizePixel"] = 0
G2L["AutocompleteFrame"]["BackgroundColor3"] = Color3.fromRGB(20, 20, 20)
G2L["AutocompleteFrame"]["Size"] = UDim2.new(0, 200, 0, 0)
G2L["AutocompleteFrame"]["Position"] = UDim2.new(0, 2, 1, 6)
G2L["AutocompleteFrame"]["BackgroundTransparency"] = 0.2
G2L["AutocompleteFrame"]["Visible"] = true
G2L["AutocompleteFrame"]["ClipsDescendants"] = false
G2L["AutocompleteFrame"]["ZIndex"] = 10

G2L["UICorner_Auto"] = Instance.new("UICorner", G2L["AutocompleteFrame"])

G2L["UIStroke_AutoFrame"] = Instance.new("UIStroke", G2L["AutocompleteFrame"])
G2L["UIStroke_AutoFrame"]["Thickness"] = 0
G2L["UIStroke_AutoFrame"]["Color"] = Color3.fromRGB(60, 60, 60)

G2L["ScrollingFrame_Auto"] = Instance.new("ScrollingFrame", G2L["AutocompleteFrame"])
G2L["ScrollingFrame_Auto"]["ScrollingDirection"] = Enum.ScrollingDirection.Y
G2L["ScrollingFrame_Auto"]["BorderSizePixel"] = 0
G2L["ScrollingFrame_Auto"]["CanvasSize"] = UDim2.new(0, 0, 0, 0)
G2L["ScrollingFrame_Auto"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["ScrollingFrame_Auto"]["ScrollBarImageTransparency"] = 0.3
G2L["ScrollingFrame_Auto"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y
G2L["ScrollingFrame_Auto"]["Size"] = UDim2.new(1, -8, 1, -8)
G2L["ScrollingFrame_Auto"]["ScrollBarImageColor3"] = Color3.fromRGB(21, 21, 21)
G2L["ScrollingFrame_Auto"]["Position"] = UDim2.new(0, 4, 0, 4)
G2L["ScrollingFrame_Auto"]["ScrollBarThickness"] = 2
G2L["ScrollingFrame_Auto"]["BackgroundTransparency"] = 1

G2L["UIListLayout_Auto"] = Instance.new("UIListLayout", G2L["ScrollingFrame_Auto"])
G2L["UIListLayout_Auto"]["Padding"] = UDim.new(0, 4)

G2L["UIPadding_Auto"] = Instance.new("UIPadding", G2L["ScrollingFrame_Auto"])
G2L["UIPadding_Auto"]["PaddingLeft"] = UDim.new(0, 4)
G2L["UIPadding_Auto"]["PaddingTop"] = UDim.new(0, 4)
G2L["UIPadding_Auto"]["PaddingBottom"] = UDim.new(0, 2)

G2L["Frame_c"] = Instance.new("Frame", G2L["DarkAdmin_1"])
G2L["Frame_c"]["BorderSizePixel"] = 0
G2L["Frame_c"]["BackgroundColor3"] = Color3.fromRGB(0, 0, 0)
G2L["Frame_c"]["Size"] = UDim2.new(0, 40, 0, 40)
G2L["Frame_c"]["Position"] = UDim2.new(0, 230, 0, -150)
G2L["Frame_c"]["BackgroundTransparency"] = 0.2
G2L["Frame_c"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
G2L["Frame_c"]["Active"] = true

G2L["UICorner_d"] = Instance.new("UICorner", G2L["Frame_c"])
G2L["UICorner_d"]["CornerRadius"] = UDim.new(0, 50)

G2L["TextButton_e"] = Instance.new("TextButton", G2L["Frame_c"])
G2L["TextButton_e"]["BorderSizePixel"] = 0
G2L["TextButton_e"]["TextSize"] = 20
G2L["TextButton_e"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
G2L["TextButton_e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
G2L["TextButton_e"]["FontFace"] = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
G2L["TextButton_e"]["BackgroundTransparency"] = 1
G2L["TextButton_e"]["Size"] = UDim2.new(1, 0, 1, 0)
G2L["TextButton_e"]["Text"] = "DA"
G2L["TextButton_e"]["Active"] = false

G2L["UICorner_f"] = Instance.new("UICorner", G2L["TextButton_e"])
G2L["UICorner_f"]["CornerRadius"] = UDim.new(0, 50)

G2L["UIStroke_10"] = Instance.new("UIStroke", G2L["TextButton_e"])
G2L["UIStroke_10"]["Thickness"] = 0.5

local Settings = {
	isCommandFrameOpen = false,
	isDragging = false,
	isTyping = false,
	dragStart = nil,
	startPos = nil,
	inputStartPos = nil,
	dragThreshold = 3,
	lastTypingTime = 0,
	hideTimerActive = false,
	selectedCommandIndex = 1,
	currentMatches = {},
	dragConnection = nil,
	savedPosition = nil
}

local toggleCommandFrame
local startHideTimer
local updateCommandFramePosition

function createCommandLabel(text, index)
	local container = Instance.new("Frame")
	container.BorderSizePixel = 0
	container.BackgroundTransparency = 1
	container.Size = UDim2.new(1, 0, 0, 42)
	container.Name = "CommandContainer_" .. index
	container.ZIndex = 11
	container.ClipsDescendants = true
	
	local label = Instance.new("TextLabel")
	label.BorderSizePixel = 0
	label.TextSize = 20
	label.TextXAlignment = Enum.TextXAlignment.Left
	label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	label.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
	label.TextColor3 = Color3.fromRGB(255, 255, 255)
	label.BackgroundTransparency = 1
	label.Size = UDim2.new(1, 0, 1, 0)
	label.Text = text
	label.Name = "CommandLabel"
	label.ZIndex = 11
	label.TextTransparency = 0
	label.Position = UDim2.new(0, 0, 0, 0)
	label.Parent = container
	
	local textService = game:GetService("TextService")
	local textSize = textService:GetTextSize(text, 20, Enum.Font.SourceSansSemibold, Vector2.new(math.huge, 42))
	
	if textSize.X > 180 then
		task.spawn(function()
			local slideDistance = textSize.X - 180
			task.wait(0.2)
			while label and label.Parent do
				TweenService:Create(
					label,
					TweenInfo.new(slideDistance / 30, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
					{Position = UDim2.new(0, -slideDistance, 0, 0)}
				):Play()
				task.wait(slideDistance / 30 + 1)
				TweenService:Create(
					label,
					TweenInfo.new(slideDistance / 30, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut),
					{Position = UDim2.new(0, 0, 0, 0)}
				):Play()
				task.wait(slideDistance / 30 + 1)
			end
		end)
	end
	
	return container
end

function updateSelectionHighlight()
	for i, child in ipairs(G2L["ScrollingFrame_Auto"]:GetChildren()) do
		if child:IsA("Frame") and child.Name:match("CommandContainer") then
			local label = child:FindFirstChild("CommandLabel")
			if label then
				if i == Settings.selectedCommandIndex then
					label.TextColor3 = Color3.fromRGB(100, 200, 255)
				else
					label.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
		end
	end
end

function updateAutocomplete(text)
	for _, child in ipairs(G2L["ScrollingFrame_Auto"]:GetChildren()) do
		if child:IsA("Frame") then
			child:Destroy()
		end
	end
	
	local matches = CommandSystem:GetMatchingCommands(text)
	Settings.currentMatches = matches
	
	if #matches > 0 then
		Settings.selectedCommandIndex = 1
		
		local minWidth = 200
		local maxWidth = 200
		local textService = game:GetService("TextService")
		
		for i, cmd in ipairs(matches) do
			local container = createCommandLabel(cmd.Title, i)
			container.Parent = G2L["ScrollingFrame_Auto"]
			
			local textSize = textService:GetTextSize(
				cmd.Title,
				20,
				Enum.Font.SourceSansSemibold,
				Vector2.new(math.huge, 42)
			)
			
			local requiredWidth = math.min(textSize.X + 20, 200)
			if requiredWidth > maxWidth then
				maxWidth = requiredWidth
			end
			
			container.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					CommandSystem:ExecuteCommand(cmd.Title)
					G2L["TextBox_7"].Text = ""
				end
			end)
		end
		
		maxWidth = math.max(minWidth, math.min(maxWidth, 500))
		updateSelectionHighlight()
		
		local targetHeight = math.min(#matches * 46, 600)
		
		G2L["AutocompleteFrame"].Visible = true
		G2L["AutocompleteFrame"].Size = UDim2.new(0, maxWidth, 0, 0)
		
		TweenService:Create(
			G2L["AutocompleteFrame"],
			TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, maxWidth, 0, targetHeight)}
		):Play()
	else
		TweenService:Create(
			G2L["AutocompleteFrame"],
			TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
			{Size = UDim2.new(0, 200, 0, 0)}
		):Play()
	end
end

updateCommandFramePosition = function()
	if Settings.isCommandFrameOpen then
		local circleX = G2L["Frame_c"].Position.X.Offset
		local circleY = G2L["Frame_c"].Position.Y.Offset
		G2L["CommandFrame_2"].Position = UDim2.new(0, circleX + 20, 0, circleY)
	end
end

startHideTimer = function()
	if Settings.hideTimerActive then
		Settings.hideTimerActive = false
		task.wait(0.1)
	end
	
	Settings.hideTimerActive = true
	task.spawn(function()
		while Settings.hideTimerActive and Settings.isCommandFrameOpen do
			task.wait(0.5)
			
			if not Settings.isTyping and Settings.isCommandFrameOpen and (tick() - Settings.lastTypingTime) >= 1.5 then
				Settings.isCommandFrameOpen = false
				Settings.hideTimerActive = false
				
				TweenService:Create(
					G2L["AutocompleteFrame"],
					TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
					{Size = UDim2.new(0, 200, 0, 0)}
				):Play()
				
				local hideCommandTween = TweenService:Create(
					G2L["CommandFrame_2"],
					TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
					{Size = UDim2.new(0, 0, 0, 40)}
				)
				
				hideCommandTween:Play()
				hideCommandTween.Completed:Wait()
				G2L["CommandFrame_2"].Visible = false
				break
			end
		end
	end)
end

toggleCommandFrame = function()
	if Settings.isTyping then
		return
	end
	
	if Settings.isCommandFrameOpen then
		Settings.isCommandFrameOpen = false
		TweenService:Create(
			G2L["AutocompleteFrame"],
			TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
			{Size = UDim2.new(0, 200, 0, 0)}
		):Play()
		TweenService:Create(
			G2L["CommandFrame_2"],
			TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
			{Size = UDim2.new(0, 0, 0, 40)}
		):Play()
		task.wait(0.3)
		G2L["CommandFrame_2"].Visible = false
	else
		Settings.isCommandFrameOpen = true
		updateCommandFramePosition()
		G2L["CommandFrame_2"].Visible = true
		TweenService:Create(
			G2L["CommandFrame_2"],
			TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 206, 0, 40)}
		):Play()
		task.wait(0.35)
		G2L["TextBox_7"]:CaptureFocus()
		startHideTimer()
	end
end

G2L["Frame_c"].MouseEnter:Connect(function()
	if not Settings.isDragging then
		TweenService:Create(
			G2L["Frame_c"],
			TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 47, 0, 47)}
		):Play()
	end
end)

G2L["Frame_c"].MouseLeave:Connect(function()
	if not Settings.isDragging then
		TweenService:Create(
			G2L["Frame_c"],
			TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 40, 0, 40)}
		):Play()
	end
end)

function SetUpDragging()
	local circleFrame = G2L["Frame_c"]
	
	local dragDetector = Instance.new("UIDragDetector")
	dragDetector.Parent = circleFrame
	dragDetector.DragStyle = Enum.UIDragDetectorDragStyle.TranslatePlane
	dragDetector.ActivatedCursorIcon = "rbxasset://SystemCursors/DragCursor"
	
	local isDragging = false
	local hasMoved = false
	local startPosition = nil
	
	dragDetector.DragStart:Connect(function()
		isDragging = true
		hasMoved = false
		startPosition = circleFrame.Position
	end)
	
	dragDetector.DragContinue:Connect(function(transform)
		hasMoved = true
		Settings.isDragging = true
		
		local viewportPoint = workspace.CurrentCamera:WorldToViewportPoint(transform.Position)
		circleFrame.Position = UDim2.fromOffset(viewportPoint.X, viewportPoint.Y)
		
		if Settings.isCommandFrameOpen then
			updateCommandFramePosition()
		end
	end)
	
	dragDetector.DragEnd:Connect(function()
		isDragging = false
		Settings.isDragging = false
		
		if not hasMoved then
			if not Settings.isCommandFrameOpen then
				toggleCommandFrame()
			else
				G2L["TextBox_7"]:CaptureFocus()
			end
		end
		
		hasMoved = false
		
          TweenService:Create(
			G2L["Frame_c"],
			TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 40, 0, 40)}
		):Play()
	end)
end

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not Settings.isTyping or gameProcessed then return end
	
	if input.KeyCode == Enum.KeyCode.Up then
		if #Settings.currentMatches > 0 then
			Settings.selectedCommandIndex = math.max(1, Settings.selectedCommandIndex - 1)
			updateSelectionHighlight()
		end
	elseif input.KeyCode == Enum.KeyCode.Down then
		if #Settings.currentMatches > 0 then
			Settings.selectedCommandIndex = math.min(#Settings.currentMatches, Settings.selectedCommandIndex + 1)
			updateSelectionHighlight()
		end
	elseif input.KeyCode == Enum.KeyCode.Tab then
		if #Settings.currentMatches > 0 then
			G2L["TextBox_7"].Text = Settings.currentMatches[Settings.selectedCommandIndex].Title
		end
	end
end)

G2L["TextBox_7"].Focused:Connect(function()
    Settings.isTyping = true
    Settings.lastTypingTime = tick()
    G2L["UIStroke_CommandFrame"].Thickness = 0.3
    G2L["UIStroke_CommandFrame"].Transparency = 0
    
    if G2L["CommandFrame_2"].Size.X.Offset >= 200 then
        updateAutocomplete(G2L["TextBox_7"].Text)
    end
end)

G2L["TextBox_7"].FocusLost:Connect(function(enterPressed)
	Settings.isTyping = false
	Settings.lastTypingTime = tick()
	
	local textToExecute = G2L["TextBox_7"].Text
	
	G2L["TextBox_7"].Text = ""
	
	if textToExecute ~= "" and (enterPressed or UserInputService.TouchEnabled) then
		CommandSystem:ExecuteCommand(textToExecute)
	end
	
	G2L["UIStroke_CommandFrame"].Thickness = 0
	G2L["UIStroke_CommandFrame"].Transparency = 1
	
	TweenService:Create(
		G2L["AutocompleteFrame"],
		TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
		{Size = UDim2.new(0, 200, 0, 0)}
	):Play()
	
	startHideTimer()
end)    

G2L["TextBox_7"]:GetPropertyChangedSignal("Text"):Connect(function()
	Settings.lastTypingTime = tick()
	if G2L["TextBox_7"].Text ~= "" then
		G2L["UIStroke_CommandFrame"].Thickness = 0.5
		G2L["UIStroke_CommandFrame"].Transparency = 0
	else
		if not Settings.isTyping then
			G2L["UIStroke_CommandFrame"].Thickness = 0
			G2L["UIStroke_CommandFrame"].Transparency = 1
		end
	end
	
	updateAutocomplete(G2L["TextBox_7"].Text)
end)

function PlayIntro()
	task.wait(0.2)
	
	local IconAnim = TweenService:Create(
		G2L["Frame_c"],
		TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{Position = UDim2.new(0, 250, 0, -26)}
	)
	
	IconAnim:Play()
	IconAnim.Completed:Wait()
	
	G2L["CommandFrame_2"].Position = UDim2.new(0, 270, 0, -26)
	G2L["CommandFrame_2"].Visible = true
	
	G2L["TextBox_7"].PlaceholderText = "Hello " .. Player.DisplayName
	G2L["TextBox_7"].TextSize = 20
	G2L["TextBox_7"].PlaceholderColor3 = Color3.fromRGB(156, 156, 156)
	
	G2L["UIStroke_CommandFrame"].Thickness = 0
	G2L["UIStroke_CommandFrame"].Transparency = 1
	
	local CommandFrameAnim = TweenService:Create(
		G2L["CommandFrame_2"],
		TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
		{Size = UDim2.new(0, 206, 0, 40)}
	)
	
	CommandFrameAnim:Play()
	CommandFrameAnim.Completed:Wait()
	
	local S = TweenService:Create(
		G2L["CommandFrame_2"],
		TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
		{Size = UDim2.new(0, 206, 0, 40)}
	)
	
	S:Play()
	S.Completed:Wait()
	
	task.wait(2)
	
	local fadePlaceholder = TweenService:Create(
		G2L["TextBox_7"],
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
		{PlaceholderColor3 = Color3.fromRGB(50, 50, 50)}
	)
	
	fadePlaceholder:Play()
	fadePlaceholder.Completed:Wait()
	
	G2L["TextBox_7"].PlaceholderText = "Command Bar :"
	
	local fadeInPlaceholder = TweenService:Create(
		G2L["TextBox_7"],
		TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
		{PlaceholderColor3 = Color3.fromRGB(156, 156, 156)}
	)
	
	fadeInPlaceholder:Play()
	fadeInPlaceholder.Completed:Wait()
	
	Settings.isCommandFrameOpen = true
	Settings.isTyping = false
	Settings.lastTypingTime = tick()
	startHideTimer()
	
	pcall(function()
		loadstring(game:HttpGet("https://pastefy.app/V9dK9Dyt/raw"))()
	end)
	
	task.wait(0.2)
	NotificationLibrary:SendNotification("Success", "DarkAdmin has Loaded...", 3)
	task.wait(0.2)
	NotificationLibrary:SendNotification("Info", "Execute your First Command. Help / Info / To see all Commands", 3.2)
end

function Args(text, index)
    local args = {}
    for word in text:gmatch("%S+") do
        table.insert(args, word)
    end
    
    if index then
        local num = tonumber(args[index])
        return num or args[index]
    end
    
    return args
end

function GetPlayer(input)
    if not input then return nil end
    
    local lowerInput = input:lower()
    
    if lowerInput == "me" then
        return {Player}
    end
    
    if lowerInput == "all" then
        local allPlayers = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= Player then
                table.insert(allPlayers, p)
            end
        end
        return allPlayers
    end
    
    if lowerInput == "random" then
        local allPlayers = {}
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= Player then
                table.insert(allPlayers, p)
            end
        end
        if #allPlayers > 0 then
            return {allPlayers[math.random(1, #allPlayers)]}
        end
        return nil
    end
    
    local foundPlayers = {}
    
    for _, p in ipairs(Players:GetPlayers()) do
        local name = p.Name:lower()
        local displayName = p.DisplayName:lower()
        
        if name == lowerInput or displayName == lowerInput then
            return {p}
        end
        
        if name:sub(1, #lowerInput) == lowerInput or displayName:sub(1, #lowerInput) == lowerInput then
            table.insert(foundPlayers, p)
        end
    end
    
    if #foundPlayers > 0 then
        return foundPlayers
    end
    
    for _, p in ipairs(Players:GetPlayers()) do
        local name = p.Name:lower()
        local displayName = p.DisplayName:lower()
        
        if name:find(lowerInput, 1, true) or displayName:find(lowerInput, 1, true) then
            table.insert(foundPlayers, p)
        end
    end
    
    return #foundPlayers > 0 and foundPlayers or nil
end


local CMD_Settings = {
    FlyCMD = {
        FlyOn = false,
        FlySpeed = 2
    },
    AntiAfkCMD = {
        AntiAfkOn = false
    },
    LoopBoostFpsCMD = {
        LoopBoostFpsOn = false
    },
    InfiniteJumpCMD = {
        InfiniteJumpOn = false
    },
    AimbotCMD = {
        AimbotEnabled = false,
        AimbotTarget = nil,
        AimbotConnection = nil
    },
    BangCMD = {
        BangOn = false,
        BangLoop = nil,
        BangDied = nil,
        BangAnim = nil
    },
    StareCMD = {
        StareLoop = nil,
        StareTarget = nil
    },
    JerkCMD = {
        JerkTool = nil,
        JerkLoop = nil,
        JerkTrack = nil,
        Jorking = false
    },
    FreezeCMD = {
        FrozenParts = {},
        OriginalCFrames = {}
    },
    BunnyHopCMD = {
        BunnyHopOn = false,
        BunnyHopLoop = nil
    },
    CloneCMD = {
        Clones = {}
    },
    ClickTpCMD = {
        ClickTpOn = false,
        ClickTpConnection = nil
    },
    EspCMD = {
        EspPlayers = {},
        EspConnections = {}
    },
    FlingCMD = {
        FlingOn = false,
        BV = nil,
        FlingDied = nil,
        FlingLoop = nil
    },
    AntiFlingCMD = {
        AntiFlingOn = false,
        AntiFlingLoop = nil
    },
    WalkFlingCMD = {
        WalkFlingOn = false,
        WalkFlingDied = nil
    },
    SwimCMD = {
        Swimming = false,
        OldGrav = 0,
        SwimBeat = nil,
        GravReset = nil
    },
    GodModeCMD = {
        GodModeOn = false,
        OriginalHumanoid = nil
    },
    HideCMD = {
        HiddenPlayers = {}
    },
    HideNameCMD = {
        HiddenNames = {}
    },
    InvisCMD = {
        InvisRunning = false,
        IsInvis = false,
        IsRunning = true,
        InvisibleCharacter = nil,
        OriginalCharacter = nil,
        InvisFix = nil,
        InvisDied = nil,
        CF = nil
    },
    LoopWsCMD = {
        LoopWsOn = false,
        WsSpeed = 16,
        LoopWsConnection = nil
    },
    LoopJpCMD = {
        LoopJpOn = false,
        JpHeight = 50,
        LoopJpConnection = nil
    },
    NoclipCamCMD = {
        NoclipCamOn = false,
        NoclipCamConnection = nil
    },
    OrbitCMD = {
        Orbit1 = nil,
        Orbit2 = nil,
        Orbit3 = nil,
        Orbit4 = nil,
        OrbitTarget = nil
    },
    SpinCMD = {
        SpinOn = false,
        SpinSpeed = 20,
        SpinLoop = nil
    },
    SpamCMD = {
        SpamOn = false,
        SpamText = "",
        SpamLoop = nil
    },
    TweenToCMD = {
        TweenToOn = false,
        TweenToTween = nil
    },
    ViewCMD = {
        ViewTarget = nil,
        OriginalSubject = nil
    },
    WalkToCMD = {
    WalkToOn = false,
    WalkToConnection = nil,
    WalkToTarget = nil
    },
    WalkOnWallsCMD = {
    WalkOnWallsOn = false,
    WalkConnection = nil,
    DiedConnection = nil
    },
    XrayCMD = {
    XrayOn = false,
    OriginalTransparencies = {}
    },
    XmarkCMD = {
    Xmarks = {}
    },
    SpamYellCMD = {
    SpamYellOn = false,
    SpamYellLoop = nil,
    YellText = ""
    }
}


local flyKeyDown, flyKeyUp, mfly1, mfly2

function sFLY()
    repeat task.wait() until Players.LocalPlayer and Players.LocalPlayer.Character and Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    repeat task.wait() until UserInputService
    if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect(); flyKeyUp:Disconnect() end

    local T = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
    local SPEED = CMD_Settings.FlyCMD.FlySpeed

    function FLY()
        CMD_Settings.FlyCMD.FlyOn = true
        local BG = Instance.new('BodyGyro')
        local BV = Instance.new('BodyVelocity')
        BG.P = 9e4
        BG.Parent = T
        BV.Parent = T
        BG.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.CFrame = T.CFrame
        BV.Velocity = Vector3.new(0, 0, 0)
        BV.MaxForce = Vector3.new(9e9, 9e9, 9e9)
        task.spawn(function()
            while CMD_Settings.FlyCMD.FlyOn do
                task.wait()
                if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
                end
                if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
                    SPEED = CMD_Settings.FlyCMD.FlySpeed
                elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
                    SPEED = 0
                end
                if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
                    BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                    lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
                elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
                    BV.Velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
                else
                    BV.Velocity = Vector3.new(0, 0, 0)
                end
                BG.CFrame = workspace.CurrentCamera.CoordinateFrame
            end
            CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
            SPEED = 0
            BG:Destroy()
            BV:Destroy()
            if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
                Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
            end
        end)
    end
    flyKeyDown = UserInputService.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY == "W" then
                CONTROL.F = CMD_Settings.FlyCMD.FlySpeed
            elseif KEY == "S" then
                CONTROL.B = -CMD_Settings.FlyCMD.FlySpeed
            elseif KEY == "A" then
                CONTROL.L = -CMD_Settings.FlyCMD.FlySpeed
            elseif KEY == "D" then
                CONTROL.R = CMD_Settings.FlyCMD.FlySpeed
            elseif KEY == "E" then
                CONTROL.Q = CMD_Settings.FlyCMD.FlySpeed * 2
            elseif KEY == "Q" then
                CONTROL.E = -CMD_Settings.FlyCMD.FlySpeed * 2
            end
            pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
        end
    end)
    flyKeyUp = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local KEY = input.KeyCode.Name
            if KEY == "W" then
                CONTROL.F = 0
            elseif KEY == "S" then
                CONTROL.B = 0
            elseif KEY == "A" then
                CONTROL.L = 0
            elseif KEY == "D" then
                CONTROL.R = 0
            elseif KEY == "E" then
                CONTROL.Q = 0
            elseif KEY == "Q" then
                CONTROL.E = 0
            end
        end
    end)
    FLY()
end

function NOFLY()
    CMD_Settings.FlyCMD.FlyOn = false
    if flyKeyDown then flyKeyDown:Disconnect() end
    if flyKeyUp then flyKeyUp:Disconnect() end
    if mfly1 then mfly1:Disconnect() end
    if mfly2 then mfly2:Disconnect() end
    if Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid') then
        Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
    end
    pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

function UnMobileFly()
    pcall(function()
        CMD_Settings.FlyCMD.FlyOn = false
        local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        if root:FindFirstChild("BodyVelocity") then root:FindFirstChild("BodyVelocity"):Destroy() end
        if root:FindFirstChild("BodyGyro") then root:FindFirstChild("BodyGyro"):Destroy() end
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
            Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
        end
        if mfly1 then mfly1:Disconnect() end
        if mfly2 then mfly2:Disconnect() end
    end)
end

function MobileFly()
    UnMobileFly()
    CMD_Settings.FlyCMD.FlyOn = true

    local root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
    local camera = workspace.CurrentCamera
    local v3none = Vector3.new()
    local v3zero = Vector3.new(0, 0, 0)
    local v3inf = Vector3.new(9e9, 9e9, 9e9)

    local controlModule = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
    local bv = Instance.new("BodyVelocity")
    bv.Name = "BodyVelocity"
    bv.Parent = root
    bv.MaxForce = v3zero
    bv.Velocity = v3zero

    local bg = Instance.new("BodyGyro")
    bg.Name = "BodyGyro"
    bg.Parent = root
    bg.MaxTorque = v3inf
    bg.P = 1000
    bg.D = 50

    mfly1 = Players.LocalPlayer.CharacterAdded:Connect(function()
        local newRoot = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        local newBv = Instance.new("BodyVelocity")
        newBv.Name = "BodyVelocity"
        newBv.Parent = newRoot
        newBv.MaxForce = v3zero
        newBv.Velocity = v3zero

        local newBg = Instance.new("BodyGyro")
        newBg.Name = "BodyGyro"
        newBg.Parent = newRoot
        newBg.MaxTorque = v3inf
        newBg.P = 1000
        newBg.D = 50
    end)

    mfly2 = RunService.RenderStepped:Connect(function()
        root = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        camera = workspace.CurrentCamera
        if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and root and root:FindFirstChild("BodyVelocity") and root:FindFirstChild("BodyGyro") then
            local humanoid = Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
            local VelocityHandler = root:FindFirstChild("BodyVelocity")
            local GyroHandler = root:FindFirstChild("BodyGyro")

            VelocityHandler.MaxForce = v3inf
            GyroHandler.MaxTorque = v3inf
            humanoid.PlatformStand = true
            GyroHandler.CFrame = camera.CoordinateFrame
            VelocityHandler.Velocity = v3none

            local direction = controlModule:GetMoveVector()
            if direction.X > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (CMD_Settings.FlyCMD.FlySpeed * 50))
            end
            if direction.X < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity + camera.CFrame.RightVector * (direction.X * (CMD_Settings.FlyCMD.FlySpeed * 50))
            end
            if direction.Z > 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (CMD_Settings.FlyCMD.FlySpeed * 50))
            end
            if direction.Z < 0 then
                VelocityHandler.Velocity = VelocityHandler.Velocity - camera.CFrame.LookVector * (direction.Z * (CMD_Settings.FlyCMD.FlySpeed * 50))
            end
        end
    end)
end

CommandSystem:AddCmd({
	Title = "Fly",
	Alias = {"Fly"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 1,
	Callback = function(Speed)
	    CMD_Settings.FlyCMD.FlySpeed = Speed
	    CMD_Settings.FlyCMD.FlyOn = true
	    
		sFLY()
		wait(0.5)
        MobileFly()
        wait(0.5)
	end
})

CommandSystem:AddCmd({
	Title = "UnFly / NoFly",
	Alias = {"UnFly", "NoFly"},
	Callback = function()
	    CMD_Settings.FlyCMD.FlyOn = false
		NOFLY()
        wait(0.5)
        UnMobileFly()
	end
})

CommandSystem:AddCmd({
	Title = "AntiAfk / NoAfk / AntiIdle",
	Alias = {"AntiAfk", "NoAfk", "AntiIdle"},
	Callback = function()
		CMD_Settings.AntiAfkCMD.AntiAfkOn = true
		
		if CMD_Settings.AntiAfkCMD.AntiAfkOn then
			task.spawn(function()
				while CMD_Settings.AntiAfkCMD.AntiAfkOn do
					Virtual:SendKeyEvent(true, Enum.KeyCode.W, false, game)
					task.wait(0.1)
					Virtual:SendKeyEvent(false, Enum.KeyCode.W, false, game)
					wait(60)
				end
			end)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Age / CheckAge",
	Alias = {"Age", "CheckAge"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(Player)
		local Age = Player.AccountAge
		NotificationLibrary:SendNotification("Info", Player.DisplayName .. " Age: " .. Age .. " days", 6)
	end
})

function r15(plr)
    if plr.Character then
        return plr.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R15
    end
    return false
end

function getTorso(character)
    return character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("HumanoidRootPart")
end

function getRoot(character)
    return character:FindFirstChild("HumanoidRootPart")
end

CommandSystem:AddCmd({
	Title = "Anchor / Anchored",
	Alias = {"Anchor", "Anchored"},
	Callback = function()
		Player.Character.HumanoidRootPart.Anchored = true
	end
})

CommandSystem:AddCmd({
	Title = "AudioLogger / AudioLog / Alog",
	Alias = {"AudioLogger", "AudioLog", "ALog"},
	Callback = function()
		task.spawn(function()
			local success, err = pcall(function()
				NotificationLibrary:SendNotification("Success", "Loading AudioLogger by Edge", 3)
				wait(1)
				loadstring(game:HttpGet('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'))()
			end)
			if not success then
				NotificationLibrary:SendNotification("Error", "AudioLogger didnt load " .. tostring(err), 3)
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "BoostFps / NoLag",
	Alias = {"BoostFps", "NoLag"},
	Callback = function()
		pcall(function()
			settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
			local lighting = game:GetService("Lighting")
			lighting.Brightness = 1
			lighting.FogEnd = 1000000
			lighting.GlobalShadows = false
			lighting.EnvironmentDiffuseScale = 0
			lighting.EnvironmentSpecularScale = 0
			lighting.ClockTime = 14
			lighting.OutdoorAmbient = Color3.new(0, 0, 0)
			local terrain = workspace:FindFirstChildOfClass("Terrain")
			if terrain then
				terrain.WaterWaveSize = 0
				terrain.WaterWaveSpeed = 0
				terrain.WaterReflectance = 0
				terrain.WaterTransparency = 1
			end
			for _, obj in ipairs(lighting:GetDescendants()) do
				if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") or obj:IsA("BlurEffect") then
					obj.Enabled = false
				end
			end
			for _, obj in ipairs(game:GetDescendants()) do
				if obj:IsA("ParticleEmitter") or obj:IsA("Trail") then
					obj.Enabled = false
				elseif obj:IsA("Texture") or obj:IsA("Decal") then
					obj.Transparency = 1
				end
			end
			for _, part in ipairs(workspace:GetDescendants()) do
				if part:IsA("BasePart") then
					part.CastShadow = false
				end
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "Clip / UnNoclip",
	Alias = {"Clip", "UnNoclip"},
	Callback = function()
		for _, v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
		NotificationLibrary:SendNotification("Success", "Noclip Disabled", 2)
	end
})

CommandSystem:AddCmd({
	Title = "Console",
	Alias = {"Console"},
	Callback = function()
		local success, err = pcall(function()
			StarterGui:SetCore("DevConsoleVisible", true)
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "Console didnt open " .. tostring(err) .. " Just do F9", 3)
		end
	end
})

CommandSystem:AddCmd({
	Title = "CopyPosition / CopyPos / CopyCoordinate / CopyCoord",
	Alias = {"CopyPosition", "CopyPos", "CopyCoordinate", "CopyCoord"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		local Target = TargetPlayer or Player
		local success, err = pcall(function()
			local CurrentPos = tostring(Target.Character.HumanoidRootPart.CFrame)
			setclipboard(CurrentPos)
			NotificationLibrary:SendNotification("Success", Target.DisplayName .. " Position is Copied.", 3)
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "Position didnt Copied " .. tostring(err), 2)
		end
	end
})

CommandSystem:AddCmd({
	Title = "DarkDex / Dex / Explorer",
	Alias = {"DarkDex", "Dex", "Explorer"},
	Callback = function()
		local success, err = pcall(function()
			NotificationLibrary:SendNotification("Success", "Loading Dex by Moon", 3)
			wait(1)
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "Dex Didnt Load " .. tostring(err), 3)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Discord / Support",
	Alias = {"Discord", "Support"},
	Callback = function()
		setclipboard("https://discord.gg/DMB3CDrDa9")
		NotificationLibrary:SendNotification("Success", "Discord Link Copied to Clipboard", 2)
	end
})

CommandSystem:AddCmd({
	Title = "Help / info",
	Alias = {"Help", "Info"},
	Callback = function()
	    loadstring(game:HttpGet("https://pastefy.app/uxFbjTe3/raw"))()
	end
})

CommandSystem:AddCmd({
	Title = "LoopBoostFps / LoopBFps",
	Alias = {"LoopBoostFps", "LoopBFps"},
	Callback = function()
		CMD_Settings.LoopBoostFpsCMD.LoopBoostFpsOn = true
		if CMD_Settings.LoopBoostFpsCMD.LoopBoostFpsOn then
			task.spawn(function()
				while CMD_Settings.LoopBoostFpsCMD.LoopBoostFpsOn do
					pcall(function()
						loadstring(game:HttpGet("https://gist.githubusercontent.com/ScriptsSyndicate/311f8ae6df7dbb281b3eb7bf2e5854cd/raw/e830ae3c73c4ef3ea6793a620bdc4fcda11ee3d5/MainLoader"))()
					end)
					task.wait(30)
				end
			end)
		end
	end
})

CommandSystem:AddCmd({
	Title = "NoAntiAfk / NoAntiIdle / UnAntiAfk",
	Alias = {"NoAntiAfk", "NoAntiIdle", "UnAntiAfk"},
	Callback = function()
		CMD_Settings.AntiAfkCMD.AntiAfkOn = false
	end
})

CommandSystem:AddCmd({
	Title = "Noclip",
	Alias = {"Noclip"},
	Callback = function()
		for _, v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "OldConsole / OConsole",
	Alias = {"OldConsole", "OConsole"},
	Callback = function()
		local success, err = pcall(function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/console.lua"))()
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "Old Console didnt open " .. tostring(err) .. " Just do F9 or Console Nigga", 5)
		end
	end
})

CommandSystem:AddCmd({
	Title = "OldDex / OldExplorer / ODex",
	Alias = {"OldDex", "OldExplorer", "ODex"},
	Callback = function()
		local getobjects = function(a)
			local Objects = {}
			if a then
				local b = InsertService:LoadLocalAsset(a)
				if b then 
					table.insert(Objects, b) 
				end
			end
			return Objects
		end

		local Dex = getobjects("rbxassetid://10055842438")[1]
		Dex.Parent = CoreGui

		function Load(Obj)
			function GiveOwnGlobals(Func, Script)
				local Fenv, RealFenv, FenvMt = {}, {
					script = Script,
					getupvalue = function(a, b)
						return nil 
					end,
					getreg = function()
						return {} 
					end,
					getprops = getprops or function(inst)
						if getproperties then
							local props = getproperties(inst)
							if props[1] and gethiddenproperty then
								local results = {}
								for _, name in pairs(props) do
									local success, res = pcall(gethiddenproperty, inst, name)
									if success then
										results[name] = res
									end
								end
								return results
							end
							return props
						end
						return {}
					end
				}, {}
				FenvMt.__index = function(a, b)
					return RealFenv[b] == nil and getgenv()[b] or RealFenv[b]
				end
				FenvMt.__newindex = function(a, b, c)
					if RealFenv[b] == nil then 
						getgenv()[b] = c 
					else 
						RealFenv[b] = c 
					end
				end
				setmetatable(Fenv, FenvMt)
				pcall(setfenv, Func, Fenv)
				return Func
			end

			function LoadScripts(_, Script)
				if Script:IsA("LocalScript") then
					task.spawn(function()
						GiveOwnGlobals(loadstring(Script.Source, "=" .. Script:GetFullName()), Script)()
					end)
				end
				table.foreach(Script:GetChildren(), LoadScripts)
			end

			LoadScripts(nil, Obj)
		end

		local success, err = pcall(function()
			NotificationLibrary:SendNotification("Success", "Loading OldDex Credit to the Creator", 3)
			wait(0.5)
			Load(Dex)
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "OldDex didnt Load " .. tostring(err), 3)
		end
	end
})

CommandSystem:AddCmd({
	Title = "RemoteSpy / Rspy / SimpleSpy",
	Alias = {"RemoteSpy", "Rspy", "SimpleSpy"},
	Callback = function()
		task.spawn(function()
			local success, err = pcall(function()
				NotificationLibrary:SendNotification("Success", "Loading SimpleSpyV3 Credit to the Creator", 3)
				wait(0.8)
				loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
			end)
			if not success then
				NotificationLibrary:SendNotification("Error", "SimpleSpy didnt load " .. tostring(err), 3)
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnAnchor / UnAnchored",
	Alias = {"UnAnchor", "UnAnchored"},
	Callback = function()
		Player.Character.HumanoidRootPart.Anchored = false
	end
})

CommandSystem:AddCmd({
	Title = "UltraBoostFps / DeleteLag",
	Alias = {"UltraBoostFps", "DeleteLag"},
	Callback = function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/ScriptsSyndicate/311f8ae6df7dbb281b3eb7bf2e5854cd/raw/e830ae3c73c4ef3ea6793a620bdc4fcda11ee3d5/MainLoader"))()
	end
})

CommandSystem:AddCmd({
	Title = "UnLoopBoostFps / NoLoopBoostFps",
	Alias = {"UnLoopBoostFps", "NoLoopBoostFps"},
	Callback = function()
		CMD_Settings.LoopBoostFpsCMD.LoopBoostFpsOn = false
	end
})

CommandSystem:AddCmd({
	Title = "Walkspeed / Ws",
	Alias = {"Walkspeed", "Ws"},
	Args = true,
	Variables = {"Number"},
	Callback = function(speed)
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.WalkSpeed = speed
		end
	end
})

CommandSystem:AddCmd({
	Title = "JumpPower / Jp",
	Alias = {"JumpPower", "Jp"},
	Args = true,
	Variables = {"Number"},
	Callback = function(Jump)
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.JumpHeight = Jump
		end
	end
})

CommandSystem:AddCmd({
	Title = "HipHeight / Hh",
	Alias = {"HipHeight", "Hh"},
	Args = true,
	Variables = {"Number"},
	Callback = function(Height)
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.HipHeight = Height
		end
	end
})

CommandSystem:AddCmd({
	Title = "FpsCap",
	Alias = {"FpsCap"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 1000,
	Callback = function(Fps)
		if setfpscap then
		    setfpscap(Fps)
		else
		    NotificationLibrary:SendNotification("Error", "SetFpsCap dont work on your Executor ", 3)
		end
	end
})

local infiniteJumpConnection

CommandSystem:AddCmd({
	Title = "InfiniteJump / InfJump",
	Alias = {"InfiniteJump", "InfJump"},
	Callback = function()
	    if infiniteJumpConnection then
	        infiniteJumpConnection:Disconnect()
	    end
	    
	    infiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
	        Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	    end)
	end
})

CommandSystem:AddCmd({
	Title = "UnInfiniteJump / UnInfJump",
	Alias = {"UnInfiniteJump", "UnInfJump"},
	Callback = function()
	    if infiniteJumpConnection then
	        infiniteJumpConnection:Disconnect()
	        infiniteJumpConnection = nil
	    end
	end
})
CommandSystem:AddCmd({
	Title = "Audio / PlayAudio",
	Alias = {"Audio", "PlayAudio"},
	Args = true,
	Variables = {"String", "Number"},
	Callback = function(assetId, volume)
		local cleanId = assetId:gsub("rbxassetid://", "")
		local soundVolume = volume or 1
		
		if workspace:FindFirstChild("DarkAdminAudio") then
			workspace.DarkAdminAudio:Destroy()
		end
		
		local sound = Instance.new("Sound")
		sound.Name = "DarkAdminAudio"
		sound.SoundId = "rbxassetid://" .. cleanId
		sound.Volume = soundVolume
		sound.Looped = true
		sound.Parent = workspace
		sound:Play()
		
	end
})

CommandSystem:AddCmd({
	Title = "StopAudio / UnPlayAudio",
	Alias = {"StopAudio", "UnPlayAudio"},
	Callback = function()
		if workspace:FindFirstChild("DarkAdminAudio") then
			workspace.DarkAdminAudio:Destroy()
		else
			NotificationLibrary:SendNotification("Error", "No Audio Playing", 2)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Aimbot / Lockon",
	Alias = {"Aimbot", "LockOn"},
	Args = true,
	Variables = {"Player"},
	Callback = function(targetPlayer)
		if CMD_Settings.AimbotCMD.AimbotConnection then
			CMD_Settings.AimbotCMD.AimbotConnection:Disconnect()
		end
		
		CMD_Settings.AimbotCMD.AimbotEnabled = true
		CMD_Settings.AimbotCMD.AimbotTarget = targetPlayer
		
		CMD_Settings.AimbotCMD.AimbotConnection = RunService.RenderStepped:Connect(function()
			if CMD_Settings.AimbotCMD.AimbotEnabled and CMD_Settings.AimbotCMD.AimbotTarget and CMD_Settings.AimbotCMD.AimbotTarget.Character then
				local targetChar = CMD_Settings.AimbotCMD.AimbotTarget.Character
				local targetHead = targetChar:FindFirstChild("Head")
				
				if targetHead then
					workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, targetHead.Position)
				end
			end
		end)
		
	end
})

CommandSystem:AddCmd({
	Title = "UnAimbot / UnLockOn",
	Alias = {"UnAimbot", "UnLockOn"},
	Callback = function()
		CMD_Settings.AimbotCMD.AimbotEnabled = false
		CMD_Settings.AimbotCMD.AimbotTarget = nil
		
		if CMD_Settings.AimbotCMD.AimbotConnection then
			CMD_Settings.AimbotCMD.AimbotConnection:Disconnect()
			CMD_Settings.AimbotCMD.AimbotConnection = nil
		end
		
	end
})

CommandSystem:AddCmd({
	Title = "ChatLogger / ChatLog",
	Alias = {"ChatLogger", "ChatLog"},
	Callback = function()
	    NotificationLibrary:SendNotification("Success", "Loading ChatLogger By Trellurr", 3)
-- Farewell Infortality.
-- Version: 2.82
-- Instances:
local ChatGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local LogPanel = Instance.new("ScrollingFrame")
local Close = Instance.new("TextButton")
local Mini = Instance.new("TextButton")
local Log = Instance.new("TextButton")
local title = Instance.new("TextLabel")
--Properties:
ChatGui.Name = "ChatGui"
ChatGui.Parent = game.Players.LocalPlayer.PlayerGui
ChatGui.ResetOnSpawn = false

Frame.Parent = ChatGui
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0278396439, 0, 0.565217376, 0)
Frame.Size = UDim2.new(0, 392, 0, 25)
Frame.Active = true
Frame.Draggable = true

LogPanel.Name = "LogPanel"
LogPanel.Parent = Frame
LogPanel.BackgroundColor3 = Color3.new(0, 0, 0)
LogPanel.BorderColor3 = Color3.new(0.223529, 0.223529, 0.223529)
LogPanel.Position = UDim2.new(-0.000221580267, 0, 0.968695641, 0)
LogPanel.Size = UDim2.new(0, 392, 0, 203)
LogPanel.ScrollBarThickness = 5
LogPanel.ScrollingEnabled = true
LogPanel.CanvasSize=UDim2.new(2,0,100,0)

Close.Name = "Close"
Close.Parent = Frame
Close.BackgroundColor3 = Color3.new(1, 1, 1)
Close.BackgroundTransparency = 1
Close.Position = UDim2.new(0.823979557, 0, 0.0399999991, 0)
Close.Size = UDim2.new(0, 69, 0, 24)
Close.Font = Enum.Font.SourceSans
Close.Text = "Close"
Close.TextColor3 = Color3.new(1, 1, 1)
Close.TextSize = 14

Mini.Name = "Mini"
Mini.Parent = Frame
Mini.BackgroundColor3 = Color3.new(1, 1, 1)
Mini.BackgroundTransparency = 1
Mini.Position = UDim2.new(0.647959173, 0, 0, 0)
Mini.Size = UDim2.new(0, 69, 0, 24)
Mini.Font = Enum.Font.SourceSans
Mini.Text = "Minimize"
Mini.TextColor3 = Color3.new(1, 1, 1)
Mini.TextSize = 14

Log.Name = "Log"
Log.Parent = Frame
Log.BackgroundColor3 = Color3.new(1, 1, 1)
Log.BackgroundTransparency = 1
Log.Position = UDim2.new(0.293367326, 0, 0, 0)
Log.Size = UDim2.new(0, 69, 0, 24)
Log.Font = Enum.Font.SourceSans
Log.Text = "Log Chat [ON]"
Log.TextColor3 = Color3.new(1, 1, 1)
Log.TextSize = 14

title.Name = "title"
title.Parent = Frame
title.BackgroundColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Size = UDim2.new(0, 115, 0, 24)
title.Font = Enum.Font.SourceSans
title.Text = "Chat GUI"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
-- Scripts:
local logging = true
local minimized = false
Log.MouseButton1Down:Connect(function()
	logging = not logging
	if logging then Log.Text = "Log Chat [ON]" else Log.Text = "Log Chat [OFF]" end
end)
Mini.MouseButton1Down:Connect(function()
	if minimized then
		LogPanel:TweenSize(UDim2.new(0, 392, 0, 203), "InOut", "Sine", 0.5, false, nil)
	else
		LogPanel:TweenSize(UDim2.new(0, 392, 0, 0), "InOut", "Sine", 0.5, false, nil)
	end
	minimized = not minimized
end)
Close.MouseButton1Down:Connect(function()
	ChatGui:Destroy()
end)

local prevOutputPos = 0
function output(plr, msg)
	if not logging then return end
	local colour = Color3.fromRGB(255,255,255)
	
	if string.sub(msg, 1,1) == ":" or string.sub(msg,1,1) == ";" then colour = Color3.fromRGB(255,0,0) elseif string.sub(msg,1,2) == "/w" or string.sub(msg,1,7) == "/whisper" or string.sub(msg,1,5) == "/team" or string.sub(msg,1,2) == "/t" then colour = Color3.fromRGB(0,0,255) else colour = Color3.fromRGB(255,255,255) end
	
 	local o = Instance.new("TextLabel",LogPanel)
 	o.Text = plr.Name .. ": " .. msg
 	o.Size = UDim2.new(0.5,0,.006,0)
 	o.Position = UDim2.new(0,0,.007 + prevOutputPos ,0)
 	o.Font = Enum.Font.SourceSansSemibold
 	o.TextColor3 = colour
 	o.TextStrokeTransparency = 0
 	o.BackgroundTransparency = 0
	o.BackgroundColor3 = Color3.new(0,0,0)
 	o.BorderSizePixel = 0
	o.BorderColor3 = Color3.new(0,0,0)
 	o.FontSize = "Size14"
	o.TextXAlignment = Enum.TextXAlignment.Left
 	o.ClipsDescendants = true
	prevOutputPos = prevOutputPos + 0.007
	end

for i,v in pairs(game.Players:GetChildren()) do
	v.Chatted:Connect(function(msg)
		output(v, msg)
	end)
end

game.Players.ChildAdded:Connect(function(plr)
	if plr:IsA("Player") then
		plr.Chatted:Connect(function(msg)
			output(plr, msg)
		end)
	end
end)
	end
})

CommandSystem:AddCmd({
	Title = "AntiKick",
	Alias = {"AntiKick"},
	Callback = function()
		local oldNamecall
		oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			if method == "Kick" then
				return
			end
			return oldNamecall(self, ...)
		end)
		
		NotificationLibrary:SendNotification("Success", "AntiKick Enable Cliently", 2)
	end
})

CommandSystem:AddCmd({
	Title = "AntiBan",
	Alias = {"AntiBan"},
	Callback = function()
		local oldNamecall
		oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
			local method = getnamecallmethod()
			local args = {...}
			
			if method == "Kick" then
				return
			end
			
			if method == "FireServer" or method == "InvokeServer" then
				if tostring(self):lower():find("ban") or tostring(self):lower():find("kick") then
					return
				end
			end
			
			return oldNamecall(self, ...)
		end)
		
		NotificationLibrary:SendNotification("Success", "AntiBan Enable Cliently", 2)
	end
})

CommandSystem:AddCmd({
	Title = "BuildingTools / BTools / Btools",
	Alias = {"Btools", "BuildingTools", "Btools"},
	Callback = function()
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/refs/heads/main/f3x.lua"))()
	end
})

CommandSystem:AddCmd({
    Title = "Bang / Rape",
    Alias = {"Bang", "Rape"},
    Args = true,
    Variables = {"Player", "Number"},
    Callback = function(TargetPlayer, Speed)
        if CMD_Settings.BangCMD.BangOn then
            if CMD_Settings.BangCMD.BangLoop then CMD_Settings.BangCMD.BangLoop:Disconnect() end
            if CMD_Settings.BangCMD.BangDied then CMD_Settings.BangCMD.BangDied:Disconnect() end
            if CMD_Settings.BangCMD.BangAnim then
                CMD_Settings.BangCMD.BangAnim:Stop()
                CMD_Settings.BangCMD.BangAnim:Destroy()
            end
            CMD_Settings.BangCMD.BangOn = false
        end
        
        task.wait(0.1)
        
        local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
        if not humanoid then
            NotificationLibrary:SendNotification("Error", "Humanoid not found", 2)
            return
        end
        
        CMD_Settings.BangCMD.BangOn = true
        
        local bangAnimInstance = Instance.new("Animation")
        bangAnimInstance.AnimationId = not r15(Player) and "rbxassetid://148840371" or "rbxassetid://5918726674"
        
        CMD_Settings.BangCMD.BangAnim = humanoid:LoadAnimation(bangAnimInstance)
        CMD_Settings.BangCMD.BangAnim:Play(0.1, 1, 1)
        CMD_Settings.BangCMD.BangAnim:AdjustSpeed(Speed or 3)
        
        CMD_Settings.BangCMD.BangDied = humanoid.Died:Connect(function()
            if CMD_Settings.BangCMD.BangAnim then
                CMD_Settings.BangCMD.BangAnim:Stop()
            end
            if bangAnimInstance then
                bangAnimInstance:Destroy()
            end
            if CMD_Settings.BangCMD.BangDied then
                CMD_Settings.BangCMD.BangDied:Disconnect()
            end
            if CMD_Settings.BangCMD.BangLoop then
                CMD_Settings.BangCMD.BangLoop:Disconnect()
            end
            CMD_Settings.BangCMD.BangOn = false
        end)
        
        local bangOffset = CFrame.new(0, 0, 1.1)
        CMD_Settings.BangCMD.BangLoop = RunService.Stepped:Connect(function()
            pcall(function()
                if TargetPlayer and TargetPlayer.Character then
                    local otherRoot = getTorso(TargetPlayer.Character)
                    local myRoot = getRoot(Player.Character)
                    if otherRoot and myRoot then
                        myRoot.CFrame = otherRoot.CFrame * bangOffset
                    end
                else
                    if CMD_Settings.BangCMD.BangLoop then
                        CMD_Settings.BangCMD.BangLoop:Disconnect()
                    end
                end
            end)
        end)
        
    end
})

CommandSystem:AddCmd({
    Title = "UnBang / UnRape",
    Alias = {"UnBang", "UnRape"},
    Callback = function()
        if CMD_Settings.BangCMD.BangLoop then
            CMD_Settings.BangCMD.BangLoop:Disconnect()
            CMD_Settings.BangCMD.BangLoop = nil
        end
        if CMD_Settings.BangCMD.BangDied then
            CMD_Settings.BangCMD.BangDied:Disconnect()
            CMD_Settings.BangCMD.BangDied = nil
        end
        if CMD_Settings.BangCMD.BangAnim then
            CMD_Settings.BangCMD.BangAnim:Stop()
            CMD_Settings.BangCMD.BangAnim:Destroy()
            CMD_Settings.BangCMD.BangAnim = nil
        end
        CMD_Settings.BangCMD.BangOn = false
    end
})

CommandSystem:AddCmd({
	Title = "Exit / Destroy / Remove",
	Alias = {"Exit", "Destroy", "Remove"},
	Callback = function()
		task.wait(0.5)
		
		if G2L["DarkAdmin_1"] then
			G2L["DarkAdmin_1"]:Destroy()
		end
		
		NotificationLibrary:SendNotification("Success", "DarkAdmin is gone", 1.5)
	end
})

CommandSystem:AddCmd({
	Title = "Disconnect / Leave",
	Alias = {"Disconnect", "Leave"},
	Callback = function()
	    Player:Kick("you got Disconnected by Commands")
	end
})

CommandSystem:AddCmd({
	Title = "Prefix / SetPrefix / ChangePrefix",
	Alias = {"Prefix", "SetPrefix", "ChangePrefix"},
	Args = true,
	Variables = {"String"},
	SelfCallback = ":",
	Callback = function(newPrefix)
		if newPrefix and newPrefix ~= "" then
			ChatPrefix = newPrefix
			NotificationLibrary:SendNotification("Success", "Prefix changed to " .. newPrefix, 3)
		else
			NotificationLibrary:SendNotification("Error", "Invalid prefix", 2)
		end
	end
})

CommandSystem:AddCmd({
	Title = "HideDA / HideUi",
	Alias = {"HideDA", "HideUi"},
	Callback = function()
		Settings.isCommandFrameOpen = false
		Settings.hideTimerActive = false
		
		Settings.savedPosition = G2L["Frame_c"].Position
		
		G2L["UIStroke_CommandFrame"].Thickness = 0
		G2L["UIStroke_CommandFrame"].Transparency = 1
		
		local fadeOutText = TweenService:Create(
			G2L["TextBox_7"],
			TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = 1}
		)
		fadeOutText:Play()
		
		TweenService:Create(
			G2L["AutocompleteFrame"],
			TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
			{Size = UDim2.new(0, 200, 0, 0)}
		):Play()
		
		local circleX = G2L["Frame_c"].Position.X.Offset
		local circleY = G2L["Frame_c"].Position.Y.Offset
		
		local slideTween = TweenService:Create(
			G2L["CommandFrame_2"],
			TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut),
			{
				Position = UDim2.new(0, circleX + 20, 0, circleY),
				Size = UDim2.new(0, 0, 0, 40)
			}
		)
		
		slideTween:Play()
		slideTween.Completed:Wait()
		
		G2L["TextBox_7"].Text = ""
		G2L["TextBox_7"].PlaceholderText = ""
		G2L["TextBox_7"].TextTransparency = 0
		
		task.wait(0.5)
		
		local hideCircleTween = TweenService:Create(
			G2L["Frame_c"],
			TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.In),
			{Position = UDim2.new(0, circleX, 0, -150)}
		)
		
		hideCircleTween:Play()
		hideCircleTween.Completed:Wait()
		
		G2L["Frame_c"].Visible = false
		G2L["CommandFrame_2"].Visible = false
		NotificationLibrary:SendNotification("Warning", "Use Server Chat :UnHideDA / :UnHideUi, to Open DarkAdmin.", 5)
	end
})

CommandSystem:AddCmd({
	Title = "UnHideDA / UnHideUi",
	Alias = {"UnHideDA", "UnHideUi"},
	Callback = function()
		G2L["Frame_c"].Visible = true
		G2L["CommandFrame_2"].Visible = true
		
		local targetPos = Settings.savedPosition or UDim2.new(0, 250, 0, -26)
		
		local dropCircleTween = TweenService:Create(
			G2L["Frame_c"],
			TweenInfo.new(0.8, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
			{Position = targetPos}
		)
		
		dropCircleTween:Play()
		dropCircleTween.Completed:Wait()
		
		local circleX = G2L["Frame_c"].Position.X.Offset
		local circleY = G2L["Frame_c"].Position.Y.Offset
		
		G2L["CommandFrame_2"].Position = UDim2.new(0, circleX + 20, 0, circleY)
		G2L["CommandFrame_2"].Size = UDim2.new(0, 0, 0, 40)
		
		G2L["TextBox_7"].PlaceholderText = "Welcome Back!"
		G2L["TextBox_7"].PlaceholderColor3 = Color3.fromRGB(156, 156, 156)
		G2L["TextBox_7"].TextTransparency = 1
		
		local slideCommandTween = TweenService:Create(
			G2L["CommandFrame_2"],
			TweenInfo.new(0.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
			{Size = UDim2.new(0, 206, 0, 40)}
		)
		
		slideCommandTween:Play()
		slideCommandTween.Completed:Wait()
		
		local fadeInText = TweenService:Create(
			G2L["TextBox_7"],
			TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{TextTransparency = 0}
		)
		fadeInText:Play()
		fadeInText.Completed:Wait()
		
		task.wait(1.5)
		
		local fadePlaceholder = TweenService:Create(
			G2L["TextBox_7"],
			TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
			{PlaceholderColor3 = Color3.fromRGB(50, 50, 50)}
		)
		
		fadePlaceholder:Play()
		fadePlaceholder.Completed:Wait()
		
		G2L["TextBox_7"].PlaceholderText = "Command Bar :"
		
		local fadeInPlaceholder = TweenService:Create(
			G2L["TextBox_7"],
			TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
			{PlaceholderColor3 = Color3.fromRGB(156, 156, 156)}
		)
		
		fadeInPlaceholder:Play()
		fadeInPlaceholder.Completed:Wait()
		
		Settings.isCommandFrameOpen = true
		Settings.isTyping = false
		Settings.lastTypingTime = tick()
		startHideTimer()
	end
})

CommandSystem:AddCmd({
	Title = "StareAt / Stare / LookAt",
	Alias = {"Stare", "StareAt", "LookAt"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "random",
	Callback = function(TargetPlayer)
		if CMD_Settings.StareCMD.StareLoop then
			CMD_Settings.StareCMD.StareLoop:Disconnect()
			CMD_Settings.StareCMD.StareLoop = nil
		end
		
		
		CMD_Settings.StareCMD.StareTarget = TargetPlayer
		
		function stareFunc()
			if Player.Character and Player.Character.PrimaryPart and 
			   CMD_Settings.StareCMD.StareTarget and 
			   CMD_Settings.StareCMD.StareTarget.Character and 
			   CMD_Settings.StareCMD.StareTarget.Character:FindFirstChild("HumanoidRootPart") then
				
				local chrPos = Player.Character.PrimaryPart.Position
				local tPos = CMD_Settings.StareCMD.StareTarget.Character.HumanoidRootPart.Position
				local modTPos = Vector3.new(tPos.X, chrPos.Y, tPos.Z)
				local newCF = CFrame.new(chrPos, modTPos)
				Player.Character:SetPrimaryPartCFrame(newCF)
			else
				if CMD_Settings.StareCMD.StareLoop then
					CMD_Settings.StareCMD.StareLoop:Disconnect()
					CMD_Settings.StareCMD.StareLoop = nil
				end
			end
		end
		
		CMD_Settings.StareCMD.StareLoop = RunService.RenderStepped:Connect(stareFunc)
	end
})

CommandSystem:AddCmd({
	Title = "UnStareAt / UnStare / UnLookAt",
	Alias = {"UnStareAt", "UnStare", "UnLookAt"},
	Callback = function()
		if CMD_Settings.StareCMD.StareLoop then
			CMD_Settings.StareCMD.StareLoop:Disconnect()
			CMD_Settings.StareCMD.StareLoop = nil
			CMD_Settings.StareCMD.StareTarget = nil
		else
			NotificationLibrary:SendNotification("Error", "Not staring Nigga", 2)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Jerk / JerkOff / Jork / JerkTool",
	Alias = {"Jerk", "JerkOff", "Jork", "JerkTool"},
	Callback = function()
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		local backpack = Player:FindFirstChildWhichIsA("Backpack")
		
		if CMD_Settings.JerkCMD.JerkTool then
			CMD_Settings.JerkCMD.JerkTool:Destroy()
		end
		
		local tool = Instance.new("Tool")
		tool.Name = "Jerk Off"
		tool.ToolTip = "in the stripped club. straight up \"jorking it\" . and by \"it\" , haha, well. let's justr say. My peanits. [InfiniteYield Source]"
		tool.RequiresHandle = false
		tool.Parent = backpack
		
		CMD_Settings.JerkCMD.JerkTool = tool
		
		function stopTomfoolery()
			CMD_Settings.JerkCMD.Jorking = false
			if CMD_Settings.JerkCMD.JerkTrack then
				CMD_Settings.JerkCMD.JerkTrack:Stop()
				CMD_Settings.JerkCMD.JerkTrack = nil
			end
			if CMD_Settings.JerkCMD.JerkLoop then
				CMD_Settings.JerkCMD.JerkLoop = false
			end
		end
		
		tool.Equipped:Connect(function()
			CMD_Settings.JerkCMD.Jorking = true
			
			if CMD_Settings.JerkCMD.JerkLoop then return end
			CMD_Settings.JerkCMD.JerkLoop = true
			
			task.spawn(function()
				while CMD_Settings.JerkCMD.JerkLoop do
					task.wait()
					
					if not CMD_Settings.JerkCMD.Jorking then
						continue
					end
					
					local isR15 = r15(Player)
					if not CMD_Settings.JerkCMD.JerkTrack then
						local anim = Instance.new("Animation")
						anim.AnimationId = not isR15 and "rbxassetid://72042024" or "rbxassetid://698251653"
						CMD_Settings.JerkCMD.JerkTrack = humanoid:LoadAnimation(anim)
					end
					
					CMD_Settings.JerkCMD.JerkTrack:Play()
					CMD_Settings.JerkCMD.JerkTrack:AdjustSpeed(isR15 and 0.7 or 0.65)
					CMD_Settings.JerkCMD.JerkTrack.TimePosition = 0.6
					task.wait(0.1)
					
					while CMD_Settings.JerkCMD.JerkTrack and CMD_Settings.JerkCMD.JerkTrack.TimePosition < (not isR15 and 0.65 or 0.7) do
						task.wait(0.1)
					end
					
					if CMD_Settings.JerkCMD.JerkTrack then
						CMD_Settings.JerkCMD.JerkTrack:Stop()
						CMD_Settings.JerkCMD.JerkTrack = nil
					end
				end
			end)
		end)
		
		tool.Unequipped:Connect(stopTomfoolery)
		humanoid.Died:Connect(stopTomfoolery)
		
	end
})

CommandSystem:AddCmd({
	Title = "Freeze / Frozen",
	Alias = {"Freeze", "Frozen"},
	Callback = function()
		
		CMD_Settings.FreezeCMD.FrozenParts = {}
		CMD_Settings.FreezeCMD.OriginalCFrames = {}
		
		for _, part in pairs(Player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				table.insert(CMD_Settings.FreezeCMD.FrozenParts, part)
				CMD_Settings.FreezeCMD.OriginalCFrames[part] = part.CFrame
				part.Anchored = true
			end
		end
		
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid.WalkSpeed = 0
			humanoid.JumpPower = 0
			humanoid.JumpHeight = 0
			humanoid.AutoRotate = false
		end
		
	end
})

CommandSystem:AddCmd({
	Title = "UnFreeze / NoFreeze",
	Alias = {"UnFreeze", "Thaw", "NoFreeze"},
	Callback = function()
		
		for _, part in pairs(CMD_Settings.FreezeCMD.FrozenParts) do
			if part and part.Parent then
				part.Anchored = false
			end
		end
		
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid.WalkSpeed = 16
			humanoid.JumpPower = 50
			humanoid.JumpHeight = 7.2
			humanoid.AutoRotate = true
		end
		
		CMD_Settings.FreezeCMD.FrozenParts = {}
		CMD_Settings.FreezeCMD.OriginalCFrames = {}
		
	end
})

CommandSystem:AddCmd({
	Title = "Brightness",
	Alias = {"Brightness"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 2,
	Callback = function(brightness)
		game:GetService("Lighting").Brightness = brightness
	end
})

CommandSystem:AddCmd({
	Title = "BunnyHop / BHop",
	Alias = {"BunnyHop", "BHop"},
	Callback = function()
		CMD_Settings.BunnyHopCMD.BunnyHopOn = true
		
		CMD_Settings.BunnyHopCMD.BunnyHopLoop = RunService.Heartbeat:Connect(function()
			if CMD_Settings.BunnyHopCMD.BunnyHopOn and Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
				Player.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnBunnyHop / UnBHop",
	Alias = {"UnBunnyHop", "UnBHop"},
	Callback = function()
		if CMD_Settings.BunnyHopCMD.BunnyHopLoop then
			CMD_Settings.BunnyHopCMD.BunnyHopLoop:Disconnect()
			CMD_Settings.BunnyHopCMD.BunnyHopLoop = nil
		end
		CMD_Settings.BunnyHopCMD.BunnyHopOn = false
	end
})

CommandSystem:AddCmd({
	Title = "Clone",
	Alias = {"Clone"},
	Args = true,
	Variables = {"Player", "Number"},
	SelfCallback = {"me", 1},
	Callback = function(TargetPlayer, Count)
		if TargetPlayer and TargetPlayer.Character then
			for i = 1, Count do
				local clone = TargetPlayer.Character:Clone()
				clone.Parent = workspace
				table.insert(CMD_Settings.CloneCMD.Clones, clone)
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "Chat",
	Alias = {"Chat"},
	Args = true,
	Variables = {"Text"},
	SelfCallback = "Hello!",
	Callback = function(message)
		local success = pcall(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(message, "All")
		end)
		
		if not success then
			pcall(function()
				game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(message)
			end)
		end
	end
})

CommandSystem:AddCmd({
	Title = "ClickTeleport / ClickTp / CTp",
	Alias = {"ClickTeleport", "ClickTp", "CTp"},
	Callback = function()
		CMD_Settings.ClickTpCMD.ClickTpOn = true
		
		CMD_Settings.ClickTpCMD.ClickTpConnection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
			if gameProcessed then return end
			if CMD_Settings.ClickTpCMD.ClickTpOn and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					local mouse = Player:GetMouse()
					if mouse.Target then
						Player.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
					end
				end
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnClickTeleport / UnClickTp / UnCTp",
	Alias = {"UnClickTeleport", "UnClickTp", "UnCTp"},
	Callback = function()
		if CMD_Settings.ClickTpCMD.ClickTpConnection then
			CMD_Settings.ClickTpCMD.ClickTpConnection:Disconnect()
			CMD_Settings.ClickTpCMD.ClickTpConnection = nil
		end
		CMD_Settings.ClickTpCMD.ClickTpOn = false
	end
})

CommandSystem:AddCmd({
	Title = "CopyGameId / GameId",
	Alias = {"CopyGameId", "GameId"},
	Callback = function()
		setclipboard(tostring(game.GameId))
	end
})

CommandSystem:AddCmd({
	Title = "CopyPlaceId / PlaceId",
	Alias = {"CopyPlaceId", "PlaceId"},
	Callback = function()
		setclipboard(tostring(game.PlaceId))
	end
})

CommandSystem:AddCmd({
	Title = "Day",
	Alias = {"Day"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 14,
	Callback = function(time)
		game:GetService("Lighting").ClockTime = time
	end
})

CommandSystem:AddCmd({
	Title = "DupeHand / Dupe",
	Alias = {"DupeHand", "Dupe"},
	Callback = function()
		local tool = Player.Character:FindFirstChildOfClass("Tool")
		if tool then
			local clone = tool:Clone()
			clone.Parent = Player.Backpack
		end
	end
})

CommandSystem:AddCmd({
	Title = "Esp",
	Alias = {"Esp"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "all",
	Callback = function(TargetPlayer)
		if not TargetPlayer or not TargetPlayer.Character then return end
		
		local char = TargetPlayer.Character
		local rootPart = char:FindFirstChild("HumanoidRootPart")
		if not rootPart then return end
		
		for _, part in pairs(char:GetDescendants()) do
			if part:IsA("BasePart") then
				local highlight = Instance.new("Highlight")
				highlight.Name = "DarkAdminESP"
				highlight.FillColor = Color3.fromRGB(0, 255, 0)
				highlight.OutlineColor = Color3.fromRGB(0, 255, 0)
				highlight.FillTransparency = 0.5
				highlight.OutlineTransparency = 0
				highlight.Parent = part
			end
		end
		
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "DarkAdminESP"
		billboard.AlwaysOnTop = true
		billboard.Size = UDim2.new(0, 200, 0, 50)
		billboard.StudsOffset = Vector3.new(0, 3, 0)
		billboard.Parent = rootPart
		
		local nameLabel = Instance.new("TextLabel")
		nameLabel.Size = UDim2.new(1, 0, 0.5, 0)
		nameLabel.Position = UDim2.new(0, 0, 0, 0)
		nameLabel.BackgroundTransparency = 1
		nameLabel.Text = TargetPlayer.DisplayName
		nameLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		nameLabel.Font = Enum.Font.Code
		nameLabel.TextSize = 14
		nameLabel.Parent = billboard
		
		local distanceLabel = Instance.new("TextLabel")
		distanceLabel.Size = UDim2.new(1, 0, 0.5, 0)
		distanceLabel.Position = UDim2.new(0, 0, 0.5, 0)
		distanceLabel.BackgroundTransparency = 1
		distanceLabel.TextColor3 = Color3.fromRGB(0, 150, 255)
		distanceLabel.Font = Enum.Font.Code
		distanceLabel.TextSize = 14
		distanceLabel.Parent = billboard
		
		table.insert(CMD_Settings.EspCMD.EspPlayers, TargetPlayer)
		
		local connection = RunService.RenderStepped:Connect(function()
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local distance = (Player.Character.HumanoidRootPart.Position - TargetPlayer.Character.HumanoidRootPart.Position).Magnitude
				distanceLabel.Text = string.format("%.1f studs", distance)
			end
		end)
		
		table.insert(CMD_Settings.EspCMD.EspConnections, connection)
	end
})

CommandSystem:AddCmd({
	Title = "UnEsp",
	Alias = {"UnEsp"},
	Callback = function()
		for _, player in pairs(CMD_Settings.EspCMD.EspPlayers) do
			if player and player.Character then
				for _, obj in pairs(player.Character:GetDescendants()) do
					if obj.Name == "DarkAdminESP" then
						obj:Destroy()
					end
				end
			end
		end
		
		for _, connection in pairs(CMD_Settings.EspCMD.EspConnections) do
			connection:Disconnect()
		end
		
		CMD_Settings.EspCMD.EspPlayers = {}
		CMD_Settings.EspCMD.EspConnections = {}
	end
})
CommandSystem:AddCmd({
	Title = "Execute",
	Alias = {"Execute"},
	Args = true,
	Variables = {"Text"},
	Callback = function(code)
		loadstring(code)()
	end
})

CommandSystem:AddCmd({
	Title = "Fling",
	Alias = {"Fling"},
	Callback = function()
		if CMD_Settings.FlingCMD.FlingOn then return end
		
		CMD_Settings.FlingCMD.FlingOn = false
		
		for _, child in pairs(Player.Character:GetDescendants()) do
			if child:IsA("BasePart") then
				child.CustomPhysicalProperties = PhysicalProperties.new(100, 0.3, 0.5)
			end
		end
		
		for _, v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		
		wait(.1)
		
		local bambam = Instance.new("BodyAngularVelocity")
		bambam.Name = "DarkAdminFling"
		bambam.Parent = getRoot(Player.Character)
		bambam.AngularVelocity = Vector3.new(0, 99999, 0)
		bambam.MaxTorque = Vector3.new(0, math.huge, 0)
		bambam.P = math.huge
		
		CMD_Settings.FlingCMD.BV = bambam
		
		for i, v in next, Player.Character:GetChildren() do
			if v:IsA("BasePart") then
				v.CanCollide = false
				v.Massless = true
				v.Velocity = Vector3.new(0, 0, 0)
			end
		end
		
		CMD_Settings.FlingCMD.FlingOn = true
		
		local function flingDiedF()
			CommandSystem:ExecuteCommand("unfling")
		end
		
		CMD_Settings.FlingCMD.FlingDied = Player.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
		
		CMD_Settings.FlingCMD.FlingLoop = task.spawn(function()
			while CMD_Settings.FlingCMD.FlingOn do
				bambam.AngularVelocity = Vector3.new(0, 99999, 0)
				wait(.2)
				bambam.AngularVelocity = Vector3.new(0, 0, 0)
				wait(.1)
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnFling",
	Alias = {"UnFling"},
	Callback = function()
		for _, v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
		
		if CMD_Settings.FlingCMD.FlingDied then
			CMD_Settings.FlingCMD.FlingDied:Disconnect()
		end
		
		CMD_Settings.FlingCMD.FlingOn = false
		
		wait(.1)
		
		if not Player.Character or not getRoot(Player.Character) then return end
		
		for i, v in pairs(getRoot(Player.Character):GetChildren()) do
			if v.ClassName == 'BodyAngularVelocity' then
				v:Destroy()
			end
		end
		
		for _, child in pairs(Player.Character:GetDescendants()) do
			if child.ClassName == "Part" or child.ClassName == "MeshPart" then
				child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "AntiFling",
	Alias = {"AntiFling"},
	Callback = function()
		CMD_Settings.AntiFlingCMD.AntiFlingOn = true
		
		CMD_Settings.AntiFlingCMD.AntiFlingLoop = RunService.Stepped:Connect(function()
			if CMD_Settings.AntiFlingCMD.AntiFlingOn then
				for _, v in pairs(Player.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnAntiFling",
	Alias = {"UnAntiFling"},
	Callback = function()
		CMD_Settings.AntiFlingCMD.AntiFlingOn = false
		
		if CMD_Settings.AntiFlingCMD.AntiFlingLoop then
			CMD_Settings.AntiFlingCMD.AntiFlingLoop:Disconnect()
			CMD_Settings.AntiFlingCMD.AntiFlingLoop = nil
		end
		
		for _, v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "WalkFling / WFling",
	Alias = {"WalkFling", "WFling"},
	Callback = function()
		CommandSystem:ExecuteCommand("unwalkfling")
		
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			CMD_Settings.WalkFlingCMD.WalkFlingDied = humanoid.Died:Connect(function()
				CommandSystem:ExecuteCommand("unwalkfling")
			end)
		end
		
		for _, v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
		
		CMD_Settings.WalkFlingCMD.WalkFlingOn = true
		
		task.spawn(function()
			repeat RunService.Heartbeat:Wait()
				local character = Player.Character
				local root = getRoot(character)
				local vel, movel = nil, 0.1
				
				while not (character and character.Parent and root and root.Parent) do
					RunService.Heartbeat:Wait()
					character = Player.Character
					root = getRoot(character)
				end
				
				vel = root.Velocity
				root.Velocity = vel * 10000 + Vector3.new(0, 10000, 0)
				
				RunService.RenderStepped:Wait()
				if character and character.Parent and root and root.Parent then
					root.Velocity = vel
				end
				
				RunService.Stepped:Wait()
				if character and character.Parent and root and root.Parent then
					root.Velocity = vel + Vector3.new(0, movel, 0)
					movel = movel * -1
				end
			until CMD_Settings.WalkFlingCMD.WalkFlingOn == false
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnWalkFling / UnWFling",
	Alias = {"UnWalkFling", "UnWFling"},
	Callback = function()
		CMD_Settings.WalkFlingCMD.WalkFlingOn = false
		
		if CMD_Settings.WalkFlingCMD.WalkFlingDied then
			CMD_Settings.WalkFlingCMD.WalkFlingDied:Disconnect()
			CMD_Settings.WalkFlingCMD.WalkFlingDied = nil
		end
		
		for _, v in pairs(Player.Character:GetDescendants()) do
			if v:IsA("BasePart") then
				v.CanCollide = true
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "Float / Swim",
	Alias = {"Float", "Swim"},
	Callback = function()
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, true)
			humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnFloat / UnSwim",
	Alias = {"UnFloat", "UnSwim"},
	Callback = function()
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
			humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Fov",
	Alias = {"Fov"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 70,
	Callback = function(fov)
		workspace.CurrentCamera.FieldOfView = fov
	end
})

CommandSystem:AddCmd({
	Title = "FirstPerson / FirstP",
	Alias = {"FirstPerson", "FirstP"},
	Callback = function()
		Player.CameraMode = Enum.CameraMode.LockFirstPerson
	end
})

CommandSystem:AddCmd({
	Title = "FixCamera / FixCam",
	Alias = {"FixCamera", "FixCam"},
	Callback = function()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildWhichIsA("Humanoid")
		workspace.CurrentCamera.FieldOfView = 70
		Player.CameraMode = Enum.CameraMode.Classic
		Player.CameraMaxZoomDistance = 400
		Player.CameraMinZoomDistance = 0.5
	end
})

CommandSystem:AddCmd({
	Title = "Fullbrightness / FullBright / FBright",
	Alias = {"Fullbrightness", "FullBright", "FBright"},
	Callback = function()
		local lighting = game:GetService("Lighting")
		lighting.Brightness = 2
		lighting.ClockTime = 14
		lighting.FogEnd = 100000
		lighting.GlobalShadows = false
		lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
	end
})

CommandSystem:AddCmd({
	Title = "FreeCamera / FreeCam",
	Alias = {"FreeCamera", "FreeCam"},
	Callback = function()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.CameraSubject = nil
	end
})

CommandSystem:AddCmd({
	Title = "UnFreeCamera / UnFreeCam",
	Alias = {"UnFreeCamera", "UnFreeCam"},
	Callback = function()
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildWhichIsA("Humanoid")
	end
})

CommandSystem:AddCmd({
	Title = "Friend",
	Alias = {"Friend"},
	Args = true,
	Variables = {"Player"},
	Callback = function(TargetPlayer)
		Player:RequestFriendship(TargetPlayer)
	end
})

CommandSystem:AddCmd({
	Title = "UnFriend",
	Alias = {"UnFriend"},
	Args = true,
	Variables = {"Player"},
	Callback = function(TargetPlayer)
		Player:RevokeFriendship(TargetPlayer)
	end
})

CommandSystem:AddCmd({
	Title = "GodMode",
	Alias = {"GodMode"},
	Callback = function()
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		if humanoid then
			CMD_Settings.GodModeCMD.OriginalHumanoid = humanoid
			humanoid.Name = "1"
			local clone = humanoid:Clone()
			clone.Parent = Player.Character
			clone.Name = "Humanoid"
			wait()
			humanoid:Destroy()
			workspace.CurrentCamera.CameraSubject = Player.Character
			Player.Character.Animate.Disabled = true
			wait()
			Player.Character.Animate.Disabled = false
			CMD_Settings.GodModeCMD.GodModeOn = true
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnGodMode",
	Alias = {"UnGodMode"},
	Callback = function()
		CMD_Settings.GodModeCMD.GodModeOn = false
		Player.Character:BreakJoints()
	end
})

CommandSystem:AddCmd({
	Title = "Gear",
	Alias = {"Gear"},
	Args = true,
	Variables = {"String"},
	Callback = function(assetId)
		local cleanId = assetId:gsub("rbxassetid://", "")
		local success, result = pcall(function()
			return game:GetObjects("rbxassetid://" .. cleanId)[1]
		end)
		if success and result then
			result.Parent = Player.Backpack
		end
	end
})

CommandSystem:AddCmd({
	Title = "HeadLess",
	Alias = {"HeadLess"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Head") then
			TargetPlayer.Character.Head.Transparency = 1
			for _, v in pairs(TargetPlayer.Character.Head:GetChildren()) do
				if v:IsA("Decal") or v:IsA("Texture") then
					v.Transparency = 1
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "Hide",
	Alias = {"Hide"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "all",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character then
			for _, v in pairs(TargetPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") or v:IsA("Decal") or v:IsA("Texture") then
					v.Transparency = 1
				end
			end
			table.insert(CMD_Settings.HideCMD.HiddenPlayers, TargetPlayer)
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnHide",
	Alias = {"UnHide"},
	Callback = function()
		for _, player in pairs(CMD_Settings.HideCMD.HiddenPlayers) do
			if player and player.Character then
				for _, v in pairs(player.Character:GetDescendants()) do
					if v:IsA("BasePart") then
						v.Transparency = 0
					elseif v:IsA("Decal") or v:IsA("Texture") then
						v.Transparency = 0
					end
				end
			end
		end
		CMD_Settings.HideCMD.HiddenPlayers = {}
	end
})

CommandSystem:AddCmd({
	Title = "HideUserName / HideName",
	Alias = {"HideUserName", "HideName"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "all",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character then
			for _, v in pairs(TargetPlayer.Character:GetDescendants()) do
				if v:IsA("BillboardGui") or v.Name == "NameTag" then
					v.Enabled = false
				end
			end
			if TargetPlayer.Character:FindFirstChild("Head") then
				for _, gui in pairs(TargetPlayer.Character.Head:GetChildren()) do
					if gui:IsA("BillboardGui") then
						gui.Enabled = false
					end
				end
			end
			table.insert(CMD_Settings.HideNameCMD.HiddenNames, TargetPlayer)
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnHideUserName / UnHideName",
	Alias = {"UnHideUserName", "UnHideName"},
	Callback = function()
		for _, player in pairs(CMD_Settings.HideNameCMD.HiddenNames) do
			if player and player.Character then
				for _, v in pairs(player.Character:GetDescendants()) do
					if v:IsA("BillboardGui") or v.Name == "NameTag" then
						v.Enabled = true
					end
				end
				if player.Character:FindFirstChild("Head") then
					for _, gui in pairs(player.Character.Head:GetChildren()) do
						if gui:IsA("BillboardGui") then
							gui.Enabled = true
						end
					end
				end
			end
		end
		CMD_Settings.HideNameCMD.HiddenNames = {}
	end
})

CommandSystem:AddCmd({
	Title = "Hitbox",
	Alias = {"Hitbox"},
	Args = true,
	Variables = {"Player", "Number"},
	SelfCallback = {"all", 5},
	Callback = function(TargetPlayer, Size)
		if TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			local hrp = TargetPlayer.Character.HumanoidRootPart
			
			if hrp:FindFirstChild("DarkAdminHitbox") then
				hrp.DarkAdminHitbox:Destroy()
			end
			
			local hitbox = Instance.new("Part")
			hitbox.Name = "DarkAdminHitbox"
			hitbox.Size = Vector3.new(Size, Size, Size)
			hitbox.Shape = Enum.PartType.Ball
			hitbox.Material = Enum.Material.Neon
			hitbox.Color = Color3.fromRGB(255, 255, 255)
			hitbox.Transparency = 0.5
			hitbox.CanCollide = false
			hitbox.Anchored = false
			hitbox.Massless = true
			hitbox.Parent = hrp
			
			local weld = Instance.new("WeldConstraint")
			weld.Part0 = hrp
			weld.Part1 = hitbox
			weld.Parent = hitbox
			
			local billboard = Instance.new("BillboardGui")
			billboard.Name = "HitboxLabel"
			billboard.Size = UDim2.new(0, 50, 0, 15)
			billboard.StudsOffset = Vector3.new(0, Size/2 + 0.5, 0)
			billboard.AlwaysOnTop = true
			billboard.Parent = hitbox
			
			local label = Instance.new("TextLabel")
			label.Size = UDim2.new(1, 0, 1, 0)
			label.BackgroundTransparency = 1
			label.Text = "Hitbox"
			label.TextColor3 = Color3.fromRGB(0, 255, 0)
			label.Font = Enum.Font.Code
			label.TextSize = 10
			label.TextScaled = true
			label.Parent = billboard
			
			NotificationLibrary:SendNotification("Success", "Hitbox applied to " .. TargetPlayer.DisplayName, 2)
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnHitbox",
	Alias = {"UnHitbox"},
	Callback = function()
		for _, player in pairs(Players:GetPlayers()) do
			if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local hrp = player.Character.HumanoidRootPart
				if hrp:FindFirstChild("DarkAdminHitbox") then
					hrp.DarkAdminHitbox:Destroy()
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "Invisible / Invis",
	Alias = {"Invisible", "Invis"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		if TargetPlayer ~= Player then
			NotificationLibrary:SendNotification("Error", "Nigga Can only make yourself invisible", 2)
			return
		end
		
		if CMD_Settings.InvisCMD.InvisRunning then return end
		CMD_Settings.InvisCMD.InvisRunning = true
		
		repeat task.wait(.1) until Player.Character
		local Character = Player.Character
		Character.Archivable = true
		CMD_Settings.InvisCMD.IsInvis = false
		CMD_Settings.InvisCMD.IsRunning = true
		CMD_Settings.InvisCMD.InvisibleCharacter = Character:Clone()
		CMD_Settings.InvisCMD.InvisibleCharacter.Parent = game:GetService("Lighting")
		local Void = workspace.FallenPartsDestroyHeight
		CMD_Settings.InvisCMD.InvisibleCharacter.Name = ""
		CMD_Settings.InvisCMD.OriginalCharacter = Character
		
		CMD_Settings.InvisCMD.InvisFix = RunService.Stepped:Connect(function()
			pcall(function()
				local IsInteger
				if tostring(Void):find('-') then
					IsInteger = true
				else
					IsInteger = false
				end
				local Pos = Player.Character.HumanoidRootPart.Position
				local Pos_String = tostring(Pos)
				local Pos_Seperate = Pos_String:split(', ')
				local X = tonumber(Pos_Seperate[1])
				local Y = tonumber(Pos_Seperate[2])
				local Z = tonumber(Pos_Seperate[3])
				if IsInteger == true then
					if Y <= Void then
						InvisRespawn()
					end
				elseif IsInteger == false then
					if Y >= Void then
						InvisRespawn()
					end
				end
			end)
		end)
		
		for i,v in pairs(CMD_Settings.InvisCMD.InvisibleCharacter:GetDescendants())do
			if v:IsA("BasePart") then
				if v.Name == "HumanoidRootPart" then
					v.Transparency = 1
				else
					v.Transparency = .5
				end
			end
		end
		
		function InvisRespawn()
			CMD_Settings.InvisCMD.IsRunning = false
			if CMD_Settings.InvisCMD.IsInvis == true then
				pcall(function()
					Player.Character = CMD_Settings.InvisCMD.OriginalCharacter
					wait()
					CMD_Settings.InvisCMD.OriginalCharacter.Parent = workspace
					CMD_Settings.InvisCMD.OriginalCharacter:FindFirstChildWhichIsA('Humanoid'):Destroy()
					CMD_Settings.InvisCMD.IsInvis = false
					CMD_Settings.InvisCMD.InvisibleCharacter.Parent = nil
					CMD_Settings.InvisCMD.InvisRunning = false
				end)
			elseif CMD_Settings.InvisCMD.IsInvis == false then
				pcall(function()
					Player.Character = CMD_Settings.InvisCMD.OriginalCharacter
					wait()
					CMD_Settings.InvisCMD.OriginalCharacter.Parent = workspace
					CMD_Settings.InvisCMD.OriginalCharacter:FindFirstChildWhichIsA('Humanoid'):Destroy()
					CommandSystem:ExecuteCommand("visible")
				end)
			end
		end
		
		CMD_Settings.InvisCMD.InvisDied = CMD_Settings.InvisCMD.InvisibleCharacter:FindFirstChildOfClass('Humanoid').Died:Connect(function()
			InvisRespawn()
			CMD_Settings.InvisCMD.InvisDied:Disconnect()
		end)
		
		if CMD_Settings.InvisCMD.IsInvis == true then return end
		CMD_Settings.InvisCMD.IsInvis = true
		CMD_Settings.InvisCMD.CF = workspace.CurrentCamera.CFrame
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character:MoveTo(Vector3.new(0, math.pi * 1000000, 0))
		workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
		wait(.2)
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		CMD_Settings.InvisCMD.OriginalCharacter.Parent = game:GetService("Lighting")
		CMD_Settings.InvisCMD.InvisibleCharacter.Parent = workspace
		CMD_Settings.InvisCMD.InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
		Player.Character = CMD_Settings.InvisCMD.InvisibleCharacter
		CommandSystem:ExecuteCommand("fixcam")
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false
		
		NotificationLibrary:SendNotification("Success", "You Appear Invisible to Others FE", 2)
	end
})

CommandSystem:AddCmd({
	Title = "UnInvisible / Visible",
	Alias = {"UnInvisible", "Visible"},
	Callback = function()
		if CMD_Settings.InvisCMD.IsInvis == false then return end
		
		if CMD_Settings.InvisCMD.InvisFix then
			CMD_Settings.InvisCMD.InvisFix:Disconnect()
		end
		if CMD_Settings.InvisCMD.InvisDied then
			CMD_Settings.InvisCMD.InvisDied:Disconnect()
		end
		
		CMD_Settings.InvisCMD.CF = workspace.CurrentCamera.CFrame
		local Character = CMD_Settings.InvisCMD.OriginalCharacter
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character.HumanoidRootPart.CFrame = CF_1
		CMD_Settings.InvisCMD.InvisibleCharacter:Destroy()
		Player.Character = Character
		Character.Parent = workspace
		CMD_Settings.InvisCMD.IsInvis = false
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false
		
		CMD_Settings.InvisCMD.InvisDied = Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
			InvisRespawn()
			CMD_Settings.InvisCMD.InvisDied:Disconnect()
		end)
		
		CMD_Settings.InvisCMD.InvisRunning = false
	end
})

CommandSystem:AddCmd({
	Title = "Id / CheckId",
	Alias = {"Id", "CheckId"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		local UserId = TargetPlayer.UserId
		NotificationLibrary:SendNotification("Info", TargetPlayer.DisplayName .. " UserId: " .. UserId, 6)
	end
})

CommandSystem:AddCmd({
	Title = "Jump",
	Alias = {"Jump"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character and TargetPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
			TargetPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Join",
	Alias = {"Join"},
	Args = true,
	Variables = {"String"},
	Callback = function(JobId)
		game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, JobId, Player)
	end
})

CommandSystem:AddCmd({
	Title = "JobId / CheckJobId",
	Alias = {"JobId", "CheckJobId"},
	Callback = function()
		local JobId = tostring(game.JobId)
		setclipboard(JobId)
		NotificationLibrary:SendNotification("Success", "JobId copied to clipboard", 3)
	end
})

CommandSystem:AddCmd({
	Title = "LoopWalkSpeed / LoopWS",
	Alias = {"LoopWalkSpeed", "LoopWS"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 16,
	Callback = function(Speed)
		CMD_Settings.LoopWsCMD.LoopWsOn = true
		CMD_Settings.LoopWsCMD.WsSpeed = Speed
		
		if CMD_Settings.LoopWsCMD.LoopWsConnection then
			CMD_Settings.LoopWsCMD.LoopWsConnection:Disconnect()
		end
		
		CMD_Settings.LoopWsCMD.LoopWsConnection = RunService.Heartbeat:Connect(function()
			if CMD_Settings.LoopWsCMD.LoopWsOn and Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
				Player.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = CMD_Settings.LoopWsCMD.WsSpeed
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnLoopWalkSpeed / UnLoopWS",
	Alias = {"UnLoopWalkSpeed", "UnLoopWS"},
	Callback = function()
		if CMD_Settings.LoopWsCMD.LoopWsConnection then
			CMD_Settings.LoopWsCMD.LoopWsConnection:Disconnect()
			CMD_Settings.LoopWsCMD.LoopWsConnection = nil
		end
		CMD_Settings.LoopWsCMD.LoopWsOn = false
	end
})

CommandSystem:AddCmd({
	Title = "LoopJumpPower / LoopJP",
	Alias = {"LoopJumpPower", "LoopJP"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 50,
	Callback = function(Height)
		CMD_Settings.LoopJpCMD.LoopJpOn = true
		CMD_Settings.LoopJpCMD.JpHeight = Height
		
		if CMD_Settings.LoopJpCMD.LoopJpConnection then
			CMD_Settings.LoopJpCMD.LoopJpConnection:Disconnect()
		end
		
		CMD_Settings.LoopJpCMD.LoopJpConnection = RunService.Heartbeat:Connect(function()
			if CMD_Settings.LoopJpCMD.LoopJpOn and Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
				Player.Character:FindFirstChildWhichIsA("Humanoid").JumpHeight = CMD_Settings.LoopJpCMD.JpHeight
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnLoopJumpPower / UnLoopJP",
	Alias = {"UnLoopJumpPower", "UnLoopJP"},
	Callback = function()
		if CMD_Settings.LoopJpCMD.LoopJpConnection then
			CMD_Settings.LoopJpCMD.LoopJpConnection:Disconnect()
			CMD_Settings.LoopJpCMD.LoopJpConnection = nil
		end
		CMD_Settings.LoopJpCMD.LoopJpOn = false
	end
})

CommandSystem:AddCmd({
	Title = "LowGravity",
	Alias = {"LowGravity"},
	Callback = function()
		workspace.Gravity = 50
	end
})

CommandSystem:AddCmd({
	Title = "Naked / Bold",
	Alias = {"Naked", "Bold"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character then
			for _, v in pairs(TargetPlayer.Character:GetDescendants()) do
				if v:IsA("Clothing") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
					v:Destroy()
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "NoLegs / RemoveLegs",
	Alias = {"NoLegs", "RemoveLegs"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character then
			for _, v in pairs(TargetPlayer.Character:GetChildren()) do
				if v.Name == "Left Leg" or v.Name == "Right Leg" or v.Name == "LeftUpperLeg" or v.Name == "RightUpperLeg" or v.Name == "LeftLowerLeg" or v.Name == "RightLowerLeg" or v.Name == "LeftFoot" or v.Name == "RightFoot" then
					v:Destroy()
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "NoTorso",
	Alias = {"NoTorso"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character then
			for _, v in pairs(TargetPlayer.Character:GetChildren()) do
				if v.Name == "Torso" or v.Name == "UpperTorso" or v.Name == "LowerTorso" then
					v:Destroy()
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "NoFace",
	Alias = {"NoFace"},
	Args = true,
	Variables = {"Player"},
	SelfCallback = "me",
	Callback = function(TargetPlayer)
		if TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("Head") then
			for _, v in pairs(TargetPlayer.Character.Head:GetChildren()) do
				if v:IsA("Decal") and v.Name == "face" then
					v:Destroy()
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "NoclipCamera / NoclipCam / NCam",
	Alias = {"NoclipCamera", "NoclipCam", "NCam"},
	Callback = function()
		CMD_Settings.NoclipCamCMD = CMD_Settings.NoclipCamCMD or {}
		CMD_Settings.NoclipCamCMD.NoclipCamOn = true
		
		if CMD_Settings.NoclipCamCMD.NoclipCamConnection then
			CMD_Settings.NoclipCamCMD.NoclipCamConnection:Disconnect()
		end
		
		CMD_Settings.NoclipCamCMD.NoclipCamConnection = RunService.RenderStepped:Connect(function()
			if CMD_Settings.NoclipCamCMD.NoclipCamOn then
				workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
				local cam = workspace.CurrentCamera
				local pos = cam.CFrame.Position
				local lookVector = cam.CFrame.LookVector
				cam.CFrame = CFrame.new(pos, pos + lookVector)
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "Orbit",
	Alias = {"Orbit"},
	Args = true,
	Variables = {"Player", "Number"},
	SelfCallback = {"random", 5},
	Callback = function(TargetPlayer, Speed)
		CommandSystem:ExecuteCommand("unorbit")
		
		local root = getRoot(Player.Character)
		local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
		
		if TargetPlayer and TargetPlayer.Character and getRoot(TargetPlayer.Character) and root and humanoid then
			local rotation = 0
			local speed = Speed or 0.2
			local distance = 6
			
			CMD_Settings.OrbitCMD.OrbitTarget = TargetPlayer
			
			CMD_Settings.OrbitCMD.Orbit1 = RunService.Heartbeat:Connect(function()
				pcall(function()
					rotation = rotation + speed
					root.CFrame = CFrame.new(getRoot(TargetPlayer.Character).Position) * CFrame.Angles(0, math.rad(rotation), 0) * CFrame.new(distance, 0, 0)
				end)
			end)
			
			CMD_Settings.OrbitCMD.Orbit2 = RunService.RenderStepped:Connect(function()
				pcall(function()
					root.CFrame = CFrame.new(root.Position, getRoot(TargetPlayer.Character).Position)
				end)
			end)
			
			CMD_Settings.OrbitCMD.Orbit3 = humanoid.Died:Connect(function()
				CommandSystem:ExecuteCommand("unorbit")
			end)
			
			CMD_Settings.OrbitCMD.Orbit4 = humanoid.Seated:Connect(function(value)
				if value then
					CommandSystem:ExecuteCommand("unorbit")
				end
			end)
			
			NotificationLibrary:SendNotification("Success", "Started orbiting " .. TargetPlayer.DisplayName, 2)
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnOrbit",
	Alias = {"UnOrbit"},
	Callback = function()
		if CMD_Settings.OrbitCMD.Orbit1 then
			CMD_Settings.OrbitCMD.Orbit1:Disconnect()
			CMD_Settings.OrbitCMD.Orbit1 = nil
		end
		if CMD_Settings.OrbitCMD.Orbit2 then
			CMD_Settings.OrbitCMD.Orbit2:Disconnect()
			CMD_Settings.OrbitCMD.Orbit2 = nil
		end
		if CMD_Settings.OrbitCMD.Orbit3 then
			CMD_Settings.OrbitCMD.Orbit3:Disconnect()
			CMD_Settings.OrbitCMD.Orbit3 = nil
		end
		if CMD_Settings.OrbitCMD.Orbit4 then
			CMD_Settings.OrbitCMD.Orbit4:Disconnect()
			CMD_Settings.OrbitCMD.Orbit4 = nil
		end
		CMD_Settings.OrbitCMD.OrbitTarget = nil
	end
})

CommandSystem:AddCmd({
	Title = "UnNoclipCamera / UnNCam / ClipCam",
	Alias = {"UnNoclipCamera", "UnNCam", "ClipCam"},
	Callback = function()
		if CMD_Settings.NoclipCamCMD and CMD_Settings.NoclipCamCMD.NoclipCamConnection then
			CMD_Settings.NoclipCamCMD.NoclipCamConnection:Disconnect()
			CMD_Settings.NoclipCamCMD.NoclipCamConnection = nil
		end
		if CMD_Settings.NoclipCamCMD then
			CMD_Settings.NoclipCamCMD.NoclipCamOn = false
		end
		workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildWhichIsA("Humanoid")
	end
})

CommandSystem:AddCmd({
	Title = "Float / Swim",
	Alias = {"Float", "Swim"},
	Callback = function()
		if not CMD_Settings.SwimCMD.Swimming and Player and Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
			CMD_Settings.SwimCMD.OldGrav = workspace.Gravity
			workspace.Gravity = 0
			local swimDied = function()
				workspace.Gravity = CMD_Settings.SwimCMD.OldGrav
				CMD_Settings.SwimCMD.Swimming = false
			end
			local Humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
			CMD_Settings.SwimCMD.GravReset = Humanoid.Died:Connect(swimDied)
			local enums = Enum.HumanoidStateType:GetEnumItems()
			table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
			for i, v in pairs(enums) do
				Humanoid:SetStateEnabled(v, false)
			end
			Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
			CMD_Settings.SwimCMD.SwimBeat = RunService.Heartbeat:Connect(function()
				pcall(function()
					Player.Character.HumanoidRootPart.Velocity = ((Humanoid.MoveDirection ~= Vector3.new() or UserInputService:IsKeyDown(Enum.KeyCode.Space)) and Player.Character.HumanoidRootPart.Velocity or Vector3.new())
				end)
			end)
			CMD_Settings.SwimCMD.Swimming = true
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnFloat / UnSwim",
	Alias = {"UnFloat", "UnSwim"},
	Callback = function()
		if Player and Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
			workspace.Gravity = CMD_Settings.SwimCMD.OldGrav
			CMD_Settings.SwimCMD.Swimming = false
			if CMD_Settings.SwimCMD.GravReset then
				CMD_Settings.SwimCMD.GravReset:Disconnect()
			end
			if CMD_Settings.SwimCMD.SwimBeat ~= nil then
				CMD_Settings.SwimCMD.SwimBeat:Disconnect()
				CMD_Settings.SwimCMD.SwimBeat = nil
			end
			local Humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
			local enums = Enum.HumanoidStateType:GetEnumItems()
			table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
			for i, v in pairs(enums) do
				Humanoid:SetStateEnabled(v, true)
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "Outfit",
	Alias = {"Outfit"},
	Args = true,
	Variables = {"String"},
	Callback = function(userId)
		local cleanId = userId:gsub("%D", "")
		local success, err = pcall(function()
			local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
			if humanoid then
				local description = game:GetService("Players"):GetHumanoidDescriptionFromUserId(tonumber(cleanId))
				humanoid:ApplyDescription(description)
				NotificationLibrary:SendNotification("Success", "Outfit for " .. cleanId .. " is Copied", 3)
			end
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "OutFit didnt Copied properly  " .. tostring(err), 3)
		end
	end
})

CommandSystem:AddCmd({
	Title = "QueueTeleport / QTeleport / GameTeleport / GTeleport",
	Alias = {"QueueTeleport", "QTeleport", "GameTeleport", "GTeleport"},
	Args = true,
	Variables = {"String"},
	Callback = function(placeId)
		local cleanId = placeId:gsub("%D", "")
		local success, err = pcall(function()
			game:GetService("TeleportService"):Teleport(tonumber(cleanId), Player)
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "Failed to teleport: " .. tostring(err), 3)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Reset / Re / Refresh",
	Alias = {"Reset", "Re", "Refresh"},
	Callback = function()
		if Player.Character and Player.Character:FindFirstChild("Humanoid") then
			Player.Character.Humanoid.Health = 0
		end
	end
})

CommandSystem:AddCmd({
	Title = "Rejoin / Rj",
	Alias = {"Rejoin", "Rj"},
	Callback = function()
		local ts = game:GetService("TeleportService")
		local p = game:GetService("Players").LocalPlayer
		ts:Teleport(game.PlaceId, p)
	end
})

CommandSystem:AddCmd({
	Title = "ServerHop / Shop",
	Alias = {"ServerHop", "Shop"},
	Callback = function()
		local success, err = pcall(function()
			local servers = {}
			local req = game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")
			local body = game:GetService("HttpService"):JSONDecode(req)
			if body and body.data then
				for i, v in next, body.data do
					if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.id ~= game.JobId then
						if tonumber(v.playing) < tonumber(v.maxPlayers) then
							table.insert(servers, v.id)
						end
					end
				end
			end
			if #servers > 0 then
				game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)], Player)
			else
				NotificationLibrary:SendNotification("Error", "No servers found", 2)
			end
		end)
		if not success then
			NotificationLibrary:SendNotification("Error", "ServerHop failed: " .. tostring(err), 3)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Sit",
	Alias = {"Sit"},
	Callback = function()
		if Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
			Player.Character:FindFirstChildWhichIsA("Humanoid").Sit = true
		end
	end
})

CommandSystem:AddCmd({
	Title = "Spin",
	Alias = {"Spin"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 20,
	Callback = function(Speed)
		if CMD_Settings.SpinCMD.SpinLoop then
			CMD_Settings.SpinCMD.SpinLoop:Disconnect()
		end
		
		CMD_Settings.SpinCMD.SpinOn = true
		CMD_Settings.SpinCMD.SpinSpeed = Speed
		
		local root = getRoot(Player.Character)
		if root then
			local bg = Instance.new("BodyGyro")
			bg.Name = "DarkAdminSpin"
			bg.MaxTorque = Vector3.new(0, math.huge, 0)
			bg.P = 1000
			bg.Parent = root
			
			CMD_Settings.SpinCMD.SpinLoop = RunService.Heartbeat:Connect(function()
				if CMD_Settings.SpinCMD.SpinOn and bg and bg.Parent then
					bg.CFrame = bg.CFrame * CFrame.Angles(0, math.rad(CMD_Settings.SpinCMD.SpinSpeed), 0)
				end
			end)
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnSpin",
	Alias = {"UnSpin"},
	Callback = function()
		CMD_Settings.SpinCMD.SpinOn = false
		
		if CMD_Settings.SpinCMD.SpinLoop then
			CMD_Settings.SpinCMD.SpinLoop:Disconnect()
			CMD_Settings.SpinCMD.SpinLoop = nil
		end
		
		local root = getRoot(Player.Character)
		if root then
			for _, v in pairs(root:GetChildren()) do
				if v.Name == "DarkAdminSpin" and v:IsA("BodyGyro") then
					v:Destroy()
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "Spam",
	Alias = {"Spam"},
	Args = true,
	Variables = {"Text"},
	SelfCallback = "Spam",
	Callback = function(text)
		CMD_Settings.SpamCMD.SpamOn = true
		CMD_Settings.SpamCMD.SpamText = text
		
		if CMD_Settings.SpamCMD.SpamLoop then
			CMD_Settings.SpamCMD.SpamLoop = false
			task.wait(0.1)
		end
		
		CMD_Settings.SpamCMD.SpamLoop = true
		
		task.spawn(function()
			while CMD_Settings.SpamCMD.SpamLoop do
				local success = pcall(function()
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(CMD_Settings.SpamCMD.SpamText, "All")
				end)
				
				if not success then
					pcall(function()
						game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(CMD_Settings.SpamCMD.SpamText)
					end)
				end
				
				task.wait(0.5)
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnSpam",
	Alias = {"UnSpam"},
	Callback = function()
		CMD_Settings.SpamCMD.SpamOn = false
		CMD_Settings.SpamCMD.SpamLoop = false
		CMD_Settings.SpamCMD.SpamText = ""
	end
})

CommandSystem:AddCmd({
	Title = "TeleportTo / To",
	Alias = {"TeleportTo", "To"},
	Args = true,
	Variables = {"Player"},
	Callback = function(TargetPlayer)
		if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				Player.Character.HumanoidRootPart.CFrame = TargetPlayer.Character.HumanoidRootPart.CFrame
				NotificationLibrary:SendNotification("Success", "Teleported to " .. TargetPlayer.DisplayName, 2)
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "TweenTeleportTo / TweenTo",
	Alias = {"TweenTeleportTo", "TweenTo"},
	Args = true,
	Variables = {"Player", "Number"},
	SelfCallback = {"random", 1},
	Callback = function(TargetPlayer, Speed)
		if CMD_Settings.TweenToCMD.TweenToTween then
			CMD_Settings.TweenToCMD.TweenToTween:Cancel()
		end
		
		if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
			if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
				local targetPos = TargetPlayer.Character.HumanoidRootPart.CFrame
				local distance = (Player.Character.HumanoidRootPart.Position - targetPos.Position).Magnitude
				local time = distance / (Speed * 100)
				
				CMD_Settings.TweenToCMD.TweenToTween = TweenService:Create(
					Player.Character.HumanoidRootPart,
					TweenInfo.new(time, Enum.EasingStyle.Linear),
					{CFrame = targetPos}
				)
				
				CMD_Settings.TweenToCMD.TweenToTween:Play()
				NotificationLibrary:SendNotification("Success", "Tween teleporting to " .. TargetPlayer.DisplayName, 2)
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "ThirdPerson / ThirdP",
	Alias = {"ThirdPerson", "ThirdP"},
	Callback = function()
		Player.CameraMode = Enum.CameraMode.Classic
		Player.CameraMaxZoomDistance = 400
	end
})

CommandSystem:AddCmd({
	Title = "Transparent",
	Alias = {"Transparent"},
	Args = true,
	Variables = {"Player", "Number"},
	SelfCallback = {"me", 0.5},
	Callback = function(TargetPlayer, transparency)
		if TargetPlayer and TargetPlayer.Character then
			for _, v in pairs(TargetPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.Transparency = transparency
				elseif v:IsA("Decal") or v:IsA("Texture") then
					v.Transparency = transparency
				end
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "View",
	Alias = {"View"},
	Args = true,
	Variables = {"Player"},
	Callback = function(TargetPlayer)
		if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChildWhichIsA("Humanoid") then
			CMD_Settings.ViewCMD.OriginalSubject = workspace.CurrentCamera.CameraSubject
			CMD_Settings.ViewCMD.ViewTarget = TargetPlayer
			workspace.CurrentCamera.CameraSubject = TargetPlayer.Character:FindFirstChildWhichIsA("Humanoid")
			NotificationLibrary:SendNotification("Success", "Viewing " .. TargetPlayer.DisplayName, 2)
		end
	end
})

CommandSystem:AddCmd({
	Title = "UnView",
	Alias = {"UnView"},
	Callback = function()
		if CMD_Settings.ViewCMD.OriginalSubject then
			workspace.CurrentCamera.CameraSubject = CMD_Settings.ViewCMD.OriginalSubject
		else
			repeat task.wait() until Player.Character
			if Player.Character:FindFirstChildWhichIsA("Humanoid") then
				workspace.CurrentCamera.CameraSubject = Player.Character:FindFirstChildWhichIsA("Humanoid")
			end
		end
		CMD_Settings.ViewCMD.ViewTarget = nil
		CMD_Settings.ViewCMD.OriginalSubject = nil
	end
})
CommandSystem:AddCmd({
	Title = "WalkTo",
	Alias = {"WalkTo"},
	Args = true,
	Variables = {"Player"},
	Callback = function(TargetPlayer)
		if CMD_Settings.WalkToCMD.WalkToConnection then
			CMD_Settings.WalkToCMD.WalkToConnection:Disconnect()
			CMD_Settings.WalkToCMD.WalkToConnection = nil
		end
		
		CMD_Settings.WalkToCMD.WalkToOn = true
		CMD_Settings.WalkToCMD.WalkToTarget = TargetPlayer
		
		local pathfindingService = game:GetService("PathfindingService")
		
		CMD_Settings.WalkToCMD.WalkToConnection = RunService.Heartbeat:Connect(function()
			if CMD_Settings.WalkToCMD.WalkToOn and TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChildWhichIsA("Humanoid") then
					local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
					local root = Player.Character.HumanoidRootPart
					local targetRoot = TargetPlayer.Character.HumanoidRootPart
					
					local distance = (root.Position - targetRoot.Position).Magnitude
					if distance <= 5 then
						CMD_Settings.WalkToCMD.WalkToOn = false
						CMD_Settings.WalkToCMD.WalkToConnection:Disconnect()
						CMD_Settings.WalkToCMD.WalkToConnection = nil
						humanoid:MoveTo(root.Position)
						return
					end
					
					local path = pathfindingService:CreatePath()
					local success, errorMessage = pcall(function()
						path:ComputeAsync(root.Position, targetRoot.Position)
					end)
					
					if success and path.Status == Enum.PathStatus.Success then
						local waypoints = path:GetWaypoints()
						
						for i, waypoint in ipairs(waypoints) do
							if not CMD_Settings.WalkToCMD.WalkToOn then break end
							humanoid:MoveTo(waypoint.Position)
							
							if waypoint.Action == Enum.PathWaypointAction.Jump then
								humanoid.Jump = true
							end
							
							local timeout = humanoid.MoveToFinished:Wait()
						end
					else
						humanoid:MoveTo(targetRoot.Position)
					end
				end
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "WalkToCoord / WalkToPos",
	Alias = {"WalkToCoord", "WalkToPos"},
	Args = true,
	Variables = {"Number", "Number", "Number"},
	Callback = function(x, y, z)
		if CMD_Settings.WalkToCMD.WalkToConnection then
			CMD_Settings.WalkToCMD.WalkToConnection:Disconnect()
			CMD_Settings.WalkToCMD.WalkToConnection = nil
		end
		
		CMD_Settings.WalkToCMD.WalkToOn = true
		local targetPosition = Vector3.new(x, y, z)
		
		local pathfindingService = game:GetService("PathfindingService")
		
		CMD_Settings.WalkToCMD.WalkToConnection = RunService.Heartbeat:Connect(function()
			if CMD_Settings.WalkToCMD.WalkToOn then
				if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChildWhichIsA("Humanoid") then
					local humanoid = Player.Character:FindFirstChildWhichIsA("Humanoid")
					local root = Player.Character.HumanoidRootPart
					
					local distance = (root.Position - targetPosition).Magnitude
					if distance <= 5 then
						CMD_Settings.WalkToCMD.WalkToOn = false
						CMD_Settings.WalkToCMD.WalkToConnection:Disconnect()
						CMD_Settings.WalkToCMD.WalkToConnection = nil
						humanoid:MoveTo(root.Position)
						return
					end
					
					local path = pathfindingService:CreatePath()
					local success, errorMessage = pcall(function()
						path:ComputeAsync(root.Position, targetPosition)
					end)
					
					if success and path.Status == Enum.PathStatus.Success then
						local waypoints = path:GetWaypoints()
						
						for i, waypoint in ipairs(waypoints) do
							if not CMD_Settings.WalkToCMD.WalkToOn then break end
							humanoid:MoveTo(waypoint.Position)
							
							if waypoint.Action == Enum.PathWaypointAction.Jump then
								humanoid.Jump = true
							end
							
							local timeout = humanoid.MoveToFinished:Wait()
						end
					else
						humanoid:MoveTo(targetPosition)
					end
				end
			end
		end)
		
	end
})

CommandSystem:AddCmd({
	Title = "WalkOnWalls / WallWalk / WW",
	Alias = {"WalkOnWalls", "WallWalk"},
	Callback = function()
		CMD_Settings.WalkOnWallsCMD = CMD_Settings.WalkOnWallsCMD or {}
		CMD_Settings.WalkOnWallsCMD.WalkOnWallsOn = true
		
		local player = Player
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")
		local rootPart = character:WaitForChild("HumanoidRootPart")
		
		local function getNearestWall()
			local rayDirections = {
				Vector3.new(1, 0, 0),
				Vector3.new(-1, 0, 0),
				Vector3.new(0, 0, 1),
				Vector3.new(0, 0, -1)
			}
			
			local closestHit = nil
			local closestDistance = math.huge
			
			for _, direction in ipairs(rayDirections) do
				local raycastParams = RaycastParams.new()
				raycastParams.FilterDescendantsInstances = {character}
				raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
				
				local result = workspace:Raycast(rootPart.Position, direction * 5, raycastParams)
				
				if result and result.Distance < closestDistance then
					closestDistance = result.Distance
					closestHit = result
				end
			end
			
			return closestHit
		end
		
		CMD_Settings.WalkOnWallsCMD.WalkConnection = RunService.Heartbeat:Connect(function()
			if not CMD_Settings.WalkOnWallsCMD.WalkOnWallsOn then return end
			
			local wallHit = getNearestWall()
			
			if wallHit and humanoid.MoveDirection.Magnitude > 0 then
				local wallNormal = wallHit.Normal
				local upVector = wallNormal
				local rightVector = Vector3.new(0, 1, 0):Cross(wallNormal).Unit
				local forwardVector = rightVector:Cross(upVector)
				
				rootPart.CFrame = CFrame.new(
					wallHit.Position + wallNormal * 3,
					wallHit.Position + wallNormal * 3 + forwardVector
				) * CFrame.Angles(math.pi/2, 0, 0)
				
				humanoid.PlatformStand = true
			else
				humanoid.PlatformStand = false
			end
		end)
		
		CMD_Settings.WalkOnWallsCMD.DiedConnection = humanoid.Died:Connect(function()
			CommandSystem:ExecuteCommand("unwallwalk")
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnWalkOnWalls / UnWallWalk",
	Alias = {"UnWalkOnWalls", "UnWallWalk"},
	Callback = function()
		if CMD_Settings.WalkOnWallsCMD then
			CMD_Settings.WalkOnWallsCMD.WalkOnWallsOn = false
			
			if CMD_Settings.WalkOnWallsCMD.WalkConnection then
				CMD_Settings.WalkOnWallsCMD.WalkConnection:Disconnect()
				CMD_Settings.WalkOnWallsCMD.WalkConnection = nil
			end
			
			if CMD_Settings.WalkOnWallsCMD.DiedConnection then
				CMD_Settings.WalkOnWallsCMD.DiedConnection:Disconnect()
				CMD_Settings.WalkOnWallsCMD.DiedConnection = nil
			end
			
			if Player.Character and Player.Character:FindFirstChildWhichIsA("Humanoid") then
				Player.Character:FindFirstChildWhichIsA("Humanoid").PlatformStand = false
			end
		end
	end
})

CommandSystem:AddCmd({
	Title = "Xray",
	Alias = {"Xray"},
	Callback = function()
		if CMD_Settings.XrayCMD.XrayOn then return end
		
		CMD_Settings.XrayCMD.XrayOn = true
		CMD_Settings.XrayCMD.OriginalTransparencies = {}
		
		task.spawn(function()
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("BasePart") or obj:IsA("Model") and obj.Transparency < 1 and not obj:IsDescendantOf(Player.Character) then
					CMD_Settings.XrayCMD.OriginalTransparencies[obj] = obj.Transparency
					obj.Transparency = 0.6
				end
				if _ % 100 == 0 then
					task.wait()
				end
			end
		end)
		
		NotificationLibrary:SendNotification("Success", "Xray Enabled", 2)
	end
})

CommandSystem:AddCmd({
	Title = "UnXray / RemoveXray",
	Alias = {"UnXray", "RemoveXray"},
	Callback = function()
		if not CMD_Settings.XrayCMD.XrayOn then return end
		
		CMD_Settings.XrayCMD.XrayOn = false
		
		task.spawn(function()
			local count = 0
			for obj, transparency in pairs(CMD_Settings.XrayCMD.OriginalTransparencies) do
				if obj and obj.Parent then
					obj.Transparency = transparency
				end
				count = count + 1
				if count % 100 == 0 then
					task.wait()
				end
			end
			CMD_Settings.XrayCMD.OriginalTransparencies = {}
		end)
	end
})

CommandSystem:AddCmd({
	Title = "Xmark",
	Alias = {"Xmark"},
	Callback = function()
		if not Player.Character or not Player.Character:FindFirstChild("HumanoidRootPart") then return end
		
		local position = Player.Character.HumanoidRootPart.Position
		
		local part = Instance.new("Part")
		part.Name = "DarkAdminXmark"
		part.Size = Vector3.new(0.1, 0.1, 0.1)
		part.Anchored = true
		part.CanCollide = false
		part.Transparency = 1
		part.Position = position
		part.Parent = workspace
		
		local billboard = Instance.new("BillboardGui")
		billboard.Name = "XmarkGui"
		billboard.Size = UDim2.new(0, 100, 0, 150)
		billboard.StudsOffset = Vector3.new(0, 50, 0)
		billboard.AlwaysOnTop = true
		billboard.Parent = part
		
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, 0, 1, 0)
		label.BackgroundTransparency = 1
		label.Text = "x"
		label.TextColor3 = Color3.fromRGB(255, 0, 0)
		label.Font = Enum.Font.Cartoon
		label.TextSize = 50
		label.TextScaled = true
		label.Parent = billboard
		
		table.insert(CMD_Settings.XmarkCMD.Xmarks, part)
	end
})

CommandSystem:AddCmd({
	Title = "UnXmark / RemoveXmark",
	Alias = {"UnXmark", "RemoveXmark"},
	Callback = function()
		for _, mark in pairs(CMD_Settings.XmarkCMD.Xmarks) do
			if mark and mark.Parent then
				mark:Destroy()
			end
		end
		CMD_Settings.XmarkCMD.Xmarks = {}
	end
})

CommandSystem:AddCmd({
	Title = "Yell",
	Alias = {"Yell"},
	Args = true,
	Variables = {"Text"},
	SelfCallback = "HELLO!",
	Callback = function(text)
		local yellText = string.upper(text)
		
		local success = pcall(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(yellText, "All")
		end)
		
		if not success then
			pcall(function()
				game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(yellText)
			end)
		end
	end
})

CommandSystem:AddCmd({
	Title = "SpamYell / SYell",
	Alias = {"SpamYell", "SYell"},
	Args = true,
	Variables = {"Text"},
	SelfCallback = "SPAM",
	Callback = function(text)
		CMD_Settings.SpamYellCMD.SpamYellOn = true
		CMD_Settings.SpamYellCMD.YellText = string.upper(text)
		
		if CMD_Settings.SpamYellCMD.SpamYellLoop then
			CMD_Settings.SpamYellCMD.SpamYellLoop = false
			task.wait(0.1)
		end
		
		CMD_Settings.SpamYellCMD.SpamYellLoop = true
		
		task.spawn(function()
			while CMD_Settings.SpamYellCMD.SpamYellLoop do
				local success = pcall(function()
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(CMD_Settings.SpamYellCMD.YellText, "All")
				end)
				
				if not success then
					pcall(function()
						game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(CMD_Settings.SpamYellCMD.YellText)
					end)
				end
				
				task.wait(0.5)
			end
		end)
	end
})

CommandSystem:AddCmd({
	Title = "UnSpamYell / UnSYell",
	Alias = {"UnSpamYell", "UnSYell"},
	Callback = function()
		CMD_Settings.SpamYellCMD.SpamYellOn = false
		CMD_Settings.SpamYellCMD.SpamYellLoop = false
		CMD_Settings.SpamYellCMD.YellText = ""
	end
})

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == Enum.KeyCode.Insert then
        if G2L["Frame_c"].Visible then
            CommandSystem:ExecuteCommand("HideDA")
        else
            CommandSystem:ExecuteCommand("UnHideDA")
        end
    end
end)

CommandSystem:AddCmd({
	Title = "CloneTool / CTool",
	Alias = {"CloneTool", "CTool"},
	Callback = function()
		local success, err = pcall(function()
		    
			local equippedTool = Player.Character:FindFirstChildOfClass("Tool")
			
			if equippedTool then
				local clonedTool = equippedTool:Clone()
				clonedTool.Parent = Player.Backpack
			else
				local backpackTool = Player.Backpack:FindFirstChildOfClass("Tool")
				
				if backpackTool then
					local clonedTool = backpackTool:Clone()
					clonedTool.Parent = Player.Backpack
				else
					NotificationLibrary:SendNotification("Error", "No tool to Clone", 2)
				end
			end
		end)
		
		if not success then
			NotificationLibrary:SendNotification("Error", "CloneTool failed: " .. tostring(err), 3)
		end
	end
})

CommandSystem:AddCmd({
	Title = "Gravity / Grav",
	Alias = {"Gravity", "Grav"},
	Args = true,
	Variables = {"Number"},
	SelfCallback = 196.2,
	Callback = function(force)
		workspace.Gravity = force
	end
})

CommandSystem:AddCmd({
	Title = "Music / PlayMusic",
	Alias = {"Music", "PlayMusic"},
	Args = true,
	Variables = {"String", "Number"},
	Callback = function(assetId, volume)
		local cleanId = assetId:gsub("rbxassetid://", "")
		local soundVolume = volume or 1
		
		if workspace:FindFirstChild("DarkAdminAudio") then
			workspace.DarkAdminAudio:Destroy()
		end
		
		local sound = Instance.new("Sound")
		sound.Name = "DarkAdminAudio"
		sound.SoundId = "rbxassetid://" .. cleanId
		sound.Volume = soundVolume
		sound.Looped = true
		sound.Parent = workspace
		sound:Play()
	end
})

CommandSystem:AddCmd({
	Title = "UnMusic / UnPlayMusic",
	Alias = {"UnMusic", "UnPlayMusic"},
	Callback = function()
		if workspace:FindFirstChild("DarkAdminAudio") then
			workspace.DarkAdminAudio:Destroy()
		end
	end
})

CommandSystem:AddCmd({
	Title = "Whisper / Dm / Pm",
	Alias = {"Whisper", "Dm", "Pm"},
	Args = true,
	Variables = {"Player", "Text"},
	Callback = function(TargetPlayer, message)
		local success = pcall(function()
			game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/w " .. TargetPlayer.Name .. " " .. message, "All")
		end)
		
		if not success then
			pcall(function()
				game:GetService("TextChatService"):DisplaySystemMessage("[Whisper to " .. TargetPlayer.DisplayName .. "]: " .. message)
			end)
		end
	end
})

CommandSystem:AddCmd({
    Title = "HeadSit / SitOnHead",
    Alias = {"HeadSit", "SitOnHead"},
    Args = true,
    Variables = {"Player"},
    SelfCallback = "random",
    Callback = function(TargetPlayer)
        if CMD_Settings.HeadSitCMD and CMD_Settings.HeadSitCMD.HeadSitLoop then
            CMD_Settings.HeadSitCMD.HeadSitLoop:Disconnect()
            CMD_Settings.HeadSitCMD.HeadSitLoop = nil
        end
        
        CMD_Settings.HeadSitCMD = CMD_Settings.HeadSitCMD or {}
        
        local humanoid = Player.Character:FindFirstChildWhichIsA('Humanoid')
        if humanoid then
            humanoid.Sit = true
        end
        
        CMD_Settings.HeadSitCMD.HeadSitLoop = RunService.Heartbeat:Connect(function()
            pcall(function()
                if TargetPlayer and Players:FindFirstChild(TargetPlayer.Name) and 
                   TargetPlayer.Character and 
                   getRoot(TargetPlayer.Character) and 
                   getRoot(Player.Character) and 
                   Player.Character:FindFirstChildOfClass('Humanoid').Sit == true then
                    
                    getRoot(Player.Character).CFrame = getRoot(TargetPlayer.Character).CFrame * 
                                                       CFrame.Angles(0, math.rad(0), 0) * 
                                                       CFrame.new(0, 1.6, 0.4)
                else
                    if CMD_Settings.HeadSitCMD.HeadSitLoop then
                        CMD_Settings.HeadSitCMD.HeadSitLoop:Disconnect()
                        CMD_Settings.HeadSitCMD.HeadSitLoop = nil
                    end
                end
            end)
        end)
    end
})

CommandSystem:AddCmd({
    Title = "UnHeadSit / UnSitOnHead",
    Alias = {"UnHeadSit", "UnSitOnHead"},
    Callback = function()
        if CMD_Settings.HeadSitCMD and CMD_Settings.HeadSitCMD.HeadSitLoop then
            CMD_Settings.HeadSitCMD.HeadSitLoop:Disconnect()
            CMD_Settings.HeadSitCMD.HeadSitLoop = nil
        end
        
        local humanoid = Player.Character:FindFirstChildWhichIsA('Humanoid')
        if humanoid then
            humanoid.Sit = false
        end
        
    end
})

task.spawn(function()
	pcall(function()
		task.wait(0.2)
		PlayIntro()
		SetUpDragging()
		SetUpChatCommands()
		NotificationLibrary:SendNotification("Warning", "Join the Discord for Updates!", 3)
	end)
end)

return {
	GUI = G2L["DarkAdmin_1"],
	AddCmd = function(data) return CommandSystem:AddCmd(data) end
}
