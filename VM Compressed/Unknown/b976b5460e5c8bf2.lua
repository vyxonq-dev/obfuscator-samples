--[[
Sorry, it takes a long time

Turtle Hub V3.89 - Sunday 27th August, 2023 (Latest Updates)
]]

_G.AutoDeleteWithTable = {
   Earth = nil,
   Icy = nil,
   Blackhole = nil,
   Lava = nil,
   Molten = nil,
   Crystal = nil,
   Solar = nil,
   Ice = nil,
   Burning = nil,
   Moon = nil,
   Coconut = nil,
   Palm = nil,
   Treasure = nil,
   Poseidon = nil,
   KingFish = nil,
   Clam = nil,
   Rust = nil,
   Widget = nil,
   Atom = nil,
   Nuclear = nil,
   Mutant = nil,
   Iridescent = nil,
   TRex = nil,
   Herbivore = nil,
   Pterodactyl = nil,
   Gem = nil,
   DinoFossil = nil,
   Mystic = nil,
   Shark = nil,
   Crab = nil,
   Jellyfish = nil,
   Limited = nil
}

local DeleteFuckingPet = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'purchaseEgg' then
        DeleteFuckingPet = Args[2]
end
	return namecall(self, ...) 
end)

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = true, ConfigFolder = "TurtleFi"})
local TweenService = game:GetService("TweenService")

local T1 = Window:MakeTab({
Name = "Farm",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Punch",
Icon = "rbxassetid://0",
PremiumOnly = false
})

function PlayerProxy(playername)
if playername == "all" then
for _,v in pairs(game.Players:GetPlayers()) do
     return v.Name
end
else
for i,v in pairs(game.Players:GetChildren()) do
    if (string.sub(string.lower(v.Name),1,string.len(playername))) == string.lower(playername) then
      return v.Name
    end
 end
end
end

function FuncBypass(TypeName,toggle)
if TypeName == "GameplayPaused" then
if toggle == true then
	game:GetService("GuiService"):SetGameplayPausedNotificationEnabled(false)
else
	game:GetService("GuiService"):SetGameplayPausedNotificationEnabled(true)
end
end
end

