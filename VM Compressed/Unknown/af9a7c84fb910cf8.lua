-- =================================
-- https://rscripts.net/@r77
-- DEV -- > R-77
-- https://rscripts.net/@r77
-- =================================

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local workspaceRef = workspace

-- variables
local ESPData, DeadESPData = {}, {}
local animalESPEnabled, deadAnimalESPEnabled = false, false
local magicBulletEnabled = false
local magicHitboxSize = 15
local magicTransparency = 0.7
local magicColor = Color3.fromRGB(255, 0, 0)
local magicFolder = "Animals"

local targetSpeed = 16
local speedUpdateConnection = nil
local aimTarget = "Body" -- not used anymore but kept for safe keeping, idk why lol
local espColor = Color3.fromRGB(255, 200, 50)
local deadEspColor = Color3.fromRGB(255, 100, 100)
local selectedAnimals = {}
local useConstantSpeed = false
local animalTeleportList, deadAnimalTeleportList = {}, {}

-- main ui window
local Window = Rayfield:CreateWindow({
   Name = "Hunting Season by R-77",
   LoadingTitle = "Hunting Season Script",
   LoadingSubtitle = "made with love by R-77",
   ConfigurationSaving = { Enabled = true, FolderName = "HuntingSeasonScript", FileName = "HuntingConfig" },
   Discord = { Enabled = false, Invite = "noinvitelink", RememberJoins = true },
   KeySystem = false -- free script without key.... uhhh nobody really cares, nobody will read this
})

