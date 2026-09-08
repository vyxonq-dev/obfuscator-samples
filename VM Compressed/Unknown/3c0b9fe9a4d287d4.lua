--[[
Hello! Im as the staff of this script, want to inform you (who view this repository) that you can fork this script and you can add as many features as you like.
don't forget to DM me on discord for the godmode feature, I just want to add that feature to this script... (discord: tora4172)
credit to fahri, chris, firman, kevin and farel
]] --7

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()

local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})
-- FUCK ROBLOX
local workspace = game:GetService("Workspace")
local Player = game.Players.LocalPlayer
local number = 9e99
local RunService = game:GetService("RunService")
local dev = "Rivanda_Cheater"
local Char = Player.Character
local humanoidRootPart = Char.HumanoidRootPart
local distance = 100
local horizontalDistance = 10
local verticalDistance = 5
local normalgrav = workspace.Gravity
local PathfindingService = game:GetService("PathfindingService")
local repeatIndex = 1
local hitCount = 1000

local FireUID = nil
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'FireServer' and self.Name == 'HitRE' then
        FireUID = Args[1][1]["FireUID"]
end
	return namecall(self, ...) 
end)

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://13030078632",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Pet and Gun",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Egg",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "Upgrade",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Misc",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local S2 = T5:AddSection({
Name = "Misc"
})

local S1 = T5:AddSection({
Name = "Config"
})

local T6 = Window:MakeTab({
Name = "Attribute",
Icon = "rbxassetid://13040495457",
PremiumOnly = false
})

local T7 = Window:MakeTab({
Name = "Proximity Prompt",
Icon = "rbxassetid://13030104160",
PremiumOnly = false
})

local T10 = Window:MakeTab({
Name = "Enemy's Tab",
Icon = "rbxassetid://13040482767",
PremiumOnly = false
})

local Info = T6:AddParagraph("Your attributes","Loading Client..")
local DataError = T10:AddParagraph("Data Error #762","Sorry, Client data could not be loaded.")

local tbl_w = {}
local ability = {}
OrionLib:AddTable(workspace.Art,tbl_w)
OrionLib:AddTable(Player.Ability,ability)

local path = PathfindingService:CreatePath()

local function ReadPath(targetPosition)
path:ComputeAsync(Player.Character.HumanoidRootPart.Position,targetPosition)

if path.Status == Enum.PathStatus.Success then
print("Path found!")
local waypoints = path:GetWaypoints()
		local distance 
		for waypointIndex, waypoint in pairs(waypoints) do
			local waypointPosition = waypoint.Position
			Player.Character.Humanoid:MoveTo(waypointPosition)
			repeat 
				distance = (waypointPosition - Player.Character.Humanoid.Parent.PrimaryPart.Position).magnitude
			wait()
			until distance <= 5
	end
    else
           print("Failed to find path.")
    end
end

local function Children(a,v)
for _,i in pairs(a:GetChildren()) do
	v(i)
end
end

local function iPairs(a,v)
for _,part in ipairs(a:GetChildren()) do
    v(part)
end
end

local function Descendants(str,get)
for _,v in pairs(str:GetDescendants()) do
	get(v)
end
end

local function Freeze()
iPairs(workspace.NPC,function(part)
if part:IsA("BasePart") then
	part.Anchored = true
end
end)
end

local function SafeArea()
iPairs(workspace.NPC,function(npc)
if humanoidRootPart then
                local direction = (npc.Position - humanoidRootPart.Position).unit
                local horizontalTarget = npc.Position - (direction * horizontalDistance)
                local verticalTarget = Vector3.new(horizontalTarget.X, horizontalTarget.Y + verticalDistance, horizontalTarget.Z)
                humanoidRootPart.CFrame = CFrame.new(verticalTarget)
            end
end)
end

local function ClearChildren() -- testing freezing feature 😠🖕😫☠️
Children(workspace.NPC,function(x)
	Children(x,function(c)
	if c == "MovePos" then
	     c:Destroy()
	end
	end)
end)
end

local function GetAllChildren()
Children(workspace.NPC,function(x)
	Children(x,function(c)
		return c
	end)
end)
end

local function fireTouch(a)
ReadPath(a.Position)
end

--[[
T1:AddDropdown({
Name = "World",
Default = Player:GetAttribute("World"),
Options = tbl_w,
Callback = function(Value)
_G._W2 = Value
_G._MissionWorld = Value
end    
})
]]
function Filter(ow)
  return ow:gsub("_",""):gsub("0","")
end

