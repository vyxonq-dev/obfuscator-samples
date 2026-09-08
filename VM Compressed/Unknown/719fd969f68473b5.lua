local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Vyntrix Hub - Mine a Planet",
   Icon = 0,
   LoadingTitle = "Loading Vyntrix Hub...",
   LoadingSubtitle = "by Vyntrix",
   Theme = "Amethyst",
   ToggleUIKeybind = "K",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "VyntrixHubConfig",
      FileName = "MineAPlanet"
   },
   KeySystem = false
})

---------------------------------------------------------
-- TABS
---------------------------------------------------------
local AutoFarmTab = Window:CreateTab("Auto Farm", 4483362458)
local UpgradesTab = Window:CreateTab("Upgrades", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)
local CreditsTab = Window:CreateTab("Credits", 4483362458)

---------------------------------------------------------
-- VARIABLES & THREAD HANDLES
---------------------------------------------------------
local autoCollectEnabled = false
local autoSellEnabled = false
local autoRollEnabled = false

local autoBuyUpgradesEnabled = false
local autoBuyPetsEnabled = false
local autoBuyGearEnabled = false
local autoBuyBaseUpgradesEnabled = false
local autoBuyDroneUpgradesEnabled = false

local collectDelay = 2
local sellDelay = 5
local rollDelay = 1
local shopScanDelay = 1.5

local selectedUpgrades = {}
local selectedPetItems = {}
local selectedGearItems = {}
local selectedBaseUpgrades = {}
local selectedDroneUpgrades = {}

local collectThread = nil
local sellThread = nil
local rollThread = nil
local upgradesThread = nil
local petsThread = nil
local gearThread = nil
local baseUpgradesThread = nil
local droneUpgradesThread = nil

-- Misc settings
local defaultWalkSpeed = 16
local defaultJumpHeight = 7.2
local currentWalkSpeed = defaultWalkSpeed
local currentJumpHeight = defaultJumpHeight
local infiniteJumpEnabled = false
local infJumpConnection = nil

-- Settings state
local chosenColor = Color3.fromRGB(128, 0, 128)
local customImageUrl = ""

---------------------------------------------------------
-- HELPER FUNCTIONS & FILTERING
---------------------------------------------------------

local function isBlacklisted(str)
    if not str then return false end
    str = string.lower(tostring(str))
    local blacklist = {
        "invite", "language", "arabic", "friend", "gift", "share", "setting", 
        "social", "code", "twitter", "group", "robux", "r$", "devproduct", 
        "gamepass", "prompt", "product", "pass"
    }
    for _, word in ipairs(blacklist) do
        if string.find(str, word, 1, true) then
            return true
        end
    end
    return false
end

local function isCashButton(btn)
    if not btn then return false end
    
    local btnName = string.lower(btn.Name)
    local btnText = btn:IsA("TextButton") and string.lower(btn.Text or "") or ""
    
    if isBlacklisted(btnName) or isBlacklisted(btnText) then return false end
    
    local combinedText = btnName .. " " .. btnText
    for _, child in ipairs(btn:GetDescendants()) do
        if child:IsA("TextLabel") or child:IsA("TextButton") then
            combinedText = combinedText .. " " .. string.lower(child.Text or "") .. " " .. string.lower(child.Name)
        elseif child:IsA("ImageLabel") or child:IsA("ImageButton") then
            combinedText = combinedText .. " " .. string.lower(child.Name) .. " " .. string.lower(child.Image or "")
        end
    end
    
    if isBlacklisted(combinedText) then return false end
    if string.find(combinedText, "robux", 1, true) or string.find(combinedText, "r$", 1, true) then
        return false
    end
    
    return true
end

local function triggerPromptRemote(prompt)
    if not prompt or not prompt.Enabled then return end
    
    prompt.RequiresLineOfSight = false
    prompt.MaxActivationDistance = 9e9
    
    local player = game.Players.LocalPlayer
    local character = player.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    
    local promptPart = prompt.Parent
    if promptPart and not promptPart:IsA("BasePart") then
        promptPart = promptPart:FindFirstChildWhichIsA("BasePart") or promptPart.Parent
    end
    
    if hrp and promptPart and promptPart:IsA("BasePart") then
        local oldCFrame = hrp.CFrame
        hrp.CFrame = promptPart.CFrame + Vector3.new(0, 3, 0)
        task.wait(0.05)
        fireproximityprompt(prompt)
        task.wait(0.05)
        hrp.CFrame = oldCFrame
    else
        fireproximityprompt(prompt)
    end
