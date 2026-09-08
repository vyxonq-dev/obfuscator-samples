local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local RunService = game:GetService("RunService")

local UserInputService = game:GetService("UserInputService")

local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local HRP, Character, Humanoid

local OriginalPosition = nil

local HasTeleported = false

local SelectedRealmDoor = nil

local SelectedFarmArea = nil

local AutoFarmArea = false

local CurrentCoinIndex = 1

local function refreshCharacter()

    Character = LP.Character or LP.CharacterAdded:Wait()

    HRP = Character:WaitForChild("HumanoidRootPart")

    Humanoid = Character:WaitForChild("Humanoid")

end

refreshCharacter()

LP.CharacterAdded:Connect(refreshCharacter)

local AutoTPAndSell = false

local AutoFarmCoins = false

local AutoRebirth = false

local AutoAbuseSell = false

local AutoEquipBestPet = false

local InfiniteJump = false

local Noclip = false

local WalkSpeed = 16

local JumpPower = 50

local SelectedChest = nil

local function getRealmDoors()

    local doors = {}

    local folder = Workspace:FindFirstChild("GameComponents") and Workspace.GameComponents:FindFirstChild("RealmDoors")

    if folder then

        for _, v in ipairs(folder:GetChildren()) do

            if v:IsA("UnionOperation") then

                table.insert(doors, v.Name)

            end

        end

    end

    return doors

end

local function getFarmAreas()

    local areas = {}

    local coinsFolder = Workspace:FindFirstChild("GameComponents") and Workspace.GameComponents:FindFirstChild("ClientCoins")

    if coinsFolder then

        for _, area in ipairs(coinsFolder:GetChildren()) do

            table.insert(areas, area.Name)

        end

    end

    return areas

end

local function getChests()

    local chests = {}

    local chestFolder = Workspace:FindFirstChild("GameComponents") and Workspace.GameComponents:FindFirstChild("Chests")

    if chestFolder then

        for _, chest in ipairs(chestFolder:GetChildren()) do

            table.insert(chests, chest.Name)

        end

    end

    return chests

end

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local UI = ReGui:TabsWindow({

    Title = "Vacuum Simulator",

    Size = UDim2.fromOffset(250, 200),

    Position = UDim2.fromOffset(30, 30),

})

local TabMain = UI:CreateTab({ Name = "Main" })

local TabChest = UI:CreateTab({ Name = "Chest" })

local TabTeleport = UI:CreateTab({ Name = "Teleport" })

local TabMovement = UI:CreateTab({ Name = "Movement" })

local mainHeader = TabMain:CollapsingHeader({ Title = "Main" })

mainHeader:Checkbox({

    Label = "Auto TP and Sell if bag full fast",

    Value = false,

    Callback = function(_, v)

        AutoTPAndSell = v

        HasTeleported = false

        OriginalPosition = nil

    end

})

mainHeader:Checkbox({

    Label = "Auto Vacuum",

    Value = false,

    Callback = function(_, v)

        AutoFarmCoins = v

    end

})

mainHeader:Checkbox({

    Label = "Auto Rebirth",

    Value = false,

    Callback = function(_, v)

        AutoRebirth = v

    end

})

local farmCombo = mainHeader:Combo({

    Label = "Select Farm Area",

    Items = #getFarmAreas() > 0 and getFarmAreas() or {"No Areas"},

    Selected = 1,

    Callback = function(_, v)

        SelectedFarmArea = v

        CurrentCoinIndex = 1

    end

})

mainHeader:Checkbox({

    Label = "Auto Farm Area Coins Fast",

    Value = false,

    Callback = function(_, v)

        AutoFarmArea = v

    end

})

-- New Checkbox for Auto Abuse Sell

mainHeader:Checkbox({

    Label = "Auto Abuse Sell",

    Value = false,

    Callback = function(_, v)

        AutoAbuseSell = v

    end

})

-- New Checkbox for Auto Equip Best Pet

