local repo = 'https://raw.githubusercontent.com/KINGHUB01/Gui/main/'

local Library = loadstring(game:HttpGet(repo ..'Gui%20Lib%20%5BLibrary%5D'))()
local ThemeManager = loadstring(game:HttpGet(repo ..'Gui%20Lib%20%5BThemeManager%5D'))()
local SaveManager = loadstring(game:HttpGet(repo ..'Gui%20Lib%20%5BSaveManager%5D'))()

local Window = Library:CreateWindow({
    Title = 'Conse Hub V5.2.1 (ALPHA)',
    Center = true,
    AutoShow = true,
    TabPadding = 8,
    MenuFadeTime = 0.2
})

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(('Conse Hub V5.2.1 | %s fps | %s ms'):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

local Tabs = {
    Main = Window:AddTab('Main'),
    Teleports = Window:AddTab('Teleports'),
    LocalPlayer = Window:AddTab('LocalPlayer'),
    Settings = Window:AddTab('Settings')
}

local teleportSpots = {}

local racistPeople = { --[[ all racist people abandoned :pensive: ]] }

local itemSpots = {
    Bait_Crate = CFrame.new(384.57513427734375, 135.3519287109375, 337.5340270996094),
    Carbon_Rod = CFrame.new(454.083618, 150.590073, 225.328827, 0.985374212, -0.170404434, 1.41561031e-07, 1.41561031e-07, 1.7285347e-06, 1, -0.170404434, -0.985374212, 1.7285347e-06),
    Crab_Cage = CFrame.new(474.803589, 149.664566, 229.49469, -0.721874595, 0, 0.692023814, 0, 1, 0, -0.692023814, 0, -0.721874595),
    Fast_Rod = CFrame.new(447.183563, 148.225739, 220.187454, 0.981104493, 1.26492232e-05, 0.193478703, -0.0522461236, 0.962867677, 0.264870107, -0.186291039, -0.269973755, 0.944674432),
    Flimsy_Rod = CFrame.new(471.107697, 148.36171, 229.642441, 0.841614008, 0.0774728209, -0.534493923, 0.00678436086, 0.988063335, 0.153898612, 0.540036798, -0.13314943, 0.831042409),
    GPS = CFrame.new(517.896729, 149.217636, 284.856842, 7.39097595e-06, -0.719539165, -0.694451928, -1, -7.39097595e-06, -3.01003456e-06, -3.01003456e-06, 0.694451928, -0.719539165),
    Long_Rod = CFrame.new(485.695038, 171.656326, 145.746109, -0.630167365, -0.776459217, -5.33461571e-06, 5.33461571e-06, -1.12056732e-05, 1, -0.776459217, 0.630167365, 1.12056732e-05),
    Lucky_Rod = CFrame.new(446.085999, 148.253006, 222.160004, 0.974526405, -0.22305499, 0.0233404674, 0.196993902, 0.901088715, 0.386306256, -0.107199371, -0.371867687, 0.922075212),
    Plastic_Rod = CFrame.new(454.425385, 148.169739, 229.172424, 0.951755166, 0.0709736273, -0.298537821, -3.42726707e-07, 0.972884834, 0.231290117, 0.306858391, -0.220131472, 0.925948203),
    Training_Rod = CFrame.new(457.693848, 148.357529, 230.414307, 1, -0, 0, 0, 0.975410998, 0.220393807, -0, -0.220393807, 0.975410998)
}

local fisktable = {}

-- Services

local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

-- Locals

local LocalPlayer = Players.LocalPlayer
local LocalCharacter = LocalPlayer.Character
local HumanoidRootPart = LocalCharacter:FindFirstChild("HumanoidRootPart")
local ActiveFolder = Workspace:FindFirstChild("active")
local FishingZonesFolder = Workspace:FindFirstChild("zones"):WaitForChild("fishing")
local TpSpotsFolder = Workspace:FindFirstChild("world"):WaitForChild("spawns"):WaitForChild("TpSpots")
local NpcFolder = Workspace:FindFirstChild("world"):WaitForChild("npcs")
local PlayerGUI = LocalPlayer:FindFirstChildOfClass("PlayerGui")
local RenderStepped = RunService.RenderStepped
local WaitForSomeone = RenderStepped.Wait
local Debug = function()
    print(debug.info(2, "l"))
end


local autoShake = false
local autoShakeDelay = 0
local autoShakeMethod = "KeyCodeEvent"
local autoShakeClickOffsetX = 0
local autoShakeClickOffsetY = 0
local autoReel = false
local autoReelDelay = 2
local autoCast = false
local autoCastMode = "Legit"
local autoCastDelay = 2
local ZoneCast = false
local Zone = "Brine Pool"
local Noclip = false
local AntiDrown = false
local CollarPlayer = false
local Target
local FreezeChar = false



autoreelandshakeConnection = PlayerGUI.ChildAdded:Connect(function(GUI)
    if GUI:IsA("ScreenGui") and GUI.Name == "shakeui" then
        if GUI:FindFirstChild("safezone") ~= nil then
            GUI.safezone.ChildAdded:Connect(function(child)
                if child:IsA("ImageButton") and child.Name == "button" then
                    if autoShake == true then
                        task.wait(autoShakeDelay)
                        if child.Visible == true then
                            if autoShakeMethod == "ClickEvent" then
                                local pos = child.AbsolutePosition
                                local size = child.AbsoluteSize
                                VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, true, LocalPlayer, 0)
                                VirtualInputManager:SendMouseButtonEvent(pos.X + size.X / 2, pos.Y + size.Y / 2, 0, false, LocalPlayer, 0)
                            --[[elseif autoShakeMethod == "firesignal" then
                                firesignal(child.MouseButton1Click)]]
                            elseif autoShakeMethod == "KeyCodeEvent" then
                                while WaitForSomeone(RenderStepped) do
                                    if GUI == nil then
                                        break
                                    end
                                    if autoShake and child ~= nil then
                                        task.wait()
                                        GuiService.SelectedObject = child
                                        if GuiService.SelectedObject == child then
                                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                                        end
                                    else
                                        GuiService.SelectedObject = nil
                                        break
                                    end
                                end
                            end
                        end
                    end
                end
            end)
        end
    end
    if GUI:IsA("ScreenGui") and GUI.Name == "reel" then
        if autoReel and ReplicatedStorage:WaitForChild("events"):WaitForChild("reelfinished") ~= nil then
            repeat task.wait(autoReelDelay) ReplicatedStorage.events.reelfinished:FireServer(100, false) until GUI == nil
        end
    end
end)

