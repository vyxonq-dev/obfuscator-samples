-- =============================================
-- BUILD SAVER V19.6 (LOCK & DRAG FIX + RESTORE)
-- =============================================

local player = game.Players.LocalPlayer
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera

local REMOTE_NAME = "BuildPlank"
local FOLDER_NAME = "GefBuildSaverBuilds"
local DEFAULT_NAME = "Unnamed Build"
local ROAD_PART = workspace.Road and workspace.Road:GetChildren()[114] or nil

-- State Variables
local offsetX, offsetY, offsetZ = 0, 0, 0
local tmpGx, tmpGy, tmpGz = 0, 0, 0
local rotX, rotY = 0, 0
local buildMode = "SamePos" 

_G.SavedBuildsMemory = {} 
local savedBuilds = _G.SavedBuildsMemory
local isLoading = false
local selectedFile = nil
local showPreview = false
local currentPreviewItems = {}

local recordingActive = false
local loadFileOffsets = true 
local autoClearOnLoad = true
local deleteModeActive = false
local globalTransparency = 0.8
local isMinimized = false

local gridEnabled = false
local gridPosStep = 1
local gridRotStep = 45
local lastDeletedFileData = nil 

if not isfolder(FOLDER_NAME) then makefolder(FOLDER_NAME) end

_G.PlankPreviewActionsList = _G.PlankPreviewActionsList or {}
getgenv().ClearPlankPreviewActionList = function() table.clear(_G.PlankPreviewActionsList) end

-- Math Engine
local function snap(val, step)
    if step <= 0 then return val end
    return math.floor(val / step + 0.5) * step
end

local function getBuildCenter()
    if #savedBuilds == 0 then return player.Character and player.Character.PrimaryPart.Position or Vector3.new(0,0,0) end
    local minX, minY, minZ = math.huge, math.huge, math.huge
    local maxX, maxY, maxZ = -math.huge, -math.huge, -math.huge
    for _, b in ipairs(savedBuilds) do
        for _, pos in ipairs({b[1], b[2]}) do
            minX = math.min(minX, pos.X); maxX = math.max(maxX, pos.X)
            minY = math.min(minY, pos.Y); maxY = math.max(maxY, pos.Y)
            minZ = math.min(minZ, pos.Z); maxZ = math.max(maxZ, pos.Z)
        end
    end
    return Vector3.new((minX + maxX)/2, (minY + maxY)/2, (minZ + maxZ)/2)
end

local function getBaseCFrame()
    local buildCenter = getBuildCenter()
    local targetPos = buildCenter
    local rotationCF = CFrame.Angles(0, 0, 0)
    if buildMode == "Front" then
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then
            local charCF = root.CFrame
            local _, py, _ = charCF:ToEulerAnglesYXZ()
            local yDeg = math.deg(py)
            if gridEnabled then yDeg = snap(yDeg, gridRotStep) end
            rotationCF = CFrame.Angles(0, math.rad(yDeg), 0)
            local directionCF = CFrame.new(charCF.Position) * rotationCF
            targetPos = (directionCF * CFrame.new(0, 0, -10)).Position
        end
    end
    if gridEnabled then targetPos = Vector3.new(snap(targetPos.X, gridPosStep), snap(targetPos.Y, gridPosStep), snap(targetPos.Z, gridPosStep)) end
    local finalRotation = rotationCF * CFrame.Angles(math.rad(rotX), math.rad(rotY), 0)
    local relGridMove = Vector3.new(tmpGx * gridPosStep, tmpGy * gridPosStep, -tmpGz * gridPosStep)
    return CFrame.new(targetPos) * finalRotation * CFrame.new(offsetX, offsetY, offsetZ) * CFrame.new(relGridMove)
end

local function runBuild()
    if isLoading or #savedBuilds == 0 then return end
    isLoading = true
    local center = getBuildCenter(); local baseCF = getBaseCFrame()
    local hammer = player.Character and player.Character:FindFirstChild("Hammer")
    local remote = hammer and hammer:FindFirstChild(REMOTE_NAME)
    if not remote then isLoading = false return end
    task.spawn(function()
        for i = 1, #savedBuilds, 15 do
            for j = i, math.min(i + 14, #savedBuilds) do
                local b = savedBuilds[j]; local dist = (b[2] - b[1]).Magnitude
                local origCF = CFrame.lookAt((b[1] + b[2])/2, b[2], b[5] or Vector3.new(0,1,0))
                local relativeCF = CFrame.new(center):Inverse() * origCF
                local finalCF = baseCF * relativeCF
                remote:FireServer((finalCF * CFrame.new(0,0,-dist/2)).Position, (finalCF * CFrame.new(0,0,dist/2)).Position, ROAD_PART, ROAD_PART, finalCF.UpVector)
            end
            RunService.Heartbeat:Wait()
        end
        isLoading = false
    end)
end

-- GUI SETUP
local gui = Instance.new("ScreenGui", player.PlayerGui); gui.ResetOnSpawn = false
local main = Instance.new("Frame", gui)
main.Size, main.Position = UDim2.new(0, 220, 0, 810), UDim2.new(0.05, 0, 0.05, 0)
main.BackgroundColor3, main.BorderSizePixel, main.Active, main.ClipsDescendants = Color3.fromRGB(30,30,30), 0, true, true

local titleBar = Instance.new("Frame", main); titleBar.Size, titleBar.BackgroundColor3 = UDim2.new(1, 0, 0, 30), Color3.fromRGB(20, 20, 20)
titleBar.Active = true -- Important for mobile
local titleTxt = Instance.new("TextLabel", titleBar); titleTxt.Size, titleTxt.Text = UDim2.new(1, -60, 1, 0), "BUILDER V19.6"
titleTxt.TextColor3, titleTxt.BackgroundTransparency, titleTxt.Font = Color3.new(1,1,1), 1, Enum.Font.SourceSansBold
titleTxt.Position, titleTxt.TextXAlignment = UDim2.new(0, 8, 0, 0), Enum.TextXAlignment.Left

local minBtn = Instance.new("TextButton", titleBar); minBtn.Size, minBtn.Position = UDim2.new(0, 25, 0, 25), UDim2.new(1, -27, 0, 2)
minBtn.Text, minBtn.BackgroundColor3, minBtn.TextColor3 = "-", Color3.fromRGB(50,50,50), Color3.new(1,1,1)

local mainLockBtn = Instance.new("TextButton", titleBar); mainLockBtn.Size, mainLockBtn.Position = UDim2.new(0, 25, 0, 25), UDim2.new(1, -55, 0, 2)
mainLockBtn.Text, mainLockBtn.BackgroundColor3, mainLockBtn.TextColor3 = "🔓", Color3.fromRGB(100,100,100), Color3.new(1,1,1)
local mainLocked = false
mainLockBtn.MouseButton1Click:Connect(function()
    mainLocked = not mainLocked
    mainLockBtn.Text = mainLocked and "🔒" or "🔓"
    mainLockBtn.BackgroundColor3 = mainLocked and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(100, 100, 100)
end)

-- MAIN GUI DRAG FIX (WITH TOUCH)
local dragMain, dragStartMain, startPosMain
titleBar.InputBegan:Connect(function(input)
    if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) and not mainLocked then
        dragMain = true; dragStartMain = input.Position; startPosMain = main.Position
        input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then dragMain = false end end)
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragMain and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStartMain
        main.Position = UDim2.new(startPosMain.X.Scale, startPosMain.X.Offset + delta.X, startPosMain.Y.Scale, startPosMain.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragMain = false
    end
end)

