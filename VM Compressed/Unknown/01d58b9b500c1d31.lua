
  warn("░█████╗░░██████╗████████╗██████╗░░█████╗░░░░░█████╗░░█████╗░.")
  warn("██╔══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗░░░██╔══██╗██╔══██╗.")
  warn("███████║╚█████╗░░░░██║░░░██████╔╝██║░░██║░░░██║░░╚═╝██║░░╚═╝.")
  warn("██╔══██║░╚═══██╗░░░██║░░░██╔══██╗██║░░██║░░░██║░░██╗██║░░██╗.")
  warn("██║░░██║██████╔╝░░░██║░░░██║░░██║╚█████╔╝██╗╚█████╔╝╚█████╔╝.")
  warn("╚═╝░░╚═╝╚═════╝░░░░╚═╝░░░╚═╝░░╚═╝░╚════╝░╚═╝░╚════╝░░╚════╝░.")

--// UI \\--

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/ItsWalterWhiteYO/walterthemes/main/cracked"))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

local Window = Library:CreateWindow({
  Title = "🌚ASTRO.CC🌚",
  Center = true,
  AutoShow = true,
  TabPadding = 8,
  MenuFadeTime = 0.2
})

local Tabs = {
    ['Combat'] = Window:AddTab('Combat'),
    ['Visuals'] = Window:AddTab('Visuals'),
    ['Misc'] = Window:AddTab('Misc'),
    ['Credits'] = Window:AddTab('Credits'),
    ['UI Settings'] = Window:AddTab('Configs'),
}





--// COMBAT \\--
local TabBox = Tabs.Combat:AddLeftTabbox()
local ExploitsTab = TabBox:AddTab('EXPLOITS')


local longneck = {
    LongNeckEnabled = false,
    UpperLimitDefault = 3,
    LowerLimitDefault = 1.75,
    CurrentSliderValue = 1.75,
    }
    
    ExploitsTab:AddToggle('LongNeck', {Text = 'long neck', Default = false, Tooltip}):AddKeyPicker('LongNeckKey', {Default = 'Non', SyncToggleState = true, Mode = 'Toggle', Text = 'Long Neck', NoUI = false}):OnChanged(function(value)
    longneck.LongNeckEnabled = value
    if not longneck.LongNeckEnabled then
    game:GetService("Workspace").Ignore.LocalCharacter.Bottom.PrismaticConstraint.UpperLimit = longneck.UpperLimitDefault
    game:GetService("Workspace").Ignore.LocalCharacter.Bottom.PrismaticConstraint.LowerLimit = longneck.LowerLimitDefault
    else
    game:GetService("Workspace").Ignore.LocalCharacter.Bottom.PrismaticConstraint.UpperLimit = longneck.CurrentSliderValue
    game:GetService("Workspace").Ignore.LocalCharacter.Bottom.PrismaticConstraint.LowerLimit = longneck.CurrentSliderValue
    end
    end)
    
    ExploitsTab:AddSlider('HeightChangerSlider', {Text = 'height:', Suffix = "m", Default = 4, Min = 0, Max = 8; Rounding = 1, Compact = false}):OnChanged(function(Value)
    longneck.CurrentSliderValue = Value
    if longneck.LongNeckEnabled then
    game:GetService("Workspace").Ignore.LocalCharacter.Bottom.PrismaticConstraint.LowerLimit = Value
    game:GetService("Workspace").Ignore.LocalCharacter.Bottom.PrismaticConstraint.UpperLimit = Value
    end
    end)

    local HeadHitboxTabBox = Tabs.Combat:AddLeftTabbox('head hitbox')
    local HeadHitboxTab = HeadHitboxTabBox:AddTab('head hitbox')
    
    local antihitbox
    antihitbox = hookmetamethod(game, "__index", newcclosure(function(...)
    local self, k = ...
    if not checkcaller() and k == "Size" and self.Name == "Head" then
      return Vector3.new(1.672248125076294, 0.835624098777771, 0.835624098777771)
    end
    return antihitbox(...)
    end))
    
    --* Head Hitbox Expander *--
    
    local HedsOn = Instance.new("Part")
    HedsOn.Name = "HedsOn"
    HedsOn.Anchored = false
    HedsOn.CanCollide = false
    HedsOn.Transparency = 0
    HedsOn.Size = Vector3.new(10, 10, 10)
    HedsOn.Parent = game.ReplicatedStorage
    
    local HeadExtends = false
    local XSize = 10
    local YSize = 10
    local ZSize = 10
    local HitboxTransparency = 10
    
    HeadHitboxTab:AddToggle('HBO',{Text='enabled',Default=false}):OnChanged(function(Value)
    HeadExtends = Value
    end)
    
    HeadHitboxTab:AddSlider('HitboxXSize_Slider', {Text = 'hitbox width:', Default = 5, Min = 0, Max = 10, Rounding = 2, Suffix = "%", Compact = false}):OnChanged(function(HitboxXSize)
    XSize = HitboxXSize
    end)
    
    HeadHitboxTab:AddSlider('HitboxYSize_Slider', {Text = 'hitbox height:', Default = 5, Min = 0, Max = 10, Rounding = 2, Suffix = "%", Compact = false}):OnChanged(function(HitboxYSize)
    YSize = HitboxYSize
    end)
    
    HeadHitboxTab:AddSlider('HitboxXSize_Slider', {Text = 'transparency:', Default = 10, Min = 0, Max = 60, Rounding = 0, Suffix = "%", Compact = false}):OnChanged(function(TransparencyValue)
    HitboxTransparency = TransparencyValue / 100
    end)
    
    task.spawn(function()
    while task.wait() do
      if HeadExtends then
        for _, i in ipairs(game:GetService("Workspace"):GetChildren()) do
          if i:FindFirstChild("HumanoidRootPart") and not i:FindFirstChild("HedsOn") then
            local BigHeadsPart = Instance.new("Part")
            BigHeadsPart.Name = "Head"
            BigHeadsPart.Anchored = false
            BigHeadsPart.CanCollide = false
            BigHeadsPart.Transparency = HitboxTransparency
            BigHeadsPart.Size = Vector3.new(XSize, YSize, ZSize)
            local DeletePart = Instance.new("Weld")
            DeletePart.Parent = BigHeadsPart
            DeletePart.Name = "FAKEHEAD"
            local HeadsParts = BigHeadsPart:Clone()
            HeadsParts.Parent = i
            HeadsParts.Orientation = i.HumanoidRootPart.Orientation
            local clonedHedsOn = HedsOn:Clone()
            clonedHedsOn.Parent = i
            local Headswelding = Instance.new("Weld")
            Headswelding.Parent = HeadsParts
            Headswelding.Part0 = i.HumanoidRootPart
            Headswelding.Part1 = HeadsParts
            HeadsParts.Position = Vector3.new(i.HumanoidRootPart.Position.X, i.HumanoidRootPart.Position.Y - 0.6, i.HumanoidRootPart.Position.Z)
          end
        end
      else
        for _, i in ipairs(game:GetService("Workspace"):GetChildren()) do
          if i:FindFirstChild("HumanoidRootPart") and i:FindFirstChild("HedsOn") then
            i.HedsOn:Remove()
            for _, a in ipairs(i:GetChildren()) do
              if a.Name == "Head" and a:FindFirstChild("FAKEHEAD") and (not a:FindFirstChild("Nametag") or not a:FindFirstChild("Face")) then
                a:Remove()
              end
            end
          end
        end
      end
    end
    end)
    












local CustomHitsoundsTabBox = Tabs.Misc:AddLeftTabbox('Custom Hitsounds')
local PlayerHitsoundsTab = CustomHitsoundsTabBox:AddTab('Player Hitsounds')
local NatureHitsoundsTab = CustomHitsoundsTabBox:AddTab('Nature Hitsounds')

local sounds = {
  ["Defualt Headshot Hit"] = "rbxassetid://9119561046",
  ["Defualt Body Hit"] = "rbxassetid://9114487369",
  ["Defualt Wood Hit"] = "rbxassetid://9125573608",
  ["Defualt Rock Hit"] = "rbxassetid://9118630389",
  Neverlose = "rbxassetid://8726881116",
  Gamesense = "rbxassetid://4817809188",
  One = "rbxassetid://7380502345",
  Bell = "rbxassetid://6534947240",
  Rust = "rbxassetid://1255040462",
  TF2 = "rbxassetid://2868331684",
  Slime = "rbxassetid://6916371803",
  ["Among Us"] = "rbxassetid://5700183626",
  Minecraft = "rbxassetid://4018616850",
  ["CS:GO"] = "rbxassetid://6937353691",
  Saber = "rbxassetid://8415678813",
  Baimware = "rbxassetid://3124331820",
  Osu = "rbxassetid://7149255551",
  ["TF2 Critical"] = "rbxassetid://296102734",
  Bat = "rbxassetid://3333907347",
  ["Call of Duty"] = "rbxassetid://5952120301",
  Bubble = "rbxassetid://6534947588",
  Pick = "rbxassetid://1347140027",
  Pop = "rbxassetid://198598793",
  Bruh = "rbxassetid://4275842574",
  Bamboo = "rbxassetid://3769434519",
  Crowbar = "rbxassetid://546410481",
  Weeb = "rbxassetid://6442965016",
  Beep = "rbxassetid://8177256015",
  Bambi = "rbxassetid://8437203821",
  Stone = "rbxassetid://3581383408",
  ["Old Fatality"] = "rbxassetid://6607142036",
  Click = "rbxassetid://8053704437",
  Ding = "rbxassetid://7149516994",
  Snow = "rbxassetid://6455527632",
  Laser = "rbxassetid://7837461331",
  Mario = "rbxassetid://2815207981",
  Steve = "rbxassetid://4965083997",
  Snowdrake = "rbxassetid://7834724809"
  }

local SoundService = game:GetService("SoundService")

SoundService.PlayerHitHeadshot.Volume = 5
SoundService.PlayerHitHeadshot.Pitch = 1
SoundService.PlayerHitHeadshot.EqualizerSoundEffect.HighGain = -2

-- GAME 
PlayerHitsoundsTab:AddToggle('Enabled_Toggle1', {Text = 'Enabled', Default = false})

PlayerHitsoundsTab:AddDropdown('HeadshotHit', {Values = { 'Defualt Headshot Hit','Neverlose','Gamesense','One','Bell','Rust','TF2','Slime','Among Us','Minecraft','CS:GO','Saber','Baimware','Osu','TF2 Critical','Bat','Call of Duty','Bubble','Pick','Pop','Bruh','Bamboo','Crowbar','Weeb','Beep','Bambi','Stone','Old Fatality','Click','Ding','Snow','Laser','Mario','Steve','Snowdrake' },Default = 1, Multi = false, Text = 'Head Hitsound:'})
Options.HeadshotHit:OnChanged(function()
local soundId = sounds[Options.HeadshotHit.Value]
game:GetService("SoundService").PlayerHitHeadshot.SoundId = soundId
end)

PlayerHitsoundsTab:AddSlider('Volume_Slider', {Text = 'Volume', Default = 5, Min = 0, Max = 10, Rounding = 0, Compact = true,}):OnChanged(function(vol)
SoundService.PlayerHitHeadshot.Volume = vol
end)

PlayerHitsoundsTab:AddSlider('Pitch_Slider', {Text = 'Pitch', Default = 1, Min = 0, Max = 2, Rounding = 1, Compact = true,}):OnChanged(function(pich)
SoundService.PlayerHitHeadshot.Pitch = pich
end)
--
PlayerHitsoundsTab:AddToggle('Enabled_Toggle2', {Text = 'Enabled', Default = false})

PlayerHitsoundsTab:AddDropdown('Hit', {Values = { 'Defualt Body Hit','Neverlose','Gamesense','One','Bell','Rust','TF2','Slime','Among Us','Minecraft','CS:GO','Saber','Baimware','Osu','TF2 Critical','Bat','Call of Duty','Bubble','Pick','Pop','Bruh','Bamboo','Crowbar','Weeb','Beep','Bambi','Stone','Old Fatality','Click','Ding','Snow','Laser','Mario','Steve','Snowdrake' },Default = 1, Multi = false, Text = 'Body Hitsound:'})
Options.Hit:OnChanged(function()
local soundId = sounds[Options.Hit.Value]
game:GetService("SoundService").PlayerHit2.SoundId = soundId
end)

PlayerHitsoundsTab:AddSlider('Volume_Slider', {Text = 'Volume', Default = 5, Min = 0, Max = 10, Rounding = 0, Compact = true,}):OnChanged(function(vole)
SoundService.PlayerHit2.Volume = vole
end)

PlayerHitsoundsTab:AddSlider('Pitch_Slider', {Text = 'Pitch', Default = 1, Min = 0, Max = 2, Rounding = 1, Compact = true,}):OnChanged(function(piche)
SoundService.PlayerHit2.Pitch = piche
end)

--* Nature Hitsounds *--

NatureHitsoundsTab:AddToggle('Enabled_Toggle2', {Text = 'Enabled', Default = false})

NatureHitsoundsTab:AddDropdown('WoodHit', {Values = { 'Defualt Wood Hit','Neverlose','Gamesense','One','Bell','Rust','TF2','Slime','Among Us','Minecraft','CS:GO','Saber','Baimware','Osu','TF2 Critical','Bat','Call of Duty','Bubble','Pick','Pop','Bruh','Bamboo','Crowbar','Weeb','Beep','Bambi','Stone','Old Fatality','Click','Ding','Snow','Laser','Mario','Steve','Snowdrake' },Default = 1, Multi = false, Text = 'Wood Hitsound:'})
Options.WoodHit:OnChanged(function()
local soundId = sounds[Options.WoodHit.Value]
game:GetService("SoundService").WoodHit.SoundId = soundId
end)

NatureHitsoundsTab:AddSlider('Volume_Slider', {Text = 'Volume', Default = 5, Min = 0, Max = 10, Rounding = 0, Compact = true,}):OnChanged(function(vole)
SoundService.WoodHit.Volume = vole
end)

