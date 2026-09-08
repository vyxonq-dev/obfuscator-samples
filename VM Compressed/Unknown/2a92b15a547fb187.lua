-- if _G.HOHO_RAN then return end
-- _G.HOHO_RAN = true
-- most executors issue
-- for Index, Value in next, debug do
--     if not getgenv()[Index] then
--         getgenv()[Index] = Value
--     end
-- end

repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- local ExecutorName = identifyexecutor()

-- getgenv().bit = bit32 -- Cubix & Awp issue :)

-- if ExecutorName:find("Swift") then -- don't ask me idk why it work :D?
-- 	task.spawn(function()
-- 	    loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/HohoHub.lua'))()
-- 	end)
-- 	wait(2.5)
-- 	for i, v in pairs(game.CoreGui:GetChildren()) do
-- 	    if v.Name:find("Hoho") then
-- 	        v:Destroy()
-- 	    end
-- 	end
-- elseif ExecutorName:find("Seli") then -- Seliware
-- 	local rgenv = getrenv()
-- 	local renv = getrawmetatable(rgenv).__index
-- 	for i,v in next, renv do
-- 		rgenv[i] = v
-- 	end
-- end

-- cloneref
-- local a=Instance.new("Part")for b,c in pairs(getreg())do if type(c)=="table"and#c then if rawget(c,"__mode")=="kvs"then for d,e in pairs(c)do if e==a then getgenv().InstanceList=c;break end end end end end;local f={}function f.invalidate(g)if not InstanceList then return end;for b,c in pairs(InstanceList)do if c==g then InstanceList[b]=nil;return g end end end;if not cloneref then getgenv().cloneref=f.invalidate end
-- require
-- if clonefunction and getrenv and getidentity and setidentity then local a=clonefunction(getrenv().require)getgenv().require=function(...)local b=getidentity()setidentity(1)local c=a(...)setidentity(b)return c end end

local notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Notification.lua"))()

-- if _G.HohoVersion == "v3" or _G["Fumo Blox Fruit - HoHo Hub Kaitun V3"] or _G["HoHo Hub Auto Bounty V3"] or _G["HoHo Fruits Collector"] or _G.HOHO_PVP_UI or _G.HOHO_SERVER_ID then
	-- return loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HohoV2/Free/BloxFruitFreeV3.lua"))()
-- end

