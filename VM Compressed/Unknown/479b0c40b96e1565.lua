--[[
 █████   █████          ████                       ███             █████   █████            █████
▒▒███   ▒▒███          ▒▒███                      ▒▒▒             ▒▒███   ▒▒███            ▒▒███
 ▒███    ▒███   ██████  ▒███   ██████   ████████  ████   █████     ▒███    ▒███  █████ ████ ▒███████
 ▒███    ▒███  ███▒▒███ ▒███  ▒▒▒▒▒███ ▒▒███▒▒███▒▒███  ███▒▒      ▒███████████ ▒▒███ ▒███  ▒███▒▒███
 ▒███   ███  ▒███ ▒███ ▒███   ███████  ▒███ ▒▒▒  ▒███ ▒▒█████     ▒███▒▒▒▒▒███  ▒███ ▒███  ▒███ ▒███
 ▒▒▒█████▒   ▒███ ▒███ ▒███  ███▒▒███  ▒███      ▒███  ▒▒▒▒███    ▒███    ▒███  ▒███ ▒███  ▒███ ▒███
    ▒▒███     ▒▒██████  █████▒▒████████ █████     █████ ██████     █████   █████ ▒▒████████ ████████
     ▒▒▒       ▒▒▒▒▒▒  ▒▒▒▒▒  ▒▒▒▒▒▒▒▒ ▒▒▒▒▒     ▒▒▒▒▒ ▒▒▒▒▒▒     ▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒▒▒▒ ▒▒▒▒▒▒▒▒

Made by 			░▒▓████████▓▒░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░
                      ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░
                      ░▒▓█▓▒░      ░▒▓█▓▒░   ░▒▓█▓▒░░▒▓█▓▒░
                      ░▒▓██████▓▒░ ░▒▓█▓▒░    ░▒▓██████▓▒░
                      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░
                      ░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░
                      ░▒▓█▓▒░      ░▒▓████████▓▒░▒▓█▓▒░

Credits to Nebula Softworks © for the UI Library.

loadstring(game:HttpGet("https://raw.githubusercontent.com/flyrbo/Volaris/refs/heads/main/Loader.luau"))()

                      !!WARNING!!
This script is created for educational and testing purposes only.
I do not encourage or promote exploiting in any Roblox game.

By using this script, you acknowledge that:
- You are responsible for your own actions.
- Using exploits may violate Roblox's Terms of Service.
- Your account may be permanently banned or restricted.

I am not responsible for any consequences resulting from its use.

If you do not agree with these terms, do not use this script.
--]]

--// Services
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

--// Configuration

--//// URLs
local GITHUB_RAW = "https://raw.githubusercontent.com/flyrbo/Volaris/refs/heads/main/games/"
local SCRIPT_EXTENSIONS = { ".lua", ".luau", ".txt" }

local LIBRARY_URLS = {
    Starlight = "https://raw.nebulasoftworks.xyz/starlight",
    NebulaIcons = "https://raw.nebulasoftworks.xyz/nebula-icon-library-loader",
}

--//// Executor Functions
local REQUIRED_FUNCTIONS = {
    { name = "loadstring", value = loadstring },
    { name = "HttpGet", value = game.HttpGet },
    { name = "getgenv", value = getgenv }
}

--// Generic helpers

--//// Instance Creator
local function create(className, properties, parent)
    local instance = Instance.new(className)

    for property, value in properties do
        instance[property] = value
    end

    instance.Parent = parent
    return instance
end

--//// HttpGet Function (for libraries)
local function executeUrl(url)
    return loadstring(game:HttpGet(url))()
end

--//// HTTP fetch
local function fetchUrl(url)
    local requestFn = request or http_request or (syn and syn.request)

    if typeof(requestFn) == "function" then
        local ok, response = pcall(requestFn, {
            Url = url,
            Method = "GET",
        })

        if ok and typeof(response) == "table" then
            local body = response.Body or response.body or ""
            local code = response.StatusCode or response.status_code or response.Status
            return true, body, code
        end

        return false, tostring(response), nil
    end

    local ok, body = pcall(function()
        return game:HttpGet(url)
    end)

    if not ok then
        return false, tostring(body), nil
    end

    return true, body, nil
end

--//// Hidden GUI Mount
local function mountHiddenGui(screenGui)
    local ok, parent = pcall(gethui)

    if ok and typeof(parent) == "Instance" then
        screenGui.Parent = parent
    else
        screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
    end
end

--// Fallback notification UI
local NOTIFICATION_DURATION = 10
local NOTIFICATION_TWEEN = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local NOTIFICATION_POSITION = UDim2.fromScale(0.759, 0.828)
local NOTIFICATION_HIDDEN_POSITION = NOTIFICATION_POSITION + UDim2.fromOffset(0, 50)
local NOTIFICATION_FRAME_TRANSPARENCY = 0.05

local FADABLE_PROPERTIES = {
    Frame = "BackgroundTransparency",
    TextLabel = "TextTransparency",
    UIStroke = "Transparency",
}

local function tweenNotification(frame, frameTransparency, childTransparency)
    TweenService:Create(frame, NOTIFICATION_TWEEN, {
        BackgroundTransparency = frameTransparency,
    }):Play()

    for _, child in frame:GetDescendants() do
        local property = FADABLE_PROPERTIES[child.ClassName]

        if property then
            TweenService:Create(child, NOTIFICATION_TWEEN, {
                [property] = childTransparency,
            }):Play()
        end
    end
end

