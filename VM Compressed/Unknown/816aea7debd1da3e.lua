-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠋⠉⠀⠀⠈⠉⠻⠿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠁⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⠀⢠⣾⠏⠀⠀⠀⢀⣀⣄⣀⠀⠀⠀⠀⠘⣿⣿⣿⣿ <Thx for using the script>
-- ⣿⣿⣿⣿⡿⠟⠃⠀⠀⢰⣿⡟⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⢿⣿⣿  <Btw credit to the creator of TrollGui/Skyhub for giving me the idea (divinely didnt yoink it)...
-- ⣿⣿⣿⠏⠀⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢸⣿⣿   loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))() >
-- ⣿⣿⡏⠀⠀⢀⠀⠀⠀⢸⣿⣧⠀⠀⠀⠘⣿⣿⣿⣿⣿⣿⡿⠇⠀⠀⠀⣾⣿⣿    <anyway Love you <3 Mwa>
-- ⣿⣿⠀⠀⠀⣾⠀⠀⠀⢸⣿⣿⣄⠀⠀⠀⠈⠉⠉⠉⠉⠉⠀⠀⠀⠀⣼⣿⣿⣿
-- ⣿⡏⠀⠀⢸⣿⠀⠀⠀⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿
-- ⣿⡇⠀⠀⢸⣿⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣶⣤⣤⣤⣶⡶⠀⠀⣿⣿⣿⣿⣿⣿
-- ⣿⡇⠀⠀⠸⣿⠀⠀⠀⣿⣿⣿⣿⣿⡿⠛⠛⠛⢿⣿⣿⡇⠀⠀⠀⠈⠙⣿⣿⣿
-- ⣿⣿⡄⠀⠀⠉⠀⠀⠀⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠙⢿⣿⣶⣶⣄⠀⠀⢸⣿⣿
-- ⣿⣿⣿⣤⣀⠀⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣷⣆⠀⠀⠸⠿⣿⠟⠁⠀⠀⢸⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠙⠛⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿
-- ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⣀⣴⣶⣤⣴⣶⣶⣾⣿⣿⣿⣿

local player = game:GetService("Players").LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")
local TweenService = game:GetService("TweenService")

-- // Bc of some games that simply make anticheats that delete new Instances of audios in workspace-
-- // the audio will be parented to the TestService, if the script says theres AC6 and the id your trying to play-
local InjectTo = game:GetService("TestService") -- is valid, Parent it to some where else
--[[ oh and btw you can Parent it to a specific part and that part will play audio
   when you get close to it, like a Radio ill emit sounds, yes even your humanoidRootPart]]

local specialChars = "1234567890QWRYUIOPASDFGHJKLZXVBMN+×÷=/_<>,!@#$%^&*?`~\\|{}€£¥₩qwertyuiopasdfghjklzxcvbnm"
local randomName = nil

