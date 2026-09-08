
	local Bindable = Instance.new("BindableFunction")
	local function Copy(e)
		setclipboard("https://cdn.discordapp.com/attachments/1000489602404057152/1039915926004445284/image.png")
		Bindable:Destroy()
	end
	Bindable.OnInvoke = Copy
	game.StarterGui:SetCore("SendNotification",{
		Title = "UPDATE THE LOADSTRING";
		Text = "Click the copy button to learn how to change link";
		Duration = 30;
		Callback = Bindable,
		Button1 = "Copy";
	})

loadstring(game:HttpGet("https://raw.githubusercontent.com/Gelatekussy/GelatekReanimate/main/Main.lua"))()
