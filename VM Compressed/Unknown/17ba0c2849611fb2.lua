local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Notoriety Script",
   LoadingTitle = "Script by RHBTX",
   LoadingSubtitle = "by RHBTX",
   ConfigurationSaving = {
       Enabled = true,
       FolderName = "RHBTXConfig",
       FileName = "Settings"
   },
   Discord = { Enabled = false },
   KeySystem = false,
})

local MainTab = Window:CreateTab("Main", 4483362458)

local policeToggle = false
local policeLoop
local citizenToggle = false
local citizenLoop

MainTab:CreateToggle({
   Name = "Kill All Police",
   CurrentValue = false,
   Flag = "TogglePolice",
   Callback = function(Value)
       policeToggle = Value
       if Value then
           policeLoop = task.spawn(function()
               while policeToggle and task.wait() do
                   local tool = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                   local policeFolder = workspace:FindFirstChild("Police")
                   if tool and policeFolder then
                       for _, guard in ipairs(policeFolder:GetChildren()) do
                           local humanoid = guard:FindFirstChildWhichIsA("Humanoid")
                           local head = guard:FindFirstChild("Head")
                           if humanoid and head and humanoid.Health > 0 then
                               game:GetService("ReplicatedStorage").RS_Package.Assets.Remotes.Damage:FireServer(
                                   "Damage", tool, humanoid, humanoid.Health, head, tool.Name, head.Position, {}
                               )
                           end
                       end
                   end
               end
           end)
           Rayfield:Notify({
               Title = "Police Kill",
               Content = "Fitur Kill All Police Diaktifkan.",
               Duration = 3,
               Image = 4483362458,
           })
       else
           if policeLoop then
               task.cancel(policeLoop)
               policeLoop = nil
           end
           Rayfield:Notify({
               Title = "Police Kill",
               Content = "Fitur Kill All Police Dimatikan.",
               Duration = 3,
               Image = 4483362458,
           })
       end
   end,
})

MainTab:CreateToggle({
   Name = "Kill All Citizens",
   CurrentValue = false,
   Flag = "ToggleCitizens",
   Callback = function(Value)
       citizenToggle = Value
       if Value then
           citizenLoop = task.spawn(function()
               while citizenToggle and task.wait() do
                   local tool = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool")
                   local citizenFolder = workspace:FindFirstChild("Citizens")
                   if tool and citizenFolder then
                       for _, npc in ipairs(citizenFolder:GetChildren()) do
                           local humanoid = npc:FindFirstChildWhichIsA("Humanoid")
                           local head = npc:FindFirstChild("Head")
                           if humanoid and head and humanoid.Health > 0 then
                               game:GetService("ReplicatedStorage").RS_Package.Assets.Remotes.Damage:FireServer(
                                   "Damage", tool, humanoid, humanoid.Health, head, tool.Name, head.Position, {}
                               )
                           end
                       end
                   end
               end
           end)
           Rayfield:Notify({
               Title = "Citizen Kill",
               Content = "Fitur Kill All Citizens Diaktifkan.",
               Duration = 3,
               Image = 4483362458,
           })
       else
           if citizenLoop then
               task.cancel(citizenLoop)
               citizenLoop = nil
           end
           Rayfield:Notify({
               Title = "Citizen Kill",
               Content = "Fitur Kill All Citizens Dimatikan.",
               Duration = 3,
               Image = 4483362458,
           })
       end
   end,
})

MainTab:CreateButton({
   Name = "Stamina Increase",
   Callback = function()
       local plr = game.Players.LocalPlayer.Name
       local criminals = workspace:FindFirstChild("Criminals")
       if criminals then
           local v = criminals:FindFirstChild(plr)
           if v and v:FindFirstChild("MaxStamina") then
               v.MaxStamina.Value = 10000
               Rayfield:Notify({
                   Title = "Stamina Increased",
                   Content = "Max stamina increased to 10000",
                   Duration = 3,
                   Image = 4483362458,
               })
           else
               Rayfield:Notify({
                   Title = "Error",
                   Content = "Could not find MaxStamina value",
                   Duration = 3,
                   Image = 4483362458,
               })
           end
       else
           Rayfield:Notify({
               Title = "Error",
               Content = "Could not find Criminals folder",
               Duration = 3,
               Image = 4483362458,
           })
       end
   end,
})

