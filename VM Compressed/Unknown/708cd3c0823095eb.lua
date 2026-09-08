local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "umanovacampanha"
Junkie.identifier = "8513"
Junkie.provider = "Lockr"

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local HttpService = game:GetService("HttpService")

local Icons = {
	Lightning = "rbxassetid://10723407389",
	Discord = "rbxassetid://10734952273",
	CheckCircle = "rbxassetid://10709790644",
	XCircle = "rbxassetid://10747384394",
	Warning = "rbxassetid://10747384394"
}

local function hasFileSystemSupport()
	local hasWritefile = pcall(function() return type(writefile) == "function" end)
	local hasReadfile = pcall(function() return type(readfile) == "function" end)
	local hasIsfile = pcall(function() return type(isfile) == "function" end)
	return hasWritefile and hasReadfile and hasIsfile
end

local fileSystemSupported = hasFileSystemSupport()

local function saveVerifiedKey(key)
	if not fileSystemSupported then return false end
	local ok = pcall(function()
		writefile("verified_key.txt", key)
	end)
	return ok
end

local function loadVerifiedKey()
	if not fileSystemSupported then
		return nil
	end

	local ok, content = pcall(function()
		return readfile("verified_key.txt")
	end)

	if not ok or not content then
		return nil
	end
	return content
end

local function clearSavedKey()
	if not fileSystemSupported then return false end
	local ok = pcall(function() delfile("verified_key.txt") end)
	return ok
end

local Configuration = {
	ScreenGuiName = "CryonixKeySystem",
	Window = {Size = UDim2.new(0, 450, 0, 320)},
	Colors = {
		Bg = Color3.fromRGB(20, 20, 20),
		BgDark = Color3.fromRGB(15, 15, 15),
		Primary = Color3.fromRGB(220, 30, 30),       -- Vermelho principal
		PrimaryHover = Color3.fromRGB(255, 60, 60),  -- Vermelho mais claro (hover)
		Secondary = Color3.fromRGB(40, 40, 40),
		Success = Color3.fromRGB(50, 205, 110),
		Error = Color3.fromRGB(245, 70, 90),
		Warning = Color3.fromRGB(220, 30, 30),       -- Vermelho para avisos
		TextMain = Color3.fromRGB(255, 255, 255),
		TextSec = Color3.fromRGB(180, 180, 180),
		TextMuted = Color3.fromRGB(120, 120, 120),
		Border = Color3.fromRGB(60, 20, 20)          -- Borda com leve tom vermelho escuro
	},
	Animations = {
		Fast = 0.2,
		Medium = 0.3,
		Slow = 0.4
	}
}

-- Junkie backend error codes -> user-facing copy (docs: "Response Cases for check_key()")
local ErrorMessages = {
	KEY_INVALID = "Key not found. Check for typos.",
	KEY_EXPIRED = "This key has expired. Get a new one.",
	HWID_BANNED = "This device has been banned.",
	KEY_INVALIDATED = "This key was disabled.",
	ALREADY_USED = "This key has already been used.",
	HWID_MISMATCH = "This key reached its device limit.",
	SERVICE_NOT_FOUND = "Service not found. Contact support.",
	SERVICE_MISMATCH = "This key is for a different service.",
	PREMIUM_REQUIRED = "A premium key is required for this service.",
	ERROR = "Network error. Try again."
}

local function resolveErrorMessage(err)
	if not err then return "Invalid key" end
	if ErrorMessages[err] then return ErrorMessages[err] end
	if tostring(err):match("^http %d+") then
		return "Server error (" .. err .. "). Try again later."
	end
	return tostring(err)
end

local Utils = {}

Utils.Tween = function(obj, props, time, style, dir)
	local t = TweenService:Create(
		obj,
		TweenInfo.new(time or 0.3, style or Enum.EasingStyle.Quint, dir or Enum.EasingDirection.Out),
		props
	)
	t:Play()
	return t
end

Utils.Round = function(obj, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius or 12)
	c.Parent = obj
	return c
end

Utils.Stroke = function(obj, color, thick, trans)
	local s = Instance.new("UIStroke")
	s.Color = color or Color3.new(1, 1, 1)
	s.Thickness = thick or 1
	s.Transparency = trans or 0.9
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent = obj
	return s
end

