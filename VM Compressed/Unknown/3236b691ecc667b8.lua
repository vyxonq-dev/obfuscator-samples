-- 言語選択GUI（LocalScript推奨）
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "LanguageSelector"
gui.Parent = player:WaitForChild("PlayerGui")
gui.Enabled = true
gui.IgnoreGuiInset = true
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999999

-- メインフレーム
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 200)
frame.Position = UDim2.new(0.5, -125, 0.5, -100)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BackgroundTransparency = 0.1
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.ZIndex = 10
frame.Parent = gui

-- タイトル "Script-Box_ed"
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
title.Text = "Script-Box_ed"
title.TextColor3 = Color3.new(1, 0.5, 0)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.ZIndex = 11
title.Parent = frame

-- 日本語ボタン
local btnJapanese = Instance.new("TextButton")
btnJapanese.Size = UDim2.new(0.9, 0, 0, 30)
btnJapanese.Position = UDim2.new(0.5, -112.5, 0, 50)
btnJapanese.BackgroundColor3 = Color3.new(0.3, 0.6, 0.9)
btnJapanese.Text = "日本語"
btnJapanese.TextColor3 = Color3.new(1, 1, 1)
btnJapanese.Font = Enum.Font.SourceSans
btnJapanese.TextSize = 18
btnJapanese.ZIndex = 11
btnJapanese.Parent = frame

-- 英語ボタン
local btnEnglish = Instance.new("TextButton")
btnEnglish.Size = UDim2.new(0.9, 0, 0, 30)
btnEnglish.Position = UDim2.new(0.5, -112.5, 0, 85)
btnEnglish.BackgroundColor3 = Color3.new(0.3, 0.8, 0.3)
btnEnglish.Text = "English"
btnEnglish.TextColor3 = Color3.new(1, 1, 1)
btnEnglish.Font = Enum.Font.SourceSans
btnEnglish.TextSize = 18
btnEnglish.ZIndex = 11
btnEnglish.Parent = frame

-- ベトナム語ボタン
local btnVietnamese = Instance.new("TextButton")
btnVietnamese.Size = UDim2.new(0.9, 0, 0, 30)
btnVietnamese.Position = UDim2.new(0.5, -112.5, 0, 120)
btnVietnamese.BackgroundColor3 = Color3.new(0.9, 0.6, 0.2)
btnVietnamese.Text = "Tiếng Việt"
btnVietnamese.TextColor3 = Color3.new(1, 1, 1)
btnVietnamese.Font = Enum.Font.SourceSans
btnVietnamese.TextSize = 18
btnVietnamese.ZIndex = 11
btnVietnamese.Parent = frame

-- 閉じるボタン（右上）
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 25, 0, 25)
closeButton.Position = UDim2.new(1, -30, 0, 5)
closeButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextSize = 18
closeButton.ZIndex = 12
closeButton.Parent = frame

closeButton.MouseButton1Click:Connect(function()
    gui.Enabled = false
end)

-- デバイス判定（スマホかどうか）
local function isMobile()
    local userInputService = game:GetService("UserInputService")
    return userInputService.TouchEnabled and not userInputService.KeyboardEnabled
end

-- 広告ボックス（独立したGUI）
local adGui = Instance.new("ScreenGui")
adGui.Name = "AdBox"
adGui.Parent = player:WaitForChild("PlayerGui")
adGui.Enabled = true
adGui.IgnoreGuiInset = true
adGui.ResetOnSpawn = false
adGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
adGui.DisplayOrder = 999998

-- スマホかどうかでサイズを変更
local adWidth = isMobile() and 180 or 250
local adHeight = isMobile() and 280 or 350
local adFrameSize = UDim2.new(0, adWidth, 0, adHeight)

-- 広告フレーム
local adFrame = Instance.new("Frame")
adFrame.Size = adFrameSize
adFrame.Position = UDim2.new(0, 10, 0.5, -adHeight/2)
adFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
adFrame.BackgroundTransparency = 0.2
adFrame.BorderSizePixel = 0
adFrame.Active = true
adFrame.Draggable = true
adFrame.ZIndex = 8
adFrame.Parent = adGui

-- 広告タイトル
local adTitle = Instance.new("TextLabel")
adTitle.Size = UDim2.new(1, 0, 0, 30)
adTitle.Position = UDim2.new(0, 0, 0, 0)
adTitle.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
adTitle.Text = "Advertisement"
adTitle.TextColor3 = Color3.new(1, 1, 0)
adTitle.Font = Enum.Font.SourceSansBold
adTitle.TextSize = 18
adTitle.ZIndex = 9
adTitle.Parent = adFrame

