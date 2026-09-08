--[[
smart boy came here without buying early access 🥶
]]--


--[[
  _________ __                  ___________                        ________       __ 
 /   _____/|  | _____  ______   \_   _____/____ _______  _____    /  _____/ __ __|__|
 \_____  \ |  | \__  \ \____ \   |    __) \__  \\_  __ \/     \  /   \  ___|  |  \  |
 /        \|  |__/ __ \|  |_> >  |     \   / __ \|  | \/  Y Y  \ \    \_\  \  |  /  |
/_______  /|____(____  /   __/   \___  /  (____  /__|  |__|_|  /  \______  /____/|__|
        \/           \/|__|          \/        \/            \/          \/          



___.                                                  ____________  ________     _____    
\_ |__ ___.__.        ____   ____ ___  ___ __________/_   \_____  \ \_____  \   /  |  |   
 | __ <   |  |       /    \_/ __ \\  \/  // __ \_  __ \   |/  ____/   _(__  <  /   |  |_  
 | \_\ \___  |      |   |  \  ___/ >    <\  ___/|  | \/   /       \  /       \/    ^   /  
 |___  / ____|      |___|  /\___  >__/\_ \\___  >__|  |___\_______ \/______  /\____   |   
     \/\/                \/     \/      \/    \/                  \/       \/      |__| 

Slap Farm Gui.

Owned by Nexer1234.

Everything is mine, i did not borrow or skid anything to make this script.
]]--


--[[
Using coregui, but if executor can't access coregui, workspace will be used
]]--
pcall(function()
    local host = game:GetService("CoreGui") or game:GetService("Workspace")
    HintGui = Instance.new("Hint")
    HintGui.Text = "Slap Farm Gui Loading... ( Loading Script )"
    HintGui.Name = "HintGui"
    HintGui.Parent = host
end)


HintGui.Text = "Slap Farm Gui Loading... ( Loading Variables & Functions )"
--[[
Global variables ( and some functions ). The link to script is required for snow farming.
]]--
_G.VerVerVer = "4.4" -- Version here
_G.Link = "https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/SlapFarmGui/Versions/(v4.4).luau" -- Or whatever your link is, this is required for snow farm and other serverhop farms
_G.IsUserPremium = false -- This is responsible for whether the user has a premium or not, don't change it bucko 🤠
_G.IsUserFollowed = false -- This is responsible for whether the user is followed or not, don't change it too
_G.CanSlap = true -- Can slap? ( Bot Mode, Don't set false or bot won't be able to slap :[ )
_G.CanJump = true -- Can jump? ( Bot Mode, Don't set false or bot won't be able to jump :[ )
_G.BotAbility = false -- Standart value of bot configuration
_G.BotSlapDuringRagdoll = false -- Standart value of bot configuration
_G.BotAvoid = false -- Standart value of bot configuration
_G.BotJump = false -- Standart value of bot configuration
_G.BotReg = 8 or "8" -- Standart value of bot configuration
_G.BotIntelligence = "High" -- Standart value of bot configuration
_G.FakeNametag = "Nexer1234_AnotherAlt" -- Standart value of fake nametag
_G.FakeSlaps = 0 or "0" -- Standart value of fake slaps
_G.BlinkMixedBallerPlace = "Default Arena" -- Standart value

function GetPrice(id)
local product_id = tonumber(id) or id
local product_info = game:GetService("MarketplaceService"):GetProductInfo(id)
local product_price = product_info.PriceInRobux
return tostring(product_price)
end

game = game or Ugc -- game itself
--[[
Adding cloneref, only for requiring services
]]--
if not cloneref then
function cloneref(q)
if game:FindService(q.Name) or q.Parent == game or game:GetService(q.Name) then
return q
else
local a = q:Clone()
a.Parent = q.Parent
end
end
end


--[[
Loading module-script. This is absolutely required, or else script will fcking explode! ( script won't work )

It's checking if its snow farm, cuz if it is, there's no need in loading it!
]]--
if _G.SnowFarm ~= true and _G.ErrorFarm ~= true then
HintGui.Text = "Slap Farm Gui Loading... ( Loading Modules )"
local success, error = pcall(function()
NEX = loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Modules/SlapBattlesModuleScript.lua'))()
end)
if not success then

ErrorMessage = error

pcall(function()
local host = game:GetService("CoreGui") or game:GetService("Workspace")
MessageGui = Instance.new("Message")
MessageGui.Text = "Your executor failed loading modules... Please try again!"
MessageGui.Name = "MessageGui"
MessageGui.Parent = host
end)

HintGui.Text = ""..ErrorMessage..""
task.wait(5)
pcall(function()
MessageGui:Destroy()
HintGui:Destroy()
end)
return
end
end


function FreezePlayer()
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
if v and v:IsA("BasePart") then
v.Anchored = true
end
end
end

function UnFreezePlayer()
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
if v and v:IsA("BasePart") then
v.Anchored = false
end
end
end

function BreakVelocity()
local time = tick()
while tick() - time < 1 do
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
if v and v:IsA("BasePart") then
v.Velocity = Vector3.new(0,0,0)
v.RotVelocity = Vector3.new(0,0,0)
end
end
task.wait()
end
end




--[[
Creating gethui function if it doesn't exists yet
]]--
pcall(function()
    local srvc = game:GetService("CoreGui") or game.CoreGui
    if getgenv then
        getgenv().gethui = function() return srvc end
    end
    _G.gethui = function() return srvc end
    gethui = function() return srvc end
end)





--[[
If snow farm variable is true, starting snow serverhop farm.
Idea: Incognito scripts
Creation / Realization: Nexer1234
Upgraded: Nexer1234

Last updated: 15/05/2025 ( dd/mm/yyyy )
]]--

if _G.SnowFarm == true then

-- Editing loading message
pcall(function()
HintGui.Text = "Snow Farm - Farm Started."
end)

local RequireService = cloneref or function(clone) return clone end
local Players = RequireService(game:GetService("Players"))
local ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
local LocalPlayer = Players.LocalPlayer
local Remote = ReplicatedStorage:WaitForChild("SnowHit")
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local LDRST = Players.LocalPlayer.leaderstats
local GLV = LDRST.Glove
GloveValue = function() return GLV.Value end
GetRoot = function(char) local bodypart = char:WaitForChild("HumanoidRootPart") or char:WaitForChild("Torso") or char:WaitForChild("UpperTorso"); return bodypart end

function GetRandomPlayer()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
Timer = 0
repeat task.wait(.1) Timer = Timer + 0.1; RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] if Timer >= 3 then return false end until RandomPlayer ~= Players.LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil
return RandomPlayer
end

if GloveValue() ~= "Snow" then
fireclickdetector(workspace.Lobby.Snow:FindFirstChildWhichIsA("ClickDetector"))
end

-- Loop teleporting to plr
target = GetRandomPlayer()

if target == false then

HintGui.Text = "Snow Farm - No Players Found."

local PlaceID = game.PlaceId
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end
task.wait()
while task.wait() do Teleport() end

else

BreakVelocity()
local start = tick()
while tick() - start < 0.65 do 
if target.Character then
HRP.CFrame = GetRoot(target.Character).CFrame * CFrame.new(0,0,-5)
BreakVelocity()
task.wait()
end
end

end

-- Hides error message
game:GetService("RunService").RenderStepped:Connect(function()
game:GetService("GuiService"):ClearError()
game.CoreGui:WaitForChild("RobloxLoadingGUI"):Destroy()
end)

local SlapCombo = _G.FarmSlapsSnowFarm or 200
for i = 1, SlapCombo do
if target and target.Character then
Remote:FireServer(GetRoot(target.Character))
end
end

local WaitTime = _G.WaitRegisterSnowFarm or 1
task.wait(WaitTime)

local PlaceID = game.PlaceId
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end
task.wait()
while task.wait() do Teleport() end

end







--[[
If error farm variable is true, starting error serverhop farm.
Idea: @.xy5. and @requiem.3434 ( they're on discord )
Creation / Realization: Nexer1234
Upgraded: Nexer1234

Last updated: 15/05/2025  ( dd/mm/yyyy )
]]--

if _G.ErrorFarm == true then

-- Editing loading message
pcall(function()
HintGui.Text = "Error Farm - Farm Started."
end)

local RequireService = cloneref or function(clone) return clone end

local Players = RequireService(game:GetService("Players"))
local ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
local LocalPlayer = Players.LocalPlayer
local Remote = ReplicatedStorage:WaitForChild("Errorhit")
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")
local LDRST = Players.LocalPlayer.leaderstats
SlapsValue = function() return LocalPlayer.leaderstats.Slaps.Value end
GetRoot = function(char) local bodypart = char:WaitForChild("HumanoidRootPart") or char:WaitForChild("Torso") or char:WaitForChild("UpperTorso"); return bodypart end
if workspace:FindFirstChild("Baseplate") then
workspace:FindFirstChild("Baseplate"):Destroy()
end
if workspace:FindFirstChild("Baseplate") == nil then
S = Instance.new("Part")
S.Name = "Baseplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(math.random(-20000,-10000),math.random(-20000,-10000),math.random(-20000,-10000))
S.Size = Vector3.new(2000, 10, 2000)
S.Parent = workspace
S.Color = Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))
end

GetRoot(Character).CFrame = S.CFrame * CFrame.new(0,20,0)
if LDRST.Glove.Value ~= "Blink" then
fireclickdetector(workspace.Lobby.Blink:FindFirstChildWhichIsA("ClickDetector"))
end
task.wait(.55)

ReplicatedStorage.Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until workspace:FindFirstChild("Blink_"..LocalPlayer.Name) and workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart")
task.wait(.2)

if LDRST.Glove.Value ~= "Error" then
fireclickdetector(workspace.Lobby.Error:FindFirstChildWhichIsA("ClickDetector"))
end

oldslapvalue = SlapsValue()
requestedvalue = _G.FarmSlapsErrorFarm or 1000
requiredvalue = SlapsValue() + requestedvalue
totalfarmedvalue = SlapsValue() - oldslapvalue

repeat task.wait()
totalfarmedvalue = SlapsValue() - oldslapvalue
HintGui.Text = "Error Farm - "..totalfarmedvalue.."/"..requestedvalue.." Farmed"
if workspace:FindFirstChild("Blink_"..LocalPlayer.Name) and workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart") then
Remote:FireServer(workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart"))
end
until SlapsValue() == requiredvalue or workspace:FindFirstChild("Blink_"..LocalPlayer.Name) == nil or workspace:FindFirstChild("Blink_"..LocalPlayer.Name):FindFirstChild("HumanoidRootPart") == nil


local PlaceID = game.PlaceId
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end

task.wait()
while task.wait() do Teleport() end

end








--[[
Bypassing anti-cheat.
]]--
HintGui.Text = "Slap Farm Gui Loading... ( Loading Anti-Cheat Bypass )"
pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()
end)


--Booting up rayfield.
HintGui.Text = "Slap Farm Gui Loading... ( Booting Up Library )"
local success, error = pcall(function()
Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if success then
print("Loading New Rayfield...")
elseif not success then
print("Loading Old Rayfield...")
local success, error = pcall(function()
Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
end)
if not success then
HintGui.Text = "Can't boot up rayfield. Error code: "..error
task.wait(5)
HintGui:Destroy()
return
end
end


HintGui.Text = "Slap Farm Gui Loading... ( Loading Window )"
-- creating window
Window = Rayfield:CreateWindow({
   Name = "Slap Farm Gui v".._G.VerVerVer.." - by nexer",
   Icon = 0,    
   LoadingTitle = "Slap Farm Gui",
   LoadingSubtitle = "by nexer, version ".._G.VerVerVer,
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "SlapFarmGui",
      FileName = "SlapFarmGuiConfiguration"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
   KeySettings = {
      Title = "Verify yourself firstly!",
      Subtitle = "Key Needed!",
      Note = "The key is ''cheese''",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"cheese"}
   }
})

-- notification function
function notify(title, content, time, mode)
time = time or 10
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

-- turn table to string. nexer edition 😎 ( ttostring --> tabletostring )
function ttostring(tbl)
    if type(tbl) == "table" then
        local result
        for i, v in ipairs(tbl) do
            result = tostring(v)
            if i < #tbl then
                 result = result .. ", "
            end
        end
        result = result
        return result
    else
        return tbl
    end
end



HintGui.Text = "Slap Farm Gui Loading... ( Loading Components )"
--Checking if we are in dark realm
if workspace:FindFirstChild("bobBoss") then

local DarkRealm = Window:CreateTab("Dark Realm", 98952570395426)

--[[

Dark Realm Slap Farming

]]--

local DarkRealmParagraph = DarkRealm:CreateParagraph({Title = "Total Rating 11/10", Content = "100 slaps/per second"})
local DarkRealmLabel = DarkRealm:CreateLabel("You should play as tycoon or god's hand! ( Tycoon slaps faster than god's hand )")
local DarkRealmFarm = DarkRealm:CreateToggle({
   Name = "Minion Farm",
   CurrentValue = false,
   Callback = function(Value)
_G.DarkRealmFarm = Value
if _G.DarkRealmFarm == true then

-- Yes i know i could've just take glove name from leaderstats, please stop talking about it

if game:GetService("Players").LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") then
for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
if v and v:IsA("Tool") and v.ClassName == "Tool" then
_G.Glove = v.Name
end
end
elseif game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
if v and v:IsA("Tool") and v.ClassName == "Tool" then
_G.Glove = v.Name
end
end
end

repeat task.wait()
if workspace:FindFirstChild("BobClone") then
for i,v in pairs(workspace:GetChildren()) do
if v.Name == "BobClone" then
if _G.Glove == "Killstreak" then
game:GetService("ReplicatedStorage").KSHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
elseif _G.Glove == "Reaper" then
game:GetService("ReplicatedStorage").ReaperHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
elseif _G.Glove == "God's Hand" then
game:GetService("ReplicatedStorage").Godshand:FireServer(v:FindFirstChild("HumanoidRootPart"))
elseif _G.Glove == "Tycoon" then
game:GetService("ReplicatedStorage").GeneralHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
end
end
end
end
until _G.DarkRealmFarm == false

end
   end,
})


-- If we aren't in dark realm, loading regular slap farm gui
else



--[[
Function that generates baseplates
]]--
function GenerateBaseplates()
if workspace:FindFirstChild("Baseplate") then
workspace:FindFirstChild("Baseplate"):Destroy()
end
if workspace:FindFirstChild("Ballerplate") then
workspace:FindFirstChild("Ballerplate"):Destroy()
end
if workspace:FindFirstChild("Baseplate") == nil then
local S = Instance.new("Part")
S.Name = "Baseplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(math.random(-20000,-10000),math.random(-20000,-10000),math.random(-20000,-10000))
S.Size = Vector3.new(2000, 10, 2000)
S.Parent = workspace
S.Color = Color3.new(math.random(0,255),math.random(0,255),math.random(0,255))
end
if workspace:FindFirstChild("Ballerplate") == nil then
local S = Instance.new("Part")
S.Name = "Ballerplate"
S.Anchored = true
S.CanCollide = true
S.Transparency = 0
S.Position = Vector3.new(-950,600,950)
S.Size = Vector3.new(20, 10, 20)
S.Parent = workspace
end
end
GenerateBaseplates()


--[[
Main Configuration & Functions

FirePrompt(Instance) - Fires proximity prompt
Example: FirePrompt(Workspace.Part.ProximityPrompt)

RequireService(Service) - Requires service
Example: RequireService(game:GetService("Workspace"))

BlockInstance(Instance) - Blocks Instance
Example: BlockInstance(Workspace.Part) or BlockInstance(ReplicatedStorage.Remote) and etc.

ScanChildren(parent, name) - Scans all children

ScanDescendant(parent, name) - Scans all descendants

BallerPlace - Place where you can spawn ballers safely

Baseplate - safe spot

SecretPlace - hunter room roof

]]--

BigNumber = 9e9 or math.huge or 5000000
RequireService = cloneref or function(clone) return clone end
FirePrompt = function(instance) if instance and instance:IsA("ProximityPrompt") and fireproximityprompt then instance.HoldDuration = 0; instance.RequiresLineOfSight = false; instance.MaxActivationDistance = BigNumber; fireproximityprompt(instance) end end
BlockInstance = function(ez) ez.Name = "BlockedInstance_"..math.random(0,500000).."" ez.Parent = RequireService(game:GetService("LogService")) ez:Destroy() end
Workspace = RequireService(game:GetService("Workspace"))
ReplicatedStorage = RequireService(game:GetService("ReplicatedStorage"))
Players = RequireService(game:GetService("Players"))
PathService = RequireService(game:GetService("PathfindingService"))
PlayerName = Players.LocalPlayer.Name
LogService = RequireService(game:GetService("LogService"))
CoreGui = RequireService(game:GetService("CoreGui"))
ScanChildren = function(ServiceToScanIn, ScanName) if ServiceToScanIn and ScanName then for i,v in pairs(ServiceToScanIn:GetChildren()) do if v and v.Name:find(ScanName) or v.Name:match(ScanName) then return v end end end end
ScanDescendant = function(ServiceToScanIn, ScanName) if ServiceToScanIn and ScanName then for i,v in pairs(ServiceToScanIn:GetDescendants()) do if v and v.Name:find(ScanName) or v.Name:match(ScanName) then return v end end end end
SecretPlace = CFrame.new(17895, -20, -3561)
BallerPlace = Workspace.Ballerplate.CFrame * CFrame.new(0,10,0)
Baseplate = Workspace.Baseplate.CFrame * CFrame.new(0,10,0)

--[[

All module-script functions!

NEX:HasCharacter(player) -- Checks if player have character

NEX:HasRoot(char) -- Checks if player have root part

NEX:HasHumanoid(char) -- Checks if player have humanoid

NEX:GetCharacter(player) -- Returns player character

NEX:GetRoot(char) -- Returns player root part

NEX:GetHumanoid(char) -- Returns player humanoid

NEX:SetCFrame(part, position, higher, height) -- Sets cframe of anything
Example: ModuleScript:SetCFrame(ModuleScript:GetRoot(ModuleScript:GetCharacter(Players.LocalPlayer)), CFrame.new(0,0,0), true, 50)

NEX:Kill(humanoid) -- Kills any entity except players but including you

NEX:Reset(waiting, time) -- Resets player

NEX.GetLeaderstats() -- Returns leaderstats folder

NEX.GetSlaps() -- Returns your current slaps value

NEX.GetGlove() -- Returns your current glove value

NEX:EquipGlove(glove, time) -- Equips glove

NEX:EnterPortal(portal, time) -- Enters portal
Example: ModuleScript:NEX:EnterPortal("Teleport1")

List of portals:
"Teleport1" = normal arena
"Teleport2" = default arena

NEX.RandomGlove() -- Returns random glove you have

NEX:HasGlove(glove) -- Checks if player have glove. Returns either false or true

NEX:Slap(args, mode) -- Slaps { literally }

Example: ModuleScript:NEX:Slap({[1]=Players.LocalPlayer.Character.HumanoidRootPart;[2]=true;})

NEX:SetDB(boolval) -- Sets death barrier mode ( false is disable and true is enable )

]]--


--[[

Those are functions for bot.
If you ask me why the fuck i created that many functions when i could just put it all in one function...
Well don't ask me why

]]--

-- random player
function GetRandomPlayer()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
repeat task.wait() RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] until RandomPlayer ~= Players.LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil
return RandomPlayer
end
-- random unsafe player
function random()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
repeat task.wait() RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] until RandomPlayer ~= Players.LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("HumanoidRootPart")
return RandomPlayer
end
-- closest to you player ( and in arena and that can be slapped )
function closest()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil then
repeat task.wait()
until Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end
lws = math.huge
for _,RandomPlayer in pairs(Players:GetPlayers()) do
if RandomPlayer and RandomPlayer ~= Players.LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("RobTransformed") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("Torso") and RandomPlayer.Character.Torso:FindFirstChild("BuddyBox") == nil and RandomPlayer.Character:FindFirstChild("Head") and RandomPlayer.Character.Head:FindFirstChild("ScreamParticles") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoDraw4Card") == nil and RandomPlayer.Character.Head.BrickColor ~= "New Yeller" and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlockedShield") == nil and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("entered") then
pos = RandomPlayer:DistanceFromCharacter(Players.LocalPlayer.Character.HumanoidRootPart.Position)
if pos < lws then
plr = RandomPlayer
lws = pos
end
end
end
return plr
end
-- closest to you player ( and in arena and that can be slapped, plus without one-shot gloves )
function closestsafe()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") == nil then
repeat task.wait()
until Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end
lws = math.huge
for _,RandomPlayer in pairs(Players:GetPlayers()) do
if RandomPlayer and RandomPlayer ~= Players.LocalPlayer and RandomPlayer:FindFirstChild("leaderstats") and RandomPlayer.leaderstats:FindFirstChild("Glove") and RandomPlayer.leaderstats.Glove.Value ~= "Error" and RandomPlayer.leaderstats.Glove.Value ~= "OVERKILL" and RandomPlayer.leaderstats.Glove.Value ~= "Killstreak" and RandomPlayer.leaderstats.Glove.Value ~= "Reaper" and RandomPlayer.leaderstats.Glove.Value ~= "God's Hand" and RandomPlayer.leaderstats.Glove.Value ~= "The Flex" and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("RobTransformed") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("Head") and RandomPlayer.Character.Head:FindFirstChild("ScreamParticles") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoDraw4Card") == nil and RandomPlayer.Character.Head.BrickColor ~= "New Yeller" and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlockedShield") == nil and RandomPlayer.Character:FindFirstChild("Torso") and RandomPlayer.Character.Torso:FindFirstChild("BuddyBox") == nil and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("entered") then
pos = RandomPlayer:DistanceFromCharacter(Players.LocalPlayer.Character.HumanoidRootPart.Position)
if pos < lws then
plr = RandomPlayer
lws = pos
end
end
end
return plr
end
-- random closest & safe player
function randomthattclose()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
repeat task.wait() if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("entered") == nil and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then task.wait(.5) repeat task.wait() Players.LocalPlayer.Character.Humanoid.WalkToPoint = workspace.Lobby["Teleport1"].Position until Players.LocalPlayer.Character:FindFirstChild("entered") end RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] until closest() == RandomPlayer and RandomPlayer ~= Players.LocalPlayer and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("RobTransformed") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("Head") and RandomPlayer.Character.Head:FindFirstChild("ScreamParticles") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoDraw4Card") == nil and RandomPlayer.Character.Head.BrickColor ~= "New Yeller" and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil and RandomPlayer.Character:FindFirstChild("Torso") and RandomPlayer.Character.Torso:FindFirstChild("BuddyBox") == nil and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlockedShield") == nil and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("entered")
return RandomPlayer
end
-- random closest safe player with no one-shots
function randomthattcloseandsafe()
local AllPlayers = Players:GetChildren()
local RandomPlayer = AllPlayers[math.random(1, #AllPlayers)]
repeat task.wait() if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("entered") == nil and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") then task.wait(.5) repeat task.wait() Players.LocalPlayer.Character.Humanoid.WalkToPoint = workspace.Lobby["Teleport1"].Position until Players.LocalPlayer.Character:FindFirstChild("entered") end RandomPlayer = AllPlayers[math.random(1, #AllPlayers)] until closestsafe() == RandomPlayer and RandomPlayer ~= Players.LocalPlayer and RandomPlayer:FindFirstChild("leaderstats") and RandomPlayer.leaderstats:FindFirstChild("Glove") and RandomPlayer.leaderstats.Glove.Value ~= "Error" and RandomPlayer.leaderstats.Glove.Value ~= "OVERKILL" and RandomPlayer.leaderstats.Glove.Value ~= "Killstreak" and RandomPlayer.leaderstats.Glove.Value ~= "Reaper" and RandomPlayer.leaderstats.Glove.Value ~= "God's Hand" and RandomPlayer.leaderstats.Glove.Value ~= "The Flex" and RandomPlayer.Character and RandomPlayer.Character:FindFirstChild("entered") and RandomPlayer.Character:FindFirstChild("rock") == nil and RandomPlayer.Character:FindFirstChild("RobTransformed") == nil and RandomPlayer.Character:FindFirstChild("stevebody") == nil and RandomPlayer.Character:FindFirstChild("Ragdolled").Value == false and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid") and RandomPlayer.Character:FindFirstChildWhichIsA("Humanoid").Health ~= 0 and RandomPlayer.Character:FindFirstChild("Torso") and RandomPlayer.Character.Torso:FindFirstChild("BuddyBox") == nil and RandomPlayer.Character:FindFirstChild("Head") and RandomPlayer.Character.Head:FindFirstChild("ScreamParticles") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoReverseCard") == nil and RandomPlayer.Character.Head:FindFirstChild("UnoDraw4Card") == nil and RandomPlayer.Character.Head.BrickColor ~= "New Yeller" and RandomPlayer.Character:FindFirstChild("HumanoidRootPart") and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlackheartREAL") == nil and RandomPlayer.Character.HumanoidRootPart:FindFirstChild("BlockedShield") == nil and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("entered")
return RandomPlayer
end
-- functions
SlapWithCooldown = function(args, mode) if Players.LocalPlayer.Character then if Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") then Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool").Parent = Players.LocalPlayer.Character task.wait(.1) end if Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") == nil and Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") == nil then return end if _G.CanSlap == true then _G.CanSlap = false pcall(function() Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.Slap, Players.LocalPlayer.Character.Humanoid):Play() end) pcall(function() NEX:Slap(args, mode) end) pcall(function() NEX:Slap(unpack(args), mode) end) task.delay(0.9, function() _G.CanSlap = true end) end end end
JumpWithCooldown = function() if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") and _G.CanJump then Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping); _G.CanJump = false; task.delay(0.9, function() _G.CanJump = true end) end end

