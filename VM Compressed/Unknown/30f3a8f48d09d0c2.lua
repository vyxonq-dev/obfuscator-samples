local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()
 
local Window = OrionLib:MakeWindow({Name = "Spin For UGC Tab"})
 
local Tab = Window:MakeTab({
  Name = "Auto Spin",
  Icon = "rbxassetid://4483345998"
})


Tab:AddToggle({
  Name = "pie",
  Default = false,
  Callback = function(Value)
    pie = Value
    while pie and task.wait(0.1) do
local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Spinning Wheel Pie")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateSelected"):FireServer(unpack(args))



local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Spinning Wheel Pie")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Spin"):InvokeServer(unpack(args))



end
  end
})
Tab:AddToggle({
  Name = "aura",
  Default = false,
  Callback = function(Value)
    aura = Value
    while aura and task.wait(0.1) do
local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Aura")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateSelected"):FireServer(unpack(args))

local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Aura")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Spin"):InvokeServer(unpack(args))

end
end
})
Tab:AddToggle({
  Name = "hat",
  Default = false,
  Callback = function(Value)
    hat = Value
    while hat and task.wait(0.1) do
local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Hat")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateSelected"):FireServer(unpack(args))

local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Hat")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Spin"):InvokeServer(unpack(args))

end
  end
})
Tab:AddToggle({
  Name = "Scarf",
  Default = false,
  Callback = function(Value)
    Scarf = Value
    while Scarf and task.wait(0.1) do
local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Scarf")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateSelected"):FireServer(unpack(args))


local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Scarf")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Spin"):InvokeServer(unpack(args))

end
  end
})
Tab:AddToggle({
  Name = "mask",
  Default = false,
  Callback = function(Value)
    mask = Value
    while mask and task.wait(0.1) do
local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Mask")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UpdateSelected"):FireServer(unpack(args))

local args = {
    [1] = game:GetService("ReplicatedStorage"):WaitForChild("ugcAssetIds"):WaitForChild("Cute Bunny Mask")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Spin"):InvokeServer(unpack(args))

end
  end
})
Tab:AddToggle({
  Name = "Afk",
  Default = false,
  Callback = function(Value)
    Afk = Value
    while Afk and task.wait() do
repeat wait() until game:IsLoaded() game:GetService("Players").LocalPlayer.Idled:connect(function() game:GetService("VirtualUser"):ClickButton2(Vector2.new())
end)
    end
  end
})
local Tab = Window:MakeTab({
  Name = "Auto Obby",
  Icon = "rbxassetid://4483345998"
})
Tab:AddToggle({
  Name = "Obby",
  Default = false,
  Callback = function(Value)
    Obby = Value
    while Obby and task.wait(1) do 
game.Workspace.EndPart:PivotTo(CFrame.new(5.14438533782959, 4.975198745727539, -0.32985734939575195))
game.Workspace.Obby.Start:PivotTo(CFrame.new(5.14438533782959, 4.975198745727539, -0.32985734939575195))
    end
  end
})
local Tab = Window:MakeTab({
  Name = "AutoPurchaseBoosts",
  Icon = "rbxassetid://4483345998"
})
Tab:AddToggle({
  Name = "doubleLuckTenM",
  Default = false,
  Callback = function(Value)
    doubleLuckTenM = Value
    while doubleLuckTenM and task.wait(10) do 
local args = {
    [1] = "doubleLuck",
    [2] = "x2luck10m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "doubleLuckThreeM",
  Default = false,
  Callback = function(Value)
    doubleLuckThreeM = Value
    while doubleLuckThreeM and task.wait(10) do 
local args = {
    [1] = "doubleLuck",
    [2] = "x2luck30m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "doubleLuckOneH",
  Default = false,
  Callback = function(Value)
    doubleLuckOneH = Value
    while doubleLuckOneH and task.wait(10) do 
local args = {
    [1] = "doubleLuck",
    [2] = "x2luck1h"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "TripleLuckTenM",
  Default = false,
  Callback = function(Value)
    TripleLuckTenM = Value
    while TripleLuckTenM and task.wait(10) do 
local args = {
    [1] = "tripleLuck",
    [2] = "x3luck10m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "TripleLuckTenM",
  Default = false,
  Callback = function(Value)
    TripleLuckTenM = Value
    while TripleLuckTenM and task.wait(10) do 
local args = {
    [1] = "tripleLuck",
    [2] = "x3luck30m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "TripleLuckOneH",
  Default = false,
  Callback = function(Value)
    TripleLuckOneH = Value
    while TripleLuckOneH and task.wait(10) do 
local args = {
    [1] = "tripleLuck",
    [2] = "x3luck1h"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "doubleSpinsTenM",
  Default = false,
  Callback = function(Value)
    doubleSpinsTenM = Value
    while doubleSpinsTenM and task.wait(10) do 
local args = {
    [1] = "doubleSpins",
    [2] = "x2spins10m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "doubleSpinsThreeM",
  Default = false,
  Callback = function(Value)
    doubleSpinsThreeM = Value
    while doubleSpinsThreeM and task.wait(10) do 
local args = {
    [1] = "doubleSpins",
    [2] = "x2spins30m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "doubleSpinsOneH",
  Default = false,
  Callback = function(Value)
    doubleSpinsOneH = Value
    while doubleSpinsOneH and task.wait(10) do 
local args = {
    [1] = "doubleSpins",
    [2] = "x2spins1h"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "TripleSpinsTenM",
  Default = false,
  Callback = function(Value)
    TripleSpinsTenM = Value
    while TripleSpinsTenM and task.wait(10) do 
local args = {
    [1] = "tripleSpins",
    [2] = "x3spins10m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "TripleSpinsThreeM",
  Default = false,
  Callback = function(Value)
    TripleSpinsThreeM = Value
    while TripleSpinsThreeM and task.wait(10) do 
local args = {
    [1] = "tripleSpins",
    [2] = "x3spins30m"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})
Tab:AddToggle({
  Name = "TripleSpinsOneH",
  Default = false,
  Callback = function(Value)
    TripleSpinsOneH = Value
    while TripleSpinsOneH and task.wait(10) do 
local args = {
    [1] = "tripleSpins",
    [2] = "x3spins1h"
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PurchaseBoost"):InvokeServer(unpack(args))
end
  end
})