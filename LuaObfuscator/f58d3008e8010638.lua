--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local Players = game:GetService("Players");
local TweenService = game:GetService("TweenService");
local UserInputService = game:GetService("UserInputService");
local CoreGui = game:GetService("CoreGui");
local LocalPlayer = Players.LocalPlayer;
local VALID_KEY = "DrkBlade";
local DISCORD_LINK = "discord.gg/yhcsF8vMZ";
local DISCORD_FULL = "https://discord.gg/yhcsF8vMZ";
local SCRIPT_URL = "https://raw.githubusercontent.com/riotrapdo-spec/KeySystems/refs/heads/main/Manviru.txt";
local SAVE_FILE = "DrkBaediKey.txt";
local function SaveKey(key)
	pcall(function()
		if writefile then
			writefile(SAVE_FILE, key);
		end
	end);
end
local function LoadSavedKey()
	local key = nil;
	pcall(function()
		if (readfile and isfile) then
			if isfile(SAVE_FILE) then
				key = readfile(SAVE_FILE);
			end
		end
	end);
	return key;
end
local function CheckKey(input)
	local FlatIdent_455BF = 0;
	while true do
		if (FlatIdent_455BF == 1) then
			if (input == VALID_KEY) then
				return true;
			end
			return false;
		end
		if (FlatIdent_455BF == 0) then
			if (not input or (input == "")) then
				return false;
			end
			input = input:gsub("%s+", "");
			FlatIdent_455BF = 1;
		end
	end
end
local function LoadMainScript()
	local FlatIdent_703C8 = 0;
	while true do
		if (FlatIdent_703C8 == 0) then
			pcall(function()
				game:GetService("StarterGui"):SetCore("SendNotification", {Title="Drk Baedi",Text="Key verified! Loading script...",Duration=3});
			end);
			task.wait(1);
			FlatIdent_703C8 = 1;
		end
		if (FlatIdent_703C8 == 1) then
			pcall(function()
				loadstring(game:HttpGet(SCRIPT_URL))();
			end);
			break;
		end
	end
end
local saved = LoadSavedKey();
if (saved and CheckKey(saved)) then
	local FlatIdent_1B51D = 0;
	while true do
		if (FlatIdent_1B51D == 0) then
			LoadMainScript();
			return;
		end
	end
end
pcall(function()
	local old = CoreGui:FindFirstChild("DrkKeySystem");
	if old then
		old:Destroy();
	end
end);
pcall(function()
	local old = LocalPlayer.PlayerGui:FindFirstChild("DrkKeySystem");
	if old then
		old:Destroy();
	end
end);
local ScreenGui = Instance.new("ScreenGui");
ScreenGui.Name = "DrkKeySystem";
ScreenGui.ResetOnSpawn = false;
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
ScreenGui.DisplayOrder = 9999;
local guiOk = pcall(function()
	ScreenGui.Parent = CoreGui;
end);
if not guiOk then
	ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui");
