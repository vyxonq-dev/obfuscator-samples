local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "ploppyspoofer",
   LoadingTitle = "version 0.9.7",
   LoadingSubtitle = "wiggleguy",
   ConfigurationSaving = { Enabled = true, FolderName = "ploppyconfigs", FileName = "version094" }
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer

local ActiveTracks = {}
local ActiveSound = nil
local NameLoop = false
local DispLoop = false
local TargetName = "???"
local TargetDisp = "???"
local currentEquipTarget = "Guest"
local currentEquipSkin = ""
local emoteToPlay = ""

local function StopAllEmotes()
    for _, track in ipairs(ActiveTracks) do track:Stop() end
    if ActiveSound then ActiveSound:Stop(); ActiveSound:Destroy() end
    table.clear(ActiveTracks)
end

UserInputService.InputBegan:Connect(function(input, proc)
    if not proc and input.KeyCode == Enum.KeyCode.Space then StopAllEmotes() end
end)

task.spawn(function()
    while true do
        if NameLoop then pcall(function() lp.Name = TargetName end) end
        if DispLoop then
            pcall(function()
                lp.DisplayName = TargetDisp
                if lp.Character and lp.Character:FindFirstChild("Humanoid") then
                    lp.Character.Humanoid.DisplayName = TargetDisp
                end
            end)
        end
        task.wait(0.1)
    end
end)

local emoteList = {}
for _, mod in ipairs(ReplicatedStorage.Assets.Emotes:GetDescendants()) do
    if mod:IsA("ModuleScript") then table.insert(emoteList, mod.Name) end
end

local killerList = {}
local survList = {}
pcall(function()
    for _, k in ipairs(ReplicatedStorage.Assets.Killers:GetChildren()) do table.insert(killerList, k.Name) end
    for _, s in ipairs(ReplicatedStorage.Assets.Survivors:GetChildren()) do table.insert(survList, s.Name) end
end)

local UnlocksTab = Window:CreateTab("Visual Unlock All", 4483362458)
local EmoteTab = Window:CreateTab("Emotes", 4483362458)
local StatsTab = Window:CreateTab("Stats", 4483362458)
local SpooferTab = Window:CreateTab("Spoofers", 4483362458)

UnlocksTab:CreateSection("Unlock All")

UnlocksTab:CreateButton({
   Name = "Unlock All (yes i'm being fr)",
   Callback = function()
      local data = lp:WaitForChild("PlayerData"):WaitForChild("Purchased")
      local count = 0
      for _, name in ipairs(killerList) do
         if not data.Killers:FindFirstChild(name) then Instance.new("StringValue", data.Killers).Name = name; count = count + 1 end
      end
      for _, name in ipairs(survList) do
         if not data.Survivors:FindFirstChild(name) then Instance.new("StringValue", data.Survivors).Name = name; count = count + 1 end
      end
      local skinsRoot = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Skins")
      for _, skin in ipairs(skinsRoot:GetDescendants()) do
         if (skin:IsA("Folder") or skin:IsA("Model")) and not data.Skins:FindFirstChild(skin.Name) then
            Instance.new("StringValue", data.Skins).Name = skin.Name; count = count + 1
         end
      end
      Rayfield:Notify({Title = "ploppyspoofer", Content = "Unlocked " .. count .. " items!", Duration = 3})
   end,
})

UnlocksTab:CreateSection("Skin Equip (Deep Update)")

UnlocksTab:CreateDropdown({
   Name = "Select Character",
   Options = (function() 
      local combined = {}
      for _,v in ipairs(killerList) do table.insert(combined, v) end
      for _,v in ipairs(survList) do table.insert(combined, v) end
      return combined
   end)(),
   Callback = function(o) currentEquipTarget = o[1] end,
})

UnlocksTab:CreateInput({
   Name = "Skin Name",
   PlaceholderText = "e.g. Milestone100Guest1337",
   Callback = function(t) currentEquipSkin = t end,
})

UnlocksTab:CreateButton({
   Name = "Force Equip Skin",
   Callback = function()
      local equipped = lp:WaitForChild("PlayerData"):WaitForChild("Equipped"):WaitForChild("Skins")
      
      if equipped:FindFirstChild(currentEquipTarget) then
          equipped:FindFirstChild(currentEquipTarget):Destroy()
      end
      
      task.wait(0.1)
      
      local val = Instance.new("StringValue")
      val.Name = currentEquipTarget
      val.Value = currentEquipSkin
      val:SetAttribute("Skin", currentEquipSkin)
      val:SetAttribute("UniqueId", "00000000-0000-0000-0000-000000000000")
      val.Parent = equipped
      
      Rayfield:Notify({Title = "Success", Content = "Injected Skin: " .. currentEquipSkin, Duration = 2})
   end,
})

