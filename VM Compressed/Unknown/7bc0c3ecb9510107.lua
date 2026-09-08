local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local Target = nil
local CamLockEnabled = false

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "Durian Hub Cam lock",
   LoadingTitle = "Durian Hub Cam Lock",
   LoadingSubtitle = "by Durian_BruhRBLX",
   ConfigurationSaving = {Enabled = false},
   KeySystem = true,
   KeySettings = {
      Title = "Durian Hub Cam lock",
      Subtitle = "Enter your key to continue",
      Note = "The key is Durian",
      FileName = "CamLockKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Durian"}
   }
})

local MainTab = Window:CreateTab("Main", 4483362458)
local Toggle = MainTab:CreateToggle({
   Name = "Enable Cam Lock",
   CurrentValue = false,
   Flag = "CamLock",
   Callback = function(Value)
      CamLockEnabled = Value
      if not Value then
         Target = nil
         if ScreenLabel then
            ScreenLabel.Text = "Distance|Health|Player Username"
         end
      end
   end,
})

local function GetPlayerNames()
    local names = {}
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            table.insert(names, plr.Name)
        end
    end
    return names
end

local PlayerDropdown = MainTab:CreateDropdown({
   Name = "Select Player",
   Options = GetPlayerNames(),
   CurrentOption = {},
   Flag = "PlayerDropdown",
   Callback = function(Option)
      if typeof(Option) == "table" then
         if Option[1] == "Deselect" then
            Target = nil
            if ScreenLabel then ScreenLabel.Text = "" end
         else
            Target = Players:FindFirstChild(Option[1])
         end
      else
         if Option == "Deselect" then
            Target = nil
            if ScreenLabel then ScreenLabel.Text = "" end
         else
            Target = Players:FindFirstChild(Option)
         end
      end
   end,
})

MainTab:CreateButton({
   Name = "Refresh Player List",
   Callback = function()
      local options = GetPlayerNames()
      table.insert(options, 1, "Deselect")
      PlayerDropdown.Options = options
   end,
})

local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local ScreenLabel = Instance.new("TextLabel", ScreenGui)
ScreenLabel.Size = UDim2.new(0, 300, 0, 50)
ScreenLabel.Position = getgenv().SavedHUDPos or UDim2.new(1, -310, 0, 10)
ScreenLabel.BackgroundTransparency = 0.3
ScreenLabel.BackgroundColor3 = Color3.new(0, 0, 0)
ScreenLabel.TextColor3 = Color3.new(1, 1, 1)
ScreenLabel.TextScaled = true
ScreenLabel.Visible = true
ScreenLabel.Text = ""
ScreenLabel.Active = true
ScreenLabel.Draggable = true

ScreenLabel:GetPropertyChangedSignal("Position"):Connect(function()
   getgenv().SavedHUDPos = ScreenLabel.Position
end)

local function GetNearestPlayer()
    local closest, dist = nil, math.huge
    for _, plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer and plr.Character and plr.Character:FindFirstChild("Head") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Head") then
            local mag = (plr.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude
            if mag < dist then
                dist = mag
                closest = plr
            end
        end
    end
    return closest
end

local function UpdateHUD()
    if CamLockEnabled and Target and Target.Character and Target.Character:FindFirstChild("Head") then
        local dist = math.floor((Target.Character.Head.Position - LocalPlayer.Character.Head.Position).Magnitude)
        local hum = Target.Character:FindFirstChildOfClass("Humanoid")
        local hp = hum and math.floor(hum.Health) or 0
        local maxhp = hum and math.floor(hum.MaxHealth) or 100
        local ratio = hp / maxhp
        ScreenLabel.Text = Target.Name.." | "..dist.." studs | "..hp.."/"..maxhp.." HP"
        if ratio > 0.7 then
            ScreenLabel.TextColor3 = Color3.new(0, 1, 0)
        elseif ratio > 0.3 then
            ScreenLabel.TextColor3 = Color3.new(1, 1, 0)
        else
            ScreenLabel.TextColor3 = Color3.new(1, 0, 0)
        end
    else
        ScreenLabel.Text = ""
    end
end

RunService.RenderStepped:Connect(function()
   if CamLockEnabled then
      if (not Target) or (not Target.Character) or (not Target.Character:FindFirstChild("Head")) then
         Target = GetNearestPlayer()
      end
      if Target and Target.Character and Target.Character:FindFirstChild("Head") then
         Camera.CFrame = CFrame.new(Camera.CFrame.Position, Target.Character.Head.Position)
      end
   end
   UpdateHUD()
end)

LocalPlayer.CharacterAdded:Connect(function()
   task.wait(1)
   if CamLockEnabled then
      Target = GetNearestPlayer()
   end
end)