--[[
Creating Tabs!
(skibidi)
]]--

local Recommends = Window:CreateTab("Recommended", 98952570395426)
local AutoFarm = Window:CreateTab("Auto-Farm", 98952570395426)
local ServerHopFarm = Window:CreateTab("ServerHop-Farm", 98952570395426)
local AnyGlove = Window:CreateTab("Any Glove", 98952570395426)
local Dual = Window:CreateTab("Dual", 98952570395426)
local Replica = Window:CreateTab("Replica", 98952570395426)
local Engineer = Window:CreateTab("Engineer", 98952570395426)
local Cherry = Window:CreateTab("Cherry", 98952570395426)
local Baller = Window:CreateTab("Baller", 98952570395426)
local Blink = Window:CreateTab("Blink", 98952570395426)
local Ferryman = Window:CreateTab("Ferryman", 98952570395426)
local DarkRealm = Window:CreateTab("Dark Realm", 98952570395426)
local Error = Window:CreateTab("Error", 98952570395426)
local Mixed = Window:CreateTab("Mixed", 98952570395426)

--[[

Auto Reccomendation

]]--


local Label = Recommends:CreateLabel("There's will appear farms that recommended to you! { Depends on your amount of slaps }")

local SLabel = Recommends:CreateLabel("For more efficient and almost no slap-required farms, go to auto-farm section!")

