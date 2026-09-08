--[[
this is my last script:/
i quit roblox programmer:(
Now I want to switch to making my animations and my own games in UE5 (Unreal Engine 5)
bye yall!
]]

local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3", HidePremium = false, SaveConfig = false, ConfigFolder = "TurtleFi"})
local workspace = game:GetService("Workspace")

local EggHandler = {}
local houseList = {
   "Starter Shack",
   "Tiny House",
   "Wizard Shack",
   "Blacksmith",
   "Stone House",
   "Tall House",
   "Cute House",
   "Modern House",
   "High Tech House",
   "Modern Mansion"
}

local function NumberHandler(str)
   return str:gsub("Starter Shack","1"):gsub("Tiny House","2"):gsub("Wizard Shack","3"):gsub("Blacksmith","4"):gsub("Stone House","5"):gsub("Tall House","6"):gsub("Cute House","7"):gsub("Modern House","8"):gsub("High Tech House","9"):gsub("Modern Mansion","10")
end

OrionLib:AddTable(workspace["GameObjects"]["Eggs"],EggHandler)

local T1 = Window:MakeTab({
   Name = "Main",
   Icon = "rbxassetid://",
   PremiumOnly = false
})

local T2 = Window:MakeTab({
   Name = "Spin",
   Icon = "rbxassetid://",
   PremiumOnly = false
})

local T3 = Window:MakeTab({
   Name = "Egg",
   Icon = "rbxassetid://",
   PremiumOnly = false
})

local T4 = Window:MakeTab({
   Name = "Build",
   Icon = "rbxassetid://",
   PremiumOnly = false
})

T1:AddToggle({
   Name = "Auto Click",
   Default = false,
   Callback = function(Value)
      _G.Build = Value
      while wait() do
        if _G.Build == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
        game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["ClickService"]["RF"]["Click"]:InvokeServer()
      end
   end    
})

T1:AddToggle({
   Name = "Auto Collect Dirt",
   Default = false,
   Callback = function(Value)
      _G.d = Value
      while wait() do
        if _G.d == false then break end
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["PlotService"]["RE"]["DestroyedBlock"]:FireServer("Dirt")
      end
   end    
})

T1:AddToggle({
   Name = "Auto Claim Reward",
   Default = false,
   Callback = function(Value)
      _G.cr = Value
      while wait() do
        if _G.cr == false then break end
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(1)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(2)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(3)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(4)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(5)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(6)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(7)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(8)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(9)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(10)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(11)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RewardService"]["RF"]["Claim"]:InvokeServer(12)
      end
   end    
})

T1:AddToggle({
   Name = "Auto Rebirth",
   Default = false,
   Callback = function(Value)
      _G.rb = Value
      while wait() do
        if _G.rb == false then break end
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["RebirthService"]["RF"]["SimpleRebirth"]:InvokeServer()
      end
   end    
})

T1:AddButton({
Name = "End Tutorial",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["TutorialService"]["RF"]["TutorialCompleted"]:InvokeServer()
  end    
})

T2:AddDropdown({
   Name = "Select spin",
   Default = "Normal",
   Options = {"Normal","Epic"},
   Callback = function(Value)
     _G._spin_type = Value
  end    
})

T2:AddToggle({
   Name = "Auto Spin",
   Default = false,
   Callback = function(Value)
      _G.as = Value
      while wait() do
        if _G.as == false then break end
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["SpinService"]["RF"]["Spin"]:InvokeServer(_G._spin_type,false)
      end
   end    
})

T3:AddDropdown({
   Name = "Select egg",
   Default = EggHandler[1],
   Options = EggHandler,
   Callback = function(Value)
     _G._egg_type = Value
  end    
})

T3:AddToggle({
   Name = "Auto Hatch",
   Default = false,
   Callback = function(Value)
      _G.ah = Value
      while wait() do
        if _G.ah == false then break end
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["EggOpeningService"]["RF"]["Hatch"]:InvokeServer("Single",_G._egg_type)
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["EggOpeningService"]["RF"]["Skipped"]:InvokeServer()
      end
   end    
})

T4:AddDropdown({
   Name = "Select building",
   Default = houseList[1],
   Options = houseList,
   Callback = function(Value)
     _G._build_type = NumberHandler(Value)
  end    
})

T4:AddButton({
Name = "Buy Building",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["PlotService"]["RF"]["BuyBlueprint"]:InvokeServer(tonumber(_G._build_type))		
  end    
})

T4:AddToggle({
   Name = "Auto Sell Building",
   Default = false,
   Callback = function(Value)
      _G.sb = Value
      while wait() do
        if _G.sb == false then break end
          game:GetService("ReplicatedStorage")["Packages"]["Knit"]["Services"]["PlotService"]["RF"]["SellBuild"]:InvokeServer()
      end
   end    
})
