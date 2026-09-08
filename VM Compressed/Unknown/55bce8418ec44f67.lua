if not game:IsLoaded() then
    game.Loaded:Wait()
end

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({
Name = "AstralHook | Raise a Sonic",
HidePremium = false,
SaveConfig = false,
IntroEnabled = true,
IntroText = "Welcome to AstralHook.",
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer

if not getconnections then return end
for _,v in pairs(getconnections(LocalPlayer.Idled)) do
    v:Disable()
end

LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = 50

local Tab = Window:MakeTab({Name = "Main", Icon = "rbxassetid://4483345998"})
local TabCred = Window:MakeTab({Name = "Credits", Icon = "rbxassetid://6961018885"})

local Section1 = Tab:AddSection({Name = "Farming"})

OrionLib:MakeNotification({Name = "AstralHook", Content = "Welcome to AstralHook.", Image = "rbxassetid://4370317928", Time = 5})

local Delay = 0.1

Section1:AddTextbox({Name = "Click & Collect Delay", Default = "0.1", TextDisappear = true, Callback = function(Value)
	Delay = Value
  end	  
})

Section1:AddToggle({Name = "Auto Click Sonic", Default = false, Callback = function(Value0)
 getgenv().AutoClick = Value0
 local Sonic = workspace.Sonic

 while AutoClick do task.wait(Delay)
       fireclickdetector(Sonic.Sonic.ClickDetector)
   end
end
})

Section1:AddToggle({Name = "Auto Collect Rings", Default = false, Callback = function(Value1)
 getgenv().AutoCollect = Value1
 while AutoCollect do task.wait(Delay)
    for _,v in next, Workspace:GetDescendants() do
	    if v.Name == "Ring" and v then
	         firetouchinterest(LocalPlayer.Character.Head, v, 0)
		     firetouchinterest(LocalPlayer.Character.Head, v, 1)
	     end
      end
   end
end  
})

Section1:AddToggle({Name = "Auto Buy Food", Default = false, Callback = function(Value2)
 getgenv().AutoBuyFood = Value2
 local Food = workspace.Food

 while AutoBuyFood and not Food.Full do task.wait(1)
	    ReplicatedStorage.Buy:FireServer("Sonic Food")
   end
end  
})

Section1:AddToggle({Name = "Auto Get Rent", Default = false, Callback = function(Value3)
 getgenv().AutoGetRent = Value3
 local CanGetRent = game:GetService("ReplicatedStorage").CanGetRent.Value
 local SonicEXE = game:GetService("ReplicatedStorage").SonicEXE.Value

 while AutoGetRent and CanGetRent and SonicEXE do task.wait(1)
	    ReplicatedStorage.RentEvent:FireServer("Get")
   end
end  
})

TabCred:AddLabel("Scripted by infinite#7302")
TabCred:AddLabel("UI Library by shlex#2767")

TabCred:AddParagraph("Info","Script changelogs at our Discord Server. If you find any bugs, inform us.")

TabCred:AddButton({Name = "Copy Discord Invite", Callback = function()
     setclipboard("https://discord.gg/ssaVPA6atd")
	 print("AstralHook: Copied Discord Server Invite to Clipboard.")
	 OrionLib:MakeNotification({Name = "AstralHook", Content = "Copied Discord Server Invite to Clipboard.", Image = "rbxassetid://4370317928", Time = 2})
  end    
})

TabCred:AddBind({Name = "UI Toggle Keybind", Default = Enum.KeyCode.RightShift, Hold = false, Callback = function()
  end    
})

OrionLib:Init()
