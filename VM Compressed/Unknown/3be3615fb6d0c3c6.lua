local VLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/vep1032/VepStuff/main/VL"))()
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
local inviteModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
local s = VLib:Window("Warrior Hub", "Booga Classic", "W")
local playerService = game:GetService("Players")
local localPlayer = playerService.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local workspace = game:GetService("Workspace")
local mouse = localPlayer:GetMouse()
getgenv().notifColor = Color3.fromRGB(255, 0, 0)
local function notif(text, duration)
    local notifModule = require(game:GetService("ReplicatedStorage").Modules.Client_Function_Bank)
    notifModule.CreateNotification(text, getgenv().notifColor, duration)
end


--Main


local Main = s:Tab("Main")
Main:Label("Welcome to WarriorHub")
Main:Label("Toggle GUI with RCTRL")
Main:Button("Destroy GUI",function()
    game:GetService("CoreGui").Library:Destroy()
end)
Main:Button("Join Discord",function()
    inviteModule.Join("https://discord.gg/EdHhqP7TzZ")
end)
Main:Colorpicker("Notification Color",Color3.fromRGB(255, 0, 0),function(t)
    getgenv().notifColor = t
end)
Main:Button("Credits",function()
    Notification:Notify(
        {Title = "Credits", Description = "Vinyxu for Discord Prompt, Booga Bitches, Engo/Future and me lol"},
        {OutlineColor = getgenv().notifColor,Time = 5, Type = "default"}
    )
end)


--Combat


local Combat = s:Tab("Combat")
getgenv().killing = false
getgenv().killAuraRange = 20
--thx to engo future for isAlive and canBeTargeted functions :) i'm too lazy to make something like this lol
local function isAlive(plr)
    local plr = plr or game:GetService("Players").LocalPlayer
    if plr and plr.Character and ((plr.Character:FindFirstChild("Humanoid")) and (plr.Character:FindFirstChild("Humanoid") and plr.Character:FindFirstChild("Humanoid").Health > 0) and (plr.Character:FindFirstChild("HumanoidRootPart")) and (plr.Character:FindFirstChild("Head"))) then
        return true
    end
end
local function canBeTargeted(plr, doTeamCheck) 
    if isAlive(plr) and plr ~= game:GetService("Players").LocalPlayer and (doTeamCheck and plr.Team ~= game:GetService("Players").LocalPlayer.Team or not doTeamCheck) and plr.Name ~= "valensoysantijajaja" and plr.Name ~= "SusLordCV" then 
        return true
    end
    return false
end
local function teamCheck(player)

end
local function useAura()
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().killing then
                for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                    if isAlive() and canBeTargeted(v, false) and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude < getgenv().killAuraRange then
                        local rTV = game:GetService("ReplicatedStorage").RelativeTime.Value
                        local attackTable = {
                            [1] = game:GetService("Workspace").Characters[v.Name].HumanoidRootPart,
                        }
                        game:GetService("ReplicatedStorage").Events.SwingTool:FireServer(rTV, attackTable)
                    end
                end
            end
        end)
    end)
end
Combat:Toggle("Kill Aura",function(t)
    getgenv().killing = t
    useAura()
end)
Combat:Slider("Kill Aura Range",1,100,20,function(t)
    getgenv().killAuraRange = t
end)
getgenv().tpspamv = nil
getgenv().tpupval = 0
getgenv().tpspammode = "Normal"
getgenv().tping = false
Combat:Toggle("Teleport Spam",function(t)
    getgenv().tping = t
    local player = game:GetService("Players").LocalPlayer.Character
    if getgenv().tping then 
        game:GetService("Workspace").Gravity = 0
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 0
    end
    if not getgenv().tping then 
        game:GetService("Workspace").Gravity = 196.2
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().GJumpPower
    end
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().tping then
                for i,v in pairs(game:GetService("Players"):GetChildren()) do
                    if v.Name:lower():find(getgenv().tpspamv:lower()) then
                        if v.Name == "SusLordCv" or v.Name == "valensoysantijajaja" then
                            notif("You cant't kill this person", 3)
                            return
                        elseif getgenv().tpspammode == "Normal" then
                            player.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position.x, v.Character.HumanoidRootPart.Position.y, v.Character.HumanoidRootPart.Position.z)
                        elseif getgenv().tpspammode == "Up" then
                            player.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position.x, v.Character.HumanoidRootPart.Position.y + getgenv().tpupval, v.Character.HumanoidRootPart.Position.z)
                        elseif getgenv().tpspammode == "Down" then
                            player.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position.x, v.Character.HumanoidRootPart.Position.y - getgenv().tpupval, v.Character.HumanoidRootPart.Position.z)
                        elseif getgenv().tpspammode == "Around (Best)" then
                            player:MoveTo(Vector3.new(v.Character.HumanoidRootPart.Position.x + math.random(-(getgenv().tpupval), getgenv().tpupval), v.Character.HumanoidRootPart.Position.y, v.Character.HumanoidRootPart.Position.z + math.random(-(getgenv().tpupval), getgenv().tpupval)))
                        end
                    end
                end
            end
        end)
    end)