--game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = FireUID,["FPName"] = "FirePos",["RepeatIndex"] = 1,["HitCount"] = 1,["UID"] = }})
local TypicalNumber = 1

--[[if Player.Name == "Rivanda_Cheater" then --on tested
T1:AddTextbox({
  Name = "Select Hit Amount",
  Default = "10",
  TextDisappear = false,
  Callback = function(Value)
     TypicalNumber = Value
  end  
})
else
TypicalNumber = 1
end
]]

--[[T1:AddToggle({
Name = "Instant Kill V1 (Recommended)",
Default = false,
Callback = function(Value)
_G._kill = Value
      while wait() do
        if _G._kill == false then break end
        for _,v in pairs(workspace.NPC:GetChildren()) do
	if v.Name ~= "Athena_01" then
          game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = FireUID,["FPName"] = "FirePos",["RepeatIndex"] = 1,["HitCount"] = tonumber(TypicalNumber),["UID"] = v:GetAttribute("UID")}})
	end
        end
      end
end    
})]]

--[[T1:AddTextbox({
  Name = "hit Count (test)",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
     _G._Hit_Amount = Value -- 1
  end  
})

T1:AddTextbox({
  Name = "Repeat Index (test)",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
     _G._Repeat_Index = Value -- 1
  end  
})]]

T1:AddToggle({
Name = "Instant Kill",
Default = false,
Callback = function(Value)
_G._kill1 = Value
      while wait() do
        if _G._kill1 == false then break end
        for _,v in pairs(workspace.NPC:GetChildren()) do
	if v.Name ~= "Athena_01" then
          game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	  game:GetService("ReplicatedStorage").Remotes.HitRE:FireServer({{["FireUID"] = Player:GetAttribute("Fire"),["FPName"] = "FirePos",["RepeatIndex"] = repeatIndex,["HitCount"] = hitCount,["UID"] = v:GetAttribute("UID")}})
	end
        end
      end
end    
})

--[[T1:AddToggle({
Name = "Auto Enter Floor",
Default = false,
Callback = function(Value)
_G._immortal = Value
      while wait() do
        if _G._immortal == false then break end
        Player:SetAttribute("HP",Player:GetAttribute("MaxHP"))
	--Player:SetAttribute("MaxHP",number)
      end
end    
})]]

T1:AddToggle({
Name = "Auto Open Chest",
Default = false,
Callback = function(Value)
_G._Chest = Value
      while wait() do
        if _G._Chest == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["ChestDrawRE"]:FireServer({["ChestId"] = "CHEST_" .. tostring(Player:GetAttribute("World"))})
      end
end    
})

T1:AddToggle({
Name = "Auto Claim Mission",
Default = false,
Callback = function(Value)
_G._Mission1 = Value
      while wait() do
        if _G._Mission1 == false then break end
          game:GetService("ReplicatedStorage")["Remotes"]["MissionCompleteRE"]:FireServer(Player:GetAttribute("CurMainMissionId"))
      end
end    
})

T10:AddTextbox({
Name = "Teleport Distance",
Default = "100",
TextDisappear = true,
Callback = function(Value)
     distance = tonumber(Value)
  end  
})

T10:AddTextbox({
Name = "Horizontal Distance",
Default = "10",
TextDisappear = true,
Callback = function(Value)
horizontalDistance = tonumber(Value)
end})

T10:AddTextbox({
Name = "Vertical Distance",
Default = "5",
TextDisappear = true,
Callback = function(Value)
verticalDistance = tonumber(Value)
end})

T10:AddToggle({
Name = "Disable Enemy Bullet / Projectile",
Default = false,
Callback = function(Value)
_G._Enemy_Bullet = Value
      while wait() do
        if _G._Enemy_Bullet == false then break end
          Children(workspace.NPCBullet,function(item)
		item:Destroy()
	end)
	  Children(workspace.Bullet,function(index)
		index:Destroy()
	end)
      end
end    
})

T10:AddToggle({
Name = "Freeze Enemy",
Default = false,
Callback = function(Value)
_G._Freeze_Enemy = Value
      while wait() do
         if _G._Freeze_Enemy == false then break end
            Freeze()
      end
end    
})

T10:AddToggle({
Name = "TP to Enemy",
Default = false,
Callback = function(Value)
_G._Bring_Enemy = Value
if _G._Bring_Enemy == true then
	workspace.Gravity = 0
else
	workspace.Gravity = normalgrav
end

      while wait() do
         if _G._Bring_Enemy == false then break end
            SafeArea()
      end
end    
})

