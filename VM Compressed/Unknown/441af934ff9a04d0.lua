local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Credits: TGMANKASKE")
local Section = Window:NewSection("Boosts")
 
Section:CreateButton("Unlock Islands", function()
    local Players = game:GetService("Players")
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")
 
    local positions = {
        Vector3.new(165, 2550, -13),
        Vector3.new(513, 5647, 101),
        Vector3.new(-196, 9256, 144),
    }
    local originalCFrame = hrp.CFrame
 
    local function teleportTo(pos, waitTime)
        hrp.CFrame = CFrame.new(pos)
        task.wait(waitTime or 1.5)
    end
 
    task.spawn(function()
        for _, pos in ipairs(positions) do
            teleportTo(pos)
        end
        teleportTo(originalCFrame.Position)
    end)
end)
 
 
 
local MangoSpeed = 0.005 
local InstaMangoEnabled = false
 
Section:CreateToggle("Instant Mango", function(state)
    InstaMangoEnabled = state
 
    task.spawn(function()
        local evt = game:GetService("ReplicatedStorage"):WaitForChild("MangoesEvt")
 
        while InstaMangoEnabled do
            for _ = 1, 77 do
                evt:FireServer()
            end
            task.wait(MangoSpeed)
        end
    end)
end)
 
 
 
local AutoJumpEnabled = false
Section:CreateToggle("Ant-AFK (jump)", function(state)
    AutoJumpEnabled = state
    task.spawn(function()
        while AutoJumpEnabled do
            task.wait(2)
            local vim = game:GetService("VirtualInputManager")
            vim:SendKeyEvent(true, Enum.KeyCode.Space, false, game)   
            task.wait(0.1)
            vim:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        end
    end)
end)
 
 
 
local Tab = Window:NewSection("Links")
 
Tab:CreateButton("Discord Group", function()
print("HI")
 
setclipboard("https://discord.gg/8A6k73JqCM")
toclipboard("https://discord.gg/8A6k73JqCM")
 
end)
 
Tab:CreateButton("Youtube", function()
print("HI")
 
setclipboard("https://www.youtube.com/@TGMANKASKE")
toclipboard("https://www.youtube.com/@TGMANKASKE")
 
end)
