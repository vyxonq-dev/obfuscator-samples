-- [[ BLOXY PARADOX PROJECT BY @MOCCAPAZZA ON YOUTUBE ]] --

----------------------------------------------------------------------------------------------------
-- [[ BUTTONS FUNCTIONS INSERTION AREA FOR EASIER BUGFIXES ]] --
----------------------------------------------------------------------------------------------------
local MyScripts = {
	Topbar_2020    = [[ local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local UIS = game:GetService("UserInputService")
local LocalizationService = game:GetService("LocalizationService")
local GuiService = game:GetService("GuiService")
local VirtualInputManager = game:GetService("VirtualInputManager") -- Added for hardware emulation
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local Backpack = LocalPlayer:WaitForChild("Backpack")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")

pcall(function()
    local topbar = CoreGui:FindFirstChild("TopBarApp")
    if topbar then topbar:Destroy() end

    local expChat = CoreGui:FindFirstChild("ExperienceChat")
    if expChat then expChat:Destroy() end
end)

local player = game.Players.LocalPlayer
local pg = player:WaitForChild("PlayerGui")

local chatGui = pg:FindFirstChild("Chat")
if chatGui then
    chatGui:Destroy()
    print("Removed game Chat GUI from PlayerGui.")
else
    print("No Chat GUI found in PlayerGui; nothing to remove.")
end

if not game:IsLoaded() then
	game.Loaded:Wait()
end

local TextChatService = game:GetService("TextChatService")

game:GetObjects("rbxassetid://122252029612413")[1].Parent = workspace

local rbxmSuite = loadstring(
	game:HttpGetAsync("https://github.com/richie0866/rbxm-suite/releases/latest/download/rbxm-suite.lua")
)()

task.wait()

local project = rbxmSuite.launch("rbxassetid://111872120766790", {
	runscripts = true,
	deferred = true,
	nocache = false,
	nocirculardeps = true,
	debug = true,
	verbose = false,
})

local SettingsRoot = Instance.new("Frame")
SettingsRoot.Name = "SettingsRoot"
SettingsRoot.Parent = RobloxGui
SettingsRoot.Position = UDim2.new(0, 0, 0, -60)
SettingsRoot.Size = UDim2.new(1, 0, 1, 0)
SettingsRoot.BackgroundTransparency = 1
SettingsRoot.ZIndex = 4

local SettingsShield = Instance.new("Frame")
SettingsShield.Name = "SettingsShield"
SettingsShield.Parent = SettingsRoot
SettingsShield.Active = true
SettingsShield.Size = UDim2.new(1, 0, 1, 60)
SettingsShield.BackgroundColor3 = Color3.fromRGB(41, 41, 41)
SettingsShield.BackgroundTransparency = 0.2
SettingsShield.ZIndex = 5

local shieldHeight = SettingsShield.AbsoluteSize.Y
local closedPos = UDim2.new(0, 0, 0, -shieldHeight)
local openPos = UDim2.new(0, 0, 0, 0)
SettingsShield.Position = closedPos

local DontorNo = Instance.new("Frame")
DontorNo.Name = "DontorNo"
DontorNo.Parent = SettingsShield
DontorNo.Position = UDim2.new(0.18, 0, 0.5, 0)
DontorNo.Size = UDim2.new(0, 520, 0, 70)
DontorNo.BackgroundTransparency = 1
DontorNo.Visible = false
DontorNo.ZIndex = 1

local BottomButtonFrame = Instance.new("Frame")
BottomButtonFrame.Name = "BottomButtons"
BottomButtonFrame.Parent = SettingsShield
BottomButtonFrame.Position = UDim2.new(0.5, -400, 1, -84)
BottomButtonFrame.Size = UDim2.new(0, 800, 0, 60)
BottomButtonFrame.BackgroundTransparency = 1
BottomButtonFrame.ZIndex = 6

local function MakeButton(name, offX, text)
    local btn = Instance.new("ImageButton")
    btn.Name = name
    btn.Parent = BottomButtonFrame
    btn.Position = UDim2.new(0.5, offX, 0.5, -25)
    btn.Size = UDim2.new(0, 260, 0, 70)
    btn.BackgroundTransparency = 1
    btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
    btn.ScaleType = Enum.ScaleType.Slice
    btn.SliceCenter = Rect.new(6, 6, 46, 44)
    btn.ZIndex = 7

    local label = Instance.new("TextLabel")
    label.Parent = btn
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.new(1,1,1)
    label.Font = Enum.Font.SourceSansBold
    label.TextSize = 28
    label.ZIndex = 8

    if name == "LeaveGameButton" then
        task.spawn(function()
            pcall(function()
                local translator = LocalizationService:GetTranslatorForPlayerAsync(LocalPlayer)
                if translator then
                    label.Text = translator:TranslateByKey("InGame.HelpMenu.LeaveGame")
                end
            end)
        end)
    end

    btn.MouseEnter:Connect(function()
        btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
    end)
    btn.MouseLeave:Connect(function()
        btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
    end)

    btn.MouseButton1Down:Connect(function()
        btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
    end)
    btn.MouseButton1Up:Connect(function()
        btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
    end)

    return btn
end

local LeaveButton  = MakeButton("LeaveGameButton",      -400, "Leave Game")
local ResetButton  = MakeButton("ResetCharacterButton", -130, "Reset Character")
local ResumeButton = MakeButton("ResumeButton",          140, "Resume")

local function MakeConfirmButton(name, offX, text)
	local btn = Instance.new("ImageButton")
	btn.Name = name
	btn.Parent = DontorNo
	btn.Position = UDim2.new(0.5, offX, 1, -84)
	btn.Size = UDim2.new(0, 260, 0, 70)
	btn.BackgroundTransparency = 1
	btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
	btn.ScaleType = Enum.ScaleType.Slice
	btn.SliceCenter = Rect.new(6, 6, 46, 44)
	btn.ZIndex = 7

	local label = Instance.new("TextLabel")
	label.Parent = btn
	label.Size = UDim2.new(1,0,1,0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.Font = Enum.Font.SourceSansBold
	label.TextSize = 28
	label.TextColor3 = Color3.new(1,1,1)
	label.ZIndex = 8

    if name == "ConfirmLeave" then
        task.spawn(function()
            pcall(function()
               local translator = LocalizationService:GetTranslatorForPlayerAsync(LocalPlayer)
                if translator then
                    label.Text = translator:TranslateByKey("InGame.HelpMenu.Leave")
                end
            end)
        end)
    end

    btn.MouseEnter:Connect(function()
        btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
    end)
    btn.MouseLeave:Connect(function()
        btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
    end)

	btn.MouseButton1Down:Connect(function()
		btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
	end)

	btn.MouseButton1Up:Connect(function()
		btn.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
	end)

	return btn
end

local DontResetButton = MakeConfirmButton("DontReset", -150, "Don't Reset")
local ConfirmResetBtn = MakeConfirmButton("ConfirmReset", 150, "Reset")
local DontLeaveButton = MakeConfirmButton("DontLeave", -150, "Don't Leave")
local ConfirmLeaveBtn = MakeConfirmButton("ConfirmLeave", 150, "Leave")

local TopBar = Instance.new("Frame")
TopBar.Name = "TopBarContainer"
TopBar.Parent = RobloxGui
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.Position = UDim2.new(0, 0, 0, -45)
TopBar.BackgroundTransparency = 1
TopBar.ZIndex = 10

local SettingsApp = Instance.new("ImageButton")
SettingsApp.Name = "Settings"
SettingsApp.Parent = TopBar
SettingsApp.Position = UDim2.new(0, 5, 0, 0)
SettingsApp.Size = UDim2.new(0, 38, 0, 38)
SettingsApp.BackgroundTransparency = 0.5
SettingsApp.BackgroundColor3 = Color3.new(0,0,0)
SettingsApp.ZIndex = 11

local SettingsIcon = Instance.new("ImageLabel")
SettingsIcon.Parent = SettingsApp
SettingsIcon.Size = UDim2.new(1, -7, 1, -7)
SettingsIcon.Position = UDim2.new(0, 3, 0, 3)
SettingsIcon.BackgroundTransparency = 1
SettingsIcon.Image = "rbxassetid://14874733468"
SettingsIcon.ZIndex = 12

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0.2,0)
corner.Parent = SettingsApp

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = TopBar
CloseButton.Size = UDim2.new(0, 38, 0, 38)
CloseButton.Position = UDim2.new(0, 5, 0, 0)
CloseButton.BackgroundColor3 = Color3.new(1,1,1)
CloseButton.Text = "X"
CloseButton.Visible = false
CloseButton.TextColor3 = Color3.new(0,0,0)
CloseButton.Font = Enum.Font.SourceSansBold
CloseButton.TextSize = 25
CloseButton.ZIndex = 16

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0.2,0)
closeCorner.Parent = CloseButton

local chatOpen = false
local chatGuiContainer = PlayerGui:WaitForChild("Chat")
local realFrame = chatGuiContainer:WaitForChild("Frame")
realFrame.Visible = false

local ChatApp = Instance.new("ImageButton")
ChatApp.Name = "Chat"
ChatApp.Parent = TopBar
ChatApp.Position = UDim2.new(0, 55, 0, 0)
ChatApp.Size = UDim2.new(0, 38, 0, 38)
ChatApp.BackgroundTransparency = 0.5
ChatApp.BackgroundColor3 = Color3.new(0,0,0)
ChatApp.ZIndex = 11

local ChatIcon = Instance.new("ImageLabel")
ChatIcon.Parent = ChatApp
ChatIcon.Size = UDim2.new(1, 0, 1, 0)
ChatIcon.BackgroundTransparency = 1
ChatIcon.Image = "rbxassetid://15839118471"
ChatIcon.ZIndex = 12

local chatCorner = Instance.new("UICorner")
chatCorner.CornerRadius = UDim.new(0.2,0)
chatCorner.Parent = ChatApp

local unreadCount = 0

local BadgeBorder = Instance.new("Frame")
BadgeBorder.Name = "BadgeOuterCircle"
BadgeBorder.Parent = ChatApp
BadgeBorder.Size = UDim2.new(0, 20, 0, 20)
BadgeBorder.Position = UDim2.new(1, -13, 0, -6)
BadgeBorder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BadgeBorder.Visible = false
BadgeBorder.ZIndex = 14

local BorderCorner = Instance.new("UICorner")
BorderCorner.CornerRadius = UDim.new(1, 0)
BorderCorner.Parent = BadgeBorder

local BadgeContainer = Instance.new("Frame")
BadgeContainer.Name = "BadgeInnerCircle"
BadgeContainer.Parent = BadgeBorder
BadgeContainer.Size = UDim2.new(1, -3, 1, -3)
BadgeContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
BadgeContainer.AnchorPoint = Vector2.new(0.5, 0.5)
BadgeContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BadgeContainer.ZIndex = 15

local BadgeCorner = Instance.new("UICorner")
BadgeCorner.CornerRadius = UDim.new(1, 0)
BadgeCorner.Parent = BadgeContainer

local BadgeLabel = Instance.new("TextLabel")
BadgeLabel.Name = "Amount"
BadgeLabel.Parent = BadgeContainer
BadgeLabel.Size = UDim2.new(1, 0, 1, 0)
BadgeLabel.Position = UDim2.new(0.5, 0, 0.5, -1)
BadgeLabel.AnchorPoint = Vector2.new(0.5, 0.5)
BadgeLabel.BackgroundTransparency = 1
BadgeLabel.Text = "0"
BadgeLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
BadgeLabel.Font = Enum.Font.SourceSansBold
BadgeLabel.TextSize = 15
BadgeLabel.ZIndex = 16

local function updateChatBadge()
    if chatOpen or unreadCount == 0 then
        BadgeBorder.Visible = false
    else
        BadgeBorder.Visible = true
        if unreadCount >= 100 then
            BadgeLabel.Text = "99+"
            BadgeLabel.TextSize = 10
        elseif unreadCount >= 10 then
            BadgeLabel.Text = tostring(unreadCount)
            BadgeLabel.TextSize = 12
        else
            BadgeLabel.Text = tostring(unreadCount)
            BadgeLabel.TextSize = 15
        end
    end
end

local chatEvents = chatGuiContainer:FindFirstChild("Frame") and chatGuiContainer.Frame:FindFirstChild("ChatChannelParentFrame")
if chatGuiContainer:FindFirstChild("MessageLogDisplay") then
    chatGuiContainer.MessageLogDisplay.ChildAdded:Connect(function()
        if not chatOpen then
            unreadCount = unreadCount + 1
            updateChatBadge()
        end
    end)
end

TextChatService.MessageReceived:Connect(function()
    if not chatOpen then
        unreadCount = unreadCount + 1
        updateChatBadge()
    end
end)

ChatApp.MouseButton1Click:Connect(function()
    chatOpen = not chatOpen
    realFrame.Visible = chatOpen

    if chatOpen then
        unreadCount = 0
        updateChatBadge()
    end

    ChatIcon.Image = chatOpen 
        and "rbxassetid://15839116089"
        or "rbxassetid://15839118471"
end)

local MoreOpen = false

local MoreApp = Instance.new("ImageButton")
MoreApp.Name = "More"
MoreApp.Parent = TopBar
MoreApp.Position = UDim2.new(1, -43, 0, 0)
MoreApp.Size = UDim2.new(0, 38, 0, 38)
MoreApp.BackgroundTransparency = 0.5
MoreApp.BackgroundColor3 = Color3.new(0,0,0)
MoreApp.ZIndex = 11

local MoreIcon = Instance.new("ImageLabel")
MoreIcon.Parent = MoreApp
MoreIcon.Size = UDim2.new(1, -2, 1, -2)
MoreIcon.Position = UDim2.new(0, 1, 0, 1)
MoreIcon.BackgroundTransparency = 1
MoreIcon.Image = "rbxassetid://136279431647973"
MoreIcon.ZIndex = 12

local moreCorner = Instance.new("UICorner")
moreCorner.CornerRadius = UDim.new(0.2,0)
moreCorner.Parent = MoreApp

local WipGui = Instance.new("ScreenGui")
WipGui.Name = "Wip"
WipGui.Parent = MoreApp
WipGui.Enabled = false

local MoreFrame = Instance.new("ScrollingFrame")
MoreFrame.Name = "MoreFrame"
MoreFrame.Size = UDim2.new(0, 300, 0, 150)
MoreFrame.Position = UDim2.new(1, -305, 0, 0)
MoreFrame.BackgroundColor3 = Color3.fromRGB(0,0,0)
MoreFrame.BackgroundTransparency = 0.3
MoreFrame.CanvasSize = UDim2.new(0, 0, 0, 200)
MoreFrame.Parent = WipGui

local MoreCornerFrame = Instance.new("UICorner")
MoreCornerFrame.CornerRadius = UDim.new(0.1,0)
MoreCornerFrame.Parent = MoreFrame

local function CreateMoreButton(parent, name, iconId, text, yOffset)
    local btn = Instance.new("ImageButton")
    btn.Name = name
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.Position = UDim2.new(0, 0, 0, yOffset)
    btn.BackgroundTransparency = 1
    btn.Parent = parent

    local icon = Instance.new("ImageLabel")
    icon.Name = name.."Icon"
    icon.Size = UDim2.new(0, 45, 0, 45)
    icon.Position = UDim2.new(0, 10, 0, 0)
    icon.BackgroundTransparency = 1
    icon.Image = iconId
    icon.Parent = btn

    local label = Instance.new("TextLabel")
    label.Name = name.."Text"
    label.Parent = btn
    label.Size = UDim2.new(1, -70, 0, 50)
    label.Position = UDim2.new(0, 70, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.Font = Enum.Font.GothamBold
    label.TextSize = 18
    label.TextColor3 = Color3.fromRGB(230, 230, 230)
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextYAlignment = Enum.TextYAlignment.Center

    local hover = Instance.new("Frame")
    hover.Size = UDim2.new(1, 0, 1, 0)
    hover.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    hover.BackgroundTransparency = 0.9
    hover.BorderSizePixel = 0
    hover.Parent = btn
    hover.ZIndex = 0

    btn.MouseEnter:Connect(function()
        hover:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), "Out", "Quad", 0.15, true)
        hover.BackgroundTransparency = 0.85
    end)
    btn.MouseLeave:Connect(function()
        hover:TweenSizeAndPosition(UDim2.new(1,0,1,0), UDim2.new(0,0,0,0), "Out", "Quad", 0.15, true)
        hover.BackgroundTransparency = 0.9
    end)

    return btn
end

local yStart = 10
local spacing = 55
local LeaderboardBtn = CreateMoreButton(MoreFrame, "Leaderboard", "rbxassetid://81047217774682", "Leaderboard", yStart)
local InventoryBtn   = CreateMoreButton(MoreFrame, "Inventory",   "rbxassetid://7743874651", "Inventory", yStart + spacing)
local EmotesBtn      = CreateMoreButton(MoreFrame, "Emotes",      "rbxassetid://6031071050", "Emotes", yStart + spacing*2)

MoreApp.MouseButton1Click:Connect(function()
    MoreOpen = not MoreOpen
    WipGui.Enabled = MoreOpen
    MoreIcon.Image = MoreOpen 
        and "rbxassetid://110209751814466"
        or "rbxassetid://136279431647973"
end)

LeaderboardBtn.MouseButton1Click:Connect(function() end)

EmotesBtn.MouseButton1Click:Connect(function()
    pcall(function()
        local isAlreadyOpen = GuiService:GetEmotesMenuOpen()
        GuiService:SetEmotesMenuOpen(not isAlreadyOpen)
    end)
    MoreOpen = false
    WipGui.Enabled = false
    MoreIcon.Image = "rbxassetid://136279431647973"
end)

local HubBar = Instance.new("ImageLabel")
HubBar.Name = "HubBar"
HubBar.Parent = SettingsShield
HubBar.SliceCenter = Rect.new(4, 4, 6, 6)
HubBar.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuBackground.png"
HubBar.Position = UDim2.new(0.5, -400, 0, 65)
HubBar.Size = UDim2.new(0, 800, 0, 60)
HubBar.BackgroundTransparency = 1
HubBar.ScaleType = Enum.ScaleType.Slice
HubBar.ZIndex = 7

local PageViewClipper = Instance.new("Frame")
PageViewClipper.Name = "PageViewClipper"
PageViewClipper.Parent = SettingsShield
PageViewClipper.Position = UDim2.new(0.5, -400, 0.5, -228.5)
PageViewClipper.Size = UDim2.new(0, 800, 0, 490)
PageViewClipper.BackgroundTransparency = 1
PageViewClipper.ZIndex = 7

local PageView = Instance.new("Frame")
PageView.Parent = PageViewClipper
PageView.Size = UDim2.new(1,0,1,0)
PageView.BackgroundTransparency = 1

local ThumbCache = {}

local PlayersPage = Instance.new("ScrollingFrame")
PlayersPage.Parent = PageView
PlayersPage.Position = UDim2.new(0,0,0,10)
PlayersPage.Size = UDim2.new(1,0,1,-10)
PlayersPage.CanvasSize = UDim2.new(0,0,0,0)
PlayersPage.ScrollBarImageTransparency = 0.3
PlayersPage.BackgroundTransparency = 1
PlayersPage.AutomaticCanvasSize = Enum.AutomaticSize.None

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0,10)
layout.Parent = PlayersPage

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	PlayersPage.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y+10)
end)

local function getThumb(id)
	if ThumbCache[id] then
		return ThumbCache[id]
	end
	local img = Players:GetUserThumbnailAsync(
		id,
		Enum.ThumbnailType.AvatarThumbnail,
		Enum.ThumbnailSize.Size352x352
	)
	ThumbCache[id] = img
	return img
end

local function CreatePlayerEntry(plr)
	if plr == Players.LocalPlayer then return end

	local Row = Instance.new("Frame")
	Row.Size = UDim2.new(1,0,0,60)
	Row.BackgroundTransparency = 1
	Row.Parent = PlayersPage

	local BG = Instance.new("ImageLabel")
	BG.Size = UDim2.new(1,0,1,0)
	BG.Image = "rbxasset://textures/ui/dialog_white.png"
	BG.ScaleType = Enum.ScaleType.Slice
	BG.SliceCenter = Rect.new(10,10,10,10)
	BG.ImageTransparency = 0.85
	BG.BackgroundTransparency = 1
	BG.Parent = Row

	local Icon = Instance.new("ImageLabel")
	Icon.Size = UDim2.new(0,36,0,36)
	Icon.Position = UDim2.new(0,12,0.5,-18)
	Icon.BackgroundTransparency = 1
	Icon.Parent = Row

	task.spawn(function()
		Icon.Image = getThumb(plr.UserId)
	end)

	local Name = Instance.new("TextLabel")
	Name.Size = UDim2.new(0.5,0,1,0)
	Name.Position = UDim2.new(0,60,0,0)
	Name.BackgroundTransparency = 1
	Name.Text = plr.DisplayName
	Name.TextXAlignment = Enum.TextXAlignment.Left
	Name.TextColor3 = Color3.new(1,1,1)
	Name.TextSize = 20
	Name.Font = Enum.Font.SourceSansBold
	Name.Parent = Row

	local Add = Instance.new("ImageButton")
	Add.Size = UDim2.new(0,190,0,50)
	Add.Position = UDim2.new(1,-225,0.5,-25)
	Add.BackgroundTransparency = 1
	Add.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
	Add.ScaleType = Enum.ScaleType.Slice
	Add.SliceCenter = Rect.new(6,6,46,44)
	Add.Parent = Row

	local AddText = Instance.new("TextLabel")
	AddText.Size = UDim2.new(1,0,1,0)
	AddText.BackgroundTransparency = 1
	AddText.TextColor3 = Color3.new(1,1,1)
	AddText.TextSize = 24
	AddText.Font = Enum.Font.SourceSansBold
	AddText.Parent = Add

    Add.MouseEnter:Connect(function()
        if Add.Active then
            Add.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButtonSelected.png"
        end
    end)
    Add.MouseLeave:Connect(function()
        Add.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
    end)

	local function refresh()
		if Players.LocalPlayer:IsFriendsWith(plr.UserId) then
			AddText.Text = "Friends"
			Add.Active = false
		else
			AddText.Text = "Add Friend"
			Add.Active = true
		end
	end

	refresh()

	Add.MouseButton1Click:Connect(function()
		if not Players.LocalPlayer:IsFriendsWith(plr.UserId) then
			StarterGui:SetCore("PromptSendFriendRequest",plr)
			task.delay(2, refresh)
		end
	end)

	plr.AncestryChanged:Connect(function(_, parent)
		if not parent then
			Row:Destroy()
		end
	end)
end

for _, p in ipairs(Players:GetPlayers()) do
	CreatePlayerEntry(p)
end

Players.PlayerAdded:Connect(CreatePlayerEntry)

local SettingsPage = Instance.new("ScrollingFrame")
SettingsPage.Name = "SettingsPage"
SettingsPage.Parent = PageView
SettingsPage.Position = UDim2.new(0, 0, 0, 15)
SettingsPage.Size = UDim2.new(1, 0, 0, 360)
SettingsPage.CanvasSize = UDim2.new(0, 0, 0, 380)
SettingsPage.BackgroundTransparency = 1
SettingsPage.ZIndex = 7

local ReportAbusePage = Instance.new("Frame")
ReportAbusePage.Name = "ReportAbusePage"
ReportAbusePage.Parent = PageView
ReportAbusePage.Size = UDim2.new(1, 0, 0, 450)
ReportAbusePage.BackgroundTransparency = 1
ReportAbusePage.ZIndex = 7

local function CreateTitle(parent,text,y)
    local f = Instance.new("Frame")
    f.Parent = parent
    f.Position = UDim2.new(0,0,0,y)
    f.Size = UDim2.new(1,0,0,50)
    f.BackgroundTransparency = 1

    local t = Instance.new("TextLabel")
    t.Parent = f
    t.Size = UDim2.new(0,220,1,0)
    t.Position = UDim2.new(0,10,0,0)
    t.Text = text
    t.Font = Enum.Font.SourceSansBold
    t.TextSize = 24
    t.TextColor3 = Color3.new(1,1,1)
    t.TextXAlignment = Enum.TextXAlignment.Left
    t.BackgroundTransparency = 1

    return f