local MainTab     = Window:CreateTab("Main Features", 4483362458)
local ESPTab      = Window:CreateTab("ESP", 4483362458)
local AimTab      = Window:CreateTab("Magic Bullet", 4483362458) -- aim now magic bullet
local TeleportTab = Window:CreateTab("Teleport", 4483362458)
local AnimalTPTab = Window:CreateTab("Animal TP", 4483362458)
local DeadAnimalTPTab = Window:CreateTab("Dead Animal TP", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)
-- detected tab (temporaly, cuz if me don't find new method for undetect speedhack i will remove him)
local DetectedTab = Window:CreateTab("DETECTED", 4483362458) 

-- helpers
local function findRootPart(model)
    if model.PrimaryPart then return model.PrimaryPart end
    for _, child in ipairs(model:GetDescendants()) do
        if child:IsA("BasePart") then return child end
    end
    return nil
end

-- magic bullet helper
local function getBestPart(model)
    local part = model:FindFirstChild("HumanoidRootPart")
    
    if not part then part = model:FindFirstChild("Torso") or model:FindFirstChild("UpperTorso") end
    
    if not part then part = model:FindFirstChild("Head") end
    
    if not part then
        for _, child in ipairs(model:GetChildren()) do
            if child:IsA("BasePart") then
                part = child
                break
            end
        end
    end
    
    return part
end

-- -- magic bullet main logic
local function updateMagicHitboxes()
    if not magicBulletEnabled then return end

    local folder = Workspace:FindFirstChild(magicFolder)
    if not folder then return end

    for _, model in ipairs(folder:GetDescendants()) do
        if model:IsA("Model") then
            local targetPart = getBestPart(model)

            if targetPart then
                targetPart.Size = Vector3.new(magicHitboxSize, magicHitboxSize, magicHitboxSize)
                targetPart.Transparency = magicTransparency
                targetPart.Color = magicColor
                targetPart.Material = Enum.Material.ForceField -- Эффект силового поля
                
                targetPart.CanCollide = false -- Отключаем коллизию, чтобы животные не застревали
                targetPart.Massless = true    -- Отключаем массу, чтобы они не падали/не улетали
            end
        end
    end
end

-- esp
local function createESPForModel(model, isDead)
    if not model or not model:IsA("Model") then return end
    local dataTable = isDead and DeadESPData or ESPData
    if dataTable[model] then return end

    if not isDead and next(selectedAnimals) ~= nil and not selectedAnimals[model.Name] then return end

    local rootPart = findRootPart(model)
    if not rootPart then return end

    local billGui = Instance.new("BillboardGui")
    billGui.Name = isDead and "DeadAnimalESPBillboard" or "AnimalESPBillboard"
    billGui.Adornee = rootPart
    billGui.Size = UDim2.new(0, 140, 0, 30)
    billGui.StudsOffset = Vector3.new(0, 2.5, 0)
    billGui.AlwaysOnTop = true
    billGui.ResetOnSpawn = false
    billGui.Parent = model

    local label = Instance.new("TextLabel")
    label.Name = "ESPLabel"
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = isDead and deadEspColor or espColor
    label.TextStrokeColor3 = Color3.new(0, 0, 0)
    label.TextStrokeTransparency = 0.3
    label.Font = Enum.Font.GothamBold
    label.TextScaled = false
    label.TextSize = 14
    label.Text = ""
    label.Parent = billGui

    dataTable[model] = { billGui = billGui, label = label, part = rootPart }
end

local function destroyESPForModel(model, isDead)
    local dataTable = isDead and DeadESPData or ESPData
    local data = dataTable[model]
    if not data then return end
    if data.billGui and data.billGui.Parent then data.billGui:Destroy() end
    dataTable[model] = nil
end

local function updateESPForModel(model, data, isDead)
    if not data.part or not data.label or not data.billGui then return end
    if not model:IsDescendantOf(workspaceRef) then destroyESPForModel(model, isDead) return end

    local worldPos = data.part.Position + Vector3.new(0, 2.5, 0)
    local camera = workspace.CurrentCamera
    local _, onScreen = camera:WorldToViewportPoint(worldPos)  -- fix (getting second callback)
    if not onScreen then data.billGui.Enabled = false return end

    local playerRoot = LocalPlayer.Character and (LocalPlayer.Character:FindFirstChild("HumanoidRootPart") or LocalPlayer.Character:FindFirstChild("Head"))
    if not playerRoot then data.billGui.Enabled = false return end

    local dist = math.floor((playerRoot.Position - data.part.Position).Magnitude)
    local prefix = isDead and "[DEAD] " or ""
    data.label.Text = prefix .. model.Name .. " [" .. tostring(dist) .. "m]"
    data.billGui.Enabled = isDead and deadAnimalESPEnabled or animalESPEnabled
end

-- tp lists
local function updateAnimalTeleportList()
    animalTeleportList = {}
    local animalsFolder = workspaceRef:FindFirstChild("Animals")
    if animalsFolder then
        for _, m in ipairs(animalsFolder:GetChildren()) do
            if m:IsA("Model") then
                local rp = findRootPart(m)
                if rp then table.insert(animalTeleportList, {name=m.Name, model=m, position=rp.Position}) end
            end
        end
        for _, m in ipairs(animalsFolder:GetDescendants()) do
            if m:IsA("Model") and m.Parent ~= animalsFolder then
                local rp = findRootPart(m)
                if rp then table.insert(animalTeleportList, {name=m.Name, model=m, position=rp.Position}) end
            end
        end
    end
    return #animalTeleportList
end

local function updateDeadAnimalTeleportList()
    deadAnimalTeleportList = {}
    local deadFolder = workspaceRef:FindFirstChild("DeadAnimals")
    if deadFolder then
        for _, m in ipairs(deadFolder:GetChildren()) do
            if m:IsA("Model") then
                local rp = findRootPart(m)
                if rp then table.insert(deadAnimalTeleportList, {name=m.Name, model=m, position=rp.Position}) end
            end
        end
        for _, m in ipairs(deadFolder:GetDescendants()) do
            if m:IsA("Model") and m.Parent ~= deadFolder then
                local rp = findRootPart(m)
                if rp then table.insert(deadAnimalTeleportList, {name=m.Name, model=m, position=rp.Position}) end
            end
        end
    end
    return #deadAnimalTeleportList
end

-- ttp(pos)
local function teleportToPosition(pos)
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
        Rayfield:Notify({Title="Teleported", Content="Successfully teleported to location", Duration=2, Image=4483362458})
    else
        Rayfield:Notify({Title="Teleport Failed", Content="Character not found", Duration=2, Image=4483362458})
    end
end

local function teleportToAnimal(animalData)
    if animalData and animalData.model and animalData.model:IsDescendantOf(workspaceRef) then
        local rp = findRootPart(animalData.model)
        if rp then teleportToPosition(rp.Position + Vector3.new(0,5,0))
        else Rayfield:Notify({Title="Teleport Failed", Content=animalData.name .. " not accessible", Duration=2, Image=4483362458}) end
    else
        Rayfield:Notify({Title="Animal Not Found", Content="Animal no longer exists", Duration=2, Image=4483362458})
    end
end

-- speed
local function applySpeed()
    local char = LocalPlayer.Character
    if not char then return end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if hum then hum.WalkSpeed = targetSpeed end
end

local function startSpeedUpdater()
    if speedUpdateConnection then speedUpdateConnection:Disconnect() end
    if useConstantSpeed then
        speedUpdateConnection = RunService.Heartbeat:Connect(function()
            local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.WalkSpeed ~= targetSpeed then hum.WalkSpeed = targetSpeed end
        end)
    end
end

local function onCharacterAdded(character)
    local hum = character:WaitForChild("Humanoid", 5)
    if not hum then return end
    hum.WalkSpeed = targetSpeed
    if useConstantSpeed then
        hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if hum.WalkSpeed ~= targetSpeed then hum.WalkSpeed = targetSpeed end
        end)
        hum.StateChanged:Connect(function() task.wait() hum.WalkSpeed = targetSpeed end)
    end
