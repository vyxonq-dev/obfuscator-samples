-- Check out my GitHub! https://github.com/P3nguinMinecraft/WizardSimulatorGUI/
-- game:GetService("Players").LocalPlayer.Character.PrimaryPart.Position = Vector3.new(898.3, 4, -399) works best with autofarm dummy so you won't be seen (using fly and noclip)

if not game:IsLoaded() then game.Loaded:Wait() end

local placeID = 3089478851
if game.PlaceId ~= placeID then
   warn("Stopped WSG, not in Wizard Simulator")
   return
end

print("[WSG] Loading Wizard Simulator GUI")


getgenv().SecureMode = true
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- local vars
local Player = game:GetService("Players").LocalPlayer
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local GameGUI = Player.PlayerGui.GameGui
local PickupGuiContainer = Player.PlayerGui.GameGui.Pickup

local Humanoid = Player.Character:WaitForChild("Humanoid")
local RootPart = Player.Character:WaitForChild("HumanoidRootPart")
local vars = {
   Level = nil,
   Arena = nil,
   PlayerPos = nil,
   SpellState = 1,
   SelectedPet = nil,
   SelectedPetSlotName = nil,
   SelectedPetSlot = 1,
   DeletePetLockTimer = 0,
   AutoReroll = false,
   SelectedRarities = {},
   SelectedChestName = "Training Area Chest",
   SelectedChest = "Chest1",
   HomeTPBlack = false,
   HomeTPTimer = 0,
   LocationTPBlack = false,
   LocationTPTimer = 0,
   NoStop = false,
   SelectedQuest = "LJ:1",
   AutoQuestToggle = false,
   HPot = nil,
   MPot = nil,
   HealthPercentage = nil,
   PreviousMana = nil,
   Mana = nil,
   MaxMana = nil,
   ManaPercentage = nil,
   AutoHealthToggle = false,
   AutoManaToggle = false,
   AutoHealthThreshold = 0,
   AutoManaThreshold = 0,
   AutoFarmToggle = false,
   AutoFarmEnemyNames = {"[1] Training Dummy"},
   AutoFarmEnemies = {"Dummy"},
   AutoFarmTarget = "Closest",
   HitEnemies = {},
   ConnectedEnemyFolders = {},
   AutoFarmDelay = 1.5,
   AutoFarmQuestToggle = false,
   AutoRechargeToggle = false,
   SpellRange = 100,
   TrackGold = false,
   TrackXP = false,
   TrackedGold = 0,
   TrackedXP = 0,
   TrackedGoldTimer = 0,
   TrackedXPTimer = 0,
   GoldHours = nil,
   GoldMinutes = nil,
   GoldSeconds = nil,
   GoldDurationString = nil,
   GoldPerHour = nil,
   XPHours = nil,
   XPMinutes = nil,
   XPSeconds = nil,
   XPDurationString = nil,
   XPPerHour = nil,
   TrackedElements = {},
   WalkspeedToggleOld = false,
   WalkspeedToggle = false,
   Walkspeed = 16,
   JumpPowerToggleOld = false,
   JumpPowerToggle = false,
   JumpPower = 50,
   PlayerXPPercentage = nil,
   PlayerLevel = nil,
   PlayerTotalXP = nil,
   LevelTimer = nil,
   LevelMinutes = nil,
   LevelSeconds = nil,
   LevelHours = nil,
   LevelDuration = nil
}

vars.HealthPercentage = Humanoid.Health / Humanoid.MaxHealth * 100

local PetSlotOptions = {
   [1] = "Main",
   [2] = "Secondary (gamepass)",
   [3] = "Mount"
}

local ChestOptions = {
   ["Chest1"] = "Training Area Chest",
   ["Chest2"] = "Werewolf Chest",
   ["Chest3"] = "Deep Seas Chest",
   ["Chest4"] = "Magma Chest",
   ["Chest5"] = "Castle Chest",
   ["Chest6"] = "Candy Chest",
   ["CheapMountChest"] = "Cheap Mount Chest",
   ["MountChest"] = "Mount Chest"
}

local AutoFarmEnemyOptions = {
   ["Dummy"] = "[1] Training Dummy",
   ["DummyWarrior"] = "[3] Dummy Warrior",
   ["DummyArcher"] = "[6] Dummy Archer",
   ["DummySpearman"] = "[8] Dummy Spearman",
   ["DummyWizard"] = "[12] Dummy Wizard",
   ["EarthGolem"] = "[24] Earth Golem",
   ["Stone3"] = "[24] Summoned Earth Rock",
   ["DummyKing"] = "Dummy King",
   ["GreenSlime"] = "[12] Green Slime",
   ["BigSlime"] = "[17] Giant Green Slime",
   ["Spider"] = "[15] Spider",
   ["GiantSpider"] = "[20] Big Spider",
   ["Wolf"] = "[22] Wolf",
   ["Werewolf"] = "[25] Werewolf",
   ["Bear"] = "[26] Bear",
   ["StoneGolem"] = "[32] Stone Golem",
   ["Stone1"] = "[32] Summoned Rock",
   ["Lumberjack"] = "Lumberjack",
   ["GiantWerewolf"] = "Lumberjack? (Werewolf)",
   ["BeachCrab"] = "[28] Beach Crab",
   ["Clam"] = "[30] Clam",
   ["RockCrab"] = "[32] Rock Crab",
   ["Jellyfish"] = "[35] Jellyfish",
   ["IceJellyfish"] = "[36] Ice Jellyfish",
   ["GreenPirate"] = "[38] Green Pirate",
   ["RedPirate"] = "[39] Red Pirate",
   ["WaterGolem"] = "[42] Water Golem",
   ["Stone4"] = "[42] Summoned Water Rock",
   ["KingPirate"] = "Pirate King",
   ["MagmaSlime"] = "[40] Magma Slime",
   ["GiantMagmaSlime"] = "[43] Giant Magma Slime",
   ["FireAnt"] = "[43] Fire Ant",
   ["GiantFireAnt"] = "[46] Giant Fire Ant",
   ["MagmaCrab"] = "[48] Magma Crab",
   ["MagmaSpider"] = "[49] Magma Spider",
   ["MagmaScorpion"] = "[51] Magma Scorpion",
   ["Worm"] = "[53] Magma Worm",
   ["MagmaGolem"] = "[54] Magma Golem",
   ["Stone2"] = "[54] Summoned Magma Rock",
   ["MagmaKing"] = "Magma King",
   ["MagmaEater"] = "Magma Eater",
   ["DummyKnight"] = "[58] Elite Dummy Knight",
   ["DummyArcher2"] = "[60] Elite Dummy Archer",
   ["DummySpearman2"] = "[62] Elite Dummy Spearman",
   ["SmallWasp"] = "[64] Wasp",
   ["Wasp"] = "[66] Giant Wasp",
   ["SmallTreant"] = "[66] Stumpant",
   ["Treant"] = "[68] Treant",
   ["RockScorpion"] = "[69] Rock Scorpion",
   ["RockTitan"] = "[71] Rock Titan",
   ["SmallJello"] = "[74] Small Jello",
   ["Cupcake"] = "[75] Cupcake",
   ["Donut"] = "[77] Donut",
   ["BigJello"] = "[78] Big Jello",
   ["GummyWorm"] = "[80] Gummy Worm",
   ["GingerbreadSoldier"] = "[81] Gingerbread Soldier",
   ["GingerbreadWizard"] = "[82] Gingerbread Wizard",
   ["CandyGolem"] = "[84] Candy Golem",
   ["StaticWaypoint"] = "Candy Chomper (also targets gates)"
}

