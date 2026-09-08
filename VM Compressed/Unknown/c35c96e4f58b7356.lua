--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

local CollectionService = game:GetService("CollectionService");
local G2L = {};

local CoreGui = game:GetService("CoreGui")
G2L["ScreenGui_1"] = Instance.new("ScreenGui")
G2L["ScreenGui_1"].IgnoreGuiInset = true
G2L["ScreenGui_1"].Enabled = false
G2L["ScreenGui_1"].ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets
G2L["ScreenGui_1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
G2L["ScreenGui_1"].Parent = CoreGui

CollectionService:AddTag(G2L["ScreenGui_1"], "main");

G2L["main_2"] = Instance.new("Frame", G2L["ScreenGui_1"]);
G2L["main_2"].BorderSizePixel = 0;
G2L["main_2"].BackgroundColor3 = Color3.fromRGB(0, 0, 197);
G2L["main_2"].AnchorPoint = Vector2.new(0.5, 0.5);
G2L["main_2"].Size = UDim2.new(0.46053, 0, 0.6705, 0);
G2L["main_2"].Position = UDim2.new(0.5, 0, 0.5, 0);
G2L["main_2"].Name = "main";
G2L["main_2"].BackgroundTransparency = 0.65;

Instance.new("UIDragDetector", G2L["main_2"]);

local UICorner_3 = Instance.new("UICorner", G2L["main_2"]);
UICorner_3.CornerRadius = UDim.new(0.05, 0);

local Frame_4 = Instance.new("Frame", G2L["main_2"]);
Frame_4.BorderSizePixel = 0;
Frame_4.BackgroundColor3 = Color3.fromRGB(197, 197, 197);
Frame_4.Size = UDim2.new(0.94857, 0, 0.928, 0);
Frame_4.Position = UDim2.new(0.02857, 0, 0.04143, 0);
Frame_4.BackgroundTransparency = 0.5;

local UICorner_7 = Instance.new("UICorner", Frame_4);
UICorner_7.CornerRadius = UDim.new(0.05, 0);

-- Page
local page_8 = Instance.new("Frame", Frame_4);
page_8.BorderSizePixel = 0;
page_8.BackgroundColor3 = Color3.fromRGB(169, 169, 169);
page_8.Size = UDim2.new(0.94, 0, 0.75, 0);
page_8.Position = UDim2.new(0.03, 0, 0.1875, 0);
page_8.Name = "page";
page_8.BackgroundTransparency = 0.3;

local UICorner_9 = Instance.new("UICorner", page_8);
UICorner_9.CornerRadius = UDim.new(0.05, 0);

local ScrollingFrame_a = Instance.new("ScrollingFrame", page_8);
ScrollingFrame_a.ScrollingDirection = Enum.ScrollingDirection.Y;
ScrollingFrame_a.BorderSizePixel = 0;
ScrollingFrame_a.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
ScrollingFrame_a.AutomaticCanvasSize = Enum.AutomaticSize.Y;
ScrollingFrame_a.Size = UDim2.new(0.97, 0, 0.97, 0);
ScrollingFrame_a.Position = UDim2.new(0.015, 0, 0.015, 0);
ScrollingFrame_a.ScrollBarThickness = 6;
ScrollingFrame_a.BackgroundTransparency = 1;

local UIListLayout_b = Instance.new("UIListLayout", ScrollingFrame_a);
UIListLayout_b.Padding = UDim.new(0.03, 0);

-- Top bar
local bar_c = Instance.new("Frame", Frame_4);
bar_c.BorderSizePixel = 0;
bar_c.BackgroundColor3 = Color3.fromRGB(169, 169, 169);
bar_c.Size = UDim2.new(0.93976, 0, 0.11607, 0);
bar_c.Position = UDim2.new(0.03614, 0, 0.03571, 0);
bar_c.Name = "bar";
bar_c.BackgroundTransparency = 0.3;

local close_d = Instance.new("TextButton", bar_c);
close_d.TextWrapped = true;
close_d.BorderSizePixel = 0;
close_d.TextStrokeColor3 = Color3.fromRGB(255, 255, 255);
close_d.TextScaled = true;
close_d.TextColor3 = Color3.fromRGB(255, 0, 0);
close_d.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
close_d.BackgroundTransparency = 1;
close_d.Size = UDim2.new(0.09615, 0, 1.15385, 0);
close_d.Text = "x";
close_d.Name = "close";
close_d.Position = UDim2.new(0.90385, 0, -0.07692, 0);

-- Minimized Icon
local minimizedIcon = Instance.new("TextButton", G2L["ScreenGui_1"])
minimizedIcon.Visible = false
minimizedIcon.Text = "🔵"
minimizedIcon.Size = UDim2.new(0, 50, 0, 50)
minimizedIcon.Position = UDim2.new(0.05, 0, 0.5, 0)
minimizedIcon.BackgroundTransparency = 1
minimizedIcon.TextScaled = true

-- Make it draggable
Instance.new("UIDragDetector", minimizedIcon)

-- Drag And Tap Fix
local UserInputService = game:GetService("UserInputService")
local touchStartTime = 0
local tapThreshold = 0.2 -- seconds; adjust if needed

minimizedIcon.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		touchStartTime = tick()
	end
end)