autoCastConnection = LocalCharacter.ChildAdded:Connect(function(child)
    if child:IsA("Tool") and child:FindFirstChild("events"):WaitForChild("cast") ~= nil and autoCast then
        task.wait(autoCastDelay)
        if autoCastMode == "Legit" then
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, LocalPlayer, 0)
            HumanoidRootPart.ChildAdded:Connect(function()
                if HumanoidRootPart:FindFirstChild("power") ~= nil and HumanoidRootPart.power.powerbar.bar ~= nil then
                    HumanoidRootPart.power.powerbar.bar.Changed:Connect(function(property)
                        if property == "Size" then
                            if HumanoidRootPart.power.powerbar.bar.Size == UDim2.new(1, 0, 1, 0) then
                                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, LocalPlayer, 0)
                            end
                        end
                    end)
                end
            end)
        elseif autoCastMode == "Rage" then
            child.events.cast:FireServer(100)
        end
    end
end)

autoCastConnection2 = PlayerGUI.ChildRemoved:Connect(function(GUI)
    local Tool = LocalCharacter:FindFirstChildOfClass("Tool")
    if GUI.Name == "reel" and autoCast == true and Tool ~= nil and Tool:FindFirstChild("events"):WaitForChild("cast") ~= nil then
        task.wait(autoCastDelay)
        if autoCastMode == "Legit" then
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, LocalPlayer, 0)
            HumanoidRootPart.ChildAdded:Connect(function()
                if HumanoidRootPart:FindFirstChild("power") ~= nil and HumanoidRootPart.power.powerbar.bar ~= nil then
                    HumanoidRootPart.power.powerbar.bar.Changed:Connect(function(property)
                        if property == "Size" then
                            if HumanoidRootPart.power.powerbar.bar.Size == UDim2.new(1, 0, 1, 0) then
                                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, LocalPlayer, 0)
                            end
                        end
                    end)
                end
            end)
        elseif autoCastMode == "Rage" then
            Tool.events.cast:FireServer(100)
        end
    end
end)