NatureHitsoundsTab:AddSlider('Pitch_Slider', {Text = 'Pitch', Default = 1, Min = 0, Max = 2, Rounding = 1, Compact = true,}):OnChanged(function(piche)
SoundService.WoodHit.Pitch = piche
end)
--
NatureHitsoundsTab:AddToggle('Enabled_Toggle1', {Text = 'Enabled', Default = false})

NatureHitsoundsTab:AddDropdown('RockHit', {Values = { 'Defualt Rock Hit','Neverlose','Gamesense','One','Bell','Rust','TF2','Slime','Among Us','Minecraft','CS:GO','Saber','Baimware','Osu','TF2 Critical','Bat','Call of Duty','Bubble','Pick','Pop','Bruh','Bamboo','Crowbar','Weeb','Beep','Bambi','Stone','Old Fatality','Click','Ding','Snow','Laser','Mario','Steve','Snowdrake' },Default = 1, Multi = false, Text = 'Rock Hitsound:'})
Options.RockHit:OnChanged(function()
local soundId = sounds[Options.RockHit.Value]
game:GetService("SoundService").RockHit.SoundId = soundId
end)

NatureHitsoundsTab:AddSlider('Volume_Slider', {Text = 'Volume', Default = 5, Min = 0, Max = 10, Rounding = 0, Compact = true,}):OnChanged(function(vol)
SoundService.RockHit.Volume = vol
end)

NatureHitsoundsTab:AddSlider('Pitch_Slider', {Text = 'Pitch', Default = 1, Min = 0, Max = 2, Rounding = 1, Compact = true,}):OnChanged(function(pich)
SoundService.RockHit.Pitch = pich
end)







local WeaponModsTabBox = Tabs.Combat:AddRightTabbox('weapon modifications')
local WeaponModsTab = WeaponModsTabBox:AddTab('weapon modifications')

--* Weapon Modifications *--
local gunMods = {
  norecoilTog = false,
  noSpreadTog = false,
  firerateMultiTog = false,
  firerateMulti = 1,
  noReloadanimTog = false,
}

local GunModsEnabled = false
WeaponModsTab:AddToggle('FireTypeEnabled', {Text = 'enabled', Default = false}):OnChanged(function(EnabledFireType)
GunModsEnabled = EnabledFireType
end)

WeaponModsTab:AddToggle('Firerate',{Text='firerate',Default=false}):OnChanged(function(Value)
gunMods.firerateMultiTog = Value
end)

WeaponModsTab:AddSlider('firerateMultiS', {Text='multi:',Default=0.5,Min=0.1,Max=1,Rounding=2,Compact=false}):OnChanged(function(Value)
gunMods.firerateMulti = Value
end)
local oldAttackCooldown;oldAttackCooldown = hookfunction(getupvalues(getrenv()._G.modules.FPS.ToolControllers.RangedWeapon.PlayerFire)[1],function(...)
local arg = {...}
if GunModsEnabled and gunMods.firerateMultiTog == true then
  arg[2]['AttackCooldown'] = gunMods.firerateMulti
  return oldAttackCooldown(unpack(arg))
end
return oldAttackCooldown(...)
end)

local ItemConfigs = game.ReplicatedStorage.ItemConfigs
local weapons = {PipePistol = require(ItemConfigs.PipePistol),Blunderbuss = require(ItemConfigs.Blunderbuss),Crossbow = require(ItemConfigs.Crossbow),Bow = require(ItemConfigs.Bow),USP9 = require(ItemConfigs.USP9),LeverActionRifle = require(ItemConfigs.LeverActionRifle),GaussRifle = require(ItemConfigs.GaussRifle)}
local FireActions = {Semi = "semi",Auto = "auto"}
WeaponModsTab:AddDropdown('FireTypeDropdown', {Values = {"Semi", "Auto"},Default = 1,Multi = false,Text = 'fire type:'}):OnChanged(function(Value)
if GunModsEnabled then
  local fireAction = FireActions[Value]
  for _, weapon in pairs(weapons) do
    weapon.FireAction = fireAction
  end
end
end)



local Recoil_Value = 2
WeaponModsTab:AddSlider('RecoilStrength', {Text = 'recoil:', Default = Recoil_Value, Min = 1, Max = 100, Suffix = "%", Rounding = 0, Compact = false}):OnChanged(function(Value)
Recoil_Value = Value / 50
end)


local NoRecoil; NoRecoil = hookfunction(getrenv()._G.modules.Camera.Recoil, function(...)
    args = {...}
    if GunModsEnabled then
    args[1]["cameraY"] = Recoil_Value / 50;args[1]["cameraX"] = Recoil_Value / 50
    return NoRecoil(unpack(args))
    end
    end)












--// VISUALS \\--


local ArmVisTabBox = Tabs.Visuals:AddRightTabbox('arm visuals')
local ArmVisTab = ArmVisTabBox:AddTab('local chams')



local function setArmProperties(property, value)
local armParts = {"LeftUpperArm", "LeftLowerArm", "LeftHand","RightUpperArm", "RightLowerArm", "RightHand"}
for _, partName in ipairs(armParts) do
game:GetService("Workspace").Ignore.FPSArms[partName][property] = value
end
end

ArmVisTab:AddToggle('ArmChams', { Text = 'enabled', Default = false }):AddColorPicker('ArmChamsColor', { Default = Color3.fromRGB(44, 0, 221), Title = 'Color' }):OnChanged(function(Value)
if Value == true then
elseif Value == false then
setArmProperties("Color", Color3.fromRGB(44, 0, 221))
setArmProperties("Material", "SmoothPlastic")
setArmProperties("TextureID", "")
end
end)
Options.ArmChamsColor:OnChanged(function(Value)
setArmProperties("Color", Value)
end)

ArmVisTab:AddDropdown('ArmChamsMaterial', {Values = { "ForceField"  },Default = 1,Multi = false,Text = 'arm material:'}):OnChanged(function(Value)
setArmProperties("Material", Value)
end)





local oldTick = tick()
local Camera = game:GetService("Workspace").CurrentCamera
local CharcaterMiddle = game:GetService("Workspace").Ignore.LocalCharacter.Middle
local Mouse = game.Players.LocalPlayer:GetMouse()

