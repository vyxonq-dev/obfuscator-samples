-- [[ VNGEx Hub | Blox Fruits GOD MODE Beta ]] --
-- [[ Created by Namoblox ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "VNGEx Hub | Blox Fruits GOD MODE",
   LoadingTitle = "Developed by Namoblox",
   LoadingSubtitle = "Premium Beta Edition",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "VNGEx_Config", 
      FileName = "MainConfig"
   },
   KeySystem = true,
   KeySettings = {
      Title = "VNGEx Hub | Key System",
      Subtitle = "Join Discord or use link below",
      Note = "Click 'Copy Link' and bypass to get key",
      FileName = "VNGExKey", 
      SaveKey = true, 
      GrabKeyFromSite = false, 
      Key = {"VNGEx_Namoblox_2026"}, -- Mã key sau khi vượt link
      Actions = {
            [1] = {
                Text = "Copy Key Link (Link-Center)",
                OnPress = function()
                    setclipboard("https://link-center.net/2559507/rmFeu8X2YwGf")
                end,
            }
        }
   }
})

-- [[ GLOBAL VARIABLES ]] --
_G.AutoFarm = false
_G.FastAttack = true
_G.HitboxSize = 60
_G.TweenSpeed = 300
_G.AutoFruit = false
_G.Noclip = false

local LP = game.Players.LocalPlayer
local VirtualUser = game:GetService("VirtualUser")

-- [[ ANTI-AFK ]] --
game:GetService("Players").LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- [[ UTILITIES ]] --
function TweenTo(Pos)
    if not LP.Character:FindFirstChild("HumanoidRootPart") then return end
    local Distance = (Pos.Position - LP.Character.HumanoidRootPart.Position).Magnitude
    if Distance < 15 then LP.Character.HumanoidRootPart.CFrame = Pos return end
    
    local tween = game:GetService("TweenService"):Create(LP.Character.HumanoidRootPart, 
        TweenInfo.new(Distance/_G.TweenSpeed, Enum.EasingStyle.Linear), 
        {CFrame = Pos}
    )
    if not _G.AutoFarm and not _G.AutoFruit then tween:Cancel() return end
    tween:Play()
end

-- Mẫu Quest Data Sea 1 (Namoblox có thể thêm các đảo khác vào đây)
local QuestData = {
    {Level = 0, QuestName = "Bandit Quest 1", MonsterName = "Bandit", NPCPos = CFrame.new(1059, 15, 1549), MonsterPos = CFrame.new(1061, 16, 1545)},
    {Level = 15, QuestName = "Monkey Quest 1", MonsterName = "Monkey", NPCPos = CFrame.new(-1598, 36, 153), MonsterPos = CFrame.new(-1623, 30, 140)},
}

function GetMyQuest()
    local MyLevel = LP.Data.Level.Value
    local Target = QuestData[1]
    for _, v in pairs(QuestData) do
        if MyLevel >= v.Level then Target = v end
    end
    return Target
end

-- [[ TABS ]] --
local MainTab = Window:CreateTab("Auto Farm", 4483362458)
local ItemTab = Window:CreateTab("Items & Fruits", 4483362458)
local MiscTab = Window:CreateTab("Movement & OP", 4483362458)

-- [[ FARMING LOGIC ]] --
MainTab:CreateToggle({
   Name = "Auto Farm Level (God Reach)",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFarm = Value
      if Value then
          -- Fast Attack Logic
          task.spawn(function()
              while _G.AutoFarm do
                  pcall(function()
                      local Melee = LP.Character:FindFirstChildOfClass("Tool")
                      if Melee then
                          Melee:Activate()
                          VirtualUser:Button1Down(Vector2.new(851, 158))
                      end
                  end)
                  task.wait(0.1)
              end
          end)

          -- Farm Loop
          task.spawn(function()
              while _G.AutoFarm do
                  task.wait(0.2)
                  local Current = GetMyQuest()
                  
                  if not LP.PlayerGui.Main.Quest.Visible then
                      TweenTo(Current.NPCPos)
                  else
                      -- God Reach: Đứng trên cao 15 unit vẫn trúng nhờ Hitbox
                      local FarmPos = Current.MonsterPos * CFrame.new(0, 15, 0) * CFrame.Angles(math.rad(-90), 0, 0)
                      TweenTo(FarmPos)
                      
                      -- Gom quái và Mở rộng Hitbox
                      for _, v in pairs(game.Workspace.Enemies:GetChildren()) do
                          if v.Name == Current.MonsterName and v:FindFirstChild("HumanoidRootPart") then
                              v.HumanoidRootPart.Size = Vector3.new(_G.HitboxSize, _G.HitboxSize, _G.HitboxSize)
                              v.HumanoidRootPart.CFrame = Current.MonsterPos
                              v.HumanoidRootPart.CanCollide = false
                          end
                      end
                  end
              end
          end)
      end
   end,
})

MainTab:CreateSlider({
   Name = "Hitbox Range (GOD REACH)",
   Range = {10, 100},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 60,
   Callback = function(Value) _G.HitboxSize = Value end,
})

-- [[ FRUITS & CHESTS ]] --
ItemTab:CreateToggle({
   Name = "Auto Pick Spawned Fruits",
   CurrentValue = false,
   Callback = function(Value)
      _G.AutoFruit = Value
      task.spawn(function()
          while _G.AutoFruit do
              for _, v in pairs(game.Workspace:GetChildren()) do
                  if v:IsA("Tool") and (v.Name:find("Fruit") or v:FindFirstChild("Handle")) then
                      TweenTo(v.Handle.CFrame)
                  end
              end
              task.wait(1)
          end
      end)
   end,
})

ItemTab:CreateButton({
   Name = "Instant Collect All Chests",
   Callback = function()
       for _, v in pairs(game.Workspace:GetDescendants()) do
           if v:IsA("TouchTransmitter") and v.Parent.Name:find("Chest") then
               firetouchinterest(LP.Character.HumanoidRootPart, v.Parent, 0)
               firetouchinterest(LP.Character.HumanoidRootPart, v.Parent, 1)
           end
       end
   end,
})

-- [[ MOVEMENT ]] --
MiscTab:CreateToggle({
   Name = "Noclip (Walk Through Walls)",
   CurrentValue = false,
   Callback = function(Value)
      _G.Noclip = Value
      game:GetService("RunService").Stepped:Connect(function()
          if _G.Noclip and LP.Character then
              for _, v in pairs(LP.Character:GetDescendants()) do
                  if v:IsA("BasePart") then v.CanCollide = false end
              end
          end
      end)
   end,
})

MiscTab:CreateSlider({
   Name = "WalkSpeed Hack",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) LP.Character.Humanoid.WalkSpeed = Value end,
})

Rayfield:Notify({
   Title = "VNGEx Hub Loaded",
   Content = "Welcome back, Namoblox! Script is ready.",
   Duration = 5,
})