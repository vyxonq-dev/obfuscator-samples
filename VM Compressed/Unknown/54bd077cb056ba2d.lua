local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local HttpService = game:GetService("HttpService")
local firstTimeUsingDeath = false

local ALLOWED_GAME_ID = 7862121304
if game.GameId ~= ALLOWED_GAME_ID then
    Fluent:Notify({
        Title = "Alert",
        Content = "The script not support this game",
        Duration = 8
    })
    return 
else
    firstTimeUsingDeath = true
end

local Window = Fluent:CreateWindow({
    Title = "Immortal Cultivation | BETA",
    SubTitle = "By VichianHUB",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftAlt
})

local VirtualUser = game:GetService('VirtualUser')
 
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "crown" }),
    -- Event = Window:AddTab({ Title = "Xmas Event", Icon = "tree-pine" }),
    ESPM = Window:AddTab({ Title = "ESP & Attack Mob", Icon = "eye" }),
    -- ESPH = Window:AddTab({ Title = "ESP Herb", Icon = "eye" }),
    AutoHerb = Window:AddTab({ Title = "ESP & Auto Herb", Icon = "leaf" }),
    ESPManual = Window:AddTab({ Title = "Manual", Icon = "book" }),
    ESPFlame = Window:AddTab({ Title = "Flame", Icon = "flame" }),
    ESPSM = Window:AddTab({ Title = "Soul Realm", Icon = "ghost" }),
    HSV = Window:AddTab({ Title = "Hop Server", Icon = "wifi" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do

    ----------------------- EVENT ESP & WARP ---------------------------------

    -- local RunService = game:GetService("RunService")
    -- local Camera = workspace.CurrentCamera
    -- local CoreGui = game:GetService("CoreGui")
    -- local Players = game:GetService("Players")
    -- local TweenService = game:GetService("TweenService")
    -- local LocalPlayer = Players.LocalPlayer

    -- -- ### VARIABLES ###
    -- local firstTimeUsingDeath = true
    -- local isEventWarping = false
    -- local eventWarpSpeed = 50
    -- local specialESPObjects = {} -- { [object] = {Instance = BillboardGui, Label = TextLabel, Tier = string} }
    -- local giftlist = { ["Giftmas"] = "T1" }

    -- -- ตั้งค่า RGB
    -- local rainbowSpeed = 0.5 -- ปรับความเร็วสีรุ้ง (น้อย = ช้า, มาก = เร็ว)
    -- local currentRainbowColor = Color3.fromRGB(255, 255, 255)

    -- -- ### ตรวจสอบตำแหน่งเก็บ ESP ###
    -- local success, targetParent = pcall(function() return CoreGui end)
    -- local ESPParent = success and targetParent or LocalPlayer:WaitForChild("PlayerGui")

    -- RunService.RenderStepped:Connect(function()
    --     local hue = (tick() * rainbowSpeed) % 1
    --     currentRainbowColor = Color3.fromHSV(hue, 0.8, 1) -- สีรุ้งแบบสดใส
    -- end)

    -- local function createGiftESP(object, tier)
    --     if not object or not object.Parent or specialESPObjects[object] then return end

    --     local bbg = Instance.new("BillboardGui")
    --     bbg.Name = "EventESP_" .. object.Name
    --     bbg.AlwaysOnTop = true
    --     bbg.Size = UDim2.new(0, 200, 0, 50)
    --     bbg.ExtentsOffset = Vector3.new(0, 3, 0)
    --     bbg.Adornee = object
    --     bbg.ResetOnSpawn = false
    --     bbg.Parent = ESPParent

    --     local nameLabel = Instance.new("TextLabel")
    --     nameLabel.Parent = bbg
    --     nameLabel.Size = UDim2.new(1, 0, 1, 0)
    --     nameLabel.BackgroundTransparency = 1
    --     nameLabel.Text = "🎄: " .. object.Name
    --     nameLabel.TextColor3 = currentRainbowColor
    --     nameLabel.TextSize = 14
    --     nameLabel.Font = Enum.Font.GothamBold
    --     nameLabel.TextStrokeTransparency = 0
    --     nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

    --     -- บันทึกข้อมูลเพื่อใช้อัปเดตสีรุ้ง
    --     specialESPObjects[object] = { 
    --         Instance = bbg, 
    --         Label = nameLabel, 
    --         Tier = tier 
    --     }
    -- end

    -- -----------------------------------------------------------------------------------------------------------------
    -- -- ### [LOOP] อัปเดตสี RGB ให้ ESP ตลอดเวลา ###
    -- -----------------------------------------------------------------------------------------------------------------
    -- task.spawn(function()
    --     while true do
    --         for object, data in pairs(specialESPObjects) do
    --             if data.Label and data.Label.Parent then
    --                 data.Label.TextColor3 = currentRainbowColor
    --             end
    --         end
    --         RunService.RenderStepped:Wait() -- อัปเดตตามเฟรมเรตเพื่อให้สีเนียนที่สุด
    --     end
    -- end)

    -- -----------------------------------------------------------------------------------------------------------------
    -- -- ### [LOOP] ตรวจสอบการลบ ESP เมื่อของหาย ###
    -- -----------------------------------------------------------------------------------------------------------------
    -- task.spawn(function()
    --     while true do
    --         for object, data in pairs(specialESPObjects) do
    --             if not object or not object.Parent then
    --                 if data.Instance then data.Instance:Destroy() end
    --                 specialESPObjects[object] = nil
    --             end
    --         end
    --         task.wait(1)
    --     end
    -- end)

    -- local function DeathFirstFunctionEvent()
    --     if firstTimeUsingDeath then
    --         local char = LocalPlayer.Character
    --         if char and char:FindFirstChild("Humanoid") then 
    --             char.Humanoid.Health = 0 
    --         end
    --         -- รอจนกว่าตัวละครใหม่จะโหลดเสร็จสมบูรณ์
    --         LocalPlayer.CharacterAdded:Wait()
    --         task.wait(2) -- รอให้ฟิสิกส์ตัวละครนิ่ง
    --         firstTimeUsingDeath = false
    --     end
    -- end

    -- local function setNoclip(enabled)
    --     if enabled then
    --         if _G.EventNoclip then _G.EventNoclip:Disconnect() end
    --         _G.EventNoclip = RunService.Stepped:Connect(function()
    --             local char = LocalPlayer.Character
    --             if char then
    --                 for _, v in pairs(char:GetDescendants()) do
    --                     if v:IsA('BasePart') then v.CanCollide = false end
    --                 end
    --             end
    --         end)
    --     else
    --         if _G.EventNoclip then _G.EventNoclip:Disconnect(); _G.EventNoclip = nil end
    --     end
    -- end

    -- local function AutoPressGiftE()
    --     local char = LocalPlayer.Character
    --     local root = char and char:FindFirstChild("HumanoidRootPart")
    --     if not root then return end

    --     local overlapParams = OverlapParams.new()
    --     overlapParams.FilterType = Enum.RaycastFilterType.Exclude
    --     overlapParams.FilterDescendantsInstances = {char}
        
    --     local nearbyParts = workspace:GetPartBoundsInRadius(root.Position, 15, overlapParams)

    --     for _, part in ipairs(nearbyParts) do
    --         local prompt = part:FindFirstChildOfClass("ProximityPrompt") or part.Parent:FindFirstChildOfClass("ProximityPrompt")
    --         if prompt then
    --             local item = prompt.Parent
    --             if item and giftlist[item.Name] then
    --                 prompt.HoldDuration = 0 
    --                 prompt:InputHoldBegin()
    --                 task.wait()
    --                 prompt:InputHoldEnd()
    --                 break 
    --             end
    --         end
    --     end
    -- end

    -- -----------------------------------------------------------------------------------------------------------------
    -- -- ### [FUNCTION] WARP LOGIC
    -- -----------------------------------------------------------------------------------------------------------------

    -- local function warpToTarget(targetPosition)
    --     local char = LocalPlayer.Character
    --     -- เช็คตัวละครและส่วนประกอบภายในฟังก์ชันเสมอ
    --     local root = char and char:FindFirstChild("HumanoidRootPart")
    --     local hum = char and char:FindFirstChild("Humanoid")
        
    --     if not root or not hum or hum.Health <= 0 then return end 

    --     local bv = Instance.new("BodyVelocity")
    --     bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    --     bv.Velocity = Vector3.new(0, 0, 0)
    --     bv.Parent = root

    --     local distance = (targetPosition - root.Position).Magnitude
    --     local duration = distance / math.max(eventWarpSpeed, 1)
    --     local tween = TweenService:Create(root, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)})

    --     hum.PlatformStand = true
    --     tween:Play()
        
    --     local connection
    --     connection = RunService.Heartbeat:Connect(function()
    --         -- ถ้ากดปิดวาร์ป หรือตายระหว่างวาร์ป ให้ยกเลิก Tween
    --         if not isEventWarping or hum.Health <= 0 then
    --             tween:Cancel()
    --             if connection then connection:Disconnect() end
    --         end
    --     end)

    --     tween.Completed:Wait()
    --     if connection then connection:Disconnect() end
    --     if bv then bv:Destroy() end
    --     if hum then 
    --         hum.PlatformStand = false
    --         hum:ChangeState(Enum.HumanoidStateType.GettingUp) 
    --     end
    -- end

    -- local function findNearestEventItem()
    --     local char = LocalPlayer.Character
    --     local root = char and char:FindFirstChild("HumanoidRootPart")
    --     if not root then return nil end
        
    --     local nearest = nil
    --     local minDistance = math.huge
        
    --     for _, child in pairs(game.Workspace:GetChildren()) do
    --         if giftlist[child.Name] then
    --             local dist = (child:GetPivot().Position - root.Position).Magnitude
    --             if dist < minDistance then
    --                 minDistance = dist
    --                 nearest = child
    --             end
    --         end
    --     end
    --     return nearest
    -- end

    -- -----------------------------------------------------------------------------------------------------------------
    -- -- ### [UI & LOOPS]
    -- -----------------------------------------------------------------------------------------------------------------

    -- -- ESP Toggle
    -- local EventESPtoggle = Tabs.Event:AddToggle("EventESP", {Title = "Show Gift ESP", Default = false })

    -- -- Warp Speed Slider
    -- Tabs.Event:AddSlider("EventWarpSpeed", { 
    --     Title = "Event Warp Speed", 
    --     Default = 50, Min = 1, Max = 100, Rounding = 1, 
    --     Callback = function(v) eventWarpSpeed = v end 
    -- })

    -- -- Warp Toggle
    -- local EventWarpToggle = Tabs.Event:AddToggle("EventWarp", {Title = "Auto Warp to Gifts", Default = false })

    -- -- Loop สำหรับระบบวาร์ป (ปรับปรุงให้รองรับการเกิดใหม่)
    -- task.spawn(function()
    --     while true do
    --         if isEventWarping then
    --             local char = LocalPlayer.Character
    --             local hum = char and char:FindFirstChild("Humanoid")
                
    --             -- ถ้าตัวละครยังมีชีวิตอยู่ ให้ทำการวาร์ป
    --             if hum and hum.Health > 0 then
    --                 local target = findNearestEventItem()
    --                 if target then
    --                     warpToTarget(target:GetPivot().Position + Vector3.new(0, 5, 0))
    --                     task.wait(0.2)
    --                     AutoPressGiftE()
    --                     task.wait(0.3)
    --                 end
    --             else
    --                 -- ถ้าตายอยู่ ให้รอจนกว่าจะเกิดใหม่
    --                 task.wait(1)
    --             end
    --         end
    --         task.wait(0.5)
    --     end
    -- end)

    -- -- ESP Loop
    -- task.spawn(function()
    --     while true do
    --         if EventESPtoggle.Value then
    --             for _, child in pairs(game.Workspace:GetChildren()) do
    --                 if giftlist[child.Name] then createGiftESP(child, giftlist[child.Name]) end
    --             end
    --         end
    --         for object, data in pairs(specialESPObjects) do
    --             if not object or not object.Parent or not EventESPtoggle.Value then
    --                 if data.Instance then data.Instance:Destroy() end
    --                 specialESPObjects[object] = nil
    --             end
    --         end
    --         task.wait(2)
    --     end
    -- end)

    -- EventWarpToggle:OnChanged(function(v)
    --     isEventWarping = v
    --     if v then
    --         DeathFirstFunctionEvent()
    --         setNoclip(true)
    --     else
    --         setNoclip(false)
    --     end
    -- end)

    ---------------------------------------------------------------
    Tabs.Main:AddParagraph({
        Title = "Welcome to vichianHUB",
        Content = "\nThis is a beta test script.\nUse at your own risk!\n\nWhat game the VichianHUB is Support\n- Dragon Adventure\n- Immortal Cultivation"
    })

    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    ------------------------------------------------------------------------------------------------------------------------
    -- local desiredWalkSpeed = humanoid.WalkSpeed

    -- local WalkSpeedSlideBar = Tabs.Main:AddSlider("Walkspeed", {
    --     Title = "Walk Speed",
    --     Description = "Speed",
    --     Default = desiredWalkSpeed,
    --     Min = humanoid.WalkSpeed,
    --     Max = 100,
    --     Rounding = 1,
    --     Callback = function(newSpeed)
    --         desiredWalkSpeed = newSpeed
    --         if Options.WalkSpeedToggle.Value then
    --             humanoid.WalkSpeed = desiredWalkSpeed
    --         end
    --     end
    -- })

    -- local ChangeWalkSpeed = Tabs.Main:AddToggle("WalkSpeedToggle", {Title = "Change - Walkspeed", Default = false })
    -- local IsWalkSpeedChange = false

    -- local function WalkSpeedChange()
    --     local character = player.Character or player.CharacterAdded:Wait()
    --     local humanoid = character:WaitForChild("Humanoid")
    --     humanoid.WalkSpeed = desiredWalkSpeed
    -- end

    -- ChangeWalkSpeed:OnChanged(function()
    --     if Options.WalkSpeedToggle.Value then
    --         IsWalkSpeedChange = true
    --         WalkSpeedChange()
    --         while IsWalkSpeedChange do
    --             WalkSpeedChange()
    --             task.wait(0.01)
    --         end
    --     else
    --         IsWalkSpeedChange = false
    --     end
    --     print("Toggle changed:", Options.WalkSpeedToggle.Value)
    -- end)

    -- Options.WalkSpeedToggle:SetValue(false)

    ------------------------------------------------------------------------------------------------------------------------
    local RunService = game:GetService("RunService")
    local Players = game:GetService("Players")
    local CoreGui = game:GetService("CoreGui")
    local LocalPlayer = Players.LocalPlayer
    local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

    -- ตรวจสอบสิทธิ์การเข้าถึง CoreGui สำหรับ ESP
    local success, targetParent = pcall(function() return CoreGui end)
    local ESPParent = success and targetParent or PlayerGui

    local espObjects = {} 
    local savedSelectedESP = {} -- จดจำค่าที่เลือกไว้ แม้ของจะหายจากแมพ
    local HerbsFolder = workspace:WaitForChild("Herbs")

    --- ### 1. ฟังก์ชันดึงชื่อสมุนไพรจาก ProximityPrompt
    local function getHerbName(herbObject)
        local prompt = herbObject:FindFirstChildWhichIsA("ProximityPrompt", true)
        if prompt then
            return (prompt.ObjectText ~= "" and prompt.ObjectText) or prompt.ActionText or herbObject.Name
        end
        return herbObject.Name
    end

    --- ### 2. ฟังก์ชันดึงรายชื่อสมุนไพรที่ไม่ซ้ำกันจาก workspace.Herbs
    local function getUniqueHerbNames()
        local namesInMap = {}
        local hash = {} 

        for _, herb in pairs(HerbsFolder:GetChildren()) do
            local realName = getHerbName(herb)
            if not hash[realName] then
                table.insert(namesInMap, realName)
                hash[realName] = true
            end
        end

        table.sort(namesInMap)
        return #namesInMap > 0 and namesInMap or {"Waiting for herbs..."}
    end

    --- ### 3. ฟังก์ชันสร้าง ESP
    local function createESP(object, realName)
        if espObjects[object] then 
            espObjects[object].Container.Enabled = true
            return 
        end

        local bbg = Instance.new("BillboardGui")
        bbg.Name = "HerbESP_" .. realName
        bbg.AlwaysOnTop = true
        bbg.Size = UDim2.new(0, 150, 0, 50)
        bbg.ExtentsOffset = Vector3.new(0, 3, 0)
        bbg.Adornee = object
        bbg.Parent = ESPParent

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = bbg
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.TextSize = 15
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0.5
        
        local displayColor = Color3.fromRGB(255, 255, 255)
        local n = string.lower(realName)
        
        if string.find(n, "1000-year", 1, true) then
            displayColor = Color3.fromRGB(255, 0, 0)
        elseif string.find(n, "100-year", 1, true) then
            displayColor = Color3.fromRGB(255, 170, 0)
        elseif string.find(n, "10-year", 1, true) then
            displayColor = Color3.fromRGB(85, 255, 127)
        end

        nameLabel.TextColor3 = displayColor
        nameLabel.Text = "🌿 " .. realName

        espObjects[object] = {
            Container = bbg,
            Target = object,
            RealName = realName
        }
    end

    local function removeAllESP()
        for obj, data in pairs(espObjects) do
            if data.Container then data.Container:Destroy() end
        end
        espObjects = {}
    end

    --- ### 4. UI Setup & Logic
    local herbESPtoggle = Tabs.AutoHerb:AddToggle("HerbESPToggle", {Title = "Show Herb ESP", Default = false })
    
    local HerbListDropdown = Tabs.AutoHerb:AddDropdown("SelectHerb", {
        Title = "Select Herb ESP",
        Values = getUniqueHerbNames(),
        Multi = true,
        Default = {},
    })

    local function refreshESP()
        if not herbESPtoggle.Value then
            for _, data in pairs(espObjects) do 
                if data.Container then data.Container.Enabled = false end 
            end
            return
        end

        for _, herb in pairs(HerbsFolder:GetChildren()) do
            local realName = getHerbName(herb)
            -- ตรวจสอบจาก savedSelectedESP ว่าชื่อนี้ถูกติ๊กเลือกไว้หรือไม่
            if savedSelectedESP[realName] == true then
                createESP(herb, realName)
            end
        end

        for obj, data in pairs(espObjects) do
            local stillInWorkspace = obj and obj.Parent == HerbsFolder
            local stillSelected = savedSelectedESP[data.RealName] == true
            
            if not stillInWorkspace or not stillSelected then
                if data.Container then data.Container:Destroy() end
                espObjects[obj] = nil
            end
        end
    end

    -- [LOGIC] จัดการการกดติ๊กเข้า/ออก
    HerbListDropdown:OnChanged(function(value)
        -- อัปเดตสถานะล่าสุดจากการกดของผู้ใช้
        savedSelectedESP = value
        refreshESP()
    end)

    herbESPtoggle:OnChanged(function()
        if not herbESPtoggle.Value then
            for _, data in pairs(espObjects) do
                if data.Container then data.Container.Enabled = false end
            end
        else
            refreshESP()
        end
    end)

    -- [UPDATE LOOP] 
    task.spawn(function()
        while true do
            local currentItemsInMap = getUniqueHerbNames()
            if herbESPtoggle.Value then
                if #currentItemsInMap ~= #HerbListDropdown.Values then
                    HerbListDropdown:SetValues(currentItemsInMap)
                    HerbListDropdown:SetValue(savedSelectedESP)
                end
                refreshESP()
            end
            
            task.wait(2)
        end
    end)

    refreshESP()

    Line1 = Tabs.AutoHerb:AddParagraph({
        Title = "-----------------------------------------------------------------------------------------",
    })

    -----------------------------------------------------------------------------------------------------------------
    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer

    -- ### CONFIGURATION & VARIABLES ###
    local firstTimeUsingDeath = true
    local isWarping = false
    local warpSpeed = 50
    local specialESPObjects = {} -- { [object] = {Instance = BillboardGui, Tier = string} }

    local TierColors = {
        T1 = Color3.fromRGB(255, 255, 255),
        T2 = Color3.fromRGB(85, 255, 127),
        T3 = Color3.fromRGB(0, 170, 255),
        T4 = Color3.fromRGB(170, 85, 255),
        T5 = Color3.fromRGB(255, 0, 0)
    }

    local scriptureList = {
        ["Qi Condensation Sutra"] = "T1",
        ["Maniac's Cultivation Tips"] = "T2",
        ["Nine Yang Scripture"] = "T2",
        ["Verdant Wind Scripture"] = "T2",
        ["Copper Body Formula"] = "T2",
        ["Six Yin Scripture"] = "T2",
        ["Tenebrous Canon"] = "T3",
        ["Sword Sutra"] = "T3",
        ["Shadowless Canon"] = "T3",
        ["Pure Heart Skill"] = "T3",
        ["Principle of Motion"] = "T3",
        ["Heavenly Demon Scripture"] = "T3",
        ["Extreme Sword Sutra"] = "T3",
        ["Lotus Sutra"] = "T3",
        ["Principle Of Motion"] = "T3",
        ["Mother Earth Technique"] = "T3",
        ["Steel Body"] = "T4",
        ["Soul Shedding"] = "T4",
        ["Dragon Rising"] = "T4",
        ["Rising Dragon Art"] = "T4",
        ["Earth Flame Method"] = "T4",
        ["Steel Body Formula"] = "T4",
        ["Soul Shedding Scripture"] = "T4",
        ["Star Reaving Scripture"] = "T4",
        ["Return to Basic"] = "T5",
        ["Taotie's Blood"] = "T5",
        ["Tower Forging Techique"] = "T5",
        ["Tower Forging"] = "T5",
        ["Evergreen Manual"] = "T5",
        ["Beast Soul Manual"] = "T5",
        ["Beast Soul Possession"] = "T5",
		["Way of Harmony"] = "T5",
		["North Star's Guidance"] = "T5",
		["Evergreen body formula"] = "T5",
        ["Journey To The West"] = "T5"
    }

    -- ### CORE SETUP ###
    local success, targetParent = pcall(function() return CoreGui end)
    local ESPParent = success and targetParent or LocalPlayer:WaitForChild("PlayerGui")

    -----------------------------------------------------------------------------------------------------------------
    -- ### FUNCTIONS ###
    -----------------------------------------------------------------------------------------------------------------

    local function createScriptureESP(object, tier)
        if specialESPObjects[object] then return end

        local bbg = Instance.new("BillboardGui")
        bbg.Name = "ScriptureESP_" .. object.Name
        bbg.AlwaysOnTop = true
        bbg.Size = UDim2.new(0, 200, 0, 50)
        bbg.ExtentsOffset = Vector3.new(0, 3, 0)
        bbg.Adornee = object
        bbg.Parent = ESPParent

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = bbg
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "📕 " .. string.format("[%s] %s", tier, object.Name)
        nameLabel.TextColor3 = TierColors[tier] or Color3.fromRGB(255, 255, 255)
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

        specialESPObjects[object] = {
            Instance = bbg,
            Tier = tier
        }
    end

    local function clearScriptureESP()
        for obj, data in pairs(specialESPObjects) do
            if data.Instance then data.Instance:Destroy() end
        end
        specialESPObjects = {}
    end

    local function setNoclip(enabled)
        if enabled then
            if _G.WarpNoclip then _G.WarpNoclip:Disconnect() end
            _G.WarpNoclip = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA('BasePart') then v.CanCollide = false end
                    end
                end
            end)
        else
            if _G.WarpNoclip then _G.WarpNoclip:Disconnect(); _G.WarpNoclip = nil end
        end
    end

    local function DeathFirstFunction()
        if firstTimeUsingDeath then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then 
                char.Humanoid.Health = 0 
            end
            LocalPlayer.CharacterAdded:Wait()
            task.wait(2)
            firstTimeUsingDeath = false
        end
    end

    local function AutoPressE()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local nearbyParts = workspace:GetPartBoundsInRadius(root.Position, 15)
        for _, part in ipairs(nearbyParts) do
            local prompt = part:FindFirstChildOfClass("ProximityPrompt") or part.Parent:FindFirstChildOfClass("ProximityPrompt")
            if prompt then
                local item = prompt.Parent
                if item and scriptureList[item.Name] then
                    prompt.HoldDuration = 0 
                    prompt:InputHoldBegin()
                    task.wait()
                    prompt:InputHoldEnd()
                    break 
                end
            end
        end
    end

    local function warpToTarget(targetPosition)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        
        if not root or not hum or hum.Health <= 0 then return end 

        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = root

        local distance = (targetPosition - root.Position).Magnitude
        local duration = distance / math.max(warpSpeed, 1)
        local tween = TweenService:Create(root, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)})

        hum.PlatformStand = true
        tween:Play()
        
        local connection
        connection = RunService.Heartbeat:Connect(function()
            if not isWarping or hum.Health <= 0 then
                tween:Cancel()
                if connection then connection:Disconnect() end
            end
        end)

        tween.Completed:Wait()
        if connection then connection:Disconnect() end
        if bv then bv:Destroy() end
        if hum then 
            hum.PlatformStand = false
            hum:ChangeState(Enum.HumanoidStateType.GettingUp) 
        end
    end

    local function findNearestScripture()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return nil end
        
        local nearest = nil
        local minDistance = math.huge
        
        for _, child in pairs(game.Workspace:GetChildren()) do
            if scriptureList[child.Name] then
                local dist = (child:GetPivot().Position - root.Position).Magnitude
                if dist < minDistance then
                    minDistance = dist
                    nearest = child
                end
            end
        end
        return nearest
    end

    -----------------------------------------------------------------------------------------------------------------
    -- ### UI & TOGGLES ###
    -----------------------------------------------------------------------------------------------------------------

    local specialESPtoggle = Tabs.ESPManual:AddToggle("ScriptureESP", {Title = "Show Scripture ESP", Default = false })

    local WarpSpeedSlider = Tabs.ESPManual:AddSlider("WarpSpeed", { 
        Title = "Warp Speed", 
        Default = 50, Min = 1, Max = 100, Rounding = 1, 
        Callback = function(v) warpSpeed = v end 
    })

    local WarpToggle = Tabs.ESPManual:AddToggle("AutoWarpScripture", {Title = "Auto Warp to Scripture", Default = false })

    -----------------------------------------------------------------------------------------------------------------
    -- ### LOOPS ###
    -----------------------------------------------------------------------------------------------------------------

    -- ESP Loop
    task.spawn(function()
        while true do
            if specialESPtoggle.Value then
                for _, child in pairs(game.Workspace:GetChildren()) do
                    if scriptureList[child.Name] then
                        createScriptureESP(child, scriptureList[child.Name])
                    end
                end
            end
            
            -- Cleanup
            for object, data in pairs(specialESPObjects) do
                if not object or not object.Parent or not specialESPtoggle.Value then
                    if data.Instance then data.Instance:Destroy() end
                    specialESPObjects[object] = nil
                end
            end
            task.wait(2)
        end
    end)

    -- Warp Loop
    task.spawn(function()
        while true do
            if isWarping then
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChild("Humanoid")
                
                if hum and hum.Health > 0 then
                    local target = findNearestScripture()
                    if target then
                        warpToTarget(target:GetPivot().Position + Vector3.new(0, 3, 0))
                        task.wait(0.2)
                        AutoPressE()
                        task.wait(0.3)
                    end
                else
                    task.wait(1)
                end
            end
            task.wait(0.5)
        end
    end)

    -- Event Listeners
    WarpToggle:OnChanged(function(v)
        isWarping = v
        if v then
            DeathFirstFunction()
            setNoclip(true)
        else
            setNoclip(false)
        end
    end)

    specialESPtoggle:OnChanged(function()
        if not specialESPtoggle.Value then 
            clearScriptureESP() 
        end
    end)

    -----------------------------------------------------------------------------------------------------------------

    local RunService = game:GetService("RunService")
    local Camera = workspace.CurrentCamera
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer

    -- ### VARIABLES ###
    local firstTimeUsingDeath = true
    local isFlameWarping = false
    local flameWarpSpeed = 50
    local FlameESPObject = {}

    local TierColors = {
        T1 = Color3.fromRGB(255, 255, 255),
        T2 = Color3.fromRGB(85, 255, 127),
        T3 = Color3.fromRGB(0, 170, 255),
        T4 = Color3.fromRGB(170, 85, 255),
        T5 = Color3.fromRGB(255, 0, 0)
    }

    local MysteriusFlameList = {
        ["Disaster Rose"] = "T5",
        ["Great River"] = "T5",
        ["Poison Death"] = "T5",
        ["Azure Moon"] = "T5",
        ["Ice Devil"] = "T5",
        ["Karmic Dao"] = "T5",
        ["Ruinous"] = "T5",
    }

    -- ### CORE SETUP ###
    local success, targetParent = pcall(function() return CoreGui end)
    local ESPParent = success and targetParent or LocalPlayer:WaitForChild("PlayerGui")

    -----------------------------------------------------------------------------------------------------------------
    -- ### FUNCTIONS ###
    -----------------------------------------------------------------------------------------------------------------

    local function createMysteriusFlameESP(object, tier)
        if FlameESPObject[object] then return end

        local bbg = Instance.new("BillboardGui")
        bbg.Name = "MysteriusFlameESP_" .. object.Name
        bbg.AlwaysOnTop = true
        bbg.Size = UDim2.new(0, 200, 0, 50)
        bbg.ExtentsOffset = Vector3.new(0, 3, 0)
        bbg.Adornee = object
        bbg.Parent = ESPParent

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = bbg
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "🔥 " .. string.format("[Flame] %s", object.Name).. " 🔥"
        nameLabel.TextColor3 = TierColors[tier] or Color3.fromRGB(255, 255, 255)
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

        FlameESPObject[object] = {
            Instance = bbg,
            Tier = tier
        }
    end

    local function clearMysteriusFlameESP()
        for obj, data in pairs(FlameESPObject) do
            if data.Instance then data.Instance:Destroy() end
        end
        FlameESPObject = {}
    end

    local function setNoclip(enabled)
        if enabled then
            if _G.FlameNoclip then _G.FlameNoclip:Disconnect() end
            _G.FlameNoclip = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA('BasePart') then v.CanCollide = false end
                    end
                end
            end)
        else
            if _G.FlameNoclip then _G.FlameNoclip:Disconnect(); _G.FlameNoclip = nil end
        end
    end

    local function DeathFirstFunctionFlame()
        if firstTimeUsingDeath then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then 
                char.Humanoid.Health = 0 
            end
            LocalPlayer.CharacterAdded:Wait()
            task.wait(2)
            firstTimeUsingDeath = false
        end
    end

    local function AutoPressFlameE()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end

        local nearbyParts = workspace:GetPartBoundsInRadius(root.Position, 15)
        for _, part in ipairs(nearbyParts) do
            local prompt = part:FindFirstChildOfClass("ProximityPrompt") or part.Parent:FindFirstChildOfClass("ProximityPrompt")
            if prompt then
                local item = prompt.Parent
                if item and MysteriusFlameList[item.Name] then
                    prompt.HoldDuration = 0 
                    prompt:InputHoldBegin()
                    task.wait()
                    prompt:InputHoldEnd()
                    break 
                end
            end
        end
    end

    local function warpToFlame(targetPosition)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        
        if not root or not hum or hum.Health <= 0 then return end 

        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = root

        local distance = (targetPosition - root.Position).Magnitude
        local duration = distance / math.max(flameWarpSpeed, 1)
        local tween = TweenService:Create(root, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)})

        hum.PlatformStand = true
        tween:Play()
        
        local connection
        connection = RunService.Heartbeat:Connect(function()
            if not isFlameWarping or hum.Health <= 0 then
                tween:Cancel()
                if connection then connection:Disconnect() end
            end
        end)

        tween.Completed:Wait()
        if connection then connection:Disconnect() end
        if bv then bv:Destroy() end
        if hum then 
            hum.PlatformStand = false
            hum:ChangeState(Enum.HumanoidStateType.GettingUp) 
        end
    end

    local function findNearestFlame()
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return nil end
        
        local nearest = nil
        local minDistance = math.huge
        
        for _, child in pairs(game.Workspace:GetChildren()) do
            if MysteriusFlameList[child.Name] then
                local dist = (child:GetPivot().Position - root.Position).Magnitude
                if dist < minDistance then
                    minDistance = dist
                    nearest = child
                end
            end
        end
        return nearest
    end

    -----------------------------------------------------------------------------------------------------------------
    -- ### UI & TOGGLES ###
    -----------------------------------------------------------------------------------------------------------------

    local MysteriusFlameESPToggle = Tabs.ESPFlame:AddToggle("MysteriusFlameESP", {Title = "Show Flame ESP", Default = false })

    Tabs.ESPFlame:AddSlider("FlameWarpSpeed", { 
        Title = "Flame Warp Speed", 
        Default = 50, Min = 1, Max = 100, Rounding = 1, 
        Callback = function(v) flameWarpSpeed = v end 
    })

    local FlameWarpToggle = Tabs.ESPFlame:AddToggle("AutoWarpFlame", {Title = "Auto Warp to Flames", Default = false })

    -----------------------------------------------------------------------------------------------------------------
    -- ### LOOPS ###
    -----------------------------------------------------------------------------------------------------------------

    -- ESP Rendering Loop
    RunService.RenderStepped:Connect(function()
        local isEnabled = MysteriusFlameESPToggle.Value
        for object, data in pairs(FlameESPObject) do
            if object and object.Parent and isEnabled then
                data.Instance.Enabled = true
            else
                if not isEnabled then
                    data.Instance.Enabled = false
                else
                    if data.Instance then data.Instance:Destroy() end
                    FlameESPObject[object] = nil
                end
            end
        end
    end)

    -- Find Items Loop
    task.spawn(function()
        while true do
            if MysteriusFlameESPToggle.Value then
                for _, child in pairs(game.Workspace:GetChildren()) do
                    if MysteriusFlameList[child.Name] then
                        createMysteriusFlameESP(child, MysteriusFlameList[child.Name])
                    end
                end
            end
            task.wait(2)
        end
    end)

    -- Warp Management Loop
    task.spawn(function()
        while true do
            if isFlameWarping then
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChild("Humanoid")
                
                if hum and hum.Health > 0 then
                    local target = findNearestFlame()
                    if target then
                        -- วาร์ปไปเหนือ Flame เล็กน้อย (3 studs) เพื่อกันติดพื้น
                        warpToFlame(target:GetPivot().Position + Vector3.new(0, 3, 0))
                        task.wait(0.2)
                        AutoPressFlameE()
                        task.wait(0.3)
                    end
                else
                    task.wait(1)
                end
            end
            task.wait(0.5)
        end
    end)

    -- Toggle Callbacks
    FlameWarpToggle:OnChanged(function(v)
        isFlameWarping = v
        if v then
            DeathFirstFunctionFlame()
            setNoclip(true)
        else
            setNoclip(false)
        end
    end)

    MysteriusFlameESPToggle:OnChanged(function()
        if not MysteriusFlameESPToggle.Value then 
            clearMysteriusFlameESP() 
        end
    end)

    -----------------------------------------------------------------------------------------------------------------
    local RunService = game:GetService("RunService")
    local CoreGui = game:GetService("CoreGui")
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local LocalPlayer = Players.LocalPlayer

    -- ### VARIABLES ###
    local firstTimeUsingDeath = true
    local isSoulWarping = false
    local soulWarpSpeed = 50
    local soulESPObjects = {}

    -- ### CORE SETUP ###
    local success, targetParent = pcall(function() return CoreGui end)
    local ESPParent = success and targetParent or LocalPlayer:WaitForChild("PlayerGui")

    -----------------------------------------------------------------------------------------------------------------
    -- ### FUNCTIONS ###
    -----------------------------------------------------------------------------------------------------------------

    local function createSoulESP(object)
        if soulESPObjects[object] then return end

        local bbg = Instance.new("BillboardGui")
        bbg.Name = "SoulESP_" .. tostring(object.Name)
        bbg.AlwaysOnTop = true
        bbg.Size = UDim2.new(0, 200, 0, 50)
        bbg.ExtentsOffset = Vector3.new(0, 3, 0)
        bbg.Adornee = object
        bbg.Parent = ESPParent

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Parent = bbg
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "✨ [Soul Realm] ✨"
        nameLabel.TextColor3 = Color3.fromRGB(255, 255, 0) -- สีเหลืองทอง
        nameLabel.TextSize = 16
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0
        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

        soulESPObjects[object] = { Instance = bbg }
    end

    local function clearSoulESP()
        for obj, data in pairs(soulESPObjects) do
            if data.Instance then data.Instance:Destroy() end
        end
        soulESPObjects = {}
    end

    local function setSoulNoclip(enabled)
        if enabled then
            if _G.SoulNoclip then _G.SoulNoclip:Disconnect() end
            _G.SoulNoclip = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetDescendants()) do
                        if v:IsA('BasePart') then v.CanCollide = false end
                    end
                end
            end)
        else
            if _G.SoulNoclip then _G.SoulNoclip:Disconnect(); _G.SoulNoclip = nil end
        end
    end

    local function DeathFirstFunctionSoul()
        if firstTimeUsingDeath then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then 
                char.Humanoid.Health = 0 
            end
            LocalPlayer.CharacterAdded:Wait()
            task.wait(2)
            firstTimeUsingDeath = false
        end
    end

    local function AutoPressSoulE(target)
        -- เจาะจงไปที่ SoulPrompt ตามที่คุณระบุ
        local prompt = target:FindFirstChild("SoulPrompt")
        if prompt and prompt:IsA("ProximityPrompt") then
            prompt.HoldDuration = 0 
            prompt:InputHoldBegin()
            task.wait()
            prompt:InputHoldEnd()
        end
    end

    local function warpToSoul(targetPosition)
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        
        if not root or not hum or hum.Health <= 0 then return end 

        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = root

        local distance = (targetPosition - root.Position).Magnitude
        local duration = distance / math.max(soulWarpSpeed, 1)
        local tween = TweenService:Create(root, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)})

        hum.PlatformStand = true
        tween:Play()
        
        local connection
        connection = RunService.Heartbeat:Connect(function()
            if not isSoulWarping or hum.Health <= 0 then
                tween:Cancel()
                if connection then connection:Disconnect() end
            end
        end)

        tween.Completed:Wait()
        if connection then connection:Disconnect() end
        if bv then bv:Destroy() end
        if hum then 
            hum.PlatformStand = false
            hum:ChangeState(Enum.HumanoidStateType.GettingUp) 
        end
    end

    local function findSoulRealm()
        local soulFolder = workspace.Terrain:FindFirstChild("SoulRealm")
        if not soulFolder then return nil end
        
        local items = soulFolder:GetChildren()
        if #items > 0 then
            -- คืนค่าไอเทมแรกที่เจอ (หรือคุณจะวนลูปหาตัวที่ใกล้ที่สุดก็ได้)
            return items[1] 
        end
        return nil
    end

    -----------------------------------------------------------------------------------------------------------------
    -- ### UI & TOGGLES (Tab: ESPSM) ###
    -----------------------------------------------------------------------------------------------------------------

    local SoulESPToggle = Tabs.ESPSM:AddToggle("SoulRealmESP", {Title = "Show Soul Realm ESP", Default = false })

    Tabs.ESPSM:AddSlider("SoulWarpSpeed", { 
        Title = "Warp Speed", 
        Default = 50, Min = 1, Max = 100, Rounding = 1, 
        Callback = function(v) soulWarpSpeed = v end 
    })

    local SoulWarpToggle = Tabs.ESPSM:AddToggle("AutoWarpSoul", {Title = "Auto Warp to Soul Realm", Default = false })

    -----------------------------------------------------------------------------------------------------------------
    -- ### LOOPS ###
    -----------------------------------------------------------------------------------------------------------------

    -- ESP Check Loop
    task.spawn(function()
        while true do
            if SoulESPToggle.Value then
                local soulFolder = workspace.Terrain:FindFirstChild("SoulRealm")
                if soulFolder then
                    for _, child in pairs(soulFolder:GetChildren()) do
                        createSoulESP(child)
                    end
                end
            end
            
            -- Cleanup
            for object, data in pairs(soulESPObjects) do
                if not object or not object.Parent or not SoulESPToggle.Value then
                    if data.Instance then data.Instance:Destroy() end
                    soulESPObjects[object] = nil
                end
            end
            task.wait(2)
        end
    end)

    -- Warp Management Loop
    task.spawn(function()
        while true do
            if isSoulWarping then
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChild("Humanoid")
                
                if hum and hum.Health > 0 then
                    local target = findSoulRealm()
                    if target and target:IsA("BasePart") or target:IsA("Model") then
                        warpToSoul(target:GetPivot().Position)
                        task.wait(0.2)
                        AutoPressSoulE(target)
                        task.wait(0.5)
                    end
                else
                    task.wait(1)
                end
            end
            task.wait(0.5)
        end
    end)

    -- Toggle Callbacks
    SoulWarpToggle:OnChanged(function(v)
        isSoulWarping = v
        if v then
            DeathFirstFunctionSoul()
            setSoulNoclip(true)
        else
            setSoulNoclip(false)
        end
    end)

    SoulESPToggle:OnChanged(function()
        if not SoulESPToggle.Value then 
            clearSoulESP() 
        end
    end)
    -----------------------------------------------------------------------------------------------------------------
    
    local mobsFolder = game.Workspace:WaitForChild("Enemies")
    local TweenService = game:GetService("TweenService")
    local runService = game:GetService("RunService")
    local localPlayer = game.Players.LocalPlayer
    local camera = workspace.CurrentCamera
    local CoreGui = game:GetService("CoreGui")

    -- ### [1] การตั้งค่า ESP Parent (CoreGui) ###
    local success, targetParent = pcall(function()
        return CoreGui
    end)
    local ESPParent = success and targetParent or localPlayer:WaitForChild("PlayerGui")

    local mobEspObjects = {} -- เก็บข้อมูล {Instance, Target}
    local currentSelectedMobNames = {}
    local isWarpingToMob = false
    local currentMobWarpTween = nil
    local warpSpeedMob = 50 
    local desiredAttackOffset = 5
    local firstTimeUsingDeath = true

    -- ### [2] ฟังก์ชันช่วยเหลือ (Freeze & Search) ###
    local function FreezMobs()
        for _, name in ipairs({"Saint Nick", "Little Monkey King"}) do
            local special = workspace:FindFirstChild(name)
            if special and special:FindFirstChild("HumanoidRootPart") then
                special.HumanoidRootPart.Anchored = true
            end
        end
        for _, mob in ipairs(mobsFolder:GetChildren()) do
            local root = mob:FindFirstChild("HumanoidRootPart")
            if root then root.Anchored = true end
        end
    end

    -- ### [3] ฟังก์ชัน ESP (BillboardGui ใน CoreGui) ###
    local function createMobESP(object)
        if mobEspObjects[object] then return end

        local bbg = Instance.new("BillboardGui")
        bbg.Name = "MobESP_" .. object.Name
        bbg.AlwaysOnTop = true
        bbg.Size = UDim2.new(0, 150, 0, 50)
        bbg.ExtentsOffset = Vector3.new(0, 3, 0)
        bbg.Adornee = object:FindFirstChild("HumanoidRootPart") or object
        bbg.Parent = ESPParent

        local nameLabel = Instance.new("TextLabel")
        nameLabel.Name = "NameLabel"
        nameLabel.Parent = bbg
        nameLabel.Size = UDim2.new(1, 0, 1, 0)
        nameLabel.BackgroundTransparency = 1
        nameLabel.Text = "☠️ " .. object.Name
        nameLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
        nameLabel.TextSize = 14
        nameLabel.Font = Enum.Font.GothamBold
        nameLabel.TextStrokeTransparency = 0.5
        nameLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

        mobEspObjects[object] = {
            Instance = bbg,
            Target = object
        }
    end

    local function removeAllMobESP()
        for obj, data in pairs(mobEspObjects) do
            if data.Instance then data.Instance:Destroy() end
        end
        mobEspObjects = {}
    end

    -- ### [4] ระบบจัดการ UI & Dropdown ###
    local mobESPtoggle = Tabs.ESPM:AddToggle("MobESPToggle", {Title = "Show Mob ESP", Default = false })
    local MobListDropdown = Tabs.ESPM:AddDropdown("SelectMob", {
        Title = "Select Mob",
        Values = {},
        Multi = true,
        Default = {},
    })

    local function updateMobList()
        local names = {}
        local hash = {}
        for _, mob in pairs(mobsFolder:GetChildren()) do
            if not hash[mob.Name] then table.insert(names, mob.Name) hash[mob.Name] = true end
        end
        for _, name in ipairs({"Saint Nick", "Little Monkey King"}) do
            if workspace:FindFirstChild(name) and not hash[name] then table.insert(names, name) end
        end
        MobListDropdown:SetValues(names)
    end

    local function refreshMobESP()
        if not mobESPtoggle.Value then
            for _, data in pairs(mobEspObjects) do data.Instance.Enabled = false end
            return
        end

        for obj, data in pairs(mobEspObjects) do
            if not table.find(currentSelectedMobNames, obj.Name) then
                data.Instance:Destroy()
                mobEspObjects[obj] = nil
            end
        end

        for _, mob in pairs(mobsFolder:GetChildren()) do
            if table.find(currentSelectedMobNames, mob.Name) then createMobESP(mob) end
        end
        for _, name in ipairs({"Saint Nick", "Little Monkey King"}) do
            local sm = workspace:FindFirstChild(name)
            if sm and table.find(currentSelectedMobNames, name) then createMobESP(sm) end
        end
    end

    -- RenderStepped อัปเดตสถานะ Billboard
    runService.RenderStepped:Connect(function()
        local isEnabled = mobESPtoggle.Value
        for obj, data in pairs(mobEspObjects) do
            if obj and obj.Parent and isEnabled then
                local hum = obj:FindFirstChild("Humanoid")
                data.Instance.Enabled = (hum and hum.Health > 0) or true
            else
                if not isEnabled then
                    data.Instance.Enabled = false
                else
                    if data.Instance then data.Instance:Destroy() end
                    mobEspObjects[obj] = nil
                end
            end
        end
    end)

    -- Events สำหรับ Dropdown
    MobListDropdown:OnChanged(function(value)
        currentSelectedMobNames = {}
        for name, isSelected in pairs(value) do
            if isSelected then table.insert(currentSelectedMobNames, name) end
        end
        refreshMobESP()
    end)

    mobESPtoggle:OnChanged(function()
        if mobESPtoggle.Value then updateMobList() else removeAllMobESP() end
        refreshMobESP()
    end)

    -- Loop อัปเดตรายชื่อม็อบเกิดใหม่
    task.spawn(function()
        while true do
            if mobESPtoggle.Value then 
                updateMobList() 
                refreshMobESP() 
            end
            task.wait(5)
        end
    end)

    -- ### [5] ระบบโจมตีและวาร์ป (ฟังก์ชันเดิมทั้งหมด) ###
    Tabs.ESPM:AddSlider("AttackOffset", { Title = "Attack Offset", Default = 5, Min = 0, Max = 20, Rounding = 1, Callback = function(v) desiredAttackOffset = v end })
    Tabs.ESPM:AddSlider("MobWarpSpeed", { Title = "Warp Speed (Studs/s)", Default = 50, Min = 10, Max = 100, Rounding = 1, Callback = function(v) warpSpeedMob = v end })

    local function getNearestTargetRoot(selectedMobNames, rootPart)
        local nearestTarget, shortestDistance = nil, math.huge
        local targets = {}
        for _, mob in pairs(mobsFolder:GetChildren()) do if table.find(selectedMobNames, mob.Name) then table.insert(targets, mob) end end
        for _, name in ipairs({"Saint Nick", "Little Monkey King"}) do
            local sm = workspace:FindFirstChild(name)
            if sm and table.find(selectedMobNames, name) then table.insert(targets, sm) end
        end
        for _, mob in ipairs(targets) do
            local mRoot = mob:FindFirstChild("HumanoidRootPart")
            local hum = mob:FindFirstChild("Humanoid")
            if mRoot and hum and hum.Health > 0 then
                local dist = (rootPart.Position - mRoot.Position).Magnitude
                if dist < shortestDistance then shortestDistance = dist nearestTarget = mRoot end
            end
        end
        return nearestTarget, shortestDistance
    end

    local function mobWarpTween(targetCFrame)
        local char = localPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local distance = (targetCFrame.Position - root.Position).Magnitude
        if distance < 2 then return end
        local duration = distance / math.max(warpSpeedMob, 1)
        local bv = Instance.new("BodyVelocity", root)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        local tweenInfo = TweenInfo.new(duration, Enum.EasingStyle.Linear)
        currentMobWarpTween = TweenService:Create(root, tweenInfo, {CFrame = targetCFrame})
        char.Humanoid.PlatformStand = true
        currentMobWarpTween:Play()
        currentMobWarpTween.Completed:Wait()
        bv:Destroy()
        char.Humanoid.PlatformStand = false
    end

    local function attackMobLoop()
        while isWarpingToMob do
            local char = localPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not root then task.wait(1) continue end
            local targetRoot, dist = getNearestTargetRoot(currentSelectedMobNames, root)
            if targetRoot then
                local targetCFrame = targetRoot.CFrame * CFrame.new(0, 0, desiredAttackOffset)
                if dist > (desiredAttackOffset + 2) then
                    mobWarpTween(targetCFrame)
                else
                    root.CFrame = CFrame.lookAt(root.Position, targetRoot.Position)
                    game:GetService("ReplicatedStorage").Remotes.Punch:FireServer(0)
                    task.wait(0.1)
                end
            end
            task.wait(0.1)
        end
    end

    local function DeathFirstFunctionMob()
        if firstTimeUsingDeath then
            local char = localPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.Health = 0
                localPlayer.CharacterAdded:Wait()
                task.wait(2)
            end
            firstTimeUsingDeath = false
        end
    end

    local autoAttackMoblist = Tabs.ESPM:AddToggle("AttackMobESPToggle", {Title = "Auto Warp & Attack Mob", Default = false })
    autoAttackMoblist:OnChanged(function()
        isWarpingToMob = autoAttackMoblist.Value
        if isWarpingToMob then
            DeathFirstFunctionMob()
            task.wait(1)
            FreezMobs()
            task.spawn(attackMobLoop)
        elseif currentMobWarpTween then
            currentMobWarpTween:Cancel()
        end
    end)

    ---------------------------------------------------------------------------------------------------------------

    Tabs.ESPM:AddButton({
        Title = "Freeze All Mob",
        Description = "Click to freeze mob when automatic freeze not work",
        Callback = function()
            FreezMobs()

            Fluent:Notify({
                Title = "Notify",
                Content = "Now the mob is freeze",
                Duration = 3
            })
        end
    })
    -----------------------------------------------------------------------------------------------------------------

    HowToUseAutoFast = Tabs.AutoHerb:AddParagraph({
        Title = "How to do it work",
        Content = "\n1 . On the auto press E function\n2 . Select herbs in dropdown\n3 . On auto herb warp function\n\nThe dropdown will only show herbs that are spawned in the server, but the script will add the herb you select to the list and still auto-warp when the herb respawns."
    })

    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local workspace = game:GetService("Workspace")
    local TweenService = game:GetService("TweenService")
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
    local Humanoid = Character:WaitForChild("Humanoid")

    -- Variables
    local savedSelection = {}
    local priorityList = {} 
    local isWarping = false
    local currentWarpThread = nil
    local firstTimeUsingDeath = true
    local warpSpeed = 50
    local IsAutoPressE = false

    local HerbsFolder = workspace:WaitForChild("Herbs")

    local function getHerbName(herbObject)
        local prompt = herbObject:FindFirstChildWhichIsA("ProximityPrompt", true)
        if prompt then
            return (prompt.ObjectText ~= "" and prompt.ObjectText) or prompt.ActionText or herbObject.Name
        end
        return herbObject.Name
    end

    local function getVisibleHerbNamesFast()
        local namesInMap = {}
        local hash = {} 
        for _, herb in pairs(HerbsFolder:GetChildren()) do
            local realName = getHerbName(herb)
            if not hash[realName] then
                table.insert(namesInMap, realName)
                hash[realName] = true
            end
        end
        table.sort(namesInMap)
        return #namesInMap > 0 and namesInMap or {"Waiting for Herbs..."}
    end

    local function AutoPressE()
        local character = player.Character
        if not character or not character:FindFirstChild("HumanoidRootPart") then return end
        local rootPart = character.HumanoidRootPart
        local overlapParams = OverlapParams.new()
        overlapParams.FilterType = Enum.RaycastFilterType.Exclude
        overlapParams.FilterDescendantsInstances = {character}
        local nearbyParts = workspace:GetPartBoundsInRadius(rootPart.Position, 15, overlapParams)
        for _, part in ipairs(nearbyParts) do
            local prompt = part:FindFirstChildOfClass("ProximityPrompt") or part.Parent:FindFirstChildOfClass("ProximityPrompt")
            if prompt and prompt:IsDescendantOf(HerbsFolder) and prompt.Enabled then
                local distance = (part.Position - rootPart.Position).Magnitude
                if distance <= prompt.MaxActivationDistance then
                    prompt.HoldDuration = 0
                    task.spawn(function()
                        prompt:InputHoldBegin()
                        task.wait(0.05)
                        prompt:InputHoldEnd()
                    end)
                end
            end
        end
    end

    -----------------------------------------------------------------------------------------------------------------
    -- UI Section
    -----------------------------------------------------------------------------------------------------------------

    local HerbListDropdownWarpFast = Tabs.AutoHerb:AddDropdown("SelectHerbWarp", {
        Title = "1. Select Herbs to Save",
        Values = getVisibleHerbNamesFast(),
        Multi = true, 
        Default = {},
    })

    local PriorityDropdown = Tabs.AutoHerb:AddDropdown("PrioritySelection", {
        Title = "2. Set Priority Order (Optional)",
        Values = {}, 
        Multi = true,
        Default = {},
    })

    local HerbParagraph = nil
    local function updateParagraph()
        if HerbParagraph then HerbParagraph:Destroy(); HerbParagraph = nil end
        local content = ""
        
        if #priorityList > 0 then
            content = content .. "🏆 Priority Order:\n"
            for i, name in ipairs(priorityList) do
                content = content .. i .. ". " .. name .. "\n"
            end
            content = content .. "------------------------\n"
        else
            content = content .. "⚠️ No Priority: Hunting Nearest Saved\n------------------------\n"
        end

        local list = {}
        for name, isSelected in pairs(savedSelection) do
            if isSelected then table.insert(list, "• " .. name) end
        end
        table.sort(list)
        content = content .. "Saved List: " .. (#list > 0 and table.concat(list, ", ") or "Empty")

        HerbParagraph = Tabs.AutoHerb:AddParagraph({
            Title = "Status & Priority",
            Content = content
        })
    end

    HerbListDropdownWarpFast:OnChanged(function(value)
        local currentDropdownItems = getVisibleHerbNamesFast()
        local newPriorityOptions = {}
        for _, name in ipairs(currentDropdownItems) do
            if value[name] then
                savedSelection[name] = true
            else
                savedSelection[name] = nil
                local idx = table.find(priorityList, name)
                if idx then table.remove(priorityList, idx) end
            end
        end
        for name, _ in pairs(savedSelection) do
            table.insert(newPriorityOptions, name)
        end
        table.sort(newPriorityOptions)
        PriorityDropdown:SetValues(newPriorityOptions)
        updateParagraph()
    end)

    -- [FIXED LOGIC]
    PriorityDropdown:OnChanged(function(value)
        local updatedList = {}
        -- ตรวจสอบจากลิสต์เดิมก่อนเพื่อรักษาลำดับ
        for _, name in ipairs(priorityList) do
            if value[name] then
                table.insert(updatedList, name)
            end
        end
        -- เพิ่มตัวใหม่ที่เพิ่งถูกเลือก
        for name, isSelected in pairs(value) do
            if isSelected and not table.find(updatedList, name) then
                table.insert(updatedList, name)
            end
        end
        priorityList = updatedList
        updateParagraph()
    end)

    task.spawn(function()
        while true do
            local currentMapHerbs = getVisibleHerbNamesFast()
            if #currentMapHerbs ~= #HerbListDropdownWarpFast.Values then
                HerbListDropdownWarpFast:SetValues(currentMapHerbs)
            end
            task.wait(10)
        end
    end)

    -----------------------------------------------------------------------------------------------------------------
    -- Search & Warp
    -----------------------------------------------------------------------------------------------------------------

    local function findTargetHerbFast()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return nil end

        -- 1. ลอจิก Priority
        if #priorityList > 0 then
            for _, targetName in ipairs(priorityList) do
                local bestHerb = nil
                local minDistance = math.huge
                for _, herb in pairs(HerbsFolder:GetChildren()) do
                    if getHerbName(herb) == targetName then
                        local distance = (herb:GetPivot().Position - root.Position).Magnitude
                        if distance < minDistance then
                            minDistance = distance
                            bestHerb = herb
                        end
                    end
                end
                if bestHerb then return bestHerb end
            end
        end

        -- 2. ลอจิกปกติ (ถ้า Priority ว่าง)
        local nearestHerb = nil
        local minDistance = math.huge
        for _, herb in pairs(HerbsFolder:GetChildren()) do
            local realName = getHerbName(herb)
            if savedSelection[realName] then
                local distance = (herb:GetPivot().Position - root.Position).Magnitude
                if distance < minDistance then
                    minDistance = distance
                    nearestHerb = herb
                end
            end
        end
        return nearestHerb
    end

    local function noclipFast()
        if _G.NoclipConn then _G.NoclipConn:Disconnect() end
        _G.NoclipConn = RunService.Stepped:Connect(function()
            if LocalPlayer.Character then
                for _, v in pairs(LocalPlayer.Character:GetDescendants()) do
                    if v:IsA('BasePart') then v.CanCollide = false end
                end
            end
        end)
    end

    local function clipFast()
        if _G.NoclipConn then _G.NoclipConn:Disconnect() ; _G.NoclipConn = nil end
    end

    local function DeathFirstFunctionFast()
        if firstTimeUsingDeath then
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then char.Humanoid.Health = 0 end
            player.CharacterAdded:Wait()
            task.wait(2)
            firstTimeUsingDeath = false
        end
    end

    local function warpFast(targetPosition)
        local Character = LocalPlayer.Character
        local root = Character and Character:FindFirstChild("HumanoidRootPart")
        local hum = Character and Character:FindFirstChild("Humanoid")
        if not root or not hum then return end 
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Velocity = Vector3.new(0, 0, 0)
        bv.Parent = root
        local distance = (targetPosition - root.Position).Magnitude
        local duration = distance / (tonumber(warpSpeed) or 50)
        local tween = TweenService:Create(root, TweenInfo.new(math.max(duration, 0.1), Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPosition)})
        hum.PlatformStand = true 
        tween:Play()
        tween.Completed:Connect(function()
            if bv then bv:Destroy() end
            hum.PlatformStand = false
            hum:ChangeState(Enum.HumanoidStateType.Running) 
        end)
        tween.Completed:Wait()
    end

    local function autoWarpLoopFast()
        while isWarping do
            local target = findTargetHerbFast()
            if target then
                warpFast(target:GetPivot().Position + Vector3.new(0, 5, 0))
                task.wait(0.1)
            else
                task.wait(2)
            end
        end
    end

    -----------------------------------------------------------------------------------------------------------------
    -- Controls
    -----------------------------------------------------------------------------------------------------------------

    Tabs.AutoHerb:AddButton({
        Title = "Clear All Selections",
        Callback = function()
            Window:Dialog({
                Title = "Clear All",
                Content = "Confirm to clear all selected herbs.",
                Buttons = {
                    { Title = "Confirm", Callback = function()
                        savedSelection = {} 
                        priorityList = {}
                        HerbListDropdownWarpFast:SetValue({}) 
                        PriorityDropdown:SetValue({})
                        updateParagraph()
                    end },
                    { Title = "Cancel" }
                }
            })
        end
    })

    local AutoPressEBut = Tabs.AutoHerb:AddToggle("AutoPressEToggle", {Title = "Auto Press E", Default = false })
    AutoPressEBut:OnChanged(function()
        IsAutoPressE = Options.AutoPressEToggle.Value
        if IsAutoPressE then
            task.spawn(function()
                while IsAutoPressE do AutoPressE() ; task.wait(0.2) end
            end)
        end
    end)

    Tabs.AutoHerb:AddSlider("warpspeed", { Title = "Warp Speed", Default = 50, Min = 1, Max = 100, Rounding = 1, Callback = function(v) warpSpeed = v end })

    local WarpFastToggle = Tabs.AutoHerb:AddToggle("AutoWarpFastToggle", { Title = "Start Auto Herb Warp", Default = false })
    WarpFastToggle:OnChanged(function(enabled)
        isWarping = enabled
        if enabled then
            DeathFirstFunctionFast()
            noclipFast()
            currentWarpThread = task.spawn(autoWarpLoopFast)
        else
            clipFast()
            if currentWarpThread then task.cancel(currentWarpThread) ; currentWarpThread = nil end
        end
    end)
    
