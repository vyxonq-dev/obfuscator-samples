-- Script by k0n7oL_p3C∆H69
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Red Vs Blue | lahan kosong? sawit bos",
   LoadingTitle = "Loading Script...",
   LoadingSubtitle = "by Etanol X Sawit",
   ConfigurationSaving = {
      Enabled = false
   }
})

local MainTab = Window:CreateTab("Main Features", 4483362458)
local MovementTab = Window:CreateTab("Movement", 4483362458)

local Player = game.Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

-- State Variables
local ESP_Enabled = false
local CurrentSpeed = 16
local CurrentJump = 50
local Drawings = {}

-- Fungsi Apply Stats (Agar tetap aktif setelah mati)
local function ApplyPhysic()
    local char = Player.Character or Player.CharacterAdded:Wait()
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = CurrentSpeed
    hum.JumpPower = CurrentJump
    hum.UseJumpPower = true
end

-- Auto Re-apply saat respawn
Player.CharacterAdded:Connect(function()
    task.wait(1) -- Tunggu loading karakter
    ApplyPhysic()
end)

-- --- LOGIC ESP (LINE + SKELETON BOX) ---
local function ClearESP()
    for _, v in pairs(Drawings) do
        v.Visible = false
    end
end

RunService.RenderStepped:Connect(function()
    if not ESP_Enabled then 
        ClearESP()
        return 
    end

    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= Player and v.Team ~= Player.Team and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
            local char = v.Character
            local root = char.HumanoidRootPart
            local pos, onScreen = Camera:WorldToViewportPoint(root.Position)

            if onScreen then
                -- Line dari Atas
                local lId = v.Name .. "_L"
                if not Drawings[lId] then 
                    Drawings[lId] = Drawing.new("Line")
                    Drawings[lId].Thickness = 1
                    Drawings[lId].Color = Color3.fromRGB(255, 0, 0)
                end
                Drawings[lId].From = Vector2.new(Camera.ViewportSize.X / 2, 0)
                Drawings[lId].To = Vector2.new(pos.X, pos.Y)
                Drawings[lId].Visible = true

                -- Box (Pengganti Skeleton agar lebih ringan & stabil)
                local bId = v.Name .. "_B"
                if not Drawings[bId] then
                    Drawings[bId] = Drawing.new("Square")
                    Drawings[bId].Thickness = 1
                    Drawings[bId].Color = Color3.fromRGB(255, 255, 255)
                    Drawings[bId].Filled = false
                end
                local size = Vector2.new(2000/pos.Z, 2500/pos.Z)
                Drawings[bId].Size = size
                Drawings[bId].Position = Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2)
                Drawings[bId].Visible = true
            else
                if Drawings[v.Name .. "_L"] then Drawings[v.Name .. "_L"].Visible = false end
                if Drawings[v.Name .. "_B"] then Drawings[v.Name .. "_B"].Visible = false end
            end
        end
    end
end)

-- --- UI ELEMENTS ---

MainTab:CreateSection("Visuals (Enemies Only)")
MainTab:CreateToggle({
   Name = "ESP Skeleton Box + Top Line",
   CurrentValue = false,
   Callback = function(Value)
      ESP_Enabled = Value
   end,
})

-- WALK SPEED SECTION (Berderet)
MovementTab:CreateSection("Walk Speed")
MovementTab:CreateButton({Name = "Speed: Reset", Callback = function() CurrentSpeed = 16 ApplyPhysic() end})
MovementTab:CreateButton({Name = "Speed: 25", Callback = function() CurrentSpeed = 25 ApplyPhysic() end})
MovementTab:CreateButton({Name = "Speed: 45", Callback = function() CurrentSpeed = 45 ApplyPhysic() end})
MovementTab:CreateButton({Name = "Speed: 65", Callback = function() CurrentSpeed = 65 ApplyPhysic() end})

-- HIGH JUMP SECTION (Berderet)
MovementTab:CreateSection("High Jump")
MovementTab:CreateButton({Name = "Jump: Reset", Callback = function() CurrentJump = 50 ApplyPhysic() end})
MovementTab:CreateButton({Name = "Jump: 10", Callback = function() CurrentJump = 60 ApplyPhysic() end})
MovementTab:CreateButton({Name = "Jump: 15", Callback = function() CurrentJump = 65 ApplyPhysic() end})
MovementTab:CreateButton({Name = "Jump: 25", Callback = function() CurrentJump = 75 ApplyPhysic() end})

-- DESTROY
MainTab:CreateSection("Options")
MainTab:CreateButton({
   Name = "DESTROY SCRIPT",
   Callback = function()
       ESP_Enabled = false
       for _, v in pairs(Drawings) do v:Remove() end
       CurrentSpeed = 16
       CurrentJump = 50
       ApplyPhysic()
       Rayfield:Destroy()
   end,
})

Rayfield:Notify({Title = "Success", Content = "Script by k0n7oL_p3C∆H69 Loaded!", Duration = 3})