end

local GameFrame = CreateTitle(ReportAbusePage,"Game or Player?",0)
local WhichFrame = CreateTitle(ReportAbusePage,"Which Player?",50)

local function CreateSelector(parent,options)
    local Selector = Instance.new("Frame")
    Selector.Parent = parent
    Selector.Size = UDim2.new(1,-320,1,0)
    Selector.Position = UDim2.new(0,340,0,0)
    Selector.BackgroundTransparency = 1
    Selector.ClipsDescendants = true

    local Left = Instance.new("ImageButton")
    Left.Parent = Selector
    Left.Size = UDim2.new(0,25,0,40)
    Left.Position = UDim2.new(0,0,0.5,-20)
    Left.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
    Left.BackgroundTransparency = 1

    local Right = Instance.new("ImageButton")
    Right.Parent = Selector
    Right.Size = UDim2.new(0, 25, 0, 40)
    Right.Position = UDim2.new(1, -25, 0.5, -20)
    Right.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
    Right.BackgroundTransparency = 1

    local Holder = Instance.new("Frame")
    Holder.Parent = Selector
    Holder.Size = UDim2.new(1,-80,1,0)
    Holder.Position = UDim2.new(0,40,0,0)
    Holder.BackgroundTransparency = 1
    Holder.ClipsDescendants = true

    local index = 1
    local enabled = true

    local Current = Instance.new("TextLabel")
    Current.Parent = Holder
    Current.Size = UDim2.new(1,0,1,0)
    Current.Font = Enum.Font.SourceSansBold
    Current.TextSize = 26
    Current.TextColor3 = Color3.new(1,1,1)
    Current.BackgroundTransparency = 1
    Current.Text = options[1] or "-"

    local function slide(newIndex,dir)
        if not enabled then return end
        if not options[newIndex] then return end

        local New = Current:Clone()
        New.Text = options[newIndex]
        New.Parent = Holder
        New.Position = dir=="right" and UDim2.new(1,0,0,0) or UDim2.new(-1,0,0,0)

        TweenService:Create(Current,TweenInfo.new(0.25),{
            Position = dir=="right" and UDim2.new(-1,0,0,0) or UDim2.new(1,0,0,0)
        }):Play()

        TweenService:Create(New,TweenInfo.new(0.25),{
            Position = UDim2.new(0,0,0,0)
        }):Play()

        task.wait(0.25)
        Current:Destroy()
        Current = New
    end

    Left.MouseButton1Click:Connect(function()
        if not enabled then return end
        local n = index - 1
        if n < 1 then n = #options end
        slide(n,"left")
        index = n
    end)

    Right.MouseButton1Click:Connect(function()
        if not enabled then return end
        local n = index + 1
        if n > #options then n = 1 end

        slide(n,"right")
        index = n
    end)

    return {
        Frame = Selector,

        SetEnabled = function(state)
            enabled = state
            Left.Active = state
            Right.Active = state
            Left.ImageTransparency = state and 0 or 0.4
            Right.ImageTransparency = state and 0 or 0.4
            Current.TextTransparency = state and 0 or 0.4
        end,

        SetOptions = function(newOptions)
            options = newOptions
            index = 1
            Current.Text = options[1] or "-"
        end,

        GetValue = function()
            return options[index]
        end
    }
end

local GameSelector = CreateSelector(GameFrame,{"Game","Player"})
local PlayerSelector = CreateSelector(WhichFrame,{})

local function UpdatePlayers()
    local list = {}
    for _,p in ipairs(Players:GetPlayers()) do
        if p ~= Players.LocalPlayer then
            table.insert(list,p.Name)
        end
    end
    return list
end

local function RefreshPlayerSelector()
    local opts = UpdatePlayers()
    PlayerSelector.SetOptions(opts)
    PlayerSelector.SetEnabled(#opts > 0 and GameSelector.GetValue() == "Player")
end

RefreshPlayerSelector()
Players.PlayerAdded:Connect(RefreshPlayerSelector)
Players.PlayerRemoving:Connect(RefreshPlayerSelector)

task.spawn(function()
    while true do
        PlayerSelector.SetEnabled(GameSelector.GetValue() == "Player")
        task.wait(0.1)
    end
end)

local Desc = Instance.new("TextBox")
Desc.Parent = ReportAbusePage
Desc.Size = UDim2.new(1,-10,0,100)
Desc.Position = UDim2.new(0,5,0,150)
Desc.BackgroundTransparency = 0.4
Desc.TextXAlignment = Enum.TextXAlignment.Left
Desc.TextYAlignment = Enum.TextYAlignment.Top
Desc.TextSize = 20
Desc.TextColor3 = Color3.new(0,0,0)
Desc.ClearTextOnFocus = false

local Submit = Instance.new("ImageButton")
Submit.Parent = ReportAbusePage
Submit.Size = UDim2.new(0,200,0,50)
Submit.Position = UDim2.new(1,-210,0,260)
Submit.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuButton.png"
Submit.ScaleType = Enum.ScaleType.Slice
Submit.SliceCenter = Rect.new(6,6,46,44)
Submit.BackgroundTransparency = 1

local SubmitText = Instance.new("TextLabel")
SubmitText.Parent = Submit
SubmitText.Size = UDim2.new(1,0,1,0)
SubmitText.Text = "Submit"
SubmitText.Font = Enum.Font.SourceSansBold
SubmitText.TextSize = 20
SubmitText.TextColor3 = Color3.new(1,1,1)
SubmitText.BackgroundTransparency = 1

local SubmitText2 = Instance.new("TextLabel")
SubmitText2.Parent = Submit
SubmitText2.Size = UDim2.new(1,0,1,0)
SubmitText2.Text = "Submit"
SubmitText2.Font = Enum.Font.SourceSansBold
SubmitText2.TextSize = 20
SubmitText2.TextColor3 = Color3.new(1,1,1)
SubmitText2.BackgroundTransparency = 1

task.spawn(function()
    while true do
        if GameSelector.GetValue() == "Game" then
            PlayerSelector.SetEnabled(false)
        else
            PlayerSelector.SetEnabled(true)
        end
        task.wait(0.1)
    end
end)

local HelpPage = Instance.new("Frame")
HelpPage.Name = "HelpPage"
HelpPage.Parent = PageView
HelpPage.Position = UDim2.new(0,0,0,0)
HelpPage.Size = UDim2.new(1,0,0,231)
HelpPage.BackgroundTransparency = 1

local HelpFrameTouch = Instance.new("Frame")
HelpFrameTouch.Name = "HelpFrameTouch"
HelpFrameTouch.Parent = HelpPage
HelpFrameTouch.Size = UDim2.new(1,0,1,0)
HelpFrameTouch.BackgroundTransparency = 1

local function createButton(parent, text, pos, size)
	local holder = Instance.new("Frame")
	holder.Parent = parent
	holder.Position = pos
	holder.Size = size
	holder.BackgroundTransparency = 1

	local bg = Instance.new("ImageLabel")
	bg.Parent = holder
	bg.Size = UDim2.new(1,0,1,0)
	bg.BackgroundTransparency = 1
	bg.Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png"
	bg.ZIndex = 1

	local label = Instance.new("TextLabel")
	label.Parent = holder
	label.Size = UDim2.new(1,0,1,0)
	label.BackgroundTransparency = 1
	label.Text = text
	label.TextColor3 = Color3.fromRGB(255,255,255)
	label.TextSize = 18
	label.ZIndex = 2

	return holder
end

local Move = createButton(HelpFrameTouch,"Move",UDim2.new(-0.03,0,0.7,0),UDim2.new(0,107,0,29))
task.wait(0.1)

local Jump = createButton(HelpFrameTouch,"Jump",UDim2.new(0.85,0,0.7,0),UDim2.new(0,107,0,29))
task.wait(0.1)

local Equip = createButton(HelpFrameTouch,"Equip/Unequip Tools",UDim2.new(0.5,-60,0.95,0),UDim2.new(0,150,0,29))
task.wait(0.1)

local Zoom = createButton(HelpFrameTouch,"Zoom In/Out",UDim2.new(0.15,-60,0.02,0),UDim2.new(0,120,0,29))

local ZoomImage = Instance.new("ImageLabel")
ZoomImage.Parent = Zoom
ZoomImage.Size = UDim2.new(0,53,0,59)
ZoomImage.Position = UDim2.new(0.5,-26,1,3)
ZoomImage.BackgroundTransparency = 1
ZoomImage.Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png"
ZoomImage.ZIndex = 1
task.wait(0.1)

local Rotate = createButton(HelpFrameTouch,"Rotate Camera",UDim2.new(0.5,-60,0.02,0),UDim2.new(0,120,0,29))

local RotateImage = Instance.new("ImageLabel")
RotateImage.Parent = Rotate
RotateImage.Size = UDim2.new(0,65,0,48)
RotateImage.Position = UDim2.new(0.5,-32,1,3)
RotateImage.BackgroundTransparency = 1
RotateImage.Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png"
RotateImage.ZIndex = 1
task.wait(0.1)

local Tool = createButton(HelpFrameTouch,"Use Tool",UDim2.new(0.85,-60,0.02,0),UDim2.new(0,120,0,29))

local ToolImage = Instance.new("ImageLabel")
ToolImage.Parent = Tool
ToolImage.Size = UDim2.new(0,38,0,52)
ToolImage.Position = UDim2.new(0.5,-19,1,3)
ToolImage.BackgroundTransparency = 1
ToolImage.Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png"
ToolImage.ZIndex = 1

local function MakeTab(btnName, iconId, titleText, pos)
    local Tab = Instance.new("TextButton")
    Tab.Name = btnName
    Tab.Parent = HubBar
    Tab.Position = pos
    Tab.Size = UDim2.new(0, 169, 1, 0)
    Tab.BackgroundTransparency = 1
    Tab.Text = ""
    Tab.ZIndex = 7

    local Icon = Instance.new("ImageLabel")
    Icon.Name = "Icon"
    Icon.Parent = Tab
    Icon.Image = iconId
    Icon.Position = UDim2.new(0, 15, 0.5, -22)
    Icon.Size = UDim2.new(0, 45, 0, 45)
    Icon.BackgroundTransparency = 1
    Icon.ZIndex = 7

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Parent = Icon
    Title.Position = UDim2.new(1.2, 0, 0, 0)
    Title.Size = UDim2.new(1.2, 0, 1, 0)
    Title.BackgroundTransparency = 1
    Title.Text = titleText
    Title.TextSize = 24
    Title.Font = Enum.Font.SourceSansBold
    Title.TextXAlignment = Enum.TextXAlignment.Left
    Title.TextColor3 = Color3.new(1,1,1)
    Title.TextTransparency = 0.5
    Title.ZIndex = 8

    local Selection = Instance.new("ImageLabel")
    Selection.Name = "TabSelection"
    Selection.Parent = Tab
    Selection.SliceCenter = Rect.new(3, 1, 4, 5)
    Selection.Image = "rbxasset://textures/ui/Settings/MenuBarAssets/MenuSelection.png"
    Selection.Position = UDim2.new(0, 0, 1, -6)
    Selection.Size = UDim2.new(1, 0, 0, 6)
    Selection.BackgroundTransparency = 1
    Selection.Visible = false
    Selection.ScaleType = Enum.ScaleType.Slice
    Selection.ZIndex = 7

    return Tab
end

local PlayersTab = MakeTab("PlayersTab",      "rbxasset://textures/ui/Settings/MenuBarIcons/PlayersTabIcon.png", "Players",  UDim2.new(0.167, -120, 0, 0))
PlayersTab.Icon.Size = UDim2.new(0, 40, 0, 40)

local GameSettingsTab = MakeTab("GameSettingsTab", "rbxasset://textures/ui/Settings/MenuBarIcons/GameSettingsTab.png", "Settings", UDim2.new(0.167, 80, 0, 0))
local ReportAbuseTab = MakeTab("ReportAbuseTab",  "rbxasset://textures/ui/Settings/MenuBarIcons/ReportAbuseTab.png", "Report",   UDim2.new(0.167, 280, 0, 0))
local HelpTab         = MakeTab("HelpTab",         "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png",        "Help",     UDim2.new(0.167, 480, 0, 0))

local Tabs = {
    {Tab = PlayersTab,      Page = PlayersPage},
    {Tab = GameSettingsTab, Page = SettingsPage},
    {Tab = ReportAbuseTab,  Page = ReportAbusePage},
    {Tab = HelpTab,         Page = HelpPage}
}

local function SetActive(selectedTab)
    for _, t in ipairs(Tabs) do
        local selection = t.Tab.TabSelection
        local icon = t.Tab.Icon
        local title = icon.Title

        selection.Visible = (t.Tab == selectedTab)
        icon.ImageTransparency = (t.Tab == selectedTab) and 0 or 0.5
        title.TextTransparency = (t.Tab == selectedTab) and 0 or 0.5
        t.Page.Visible = (t.Tab == selectedTab)
    end
end

SetActive(PlayersTab)

for _, t in ipairs(Tabs) do
    t.Tab.MouseButton1Click:Connect(function()
        SetActive(t.Tab)
    end)
end

local function CreateSettingItem(parent, name, labelText, yPos)
    local Item = Instance.new("ImageButton")
    Item.Name = name
    Item.Parent = parent
    Item.Position = UDim2.new(0, 0, 0, yPos)
    Item.Size = UDim2.new(1, 0, 0, 75)
    Item.BackgroundTransparency = 1
    Item.ZIndex = 7

    local Label = Instance.new("TextLabel")
    Label.Name = name.."Label"
    Label.Parent = Item
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.Size = UDim2.new(0, 250, 1, 0)
    Label.Text = labelText
    Label.TextSize = 24
    Label.Font = Enum.Font.SourceSansBold
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1
    Label.TextColor3 = Color3.new(1,1,1)
    Label.ZIndex = 7

    local Selector = Instance.new("ImageButton")
    Selector.Name = "Selector"
    Selector.Parent = Item
    Selector.Position = UDim2.new(1, -502, 0.5, -25)
    Selector.Size = UDim2.new(0, 502, 0, 50)
    Selector.BackgroundTransparency = 1
    Selector.ZIndex = 7

    local LeftBtn = Instance.new("ImageButton")
    LeftBtn.Name = "LeftButton"
    LeftBtn.Parent = Selector
    LeftBtn.Position = UDim2.new(0, -10, 0.5, -25)
    LeftBtn.Size = UDim2.new(0, 60, 0, 50)
    LeftBtn.BackgroundTransparency = 1
    LeftBtn.ZIndex = 7

    local LeftIcon = Instance.new("ImageLabel")
    LeftIcon.Name = "LeftIcon"
    LeftIcon.Parent = LeftBtn
    LeftIcon.Image = "rbxasset://textures/ui/Settings/Slider/Left.png"
    LeftIcon.Position = UDim2.new(1, -24, 0.5, -15)
    LeftIcon.Size = UDim2.new(0, 18, 0, 30)
    LeftIcon.BackgroundTransparency = 1
    LeftIcon.ZIndex = 7

    local RightBtn = Instance.new("ImageButton")
    RightBtn.Name = "RightButton"
    RightBtn.Parent = Selector
    RightBtn.Position = UDim2.new(1, -50, 0.5, -25)
    RightBtn.Size = UDim2.new(0, 50, 0, 50)
    RightBtn.BackgroundTransparency = 1
    RightBtn.ZIndex = 7

    local RightIcon = Instance.new("ImageLabel")
    RightIcon.Name = "RightIcon"
    RightIcon.Parent = RightBtn
    RightIcon.Image = "rbxasset://textures/ui/Settings/Slider/Right.png"
    RightIcon.Position = UDim2.new(0, 6, 0.5, -15)
    RightIcon.Size = UDim2.new(0, 18, 0, 30)
    RightIcon.BackgroundTransparency = 1
    RightIcon.ZIndex = 7

    local SelectorSwitch = Instance.new("TextLabel")
    SelectorSwitch.Name = "SelectorSwitch"
    SelectorSwitch.Parent = Selector
    SelectorSwitch.Position = UDim2.new(0, 60, 0, 0)
    SelectorSwitch.Size = UDim2.new(1, -120, 1, 0)
    SelectorSwitch.Text = ""
    SelectorSwitch.Font = Enum.Font.SourceSansBold
    SelectorSwitch.TextSize = 28
    SelectorSwitch.TextColor3 = Color3.new(1,1,1)
    SelectorSwitch.BackgroundTransparency = 1
    SelectorSwitch.ZIndex = 7

    return Item
end

CreateSettingItem(SettingsPage, "CameraModeFrame",       "Camera Mode",       00)
CreateSettingItem(SettingsPage, "VolumeFrame",           "Volume",            50)
CreateSettingItem(SettingsPage, "FullscreenFrame",       "Fullscreen",        100)
CreateSettingItem(SettingsPage, "GraphicModeFrame",      "Graphic Mode",      150)
CreateSettingItem(SettingsPage, "GraphicQualityFrame",   "Graphic Quality",   200)
CreateSettingItem(SettingsPage, "PerformanceStatsFrame", "Performance Stats", 250)

local SettingOptions = {
    CameraModeFrame       = {"Classic", "Follow", "Orbital"},
    FullscreenFrame      = {"Off", "On"},
    GraphicModeFrame      = {"Automatic", "Manual"},
    PerformanceStatsFrame = {"Off", "Minimal", "Full"}
}

local CurrentIndex = {}

local function ConnectSelector(settingItem)
    local name = settingItem.Name
    local selector = settingItem.Selector
    local left = selector.LeftButton
    local right = selector.RightButton
    local switch = selector.SelectorSwitch

    local options = SettingOptions[name]
    if not options then return end

    local index = 1
    switch.Text = options[index]

    local function Slide(newIndex, dir)
        local old = switch

        local outgoing = old:Clone()
        outgoing.Parent = old.Parent
        outgoing.Text = old.Text
        outgoing.Position = old.Position
        outgoing.ZIndex = old.ZIndex

        old.Text = options[newIndex]
        old.Position = UDim2.new(dir, 60, 0, 0)

        TweenService:Create(
             old,
            TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(0,60,0,0)}
        ):Play()

        local tweenOut = TweenService:Create(
            outgoing,
            TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {Position = UDim2.new(-dir,60,0,0)}
        )

        tweenOut:Play()
        tweenOut.Completed:Connect(function()
            outgoing:Destroy()
        end)
    end

    left.MouseButton1Click:Connect(function()
        local new = index - 1
        if new < 1 then new = #options end

        Slide(new, -1)
        index = new
    end)

    right.MouseButton1Click:Connect(function()
        local new = index + 1
        if new > #options then new = 1 end

        Slide(new, 1)
        index = new
    end)
end

for _, item in ipairs(SettingsPage:GetChildren()) do
    if item:FindFirstChild("Selector") then
        ConnectSelector(item)
    end
end

local function CreateStepSlider(selectorFrame, totalSteps)
    local steps = {}
    local currentStep = 1

    local stepSize = UDim2.new(0, 35, 0, 24)
    local startX = 58
    local spacing = 39

    for i = 1, totalSteps do
        local step = Instance.new("Frame")
        step.Name = "Step"..i
        step.Parent = selectorFrame
        step.Size = stepSize
        step.Position = UDim2.new(0, startX + (i-1) * spacing, 0.5, -stepSize.Y.Offset/2)
        step.BackgroundColor3 = Color3.fromRGB(170,170,170)
        step.BorderSizePixel = 0
        step.BackgroundTransparency = 0.4
        step.ZIndex = 9
        steps[i] = step
    end

    local leftBtn = selectorFrame.LeftButton
    local rightBtn = selectorFrame.RightButton

    local function UpdateVisual()
        for i = 1, totalSteps do
            steps[i].BackgroundColor3 = (i <= currentStep) and Color3.fromRGB(0,162,255) or Color3.fromRGB(170,170,170)
        end

        leftBtn.ImageTransparency  = (currentStep <= 1) and 0.36 or 0.36
        rightBtn.ImageTransparency = (currentStep >= totalSteps) and 0.36 or 0.36
    end
    UpdateVisual()

    leftBtn.MouseButton1Click:Connect(function()
        if currentStep > 1 then
            currentStep -= 1
            UpdateVisual()
        end
    end)

    rightBtn.MouseButton1Click:Connect(function()
         if currentStep < totalSteps then
            currentStep += 1
            UpdateVisual()
        end
    end)
end

local VolumeFrame = SettingsPage:FindFirstChild("VolumeFrame")
local GraphicFrame = SettingsPage:FindFirstChild("GraphicQualityFrame")

if VolumeFrame then
    CreateStepSlider(VolumeFrame.Selector, 10)
end

if GraphicFrame then
    CreateStepSlider(GraphicFrame.Selector, 10)
end

local chatFixGui = Instance.new("ScreenGui")
chatFixGui.Name = "ChatWindow"
chatFixGui.Parent = RobloxGui

local containerFrame = Instance.new("Frame")
containerFrame.Name = "Frame"
containerFrame.Size = UDim2.new(1,0,1,0)
containerFrame.BackgroundTransparency = 1
containerFrame.Parent = chatFixGui

local oldChatFrame = PlayerGui.Chat.Frame
oldChatFrame.Parent = containerFrame

local tweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local openTween  = TweenService:Create(SettingsShield, tweenInfo, {Position = openPos})
local closeTween = TweenService:Create(SettingsShield, tweenInfo, {Position = closedPos})
local isOpen = false

-- MODIFIED ACTION: Fires a simulated Esc hardware stroke via executor privileges instead of custom toggles
local function simulateEscClick()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Escape, false, game)
end

SettingsApp.MouseButton1Click:Connect(function()
    simulateEscClick()
end)

CloseButton.MouseButton1Click:Connect(function()
	if isOpen then
		closeTween:Play()
		CloseButton.Visible = false
		chatFixGui.Enabled = true
		HubBar.Visible = false
		PageView.Visible = false
		BottomButtonFrame.Visible = false
		SettingsApp.Visible = true
		ChatApp.Visible = true
		MoreApp.Visible = true
		isOpen = false
	end
end)

ResumeButton.MouseButton1Click:Connect(function()
	if isOpen then
		closeTween:Play()
		CloseButton.Visible = false
		chatFixGui.Enabled = true
		HubBar.Visible = false
		PageView.Visible = false
		BottomButtonFrame.Visible = false
		SettingsApp.Visible = true
		ChatApp.Visible = true
		MoreApp.Visible = true
		isOpen = false
	end
end)

LeaveButton.MouseButton1Click:Connect(function()
	DontorNo.Visible = true
	ConfirmLeaveBtn.Visible = true
	DontLeaveButton.Visible = true
	BottomButtonFrame.Visible = false
	HubBar.Visible = false
	PageView.Visible = false
end)

DontLeaveButton.MouseButton1Click:Connect(function()
	DontorNo.Visible = false
	ConfirmLeaveBtn.Visible = false
	DontLeaveButton.Visible = false
	BottomButtonFrame.Visible = true
	HubBar.Visible = true
	PageView.Visible = true
end)

ConfirmLeaveBtn.MouseButton1Click:Connect(function()
	game:Shutdown()
end)

ResetButton.MouseButton1Click:Connect(function()
	if not isOpen then return end

	BottomButtonFrame.Visible = false
	ConfirmLeaveBtn.Visible = false
	DontLeaveButton.Visible = false
	DontResetButton.Visible = true
	ConfirmResetBtn.Visible = true
	HubBar.Visible = false
	DontorNo.Visible = true
	PageView.Visible = false
end)

DontResetButton.MouseButton1Click:Connect(function()
	DontorNo.Visible = false
	ConfirmLeaveBtn.Visible = false
	DontLeaveButton.Visible = false
	DontResetButton.Visible = false
	ConfirmResetBtn.Visible = false
	BottomButtonFrame.Visible = true
	HubBar.Visible = true
	PageView.Visible = true
end)