local scroll = Instance.new("ScrollingFrame", main); scroll.Size, scroll.Position = UDim2.new(1, -10, 1, -40), UDim2.new(0, 5, 0, 35)
scroll.BackgroundTransparency, scroll.ScrollBarThickness = 1, 4
Instance.new("UIListLayout", scroll).Padding = UDim.new(0, 5)

local function createBtn(txt, color)
    local b = Instance.new("TextButton", scroll); b.Size, b.BackgroundColor3 = UDim2.new(1, -6, 0, 30), color
    b.Text, b.TextColor3, b.Font, b.TextScaled = txt, Color3.new(1, 1, 1), Enum.Font.SourceSansBold, true
    b.BorderSizePixel = 0; return b
end

local function createInput(label)
    local f = Instance.new("Frame", scroll); f.Size, f.BackgroundTransparency = UDim2.new(1, -6, 0, 25), 1
    local l = Instance.new("TextLabel", f); l.Size, l.Text = UDim2.new(0.4, 0, 1, 0), label
    l.TextColor3, l.BackgroundTransparency, l.TextXAlignment = Color3.new(1,1,1), 1, Enum.TextXAlignment.Left
    local b = Instance.new("TextBox", f); b.Size, b.Position = UDim2.new(0.6, 0, 1, 0), UDim2.new(0.4, 0, 0, 0)
    b.BackgroundColor3, b.TextColor3, b.Text = Color3.fromRGB(50, 50, 50), Color3.new(1, 1, 1), "0"
    b.ClearTextOnFocus = false; b.BorderSizePixel = 0; return b
end

-- MAIN BUTTONS
local recBtn = createBtn("RECORD: OFF (0)", Color3.fromRGB(150, 0, 0))
local mainBuildBtn = createBtn("CONSTRUCT BUILD", Color3.fromRGB(40, 40, 150))
local tpBtn = createBtn("Tp To Build Pos", Color3.fromRGB(100, 100, 0))
local delClickBtn = createBtn("Delete Preview Plank (Click): OFF", Color3.fromRGB(180, 80, 0))
local floatToggle = createBtn("Separated Control Buttons: OFF", Color3.fromRGB(0, 150, 150))
local autoClearBtn = createBtn("Auto Clear (On Load): ON", Color3.fromRGB(150, 100, 0))
local modeBtn = createBtn("Mode: Same Pos", Color3.fromRGB(150, 100, 0))
local gridBtn = createBtn("Grid: OFF", Color3.fromRGB(0, 120, 120))
local previewBtn = createBtn("Preview: OFF", Color3.fromRGB(80, 40, 100))

local previewTransIn = createInput("Preview Trans:"); previewTransIn.Text = "0.8"
local gridPosIn = createInput("GridPos:"); gridPosIn.Text = "1"
local gridRotIn = createInput("GridRot:"); gridRotIn.Text = "45"
local boxX = createInput("Move X:"); local boxY = createInput("Move Y:"); local boxZ = createInput("Move Z:")
local boxRotX = createInput("Rot X:"); local boxRotY = createInput("Rot Y:")
local loadOffsetToggleBtn = createBtn("Load Offsets: ON", Color3.fromRGB(0, 120, 0))
local clearBtn = createBtn("Clear Memory", Color3.fromRGB(100, 30, 30))
local nameBox = Instance.new("TextBox", scroll); nameBox.Size, nameBox.BackgroundColor3, nameBox.Text = UDim2.new(1,-6,0,30), Color3.fromRGB(45,45,45), DEFAULT_NAME; nameBox.TextColor3, nameBox.ClearTextOnFocus, nameBox.BorderSizePixel = Color3.new(1,1,1), false, 0
local mainSearchBox = Instance.new("TextBox", scroll); mainSearchBox.Size, mainSearchBox.BackgroundColor3 = UDim2.new(1,-6,0,25), Color3.fromRGB(60,60,60); mainSearchBox.Text, mainSearchBox.TextColor3 = "Filter...", Color3.fromRGB(200,200,200)

local fileScroll = Instance.new("ScrollingFrame", scroll); fileScroll.Size, fileScroll.BackgroundColor3 = UDim2.new(1,-6,0,100), Color3.fromRGB(20,20,20); fileScroll.ScrollBarThickness = 4
local fLayout = Instance.new("UIListLayout", fileScroll); fLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() fileScroll.CanvasSize = UDim2.new(0, 0, 0, fLayout.AbsoluteContentSize.Y) end)

local saveFileBtn = createBtn("Save to File", Color3.fromRGB(40, 120, 40))
local loadFileBtn = createBtn("Load & Merge", Color3.fromRGB(40, 80, 150))
local deleteFileBtn = createBtn("DELETE FILE", Color3.fromRGB(150, 40, 40))
local restoreBtn = createBtn("Restore Last Deleted File", Color3.fromRGB(60, 60, 60))

