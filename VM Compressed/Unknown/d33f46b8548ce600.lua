local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Project xyon [Steal a fish]",
   Icon = 10432428953, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Be a fish🤑",
   LoadingSubtitle = "Created by Melidon",
   ShowText = "Project Xyon", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "big Hub"
   },

   Discord = {
      Enabled = True, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "vUegG6yX", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "project key",
      Subtitle = "project PX",
      Note = "key in discord", -- Use this to tell the user how to get a key
      FileName = "ultra key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"ArmalgeyonsyaihdudodydidudidydodysisyhsaregayArmalgeyonsyaihdudodydidudidydodysisyhsaregay" , "Armalgeyonsyaihdudodydidudidydodysisyhsaregay"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("All", 4483362458) -- Title, Image

local Button = Tab:CreateButton({
   Name = "Op mode",
   Callback = function()
  local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- CẤU HÌNH
local ESP_HEIGHT = 8 -- Độ cao ESP (stud)
local TEXT_SIZE = 35 -- Kích thước chữ ESP
local SPEED_MULTIPLIER = 3 -- Tốc độ chạy nhanh
local NOCLIP_SPEED = 10 -- Tốc độ noclip

-- BIẾN TRẠNG THÁI
local speedEnabled = true
local noclipEnabled = true
local tpwalking = true
local Clip = false
local Noclipping = nil

-- Thông báo
local function notify(title, message)
    print("[" .. title .. "] " .. message)
end

-- Chống ragdoll (anti-ragdoll)
local function antiRagdoll()
    if humanoid then
        humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics, false)
    end
    
    -- Xử lý khi có bộ phận ragdoll
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") and part:FindFirstChild("OriginalPosition") then
            part:Destroy()
        end
    end
end

-- CHỨC NĂNG CHẠY NHANH (SPEED) - TỰ ĐỘNG BẬT
local originalWalkSpeed = humanoid.WalkSpeed
local function enableSpeed()
    humanoid.WalkSpeed = originalWalkSpeed * SPEED_MULTIPLIER
    notify('Speed', 'Speed Auto-Enabled (x' .. SPEED_MULTIPLIER .. ')')
end

-- CHỨC NĂNG ĐI XUYÊN TƯỜNG (NOCLIP) - TỰ ĐỘNG BẬT
local function enableNoclip()
    Clip = false
    tpwalking = true
    
    -- Noclip loop
    local function NoclipLoop()
        if Clip == false and character and character.Parent then
            for _, child in pairs(character:GetDescendants()) do
                if child:IsA("BasePart") and child.CanCollide == true then
                    child.CanCollide = false
                end
            end
        end
    end
    
    -- TP Walking loop
    local function TPWalkLoop()
        local chr = character
        local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
        
        while tpwalking and chr and hum and hum.Parent do
            local delta = RunService.Heartbeat:Wait()
            if hum.MoveDirection.Magnitude > 0 then
                chr:TranslateBy(hum.MoveDirection * delta * NOCLIP_SPEED)
            end
        end
    end
    
    Noclipping = RunService.Stepped:Connect(NoclipLoop)
    spawn(TPWalkLoop)
    
    notify('Noclip', 'Noclip Auto-Enabled')
end

-- ĐIỀU KHIỂN PHÍM (ĐÃ XÓA - KHÔNG CẦN THIẾT)

-- Tạo ESP cho các nhà
local ESPs = {}
local function createESP(tycoonName, position)
    -- Xóa ESP cũ nếu tồn tại
    if ESPs[tycoonName] then
        ESPs[tycoonName]:Destroy()
    end
    
    local billboard = Instance.new("BillboardGui")
    billboard.Name = tycoonName .. "_ESP"
    billboard.AlwaysOnTop = true
    billboard.Size = UDim2.new(0, 300, 0, 70)
    billboard.StudsOffset = Vector3.new(0, ESP_HEIGHT, 0)
    billboard.Adornee = position
    
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "ESPLabel"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 0.7
    textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
    textLabel.TextStrokeTransparency = 0
    textLabel.TextSize = TEXT_SIZE
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BorderSizePixel = 0
    textLabel.ZIndex = 10
    
    textLabel.Parent = billboard
    billboard.Parent = player:WaitForChild("PlayerGui")
    
    ESPs[tycoonName] = billboard
    return textLabel
end

-- Kiểm tra trạng thái các nhà
local function checkTycoons()
    for i = 1, 8 do
        local tycoonName = "Tycoon" .. i
        local tycoonPath = workspace.Map.Tycoons:FindFirstChild(tycoonName)
        
        if tycoonPath then
            local screen = tycoonPath.Tycoon.ForcefieldFolder:FindFirstChild("Screen")
            local board = tycoonPath.Tycoon.Board.Board.SurfaceGui:FindFirstChild("Username")
            
            if screen and board then
                local espText
                
                -- Tạo ESP nếu chưa tồn tại
                if not ESPs[tycoonName] then
                    espText = createESP(tycoonName, screen.Screen)
                else
                    espText = ESPs[tycoonName]:FindFirstChild("ESPLabel")
                end
                
                if espText then
                    local timeLabel = screen.Screen.SurfaceGui:FindFirstChild("Time")
                    
                    -- Kiểm tra chủ sở hữu
                    if board.Text == "No Owner!" then
                        espText.Text = "NO PLAYER IN BASE"
                        espText.TextColor3 = Color3.new(1, 0.3, 0.3) -- Màu đỏ
                    else
                        -- Kiểm tra thời gian
                        if timeLabel and timeLabel.Text == "0s" then
                            espText.Text = "BASE IS UNLOCKED"
                            espText.TextColor3 = Color3.new(0.3, 1, 0.3) -- Màu xanh lá
                        else
                            espText.Text = "TIME: " .. (timeLabel.Text or "N/A")
                            espText.TextColor3 = Color3.new(1, 1, 0.3) -- Màu vàng
                        end
                    end
                end
            end
        end
    end
end

-- Xử lý khi character respawn
player.CharacterAdded:Connect(function(newCharacter)
    character = newCharacter
    humanoid = character:WaitForChild("Humanoid")
    originalWalkSpeed = humanoid.WalkSpeed
    antiRagdoll()
    
    -- Tự động bật lại tất cả chức năng
    wait(1) -- Chờ character load hoàn toàn
    enableSpeed()
    enableNoclip()
end)

-- Khởi tạo hệ thống
antiRagdoll()
enableSpeed()
enableNoclip()
notify('System', 'All features auto-enabled! Speed x3 + Noclip + ESP active')

-- Chạy kiểm tra liên tục
spawn(function()
    while true do
        pcall(checkTycoons) -- Sử dụng pcall để bắt lỗi
        RunService.Heartbeat:Wait()
    end
end)
   end,
})