end

local function clickButton(btn)
    if not btn or not isCashButton(btn) then return end
    
    if firesignal then
        pcall(function() if btn.MouseButton1Down then firesignal(btn.MouseButton1Down) end end)
        pcall(function() if btn.MouseButton1Click then firesignal(btn.MouseButton1Click) end end)
        pcall(function() if btn.Activated then firesignal(btn.Activated) end end)
    elseif firebutton1click then
        pcall(function() firebutton1click(btn) end)
    end
end

-- Auto-opens shop vendor prompts in Workspace so UI stays loaded
local function ensureShopOpen(keywords)
    for _, prompt in ipairs(workspace:GetDescendants()) do
        if prompt:IsA("ProximityPrompt") and prompt.Enabled then
            local actionStr = string.lower((prompt.ActionText or "") .. " " .. (prompt.ObjectText or "") .. " " .. prompt.Name)
            for _, kw in ipairs(keywords) do
                if string.find(actionStr, string.lower(kw), 1, true) then
                    fireproximityprompt(prompt)
                    task.wait(0.15)
                    return
                end
            end
        end
    end
end

-- 1. Screen GUI Autobuy (Menu Shops)
local function processShopAutobuy(selectedList, vendorKeywords)
    if #selectedList == 0 then return end
    
    if vendorKeywords then
        ensureShopOpen(vendorKeywords)
    end

    local player = game.Players.LocalPlayer
    local playerGui = player and player:FindFirstChild("PlayerGui")
    if not playerGui then return end

    for _, gui in ipairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Enabled and not isBlacklisted(gui.Name) then
            for _, descendant in ipairs(gui:GetDescendants()) do
                if (descendant:IsA("TextLabel") or descendant:IsA("TextButton")) and descendant.Visible then
                    local labelText = string.lower(descendant.Text or "")
                    
                    for _, targetItem in ipairs(selectedList) do
                        local targetLower = string.lower(targetItem)
                        if string.find(labelText, targetLower, 1, true) then
                            local card = descendant.Parent
                            for i = 1, 3 do
                                if card and card:IsA("GuiObject") then
                                    for _, elem in ipairs(card:GetDescendants()) do
                                        if (elem:IsA("TextButton") or elem:IsA("ImageButton")) and elem.Visible then
                                            if isCashButton(elem) then
                                                clickButton(elem)
                                                task.wait(0.1)
                                            end
                                        end
                                    end
                                    card = card.Parent
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- 2. Physical Workspace Billboard Upgrades (No Teleportation / Pure GUI & ClickDetector)
local function processWorkspaceBillboards(selectedList)
    if #selectedList == 0 then return end

    for _, gui in ipairs(workspace:GetDescendants()) do
        if (gui:IsA("SurfaceGui") or gui:IsA("BillboardGui")) and gui.Enabled then
            for _, descendant in ipairs(gui:GetDescendants()) do
                if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
                    local textContent = string.lower(descendant.Text or descendant.Name or "")
                    
                    for _, targetItem in ipairs(selectedList) do
                        local targetLower = string.lower(targetItem)
                        if string.find(textContent, targetLower, 1, true) then
                            -- Traversal to find board model/card container
                            local card = descendant.Parent
                            for i = 1, 4 do
                                if card then
                                    -- A. Check for UI buttons on SurfaceGui / BillboardGui
                                    for _, elem in ipairs(card:GetDescendants()) do
                                        if (elem:IsA("TextButton") or elem:IsA("ImageButton")) and elem.Visible then
                                            if isCashButton(elem) then
                                                clickButton(elem)
                                            end
                                        end
                                    end
                                    
                                    -- B. Check for ClickDetectors on physical board parts
                                    local model = card:IsA("Model") and card or card.Parent
                                    if model then
                                        for _, cd in ipairs(model:GetDescendants()) do
                                            if cd:IsA("ClickDetector") and fireclickdetector then
                                                fireclickdetector(cd)
                                            end
                                        end
                                    end
                                    card = card.Parent
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- Character Stats setup
local function applyPlayerStats()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    
    humanoid.WalkSpeed = currentWalkSpeed
    if humanoid.UseJumpPower then
        humanoid.JumpPower = currentJumpHeight * 7
    else
        humanoid.JumpHeight = currentJumpHeight
    end