end)
Combat:Dropdown("TP Spam Mode",{"Around (Best)", "Up", "Down", "Normal"},function(t)
    getgenv().tpspammode = t
end)
Combat:Slider("TP Spam Distance", 0,10,0, function(t)
    getgenv().tpupval = t
end)
Combat:Textbox("TP Spam Name",true, function(t)
    getgenv().tpspamv = t
    notif("Name set to " .. t, 3)
end)
Combat:Textbox("Normal TP", true,function(t)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v.Name:lower():find(t:lower()) then
            local player = game:GetService("Players").LocalPlayer.Character
            player.HumanoidRootPart.CFrame = CFrame.new(v.Character.HumanoidRootPart.Position.x, v.Character.HumanoidRootPart.Position.y, v.Character.HumanoidRootPart.Position.z)
        end
    end
end)
getgenv().oneTimePanic = false
getgenv().oneTimePanicKey = nil
Combat:Toggle("Manual Panic",function(t)
    getgenv().oneTimePanic = t
    spawn(function()
        while wait() do
            mouse.KeyDown:connect(function(key)
                if getgenv().oneTimePanicKey ~= nil and key == getgenv().oneTimePanicKey:lower() then
                    if getgenv().oneTimePanic then
                        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1682.2772216796875, -3.6036133766174316, -4133.912109375)
                        wait(1)
                    end
                end
            end)
        end
    end)
end)
Combat:Textbox("Manual Panic Key", true,function(t)
    getgenv().oneTimePanicKey = t
end)
getgenv().autoPanic = false
getgenv().autoPanicMode = "Bloodfruit"
getgenv().autoPanicBlood = 100
getgenv().autoPanicHealth = 30
Combat:Toggle("Auto Panic",function(t)
    getgenv().autoPanic = t
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().autoPanic then
                if getgenv().autoPanicMode == "Bloodfruit" then
                    if not localPlayer.PlayerGui.MainGui.RightPanel.Inventory.List:FindFirstChild("Bloodfruit") or localPlayer.PlayerGui.MainGui.RightPanel.Inventory.List:FindFirstChild("Bloodfruit").QuantityImage.QuantityText.Text < getgenv().autoPanicBlood then
                        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1682.2772216796875, -3.6036133766174316, -4133.912109375)
                    end
                else if getgenv().autoPanicMode == "Health" then
                    if localPlayer.Character.Humanoid.Health < getgenv().autoPanicHealth then
                        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1682.2772216796875, -3.6036133766174316, -4133.912109375)
                    end
                else if getgenv().autoPanicMode == "Combat Tag" then
                    if localPlayer.Character.Head:FindFirstChild("LogNotice") then
                        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1682.2772216796875, -3.6036133766174316, -4133.912109375)
                    end
                end
                end
                end
            end
        end)
    end)
end)
Combat:Dropdown("Auto Panic Mode",{"Bloodfruit", "Combat Tag", "Health"},function(t)
    getgenv().autoPanicMode = t
end)
Combat:Slider("Auto Panic Bloodfruit",0,2000,100,function(t)
    getgenv().autoPanicBlood = t
end)
Combat:Slider("Auto Panic Health",1,100,30,function(t)
    getgenv().autoPanicHealth = t
end)
getgenv().HealItem = nil
getgenv().HealthCheck = false
getgenv().Health = nil
getgenv().HealHealth = 80
local function checkHealth()
    spawn(function()
        while getgenv().HealthCheck == true and wait() do
            getgenv().Health = game:GetService("Players").LocalPlayer.Character.Humanoid.Health
            --print(Health)
        end
    end)
end
local function heal()
    spawn(function()
        while wait(0.5) and getgenv().HealthCheck == true do
            if getgenv().Health < getgenv().HealHealth and getgenv().HealItem ~= nil then
                repeat
                    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer(getgenv().HealItem)
                    wait(0.05)
                until getgenv().Health > getgenv().HealHealth
            end
        end
    end)