T2:AddToggle({
Name = "Equip Best Pet",
Default = false,
Callback = function(Value)
_G._BestPet = Value
      while wait() do
         if _G._BestPet == false then break end
            game:GetService("ReplicatedStorage")["Remotes"]["EquipBestPetRE"]:FireServer()
      end
end    
})

T2:AddToggle({
Name = "Equip Best Gun",
Default = false,
Callback = function(Value)
_G._BestGun = Value
      while wait() do
         if _G._BestGun == false then break end
            game:GetService("ReplicatedStorage")["Remotes"]["EquipBestRE"]:FireServer()
      end
end    
})

--game:GetService("ReplicatedStorage")["Remotes"]["AddPointRE"]:FireServer("AP",1)

T4:AddDropdown({
Name = "Upgrade Name",
Default = "AP",
Options = {"AP","HP","CoinValueAdd","DropRateAdd"},
Callback = function(Value)
_G._PointName = Value
end    
})

T4:AddToggle({
Name = "Auto Upgrade SkillPoint",
Default = false,
Callback = function(Value)
_G._BestGun = Value
      while wait() do
         if _G._BestGun == false then break end
            game:GetService("ReplicatedStorage")["Remotes"]["AddPointRE"]:FireServer(_G._PointName,1)
      end
end    
})

T3:AddDropdown({
   Name = "Egg Type",
   Default = "Normal",
   Options = {"Normal","Advance"},
   Callback = function(Value)
     _G._TypeShit = Value
  end    
})
--[[
T3:AddDropdown({
Name = "World",
Default = "W1",
Options = {"W1","W2","W3","W4","W5","W6"},
Callback = function(Value)
_G._W = Value
end    
})
]]
T3:AddDropdown({
Name = "Total Hatch",
Default = "1",
Options = {"1","3","10"},
Callback = function(Value)
_G._O = Value
end    
})

T3:AddToggle({
Name = "Auto Hatch Egg",
Default = false,
Callback = function(Value)
_G._Egg = Value
      while wait() do
         if _G._Egg == false then break end
            game:GetService("ReplicatedStorage")["DrawPool"]["RD_" .. tostring(Filter(Player:GetAttribute("World"))) .. "_PET" .. tostring(string.upper(_G._TypeShit))]["DrawRE"]:FireServer(tonumber(_G._O),false)
      end
end    
})

S2:AddButton({
Name = "Tora Script",
Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0BraveOrder'))()
end})

