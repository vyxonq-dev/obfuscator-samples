local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CeleryHub/Shlexware-s-Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Lazy Script V2 - Gojo vs Toji", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "Are You Lazy?", IntroIcon = "rbxassetid://16336200609"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

local Section = Tab:AddSection({Name = "Gojo"})

Tab:AddButton({
 Name = "Honored One",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Honored One"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Honored One 2",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Honored One"].LocalScript.EventVariant:FireServer()
   end    
})

Tab:AddButton({
 Name = "Black Flash",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Black Flash"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Six Eyes",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Six Eyes"]["Awakening : Serious Mode"].Event:FireServer()
   end    
})

local Section = Tab:AddSection({Name = "Gojo Shibuya Version"})

Tab:AddButton({
 Name = "Infinity Wall Crash",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Infinity.LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Rush",
    Callback = function()
    game:GetService("ReplicatedStorage").KJ.Remote.Rushh:FireServer()
   end    
})

Tab:AddButton({
 Name = "Unlimited Void 0.2",
    Callback = function()
    game:GetService("ReplicatedStorage").Events["UnlimitedVoid0.2"]:FireServer()
   end    
})

local Section = Tab:AddSection({Name = "Gojo vs Sukuna Version"})

Tab:AddButton({
 Name = "Maximum Blue",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Maximum: Blue"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Maximum Red",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Maximum: Red"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Hollow Purple Shot",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Hollow Purple"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Hollow Purple Nuke",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Hollow Purple"].LocalScript.EventVariant:FireServer()
   end    
})

local Section = Tab:AddSection({Name = "Toji"})

Tab:AddButton({
 Name = "Rapid Shot",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Rapid Shot"]["Rapid Shot"].Shot:FireServer()
   end    
})

Tab:AddButton({
 Name = "Shadow Step",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Shadow Step"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Throughout Earth",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Throughout Earth"]["Throughout Earth"].Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Will I Lose? - Awakening",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Will I Lose?"]["Awakening : Serious Mode"].Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Little Hand",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Little Hand"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Wrong Way",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Wrong Way"].LocalScript.Event:FireServer()
   end    
})

local Section = Tab:AddSection({Name = "Itadori Sukuna"})

Tab:AddButton({
 Name = "Skull Crusher",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Skull Crusher"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Divergent Fist",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Divergent Fist"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
Name = "Kick Blackflash",
Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Kick Blackflash"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "King Of Curses - Awakening",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["King Of Curses"]["Awakening : Serious Mode"].Event:FireServer()
end})

Tab:AddButton({
 Name = "Cleave Barrage",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Cleave Barrage"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Open",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack.Open.LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "World Cutting Slash",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["World Cutting Slash"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Malevolent Shrine",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Malevolent Shrine"].LocalScript.Event:FireServer()
end})

local Section = Tab:AddSection({Name = "Hakari Real Gamble"})

Tab:AddButton({
 Name = "Fortune Flare",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Fortune Flare"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Idle Death Gamble - No animation lol",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Idle Death Gamble"]["Awakening : Serious Mode"].Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Rhythm",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Rhythm.LocalScript.Event:FireServer()
   end    
})

local Section = Tab:AddSection({Name = "Yuta"})

Tab:AddButton({
 Name = "Cursed Slashes",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Cursed Slashes"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Cursed Speech",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Cursed Speech"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Love - Awakening",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Love["Awakening : Serious Mode"].Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "BlackFlash",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.BlackFlash.LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Rika Slash",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Rika Slash"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Pure Love",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Pure Love"].LocalScript.Event:FireServer()
   end    
})

local Section = Tab:AddSection({Name = "Megumi"})

Tab:AddButton({
 Name = "Divine Dog",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Divine Dog"].LocalScript.RemoteEvent:FireServer()
   end    
})

Tab:AddButton({
 Name = "Shadow Swarm",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Shadow Swarm"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Insanity - Awakening",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Insanity["Awakening : Serious Mode"].Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Max Elephant",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Max Elephant"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Chimera Shadow Garden",
    Callback = function()
    game:GetService("ReplicatedStorage").Events.ShadowGarden:FireServer()
   end    
})

Tab:AddButton({
 Name = "Takedown - Mahoraga Skill",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Takedown.LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Earthquake - Mahoraga Skill",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Earthquake.LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "World Cutting Slash - Mahoraga Skill",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["World Cutting Slash"].LocalScript.Event:FireServer()
   end    
})

local Section = Tab:AddSection({Name = "Mahito"})

Tab:AddButton({
 Name = "Soul Bend",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Soul Bend"].Move.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Soul Fire",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Soul Fire"]["Rapid Shot"].Shot:FireServer()
   end    
})

Tab:AddToggle({
	Name = "Mahito KillAura - OP",
	Default = false,
	Callback = function(Value)
lol = Value 
while lol do
wait(0.2)
if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Soul Fire") then
game:GetService("Players").LocalPlayer.Backpack["Soul Fire"]["Rapid Shot"].Shot:FireServer()
end
end
end})

Tab:AddButton({
 Name = "Soul Impale",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Soul Impale"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Inspiration - Awakening",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Inspiration["Awakening : Serious Mode"].Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Idle Transfiguration",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Idle Transfiguration"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Widespread Strikes",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Widespread Strikes"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "Spin Aura",
 Callback = function()
        while true do
  wait(0.2)
game:GetService("Players").LocalPlayer.Backpack["Widespread Strikes"].LocalScript.Event:FireServer()
end
   end    
})

local Section = Tab:AddSection({Name = "KJ"})

