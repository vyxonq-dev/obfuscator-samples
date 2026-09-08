-- =========================================================
-- 4EAS Hub | Chicken Farm (LORD4EAS PRIVATE)
-- =========================================================

local WindUI = nil
local urls = {
    "https://tree-hub.vercel.app/api/UI/WindUI",
    "https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"
}

for _, url in ipairs(urls) do
    local success, result = pcall(function() return loadstring(game:HttpGet(url))() end)
    if success and result then WindUI = result break end
end

if not WindUI then
    warn("4EAS Hub: Failed to load UI!")
    return
end

local Window = WindUI:CreateWindow({
    Title = "4EAS | Chicken Farm",
    Author = "by lord4eas",
    Folder = "4EAS_ChickenFarm_Private",
    Size = UDim2.fromOffset(600, 480),
    Theme = "Dark",
})

-- ==========================================
-- SERVICES & VARIABLES
-- ==========================================
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Workspace = game:GetService("Workspace")
local Stats = game:GetService("Stats")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local sessionStartTime = os.time()

local Settings = {
    AutoCollect = false,
    AutoSell = false,
    AutoUpgrade = false,
    AutoMerge = false,
    AutoRebirth = false
}

-- Anti-AFK (Arka planda kalıcı)
LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local function hrp()
    return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end

-- ==========================================
-- OPTIMIZED PAD SCANNER
-- ==========================================
local allPads = {}