local function showNotification(title, message, duration)
    duration = duration or NOTIFICATION_DURATION

    task.spawn(function()
        local screenGui = create("ScreenGui", {
            Name = "VolarisNotification",
            ResetOnSpawn = false,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        })

        mountHiddenGui(screenGui)

        local frame = create("Frame", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = NOTIFICATION_HIDDEN_POSITION,
            Size = UDim2.fromScale(0.218, 0.125),
            ZIndex = 90,
        }, screenGui)

        create("UICorner", {
            CornerRadius = UDim.new(0, 10),
        }, frame)

        create("UIGradient", {
            Color = ColorSequence.new(Color3.fromRGB(9, 9, 9), Color3.fromRGB(3, 3, 3)),
            Rotation = 40,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.32, 0.17),
                NumberSequenceKeypoint.new(1, 0),
            }),
        }, frame)

        create("UIStroke", {
            Color = Color3.fromRGB(179, 58, 58),
            Transparency = 1,
        }, frame)

        local titleLabel = create("TextLabel", {
            BackgroundTransparency = 1,
            Font = Enum.Font.SourceSansBold,
            Position = UDim2.fromScale(0.107, 0),
            Size = UDim2.fromScale(0.786, 0.41),
            Text = title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            TextTransparency = 1,
        }, frame)
        
        create("UITextSizeConstraint", {
            MaxTextSize = 20,
            MinTextSize = 14,
        }, titleLabel)

        create("Frame", {
            BackgroundColor3 = Color3.fromRGB(45, 45, 45),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.052, 0.39),
            Size = UDim2.fromScale(0.893, 0.02),
        }, frame)

        local bodyLabel = create("TextLabel", {
            BackgroundTransparency = 1,
            Font = Enum.Font.SourceSans,
            Position = UDim2.fromScale(0.034, 0.475),
            Size = UDim2.fromScale(0.928, 0.46),
            Text = message,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextScaled = true,
            TextTransparency = 1,
        }, frame)
        
        create("UITextSizeConstraint", {
            MaxTextSize = 16,
            MinTextSize = 12,
        }, bodyLabel)

        TweenService:Create(frame, NOTIFICATION_TWEEN, {
            Position = NOTIFICATION_POSITION,
        }):Play()
        tweenNotification(frame, NOTIFICATION_FRAME_TRANSPARENCY, 0)

        task.wait(duration)

        TweenService:Create(frame, NOTIFICATION_TWEEN, {
            Position = NOTIFICATION_HIDDEN_POSITION,
        }):Play()
        tweenNotification(frame, 1, 1)

        task.wait(NOTIFICATION_TWEEN.Time)
        screenGui:Destroy()
    end)
end

--// Executor compatibility
local function getMissingFunctions()
    local missing = {}

    for _, requirement in REQUIRED_FUNCTIONS do
        if typeof(requirement.value) ~= "function" then
            table.insert(missing, requirement.name)
        end
    end

    return missing
end

--// Entry point
if not game:IsLoaded() then
    game.Loaded:Wait()
end

local missingFunctions = getMissingFunctions()

if #missingFunctions > 0 then
    warn(("[Volaris] Executor is missing %d required function(s):"):format(#missingFunctions))

    for _, name in missingFunctions do
        warn(("[Volaris]   - %s"):format(name))
    end

    showNotification(
        "Unsupported Executor!",
        ("Missing functions: %s. Report executor name on the GitHub page."):format(table.concat(missingFunctions, ", "))
    )
    return
end

--//// Library Init
local okStarlight, Starlight = pcall(executeUrl, LIBRARY_URLS.Starlight)

if not okStarlight or typeof(Starlight) ~= "table" then
    warn("[Volaris] Failed to load the Starlight UI library:", Starlight)
    showNotification(
        "Loader Error!",
        "Volaris failed to load its UI library. Check your internet connection and try again."
    )
    return
end

local okIcons, iconLibrary = pcall(executeUrl, LIBRARY_URLS.NebulaIcons)
local NebulaIcons = (okIcons and typeof(iconLibrary) == "table") and iconLibrary or nil

if not NebulaIcons then
    warn("[Volaris] Failed to load the Nebula icon library:", iconLibrary)
end

--//// Handshake with Script
getgenv().Volaris = getgenv().Volaris or {}
getgenv().Volaris.funcCheck = true

--//// Script Init
local function scriptError(detail)
    warn(("[Volaris] Game script issue: %s"):format(detail))
    Starlight:Notification({
        Title = "SCRIPT ERROR!",
        Content = "Script unavailable. See F9 console.",
    }, "SCRIPT_ERROR")
end

--////// Helper for 404
local function is404(statusCode, body)
    if statusCode == 404 then
        return true
    end
    if statusCode == nil and typeof(body) == "string" and body:sub(1, 14) == "404: Not Found" then
        return true
    end
    return false
end

local ok, body, statusCode

for _, ext in SCRIPT_EXTENSIONS do
    local url = GITHUB_RAW .. game.GameId .. "/script" .. ext
    ok, body, statusCode = fetchUrl(url)

    if not is404(statusCode, body) then
        break
    end
end

if is404(statusCode, body) then
    local notification = {
        Title = "UNSUPPORTED GAME!",
        Content = "No script found for this game.",
    }

    if NebulaIcons then
        notification.Icon = NebulaIcons:GetIcon("shield-x", "Lucide")
    end

    Starlight:Notification(notification, "INVALID_GAMEID")
elseif not ok or (statusCode ~= nil and statusCode ~= 200) then
    scriptError(("fetch failed (status %s)"):format(tostring(statusCode)))
else
    local fn, compileError = loadstring(body)

    if not fn then
        scriptError(("compile error: %s"):format(compileError))
    else
        local runOk, runError = pcall(fn)

        if not runOk then
            scriptError(("runtime error: %s"):format(runError))
        end
    end
end
