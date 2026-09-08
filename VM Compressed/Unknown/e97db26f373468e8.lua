-- MADE BY BRUDDA
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local isToggled = false 
local Window = Rayfield:CreateWindow({
    Name = "Stud Jump GUI",
    LoadingTitle = "Find more on Discord",
    LoadingSubtitle = "by Brudda",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil, 
        FileName = "Big Hub"
    },
   Discord = {
      Enabled = true,
      Invite = "3NqYkMFH2C", 
      RememberJoins = true 
   }
})
local Tab = Window:CreateTab("Main") 
local Section = Tab:CreateSection("Teleports")
local Button = Tab:CreateButton({
   Name = "VIP Room",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-86, -214, -79)
   end,
})
local Button = Tab:CreateButton({
   Name = "Winner Area",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1242, 1441, -20)
   end,
})
local Button = Tab:CreateButton({
   Name = "Spawn",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-91, -215, -20)
   end,
})
local Section = Tab:CreateSection("Obby end Tp")
local Button = Tab:CreateButton({
   Name = "Easy",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-205, -145, 673)
   end,
})
local Button = Tab:CreateButton({
   Name = "Medium",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-87, -145, 712)
   end,
})
local Button = Tab:CreateButton({
   Name = "Hard",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(37, -145, 737)
   end,
})
local Section = Tab:CreateSection("Local Player")
local Toggle = Tab:CreateToggle({
    Name = "Double Jump (CAN'T BE TURNED OFF)",
    CurrentValue = false,
    Flag = "ToggleDoubleJump",
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = char:WaitForChild("HumanoidRootPart")
        local humanoid = char:WaitForChild("Humanoid")
        local jumpUsage = 1
        local uis = game:GetService("UserInputService")

        local connection

        local function onInputBegan(input, gameProcessedEvent)
            if not gameProcessedEvent and input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.Space then
                if humanoidRootPart and humanoid and humanoid:GetState() == Enum.HumanoidStateType.Freefall and jumpUsage >= 1 then
                    jumpUsage = jumpUsage - 1
                    humanoid:ChangeState(Enum.HumanoidStateType.Jumping, true)
                    humanoid.StateChanged:Connect(function(old, new)
                        if new == Enum.HumanoidStateType.Landed then
                            jumpUsage = 1
                        end
                    end)
                end
            end
        end

        if Value then
            connection = uis.InputBegan:Connect(onInputBegan)
        else
            if connection then
                connection:Disconnect()
            end
        end
    end,
})

local Slider = Tab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 100},
   Increment = 10,
   Suffix = "Speed",
   CurrentValue = 10,
   Flag = "SliderSpeed", 
   Callback = function(Value)
   local Player = game.Players.LocalPlayer
if Player.Character then
 Player.Character.Humanoid.WalkSpeed = Value
end
   end,
})
local Slider = Tab:CreateSlider({
   Name = "Jumppower",
   Range = {0, 300},
   Increment = 20,
   Suffix = "Jp",
   CurrentValue = 50,
   Flag = "SliderJumpPower",
   Callback = function(Value)
       local Player = game.Players.LocalPlayer
       if Player.Character then
           Player.Character.Humanoid.JumpPower = Value
       end
   end,
})

local Tab = Window:CreateTab("Credits")
local Button = Tab:CreateButton({
   Name = "Made by Brudda",
   Callback = function()
   print("Made by Brudda \nGithub.com/bruddaa/ \nDiscord.gg/3NqYkMFH2C")
   end,
})
local Button = Tab:CreateButton({
   Name = "github.com/bruddaa/",
   Callback = function()
   print("Made by Brudda \nGithub.com/bruddaa/ \nDiscord.gg/3NqYkMFH2C")
   end,
})
local Button = Tab:CreateButton({
   Name = "discord.gg/3NqYkMFH2C",
   Callback = function()
   print("Made by Brudda \nGithub.com/bruddaa/ \nDiscord.gg/3NqYkMFH2C")
   end,
})
-- Made by Brudda 
-- discord.gg/3NqYkMFH2C
-- github.com/bruddaa/