local T3 = Window:MakeTab({
Name = "Wrestle",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local S3 = T3:AddSection({
     Name = "SELECT ZONE / MAP"
})

local S1 = T3:AddSection({
     Name = "VS BOT"
})

local S2 = T3:AddSection({
     Name = "VS PLAYER"
})

local T4 = Window:MakeTab({
Name = "Egg & Pet",
Icon = "rbxassetid://0",
PremiumOnly = false
})

T4:AddParagraph("New Feature","open the egg and choose the pet you want to choose for deletion")

--local S4 = T4:AddSection({
--     Name = "Golden (Use Private Server)"
--})

--local Detection_A1 = S4:AddParagraph("Pet detection (in workspace)","#PET_DETECTION_ERROR")

--local S5 = T4:AddSection({
--     Name = "Craft (Use Private Server)"
--})

--local Detection_A2 = S5:AddParagraph("Pet detection (in workspace)","#PET_DETECTION_ERROR")

local T5 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local S102 = T5:AddSection({
     Name = "Teleport V1"
})

local S103 = T5:AddSection({
     Name = "Teleport V2"
})

local T6 = Window:MakeTab({
Name = "Boost",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T7 = Window:MakeTab({
Name = "Event",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T8 = Window:MakeTab({
Name = "Code",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T9 = Window:MakeTab({
Name = "Crate",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local S100 = T9:AddSection({
     Name = "OPEN CRATE"
})

local S101 = T9:AddSection({
     Name = "BUY CRATE"
})

local T11 = Window:MakeTab({
Name = "Pet PXP/XP",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local T10 = Window:MakeTab({
Name = "Game",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local Event_A3 = T7:AddParagraph("Event Eggs available","#EGG_ERROR")
-- Event_A3:Set("","Event Eggs available")

local workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local npc = {}
local zone = {}
local egg = {}
local VSPLAYER = {}
local petIndex = {}
local locationIndex = {}
function AddTable(Table_V,LocalName)
for _,v in pairs(Table_V:GetChildren()) do
    table.insert(LocalName,v.Name)
end
end

function GetText(str)
	return str.Text
end

AddTable(workspace.Zones,zone)
AddTable(ReplicatedStorage.Eggs,egg)
--[[
AddTable(workspace.Zones["1"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["2"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["3"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["4"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["5"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["1"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["2"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["3"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["4"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.Zones["5"].Interactables.ArmWrestling.PVP,VSPLAYER)
AddTable(workspace.PetFolder,petIndex)
--]]
for i = 1, 5 do
    AddTable(workspace.Zones[i].Interactables.ArmWrestling.NPC,npc)
    AddTable(workspace.Zones[i].Interactables.ArmWrestling.PVP,VSPLAYER)
    --AddTable(workspace.Zones[i].Interactables.Teleports.Locations,locationIndex)
end

if workspace.Zones:FindFirstChild("nope") then
AddTable(workspace.Zones["HalloweenWorld"].Interactables.ArmWrestling.NPC,npc)
AddTable(workspace.Zones["HalloweenWorld"].Interactables.ArmWrestling.PVP,VSPLAYER)
end

--[[
local s,e = pcall(function()
workspace.game["MilBase Map"].Hood.AntiCheat:Destroy()
workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt.Enabled = true
workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt.HoldDuration= 0
workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt.MaxActivationDistance = 1230
game.Players.LocalPlayer.Character:PivotTo(workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.CFrame)
for i=1,10 do
fireproximityprompt(workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt)
end
end)

]]

local function B_7_6()
for _,i in pairs(workspace.Zones.HalloweenWorld.Interactables.TrickOrTreat:GetChildren()) do
	if workspace.Zones.HalloweenWorld.Interactables.TrickOrTreat[i].BillboardGui.Frame.Title.Text == "TRICK OR TREAT!" then
	    game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["TrickOrTreatService"]["RE"]["onTrickOrTreat"]:FireServer(i)
	else
	    CreateDialogue("Cooldown","all houses are cooling off, please wait " .. tostring(GetText(workspace.Zones.HalloweenWorld.Interactables.TrickOrTreat[i].BillboardGui.Frame.Title)) .. " to start trick or treat.")
end
end
end

--[[
T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.Toggle = Value
    while wait() do
      if _G.Toggle == false then break end
         
      end
  end    
})
--]]

function TPType(type,pos)
   if type == "tween" then
          TweenService:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out,0,false,0), {CFrame = pos}):Play()
   end
   if type == "teleport" then
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
     end
end

function CreateDialogue(title,desc)
OrionLib:MakeNotification({
   Name = title,
   Content = desc,
   Image = "rbxassetid://0",
   Time = 5
  })
end

local treadmill = {
      Tier = "Tier1",
      Number = "1"
}

T6:AddDropdown({
   Name = "Select Boost",
   Default = "Wins",
   Options = {"Wins","Luck","Golden","Void"},
   Callback = function(Value)
     _G.BoostPoison = Value
  end    
})

S100:AddDropdown({
   Name = "Select Crate",
   Default = "Rust",
   Options = {"Rust","Silver","Gold","Diamond","Emerald"},
   Callback = function(Value)
     _G.CrateSkins = Value
  end    
})

S101:AddDropdown({
   Name = "Select Crate",
   Default = "Rust",
   Options = {"Rust","Silver","Gold","Diamond","Emerald"},
   Callback = function(Value)
     _G.BuyCrateSkins = Value
  end    
})

S101:AddDropdown({
   Name = "Select Amount",
   Default = "1",
   Options = {"1","10","100"},
   Callback = function(Value)
     _G.AmountCrate = Value
  end    
})

S101:AddButton({
  Name = "Buy Crate",
  Callback = function()
   game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmsService.RF.PurchaseCrates:InvokeServer(tostring(_G.BuyCrateSkins) .. "Crate",_G.AmountCrate)
end
})

S100:AddToggle({
  Name = "Auto Roll Crate",
  Default = false,
  Callback = function(Value)
  _G.RollSelectedCrate = Value
    while wait() do
      if _G.RollSelectedCrate == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmsService.RF.RollArmCrateForPlayer:InvokeServer(tostring(_G.CrateSkins) .. "Crate")
      end
  end    
})

S100:AddButton({
  Name = "Roll All Crates",
  Callback = function()
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmsService.RF.RollAllCratesForPlayer:InvokeServer()
  end    
})

T2:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.zone_2 = Value
    treadmill.Number = Value
  end    
})

S3:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.zone_3 = Value
  end    
})

S102:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.zone_TP = Value
  end    
})

--[[S103:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G.ZonePrototype = Value
  end    
})

S103:AddDropdown({
   Name = "Select Area",
   Default = "Beach",
   Options = locationIndex,
   Callback = function(Value)
     _G.AreaPrototype = Value
  end    
})]]

S102:AddDropdown({
   Name = "Select the teleport type",
   Default = "teleport",
   Options = {"teleport","tween"},
   Callback = function(Value)
     _G.TP_TYPE = Value
  end    
})
--[[
T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Biceps / dumbells [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})

T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Wins / Trophy [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})

T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Knuckles [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})

T6:AddButton({ -- fake API, THE ORIGINAL API IS IN THE UI
  Name = "Infinite Grips [ Patched ]",
  Callback = function()
      CreateDialogue("HTTP BAD GATEWAY (505)","this feature has been patched, our API is blocked by anti-cheat.")
  end    
})
--]]

T8:AddButton({
  Name = "Redeem all codes",
  Callback = function()
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("noob")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("WEDNESDAY")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("FIXED")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("200m")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("enchant")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("Leagues")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("pinksandcastle")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("secret")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("gullible")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("knighty")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("axel")
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.CodeRedemptionService.RE.onRedeem:FireServer("THANKSFOR400M")
end
})

S102:AddButton({
  Name = "Teleport",
  Callback = function()
     if _G.zone_TP == "1" then
        TPType(_G.TP_TYPE,CFrame.new(-10326,4,34))
	game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["1"].Interactables.Teleports.Locations.BackToSchool)
    end
     if _G.zone_TP == "2" then
        TPType(_G.TP_TYPE,CFrame.new(-10324,4,637))
	game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["2"].Interactables.Teleports.Locations.Futuristic)
     end
     if _G.zone_TP == "3" then
        TPType(_G.TP_TYPE,CFrame.new(11599,10,-19))
	game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["3"].Interactables.Teleports.Locations.Beach)
    end
     if _G.zone_TP == "4" then
        TPType(_G.TP_TYPE,CFrame.new(-10274,4,-817))
	game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones["4"].Interactables.Teleports.Locations.NuclearBunker)
     end
     if _G.zone_TP == "5" then
        TPType(_G.TP_TYPE,CFrame.new(-10305,-4,-1417))
      end
     if _G.zone_TP == "HalloweenWorld" then
        TPType(_G.TP_TYPE,CFrame.new(9500, 12, 125))
	game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones.HalloweenWorld.Interactables.Teleports.Locations.Halloween)
     end
  end    
})

--[[S103:AddButton({
  Name = "Teleport",
  Callback = function()
  if _G.ZonePrototype == "AquaEvent" or _G.AreaPrototype == "Aqua" then
     game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones.AquaEvent.Interactables.Teleports.Locations.Aqua)
  else
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ZoneService.RE.teleport:FireServer(workspace.Zones[_G.ZonePrototype].Interactables.Teleports.Locations[_G.AreaPrototype])
 end
end
})]]

T2:AddDropdown({
  Name = "Select Punch Tier",
  Default = "Tier1",
  Options = {"Tier1","Tier2","Tier3","Tier4","Tier5","Tier6"},
  Callback = function(Value)
    treadmill.Tier = Value
  end    
})

T2:AddToggle({
  Name = "Auto Punch",
  Default = false,
  Callback = function(Value)
  _G.Tm = Value
    while wait() do
      if _G.Tm == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PunchBagService.RE.onGiveStats:FireServer(treadmill.Number,treadmill.Tier)
      end
  end    
})

S1:AddDropdown({
   Name = "Select NPC",
   Default = "Bully",
   Options = npc,
   Callback = function(Value)
     _G.AI = Value
   end    
})

S1:AddToggle({
  Name = "Auto Wrestle",
  Default = false,
  Callback = function(Value)
  _G.JoinW = Value
    while wait() do
      if _G.JoinW == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer(_G.AI,workspace.Zones[_G.zone_3].Interactables.ArmWrestling.NPC[_G.AI],_G.zone_3)
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})
--[[
S1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.ClickW = Value
    while wait() do
      if _G.ClickW == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})]]

