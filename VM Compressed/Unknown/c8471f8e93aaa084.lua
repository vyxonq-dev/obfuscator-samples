--[[
OMEGA UNIT HUB - GET ALL ITEMS EDITION
✔ Giữ nguyên toàn bộ giao diện (Auth, UI, Purple Lightning...)
✔ Hệ thống Key Gist Github được giữ nguyên
✔ Đã xóa các tính năng cũ (AFK, Aura, Troll...)
✔ Tích hợp chức năng Get All Item (Quét và nhận toàn bộ Pet)
]]

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

--==================================================
-- CONFIG (BẢO MẬT KEY QUA GITHUB GIST)
--==================================================
local DiscordLink = "https://discord.gg/QF2g2ha8m"

-- Lấy Key từ Gist
local finalKey = ""
local success, result = pcall(function()
    return game:HttpGet("https://gist.githubusercontent.com/makcao123a-create/9434e5880ba331342d31da764acc25cb/raw"):match("^%s*(.-)%s*$")
end)

if success and result then
    finalKey = result
else
    finalKey = "ERROR_FETCHING_KEY"
end

local colors = {
    SchemeColor = Color3.fromRGB(255,215,0),
    Background = Color3.fromRGB(8,8,8),
    Header = Color3.fromRGB(12,12,12),
    TextColor = Color3.fromRGB(0,255,255),
    ElementColor = Color3.fromRGB(18,18,18)
}

local function Notify(a,b)
    pcall(function()
        game.StarterGui:SetCore("SendNotification",{
            Title=a,
            Text=b,
            Duration=3
        })
    end)
end

--==================================================
-- AUTH
--==================================================
local AuthWindow = Library.CreateLib("OMEGA UNIT AUTH",colors)
local AuthTab = AuthWindow:NewTab("Key")
local AuthSec = AuthTab:NewSection("Login")

AuthSec:NewLabel("Join Discord For Key")
AuthSec:NewLabel("Discord: "..DiscordLink)

AuthSec:NewButton("Copy Discord","",function()
    setclipboard(DiscordLink)
    Notify("OMEGA UNIT","Copied Discord")
end)

AuthSec:NewTextBox("Enter Key","",function(txt)
    if txt == finalKey then
        for _,v in pairs(game.CoreGui:GetChildren()) do
            if v:IsA("ScreenGui") and v:FindFirstChild("Main") then
                v:Destroy()
            end
        end
        task.wait(.2)
        RunMainScript()
    else
        Notify("Wrong Key","Check Discord For Key")
    end
end)

--==================================================
-- KEY DRAG FIX
--==================================================
task.spawn(function()
    while task.wait(.6) do
        pcall(function()
            for _,g in pairs(game.CoreGui:GetChildren()) do
                if g:IsA("ScreenGui") and g:FindFirstChild("Main") then
                    g.Main.Active = true
                    g.Main.Draggable = true
                end
            end
        end)
        if not game.CoreGui:FindFirstChild("OMEGA UNIT AUTH") then break end
    end
end)