local Functions = {}
local Esp = {
	Settings = {
		Boxes = false,
		BoxesOutline = true,
		BoxesColor = Color3.fromRGB(44, 0, 221),
		BoxesOutlineColor = Color3.fromRGB(0, 0, 0),
		Sleeping = false,
		SleepingColor = Color3.fromRGB(44, 0, 221),
		Distances = false,
		DistanceColor = Color3.fromRGB(44, 0, 221),
		Armour = false,
		ArmourColor = Color3.fromRGB(44, 0, 221),
		Tool = false,
		ToolColor = Color3.fromRGB(44, 0, 221),
		Tracer = false,
		TracerColor = Color3.fromRGB(44, 0, 221),
		TracerThickness = 1,
		TracerTransparrency = 1,
		TracerFrom = "Bottom",
		ViewAngle = false,
		ViewAngleColor = Color3.fromRGB(44, 0, 221),
		ViewAngleThickness = 1,
		ViewAngleTransparrency = 1,
		OreDistances = false,
		OreDistanceColor = Color3.fromRGB(44, 0, 221),
		OreNames = false,
		OreNamesColor = Color3.fromRGB(44, 0, 221),
		OresRenderDistance = 1500,
		TextFont = 2,
		TextOutline = true,
		TextSize = 25,
		RenderDistance = 1500,
		TeamCheck = false,
		TargetSleepers = false,
		MinTextSize = 10,
	},
	Drawings = {},
	Connections = {},
	Players = {},
	Ores = {},
	StorageThings = {},
}
local Fonts = { ["UI"] = 0, ["System"] = 1, ["Plex"] = 2, ["Monospace"] = 3 }
local cache = {}
local Fov = {Settings={
    FovEnabled=true,
    FovColor=Color3.fromRGB(255,255,255),
    FovSize=90,
    FovFilled=false,
    FovTransparency=1,
    OutlineFovColor=Color3.fromRGB(0,0,0),
    RealFovSize=90,
    FovPosition="Screen",
    Snapline=true,
    SnaplineColor=Color3.fromRGB(255,255,255)
  }}
  local Combat = {Settings={
    SilentEnabled=true,
    SilentHitChance=100,
    SilentAimPart="Head",
    TeamCheck=true,
    SleeperCheck=true,
  }}
  local cache = {}
  
  --// Silent Aim -()
  function Functions:GetClosest()
    local closest,PlayerDistance,playerTable = nil,Combat.Settings.RenderDistance,nil
    for i,v in pairs(getupvalues(getrenv()._G.modules.Player.GetPlayerModel)[1]) do
      if v.model:FindFirstChild("HumanoidRootPart") and Combat.Settings.SleeperCheck == true and v.sleeping == nil then
        local Mouse = game.Players.LocalPlayer:GetMouse()
        local pos,OnScreen = Camera.WorldToViewportPoint(Camera, v.model:GetPivot().Position)
        local MouseMagnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
        local PlayerDistance = (CharcaterMiddle:GetPivot().Position-v.model:GetPivot().Position).Magnitude
        if MouseMagnitude < Fov.Settings.FovSize and PlayerDistance <= Combat.Settings.RenderDistance and OnScreen == true then
          closest = v.model;PlayerDistance = PlayerDistance;playerTable=v
        end
      elseif v.model:FindFirstChild("HumanoidRootPart") and Combat.Settings.SleeperCheck == false then
        local Mouse = game.Players.LocalPlayer:GetMouse()
        local pos,OnScreen = Camera.WorldToViewportPoint(Camera, v.model:GetPivot().Position)
        local MouseMagnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
        local PlayerDistance = (CharcaterMiddle:GetPivot().Position-v.model:GetPivot().Position).Magnitude
        if MouseMagnitude < Fov.Settings.FovSize and PlayerDistance <= Combat.Settings.RenderDistance and OnScreen == true then
          closest = v.model;PlayerDistance = PlayerDistance;playerTable=v
        end
      end
    end
    return closest,playerTable
  end
  function Functions:GetProjectileInfo()
    if getrenv()._G.modules.FPS.GetEquippedItem() == nil then return 0,0 end
    local mod = require(game:GetService("ReplicatedStorage").ItemConfigs[getrenv()._G.modules.FPS.GetEquippedItem().id])
    for i,v in pairs(mod) do
      if i == "ProjectileSpeed" or i == "ProjectileDrop" then
        return mod.ProjectileSpeed,mod.ProjectileDrop
      end
    end
    return 0,0
  end
  function Functions:Predict()
    local Prediction = Vector3.new(0,0,0)
    local Drop = Vector3.new(0,0,0)
    if Functions:GetClosest() ~= nil then
      local ps,pd = Functions:GetProjectileInfo()
      local Player,PlayerTable = Functions:GetClosest()
      local Velocity = PlayerTable.velocityVector
      local Distance = (CharcaterMiddle.Position - Player[Combat.Settings.SilentAimPart].Position).Magnitude
      if ps == 0 then
        ps = 500
      end
      if pd == 0 then
        pd = 1
      end
      local TimeOfFlight = Distance / ps
      newps = ps - 13 * ps ^ 2 * TimeOfFlight ^ 2
      TimeOfFlight += (Distance / newps)
      local dropTime = pd * TimeOfFlight ^ 2
      if Velocity and TimeOfFlight then
        Drop = Vector3.new(0,(dropTime * 20)*.4,0)
        Prediction = (Velocity * (TimeOfFlight*8)) * .70
      end
      Prediction = Prediction + Drop
    end
    return Prediction,Drop
  end
  
  --// Player ESP -()
  function Functions:Draw(Type,Propities)
    if not Type and not Propities then return end
    local drawing = Drawing.new(Type)
    for i,v in pairs(Propities) do
      drawing[i] = v
    end
    table.insert(Esp.Drawings,drawing)
    return drawing
  end
  function Esp:CreateEsp(PlayerTable)
    if not PlayerTable then return end
    local drawings = {}
    drawings.BoxOutline = Functions:Draw("Square",{Thickness=2,Filled=false,Transparency=1,ZIndex = -1,Visible=false});
    drawings.Box = Functions:Draw("Square",{Thickness=1,Filled=false,Transparency=1,Color=Esp.Settings.BoxesColor,Color=Esp.Settings.OtherBoxesColor,Color=Esp.Settings.OtherBoxesColorTeam,ZIndex = 2,Visible=false});
    drawings.BoxFilled = Functions:Draw("Square",{Thickness=1,Filled=true,Transparency=Esp.Settings.BoxesFilledTransparency,Color=Esp.Settings.BoxesFilledColor,ZIndex = 2,Visible=false});
    drawings.Sleeping = Functions:Draw("Text",{Text = "Nil",Font=Esp.Settings.TextFont,Size=Esp.Settings.TextSize,Center=true,Outline=Esp.Settings.TextOutline,Color = Esp.Settings.SleepingColor,Color = Esp.Settings.OtherSleepingColor,Color = Esp.Settings.OtherSleepingColorTeam,ZIndex = 2,Visible=false})
    drawings.Distance = Functions:Draw("Text",{Text = "[nil]",Font=Esp.Settings.TextFont,Size=Esp.Settings.TextSize,Center=true,Outline=Esp.Settings.TextOutline,Color = Esp.Settings.DistanceColor,Color = Esp.Settings.OtherDistanceColor,Color = Esp.Settings.OtherDistanceColorTeam,ZIndex = 2,Visible=false})
    drawings.Armour = Functions:Draw("Text",{Text = "",Font=Esp.Settings.TextFont,Size=Esp.Settings.TextSize,Center=true,Outline=Esp.Settings.TextOutline,Color = Esp.Settings.ArmourColor,Color = Esp.Settings.OtherArmourColor,Color = Esp.Settings.OtherArmourColorTeam,ZIndex = 2,Visible=false})
    drawings.Tool = Functions:Draw("Text",{Text = "Empty",Font=Esp.Settings.TextFont,Size=Esp.Settings.TextSize,Center=true,Outline=Esp.Settings.TextOutline,Color = Esp.Settings.ToolColor,Color = Esp.Settings.OtherToolColor,Color = Esp.Settings.OtherToolColorTeam,ZIndex = 2,Visible=false})
    drawings.ViewAngle = Functions:Draw("Line",{Thickness=Esp.Settings.ViewAngleThickness,Transparency=Esp.Settings.ViewAngleTransparrency,Color=Esp.Settings.ViewAngleColor,Color=Esp.Settings.OtherViewAngleColor,Color=Esp.Settings.OtherViewAngleColorTeam,ZIndex=2,Visible=false})
    drawings.HeadCircles = Functions:Draw("Circle",{Thickness=Esp.Settings.HeadCirclesThickness,Transparency=Esp.Settings.HeadCirclesTransparrency,Color=Esp.Settings.HeadCirclesColor,Color=Esp.Settings.OtherHeadCirclesColor,Color=Esp.Settings.OtherHeadCirclesColorTeam,ZIndex=2,Visible=false})
    drawings.Tracer = Functions:Draw("Line",{Thickness=Esp.Settings.TracerThickness,Transparency=1,Color=Esp.Settings.TracerColor,Color=Esp.Settings.OtherTracerColor,Color=Esp.Settings.OtherTracerColorTeam,ZIndex=2,Visible=false})
    drawings.Line1 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false});drawings.Line2 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false});drawings.Line3 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false});drawings.Line4 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false});drawings.Line5 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false});drawings.Line6 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false});drawings.Line7 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false});drawings.Line8 = Functions:Draw("Line",{Thickness=Esp.Settings.CornerEspThickness,Transparency=1,Color=Esp.Settings.BoxesColor,ZIndex=2,Visible=false})
    drawings.PlayerTable = PlayerTable
    Esp.Players[PlayerTable.model] = drawings
  end
  function Esp:RemoveEsp(PlayerTable)
    if not PlayerTable and PlayerTable.model ~= nil then return end
    esp = Esp.Players[PlayerTable.model];
    if not esp then return end
    for i, v in pairs(esp) do
      if not type(v) == "table" then
        v:Remove();
      end
    end
    Esp.Players[PlayerTable.model] = nil;
  end
  function Esp:UpdateEsp()
    for i,v in pairs(Esp.Players) do
      local Character = i
      local Position,OnScreen = Camera:WorldToViewportPoint(Character:GetPivot().Position);
      local scale = 1 / (Position.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100;
      local w,h = math.floor(40 * scale), math.floor(55 * scale);
      local x,y = math.floor(Position.X), math.floor(Position.Y);
      local Distance = (CharcaterMiddle:GetPivot().Position-Character:GetPivot().Position).Magnitude
      local BoxPosX,BoxPosY = math.floor(x - w * 0.5),math.floor(y - h * 0.5)
      local offsetCFrame = CFrame.new(0, 0, -4)
      local IsVisible = false
      if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Head") and Character.Parent == game.Workspace then
        local TeamTag = Character.Head.Teamtag.Enabled
        local ccc,ttt = Functions:GetClosest()
        if OnScreen == true and Esp.Settings.Boxes == true and Distance <= Esp.Settings.RenderDistance then
          if Esp.Settings.TeamCheck == true and TeamTag == false then
            v.BoxOutline.Visible = Esp.Settings.BoxesOutline;v.Box.Visible = true;v.BoxFilled.Visible=Esp.Settings.BoxesFilled
          elseif Esp.Settings.TeamCheck == true and TeamTag == true then
            v.BoxOutline.Visible = false;v.Box.Visible = false;v.BoxFilled.Visible=false
          else
            v.BoxOutline.Visible = Esp.Settings.BoxesOutline;v.Box.Visible = true;v.BoxFilled.Visible=Esp.Settings.BoxesFilled
          end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
            v.BoxOutline.Visible = false;v.Box.Visible = false;v.BoxFilled.Visible = false
          end
          v.BoxOutline.Position = Vector2.new(BoxPosX,BoxPosY);v.BoxOutline.Size = Vector2.new(w,h)
          v.Box.Position = Vector2.new(BoxPosX,BoxPosY);v.Box.Size = Vector2.new(w,h)
          v.Box.Color = Esp.Settings.BoxesColor;v.BoxOutline.Color = Color3.fromRGB(0, 0, 0)
          v.BoxOutline.Transparency = 1
          v.BoxFilled.Position=Vector2.new(BoxPosX,BoxPosY);v.BoxFilled.Size=Vector2.new(w,h)
          v.BoxFilled.Transparency = Esp.Settings.BoxesFilledTransparency
          v.BoxFilled.Color = Esp.Settings.BoxesFilledColor
          if IsVisible == true then
            v.Box.Color = Color3.fromRGB(255,0,0);v.BoxOutline.Color=Esp.Settings.BoxesOutlineColor;v.BoxFilled.Color=Color3.fromRGB(0,0,0)
          else
            v.Box.Color = Esp.Settings.BoxesColor;v.BoxOutline.Color = Esp.Settings.BoxesOutlineColor;v.BoxFilled.Color=Esp.Settings.BoxesFilledColor
          end
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.Box.Color = Esp.Settings.HighlightTargetColor
          else
            v.Box.Color = Esp.Settings.BoxesColor;
          end
          if v.PlayerTable.sleeping == true then v.Box.Color = Esp.Settings.OtherBoxesColor end
          if TeamTag == true then v.Sleeping.Text = "Friendly" end
          if TeamTag == true then v.Box.Color = Esp.Settings.OtherBoxesColorTeam end
        else
          v.BoxOutline.Visible = false;v.Box.Visible = false;v.BoxFilled.Visible = false;
        end
        if OnScreen == true and Esp.Settings.CornerBoxes == true and Distance <= Esp.Settings.RenderDistance then
          if Esp.Settings.TeamCheck == true and TeamTag == false then
            v.BoxFilled.Visible=Esp.Settings.BoxesFilled
            v.Line1.Visible=Esp.Settings.CornerBoxes;v.Line2.Visible=Esp.Settings.CornerBoxes;v.Line3.Visible=Esp.Settings.CornerBoxes;v.Line4.Visible=Esp.Settings.CornerBoxes;v.Line5.Visible=Esp.Settings.CornerBoxes;v.Line6.Visible=Esp.Settings.CornerBoxes;v.Line7.Visible=Esp.Settings.CornerBoxes;v.Line8.Visible=Esp.Settings.CornerBoxes
          elseif Esp.Settings.TeamCheck == true and TeamTag == true then
            v.Line1.Visible=false;v.Line2.Visible=false;v.Line3.Visible=false;v.Line4.Visible=false;v.Line5.Visible=false;v.Line6.Visible=false;v.Line7.Visible=false;v.Line8.Visible=false
            v.BoxFilled.Visible=false
          else
            v.BoxFilled.Visible=Esp.Settings.BoxesFilled
            v.Line1.Visible=Esp.Settings.CornerBoxes;v.Line2.Visible=Esp.Settings.CornerBoxes;v.Line3.Visible=Esp.Settings.CornerBoxes;v.Line4.Visible=Esp.Settings.CornerBoxes;v.Line5.Visible=Esp.Settings.CornerBoxes;v.Line6.Visible=Esp.Settings.CornerBoxes;v.Line7.Visible=Esp.Settings.CornerBoxes;v.Line8.Visible=Esp.Settings.CornerBoxes
          end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
            v.Line1.Visible=false;v.Line2.Visible=false;v.Line3.Visible=false;v.Line4.Visible=false;v.Line5.Visible=false;v.Line6.Visible=false;v.Line7.Visible=false;v.Line8.Visible=false
            v.BoxFilled.Visible = false
          end
          v.Line1.From=Vector2.new(BoxPosX,BoxPosY);v.Line1.To=Vector2.new((BoxPosX+w/4),BoxPosY) --Top Left Top
          v.Line2.From=Vector2.new(BoxPosX+w,BoxPosY);v.Line2.To=Vector2.new((BoxPosX+w)-w/4,BoxPosY) -- Top Right Top
          v.Line3.From=Vector2.new(BoxPosX,BoxPosY+h);v.Line3.To=Vector2.new((BoxPosX+w/4),BoxPosY+h) -- Bottom Left Bottom
          v.Line4.From=Vector2.new(BoxPosX+w,BoxPosY+h);v.Line4.To=Vector2.new((BoxPosX+w)-w/4,BoxPosY+h) --Bottom Right Bottom
          v.Line5.From=Vector2.new(BoxPosX,BoxPosY);v.Line5.To=Vector2.new(BoxPosX,BoxPosY+h/8) --Top Left Down
          v.Line6.From=Vector2.new(BoxPosX,BoxPosY+h);v.Line6.To=Vector2.new(BoxPosX,(BoxPosY+h)-h/8) --Bottom Left Up
          v.Line7.From=Vector2.new(BoxPosX+w,BoxPosY+h);v.Line7.To=Vector2.new(BoxPosX+w,(BoxPosY+h)-h/8) --Bottom Right Up
          v.Line8.From=Vector2.new(BoxPosX+w,BoxPosY);v.Line8.To=Vector2.new(BoxPosX+w,BoxPosY+h/8) --Top Right Down
          v.BoxFilled.Position=Vector2.new(BoxPosX,BoxPosY);v.BoxFilled.Size=Vector2.new(w,h)
          v.BoxFilled.Transparency = Esp.Settings.BoxesFilledTransparency
          if IsVisible == true then
            v.Line1.Color=Color3.fromRGB(255,0,0);v.Line2.Color=Color3.fromRGB(255,0,0);v.Line3.Color=Color3.fromRGB(255,0,0);v.Line4.Color=Color3.fromRGB(255,0,0);v.Line5.Color=Color3.fromRGB(255,0,0);v.Line6.Color=Color3.fromRGB(255,0,0);v.Line7.Color=Color3.fromRGB(255,0,0);v.Line8.Color=Color3.fromRGB(255,0,0)
            v.BoxFilled.Color=Color3.fromRGB(255,0,0)
          else
            v.Line1.Color=Esp.Settings.BoxesColor;v.Line2.Color=Esp.Settings.BoxesColor;v.Line3.Color=Esp.Settings.BoxesColor;v.Line4.Color=Esp.Settings.BoxesColor;v.Line5.Color=Esp.Settings.BoxesColor;v.Line6.Color=Esp.Settings.BoxesColor;v.Line7.Color=Esp.Settings.BoxesColor;v.Line8.Color=Esp.Settings.BoxesColor
            v.BoxFilled.Color=Esp.Settings.BoxesFilledColor
          end
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.Line1.Color = Esp.Settings.HighlightTargetColor
            v.Line2.Color = Esp.Settings.HighlightTargetColor
            v.Line3.Color = Esp.Settings.HighlightTargetColor
            v.Line4.Color = Esp.Settings.HighlightTargetColor
            v.Line5.Color = Esp.Settings.HighlightTargetColor
            v.Line6.Color = Esp.Settings.HighlightTargetColor
            v.Line7.Color = Esp.Settings.HighlightTargetColor
            v.Line8.Color = Esp.Settings.HighlightTargetColor
          else
            v.Line1.Color = Esp.Settings.BoxesColor
            v.Line2.Color = Esp.Settings.BoxesColor
            v.Line3.Color = Esp.Settings.BoxesColor
            v.Line4.Color = Esp.Settings.BoxesColor
            v.Line5.Color = Esp.Settings.BoxesColor
            v.Line6.Color = Esp.Settings.BoxesColor
            v.Line7.Color = Esp.Settings.BoxesColor
            v.Line8.Color = Esp.Settings.BoxesColor
          end
          if v.PlayerTable.sleeping == true then
            v.Line1.Color = Esp.Settings.OtherBoxesColor;v.Line2.Color = Esp.Settings.OtherBoxesColor;v.Line3.Color = Esp.Settings.OtherBoxesColor;v.Line4.Color = Esp.Settings.OtherBoxesColor;v.Line5.Color = Esp.Settings.OtherBoxesColor;v.Line6.Color = Esp.Settings.OtherBoxesColor;v.Line7.Color = Esp.Settings.OtherBoxesColor;v.Line8.Color = Esp.Settings.OtherBoxesColor
          end
          if TeamTag == true then
            v.Line1.Color = Esp.Settings.OtherBoxesColorTeam;v.Line2.Color = Esp.Settings.OtherBoxesColorTeam;v.Line3.Color = Esp.Settings.OtherBoxesColorTeam;v.Line4.Color = Esp.Settings.OtherBoxesColorTeam;v.Line5.Color = Esp.Settings.OtherBoxesColorTeam;v.Line6.Color = Esp.Settings.OtherBoxesColorTeam;v.Line7.Color = Esp.Settings.OtherBoxesColorTeam;v.Line8.Color = Esp.Settings.OtherBoxesColorTeam
          end
        else
          v.Line1.Visible=false;v.Line2.Visible=false;v.Line3.Visible=false;v.Line4.Visible=false;v.Line5.Visible=false;v.Line6.Visible=false;v.Line7.Visible=false;v.Line8.Visible=false;v.BoxFilled.Visible = false
        end
        if OnScreen == true and Esp.Settings.Sleeping == true and Distance <= Esp.Settings.RenderDistance then
          if Character.Head.Nametag.tag.Text ~= "" then
            v.Sleeping.Text = Character:FindFirstChild("Head").Nametag.tag.Text
          else
            v.Sleeping.Text = "Enemy"
            if TeamTag == true then v.Sleeping.Text = "Friendly" end
            if v.PlayerTable.sleeping == true then v.Sleeping.Text = "Sleeping" end
          end
          if Esp.Settings.TeamCheck == true and TeamTag == false then  v.Sleeping.Visible = true elseif Esp.Settings.TeamCheck == true and TeamTag == true then v.Sleeping.Visible = false else v.Sleeping.Visible = true end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then v.Sleeping.Visible = false end
          v.Sleeping.Outline=Esp.Settings.TextOutline;v.Sleeping.Color=Esp.Settings.SleepingColor;v.Sleeping.Size=math.max(math.min(math.abs(Esp.Settings.TextSize*scale),Esp.Settings.TextSize),Esp.Settings.MinTextSize);v.Sleeping.Color = Esp.Settings.SleepingColor;v.Sleeping.Font=Esp.Settings.TextFont;v.Sleeping.Position = Vector2.new(x,math.floor(y-h*0.5-v.Sleeping.TextBounds.Y))
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.Sleeping.Color = Esp.Settings.HighlightTargetColor
          else
            v.Sleeping.Color = Esp.Settings.SleepingColor;
          end
          if v.PlayerTable.sleeping == true then v.Sleeping.Color = Esp.Settings.OtherSleepingColor end
          if TeamTag == true then v.Sleeping.Color = Esp.Settings.OtherSleepingColorTeam end
        else
          v.Sleeping.Visible=false
        end
        if OnScreen == true and Esp.Settings.Distances == true and Distance <= Esp.Settings.RenderDistance then
          if Esp.Settings.TeamCheck == true and TeamTag == false then v.Distance.Visible = true elseif Esp.Settings.TeamCheck == true and TeamTag == true then v.Distance.Visible = false else v.Distance.Visible = true end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then v.Distance.Visible = false end
          v.Distance.Outline=Esp.Settings.TextOutline;v.Distance.Size = math.max(math.min(math.abs(Esp.Settings.TextSize*scale),Esp.Settings.TextSize),Esp.Settings.MinTextSize);v.Distance.Position=Vector2.new(x,math.floor(y+h*0.5));v.Distance.Color = Esp.Settings.DistanceColor;v.Distance.Text = tostring("["..math.floor(Distance)).."]";v.Distance.Font=Esp.Settings.TextFont
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.Distance.Color = Esp.Settings.HighlightTargetColor
          else
            v.Distance.Color = Esp.Settings.DistanceColor;
          end
          if v.PlayerTable.sleeping == true then v.Distance.Color = Esp.Settings.OtherDistanceColor end
          if TeamTag == true then v.Distance.Color = Esp.Settings.OtherDistanceColorTeam end
        else
          v.Distance.Visible = false
        end
        if OnScreen == true and Esp.Settings.Tool == true and Distance <= Esp.Settings.RenderDistance then
          if Esp.Settings.TeamCheck == true and TeamTag == false then v.Tool.Visible = true elseif Esp.Settings.TeamCheck == true and TeamTag == true then v.Tool.Visible = false else v.Tool.Visible = true end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then v.Tool.Visible = false end
          if Esp.Settings.Tool == true then v.Tool.Position=Vector2.new(x, math.floor(y+h*0.5)+v.Tool.TextBounds.Y) else v.Tool.Position=Vector2.new(x,math.floor(y+h*0.5)); end
          v.Tool.Text=Esp:CheckTools(v.PlayerTable);v.Tool.Outline=Esp.Settings.TextOutline;v.Tool.Size=math.max(math.min(math.abs(Esp.Settings.TextSize*scale),Esp.Settings.TextSize),Esp.Settings.MinTextSize);v.Tool.Color=Esp.Settings.ToolColor;v.Tool.Font=Esp.Settings.TextFont
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.Tool.Color = Esp.Settings.HighlightTargetColor
          else
            v.Tool.Color = Esp.Settings.ToolColor;
          end
          if v.PlayerTable.sleeping == true then v.Tool.Color = Esp.Settings.OtherToolColor end
          if TeamTag == true then v.Tool.Color = Esp.Settings.OtherToolColorTeam end
        else
          v.Tool.Visible = false
        end
        local armorFolder = Character.Armor:FindFirstChildOfClass("Folder")
        if OnScreen == true and Esp.Settings.Armour == true and Distance <= Esp.Settings.RenderDistance and armorFolder then
          local armorName = armorFolder.Name
          if armorName == "WoodHelmet" or armorName == "WoodChestplate" or armorName == "WoodLeggings" then
            v.Armour.Text = "Wood Gear"
          elseif armorName == "RiotHelmet" or armorName == "RiotChestplate" or armorName == "RiotLeggings" then
            v.Armour.Text = "Riot Gear"
          elseif armorName == "IronHelmet" or armorName == "IronChestplate" or armorName == "IronLeggings" then
            v.Armour.Text = "Iron Gear"
          elseif armorName == "SteelHelmet" or armorName == "SteelChestplate" or armorName == "SteelLeggings" then
            v.Armour.Text = "Steel Gear"
          else
            v.Armour.Text = ""
          end
          if Esp.Settings.TeamCheck == true and TeamTag == false then v.Armour.Visible = true elseif Esp.Settings.TeamCheck == true and TeamTag == true then v.Armour.Visible = false else v.Armour.Visible = true end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then v.Armour.Visible = false end
          v.Armour.Outline=Esp.Settings.TextOutline;v.Armour.Size = math.max(math.min(math.abs(Esp.Settings.TextSize*scale),Esp.Settings.TextSize),Esp.Settings.MinTextSize);v.Armour.Position=Vector2.new(math.floor(BoxPosX+w+v.Armour.TextBounds.X*1.30*0.5),BoxPosY+v.Armour.TextBounds.Y*1.85*0.5-((v.Armour.TextBounds.Y*2)*0.5));v.Armour.Color = Esp.Settings.ArmourColor;v.Armour.Font=Esp.Settings.TextFont
          v.Armour.Color = Esp.Settings.HighlightTargetColor
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.Armour.Color = Esp.Settings.HighlightTargetColor
          else
            v.Armour.Color = Esp.Settings.ArmourColor;
          end
          if v.PlayerTable.sleeping == true then v.Armour.Color = Esp.Settings.OtherArmourColor end
          if TeamTag == true then v.Armour.Color = Esp.Settings.OtherArmourColorTeam end
        else
          v.Armour.Visible = false;
        end
        if OnScreen == true and Esp.Settings.Tracer == true and Distance <= Esp.Settings.RenderDistance then
          if Esp.Settings.TeamCheck == true and TeamTag == false then v.Tracer.Visible = true elseif Esp.Settings.TeamCheck == true and TeamTag == true then v.Tracer.Visible = false else v.Tracer.Visible = true end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then v.Tracer.Visible = false end
          v.Tracer.Color = Esp.Settings.TracerColor;v.Tracer.Thickness=Esp.Settings.TracerThickness;v.Transparency=Esp.Settings.TracerTransparrency;
          if Esp.Settings.TracerFrom == "Bottom" then
            v.Tracer.From = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y)
            v.Tracer.To = Vector2.new(x,y+h*0.5)
          elseif Esp.Settings.TracerFrom == "Middle" then
            v.Tracer.From = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
            v.Tracer.To = Vector2.new(x,y)
          elseif Esp.Settings.TracerFrom == "Top" then
            v.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, 0)
            v.Tracer.To = Vector2.new(x,y-h*0.5)
          else
            v.Tracer.From = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/Camera.ViewportSize.Y)
            if Esp.Settings.Sleeping == true then
              v.Tracer.To = Vector2.new(x,(y-h)-v.Sleeping.TextBounds.Y*0.5)
            else
              v.Tracer.From = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y)
              v.Tracer.To = Vector2.new(x,y-h*0.5)
            end
          end
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.Tracer.Color = Esp.Settings.HighlightTargetColor
          else
            v.Tracer.Color = Esp.Settings.TracerColor;
          end
          if v.PlayerTable.sleeping == true then v.Tracer.Color = Esp.Settings.OtherTracerColor end
          if TeamTag == true then v.Tracer.Color = Esp.Settings.OtherTracerColorTeam end
        else
          v.Tracer.Visible = false
        end
        if OnScreen == true and Esp.Settings.ViewAngle == true and Distance <= Esp.Settings.RenderDistance then
          if Esp.Settings.TeamCheck == true and TeamTag == false then v.ViewAngle.Visible = true elseif Esp.Settings.TeamCheck == true and TeamTag == true then v.ViewAngle.Visible = false else v.ViewAngle.Visible = true end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then v.ViewAngle.Visible = false end
          v.ViewAngle.Color = Esp.Settings.ViewAngleColor;v.ViewAngle.Thickness=Esp.Settings.ViewAngleThickness;v.Transparency=Esp.Settings.ViewAngleTransparrency;
          local headpos = Camera:WorldToViewportPoint(Character.Head.Position)
          local offsetCFrame = CFrame.new(0, 0, -4)
          v.ViewAngle.From = Vector2.new(headpos.X, headpos.Y)
          local value = math.clamp(1/Distance*100, 0.1, 1)
          local dir = Character.Head.CFrame:ToWorldSpace(offsetCFrame)
          offsetCFrame = offsetCFrame * CFrame.new(0, 0, 0.4)
          local dirpos = Camera:WorldToViewportPoint(Vector3.new(dir.X, dir.Y, dir.Z))
          if OnScreen == true then
            v.ViewAngle.To = Vector2.new(dirpos.X, dirpos.Y)
            offsetCFrame = CFrame.new(0, 0, -4)
          end
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.ViewAngle.Color = Esp.Settings.HighlightTargetColor
          else
            v.ViewAngle.Color = Esp.Settings.ViewAngleColor;
          end
          if v.PlayerTable.sleeping == true then v.ViewAngle.Color = Esp.Settings.OtherViewAngleColor end
          if TeamTag == true then v.ViewAngle.Color = Esp.Settings.OtherViewAngleColorTeam end
        else
          v.ViewAngle.Visible = false
        end
        if OnScreen == true and Esp.Settings.HeadCircles == true and Distance <= Esp.Settings.RenderDistance then
          if Esp.Settings.TeamCheck == true and TeamTag == false then v.HeadCircles.Visible = true elseif Esp.Settings.TeamCheck == true and TeamTag == true then v.HeadCircles.Visible = false else v.HeadCircles.Visible = true end
          if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then v.HeadCircles.Visible = false end
          v.HeadCircles.Color = Esp.Settings.HeadCirclesColor;v.HeadCircles.Thickness=Esp.Settings.HeadCirclesThickness;v.Transparency=Esp.Settings.HeadCirclesTransparrency;
          local headpos = Camera:WorldToViewportPoint(Character.Head.Position)
          local Position,OnScreen = Camera:WorldToViewportPoint(Character:FindFirstChild("HumanoidRootPart").Position);
          if OnScreen == true then
            v.HeadCircles.Position = Vector2.new(headpos.X, headpos.Y)
            v.HeadCircles.Radius = 3
            v.HeadCircles.NumSides = 18
          end
          if Esp.Settings.HighlightTarget and Character == ccc then
            v.HeadCircles.Color = Esp.Settings.HighlightTargetColor
          else
            v.HeadCircles.Color = Esp.Settings.HeadCirclesColor;
          end
          if v.PlayerTable.sleeping == true then v.HeadCircles.Color = Esp.Settings.OtherHeadCirclesColor end
          if TeamTag == true then v.HeadCircles.Color = Esp.Settings.OtherHeadCirclesColorTeam end
        else
          v.HeadCircles.Visible = false
        end
      else
        v.Box.Visible=false;
        v.BoxOutline.Visible=false;
        v.BoxFilled.Visible=false;
        v.Tool.Visible=false;
        v.Armour.Visible=false;
        v.Distance.Visible=false;
        v.Sleeping.Visible=false;
        v.ViewAngle.Visible=false;
        v.HeadCircles.Visible=false;
        v.Tracer.Visible=false;
        v.Line1.Visible=false;v.Line2.Visible=false;v.Line3.Visible=false;v.Line4.Visible=false;v.Line5.Visible=false;v.Line6.Visible=false;v.Line7.Visible=false;v.Line8.Visible=false
      end
    end
  end
  local FovCircle = Functions:Draw("Circle",{Filled=Fov.Settings.FovFilled,Color=Fov.Settings.FovColor,Radius=Fov.Settings.FovSize,NumSides=64,Thickness=1,Transparency=Fov.Settings.FovTransparency,ZIndex=3,Visible=false})
  local FovCircleOutline = Functions:Draw("Circle",{Filled=Fov.Settings.FovOutlineFilled,Color=Fov.Settings.FovOutlineColor,Radius=Fov.Settings.FovOutlineSize,NumSides=64,Thickness=2.6,Transparency=0.28,ZIndex=2.98,Visible=false})
  local FovSnapline = Functions:Draw("Line",{Transparency=1,Thickness=1,Visible=false})
  local CircleLine = Functions:Draw("Circle",{Color=Fov.Settings.CircleLineColor,Radius=6,NumSides=18,Thickness=1,Transparency=Fov.Settings.FovTransparency,Visible=false})
  local PlayerUpdater = game:GetService("RunService").RenderStepped
  local PlayerConnection = PlayerUpdater:Connect(function()
  Esp:UpdateEsp()
  end)
  for i, v in pairs(getupvalues(getrenv()._G.modules.Player.GetPlayerModel)[1]) do
    if not table.find(cache,v) then
      table.insert(cache,v)
      Esp:CreateEsp(v)
    end
  end
  game:GetService("Workspace").ChildAdded:Connect(function(child)
  if child:FindFirstChild("HumanoidRootPart") then
    for i, v in pairs(getupvalues(getrenv()._G.modules.Player.GetPlayerModel)[1]) do
      if not table.find(cache,v) then
        table.insert(cache,v)
        Esp:CreateEsp(v)
      end
    end
  end
  end)
