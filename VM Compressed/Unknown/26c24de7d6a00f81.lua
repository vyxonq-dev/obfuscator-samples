-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local submit = Instance.new("TextButton")
local gametext = Instance.new("TextLabel")
local status = Instance.new("TextLabel")
local checking = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.CoreGui

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.36150521, 0, 0.447272718, 0)
Frame.Size = UDim2.new(0, 203, 0, 152)
Frame.Active = true
Frame.Draggable = true

submit.Name = "submit"
submit.Parent = Frame
submit.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
submit.BorderSizePixel = 0
submit.Position = UDim2.new(0.317900956, 0, 0.774806798, 0)
submit.Size = UDim2.new(0, 72, 0, 22)
submit.Visible = false
submit.Font = Enum.Font.SourceSans
submit.Text = "Submit"
submit.TextColor3 = Color3.fromRGB(255, 255, 255)
submit.TextSize = 14.000

gametext.Name = "gametext"
gametext.Parent = Frame
gametext.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
gametext.BackgroundTransparency = 1.000
gametext.Position = UDim2.new(0.157677218, 0, 0.545811176, 0)
gametext.Size = UDim2.new(0, 136, 0, 22)
gametext.Font = Enum.Font.SourceSans
gametext.Text = "Game:"
gametext.TextColor3 = Color3.fromRGB(255, 255, 255)
gametext.TextSize = 15.000

status.Name = "status"
status.Parent = Frame
status.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
status.BackgroundTransparency = 1.000
status.Position = UDim2.new(0.325686753, 0, 0.282894731, 0)
status.Size = UDim2.new(0, 65, 0, 27)
status.Font = Enum.Font.SourceSans
status.Text = "Status:"
status.TextColor3 = Color3.fromRGB(255, 255, 255)
status.TextSize = 15.000

checking.Name = "checking"
checking.Parent = Frame
checking.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
checking.BackgroundTransparency = 1.000
checking.Position = UDim2.new(0.0104157627, 0, -0.00156928599, 0)
checking.Size = UDim2.new(0, 65, 0, 27)
checking.Font = Enum.Font.SourceSans
checking.Text = "Checking..."
checking.TextColor3 = Color3.fromRGB(255, 255, 255)
checking.TextSize = 15.000

