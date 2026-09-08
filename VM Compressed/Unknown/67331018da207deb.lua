-- hello fellers
if not game:IsLoaded() then return end
local cheatEngineMode = false
if (not getgenv) or (getgenv and type(getgenv) ~= "function") then cheatEngineMode = true end
if getgenv and not getgenv().shared then cheatEngineMode = true; getgenv().shared = {}; end
if getgenv and not getgenv().debug then cheatEngineMode = true; getgenv().debug = {traceback = function(string) return string end} end
if getgenv and not getgenv().require then cheatEngineMode = true; end
if getgenv and getgenv().require and type(getgenv().require) ~= "function" then cheatEngineMode = true end
local debugChecks = {
    Type = "table",
    Functions = {
        "getupvalue",
        "getupvalues",
        "getconstants",
        "getproto"
    }
}

local function Checkexecutor()
    if identifyexecutor ~= nil and type(identifyexecutor) == "function" then
        local suc, res = pcall(function()
            return identifyexecutor()
        end)   
        local blacklist = {'solara', 'cryptic', 'xeno', 'ember', 'ronix'}
        local core_blacklist = {'solara', 'xeno'}
        if suc then
            for i,v in pairs(blacklist) do
                if string.find(string.lower(tostring(res)), v) then cheatEngineMode = true end
            end
            for i,v in pairs(core_blacklist) do
                if string.find(string.lower(tostring(res)), v) then
                    pcall(function()
                        getgenv().queue_on_teleport = function() warn('queue_on_teleport disabled!') end
                    end)
                end
            end
            if string.find(string.lower(tostring(res)), "delta") then
                getgenv().isnetworkowner = function()
                    return true
                end
            end
        end
    end
end
task.spawn(function() pcall(Checkexecutor) end)

local function Checkdebug()
    if cheatEngineMode then return end
    if not getgenv().debug then 
        cheatEngineMode = true 
    else 
        if type(debug) ~= debugChecks.Type then 
            cheatEngineMode = true
        else 
            for i, v in pairs(debugChecks.Functions) do
                if not debug[v] or (debug[v] and type(debug[v]) ~= "function") then 
                    cheatEngineMode = true 
                else
                    local suc, res = pcall(debug[v]) 
                    if tostring(res) == "Not Implemented" then 
                        cheatEngineMode = true 
                    end
                end
            end
        end
    end
end

if (not cheatEngineMode) then Checkdebug() end
shared.cheatEngineMode = shared.cheatEngineMode or cheatEngineMode

local function Createnotsupportedgui()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WattyHubNotSupported"
    screenGui.Parent = game:GetService("CoreGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 200)
    frame.Position = UDim2.new(0.5, -200, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame
    
    local shadow = Instance.new("Frame")
    shadow.Size = UDim2.new(1, 6, 1, 6)
    shadow.Position = UDim2.new(0, -3, 0, -3)
    shadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    shadow.BackgroundTransparency = 0.7
    shadow.BorderSizePixel = 0
    shadow.ZIndex = frame.ZIndex - 1
    shadow.Parent = frame
    
    local shadowCorner = Instance.new("UICorner")
    shadowCorner.CornerRadius = UDim.new(0, 15)
    shadowCorner.Parent = shadow
    
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 30, 0, 30)
    closeButton.Position = UDim2.new(1, -35, 0, 5)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
    closeButton.BorderSizePixel = 0
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Fixed: Was Color3.white
    closeButton.TextScaled = true
    closeButton.Font = Enum.Font.GothamBold
    closeButton.Parent = frame
    
    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 6)
    closeCorner.Parent = closeButton
    
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -50, 0, 40)
    title.Position = UDim2.new(0, 10, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "Executor Not Supported"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextScaled = true
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = frame
    
    local message = Instance.new("TextLabel")
    message.Size = UDim2.new(1, -20, 0, 80)
    message.Position = UDim2.new(0, 10, 0, 60)
    message.BackgroundTransparency = 1
    message.Text = "Your executor does not support some functions needed, please use a executor like Velocity or join the discord server for help."
    message.TextColor3 = Color3.fromRGB(200, 200, 200)
    message.TextScaled = true
    message.Font = Enum.Font.Gotham
    message.TextWrapped = true
    message.Parent = frame
    
    local copyButton = Instance.new("TextButton")
    copyButton.Size = UDim2.new(0, 150, 0, 35)
    copyButton.Position = UDim2.new(0.5, -75, 1, -50)
    copyButton.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
    copyButton.BorderSizePixel = 0
    copyButton.Text = "Copy Link"
    copyButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Fixed: Was Color3.white
    copyButton.TextScaled = true
    copyButton.Font = Enum.Font.GothamBold
    copyButton.Parent = frame
    
    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = copyButton
    
    frame:TweenPosition(UDim2.new(0.5, -200, 0.5, -100), "Out", "Back", 0.5, true)
    
    closeButton.MouseButton1Click:Connect(function()
        frame:TweenPosition(UDim2.new(0.5, -200, -0.5, -100), "In", "Back", 0.3, true)
        task.wait(0.3)
        screenGui:Destroy()
    end)
    
    copyButton.MouseButton1Click:Connect(function()
        if setclipboard then
            setclipboard("https://discord.gg/gd8Vfa5kh5")
            copyButton.Text = "Copied!"
            task.wait(2)
            copyButton.Text = "Copy Link"
        end
    end)
end

if cheatEngineMode then
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "WattyHub Loader",
            Text = "Your executor does not support specific functions required",
            Duration = 5
        })
    end)
    Createnotsupportedgui()
    return
end

local currentPlaceId = game.PlaceId
local gameConfigurations = {
    [126509999114328] = "https://raw.githubusercontent.com/bleh2rich/99NightsInTheForest/refs/heads/main/Loader.lua", -- 99 nights
    [79546208627805] = "https://raw.githubusercontent.com/bleh2rich/99NightsInTheForest/refs/heads/main/Loader.lua", -- 99 nights
    [1962086868] = "https://api.luarmor.net/files/v3/loaders/a54008b9af4374de01404ad5de499ca8.lua", -- Tower Of Hell
    [3582763398] = "https://api.luarmor.net/files/v3/loaders/a54008b9af4374de01404ad5de499ca8.lua", -- Tower Of Hell
    [94971861814985] = "https://api.luarmor.net/files/v3/loaders/a54008b9af4374de01404ad5de499ca8.lua", -- Tower Of Hell
    [18687417158] = "https://api.luarmor.net/files/v3/loaders/36b499658b15d7a1bbc09cc052280409.lua", -- Forsaken
    [310798636] = "https://raw.githubusercontent.com/bleh2rich/ATN/refs/heads/main/ATNWattyHub.lua" -- A Typical Neighborhood
}

local scriptUrl = gameConfigurations[currentPlaceId]
if scriptUrl then
    pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
else
    print("WattyHub Loader: This game is not supported.")
end