function Functions:Draw(Type, Propities)
	if not Type and not Propities then
		return
	end
	local drawing = Drawing.new(Type)
	for i, v in pairs(Propities) do
		drawing[i] = v
	end
	table.insert(Esp.Drawings, drawing)
	return drawing
end
function Functions:GetToolNames()
	tbl = {}
	for i, v in pairs(game:GetService("ReplicatedStorage").HandModels:GetChildren()) do
		if not table.find(tbl, v.Name) then
			table.insert(tbl, v.Name)
		end
	end
	return tbl
end
function Esp:CheckTools(PlayerTable)
	if not PlayerTable then
		return
	end
	if PlayerTable.equippedItem and table.find(Functions:GetToolNames(), PlayerTable["equippedItem"].id) then
		return tostring(PlayerTable["equippedItem"].id)
	elseif
		PlayerTable.handModel
		and PlayerTable.handModel.Name
		and string.find(PlayerTable.handModel.Name, "Hammer")
	then
		return PlayerTable["handModel"].Name
	else
		return "Empty"
	end
end
function Esp:CreateEsp(PlayerTable)
	if not PlayerTable then
		return
	end
	local drawings = {}
	drawings.BoxOutline = Functions:Draw(
		"Square",
		{
			Thickness = 2,
			Filled = false,
			Transparency = 1,
			Color = Esp.Settings.BoxesOutlineColor,
			Visible = false,
			ZIndex = -1,
			Visible = false,
		}
	)
	drawings.Box = Functions:Draw(
		"Square",
		{ Thickness = 1, Filled = false, Transparency = 1, Color = Esp.Settings.BoxesColor, Visible = false, ZIndex = 2, Visible = false }
	)
	drawings.Sleeping = Functions:Draw(
		"Text",
		{
			Text = "Nil",
			Font = Esp.Settings.TextFont,
			Size = Esp.Settings.TextSize,
			Center = true,
			Outline = Esp.Settings.TextOutline,
			Color = Esp.Settings.SleepingColor,
			ZIndex = 2,
			Visible = false,
		}
	)
	drawings.Armour = Functions:Draw(
		"Text",
		{
			Text = "Naked",
			Font = Esp.Settings.TextFont,
			Size = Esp.Settings.TextSize,
			Center = false,
			Outline = Esp.Settings.TextOutline,
			Color = Esp.Settings.ArmourColor,
			ZIndex = 2,
			Visible = false,
		}
	)
	drawings.Tool = Functions:Draw(
		"Text",
		{
			Text = "Nothing",
			Font = Esp.Settings.TextFont,
			Size = Esp.Settings.TextSize,
			Center = false,
			Outline = Esp.Settings.TextOutline,
			Color = Esp.Settings.ToolColor,
			ZIndex = 2,
			Visible = false,
		}
	)
	drawings.ViewAngle = Functions:Draw(
		"Line",
		{
			Thickness = Esp.Settings.ViewAngleThickness,
			Transparency = Esp.Settings.ViewAngleTransparrency,
			Color = Esp.Settings.ViewAngleColor,
			ZIndex = 2,
			Visible = false,
		}
	)
	drawings.Tracer = Functions:Draw(
		"Line",
		{ Thickness = Esp.Settings.TracerThickness, Transparency = 1, Color = Esp.Settings.TracerColor, ZIndex = 2, Visible = false }
	)
	drawings.PlayerTable = PlayerTable
	Esp.Players[PlayerTable.model] = drawings
