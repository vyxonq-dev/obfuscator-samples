local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Anime Femboy Obby Script",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Femboys Loading...",
   LoadingSubtitle = "by Elyos",
   ShowText = "Rayfield", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Tab = Window:CreateTab("Main")
local connections = {}
local Button = Tab:CreateButton({
   Name = "Stair 1",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,2,338)
   end,
})
local Button = Tab:CreateButton({
   Name = "Stair 2",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-416,161,6938)
   end,
})
local Button = Tab:CreateButton({
   Name = "End",
   Callback = function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-413,260,6964)
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Troll Stairs",
   CurrentValue = false,
   Flag = "Toggle1",
   Callback = function(Value)
       pcall(function()
           -- ÖNCE ESKİ CONNECTION'LARI TEMİZLE
           for _, conn in pairs(connections) do
               conn:Disconnect()
           end
           connections = {}
           
           if not Value then return end  -- Eğer false ise, sadece temizle ve çık
           
           local Players = game:GetService("Players")
           local rs = game:GetService("RunService")
           
           local player = Players.LocalPlayer
           local character = player.Character or player.CharacterAdded:Wait()
           local stairs = {}
           local stairss = {}
           local currentIndex = 1
           local currentIndexx = 1
           
           player.CharacterAdded:Connect(function(char)
               character = char
           end)
           
           if Value then
               oldCF = character.HumanoidRootPart.CFrame
               character.HumanoidRootPart.CFrame = CFrame.new(0,2,338)
               task.wait(1)
           end
           
           for _, v in pairs(workspace.ObbyFolder["Obby Stairs"]:GetChildren()) do
               if v:IsA("BasePart") then
                   table.insert(stairs, v)
               end
           end
           
           if Value then
               character.HumanoidRootPart.CFrame = CFrame.new(-416,161,6938)
               task.wait(1)
           end
           
           for _, v in pairs(workspace["Ending Moveable"]["Obby Stairs"]:GetChildren()) do
               if v:IsA("BasePart") then
                   table.insert(stairss, v)
               end
           end
           
           if Value then
               character.HumanoidRootPart.CFrame = oldCF
           end
           
           -- CONNECTION'LARI SAKLA
           local conn1 = rs.Heartbeat:Connect(function()
               if not Value then return end  -- Bu artık dıştaki Value'yu referans alır
               if not character then return end
               
               local leg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftLowerLeg")
               if leg then
                   local stair = stairs[currentIndex]
                   if stair then
                       firetouchinterest(stair, leg, 0)
                       task.wait()
                       firetouchinterest(stair, leg, 1)
                       
                       currentIndex += 1
                       if currentIndex > #stairs then
                           task.wait(2.4)
                           currentIndex = 1
                       end
                   end
               end
           end)
           
           table.insert(connections, conn1)
           
           local conn2 = rs.Heartbeat:Connect(function()
               if not Value then return end
               if not character then return end
               
               local leg = character:FindFirstChild("Left Leg") or character:FindFirstChild("LeftLowerLeg")
               if leg then
                   local stair = stairss[currentIndexx]
                   if stair then
                       firetouchinterest(stair, leg, 0)
                       task.wait()
                       firetouchinterest(stair, leg, 1)
                       
                       currentIndexx += 1
                       if currentIndexx > #stairss then
                           task.wait(2.4)
                           currentIndexx = 1
                       end
                   end
               end
           end)
           
           table.insert(connections, conn2)
       end)
   end,
})
local isGodMode = false
local Toggle = Tab:CreateToggle({
    Name = "God Mode",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        isGodMode = Value
      while task.wait() do  
if not isGodMode then return end
for i , v in pairs(game.Workspace:GetDescendants()) do
if v:IsA("TouchTransmitter") and v.Parent.Name ~= "teleport2" and v.Parent.Name ~= "pad" and v.Parent.Name ~= "Giver" and v.Parent.Name ~= "Teleporter" and v.Parent.Parent.Name ~= "Obby Stairs" then
v:Destroy()
end
end
end
    end,
 })
 local Tab2 = Window:CreateTab("Item")
 local Button = Tab2:CreateButton({
   Name = "Rainbow Magic Carpet",
   Callback = function()
    game:GetService("ReplicatedStorage").ClaimGearEvent:FireServer()
   end,
})
local Tab3 = Window:CreateTab("Morph")
local Button = Tab3:CreateButton({
   Name = "Felix",
   Callback = function()
    local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-413,260,6964)
    task.wait(1)
firetouchinterest(workspace["Ending Moveable"].Morphs["Pad Felix"].Pad,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
task.wait()
firetouchinterest(workspace["Ending Moveable"].Morphs["Pad Felix"].Pad,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
task.wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
   end,
})
local Button = Tab3:CreateButton({
    Name = "Astolfo",
    Callback = function()
    local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-413,260,6964)
    task.wait(1)
firetouchinterest(workspace["Ending Moveable"].Morphs.Model.Pad,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
task.wait()
firetouchinterest(workspace["Ending Moveable"].Morphs.Model.Pad,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
task.wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
   end,
})
local Button = Tab3:CreateButton({
   Name = "Venti",
   Callback = function()
    local oldPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-413,260,6964)
    task.wait(1)
firetouchinterest(workspace["Ending Moveable"].Morphs["Pad Venti"].Pad,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
task.wait()
firetouchinterest(workspace["Ending Moveable"].Morphs["Pad Venti"].Pad,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
task.wait(2)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldPos
   end,
})
local Tab4 = Window:CreateTab("Lag Server")
local lagServerRunning = false
local Toggle = Tab4:CreateToggle({
    Name = "Lag Server",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        lagServerRunning = Value  -- Flag'i güncelle
        
        if not Value then return end  -- Eğer false ise, sadece durdur ve çık
        
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local carpet = game:GetService("ReplicatedStorage").ClaimGearEvent
        player.CharacterAdded:Connect(function(c)
            character = c
        end)
        
        while task.wait(0.1) do
            if not lagServerRunning then 
                for _, tool in pairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.Name ~= "Astolfo Juice" then
                    character:WaitForChild("Humanoid"):EquipTool(tool)
                    tool.Parent=workspace
                end
            end 
                return
             end  -- Flag'i kontrol et
            carpet:FireServer()
            for _, tool in pairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") and tool.Name ~= "Astolfo Juice" then
                    character:WaitForChild("Humanoid"):EquipTool(tool)
                    tool.Parent=workspace
                end
            end
        end
    end,
 })
 local Tab5 = Window:CreateTab("Misc")
 local Button = Tab5:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
   end,
 })
