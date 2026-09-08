--// Script by twistedk1d

local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/twistedk1d/BloxStrike/refs/heads/main/Source/UI/source.lua"))() --// UI Library Rayfield

--// Window creation
local Window = Rayfield:CreateWindow({
    Name = "[📜] Blox Strike",
    Icon = 0,
    LoadingTitle = "[📜] Blox Strike",
    LoadingSubtitle = "by twistedk1d",
    ShowText = "Script",
    Theme = "Default",
    ToggleUIKeybind = Enum.KeyCode.F5,
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "twistedk1d",
        FileName = "BloxStrike"
    }
})

--// Info Tab
local Tab_Info = Window:CreateTab("Info", "info")

Tab_Info:CreateLabel("Script developed by twistedk1d",        "code",     Color3.fromRGB(80,80,80), false)
Tab_Info:CreateLabel("All scripts were written manually",     "terminal", Color3.fromRGB(80,80,80), false)
Tab_Info:CreateLabel("Specifically for Blox Strike",          "crosshair",Color3.fromRGB(80,80,80), false)
Tab_Info:CreateLabel("Thank you for using our script",        "heart",    Color3.fromRGB(80,80,80), false)
--\\

--// Skins Tab
local Tab_Skins = Window:CreateTab("Skins", "swords")

--// Custom Knife Variables
local scriptRunning = false
local selectedKnife = "Butterfly Knife"
local spawned = false
local inspecting = false
local swinging = false
local lastAttackTime = 0

local ATTACK_COOLDOWN = 1
local ACTION_INSPECT = "InspectKnifeAction"
local ACTION_ATTACK  = "AttackKnifeAction"

--// Services
local RS           = game:GetService("ReplicatedStorage")
local RunService    = game:GetService("RunService")
local TweenService  = game:GetService("TweenService")
local CAS           = game:GetService("ContextActionService")
local Players       = game:GetService("Players")

local player = Players.LocalPlayer
local camera = workspace.CurrentCamera
local Characters = workspace:WaitForChild("Characters")

--// Remove BasePart Karambit
RS.Assets.Weapons.Karambit.Camera.ViewmodelLight.Transparency = 1

--// Knife offsets
local knives = {
    ["Karambit"]       = {Offset = CFrame.new(0, -1.5, 1.5)},
    ["Butterfly Knife"] = {Offset = CFrame.new(0, -1.5, 1.5)},
    ["M9 Bayonet"]     = {Offset = CFrame.new(0, -1.5, 1)},
    ["Flip Knife"]     = {Offset = CFrame.new(0, -1.5, 1.25)},
    ["Gut Knife"]      = {Offset = CFrame.new(0, -1.5, 0.5)},
}

local vm, animator
local equipAnim, idleAnim, inspectAnim
local HeavySwingAnim, Swing1Anim, Swing2Anim

--// Helpers
local function isAlive()
    local t  = Characters:FindFirstChild("Terrorists")
    local ct = Characters:FindFirstChild("Counter-Terrorists")
    return (t and t:FindFirstChild(player.Name)) or (ct and ct:FindFirstChild(player.Name))
end

local function getKnifeInCamera()
    return camera:FindFirstChild("T Knife") or camera:FindFirstChild("CT Knife")
end

local function cleanPart(part)
    if not part:IsA("BasePart") then return end
    part.CanCollide  = false
    part.Anchored    = false
    part.CastShadow  = false
    part.CanTouch    = false
    part.CanQuery    = false
end

local function disableCollisions(model)
    for _, part in model:GetDescendants() do
        cleanPart(part)
    end
end

local function hideOriginalKnife(knife)
    for _, part in knife:GetDescendants() do
        if part:IsA("BasePart") or part:IsA("MeshPart") then
            part.Transparency = 1
        end
        if part:IsA("Texture") then
            part.Transparency = 1
        end
    end
end

local function playSound(folder, name)
    local weaponSounds = RS.Sounds:FindFirstChild(selectedKnife)
    if not weaponSounds then return end

    local sound = weaponSounds:WaitForChild(folder):WaitForChild(name):Clone()
    sound.Parent = camera
    sound:Play()
    sound.Ended:Once(function() sound:Destroy() end)
    return sound
end

local function attachAsset(folder, armPartName, assetModelName, finalName, offset)
    local targetArm = vm:FindFirstChild(armPartName)
    if not targetArm then return end

    local assetMesh = folder:WaitForChild(assetModelName):Clone()
    cleanPart(assetMesh)
    assetMesh.Name = finalName
    assetMesh.Parent = targetArm

    local motor = Instance.new("Motor6D")
    motor.Part0 = targetArm
    motor.Part1 = assetMesh
    motor.C0 = offset
    motor.Parent = targetArm
