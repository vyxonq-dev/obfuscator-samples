local A = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local B = A:NewWindow("KAITO SCRIPT")
local C = B:NewSection("MAIN")

local D = {
    "Tralalero Egg", "Skibidi Egg", "Saturnita Egg", "Sahur Egg", "Patapim Egg",
    "Lirili Egg", "Jockey Egg", "Gusini Egg", "Gubby Egg", "Frigo Egg",
    "Fluriflura Egg", "Chimpanzini Egg", "Capuchino Egg", "Bombardiro Egg",
    "Ballerina Egg", "Ananasini Egg", "Ambalabu Egg"
}

local E = {
    "Bombardiro Crocodilo", "Tralalero Tralala", "Brr Brr Patapim", "Lirili Larila", "Sahur",
    "Saturno Saturnita", "Chicken Jockey", "Ballerina Cappuccina", "Skibidi Toilet",
    "Chimpanzini Bananini", "Capuchino Assassino", "Boneca Ambalabu", "Frigo Camelo",
    "Gubby", "Gusini", "Ananasini", "FluriFlura"
}

local F = {"normal", "golden", "rainbow", "bloodlit"}

local G, H, I, J = D[1], E[1], F[1], 1

C:CreateDropdown("Select Egg", D, 1, function(K) G = K end)

C:CreateButton("Spawn Egg At Position", function()
    local L = {[1] = true, [2] = G}
    game:GetService("ReplicatedStorage").remotes.client.classes.backpack.callback.update_egg:FireServer(unpack(L))
    local M = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local N = {[1] = M and M.Position or Vector3.new(0, 50, 0)}
    game:GetService("ReplicatedStorage").remotes.client.controllers.placement.request_place:FireServer(unpack(N))
    task.wait(0.2)
    game:GetService("ReplicatedStorage").remotes.client.classes.backpack.callback.update_egg:FireServer(false)
end)

C:CreateDropdown("Select Pet", E, 1, function(K) H = K end)
C:CreateDropdown("Select Rarity", F, 1, function(K) I = K end)

C:CreateTextbox("Pet Size", function(K)
    local O = tonumber(K)
    if O then J = O end
end)

C:CreateButton("Spawn Pet", function()
    local P = {[1] = true, [2] = H, [3] = J, [4] = I}
    game:GetService("ReplicatedStorage").remotes.client.classes.backpack.callback.update_monster:FireServer(unpack(P))
end)

C:CreateButton("Unspawn Pet", function()
    local Q = {[1] = false, [2] = H, [3] = J, [4] = I}
    game:GetService("ReplicatedStorage").remotes.client.classes.backpack.callback.update_monster:FireServer(unpack(Q))
end)
