local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local m = lib:Window("Build An Island")
local bi = lib:Window("Buy Items")
local s = lib:Window("Settings")

local Players = game:GetService("Players")
local plr = Players.LocalPlayer
local plot = game:GetService("Workspace"):WaitForChild("Plots"):WaitForChild(plr.Name)

local land = plot:FindFirstChild("Land")
local resources = plot:WaitForChild("Resources")
local expand = plot:WaitForChild("Expand")

local TurtleLib = game:GetService("CoreGui"):FindFirstChild("TurtleUiLib")

getgenv().settings = {
	farm = false,
	expand = false,
	craft = false,
	sell = false,
	gold = false,
	collect = false,
	harvest = false,
    hive = false
}

local expand_delay = 0.1
local craft_delay = 0.1

m:Toggle("Auto Farm Resources", settings.farm, function (b)
	settings.farm = b
	task.spawn(function()
		while settings.farm do
			for _, r in ipairs(resources:GetChildren()) do
				game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("HitResource"):FireServer(r)
				task.wait(.01)
			end
			task.wait(.1)
		end
	end)
end)
m:Toggle("Auto Expand Land", settings.expand, function (b)
	settings.expand = b
	task.spawn(function()
		while settings.expand do
			for _, exp in ipairs(expand:GetChildren()) do
				local top = exp:FindFirstChild("Top")
				if top then
					local bGui = top:FindFirstChild("BillboardGui")
					if bGui then
						for _, contribute in ipairs(bGui:GetChildren()) do
							if contribute:IsA("Frame") and contribute.Name ~= "Example" then
								local args = {
									exp.Name,
									contribute.Name,
									1
								}
								game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("ContributeToExpand"):FireServer(unpack(args))
							end
						end
					end
				end
				task.wait(0.01)
			end
			task.wait(expand_delay)
		end
	end)
end)
m:Toggle("Auto Crafter", settings.craft, function (b)
	settings.craft = b
	task.spawn(function ()
		while settings.craft do
			for _, c in pairs(plot:GetDescendants()) do
				if c.Name == "Crafter" then
					local attachment = c:FindFirstChildOfClass("Attachment")
					if attachment then
						game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Craft"):FireServer(attachment)
					end
				end
			end
			task.wait(craft_delay)
		end
	end)
end)
m:Toggle("Auto Gold Mine", settings.gold, function (b)
	settings.gold = b
	task.spawn(function ()
		while settings.gold do
			for _, mine in pairs(land:GetDescendants()) do
				if mine:IsA("Model") and mine.Name == "GoldMineModel" then
					game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Goldmine"):FireServer(mine.Parent.Name, 1)
				end
			end
			task.wait(1)
		end
	end)
end)
m:Toggle("Auto Collect Gold", settings.collect, function (b)
	settings.collect = b
	task.spawn(function ()
		while settings.collect do
			for _, mine in pairs(land:GetDescendants()) do
				if mine:IsA("Model") and mine.Name == "GoldMineModel" then
					game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Goldmine"):FireServer(mine.Parent.Name, 2)
				end
			end
			task.wait(1)
		end
	end)
end)
m:Toggle("Auto Sell", settings.sell, function (b)
	settings.sell = b
	task.spawn(function ()
		while settings.sell do
			for _, crop in pairs(plr.Backpack:GetChildren()) do
				if crop:GetAttribute("Sellable") then
					local a = {
						false,
						{
							crop:GetAttribute("Hash")
						}
					}
					game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("SellToMerchant"):FireServer(unpack(a))
				end
			end
			task.wait(1)
		end
	end)
end)
m:Toggle("Auto Harvest", settings.harvest, function (b)
	settings.harvest = b
	task.spawn(function ()
		while settings.harvest do
			for _, crop in pairs(plot:FindFirstChild("Plants"):GetChildren()) do
				game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Harvest"):FireServer(crop.Name)
			end
			task.wait(1)
		end
	end)
end)
m:Toggle("Auto Collect Hive", settings.hive, function (b)
    settings.hive = b
    task.spawn(function ()
        while settings.hive do
            for _, spot in ipairs(land:GetDescendants()) do
                if spot:IsA("Model") and spot.Name:match("Spot") then
                    game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("Hive"):FireServer(spot.Parent.Name, spot.Name, 2)
                end
            end
            task.wait(1)
        end
    end)
end)


local items = {}
for _, item in ipairs(plr.PlayerGui.Main.Menus.Merchant.Inner.ScrollingFrame.Hold:GetChildren()) do
	if item:IsA("Frame") and item.Name ~= "Example" then
		table.insert(items, item.Name)
	end
end
local timer = plr.PlayerGui.Main.Menus.Merchant.Inner.Timer
local item = nil
bi:Dropdown("Items", items, function(name)
	item = name
end)
bi:Button("Buy Item", function ()
	if item ~= nil then
		local a = {
			item,
			false
		}
		game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("BuyFromMerchant"):FireServer(unpack(a))
	end
end)
bi:Toggle("Auto Buy Item", false, function (b)
	settings.auto_buy = b
	task.spawn(function ()
		while settings.auto_buy do
			if item then
				local a = {
					item,
					false
				}
				game:GetService("ReplicatedStorage"):WaitForChild("Communication"):WaitForChild("BuyFromMerchant"):FireServer(unpack(a))
			end
			task.wait(0.25)
		end
	end)
end)
bi:Label("New Items In 00:00", Color3.fromRGB(127, 143, 166))
local timer = plr.PlayerGui.Main.Menus.Merchant.Inner.Timer
local timerUI = nil
for _, child in ipairs(TurtleLib:GetDescendants()) do
	if child:IsA("Frame") and child.Name == "Header" then
		if child:FindFirstChildOfClass("TextLabel") and child:FindFirstChildOfClass("TextLabel").Text == "Buy Items" then
			timerUI = child
			break
		end
	end
end
pcall(function()
    game:GetService("RunService").RenderStepped:Connect(function()
        if timerUI and timer then
            local time = timer.Text
            timerUI:FindFirstChild("Window"):FindFirstChild("Label").Text = time
        end
    end)
end)

s:Button("Anti AFK", function ()
	local bb = game:GetService("VirtualUser")
	plr.Idled:connect(function()
		bb:CaptureController()
		bb:ClickButton2(Vector2.new())
	end)
end)
s:Box("Expand Delay", function(t)
	expand_delay = t
end)
s:Box("Craft Delay", function(t)
	craft_delay = t
end)
s:Label("Press LeftControl to Hide UI", Color3.fromRGB(127, 143, 166))
s:Button("Destroy Gui", function ()
	settings.farm = false;
	settings.expand = false;
	settings.craft = false;
	settings.sell = false;
	settings.gold = false;
	settings.collect = false;
	settings.harvest = false;
    settings.hive = false
	lib:Destroy()
end)
s:Label("~ t.me/arceusxscripts", Color3.fromRGB(127, 143, 166))
lib:Keybind("LeftControl")