-- _G.HOHO_AD = {
-- 	[1] = {link="https://gcdnb.pbrd.co/images/AVitm37MSdIY.png", exp=tick()+9999, read = "https://discord.gg/CWvQUcfr25"},
-- }
local list = {
	--Adopt Me
	[383310974] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/refs/heads/Free/AdoptMe.lua'))()",
	
	--GO FISHING
	[6764180126] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/refs/heads/Free/GOFISHING.lua'))()",
	
	--Fisch
	[5750914919] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/refs/heads/Free/Fisch.lua'))()",
	
	--Pet Catchers
	[5686465822] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/PetCatchers.lua'))()",
	
	--Slap Battles
	[2380077519] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/SlapBattles.lua'))()",
	
	--Sol's RNG
	[5361032378] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/SolRNG.lua'))()",
	
	--The Strongest Battlegrounds
	[3808081382] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/TheStrongestBattleground.lua'))()",
	
	--DOORS
	[2440500124] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/Doors.lua'))()",
	
	--BLADE BALL
	[4777817887] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/BladeBall.lua'))()",
	
	--HONKAI STAR RAIL SIMULATOR
	[5477548919] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/HonkaiStarRailSimulator.lua'))()",
	
	--BedWars
	[2619619496] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/GAME/main/bedwar.txt'))()",

	--Element Battle Ground
	[224422602] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/elementBattlegr.lua'))()",

	--King Legacy
	[1451439645] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/KingLegacyFree.lua'))()",

	--Blox Fruit
	[994732206] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/main/BloxFruit/BloxFruitTEST_ONLY.lua'))()",

	--Pet Simulator X
	[2316994223] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/PetSimXFree.lua'))()",

	--Zombie Attack
	[504035427]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/ZombieAtack.lua'))()",

	--Two Piece
	[5303541547]="loadstring(game:HttpGet('https://raw.githubusercontent.com/AlongNgu/alonebruh/main/twoPiecehoho.lua'))()",

	--Dungeon Quest
	[848145103]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/Paid/DunegonQuest.lua'))()",

	--Tradelands
	[92096286]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/TradeLands.lua'))()",

	--Anime Fighters Simulator
	[2324662457]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/anime%20fighters%20simulator.lua'))()",

	--Arsenal
	[111958650]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/Arsenal.lua'))()",

	--Break In
	[1318971886]="loadstring(game:HttpGet('https://pastebin.com/raw/xUGJt9Ry', true))()",

	--Tower of Hell
	[703124385]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/TowerOfHell.lua'))()",

	--steve's one piece
	[741590026]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/SteveOnePiece.lua'))()",

	--Murder Mystery 2
	[66654135]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/GAME/main/muder%20mys..2.txt'))()",

	--Giant Survival!
	[1342991001]="loadstring(game:HttpGet('https://pastebin.com/raw/zABEESgr', true))()",

	--Field Trip Z
	[1701332290]="loadstring(game:HttpGet('https://pastebin.com/raw/aY7Z3Nd3', true))()",

	--Mad City
	[498490399]="loadstring(game:HttpGet('https://pastebin.com/raw/EwnNCfin', true))()",

	--vn piece
	[1493595237]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/vn%20Piece%20script-obfuscated.lua', true))()",
	
	--Ro Fruit
	[3904583189]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/RoFruitFree.lua', true))()",

	--Collect All Pets
	[3359505957]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/CollectAllPetsFree.lua', true))()",
	
	--GPO
	[648454481]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/GPOFree.lua', true))()",

	--Anime Defense Simulator
	[4205109410]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/AnimeDefenseSimulatorFree.lua', true))()",

	--Anime Soul Simulator
	[4098816381]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/AnimeSoulSimulatorFree.lua', true))()",
}
-- local listPre = {
-- 	--HONKAI STAR RAIL SIMULATOR
-- 	[5477548919] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/HonkaiStarRailSimulator.lua'))()",
	
-- 	--BedWars
-- 	[2619619496] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/GAME/main/bedwar.txt'))()",

-- 	--Element Battle Ground
-- 	[224422602] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/elementBattlegr.lua'))()",

-- 	--King Legacy
-- 	[1451439645] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Pre/KingLegacyPre.lua'))()",

-- 	--Blox Fruit
-- 	[994732206] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/main/BloxFruit/BloxFruitTEST_ONLY.lua'))()",

-- 	--Pet Simulator X
-- 	[2316994223] = "loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Free/PetSimXFree.lua'))()",

-- 	--Zombie Attack
-- 	[504035427]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/ZombieAtack.lua'))()",

-- 	--Two Piece
-- 	[5303541547]="loadstring(game:HttpGet('https://raw.githubusercontent.com/AlongNgu/alonebruh/main/twoPiecehoho.lua'))()",

-- 	--Dungeon Quest
-- 	[848145103]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/Paid/DunegonQuest.lua'))()",

-- 	--Tradelands
-- 	[92096286]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/TradeLands.lua'))()",

-- 	--Anime Fighters Simulator
-- 	[2324662457]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/anime%20fighters%20simulator.lua'))()",

-- 	--Arsenal
-- 	[111958650]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/Arsenal.lua'))()",

-- 	--Break In
-- 	[1318971886]="loadstring(game:HttpGet('https://pastebin.com/raw/xUGJt9Ry', true))()",

-- 	--Tower of Hell
-- 	[703124385]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/TowerOfHell.lua'))()",

-- 	--steve's one piece
-- 	[741590026]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/SteveOnePiece.lua'))()",

-- 	--Murder Mystery 2
-- 	[66654135]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/GAME/main/muder%20mys..2.txt'))()",

-- 	--Giant Survival!
-- 	[1342991001]="loadstring(game:HttpGet('https://pastebin.com/raw/zABEESgr', true))()",

-- 	--Field Trip Z
-- 	[1701332290]="loadstring(game:HttpGet('https://pastebin.com/raw/aY7Z3Nd3', true))()",

-- 	--Mad City
-- 	[498490399]="loadstring(game:HttpGet('https://pastebin.com/raw/EwnNCfin', true))()",

-- 	--vn piece
-- 	[1493595237]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/SCRIPTS/vn%20Piece%20script-obfuscated.lua', true))()",
	
-- 	--Ro Fruit
-- 	[3904583189]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Pre/RoFruitPre.lua', true))()",
	
-- 	--Collect All Pets
-- 	[3359505957]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Pre/CollectAllPetsPre.lua', true))()",
	
-- 	--GPO
-- 	[648454481]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Pre/GPOPre.lua', true))()",

-- 	--Anime Defense Simulator
-- 	[4205109410]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Pre/AnimeDefenseSimulatorPre.lua', true))()",
	
-- 	--Anime Soul Simulator
-- 	[4098816381]="loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/Pre/AnimeSoulSimulatorPre.lua', true))()",
-- }
-- _G.GameSupport = {"Pet Simulator X","GPO - Grand Piece Online","Blox Fruit","King Legacy","Anime Soul Simulator","Anime Defense Simulator","Ro Fruit","Collect All Pets","Tower of Hell","Break In","Arsenal","Mad City","Viet Nam Piece","Field Trip Z","Giant Survival!","Murder Mystery 2","steve's one piece","Anime Fighters Simulator","Tradelands","Dungeon Quest","Two Piece"}
_G.HoHoLoaded = true
-- _G.MY_KEY_IS = "No_Key"
if script_key then
	_G.MY_KEY_IS = script_key