ZoneConnection = LocalCharacter.ChildAdded:Connect(function(child)
    if ZoneCast and child:IsA("Tool") and FishingZonesFolder:FindFirstChild(Zone) ~= nil then
        child.ChildAdded:Connect(function(blehh)
            if blehh.Name == "bobber" then
                local RopeConstraint = blehh:FindFirstChildOfClass("RopeConstraint")
                if ZoneCast and RopeConstraint ~= nil then
                    RopeConstraint.Changed:Connect(function(property)
                        if property == "Length" then
                            RopeConstraint.Length = math.huge
                        end
                    end)
                    RopeConstraint.Length = math.huge
                end
                task.wait(1)
                while WaitForSomeone(RenderStepped) do
                    if ZoneCast and blehh.Parent ~= nil then
                        task.wait()
                        blehh.CFrame = FishingZonesFolder[Zone].CFrame
                    else
                        break
                    end
                end
            end
        end)
    end
end)

CollarConnection = LocalCharacter.ChildAdded:Connect(function(child)
    if CollarPlayer and child:IsA("Tool") and Players:FindFirstChild(Target).Character:FindFirstChild("Head") ~= nil then
        child.ChildAdded:Connect(function(blehh)
            if blehh.Name == "bobber" then
                local RopeConstraint = blehh:FindFirstChildOfClass("RopeConstraint")
                if CollarPlayer and RopeConstraint ~= nil then
                    RopeConstraint.Changed:Connect(function(property)
                        if property == "Length" then
                            RopeConstraint.Length = math.huge
                        end
                    end)
                    RopeConstraint.Length = math.huge
                end
                task.wait(1)
                while WaitForSomeone(RenderStepped) do
                    if CollarPlayer and blehh.Parent ~= nil then
                        task.wait()
                        blehh.CFrame = Players:FindFirstChild(Target).Character:FindFirstChild("Head").CFrame + Vector3.new(0, -1, 0)
                    else
                        break
                    end
                end
            end
        end)
    end
end)

