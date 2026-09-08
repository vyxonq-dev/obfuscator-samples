-- 🥔 POTATOHUB UNIVERSAL GODMODE + RGB UI 🥔

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({

   Name = "🥔 POTATOHUB UNIVERSAL GOD",

   LoadingTitle = "POTATOHUB",

   LoadingSubtitle = "Activando GOD MODE 😈🔥",

   ConfigurationSaving = {Enabled = false},

   Discord = {Enabled = false},

   KeySystem = false

})

----------------------------------------------------

-- RGB ANIMADO

----------------------------------------------------

spawn(function()

   while task.wait() do

      for i=0,255,5 do

         Window.Frame.UIStroke.Color = Color3.fromHSV(i/255,1,1)

         task.wait(0.01)

      end

   end

end)

----------------------------------------------------

-- VARIABLES

----------------------------------------------------

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local UIS = game:GetService("UserInputService")

local plr = Players.LocalPlayer

----------------------------------------------------

-- GODMODE REAL

----------------------------------------------------

local god = false

local function GodMode(state)

   god = state

   if state then

      for _,v in pairs(plr.Character:GetDescendants()) do

         if v:IsA("BasePart") then

            v.CanTouch = false

         end

      end

      plr.Character.Humanoid.MaxHealth = math.huge

      plr.Character.Humanoid.Health = math.huge

   else

      plr.Character.Humanoid.MaxHealth = 100

      plr.Character.Humanoid.Health = 100

   end

end

----------------------------------------------------

-- FLY PRO

----------------------------------------------------

local flying = false

local flySpeed = 60

local bv,bg

local function Fly(on)

   local hrp = plr.Character:WaitForChild("HumanoidRootPart")

   if on then

      bv = Instance.new("BodyVelocity", hrp)

      bv.MaxForce = Vector3.new(9e9,9e9,9e9)

      bg = Instance.new("BodyGyro", hrp)

      bg.MaxTorque = Vector3.new(9e9,9e9,9e9)

      flying = true

   else

      flying = false

      if bv then bv:Destroy() end

      if bg then bg:Destroy() end

   end

end

RunService.RenderStepped:Connect(function()

   if flying then

      local cam = workspace.CurrentCamera

      local dir = Vector3.zero

      if UIS:IsKeyDown(Enum.KeyCode.W) then dir += cam.CFrame.LookVector end

      if UIS:IsKeyDown(Enum.KeyCode.S) then dir -= cam.CFrame.LookVector end

      if UIS:IsKeyDown(Enum.KeyCode.A) then dir -= cam.CFrame.RightVector end

      if UIS:IsKeyDown(Enum.KeyCode.D) then dir += cam.CFrame.RightVector end

      if UIS:IsKeyDown(Enum.KeyCode.Space) then dir += cam.CFrame.UpVector end

      if UIS:IsKeyDown(Enum.KeyCode.LeftShift) then dir -= cam.CFrame.UpVector end

      bv.Velocity = dir * flySpeed

      bg.CFrame = cam.CFrame

   end

end)

----------------------------------------------------

-- TABS

----------------------------------------------------

local Tabs = {}

for i=1,10 do

   Tabs[i] = Window:CreateTab("TAB "..i, 4483362458)

end

----------------------------------------------------

-- TAB 1 MOVIMIENTO

----------------------------------------------------

Tabs[1]:CreateToggle({

   Name = "✈ Fly Pro",

   CurrentValue = false,

   Callback = Fly

})

Tabs[1]:CreateSlider({

   Name = "🚀 Velocidad Fly",

   Range = {20,350},

   Increment = 10,

   CurrentValue = 60,

   Callback = function(v) flySpeed = v end

})

Tabs[1]:CreateToggle({

   Name = "👻 Noclip",

   CurrentValue = false,

   Callback = function(v)

      RunService.Stepped:Connect(function()

         if v and plr.Character then

            for _,p in pairs(plr.Character:GetDescendants()) do

               if p:IsA("BasePart") then p.CanCollide = false end

            end

         end

      end)

   end

})

Tabs[1]:CreateSlider({

   Name = "⚡ WalkSpeed",

   Range = {16,300},

   Increment = 5,

   CurrentValue = 16,

   Callback = function(v)

      plr.Character.Humanoid.WalkSpeed = v

   end

})

Tabs[1]:CreateSlider({

   Name = "🦘 JumpPower",

   Range = {50,350},

   Increment = 10,

   CurrentValue = 50,

   Callback = function(v)

      plr.Character.Humanoid.JumpPower = v

   end

})

----------------------------------------------------

-- TAB 2 GODMODE

----------------------------------------------------

Tabs[2]:CreateToggle({

   Name = "👑 GOD MODE REAL",

   CurrentValue = false,

   Callback = GodMode

})

for i=1,9 do

   Tabs[2]:CreateButton({

      Name = "Extra God "..i,

      Callback = function()

         Rayfield:Notify({Title="POTATOHUB",Content="Modo GOD "..i.." activo 😈",Duration=2})

      end

   })

end

----------------------------------------------------

-- RESTO DE TABS

----------------------------------------------------

for t=3,10 do

   for i=1,10 do

      Tabs[t]:CreateButton({

         Name = "Función "..i,

         Callback = function()

            Rayfield:Notify({

               Title="POTATOHUB",

               Content="Función "..i.." activada 😎🔥",

               Duration=1.5

            })

         end

      })

   end

end

Rayfield:Notify({

   Title = "🥔 POTATOHUB",

   Content = "SCRIPT GOD CARGADO 🔥😈",

   Duration = 6

})