end
local Overlay = Instance.new("Frame");
Overlay.Name = "Overlay";
Overlay.Size = UDim2.new(1, 0, 1, 0);
Overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
Overlay.BackgroundTransparency = 0.35;
Overlay.BorderSizePixel = 0;
Overlay.ZIndex = 1;
Overlay.Parent = ScreenGui;
local Card = Instance.new("Frame");
Card.Name = "Card";
Card.Size = UDim2.fromOffset(0, 0);
Card.Position = UDim2.new(0.5, 0, 0.5, 0);
Card.AnchorPoint = Vector2.new(0.5, 0.5);
Card.BackgroundColor3 = Color3.fromRGB(16, 16, 22);
Card.BorderSizePixel = 0;
Card.ZIndex = 2;
Card.Parent = ScreenGui;
local cardCorner = Instance.new("UICorner");
cardCorner.CornerRadius = UDim.new(0, 12);
cardCorner.Parent = Card;
local cardStroke = Instance.new("UIStroke");
cardStroke.Color = Color3.fromRGB(180, 40, 40);
cardStroke.Thickness = 1.5;
cardStroke.Transparency = 0.3;
cardStroke.Parent = Card;
local AccentLine = Instance.new("Frame");
AccentLine.Name = "Accent";
AccentLine.Size = UDim2.new(1, 0, 0, 3);
AccentLine.Position = UDim2.new(0, 0, 0, 0);
AccentLine.BackgroundColor3 = Color3.fromRGB(200, 40, 40);
AccentLine.BorderSizePixel = 0;
AccentLine.ZIndex = 3;
AccentLine.Parent = Card;
local accentCorner = Instance.new("UICorner");
accentCorner.CornerRadius = UDim.new(0, 12);
accentCorner.Parent = AccentLine;
local accentGradient = Instance.new("UIGradient");
accentGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 80, 60)),ColorSequenceKeypoint.new(1, Color3.fromRGB(200, 40, 40))});
accentGradient.Parent = AccentLine;
local LogoLabel = Instance.new("TextLabel");
LogoLabel.Name = "Logo";
LogoLabel.Size = UDim2.new(1, 0, 0, 40);
LogoLabel.Position = UDim2.new(0, 0, 0, 22);
LogoLabel.BackgroundTransparency = 1;
LogoLabel.Text = "Drk Baedi";
LogoLabel.TextColor3 = Color3.fromRGB(220, 60, 60);
LogoLabel.Font = Enum.Font.GothamBlack;
LogoLabel.TextSize = 30;
LogoLabel.ZIndex = 3;
LogoLabel.Parent = Card;
local SubLabel = Instance.new("TextLabel");
SubLabel.Name = "Sub";
SubLabel.Size = UDim2.new(1, 0, 0, 20);
SubLabel.Position = UDim2.new(0, 0, 0, 62);
SubLabel.BackgroundTransparency = 1;
SubLabel.Text = "AUTHENTICATION";
SubLabel.TextColor3 = Color3.fromRGB(120, 120, 140);
SubLabel.Font = Enum.Font.GothamBold;
SubLabel.TextSize = 12;
SubLabel.ZIndex = 3;
SubLabel.Parent = Card;
local Sep1 = Instance.new("Frame");
Sep1.Size = UDim2.new(0.85, 0, 0, 1);
Sep1.Position = UDim2.new(0.075, 0, 0, 92);
Sep1.BackgroundColor3 = Color3.fromRGB(40, 40, 50);
Sep1.BorderSizePixel = 0;
Sep1.ZIndex = 3;
Sep1.Parent = Card;
local InstrLabel = Instance.new("TextLabel");
InstrLabel.Name = "Instructions";
InstrLabel.Size = UDim2.new(0.85, 0, 0, 40);
InstrLabel.Position = UDim2.new(0.075, 0, 0, 102);
InstrLabel.BackgroundTransparency = 1;
InstrLabel.Text = "Join our Discord server to obtain your key.\nPaste it below to unlock the script.";
InstrLabel.TextColor3 = Color3.fromRGB(160, 160, 180);
InstrLabel.Font = Enum.Font.Gotham;
InstrLabel.TextSize = 12;
InstrLabel.TextWrapped = true;
InstrLabel.TextYAlignment = Enum.TextYAlignment.Top;
InstrLabel.ZIndex = 3;
InstrLabel.Parent = Card;
local DiscordBox = Instance.new("Frame");
DiscordBox.Name = "DiscordBox";
DiscordBox.Size = UDim2.new(0.85, 0, 0, 36);
DiscordBox.Position = UDim2.new(0.075, 0, 0, 150);
DiscordBox.BackgroundColor3 = Color3.fromRGB(24, 24, 32);
DiscordBox.BorderSizePixel = 0;
DiscordBox.ZIndex = 3;
DiscordBox.Parent = Card;
local discordBoxCorner = Instance.new("UICorner");
discordBoxCorner.CornerRadius = UDim.new(0, 8);
discordBoxCorner.Parent = DiscordBox;
local discordBoxStroke = Instance.new("UIStroke");
discordBoxStroke.Color = Color3.fromRGB(50, 50, 65);
discordBoxStroke.Thickness = 1;
discordBoxStroke.Parent = DiscordBox;
local DiscordIcon = Instance.new("TextLabel");
DiscordIcon.Size = UDim2.fromOffset(28, 36);
DiscordIcon.Position = UDim2.new(0, 10, 0, 0);
DiscordIcon.BackgroundTransparency = 1;
DiscordIcon.Text = ">";
DiscordIcon.TextColor3 = Color3.fromRGB(88, 101, 242);
DiscordIcon.Font = Enum.Font.GothamBlack;
DiscordIcon.TextSize = 16;
DiscordIcon.ZIndex = 4;
DiscordIcon.Parent = DiscordBox;
local DiscordLabel = Instance.new("TextLabel");
DiscordLabel.Size = UDim2.new(1, -45, 1, 0);
DiscordLabel.Position = UDim2.new(0, 38, 0, 0);
DiscordLabel.BackgroundTransparency = 1;
DiscordLabel.Text = DISCORD_LINK;
DiscordLabel.TextColor3 = Color3.fromRGB(88, 101, 242);
DiscordLabel.Font = Enum.Font.GothamBold;
DiscordLabel.TextSize = 13;
DiscordLabel.TextXAlignment = Enum.TextXAlignment.Left;
DiscordLabel.ZIndex = 4;
DiscordLabel.Parent = DiscordBox;
local CopyBtn = Instance.new("TextButton");
CopyBtn.Name = "CopyDiscord";
CopyBtn.Size = UDim2.new(0.85, 0, 0, 34);
CopyBtn.Position = UDim2.new(0.075, 0, 0, 194);
CopyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242);
CopyBtn.BorderSizePixel = 0;
CopyBtn.Text = "Copy Discord Invite";
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
CopyBtn.Font = Enum.Font.GothamBold;
CopyBtn.TextSize = 13;
CopyBtn.AutoButtonColor = true;
CopyBtn.ZIndex = 3;
CopyBtn.Parent = Card;
local copyCorner = Instance.new("UICorner");
copyCorner.CornerRadius = UDim.new(0, 8);
copyCorner.Parent = CopyBtn;
local KeyLabel = Instance.new("TextLabel");
KeyLabel.Size = UDim2.new(0.85, 0, 0, 16);
KeyLabel.Position = UDim2.new(0.075, 0, 0, 240);
KeyLabel.BackgroundTransparency = 1;
KeyLabel.Text = "ENTER KEY";
KeyLabel.TextColor3 = Color3.fromRGB(100, 100, 120);
KeyLabel.Font = Enum.Font.GothamBold;
KeyLabel.TextSize = 10;
KeyLabel.TextXAlignment = Enum.TextXAlignment.Left;
KeyLabel.ZIndex = 3;
KeyLabel.Parent = Card;
local InputFrame = Instance.new("Frame");
InputFrame.Name = "InputFrame";
InputFrame.Size = UDim2.new(0.85, 0, 0, 40);
InputFrame.Position = UDim2.new(0.075, 0, 0, 258);
InputFrame.BackgroundColor3 = Color3.fromRGB(22, 22, 30);
InputFrame.BorderSizePixel = 0;
InputFrame.ZIndex = 3;
InputFrame.Parent = Card;
local inputFrameCorner = Instance.new("UICorner");
inputFrameCorner.CornerRadius = UDim.new(0, 8);
inputFrameCorner.Parent = InputFrame;
local inputStroke = Instance.new("UIStroke");
inputStroke.Color = Color3.fromRGB(50, 50, 65);
inputStroke.Thickness = 1;
inputStroke.Parent = InputFrame;
local KeyInput = Instance.new("TextBox");
KeyInput.Name = "KeyInput";
KeyInput.Size = UDim2.new(1, -20, 1, 0);
KeyInput.Position = UDim2.new(0, 10, 0, 0);
KeyInput.BackgroundTransparency = 1;
KeyInput.Text = "";
KeyInput.PlaceholderText = "Paste your key here...";
KeyInput.PlaceholderColor3 = Color3.fromRGB(80, 80, 100);
KeyInput.TextColor3 = Color3.fromRGB(220, 220, 240);
KeyInput.Font = Enum.Font.GothamBold;
KeyInput.TextSize = 14;
KeyInput.ClearTextOnFocus = false;
KeyInput.ZIndex = 4;
KeyInput.Parent = InputFrame;
local VerifyBtn = Instance.new("TextButton");
VerifyBtn.Name = "Verify";
VerifyBtn.Size = UDim2.new(0.85, 0, 0, 40);
VerifyBtn.Position = UDim2.new(0.075, 0, 0, 310);
VerifyBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40);
VerifyBtn.BorderSizePixel = 0;
VerifyBtn.Text = "VERIFY KEY";
VerifyBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
VerifyBtn.Font = Enum.Font.GothamBlack;
VerifyBtn.TextSize = 15;
VerifyBtn.AutoButtonColor = true;
VerifyBtn.ZIndex = 3;
VerifyBtn.Parent = Card;
local verifyCorner = Instance.new("UICorner");
verifyCorner.CornerRadius = UDim.new(0, 8);
verifyCorner.Parent = VerifyBtn;
local verifyGradient = Instance.new("UIGradient");
verifyGradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(200, 40, 40)),ColorSequenceKeypoint.new(1, Color3.fromRGB(160, 30, 30))});
verifyGradient.Rotation = 90;
verifyGradient.Parent = VerifyBtn;
local StatusLabel = Instance.new("TextLabel");
StatusLabel.Name = "Status";
StatusLabel.Size = UDim2.new(0.85, 0, 0, 20);
StatusLabel.Position = UDim2.new(0.075, 0, 0, 358);
StatusLabel.BackgroundTransparency = 1;
StatusLabel.Text = "";
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80);
StatusLabel.Font = Enum.Font.GothamBold;
StatusLabel.TextSize = 11;
StatusLabel.ZIndex = 3;
StatusLabel.Parent = Card;
local FooterLabel = Instance.new("TextLabel");
FooterLabel.Size = UDim2.new(1, 0, 0, 18);
FooterLabel.Position = UDim2.new(0, 0, 0, 385);
FooterLabel.BackgroundTransparency = 1;
FooterLabel.Text = "Drk Baedi v1.0 | Blade Ball";
FooterLabel.TextColor3 = Color3.fromRGB(60, 60, 75);
FooterLabel.Font = Enum.Font.Gotham;
FooterLabel.TextSize = 10;
FooterLabel.ZIndex = 3;
FooterLabel.Parent = Card;
Card.BackgroundTransparency = 1;
local openTween = TweenService:Create(Card, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size=UDim2.fromOffset(360, 415),BackgroundTransparency=0});
openTween:Play();
task.spawn(function()
	while ScreenGui and ScreenGui.Parent do
		local t1 = TweenService:Create(LogoLabel, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3=Color3.fromRGB(255, 90, 90)});
		t1:Play();
		t1.Completed:Wait();
		if (not ScreenGui or not ScreenGui.Parent) then
			break;
		end
		local t2 = TweenService:Create(LogoLabel, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {TextColor3=Color3.fromRGB(180, 40, 40)});
		t2:Play();
		t2.Completed:Wait();
	end