ConfirmResetBtn.MouseButton1Click:Connect(function()
	if LocalPlayer.Character then
		LocalPlayer.Character:BreakJoints()
	end

	DontorNo.Visible = false
	BottomButtonFrame.Visible = true
	chatFixGui.Enabled = true
	CloseButton.Visible = false
	HubBar.Visible = true
	SettingsApp.Visible = true
	ChatApp.Visible = true
	MoreApp.Visible = true
	PageView.Visible = true
	if Hotbar then Hotbar.Visible = true end
	DontResetButton.Visible = false
	ConfirmResetBtn.Visible = false

	closeTween:Play()
	isOpen = false
end)

local StarterGuiService = game:GetService("StarterGui")

InventoryBtn.MouseButton1Click:Connect(function() end)

local ChatBar = CoreGui.RobloxGui.ChatWindow.Frame.Frame.ChatBarParentFrame
ChatBar.Size = UDim2.new(1, -44, ChatBar.Size.Y.Scale, ChatBar.Size.Y.Offset)

local ResizeButton = CoreGui.RobloxGui.ChatWindow.Frame.Frame:FindFirstChild("ResizeButton")
if ResizeButton then
end

-- Ensure the game environment is fully ready
if (not game:IsLoaded()) then
	game.Loaded:Wait();
end

-- Define the project's base repository
local Repo = "https://raw.githubusercontent.com/xaviersupreme/Project2016/main/"

-- Create an isolated module loader just for the settings menu
local function LoadProjectModule(ModuleName)
	return loadstring(game:HttpGet(Repo .. "modules/" .. ModuleName .. ".lua"))();
end

-- Execute the standalone 2020 Esc Menu engine
local Success, Error = pcall(function()
	LoadProjectModule("settings");
end)

if Success then
	print("[Extraction] 2020 Esc UI injected successfully!")
else
	warn("[Extraction] Failed to run Esc UI:", Error)
end
 ]],
	Topbar_2016_A  = [[ --2016 TOPBAR

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-BEST-2016-COREUI-WORKING-60721"))()

local Players = game:GetService("Players")

local function makeCharacterShiny(character)
    -- Loop through everything inside the character model
    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Catch any parts (like accessories or clothing limbs) that load in a split second later
    character.DescendantAdded:Connect(function(object)
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end)
end

-- Handle players who are already in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        makeCharacterShiny(player.Character)
    end
    player.CharacterAdded:Connect(makeCharacterShiny)
end

-- Handle players who join the server later
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(makeCharacterShiny)
end)

--CONTEXT: This script was taken from 2016 corescripts off of ROBLOX's Github

spawn(function()
	local LoadingGui = game:WaitForChild("CoreGui"):WaitForChild("RobloxLoadingGui")
	LoadingGui.Enabled = false
	LoadingGui:Destroy()
end)

-- Creates the generic "ROBLOX" loading screen on startup
-- Written by ArceusInator & Ben Tkacheff, 2014

-- Constants
local PLACEID = game.PlaceId

local MPS = game:GetService('MarketplaceService')
local UIS = game:GetService('UserInputService')
local guiService = game:GetService("GuiService")
local ContextActionService = game:GetService('ContextActionService')
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

local startTime = tick()

local COLORS = {
	BLACK = Color3.new(0, 0, 0),
	BACKGROUND_COLOR = Color3.new(45/255, 45/255, 45/255),
	WHITE = Color3.new(1, 1, 1),
	ERROR = Color3.new(253/255,68/255,72/255)
}

local function getViewportSize()
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:wait()
	end

	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0,0) do
		game.Workspace.CurrentCamera.Changed:wait()
	end

	return game.Workspace.CurrentCamera.ViewportSize
end

--
-- Variables
local GameAssetInfo -- loaded by InfoProvider:LoadAssets()
local currScreenGui, renderSteppedConnection = nil, nil
local destroyingBackground, destroyedLoadingGui, hasReplicatedFirstElements = false, false, false
local backgroundImageTransparency = 0
local isMobile = (UIS.TouchEnabled == true and UIS.MouseEnabled == false and getViewportSize().Y <= 500)
local isTenFootInterface = guiService:IsTenFootInterface()
local platform = UIS:GetPlatform()

local function IsConvertMyPlaceNameInXboxAppEnabled()
	if UIS:GetPlatform() == Enum.Platform.XBoxOne then
		local success, flagValue = pcall(function() return settings():GetFFlag("ConvertMyPlaceNameInXboxApp") end)
		return (success and flagValue == true)
	end
	return false
end

--
-- Utility functions
local create = function(className, defaultParent)
	return function(propertyList)
		local object = Instance.new(className)
		local parent = nil

		for index, value in next, propertyList do
			if type(index) == 'string' then
				if index == 'Parent' then
					parent = value
				else
					object[index] = value
				end
			else
				if type(value) == 'function' then
					value(object)
				elseif type(value) == 'userdata' then
					value.Parent = object
				end
			end
		end
		
		if parent then
			object.Parent = parent
		end

		if object.Parent == nil then
			object.Parent = defaultParent
		end

		return object
	end
end

--
-- Create objects

local MainGui = {}
local InfoProvider = {}


function ExtractGeneratedUsername(gameName)
	local tempUsername = string.match(gameName, "^([0-9a-fA-F]+)'s Place$")
	if tempUsername and #tempUsername == 32 then
		return tempUsername
	end
end

-- Fix places that have been made with incorrect temporary usernames
function GetFilteredGameName(gameName, creatorName)
	if gameName and type(gameName) == 'string' then
		local tempUsername = ExtractGeneratedUsername(gameName)
		if tempUsername then
			local newGameName = string.gsub(gameName, tempUsername, creatorName, 1)
			if newGameName then
				return newGameName
			end
		end
	end
	return gameName
end


function InfoProvider:GetGameName()
	if GameAssetInfo ~= nil then
		if IsConvertMyPlaceNameInXboxAppEnabled() then
			return GetFilteredGameName(GameAssetInfo.Name, self:GetCreatorName())
		else
			return GameAssetInfo.Name
		end
	else
		return ''
	end
end

function InfoProvider:GetCreatorName()
	if GameAssetInfo ~= nil then
		return GameAssetInfo.Creator.Name
	else
		return ''
	end
end

function InfoProvider:LoadAssets()
	spawn(function()
		if PLACEID <= 0 then
			while game.PlaceId <= 0 do
				wait()
			end
			PLACEID = game.PlaceId
		end

		-- load game asset info
		coroutine.resume(coroutine.create(function()
			local success, result = pcall(function()
				GameAssetInfo = MPS:GetProductInfo(PLACEID)
			end)
			if not success then
				print("LoadingScript->InfoProvider:LoadAssets:", result)
			end
		end))
	end)
end

function MainGui:tileBackgroundTexture(frameToFill)
	if not frameToFill then return end
	frameToFill:ClearAllChildren()
	if backgroundImageTransparency < 1 then
		local backgroundTextureSize = Vector2.new(512, 512)
		for i = 0, math.ceil(frameToFill.AbsoluteSize.X/backgroundTextureSize.X) do
			for j = 0, math.ceil(frameToFill.AbsoluteSize.Y/backgroundTextureSize.Y) do
				create 'ImageLabel' {
					Name = 'BackgroundTextureImage',
					BackgroundTransparency = 1,
					ImageTransparency = backgroundImageTransparency,
					Image = 'rbxasset://textures/loading/darkLoadingTexture.png',
					Position = UDim2.new(0, i*backgroundTextureSize.X, 0, j*backgroundTextureSize.Y),
					Size = UDim2.new(0, backgroundTextureSize.X, 0, backgroundTextureSize.Y),
					ZIndex = 1,
					Parent = frameToFill
				}
			end
		end
	end
end

-- create a cancel binding for console to be able to cancel anytime while loading
local function createTenfootCancelGui()
	local cancelLabel = create'ImageLabel'
	{
		Name = "CancelLabel";
		Size = UDim2.new(0, 83, 0, 83);
		Position = UDim2.new(1, -32 - 83, 0, 32);
		BackgroundTransparency = 1;
		Image = 'rbxasset://textures/ui/Shell/ButtonIcons/BButton.png';
	}
	local cancelText = create'TextLabel'
	{
		Name = "CancelText";
		Size = UDim2.new(0, 0, 0, 0);
		Position = UDim2.new(1, -131, 0, 64);
		BackgroundTransparency = 1;
		FontSize = Enum.FontSize.Size36;
		TextXAlignment = Enum.TextXAlignment.Right;
		TextColor3 = COLORS.WHITE;
		Text = "Cancel";
	}

	-- bind cancel action
	local platformService = nil
	pcall(function()
		platformService = game:GetService('PlatformService')
	end)

	if platformService then
		if not game:GetService("ReplicatedFirst"):IsFinishedReplicating() then
			local seenBButtonBegin = false
			ContextActionService:BindCoreAction("CancelGameLoad",
				function(actionName, inputState, inputObject)
					if inputState == Enum.UserInputState.Begin then
						seenBButtonBegin = true
					elseif inputState == Enum.UserInputState.End and seenBButtonBegin then
						cancelLabel:Destroy()
						cancelText.Text = "Canceling..."
						cancelText.Position = UDim2.new(1, -32, 0, 64)
						ContextActionService:UnbindCoreAction('CancelGameLoad')
						platformService:RequestGameShutdown()
					end
				end,
				false,
				Enum.KeyCode.ButtonB)
		end
	end

	while cancelLabel.Parent == nil do
		if currScreenGui then
			local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
			if blackFrame then
				cancelLabel.Parent = blackFrame
				cancelText.Parent = blackFrame
				break
			end
		end
		wait()
	end
end

