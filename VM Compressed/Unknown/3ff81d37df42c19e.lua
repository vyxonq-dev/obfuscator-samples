local repo = "https://raw.githubusercontent.com/ttokennxyz/vaultcc/refs/heads/main/"
local function load(filename)
  loadstring(game:HttpGet(repo .. filename .. ".lua"))()
end
if game.PlaceId == 2916899287 or game.PlaceId == 10938546013 then
  load("brm5")
elseif game.PlaceId == 13687899540 or game.PlaceId == 92518636938049 or game.PlaceId == 121650045752508 then
  load("coldwar")
end
