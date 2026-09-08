-- Carrega a biblioteca Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Cria a janela principal
local Window = Rayfield:CreateWindow({
   Name = "Luck Block Tower",
   LoadingTitle = "Carregando...",
   LoadingSubtitle = "by Ryomeme & Zypheron",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil,
      FileName = "LuckBlockConfig"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Key System",
      Subtitle = "Key System",
      Note = "No key",
      FileName = "Key",
      SaveKey = false,
      GrabKeyFromSite = false,
      Key = {""}
   }
})

-- Aba de Info
local InfoTab = Window:CreateTab("Info", 4483362458)

local InfoSection = InfoTab:CreateSection("Informações")

InfoTab:CreateLabel("Script: Luck Block Tower")
InfoTab:CreateLabel("Versão: 1.0")

local CreditsSection = InfoTab:CreateSection("Créditos")

InfoTab:CreateLabel("Desenvolvido por:")
InfoTab:CreateLabel("• Ryomem")
InfoTab:CreateLabel("• Zypheron")

InfoTab:CreateParagraph({
   Title = "Obrigado por usar!",
   Content = "Este script foi feito com carinho para facilitar sua gameplay. Divirta-se!"
})

-- Aba de Teleportes
local TpTab = Window:CreateTab("Teleports", 4483362458)

-- Seção de Teleportes
local Section = TpTab:CreateSection("Locais de Teleporte")

-- Botão TP Luck Block
local Button1 = TpTab:CreateButton({
   Name = "TP Luck Block",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = CFrame.new(106.86, 71.93, -283.72)
         Rayfield:Notify({
            Title = "Teleporte",
            Content = "Teleportado para Luck Block!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})

-- Botão TP Finish
local Button2 = TpTab:CreateButton({
   Name = "TP Finish",
   Callback = function()
      local player = game.Players.LocalPlayer
      if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
         player.Character.HumanoidRootPart.CFrame = CFrame.new(188.70, 405.00, -32.60)
         Rayfield:Notify({
            Title = "Teleporte",
            Content = "Teleportado para Finish!",
            Duration = 3,
            Image = 4483362458,
         })
      end
   end,
})