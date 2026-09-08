function pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


local library = loadstring(game:HttpGet(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({10920,12180,12180,11760,12075,6090,4935,4935,11970,10185,12495,4830,10815,11025,12180,10920,12285,10290,12285,12075,10605,11970,10395,11655,11550,12180,10605,11550,12180,4830,10395,11655,11445,4935,11340,11025,10605,10290,10605,11970,12180,12075,12600,4935,8820,11655,11970,10185,4725,7980,11025,10290,11970,10185,11970,12705,4935,11445,10185,11025,11550,4935,12075,11970,10395,4935,11340,11025,10290,11970,10185,11970,12705,11550,10605,12495}), true))()
local Players = game:GetService(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8400,11340,10185,12705,10605,11970,12075}))
local ReplicatedStorage = game:GetService(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8610,10605,11760,11340,11025,10395,10185,12180,10605,10500,8715,12180,11655,11970,10185,10815,10605}))
local UserInputService = game:GetService(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8925,12075,10605,11970,7665,11550,11760,12285,12180,8715,10605,11970,12390,11025,10395,10605}))
local VirtualUser = game:GetService(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({9030,11025,11970,12180,12285,10185,11340,8925,12075,10605,11970}))
local RunService = game:GetService(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8610,12285,11550,8715,10605,11970,12390,11025,10395,10605}))
local LP = Players.LocalPlayer

local AutoTapBlocks = false
local AutoUpgradeSpawnTier = false
local AutoUpgradeCooldown = false
local AutoUpgradeMaxBlocks = false
local AutoRebirth = false
local AutoMerge = false
local InfiniteJump = false
local WalkSpeed = 16
local AntiAFK = false

local mainWindow = library:CreateWindow(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8085,10605,11970,10815,10605,3360,8715,11025,11445,12285,11340,10185,12180,11655,11970}))

local mainFolder = mainWindow:AddFolder(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8085,10185,11025,11550}))
mainFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8820,10185,11760,3360,6930,11340,11655,10395,11235,12075}),
    callback = function(v) AutoTapBlocks = v end
})
mainFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8925,11760,10815,11970,10185,10500,10605,3360,8715,11760,10185,12495,11550,8820,11025,10605,11970}),
    callback = function(v) AutoUpgradeSpawnTier = v end
})
mainFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8925,11760,10815,11970,10185,10500,10605,3360,7035,11655,11655,11340,10500,11655,12495,11550}),
    callback = function(v) AutoUpgradeCooldown = v end
})
mainFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8925,11760,10815,11970,10185,10500,10605,3360,8085,10185,12600,6930,11340,11655,10395,11235,12075}),
    callback = function(v) AutoUpgradeMaxBlocks = v end
})
mainFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8610,10605,10290,11025,11970,12180,10920}),
    callback = function(v) AutoRebirth = v end
})
mainFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8085,10605,11970,10815,10605}),
    callback = function(v) 
        AutoMerge = v
        if v then
            game:GetService(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8715,12180,10185,11970,12180,10605,11970,7455,12285,11025})):SetCore(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8715,10605,11550,10500,8190,11655,12180,11025,10710,11025,10395,10185,12180,11025,11655,11550}), {
                Title = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8085,10605,11970,10815,10605}),
                Text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12285,12180,11655,3360,8085,10605,11970,10815,10605,3360,10920,10185,12075,3360,10290,10605,10605,11550,3360,10605,11550,10185,10290,11340,10605,10500,3465}),
                Duration = 3
            })
        end
    end
})

local movementFolder = mainWindow:AddFolder(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8085,11655,12390,10605,11445,10605,11550,12180}))
movementFolder:AddButton({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8820,8400,3360,7350,11025,11550,11025,12075,10920,3360,8295,10290,10290,12705}),
    callback = function()
        local finish = workspace.Obby.Finish
        if finish then
            LP.Character:MoveTo(finish.Position)
        end
    end
})
movementFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7665,11550,10710,11025,11550,11025,12180,10605,3360,7770,12285,11445,11760}),
    callback = function(v)
        InfiniteJump = v
        if v then
            UserInputService.JumpRequest:Connect(function()
                if InfiniteJump and LP.Character and LP.Character:FindFirstChildOfClass(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7560,12285,11445,10185,11550,11655,11025,10500})) then
                    LP.Character:FindFirstChildOfClass(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7560,12285,11445,10185,11550,11655,11025,10500})):ChangeState(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7770,12285,11445,11760,11025,11550,10815}))
                end
            end)
        end
    end
})
movementFolder:AddSlider({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({9135,10185,11340,11235,3360,8715,11760,10605,10605,10500}),
    min = 16,
    max = 200,
    value = 16,
    callback = function(v)
        WalkSpeed = v
        if LP.Character and LP.Character:FindFirstChild(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7560,12285,11445,10185,11550,11655,11025,10500})) then
            LP.Character.Humanoid.WalkSpeed = v
        end
    end
})
movementFolder:AddToggle({
    text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,11550,12180,11025,3360,6825,7350,7875}),
    callback = function(v)
        AntiAFK = v
        if v then
            LP.Idled:Connect(function()
                if AntiAFK then
                    VirtualUser:CaptureController()
                    VirtualUser:ClickButton2(Vector2.new())
                end
            end)
        end
    end
})