if game.PlaceId == 621129760 then
	wait(5)
	checking.Visible = false
	status.Text = ("Status: Success")
	gametext.Text = ("Game: Knife Ability Test")
	status.TextColor3 = Color3.new(85, 255, 0)
	wait(3)
	submit.Visible = true
	submit.MouseButton1Click:connect(function()
		local a=Instance.new("ScreenGui")local b=Instance.new("Frame")local c=Instance.new("TextLabel")local d=Instance.new("TextButton")local e=Instance.new("TextButton")local f=Instance.new("TextButton")a.Parent=game.CoreGui;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(45,45,45)b.BorderSizePixel=0;b.Position=UDim2.new(0.481801391,0,0.261818171,0)b.Size=UDim2.new(0,183,0,163)b.Active=true;b.Draggable=true;c.Parent=b;c.BackgroundColor3=Color3.fromRGB(255,255,255)c.BackgroundTransparency=1.000;c.BorderSizePixel=0;c.Position=UDim2.new(0.196721315,0,0,0)c.Size=UDim2.new(0,110,0,48)c.Font=Enum.Font.SourceSans;c.Text="KAT"c.TextColor3=Color3.fromRGB(255,170,0)c.TextSize=15.000;c.TextWrapped=true;d.Name="esp"d.Parent=b;d.BackgroundColor3=Color3.fromRGB(50,50,50)d.BorderSizePixel=0;d.Position=UDim2.new(0.0396174863,0,0.525758684,0)d.Size=UDim2.new(0,168,0,31)d.Font=Enum.Font.SourceSans;d.Text="ESP"d.TextColor3=Color3.fromRGB(255,255,255)d.TextSize=14.000;e.Name="saim"e.Parent=b;e.BackgroundColor3=Color3.fromRGB(50,50,50)e.BorderSizePixel=0;e.Position=UDim2.new(0.0396174863,0,0.291177094,0)e.Size=UDim2.new(0,168,0,31)e.Font=Enum.Font.SourceSans;e.Text="Silent Aim"e.TextColor3=Color3.fromRGB(255,255,255)e.TextSize=14.000;f.Name="exit"f.Parent=b;f.BackgroundColor3=Color3.fromRGB(50,50,50)f.BorderSizePixel=0;f.Position=UDim2.new(0.0396174863,0,0.770678937,0)f.Size=UDim2.new(0,168,0,31)f.Font=Enum.Font.SourceSans;f.Text="Exit"f.TextColor3=Color3.fromRGB(255,255,255)f.TextSize=14.000;d.MouseButton1Click:connect(function()function WTS(g)local h=workspace.CurrentCamera:WorldToViewportPoint(g.Position)return Vector2.new(h.x,h.y)end;function ESPText(g,i)local j=Drawing.new("Text")j.Text=g.Parent.Name;j.Color=i;j.Position=WTS(g)j.Size=20.0;j.Outline=true;j.Center=true;j.Visible=true;game:GetService("RunService").Stepped:connect(function()pcall(function()local k=not g:IsDescendantOf(workspace)if k and j~=nil then j:Remove()end;if g~=nil then j.Position=WTS(g)end;local l,h=workspace.CurrentCamera:WorldToViewportPoint(g.Position)if h then j.Visible=true else j.Visible=false end end)end)end;local m=game.Players:getChildren()for n=1,#m do if m[n]~=game.Players.LocalPlayer then if m[n].Character:findFirstChild("HumanoidRootPart")then ESPText(m[n].Character.HumanoidRootPart,Color3.new(255/255,0/255,0/255))end;m[n].CharacterAdded:connect(function(o)local p=o:WaitForChild("HumanoidRootPart")ESPText(p,Color3.new(255/255,0/255,0/255))end)end end;game.Players.PlayerAdded:Connect(function(q)q.CharacterAdded:connect(function(o)local p=o:WaitForChild("HumanoidRootPart")ESPText(p,Color3.new(255/255,0/255,0/255))end)end)end)f.MouseButton1Click:connect(function()b.Visible=false end)e.MouseButton1Click:connect(function()local r=game:GetService("Workspace").CurrentCamera;local s=game:GetService("Players")local t=game:GetService("Players").LocalPlayer;local function u()local v=nil;local w=math.huge;for n,x in pairs(s.GetPlayers(s))do if x~=t and x.Character and x.Character.FindFirstChild(x.Character,"HumanoidRootPart")then local y=(t.Character.HumanoidRootPart.Position-x.Character.HumanoidRootPart.Position).Magnitude;if y<w then w=y;v=x end end end;if v then return v end end;local z=getrawmetatable(game)local A=z.__namecall;setreadonly(z,false)z.__namecall=newcclosure(function(B,...)local C=getnamecallmethod()local D={...}if tostring(C)=="FindPartOnRayWithIgnoreList"then local v=u()if v and v.Character then D[1]=Ray.new(r.CFrame.Position,(v.Character.Head.Position-r.CFrame.Position).Unit*(r.CFrame.Position-v.Character.Head.Position).Magnitude)end end;return A(B,unpack(D))end)setreadonly(z,true)end)
		Frame.Visible = false
	end)
end

if game.PlaceId == 3527629287 then
	wait(5)
	checking.Visible = false
	status.Text = ("Status: Success")
	gametext.Text = ("Game: BIG Paintball")
	status.TextColor3 = Color3.new(85, 255, 0)
	wait(3)
	submit.Visible = true
	submit.MouseButton1Click:connect(function()
		local a=Instance.new("ScreenGui")local b=Instance.new("Frame")local c=Instance.new("TextButton")local d=Instance.new("TextButton")local e=Instance.new("TextLabel")local f=Instance.new("TextButton")local g=Instance.new("TextButton")local h=Instance.new("TextButton")local i=Instance.new("TextButton")local j=Instance.new("TextButton")a.Parent=game.CoreGui;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(45,45,45)b.BorderSizePixel=0;b.Position=UDim2.new(0.6057989,0,0.334882259,0)b.Size=UDim2.new(0,183,0,345)b.Active=true;b.Draggable=true;c.Name="gunmods"c.Parent=b;c.BackgroundColor3=Color3.fromRGB(50,50,50)c.BorderSizePixel=0;c.Position=UDim2.new(0.0450819656,0,0.0913862139,0)c.Size=UDim2.new(0,168,0,35)c.Font=Enum.Font.SourceSans;c.Text="Gun Mods"c.TextColor3=Color3.fromRGB(255,255,255)c.TextSize=14.000;d.Name="shields"d.Parent=b;d.BackgroundColor3=Color3.fromRGB(50,50,50)d.BorderSizePixel=0;d.Position=UDim2.new(0.0450819656,0,0.214071199,0)d.Size=UDim2.new(0,168,0,37)d.Font=Enum.Font.SourceSans;d.Text="Destroy Spawn Shields"d.TextColor3=Color3.fromRGB(255,255,255)d.TextSize=14.000;e.Parent=b;e.BackgroundColor3=Color3.fromRGB(255,255,255)e.BackgroundTransparency=1.000;e.BorderSizePixel=0;e.Position=UDim2.new(0.191256836,0,0,0)e.Size=UDim2.new(0,110,0,32)e.Font=Enum.Font.SourceSans;e.Text="BIG Paintball"e.TextColor3=Color3.fromRGB(255,170,0)e.TextSize=15.000;e.TextWrapped=true;f.Name="exit"f.Parent=b;f.BackgroundColor3=Color3.fromRGB(50,50,50)f.BorderSizePixel=0;f.Position=UDim2.new(0.0396174826,0,0.857610226,0)f.Size=UDim2.new(0,168,0,35)f.Font=Enum.Font.SourceSans;f.Text="Exit"f.TextColor3=Color3.fromRGB(255,255,255)f.TextSize=14.000;g.Name="ctrl"g.Parent=b;g.BackgroundColor3=Color3.fromRGB(50,50,50)g.BorderSizePixel=0;g.Position=UDim2.new(0.0450819656,0,0.342388242,0)g.Size=UDim2.new(0,168,0,34)g.Font=Enum.Font.SourceSans;g.Text="Ctrl TP"g.TextColor3=Color3.fromRGB(255,255,255)g.TextSize=14.000;h.Name="tdm"h.Parent=b;h.BackgroundColor3=Color3.fromRGB(50,50,50)h.BorderSizePixel=0;h.Position=UDim2.new(0.0450819656,0,0.463830352,0)h.Size=UDim2.new(0,168,0,38)h.Font=Enum.Font.SourceSans;h.Text="TDM"h.TextColor3=Color3.fromRGB(255,255,255)h.TextSize=14.000;i.Name="ffa"i.Parent=b;i.BackgroundColor3=Color3.fromRGB(50,50,50)i.BorderSizePixel=0;i.Position=UDim2.new(0.0450819656,0,0.597163677,0)i.Size=UDim2.new(0,168,0,38)i.Font=Enum.Font.SourceSans;i.Text="FFA"i.TextColor3=Color3.fromRGB(255,255,255)i.TextSize=14.000;j.Name="esp"j.Parent=b;j.BackgroundColor3=Color3.fromRGB(50,50,50)j.BorderSizePixel=0;j.Position=UDim2.new(0.0450819656,0,0.724699914,0)j.Size=UDim2.new(0,168,0,38)j.Font=Enum.Font.SourceSans;j.Text="ESP"j.TextColor3=Color3.fromRGB(255,255,255)j.TextSize=14.000;d.MouseButton1Click:connect(function()game:GetService("Workspace")["__MAP"].SpawnShields:Destroy()end)c.MouseButton1Click:connect(function()for k,l in next,getgc(true)do if type(l)=="table"and rawget(l,"damage")then l.damage=math.huge;l.firerate=0.000000001;l.velocity=50000;l.automatic=true;l.additionalspeed=10;l.gadgetDamage=math.huge end end end)j.MouseButton1Click:connect(function()function WTS(m)local n=workspace.CurrentCamera:WorldToViewportPoint(m.Position)return Vector2.new(n.x,n.y)end;function ESPText(m,o)local p=Drawing.new("Text")p.Text=m.Parent.Name;p.Color=o;p.Position=WTS(m)p.Size=20.0;p.Outline=true;p.Center=true;p.Visible=true;game:GetService("RunService").Stepped:connect(function()pcall(function()local q=not m:IsDescendantOf(workspace)if q and p~=nil then p:Remove()end;if m~=nil then p.Position=WTS(m)end;local r,n=workspace.CurrentCamera:WorldToViewportPoint(m.Position)if n then p.Visible=true else p.Visible=false end end)end)end;local s=game.Players:getChildren()for k=1,#s do if s[k]~=game.Players.LocalPlayer then if s[k].Character:findFirstChild("HumanoidRootPart")then ESPText(s[k].Character.HumanoidRootPart,Color3.new(255/255,0/255,0/255))end;s[k].CharacterAdded:connect(function(t)local u=t:WaitForChild("HumanoidRootPart")ESPText(u,Color3.new(255/255,0/255,0/255))end)end end;game.Players.PlayerAdded:Connect(function(v)v.CharacterAdded:connect(function(t)local u=t:WaitForChild("HumanoidRootPart")ESPText(u,Color3.new(255/255,0/255,0/255))end)end)end)d.MouseButton1Click:connect(function()while wait()do game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass"Humanoid".WalkSpeed=50 end end)f.MouseButton1Click:connect(function()b.Visible=false end)i.MouseButton1Click:connect(function()_G.FFA=true;game:GetService('RunService').Stepped:connect(function()game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)end)while _G.FFA do for k,l in pairs(game.Players:GetChildren())do if l~=game.Players.LocalPlayer and l.Character~=nil and l.Character:FindFirstChild("HumanoidRootPart")and l.Character.Humanoid.FloorMaterial~="Air"then repeat wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(l.Character.HumanoidRootPart.Position+Vector3.new(-5,20,0),l.Character.HumanoidRootPart.Position)until l.Character.Humanoid.Health<1 end end end end)h.MouseButton1Click:connect(function()_G.TDM=true;game:GetService('RunService').Stepped:connect(function()game.Players.LocalPlayer.Character:findFirstChildOfClass("Humanoid"):ChangeState(11)end)while _G.TDM do for k,l in pairs(game.Players:GetChildren())do if l~=game.Players.LocalPlayer and l.Character~=nil and l.Character:FindFirstChild("HumanoidRootPart")and l.Team~=game.Players.LocalPlayer.Team and l.Character.Humanoid.FloorMaterial~="Air"then repeat wait()game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(l.Character.HumanoidRootPart.Position+Vector3.new(-5,20,0),l.Character.HumanoidRootPart.Position)until l.Character.Humanoid.Health<1 end end end end)game:GetService("StarterGui"):SetCore("SendNotification",{Title="BIG Paintball Killer",Text="By plantak",Duration=12})g.MouseButton1Down:connect(function()local w=game:GetService("Players").LocalPlayer;local x=w:GetMouse()x.Button1Down:connect(function()if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl)then return end;if not x.Target then return end;w.Character:MoveTo(x.Hit.p)end)end)
		Frame.Visible = false
	end)
end


if game.PlaceId == 2377868063 then
	wait(5)
	checking.Visible = false
	status.Text = ("Status: Success")
	gametext.Text = ("Game: Strucid")
	status.TextColor3 = Color3.new(85, 255, 0)
	wait(3)
	submit.Visible = true
	submit.MouseButton1Click:connect(function()
		local a=Instance.new("ScreenGui")local b=Instance.new("Frame")local c=Instance.new("TextButton")local d=Instance.new("TextButton")local e=Instance.new("TextLabel")local f=Instance.new("TextButton")local g=Instance.new("TextButton")local h=Instance.new("TextButton")a.Parent=game.CoreGui;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(45,45,45)b.BorderSizePixel=0;b.Position=UDim2.new(0.595928431,0,0.487272799,0)b.Size=UDim2.new(0,183,0,245)b.Active=true;b.Draggable=true;c.Name="Hitbox"c.Parent=b;c.BackgroundColor3=Color3.fromRGB(50,50,50)c.BorderSizePixel=0;c.Position=UDim2.new(0.0396174863,0,0.133137912,0)c.Size=UDim2.new(0,168,0,35)c.Font=Enum.Font.SourceSans;c.Text="Hitbox"c.TextColor3=Color3.fromRGB(255,255,255)c.TextSize=14.000;d.Name="esp"d.Parent=b;d.BackgroundColor3=Color3.fromRGB(50,50,50)d.BorderSizePixel=0;d.Position=UDim2.new(0.0450819656,0,0.300315648,0)d.Size=UDim2.new(0,168,0,37)d.Font=Enum.Font.SourceSans;d.Text="ESP"d.TextColor3=Color3.fromRGB(255,255,255)d.TextSize=14.000;e.Parent=b;e.BackgroundColor3=Color3.fromRGB(255,255,255)e.BackgroundTransparency=1.000;e.BorderSizePixel=0;e.Position=UDim2.new(0.191256836,0,0,0)e.Size=UDim2.new(0,110,0,32)e.Font=Enum.Font.SourceSans;e.Text="Strucid"e.TextColor3=Color3.fromRGB(255,170,0)e.TextSize=15.000;e.TextWrapped=true;f.Name="exit"f.Parent=b;f.BackgroundColor3=Color3.fromRGB(50,50,50)f.BorderSizePixel=0;f.Position=UDim2.new(0.0450819694,0,0.8266505,0)f.Size=UDim2.new(0,168,0,35)f.Font=Enum.Font.SourceSans;f.Text="Exit"f.TextColor3=Color3.fromRGB(255,255,255)f.TextSize=14.000;g.Name="infinitejumo"g.Parent=b;g.BackgroundColor3=Color3.fromRGB(50,50,50)g.BorderSizePixel=0;g.Position=UDim2.new(0.0450819694,0,0.476064891,0)g.Size=UDim2.new(0,168,0,35)g.Font=Enum.Font.SourceSans;g.Text="Injfinite Jump"g.TextColor3=Color3.fromRGB(255,255,255)g.TextSize=14.000;h.Name="hitboxffa"h.Parent=b;h.BackgroundColor3=Color3.fromRGB(50,50,50)h.BorderSizePixel=0;h.Position=UDim2.new(0.0450819656,0,0.646321476,0)h.Size=UDim2.new(0,168,0,38)h.Font=Enum.Font.SourceSans;h.Text="Hitbox For FFA"h.TextColor3=Color3.fromRGB(255,255,255)h.TextSize=14.000;f.MouseButton1Click:connect(function()b.Visible=false end)d.MouseButton1Click:connect(function()loadstring(game:HttpGet("https://pastebin.com/raw/DtLgSkxG",true))()end)g.MouseButton1Click:connect(function()local i=game:GetService'Players'.LocalPlayer;local j=game:GetService'UserInputService'_G.JumpHeight=50;function Action(k,l)if k~=nil then l(k)end end;j.InputBegan:connect(function(m)if m.UserInputType==Enum.UserInputType.Keyboard and m.KeyCode==Enum.KeyCode.Space then Action(i.Character.Humanoid,function(self)if self:GetState()==Enum.HumanoidStateType.Jumping or self:GetState()==Enum.HumanoidStateType.Freefall then Action(self.Parent.HumanoidRootPart,function(self)self.Velocity=Vector3.new(0,_G.JumpHeight,0)end)end end)end end)end)c.MouseButton1Click:connect(function()local n=game:GetService("Players")local o=n.LocalPlayer;while wait(.2)do for p,q in pairs(n:GetPlayers())do if tostring(q.Name)~=tostring(o.Name)then if tostring(q.Team)~=tostring(o.Team)then if q.Character~=nil then for p,r in pairs(q.Character:GetChildren())do if tostring(r.Name)=="HumanoidRootPart"then r.Size=Vector3.new(15,15,15)r.Material="Neon"r.BrickColor=BrickColor.new("Really blue")r.Transparency=0.7 end end end end end end end end)h.MouseButton1Click:connect(function()_G.Condition=true;while _G.Condition do _G.HeadSize=35;_G.Disabled=true;game:GetService('RunService').RenderStepped:connect(function()if _G.Disabled then for s,q in next,game:GetService('Players'):GetPlayers()do if q.Name~=game:GetService('Players').LocalPlayer.Name then pcall(function()q.Character.HumanoidRootPart.Size=Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)q.Character.HumanoidRootPart.Transparency=0.7;q.Character.HumanoidRootPart.BrickColor=BrickColor.new("Really blue")q.Character.HumanoidRootPart.Material="Neon"q.Character.HumanoidRootPart.CanCollide=false end)end end end end)wait(3)end end)
		Frame.Visible = false
	end)
end

if game.PlaceId == 185655149 then
	wait(5)
	checking.Visible = false
	status.Text = ("Status: Success")
	gametext.Text = ("Game: Bloxburg")
	status.TextColor3 = Color3.new(85, 255, 0)
	wait(3)
	submit.Visible = true
	submit.MouseButton1Click:connect(function()
		local a=Instance.new("ScreenGui")local b=Instance.new("Frame")local c=Instance.new("TextLabel")local d=Instance.new("TextButton")local e=Instance.new("TextButton")a.Parent=game.CoreGui;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(45,45,45)b.BorderSizePixel=0;b.Position=UDim2.new(0.481801391,0,0.261818171,0)b.Size=UDim2.new(0,183,0,125)b.Active=true;b.Draggable=true;c.Parent=b;c.BackgroundColor3=Color3.fromRGB(255,255,255)c.BackgroundTransparency=1.000;c.BorderSizePixel=0;c.Position=UDim2.new(0.196721315,0,0,0)c.Size=UDim2.new(0,110,0,48)c.Font=Enum.Font.SourceSans;c.Text="Bloxburg"c.TextColor3=Color3.fromRGB(255,170,0)c.TextSize=15.000;c.TextWrapped=true;d.Name="farm"d.Parent=b;d.BackgroundColor3=Color3.fromRGB(50,50,50)d.BorderSizePixel=0;d.Position=UDim2.new(0.0396174863,0,0.373758674,0)d.Size=UDim2.new(0,168,0,31)d.Font=Enum.Font.SourceSans;d.Text="Hairdresser Autofarm"d.TextColor3=Color3.fromRGB(255,255,255)d.TextSize=14.000;e.Name="exit"e.Parent=b;e.BackgroundColor3=Color3.fromRGB(50,50,50)e.BorderSizePixel=0;e.Position=UDim2.new(0.0396174863,0,0.682678938,0)e.Size=UDim2.new(0,168,0,31)e.Font=Enum.Font.SourceSans;e.Text="Exit"e.TextColor3=Color3.fromRGB(255,255,255)e.TextSize=14.000;b.MouseButton1Click:connect(function()b.Visible=false end)d.MouseButton1Click:connect(function()loadstring(game:HttpGet('https://ghostbin.com/THXnJ/raw',true))()end)
		Frame.Visible = false
	end)
end

if game.PlaceId == 1240123653 then
	wait(5)
	checking.Visible = false
	status.Text = ("Status: Success")
	gametext.Text = ("Game: Zombie Attack")
	status.TextColor3 = Color3.new(85, 255, 0)
	wait(3)
	submit.Visible = true
	submit.MouseButton1Click:connect(function()
		local a=Instance.new("ScreenGui")local b=Instance.new("Frame")local c=Instance.new("TextButton")local d=Instance.new("TextButton")local e=Instance.new("TextLabel")local f=Instance.new("TextButton")a.Parent=game.CoreGui;b.Parent=a;b.BackgroundColor3=Color3.fromRGB(45,45,45)b.BorderSizePixel=0;b.Position=UDim2.new(0.487970412,0,0.270303041,0)b.Size=UDim2.new(0,182,0,156)b.Visible=true;b.Draggable=true;c.Name="autofarm"c.Parent=b;c.BackgroundColor3=Color3.fromRGB(50,50,50)c.BorderSizePixel=0;c.Position=UDim2.new(0.0396174863,0,0.255468398,0)c.Size=UDim2.new(0,168,0,31)c.Font=Enum.Font.SourceSans;c.Text="Autofarm"c.TextColor3=Color3.fromRGB(255,255,255)c.TextSize=14.000;d.Name="Autoupgrade"d.Parent=b;d.BackgroundColor3=Color3.fromRGB(50,50,50)d.BorderSizePixel=0;d.Position=UDim2.new(0.0396174863,0,0.504797518,0)d.Size=UDim2.new(0,168,0,31)d.Font=Enum.Font.SourceSans;d.Text="AutoUpgrade"d.TextColor3=Color3.fromRGB(255,255,255)d.TextSize=14.000;e.Parent=b;e.BackgroundColor3=Color3.fromRGB(255,255,255)e.BackgroundTransparency=1.000;e.BorderSizePixel=0;e.Position=UDim2.new(0.19122684,0,-0.00641025649,0)e.Size=UDim2.new(0,110,0,40)e.Font=Enum.Font.SourceSans;e.Text="Zombie Attack"e.TextColor3=Color3.fromRGB(255,170,0)e.TextSize=15.000;e.TextWrapped=true;f.Name="exit"f.Parent=b;f.BackgroundColor3=Color3.fromRGB(50,50,50)f.BorderSizePixel=0;f.Position=UDim2.new(0.0396174863,0,0.757598877,0)f.Size=UDim2.new(0,168,0,31)f.Font=Enum.Font.SourceSans;f.Text="Exit"f.TextColor3=Color3.fromRGB(255,255,255)f.TextSize=14.000;f.MouseButton1Click:connect(function()b.Visible=false end)d.MouseButton1Click:connect(function()while wait(1)do loadstring(game:HttpGet("https://pastebin.com/raw/LNPhNCWy",true))()end end)c.MouseButton1Click:connect(function()loadstring(game:HttpGet("https://pastebin.com/raw/gP6HX5qJ",true))()end)
		Frame.Visible = false
	end)
end