local Button = Tab:CreateButton({
   Name = "Steal",
   Callback = function()
 local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Biến kiểm soát cooldown
local isOnCooldown = false

-- Tạo ScreenGui với ResetOnSpawn = false
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "StealGui"
screenGui.ResetOnSpawn = false -- QUAN TRỌNG: Ngăn GUI reset khi respawn
screenGui.Parent = playerGui

-- Tạo Frame chính (nền đen)
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 60)
mainFrame.Position = UDim2.new(0.8, -100, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Bo tròn góc cho frame chính
local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 10)
mainCorner.Parent = mainFrame

-- Tạo nút bấm (màu xanh)
local stealButton = Instance.new("TextButton")
stealButton.Size = UDim2.new(1, -10, 1, -10)
stealButton.Position = UDim2.new(0, 5, 0, 5)
stealButton.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
stealButton.Text = "Steal | Px Hub"
stealButton.TextColor3 = Color3.fromRGB(255, 255, 255)
stealButton.TextScaled = true
stealButton.Font = Enum.Font.SourceSansBold
stealButton.BorderSizePixel = 0
stealButton.Parent = mainFrame

-- Bo tròn góc cho nút bấm
local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 8)
buttonCorner.Parent = stealButton

-- Hàm teleport người chơi
local function teleportPlayer(x, y, z)
    local character = player.Character
    if character and character:FindFirstChild("HumanoidRootPart") then
        character.HumanoidRootPart.CFrame = CFrame.new(x, y, z)
    end