minimizedIcon.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		local duration = tick() - touchStartTime
		if duration < tapThreshold then
			-- Quick tap → restore GUI
			G2L["main_2"].Visible = true
			minimizedIcon.Visible = false
		end
	end
end)

-- Minimize Button
local minimize_d = Instance.new("TextButton", bar_c)
minimize_d.ZIndex = 2
minimize_d.TextWrapped = true
minimize_d.BorderSizePixel = 0
minimize_d.TextScaled = true
minimize_d.TextColor3 = Color3.fromRGB(0, 170, 255) -- Cyan
minimize_d.BackgroundTransparency = 1
minimize_d.Size = UDim2.new(0.09615, 0, 1.15385, 0)
minimize_d.Text = "−"
minimize_d.Name = "minimize"
minimize_d.Position = UDim2.new(0.82, 0, -0.07692, 0) -- adjust so it doesn’t overlap close button

-- Minimize behavior
minimize_d.MouseButton1Down:Connect(function()
    G2L["main_2"].Visible = false
    minimizedIcon.Visible = true
end)

local UICorner_e = Instance.new("UICorner", bar_c);
UICorner_e.CornerRadius = UDim.new(0.2, 0);

local title_f = Instance.new("TextLabel", bar_c);
title_f.TextWrapped = true;
title_f.BorderSizePixel = 0;
title_f.TextXAlignment = Enum.TextXAlignment.Left;
title_f.TextScaled = true;
title_f.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
title_f.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json");
title_f.TextColor3 = Color3.fromRGB(255, 0, 255);
title_f.BackgroundTransparency = 1;
title_f.Size = UDim2.new(0.54487, 0, 0.69231, 0);
title_f.Text = "example";
title_f.AutomaticSize = Enum.AutomaticSize.X;
title_f.Name = "title";
title_f.Position = UDim2.new(0.01923, 0, 0.07692, 0);

local UIAspectRatioConstraint_10 = Instance.new("UIAspectRatioConstraint", G2L["main_2"]);
UIAspectRatioConstraint_10.AspectRatio = 1.45;

-- Element samples
local element_12 = Instance.new("Folder", G2L["ScreenGui_1"]);
element_12.Name = "element";

local buttonsample_13 = Instance.new("Frame", element_12);
buttonsample_13.Visible = false;
buttonsample_13.BorderSizePixel = 0;
buttonsample_13.BackgroundColor3 = Color3.fromRGB(210, 210, 210);
buttonsample_13.Size = UDim2.new(1, 0, 0.18889, 0);
buttonsample_13.Name = "buttonsample";
buttonsample_13.BackgroundTransparency = 0.2;

local UICorner_14 = Instance.new("UICorner", buttonsample_13);
UICorner_14.CornerRadius = UDim.new(0.1, 0);

local TextButton_15 = Instance.new("TextButton", buttonsample_13);
TextButton_15.TextWrapped = true;
TextButton_15.BorderSizePixel = 0;
TextButton_15.TextXAlignment = Enum.TextXAlignment.Left;
TextButton_15.TextScaled = true;
TextButton_15.TextColor3 = Color3.fromRGB(0, 255, 255);
TextButton_15.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
TextButton_15.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json");
TextButton_15.BackgroundTransparency = 1;
TextButton_15.Size = UDim2.new(0.41842, 0, 0.75, 0);
TextButton_15.Text = "Button sample";
TextButton_15.Position = UDim2.new(0.00526, 0, 0.125, 0);

