-- ALL Credits to Boo Hub by zach
-- Edited by sikewhich

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Boo Hub",
    SubTitle = "edited by sikewhich ",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Toggles", Icon = "layers" }),
    Player = Window:AddTab({ Title = "Extras", Icon = "user" }),
    Teleports = Window:AddTab({ Title = "Teleports", Icon = "map" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

-- Toggles Tab
Tabs.Main:AddParagraph({
    Title = "Info",
    Content = "Made by zach.#6257"
})

Tabs.Main:AddToggle("infjump", {
    Title = "Infinite Jump",
    Default = false,
    Callback = function(value)
        getgenv().inf = value
        spawn(function()
            while inf == true do
                if (inf == false) then break end
                game:GetService("UserInputService").JumpRequest:connect(function()
                    if inf then
                        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
                    end
                end)
                wait()
            end
        end)
    end
})

Tabs.Main:AddToggle("autofarm", {
    Title = "Auto Farm",
    Default = false,
    Callback = function(value)
        local players = game:GetService("Players")
        local stages = workspace:WaitForChild("BoatStages"):WaitForChild("NormalStages")
        local penguin, gold = workspace:WaitForChild("ChangeCharacter"), workspace:WaitForChild("ClaimRiverResultsGold")
        local client = game.Players.LocalPlayer

        _G.Busy = value
        spawn(function()
            while _G.Busy do
                local bodyVelocity = Instance.new("BodyVelocity")
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
                bodyVelocity.Parent = client.Character.HumanoidRootPart

                for i = 1, 9 do
                    if not client.Character or not client.Character:FindFirstChild("Humanoid") then
                        repeat wait() until client.Character and client.Character:FindFirstChild("Humanoid")
                    end

                    client.Character.HumanoidRootPart.CFrame = stages["CaveStage"..i].DarknessPart.CFrame wait(0.1)

                    if not _G.Busy then
                        client.Character.Humanoid.Health = 0
                        break
                    end

                    if i == 1 then
                        wait(6)
                    else
                        wait(3)
                    end

                    gold:FireServer()
                end

                client.Character:Remove()

                repeat wait() 
                until client.Character and client.Character:FindFirstChild("HumanoidRootPart")
            end
        end)
    end
})

Tabs.Main:AddToggle("watergod", {
    Title = "Water GodMode",
    Default = false,
    Callback = function(value)
        getgenv().Water = value
        game:GetService('RunService').Stepped:connect(function()
            pcall(function()
                if getgenv().Water and game.Players.LocalPlayer.Character:FindFirstChild("WaterDetector")  then
                    game.Players.LocalPlayer.Character.WaterDetector:remove()
                end
            end)
        end)
    end
})

Tabs.Main:AddToggle("autochestcommon", {
    Title = "Auto Common Chest",
    Default = false,
    Callback = function(value)
        getgenv().Number = 1
        getgenv().Common = value
        game:GetService('RunService').Stepped:connect(function()
            if getgenv().Common then
                workspace.ItemBoughtFromShop:InvokeServer("Common Chest",getgenv().Number)
            end 
        end)
    end
})

Tabs.Main:AddToggle("autochestuncommon", {
    Title = "Auto Uncommon Chest",
    Default = false,
    Callback = function(value)
        getgenv().UnCommon = value
        getgenv().Number = 1
        game:GetService('RunService').Stepped:connect(function()
            if getgenv().UnCommon then
                workspace.ItemBoughtFromShop:InvokeServer("Uncommon Chest",getgenv().Number)
            end
        end)
    end
})

Tabs.Main:AddToggle("autochestrare", {
    Title = "Auto Rare Chest",
    Default = false,
    Callback = function(value)
        getgenv().Rare = value
        getgenv().Number = 1
        game:GetService('RunService').Stepped:connect(function()
            if getgenv().Rare then
                workspace.ItemBoughtFromShop:InvokeServer("Rare Chest",getgenv().Number)
            end
        end)
    end
})

Tabs.Main:AddToggle("autochestepic", {
    Title = "Auto Epic Chest",
    Default = false,
    Callback = function(value)
        getgenv().Epic = value
        getgenv().Number = 1
        game:GetService('RunService').Stepped:connect(function()
            if getgenv().Epic then
                workspace.ItemBoughtFromShop:InvokeServer("Epic Chest",getgenv().Number)
            end
        end)
    end
})

Tabs.Main:AddToggle("autochestlegendary", {
    Title = "Auto Legendary Chest",
    Default = false,
    Callback = function(value)
        getgenv().Legendary = value
        getgenv().Number = 1
        game:GetService('RunService').Stepped:connect(function()
            if getgenv().Legendary then
                workspace.ItemBoughtFromShop:InvokeServer("Legendary Chest",getgenv().Number)
            end 
        end)
    end
})

Tabs.Main:AddToggle("blocks", {
    Title = "Get a ton of some Blocks (patched)",
    Default = false,
    Callback = function(value)
        _G.RUN = value
        spawn(function()
            coroutine.wrap(function()
                while _G.RUN do wait()
                    coroutine.wrap(function()
                        while _G.RUN do wait()
                            workspace.ItemBoughtFromShop:InvokeServer("Winter Chest",math.floor(game:GetService("Players").LocalPlayer.Data.Gold.Value / 100))
                        end
                    end)()
                end
            end)()
        end)
    end
})

-- Extras Tab
Tabs.Player:AddButton({
    Title = "Fly",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/zachisfunny/Fly-Script/main/Script'))()
    end
})

Tabs.Player:AddButton({
    Title = "Vehicle Fly",
    Callback = function()
        local FlyKey = Enum.KeyCode.V
        local SpeedKey = Enum.KeyCode.LeftControl
        local SpeedKeyMultiplier = 3
        local FlightSpeed = 256
        local FlightAcceleration = 4
        local TurnSpeed = 16

        local UserInputService = game:GetService("UserInputService")
        local StarterGui = game:GetService("StarterGui")
        local RunService = game:GetService("RunService")
        local Players = game:GetService("Players")
        local User = Players.LocalPlayer
        local Camera = workspace.CurrentCamera
        local UserCharacter = nil
        local UserRootPart = nil
        local Connection = nil

        workspace.Changed:Connect(function()
            Camera = workspace.CurrentCamera
        end)

        local setCharacter = function(c)
            UserCharacter = c
            UserRootPart = c:WaitForChild("HumanoidRootPart")
        end

        User.CharacterAdded:Connect(setCharacter)
        if User.Character then
            setCharacter(User.Character)
        end

        local CurrentVelocity = Vector3.new(0,0,0)
        local Flight = function(delta)
            local BaseVelocity = Vector3.new(0,0,0)
            if not UserInputService:GetFocusedTextBox() then
                if UserInputService:IsKeyDown(Enum.KeyCode.W) then
                    BaseVelocity = BaseVelocity + (Camera.CFrame.LookVector * FlightSpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.A) then
                    BaseVelocity = BaseVelocity - (Camera.CFrame.RightVector * FlightSpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.S) then
                    BaseVelocity = BaseVelocity - (Camera.CFrame.LookVector * FlightSpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.D) then
                    BaseVelocity = BaseVelocity + (Camera.CFrame.RightVector * FlightSpeed)
                end
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then
                    BaseVelocity = BaseVelocity + (Camera.CFrame.UpVector * FlightSpeed)
                end
                if UserInputService:IsKeyDown(SpeedKey) then
                    BaseVelocity = BaseVelocity * SpeedKeyMultiplier
                end
            end
            if UserRootPart then
                local car = UserRootPart:GetRootPart()
                if car.Anchored then return end
                if not isnetworkowner(car) then return end
                CurrentVelocity = CurrentVelocity:Lerp(BaseVelocity, math.clamp(delta * FlightAcceleration, 0, 1))
                car.Velocity = CurrentVelocity + Vector3.new(0,2,0)
                if car ~= UserRootPart then
                    car.RotVelocity = Vector3.new(0,0,0)
                    car.CFrame = car.CFrame:Lerp(CFrame.lookAt(car.Position, car.Position + CurrentVelocity + Camera.CFrame.LookVector), math.clamp(delta * TurnSpeed, 0, 1))
                end
            end
        end

        UserInputService.InputBegan:Connect(function(userInput,gameProcessed)
            if gameProcessed then return end
            if userInput.KeyCode == FlyKey then
                if Connection then
                    StarterGui:SetCore("SendNotification",{Title = "zachs car fly", Text = "Flight disabled"})
                    Connection:Disconnect()
                    Connection = nil
                else
                    StarterGui:SetCore("SendNotification",{Title = "zachs car fly", Text = "Flight enabled"})
                    CurrentVelocity = UserRootPart.Velocity
                    Connection = RunService.Heartbeat:Connect(Flight)
                end
            end
        end)

        StarterGui:SetCore("SendNotification",{Title = "zachs car fly", Text = "Loaded successfully, Press V to toggle"})
    end
})

Tabs.Player:AddInput("hipheight", {
    Title = "HipHeight",
    Default = "",
    Numeric = true,
    Callback = function(value)
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.HipHeight = value end)
    end
})

Tabs.Player:AddInput("ws", {
    Title = "Walkspeed",
    Default = "",
    Numeric = true,
    Callback = function(value)
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value end)
    end
})