Tab:AddButton({
 Name = "Ravage",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack.Ravage.LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Swift Sweep",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Swift Sweep"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Collateral Ruin",
 Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Collateral Ruin"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "20 Series awake V1",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["20 Series"].Rush.Event:FireServer()
   end})

Tab:AddButton({
 Name = "20 Series awake V2",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["20 Series"].Rush.Event2:FireServer()
   end})

Tab:AddButton({
 Name = "Stoic Bomb",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Stoic Bomb"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Unlimited Flex Works",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Unlimited Flex Works"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "5 Season",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Unlimited Flex Works"].LocalScript.EventVariant:FireServer()
   end})

local Section = Tab:AddSection({Name = "JUN"})

Tab:AddButton({
 Name = "Fang Dance",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Fang Dance"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Glimpse Of Power",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Glimpse Of Power"].LocalScript.Event:FireServer()
   end})

Tab:AddButton({
 Name = "Virgule Cascade",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["Virgule Cascade"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "No More Games",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["No More Games"]["Awakening : Serious Mode"].Event:FireServer()
end})

Tab:AddButton({
 Name = "Savage Fangs",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Savage Fangs"].LocalScript.Event:FireServer()
   end    
})

Tab:AddButton({
 Name = "One Inch Killer Punch",
    Callback = function()
    game:GetService("Players").LocalPlayer.Backpack["One Inch Killer Punch"].LocalScript.Event:FireServer()
end})

Tab:AddButton({
 Name = "Phantom Sever",
    Callback = function()
game:GetService("Players").LocalPlayer.Backpack["Phantom Sever"].LocalScript.Event:FireServer()
end})

local Tab = Window:MakeTab({
	Name = "Move",
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

local Tab = Window:MakeTab({
	Name = "Option",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

local Tab = Window:MakeTab({
	Name = "Special",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

local Section = Tab:AddSection({Name = "No Need to choose character"})
 
Tab:AddButton({
 Name = "100% Win Gamble",
    Callback = function()
    game:GetService("ReplicatedStorage").Events.IdleDeathGamble:FireServer()
   end})

Tab:AddButton({
 Name = "SelfEmbodiment Of Perfection - Mahito Domain",
    Callback = function()
    game:GetService("ReplicatedStorage").Events.SelfEmbodimentOfPerfection:FireServer()
   end})

Tab:AddButton({
 Name = "Unlimited Void - Gojo Domain",
    Callback = function()
    game:GetService("ReplicatedStorage").Events.UnlimitedVoid:FireServer():FireServer()
   end})

Tab:AddButton({
 Name = "Unlimited Void 0.2",
    Callback = function()
    game:GetService("ReplicatedStorage").Events["UnlimitedVoid0.2"]:FireServer()
   end})

Tab:AddButton({
 Name = "KJ DropKick",
    Callback = function()
    game:GetService("ReplicatedStorage").KJ.Remote.DropKick:FireServer()
   end})

Tab:AddButton({
 Name = "KJ DropKick 2",
    Callback = function()
    game:GetService("ReplicatedStorage").KJ.Remote.DropKick2:FireServer()
   end})

Tab:AddButton({
 Name = "KJ Freeze Bomb lol",
    Callback = function()
    game:GetService("ReplicatedStorage").KJ.Remote.Stoic:FireServer()
   end})

Tab:AddButton({
 Name = "KJ Kick",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.BanishPath:FireServer()
   end})

Tab:AddButton({
 Name = "Fire Arrow",
    Callback = function()
game:GetService("ReplicatedStorage"):FindFirstChild("Assets").Remtoes.Fire:FireServer()
   end})

Tab:AddButton({
 Name = "Beatdown",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Beatdown:FireServer()
   end})

Tab:AddButton({
 Name = "Blue",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Blue:FireServer()
   end})

Tab:AddButton({
 Name = "Blue2",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Blue2:FireServer()
   end})

Tab:AddButton({
 Name = "Red",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Red:FireServer()
   end})

Tab:AddButton({
 Name = "Red 2",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Red2:FireServer()
   end})

Tab:AddButton({
 Name = "Container",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Container:FireServer()
   end})

Tab:AddButton({
 Name = "Container Kick",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.ContainerKick:FireServer()
   end})

Tab:AddButton({
 Name = "Toji Slash",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.DomainSlashes:FireServer()
   end})

Tab:AddButton({
 Name = "Toji Slash 2",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.PlayfulCloud:FireServer()
   end})

Tab:AddButton({
 Name = "HoraHora",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.HoraHora:FireServer()
   end})

Tab:AddButton({
 Name = "Gomen Amanai Imaginary Purple",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.ImaginaryPurple:FireServer()
   end})

Tab:AddButton({
 Name = "Lucky Beatdown",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.LuckyBeatdown:FireServer()
   end})

Tab:AddButton({
 Name = "Pachinko",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Pachinko:FireServer()
   end})

Tab:AddButton({
 Name = "Pachinko Ball",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.PachinkoBall:FireServer()
   end})

Tab:AddButton({
 Name = "Purple",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Purple:FireServer()
   end})

Tab:AddButton({
 Name = "Shutter Doors",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.ShutterDoors:FireServer()
   end})

Tab:AddButton({
 Name = "Vanish",
    Callback = function()
    game:GetService("ReplicatedStorage").Remotes.Vanish:FireServer()
   end})

local Tab = Window:MakeTab({
	Name = "??",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

Tab:AddButton({
 Name = "Go/jo",
 Callback = function()
for i = 1, 10 do
game:GetService("ReplicatedStorage").Remotes.ShutterDoors:FireServer()
end
end})
