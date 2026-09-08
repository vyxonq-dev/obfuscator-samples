-- 作成者: cocosakutai-svg
-- リポジトリ: supreme-barnacle
-- Kill All Script with Rayfield GUI

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "cocosakutai-svg Hub",
   LoadingTitle = "Supreme Barnacle",
   LoadingSubtitle = "by cocosakutai-svg",
   ConfigurationSaving = {
      Enabled = false,
   },
   KeySystem = false,
})

local MainTab = Window:CreateTab("メイン機能", 4483362458)
local Section = MainTab:CreateSection("戦闘機能")

-- Kill All機能
local KillAllButton = MainTab:CreateButton({
   Name = "Kill All (全員倒す)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character
      local killed = 0
      
      if not character then
         Rayfield:Notify({
            Title = "エラー",
            Content = "キャラクターが見つかりません",
            Duration = 3,
         })
         return
      end
      
      local tool = character:FindFirstChildOfClass("Tool")
      if not tool then
         for _, item in pairs(player.Backpack:GetChildren()) do
            if item:IsA("Tool") then
               tool = item
               character.Humanoid:EquipTool(tool)
               break
            end
         end
      end
      
      if not tool then
         Rayfield:Notify({
            Title = "エラー",
            Content = "武器を装備してください",
            Duration = 3,
         })
         return
      end
      
      for _, targetPlayer in pairs(game.Players:GetPlayers()) do
         if targetPlayer ~= player and targetPlayer.Character then
            local targetChar = targetPlayer.Character
            local targetHumanoid = targetChar:FindFirstChild("Humanoid")
            local targetRoot = targetChar:FindFirstChild("HumanoidRootPart")
            
            if targetHumanoid and targetHumanoid.Health > 0 and targetRoot then
               local originalPos = character.HumanoidRootPart.CFrame
               
               -- テレポートして攻撃
               character.HumanoidRootPart.CFrame = targetRoot.CFrame * CFrame.new(0, 0, 3)
               wait(0.1)
               
               -- ツールを使用
               if tool:FindFirstChild("Handle") then
                  firetouchinterest(tool.Handle, targetRoot, 0)
                  firetouchinterest(tool.Handle, targetRoot, 1)
               end
               
               targetHumanoid.Health = 0
               killed = killed + 1
               wait(0.05)
               
               -- 元の位置に戻る
               character.HumanoidRootPart.CFrame = originalPos
            end
         end
      end
      
      Rayfield:Notify({
         Title = "Kill All 完了",
         Content = killed .. "人を倒しました",
         Duration = 5,
      })
      
      print("Kill All 実行: " .. killed .. "人 by cocosakutai-svg")
   end,
})

-- God Mode
local GodModeButton = MainTab:CreateButton({
   Name = "God Mode (無敵化)",
   Callback = function()
      local player = game.Players.LocalPlayer
      local character = player.Character or player.CharacterAdded:Wait()
      local humanoid = character:WaitForChild("Humanoid")
      
      humanoid.MaxHealth = math.huge
      humanoid.Health = math.huge
      
      humanoid.HealthChanged:Connect(function()
         humanoid.Health = math.huge
      end)
      
      Rayfield:Notify({
         Title = "God Mode",
         Content = "無敵モード有効化！",
         Duration = 3,
      })
   end,
})

-- クレジット
local CreditsTab = Window:CreateTab("クレジット", 4483362458)
CreditsTab:CreateLabel("作成者: cocosakutai-svg")
CreditsTab:CreateLabel("リポジトリ: supreme-barnacle")
CreditsTab:CreateLabel("UI: Rayfield Library")

print("=================================")
print("Supreme Barnacle Hub 起動完了")
print("作成者: cocosakutai-svg")
print("=================================")