--
-- Declare member functions
function MainGui:GenerateMain()
	local screenGui = create 'ScreenGui' {
		Name = 'Custom2016LoadingGui' -- Renamed to prevent automatic self-deletion loop
	}

	--
	-- create descendant frames
	local mainBackgroundContainer = create 'Frame' {
		Name = 'BlackFrame',
		BackgroundColor3 = COLORS.BACKGROUND_COLOR,
		BackgroundTransparency = 0,
		Size = UDim2.new(1, 0, 1, 36),
		Position = UDim2.new(0, 0, 0, -36),
		Active = true,
		Parent = screenGui,
	}

		local closeButton =	create 'ImageButton' {
			Name = 'CloseButton',
			Image = 'rbxasset://textures/loading/cancelButton.png',
			ImageTransparency = 1,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -37, 0, 5),
			Size = UDim2.new(0, 32, 0, 32),
			Active = false,
			ZIndex = 10,
			Parent = mainBackgroundContainer,
		}

		local graphicsFrame = create 'Frame' {
			Name = 'GraphicsFrame',
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, (isMobile == true and -75 or (isTenFootInterface and -245 or -225)), 1, (isMobile == true and -75 or (isTenFootInterface and -185 or -165))),
			Size = UDim2.new(0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120)), 0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120))),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local loadingImage = create 'ImageLabel' {
				Name = 'LoadingImage',
				BackgroundTransparency = 1,
				Image = 'rbxasset://textures/loading/loadingCircle.png',
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2,
				Parent = graphicsFrame,
			}

			local loadingText = create 'TextLabel' {
				Name = 'LoadingText',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, (isMobile == true and -14 or -56), 1, 0),
				Position = UDim2.new(0, (isMobile == true and 12 or 28), 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isMobile == true and Enum.FontSize.Size12 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				TextXAlignment = Enum.TextXAlignment.Left,
				Visible = not isTenFootInterface,
				Text = "Loading...",
				ZIndex = 2,
				Parent = graphicsFrame,
			}

		local uiMessageFrame = create 'Frame' {
			Name = 'UiMessageFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0.25, 0, 1, -120),
			Size = UDim2.new(0.5, 0, 0, 80),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local uiMessage = create 'TextLabel' {
				Name = 'UiMessage',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Font = Enum.Font.SourceSansBold,
				FontSize = Enum.FontSize.Size18,
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				Text = "",
				ZIndex = 2,
				Parent = uiMessageFrame,
			}

		local infoFrame = create 'Frame' {
			Name = 'InfoFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0, (isMobile == true and 20 or 100), 1, (isMobile == true and -120 or -150)),
			Size = UDim2.new(0.4, 0, 0, 110),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local placeLabel = create 'TextLabel' {
				Name = 'PlaceLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 80),
				Position = UDim2.new(0, 0, 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size48 or Enum.FontSize.Size24),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Bottom,
				ZIndex = 2,
				Parent = infoFrame,
			}

			if isTenFootInterface then
				local byLabel = create'TextLabel' {
					Name = "ByLabel",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 36, 0, 30),
					Position = UDim2.new(0, 0, 0, 80),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size36,
					TextScaled = true,
					TextColor3 = COLORS.WHITE,
					TextStrokeTransparency = 0,
					Text = "By",
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
				local creatorIcon = create'ImageLabel' {
					Name = "CreatorIcon",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 30, 0, 30),
					Position = UDim2.new(0, 38, 0, 80),
					ImageTransparency = 0,
					Image = 'rbxasset://textures/ui/Shell/Icons/RobloxIcon32.png',
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
			end

			local creatorLabel = create 'TextLabel' {
				Name = 'CreatorLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.new(0, isTenFootInterface and 72 or 0, 0, 80),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size36 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ZIndex = 2,
				Parent = infoFrame,
			}

		local backgroundTextureFrame = create 'Frame' {
			Name = 'BackgroundTextureFrame',
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			ClipsDescendants = true,
			ZIndex = 1,
			BackgroundTransparency = 1,
			Parent = mainBackgroundContainer,
		}

	local errorFrame = create 'Frame' {
		Name = 'ErrorFrame',
		BackgroundColor3 = COLORS.ERROR,
		BorderSizePixel = 0,
		Position = UDim2.new(0.25,0,0,0),
		Size = UDim2.new(0.5, 0, 0, 80),
		ZIndex = 8,
		Visible = false,
		Parent = screenGui,
	}

		local errorText = create 'TextLabel' {
			Name = "ErrorText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			TextColor3 = COLORS.WHITE,
			Text = "",
			ZIndex = 8,
			Parent = errorFrame,
		}

	while not game:GetService("CoreGui") do
		wait()
	end
	screenGui.Parent = game:GetService("CoreGui")
	currScreenGui = screenGui
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

---------------------------------------------------------
-- Main Script (show something now + setup connections)

-- start loading assets asap
InfoProvider:LoadAssets()
MainGui:GenerateMain()
if isTenFootInterface then
	createTenfootCancelGui()
end

local lastRenderTime, lastDotUpdateTime, brickCountChange = nil, nil, nil
local fadeCycleTime = 1.7
local turnCycleTime = 2
local lastAbsoluteSize = Vector2.new(0, 0)
local loadingDots = "..."
local dotChangeTime = .2
local lastBrickCount = 0

renderSteppedConnection = game:GetService("RunService").RenderStepped:connect(function()
	if not currScreenGui then return end
	if not currScreenGui:FindFirstChild("BlackFrame") then return end

	if setVerb then
		currScreenGui.BlackFrame.CloseButton:SetVerb("Exit")
		setVerb = false
	end

	if currScreenGui.BlackFrame:FindFirstChild("BackgroundTextureFrame") and currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize ~= lastAbsoluteSize then
		lastAbsoluteSize = currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize
		MainGui:tileBackgroundTexture(currScreenGui.BlackFrame.BackgroundTextureFrame)
	end

	local infoFrame = currScreenGui.BlackFrame:FindFirstChild('InfoFrame')
	if infoFrame then
		-- set place name
		local placeLabel = infoFrame:FindFirstChild('PlaceLabel')
		if placeLabel and placeLabel.Text == "" then
			placeLabel.Text = InfoProvider:GetGameName()
		end

		-- set creator name
		local creatorLabel = infoFrame:FindFirstChild('CreatorLabel')
		if creatorLabel and creatorLabel.Text == "" then
			local creatorName = InfoProvider:GetCreatorName()
			if creatorName ~= "" then
				if isTenFootInterface then
					local showDevName = true
					if platform == Enum.Platform.XBoxOne then
						local success, result = pcall(function()
							return settings():GetFFlag("ShowDevNameInXboxApp")
						end)
						if success then
							showDevName = result
						end
					end
					creatorLabel.Text = showDevName and creatorName or ""
					local creatorIcon = infoFrame:FindFirstChild('CreatorIcon')
					local byLabel = infoFrame:FindFirstChild('ByLabel')
					if creatorIcon then creatorIcon.Visible = showDevName end
					if byLabel then byLabel.Visible = showDevName end
				else
					creatorLabel.Text = "By "..creatorName
				end
			end
		end
	end

	if not lastRenderTime then
		lastRenderTime = tick()
		lastDotUpdateTime = lastRenderTime
		return
	end

	local currentTime = tick()
	local fadeAmount = (currentTime - lastRenderTime) * fadeCycleTime
	local turnAmount = (currentTime - lastRenderTime) * (360/turnCycleTime)
	lastRenderTime = currentTime

	currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation = currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation + turnAmount

	local updateLoadingDots =  function()
		loadingDots = loadingDots.. "."
		if loadingDots == "...." then
			loadingDots = ""
		end
		currScreenGui.BlackFrame.GraphicsFrame.LoadingText.Text = "Loading" ..loadingDots
	end

	if currentTime - lastDotUpdateTime >= dotChangeTime and InfoProvider:GetCreatorName() == "" then
		lastDotUpdateTime = currentTime
		updateLoadingDots()
	else
		if guiService:GetBrickCount() > 0 then
			if brickCountChange == nil then
				brickCountChange = guiService:GetBrickCount()
			end
			if guiService:GetBrickCount() - lastBrickCount >= brickCountChange then
				lastBrickCount = guiService:GetBrickCount()
				updateLoadingDots()
			end
		end
	end

	if not isTenFootInterface then
		if currentTime - startTime > 5 and currScreenGui.BlackFrame.CloseButton.ImageTransparency > 0 then
			currScreenGui.BlackFrame.CloseButton.ImageTransparency = currScreenGui.BlackFrame.CloseButton.ImageTransparency - fadeAmount

			if currScreenGui.BlackFrame.CloseButton.ImageTransparency <= 0 then
				currScreenGui.BlackFrame.CloseButton.Active = true
			end
		end
	end
end)

spawn(function()
	local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
	local guiInsetChangedEvent = Instance.new("BindableEvent")
	guiInsetChangedEvent.Name = "GuiInsetChanged"
	guiInsetChangedEvent.Parent = RobloxGui
	guiInsetChangedEvent.Event:connect(function(x1, y1, x2, y2)
		if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
			currScreenGui.BlackFrame.Position = UDim2.new(0, -x1, 0, -y1)
			currScreenGui.BlackFrame.Size = UDim2.new(1, x1 + x2, 1, y1 + y2)
		end
	end)
end)

local leaveGameButton, leaveGameTextLabel, errorImage = nil

guiService.ErrorMessageChanged:connect(function()
	if guiService:GetErrorMessage() ~= '' then
		if isTenFootInterface then
			currScreenGui.ErrorFrame.Size = UDim2.new(1, 0, 0, 144)
			currScreenGui.ErrorFrame.Position = UDim2.new(0, 0, 0, 0)
			currScreenGui.ErrorFrame.BackgroundColor3 = COLORS.BLACK
			currScreenGui.ErrorFrame.BackgroundTransparency = 0.5
			currScreenGui.ErrorFrame.ErrorText.FontSize = Enum.FontSize.Size36
			currScreenGui.ErrorFrame.ErrorText.Position = UDim2.new(.3, 0, 0, 0)
			currScreenGui.ErrorFrame.ErrorText.Size = UDim2.new(.4, 0, 0, 144)
			if errorImage == nil then
				errorImage = Instance.new("ImageLabel")
				errorImage.Image = "rbxasset://textures/ui/ErrorIconSmall.png"
				errorImage.Size = UDim2.new(0, 96, 0, 79)
				errorImage.Position = UDim2.new(0.228125, 0, 0, 32)
				errorImage.ZIndex = 9
				errorImage.BackgroundTransparency = 1
				errorImage.Parent = currScreenGui.ErrorFrame
			end
			-- we show a B button to kill game data model on console
			if not isTenFootInterface then
				if leaveGameButton == nil then
					local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
					local utility = require(RobloxGui.Modules.Settings.Utility)
					local textLabel = nil
					leaveGameButton, leaveGameTextLabel = utility:MakeStyledButton("LeaveGame", "Leave", UDim2.new(0, 288, 0, 78))
					leaveGameButton:SetVerb("Exit")
					leaveGameButton.NextSelectionDown = leaveGameButton
					leaveGameButton.NextSelectionLeft = leaveGameButton
					leaveGameButton.NextSelectionRight = leaveGameButton
					leaveGameButton.NextSelectionUp = leaveGameButton
					leaveGameButton.ZIndex = 9
					leaveGameButton.Position = UDim2.new(0.771875, 0, 0, 37)
					leaveGameButton.Parent = currScreenGui.ErrorFrame
					leaveGameTextLabel.FontSize = Enum.FontSize.Size36
					leaveGameTextLabel.ZIndex = 10
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				else
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				end
			end
		end
		currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
		currScreenGui.ErrorFrame.Visible = true
		local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.CloseButton.ImageTransparency = 0
			blackFrame.CloseButton.Active = true
		end
	else
		currScreenGui.ErrorFrame.Visible = false
	end
end)

guiService.UiMessageChanged:connect(function(type, newMessage)
	if type == Enum.UiMessageType.UiMessageInfo then
		local blackFrame = currScreenGui and currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.UiMessageFrame.UiMessage.Text = newMessage
			if newMessage ~= '' then
				blackFrame.UiMessageFrame.Visible = true
			else
				blackFrame.UiMessageFrame.Visible = false
			end
		end
	end
end)

if guiService:GetErrorMessage() ~= '' then
	currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
	currScreenGui.ErrorFrame.Visible = true
end


function stopListeningToRenderingStep()
	if renderSteppedConnection then
		renderSteppedConnection:disconnect()
		renderSteppedConnection = nil
	end
end

function fadeAndDestroyBlackFrame(blackFrame)
	if destroyingBackground then return end
	destroyingBackground = true
	spawn(function()
		local infoFrame = blackFrame:FindFirstChild("InfoFrame")
		local graphicsFrame = blackFrame:FindFirstChild("GraphicsFrame")
		
		if blackFrame:FindFirstChild("InfoFrame") then
				local infoFrameChildren = infoFrame:GetChildren()
				local transparency = 0
				local rateChange = 1.8
				local lastUpdateTime = nil

				while transparency < 1 do
					if not lastUpdateTime then
						lastUpdateTime = tick()
					else
						local newTime = tick()
						transparency = transparency + rateChange * (newTime - lastUpdateTime)
						for i = 1, #infoFrameChildren do
							local child = infoFrameChildren[i]
							if child:IsA('TextLabel') then
								child.TextTransparency = transparency
								child.TextStrokeTransparency = transparency
							elseif child:IsA('ImageLabel') then
								child.ImageTransparency = transparency
							end
						end
						graphicsFrame.LoadingImage.ImageTransparency = transparency
						blackFrame.BackgroundTransparency = transparency

						if backgroundImageTransparency < 1 then
							backgroundImageTransparency = transparency
							local backgroundImages = blackFrame.BackgroundTextureFrame:GetChildren()
							for i = 1, #backgroundImages do
								backgroundImages[i].ImageTransparency = backgroundImageTransparency
							end
						end

						lastUpdateTime = newTime
					end
					wait()
				end
				if blackFrame ~= nil then
					stopListeningToRenderingStep()
					blackFrame:Destroy()
				end
		end
	end)
end

function destroyLoadingElements(instant)
	if not currScreenGui then return end
	if destroyedLoadingGui then return end
	destroyedLoadingGui = true

	local guiChildren = currScreenGui:GetChildren()
	for i=1, #guiChildren do
		-- need to keep this around in case we get a connection error later
		if guiChildren[i].Name ~= "ErrorFrame" then
			if guiChildren[i].Name == "BlackFrame" and not instant then
				fadeAndDestroyBlackFrame(guiChildren[i])
			else
				guiChildren[i]:Destroy()
			end
		end
	end
end

-- ====================================================================
-- FORCED DELETION SEQUENCE: REMOVES GUI AFTER EXACTLY 3 SECONDS NO MATTER WHAT
-- ====================================================================
hasReplicatedFirstElements = false

spawn(function()
	wait(3) -- Display duration forced to exactly 3 seconds
	if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
		if isTenFootInterface then
			ContextActionService:UnbindCoreAction('CancelGameLoad')
		end
		destroyLoadingElements(false)
	end
end)

local UserInputServiceChangedConn;
local function onUserInputServiceChanged(prop)
	if prop == 'VREnabled' then
		local UseVr = false
		pcall(function() UseVr = UIS.VREnabled end)

		if UseVr then
			if UserInputServiceChangedConn then
				UserInputServiceChangedConn:disconnect()
				UserInputServiceChangedConn = nil
			end
			if isTenFootInterface then
				ContextActionService:UnbindCoreAction('CancelGameLoad')
			end
			destroyLoadingElements(true)
			require(RobloxGui.Modules.LoadingScreen3D)
		end
	end
end

UserInputServiceChangedConn = UIS.Changed:connect(onUserInputServiceChanged)
onUserInputServiceChanged('VREnabled') ]], 
	Topbar_2016_S  = [[ --CONTEXT: This script was taken from 2016 corescripts off of ROBLOX's github


spawn(function()
	local LoadingGui = game:WaitForChild("CoreGui"):WaitForChild("RobloxLoadingGui")
	LoadingGui.Enabled = false
	LoadingGui:Destroy()
end)

-- Creates the generic "ROBLOX" loading screen on startup
-- Written by ArceusInator & Ben Tkacheff, 2014

-- Constants
local PLACEID = game.PlaceId

local MPS = game:GetService('MarketplaceService')
local UIS = game:GetService('UserInputService')
local guiService = game:GetService("GuiService")
local ContextActionService = game:GetService('ContextActionService')
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

local startTime = tick()

local COLORS = {
	BLACK = Color3.new(0, 0, 0),
	BACKGROUND_COLOR = Color3.new(45/255, 45/255, 45/255),
	WHITE = Color3.new(1, 1, 1),
	ERROR = Color3.new(253/255,68/255,72/255)
}

local function getViewportSize()
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:wait()
	end

	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0,0) do
		game.Workspace.CurrentCamera.Changed:wait()
	end

	return game.Workspace.CurrentCamera.ViewportSize
end

--
-- Variables
local GameAssetInfo -- loaded by InfoProvider:LoadAssets()
local currScreenGui, renderSteppedConnection = nil, nil
local destroyingBackground, destroyedLoadingGui, hasReplicatedFirstElements = false, false, false
local backgroundImageTransparency = 0
local isMobile = (UIS.TouchEnabled == true and UIS.MouseEnabled == false and getViewportSize().Y <= 500)
local isTenFootInterface = guiService:IsTenFootInterface()
local platform = UIS:GetPlatform()

local function IsConvertMyPlaceNameInXboxAppEnabled()
	if UIS:GetPlatform() == Enum.Platform.XBoxOne then
		local success, flagValue = pcall(function() return settings():GetFFlag("ConvertMyPlaceNameInXboxApp") end)
		return (success and flagValue == true)
	end
	return false
end

--
-- Utility functions
local create = function(className, defaultParent)
	return function(propertyList)
		local object = Instance.new(className)
		local parent = nil

		for index, value in next, propertyList do
			if type(index) == 'string' then
				if index == 'Parent' then
					parent = value
				else
					object[index] = value
				end
			else
				if type(value) == 'function' then
					value(object)
				elseif type(value) == 'userdata' then
					value.Parent = object
				end
			end
		end
		
		if parent then
			object.Parent = parent
		end

		if object.Parent == nil then
			object.Parent = defaultParent
		end

		return object
	end
end

--
-- Create objects

local MainGui = {}
local InfoProvider = {}


function ExtractGeneratedUsername(gameName)
	local tempUsername = string.match(gameName, "^([0-9a-fA-F]+)'s Place$")
	if tempUsername and #tempUsername == 32 then
		return tempUsername
	end
end

-- Fix places that have been made with incorrect temporary usernames
function GetFilteredGameName(gameName, creatorName)
	if gameName and type(gameName) == 'string' then
		local tempUsername = ExtractGeneratedUsername(gameName)
		if tempUsername then
			local newGameName = string.gsub(gameName, tempUsername, creatorName, 1)
			if newGameName then
				return newGameName
			end
		end
	end
	return gameName
end


function InfoProvider:GetGameName()
	if GameAssetInfo ~= nil then
		if IsConvertMyPlaceNameInXboxAppEnabled() then
			return GetFilteredGameName(GameAssetInfo.Name, self:GetCreatorName())
		else
			return GameAssetInfo.Name
		end
	else
		return ''
	end
end

function InfoProvider:GetCreatorName()
	if GameAssetInfo ~= nil then
		return GameAssetInfo.Creator.Name
	else
		return ''
	end
end

function InfoProvider:LoadAssets()
	spawn(function()
		if PLACEID <= 0 then
			while game.PlaceId <= 0 do
				wait()
			end
			PLACEID = game.PlaceId
		end

		-- load game asset info
		coroutine.resume(coroutine.create(function()
			local success, result = pcall(function()
				GameAssetInfo = MPS:GetProductInfo(PLACEID)
			end)
			if not success then
				print("LoadingScript->InfoProvider:LoadAssets:", result)
			end
		end))
	end)
end

function MainGui:tileBackgroundTexture(frameToFill)
	if not frameToFill then return end
	frameToFill:ClearAllChildren()
	if backgroundImageTransparency < 1 then
		local backgroundTextureSize = Vector2.new(512, 512)
		for i = 0, math.ceil(frameToFill.AbsoluteSize.X/backgroundTextureSize.X) do
			for j = 0, math.ceil(frameToFill.AbsoluteSize.Y/backgroundTextureSize.Y) do
				create 'ImageLabel' {
					Name = 'BackgroundTextureImage',
					BackgroundTransparency = 1,
					ImageTransparency = backgroundImageTransparency,
					Image = 'rbxasset://textures/loading/darkLoadingTexture.png',
					Position = UDim2.new(0, i*backgroundTextureSize.X, 0, j*backgroundTextureSize.Y),
					Size = UDim2.new(0, backgroundTextureSize.X, 0, backgroundTextureSize.Y),
					ZIndex = 1,
					Parent = frameToFill
				}
			end
		end
	end
end

-- create a cancel binding for console to be able to cancel anytime while loading
local function createTenfootCancelGui()
	local cancelLabel = create'ImageLabel'
	{
		Name = "CancelLabel";
		Size = UDim2.new(0, 83, 0, 83);
		Position = UDim2.new(1, -32 - 83, 0, 32);
		BackgroundTransparency = 1;
		Image = 'rbxasset://textures/ui/Shell/ButtonIcons/BButton.png';
	}
	local cancelText = create'TextLabel'
	{
		Name = "CancelText";
		Size = UDim2.new(0, 0, 0, 0);
		Position = UDim2.new(1, -131, 0, 64);
		BackgroundTransparency = 1;
		FontSize = Enum.FontSize.Size36;
		TextXAlignment = Enum.TextXAlignment.Right;
		TextColor3 = COLORS.WHITE;
		Text = "Cancel";
	}

	-- bind cancel action
	local platformService = nil
	pcall(function()
		platformService = game:GetService('PlatformService')
	end)

	if platformService then
		if not game:GetService("ReplicatedFirst"):IsFinishedReplicating() then
			local seenBButtonBegin = false
			ContextActionService:BindCoreAction("CancelGameLoad",
				function(actionName, inputState, inputObject)
					if inputState == Enum.UserInputState.Begin then
						seenBButtonBegin = true
					elseif inputState == Enum.UserInputState.End and seenBButtonBegin then
						cancelLabel:Destroy()
						cancelText.Text = "Canceling..."
						cancelText.Position = UDim2.new(1, -32, 0, 64)
						ContextActionService:UnbindCoreAction('CancelGameLoad')
						platformService:RequestGameShutdown()
					end
				end,
				false,
				Enum.KeyCode.ButtonB)
		end
	end

	while cancelLabel.Parent == nil do
		if currScreenGui then
			local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
			if blackFrame then
				cancelLabel.Parent = blackFrame
				cancelText.Parent = blackFrame
				break
			end
		end
		wait()
	end
end

--
-- Declare member functions
function MainGui:GenerateMain()
	local screenGui = create 'ScreenGui' {
		Name = 'Custom2016LoadingGui' -- Renamed to prevent automatic self-deletion loop
	}

	--
	-- create descendant frames
	local mainBackgroundContainer = create 'Frame' {
		Name = 'BlackFrame',
		BackgroundColor3 = COLORS.BACKGROUND_COLOR,
		BackgroundTransparency = 0,
		Size = UDim2.new(1, 0, 1, 36),
		Position = UDim2.new(0, 0, 0, -36),
		Active = true,
		Parent = screenGui,
	}

		local closeButton =	create 'ImageButton' {
			Name = 'CloseButton',
			Image = 'rbxasset://textures/loading/cancelButton.png',
			ImageTransparency = 1,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -37, 0, 5),
			Size = UDim2.new(0, 32, 0, 32),
			Active = false,
			ZIndex = 10,
			Parent = mainBackgroundContainer,
		}

		local graphicsFrame = create 'Frame' {
			Name = 'GraphicsFrame',
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, (isMobile == true and -75 or (isTenFootInterface and -245 or -225)), 1, (isMobile == true and -75 or (isTenFootInterface and -185 or -165))),
			Size = UDim2.new(0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120)), 0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120))),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local loadingImage = create 'ImageLabel' {
				Name = 'LoadingImage',
				BackgroundTransparency = 1,
				Image = 'rbxasset://textures/loading/loadingCircle.png',
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2,
				Parent = graphicsFrame,
			}

			local loadingText = create 'TextLabel' {
				Name = 'LoadingText',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, (isMobile == true and -14 or -56), 1, 0),
				Position = UDim2.new(0, (isMobile == true and 12 or 28), 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isMobile == true and Enum.FontSize.Size12 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				TextXAlignment = Enum.TextXAlignment.Left,
				Visible = not isTenFootInterface,
				Text = "Loading...",
				ZIndex = 2,
				Parent = graphicsFrame,
			}

		local uiMessageFrame = create 'Frame' {
			Name = 'UiMessageFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0.25, 0, 1, -120),
			Size = UDim2.new(0.5, 0, 0, 80),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local uiMessage = create 'TextLabel' {
				Name = 'UiMessage',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Font = Enum.Font.SourceSansBold,
				FontSize = Enum.FontSize.Size18,
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				Text = "",
				ZIndex = 2,
				Parent = uiMessageFrame,
			}

		local infoFrame = create 'Frame' {
			Name = 'InfoFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0, (isMobile == true and 20 or 100), 1, (isMobile == true and -120 or -150)),
			Size = UDim2.new(0.4, 0, 0, 110),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local placeLabel = create 'TextLabel' {
				Name = 'PlaceLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 80),
				Position = UDim2.new(0, 0, 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size48 or Enum.FontSize.Size24),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Bottom,
				ZIndex = 2,
				Parent = infoFrame,
			}

			if isTenFootInterface then
				local byLabel = create'TextLabel' {
					Name = "ByLabel",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 36, 0, 30),
					Position = UDim2.new(0, 0, 0, 80),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size36,
					TextScaled = true,
					TextColor3 = COLORS.WHITE,
					TextStrokeTransparency = 0,
					Text = "By",
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
				local creatorIcon = create'ImageLabel' {
					Name = "CreatorIcon",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 30, 0, 30),
					Position = UDim2.new(0, 38, 0, 80),
					ImageTransparency = 0,
					Image = 'rbxasset://textures/ui/Shell/Icons/RobloxIcon32.png',
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
			end

			local creatorLabel = create 'TextLabel' {
				Name = 'CreatorLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.new(0, isTenFootInterface and 72 or 0, 0, 80),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size36 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ZIndex = 2,
				Parent = infoFrame,
			}

		local backgroundTextureFrame = create 'Frame' {
			Name = 'BackgroundTextureFrame',
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			ClipsDescendants = true,
			ZIndex = 1,
			BackgroundTransparency = 1,
			Parent = mainBackgroundContainer,
		}

	local errorFrame = create 'Frame' {
		Name = 'ErrorFrame',
		BackgroundColor3 = COLORS.ERROR,
		BorderSizePixel = 0,
		Position = UDim2.new(0.25,0,0,0),
		Size = UDim2.new(0.5, 0, 0, 80),
		ZIndex = 8,
		Visible = false,
		Parent = screenGui,
	}

		local errorText = create 'TextLabel' {
			Name = "ErrorText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			TextColor3 = COLORS.WHITE,
			Text = "",
			ZIndex = 8,
			Parent = errorFrame,
		}

	while not game:GetService("CoreGui") do
		wait()
	end
	screenGui.Parent = game:GetService("CoreGui")
	currScreenGui = screenGui
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

---------------------------------------------------------
-- Main Script (show something now + setup connections)

-- start loading assets asap
InfoProvider:LoadAssets()
MainGui:GenerateMain()
if isTenFootInterface then
	createTenfootCancelGui()
end

local lastRenderTime, lastDotUpdateTime, brickCountChange = nil, nil, nil
local fadeCycleTime = 1.7
local turnCycleTime = 2
local lastAbsoluteSize = Vector2.new(0, 0)
local loadingDots = "..."
local dotChangeTime = .2
local lastBrickCount = 0

renderSteppedConnection = game:GetService("RunService").RenderStepped:connect(function()
	if not currScreenGui then return end
	if not currScreenGui:FindFirstChild("BlackFrame") then return end

	if setVerb then
		currScreenGui.BlackFrame.CloseButton:SetVerb("Exit")
		setVerb = false
	end

	if currScreenGui.BlackFrame:FindFirstChild("BackgroundTextureFrame") and currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize ~= lastAbsoluteSize then
		lastAbsoluteSize = currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize
		MainGui:tileBackgroundTexture(currScreenGui.BlackFrame.BackgroundTextureFrame)
	end

	local infoFrame = currScreenGui.BlackFrame:FindFirstChild('InfoFrame')
	if infoFrame then
		-- set place name
		local placeLabel = infoFrame:FindFirstChild('PlaceLabel')
		if placeLabel and placeLabel.Text == "" then
			placeLabel.Text = InfoProvider:GetGameName()
		end

		-- set creator name
		local creatorLabel = infoFrame:FindFirstChild('CreatorLabel')
		if creatorLabel and creatorLabel.Text == "" then
			local creatorName = InfoProvider:GetCreatorName()
			if creatorName ~= "" then
				if isTenFootInterface then
					local showDevName = true
					if platform == Enum.Platform.XBoxOne then
						local success, result = pcall(function()
							return settings():GetFFlag("ShowDevNameInXboxApp")
						end)
						if success then
							showDevName = result
						end
					end
					creatorLabel.Text = showDevName and creatorName or ""
					local creatorIcon = infoFrame:FindFirstChild('CreatorIcon')
					local byLabel = infoFrame:FindFirstChild('ByLabel')
					if creatorIcon then creatorIcon.Visible = showDevName end
					if byLabel then byLabel.Visible = showDevName end
				else
					creatorLabel.Text = "By "..creatorName
				end
			end
		end
	end

	if not lastRenderTime then
		lastRenderTime = tick()
		lastDotUpdateTime = lastRenderTime
		return
	end

	local currentTime = tick()
	local fadeAmount = (currentTime - lastRenderTime) * fadeCycleTime
	local turnAmount = (currentTime - lastRenderTime) * (360/turnCycleTime)
	lastRenderTime = currentTime

	currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation = currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation + turnAmount

	local updateLoadingDots =  function()
		loadingDots = loadingDots.. "."
		if loadingDots == "...." then
			loadingDots = ""
		end
		currScreenGui.BlackFrame.GraphicsFrame.LoadingText.Text = "Loading" ..loadingDots
	end

	if currentTime - lastDotUpdateTime >= dotChangeTime and InfoProvider:GetCreatorName() == "" then
		lastDotUpdateTime = currentTime
		updateLoadingDots()
	else
		if guiService:GetBrickCount() > 0 then
			if brickCountChange == nil then
				brickCountChange = guiService:GetBrickCount()
			end
			if guiService:GetBrickCount() - lastBrickCount >= brickCountChange then
				lastBrickCount = guiService:GetBrickCount()
				updateLoadingDots()
			end
		end
	end

	if not isTenFootInterface then
		if currentTime - startTime > 5 and currScreenGui.BlackFrame.CloseButton.ImageTransparency > 0 then
			currScreenGui.BlackFrame.CloseButton.ImageTransparency = currScreenGui.BlackFrame.CloseButton.ImageTransparency - fadeAmount

			if currScreenGui.BlackFrame.CloseButton.ImageTransparency <= 0 then
				currScreenGui.BlackFrame.CloseButton.Active = true
			end
		end
	end
end)

spawn(function()
	local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
	local guiInsetChangedEvent = Instance.new("BindableEvent")
	guiInsetChangedEvent.Name = "GuiInsetChanged"
	guiInsetChangedEvent.Parent = RobloxGui
	guiInsetChangedEvent.Event:connect(function(x1, y1, x2, y2)
		if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
			currScreenGui.BlackFrame.Position = UDim2.new(0, -x1, 0, -y1)
			currScreenGui.BlackFrame.Size = UDim2.new(1, x1 + x2, 1, y1 + y2)
		end
	end)
end)

local leaveGameButton, leaveGameTextLabel, errorImage = nil

guiService.ErrorMessageChanged:connect(function()
	if guiService:GetErrorMessage() ~= '' then
		if isTenFootInterface then
			currScreenGui.ErrorFrame.Size = UDim2.new(1, 0, 0, 144)
			currScreenGui.ErrorFrame.Position = UDim2.new(0, 0, 0, 0)
			currScreenGui.ErrorFrame.BackgroundColor3 = COLORS.BLACK
			currScreenGui.ErrorFrame.BackgroundTransparency = 0.5
			currScreenGui.ErrorFrame.ErrorText.FontSize = Enum.FontSize.Size36
			currScreenGui.ErrorFrame.ErrorText.Position = UDim2.new(.3, 0, 0, 0)
			currScreenGui.ErrorFrame.ErrorText.Size = UDim2.new(.4, 0, 0, 144)
			if errorImage == nil then
				errorImage = Instance.new("ImageLabel")
				errorImage.Image = "rbxasset://textures/ui/ErrorIconSmall.png"
				errorImage.Size = UDim2.new(0, 96, 0, 79)
				errorImage.Position = UDim2.new(0.228125, 0, 0, 32)
				errorImage.ZIndex = 9
				errorImage.BackgroundTransparency = 1
				errorImage.Parent = currScreenGui.ErrorFrame
			end
			-- we show a B button to kill game data model on console
			if not isTenFootInterface then
				if leaveGameButton == nil then
					local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
					local utility = require(RobloxGui.Modules.Settings.Utility)
					local textLabel = nil
					leaveGameButton, leaveGameTextLabel = utility:MakeStyledButton("LeaveGame", "Leave", UDim2.new(0, 288, 0, 78))
					leaveGameButton:SetVerb("Exit")
					leaveGameButton.NextSelectionDown = leaveGameButton
					leaveGameButton.NextSelectionLeft = leaveGameButton
					leaveGameButton.NextSelectionRight = leaveGameButton
					leaveGameButton.NextSelectionUp = leaveGameButton
					leaveGameButton.ZIndex = 9
					leaveGameButton.Position = UDim2.new(0.771875, 0, 0, 37)
					leaveGameButton.Parent = currScreenGui.ErrorFrame
					leaveGameTextLabel.FontSize = Enum.FontSize.Size36
					leaveGameTextLabel.ZIndex = 10
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				else
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				end
			end
		end
		currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
		currScreenGui.ErrorFrame.Visible = true
		local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.CloseButton.ImageTransparency = 0
			blackFrame.CloseButton.Active = true
		end
	else
		currScreenGui.ErrorFrame.Visible = false
	end
end)

guiService.UiMessageChanged:connect(function(type, newMessage)
	if type == Enum.UiMessageType.UiMessageInfo then
		local blackFrame = currScreenGui and currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.UiMessageFrame.UiMessage.Text = newMessage
			if newMessage ~= '' then
				blackFrame.UiMessageFrame.Visible = true
			else
				blackFrame.UiMessageFrame.Visible = false
			end
		end
	end
end)

if guiService:GetErrorMessage() ~= '' then
	currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
	currScreenGui.ErrorFrame.Visible = true
end


function stopListeningToRenderingStep()
	if renderSteppedConnection then
		renderSteppedConnection:disconnect()
		renderSteppedConnection = nil
	end
end

function fadeAndDestroyBlackFrame(blackFrame)
	if destroyingBackground then return end
	destroyingBackground = true
	spawn(function()
		local infoFrame = blackFrame:FindFirstChild("InfoFrame")
		local graphicsFrame = blackFrame:FindFirstChild("GraphicsFrame")
		
		if blackFrame:FindFirstChild("InfoFrame") then
				local infoFrameChildren = infoFrame:GetChildren()
				local transparency = 0
				local rateChange = 1.8
				local lastUpdateTime = nil

				while transparency < 1 do
					if not lastUpdateTime then
						lastUpdateTime = tick()
					else
						local newTime = tick()
						transparency = transparency + rateChange * (newTime - lastUpdateTime)
						for i = 1, #infoFrameChildren do
							local child = infoFrameChildren[i]
							if child:IsA('TextLabel') then
								child.TextTransparency = transparency
								child.TextStrokeTransparency = transparency
							elseif child:IsA('ImageLabel') then
								child.ImageTransparency = transparency
							end
						end
						graphicsFrame.LoadingImage.ImageTransparency = transparency
						blackFrame.BackgroundTransparency = transparency

						if backgroundImageTransparency < 1 then
							backgroundImageTransparency = transparency
							local backgroundImages = blackFrame.BackgroundTextureFrame:GetChildren()
							for i = 1, #backgroundImages do
								backgroundImages[i].ImageTransparency = backgroundImageTransparency
							end
						end

						lastUpdateTime = newTime
					end
					wait()
				end
				if blackFrame ~= nil then
					stopListeningToRenderingStep()
					blackFrame:Destroy()
				end
		end
	end)
end

function destroyLoadingElements(instant)
	if not currScreenGui then return end
	if destroyedLoadingGui then return end
	destroyedLoadingGui = true

	local guiChildren = currScreenGui:GetChildren()
	for i=1, #guiChildren do
		-- need to keep this around in case we get a connection error later
		if guiChildren[i].Name ~= "ErrorFrame" then
			if guiChildren[i].Name == "BlackFrame" and not instant then
				fadeAndDestroyBlackFrame(guiChildren[i])
			else
				guiChildren[i]:Destroy()
			end
		end
	end
end

-- ====================================================================
-- FORCED DELETION SEQUENCE: REMOVES GUI AFTER EXACTLY 3 SECONDS NO MATTER WHAT
-- ====================================================================
hasReplicatedFirstElements = false

spawn(function()
	wait(3) -- Display duration forced to exactly 3 seconds
	if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
		if isTenFootInterface then
			ContextActionService:UnbindCoreAction('CancelGameLoad')
		end
		destroyLoadingElements(false)
	end
end)

local UserInputServiceChangedConn;
local function onUserInputServiceChanged(prop)
	if prop == 'VREnabled' then
		local UseVr = false
		pcall(function() UseVr = UIS.VREnabled end)

		if UseVr then
			if UserInputServiceChangedConn then
				UserInputServiceChangedConn:disconnect()
				UserInputServiceChangedConn = nil
			end
			if isTenFootInterface then
				ContextActionService:UnbindCoreAction('CancelGameLoad')
			end
			destroyLoadingElements(true)
			require(RobloxGui.Modules.LoadingScreen3D)
		end
	end
end

UserInputServiceChangedConn = UIS.Changed:connect(onUserInputServiceChanged)
onUserInputServiceChanged('VREnabled')

local Players = game:GetService("Players")

local function makeCharacterShiny(character)
    -- Loop through everything inside the character model
    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Catch any parts (like accessories or clothing limbs) that load in a split second later
    character.DescendantAdded:Connect(function(object)
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end)
end

-- Handle players who are already in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        makeCharacterShiny(player.Character)
    end
    player.CharacterAdded:Connect(makeCharacterShiny)
end

-- Handle players who join the server later
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(makeCharacterShiny)
end)

getgenv().LegacySettings = ({
    Year = 2016, -- only 2012 to 2016 allowed (if unavailable, it will be set to 2016 by default)
    OldGraphics = true, -- changes graphics to be more like the 2016 graphics
    HideDisplayName = true, -- changes other users nametags to show their username instead of display name
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/Legacy/refs/heads/main/Source.luau"))(); ]], 
	Topbar_2015    = [[ --CONTEXT: This script was taken from 2016 corescripts off of ROBLOX's github


spawn(function()
	local LoadingGui = game:WaitForChild("CoreGui"):WaitForChild("RobloxLoadingGui")
	LoadingGui.Enabled = false
	LoadingGui:Destroy()
end)

-- Creates the generic "ROBLOX" loading screen on startup
-- Written by ArceusInator & Ben Tkacheff, 2014

-- Constants
local PLACEID = game.PlaceId

local MPS = game:GetService('MarketplaceService')
local UIS = game:GetService('UserInputService')
local guiService = game:GetService("GuiService")
local ContextActionService = game:GetService('ContextActionService')
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

local startTime = tick()

local COLORS = {
	BLACK = Color3.new(0, 0, 0),
	BACKGROUND_COLOR = Color3.new(45/255, 45/255, 45/255),
	WHITE = Color3.new(1, 1, 1),
	ERROR = Color3.new(253/255,68/255,72/255)
}

local function getViewportSize()
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:wait()
	end

	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0,0) do
		game.Workspace.CurrentCamera.Changed:wait()
	end

	return game.Workspace.CurrentCamera.ViewportSize
end

--
-- Variables
local GameAssetInfo -- loaded by InfoProvider:LoadAssets()
local currScreenGui, renderSteppedConnection = nil, nil
local destroyingBackground, destroyedLoadingGui, hasReplicatedFirstElements = false, false, false
local backgroundImageTransparency = 0
local isMobile = (UIS.TouchEnabled == true and UIS.MouseEnabled == false and getViewportSize().Y <= 500)
local isTenFootInterface = guiService:IsTenFootInterface()
local platform = UIS:GetPlatform()

local function IsConvertMyPlaceNameInXboxAppEnabled()
	if UIS:GetPlatform() == Enum.Platform.XBoxOne then
		local success, flagValue = pcall(function() return settings():GetFFlag("ConvertMyPlaceNameInXboxApp") end)
		return (success and flagValue == true)
	end
	return false
end

--
-- Utility functions
local create = function(className, defaultParent)
	return function(propertyList)
		local object = Instance.new(className)
		local parent = nil

		for index, value in next, propertyList do
			if type(index) == 'string' then
				if index == 'Parent' then
					parent = value
				else
					object[index] = value
				end
			else
				if type(value) == 'function' then
					value(object)
				elseif type(value) == 'userdata' then
					value.Parent = object
				end
			end
		end
		
		if parent then
			object.Parent = parent
		end

		if object.Parent == nil then
			object.Parent = defaultParent
		end

		return object
	end
end

--
-- Create objects

local MainGui = {}
local InfoProvider = {}


function ExtractGeneratedUsername(gameName)
	local tempUsername = string.match(gameName, "^([0-9a-fA-F]+)'s Place$")
	if tempUsername and #tempUsername == 32 then
		return tempUsername
	end
end

-- Fix places that have been made with incorrect temporary usernames
function GetFilteredGameName(gameName, creatorName)
	if gameName and type(gameName) == 'string' then
		local tempUsername = ExtractGeneratedUsername(gameName)
		if tempUsername then
			local newGameName = string.gsub(gameName, tempUsername, creatorName, 1)
			if newGameName then
				return newGameName
			end
		end
	end
	return gameName
end


function InfoProvider:GetGameName()
	if GameAssetInfo ~= nil then
		if IsConvertMyPlaceNameInXboxAppEnabled() then
			return GetFilteredGameName(GameAssetInfo.Name, self:GetCreatorName())
		else
			return GameAssetInfo.Name
		end
	else
		return ''
	end
end

function InfoProvider:GetCreatorName()
	if GameAssetInfo ~= nil then
		return GameAssetInfo.Creator.Name
	else
		return ''
	end
end

function InfoProvider:LoadAssets()
	spawn(function()
		if PLACEID <= 0 then
			while game.PlaceId <= 0 do
				wait()
			end
			PLACEID = game.PlaceId
		end

		-- load game asset info
		coroutine.resume(coroutine.create(function()
			local success, result = pcall(function()
				GameAssetInfo = MPS:GetProductInfo(PLACEID)
			end)
			if not success then
				print("LoadingScript->InfoProvider:LoadAssets:", result)
			end
		end))
	end)
end

function MainGui:tileBackgroundTexture(frameToFill)
	if not frameToFill then return end
	frameToFill:ClearAllChildren()
	if backgroundImageTransparency < 1 then
		local backgroundTextureSize = Vector2.new(512, 512)
		for i = 0, math.ceil(frameToFill.AbsoluteSize.X/backgroundTextureSize.X) do
			for j = 0, math.ceil(frameToFill.AbsoluteSize.Y/backgroundTextureSize.Y) do
				create 'ImageLabel' {
					Name = 'BackgroundTextureImage',
					BackgroundTransparency = 1,
					ImageTransparency = backgroundImageTransparency,
					Image = 'rbxasset://textures/loading/darkLoadingTexture.png',
					Position = UDim2.new(0, i*backgroundTextureSize.X, 0, j*backgroundTextureSize.Y),
					Size = UDim2.new(0, backgroundTextureSize.X, 0, backgroundTextureSize.Y),
					ZIndex = 1,
					Parent = frameToFill
				}
			end
		end
	end
end

-- create a cancel binding for console to be able to cancel anytime while loading
local function createTenfootCancelGui()
	local cancelLabel = create'ImageLabel'
	{
		Name = "CancelLabel";
		Size = UDim2.new(0, 83, 0, 83);
		Position = UDim2.new(1, -32 - 83, 0, 32);
		BackgroundTransparency = 1;
		Image = 'rbxasset://textures/ui/Shell/ButtonIcons/BButton.png';
	}
	local cancelText = create'TextLabel'
	{
		Name = "CancelText";
		Size = UDim2.new(0, 0, 0, 0);
		Position = UDim2.new(1, -131, 0, 64);
		BackgroundTransparency = 1;
		FontSize = Enum.FontSize.Size36;
		TextXAlignment = Enum.TextXAlignment.Right;
		TextColor3 = COLORS.WHITE;
		Text = "Cancel";
	}

	-- bind cancel action
	local platformService = nil
	pcall(function()
		platformService = game:GetService('PlatformService')
	end)

	if platformService then
		if not game:GetService("ReplicatedFirst"):IsFinishedReplicating() then
			local seenBButtonBegin = false
			ContextActionService:BindCoreAction("CancelGameLoad",
				function(actionName, inputState, inputObject)
					if inputState == Enum.UserInputState.Begin then
						seenBButtonBegin = true
					elseif inputState == Enum.UserInputState.End and seenBButtonBegin then
						cancelLabel:Destroy()
						cancelText.Text = "Canceling..."
						cancelText.Position = UDim2.new(1, -32, 0, 64)
						ContextActionService:UnbindCoreAction('CancelGameLoad')
						platformService:RequestGameShutdown()
					end
				end,
				false,
				Enum.KeyCode.ButtonB)
		end
	end

	while cancelLabel.Parent == nil do
		if currScreenGui then
			local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
			if blackFrame then
				cancelLabel.Parent = blackFrame
				cancelText.Parent = blackFrame
				break
			end
		end
		wait()
	end
end

--
-- Declare member functions
function MainGui:GenerateMain()
	local screenGui = create 'ScreenGui' {
		Name = 'Custom2016LoadingGui' -- Renamed to prevent automatic self-deletion loop
	}

	--
	-- create descendant frames
	local mainBackgroundContainer = create 'Frame' {
		Name = 'BlackFrame',
		BackgroundColor3 = COLORS.BACKGROUND_COLOR,
		BackgroundTransparency = 0,
		Size = UDim2.new(1, 0, 1, 36),
		Position = UDim2.new(0, 0, 0, -36),
		Active = true,
		Parent = screenGui,
	}

		local closeButton =	create 'ImageButton' {
			Name = 'CloseButton',
			Image = 'rbxasset://textures/loading/cancelButton.png',
			ImageTransparency = 1,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -37, 0, 5),
			Size = UDim2.new(0, 32, 0, 32),
			Active = false,
			ZIndex = 10,
			Parent = mainBackgroundContainer,
		}

		local graphicsFrame = create 'Frame' {
			Name = 'GraphicsFrame',
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, (isMobile == true and -75 or (isTenFootInterface and -245 or -225)), 1, (isMobile == true and -75 or (isTenFootInterface and -185 or -165))),
			Size = UDim2.new(0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120)), 0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120))),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local loadingImage = create 'ImageLabel' {
				Name = 'LoadingImage',
				BackgroundTransparency = 1,
				Image = 'rbxasset://textures/loading/loadingCircle.png',
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2,
				Parent = graphicsFrame,
			}

			local loadingText = create 'TextLabel' {
				Name = 'LoadingText',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, (isMobile == true and -14 or -56), 1, 0),
				Position = UDim2.new(0, (isMobile == true and 12 or 28), 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isMobile == true and Enum.FontSize.Size12 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				TextXAlignment = Enum.TextXAlignment.Left,
				Visible = not isTenFootInterface,
				Text = "Loading...",
				ZIndex = 2,
				Parent = graphicsFrame,
			}

		local uiMessageFrame = create 'Frame' {
			Name = 'UiMessageFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0.25, 0, 1, -120),
			Size = UDim2.new(0.5, 0, 0, 80),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local uiMessage = create 'TextLabel' {
				Name = 'UiMessage',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Font = Enum.Font.SourceSansBold,
				FontSize = Enum.FontSize.Size18,
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				Text = "",
				ZIndex = 2,
				Parent = uiMessageFrame,
			}

		local infoFrame = create 'Frame' {
			Name = 'InfoFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0, (isMobile == true and 20 or 100), 1, (isMobile == true and -120 or -150)),
			Size = UDim2.new(0.4, 0, 0, 110),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local placeLabel = create 'TextLabel' {
				Name = 'PlaceLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 80),
				Position = UDim2.new(0, 0, 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size48 or Enum.FontSize.Size24),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Bottom,
				ZIndex = 2,
				Parent = infoFrame,
			}

			if isTenFootInterface then
				local byLabel = create'TextLabel' {
					Name = "ByLabel",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 36, 0, 30),
					Position = UDim2.new(0, 0, 0, 80),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size36,
					TextScaled = true,
					TextColor3 = COLORS.WHITE,
					TextStrokeTransparency = 0,
					Text = "By",
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
				local creatorIcon = create'ImageLabel' {
					Name = "CreatorIcon",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 30, 0, 30),
					Position = UDim2.new(0, 38, 0, 80),
					ImageTransparency = 0,
					Image = 'rbxasset://textures/ui/Shell/Icons/RobloxIcon32.png',
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
			end

			local creatorLabel = create 'TextLabel' {
				Name = 'CreatorLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.new(0, isTenFootInterface and 72 or 0, 0, 80),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size36 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ZIndex = 2,
				Parent = infoFrame,
			}

		local backgroundTextureFrame = create 'Frame' {
			Name = 'BackgroundTextureFrame',
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			ClipsDescendants = true,
			ZIndex = 1,
			BackgroundTransparency = 1,
			Parent = mainBackgroundContainer,
		}

	local errorFrame = create 'Frame' {
		Name = 'ErrorFrame',
		BackgroundColor3 = COLORS.ERROR,
		BorderSizePixel = 0,
		Position = UDim2.new(0.25,0,0,0),
		Size = UDim2.new(0.5, 0, 0, 80),
		ZIndex = 8,
		Visible = false,
		Parent = screenGui,
	}

		local errorText = create 'TextLabel' {
			Name = "ErrorText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			TextColor3 = COLORS.WHITE,
			Text = "",
			ZIndex = 8,
			Parent = errorFrame,
		}

	while not game:GetService("CoreGui") do
		wait()
	end
	screenGui.Parent = game:GetService("CoreGui")
	currScreenGui = screenGui
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

---------------------------------------------------------
-- Main Script (show something now + setup connections)

-- start loading assets asap
InfoProvider:LoadAssets()
MainGui:GenerateMain()
if isTenFootInterface then
	createTenfootCancelGui()
end

local lastRenderTime, lastDotUpdateTime, brickCountChange = nil, nil, nil
local fadeCycleTime = 1.7
local turnCycleTime = 2
local lastAbsoluteSize = Vector2.new(0, 0)
local loadingDots = "..."
local dotChangeTime = .2
local lastBrickCount = 0

renderSteppedConnection = game:GetService("RunService").RenderStepped:connect(function()
	if not currScreenGui then return end
	if not currScreenGui:FindFirstChild("BlackFrame") then return end

	if setVerb then
		currScreenGui.BlackFrame.CloseButton:SetVerb("Exit")
		setVerb = false
	end

	if currScreenGui.BlackFrame:FindFirstChild("BackgroundTextureFrame") and currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize ~= lastAbsoluteSize then
		lastAbsoluteSize = currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize
		MainGui:tileBackgroundTexture(currScreenGui.BlackFrame.BackgroundTextureFrame)
	end

	local infoFrame = currScreenGui.BlackFrame:FindFirstChild('InfoFrame')
	if infoFrame then
		-- set place name
		local placeLabel = infoFrame:FindFirstChild('PlaceLabel')
		if placeLabel and placeLabel.Text == "" then
			placeLabel.Text = InfoProvider:GetGameName()
		end

		-- set creator name
		local creatorLabel = infoFrame:FindFirstChild('CreatorLabel')
		if creatorLabel and creatorLabel.Text == "" then
			local creatorName = InfoProvider:GetCreatorName()
			if creatorName ~= "" then
				if isTenFootInterface then
					local showDevName = true
					if platform == Enum.Platform.XBoxOne then
						local success, result = pcall(function()
							return settings():GetFFlag("ShowDevNameInXboxApp")
						end)
						if success then
							showDevName = result
						end
					end
					creatorLabel.Text = showDevName and creatorName or ""
					local creatorIcon = infoFrame:FindFirstChild('CreatorIcon')
					local byLabel = infoFrame:FindFirstChild('ByLabel')
					if creatorIcon then creatorIcon.Visible = showDevName end
					if byLabel then byLabel.Visible = showDevName end
				else
					creatorLabel.Text = "By "..creatorName
				end
			end
		end
	end

	if not lastRenderTime then
		lastRenderTime = tick()
		lastDotUpdateTime = lastRenderTime
		return
	end

	local currentTime = tick()
	local fadeAmount = (currentTime - lastRenderTime) * fadeCycleTime
	local turnAmount = (currentTime - lastRenderTime) * (360/turnCycleTime)
	lastRenderTime = currentTime

	currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation = currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation + turnAmount

	local updateLoadingDots =  function()
		loadingDots = loadingDots.. "."
		if loadingDots == "...." then
			loadingDots = ""
		end
		currScreenGui.BlackFrame.GraphicsFrame.LoadingText.Text = "Loading" ..loadingDots
	end

	if currentTime - lastDotUpdateTime >= dotChangeTime and InfoProvider:GetCreatorName() == "" then
		lastDotUpdateTime = currentTime
		updateLoadingDots()
	else
		if guiService:GetBrickCount() > 0 then
			if brickCountChange == nil then
				brickCountChange = guiService:GetBrickCount()
			end
			if guiService:GetBrickCount() - lastBrickCount >= brickCountChange then
				lastBrickCount = guiService:GetBrickCount()
				updateLoadingDots()
			end
		end
	end

	if not isTenFootInterface then
		if currentTime - startTime > 5 and currScreenGui.BlackFrame.CloseButton.ImageTransparency > 0 then
			currScreenGui.BlackFrame.CloseButton.ImageTransparency = currScreenGui.BlackFrame.CloseButton.ImageTransparency - fadeAmount

			if currScreenGui.BlackFrame.CloseButton.ImageTransparency <= 0 then
				currScreenGui.BlackFrame.CloseButton.Active = true
			end
		end
	end
end)

spawn(function()
	local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
	local guiInsetChangedEvent = Instance.new("BindableEvent")
	guiInsetChangedEvent.Name = "GuiInsetChanged"
	guiInsetChangedEvent.Parent = RobloxGui
	guiInsetChangedEvent.Event:connect(function(x1, y1, x2, y2)
		if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
			currScreenGui.BlackFrame.Position = UDim2.new(0, -x1, 0, -y1)
			currScreenGui.BlackFrame.Size = UDim2.new(1, x1 + x2, 1, y1 + y2)
		end
	end)
end)

local leaveGameButton, leaveGameTextLabel, errorImage = nil

guiService.ErrorMessageChanged:connect(function()
	if guiService:GetErrorMessage() ~= '' then
		if isTenFootInterface then
			currScreenGui.ErrorFrame.Size = UDim2.new(1, 0, 0, 144)
			currScreenGui.ErrorFrame.Position = UDim2.new(0, 0, 0, 0)
			currScreenGui.ErrorFrame.BackgroundColor3 = COLORS.BLACK
			currScreenGui.ErrorFrame.BackgroundTransparency = 0.5
			currScreenGui.ErrorFrame.ErrorText.FontSize = Enum.FontSize.Size36
			currScreenGui.ErrorFrame.ErrorText.Position = UDim2.new(.3, 0, 0, 0)
			currScreenGui.ErrorFrame.ErrorText.Size = UDim2.new(.4, 0, 0, 144)
			if errorImage == nil then
				errorImage = Instance.new("ImageLabel")
				errorImage.Image = "rbxasset://textures/ui/ErrorIconSmall.png"
				errorImage.Size = UDim2.new(0, 96, 0, 79)
				errorImage.Position = UDim2.new(0.228125, 0, 0, 32)
				errorImage.ZIndex = 9
				errorImage.BackgroundTransparency = 1
				errorImage.Parent = currScreenGui.ErrorFrame
			end
			-- we show a B button to kill game data model on console
			if not isTenFootInterface then
				if leaveGameButton == nil then
					local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
					local utility = require(RobloxGui.Modules.Settings.Utility)
					local textLabel = nil
					leaveGameButton, leaveGameTextLabel = utility:MakeStyledButton("LeaveGame", "Leave", UDim2.new(0, 288, 0, 78))
					leaveGameButton:SetVerb("Exit")
					leaveGameButton.NextSelectionDown = leaveGameButton
					leaveGameButton.NextSelectionLeft = leaveGameButton
					leaveGameButton.NextSelectionRight = leaveGameButton
					leaveGameButton.NextSelectionUp = leaveGameButton
					leaveGameButton.ZIndex = 9
					leaveGameButton.Position = UDim2.new(0.771875, 0, 0, 37)
					leaveGameButton.Parent = currScreenGui.ErrorFrame
					leaveGameTextLabel.FontSize = Enum.FontSize.Size36
					leaveGameTextLabel.ZIndex = 10
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				else
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				end
			end
		end
		currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
		currScreenGui.ErrorFrame.Visible = true
		local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.CloseButton.ImageTransparency = 0
			blackFrame.CloseButton.Active = true
		end
	else
		currScreenGui.ErrorFrame.Visible = false
	end
end)

guiService.UiMessageChanged:connect(function(type, newMessage)
	if type == Enum.UiMessageType.UiMessageInfo then
		local blackFrame = currScreenGui and currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.UiMessageFrame.UiMessage.Text = newMessage
			if newMessage ~= '' then
				blackFrame.UiMessageFrame.Visible = true
			else
				blackFrame.UiMessageFrame.Visible = false
			end
		end
	end
end)

if guiService:GetErrorMessage() ~= '' then
	currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
	currScreenGui.ErrorFrame.Visible = true
end


function stopListeningToRenderingStep()
	if renderSteppedConnection then
		renderSteppedConnection:disconnect()
		renderSteppedConnection = nil
	end
end

function fadeAndDestroyBlackFrame(blackFrame)
	if destroyingBackground then return end
	destroyingBackground = true
	spawn(function()
		local infoFrame = blackFrame:FindFirstChild("InfoFrame")
		local graphicsFrame = blackFrame:FindFirstChild("GraphicsFrame")
		
		if blackFrame:FindFirstChild("InfoFrame") then
				local infoFrameChildren = infoFrame:GetChildren()
				local transparency = 0
				local rateChange = 1.8
				local lastUpdateTime = nil

				while transparency < 1 do
					if not lastUpdateTime then
						lastUpdateTime = tick()
					else
						local newTime = tick()
						transparency = transparency + rateChange * (newTime - lastUpdateTime)
						for i = 1, #infoFrameChildren do
							local child = infoFrameChildren[i]
							if child:IsA('TextLabel') then
								child.TextTransparency = transparency
								child.TextStrokeTransparency = transparency
							elseif child:IsA('ImageLabel') then
								child.ImageTransparency = transparency
							end
						end
						graphicsFrame.LoadingImage.ImageTransparency = transparency
						blackFrame.BackgroundTransparency = transparency

						if backgroundImageTransparency < 1 then
							backgroundImageTransparency = transparency
							local backgroundImages = blackFrame.BackgroundTextureFrame:GetChildren()
							for i = 1, #backgroundImages do
								backgroundImages[i].ImageTransparency = backgroundImageTransparency
							end
						end

						lastUpdateTime = newTime
					end
					wait()
				end
				if blackFrame ~= nil then
					stopListeningToRenderingStep()
					blackFrame:Destroy()
				end
		end
	end)
end

function destroyLoadingElements(instant)
	if not currScreenGui then return end
	if destroyedLoadingGui then return end
	destroyedLoadingGui = true

	local guiChildren = currScreenGui:GetChildren()
	for i=1, #guiChildren do
		-- need to keep this around in case we get a connection error later
		if guiChildren[i].Name ~= "ErrorFrame" then
			if guiChildren[i].Name == "BlackFrame" and not instant then
				fadeAndDestroyBlackFrame(guiChildren[i])
			else
				guiChildren[i]:Destroy()
			end
		end
	end
end

-- ====================================================================
-- FORCED DELETION SEQUENCE: REMOVES GUI AFTER EXACTLY 3 SECONDS NO MATTER WHAT
-- ====================================================================
hasReplicatedFirstElements = false

spawn(function()
	wait(3) -- Display duration forced to exactly 3 seconds
	if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
		if isTenFootInterface then
			ContextActionService:UnbindCoreAction('CancelGameLoad')
		end
		destroyLoadingElements(false)
	end
end)

local UserInputServiceChangedConn;
local function onUserInputServiceChanged(prop)
	if prop == 'VREnabled' then
		local UseVr = false
		pcall(function() UseVr = UIS.VREnabled end)

		if UseVr then
			if UserInputServiceChangedConn then
				UserInputServiceChangedConn:disconnect()
				UserInputServiceChangedConn = nil
			end
			if isTenFootInterface then
				ContextActionService:UnbindCoreAction('CancelGameLoad')
			end
			destroyLoadingElements(true)
			require(RobloxGui.Modules.LoadingScreen3D)
		end
	end
end

UserInputServiceChangedConn = UIS.Changed:connect(onUserInputServiceChanged)
onUserInputServiceChanged('VREnabled')

local Players = game:GetService("Players")

local function makeCharacterShiny(character)
    -- Loop through everything inside the character model
    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Catch any parts (like accessories or clothing limbs) that load in a split second later
    character.DescendantAdded:Connect(function(object)
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end)
end

-- Handle players who are already in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        makeCharacterShiny(player.Character)
    end
    player.CharacterAdded:Connect(makeCharacterShiny)
end

-- Handle players who join the server later
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(makeCharacterShiny)
end)

getgenv().LegacySettings = ({
    Year = 2015, -- only 2012 to 2016 allowed (if unavailable, it will be set to 2016 by default)
    OldGraphics = true, -- changes graphics to be more like the 2016 graphics
    HideDisplayName = true, -- changes other users nametags to show their username instead of display name
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/Legacy/refs/heads/main/Source.luau"))(); ]],
    Topbar_2014    = [[ --CONTEXT: This script was taken from 2016 corescripts off of ROBLOX's github


spawn(function()
	local LoadingGui = game:WaitForChild("CoreGui"):WaitForChild("RobloxLoadingGui")
	LoadingGui.Enabled = false
	LoadingGui:Destroy()
end)

-- Creates the generic "ROBLOX" loading screen on startup
-- Written by ArceusInator & Ben Tkacheff, 2014

-- Constants
local PLACEID = game.PlaceId

local MPS = game:GetService('MarketplaceService')
local UIS = game:GetService('UserInputService')
local guiService = game:GetService("GuiService")
local ContextActionService = game:GetService('ContextActionService')
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")

local startTime = tick()

local COLORS = {
	BLACK = Color3.new(0, 0, 0),
	BACKGROUND_COLOR = Color3.new(45/255, 45/255, 45/255),
	WHITE = Color3.new(1, 1, 1),
	ERROR = Color3.new(253/255,68/255,72/255)
}

local function getViewportSize()
	while not game.Workspace.CurrentCamera do
		game.Workspace.Changed:wait()
	end

	while game.Workspace.CurrentCamera.ViewportSize == Vector2.new(0,0) do
		game.Workspace.CurrentCamera.Changed:wait()
	end

	return game.Workspace.CurrentCamera.ViewportSize
end

--
-- Variables
local GameAssetInfo -- loaded by InfoProvider:LoadAssets()
local currScreenGui, renderSteppedConnection = nil, nil
local destroyingBackground, destroyedLoadingGui, hasReplicatedFirstElements = false, false, false
local backgroundImageTransparency = 0
local isMobile = (UIS.TouchEnabled == true and UIS.MouseEnabled == false and getViewportSize().Y <= 500)
local isTenFootInterface = guiService:IsTenFootInterface()
local platform = UIS:GetPlatform()

local function IsConvertMyPlaceNameInXboxAppEnabled()
	if UIS:GetPlatform() == Enum.Platform.XBoxOne then
		local success, flagValue = pcall(function() return settings():GetFFlag("ConvertMyPlaceNameInXboxApp") end)
		return (success and flagValue == true)
	end
	return false
end

--
-- Utility functions
local create = function(className, defaultParent)
	return function(propertyList)
		local object = Instance.new(className)
		local parent = nil

		for index, value in next, propertyList do
			if type(index) == 'string' then
				if index == 'Parent' then
					parent = value
				else
					object[index] = value
				end
			else
				if type(value) == 'function' then
					value(object)
				elseif type(value) == 'userdata' then
					value.Parent = object
				end
			end
		end
		
		if parent then
			object.Parent = parent
		end

		if object.Parent == nil then
			object.Parent = defaultParent
		end

		return object
	end
end

--
-- Create objects

local MainGui = {}
local InfoProvider = {}


function ExtractGeneratedUsername(gameName)
	local tempUsername = string.match(gameName, "^([0-9a-fA-F]+)'s Place$")
	if tempUsername and #tempUsername == 32 then
		return tempUsername
	end
end

-- Fix places that have been made with incorrect temporary usernames
function GetFilteredGameName(gameName, creatorName)
	if gameName and type(gameName) == 'string' then
		local tempUsername = ExtractGeneratedUsername(gameName)
		if tempUsername then
			local newGameName = string.gsub(gameName, tempUsername, creatorName, 1)
			if newGameName then
				return newGameName
			end
		end
	end
	return gameName
end


function InfoProvider:GetGameName()
	if GameAssetInfo ~= nil then
		if IsConvertMyPlaceNameInXboxAppEnabled() then
			return GetFilteredGameName(GameAssetInfo.Name, self:GetCreatorName())
		else
			return GameAssetInfo.Name
		end
	else
		return ''
	end
end

function InfoProvider:GetCreatorName()
	if GameAssetInfo ~= nil then
		return GameAssetInfo.Creator.Name
	else
		return ''
	end
end

function InfoProvider:LoadAssets()
	spawn(function()
		if PLACEID <= 0 then
			while game.PlaceId <= 0 do
				wait()
			end
			PLACEID = game.PlaceId
		end

		-- load game asset info
		coroutine.resume(coroutine.create(function()
			local success, result = pcall(function()
				GameAssetInfo = MPS:GetProductInfo(PLACEID)
			end)
			if not success then
				print("LoadingScript->InfoProvider:LoadAssets:", result)
			end
		end))
	end)
end

function MainGui:tileBackgroundTexture(frameToFill)
	if not frameToFill then return end
	frameToFill:ClearAllChildren()
	if backgroundImageTransparency < 1 then
		local backgroundTextureSize = Vector2.new(512, 512)
		for i = 0, math.ceil(frameToFill.AbsoluteSize.X/backgroundTextureSize.X) do
			for j = 0, math.ceil(frameToFill.AbsoluteSize.Y/backgroundTextureSize.Y) do
				create 'ImageLabel' {
					Name = 'BackgroundTextureImage',
					BackgroundTransparency = 1,
					ImageTransparency = backgroundImageTransparency,
					Image = 'rbxasset://textures/loading/darkLoadingTexture.png',
					Position = UDim2.new(0, i*backgroundTextureSize.X, 0, j*backgroundTextureSize.Y),
					Size = UDim2.new(0, backgroundTextureSize.X, 0, backgroundTextureSize.Y),
					ZIndex = 1,
					Parent = frameToFill
				}
			end
		end
	end
end

-- create a cancel binding for console to be able to cancel anytime while loading
local function createTenfootCancelGui()
	local cancelLabel = create'ImageLabel'
	{
		Name = "CancelLabel";
		Size = UDim2.new(0, 83, 0, 83);
		Position = UDim2.new(1, -32 - 83, 0, 32);
		BackgroundTransparency = 1;
		Image = 'rbxasset://textures/ui/Shell/ButtonIcons/BButton.png';
	}
	local cancelText = create'TextLabel'
	{
		Name = "CancelText";
		Size = UDim2.new(0, 0, 0, 0);
		Position = UDim2.new(1, -131, 0, 64);
		BackgroundTransparency = 1;
		FontSize = Enum.FontSize.Size36;
		TextXAlignment = Enum.TextXAlignment.Right;
		TextColor3 = COLORS.WHITE;
		Text = "Cancel";
	}

	-- bind cancel action
	local platformService = nil
	pcall(function()
		platformService = game:GetService('PlatformService')
	end)

	if platformService then
		if not game:GetService("ReplicatedFirst"):IsFinishedReplicating() then
			local seenBButtonBegin = false
			ContextActionService:BindCoreAction("CancelGameLoad",
				function(actionName, inputState, inputObject)
					if inputState == Enum.UserInputState.Begin then
						seenBButtonBegin = true
					elseif inputState == Enum.UserInputState.End and seenBButtonBegin then
						cancelLabel:Destroy()
						cancelText.Text = "Canceling..."
						cancelText.Position = UDim2.new(1, -32, 0, 64)
						ContextActionService:UnbindCoreAction('CancelGameLoad')
						platformService:RequestGameShutdown()
					end
				end,
				false,
				Enum.KeyCode.ButtonB)
		end
	end

	while cancelLabel.Parent == nil do
		if currScreenGui then
			local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
			if blackFrame then
				cancelLabel.Parent = blackFrame
				cancelText.Parent = blackFrame
				break
			end
		end
		wait()
	end
end

--
-- Declare member functions
function MainGui:GenerateMain()
	local screenGui = create 'ScreenGui' {
		Name = 'Custom2016LoadingGui' -- Renamed to prevent automatic self-deletion loop
	}

	--
	-- create descendant frames
	local mainBackgroundContainer = create 'Frame' {
		Name = 'BlackFrame',
		BackgroundColor3 = COLORS.BACKGROUND_COLOR,
		BackgroundTransparency = 0,
		Size = UDim2.new(1, 0, 1, 36),
		Position = UDim2.new(0, 0, 0, -36),
		Active = true,
		Parent = screenGui,
	}

		local closeButton =	create 'ImageButton' {
			Name = 'CloseButton',
			Image = 'rbxasset://textures/loading/cancelButton.png',
			ImageTransparency = 1,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, -37, 0, 5),
			Size = UDim2.new(0, 32, 0, 32),
			Active = false,
			ZIndex = 10,
			Parent = mainBackgroundContainer,
		}

		local graphicsFrame = create 'Frame' {
			Name = 'GraphicsFrame',
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Position = UDim2.new(1, (isMobile == true and -75 or (isTenFootInterface and -245 or -225)), 1, (isMobile == true and -75 or (isTenFootInterface and -185 or -165))),
			Size = UDim2.new(0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120)), 0, (isMobile == true and 70 or (isTenFootInterface and 140 or 120))),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local loadingImage = create 'ImageLabel' {
				Name = 'LoadingImage',
				BackgroundTransparency = 1,
				Image = 'rbxasset://textures/loading/loadingCircle.png',
				Position = UDim2.new(0, 0, 0, 0),
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2,
				Parent = graphicsFrame,
			}

			local loadingText = create 'TextLabel' {
				Name = 'LoadingText',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, (isMobile == true and -14 or -56), 1, 0),
				Position = UDim2.new(0, (isMobile == true and 12 or 28), 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isMobile == true and Enum.FontSize.Size12 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				TextXAlignment = Enum.TextXAlignment.Left,
				Visible = not isTenFootInterface,
				Text = "Loading...",
				ZIndex = 2,
				Parent = graphicsFrame,
			}

		local uiMessageFrame = create 'Frame' {
			Name = 'UiMessageFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0.25, 0, 1, -120),
			Size = UDim2.new(0.5, 0, 0, 80),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local uiMessage = create 'TextLabel' {
				Name = 'UiMessage',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Font = Enum.Font.SourceSansBold,
				FontSize = Enum.FontSize.Size18,
				TextWrapped = true,
				TextColor3 = COLORS.WHITE,
				Text = "",
				ZIndex = 2,
				Parent = uiMessageFrame,
			}

		local infoFrame = create 'Frame' {
			Name = 'InfoFrame',
			BackgroundTransparency = 1,
			Position = UDim2.new(0, (isMobile == true and 20 or 100), 1, (isMobile == true and -120 or -150)),
			Size = UDim2.new(0.4, 0, 0, 110),
			ZIndex = 2,
			Parent = mainBackgroundContainer,
		}

			local placeLabel = create 'TextLabel' {
				Name = 'PlaceLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 80),
				Position = UDim2.new(0, 0, 0, 0),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size48 or Enum.FontSize.Size24),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Bottom,
				ZIndex = 2,
				Parent = infoFrame,
			}

			if isTenFootInterface then
				local byLabel = create'TextLabel' {
					Name = "ByLabel",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 36, 0, 30),
					Position = UDim2.new(0, 0, 0, 80),
					Font = Enum.Font.SourceSans,
					FontSize = Enum.FontSize.Size36,
					TextScaled = true,
					TextColor3 = COLORS.WHITE,
					TextStrokeTransparency = 0,
					Text = "By",
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Top,
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
				local creatorIcon = create'ImageLabel' {
					Name = "CreatorIcon",
					BackgroundTransparency = 1,
					Size = UDim2.new(0, 30, 0, 30),
					Position = UDim2.new(0, 38, 0, 80),
					ImageTransparency = 0,
					Image = 'rbxasset://textures/ui/Shell/Icons/RobloxIcon32.png',
					ZIndex = 2,
					Visible = false,
					Parent = infoFrame,
				}
			end

			local creatorLabel = create 'TextLabel' {
				Name = 'CreatorLabel',
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, 30),
				Position = UDim2.new(0, isTenFootInterface and 72 or 0, 0, 80),
				Font = Enum.Font.SourceSans,
				FontSize = (isTenFootInterface and Enum.FontSize.Size36 or Enum.FontSize.Size18),
				TextWrapped = true,
				TextScaled = true,
				TextColor3 = COLORS.WHITE,
				TextStrokeTransparency = 0,
				Text = "",
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				ZIndex = 2,
				Parent = infoFrame,
			}

		local backgroundTextureFrame = create 'Frame' {
			Name = 'BackgroundTextureFrame',
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			ClipsDescendants = true,
			ZIndex = 1,
			BackgroundTransparency = 1,
			Parent = mainBackgroundContainer,
		}

	local errorFrame = create 'Frame' {
		Name = 'ErrorFrame',
		BackgroundColor3 = COLORS.ERROR,
		BorderSizePixel = 0,
		Position = UDim2.new(0.25,0,0,0),
		Size = UDim2.new(0.5, 0, 0, 80),
		ZIndex = 8,
		Visible = false,
		Parent = screenGui,
	}

		local errorText = create 'TextLabel' {
			Name = "ErrorText",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Font = Enum.Font.SourceSansBold,
			FontSize = Enum.FontSize.Size14,
			TextWrapped = true,
			TextColor3 = COLORS.WHITE,
			Text = "",
			ZIndex = 8,
			Parent = errorFrame,
		}

	while not game:GetService("CoreGui") do
		wait()
	end
	screenGui.Parent = game:GetService("CoreGui")
	currScreenGui = screenGui
end

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

---------------------------------------------------------
-- Main Script (show something now + setup connections)

-- start loading assets asap
InfoProvider:LoadAssets()
MainGui:GenerateMain()
if isTenFootInterface then
	createTenfootCancelGui()
end

local lastRenderTime, lastDotUpdateTime, brickCountChange = nil, nil, nil
local fadeCycleTime = 1.7
local turnCycleTime = 2
local lastAbsoluteSize = Vector2.new(0, 0)
local loadingDots = "..."
local dotChangeTime = .2
local lastBrickCount = 0

renderSteppedConnection = game:GetService("RunService").RenderStepped:connect(function()
	if not currScreenGui then return end
	if not currScreenGui:FindFirstChild("BlackFrame") then return end

	if setVerb then
		currScreenGui.BlackFrame.CloseButton:SetVerb("Exit")
		setVerb = false
	end

	if currScreenGui.BlackFrame:FindFirstChild("BackgroundTextureFrame") and currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize ~= lastAbsoluteSize then
		lastAbsoluteSize = currScreenGui.BlackFrame.BackgroundTextureFrame.AbsoluteSize
		MainGui:tileBackgroundTexture(currScreenGui.BlackFrame.BackgroundTextureFrame)
	end

	local infoFrame = currScreenGui.BlackFrame:FindFirstChild('InfoFrame')
	if infoFrame then
		-- set place name
		local placeLabel = infoFrame:FindFirstChild('PlaceLabel')
		if placeLabel and placeLabel.Text == "" then
			placeLabel.Text = InfoProvider:GetGameName()
		end

		-- set creator name
		local creatorLabel = infoFrame:FindFirstChild('CreatorLabel')
		if creatorLabel and creatorLabel.Text == "" then
			local creatorName = InfoProvider:GetCreatorName()
			if creatorName ~= "" then
				if isTenFootInterface then
					local showDevName = true
					if platform == Enum.Platform.XBoxOne then
						local success, result = pcall(function()
							return settings():GetFFlag("ShowDevNameInXboxApp")
						end)
						if success then
							showDevName = result
						end
					end
					creatorLabel.Text = showDevName and creatorName or ""
					local creatorIcon = infoFrame:FindFirstChild('CreatorIcon')
					local byLabel = infoFrame:FindFirstChild('ByLabel')
					if creatorIcon then creatorIcon.Visible = showDevName end
					if byLabel then byLabel.Visible = showDevName end
				else
					creatorLabel.Text = "By "..creatorName
				end
			end
		end
	end

	if not lastRenderTime then
		lastRenderTime = tick()
		lastDotUpdateTime = lastRenderTime
		return
	end

	local currentTime = tick()
	local fadeAmount = (currentTime - lastRenderTime) * fadeCycleTime
	local turnAmount = (currentTime - lastRenderTime) * (360/turnCycleTime)
	lastRenderTime = currentTime

	currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation = currScreenGui.BlackFrame.GraphicsFrame.LoadingImage.Rotation + turnAmount

	local updateLoadingDots =  function()
		loadingDots = loadingDots.. "."
		if loadingDots == "...." then
			loadingDots = ""
		end
		currScreenGui.BlackFrame.GraphicsFrame.LoadingText.Text = "Loading" ..loadingDots
	end

	if currentTime - lastDotUpdateTime >= dotChangeTime and InfoProvider:GetCreatorName() == "" then
		lastDotUpdateTime = currentTime
		updateLoadingDots()
	else
		if guiService:GetBrickCount() > 0 then
			if brickCountChange == nil then
				brickCountChange = guiService:GetBrickCount()
			end
			if guiService:GetBrickCount() - lastBrickCount >= brickCountChange then
				lastBrickCount = guiService:GetBrickCount()
				updateLoadingDots()
			end
		end
	end

	if not isTenFootInterface then
		if currentTime - startTime > 5 and currScreenGui.BlackFrame.CloseButton.ImageTransparency > 0 then
			currScreenGui.BlackFrame.CloseButton.ImageTransparency = currScreenGui.BlackFrame.CloseButton.ImageTransparency - fadeAmount

			if currScreenGui.BlackFrame.CloseButton.ImageTransparency <= 0 then
				currScreenGui.BlackFrame.CloseButton.Active = true
			end
		end
	end
end)

spawn(function()
	local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
	local guiInsetChangedEvent = Instance.new("BindableEvent")
	guiInsetChangedEvent.Name = "GuiInsetChanged"
	guiInsetChangedEvent.Parent = RobloxGui
	guiInsetChangedEvent.Event:connect(function(x1, y1, x2, y2)
		if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
			currScreenGui.BlackFrame.Position = UDim2.new(0, -x1, 0, -y1)
			currScreenGui.BlackFrame.Size = UDim2.new(1, x1 + x2, 1, y1 + y2)
		end
	end)
end)

local leaveGameButton, leaveGameTextLabel, errorImage = nil

guiService.ErrorMessageChanged:connect(function()
	if guiService:GetErrorMessage() ~= '' then
		if isTenFootInterface then
			currScreenGui.ErrorFrame.Size = UDim2.new(1, 0, 0, 144)
			currScreenGui.ErrorFrame.Position = UDim2.new(0, 0, 0, 0)
			currScreenGui.ErrorFrame.BackgroundColor3 = COLORS.BLACK
			currScreenGui.ErrorFrame.BackgroundTransparency = 0.5
			currScreenGui.ErrorFrame.ErrorText.FontSize = Enum.FontSize.Size36
			currScreenGui.ErrorFrame.ErrorText.Position = UDim2.new(.3, 0, 0, 0)
			currScreenGui.ErrorFrame.ErrorText.Size = UDim2.new(.4, 0, 0, 144)
			if errorImage == nil then
				errorImage = Instance.new("ImageLabel")
				errorImage.Image = "rbxasset://textures/ui/ErrorIconSmall.png"
				errorImage.Size = UDim2.new(0, 96, 0, 79)
				errorImage.Position = UDim2.new(0.228125, 0, 0, 32)
				errorImage.ZIndex = 9
				errorImage.BackgroundTransparency = 1
				errorImage.Parent = currScreenGui.ErrorFrame
			end
			-- we show a B button to kill game data model on console
			if not isTenFootInterface then
				if leaveGameButton == nil then
					local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
					local utility = require(RobloxGui.Modules.Settings.Utility)
					local textLabel = nil
					leaveGameButton, leaveGameTextLabel = utility:MakeStyledButton("LeaveGame", "Leave", UDim2.new(0, 288, 0, 78))
					leaveGameButton:SetVerb("Exit")
					leaveGameButton.NextSelectionDown = leaveGameButton
					leaveGameButton.NextSelectionLeft = leaveGameButton
					leaveGameButton.NextSelectionRight = leaveGameButton
					leaveGameButton.NextSelectionUp = leaveGameButton
					leaveGameButton.ZIndex = 9
					leaveGameButton.Position = UDim2.new(0.771875, 0, 0, 37)
					leaveGameButton.Parent = currScreenGui.ErrorFrame
					leaveGameTextLabel.FontSize = Enum.FontSize.Size36
					leaveGameTextLabel.ZIndex = 10
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				else
					game:GetService("GuiService").SelectedCoreObject = leaveGameButton
				end
			end
		end
		currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
		currScreenGui.ErrorFrame.Visible = true
		local blackFrame = currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.CloseButton.ImageTransparency = 0
			blackFrame.CloseButton.Active = true
		end
	else
		currScreenGui.ErrorFrame.Visible = false
	end
end)

guiService.UiMessageChanged:connect(function(type, newMessage)
	if type == Enum.UiMessageType.UiMessageInfo then
		local blackFrame = currScreenGui and currScreenGui:FindFirstChild('BlackFrame')
		if blackFrame then
			blackFrame.UiMessageFrame.UiMessage.Text = newMessage
			if newMessage ~= '' then
				blackFrame.UiMessageFrame.Visible = true
			else
				blackFrame.UiMessageFrame.Visible = false
			end
		end
	end
end)

if guiService:GetErrorMessage() ~= '' then
	currScreenGui.ErrorFrame.ErrorText.Text = guiService:GetErrorMessage()
	currScreenGui.ErrorFrame.Visible = true
end


function stopListeningToRenderingStep()
	if renderSteppedConnection then
		renderSteppedConnection:disconnect()
		renderSteppedConnection = nil
	end
end

function fadeAndDestroyBlackFrame(blackFrame)
	if destroyingBackground then return end
	destroyingBackground = true
	spawn(function()
		local infoFrame = blackFrame:FindFirstChild("InfoFrame")
		local graphicsFrame = blackFrame:FindFirstChild("GraphicsFrame")
		
		if blackFrame:FindFirstChild("InfoFrame") then
				local infoFrameChildren = infoFrame:GetChildren()
				local transparency = 0
				local rateChange = 1.8
				local lastUpdateTime = nil

				while transparency < 1 do
					if not lastUpdateTime then
						lastUpdateTime = tick()
					else
						local newTime = tick()
						transparency = transparency + rateChange * (newTime - lastUpdateTime)
						for i = 1, #infoFrameChildren do
							local child = infoFrameChildren[i]
							if child:IsA('TextLabel') then
								child.TextTransparency = transparency
								child.TextStrokeTransparency = transparency
							elseif child:IsA('ImageLabel') then
								child.ImageTransparency = transparency
							end
						end
						graphicsFrame.LoadingImage.ImageTransparency = transparency
						blackFrame.BackgroundTransparency = transparency

						if backgroundImageTransparency < 1 then
							backgroundImageTransparency = transparency
							local backgroundImages = blackFrame.BackgroundTextureFrame:GetChildren()
							for i = 1, #backgroundImages do
								backgroundImages[i].ImageTransparency = backgroundImageTransparency
							end
						end

						lastUpdateTime = newTime
					end
					wait()
				end
				if blackFrame ~= nil then
					stopListeningToRenderingStep()
					blackFrame:Destroy()
				end
		end
	end)
end

function destroyLoadingElements(instant)
	if not currScreenGui then return end
	if destroyedLoadingGui then return end
	destroyedLoadingGui = true

	local guiChildren = currScreenGui:GetChildren()
	for i=1, #guiChildren do
		-- need to keep this around in case we get a connection error later
		if guiChildren[i].Name ~= "ErrorFrame" then
			if guiChildren[i].Name == "BlackFrame" and not instant then
				fadeAndDestroyBlackFrame(guiChildren[i])
			else
				guiChildren[i]:Destroy()
			end
		end
	end
end

-- ====================================================================
-- FORCED DELETION SEQUENCE: REMOVES GUI AFTER EXACTLY 3 SECONDS NO MATTER WHAT
-- ====================================================================
hasReplicatedFirstElements = false

spawn(function()
	wait(3) -- Display duration forced to exactly 3 seconds
	if currScreenGui and currScreenGui:FindFirstChild("BlackFrame") then
		if isTenFootInterface then
			ContextActionService:UnbindCoreAction('CancelGameLoad')
		end
		destroyLoadingElements(false)
	end
end)

local UserInputServiceChangedConn;
local function onUserInputServiceChanged(prop)
	if prop == 'VREnabled' then
		local UseVr = false
		pcall(function() UseVr = UIS.VREnabled end)

		if UseVr then
			if UserInputServiceChangedConn then
				UserInputServiceChangedConn:disconnect()
				UserInputServiceChangedConn = nil
			end
			if isTenFootInterface then
				ContextActionService:UnbindCoreAction('CancelGameLoad')
			end
			destroyLoadingElements(true)
			require(RobloxGui.Modules.LoadingScreen3D)
		end
	end
end

UserInputServiceChangedConn = UIS.Changed:connect(onUserInputServiceChanged)
onUserInputServiceChanged('VREnabled')

local Players = game:GetService("Players")

local function makeCharacterShiny(character)
    -- Loop through everything inside the character model
    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Catch any parts (like accessories or clothing limbs) that load in a split second later
    character.DescendantAdded:Connect(function(object)
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end)
end

-- Handle players who are already in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        makeCharacterShiny(player.Character)
    end
    player.CharacterAdded:Connect(makeCharacterShiny)
end

-- Handle players who join the server later
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(makeCharacterShiny)
end)

getgenv().LegacySettings = ({
    Year = 2014, -- only 2012 to 2016 allowed (if unavailable, it will be set to 2016 by default)
    OldGraphics = true, -- changes graphics to be more like the 2016 graphics
    HideDisplayName = true, -- changes other users nametags to show their username instead of display name
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/Legacy/refs/heads/main/Source.luau"))(); ]],
    Topbar_2013    = [[ local Players = game:GetService("Players")

local function makeCharacterShiny(character)
    -- Loop through everything inside the character model
    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Catch any parts (like accessories or clothing limbs) that load in a split second later
    character.DescendantAdded:Connect(function(object)
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end)
end

-- Handle players who are already in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        makeCharacterShiny(player.Character)
    end
    player.CharacterAdded:Connect(makeCharacterShiny)
end

-- Handle players who join the server later
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(makeCharacterShiny)
end)

getgenv().LegacySettings = ({
    Year = 2013, -- only 2012 to 2016 allowed (if unavailable, it will be set to 2016 by default)
    OldGraphics = true, -- changes graphics to be more like the 2016 graphics
    HideDisplayName = true, -- changes other users nametags to show their username instead of display name
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/Legacy/refs/heads/main/Source.luau"))(); ]],
    Topbar_2012    = [[ local Players = game:GetService("Players")

local function makeCharacterShiny(character)
    -- Loop through everything inside the character model
    for _, object in ipairs(character:GetDescendants()) do
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end

    -- Catch any parts (like accessories or clothing limbs) that load in a split second later
    character.DescendantAdded:Connect(function(object)
        if object:IsA("BasePart") then
            object.Material = Enum.Material.SmoothPlastic
        end
    end)
end

-- Handle players who are already in the game
for _, player in ipairs(Players:GetPlayers()) do
    if player.Character then
        makeCharacterShiny(player.Character)
    end
    player.CharacterAdded:Connect(makeCharacterShiny)
end

-- Handle players who join the server later
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(makeCharacterShiny)
end)

getgenv().LegacySettings = ({
    Year = 2012, -- only 2012 to 2016 allowed (if unavailable, it will be set to 2016 by default)
    OldGraphics = true, -- changes graphics to be more like the 2016 graphics
    HideDisplayName = true, -- changes other users nametags to show their username instead of display name
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/lxte/Legacy/refs/heads/main/Source.luau"))(); ]],
	Topbar_OldChat = [[ --OLD CHAT SCRIPT

loadstring(game:HttpGet("https://pastebin.com/raw/9AQrDua1"))() ]], 
	
	SafeChat       = [[ --SAFE CHAT

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-OG-Safe-Chat-for-Roblox-30941"))() ]],
	
	Backpack_S     = [[ --a simple handy 2008 remake of the backpack
loadstring(game:HttpGet("https://peeky.pythonanywhere.com/CustomBackpack"))() ]],
	Backpack_A     = [[ --ADVANCED BACKPACK

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Custom-Mobile-Backpack-38376"))() ]],
	
	Anims_R6_2008  = [[ --PERFECT 2008 ANIMATIONS

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-r15-to-r6-or-from-already-r6-to-2008-r6-76462"))() ]],
	Anims_R6_2006  = [[ --copy of r15 script to disable r6 animations

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [1] Define the Retro Catalog IDs (Movement)
local MOVEMENT_CATALOG_IDS = {
    Idle  = "rbxassetid://107407916979702",
    Walk  = "rbxassetid://103979922296239",
    Run   = "rbxassetid://103979922296239",
    Jump  = "rbxassetid://119095524735341",
    Fall  = "rbxassetid://119095524735341",
    Climb = "rbxassetid://132639392250396"
}

-- Table to store the extracted Raw Asset IDs
local RAW_MOVEMENT_IDS = {}

-- [2] The Extraction Engine
local function ExtractRawIDs(catalogTable, outputTable)
    for name, catalogId in pairs(catalogTable) do
        outputTable[name] = catalogId -- Fallback directly to the provided ID
        
        pcall(function()
            -- game:GetObjects is an executor-level function to pull the asset data
            local objects = game:GetObjects(catalogId)
            for _, obj in ipairs(objects) do
                if obj:IsA("Animation") then
                    outputTable[name] = obj.AnimationId
                else
                    local anim = obj:FindFirstChildWhichIsA("Animation", true)
                    if anim then
                        outputTable[name] = anim.AnimationId
                    end
                end
            end
        end)
    end
end

-- Run extraction asynchronously
task.spawn(function()
    ExtractRawIDs(MOVEMENT_CATALOG_IDS, RAW_MOVEMENT_IDS)
    print("[Retro Suite]: Movement Animation IDs Extracted.")
end)

-- [3] The Core Injection Function (Movement Only)
local function InjectClassicSuite(character)
    local humanoid = character:WaitForChild("Humanoid", 10)
    if not humanoid then return end

    local animateScript = character:WaitForChild("Animate", 10)
    if not animateScript then return end

    -- Overwrite base movement targets
    local function overwriteAnimTarget(animName, targetChildName, newId)
        local container = animateScript:FindFirstChild(animName)
        if container then
            local animTarget = container:FindFirstChild(targetChildName)
            if animTarget and animTarget:IsA("Animation") then
                animTarget.AnimationId = newId
            end
        end
    end

    -- Inject the 2007 Retro Movement IDs
    overwriteAnimTarget("idle", "Animation1", RAW_MOVEMENT_IDS.Idle)
    overwriteAnimTarget("idle", "Animation2", RAW_MOVEMENT_IDS.Idle)
    overwriteAnimTarget("walk", "WalkAnim", RAW_MOVEMENT_IDS.Walk)
    overwriteAnimTarget("run", "RunAnim", RAW_MOVEMENT_IDS.Run)
    overwriteAnimTarget("jump", "JumpAnim", RAW_MOVEMENT_IDS.Jump)
    overwriteAnimTarget("fall", "FallAnim", RAW_MOVEMENT_IDS.Fall)
    overwriteAnimTarget("climb", "ClimbAnim", RAW_MOVEMENT_IDS.Climb)

    -- Flush standard tracks
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0) 
        end
    end

    -- Forcefully Reboot the Animate Script
    animateScript.Disabled = true
    task.wait(0.05) 
    animateScript.Disabled = false

    print("[Retro Suite]: Base Movement Injected.")
end

-- [ Initialization & Respawn Handling ] --
task.wait(1)

if LocalPlayer.Character then
    task.spawn(InjectClassicSuite, LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.spawn(function()
        task.wait(0.5)
        InjectClassicSuite(newChar)
    end)
end) ]],
	Anims_R15_2008 = [[ --2008 animations even on r15 rigs

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- [1] Define the Retro Catalog IDs (Movement)
local MOVEMENT_CATALOG_IDS = {
    Idle  = "rbxassetid://107407916979702",
    Walk  = "rbxassetid://103979922296239",
    Run   = "rbxassetid://103979922296239",
    Jump  = "rbxassetid://119095524735341",
    Fall  = "rbxassetid://119095524735341",
    Climb = "rbxassetid://132639392250396"
}

-- Table to store the extracted Raw Asset IDs
local RAW_MOVEMENT_IDS = {}

-- [2] The Extraction Engine
local function ExtractRawIDs(catalogTable, outputTable)
    for name, catalogId in pairs(catalogTable) do
        outputTable[name] = catalogId -- Fallback directly to the provided ID
        
        pcall(function()
            -- game:GetObjects is an executor-level function to pull the asset data
            local objects = game:GetObjects(catalogId)
            for _, obj in ipairs(objects) do
                if obj:IsA("Animation") then
                    outputTable[name] = obj.AnimationId
                else
                    local anim = obj:FindFirstChildWhichIsA("Animation", true)
                    if anim then
                        outputTable[name] = anim.AnimationId
                    end
                end
            end
        end)
    end
end

-- Run extraction asynchronously
task.spawn(function()
    ExtractRawIDs(MOVEMENT_CATALOG_IDS, RAW_MOVEMENT_IDS)
    print("[Retro Suite]: Movement Animation IDs Extracted.")
end)

-- [3] The Core Injection Function (Movement Only)
local function InjectClassicSuite(character)
    local humanoid = character:WaitForChild("Humanoid", 10)
    if not humanoid then return end

    local animateScript = character:WaitForChild("Animate", 10)
    if not animateScript then return end

    -- Overwrite base movement targets
    local function overwriteAnimTarget(animName, targetChildName, newId)
        local container = animateScript:FindFirstChild(animName)
        if container then
            local animTarget = container:FindFirstChild(targetChildName)
            if animTarget and animTarget:IsA("Animation") then
                animTarget.AnimationId = newId
            end
        end
    end

    -- Inject the 2007 Retro Movement IDs
    overwriteAnimTarget("idle", "Animation1", RAW_MOVEMENT_IDS.Idle)
    overwriteAnimTarget("idle", "Animation2", RAW_MOVEMENT_IDS.Idle)
    overwriteAnimTarget("walk", "WalkAnim", RAW_MOVEMENT_IDS.Walk)
    overwriteAnimTarget("run", "RunAnim", RAW_MOVEMENT_IDS.Run)
    overwriteAnimTarget("jump", "JumpAnim", RAW_MOVEMENT_IDS.Jump)
    overwriteAnimTarget("fall", "FallAnim", RAW_MOVEMENT_IDS.Fall)
    overwriteAnimTarget("climb", "ClimbAnim", RAW_MOVEMENT_IDS.Climb)

    -- Flush standard tracks
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if animator then
        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
            track:Stop(0) 
        end
    end

    -- Forcefully Reboot the Animate Script
    animateScript.Disabled = true
    task.wait(0.05) 
    animateScript.Disabled = false

    print("[Retro Suite]: Base Movement Injected.")
end

-- [ Initialization & Respawn Handling ] --
task.wait(1)

if LocalPlayer.Character then
    task.spawn(InjectClassicSuite, LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(function(newChar)
    task.spawn(function()
        task.wait(0.5)
        InjectClassicSuite(newChar)
    end)
end) ]],
	Anims_R15_Old  = [[ --OLD R15 ANIMATIONS

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Old-R15-Animations-100039"))() ]],
	
	OldSounds      = [[ --OLD SOUNDS
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer

local function applyMovementSounds(char)
    local humanoid = char:WaitForChild("Humanoid")
    local hrp = char:WaitForChild("HumanoidRootPart")

    -- 1. CLEANUP (Exclude the Paradox sounds so they don't double up)
    local modernSoundScript = char:FindFirstChild("Sound")
    if modernSoundScript then modernSoundScript:Destroy() end
    
    for _, s in pairs(hrp:GetChildren()) do
        if s:IsA("Sound") and not string.find(s.Name, "Paradox") then 
            s:Destroy() 
        end
    end

    -- 2. SETUP AUDIO
    local masterStep = Instance.new("Sound", hrp)
    masterStep.Name = "ParadoxStep"
    masterStep.SoundId = "rbxassetid://174960816"
    masterStep.Volume = 0
    masterStep.Looped = true
    masterStep:Play()

    local jumpSound = Instance.new("Sound", hrp)
    jumpSound.Name = "ParadoxJump"
    jumpSound.SoundId = "rbxassetid://2428506580"
    jumpSound.Volume = 1

    local deathSound = Instance.new("Sound", hrp)
    deathSound.Name = "ParadoxDeath"
    deathSound.SoundId = "rbxassetid://17755696142" -- Using the ID from your previous script
    deathSound.Volume = 1

    local climbSound = Instance.new("Sound", hrp)
    climbSound.Name = "ParadoxClimb"
    climbSound.SoundId = "rbxassetid://7593297942"
    climbSound.Volume = 0.8
    climbSound.Looped = true

    -- 3. MOVEMENT LOGIC
    RunService.Heartbeat:Connect(function()
        if not humanoid or humanoid.Health <= 0 then 
            masterStep.Volume = 0
            climbSound:Stop()
            return 
        end
        
        local speed = hrp.Velocity.Magnitude
        local state = humanoid:GetState()

        if state == Enum.HumanoidStateType.Climbing then
            masterStep.Volume = 0
            if not climbSound.IsPlaying then climbSound:Play() end
        elseif speed > 1.5 and state ~= Enum.HumanoidStateType.Freefall then
            climbSound:Stop()
            masterStep.Volume = 0.8
        else
            masterStep.Volume = 0
            climbSound:Stop()
        end
    end)

    -- 4. STATE EVENTS (Jump & Death)
    humanoid.StateChanged:Connect(function(_, new)
        if new == Enum.HumanoidStateType.Jumping then
            masterStep.Volume = 0
            jumpSound:Play()
        end
    end)

    humanoid.Died:Connect(function()
        masterStep.Volume = 0
        climbSound:Stop()
        deathSound:Play()
    end)
end

-- Init
if player.Character then applyMovementSounds(player.Character) end
player.CharacterAdded:Connect(function(char)
    repeat task.wait() until char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid")
    applyMovementSounds(char)
end) ]],
    
    Textures_2006  = [[ --// 2006 LIGHTING & SKYBOX SETUP
game:GetService("Lighting").ClockTime = 12
game:GetService("Lighting").GlobalShadows = false

pcall(function()
    game:GetService("Lighting").Outlines = false
end)

-- Clear old skies safely
for _, v in ipairs(game:GetService("Lighting"):GetChildren()) do
    if v:IsA("Sky") then
        v:Destroy()
    end
end

-- Insert Classic 2008 Skybox
local sky = Instance.new("Sky")
sky.SkyboxBk = "rbxassetid://161781263"
sky.SkyboxDn = "rbxassetid://161781258"
sky.SkyboxFt = "rbxassetid://161781261"
sky.SkyboxLf = "rbxassetid://161781267"
sky.SkyboxRt = "rbxassetid://161781268"
sky.SkyboxUp = "rbxassetid://161781260"
sky.Parent = game:GetService("Lighting")

--// CONFIGURATION FOR 2008 SURFACES
local STUD_TEXTURE_ID = "rbxassetid://48715260"
local INLET_TEXTURE_ID = "rbxassetid://20299774"

-- Global directions we want to check against
local UP_VECTOR = Vector3.new(0, 1, 0)
local DOWN_VECTOR = Vector3.new(0, -1, 0)

-- Normal IDs to iterate through
local NORMAL_IDS = {
    Enum.NormalId.Top,
    Enum.NormalId.Bottom,
    Enum.NormalId.Left,
    Enum.NormalId.Right,
    Enum.NormalId.Front,
    Enum.NormalId.Back
}

--// Shape check: Only allows standard parts (squares/rectangles) and wedges (triangles)
local function isValidShape(part)
    local className = part.ClassName
    if className == "Part" then
        if part.Shape == Enum.PartType.Ball or part.Shape == Enum.PartType.Cylinder then
            return false
        end
        return true
    elseif className == "WedgePart" then
        return true
    end
    return false
end

--// Direction Finder: Finds which face is pointing toward the true sky or true floor
local function getTrueVerticalFace(part, targetGlobalDirection)
    local closestFace = nil
    local maxDot = 0.8 -- Strict threshold to make sure the face is flat horizontal

    for _, normalId in ipairs(NORMAL_IDS) do
        -- Convert the part's local face direction into world space coordinates
        local worldNormal = part.CFrame:VectorToWorldSpace(Vector3.FromNormalId(normalId))
        local dotProduct = worldNormal:Dot(targetGlobalDirection)

        if dotProduct > maxDot then
            maxDot = dotProduct
            closestFace = normalId
        end
    end

    return closestFace
end

--// Core Texture Processor
local function apply2008Textures(part)
    if not part:IsA("BasePart") then return end
    
    -- Ignore player characters/NPCs entirely
    if part.Parent:FindFirstChildOfClass("Humanoid") or (part.Parent.Parent and part.Parent.Parent:FindFirstChildOfClass("Humanoid")) then 
        return 
    end

    -- Clean up all script-generated textures first to reset the part safely
    for _, normalId in ipairs(NORMAL_IDS) do
        local oldStuds = part:FindFirstChild(normalId.Name .. "_2008Studs")
        local oldInlets = part:FindFirstChild(normalId.Name .. "_2008Inlets")
        if oldStuds then oldStuds:Destroy() end
        if oldInlets then oldInlets:Destroy() end
    end

    -- If it doesn't match our allowed shapes, stop here
    if not isValidShape(part) then return end

    -- Force material to Plastic and wipe default engine studs
    part.Material = Enum.Material.Plastic
    part.TopSurface = Enum.SurfaceType.Smooth
    part.BottomSurface = Enum.SurfaceType.Smooth

    -- 1. FIND AND APPLY TRUE TOP STUDS
    local trueTopFace = getTrueVerticalFace(part, UP_VECTOR)
    if trueTopFace then
        -- Wedges skew textures on their slants; we bypass this by only texturing blocks on top
        if not part:IsA("WedgePart") then
            local tex = Instance.new("Texture")
            tex.Name = trueTopFace.Name .. "_2008Studs"
            tex.Face = trueTopFace
            tex.Texture = STUD_TEXTURE_ID
            tex.StudsPerTileU = 1
            tex.StudsPerTileV = 1
            tex.Transparency = part.Transparency
            tex.Parent = part
        end
    end

    -- 2. FIND AND APPLY TRUE BOTTOM INLETS (Works perfectly for both blocks and wedges)
    local trueBottomFace = getTrueVerticalFace(part, DOWN_VECTOR)
    if trueBottomFace then
        local tex = Instance.new("Texture")
        tex.Name = trueBottomFace.Name .. "_2008Inlets"
        tex.Face = trueBottomFace
        tex.Texture = INLET_TEXTURE_ID
        tex.StudsPerTileU = 1
        tex.StudsPerTileV = 1
        tex.Transparency = part.Transparency
        tex.Parent = part
    end
end

--// Lightweight Event Tracking
local function setupTracking(part)
    if not part:IsA("BasePart") then return end
    
    part:GetPropertyChangedSignal("Transparency"):Connect(function() apply2008Textures(part) end)
    part:GetPropertyChangedSignal("Material"):Connect(function() apply2008Textures(part) end)
    part:GetPropertyChangedSignal("CFrame"):Connect(function() apply2008Textures(part) end)
end

--// Scan existing parts currently in the game workspace
for _, descendant in ipairs(workspace:GetDescendants()) do
    apply2008Textures(descendant)
    setupTracking(descendant)
end

--// Handle freshly spawned parts dynamically at runtime
workspace.DescendantAdded:Connect(function(descendant)
    game:GetService("RunService").Heartbeat:Wait()
    apply2008Textures(descendant)
    setupTracking(descendant)
end)
 ]],
    Textures_2016  = [[ --// Setting up graphics to look older
local effectsAfter2016 = {"DepthOfFieldEffect", "Atmosphere"}
local lighting = game:GetService("Lighting")

for _, effect in ipairs(lighting:GetChildren()) do
    for _, not2016effect in ipairs(effectsAfter2016) do
        if effect:IsA(not2016effect) then
            effect:Destroy() 
        end
    end
end

pcall(function()
    sethiddenproperty(lighting, "Technology", Enum.Technology.Compatibility) 
end)

lighting.Brightness = 2

--// Configuration for Stud assets
local STUD_TEXTURE_ID = "rbxassetid://7027211371"

local ALL_SURFACES = {
    {"TopSurface", Enum.NormalId.Top},
    {"BottomSurface", Enum.NormalId.Bottom},
    {"LeftSurface", Enum.NormalId.Left},
    {"RightSurface", Enum.NormalId.Right},
    {"FrontSurface", Enum.NormalId.Front},
    {"BackSurface", Enum.NormalId.Back}
}

--// Direct application function based strictly on your format
local function updateClassicStuds(part)
    if not part:IsA("BasePart") or part.Material ~= Enum.Material.Plastic then return end

    -- Ignore players and NPCs completely
    if part.Parent:FindFirstChildOfClass("Humanoid") or (part.Parent.Parent and part.Parent.Parent:FindFirstChildOfClass("Humanoid")) then 
        return 
    end

    -- Loop through each face independently
    for _, surfaceData in ipairs(ALL_SURFACES) do
        local surfaceName = surfaceData[1]
        local normalId = surfaceData[2]

        -- Check if this specific face has studs
        local success, surfaceType = pcall(function() return part[surfaceName] end)
        if success and surfaceType == Enum.SurfaceType.Studs then
            
            -- Look specifically for our applied texture on this face
            local textureName = surfaceName .. "_ClassicTexture"
            local existingTexture = part:FindFirstChild(textureName)
            
            if not existingTexture then
                local studs = Instance.new("Texture")
                studs.Name = textureName
                studs.Face = normalId
                studs.Texture = STUD_TEXTURE_ID
                -- RESTORED: Removed math.clamp so it multiplies identically to your snippet
                studs.Color3 = Color3.new(part.Color.R * 2, part.Color.G * 2, part.Color.B * 2)
                studs.Transparency = part.Transparency
                studs.StudsPerTileU = 2
                studs.StudsPerTileV = 2
                studs.Parent = part
            else
                -- If it exists, just update it seamlessly
                existingTexture.Color3 = Color3.new(part.Color.R * 2, part.Color.G * 2, part.Color.B * 2)
                existingTexture.Transparency = part.Transparency
            end
        else
            -- If a studio face no longer has a stud property, remove our texture instantly
            local existingTexture = part:FindFirstChild(surfaceName .. "_ClassicTexture")
            if existingTexture then
                existingTexture:Destroy()
            end
        end
    end
end

--// Lightweight, centralized property tracker
local trackedProperties = {
    Color = true, Transparency = true, Material = true,
    TopSurface = true, BottomSurface = true, LeftSurface = true, RightSurface = true, FrontSurface = true, BackSurface = true
}

local function setupTracking(part)
    if not part:IsA("BasePart") then return end
    part.Changed:Connect(function(property)
        if trackedProperties[property] then
            updateClassicStuds(part)
        end
    end)
end

--// Fast initialization loop
for _, descendant in ipairs(workspace:GetDescendants()) do
    if descendant:IsA("BasePart") then
        updateClassicStuds(descendant)
        setupTracking(descendant)
    end
end

--// Handle freshly spawned objects seamlessly
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("BasePart") then
        task.defer(function()
            updateClassicStuds(descendant)
            setupTracking(descendant)
        end)
    end
end)

task.wait(0.5) ]],
	
	Forcefield     = [[ -- OLD FORCEFIELD

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

local ffFolder = Instance.new("Folder")
ffFolder.Name = "FFCloneHolder"
ffFolder.Parent = workspace

local function getTorso(c)
    return c:FindFirstChild("UpperTorso") or c:FindFirstChild("Torso") or c:FindFirstChild("HumanoidRootPart")
end

local function buildFF()
    local model = Instance.new("Model")
    model.Name = "Forcefield2012"
    model.Parent = ffFolder

    -- Main Container
    local main = Instance.new("Part")
    main.Name = "VisualForcefield2012"
    main.Anchored = true
    main.CanCollide = false
    main.CastShadow = false
    main.Transparency = 1
    main.Size = Vector3.new(1,1,1)
    main.Parent = model

    -- Inner Sphere
    local mc = Instance.new("Part")
    mc.Name = "MainCircle"
    mc.Anchored = true
    mc.CanCollide = false
    mc.CastShadow = false
    mc.Color = Color3.fromRGB(0,0,128)
    mc.Material = Enum.Material.Neon
    mc.Transparency = 0.6
    mc.Size = Vector3.new(0.9,0.9,0.9)
    mc.Parent = model
    local mcM = Instance.new("SpecialMesh")
    mcM.MeshType = Enum.MeshType.Sphere
    mcM.Scale = Vector3.new(7,7,7)
    mcM.Parent = mc

    -- Outer Sphere
    local oc = Instance.new("Part")
    oc.Name = "OuterCircle"
    oc.Anchored = true
    oc.CanCollide = false
    oc.CastShadow = false
    oc.Color = Color3.fromRGB(0,0,128)
    oc.Material = Enum.Material.Neon
    oc.Transparency = 0.95
    oc.Size = Vector3.new(0.9,0.9,0.9)
    oc.Parent = model
    local ocM = Instance.new("SpecialMesh")
    ocM.MeshType = Enum.MeshType.Sphere
    ocM.Scale = Vector3.new(7.7,7.7,7.7)
    ocM.Parent = oc

    -- Sparkles Part
    local sp = Instance.new("Part")
    sp.Name = "Sparkles83"
    sp.Anchored = true
    sp.CanCollide = false
    sp.Transparency = 1
    sp.Size = Vector3.new(5,1,5)
    sp.Parent = model

    -- Legacy Particle Style
    local old = Instance.new("ParticleEmitter")
    old.Name = "OldSparkles"
    old.Lifetime = NumberRange.new(3,3)
    old.LightEmission = 1e9
    old.LockedToPart = true
    old.Rate = 7
    old.RotSpeed = NumberRange.new(25,25)
    old.Rotation = NumberRange.new(8,8)
    old.Size = NumberSequence.new(1)
    old.Speed = NumberRange.new(2,4)
    old.Texture = "rbxassetid://6334617852"
    old.Transparency = NumberSequence.new(0.5,1)
    old.Parent = sp

    -- Glow Rays
    local rays = Instance.new("ParticleEmitter")
    rays.Name = "Rays"
    rays.Lifetime = NumberRange.new(1,1)
    rays.LightEmission = 1
    rays.LockedToPart = true
    rays.Rate = 100
    rays.RotSpeed = NumberRange.new(-50,50)
    rays.Rotation = NumberRange.new(-180,180)
    rays.Size = NumberSequence.new(2)
    rays.Speed = NumberRange.new(0,0)
    rays.Texture = "rbxassetid://1084975295"
    rays.Transparency = NumberSequence.new(0.4,1)
    rays.Parent = main

    -- Pulsing Animation
    task.spawn(function()
        while model.Parent do
            TweenService:Create(mc, TweenInfo.new(0.55, Enum.EasingStyle.Sine), {Transparency = 0.95}):Play()
            TweenService:Create(oc, TweenInfo.new(0.7, Enum.EasingStyle.Sine), {Transparency = 0.6}):Play()
            task.wait(0.55)
            TweenService:Create(oc, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Transparency = 0.95}):Play()
            TweenService:Create(mc, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Transparency = 0.6}):Play()
            task.wait(0.35)
        end
    end)

    return model
end

local currentModel = nil
local char = lp.Character or lp.CharacterAdded:Wait()

-- Core Loop: Watch for Forcefields
task.spawn(function()
    while true do
        local ff = char and char:FindFirstChildOfClass("ForceField")
        if ff then
            ff.Visible = false -- Hide the new forcefield
            if not currentModel then 
                currentModel = buildFF() 
            end
        else
            if currentModel then
                currentModel:Destroy()
                currentModel = nil
            end
        end
        task.wait(0.1)
    end
end)

-- Follow Player
RunService.PreRender:Connect(function()
    if not currentModel or not char then return end
    local t = getTorso(char)
    if not t then return end

    local targetCF = t.CFrame
    for _,p in ipairs(currentModel:GetDescendants()) do
        if p:IsA("BasePart") then
            p.CFrame = targetCF
        end
    end
end)

lp.CharacterAdded:Connect(function(newChar)
    char = newChar
    if currentModel then
        currentModel:Destroy()
        currentModel = nil
    end
end)
 ]],
	BetterEmotes   = [[ --EMOTES!

loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-7yd7-I-Emote-Script-48024"))() ]],
}

-- BUTTON FUNCTIONS ENGINE(DO NOT TOUCH)
local function RunInvincible(code)
    if code == "" or code == " " or code == nil then return end
    task.spawn(function()
        local func, err = loadstring(code)
        if func then 
            local success, runtimeErr = pcall(func)
            if not success then warn("PARADOX RUNTIME ERROR: " .. tostring(runtimeErr)) end
        else 
            warn("PARADOX SYNTAX ERROR: " .. tostring(err)) 
        end
    end)
end

------------------------------------------------------------
-- SETTINGS
------------------------------------------------------------
local CLICK_ID = "rbxassetid://12221967" 
local HEADER_IMAGE = "rbxthumb://type=Asset&id=131822012703327&w=420&h=420"

local plr = game:GetService("Players").LocalPlayer
local TweenService = game:GetService("TweenService")
local pg = plr:WaitForChild("PlayerGui")

local sg = Instance.new("ScreenGui")
sg.Name = "BloxyParadoxProject"
sg.ResetOnSpawn = false
sg.Parent = pg

------------------------------------------------------------
-- SOUND SETUP
------------------------------------------------------------
local sfx = Instance.new("Sound")
sfx.SoundId = CLICK_ID
sfx.Volume = 0.6
sfx.Parent = game:GetService("SoundService")

local function playClick()
    sfx:Stop() 
    sfx:Play()
end

------------------------------------------------------------
-- UI HELPER FUNCTIONS
------------------------------------------------------------

local function attachHeaderImage(parentFrame)
    local img = Instance.new("ImageLabel")
    img.Name = "HeaderImage"
    img.BackgroundTransparency = 1
    img.Image = HEADER_IMAGE
    img.Size = UDim2.new(0, 260, 0, 160) 
    img.Position = UDim2.new(0.5, -130, 0, -111) 
    img.BorderSizePixel = 0
    img.ZIndex = 10 
    img.Parent = parentFrame
    return img
end

local function createStandardButton(text, pos, width, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, width, 0, 32)
    btn.Position = pos
    btn.Text = text
    btn.Font = Enum.Font.Legacy
    btn.TextScaled = true 
    btn.AutoButtonColor = false
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.ZIndex = 5
    btn.Parent = parent
    
    local constraint = Instance.new("UITextSizeConstraint", btn)
    constraint.MaxTextSize = 16
    constraint.MinTextSize = 8

    btn.MouseButton1Click:Connect(function()
        playClick()
    end)

    btn.MouseEnter:Connect(function()
        if btn.Active then
            btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.BorderColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    end)

    return btn
end

local function createCyanSliderButton(text, pos, width, parent)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, width, 0, 32)
    btn.Position = pos
    btn.Text = text
    btn.Font = Enum.Font.Legacy
    btn.TextScaled = true 
    btn.AutoButtonColor = false
    btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    btn.TextColor3 = Color3.fromRGB(0, 0, 0)
    btn.ZIndex = 5
    btn.Parent = parent
    
    local constraint = Instance.new("UITextSizeConstraint", btn)
    constraint.MaxTextSize = 16
    constraint.MinTextSize = 8

    btn.MouseButton1Click:Connect(function()
        playClick()
    end)

    btn.MouseEnter:Connect(function()
        if btn.Active then
            btn.BackgroundColor3 = Color3.fromRGB(44, 179, 255) 
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)       
            btn.BorderColor3 = Color3.fromRGB(0, 0, 0)           
        end
    end)

    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextColor3 = Color3.fromRGB(0, 0, 0)
        btn.BorderColor3 = Color3.fromRGB(0, 0, 0)
    end)

    return btn
end

local function genericExit(frame, callback)
    local t = TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {Position = UDim2.new(0.5, frame.Position.X.Offset, 0, -250)})
    t:Play()
    t.Completed:Connect(function()
        frame:Destroy()
        if callback then callback() end
    end)
end

-- Forward Declaring functions
local showSafeChatUI, showBackpackUI, showAnimsUI, showSoundsUI, showTexturesUI, showForcefieldUI, showEmotesUI

------------------------------------------------------------
-- ACTION HOOKS
------------------------------------------------------------
local OnTopbarSelected = function(choice)
    if choice == "2020" then RunInvincible(MyScripts.Topbar_2020)
    elseif choice == "2016_Adv" then RunInvincible(MyScripts.Topbar_2016_A)
    elseif choice == "2016_Simp" then RunInvincible(MyScripts.Topbar_2016_S)
    elseif choice == "2015" then RunInvincible(MyScripts.Topbar_2015)
    elseif choice == "2014" then RunInvincible(MyScripts.Topbar_2014)
    elseif choice == "2013" then RunInvincible(MyScripts.Topbar_2013)
    elseif choice == "2012" then RunInvincible(MyScripts.Topbar_2012)
    elseif choice == "Old_Chat" then RunInvincible(MyScripts.Topbar_OldChat) end
end

local OnSafeChatSelected = function(enabled)
    if enabled then RunInvincible(MyScripts.SafeChat) end
end

local OnBackpackSelected = function(choice)
    if choice == "simple" then RunInvincible(MyScripts.Backpack_S)
    elseif choice == "advanced" then RunInvincible(MyScripts.Backpack_A) end
end

local OnAnimsSelected = function(choice)
    if choice == "R6_2008" then RunInvincible(MyScripts.Anims_R6_2008)
    elseif choice == "R6_2006" then RunInvincible(MyScripts.Anims_R6_2006)
    elseif choice == "R15_2008" then RunInvincible(MyScripts.Anims_R15_2008)
    elseif choice == "R15_Old" then RunInvincible(MyScripts.Anims_R15_Old) end
end

local OnSoundsSelected = function(enabled)
    if enabled then RunInvincible(MyScripts.OldSounds) end
end

local OnTexturesSelected = function(choice)
    if choice == "2006" then RunInvincible(MyScripts.Textures_2006)
    elseif choice == "2016" then RunInvincible(MyScripts.Textures_2016) end
end

local OnForcefieldSelected = function(enabled)
    if enabled then RunInvincible(MyScripts.Forcefield) end
end

local OnEmotesSelected = function(enabled)
    if enabled then RunInvincible(MyScripts.BetterEmotes) end
end

------------------------------------------------------------
-- MENU DEFINITIONS
------------------------------------------------------------

-- 8. EMOTES
showEmotesUI = function()
    local f = Instance.new("Frame")
    f.Size, f.Position, f.BackgroundColor3, f.Parent = UDim2.new(0, 360, 0, 85), UDim2.new(0.5, -180, 0, -250), Color3.new(1,1,1), sg
    attachHeaderImage(f)
    local t = Instance.new("TextLabel", f)
    t.Size, t.BackgroundTransparency, t.Text, t.Font, t.TextSize = UDim2.new(1,0,0,30), 1, "Do you want better emotes?", Enum.Font.Legacy, 14
    createStandardButton("Yes", UDim2.new(0,15,0,45), 150, f).MouseButton1Click:Connect(function() genericExit(f); OnEmotesSelected(true) end)
    createStandardButton("No", UDim2.new(1,-165,0,45), 150, f).MouseButton1Click:Connect(function() genericExit(f); OnEmotesSelected(false) end)
    TweenService:Create(f, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -180, 0.5, -42)}):Play()
end

-- 7. FORCEFIELD
showForcefieldUI = function()
    local f = Instance.new("Frame")
    f.Size, f.Position, f.BackgroundColor3, f.Parent = UDim2.new(0, 360, 0, 85), UDim2.new(0.5, -180, 0, -250), Color3.new(1,1,1), sg
    attachHeaderImage(f)
    local t = Instance.new("TextLabel", f)
    t.Size, t.BackgroundTransparency, t.Text, t.Font, t.TextSize = UDim2.new(1,0,0,30), 1, "Do you want the old forcefield?", Enum.Font.Legacy, 14
    createStandardButton("Yes", UDim2.new(0,15,0,45), 160, f).MouseButton1Click:Connect(function() genericExit(f, showEmotesUI); OnForcefieldSelected(true) end)
    createStandardButton("No", UDim2.new(1,-175,0,45), 160, f).MouseButton1Click:Connect(function() genericExit(f, showEmotesUI); OnForcefieldSelected(false) end)
    TweenService:Create(f, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -180, 0.5, -42)}):Play()
end

-- 6. TEXTURES
showTexturesUI = function()
    local f = Instance.new("Frame")
    f.Size, f.Position, f.BackgroundColor3, f.Parent = UDim2.new(0, 480, 0, 95), UDim2.new(0.5, -240, 0, -250), Color3.new(1,1,1), sg
    attachHeaderImage(f)
    local t = Instance.new("TextLabel", f)
    t.Size, t.BackgroundTransparency, t.Text, t.Font, t.TextSize = UDim2.new(1,0,0,35), 1, "What textures do you want to use?", Enum.Font.Legacy, 14
    createStandardButton("2006 textures", UDim2.new(0,10,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showForcefieldUI); OnTexturesSelected("2006") end)
    createStandardButton("2016 textures", UDim2.new(0,165,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showForcefieldUI); OnTexturesSelected("2016") end)
    createStandardButton("Normal", UDim2.new(0,320,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showForcefieldUI); OnTexturesSelected("normal") end)
    TweenService:Create(f, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -240, 0.5, -47)}):Play()
end

-- 5. OLD SOUNDS
showSoundsUI = function()
    local f = Instance.new("Frame")
    f.Size, f.Position, f.BackgroundColor3, f.Parent = UDim2.new(0, 360, 0, 85), UDim2.new(0.5, -180, 0, -250), Color3.new(1,1,1), sg
    attachHeaderImage(f)
    local t = Instance.new("TextLabel", f)
    t.Size, t.BackgroundTransparency, t.Text, t.Font, t.TextSize = UDim2.new(1,0,0,30), 1, "Do you want old sounds?", Enum.Font.Legacy, 14
    createStandardButton("Yes", UDim2.new(0,15,0,45), 150, f).MouseButton1Click:Connect(function() genericExit(f, showTexturesUI); OnSoundsSelected(true) end)
    createStandardButton("No", UDim2.new(1,-165,0,45), 150, f).MouseButton1Click:Connect(function() genericExit(f, showTexturesUI); OnSoundsSelected(false) end)
    TweenService:Create(f, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -180, 0.5, -42)}):Play()
end

-- 4. ANIMATIONS
showAnimsUI = function()
    local f = Instance.new("Frame")
    f.Size, f.Position, f.BackgroundColor3, f.Parent = UDim2.new(0, 480, 0, 95), UDim2.new(0.5, -240, 0, -250), Color3.new(1,1,1), sg
    attachHeaderImage(f)
    local character = plr.Character or plr.CharacterAdded:Wait()
    local hum = character:WaitForChild("Humanoid")
    local t = Instance.new("TextLabel", f)
    t.Size, t.BackgroundTransparency, t.Font, t.TextSize = UDim2.new(1,0,0,35), 1, Enum.Font.Legacy, 14
    if hum.RigType == Enum.HumanoidRigType.R6 then
        t.Text = "Choose your animations: R6 Mode"
        createStandardButton("2008 W.I.P", UDim2.new(0,10,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showSoundsUI); OnAnimsSelected("R6_2008") end)
        createStandardButton("2006 W.I.P", UDim2.new(0,165,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showSoundsUI); OnAnimsSelected("R6_2006") end)
        createStandardButton("Normal", UDim2.new(0,320,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showSoundsUI); OnAnimsSelected("normal") end)
    else
        t.Text = "Choose your animations: R15 Mode"
        createStandardButton("2008 for R15 W.I.P", UDim2.new(0,10,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showSoundsUI); OnAnimsSelected("R15_2008") end)
        createStandardButton("Old R15", UDim2.new(0,165,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showSoundsUI); OnAnimsSelected("R15_Old") end)
        createStandardButton("Normal", UDim2.new(0,320,0,50), 140, f).MouseButton1Click:Connect(function() genericExit(f, showSoundsUI); OnAnimsSelected("normal") end)
    end
    TweenService:Create(f, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -240, 0.5, -47)}):Play()
end

-- 3. BACKPACK
showBackpackUI = function()
    local f = Instance.new("Frame")
    f.Size, f.Position, f.BackgroundColor3, f.Parent = UDim2.new(0, 480, 0, 95), UDim2.new(0.5, -240, 0, -250), Color3.new(1,1,1), sg
    attachHeaderImage(f)
    local t = Instance.new("TextLabel", f)
    t.Size, t.BackgroundTransparency, t.Text, t.Font, t.TextSize = UDim2.new(1,0,0,35), 1, "Do you want a custom backpack?", Enum.Font.Legacy, 14
    createStandardButton("No", UDim2.new(0,10,0,50), 90, f).MouseButton1Click:Connect(function() genericExit(f, showAnimsUI); OnBackpackSelected("none") end)
    createStandardButton("Simple 2008 remake", UDim2.new(0,110,0,50), 160, f).MouseButton1Click:Connect(function() genericExit(f, showAnimsUI); OnBackpackSelected("simple") end)
    createStandardButton("Advanced", UDim2.new(0,285,0,50), 180, f).MouseButton1Click:Connect(function() genericExit(f, showAnimsUI); OnBackpackSelected("advanced") end)
    TweenService:Create(f, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -240, 0.5, -47)}):Play()
