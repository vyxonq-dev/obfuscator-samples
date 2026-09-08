if not game:IsLoaded() then game.Loaded:Wait() end
if getgenv().performance_stats then return end
getgenv().performance_stats = true

local Workspace, CoreGui, Players, RunService, Stats, UserInputService, TweenService
local g = getgenv()

local function safe_service(name)
    name = tostring(name)

    if setmetatable then
        if not g._service_cache then
            g._service_cache = setmetatable({}, {
                __index = function(self, index)
                    local svc = game:GetService(index)

                    if cloneref and svc then
                        svc = cloneref(svc)
                    end

                    self[index] = svc
                    return svc
                end
            })
        end

        return g._service_cache[name]
    end

    local svc = game:GetService(name)

    if cloneref and svc then
        svc = cloneref(svc)
    end

    return svc
end

Workspace = safe_service("Workspace")
CoreGui = safe_service("CoreGui")
Players = safe_service("Players")
RunService = safe_service("RunService")
Stats = safe_service("Stats")
UserInputService = safe_service("UserInputService")
TweenService = safe_service("TweenService")

local camera = Workspace.CurrentCamera or Workspace:FindFirstChildOfClass("Camera")
local viewport = camera and camera.ViewportSize or Vector2.new(1920,1080)
local platform = UserInputService:GetPlatform()

local function is_studio()
    if RunService:IsStudio() then
        return true
    else
        return false
    end
end

local function detect_mob()
    local lowRes = viewport.X <= 900 or viewport.Y <= 500
    local mobilePlatform = (platform == Enum.Platform.IOS or platform == Enum.Platform.Android)
    local touchOnly = (UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled)
    return (lowRes and not UserInputService.KeyboardEnabled) or mobilePlatform or touchOnly
end

local isMobile = detect_mob()

local executor_string = nil
local function executor_contains(substr)
    if type(executor_string) ~= "string" then
        return false
    end
    return string.find(string.lower(executor_string), string.lower(substr), 1, true) ~= nil
end

local function retrieve_executor()
    local name
    if identifyexecutor then
        name = identifyexecutor()
    end
    return { Name = name or "Unknown Executor" }
end

local function identify_executor()
    local executorinfo = retrieve_executor()
    return tostring(executorinfo.Name)
end

executor_string = identify_executor()

function low_level_executor()
    if executor_contains("solara") then return true end
    if executor_contains("jjsploit") then return true end
    if executor_contains("xeno") then return true end
    return false
end

if not low_level_executor() then
    task.spawn(function()
        if getgenv().InitializedAdonisAdmin_Bypass then return end

        if not getgenv().InitializedAdonisAdmin_Bypass then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua",true))()
            wait(0.1)
            getgenv().InitializedAdonisAdmin_Bypass = true
        end
    end)
end

if getgenv().ForceMobileUI ~= nil then
    isMobile = getgenv().ForceMobileUI
end

local touch_enabled_mobile = UserInputService.TouchEnabled
local LocalPlayer = getgenv().LocalPlayer or Players.LocalPlayer
local PlayerGui = getgenv().PlayerGui or LocalPlayer:FindFirstChildOfClass("PlayerGui") or LocalPlayer:FindFirstChildWhichIsA("PlayerGui") or LocalPlayer:WaitForChild("PlayerGui", 5)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TopBarUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = is_studio() and PlayerGui or CoreGui

local frameWidth = isMobile and 380 or 980
local frameHeight = isMobile and 28 or 40
local framePosX = frameWidth / 2

local UIContainer = Instance.new("Frame")
UIContainer.Name = "UIContainer"
UIContainer.Parent = ScreenGui
UIContainer.Size = UDim2.new(0, 490, 0, 40)
if not touch_enabled_mobile then
    UIContainer.Position = UDim2.new(0.59375, -490, 0, 0)
else
    UIContainer.Position = UDim2.new(0.59375, -420, 0, 0)
end
UIContainer.BackgroundColor3 = Color3.fromRGB(196,40,28)
UIContainer.BackgroundTransparency = 0.15
UIContainer.BorderSizePixel = 0

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, isMobile and 6 or 10)
UICorner.Parent = UIContainer

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(100, 200, 255)
UIStroke.Thickness = isMobile and 0.8 or 1
UIStroke.Parent = UIContainer

