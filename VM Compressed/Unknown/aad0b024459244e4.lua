local StarterGui = game:GetService("StarterGui")
local PlaceId = game.PlaceId

local ScriptList = {
    [90196214155723] = "https://raw.githubusercontent.com/mynamewendel-ctrl/Blessed-Hub-X-/refs/heads/main/%2B1%20Size%20Per%20Second%20SammyLoader.lua"
}

local targetScript = ScriptList[PlaceId]
if targetScript then
    loadstring(game:HttpGet(targetScript))()
else
    warn("BlessedHub X: Script not found for this game.")
    StarterGui:SetCore("SendNotification", {
        Title = "BlessedHub X",
        Text = "❌ Script not support this game",
        Icon = "rbxassetid://107373293250155",
        Duration = 5,
    })
end
