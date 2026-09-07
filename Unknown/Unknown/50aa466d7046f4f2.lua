-- Obfuscated + minified ScriptVaultHub (error msg 5s if no base saved)
local a=game.Players.LocalPlayer;local b=game:GetService("TweenService");local c=nil;local d=Instance.new("ScreenGui");d.Name="🔒ScriptVaultHub🔒";d.ResetOnSpawn=false;d.Parent=a:WaitForChild("PlayerGui")
local e=Instance.new("Frame");e.Size=UDim2.new(0,220,0,300);e.Position=UDim2.new(0.5,-110,0.5,-150);e.BackgroundColor3=Color3.fromRGB(30,30,30);e.BorderSizePixel=0;e.Active=true;e.Draggable=true;e.Parent=d
local f=Instance.new("UICorner");f.CornerRadius=UDim.new(0,12);f.Parent=e
local g=Instance.new("TextLabel");g.Size=UDim2.new(1,0,0,44);g.Position=UDim2.new(0,0,0,0);g.BackgroundTransparency=1;g.Text="🔒ScriptVaultHub🔒";g.TextColor3=Color3.fromRGB(255,255,255);g.Font=Enum.Font.GothamBold;g.TextScaled=true;g.Parent=e
local h=Instance.new("TextLabel");h.Size=UDim2.new(1,0,0,20);h.Position=UDim2.new(0,0,0,44);h.BackgroundTransparency=1;h.Text="Made by Neinmanstop";h.TextColor3=Color3.fromRGB(139,0,0);h.Font=Enum.Font.Gotham;h.TextScaled=true;h.Parent=e
local i=Instance.new("TextLabel");i.Size=UDim2.new(1,0,0,20);i.Position=UDim2.new(0,0,0,66);i.BackgroundTransparency=1;i.Text="";i.TextColor3=Color3.fromRGB(0,255,0);i.Font=Enum.Font.GothamBold;i.TextScaled=true;i.Parent=e
local function j(k,l,m,n)local o=Instance.new("TextButton");o.Size=UDim2.new(0.88,0,0,34);o.Position=UDim2.new(0.06,0,0,m);o.BackgroundColor3=n;o.TextColor3=Color3.fromRGB(255,255,255);o.Font=Enum.Font.GothamBold;o.TextScaled=true;o.Text=l;o.Parent=k;o.AutoButtonColor=true;o.BorderSizePixel=0;local p=Instance.new("UICorner");p.CornerRadius=UDim.new(0,8);p.Parent=o;return o end
local q=j(e,"Save Base Position",96,Color3.fromRGB(70,130,180));local r=j(e,"Tween to Base",142,Color3.fromRGB(50,205,50));local s=j(e,"Get into Base",188,Color3.fromRGB(255,0,0));local t=j(e,"Roof TP",234,Color3.fromRGB(255,165,0));local u=j(e,"Insta steal 🤯",272,Color3.fromRGB(128,0,128))
local v=Instance.new("TextButton");v.Size=UDim2.new(0,26,0,26);v.Position=UDim2.new(1,-30,0,8);v.BackgroundColor3=Color3.fromRGB(180,180,180);v.TextColor3=Color3.fromRGB(0,0,0);v.Text="-";v.Font=Enum.Font.GothamBold;v.TextScaled=true;v.Parent=e;Instance.new("UICorner",v).CornerRadius=UDim.new(0,6)
local w=v:Clone();w.Text="+";w.Visible=false;w.Parent=e
local x=false;local y=174.285888671875;local z=-5.154046058654785
local function A(B)local C=a.Character;if C then for _,D in pairs(C:GetDescendants())do if D:IsA("BasePart")then D.CanCollide=not B end end end end
local function E()local F=a.Character;if not F then return end;local G=F:FindFirstChildOfClass("Humanoid");if not G then return end;local H=Instance.new("Animation");H.AnimationId="rbxassetid://180435571";local I=G:LoadAnimation(H);I.Priority=Enum.AnimationPriority.Action;I:Play();return I end
local function J(K)local L=Instance.new("Frame");L.Size=UDim2.new(1,0,1,0);L.Position=UDim2.new(0,0,0,0);L.BackgroundColor3=Color3.fromRGB(0,0,0);L.BackgroundTransparency=0;L.ZIndex=10;L.Parent=d;local M=Instance.new("TextLabel");M.Size=UDim2.new(1,0,0,40);M.Position=UDim2.new(0,0,0.5,-20);M.BackgroundTransparency=1;M.TextColor3=Color3.fromRGB(255,255,255);M.Font=Enum.Font.GothamBold;M.TextScaled=true;M.ZIndex=11;M.Text=K;M.Parent=L;local N=true;coroutine.wrap(function()local O=0;while N do O=O%3+1;M.Text=K..string.rep(".",O);task.wait(0.5)end end)();return L,function()N=false end end
v.MouseButton1Click:Connect(function()e.Size=UDim2.new(0,220,0,80);q.Visible=false;r.Visible=false;s.Visible=false;t.Visible=false;u.Visible=false;h.Visible=false;i.Visible=false;v.Visible=false;w.Visible=true end)
w.MouseButton1Click:Connect(function()e.Size=UDim2.new(0,220,0,300);q.Visible=true;r.Visible=true;s.Visible=true;t.Visible=true;u.Visible=true;h.Visible=true;i.Visible=true;v.Visible=true;w.Visible=false end)
q.MouseButton1Click:Connect(function()local P=a.Character;if P and P:FindFirstChild("HumanoidRootPart")then c=P.HumanoidRootPart.Position;i.Text="Successfully saved position! ✅";task.wait(1.6);i.Text=""end end)
r.MouseButton1Click:Connect(function()
 local P=a.Character;local Q=P and P:FindFirstChild("HumanoidRootPart")
 if not Q or not c then
  local old=r.Text;r.Text="Please save base position first.";task.wait(5);r.Text=old;return
 end
 A(true);local R,S=J("Tweening to Base");local T=CFrame.new(Q.Position.X,y,Q.Position.Z);local U=b:Create(Q,TweenInfo.new(1,Enum.EasingStyle.Linear),{CFrame=T});local V=E();U:Play();U.Completed:Wait();if V then V:Stop()end;task.wait(3);local W=(Q.Position-c).Magnitude;local X=250;local Y=W/X;local Z=b:Create(Q,TweenInfo.new(Y,Enum.EasingStyle.Linear),{CFrame=CFrame.new(c)});Z:Play();Z.Completed:Wait();A(false);S();R:Destroy();i.Text="Reached base! ✅";task.wait(1.6);i.Text=""end)