end
function Esp:RemoveEsp(PlayerTable)
	if not PlayerTable and PlayerTable.model ~= nil then
		return
	end
	esp = Esp.Players[PlayerTable.model]
	if not esp then
		return
	end
	for i, v in pairs(esp) do
		if not type(v) == "table" then
			v:Remove()
		end
	end
	Esp.Players[PlayerTable.model] = nil
end

function Esp:UpdateEsp()
	for i, v in pairs(Esp.Players) do
		local Character = i
		local Position, OnScreen = Camera:WorldToViewportPoint(Character:GetPivot().Position)
		local scale = 1 / (Position.Z * math.tan(math.rad(Camera.FieldOfView * 0.5)) * 2) * 100
		local w, h = math.floor(40 * scale), math.floor(55 * scale)
		local x, y = math.floor(Position.X), math.floor(Position.Y)
		local Distance = (CharcaterMiddle:GetPivot().Position - Character:GetPivot().Position).Magnitude
		local BoxPosX, BoxPosY = math.floor(x - w * 0.5), math.floor(y - h * 0.5)
		local offsetCFrame = CFrame.new(0, 0, -4)
		if Character and Character:FindFirstChild("HumanoidRootPart") and Character:FindFirstChild("Head") then
			local TeamTag = Character.Head.Teamtag.Enabled
			if OnScreen == true and Esp.Settings.Boxes == true and Distance <= Esp.Settings.RenderDistance then
				if Esp.Settings.TeamCheck == true and TeamTag == false then
					v.BoxOutline.Visible = Esp.Settings.BoxesOutline
					v.Box.Visible = true
				elseif Esp.Settings.TeamCheck == true and TeamTag == true then
					v.BoxOutline.Visible = false
					v.Box.Visible = false
				else
					v.BoxOutline.Visible = Esp.Settings.BoxesOutline
					v.Box.Visible = true
				end
				if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
					v.BoxOutline.Visible = false
					v.Box.Visible = false
				end
				v.BoxOutline.Position = Vector2.new(BoxPosX, BoxPosY)
				v.BoxOutline.Size = Vector2.new(w, h)
				v.Box.Position = Vector2.new(BoxPosX, BoxPosY)
				v.Box.Size = Vector2.new(w, h)
				v.Box.Color = Esp.Settings.BoxesColor
				v.BoxOutline.Color = Esp.Settings.BoxesOutlineColor
			else
				v.BoxOutline.Visible = false
				v.Box.Visible = false
			end
			if OnScreen == true and Esp.Settings.Sleeping == true and Distance <= Esp.Settings.RenderDistance then
				if v.PlayerTable.sleeping == true then
					v.Sleeping.Text = "Sleeping"
				else
					v.Sleeping.Text = "Awake"
				end
				if Esp.Settings.TeamCheck == true and TeamTag == false then
					v.Sleeping.Visible = true
				elseif Esp.Settings.TeamCheck == true and TeamTag == true then
					v.Sleeping.Visible = false
				else
					v.Sleeping.Visible = true
				end
				if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
					v.Sleeping.Visible = false
				end
				v.Sleeping.Outline = Esp.Settings.TextOutline
				v.Sleeping.Color = Esp.Settings.SleepingColor
				v.Sleeping.Size = math.max(
					math.min(math.abs(Esp.Settings.TextSize * scale), Esp.Settings.TextSize),
					Esp.Settings.MinTextSize
				)
				v.Sleeping.Color = Esp.Settings.SleepingColor
				v.Sleeping.Font = Esp.Settings.TextFont
				v.Sleeping.Position = Vector2.new(x, math.floor(y - h * 0.5 - v.Sleeping.TextBounds.Y))
			else
				v.Sleeping.Visible = false
			end
			if OnScreen == true and Esp.Settings.Distances == true and Distance <= Esp.Settings.RenderDistance then
				if Esp.Settings.TeamCheck == true and TeamTag == false then
					v.Sleeping.Visible = true
				elseif Esp.Settings.TeamCheck == true and TeamTag == true then
					v.Sleeping.Visible = false
				else
					v.Sleeping.Visible = true
				end
				if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
					v.Sleeping.Visible = false
				end

				if Esp.Settings.Sleeping == false then
					v.Sleeping.Text = math.floor(Distance) .. "s"
				else
					v.Sleeping.Text = v.Sleeping.Text .. " | " .. math.floor(Distance) .. "s"
				end
				v.Sleeping.Outline = Esp.Settings.TextOutline
				v.Sleeping.Color = Esp.Settings.SleepingColor
				v.Sleeping.Size = math.max(
					math.min(math.abs(Esp.Settings.TextSize * scale), Esp.Settings.TextSize),
					Esp.Settings.MinTextSize
				)
				v.Sleeping.Color = Esp.Settings.SleepingColor
				v.Sleeping.Font = Esp.Settings.TextFont
				v.Sleeping.Position = Vector2.new(x, math.floor(y - h * 0.5 - v.Sleeping.TextBounds.Y))
			else
				v.Sleeping.Visible = false
			end
			if OnScreen == true and Esp.Settings.Tool == true and Distance <= Esp.Settings.RenderDistance then
				if Esp.Settings.TeamCheck == true and TeamTag == false then
					v.Tool.Visible = true
				elseif Esp.Settings.TeamCheck == true and TeamTag == true then
					v.Tool.Visible = false
				else
					v.Tool.Visible = true
				end
				if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
					v.Tool.Visible = false
				end
				v.Tool.Position = Vector2.new(
					math.floor((BoxPosX + w) + v.Tool.TextBounds.X / 10),
					BoxPosY + v.Tool.TextBounds.Y * 1.55 * 0.5 - ((v.Tool.TextBounds.Y * 2) * 0.5) + v.Tool.TextBounds.Y
				)
				v.Tool.Text = Esp:CheckTools(v.PlayerTable)
				v.Tool.Outline = Esp.Settings.TextOutline
				v.Tool.Size = math.max(
					math.min(math.abs(Esp.Settings.TextSize * scale), Esp.Settings.TextSize),
					Esp.Settings.MinTextSize
				)
				v.Tool.Color = Esp.Settings.ToolColor
				v.Tool.Font = Esp.Settings.TextFont
			else
				v.Tool.Visible = false
			end
			if OnScreen == true and Esp.Settings.Armour == true and Distance <= Esp.Settings.RenderDistance then
				if Character.Armor:FindFirstChildOfClass("Folder") then
					v.Armour.Text = "Armoured"
				else
					v.Armour.Text = "Naked"
				end
				if Esp.Settings.TeamCheck == true and TeamTag == false then
					v.Armour.Visible = true
				elseif Esp.Settings.TeamCheck == true and TeamTag == true then
					v.Armour.Visible = false
				else
					v.Armour.Visible = true
				end
				if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
					v.Armour.Visible = false
				end
				v.Armour.Outline = Esp.Settings.TextOutline
				v.Armour.Size = math.max(
					math.min(math.abs(Esp.Settings.TextSize * scale), Esp.Settings.TextSize),
					Esp.Settings.MinTextSize
				)
				v.Armour.Position = Vector2.new(
					math.floor((BoxPosX + w) + v.Armour.TextBounds.X / 10),
					BoxPosY + v.Armour.TextBounds.Y * 1.55 * 0.5 - ((v.Armour.TextBounds.Y * 2) * 0.5)
				)
				v.Armour.Color = Esp.Settings.ArmourColor
				v.Armour.Font = Esp.Settings.TextFont
			else
				v.Armour.Visible = false
			end
			if OnScreen == true and Esp.Settings.Tracer == true and Distance <= Esp.Settings.RenderDistance then
				if Esp.Settings.TeamCheck == true and TeamTag == false then
					v.Tracer.Visible = true
				elseif Esp.Settings.TeamCheck == true and TeamTag == true then
					v.Tracer.Visible = false
				else
					v.Tracer.Visible = true
				end
				if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
					v.Tracer.Visible = false
				end
				v.Tracer.Color = Esp.Settings.TracerColor
				v.Tracer.Thickness = Esp.Settings.TracerThickness
				v.Transparency = Esp.Settings.TracerTransparrency
				if Esp.Settings.TracerFrom == "Bottom" then
					v.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
					v.Tracer.To = Vector2.new(x, y + h * 0.5)
				elseif Esp.Settings.TracerFrom == "Middle" then
					v.Tracer.From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
					v.Tracer.To = Vector2.new(x, y)
				else
					v.Tracer.From =
						Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / Camera.ViewportSize.Y)
					if Esp.Settings.Sleeping == true then
						v.Tracer.To = Vector2.new(x, (y - h) - v.Sleeping.TextBounds.Y * 0.5)
					else
						v.Tracer.To = Vector2.new(x, y - h * 0.5)
					end
				end
			else
				v.Tracer.Visible = false
			end
			if OnScreen == true and Esp.Settings.ViewAngle == true and Distance <= Esp.Settings.RenderDistance then
				if Esp.Settings.TeamCheck == true and TeamTag == false then
					v.ViewAngle.Visible = true
				elseif Esp.Settings.TeamCheck == true and TeamTag == true then
					v.ViewAngle.Visible = false
				else
					v.ViewAngle.Visible = true
				end
				if Esp.Settings.TargetSleepers == true and v.PlayerTable.sleeping == true then
					v.ViewAngle.Visible = false
				end
				v.ViewAngle.Color = Esp.Settings.ViewAngleColor
				v.ViewAngle.Thickness = Esp.Settings.ViewAngleThickness
				v.Transparency = Esp.Settings.ViewAngleTransparrency
				local headpos = Camera:WorldToViewportPoint(Character.Head.Position)
				local offsetCFrame = CFrame.new(0, 0, -4)
				v.ViewAngle.From = Vector2.new(headpos.X, headpos.Y)
				local value = math.clamp(1 / Distance * 100, 0.1, 1)
				local dir = Character.Head.CFrame:ToWorldSpace(offsetCFrame)
				offsetCFrame = offsetCFrame * CFrame.new(0, 0, 0.4)
				local dirpos = Camera:WorldToViewportPoint(Vector3.new(dir.X, dir.Y, dir.Z))
				if OnScreen == true then
					v.ViewAngle.To = Vector2.new(dirpos.X, dirpos.Y)
					offsetCFrame = CFrame.new(0, 0, -4)
				end
			else
				v.ViewAngle.Visible = false
			end
		else
			v.Box.Visible = false
			v.BoxOutline.Visible = false
			v.Tool.Visible = false
			v.Armour.Visible = false
			v.Sleeping.Visible = false
			v.ViewAngle.Visible = false
			v.Tracer.Visible = false
		end
	end
end
local SilentTabbox = Tabs.Combat:AddLeftTabbox()
local SilentTab = SilentTabbox:AddTab('silent aim')
local FovTab = SilentTabbox:AddTab('fov circle')

--* Silent Aim *--

SilentTab:AddToggle('SilentAim',{Text='enabled',Default=true}):AddKeyPicker('SilentKey', {Default='MB2',SyncToggleState=true,Mode='Hold',Text='Silent Aim',NoUI=false}):OnChanged(function(Value)
Combat.Settings.SilentEnabled = Value
end)
SilentTab:AddSlider('HitChance', {Text='hit chance:',Default=100,Min=0,Max=100,Rounding=0,Compact=false,Suffix="%"}):OnChanged(function(Value)
Combat.Settings.SilentHitChance = Value
end)
SilentTab:AddSlider('HitChance', {Text='distance:',Default=1000,Min=0,Max=2500,Rounding=0,Compact=false,Suffix=" studs"}):OnChanged(function(Value)
Combat.Settings.RenderDistance = Value
end)
SilentTab:AddToggle('HighlightTarget',{Text='highlight target',Default=false}):AddColorPicker('HighlightTargetColor',{Default=Color3.fromRGB(58, 0, 255),Title='Color'}):OnChanged(function(value)
Esp.Settings.HighlightTarget = value
end)
Options.HighlightTargetColor:OnChanged(function(ValueHighlight)
Esp.Settings.HighlightTargetColor = ValueHighlight
end)
SilentTab:AddToggle('Snapline',{Text='snaplines',Default=false}):AddColorPicker('SnaplineColor',{Default=Color3.fromRGB(58, 0, 255),Title='Color'})
SilentTab:AddToggle('Snapcircles',{Text='snapcircles',Default=false}):AddColorPicker('SnapcirclesColor',{Default=Color3.fromRGB(58, 0, 255),Title='Color'}):OnChanged(function(Value)
Fov.Settings.CircleLine = Value
CircleLine.Visible = Value
end)
Options.SnapcirclesColor:OnChanged(function(Value25)
Fov.Settings.CircleLineColor = Value25
CircleLine.Color = Value25
end)

