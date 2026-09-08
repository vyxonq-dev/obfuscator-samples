local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local Window = Library.CreateLib("OxyHub V2", "Midnight")
local Tab = Window:NewTab("Abilities (spamable)")
local Section = Tab:NewSection("Kj")
Section:NewButton("Ravage", "ButtonInfo", function()
game:GetService("Players").LocalPlayer.Backpack.Ravage.LocalScript.Event:FireServer()
    print("Clicked")
end)
Section:NewButton("Swift Sweep", "ButtonInfo", function()
game:GetService("ReplicatedStorage").KJSwift.Remotes1:FindFirstChild("Sweep Swift"):FireServer()
    print("Clicked")
end)
Section:NewButton("Corrateral Ruin", "ButtonInfo", function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Collateral Ruin").LocalScript.Event:FireServer()
    print("Clicked")
end)
Section:NewButton("Stoic Bomb", "ButtonInfo", function()
game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Stoic Bomb").LocalScript.Event:FireServer()
    print("Clicked")
end)
Section:NewButton("20-20-20 dropkick", "ButtonInfo", function()
game:GetService("ReplicatedStorage").KJ2.Remote.DropKick:FireServer()
    print("Clicked")
end)
Section:NewButton("Five Seasons", "ButtonInfo", function()
local args = {
    [1] = "Ability",
    [2] = "Season",
    [3] = {
        ["char"] = game:GetService("Players").LocalPlayer.Character,
        ["player"] = game:GetService("Players").LocalPlayer,
        ["root"] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        ["hum"] = game:GetService("Players").LocalPlayer.Character.Humanoid
    }
}

game:GetService("ReplicatedStorage").Server:InvokeServer(unpack(args))
    print("Clicked")
end)
local Tab = Window:NewTab("Ultimate")
local Section = Tab:NewSection("Ultimates")
Section:NewButton("Awakening(Kj)", "ButtonInfo", function()
local args = {
    [1] = "KJUltamite"
}

game:GetService("ReplicatedStorage").Events.ChangeChar:FireServer(unpack(args))
    print("Clicked")
end)