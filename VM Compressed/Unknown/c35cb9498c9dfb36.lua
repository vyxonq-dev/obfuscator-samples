local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/CeleryHub/Shlexware-s-Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Lazy Script - Gojo vs Sukuna", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest", IntroText = "Are You Lazy?", IntroIcon = "rbxassetid://16336200609"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false})

local Section = Tab:AddSection({Name = "The Strongest - Gojo"})

Tab:AddButton({
 Name = "Reverse Cursed Technique - Awake",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.ReversedCursedTechnique:FireServer()
end}) 

Tab:AddButton({
 Name = "Hollow Purple",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Purple:FireServer()
end}) 

Tab:AddButton({
 Name = "Imaginary Purple:",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.ImaginaryPurple:FireServer()
end}) 

Tab:AddButton({
 Name = "Reverse Cursed Technique - Heal",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Heal:FireServer()
end}) 

Tab:AddButton({
 Name = "BlackFlash",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.BlackFlash:FireServer()
end}) 

Tab:AddButton({
 Name = "Unlimited Void",
 Callback = function()
game:GetService("ReplicatedStorage").Events.UnlimitedVoid:FireServer()
end}) 

local Section = Tab:AddSection({Name = "The Vessel - Sukuna"})

Tab:AddButton({
 Name = "CursedBarrage",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Yuji.CursedBarrage:FireServer()
end}) 

Tab:AddButton({
 Name = "DivergentFist",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Ywuji.DivergentFist:FireServer()
end}) 

Tab:AddButton({
 Name = "SlaughterDemon",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Yuji.SlaughterDemon:FireServer()
end}) 

Tab:AddButton({
 Name = "ManjiKick",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Yuji.ManjiKick:FireServer()
end}) 

Tab:AddButton({
 Name = "King of Cursed - Awake",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Sukuna.KingofCurses:FireServer()
end}) 

Tab:AddButton({
 Name = "Dismantle",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Sukuna.Dismantle:FireServer()
end}) 

Tab:AddButton({
 Name = "Triple Dissect",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Sukuna.TripleSlice:FireServer()
end}) 

Tab:AddButton({
 Name = "Fire Arrow",
 Callback = function()
game:GetService("ReplicatedStorage").Assets.Remtoes.Fire:FireServer()
end}) 

Tab:AddButton({
 Name = "MalevolentShrine",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Sukuna.MalevolentShrine:FireServer()
end}) 

Tab:AddButton({
 Name = "Reverse Cursed Technique",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.RedHeal:FireServer()
end}) 

local Section = Tab:AddSection({Name = "Luckyiest One - Hakari"})

Tab:AddButton({
 Name = "Lucky Beatdown",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.LuckyBeatdown:FireServer()
end}) 

Tab:AddButton({
 Name = "Pachinko Ball",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.PachinkoBall:FireServer()
end}) 

Tab:AddButton({
 Name = "Shutter Doors",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.ShutterDoors:FireServer()
end}) 

Tab:AddButton({
 Name = "Go/jo Shutter",
 Callback = function()  
for i = 1, 14 do
game:GetService("ReplicatedStorage").Remotes.ShutterDoors:FireServer()
end
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
 Name = "Idle Death Gamble",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.IdleDeathGamble:FireServer()
end}) 

local Section = Tab:AddSection({Name = "Cursed Child - Okkotsu"})

Tab:AddButton({
 Name = "Cursed Repair",
 Callback = function()
game:GetService("ReplicatedStorage").Remotes.Yuta["Cursed Repair"]:FireServer()
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
