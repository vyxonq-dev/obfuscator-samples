local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "IsaHub (The ultra hub)",
   LoadingTitle = "Carregando... duração 34 trilhões de anos",
   LoadingSubtitle = "by IsaacLindo123 (Github)",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "IsafigConfig", 
      FileName = "PrincipalConfig"
   }
})

---------------------------------------------------------
--- ABAS DO MENU
---------------------------------------------------------
local TabAdm = Window:CreateTab("Adm Scripts", 4483362458)
local TabSpecial = Window:CreateTab("ESPECIAL", 4483362458)
local TabBrook = Window:CreateTab("Brookhaven (pa trollar os amiguitos)", 4483362458)
local TabLucky = Window:CreateTab("Break a Lucky Block (o meu jogo FAVORITO)", 4483362458)
local TabKnock = Window:CreateTab("Knockout (OP) (baterfora)", 4483362458)

---------------------------------------------------------
--- SEÇÃO: ADM SCRIPTS
---------------------------------------------------------
TabAdm:CreateButton({
   Name = "Infinite Yield IY",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/Edgeiy/infiniteyield/master/source'))()
   end,
})

TabAdm:CreateButton({
   Name = "Nameless Admin NA",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
   end,
})
---------------------------------------------------------
--- SEÇÃO: ESPECIAL (coletânea de scripts)
---------------------------------------------------------
TabSpecial:CreateSection("--- Base dos personagens (se não dar certo em alguns jogos) ---")

TabSpecial:CreateButton({
   Name = "Reanimate (Se os scripts do noli ou do john doe não der certo)",
   Callback = function()
      Rayfield:Notify({Title = "Reanimando", Content = "Para tirar erros...", Duration = 4})
      pcall(function()
          local settings = {Frequency = 6, Amplification = 6, FrontOffset = 2.5}
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Mizunobyt/Reanimate/main/Reanimate.lua"))()
      end)
   end,
})

TabSpecial:CreateSection("--- Scripts de Personagem [alguns podem não dar certo em alguns jogos] ---")

TabSpecial:CreateButton({
   Name = "1x1x1x1 hacker script (FE)",
   Callback = function()
      Rayfield:Notify({Title = "1x1x1 começando", Content = "O caos irá acontecer", Duration = 3})
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1x1x1x1-112170"))()
   end,
})

TabSpecial:CreateButton({
   Name = "John Doe Script (mt legal)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/John%20Doe.lua"))()    
   end,
})

TabSpecial:CreateButton({
   Name = "Noli Script (apenas o speed)",
   Callback = function()
      Rayfield:Notify({Title = "Noli", Content = "Ninguém encosta no meu objeto, se não leva instakill", Duration = 3})
      loadstring(game:HttpGet('https://pastebin.com/raw/5iCjBWeR'))()
   end,
})

TabSpecial:CreateButton({
   Name = "Dual Ultima",
   Callback = function()
      Rayfield:Notify({Title = "DU v1", Content = "Carregando...", Duration = 3})
     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Dual-Ultima-RB-Swords-use-an-reanimation-42992"))()
      end,
})

TabSpecial:CreateButton({
   Name = "Su Tart (Justiça pelos bacons)",
   Callback = function()
      Rayfield:Notify({Title = "Bacon", Content = "Carregando...", Duration = 3})
     loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Sutart"))()
      end,
})
TabSpecial:CreateButton({
   Name = "Mafioso (pague sua divida)",
   Callback = function()
      Rayfield:Notify({Title = "Mafioso", Content = "Carregando...", Duration = 3})
     loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Mafioso-reanimate-FE-by-Mr-Eyes-86835"))()
      end,
})

TabSpecial:CreateSection("--- Inventário  ---")

TabSpecial:CreateButton({
   Name = "F3X Building Tools",
   Callback = function()
      Rayfield:Notify({Title = "F3X Btools", Content = "Carregando ferramenta de construção", Duration = 3})
      loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
   end,
})

