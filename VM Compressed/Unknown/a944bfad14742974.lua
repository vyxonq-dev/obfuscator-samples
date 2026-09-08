-- Polerinas GUI | KÜTÜPHANESİZ | FULL MOBİL DESTEK | SÜRÜKLEYİCİ | EXECUTOR UYUMLU
-- Yeşil Arka Plan - Siyah Kenar - Rainbow Animasyonlu Buton Kenarları
-- Küçük Boyut | Her Satırda 4 Buton | Sol Tarafta 2 Buton (R15/R6 + Reset)

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local guiName = "Polerinas"

-- Ana ScreenGui oluştur
local sg = Instance.new("ScreenGui")
sg.Name = guiName
sg.Parent = game.CoreGui
sg.ResetOnSpawn = false

-- Ana Frame (Küçük boyut + Sürükleme)
local main = Instance.new("Frame")
main.Size = UDim2.new(0, 380, 0, 480)
main.Position = UDim2.new(0.5, -190, 0.5, -240)
main.BackgroundColor3 = Color3.fromRGB(30, 100, 30) -- Koyu Yeşil
main.BorderColor3 = Color3.new(0,0,0)
main.BorderSizePixel = 3
main.Active = true
main.Draggable = true
main.Parent = sg

-- Köşe yuvarlama
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

-- Başlık
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,0,0,40)
title.BackgroundTransparency = 1
title.Text = "Polerinas"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 28
title.Font = Enum.Font.GothamBold
title.Parent = main

-- Sol Panel (R15/R6 ve Reset Butonları)
local leftPanel = Instance.new("Frame")
leftPanel.Size = UDim2.new(0.28,0,1,-40)
leftPanel.Position = UDim2.new(0,0,0,40)
leftPanel.BackgroundTransparency = 1
leftPanel.Parent = main

-- R15 to R6 Butonu
local r15r6 = Instance.new("TextButton")
r15r6.Size = UDim2.new(1, -10, 0, 50)
r15r6.Position = UDim2.new(0,5,0,10)
r15r6.BackgroundColor3 = Color3.fromRGB(40, 140, 40)
r15r6.Text = "R15 → R6"
r15r6.TextColor3 = Color3.new(1,1,1)
r15r6.Font = Enum.Font.GothamSemibold
r15r6.TextSize = 18
r15r6.Parent = leftPanel

local r15corner = Instance.new("UICorner", r15r6)
r15corner.CornerRadius = UDim.new(0,8)

r15r6.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-R6-61575"))()
end)

-- Reset Butonu
local resetBtn = Instance.new("TextButton")
resetBtn.Size = UDim2.new(1, -10, 0, 50)
resetBtn.Position = UDim2.new(0,5,0,70)
resetBtn.BackgroundColor3 = Color3.fromRGB(40, 140, 40)
resetBtn.Text = "RESET + TP"
resetBtn.TextColor3 = Color3.new(1,1,1)
resetBtn.Font = Enum.Font.GothamSemibold
resetBtn.TextSize = 18
resetBtn.Parent = leftPanel

local resetCorner = Instance.new("UICorner", resetBtn)
resetCorner.CornerRadius = UDim.new(0,8)

resetBtn.MouseButton1Click:Connect(function()
    local oldPos = player.Character and player.Character.HumanoidRootPart.CFrame
    player.Character:BreakJoints()
    player.CharacterAdded:Wait()
    wait(0.3)
    if oldPos and player.Character then
        player.Character.HumanoidRootPart.CFrame = oldPos
    end
end)

-- Tab Sistemi (Sağ Taraf)
local tabFrame = Instance.new("Frame")
tabFrame.Size = UDim2.new(0.7,0,1,-50)
tabFrame.Position = UDim2.new(0.3,0,0,50)
tabFrame.BackgroundTransparency = 1
tabFrame.Parent = main

-- Tab Butonları (Üstte yatay)
local tabContainer = Instance.new("Frame")
tabContainer.Size = UDim2.new(1,0,0,40)
tabContainer.BackgroundTransparency = 1
tabContainer.Parent = tabFrame

local tabs = {
    "POLERİNAS",
    "Pocket",
    "GUİ",
    "PROJECT",
    "SS"
}

local currentTab = 1
local tabButtons = {}
local tabContents = {}

for i, name in ipairs(tabs) do
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1/#tabs, -6, 1, -4)
    btn.Position = UDim2.new((i-1)/#tabs, 3, 0, 2)
    btn.BackgroundColor3 = Color3.fromRGB(25, 80, 25)
    btn.Text = name
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 16
    btn.Parent = tabContainer
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0,8)
    
    tabButtons[i] = btn
    
    local content = Instance.new("ScrollingFrame")
    content.Size = UDim2.new(1,0,1,-40)
    content.Position = UDim2.new(0,0,0,40)
    content.BackgroundTransparency = 1
    content.ScrollBarThickness = 5
    content.Visible = (i == 1)
    content.Parent = tabFrame
    
    tabContents[i] = content
    
    btn.MouseButton1Click:Connect(function()
        for _, c in ipairs(tabContents) do
            c.Visible = false
        end
        content.Visible = true
    end)
end

-- Rainbow Kenar Animasyonu (Tüm butonlara uygulanacak)
local function rainbowOutline(button)
    local outline = Instance.new("UIStroke")
    outline.Thickness = 2.5
    outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    outline.Parent = button
    
    spawn(function()
        while button.Parent do
            for i = 0, 1, 0.02 do
                outline.Color = Color3.fromHSV(i, 1, 1)
                task.wait(0.03)
            end
        end
    end)
