print("VinzHub Universal Loader")
local vinzHubLogoId = "rbxassetid://126326782677020" 

function buatNotifikasi(title, message)
    local NotifGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    NotifGui.Name = "VinzNotifGui"
    
    local MainFrame = Instance.new("Frame", NotifGui)
    MainFrame.Name = "MainFrame"
    MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    MainFrame.BorderSizePixel = 0
    MainFrame.Size = UDim2.new(0, 320, 0, 75)
    MainFrame.Position = UDim2.new(0.5, -160, 0, -90)
    
    local UICorner = Instance.new("UICorner", MainFrame)
    UICorner.CornerRadius = UDim.new(0, 8)
    
    local IconImage = Instance.new("ImageLabel", MainFrame)
    IconImage.Name = "Icon"
    IconImage.BackgroundTransparency = 1
    IconImage.Size = UDim2.new(0, 32, 0, 32)
    IconImage.Position = UDim2.new(0, 10, 0.5, -16)
    IconImage.Image = vinzHubLogoId 
    IconImage.ScaleType = Enum.ScaleType.Fit
    
    local TitleLabel = Instance.new("TextLabel", MainFrame)
    TitleLabel.Name = "Title"
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Size = UDim2.new(1, -60, 0, 25)
    TitleLabel.Position = UDim2.new(0, 50, 0, 8)
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 18
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Text = title
    
    local MessageLabel = Instance.new("TextLabel", MainFrame)
    MessageLabel.Name = "Message"
    MessageLabel.BackgroundTransparency = 1
    MessageLabel.Size = UDim2.new(1, -60, 0, 20)
    MessageLabel.Position = UDim2.new(0, 50, 0, 35)
    MessageLabel.Font = Enum.Font.SourceSans
    MessageLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    MessageLabel.TextSize = 14
    MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
    MessageLabel.Text = message
    
    local TweenService = game:GetService("TweenService")
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local tweenIn = TweenService:Create(MainFrame, tweenInfo, {Position = UDim2.new(0.5, -160, 0, 10)})
    tweenIn:Play()
    
    task.wait(2)
    
    local tweenOut = TweenService:Create(MainFrame, tweenInfo, {Position = UDim2.new(0.5, -160, 0, -90)})
    tweenOut:Play()
    
    game:GetService("Debris"):AddItem(NotifGui, 0.6)
end

local gameScripts = {
    [121864768012064] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/Fish-It", -- Fish It
    [123224294054165] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/mt-atin", -- Mount Atin
    [102234703920418] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/mt-daun", -- Mount Daun
    [128473079243102] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/mt-arunika", -- Mount Arunika
    [2693023319] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/antartica", -- Expedition Antartica
    [106525193781380] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/mt-sibuatan", -- Mount Sibuatan
    [93978595733734] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/VD", -- Violance District
    [127742093697776] = "https://raw.githubusercontent.com/Vinzyy13/VinzHub/refs/heads/main/PVB", -- Plant VS Brainrot
}

local currentGameId = game.PlaceId
local scriptUrl = gameScripts[currentGameId]

if scriptUrl then
    local success, gameInfo = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(currentGameId)
    end)
    local gameName = success and gameInfo.Name or "Game"

    print("✅ Game Detected: " .. gameName)
    print("🚀 Running Script...")

    buatNotifikasi("VinzHub", gameName .. " Successfully loaded")
    
    pcall(function()
        loadstring(game:HttpGet(scriptUrl))()
    end)
    
else
    warn("⚠️ This Game (ID: " .. currentGameId .. ") Not Supported.")
    buatNotifikasi("VinzHub", "This Game Not Supported")
end
