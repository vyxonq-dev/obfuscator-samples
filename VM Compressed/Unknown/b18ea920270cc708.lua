local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local correctKey = "GUSTAHUB-2026V2"
local premiumKey = "GUSTAPREMIUM-2026V2"
local keyInput = ""

local function loadHub(isPremium)
   local Window = loadstring(game:HttpGet('https://sirius.menu/rayfield'))():CreateWindow({
      Name = "GustaHub V 2.0",
      LoadingTitle = "Carregando Hub...",
      LoadingSubtitle = "by Gustavo",
      ConfigurationSaving = {
         Enabled = true,
         FolderName = nil,
         FileName = "GustaScriptHub"
      }
   })

   local BloxFruitsTab = Window:CreateTab("Blox Fruits", 4483362458)
   
   BloxFruitsTab:CreateButton({
      Name = "🔥 Quantum Onyx",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()
      end
   })
   
   BloxFruitsTab:CreateButton({
      Name = "Blue X Hub",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-BlueX/BlueX-Hub/refs/heads/main/Main.lua"))()
      end
   })
   
   BloxFruitsTab:CreateButton({
      Name = "Xeter Hub",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/TlDinhKhoi/Xeter/refs/heads/main/Main.lua"))()
      end
   })

   local TheForgeTab = Window:CreateTab("The Forge", 4483362458)
   
   TheForgeTab:CreateButton({
      Name = "🔥 Nousigi Hub",
      Callback = function()
         loadstring(game:HttpGet("https://nousigi.com/loader.lua"))()
      end
   })
   
   TheForgeTab:CreateButton({
      Name = "Haze Hub (Xeno Support)",
      Callback = function()
         loadstring(game:HttpGet("https://haze.wtf/api/script"))()
      end
   })
   
   TheForgeTab:CreateButton({
      Name = "Airflow",
      Callback = function()
         loadstring(game:HttpGet("https://airflowscript.com/loader"))()
      end
   })

   local NoitesTab = Window:CreateTab("99 Noites na Floresta", 4483362458)
   
   NoitesTab:CreateButton({
      Name = "🔥 Voidware",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
      end
   })
   
   NoitesTab:CreateButton({
      Name = "Foxname GODMODE",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
      end
   })

   local UniversalTab = Window:CreateTab("Universal", 4483362458)
   
   UniversalTab:CreateButton({
      Name = "Infinite Yield (Admin Panel)",
      Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
      end
   })

   local LocalPlayerTab = Window:CreateTab("LocalPlayer", 4483362458)

   LocalPlayerTab:CreateSlider({
      Name = "Velocidade",
      Range = {16, 200},
      Increment = 1,
      CurrentValue = 16,
      Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
      end
   })

   LocalPlayerTab:CreateSlider({
      Name = "Força do Pulo",
      Range = {50, 300},
      Increment = 1,
      CurrentValue = 50,
      Callback = function(Value)
         game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
      end
   })

   local espEnabled = false
   local nameEspEnabled = false
   local highlights = {}
   local billboards = {}

   local function addESP(player)
      if player.Character and player ~= game.Players.LocalPlayer then
         if espEnabled and not highlights[player] then
            local highlight = Instance.new("Highlight")
            highlight.Parent = player.Character
            highlight.FillTransparency = 0.5
            highlight.OutlineTransparency = 0
            highlights[player] = highlight
         end
         
         if nameEspEnabled and not billboards[player] and player.Character:FindFirstChild("Head") then
            local billboard = Instance.new("BillboardGui")
            billboard.Parent = player.Character.Head
            billboard.AlwaysOnTop = true
            billboard.Size = UDim2.new(0, 100, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Parent = billboard
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = player.Name
            textLabel.TextColor3 = Color3.new(1, 1, 1)
            textLabel.TextStrokeTransparency = 0
            textLabel.Font = Enum.Font.SourceSansBold
            textLabel.TextSize = 14
            
            billboards[player] = billboard
         end
      end
   end

   local function removeESP(player)
      if highlights[player] then
         highlights[player]:Destroy()
         highlights[player] = nil
      end
      if billboards[player] then
         billboards[player]:Destroy()
         billboards[player] = nil
      end
   end

   LocalPlayerTab:CreateToggle({
      Name = "ESP (Outline)",
      CurrentValue = false,
      Callback = function(Value)
         espEnabled = Value
         if Value then
            for _, player in pairs(game.Players:GetPlayers()) do
               addESP(player)
            end
         else
            for player, highlight in pairs(highlights) do
               highlight:Destroy()
            end
            highlights = {}
         end
      end
   })

   LocalPlayerTab:CreateToggle({
      Name = "ESP de Nomes",
      CurrentValue = false,
      Callback = function(Value)
         nameEspEnabled = Value
         if Value then
            for _, player in pairs(game.Players:GetPlayers()) do
               addESP(player)
            end
         else
            for player, billboard in pairs(billboards) do
               billboard:Destroy()
            end
            billboards = {}
         end
      end
   })

   game.Players.PlayerAdded:Connect(function(player)
      player.CharacterAdded:Connect(function()
         wait(0.5)
         addESP(player)
      end)
   end)

   for _, player in pairs(game.Players:GetPlayers()) do
      if player.Character then
         addESP(player)
      end
      player.CharacterAdded:Connect(function()
         wait(0.5)
         addESP(player)
      end)
   end

   game.Players.PlayerRemoving:Connect(function(player)
      removeESP(player)
   end)

   LocalPlayerTab:CreateToggle({
      Name = "FullBright",
      CurrentValue = false,
      Callback = function(Value)
         if Value then
            game.Lighting.Brightness = 2
            game.Lighting.ClockTime = 14
            game.Lighting.FogEnd = 100000
         else
            game.Lighting.Brightness = 1
            game.Lighting.ClockTime = 12
            game.Lighting.FogEnd = 100000
         end
      end
   })

   if isPremium then
      local PremiumTab = Window:CreateTab("⭐ Premium", 4483362458)
      
      PremiumTab:CreateButton({
         Name = "RESET HWID",
         Callback = function()
            if delfile and isfile("GustaHub_Key.txt") then
               delfile("GustaHub_Key.txt")
               Rayfield:Notify({
                  Title = "✅ HWID Resetado!",
                  Content = "Reinicie o script",
                  Duration = 3
               })
            end
         end
      })
   end
end

local savedKey = readfile and isfile and isfile("GustaHub_Key.txt") and readfile("GustaHub_Key.txt") or ""

if savedKey == premiumKey then
   loadHub(true)
   return
end

local KeyWindow = Rayfield:CreateWindow({
   Name = "GustaHub V 2.0 - Key System",
   LoadingTitle = "Sistema de Key",
   LoadingSubtitle = "by Gustavo"
})

local KeyTab = KeyWindow:CreateTab("🔑 Key", 4483362458)

KeyTab:CreateInput({
   Name = "Digite a Key",
   PlaceholderText = "GUSTAHUB-2026V2",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      keyInput = Text
   end
})

KeyTab:CreateButton({
   Name = "Verificar Key",
   Callback = function()
      if keyInput == correctKey or keyInput == premiumKey then
         local isPremium = keyInput == premiumKey
         
         if isPremium and writefile then
            writefile("GustaHub_Key.txt", premiumKey)
         end
         
         Rayfield:Notify({
            Title = isPremium and "⭐ Key Premium Ativada!" or "✅ Key Correta!",
            Content = "Carregando hub...",
            Duration = 2
         })
         wait(2)
         Rayfield:Destroy()
         loadHub(isPremium)
      else
         Rayfield:Notify({
            Title = "❌ Key Incorreta!",
            Content = "Tente novamente",
            Duration = 3
         })
      end
   end
})

local GetKeyTab = KeyWindow:CreateTab("🔗 Get Key", 4483362458)

GetKeyTab:CreateLabel("Obtenha sua key:")

GetKeyTab:CreateButton({
   Name = "Copiar Link da Key",
   Callback = function()
      setclipboard("https://direct-link.net/2968151/naBpipteQnM1")
      Rayfield:Notify({
         Title = "📋 Link Copiado!",
         Content = "Cole no navegador",
         Duration = 3
      })
   end
})

GetKeyTab:CreateLabel("Key Premium: Acesso instantâneo")
