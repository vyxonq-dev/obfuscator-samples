local GuiService = game:GetService("GuiService")

local uis = game:GetService("UserInputService")



------------------------------------------------------------------------UI LIBRARY--------------------------------------------------------------------------------------------------------------------------------
local lib = loadstring(game:HttpGet("https://pastebin.com/raw/ytDg6SUf"))();

local tab1 = lib:NewTab("Classes", "Saeko <3")
local tab2 = lib:NewTab("Statuses", "Saeko <3")

lib:SetTitle("Shards of Genesis")

tab1:NewButton("Arbiter",function()
  Arbiter()
end)

tab1:NewButton("Mercenary",function()
  Mercenary()
end)

tab1:NewButton("Contriver",function()
  Contriver()
end)

tab1:NewButton("Priest",function()
  Priest()
end)

tab1:NewButton("Savage",function()
  Savage()
end)

tab1:NewButton("Sunderer",function()
  Sunderer()
end)



tab2:NewButton("Invincible",function()
	Invincible()
  end)

  tab2:NewButton("Unstoppable",function()
	Unstoppable()
  end)


------------------------------------------------------------------------MERCENARY FUNCTION------------------------------------------------------------------------------------------------------------------------------------------------------
function Mercenary()
  uis.InputBegan:Connect(function(asd)
    if asd.KeyCode == Enum.KeyCode.Two then
        for i=1, 13 do
         for i,v in pairs(game.Players:GetPlayers()) do
             if v.Name ~= game.Players.LocalPlayer.Name then 
             local args = {
              [1] = v.Character.Humanoid,
              [2] = game:GetService("ReplicatedStorage").ClassData.Mercenary.Settings,
              [3] = "UPPERCUT"
             }
 
             game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
             end 
           end
      end
     end
    end)
      uis.InputBegan:Connect(function(asd)
        if asd.KeyCode == Enum.KeyCode.One then

             for i,v in pairs(game.Players:GetPlayers()) do
                 if v.Name ~= game.Players.LocalPlayer.Name then 
                 local args = {
                  [1] = v.Character.Humanoid,
                  [2] = game:GetService("ReplicatedStorage").ClassData.Mercenary.Settings,
                  [3] = "UPPERCUT"
                 }
     
                 game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                 end 
               end
          end
        end)
end




------------------------------------------------------------------------ARBITER FUNCTION------------------------------------------------------------------------------------------------------------------------------------------------------
function Arbiter()
  uis.InputBegan:Connect(function(asd)
    if asd.KeyCode == Enum.KeyCode.Two then
        for i=1, 13 do
         for i,v in pairs(game.Players:GetPlayers()) do
             if v.Name ~= game.Players.LocalPlayer.Name then 
             local args = {
              [1] = v.Character.Humanoid,
              [2] = game:GetService("ReplicatedStorage").ClassData.Arbiter.Settings,
              [3] = "BASH_MOVE"
             }
 
             game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
             end 
           end
      end
     end
    end)
      uis.InputBegan:Connect(function(asd)
        if asd.KeyCode == Enum.KeyCode.One then

             for i,v in pairs(game.Players:GetPlayers()) do
                 if v.Name ~= game.Players.LocalPlayer.Name then 
                 local args = {
                  [1] = v.Character.Humanoid,
                  [2] = game:GetService("ReplicatedStorage").ClassData.Arbiter.Settings,
                  [3] = "BASH_MOVE"
                 }
     
                 game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                 end 
               end
          end
        end)
end
------------------------------------------------------------------------Sunderer Function ------------------------------------------------------------------------------------------------------------------------------------------------------


function Sunderer()
  uis.InputBegan:Connect(function(asd)
    if asd.KeyCode == Enum.KeyCode.Two then
        for i=1, 13 do
         for i,v in pairs(game.Players:GetPlayers()) do
             if v.Name ~= game.Players.LocalPlayer.Name then 
             local args = {
              [1] = v.Character.Humanoid,
              [2] = game:GetService("ReplicatedStorage").ClassData.Sunderer.Settings,
              [3] = "ULT_BASE"
             }
 
             game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
             end 
           end
      end
     end
    end)
      uis.InputBegan:Connect(function(asd)
        if asd.KeyCode == Enum.KeyCode.One then

             for i,v in pairs(game.Players:GetPlayers()) do
                 if v.Name ~= game.Players.LocalPlayer.Name then 
                 local args = {
                  [1] = v.Character.Humanoid,
                  [2] = game:GetService("ReplicatedStorage").ClassData.Sunderer.Settings,
                  [3] = "ULT_BASE"
                 }
     
                 game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                 end 
               end
          end 
        end)
