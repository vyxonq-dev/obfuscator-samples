loadstring(game:HttpGet("https://raw.githubusercontent.com/Darli17/DOORS/refs/heads/main/StaminaBar"))()

	wait(0.)
	if game.ReplicatedStorage.GameData.LatestRoom.Value == 1 then
	    print("Hardmode is loaded!")
	    
	    -- Varaibles
	
	    local Player = game.Players.LocalPlayer
	    local Character = Player.Character
	    local PlayerGui = Player.PlayerGui
	
	    local Info = TweenInfo.new(1)
	    local TweenCaption = game:GetService("TweenService"):Create(PlayerGui.MainUI.MainFrame.Caption,Info,{TextTransparency=1})
	
	    local Text = "Hardcore Initiated"
	    local Text2 = "Made by noonie#0001 (Scripter) and Ping#1841 (Music composer and Modeler)"
	    local Text3 = "Good luck!"
	    local TextReq3 = "Do not."
	    local TextReq23 = "Holy s##t you super sigma."
	    local Text5 = "You're exhausted."
	
	    wait(1.300)
	    PlayerGui.MainUI.MainFrame.Caption.Text = Text
	    PlayerGui.MainUI.MainFrame.Caption.TextTransparency = 0
	    PlayerGui.MainUI.MainFrame.Caption.Visible = true
	    wait(7)
	    PlayerGui.MainUI.MainFrame.Caption.Text = Text2
	    PlayerGui.MainUI.MainFrame.Caption.TextTransparency = 0
	    PlayerGui.MainUI.MainFrame.Caption.Visible = true
	    wait(7)
	    PlayerGui.MainUI.MainFrame.Caption.Text = Text3
	    PlayerGui.MainUI.MainFrame.Caption.TextTransparency = 0
	    PlayerGui.MainUI.MainFrame.Caption.Visible = true
	    wait(5)
	    TweenCaption:Play()
	    wait(3)
            game.ReplicatedStorage.Sounds.BulbZap.SoundId = "rbxassetid://4398878054"
            game.ReplicatedStorage.Sounds.BulbZap.Volume = 10
	    loadstring(game:HttpGet("https://raw.githubusercontent.com/Darli17/Entities/refs/heads/main/Hardcore/Random"))()
    end
