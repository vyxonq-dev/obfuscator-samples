-- DarkEvade Script | Nextbot GOD++
-- Mobile + Key System
-- By DarkStyleScripts99

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

--------------------------------------------------
-- KEY SYSTEM
--------------------------------------------------
local Window = Rayfield:CreateWindow({
   Name = "DarkEvade Script 😈",
   LoadingTitle = "DarkEvade Mobile",
   LoadingSubtitle = "By DarkStyleScripts99",
   Theme = "Dark",
   KeySystem = true,
   KeySettings = {
      Title = "DarkEvade | Key System",
      Subtitle = "Digite a Key",
      Note = "Key gratuita",
      FileName = "DarkEvadeKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"DarkSytleFree"}
   }
})

--------------------------------------------------
-- SERVIÇOS
--------------------------------------------------
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer

--------------------------------------------------
-- UI PREMIUM (BLUR + GLOW)
--------------------------------------------------
local blur = Instance.new("BlurEffect", Lighting)
blur.Size = 0
TweenService:Create(
   blur,
   TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
   {Size = 12}
):Play()

--------------------------------------------------
-- ESTADOS
--------------------------------------------------
local speed, jump, noclip = false,false,false
local evade, antiLock = false,false

-- Nextbot
local antiNextbot = false
local nextbotESP = false
local nextbotAlert = false
local nextbotSound = false
local autoDashNB = false
local freezeNB = false
local nextbotBoxESP = false
local smartEvade = false

--------------------------------------------------
-- UI
--------------------------------------------------
local MovementTab = Window:CreateTab("Movement ⚡", 4483362458)
local EvadeTab = Window:CreateTab("Evade 😈", 4483362458)
local NextbotTab = Window:CreateTab("Nextbot 🤖", 4483362458)

MovementTab:CreateToggle({Name="Super Velocidade",Callback=function(v) speed=v end})
MovementTab:CreateToggle({Name="Super Pulo",Callback=function(v) jump=v end})
MovementTab:CreateToggle({Name="Noclip",Callback=function(v) noclip=v end})

EvadeTab:CreateToggle({Name="Auto Evade",Callback=function(v) evade=v end})
EvadeTab:CreateToggle({Name="Anti Lock",Callback=function(v) antiLock=v end})

NextbotTab:CreateToggle({Name="Anti Colisão Nextbot",Callback=function(v) antiNextbot=v end})
NextbotTab:CreateToggle({Name="ESP Nome + Distância",Callback=function(v) nextbotESP=v end})
NextbotTab:CreateToggle({Name="ESP Box 3D",Callback=function(v) nextbotBoxESP=v end})
NextbotTab:CreateToggle({Name="Alerta Visual",Callback=function(v) nextbotAlert=v end})
NextbotTab:CreateToggle({Name="Alerta Sonoro",Callback=function(v) nextbotSound=v end})
NextbotTab:CreateToggle({Name="IA Auto Desvio",Callback=function(v) autoDashNB=v end})
NextbotTab:CreateToggle({Name="IA Rota Segura (Smart)",Callback=function(v) smartEvade=v end})
NextbotTab:CreateToggle({Name="Freeze Nextbot (Visual)",Callback=function(v) freezeNB=v end})

--------------------------------------------------
-- FUNÇÕES
--------------------------------------------------
local function evadeMove(dir)
   local c = LocalPlayer.Character
   local hrp = c and c:FindFirstChild("HumanoidRootPart")
   if hrp then
      local d = dir or Vector3.new(
         math.random(-1,1),
         0,
         math.random(-1,1)
      )
      hrp.AssemblyLinearVelocity = d.Unit * 160 + Vector3.new(0,80,0)
   end
end

local function isNextbot(model)
   if Players:GetPlayerFromCharacter(model) then return false end
   return model:IsA("Model") and model:FindFirstChildOfClass("Humanoid")
end

local function playAlertSound()
   local s = Instance.new("Sound", workspace)
   s.SoundId = "rbxassetid://9118823101"
   s.Volume = 3
   s:Play()
   game.Debris:AddItem(s,2)
end

local function createBillboard(model, text)
   if model:FindFirstChild("NB_Billboard") then return end
   local bb = Instance.new("BillboardGui", model)
   bb.Name = "NB_Billboard"
   bb.Size = UDim2.new(0,220,0,45)
   bb.AlwaysOnTop = true
   bb.StudsOffset = Vector3.new(0,3,0)

   local lbl = Instance.new("TextLabel", bb)
   lbl.Size = UDim2.new(1,0,1,0)
   lbl.BackgroundTransparency = 1
   lbl.TextColor3 = Color3.fromRGB(255,60,60)
   lbl.TextStrokeTransparency = 0
   lbl.TextScaled = true
   lbl.Font = Enum.Font.GothamBold
   lbl.Text = text