mainHeader:Checkbox({

    Label = "Auto Equip Best Pet (Cow)",

    Value = false,

    Callback = function(_, v)

        AutoEquipBestPet = v

    end

})

local chestHeader = TabChest:CollapsingHeader({ Title = "Chest" })

local chestCombo = chestHeader:Combo({

    Label = "Select Chest",

    Items = #getChests() > 0 and getChests() or {"No Chests"},

    Selected = 1,

    Callback = function(_, v)

        SelectedChest = v

    end

})

chestHeader:Button({

    Label = "Buy Selected Chest",

    Callback = function()

        if SelectedChest and SelectedChest ~= "No Chests" then

            local chestFolder = Workspace:FindFirstChild("GameComponents") and Workspace.GameComponents:FindFirstChild("Chests")

            if chestFolder and chestFolder:FindFirstChild(SelectedChest) then

                local buyEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("BuyPet")

                if buyEvent then

                    pcall(function()

                        buyEvent:FireServer(chestFolder[SelectedChest])

                    end)

                    game.StarterGui:SetCore("SendNotification", {

                        Title = "Vacuum Simulator",

                        Text = "Bought " .. SelectedChest .. "!",

                        Duration = 3

                    })

                end

            end

        end

    end

})

local teleportHeader = TabTeleport:CollapsingHeader({ Title = "Teleport" })

local worldCombo = teleportHeader:Combo({

    Label = "Select World",

    Items = #getRealmDoors() > 0 and getRealmDoors() or {"No Worlds"},

    Selected = 1,

    Callback = function(_, v)

        SelectedRealmDoor = v

    end

})

teleportHeader:Button({

    Label = "TP to Selected",

    Callback = function()

        if SelectedRealmDoor and SelectedRealmDoor ~= "No Worlds" and Character and HRP then

            local folder = Workspace:FindFirstChild("GameComponents") and Workspace.GameComponents:FindFirstChild("RealmDoors")

            if folder and folder:FindFirstChild(SelectedRealmDoor) then

                local door = folder[SelectedRealmDoor]

                if door and door:IsA("UnionOperation") then

                    HRP.CFrame = door.CFrame + Vector3.new(0, 3, 0)

                    game.StarterGui:SetCore("SendNotification", {

                        Title = "Vacuum Simulator",

                        Text = "Teleported to " .. SelectedRealmDoor .. "!",

                        Duration = 3

                    })

                end

            end

        end

    end

})

local movementHeader = TabMovement:CollapsingHeader({ Title = "Movement" })

movementHeader:SliderFloat({

    Label = "WalkSpeed",

    Minimum = 16,

    Maximum = 200,

    Value = 16,

    Callback = function(_, v)

        WalkSpeed = v

        if Humanoid then

            Humanoid.WalkSpeed = v

        end

    end

})

movementHeader:SliderFloat({

    Label = "JumpPower",

    Minimum = 50,

    Maximum = 300,

    Value = 50,

    Callback = function(_, v)

        JumpPower = v

        if Humanoid then

            Humanoid.JumpPower = v

        end

    end

})

movementHeader:Checkbox({

    Label = "Inf Jump",

    Value = false,

    Callback = function(_, v)

        InfiniteJump = v

    end

})

movementHeader:Checkbox({

    Label = "Noclip",

    Value = false,

    Callback = function(_, v)

        Noclip = v

    end

})