Tabs.Player:AddInput("jp", {
    Title = "JumpPower",
    Default = "",
    Numeric = true,
    Callback = function(value)
        pcall(function() game.Players.LocalPlayer.Character.Humanoid.JumpPower = value end)
    end
})

Tabs.Player:AddButton({
    Title = "Fox Morph",
    Callback = function()
        workspace.ChangeCharacter:FireServer("FoxCharacter") 
    end
})

Tabs.Player:AddButton({
    Title = "Penguin Morph",
    Callback = function()
        workspace.ChangeCharacter:FireServer("PenguinCharacter")
    end
})

Tabs.Player:AddButton({
    Title = "Chicken Morph",
    Callback = function()
        workspace.ChangeCharacter:FireServer("ChickenCharacter")
    end
})

Tabs.Player:AddButton({
    Title = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

Tabs.Player:AddButton({
    Title = "Anti-AFK",
    Callback = function()
        wait(3)
        local VirtualUser=game:service'VirtualUser'
        game:service'Players'.LocalPlayer.Idled:connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end
})

Tabs.Player:AddButton({
    Title = "Anti-LAG",
    Callback = function()
        for _,v in pairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("BasePart") and not v.Parent:FindFirstChild("Humanoid") then
                v.Material = Enum.Material.SmoothPlastic;
                if v:IsA("Texture") then v:Destroy() end
            end
        end
    end
})

-- Teleports Tab
Tabs.Teleports:AddButton({
    Title = "Teleport To Blue",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["Really blueZone"].CFrame * CFrame.new(0,5,0)
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport To Black",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").BlackZone.CFrame * CFrame.new(0,5,0)
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport To Magenta",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").MagentaZone.CFrame * CFrame.new(0,5,0)
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport To Red",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(221.12088, -9.89999676, -64.0851135, 0.0238732975, -3.54099043e-08, -0.999714971, 3.27503464e-08, 1, -3.46379174e-08, 0.999714971, -3.19140909e-08, 0.0238732975)
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport To Yellow",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace")["New YellerZone"].CFrame * CFrame.new(0,5,0)
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport To Green",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").CamoZone.CFrame * CFrame.new(0,5,0)
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport To White",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WhiteZone.CFrame * CFrame.new(0,5,0)
    end
})

Tabs.Teleports:AddButton({
    Title = "Teleport To Void",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(math.huge,math.huge,math.huge)
    end
})

Tabs.Teleports:AddButton({
    Title = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})

Tabs.Teleports:AddButton({
    Title = "Server Hop",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
    end
})

-- Settings Tab
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})

InterfaceManager:SetFolder("BooHub")
SaveManager:SetFolder("BooHub/config")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)

Window:SelectTab(1)

Fluent:Notify({
    Title = "Boo Hub",
    Content = "Script loaded successfully.",
    Duration = 8
})

SaveManager:LoadAutoloadConfig()
