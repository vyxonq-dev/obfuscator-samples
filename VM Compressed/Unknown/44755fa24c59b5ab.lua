-- Unable to find or read the file!
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/lime"))()

local w = Library:Window("by ThailandHUBp")

w:Button("Start Fishing", function()
    while wait() do
        local args = {
            [1] = game:GetService("Players").LocalPlayer.Character,
            [2] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishing Pole"),
            [3] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Fishing Pole").Hook
        }

        game:GetService("ReplicatedStorage").Fishing:FireServer(unpack(args))
    end
end)

w:Button("auto attack spear wood", function()
while wait () do
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Wooden Spear")
}

game:GetService("ReplicatedStorage").SpearAttack:FireServer(unpack(args))
end
end)

w:Button("auto PickAxe", function()
while wait() do
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Pick Axe")
}

game:GetService("ReplicatedStorage").PickAxeSwing:FireServer(unpack(args))
end
end)

w:Button("auto attack spear ", function()
while wait() do
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character:FindFirstChild("Stone Spear")
}

game:GetService("ReplicatedStorage").SpearAttack:FireServer(unpack(args))
end
end)