RunService.Heartbeat:Connect(function()

    if AutoTPAndSell and Character and HRP then

        local displayLabel = LP.PlayerGui:FindFirstChild("UI") and LP.PlayerGui.UI:FindFirstChild("BagFrame") and LP.PlayerGui.UI.BagFrame:FindFirstChild("Display")

        local sellPart = Workspace:FindFirstChild("GameComponents") and Workspace.GameComponents:FindFirstChild("SellStuff") and Workspace.GameComponents.SellStuff:FindFirstChild("Part")

        if displayLabel and displayLabel:IsA("TextLabel") and sellPart and sellPart:IsA("BasePart") then

            if displayLabel.Text == "Bag full!" and not HasTeleported then

                OriginalPosition = HRP.CFrame

                HRP.CFrame = sellPart.CFrame + Vector3.new(0, 3, 0)

                HasTeleported = true

                local sellRemote = ReplicatedStorage:FindFirstChild("SellRemote")

                if sellRemote then

                    pcall(function()

                        sellRemote:FireServer()

                    end)

                end

                game.StarterGui:SetCore("SendNotification", {

                    Title = "Vacuum Simulator",

                    Text = "Teleported to sell point!",

                    Duration = 3

                })

            elseif displayLabel.Text ~= "Bag full!" and HasTeleported and OriginalPosition then

                HRP.CFrame = OriginalPosition

                HasTeleported = false

                OriginalPosition = nil

                game.StarterGui:SetCore("SendNotification", {

                    Title = "Vacuum Simulator",

                    Text = "Returned to original position!",

                    Duration = 3

                })

            end

        end

    end

    if AutoFarmCoins then

        local vacuumRemote = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("VacuumObjects")

        if vacuumRemote then

            pcall(function()

                vacuumRemote:FireServer({}, {})

            end)

        end

    end

    if AutoRebirth then

        local rebirthRemote = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("Rebirth")

        if rebirthRemote then

            pcall(function()

                rebirthRemote:FireServer()

            end)

        end

    end

    if AutoFarmArea and SelectedFarmArea and SelectedFarmArea ~= "No Areas" and Character and HRP then

        local coinsFolder = Workspace:FindFirstChild("GameComponents") and Workspace.GameComponents:FindFirstChild("ClientCoins")

        if coinsFolder then

            local area = coinsFolder:FindFirstChild(SelectedFarmArea)

            if area and #area:GetChildren() > 0 then

                local coins = area:GetChildren()

                if CurrentCoinIndex <= #coins then

                    local target = coins[CurrentCoinIndex]

                    if target then

                        local distance = (HRP.Position - target.Position).Magnitude

                        if distance > 5 then

                            local direction = (target.Position - HRP.Position).Unit

                            HRP.CFrame = CFrame.new(HRP.Position + direction * 5)

                            wait(0.1)

                        end

                        HRP.CFrame = target.CFrame + Vector3.new(0, 3, 0)

                        local vacuumEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("VacuumObjects")

                        if vacuumEvent then

                            pcall(function()

                                vacuumEvent:FireServer({target.Position}, {})

                            end)

                        end

                        CurrentCoinIndex = CurrentCoinIndex + 1

                    end

                else

                    CurrentCoinIndex = 1

                end

            end

        end

    end

    if AutoAbuseSell then

        local sellEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("Sell")

        if sellEvent then

            pcall(function()

                firesignal(sellEvent.OnClientEvent, 225)

            end)

        end

    end

    if AutoEquipBestPet then

        local equipEvent = ReplicatedStorage:FindFirstChild("Events") and ReplicatedStorage.Events:FindFirstChild("EquipPet")

        if equipEvent and LP.Pets and LP.Pets:FindFirstChild("Cow") then

            pcall(function()

                equipEvent:FireServer(LP.Pets.Cow)

            end)

        end

    end

    if InfiniteJump then

        if Humanoid and UserInputService:IsKeyDown(Enum.KeyCode.Space) then

            Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

        end

    end

    if Noclip and Character then

        for _, part in pairs(Character:GetDescendants()) do

            if part:IsA("BasePart") then

                part.CanCollide = false

            end

        end

    end

    if Humanoid then

        Humanoid.WalkSpeed = WalkSpeed

        Humanoid.JumpPower = JumpPower

    end

end)

UserInputService.JumpRequest:Connect(function()

    if InfiniteJump and Humanoid then

        Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

end)

game.StarterGui:SetCore("SendNotification", {

    Title = "Vacuum Simulator",

    Text = "Loaded! Made By Mj Contiga",

    Duration = 5

})