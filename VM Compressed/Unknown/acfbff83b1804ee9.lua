-- =============================
-- PELIMEN HUB + KEY SYSTEM + BACKGROUND SCRIPT
-- =============================

local player = game.Players.LocalPlayer
local sg = game:GetService("StarterGui")
local run = game:GetService("RunService")

-- =============================
-- KEY SISTEM
-- =============================

local CORRECT_KEY = "1234567"
local KEY_LINK = "https://www.youtube.com/@michaelsherlock04"
local UNLOCKED = false

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "pelimenHub"

-- Dugme P za key system
local iconBtn = Instance.new("TextButton", gui)
iconBtn.Size = UDim2.new(0, 50, 0, 50)
iconBtn.Position = UDim2.new(0, 10, 0, 10)
iconBtn.Text = "P"
iconBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
iconBtn.TextColor3 = Color3.fromRGB(255, 0, 0)
iconBtn.Font = Enum.Font.Fantasy
iconBtn.TextSize = 30
iconBtn.AutoButtonColor = false
iconBtn.BorderSizePixel = 0
iconBtn.BackgroundTransparency = 0.1
Instance.new("UICorner", iconBtn).CornerRadius = UDim.new(0, 12)

-- Key frame
local keyFrame = Instance.new("Frame", gui)
keyFrame.Size = UDim2.new(0, 260, 0, 150)
keyFrame.Position = UDim2.new(0, 70, 0, 10)
keyFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
keyFrame.Visible = true
keyFrame.Active = true
keyFrame.Draggable = true
Instance.new("UICorner", keyFrame).CornerRadius = UDim.new(0, 10)

local keyLabel = Instance.new("TextLabel", keyFrame)
keyLabel.Size = UDim2.new(1, 0, 0, 30)
keyLabel.Text = "Enter Key to Unlock"
keyLabel.TextColor3 = Color3.new(1,1,1)
keyLabel.Font = Enum.Font.SourceSansBold
keyLabel.TextSize = 20
keyLabel.BackgroundTransparency = 1

local keyBox = Instance.new("TextBox", keyFrame)
keyBox.Size = UDim2.new(0, 200, 0, 30)
keyBox.Position = UDim2.new(0, 30, 0, 50)
keyBox.PlaceholderText = "Paste Key Here"
keyBox.Font = Enum.Font.SourceSans
keyBox.TextSize = 18
keyBox.TextColor3 = Color3.new(1,1,1)
keyBox.BackgroundColor3 = Color3.fromRGB(50,50,50)
keyBox.Text = ""

local submitBtn = Instance.new("TextButton", keyFrame)
submitBtn.Size = UDim2.new(0, 100, 0, 30)
submitBtn.Position = UDim2.new(0, 80, 0, 90)
submitBtn.Text = "Unlock"
submitBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
submitBtn.TextColor3 = Color3.new(1,1,1)
submitBtn.Font = Enum.Font.SourceSansBold
submitBtn.TextSize = 18

local getKeyBtn = Instance.new("TextButton", keyFrame)
getKeyBtn.Size = UDim2.new(0, 100, 0, 20)
getKeyBtn.Position = UDim2.new(0.5, -50, 1, -25)
getKeyBtn.Text = "Get Key"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
getKeyBtn.TextColor3 = Color3.new(1,1,1)
getKeyBtn.Font = Enum.Font.SourceSans
getKeyBtn.TextSize = 14

-- ✅ Changed this part only (copy YouTube link)
getKeyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard(KEY_LINK)
        sg:SetCore("SendNotification", {Title="Copied!", Text="YouTube link copied!", Duration=3})
    end)
end)

-- =============================
-- FUNKCIJA ZA UČITAVANJE GLAVNE SKRIPTE U POZADINI
-- =============================

local function loadMainScript()
    loadstring(game:HttpGet("https://pastefy.app/aGAtBXLu/raw"))()
    local function applyTextFilters(obj)
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            obj.Text = obj.Text:gsub("[Gg][Oo][Dd]", "???")
            obj.Text = obj.Text:gsub("DelfiScript", "Steal a Brainrot")
        end
        if obj:IsA("ScreenGui") or obj:IsA("SurfaceGui") or obj:IsA("BillboardGui") then
            for _, child in pairs(obj:GetDescendants()) do
                applyTextFilters(child)
            end
        end
    end
    local function monitorTextFilters(parent)
        for _, obj in pairs(parent:GetDescendants()) do
            applyTextFilters(obj)
        end
        parent.DescendantAdded:Connect(applyTextFilters)
    end
    local function replaceDelfiScriptIcon(obj)
        if (obj:IsA("TextLabel") or obj:IsA("TextButton")) and obj.Text == "DELFISCRIPT" then
            -- radi u pozadini, ništa se ne prikazuje
        end
        if obj:IsA("ImageLabel") or obj:IsA("ImageButton") then
            if obj.Name:lower():find("delfiscript") then
                obj.Image = "" -- sakrij sliku
            end
        end
        if obj:IsA("ScreenGui") or obj:IsA("SurfaceGui") or obj:IsA("BillboardGui") then
            for _, child in pairs(obj:GetDescendants()) do
                replaceDelfiScriptIcon(child)
            end
        end
    end
    local function monitorDelfiIcon(parent)
        for _, obj in pairs(parent:GetDescendants()) do
            replaceDelfiScriptIcon(obj)
        end
        parent.DescendantAdded:Connect(replaceDelfiScriptIcon)
    end
    monitorTextFilters(game.CoreGui)
    monitorTextFilters(player.PlayerGui)
    monitorTextFilters(game.Workspace)
    monitorDelfiIcon(game.CoreGui)
    monitorDelfiIcon(player.PlayerGui)
end

-- =============================
-- KEY UNLOCK LOGIKA
-- =============================

submitBtn.MouseButton1Click:Connect(function()
    if keyBox.Text == CORRECT_KEY then
        UNLOCKED = true
        keyFrame.Visible = false
        iconBtn:Destroy()
        loadMainScript()
    else
        keyBox.Text = "Wrong Key!"
    end
end)

-- Dugme P toggle
iconBtn.MouseButton1Click:Connect(function()
    if not UNLOCKED then
        keyFrame.Visible = not keyFrame.Visible
    end
end)