local Multipliers = {
   K = 1000, -- Thousand
   M = 1000000, -- Million
   B = 1000000000, -- Billion
}

print("[WSG] Loading Window")

local Window = Rayfield:CreateWindow({
   Name = "Wizard Simulator",
   LoadingTitle = "Wizard Simulator GUI",
   LoadingSubtitle = "by penguin",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "wizardsimulatorgui",
      FileName = "wizardsimulatorgui_config"
   },
   Discord = { 
      Enabled = true,
      Invite = "fWncS2vFxn",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"random"}
   }
})

local function round(num)
   return math.floor(num + 0.5)
end

print("[WSG] Loading Info Tab")

local CreditTab = Window:CreateTab("Info", nil)

local CreditLabel1 = CreditTab:CreateLabel("Developed by penguin586970")

local CreditLabel2 = CreditTab:CreateLabel("Executor used for development: MacSploit, Delta (not affiliated!)")

local CreditLabel3 = CreditTab:CreateLabel("For questions, concerns, contact windows1267 on discord or join the discord server on the GitHub")

print("[WSG] Loading QOL Tab")

local QOLTab = Window:CreateTab("QOL", nil)

local QOLSection1 = QOLTab:CreateSection("Pets")

local QOLInput1 = QOLTab:CreateInput({
   Name = "Select Pet",
   PlaceholderText = "Order in the Pet Menu",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      local num = tonumber(Text)
      if num ~= nil and num > 0 and math.floor(num) == num then
         vars.SelectedPet = tonumber(Text)
      elseif Text == "" then
         vars.SelectedPet = nil
      else
         Rayfield:Notify({
            Title = "Error",
            Content = "Has to be a positive integer",
            Duration = 5,
            Image = nil,
            Actions = {
               Ignore = {
                  Name = "Debug",
                  Callback = function()
                     print("Inputted Text is:")
                     print(Text)
                  end
               },
            },
         })
      end
   end,
})

local QOLParagraph1 = QOLTab:CreateParagraph({Title = "Equip/Unequip Pets", Content = "Enter the pet number, or the order of the pet when it appears in the pet menu."})

local QOLDropdown1 = QOLTab:CreateDropdown({
   Name = "Pet Slot",
   Options = PetSlotOptions,
   CurrentOption = PetSlotOptions[1],
   MultipleOptions = false,
   Flag = "QOLDropdown1",
   Callback = function(Option)
      vars.SelectedPetSlotName = Option[1]
      for i, v in pairs(PetSlotOptions) do
         if v == vars.SelectedPetSlotName then
            vars.SelectedPetSlot = i
            break
         end
      end
   end,
})

local QOLButton1 = QOLTab:CreateButton({
   Name = "Equip Pet",
   Callback = function()
      if vars.SelectedPet and vars.SelectedPetSlot then 
         game:GetService("ReplicatedStorage").Remote.EquipPet:FireServer(vars.SelectedPet,vars.SelectedPetSlot)
      else
         Rayfield:Notify({
            Title = "Error",
            Content = "Pet Number or Pet Slot missing!",
            Duration = 5,
            Image = nil,
            Actions = {
               Ignore = {
                  Name = "OK",
                  Callback = function()
                  end
               },
            },
         })
      end
   end,
})

local QOLButton2 = QOLTab:CreateButton({
   Name = "Unequip Pet",
   Callback = function()
      game:GetService("ReplicatedStorage").Remote.EquipPet:FireServer(0,vars.SelectedPetSlot)
   end,
})

local QOLParagraph2 = QOLTab:CreateParagraph({Title = "Delete Pet", Content = "Select the slot you want to delete (in Select Pet Input), after deleting, next pet will move to that slot. There is an extra toggle that is required to delete pets."})

local QOLButton3 = QOLTab:CreateButton({
   Name = "Delete Pet",
   Callback = function()
      if vars.SelectedPet and vars.SelectedPet > 0 then
         if vars.DeletePetLockTimer > 0 then 
            game:GetService("ReplicatedStorage").Remote.DeletePet:FireServer(vars.SelectedPet)
            if vars.AutoReroll == true then
               game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("OpenPetChest"):InvokeServer(vars.SelectedChest)
            end
         else
            Rayfield:Notify({
               Title = "Delete Pet Lock",
               Content = "Delete Pet Lock prevented you from deleting the selected pet. Press the button below to disable it for 1 minute.",
               Duration = 5,
               Image = nil,
               Actions = {
                  Ignore = {
                     Name = "Disable Lock",
                     Callback = function()
                        vars.DeletePetLockTimer = 60
                     end
                  },
               },
            })
         end
      else
         Rayfield:Notify({
            Title = "No Pet Selected!",
            Content = "You did not select a pet slot above!",
            Duration = 5,
            Image = nil,
            Actions = {
            },
         })
      end
   end,
})

local QOLButton4 = QOLTab:CreateButton({
   Name = "Disable Delete Pet Lock",
   Callback = function()
      vars.DeletePetLockTimer = 60
      Rayfield:Notify({
         Title = "Pet Lock Enabled",
         Content = "You may now delete pets for 60 seconds!",
         Duration = 5,
         Image = nil,
         Actions = {
         },
      })
   end,
})

local QOLSection2 = QOLTab:CreateSection("Chests")

local QOLDropdown2 = QOLTab:CreateDropdown({
   Name = "Select Chest",
   Options = {
      "Training Area Chest",
      "Werewolf Chest",
      "Deep Seas Chest",
      "Magma Chest",
      "Castle Chest",
      "Candy Chest",
      "Cheap Mount Chest",
      "Mount Chest"
   },
   CurrentOption = "Training Area Chest",
   MultipleOptions = false,
   Flag = "QOLDropdown2",
   Callback = function(Option)
      vars.SelectedChestName = Option[1]
      for i, v in pairs(ChestOptions) do
         if v == vars.SelectedChestName then
            vars.SelectedChest = i
            break
         end
      end
   end,
})

local QOLButton5 = QOLTab:CreateButton({
   Name = "Buy Chest",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("OpenPetChest"):InvokeServer(vars.SelectedChest)
   end,
})

local QOLParagraph3 = QOLTab:CreateParagraph({Title = "Auto Reroll", Content = "Automatically deletes the pet in the selected slot and buys another chest"})

local QOLButton5 = QOLTab:CreateButton({
   Name = "Reroll Pet",
   Callback = function()
      if vars.SelectedPet and vars.SelectedPet > 0 then
         if vars.DeletePetLockTimer > 0 then 
            game:GetService("ReplicatedStorage").Remote.DeletePet:FireServer(vars.SelectedPet)
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("OpenPetChest"):InvokeServer(vars.SelectedChest)
         else
            Rayfield:Notify({
               Title = "Delete Pet Lock",
               Content = "Delete Pet Lock prevented you from deleting the selected pet. Press the button above to disable it for 1 minute.",
               Duration = 5,
               Image = nil
            })
         end
      else
         Rayfield:Notify({
            Title = "No Pet Selected!",
            Content = "You did not select a pet slot above!",
            Duration = 5,
            Image = nil,
            Actions = {
            },
         })
      end
   end,
})

local QOLToggle2 = QOLTab:CreateToggle({
   Name = "Roll Until Rarity",
   CurrentValue = false,
   Flag = "QOLToggle2",
   Callback = function(Value)
      vars.AutoReroll = Value
   end,
})

local QOLDropdown3 = QOLTab:CreateDropdown({
   Name = "Select Chest",
   Options = {
      "COMMON",
      "RARE",
      "EPIC",
      "LEGENDARY",
      "GODLY"
   },
   CurrentOption = "COMMON",
   MultipleOptions = true,
   Flag = "QOLDropdown3",
   Callback = function(Option)
      vars.SelectedRarities = Option
   end,
})