S2:AddDropdown({
   Name = "Select Table",
   Default = "ArmWrestleTable1",
   Options = VSPLAYER,
   Callback = function(Value)
     _G.TABLE_VSPLAYER = Value
   end    
})

S2:AddToggle({
  Name = "Auto Enter Table",
  Default = false,
  Callback = function(Value)
  _G.ENTERTABLE = Value
    while wait() do
      if _G.ENTERTABLE == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterTable:FireServer(workspace.Zones[_G.zone_3].Interactables.ArmWrestling.PVP[_G.TABLE_VSPLAYER])
      end
  end    
})

S2:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.CLICKVSPLAYER = Value
    while wait() do
      if _G.CLICKVSPLAYER == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})
--[[
_G.AutoDeleteWithTable = {
Earth = nil,
Icy = nil,
Blackhole = nil,
Lava = nil,
Molten = nil,
Crystal = nil,
Solar = nil,
Ice = nil,
Burning = nil,
Moon = nil,
Coconut = nil,
Palm = nil,
Treasure = nil,
Poseidon = nil,
KingFish = nil,
Clam = nil,
Rust = nil,
Widget = nil,
Atom = nil,
Nuclear = nil,
Mutant = nil,
Iridescent = nil,
TRex = nil,
Herbivore = nil,
Pterodactyl = nil,
Gem = nil,
DinoFossil = nil,
Mystic = nil,
Shark = nil,
Crab = nil,
Jellyfish = nil,
Limited = nil
}
]]
local dislist = {"=[ Zone 1 ]=","Earth","Icy","Blackhole","Lava","=[ Zone 2 ]=","Molten","Crystal","Solar","Ice","Burning","Moon","=[ Zone 3 ]=","Coconut","Palm","Treasure","Poseidon","KingFish","Clam","=[ Zone 4 ]=","Rust","Widget","Atom","Nuclear","Mutant","Iridescent","=[ Zone 5 ]=","TRex","Herbivore","Pterodactyl","Gem","DinoFossil","Mystic","=[ Aqua Event ]=","Shark","Crab","Jellyfish","=[ Limited Egg ]=","[ Has Ended ]"}