NoclipConnection = RunService.Stepped:Connect(function()
    if Noclip == true then
        if LocalCharacter ~= nil then
            for i, v in pairs(LocalCharacter:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                end
            end
        end
    end
end)

local SafeZone = Instance.new("Part")
SafeZone.Parent = Workspace
SafeZone.Size = Vector3.new(50, 2, 50)
SafeZone.CFrame = CFrame.new(9999, 9999, 9999)
SafeZone.Anchored = true

for i, v in pairs(FishingZonesFolder:GetChildren()) do
    if table.find(fisktable, v.Name) == nil then
        table.insert(fisktable, v.Name)
    end
end

FishingZonesFolder.ChildAdded:Connect(function(child)
    if table.find(fisktable, child.Name) == nil then
        table.insert(fisktable, child.Name)
    end
end)

for i, v in pairs(TpSpotsFolder:GetChildren()) do
    if table.find(teleportSpots, v.Name) == nil then
        table.insert(teleportSpots, v.Name)
    end
end

for i, v in pairs(NpcFolder:GetChildren()) do
    if table.find(racistPeople, v.Name) == nil and v.Name ~= "mirror Area" then
        table.insert(racistPeople, v.Name)
    end
end

NpcFolder.ChildAdded:Connect(function(child)
    if table.find(racistPeople, child.Name) == nil and child.Name ~= "mirror Area" then
        table.insert(racistPeople, child.Name)
    end
end)


local AutoShakeGroup = Tabs.Main:AddLeftGroupbox('AutoShake')
local AutoReelGroup = Tabs.Main:AddLeftGroupbox('AutoReel')
local AutoCastGroup = Tabs.Main:AddLeftGroupbox('AutoCast')
local FishUtilitiesGroup = Tabs.Main:AddRightGroupbox('Fish (🐟) Utilities')
--local EventGroup = Tabs.Main:AddRightGroupbox('Event')
local ZoneCastGroup = Tabs.Main:AddRightGroupbox('ZoneCast')
local CollarPlayerGroup = Tabs.Main:AddRightGroupbox('CollarPlayer')

AutoShakeGroup:AddToggle('AutoShake', {
    Text = 'Enabled',
    Default = false,
    Tooltip = 'Automatically clicks the shake button for you',
    Callback = function(Value)
        autoShake = Value
    end
})

local AutoShakeSettings = AutoShakeGroup:AddDependencyBox()

AutoShakeSettings:AddDropdown('AutoShakeMode', {
    Text = 'Auto Shake Method',
    Tooltip = 'Method to click on the shake button',
    Values = {'ClickEvent', 'firesignal', 'KeyCodeEvent' },
    Default = autoShakeMethod,
  
    Callback = function(Value)
        autoShakeMethod = Value
    end
})

local AutoShakeKeyCodeEventText = AutoShakeSettings:AddDependencyBox()

AutoShakeKeyCodeEventText:AddLabel('Inspired from rblxscripts.net!')
AutoShakeKeyCodeEventText:AddLabel('Huge shoutout to them.')

AutoShakeKeyCodeEventText:SetupDependencies({
    { Options.AutoShakeMode, "KeyCodeEvent" }
})

AutoShakeSettings:AddSlider('AutoShakeDelay', {
    Text = 'AutoShake Delay',
    Default = 0.1,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Callback = function(Value)
        autoShakeDelay = Value
    end
})

AutoShakeSettings:SetupDependencies({
    { Toggles.AutoShake, true }
})

--[[
local AutoShakeXYOffset = AutoShakeGroup:AddDependencyBox()

AutoShakeXYOffset:AddSlider('AutoShakeXOffset', {
    Text = 'AutoShake X Offset',
    Default = 0,
    Min = -10,
    Max = 10,
    Rounding = 1,

    Callback = function(Value)
        autoShakeClickOffsetX = Value
    end
})

AutoShakeXYOffset:AddSlider('AutoShakeXOffset', {
    Text = 'AutoShake Y Offset',
    Default = 0,
    Min = -10,
    Max = 10,
    Rounding = 1,

    Callback = function(Value)
        autoShakeClickOffsetY = Value
    end
})

AutoShakeXYOffset:SetupDependencies({
    { Options.AutoShakeMode, "ClickEvent" }
})
]]

AutoReelGroup:AddToggle('AutoReel', {
    Text = 'Enabled',
    Default = false,
    Tooltip = 'Automatically reels in the fishing rod',
    Callback = function(Value)
        autoReel = Value
    end
})

local AutoReelSettings = AutoReelGroup:AddDependencyBox()

AutoReelSettings:AddSlider('AutoReelDelay', {
    Text = 'AutoReel Delay',
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 1,

    Callback = function(Value)
        autoReelDelay = Value
    end
})

AutoReelSettings:SetupDependencies({
    { Toggles.AutoReel, true }
})

AutoCastGroup:AddToggle('AutoCast', {
    Text = 'Enabled',
    Default = false,
    Tooltip = 'Automatically throws the rod',
    Callback = function(Value)
        autoCast = Value
        local Tool = LocalCharacter:FindFirstChildOfClass("Tool")
        if Tool ~= nil and Tool:FindFirstChild("events"):WaitForChild("cast") ~= nil and Value == true then
            task.wait(autoCastDelay)
            if autoCastMode == "Legit" then
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, LocalPlayer, 0)
                HumanoidRootPart.ChildAdded:Connect(function()
                    if HumanoidRootPart:FindFirstChild("power") ~= nil and HumanoidRootPart.power.powerbar.bar ~= nil then
                        HumanoidRootPart.power.powerbar.bar.Changed:Connect(function(property)
                            if property == "Size" then
                                if HumanoidRootPart.power.powerbar.bar.Size == UDim2.new(1, 0, 1, 0) then
                                    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, LocalPlayer, 0)
                                end
                            end
                        end)
                    end
                end)
            elseif autoCastMode == "Rage" then
                Tool.events.cast:FireServer(100)
            end
        end
    end
})

local AutoCastSettings = AutoCastGroup:AddDependencyBox()

AutoCastSettings:AddSlider('AutoCastDelay', {
    Text = 'AutoCast Delay',
    Default = 0.1,
    Min = 0.1,
    Max = 10,
    Rounding = 1,

    Callback = function(Value)
        autoCastDelay = Value
    end
})

AutoCastSettings:AddDropdown('AutoCastMode', {
    Text = 'Auto Cast Mode',
    Tooltip = 'Change the mode of the AutoCast',
    Values = {'Legit', 'Rage'},
    Default = autoCastMode,
  
    Callback = function(Value)
        autoCastMode = Value
    end
})

AutoCastSettings:SetupDependencies({
    { Toggles.AutoCast, true }
})

local SellButton = FishUtilitiesGroup:AddButton({
    Text = 'Sell a fish',
    Func = function()
        Workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sell"):InvokeServer()
    end,
    DoubleClick = true,
    Tooltip = 'Sells the fish you are holding'
})

local SellAllButton = FishUtilitiesGroup:AddButton({
    Text = 'Sell ALL fish',
    Func = function()
        Workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Marc Merchant"):WaitForChild("merchant"):WaitForChild("sellall"):InvokeServer()
    end,
    DoubleClick = true,
    Tooltip = 'Sells all your fish'
})