local RecommendsSlappleFarm = Recommends:CreateToggle({
   Name = "Auto-Farm Slapple's",
   CurrentValue = false,
   Callback = function(Value)
_G.RecommendsSlappleFarm = Value
if _G.RecommendsSlappleFarm == true then
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("entered") then
for i,v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
if v.Name == "Slapple" or v.Name == "GoldenSlapple" and NEX:HasCharacter(Players.LocalPlayer) and NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) and NEX:GetCharacter(Players.LocalPlayer):FindFirstChild("entered") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
v.Glove.CFrame = NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame -- Doing this cuz not every executor support firetouchinterest
end
end
end


until _G.RecommendsSlappleFarm == false
end
   end,
})

if NEX.GetSlaps() < 4000 then

if NEX.GetSlaps() < 666 then

local RecommendsDualAdminParagraph = Recommends:CreateParagraph({Title = "Total Rating 2/10", Content = "2 slaps/per second"})
local RecommendsDualAdminFarm = Recommends:CreateToggle({
   Name = "Dual + Admin Invisibility",
   CurrentValue = false,
   Callback = function(Value)
_G.RecommendsDualAdminFarm = Value
if _G.RecommendsDualAdminFarm == true then
if NEX:HasGlove("Dual") ~= true then
RecommendsDualAdminFarm:Set(false)
notify("Error!", "You don't have dual glove.", 10, false)
return
end

NEX:SetDB(false)
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= .5 then
game:GetService("ReplicatedStorage").AdminAbility:FireServer("Invisibility")
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= .5 then
game:GetService("ReplicatedStorage").AdminAbility:FireServer("Invisibility")
end
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.RecommendsDualAdminFarm == false
NEX:SetDB(true)
end
   end,
})

elseif NEX.GetSlaps() >= 666 then

local RecommendsDualGhostParagraph = Recommends:CreateParagraph({Title = "Total Rating: 3/10", Content = "2 slaps/per second"})
local RecommendsDualGhostFarm = Recommends:CreateToggle({
   Name = "Dual + Ghost",
   CurrentValue = false,
   Callback = function(Value)
_G.RecommendsDualGhostFarm = Value
if _G.RecommendsDualGhostFarm == true then
if NEX:HasGlove("Ghost") ~= true then
RecommendsDualGhostFarm:Set(false)
notify("Error!", "You don't have ghost glove.", 10, false)
return
end

NEX:SetDB(false)
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= 1 then
if NEX.GetGlove() ~= "Ghost" then
NEX:EquipGlove("Ghost")
end
game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
task.wait(.3)
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.RecommendsDualGhostFarm == false
NEX:SetDB(true)
end
   end,
})

end