SilentTab:AddDropdown('SnaplinePosition', {Values = {"Bottom","Middle","Top"},Default = 2,Multi = false,Text = 'position:'}):OnChanged(function(Value)
Fov.Settings.SnaplinePosition = Value
end)
SilentTab:AddToggle('SleeperCheck',{Text='sleeper check',Default=true}):OnChanged(function(Value)
Combat.Settings.SleeperCheck = Value
end)

SilentTab:AddDropdown('SilentHitpart', {Values = {"Head", "HumanoidRootPart", "Torso", "LowerTorso", "RightHand", "LeftHand", "RightFoot", "LeftFoot"}, Default = 1, Multi = false, Text = 'hitpart:'}):OnChanged(function(Value)
Combat.Settings.SilentAimPart = Value
end)

--* Fov Circle *--

FovTab:AddToggle('Fov',{Text='enabled',Default=false}):AddColorPicker('FovColor',{Default=Color3.fromRGB(58, 0, 255),Title='Color'})
FovTab:AddToggle('Dynamic',{Text='dynamic',Default=true})
FovTab:AddToggle('FovHighlight',{Text='highlight',Default=false}):AddColorPicker('FovHighlightColor',{Default=Color3.fromRGB(0, 178, 255),Title='Color'})
FovTab:AddToggle('Filled',{Text='filled',Default=false}):OnChanged(function(Value)
Fov.Settings.FovFilled = Value;FovCircle.Filled = Value
Fov.Settings.FovOutlineFilled = Value;FovCircleOutline.Filled = Value
end)
FovTab:AddSlider('FovSize', {Text='size:',Default=120,Min=5,Max=500,Rounding=0,Compact=false}):OnChanged(function(Value)
Fov.Settings.FovSize = Value;FovCircle.Radius = Value
Fov.Settings.FovOutlineSize = Value;FovCircleOutline.Radius = Value
end)
FovTab:AddSlider('Transparency', {Text='transparency:',Default=1,Min=0,Max=1,Rounding=2,Compact=false,Suffix="%"}):OnChanged(function(Value)
Fov.Settings.FovTransparency = Value;FovCircle.Transparency = Value
end)
FovTab:AddDropdown('FovPosition', {Values = {"To Screen","To Mouse"},Default = 1,Multi = false,Text = 'position:'}):OnChanged(function(Value)
Fov.Settings.FovPosition = Value
Fov.Settings.FovOutlinePosition = Value
end)

