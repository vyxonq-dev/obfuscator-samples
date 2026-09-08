local down = false
local UpString ="https://raw.githubusercontent.com/xsakyx/RobloxUILib/refs/heads/main/Loaders/FirstStepBêta"
local DownString="https://raw.githubusercontent.com/xsakyx/RobloxUILib/refs/heads/main/Loaders/DownTimeTaker"

if down == false then
loadstring(game:HttpGet(UpString))()
else
loadstring(game:HttpGet(DownString))()
end