elseif NEX.GetSlaps() < 19000 then

local RecommendsReplicaDualParagraph = Recommends:CreateParagraph({Title = "Total Rating 6/10", Content = "4 slaps/per second"})
local RecommendsReplicaDualFarm = Recommends:CreateToggle({
   Name = "Replica + Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.RecommendsReplicaDualFarm = Value
if _G.RecommendsReplicaDualFarm == true then
if NEX:HasGlove("Replica") ~= true then
RecommendsReplicaDualFarm:Set(false)
notify("Error!", "You don't have replica glove.", 10, false)
return
end

repeat task.wait()

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX.GetGlove() ~= "Replica" then
NEX:EquipGlove("Replica")
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
end

local remote = ScanChildren(ReplicatedStorage, "Duplicate")
remote:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Å"..PlayerName)
task.wait()
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end

repeat task.wait(.05) if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.RecommendsReplicaDualFarm == false

until _G.RecommendsReplicaDualFarm == false
end
   end,
})

elseif NEX.GetSlaps() < 38000 then

local RecommendsBallerDualParagraph = Recommends:CreateParagraph({Title = "Total Rating 7/10", Content = "4 slaps/per second"})
local RecommendsBallerDualFarm = Recommends:CreateToggle({
   Name = "Baller + Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.RecommendsBallerDualFarm = Value
if _G.RecommendsBallerDualFarm == true then
    
if NEX:HasGlove("Baller") ~= true then
RecommendsBallerDualFarm:Set(false)
notify("Error!", "You don't have baller glove.", 10, false)
return
end

repeat task.wait()

if NEX.GetGlove() ~= "Baller" then
NEX:EquipGlove("Baller")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:EnterPortal("Teleport2")

game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
task.wait(.5)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end

local Baller = ScanChildren(Workspace, "ÅBaller"..PlayerName)
repeat task.wait() if Baller and Baller:FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Baller:FindFirstChild("HumanoidRootPart")}) end until Baller == nil or Baller:FindFirstChild("HumanoidRootPart") == nil or _G.RecommendsBallerDualFarm == false

until _G.RecommendsBallerDualFarm == false
end
   end,
})

elseif NEX.GetSlaps() < 50000 then

local RecommendsBlinkDualParagraph = Recommends:CreateParagraph({Title = "Total Rating 8/10", Content = "4 slaps/per second"})
local RecommendsBlinkDualFarm = Recommends:CreateToggle({
   Name = "Blink + Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.RecommendsBlinkDualFarm = Value
if _G.RecommendsBlinkDualFarm == true then
    
if NEX:HasGlove("Blink") ~= true then
RecommendsBlinkDualFarm:Set(false)
notify("Error!", "You don't have blink glove.", 10, false)
return
end

repeat task.wait()
if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")
task.wait()
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end
repeat task.wait() if ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.RecommendsBlinkDualFarm == false
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)
until _G.RecommendsBlinkDualFarm == false

end
   end,
})

elseif NEX.GetSlaps() >= 50000 then

local RecommendsErrorLabel = Recommends:CreateLabel("Special thanks to @.xy5. and @requiem.3434, the founders of this method!")
local RecommendsBlinkErrorWarningParagraph = Recommends:CreateParagraph({Title = "Warning!", Content = "After turning farm on, your ping may increase up to 800000 ( but you're not going to get kicked )"})
local RecommendsBlinkErrorParagraph = Recommends:CreateParagraph({Title = "Total Rating 10/10", Content = "30 slaps/per second"})
local RecommendsBlinkErrorFarm = Recommends:CreateToggle({
   Name = "Blink + Error",
   CurrentValue = false,
   Callback = function(Value)
_G.RecommendsBlinkErrorFarm = Value
if _G.RecommendsBlinkErrorFarm == true then
    
if NEX:HasGlove("Error") ~= true then
RecommendsBlinkErrorFarm:Set(false)
notify("Error!", "You don't have error glove.")
return
end

repeat task.wait()
if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")
task.wait()
if NEX.GetGlove() ~= "Error" then
NEX:EquipGlove("Error")
end
repeat task.wait() if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.RecommendsBlinkErrorFarm == false
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)
until _G.RecommendsBlinkErrorFarm == false

end
   end,
})

end

--[[

Auto-Farm

]]--

local SlappleFarm = AutoFarm:CreateToggle({
   Name = "Auto-Farm Slapple's",
   CurrentValue = false,
   Callback = function(Value)
_G.SlappleFarm = Value
if _G.SlappleFarm == true then
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("entered") then
for i,v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
if v.Name == "Slapple" or v.Name == "GoldenSlapple" and NEX:HasCharacter(Players.LocalPlayer) and NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) and NEX:GetCharacter(Players.LocalPlayer):FindFirstChild("entered") and v:FindFirstChild("Glove") and v.Glove:FindFirstChildWhichIsA("TouchTransmitter") then
v.Glove.CFrame = NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame -- Doing this cuz not every executor support firetouchinterest
end
end
end


until _G.SlappleFarm == false
end
   end,
})

local NPCLabel = AutoFarm:CreateLabel("Auto-Slap Replica/Baller/Blink is added to farm with your alts. Example: You spawn baller on your main, and turn enable this feature on your alt, and your alt will earn slaps")

local NPCFarm = AutoFarm:CreateToggle({
   Name = "Auto-Slap Replica/Cherry/Baller/Blink",
   CurrentValue = false,
   Callback = function(Value)
_G.NPCFarm = Value
if _G.NPCFarm == true then
repeat task.wait(.03)

if ScanChildren(Workspace, "Å") and ScanChildren(Workspace, "Å"):FindFirstChild("HumanoidRootPart") then
NEX:Slap({[1]=ScanChildren(Workspace, "Å"):FindFirstChild("HumanoidRootPart")})
end
if Workspace:FindFirstChild("cherry_storage") and ScanChildren(Workspace["cherry_storage"], "Cherry ") and ScanChildren(Workspace["cherry_storage"], "Cherry "):FindFirstChild("HumanoidRootPart") then
NEX:Slap({[1]=ScanChildren(Workspace["cherry_storage"], "Å"):FindFirstChild("HumanoidRootPart")})
end
if ScanChildren(Workspace, "ÅBaller") and ScanChildren(Workspace, "ÅBaller"):FindFirstChild("HumanoidRootPart") then
NEX:Slap({[1]=ScanChildren(Workspace, "ÅBaller"):FindFirstChild("HumanoidRootPart")})
end
if ScanChildren(Workspace, "Blink_") and ScanChildren(Workspace, "Blink_"):FindFirstChild("HumanoidRootPart") then
NEX:Slap({[1]=ScanChildren(Workspace, "Blink_"):FindFirstChild("HumanoidRootPart")})
end


until _G.NPCFarm == false
end
   end,
})

local ServerHopFarmLabel = ServerHopFarm:CreateLabel("ServerHop Farms! [ Safe ]")

local SnowParagraph = ServerHopFarm:CreateParagraph({Title = "Total Rating 9/10", Content = "≈90 slaps per serverhop"})

local SnowWarnLabel = ServerHopFarm:CreateLabel("Warning! Placing number more than 200 may cause lag, and your slaps may not register.")
_G.HowManySlaps = 100 or "100"
local SnowSlap = ServerHopFarm:CreateInput({
   Name = "How much slap?",
   PlaceholderText = "100",
   NumbersOnly = true,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.HowManySlaps = tonumber(Text) or 100
   end,
})

_G.RgTime = 1 or "1"
local SnowReg = ServerHopFarm:CreateInput({
   Name = "How much time wait after slapping? { If slaps don't have time to register }",
   PlaceholderText = "1",
   NumbersOnly = true,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.RgTime = tonumber(Text) or 1
   end,
})

local SnowFarm = ServerHopFarm:CreateButton({
   Name = "Snow ServerHop",
   Callback = function()
setclipboard(tostring("_G.SnowFarm = true _G.FarmSlapsSnowFarm = ".._G.HowManySlaps.." _G.WaitRegisterSnowFarm = ".._G.RgTime.." loadstring(game:HttpGet('".._G.Link.."'))()"))
notify("Success!", "Copied script to your clipboard... Place it in auto-execute!", 10, true)
   end,
})

local ErrorServerFarmParagraph = ServerHopFarm:CreateParagraph({Title = "Total Rating 10/10", Content = "≈∞ slaps per serverhop ( it's ∞ cuz you can set any number )"})

local ErrorWarnLabel = ServerHopFarm:CreateLabel("Farming will automatically ends when blink disappears, and you'll get serverhopped.")
_G.HowManySlapsError = 1000 or "1000"
local ErrorServerFarmSlap = ServerHopFarm:CreateInput({
   Name = "How much slaps?",
   PlaceholderText = "1000",
   NumbersOnly = true,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.HowManySlapsError = tonumber(Text) or 1000
   end,
})

local ErrorServerFarmFarm = ServerHopFarm:CreateButton({
   Name = "Error ServerHop",
   Callback = function()
setclipboard(tostring("_G.ErrorFarm = true _G.FarmSlapsErrorFarm = ".._G.HowManySlapsError.." loadstring(game:HttpGet('".._G.Link.."'))()"))
notify("Success!", "Copied script to your clipboard... Place it in auto-execute!", 10, true)
   end,
})

local BotLabel = AutoFarm:CreateLabel("Bot Farming! [ Pretty Safe ]")
local BotParagraph = AutoFarm:CreateParagraph({Title = "This is configurable bot!", Content = "Have a lot of configurations! To randomize gloves, turn on glove randomizer in slap battles settings! Slap Chance Rate: 100%"})

local BotRegLabel = AutoFarm:CreateLabel("I prefer not changing bot slap range, 8 is the best. If you absolutely don't care on getting caught, you can set this number up to 20 or smth")

local BotReg = AutoFarm:CreateInput({
   Name = "Bot slap range? { Trigger }",
   PlaceholderText = "8",
   NumbersOnly = true,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.BotReg = tonumber(Text) or 8
   end,
})