end

-- spawn(function()
--     local function CoreGuiAdd(a)local b,c=pcall(function()a.Parent=gethui()end)if c then warn("failed to add",a.Name,"to gethui!")local b,c=pcall(function()a.Parent=game.CoreGui end)if c then a.DisplayOrder=100000;a.ResetOnSpawn=false;a.Parent=game.Players.LocalPlayer:WaitForChild("PlayerGui")warn("failed to add",a.Name,"to coregui!")end end end

--     local function CreateGroupAds()
--         local GroupAds = {}
--         local ADS = Instance.new("ScreenGui")
--         local Back = Instance.new("Frame")
--         local Label = Instance.new("TextLabel")
--         local UIStroke = Instance.new("UIStroke")
--         local Close = Instance.new("TextButton")
--         local UIStroke_1 = Instance.new("UIStroke")
--         local Inner = Instance.new("Frame")
--         local UIGridLayout = Instance.new("UIGridLayout")
--         local UIPadding = Instance.new("UIPadding")
    
--         ADS.Name = "ADS"
--         ADS.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
--         CoreGuiAdd(ADS)
    
--         Back.BorderSizePixel = 0
--         Back.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
--         Back.Size = UDim2.new(0.9, 0, 0.5, 0)
--         Back.BorderColor3 = Color3.fromRGB(0, 0, 0)
--         Back.Name = "Back"
--         Back.Position = UDim2.new(0, 0, 0.62406, 0)
--         Back.Parent = ADS
    
--         Label.TextWrapped = true
--         Label.BorderSizePixel = 0
--         Label.TextScaled = true
--         Label.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
--         Label.FontFace = Font.new("rbxasset://fonts/families/HighwayGothic.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
--         Label.Position = UDim2.new(0, 0, -0.0666667, 0)
--         Label.Name = "Label"
--         Label.TextSize = 14
--         Label.Size = UDim2.new(1, 0, 0.07, 0)
--         Label.ZIndex = 2
--         Label.TextColor3 = Color3.fromRGB(0, 0, 0)
--         Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
--         Label.Text = "HOHO ADS (contact discrod.gg/hohohub) (auto close when 60s)"
--         Label.Parent = Back
    
--         UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
--         UIStroke.Parent = Label
    
--         Close.TextWrapped = true
--         Close.ZIndex = 2
--         Close.BorderSizePixel = 0
--         Close.TextScaled = true
--         Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
--         Close.Position = UDim2.new(0.961977, 0, -0.0666667, 0)
--         Close.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
--         Close.Name = "Close"
--         Close.TextSize = 14
--         Close.Size = UDim2.new(0.03, 0, 0.1, 0)
--         Close.TextColor3 = Color3.fromRGB(255, 255, 255)
--         Close.BorderColor3 = Color3.fromRGB(255, 0, 0)
--         Close.Text = "X"
--         Close.Parent = Back
    
--         UIStroke_1.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
--         UIStroke_1.Parent = Close
    
--         Inner.BorderSizePixel = 0
--         Inner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--         Inner.Size = UDim2.new(1, 0, 0, 0.5)
--         Inner.BorderColor3 = Color3.fromRGB(0, 0, 0)
--         Inner.BackgroundTransparency = 1
--         Inner.Name = "Inner"
--         Inner.Parent = Back
    
--         UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
--         UIGridLayout.CellSize = UDim2.new(0, 250, 0, 250)
--         UIGridLayout.Parent = Inner
    
--         UIPadding.PaddingLeft = UDim.new(0.025, 0)
--         UIPadding.Parent = Inner
        
--         Close.MouseButton1Click:Connect(function()
--             game.Debris:AddItem(ADS, 0)
--         end)
        
--         game.Debris:AddItem(ADS, 60)
        
--         function GroupAds:CreateAds(Image, Link)
--             local ImageButton = Instance.new("ImageButton")
--             ImageButton.Parent = Inner
--             ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
--             ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
--             ImageButton.BorderSizePixel = 0
--             ImageButton.Size = UDim2.new(0, 100, 0, 100)
--             ImageButton.Image = Image
--             ImageButton.HoverImage = "http://www.roblox.com/asset/?id=3229099135"
            
--             ImageButton.MouseButton1Click:Connect(function()
--                 game:GetService("StarterGui"):SetCore("SendNotification",{
--                     Title = "HOHO ADS", -- Required
--                     Text = "Ads copied to your clipboard!",
--                     Icon = Image
--                 })
--                 setclipboard(Link)
--             end)
--         end
        
--         return GroupAds
--     end
    
--     local function GetImage(name, url)
--         local path = name .. ".png"
--         if not isfile(path) then
--             local content = game:HttpGet(url)
--             writefile(path, content)
--         end
--         return getcustomasset(path)
--     end
    
--     -- local GroupADS = CreateGroupAds()
--     -- GroupADS:CreateAds(GetImage("accbloxnet", "https://i.imgur.com/4fhvSM3.png"), "https://accblox.net/")
--     -- GroupADS:CreateAds(GetImage("hohodiscord", "https://i.imgur.com/e2fdiZD.png"), "https://discord.gg/hohohub")
-- end)

notify.New("for invalid/no key found try to extend key time/get another key", 30)
-- notify.New("This is not a bug announce, just a notify for some1 don't know!", 30)
-- notify.New("If script is not load, try to use VPN or CHANGE EXECUTOR!", 30)

if list[game.GameId] ~= nil then
	loadstring(list[tonumber(game.GameId)])()
else
	notify.New("This game is not supported by hohohub :(", 60)
	notify.New("Please join discord.gg/hohohub to check what game r supported by us!", 60)
	notify.New("Running HoHo Universal Script!", 60)
	if game:GetService("CoreGui"):FindFirstChild("Hоhо_раssсhесk") then
		game:GetService("CoreGui"):FindFirstChild("Hоhо_раssсhесk"):Destroy()
	end
	_G.loadCustomId = "b358ee69695f62450471edf52317559a"
	loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
end
-- if _G["HoHo Hub Auto Bounty V3"] or _G["Fumo Blox Fruit - HoHo Hub Kaitun V3"] then return end
-- local path = "wait(5);loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HohoV2/main/ScriptLoad.lua'))()"
-- if getgenv().Key then
-- 	path = "getgenv().Key = '"..getgenv().Key.."'\n"..path
-- end
-- local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
-- queueteleport(path)
