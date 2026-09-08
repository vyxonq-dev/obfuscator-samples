repeat 
  wait() 
  until game:IsLoaded()
task.spawn(function()
setfpscap(999)
-- Library
_G.RayfieldTheme = "Red"
local rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/Justaverageguym/Hub/main/Ea.lua"))()
-- Variables
local ws = game:GetService("Workspace")
local pls = game:GetService("Players")
local cl = pls.LocalPlayer
local rs = game:GetService("RunService")

task.spawn(function()
local Window = rayfield:CreateWindow({
   Name = "Periastron Stars RPG",
   LoadingTitle = "......",
   LoadingSubtitle = "by Sirius",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "Nozz method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
local Tab = Window:CreateTab("Main", 4483362458) 
local Section = Tab:CreateSection("Main")
local godmode,godmll,godmlll,killaura,killaural,killaurarange = nil,nil,nil,nil,nil,30
local Toggle = Tab:CreateToggle({
   Name = "Kill-aura",
   CurrentValue = false,
   Flag = "aura", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      killaura = Value 
    if killaura then 
    killaural = rs.Stepped:Connect(function()
      task.spawn(function()
      if cl.Character and cl.Character:FindFirstChildOfClass("Tool") and cl.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle") and cl.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle"):FindFirstChildOfClass("TouchTransmitter") then 
        for _,v in next,ws:FindFirstChild("Enemies"):GetChildren() do 
          if v:IsA("Model") and v:FindFirstChildOfClass("Humanoid") and v:FindFirstChildOfClass("Humanoid").Health > 0 and not v:FindFirstChildOfClass("ForceField") then 
            local dis = (cl.Character:WaitForChild("HumanoidRootPart").Position - v:FindFirstChild("HumanoidRootPart").Position).magnitude
           if dis <= killaurarange then 
            cl.Character:FindFirstChildOfClass("Tool"):Activate() 
            firetouchinterest(cl.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle"),v:FindFirstChild("HumanoidRootPart"),0)
            firetouchinterest(cl.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle"),v:FindFirstChild("HumanoidRootPart"),1)
           end
          end
         end
        end
       end)
     end)
    else
      if killaural then 
        killaural:Disconnect() 
        killaural = nil
      end
     end
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Kill-Aura range",
   Range = {0, 215},
   Increment = 1,
   Suffix = "Distances",
   CurrentValue = 30,
   Flag = "Killaurae", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
    killaurarange = Value
   end,
})
local Toggle = Tab:CreateToggle({
   Name = "Semi-Godmode",
   CurrentValue = false,
   Flag = "godmode", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      godmode = Value 
    if godmode then
     if cl.Character and cl.Character:FindFirstChild("Humanoid") and cl.Character:FindFirstChild("Humanoid").Health > 0 then
    godmll = cl.Character:FindFirstChild("Humanoid"):GetPropertyChangedSignal("Health"):Connect(function()
        task.spawn(function()
         if cl.Character:FindFirstChild("Humanoid").Health < cl.Character:FindFirstChild("Humanoid").MaxHealth then 
          firetouchinterest(ws:FindFirstChild("Special"):FindFirstChild("Healing Fountain"):WaitForChild("Water"),game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),0)
          firetouchinterest(ws:FindFirstChild("Special"):FindFirstChild("Healing Fountain"):WaitForChild("Water"),game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),1)
          end
        end)
      end)
   godmlll = cl.CharacterAdded:Connect(function(lm) 
       spawn(function()
     if lm then
       wait(.5)
      godmll = lm:FindFirstChild("Humanoid"):GetPropertyChangedSignal("Health"):Connect(function()
        task.spawn(function()
         if cl.Character:FindFirstChild("Humanoid").Health < cl.Character:FindFirstChild("Humanoid").MaxHealth then 
          firetouchinterest(ws:FindFirstChild("Special"):FindFirstChild("Healing Fountain"):WaitForChild("Water"),game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),0)
          firetouchinterest(ws:FindFirstChild("Special"):FindFirstChild("Healing Fountain"):WaitForChild("Water"),game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),1)
              end
            end)
          end)
         end
        end)
       end)
     end
    else
      if godmll then 
        godmll:Disconnect() 
        godmll = nil 
      end 
      if godmlll then 
        godmlll:Disconnect()
        godmlll = nil 
      end
     end
   end,
})
local Button = Tab:CreateButton({
   Name = "Collect all Xp crystals",
   Callback = function()
     task.spawn(function()
     for _,v in next,ws:FindFirstChild("Special"):GetChildren() do 
      if v.Name:lower() == "xpcrystal" and v:FindFirstChild("Hitbox") then 
        firetouchinterest(v:FindFirstChild("Hitbox"),cl.Character:WaitForChild("HumanoidRootPart"),0)
        firetouchinterest(v:FindFirstChild("Hitbox"),cl.Character:WaitForChild("HumanoidRootPart"),1)
        end
       end
     end)
   end,
})
local Button = Tab:CreateButton({
   Name = "Collect all Chests",
   Callback = function()
    task.spawn(function()
    for _,v in next,ws:FindFirstChild("Special"):GetChildren() do 
      if v.Name:lower() == "chest" and v:FindFirstChild("Hitbox") then 
        firetouchinterest(v:FindFirstChild("Hitbox"),cl.Character:WaitForChild("HumanoidRootPart"),0)
        firetouchinterest(v:FindFirstChild("Hitbox"),cl.Character:WaitForChild("HumanoidRootPart"),1)
        end
       end
     end)
   end,
})
  end)
end)