end

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    task.wait(0.5)
    applyPlayerStats()
end)

-- Infinite Jump Listener
infJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
    if infiniteJumpEnabled then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character and character:FindFirstChildOfClass("Humanoid") then
            character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

---------------------------------------------------------
-- AUTO FARM TAB UI ELEMENTS
---------------------------------------------------------

AutoFarmTab:CreateSection("Auto Farming")

AutoFarmTab:CreateSlider({
   Name = "Collect Delay",
   Range = {1, 10},
   Increment = 1,
   Suffix = " Seconds",
   CurrentValue = 2,
   Flag = "CollectDelaySlider",
   Callback = function(Value)
       collectDelay = Value
   end,
})

AutoFarmTab:CreateToggle({
   Name = "Auto Collect Ores",
   CurrentValue = false,
   Flag = "AutoCollectToggle",
   Callback = function(Value)
       autoCollectEnabled = Value
       if collectThread then task.cancel(collectThread); collectThread = nil end
       
       if autoCollectEnabled then
           collectThread = task.spawn(function()
               while autoCollectEnabled do
                   for _, object in pairs(workspace:GetDescendants()) do
                       if not autoCollectEnabled then break end
                       if object:IsA("ProximityPrompt") and object.Name == "FS_CollectDockOrePrompt" and object.Enabled then
                           fireproximityprompt(object)
                       end
                   end
                   task.wait(collectDelay)
               end
           end)
       end
   end,
})

AutoFarmTab:CreateSlider({
   Name = "Sell Delay",
   Range = {1, 15},
   Increment = 1,
   Suffix = " Seconds",
   CurrentValue = 5,
   Flag = "SellDelaySlider",
   Callback = function(Value)
       sellDelay = Value
   end,
})

AutoFarmTab:CreateToggle({
   Name = "Auto Sell Ores",
   CurrentValue = false,
   Flag = "AutoSellToggle",
   Callback = function(Value)
       autoSellEnabled = Value
       if sellThread then task.cancel(sellThread); sellThread = nil end
       
       if autoSellEnabled then
           sellThread = task.spawn(function()
               while autoSellEnabled do
                   for _, object in pairs(workspace:GetDescendants()) do
                       if not autoSellEnabled then break end
                       if object:IsA("ProximityPrompt") and object.Name == "FS_SellPrompt" and object.Enabled then
                           triggerPromptRemote(object)
                           break
                       end
                   end
                   task.wait(sellDelay)
               end
           end)
       end
   end,
})

AutoFarmTab:CreateSection("Drone Management")

AutoFarmTab:CreateSlider({
   Name = "Roll Delay",
   Range = {1, 10},
   Increment = 1,
   Suffix = " Seconds",
   CurrentValue = 1,
   Flag = "RollDelaySlider",
   Callback = function(Value)
       rollDelay = Value
   end,
})

AutoFarmTab:CreateToggle({
   Name = "Auto Buy ALL & Roll Drones",
   CurrentValue = false,
   Flag = "AutoRollToggle",
   Callback = function(Value)
       autoRollEnabled = Value
       if rollThread then task.cancel(rollThread); rollThread = nil end
       
       if autoRollEnabled then
           rollThread = task.spawn(function()
               while autoRollEnabled do
                   local buyPromptsFound = {}
                   local rollPromptFound = nil
                   
                   for _, object in pairs(workspace:GetDescendants()) do
                       if not autoRollEnabled then break end
                       if object:IsA("ProximityPrompt") and object.Enabled then
                           if object.Name == "FS_PickUpDronePrompt" then
                               table.insert(buyPromptsFound, object)
                           elseif object.Name == "FS_RollDronesPrompt" then
                               rollPromptFound = object
                           end
                       end
                   end
                   
                   if #buyPromptsFound > 0 then
                       for _, buyPrompt in ipairs(buyPromptsFound) do
                           if not autoRollEnabled then break end
                           triggerPromptRemote(buyPrompt)
                           task.wait(0.3)
                       end
                   end

                   if autoRollEnabled and rollPromptFound then
                       triggerPromptRemote(rollPromptFound)
                   end
                   
                   task.wait(rollDelay)
               end
           end)
       end
   end,
})

