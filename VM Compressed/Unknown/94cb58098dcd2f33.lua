-- AYARLAR
local driveUrl = "https://drive.google.com/uc?export=download&id=1kas9bAbixOypIPf66pgIgfBS8GZheKTK"
local musicFile = "immortality_final_v5.mp3"
local scriptUrl = "https://pastebin.com/raw/NqGgGjvD"

local lp = game.Players.LocalPlayer

-- 1. KONUŞMA FONKSİYONU (Her iki chat sürümüyle uyumlu)
local function say(msg)
    pcall(function()
        local TextChatService = game:GetService("TextChatService")
        if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
            local channel = TextChatService.TextChannels.RBXGeneral
            if channel then channel:SendAsync(msg) end
        else
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
        end
    end)
end

-- 2. GÖRSEL "UI" PANELİ
local function createImmortalityUI()
    local pg = lp:WaitForChild("PlayerGui")
    if pg:FindFirstChild("LordUI") then pg.LordUI:Destroy() end

    local sg = Instance.new("ScreenGui", pg)
    sg.Name = "LordUI"
    sg.ResetOnSpawn = false

    local textLabel = Instance.new("TextLabel", sg)
    textLabel.Size = UDim2.new(0, 450, 0, 60)
    textLabel.Position = UDim2.new(0.5, -225, 0, 50)
    textLabel.BackgroundTransparency = 0.5
    textLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Text = "[Immortality Lord]: ui"
    textLabel.Font = Enum.Font.SpecialElite
    textLabel.TextSize = 28
    textLabel.Visible = false 
    
    Instance.new("UICorner", textLabel).CornerRadius = UDim.new(0, 12)
    return textLabel
end

local lordLabel = createImmortalityUI()

local function showUI(customText)
    lordLabel.Text = "[Immortality Lord]: " .. (customText or "ui")
    lordLabel.Visible = true
    task.wait(2)
    lordLabel.Visible = false
end

-- 3. SADECE SENİN MESAJLARINI DİNLEYEN SİSTEM
game:GetService("TextChatService").OnIncomingMessage = function(message)
    if message.TextSource and message.TextSource.UserId == lp.UserId then
        local words = string.split(message.Text, " ")
        for _, word in ipairs(words) do
            if word ~= "" then
                task.spawn(function() showUI(word) end)
                break 
            end
        end
    end
end

-- 4. KONTROLLER VE MÜZİK
local function playMusic()
    local success, musicData = pcall(function() return game:HttpGet(driveUrl) end)
    if success and #musicData > 1000 then
        writefile(musicFile, musicData)
        local sound = Instance.new("Sound", game:GetService("SoundService"))
        sound.SoundId = getcustomasset(musicFile)
        sound.Volume = 2
        sound.Looped = true
        sound:Play()
    end
end

local function createController()
    local sg = Instance.new("ScreenGui", lp.PlayerGui)
    sg.Name = "ControllerUI"
    sg.ResetOnSpawn = false
    local frame = Instance.new("Frame", sg)
    frame.Size = UDim2.new(0, 200, 0, 180)
    frame.Position = UDim2.new(0, 50, 1, -250)
    frame.BackgroundTransparency = 1

    local function createBtn(t, p, k)
        local b = Instance.new("TextButton", frame)
        b.Size = UDim2.new(0, 50, 0, 50)
        b.Position = p
        b.Text = t
        b.BackgroundColor3 = Color3.fromRGB(30,30,30)
        b.TextColor3 = Color3.new(1,1,1)
        Instance.new("UICorner", b)
        b.MouseButton1Down:Connect(function() game:GetService("VirtualInputManager"):SendKeyEvent(true, k, false, game) end)
        b.MouseButton1Up:Connect(function() game:GetService("VirtualInputManager"):SendKeyEvent(false, k, false, game) end)
    end

    createBtn("W", UDim2.new(0, 60, 0, 0), Enum.KeyCode.W)
    createBtn("A", UDim2.new(0, 0, 0, 60), Enum.KeyCode.A)
    createBtn("S", UDim2.new(0, 60, 0, 60), Enum.KeyCode.S)
    createBtn("D", UDim2.new(0, 120, 0, 60), Enum.KeyCode.D)
    createBtn("Z", UDim2.new(0, 0, 0, 120), Enum.KeyCode.Z)
    createBtn("X", UDim2.new(0, 120, 0, 120), Enum.KeyCode.X)
end

-- 5. SIRALI AKIŞ (YENİ GİRİŞ MESAJI DAHİL)
task.spawn(function()
    -- Önce senin istediğin o özel giriş mesajı
    say("By oldhacfard / immortaliy lord")
    task.wait(1.5)
    
    -- Sonra diğer kodlar
    say("-gh 9685941374 5593848751 5505301521")
    task.wait(1)
    say("-gh 13395210079 13629432438")
    
    task.wait(4) -- 4 saniye bekleme
    
    createController()
    task.spawn(playMusic)
    
    -- En son scripti yükle
    loadstring(game:HttpGet(scriptUrl))()
end)
