local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "jjp GUI | " .. Fluent.Version,
    SubTitle = "       by jjp0iky",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})


local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent", 
        Duration = 5
    })

    Tabs.Main:AddButton({
        Title = "Redeeme all codes",
        Description = "Redeeme all codes(type about new codes on scriptblox comments, ill add them)",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("UPDATE4")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("5KLIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("4KLIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("3KLIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("1KLIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("1KMEMBERS")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("750LIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("100LIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("250LIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("50LIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("10LIKES")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("Monkey")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("Release")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("UPDATE8")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("UPDATE7")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("UPDATE6")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("Release")
                            game.ReplicatedStorage.RemoteEvents.RedeemCode:FireServer("Release")
                            
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })

Tabs.Main:AddButton({
        Title = "Obby complete",
        Description = "Teleport to finish obby",
        Callback = function()
            Window:Dialog({
                Title = "Teleport?",
                Content = "",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
-- Получаем игрока
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Задаем целевой CFrame
local targetCFrame = CFrame.new(1490.74817, 1150.20374, -1379.94177, 0.499959469, 0, -0.866048813, 0, 1, 0, 0.866048813, 0, 0.499959469)

-- Функция для телепортации игрока
local function teleportPlayer()
    -- Убедимся, что у игрока есть модель персонажа
    if character and character:FindFirstChild("HumanoidRootPart") then
        -- Телепортируем игрока
        character.HumanoidRootPart.CFrame = targetCFrame
    else
        print("Персонаж не найден или у него нет HumanoidRootPart")
    end
end

-- Вызываем функцию телепортации
teleportPlayer()

                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })


    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Items Auto Farm(can stop not instantly)", Default = false })

    local function executeScript()
    
        local player = game.Players.LocalPlayer

        local character = player.Character or player.CharacterAdded:Wait()


        local spawns = workspace.DropSpawns:GetChildren()


        local function moveToSpawn(spawnPart)
            if character and spawnPart then

                character:MoveTo(spawnPart.Position)
            end
        end


        local virtualUser = game:GetService("VirtualUser")


        local function pressE()
            virtualUser:CaptureController()
            virtualUser:SetKeyDown("e")
            wait(0.1)
            virtualUser:SetKeyUp("e")
        end


        while Options.MyToggle.Value do
            local itemsFound = false

            for i, spawn in ipairs(spawns) do

                if #spawn:GetChildren() > 2 then
                    itemsFound = true

                    moveToSpawn(spawn)
                    
                    wait(1)
                    

                    pressE()
                end
            end


            if not itemsFound then
                wait(5)
            end
        end
    end

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
        if Options.MyToggle.Value then
            executeScript()
        end
    end)

    Options.MyToggle:SetValue(false)
end

local Toggle2 = Tabs.Main:AddToggle("MyToggle2", {Title = "Item ESP", Default = false })

local targetNames = {"Zeni", "Damage3", "Damage2", "Damage1", "Speed1", "Speed2", "Speed3", "Lucky1", "Lucky2", "Lucky3"}
local highlightCoroutine

local function createHighlightAndNametag(object)

    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.new(1, 1, 0) 
    highlight.OutlineColor = Color3.new(1, 1, 0) 
    highlight.Parent = object


    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = object
    billboardGui.Size = UDim2.new(0, 100, 0, 50)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = object.Name
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1
    textLabel.Parent = billboardGui

    billboardGui.Parent = object
end

local function updateHighlightsAndNametags()

    for _, object in pairs(workspace:GetDescendants()) do
        if object:FindFirstChildOfClass("Highlight") then
            object:FindFirstChildOfClass("Highlight"):Destroy()
        end
        if object:FindFirstChildOfClass("BillboardGui") then
            object:FindFirstChildOfClass("BillboardGui"):Destroy()
        end
    end


    for _, object in pairs(workspace:GetDescendants()) do
        if table.find(targetNames, object.Name) then
            createHighlightAndNametag(object)
        end
    end
end

local function startHighlighting()
    highlightCoroutine = coroutine.create(function()
        while Options.MyToggle2.Value do
            updateHighlightsAndNametags()
            wait(2 + math.random())
        end
    end)
    coroutine.resume(highlightCoroutine)
end

local function stopHighlighting()
    if highlightCoroutine then
        coroutine.close(highlightCoroutine)
        highlightCoroutine = nil
    end

    for _, object in pairs(workspace:GetDescendants()) do
        if object:FindFirstChildOfClass("Highlight") then
            object:FindFirstChildOfClass("Highlight"):Destroy()
        end
        if object:FindFirstChildOfClass("BillboardGui") then
            object:FindFirstChildOfClass("BillboardGui"):Destroy()
        end
    end
end

Toggle2:OnChanged(function()
    print("Toggle2 changed:", Options.MyToggle2.Value)
    if Options.MyToggle2.Value then
        startHighlighting()
    else
        stopHighlighting()
    end
end)

Options.MyToggle2:SetValue(false)


SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)


SaveManager:IgnoreThemeSettings()


SaveManager:SetIgnoreIndexes({})


InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})


SaveManager:LoadAutoloadConfig()
