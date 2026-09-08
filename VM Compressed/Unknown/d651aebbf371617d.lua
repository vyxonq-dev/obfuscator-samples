local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "JS MENU | MEGA EDITION",
   LoadingTitle = "JS MENU BY JORDAN",
   LoadingSubtitle = "Fly & Stalk Build",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "JordanJS_Config", 
      FileName = "JS_Mega_Settings"
   },
   KeySystem = false 
})

-- [[ TABS ]] --
local CombatTab = Window:CreateTab("Combat", 4483362458)
local MoveTab = Window:CreateTab("Movement", 4483345998)
local TPTab = Window:CreateTab("TP Control", 4483345998)
local VisualsTab = Window:CreateTab("Visuals", 4483362143)

-- [[ TARGET SELECTION ]] --
local SelectedPlayer = nil
local function GetPlayerNames()
    local names = {}
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= game.Players.LocalPlayer then table.insert(names, p.Name) end
    end
    return names
end

local PlayerDropdown = TPTab:CreateDropdown({
   Name = "Select Target Player",
   Options = GetPlayerNames(),
   CurrentOption = "",
   Callback = function(Option) SelectedPlayer = Option[1] end,
})

TPTab:CreateButton({
    Name = "Refresh Player List",
    Callback = function() PlayerDropdown:Refresh(GetPlayerNames()) end
})

-- [[ TP & STALK LOGIC ]] --
TPTab:CreateButton({
   Name = "TP (Teleport to Player)",
   Callback = function()
      if SelectedPlayer then
          local target = game.Players:FindFirstChild(SelectedPlayer)
          if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
              game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame
          end
      end
   end,
})

local StalkActive = false
TPTab:CreateToggle({
   Name = "Stay Behind Enemy",
   CurrentValue = false,
   Callback = function(v)
      StalkActive = v
      task.spawn(function()
          while StalkActive do
              task.wait()
              if SelectedPlayer then
                  local target = game.Players:FindFirstChild(SelectedPlayer)
                  local lpChar = game.Players.LocalPlayer.Character
                  if target and target.Character and lpChar and lpChar:FindFirstChild("HumanoidRootPart") then
                      lpChar.HumanoidRootPart.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
                  end
              end
          end
      end)
   end,
})

-- [[ MOVEMENT: WASD FLY, SPEED & NOCLIP ]] --
local flySpeed = 50
local flying = false
local noclip = false

MoveTab:CreateSlider({
   Name = "Walk Speed",
   Range = {16, 500},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(v)
        if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
           game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
        end
   end,
})

MoveTab:CreateSlider({
   Name = "WASD Fly Speed",
   Range = {10, 500},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(v) flySpeed = v end,
})

MoveTab:CreateToggle({
   Name = "Enable WASD Fly",
   CurrentValue = false,
   Callback = function(v)
      flying = v
      if flying then
          task.spawn(function()
              local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
              local lp = char:WaitForChild("HumanoidRootPart")
              local bv = Instance.new("BodyVelocity", lp)
              local bg = Instance.new("BodyGyro", lp)
              
              bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
              bg.MaxTorque = Vector3.new(1e9, 1e9, 1e9)
              bg.P = 9e4
              
              while flying do
                  task.wait()
                  local cam = workspace.CurrentCamera.CFrame
                  local moveDir = Vector3.new(0,0,0)
                  
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.W) then moveDir = moveDir + cam.LookVector end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.S) then moveDir = moveDir - cam.LookVector end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.A) then moveDir = moveDir - cam.RightVector end
                  if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.D) then moveDir = moveDir + cam.RightVector end
                  
                  bv.Velocity = moveDir * flySpeed
                  bg.CFrame = cam
              end
              bv:Destroy()
              bg:Destroy()
          end)
      end
   end,
})

-- NOCLIP LOGIC --
MoveTab:CreateToggle({
   Name = "Noclip",
   CurrentValue = false,
   Callback = function(v)
      noclip = v
   end,
})

game:GetService("RunService").Stepped:Connect(function()
    if noclip then
        local char = game.Players.LocalPlayer.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)

-- [[ COMBAT: FOV BODY LOCK ]] --
local AimbotEnabled = false
local FOVSize = 180
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2; FOVCircle.Color = Color3.fromRGB(0, 170, 255); FOVCircle.Visible = false

CombatTab:CreateToggle({Name = "Enable FOV Aimbot", CurrentValue = false, Callback = function(v) AimbotEnabled = v; FOVCircle.Visible = v end})
CombatTab:CreateSlider({Name = "FOV Radius", Range = {50, 800}, Increment = 1, CurrentValue = 180, Callback = function(v) FOVSize = v; FOVCircle.Radius = v end})

game:GetService("RunService").RenderStepped:Connect(function()
    FOVCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
    if AimbotEnabled and game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
        local target = nil; local dist = FOVSize
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= game.Players.LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local pos, vis = workspace.CurrentCamera:WorldToViewportPoint(p.Character.HumanoidRootPart.Position)
                local mag = (Vector2.new(pos.X, pos.Y) - game:GetService("UserInputService"):GetMouseLocation()).Magnitude
                if mag < dist and vis then dist = mag; target = p end
            end
        end
        if target then workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, target.Character.HumanoidRootPart.Position) end
    end
end)

-- [[ VISUALS: PERSISTENT ESP ]] --
_G.espEnabled = false
local function ApplyESP(p)
    if p == game.Players.LocalPlayer then return end
    p.CharacterAdded:Connect(function(char)
        if _G.espEnabled then
            task.wait(0.5)
            if char:FindFirstChild("JS_Highlight") then char.JS_Highlight:Destroy() end
            local h = Instance.new("Highlight", char)
            h.Name = "JS_Highlight"; h.FillColor = Color3.fromRGB(0, 170, 255); h.Enabled = true
        end
    end)
    if p.Character and _G.espEnabled then
        local h = Instance.new("Highlight", p.Character)
        h.Name = "JS_Highlight"; h.FillColor = Color3.fromRGB(0, 170, 255); h.Enabled = true
    end
end

VisualsTab:CreateToggle({
   Name = "Persistent Box ESP",
   CurrentValue = false,
   Callback = function(v)
      _G.espEnabled = v
      for _, p in pairs(game.Players:GetPlayers()) do
          if v then ApplyESP(p) else
              if p.Character and p.Character:FindFirstChild("JS_Highlight") then p.Character.JS_Highlight:Destroy() end
          end
      end
   end,
})

game.Players.PlayerAdded:Connect(ApplyESP)
for _, p in pairs(game.Players:GetPlayers()) do ApplyESP(p) end

Rayfield:Notify({Title = "JS MENU LOADED", Content = "Fly, Stalk & Noclip Online!", Duration = 5})