local QOLParagraph4 = QOLTab:CreateParagraph({Title = "Scamming", Content = "Removes all pets in your side and accepts, usually too fast for the other side to realize."})

local QOLButton6 = QOLTab:CreateButton({
   Name = "Scam",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("TradeUpdate"):FireServer("UpdateOffer",1,0)
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("TradeUpdate"):FireServer("UpdateOffer",2,0)
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("TradeUpdate"):FireServer("UpdateOffer",3,0)
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("TradeUpdate"):FireServer("UpdateOffer",4,0)
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("TradeUpdate"):FireServer("SetReady", true)
   end,
})

local QOLSection3 = QOLTab:CreateSection("GUI Blockers")

local QOLToggle3 = QOLTab:CreateToggle({
   Name = "Remove Home TP Black Screen",
   CurrentValue = false,
   Flag = "QOLToggle3",
   Callback = function(Value)
      vars.HomeTPBlack = Value
   end,
})

local QOLToggle4 = QOLTab:CreateToggle({
   Name = "Remove Location TP Black Screen",
   CurrentValue = false,
   Flag = "QOLToggle4",
   Callback = function(Value)
      vars.LocationTPBlack = Value
   end,
})

local QOLToggle5 = QOLTab:CreateToggle({
   Name = "Spell No Wait",
   CurrentValue = false,
   Flag = "QOLToggle5",
   Callback = function(Value)
      local actionhandler = require(game:GetService("Players").LocalPlayer.PlayerScripts.GameHandler.ActionHandler)
      local stats = debug.getupvalue(actionhandler.CastSpell, 2)
      for _, spell in stats do
         spell.NoWait = Value
      end
      debug.setupvalue(actionhandler.CastSpell, 2, stats)
   end,
})

local QOLToggle6 = QOLTab:CreateToggle({
   Name = "No Stop",
   CurrentValue = false,
   Flag = "QOLToggle",
   Callback = function(Value)
      vars.NoStop = Value
   end,
})

print("[WSG] Loading Quest Tab")

local QuestTab = Window:CreateTab("Quest", nil)

local QuestParagraph1 = QuestTab:CreateParagraph({Title = "Quest Manipulation", Content = "Give yourself quests with this function, no matter the distance and level you are! DO NOT SPAM THESE REMOTES! NOTE THAT THERE IS A SMALL COOLDOWN BETWEEN FINISHING AND RECEIVING A QUEST."})

local QuestDropdown1 = QuestTab:CreateDropdown({
   Name = "Select Quest",
   Options = {
      "LJ:1","LJ:2","LJ:3","LJ:4","LJ:5","LJ:6","LJ:7","LJ:8",
      "BT:1","BT:2","BT:3","BT:4","BT:5","BT:6","BT:7","BT:8","BT:9",
      "CH:1","CH:2","CH:3","CH:4","CH:5","CH:6","CH:7","CH:8",
      "LP:1","LP:2","LP:3","LP:4","LP:5","LP:6","LP:7","LP:8","LP:9","LP:10","LP:11","LP:12","LP:13",
      "WS:1","WS:2","WS:3","WS:4","WS:5","WS:6","WS:7","WS:8","WS:9","WS:10","WS:11",
      "OM:1","OM:2","OM:3","OM:4","OM:5","OM:6","OM:7","OM:8","OM:9","OM:10","OM:11",
      "VB:1","VB:2","VB:3","VB:4","VB:5","VB:6","VB:7","VB:8","VB:9","VB:10",
      "VD:1","VD:2","VD:3","VD:4","VD:5","VD:6","VD:7",
      "CJ:1","CJ:2","CJ:3","CJ:4","CJ:5","CJ:6","CJ:7","CJ:8","CJ:9","CJ:10","CJ:11"
   },
   CurrentOption = {"LJ:1"},
   MultipleOptions = false,
   Flag = "QuestDropdown1",
   Callback = function(Option)
      vars.SelectedQuest = Option[1]
   end,
})

local QuestButton1 = QuestTab:CreateButton({
   Name = "Give Quest",
   Callback = function()
      if vars.SelectedQuest then
         game:GetService("ReplicatedStorage").Remote.AcceptQuest:FireServer(vars.SelectedQuest)
      else
         Rayfield:Notify({
            Title = "Error",
            Content = "No quest selected! How did this happen?",
            Duration = 5,
            Image = nil,
            Actions = {
               Ignore = {
                  Name = "Debug",
                  Callback = function()
                  print('Selected Quest: ')
                  print(vars.SelectedQuest)
               end},
            },
         })
      end
   end,
})

local QuestKeybind1 = QuestTab:CreateKeybind({
   Name = "Keybind", 
   CurrentKeybind = "F",
   HoldToInteract = false,
   Flag = "QuestKeybind1",
   Callback = function(Keybind)
      if vars.SelectedQuest then
            game:GetService("ReplicatedStorage").Remote.AcceptQuest:FireServer(vars.SelectedQuest)
      else
         Rayfield:Notify({
            Title = "Error",
            Content = "No quest selected! How did this happen?",
            Duration = 5,
            Image = nil,
            Actions = {
               Ignore = {
                  Name = "Debug",
                  Callback = function()
                  print('Selected Quest: ')
                  print(vars.SelectedQuest)
               end},
            },
         })
      end
   end,
})

local QuestButton2 = QuestTab:CreateButton({
   Name = "Cancel Quest",
   Callback = function()
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("CancelQuest"):FireServer()
   end,
})

local QuestKeybind2 = QuestTab:CreateKeybind({
   Name = "Keybind",
   CurrentKeybind = "F",
   HoldToInteract = false,
   Flag = "QuestKeybind2",
   Callback = function(Keybind)
      game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("CancelQuest"):FireServer()
   end,
})

local QuestToggle1 = QuestTab:CreateToggle({
   Name = "Auto Give Quest",
   CurrentValue = false,
   Flag = "QuestToggle1",
   Callback = function(Value)
      vars.AutoQuestToggle = Value
   end,
})

local QuestParagraph2 = QuestTab:CreateParagraph({Title = "Auto Give", Content = "CJ:4 is Kill 1 Training Dummy (in Training World) but gives a ton of XP and Gold, useful for super fast progression in all game stages. Auto Give CJ:4 Quest function automatically gives you the quest whenever you press E or Q (assuming you one shot Dummies)."})

print("[WSG] Loading Potion Tab")

local PotionTab = Window:CreateTab("Potion", nil)

local PotionParagraph1 = PotionTab:CreateParagraph({Title = "Potion Triggers", Content = "Click on the buttons to pick up a potion in the world (if avaliable) Use Auto Health/Mana to automatically pick up potions when value falls below threshold."})

local PotionParagraph2 = PotionTab:CreateParagraph({Title = "Replenish Rates", Content = "HP from Enemy Kill: 50%, HP from Spell: 25%, Mana: 30%. Replenish rate of potions spawned from enemy kills are RELATIVE to the player who killed the enemy's MAX HP/MANA."})

local PotionSection1 = PotionTab:CreateSection("Health")

local PotionButton1 = PotionTab:CreateButton({
   Name = "Get Health Potion",
   Callback = function()
      if vars.HPot then firetouchinterest(RootPart, vars.HPot.Forcefield, 0) end
   end,
})

local PotionKeybind1 = PotionTab:CreateKeybind({
   Name = "Keybind",
   CurrentKeybind = "F",
   HoldToInteract = false,
   Flag = "PotionKeybind1",
   Callback = function(Keybind)
      if vars.HPot then firetouchinterest(RootPart, vars.HPot.Forcefield, 0) end
   end,
})

