--[[
  Licensed under the MIT License (see LICENSE file for full details).
  Copyright (c) 2025 MrY7zz

  LEGAL NOTICE:
  You are REQUIRED to retain this license header under the terms of the MIT License.
  Removing or modifying this notice may violate copyright law.
]]
--// BY MrY7zz
if not game:IsLoaded() then
	game.Loaded:Wait()
end

local supportedplaces = {
	["5846386835"] = true, --// RetroStudio
	["654732683"] = true, --// Car Crushers 2
	["6884319169"] = true, --// MIC UP
	["16991287194"] = true, --// something evil will happen
	["5683833663"] = true, --// Ragdoll Engine (i named it Ragdoll1 since i want to add multiple of the clones later too)
	["16647175522"] = true, --// Advanced Euphoria Ragdoll
	["112399477218954"] = true, --// Circuit Board
--	["81239378558719"] = true, --// Hide the body // broken
	["16389398622"] = true, --// a dusty trip
	["9391468976"] = true, --// Jujutsu Shenanigans
	["99584907198214"] = true, --// Roblox_Egor simulator
	["192800"] = true, --// Work at a Pizza Place
}

local newgamesandwhitelisted = {
	--//New Games//--
	["1818"] = true, --// CrossRoads
	["1335775256"] = true, --// PhotoshootX
	["522527978"] = true, --// The Horror Mansion 
	["340981354"] = true, --// Moderators are epical
	["6690690837"] = true, --// Baer
	["233727153"] = true, --// Piano Keyboard v1.1 ("might work i tested it like a lot")
	["1662219031"] = true, --// Life in Paradies 
	["6441847031"] = true, --// Chaos [Event] ("Might Work sometimes")
	["17574618959"] = true, --// Just a Baseplate ("Might work but sometimes some people cant see the animation")
	["4065093137"] = true, --// Eat Sand ("I added it because it works and why not ")

	--// Whitelisted:
	["12109643"] = true, --// Fencing (whitelisted)
	["6278451801"] = true, --// ALL glitch in roblox (whitelisted)
	["6031035699"] = true, --// rememed meme game (whitelisted)
}

if _G["Anti-Fling"] == true then
local Players = game:GetService('Players')

local LocalPlayer = Players.LocalPlayer

game:GetService('RunService').Stepped:Connect(function()
	for i, v in ipairs(Players:GetPlayers()) do
		if v ~= LocalPlayer and v.Character then
			for i, b in ipairs(v.Character:GetDescendants()) do
				if b:IsA('BasePart') then
					b.CanCollide = false
				end
			end
		end
	end
end)


end

local supportedplace = false
local supportedplaceid = nil

for k, v in pairs(supportedplaces) do
	if k == tostring(game.PlaceId) then
		supportedplace = true
		supportedplaceid = tostring(game.PlaceId)
	end
end

for k, v in pairs(newgamesandwhitelisted) do
	if k == tostring(game.PlaceId) then
		supportedplace = true
		supportedplaceid = tostring(game.PlaceId)
	end
end

local PlrScripts = game:GetService("StarterPlayer").StarterPlayerScripts

local function getretrostudiover()
	if PlrScripts:FindFirstChild("_RetroStudio") then
		for i, v in ipairs(PlrScripts:GetDescendants()) do
			if v:IsA("Folder") and tostring(v) == "2013" then
				return "2013"
			end
		end
	end
end

local function loadstr(str)
	return loadstring(str)()
end

if not supportedplace then
	if _G["Fallback prompt"] == false then
		return loadstring(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/currentanglev2.5.lua"))()
	end
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/gamefallback.lua"))
	return
end

if supportedplace and supportedplaceid == "5846386835" then
	--// SOON
end

if supportedplace and supportedplaceid == "654732683" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/CC2.lua"))
	return
end

if supportedplace and supportedplaceid == "6884319169" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/MIC_UP.lua"))
	return
end

if supportedplace and supportedplaceid == "16991287194" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/SEWH.lua"))
	return
end

if supportedplace and supportedplaceid == "5683833663" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/RagdollEngine1/choose.lua"))
	return
end

if supportedplace and supportedplaceid == "5950733731" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/RagdollEngine1/choose.lua"))
	return
end

if supportedplace and supportedplaceid == "16389398622" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/adustytrip.lua"))
	return
end

if supportedplace and supportedplaceid == "16647175522" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/RagdollEngine1/choose2.lua"))
	return
end

if supportedplace and supportedplaceid == "112399477218954" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/CircuitBoard.lua"))
	return
end

if supportedplace and supportedplaceid == "81239378558719" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/hidethebody.lua"))
	return
end

if supportedplace and supportedplaceid == "16389398622" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/adustytrip.lua"))
	return
end

if supportedplace and supportedplaceid == "9391468976" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/warn.lua"))
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/jujutsushenanigans.lua"))
	return
end

if supportedplace and supportedplaceid == "99584907198214" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/roblox_egor.lua"))
	return
end

if supportedplace and supportedplaceid == "192800" then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/workatapizzaplace.lua"))
	return
end

--// WHITELISTED BELOW
--//New Games That I Tested Newmrbot//--
if supportedplace and newgamesandwhitelisted[supportedplaceid] then
	loadstr(game:HttpGet("https://raw.githubusercontent.com/somethingsimade/CurrentAngleV4/refs/heads/main/currentanglev2.5.lua"))
	return
end
