local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Traversal HUB",
   LoadingTitle = "Traversal HUB",
   LoadingSubtitle = "Made by Semyon",
   Theme = "Default",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Big Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "TRAVERSAL KEYSYSTEM", -- hell nah
      Subtitle = "",
      Note = "",
      FileName = "",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = "",
   }
})
local PlayerTab = Window:CreateTab("UPDATE LOGS", "square-pen")
local PlyerParagraph = PlayerTab:CreateParagraph({Title = "LAST UPDATE", Content = "10/22/2025"})
local PlyerParagraph = PlayerTab:CreateParagraph({Title = "NEW FEATURES", Content = "ADDED DELETE TOOL,// ADDED ABILITY TO DISABLE ENEMIES AI SYS,// ADDED ABILITY TO REMOVE ENEMIES LEGS,// ADDED ABILITY TO REMOVE ENEMIES WEAPONS,// ADDED WEAPONS SPAWNER (BRINGS WEAPONS FROM WORKSPACE,// UPDATED GODMODE TO BE STABLE)"})
local Label = PlayerTab:CreateLabel("PRESS M TO UNLOCK CURSOR, K TO OPEN CLOSE THIS UI", "info")


local PlayerTab = Window:CreateTab("GODMODE", "heart-pulse")
local Button = PlayerTab:CreateButton({
   Name = "Trun ON",
   Callback = function()
      while true do
         task.wait()
         local args = {
            [1] = {
               [1] = {
                  [1] = "\25",
                  [2] = game:GetService("Players").LocalPlayer.Character.Humanoid,
                  [3] = math.huge
               }
            }
         }
         game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
      end
   end,
})

local PlayerTab = Window:CreateTab("DELETE TOOL", "eraser")
local Button = PlayerTab:CreateButton({
   Name = "ENABLE UI",
   Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/YegozovutSemyon/TraversalHUB/refs/heads/main/deletemenu'))()

    end,
})

local Label = PlayerTab:CreateLabel("TO USE DELETE BY PATH, USE INFINITE YILED, AND EXECUTE Dex Command", "info")
local Label = PlayerTab:CreateLabel("• V - Toggle Delete Mode", "info")
local Label = PlayerTab:CreateLabel("• E - Delete Targeted Object", "info")
local Label = PlayerTab:CreateLabel("• Enter - Delete object by path", "info")

local PlayerTab = Window:CreateTab("INF STAMINA", "rocket")
local Button = PlayerTab:CreateButton({
   Name = "TRUN ON[BROKEN, A FIX WILL BE SOON]",
   Callback = function()
     
   end,
})