-- Toggle sample
local togglesample_16 = Instance.new("Frame", element_12);
togglesample_16.Visible = false;
togglesample_16.BorderSizePixel = 0;
togglesample_16.BackgroundColor3 = Color3.fromRGB(210, 210, 210);
togglesample_16.Size = UDim2.new(1, 0, 0.18889, 0);
togglesample_16.Name = "togglesample";
togglesample_16.BackgroundTransparency = 0.2;

local UICorner_17 = Instance.new("UICorner", togglesample_16);
UICorner_17.CornerRadius = UDim.new(0.1, 0);

local TextButton_18 = Instance.new("TextButton", togglesample_16);
TextButton_18.TextWrapped = true;
TextButton_18.BorderSizePixel = 0;
TextButton_18.TextXAlignment = Enum.TextXAlignment.Left;
TextButton_18.TextScaled = true;
TextButton_18.TextColor3 = Color3.fromRGB(0, 255, 255);
TextButton_18.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
TextButton_18.FontFace = Font.new("rbxasset://fonts/families/FredokaOne.json");
TextButton_18.BackgroundTransparency = 1;
TextButton_18.Size = UDim2.new(0.41842, 0, 0.75, 0);
TextButton_18.Text = "toggle";
TextButton_18.Position = UDim2.new(0.00526, 0, 0.125, 0);

local Frame_19 = Instance.new("Frame", togglesample_16);
Frame_19.BorderSizePixel = 0;
Frame_19.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
Frame_19.Size = UDim2.new(0.13684, 0, 0.875, 0);
Frame_19.Position = UDim2.new(0.85211, 0, 0.0625, 0);

local UICorner_1a = Instance.new("UICorner", Frame_19);
UICorner_1a.CornerRadius = UDim.new(0.2, 0);

-- LocalScript logic
local function C_11()
	local gui = G2L["ScreenGui_1"]
	local element = gui.element	
	
	function create(name)	
		local tables = {}	
		local guiClone = gui:Clone()	
		guiClone.Enabled = true	
		guiClone.Parent = game:GetService("CoreGui")
		guiClone.Name = name or "error"
		
		local frame = guiClone.main.Frame	
		frame.bar.title.Text = name or "untitled"	
		frame.bar.close.MouseButton1Down:Connect(function() guiClone:Destroy() end)	

-- Clone Minimized Icon into this GUI
local minimizedIconClone = minimizedIcon:Clone()
minimizedIconClone.Parent = guiClone
minimizedIconClone.Visible = false
Instance.new("UIDragDetector", minimizedIconClone)

-- Hook up Restore behavior with tap & drag fix
local touchStartTime = 0
local tapThreshold = 0.2 -- seconds

minimizedIconClone.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		touchStartTime = tick()
	end
end)

minimizedIconClone.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.Touch then
		local duration = tick() - touchStartTime
		if duration < tapThreshold then
			-- Quick tap → restore GUI
			guiClone.main.Visible = true
			minimizedIconClone.Visible = false
		end
	end
end)

-- Clone Minimize Button into this GUI
local minimizeBtn = minimize_d:Clone()
minimizeBtn.Parent = frame.bar

-- Hook up Minimize behavior
minimizeBtn.MouseButton1Down:Connect(function()
    guiClone.main.Visible = false
    minimizedIconClone.Visible = true
end)

		local page = frame.page.ScrollingFrame	
		
		function tables:addbutton(name, call)	
			local button = element.buttonsample:Clone()
			button.Parent = page	
			button.Visible = true	
			button.Name = name or "notitle"	
			button.TextButton.Text = name or "error"	
			button.TextButton.MouseButton1Down:Connect(function() if call then pcall(call) end end)	
			return button	
		end	
		
		function tables:addtoggle(name, call, bool)	
			local toggle = element.togglesample:Clone()
			toggle.TextButton.Text = name or ""	
			toggle.Visible = true	
			toggle.Parent = page
			
			local boolean = false	
			if bool then	
				boolean = true
				if call then call(boolean) end
				toggle.Frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
			end	
			
			toggle.TextButton.MouseButton1Down:Connect(function()	
				boolean = not boolean
				if call then	
					toggle.Frame.BackgroundColor3 = boolean 
    and Color3.fromRGB(255, 0, 255) -- ON color
    or Color3.fromRGB(173, 216, 230) -- off color
					call(boolean)
				end	
			end)	
			return toggle	
		end	
		
		return tables	
	end	
	
	local main = create("Elvis's FE Scripts Collection")
	
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local infiniteJumping = false

