--!strict
local G={ML=3623096087,GAG2=97598239454123};
local S={ML='https://raw.githubusercontent.com/toxicity-561/Proton-Hub/main/Muscle-Legends.luau',GAG2='https://raw.githubusercontent.com/toxicity-561/Proton-Hub/main/Grow-A-Garden2.luau'};
local function loadUrl(url)loadstring(game:HttpGet(url))()end;
if game.PlaceId == G.ML then loadUrl(S.ML)elseif game.PlaceId == G.GAG2 then loadUrl(S.GAG2)else warn'Please join Muscle Legends or Grow A Garden 2 for this script to load'end