T4:AddDropdown({
   Name = "Select EGG",
   Default = "Earth",
   Options = egg,
   Callback = function(Value)
     _G.Egg = Value
   end    
})
--[[
local common = {
      mouse = false,
      squirrel = false,
      cat = false
}

T4:AddToggle({
  Name = "Blacklist common pet",
  Default = false,
  Callback = function(Value)
    common.mouse = Value
    common.squirrel = Value
    common.cat = false
  end    
})

local uncommon = {
      dog = false,
      cow = false,
      deer = false,
      parrot = false
}

T4:AddToggle({
  Name = "Blacklist uncommon pet",
  Default = false,
  Callback = function(Value)
    uncommon.dog = Value
    uncommon.cow = Value
    uncommon.deer = Value
    uncommon.parrot = Value
  end    
})

local rare = {
      fox = false,
      wolf = false,
}

T4:AddToggle({
  Name = "Blacklist rare pet",
  Default = false,
  Callback = function(Value)
    rare.fox = Value
  end    
})

local legendary = {
      mouse = false,
      bear = false,
      slime = false,
      grassmage = false,
      monkey = false,
      tiger = false,
      unicorn = false,
}

T4:AddToggle({
  Name = "Blacklist legendary pet",
  Default = false,
  Callback = function(Value)
    legendary.mouse = Value
    legendary.bear = Value
    legendary.slime = Value
    legendary.grassmage = Value
    legendary.monkey = Value
    legendary.tiger = Value
  end    
})

local mythical = {
      watermage = false,
      elephant = false,
      astra = false,
}

T4:AddToggle({
  Name = "Blacklist mythical pet",
  Default = false,
  Callback = function(Value)
    mythical.watermage = Value
    mythical.elephant = Value
  end    
})

local unknown = {
      magicmage = false,
      spooky = false,
      quasar = false,
      axeli = false,
}

T4:AddToggle({
  Name = "Blacklist Unknown pet (Blackhole Egg)",
  Default = false,
  Callback = function(Value)
    unknown.magicmage = Value
    unknown.spooky = Value
  end    
})
--]]
T4:AddToggle({
  Name = "Auto Hatch [Auto Save Deleted Pet List]",
  Default = false,
  Callback = function(Value)
  _G.Balls = Value
    while wait() do
      if _G.Balls == false then break end
	  if _G.AutoDeleteWithTable[_G.Egg] == nil then
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.purchaseEgg:InvokeServer(_G.Egg,DeleteFuckingPet)
	 _G.AutoDeleteWithTable[_G.Egg] = DeleteFuckingPet
	else
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EggService.RF.purchaseEgg:InvokeServer(_G.Egg,_G.AutoDeleteWithTable[_G.Egg])
	end
      end
  end    
})

