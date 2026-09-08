local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "COMBO_WICK",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(400, 350),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home" })
}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local moneyAmount = 222222
local autoEquipEnabled = false
local autoEggEnabled = false
local bringNPCEnabled = false
local walkspeedEnabled = false

-- Connection references for proper cleanup
local walkspeedConnection = nil
local autoEquipConnection = nil
local autoEggConnection = nil
local bringNPCConnection = nil

local function getAllNPCs()
    local npcs = {}
    if Workspace:FindFirstChild("WorldNpc") then
        for _, npc in ipairs(Workspace.WorldNpc:GetChildren()) do
            if npc:IsA("Model") then
                table.insert(npcs, npc)
            end
        end
    end
    return npcs
end

local scriptUrl = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/checkurasshole/bbbr/refs/heads/main/beastiffyf"))()'

Tabs.Main:AddButton({
    Title = "Copy Keyless Script",
    Callback = function()
        if setclipboard then
            setclipboard(scriptUrl)
            Fluent:Notify({
                Title = "Copied",
                Content = "Script copied to clipboard",
                Duration = 3
            })
        else
            Fluent:Notify({
                Title = "Error",
                Content = "Clipboard function not available",
                Duration = 3
            })
        end
    end
})

Tabs.Main:AddToggle("Walkspeed", {
    Title = "Walkspeed (60)",
    Default = false,
    Callback = function(v)
        walkspeedEnabled = v
        
        -- Cleanup previous connection
        if walkspeedConnection then
            walkspeedConnection:Disconnect()
            walkspeedConnection = nil
        end
        
        if walkspeedEnabled then
            walkspeedConnection = RunService.Heartbeat:Connect(function()
                local char = LocalPlayer.Character
                if char and char:FindFirstChild("Humanoid") then
                    char.Humanoid.WalkSpeed = 60
                end
            end)
        else
            local char = LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") then
                char.Humanoid.WalkSpeed = 16
            end
        end
    end
})

Tabs.Main:AddInput("MoneyInput", {
    Title = "Money Amount",
    Default = "222222",
    Placeholder = "Enter amount",
    Numeric = true,
    Callback = function(v)
        moneyAmount = tonumber(v) or 222222
    end
})

Tabs.Main:AddButton({
    Title = "Get Money",
    Callback = function()
        pcall(function()
            local args = {
                [1] = "Gacha",
                [2] = {
                    ["gachaLootName"] = "PetLoot1",
                    ["gachaCount"] = -moneyAmount
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild("PetGachaRF", 9e9):InvokeServer(unpack(args))
        end)
        Fluent:Notify({
            Title = "Money",
            Content = "Money request sent",
            Duration = 3
        })
    end
})

Tabs.Main:AddButton({
    Title = "Equip Best",
    Callback = function()
        pcall(function()
            local args = {[1] = "EquipBest"}
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild("PetLoadRF", 9e9):InvokeServer(unpack(args))
        end)
        Fluent:Notify({
            Title = "Pets",
            Content = "Equipped best pets",
            Duration = 3
        })
    end
})

Tabs.Main:AddToggle("AutoEquip", {
    Title = "Auto Equip Best",
    Default = false,
    Callback = function(v)
        autoEquipEnabled = v
        
        -- Cleanup previous connection
        if autoEquipConnection then
            task.cancel(autoEquipConnection)
            autoEquipConnection = nil
        end
        
        if autoEquipEnabled then
            autoEquipConnection = task.spawn(function()
                while autoEquipEnabled do
                    pcall(function()
                        local args = {[1] = "EquipBest"}
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild("PetLoadRF", 9e9):InvokeServer(unpack(args))
                    end)
                    task.wait(5)
                end
            end)
        end
    end
})

Tabs.Main:AddToggle("AutoEgg", {
    Title = "Auto Best Eggs (9.9Q$)",
    Default = false,
    Callback = function(v)
        autoEggEnabled = v
        
        -- Cleanup previous connection
        if autoEggConnection then
            task.cancel(autoEggConnection)
            autoEggConnection = nil
        end
        
        if autoEggEnabled then
            autoEggConnection = task.spawn(function()
                while autoEggEnabled do
                    pcall(function()
                        local args = {
                            [1] = "Gacha",
                            [2] = {
                                ["gachaLootName"] = "PetLoot18",
                                ["gachaCount"] = 1
                            }
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions", 9e9):WaitForChild("PetGachaRF", 9e9):InvokeServer(unpack(args))
                    end)
                    task.wait(0.5)
                end
            end)
        end
    end
})

Tabs.Main:AddToggle("BringNPC", {
    Title = "Bring NPCs",
    Default = false,
    Callback = function(v)
        bringNPCEnabled = v
        
        -- Cleanup previous connection
        if bringNPCConnection then
            task.cancel(bringNPCConnection)
            bringNPCConnection = nil
        end
        
        if bringNPCEnabled then
            bringNPCConnection = task.spawn(function()
                while bringNPCEnabled do
                    pcall(function()
                        local char = LocalPlayer.Character
                        if char and char:FindFirstChild("HumanoidRootPart") then
                            local hrp = char.HumanoidRootPart
                            local npcs = getAllNPCs()
                            for _, npc in ipairs(npcs) do
                                local root = npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("RootPart")
                                if root then
                                    root.CFrame = hrp.CFrame * CFrame.new(0, 0, -6)
                                end
                            end
                        end
                    end)
                    task.wait(0.1)
                end
            end)
        end
    end
})

-- Handle character respawn for walkspeed
LocalPlayer.CharacterAdded:Connect(function(char)
    if walkspeedEnabled then
        char:WaitForChild("Humanoid").WalkSpeed = 60
    end
end)