local BotJump = AutoFarm:CreateToggle({
   Name = "Can Jump?",
   CurrentValue = false,
   Callback = function(Value)
_G.BotJump = Value
   end,
})

local BotAvoid = AutoFarm:CreateToggle({
   Name = "Ignore One-Shots?",
   CurrentValue = false,
   Callback = function(Value)
_G.BotAvoid = Value
   end,
})

local BotSlapDuringRagdoll = AutoFarm:CreateToggle({
   Name = "Can Slap When Ragdolled?",
   CurrentValue = true,
   Callback = function(Value)
_G.BotSlapDuringRagdoll = Value
   end,
})

local BotIntelligence = AutoFarm:CreateDropdown({
   Name = "Intelligence",
   Options = {"Low","High"},
   CurrentOption = "High",
   MultiSelection = false,
   Callback = function(Option)
_G.BotIntelligence = ttostring(Option)
   end,
})

--[[
Ha! You thought.

You should be lucky enough to use ability!
]]--
local BotAbility = AutoFarm:CreateToggle({
   Name = "Can Use Ability?",
   CurrentValue = false,
   Callback = function(Value)
_G.BotAbility = Value
if _G.BotAbility == true then

repeat task.wait()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
if Players.LocalPlayer.Character:FindFirstChild("entered") then

if _G.BotFarm == true and _G.BotAbility == true then
local bchance = math.random(1,300)
local bnumber = math.random(1,300)
if bchance == bnumber then
game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",true,game:GetService("VirtualInputManager"))
task.wait()
game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game:GetService("VirtualInputManager"))
end
end

end
end
until _G.BotAbility == false

end
   end,
})

local BotFarm = AutoFarm:CreateToggle({
   Name = "Bot Mode",
   CurrentValue = false,
   Callback = function(Value)
_G.BotFarm = Value
if _G.BotFarm == true then

if _G.BotIntelligence == "Low" then

repeat task.wait()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
if Players.LocalPlayer.Character:FindFirstChild("entered") then
repeat task.wait()
if _G.BotAvoid == true then
rndm = randomthattcloseandsafe()
elseif _G.BotAvoid == false then
rndm = randomthattclose()
end
Players.LocalPlayer.Character.Humanoid.WalkToPoint = rndm.Character.HumanoidRootPart.Position
until (rndm.Character.HumanoidRootPart.Position - Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= tonumber(_G.BotReg) or Players.LocalPlayer.Character.Humanoid.Health == 0 or _G.BotFarm == false

if _G.BotFarm == false then
Players.LocalPlayer.Character.Humanoid.WalkToPoint = Players.LocalPlayer.Character.HumanoidRootPart.Position
end

if _G.BotSlapDuringRagdoll == false then
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and Players.LocalPlayer.Character:FindFirstChild("Ragdolled").Value == false and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and _G.BotFarm == true then
if _G.BotJump == true then
JumpWithCooldown()
end
SlapWithCooldown({[1]=rndm.Character.HumanoidRootPart})
end
elseif _G.BotSlapDuringRagdoll == true then
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and _G.BotFarm == true then
if _G.BotJump == true then
JumpWithCooldown()
end
SlapWithCooldown({[1]=rndm.Character.HumanoidRootPart})
end
end

elseif Players.LocalPlayer.Character:FindFirstChild("entered") == nil then

task.wait(.5)

repeat task.wait()
Players.LocalPlayer.Character.Humanoid.WalkToPoint = workspace.Lobby["Teleport1"].Position
until Players.LocalPlayer.Character:FindFirstChild("entered") or _G.BotFarm == false
if _G.BotFarm == false then
Players.LocalPlayer.Character.Humanoid.WalkToPoint = Players.LocalPlayer.Character.HumanoidRootPart.Position
end

end
end
until _G.BotFarm == false



elseif _G.BotIntelligence == "High" then




repeat task.wait()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
if Players.LocalPlayer.Character:FindFirstChild("entered") then
repeat task.wait()
if _G.BotAvoid == true then
rndm = randomthattcloseandsafe()
elseif _G.BotAvoid == false then
rndm = randomthattclose()
end

pcall(function()
newpath = PathService:CreatePath({
	AgentRadius = 3,
	AgentHeight = 6,
	AgentCanJump = true,
	AgentCanClimb = true,
	WaypointSpacing = 8,
})
newpath:ComputeAsync(NEX:GetHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)).Parent.PrimaryPart.Position, NEX:GetHumanoid(NEX:GetCharacter(rndm)).Parent.PrimaryPart.Position)
waypoints, distance = newpath:GetWaypoints(), 9e9
if waypoints ~= nil and waypoints[2] ~= nil then
NEX:GetHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)):MoveTo(waypoints[2].Position)
end
distance = (NEX:GetHumanoid(NEX:GetCharacter(rndm)).Parent.PrimaryPart.Position - NEX:GetHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)).Parent.PrimaryPart.Position).magnitude or 5
if distance == nil then
distance = 5
end
newpath = nil
end)
until distance <= tonumber(_G.BotReg) or NEX:HasHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) and NEX:GetHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)).Health == 0 or _G.BotFarm == false

if _G.BotFarm == false then
NEX:GetHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)):MoveTo(NEX:GetRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)).Position)
end

if _G.BotSlapDuringRagdoll == false then
if NEX:HasCharacter(game:GetService("Players").LocalPlayer) and NEX:GetCharacter(game:GetService("Players").LocalPlayer):FindFirstChild("Ragdolled") and NEX:GetCharacter(game:GetService("Players").LocalPlayer):FindFirstChild("Ragdolled").Value == false and NEX:HasHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) and _G.BotFarm == true then
if _G.BotJump == true then
JumpWithCooldown()
end
SlapWithCooldown({[1]=NEX:GetRoot(NEX:GetCharacter(rndm))})
end
elseif _G.BotSlapDuringRagdoll == true then
if NEX:HasCharacter(game:GetService("Players").LocalPlayer) and NEX:HasHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)) and _G.BotFarm == true then
if _G.BotJump == true then
JumpWithCooldown()
end
SlapWithCooldown({[1]=NEX:GetRoot(NEX:GetCharacter(rndm))})
end
end

elseif NEX:GetCharacter(game:GetService("Players").LocalPlayer):FindFirstChild("entered") == nil then

task.wait(.5)

repeat task.wait()
NEX:GetHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)):MoveTo(workspace.Lobby["Teleport1"].Position)
until NEX:GetCharacter(game:GetService("Players").LocalPlayer):FindFirstChild("entered") or _G.BotFarm == false
if _G.BotFarm == false then
NEX:GetHumanoid(NEX:GetCharacter(game:GetService("Players").LocalPlayer)):MoveTo(NEX:GetRoot(NEX:GetCharacter(game:GetService("Players").LocalPlayer)).Position)
end

end
end
until _G.BotFarm == false





end
end
   end,
})

--[[

Any Glove Slap Farming

]]--

local AnyGloveParagraph = AnyGlove:CreateParagraph({Title = "Depends on glove", Content = "Depends on glove"})
local AnyGloveFarm = AnyGlove:CreateToggle({
   Name = "Your Equipped Glove",
   CurrentValue = false,
   Callback = function(Value)
_G.AnyGloveFarm = Value
if _G.AnyGloveFarm == true then
NEX:SetDB(false)
repeat task.wait()

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.AnyGloveFarm == false
NEX:SetDB(true)
end
   end,
})

local AnyGloveGhostParagraph = AnyGlove:CreateParagraph({Title = "Depends on glove", Content = "Depends on glove"})
local AnyGloveGhostFarm = AnyGlove:CreateToggle({
   Name = "Your Equipped Glove + Ghost",
   CurrentValue = false,
   Callback = function(Value)
_G.AnyGloveGhostFarm = Value
if _G.AnyGloveGhostFarm == true then
NEX:SetDB(false)
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= 1 then
local oldg = NEX.GetGlove()
if NEX.GetGlove() ~= "Ghost" then
NEX:EquipGlove("Ghost")
end
game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
task.wait(.3)
if NEX.GetGlove() ~= ""..oldg.."" then
NEX:EquipGlove(""..oldg.."")
end
end

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.AnyGloveGhostFarm == false
NEX:SetDB(true)
end
   end,
})

local AnyGloveAdminParagraph = AnyGlove:CreateParagraph({Title = "Depends on glove", Content = "Depends on glove"})
local AnyGloveAdminFarm = AnyGlove:CreateToggle({
   Name = "Your Equipped Glove + Admin Invisibility",
   CurrentValue = false,
   Callback = function(Value)
_G.AnyGloveAdminFarm = Value
if _G.AnyGloveAdminFarm == true then
NEX:SetDB(false)
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= .5 then
game:GetService("ReplicatedStorage").AdminAbility:FireServer("Invisibility")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= .5 then
game:GetService("ReplicatedStorage").AdminAbility:FireServer("Invisibility")
end
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.AnyGloveAdminFarm == false
NEX:SetDB(true)
end
   end,
})



--[[

Dual Slap Farming

]]--

local DualParagraph = Dual:CreateParagraph({Title = "Total Rating 2/10", Content = "2 slaps/per second"})
local DualFarm = Dual:CreateToggle({
   Name = "Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.DualFarm = Value
if _G.DualFarm == true then

if NEX:HasGlove("Dual") ~= true then
DualFarm:Set(false)
notify("Error!", "You don't have dual glove.", 10, false)
return
end

NEX:SetDB(false)
repeat task.wait()

if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.DualFarm == false
NEX:SetDB(true)
end
   end,
})

local DualGhostParagraph = Dual:CreateParagraph({Title = "Total Rating: 3/10", Content = "2 slaps/per second"})
local DualGhostFarm = Dual:CreateToggle({
   Name = "Dual + Ghost",
   CurrentValue = false,
   Callback = function(Value)
_G.DualGhostFarm = Value
if _G.DualGhostFarm == true then
if NEX:HasGlove("Ghost") ~= true then
DualGhostFarm:Set(false)
notify("Error!", "You don't have ghost glove.", 10, false)
return
end

NEX:SetDB(false)
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= 1 then
if NEX.GetGlove() ~= "Ghost" then
NEX:EquipGlove("Ghost")
end
game.ReplicatedStorage.Ghostinvisibilityactivated:FireServer()
task.wait(.3)
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.DualGhostFarm == false
NEX:SetDB(true)
end
   end,
})