task.spawn(function()
    while task.wait(2) do
        local tempPads = {}
        for _, obj in pairs(Workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") then
                table.insert(tempPads, obj)
            end
        end
        allPads = tempPads
    end
end)

local function getPadType(part)
    local textStr = part.Name:lower()
    if part.Parent then textStr = textStr .. " " .. part.Parent.Name:lower() end
    
    local function scanText(parentObj)
        for _, v in pairs(parentObj:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                textStr = textStr .. " " .. v.Text:lower()
            end
        end
    end
    
    scanText(part)
    if part.Parent then scanText(part.Parent) end

    if textStr:match("depola") or textStr:match("para") or textStr:match("sell") or textStr:match("deposit") or textStr:match("nakit") or textStr:match("topla") or textStr:match("cash") or textStr:match("store") then
        return "Sell"
    end
    if textStr:match("birleştir") or textStr:match("merge") or textStr:match("combine") or textStr:match("craft") then
        return "Merge"
    end
    
    return "Drop"
end

-- ==========================================
-- TABS & UI ELEMENTS
-- ==========================================
local HomeTab = Window:Tab({ Title = "Home", Icon = "home" })
local FarmTab = Window:Tab({ Title = "Farming", Icon = "tractor" })
local UpgradeTab = Window:Tab({ Title = "Upgrades", Icon = "arrow-up" })

-- HOME TAB
HomeTab:Paragraph({
    Title = "Hello, I am lord4eas",
    Desc = "Welcome to 4EAS Hub! The ultimate script for Chicken Farm. Sit back, relax, and let the hub do the work for you."
})

local LiveStatsParagraph = HomeTab:Paragraph({
    Title = "📊 Live Status",
    Desc = "Time: 00:00:00 | Ping: 0 ms | FPS: 0"
})

task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local t = os.time() - sessionStartTime
            local h, m, s = math.floor(t/3600), math.floor((t%3600)/60), t%60
            local ping = math.round(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
            local fps = math.round(1 / RunService.RenderStepped:Wait())
            LiveStatsParagraph:SetDesc(string.format("Time: %02d:%02d:%02d\nPing: %d ms\nFPS: %d", h, m, s, ping, fps))
        end)
    end
end)

HomeTab:Button({ 
    Title = "Join My Discord Server", 
    Callback = function() 
        setclipboard("https://discord.gg/F4DQ28548") 
        WindUI:Notify({ Title = "4EAS", Content = "Discord link copied to clipboard!", Duration = 3 })
    end 
})

-- FARMING TAB
FarmTab:Toggle({ Title = "Auto Collect Eggs (Only Drops)", Default = false, Callback = function(v) Settings.AutoCollect = v end })
FarmTab:Toggle({ Title = "Auto Sell & Deposit Money", Default = false, Callback = function(v) Settings.AutoSell = v end })

-- UPGRADES TAB
UpgradeTab:Toggle({ Title = "Auto Buy Level Upgrades (TP)", Default = false, Callback = function(v) Settings.AutoUpgrade = v end })
UpgradeTab:Toggle({ Title = "Auto Merge Chickens", Default = false, Callback = function(v) Settings.AutoMerge = v end })
UpgradeTab:Toggle({ Title = "Auto Rebirth", Default = false, Callback = function(v) Settings.AutoRebirth = v end })

-- ==========================================
-- LOOPS (DÖNGÜLER)
-- ==========================================

-- 1. Auto Collect
task.spawn(function()
    while task.wait(0.2) do
        if Settings.AutoCollect and hrp() then
            pcall(function()
                for _, item in pairs(allPads) do
                    if item.Size.Magnitude < 10 then
                        if getPadType(item) == "Drop" and not item:FindFirstChildWhichIsA("SurfaceGui", true) and not item:FindFirstChildWhichIsA("BillboardGui", true) then
                            firetouchinterest(hrp(), item, 0)
                            task.wait(0.01)
                            firetouchinterest(hrp(), item, 1)
                        end
                    end
                end
            end)
        end
    end
end)

-- 2. Auto Sell
task.spawn(function()
    while task.wait(0.5) do
        if Settings.AutoSell and hrp() then
            pcall(function()
                for _, pad in pairs(allPads) do
                    if getPadType(pad) == "Sell" then
                        firetouchinterest(hrp(), pad, 0)
                        task.wait(0.02)
                        firetouchinterest(hrp(), pad, 1)
                    end
                end
            end)
        end
    end
end)

-- 3. Auto Upgrade (SADECE RESİMDEKİ 100/1000 LEVEL UPGRADE PEDİNE TP)
task.spawn(function()
    while task.wait(0.1) do
        if hrp() then
            pcall(function()
                if Settings.AutoUpgrade then
                    local targetPad = nil
                    local minDist = 1500
                    
                    for _, pad in pairs(allPads) do
                        if pad.Parent then
                            local textStr = ""
                            for _, desc in pairs(pad.Parent:GetDescendants()) do
                                if desc:IsA("TextLabel") then textStr = textStr .. " " .. desc.Text:lower() end
                            end
                            for _, desc in pairs(pad:GetDescendants()) do
                                if desc:IsA("TextLabel") then textStr = textStr .. " " .. desc.Text:lower() end
                            end
                            
                            -- Resimdeki "Yükseltme Satın Alma Seviyesi", "Tavuklar" ve "102 / 10,000" gibi metinleri filtreler
                            if (textStr:match("yükseltme") or textStr:match("seviye") or textStr:match("tavuklar") or textStr:match("%d+%s*%/") or textStr:match("%d+/%d+")) 
                               and not textStr:match("satın al") and not textStr:match("otomatik") and not textStr:match("25") and not textStr:match("100 satın") then
                                
                                local dist = (hrp().Position - pad.Position).Magnitude
                                if dist < minDist then
                                    minDist = dist
                                    targetPad = pad
                                end
                            end
                        end
                    end
                    
                    -- Yükseltme pedine TP At ve Dokun
                    if targetPad then
                        hrp().CFrame = CFrame.new(targetPad.Position + Vector3.new(0, 3, 0))
                        firetouchinterest(hrp(), targetPad, 0)
                        task.wait(0.01)
                        firetouchinterest(hrp(), targetPad, 1)
                    end
                    
                    -- Arka plandaki remote istekleri
                    for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                        if v:IsA("RemoteEvent") then
                            local name = v.Name:lower()
                            if name:match("upgrade") or name:match("level") or name:match("tier") or name:match("chicken") then
                                v:FireServer("All")
                                v:FireServer(1)
                                v:FireServer()
                            end
                        end
                    end
                end
                
                -- Merge İşlemi
                if Settings.AutoMerge then
                    for _, pad in pairs(allPads) do
                        if getPadType(pad) == "Merge" then
                            firetouchinterest(hrp(), pad, 0)
                            task.wait(0.02)
                            firetouchinterest(hrp(), pad, 1)
                        end
                    end
                end
            end)
        end
    end
end)

-- 4. Auto Rebirth (Kesinleştiriş UI + Remote Sistem)
task.spawn(function()
    while task.wait(0.5) do
        if Settings.AutoRebirth then
            pcall(function()
                -- Ekranda "Yeniden doğuş" butonu ve onay pencerelerini tıklama
                for _, gui in pairs(LocalPlayer.PlayerGui:GetDescendants()) do
                    if (gui:IsA("TextButton") or gui:IsA("ImageButton")) and gui.Visible then
                        local text = ""
                        if gui:IsA("TextButton") then text = gui.Text:lower() end
                        for _, child in pairs(gui:GetDescendants()) do
                            if child:IsA("TextLabel") then text = text .. " " .. child.Text:lower() end
                        end
                        if gui.Parent and gui.Parent:IsA("GuiObject") then
                            for _, child in pairs(gui.Parent:GetChildren()) do
                                if child:IsA("TextLabel") then text = text .. " " .. child.Text:lower() end
                            end
                        end
                        
                        -- Ekranda "Yeniden doğuş", "Rebirth", "Evet", "Confirm" vb. arama
                        if text:match("yeniden") or text:match("doğuş") or text:match("rebirth") or text:match("confirm") or text:match("evet") then
                            if getconnections then
                                for _, conn in pairs(getconnections(gui.MouseButton1Click)) do conn:Fire() end
                                for _, conn in pairs(getconnections(gui.Activated)) do conn:Fire() end
                            end
                            
                            -- Sanal Dokunma/Tıklama simülasyonu
                            local pos = gui.AbsolutePosition
                            local size = gui.AbsoluteSize
                            if pos.X > 0 and pos.Y > 0 then
                                local centerX = pos.X + (size.X / 2)
                                local centerY = pos.Y + (size.Y / 2) + 36
                                VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
                                task.wait(0.05)
                                VirtualInputManager:SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
                            end
                        end
                    end
                end
                
                -- RemoteEvent Tetiklemeleri
                for _, v in pairs(ReplicatedStorage:GetDescendants()) do
                    if v:IsA("RemoteEvent") then
                        local name = v.Name:lower()
                        if name:match("rebirth") or name:match("prestige") or name:match("reset") or name:match("yeniden") then
                            v:FireServer(1)
                            v:FireServer(true)
                            v:FireServer()
                        end
                    elseif v:IsA("RemoteFunction") then
                        local name = v.Name:lower()
                        if name:match("rebirth") or name:match("prestige") then
                            v:InvokeServer(1)
                            v:InvokeServer()
                        end
                    end
                end
            end)
        end
    end
end)

-- SAĞ ALTTAKİ İNGİLİZCE BİLDİRİM
WindUI:Notify({ Title = "4EAS Hub", Content = "Script successfully executed. Rebirth & Upgrades updated!", Duration = 4 })