end

-- Hàm tìm base của người chơi
local function findPlayerBase()
    local workspace = game.Workspace
    local mapFolder = workspace:FindFirstChild("Map")
    if not mapFolder then 
        print("Không tìm thấy Map folder")
        return nil 
    end
    
    local tycoonsFolder = mapFolder:FindFirstChild("Tycoons")
    if not tycoonsFolder then 
        print("Không tìm thấy Tycoons folder")
        return nil 
    end
    
    -- Lặp qua từng tycoon từ 1 đến 8
    for i = 1, 8 do
        local tycoonName = "Tycoon" .. i
        local tycoon = tycoonsFolder:FindFirstChild(tycoonName)
        
        if tycoon then
            local tycoonInner = tycoon:FindFirstChild("Tycoon")
            if tycoonInner then
                local board = tycoonInner:FindFirstChild("Board")
                if board then
                    local boardPart = board:FindFirstChild("Board")
                    if boardPart then
                        local surfaceGui = boardPart:FindFirstChild("SurfaceGui")
                        if surfaceGui then
                            local username = surfaceGui:FindFirstChild("Username")
                            if username then
                                if username.Text == "@" .. player.Name or 
                                   username.Text == player.Name or 
                                   username.Text == "@" .. player.DisplayName or
                                   username.Text == player.DisplayName then
                                    local basePosition = boardPart.Position
                                    return Vector3.new(basePosition.X, basePosition.Y - 5, basePosition.Z)
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    
    print("Không tìm thấy base của người chơi")
    return nil
end

-- Hàm đếm ngược
local function startCountdown()
    local countdown = 10
    
    -- Cập nhật text mỗi giây
    local function updateCountdown()
        stealButton.Text = tostring(countdown) .. " | Px Hub"
        countdown = countdown - 1
        
        if countdown < 0 then
            -- Teleport về base
            local playerBase = findPlayerBase()
            if playerBase then
                teleportPlayer(playerBase.X, playerBase.Y, playerBase.Z)
            else
                -- Fallback về spawn hoặc vị trí mặc định
                local spawnLocation = game.Workspace:FindFirstChild("SpawnLocation")
                if spawnLocation then
                    teleportPlayer(spawnLocation.Position.X, spawnLocation.Position.Y + 5, spawnLocation.Position.Z)
                end
            end
            
            -- Reset UI
            stealButton.Text = "Steal | Project xyon"
            isOnCooldown = false
            return
        end
        
        wait(1)
        updateCountdown()
    end
    
    updateCountdown()
end

-- Xử lý khi nhấn nút
stealButton.MouseButton1Click:Connect(function()
    if isOnCooldown then return end
    
    isOnCooldown = true
    
    -- Teleport đến vị trí chỉ định
    teleportPlayer(51.59375, 100, 140.355255)
    
    -- Bắt đầu đếm ngược
    spawn(startCountdown)
end)

-- Hiệu ứng hover cho nút bấm
stealButton.MouseEnter:Connect(function()
    if not isOnCooldown then
        TweenService:Create(stealButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 140, 220)}):Play()
    end
end)

stealButton.MouseLeave:Connect(function()
    if not isOnCooldown then
        TweenService:Create(stealButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 162, 255)}):Play()
    end
end)

-- QUAN TRỌNG: Xử lý sự kiện khi nhân vật chết
player.CharacterAdded:Connect(function(character)
    character:WaitForChild("Humanoid").Died:Connect(function()
        -- Đảm bảo GUI vẫn hiển thị khi chết
        if not screenGui.Parent then
            screenGui.Parent = playerGui
        end
        
        -- Reset trạng thái cooldown
        isOnCooldown = false
        stealButton.Text = "Steal | Px Hub"
    end)
end)

print("Steal Script loaded successfully! Menu sẽ không biến mất khi chết")
   end,
})