local PotionToggle1 = PotionTab:CreateToggle({
   Name = "Auto Health",
   CurrentValue = false,
   Flag = "PotionToggle1",
   Callback = function(Value)
      vars.AutoHealthToggle = Value
   end,
})

local PotionSlider1 = PotionTab:CreateSlider({
   Name = "Auto Health Threshold",
   Range = {0, 100},
   Increment = 1,
   Suffix = "% HP",
   CurrentValue = 50,
   Flag = "PotionSlider1",
   Callback = function(Value)
      vars.AutoHealthThreshold = Value
   end,
})


local PotionSection2 = PotionTab:CreateSection("Mana")

local PotionButton2 = PotionTab:CreateButton({
   Name = "Get Mana Potion",
   Callback = function()
      if vars.MPot then firetouchinterest(Humanoid.LeftLeg, vars.MPot.Forcefield, 0) end
   end,
})

local PotionKeybind2 = PotionTab:CreateKeybind({
   Name = "Keybind",
   CurrentKeybind = "F",
   HoldToInteract = false,
   Flag = "PotionKeybind2",
   Callback = function(Keybind)
      if vars.MPot then firetouchinterest(Humanoid.LeftLeg, vars.MPot.Forcefield, 0) end
   end,
})

local PotionToggle2 = PotionTab:CreateToggle({
   Name = "Auto Mana",
   CurrentValue = false,
   Flag = "PotionToggle2",
   Callback = function(Value)
      vars.AutoManaToggle = Value
   end,
})

local PotionSlider2 = PotionTab:CreateSlider({
   Name = "Auto Mana Threshold",
   Range = {0, 100},
   Increment = 1,
   Suffix = "% Mana",
   CurrentValue = 70,
   Flag = "PotionSlider2",
   Callback = function(Value)
      vars.AutoManaThreshold = Value
   end,
})

print("[WSG] Loading Auto Farm Tab")

local AutoFarmTab = Window:CreateTab("Auto Farm", nil)

local AutoFarmParagraph1 = AutoFarmTab:CreateParagraph({Title = "Auto Farm Function", Content = "Automatically farms an enemy, targetting the closest one that is within range of the spell chosen. Configure other settings below."})

local AutoFarmToggle1 = AutoFarmTab:CreateToggle({
   Name = "Auto Farm Toggle",
   CurrentValue = false,
   Flag = "AutoFarmToggle1",
   Callback = function(Value)
      vars.AutoFarmToggle = Value
   end,
})

local AutoFarmKeybind1 = AutoFarmTab:CreateKeybind({
   Name = "Keybind",
   CurrentKeybind = "F",
   HoldToInteract = false,
   Flag = "AutoFarmKeybind1",
   Callback = function(Keybind)
      vars.AutoFarmToggle = not vars.AutoFarmToggle
      AutoFarmToggle1:Set(vars.AutoFarmToggle)
      Rayfield:Notify({
         Title = "Auto Farm Keybind",
         Content = "Toggled!",
         Duration = 5,
         Image = nil,
         Actions = {
         },
      })
   end,
})


local AutoFarmSection1 = AutoFarmTab:CreateSection("Settings")

local AutoFarmDropdown1 = AutoFarmTab:CreateDropdown({
   Name = "Enemy Selection",
   Options = {
      "[1] Training Dummy",
      "[3] Dummy Warrior",
      "[6] Dummy Archer",
      "[8] Dummy Spearman",
      "[12] Dummy Wizard",
      "[24] Earth Golem",
      "[24] Summoned Earth Rock",
      "Dummy King",
      "[12] Green Slime",
      "[17] Giant Green Slime",
      "[15] Spider",
      "[20] Big Spider",
      "[22] Wolf",
      "[25] Werewolf",
      "[26] Bear",
      "[32] Stone Golem",
      "[32] Summoned Rock",
      "Lumberjack",
      "Lumberjack? (Werewolf)",
      "[28] Beach Crab",
      "[30] Clam",
      "[32] Rock Crab",
      "[35] Jellyfish",
      "[36] Ice Jellyfish",
      "[38] Green Pirate",
      "[39] Red Pirate",
      "[42] Water Golem",
      "[42] Summoned Water Rock",
      "Pirate King",
      "[40] Magma Slime",
      "[43] Giant Magma Slime",
      "[43] Fire Ant",
      "[46] Giant Fire Ant",
      "[48] Magma Crab",
      "[49] Magma Spider",
      "[51] Magma Scorpion",
      "[53] Magma Worm",
      "[54] Magma Golem",
      "[54] Summoned Magma Rock",
      "Magma King",
      "Magma Eater",
      "[58] Elite Dummy Knight",
      "[60] Elite Dummy Archer",
      "[62] Elite Dummy Spearman",
      "[64] Wasp",
      "[66] Giant Wasp",
      "[66] Stumpant",
      "[68] Treant",
      "[69] Rock Scorpion",
      "[71] Rock Titan",
      "[74] Small Jello",
      "[75] Cupcake",
      "[77] Donut",
      "[78] Big Jello",
      "[80] Gummy Worm",
      "[81] Gingerbread Soldier",
      "[82] Gingerbread Wizard",
      "[84] Candy Golem",
      "Candy Chomper (also targets gates)"
   },
   CurrentOption = {"[1] Training Dummy"},
   MultipleOptions = true,
   Flag = "AutoFarmDropdown1",
   Callback = function(Options)
      vars.AutoFarmEnemyNames = {}
      vars.AutoFarmEnemies = {}
      for _, Option in ipairs(Options) do
         table.insert(vars.AutoFarmEnemyNames, Option)
      end
      for _, SelectedEnemyName in ipairs(vars.AutoFarmEnemyNames) do
         for Identifier, SelectionName in pairs(AutoFarmEnemyOptions) do
            if SelectionName ==  SelectedEnemyName then
               table.insert(vars.AutoFarmEnemies, Identifier)
               break
            end
         end
      end
   end,
})

local AutoFarmDropdown2 = AutoFarmTab:CreateDropdown({
   Name = "Target Method",
   Options = {"Closest","Farthest","Never Hit"},
   CurrentOption = {"Closest"},
   MultipleOptions = false,
   Flag = "AutoFarmDropdown2",
   Callback = function(Option)
      vars.AutoFarmTarget = Option[1]
   end,
})

local AutoFarmButton1 = AutoFarmTab:CreateButton({
   Name = "Clear Hit Enemies",
   Callback = function()
      vars.HitEnemies = {}
      Rayfield:Notify({
         Title = "Clear Hit Enemies",
         Content = "All tracked enemies cleared. This is really useful because this script tries to attack enemies through walls, and does not register if they are actually hit.",
         Duration = 5,
         Image = nil,
         Actions = {
         },
      })
   end,
})

local AutoFarmParagraph2 = AutoFarmTab:CreateParagraph({Title = "Spell Delay", Content = "Spell Delay is the amount of time to cycle through ONE of your spells, so the amount of time to recharge the spell. You should have the same spell in both slots."})

local AutoFarmSlider1 = AutoFarmTab:CreateSlider({
   Name = "Spell Delay",
   Range = {0, 20},
   Increment = 0.1,
   Suffix = "sec",
   CurrentValue = 1.5,
   Flag = "AutoFarmSlider1",
   Callback = function(Value)
      vars.AutoFarmDelay = Value
   end,
})

local AutoFarmParagraph3 = AutoFarmTab:CreateParagraph({Title = "Spell Range", Content = "Spell Range is the range of a certain spell (in studs) required to be able to hit an enemy. Just guess and check because the algorithm targets the closest enemy. I might code a function to help you determine range, or just a list."})

