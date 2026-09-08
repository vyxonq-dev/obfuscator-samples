local cloneref = cloneref or function(...)
	return ...
end

local Players = cloneref(game:GetService("Players"));
local Player = Players.LocalPlayer;

local ScriptID = ({
    [3808081382] = "72658b362cb91f830bb5450f954fba35", --// TSB
    [6331902150] = "f6d5d5608e9c8d461c56136ab48730b4", --// Forsaken
    [994732206] = "f1027cdbaecbe58bd4e398da24ac00fe", --// Blox Fruits
})[game.GameId];

if not ScriptID then
    return Player:Kick("Unsupported game!");
end;

if script_key then
    return loadstring(game:HttpGet(`https://api.luarmor.net/files/v3/loaders/{ScriptID}.lua`))();
end

--// UI
local ReGui = loadstring(game:HttpGet('https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'))();
local PrefabsId = "rbxassetid://" .. ReGui.PrefabsId;

ReGui:Init({
	Prefabs = cloneref(game:GetService('InsertService'):LoadLocalAsset(PrefabsId)),
});

local function Notify(Title, Text, Duration)
	game:GetService('StarterGui'):SetCore("SendNotification", {
		Title = Title,
		Text = Text,
		Duration = Duration,
	})
end

local Window = ReGui:PopupModal({
	Title = "Antimony",
	NoClose = true,
})

Window:Label({
	Text = "Server link has been copied, go to #get-script to get a key,\nthen redeem your key and click get script\nthen execute the script you get."
});

Window:Button({
	Text = "Close",
	Callback = function()
		Window:ClosePopup();
	end
});

setclipboard("https://discord.gg/HezQqF8Eu8");
Notify("NOTIFICATION", "Server link copied!", 20);
