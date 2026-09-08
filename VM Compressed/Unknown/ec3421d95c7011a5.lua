local e = identifyexecutor()
local cloneref = cloneref or function(x) return x end
local uis = cloneref(game:GetService("UserInputService"))
if e == "Xeno" or e == "Solara" then
local ui = game:GetService("StarterGui")
ui:SetCore("SendNotification", {
		Title = "Xeno and Solara not supported";
		Text = "😔😔😕";
		Icon = "rbxthumb://type=AvatarHeadShot&id=" .. game.Players.LocalPlayer.UserId .. "&w=180&h=180"; 
		Duration = 5; 
	})
else
if not uis.TouchEnabled then
loadstring(game:HttpGet("https://raw.githubusercontent.com/sigmaboijjk123/jjs/refs/heads/main/JujutsuerPc"))()
  else
loadstring(game:HttpGet("https://raw.githubusercontent.com/sigmaboijjk123/jjs/refs/heads/main/JujutsuerMobile"))()
  end

end
