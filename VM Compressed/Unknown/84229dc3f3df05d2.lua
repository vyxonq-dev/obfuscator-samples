-- [[ 1. AUTO-COPY DISCORD LINK ON EXECUTION ]]
setclipboard("https://discord.gg/7gb9u25KjN")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- [[ 2. STAFF BYPASS ]]
local Player = game.Players.LocalPlayer
local PlayerNameLower = Player.Name:lower()
local IsStaff = false
local MyRank = "User"

local StaffList = {
    ["sussybak995696"] = "Owner 👑",
    ["oweniscertified"] = "Advertiser 📢" 
}

if StaffList[PlayerNameLower] then
    IsStaff = true
    MyRank = StaffList[PlayerNameLower]
end

-- [[ 3. WINDOW SETUP ]]
local Window = Rayfield:CreateWindow({
   Name = "ONE TAP HUB | v2.0",
   LoadingTitle = "Loading One Tap Hub...",
   LoadingSubtitle = "by Roy aich",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "OneTapHub",
      FileName = "Config"
   },
   Discord = {
      Enabled = true,
      Invite = "7gb9u25KjN",
      RememberJoins = true 
   },
   KeySystem = not IsStaff,
   KeySettings = {
      Title = "ONE TAP HUB | KEY SYSTEM",
      Subtitle = "discord.gg/7gb9u25KjN", -- Centered like your drawing
      Note = "Join Discord for Key!",
      FileName = "OneTapKey",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"OT-X92-K5P-R7B"} 
   }
})

-- Notify user that the link was copied automatically
Rayfield:Notify({
    Title = "Link Copied!",
    Content = "Discord link copied to clipboard. Paste it to get your key!",
    Duration = 5,
    Image = 4483362458,
})

-- [[ 4. TABS ]]
local HomeTab = Window:CreateTab("Home", 4483362458)
local CombatTab = Window:CreateTab("Combat", 4483362458)
local VisualsTab = Window:CreateTab("Visuals", 4483362458)

-- [[ HOME TAB ]]
HomeTab:CreateSection("User Info")
HomeTab:CreateLabel("Welcome, " .. Player.Name)
HomeTab:CreateLabel("Rank: " .. MyRank)

HomeTab:CreateSection("Community")
HomeTab:CreateButton({
   Name = "Copy Discord Link Again",
   Callback = function()
      setclipboard("https://discord.gg/7gb9u25KjN")
      Rayfield:Notify({Title = "Success!", Content = "Link copied!", Duration = 3})
   end,
})

-- [[ COMBAT TAB ]]
CombatTab:CreateSection("Aimbot")
_G.AimbotEnabled = false
_G.AimbotSmoothness = 5

CombatTab:CreateToggle({
   Name = "Aimbot (Wall Check)",
   CurrentValue = false,
   Callback = function(Value) _G.AimbotEnabled = Value end,
})

CombatTab:CreateSlider({
   Name = "Aimbot Smoothness",
   Range = {1, 10},
   Increment = 1,
   CurrentValue = 5,
   Callback = function(Value) _G.AimbotSmoothness = Value end,
})

-- [[ VISUALS TAB ]]
VisualsTab:CreateSection("ESP")
VisualsTab:CreateToggle({
   Name = "Neon Green Highlight",
   CurrentValue = false,
   Callback = function(Value)
      _G.ESPEnabled = Value
      while _G.ESPEnabled do
         for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= Player and v.Character then
               local hl = v.Character:FindFirstChild("Highlight") or Instance.new("Highlight", v.Character)
               hl.FillColor = Color3.fromRGB(0, 255, 0)
               hl.OutlineColor = Color3.fromRGB(255, 255, 255)
               hl.FillTransparency = 0.4
               hl.OutlineTransparency = 0
               hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            end
         end
         task.wait(1)
         if not _G.ESPEnabled then
            for _, v in pairs(game.Players:GetPlayers()) do
               if v.Character and v.Character:FindFirstChild("Highlight") then v.Character.Highlight:Destroy() end
            end
         end
      end
   end,
})

-- [[ AIMBOT LOGIC WITH WALL CHECK ]]
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AimbotEnabled then
        local Target = nil
        local ShortestDist = math.huge
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= Player and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.Humanoid.Health > 0 then
                local Pos, OnScreen = game.Workspace.CurrentCamera:WorldToViewportPoint(v.Character.HumanoidRootPart.Position)
                if OnScreen then
                    local Mag = (Vector2.new(Pos.X, Pos.Y) - Vector2.new(game.Workspace.CurrentCamera.ViewportSize.X/2, game.Workspace.CurrentCamera.ViewportSize.Y/2)).Magnitude
                    if Mag < ShortestDist then
                        -- Wall Check
                        local RayOrigin = game.Workspace.CurrentCamera.CFrame.Position
                        local RayDir = (v.Character.HumanoidRootPart.Position - RayOrigin).Unit * 500
                        local Params = RaycastParams.new()
                        Params.FilterDescendantsInstances = {Player.Character, game.Workspace.CurrentCamera}
                        Params.FilterType = Enum.RaycastFilterType.Exclude
                        local Result = game.Workspace:Raycast(RayOrigin, RayDir, Params)
                        if Result and Result.Instance:IsDescendantOf(v.Character) then
                            ShortestDist = Mag
                            Target = v.Character.HumanoidRootPart
                        end
                    end
                end
            end
        end
        if Target then
            local LookAt = CFrame.new(game.Workspace.CurrentCamera.CFrame.Position, Target.Position)
            game.Workspace.CurrentCamera.CFrame = game.Workspace.CurrentCamera.CFrame:Lerp(LookAt, 1/_G.AimbotSmoothness)
        end
    end
end)

