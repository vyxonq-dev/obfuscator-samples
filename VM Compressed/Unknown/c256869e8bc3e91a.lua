--[[ Loader ]]
if game.PlaceId == 131972793577387 then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/yzarcz/gubby.lol/refs/heads/main/games/mergeagarden.luau"))()
elseif game.PlaceId == 126884695634066 then
  if getgenv().gagtools then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/yzarcz/gubby.lol/refs/heads/main/others/gagtools.luau"))()
  end
  loadstring(game:HttpGet("https://raw.githubusercontent.com/yzarcz/gubby.lol/refs/heads/main/games/growagarden.luau"))()
end