end
Combat:Toggle("Auto Heal",function(t)
    getgenv().HealthCheck = t
    checkHealth()
    heal()
end)
Combat:Textbox("Auto Heal Item", true,function(t)
    getgenv().HealItem = t
    notif("Item set to " .. t, 3)
end)
Combat:Slider("Auto Heal Health",1,100,80,function(t)
    getgenv().HealHalth = t
end)
Combat:Label("Only works with equipped things")
getgenv().equipment = "Magnetite"
Combat:Dropdown("Equipment",{"Magnetite", "Crystal", "Adurite", "Iron", "Steel"},function(t)
    getgenv().equipment = t
end)
Combat:Button("Find Players with equipment",function()
    spawn(function()
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if isAlive() and canBeTargeted(v, false) then
                for i, v2 in pairs(v.Character:GetChildren()) do
                    if v2.Name:find(getgenv().equipment) and not v2.Name:find("Bag") then
                        notif(v.Name .. " Has a " .. v2.Name, 3)
                    end
                end
            end
        end
    end)
end)


--Movement


local Movement = s:Tab("Movement")
getgenv().speedState = false
getgenv().speed = 3
getgenv().speedkey = "x"
getgenv().loop2 = false
Movement:Toggle("Speed (Hold Key)",function(t)
    getgenv().speedState = t
    spawn(function()
        local plr = game:GetService("Players").LocalPlayer
        local char = plr.Character
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        local hum = char:FindFirstChild("HumanoidRootPart")
        mouse.KeyDown:connect(function(key)
            if key == getgenv().speedkey:lower() and getgenv().speedState then
                getgenv().loop2 = true
                while getgenv().loop2 do
                    hum.CFrame = hum.CFrame + hum.CFrame.lookVector * getgenv().speed
                    wait()
                end
            end
        end)
        mouse.KeyUp:connect(function(key)
            if key == getgenv().speedkey:lower() then
                getgenv().loop2 = false
            end
        end)
    end)
end)
Movement:Slider("Speed Multiplier",0,100,3,function(t)
    getgenv().speed = t
end)
Movement:Textbox("Speed Key", true,function(t)
    getgenv().speedkey = t
    notif("Key set to " .. t, 3)
end)
getgenv().GJumpPower = 50
Movement:Button("Infinity Jump",function()
    local Player = game:GetService'Players'.LocalPlayer;
    local UIS = game:GetService'UserInputService';
    local function Action(Object, Function) if Object ~= nil then Function(Object); end end
    UIS.InputBegan:connect(function(UserInput)
        if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
            Action(Player.Character.Humanoid, function(self)
                if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                    Action(self.Parent.HumanoidRootPart, function(self)
                        self.Velocity = Vector3.new(0, getgenv().GJumpPower, 0);
                    end)
                end
            end)
        end
    end)
end)
Movement:Slider("Jump Power", 0,300,50, function(t)
    game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = t
    getgenv().GJumpPower = t
end)
Movement:Button("Fly", function()
    loadstring(game:HttpGet("https://pastebin.com/raw/ihaiAkdc"))()
end)
Movement:Textbox("Fly Key", true,function(t)
    getgenv().flyKeybind = t
end)
Movement:Button("Fly 2 (Alt to Toggle, Ctrl to raise speed)", function()
    loadstring(game:HttpGet("https://www.toptal.com/developers/hastebin/raw/pisarutiji"))()
end)


--Misc


local Misc = s:Tab("Misc")
Misc:Button("Invisible Armor",function()
    spawn(function()
        for i, v in pairs(localPlayer.Character:GetChildren()) do
            if v.Name:find("Greaves") or v.Name:find("Chestplate") or v.Name:find("Mask") or v.Name:find("Helmet") or v.Name:find("Crown") or v.Name:find("Shoulder") or v.Name:find("Bag") then
                v.Handle:Destroy()
            end
        end
    end)
end)
getgenv().abKey = "v"
getgenv().breaking = false
getgenv().abState = false
Misc:Toggle("Auto Break (Aim and Hold Key)",function(t)
    getgenv().abState = t
    spawn(function()
        local mouse = game:GetService("Players").LocalPlayer:GetMouse()
        mouse.KeyDown:connect(function(key)
            if key == getgenv().abKey and getgenv().abState then
                getgenv().breaking = true
                while getgenv().breaking and wait(0.01) do
                    local part = game:GetService("Players").LocalPlayer:GetMouse().Target
                    local one = game:GetService("ReplicatedStorage").RelativeTime.Value
                    local two = {part,part,part,part}
                    game:GetService("ReplicatedStorage").Events.SwingTool:FireServer(one, two)
                end
            end
        end)
        mouse.KeyUp:connect(function(key)
            if key == getgenv().abKey then
                getgenv().breaking = false
            end
        end)
    end)
end)
Misc:Textbox("Auto Break Key", true,function(t)
    getgenv().abKey = t:lower()
    notif("Key set to " .. t, 3)
end)
getgenv().autoPickUpPicking = false
getgenv().autoPickUpMode = "Normal"
getgenv().aPUMWhitelist1 = nil
getgenv().aPUMWhitelist2 = nil
getgenv().aPUMWhitelist3 = nil
local function useAutoPickUp()
    spawn(function()
        game:GetService("RunService").RenderStepped:Connect(function()
            if getgenv().autoPickUpPicking then
                if getgenv().autoPickUpMode == "Normal" then
                    for _, v in pairs(game:GetService("Workspace").Items:GetChildren()) do
                        if v ~= nil and v.PrimaryPart ~= nil and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).magnitude < 15 then
                            game:GetService("ReplicatedStorage").Events.PickupItem:InvokeServer(v)
                        end
                    end
                else do
                    for _, v in pairs(game:GetService("Workspace").Items:GetChildren()) do
                        if v ~= nil and v.PrimaryPart ~= nil and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).magnitude < 15 then
                            if v.Name == getgenv().aPUMWhitelist1 or v.Name == getgenv().aPUMWhitelist2 or v.Name == getgenv().aPUMWhitelist3 then
                                game:GetService("ReplicatedStorage").Events.PickupItem:InvokeServer(v)
                            end
                        end
                    end
                end
                end
            end
        end)
    end)