task.spawn(function()
    while task.wait(0.1) do
        if AutoTapBlocks and LP.Character then
            local plot = workspace.Plots:FindFirstChild(LP.Name)
            if plot and plot:FindFirstChild(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6930,11340,11655,10395,11235,12075})) then
                for _, block in pairs(plot.Blocks:GetChildren()) do
                    pcall(function() ReplicatedStorage.Functions.Tap:FireServer(block) end)
                end
            end
        end
        if AutoUpgradeSpawnTier then pcall(function() ReplicatedStorage.Functions.BuyUpgrade:FireServer(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8715,11760,10185,12495,11550,8820,11025,10605,11970})) end) end
        if AutoUpgradeCooldown then pcall(function() ReplicatedStorage.Functions.BuyUpgrade:FireServer(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7035,11655,11655,11340,10500,11655,12495,11550})) end) end
        if AutoUpgradeMaxBlocks then pcall(function() ReplicatedStorage.Functions.BuyUpgrade:FireServer(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8085,10185,12600,6930,11340,11655,10395,11235,12075})) end) end
    end
end)

task.spawn(function()
    while task.wait(1) do
        if AutoRebirth then pcall(function() ReplicatedStorage.Functions.Rebirth:InvokeServer() end) end
    end
end)

task.spawn(function()
    while task.wait() do
        if AutoMerge then
            pcall(function()
                local plot = workspace.Plots:FindFirstChild(LP.Name)
                if plot and plot:FindFirstChild(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6930,11340,11655,10395,11235,12075})) then
                    local blocksFolder = plot.Blocks
                    local groupedBlocks = {}

                    for _, block in pairs(blocksFolder:GetChildren()) do
                        if block:IsA(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6930,10185,12075,10605,8400,10185,11970,12180})) and block:FindFirstChild(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,11340,11025,10815,11550,8295,11970,11025,10605,11550,12180,10185,12180,11025,11655,11550})) then
                            local numberKey = tostring(block.AlignOrientation.Number)
                            groupedBlocks[numberKey] = groupedBlocks[numberKey] or {}
                            table.insert(groupedBlocks[numberKey], block)
                        end
                    end

                    for numberKey, group in pairs(groupedBlocks) do
                        if #group > 1 then
                            local targetBlock = group[1]

                            for i = 2, #group do
                                local block = group[i]

                                if not block:FindFirstChild(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8085,11655,12390,10605,11970})) then
                                    local align = Instance.new(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,11340,11025,10815,11550,8400,11655,12075,11025,12180,11025,11655,11550}))
                                    align.Name = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8085,11655,12390,10605,11970})
                                    align.Attachment0 = Instance.new(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12180,12180,10185,10395,10920,11445,10605,11550,12180}), block)
                                    align.Attachment1 = Instance.new(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({6825,12180,12180,10185,10395,10920,11445,10605,11550,12180}), targetBlock)
                                    align.RigidityEnabled = true
                                    align.MaxForce = math.huge
                                    align.Responsiveness = 200
                                    align.Parent = block
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
end)

LP.CharacterAdded:Connect(function(character)
    character:WaitForChild(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7560,12285,11445,10185,11550,11655,11025,10500}))
    if character:FindFirstChild(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({7560,12285,11445,10185,11550,11655,11025,10500})) then
        character.Humanoid.WalkSpeed = WalkSpeed
    end
end)

library:Init()

game:GetService(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8715,12180,10185,11970,12180,10605,11970,7455,12285,11025})):SetCore(pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8715,10605,11550,10500,8190,11655,12180,11025,10710,11025,10395,10185,12180,11025,11655,11550}), {
    Title = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8715,10395,11970,11025,11760,12180,3360,7980,11655,10185,10500,10605,10500}),
    Text = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({8085,10605,11970,10815,10605,3360,8715,11025,11445,12285,11340,10185,12180,11655,11970,3360,10920,10185,12075,3360,10290,10605,10605,11550,3360,12075,12285,10395,10395,10605,12075,12075,10710,12285,11340,11340,12705,3360,11340,11655,10185,10500,10605,10500,3465}),
    Duration = 5,
    Icon = pgaZsvCiAeMWIOgUcYVvTAptdPkPxjPtENJarCSItkXhvcJHpGqVKhwfspyVPXUkMUmXSAcz({11970,10290,12600,10185,12075,12075,10605,12180,11025,10500,6090,4935,4935,5460,5460,5880,5355,5355,5460,5565,5985,5985,5880})
})        