end

-- 2. SAFE CHAT
showSafeChatUI = function()
    local f = Instance.new("Frame")
    f.Size, f.Position, f.BackgroundColor3, f.Parent = UDim2.new(0, 360, 0, 85), UDim2.new(0.5, -180, 0, -250), Color3.new(1,1,1), sg
    attachHeaderImage(f)
    local t = Instance.new("TextLabel", f)
    t.Size, t.BackgroundTransparency, t.Text, t.Font, t.TextSize = UDim2.new(1,0,0,30), 1, "Do you want safe chat?(pc only)", Enum.Font.Legacy, 14
    createStandardButton("Yes", UDim2.new(0,15,0,45), 150, f).MouseButton1Click:Connect(function() genericExit(f, showBackpackUI); OnSafeChatSelected(true) end)
    createStandardButton("No", UDim2.new(1,-165,0,45), 150, f).MouseButton1Click:Connect(function() genericExit(f, showBackpackUI); OnSafeChatSelected(false) end)
    TweenService:Create(f, TweenInfo.new(0.4), {Position = UDim2.new(0.5, -180, 0.5, -42)}):Play()
end

-- 1. TOPBAR SELECTION (START)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 310, 0, 130) 
mainFrame.Position = UDim2.new(0.5, -155, 0, -250)
mainFrame.BackgroundColor3 = Color3.new(1, 1, 1)
mainFrame.ClipsDescendants = false 
mainFrame.Parent = sg
attachHeaderImage(mainFrame)

