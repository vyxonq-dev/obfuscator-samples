getgenv().version = "beta 1.0"
local function getSigmacode()
    return 'EMMFOSS__!ZCNSJNXCSDWQSANBX'
end
local function fireRemote(method, args)
    game:GetService("ReplicatedStorage").ALLREMBINDS.MainRemoteEvent:FireServer(getSigmacode(), method, args)
end
local function none(...)
    return ...
end
getgenv = getgenv or none
setclipboard = setclipboard or none
hookfunction = hookfunction or none

pcall(function()
    local soundService = game:GetService("SoundService")
    if not soundService:FindFirstChildWhichIsA("Sound") then
        if game:GetService("ReplicatedStorage"):FindFirstChild("KamuiSound2") then
            game:GetService("ReplicatedStorage").ALLREMBINDS.MainRemoteEvent:FireServer(getSigmacode(), "CloneParentTo", { game:GetService("ReplicatedStorage"):FindFirstChild("KamuiSound2"), soundService })
        else
            game:GetService("ReplicatedStorage").ALLREMBINDS.MainRemoteEvent:FireServer(getSigmacode(), "CloneParentTo", { game:GetService("ReplicatedStorage").Sounds.FruitsSSSSSS.Dragon.C.BF_V3_Dragon_C_Activate_03, soundService })
        end
    end
end)

local Main = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local localPlayer = Players.LocalPlayer
local npcFolder = workspace:WaitForChild("Characters")
local fruitsFolder = localPlayer.PlayerStats.Tools
local skybox = Lighting:FindFirstChildOfClass("Sky")
local guiSize = game:GetService("UserInputService").TouchEnabled and UDim2.fromOffset(320, 400) or UDim2.fromOffset(580, 460)

local tool = Instance.new("Tool", localPlayer.Backpack)
tool.RequiresHandle = false
tool.TextureId = "http://www.roblox.com/asset/?id=12223874"
local selectionBox = Instance.new("SelectionBox", workspace)
selectionBox.LineThickness = 0.1
local mouse = localPlayer:GetMouse()
local toolEquipped = false

tool.Equipped:Connect(function()
    toolEquipped = true
    local connection
    connection = RunService.RenderStepped:Connect(function()
        if not toolEquipped then
            connection:Disconnect()
            return
        end
        if mouse.Target then
            selectionBox.Adornee = mouse.Target
            mouse.Icon = "rbxasset://textures/HammerCursor.png"
        else
            selectionBox.Adornee = nil
            mouse.Icon = ""
        end
    end)
end)

tool.Unequipped:Connect(function()
    toolEquipped = false
    selectionBox.Adornee = nil
    mouse.Icon = ""
end)

tool.Activated:Connect(function()
    if mouse.Target then
        fireRemote("ChangeProptyOfSmtHSH", { mouse.Target, "Parent", nil })
    end
end)
local flingPower = 1000
local fruitsName, plrName = {}, {}

for _, fruit in ipairs(fruitsFolder:GetChildren()) do
    table.insert(fruitsName, fruit.Name)
end

local function addPlayer(plr)
    table.insert(plrName, plr.Name)
end

local function removePlayer(plr)
    for i = #plrName, 1, -1 do
        if plrName[i] == plr.Name then
            table.remove(plrName, i)
            break
        end
    end
end

for _, plr in ipairs(Players:GetPlayers()) do
    addPlayer(plr)
end
Players.PlayerAdded:Connect(addPlayer)
Players.PlayerRemoving:Connect(removePlayer)