local function createButton(name, posX, text)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Parent = ScreenGui
    btn.Size = UDim2.new(0, isMobile and 70 or 100, 0, isMobile and 22 or 30)
    btn.Position = UDim2.new(1, posX, 0, isMobile and 6 or 10)
    btn.BackgroundColor3 = Color3.fromRGB(35, 45, 60)
    btn.BorderSizePixel = 0
    btn.TextColor3 = Color3.fromRGB(60, 180, 255)
    btn.TextScaled = false
    btn.TextSize = isMobile and 12 or 18
    btn.Font = Enum.Font.SourceSansBold
    btn.Text = text

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, isMobile and 8 or 15)
    corner.Parent = btn
    return btn
end

local ToggleButton = createButton("ToggleButton", isMobile and -150 or -240, "Hide UI")
local ThemeButton = createButton("ThemeButton", isMobile and -80 or -130, "Dark Mode")
local function newLabel(name, pos, text, size)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Parent = UIContainer
    label.Size = size
    label.Position = pos
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(180,220,255)
    label.TextScaled = false
    label.TextSize = isMobile and 14 or 22
    label.Font = Enum.Font.SourceSansBold
    label.Text = text
    label.TextXAlignment = Enum.TextXAlignment.Left
    return label
end

local spacing = isMobile and {
    time = 8, ping = 120, fps = 230, exec = 310, pc = 410, players = 550
} or {
    time = 10, ping = 190, fps = 330, exec = 430, pc = 620, players = 815
}

local TimeLabel = newLabel("TimeLabel", UDim2.new(0, 5, 0, 0), "Loading...", UDim2.new(0, 95, 1, 0))
if not TimeLabel.TextScaled then
    TimeLabel.TextScaled = true
end
local PingLabel = newLabel("PingLabel", UDim2.new(0, 105, 0, 0), "Detecting Ping...", UDim2.new(0, 50, 1, 0))
if not PingLabel.TextScaled then
    PingLabel.TextScaled = true
end
local FPSLabel = newLabel("FPSLabel", UDim2.new(0, 160, 0, 0), "Detecting FPS...", UDim2.new(0, 80, 1, 0))
if not FPSLabel.TextScaled then
    FPSLabel.TextScaled = true
end
local ExecutorLabel = newLabel("ExecutorLabel", UDim2.new(0, 215, 0, 0), "Detecting Executor...", UDim2.new(0, 100, 1, 0))
if not ExecutorLabel.TextScaled then
    ExecutorLabel.TextScaled = true
end
local PCStatusLabel = newLabel("PCStatusLabel", UDim2.new(0, 325, 0, 0), "Detecting Device...", UDim2.new(0, 60, 1, 0))
if not PCStatusLabel.TextScaled then
    PCStatusLabel.TextScaled = true
end
local PlayerCountLabel = newLabel("PlayerCountLabel", UDim2.new(0, 410, 0, 0), "Players: Detecting...", UDim2.new(0, 80, 1, 0))
if not PlayerCountLabel.TextScaled then
    PlayerCountLabel.TextScaled = true
end

getgenv().Player_Counting_Value = true
task.spawn(function()
    while getgenv().Player_Counting_Value do
        local count = #Players:GetPlayers()
        local maxPlayers = Players.MaxPlayersInternal or Players.MaxPlayers or "?"
        PlayerCountLabel.Text = ("Players:\n %s/%s"):format(count, maxPlayers)
        task.wait(0.4)
    end
end)

local function get_exec()
    local name, version
    if identifyexecutor then
        name, version = identifyexecutor()
    end
    return { Name = name or "Unknown", Version = version or "?" }
end

task.spawn(function()
    local det = get_exec()
    ExecutorLabel.Text = "Executor:\n "..tostring(det.Name)
end)

