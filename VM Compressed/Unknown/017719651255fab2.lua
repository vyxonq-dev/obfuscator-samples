_G.script_key = getgenv()['script_key'] or getfenv()['script_key']
local debris = game:GetService("Debris")

local games = {
	[4777817887] = "https://api.luarmor.net/files/v3/loaders/50ac53ef9bc082c5e184696d281fc839.lua",
	[3150475059] = "https://api.luarmor.net/files/v3/loaders/50ac53ef9bc082c5e184696d281fc839.lua",
}

local link = games[game.GameId]

if not link then
	local message = Instance.new("Message")
	message.Parent = workspace
	message.Text = "Game isn't supported, sorry!"
	debris:AddItem(message, 3)
	return
end

loadstring(game:HttpGet(link))()
