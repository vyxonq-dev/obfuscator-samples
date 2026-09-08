-- // SPECTRAVAX HUB - INFECTIOUS SMILE //
-- // AUTO-FARM COINS ONLY - TORA LIBRARY //

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- Respawn Handler
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HRP = char:WaitForChild("HumanoidRootPart")
end)

-- Load Tora Library (Exact URL & Syntax)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew", true))()

-- Create Main Tab
local tab = library:CreateWindow("[🌠] Spectravax Hub")

-- Create Folder
local folder = tab:AddFolder("↓ Features ↓")

-- Auto-Farm Toggle
local autoFarmEnabled = false

folder:AddToggle({
    text = "Auto-Farm Coins",
    flag = "autofarm_coins",
    callback = function(state)
        autoFarmEnabled = state
        if state then
            spawn(function()
                while autoFarmEnabled do
                    pcall(function()
                        for _, v in pairs(Workspace.Map.System:GetDescendants()) do
                            if v.Name == "SmileCoin" and v:FindFirstChild("TouchInterest") then
                                firetouchinterest(HRP, v, 0)
                                firetouchinterest(HRP, v, 1)
                            end
                        end
                    end)
                    task.wait(0.05)
                end
            end)
        end
    end
})

-- Destroy GUI Button
folder:AddButton({
    text = "Destroy GUI",
    flag = "destroy_gui",
    callback = function()
        library:Close()
    end
})

-- Initialize UI
library:Init()