local AutoFarmSlider2 = AutoFarmTab:CreateSlider({
   Name = "Spell Range",
   Range = {0, 150},
   Increment = 1,
   Suffix = "studs",
   CurrentValue = 85,
   Flag = "AutoFarmSlider2",
   Callback = function(Value)
      vars.SpellRange = Value
   end,
})

local AutoFarmParagraph4 = AutoFarmTab:CreateParagraph({Title = "Auto Farm Quest", Content = "This only auto gives the CJ:4 quest for when you auto farm Dummy. AFAIK this is the fastest grind method for XP and coins (correct me if I'm wrong) This is a replacement for Auto Give Quest (so turn it off)."})

local AutoFarmToggle2 = AutoFarmTab:CreateToggle({
   Name = "Auto Farm Quest",
   CurrentValue = false,
   Flag = "AutoFarmToggle2",
   Callback = function(Value)
      vars.AutoFarmQuestToggle = Value
   end,
})

local AutoFarmToggle3 = AutoFarmTab:CreateToggle({
   Name = "Auto Recharge at 30% (I think it requires gamepass)",
   CurrentValue = false,
   Flag = "AutoFarmToggle3",
   Callback = function(Value)
      vars.AutoRechargeToggle = Value
   end,
})

print("[WSG] Loading Tracker Tab")

local TrackerTab = Window:CreateTab("Tracker", nil)

local ToggleGold, ToggleXP
local TrackerButton1 = TrackerTab:CreateButton({
   Name = "Toggle Trackers",
   Callback = function()
      ToggleGold()
      ToggleXP()
      Rayfield:Notify({
         Title = "Toggle Trackers",
         Content = "Toggled both Gold and XP trackers.",
         Duration = 5,
         Image = nil,
         Actions = {
         },
      })
   end,
})

local ResetGold, ResetXP
local TrackerButton2 = TrackerTab:CreateButton({
   Name = "Reset Trackers",
   Callback = function()
      ResetGold()
      ResetXP()
      Rayfield:Notify({
         Title = "Reset Trackers",
         Content = "Reset both Gold and XP trackers.",
         Duration = 5,
         Image = nil,
         Actions = {
         },
      })
   end,
})

local TrackerSection1 = TrackerTab:CreateSection("Gold")

local TrackerLabel1 = TrackerTab:CreateLabel("Tracked Gold: 0")

local TrackerLabel2 = TrackerTab:CreateLabel("Tracked Duration: 0 seconds")

local TrackerLabel3 = TrackerTab:CreateLabel("Gold/Hour: 0")

local TrackerToggle1 = TrackerTab:CreateToggle({
   Name = "Track Gold",
   CurrentValue = false,
   Flag = "TrackerToggle1",
   Callback = function(Value)
      vars.TrackGold = Value
   end,
})

local TrackerButton3 = TrackerTab:CreateButton({
   Name = "Reset Gold",
   Callback = function()
      ResetGold()
      Rayfield:Notify({
         Title = "Reset Gold",
         Content = "Tracked Gold has been reset for this session.",
         Duration = 5,
         Image = nil,
         Actions = {
         },
      })
   end,
})

local TrackerSection2 = TrackerTab:CreateSection("XP")

local TrackerLabel4 = TrackerTab:CreateLabel("Tracked XP: 0")

local TrackerLabel5 = TrackerTab:CreateLabel("Tracked Duration: 0 seconds")

local TrackerLabel6 = TrackerTab:CreateLabel("XP/Hour: 0")

local TrackerToggle2 = TrackerTab:CreateToggle({
   Name = "Track XP",
   CurrentValue = false,
   Flag = "TrackerToggle2",
   Callback = function(Value)
      vars.TrackXP = Value
   end,
})

local TrackerButton4 = TrackerTab:CreateButton({
   Name = "Reset XP",
   Callback = function()
      ResetXP()
      Rayfield:Notify({
         Title = "Reset XP",
         Content = "Tracked XP has been reset for this session.",
         Duration = 5,
         Image = nil,
         Actions = {
         },
      })
   end,
})

local TrackerSection3 = TrackerTab:CreateSection("Levels")

local TrackerLabel7 = TrackerTab:CreateSection("A more accurate display of leveling than the default GUI bar")

local TrackerLabel8 = TrackerTab:CreateSection("Do note that these numbers are still a rough estimate")

local TrackerLabel9 = TrackerTab:CreateLabel("Level: 0")

local TrackerLabel10 = TrackerTab:CreateLabel("XP To Next Level: 0")

local TrackerLabel11 = TrackerTab:CreateLabel("Time to Next Level: No Data")

print("[WSG] Loading Tools Tab")

local ToolTab = Window:CreateTab("Tools", nil)

local ToolParagraph1 = ToolTab:CreateParagraph({Title = "Small Things", Content = "These are probably availiable in other universal scripts but I find it easy to access here. Turning walkspeed on and keeping it at 16 will cancel the spell delay."})

local ToolLabel1 = ToolTab:CreateLabel("Walkspeed")

local ToolToggle1 = ToolTab:CreateToggle({
   Name = "Walkspeed Toggle",
   CurrentValue = false,
   Flag = "ToolToggle1",
   Callback = function(Value)
      vars.WalkspeedToggle = Value
   end,
})

local ToolSlider1 = ToolTab:CreateSlider({
   Name = "Walkspeed",
   Range = {0, 100},
   Increment = 1,
   Suffix = "Studs/Sec",
   CurrentValue = 16,
   Flag = "ToolSlider1",
   Callback = function(Value)
      vars.Walkspeed = Value
   end,
})

local ToolToggle2 = ToolTab:CreateToggle({
   Name = "Jump Power Toggle",
   CurrentValue = false,
   Flag = "ToolToggle2",
   Callback = function(Value)
      vars.JumpPowerToggle = Value
   end,
})

local ToolSlider2 = ToolTab:CreateSlider({
   Name = "Jump Power",
   Range = {0, 250},
   Increment = 1,
   Suffix = "Studs",
   CurrentValue = 50,
   Flag = "ToolSlider2",
   Callback = function(Value)
      vars.JumpPower = Value
   end,
})

local ToolSection1 = ToolTab:CreateSection("Universal Scripts")

local ToolButton1 = ToolTab:CreateButton({
   Name = "Infinite Yield",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() -- Credit: Infinite Yield
   end,
})

local ToolButton2 = ToolTab:CreateButton({
   Name = "Remote Spy (Simple Spy v3)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))() -- Credit: SimpleSpy v3
   end,
})

local ToolButton3 = ToolTab:CreateButton({
   Name = "Remote Spy (Simple Spy v2.2)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/exxtremestuffs/SimpleSpySource/master/SimpleSpy.lua"))() -- Credit: SimpleSpy v3
   end,
})

local ToolButton4 = ToolTab:CreateButton({
   Name = "Orca",
   Callback = function()
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))() -- Credit: orca
   end,
})

local ToolButton5 = ToolTab:CreateButton({
   Name = "CMD-X",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))() -- Credit: CMD-X
   end,
})

local ToolButton6 = ToolTab:CreateButton({
   Name = "Dex v4",
   Callback = function()
      loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)() -- Credit: Dex v4
   end,
})

local ToolButton7 = ToolTab:CreateButton({
   Name = "Dark Dex Mobile (Modded DDex v3)",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/refs/heads/main/Universal/BypassedDarkDexV3.lua", true))() -- Credit: Modded Dark Dex v3 by Babyhamsta
   end,
})

print("[WSG] Loading Options Tab")