---------------------------------------------------------
-- UPGRADES TAB UI ELEMENTS
---------------------------------------------------------

UpgradesTab:CreateSection("Shop Settings")

UpgradesTab:CreateSlider({
   Name = "Shop Scan Delay",
   Range = {1, 10},
   Increment = 1,
   Suffix = " Seconds",
   CurrentValue = 1.5,
   Flag = "ShopScanDelaySlider",
   Callback = function(Value)
       shopScanDelay = Value
   end,
})

-- 1. UPGRADES SHOP
UpgradesTab:CreateSection("Upgrades Shop")

UpgradesTab:CreateDropdown({
   Name = "Select Upgrades to Buy",
   Options = {"Jetpack", "Laser Pistol", "Drone Kit"},
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "UpgradesShopDropdown",
   Callback = function(Options)
       selectedUpgrades = Options
   end,
})

UpgradesTab:CreateToggle({
   Name = "Auto Buy Selected Upgrades",
   CurrentValue = false,
   Flag = "AutoBuyUpgradesToggle",
   Callback = function(Value)
       autoBuyUpgradesEnabled = Value
       if upgradesThread then task.cancel(upgradesThread); upgradesThread = nil end
       
       if autoBuyUpgradesEnabled then
           upgradesThread = task.spawn(function()
               while autoBuyUpgradesEnabled do
                   processShopAutobuy(selectedUpgrades, {"upgrade"})
                   task.wait(shopScanDelay)
               end
           end)
       end
   end,
})

-- 2. ALIEN PETS SHOP
UpgradesTab:CreateSection("Alien Pets Shop")

UpgradesTab:CreateDropdown({
   Name = "Select Alien Pets Items to Buy",
   Options = {
       "Normal Alien Treat", 
       "Common Alien Ball", 
       "Strong Alien Treat", 
       "Rare Alien Ball", 
       "Super Alien Treat", 
       "Legendary Alien Ball", 
       "Prismatic Alien Treat"
   },
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "AlienPetsDropdown",
   Callback = function(Options)
       selectedPetItems = Options
   end,
})

UpgradesTab:CreateToggle({
   Name = "Auto Buy Selected Alien Pets Items",
   CurrentValue = false,
   Flag = "AutoBuyPetsToggle",
   Callback = function(Value)
       autoBuyPetsEnabled = Value
       if petsThread then task.cancel(petsThread); petsThread = nil end
       
       if autoBuyPetsEnabled then
           petsThread = task.spawn(function()
               while autoBuyPetsEnabled do
                   processShopAutobuy(selectedPetItems, {"pet", "alien"})
                   task.wait(shopScanDelay)
               end
           end)
       end
   end,
})

-- 3. GEAR SHOP
UpgradesTab:CreateSection("Gear Shop")

UpgradesTab:CreateDropdown({
   Name = "Select Gear Items to Buy",
   Options = {
       "Normal Battery",
       "Clean CPU chip",
       "Blizzard CPU chip",
       "Strong Battery",
       "Solar Flare CPU chip",
       "RadioActive CPU chip",
       "UFO CPU chip",
       "JellyFish CPU chip",
       "Super Battery",
       "Prismatic Battery"
   },
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "GearShopDropdown",
   Callback = function(Options)
       selectedGearItems = Options
   end,
})

UpgradesTab:CreateToggle({
   Name = "Auto Buy Selected Gear Items",
   CurrentValue = false,
   Flag = "AutoBuyGearToggle",
   Callback = function(Value)
       autoBuyGearEnabled = Value
       if gearThread then task.cancel(gearThread); gearThread = nil end
       
       if autoBuyGearEnabled then
           gearThread = task.spawn(function()
               while autoBuyGearEnabled do
                   -- Fixed: strictly search for "gear" keyword so it doesn't open Alien Pets
                   processShopAutobuy(selectedGearItems, {"gear"})
                   task.wait(shopScanDelay)
               end
           end)
       end
   end,
})

-- 4. STATION / BASE UPGRADES (Workspace Billboards)
UpgradesTab:CreateSection("Station / Base Upgrades")

UpgradesTab:CreateDropdown({
   Name = "Select Base Upgrades",
   Options = {
       "Dock Platforms",
       "Cargo",
       "Dock Storage",
       "Mining Speed",
       "Planet Upgrade",
       "Expand Base"
   },
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "BaseUpgradesDropdown",
   Callback = function(Options)
       selectedBaseUpgrades = Options
   end,
})

