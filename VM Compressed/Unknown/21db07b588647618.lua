-- this button code is not pretty as i was too lazy to make it look better, thanks 
-- some of the var names are unreadable, sorry chat
local UIS = game:GetService("UserInputService")
local inputman = game:GetService("VirtualInputManager")
if UIS.TouchEnabled then
    local tuff1 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
    tuff1.ResetOnSpawn = false
    local tufff = Instance.new("ImageButton", tuff1)
    tufff.Size = UDim2.new(0, 60, 0, 60)
    tufff.Position = UDim2.new(0, 50, 0.5, -30)
    tufff.BackgroundTransparency = 1
    tufff.Draggable = true 
    local path = "saturin.png"
    if not isfile(path) then writefile(path, game:HttpGet("https://www.pompomsaturin.site/pfp%20(1).png")) end
    tufff.Image = getcustomasset(path)
    tufff.MouseButton1Click:Connect(function()
        inputman:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
        task.wait()
        inputman:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
    end)
end

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()
local win = lib:Window("Saber Simulator", "Made by Saturin.", Color3.fromRGB(255, 110, 48), Enum.KeyCode.LeftControl)
local main = win:Tab("Main", "http://www.roblox.com/asset/?id=6022668888")
lib:Notification("Join the discord server for news & updates!", "Alright")
setclipboard("https://discord.gg/JvjYe89CgG")

local afe = false
main:Button("Semi Autofarm (MAY LAG YOUR GAME)", "Autofarm.", function()
    afe = not afe
    local player = game.Players.LocalPlayer
    if afe then
        task.spawn(function()
            while afe do
                task.wait(0.01)
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SwingSaber"):FireServer()
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SellStrength"):FireServer()
                local args = {"BuyAllWeapons"}
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UIAction"):FireServer(unpack(args))
                local args = {"BuyAllDNAs"}
                game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UIAction"):FireServer(unpack(args))
                
            end
        end)
    else
    end
end)

main:Button("Auto hit boss", "Makes it so you dont have to manually grind the boss anymore", function()
    local args = {
    [1] = "EquipWeapon",
    [2] = "Cyan"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UIAction"):FireServer(unpack(args))

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(417.53155517578125, 187.3809356689453, 143.61521911621094)
while task.wait() do
local args = {
    [1] = {
        [1] = workspace:WaitForChild("Gameplay"):WaitForChild("Boss"):WaitForChild("BossHolder"):WaitForChild("Boss")
    }
}

game:GetService("Players").LocalPlayer.Character.Cyan.RemoteClick:FireServer(unpack(args))
end
end)

local misc = win:Tab("Misc", "http://www.roblox.com/asset/?id=6022668888")
misc:Button("Discord Server (Support/ Community)", "Join the Discord server.", function()
    setclipboard("https://discord.gg/JvjYe89CgG")
end)

misc:Button("Infinite Yield", "Pretty cool admin command script.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/DarkNetworks/Infinite-Yield/main/latest.lua'))()
end)



