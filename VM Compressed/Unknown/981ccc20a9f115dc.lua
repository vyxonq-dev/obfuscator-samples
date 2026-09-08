function eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/8080)end return res end 


local Players = game:GetService(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({646400,872640,783760,977680,816080,921120,929200}))
local ReplicatedStorage = game:GetService(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({662560,816080,904960,872640,848400,799920,783760,937280,816080,808000,670640,937280,896880,921120,783760,832240,816080}))
local RunService = game:GetService(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({662560,945360,888800,670640,816080,921120,953440,848400,799920,816080}))
local UserInputService = game:GetService(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({686800,929200,816080,921120,589840,888800,904960,945360,937280,670640,816080,921120,953440,848400,799920,816080}))
local Workspace = game:GetService(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({702960,896880,921120,864560,929200,904960,783760,799920,816080}))

local LP = Players.LocalPlayer
local HRP, Character, Humanoid

local function refreshCharacter()
    Character = LP.Character or LP.CharacterAdded:Wait()
    HRP = Character:WaitForChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({581760,945360,880720,783760,888800,896880,848400,808000,662560,896880,896880,937280,646400,783760,921120,937280}))
    Humanoid = Character:WaitForChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({581760,945360,880720,783760,888800,896880,848400,808000}))
end

refreshCharacter()
LP.CharacterAdded:Connect(refreshCharacter)

local AutoTrain = false
local AutoWin = false
local AutoRebirth = false
local InfJump = false
local Noclip = false
local SelectedPower = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({525200,799920,848400,808000})
local SelectedWorld = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({702960,395920})
local PowerList = {}
local WorldList = {}

local function UpdatePowerList()
    PowerList = {}
    if Workspace:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({549440,848400,929200,904960,872640,783760,977680,646400,896880,961520,816080,921120,929200})) then
        for _, power in pairs(Workspace.DisplayPowers:GetChildren()) do
            table.insert(PowerList, power.Name)
        end
    end
    if #PowerList == 0 then
        PowerList = {eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({525200,799920,848400,808000})}
    end
    SelectedPower = PowerList[1]
end

local function UpdateWorldList()
    WorldList = {}
    if Workspace:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({702960,896880,921120,872640,808000})) then
        for _, world in pairs(Workspace.World:GetChildren()) do
            if world:IsA(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({646400,783760,921120,937280})) then
                table.insert(WorldList, world.Name)
            end
        end
    end
    if #WorldList == 0 then
        WorldList = {eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({702960,395920})}
    end
    SelectedWorld = WorldList[1]
end

UpdatePowerList()
UpdateWorldList()

local ReGui = loadstring(game:HttpGet(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({840320,937280,937280,904960,929200,468640,379760,379760,921120,783760,961520,371680,832240,848400,937280,840320,945360,791840,945360,929200,816080,921120,799920,896880,888800,937280,816080,888800,937280,371680,799920,896880,880720,379760,808000,816080,904960,937280,840320,929200,896880,379760,549440,816080,783760,921120,363600,662560,816080,573680,945360,848400,379760,880720,783760,848400,888800,379760,662560,816080,573680,945360,848400,371680,872640,945360,783760})))()

local UI = ReGui:TabsWindow({
    Title = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({606000,888800,896880,799920,864560,896880,945360,937280,258560,670640,848400,880720,945360,872640,783760,937280,896880,921120}),
    Size = UDim2.fromOffset(250, 200),
    Position = UDim2.fromOffset(30, 30),
})

local TabMain = UI:CreateTab({ Name = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({622160,783760,848400,888800}) })
local TabMovement = UI:CreateTab({ Name = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({622160,896880,953440,816080,880720,816080,888800,937280}) })

local mainHeader = TabMain:CollapsingHeader({ Title = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({622160,783760,848400,888800}) })
mainHeader:Checkbox({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({525200,945360,937280,896880,258560,678720,921120,783760,848400,888800}),
    Value = false,
    Callback = function(_, v)
        AutoTrain = v
    end
})

mainHeader:Checkbox({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({525200,945360,937280,896880,258560,702960,848400,888800}),
    Value = false,
    Callback = function(_, v)
        AutoWin = v
    end
})

mainHeader:Checkbox({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({525200,945360,937280,896880,258560,662560,816080,791840,848400,921120,937280,840320}),
    Value = false,
    Callback = function(_, v)
        AutoRebirth = v
    end
})

