-- Rayfield Kütüphanesi
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Linki otomatik kopyala
local keyLink = "https://sites.google.com/view/hasso-/ana-sayfa"
pcall(function()
    if setclipboard then setclipboard(keyLink) end
    if toclipboard then toclipboard(keyLink) end
end)

-- Değişkenler
local ESPEnabled = false
local ESPColor = Color3.fromRGB(255, 0, 0)
local flySpeed = 50
local isFlying = false

-- Ana Pencere ve Key Sistemi
local Window = Rayfield:CreateWindow({
   Name = "hasso pirno menü V2",
   LoadingTitle = "Domuz Mahmud Haritayı Yutuyor...",
   LoadingSubtitle = "made by hasso",
   ConfigurationSaving = { Enabled = false },
   KeySystem = true,
   KeySettings = {
      Title = "hasso hub doors | Key System",
      Subtitle = "LİNK: sites.google.com/view/hasso-",
      Note = "Link kopyalandı! Tarayıcıya yapıştır.",
      FileName = "HassoKeyV2",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"deadhasso"}, 
      Actions = {
         [1] = {
            Text = "LİNKİ TEKRAR KOPYALA",
            OnPress = function()
               setclipboard(keyLink)
            end
         }
      }
   }
})

--- ### FONKSİYONLAR (ESP) ### ---
local function CreateESP(player)
    local Highlight = Instance.new("Highlight")
    Highlight.Name = "HassoESP"
    Highlight.FillColor = ESPColor
    Highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    Highlight.FillTransparency = 0.5
    Highlight.OutlineTransparency = 0
    local function ApplyESP(char) if char then Highlight.Parent = char end end
    if player.Character then ApplyESP(player.Character) end
    player.CharacterAdded:Connect(ApplyESP)
end

task.spawn(function()
    while task.wait(1) do
        if ESPEnabled then
            for _, v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer and v.Character and not v.Character:FindFirstChild("HassoESP") then
                    CreateESP(v)
                elseif v.Character and v.Character:FindFirstChild("HassoESP") then
                    v.Character.HassoESP.FillColor = ESPColor
                end
            end
        else
            for _, v in pairs(game.Players:GetPlayers()) do
                if v.Character and v.Character:FindFirstChild("HassoESP") then v.Character.HassoESP:Destroy() end
            end
        end
    end
end)

-- SEKMELER
local MainTab = Window:CreateTab("Gonga İmha", 4483362458)
local MapTab = Window:CreateTab("Harita Bozucu", 4483362458)
local VisualTab = Window:CreateTab("ESP & Görsel", 4483362458)
local TrollTab = Window:CreateTab("Ekstra Kaos", 4483362458)

--- ### 1. GONGA İMHA ### ---
MainTab:CreateButton({
   Name = "Bring Items (FE - Herkeste Görünür)",
   Callback = function()
       for _, v in pairs(game.Workspace:GetDescendants()) do
           if v:IsA("Part") and v.Anchored == false and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
               v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
           end
       end
   end,
})

MainTab:CreateButton({
   Name = "Black Hole (Kara Delik)",
   Callback = function()
       loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-black-hole-32217"))()
   end,
})

MainTab:CreateInput({
   Name = "Kurban Adı (Gonga)",
   PlaceholderText = "İsim yaz...",
   Callback = function(Text) _G.Target = Text end,
})

MainTab:CreateToggle({
   Name = "Gonga'yı Orbit'e Al",
   CurrentValue = false,
   Callback = function(Value)
       _G.Orbiting = Value
       local rot = 0
       task.spawn(function()
           while _G.Orbiting do
               local target = game.Players:FindFirstChild(_G.Target or "")
               if target and target.Character then
                   rot = rot + 0.5
                   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, rot, 0) * CFrame.new(0, 0, 8)
               end
               task.wait()
           end
       end)
   end,
})

--- ### 2. HARİTA BOZUCU ### ---
MapTab:CreateButton({
   Name = "Haritayı Depremle (Dağıt)",
   Callback = function()
       for _, v in pairs(game.Workspace:GetDescendants()) do
           if v:IsA("BasePart") and v.Anchored == false then
               v.Velocity = Vector3.new(math.random(-150, 150), 200, math.random(-150, 150))
           end
       end
   end,
})

MapTab:CreateToggle({
   Name = "Kasırga Modu (Tornado)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Tornado = Value
       task.spawn(function()
           local rot = 0
           while _G.Tornado do
               rot = rot + 0.15
               for _, v in pairs(game.Workspace:GetDescendants()) do
                   if v:IsA("BasePart") and v.Anchored == false and not v:IsDescendantOf(game.Players.LocalPlayer.Character) then
                       v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.Angles(0, rot, 0) * CFrame.new(20, 10, 0)
                   end
               end
               task.wait()
           end
       end)
   end,
})

