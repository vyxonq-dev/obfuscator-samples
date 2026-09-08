-- Cleanup previous UIs
if game.CoreGui:FindFirstChild("Rayfield") then
    game.CoreGui.Rayfield:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services & Variables
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

_G.FlyEnabled = false
_G.NoclipEnabled = false
_G.GodMode = false
_G.FlySpeed = 50

-- רשימת הקואורדינטות שסיפקת
local Stages = {
    Vector3.new(623.32, 17.89, 3.78),   -- קורד 1
    Vector3.new(767.66, 21.98, 5.73),   -- קורד 2
    Vector3.new(971.63, 19.92, 4.45),   -- קורד 3
    Vector3.new(1181.80, 19.74, 2.85),  -- קורד 4
    Vector3.new(1538.51, 23.57, 2.47),  -- קורד 5
    Vector3.new(1897.00, 19.34, -0.48), -- קורד 6
    Vector3.new(3194.30, 20.75, 2.74),  -- קורד 7
    Vector3.new(3578.48, 17.65, 2.46),  -- קורד 8
    Vector3.new(4487.98, 17.65, 2.71),  -- קורד 9
    Vector3.new(4555.68, 33.14, 25.46) -- קורד 10 (END)
}

-- UI Window
local Window = Rayfield:CreateWindow({
   Name = "School Escape | God Mode",
   LoadingTitle = "Breaking Out of School...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main Cheats", 4483362458)
local MovementTab = Window:CreateTab("Movement", 4483362459)

-- [ MAIN SECTION ]
MainTab:CreateSection("Auto-Win")

MainTab:CreateButton({
   Name = "TP FOR END (Complete All Stages)",
   Info = "Teleports through all coordinates to the end",
   Callback = function()
       for i, pos in ipairs(Stages) do
           if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
               LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos) + Vector3.new(0, 3, 0)
               task.wait(0.6) -- זמן המתנה כדי שהשרת יקלוט את הצ'קפוינט
           end
       end
       Rayfield:Notify({Title = "Winner!", Content = "You reached the end!", Duration = 3})
   end,
})

MainTab:CreateSection("God Status")

MainTab:CreateToggle({
   Name = "God Mode (Anti-Lava/Lasers)",
   Info = "Prevents you from dying to obstacles",
   CurrentValue = false,
   Callback = function(Value)
       _G.GodMode = Value
       if _G.GodMode then
           -- מוחק את ה-Script בתוך הדמות שאחראי על מוות ממגע (ברוב ה-Obbies)
           local char = LocalPlayer.Character
           if char then
               for _, v in pairs(char:GetDescendants()) do
                   if v:IsA("TouchTransmitter") then v:Destroy() end
               end
           end
       end
   end,
})

-- [ MOVEMENT SECTION ]
MovementTab:CreateSection("Special Movement")

MovementTab:CreateToggle({
   Name = "Noclip (Walk Through Walls)",
   CurrentValue = false,
   Callback = function(Value) _G.NoclipEnabled = Value end,
})

MovementTab:CreateToggle({
   Name = "Fly Mode",
   CurrentValue = false,
   Callback = function(Value) _G.FlyEnabled = Value end,
})

MovementTab:CreateSlider({
   Name = "Fly Speed",
   Range = {10, 200},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value) _G.FlySpeed = Value end,
})

-- [ LOGIC LOOPS ]

-- Noclip Logic
RunService.Stepped:Connect(function()
    if _G.NoclipEnabled and LocalPlayer.Character then
        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Fly Logic
local BodyGyro = Instance.new("BodyGyro")
local BodyVelocity = Instance.new("BodyVelocity")
BodyGyro.P = 9e4
BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)

RunService.RenderStepped:Connect(function()
    if _G.FlyEnabled and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local hrp = LocalPlayer.Character.HumanoidRootPart
        BodyGyro.Parent = hrp
        BodyVelocity.Parent = hrp
        
        BodyGyro.CFrame = workspace.CurrentCamera.CFrame
        local moveDir = Vector3.new(0,0,0)
        
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + workspace.CurrentCamera.CFrame.LookVector end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - workspace.CurrentCamera.CFrame.LookVector end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - workspace.CurrentCamera.CFrame.RightVector end
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + workspace.CurrentCamera.CFrame.RightVector end
        
        BodyVelocity.Velocity = moveDir * _G.FlySpeed
    else
        BodyGyro.Parent = nil
        BodyVelocity.Parent = nil
    end
end)

Rayfield:Notify({
   Title = "God Mode Ready",
   Content = "All stages mapped and movement hacks online!",
   Duration = 5
})