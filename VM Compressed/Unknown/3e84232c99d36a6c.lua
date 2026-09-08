-- Load the external scripts from Pastebin
loadstring(game:HttpGet("https://pastebin.com/raw/1Ppc6pdn"))()

wait(0.1)

-- Set up local player and character references
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local localroot = character:WaitForChild("HumanoidRootPart")

-- Target following functionality
wait(0.1)

loadstring(game:HttpGet("https://pastebin.com/raw/F067y7db"))()

-- Punch server request functionality
spawn(function()
    while wait(0.5) do -- Added delay to reduce server stress
        game:GetService("ReplicatedStorage").OK_PUNCH:FireServer()
    end  
end)

-- Manage the player's tools
local HasTool = player.Backpack
spawn(function()
    while true do
        for _, g in pairs(HasTool:GetDescendants()) do
            if g.Name == "punch" and g.Parent ~= character then
                g.Parent = character
            end
        end
        wait() -- Add delay before repeating the loop
    end
end)