local OptionsTab = Window:CreateTab("Options", nil)

local OptionsDropdown1 = OptionsTab:CreateDropdown({
   Name = "Themes",
   Options = {"Default","AmberGlow","Amethyst","Bloom","DarkBlue","Green","Light","Ocean","Serenity"},
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Flag = "OptionsDropdown1",
   Callback = function(Options)
      Window.ModifyTheme(Options[1])
   end,
})

print("[WSG] Loading Debug Tab")

local DebugTab = Window:CreateTab("Debug", nil)

local DebugButton1 = DebugTab:CreateButton({
   Name = "Reset All Keybinds",
   Callback = function()
      QuestKeybind1:Set("F") -- Keybind (string)
      QuestKeybind2:Set("F") -- Keybind (string)
      PotionKeybind1:Set("F") -- Keybind (string)
      PotionKeybind2:Set("F") -- Keybind (string)
      AutoFarmKeybind1:Set("F") -- Keybind (string)
   end,
})

local DebugButton2 = DebugTab:CreateButton({
   Name = "Dump HitEnemies",
   Callback = function()
      print("Dumping HitEnemies Table")
      for i, v in pairs(vars.HitEnemies) do
         print(i)
         print(v)
      end
      print("Done")
   end,
})

local DebugButton3 = DebugTab:CreateButton({
   Name = "Kill GUI",
   Callback = function()
      Rayfield:Destroy()
   end,
})

local DebugButton4 = DebugTab:CreateButton({
   Name = "Teleport to Position",
   Callback = function()
      Player.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(903, 4.1, -400)))
   end,
})

local DebugButton5 = DebugTab:CreateButton({
   Name = "Print in console",
   Callback = function()
      print("hi")
   end,
})

print("[WSG] Loading Scripts")

-- level and position
task.spawn(function()
   while task.wait(0.1) do
      vars.Level = Player.Level.Value
      if vars.Level == "Boss" then
         vars.Arena = Player.Level:FindFirstChild("Arena").Value
      end
      if Player and Player.Character then
         vars.PlayerPos = Player.Character.PrimaryPart and Player.Character.PrimaryPart.Position
      end
   end
end)

-- input detector
UserInputService.InputBegan:Connect(function(input)
   if vars.AutoQuestToggle then
      if input.KeyCode == Enum.KeyCode.E or input.KeyCode == Enum.KeyCode.Q then
         game:GetService("ReplicatedStorage").Remote.AcceptQuest:FireServer("CJ:4")
      end
   end
end)


-- pet lock
task.spawn(function()
   while task.wait(1) do
      if vars.DeletePetLockTimer > 0 then
         vars.DeletePetLockTimer = vars.DeletePetLockTimer - 1
      end
   end
end)

-- home TP black
GameGUI.ChildAdded:Connect(function(Object)
   if Object.Name == "Frame" and vars.HomeTPBlack == true then
      Object.Visible = false
      if vars.HomeTPTimer == 0 then
         vars.HomeTPTimer = 2
      end
   end
end)
task.spawn(function()
   while task.wait() do
      if vars.HomeTPTimer == 2 then
            Rayfield:Notify({
            Title = "Teleporting...",
            Content = "",
            Duration = 1,
            Image = nil
         })
      end
      if vars.HomeTPTimer > 0 then
         vars.HomeTPTimer = vars.HomeTPTimer - 1
         task.wait(1)
      end
   end
end)


-- location TP black
GameGUI:FindFirstChild("Black").ChildAdded:Connect(function()
   if vars.LocationTPBlack == true then
      GameGUI.Black.Visible = false
      if vars.LocationTPTimer == 0 then
         vars.LocationTPTimer = 3
      end
   end
end)
task.spawn(function()
   while task.wait() do
      if vars.LocationTPTimer == 3 then
            Rayfield:Notify({
            Title = "Teleporting...",
            Content = "",
            Duration = 2,
            Image = nil
         })
      end
      if vars.LocationTPTimer > 0 then
         vars.LocationTPTimer = vars.LocationTPTimer - 1
         task.wait(1)
      end
   end
end)

-- health detector
Humanoid.HealthChanged:Connect(function()
    vars.HealthPercentage = Humanoid.Health / Humanoid.MaxHealth * 100
end)


-- mana detector
task.spawn(function()
   while task.wait(0.1) do
      vars.Mana = Player.Mana.value
      vars.MaxMana = Player.MaxMana.value
      if vars.PreviousMana ~= vars.Mana then
         vars.ManaPercentage = vars.Mana / vars.MaxMana * 100
      end
      vars.PreviousMana = vars.Mana
   end
end)


-- auto potion loop
task.spawn(function()
   while task.wait(0.1) do
      local success1 = pcall(function()
         vars.HPot = Workspace.Effects:FindFirstChild("HealthPotion")
      end)
      local success2 = pcall(function()
         vars.MPot = Workspace.Effects:FindFirstChild("ManaPotion")
      end)
      if vars.HPot then
         PotionButton1:Set("Get Health Potion - Avaliable")
      else
         PotionButton1:Set("Get Health Potion - Unavaliable")
      end
      if vars.MPot then
         PotionButton2:Set("Get Mana Potion - Avaliable")
      else
         PotionButton2:Set("Get Mana Potion - Unavaliable")
      end
      if vars.AutoHealthToggle == true and vars.HealthPercentage < vars.AutoHealthThreshold then
         if vars.HPot then firetouchinterest(Humanoid.LeftLeg, vars.HPot.Forcefield, 0) end
      end
      if vars.AutoManaToggle == true and vars.ManaPercentage < vars.AutoManaThreshold then
         if vars.MPot then firetouchinterest(Humanoid.LeftLeg, vars.MPot.Forcefield, 0) end
      end
   end
end)


-- autofarm
local function ConnectEnemyRemoved(Folder)
   if Folder and not vars.ConnectedEnemyFolders[Folder] then
      vars.ConnectedEnemyFolders[Folder] = Folder.ChildRemoved:Connect(function(DeletedEnemy)
         vars.HitEnemies[DeletedEnemy] = nil
      end)
   end
end