end

local function createBoxESP(model)
   if model:FindFirstChild("NB_BoxESP") then return end
   local part = model:FindFirstChildWhichIsA("BasePart")
   if not part then return end

   local box = Instance.new("BoxHandleAdornment")
   box.Name = "NB_BoxESP"
   box.Adornee = part
   box.AlwaysOnTop = true
   box.ZIndex = 5
   box.Color3 = Color3.fromRGB(255,0,0)
   box.Transparency = 0.4
   box.Size = model:GetExtentsSize()
   box.Parent = model
end

--------------------------------------------------
-- SMART EVADE (IA ROTA SEGURA)
--------------------------------------------------
local function smartEvadeAI()
   local c = LocalPlayer.Character
   local hrp = c and c:FindFirstChild("HumanoidRootPart")
   if not hrp then return end

   local nearest, dist = nil, math.huge
   for _,m in pairs(workspace:GetDescendants()) do
      if isNextbot(m) then
         local r = m:FindFirstChildWhichIsA("BasePart")
         if r then
            local d = (hrp.Position - r.Position).Magnitude
            if d < dist then
               dist = d
               nearest = r
            end
         end
      end
   end

   if nearest and dist < 25 then
      local dir = (hrp.Position - nearest.Position).Unit
      local params = RaycastParams.new()
      params.FilterDescendantsInstances = {c}
      params.FilterType = Enum.RaycastFilterType.Blacklist

      local hit = workspace:Raycast(hrp.Position, dir * 35, params)
      if hit then
         dir = Vector3.new(dir.Z,0,-dir.X)
      end
      evadeMove(dir)
   end
end

--------------------------------------------------
-- LOOP PRINCIPAL
--------------------------------------------------
RunService.RenderStepped:Connect(function()
   local c = LocalPlayer.Character
   local hum = c and c:FindFirstChild("Humanoid")
   local hrp = c and c:FindFirstChild("HumanoidRootPart")

   if hum then
      hum.WalkSpeed = speed and 110 or 16
      hum.JumpPower = jump and 155 or 50
   end

   if noclip and c then
      for _,p in pairs(c:GetDescendants()) do
         if p:IsA("BasePart") then p.CanCollide=false end
      end
   end

   if evade then evadeMove() end
   if antiLock and hrp then
      hrp.AssemblyLinearVelocity += Vector3.new(math.random(-15,15),0,math.random(-15,15))
   end
   if smartEvade then smartEvadeAI() end

   for _,m in pairs(workspace:GetDescendants()) do
      if isNextbot(m) then
         local root = m:FindFirstChildWhichIsA("BasePart")
         if root and hrp then
            local dist = (hrp.Position-root.Position).Magnitude

            if antiNextbot then
               for _,bp in pairs(m:GetDescendants()) do
                  if bp:IsA("BasePart") then bp.CanCollide=false end
               end
            end

            if freezeNB then root.Anchored=true else root.Anchored=false end

            if nextbotESP then
               createBillboard(m, m.Name.." | "..math.floor(dist).."m")
            elseif m:FindFirstChild("NB_Billboard") then
               m.NB_Billboard:Destroy()
            end

            if nextbotBoxESP then
               createBoxESP(m)
            elseif m:FindFirstChild("NB_BoxESP") then
               m.NB_BoxESP:Destroy()
            end

            if dist < 20 then
               if nextbotAlert then
                  Rayfield:Notify({Title="⚠️ NEXTBOT",Content="Muito perto!",Duration=1})
               end
               if nextbotSound then playAlertSound() end
               if autoDashNB then evadeMove() end
            end
         end
      end
   end
end)

--------------------------------------------------
-- BOTÃO MOBILE DASH (GLOW)
--------------------------------------------------
local gui = Instance.new("ScreenGui", game.CoreGui)
local btn = Instance.new("TextButton", gui)
btn.Size = UDim2.new(0,120,0,120)
btn.Position = UDim2.new(0.75,0,0.6,0)
btn.Text = "DASH"
btn.TextScaled = true
btn.Font = Enum.Font.GothamBold
btn.BackgroundColor3 = Color3.fromRGB(20,20,20)
btn.TextColor3 = Color3.fromRGB(255,0,0)
btn.BorderSizePixel = 0
btn.MouseButton1Click:Connect(evadeMove)

TweenService:Create(
   btn,
   TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
   {BackgroundColor3 = Color3.fromRGB(255,40,40)}
):Play()