-- 画像表示用のImageLabel
local adImage = Instance.new("ImageLabel")
adImage.Size = UDim2.new(1, -20, 0, 180)
adImage.Position = UDim2.new(0, 10, 0, 35)
adImage.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
adImage.BackgroundTransparency = 0
adImage.BorderSizePixel = 0
adImage.ScaleType = Enum.ScaleType.Fit
adImage.ZIndex = 9
adImage.Parent = adFrame

-- 広告削除テキスト
local removeAdsText = Instance.new("TextLabel")
removeAdsText.Size = UDim2.new(1, 0, 0, 25)
removeAdsText.Position = UDim2.new(0, 0, 0, 220)
removeAdsText.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
removeAdsText.BackgroundTransparency = 0.5
removeAdsText.Text = "Want to remove ads?"
removeAdsText.TextColor3 = Color3.new(1, 1, 1)
removeAdsText.Font = Enum.Font.SourceSans
removeAdsText.TextSize = 16
removeAdsText.ZIndex = 9
removeAdsText.Parent = adFrame

-- 広告削除ボタン
local removeAdsButton = Instance.new("TextButton")
removeAdsButton.Size = UDim2.new(0.8, 0, 0, 30)
removeAdsButton.Position = UDim2.new(0.5, -100, 0, 250)
removeAdsButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
removeAdsButton.Text = "Remove Ads"
removeAdsButton.TextColor3 = Color3.new(1, 1, 1)
removeAdsButton.Font = Enum.Font.SourceSansBold
removeAdsButton.TextSize = 18
removeAdsButton.ZIndex = 10
removeAdsButton.Parent = adFrame

-- パスワード入力欄のラベル
local passwordLabel = Instance.new("TextLabel")
passwordLabel.Size = UDim2.new(1, 0, 0, 20)
passwordLabel.Position = UDim2.new(0, 0, 0, 285)
passwordLabel.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
passwordLabel.BackgroundTransparency = 0.5
passwordLabel.Text = "Enter Password:"
passwordLabel.TextColor3 = Color3.new(1, 1, 1)
passwordLabel.Font = Enum.Font.SourceSans
passwordLabel.TextSize = 14
passwordLabel.ZIndex = 9
passwordLabel.Parent = adFrame

-- パスワード入力欄
local passwordBox = Instance.new("TextBox")
passwordBox.Size = UDim2.new(0.8, 0, 0, 25)
passwordBox.Position = UDim2.new(0.5, -100, 0, 310)
passwordBox.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
passwordBox.BackgroundTransparency = 0
passwordBox.BorderSizePixel = 0
passwordBox.Text = ""
passwordBox.PlaceholderText = "Enter password"
passwordBox.TextColor3 = Color3.new(1, 1, 1)
passwordBox.Font = Enum.Font.SourceSans
passwordBox.TextSize = 14
passwordBox.ClearTextOnFocus = false
passwordBox.ZIndex = 10
passwordBox.Parent = adFrame

-- 確定ボタン
local submitButton = Instance.new("TextButton")
submitButton.Size = UDim2.new(0.8, 0, 0, 25)
submitButton.Position = UDim2.new(0.5, -100, 0, 340)
submitButton.BackgroundColor3 = Color3.new(0.2, 0.6, 0.2)
submitButton.Text = "Submit"
submitButton.TextColor3 = Color3.new(1, 1, 1)
submitButton.Font = Enum.Font.SourceSansBold
submitButton.TextSize = 16
submitButton.ZIndex = 10
submitButton.Parent = adFrame

-- 正しいパスワード
local correctPassword = "1-04576-1345671436541-569143-7956-19365-"

-- 全ての広告ID（既存＋新規）
local textureIds = {
    -- 既存のID
    "17263066339",
    "85598685507857",
    "8169329129",
    "8169309330",
    "12569611941",
    "15431618654",
    "14737620285",
    "12016456800",
    "76962306936597",
    
    -- 新規追加のID
    "12023688949",
    "16619119145",
    "18170776105",
    "18184514023",
    "18181651340",
    "72597416805029",
    "126714645912602",
    "71845218088628",
    "71867944222116",
    "111434074503050",
    "81302205650715",
    "113500646534488",
    "15916613625",
    "92358374022907",
    "109893517727132",
    "133317753134800",
    "107416668396975"
}