mainHeader:Combo({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({670640,816080,872640,816080,799920,937280,258560,646400,896880,961520,816080,921120}),
    Selected = SelectedPower,
    Items = PowerList,
    Callback = function(_, v)
        SelectedPower = v
    end
})

mainHeader:Button({
    Text = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({533280,945360,977680,258560,646400,896880,961520,816080,921120}),
    Callback = function()
        if ReplicatedStorage:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({557520,953440,816080,888800,937280})) then
            local buyEvent = ReplicatedStorage.Event:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({533280,945360,977680,646400,896880,961520,816080,921120}))
            if buyEvent then
                pcall(function()
                    buyEvent:FireServer(SelectedPower, 700)
                end)
            end
        end
    end
})

mainHeader:Combo({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({670640,816080,872640,816080,799920,937280,258560,702960,896880,921120,872640,808000}),
    Selected = SelectedWorld,
    Items = WorldList,
    Callback = function(_, v)
        SelectedWorld = v
    end
})

mainHeader:Button({
    Text = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({678720,816080,872640,816080,904960,896880,921120,937280,258560,702960,896880,921120,872640,808000}),
    Callback = function()
        if HRP and Workspace:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({702960,896880,921120,872640,808000})) then
            local world = Workspace.World:FindFirstChild(SelectedWorld)
            if world and world:IsA(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({646400,783760,921120,937280})) then
                HRP.CFrame = world.CFrame * CFrame.new(0, 3, 0)
            end
        end
    end
})

local moveHeader = TabMovement:CollapsingHeader({ Title = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({622160,896880,953440,816080,880720,816080,888800,937280}) })
moveHeader:SliderFloat({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({702960,783760,872640,864560,670640,904960,816080,816080,808000}),
    Minimum = 16,
    Maximum = 200,
    Value = 16,
    Callback = function(_, v)
        if Humanoid then
            Humanoid.WalkSpeed = v
        end
    end
})

moveHeader:SliderFloat({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({597920,945360,880720,904960,646400,896880,961520,816080,921120}),
    Minimum = 50,
    Maximum = 300,
    Value = 50,
    Callback = function(_, v)
        if Humanoid then
            Humanoid.JumpPower = v
        end
    end
})

moveHeader:Checkbox({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({589840,888800,824160,258560,597920,945360,880720,904960}),
    Value = false,
    Callback = function(_, v)
        InfJump = v
    end
})

moveHeader:Checkbox({
    Label = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({630240,896880,799920,872640,848400,904960}),
    Value = false,
    Callback = function(_, v)
        Noclip = v
    end
})

RunService.Heartbeat:Connect(function()
    if AutoTrain and ReplicatedStorage:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({557520,953440,816080,888800,937280})) then
        local trainEvent = ReplicatedStorage.Event:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({678720,921120,783760,848400,888800}))
        if trainEvent then
            pcall(function()
                trainEvent:FireServer(999999999)
            end)
        end
    end
    if AutoWin and ReplicatedStorage:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({557520,953440,816080,888800,937280})) then
        local winEvent = ReplicatedStorage.Event:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({702960,848400,888800,573680,783760,848400,888800}))
        if winEvent then
            pcall(function()
                winEvent:FireServer(999999999)
            end)
        end
    end
    if AutoRebirth and ReplicatedStorage:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({557520,953440,816080,888800,937280})) then
        local rebirthEvent = ReplicatedStorage.Event:FindFirstChild(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({581760,816080,783760,872640,937280,840320,525200,808000,808000}))
        if rebirthEvent then
            pcall(function()
                rebirthEvent:FireServer(999999999)
            end)
        end
    end
    if Noclip and Character then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({533280,783760,929200,816080,646400,783760,921120,937280})) then
                part.CanCollide = false
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if InfJump and Humanoid then
        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

game.StarterGui:SetCore(eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({670640,816080,888800,808000,630240,896880,937280,848400,824160,848400,799920,783760,937280,848400,896880,888800}), {
    Title = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({606000,888800,896880,799920,864560,896880,945360,937280,258560,670640,848400,880720,945360,872640,783760,937280,896880,921120}),
    Text = eZGAulqfrrSdIBVmEPLhZGdQrsfTjzPcqSnKPGCluvoItvXFFrHMlLWOgZjCaRsj({614080,896880,783760,808000,816080,808000,266640}),
    Duration = 5
})    