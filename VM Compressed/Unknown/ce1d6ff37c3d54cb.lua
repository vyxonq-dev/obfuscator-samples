game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Script";
	Duration = 5;
	Text = "Hello!"
})

game:GetService("StarterGui"):SetCore("SendNotification", {
	Title = "Script";
	Duration = 5;
	Text = "Wait"
})

Wait(4)

loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/rblx/main/extra/better_antifling.lua'))()
