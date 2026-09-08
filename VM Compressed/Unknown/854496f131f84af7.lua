local plr = game.Players.LocalPlayer.Character.HumanoidRootPart

local function Pb(b)
        plr.CFrame = game:GetService("Workspace").Current.CurrentMap.Buttons:FindFirstChild(b).Head.CFrame
end

local function AltPb(b)
        plr.CFrame = game:GetService("Workspace").Current.CurrentMap:FindFirstChild(b).Head.CFrame
end

local function Wind()
    game.Workspace.Current.CurrentMap.ExitRegion.CFrame = plr.CFrame
end

local function Altwin()
    game.Workspace.Current:FindFirstChild("ExitRegion").CFrame = plr.CFrame
end

game:GetService("StarterGui"):SetCore("SendNotification",{ 	
    Title = "Note", 	
    Text = "If the features dont work, re-execute the script!",
    Duration = 5
})

local function notif(title,text,dur)
game:GetService("StarterGui"):SetCore("SendNotification",{ 	
    Title = title, 	
    Text = text,
    Duration = dur
})
end

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/InfinitiveUI",true))()


--Lib:CreateWindow(name,DefTab,WinSize,function)
local Win = Lib:CreateWindow("Nick's DP Dash",90,nil,nil)
local Tab,name = Win:CreateTab("Main",function() end)



Tab:CreateButton("Auto win/Press all buttons" ,function()
Pb("Button1")
wait(0.3)
Pb("Button2")
wait(0.3)
Pb("Button3")
wait(0.3)
Pb("Button4")
wait(0.3)
Pb("Button5")
wait(0.3)
Pb("Button6")
wait(0.3)
Pb("Button7")
wait(0.3)
Pb("Button8")
wait(0.3)
Pb("Button9")
wait(0.3)
Pb("Button10")
wait(0.3)
Pb("Button11")
wait(0.3)
Pb("Button12")
wait(0.3)
Pb("Button13")
end)

Tab:CreateButton("Alt-Press Buttons (Use if v1 doesnt work)" ,function()
AltPb("Button1")
wait(0.3)
AltPb("Button2")
wait(0.3)
AltPb("Button3")
wait(0.3)
AltPb("Button4")
wait(0.3)
AltPb("Button5")
wait(0.3)
AltPb("Button6")
wait(0.3)
AltPb("Button7")
wait(0.3)
AltPb("Button8")
wait(0.3)
AltPb("Button9")
wait(0.3)
AltPb("Button10")
wait(0.3)
AltPb("Button11")
wait(0.3)
AltPb("Button12")
wait(0.3)
AltPb("Button13")
end)

Tab:CreateButton("Exit (all buttons must be pressed" ,function()
Wind()
end)

Tab:CreateButton("Alt-Exit (all buttons must be pressed)" ,function()
Altwin()
end)

local Tab,name = Win:CreateTab("Water",function() end)

Tab:CreateButton("Delete water" ,function()
    game.Workspace.Current.CurrentMap.Liquid:Destroy()
    game.Workspace.Current.CurrentMap.Water1:Destroy()
    game.Workspace.Current.CurrentMap.Water2:Destroy()
    game.Workspace.Current.CurrentMap.Water3:Destroy()
end)


_G.InfiniteAir = false

local function InfAirCheckTrue()
  while _G.InfiniteAir == true do
   wait()
   game.Players.LocalPlayer.PlayerInfo.MaxAir.Value = 999999
   game.Players.LocalPlayer.PlayerInfo.Air.Value = 999999
 end
end

local function InfAirCheckFalse()
  if _G.InfiniteAir == false then
      game.Players.LocalPlayer.PlayerInfo.MaxAir.Value = 100
      game.Players.LocalPlayer.PlayerInfo.Air.Value = 100
  end
end

local function GiveAir(Amt)
   game.Players.LocalPlayer.PlayerInfo.MaxAir.Value = game.Players.LocalPlayer.PlayerInfo.MaxAir.Value + tonumber(Amt)
   game.Players.LocalPlayer.PlayerInfo.Air.Value = game.Players.LocalPlayer.PlayerInfo.Air.Value + tonumber(Amt)
end

Tab:CreateButton("Infinite Air", function()
_G.InfiniteAir = true
   InfAirCheckTrue()
end)

Tab:CreateButton("UnInfinite Air (double click)", function()
_G.InfiniteAir = false
   InfAirCheckFalse()
end)

Tab:CreateButton("+50 air", function()
GiveAir(50)
end)

Tab:CreateButton("+100 air", function()
GiveAir(100)
end)

Tab:CreateButton("+500 air", function()
GiveAir(500)
end)

Tab:CreateButton("+1000 air", function()
GiveAir(1000)
end)

Tab:CreateButton("+Infinite air", function()
GiveAir("inf")
end)



local Tab,name = Win:CreateTab("Player",function() end)

Tab:CreateButton("Infinite Jump (thanks chatgpt)", function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';
 
_G.JumpHeight = 50;
 
function Action(Object, Function) if Object ~= nil then Function(Object); end end
 
UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
end)

_G.Noclip = false



Tab:CreateButton("Noclip/Clip", function()
   for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
      if v:IsA("Part") then
         v.CanCollide = false
      elseif v.CanCollide == false then
        v.CanCollide = true
        end
     end
end)
