local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Players = game:GetService("Players")
pcall(function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/cszndex/HikariHUB/master/API/Executed"))()
end) -- API

local function loadScript(scriptLink)
  loadstring(game:HttpGet(scriptLink))()
  wait(3.5)
  print("[Hikari]: "..GameName.." Script Launched ✅")
end

print("[Hikari]: Launching 🚀")
wait(1.5)
print("[Hikari]: Welcome to Hikari HUB "..Players.LocalPlayer.DisplayName.." 🌸")
wait(1.5)
if game.PlaceId == 1537690962 then
  loadScript("https://raw.githubusercontent.com/cszndex/HikariHUB/master/Dist/BeeSwarm.lua")
end