--==================================================
-- MAIN SCRIPT
--==================================================
function RunMainScript()

    local MainWin = Library.CreateLib("OMEGA UNIT HUB",colors)

    --==================================================
    -- ELECTRIC LIGHTNING FUNCTION (TIA ĐIỆN TÍM)
    --==================================================
    local function AddLightningEffect(target, cornerRadius)
        if target:FindFirstChild("PurpleLightning") then return end

        local sparkFrame = Instance.new("Frame")
        sparkFrame.Name = "PurpleLightning"
        sparkFrame.Size = UDim2.new(1, 0, 1, 0) 
        sparkFrame.Position = UDim2.new(0, 0, 0, 0)
        sparkFrame.BackgroundTransparency = 1
        sparkFrame.Active = false 
        sparkFrame.ZIndex = target.ZIndex + 5 
        sparkFrame.Parent = target

        Instance.new("UICorner", sparkFrame).CornerRadius = cornerRadius

        local stroke = Instance.new("UIStroke", sparkFrame)
        stroke.Color = Color3.fromRGB(255, 255, 255)
        stroke.Thickness = 2

        local grad = Instance.new("UIGradient", stroke)
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 0, 40)),
            ColorSequenceKeypoint.new(0.4, Color3.fromRGB(170, 0, 255)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(255, 255, 255)),
            ColorSequenceKeypoint.new(0.6, Color3.fromRGB(170, 0, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 0, 40))
        })
        grad.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.45, 0),
            NumberSequenceKeypoint.new(0.55, 0),
            NumberSequenceKeypoint.new(1, 1)
        })

        task.spawn(function()
            local offset = -1.5
            while sparkFrame.Parent do
                local dt = RunService.RenderStepped:Wait()
                offset = offset + (dt * 3.5) 
                
                if offset > 1.5 then
                    offset = -1.5
                    grad.Rotation = math.random(0, 3) * 90 
                end
                
                grad.Offset = Vector2.new(offset, 0)
                
                if math.random(1, 10) > 7 then
                    stroke.Thickness = math.random(1, 4)
                else
                    stroke.Thickness = 2
                end
            end
        end)
    end

    --==================================================
    -- HUB BUTTON
    --==================================================
    local gui = Instance.new("ScreenGui",game.CoreGui)
    gui.Name = "OmegaHub"

    local btn = Instance.new("TextButton",gui)
    btn.Size = UDim2.new(0,60,0,60)
    btn.Position = UDim2.new(0,10,0,220)
    btn.BackgroundColor3 = Color3.fromRGB(10,10,10)
    btn.BackgroundTransparency = .2
    btn.Text = "H  U  B"
    btn.TextColor3 = Color3.fromRGB(0,255,255)
    btn.TextSize = 11
    btn.Font = Enum.Font.GothamBold
    btn.Active = true
    btn.Draggable = true
    btn.BorderSizePixel = 0

    Instance.new("UICorner",btn).CornerRadius = UDim.new(1,0)

    local hubStroke = Instance.new("UIStroke",btn)
    hubStroke.Color = Color3.fromRGB(255,215,0)
    hubStroke.Thickness = 2

    AddLightningEffect(btn, UDim.new(1,0))

    task.spawn(function()
        while btn.Parent do
            for i=0,1,0.05 do hubStroke.Transparency = i task.wait(.03) end
            for i=1,0,-0.05 do hubStroke.Transparency = i task.wait(.03) end
        end
    end)

    local clickSound = Instance.new("Sound", btn)
    clickSound.SoundId = "rbxassetid://6895079853"
    clickSound.Volume = 0.5

    btn.MouseButton1Click:Connect(function()
        clickSound:Play() 
        Library:ToggleUI() 
    end)

    --==================================================
    -- STYLE LOOP
    --==================================================
    task.spawn(function()
        while task.wait(.6) do
            pcall(function()
                for _,g in pairs(game.CoreGui:GetChildren()) do
                    if g:IsA("ScreenGui") and g:FindFirstChild("Main") then
                        local Main = g.Main
                        Main.Active = true 
                        Main.Draggable = true
                        Main.Selectable = false
                        Main.BackgroundColor3 = Color3.fromRGB(8,8,8)
                        Main.BackgroundTransparency = .05

                        if not Main:FindFirstChild("UICorner") then
                            Instance.new("UICorner",Main).CornerRadius = UDim.new(0,18)
                        end
                        if not Main:FindFirstChild("GoldStroke") then
                            local st = Instance.new("UIStroke",Main)
                            st.Name = "GoldStroke"
                            st.Color = Color3.fromRGB(255,215,0)
                            st.Thickness = 2
                        end

                        AddLightningEffect(Main, UDim.new(0,18))

                        for _,x in pairs(Main:GetDescendants()) do
                            if x:IsA("TextLabel") or x:IsA("TextButton") then
                                x.TextColor3 = Color3.fromRGB(0,255,255)
                                x.Font = Enum.Font.GothamBold
                            end
                            if x:IsA("TextButton") then
                                x.BorderSizePixel = 0
                                if not x:FindFirstChild("UICorner") then
                                    Instance.new("UICorner",x).CornerRadius = UDim.new(0,12)
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    --==================================================
    -- TABS - THÔNG TIN
    --==================================================
    local InfoTab = MainWin:NewTab("Information")
    local InfoSec = InfoTab:NewSection("Community")
    InfoSec:NewLabel("Discord: "..DiscordLink)

    --==================================================
    -- TAB MỚI: GET ALL ITEM
    --==================================================
    local ItemTab = MainWin:NewTab("Items")
    local ItemSec = ItemTab:NewSection("Auto Claim")

    ItemSec:NewButton("Get All Item", "Quét hệ thống và nhận tất cả thú cưng", function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        
        -- Dùng WaitForChild kèm timeout để tránh bị treo script nếu game chưa load kịp
        local ItemsFolder = ReplicatedStorage:WaitForChild("Items", 5)
        if ItemsFolder then ItemsFolder = ItemsFolder:WaitForChild("Normal", 5) end
        
        local EventsFolder = ReplicatedStorage:WaitForChild("Events", 5)
        local RewardEvent = nil
        if EventsFolder then RewardEvent = EventsFolder:WaitForChild("RewardEscape", 5) end

        -- Báo lỗi nếu thiếu Folder hoặc Event
        if not ItemsFolder or not RewardEvent then
            Notify("ERROR", "Không tìm thấy dữ liệu Pet trong game!")
            return
        end

        -- Hàm quét danh sách
        local function getAllPetNames()
            local petList = {}
            for _, item in ipairs(ItemsFolder:GetChildren()) do
                table.insert(petList, item.Name)
            end
            return petList
        end

        local allPets = getAllPetNames()
        Notify("SCANNER", "Tìm thấy " .. #allPets .. " loại pet trong hệ thống.")

        -- Vòng lặp nhận Pet
        task.spawn(function()
            for _, petName in ipairs(allPets) do
                local args = {
                    petName,
                    "Rich",
                    "Sercert"
                }
                
                local success, err = pcall(function()
                    RewardEvent:FireServer(unpack(args))
                end)
                
                if not success then
                    warn("Lỗi khi lấy " .. petName .. ": " .. tostring(err))
                end
                
                task.wait(0.1) -- Delay an toàn
            end
            Notify("DONE", "Hoàn thành quá trình Claim All!")
        end)
    end)

    Notify("OMEGA UNIT","Loaded Successfully")
end
