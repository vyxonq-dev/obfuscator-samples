local games = {
    [9777594324] = { url = "https://pastebin.com/raw/tPRdbt6V", status = "active" }, -- Kopdes Together
    [9897663111] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/backstreet-survival.lua", status = "active" }, -- Backstreet Survival
    [79268393072444] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/sell-lemons-.lua", status = "active" }, -- Sell Lemons!
    [82524183928567] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/build-a-soccer-squad-.lua", status = "active" }, -- Build A Soccer Squad!
    [10334731049] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/clean-the-supermarket.lua", status = "active" }, -- clean the supermarket
    [10230860661] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/librarian-tidy-up-roblox-library.lua", status = "active" }, -- Librarian Tidy Up Roblox Library
    [10081194651] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/pickaxe-tycoon.lua", status = "active" }, -- Pickaxe Tycoon
    [128784467030899] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/merge-a-nuke.lua", status = "active" }, -- Merge a Nuke
    [140209132616484] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/water-empire.lua", status = "active" }, -- Water Empire
    [114115486822297] = { url = "https://pastefy.app/Ksz9zj49/raw", status = "disabled" }, -- Spin A Lucky Block For Soccer Cards
    [8950496606] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/main/deadly-delivery.lua", status = "active" }, -- Deadly Delivery
    [103159798148004] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/empang-indo.lua", status = "disabled" }, -- Empang Indo
    [130342654546662] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sambung-kata.lua", status = "disabled" }, -- Sambung Kata
    [18680867089] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/ultimate-mining-tycoon.lua", status = "active" }, -- Ultimate Mining Tycoon
    [114640202062357] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/swingforabrainrot.lua", status = "active" }, -- Swing Obby for a Brainrot
    [72774564502867] = { url = "https://raw.githubusercontent.com/dhannxsazaraxhub/testajamok/refs/heads/main/lengkapi-kata.lua", status = "stable" }, -- Lengkapi Kata
    [83369512629707] = { url = "https://raw.githubusercontent.com/fay23-dam/sazaraaax-script/refs/heads/main/sawah-indo.lua", status = "stable" }, -- Sawah Indo
}