local mainTitle = Instance.new("TextLabel", mainFrame)
mainTitle.Size = UDim2.new(1, 0, 0, 35)
mainTitle.BackgroundTransparency = 1
mainTitle.Text = "Which topbar do you prefer?"
mainTitle.Font = Enum.Font.Legacy
mainTitle.TextSize = 14

local currentSelectionId = "none"
local expanded = false

-- THE DROPDOWN TOGGLE BUTTON
local dropdownToggle = createCyanSliderButton("none  ▼", UDim2.new(0.5, -67, 0, 42), 135, mainFrame)

-- THE SLIDER CONTAINER (Expanded to fit the additional 2015 option seamlessly)
local slider = Instance.new("ScrollingFrame")
slider.Size = UDim2.new(0, 135, 0, 120) 
slider.Position = UDim2.new(0.5, -67, 0, 74)
slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
slider.CanvasSize = UDim2.new(0, 0, 0, 315) 
slider.ScrollBarThickness = 0 
slider.Visible = false
slider.ZIndex = 20 
slider.Parent = mainFrame

-- WHITE BOX SCROLLBAR BACKGROUND CONSTRAINER
local scrollTrack = Instance.new("Frame")
scrollTrack.Size = UDim2.new(0, 10, 0, 120)
scrollTrack.Position = UDim2.new(0.5, 68, 0, 74)
scrollTrack.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scrollTrack.BorderColor3 = Color3.fromRGB(0, 0, 0)
scrollTrack.BorderSizePixel = 1
scrollTrack.ClipsDescendants = true 
scrollTrack.ZIndex = 21
scrollTrack.Visible = false
scrollTrack.Parent = mainFrame

