local OrionLib = loadstring(game:HttpGet("https://pastebin.com/raw/NMEHkVTb"))()
local Window = OrionLib:MakeWindow({Name = "VIP Turtle Hub V3 By Fahri & Turtle Team", HidePremium = false, SaveConfig = false, ConfigFolder = "OrionTest"})
local client = game.Players.LocalPlayer
local workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService = game:GetService("TextChatService")
local HTMLcolors = { 
    ["Red"] = "rgb(255, 0, 0)",
    ["Yellow"] = "rgb(255, 255, 0)",
    ["Orange"] = "rgb(255, 165, 0)",
    ["Pink"] = "rgb(255, 192, 203)",
    ["Light Green"] = "rgb(50, 205, 50)",
    ["Sky Blue"] = "rgb(135, 206, 235)",
    ["Black"] = "rgb(0, 0, 0)",
    ["Dark Red"] = "rgb(139, 0, 0)",
    ["Dark Green"] = "rgb(0, 100, 0)",
    ["Dark Blue"] = "rgb(0, 0, 139)",
    ["Gray"] = "rgb(128, 128, 128)",
    ["Dark Purple"] = "rgb(128, 0, 128)",
    ["Dark Brown"] = "rgb(101, 67, 33)",
    ["Dark Purple"] = "rgb(128, 0, 128)",
    ["Dark Blue"] = "rgb(0, 0, 128)",
    ["Brown"] = "rgb(139, 69, 19)",
    ["Purple"] = "rgb(128, 0, 128)",
    ["Blue"] = "rgb(0, 0, 255)",
    ["White"] = "rgb(255, 255, 255)",
    ["Green"] = "rgb(0, 255, 0)",
    ["Bright Blue"] = "rgb(173, 216, 230)",
    ["Lavender"] = "rgb(230, 230, 250)",
    ["Peach"] = "rgb(255, 218, 185)",
    ["Teal"] = "rgb(0, 128, 128)",
    ["Salmon"] = "rgb(250, 128, 114)",
    ["Gold"] = "rgb(255, 215, 0)",
    ["Dark Slate Gray"] = "rgb(47, 79, 79)",
    ["Slate Blue"] = "rgb(106, 90, 205)",
    ["Cadet Blue"] = "rgb(95, 158, 160)",
    ["Chocolate"] = "rgb(210, 105, 30)",
    ["Forest Green"] = "rgb(34, 139, 34)",
    ["Steel Blue"] = "rgb(70, 130, 180)",
    ["Olive"] = "rgb(128, 128, 0)",
    ["Tomato"] = "rgb(255, 99, 71)",
    ["Khaki"] = "rgb(240, 230, 140)",
    ["Peru"] = "rgb(205, 133, 63)",
    ["Royal Blue"] = "rgb(65, 105, 225)",
    ["Medium Purple"] = "rgb(147, 112, 219)",
    ["Blue Violet"] = "rgb(138, 43, 226)",
    ["Cornflower Blue"] = "rgb(100, 149, 237)",
    ["Indian Red"] = "rgb(205, 92, 92)",
    ["Medium Violet Red"] = "rgb(199, 21, 133)",
    ["Pale Violet Red"] = "rgb(219, 112, 147)",
    ["Medium Sea Green"] = "rgb(60, 179, 113)",
    ["Yellow Green"] = "rgb(154, 205, 50)",
    ["Sky Blue"] = "rgb(135, 206, 235)",
    ["Medium Slate Blue"] = "rgb(123, 104, 238)",
    ["Medium Turquoise"] = "rgb(72, 209, 204)",
    ["Light Sea Green"] = "rgb(32, 178, 170)",
    ["Dark Olive Green"] = "rgb(85, 107, 47)",
    ["Medium Orchid"] = "rgb(186, 85, 211)",
    ["Slate Gray"] = "rgb(112, 128, 144)",
    ["Deep Sky Blue"] = "rgb(0, 191, 255)"
}

local lootgame = {
  a = "",
  b = 0,
  c = false
}
local up = 0
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
	local Method = getnamecallmethod()
	local Args = {...}

	if Method == 'InvokeServer' and self.Name == 'LaunchFinished' then
                lootgame.a = Args[1]
                lootgame.b = Args[2]
                --lootgame.c = Args[3]
	elseif Method == 'InvokeServer' and self.Name == 'UpgradeLauncher' then
		up = Args[1]
        end
	return namecall(self, ...) 
end)


local function fontcolor(str,color)
      return "<font color='" .. color .. "'>" .. str .. "</font>"
end

local function talk(str)
	TextChatService["TextChannels"]["RBXGeneral"]:SendAsync(str)
end

