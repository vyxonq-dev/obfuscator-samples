local supportedGames = {
    ["109983668079237"] = true, -- GameId for Steal a Brainrot
    ["128066522055979"] = true,
    ["126244816328678"] = true,
    ["72212564918217"] = true,
	["7709344486"] = true,
	["128066522055979"] = true,
	["7974428829"] = true,
	["7907828295"] = true,
	["7218065222"] = true,
}

if supportedGames[tostring(game.GameId)] then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/DIG-SCRIPT-ZERO/refs/heads/main/dig.md"))()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PlayzlxD0tmatter/StealABrainrotSciptZeroHub/refs/heads/main/ZeroHubStealABrainrotScript"))()
else
    game.Players.LocalPlayer:Kick("This game is not supported by the script. Join .gg/zeroui For support.")
end