-- DRAGGABLE BUILD BUTTON + LOCK
local floatFrame = Instance.new("Frame", gui); floatFrame.Size, floatFrame.Position, floatFrame.Visible = UDim2.new(0, 65, 0, 65), UDim2.new(0.5, -32, 0.8, 0), false; floatFrame.BackgroundTransparency = 1
local quickBuildBtn = Instance.new("TextButton", floatFrame); quickBuildBtn.Size, quickBuildBtn.BackgroundColor3, quickBuildBtn.Text = UDim2.new(1,0,1,0), Color3.fromRGB(0, 170, 255), "BUILD"
quickBuildBtn.Font, quickBuildBtn.TextScaled, quickBuildBtn.TextColor3 = Enum.Font.SourceSansBold, true, Color3.new(1,1,1); Instance.new("UICorner", quickBuildBtn).CornerRadius = UDim.new(1,0)
local buildLockBtn = Instance.new("TextButton", floatFrame); buildLockBtn.Size, buildLockBtn.Position = UDim2.new(0, 22, 0, 22), UDim2.new(1, -12, 0, -10); buildLockBtn.Text, buildLockBtn.BackgroundColor3 = "🔓", Color3.fromRGB(100, 100, 100); buildLockBtn.ZIndex = 5; Instance.new("UICorner", buildLockBtn).CornerRadius = UDim.new(0.5, 0)
local buildLocked = false; buildLockBtn.MouseButton1Click:Connect(function() buildLocked = not buildLocked; buildLockBtn.Text = buildLocked and "🔒" or "🔓"; buildLockBtn.BackgroundColor3 = buildLocked and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(100, 100, 100) end)
local dF, dS, sP; quickBuildBtn.InputBegan:Connect(function(i) if (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) and not buildLocked then dF, dS, sP = true, i.Position, floatFrame.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dF = false end end) end end)
UIS.InputChanged:Connect(function(i) if dF and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local d = i.Position - dS; floatFrame.Position = UDim2.new(sP.X.Scale, sP.X.Offset + d.X, sP.Y.Scale, sP.Y.Offset + d.Y) end end)
-- MINI FLOATS WITH LOCKS
local miniButtons = {}
local function createMiniFloat(txt, color, xOff, yOff, action)
    local f = Instance.new("Frame", gui); f.Size, f.Position, f.Visible = UDim2.new(0, 48, 0, 48), UDim2.new(0.5, xOff, 0.5, yOff), false; f.BackgroundTransparency = 1
    local b = Instance.new("TextButton", f); b.Size, b.BackgroundColor3, b.Text = UDim2.new(1,0,1,0), color, txt
    b.Font, b.TextScaled, b.TextColor3 = Enum.Font.SourceSansBold, true, Color3.new(1,1,1); Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)
    local lk = Instance.new("TextButton", f); lk.Size, lk.Position = UDim2.new(0, 20, 0, 20), UDim2.new(1, -10, 0, -8); lk.Text, lk.BackgroundColor3 = "🔓", Color3.fromRGB(100,100,100); lk.ZIndex = 5; Instance.new("UICorner", lk).CornerRadius = UDim.new(0.5, 0)
    local lock = false; lk.MouseButton1Click:Connect(function() lock = not lock; lk.Text = lock and "🔒" or "🔓"; lk.BackgroundColor3 = lock and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(100, 100, 100) end)
    b.MouseButton1Click:Connect(action); table.insert(miniButtons, f)
    local d, ds, sp; b.InputBegan:Connect(function(i) if (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) and not lock then d, ds, sp = true, i.Position, f.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then d = false end end) end end)
    UIS.InputChanged:Connect(function(i) if d and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local delta = i.Position - ds; f.Position = UDim2.new(sp.X.Scale, sp.X.Offset + delta.X, sp.Y.Scale, sp.Y.Offset + delta.Y) end end)
end
createMiniFloat("+Gx", Color3.fromRGB(0, 150, 0), -120, -60, function() tmpGx = tmpGx + 1 end)
createMiniFloat("-Gx", Color3.fromRGB(150, 0, 0), -120, 0, function() tmpGx = tmpGx - 1 end)
createMiniFloat("+Gy", Color3.fromRGB(0, 180, 180), -60, -60, function() tmpGy = tmpGy + 1 end)
createMiniFloat("-Gy", Color3.fromRGB(0, 100, 100), -60, 0, function() tmpGy = tmpGy - 1 end)
createMiniFloat("+Gz", Color3.fromRGB(180, 180, 0), 0, -60, function() tmpGz = tmpGz + 1 end)
createMiniFloat("-Gz", Color3.fromRGB(100, 100, 0), 0, 0, function() tmpGz = tmpGz - 1 end)
createMiniFloat("R", Color3.fromRGB(150, 150, 150), 60, -30, function() tmpGx, tmpGy, tmpGz = 0, 0, 0 end)

