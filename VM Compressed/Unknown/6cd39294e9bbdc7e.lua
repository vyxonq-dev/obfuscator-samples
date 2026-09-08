local player = game.Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui")
if not playerGui then return end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local imageLabel = Instance.new("ImageLabel")
imageLabel.Parent = screenGui
imageLabel.Size = UDim2.new(0, 0, 0, 0)
imageLabel.Position = UDim2.new(0.5, 0, 0.5, -20)
imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
imageLabel.BackgroundTransparency = 1
imageLabel.Image = "rbxassetid://13879097036"
imageLabel.ScaleType = Enum.ScaleType.Fit
imageLabel.ImageTransparency = 0
imageLabel.BorderSizePixel = 0

local textLabel = Instance.new("TextLabel")
textLabel.Parent = screenGui
textLabel.Text = "KOLMBY SCRIPT"
textLabel.Size = UDim2.new(1, 0, 0, 50)
textLabel.Position = UDim2.new(0, 0, 0.55, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1,0,0)
textLabel.Font = Enum.Font.GothamBold
textLabel.TextScaled = true

local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://1592708450"
sound.Parent = player.Character or player:WaitForChild("Character")
sound:Play()

local duration = 4.2
local growTime = 2
local rotationSpeed = 0
local maxSpeed = 12
local acceleration = 0.2
local decelerationTime = 1.5

local function rotateImage()
    local startTime = tick()
    while imageLabel.Parent do
        local elapsedTime = tick() - startTime
        if elapsedTime < (duration - decelerationTime) then
            if rotationSpeed < maxSpeed then rotationSpeed = rotationSpeed + acceleration end
        else
            if rotationSpeed > 0 then rotationSpeed = rotationSpeed - acceleration end
        end
        imageLabel.Rotation = imageLabel.Rotation + rotationSpeed
        task.wait(0.0001)
    end
end

local function growImage()
    local startTime = tick()
    while tick() - startTime < growTime do
        local progress = (tick() - startTime) / growTime
        imageLabel.Size = UDim2.new(progress, 0, progress, 0)
        task.wait(0.01)
    end
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
end

task.spawn(rotateImage)
task.spawn(growImage)
task.wait(duration)
screenGui:Destroy()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Libary = loadstring(game:HttpGet("https://raw.githubusercontent.com/sukuna355/ismailhubttt/refs/heads/main/remake%20(1).lua"))()

workspace.FallenPartsDestroyHeight = -math.huge

local Window = Libary:MakeWindow({
    Title = "SANFOR & KOLMBY | BROOKHAVEN | V3",
    SubTitle = "by KOLMBY",
    LoadText = "Loading...",
    Flags = "SANFOR_KOLMBY_V3"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://91021917384599", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

task.delay(1, function()
    ReplicatedStorage.RE["1RPNam1eTex1t"]:FireServer("RolePlayName", "-SCRIPT BROOKHAVEN V3 By KOMBY-")
    ReplicatedStorage.RE["1RPNam1eColo1r"]:FireServer("PickingRPNameColor", Color3.new(0.75, 0, 0))
end)

local BrookTab  = Window:MakeTab({"BROOKHAVEN", "rbxassetid://91021917384599"})
local PlayerTab = Window:MakeTab({"PLAYER", "rbxassetid://91021917384599"})
local TrollTab  = Window:MakeTab({"التخريب", "rbxassetid://91021917384599"})
local SkinTab   = Window:MakeTab({"نسخ السكنات", "rbxassetid://91021917384599"})
local SamlaTab  = Window:MakeTab({"SAMLA", "rbxassetid://91021917384599"})

local SelectedPlayer
local function GetPlayers()
    local t = {}
    for _,v in ipairs(Players:GetPlayers()) do
        if v ~= LocalPlayer then table.insert(t, v.Name) end
    end
    return t
end

PlayerTab:AddDropdown({
    Name = "اختيار لاعب",
    Options = GetPlayers(),
    Callback = function(v) SelectedPlayer = v end
})

PlayerTab:AddButton({
    Name = "انتقال",
    Callback = function()
        local p = Players:FindFirstChild(SelectedPlayer)
        if p and p.Character then
            LocalPlayer.Character.HumanoidRootPart.CFrame = p.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3)
        end
    end
})

PlayerTab:AddButton({
    Name = "مراقبة",
    Callback = function()
        local p = Players:FindFirstChild(SelectedPlayer)
        if p and p.Character then workspace.CurrentCamera.CameraSubject = p.Character:FindFirstChild("Humanoid") end
    end
})

PlayerTab:AddButton({
    Name = "الغاء مراقبه",
    Callback = function()
        workspace.CurrentCamera.CameraSubject = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
})

local SkinTarget
SkinTab:AddDropdown({
    Name = "اختيار لاعب للنسخ",
    Options = GetPlayers(),
    Callback = function(value) SkinTarget = value end
})

SkinTab:AddButton({
    Name = "نسخ السكن",
    Callback = function()
        local Target = SkinTarget
        if not Target then return end
        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)
        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")
            if LHumanoid and THumanoid then
                local Remotes = ReplicatedStorage.Remotes
                local PDesc = THumanoid:GetAppliedDescription()
                
                local argsBody = {[1] = {[1] = PDesc.Torso, [2] = PDesc.RightArm, [3] = PDesc.LeftArm, [4] = PDesc.RightLeg, [5] = PDesc.LeftLeg, [6] = PDesc.Head}}
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                
                if tonumber(PDesc.Shirt) then Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt)) end
                if tonumber(PDesc.Pants) then Remotes.Wear:InvokeServer(tonumber(PDesc.Pants)) end
                if tonumber(PDesc.Face) then Remotes.Wear:InvokeServer(tonumber(PDesc.Face)) end
                
                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId then Remotes.Wear:InvokeServer(tonumber(v.AssetId)) end
                end
            end
        end
    end
})

