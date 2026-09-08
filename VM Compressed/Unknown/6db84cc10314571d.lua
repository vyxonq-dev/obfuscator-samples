-- Load Tora Library (with error handling)

local library

local success, err = pcall(function()

    library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/librarynew", true))()

end)

if not success or not library then

    warn(" Failed to load Tora Library! Error:", err)

    game:GetService("StarterGui"):SetCore("SendNotification", {

        Title = "Error",

        Text = "Failed to load Tora Library!",

        Duration = 5

    })

    return

end

-- Services

local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LP = Players.LocalPlayer

-- Variables

local AutoBabyBottle = false

local AutoSlamAttack = false

local AutoAttack = false

local AutoClaimTimeRewards = false

local AutoEquipBestPet = false

local AutoRebirth = false

local AutoEggOpen = false

local selectedEgg = "Basic"

local walkSpeed = 16

-- Egg Types

local eggTypes = {

    "Basic",

    "Lava",

    "Royal",

    "Swirl",

    "Striped",

    "Sapphire"

}

-- Tool Equip Function

local function equipTool(toolName)

    if not LP.Character then return end

    local tool = LP.Backpack:FindFirstChild(toolName)

    if tool and LP.Character:FindFirstChild("Humanoid") then

        LP.Character.Humanoid:EquipTool(tool)

    end

end

-- Create UI

local mainWindow = library:CreateWindow("Baby Simulator")

-- Main Tab

local mainFolder = mainWindow:AddFolder("Main")

-- Combat Features

mainFolder:AddToggle({

    text = "Auto Baby Bottle",

    callback = function(v)

        AutoBabyBottle = v

        if v then equipTool("Baby Bottle") end

    end

})

mainFolder:AddToggle({

    text = "Auto Slam Attack",

    callback = function(v)

        AutoSlamAttack = v

        if v then equipTool("Slam Attack") end

    end

})

mainFolder:AddToggle({

    text = "Auto Attack",

    callback = function(v)

        AutoAttack = v

        if v then equipTool("Swipe Attack") end

    end

})

-- Pet Features

mainFolder:AddToggle({

    text = "Auto Equip Best Pet",

    callback = function(v)

        AutoEquipBestPet = v

    end

})

-- Egg Features

local eggFolder = mainWindow:AddFolder("Egg")

eggFolder:AddList({

    text = "Select Egg Type",

    values = eggTypes,

    callback = function(v)

        selectedEgg = v

    end

})

eggFolder:AddToggle({

    text = "Auto Open Egg",

    callback = function(v)

        AutoEggOpen = v

    end

})

-- Rewards Features

local rewardsFolder = mainWindow:AddFolder("Rewards")

rewardsFolder:AddToggle({

    text = "Auto Claim Time Rewards",

    callback = function(v)

        AutoClaimTimeRewards = v

    end

})

rewardsFolder:AddToggle({

    text = "Auto Rebirth",

    callback = function(v)

        AutoRebirth = v

    end

})

rewardsFolder:AddSlider({

    text = "Walk Speed",

    min = 16,

    max = 200,

    value = 16,

    callback = function(v)

        walkSpeed = v

        if LP.Character and LP.Character:FindFirstChild("Humanoid") then

            LP.Character.Humanoid.WalkSpeed = v

        end

    end

})

rewardsFolder:AddButton({

    text = "TP to Pet Store",

    callback = function()

        local petStore = workspace.Worlds["!SHOPS"]["Default Egg Shop"].PetStoreInside

        for _, part in ipairs(petStore:GetDescendants()) do

            if part:IsA("BasePart") then

                LP.Character:MoveTo(part.Position)

                break

            end

        end

    end

})

-- Auto Functions

task.spawn(function()

    while task.wait(0.1) do

        if AutoBabyBottle then

            pcall(function()

                ReplicatedStorage.Remotes.Input:FireServer()

            end)

        end

        if AutoSlamAttack and LP.Character and LP.Character:FindFirstChild("Slam Attack") then

            pcall(function()

                ReplicatedStorage.Remotes.Slam:FireServer(LP.Character["Slam Attack"])

            end)

        end

        if AutoAttack then

            pcall(function()

                ReplicatedStorage.Remotes.Hack:FireServer()

            end)

        end

        if AutoEquipBestPet then

            pcall(function()

                ReplicatedStorage.Remotes.EquipPet:InvokeServer()

            end)

        end

    end

end)

task.spawn(function()

    while task.wait(1) do

        if AutoClaimTimeRewards then

            for i = 1, 8 do

                pcall(function()

                    ReplicatedStorage.Remotes.TimedRewards:InvokeServer(i)

                end)

            end

        end

        if AutoEggOpen then

            pcall(function()

                ReplicatedStorage.Remotes.OpenEgg:InvokeServer(selectedEgg)

            end)

        end

        if AutoRebirth and LP.PlayerGui and LP.PlayerGui:FindFirstChild("Main") then

            pcall(function()

                local rebirthText = LP.PlayerGui.Main.Rebirth:GetChildren()[5]:GetChildren()[4]:GetChildren()[4].Text

                local current, required = rebirthText:match("(%d+) / (%d+)")

                if current and required and tonumber(current) >= tonumber(required) then

                    ReplicatedStorage.Remotes.RequestRebirth:InvokeServer()

                end

            end)

        end

    end

end)

-- Character Handling

LP.CharacterAdded:Connect(function()

    task.wait(0.5)

    if AutoBabyBottle then equipTool("Baby Bottle") end

    if AutoSlamAttack then equipTool("Slam Attack") end

    if AutoAttack then equipTool("Swipe Attack") end

    if LP.Character and LP.Character:FindFirstChild("Humanoid") then

        LP.Character.Humanoid.WalkSpeed = walkSpeed

    end

end)

-- Initialize UI

library:Init()

-- Success Notification

game:GetService("StarterGui"):SetCore("SendNotification", {

    Title = "Success",

    Text = "Script Loaded Successfully!",

    Duration = 5

})