end

-- events
Players.LocalPlayer.CharacterAdded:Connect(onCharacterAdded)
if LocalPlayer.Character then task.spawn(function() onCharacterAdded(LocalPlayer.Character) end) end

-- magic bullet heartbeat
RunService.Heartbeat:Connect(updateMagicHitboxes)

-- esp main loop
RunService.RenderStepped:Connect(function()
    if animalESPEnabled then
        local animalsFolder = workspaceRef:FindFirstChild("Animals")
        local now = {}
        if animalsFolder then
            for _, c in ipairs(animalsFolder:GetChildren()) do
                if c:IsA("Model") then now[c]=true if not ESPData[c] then createESPForModel(c,false) end end
            end
            for _, c in ipairs(animalsFolder:GetDescendants()) do
                if c:IsA("Model") then now[c]=true if not ESPData[c] then createESPForModel(c,false) end end
            end
        end
        for m,_ in pairs(ESPData) do if not now[m] then destroyESPForModel(m,false) end end
        for m,d in pairs(ESPData) do updateESPForModel(m,d,false) end
    end

    if deadAnimalESPEnabled then
        local deadFolder = workspaceRef:FindFirstChild("DeadAnimals")
        local now = {}
        if deadFolder then
            for _, c in ipairs(deadFolder:GetChildren()) do
                if c:IsA("Model") then now[c]=true if not DeadESPData[c] then createESPForModel(c,true) end end
            end
            for _, c in ipairs(deadFolder:GetDescendants()) do
                if c:IsA("Model") then now[c]=true if not DeadESPData[c] then createESPForModel(c,true) end end
            end
        end
        for m,_ in pairs(DeadESPData) do if not now[m] then destroyESPForModel(m,true) end end
        for m,d in pairs(DeadESPData) do updateESPForModel(m,d,true) end
    end
end)

-- binds
local function onAnimalAdded(child, isDead)
    if child:IsA("Model") then
        local enabled = isDead and deadAnimalESPEnabled or animalESPEnabled
        if enabled then createESPForModel(child, isDead) end
    end
end

local function bindAnimalFolder(folder, isDead)
    folder.ChildAdded:Connect(function(ch) onAnimalAdded(ch, isDead) end)
    folder.DescendantAdded:Connect(function(desc)
        if desc:IsA("Model") then
            local enabled = isDead and deadAnimalESPEnabled or animalESPEnabled
            if enabled then createESPForModel(desc, isDead) end
        end
    end)
end

local animalsFolder = workspaceRef:FindFirstChild("Animals")
local deadAnimalsFolder = workspaceRef:FindFirstChild("DeadAnimals")
if animalsFolder then bindAnimalFolder(animalsFolder, false) end
if deadAnimalsFolder then bindAnimalFolder(deadAnimalsFolder, true) end
workspaceRef.ChildAdded:Connect(function(ch)
    if ch:IsA("Folder") and ch.Name=="Animals" then bindAnimalFolder(ch,false) end
    if ch:IsA("Folder") and ch.Name=="DeadAnimals" then bindAnimalFolder(ch,true) end
end)

-- main tab
MainTab:CreateParagraph({
   Title="Welcome",
   Content="Welcome to Hunting Season Script. Author - R-77."
})

-- animal tp tab
local selectedAnimalIndex, selectedDeadAnimalIndex = 1, 1
local selectedAnimalName, selectedDeadAnimalName = "", ""

