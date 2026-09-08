-- Made by Brudda
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local isToggled = false 
local Window = Rayfield:CreateWindow({
    Name = "Draw Obby auto win by Brudda ",
    LoadingTitle = "Find more on Discord",
    LoadingSubtitle = "by Brudda",
    ConfigurationSaving = {
        Enabled = true,
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
local Section = Tab:CreateSection("discord.gg/3NqYkMFH2C")
local Toggle = Tab:CreateToggle({
    Name = "Toggle Script (if turned off and on again it restarts)",
    CurrentValue = false,
    Flag = "Toggle Script",
    Callback = function()
        isToggled = not isToggled 
        local locations = {
            Vector3.new(115, 39, 13), -- 1
            Vector3.new(115, 39, 103), -- 2
            Vector3.new(115, 39, 207), -- 3
            Vector3.new(115, 39, 293), -- 4
            Vector3.new(115, 39, 406), -- 5
            Vector3.new(115, 39, 487), -- 6
            Vector3.new(115, 67, 645), -- 7
            Vector3.new(115, 67, 794), -- 8
            Vector3.new(115, 67, 873), -- 9
            Vector3.new(115, 67, 1045), -- 10
            Vector3.new(115, 67, 1160), -- 11
            Vector3.new(115, 90, 1320), -- 12
            Vector3.new(115, 90, 1539), -- 13
            Vector3.new(115, 116, 1684), -- 14
            Vector3.new(115, 116, 1835), -- 15
            Vector3.new(115, 116, 1981), -- 16
            Vector3.new(115, 116, 2081), -- 17
            Vector3.new(115, 116, 2217), -- 18
            Vector3.new(115, 116, 2347), -- 19
            Vector3.new(115, 116, 2437), -- 20
            Vector3.new(115, 121, 2576), -- 21
            Vector3.new(115, 121, 2667), -- 22
            Vector3.new(115, 121, 2767), -- 23
            Vector3.new(115, 121, 2902), -- 24
            Vector3.new(115, 121, 3003), -- 25
            Vector3.new(115, 121, 3105), -- 26
            Vector3.new(115, 121, 3185), -- 27
            Vector3.new(115, 121, 3371), -- 28
            Vector3.new(115, 151, 3481), -- 29
            Vector3.new(115, 151, 3591), -- 30
            Vector3.new(115, 152, 3635), -- WIN
        }

        while isToggled do 
            for _, destination in ipairs(locations) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
                wait(2) 
                if not isToggled then 
                    break
                end
            end
        end
    end
})
-- https://discord.gg/3NqYkMFH2C
-- https://github.com/bruddaa
-- Made by Brudda --
