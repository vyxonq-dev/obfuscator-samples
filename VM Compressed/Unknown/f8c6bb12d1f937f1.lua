local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CeleryHub/Shlexware-s-Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Lazy Script V2 - Anm Battlegrounds", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "Are You Lazy?", IntroIcon = "rbxassetid://16336200609"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

Tab:AddLabel("Choose 'characters' in game first")

local Section = Tab:AddSection({Name = "Okarun"})

Tab:AddButton({
Name = "Swirl Kick",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Swirl Kick"].Client.SwirlKickEvent:FireServer()
end})

Tab:AddButton({
Name = "I'm So Depressed",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["I'm So Depressed"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "20 Blow",
Callback = function()
local args = {
    [1] = "20 Blow Counter"
}

game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("20 Blow").Handler.Connector:FireServer(unpack(args))
end})

Tab:AddButton({
Name = "Claws Rampage",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Claws Rampage"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Hurricane Dropkick",
Callback = function()
local args = {
    [1] = "Dropkick"
}

game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hurricane Dropkick").Run.Connect:FireServer(unpack(args))
end})

Tab:AddButton({
Name = "Rush Strike",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Rush Strike"].Client.AxeKickEvent:FireServer()
end})

Tab:AddButton({
Name = "Rush Rampage",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Rush Rampage"].LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Saitama"})

Tab:AddButton({
Name = "Serious Punch",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Serious Punch"].Client.Connector:FireServer()
end})

Tab:AddButton({
Name = "Table Flip",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Table Flip"].Client.Connector:FireServer()
end})

local Section = Tab:AddSection({Name = "Sung Jin Woo"})

Tab:AddButton({
Name = "Impale Cuts",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Impale Cuts"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Speed Blitz",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Speed Blitz"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Shadow Dash",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Shadow Dash"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Shadow Slash Barrage",
Callback = function()
for i = 1, 8 do
game:GetService("Players").LocalPlayer.Backpack["Shadow Slash Barrage"].LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
Name = "Shadow Rush Rampage",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Shadow Rush Rampage"].Client.Connector:FireServer()
end})

Tab:AddButton({
Name = "Arise",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Arise.LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Gremmy"})

Tab:AddButton({
Name = "Water Flip",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Water Flip"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Mini Meteor Tool",
Callback = function()
local tool = Instance.new("Tool")
tool.Name = "Hacked Mini Meteor!"
tool.RequiresHandle = false

tool.Activated:Connect(function()
                local troller = game.Players.LocalPlayer:GetMouse().Hit.Position
game:GetService("Players").LocalPlayer.Backpack["Mini Meteor"].LocalScript.Event:FireServer(troller)
end)

tool.Parent = game.Players.LocalPlayer.Backpack
end})

Tab:AddButton({
Name = "Big Meteor Tool",
Callback = function()
local tool = Instance.new("Tool")
tool.Name = "Hacked Big Meteor!"
tool.RequiresHandle = false

tool.Activated:Connect(function()
local troller = game.Players.LocalPlayer:GetMouse().Hit.Position
for i = 1, 5 do
game:GetService("Players").LocalPlayer.Backpack["Mini Meteor"].LocalScript.Event:FireServer(troller)
end
end)

tool.Parent = game.Players.LocalPlayer.Backpack
end})

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Surprise Meteor",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
loool = game:GetService("Players")[lol].Character.HumanoidRootPart.Position + Vector3.new(0, 0, 0)
game:GetService("Players").LocalPlayer.Backpack["Mini Meteor"].LocalScript.Event:FireServer(loool)
game:GetService("Players").LocalPlayer.Backpack["Mini Meteor"].LocalScript.Event:FireServer(loool)
game:GetService("Players").LocalPlayer.Backpack["Mini Meteor"].LocalScript.Event:FireServer(loool)
game:GetService("Players").LocalPlayer.Backpack["Mini Meteor"].LocalScript.Event:FireServer(loool)
game:GetService("Players").LocalPlayer.Backpack["Mini Meteor"].LocalScript.Event:FireServer(loool)
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

Tab:AddButton({
Name = "Fissure Slap",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Fissure Slap"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Magma Explode",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Magma Splash",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
wait(0.15)
game:GetService("Players").LocalPlayer.Backpack["Magma Explode"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Grenade Explosion",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Grenade Explosion"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Water Prison",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Water Prison"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Space Vacuum",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Space Vacuum"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "The Strongest Quincy",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["The Strongest Quincy"].LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Subaru"})

Tab:AddButton({
Name = "Shamac",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Shamac.LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Rental Goa",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Rental Goa"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "REM!",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["REMM !"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "I can return from death",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["\"I can return from death\""].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Reinhard",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Reinhard !!"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Return By Death",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Return By Death"].LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Yhwach"})

Tab:AddButton({
Name = "Blut Vene Aufheben",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Blut Vene Aufheben"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Sklaverei",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Sklaverei.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Auswhlen",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Ausw\195\164hlen"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "The Almighty - Awake",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["The Almighty"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Splash Almighty",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Splash Almighty"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "8x Sankt  Zwinger",
 Callback = function()
        for i = 1, 8 do
game:GetService("Players").LocalPlayer.Backpack["Sankt  Zwinger"].LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Kill All",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/Yhwach%20all"))()
end})

Tab:AddButton({
 Name = "1 Shot slash",
 Callback = function()
for i = 1, 8 do
game:GetService("Players").LocalPlayer.Backpack["Yamamoto Slash"].LocalScript.Event:FireServer()
end
end})

local Section = Tab:AddSection({Name = "Yamamoto"})

Tab:AddButton({
 Name = "Reiatsu",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Reiatsu.LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Ryujin Jakka",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Ry\197\171jin Jakka"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Hado 96 Ittokaso",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Had\197\141 96: Ittokaso"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Bankai",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Bankai.LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "World Destroyer",
 Callback = function()
for i = 1, 8 do
game:GetService("Players").LocalPlayer.Backpack["World Breaker"].LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "1 Shot Flame Slash",
 Callback = function()
        for i = 1, 8 do
game:GetService("Players").LocalPlayer.Backpack["North Tenchi Kaijin"].LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "West Zanjitsu Gokui",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["West Zanjitsu Gokui"].LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Aizen"})
 
Tab:AddButton({
   Name = "Sonido Clones",
   Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Sonido Clones"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hado 90",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hado 90"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Awakening",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Hogyoku Fusion").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hadō 90: Kurohitsugi!",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack[utf8.char(72, 97, 100, 333, 32, 57, 48, 58, 32, 75, 117, 114, 111, 104, 105, 116, 115, 117, 103, 105)].LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Toji"})

Tab:AddButton({
 Name = "Awaken",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Inverted Spear Of Heaven"].Script.Event:FireServer()
end})

Tab:AddButton({
 Name = "Little Hand",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Little Hand"].Combo.Event:FireServer()
end})

Tab:AddButton({
 Name = "Wrong Way",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Wrong Way"].Main.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Kenjaku"})

Tab:AddButton({
 Name = "Uzumaki",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Maximum Uzumaki"].Move1.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Squid Curse",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Squid Curse"].Move1.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Supreme Art Uzumaki",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Supreme Art: Maximum Uzumaki"].Move1.Event:FireServer()
   end})

local Section = Tab:AddSection({Name = "Shadow V1"})

Tab:AddButton({
 Name = "Overdrive",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Overdrive["Full Cowl"].Event:FireServer()
end})

Tab:AddButton({
 Name = "Heal",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Heal.Script.Event:FireServer()
end})

Tab:AddButton({
 Name = "V1 Atomic - You Need hold item",
 Callback = function()
game:GetService("ReplicatedStorage").AtomicFolder.gaydog:FireServer()
end})

Tab:AddButton({
 Name = "V1 All Range Atomic - You need hold item",
 Callback = function()
game:GetService("ReplicatedStorage").AtomicFolder.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Kuchiki Byakuya"})

Tab:AddButton({
 Name = "Gokei",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Gokei.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Seamless",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Seamless.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Bankai",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Bankai.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Senkei",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Senkai.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Sakura Aura",
 Callback = function()
while true do
wait(2)
game:GetService("Players").LocalPlayer.Backpack.Seamless.LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Hado 99 SOKATSUI",
 Callback = function()
for i = 1, 6 do
game:GetService("Players").LocalPlayer.Backpack.Sokatsui.LocalScript.Event:FireServer()
end
end})

local Section = Tab:AddSection({Name = "Inumaki Toge - Hold Cursed Speech"})

Tab:AddButton({
 Name = "Come",
 Callback = function()
game.Players:Chat("come")
end})

Tab:AddButton({
 Name = "Sleep",
 Callback = function()
game.Players:Chat("sleep")
end})

Tab:AddButton({
 Name = "Die",
 Callback = function()
game.Players:Chat("die")
end})

Tab:AddButton({
 Name = "Heal",
 Callback = function()
game.Players:Chat("heal")
end})

Tab:AddButton({
 Name = "Troll Heal - use this to boss",
 Callback = function()
for i = 1, 50 do
game.Players:Chat("heal")
end
end})

local Section = Tab:AddSection({Name = "Ayanokouji"})

Tab:AddButton({
 Name = "serious",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Serious:FindFirstChild("Full Cowl").Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Manjiro"})

Tab:AddButton({
 Name = "Dark Impulse",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dark Impulse"):FindFirstChild("Full Cowl").Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Mahito"})

Tab:AddButton({
 Name = "True Curse",
 Callback = function()  
for i = 1, 7 do
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("True Curse").LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "One Punch",
 Callback = function()  
for i = 1, 15 do
game:GetService("Players").LocalPlayer.Backpack["Soul Bend"].Move.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Eye pop",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Eye Pop").Rush.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Sukuna"})

Tab:AddButton({
 Name = "V1 Dismantle",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Dismantle.Dismantle.Event:FireServer()
end})

Tab:AddButton({
 Name = "V1 Go/jo Dismantle",
 Callback = function()  
        for i = 1, 10 do
game:GetService("Players").LocalPlayer.Backpack.Dismantle.Dismantle.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "V1 World Slash",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["World Slash"].LocalScript.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "V1 World Slash Net",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Dismantle: Net"].LocalScript.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "V1 World Slash Dismantle",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["World Slash: Dismantle"].Punch.Event:FireServer()
end})

Tab:AddButton({
 Name = "Become Fake V2 Sukuna",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.KingofCurses:FireServer()
end})

Tab:AddButton({
 Name = "V2 Cleave",
 Callback = function()  
        for i = 1, 5 do
game:GetService("Players").LocalPlayer.Backpack.Cleave.LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "V2 Dismantle",
 Callback = function()      
game:GetService("Players").LocalPlayer.Backpack.Dismantle.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Normal Fuga",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Furnace.LocalScript.event:FireServer()
end})

Tab:AddButton({
 Name = "True Fuga",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Furnace.LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Gojo Unleashed"})

Tab:AddButton({
 Name = "Black flash",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Flash").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Simple Domain",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Simple Domain"].Use.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "10 Black flash",
 Callback = function()
        for i = 1, 10 do
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Black Flash").LocalScript.Event:FireServer()
end
end})

local Section = Tab:AddSection({Name = "Gojo V2"})

Tab:AddButton({
 Name = "Awake 1 - One Six Eyes",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["One Six Eyes"].Script.Event:FireServer()
end})

Tab:AddButton({
 Name = "Awake 2 - Six Eyes",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Six Eyes"].Script.Event:FireServer()
end})

Tab:AddButton({
 Name = "Freeze Black Flash - use old hakari domain after u use this",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Black Flash"].BlackFlash:FireServer()
end})

Tab:AddButton({
 Name = "Grab Divergent",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Grab Divergent"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Maximum Hollow Purple",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Maximum Hollow Purple"].Skill.Event:FireServer()
end})

Tab:AddButton({
 Name = "Unlimited Void",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Unlimited Void"].Skill.InfinityVoid:FireServer()
end})

local Section = Tab:AddSection({Name = "Okkotsu"})

Tab:AddButton({
 Name = "Black flash",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Black Flash"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "10 Mimicry",
 Callback = function()
for i = 1, 10 do
game:GetService("Players").LocalPlayer.Backpack.Mimicry.Script.Event:FireServer()
end
end})

local Section = Tab:AddSection({Name = "Okkotsu Gojo - You can get this from Okkotsu mimicry skill"})

Tab:AddButton({
 Name = "Fury Barrage",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Fury Barrage"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Lapse Blue",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Lapse Blue"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Blue Laser",
 Callback = function()
        while true do
  wait(0.1)
game:GetService("Players").LocalPlayer.Backpack["Lapse Blue"].LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Reversal Red",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Reversal Red"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hollow Purple",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hollow Purple"].LocalScript.event:FireServer()
end})

Tab:AddButton({
 Name = "Imaginary Technique Purple",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Imaginary Technique Purple"].murasaki.Event:FireServer()
end})

Tab:AddButton({
 Name = "Unlimited Void",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Unlimited Void"].Skill.InfinityVoid:FireServer()
end})

local Section = Tab:AddSection({Name = "Itadori Yuji"})

Tab:AddButton({
 Name = "Boxing Arena",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Boxing Arena"].Skill.RingOfDeath:FireServer()
end})

local Section = Tab:AddSection({Name = "Fushiguro Megumi"})

Tab:AddButton({
 Name = "Dark Surge",
 Callback = function()
        for i = 1, 7 do
game:GetService("Players").LocalPlayer.Backpack["Dark Surge"].Skill.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Triple Elephant",
 Callback = function()
        for i = 1, 3 do
game:GetService("Players").LocalPlayer.Backpack["Max Elephant"]["Max Elephant Strike"].RemoteEvent:FireServer()
end
end})

Tab:AddButton({
 Name = "Chimera Shadow Garden",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Chimera Shadow Garden"].Use.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "Become Mahoraga",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Mahoraga.Mahoraga.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "Eat Mukbang Finger - become Fushiguro Sukuna",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Mukbang Finger"].Script.Event:FireServer()
end})

Tab:AddButton({
 Name = "Become Megumi Fushiguro",
 Callback = function()
        local args = {
    [1] = "Megumi Fushiguro"
}

game:GetService("ReplicatedStorage"):WaitForChild("Picked"):FireServer(unpack(args))
end})

Tab:AddButton({
 Name = "Summon NPC Mahoraga",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Summon Mahoraga"].Use.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "Dismante - Fushiguro Sukuna",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Dismantle.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "World Slash - Mahoraga and Fushiguro Sukuna",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["World Slash"].LocalScript.RemoteEvent:FireServer()
end})

local Section = Tab:AddSection({Name = "Ichigo Vasto Lorde"})

Tab:AddButton({
 Name = "Scream",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Scream.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Cero",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Cero.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Grab Cero",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Grab Cero"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hollow Mask",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hollow Mask"].HollowMask.Remote:FireServer()
end})

local Section = Tab:AddSection({Name = "Kamado Tanjiro"})

Tab:AddButton({
 Name = "Death Dance",
 Callback = function()
for i = 1, 7 do
game:GetService("Players").LocalPlayer.Backpack["Dragon Sun Halo Head Dance"].Ground.Event:FireServer()
end
end})

local Section = Tab:AddSection({Name = "Akaza"})

Tab:AddButton({
 Name = "Compass Needle",
 Callback = function()
for i = 1, 7 do
game:GetService("Players").LocalPlayer.Backpack["Compass Needle"].Akaza.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Death Punch Rush",
 Callback = function()
for i = 1, 7 do
game:GetService("Players").LocalPlayer.Backpack.Disorder.Punch.Event:FireServer()
end
end})

local Tab = Window:MakeTab({
	Name = "Steal V2 V3",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

Tab:AddLabel("you can use skill until you die or leaving server!")

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal Bluelock - Find inf HP player",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol]["Blue Lock Characters"].Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal Aizen Fierce Battle",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol]["Aizen Fierce Battle"].Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal Sung Jin Woo V2",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol]["Sung Jin Woo: Shadow Monarch"].Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal Gojo V3",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol]["The Strongest Of Today"].Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal Cid V3",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol]["Cid True Power"].Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal Aizen TYBW",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol]["Aizen TYBW"].Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal Starrk",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol]["Coyote Starrk"].Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Steal KJ - Find 5k HP Player",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
workspace[lol].KJ.Script.Event:FireServer()
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local Tab = Window:MakeTab({
	Name = "V2, V3",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

Tab:AddLabel("V2 and V3 is boss drop Characters")

local Section = Tab:AddSection({Name = "Aizen Fierce Battle"})

Tab:AddButton({
 Name = "Hado 90 Kurohitsugi",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hado 90: Kurohitsugi"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hado 90 Kurohitsugi",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hado 90: Kurohitsugi"].LocalScript.full:FireServer()
end})

Tab:AddButton({
 Name = "Shatter Kyoka Suigetsu Full",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Shatter Kyoka Suigetsu"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Kanzen Saimin",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Kanzen Saimin"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Kanzen Saimin 2",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Kanzen Saimin"].LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = "Execution - One Shot",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Execution.LocalScript.Event:FireServer()
end})

Tab:AddToggle({
	Name = "Kill Aura",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(0.1)
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kanzen Saimin") then
game:GetService("Players").LocalPlayer.Backpack["Kanzen Saimin"].LocalScript.Event2:FireServer()
end
end
end})

Tab:AddToggle({
	Name = "Troll",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(1)
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Kanzen Saimin") then
game:GetService("Players").LocalPlayer.Backpack["Kanzen Saimin"].LocalScript.Event:FireServer()
end
end
end})

Tab:AddButton({
 Name = "Awake 1 - Hogyoku Fusion",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hogyoku Fusion"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Awake 2 - Chrysalis",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Chrysalis.LocalScript.Event1:FireServer()
end})

Tab:AddButton({
 Name = "Awake 3 - Butterfly",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Butterfly.LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = "Awake 4 - Monster",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Butterfly.LocalScript.Even3:FireServer()
end})

Tab:AddButton({
 Name = "Spiritual Pressure 2",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Spiritual Pressure"].LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = "Cero",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Cero.LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = "Ultimate Cero",
 Callback = function()
for i = 1, 9 do
game:GetService("Players").LocalPlayer.Backpack.Cero.LocalScript.Event2:FireServer()
end
end})

Tab:AddButton({
 Name = "Grab Cero",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Grab Cero"].LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = "Destruction Circle",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Destruction Circle"].LocalScript.Event3:FireServer()
end})

Tab:AddToggle({
	Name = "Kill Aura - for Monster mode",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(0.3)
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Destruction Circle") then
game:GetService("Players").LocalPlayer.Backpack["Destruction Circle"].LocalScript.Event3:FireServer()
end
end
end})

Tab:AddButton({
 Name = "Kyoka suigetsu",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Kyoka Suigetsu"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Kido combo",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Kido Combo"].LocalScript.Event3:FireServer()
end})

local Section = Tab:AddSection({Name = "Sung Jin Woo V2"})

Tab:AddButton({
 Name = "Kamish Dagger",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Kamish Dagger"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Slash Blitz",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Slash Blitz"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Impale Cuts",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Impale Cuts"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Head Slam",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Head Slam"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "One Punch",
 Callback = function()
for i = 1, 9 do
game:GetService("Players").LocalPlayer.Backpack["Head Slam"].LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Ruler's Authority",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Ruler's Authority"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hacker's Authority",
 Callback = function()
for i = 1, 7 do
game:GetService("Players").LocalPlayer.Backpack["Ruler's Authority"].LocalScript.Event:FireServer()
end
end})

Tab:AddToggle({
	Name = "Hacker aura",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(0.2)
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Ruler's Authority") then
game:GetService("Players").LocalPlayer.Backpack["Ruler's Authority"].LocalScript.Event:FireServer()
end
end
end})

Tab:AddButton({
 Name = "Dragon Fear",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Dragon Fear"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Shadow Monarch Slam",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Shadow Monarch Slam"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Arise",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Arise.LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Gojo V3"})

Tab:AddButton({
 Name = "Heavy Punch",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Heavy Punch"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = " Heavy punch Black Flash",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Heavy Punch"].LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = " Heavy punch Rush Punch",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Heavy Punch"].LocalScript.Event3:FireServer()
end})

Tab:AddButton({
 Name = " Heavy punch Rush Punch + Black Flash",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Heavy Punch"].LocalScript.Event3:FireServer()
end})

Tab:AddButton({
 Name = "Blue Pull",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Blue: Pull"].LocalScript.Event:FireServer()
end})

Tab:AddToggle({
	Name = "Ultra BOOM",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(0.1)
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Blue: Pull") then
game:GetService("Players").LocalPlayer.Backpack["Blue: Pull"].LocalScript.Event2:FireServer()
end
end
end})

Tab:AddButton({
 Name = "Blue Attract",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Blue: Attract"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Blue Ball",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Blue: Attract"].LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = "Reversal Red",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Reversal Red"].LocalScript.Event1:FireServer()
end})

Tab:AddButton({
 Name = "Reversal Red 2",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Reversal Red"].LocalScript.Event22:FireServer()
end})

Tab:AddButton({
 Name = "Red Push 2",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Red: Push"].LocalScript.Event2:FireServer()
end})

Tab:AddButton({
 Name = "Imaginary Technique Purple",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Imaginary Technique Purple"].murasaki.Event:FireServer()
end})

Tab:AddButton({
 Name = "Animated Imaginary Technique Purple",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Imaginary Technique Purple"].murasaki.Event1:FireServer()
end})

Tab:AddButton({
 Name = "Hollow Purple Nuke",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hollow Purple Nuke"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hollow Purple Nuke 2",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Hollow Purple Nuke"].LocalScript.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "Unlimited Void",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Unlimited Void"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Six Eyes - choose this for no cd skill",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Six Eyes"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Six Eyes 2",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Six Eyes"].LocalScript.Event2:FireServer()
end})

local Section = Tab:AddSection({Name = "Cid True Power V3 - NPC Drop"})

Tab:AddButton({
 Name = "Blade Master Technique",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Blade Master Technique"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Afterimage",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Afterimage.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Kill all",
 Callback = function()
local Players = game:GetService("Players")

local function teleportToPlayers(player)
for _, targetPlayer in pairs(Players:GetPlayers()) do
if targetPlayer ~= player then
player.Character:MoveTo(targetPlayer.Character.PrimaryPart.Position)
task.wait(0.2)
game:GetService("Players").LocalPlayer.Backpack.Afterimage.LocalScript.Event:FireServer()
game:GetService("Players").LocalPlayer.Backpack.Afterimage.LocalScript.Event:FireServer()
game:GetService("Players").LocalPlayer.Backpack.Afterimage.LocalScript.Event:FireServer()
game:GetService("Players").LocalPlayer.Backpack.Afterimage.LocalScript.Event:FireServer()
game:GetService("Players").LocalPlayer.Backpack.Afterimage.LocalScript.Event:FireServer()
game:GetService("Players").LocalPlayer.Backpack.Afterimage.LocalScript.Event:FireServer()
wait(1)
end
end
end

local localPlayer = Players.LocalPlayer
teleportToPlayers(localPlayer)
end})

Tab:AddButton({
 Name = "Birdcage - stun player",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Birdcage.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Gravitational Stomp",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Gravitational Stomp"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Overdrive",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Overdrive["Local Script"].Event:FireServer()
end})

Tab:AddButton({
 Name = "Recovery Atomic",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Recovery Atomic"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Shadow Rush Cut",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Shadow Rush Cut"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "All Range Atomic - You need to hold item",
 Callback = function()
game:GetService("ReplicatedStorage").CidKageeno.Atomicc2:FireServer()
end})

Tab:AddButton({
 Name = "Atomic Bomb",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Atomic Bomb"].LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Vergil V2 - NPC Drop"})

Tab:AddButton({
 Name = "Judgement Cut End",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Judgement Cut End"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Ultimate Judgement Cut",
 Callback = function()
for i = 1, 50 do
game:GetService("Players").LocalPlayer.Backpack["Judgement Cut"].LocalScript.Event:FireServer()
end
end}) 

local Section = Tab:AddSection({Name = "Aizen TYBW - NPC Drop"})

Tab:AddButton({
 Name = "Garganta",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Garganta.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Shatter",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Shatter.LocalScript.event:FireServer()
end})

Tab:AddButton({
 Name = "3x Reiatsu",
 Callback = function()
for i = 1, 3 do
game:GetService("Players").LocalPlayer.Backpack.Reiatsu.LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "2x Spiritual Pressure",
 Callback = function()
for i = 1, 2 do
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spiritual Pressure").LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "Normal Hado 90",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Had\197\141 90"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hado 90 Unstealed - Awaken",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Unstealed.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Dominate No Need Aizen v2",
 Callback = function()
game:GetService("ReplicatedStorage").Aizen.RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "Big Hado 90 - Awaken skill",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Had\197\141 90: Kurohitsugi").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Hado 99 Goryu Tenmetsu Tool - Awaken skill",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/aize"))()
end})

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Surprise Hado 99",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
loool = game:GetService("Players")[lol].Character.HumanoidRootPart.Position + Vector3.new(0, 0, 0)
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Had\197\141 99: Goryutenmetsu").LocalScript.Event:FireServer(loool)
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

Tab:AddButton({
 Name = "Divine judgment - New",
 Callback = function()
local Players = game:GetService("Players")

local function teleportToPlayers(player)
for _, targetPlayer in pairs(Players:GetPlayers()) do
if targetPlayer ~= player then
local loool = targetPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 0, 0)
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Had\197\141 99: Goryutenmetsu").LocalScript.Event:FireServer(loool)
end
end
end

local localPlayer = Players.LocalPlayer
teleportToPlayers(localPlayer)
end})

local Section = Tab:AddSection({Name = "Unleashed Starrk - Boss drop"})

Tab:AddButton({
 Name = "Awake - You have to wear shirts and pants in roblox avator",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Resurrecci\195\179n:  Los Lobos").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Colmilo",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Colmilo.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Divine Dogs",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Wolves["Divine Dogs"].RemoteEvent:FireServer()
end})

Tab:AddButton({
 Name = "Spinning Shots",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Spinning Shots").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Sonido Cero",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Sonido Cero").LocalScript.event:FireServer()
end})

Tab:AddButton({
 Name = "Right Gun",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Right Gun").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Cero Metralleta",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Cero Metralleta").LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Shadow V2 - Boss drop"})

Tab:AddButton({
 Name = "V2 Speed Blitz",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Speed Blitz"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "V2 OverDrive",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Overdrive["Local Script"].Event:FireServer()
end})

Tab:AddButton({
 Name = "V2 Recovery Atomic",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Recovery Atomic"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "V2 Atomic - You Need hold item",
 Callback = function()
game:GetService("ReplicatedStorage").AtomicFolder.gaydog:FireServer()
end})

Tab:AddButton({
 Name = "V2 All Range Atomic - You need hold item",
 Callback = function()
game:GetService("ReplicatedStorage").CidKageeno.Atomicc:FireServer()
end})

local Section = Tab:AddSection({Name = "Sukuna V2 - Boss drop"})

Tab:AddButton({
 Name = "100% v2 - Use this after you get Sukuna finger",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Sukuna Finger"].Script.Event:FireServer()
end})

Tab:AddButton({
 Name = "V2 Cleave",
 Callback = function()  
        for i = 1, 5 do
game:GetService("Players").LocalPlayer.Backpack.Cleave.LocalScript.Event:FireServer()
end
end})

Tab:AddButton({
 Name = "V2 Dismantle",
 Callback = function()      
game:GetService("Players").LocalPlayer.Backpack.Dismantle.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "V2 Death Rush Beatdown",
 Callback = function()
        for i = 1, 5 do
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Rush Beatdown").LocalScript.RemoteEvent:FireServer()
end
end})

Tab:AddButton({
 Name = "V2 World Slash",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("World Slash").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "V2 World slash Net",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Dismantle: Net").LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Normal Fuga",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Furnace.LocalScript.event:FireServer()
end})

Tab:AddButton({
 Name = "True Fuga",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Furnace.LocalScript.Event:FireServer()
end})

local Tab = Window:MakeTab({
	Name = "Move, TP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

Tab:AddToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(InfiniteJumpEnabled)
        local InfiniteJumpEnabled = true
        game:GetService("UserInputService").JumpRequest:connect(function()
            if InfiniteJumpEnabled then
                game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
            end
        end)
    end,})

Tab:AddSlider({
	Name = "Speed",
	Min = 16,
	Max = 250,
	Default = 16,
	Color = Color3.fromRGB(0,125,245),
	Increment = 1,
	ValueName = "Speed Power",
	Callback = function(v)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
end})

Tab:AddSlider({
	Name = "Jump",
	Min = 30,
	Max = 500,
	Default = 30,
	Color = Color3.fromRGB(0,199,42),
	Increment = 1,
	ValueName = "Jump Power",
	Callback = function(v)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
end})

Tab:AddButton({
 Name = "Sonido",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.sonido:FireServer()
end}) 

local Section = Tab:AddSection({Name = "Teleport"})

Tab:AddButton({
 Name = "TP to Normal world",
 Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3.6723702, 103.105331, -419.923584)
end}) 

Tab:AddButton({
 Name = "TP to Hueco mundo",
 Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40479.5039, 50.7923508, 1717.92053)
end}) 

Tab:AddButton({
 Name = "TP to Vergil NPC",
 Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31097.8438, 1377.82935, -13591.8994)
end}) 

Tab:AddButton({
 Name = "TP to Soccer world",
 Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.8644791, 490.387634, -12647.9004)
end}) 

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "TP to Player",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace[lol].HumanoidRootPart.CFrame
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local Section = Tab:AddSection({Name = "Kidnapping Player"})

local playerNametwo = nil
local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
    playerNames = {}
    for _, player in pairs(players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    if playerDropdown then
        playerDropdown:Refresh(playerNames, true)
    end
end

playerDropdown = Tab:AddDropdown({
        Name = "Kidnapping Player to You",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
playerNametwo = PlayerUsername
local gh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local ohInstance1 = workspace[playerNametwo]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(ohInstance1)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gh
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNametwo = nil
local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Kidnapping Player to Hueco mundo",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
            playerNametwo = PlayerUsername
            local gh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
       wait(0.1)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-40479.5039, 50.7923508, 1717.92053)
      wait(0.1)
local ohInstance1 = workspace[playerNametwo]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(ohInstance1)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gh
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNametwo = nil
local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Kidnapping Player to Vergil V2 NPC",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
playerNametwo = PlayerUsername
local gh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31097.8438, 1377.82935, -13591.8994)
wait(0.1)
local ohInstance1 = workspace[playerNametwo]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(ohInstance1)
task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gh
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNametwo = nil
local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Kidnapping Player to Prison Realm",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
playerNametwo = PlayerUsername
local gh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
wait(0.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-831, -40, -60)
wait(0.25)
local ohInstance1 = workspace[playerNametwo]["Torso"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(ohInstance1)
task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gh
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNametwo = nil
local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Kidnapping Player to Trash Can",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
            playerNametwo = PlayerUsername
            local gh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
       wait(0.1)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-416, 19.9, -308.5)
      wait(0.1)
local ohInstance1 = workspace[playerNametwo]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(ohInstance1)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gh
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local playerNametwo = nil
local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Kidnapping Player to Soccer",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
            playerNametwo = PlayerUsername
            local gh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
       wait(0.1)
     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99.8644791, 490.387634, -12647.9004)
      wait(0.1)
local ohInstance1 = workspace[playerNametwo]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(ohInstance1)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = gh
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

local Section = Tab:AddSection({Name = "Kidnapping NPC"})

Tab:AddButton({
 Name = "Kidnapping Anh Tài Say Xỉn NPC",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace.NPC["Anh T\195\160i Say X\225\187\137n"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end}) 

Tab:AddButton({
 Name = "Kidnapping Urahara Kisuke NPC",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace.NPC["Kisuke Urahara"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end}) 

Tab:AddButton({
 Name = "Kidnapping Weaknest Dummy",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace["Weakest Dummy"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end}) 

Tab:AddButton({
 Name = "Kidnapping Cid Kagenou Boss",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace["Cid Kagenou"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end}) 

Tab:AddButton({
 Name = "Kidnapping Coyote Starrk Boss",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace["Coyote Starrk"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end}) 

Tab:AddButton({
 Name = "Kidnapping Aizen Sosuke NPC",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace["Aizen Sosuke"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end}) 

Tab:AddButton({
 Name = "Kidnapping Gojo Satoru Boss",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace["Gojo Satoru"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end}) 

Tab:AddButton({
 Name = "Kidnapping Ryomen Sukuna Boss",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local npclol = workspace["Ryomen Sukuna"]["Left Leg"]
game:GetService("ReplicatedStorage").Remote.BoogieWoogie:FireServer(npclol)
  task.wait(0.95)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = omgohh
end})

local Tab = Window:MakeTab({
	Name = "Option:killaura",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

Tab:AddButton({
 Name = "Hold all inventory tools",
 Callback = function()
        for _, tool in ipairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
     if tool:IsA("Tool") then
          tool.Parent = game:GetService("Players").LocalPlayer.Character
     end
 end
end}) 

Tab:AddToggle({
 Name = "Always show Characters",
 Default = false,
 Callback = function(Value)
        local player = game.Players.LocalPlayer
local playerGui = player.PlayerGui
neko = Value
while neko do
  task.wait()
local selectionGui = playerGui:FindFirstChild("SelectionGui")
if selectionGui and selectionGui.Enabled == false then
  selectionGui.Enabled = true
  print("I am lazy")
 end
end
end}) 

Tab:AddButton({
 Name = "Delete all Inventory tools",
 Callback = function()
        local Player = game:GetService("Players").LocalPlayer
local Backpack = Player.Backpack
local Character = Player.Character

for _,v in pairs(Backpack:GetChildren()) do
   if v:IsA("Tool") or v:IsA("HopperBin") then
       v:Destroy()
   end
end

for _,v in pairs(Character:GetChildren()) do
   if v:IsA("Tool") or v:IsA("HopperBin") then
       v:Destroy()
   end 
end
end}) 

local Section = Tab:AddSection({Name = "Kill Aura"})

Tab:AddToggle({
	Name = "Sukuna Killaura",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(0.4)
game:GetService("ReplicatedStorage").Remotes.colovo:FireServer()  
end
end})

Tab:AddToggle({
	Name = "Sukuna Killaura 2",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(0.3)
game:GetService("ReplicatedStorage").sukuna.remotes.dismantle:FireServer() 
end
end})

Tab:AddButton({
 Name = "Get Awaken Toji",
 Callback = function()
local args = {
    [1] = "Toji Fushiguro"
}

game:GetService("ReplicatedStorage"):WaitForChild("Picked"):FireServer(unpack(args))
wait(1)
game:GetService("Players").LocalPlayer.Backpack["Inverted Spear Of Heaven"].Script.Event:FireServer()
end}) 

Tab:AddToggle({
	Name = "Toji Annoying KillAura - Amanai!",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(1)
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Wrong Way") then
game:GetService("Players").LocalPlayer.Backpack["Wrong Way"].Main.Event:FireServer()
end
end
end})

local Tab = Window:MakeTab({
	Name = "Nuke",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

Tab:AddButton({
 Name = "NUKE and Kill Aura script",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/2nd%20Latest"))()
end}) 

local Tab = Window:MakeTab({
	Name = "Special",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

local Section = Tab:AddSection({Name = "GOD MODE"})

Tab:AddButton({
 Name = "GOD MODE - Use Meow",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/Meow"))()
end}) 

local Section = Tab:AddSection({Name = "Jun"})

Tab:AddButton({
 Name = "No More Games - Owner Move - bugging",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/JN"))()
end}) 

local playerNames = {}
local playerDropdown
local players = game:GetService("Players")

local function updatePlayerNames()
playerNames = {}
for _, player in pairs(players:GetPlayers()) do
table.insert(playerNames, player.Name)
end
if playerDropdown then
playerDropdown:Refresh(playerNames, true)
end
end

playerDropdown = Tab:AddDropdown({
        Name = "Surprise No More Games",
        Default = "Select player",
        Options = playerNames,
        Callback = function(PlayerUsername)
lol = PlayerUsername
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/JN"))()
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace[lol].HumanoidRootPart.CFrame
end})

updatePlayerNames()

players.PlayerAdded:Connect(
function(player)
updatePlayerNames()
end)

players.PlayerRemoving:Connect(
function(player)
updatePlayerNames()
end)

Tab:AddButton({
 Name = "Kill all with No More Games",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/JN%20all"))()
end}) 

local Section = Tab:AddSection({Name = "Megumin"})

Tab:AddButton({
 Name = "Megumin - dont use its bugging",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/Explo"))()
end}) 

local Section = Tab:AddSection({Name = "KJ"})

Tab:AddButton({
 Name = "KJ Collaretal Ruin - Admin Move",
 Callback = function()
game:GetService("ReplicatedStorage").Kj.Remotes["Collaretal Ruin"]:FireServer()
end}) 

Tab:AddButton({
 Name = "Grab KJ DropKick - Admin Move",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Skill.KJ.Dropkick:FireServer()
end}) 

Tab:AddButton({
 Name = "Dash KJ DropKick - Admin Move",
 Callback = function()
game:GetService("ReplicatedStorage").KJ.Remote.DropKick2:FireServer()
end}) 

Tab:AddButton({
 Name = "KJ 5 Season - Admin move",
 Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IFeelPower/Battle/refs/heads/main/KoJ"))()
end}) 

Tab:AddButton({
 Name = "KJ Unlimited Flex Works - Admin Move",
 Callback = function()
game:GetService("ReplicatedStorage").Assets.Resources.UFW.Use:FireServer()
end}) 

Tab:AddButton({
 Name = "KJ effect - Admin Move",
 Callback = function()
local args = {
    [1] = "UFW Final Punch"
}

game:GetService("ReplicatedStorage").Assets.Resources.UFW.UseSkill:FireServer(unpack(args))
end}) 

local Section = Tab:AddSection({Name = "Hakari"})

Tab:AddButton({
 Name = "Old Hakari Domain",
 Callback = function()
game:GetService("ReplicatedStorage").Domainthing:FireServer()
end}) 

Tab:AddButton({
 Name = "100% Win Hakari Domain",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.IdleDeathGamble:FireServer()
end}) 

Tab:AddButton({
 Name = "Death Ball Tool",
 Callback = function()
local tool = Instance.new("Tool")
tool.Name = "Death Ball"
tool.RequiresHandle = false
tool.ToolTip = "Gambling!"
tool.Activated:Connect(function()

for i = 1, 10 do
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local targetPosition = mouse.Hit.Position
local ohCFrame1 = CFrame.new(targetPosition)
local ohVector32 = Vector3.new(targetPosition.X, targetPosition.Y, targetPosition.Z)

game:GetService("ReplicatedStorage").Remotes.PachinkoBall:FireServer(ohCFrame1, ohVector32)
end
end)

tool.Parent = game.Players.LocalPlayer.Backpack
end}) 

Tab:AddButton({
 Name = "Go/jo Cut",
 Callback = function()
for i = 1, 10 do
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ShutterDoors"):FireServer()
end
end}) 

Tab:AddButton({
 Name = "Hakari Container",
 Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ContainerKick"):FireServer()
end}) 

local Section = Tab:AddSection({Name = "Sukuna"})

Tab:AddButton({
 Name = "Death Sukuna Rush",
 Callback = function()
for i = 1, 7 do
game:GetService("ReplicatedStorage").sukuna.remotes.rush:FireServer()
end
end}) 

Tab:AddButton({
 Name = "Sukuna Dismantle",
 Callback = function()
for i = 1, 5 do
game:GetService("ReplicatedStorage").sukuna.remotes.dismantle:FireServer()
end
end}) 

Tab:AddButton({
 Name = "Colovo - Sukuna domain slash",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.colovo:FireServer()
end}) 

Tab:AddButton({
 Name = "Small Malevolent Shrine",
 Callback = function()
game:GetService("ReplicatedStorage").RyomenSukuna.MalevolentShrine.Gaymalev:FireServer()
end}) 

Tab:AddButton({
 Name = "Big Malevolent Shrine",
 Callback = function()
game:GetService("ReplicatedStorage").Events.shrine:FireServer()
end}) 

Tab:AddButton({
 Name = "Small Malevolent Shrine 2",
 Callback = function()
game:GetService("ReplicatedStorage").Events.MalevolentShrine5:FireServer()
end}) 

Tab:AddButton({
 Name = "Pay to win Malevolent Shrine",
 Callback = function()
game:GetService("ReplicatedStorage").Events.Malclash:FireServer()
end}) 

Tab:AddButton({
 Name = "Reverse Cursed Technique - You need this item",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Reverse Cursed Technique"].Script.Event:FireServer()
end}) 

local Section = Tab:AddSection({Name = "Okkotsu"})

Tab:AddButton({
 Name = "Okkotsu Domain",
 Callback = function()
game:GetService("ReplicatedStorage").Yuta.ytd:FireServer()
end}) 

Tab:AddButton({
 Name = "Pure Love",
 Callback = function()
game:GetService("ReplicatedStorage").Yuta.love:FireServer()
end}) 

local Section = Tab:AddSection({Name = "Cid"})

Tab:AddButton({
 Name = "Imminet Blink",
 Callback = function()
game:GetService("ReplicatedStorage").CidKageeno.Blinkk:FireServer()
end})

local Section = Tab:AddSection({Name = "Gojo"})

Tab:AddButton({
Name = "Gojo Rush",
 Callback = function()
game:GetService("ReplicatedStorage").GojoSatoru.rush:FireServer()
end})

Tab:AddButton({
 Name = "Hora Hora - Counter skill",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.HoraHora:FireServer()
end}) 

Tab:AddButton({
 Name = "Max Blue",
 Callback = function()
game:GetService("ReplicatedStorage").GojoV3.maxblue:FireServer()
end}) 

Tab:AddButton({
 Name = "Max Red",
 Callback = function()
game:GetService("ReplicatedStorage").GojoV3.maxred:FireServer()
end}) 

Tab:AddButton({
 Name = "Purple Shot",
 Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Purple"):FireServer()
end}) 

Tab:AddButton({
 Name = "200% Purple Shot",
 Callback = function()
game:GetService("ReplicatedStorage").GojoV3.haitram:FireServer()
end}) 

Tab:AddButton({
 Name = "Nuke Purple",
 Callback = function()
local ohString1 = "FinalHollowPurple"
game:GetService("ReplicatedStorage").Events.Abilitys.Gojo:FireServer(ohString1) 
end}) 

Tab:AddButton({
 Name = "Unleashed Gojo Nuke",
 Callback = function()
game:GetService("ReplicatedStorage").GojoV3.nuke:FireServer() 
end}) 

Tab:AddButton({
 Name = "0.2 Domain",
 Callback = function()
game:GetService("ReplicatedStorage").Events["UnlimitedVoid0.2"]:FireServer()
end}) 

Tab:AddButton({
 Name = "0.2 Domain - Pay to Win",
 Callback = function()
game:GetService("ReplicatedStorage").Events["Domain0.2"]:FireServer()
end}) 

Tab:AddButton({
 Name = "Unlimited Void",
 Callback = function()
game:GetService("ReplicatedStorage").Events.UnlimitedVoid:FireServer()
end}) 

Tab:AddButton({
 Name = "Unlimited Void - Pay to win",
 Callback = function()
game:GetService("ReplicatedStorage").Gogay:FireServer()
end}) 

Tab:AddButton({
 Name = "Blue Pull - Pay to win",
 Callback = function()
            local ohTable1 = {
    ["Function"] = "Fire",
    ["Name"] = "BlueMo",
    ["rootpos"] = CFrame.new(39.0846443, 19.8230076, -162.294754, -0.0822739899, 3.01816527e-08, 0.996609747, -4.96030914e-08, 1, -3.43792514e-08, -0.996609747, -5.22634416e-08, -0.0822739899)
}
game:GetService("ReplicatedStorage").Server:InvokeServer(ohTable1)
end}) 

local Section = Tab:AddSection({Name = "Others"})

Tab:AddButton({
 Name = "Mahito Domain",
 Callback = function()
game:GetService("ReplicatedStorage").MahitoDomainExpansion.MahitoDomainEvent:FireServer()
end}) 

Tab:AddButton({
 Name = "Prison Realm - 35 sec CD",
 Callback = function()
local omgohh = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
local args = {
    [1] = {
        ["Function"] = "Fire",
        ["rootcf"] = omgohh,
        ["Name"] = "PrisonRealm"
    }
}

game:GetService("ReplicatedStorage").Server:InvokeServer(unpack(args))
end}) 

local Section = Tab:AddSection({Name = "Hacker"})

Tab:AddButton({
 Name = "Random Rush Punch",
 Callback = function()
        for i = 1, 5 do
game:GetService("ReplicatedStorage").Remotes.Punches:FireServer()
end
end}) 

local Section = Tab:AddSection({Name = "Mugetsu"})

Tab:AddButton({
 Name = "Add Mugetsu to inventory",
 Callback = function()
local bruh = "Kurosaki Ichigo"
game:GetService("ReplicatedStorage").Picked:FireServer(bruh)
wait(1)
game:GetService("Players").LocalPlayer.Backpack["Final Getsuga Tensho"].LocalScript.Event:FireServer()
end}) 

Tab:AddButton({
 Name = "Use Mugetsu",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Mugetsu.LocalScript.Event:FireServer()
end}) 

local Tab = Window:MakeTab({
	Name = "Auto Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

local Section = Tab:AddSection({Name = "How to get Cid V3"})
Tab:AddLabel("1. Use Unleashed V2 Cid First")
Tab:AddLabel("2. Get 'Cid sword' from Cid Machine - 11% Rate")
Tab:AddLabel("3. Give 'Cid Sword' to Anh NPC")
Tab:AddLabel("4. Anh NPC will give u 'atomic energy' - 25% Rate")
Tab:AddLabel("5. use atomic energy on cid v2")

local Section = Tab:AddSection({Name = "Teleport"})

Tab:AddToggle({
	Name = "Auto TP to Jack Picture",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(1)
if workspace:FindFirstChild("jack5trvillaitem") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.jack5trvillaitem.CFrame + Vector3.new(0, 3, 0)
end
end
end})

Tab:AddButton({
 Name = "TP to Cid Machine",
 Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.665634, 18.8472042, -460.235992)
end})

Tab:AddButton({
 Name = "TP to Anh Tài Say Xỉn NPC",
 Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPC["Anh T\195\160i Say X\225\187\137n"].HumanoidRootPart.CFrame
end})

local Section = Tab:AddSection({Name = "How to get Gojo V3"})
Tab:AddLabel("1. Use Unleashed V2 Gojo First")
Tab:AddLabel("2. Get blue and red orb - 25 min spawn 50% and 25% rate")
Tab:AddLabel("3. Give 2 orbs to Gojo NPC")
Tab:AddLabel("4. NPC will give you Purple Orb")
Tab:AddLabel("5. use Purple Orb on Gojo v2")

local Section = Tab:AddSection({Name = "Teleport"})

Tab:AddButton({
 Name = "TP to Gojo The Strongest",
 Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPC["Gojo The Strongest"]["Left Arm"].Container.CFrame
end})

Tab:AddToggle({
	Name = "Auto TP to Red Orb",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(1)
if workspace.NPC:FindFirstChild("Red") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPC.Red.CFrame + Vector3.new(0, 3, 0)
end
end
end})

Tab:AddToggle({
	Name = "Auto TP to Blue Orb",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(1)
if workspace.NPC:FindFirstChild("Blue") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.NPC.Blue.CFrame + Vector3.new(0, 3, 0)
end
end
end})