TabSpecial:CreateButton({
   Name = "Item Giver (NO FE - Bom para fotos)",
   Callback = function()
      Rayfield:Notify({Title = "Item Giver", Content = "Carregando lista de itens...", Duration = 3})
      loadstring(game:HttpGet("https://pastefy.app/qpbQo0lr/raw"))()
   end,
})

TabSpecial:CreateSection("--- Skybox ---")

TabSpecial:CreateButton({
   Name = "C00lkidd skybox",
   Callback = function()
      Rayfield:Notify({Title = "Skybox", Content = "Carregando...", Duration = 3})
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Isaaclindo123/IsaHub-Roblox/refs/heads/main/SkyboxScripts/c00l.lua"))()
      end,
})

TabSpecial:CreateButton({
   Name = "Bluudud skybox",
   Callback = function()
      Rayfield:Notify({Title = "Skybox2", Content = "Carregando...", Duration = 3})
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Isaaclindo123/IsaHub-Roblox/refs/heads/main/SkyboxScripts/bluu.lua"))()
      end,
})

TabSpecial:CreateButton({
   Name = "1x1x1x1 skybox",
   Callback = function()
      Rayfield:Notify({Title = "Skybox3", Content = "Carregando...", Duration = 3})
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Isaaclindo123/IsaHub-Roblox/refs/heads/main/SkyboxScripts/1x1.lua"))()
      end,
})

TabSpecial:CreateButton({
   Name = "Noli skybox",
   Callback = function()
      Rayfield:Notify({Title = "Skybox4", Content = "Carregando...", Duration = 3})
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Isaaclindo123/IsaHub-Roblox/refs/heads/main/SkyboxScripts/noli.lua"))()
      end,
})

TabSpecial:CreateSection("--- Outros ---")

TabSpecial:CreateButton({
   Name = "Player YouTube Music",
   Callback = function()
      Rayfield:Notify({Title = "Player YT", Content = "Carregando...", Duration = 3})
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-YouTube-Music-Player-72222"))()
      end,
})

TabSpecial:CreateButton({
   Name = "Dex by Moon",
   Callback = function()
      Rayfield:Notify({Title = "Dex", Content = "Carregando...", Duration = 3})
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MassiveHubs/loadstring/refs/heads/main/DexXenoAndRezware'))()
      end,
})

TabSpecial:CreateButton({
   Name = "Tirar partes do chão",
   Callback = function()
      Rayfield:Notify({Title = "Furacão v2", Content = "Carregando...", Duration = 3})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hm5650/PartController/refs/heads/main/PartController.lua"))()
      end,
})

TabSpecial:CreateButton({
   Name = "Console",
   Callback = function()
      Rayfield:Notify({Title = "Console", Content = "Carregando...", Duration = 3})
    
loadstring(game:HttpGet("https://pastefy.app/TAW7JCL8/raw"))()
      end,
})

-------------------------------------------------------
--- SEÇÃO: BROOKHAVEN (ZONA DE CHAOS)
---------------------------------------------------------
local Clip = true
game:GetService("RunService").Stepped:Connect(function()
    if not Clip and game.Players.LocalPlayer.Character then
        for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
            if child:IsA("BasePart") then child.CanCollide = false end
        end
    end
end)


TabBrook:CreateToggle({
Name = "Noclip (sem a cripage)",
CurrentValue = false,
Callback = function(Value) Clip = not Value end,
})

TabBrook:CreateButton({
Name = "Fly (Vua)",
Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
end,
})