task.spawn(function()
   while task.wait(vars.AutoFarmDelay/2) do
      if vars.PlayerPos and vars.AutoFarmToggle then
         local TargetEnemy = nil
         local TargetDistance = vars.AutoFarmTarget == "Farthest" and 0 or math.huge -- if targetting farthest default is 0, otherwise its math.huge
         for _, EnemyName in ipairs(vars.AutoFarmEnemies) do
            -- search levels
            for _, LevelFolder in ipairs(Workspace.Levels:GetChildren()) do
               local LevelEnemiesFolder = LevelFolder:FindFirstChild("Enemies")
               if LevelEnemiesFolder then
                  ConnectEnemyRemoved(LevelEnemiesFolder)
                  for _, Enemy in ipairs(LevelEnemiesFolder:GetChildren()) do
                     if Enemy.Name == EnemyName then
                        local EnemyPos = Enemy.PrimaryPart and Enemy.PrimaryPart.Position
                        if EnemyPos then
                           local Distance = (vars.PlayerPos - EnemyPos).magnitude

                           if vars.AutoFarmTarget == "Closest" then
                              if Distance < TargetDistance then
                                 TargetEnemy = Enemy
                                 TargetDistance = Distance
                              end
                           elseif vars.AutoFarmTarget == "Farthest" then
                              if Distance > TargetDistance then
                                 TargetEnemy = Enemy
                                 TargetDistance = Distance
                              end
                           elseif vars.AutoFarmTarget == "Never Hit" then
                              if vars.HitEnemies[Enemy] == nil and Distance < TargetDistance and Distance < vars.SpellRange then
                                 TargetEnemy = Enemy
                                 TargetDistance = Distance
                              end
                           end
                        end
                     end
                  end
               end
            end

            -- search boss arenas
            for _, BossArenaFolder in ipairs(Workspace.BossArenas:GetChildren()) do
               local BossArenaEnemiesFolder = BossArenaFolder:FindFirstChild("Enemies")
               if BossArenaEnemiesFolder then
                  ConnectEnemyRemoved(BossArenaEnemiesFolder)
                  for _, Enemy in ipairs(BossArenaEnemiesFolder:GetChildren()) do
                     if Enemy.Name == EnemyName then
                        local EnemyPos = Enemy.PrimaryPart and Enemy.PrimaryPart.Position
                        if EnemyPos then
                           local Distance = (vars.PlayerPos - EnemyPos).magnitude

                           if vars.AutoFarmTarget == "Closest" then
                              if Distance < TargetDistance and Distance < vars.SpellRange then
                                 TargetEnemy = Enemy
                                 TargetDistance = Distance
                              end
                           elseif vars.AutoFarmTarget == "Farthest" then
                              if Distance > TargetDistance and Distance < vars.SpellRange then
                                 TargetEnemy = Enemy
                                 TargetDistance = Distance
                              end
                           elseif vars.AutoFarmTarget == "Never Hit" then
                              if vars.HitEnemies[Enemy] == nil and Distance < TargetDistance and Distance < vars.SpellRange then
                                 TargetEnemy = Enemy
                                 TargetDistance = Distance
                              end
                           end
                        end
                     end
                  end
               end
            end
         end

         -- perform attack
         if TargetEnemy and TargetDistance < vars.SpellRange then
            if vars.AutoFarmQuestToggle then 
               game:GetService("ReplicatedStorage").Remote.AcceptQuest:FireServer("CJ:4") 
            end
            game:GetService("ReplicatedStorage").Remote.CastSpell:FireServer(vars.SpellState, TargetEnemy)
            -- log hit enemy
            if vars.AutoFarmTarget == "Never Hit" then vars.HitEnemies[TargetEnemy] = "hit" end
            vars.SpellState = 3 - vars.SpellState -- toggle between 1 and 2
         end
      end
   end
end)


-- auto recharge
task.spawn(function()
   while task.wait(0.1) do
      if vars.AutoRechargeToggle == true and vars.ManaPercentage < 30 then 
         game:GetService("ReplicatedStorage").Remote.Recharge:FireServer() 
         --RefillMana();
      end
   end
end)


-- trackers

local function ParseTrackerText(inputtext)
   local amount, abbreviation, TextType = inputtext:match("([%d]*[%.]*[%d]*)%s*([kMB]?)%s*(%a*)")
   if not TextType or TextType == "" then
      TextType = "Gold"
   end
   local Multiplier = Multipliers[abbreviation:upper()] or 1
   local TotalAmount = tonumber(amount) * Multiplier
   return TotalAmount, TextType
end

-- PickupGuiContainer.ChildAdded handler
PickupGuiContainer.ChildAdded:Connect(function(GuiFrame) 
   for _, TextLabel in ipairs(GuiFrame:GetChildren()) do
      if TextLabel.Name == "Amount" and vars.TrackedElements[GuiFrame] ~= true then
         task.wait(0.1) -- wait for correct text
         local Amount, Type = ParseTrackerText(TextLabel.Text)
         
         -- Update Gold or XP depending on the type
         if Type == "Gold" then
            if vars.TrackGold == true then
               vars.TrackedGold = vars.TrackedGold + Amount
               TrackerLabel1:Set("Tracked Gold: " .. string.format("%0.0f", vars.TrackedGold):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""))
            end
         elseif Type == "XP" then
            if vars.TrackXP == true then
               vars.TrackedXP = vars.TrackedXP + Amount
               TrackerLabel4:Set("Tracked XP: " .. string.format("%0.0f", vars.TrackedXP):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""))
            end
         else
            Rayfield:Notify({
               Title = "Error",
               Content = "Statistic type is not 'Gold' or 'XP'! How did this happen?",
               Duration = 5,
               Image = nil,
               Actions = {
                  Ignore = {
                     Name = "Debug",
                     Callback = function()
                        print("Raw:")
                        print(TextLabel.Text)
                        print("Amount:")
                        print(Amount)
                        print("Type:")
                        print(Type)
                     end
                  },
               },
            })
         end

         -- Mark this GuiFrame as tracked
         vars.TrackedElements[GuiFrame] = true
         GuiFrame.AncestryChanged:Connect(function(_, parent)
            if parent == nil then
               vars.TrackedElements[GuiFrame] = nil
            end
         end)
         break
      end
   end
end)

-- Tracker timer
task.spawn(function()
   while task.wait(1) do
      if vars.TrackGold == true then
         vars.TrackedGoldTimer = vars.TrackedGoldTimer + 1
         vars.GoldHours = math.floor(vars.TrackedGoldTimer / 3600)
         vars.GoldMinutes = math.floor((vars.TrackedGoldTimer % 3600) / 60)
         vars.GoldSeconds = vars.TrackedGoldTimer % 60 

         if vars.GoldHours > 0 then
            vars.GoldDurationString = vars.GoldHours .. " hour(s), " .. vars.GoldMinutes .. " minute(s), and " .. vars.GoldSeconds .. " second(s)"
         elseif vars.GoldMinutes > 0 then
            vars.GoldDurationString = vars.GoldMinutes .. " minute(s) and " .. vars.GoldSeconds .. " second(s)"
         else
            vars.GoldDurationString = vars.GoldSeconds .. " second(s)"
         end

         TrackerLabel2:Set("Tracked Duration: " .. vars.GoldDurationString)

         vars.GoldPerHour = math.floor(vars.TrackedGold / vars.TrackedGoldTimer * 3600)
         TrackerLabel3:Set("Gold/Hour: " .. string.format("%0.0f", vars.GoldPerHour):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""))
      end

      if vars.TrackXP == true then
         vars.TrackedXPTimer = vars.TrackedXPTimer + 1
         vars.XPHours = math.floor(vars.TrackedXPTimer / 3600)
         vars.XPMinutes = math.floor((vars.TrackedXPTimer % 3600) / 60)
         vars.XPSeconds = vars.TrackedXPTimer % 60 

         if vars.XPHours > 0 then
            vars.XPDurationString = vars.XPHours .. " hour(s), " .. vars.XPMinutes .. " minute(s), and " .. vars.XPSeconds .. " second(s)"
         elseif vars.XPMinutes > 0 then
            vars.XPDurationString = vars.XPMinutes .. " minute(s) and " .. vars.XPSeconds .. " second(s)"
         else
            vars.XPDurationString = vars.XPSeconds .. " second(s)"
         end

         TrackerLabel5:Set("Tracked Duration: " .. vars.XPDurationString)

         vars.XPPerHour = math.floor(vars.TrackedXP / vars.TrackedXPTimer * 3600)
         TrackerLabel6:Set("XP/Hour: " .. string.format("%0.0f", vars.XPPerHour):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""))
      end
   end
end)


-- walkspeed and jumppower management
task.spawn(function()
   while task.wait(0.01) do
      if vars.WalkspeedToggleOld == true and vars.WalkspeedToggle == false then
         Humanoid.WalkSpeed = 16
      end
      if vars.WalkspeedToggle then
         Humanoid.WalkSpeed = vars.Walkspeed
      end
      if vars.JumpPowerToggleOld == true and vars.JumpPowerToggle ==false then
         Humanoid.JumpPower = 50
      end
      if vars.JumpPowerToggle then
         Humanoid.JumpPower = vars.JumpPower
      end
      vars.WalkspeedToggleOld = vars.WalkspeedToggle
      vars.JumpPowerToggleOld = vars.JumpPowerToggle
   end
end)

