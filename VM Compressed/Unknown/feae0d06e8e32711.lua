local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Tree Hub | Chop your tree V12",
   LoadingTitle = "Carregando Configurações...",
   LoadingSubtitle = "by Gemini",
   ConfigurationSaving = { Enabled = true, FolderName = "TreeHubConfig", FileName = "TreeHub" }
})

local MainTab = Window:CreateTab("Autofarm", 4483362458)

local AutoUpgrade = false
local AutoTree = false
local AutoPrestige = false

-- 1. AUTO XP (BOTÃO VERMELHO DO TERRENO)
MainTab:CreateToggle({
   Name = "Auto XP Regador (Botão Vermelho)",
   CurrentValue = false,
   Flag = "AutoUpgrade",
   Callback = function(Value)
      AutoUpgrade = Value
      task.spawn(function()
         while AutoUpgrade do
            pcall(function()
               local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TapButtonClick")
               -- Detecta o Plot automaticamente para enviar o XP
               local plot = workspace.Plots:FindFirstChild("Plot") or workspace.Plots:FindFirstChild(game.Players.LocalPlayer.Name)
               remote:FireServer(plot)
            end)
            task.wait(0.01) -- Velocidade máxima para ganhar XP
         end
      end)
   end,
})

-- 2. AUTO PRESTIGE (LOCALIZADO NA ABA PRINCIPAL)
MainTab:CreateToggle({
   Name = "Auto Prestige (Automático)",
   CurrentValue = false,
   Flag = "AutoPrestige",
   Callback = function(Value)
      AutoPrestige = Value
      task.spawn(function()
         while AutoPrestige do
            pcall(function()
               -- Dispara o Remote de Prestígio enviado por você
               game:GetService("ReplicatedStorage").Remotes.Prestige:InvokeServer()
            end)
            task.wait(3) -- Delay para evitar lag no servidor
         end
      end)
   end,
})

-- 3. AUTO TREE + MAGNET COIN (DISTÂNCIA NORMAL)
MainTab:CreateToggle({
   Name = "Auto Tree + Magnet Coin",
   CurrentValue = false,
   Flag = "AutoTree",
   Callback = function(Value)
      AutoTree = Value
      task.spawn(function()
         while AutoTree do
            pcall(function()
               -- Bater na árvore
               game:GetService("ReplicatedStorage").Remotes.AxeSwing:FireServer()
               
               -- Coletar Moedas (Magnet)
               local char = game.Players.LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                  for _, obj in pairs(workspace:GetDescendants()) do
                     if obj.Name == "Coin" and obj:IsA("BasePart") then
                        obj.CFrame = char.HumanoidRootPart.CFrame
                     end
                  end
               end
            end)
            task.wait(0.1)
         end
      end)
   end,
})

-- ANTI-AFK (IMPEDE O KICK POR INATIVIDADE)
pcall(function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    end)
end)

Rayfield:Notify({
   Title = "Hub Pronto!",
   Content = "Lucky Block removido. Farm otimizado!",
   Duration = 5,
})