local function Device_Detector()
    local platform = UserInputService:GetPlatform()
    local map = {
        [Enum.Platform.Windows] = "Windows",
        [Enum.Platform.OSX] = "MacOS",
        [Enum.Platform.IOS] = "iOS",
        [Enum.Platform.Android] = "Android",
        [Enum.Platform.XBoxOne] = "Xbox One",
        [Enum.Platform.PS4] = "PS4",
        [Enum.Platform.XBox360] = "Xbox 360",
        [Enum.Platform.WiiU] = "Wii-U",
        [Enum.Platform.NX] = "Nintendo Switch",
        [Enum.Platform.Ouya] = "Ouya",
        [Enum.Platform.AndroidTV] = "Android TV",
        [Enum.Platform.Chromecast] = "Chromecast",
        [Enum.Platform.Linux] = "Linux",
        [Enum.Platform.SteamOS] = "SteamOS",
        [Enum.Platform.WebOS] = "WebOS",
        [Enum.Platform.DOS] = "DOS",
        [Enum.Platform.BeOS] = "BeOS",
        [Enum.Platform.UWP] = "UWP",
        [Enum.Platform.PS5] = "PS5",
        [Enum.Platform.MetaOS] = "MetaOS",
        [Enum.Platform.None] = "Unknown"
    }

    return map[platform] or "Unknown"
end

task.spawn(function()
    PCStatusLabel.Text = "Device:\n "..Device_Detector()
end)

local timeZones = {
    ["-1200"]="AoE", ["-1100"]="SST", ["-1000"]="HST", ["-0930"]="MART",
    ["-0900"]="AKST", ["-0800"]="PST", ["-0700"]="MST", ["-0600"]="CST",
    ["-0500"]="EST", ["-0400"]="AST", ["-0330"]="NST", ["-0300"]="BRT",
    ["-0200"]="GST", ["-0100"]="AZOST", ["+0000"]="UTC", ["+0100"]="CET",
    ["+0200"]="EET", ["+0300"]="MSK", ["+0330"]="IRST", ["+0400"]="GST",
    ["+0430"]="AFT", ["+0500"]="PKT", ["+0530"]="IST", ["+0545"]="NPT",
    ["+0600"]="BST", ["+0630"]="MMT", ["+0700"]="ICT", ["+0800"]="CST",
    ["+0845"]="ACWST", ["+0900"]="JST", ["+0930"]="ACST", ["+1000"]="AEST",
    ["+1030"]="LHST", ["+1100"]="SBT", ["+1200"]="NZST", ["+1245"]="CHAST",
    ["+1300"]="PHOT", ["+1400"]="LINT"
}

local function get_eastern_label(offset)
    if offset == "-0500" or offset == "-0400" then
        local month = tonumber(os.date("%m"))
        if month >= 3 and month <= 11 then
            return "EDT"
        else
            return "EST"
        end
    end
end

local isUIVisible = true
local cached_offset = os.date("%z")
local cached_region = get_eastern_label(cached_offset) or timeZones[cached_offset] or "Unknown"
local last_minute = tonumber(os.date("%M"))
local function update_time()
    if getgenv().tickingTime then return end
    getgenv().tickingTime = true

    while getgenv().tickingTime == true do
        if not isUIVisible then
            task.wait(1.5)
        else
            local current = os.time()
            local minute = tonumber(os.date("%M", current))

            if minute ~= last_minute then
                cached_offset = os.date("%z")
                cached_region = get_eastern_label(cached_offset) or timeZones[cached_offset] or "Unknown"
                last_minute = minute
            end

            local formatted = os.date("%I:%M:%S %p", current):gsub("^0","")
            local newtext = "Time:\n "..formatted.." ("..cached_region..")"

            if TimeLabel.Text ~= newtext then
                TimeLabel.Text = newtext
            end

            task.wait(1.2)
        end
    end
end

task.spawn(update_time)

local frameCount, timeElapsed = 0, 0
getgenv().fps_updater_connection = getgenv().fps_updater_connection or nil

local function start_fps()
    if getgenv().fps_updater_connection then return end

    getgenv().fps_updater_connection = RunService.Heartbeat:Connect(function(dt)
        frameCount += 1
        timeElapsed += dt

        if timeElapsed >= 1 then
            local newtext = "FPS:\n "..frameCount
            if FPSLabel.Text ~= newtext then
                FPSLabel.Text = newtext
            end
            frameCount = 0
            timeElapsed = 0
        end
    end)
end

local function stop_fps()
    if getgenv().fps_updater_connection then
        getgenv().fps_updater_connection:Disconnect()
        getgenv().fps_updater_connection = nil
    end
end

start_fps()

local function updatePing()
    if getgenv().preserve_ping_tick then return end
    getgenv().preserve_ping_tick = true

    local last_ping

    while getgenv().preserve_ping_tick == true do
        if not isUIVisible then
            task.wait(1.5)
        else
            local ping = math.floor(Stats.PerformanceStats.Ping:GetValue())
            if ping ~= last_ping then
                PingLabel.Text = "Ping:\n "..ping.." ms"
                last_ping = ping
            end
            task.wait(1.5)
        end
    end