local PlayerTab = Window:CreateTab("ENEMIES", "skull")
local Button = PlayerTab:CreateButton({
   Name = "REMOVE LEGS FROM ENEMIES",
   Callback = function()
   for _, enemy in pairs(workspace.Enemies:GetChildren()) do
    local leftLeg = enemy:FindFirstChild("Left Leg")
    local rightLeg = enemy:FindFirstChild("Right Leg")
    
    if leftLeg then
        local args = {
            [1] = {
                [1] = {
                    [1] = "\24",
                    [2] = leftLeg,
                    [3] = math.huge
                }
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
    
    if rightLeg then
        local args = {
            [1] = {
                [1] = {
                    [1] = "\24",
                    [2] = rightLeg,
                    [3] = math.huge
                }
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
    wait(0.05)
end
   end,
})
local Button = PlayerTab:CreateButton({
   Name = "DISABLE ENEMIES AI SYSTEM",
   Callback = function()
   for _, enemy in pairs(workspace.Enemies:GetChildren()) do
    local enemyMain = enemy:FindFirstChild("EnemyMain")
    if enemyMain then
        local args = {
            [1] = {
                [1] = {
                    [1] = "\24",
                    [2] = enemyMain,
                    [3] = math.huge
                }
            }
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
    end
    wait(0.05)
end
   end,
})
local Button = PlayerTab:CreateButton({
   Name = "DELETE WEAPONS FROM ENEMIES",
   Callback = function()
   for _, enemy in pairs(workspace.Enemies:GetChildren()) do
    for _, descendant in pairs(enemy:GetDescendants()) do
        if descendant.Name == "PrimaryHandle" or descendant.Name == "SecondaryHandle" or descendant.Name == "Handle" then
            local args = {
                [1] = {
                    [1] = {
                        [1] = "\24",
                        [2] = descendant,
                        [3] = math.huge
                    }
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
        end
    end
    wait(0.05)
end

   end,
})

local PlayerTab = Window:CreateTab("WEAPONS", "swords")
local Button = PlayerTab:CreateButton({
   Name = "SPAWN WEAPONS",
   Callback = function()
      local targetRemote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent")

local weaponsToSpawn = {
    "Bat",
    "Knife", 
    "Axe",
    "Machete",
    "Crowbar",
    "Chainsaw",
    "Katana",
}

for _, weaponName in pairs(weaponsToSpawn) do
    local weapon = workspace:FindFirstChild(weaponName, true) 
    
    if weapon then
        local args = {
            {
                {
                    "\016",
                    weapon
                }
            }
        }
        targetRemote:FireServer(unpack(args))
    end
    
    wait(0.2)
end

local workspaceFolders = {
    "Weapons",
    "Tools",
    "Items", 
    "Drops",
    "SpawnedItems"
}

for _, folderName in pairs(workspaceFolders) do
    local folder = workspace:FindFirstChild(folderName)
    if folder then
        for _, weaponName in pairs(weaponsToSpawn) do
            local weapon = folder:FindFirstChild(weaponName)
            if weapon then
                local args = {
                    {
                        {
                            "\016",
                            weapon
                        }
                    }
                }
                targetRemote:FireServer(unpack(args))
                wait(0.2)
            end
        end
    end
end
   end,
})

local PlayerTab = Window:CreateTab("Sigma Boi AURA", "eye-off")
local Button = PlayerTab:CreateButton({
   Name = "Trun ON THIS SIGMA AURA, BOI !",
   Callback = function()
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
      for i = 1, 30 do
         local codeChar = string.char(i)
         local args = {
            {
               { codeChar, "True" }
            }
         }
         pcall(function()
            remoteEvent:FireServer(unpack(args))
         end)
         wait(0.1)
      end
   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Trun OFF",
   Callback = function()
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local remoteEvent = ReplicatedStorage:WaitForChild("RemoteEvent")
      for i = 1, 30 do
         local codeChar = string.char(i)
         local args = {
            {
               { codeChar, "False" }
            }
         }
         pcall(function()
            remoteEvent:FireServer(unpack(args))
         end)
         wait(0.1)
      end
   end,
})

local Label = PlayerTab:CreateLabel("IF U TRUN OFF SIGMA BOI AND THEY ARE FOLLOWING YOU, RIP, YOU'RE COOKED", "triangle-alert")
local Paragraph = PlayerTab:CreateParagraph({Title = "", Content = ""})
local Label = PlayerTab:CreateLabel("REMEMBER: IF U CLICKED RIGHT MOUSE U WILL LOSE THE AURA AND THEY WILL START HITTING U", "triangle-alert")
local Paragraph = PlayerTab:CreateParagraph({Title = "", Content = ""})
local Label = PlayerTab:CreateLabel("THAT OPTION MAKES U A FRIEND OF THE ENEMIES MAYBE? THEY CAN'T HIT U, BUT THEY ALWAYS WILL BE FOLLOWING U, PLAY WITH ANOTHER PLAYER AND SHOW HIM UR SIGMA AURA, BOI", "info")

local PlayerTab = Window:CreateTab("Masks Unlocker", "lock-open")
local Button = PlayerTab:CreateButton({
   Name = "Wear Clown's Mask",
   Callback = function()
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local RemoteEvent = ReplicatedStorage.RemoteEvent
      local ClownMask = ReplicatedStorage.Gamepasses.ClownMask
      RemoteEvent:FireServer({
         {
            "\31",
            ClownMask
         }
      })
   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Wear Tengu's Mask",
   Callback = function()
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local RemoteEvent = ReplicatedStorage.RemoteEvent
      local TenguMask = ReplicatedStorage.Gamepasses.TenguMask
      RemoteEvent:FireServer({
         {
            "\31",
            TenguMask
         }
      })
   end,
})

local Button = PlayerTab:CreateButton({
   Name = "Wear Smile's Mask",
   Callback = function()
      local ReplicatedStorage = game:GetService("ReplicatedStorage")
      local RemoteEvent = ReplicatedStorage.RemoteEvent
      local SmileMask = ReplicatedStorage.Gamepasses.SmileMask
      RemoteEvent:FireServer({
         {
            "\31",
            SmileMask
         }
      })
   end,
})

local Label = PlayerTab:CreateLabel("ENJOY!", "heart")
local Label = PlayerTab:CreateLabel("UPDATED ON 24/07 WITH NEW METHOD, IT'S NOW FE AND U CAN TALK IN CHAT NORMALY", "info")

local PlayerTab = Window:CreateTab("Credits", "square-code")
local Label = PlayerTab:CreateLabel("Semyon", "user-round-cog")
local Label = PlayerTab:CreateLabel("Rayfield UI", "paint-roller")
