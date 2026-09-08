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
ImageButton.Image = "http://www.roblox.com/asset/?id=112894970187889"

UICorner.CornerRadius = UDim.new(1, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
repeat wait() until game:IsLoaded()
local Window = Fluent:CreateWindow({
    Title = "Mrdenar Hub Premium Free",
    SubTitle = "Roblox",
    TabWidth = 157,
    Size = UDim2.fromOffset(450, 300),
    Acrylic = true,
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})
local Tabs = {
        Main1=Window:AddTab({ Title="Script" }),
        Main2=Window:AddTab({ Title="Script Troll" }),
        Main3=Window:AddTab({ Title="Script keyboard" }),
}
    Tabs.Main1:AddButton({
    Title="Giant Fix Reset",
    Description="",
    Callback=function()
	  _G.HideCharacter = true
_G.FlingEnabled = true 
_G.TransparentRig = true 
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true-- Enable or disable custom rig feature (basically old oxide when false)
_G.Scale = 4.2
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
    Title="Oxide Reanimation R6",
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

Tabs.Main1:AddButton({
    Title="Fixed Krystal Dance V3",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/KDV3-Fixed/refs/heads/main/KrystalDance3"))()
  end
})

Tabs.Main1:AddButton({
    Title="Krystal Dance V3 Modde",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Solary-3/Scripts/refs/heads/main/Choose.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Epik Dance",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Scripts/refs/heads/main/Epik%20R6%20Dancezz.lua"))()
  end
})

Tabs.Main1:AddButton({
    Title="Fix Animation R6 AND Fly Gui",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-fly-v3-44404"))()
  end
})

Tabs.Main2:AddButton({
    Title="Ragdoll",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-testingtrashcode-46515"))()
  end
})

Tabs.Main2:AddButton({
    Title="Zee Hub",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Zee-Hub-v5-38317"))()
  end
})

Tabs.Main2:AddButton({
    Title="Wally West",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Wally-West-Roblox-51462"))()
  end
})

Tabs.Main3:AddButton({
    Title="Keybord Delta X",
    Description="",
    Callback=function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
  end
})