TabBrook:CreateToggle({
Name = "Fling (joga as pessoa pru quintu dus infernu)",
CurrentValue = false,
Callback = function(Value)
_G.FlingEnabled = Value
if _G.FlingEnabled then
Rayfield:Notify({Title = "Fling Ativado", Content = "Encoste em alguém!", Duration = 2})
task.spawn(function()
while _G.FlingEnabled do
task.wait(0.1)
local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
if hrp then hrp.Velocity = Vector3.new(0, 10000, 0) end
end
end)
end
end,
})
TabBrook:CreateButton({
    Name = "Remover Cercutas/Portas de ME- (Tirar us limite du mapah)",
    Callback = function()
        for i,v in pairs(workspace:GetDescendants()) do
            if v.Name == "Fence" or v.Name == "Gate" or v.Name == "Door" then
                v:Destroy()
            end
        end
    end,
})
local TornadoActive = false
TabBrook:CreateToggle({
    Name = "🌪️ Furacão (pa taca as pessoa pu djabu)",
    CurrentValue = false,
    Callback = function(Value)
        TornadoActive = Value
        if TornadoActive then
            task.spawn(function()
                while TornadoActive do
                    task.wait()
                    local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        hrp.RotVelocity = Vector3.new(0, 300, 0)
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z) 
                    end
                end
            end)
        else
            local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.RotVelocity = Vector3.new(0,0,0) end
        end
    end,
})

TabBrook:CreateButton({
   Name = "Rejoin (Entrar no mesmo server)",
   Callback = function()
      local ts = game:GetService("TeleportService")
      local p = game.Players.LocalPlayer
      ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
   end,
})

TabBrook:CreateButton({
   Name = "No gravity (sem gravidade)",
   Callback = function()
      Rayfield:Notify({Title = "No Gravity", Content = "Vamo subi", Duration = 3})
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
   end,
})
---------------------------------------------------------
--- SEÇÃO: BREAK A LUCKY BLOCK
---------------------------------------------------------
TabLucky:CreateButton({
   Name = "Auto Break (lucky brocki)",
   Callback = function()
      for _, v in pairs(game.Workspace:GetChildren()) do
          if (v.Name:find("Block") or v:FindFirstChild("ClickDetector")) and v:FindFirstChild("ClickDetector") then
              fireclickdetector(v.ClickDetector)
          end
      end
   end,
})

TabLucky:CreateToggle({
   Name = "Puxa us item du chão (Praticamente um spawn)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Loot = Value
      while _G.Loot do
          task.wait(0.5)
          if not _G.Loot then break end
          for _, item in pairs(game.Workspace:GetChildren()) do
              if item:IsA("Tool") and item:FindFirstChild("Handle") then
                  local char = game.Players.LocalPlayer.Character
                  if char and char:FindFirstChild("HumanoidRootPart") then
                      item.Handle.CFrame = char.HumanoidRootPart.CFrame
                  end
              end
          end
      end
   end,
})


---------------------------------------------------------
--- SEÇÃO: KNOCKOUT (OP)
---------------------------------------------------------
local KAura = false
local ReachSize = 20

TabKnock:CreateToggle({
   Name = "Kill Aura (pa taca tudu us pinguim pu quintu dus infernu)",
   CurrentValue = false,
   Callback = function(Value)
      KAura = Value
      task.spawn(function()
         while KAura do
            task.wait(0.1) -- Mais rápido para não dar tempo de reação
            local p = game.Players.LocalPlayer
            for _, v in pairs(game.Players:GetPlayers()) do
               if v ~= p and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                  local dist = (p.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                  if dist <= ReachSize then
                     -- Tenta ativar a ferramenta
                     local tool = p.Character:FindFirstChildOfClass("Tool") or p.Backpack:FindFirstChildOfClass("Tool")
                     if tool then
                        tool.Parent = p.Character -- Equipa sozinho
                        tool:Activate()
                        -- Tenta bater se o jogo for de clique
                        local args = { [1] = v.Character.HumanoidRootPart }
                        if tool:FindFirstChild("RemoteEvent") then tool.RemoteEvent:FireServer(unpack(args)) end
                     end
                  end
               end
            end
         end
      end)
   end,
})

TabKnock:CreateSlider({
   Name = "Alcance do Reach (para taca us inimigu pu quintu dus infernu)",
   Min = 10, Max = 40, Default = 15,
   Callback = function(Value) ReachSize = Value end,
})

Rayfield:Notify({Title = "IsaHub Carregado!", Content = "Divirta-se,ou não...", Duration = 5})