end
Misc:Toggle("Auto Pick Up",function(t)
    getgenv().autoPickUpPicking = t
    useAutoPickUp()
end)
Misc:Dropdown("Auto Pick Up Mode",{"Normal", "Whitelist"},function(t)
    getgenv().autoPickUpMode = t
end)
Misc:Textbox("Auto Pick Up Whitelist 1", true,function(t)
    getgenv().aPUMWhitelist1 = t
    notif("Whitelisted Item " .. t, 3)
end)
Misc:Textbox("Auto Pick Up Whitelist 2", true,function(t)
    getgenv().aPUMWhitelist2 = t
    notif("Whitelisted Item " .. t, 3)
end)
Misc:Textbox("Auto Pick Up Whitelist 3", true,function(t)
    getgenv().aPUMWhitelist3 = t
    notif("Whitelisted Item " .. t, 3)
end)
getgenv().autoTPPUItem = nil
getgenv().autoTPPickUpMode = "Item Select"
getgenv().autoTPPickUp = false
Misc:Toggle("Auto TP Pick Up",function(t)
    getgenv().autoTPPickUp = t
    spawn(function()
        while getgenv().autoTPPickUp == true and wait(0.1) do
            if getgenv().autoTPPickUpMode == "Item Select" then
                for _, v in pairs(game:GetService("Workspace").Items:GetChildren()) do
                    if v ~= nil and v.Name == getgenv().autoTPPUItem then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
                        wait(1)
                        game:GetService("ReplicatedStorage").Events.PickupItem:InvokeServer(v)
                        if getgenv().autoTPPickUp == false then
                            break
                        end
                    end
                end
            elseif getgenv().autoTPPickUpMode == "Any" then
                for _, v in pairs(game:GetService("Workspace").Items:GetChildren()) do
                    if v ~= nil and v.Name ~= "fafgdf" then
                        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.PrimaryPart.CFrame
                        wait(1)
                        game:GetService("ReplicatedStorage").Events.PickupItem:InvokeServer(v)
                        if getgenv().autoTPPickUp == false then
                            break
                        end
                    end
                end
            end
        end
        if getgenv().autoTPPickUp then 
            game:GetService("Workspace").Gravity = 0
            game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 0
        end
        if not getgenv().autoTPPickUp then 
            game:GetService("Workspace").Gravity = 196.2
            game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().GJumpPower
        end
    end)
end)
Misc:Dropdown("Auto TP Pick Up Mode",{"Item Select", "Any"},function(t)
    getgenv().autoTPPickUpMode = t
end)
Misc:Textbox("Auto TP Pick Up Item", true, function(t)
    getgenv().autoTPPUItem = t
    notif("Item set to " .. t, 3)
end)
getgenv().adItem = nil
Misc:Textbox("Auto Drop Item", true, function(t)
    getgenv().adItem = t
    notif("Item set to " .. t, 3)
end)
getgenv().totalTimes2 = 1
Misc:Slider("Auto Drop Times",1,100,1,function(t)
    getgenv().totalTimes2 = t
end)
Misc:Button("Drop Items", function()
    local times = 0
    if getgenv().adItem ~= nil then
        repeat
            game:GetService("ReplicatedStorage").Events.DropBagItem:FireServer(getgenv().adItem)
            times = times + 1
        until times == getgenv().totalTimes2
    end
end)
getgenv().EatItem = nil
getgenv().HungerCheck = false
getgenv().Hunger = nil
getgenv().EatUnderSlider = 80
getgenv().EatUnder = getgenv().EatUnderSlider .. "%"
local function checkHunger()
    spawn(function()
        while getgenv().HungerCheck == true and wait() do
            getgenv().Hunger = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Panels.Toolbar.Stats.PlayerStats.Hunger.AmountLabel.Text
        end
    end)
