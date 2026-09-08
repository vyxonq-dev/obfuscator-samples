--  //\\   //[°°°°°] ヿ  г   []  . |  |  ○|     |   |‾‾‾\
-- //  \\ // [  [] ]  | |  [___]  [---]  |     |    |---]      
--//    \\/  [_____]  | | [     ] |   |  |____/     [___/


----- Tables
local Rewards = {"Reward1","Reward2","Reward3","Reward4","Reward5","Reward6","Reward7"}
local plrs = {}

-- Strings

local me = game.Players.LocalPlayer
local char = nil
local stupidti = game["Workspace"].RankGiverPads.Model.TouchPart
local LoopW = nil
local Dead = nil



-- functions
function hd(cmd)
		          game:GetService("ReplicatedStorage"):WaitForChild("HDAdminHDClient"):WaitForChild("Signals"):WaitForChild("RequestCommandSilent"):InvokeServer(cmd)
end








	
	--Notify
	
	
function notify(t,msg,dur)
game.StarterGui:SetCore("SendNotification", {
					Title = t,
					Text = ms,
					Duration = dur or 5
				})
end
	
-- Place Check
	
	
if game.PlaceId ~= 90103915562799 then
game.TeleportService:Teleport(90103915562799,game.Players.LocalPlayer)
end



-- Other

getgenv().AKLol = nil

-- Death Check








-- Hub
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "N0ta Hub -- Free Admin Tower", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})


OrionLib:MakeNotification({
	Name = "N0ta Hub",
	Content = "Version 1",
	Image = "rbxassetid://4483345998",
	Time = 5
})


local Tab = Window:MakeTab({
	Name = "HD Admin",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Cmdbar",
	Callback = function()	
	  game:GetService("ReplicatedStorage"):WaitForChild("HDAdminHDClient"):WaitForChild("Signals"):WaitForChild("RequestCommandSilent"):InvokeServer(";cmdbar")
  	end    
})







-- Other Tab Why Not
local Tab = Window:MakeTab({
	Name = "Reward",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})



Tab:AddButton({
	Name = "HD Admin Mod",
	Callback = function()
      		game:GetService("ReplicatedStorage").Events.Spin:FireServer("Reward7")
  	end    
})

Tab:AddButton({
	Name = "Randomize Reward",
	Callback = function()
      		game:GetService("ReplicatedStorage").Events.Spin:FireServer(Rewards[math.random(1, #Rewards)])
  	end    
})

-- Tab 2

local Tab = Window:MakeTab({
	Name = "Game",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})





char = me.Character or me.CharacterAdded:Wait()


Tab:AddButton({
	Name = "+1 Win",
	Callback = function()
firetouchinterest(char.HumanoidRootPart, stupidti, 0)
	  wait(.4)
	  char = me.Character or me.CharacterAdded:Wait()
    hd(";re")
  	end    
})




		
	

			
			
	


Tab:AddToggle({
	Name = "Loop Win",
	Default = nil,
	Callback = function(Value)
	  LoopW = Value
	  
	      while LoopW do wait(1.4)
	        task.spawn(function()
	        if LoopW then
		firetouchinterest(char.HumanoidRootPart, stupidti, 0)
	  task.wait(.4)
	          hd(";re")
	        	char = me.Character or me.CharacterAdded:Wait()
	        if not LoopW then
            return print("Off.")
	        end
	      end
	      end)
	  end
	end
})

Tab:AddToggle({
	Name = "Loop Win Faster",
	Default = nil,
	Callback = function(Value)
	  LoopW = Value
	  
	      while LoopW do wait(1.1)
	        task.spawn(function()
	        if LoopW then
		firetouchinterest(char.HumanoidRootPart, stupidti, 0)
	  task.wait(.2)
	          hd(";re")
	        	char = me.Character or me.CharacterAdded:Wait()
	        if not LoopW then
            return print("Off.")
	        end
	      end
	      end)
	  end
	end
})



OrionLib:Init()
loadstring(game:HttpGet("https://raw.githubusercontent.com/pedroluckygod/Yes/71ba4f9dbdeda6f9a8c31ec90a8136b7febce37d/OrionButton"))()