local SellAllButton = FishUtilitiesGroup:AddButton({
    Text = 'Appraise fish 🐟 (450C$)',
    Func = function()
        Workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Appraiser"):WaitForChild("appraiser"):WaitForChild("appraise"):InvokeServer()
    end,
    DoubleClick = true,
    Tooltip = 'Appraises the fish you are holding'
})

ZoneCastGroup:AddToggle('ZoneCast', {
    Text = 'Enabled',
    Default = false,
    Tooltip = 'Throws the rod to another zone',
    Callback = function(Value)
        ZoneCast = Value
    end
})

local ZoneCastDropdowns = ZoneCastGroup:AddDependencyBox()

ZoneCastDropdowns:AddDropdown('ZoneCastValue', {
    Text = 'Zone',
    Tooltip = nil,
    Values = fisktable,
    Default = Zone,
  
    Callback = function(Value)
        Zone = Value
    end
})

ZoneCastDropdowns:SetupDependencies({
    { Toggles.ZoneCast, true }
})

CollarPlayerGroup:AddToggle('CollarPlayer', {
    Text = 'Enabled',
    Default = false,
    Tooltip = "Collar's the player making them look like your pet :3",
    Callback = function(Value)
        CollarPlayer = Value
    end
})

local CollarPlayerDropdown = CollarPlayerGroup:AddDependencyBox()

CollarPlayerDropdown:AddDropdown('CollarTarget', {
    SpecialType = 'Player',
    Text = 'Player',
    Tooltip = 'Select the player you will collar',
  
    Callback = function(Value)
        Target = Value
    end
})

CollarPlayerDropdown:SetupDependencies({
    { Toggles.CollarPlayer, true }
})


local TeleportsGroup = Tabs.Teleports:AddLeftGroupbox('Teleports')

TeleportsGroup:AddDropdown('PlaceTeleport', {
    Text = 'Place teleport',
    Tooltip = 'Teleport to a place',
    Values = teleportSpots,
    Default = '',
  
    Callback = function(Value)
        if teleportSpots ~= nil and HumanoidRootPart ~= nil then
            HumanoidRootPart.CFrame = TpSpotsFolder:FindFirstChild(Value).CFrame + Vector3.new(0, 5, 0)
        end
    end
})

TeleportsGroup:AddDropdown('NPCTeleport', {
    Text = 'Teleport to Npc',
    Tooltip = 'Teleport to a npc',
    Values = racistPeople,
    Default = '',
  
    Callback = function(Value)
        if racistPeople ~= nil and HumanoidRootPart ~= nil then
            HumanoidRootPart.CFrame = NpcFolder:FindFirstChild(Value):WaitForChild("HumanoidRootPart").CFrame + Vector3.new(0, 1, 0)
        end
    end
})

TeleportsGroup:AddDropdown('ItemTeleport', {
    Text = 'Teleport to item',
    Tooltip = 'Teleport to a rod',
    Values = {"Bait_Crate", "Carbon_Rod", "Crab_Cage", "Fast_Rod", "Flimsy_Rod", "GPS", "Long_Rod", "Lucky_Rod", "Plastic_Rod", "Training_Rod"},
    Default = '',
  
    Callback = function(Value)
        if itemSpots ~= nil and HumanoidRootPart ~= nil then
            HumanoidRootPart.CFrame = itemSpots[Value]
        end
    end
})

local TeleportToSafeZoneGroup = Tabs.Teleports:AddRightGroupbox('Safe Zone')

local TeleportToSafeZoneButton = TeleportToSafeZoneGroup:AddButton({
    Text = 'Teleport to safe zone',
    Func = function()
        HumanoidRootPart.CFrame = SafeZone.CFrame + Vector3.new(0, 2, 0)
    end,
    DoubleClick = false,
    Tooltip = 'Teleports you to a safe zone'
})


local LocalPlayerGroup = Tabs.LocalPlayer:AddLeftGroupbox('LocalPlayer')

LocalPlayerGroup:AddToggle('Noclip', {
    Text = 'Noclip',
    Default = false,
    Tooltip = 'Allows you to go through walls',
    Callback = function(Value)
        Noclip = Value
    end
})