end
local function eat()
    spawn(function()
        while wait(1) and getgenv().HungerCheck == true do
            if getgenv().Hunger <= getgenv().EatUnder and getgenv().EatItem ~= nil then
                repeat
                    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer(getgenv().EatItem)
                    wait(0.15)
                until getgenv().Hunger >= getgenv().EatUnder
            end
        end
    end)
end
Misc:Toggle("Auto Eat",function(t)
    getgenv().HungerCheck = t
    checkHunger()
    eat()
end)
Misc:Textbox("Auto Eat Item", true,function(t)
    getgenv().EatItem = t
    notif("Item set to " .. t, 3)
end)
Misc:Slider("Auto Eat Hunger",1,100,80,function(t)
    getgenv().EatUnderSlider = t
end)
getgenv().cCS = false
Misc:Toggle("Color Changing Skin", function(t)
    getgenv().cCS = t
    spawn(function()
        while getgenv().cCS and wait(0.3) do
            wait(0.15) do
            local ohString1 = "skin"
            local ohString2 = "Dark Brown"
            game:GetService("ReplicatedStorage").Events.CosmeticChange:FireServer(ohString1, ohString2)
        end
            wait(0.15) do
            local ohString3 = "skin"
            local ohString4 = "Tan"
            game:GetService("ReplicatedStorage").Events.CosmeticChange:FireServer(ohString3, ohString4)
        end
            wait(0.15) do
            local ohString5 = "skin"
            local ohString6 = "White"
            game:GetService("ReplicatedStorage").Events.CosmeticChange:FireServer(ohString5, ohString6)
        end
            wait(0.15) do
            local ohString7 = "skin"
            local ohString8 = "Pale"
            game:GetService("ReplicatedStorage").Events.CosmeticChange:FireServer(ohString7, ohString8)
        end
        end
    end)
end)
Misc:Textbox("Craft Item", true, function(t)
    local crString1 = t
    game:GetService("ReplicatedStorage").Events.CraftItem:FireServer(crString1)
    notif("Attemped to craft " .. t, 3)
end)
Misc:Button("Craft Lvl 1000 Golden Boat (you have to be on water)", function()
    local ohCFrame2 = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.x, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.y, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.z, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    local ohNumber3 = 0
    game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Golden Sailboat", ohCFrame2, ohNumber3)
    notif("Attemped to craft Golden Sailboat", 3)
end)
Misc:Button("Craft Mag Set", function()
    game:GetService("ReplicatedStorage").Events.CraftItem:FireServer("Magnetite Mask")
    game:GetService("ReplicatedStorage").Events.CraftItem:FireServer("Magnetite Chestplate")
    game:GetService("ReplicatedStorage").Events.CraftItem:FireServer("Magnetite Greaves")
    game:GetService("ReplicatedStorage").Events.CraftItem:FireServer("Magnetite Stick")
    game:GetService("ReplicatedStorage").Events.CraftItem:FireServer("Magnetite Pick")
    game:GetService("ReplicatedStorage").Events.CraftItem:FireServer("Magnetite Axe")
    notif("Attemped to craft a Mag Set", 3)
end)
Misc:Dropdown("Places",{"First Floating Island", "Second Floating Island", "Third Floating Island", "Magnetite Cave", "Adurite Cave", "Ancient Cave"},function(t)
    if t == "First Floating Island" then
        game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-129, 237, -748))
    end
    if t == "Second Floating Island" then
        game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-549, 311, -1211))
    end
    if t == "Third Floating Island" then
        game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-1132, 309, -1201))
    end
    if t == "Magnetite Cave" then
        game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-1173, 287, -1204))
    end
    if t == "Adurite Cave" then
        game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(1131, -153, 1190))
    end
    if t == "Ancient Cave" then
        game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(-1119, -179, -736))
    end