end
------------------------------------------------------------------------Priest Function--------------------------------------------------------------------------------------------------------------------------------
function Priest()
  uis.InputBegan:Connect(function(asd)
    if asd.KeyCode == Enum.KeyCode.Two then
        for i=1, 13 do
         for i,v in pairs(game.Players:GetPlayers()) do
             if v.Name ~= game.Players.LocalPlayer.Name then 
             local args = {
              [1] = v.Character.Humanoid,
              [2] = game:GetService("ReplicatedStorage").ClassData.Priest.Settings,
              [3] = "LEFT_SWORD_TRINITY_DMG"
             }
 
             game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
             end 
           end
      end
     end
    end)
      uis.InputBegan:Connect(function(asd)
        if asd.KeyCode == Enum.KeyCode.Three then

             for i,v in pairs(game.Players:GetPlayers()) do
                 if v.Name ~= game.Players.LocalPlayer.Name then 
                 local args = {
                  [1] = v.Character.Humanoid,
                  [2] = game:GetService("ReplicatedStorage").ClassData.Priest.Settings,
                  [3] = "SLEEP"
                 }
     
                 game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                 end 
               end
          end 
        end)
        uis.InputBegan:Connect(function(asd)
          if asd.KeyCode == Enum.KeyCode.One then
  
               for i,v in pairs(game.Players:GetPlayers()) do
                   if v.Name ~= game.Players.LocalPlayer.Name then 
                   local args = {
                    [1] = v.Character.Humanoid,
                    [2] = game:GetService("ReplicatedStorage").ClassData.Priest.Settings,
                    [3] = "LEFT_SWORD_TRINITY_DMG"
                   }
       
                   game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                   end 
                 end
            end 
          end)
      end


------------------------------------------------------------------------Contriver Function---------------------------------------------------------------------------------------------------------------------------------------
      function Contriver()
        uis.InputBegan:Connect(function(asd)
          if asd.KeyCode == Enum.KeyCode.Two then
              for i=1, 13 do
               for i,v in pairs(game.Players:GetPlayers()) do
                   if v.Name ~= game.Players.LocalPlayer.Name then 
                   local args = {
                    [1] = v.Character.Humanoid,
                    [2] = game:GetService("ReplicatedStorage").ClassData.Contriver.Settings,
                    [3] = "CBOOM"
                   }
       
                   game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                   end 
                 end
            end
           end
          end)
            uis.InputBegan:Connect(function(asd)
              if asd.KeyCode == Enum.KeyCode.One then
      
                   for i,v in pairs(game.Players:GetPlayers()) do
                       if v.Name ~= game.Players.LocalPlayer.Name then 
                       local args = {
                        [1] = v.Character.Humanoid,
                        [2] = game:GetService("ReplicatedStorage").ClassData.Contriver.Settings,
                        [3] = "CBOOM"
                       }
           
                       game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                       end 
                     end
                end 
              end)
      end


------------------------------------------------------------------------Savage Function------------------------------------------------------------------------------------------------------------------------------------------------
function Savage()
  uis.InputBegan:Connect(function(asd)
    if asd.KeyCode == Enum.KeyCode.Two then
        for i=1, 13 do
         for i,v in pairs(game.Players:GetPlayers()) do
             if v.Name ~= game.Players.LocalPlayer.Name then 
             local args = {
              [1] = v.Character.Humanoid,
              [2] = game:GetService("ReplicatedStorage").ClassData.Savage.Settings,
              [3] = "SIESM_SWEET_SPOT"
             }
 
             game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
             end 
           end
      end
     end
    end)
      uis.InputBegan:Connect(function(asd)
        if asd.KeyCode == Enum.KeyCode.Three then

             for i,v in pairs(game.Players:GetPlayers()) do
                 if v.Name ~= game.Players.LocalPlayer.Name then 
                 local args = {
                  [1] = v.Character.Humanoid,
                  [2] = game:GetService("ReplicatedStorage").ClassData.Savage.Settings,
                  [3] = "CALL_OF_WAR_INNER"
                 }
     
                 game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                 end 
               end
          end 
        end)
        uis.InputBegan:Connect(function(asd)
          if asd.KeyCode == Enum.KeyCode.One then
  
               for i,v in pairs(game.Players:GetPlayers()) do
                   if v.Name ~= game.Players.LocalPlayer.Name then 
                   local args = {
                    [1] = v.Character.Humanoid,
                    [2] = game:GetService("ReplicatedStorage").ClassData.Savage.Settings,
                    [3] = "SIESM_SWEET_SPOT"
                   }
       
                   game:GetService("ReplicatedStorage").Remotes.Combat.DmgAndKB:FireServer(unpack(args))
                   end 
                 end
            end 
          end)
      end


------------







------------------------------------------------------------------------Invicibility------------------------------------------------------------------------------------------------------------------------------------------------
-- Script generated by SimpleSpy - fixed version for exploits other than synapse & krnl made by stummy#002 credits to exx#9394 for originally creating the script.
function Invincible()
	while wait() do
local args = {
    [1] = "true"
}

game:GetService("Players").LocalPlayer.Character.Remotes.InvincibleRemote:FireServer(unpack(args))
end
end
------------------------------------------------------------------------Unstoppable------------------------------------------------------------------------------------------------------------------------------------------------
function Unstoppabe()
	while wait() do
local args = {
    [1] = "true"
}

game:GetService("Players").LocalPlayer.Character.Remotes.UnstoppableRemote:FireServer(unpack(args))
end
end