main:addtoggle("Infinite Jump", function(isOn)
	infiniteJumping = isOn
	print("Infinite Jump:", infiniteJumping and "ON" or "OFF")
end)

local function setupInfiniteJump(character)
	UserInputService.JumpRequest:Connect(function()
		if infiniteJumping then
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			end
		end
	end)
end

if player.Character then
	setupInfiniteJump(player.Character)
end

player.CharacterAdded:Connect(function(char)
	setupInfiniteJump(char)
end)


main:addtoggle("Noclip", function(ison)
    if ison then
        print("Noclip ON")
        noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            for _, part in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end)
    else
        print("Noclip OFF")
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
        -- Reset CanCollide when turning off
        for _, part in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end)

main:addbutton("GOD Mode", function()
		loadstring(game:HttpGet("https://pastebin.com/raw/eD8HBXGS"))()
end)

main:addbutton("R15 Tall Avatar", function()
		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tall-Man-R15-1326"))()

	end)

main:addbutton("R6 Emotes GUI", function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Fsploit/FeAnimationHub/refs/heads/main/Hub.lua"))()
end)

main:addbutton("R15 Emotes GUI", function()
		loadstring(game:HttpGet("https://yarhm.mhi.im/scr?channel=afem", false))()
end)

main:addbutton("Serversided Admin (Quirky CMD)", function()
    loadstring(game:HttpGet("https://gist.github.com/someunknowndude/38cecea5be9d75cb743eac8b1eaf6758/raw"))()
end)

main:addbutton("Infinite Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

main:addbutton("Nameless Admin", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
end)

main:addbutton("WallHop Script (V4)", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ScpGuest666/Random-Roblox-script/refs/heads/main/Roblox%20WallHop%20V4%20script"))()
end)

main:addbutton("Anti-Cheat Bypass", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Next1x/Nextix./main/UniversalACBypass"))()
end)

main:addtoggle("Anti-Fling", function(isOn)
    if isOn then
        _G.AntiFlingConfig = {
            disable_rotation = true,
            limit_velocity = true,
            limit_velocity_sensitivity = 150,
            limit_velocity_slow = 0,
            anti_ragdoll = true,
            anchor = false,
            smart_anchor = true,
            anchor_dist = 30,
            teleport = false,
            smart_teleport = true,
            teleport_dist = 30
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/topitbopit/rblx/main/extra/better_antifling.lua"))()
        print("Anti-Fling: ON")
    else
        if _G.disable then
            _G.disable()
            print("Anti-Fling: OFF")
        end
    end
end, false)

main:addtoggle("Fly", function(isOn)
    if isOn then
        getgenv().flying = true
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local UserInputService = game:GetService("UserInputService")
        local RunService = game:GetService("RunService")

        local speed = 50

        local bg = Instance.new("BodyGyro", humanoidRootPart)
        bg.P = 9e4
        bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
        bg.CFrame = humanoidRootPart.CFrame

        local bv = Instance.new("BodyVelocity", humanoidRootPart)
        bv.Velocity = Vector3.zero
        bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)

        flyConnection = RunService.RenderStepped:Connect(function()
            if getgenv().flying then
                local moveDir = Vector3.zero

                if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
                    moveDir = player.Character:FindFirstChildOfClass("Humanoid").MoveDirection
                end

                local cam = workspace.CurrentCamera
                local forward = cam.CFrame.LookVector
                local right = cam.CFrame.RightVector

                forward = Vector3.new(forward.X, 0, forward.Z).Unit
                right = Vector3.new(right.X, 0, right.Z).Unit

                local direction = (forward * moveDir.Z) + (right * moveDir.X)

                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    direction = direction + Vector3.new(0, 1, 0)
                elseif UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                    direction = direction + Vector3.new(0, -1, 0)
                end

                if direction.Magnitude > 0 then
                    direction = direction.Unit * speed
                end

                bv.Velocity = direction
                bg.CFrame = cam.CFrame
            end
        end)
    else
        getgenv().flying = false
        if flyConnection then flyConnection:Disconnect() flyConnection = nil end
        local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            if hrp:FindFirstChildOfClass("BodyGyro") then hrp:FindFirstChildOfClass("BodyGyro"):Destroy() end
            if hrp:FindFirstChildOfClass("BodyVelocity") then hrp:FindFirstChildOfClass("BodyVelocity"):Destroy() end
        end
        print("Fly OFF")
    end
end, false)

main:addbutton("Free Gamepasses (some games)", function()
    getgenv().Color = "rgb"
    getgenv().TextColor = "cyan"
    loadstring(game:HttpGet("https://raw.githubusercontent.com/rndmq/Serverlist/refs/heads/main/Server87"))()
end)

main:addbutton("Universal Aimbot", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Universal-Aimbot-23560"))()
end)

main:addbutton("C00lgui By Elvis", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-c00lgui-By-Elvis-43173"))()
end)

main:addbutton("BlackHole", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Natural-Disaster-Survival-Blackhole-Sypher-Hub-30166"))()
end)

main:addbutton("SpeedHub X", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/a-literal-baseplate.-Speedhub-X-30971"))()
end)

main:addbutton("Chat Bypasser", function()
    loadstring(game:HttpGet("https://github.com/Synergy-Networks/products/raw/main/BetterBypasser/loader.lua"))()
end)

main:addbutton("F3X Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SkireScripts/F3X-Panel/main/Main.lua"))()
end)