-- BROWSER STYLE CUSTOM GRAY SQUARE SCROLLBAR SLIDER HANDLE
local customScrollBar = Instance.new("Frame")
customScrollBar.Size = UDim2.new(0, 10, 0, 51) 
customScrollBar.Position = UDim2.new(0, 0, 0, 0) 
customScrollBar.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
customScrollBar.BorderSizePixel = 0 
customScrollBar.ZIndex = 22
customScrollBar.Parent = scrollTrack

slider:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
	local maxScroll = slider.CanvasSize.Y.Offset - slider.Size.Y.Offset
	if maxScroll > 0 then
		local scrollPercent = math.clamp(slider.CanvasPosition.Y / maxScroll, 0, 1)
		local trackLength = scrollTrack.Size.Y.Offset - customScrollBar.Size.Y.Offset
		customScrollBar.Position = UDim2.new(0, 0, 0, scrollPercent * trackLength)
	end
end)

-- SLIDER DATA MATRIX (Ordered chronological with requested 2015 layout adjustments)
local options = {
    {text = "2020(pc only)",  id = "2020"},
    {text = "2016(no chat)",  id = "2016_Adv"},
    {text = "2016",           id = "2016_Simp"},
    {text = "2015",           id = "2015"},
    {text = "2014",           id = "2014"},
    {text = "2013",           id = "2013"},
    {text = "2012",           id = "2012"},
    {text = "old chat only",  id = "Old_Chat"},
    {text = "none",           id = "none"}
}