local function generateRandomName()
    local length = math.random(5, 10)
    local name = ""
    for i = 1, length do
        local index = math.random(1, #specialChars)
        name = name .. specialChars:sub(index, index)
    end
    return name
end

local function findRemoteEvent(name, parent)
    for _, child in ipairs(parent:GetDescendants()) do
        if child:IsA("RemoteEvent") and child.Name == name then
            return child
        end
    end
    return nil
end

local function getRemoteEvent() --// Change if the games have Renamed the AC6 Remotes name
    return findRemoteEvent("AC6_FE_Sounds", replicatedStorage) or findRemoteEvent("AC6_FE_Sounds", workspace)
end

local function playSound(soundId)
    local sound = Instance.new("Sound")
    sound.SoundId = soundId
    sound.Volume = 1
    sound.PlayOnRemove = true
    sound.Parent = gethui() or game:GetService("CoreGui").RobloxGui
    sound:Destroy()
end

local function ExtraDetail(UI)
    Instance.new("UICorner", UI)
    local Stroke = Instance.new("UIStroke", UI)
    Stroke.ApplyStrokeMode = "Border"
end

--// UI library for the notification (not mine) credits to who ever made it :]
local NotificationLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMinisterq/Notification-Library/Main/Library.lua"))()

local remote = getRemoteEvent()

if remote then    
    playSound("rbxassetid://2084290015")
    NotificationLibrary:SendNotification("Success", "SUCCESSFULLY ATTACHED TO AC6  enjoy playing audio Server-Side :3 ", 4)

    local gui = Instance.new("ScreenGui")
    gui.Name = "PUT_THE_PHONE_DOWN!THIS_IS_FOR_MY_SAFETY!"
    gui.Parent = gethui() or game:GetService("CoreGui").RobloxGui

    local mainFrame = Instance.new("Frame", gui)
    mainFrame.Size = UDim2.new(0, 300, 0, 200)
    mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    mainFrame.BorderSizePixel = 2
    mainFrame.Active = true
    Instance.new("UIDragDetector",mainFrame)

    local titleBar = Instance.new("Frame", mainFrame)
    titleBar.Size = UDim2.new(1, 0, 0, 25)
    titleBar.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    titleBar.BorderSizePixel = 1

    local titleLabel = Instance.new("TextLabel", titleBar)
    titleLabel.Size = UDim2.new(1, -50, 1, 0)
    titleLabel.Position = UDim2.new(0, 5, 0, 0)
    titleLabel.Text = "FE AC6 MUSIC EXPLOIT [by https]"
    titleLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    titleLabel.TextSize = 18
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left

    local closeButton = Instance.new("TextButton", titleBar)
    closeButton.Size = UDim2.new(0, 25, 1, 0)
    closeButton.Position = UDim2.new(1, -30, 0, 0)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    closeButton.Font = Enum.Font.SourceSansBold
    closeButton.TextSize = 18
    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    local minimizeButton = Instance.new("TextButton", titleBar)
    minimizeButton.Size = UDim2.new(0, 25, 1, 0)
    minimizeButton.Position = UDim2.new(1, -60, 0, 0)
    minimizeButton.Text = "-"
    minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    minimizeButton.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    minimizeButton.Font = Enum.Font.SourceSansBold
    minimizeButton.TextSize = 18

    local textBox = Instance.new("TextBox", mainFrame)
    textBox.Size = UDim2.new(0.8, 0, 0.2, 0)
    textBox.Position = UDim2.new(0.1, 0, 0.2, 0)
    textBox.PlaceholderText = "[Music ID here]"
    textBox.Text = ""
    textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    textBox.TextSize = 16
    textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textBox.BorderSizePixel = 1
    textBox.Font = Enum.Font.SourceSans
    ExtraDetail(textBox)

    local playButton = Instance.new("TextButton", mainFrame)
    playButton.Size = UDim2.new(0.4, 0, 0.2, 0)
    playButton.Position = UDim2.new(0.3, 0, 0.45, 0)
    playButton.Text = "Play!"
    playButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    playButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
    playButton.Font = Enum.Font.SourceSansBold
    playButton.TextSize = 18
    Instance.new("UICorner", playButton)

    local loopLabel = Instance.new("TextLabel", mainFrame)
    loopLabel.Size = UDim2.new(0.2, 0, 0.05, 0)
    loopLabel.Position = UDim2.new(0.32, 0, 0.94, 0)
    loopLabel.Text = "LoopSong? "
    loopLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    loopLabel.TextSize = 12
    loopLabel.BackgroundTransparency = 1
    loopLabel.Font = Enum.Font.SourceSans
    loopLabel.TextXAlignment = Enum.TextXAlignment.Right

    local loopButton = Instance.new("TextButton", mainFrame)
    loopButton.Size = UDim2.new(0.1, 0, 0.05, 0)
    loopButton.Position = UDim2.new(0.52, 0, 0.94, 0)
    loopButton.Text = "true"
    loopButton.TextColor3 = Color3.fromRGB(0, 255, 0)
    loopButton.BackgroundTransparency = 1
    loopButton.Font = Enum.Font.SourceSansBold
    loopButton.TextSize = 12
    loopButton.TextXAlignment = Enum.TextXAlignment.Left

    local loopEnabled = true

    loopButton.MouseButton1Click:Connect(function()
        loopEnabled = not loopEnabled
        if loopEnabled then
            loopButton.Text = "true"
            loopButton.TextColor3 = Color3.fromRGB(0, 255, 0)
        else
            loopButton.Text = "false"
            loopButton.TextColor3 = Color3.fromRGB(255, 0, 0)
        end
    end)

    local volumeBox = Instance.new("TextBox", mainFrame)
    volumeBox.Size = UDim2.new(0.35, 0, 0.2, 0)
    volumeBox.Position = UDim2.new(0.1, 0, 0.7, 0)
    volumeBox.PlaceholderText = "[Volume]"
    volumeBox.Text = ""
    volumeBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    volumeBox.TextSize = 16
    volumeBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    volumeBox.BorderSizePixel = 1
    volumeBox.Font = Enum.Font.SourceSans
    volumeBox.ClearTextOnFocus = false
    ExtraDetail(volumeBox)

    local pitchBox = Instance.new("TextBox", mainFrame)
    pitchBox.Size = UDim2.new(0.35, 0, 0.2, 0)
    pitchBox.Position = UDim2.new(0.55, 0, 0.7, 0)
    pitchBox.PlaceholderText = "[Pitch]"
    pitchBox.Text = ""
    pitchBox.TextColor3 = Color3.fromRGB(0, 0, 0)
    pitchBox.TextSize = 16
    pitchBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    pitchBox.BorderSizePixel = 1
    pitchBox.Font = Enum.Font.SourceSans
    pitchBox.ClearTextOnFocus = false
    ExtraDetail(pitchBox)

    local isMinimized = false
    local lastPosition = UDim2.new(0.5, -150, 0.5, -100)

    local function toggleVisibility(visible)
        textBox.Visible = visible
        playButton.Visible = visible
        volumeBox.Visible = visible
        pitchBox.Visible = visible
        loopLabel.Visible = visible
        loopButton.Visible = visible
    end

    minimizeButton.MouseButton1Click:Connect(function()
        if isMinimized then
            lastPosition = mainFrame.Position
            toggleVisibility(true)
            local expandTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 300, 0, 200),
                Position = lastPosition
            })
            expandTween:Play()
        else
            lastPosition = mainFrame.Position
            toggleVisibility(false)
            local minimizeTween = TweenService:Create(mainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 300, 0, 25),
                Position = UDim2.new(lastPosition.X.Scale, lastPosition.X.Offset, lastPosition.Y.Scale, lastPosition.Y.Offset)
            })
            minimizeTween:Play()
        end
        isMinimized = not isMinimized
        playSound("rbxassetid://243152215")
        playSound("rbxassetid://145487017")
    end)

    playButton.MouseButton1Click:Connect(function()
        if not randomName then
            randomName = generateRandomName()
        end

        local musicId = textBox.Text
        local volume = tonumber(volumeBox.Text) or 1
        local pitch = tonumber(pitchBox.Text) or 1
        local assetId = "rbxassetid://" .. musicId

        local success, err = pcall(function()
            local currentRemote = getRemoteEvent()
            if currentRemote then
            --// RemoteEvent that is bieng fired
                local args = {
                    [1] = "newSound",
                    [2] = randomName,
                    [3] = InjectTo,
                    [4] = assetId,
                    [5] = pitch,
                    [6] = volume,
                    [7] = loopEnabled
                }
                currentRemote:FireServer(unpack(args))
                currentRemote:FireServer("playSound", randomName)
            else
                warn("erm... Erorr? tf did the RemoteEvent went?")
            end
        end)

        if not success then
            playSound("rbxassetid://9066167010")
            NotificationLibrary:SendNotification("Error", "😢 Lost Connection to AC6 (Disconnect, may happen if the vehicle de-spawned", 5)
        else
            playSound("rbxassetid://156785206")
        end
    end)
else
    playSound("rbxassetid://9066167010")
    NotificationLibrary:SendNotification("Error", "💔Couldn't Find AC6... (Are you Sure your in a game that uses AC6?)", 5)
end

--[[

       - - Update v1.3.2- -
- changed ui a lil bit (again)
- changed to script to stay more undetected (tuff)
]]--