end

-- Butonlara rainbow uygula
for _, btn in pairs(tabButtons) do
    rainbowOutline(btn)
end

-- Buton oluşturma fonksiyonu (Her satırda 4 tane)
local function createButton(parent, text, callback, index)
    local row = math.floor((index-1)/4)
    local col = (index-1)%4
    
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.24, -8, 0, 50)
    btn.Position = UDim2.new(col*0.25, 4, 0, row*60 + 10)
    btn.BackgroundColor3 = Color3.fromRGB(40, 140, 40)
    btn.Text = text
    btn.TextColor3 = Color3.new(1,1,1)
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 15
    btn.TextWrapped = true
    btn.Parent = parent
    
    local btnCorner = Instance.new("UICorner", btn)
    btnCorner.CornerRadius = UDim.new(0,8)
    
    rainbowOutline(btn)
    
    btn.MouseButton1Click:Connect(callback)
end

-- Sekme İçerikleri

-- 1. POLERİNAS
local polerinas = tabContents[1]
createButton(polerinas, "Polerinas Project 2.8", function() loadstring(game:HttpGet("https://pastebin.com/raw/gb9YCPyr"))() end, 1)
createButton(polerinas, "Polerinas Project 2.7", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/jkkkkkkjjjjjjjj/Hhhh/refs/heads/main/PROJECT.27POLER%C4%B0NAD"))() end, 2)
createButton(polerinas, "Polerinas Hub", function() loadstring(game:HttpGet("https://pastebin.com/raw/FB5cRU4r"))() end, 3)
createButton(polerinas, "Polarinas v4", function() loadstring(game:HttpGet("https://pastebin.com/raw/srGPbrdA"))() end, 4)

-- 2. Pocket
local pocket = tabContents[2]
createButton(pocket, "T33p Pocket", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-R15-to-R6-61575"))() end, 1)
createButton(pocket, "BYTE POCKET", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-byt3n1nja-gui-pocket-edition-52138"))() end, 2)
createButton(pocket, "TC0LİFFY POCKET", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tc0liffy-Pocket-v2-38622"))() end, 3)
createButton(pocket, "tc0 V1 pocket", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tcoliffy-Pocket-v1-38367"))() end, 4)
createButton(pocket, "p00l Pocket", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-P00lgui-pocket-edition-33019"))() end, 5)
createButton(pocket, "C00lkidd Pocket", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-pocket-two-point-two-13568"))() end, 6)
createButton(pocket, "c00l pocket V1", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-pocket-edition-13563"))() end, 7)
createButton(pocket, "S33ded Pocket", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-S33dedL0rdz-Gui-v1-Pocket-Edition-11897"))() end, 8)
createButton(pocket, "C00LKİDD MOBİLE", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lgui-mobile-edition-from-GitHub-not-mine-80639"))() end, 9)

-- 3. GUİ
local guiTab = tabContents[3]
createButton(guiTab, "K011kidd 2026", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-k011lkidd-2026-gui-83596"))() end, 1)
createButton(guiTab, "GavindR GUİ", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-GavindR-gui-v1-79303"))() end, 2)
createButton(guiTab, "Tubuss97 🏴", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Tubuus97-Gui-V3-loadstring-81296"))() end, 3)
createButton(guiTab, "4x2x9", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-4x2x9x4x0-v5-gui-53429"))() end, 4)
createButton(guiTab, "Bastet", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Bastets-GUI-V4-51465"))() end, 5)
createButton(guiTab, "bastets V5", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Bastets-GUI-V5-Clientside-51540"))() end, 6)
createButton(guiTab, "Facykid", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ULTIMATE-TROLLING-GUI-V5-39695"))() end, 7)
createButton(guiTab, "Kaax", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-KaaX-gui-v6-43473"))() end, 8)
createButton(guiTab, "k00gui", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-K00pguo-Lua-nothing-works-today-42705"))() end, 9)
createButton(guiTab, "jumpscare Gui", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-jumpscare-gui-v1-40232"))() end, 10)

-- 4. PROJECT
local project = tabContents[4]
createButton(project, "Project Tegma", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Project-tegma-83136"))() end, 1)
createButton(project, "Project Vigma", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Project-vigma-82829"))() end, 2)
createButton(project, "Project Ligma", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Project-ligma-team-secret-leak-56796"))() end, 3)
createButton(project, "Dominant Executor", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Tower-of-hell-project-dominant-serverside-79822"))() end, 4)
createButton(project, "Stigma VE", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ss-executor-46339"))() end, 5)
createButton(project, "GG EXECUTOR", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gg-executor-79018"))() end, 6)

-- 5. SS
local ss = tabContents[5]
createButton(ss, "PAPU SS", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Papu-pro5100-SS-76032"))() end, 1)
createButton(ss, "SS PANEL", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ss-panel-63554"))() end, 2)
createButton(ss, "POLARİNA", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Polaria-LoadString-61107"))() end, 3)
createButton(ss, "broken spawn", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Project-broken-spawn-update-63543"))() end, 4)
createButton(ss, "Harked", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Mermaid-Nature-Classic-Harked-SS-28941"))() end, 5)
createButton(ss, "DEV EXECUTOR", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Defeat-Console-Developer-Executor-Script-32009"))() end, 6)
createButton(ss, "Music", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Music-visualizer-ahh-copy-76101"))() end, 7)
createButton(ss, "İRON SS", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-project-IronHook-76454"))() end, 8)

print("Polerinas GUI YÜKLENDİ! MEGA GÜÇLÜ - MOBİL TAM DESTEK - SÜRÜKLEYİCİ")