for i, opt in ipairs(options) do
    local optBtn = createCyanSliderButton(opt.text, UDim2.new(0, 0, 0, (i - 1) * 35), 135, slider)
    optBtn.ZIndex = 21
    optBtn.MouseButton1Click:Connect(function()
        currentSelectionId = opt.id
        dropdownToggle.Text = opt.text .. "  ▼"
        slider.Visible = false
        scrollTrack.Visible = false
        expanded = false
    end)
end

dropdownToggle.MouseButton1Click:Connect(function()
    expanded = not expanded
    slider.Visible = expanded
    scrollTrack.Visible = expanded
    local arrow = expanded and "  ▲" or "  ▼"
    local baseText = dropdownToggle.Text:sub(1, -5)
    dropdownToggle.Text = baseText .. arrow
end)

-- CONFIRM BUTTON
local confirmBtn = createStandardButton("confirm", UDim2.new(0.5, -67, 0, 80), 135, mainFrame)
confirmBtn.ZIndex = 5
confirmBtn.MouseButton1Click:Connect(function()
    genericExit(mainFrame, showSafeChatUI)
    if currentSelectionId and currentSelectionId ~= "none" then
        OnTopbarSelected(currentSelectionId)
    end
end)

TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -155, 0.5, -65)}):Play()