end)
Misc:Dropdown("Shelly Teleports",{"Random Small Shelly", "Random Big Shelly", "Random Giant Shelly"},function(t)
    if t == "Random Small Shelly" then
        shelly = "Stone Shelly"
    elseif t == "Random Big Shelly" then
        shelly = "Big Stone Shelly"
    elseif t == "Random Giant Shelly" then
        shelly = "Giant Shelly"
    end
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Critters[shelly].Head.CFrame
end)
Misc:Dropdown("Meteor Teleports",{"Crystal Meteor", "Magnetite Meteor"},function(t)
    if t == "Crystal Metor" then
        meteor = "Crystal Meteor Core"
    elseif t == "Magnetite Meteor" then
        meteor = "Meteor Core"
    end
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Resources[meteor].PrimaryPart.CFrame
end)
Misc:Dropdown("Ore and Other Teleports",{"Coal Node", "Iron Node", "Gold Node", "Stone Node", "Dead Tree", "Goober", "Beached Boi"},function(t)
    if t == "Beached Boi" then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Resources[t].Tail.CFrame
    else
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Resources[t].PrimaryPart.CFrame
    end
end)
Misc:Dropdown("Deployable Teleports",{"Chest", "Plant Box", "Coin Press", "Raft", "Squad Raft"},function(t)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Deployables[t].PrimaryPart.CFrame
end)
Misc:Dropdown("Lobbys",{"Unused Lobby", "Lobby"},function(t)
    if t == "Unused Lobby" then
        coordinatesx = -189
        coordinatesy = -3
        coordinatesz = 17004
    else
        coordinatesx = -1683
        coordinatesy = -3
        coordinatesz = -4144
    end
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character:MoveTo(Vector3.new(coordinatesx, coordinatesy, coordinatesz))
end)
Misc:Button("Server Hop", function()
    local Servers = game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/4787629450/servers/Public?sortOrder=Asc&limit=100"))
    for i,v in pairs(Servers.data) do
        if v.playing ~= v.maxPlayers then
            game:GetService('TeleportService'):TeleportToPlaceInstance(game.PlaceId, v.id)
        end
    end
end)


--Auto Farm


local AutoFarm = s:Tab("Auto Farm")
AutoFarm:Label("You should use auto pick up for collecting")
AutoFarm:Label("Equip a pick or an axe depending on what you select")
getgenv().FarmingObject = nil
getgenv().TimeBetweenEach = 1
getgenv().farmingMineTarget = nil
getgenv().farming = false
getgenv().autoFarmTping = false
getgenv().farmingMode = "Resources"
local function farm()
    spawn(function()
        while getgenv().farming do
            if getgenv().FarmingObject == nil then
                return
            end
            getgenv().farmingMineTarget = game:GetService("Workspace")[getgenv().farmingMode][getgenv().FarmingObject].PrimaryPart
            if getgenv().farmingMineTarget == nil then
                return
            end
            local af2Table2 = {
                [1] = getgenv().farmingMineTarget
            }
            local af2Number1 = game:GetService("ReplicatedStorage").RelativeTime.Value
            game:GetService("ReplicatedStorage").Events.SwingTool:FireServer(af2Number1, af2Table2)
            wait()
        end
    end)
end
local function farmtp()
    spawn(function()
        while getgenv().autoFarmTping do
            if getgenv().FarmingObject == nil then
                return
            end
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace")[getgenv().farmingMode][getgenv().FarmingObject].PrimaryPart.Position.x, game:GetService("Workspace")[getgenv().farmingMode][getgenv().FarmingObject].PrimaryPart.Position.y + 3, game:GetService("Workspace")[getgenv().farmingMode][getgenv().FarmingObject].PrimaryPart.Position.z)
            wait(getgenv().TimeBetweenEach)
        end
    end)
end
AutoFarm:Toggle("Auto Farm",function(t)
    getgenv().farming = t
    getgenv().autoFarmTping = t
    farm()
    farmtp()
    if getgenv().farming then 
        game:GetService("Workspace").Gravity = 0
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 0
    end
    if not getgenv().farming then 
        game:GetService("Workspace").Gravity = 196.2
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = getgenv().GJumpPower
    end
end)
AutoFarm:Dropdown("Mode",{"Resources", "Critters", "Deployables"},function(t)
    getgenv().farmingMode = t
end)
AutoFarm:Dropdown("Target",{"Iron Node", "Coal Node", "Magnetite Iceberg", "Totem of the Moon", "Dead Tree", "Gold Node", "Stone Node", "Ancient Tree", "Ancient Feather Tree", "Stone Shelly"},function(t)
    getgenv().FarmingObject = t
    Notification:Notify(
        {Title = "Auto Farm", Description = "Target set to ".. t},
        {OutlineColor = getgenv().notifColor,Time = 3, Type = "default"}
    )
end)
AutoFarm:Textbox("Custom Target", true,function(t)
    getgenv().FarmingObject = t
    notif("Target set to " .. t, 3)
end)
AutoFarm:Slider("TP Delay",0.1,15,1,function(t)
    getgenv().TimeBetweenEach = t
end)
AutoFarm:Label("For Auto Plant item don't write the plant name")
AutoFarm:Label("Write the name of the item you use to plant it")
getgenv().autoPlantPlant = nil
getgenv().planting = false
AutoFarm:Toggle("Auto Plant",function(t)
    getgenv().planting = t
    spawn(function()
        while getgenv().planting == true and wait() do
            for _, v in pairs(game:GetService("Workspace").Deployables:GetChildren()) do
                if v.Name == "Plant Box" and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).magnitude < 60 then
                    replicatedStorage.Events.InteractStructure:FireServer(v, getgenv().autoPlantPlant)
                end
            end
        end
    end)