t.MouseButton1Click:Connect(function()local P=a.Character;local Q=P and P:FindFirstChild("HumanoidRootPart");if not Q then return end;local aa,ab;if not x then aa=y;ab="Teleporting to Roof";t.Text="Go Down" else aa=z;ab="Going Down";t.Text="Roof TP" end;x=not x;A(true);local ac,ad=J(ab);local ae=b:Create(Q,TweenInfo.new(3,Enum.EasingStyle.Linear),{CFrame=CFrame.new(Q.Position.X,aa,Q.Position.Z)});ae:Play();ae.Completed:Wait();A(false);ad();ac:Destroy()end)
s.MouseButton1Click:Connect(function()local P=a.Character;local Q=P and P:FindFirstChild("HumanoidRootPart");if Q then local af=Q.CFrame.LookVector;local ag=Q.Position+af*7;Q.CFrame=CFrame.new(ag,ag+Q.CFrame.LookVector) end end)
u.MouseButton1Click:Connect(function()
 local P=a.Character;local HRP=P and P:FindFirstChild("HumanoidRootPart")
 if not HRP or not c then
  local old=u.Text;u.Text="Please save base position first.";task.wait(5);u.Text=old;return
 end
 A(true);local tEnd=tick()+2
 coroutine.wrap(function()while tick()<tEnd do local Q=a.Character;local R=Q and Q:FindFirstChild("HumanoidRootPart");if not R then break end;pcall(function()if R and c then R.CFrame=CFrame.new(c)end end);task.wait(0.01)end;A(false)end)()
end)
a.CharacterAdded:Connect(function()local P=a.Character;P:WaitForChild("HumanoidRootPart") end)