-- refill mana (doesnt work rn)
local function RefillMana()
   if vars.Level ~= "Boss" then
      game:GetService("ReplicatedStorage").Remote.TouchedRecharge:FireServer(Workspace.Levels.level:WaitForChild("SpawnPoint"))
   end
end


-- toggle and reset trackers
ToggleGold = function()
   vars.TrackGold = not vars.TrackGold
   TrackerToggle1:Set(vars.TrackGold)
end

ToggleXP = function()
   vars.TrackXP = not vars.TrackXP
   TrackerToggle2:Set(vars.TrackXP)
end

ResetGold = function()
   TrackerLabel1:Set("Tracked Gold: 0")
   vars.TrackedGold = 0
   TrackerLabel2:Set("Tracked Duration: 0 seconds")
   vars.TrackedGoldTimer = 0
   TrackerLabel3:Set("Gold/Hour: 0")
   vars.GoldPerHour = 0
end

ResetXP = function()
   TrackerLabel4:Set("Tracked XP: 0")
   vars.TrackedXP = 0
   TrackerLabel5:Set("Tracked Duration: 0 seconds")
   vars.TrackedXPTimer = 0
   TrackerLabel6:Set("XP/Hour: 0")
   vars.XPPerHour = 0   
end

-- xp stats
local function ParseTotalXPValue(value)
   local number, unit = value:match("/([%d%.]+)([KMBT]?)")
   number = tonumber(number)

   if unit == "K" then
       number = number * 1e3 -- Thousand
   elseif unit == "M" then
       number = number * 1e6 -- Million
   elseif unit == "B" then
       number = number * 1e9 -- Billion
   elseif unit == "T" then
       number = number * 1e12 -- Trillion
   end

   return number
end

-- unused rn
local function FormatValue(number)
    local unit = ""
    local formattedValue = number

    if number >= 1e12 then
        unit = "T"  -- Trillion
        formattedValue = number / 1e12
    elseif number >= 1e9 then
        unit = "B"  -- Billion
        formattedValue = number / 1e9
    elseif number >= 1e6 then
        unit = "M"  -- Million
        formattedValue = number / 1e6
    elseif number >= 1e3 then
        unit = "K"  -- Thousand
        formattedValue = number / 1e3
    end

    formattedValue = string.format("%.6g", formattedValue)

    return formattedValue .. unit
end

-- xp level tracker
task.spawn(function()
   while task.wait(1) do
      local XPBar = GameGUI.Stats.ExperienceOutside.Bar
      local XPText = GameGUI.Stats.ExperienceOutside.Amount
      if XPBar and XPText then
         vars.PlayerLevel = Player.leaderstats.Level.Value
         TrackerLabel9:Set("Level: " .. vars.PlayerLevel)
         vars.PlayerXPPercentage = XPBar.Size.X.Scale
         vars.PlayerTotalXP = ParseTotalXPValue(XPText.Text)
         local MissingXP = round((1 - vars.PlayerXPPercentage) * vars.PlayerTotalXP)
         TrackerLabel10:Set("XP To Next Level: " .. string.format("%0.0f", MissingXP):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", ""))
         if vars.XPPerHour and vars.XPPerHour > 0 then
            vars.LevelTimer = round(MissingXP / vars.XPPerHour * 3600)
            vars.LevelHours = math.floor(vars.LevelTimer / 3600)
            vars.LevelMinutes = math.floor((vars.LevelTimer % 3600) / 60)
            vars.LevelSeconds = vars.LevelTimer % 60 

            -- if vars.LevelHours > 0 then
            --    vars.LevelDuration = vars.LevelHours .. " hour(s), " .. vars.LevelMinutes .. " minute(s), and " .. vars.LevelSeconds .. " second(s)"
            -- elseif vars.LevelMinutes > 0 then
            --    vars.LevelDuration = vars.LevelMinutes .. " minute(s) and " .. vars.LevelSeconds .. " second(s)"
            -- else
            --    vars.LevelDuration = vars.LevelSeconds .. " second(s)"
            -- end

            if vars.LevelHours > 0 then
               vars.LevelDuration = vars.LevelHours .. ":" .. vars.LevelMinutes .. ":" .. vars.LevelSeconds .. " (h,m,s)"
            elseif vars.LevelMinutes > 0 then
               vars.LevelDuration = vars.LevelMinutes .. ":" .. vars.LevelSeconds .. " (m,s)"
            else
               vars.LevelDuration = vars.LevelSeconds .. "s"
            end

            TrackerLabel11:Set("Time To Next Level: " .. vars.LevelDuration)
         end
      end
      if vars.XPPerHour and vars.XPPerHour <= 0 then
         TrackerLabel11:Set("Time To Next Level: No Data")
      end
   end
end)

-- autoreoll until rarity
task.spawn(function()
   while task.wait(0.1) do
      local PetGUI = GameGUI.Pets
      if PetGUI and vars.AutoReroll == true then
         if vars.SelectedPet and vars.SelectedPet > 0 then
            if vars.DeletePetLockTimer > 0 then 
               if PetGUI.Visible == true then
                  local slot = PetGUI.ListFrame.ListBackground.List:FindFirstChild(vars.SelectedPet)
                  if slot then
                     local iscorrectrarity = false
                     for _,rarity in pairs(vars.SelectedRarities) do
                        if rarity == slot.Rarity.Text then
                           iscorrectrarity = true
                           break
                        end
                     end
                     if iscorrectrarity == false then
                        game:GetService("ReplicatedStorage").Remote.DeletePet:FireServer(vars.SelectedPet)
                        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("OpenPetChest"):InvokeServer(vars.SelectedChest)
                     else
                        Rayfield:Notify({
                           Title = "Pet Found!",
                           Content = "A pet of the selected rarities has been rolled! Manually reroll a new pet if you don't want the pet in the slot.",
                           Duration = 5,
                           Image = nil
                        })
                        vars.AutoReroll = false
                        QOLToggle2:Set(false)                     
                     end
                  else
                     Rayfield:Notify({
                        Title = "Pet Not Found",
                        Content = "Check that there is a pet in the inputted slot.",
                        Duration = 5,
                        Image = nil
                     })
                     vars.AutoReroll = false
                     QOLToggle2:Set(false)   
                  end
               else
                  Rayfield:Notify({
                     Title = "Pet GUI Not Visible",
                     Content = "Open the Pet Menu so rarity can be seen.",
                     Duration = 5,
                     Image = nil
                  })
                  vars.AutoReroll = false
                  QOLToggle2:Set(false)
               end
            else
               Rayfield:Notify({
                  Title = "Delete Pet Lock",
                  Content = "Delete Pet Lock prevented you from deleting the selected pet. Press the button above to disable it for 1 minute.",
                  Duration = 5,
                  Image = nil
               })
               vars.AutoReroll = false
               QOLToggle2:Set(false)
            end
         else
            Rayfield:Notify({
               Title = "No Pet Selected!",
               Content = "You did not select a pet slot above!",
               Duration = 5,
               Image = nil,
               Actions = {
               },
            })
            vars.AutoReroll = false
            QOLToggle2:Set(false)
         end
      end
   end
end)

local hook;
hook = hookmetamethod(game, "__newindex", function(self, ...)
    local args = {...}
    if vars.NoStop and self == Humanoid and args[1] == "WalkSpeed" and args[2] == 0 then
         return
    end

   return hook(self, ...)
end)

print("[WSG] Loaded!")
