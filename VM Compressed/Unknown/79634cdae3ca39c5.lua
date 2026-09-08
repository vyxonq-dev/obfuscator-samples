local ArrayField = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/MC%3AArrayfield%20Library"))()

local Window = ArrayField:CreateWindow({
    Name = "ArrayField Example Window",
})

local Tab = Window:CreateTab("Example Tab")

local fishingEnabled = false

local Toggle = Tab:CreateToggle({
    Name = "Auto Fishing byThailandHUBp",
    CurrentValue = false,
    Callback = function(Value)
        fishingEnabled = Value

        while fishingEnabled do
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local pole = char and char:FindFirstChild("Fishing Pole")
            local hook = pole and pole:FindFirstChild("Hook")

            if char and pole and hook then
                game:GetService("ReplicatedStorage").Fishing:FireServer(char, pole, hook)
            end

            wait() -- ตั้งเวลาเพื่อป้องกันการส่งคำสั่งเร็วเกินไป
        end
    end,
})

local fishingEnabled = false

local Toggle = Tab:CreateToggle({
    Name = "Auto Fishing2 youcan use 2 button for fast",
    CurrentValue = false,
    Callback = function(Value)
        fishingEnabled = Value

        while fishingEnabled do
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local pole = char and char:FindFirstChild("Fishing Pole")
            local hook = pole and pole:FindFirstChild("Hook")

            if char and pole and hook then
                game:GetService("ReplicatedStorage").Fishing:FireServer(char, pole, hook)
            end

            wait(1) -- ตั้งเวลาเพื่อป้องกันการส่งคำสั่งเร็วเกินไป
        end
    end,
})

local spearAttackEnabled = false

local Toggle = Tab:CreateToggle({
    Name = "Auto stone Spear Attack",
    CurrentValue = false,
    Callback = function(Value)
        spearAttackEnabled = Value

        while spearAttackEnabled do
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local spear = char and char:FindFirstChild("Stone Spear")

            if spear then
                game:GetService("ReplicatedStorage").SpearAttack:FireServer(spear)
            end

            wait() -- ปรับความเร็วการโจมตี (ค่าต่ำไปอาจโดนแบน)
        end
    end,
})

local pickaxeSwingEnabled = false

local Toggle = Tab:CreateToggle({
    Name = "Auto Pickaxe Swing",
    CurrentValue = false,
    Callback = function(Value)
        pickaxeSwingEnabled = Value

        while pickaxeSwingEnabled do
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local pickaxe = char and char:FindFirstChild("Pick Axe")

            if pickaxe then
                game:GetService("ReplicatedStorage").PickAxeSwing:FireServer(pickaxe)
            end

            wait() -- ปรับความเร็วการขุด
        end
    end,
})

local woodenSpearAttackEnabled = false

local Toggle = Tab:CreateToggle({
    Name = "Auto Wooden Spear Attack",
    CurrentValue = false,
    Callback = function(Value)
        woodenSpearAttackEnabled = Value

        while woodenSpearAttackEnabled do
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local woodenSpear = char and char:FindFirstChild("Wooden Spear")

            if woodenSpear then
                game:GetService("ReplicatedStorage").SpearAttack:FireServer(woodenSpear)
            end

            wait() -- ปรับความเร็วการโจมตี (ค่าต่ำไปอาจโดนแบน)
        end
    end,
})

local upgradedAxeSwingEnabled = false

local Toggle = Tab:CreateToggle({
    Name = "Auto Upgraded Axe Swing",
    CurrentValue = false,
    Callback = function(Value)
        upgradedAxeSwingEnabled = Value

        while upgradedAxeSwingEnabled do
            local player = game:GetService("Players").LocalPlayer
            local char = player.Character
            local upgradedAxe = char and char:FindFirstChild("Improved Axe")

            if upgradedAxe then
                game:GetService("ReplicatedStorage").UpgradedAxeSwing:FireServer(upgradedAxe)
            end

            wait() -- ปรับความเร็วการสวิง (สามารถปรับค่า wait ได้ตามต้องการ)
        end
    end,
})