local ToastSystem = {ActiveToasts = {}, MaxToasts = 3, ToastSpacing = 10}

ToastSystem.Create = function(parent, message, toastType, duration)
	local colors = {
		success = Configuration.Colors.Success,
		error = Configuration.Colors.Error,
		warning = Configuration.Colors.Warning,
		info = Configuration.Colors.Primary
	}

	local toastColor = colors[toastType] or Configuration.Colors.Primary

	if #ToastSystem.ActiveToasts >= ToastSystem.MaxToasts then
		local oldest = table.remove(ToastSystem.ActiveToasts, 1)
		if oldest and oldest.Parent then
			oldest:Destroy()
		end
	end

	local toastHeight = 50
	local toast = Instance.new("Frame")
	toast.Name = tostring(tick())
	toast.Size = UDim2.new(0, 0, 0, toastHeight)
	toast.Position = UDim2.new(0.5, 0, 0, 20)
	toast.AnchorPoint = Vector2.new(0.5, 0)
	toast.BackgroundColor3 = Configuration.Colors.Secondary
	toast.BorderSizePixel = 0
	toast.ZIndex = 300
	toast.ClipsDescendants = true
	toast.Parent = parent
	Utils.Round(toast, 10)
	Utils.Stroke(toast, toastColor, 2, 0.5)

	local text = Instance.new("TextLabel")
	text.Size = UDim2.new(1, -20, 1, 0)
	text.Position = UDim2.new(0, 10, 0, 0)
	text.BackgroundTransparency = 1
	text.Text = message or ""
	text.TextColor3 = Configuration.Colors.TextMain
	text.TextSize = 14
	text.Font = Enum.Font.GothamMedium
	text.TextXAlignment = Enum.TextXAlignment.Center
	text.TextWrapped = true
	text.ZIndex = 301
	text.Parent = toast

	table.insert(ToastSystem.ActiveToasts, toast)

	local targetWidth = 300
	Utils.Tween(toast, {Size = UDim2.new(0, targetWidth, 0, toastHeight)}, Configuration.Animations.Medium)

	task.delay(duration or 3, function()
		if toast.Parent then
			Utils.Tween(toast, {
				Position = UDim2.new(0.5, 0, 0, -80),
				BackgroundTransparency = 1
			}, Configuration.Animations.Medium)

			for i, t in ipairs(ToastSystem.ActiveToasts) do
				if t == toast then
					table.remove(ToastSystem.ActiveToasts, i)
					break
				end
			end

			task.wait(Configuration.Animations.Medium)
			toast:Destroy()
		end
	end)

	return toast
end

local function SetBlur(enabled)
	local blur = Lighting:FindFirstChild("CryonixBlur")
	if enabled then
		if not blur then
			blur = Instance.new("BlurEffect")
			blur.Name = "CryonixBlur"
			blur.Size = 0
			blur.Parent = Lighting
		end
		Utils.Tween(blur, {Size = 20}, Configuration.Animations.Medium)
	elseif blur then
		Utils.Tween(blur, {Size = 0}, Configuration.Animations.Medium)
		task.delay(Configuration.Animations.Medium, function()
			blur:Destroy()
		end)
	end
end

