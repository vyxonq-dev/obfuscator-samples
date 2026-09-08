local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
local Window = Rayfield:CreateWindow({
Name = "HexWare",
LoadingTitle = "Loading HexWare",
LoadingSubtitle = "Hexeriss runs all legit players",
ConfigurationSaving = {
Enabled = false,
FolderName = nil, -- Create a custom folder for your hub/game
FileName = "HexWare"
},
Discord = {
Enabled = true,
Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
RememberJoins = false -- Set this to false to make them join the discord every time they load it up
},
KeySystem = true, -- Set this to true to use our key system
KeySettings = {
Title = "HexWare KEY",
Subtitle = "Key System",
Note = "Join the discord https://discord.gg/fvfpAKUTc9.",
FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
Key = {"GOFISHING"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
}
})
 
local MainTab = Window:CreateTab("Auto Fish [no need to wait for it]", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Auto Fish")
 
Rayfield:Notify({
Title = "You Executed Key HexWare!",
Content = "Enjoy!",
Duration = 5,
Image = nil,
Actions = { -- Notification Buttons
Ignore = {
Name = "Okay!",
Callback = function()
print("The user tapped Okay!")
end
},
},
})
 
Rayfield:Notify({
Title = "HEXWARE ON TOP JOIN DISCORD FOR MORE SCRIPTS!",
Content = "JOIN NOW",
Duration = 5000,
Image = nil,
Actions = { -- Notification Buttons
Ignore = {
Name = "Okay!",
Callback = function()
print("The user tapped Okay!")
end
},
},
})
 
local Button = MainTab:CreateButton({
    Name = "AUTO FISH FALSE",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        if player:FindFirstChild("gui") and player.gui:FindFirstChild("autofishing") then
            player.gui.autofishing.Value = false
        else
            warn("The 'autofishing' value could not be found.")
        end
    end,
})


 
local Button = MainTab:CreateButton({
    Name = "AUTO FISH TRUE",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        if player:FindFirstChild("gui") and player.gui:FindFirstChild("autofishing") then
            player.gui.autofishing.Value = true
        else
            warn("The 'autofishing' value could not be found.")
        end
    end,
})

 
local Button = MainTab:CreateButton({
    Name = "https://discord.gg/fvfpAKUTc9",
    Callback = function()
        local textToCopy = "https://discord.gg/fvfpAKUTc9"  -- Change this to whatever text you want
        setclipboard(textToCopy)
        print("Text copied to clipboard!")
    end,
})

local MainTab = Window:CreateTab("NPC TP", nil) -- Title, Image

local Button = MainTab:CreateButton({
    Name = "Fish Trader",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(809.7117309570312, 126.82027435302734, -245.5218963623047)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Shop",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(772.517333984375, 127.46492004394531, -268.37646484375)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Eskimo",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(2705.765380859375, 156.61337280273438, 333.31695556640625)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Captain",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(-1034.5157470703125, 229.43576049804688, -2012.91357421875)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Rich Man",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(158.92153930664062, 129.95008850097656, 1375.88427734375)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "???",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(256.8035583496094, 142.85731506347656, 1155.0050048828125)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Fisher Man",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(185.617431640625, 252.6217498779297, 1079.1361083984375)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Ninja",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(850.3411254882812, 199.5869598388672, -472.8104248046875)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})



local MainTab = Window:CreateTab("World TP", nil) -- Title, Image

local Button = MainTab:CreateButton({
    Name = "Snowy Island",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(2364.06005859375, 190.08168029785156, 370.3554382324219)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Default Island",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(785.6729736328125, 149.4274444580078, -196.1960906982422)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Deep Waters",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(-1053.0377197265625, 245.45556640625, -1633.8570556640625)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Ancient Ocean",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(359.0365905761719, 274.3789367675781, -2884.776611328125)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "High Field",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(2687.351806640625, 312.6783142089844, -3473.484619140625)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Toxic Zone",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(4679.78515625, 217.62191772460938, -2478.677001953125)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local Button = MainTab:CreateButton({
    Name = "Volcano Island",
    Callback = function()
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(210.25352478027344, 188.69044494628906, 1303.5172119140625)
        else
            warn("Could not teleport: HumanoidRootPart not found.")
        end
    end,
})

local MainTab = Window:CreateTab("Automatics", nil) -- Title, Image

local Button = MainTab:CreateButton({
    Name = "Auto Sell All",
    Callback = function()
        -- Define the target teleport location
        local targetPosition = Vector3.new(623.929443359375, 125.165771484375, -2934.55810546875)

        -- Get reference to the player and the character
        local player = game:GetService("Players").LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        -- Store the original position
        local originalPosition = humanoidRootPart.Position

        -- Teleport to the target location
        humanoidRootPart.CFrame = CFrame.new(targetPosition)

        -- Wait for the character to finish teleporting (optional delay for smooth teleport)
        wait(0.5)  -- Adjust the wait time if needed

        -- Find the RemoteFunction under the path ReplicatedStorage > events > fishing
        local remoteFunction = game.ReplicatedStorage:WaitForChild("events"):WaitForChild("fishing"):WaitForChild("sellAllFishes")

        -- Check if the RemoteFunction exists and fire it
        if remoteFunction then
            local success, result = pcall(function()
                return remoteFunction:InvokeServer()  -- Call the server function to sell all fishes
            end)
            if success then
                print("Successfully fired RemoteFunction 'sellAllFishes'.")
            else
                warn("Error while firing 'sellAllFishes':", result)
            end
        else
            warn("RemoteFunction 'sellAllFishes' not found!")
        end

        -- Teleport back to the original position
        humanoidRootPart.CFrame = CFrame.new(originalPosition)
    end,
})


