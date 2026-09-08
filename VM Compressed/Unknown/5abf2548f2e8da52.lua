local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Grass Incremental | TOP GLOBAL ELITE",
   LoadingTitle = "Carregando Hub Elite...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = { Enabled = true, FolderName = "UnequalHub", FileName = "Config" }
})

local MainTab = Window:CreateTab("Auto Farm", 4483362458)

-- BOTÃO 1: INFINITY GLASS (MANTIDO EXATAMENTE COMO VOCÊ MANDOU)
local Toggle1 = MainTab:CreateToggle({
   Name = "Infinity Glass (Elite XP)",
   CurrentValue = false,
   Flag = "AutoFarm",
   Callback = function(Value)
      _G.Active = Value
      
      task.spawn(function()
          local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GrassCollect")
          
          while _G.Active do
              local args = {
                  [1] = {
                      ["normal"] = 150,
                      ["silver"] = 300,
                      ["ruby"] = 50,
                      ["golden"] = 50,
                      ["diamond"] = 25
                  }
              }
              
              remote:FireServer(unpack(args))
              task.wait(0.07) 
          end
      end)
   end,
})

-- BOTÃO 2: INFINITY STRENGTH (ADICIONADO COM SEU REMOTE)
local Toggle2 = MainTab:CreateToggle({
   Name = "Infinity Strength (Auto Academy)",
   CurrentValue = false,
   Flag = "InfStrength",
   Callback = function(Value)
      _G.StrengthActive = Value
      
      task.spawn(function()
          local strengthRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("IncreaseMuscle")
          
          while _G.StrengthActive do
              strengthRemote:FireServer()
              -- Delay rápido para treinar força sem parar
              task.wait(0.01) 
          end
      end)
   end,
})

-- ABA PLAYER (MANTIDA)
local PlayerTab = Window:CreateTab("Player", 4483362458)
PlayerTab:CreateSlider({
   Name = "Velocidade",
   Range = {16, 200},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- Anti-AFK Automático para não cair do Rank
task.spawn(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
