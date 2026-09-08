BootableURL = "https://raw.githubusercontent.com/RENBex6969/KryptonReload/main/Krypton.lua"

function notify(args1)
  local players = game:GetService("Players")
  local notificationData = {
    Title = "[KryProtect] : LOG",
    Icon = "rbxthumb://type=AvatarHeadShot&id="..players.LocalPlayer.UserId.."&w=180&h=180",
    Duration = 5
  }
  
  if args1 == false then
    notificationData.Text = "Krypton is already loaded. Rejoin or try again!"
  elseif args1 == true then
    notificationData.Text = "Krypton is loading!"
  end
  
  game:GetService("StarterGui"):SetCore("SendNotification", notificationData)
end

if _G.IsKryptonLoaded == nil then
  _G.IsKryptonLoaded = true
  loadstring(game:HttpGet(BootableURL))()
  notify(true)
else
  notify(false)
end
