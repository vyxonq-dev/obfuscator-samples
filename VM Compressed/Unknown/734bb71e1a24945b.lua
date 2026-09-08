-- Variable 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local localroot = character:WaitForChild("HumanoidRootPart")

local function UpdateChar()
    character = player.Character or player.CharacterAdded:Wait()
    localroot = character:WaitForChild("HumanoidRootPart")
end

game.Players.LocalPlayer.CharacterAdded:Connect(UpdateChar)

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "FE kill all GUI v5 by Mawin CK", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
    Name = "Tab 1",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Section"
})

local selectedY = 0
local selectedX = 0
local selectedZ = -10

Tab:AddParagraph("Tips:", "You can Adjust X Y Z Distance By Using Negative Number and not Negative Number for example Position Y is -10 Negative Number Which Mean Negative will make the position Y of Character target Bringed to you Foward you Or if you Delete the negative it gonna make Position Y backward simple right?")
Tab:AddParagraph("Tips and Best Game to use This script with ", "I recommend yall a PVP game or Shooter game or whatever's game like that Beasucse this script was Made For Used in game PVP/Shooter/More")
Tab:AddParagraph("Follow Mawin_CK!", "His Facebook: Mawin Ck and His YouTube: Mawin Ck or Mawin_CK Follow me on roblox User is Mawin_CK")
Tab:AddParagraph("How to Use:","This script was Maded For Manipulate/Abuse Client sided hitbox which this script bring other player character in client sided which mean even though other player dont see you bring them but they can see themselves getting damaged or attacked or hit or killed Also How? For example in PVP/shooter game you can use such a gun and sword or kinfe or any weapon Tool in you backpack To Do Something to Other Player While they Bringed i hope you get and understand how this script work and how to use it Also This script will not Work if the game you playing Has Good Anti cheat or Hitbox Check ")
Tab:AddParagraph("Reminder:", "you dont need to cry in My a comment saying about my Script is not working if you dont know how to use it if the game you tested it not working Just Find another Game Beasucse you Already know it ain't? Beasucse it Not working just Fine Another game!")

Tab:AddTextbox({
    Name = "Position X(left/right(Using Negative Number/nonNeg))",
    Default = "0",
    TextDisappear = false,
    Callback = function(Value)
        selectedX = tonumber(Value)
    end
})

Tab:AddTextbox({
    Name = "Position Y(Up/Down(Using Negative Number/NonNeg))",
    Default = "0",
    TextDisappear = false,
    Callback = function(Value)
        selectedY = tonumber(Value)
    end
})

Tab:AddTextbox({
    Name = "Position Z(Foward/Backward(Negative/NonNeg) Recommended -5 to -10",
    Default = "-10",
    TextDisappear = false,
    Callback = function(Value)
        selectedZ = tonumber(Value)
    end
})

local TogglePlayerOnly = false
local function bringPlayerOnly()
    if TogglePlayerOnly and selectedX and selectedY and selectedZ then
        spawn(function()
            while TogglePlayerOnly do
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v ~= player and v.Character then
                        local JNR = v.Character:FindFirstChild("HumanoidRootPart")
                        if JNR then
                            JNR.CFrame = localroot.CFrame * CFrame.new(selectedX, selectedY, selectedZ)
                            game:GetService("RunService").Heartbeat:Wait()
                        end
                    end
                end
            end
        end)
    end
end

local tablePlayer = {}
local function UpdatePlayerList()
    tablePlayer = {}
    for _, v in pairs(game.Players:GetPlayers()) do
        if v.Name and v.Name ~= player.Name and v.Character then
            table.insert(tablePlayer, v.Name)
        end
    end
end

UpdatePlayerList()

game.Players.PlayerAdded:Connect(UpdatePlayerList)
game.Players.PlayerRemoving:Connect(UpdatePlayerList)

local selectedPlayer = nil
Tab:AddDropdown({
    Name = "Select Player",
    Default = "",
    Options = tablePlayer,
    Callback = function(Value)
        selectedPlayer = Value
    end
})

local ToggleSelectedPlayer = false
local function bringSelectedPlayer()
    if selectedPlayer and selectedX and selectedY and selectedZ then
        local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character then
            spawn(function()
                while ToggleSelectedPlayer do
                    local JNR = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if JNR then
                        JNR.CFrame = localroot.CFrame * CFrame.new(selectedX, selectedY, selectedZ)
                        game:GetService("RunService").Heartbeat:Wait()
                    end
                end
            end)
        end
    end
end

Tab:AddToggle({
    Name = "Bring All Player",
    Default = false,
    Callback = function(state)
        TogglePlayerOnly = state
        if TogglePlayerOnly then
            bringPlayerOnly()
        end
    end
})

Tab:AddToggle({
    Name = "Bring Selected Player",
    Default = false,
    Callback = function(state)
        ToggleSelectedPlayer = state
        if ToggleSelectedPlayer then
            bringSelectedPlayer()
        end
    end
})

local function CreateSafeZone()
    local part = Instance.new("Part")
    part.Position = Vector3.new(1000, 1000, 1000)
    part.Size = Vector3.new(10000, 2, 10000)
    part.Color = Color3.new(1, 1, 1)
    part.Parent = game.Workspace
    part.Name = "SafePart"
    part.Anchored = true
    localroot.CFrame = part.CFrame * CFrame.new(0, 10, 0)
end

Tab:AddButton({
    Name = "Go to SafeZone (Far Away from Map)",
    Callback = function()
        CreateSafeZone()
    end
})

local function BringNonTeamOnly()
    if selectedX and selectedY and selectedZ then
        spawn(function()
            while TogglePlayerOnly do
                for _, v in pairs(game.Players:GetPlayers()) do
                    if v.Team ~= player.Team and v.Character then
                        local enemyRoot = v.Character:FindFirstChild("HumanoidRootPart")
                        if enemyRoot then
                            enemyRoot.CFrame = localroot.CFrame * CFrame.new(selectedX, selectedY, selectedZ)
                            wait()
                        end
                    end
                end
            end
        end)
    end
end

Tab:AddToggle({
    Name = "Bring All Player But With Team Check(WARNING MIGHT LAG OR CRASH)",
    Default = false,
    Callback = function(state)
        TogglePlayerOnly = state
        if TogglePlayerOnly then
            BringNonTeamOnly()
        end
    end
})

OrionLib:Init()