end

task.spawn(updatePing)

ToggleButton.MouseButton1Click:Connect(function()
    isUIVisible = not isUIVisible
    UIContainer.Visible = isUIVisible
    ToggleButton.Text = isUIVisible and "Hide UI" or "Show UI"

    if isUIVisible then
        start_fps()
    else
        stop_fps()
    end
end)

local month = tonumber(os.date("%m"))
local holidayThemes = {
    [1]  = { light=Color3.fromRGB(0,255,255), dark=Color3.fromRGB(0,77,77) },
    [2]  = { light=Color3.fromRGB(255,105,180), dark=Color3.fromRGB(102,0,51) },
    [3]  = { light=Color3.fromRGB(0,255,127), dark=Color3.fromRGB(0,77,0) },
    [4]  = { light=Color3.fromRGB(255,255,153), dark=Color3.fromRGB(102,102,0) },
    [5]  = { light=Color3.fromRGB(255,153,255), dark=Color3.fromRGB(102,0,102) },
    [6]  = { light=Color3.fromRGB(135,206,235), dark=Color3.fromRGB(30,63,102) },
    [7]  = { light=Color3.fromRGB(255,85,85), dark=Color3.fromRGB(0,34,68) },
    [8]  = { light=Color3.fromRGB(255,213,128), dark=Color3.fromRGB(153,76,0) },
    [9]  = { light=Color3.fromRGB(210,180,140), dark=Color3.fromRGB(101,50,0) },
    [10] = { light=Color3.fromRGB(255,140,0), dark=Color3.fromRGB(13,13,13) },
    [11] = { light=Color3.fromRGB(196,40,28), dark=Color3.fromRGB(51,26,0) },
    [12] = { light=Color3.fromRGB(135,206,250), dark=Color3.fromRGB(0,51,102) },
}
local currentTheme = holidayThemes[month] or { light=Color3.fromRGB(60,180,255), dark=Color3.fromRGB(20,25,40) }
local isDarkMode = true

local function updateColors()
    local bgColor = isDarkMode and currentTheme.dark or currentTheme.light
    local textColor = isDarkMode and Color3.fromRGB(200, 230, 255) or Color3.fromRGB(10, 10, 10)
    local buttonBg = isDarkMode and Color3.fromRGB(35, 45, 60) or Color3.fromRGB(230, 230, 230)
    local buttonText = isDarkMode and Color3.fromRGB(60, 180, 255) or Color3.fromRGB(20, 60, 100)

    UIContainer.BackgroundColor3 = bgColor

    for _, obj in ipairs(UIContainer:GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") then
            obj.TextColor3 = textColor
        end
    end

    ToggleButton.BackgroundColor3 = buttonBg
    ThemeButton.BackgroundColor3 = buttonBg
    ToggleButton.TextColor3 = textColor
    ThemeButton.TextColor3 = textColor
end

ThemeButton.MouseButton1Click:Connect(function()
    isDarkMode = not isDarkMode
    updateColors()
    ThemeButton.Text = isDarkMode and "Light Mode" or "Dark Mode"
end)
task.wait(1)
updateColors()
local dragging = false
local drag_input
local drag_start
local start_pos
local drag_conn

UIContainer.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1
	or input.UserInputType == Enum.UserInputType.Touch then

		dragging = true
		drag_input = input
		drag_start = input.Position
		start_pos = UIContainer.Position

		if drag_conn then
			drag_conn:Disconnect()
		end

		drag_conn = UserInputService.InputChanged:Connect(function(inp)
			if dragging and inp == drag_input then
				local cam = Workspace.CurrentCamera
				if cam then
					local delta = inp.Position.X - drag_start.X
					local scale = delta / cam.ViewportSize.X
					UIContainer.Position = UDim2.new(
						start_pos.X.Scale + scale,
						start_pos.X.Offset,
						start_pos.Y.Scale,
						start_pos.Y.Offset
					)
				end
			end
		end)
	end
end)

UIContainer.InputEnded:Connect(function(input)
	if input == drag_input then
		dragging = false
		drag_input = nil

		if drag_conn then
			drag_conn:Disconnect()
			drag_conn = nil
		end
	end
end)