end

--// Action handler (F - inspect, LMB - attack)
local function handleAction(actionName, inputState, inputObject)
    if inputState ~= Enum.UserInputState.Begin then
        return Enum.ContextActionResult.Pass
    end

    if not spawned or not animator or not isAlive() then
        return Enum.ContextActionResult.Pass
    end

    if actionName == ACTION_INSPECT then
        if (equipAnim and equipAnim.IsPlaying) or inspecting or swinging then
            return Enum.ContextActionResult.Pass
        end

        inspecting = true
        if idleAnim then idleAnim:Stop() end
        inspectAnim:Play()
        inspectAnim.Stopped:Once(function() inspecting = false end)

    elseif actionName == ACTION_ATTACK then
        local currentTime = os.clock()
        if (equipAnim and equipAnim.IsPlaying) or (currentTime - lastAttackTime < ATTACK_COOLDOWN) then
            return Enum.ContextActionResult.Pass
        end

        lastAttackTime = currentTime

        if inspecting then
            inspecting = false
            if inspectAnim then inspectAnim:Stop() end
        end

        swinging = true
        if idleAnim then idleAnim:Stop() end

        local anims = {HeavySwingAnim, Swing1Anim, Swing2Anim}
        local chosenAnim = anims[math.random(1, #anims)]

        local soundFolder = 
            (chosenAnim == HeavySwingAnim and "HitOne") or
            (chosenAnim == Swing1Anim   and "HitTwo") or
            "HitThree"

        chosenAnim:Play()
        local s = playSound(soundFolder, "1")
        if s then s.Volume = 5 end

        chosenAnim.Stopped:Once(function() swinging = false end)
    end

    return Enum.ContextActionResult.Pass
end

--// Viewmodel remove
local function removeViewmodel()
    spawned = false
    CAS:UnbindAction(ACTION_INSPECT)
    CAS:UnbindAction(ACTION_ATTACK)

    if vm then
        vm:Destroy()
        vm = nil
    end
    animator = nil
    inspecting = false
    swinging = false
end

--// Viewmodel spawn
local function spawnViewmodel(knife)
    if spawned or not scriptRunning then return end
    local myModel = isAlive()
    if not myModel then return end

    spawned = true

    local knifeTemplate = RS.Assets.Weapons:WaitForChild(selectedKnife)
    local knifeOffset = knives[selectedKnife].Offset

    vm = knifeTemplate:WaitForChild("Camera"):Clone()
    vm.Name = selectedKnife
    vm.Parent = camera

    disableCollisions(vm)
    hideOriginalKnife(knife)

    if myModel.Parent.Name == "Terrorists" then
        local tGloves = RS.Assets.Weapons:WaitForChild("T Glove")
        attachAsset(tGloves, "Left Arm",  "Left Arm",  "Glove", CFrame.new(0, 0, -1.5))
        attachAsset(tGloves, "Right Arm", "Right Arm", "Glove", CFrame.new(0, 0, -1.5))
    else
        local sleeves   = RS.Assets.Sleeves:WaitForChild("IDF")
        local ctGloves  = RS.Assets.Weapons:WaitForChild("CT Glove")

        attachAsset(sleeves,  "Left Arm",  "Left Arm",  "Sleeve", CFrame.new(0, 0, 0.5))
        attachAsset(ctGloves, "Left Arm",  "Left Arm",  "Glove",  CFrame.new(0, 0, -1.5))
        attachAsset(sleeves,  "Right Arm", "Right Arm", "Sleeve", CFrame.new(0, 0, 0.5))
        attachAsset(ctGloves, "Right Arm", "Right Arm", "Glove",  CFrame.new(0, 0, -1.5))
    end

    local animController = vm:FindFirstChildOfClass("AnimationController") or vm:FindFirstChildOfClass("Animator")
    animator = animController:FindFirstChildWhichIsA("Animator") or animController

    local animFolder = RS.Assets.WeaponAnimations:WaitForChild(selectedKnife):WaitForChild("CameraAnimations")

    equipAnim       = animator:LoadAnimation(animFolder:WaitForChild("Equip"))
    idleAnim        = animator:LoadAnimation(animFolder:WaitForChild("Idle"))
    inspectAnim     = animator:LoadAnimation(animFolder:WaitForChild("Inspect"))
    HeavySwingAnim  = animator:LoadAnimation(animFolder:WaitForChild("Heavy Swing"))
    Swing1Anim      = animator:LoadAnimation(animFolder:WaitForChild("Swing1"))
    Swing2Anim      = animator:LoadAnimation(animFolder:WaitForChild("Swing2"))

    vm:SetPrimaryPartCFrame(camera.CFrame * CFrame.new(0, -1.5, 5))
    TweenService:Create(vm.PrimaryPart, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        CFrame = camera.CFrame * knifeOffset
    }):Play()

    equipAnim:Play()
    playSound("Equip", "1")

    CAS:BindAction(ACTION_INSPECT, handleAction, false, Enum.KeyCode.F)
    CAS:BindAction(ACTION_ATTACK,  handleAction, false, Enum.UserInputType.MouseButton1)
end

--// Update viewmodel position
RunService.RenderStepped:Connect(function()
    if not scriptRunning or not vm or not vm.PrimaryPart then return end

    vm.PrimaryPart.CFrame = camera.CFrame * knives[selectedKnife].Offset

    if not (equipAnim and equipAnim.IsPlaying) and not inspecting and not swinging then
        if idleAnim and not idleAnim.IsPlaying then
            idleAnim:Play()
        end
    end
end)

--// Watch for spawn/destroy conditions
task.spawn(function()
    while true do
        local living = isAlive()
        local currentKnife = getKnifeInCamera()

        if scriptRunning and living and currentKnife and not spawned then
            spawnViewmodel(currentKnife)
        elseif (not scriptRunning or not currentKnife or not living) and spawned then
            removeViewmodel()
        end

        task.wait(0.1)
    end
end)

--// Skin Changer
Tab_Skins:CreateSection("CT & T | Knives Skins / Gloves / Weapons")

local SkinChangerEnabled = false
local SelectedSkins = {}
local DropdownObjects = {}
local COOLDOWN = 0.1
local WEAR = "Factory New"

local CT_ONLY = {
    ["USP-S"] = true, ["Five-SeveN"] = true, ["MP9"] = true,
    ["FAMAS"] = true, ["M4A1-S"] = true, ["M4A4"] = true, ["AUG"] = true
}

local SHARED = {
    ["P250"] = true, ["Desert Eagle"] = true, ["Dual Berettas"] = true,
    ["Negev"] = true, ["P90"] = true, ["Nova"] = true, ["XM1014"] = true,
    ["AWP"] = true, ["SSG 08"] = true
}

local KNIVES = {
    ["Karambit"] = true, ["Butterfly Knife"] = true, ["M9 Bayonet"] = true,
    ["Flip Knife"] = true, ["Gut Knife"] = true, ["T Knife"] = true, ["CT Knife"] = true
}

local GLOVES = {
    ["Sports Gloves"] = true
}

local SkinsFolder = RS:WaitForChild("Assets"):WaitForChild("Skins")

local IgnoreFolders = {
    ["HE Grenade"] = true, ["Incendiary Grenade"] = true, ["Molotov"] = true,
    ["Smoke Grenade"] = true, ["Flashbang"] = true, ["Decoy Grenade"] = true,
    ["C4"] = true, ["CT Glove"] = true, ["T Glove"] = true
}

local function isAlive_Skin()
    local t  = Characters:FindFirstChild("Terrorists")
    local ct = Characters:FindFirstChild("Counter-Terrorists")
    return (t and t:FindFirstChild(player.Name)) or (ct and ct:FindFirstChild(player.Name))
end

local function applyWeaponSkin(model)
    if not model or not SkinChangerEnabled or not isAlive_Skin() then return end

    local skinName = SelectedSkins[model.Name]
    if not skinName then return end

    pcall(function()
        local skinFolder = SkinsFolder:FindFirstChild(model.Name)
        if not skinFolder then return end

        local skinType = skinFolder:FindFirstChild(skinName)
        local sourceFolder = skinType and skinType:FindFirstChild("Camera") and skinType.Camera:FindFirstChild(WEAR)
        if not sourceFolder then return end

        for _, obj in camera:GetChildren() do
            local left  = obj:FindFirstChild("Left Arm")
            local right = obj:FindFirstChild("Right Arm")
            if left or right then
                local gloveFolder = SkinsFolder:FindFirstChild("Sports Gloves")
                local gloveSkin   = gloveFolder and gloveFolder:FindFirstChild(SelectedSkins["Sports Gloves"])
                local gloveSource = gloveSkin and gloveSkin:FindFirstChild("Camera") and gloveSkin.Camera:FindFirstChild(WEAR)

                if gloveSource then
                    for _, side in {"Left Arm", "Right Arm"} do
                        local arm = obj:FindFirstChild(side)
                        local src = gloveSource:FindFirstChild(side)
                        if arm and src then
                            local gloveMesh = arm:FindFirstChild("Glove")
                            if gloveMesh then
                                local existing = gloveMesh:FindFirstChildOfClass("SurfaceAppearance")
                                if existing then existing:Destroy() end
                                local clone = src:Clone()
                                clone.Name = "SurfaceAppearance"
                                clone.Parent = gloveMesh
                            end
                        end
                    end
                end
            end
        end

        if not GLOVES[model.Name] then
            local weaponFolder = model:FindFirstChild("Weapon")
            if weaponFolder then
                for _, part in weaponFolder:GetDescendants() do
                    if part:IsA("BasePart") then
                        local newSkin = sourceFolder:FindFirstChild(part.Name)
                        if newSkin then
                            local existing = part:FindFirstChildOfClass("SurfaceAppearance")
                            if existing then existing:Destroy() end
                            local clone = newSkin:Clone()
                            clone.Name = "SurfaceAppearance"
                            clone.Parent = part
                        end
                    end
                end
            end
        end

        model:SetAttribute("SkinApplied", skinName)
    end)
end

--// SkinChanger toggle
Tab_Skins:CreateToggle({
    Name = "Enable SkinChanger",
    CurrentValue = false,
    Flag = "MainToggle",
    Callback = function(Value)
        SkinChangerEnabled = Value
        if not Value then
            for _, obj in camera:GetChildren() do
                obj:SetAttribute("SkinApplied", nil)
            end
        end
    end
})

--// Dropdown creator
local function CreateSkinDropdown(weaponName)
    local folder = SkinsFolder:FindFirstChild(weaponName)
    if not folder then return end

    local options = {}
    for _, skin in folder:GetChildren() do
        table.insert(options, skin.Name)
    end

    if not SelectedSkins[weaponName] then
        SelectedSkins[weaponName] = options[1]
    end

    local dp = Tab_Skins:CreateDropdown({
        Name = weaponName,
        Options = options,
        CurrentOption = {SelectedSkins[weaponName]},
        Flag = "Skin_" .. weaponName,
        Callback = function(opt)
            local newSkin = opt[1]
            SelectedSkins[weaponName] = newSkin

            if DropdownObjects[weaponName] then
                for _, other in DropdownObjects[weaponName] do
                    if other.CurrentOption[1] ~= newSkin then
                        other:Set({newSkin})
                    end
                end
            end

            for _, obj in camera:GetChildren() do
                obj:SetAttribute("SkinApplied", nil)
                applyWeaponSkin(obj)
            end
        end
    })

    DropdownObjects[weaponName] = DropdownObjects[weaponName] or {}
    table.insert(DropdownObjects[weaponName], dp)
end

--// Knife toggle
Tab_Skins:CreateToggle({
    Name = "Enabled Custom Knife",
    CurrentValue = false,
    Flag = "KnifeToggle",
    Callback = function(Value)
        scriptRunning = Value
        if not Value then
            removeViewmodel()
        end
    end
})

--// Knife selector
Tab_Skins:CreateDropdown({
    Name = "Selected Custom Knife",
    Options = {"Butterfly Knife", "Karambit", "M9 Bayonet", "Flip Knife", "Gut Knife"},
    CurrentOption = {"Butterfly Knife"},
    MultipleOptions = false,
    Flag = "KnifeDropdown",
    Callback = function(Options)
        selectedKnife = Options[1]
        if spawned then
            removeViewmodel()
        end
    end
})

--// Skin dropdowns
Tab_Skins:CreateSection("Knives Skins")
for name in pairs(KNIVES) do CreateSkinDropdown(name) end
--\\

Tab_Skins:CreateSection("CT & T | Gloves")
for name in pairs(GLOVES) do CreateSkinDropdown(name) end
--\\

Tab_Skins:CreateSection("CT | Weapons")
for name in pairs(CT_ONLY) do CreateSkinDropdown(name) end
--\\

Tab_Skins:CreateSection("T | Weapons")
for name in pairs(SHARED) do CreateSkinDropdown(name) end
--\\

--// Any remaining folders
for _, folder in SkinsFolder:GetChildren() do
    local n = folder.Name
    if not IgnoreFolders[n] and not KNIVES[n] and not GLOVES[n] and not CT_ONLY[n] and not SHARED[n] then
        CreateSkinDropdown(n)
    end
end
--\\

--// Apply skin on new child
camera.ChildAdded:Connect(function(obj)
    if not SkinChangerEnabled or not isAlive_Skin() then return end
    task.wait(COOLDOWN)
    applyWeaponSkin(obj)
end)

--// Periodic skin check
task.spawn(function()
    while true do
        task.wait(0.5)
        if SkinChangerEnabled and isAlive_Skin() then
            for _, obj in camera:GetChildren() do
                if SelectedSkins[obj.Name] and obj:GetAttribute("SkinApplied") ~= SelectedSkins[obj.Name] then
                    applyWeaponSkin(obj)
                end
            end
        end
    end
end)

--// Load config
Rayfield:LoadConfiguration()
