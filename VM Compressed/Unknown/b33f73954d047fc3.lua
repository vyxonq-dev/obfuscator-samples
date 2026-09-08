local k = "NihonLoader_Key_Real"
getgenv()._nl = k
local PlaceId = tostring(game.PlaceId)

local Scripts = {
	["7398552394"]       = "https://raw.githubusercontent.com/NoSkillStudios/Zen/main/NihonZen",
	["125224440903394"]  = "https://raw.githubusercontent.com/NoSkillStudios/Zen/main/NihonZen",
	["90568084448279"]   = "https://raw.githubusercontent.com/NoSkillStudios/Zen/main/OneTap",
	["70390793715007"]   = "https://raw.githubusercontent.com/NoSkillStudios/Zen/main/Hooked!",
	["113362767370086"]  = "https://raw.githubusercontent.com/NoSkillStudios/Zen/main/TestSelector",
}

local function notify(title, text)
	pcall(function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = title, Text = text, Duration = 10,
		})
	end)
end

local url = Scripts[PlaceId]
if not url then
	notify("Loader", "Game not supported (PlaceId: " .. PlaceId .. ")")
	return
end

local ok, err = pcall(function()
	loadstring(game:HttpGet(url))()
end)
if not ok then
	notify("Nihon Hub — Error", tostring(err))
end
