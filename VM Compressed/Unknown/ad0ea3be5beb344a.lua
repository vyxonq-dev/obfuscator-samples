local Players = cloneref(game:GetService("Players"));
local Player = Players.LocalPlayer;

local ScriptID = ({
    [7018190066] = "310e37c829f002bedf76a1213590a4f3", --// Dead Rails
})[game.GameId];

if not ScriptID then
    return Player:Kick("Unsupported game!");
end;

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

local Window = ReGui:Window({
	Title = "Antimony | Key System",
	Size = UDim2.fromOffset(240, 120)
}):Center();

local KeyInput = Window:InputText({
    Placeholder = "Enter your key...",
    Label = "",
    Value = "",
});

Window:Button({
	Text = "       Submit Key      ",
	Callback = function()
        local Key = KeyInput.Value;
        if Key == "" or #Key < 10 then
            return Notify("FAILED", "Invalid Key", 5)
        end

        Window:Remove()

        script_key=Key;
        loadstring(game:HttpGet(`https://api.luarmor.net/files/v3/loaders/{ScriptID}.lua`))();
	end,
});

Window:Label({
    Text = "Get Key:"
})

local Row = Window:Row()

Row:Button({
	Text = "  Linkvertise  ",
	Callback = function()
        setclipboard("https://ads.luarmor.net/get_key?for=Antimony_Linkvertise-gOvqVViGyEmL")
        Notify("NOTIFICATION", "Key System link copied!", 5)
	end,
});

Row:Button({
	Text = "   Lootlabs   ",
	Callback = function()
        setclipboard("https://ads.luarmor.net/get_key?for=Antimony_Lootlabs-ulvowoAItxRF")
        Notify("NOTIFICATION", "Key System link copied!", 5)
	end,
});