T4:AddToggle({
  Name = "Auto Gold",
  Default = false,
  Callback = function(Value)
  _G.GoldPet = Value
    while wait() do
      if _G.GoldPet == false then break end
        local PatchGold = petIndex[math.random(1, #petIndex)]
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.goldify:InvokeServer({PatchGold,PatchGold,PatchGold,PatchGold,PatchGold})
     end
  end    
})

T4:AddToggle({
  Name = "Auto Craft",
  Default = false,
  Callback = function(Value)
  _G.Crafter = Value
    while wait() do
      if _G.Crafter == false then break end
        local MasterCraft = petIndex[math.random(1, #petIndex)]
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.craft:InvokeServer(MasterCraft,true)
      end
  end    
})
--]]
T4:AddToggle({
  Name = "Auto Equip Best",
  Default = false,
  Callback = function(Value)
  _G.EB = Value
    while wait() do
      if _G.EB == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.equipBest:InvokeServer(game:GetService("Players").LocalPlayer)
      end
  end    
})

local weight = {"1Kg","2Kg","3Kg","4Kg","5Kg","10Kg","15Kg","20Kg","25Kg","50Kg","100Kg","250Kg"}
--[[
T1:AddDropdown({
   Name = "select weight",
   Default = "1Kg",
   Options = weight,
   Callback = function(Value)
     _G.Prototype_A1 = Value
     _G.Prototype_A2 = Value
   end    
})
--]]
T1:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.Click = Value
    while wait() do
      if _G.Click == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onClick:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Spin",
  Default = false,
  Callback = function(Value)
  _G.Spin = Value
    while wait() do
      if _G.Spin == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.SpinService.RE.onSpinRequest:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Reb",
  Default = false,
  Callback = function(Value)
  _G.Rbr = Value
    while wait() do
      if _G.Rbr == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.RebirthService.RE.onRebirthRequest:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Gift",
  Default = false,
  Callback = function(Value)
  _G.Gift = Value
    while wait() do
      if _G.Gift == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("1")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("2")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("3")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("4")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("5")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("6")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("7")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("8")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("9")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("10")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("11")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("12")
	 game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("13")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.TimedRewardService.RE.onClaim:FireServer("14")
      end
  end    
})

T1:AddToggle({
  Name = "Auto spin lucky draw [Blueprint]",
  Default = false,
  Callback = function(Value)
  _G.blueprint = Value
    while wait() do
      if _G.blueprint == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BlueprintService.RF.LuckyDraw:InvokeServer(false)
      end
  end    
})

T1:AddToggle({
  Name = "Auto spin daily lucky draw [Blueprint]",
  Default = false,
  Callback = function(Value)
  _G.dailyblueprint = Value
    while wait() do
      if _G.dailyblueprint == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BlueprintService.RF.LuckyDraw:InvokeServer(true)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Claim Daily Login",
  Default = false,
  Callback = function(Value)
  _G.dailylogin = Value
    while wait() do
      if _G.dailylogin == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.DailyRewardService.RE.onClaimReward:FireServer()
      end
  end    
})

--[[
T1:AddToggle({
  Name = "Auto Equip Dumbells",
  Default = false,
  Callback = function(Value)
  _G.Dmb = Value
    while wait() do
      if _G.Dmb == false then break end
        if _G.JoinW == false and _G.ClickW == false then
           game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(_G.zone_1,"Dumbells",_G.Prototype_A1)
        end
      end
  end    
})

T1:AddToggle({
  Name = "Auto Equip Grips",
  Default = false,
  Callback = function(Value)
  _G.Grips = Value
    while wait() do
      if _G.Grips == false then break end
         if _G.JoinW == false and _G.ClickW == false then
           game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onGuiEquipRequest:FireServer(_G.zone_1,"Grips",_G.Prototype_A2)
        end
      end
  end    
})
--]]

T6:AddToggle({
  Name = "Use Selected Boost",
  Default = false,
  Callback = function(Value)
  _G.UseBoost = Value
    while wait() do
      if _G.UseBoost == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer(_G.BoostPoison)
      end
  end    
})

T6:AddToggle({
  Name = "Use All Boost",
  Default = false,
  Callback = function(Value)
  _G.UseAllBoost = Value
    while wait() do
      if _G.UseAllBoost == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Luck")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Golden")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Void")
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.BoostService.RE.useBoost:FireServer("Wins")
      end
  end    
})

--[[
World 1: 
Bully
Teacher
GymRat
MafiaBoss
Champion
]]