local AnimalDropdown = AnimalTPTab:CreateDropdown({
   Name="Select Animal to Teleport",
   Options={"Loading..."},
   CurrentOption={"Loading..."},
   AllowMultiple=false,
   Flag="AnimalTeleport",
   Callback=function(Option)
      local picked = type(Option)=="table" and Option[1] or Option
      pcall(function()
         -- extract animal name from display string (remove distance part)
         local animalName = picked:match("^(.+)%s%[%d+m%]$") or picked
         selectedAnimalName = animalName
         
         -- fibn system (to 100% pick true animal)
         for i, a in ipairs(animalTeleportList) do
            if a.name == animalName then 
               selectedAnimalIndex = i 
               break 
            end
         end
      end)
   end
})

AnimalTPTab:CreateButton({
   Name="Refresh Animal List (if loading, refresh again)",
   Callback=function()
      pcall(function()
         local count = updateAnimalTeleportList()
         local options = {}
         for _, a in ipairs(animalTeleportList) do
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local dist = "?"
            if hrp then dist = math.floor((hrp.Position - a.position).Magnitude) end
            options[#options+1] = a.name .. " ["..dist.."m]"
         end
         if #options==0 then options = {"— no live animals —"} end
         
         -- properly refresh dropdown and maintain selection if possible
         if AnimalDropdown.Refresh then AnimalDropdown:Refresh(options) end
         
         if #options > 0 and options[1] ~= "— no live animals —" then 
            local foundIndex = 1
            if selectedAnimalName ~= "" then
               for i, a in ipairs(animalTeleportList) do
                  if a.name == selectedAnimalName then
                     foundIndex = i
                     break
                  end
               end
            end
            selectedAnimalIndex = foundIndex
            if AnimalDropdown.Set then AnimalDropdown:Set({options[foundIndex]}) end
         else
            selectedAnimalIndex = 0
            selectedAnimalName = ""
         end
         
         Rayfield:Notify({Title="Animal List Refreshed", Content="Found "..tostring(count).." live animals", Duration=2, Image=4483362458})
      end)
   end
})

AnimalTPTab:CreateButton({
   Name="Teleport to Selected Animal",
   Callback=function()
      pcall(function()
         -- find animal by name for more reliable teleportation (pls work or i will delete this piece of shitcode)
         local targetAnimal = nil
         if selectedAnimalName ~= "" then
            for _, a in ipairs(animalTeleportList) do
               if a.name == selectedAnimalName then
                  targetAnimal = a
                  break
               end
            end
         elseif selectedAnimalIndex > 0 and animalTeleportList[selectedAnimalIndex] then
            targetAnimal = animalTeleportList[selectedAnimalIndex]
         end
         
         if targetAnimal then
            Rayfield:Notify({Title="Teleporting...", Content="Teleporting to " .. targetAnimal.name, Duration=1, Image=4483362458})
            teleportToAnimal(targetAnimal)
         else
            Rayfield:Notify({Title="Animal Not Found", Content="Selected animal no longer exists. Try refreshing the list.", Duration=3, Image=4483362458})
         end
      end)
   end
})

-- dead animal dropdown
local DeadAnimalDropdown = DeadAnimalTPTab:CreateDropdown({
   Name="Select Dead Animal to Teleport",
   Options={"Loading..."},
   CurrentOption={"Loading..."},
   AllowMultiple=false,
   Flag="DeadAnimalTeleport",
   Callback=function(Option)
      local picked = type(Option)=="table" and Option[1] or Option
      pcall(function()
         -- extract animal name (shitcode)
         local animalName = picked:match("^%[DEAD%]%s(.+)%s%[%d+m%]$") or picked:gsub("%[DEAD%]%s", "")
         selectedDeadAnimalName = animalName
         
         -- find index by name
         for i, a in ipairs(deadAnimalTeleportList) do
            if a.name == animalName then 
               selectedDeadAnimalIndex = i 
               break 
            end
         end
      end)
   end
})

DeadAnimalTPTab:CreateButton({
   Name="Refresh Dead Animal List (if loading, refresh again)",
   Callback=function()
      pcall(function()
         local count = updateDeadAnimalTeleportList()
         local options = {}
         for _, a in ipairs(deadAnimalTeleportList) do
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local dist = "?"
            if hrp then dist = math.floor((hrp.Position - a.position).Magnitude) end
            options[#options+1] = "[DEAD] "..a.name .. " ["..dist.."m]"
         end
         if #options==0 then options = {"— no dead animals —"} end
         
         -- properly refresh dropdown and maintain selection if possible
         if DeadAnimalDropdown.Refresh then DeadAnimalDropdown:Refresh(options) end
         
         if #options > 0 and options[1] ~= "— no dead animals —" then 
            local foundIndex = 1
            if selectedDeadAnimalName ~= "" then
               for i, a in ipairs(deadAnimalTeleportList) do
                  if a.name == selectedDeadAnimalName then
                     foundIndex = i
                     break
                  end
               end
            end
            selectedDeadAnimalIndex = foundIndex
            if DeadAnimalDropdown.Set then DeadAnimalDropdown:Set({options[foundIndex]}) end
         else
            selectedDeadAnimalIndex = 0
            selectedDeadAnimalName = ""
         end
         
         Rayfield:Notify({Title="Dead Animal List Refreshed", Content="Found "..tostring(count).." dead animals", Duration=2, Image=4483362458})
      end)
   end
})

DeadAnimalTPTab:CreateButton({
   Name="Teleport to Selected Dead Animal",
   Callback=function()
      pcall(function() -- ctrl + c ; ctrl + v
         local targetAnimal = nil
         if selectedDeadAnimalName ~= "" then
            for _, a in ipairs(deadAnimalTeleportList) do
               if a.name == selectedDeadAnimalName then
                  targetAnimal = a
                  break
               end
            end
         elseif selectedDeadAnimalIndex > 0 and deadAnimalTeleportList[selectedDeadAnimalIndex] then
            targetAnimal = deadAnimalTeleportList[selectedDeadAnimalIndex]
         end
         
         if targetAnimal then
            Rayfield:Notify({Title="Teleporting...", Content="Teleporting to dead " .. targetAnimal.name, Duration=1, Image=4483362458})
            teleportToAnimal(targetAnimal)
         else
            Rayfield:Notify({Title="Dead Animal Not Found", Content="Selected dead animal no longer exists. Try refreshing the list.", Duration=3, Image=4483362458})
         end
      end)
   end
})

-- MAGIC BULLET TAB (Replaced Aimbot)
AimTab:CreateToggle({
   Name="Magic Bullet Enabled",
   CurrentValue=false,
   Flag="MagicBulletToggle",
   Callback=function(v)
      magicBulletEnabled = v
      if v then
          Rayfield:Notify({Title="Magic Bullet", Content="Enabled! Hitboxes are expanding.", Duration=2, Image=4483362458})
      else
          Rayfield:Notify({Title="Magic Bullet", Content="Disabled.", Duration=2, Image=4483362458})
      end
   end
})

AimTab:CreateSlider({
   Name="Hitbox Size", Range={1,50}, Increment=1, Suffix=" Studs",
   CurrentValue=15, Flag="MagicHitboxSize",
   Callback=function(Value)
      magicHitboxSize = Value
   end
})

AimTab:CreateSlider({
    Name="Hitbox Transparency", Range={0,1}, Increment=0.1, Suffix="",
    CurrentValue=0.7, Flag="MagicTransparency",
    Callback=function(Value)
       magicTransparency = Value
    end
 })

AimTab:CreateColorPicker({
    Name="Hitbox Color",
    Color=Color3.fromRGB(255, 0, 0),
    Flag="MagicColor",
    Callback=function(v)
       magicColor = v
    end
 })

AimTab:CreateParagraph({
   Title="Magic Bullet Info",
   Content="Expands animal hitboxes so you can shoot anywhere near them to hit. Disables collision so they don't get stuck."
})

-- esp tab
ESPTab:CreateToggle({
   Name="Live Animal ESP",
   CurrentValue=false,
   Flag="AnimalESP",
   Callback=function(v)
      animalESPEnabled = v
      if not v then
         for m,_ in pairs(ESPData) do destroyESPForModel(m,false) end
         Rayfield:Notify({Title="Live ESP Disabled", Content="Live animal ESP off", Duration=2, Image=4483362458})
      else
         Rayfield:Notify({Title="Live ESP Enabled", Content="Live animal ESP on", Duration=2, Image=4483362458})
      end
   end
})

ESPTab:CreateToggle({
   Name="Dead Animal ESP",
   CurrentValue=false,
   Flag="DeadAnimalESP",
   Callback=function(v)
      deadAnimalESPEnabled = v
      if not v then
         for m,_ in pairs(DeadESPData) do destroyESPForModel(m,true) end
         Rayfield:Notify({Title="Dead ESP Disabled", Content="Dead animal ESP off", Duration=2, Image=4483362458})
      else
         Rayfield:Notify({Title="Dead ESP Enabled", Content="Dead animal ESP on", Duration=2, Image=4483362458})
      end
   end
})

ESPTab:CreateColorPicker({
   Name="Live Animals ESP Color",
   Color=Color3.fromRGB(255,200,50),
   Flag="ESPColor",
   Callback=function(v)
      espColor=v
      for _,d in pairs(ESPData) do if d.label then d.label.TextColor3 = espColor end end
   end
})

ESPTab:CreateColorPicker({
   Name="Dead Animals ESP Color",
   Color=Color3.fromRGB(255,100,100),
   Flag="DeadESPColor",
   Callback=function(v)
      deadEspColor=v
      for _,d in pairs(DeadESPData) do if d.label then d.label.TextColor3 = deadEspColor end end
   end
})

ESPTab:CreateInput({
   Name="Animal Filter (comma separated)",
   PlaceholderText="Example: Deer,Bear,Wolf (leave empty for all)",
   RemoveTextAfterFocusLost=false,
   Callback=function(Text)
      pcall(function()
         selectedAnimals = {}
         if Text and Text:gsub("%s","") ~= "" then
            for a in string.gmatch(Text,"([^,]+)") do
               local clean = a:match("^%s*(.-)%s*$")
               if clean ~= "" then selectedAnimals[clean] = true end
            end
            Rayfield:Notify({Title="Animal Filter Updated", Content="Filter applied: "..Text, Duration=3, Image=4483362458})
         else
            Rayfield:Notify({Title="Filter Cleared", Content="Now showing all animals", Duration=2, Image=4483362458})
         end
         for m,_ in pairs(ESPData) do destroyESPForModel(m,false) end
      end)
   end
})

ESPTab:CreateParagraph({
   Title="ESP Information",
   Content="Live ESP shows living animals, Dead ESP shows dead animals in red. Use animal filter to show only specific animals. How i tested it works good."
})

-- tp tab
TeleportTab:CreateSection("Gun Shops")
TeleportTab:CreateButton({Name="Sage Armory", Callback=function() teleportToPosition(Vector3.new(-1312.83, -522.89, -1239.84)) end})
TeleportTab:CreateButton({Name="Smolov's Guns and Ammo", Callback=function() teleportToPosition(Vector3.new(1461.17, -554.26, 2241.36)) end})

TeleportTab:CreateSection("Spawn Areas")
TeleportTab:CreateButton({Name="Pinewood", Callback=function() teleportToPosition(Vector3.new(-1262.16, -553.75, 1738.19)) end})
TeleportTab:CreateButton({Name="Sage Camping", Callback=function() teleportToPosition(Vector3.new(-1299.60, -524.24, -1206.62)) end})
TeleportTab:CreateButton({Name="Theodores Lodge", Callback=function() teleportToPosition(Vector3.new(2412.29, -369.75, -1028.58)) end})
TeleportTab:CreateButton({Name="Valentino", Callback=function() teleportToPosition(Vector3.new(1563.82, -553.75, 2214.23)) end})

TeleportTab:CreateSection("Hunting Towers")
TeleportTab:CreateButton({Name="Hunting Tower #1", Callback=function() teleportToPosition(Vector3.new(2170.05, -527.23, 1874.78)) end})
TeleportTab:CreateButton({Name="Hunting Tower #2", Callback=function() teleportToPosition(Vector3.new(994.57, -475.48, -426.43)) end})
TeleportTab:CreateButton({Name="Hunting Tower #3", Callback=function() teleportToPosition(Vector3.new(-361.78, -551.48, 1524.88)) end})
TeleportTab:CreateButton({Name="Hunting Tower #4", Callback=function() teleportToPosition(Vector3.new(169.32, -480.48, 566.80)) end})

TeleportTab:CreateButton({
   Name="Discover All Locations",
   Callback=function()
      local locs = {
         {pos=Vector3.new(-1262.16, -553.75, 1738.19), name="Pinewood"},
         {pos=Vector3.new(-1299.60, -524.24, -1206.62), name="Sage Camping"},
         {pos=Vector3.new(2412.29, -369.75, -1028.58), name="Theodores Lodge"},
         {pos=Vector3.new(1563.82, -553.75, 2214.23), name="Valentino"}
      }
      for i, l in ipairs(locs) do task.spawn(function() task.wait(0.4*i) teleportToPosition(l.pos) end) end
      Rayfield:Notify({Title="Discovering All Locations", Content="Teleporting to all 4 locations...", Duration=3, Image=4483362458})
   end
})

-- settings
SettingsTab:CreateButton({
   Name="Destroy GUI",
   Callback=function()
      for m,_ in pairs(ESPData) do destroyESPForModel(m,false) end
      for m,_ in pairs(DeadESPData) do destroyESPForModel(m,true) end
      if speedUpdateConnection then speedUpdateConnection:Disconnect() end
      Rayfield:Destroy()
   end
})
SettingsTab:CreateSection("Configuration")
SettingsTab:CreateButton({
   Name="Save Configuration",
   Callback=function() Rayfield:Notify({Title="Configuration Saved", Content="Your settings have been saved successfully", Duration=2, Image=4483362458}) end
})

-- detected tab
DetectedTab:CreateParagraph({
    Title="WARNING - HIGH BAN RISK",
    Content="Changing WalkSpeed is DETECTED by the game's anti-cheat. Use at your own risk. You WILL be banned if you use this excessively."
 })
 
 DetectedTab:CreateButton({
    Name="Reset to Default Speed (6.5) - One Time",
    Callback = function()
       pcall(function()
          targetSpeed = 6.5
          useConstantSpeed = false
          if speedUpdateConnection then speedUpdateConnection:Disconnect() speedUpdateConnection=nil end
          applySpeed()
          if SpeedSlider then SpeedSlider:Set(6.5) end
          Rayfield:Notify({Title="Speed Reset", Content="Speed set to default (6.5) - one time only", Duration=2, Image=4483362458})
       end)
    end,
 })
 
 local SpeedSlider = DetectedTab:CreateSlider({
    Name="Walk Speed (Constant Update)", Range={1,100}, Increment=0.5, Suffix=" Speed",
    CurrentValue=16, Flag="SpeedSlider",
    Callback=function(Value)
       pcall(function()
          targetSpeed = Value
          useConstantSpeed = true
          startSpeedUpdater()
          applySpeed()
          Rayfield:Notify({Title="Speed Updated - Constant", Content="Speed set to "..tostring(Value).." (constantly updating)", Duration=2, Image=4483362458})
       end)
    end
 })
 
 DetectedTab:CreateInput({
    Name="Custom Speed (Constant Update)", PlaceholderText="Enter speed value...", RemoveTextAfterFocusLost=false,
    Callback=function(Text)
       pcall(function()
          local num = tonumber(Text)
          if num and num>0 and num<=1000 then
             targetSpeed = num
             useConstantSpeed = true
             startSpeedUpdater()
             SpeedSlider:Set(math.min(num,100))
             applySpeed()
             Rayfield:Notify({Title="Speed Updated - Constant", Content="Speed set to "..tostring(num).." (constantly updating)", Duration=2, Image=4483362458})
          else
             Rayfield:Notify({Title="Invalid Input", Content="Please enter a valid number (1-1000)", Duration=3, Image=4483362458})
          end
       end)
    end
 })

-- init
local animalsFolderInit = workspaceRef:FindFirstChild("Animals")
if animalsFolderInit then
    for _, m in ipairs(animalsFolderInit:GetChildren()) do if m:IsA("Model") then createESPForModel(m,false) end end
    for _, m in ipairs(animalsFolderInit:GetDescendants()) do if m:IsA("Model") then createESPForModel(m,false) end end
end
local deadInit = workspaceRef:FindFirstChild("DeadAnimals")
if deadInit then
    for _, m in ipairs(deadInit:GetChildren()) do if m:IsA("Model") then createESPForModel(m,true) end end
    for _, m in ipairs(deadInit:GetDescendants()) do if m:IsA("Model") then createESPForModel(m,true) end end
end

applySpeed()

Rayfield:Notify({
   Title = "Script Loaded (last upd 08.01.2026)",
   Content = "Hunting Season script loaded successfully! Have fun!",
   Duration = 3,
   Image = 4483362458,
})