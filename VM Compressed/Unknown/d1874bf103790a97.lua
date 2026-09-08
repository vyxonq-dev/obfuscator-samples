--[[
██████╗ ███████╗██╗   ██╗██╗    ██╗ █████╗ ██████╗ ███████╗
██╔══██╗██╔════╝██║   ██║██║    ██║██╔══██╗██╔══██╗██╔════╝
██║  ██║█████╗  ██║   ██║██║ █╗ ██║███████║██████╔╝█████╗  
██║  ██║██╔══╝  ╚██╗ ██╔╝██║███╗██║██╔══██║██╔══██╗██╔══╝  
██████╔╝███████╗ ╚████╔╝ ╚███╔███╔╝██║  ██║██║  ██║███████╗
╚═════╝ ╚══════╝  ╚═══╝   ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝

              🚀 DEVWARE — Skidding is for losers 🚀
----------------------------------------------------------------
   One line loads all supported games:
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Devvzn/DevWare/refs/heads/main/DevMain"))()
----------------------------------------------------------------
   Supported:
   • 99 Nights In The Forest
   • MX World (Farm & Normal Map)
   • Fisch (Auto Farm and more)
----------------------------------------------------------------
   Discord: https://discord.gg/cuYwaQeHT5
----------------------------------------------------------------
]]

if not game:IsLoaded() then game.Loaded:Wait() end

local version = "v1.0.0"
local placeId = game.PlaceId

-- Helpers
local function notify(title, text, duration)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title, Text = text, Duration = duration or 6
		})
	end)
end

local function safeGetGameName()
	local MarketplaceService = game:GetService("MarketplaceService")
	local ok, info = pcall(MarketplaceService.GetProductInfo, MarketplaceService, placeId)
	return (ok and info and info.Name) or ("Unknown Game ("..tostring(placeId)..")")
end

local function safeLoad(url)
	local ok, err = pcall(function()
		loadstring(game:HttpGet(url))()
	end)
	if not ok then
		warn("[Devware] Failed to load:", url, "\nError:", err)
		notify("Devware", "Load failed. Check console.", 8)
	end
end

-- Core
local gameName = safeGetGameName()
print(("[Devware %s] Detected: %s"):format(version, gameName))
notify("Devware Loader", "Detected: "..gameName, 5)

-- Routing
if placeId == 126509999114328 then
	print("[Devware] Loading 99 Nights In The Forest...")
	notify("Devware", "Loading 99 Nights In The Forest…", 6)
	safeLoad("https://raw.githubusercontent.com/Devvzn/99nights/refs/heads/main/main")

elseif placeId == 135155039067698 or placeId == 97241995358432 then
	print("[Devware] Loading MX World...")
	notify("Devware", "Loading MX World…", 6)
	safeLoad("https://raw.githubusercontent.com/Devvzn/mxworld/refs/heads/main/main")

elseif placeId == 131716211654599 
    or placeId == 106011698424775 
    or placeId == 70451556031302 
    or placeId == 72907489978215 
    or placeId == 16732694052 then

	print("[Devware] Loading Fisch...")
	notify("Devware", "Loading Fisch…", 6)
	safeLoad("https://raw.githubusercontent.com/Devvzn/fisch/refs/heads/main/fischmainhub")

else
	warn("[Devware] No script assigned for:", gameName, "("..tostring(placeId)..")")
	notify("Devware", "No script assigned for "..gameName, 7)
end
