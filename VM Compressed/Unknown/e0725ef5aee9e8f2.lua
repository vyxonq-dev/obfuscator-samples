--[[ # RBLX CMD # ]]--

Settings = {
	["VERSION"] = "v1.00",
	["MAKER"] = "SKONDO",
}

--[[ # FUNCS # ]]--

function get()
	plr = game:GetService("Players").LocalPlayer
	char = plr.Character
	hrp = char.HumanoidRootPart
	hum = char.Humanoid
end
get()
plr.CharacterAdded:Connect(function()
	get()
end)
local function roundCorners(gui, radius)
	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, radius)
	corner.Parent = gui
end
local function executeCommand(cmd, outputLabel)
	if cmd:lower() == "$$help" then
		outputLabel.Text = [[
1. $$help - for help
2. cls - to clear prompt
3. $$creator - shows creator
4. $$special-dex - will show my special dex
5. $$old-dex - will show old dex
6. $$dump-game - will dump the entire game for you in clipboard
7. $$inf-yeild - starts up infinite yield
8. $$old-console - starts up the old console on roblox
9. $$reset - makes you reset
10. $$rejoin-voice - rejoins voice, bypassing roblox's system
11. $$getgameinfo - gets the games info on clipboard
]]
		return
	end
	if cmd:lower() == "cls" then
		outputLabel.Text = "> "
		return
	end
	if cmd:lower() == "$$reset" then
		reset = function()	repeat hum.Health = 0 task.wait(0.1) char:BreakJoints() until Hum.Health == 0	end
		reset()
	end
	if cmd:lower() == "$$creator" then
		print(Settings["MAKER"])
	end
	if cmd:lower() == "$$special-dex" then
		return(function(LOL, THIS, WAS, MADE, AS, A, JOKE) loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/Misc/refs/heads/main/dex.lua"))() end)()
	end
	if cmd:lower() == "$$old-dex" then
		return(function(OLD, ASS, DEX, EXPLORER) loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/Misc/refs/heads/main/olddex.lua"))() end)()
	end
	if cmd:lower() == "$$dump-game" then
		return(function(...) loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/Misc/refs/heads/main/dumper.lua"))() end)()
	end
	if cmd:lower() == "$$inf-yeild" then
		return(function(...) loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end)()
	end
	if cmd:lower() == "$$inf-yeild-Remake" then
		return(function(...) loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/Misc/refs/heads/main/infyeild_remake.lua"))() end)()
	end
	if cmd:lower() == "$$old-console" then
		return(function(...) loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/Misc/refs/heads/main/console.lua"))() end)()
	end
	if cmd:lower() == "$$rejoin-voice" then
		bypassvoice = function()	game:GetService("VoiceChatService"):joinVoice()	end
		bypassvoice()
	end
	if cmd:lower() == "$$getgameinfo" then
		local function gameinfo()
			local market = game:GetService("MarketplaceService")
			local info = {}
			
			local success, result = pcall(function()
				return market:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
			end)

			if success then
				info = {
					"JobId Is: " .. game.JobId,
					"PlaceId Is: " .. game.PlaceId,
					"Game Name Is: " .. result.Name,
					"Description Is: " .. result.Description,
					"Created On: " .. result.Created,
					"Last Updated: " .. result.Updated,
					"Creator Name: " .. result.Creator.Name,
					"Creator Type: " .. result.Creator.CreatorType,
					"Creator ID: " .. result.CreatorTargetId,
					"AssetTypeId: " .. result.AssetTypeId,
					"Is For Sale: " .. tostring(result.IsForSale),
					"Price In Robux: " .. tostring(result.PriceInRobux),
					"Sales: " .. tostring(result.Sales),
					"Minimum Membership Level: " .. tostring(result.MinimumMembershipLevel),
					"ProductId: " .. tostring(result.ProductId),
					"IconImageAssetId: " .. tostring(result.IconImageAssetId)
				}
			else
				info = {
					"Failed to retrieve game info.",
					"Error: " .. tostring(result)
				}
			end

			return info
		end	

		local combined = table.concat(gameinfo(), "\n")
		setclipboard(combined)
	end
	outputLabel.Text = outputLabel.Text .. "\n> " .. cmd
	local success, result = pcall(loadstring(cmd))
	
	if success then
		if result ~= nil then
			outputLabel.Text = outputLabel.Text .. "\n" .. tostring(result)
		end
	else
		outputLabel.Text = outputLabel.Text .. "\n[Error] " .. tostring(result)
	end

	outputLabel.Text = outputLabel.Text .. "\n> "
end
function makeui()
	local mainWindow = Instance.new("ScreenGui")
	local mainFrame = Instance.new("Frame")
	local titleBar = Instance.new("Frame")
	local titleText = Instance.new("TextLabel")
	local closeButton = Instance.new("TextButton")
	local outputScroller = Instance.new("ScrollingFrame")
	local outputLabel = Instance.new("TextLabel")
	local inputBar = Instance.new("Frame")
	local promptText = Instance.new("TextLabel")
	local inputBox = Instance.new("TextBox")
	mainWindow.Name = "CMD_Prompt"
	mainWindow.Parent = game.CoreGui
	mainWindow.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	mainFrame.Name = "MainFrame"
	mainFrame.Parent = mainWindow
	mainFrame.BackgroundColor3 = Color3.new(0, 0, 0) 
	mainFrame.BorderSizePixel = 0
	mainFrame.Position = UDim2.new(0.3, 0, 0.3, 0)
	mainFrame.Size = UDim2.new(0, 500, 0, 300)
	titleBar.Name = "TitleBar"
	titleBar.Parent = mainFrame
	titleBar.BackgroundColor3 = Color3.new(1, 1, 1)
	titleBar.Size = UDim2.new(1, 0, 0, 25)
	titleBar.ZIndex = 2
	titleText.Name = "TitleText"
	titleText.Parent = titleBar
	titleText.BackgroundTransparency = 1
	titleText.Size = UDim2.new(1, -30, 1, 0)
	titleText.Font = Enum.Font.SourceSans
	titleText.Text = "Cmd " .. Settings.VERSION
	titleText.TextColor3 = Color3.new(0, 0, 0)  -- Black text
	titleText.TextSize = 14
	titleText.TextXAlignment = Enum.TextXAlignment.Left
	titleText.TextTruncate = Enum.TextTruncate.AtEnd
	closeButton.Name = "CloseButton"
	closeButton.Parent = titleBar
	closeButton.BackgroundTransparency = 1
	closeButton.Position = UDim2.new(1, -25, 0, 0)
	closeButton.Size = UDim2.new(0, 25, 1, 0)
	closeButton.Font = Enum.Font.SourceSansBold
	closeButton.Text = "X"
	closeButton.TextColor3 = Color3.new(0, 0, 0)
	closeButton.TextSize = 14
	closeButton.MouseButton1Click:Connect(function()
		mainWindow:Destroy()
	end)
	local dragStart = nil
	local startPos = nil
	titleBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragStart = input.Position
			startPos = mainFrame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragStart = nil
				end
			end)
		end
	end)
	titleBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement and dragStart then
			local delta = input.Position - dragStart
			mainFrame.Position = UDim2.new(
				startPos.X.Scale, 
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
	outputScroller.Name = "OutputScroller"
	outputScroller.Parent = mainFrame
	outputScroller.BackgroundTransparency = 1
	outputScroller.Position = UDim2.new(0, 0, 0, 25)
	outputScroller.Size = UDim2.new(1, 0, 1, -30)
	outputScroller.CanvasSize = UDim2.new(0, 0, 2, 0)
	outputScroller.ScrollBarThickness = 8
	outputScroller.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	outputScroller.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
	outputScroller.ScrollBarImageColor3 = Color3.new(0.5, 0.5, 0.5)
	outputLabel.Name = "OutputLabel"
    outputLabel.Parent = outputScroller
    outputLabel.BackgroundTransparency = 1
    outputLabel.Size = UDim2.new(1, -10, 0, 0)
    outputLabel.AutomaticSize = Enum.AutomaticSize.Y
    outputLabel.Font = Enum.Font.Code
    outputLabel.Text = "Initializing command prompt..."  -- Initial text
    outputLabel.TextColor3 = Color3.new(1, 1, 1)
    outputLabel.TextSize = 16
    outputLabel.TextXAlignment = Enum.TextXAlignment.Left
    outputLabel.TextYAlignment = Enum.TextYAlignment.Top
    outputLabel.TextWrapped = true
	inputBar.Name = "InputBar"
	inputBar.Parent = mainFrame
	inputBar.BackgroundColor3 = Color3.new(0, 0, 0) 
	inputBar.Position = UDim2.new(0, 0, 1, -30)
	inputBar.Size = UDim2.new(1, 0, 0, 30)
	inputBar.BorderSizePixel = 0
	inputBar.Visible = false
	local function loadingAnimation()
        local loadingComplete = false
        local dots = ""
		coroutine.wrap(function()
            for percent = 0, 100, 2 do  -- Increment by 2% each step
                if loadingComplete then break end
                
                dots = dots .. "."
                if #dots > 3 then dots = "" end
                
                outputLabel.Text = string.format("Loading system modules %s [%d%%]", dots, percent)
                task.wait(0.05)
            end
			if not loadingComplete then
                -- Final welcome message after loading
                outputLabel.Text = "Microsoft Windows [Version 10.0.19042.928]\n"..
                                   "(c) Microsoft Corporation. All rights reserved.\n\n> "
                inputBar.Visible = true
                inputBox:CaptureFocus()
            end
        end)()
		return function() 
            loadingComplete = true 
        end
    end
	loadingAnimation()
	promptText.Name = "PromptText"
	promptText.Parent = inputBar
	promptText.BackgroundTransparency = 1
	promptText.Position = UDim2.new(0, 5, 0, 0)
	promptText.Size = UDim2.new(0, 15, 1, 0)
	promptText.Font = Enum.Font.Code
	promptText.Text = ">"
	promptText.TextColor3 = Color3.new(1, 1, 1) 
	promptText.TextSize = 16
	inputBox.Name = "InputBox"
	inputBox.Parent = inputBar
	inputBox.BackgroundColor3 = Color3.new(0, 0, 0)
	inputBox.BorderSizePixel = 0
	inputBox.Position = UDim2.new(0, 25, 0, 5)
	inputBox.Size = UDim2.new(1, -30, 1, -10)
	inputBox.Font = Enum.Font.Code
	inputBox.TextColor3 = Color3.new(1, 1, 1) 
	inputBox.TextSize = 16
	inputBox.TextXAlignment = Enum.TextXAlignment.Left
	inputBox.ClearTextOnFocus = false
	inputBox.PlaceholderText = "type your cmd here"
	inputBox.PlaceholderColor3 = Color3.new(0.7, 0.7, 0.7)
	inputBox.Text = ""
	inputBox.Focused:Connect(function()
		inputBox.PlaceholderText = ""
	end)
	inputBox.FocusLost:Connect(function()
		inputBox.PlaceholderText = "type your cmd here"
	end)
	inputBox.FocusLost:Connect(function(enterPressed)
		if enterPressed then
			local cmd = inputBox.Text
			inputBox.Text = ""
			
			if #cmd > 0 then
				executeCommand(cmd, outputLabel)
			end
		end
	end)
	inputBox:CaptureFocus()
end

--[[ # START # ]]--

loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/Misc/refs/heads/main/watermark.lua"))()

return(function(...)
	makeui()
end)()