local BrookScripts = {
    {"اسكربت اغاني","https://pastebin.com/raw/nSnhJnTN"},
    {"اسكربت طيران","https://pastebin.com/raw/CgV20XCU"},
    {"اسكربت متحرش","https://pastebin.com/raw/9NhnW39w"}
}

for _,v in ipairs(BrookScripts) do
    BrookTab:AddButton({
        Name = v[1],
        Callback = function() loadstring(game:HttpGet(v[2]))() end
    })
end

local SamlaScripts = {
    {"صمله 1","https://pastebin.com/raw/yJUkcF2a"},
    {"صمله 2","https://pastebin.com/raw/pXjaRxaF"},
    {"صمله 3","https://pastebin.com/raw/zYrTTru0"},
    {"صمله 4","https://raw.githubusercontent.com/D140-ai/DEXTER_SMLA/refs/heads/main/Protected_4861301696660530.lua.txt"},
    {"صمله 5","https://pastebin.com/raw/x4ZqfXHr"}
}

for _,v in ipairs(SamlaScripts) do
    SamlaTab:AddButton({
        Name = v[1],
        Callback = function() loadstring(game:HttpGet(v[2]))() end
    })
end

local sabotageTargetName
TrollTab:AddDropdown({
    Name = "اختيار لاعب",
    Options = GetPlayers(),
    Callback = function(v) sabotageTargetName = v end
})

TrollTab:AddButton({
    Name = "تخريب بالباص",
    Callback = function()
        if not sabotageTargetName then return end
        local target = Players:FindFirstChild(sabotageTargetName)
        if not target then return end
        local char = LocalPlayer.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        
        local originalPos = hrp.CFrame
        local function getBus()
            local v = workspace:FindFirstChild("Vehicles")
            return v and v:FindFirstChild(LocalPlayer.Name.."Car")
        end

        local bus = getBus()
        if not bus then
            hrp.CFrame = CFrame.new(1118.81,75.998,-1138.61)
            task.wait(0.4)
            ReplicatedStorage.RE["1Ca1r"]:FireServer("PickingCar","SchoolBus")
            task.wait(1)
            bus = getBus()
        end

        if bus and bus:FindFirstChild("Body") then
            local seat = bus.Body:FindFirstChild("VehicleSeat")
            if seat then
                repeat
                    hrp.CFrame = seat.CFrame * CFrame.new(0,2,0)
                    task.wait()
                until char.Humanoid.Sit
            end
        end

        task.spawn(function()
            while bus and target.Character do
                local thrp = target.Character:FindFirstChild("HumanoidRootPart")
                if thrp then
                    local t = tick()*35
                    bus:SetPrimaryPartCFrame(thrp.CFrame * CFrame.new(math.sin(t)*4,0,math.cos(t)*20))
                end
                RunService.RenderStepped:Wait()
            end
            ReplicatedStorage.RE["1Ca1r"]:FireServer("DeleteAllVehicles")
            hrp.CFrame = originalPos
        end)
    end
})