UpgradesTab:CreateToggle({
   Name = "Auto Buy Base Upgrades",
   CurrentValue = false,
   Flag = "AutoBuyBaseUpgradesToggle",
   Callback = function(Value)
       autoBuyBaseUpgradesEnabled = Value
       if baseUpgradesThread then task.cancel(baseUpgradesThread); baseUpgradesThread = nil end
       
       if autoBuyBaseUpgradesEnabled then
           baseUpgradesThread = task.spawn(function()
               while autoBuyBaseUpgradesEnabled do
                   processWorkspaceBillboards(selectedBaseUpgrades)
                   task.wait(shopScanDelay)
               end
           end)
       end
   end,
})

-- 5. DRONE UPGRADES (Workspace Billboards)
UpgradesTab:CreateSection("Drone Upgrades")

UpgradesTab:CreateDropdown({
   Name = "Select Drone Upgrades",
   Options = {
       "Drone Luck",
       "Drone Rolls"
   },
   CurrentOption = {},
   MultipleOptions = true,
   Flag = "DroneUpgradesDropdown",
   Callback = function(Options)
       selectedDroneUpgrades = Options
   end,
})

UpgradesTab:CreateToggle({
   Name = "Auto Buy Drone Upgrades",
   CurrentValue = false,
   Flag = "AutoBuyDroneUpgradesToggle",
   Callback = function(Value)
       autoBuyDroneUpgradesEnabled = Value
       if droneUpgradesThread then task.cancel(droneUpgradesThread); droneUpgradesThread = nil end
       
       if autoBuyDroneUpgradesEnabled then
           droneUpgradesThread = task.spawn(function()
               while autoBuyDroneUpgradesEnabled do
                   processWorkspaceBillboards(selectedDroneUpgrades)
                   task.wait(shopScanDelay)
               end
           end)
       end
   end,
})

---------------------------------------------------------
-- MISC TAB UI ELEMENTS
---------------------------------------------------------

MiscTab:CreateSection("Character Modifiers")

MiscTab:CreateSlider({
   Name = "WalkSpeed",
   Range = {16, 200},
   Increment = 1,
   Suffix = " Speed",
   CurrentValue = 16,
   Flag = "WalkSpeedSlider",
   Callback = function(Value)
       currentWalkSpeed = Value
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("Humanoid") then
           char.Humanoid.WalkSpeed = Value
       end
   end,
})

MiscTab:CreateSlider({
   Name = "JumpHeight",
   Range = {7, 150},
   Increment = 1,
   Suffix = " Height",
   CurrentValue = 7,
   Flag = "JumpHeightSlider",
   Callback = function(Value)
       currentJumpHeight = Value
       local char = game.Players.LocalPlayer.Character
       if char and char:FindFirstChild("Humanoid") then
           if char.Humanoid.UseJumpPower then
               char.Humanoid.JumpPower = Value * 7
           else
               char.Humanoid.JumpHeight = Value
           end
       end
   end,
})

MiscTab:CreateToggle({
   Name = "Infinite Jump",
   CurrentValue = false,
   Flag = "InfiniteJumpToggle",
   Callback = function(Value)
       infiniteJumpEnabled = Value
   end,
})

MiscTab:CreateSection("Utilities")

MiscTab:CreateButton({
   Name = "Reset Character",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       if char then
           char:BreakJoints()
       end
   end,
})

MiscTab:CreateButton({
   Name = "Rejoin Game",
   Callback = function()
       local ts = game:GetService("TeleportService")
       local p = game.Players.LocalPlayer
       if #game.Players:GetPlayers() <= 1 then
           ts:Teleport(game.PlaceId, p)
       else
           ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
       end
   end,
})

---------------------------------------------------------
-- SETTINGS TAB UI ELEMENTS
---------------------------------------------------------

SettingsTab:CreateSection("GUI Color Customization")

SettingsTab:CreateColorPicker({
    Name = "Choose Color",
    Color = Color3.fromRGB(128, 0, 128),
    Flag = "ThemeColorPicker",
    Callback = function(Color)
        chosenColor = Color
    end,
})

