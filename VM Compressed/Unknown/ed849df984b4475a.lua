-- Notification
game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "Animation Hub",
    Text = "Loading...",
    Icon = "rbxassetid://109007998705186",
    Duration = 15
})

local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.10615778, 0, 0.16217947, 0)
ImageButton.Size = UDim2.new(0, 40, 0, 40)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=109007998705186"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "TikTok @mercir.28",
    SubTitle = "Animation Hub",
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})
local Tabs = {
        Main1=Window:AddTab({ Title="Reanimation" }),
        Main2=Window:AddTab({ Title="Animations" }),
        Main3=Window:AddTab({ Title="Anim & Reanim" }),
        Main4=Window:AddTab({ Title="R15 Animations" }),
        Main5=Window:AddTab({ Title="Keyboard script" }),
        Main6=Window:AddTab({ Title="Info" }),
}
    Tabs.Main1:AddButton({
    Title="Giant Fix Cut Parts",
    Description="",
    Callback=function()
	  _G.HideCharacter = true
_G.FlingEnabled = true 
_G.TransparentRig = true 
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true-- Enable or disable custom rig feature (basically old oxide when false)
_G.Scale = 3.5
_G.CH = {
    Torso = {
        Name= "Accessory (Torso)",
        TextureId = "83269599235494",
        Orientation= CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },
    RightArm = {
        Name= "Accessory (RArm)",
        TextureId = "103757531289975", 
         Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    LeftArm = {
        Name= "Accessory (LArm)",
        TextureId = "103757531289975", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    RightLeg = {
        Name= "Accessory (RLeg)",
        TextureId = "83269599235494", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    LeftLeg = {
        Name= "Accessory (LLeg)",
        TextureId = "83269599235494", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    Head = {
        Name = "Accessory (big head)", -- CHANGE THIS TO WHATEVER BIG HEAD U USE
        Orientation = CFrame.new(),
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
  end
})

    Tabs.Main1:AddButton({
    Title="Giant Fix Cut Parts(DONT TOUCH!!!)",
    Description="",
    Callback=function()
	  _G.HideCharacter = true
_G.FlingEnabled = true 
_G.TransparentRig = true 
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true-- Enable or disable custom rig feature (basically old oxide when false)
_G.Scale = 3.8
_G.CH = {
    Torso = {
        Name= "Accessory (Torso)",
        TextureId = "83269599235494",
        Orientation= CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },
    RightArm = {
        Name= "Accessory (RArm)",
        TextureId = "103757531289975", 
         Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    LeftArm = {
        Name= "Accessory (LArm)",
        TextureId = "103757531289975", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    RightLeg = {
        Name= "Accessory (RLeg)",
        TextureId = "83269599235494", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    LeftLeg = {
        Name= "Accessory (LLeg)",
        TextureId = "83269599235494", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
    },
    Head = {
        Name = "Accessory (big head)", -- CHANGE THIS TO WHATEVER BIG HEAD U USE
        Orientation = CFrame.new(),
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
  end
})

Tabs.Main1:AddButton({
    Title="Oxide Reanimation",
    Description="",
    Callback=function()
	  getgenv().options = { -- SCRIPT OPTIONS
    RagdollGravity = 196.2 -- change to any number above 0 (196.2 is default grav)
}
_G.HideCharacter = true
_G.FlingEnabled = true
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = false -- Enable or disable custom rig feature (basically old oxide when false)
_G.CH = {
    Torso = {
        Name= "Black",
        TextureId = "14251599953",
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
    },

    LeftArm = {
        Name= "Accessory (LARM)",
        TextureId = "17374768001", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightArm = {
        Name= "Accessory (RARM)",
        TextureId = "17374768001", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    LeftLeg = {
        Name= "Accessory (LLeg)",
        TextureId = "17387586304", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    },

    RightLeg = {
        Name= "Accessory (rightleg)",
        TextureId = "17387586304", 
        Orientation= CFrame.Angles(math.rad(0),math.rad(0),math.rad(90))
    }
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
  end
})

Tabs.Main1:AddButton({
    Title="CurrentAngelV2",
    Description="",
    Callback=function()
	  -- https://scriptblox.com/script/Universal-Script-CurrentAngle-V2-Full-axis-reanimate-43351

--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz
if not game.IsLoaded then
	game.Loaded:Wait()
end

--// Check configdoc.md for settings documentation (CHECK THE DESCRIPTION OF THIS POST)

--// Below are the settings
-- SETTINGS --
local settings = _G

settings["Use default animations"] = true
settings["Fake character transparency level"] = 1
settings["Disable character scripts"] = true
settings["Fake character should collide"] = true
settings["Parent real character to fake character"] = false
settings["Respawn character"] = true
settings["Instant respawn"] = false
settings["Hide HumanoidRootPart"] = false
settings["PermaDeath fake character"] = true
settings["R15 Reanimate"] = false
settings["Click Fling"] = false
settings["Anti-Fling"] = true
settings["Hide RootPart Distance"] = CFrame.new(255, 255, 0)

settings["Names to exclude from transparency"] = {
    --[[ example:
    ["HumanoidRootPart"] = true,
    ["Left Arm"] = true
    ]]
}
--// Settings end

loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/v4.lua"))()
  end
})

Tabs.Main2:AddButton({
    Title="Fixed Krystal Dance V3",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3"))()
  end
})

Tabs.Main2:AddButton({
    Title="Krystal Dance Modded",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Choose.lua"))()
  end
})

Tabs.Main2:AddButton({
    Title="Epik Dancezzz",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Scripts/refs/heads/main/Epik%20R6%20Dancezz.lua"))()
  end
})

Tabs.Main2:AddButton({
    Title="Fix R6 Animation",
    Description="Click On Fly Then Unfly",
    Callback=function()
	  loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-fly-v3-44404"))()
  end
})

Tabs.Main3:AddButton({
    Title="Noli Forsaken",
    Description="YouTube @im_Patrick",
    Callback=function()
      -- Remember to make the script work you don't need to wear all the accessories (the script can still run even with less required rig accessories)
-- // skill :
-- stab - will fling the player you are targeting (if you have tools in your inventory) and will start the kill animation if there is a player
-- void rush - increases the duration of the rush if you hold the keybind, and will immediately stop if you hit a player and the player will getting flinged and also your character start the kill animation
-- nova - Your character will throw a void star in the direction the camera is looking and if the player is hit by the void star that is thrown, the player will be flinged
-- observant - All players will be highlighted and you can click on the highlighted player to teleport to that player.

-- make sure you wear accessories that will be used as a substitute for your body or (you know what will happen)
-- rigs/accessories are in this game: https://www.roblox.com/games/136733829568616/unknown-road-places
-- make sure you subscribe @Im_Patrick i made a script and share it for free
-- fling tool and kill animation is only for player not dummy/npc
-- so when the accessories is fall/gone the script will try to re claim it by respawning and the hat will back, make sure you're not lagging
-- when you press the green button wait until the script is completely loaded (like the gui and abilities should appear)
-- check if your executor has replicatesignal function 
-- if you are on game called "just/ a baseplate" you should type "-pd" before run the script because the game is not type of these script (it' for 2021 script)
-- jab command list if you are inside of that game : https://raw.githubusercontent.com/randomstring0/jab/refs/heads/main/cmdlist.txt

--reanimate : empyrean by emper
-- and also i forgot one credit

-- how to wear multiple hats : https://www.youtube.com/results?search_query=how+to+wear+multiple+hats+on+mobile+kiwi+browser
-- check console if it show something like clown and didnt show any gui it's probbaly not supported

--// tool fling method was set to default (required any tools from inventory/backpack or you will don't have fling and make sure the tools has collision)

-- // changelog :
-- fixed predictionfling not working
-- fixed observant makes character stuck when duration is over and player doesn't select any player

--// the code below is the core script and adjustment/config for the script, keep it together

_G.Config = {
    ["HatCollide"]     = false, -- Collision hats
    ["ReClaim"]        = true,  -- Re Claim falling hats
    ["Fling"]          = true,  -- Activate character flinging
    ["HideCharacter"]  = true,  -- hide your character to void

    ["FlingOption"] = {
        ["HatFling"]        = false, -- Use hats to fling
        ["Highlight"]       = false,  -- Glow targets
        ["PredictionFling"] = false,  -- predict fling (so basicly fling people with body)
        ["ToolFling"]       = true  -- use Tool from inventory/backpack to fling (don't equip any tools when the script run)
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/qwertys/refs/heads/main/qwerty0.lua"))()
  end
})

Tabs.Main3:AddButton({
    Title="CoolKid Forsaken",
    Description="YouTube @im_Patrick",
    Callback=function()
      -- Remember to make the script work you don't need to wear all the accessories (the script can still run even with less required rig accessories)
-- // skill :
-- punch - does a basic punch and will play kill animation when you hit a player using this skill
-- walkspeed override -  performs a long lunge forward, if your character hit player this skill will stopped and character will start playing kill animation
-- corrupt nature - launches a projectile that goes through walls and player, if player is hit by the projectile, they will be flinged
-- pizza delivery - this skill will reveal player aura to character 

-- make sure you wear accessories that will be used as a substitute for your body or (you know what will happen)
-- rigs/accessories are in this game: https://www.roblox.com/games/136733829568616/unknown-road-places
-- make sure you subscribe @Im_Patrick i made a script and share it for free
-- so when the accessories is fall/gone the script will try to re claim it by respawning and the hat will back, make sure you're not lagging
-- when you press the green button wait until the script is completely loaded (like the gui and abilities should appear)
-- check if your executor has replicatesignal function 

-- if you are on game called "just/ a baseplate." you should type "-pd" before run the script because the game is not type of these script (it' for 2021 script)
-- jab command list if you are inside of that game : https://raw.githubusercontent.com/randomstring0/jab/refs/heads/main/cmdlist.txt

-- reanimate : empyrean by emper
-- and also i forgot one credit

-- how to wear multiple hats : https://www.youtube.com/results?search_query=how+to+wear+multiple+hats+on+mobile+kiwi+browser
-- check console if it show something like clown and didnt show any gui it's probbaly not supported

--// predictionfling method was set to default (will re-spawn every flinging)

-- Sometimes accessories used can fall (disappear into the void) due to loss of network ownership.

-- // changelog :
-- nothing

--// the code below is the core script and adjustment/config for the script, keep it together

_G.Config = {
    ["HatCollide"]     = false, -- Collision hats
    ["ReClaim"]        = true,  -- Re Claim falling hats
    ["Fling"]          = false,  -- Activate character flinging
    ["HideCharacter"]  = true,  -- hide your character to void

    ["FlingOption"] = {
        ["HatFling"]        = false, -- Use hats to fling
        ["Highlight"]       = true,  -- Glow targets
        ["PredictionFling"] = false,  -- predict fling (so basicly fling people with body)
        ["ToolFling"]       = false  -- use Tool from inventory/backpack to fling (don't equip any tools when the script run)
    }
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/qwertys/refs/heads/main/qwerty2.lua"))()
  end
})

Tabs.Main3:AddButton({
    Title="Fe VR",
    Description="YouTube @im_Patrick",
    Callback=function()
      control = "mobile" -- pc / mobile
--[[
please read the texts below,
I really feel annoyed with comments like "I always die and then respawn" and "can you make it use free hats" 
even though everything has been explained in the explanation below this text


testing game : https://www.roblox.com/games/136733829568616/unknown-road-places
choice

-- // white arm paid rigs for arm// --

--
--

-- // noob paid rigs for arm // --

https://www.roblox.com/catalog/84451219120140/Left-Noob-Arm
https://www.roblox.com/catalog/72292903231768/Right-Noob-Arm


--// free hats rig for arm // --

https://www.roblox.com/catalog/3398308134
https://www.roblox.com/catalog/3443038622

This script will check if the executor you are using has a replicatesignal
if the executor has a replicatesignal the script will have a permanentdeath function and support in many games such as brookhaven and almost any games
and if it does not have a replicatesignal the script will automatically use the respawn loop method


// can you make it without hats? for universal
answer : no

// does this include free hats?
answer : yes 

// does this script work for universal game?
answer : yes

// why my arm gone?
answer : I'm guessing you're not wearing the hats I've linked above or maybe the hats fall

// why the script not working / keep crashing ?
answer : There are several possibilities why the script doesn't work, the first = the executor you are using is probably not supported, the second possibility = you copied the script incorrectly (you can copy all the text in this link https://github.com/randomstring0/Qwerty/edit/main/qwerty46.lua), and the third possibility = you spammed the script

// how to wear 2 hats paid hats version?
you only need a chrome extension like BTRoblox

// how to wear 2 hats paid hats version on mobile?
answer : The method is the same as above, only you need an additional application that can be used to download extensions, such as an application called "Kiwi Browser".


> reanimation using Empyrean by emper
]]


loadstring(game:HttpGet("https://raw.githubusercontent.com/randomstring0/Qwerty/refs/heads/main/qwerty45.lua"))()
  end
})

Tabs.Main3:AddButton({
    Title="Fe HackLord",
    Description="Discord ENJBafSA",
    Callback=function()
      --[[
 FE Hacklord (omg it's the guy from forsaken!!!)
 
 https://discord.gg/bjTxKxjJVc
 Join 24-HOURS for more scripts (in the future)
]]--

--Settings
ScriptSettings = {
 LegacyMode = false, --Set to true if you want to use the old version
 InstaKill = false, --If you want to fling people quickly, set this to true
 Finisher = true, --Play finisher animation
 Introduction = true,  --Play intro animation
 MuteSongs = false, --self-explanatory
 VisibleHitbox = true; --self-explanatory
 Hitmarker = true; --Shows damage dealt
 HitSoundId = "rbxassetid://1129547534" --Custom hit sound
}

--Loadstring
loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/Hacklord.luau"))()
  end
})

Tabs.Main3:AddButton({
    Title="Fe Star Glitcher",
    Description="Discord ENJBafSA",
    Callback=function()
      --[[
 FE Star Glitcher (Public Test)
 
 https://discord.gg/bjTxKxjJVc
 Join 24-HOURS for more scripts (in the future)
]]--

loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/Discontinued_StarGlitcher.luau"))()
  end
})

Tabs.Main4:AddButton({
    Title="Sonic EXE",
    Description="r15",
    Callback=function()
      loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-R15-Sonic-exe-63788"))()
  end
})

Tabs.Main4:AddButton({
    Title="Sonic",
    Description="r15",
    Callback=function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Azizanzz0/FE-R15-Sonic-X-Super/refs/heads/main/Protected%20SonicXSuper.txt"))()
  end
})

Tabs.Main5:AddButton({
    Title="Keyboard Crack Version",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
  end
})

Tabs.Main6:AddButton({
    Title="Author",
    Description="TikTok @mercir.28",
    Callback=function()
      print("mercir.28")
  end
})

Tabs.Main6:AddButton({
    Title="My Friend",
    Description="TikTok @zuzyavklane",
    Callback=function()
      print("zuzyavklane")
  end
})

Tabs.Main6:AddButton({
    Title="Pupsik/Любимчик",
    Description="TikTok @brokenspawn1020",
    Callback=function()
      print("brokenspawn1020")
  end
})