end)
AutoFarm:Textbox("Auto Plant Item", true,function(t)
    getgenv().autoPlantPlant = t
    notif("Item set to " .. t, 3)
end)
getgenv().coins = false
getgenv().coinsMaterial = "Gold Bar"
AutoFarm:Toggle("Auto Make Coins",function(t)
    getgenv().coins = t
    spawn(function()
        while getgenv().coins and wait() do
            for _, v in pairs(game:GetService("Workspace").Deployables:GetChildren()) do
                if v.Name == "Coin Press" and (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.PrimaryPart.Position).magnitude < 60 then
                    game.ReplicatedStorage.Events.InteractStructure:FireServer(v, getgenv().coinsMaterial)
                end
            end
        end
    end)
end)
AutoFarm:Dropdown("Material",{"Gold Bar", "Silver Bar", "Log", "Stick"},function(t)
    getgenv().coinsMaterial = t
end)


--Render


local Render = s:Tab("Render")
Render:Button("Remove Rain", function()
    if workspace:FindFirstChild('RainPart') ~= nil then
        game:GetService("Workspace").RainPart:Destroy()
        game.ReplicatedStorage.Sounds.Nature.Rain:Stop()
        game.ReplicatedStorage.Sounds.Nature.Thunder:Stop()
        game.Lighting.Rain:Destroy()
        game.ReplicatedStorage.Skies.Shine:Clone().Parent = game.Lighting
    end
end)
Render:Slider("Fov", 0,120,70, function(t)
    game:GetService'Workspace'.Camera.FieldOfView = t
end)
Render:Button("UnnamedESP", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ic3w0lf22/Unnamed-ESP/master/UnnamedESP.lua", true))()
end)
getgenv().changingArmor = false
getgenv().armorColor = Color3.fromRGB(255, 0, 0)
Render:Toggle("Change Armor Color (Not FE)",function(t)
    getgenv().changingArmor = t
    spawn(function()
        while wait() and getgenv().changingArmor do
            for i, v in pairs(localPlayer.Character:GetChildren()) do
                if v.Name:find("Greaves") or v.Name:find("Chestplate") or v.Name:find("Mask") or v.Name:find("Helmet") or v.Name:find("Crown") or v.Name:find("Shoulder") then
                    for i, v2 in pairs(v:GetChildren()) do
                        if v2.ClassName == "Part" then
                            v2.Color = getgenv().armorColor
                        end
                    end
                end
            end
        end
    end)
end)
Render:Colorpicker("Armor Color",Color3.fromRGB(255, 0, 0),function(t)
    getgenv().armorColor = t
end)
getgenv().changingBag = false
getgenv().bagColor = Color3.fromRGB(255, 0, 0)
Render:Toggle("Change Bag Color (Not FE)",function(t)
    getgenv().changingBag = t
    spawn(function()
        while wait() and getgenv().changingBag do
            for i, v in pairs(localPlayer.Character:GetChildren()) do
                if v.Name:find("Bag") then
                    for i, v2 in pairs(v:GetChildren()) do
                        if v2.ClassName == "Part" then
                            v2.Color = getgenv().bagColor
                        end
                    end
                end
            end
        end
    end)
end)
Render:Colorpicker("Bag Color",Color3.fromRGB(255, 0, 0),function(t)
    getgenv().bagColor = t
end)
getgenv().changingTools = false
getgenv().toolsColor = Color3.fromRGB(255, 0, 0)
Render:Toggle("Change Tools Color (Not FE)",function(t)
    getgenv().changingTools = t
    spawn(function()
        while wait() and getgenv().changingTools do
            for i, v in pairs(localPlayer.Character:GetChildren()) do
                if v.Name:find("Stick") or v.Name:find("Pick") or v.Name:find("Axe") or v.Name:find("Hammer") or v.Name:find("Bow") or v.Name:find("Crossbow") or v.Name:find("Rock") then
                    for i, v2 in pairs(v:GetChildren()) do
                        if v2.Name == "Handle" or v2.Name == "Rod" or v2.Name == "Color" then
                            v2.Color = getgenv().toolsColor
                        end
                    end
                end
            end
        end
    end)
end)
Render:Colorpicker("Tools Color",Color3.fromRGB(255, 0, 0),function(t)
    getgenv().toolsColor = t
end)
getgenv().changingClothes = false
getgenv().clothesColor = Color3.fromRGB(255, 0, 0)
Render:Toggle("Change Clothes Color (Not FE)",function(t)
    getgenv().changingClothes = t
    spawn(function()
        while wait() and getgenv().changingClothes do
            for i, v in pairs(localPlayer.Character:GetChildren()) do
                if v.ClassName == "MeshPart" then
                    if v.Name:find("Torso") or v.Name:find("Leg") or v.Name:find("Foot") then
                        v.Color = getgenv().clothesColor
                    end
                end
            end
        end
    end)
end)
Render:Colorpicker("Clothes Color",Color3.fromRGB(255, 0, 0),function(t)
    getgenv().clothesColor = t
end)


