--[[
Make sure to read the license to know your rights with the source code!


]]



wait(1)




getgenv().Frosties = false
local frostiesversion = " v1.0"
local rstorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local Fluent1 = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
getgenv().Frosties = true

local Window1 = Fluent1:CreateWindow({
    Title = "Frosties"..frostiesversion,
    SubTitle = "discord.gg/XUUjpeyc3S",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs1 = {
    Main = Window1:AddTab({ Title = "Main", Icon = "" }),
}


Tabs1.Main:AddParagraph({
    Title = "Key System",
    Content = "Sorry for making you go through the key system\nI just want all users to be in the discord\nsorry... get the key here\ndiscord.gg/XUUjpeyc3S link is already set to \nyour clipboard!"
})
setclipboard("discord.gg/XUUjpeyc3S")
Window1:SelectTab(1)
local Input = Tabs1.Main:AddInput("Input", {
    Title = "Insert Key Here",
    Default = "",
    Placeholder = "Placeholder",
    Numeric = false, -- Only allows numbers
    Finished = false, -- Only calls callback when you press enter
    Callback = function(Value)
        if tostring(Value) == "FrostiesOnTop" then
            writefile("frostieskey.txt", "FrostiesOnTop")
            getgenv().Frosties = true
        end
    end
})

repeat task.wait() until getgenv().Frosties == true
print("Correct Key!")
Window1:Destroy()

local Window = Fluent:CreateWindow({
    Title = "Frosties"..frostiesversion,
    SubTitle = "discord.gg/XUUjpeyc3S",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
    Credits = Window:AddTab({Title = "Credits", Icon = ""})
}
Window:SelectTab(1)
local Farm = Tabs.Main:AddSection("[Auto Farm]")
local Creds = Tabs.Credits:AddSection("[Credits]")
local function tpabove()
    local path = rstorage.Assets.Temp.ViewModels:GetChildren()
        local fightingplayers = {}

        for _, model in ipairs(path) do
            local fplayername = model.Name:gsub(" - .*", "")
            if fplayername ~= localPlayer.Name and not table.find(fightingplayers, fplayername) then
                table.insert(fightingplayers, fplayername)
            end
        end

        if #fightingplayers > 0 then
            local DuelingPlayer = fightingplayers[1]
            print("You are fighting with:", DuelingPlayer)

            local targetPlayer = players:FindFirstChild(DuelingPlayer)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local HRP = localPlayer.Character:FindFirstChild("HumanoidRootPart")
                if HRP then
                    while true do
                        local EnemyHRP = targetPlayer.Character.HumanoidRootPart
                        if EnemyHRP and targetPlayer.Character:WaitForChild('Humanoid').Health > 0 then
                            local newpos = EnemyHRP.Position + Vector3.new(0, 6, 0)
                            local newcframe = CFrame.new(newpos) * CFrame.Angles(math.rad(90), 0, 0)
                            HRP.CFrame = newcframe
                            wait(0.01)
                        else
                            print("Player Dead")
                            break
                        end
                    end
                else
                    print("Local players HumanoidRootPart not found")
                end
            else
                print("Not found?")
            end
        else
            print("No dueling players found.")
        end
end

Farm:AddParagraph({
    Title = "NOTE:",
    Content = "This only works in 1v1's or 1v1v1's.\n V1.1 Will allow greater duels.\n ALSO YOU WILL PROBABLY GET BANNED\n USE THIS ON A DUMMY ACCOUNT!"
});


local Keybind = Farm:AddKeybind("Keybind", {
    Title = "KeyBind to tp behind enemy",
    Mode = "Toggle",
    Default = "O",
    Callback = function()
        tpabove()
    end;
})

local TeleportButton = Farm:AddButton({
    Title = "Teleport Behind Enemy", 
    Description = "This will constantly teleport you behind the enemy, make sure to be fast and kill them. Before they kill you.",
    Callback = function()
        tpabove()
    end
})

local TeleportButton = Farm:AddButton({
    Title = "ESP", 
    Description = "This lets you see all players.",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/2mLm7JFz"))()
    end
})

Creds:AddParagraph({
    Title = "Credits:",
    Content = "This script was fully developed by frostlua (except the ESP)\nand brought to you by Frosties :)\njoin now!:discord.gg/XUUjpeyc3S\nlink set to your clipboard! Join now!\nThank you for using Frosties"
})

setclipboard("discord.gg/XUUjpeyc3S")
