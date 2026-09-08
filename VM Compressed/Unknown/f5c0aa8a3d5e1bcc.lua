_G.ReserveFlow = 1
_G.SellAmount = 1
_G.SellResource = [==[Electronics]==]
_G.ESPToggle = false
_G.AlertToggle = false

local IgnoredAlerts = {
 ["Trade accepted"] = true,
 ["Trade offer declined"] = true,
 ["Trade Cancelled"] = true,
 ["Alliance declined"] = true,
 ["Modifier Lost!"] = true,
 ["New Modifier!"] = true,
 ["Trade Declined"] = true,
 ["Trade declined"] = true,
 ["Faction Disbanded"] = true,
 ["Independence!"] = true,
}

local Gui = loadstring(game:HttpGet([==[https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3]==]))()
_G.MainColor = Color3.fromRGB(48,48,48)
_G.SecondaryColor = Color3.fromRGB(48,48,48)
_G.TertiaryColor = Color3.fromRGB(32,32,32)
_G.ArrowColor = Color3.fromRGB(255,255,255)
_G.MainTextColor = Color3.fromRGB(255,255,255)
_G.PointerColor = Color3.fromRGB(255,255,255)
_G.ButtonTextColor = Color3.fromRGB(255,255,255)
_G.SliderColor = Color3.fromRGB(128,0,0)
_G.ButtonColor = Color3.fromRGB(48,48,48)
_G.ToggleColor = Color3.fromRGB(48,48,48)
_G.DraggerCircleColor = Color3.fromRGB(255,255,255)
_G.BindColor3 = Color3.fromRGB(48,48,48)
local Window = Gui:CreateWindow([==[Rise of Nations]==])
local Folder = Window:CreateFolder([==[Sell Bot]==])
local FolderMisc = Window:CreateFolder([==[Misc]==])

local GetChildren = game.GetChildren
local FirstChild = game.FindFirstChild
local RunService = game.RunService
local GameGui = game.Players.LocalPlayer.PlayerGui.GameGui.MainFrame
local ReplicatedStorage = game.ReplicatedStorage
local Resources = ReplicatedStorage.Assets.Resources
local Units = workspace.Units
local Countries = workspace.Countries
local CountryData = workspace.CountryData
local ManageAlliance = workspace.GameManager.ManageAlliance
local CamVal = Enum.RenderPriority.Camera.Value

local FunctionDump = workspace.FunctionDump
local GetRevenue = require(FunctionDump.ValueCalc.CountryRevenue)
local GetExpenses = require(FunctionDump.ValueCalc.CountryExpenses)

--[==[
local GetCitiesTotal = require(FunctionDump.ValueCalc.GetCities).Total
local GetCitiesComposition = require(FunctionDump.ValueCalc.GetCities).Composition
]==]

local TradeData = {
 Sell = {[1] = [==[]==], [2] = [==[]==], [3] = 0, [4] = 1, [5] = [==[]==]}
}

local ResourcesTbl = {Names = {}, Data = {}}

for _,v in next, GetChildren(Resources) do
 local BuyPrice, SellPrice = v.Value, v.Value * .8
 ResourcesTbl.Data[v.Name] = {BuyPrice = 0, SellPrice = 0}
 ResourcesTbl.Data[v.Name].BuyPrice = math.floor(BuyPrice)
 ResourcesTbl.Data[v.Name].SellPrice = math.floor(SellPrice)
 table.insert(ResourcesTbl.Names, v.Name)
end

local function ToggleTags()
 for _,v in next, GetChildren(Units) do
   local Tag = FirstChild(v, [==[Tag]==])
   if Tag then Tag.Enabled = true end
 end
end

local function GetMyCountry()
 local Country = game.Players.LocalPlayer.leaderstats.Country.Value

 return Country
end

local function GetBalance(Country)
 local Balance = tonumber(GetRevenue(Country) - GetExpenses(Country))

 return Balance
end

local function GetResourceFlow(Resource)
 local Flow = CountryData[GetMyCountry()].Resources[Resource].Flow.Value

 return Flow
end

local function GetAI()
 local AI = {Names = {}}

 for i,v in next, GetChildren(Countries) do
   local Name = v.Name
   local Len = string.len(Name) - 2
   local Subbed = string.sub(Name, 1, Len)

   if string.match(Name, [==[AI]==], Len) then
     table.insert(AI.Names, Subbed)
   end
 end

 return AI
end

local function RemoveTrades(Resource)
 local Trades = CountryData[GetMyCountry()].Resources[Resource].Trade
 if not GetChildren(Trades) then return end

 for _,v in next, GetChildren(Trades) do
   ManageAlliance:FireServer(v.Name, [==[TradeCancel]==], Resource)
   task.wait(1.5)
 end

end

local function Sell()
 RemoveTrades(_G.SellResource)
 local AI = GetAI().Names
 local ResourceSellPrice = ResourcesTbl.Data[_G.SellResource].SellPrice

 table.sort(AI, function(a,b) return GetBalance(a) > GetBalance(b) end)

 task.wait(6)
 local ResourceFlow = GetResourceFlow(_G.SellResource)

 for _,v in next, AI do
   local CountriesBalance = GetBalance(v)

   for i = 1, ResourceFlow do
     if ResourceSellPrice * i <= CountriesBalance * .75 then
       _G.SellAmount = i
     end
   end

   ResourceFlow = ResourceFlow - _G.SellAmount
   TradeData.Sell[2] = [==[Sell]==]
   TradeData.Sell[3] = _G.SellAmount - _G.ReserveFlow
   TradeData.Sell[4] = 1
   TradeData.Sell[5] = [==[Trade]==]

   ManageAlliance:FireServer(v, [==[ResourceTrade]==], TradeData.Sell)
   if ResourceFlow <= _G.ReserveFlow then break end
 end
end

RunService:BindToRenderStep([==[Unit ESP]==], CamVal, function()
 if not _G.ESPToggle then return end
 task.spawn(ToggleTags)
end)

GameGui.ChildAdded:Connect(function(Child)
 if ( _G.AlertToggle and Child.Name == [==[AlertSample]==] ) then
   local Title = FirstChild(Child, [==[Title]==])
   if Title and IgnoredAlerts[Title.Text] then task.wait(0.1) Child:Destroy() end
 end
end)

Folder:Dropdown([==[Resources]==],ResourcesTbl.Names,true,function(Val)
 _G.SellResource = Val
 TradeData.Sell[1] = tostring(Val)

 return Val
end)

Folder:Slider([==[Reserve Flow]==],{min = 1, max = 100, precise = false},function(Val)
 _G.ReserveFlow = Val

 return Val
end)

Folder:Button([==[Send]==],function()
 task.spawn(Sell)
end)

FolderMisc:Toggle([==[Unit ESP]==],function(Bool)
 _G.ESPToggle = Bool

 return Bool
end)

FolderMisc:Toggle([==[Clear Alerts]==],function(Bool)
 _G.AlertToggle = Bool

 return Bool
end)