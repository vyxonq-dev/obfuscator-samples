local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local Window = Library:NewWindow("Wal-hop Tower")
local Tab = Window:NewSection("Opsi Kill and Tp")

-- Tombol Kill All
Tab:CreateButton("KILL ALL", function()
    local range = 1000
    local player = game:GetService("Players").LocalPlayer

    local function isFriendWith(player1, player2)
        return player1:IsFriendsWith(player2.UserId)
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        local players = game.Players:GetPlayers()
        for _, otherPlayer in pairs(players) do
            if otherPlayer ~= player then
                local character = otherPlayer.Character
                if character and not isFriendWith(player, otherPlayer) then
                    local tool = player.Character and player.Character:FindFirstChildOfClass("Tool")
                    if tool and tool:FindFirstChild("Handle") then
                        tool:Activate()
                        for _, part in ipairs(character:GetChildren()) do
                            if part:IsA("BasePart") then
                                firetouchinterest(tool.Handle, part, 0)
                                firetouchinterest(tool.Handle, part, 1)
                            end
                        end
                    end
                end
            end
        end
    end)
end)

-- Tombol Notifikasi bahwa Classic Sword dibutuhkan
Tab:CreateButton("NEED CLASSIC SWORD👆🏻", function()
    print("Classic Sword is required!")
end)

-- Tombol Teleport ke Classic Sword
Tab:CreateButton("TP CLASSIC SWORD", function()
    local teleportPosition = Vector3.new(-263, 1431, 619) -- Posisi tujuan teleport
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    end
end)

Tab:CreateButton("TP END OBBY", function()
    local teleportPosition = Vector3.new(-78, 1665, 901) -- Posisi tujuan teleport
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    end
end)

Tab:CreateButton("TP SPAWN", function()
    local teleportPosition = Vector3.new(-20, 1431, 518) -- Posisi tujuan teleport
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(teleportPosition)
    end
end)

Tab:CreateButton("TT:komtolmmek2", function()
    print("Made by komtolmmek2")
end)