local DualAdminParagraph = Dual:CreateParagraph({Title = "Total Rating 2/10", Content = "2 slaps/per second"})
local DualAdminFarm = Dual:CreateToggle({
   Name = "Dual + Admin Invisibility",
   CurrentValue = false,
   Callback = function(Value)
_G.DualAdminFarm = Value
if _G.DualAdminFarm == true then
if NEX:HasGlove("Dual") ~= true then
DualAdminFarm:Set(false)
notify("Error!", "You don't have dual glove.")
return
end

NEX:SetDB(false)
repeat task.wait()

if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= .5 then
game:GetService("ReplicatedStorage").AdminAbility:FireServer("Invisibility")
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
local starttime = tick()
local Target = GetRandomPlayer().Character:WaitForChild("HumanoidRootPart")
BreakVelocity()
while tick() - starttime < .8 do
task.wait()
if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Torso") and Players.LocalPlayer.Character.Torso.Transparency ~= .5 then
game:GetService("ReplicatedStorage").AdminAbility:FireServer("Invisibility")
end
NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame = Target.CFrame * CFrame.new(0,0,-3)
end
NEX:Slap({[1]=Target})
task.wait(.1)

until _G.DualAdminFarm == false
NEX:SetDB(true)
end
   end,
})


--[[

Replica Slap Farming

]]--


local ReplicaDiamondParagraph = Replica:CreateParagraph({Title = "Total Rating 3/10", Content = "2 slaps/per second"})
local ReplicaDiamondFarm = Replica:CreateToggle({
   Name = "Replica",
   CurrentValue = false,
   Callback = function(Value)
_G.ReplicaDiamondFarm = Value
if _G.ReplicaDiamondFarm == true then
    
if NEX:HasGlove("Replica") ~= true then
ReplicaDiamondFarm:Set(false)
notify("Error!", "You don't have replica glove.")
return
end

repeat task.wait()

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX.GetGlove() ~= "Replica" then
NEX:EquipGlove("Replica")
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
end

local remote = ScanChildren(ReplicatedStorage, "Duplicate")
remote:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Å"..PlayerName)
task.wait()
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "spin" then
NEX:EquipGlove("spin")
end

repeat task.wait(.05) if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.ReplicaDiamondFarm == false

until _G.ReplicaDiamondFarm == false
end
   end,
})

local ReplicaDualParagraph = Replica:CreateParagraph({Title = "Total Rating 6/10", Content = "4 slaps/per second"})
local ReplicaDualFarm = Replica:CreateToggle({
   Name = "Replica + Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.ReplicaDualFarm = Value
if _G.ReplicaDualFarm == true then
if NEX:HasGlove("Replica") ~= true then
ReplicaDualFarm:Set(false)
notify("Error!", "You don't have replica glove.")
return
end

repeat task.wait()

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX.GetGlove() ~= "Replica" then
NEX:EquipGlove("Replica")
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
end

local remote = ScanChildren(ReplicatedStorage, "Duplicate")
remote:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Å"..PlayerName)
task.wait()
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end

repeat task.wait(.05) if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.ReplicaDualFarm == false

until _G.ReplicaDualFarm == false
end
   end,
})

local ReplicaOrbitParagraph = Replica:CreateParagraph({Title = "Total Rating 3/10", Content = "2-4 slaps/per second"})
local ReplicaOrbitFarm = Replica:CreateToggle({
   Name = "Replica + Orbit",
   CurrentValue = false,
   Callback = function(Value)
_G.ReplicaOrbitFarm = Value
if _G.ReplicaOrbitFarm == true then
    
if NEX:HasGlove("Replica") ~= true or NEX:HasGlove("Orbit") ~= true then
ReplicaOrbitFarm:Set(false)
notify("Error!", "You either don't have replica glove, or orbit glove.")
return
end
    
repeat task.wait()

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX.GetGlove() ~= "Replica" then
NEX:EquipGlove("Replica")
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
end

local remote = ScanChildren(ReplicatedStorage, "Duplicate")
remote:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Å"..PlayerName)
task.wait()
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "Orbit" then
NEX:EquipGlove("Orbit")
end

repeat task.wait() if Workspace:FindFirstChild("Å"..PlayerName) and Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") then Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart").CFrame = NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)).CFrame * CFrame.new(0,0,-7) NEX:Slap({[1]=Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:WaitForChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart") == nil or _G.ReplicaOrbitFarm == false

until _G.ReplicaOrbitFarm == false
end
   end,
})

--[[

Engineer Slap Farming

]]--

local EngineerParagraph = Engineer:CreateParagraph({Title = "Set time between slapping everyone on the server", Content = "pst.. don't make it less than 4 seconds, it probably gonna kick you!"})
_G.EngineerSlapTime = 5
local Input = Engineer:CreateInput({
   Name = "Time Between Slapping Everyone",
   PlaceholderText = "5",
   NumbersOnly = true,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.EngineerSlapTime = Text
   end,
})

local EngineerPeopleParagraph = Engineer:CreateParagraph({Title = "Total Rating 6/10", Content = "Amount of people in arena/per set time"})
local EngineerPeopleFarm = Engineer:CreateToggle({
   Name = "Engineer",
   CurrentValue = false,
   Callback = function(Value)
_G.EngineerPeopleFarm = Value
if _G.EngineerPeopleFarm == true then
    
if NEX:HasGlove("Engineer") ~= true then
EngineerPeopleFarm:Set(false)
notify("Error!", "You don't have engineer glove.")
return
end
    
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.8)
FreezePlayer()
repeat task.wait()

if NEX.GetGlove() ~= "Engineer" then
NEX:EquipGlove("Engineer")
end
ReplicatedStorage.Sentry:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove")
task.wait()
if Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove") then
TurretPlace = Workspace.Turret.HingePart:FindFirstChild("Glove").CFrame
end
local starttime = tick()
while tick() - starttime < 1 do
for i,v in pairs(Players:GetPlayers()) do
if v and v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChildWhichIsA("Humanoid").Sit == false and v.Character:FindFirstChild("rock") == nil and v.Character:FindFirstChild("stevebody") == nil then
v.Character.HumanoidRootPart.CFrame = TurretPlace
end
end
task.wait()
end
for i,v in pairs(Players:GetPlayers()) do
if v and v ~= Players.LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChildWhichIsA("Humanoid") and v.Character:FindFirstChildWhichIsA("Humanoid").Sit == false and v.Character:FindFirstChild("rock") == nil and v.Character:FindFirstChild("stevebody") == nil then
v.Character.HumanoidRootPart.CFrame = CFrame.new(0,0,0)
end
end
task.wait(_G.EngineerSlapTime)

until _G.EngineerPeopleFarm == false

UnFreezePlayer()

end
   end,
})

local EngineerPeopleBlinkParagraph = Engineer:CreateParagraph({Title = "Total Rating 6/10", Content = "3 slaps/per second"})
local EngineerPeopleBlinkFarm = Engineer:CreateToggle({
   Name = "Engineer + Blink",
   CurrentValue = false,
   Callback = function(Value)
_G.EngineerPeopleBlinkFarm = Value
if _G.EngineerPeopleBlinkFarm == true then
    
if NEX:HasGlove("Blink") ~= true then
EngineerPeopleBlinkFarm:Set(false)
notify("Error!", "You don't have blink glove.")
return
end
    
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
repeat task.wait()

if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")


if NEX.GetGlove() ~= "Engineer" then
NEX:EquipGlove("Engineer")
end
ReplicatedStorage.Sentry:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove")
task.wait()
if Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove") then
TurretPlace = Workspace.Turret.HingePart:FindFirstChild("Glove").CFrame
end

repeat task.wait() if ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart").CFrame = TurretPlace NEX:Slap({[1]=ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Turret") == nil and Workspace.Turret:FindFirstChild("HingePart") == nil and Workspace.Turret.HingePart:FindFirstChild("Glove") == nil or _G.EngineerPeopleBlinkFarm == false

if NEX.GetGlove() ~= "Engineer" then
NEX:EquipGlove("Engineer")
end
ReplicatedStorage.Sentry:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove")
task.wait()
if Workspace:FindFirstChild("Turret") and Workspace.Turret:FindFirstChild("HingePart") and Workspace.Turret.HingePart:FindFirstChild("Glove") then
TurretPlace = Workspace.Turret.HingePart:FindFirstChild("Glove").CFrame
end

repeat task.wait() if ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart").CFrame = TurretPlace NEX:Slap({[1]=ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.EngineerPeopleBlinkFarm == false

until _G.EngineerPeopleBlinkFarm == false
end
   end,
})


--[[

Cherry Slap Farming

]]--


local CherryParagraph = Cherry:CreateParagraph({Title = "Total Rating 1/10", Content = "0.2 slaps/per second, or 1 slaps/per 5 seconds"})
local CherryFarm = Cherry:CreateToggle({
   Name = "Cherry",
   CurrentValue = false,
   Callback = function(Value)
_G.CherryFarm = Value
if _G.CherryFarm == true then
    
if NEX:HasGlove("Cherry") ~= true then
CherryFarm:Set(false)
notify("Error!", "You don't have cherry glove.")
return
end
if NEX.GetGlove() ~= "Cherry" then
NEX:EquipGlove("Cherry")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
repeat task.wait()

game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
repeat task.wait() until Workspace:FindFirstChild("cherry_storage") and ScanChildren(Workspace["cherry_storage"], "Cherry "..PlayerName) and ScanChildren(Workspace["cherry_storage"], "Cherry "..PlayerName):FindFirstChild("HumanoidRootPart")
NEX:Slap({[1]=ScanChildren(Workspace["cherry_storage"], "Cherry "..PlayerName):FindFirstChild("HumanoidRootPart")}, 2)
task.wait(5)

until _G.CherryFarm == false
end
   end,
})