game:GetService("RunService").RenderStepped:Connect(function()

if Functions:GetClosest() ~= nil and Toggles.FovHighlight.Value == true then
  local p,t = Functions:GetClosest()
  FovCircle.Color = Fov.Settings.FovColor
  local Position,OnScreen = Camera:WorldToViewportPoint(Functions:GetClosest()[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict());
  if Fov.Settings.FovHighlight == true and Functions:GetClosest().Head.Teamtag.Enabled == false and OnScreen == true then
    FovCircle.Color = Fov.Settings.FovHighlightColor
  else
    FovCircle.Color=Color3.fromRGB(8, 0, 255)
  end
else
  FovCircle.Color = Fov.Settings.FovColor
end
if Functions:GetClosest() ~= nil and Toggles.Snapline.Value == true then
  local p,t = Functions:GetClosest()
  FovSnapline.Visible = true
  CircleLine.Visible = true
  local Position,OnScreen = Camera:WorldToViewportPoint(Functions:GetClosest()[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict());
  if Combat.Settings.TeamCheck == true and Functions:GetClosest().Head.Teamtag.Enabled == false and OnScreen == true then
    FovSnapline.To = Position
    CircleLine.Position = Position
  elseif OnScreen == true then
    FovSnapline.To = Position
    CircleLine.Position = Position
  end
else
  FovSnapline.Visible = false
  CircleLine.Visible = false
end
if Functions:GetClosest() ~= nil and Toggles.Snapcircles.Value == true then
  local p,t = Functions:GetClosest()
  CircleLine.Visible = true
  local Position,OnScreen = Camera:WorldToViewportPoint(Functions:GetClosest()[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict());
  if Combat.Settings.TeamCheck == true and Functions:GetClosest().Head.Teamtag.Enabled == false and OnScreen == true then
    CircleLine.Position = Position
  elseif OnScreen == true then
    CircleLine.Position = Position
  end
else
  CircleLine.Visible = false
end
Fov.Settings.RealFovSize=FovCircle.Radius
Fov.Settings.RealFovOutlineSize=FovCircle.Radius
if Fov.Settings.Dynamic == true then
  local set = Fov.Settings.FovSize * ((Fov.Settings.FovSize-Camera.FieldOfView)/70 + 0.14) + 17.5
  local set2 = Fov.Settings.FovOutlineSize * ((Fov.Settings.FovOutlineSize-Camera.FieldOfView)/70 + 0.14) + 17.5
  FovCircle.Radius = set
  FovCircleOutline.Radius = set
else
  FovCircle.Radius=Fov.Settings.FovSize
  FovCircleOutline.Radius=Fov.Settings.FovOutlineSize
end
if Fov.Settings.FovPosition == "To Screen" then
  FovCircle.Position = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
  FovCircleOutline.Position = Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
else
  local MousePos = Camera.WorldToViewportPoint(Camera,game.Players.LocalPlayer:GetMouse().Hit.p)
  FovCircle.Position = Vector2.new(MousePos.X,MousePos.Y)
  FovCircleOutline.Position = Vector2.new(MousePos.X,MousePos.Y)
end
if Fov.Settings.SnaplinePosition == "Bottom" then
  FovSnapline.From=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y)
elseif Fov.Settings.SnaplinePosition == "Middle" then
  FovSnapline.From=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)
elseif Fov.Settings.SnaplinePosition == "Top" then
  FovSnapline.From=Vector2.new(Camera.ViewportSize.X / 2, 0)
end
end)

--// Fov Switches
Toggles.Dynamic:OnChanged(function(Value)
Fov.Settings.Dynamic = Value
Fov.Settings.OutlineDynamic = Value
end)
Toggles.FovHighlight:OnChanged(function(Value)
Fov.Settings.FovHighlight = Value
end)
Options.FovHighlightColor:OnChanged(function(Value)
Fov.Settings.FovHighlightColor = Value
end)
Toggles.Fov:OnChanged(function(Value)
Fov.Settings.FovEnabled = Value
FovCircle.Visible = Value
Fov.Settings.FovOutlineEnabled = Value
FovCircleOutline.Visible = Value
end)
Options.FovColor:OnChanged(function(Value)
Fov.Settings.FovColor = Value
FovCircle.Color = Value
end)

--// Silent Aim Switches
Toggles.Snapline:OnChanged(function(Value)
Fov.Settings.Snapline = Value
FovSnapline.Visible = Value
end)
Options.SnaplineColor:OnChanged(function(Value)
Fov.Settings.SnaplineColor = Value
FovSnapline.Color=Value
end)

--// Silent Aim
local oldFunctionGun; oldFunctionGun = hookfunction(getupvalues(getrenv()._G.modules.FPS.ToolControllers.RangedWeapon.PlayerFire)[1],function(...)
args = {...}
local Player,PlayerTable = Functions:GetClosest()
if Combat.Settings.SilentEnabled == true and Player ~= nil and (CharcaterMiddle:GetPivot().Position-Player:GetPivot().Position).Magnitude <= Combat.Settings.RenderDistance and math.random(0,100) <= Combat.Settings.SilentHitChance then
if Combat.Settings.TeamCheck == true and Player.Head.Teamtag.Enabled == false then
if Combat.Settings.SleeperCheck == true and PlayerTable.sleeping == false then
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
else
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
end
else
if Combat.Settings.SleeperCheck == true and PlayerTable.sleeping == false then
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
else
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
end
end
end
return oldFunctionGun(unpack(args))
end)

local oldFunction; oldFunction = hookfunction(getupvalues(getrenv()._G.modules.FPS.ToolControllers.BowSpecial.PlayerFire)[4],function(...)
args = {...}
local Player,PlayerTable = Functions:GetClosest()
if Combat.Settings.SilentEnabled == true and Player ~= nil and (CharcaterMiddle:GetPivot().Position-Player:GetPivot().Position).Magnitude <= Combat.Settings.RenderDistance and math.random(0,100) <= Combat.Settings.SilentHitChance then
if Combat.Settings.TeamCheck == true and Player.Head.Teamtag.Enabled == false then
if Combat.Settings.SleeperCheck == true and PlayerTable.sleeping == false then
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
else
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
end
else
if Combat.Settings.SleeperCheck == true and PlayerTable.sleeping == false then
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
else
args[1] = CFrame.lookAt(args[1].Position,Player[Combat.Settings.SilentAimPart]:GetPivot().p+Functions:Predict())
end
end
end
return oldFunction(unpack(args))
end)
--Connections
local PlayerUpdater = game:GetService("RunService").RenderStepped
local PlayerConnection = PlayerUpdater:Connect(function()
	Esp:UpdateEsp()
end)

--Init Functions

for i, v in pairs(getupvalues(getrenv()._G.modules.Player.GetPlayerModel)[1]) do
	if not table.find(cache, v) then
		table.insert(cache, v)
		Esp:CreateEsp(v)
	end
end

game:GetService("Workspace").ChildAdded:Connect(function(child)
	if child:FindFirstChild("HumanoidRootPart") then
		for i, v in pairs(getupvalues(getrenv()._G.modules.Player.GetPlayerModel)[1]) do
			if not table.find(cache, v) then
				Esp:CreateEsp(v)
				table.insert(cache, v)
			end
		end
	end
end)

local PlayerVisualTabbox = Tabs.Visuals:AddLeftTabbox()
local PlayerVisualTab = PlayerVisualTabbox:AddTab("Players")
local PlayerSettingsVisualTab = PlayerVisualTabbox:AddTab("Settings")
local PlayerVisualTabbox = Tabs.Visuals:AddRightTabbox()

PlayerVisualTab:AddToggle("Boxes", { Text = "Boxes", Default = false })
	:AddColorPicker("BoxesColor", { Default = Color3.fromRGB(44, 0, 221), Title = "Color" })
	:AddColorPicker("BoxesOutlineColor", { Default = Color3.fromRGB(0, 0, 0), Title = "Color" })
PlayerVisualTab:AddToggle("Sleeping", { Text = "Sleeping", Default = false })
	:AddColorPicker("SleepingColor", { Default = Color3.fromRGB(44, 0, 221), Title = "Color" })
PlayerVisualTab:AddToggle("Distances", { Text = "Distance", Default = false })
	:AddColorPicker("DistancesColor", { Default = Color3.fromRGB(44, 0, 221), Title = "Color" })
PlayerVisualTab:AddToggle("Armour", { Text = "Armour", Default = false })
	:AddColorPicker("ArmourColor", { Default = Color3.fromRGB(0, 255, 255), Title = "Color" })
PlayerVisualTab:AddToggle("Tool", { Text = "Tool", Default = false })
	:AddColorPicker("ToolColor", { Default = Color3.fromRGB(0, 255, 255), Title = "Color" })
PlayerVisualTab:AddToggle("ViewAngle", { Text = "View Angle", Default = false })
	:AddColorPicker("ViewAngleColor", { Default = Color3.fromRGB(44, 0, 221), Title = "Color" })
PlayerVisualTab:AddToggle("Tracer", { Text = "Tracer", Default = false })
	:AddColorPicker("TracerColor", { Default = Color3.fromRGB(44, 0, 221), Title = "Color" })

--Esp Switches
Toggles.ViewAngle:OnChanged(function(Value)
	Esp.Settings.ViewAngle = Value
end)
Options.ViewAngleColor:OnChanged(function(Value)
	Esp.Settings.ViewAngleColor = Value
end)
Toggles.Tracer:OnChanged(function(Value)
	Esp.Settings.Tracer = Value
end)
Options.TracerColor:OnChanged(function(Value)
	Esp.Settings.TracerColor = Value
end)
Toggles.Armour:OnChanged(function(Value)
	Esp.Settings.Armour = Value
end)
Options.ToolColor:OnChanged(function(Value)
	Esp.Settings.ToolColor = Value
end)
Toggles.Tool:OnChanged(function(Value)
	Esp.Settings.Tool = Value
end)
Options.ArmourColor:OnChanged(function(Value)
	Esp.Settings.ArmourColor = Value
end)
Toggles.Armour:OnChanged(function(Value)
	Esp.Settings.Armour = Value
end)
Toggles.Distances:OnChanged(function(Value)
	Esp.Settings.Distances = Value
end)
Options.DistancesColor:OnChanged(function(Value)
	Esp.Settings.DistanceColor = Value
end)
Options.SleepingColor:OnChanged(function(Value)
	Esp.Settings.SleepingColor = Value
end)
Toggles.Sleeping:OnChanged(function(Value)
	Esp.Settings.Sleeping = Value
end)
Options.BoxesColor:OnChanged(function(Value)
	Esp.Settings.BoxesColor = Value
end)
Options.BoxesOutlineColor:OnChanged(function(Value)
	Esp.Settings.BoxesOutlineColor = Value
end)
Toggles.Boxes:OnChanged(function(Value)
	Esp.Settings.Boxes = Value
end)
PlayerSettingsVisualTab:AddSlider(
	"RenderDistance",
	{ Text = "Render Distance", Default = 1500, Min = 1, Max = 1500, Rounding = 0, Compact = false, Suffix = "s" }
):OnChanged(function(Value)
	Esp.Settings.RenderDistance = Value
end)
PlayerSettingsVisualTab:AddToggle("TargetSleepers", { Text = "Dont Show Sleepers", Default = false })
	:OnChanged(function(Value)
		Esp.Settings.TargetSleepers = Value
	end)
PlayerSettingsVisualTab:AddToggle("BoxesOutlines", { Text = "Box Outlines", Default = false }):OnChanged(function(Value)
	Esp.Settings.BoxesOutline = Value
end)
PlayerSettingsVisualTab:AddToggle("TeamCheck", { Text = "Team Check", Default = false }):OnChanged(function(Value)
	Esp.Settings.TeamCheck = Value
end)
PlayerSettingsVisualTab:AddToggle("TextOutline", { Text = "Text Outlines", Default = false }):OnChanged(function(Value)
	Esp.Settings.TextOutline = Value
end)
PlayerSettingsVisualTab:AddDropdown(
	"TracerPosition",
	{ Values = { "Bottom", "Middle", "Top" }, Default = 1, Multi = false, Text = "Tracer Position" }
):OnChanged(function(Value)
	Esp.Settings.TracerFrom = Value
end)




local SkinChangerTabBox = Tabs.Visuals:AddRightTabbox('skinbox')
local SkinChangerTab = SkinChangerTabBox:AddTab('skinbox')

--* Skinbox *--

local SkinChoice = "Galaxy"
local SkinsEnabled = false

function CheckSkins()
local tbl = {}
for i, v in pairs(game:GetService("ReplicatedStorage").ItemSkins:GetChildren()) do
table.insert(tbl, v.Name)
end
return tbl
end
function SetCammo(SkinName)
if not require(game:GetService("ReplicatedStorage").ItemConfigs[getrenv()._G.modules.FPS.GetEquippedItem().id]).HandModel then
return
end
local GunName = require(game:GetService("ReplicatedStorage").ItemConfigs[getrenv()._G.modules.FPS.GetEquippedItem().id]).HandModel
if table.find(CheckSkins(), GunName) then
local SkinFolder = game:GetService("ReplicatedStorage").ItemSkins[GunName]
local AnimationModule = require(SkinFolder:FindFirstChild("AnimatedSkinPrefab"))
if SkinName == "Lightning" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://6555500992", 1, 0.3)
elseif SkinName == "Galaxy" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://9305457875", 1, 0.3)
elseif SkinName == "Swirl" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://13199296652", 1, 0.3)
elseif SkinName == "Wavey" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://13898657945", 1, 0.3)
elseif SkinName == "RedGalaxy" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://1619172543", 1, 0.3)
elseif SkinName == "Marble" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://8904067198", 1, 0.01)
elseif SkinName == "Lava" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://7077560268", 1, 0.3)
elseif SkinName == "Blackout" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://5847588525", 1, 0.3)
elseif SkinName == "Snake" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://7457460026", 1, 0.3)
elseif SkinName == "Banana" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://338693178", 2, 0.3)
elseif SkinName == "Death" then
AnimationModule.ApplyToModel(workspace.Ignore.FPSArms.HandModel, "rbxassetid://11896030190", 1, 0.3)
end
end
end
game:GetService("Workspace").Ignore.FPSArms.ChildAdded:Connect(function()
if game:GetService("Workspace").Ignore.FPSArms:WaitForChild("HandModel") and SkinsEnabled == true then
SetCammo(SkinChoice)
end
end)

SkinChangerTab:AddToggle('SkinsEnabled', {Text = 'enabled', Default = false}):OnChanged(function(value)
SkinsEnabled = value
end)
SkinChangerTab:AddDropdown('SkinChoice', {Values = {"Lightning", "Galaxy", "Swirl", "Wavey", "RedGalaxy", "Marble", "Lava", "Blackout", "Snake", "Banana", "Death"}, Default = 1, Multi = false, Text = 'custom skins:'}):OnChanged(function(value)
SkinChoice = value
end)


local FieldOfViewTabBox = Tabs.Visuals:AddRightTabbox('field of view')
local FieldOfViewTab = FieldOfViewTabBox:AddTab('field of view')

--* Field Of View *--

local FieldOfViewEnabled = false
local FieldOfViewValue = 70
local CurrentSliderValue3 = 70
game:GetService("RunService").RenderStepped:Connect(function()
local fovFunc = nil
for i,v in pairs(getreg()) do
if type(v) == "function" and getfenv(v).script.Name == "Camera" and #getupvalues(v) >= 18 then
  fovFunc = v
end
end
setupvalue(fovFunc,18,FieldOfViewValue)
end)

FieldOfViewTab:AddToggle('FieldOfView', { Text = 'enabled', Default = false }):AddKeyPicker('fieldofviewkey', { Default = 'Non', SyncToggleState = true, Mode = 'Toggle', Text = 'field of view', NoUI = true }):OnChanged(function(value)
FieldOfViewEnabled = value
if not FieldOfViewEnabled then
FieldOfViewValue = 70
else
FieldOfViewValue = CurrentSliderValue3
end
end)

FieldOfViewTab:AddSlider('FieldOfViewSlider', { Text = 'field of view:', Suffix = "Non", Default = 70, Min = 30, Max = 120, Rounding = 0, Compact = false }):OnChanged(function(sliderValue)
CurrentSliderValue3 = sliderValue
if FieldOfViewEnabled then
FieldOfViewValue = sliderValue
end
end)


local TrashTalkTabBox = Tabs.Misc:AddRightTabbox('trash talk')
local TrashTalkTab = TrashTalkTabBox:AddTab('trash talk')

--* Trash Talk *--

local Trashtalk = true
local Chats = {
["🌚ASTRO.CC🌚"] = {"stop being weird and get 🌚ASTRO.CC🌚"};
}

local _Network = getrenv()._G.modules.Network
local _SendCodes = getrenv()._G.modules.Network.SendCodes
game:GetService("LogService").MessageOut:Connect(function(message)
local extractedName = message:match("->([%w_]+)")
local initialHealth, finalHealth = message:match("(%-?%d+%.?%d*)%D*->(%-?%d+%.?%d*)hp")
local studsValue = message:match("(%d+%.?%d*)s")
if Trashtalk and extractedName and initialHealth and finalHealth and studsValue and extractedName ~= game.Players.LocalPlayer.Name then
if Trashtalk and tonumber(finalHealth) <= 0 then
  _Network.Send(_SendCodes.SEND_CHAT_MESSAGE, extractedName .. " killed from " .. studsValue .. "m, " .. Chats["🌚ASTRO.CC🌚"][math.random(1, #Chats["🌚ASTRO.CC🌚"])] .. " [.gg/🌚ASTRO.CC🌚]", "Global")
end
end
end)

local enabledspamchat = false
local chatSpammerText = ""
local WaitTime = 3
local function spamChat()
local args = {[1] = 27, [2] = chatSpammerText, [3] = "Global"}
while enabledspamchat do
  game:GetService("Players").LocalPlayer.RemoteEvent:FireServer(unpack(args))
  wait(WaitTime)
end
end

TrashTalkTab:AddToggle('Enabled_Toggle1', {Text = 'enabled', Default = false}):OnChanged(function(value)
Trashtalk = value
enabledspamchat = value
end)

TrashTalkTab:AddDropdown('', {Values = { 'None','Trash Talk', 'Chat Spammer' }, Default = 1, Multi = false, Text = 'type:'}):OnChanged(function(bool2)
if bool2 == "None" then
Trashtalk = true
enabledspamchat = false
elseif bool2 == "Trash Talk" then
Trashtalk = false
elseif bool2 == "Chat Spammer" then
spamChat()
end
end)

TrashTalkTab:AddSlider('SpamChatSpeed', {Text = 'speed:',Suffix = "s", Default = 3, Min = 1, Max = 10, Rounding = 0, Compact = false,}):OnChanged(function(SpamChatSpeedValue)
WaitTime = SpamChatSpeedValue
end)

TrashTalkTab:AddInput('ChatSpammer', {Default = "If you cant beat them join them [.gg/🌚ASTRO.CC🌚] on top!", Numeric = false, Finished = true, Text = 'chat spammer:', Placeholder = "Chat Spam Custom Text [HERE]"}):OnChanged(function(value)
chatSpammerText = value
end)

local CustomSkyTabBox = Tabs.Visuals:AddLeftTabbox('lighting')
local CustomSkyTab = CustomSkyTabBox:AddTab('lighting')

--* Lighting *--

local LightingEnabled = nil

CustomSkyTab:AddToggle('AWASZnfh', {Text = "enabled",Default = false,Tooltip = "Enables SkyTab",}):OnChanged(function(EnabledLighting)
LightingEnabled = EnabledLighting
end)

CustomSkyTab:AddToggle('z1AWASZnfh', {Text = "remove shadows",Default = false,Tooltip = "Global Shadows On/Off",}):OnChanged(function(GlobalShadowsToggle)
if LightingEnabled and GlobalShadowsToggle == true then
sethiddenproperty(game:GetService("Lighting"), "GlobalShadows", false)
elseif LightingEnabled and GlobalShadowsToggle == false then
sethiddenproperty(game:GetService("Lighting"), "GlobalShadows", true)
end
end)

CustomSkyTab:AddToggle('51z1AWASZnfh', {Text = "remove fog",Default = false,Tooltip = "Fog On/Off",}):OnChanged(function(RemoveFogToggle)
if LightingEnabled and RemoveFogToggle == true then
sethiddenproperty(game:GetService("Lighting"), "FogStart", math.huge)
elseif LightingEnabled and RemoveFogToggle == false then
sethiddenproperty(game:GetService("Lighting"), "FogStart", 150)
end
end)

CustomSkyTab:AddToggle('5za1z1AWASZnfh', {Text = "remove clouds",Default = false,Tooltip = "Clouds On/Off",}):OnChanged(function(RemoveCloudsToggle)
if LightingEnabled and RemoveCloudsToggle == true then
sethiddenproperty(game:GetService("Workspace").Terrain.Clouds, "Enabled", false)
elseif LightingEnabled and RemoveCloudsToggle == false then
sethiddenproperty(game:GetService("Workspace").Terrain.Clouds, "Enabled", true)
end
end)

CustomSkyTab:AddToggle('Grass', {Text = 'remove grass',Default = false,Tooltip = "Grass On/Off",}):OnChanged(function(GrassRemove)
if LightingEnabled and GrassRemove == true then
sethiddenproperty(game.Workspace.Terrain, "Decoration", false)
elseif LightingEnabled and GrassRemove == false then
sethiddenproperty(game.Workspace.Terrain, "Decoration", true)
end
end)

local GCEN = Color3.fromRGB(95, 100, 49)
local GRCEND = false

CustomSkyTab:AddToggle('CLRG', {Text = 'grass color', Default = true, Tooltip = "Off/On"}):AddColorPicker('ColorGrass', {Default = GCEN, Title = 'Changer Color Grass'})
Toggles.CLRG:OnChanged(function(T)
GRCEND = T
game:GetService("Workspace").Terrain:SetMaterialColor(Enum.Material.Grass, T and GCEN or Color3.fromRGB(95, 100, 49))
end)
Options.ColorGrass:OnChanged(function(Grass1)
if GRCEND then
GCEN = Grass1
game:GetService("Workspace").Terrain:SetMaterialColor(Enum.Material.Grass, Grass1)
end
end)

local CloudsColor = Color3.fromRGB(255, 255, 255)
local EnableCustomColor = false

CustomSkyTab:AddToggle('CLRG1', {Text = 'clouds color', Default = EnableCustomColor, Tooltip = "Off/On"}):AddColorPicker('ColorGrass1', {Default = CloudsColor, Title = 'Change Clouds Color'})
Toggles.CLRG1:OnChanged(function(T)
EnableCustomColor = T
game:GetService("Workspace").Terrain.Clouds.Color = T and CloudsColor or Color3.fromRGB(255, 255, 255)
end)
Options.ColorGrass1:OnChanged(function(NewColor)
if LightingEnabled and EnableCustomColor then
CloudsColor = NewColor
game:GetService("Workspace").Terrain.Clouds.Color = NewColor
end
end)

local Lighting = game:GetService("Lighting")
local ColorCorrection = Lighting:FindFirstChild("ColorCorrection")
if not ColorCorrection then
ColorCorrection = Instance.new("ColorCorrectionEffect")
ColorCorrection.Name = "ColorCorrection"
ColorCorrection.Parent = Lighting
end

CustomSkyTab:AddToggle('CLRG1', {Text = 'ambient', Default = EnableCustomColor, Tooltip = "Off/On"}):AddColorPicker('ColorAmbient1', {Default = Color3.fromRGB(255, 255, 255), Title = 'Change Ambient Color'})
Options.ColorAmbient1:OnChanged(function(NewColor2)
sethiddenproperty(ColorCorrection, "TintColor", NewColor2)
end)

CustomSkyTab:AddSlider('Exposure_sUS', {Text = 'exposure', Suffix = "%", Default = 0, Min = -5, Max = 5, Rounding = 1, Compact = true}):OnChanged(function(ExposureValue)
if LightingEnabled and sethiddenproperty(game:GetService("Lighting"), "ExposureCompensation", ExposureValue) then
end
end)

CustomSkyTab:AddSlider('Saturation_sUS', {Text = 'saturation',Suffix = "%",Default = 0,Min = -5,Max = 5,Rounding = 1,Compact = true}):OnChanged(function(SaturationValue)
if sethiddenproperty(ColorCorrection, "Saturation", SaturationValue) then
end
end)

CustomSkyTab:AddDropdown('World_Technology', {Values = { 'Technology', 'ShadowMap', 'Voxel', 'Compatibility' },Default = 1,Multi = false,Text = 'technology:',Tooltip = 'Game Technology',}):OnChanged(function(GPHZ)
if LightingEnabled and GPHZ == "Technology" then
sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Future)
elseif LightingEnabled and GPHZ == "ShadowMap" then
sethiddenproperty(game.Lighting, "Technology", Enum.Technology.ShadowMap)
elseif LightingEnabled and GPHZ == "Voxel" then
sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Voxel)
elseif LightingEnabled and GPHZ == "Compatibility" then
sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Compatibility)
end
end)

local Sky = Instance.new("Sky",game:GetService("Lighting"))
CustomSkyTab:AddDropdown('World_Skybox', {Values = { 'Default', 'Neptune', 'Among Us', 'Nebula', 'Vaporwave', 'Clouds', 'Twilight', 'DaBaby', 'Minecraft', 'Chill', 'Redshift', 'Blue Stars', 'Blue Aurora' },Default = 1,Multi = false,Text = 'custom skybox:',Tooltip = 'Sky Changer',}):OnChanged(function(World_Skybox)
if LightingEnabled and lighting:FindFirstChild("Sky") then
lighting.Sky.SkyboxBk = skybox_assets[World_Skybox].SkyboxBk
lighting.Sky.SkyboxDn = skybox_assets[World_Skybox].SkyboxDn
lighting.Sky.SkyboxFt = skybox_assets[World_Skybox].SkyboxFt
lighting.Sky.SkyboxLf = skybox_assets[World_Skybox].SkyboxLf
lighting.Sky.SkyboxRt = skybox_assets[World_Skybox].SkyboxRt
lighting.Sky.SkyboxUp = skybox_assets[World_Skybox].SkyboxUp
end
end)



--// LOCAL \\--
local RightGroupBox = Tabs.Credits:AddRightGroupbox('MADE BY')
RightGroupBox:AddLabel('👑ASTRO👑')


local RightGroupBox = Tabs.Credits:AddLeftGroupbox('CREDIT')
RightGroupBox:AddLabel('👑ELION👑')

local RightGroupBox = Tabs.Credits:AddLeftGroupbox('BEST SCRIPTER')
RightGroupBox:AddLabel('👑ASTRO👑')




local RightGroupBox = Tabs.Credits:AddRightGroupbox('ASTRO DISCORD')
RightGroupBox:AddLabel('https://discord.gg/Cd6mQpHsBA')

--// MISC \\--
local RightGroupBox = Tabs.Misc:AddRightGroupbox('FREE CAM')
RightGroupBox:AddLabel('B = FREE CAM')
loadstring(game:HttpGet("https://pastebin.com/raw/9x5YxWXV", true))();


local TabBox = Tabs.Combat:AddRightTabbox()
local MiscTab = TabBox:AddTab('MODS')






MiscTab:AddToggle('', {Text = "Jump Crouch",Default = false,}):AddKeyPicker('JumpCrouchKey', {Default='Non',SyncToggleState=true,Mode='Toggle',Text='Jump Crouch',NoUI=false})
local stoprun = false
task.spawn(function()
while true do
  local state = Options.JumpCrouchKey:GetState()
  if state then
    keypress(0x57)
    keypress(0x10)
    wait(0.05)
    keypress(0x43)
    keypress(0x20)
    keyrelease(0x20)
    wait(0.5)
    keyrelease(0x43)
    wait(1)
  end
  if Library.Unloaded then break end
  wait()
end
end)
task.spawn(function()
while task.wait() do
  local state = Options.JumpCrouchKey:GetState()
  if not state then
    if stoprun then
      keyrelease(0x57)
      keyrelease(0x10)
      stoprun = false
    end
  else
    stoprun = true
  end
end
end)

MiscTab:AddToggle('LootAll',{Text='Loot All',Default=false}):AddKeyPicker('LootAllKey', {Default='Non',SyncToggleState=true,Mode='Toggle',Text='Loot All',NoUI=false})

Toggles.LootAll:OnChanged(function()
  for i = 1, 20 do
      game:GetService("Players").LocalPlayer.RemoteEvent:FireServer(12, i, true)
  end
end)

local XRAY22 = false
MiscTab:AddToggle('XRAY', {Text = 'XRAY', Default = false}):AddKeyPicker('XRAYKey', {Default='Non',SyncToggleState=true,Mode='Toggle',Text='XRAY',NoUI=false}):OnChanged(function()
    XRAY22 = Toggles.XRAY.Value
    if XRAY22 then
        for i,v in pairs(game:GetDescendants()) do
            if v:FindFirstChild("Hitbox") then
                v.Hitbox.Transparency = 0.6
            end
        end
    else
        for i,v in pairs(game:GetDescendants()) do
            if v:FindFirstChild("Hitbox") then
                v.Hitbox.Transparency = 0
            end
        end
    end
end)
MiscTab:AddLabel('deposit all'):AddKeyPicker('gazkb', { Default = 'Non', SyncToggleState = false, Mode = 'Toggle', Text = 'deposit all', NoUI = true })
Options.gazkb:OnClick(function()
for i = 1, 20 do
wait(0.03)
local ohNumber1 = 12
local ohNumber2 = i
local ohBoolean3 = false
game:GetService("Players").LocalPlayer.RemoteEvent:FireServer(ohNumber1, ohNumber2, ohBoolean3)
end
end)


local NoSlowDown = false
local old = getrenv()._G.modules.Character.SetSprintBlocked
ExploitsTab:AddToggle('NOSLOWDOWN',{Text='no slowdown',Default=false}):OnChanged(function(Value)
NoSlowDown = Value
getrenv()._G.modules.Character.SetSprintBlocked = function(...)
local args = {...}
if NoSlowDown then
  args[1] = false
  return old(unpack(args))
end
return old(...)
end
end)

local Misc = {
Settings = {
  JumpShoot = false,
  NoADS = false,
}
}

ExploitsTab:AddToggle('JumpShoot',{Text='jump shoot',Default=false}):OnChanged(function(Value)
Misc.Settings.JumpShoot = Value
end)
local oldIsGrounded;oldIsGrounded = hookfunction(getrenv()._G.modules.Character.IsGrounded,function(...)
if Misc.Settings.JumpShoot == true then
return true
else
return oldIsGrounded(...)
end
end)

ExploitsTab:AddToggle('NoADS',{Text='no ads',Default=false}):OnChanged(function(Value)
Misc.Settings.NoADS = Value
end)
local oldNoADS;oldNoADS = hookfunction(getrenv()._G.modules.Camera.SetVMAimingOffset,function(...)
if Misc.Settings.NoADS == true then
return true
else
return oldNoADS(...)
end
end)

local NoSway = false
ExploitsTab:AddToggle('NoSway',{Text='no sway',Default=false}):OnChanged(function(Value)
NoSway = Value
end)
local NoSwayHook;NoSwayHook = hookfunction(getrenv()._G.modules.Camera.SetSwaySpeed,function(...)
local args = {...}
if NoSway == true then
args[1] = 0
return NoSwayHook(unpack(args))
end
return NoSwayHook(...)
end)

ExploitsTab:AddToggle('NoReloadAnimation',{Text='no reload animation',Default=false}):OnChanged(function(Value)
gunMods.noReloadanimTog = Value
end)
local reloadDuringShoot;reloadDuringShoot = hookfunction(getupvalues(getrenv()._G.modules.FPS.ToolControllers.RangedWeapon.PlayerFire)[1],function(...)
local arg = {...}
if gunMods.noReloadanimTog == true then
arg[2]['ReloadTime'] = 0
return reloadDuringShoot(unpack(arg))
end
return reloadDuringShoot(...)
end)

ExploitsTab:AddToggle('ArrowGun', {Text = 'arrow gun',Default = false}):OnChanged(function(ArrowValue)
for I, V in pairs(getgc(true)) do
if type(V) == "table" and rawget(V, "TracerPart") then
  if ArrowValue == true then
    V.TracerPart = "Arrow"
  elseif ArrowValue == false then
    V.TracerPart = "Bullet"
  end
end
end
end)


local deleteWallsEnabled = false
ExploitsTab:AddToggle('', {Text = "delete walls",Default = false,Tooltip = "Left Click / Mouse Button 2 (MB2)",}):AddKeyPicker('', {Default='MB2',SyncToggleState=true,Mode='Toggle',Text='Delete Walls',NoUI=true}):OnChanged(function(value)
deleteWallsEnabled = value
end)

local Mouse = game.Players.LocalPlayer:GetMouse()
Mouse.Button1Down:connect(function()
if deleteWallsEnabled then
if not Mouse.Target then
  return
end
local targetName = Mouse.Target.Name
local allowedNames = {"Hitbox", "LeftWall", "RightWall", "LeftHinge", "Prim", "RightHinge"}
for _, name in ipairs(allowedNames) do
  if targetName == name then
    Mouse.Target:Destroy()
    break
  end
end
end
end)



local SpinbotTabBox = Tabs.Combat:AddRightTabbox('spinbot')
local SpinbotTab = SpinbotTabBox:AddTab('spinbot')

--* Spinbot *--

local fakeduck = false
local Spinbot = false
local SpinbotSpeed = 3
local SpinbotType = "Normal"
local value = 1
local SpinBotLM = false
local SpinBotV = false
SpinbotTab:AddToggle('Spinbot',{Text='enabled',Default=false}):OnChanged(function(Value)
Spinbot = Value
end)

SpinbotTab:AddSlider('SpinbotSpeed', {Text='speed:',Default=3,Min=1,Max=3,Rounding=0,Compact=false,Thickness = 3}):OnChanged(function(Value)
SpinbotSpeed = Value
end)

SpinbotTab:AddDropdown('SpinbotType', {Values = {"Normal", "Desync", "Random"},Default = 1,Multi = false,Text = 'type:'}):OnChanged(function(Value)
SpinbotType = Value
end)

local OldSpinHook
OldSpinHook = hookfunction(game.Players.LocalPlayer:FindFirstChild("RemoteEvent").FireServer, function(self, ...)
local args = {...}
if args[1] and args[2] and args[1] == 1 and typeof(args[2]) == "Vector3" and args[4] and Spinbot == true then
  if SpinBotLM == true and SpinbotType == "Desync" then
    args[4] = value
    value = value + SpinbotSpeed
  elseif SpinbotType == "Normal" or SpinBotLM == false then
    args[4] = value
    value = value - SpinbotSpeed
  end
end
if args[1] and args[2] and args[1] == 1 and typeof(args[2]) == "Vector3" and args[4] and Spinbot == true then
  if SpinBotV == true and SpinbotType == "Desync" then
    args[3] = 1.5000001192092896
  elseif SpinbotType == "Normal" or SpinBotV == false then
    args[3] = -1.5000001192092896
  elseif SpinbotType == "Random" or SpinBotV == false then
    args[3] = -1.5000001192092896
  end
end
return OldSpinHook(self, unpack(args))
end)
task.spawn(function()
while task.wait() do
  if SpinbotType == "Desync" then
    SpinBotV = not SpinBotV
  end
end
end)
task.spawn(function()
while task.wait(0.1) do
  if SpinbotType == "Desync" or SpinbotType == "Random" then
    SpinBotLM = not SpinBotLM
  end
end
end)

SpinbotTab:AddToggle('FakeCrouch', {Text = 'fake duck',Default = false,Tooltip = 'Makes u crouch for other people also they cant hear your footsteps'})
local OldCrouchHook; OldCrouchHook = hookfunction(game:GetService("Players").LocalPlayer:FindFirstChild("RemoteEvent").FireServer, function(self, ...)
local args = {...}
if args[1] == 2 and fakeduck == true then
  args[2] = true
end
return OldCrouchHook(self, unpack(args))
end)
Toggles.FakeCrouch:OnChanged(function() fakeduck = Toggles.FakeCrouch.Value end)
local function onFakeLagToggled(value)
  local networkClient = game:GetService("NetworkClient")
  networkClient:SetOutgoingKBPSLimit(value and 1 or 100)
end
SpinbotTab:AddToggle('FakeLag', {Text = 'fake lag', Default = false}):OnChanged(onFakeLagToggled)











--// CREDITS \\--




Library:SetWatermarkVisibility(true)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;

local WatermarkConnection = game:GetService('RunService').RenderStepped:Connect(function()
    FrameCounter += 1;

    if (tick() - FrameTimer) >= 1 then
        FPS = FrameCounter;
        FrameTimer = tick();
        FrameCounter = 0;
    end;

    Library:SetWatermark(("🌚ASTRO.CC🌚 | Build: PAID | Game: Trident Survival"):format(
        math.floor(FPS),
        math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue())
    ));
end);