main:addbutton("Dex Explorer", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dex-Explorer-for-Mobile-32019"))()
end)

main:addbutton("Nullfire Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader"))()
end)

main:addbutton("Lazy Hub V4", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/The-Chosen-One-laziest-V2-7696"))()
end)

main:addbutton("Tools Giver", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Game-tool-giver-12133"))()
end)

main:addbutton("Shiftlock Giver", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-Mobile-Shiftlock-Official-19126"))()
end)

main:addbutton("Ghost Hub", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-X-Ghost-Hub-X-7595"))()
end)

main:addbutton("NPC Controller", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/fe-source/refs/heads/main/NPC/source/main.Luau"))()
end)

main:addbutton("RTX Shaders GUI", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/unk/refs/heads/main/patrick%20shader.luau"))()
end)

main:addbutton("Telekinesis", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty1.lua"))()
end)

main:addbutton("RoChips Admin Panel", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/load/refs/heads/main/rcloader"))()
end)

main:addbutton("Info Viewer", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty31.lua"))()
end)

main:addbutton("Sw4mp M0nster", function()
    loadstring(game:HttpGet("https://pastefy.app/2tC7nRAK/raw"))()
end)

main:addbutton("Grab Part", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/Da2RAkmA"))()
end)

main:addbutton("Anti-ChatLog", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HeyGyt/simplityv2/main/main"))()
end)

main:addbutton("NoGravity Parts", function()
    local play, rWFGCSGo, ga = game, "REKDiMxg", "app"
    loadstring(play:HttpGet(("https://pastefy."..ga.."/"..rWFGCSGo.."/raw"),true))()
end)

main:addbutton("John Doe", function()
    loadstring(game:HttpGet(('https://pastefy.ga/NRS9eVcp/raw'),true))()
end)

main:addbutton("Walk On Walls", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty21.lua"))()
end)

main:addbutton("YouTube Player", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Dan41/Roblox-Scripts/refs/heads/main/Youtube%20Play/1%20YoutubePlay.lua', true))()
end)

main:addbutton("Delta Keyboard", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
end)

main:addbutton("Remote Spy", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
end)

main:addbutton("Rejoin Server", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rejoin-Same-Exact-Server-6412"))()
end)

main:addbutton("Yeet GUI", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-yeet-gui-7351"))()
end)

main:addbutton("Fly GUI V5", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Hotdog120823/FlyGuiV5/refs/heads/main/FlyGui"))()
end)

main:addbutton("EZ Hub 150+ games", function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))()
end)

main:addbutton("Solara Hub 200 games", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()
end)

main:addbutton("YARHM Hub", function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YARHM-12403"))()
end)

main:addbutton("Mobile Cursor", function()
    loadstring(game:HttpGet(('https://pastefy.app/VPqgV9IN/raw'),true))()
end)

main:addbutton("Auto Clicker", function()
    loadstring(game:HttpGet(('https://rawscripts.net/raw/Universal-Script-Auto-Clicker-Gui-9115'),true))()
end)

main:addbutton("Forsaken Anims R6", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CyberNinja103/brodwa/refs/heads/main/ForsakationHub"))()
end)

end
task.spawn(C_11)

return G2L["ScreenGui_1"], require