print("Total ads loaded: " .. #textureIds)

-- 画面外チェックとリセット関数（全方向対応）
local lastCheckTime = 0
local function checkAndResetPosition()
    if not adFrame then return end
    
    -- AbsolutePositionが取得できない場合のエラーハンドリング
    local success, absPos = pcall(function()
        return adFrame.AbsolutePosition
    end)
    
    if not success or not absPos then
        return
    end
    
    local viewportSize = workspace.CurrentCamera.ViewportSize
    local frameSize = adFrame.AbsoluteSize
    
    local outOfBounds = false
    
    -- 左にはみ出し
    if absPos.X < -50 then
        outOfBounds = true
    end
    
    -- 上にはみ出し
    if absPos.Y < -50 then
        outOfBounds = true
    end
    
    -- 右にはみ出し
    if absPos.X + frameSize.X > viewportSize.X + 50 then
        outOfBounds = true
    end
    
    -- 下にはみ出し
    if absPos.Y + frameSize.Y > viewportSize.Y + 50 then
        outOfBounds = true
    end
    
    -- 画面外なら位置をリセット
    if outOfBounds then
        -- 位置をリセット（左中央）
        adFrame.Position = UDim2.new(0, 10, 0.5, -adHeight/2)
        print("Ad position reset - out of screen")
        
        -- 警告通知を表示
        local notification = Instance.new("Message")
        notification.Text = "⚠️ 広告を隠すことはできません / Cannot hide ads ⚠️"
        notification.Parent = workspace
        wait(3)
        notification:Destroy()
        
        -- さらに、広告GUIが有効であることを確認
        if adGui and not adGui.Enabled then
            adGui.Enabled = true
        end
    end
end

-- 0.1秒ごとにチェック
game:GetService("RunService").Heartbeat:Connect(function()
    local currentTime = tick()
    if not lastCheckTime or currentTime - lastCheckTime >= 0.1 then
        checkAndResetPosition()
        lastCheckTime = currentTime
    end
end)

-- 広告GUIの削除を防止する機能
local function protectAdGui()
    adGui.AncestryChanged:Connect(function(child, parent)
        if not parent and adGui then
            wait(0.1)
            adGui.Parent = player:WaitForChild("PlayerGui")
            adGui.Enabled = true
            print("Ad GUI resurrected")
            
            local notification = Instance.new("Message")
            notification.Text = "⚠️ Cheating not allowed ⚠️"
            notification.Parent = workspace
            wait(3)
            notification:Destroy()
        end
    end)
    
    adGui:GetPropertyChangedSignal("Enabled"):Connect(function()
        if not adGui.Enabled then
            wait(0.1)
            adGui.Enabled = true
            print("Ad GUI re-enabled")
        end
    end)
end

protectAdGui()

-- 広告GUIを削除する関数
local function removeAdGUI()
    adGui:Destroy()
    
    local notification = Instance.new("Message")
    notification.Text = "✅ Ads removed successfully! ✅"
    notification.Parent = workspace
    wait(2)
    notification:Destroy()
    
    print("Ad GUI officially removed with correct password")
end

-- パスワード送信処理
submitButton.MouseButton1Click:Connect(function()
    local enteredPassword = passwordBox.Text
    
    if enteredPassword == correctPassword then
        removeAdGUI()
    else
        passwordBox.Text = ""
        passwordBox.PlaceholderText = "Incorrect password"
        wait(1)
        passwordBox.PlaceholderText = "Enter password"
        
        local notification = Instance.new("Message")
        notification.Text = "❌ Incorrect password! ❌"
        notification.Parent = workspace
        wait(2)
        notification:Destroy()
        
        -- 間違ったパスワードで削除しようとした場合は中央に移動
        adFrame.Position = UDim2.new(0.5, -adWidth/2, 0.5, -adHeight/2)
    end
end)

-- Enterキーでも送信できるように
passwordBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        if passwordBox.Text == correctPassword then
            removeAdGUI()
        else
            passwordBox.Text = ""
            passwordBox.PlaceholderText = "Incorrect password"
            wait(1)
            passwordBox.PlaceholderText = "Enter password"
            adFrame.Position = UDim2.new(0.5, -adWidth/2, 0.5, -adHeight/2)
        end
    end
end)

-- Discordリンクをコピーする関数
local function copyToClipboard(text)
    local clipboard = setclipboard or syn and syn.setclipboard or clipboard or set_clipboard
    if clipboard then
        clipboard(text)
        local notification = Instance.new("Message")
        notification.Text = "Discord link copied to clipboard!"
        notification.Parent = workspace
        wait(3)
        notification:Destroy()
    else
        warn("Clipboard function not available")
        local notification = Instance.new("Message")
        notification.Text = "Discord: https://discord.gg/sCMCR38zrn"
        notification.Parent = workspace
        wait(5)
        notification:Destroy()
    end