-- QUICK LOADER WITH LOCK
local qbFrame = Instance.new("Frame", gui); qbFrame.Size, qbFrame.Position, qbFrame.Visible = UDim2.new(0, 180, 0, 250), UDim2.new(0.6, 0, 0.4, 0), false; qbFrame.BackgroundColor3 = Color3.new(1,1,1); qbFrame.BorderSizePixel = 2
local qbTitle = Instance.new("TextLabel", qbFrame); qbTitle.Size, qbTitle.Text = UDim2.new(1,0,0,30), "Quick Loader"; qbTitle.BackgroundColor3 = Color3.fromRGB(220,220,220)
local qbLk = Instance.new("TextButton", qbFrame); qbLk.Size, qbLk.Position = UDim2.new(0, 20, 0, 20), UDim2.new(1, -22, 0, 5); qbLk.Text, qbLk.BackgroundColor3 = "🔓", Color3.fromRGB(100, 100, 100)
local qbLocked = false; qbLk.MouseButton1Click:Connect(function() qbLocked = not qbLocked; qbLk.Text = qbLocked and "🔒" or "🔓"; qbLk.BackgroundColor3 = qbLocked and Color3.fromRGB(200, 50, 50) or Color3.fromRGB(100, 100, 100) end)
local qbSearch = Instance.new("TextBox", qbFrame); qbSearch.Size, qbSearch.Position = UDim2.new(1,-10,0,25), UDim2.new(0,5,0,35); qbSearch.Text = "Filter..."
local qbScroll = Instance.new("ScrollingFrame", qbFrame); qbScroll.Size, qbScroll.Position = UDim2.new(1,-10,1,-70), UDim2.new(0,5,0,65); qbScroll.BackgroundTransparency = 1; 
local qbLayout = Instance.new("UIListLayout", qbScroll)
qbLayout.Padding = UDim.new(0,5)
qbLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() qbScroll.CanvasSize = UDim2.new(0, 0, 0, qbLayout.AbsoluteContentSize.Y) end)
createMiniFloat("🛠️", Color3.new(1,1,1), 120, -60, function() qbFrame.Visible = not qbFrame.Visible end)
local qD, qDs, qSp; qbTitle.InputBegan:Connect(function(i) if (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) and not qbLocked then qD, qDs, qSp = true, i.Position, qbFrame.Position; i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then qD = false end end) end end)
UIS.InputChanged:Connect(function(i) if qD and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then local delta = i.Position - qDs; qbFrame.Position = UDim2.new(qSp.X.Scale, qSp.X.Offset + delta.X, qSp.Y.Scale, qSp.Y.Offset + delta.Y) end end)
local function loadFileCore(f) 
    if autoClearOnLoad then table.clear(savedBuilds) end 
    local c = readfile(FOLDER_NAME .. "/" .. f .. ".txt")
    if loadFileOffsets then 
        gridPosIn.Text = c:match("GridPos: ([%d.-]+)") or gridPosIn.Text
        gridRotIn.Text = c:match("GridRot: ([%d.-]+)") or gridRotIn.Text
        boxX.Text = c:match("MoveX: ([%d.-]+)") or boxX.Text
        boxY.Text = c:match("MoveY: ([%d.-]+)") or boxY.Text
        boxZ.Text = c:match("MoveZ: ([%d.-]+)") or boxZ.Text
        boxRotX.Text = c:match("RotX: ([%d.-]+)") or boxRotX.Text
        boxRotY.Text = c:match("RotY: ([%d.-]+)") or boxRotY.Text
    end 
    local func = loadstring(c:sub(c:find("return") or 1))
    if func then 
        local s, d = pcall(func)
        if s and type(d) == "table" then 
            table.move(d, 1, #d, #savedBuilds + 1, savedBuilds) 
        end 
    end 
end
local function refreshFiles()
    for _, v in ipairs(fileScroll:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    for _, v in ipairs(qbScroll:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
    local mF = mainSearchBox.Text:lower():gsub("filter%.%.%.", ""); local qF = qbSearch.Text:lower():gsub("filter%.%.%.", "")
    for _, p in ipairs(listfiles(FOLDER_NAME)) do 
        local n = p:match("([^/\\]+)%.txt$"); if n then 
            if mF == "" or n:lower():sub(1, #mF) == mF then
                local b = Instance.new("TextButton", fileScroll); b.Size, b.Text = UDim2.new(1, 0, 0, 20), n; b.BackgroundColor3 = (selectedFile == n) and Color3.fromRGB(60,120,60) or Color3.fromRGB(30,30,30); b.TextColor3 = Color3.new(1,1,1)
                b.MouseButton1Click:Connect(function() if selectedFile == n then selectedFile, nameBox.Text = nil, DEFAULT_NAME else selectedFile, nameBox.Text = n, n end refreshFiles() end)
            end
            if qF == "" or n:lower():sub(1, #qF) == qF then local qB = Instance.new("TextButton", qbScroll); qB.Size, qB.Text = UDim2.new(1, 0, 0, 25), n; qB.MouseButton1Click:Connect(function() loadFileCore(n) end) end
        end 
    end
end

-- PLUGINS & LISTENERS
getgenv().MovePlankPreview = function(p, v) local i = typeof(p) == "number" and p or table.find(currentPreviewItems, p); if i and savedBuilds[i] then local off = Vector3.new(v[1], v[2], v[3]); savedBuilds[i][1] = savedBuilds[i][1] + off; savedBuilds[i][2] = savedBuilds[i][2] + off end end
getgenv().RotatePlankPreview = function(p, v) local i = typeof(p) == "number" and p or table.find(currentPreviewItems, p); if i and savedBuilds[i] then local cen = (savedBuilds[i][1] + savedBuilds[i][2]) / 2; local nCF = CFrame.new(cen) * CFrame.fromEulerAnglesYXZ(math.rad(v[1]), math.rad(v[2]), math.rad(v[3])); local d = (savedBuilds[i][2] - savedBuilds[i][1]).Magnitude / 2; savedBuilds[i][1] = (nCF * CFrame.new(0, 0, d)).Position; savedBuilds[i][2] = (nCF * CFrame.new(0, 0, -d)).Position; savedBuilds[i][5] = nCF.UpVector end end
getgenv().DeletePlankPreview = function(p) local i = typeof(p) == "number" and p or table.find(currentPreviewItems, p); if i and savedBuilds[i] then table.remove(savedBuilds, i); if typeof(p) == "Instance" then p:Destroy() end; table.remove(currentPreviewItems, i) end end
getgenv().ClonePlankPreview = function(p) local i = typeof(p) == "number" and p or table.find(currentPreviewItems, p); if i and savedBuilds[i] then local o = savedBuilds[i]; table.insert(savedBuilds, {o[1], o[2], o[3], o[4], o[5]}); return #savedBuilds end end
getgenv().NewPlankPreview = function(p1, p2, e3, e4, uv) table.insert(savedBuilds, {Vector3.new(p1[1], p1[2], p1[3]), Vector3.new(p2[1], p2[2], p2[3]), e3 or ROAD_PART, e4 or ROAD_PART, uv or Vector3.new(0,1,0)}) end

delClickBtn.MouseButton1Click:Connect(function() deleteModeActive = not deleteModeActive; delClickBtn.Text = "Delete Preview Plank (Click): " .. (deleteModeActive and "ON" or "OFF"); delClickBtn.BackgroundColor3 = deleteModeActive and Color3.fromRGB(255, 100, 0) or Color3.fromRGB(180, 80, 0) end)
floatToggle.MouseButton1Click:Connect(function() floatFrame.Visible = not floatFrame.Visible; for _, m in ipairs(miniButtons) do m.Visible = floatFrame.Visible end; floatToggle.Text = "Separated Control Buttons: " .. (floatFrame.Visible and "ON" or "OFF"); floatToggle.BackgroundColor3 = floatFrame.Visible and Color3.fromRGB(0, 200, 200) or Color3.fromRGB(0, 150, 150) end)
modeBtn.MouseButton1Click:Connect(function() buildMode = (buildMode == "SamePos") and "Front" or "SamePos"; modeBtn.Text = "Mode: " .. buildMode end)
saveFileBtn.MouseButton1Click:Connect(function() local f = FOLDER_NAME .. "/" .. nameBox.Text .. ".txt"; local l = {"GridPos: "..gridPosIn.Text, "GridRot: "..gridRotIn.Text, "MoveX: "..boxX.Text, "MoveY: "..boxY.Text, "MoveZ: "..boxZ.Text, "RotX: "..boxRotX.Text, "RotY: "..boxRotY.Text, "return {"}; for _, b in ipairs(savedBuilds) do table.insert(l, string.format(" {Vector3.new(%f,%f,%f), Vector3.new(%f,%f,%f), nil, nil, Vector3.new(%f,%f,%f)},", b[1].X, b[1].Y, b[1].Z, b[2].X, b[2].Y, b[2].Z, b[5].X, b[5].Y, b[5].Z)) end table.insert(l, "}"); writefile(f, table.concat(l, "\n")); refreshFiles() end)
loadFileBtn.MouseButton1Click:Connect(function() if selectedFile then loadFileCore(selectedFile) end end)
deleteFileBtn.MouseButton1Click:Connect(function() if selectedFile then local path = FOLDER_NAME .. "/" .. selectedFile .. ".txt"; lastDeletedFileData = {name = selectedFile, content = readfile(path)}; delfile(path); selectedFile, nameBox.Text = nil, DEFAULT_NAME; refreshFiles() end end)
restoreBtn.MouseButton1Click:Connect(function() if lastDeletedFileData then writefile(FOLDER_NAME .. "/" .. lastDeletedFileData.name .. ".txt", lastDeletedFileData.content); refreshFiles() end end)
gridBtn.MouseButton1Click:Connect(function() gridEnabled = not gridEnabled; gridBtn.Text = "Grid: " .. (gridEnabled and "ON" or "OFF"); gridBtn.BackgroundColor3 = gridEnabled and Color3.fromRGB(0, 180, 180) or Color3.fromRGB(0, 120, 120) end)
previewBtn.MouseButton1Click:Connect(function() showPreview = not showPreview; previewBtn.Text = "Preview: " .. (showPreview and "ON" or "OFF"); previewBtn.BackgroundColor3 = showPreview and Color3.fromRGB(120, 60, 150) or Color3.fromRGB(80, 40, 100) end)
autoClearBtn.MouseButton1Click:Connect(function() autoClearOnLoad = not autoClearOnLoad; autoClearBtn.Text = "Auto Clear (On Load): " .. (autoClearOnLoad and "ON" or "OFF"); autoClearBtn.BackgroundColor3 = autoClearOnLoad and Color3.fromRGB(150, 100, 0) or Color3.fromRGB(100, 60, 0) end)
clearBtn.MouseButton1Click:Connect(function() table.clear(savedBuilds); refreshFiles() end)

loadOffsetToggleBtn.MouseButton1Click:Connect(function()
    loadFileOffsets = not loadFileOffsets
    loadOffsetToggleBtn.Text = "Load Offsets: " .. (loadFileOffsets and "ON" or "OFF")
    loadOffsetToggleBtn.BackgroundColor3 = loadFileOffsets and Color3.fromRGB(0, 120, 0) or Color3.fromRGB(120, 60, 0)
end)

tpBtn.MouseButton1Click:Connect(function()
    if #savedBuilds > 0 then
        local center = getBuildCenter()
        local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
        if root then root.CFrame = CFrame.new(center + Vector3.new(0, 5, 0)) end
    end
end)

mainBuildBtn.MouseButton1Click:Connect(runBuild); quickBuildBtn.MouseButton1Click:Connect(runBuild)
recBtn.MouseButton1Click:Connect(function() recordingActive = not recordingActive end)
minBtn.MouseButton1Click:Connect(function() isMinimized = not isMinimized; main.Size = isMinimized and UDim2.new(0, 220, 0, 30) or UDim2.new(0, 220, 0, 810); scroll.Visible, minBtn.Text = not isMinimized, isMinimized and "+" or "-" end)
mouse.Button1Down:Connect(function() if deleteModeActive and showPreview then local t = mouse.Target; if t and table.find(currentPreviewItems, t) then getgenv().DeletePlankPreview(t) end end end)
mainSearchBox.FocusLost:Connect(refreshFiles); qbSearch.FocusLost:Connect(refreshFiles)

local oldNC; oldNC = hookmetamethod(game, "__namecall", function(self, ...) local args = {...}; if getnamecallmethod() == "FireServer" and self.Name == REMOTE_NAME then if recordingActive and not isLoading then table.insert(savedBuilds, {args[1], args[2], args[3], args[4], args[5]}) end end return oldNC(self, ...) end)

RunService.RenderStepped:Connect(function()
    offsetX, offsetY, offsetZ = tonumber(boxX.Text) or 0, tonumber(boxY.Text) or 0, tonumber(boxZ.Text) or 0
    rotX, rotY = tonumber(boxRotX.Text) or 0, tonumber(boxRotY.Text) or 0
    gridPosStep, gridRotStep = tonumber(gridPosIn.Text) or 1, tonumber(gridRotIn.Text) or 45
    globalTransparency = tonumber(previewTransIn.Text) or 0.8; recBtn.Text = "RECORD: " .. (recordingActive and "ON" or "OFF") .. " (" .. #savedBuilds .. ")"
    if not showPreview or #savedBuilds == 0 then for _, v in ipairs(currentPreviewItems) do v:Destroy() end currentPreviewItems = {} else
        local center = getBuildCenter(); local baseCF = getBaseCFrame()
        if #currentPreviewItems ~= #savedBuilds then for _, v in ipairs(currentPreviewItems) do v:Destroy() end currentPreviewItems = {}; for i=1, #savedBuilds do local p = Instance.new("Part", workspace); p.Name = "PreviewPart_"..i; p.Anchored, p.CanCollide = true, false; p.Material, p.Transparency, p.Color = Enum.Material.SmoothPlastic, globalTransparency, Color3.fromRGB(0, 255, 0); table.insert(currentPreviewItems, p) end end
        for i, b in ipairs(savedBuilds) do local p = currentPreviewItems[i]; if p then local dist = (b[2] - b[1]).Magnitude; local origCF = CFrame.lookAt((b[1] + b[2])/2, b[2], b[5] or Vector3.new(0,1,0)); local relativeCF = CFrame.new(center):Inverse() * origCF; p.Size = Vector3.new(2, 0.5, dist); p.Transparency = globalTransparency; p.CFrame = (baseCF * relativeCF) * CFrame.new(0, 0.25, 0) end end
    end
end)
refreshFiles()


-- =============================================
-- BUILD SAVER PLUG IN PREVIEW EDITOR V2.3
-- FIXED: Reversed Move Handles, UpVector Crash, & Clone Selection
-- =============================================

local player = game.Players.LocalPlayer
local mouse = player:GetMouse()
local camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")

-- Cleanup existing UI
if player.PlayerGui:FindFirstChild("PreviewEditorUI") then
    player.PlayerGui.PreviewEditorUI:Destroy()
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "PreviewEditorUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = player:WaitForChild("PlayerGui")

-- Main Frame
local main = Instance.new("Frame", screenGui)
main.Size = UDim2.new(0, 220, 0, 520)
main.Position = UDim2.new(0.5, -110, 0.5, -100) 
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
main.BorderSizePixel = 0
main.Active = true

-- Title Bar
local titleBar = Instance.new("Frame", main)
titleBar.Size = UDim2.new(1, 0, 0, 35)
titleBar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
titleBar.BorderSizePixel = 0

local titleTxt = Instance.new("TextLabel", titleBar)
titleTxt.Size = UDim2.new(1, -35, 1, 0)
titleTxt.Position = UDim2.new(0, 10, 0, 0)
titleTxt.Text = "PREVIEW EDITOR"
titleTxt.TextColor3 = Color3.new(1, 1, 1)
titleTxt.Font = Enum.Font.SourceSansBold
titleTxt.TextXAlignment = Enum.TextXAlignment.Left
titleTxt.BackgroundTransparency = 1

local minBtn = Instance.new("TextButton", titleBar)
minBtn.Size = UDim2.new(0, 30, 0, 30)
minBtn.Position = UDim2.new(1, -32, 0, 2)
minBtn.Text = "-"
minBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
minBtn.TextColor3 = Color3.new(1, 1, 1)

local scroll = Instance.new("ScrollingFrame", main)
scroll.Size = UDim2.new(1, -10, 1, -45)
scroll.Position = UDim2.new(0, 5, 0, 40)
scroll.BackgroundTransparency = 1
scroll.ScrollBarThickness = 4
scroll.BorderSizePixel = 0
local list = Instance.new("UIListLayout", scroll)
list.Padding = UDim.new(0, 5)

-- State
local selectedParts = {}
local selectionBoxes = {}
local currentHandles, handleAnchor = nil, nil
local toolMode = "Move"
local selectModeActive = false
local armMultiSelect = false
local undoStack, redoStack = {}, {}

-- UI Helpers
local function createInput(labelText, defaultText)
    local f = Instance.new("Frame", scroll)
    f.Size = UDim2.new(1, -6, 0, 30)
    f.BackgroundTransparency = 1
    local l = Instance.new("TextLabel", f)
    l.Size = UDim2.new(0.45, 0, 1, 0)
    l.Text = labelText; l.TextColor3 = Color3.new(1,1,1); l.Font = Enum.Font.SourceSansBold; l.TextScaled = true; l.BackgroundTransparency = 1; l.TextXAlignment = Enum.TextXAlignment.Left
    local box = Instance.new("TextBox", f)
    box.Size = UDim2.new(0.55, 0, 1, 0); box.Position = UDim2.new(0.45, 0, 0, 0); box.BackgroundColor3 = Color3.fromRGB(50,50,50); box.TextColor3 = Color3.new(1,1,1); box.Text = defaultText; box.Font = Enum.Font.SourceSansBold; box.TextScaled = true; box.BorderSizePixel = 0; box.ClearTextOnFocus = false
    return box
end

local function createBtn(txt, color)
    local b = Instance.new("TextButton", scroll); b.Size = UDim2.new(1, -6, 0, 35); b.BackgroundColor3 = color or Color3.fromRGB(50, 50, 50); b.Text = txt; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextScaled = true; b.BorderSizePixel = 0
    return b
end

-- UI List
local moveIncBox = createInput("Move Inc:", "1")
local rotIncBox = createInput("Rot Inc:", "15")
local modeBtn = createBtn("MODE: MOVE", Color3.fromRGB(150, 100, 0))
local selModeBtn = createBtn("SELECT MODE: OFF", Color3.fromRGB(60, 60, 60))
local multiBtn = createBtn("MULTI SELECT", Color3.fromRGB(0, 120, 120))
local deselectBtn = createBtn("DESELECT ALL", Color3.fromRGB(100, 30, 30))
local deleteBtn = createBtn("DELETE SELECTED", Color3.fromRGB(180, 0, 0))
local copyBtn = createBtn("COPY SELECTED", Color3.fromRGB(40, 120, 40))
local undoBtn = createBtn("UNDO (0)", Color3.fromRGB(80, 40, 40))
local redoBtn = createBtn("REDO (0)", Color3.fromRGB(80, 60, 40))
local clearMemBtn = createBtn("CLEAR ACTIONS", Color3.fromRGB(50, 50, 50))

local dragFrame = Instance.new("Frame", screenGui)
dragFrame.BackgroundColor3 = Color3.fromRGB(0, 170, 255); dragFrame.BackgroundTransparency = 0.7; dragFrame.Visible = false

-- Core Helpers
local function isPreview(p) return p and p:IsA("BasePart") and string.match(p.Name, "^PreviewPart_") end

local function updateStackUI()
    undoBtn.Text = "UNDO (" .. #undoStack .. ")"
    redoBtn.Text = "REDO (" .. #redoStack .. ")"
end

local function record(type, data)
    if not data then return end
    table.insert(undoStack, {Type = type, Data = data})
    redoStack = {}
    updateStackUI()
end

local function getSelectionCenter()
    if #selectedParts == 0 then return nil, Vector3.new(0,0,0) end
    local min, max = Vector3.new(math.huge, math.huge, math.huge), Vector3.new(-math.huge, -math.huge, -math.huge)
    for _, p in pairs(selectedParts) do
        if p and p.Parent then
            local cf, size = p.CFrame, p.Size
            for _, corner in pairs({Vector3.new(1,1,1), Vector3.new(-1,-1,-1)}) do
                local worldPos = cf * (size/2 * corner) 
                min = Vector3.new(math.min(min.X, worldPos.X), math.min(min.Y, worldPos.Y), math.min(min.Z, worldPos.Z))
                max = Vector3.new(math.max(max.X, worldPos.X), math.max(max.Y, worldPos.Y), math.max(max.Z, worldPos.Z))
            end
        end
    end
    return CFrame.new((min + max) / 2), (max - min)
end
-- FIXED: Directions for each specific handle face
local function getHandleAxisVector(axis)
    -- Standard Handles (Move mode)
    if axis == Enum.NormalId.Top then return Vector3.new(0, 1, 0) end
    if axis == Enum.NormalId.Bottom then return Vector3.new(0, -1, 0) end
    if axis == Enum.NormalId.Right then return Vector3.new(1, 0, 0) end
    if axis == Enum.NormalId.Left then return Vector3.new(-1, 0, 0) end
    if axis == Enum.NormalId.Back then return Vector3.new(0, 0, 1) end
    if axis == Enum.NormalId.Front then return Vector3.new(0, 0, -1) end
    
    -- ArcHandles (Rotate mode)
    if axis == Enum.Axis.X then return Vector3.new(1, 0, 0) end
    if axis == Enum.Axis.Y then return Vector3.new(0, 1, 0) end
    if axis == Enum.Axis.Z then return Vector3.new(0, 0, 1) end
    
    return Vector3.new(0,0,0)
end

local function updateHandles()
    if currentHandles then currentHandles:Destroy() end
    if handleAnchor then handleAnchor:Destroy() end
    if #selectedParts == 0 then return end
    
    local centerCF, size = getSelectionCenter()
    if not centerCF then return end
    
    handleAnchor = Instance.new("Part", workspace)
    handleAnchor.Anchored, handleAnchor.CanCollide, handleAnchor.CanQuery = true, false, false
    handleAnchor.Transparency, handleAnchor.Size, handleAnchor.CFrame = 1, size, centerCF
    
    currentHandles = Instance.new(toolMode == "Move" and "Handles" or "ArcHandles", screenGui)
    currentHandles.Adornee = handleAnchor; currentHandles.Color3 = Color3.fromRGB(0, 170, 255)
    
    local startParts = {}; local startAnchorCF = handleAnchor.CFrame; local lastDist = 0
    
    currentHandles.MouseButton1Down:Connect(function()
        camera.CameraType = Enum.CameraType.Scriptable; startAnchorCF = handleAnchor.CFrame; lastDist = 0
        for _, p in pairs(selectedParts) do if p and p.Parent then startParts[p] = p.CFrame end end
    end)
    
    currentHandles.MouseDrag:Connect(function(axis, distance)
        local axisVec = getHandleAxisVector(axis)
        local mI, rI = tonumber(moveIncBox.Text) or 1, tonumber(rotIncBox.Text) or 15
        
        if toolMode == "Move" then
            local snap = math.round(distance / mI) * mI
            local delta = snap - lastDist; lastDist = snap; local moveVec = axisVec * delta
            
            for _, p in pairs(selectedParts) do 
                if p and p.Parent and getgenv().MovePlankPreview then 
                    getgenv().MovePlankPreview(p, {moveVec.X, moveVec.Y, moveVec.Z}) 
                end 
            end
            handleAnchor.CFrame = handleAnchor.CFrame + moveVec
        else
            local snapR = math.rad(math.round(math.deg(distance) / rI) * rI); local deltaRot = CFrame.fromAxisAngle(axisVec, snapR)
            for _, p in pairs(selectedParts) do
                if p and p.Parent and startParts[p] then
                    local targetCF = startAnchorCF * deltaRot * (startAnchorCF:Inverse() * startParts[p])
                    local pD = targetCF.Position - p.Position
                    if getgenv().MovePlankPreview then getgenv().MovePlankPreview(p, {pD.X, pD.Y, pD.Z}) end
                    local rx, ry, rz = targetCF:ToEulerAnglesYXZ()
                    if getgenv().RotatePlankPreview then getgenv().RotatePlankPreview(p, {math.deg(rx), math.deg(ry), math.deg(rz)}) end
                end
            end
        end
    end)
    
    currentHandles.MouseButton1Up:Connect(function()
        camera.CameraType = Enum.CameraType.Custom; local batch = {}
        for p, old in pairs(startParts) do if p and p.Parent then batch[p] = {Old = old, New = p.CFrame} end end
        record("Transform", batch); task.wait(0.05); local nc = getSelectionCenter(); if nc then handleAnchor.CFrame = nc end
    end)
end

-- FIXED Action Processor (Handles UpVector as Object)
local function process(action, isUndo)
    if not action or not action.Data then return end
    
    if action.Type == "Transform" then
        for p, data in pairs(action.Data) do
            local target = isUndo and data.Old or data.New
            if p and p.Parent then
                local d = target.Position - p.Position
                getgenv().MovePlankPreview(p, {d.X, d.Y, d.Z})
                local rx, ry, rz = target:ToEulerAnglesYXZ()
                getgenv().RotatePlankPreview(p, {math.deg(rx), math.deg(ry), math.deg(rz)})
            end
        end
    elseif action.Type == "Delete" then
        if isUndo then
            for _, data in pairs(action.Data) do
                local up = data.CF.UpVector
                local p1 = (data.CF * CFrame.new(0,0, data.Size.Z/2)).Position
                local p2 = (data.CF * CFrame.new(0,0,-data.Size.Z/2)).Position
                -- FIX: Pass UpVector as a real Vector3 object to prevent main script crash
                getgenv().NewPlankPreview({p1.X, p1.Y, p1.Z}, {p2.X, p2.Y, p2.Z}, nil, nil, Vector3.new(up.X, up.Y, up.Z))
            end
        else
            for _, data in pairs(action.Data) do if data.Part and data.Part.Parent then getgenv().DeletePlankPreview(data.Part) end end
        end
    elseif action.Type == "Clone" then
        if isUndo then
            for _, idx in pairs(action.Data.NewIndices) do
                local p = workspace:FindFirstChild("PreviewPart_" .. idx)
                if p then getgenv().DeletePlankPreview(p) end
            end
        else
            for _, p in pairs(action.Data.Originals) do if p and p.Parent then getgenv().ClonePlankPreview(p) end end
        end
    end
    task.wait(0.1); updateHandles()
end

-- Button Handlers
deleteBtn.MouseButton1Click:Connect(function()
    if #selectedParts == 0 then return end
    local batch = {}
    for _, p in pairs(selectedParts) do
        table.insert(batch, {CF = p.CFrame, Size = p.Size, Part = p})
        getgenv().DeletePlankPreview(p)
    end
    record("Delete", batch)
    for _, b in pairs(selectionBoxes) do if b then b:Destroy() end end
    selectedParts = {}; selectionBoxes = {};
    updateHandles()
end)

copyBtn.MouseButton1Click:Connect(function()
    if #selectedParts == 0 or not getgenv().ClonePlankPreview then return end
    local cloneIndices, originals = {}, {}
    for _, p in pairs(selectedParts) do 
        if p and p.Parent then 
            table.insert(originals, p)
            local nIdx = getgenv().ClonePlankPreview(p)
            if nIdx then table.insert(cloneIndices, nIdx) end
        end
    end
    record("Clone", {Originals = originals, NewIndices = cloneIndices})
    for _, b in pairs(selectionBoxes) do if b then b:Destroy() end end
    selectedParts = {}; selectionBoxes = {};
    
    task.spawn(function()
        local foundCount = 0; local timeout = 0
        while foundCount < #cloneIndices and timeout < 20 do
            foundCount = 0
            for _, idx in ipairs(cloneIndices) do
                local np = workspace:FindFirstChild("PreviewPart_" .. idx)
                if np and not selectionBoxes[np] then
                    table.insert(selectedParts, np)
                    local sb = Instance.new("SelectionBox", np); sb.Adornee, sb.Color3, sb.LineThickness = np, Color3.fromRGB(0, 170, 255), 0.05; selectionBoxes[np] = sb
                    foundCount = foundCount + 1
                elseif selectionBoxes[np] then foundCount = foundCount + 1 end
            end
            if foundCount < #cloneIndices then task.wait() end
            timeout = timeout + 1
        end
        updateHandles()
        if getgenv().ClearPlankPreviewActionList then getgenv().ClearPlankPreviewActionList() end
    end)
end)

undoBtn.MouseButton1Click:Connect(function() if #undoStack > 0 then local a = table.remove(undoStack); table.insert(redoStack, a); process(a, true); updateStackUI() end end)
redoBtn.MouseButton1Click:Connect(function() if #redoStack > 0 then local a = table.remove(redoStack); table.insert(undoStack, a); process(a, false); updateStackUI() end end)

-- Interaction
multiBtn.MouseButton1Click:Connect(function() armMultiSelect = true; multiBtn.Text = "DRAG ON SCREEN" end)
local dStart
UIS.InputBegan:Connect(function(i, g)
    if g or not armMultiSelect then return end
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dStart = Vector2.new(i.Position.X, i.Position.Y); dragFrame.Visible = true; camera.CameraType = Enum.CameraType.Scriptable
    end
end)
UIS.InputChanged:Connect(function(i)
    if dragFrame.Visible and dStart then
        local cur = Vector2.new(i.Position.X, i.Position.Y)
        dragFrame.Position = UDim2.new(0, math.min(dStart.X, cur.X), 0, math.min(dStart.Y, cur.Y))
        dragFrame.Size = UDim2.new(0, math.abs(dStart.X - cur.X), 0, math.abs(dStart.Y - cur.Y))
    end
end)
UIS.InputEnded:Connect(function(i)
    if dragFrame.Visible and (i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch) then
        local min, max = dragFrame.AbsolutePosition, dragFrame.AbsolutePosition + dragFrame.AbsoluteSize
        for _, v in pairs(workspace:GetChildren()) do
            if isPreview(v) then
                local sPos, on = camera:WorldToScreenPoint(v.Position)
                if on and sPos.X > min.X and sPos.X < max.X and sPos.Y > min.Y and sPos.Y < max.Y then
                    if not table.find(selectedParts, v) then
                        table.insert(selectedParts, v); local sb = Instance.new("SelectionBox", v); sb.Adornee, sb.Color3, sb.LineThickness = v, Color3.fromRGB(0, 170, 255), 0.05; selectionBoxes[v] = sb
                    end
                end
            end
        end
        updateHandles(); dragFrame.Visible, armMultiSelect = false, false; camera.CameraType = Enum.CameraType.Custom; multiBtn.Text = "MULTI SELECT"
    end
end)

mouse.Button1Down:Connect(function()
    if not selectModeActive or armMultiSelect then return end
    local t = mouse.Target
    if isPreview(t) then
        local i = table.find(selectedParts, t)
        if not i then
            table.insert(selectedParts, t); local sb = Instance.new("SelectionBox", t); sb.Adornee, sb.Color3, sb.LineThickness = t, Color3.fromRGB(0, 170, 255), 0.05; selectionBoxes[t] = sb
        else
            if selectionBoxes[t] then selectionBoxes[t]:Destroy() end; selectionBoxes[t] = nil; table.remove(selectedParts, i)
        end
        updateHandles()
    end
end)

modeBtn.MouseButton1Click:Connect(function() toolMode = (toolMode == "Move") and "Rotate" or "Move"; modeBtn.Text = "MODE: "..toolMode; updateHandles() end)
selModeBtn.MouseButton1Click:Connect(function() selectModeActive = not selectModeActive; selModeBtn.Text = "SELECT MODE: "..(selectModeActive and "ON" or "OFF") end)
deselectBtn.MouseButton1Click:Connect(function() 
    for _,b in pairs(selectionBoxes) do if b then b:Destroy() end end 
    selectedParts = {}; selectionBoxes = {};
    updateHandles() 
end)
minBtn.MouseButton1Click:Connect(function() scroll.Visible = not scroll.Visible; main.Size = scroll.Visible and UDim2.new(0, 220, 0, 520) or UDim2.new(0, 220, 0, 35) end)
clearMemBtn.MouseButton1Click:Connect(function() undoStack = {}; redoStack = {}; updateStackUI() end)

-- UI Dragging logic
local dragging, dPos, sPos
titleBar.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
        dragging = true; dPos = i.Position; sPos = main.Position
        i.Changed:Connect(function() if i.UserInputState == Enum.UserInputState.End then dragging = false end end)
    end
end)
UIS.InputChanged:Connect(function(i)
    if dragging and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
        local delta = i.Position - dPos; main.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + delta.X, sPos.Y.Scale, sPos.Y.Offset + delta.Y)
    end
end)


--this one aint open source for safety reasons B)
loadstring(game:HttpGet("https://raw.githubusercontent.com/Davidisnotafurry/Globalchatfilesharergef/refs/heads/main/obfuscated_script-1780591867718.lua.txt"))()

loadstring(game:HttpGet("https://raw.githubusercontent.com/Davidisnotafurry/Globalchatfilesharergef/refs/heads/main/obfuscated_script-1780596087728.lua.txt"))()