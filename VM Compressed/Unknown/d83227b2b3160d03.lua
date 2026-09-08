local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Build A Boat Autofarmer | github.com/lunar0x4", "GrapeTheme")
local MainTab = Window:NewTab("Auto Farm")
local MainSection = MainTab:NewSection("Main")

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/Dynissimo/main/Scripts/AkaliNotif.lua"))()
local Notify = AkaliNotif.Notify

local TeamModels = {
    blue = "Really blueZone",
    red = "Really redZone",
    green = "CamoZone",
    black = "BlackZone",
    magenta = "MagentaZone",
    yellow = "New YellerZone",
    white = "WhiteZone"
}

local modelName
local isFarming = false
local farmThread = nil
local farmMode = "Tween"

local function CurrentTeam()
    local player = game:GetService("Players").LocalPlayer
    local teams = game:GetService("Teams")
    for _, team in pairs(teams:GetTeams()) do
        if team.Name == player.Team.Name then
            return team
        end
    end
end

local function MoveTo(targetCFrame, hrp, TweenService)
    if farmMode == "Tween" then
        local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
        local tween = TweenService:Create(hrp, tweenInfo, {CFrame = targetCFrame})
        tween:Play()
        tween.Completed:Wait()
        task.wait(0.5)
    else
        hrp.CFrame = targetCFrame
        task.wait(0.5)
    end
end

local function FarmCycle()
    local playerTeam = CurrentTeam()
    if playerTeam then
        modelName = TeamModels[playerTeam.Name]
    end
    
    Notify({Description="🛥️ Launching boat.", Title="Build A Boat Autofarmer", Duration=5})
    
    repeat task.wait() workspace[modelName].VoteLaunchRE:FireServer() until workspace[modelName].Launched.Value == true
    
    Notify({Description="✅ Launched boat, going to end.", Title="Build A Boat Autofarmer", Duration=5})
    
    local TweenService = game:GetService("TweenService")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
    
    local floor = Instance.new("Part")
    floor.Size = Vector3.new(10, 1, 10)
    floor.Anchored = true
    floor.CanCollide = true
    floor.Transparency = 0.5
    floor.Material = Enum.Material.Neon
    floor.Color = Color3.fromRGB(0, 255, 255)
    floor.Parent = workspace
    
    local floorConnection
    floorConnection = RunService.Heartbeat:Connect(function()
        if hrp and hrp.Parent then
            floor.CFrame = hrp.CFrame * CFrame.new(0, -3, 0)
        else
            floorConnection:Disconnect()
        end
    end)
    
    local boatStages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
    
    for i = 1, 10 do
        if not isFarming then return end
        local stageName = "CaveStage"..i
        local stage = boatStages:WaitForChild(stageName)
        local darknessPart = stage:WaitForChild("DarknessPart")
        MoveTo(darknessPart.CFrame, hrp, TweenService)
        Notify({Description="⏳ " .. i .. "/10...", Title="Build A Boat Autofarmer", Duration=2})
    end
    
    if not isFarming then return end
    
    Notify({Description="🧰 Completed checkpoints, going to chest.", Title="Build A Boat Autofarmer", Duration=5})
    MoveTo(CFrame.new(-113, 177, 8819), hrp, TweenService)
    MoveTo(CFrame.new(-55, -360, 9488), hrp, TweenService)
    Notify({Description="✅ Triggered chest!", Title="Build A Boat Autofarmer", Duration=5})
    floor:Destroy()
    task.wait(30)
    Notify({Description="💰 Restarting farm...", Title="Build A Boat Autofarmer", Duration=5})
    task.wait(3)
end

local function StartFarm()
    if farmThread then return end
    farmThread = task.spawn(function()
        while isFarming do
            FarmCycle()
            if not isFarming then break end
            task.wait(2)
        end
        farmThread = nil
    end)
end

local function StopFarm()
    isFarming = false
    if farmThread then
        task.cancel(farmThread)
        farmThread = nil
    end
    Notify({Description="⏹️ Farming stopped.", Title="Build A Boat Autofarmer", Duration=5})
end

MainSection:NewDropdown("Farm Mode", "Choose movement method", {"Tween (Recommended)", "Teleport (Faster)"}, function(selected)
    if selected == "Tween (Recommended)" then
        farmMode = "Tween"
    else
        farmMode = "Teleport"
    end
    Notify({Description="Farm mode set to " .. farmMode, Title="Build A Boat Autofarmer", Duration=3})
end)

local farmToggle = false
MainSection:NewToggle("Start Auto Farm", "Autofarms for gold.", function(state)
    farmToggle = state
    if state then
        isFarming = true
        StartFarm()
    else
        StopFarm()
    end
end)

MainSection:NewLabel("Tween Method: earn up to 5k gold an hour")
MainSection:NewLabel("Teleport Method: earn up to 10k gold an hour")
MainSection:NewLabel("Note: Teleport method will give you less gold.")
MainSection:NewLabel("The gold per hour is an estimate.")
MainSection:NewLabel("Also note that you can get more by joining the group.")

local StatusTab = Window:NewTab("Status")
local StatusSection = StatusTab:NewSection("Farm Status")
local statusLabel = StatusSection:NewLabel("Status: Idle")
local modeLabel = StatusSection:NewLabel("Mode: Tween")

task.spawn(function()
    while task.wait(0.5) do
        if farmToggle and isFarming then
            statusLabel:UpdateLabel("Status: Farming Active 🔁")
        elseif farmToggle and not isFarming then
            statusLabel:UpdateLabel("Status: Starting Farm... 🚀")
        else
            statusLabel:UpdateLabel("Status: Idle ⏸️")
        end
        modeLabel:UpdateLabel("Mode: " .. farmMode)
    end
end)