----------------------------------------------------------------------------------------------------
    local Success, Info = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    end)

    local GameName = Success and Info.Name or "Unknown Game"

    Tabs.HSV:AddParagraph({
        Title = "Server Information.",
        Content = "\nGame Name : " .. GameName .. "\nGame ID : " .. game.PlaceId .. "\nServer ID : " .. game.JobId
    })

    Tabs.HSV:AddButton({
        Title = "HOP Server [Faster]",
        Description = "Click To Teleport Random Server",
        Callback = function()
            local TeleportService = game:GetService("TeleportService")
            local HttpService = game:GetService("HttpService")

            local Servers = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            local Server, Next = nil, nil
            local function ListServers(cursor)
                local Raw = game:HttpGet(Servers .. ((cursor and "&cursor=" .. cursor) or ""))
                return HttpService:JSONDecode(Raw)
            end
            repeat
                local Servers = ListServers(Next)
                if Servers.data and #Servers.data > 0 then
                    Server = Servers.data[math.random(1, math.min(#Servers.data, math.floor(#Servers.data / 3)))]
                else
                    local success, err = pcall(function()
                        TeleportService:Teleport(game.PlaceId, game.Players.LocalPlayer)
                    end)
                    break
                end
                Next = Servers.nextPageCursor
            until Server

            if Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
                TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, game.Players.LocalPlayer)
            end
        end
    })

    if not isfolder("VichianHUB") then
        makefolder("VichianHUB")
    end

    local FILE_PART = "VichianHUB/log_server_list.txt"
    local TeleportService = game:GetService("TeleportService")
    local HttpService = game:GetService("HttpService")

    local function GetLoggedServers()
        if isfile(FILE_PART) then
            local content = readfile(FILE_PART)
            return HttpService:JSONDecode(content) or {}
        end
        return {}
    end

    local function SaveServerToLog(serverId)
        local logged = GetLoggedServers()
        logged[serverId] = true
        writefile(FILE_PART, HttpService:JSONEncode(logged))
    end

    local ServerList = Tabs.HSV:AddDropdown("SelectServer", {
        Title = "HOP Selected (Players/Max)",
        Description = "Select To HOP Server",
        Values = {},
        Multi = false,
        Default = "None",
    })

    local CurrentServers = {}

    local function UpdateServerDropdown()
        local ServerTable = {}
        local ServerDataMap = {}
        local loggedServers = GetLoggedServers()
        
        local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
        
        local success, result = pcall(function()
            local raw = game:HttpGet(url)
            return HttpService:JSONDecode(raw)
        end)

        if success and result.data then
            for _, s in pairs(result.data) do
                if s.id ~= game.JobId and s.playing < s.maxPlayers and not loggedServers[s.id] then
                    local label = "Players: " .. s.playing .. "/" .. s.maxPlayers .. " [" .. s.id:sub(1,8) .. "]"
                    table.insert(ServerTable, label)
                    ServerDataMap[label] = s.id
                end
            end
        end

        ServerList:SetValues(ServerTable)
        CurrentServers = ServerDataMap
    end

    Tabs.HSV:AddButton({
        Title = "Clear Server Log",
        Description = "Clear the server log to appere in dropdown again.",
        Callback = function()
            Window:Dialog({
                Title = "Clear All Server Log",
                Content = "Confirm to clear all server logs.",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            if isfile(FILE_PART) then
                                delfile(FILE_PART)
                                print("Cleared server logs!")
                                UpdateServerDropdown()
                            end
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled")
                        end
                    }
                }
            })
        end
    })

    ServerList:OnChanged(function(Value)
        local targetServerId = CurrentServers[Value]
        if targetServerId then
            Fluent:Notify({
                Title = "Teleporting to ",
                Content = targetServerId,
                Duration = 3
            })
            print("Saving to log and teleporting to:", targetServerId)
            SaveServerToLog(targetServerId)
            wait(3)
            TeleportService:TeleportToPlaceInstance(game.PlaceId, targetServerId, game.Players.LocalPlayer)
        end
    end)

    task.spawn(function()
        while true do
            local count = 0
            for _ in pairs(CurrentServers) do count = count + 1 end
            if count == 0 then
                Fluent:Notify({
                    Title = "No servers available in list",
                    Content = "fetching new data...",
                    Duration = 3
                })
                UpdateServerDropdown()
            end
            
            task.wait(5)
        end
    end)

end


SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})


InterfaceManager:SetFolder("VichianHUB")
SaveManager:SetFolder("VichianHUB/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

SaveManager:LoadAutoloadConfig()