end);
task.spawn(function()
	local FlatIdent_2D2B8 = 0;
	local rot;
	while true do
		if (FlatIdent_2D2B8 == 0) then
			rot = 0;
			while ScreenGui and ScreenGui.Parent do
				local FlatIdent_E0D0 = 0;
				while true do
					if (FlatIdent_E0D0 == 0) then
						rot = rot + 1;
						if (rot > 360) then
							rot = 0;
						end
						FlatIdent_E0D0 = 1;
					end
					if (FlatIdent_E0D0 == 1) then
						accentGradient.Rotation = rot;
						task.wait(0.03);
						break;
					end
				end
			end
			break;
		end
	end
end);
local function HoverSetup(button, normalColor, hoverColor)
	local FlatIdent_3EEE1 = 0;
	while true do
		if (FlatIdent_3EEE1 == 0) then
			button.MouseEnter:Connect(function()
				TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3=hoverColor}):Play();
			end);
			button.MouseLeave:Connect(function()
				TweenService:Create(button, TweenInfo.new(0.15), {BackgroundColor3=normalColor}):Play();
			end);
			break;
		end
	end
end
HoverSetup(CopyBtn, Color3.fromRGB(88, 101, 242), Color3.fromRGB(110, 125, 255));
HoverSetup(VerifyBtn, Color3.fromRGB(200, 40, 40), Color3.fromRGB(240, 60, 60));
KeyInput.Focused:Connect(function()
	TweenService:Create(inputStroke, TweenInfo.new(0.2), {Color=Color3.fromRGB(200, 50, 50),Thickness=2}):Play();
end);
KeyInput.FocusLost:Connect(function()
	TweenService:Create(inputStroke, TweenInfo.new(0.2), {Color=Color3.fromRGB(50, 50, 65),Thickness=1}):Play();
end);
CopyBtn.MouseButton1Click:Connect(function()
	local FlatIdent_39764 = 0;
	while true do
		if (FlatIdent_39764 == 0) then
			pcall(function()
				setclipboard(DISCORD_FULL);
			end);
			CopyBtn.Text = "Copied!";
			FlatIdent_39764 = 1;
		end
		if (FlatIdent_39764 == 1) then
			CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 180, 70);
			task.delay(2, function()
				if (CopyBtn and CopyBtn.Parent) then
					local FlatIdent_35A31 = 0;
					while true do
						if (FlatIdent_35A31 == 0) then
							CopyBtn.Text = "Copy Discord Invite";
							CopyBtn.BackgroundColor3 = Color3.fromRGB(88, 101, 242);
							break;
						end
					end
				end
			end);
			break;
		end
	end