LocalPlayerGroup:AddToggle('AntiDrown', {
    Text = 'Disable Oxygen',
    Default = false,
    Tooltip = 'Allows you to stay in water infinitely',
    Callback = function(Value)
        AntiDrown = Value
        if Value == true then
            if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == true then	
                LocalCharacter.client.oxygen.Enabled = false	
            end	
            CharAddedAntiDrownCon = LocalPlayer.CharacterAdded:Connect(function()	
                if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == true and AntiDrown == true then	
                    LocalCharacter.client.oxygen.Enabled = false	
                end	
            end)
        else	
            if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == false then	
                LocalCharacter.client.oxygen.Enabled = true	
            end	
        end
    end
})

local ResetRodGroup = Tabs.LocalPlayer:AddRightGroupbox('Reset')

local ResetRodButton = ResetRodGroup:AddButton({
    Text = 'Reset rod',
    Func = function()
        local tool = LocalCharacter:FindFirstChildOfClass("Tool")

        if tool:FindFirstChild("events"):WaitForChild("reset") ~= nil then
            tool.events.reset:FireServer()
        end
    end,
    DoubleClick = false,
    Tooltip = 'Resets your rod'
})

local AntiAfkGroup = Tabs.LocalPlayer:AddRightGroupbox('AntiAFK')

local AntiAFKButton = AntiAfkGroup:AddButton({
    Text = 'Anti-AFK',
    Func = function()
        Library:Notify("Anti-AFK is now running!")
        LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end,
    DoubleClick = false,
    Tooltip = 'Disables idle kick'
})

local FreezeCharacterGroup = Tabs.LocalPlayer:AddLeftGroupbox('Freeze Character')

FreezeCharacterGroup:AddToggle('FreezeCharacter', {
    Text = 'Enabled',
    Default = false,
    Tooltip = "Freezes your character in current location",
    Callback = function(Value)
        local oldpos = HumanoidRootPart.CFrame
        FreezeChar = Value
        task.wait()
        while WaitForSomeone(RenderStepped) do
            if FreezeChar and HumanoidRootPart ~= nil then
                task.wait()
                HumanoidRootPart.CFrame = oldpos
            else
                break
            end
        end
    end
})


local SettingsGroup = Tabs.Settings:AddLeftGroupbox('Settings')
local CreditsGroup = Tabs.Settings:AddRightGroupbox('Credits')

CreditsGroup:AddLabel('Made by Felmo!')
CreditsGroup:AddLabel('Made with khaboy and Kj (nah :3')

local DiscordButton = CreditsGroup:AddButton({
    Text = 'Copy Discord link (soon)',
    Func = function()
        setclipboard('Soon Dont Click')
    end,
    DoubleClick = false,
    Tooltip = 'Join our main discord!'
})

CreditsGroup:AddLabel('البرود يا جماعه هو الحل')

SettingsGroup:AddButton('Unload', function() Library:Unload() end)

Library:OnUnload(function()
	Library.Unloaded = true
    if autoReel then
        autoReel = false
    end
    if autoShake then
        autoShake = false
    end
    if AntiDrown then
        if LocalCharacter ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen") ~= nil and LocalCharacter:FindFirstChild("client"):WaitForChild("oxygen").Enabled == false then
            LocalCharacter.client.oxygen.Enabled = true
            CharAddedAntiDrownCon:Disconnect()
            AntiDrown = false
        end
    end
    if Noclip then
        Noclip = false
    end
    if autoCast then
        autoCast = false
    end
    if ZoneCast then
        ZoneCast = false
    end
    if CollarPlayer then
        CollarPlayer = false
    end
    WatermarkConnection:Disconnect()
    NoclipConnection:Disconnect()
    autoreelandshakeConnection:Disconnect()
    autoCastConnection:Disconnect()
    autoCastConnection2:Disconnect()
    ZoneConnection:Disconnect()
    CollarConnection:Disconnect()
end)

SettingsGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' })

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)

SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('RinnsHub')

SaveManager:SetFolder('RinnsHub/Fisch')

SaveManager:BuildConfigSection(Tabs.Settings)

ThemeManager:ApplyToTab(Tabs.Settings)

SaveManager:LoadAutoloadConfig()

local Version = "5.2.1"

task.spawn(function()
    local success, LatestVer = pcall(function()
        local version = game:HttpGet("https://pastebin.com/raw/mWssqEPS"))()
        return HttpService:JSONDecode(version)
    end)
    
    if success then
        if Version ~= LatestVer then
            Library:Notify("You are using an outdated version of the Fisch script.")
            Library:Notify("Join our fisch discord server to get the new script.")
        end
    end
end)