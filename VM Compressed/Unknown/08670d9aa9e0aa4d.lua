-- [[ SISTEMA DE SEGURANÇA RYOMEMGU ]]
local MASTER_KEY = "RyomemGuDevscriptfunnygoatsbros"
local PASTEBIN_URL = "https://pastebin.com/raw/Cy3pZcmp"
local DynamicKey = ""
local UserInput = ""

pcall(function()
    DynamicKey = game:HttpGet(PASTEBIN_URL):gsub("%s+", "")
end)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local LoginWin = Rayfield:CreateWindow({
    Name = "Ryomem & Zyp | Autenticação",
    LoadingTitle = "Verificando Chave...",
    LoadingSubtitle = "Segurança Ativa",
    ConfigurationSaving = { Enabled = false }
})

local LoginTab = LoginWin:CreateTab("Acesso", 4483362458)

LoginTab:CreateInput({
   Name = "Insira a Key",
   PlaceholderText = "Cole a chave aqui...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       UserInput = Text
   end,
})

LoginTab:CreateButton({
   Name = "Entrar no Script",
   Callback = function()
       if UserInput ~= "" and (UserInput == MASTER_KEY or UserInput == DynamicKey) then
           Rayfield:Notify({Title = "Sucesso", Content = "Carregando Build A Boat Hub...", Duration = 2})
           
           Rayfield:Destroy()
           task.wait(0.5)

           ------------------------------------------------------------
           -- INÍCIO DO SEU SCRIPT (BARRINHA DE VELOCIDADE ADICIONADA)
           ------------------------------------------------------------
           local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
            
           local Window = Rayfield:CreateWindow({
              Name = "Build A Boat | Ryomem & Zyp",
              LoadingTitle = "Carregando Projeto...",
              LoadingSubtitle = "by Ryomem and Zyp",
              ConfigurationSaving = { Enabled = true, FolderName = "BAB_RyomemZyp" }
           })
            
           local MainTab = Window:CreateTab("Farm & AFK", 4483362458)
           local InfoTab = Window:CreateTab("Info", 4370344717)
            
           _G.AutoFarm = false
           _G.FarmSpeed = 450
           _G.AntiAFK = false
            
           InfoTab:CreateSection("Créditos")
           InfoTab:CreateLabel("Script By Ryomem And Zyp")
           InfoTab:CreateParagraph({Title = "Sobre", Content = "Script desenvolvido para farm rápido de ouro com sistema de bypass Anti-AFK."})
            
           local function ToggleAntiAFK(state)
               _G.AntiAFK = state
               if _G.AntiAFK then
                   local player = game.Players.LocalPlayer
                   player.Idled:Connect(function()
                       if _G.AntiAFK then
                           game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                           task.wait(1)
                           game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                       end
                   end)
                   Rayfield:Notify({Title = "Anti-AFK", Content = "Proteção Ativada!", Duration = 3})
               end
           end
            
           MainTab:CreateToggle({
              Name = "Anti-AFK (Anti-Kick)",
              CurrentValue = false,
              Flag = "AntiAFK",
              Callback = function(Value)
                 ToggleAntiAFK(Value)
              end,
           })
            
           MainTab:CreateToggle({
              Name = "Ativar Auto Farm",
              CurrentValue = false,
              Flag = "AutoFarm",
              Callback = function(Value)
                 _G.AutoFarm = Value
            
                 if Value then
                     spawn(function()
                         while _G.AutoFarm do
                             local player = game.Players.LocalPlayer
                             local character = player.Character or player.CharacterAdded:Wait()
                             local hrp = character:WaitForChild("HumanoidRootPart")
            
                             local bv = Instance.new("BodyVelocity")
                             bv.Velocity = Vector3.new(0,0,0)
                             bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                             bv.Parent = hrp
            
                             local function moveTo(targetPos)
                                 if not _G.AutoFarm then return end
                                 local distance = (hrp.Position - targetPos).Magnitude
                                 local duration = distance / _G.FarmSpeed
                                 local tween = game:GetService("TweenService"):Create(hrp, TweenInfo.new(duration, Enum.EasingStyle.Linear), {CFrame = CFrame.new(targetPos)})
                                 tween:Play()
                                 tween.Completed:Wait()
                             end
            
                             pcall(function()
                                 local mainGui = player.PlayerGui.MainGui
                                 local launchBtn = mainGui.LeftPanel.LaunchButton
                                 game:GetService("VirtualUser"):ClickButton1(Vector2.new(launchBtn.AbsolutePosition.X, launchBtn.AbsolutePosition.Y))
                                 task.wait(0.4)
                                 local confirmBtn = mainGui.ConfirmationFrame.YesButton
                                 game:GetService("VirtualUser"):ClickButton1(Vector2.new(confirmBtn.AbsolutePosition.X, confirmBtn.AbsolutePosition.Y))
                             end)
            
                             task.wait(0.3)
            
                             moveTo(Vector3.new(-59, 70, 389)) 
                             moveTo(Vector3.new(-76, 70, 8667)) 
            
                             if _G.AutoFarm then
                                 bv:Destroy()
                                 character:BreakJoints()
                                 task.wait(4.5)
                             end
                         end
                     end)
                 end
              end,
           })
            
           -- BARRINHA DE VELOCIDADE (SLIDER)
           MainTab:CreateSlider({
              Name = "Velocidade do Farm",
              Range = {1, 500},
              Increment = 1,
              Suffix = "Studs",
              CurrentValue = 450,
              Flag = "FarmSpeedSlider",
              Callback = function(Value)
                 _G.FarmSpeed = Value
              end,
           })
            
           Rayfield:LoadConfiguration()
           ------------------------------------------------------------
           -- FIM DO SEU SCRIPT
           ------------------------------------------------------------

       else
           Rayfield:Notify({Title = "Erro", Content = "Key Incorreta!", Duration = 3})
       end
   end,
})

LoginTab:CreateButton({
   Name = "Obter Key",
   Callback = function()
       setclipboard("https://direct-link.net/2523612/6lT6fLM93FvC")
       Rayfield:Notify({Title = "Sucesso", Content = "Link copiado!", Duration = 3})
   end,
})