S1:AddToggle({
Name = "Infinity Damage",
Default = false,
Callback = function(Value)
_G._infdmg = Value
      while wait() do
        if _G._infdmg == false then break end
        Player:SetAttribute("DMG",number)
	Player:SetAttribute("TotalPower",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Hit",
Default = false,
Callback = function(Value)
_G._infhit = Value
      while wait() do
        if _G._infhit == false then break end
        Player:SetAttribute("BHitR",number)
	Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Level",
Default = false,
Callback = function(Value)
_G._inflvl = Value
      while wait() do
        if _G._inflvl == false then break end
        Player:SetAttribute("CurLevel",number)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity/No Cooldown",
Default = false,
Callback = function(Value)
_G._infcd = Value
      while wait() do
        if _G._infcd == false then break end
        Player:SetAttribute("MFireCD",-number)
	Player:SetAttribute("PFireCD",-number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Length",
Default = false,
Callback = function(Value)
_G._inflength = Value
      while wait() do
        if _G._inflength == false then break end
        Player:SetAttribute("BLength",number)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Infinity Friends Boost",
Default = false,
Callback = function(Value)
_G._infboost = Value
      while wait() do
        if _G._infboost == false then break end
        Player:SetAttribute("Friends",number)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddToggle({
Name = "Zone Cleared",
Default = false,
Callback = function(Value)
_G._zone = Value
      while wait() do
        if _G._zone == false then break end
        Player:SetAttribute("ZoneCleared",Value)
	--Player:SetAttribute("HitR",number)
      end
end    
})

S1:AddDropdown({
   Name = "Visual Ability Config",
   Default = "Normal",
   Options = ability,
   Callback = function(Value)
      Player.Ability[Value].Value = number
  end    
})


T4:AddToggle({
Name = "Auto Upgrade Mount",
Default = false,
Callback = function(Value)
_G._um = Value
      while wait() do
        if _G._um == false then break end
        game:GetService("ReplicatedStorage")["Remotes"]["MountUpgradeRE"]:FireServer(Player:GetAttribute("EquippedMount"))
      end
end    
})
--CombineWeaponRE game:GetService("ReplicatedStorage")["Remotes"]["CombinePetRE"]:FireServer({{Player:GetAttribute("Weapon"),Player:GetAttribute("Weapon"),Player:GetAttribute("Weapon")}})
T4:AddButton({
Name = "Fusion Equipped Gun",
Callback = function()
      game:GetService("ReplicatedStorage")["Remotes"]["CombineWeaponRE"]:FireServer({{Player:GetAttribute("Weapon"),Player:GetAttribute("Weapon"),Player:GetAttribute("Weapon")}})		
  end    
})

T1:AddToggle({
Name = "Auto Claim Achievement",
Default = false,
Callback = function(Value)
_G._achievement = Value
      while wait() do
        if _G._achievement == false then break end
        game:GetService("ReplicatedStorage")["Remotes"]["AchievementCompleteAllRE"]:FireServer()
      end
end    
})

T1:AddToggle({
Name = "Auto Claim Battlepass Reward",
Default = false,
Callback = function(Value)
_G._BP_REWARD = Value
      while wait() do
        if _G._BP_REWARD == false then break end
        game:GetService("ReplicatedStorage")["Remotes"]["BattlePassRF"]:InvokeServer("ClaimAward")
      end
end    
})

T7:AddButton({
Name = "Enter Event",
Callback = function()
Descendants(workspace,function(var)
	if var:IsA("ProximityPrompt") then
		fireproximityprompt(var)
	end
    end)
end    
})

-- Descendants(str,get)

if Player.Name == dev then -- currently testing the feature in future updates
local T8 = Window:MakeTab({
Name = "Shop Function",
Icon = "rbxassetid://13030104160",
PremiumOnly = false
})

local Store = T8:AddSection({
Name = "STORE"
})

local AthenaStore = T8:AddSection({
Name = "ATHENA STORE"
})

Store:AddDropdown({
  Name = "Select Coin",
  Default = "RS_Coin1",
  Options = {"RS_Coin1","RS_Coin2","RS_Coin3","RS_Coin4","RS_Coin5","RS_Coin6"},
  Callback = function(Value)
     _G._CoinTool = Value
  end    
})

Store:AddTextbox({
  Name = "Insert Amount",
  Default = "1",
  TextDisappear = false,
  Callback = function(Value)
     _G._ToolCrack = Value
  end  
})

Store:AddButton({
Name = "Add Silver",
Callback = function()
      game:GetService("ReplicatedStorage")["Remotes"]["StoreBuyRF"]:InvokeServer("ResourceStore",_G._CoinTool,tonumber(_G._ToolCrack))
  end    
})

AthenaStore:AddDropdown({
  Name = "Select Item",
  Default = "Silver Boost",
  Options = {"Silver Boost","Major Silver Boost","EXP Boost","Major EXP Boost","HP Boost","Major HP Boost","AP Boost","Major AP Boost"},
  Callback = function(Value)
     _G._s_ItemTool = Value
  end    
})

AthenaStore:AddSlider({
   Name = "Insert Amount",
   Min = 0,
   Max = 10,
   Default = 1,
   Color = Color3.fromRGB(255,255,255),
   Increment = 1,
   ValueName = "Item",
   Callback = function(Value)
     _G._s_Crack = Value
  end  
})
	
AthenaStore:AddButton({
Name = "BUY",
Callback = function()
	if _G._s_ItemTool == "Silver Boost" then
                game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS01",tonumber(_G._s_Crack))
	elseif _G._s_ItemTool == "Major Silver Boost" then
		game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS02",tonumber(_G._s_Crack))
	elseif _G._s_ItemTool == "EXP Boost" then
		game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS03",tonumber(_G._s_Crack))
	elseif _G._s_ItemTool == "Major EXP Boost" then
		game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS04",tonumber(_G._s_Crack))
	elseif _G._s_ItemTool == "HP Boost" then
		game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS05",tonumber(_G._s_Crack))
	elseif _G._s_ItemTool == "Major HP Boost" then
		game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS06",tonumber(_G._s_Crack))
	elseif _G._s_ItemTool == "AP Boost" then
		game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS07",tonumber(_G._s_Crack))
	elseif _G._s_ItemTool == "Major AP Boost" then
		game:GetService("ReplicatedStorage")["Remotes"]["CheckStoreConditionRF"]:InvokeServer("AthenaStore","ITEM_PROPS08",tonumber(_G._s_Crack))
	else
		OrionLib:MakeNotification({Name = "ERROR",Content = "Invalid Item",Image = "rbxassetid://13030062874",Time = 5})
	end
  end    
})

local T9 = Window:MakeTab({
Name = "Game Test",
Icon = "rbxassetid://13030104160",
PremiumOnly = false
})

T9:AddDropdown({
  Name = "Select Stars",
  Default = "★ 1",
  Options = {"★ 1","★ 2","★ 3","Dungeon"},
  Callback = function(Value)
     _G._Star_Amount = Value
  end    
})
	
T9:AddButton({
Name = "Start Game",
Callback = function()
        if _G._Star_Amount == "★ 1" then
		fireTouch(workspace.Art[Player:GetAttribute("World")].Scene.TeleportArea1)
	elseif _G._Star_Amount == "★ 2" then
		fireTouch(workspace.Art[Player:GetAttribute("World")].Scene.TeleportArea2)
	elseif _G._Star_Amount == "★ 3" then
		fireTouch(workspace.Art[Player:GetAttribute("World")].Scene.TeleportArea3)
	elseif _G._Star_Amount == "Dungeon" then
		fireTouch(workspace.Art["W_01"].Scene.DungeonArea)
	end
end    
})

T10:AddToggle({
Name = "Freezing V2 - testing",
Default = false,
Callback = function(Value)
_G._NO_KID = Value
      while wait() do
        if _G._NO_KID == false then break end
        ClearChildren()
      end
end    
})

T10:AddButton({
Name = "Get All Children",
Callback = function()
DataError:Set(GetAllChildren(),"")
end})
end

-- ("Your attributes","Loading Client..")
-- Player:GetAttribute("EquippedMount")
--[[
]]

local function formattedNumber(n)
    if n >= 10^21 then
        return string.format("%.1fSx", n / 10^21)
    elseif n >= 10^18 then
        return string.format("%.1fQt", n / 10^18)
    elseif n >= 10^15 then
        return string.format("%.1fQ", n / 10^15)
    elseif n >= 10^12 then
        return string.format("%.1fT", n / 10^12)
    elseif n >= 10^9 then
        return string.format("%.1fB", n / 10^9)
    elseif n >= 10^6 then
        return string.format("%.1fM", n / 10^6)
    elseif n >= 10^3 then
        return string.format("%.1fK", n / 10^3)
    else
        return tostring(n)
    end
end

RunService.RenderStepped:Connect(function()
	Info:Set("Damage: " .. tostring(Player:GetAttribute("DMG")) .. " ( " .. tostring(formattedNumber(Player:GetAttribute("DMG"))) .. " )\nHP: " .. tostring(Player:GetAttribute("HP")) .. "/" .. tostring(Player:GetAttribute("MaxHP")) .. " ( " .. tostring(formattedNumber(Player:GetAttribute("HP"))) .. "/" .. tostring(formattedNumber(Player:GetAttribute("MaxHP"))) .. " )\nTotal Power: " .. tostring(Player:GetAttribute("TotalPower")) .. " ( " .. tostring(formattedNumber(Player:GetAttribute("TotalPower"))) .. " )\nMount ID: " .. tostring(Player:GetAttribute("EquippedMount")) .. "\nWave: " .. tostring(Player:GetAttribute("Wave")) .. "\nHistorical Highest Floor: " .. tostring(Player:GetAttribute("DungeonRecord")) .. "\nWeapon: " .. tostring(Player:GetAttribute("Weapon")) .. "\nWeapon type: " .. tostring(Player:GetAttribute("WeaponType")) .. "\nWorld: " .. tostring(Player:GetAttribute("World")) .. "\nBHitR: " .. tostring(Player:GetAttribute("BHitR")) .. "\nBLength: " .. tostring(Player:GetAttribute("BLength")) .. "\nBSpeed: " .. tostring(Player:GetAttribute("BSpeed")) .. "\nCurrent Level: " .. tostring(Player:GetAttribute("CurLevel")) .. "\nMission ID: " .. tostring(Player:GetAttribute("CurMainMissionId")) .. "\nFire UID: " .. tostring(Player:GetAttribute("Fire")) .. "\nFriend Boost: " .. tostring(Player:GetAttribute("Friends")) .. "\nHitR: " .. tostring(Player:GetAttribute("HitR")) .. "\nMFireCD: " .. tostring(Player:GetAttribute("MFireCD")) .. "\nPFireCD: " .. tostring(Player:GetAttribute("PFireCD")) .. "\nis zone cleared: " .. tostring(Player:GetAttribute("ZoneCleared")),"Your attributes")
end)

Player:GetAttributeChangedSignal("ZoneCleared"):Connect(function()
	if Player:GetAttribute("ZoneCleared") == true then
		OrionLib:MakeNotification({Name = "Wave Notifier",Content = "Wave Cleared!",Image = "rbxassetid://13040492999",Time = 5})
	end
end)
