local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

if _G.SCRIPT_LOADING_ == true then return else _G.SCRIPT_LOADING_ = true end

if not game.ReplicatedStorage:FindFirstChild("ToolFolders") then
	local folder = Instance.new("Folder")
	folder.Name = "ToolFolders"
	folder.Parent = game.ReplicatedStorage
end

loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tami4kaPlus/Project_S/main/DoorTimer')))()
local _Work, _Version = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Tami4kaPlus/Project_S/main/Status')))()

_G.AutoFarm = false
_G.LagMachine = false
_G.TakeClothing = false
_G.TakeAllClothing = false
_G.AutoCrashServer = false

local function DrawEsp(esp, color)
	local Highlight = Instance.new("Highlight")

	Highlight.FillTransparency = 0.5
	Highlight.OutlineTransparency = 1
	Highlight.Parent = esp.Parent

	if color == "epic" then
		Highlight.FillColor = Color3.fromRGB(103, 0, 154)
	elseif color == "mef" then
		Highlight.FillColor = Color3.fromRGB(255, 0, 0)
	elseif color == "lega" then
		Highlight.FillColor = Color3.fromRGB(225, 225, 0)
	elseif color == "ult" then 
		Highlight.FillColor = Color3.fromRGB(255, 2, 255)
	elseif typeof(color) == "Color3" then
		Highlight.FillColor = color
	end
end

local function GetClothings(Type)
    local Clothings = {}
    for i, v in workspace.Clothing:GetChildren() do
        if v.Name == Type then
            for index, obj in v.Main:GetChildren() do
                table.insert(Clothings, obj)
            end
        end
    end
    return Clothings
end

local function espEnable(ClothingList, ClothingType, string)
    for index, obj in GetClothings(ClothingType) do
        if not obj:FindFirstChild("Highlight") then
		     for index, id in pairs(ClothingList) do
				if obj:FindFirstChild(ClothingType)[ClothingType.."Template"] == "rbxassetid://"..id then
					DrawEsp(obj[ClothingType], string)
				end
			 end
		elseif obj:FindFirstChild("Highlight") then
			if obj[ClothingType][ClothingType.."Template"] == "rbxassetid://1" then
				obj.Highlight:Destroy()
			end
		end
    end
end

local function destroyEsp()
	for i, v in workspace.Clothing:GetDescendants() do
		if v:IsA("Highlight") then
			v:Destroy()
		end
	end
end

local function equipTool(Tool)
    if Tool and Tool:IsA("Tool") then 
        Tool.Parent = localPlayer.Character

		task.delay(0.2, function()
			Tool.Parent = game.ReplicatedStorage.ToolFolders
		end)
    end
end

local function takeClothing(list, ClothingType, PositionOffset)
	for index, obj in GetClothings(ClothingType) do
		for index, id in pairs(list) do
			if obj:FindFirstChild(ClothingType)[ClothingType.."Template"] == "rbxassetid://"..id then
				localPlayer.Character.HumanoidRootPart.CFrame = obj.Mouse.CFrame + PositionOffset
				local ClickDetector = obj.Mouse:WaitForChild("ClickDetector", 5)
				repeat fireclickdetector(ClickDetector) task.wait() until obj.bzi.Value or (obj.Mouse.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude >= 10
				equipTool(localPlayer.Backpack:FindFirstChildOfClass("Tool"))
				task.wait()
			end
		end
	end
	
	for index, obj in localPlayer.Backpack:GetChildren() do
		obj.Parent = localPlayer.Character
	end

	return true
end

local function SellItem(Pos)
	if Pos then
		localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Pos)
	else
		localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(175, 20, -35)
	end
	
	task.wait()
	for index, folder in localPlayer.Clothing:GetChildren() do
		game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Server"):WaitForChild("Sell"):FireServer(folder.Name)
	end
	task.wait()

	return true
end

local function BuyItem(Pos)
	if Pos then
		localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Pos)
	else
		localPlayer.Character.HumanoidRootPart.CFrame = workspace.Terrain.Buy1.CFrame
	end

	task.wait()
	for index, obj in localPlayer.Backpack:GetChildren() do
		equipTool(Tool)
	end

	while task.wait() do
		fireproximityprompt(workspace.Terrain.Buy1["ProximityPrompt"], 0.5, true)
		if not localPlayer.Character:FindFirstChildOfClass("Tool") or #localPlayer.Clothing:GetChildren() >= 25 then break end
	end

	task.wait()
	return true
