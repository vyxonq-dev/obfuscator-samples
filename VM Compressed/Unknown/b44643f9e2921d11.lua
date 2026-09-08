local kavoUi = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()
local window = kavoUi.CreateLib("Bake Da Baby Script","BloodTheme")

---Tabs

local Tab1 = window:NewTab("Main")
local Tab1Section = Tab1:NewSection("Main")
local Tab2 = window:NewTab("Credits")
local Tab2Section = Tab2:NewSection("Subscribe to JN HH Gaming")

---Buttons

Tab1Section:NewButton("Infinite Yeild (Use NoClip and Speed)","Infinite Yeild",function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

Tab1Section:NewToggle("Infinite Jumps"," Infinite Jumps",function()
local InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

Tab1Section:NewButton("Fly V3","Fly speed",function()
loadstring(game:HttpGet('https://pastebin.com/raw/YSL3xKYU'))()
end)

game.StarterGui:SetCore("SendNotification",  {
 Title = "Bake Da Baby Script";
 Text = "Made by JN HH Gaming. Subscribe him on youtube";
 Icon = "";
 Duration = 10;
})