local window = Main:CreateWindow({
    Title = "Brick Hub " .. getgenv().version,
    SubTitle = "by Someone",
    TabWidth = 160,
    Size = guiSize,
    Acrylic = true,
    Theme = "Dark"
})
local Tabs = {
    Main = window:AddTab({ Title = "Main", Icon = "box" }),
    OP = window:AddTab({ Title = "Exploit", Icon = "skull" }),
    Skybox = window:AddTab({ Title = "Skybox", Icon = "cloud" }),
    Song = window:AddTab({ Title = "Song", Icon = "music" }),
    Vision = window:AddTab({ Title = "Vision", Icon = "eye" }),
    Players = window:AddTab({ Title = "Players", Icon = "user" }),
    Fruits = window:AddTab({ Title = "Fruits", Icon = "apple" }),
    Settings = window:AddTab({ Title = "Settings", Icon = "settings" }),
}
do
    Tabs.Main:AddParagraph({ Title = "Credit", Content = "Made by someone" })
    Tabs.Main:AddButton({
        Title = "CLICK TO JOIN OUR DISCORD",
        Description = "https://discord.gg/a59mzw3fXw",
        Callback = function() setclipboard("https://discord.gg/a59mzw3fXw") end
    })
end

do
    Tabs.OP:AddButton({
        Title = "CLICK TO DESTROY (FE)",
        Callback = function() tool.Parent = localPlayer.Character end
    })
    Tabs.OP:AddButton({
        Title = "BTOOLS [BETA]",
        Callback = function() Main:Notify({ Title = "Notify", Content = "Soon!", Duration = 3 }) end
    })
    Tabs.OP:AddButton({
        Title = "DHEX",
        Callback = function() Main:Notify({ Title = "Notify", Content = "Soon!", Duration = 3 }) end
    })
    Tabs.OP:AddButton({
        Title = "TEAM SPAM",
        Callback = function()
            for _, team in pairs(game:GetService("Teams"):GetChildren()) do
                fireRemote("CloneParentTo", {team,game:GetService("Teams")})
                fireRemote("ChangeProptyOfSmtHSH", {team,"Name","SOLYNOT IS HERE"})
                fireRemote("ChangeProptyOfSmtHSH", {team,"TeamColor",BrickColor.new(math.random(), math.random(), math.random())})
            end
        end
    })
    Tabs.OP:AddButton({
        Title = "GODMODE",
        Callback = function()
            fireRemote("ChangeProptyOfSmtHSH", { localPlayer.PlayerStats.MaxHealth, "Value", 9e9 })
            fireRemote("ChangeProptyOfSmtHSH", { localPlayer.PlayerStats.MaxEnergy, "Value", 9e9 })
        end
    })

    Tabs.OP:AddButton({
        Title = "NO COOLDOWN",
        Description = "credit: Selunar",
        Callback = function()
            local success, err = pcall(function()
                hookfunction(require(ReplicatedStorage["MAIN;"]).GetIsInCoolDown, function(a, b) return false, 0 end)
            end)
            if success then
                Main:Notify({ Title = "Success", Content = "Cooldown disabled.", Duration = 3 })
            else
                Main:Notify({ Title = "Error", Content = "Failed to disable cooldown: " .. err, Duration = 5 })
            end
        end
    })

    local pColor = Tabs.OP:AddColorpicker("Colorpicker", { Title = "Colorpicker", Default = Color3.new(0, 0, 0) })

    Tabs.OP:AddButton({
        Title = "CHANGE EVERY PART TO CUSTOM COLOR",
        Callback = function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("BasePart") then fireRemote("ChangeProptyOfSmtHSH", { v, "Color", pColor.Value }) end
            end
        end
    })

    Tabs.OP:AddButton({
        Title = "CHANGE EVERY PART TO RANDOM COLOR",
        Callback = function()
            for _, v in pairs(game:GetDescendants()) do
                if v:IsA("BasePart") then fireRemote("ChangeProptyOfSmtHSH", { v, "Color", Color3.new(math.random(), math.random(), math.random()) }) end
            end
        end
    })

    Tabs.OP:AddInput("Input", {
        Title = "FLING POWER",
        Default = tostring(flingPower),
        Numeric = true,
        Callback = function(Value) flingPower = tonumber(Value) or flingPower end
    })

    Tabs.OP:AddButton({
        Title = "FLING ALL PLAYERS/NPC",
        Callback = function()
            for _, character in pairs(npcFolder:GetChildren()) do
                if character:IsA("Model") and character:FindFirstChild("Humanoid") and character.Name ~= localPlayer.Name then
                    fireRemote("ASeemblyLinearVEllChangerr", { character:FindFirstChild("HumanoidRootPart"), Vector3.new(0, flingPower, 0) })
                end
            end
        end
    })