end

local function CollectClothing(ClothingType, ClothList)
	for index, obj in GetClothings(ClothingType) do
		if ClothList ~= nil then
			for index, id in pairs(ClothList) do
				if obj:FindFirstChild(ClothingType)[ClothingType.."Template"] == "rbxassetid://"..id then
					local ClickDetector = obj.Mouse:FindFirstChild("ClickDetector") 
					if ClickDetector and not obj.bzi.Value and (obj.Mouse.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 17 then fireclickdetector(ClickDetector) end task.wait()
				end
			end
		elseif ClothList == nil then
			local ClickDetector = obj.Mouse:FindFirstChild("ClickDetector") 
			if ClickDetector and not obj.bzi.Value and (obj.Mouse.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude <= 17 then fireclickdetector(ClickDetector) end
		end
	end
end

local EpicList = {
	"13122216162",
	"13779106850",
	"13214898748",
	"13399301724",
	"13469431089",
	"13118563657",
	"13214910323",
	"13122216162",
	"13117322084",
	"8509230323",
	"7791541966",
	"12849806373",
	"13121694218",
	"14479226476"
}

local EpicListP = {
	"13112278696",
	"14357291910"
}

local MefList = {
	"10774950203",
	"6406870851",
	"14617460767",
	"5219845970",
	"9966500982",
	"5081906790",
	"11624442164",
	"15373236991",
	"169222867",
	"14045339941",
	"13118233790",
	"7713824524",
	"6434833814",
	"12779513863"
}

local MefListP = {
	"9743673448",
	"14067920146",
	"13132377494"
}

local LegaList = {
	"13112278696",
	"11399187381",
	"13686174145",
	"4977533353",
	"8286855177",
	"11235784172",
	"6492846709",
	"14610851449",
	"13023747652",
	"13634019459",
	"14387015395",
	"8195412170",
	"8656691531",
	"17540162234",
	"12867315395"
}

local LegaListP = {
	"12866275081",
	"16096601147"
}

local UltListS = {
	"15092420573",
	"14160465716",
	"13783114726",
	"16310782401",
	"15393383449",
	"13668015730",
	"84950952404149",
	"78478646034235",
	"85873511189587",
	"13735603351",
	"129264610471514",
	"18120163096",
	"12549463467"
}

local UltListP = {
	"15091951487",
	"13668016214",
	"14837423556",
	"98785609645432",
	"10837133941",
	"11881332961"
}

local whatBuyListS = {}
local whatBuyListP = {}

for index, obj in localPlayer.PlayerGui.MainHud.WhatBuy.Main:GetChildren() do
	if obj:IsA("ViewportFrame") then
		if obj:FindFirstChild("Shirt") then
			local _ID = obj.Shirt.Shirt.ShirtTemplate:gsub("%D", "")
			table.insert(whatBuyListS, _ID)
		elseif obj:FindFirstChild("Pants") then
			local _ID = obj.Pants.Pants.PantsTemplate:gsub("%D", "")
			table.insert(whatBuyListP, _ID)
		end
	end
end

local Rayfield = loadstring(game:HttpGet(("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua")))()

local Window = Rayfield:CreateWindow({Name = "Casual Metro | by Tami4ka", LoadingTitle = "Powered by Rayfield", LoadingSubtitle = "by Tami4ka",  Theme = "Default",
	DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil,
       FileName = "Tami4kaCasualHub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
 	KeySystem = false})

local function Notify(name, content, time)
	Rayfield:Notify({
		Title = name,
		Content = content,
		Duration = time,
		Image = 4483362458,
	 })
end

Notify("Casual Metro","Version - ".._Version.." | by Tami4ka", 5)

_G.SCRIPT_LOADING_ = false
if not _Work then print("\n[!] Script currently not working \n[?] Sub my telegram channel \n[?] Link in you clipboard") setclipboard("t.me/Tami4kaRoblox") return end

local Hello = Window:CreateTab("Information", 4483362458)
local Misc = Window:CreateTab("Main", 4483362458)
local Main = Window:CreateTab("Misc", 4483362458)
local Esp = Window:CreateTab("ESP", 4483362458)
local Dev = Window:CreateTab("Dev Functions", 4483362458)

Hello:CreateParagraph({Title = "Спасибо за использование скрипта =)", Content = "Скрипт работает не только на обычную версию Metro, но и на 2.0"})
Hello:CreateLabel("Создатель: Tami4ka", "rewind")

Hello:CreateButton({
	Name = "Скопировать ссылку [Telegram]",
	Callback = function()
		if setclipboard then
			setclipboard("https://t.me/Tami4kaRoblox")
		end
	end    
})

Misc:CreateParagraph({Title = "ВАЖНО! [Trade]", Content = "Когда нажимаешь на отрицательное число в трейде ставиться число которое заберет у обоих игроков все деньги"})

Misc:CreateButton({
	Name = "Поставить отрицательное число в доплате [Trade]",
	Callback = function()
		game:GetService("ReplicatedStorage").TradeRemote.Doplata:FireServer(math.huge)
	end
})

Misc:CreateToggle({
	Name = "Попытка крашнуть игрока (Нужно много вещей)",
	CurrentValue = false,
	Callback = function(toggle)
		if toggle then
			_G.AutoCrashServer = true

			-- game:GetService("RunService"):Set3dRenderingEnabled(false)

			for index, tool in game.ReplicatedStorage.ToolFolders:GetChildren() do
				tool.Parent = localPlayer.Backpack
				
				for index, obj in tool:GetChildren() do
					obj:Destroy()
				end
			end

            while _G.AutoCrashServer do
				for index, tool in localPlayer.Backpack:GetChildren() do
					task.spawn(function()
						task.wait()
						tool.Parent = localPlayer.Character
					end)
				end

				task.wait(0.5)

				for index, tool in localPlayer.Character:GetChildren() do
					if tool:IsA("Tool") then
						task.spawn(function()
							task.wait()
							tool.Parent = localPlayer.Backpack
						end)
					end
				end
            end

			-- game:GetService("RunService"):Set3dRenderingEnabled(true)
		else
			_G.AutoCrashServer = false
		end
	end
})

Misc:CreateToggle({
	Name = "Авто-Фарм",
	CurrentValue = false,
	Callback = function(toggle)
		if toggle then
			if fireclickdetector and fireproximityprompt then
				local T = localPlayer.Character.HumanoidRootPart
				local BV = Instance.new('BodyVelocity')
                local _X = Instance.new("BoolValue")
				local BG = Instance.new('BodyGyro')
				
				BG.P = 9e4
				BG.Parent = T
				BV.Parent = T
				BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				BG.cframe = T.CFrame
				BV.velocity = Vector3.new(0, 0, 0)
				BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
				localPlayer.Character.Humanoid.PlatformStand = true
                _G.AutoFarm = true

                while _G.AutoFarm do
                    coroutine.wrap(function()
                        takeClothing(whatBuyListS, "Shirt", Vector3.new(0, -5, 0))
                        takeClothing(whatBuyListP, "Pants", Vector3.new(0, -5, 0))
                        wait(1)
                        BuyItem(Vector3.new(-125, 10, -135))
                        wait(1)
                        SellItem(Vector3.new(175, 10, -30))
                        wait(2)
                        _X.Value = not _X.Value
                    end)()
                    _X.Changed:Wait()
                end

				localPlayer.Character.Humanoid.PlatformStand = false
				BG:Destroy()
				BV:Destroy()
            end
		else
			_G.AutoFarm = false
		end
	end
})

Misc:CreateToggle({
	Name = "Авто-Cбор",
	CurrentValue = false,
	Callback = function(toggle)
		if toggle then
			if fireclickdetector then
                _G.AutoFarm = true
				while _G.AutoFarm do
					coroutine.wrap(function()
						local Temp1, Temp2 = "Shirt", "Pants"
						CollectClothing(Temp1, whatBuyListS)
						CollectClothing(Temp2, whatBuyListP)
					end)()
					task.wait(1)
				end
			end
		else
			_G.AutoFarm = false
		end
	end
})

Misc:CreateToggle({
	Name = "Забирать все вещи",
	CurrentValue = false,
	Callback = function(toggle)
		if toggle then
			if fireclickdetector then
                _G.TakeAllClothing = true
				while _G.TakeAllClothing do
					coroutine.wrap(function()
						CollectClothing("Shirt", nil)
					end)()
					coroutine.wrap(function()
						CollectClothing("Pants", nil)
					end)()
					task.wait(0.25)
				end
			end
		else
			_G.TakeAllClothing = false
		end
	end
})

Misc:CreateToggle({
	Name = "Взять все вещи в руки (Обход лимита предметов) [AUTO]",
	CurrentValue = false,
	Callback = function(toggle)
		if toggle then
			if fireclickdetector then
                _G.TakeClothing = true
				while _G.TakeClothing do
					for index, tool in localPlayer.Backpack:GetChildren() do
                        equipTool(tool)
                    end
					task.wait(0.25)
				end
			end
		else
			_G.TakeClothing = false
		end
	end
})

Main:CreateButton({
	Name = "Взять все вещи в руки (Обход лимита предметов)",
	Callback = function()
		for index, tool in localPlayer.Backpack:GetChildren() do
            equipTool(tool)
        end
	end
})

Main:CreateButton({
	Name = "Вернуть вещи в инвентарь",
	Callback = function()
		for index, tool in game.ReplicatedStorage.ToolFolders:GetChildren() do
            tool.Parent = localPlayer.Backpack
        end
	end
})

Main:CreateButton({
	Name = "Продать все вещи",
	Callback = function()
		SellItem()
	end
})

Main:CreateButton({
	Name = "Оплатить одежду",
	Callback = function()
		BuyItem()
	end
})

Main:CreateButton({
	Name = "Телепорт в секонд хенд",
	Callback = function()
		localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-85, 20, -135)
	end
})

Main:CreateButton({
	Name = "Телепорт к продавцу",
	Callback = function()
		localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(175, 20, -35)
	end
})

Main:CreateButton({
	Name = "Собрать все листочки на карте",
	Callback = function()
        local currentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame

		for index, obj in workspace:GetChildren() do
			if obj.Name == "LISTOK" then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = obj.Listok.CFrame
                task.wait()
			end
		end

        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentCFrame
	end
})

Main:CreateButton({
	Name = "Удобный рюкзак [NEW]",
	Callback = function()
		loadstring(game:HttpGet(("https://raw.githubusercontent.com/Tami4kaPlus/Project_S/main/Backpack")))()
	end
})

Esp:CreateButton({
	Name = "Очистить ESP",
	Callback = function()
		destroyEsp()
	end    
})

Esp:CreateButton({
	Name = "Окуп Одежда",
	Callback = function()
	    local colorEsp = Color3.fromRGB(50, 255, 255)
	    espEnable(whatBuyListS, "Shirt", colorEsp)
	    espEnable(whatBuyListP, "Pants", colorEsp)
	end    
})

Esp:CreateButton({
	Name = "Эпическая Одежда",
	Callback = function()
	    espEnable(EpicList, "Shirt", "epic")
	    espEnable(EpicListP, "Pants", "epic")
	end    
})

Esp:CreateButton({
	Name = "Мифическая Одежда",
	Callback = function()
	    espEnable(MefList, "Shirt", "mef")
	    espEnable(MefListP, "Pants", "med")
	end    
})

Esp:CreateButton({
	Name = "Легендарная Одежда",
	Callback = function()
	    espEnable(LegaList, "Shirt", "lega")
	    espEnable(LegaListP, "Pants", "lega")
	end    
})

Esp:CreateButton({
	Name = "Ультимейт Одежда",
	CurrentValue = false,
	Callback = function()
	    espEnable(UltListS, "Shirt", "ult")
	    espEnable(UltListP, "Pants", "ult")
	end    
})

Dev:CreateLabel("Чтобы получить ID вещи нужно надеть ее", "rewind")

Dev:CreateButton({
	Name = "Скопировать ID [Кофта]",
	Callback = function()
		local ClothingType = "Shirt"
		local ID = localPlayer.Character[ClothingType][ClothingType.."Template"]
		setclipboard(ID:gsub("%D", ""))
	end
})

Dev:CreateButton({
	Name = "Скопировать ID [Штаны]",
	Callback = function()
		local ClothingType = "Pants"
		local ID = localPlayer.Character[ClothingType][ClothingType.."Template"]
		setclipboard(ID:gsub("%D", ""))
	end
})
