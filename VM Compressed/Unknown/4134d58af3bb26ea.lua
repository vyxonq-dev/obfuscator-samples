local supGames = {
17750416316, 10218821851, 1758401491, 4850588087, 4522347649,
9472371402, 16457183958, 11696357981, 119314673491123, 7002808196, 15259246552,
14735849025, 5709572883, 394773622, 5985232436, 76703229, 662417684, 6205205961,
4850533156, 2214661900, 6961824067, 10679239752
}

local bindable = Instance.new("BindableFunction")
function bindable.OnInvoke(response)
     if response == "Yes" then
 if game.PlaceId == 17750416316 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/ADSK_KJB/refs/heads/main/Source"))()
 elseif game.PlaceId == 10218821851 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Budgie-Hub_Client-Replication/main/Script"))()
 elseif game.PlaceId == 1758401491 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Budgie-Hub/main/PublicBathroomSimulator"))()
 elseif game.PlaceId == 4850588087 or game.PlaceId == 4850533156 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Bendy/main/BendyHubX"))()
 elseif game.PlaceId == 4522347649 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/FreeAdmin/main/GUI"))()
 elseif game.PlaceId == 9472371402 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/BACKROOMS/main/RedactedSurvival"))()
 elseif game.PlaceId == 16457183958 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/Wolfdmitrich/gojovstoji/main/main.lua"))()
 elseif game.PlaceId == 11696357981 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Chakra/refs/heads/main/Source"))()
 elseif game.PlaceId == 119314673491123 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/CrucifixTestingCT/refs/heads/main/Source"))()
 elseif game.PlaceId == 7002808196 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/BudgieHub/main/Kanava"))()
 elseif game.PlaceId == 15259246552 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/SukunaBattlegrounds/main/Battlegrounds"))()
 elseif game.PlaceId == 14735849025 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Battleground/main/AnMBattleground"))()
 elseif game.PlaceId == 5709572883 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Lift/main/LiftOfLegendsSimulator"))()
 elseif game.PlaceId == 394773622 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Revenge-of-the-Slimes/main/Slime"))()
 elseif game.PlaceId == 5985232436 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/SmileGUI/main/SmileHax33"))()
 elseif game.PlaceId == 76703229 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Push-Dummies-In-The-Sparta-Hole/main/FireInTheHole"))()
 elseif game.PlaceId == 662417684 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/LuckyBlock/main/LuckyGUI"))()
 elseif game.PlaceId == 6205205961 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/Felipe/main/EscapeRinningHead"))()
 elseif game.PlaceId == 2214661900 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/SIA51/refs/heads/main/Source.lua"))()
 elseif game.PlaceId == 6961824067 then
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/FTAP/refs/heads/main/Source.lua"))()
 elseif game.PlaceId == 10679239752 then
loadstring(request({Url = "https://raw.githubusercontent.com/ADSKerOffical/BHU/refs/heads/main/Furry%20Infection", Method = "GET",}).Body)()
 end
   else
loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/BHUOriginal/refs/heads/main/Source"))()
     end
end

if table.find(supGames, game.PlaceId) then
 game:GetService("StarterGui"):SetCore("SendNotification", {
 Title = "Notification",
 Text = "The script is supported in this game. Do you want to activate the script for this game instead of Budgie Hub Universal?",
 Duration = math.huge,
 Icon = "rbxassetid://16336200609",
 Callback = bindable,
 Button1 = "Yes",
 Button2 = "No"
 })
  else
 loadstring(game:HttpGet("https://raw.githubusercontent.com/ADSKerOffical/BHUOriginal/refs/heads/main/Source"))()
end