EmoteTab:CreateSection("Emotes")
EmoteTab:CreateButton({
   Name = "unlock every emote",
   Callback = function()
      local pEmotes = lp:WaitForChild("PlayerData"):WaitForChild("Purchased"):WaitForChild("Emotes")
      local count = 0
      for _, name in ipairs(emoteList) do
         if not pEmotes:FindFirstChild(name) then
            Instance.new("StringValue", pEmotes).Name = name; count = count + 1
         end
      end
      Rayfield:Notify({Title = "ploppyspoofer", Content = "unlocked " .. count .. " emotes", Duration = 3})
   end,
})

EmoteTab:CreateSection("emote player")

local function PlayEmoteAction(name)
    local module = ReplicatedStorage.Assets.Emotes:FindFirstChild(name, true)
    if module and module:IsA("ModuleScript") then
        local data = require(module)
        StopAllEmotes()
        local char = lp.Character or lp.CharacterAdded:Wait()
        local anims = type(data.AssetID) == "table" and data.AssetID or {data.AssetID}
        for _, id in ipairs(anims) do
            local a = Instance.new("Animation") a.AnimationId = id
            local t = char.Humanoid.Animator:LoadAnimation(a)
            t.Priority = Enum.AnimationPriority.Action4
            t:Play() table.insert(ActiveTracks, t)
        end
        if data.SFX then
            ActiveSound = Instance.new("Sound", char.HumanoidRootPart)
            ActiveSound.SoundId = data.SFX; ActiveSound:Play()
        end
    end
end

EmoteTab:CreateDropdown({
   Name = "select emote",
   Options = emoteList,
   Callback = function(o) emoteToPlay = o[1] end,
})

EmoteTab:CreateButton({
   Name = "play selected (space to stop)",
   Callback = function() 
        PlayEmoteAction(emoteToPlay) 
        Rayfield:Notify({Title = "ploppy spoofer", Content = "successfully playing", Duration = 2})
   end,
})

StatsTab:CreateSection("statistics")
local statsToChange = {
    ["Money"] = 67, ["NetWorth"] = 67, ["KillerChance"] = 67, 
    ["TimePlayed"] = 67, ["KillerWins"] = 67, ["Kills"] = 67,
    ["SurvivorWins"] = 67, ["ObjectivesCompleted"] = 67
}

for n, v in pairs(statsToChange) do
    StatsTab:CreateInput({
        Name = "Set " .. n, PlaceholderText = "Value:" .. v,
        Callback = function(t) 
            local s = lp:WaitForChild("PlayerData"):WaitForChild("Stats"):FindFirstChild(n, true)
            if s then s.Value = tonumber(t) or 0 end
        end
    })
end

SpooferTab:CreateSection("Identity Spoofers")

SpooferTab:CreateInput({
    Name = "target username",
    PlaceholderText = "username...",
    Callback = function(t) TargetName = t end
})
SpooferTab:CreateToggle({
    Name = "set username",
    Callback = function(v) NameLoop = v end
})

SpooferTab:CreateInput({
    Name = "target displayname",
    PlaceholderText = "displayname...",
    Callback = function(t) TargetDisp = t end
})
SpooferTab:CreateToggle({
    Name = "set displayname",
    Callback = function(v) DispLoop = v end
})

SpooferTab:CreateSection("Misc Spoofers")

SpooferTab:CreateButton({
    Name = "VIP giver (visual)",
    Callback = function()
        lp:SetAttribute("VIP", true)
        local pData = lp:FindFirstChild("PlayerData")
        if pData then
            local vVal = pData:FindFirstChild("VIP", true) or Instance.new("BoolValue", pData)
            vVal.Name = "VIP"; vVal.Value = true
        end
        Rayfield:Notify({Title = "ploppyspoofer", Content = "VIP gived ", Duration = 2})
    end
})

SpooferTab:CreateDropdown({
   Name = "device spoofer",
   Options = {"PC", "Mobile", "Console"},
   CurrentOption = {"PC"},
   Callback = function(o) lp:SetAttribute("Device", o[1]) end,
})

Rayfield:LoadConfiguration()
