-- Follower Checker by Nexer1234

local RequiredUserID = 7529992299


function IsFollowedTo(userid)

local function valid_url(which, cursor)
local qqz = which or 1
local zzx = (cursor and "&cursor="..cursor.."") or "&cursor="
if qqz == 1 then
return "https://friends.roblox.com/v1/users/"..game.Players.LocalPlayer.UserId.."/followings?sortOrder=Des&limit=100"..zzx
else
return "https://friends.roproxy.com/v1/users/"..game.Players.LocalPlayer.UserId.."/followings?sortOrder=Des&limit=100"..zzx
end
end

local Success, Fail = pcall(function()
ft = {}
Decode = nil
repeat
if Decode == nil then
Decode = game:GetService("HttpService"):JSONDecode(game:HttpGet(valid_url(1))) or game:GetService("HttpService"):JSONDecode(game:HttpGet(valid_url("backup")))
end
if not Decode["data"] or Decode["errors"] then return false end
for i,v in pairs(Decode["data"]) do
if v ~= nil and v["id"] then
table.insert(ft, v["id"])
end
end
if Decode["nextPageCursor"] ~= nil then
Decode = nil
Decode = game:GetService("HttpService"):JSONDecode(game:HttpGet(valid_url(1, Decode["nextPageCursor"]))) or game:GetService("HttpService"):JSONDecode(game:HttpGet(valid_url("backup", Decode["nextPageCursor"])))
end
until Decode["nextPageCursor"] == nil
if table.find(ft,tonumber(userid)) then
return true
end
return false
end)
return Success, Fail
end

function IsFollowedToo(userid)
local decodeddata, value = IsFollowedTo(userid)
if decodeddata ~= true then
return true
end
return value
end


function ConvertDropdownValue(tbl)
if type(tbl) == "table" then
for _,element in ipairs(tbl) do
return tostring(element)
end
else
return tostring(tbl)
end
end

local WebHandler = {}
function WebHandler:OpenRBX(url)
game:GetService("GuiService"):BroadcastNotification(game:GetService("HttpService"):JSONEncode({["title"] = "Roblox", ["presentationStyle"] = 2, ["visible"] = true, ["url"] = tostring(url)}), 20)
end
local GetRequestMethod = function()
local iqnd = request or http_request or HttpPost or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (game and game.HttpPost) or (KRNL and KRNL.request) or (Xeno and Xeno.request)
if iqnd then
return iqnd
else
return nil
end
end
local isfollowed = IsFollowedToo(RequiredUserID)
if isfollowed == true then
loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/DOD/Main.luau"))()
return
end

local Rayfield
local RAYFIELD_SUCCESS, RAYFIELD_FAIL = pcall(function()
Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if not RAYFIELD_SUCCESS then
local RAYFIELD_SUCCESS, RAYFIELD_FAIL = pcall(function()
Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
end)
if not RAYFIELD_SUCCESS then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Failed to launch rayfield.",
	Text = "Please check your internet connection, or try using VPN.",
  Icon = "rbxassetid://125704683916878",
	Duration = 10,
})
return
end
end

function Notify(title, content, time, mode)
time = time or 4
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

function DestroyRayfield()
task.spawn(function()
pcall(function()
Window:Destroy()
end)
pcall(function()
Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.RayField:Destroy()
end)
pcall(function()
game.CoreGui.OldRayfield:Destroy()
end)
pcall(function()
game.CoreGui.OldRayField:Destroy()
end)
end)
end

local Window = Rayfield:CreateWindow({
   Name = "DOD:NH - Launcher",
   Icon = 0,    
   LoadingTitle = "DOD:NH - Launcher",
   LoadingSubtitle = "by nexer",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "",
      FileName = ""
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

local Main = Window:CreateTab("Main",85436299122876)

function CopyLink(link)
local url = tostring(link)
setclipboard(url)
Notify("Success!", "Copied Link!", 4, true)
end

function OpenLink(link)
local url = tostring(link)
if WebHandler then
local suc, err = pcall(function() WebHandler:OpenRBX(url) end) if not suc then CopyLink(url) end
else
CopyLink(url)
end
end

Main:CreateParagraph({Title = "Follow Requirement", Content = "This script was very difficult to create, so please, support me by following me on roblox!"})

Main:CreateButton({Name = "Open Profile"; Callback = function()
OpenLink("https://www.roblox.com/users/"..tostring(RequiredUserID).."/profile")
end; })

Main:CreateButton({Name = "Copy Profile Link"; Callback = function()
CopyLink("https://www.roblox.com/users/"..tostring(RequiredUserID).."/profile")
end; })

Main:CreateButton({Name = "Launch Script"; Callback = function()
local isfollowed = IsFollowedToo(RequiredUserID)
if isfollowed == true or game.Players.LocalPlayer.UserId == RequiredUserID then
DestroyRayfield()
Notify("Success!", "Launching script, please wait...", 10, true)
loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/DOD/Main.luau"))()
else
Notify("Error!", "You aren't followed! ( But if you're 100% sure that you're followed, wait for about 5 minutes and try again )", 10)
end
end; })
