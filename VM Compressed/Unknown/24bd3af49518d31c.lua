local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local win = Rayfield:CreateWindow({
   Name = "BC9 hub",
   LoadingTitle = "BC9 hub",
   LoadingSubtitle = "by @BC_rider9",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "bc9_configs",
      FileName = "main"
   },
   KeySystem = false
})

-- tabs
local main = win:CreateTab("Main", 4483362458)
local ui_settings = win:CreateTab("UI Settings", 4483362458)

-- teleports
main:CreateSection("Teleports")

main:CreateButton({
   Name = "Teleport To OG",
   Callback = function()
      local lp = game.Players.LocalPlayer
      if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
         lp.Character.HumanoidRootPart.CFrame = CFrame.new(-5, 6750, 3292)
      end
   end,
})

main:CreateButton({
   Name = "Teleport Back",
   Callback = function()
      local lp = game.Players.LocalPlayer
      if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
         lp.Character.HumanoidRootPart.CFrame = CFrame.new(-23, 7617, 36)
      end
   end,
})

-- oxygen
main:CreateSection("Oxygen")

local inf_oxy = true
main:CreateToggle({
   Name = "Infinite oxygen",
   CurrentValue = true,
   Flag = "inf_oxy_flag",
   Callback = function(v)
      inf_oxy = v
   end,
})

-- loop logic
task.spawn(function()
    local lp = game.Players.LocalPlayer
    while task.wait(0.1) do
        if inf_oxy and lp:GetAttribute("InZone") == true then
            lp:SetAttribute("InZone", false)
        end
    end
end)

-- settings
ui_settings:CreateSection("Menu")

ui_settings:CreateButton({
   Name = "Unload",
   Callback = function()
      Rayfield:Destroy()
   end,
})

Rayfield:Notify({
   Title = "BC9 hub",
   Content = "Loaded! Credits to @BC_rider9",
   Duration = 4
})