local EventSpeed = 0
--[[
T7:AddSlider({
  Name = "Farm Speed",
  Min = 0,
  Max = 20,
  Default = 5,
  Color = Color3.fromRGB(255,255,255),
  Increment = 1,
  ValueName = "%",
  Callback = function(Value)
   EventSpeed = tonumber(Value)
  end    
})
--[[
T7:AddToggle({
  Name = "Farm Zone 2",
  Default = false,
  Callback = function(Value)
  _G.Event_AV1 = Value
    while wait() do
      if _G.Event_AV1 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("ScrapTrader",workspace.Zones["2"].Interactables.ArmWrestling.NPC["ScrapTrader"],2)
         wait(EventSpeed + 1)
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("CyberCop",workspace.Zones["2"].Interactables.ArmWrestling.NPC["CyberCop"],2)
         wait(EventSpeed + 2)
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("SlicerAssassin",workspace.Zones["2"].Interactables.ArmWrestling.NPC["SlicerAssassin"],2)
      end
  end    
})

T7:AddToggle({
  Name = "Farm Zone 3",
  Default = false,
  Callback = function(Value)
  _G.Event_AV1 = Value
    while wait() do
      if _G.Event_AV1 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onEnterNPCTable:FireServer("KrakenBoss",workspace.Zones["3"].Interactables.ArmWrestling.NPC["KrakenBoss"],3)
      end
  end    
})

T7:AddToggle({
  Name = "Auto Click",
  Default = false,
  Callback = function(Value)
  _G.Event_AV2 = Value
    while wait() do
      if _G.Event_AV2 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ArmWrestleService.RE.onClickRequest:FireServer()
      end
  end    
})
]]

T7:AddDropdown({
   Name = "Number of previous hatches on eggs",
   Default = "1",
   Options = {"1","2","3","8"},
   Callback = function(Value)
     _G.AmountPrevEggs = Value
   end    
})

T7:AddToggle({
  Name = "Auto Claim Event Egg",
  Default = false,
  Callback = function(Value)
  _G.Event_AV3 = Value
    while wait() do
      if _G.Event_AV3 == false then break end
         game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EventService.RF.ClaimEgg:InvokeServer()
      end
  end    
})

T7:AddToggle({
  Name = "Auto Hatch Previous Eggs",
  Default = false,
  Callback = function(Value)
  _G.PrevEgg = Value
    while wait() do
      if _G.PrevEgg == false then break end
	game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.EventService.RF.ClaimEgg:InvokeServer(tonumber(_G.AmountPrevEggs),true)
    end
end
})

T10:AddToggle({
  Name = "Bypass Gameplay-Paused",
  Default = false,
  Callback = function(Value)
	FuncBypass("GameplayPaused",Value)
end
})

T10:AddButton({
Name = "Trick Or Treat All House",
Callback = function()
	B_7_6()
end
})

--[[
local s,e = pcall(function()
workspace.game["MilBase Map"].Hood.AntiCheat:Destroy()
workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt.Enabled = true
workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt.HoldDuration= 0
workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt.MaxActivationDistance = 1230
game.Players.LocalPlayer.Character:PivotTo(workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.CFrame)
for i=1,10 do
fireproximityprompt(workspace.game["MilBase Map"].Hood.Stuff.TrainingHood.ProximityPrompt)
end
end)


function ProximityButton(str)
for _,proximity in pairs(workspace:GetDescendants()) do
	if proximity:IsA("ProximityPrompt") then
		if str == "enabled" then
			proximity.Enabled = true
		elseif str == "Duration" then
			proximity.HoldDuration= 0
		elseif str == "Distance" then
			proximity.MaxActivationDistance = 1230
		elseif str == "fire" then
			fireproximityprompt(proximity)
		end
	end
end
end
]]

function ProximityButtonDuration()
for _,proximity in pairs(workspace:GetDescendants()) do
	if proximity:IsA("ProximityPrompt") then
		proximity.HoldDuration = 0
	end
end
end

function ProximityButtonDistance()
for _,proximity in pairs(workspace:GetDescendants()) do
	if proximity:IsA("ProximityPrompt") then
		proximity.MaxActivationDistance = 1230
	end
end
end

function ProximityTrigger()
for _,proximity in pairs(workspace:GetDescendants()) do
	if proximity:IsA("ProximityPrompt") then
		proximity.Enabled = true
	end
end
end

function ProximityShow()
for _,proximity in pairs(workspace:GetDescendants()) do
	if proximity:IsA("ProximityPrompt") then
		proximity:Show()
	end
end
end

T10:AddButton({
   Name = "Bypass all ProximityPrompt Button Duration",
   Callback = function()
	ProximityButtonDuration()
end})

T10:AddButton({
   Name = "Bypass all ProximityPrompt Button Distance",
   Callback = function()
	ProximityButtonDistance()
end})

T10:AddButton({
   Name = "Enabled All ProximityButton",
   Callback = function()
	ProximityTrigger()
end})

T10:AddButton({
   Name = "Show All ProximityButton",
   Callback = function()
	ProximityShow()
end})

T11:AddSlider({
   Name = "Food Amount",
   Min = 0,
   Max = 1000,
   Default = 1,
   Color = Color3.fromRGB(255,255,255),
   Increment = 1,
   ValueName = "Food",
   Callback = function(Value)
     _G._FoodUses = Value
  end    
})

T11:AddToggle({
   Name = "Use Mushroom",
   Default = false,
   Callback = function(Value)
     _G._Mushroom = Value
	while wait() do
		if _G._Mushroom == false then break end
			game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["SnackService"]["RF"]["redeemSnack"]:InvokeServer("Mushroom",tonumber(_G._FoodUses))		
	end
  end    
})

T11:AddToggle({
   Name = "Use Green Apple",
   Default = false,
   Callback = function(Value)
     _G._Green_Apple = Value
	while wait() do
		if _G._Green_Apple == false then break end
			game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["SnackService"]["RF"]["redeemSnack"]:InvokeServer("GreenApple",tonumber(_G._FoodUses))
	end
  end    
})

T11:AddToggle({
   Name = "Use Godly Bones",
   Default = false,
   Callback = function(Value)
     _G._Godly_Bones = Value
	while wait() do
		if _G._Godly_Bones == false then break end
			game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["SnackService"]["RF"]["redeemSnack"]:InvokeServer("GodlyBones",tonumber(_G._FoodUses))
	end
  end    
})

local T12 = Window:MakeTab({
Name = "Tool",
Icon = "rbxassetid://0",
PremiumOnly = false
})

T12:AddDropdown({
   Name = "Select Zone",
   Default = "1",
   Options = zone,
   Callback = function(Value)
     _G._shitty_zone = Value
  end    
})

local SA1 = T12:AddSection({
     Name = "Grips"
})

local SA2 = T12:AddSection({
     Name = "Dumbells"
})

local SA3 = T12:AddSection({
     Name = "Barbells"
})

local grips = {}
local dumbells = {}
local barbells = {}

OrionLib:AddTable(ReplicatedStorage.Tools.Grips,grips)
OrionLib:AddTable(ReplicatedStorage.Tools.Dumbells,dumbells)
OrionLib:AddTable(ReplicatedStorage.Tools.Barbells,barbells)

SA1:AddDropdown({
   Name = "Select Grips",
   Default = "1Kg",
   Options = grips,
   Callback = function(Value)
     _G._grips = Value
  end    
})

SA2:AddDropdown({
   Name = "Select Dumbells",
   Default = "1Kg",
   Options = dumbells,
   Callback = function(Value)
     _G._dumbells = Value
  end    
})

SA3:AddDropdown({
   Name = "Select Barbells",
   Default = "Tier1",
   Options = barbells,
   Callback = function(Value)
     _G._barbells = Value
  end    
})

SA1:AddButton({
   Name = "Equip Grips",
   Callback = function()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["ToolService"]["RE"]["onGuiEquipRequest"]:FireServer(_G._shitty_zone,"Grips",_G._grips)
end})

SA2:AddButton({
   Name = "Equip Dumbells",
   Callback = function()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["ToolService"]["RE"]["onGuiEquipRequest"]:FireServer(_G._shitty_zone,"Dumbells",_G._dumbells)
end})

SA3:AddButton({
   Name = "Equip Barbells",
   Callback = function()
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["ToolService"]["RE"]["onEquipRequest"]:FireServer(tonumber(_G._shitty_zone),"Barbells",_G._barbells)
end})

local T13 = Window:MakeTab({
Name = "Lucky Block",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local BlockInfo = T13:AddParagraph("Lucky Block Detector","#CONTENT_ERROR")

local function Toolshit(name)
if name == "Grips" then
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["ToolService"]["RE"]["onGuiEquipRequest"]:FireServer(_G._shitty_zone,"Grips",_G._grips)
elseif name == "Dumbells" then
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["ToolService"]["RE"]["onGuiEquipRequest"]:FireServer(_G._shitty_zone,"Dumbells",_G._dumbells)
elseif name == "Barbells" then
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["ToolService"]["RE"]["onEquipRequest"]:FireServer(tonumber(_G._shitty_zone),"Barbells",_G._barbells)
else
	CreateDialogue("Invalid Tool",'Cant find tool with name "' .. name .. '"')
end
end

local function SnipeLuckyBlock()
	if workspace:FindFirstChild("LuckyBlock") then
		return true
	end
	return false
end

T13:AddDropdown({
   Name = "Select Tool",
   Default = "Grips",
   Options = {"Grips","Dumbells","Barbells"},
   Callback = function(Value)
     _G._Selected_Tool = Value
  end    
})

T13:AddToggle({
   Name = "Auto Use Selected Tool",
   Default = false,
   Callback = function(Value)
     _G._kajaksjsksjskFUCK = Value
     Toolshit(_G._Selected_Tool)

	while wait() do
		if _G._kajaksjsksjskFUCK == false then break end
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.ToolService.RE.onClick:FireServer()
	end
  end    
})

T13:AddToggle({
   Name = "Auto Teleport",
   Default = false,
   Callback = function(Value)
     _G._TP_Sniping = Value
	while wait() do
		if _G._TP_Sniping == false then break end
		  if SnipeLuckyBlock() then
			OrionLib:Teleport(workspace:FindFirstChild("LuckyBlock"))
		end
	end
  end    
})

local T14 = Window:MakeTab({
Name = "Halloween",
Icon = "rbxassetid://0",
PremiumOnly = false
})

local function Interact_All_Shit()
for _,i in pairs(workspace:GetChildren()) do
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["PumpkinService"]["RE"]["onDamagePumpkin"]:FireServer(i)
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["TrickOrTreatService"]["RE"]["onTrickOrTreat"]:FireServer(i)
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["PedestrianService"]["RE"]["onDamagePedestrian"]:FireServer(i)
end
end

local function B_7_5()
for _,i in pairs(workspace:GetChildren()) do
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["PumpkinService"]["RE"]["onDamagePumpkin"]:FireServer(i)
end
end

local function B_7_7()
for _,i in pairs(workspace:GetChildren()) do
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.4.7")["knit"]["Services"]["PedestrianService"]["RE"]["onDamagePedestrian"]:FireServer(i)
end
end

T14:AddToggle({
   Name = "Auto Trick Or Treat",
   Default = false,
   Callback = function(Value)
     _G._ToT = Value
	while wait() do
		if _G._ToT == false then break end
		  B_7_6()
	end
  end    
})

--[[T14:AddToggle({
   Name = "Auto Ghost / Pedestrian",
   Default = false,
   Callback = function(Value)
     _G._demon = Value
	while wait() do
		if _G._demon == false then break end
		  B_7_7()
	end
  end    
})

T14:AddToggle({
   Name = "Auto Pumpkin",
   Default = false,
   Callback = function(Value)
     _G._pumpkin = Value
	while wait() do
		if _G._pumpkin == false then break end
		  B_7_5()
	end
  end    
})
]]
RunService.RenderStepped:Connect(function()
if game.Players.LocalPlayer.PlayerGui.GameUI.Menus:FindFirstChild("Event") then
Event_A3:Set(tostring(game.Players.LocalPlayer.PlayerGui.GameUI.Menus.Event.Amount.Text),"Event Eggs available")
end
end)

RunService.RenderStepped:Connect(function()
if workspace:FindFirstChild("LuckyBlock") then
   BlockInfo:Set(string.format("%s\n%s\n%s",GetText(workspace.LuckyBlock.BillboardGui.Frame.Title),GetText(workspace.LuckyBlock.BillboardGui.Frame.Timer),GetText(workspace.LuckyBlock.BillboardGui.Frame.GainX)),"")
else
   BlockInfo:Set("#SNIPING \nwe are looking for lucky block","")
end
end)
--[[
if PetDetect > 3 then
Detection_A1:Set("The number of Pets exceeds 3 \nplease go to the private server \nto use this feature.","Pet detection (in workspace)")
Detection_A2:Set("The number of Pets exceeds 3 \nplease go to the private server \nto use this feature.","Pet detection (in workspace)")
else
Detection_A1:Set(tostring(PetDetect) .. " (Private Server)","Pet detection (in workspace)")
Detection_A2:Set(tostring(PetDetect) .. " (Private Server)","Pet detection (in workspace)")
end]]
