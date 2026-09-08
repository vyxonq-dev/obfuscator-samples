local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
 Name = "Brainrot Army",
 LoadingTitle = "Rayfield Interface",
 LoadingSubtitle = "by GANTJENK",
 ConfigurationSaving = { Enabled = false }
})

local MainTab = Window:CreateTab("Main", 4483362458)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local autoFarm = false
local farmDelay = 0.1

MainTab:CreateSection("Automatically")

MainTab:CreateToggle({
 Name = "Auto Rebirth",
 CurrentValue = false,
 Callback = function(value)
  autoFarm = value
  if value then
   task.spawn(function()
    while autoFarm do
     pcall(function()
      local info = ReplicatedStorage.Remotes.GetRebirthInfo:InvokeServer()
      local required = 1e180

      if info and info.RequiredCash ~= nil then
       local cash = info.RequiredCash
       if type(cash) == "number" then
        required = cash
       elseif type(cash) == "string" then
        -- coba ubah string jadi number
        local n = tonumber(cash)
        if n then
         required = n
        end
       end
      end

      -- gunakan nilai aman jika tidak valid
      if typeof(required) ~= "number" or required <= 0 then
       required = 1e180
      end

      ReplicatedStorage.Remotes.CrateDestroyed:FireServer(required)
      ReplicatedStorage.Remotes.Rebirth:FireServer()
     end)
     task.wait(farmDelay)
    end
   end)
  end
 end
})

MainTab:CreateSection("Manually")

MainTab:CreateButton({
 Name = "Inf Money",
 Callback = function()
  pcall(function()
   local info = ReplicatedStorage.Remotes.GetRebirthInfo:InvokeServer()
   local required = 1e180

   if info and info.RequiredCash ~= nil then
    local cash = info.RequiredCash
    if type(cash) == "number" then
     required = cash
    elseif type(cash) == "string" then
     local n = tonumber(cash)
     if n then
      required = n
     end
    end
   end

   if typeof(required) ~= "number" or required <= 0 then
    required = 1e180
   end

   ReplicatedStorage.Remotes.CrateDestroyed:FireServer(required)
  end)
 end
})

MainTab:CreateButton({
 Name = "Upgrade Spawn Tier",
 Callback = function()
  pcall(function()
   ReplicatedStorage.Remotes.UpgradeSpawnTier:FireServer()
  end)
 end
})

MainTab:CreateButton({
 Name = "Rebirth",
 Callback = function()
  pcall(function()
   ReplicatedStorage.Remotes.Rebirth:FireServer()
  end)
 end
})

MainTab:CreateButton({
 Name = "Buy Brainrot",
 Callback = function()
  pcall(function()
   ReplicatedStorage.Remotes.BuyBrainrot:FireServer(3)
  end)
 end
})