--Building


local Building = s:Tab("Building")
Building:Button("Place Chest Campfire (1 Chest, 4 Campfires)", function()
    local Fires = 1
    local Event = game:GetService("ReplicatedStorage").Events.PlaceStructure
    h = game:GetService("Players").LocalPlayer.Character.LowerTorso.Position
    local c = h.x + 5
    local d = h.y - 2
    local e = h.z
    local j = h.x
    local k = h.y - 2
    local l = h.z
    local aa = h.x - 5
    local bb = h.y - 2
    local cc = h.z
    local aaa = h.x
    local bbb = h.y - 2
    local ccc = h.z + 5
    local aaaa = h.x
    local bbbb = h.y - 2
    local cccc = h.z - 5
    for i = 1,1 do
        local C_1 = "Chest"
        local C_2 = CFrame.new(j, k, l, 1, 0, 0, 0, 1, -5.56028681e-08, 0, -5.56028681e-08, 1)
        local C_3 = 0
        Event:FireServer(C_1, C_2, C_3)
    end
    for i = 1,Fires do
        local A_1 = "Campfire"
        local A_2 = CFrame.new(c, d, e, 1, 0, 0, 0, 1, -5.56028681e-08, 0, -5.56028681e-08, 1)
        local A_3 = 0
        Event:FireServer(A_1, A_2, A_3)
    end
    for i = 1,Fires do
        local B_1 = "Campfire"
        local B_2 = CFrame.new(aa, bb, cc, 1, 0, 0, 0, 1, -5.56028681e-08, 0, -5.56028681e-08, 1)
        local B_3 = 0
        Event:FireServer(B_1, B_2, B_3)
    end
    for i = 1,Fires do
        local D_1 = "Campfire"
        local D_2 = CFrame.new(aaa, bbb, ccc, 1, 0, 0, 0, 1, -5.56028681e-08, 0, -5.56028681e-08, 1)
        local D_3 = 0
        Event:FireServer(D_1, D_2, D_3)
    end
    for i = 1,Fires do
        local E_1 = "Campfire"
        local E_2 = CFrame.new(aaaa, bbbb, cccc, 1, 0, 0, 0, 1, -5.56028681e-08, 0, -5.56028681e-08, 1)
        local E_3 = 0
        Event:FireServer(E_1, E_2, E_3)
    end
end)
Building:Button("Egg Farm (4 Nests, 2 Campfires)", function()
    local ohCFrame2 = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.x, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.y - 3, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.z, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    local ohNumber3 = 0
    local ohCFrame3 = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.x + 2, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.y - 3, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.z, 1, 0, 0, 0, 1, 0, 0, 0, 1)
    game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Nest", ohCFrame2, ohNumber3)
    game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Nest", ohCFrame2, ohNumber3)
    game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Nest", ohCFrame2, ohNumber3)
    game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Nest", ohCFrame2, ohNumber3)
    game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Campfire", ohCFrame2, ohNumber3)
    game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer("Campfire", ohCFrame3, ohNumber3)
end)
getgenv().totalTimes = 1
getgenv().structure = nil
Building:Dropdown("Structure",{"Plant Box", "Chest", "Campfire", "Coin Press", "Nest", "Lookout", "Fish Trap", "Dock", "Bridge"},function(t)
    getgenv().structure = t
end)
Building:Slider("Times",1,100,1,function(t)
    getgenv().totalTimes = t
end)
Building:Button("Place", function()
    local times = 0
    if getgenv().structure ~= nil then
        repeat
            local Pos = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.x, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.y - 3, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position.z, 1, 0, 0, 0, 1, 0, 0, 0, 1)
            game:GetService("ReplicatedStorage").Events.PlaceStructure:FireServer(getgenv().structure, Pos, 0)
            times = times + 1
        until times == getgenv().totalTimes
    end
end)


--Donators


local Donators = s:Tab("Donators")
Donators:Label("Special Thanks to all people on this list")
Donators:Label("naruto10123n")
Donators:Label("GalazyZane")
Donators:Label("PepeeNob")
Donators:Label("orba102 / H5CK")
Donators:Label("LoriDev")