local function Build()
	local parent = game:GetService("CoreGui")
	local old = parent:FindFirstChild(Configuration.ScreenGuiName)
	if old then
		old:Destroy()
	end

	local screen = Instance.new("ScreenGui")
	screen.Name = Configuration.ScreenGuiName
	screen.ResetOnSpawn = false
	screen.Parent = parent

	local overlay = Instance.new("Frame")
	overlay.Size = UDim2.fromScale(1, 1)
	overlay.BackgroundColor3 = Color3.new(0, 0, 0)
	overlay.BackgroundTransparency = 0.3
	overlay.Parent = screen

	SetBlur(true)

	-- Main Window
	local main = Instance.new("Frame")
	main.Size = Configuration.Window.Size
	main.Position = UDim2.new(0.5, 0, 0.5, 0)
	main.AnchorPoint = Vector2.new(0.5, 0.5)
	main.BackgroundColor3 = Configuration.Colors.BgDark
	main.BorderSizePixel = 0
	main.ClipsDescendants = true
	main.Parent = screen
	Utils.Round(main, 12)
	Utils.Stroke(main, Configuration.Colors.Border, 1, 0.3)

	-- Close Button
	local closeBtn = Instance.new("TextButton")
	closeBtn.Size = UDim2.new(0, 30, 0, 30)
	closeBtn.Position = UDim2.new(1, -15, 0, 15)
	closeBtn.AnchorPoint = Vector2.new(1, 0)
	closeBtn.BackgroundTransparency = 1
	closeBtn.Text = "X"
	closeBtn.TextColor3 = Configuration.Colors.TextSec
	closeBtn.TextSize = 20
	closeBtn.Font = Enum.Font.GothamBold
	closeBtn.Parent = main

	-- Lightning Icon
	local iconFrame = Instance.new("Frame")
	iconFrame.Size = UDim2.new(0, 50, 0, 50)
	iconFrame.Position = UDim2.new(0.5, 0, 0, 30)
	iconFrame.AnchorPoint = Vector2.new(0.5, 0)
	iconFrame.BackgroundColor3 = Configuration.Colors.Primary
	iconFrame.BorderSizePixel = 0
	iconFrame.Parent = main
	Utils.Round(iconFrame, 25)

	local icon = Instance.new("ImageLabel")
	icon.Size = UDim2.new(0, 25, 0, 25)
	icon.Position = UDim2.new(0.5, 0, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0.5, 0.5)
	icon.BackgroundTransparency = 1
	icon.Image = Icons.Lightning
	icon.ImageColor3 = Color3.fromRGB(20, 20, 20)
	icon.Parent = iconFrame

	-- Title
	local title = Instance.new("TextLabel")
	title.Size = UDim2.new(1, -40, 0, 35)
	title.Position = UDim2.new(0, 20, 0, 90)
	title.BackgroundTransparency = 1
	title.Text = "Cryonix Hub"
	title.TextColor3 = Configuration.Colors.TextMain
	title.TextSize = 28
	title.Font = Enum.Font.GothamBold
	title.TextXAlignment = Enum.TextXAlignment.Center
	title.Parent = main

	-- Game badge
	local gameBadge = Instance.new("TextLabel")
	gameBadge.Size = UDim2.new(1, -40, 0, 14)
	gameBadge.Position = UDim2.new(0, 20, 0, 122)
	gameBadge.BackgroundTransparency = 1
	gameBadge.Text = "IRON SOUL DUNGEON"
	gameBadge.TextColor3 = Configuration.Colors.TextMuted
	gameBadge.TextSize = 11
	gameBadge.Font = Enum.Font.GothamBold
	gameBadge.TextXAlignment = Enum.TextXAlignment.Center
	gameBadge.Parent = main

	-- Subtitle 1
	local subtitle1 = Instance.new("TextLabel")
	subtitle1.Size = UDim2.new(1, -40, 0, 18)
	subtitle1.Position = UDim2.new(0, 20, 0, 140)
	subtitle1.BackgroundTransparency = 1
	subtitle1.Text = "Click \"Get Key\" Button To Get Your Free Key"
	subtitle1.TextColor3 = Configuration.Colors.TextSec
	subtitle1.TextSize = 12
	subtitle1.Font = Enum.Font.Gotham
	subtitle1.TextXAlignment = Enum.TextXAlignment.Center
	subtitle1.Parent = main

	-- Subtitle 2
	local subtitle2 = Instance.new("TextLabel")
	subtitle2.Size = UDim2.new(1, -40, 0, 18)
	subtitle2.Position = UDim2.new(0, 20, 0, 160)
	subtitle2.BackgroundTransparency = 1
	subtitle2.Text = "Join Our Discord For Support And Updates"
	subtitle2.TextColor3 = Configuration.Colors.Primary
	subtitle2.TextSize = 11
	subtitle2.Font = Enum.Font.Gotham
	subtitle2.TextXAlignment = Enum.TextXAlignment.Center
	subtitle2.Parent = main

	-- Input Box
	local inputFrame = Instance.new("Frame")
	inputFrame.Size = UDim2.new(0, 400, 0, 40)
	inputFrame.Position = UDim2.new(0.5, 0, 0, 195)
	inputFrame.AnchorPoint = Vector2.new(0.5, 0)
	inputFrame.BackgroundColor3 = Configuration.Colors.Secondary
	inputFrame.BorderSizePixel = 0
	inputFrame.Parent = main
	Utils.Round(inputFrame, 8)
	Utils.Stroke(inputFrame, Configuration.Colors.Border, 1, 0.5)

	local box = Instance.new("TextBox")
	box.Size = UDim2.new(1, -20, 1, 0)
	box.Position = UDim2.new(0, 10, 0, 0)
	box.BackgroundTransparency = 1
	box.Text = ""
	box.PlaceholderText = "Enter Your Key"
	box.PlaceholderColor3 = Configuration.Colors.TextMuted
	box.TextColor3 = Configuration.Colors.TextMain
	box.TextSize = 14
	box.Font = Enum.Font.Gotham
	box.TextXAlignment = Enum.TextXAlignment.Center
	box.Parent = inputFrame

	-- Button Container
	local btnContainer = Instance.new("Frame")
	btnContainer.Size = UDim2.new(0, 400, 0, 40)
	btnContainer.Position = UDim2.new(0.5, 0, 0, 250)
	btnContainer.AnchorPoint = Vector2.new(0.5, 0)
	btnContainer.BackgroundTransparency = 1
	btnContainer.Parent = main

	-- Get Key Button
	local getKeyBtn = Instance.new("TextButton")
	getKeyBtn.Size = UDim2.new(0, 125, 0, 40)
	getKeyBtn.Position = UDim2.new(0, 0, 0, 0)
	getKeyBtn.BackgroundColor3 = Configuration.Colors.Secondary
	getKeyBtn.Text = "Get Key"
	getKeyBtn.TextColor3 = Configuration.Colors.TextMain
	getKeyBtn.TextSize = 14
	getKeyBtn.Font = Enum.Font.GothamBold
	getKeyBtn.AutoButtonColor = false
	getKeyBtn.Parent = btnContainer
	Utils.Round(getKeyBtn, 8)
	Utils.Stroke(getKeyBtn, Configuration.Colors.Border, 1, 0.5)

	-- Verify Button (Primary)
	local verifyBtn = Instance.new("TextButton")
	verifyBtn.Size = UDim2.new(0, 138, 0, 40)
	verifyBtn.Position = UDim2.new(0, 131, 0, 0)
	verifyBtn.BackgroundColor3 = Configuration.Colors.Primary
	verifyBtn.Text = "Verify"
	verifyBtn.TextColor3 = Configuration.Colors.BgDark
	verifyBtn.TextSize = 14
	verifyBtn.Font = Enum.Font.GothamBold
	verifyBtn.AutoButtonColor = false
	verifyBtn.Parent = btnContainer
	Utils.Round(verifyBtn, 8)

	-- Discord Button
	local discordBtn = Instance.new("TextButton")
	discordBtn.Size = UDim2.new(0, 125, 0, 40)
	discordBtn.Position = UDim2.new(0, 275, 0, 0)
	discordBtn.BackgroundColor3 = Configuration.Colors.Secondary
	discordBtn.Text = "Discord"
	discordBtn.TextColor3 = Configuration.Colors.TextMain
	discordBtn.TextSize = 14
	discordBtn.Font = Enum.Font.GothamBold
	discordBtn.AutoButtonColor = false
	discordBtn.Parent = btnContainer
	Utils.Round(discordBtn, 8)
	Utils.Stroke(discordBtn, Configuration.Colors.Border, 1, 0.5)

	-- Hover Effects
	local function ApplyHover(btn, isPrimary)
		local baseColor = btn.BackgroundColor3
		local hoverColor = isPrimary and Configuration.Colors.PrimaryHover or Configuration.Colors.Bg

		btn.MouseEnter:Connect(function()
			Utils.Tween(btn, {BackgroundColor3 = hoverColor}, 0.2)
		end)

		btn.MouseLeave:Connect(function()
			Utils.Tween(btn, {BackgroundColor3 = baseColor}, 0.2)
		end)
	end

	ApplyHover(getKeyBtn, false)
	ApplyHover(verifyBtn, true)
	ApplyHover(discordBtn, false)

	-- Focus effects for input
	box.Focused:Connect(function()
		Utils.Tween(inputFrame:FindFirstChildOfClass("UIStroke"), {Transparency = 0.2}, 0.2)
	end)

	box.FocusLost:Connect(function()
		Utils.Tween(inputFrame:FindFirstChildOfClass("UIStroke"), {Transparency = 0.5}, 0.2)
	end)

	-- Verify Button Logic
	verifyBtn.MouseButton1Click:Connect(function()
		local key = box.Text:upper()

		if key == "" then
			ToastSystem.Create(screen, "Please enter a key", "warning")
			return
		end

		verifyBtn.Text = "Verifying..."
		verifyBtn.Active = false

		local result = Junkie.check_key(key)

		verifyBtn.Active = true
		verifyBtn.Text = "Verify"

		if not result then
			ToastSystem.Create(screen, "API request failed", "error")
			return
		end

		if result.valid then
			saveVerifiedKey(key)
			getgenv().SCRIPT_KEY = key
			ToastSystem.Create(screen, "Access granted!", "success")

			task.wait(0.5)
			SetBlur(false)
			Utils.Tween(main, {
				Position = UDim2.new(0.5, 0, 0.5, 100),
				BackgroundTransparency = 1
			}, 0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)

			task.delay(0.5, function()
				screen:Destroy()
			end)
		else
			-- Junkie returns the failure reason under `error`, not `message`
			local err = result.error

			if err == "HWID_BANNED" then
				ToastSystem.Create(screen, ErrorMessages.HWID_BANNED, "error")
				task.wait(1.5)
				Players.LocalPlayer:Kick("Hardware banned")
				return
			end

			ToastSystem.Create(screen, resolveErrorMessage(err), "error")
		end
	end)

	-- Get Key Button Logic
	local getKeyBusy = false
	getKeyBtn.MouseButton1Click:Connect(function()
		if getKeyBusy then return end
		getKeyBusy = true
		getKeyBtn.Text = "Loading..."

		-- get_key_link() returns (link, err), not a single value
		local link, err = Junkie.get_key_link()

		getKeyBtn.Text = "Get Key"
		getKeyBusy = false

		if link then
			setclipboard(link)
			ToastSystem.Create(screen, "Key link copied to clipboard", "success")
		elseif err == "RATE_LIMITED" then
			ToastSystem.Create(screen, "Please wait 5 minutes between requests", "warning")
		else
			ToastSystem.Create(screen, err or "Failed to get key link", "error")
		end
	end)

	-- Discord Button Logic
	discordBtn.MouseButton1Click:Connect(function()
		setclipboard("https://discord.gg/9zt5aSqPNy")
		ToastSystem.Create(screen, "Discord link copied to clipboard!", "success")
	end)

	-- Close Button Logic
	closeBtn.MouseButton1Click:Connect(function()
		SetBlur(false)
		Utils.Tween(main, {
			Position = UDim2.new(0.5, 0, 0.5, 100),
			BackgroundTransparency = 1
		}, 0.3)

		task.delay(0.3, function()
			screen:Destroy()
		end)
	end)

	-- Entrance Animation
	main.Position = UDim2.new(0.5, 0, 0.5, 50)
	main.BackgroundTransparency = 1
	Utils.Tween(main, {
		Position = UDim2.new(0.5, 0, 0.5, 0),
		BackgroundTransparency = 0
	}, 0.5, Enum.EasingStyle.Back)

	-- Dragging
	local dragging, dragStart, startPos

	title.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			main.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	return screen
end

-- Auto-verify saved key
local savedKey = loadVerifiedKey()
local keyToCheck = savedKey

if not keyToCheck then
	keyToCheck = getgenv().SCRIPT_KEY
end

local result = Junkie.check_key(keyToCheck)
if result and result.valid then
	if result.message == "KEYLESS" then
		getgenv().SCRIPT_KEY = "KEYLESS"
	elseif result.message == "KEY_VALID" then
		if not savedKey and keyToCheck then
			saveVerifiedKey(keyToCheck)
		end
		getgenv().SCRIPT_KEY = keyToCheck
	else
		Build()
	end
else
	-- A saved key that's no longer valid (expired/banned/invalidated) would
	-- otherwise auto-fail silently on every future run; clear it so the UI shows.
	if savedKey and result and result.error and result.error ~= "ERROR" and not tostring(result.error):match("^http %d+") then
		clearSavedKey()
	end
	Build()
end

-- Wait for key verification
while not getgenv().SCRIPT_KEY do
	task.wait(0.1)
end

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/908fcb189ae73b0f29d9742cdacfc3997848db61aa40b2aa5b7edb8da28b178d?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end