local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Dragon", "LightTheme")
local Tab = Window:NewTab("جميع سكربتات")
local Section = Tab:NewSection("سكربت مطور محمد")
Section:NewButton("infinte yield", "ButtonInfo", function()
    print("Clicked")loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
end)
Section:NewButton("سكربت من صنعي", "ButtonInfo", function()
    print("Clicked")loadstring(game:HttpGet("https://rawscripts.net/raw/Brookhaven-RP-SP-Hub-New-Uptade-2-March-2025-30618"))()
end)
Section:NewButton("سكربت VR7", "ButtonInfo", function()
    print("Clicked")loadstring(game:HttpGet("https://raw.githubusercontent.com/VR7ss/OMK/refs/heads/main/VR7-ON-TOP"))()
end)
local Tab = Window:NewTab("غير")
local Section = Tab:NewSection("سرعه")
Section:NewSlider("سرعه", "سرعه شخصيه", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewKeybind("اضغط R", "KeybindInfo", Enum.KeyCode.R, function()
	print("You just clicked the bind")
end)
local colors = {
    SchemeColor = Color3.fromRGB(0,255,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}
Section:NewTextBox("سكربت مطور دراجون", "سكربت مطور دراجون", function(txt)
	print(txt)
end)
Section:NewButton("سكربت نسخ قوي", "سكربت نسخ قوي", function()
    print("Clicked")loadstring(game:HttpGet("https://raw.githubusercontent.com/S2hub3/s7/refs/heads/main/S7SCRIPT.lua"))()
end)
wait(0.1)
game.StarterGui:SetCore("SendNotification", {
    Title = "تم تفعيل سكربت مطور محمد";
    Text = "منور/ه سكربت"; -- ARAB TEAM
    Duration = 5;
})
Section:NewButton("سكربت نادر", "isamil hub", function()
    print("Clicked")loadstring(game:HttpGet("https://raw.githubusercontent.com/sukuna355/ismailhubttt/refs/heads/main/sukunahub.lua"))()
end)