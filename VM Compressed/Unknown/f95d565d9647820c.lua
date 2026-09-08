-- 音声ID
local SOUND_ID = 107089652181213
-- ローダーURL
local LOADER_URL = "https://raw.githubusercontent.com/SaturnGroup02/Sakura-Hub-main/refs/heads/main/SakuraHUB-loader"
-- 利用規約URL
local TERMS_URL = "https://raw.githubusercontent.com/SaturnGroup02/SakuraHUB--/refs/heads/main/rterms%20of%20service"

-- 音声再生関数
local function playSound()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. SOUND_ID
    sound.Volume = 1
    sound.Parent = game.Workspace
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
    end)
end

-- GUI作成関数
local function createGUI()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 400, 0, 250)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
    mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.ClipsDescendants = true
    mainFrame.Parent = screenGui

    -- 角丸
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = mainFrame

    -- タイトル
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Position = UDim2.new(0, 0, 0, 10)
    title.BackgroundTransparency = 1
    title.Text = "Sakura HUB ローダー"
    title.TextColor3 = Color3.fromRGB(255, 200, 200)
    title.TextSize = 24
    title.Font = Enum.Font.GothamBold
    title.Parent = mainFrame

    -- 利用規約ボタン（クリックでコピー）
    local termsLabel = Instance.new("TextButton")
    termsLabel.Size = UDim2.new(0.9, 0, 0, 30)
    termsLabel.Position = UDim2.new(0.05, 0, 0, 60)
    termsLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    termsLabel.TextColor3 = Color3.fromRGB(150, 200, 255)
    termsLabel.TextSize = 14
    termsLabel.Font = Enum.Font.Gotham
    termsLabel.Text = "利用規約（クリックでコピー）"
    termsLabel.Parent = mainFrame

    local termsCorner = Instance.new("UICorner")
    termsCorner.CornerRadius = UDim.new(0, 5)
    termsCorner.Parent = termsLabel

    -- ★ 修正箇所：setclipboard を使用（pcallで保護）
    termsLabel.MouseButton1Click:Connect(function()
        local success, err = pcall(function()
            setclipboard(TERMS_URL)
        end)
        if success then
            termsLabel.Text = "コピーしました！"
        else
            termsLabel.Text = "コピー失敗（setclipboard非対応）"
        end
        task.wait(1.5)
        termsLabel.Text = "利用規約（クリックでコピー）"
    end)

    -- 案内テキスト
    local infoText = Instance.new("TextLabel")
    infoText.Size = UDim2.new(0.9, 0, 0, 30)
    infoText.Position = UDim2.new(0.05, 0, 0, 100)
    infoText.BackgroundTransparency = 1
    infoText.Text = "ローダーを起動するには規約に同意してください"
    infoText.TextColor3 = Color3.fromRGB(200, 200, 200)
    infoText.TextSize = 13
    infoText.Font = Enum.Font.Gotham
    infoText.TextWrapped = true
    infoText.Parent = mainFrame

    -- ボタンフレーム
    local buttonFrame = Instance.new("Frame")
    buttonFrame.Size = UDim2.new(0.9, 0, 0, 40)
    buttonFrame.Position = UDim2.new(0.05, 0, 0, 150)
    buttonFrame.BackgroundTransparency = 1
    buttonFrame.Parent = mainFrame

    -- 同意ボタン
    local agreeBtn = Instance.new("TextButton")
    agreeBtn.Size = UDim2.new(0.45, -5, 1, 0)
    agreeBtn.Position = UDim2.new(0, 0, 0, 0)
    agreeBtn.BackgroundColor3 = Color3.fromRGB(60, 200, 100)
    agreeBtn.Text = "同意"
    agreeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    agreeBtn.TextSize = 18
    agreeBtn.Font = Enum.Font.GothamBold
    agreeBtn.Parent = buttonFrame

    local agreeCorner = Instance.new("UICorner")
    agreeCorner.CornerRadius = UDim.new(0, 8)
    agreeCorner.Parent = agreeBtn

    -- 拒否ボタン
    local denyBtn = Instance.new("TextButton")
    denyBtn.Size = UDim2.new(0.45, -5, 1, 0)
    denyBtn.Position = UDim2.new(0.55, 0, 0, 0)
    denyBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    denyBtn.Text = "拒否"
    denyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    denyBtn.TextSize = 18
    denyBtn.Font = Enum.Font.GothamBold
    denyBtn.Parent = buttonFrame

    local denyCorner = Instance.new("UICorner")
    denyCorner.CornerRadius = UDim.new(0, 8)
    denyCorner.Parent = denyBtn

    -- 同意処理
    agreeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        loadstring(game:HttpGet(LOADER_URL))()
    end)

    -- 拒否処理
    denyBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        -- 何もせず終了
    end)
end

-- メイン処理
playSound()
task.wait(0.5)
createGUI()