end

removeAdsButton.MouseButton1Click:Connect(function()
    copyToClipboard("https://discord.gg/sCMCR38zrn")
end)

-- ランダムに画像を表示する関数（通常広告）
local function showRandomAd()
    if adGui and adGui.Parent and adImage then
        local randomIndex = math.random(1, #textureIds)
        adImage.Image = "rbxassetid://" .. textureIds[randomIndex]
        print("Ad displayed: " .. textureIds[randomIndex])
    end
end

-- 全画面広告を表示する関数
local function showFullscreenAd()
    if not adGui or not adGui.Parent then return end
    
    print("Showing fullscreen ad!")
    
    -- 全画面広告用のGUI
    local fullscreenGui = Instance.new("ScreenGui")
    fullscreenGui.Name = "FullscreenAd"
    fullscreenGui.Parent = player:WaitForChild("PlayerGui")
    fullscreenGui.IgnoreGuiInset = true
    fullscreenGui.ResetOnSpawn = false
    fullscreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    fullscreenGui.DisplayOrder = 1000001  -- 最前面
    
    -- 全画面フレーム
    local fullscreenFrame = Instance.new("Frame")
    fullscreenFrame.Size = UDim2.new(1, 0, 1, 0)
    fullscreenFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    fullscreenFrame.BackgroundTransparency = 0.2
    fullscreenFrame.BorderSizePixel = 0
    fullscreenFrame.ZIndex = 100
    fullscreenFrame.Parent = fullscreenGui
    
    -- 全画面画像
    local fullscreenImage = Instance.new("ImageLabel")
    fullscreenImage.Size = UDim2.new(0.8, 0, 0.8, 0)
    fullscreenImage.Position = UDim2.new(0.1, 0, 0.1, 0)
    fullscreenImage.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    fullscreenImage.BackgroundTransparency = 0
    fullscreenImage.BorderSizePixel = 0
    fullscreenImage.ScaleType = Enum.ScaleType.Fit
    fullscreenImage.ZIndex = 101
    
    -- ランダムな広告画像を選択
    local randomIndex = math.random(1, #textureIds)
    fullscreenImage.Image = "rbxassetid://" .. textureIds[randomIndex]
    fullscreenImage.Parent = fullscreenFrame
    
    -- カウントダウンテキスト
    local countdownText = Instance.new("TextLabel")
    countdownText.Size = UDim2.new(0, 100, 0, 50)
    countdownText.Position = UDim2.new(0.5, -50, 0.9, -25)
    countdownText.BackgroundColor3 = Color3.new(0, 0, 0)
    countdownText.BackgroundTransparency = 0.5
    countdownText.Text = "4"
    countdownText.TextColor3 = Color3.new(1, 1, 1)
    countdownText.Font = Enum.Font.SourceSansBold
    countdownText.TextSize = 36
    countdownText.ZIndex = 102
    countdownText.Parent = fullscreenFrame
    
    -- 4秒カウントダウン
    for i = 4, 1, -1 do
        countdownText.Text = tostring(i)
        wait(1)
    end
    
    -- フェードアウト
    local tweenService = game:GetService("TweenService")
    local fadeOut = tweenService:Create(
        fullscreenFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {BackgroundTransparency = 1}
    )
    
    local imageFadeOut = tweenService:Create(
        fullscreenImage,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {ImageTransparency = 1}
    )
    
    local textFadeOut = tweenService:Create(
        countdownText,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {TextTransparency = 1}
    )
    
    fadeOut:Play()
    imageFadeOut:Play()
    textFadeOut:Play()
    
    wait(0.5)
    fullscreenGui:Destroy()
    print("Fullscreen ad finished")
end

-- 4秒ごとに画像をランダム表示
showRandomAd()

-- 通常広告更新ループ
coroutine.wrap(function()
    while adGui and adGui.Parent do
        wait(4)
        showRandomAd()
    end
end)()

-- 2分（120秒）ごとに全画面広告を表示
coroutine.wrap(function()
    wait(120)  -- 最初の5分待機
    while adGui and adGui.Parent do
        showFullscreenAd()
        wait(120)  -- 次の5分待機
    end
end)()

-- アニメーションスクリプトを実行する関数
local function runAnimationScript(callback)
    -- 画像ID
    local imageId = "126398109685987"
    -- オーディオID
    local audioId = "9085027122"
    
    -- スクリーングイ作成
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "StartupAnimation"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.DisplayOrder = 1000000
    screenGui.Parent = player:WaitForChild("PlayerGui")
    
    -- フレーム作成
    local animFrame = Instance.new("Frame")
    animFrame.Name = "AnimationFrame"
    animFrame.Size = UDim2.new(1, 0, 1, 0)
    animFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    animFrame.BackgroundTransparency = 0
    animFrame.BorderSizePixel = 0
    animFrame.ZIndex = 20
    animFrame.Parent = screenGui
    
    -- 画像表示用のImageLabel
    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Name = "StartupImage"
    imageLabel.Size = UDim2.new(0, 300, 0, 300)
    imageLabel.Position = UDim2.new(0.5, -150, 0.5, -150)
    imageLabel.Image = "rbxassetid://" .. imageId
    imageLabel.BackgroundTransparency = 1
    imageLabel.ScaleType = Enum.ScaleType.Fit
    imageLabel.ZIndex = 21
    imageLabel.Parent = animFrame
    
    -- オーディオ再生用のSoundオブジェクト
    local sound = Instance.new("Sound")
    sound.Name = "BGMSound"
    sound.SoundId = "rbxassetid://" .. audioId
    sound.Volume = 0.5
    sound.Looped = false
    sound.Parent = screenGui
    
    -- アニメーション関数
    local function playAnimation()
        imageLabel.Size = UDim2.new(0, 50, 0, 50)
        imageLabel.Position = UDim2.new(0.5, -25, 0.5, -25)
        imageLabel.ImageTransparency = 1
        animFrame.BackgroundTransparency = 1
        
        local tweenService = game:GetService("TweenService")
        
        local bgTween = tweenService:Create(
            animFrame,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            {BackgroundTransparency = 0}
        )
        
        local imageTween1 = tweenService:Create(
            imageLabel,
            TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
            {
                Size = UDim2.new(0, 350, 0, 350),
                Position = UDim2.new(0.5, -175, 0.5, -175),
                ImageTransparency = 0
            }
        )
        
        local imageTween2 = tweenService:Create(
            imageLabel,
            TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
            {
                Size = UDim2.new(0, 300, 0, 300),
                Position = UDim2.new(0.5, -150, 0.5, -150)
            }
        )
        
        sound:Play()
        
        bgTween:Play()
        wait(0.2)
        imageTween1:Play()
        imageTween1.Completed:Wait()
        imageTween2:Play()
        imageTween2.Completed:Wait()
        
        wait(1)
        
        local fadeOutTween = tweenService:Create(
            animFrame,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {BackgroundTransparency = 1}
        )
        
        local imageFadeOut = tweenService:Create(
            imageLabel,
            TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
            {ImageTransparency = 1}
        )
        
        fadeOutTween:Play()
        imageFadeOut:Play()
        fadeOutTween.Completed:Wait()
        
        animFrame:Destroy()
        imageLabel:Destroy()
        
        local musicLength = sound.TimeLength
        if musicLength == 0 then
            musicLength = 30
        end
        wait(musicLength - 2.3)
        
        sound:Stop()
        sound:Destroy()
        screenGui:Destroy()
        
        if callback then
            local success, err = pcall(callback)
            if not success then
                warn("Script execution error: " .. tostring(err))
            end
        end
    end
    
    playAnimation()
end

-- ボタン機能
btnJapanese.MouseButton1Click:Connect(function()
    gui.Enabled = false
    runAnimationScript(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastefy.app/XSLP22c8/raw"))()
        end)
        if not success then
            warn("Japanese script loading error: " .. tostring(err))
        end
        gui.Enabled = true
    end)
end)

btnEnglish.MouseButton1Click:Connect(function()
    gui.Enabled = false
    runAnimationScript(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastefy.app/Pngi0HqM/raw"))()
        end)
        if not success then
            warn("English script loading error: " .. tostring(err))
        end
        gui.Enabled = true
    end)
end)

btnVietnamese.MouseButton1Click:Connect(function()
    gui.Enabled = false
    runAnimationScript(function()
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastefy.app/CQxoyleA/raw"))()
        end)
        if not success then
            warn("Vietnamese script loading error: " .. tostring(err))
        end
        gui.Enabled = true
    end)
end)

print("Script-Box_ed GUI loaded successfully with " .. #textureIds .. " ads!")