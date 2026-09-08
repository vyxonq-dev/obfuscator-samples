local TextChatService = game:GetService("TextChatService")
local UserInputService = game:GetService("UserInputService")
local safeChatData = loadstring(game:HttpGet("https://raw.githubusercontent.com/mehh0vcki/scripts/refs/heads/main/static/safechat/".. _G.safeChatVersion ..".lua"))()

-- [FUNCTIONS]
local function instanceNewData(datatype: string, properties: table)
	local Item = Instance.new(datatype)
	if Item then
		for property, value in pairs(properties) do
			Item[property] = value
		end
	end
	return Item
end

local function resetElement(element)
    if element:IsA("Frame") then
        element.Visible = false
    elseif element:IsA("TextButton") then
        element.BackgroundColor3 = Color3.new(1, 1, 1)
    end
    for _, child in pairs(element:GetChildren()) do
        resetElement(child)
    end
end

-- [ELEMENTS]
local SafeChatGUI = instanceNewData("ScreenGui", { -- [SCREENGUI]
    Name="SafeChatGUI", 
    Parent=game.CoreGui
})

local SafeChatFrame = instanceNewData("Frame", {
    Name = "SafeChatFrame",
    BackgroundTransparency = 1,
    AnchorPoint = Vector2.new(0, 1),
    Position = UDim2.fromScale(0, 1),
    Size = UDim2.fromScale(1, 1),
    Parent = SafeChatGUI
})

local UIAspectRatio = instanceNewData("UIAspectRatioConstraint", {
    Name = "UIAspectRatio",
    AspectRatio = 1.333,
    Parent = SafeChatFrame
})

local Templates = instanceNewData("Folder", { -- [TEMPLATES]
    Name = "Templates",
    Parent = SafeChatFrame
})

local TempBranch = instanceNewData("Frame", {
    Name = "TempBranch",
    AnchorPoint = Vector2.new(0, 0.5),
    BackgroundTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    BorderColor3 = Color3.fromRGB(27, 42, 53),
    BorderSizePixel = 1,
    Position = UDim2.new(1, 5, 0.5, 0),
    Size = UDim2.fromOffset(140, 24),
    ZIndex = 2,
    Parent = Templates,
    Visible = false
})

local UIListLayout = instanceNewData("UIListLayout", {
	Padding = UDim.new(0, 5),
    SortOrder = Enum.SortOrder.LayoutOrder,
	VerticalAlignment = Enum.VerticalAlignment.Center,
    Parent = TempBranch
})

local TempButton = instanceNewData("TextButton", {
    Name = "TempButton",
    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    BorderColor3 = Color3.fromRGB(62, 62, 62),
    BorderSizePixel = 1,
    Position = UDim2.fromScale(0,0),
    Size = UDim2.fromOffset(140, 24),
    ZIndex = 2,
	Font = Enum.Font.Cartoon,
    TextSize = 12,
    TextStrokeTransparency = 0.95,
    TextTransparency = 0.25,
    Parent = Templates,
    Visible = false
})

local ChatButton = instanceNewData("ImageButton", { -- [CHATBUTTON]
    Name = "ChatButton",
    BackgroundTransparency = 1,
    Position = UDim2.fromScale(0.02, 0.535),
    Size = UDim2.fromOffset(32, 32),
    Image = "rbxassetid://991182833",
    Parent = SafeChatFrame
})

local Click = instanceNewData("Sound", {
    Name = "Click",
    SoundId = "rbxasset://sounds/switch.mp3",
    Volume = 0.5,
    Parent = ChatButton
})

local Hint = instanceNewData("ImageLabel", {
    Name = "Hint",
    AnchorPoint = Vector2.new(0.5, 0.75),
    BackgroundTransparency = 1,
    Position = UDim2.new(1, 5, 0, 0),
    Size = UDim2.fromScale(0.75, 0.75),
    Image = "rbxasset://textures/ui/Settings/Help/XButtonDark@2x.png",
    Parent = ChatButton
}) -- it was pain to type it all out

-- [SETUP]
local chatNavigation
local isChatHovered = false

local function buildChatTree(chatNode)
		local branchFrame = TempBranch:Clone()
		branchFrame.Name = "Branches"
		local selectedButton = nil

		for index, branch in ipairs(chatNode.Branches) do
			local label = branch.Label
			local button = TempButton:Clone()
			button.Name = label
			button.Text = label
			button.LayoutOrder = index
			button.Visible = true

			local subBranchFrame = buildChatTree(branch)
			subBranchFrame.Parent = button
			button.Parent = branchFrame

			local function highlightButton()
				if selectedButton then
					resetElement(selectedButton)
				end
				selectedButton = button
				button.BackgroundColor3 = Color3.new(0.7, 0.7, 0.7)
				subBranchFrame.Visible = true
			end

			local function onButtonClick()
				local shouldSendMessage = true
				if UserInputService.TouchEnabled and not subBranchFrame.Visible and #subBranchFrame:GetChildren() > 1 then
					subBranchFrame.Visible = true
					shouldSendMessage = false
				end
				if shouldSendMessage then
					local textChannel = TextChatService:FindFirstChild("RBXGeneral", true)
					if textChannel and textChannel:IsA("TextChannel") then
						textChannel:SendAsync(label)
					end
					Click:Play()
					ChatButton.Image = "rbxassetid://991182833"
					resetElement(chatNavigation)
				end
			end

			button.MouseEnter:Connect(highlightButton)
			button.SelectionGained:Connect(highlightButton)
			button.MouseButton1Down:Connect(onButtonClick)
		end
		return branchFrame
	end

chatNavigation = buildChatTree(safeChatData)
chatNavigation.Parent = ChatButton

ChatButton.MouseEnter:Connect(function()
    ChatButton.Image = "rbxassetid://991182834"
    isChatHovered = true
end)

ChatButton.MouseLeave:Connect(function()
    ChatButton.Image = "rbxassetid://991182833"
    isChatHovered = false
end)

ChatButton.MouseButton1Down:Connect(function()
    ChatButton.Image = "rbxassetid://991182832"
    if isChatHovered then
        chatNavigation.Visible = not chatNavigation.Visible
        ChatButton.Image = "rbxassetid://991182832"
    end
end)

-- [CLEAN UP]
UserInputService.InputBegan:Connect(function(input, proceeded)
    if proceeded then return end
    if input.KeyCode == _G.keyToDestroy then
        SafeChatGUI:Destroy()
        script.Enabled = false
    end
end)