--[[

Baller Slap Farming

]]--

local BallerParagraph = Baller:CreateParagraph({Title = "Total Rating 4/10", Content = "2 slaps/per second"})
local BallerFarm = Baller:CreateToggle({
   Name = "Baller",
   CurrentValue = false,
   Callback = function(Value)
_G.BallerFarm = Value
if _G.BallerFarm == true then
    
if NEX:HasGlove("Baller") ~= true then
BallerFarm:Set(false)
notify("Error!", "You don't have baller glove.")
return
end

if NEX.GetGlove() ~= "Baller" then
NEX:EquipGlove("Baller")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), BallerPlace, true, 20)
task.wait(.6)

repeat task.wait()

game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
repeat task.wait() until ScanChildren(Workspace, "ÅBaller"..PlayerName) and ScanChildren(Workspace, "ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart") or _G.BallerFarm == false
local Baller = ScanChildren(Workspace, "ÅBaller"..PlayerName)
repeat task.wait() if Baller and Baller:FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Baller:FindFirstChild("HumanoidRootPart")}) end until Baller == nil or Baller:FindFirstChild("HumanoidRootPart") == nil or _G.BallerFarm == false

until _G.BallerFarm == false
end
   end,
})

local BallerDualParagraph = Baller:CreateParagraph({Title = "Total Rating 7/10", Content = "4 slaps/per second"})
local BallerDualFarm = Baller:CreateToggle({
   Name = "Baller + Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.BallerDualFarm = Value
if _G.BallerDualFarm == true then
    
if NEX:HasGlove("Baller") ~= true then
BallerDualFarm:Set(false)
notify("Error!", "You don't have baller glove.")
return
end

repeat task.wait()

if NEX.GetGlove() ~= "Baller" then
NEX:EquipGlove("Baller")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:EnterPortal("Teleport2")

game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
task.wait(.5)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end

local Baller = ScanChildren(Workspace, "ÅBaller"..PlayerName)
repeat task.wait() if Baller and Baller:FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Baller:FindFirstChild("HumanoidRootPart")}) end until Baller == nil or Baller:FindFirstChild("HumanoidRootPart") == nil or _G.BallerDualFarm == false

until _G.BallerDualFarm == false
end
   end,
})

--[[

Blink Slap Farming

]]--

local BlinkParagraph = Blink:CreateParagraph({Title = "Total Rating 5/10", Content = "2 slaps/per second"})
local BlinkFarm = Blink:CreateToggle({
   Name = "Blink",
   CurrentValue = false,
   Callback = function(Value)
_G.BlinkFarm = Value
if _G.BlinkFarm == true then
    
if NEX:HasGlove("Blink") ~= true then
BlinkFarm:Set(false)
notify("Error!", "You don't have blink glove.")
return
end

repeat task.wait()
if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")
task.wait()
if NEX.GetGlove() ~= "spin" then
NEX:EquipGlove("spin")
end
repeat task.wait() if ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.BlinkFarm == false
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)
until _G.BlinkFarm == false

end
   end,
})

local BlinkDualParagraph = Blink:CreateParagraph({Title = "Total Rating 8/10", Content = "4 slaps/per second"})
local BlinkDualFarm = Blink:CreateToggle({
   Name = "Blink + Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.BlinkDualFarm = Value
if _G.BlinkDualFarm == true then
    
if NEX:HasGlove("Blink") ~= true then
BlinkDualFarm:Set(false)
notify("Error!", "You don't have blink glove.")
return
end

repeat task.wait()
if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")
task.wait()
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end
repeat task.wait() if ScanChildren(Workspace, "Blink_"..PlayerName) and ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.BlinkDualFarm == false
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)
until _G.BlinkDualFarm == false

end
   end,
})

--[[

Ferryman Slap Farming

]]--

local FerrymanLabel = Ferryman:CreateLabel("WARNING!!!11!11! These functions aren't tested, except bugs")



--[[

Error Slap Farming

]]--

local ErrorLabel = Error:CreateLabel("Special thanks to @.xy5. and @requiem.3434, the founders of this method!")
local BlinkErrorWarningParagraph = Error:CreateParagraph({Title = "Warning!", Content = "After turning farm on, your ping may increase up to 800000 ( but you're not going to get kicked )"})
local BlinkErrorParagraph = Error:CreateParagraph({Title = "Total Rating 10/10", Content = "30 slaps/per second"})
local BlinkErrorFarm = Error:CreateToggle({
   Name = "Blink + Error",
   CurrentValue = false,
   Callback = function(Value)
_G.BlinkErrorFarm = Value
if _G.BlinkErrorFarm == true then
    
if NEX:HasGlove("Error") ~= true then
BlinkErrorFarm:Set(false)
notify("Error!", "You don't have error glove.")
return
end

repeat task.wait()
if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
task.wait(.6)
game:GetService("ReplicatedStorage").Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")
task.wait()
if NEX.GetGlove() ~= "Error" then
NEX:EquipGlove("Error")
end
repeat task.wait() if Workspace:FindFirstChild("Blink_"..PlayerName) and Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart") then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end until Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.BlinkErrorFarm == false
Players.LocalPlayer.Reset:FireServer()
task.wait(4.5)
until _G.BlinkErrorFarm == false

end
   end,
})

--[[

Mixed Slap Farming

]]--

local MixedLabel = Mixed:CreateLabel("W.I.P.")


local BlinkMixedDropdown = Mixed:CreateDropdown({
   Name = "Baller Spawn in farms where baller required",
   Options = {"Default Arena","Baller Safe Spot"},
   CurrentOption = "Default Arena",
   MultiSelection = false,
   Callback = function(Option)
pcall(function()
_G.BlinkMixedBallerPlace = ttostring(Option)
end)
   end,
})
local BlinkMixedParagraph = Mixed:CreateParagraph({Title = "Total Rating 10/10", Content = "12 slaps/per second"})
local BlinkMixedFarm = Mixed:CreateToggle({
   Name = "Blink + Baller + Replica + Dual",
   CurrentValue = false,
   Callback = function(Value)
_G.BlinkMixedFarm = Value
if _G.BlinkMixedFarm == true then
if NEX:HasGlove("Blink") ~= true then
BlinkMixedFarm:Set(false)
notify("Error!", "You don't have blink glove.")
return
end

repeat task.wait()
if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
ReplicatedStorage.Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until Workspace:FindFirstChild("Blink_"..PlayerName)
task.wait(.1)

if NEX.GetGlove() ~= "Baller" then
NEX:EquipGlove("Baller")
task.wait(.15)
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:EnterPortal("Teleport2")
if _G.BlinkMixedBallerPlace == "Default Arena" then
ReplicatedStorage.GeneralAbility:FireServer()
task.wait(.5)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.4)
elseif _G.BlinkMixedBallerPlace == "Baller Safe Spot" then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), BallerPlace, true, 20)
ReplicatedStorage.GeneralAbility:FireServer()
repeat task.wait() until Workspace:FindFirstChild("ÅBaller"..PlayerName)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.4)
end

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX.GetGlove() ~= "Replica" then
NEX:EquipGlove("Replica")
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
end

ReplicatedStorage.Duplicate:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Å"..PlayerName)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.2)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "Dual" then
NEX:EquipGlove("Dual")
end

repeat task.wait() if Workspace:FindFirstChild("Å"..PlayerName) then NEX:Slap({[1]=ScanChildren(Workspace, "Å"..PlayerName):FindFirstChild("HumanoidRootPart")}) end task.wait(.1) if Workspace:FindFirstChild("ÅBaller"..PlayerName) then NEX:Slap({[1]=ScanChildren(Workspace, "ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart")}) end task.wait(.1) if Workspace:FindFirstChild("Blink_"..PlayerName) then NEX:Slap({[1]=ScanChildren(Workspace, "Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end task.wait(.1) until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil or Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.BlinkMixedFarm == false
task.wait(.5)
until _G.BlinkMixedFarm == false

end
   end,
})


local ErrorMixedParagraph = Mixed:CreateParagraph({Title = "Total Rating 11/10", Content = "100 slaps/per second"})
local ErrorMixedFarm = Mixed:CreateToggle({
   Name = "Blink + Baller + Replica + Error",
   CurrentValue = false,
   Callback = function(Value)
_G.ErrorMixedFarm = Value
if _G.ErrorMixedFarm == true then
if NEX:HasGlove("Error") ~= true then
ErrorMixedFarm:Set(false)
notify("Error!", "You don't have error glove.")
return
end

repeat task.wait()
if NEX.GetGlove() ~= "Blink" then
NEX:EquipGlove("Blink")
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
ReplicatedStorage.Blink:FireServer("OutOfBody", {["dir"] = Vector3.new(0, 0, 0),["ismoving"] = false,["mousebehavior"] = Enum.MouseBehavior.Default})
repeat task.wait() until Workspace:FindFirstChild("Blink_"..PlayerName)
task.wait(.1)

if NEX.GetGlove() ~= "Baller" then
NEX:EquipGlove("Baller")
task.wait(.15)
end
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
NEX:EnterPortal("Teleport2")
if _G.BlinkMixedBallerPlace == "Default Arena" then
ReplicatedStorage.GeneralAbility:FireServer()
task.wait(.5)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.4)
elseif _G.BlinkMixedBallerPlace == "Baller Safe Spot" then

NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), BallerPlace, true, 20)
ReplicatedStorage.GeneralAbility:FireServer()
repeat task.wait() until Workspace:FindFirstChild("ÅBaller"..PlayerName)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.4)

end

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX.GetGlove() ~= "Replica" then
NEX:EquipGlove("Replica")
end
NEX:EnterPortal("Teleport2")
if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), SecretPlace, true, 20)
task.wait(.6)
end

ReplicatedStorage.Duplicate:FireServer()
repeat task.wait() until Workspace:FindFirstChild("Å"..PlayerName)
Players.LocalPlayer.Reset:FireServer()
task.wait(4.2)