end);
local verifyDebounce = false;
VerifyBtn.MouseButton1Click:Connect(function()
	if verifyDebounce then
		return;
	end
	verifyDebounce = true;
	local inputKey = KeyInput.Text;
	if (not inputKey or (inputKey == "")) then
		local FlatIdent_189F0 = 0;
		while true do
			if (FlatIdent_189F0 == 1) then
				verifyDebounce = false;
				return;
			end
			if (FlatIdent_189F0 == 0) then
				StatusLabel.Text = "Please enter a key!";
				StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80);
				FlatIdent_189F0 = 1;
			end
		end
	end
	VerifyBtn.Text = "VERIFYING...";
	VerifyBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 100);
	StatusLabel.Text = "Checking key...";
	StatusLabel.TextColor3 = Color3.fromRGB(180, 180, 200);
	task.spawn(function()
		local FlatIdent_8D1A5 = 0;
		local dots;
		while true do
			if (0 == FlatIdent_8D1A5) then
				dots = 0;
				while verifyDebounce do
					local FlatIdent_8B523 = 0;
					while true do
						if (FlatIdent_8B523 == 1) then
							if (StatusLabel and StatusLabel.Parent) then
								StatusLabel.Text = "Checking key" .. string.rep(".", dots);
							end
							task.wait(0.3);
							break;
						end
						if (FlatIdent_8B523 == 0) then
							dots = dots + 1;
							if (dots > 3) then
								dots = 1;
							end
							FlatIdent_8B523 = 1;
						end
					end
				end
				break;
			end
		end
	end);
	task.wait(1.8);
	if CheckKey(inputKey) then
		local FlatIdent_61EE = 0;
		local closeTween;
		local overlayFade;
		while true do
			if (FlatIdent_61EE == 0) then
				verifyDebounce = false;
				StatusLabel.Text = "Key verified! Loading...";
				StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 120);
				VerifyBtn.Text = "VERIFIED";
				FlatIdent_61EE = 1;
			end
			if (FlatIdent_61EE == 2) then
				overlayFade = TweenService:Create(Overlay, TweenInfo.new(0.4), {BackgroundTransparency=1});
				closeTween:Play();
				overlayFade:Play();
				closeTween.Completed:Wait();
				FlatIdent_61EE = 3;
			end
			if (3 == FlatIdent_61EE) then
				ScreenGui:Destroy();
				task.wait(0.5);
				LoadMainScript();
				break;
			end
			if (FlatIdent_61EE == 1) then
				VerifyBtn.BackgroundColor3 = Color3.fromRGB(40, 200, 70);
				SaveKey(inputKey:gsub("%s+", ""));
				task.wait(0.8);
				closeTween = TweenService:Create(Card, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size=UDim2.fromOffset(0, 0),BackgroundTransparency=1});
				FlatIdent_61EE = 2;
			end
		end
	else
		local FlatIdent_5998C = 0;
		local origPos;
		while true do
			if (1 == FlatIdent_5998C) then
				StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80);
				VerifyBtn.Text = "VERIFY KEY";
				FlatIdent_5998C = 2;
			end
			if (FlatIdent_5998C == 2) then
				VerifyBtn.BackgroundColor3 = Color3.fromRGB(200, 40, 40);
				origPos = Card.Position;
				FlatIdent_5998C = 3;
			end
			if (FlatIdent_5998C == 4) then
				TweenService:Create(inputStroke, TweenInfo.new(0.2), {Color=Color3.fromRGB(255, 50, 50),Thickness=2}):Play();
				task.delay(1, function()
					if (inputStroke and inputStroke.Parent) then
						TweenService:Create(inputStroke, TweenInfo.new(0.3), {Color=Color3.fromRGB(50, 50, 65),Thickness=1}):Play();
					end
				end);
				break;
			end
			if (FlatIdent_5998C == 0) then
				verifyDebounce = false;
				StatusLabel.Text = "Invalid key! Join Discord: " .. DISCORD_LINK;
				FlatIdent_5998C = 1;
			end
			if (3 == FlatIdent_5998C) then
				for i = 1, 5 do
					local FlatIdent_75224 = 0;
					while true do
						if (FlatIdent_75224 == 0) then
							Card.Position = origPos + UDim2.fromOffset(10, 0);
							task.wait(0.04);
							FlatIdent_75224 = 1;
						end
						if (FlatIdent_75224 == 1) then
							Card.Position = origPos + UDim2.fromOffset(-10, 0);
							task.wait(0.04);
							break;
						end
					end
				end
				Card.Position = origPos;
				FlatIdent_5998C = 4;
			end
		end
	end
end);
local dragging = false;
local dragStart = nil;
local startPos = nil;
Card.InputBegan:Connect(function(input)
	if ((input.UserInputType == Enum.UserInputType.MouseButton1) or (input.UserInputType == Enum.UserInputType.Touch)) then
		local FlatIdent_494F6 = 0;
		while true do
			if (FlatIdent_494F6 == 0) then
				dragging = true;
				dragStart = input.Position;
				FlatIdent_494F6 = 1;
			end
			if (FlatIdent_494F6 == 1) then
				startPos = Card.Position;
				input.Changed:Connect(function()
					if (input.UserInputState == Enum.UserInputState.End) then
						dragging = false;
					end
				end);
				break;
			end
		end
	end
end);
Card.InputChanged:Connect(function(input)
	if (dragging and ((input.UserInputType == Enum.UserInputType.MouseMovement) or (input.UserInputType == Enum.UserInputType.Touch))) then
		local delta = input.Position - dragStart;
		Card.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y);
	end
end);
print("==========================================");
print("  Drk Baedi - Key System");
print("  Discord: " .. DISCORD_LINK);
print("  Get your key from Discord!");
print("==========================================");