SettingsTab:CreateButton({
   Name = "Apply Colors",
   Callback = function()
       local coreGui = game:GetService("CoreGui")
       local rayfieldGui = coreGui:FindFirstChild("Rayfield") or game.Players.LocalPlayer.PlayerGui:FindFirstChild("Rayfield")
       
       if rayfieldGui then
           for _, obj in pairs(rayfieldGui:GetDescendants()) do
               if obj:IsA("Frame") or obj:IsA("TextButton") or obj:IsA("ImageLabel") or obj:IsA("ScrollingFrame") then
                   pcall(function()
                       if obj.BackgroundColor3 ~= Color3.fromRGB(255, 255, 255) then
                           obj.BackgroundColor3 = chosenColor
                       end
                   end)
               elseif obj:IsA("UIStroke") then
                   pcall(function() obj.Color = chosenColor end)
               elseif obj:IsA("TextLabel") then
                   pcall(function() obj.TextColor3 = chosenColor end)
               end
           end
           
           Rayfield:Notify({
               Title = "Colors Applied",
               Content = "GUI theme colors updated!",
               Duration = 3,
               Image = 4483362458
           })
       end
   end,
})

SettingsTab:CreateSection("Custom Background Image")

SettingsTab:CreateInput({
   Name = "Custom Background Image URL",
   PlaceholderText = "Paste Image Asset ID or URL",
   RemoveTextOnFocusLost = false,
   Callback = function(Text)
       customImageUrl = Text
   end,
})

SettingsTab:CreateButton({
   Name = "Apply Image Background",
   Callback = function()
       if customImageUrl and #customImageUrl > 0 then
           local coreGui = game:GetService("CoreGui")
           local rayfieldGui = coreGui:FindFirstChild("Rayfield") or game.Players.LocalPlayer.PlayerGui:FindFirstChild("Rayfield")
           
           if rayfieldGui then
               local mainFrame = rayfieldGui:FindFirstChild("Main", true) or rayfieldGui:FindFirstChildWhichIsA("Frame", true)
               if mainFrame then
                   local bgImage = mainFrame:FindFirstChild("VyntrixCustomBG")
                   if not bgImage then
                       bgImage = Instance.new("ImageLabel")
                       bgImage.Name = "VyntrixCustomBG"
                       bgImage.Size = UDim2.new(1, 0, 1, 0)
                       bgImage.Position = UDim2.new(0, 0, 0, 0)
                       bgImage.BackgroundTransparency = 1
                       bgImage.ZIndex = 1
                       bgImage.ScaleType = Enum.ScaleType.Crop
                       bgImage.Parent = mainFrame
                       
                       for _, child in pairs(mainFrame:GetChildren()) do
                           if child ~= bgImage and child:IsA("GuiObject") then
                               child.ZIndex = 2
                           end
                       end
                   end
                   
                   local assetId = customImageUrl
                   if not string.find(customImageUrl, "rbxassetid://") and tonumber(customImageUrl) then
                       assetId = "rbxassetid://" .. customImageUrl
                   end
                   
                   bgImage.Image = assetId
                   
                   Rayfield:Notify({
                       Title = "Background Applied",
                       Content = "Custom background image loaded!",
                       Duration = 3,
                       Image = 4483362458
                   })
               end
           end
       else
           Rayfield:Notify({
               Title = "Error",
               Content = "Please enter an Image Asset ID or URL.",
               Duration = 3,
               Image = 4483362458
           })
       end
   end,
})

---------------------------------------------------------
-- CREDITS TAB UI ELEMENTS
---------------------------------------------------------

CreditsTab:CreateSection("Script Credits")

CreditsTab:CreateParagraph({
    Title = "Made by Vyntrix",
    Content = "Thank you for using Vyntrix Hub! Built for Mine a Planet."
})

CreditsTab:CreateSection("Community & Support")

CreditsTab:CreateButton({
   Name = "Copy Discord Invite Link",
   Callback = function()
       local discordLink = "https://discord.gg/w9RdfDPB9g"
       if setclipboard then
           setclipboard(discordLink)
           Rayfield:Notify({
               Title = "Discord Link Copied!",
               Content = "The invite link has been copied to your clipboard.",
               Duration = 4,
               Image = 4483362458
           })
       else
           Rayfield:Notify({
               Title = "Discord Link",
               Content = discordLink,
               Duration = 10,
               Image = 4483362458
           })
       end
   end,
})