if not NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
repeat task.wait() until NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer))
end
if NEX:HasRoot(NEX:GetCharacter(Players.LocalPlayer)) then
NEX:SetCFrame(NEX:GetRoot(NEX:GetCharacter(Players.LocalPlayer)), Baseplate, true, 20)
end
if NEX.GetGlove() ~= "Error" then
NEX:EquipGlove("Error")
end

repeat task.wait() if Workspace:FindFirstChild("Å"..PlayerName) then NEX:Slap({[1]=Workspace:FindFirstChild("Å"..PlayerName):FindFirstChild("HumanoidRootPart")}) end task.wait(.1) if Workspace:FindFirstChild("ÅBaller"..PlayerName) then NEX:Slap({[1]=Workspace:FindFirstChild("ÅBaller"..PlayerName):FindFirstChild("HumanoidRootPart")}) end task.wait(.1) if Workspace:FindFirstChild("Blink_"..PlayerName) then NEX:Slap({[1]=Workspace:FindFirstChild("Blink_"..PlayerName):FindFirstChild("HumanoidRootPart")}) end task.wait(.1) until Workspace:FindFirstChild("Å"..PlayerName) == nil or Workspace:FindFirstChild("ÅBaller"..PlayerName) == nil or Workspace:FindFirstChild("Blink_"..PlayerName) == nil or _G.ErrorMixedFarm == false
task.wait(.5)
until _G.ErrorMixedFarm == false

end
   end,
})



--[[

Dark Realm Slap Farming

]]--

local DarkRealmParagraph = DarkRealm:CreateParagraph({Title = "Total Rating 11/10", Content = "100 slaps/per second"})
local DarkRealmLabel = DarkRealm:CreateLabel("You should play as tycoon or god's hand! ( Tycoon slaps faster than god's hand )")
local DarkRealmFarm = DarkRealm:CreateToggle({
   Name = "Minion Farm",
   CurrentValue = false,
   Callback = function(Value)
_G.DarkRealmFarm = Value
if _G.DarkRealmFarm == true then

-- Yes i know i could've just take glove name from leaderstats, please stop talking about it

if Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool") then
for i,v in pairs(Players.LocalPlayer.Backpack:GetChildren()) do
if v and v:IsA("Tool") and v.ClassName == "Tool" then
_G.Glove = v.Name
end
end
elseif Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
for i,v in pairs(Players.LocalPlayer.Character:GetChildren()) do
if v and v:IsA("Tool") and v.ClassName == "Tool" then
_G.Glove = v.Name
end
end
end

repeat task.wait()
if workspace:FindFirstChild("BobClone") then
for i,v in pairs(workspace:GetChildren()) do
if v.Name == "BobClone" then
if _G.Glove == "Killstreak" then
game:GetService("ReplicatedStorage").KSHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
elseif _G.Glove == "Reaper" then
game:GetService("ReplicatedStorage").ReaperHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
elseif _G.Glove == "God's Hand" then
game:GetService("ReplicatedStorage").Godshand:FireServer(v:FindFirstChild("HumanoidRootPart"))
elseif _G.Glove == "Tycoon" then
game:GetService("ReplicatedStorage").GeneralHit:FireServer(v:FindFirstChild("HumanoidRootPart"))
end
end
end
end
until _G.DarkRealmFarm == false

end
   end,
})

end










--[[

Other tabs

]]--

-- Checking if window created

if Window ~= nil then
Other = Window:CreateTab("Other", 12809025337)
Credits = Window:CreateTab("Credits", 0)

local FakeSlapsLabel = Other:CreateLabel("Change slaps")

local FakeSlapsInput = Other:CreateInput({
   Name = "Fake Slaps",
   PlaceholderText = "0",
   NumbersOnly = true,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.FakeSlaps = tonumber(Text)
   end,
})

local FakeSlapsButton = Other:CreateButton({
   Name = "Set Fake Slaps",
   Callback = function()
NEX.GetLeaderstats().Slaps.Value = _G.FakeSlaps
   end,
})

local FakeSlapsToggle = Other:CreateToggle({
   Name = "Loop Set Fake Slaps",
   CurrentValue = false,
   Callback = function(Value)
_G.FakeSlapsToggle = Value
if _G.FakeSlapsToggle == true then
repeat task.wait()
NEX.GetLeaderstats().Slaps.Value = _G.FakeSlaps
until _G.FakeSlapsToggle == false
end
   end,
})

local FakeNametagLabel = Other:CreateLabel("Change nametag")

local FakeNametagInput = Other:CreateInput({
   Name = "Fake Nametag",
   PlaceholderText = "Nexer1234_AnotherAlt",
   NumbersOnly = false,
   OnEnter = true,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
_G.FakeNametag = Text
   end,
})

local FakeNametagButton = Other:CreateButton({
   Name = "Set Fake Nametag",
   Callback = function()
if NEX:HasCharacter(Players.LocalPlayer) and NEX:GetCharacter(Players.LocalPlayer):FindFirstChild("Head") and NEX:GetCharacter(Players.LocalPlayer).Head:FindFirstChild("Nametag") and NEX:GetCharacter(Players.LocalPlayer).Head.Nametag:FindFirstChild("TextLabel") then
NEX:GetCharacter(Players.LocalPlayer).Head.Nametag.TextLabel.Text = _G.FakeNametag
end
   end,
})

local FakeNametagToggle = Other:CreateToggle({
   Name = "Loop Set Fake Nametag",
   CurrentValue = false,
   Callback = function(Value)
_G.FakeNametagToggle = Value
if _G.FakeNametagToggle == true then
repeat task.wait()
if NEX:HasCharacter(Players.LocalPlayer) and NEX:GetCharacter(Players.LocalPlayer):FindFirstChild("Head") and NEX:GetCharacter(Players.LocalPlayer).Head:FindFirstChild("Nametag") and NEX:GetCharacter(Players.LocalPlayer).Head.Nametag:FindFirstChild("TextLabel") then
NEX:GetCharacter(Players.LocalPlayer).Head.Nametag.TextLabel.Text = _G.FakeNametag
end
until _G.FakeNametagToggle == false
end
   end,
})

local UILabel = Other:CreateLabel("UI")

local UIDropdown = Other:CreateDropdown({
   Name = "Gui Theme",
   Options = {"Amethyst","Default","AmberGlow","Bloom","DarkBlue","Green","Light","Ocean","Serenity"},
   CurrentOption = "Amethyst",
   MultiSelection = false,
   Callback = function(Option)
pcall(function()
Window.ModifyTheme(""..ttostring(Option).."") -- Using my ttostring ( table to string )
end)
   end,
})

local OtherLabel = Other:CreateLabel("Other Things")

-- TP Function ( minified using luaobfuscator )
function TP()
local PlaceID = game.PlaceId
local v0={};local v1="";local v2=os.date("!*t").hour;local v3=false;local v4=pcall(function() v0=game:GetService("HttpService"):JSONDecode(readfile("SmallServerServerHop-Nexer1234.json"));end);if  not v4 then table.insert(v0,v2);writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));end function TPReturner() local v5;if (v1=="") then v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100" ));else v5=game.HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceID   .. "/servers/Public?sortOrder=Asc&limit=100&cursor="   .. v1 ));end local v6="";if (v5.nextPageCursor and (v5.nextPageCursor~="null") and (v5.nextPageCursor~=nil)) then v1=v5.nextPageCursor;end local v7=0;for v8,v9 in pairs(v5.data) do local v10=true;v6=tostring(v9.id);if (tonumber(v9.maxPlayers)>tonumber(v9.playing)) then for v12,v13 in pairs(v0) do if (v7~=0) then if (v6==tostring(v13)) then v10=false;end elseif (tonumber(v2)~=tonumber(v13)) then local v14=pcall(function() delfile("SmallServerServerHop-Nexer1234.json");v0={};table.insert(v0,v2);end);end v7=v7 + 1 ;end if (v10==true) then table.insert(v0,v6);wait();pcall(function() writefile("SmallServerServerHop-Nexer1234.json",game:GetService("HttpService"):JSONEncode(v0));wait();game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID,v6,Players.LocalPlayer);end);wait(4);end end end end function Teleport() while wait() do pcall(function() TPReturner();if (v1~="") then TPReturner();end end);end end
task.wait()
while task.wait() do Teleport() end
end

local SmallServerButton = Other:CreateButton({
   Name = "Teleport to Small Server",
   Callback = function()
local success, error = pcall(function()
TP()
end)
if not success then
notify("Error!", "Failed teleporting.")
end
   end,
})

local ContactButton = Other:CreateButton({
   Name = "Contact Support",
   Callback = function()
pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/Other/SupportGui.luau'))()
end)
   end,
})

local MoreButtonsUI = Other:CreateButton({
   Name = "Load More Top-Bar Buttons",
   Callback = function()
pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/UI/MoreButtons.luau"))()
end)
   end,
})

local CloseHubButton = Other:CreateButton({
   Name = "Close Gui",
   Callback = function()
Rayfield:Destroy()
   end,
})

local CreditsLabel = Credits:CreateLabel("Slap Farm Gui. [ Owned By Nexer1234 ]")

local YoutubeButton = Credits:CreateButton({
   Name = "Youtube Channel",
   Callback = function()
setclipboard(tostring("https://www.youtube.com/@nexer1234"))
notify("Copied!", "Copied youtube channel link to clipboard!", 5, true)
   end,
})

local DiscordButton = Credits:CreateButton({
   Name = "Discord Server",
   Callback = function()
setclipboard(tostring("https://discord.gg/s2VCjQUxBc"))
notify("Copied!", "Copied discord server link to clipboard!", 5, true)
   end,
})

end





HintGui.Text = "Slap Farm Gui Loading... ( Loading Configuration )"
-- I think this should load config, idk how to use rayfield
local success, error = pcall(function()
Rayfield:LoadConfiguration()
end)
if success then
print("Loaded config")
elseif not success then
warn("Not loaded: config. Error: "..error)
end

-- Deleting loading message
pcall(function()
HintGui.Text = "Slap Farm Gui Loaded!"
task.wait(5)
HintGui:Destroy()
end)