end

do
    local customSkyInput = Tabs.Skybox:AddInput("Input", { Title = "ENTER CUSTOM SKYBOX (asset id only)", Default = 1365169976, Numeric = true })
    Tabs.Skybox:AddInput("Input", {
        Title = "ENTER DECAL (asset id only)",
        Default = 1365169976,
        Numeric = true,
        Callback = function(Value)
            fireRemote("ChangeProptyOfSmtHSH", { ReplicatedStorage.VFX.OtherSSSSS.XCombat.cracks.Decal, "Texture", "rbxassetid://" .. Value })
            fireRemote("ChangeProptyOfSmtHSH", { ReplicatedStorage.VFX.OtherSSSSS.XCombat.cracks.Decal, "Color3", Color3.new(1, 1, 1) })
        end
    })
    Tabs.Skybox:AddInput("Input", {
        Title = "ENTER EFFECT (asset id only)",
        Default = 1365169976,
        Numeric = true,
        Callback = function(Value)
            fireRemote("ChangeProptyOfSmtHSH", { ReplicatedStorage.VFX.OtherSSSSS.XCombat.cracks.Attachment.ParticleEmitter, "Texture", "rbxassetid://" .. Value })
            fireRemote("ChangeProptyOfSmtHSH", { ReplicatedStorage.VFX.OtherSSSSS.XCombat.cracks.Attachment.ParticleEmitter, "Enabled", true })
        end
    })
    Tabs.Skybox:AddButton({
        Title = "CHANGE CUSTOM SKYBOX",
        Callback = function()
            local faces = {"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}
            for _, face in ipairs(faces) do fireRemote("ChangeProptyOfSmtHSH", { skybox, face, "rbxassetid://" .. customSkyInput.Value }) end
        end
    })
    Tabs.Skybox:AddButton({
        Title = "COOLKID SKYBOX",
        Callback = function()
            local faces = {"SkyboxBk", "SkyboxDn", "SkyboxFt", "SkyboxLf", "SkyboxRt", "SkyboxUp"}
            for _, face in ipairs(faces) do fireRemote("ChangeProptyOfSmtHSH", { skybox, face, "rbxassetid://1365169976" }) end
        end
    })
    Tabs.Skybox:AddButton({
        Title = "DECAL SPAM",
        Callback = function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then fireRemote("CloneParentTo", { ReplicatedStorage.VFX.OtherSSSSS.XCombat.cracks.Decal, v }) end
            end
        end
    })
    Tabs.Skybox:AddButton({
        Title = "PARTICLE SPAM",
        Callback = function()
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then fireRemote("CloneParentTo", { ReplicatedStorage.VFX.OtherSSSSS.XCombat.cracks.Attachment.ParticleEmitter, v }) end
            end
        end
    })
end

do
    local customSongInput = Tabs.Song:AddInput("Input", { Title = "ENTER CUSTOM SONG", Default = 1, Numeric = true })
    Tabs.Song:AddButton({
        Title = "PLAY CUSTOM SONG",
        Callback = function()
            local sound = game:GetService("SoundService"):FindFirstChildWhichIsA("Sound")
            fireRemote("ChangeProptyOfSmtHSH", { sound, "SoundId", "rbxassetid://" .. customSongInput.Value })
            fireRemote("ChangeProptyOfSmtHSH", { sound, "Playing", true })
            fireRemote("ChangeProptyOfSmtHSH", { sound, "Looped", true })
        end
    })
    Tabs.Song:AddButton({
        Title = "STOP CUSTOM SONG",
        Callback = function()
            local sound = game:GetService("SoundService"):FindFirstChildWhichIsA("Sound")
            fireRemote("ChangeProptyOfSmtHSH", { sound, "Playing", false })
            fireRemote("ChangeProptyOfSmtHSH", { sound, "Looped", false })
        end
    })
    Tabs.Song:AddInput("Input", {
        Title = "Volume",
        Default = 1,
        Numeric = true,
        Callback = function(Value)
            local sound = game:GetService("SoundService"):FindFirstChildWhichIsA("Sound")
            fireRemote("ChangeProptyOfSmtHSH", { sound, "Volume", Value })
        end
    })
    Tabs.Song:AddInput("Input", {
        Title = "PlaybackSpeed",
        Default = 1,
        Numeric = true,
        Callback = function(Value)
            local sound = game:GetService("SoundService"):FindFirstChildWhichIsA("Sound")
            fireRemote("ChangeProptyOfSmtHSH", { sound, "PlaybackSpeed", Value })
        end
    })
end

do
    local textAnnounce = Tabs.Vision:AddInput("Input", { Title = "Text (can be rich text)", Default = "https://discord.gg/8pJCFW8cpG", Numeric = false })
    Tabs.Vision:AddButton({
        Title = "ANNOUNCE ALL",
        Callback = function() for _, plr in pairs(Players:GetPlayers()) do fireRemote("SendAbovETexTTT", { textAnnounce.Value, plr }) end end
    })
    Tabs.Vision:AddButton({
        Title = "BLIND ALL",
        Callback = function() fireRemote("Add_LiGthing_Effects_FromDistance", { Vector3.new(0, 0, 0), 1e17, { ColorCorrection = { THeTWeeenFor_MakeTween__ = { {1}, {TintColor = Color3.new(0,0,0)} }, StartingTintColor = Color3.new(0,0,0) } } }) end
    })
    Tabs.Vision:AddButton({
        Title = "RED SKY",
        Callback = function() fireRemote("Add_LiGthing_Effects_FromDistance", { Vector3.new(0, 0, 0), 1e17, { ColorCorrection = { THeTWeeenFor_MakeTween__ = { {1}, {TintColor = Color3.new(1,0,0)} }, StartingTintColor = Color3.new(1,0,0) } } }) end
    })
    Tabs.Vision:AddButton({
        Title = "SHAKE ALL PLAYERS CAMERA",
        Callback = function() fireRemote("ShAkeCamFromDiStanceee", { Vector3.new(0, 0, 0), 1e16, { ShakeOnce = true, Propties = {9999999999, 999999, 5, 555, Vector3.new(10, 999999999, 10), Vector3.new(999, 999, 999)} } }) end
    })
end


local plrDropdown = Tabs.Players:AddDropdown("Dropdown", { Title = "SELECT PLAYER", Values = plrName, Multi = false, Default = 1 })
Tabs.Players:AddButton({ Title = "Refresh Players", Callback = function() plrDropdown:SetValue(plrName) end })
local moneyInput = Tabs.Players:AddInput("Input", { Title = "Money Value", Default = 100, Numeric = true })
local levelInput = Tabs.Players:AddInput("Input", { Title = "Level Value", Default = 100, Numeric = true })
local bountyInput = Tabs.Players:AddInput("Input", { Title = "Bounty Value", Default = 100, Numeric = true })
local bodyPowerInput = Tabs.Players:AddInput("Input", { Title = "Body Power Value", Default = 100, Numeric = true })
local bloxFruitInput = Tabs.Players:AddInput("Input", { Title = "Blox Fruit Value", Default = 100, Numeric = true })
Tabs.Players:AddButton({
    Title = "KICK ALL PLAYERS",
    Callback = function() for _, plr in pairs(Players:GetPlayers()) do if plr ~= localPlayer then fireRemote("ChangeProptyOfSmtHSH", { plr, "Parent", nil }) end end end
})
Tabs.Players:AddButton({
    Title = "BRING ALL",
    Callback = function() for _, plr in ipairs(Players:GetPlayers()) do if plr ~= localPlayer then fireRemote("ChangeProptyOfSmtHSH", { plr.Character.PrimaryPart, "CFrame", localPlayer.Character.PrimaryPart.CFrame * CFrame.new(0, 0, -10) }) end end end
})
Tabs.Players:AddButton({
    Title = "KILL ALL",
    Callback = function() for _, plr in ipairs(Players:GetPlayers()) do if plr ~= localPlayer then fireRemote("ChangeProptyOfSmtHSH", { plr.Character.Humanoid, "Health", 0 }) end end end
})
Tabs.Players:AddButton({
    Title = "KILL PLAYER",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target and target.Character then fireRemote("ChangeProptyOfSmtHSH", { target.Character.Humanoid, "Health", 0 }) end end
})
Tabs.Players:AddButton({
    Title = "KICK PLAYER",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target then fireRemote("ChangeProptyOfSmtHSH", { target, "Parent", nil }) end end
})
Tabs.Players:AddButton({
    Title = "BRING PLAYER",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target and target.Character then fireRemote("ChangeProptyOfSmtHSH", { target.Character.PrimaryPart, "CFrame", localPlayer.Character.PrimaryPart.CFrame * CFrame.new(0, 0, -10) }) end end
})
Tabs.Players:AddButton({
    Title = "SET MONEY",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target then fireRemote("ChangeProptyOfSmtHSH", { target.PlayerStats.Money, "Value", moneyInput.Value }) end end
})
Tabs.Players:AddButton({
    Title = "SET LEVEL",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target then fireRemote("ChangeProptyOfSmtHSH", { target.PlayerStats.Level, "Value", levelInput.Value }) end end
})
Tabs.Players:AddButton({
    Title = "SET BOUNTY",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target then fireRemote("ChangeProptyOfSmtHSH", { target.leaderstats["Bounty/Honor"], "Value", bountyInput.Value }) end end
})
Tabs.Players:AddButton({
    Title = "SET BODY POWER STAT",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target then fireRemote("ChangeProptyOfSmtHSH", { target.PlayerStats.BodyPowerStat, "Value", bodyPowerInput.Value }) end end
})
Tabs.Players:AddButton({
    Title = "SET BLOX FRUIT STAT",
    Callback = function() local target = Players:FindFirstChild(plrDropdown.Value); if target then fireRemote("ChangeProptyOfSmtHSH", { target.PlayerStats.BloxFruitsStat, "Value", bloxFruitInput.Value }) end end
})


do
    local fruitDropdown = Tabs.Fruits:AddDropdown("Dropdown", { Title = "FRUITS (ONLY FRUIT DONT SELECT ITEM)", Values = fruitsName, Multi = false, Default = 1 })
    Tabs.Fruits:AddButton({
        Title = "GET FRUIT",
        Callback = function() fireRemote("AddToolToBackpackKKK", { fruitDropdown.Value .. " Fruit", localPlayer:WaitForChild("Backpack"), true, true }) end
    })
    Tabs.Fruits:AddButton({
        Title = "GIVE FRUIT TO PLAYER",
        Callback = function() local target = Players:FindFirstChild(plrName[1]); if target then fireRemote("AddToolToBackpackKKK", { fruitDropdown.Value .. " Fruit", target:WaitForChild("Backpack"), true, true }) end end
    })
    Tabs.Fruits:AddButton({
        Title = "GET ALL FRUITS",
        Callback = function() for _, fruit in ipairs(fruitsFolder:GetChildren()) do fireRemote("AddToolToBackpackKKK", { fruit.Name .. " Fruit", localPlayer:WaitForChild("Backpack"), true, true }) end end
    })
    Tabs.Fruits:AddButton({
        Title = "INF MASTERY FOR EVERYTHING",
        Callback = function() for _, fruit in ipairs(fruitsFolder:GetChildren()) do fireRemote("GiveMasteryEXPTO__Smthh", { localPlayer, fruit.Name, 99999999, true }) end end
    })
end

SaveManager:SetLibrary(Main)
InterfaceManager:SetLibrary(Main)
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
