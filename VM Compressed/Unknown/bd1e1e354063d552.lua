local Players = game:GetService("Players")

local function setUnixTime()
	local unixTime = tick()
	getgenv().startTime = unixTime
end

setUnixTime()

if not getgenv().yetexecuted then
	getgenv().yetexecuted = true
	if game.GameId == 205224386 then
		loadstring(game:HttpGet("https://pastebin.com/raw/b0ALdDUN"))()
	else
		script.Parent.Frame.Visible = true
	end
else
	game.StarterGui:SetCore("SendNotification", {
		Title = "Notification",
		Text = "Either wrong game or the ui didnt load correctly.",
		Icon = "rbxassetid://70867188373650",
		Duration = 10
	})
end