MainTab:CreateButton({
   Name = "Fill Stamina",
   Callback = function()
       local plr = game.Players.LocalPlayer.Name
       local criminals = workspace:FindFirstChild("Criminals")
       if criminals then
           local v = criminals:FindFirstChild(plr)
           if v and v:FindFirstChild("Stamina") then
               v.Stamina.Value = 10000
               Rayfield:Notify({
                   Title = "Stamina Filled",
                   Content = "Stamina filled to 10000",
                   Duration = 3,
                   Image = 4483362458,
               })
           else
               Rayfield:Notify({
                   Title = "Error",
                   Content = "Could not find Stamina value",
                   Duration = 3,
                   Image = 4483362458,
               })
           end
       else
           Rayfield:Notify({
               Title = "Error",
               Content = "Could not find Criminals folder",
               Duration = 3,
               Image = 4483362458,
           })
       end
   end,
})

local itemEspParts = {}
local foldersToESP = {
   "Lootables",
   "BigLoot"
}

local function clearESP(parts)
   for _, v in pairs(parts) do
       if v and v[1] and v[1]:IsA("BillboardGui") then
           v[1]:Destroy()
       end
   end
   table.clear(parts)
end

local function createESP(model, name)
   local part = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
   if not part then return end
   
   local billboard = Instance.new("BillboardGui")
   billboard.Name = "ESP_Item"
   billboard.Adornee = part
   billboard.Size = UDim2.new(0, 120, 0, 30)
   billboard.StudsOffset = Vector3.new(0, 2, 0)
   billboard.AlwaysOnTop = true
   billboard.Parent = part
   
   local label = Instance.new("TextLabel")
   label.Size = UDim2.new(1, 0, 1, 0)
   label.BackgroundTransparency = 1
   label.TextColor3 = Color3.fromRGB(0, 170, 255)
   label.TextStrokeTransparency = 0
   label.Font = Enum.Font.Code
   label.TextSize = 16
   label.Text = name
   label.Parent = billboard
   
   return {billboard}
end

MainTab:CreateToggle({
   Name = "Item ESP",
   CurrentValue = false,
   Flag = "ToggleItemESP",
   Callback = function(state)
       clearESP(itemEspParts)
       
       if not state then
           Rayfield:Notify({
               Title = "Item ESP",
               Content = "Item ESP Disabled",
               Duration = 3,
               Image = 4483362458,
           })
           return
       end
       
       for _, folderName in ipairs(foldersToESP) do
           local folder = workspace:FindFirstChild(folderName)
           if folder then
               for _, model in pairs(folder:GetChildren()) do
                   if model:IsA("Model") then
                       local targetModel = model
                       local childrenModels = {}
                       
                       for _, child in pairs(model:GetChildren()) do
                           if child:IsA("Model") then
                               table.insert(childrenModels, child)
                           end
                       end
                       
                       if #childrenModels == 1 then
                           if childrenModels[1].Name ~= "Model" then
                               targetModel = childrenModels[1]
                           end
                       elseif #childrenModels > 1 then
                           for _, childModel in pairs(childrenModels) do
                               if childModel.Name ~= "Model" then
                                   targetModel = childModel
                                   break
                               end
                           end
                       end
                       
                       local esp = createESP(targetModel, targetModel.Name)
                       if esp then
                           table.insert(itemEspParts, esp)
                       end
                   end
               end
           end
       end
       
       Rayfield:Notify({
           Title = "Item ESP",
           Content = "Item ESP Enabled",
           Duration = 3,
           Image = 4483362458,
       })
   end,
})

local SettingsTab = Window:CreateTab("Settings", 4483345998)

SettingsTab:CreateKeybind({
   Name = "Toggle GUI Keybind",
   CurrentKeybind = "RightControl",
   HoldToInteract = false,
   Flag = "UIToggleKeybind",
   Callback = function(Key)
       Rayfield:Toggle()
   end,
})

SettingsTab:CreateButton({
   Name = "Stop All Functions",
   Callback = function()
       policeToggle = false
       citizenToggle = false
       
       if policeLoop then
           task.cancel(policeLoop)
           policeLoop = nil
       end
       
       if citizenLoop then
           task.cancel(citizenLoop)
           citizenLoop = nil
       end
       
       clearESP(itemEspParts)
       
       Rayfield:Notify({
           Title = "Dihentikan Paksa",
           Content = "Semua fungsi telah dihentikan.",
           Duration = 5,
           Image = 4483345998,
       })
   end,
})

Rayfield:Notify({
   Title = "RHBTX GUI Siap",
   Content = "Gunakan Toggle di tab 'Main'.\nTekan 'RightControl' untuk menyembunyikan GUI.",
   Duration = 6.5,
})

Rayfield:LoadConfiguration()