local currentID = games[game.PlaceId] and game.PlaceId or game.GameId
local g = games[currentID]
-- Victoria Global Broadcast Receiver
task.spawn(function()
    local last_id = ""
    local HttpService = game:GetService("HttpService")
    local TweenService = game:GetService("TweenService")
    local SoundService = game:GetService("SoundService")
    local CoreGui = game:GetService("CoreGui")
    while true do
        pcall(function()
            local res = game:HttpGet("https://victoriascript.vercel.app/api/announcement?t="..tostring(os.time()))
            local data = HttpService:JSONDecode(res)
            if data and data.id and data.id ~= last_id and data.is_active then
                last_id = data.id
                -- Play Ting Sound
                local sound = Instance.new("Sound")
                sound.SoundId = "rbxassetid://2865227271"
                sound.Volume = 1
                sound.Parent = SoundService
                sound:Play()
                game.Debris:AddItem(sound, 3)
                -- Create UI
                local sg = Instance.new("ScreenGui")
                sg.Name = "VicBroadcast"
                sg.Parent = CoreGui
                local frame = Instance.new("Frame")
                frame.Size = UDim2.new(0, 320, 0, 130)
                frame.Position = UDim2.new(0.5, -160, 0, -150)
                frame.BackgroundColor3 = Color3.fromRGB(15, 15, 22)
                frame.BorderSizePixel = 0
                frame.Parent = sg
                local corner = Instance.new("UICorner")
                corner.CornerRadius = UDim.new(0, 8)
                corner.Parent = frame
                local stroke = Instance.new("UIStroke")
                stroke.Color = Color3.fromRGB(40,50,60)
                stroke.Thickness = 1
                stroke.Parent = frame
                local titleRow = Instance.new("Frame")
                titleRow.Size = UDim2.new(1, -30, 0, 30)
                titleRow.Position = UDim2.new(0, 15, 0, 10)
                titleRow.BackgroundTransparency = 1
                titleRow.Parent = frame
                local tLayout = Instance.new("UIListLayout")
                tLayout.FillDirection = Enum.FillDirection.Horizontal
                tLayout.VerticalAlignment = Enum.VerticalAlignment.Center
                tLayout.Padding = UDim.new(0, 6)
                tLayout.Parent = titleRow
                local icon = Instance.new("TextLabel")
                icon.Size = UDim2.new(0, 18, 0, 30)
                icon.BackgroundTransparency = 1
                icon.Text = "~"
                icon.TextColor3 = Color3.fromRGB(255, 105, 180)
                icon.FontFace = Font.new("rbxassetid://12187368843")
                icon.TextSize = 18
                icon.Parent = titleRow
                local titleLbl = Instance.new("TextLabel")
                titleLbl.Size = UDim2.new(0, 120, 0, 30)
                titleLbl.BackgroundTransparency = 1
                titleLbl.Text = "Victoria Script"
                titleLbl.FontFace = Font.new("rbxassetid://12187368843")
                titleLbl.TextSize = 16
                titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                titleLbl.TextXAlignment = Enum.TextXAlignment.Left
                titleLbl.Parent = titleRow
                local titleGrad = Instance.new("UIGradient")
                titleGrad.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 105, 180)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 210, 255))})
                titleGrad.Parent = titleLbl
                local tagLbl = Instance.new("TextLabel")
                tagLbl.Size = UDim2.new(0, 100, 0, 30)
                tagLbl.BackgroundTransparency = 1
                tagLbl.Text = data.type == "warning" and "[WARNING]" or (data.type == "update" and "[UPDATE]" or "[ANNOUNCEMENT]")
                tagLbl.FontFace = Font.new("rbxassetid://12187368843")
                tagLbl.TextSize = 11
                tagLbl.TextColor3 = data.type == "warning" and Color3.fromRGB(255, 60, 60) or Color3.fromRGB(255, 185, 55)
                tagLbl.TextXAlignment = Enum.TextXAlignment.Left
                tagLbl.Parent = titleRow
                local msg = Instance.new("TextLabel")
                msg.Size = UDim2.new(1, -30, 1, -55)
                msg.Position = UDim2.new(0, 15, 0, 45)
                msg.BackgroundTransparency = 1
                msg.Text = data.message
                msg.TextColor3 = Color3.fromRGB(220, 220, 220)
                msg.FontFace = Font.new("rbxassetid://12187368843")
                msg.TextSize = 12
                msg.TextWrapped = true
                msg.TextYAlignment = Enum.TextYAlignment.Top
                msg.TextXAlignment = Enum.TextXAlignment.Left
                msg.Parent = frame
                local btn = Instance.new("TextButton")
                btn.Size = UDim2.new(0, 25, 0, 25)
                btn.Position = UDim2.new(1, -30, 0, 5)
                btn.BackgroundTransparency = 1
                btn.Text = "X"
                btn.TextColor3 = Color3.fromRGB(255, 100, 100)
                btn.Font = Enum.Font.GothamBold
                btn.TextSize = 14
                btn.Parent = frame
                btn.MouseButton1Click:Connect(function()
                    TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -160, 0, -150)}):Play()
                    task.wait(0.5)
                    sg:Destroy()
                end)
                TweenService:Create(frame, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -160, 0, 20)}):Play()
                task.delay(15, function()
                    if sg and sg.Parent then
                        TweenService:Create(frame, TweenInfo.new(0.5), {Position = UDim2.new(0.5, -160, 0, -150)}):Play()
                        task.wait(0.5)
                        if sg and sg.Parent then sg:Destroy() end
                    end
                end)
            end
        end)
        task.wait(30)
    end
end)

-- Victoria Analytics Tracker
pcall(function()
    local req = (syn and syn.request) or request or http_request or (http and http.request)
    if req then
        req({
            Url = "https://victoriascript.vercel.app/api/track",
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode({
                gameId = currentID,
                player = game:GetService("Players").LocalPlayer.Name,
                executor = identifyexecutor and identifyexecutor() or "Unknown"
            })
        })
    end
end)

if g then
    if g.status == "maintenance" then
        loadstring(game:HttpGet("https://victoriascript.vercel.app/intromaintenance.lua"))()
    elseif g.status == "disabled" then
        loadstring(game:HttpGet("https://victoriascript.vercel.app/introdisable.lua"))()
    else
        loadstring(game:HttpGet(g.url))()
    end
else
    game.Players.LocalPlayer:Kick("Yo! This game ain't on the list.\nCheck the Discord for whitelisted games, homie.")
end