local a_,b_ = pcall(function()
local assets = {
	Pets = {},
	Launchers = {},
	Eggs = {},
	World = {}
}

OrionLib:AddTable(ReplicatedStorage["Assets"]["Worlds"],assets.World)
OrionLib:AddTable(ReplicatedStorage["Assets"]["Eggs"],assets.Eggs)
OrionLib:AddTable(ReplicatedStorage["Assets"]["Pets"],assets.Pets)
OrionLib:AddTable(ReplicatedStorage["Assets"]["Launchers"],assets.Launchers)

local T1 = Window:MakeTab({
Name = "Main",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T2 = Window:MakeTab({
Name = "Teleport",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T3 = Window:MakeTab({
Name = "Hatch",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T4 = Window:MakeTab({
Name = "Merge",
Icon = "rbxassetid://",
PremiumOnly = false
})

local T5 = Window:MakeTab({
Name = "Sell & Buy",
Icon = "rbxassetid://",
PremiumOnly = false
})

local S1 = T5:AddSection({
     Name = "SELL PETS"
})

local S2 = T5:AddSection({
     Name = "BUY PETS"
})

S1:AddDropdown({
  Name = "Select the pet you wanna sell",
  Default = assets.Pets[1],
  Options = assets.Pets,
  Callback = function(Value)
      _G.forSell_system = Value
  end    
})

S1:AddTextbox({
  Name = "How much you wanna sell it",
  Default = "0",
  TextDisappear = false,
  Callback = function(Value)
     _G.forSell_price = Value
  end  
})

S1:AddButton({
Name = "Say it!",
Callback = function()
	talk("selling " .. _G.forSell_system:lower() .. " for " .. _G.forSell_price:upper() .. " gems")
   end    
})

S2:AddDropdown({
  Name = "Select the pet you wanna buy",
  Default = assets.Pets[1],
  Options = assets.Pets,
  Callback = function(Value)
      _G.forBuy_system = Value
  end    
})

S2:AddButton({
Name = "Say it!",
Callback = function()
	talk("buying " .. _G.forBuy_system:lower() .. ".")
   end    
})

T4:AddDropdown({
  Name = "Select pets name",
  Default = assets.Pets[1],
  Options = assets.Pets,
  Callback = function(Value)
      _G.merge_system = Value
  end    
})

T4:AddDropdown({
  Name = "Select result",
  Default = assets.Pets[1],
  Options = assets.Pets,
  Callback = function(Value)
      _G.onMerge_done_merging = Value
  end    
})

T4:AddButton({
Name = "Merge equipped pets",
Callback = function()
	local onMerging = workspace["PETS"][client]:GetChildren()
      	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PetsService"]["RF"]["MergePets"]:InvokeServer({onMerging[1],onMerging[1],onMerging[1],onMerging[1],onMerging[1],onMerging[1],onMerging[1],onMerging[1],onMerging[1],onMerging[1]},_G.merge_system,_G.onMerge_done_merging)
   end    
})

T1:AddToggle({
  Name = "Auto Launch",
  Default = false,
  Callback = function(Value)
     _G.Lch = Value
      while wait() do
        if _G.Lch == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["LauncherService"]["RF"]["LaunchBegan"]:InvokeServer(client,true)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Collect drops/stars",
  Default = false,
  Callback = function(Value)
     _G.strs = Value
      while wait() do
        if _G.strs == false then break end
        for i,v in pairs(workspace["DROPS"]:GetChildren()) do
          game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["DropService"]["RE"]["PickupDrop"]:FireServer({v.Name})
	  v.Position = Vector3.new(9e9,9e9,9e9)
        end
      end
  end    
})

T1:AddToggle({
  Name = "Auto Collect money [ Launch first ]",
  Default = false,
  Callback = function(Value)
     _G.cm = Value
      while wait() do
        if _G.cm == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["LauncherService"]["RF"]["LaunchFinished"]:InvokeServer(lootgame.a,lootgame.b,lootgame.c)
      end
  end    
})

T1:AddToggle({
  Name = "Auto Rebirth",
  Default = false,
  Callback = function(Value)
     _G.rbr = Value
      while wait() do
        if _G.rbr == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["RebirthService"]["RF"]["Rebirth"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Hit pinata",
  Default = false,
  Callback = function(Value)
     _G.hpinata = Value
      while wait() do
        if _G.hpinata == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["SpacePinataService"]["RE"]["HitPinata"]:FireServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto Upgrade [ UP first ]",
  Default = false,
  Callback = function(Value)
     _G.upgl = Value
      while wait() do
        if _G.upgl == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["LauncherService"]["RF"]["UpgradeLauncher"]:InvokeServer(up)
      end
  end    
})

T1:AddToggle({
  Name = "Auto spin",
  Default = false,
  Callback = function(Value)
     _G.spin = Value
      while wait() do
        if _G.spin == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["SpinService"]["RF"]["Spin"]:InvokeServer()
      end
  end    
})

T1:AddToggle({
  Name = "Auto claim task/quest [ Regular ]",
  Default = false,
  Callback = function(Value)
     _G.cqtr = Value
      while wait() do
        if _G.cqtr == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["QuestsService"]["RF"]["ClaimReward"]:InvokeServer("Quest1","regular")
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["QuestsService"]["RF"]["ClaimReward"]:InvokeServer("Quest2","regular")
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["QuestsService"]["RF"]["ClaimReward"]:InvokeServer("Quest3","regular")
      end
  end    
})

T1:AddToggle({
  Name = "Auto claim task/quest [ Premium Only ]",
  Default = false,
  Callback = function(Value)
     _G.cqtp = Value
      while wait() do
        if _G.cqtp == false then break end
        game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["QuestsService"]["RF"]["ClaimReward"]:InvokeServer("Quest1","premium")
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["QuestsService"]["RF"]["ClaimReward"]:InvokeServer("Quest2","premium")
	game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["QuestsService"]["RF"]["ClaimReward"]:InvokeServer("Quest3","premium")
      end
  end    
})

T2:AddDropdown({
  Name = "Select world",
  Default = assets.World[1],
  Options = assets.World,
  Callback = function(Value)
      _G.tps = Value
  end    
})

T2:AddButton({
Name = "Teleport",
Callback = function()
      game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PlotService"]["RF"]["ChangeWorld"]:InvokeServer(_G.tps)
  end    
})

T3:AddDropdown({
  Name = "Select egg",
  Default = assets.Eggs[1],
  Options = assets.Eggs,
  Callback = function(Value)
      _G.eggth = Value
  end    
})

T3:AddDropdown({
  Name = "Hatch amount",
  Default = "X1",
  Options = {"X1","X4"},
  Callback = function(Value)
      _G.ha = Value
  end    
})

T3:AddToggle({
  Name = "Auto Hatch",
  Default = false,
  Callback = function(Value)
     _G.lolhtc = Value
      while wait() do
        if _G.lolhtc == false then break end
	if _G.ha == "X1" then
		game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PetsService"]["RF"]["HatchEgg"]:InvokeServer(_G.eggth,1)
	elseif _G.ha == "X4" then
		game:GetService("ReplicatedStorage")["Packages"]["_Index"]:FindFirstChild("sleitnick_knit@1.6.0")["knit"]["Services"]["PetsService"]["RF"]["HatchEgg"]:InvokeServer(_G.eggth,4)
	else
		OrionLib:MakeNotification({Name = fontcolor("Invalid",HTMLcolors["Red"]) .. " hatch amount",Content = "Hatch amount is " .. fontcolor("INVALID",HTMLcolors["Red"]) .. "! Enter a valid hatch amount!",Image = "rbxassetid://",Time = 7})
	end
      end
  end    
})

--OrionLib:MakeNotification({Name = "Mythic Pet | Congrats:)",Content = "Congratulations! You got a mythical pet!",Image = "rbxassetid://",Time = 7})

local function DisplaySystemMessage(player,message)
	if player.Name == client.Name and message:find("mythic") or message:find("Mythic") then
		OrionLib:MakeNotification({Name = fontcolor("Mythic",HTMLcolors["Red"]) .. " Pet | Congrats:)",Content = "Congratulations! You got a " .. fontcolor("Mythic",HTMLcolors["Red"]) .. " pet!",Image = "rbxassetid://",Time = 7})
	elseif player.Name == client.Name and message:find("divine") or message:find("Divine") then
		OrionLib:MakeNotification({Name = fontcolor("Divine",HTMLcolors["Sky Blue"]) .. " Pet | Congrats:)",Content = "Congratulations! You got a " .. fontcolor("Divine",HTMLcolors["Sky Blue"]) .. " pet!",Image = "rbxassetid://",Time = 7})
	elseif player.Name == client.Name and message:find("legendary") or message:find("Legendary") then
		OrionLib:MakeNotification({Name = fontcolor("Legendary",HTMLcolors["Yellow"]) .. " Pet | Congrats:)",Content = "Congratulations! You got a " .. fontcolor("Legendary",HTMLcolors["Yellow"]) .. " pet!",Image = "rbxassetid://",Time = 7})
	end
end
end)

if not a_ then
	OrionLib:MakeNotification({Name = "SCRIPT " .. fontcolor("ERROR",HTMLcolors["Red"]),Content = b_,Image = "rbxassetid://",Time = 7})
end
--TextChatService["TextChannels"]["RBXGeneral"]
--TextChatService["TextChannels"]["RBXSystem"].SystemMessageReceived:Connect(DisplaySystemMessage)
