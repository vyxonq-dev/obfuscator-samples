if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Place = game.PlaceId

if Place == tonumber(94641783649173) or Place == tonumber(75661637882183) then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/World-of-Trollge-script/refs/heads/main/lua"))()
elseif Place == tonumber(18687417158) or Place == tonumber(83645629621104) then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Forsaken-Script/refs/heads/main/lua"))()
elseif Place == tonumber(12377995562) or Place == tonumber(12801608913) or Place == tonumber(13028864053) then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Trollge-Incident-Fights-Reborn2-script/refs/heads/main/lua"))()
elseif Place == tonumber(13946738101) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Trollge-Multiverse/refs/heads/main/lua"))()
elseif Place == tonumber(121864768012064) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Fish-It/refs/heads/main/lua"))()
else loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/CursedHub-Main/refs/heads/main/lua"))()
end