Library.KeybindFrame.Visible = true;

Library:OnUnload(function()
    WatermarkConnection:Disconnect()

    print('Unloaded!')
    Library.Unloaded = true
end)

local MenuGroup = Tabs['UI Settings']:AddRightGroupbox('Menu')

MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddButton("Rejoin Server", function()
    Library:Notify("Rejoining", 30)
    wait(1)
    local ts = game:GetService("TeleportService")
    local p = game:GetService("Players").LocalPlayer
    ts:Teleport(game.PlaceId, p)
end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'K', NoUI = true, Text = 'Menu keybind' })
MenuGroup:AddDivider()
local playerCountLabel = MenuGroup:AddLabel("Player Count: 0", nil, true)
local function updatePlayerCount()
local playerCount = #game:GetService("Players"):GetPlayers()
playerCountLabel:SetText("Players Online : " .. playerCount)
end
game:GetService("Players").PlayerAdded:Connect(updatePlayerCount)
game:GetService("Players").PlayerRemoving:Connect(updatePlayerCount)
updatePlayerCount()
MenuGroup:AddDivider()
MenuGroup:AddLabel('Credits', true)
MenuGroup:AddLabel('Made by 🌚ASTRO🌚', true)
Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({ 'MenuKeybind' })

ThemeManager:SetFolder('🌚ASTRO.CC🌚')
SaveManager:SetFolder('🌚ASTRO.CC🌚/TRIDENT SURVIVAL')

SaveManager:BuildConfigSection(Tabs['UI Settings'])

ThemeManager:ApplyToTab(Tabs['UI Settings'])

SaveManager:LoadAutoloadConfig()
wait(0)Library:Notify("Thanks for using 🌚ASTRO.CC🌚")
wait(0)Library:Notify("Status : 🟢Undetected")