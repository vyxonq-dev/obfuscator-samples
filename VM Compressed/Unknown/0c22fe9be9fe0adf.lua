local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Ray hub | you vs homer v2 | by ray studios",
   LoadingTitle = "Ray Studios 🔴",
   LoadingSubtitle = "por Ray Studios",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "RayHubData",
      FileName = "RayHubConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "jAkMVGneNu",
      RememberJoins = true
   },
   KeySystem = false,
})

-- Visual: Bordas Vermelhas e Fundo Preto
Rayfield.Flags["Theme"] = {
    ["TextColor"] = Color3.fromRGB(255, 255, 255),
    ["Background"] = Color3.fromRGB(0, 0, 0), 
    ["AccentColor"] = Color3.fromRGB(255, 0, 0),
}

local MainTab = Window:CreateTab("🏠 Principal", nil)
local ESPTab = Window:CreateTab("👁️ ESP", nil)
local DiscordTab = Window:CreateTab("📱 Discord", nil)

--- SEÇÃO PRINCIPAL ---

MainTab:CreateToggle({
   Name = "🧱 Wall Hop (Plataforma ao Pular)",
   CurrentValue = false,
   Callback = function(Value)
      _G.WallHop = Value
      game:GetService("UserInputService").JumpRequest:Connect(function()
          if _G.WallHop then
              local char = game.Players.LocalPlayer.Character
              local hrp = char:FindFirstChild("HumanoidRootPart")
              if hrp then
                  local plate = Instance.new("Part")
                  plate.Size = Vector3.new(7, 1, 7)
                  plate.Transparency = 1 
                  plate.Anchored = true
                  plate.CanCollide = true
                  plate.Parent = workspace
                  plate.CFrame = hrp.CFrame * CFrame.new(0, -3.6, 0)
                  game.Debris:AddItem(plate, 0.1)
              end
          end
      end)
   end,
})

MainTab:CreateToggle({
   Name = "⚡ Speed 1.3x",
   CurrentValue = false,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value and 21 or 16
   end,
})

MainTab:CreateToggle({
   Name = "🚀 FPS Booster (Correr +)",
   CurrentValue = false,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value and 26 or 16
   end,
})

MainTab:CreateToggle({
   Name = "☁️ Infinite Jump",
   CurrentValue = false,
   Callback = function(Value)
      _G.InfJump = Value
      game:GetService("UserInputService").JumpRequest:Connect(function()
          if _G.InfJump then
              game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
          end
      end)
   end,
})

MainTab:CreateToggle({
   Name = "🛡️ God Mode (Imortal)",
   CurrentValue = false,
   Callback = function(Value)
      if Value then
          local hum = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
          hum.MaxHealth = math.huge
          hum.Health = math.huge
      else
          Rayfield:Notify({Title = "Aviso", Content = "Dê reset para desativar!", Duration = 3})
      end
   end,
})

MainTab:CreateToggle({
   Name = "👤 Invisível (Ficar Oculto)",
   CurrentValue = false,
   Callback = function(Value)
      local char = game.Players.LocalPlayer.Character
      for _, part in pairs(char:GetDescendants()) do
          if part:IsA("BasePart") or part:IsA("Decal") then
              part.Transparency = Value and 1 or 0
          end
      end
      if char:FindFirstChild("Head") and char.Head:FindFirstChild("face") then
          char.Head.face.Transparency = Value and 1 or 0
      end
   end,
})

--- SEÇÃO ESP ---

ESPTab:CreateToggle({
   Name = "🔴 ESP All (Ver Todos)",
   CurrentValue = false,
   Callback = function(Value)
      _G.ESPAll = Value
      while _G.ESPAll do
          for _, v in pairs(game.Players:GetPlayers()) do
              if v ~= game.Players.LocalPlayer and v.Character and not v.Character:FindFirstChild("Highlight") then
                  local hi = Instance.new("Highlight", v.Character)
                  hi.FillColor = Color3.fromRGB(255, 0, 0)
                  hi.OutlineColor = Color3.fromRGB(255, 255, 255)
              end
          end
          task.wait(1)
          if not _G.ESPAll then
              for _, v in pairs(game.Players:GetPlayers()) do
                  if v.Character and v.Character:FindFirstChild("Highlight") then
                      v.Character.Highlight:Destroy()
                  end
              end
          end
      end
   end,
})

--- SEÇÃO DISCORD ---

DiscordTab:CreateButton({
   Name = "🔗 Copiar Link do Discord",
   Callback = function()
      setclipboard("https://discord.gg/jAkMVGneNu")
      Rayfield:Notify({Title = "Sucesso!", Content = "Link copiado! 🔴", Duration = 5})
   end,
})