--- ### 3. GÖRSEL & ESP ### ---
VisualTab:CreateToggle({
   Name = "Oyuncu ESP",
   CurrentValue = false,
   Callback = function(Value) ESPEnabled = Value end,
})

VisualTab:CreateColorPicker({
    Name = "ESP Rengi",
    Color = Color3.fromRGB(255, 0, 0),
    Callback = function(Value) ESPColor = Value end,
})

VisualTab:CreateButton({
   Name = "TP Tool Al",
   Callback = function()
       local tool = Instance.new("Tool")
       tool.RequiresHandle = false
       tool.Name = "Hasso TP"
       tool.Activated:Connect(function() game.Players.LocalPlayer.Character:MoveTo(game.Players.LocalPlayer:GetMouse().Hit.p + Vector3.new(0, 3, 0)) end)
       tool.Parent = game.Players.LocalPlayer.Backpack
   end,
})

--- ### 4. EKSTRA KAOS (FLY PANELİ DAHİL) ### ---

TrollTab:CreateButton({
   Name = "Uçuş Panelini Aç (Ayrı GUI)",
   Callback = function()
       if game.CoreGui:FindFirstChild("DomuzFlyGui") then return end
       local FlyGui = Instance.new("ScreenGui", game.CoreGui); FlyGui.Name = "DomuzFlyGui"
       local Frame = Instance.new("Frame", FlyGui)
       Frame.Size = UDim2.new(0, 130, 0, 70); Frame.Position = UDim2.new(0.85, 0, 0.4, 0)
       Frame.BackgroundColor3 = Color3.fromRGB(30, 0, 0); Frame.Active = true; Frame.Draggable = true
       local Btn = Instance.new("TextButton", Frame)
       Btn.Size = UDim2.new(1, 0, 1, 0); Btn.Text = "UÇUŞ: OFF"; Btn.TextColor3 = Color3.new(1,1,1); Btn.BackgroundTransparency = 0.5
       Btn.MouseButton1Click:Connect(function()
           isFlying = not isFlying
           local char = game.Players.LocalPlayer.Character
           if isFlying then
               Btn.Text = "UÇUŞ: ON"; Btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
               local bv = Instance.new("BodyVelocity", char.HumanoidRootPart); bv.Name = "FlyV"; bv.maxForce = Vector3.new(9e9, 9e9, 9e9)
               local bg = Instance.new("BodyGyro", char.HumanoidRootPart); bg.Name = "FlyG"; bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
               task.spawn(function()
                   while isFlying do
                       bv.velocity = workspace.CurrentCamera.CFrame.LookVector * flySpeed
                       bg.cframe = workspace.CurrentCamera.CFrame
                       task.wait()
                   end
                   if bv then bv:Destroy() end; if bg then bg:Destroy() end
               end)
           else
               Btn.Text = "UÇUŞ: OFF"; Btn.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
           end
       end)
   end,
})

TrollTab:CreateSlider({
   Name = "Uçuş Hızı",
   Range = {10, 500},
   Increment = 10,
   CurrentValue = 50,
   Callback = function(Value) flySpeed = Value end,
})

TrollTab:CreateToggle({
   Name = "Hacker Gülüşü",
   CurrentValue = false,
   Callback = function(Value)
       _G.Laugh = Value
       task.spawn(function()
           while _G.Laugh do
               local char = game.Players.LocalPlayer.Character
               if char and char:FindFirstChild("HumanoidRootPart") then
                   char.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame * CFrame.Angles(math.rad(math.random(-15,15)), math.rad(math.random(-15,15)), 0)
               end
               task.wait(0.05)
           end
       end)
   end,
})

TrollTab:CreateToggle({
   Name = "Domuz Mahmud Spam",
   CurrentValue = false,
   Callback = function(Value)
       _G.Spamming = Value
       local msgs = {"DOMUZ MAHMUD GELİYO!", "GONGA KAÇACAK YER ARASIN!", "HASSO HARİTAYI BOZDU!"}
       task.spawn(function()
           while _G.Spamming do
               if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then
                   game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(msgs[math.random(1,#msgs)])
               else
                   game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msgs[math.random(1,#msgs)], "All")
               end
               task.wait(1.5)
           end
       end)
   end,
})

Rayfield:Notify({Title = "hasso pirno menü V2", Content = "DomuzFlyGui ve diğerleri hazır!", Duration = 5})