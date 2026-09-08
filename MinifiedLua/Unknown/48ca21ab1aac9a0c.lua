local OWNER="GG_gamerz002";local HS=game:GetService"HttpService";local BIN_ID="69c166c3aa77b81da9100153 ";local API_KEY="$2a$10$VnuxlSjWF1s3TgLKY7dTEOnSmQyAbFMnCWm8UWgzoUTSR6qYMKSQq"
local P,T,U,R=game:GetService"Players",game:GetService"TweenService",game:GetService"UserInputService",game:GetService"RunService"
local L=P.LocalPlayer;local TS=game:GetService"TeleportService";local Lighting=game:GetService"Lighting"
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList,false);local runtimeBans={}
local function loadBans()pcall(function()local r=game:HttpGet("https://api.jsonbin.io/v3/b/"..BIN_ID.."/latest")
local p=HS:JSONDecode(r);if p and p.record and p.record.bans then for _,n in ipairs(p.record.bans)do runtimeBans[n]=true end end end)end
local function saveBans()pcall(function()local l={};for n,_ in pairs(runtimeBans)do table.insert(l,n)end;local b=HS:JSONEncode({bans=l})
local hr=request or http_request or syn and syn.request or fluxus and fluxus.request or http and http.request
if hr then hr({Url="https://api.jsonbin.io/v3/b/"..BIN_ID,Method="PUT",Headers={["Content-Type"]="application/json",["X-Master-Key"]=API_KEY},Body=b})end end)end
loadBans();for n,_ in pairs(runtimeBans)do if L.Name==n then local bsg=Instance.new("ScreenGui",L:WaitForChild"PlayerGui")
local bf=Instance.new("Frame",bsg);bf.Size=UDim2.new(1,0,1,0);bf.BackgroundColor3=Color3.new(0,0,0);bf.BackgroundTransparency=.3
local bt=Instance.new("TextLabel",bf);bt.Size=UDim2.new(0,300,0,60);bt.Position=UDim2.new(.5,0,.5,0);bt.AnchorPoint=Vector2.new(.5,.5)
bt.BackgroundTransparency=1;bt.Text="🚫 BANNED from FLING GUI\nContact: "..OWNER;bt.TextColor3=Color3.new(1,.2,.2)
bt.TextSize=14;bt.Font=Enum.Font.GothamBold;bt.TextWrapped=true;return end end
local THE_SCRIPT=nil;if queue_on_teleport and THE_SCRIPT then pcall(function()queue_on_teleport(THE_SCRIPT)end)end
local function m(c,p,r)local i=Instance.new(c);for k,v in pairs(p)do i[k]=v end;i.Parent=r;return i end
local function cr(p,r)m("UICorner",{CornerRadius=UDim.new(0,r)},p)end
local function gd(p,a,b,r)m("UIGradient",{Color=ColorSequence.new(a,b),Rotation=r or 90},p)end
local function st(p,c,t,r)m("UIStroke",{Color=c,Thickness=t or 1,Transparency=r or.5},p)end
local function tw(o,t,p)T:Create(o,TweenInfo.new(t,Enum.EasingStyle.Quint),p):Play()end
local function dr(g,h)local d,s,p;h.InputBegan:Connect(function(i,gp)if gp then return end
if i.UserInputType==Enum.UserInputType.Touch then d=true;p=i.Position;s=g.Position end end)
h.InputEnded:Connect(function(i)if i.UserInputType==Enum.UserInputType.Touch then d=false end end)
U.InputChanged:Connect(function(i)if d and i.UserInputType==Enum.UserInputType.Touch then
local e=i.Position-p;g.Position=UDim2.new(s.X.Scale,s.X.Offset+e.X,s.Y.Scale,s.Y.Offset+e.Y)end end)end
local p1,p2,bg,cd,tx,sb,gn,fc,cy,ow_c=Color3.fromRGB(120,0,255),Color3.fromRGB(255,0,80),Color3.fromRGB(8,8,16),Color3.fromRGB(14,14,28),Color3.fromRGB(240,240,255),Color3.fromRGB(130,130,170),Color3.fromRGB(0,255,140),Color3.fromRGB(255,30,60),Color3.fromRGB(0,255,255),Color3.fromRGB(255,200,0)
local W,H,PAD=420,360,6;local spdVal,jmpVal,flySpd,charSize=16,50,80,1
local function safeChar()local c=L.Character;if not c or not c.Parent then return nil,nil,nil end
return c,c:FindFirstChild"HumanoidRootPart",c:FindFirstChildOfClass"Humanoid"end
local function safeDC(cn)if cn then pcall(function()cn:Disconnect()end)end;return nil end
local function safeDestroy(ob)if ob and ob.Parent then pcall(function()ob:Destroy()end)end;return nil end
local sg=m("ScreenGui",{ResetOnSpawn=false,ZIndexBehavior=Enum.ZIndexBehavior.Sibling},L:WaitForChild"PlayerGui")
local blur=Instance.new("BlurEffect");blur.Size=0;blur.Name="FlingGUIBlur";blur.Parent=Lighting;tw(blur,.5,{Size=24})
local lf=m("Frame",{Size=UDim2.new(0,W,0,H),Position=UDim2.new(.5,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(6,6,14),BackgroundTransparency=.35,ClipsDescendants=true,ZIndex=300},sg)
cr(lf,12);st(lf,p1,1,.3);gd(lf,Color3.fromRGB(4,4,12),Color3.fromRGB(12,4,24),170)
for i=0,52 do m("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,i*7),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=.93,BorderSizePixel=0,ZIndex=301},lf)end
local lGl=m("Frame",{Size=UDim2.new(1,0,0,2),BackgroundColor3=cy,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=305},lf)
task.spawn(function()while lf and lf.Parent do lGl.Position=UDim2.new(0,0,0,math.random(0,H));lGl.BackgroundTransparency=.4
lGl.BackgroundColor3=math.random()>.5 and cy or p2;task.wait(.05);lGl.BackgroundTransparency=1;task.wait(math.random()*.3+.1)end end)
m("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.new(0,2,0,H*.28+2),BackgroundTransparency=1,Text="⚡ FLING GUI",TextColor3=p2,TextTransparency=.6,TextSize=24,Font=Enum.Font.GothamBold,ZIndex=301},lf)
m("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.new(0,-1,0,H*.28-1),BackgroundTransparency=1,Text="⚡ FLING GUI",TextColor3=cy,TextTransparency=.6,TextSize=24,Font=Enum.Font.GothamBold,ZIndex=301},lf)
local lTi=m("TextLabel",{Size=UDim2.new(1,0,0,30),Position=UDim2.new(0,0,0,H*.28),BackgroundTransparency=1,Text="⚡ FLING GUI",TextColor3=tx,TextSize=24,Font=Enum.Font.GothamBold,ZIndex=302},lf)
local lsub=m("TextLabel",{Size=UDim2.new(1,0,0,14),Position=UDim2.new(0,0,0,H*.28+30),BackgroundTransparency=1,Text="By GG_gamerz002",TextSize=10,Font=Enum.Font.GothamBold,ZIndex=302},lf)
m("TextLabel",{Size=UDim2.new(1,0,0,10),Position=UDim2.new(0,0,0,H*.28+46),BackgroundTransparency=1,Text="v3.0 | Mobile Edition",TextColor3=sb,TextTransparency=.3,TextSize=8,Font=Enum.Font.Code,ZIndex=302},lf)
local lbb=m("Frame",{Size=UDim2.new(0,W-60,0,5),Position=UDim2.new(.5,0,0,H*.58),AnchorPoint=Vector2.new(.5,0),BackgroundColor3=Color3.fromRGB(15,15,30),BorderSizePixel=0,ZIndex=302},lf)
cr(lbb,3);st(lbb,p1,1,.4);local lbf=m("Frame",{Size=UDim2.new(0,0,1,0),BackgroundColor3=cy,BorderSizePixel=0,ZIndex=303},lbb)
cr(lbf,3);gd(lbf,cy,p1,0);m("Frame",{Size=UDim2.new(1,0,1,6),Position=UDim2.new(0,0,.5,0),AnchorPoint=Vector2.new(0,.5),BackgroundColor3=cy,BackgroundTransparency=.7,BorderSizePixel=0,ZIndex=302},lbf)
local lpc=m("TextLabel",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,0,0,H*.58-16),BackgroundTransparency=1,Text="0%",TextColor3=cy,TextSize=10,Font=Enum.Font.GothamBold,ZIndex=302},lf)
local lst=m("TextLabel",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,0,0,H*.58+12),BackgroundTransparency=1,Text="",TextColor3=sb,TextSize=9,Font=Enum.Font.Code,ZIndex=302},lf)
local lDt=m("TextLabel",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,0,0,H*.58+28),BackgroundTransparency=1,Text="",TextColor3=p1,TextTransparency=.4,TextSize=12,Font=Enum.Font.GothamBold,ZIndex=302},lf)
local lTp=m("TextLabel",{Size=UDim2.new(1,0,0,10),Position=UDim2.new(0,0,1,-16),BackgroundTransparency=1,Text="",TextColor3=sb,TextTransparency=.4,TextSize=8,Font=Enum.Font.Code,ZIndex=302},lf)
local tips={"Tip: Perma bans via cloud","Tip: Force Stop cancels all","Tip: Type any speed!","Tip: Godmode 5 layers","Tip: Owner can ban/unban","Tip: Tilt cam+joy to fly"}
local lRun=true;task.spawn(function()local h=0;while lRun do h=(h+1)%360
if lsub and lsub.Parent then lsub.TextColor3=Color3.fromHSV(h/360,1,1)end;task.wait(.02)end end)
task.spawn(function()local d=0;while lRun do d=(d%3)+1
if lDt and lDt.Parent then lDt.Text=string.rep("●",d)..string.rep("○",3-d)end;task.wait(.35)end end)
task.spawn(function()while lRun do if lTp and lTp.Parent then lTp.Text=tips[math.random(1,#tips)]end;task.wait(2)end end)
task.spawn(function()local gc2="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%";while lRun do task.wait(math.random()*2+.5)
if lTi and lTi.Parent then local g="";local orig="⚡ FLING GUI";for i=1,#orig do local r=math.random(1,#gc2)
g=g..(math.random()>.5 and gc2:sub(r,r)or orig:sub(i,i))end;lTi.Text=g;lTi.TextColor3=math.random()>.5 and cy or p2
task.wait(.06);lTi.Text=orig;lTi.TextColor3=tx end end end)
for _,s in ipairs({{"Initializing...",12,.8},{"Building interface...",30,.9},{"Setting up controls...",50,.8},{"Loading modules...",70,.9},{"Loading players...",88,.8},{"Chini Khaoge?\xF0\x9F\xA5\x80\xF0\x9F\x98\x82",100,1}})do
lst.Text=s[1];lpc.Text=s[2].."%";tw(lbf,.3,{Size=UDim2.new(s[2]/100,0,1,0)});task.wait(s[3])end
task.wait(.5);lpc.Text="100%";lst.Text="Loaded!";lst.TextColor3=gn;lDt.Text="✅";lDt.TextColor3=gn
lTp.Text="Welcome, "..L.DisplayName.."!";task.wait(1.2);lRun=false;tw(blur,.6,{Size=0});tw(lf,.5,{BackgroundTransparency=1})
for _,v in lf:GetDescendants()do pcall(function()if v:IsA"TextLabel"then tw(v,.5,{TextTransparency=1})
elseif v:IsA"Frame"then tw(v,.5,{BackgroundTransparency=1})end end)end;task.wait(.7);lf:Destroy();blur:Destroy()
local nf=m("Frame",{Size=UDim2.new(0,280,0,0),Position=UDim2.new(1,-12,1,-12),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,ZIndex=200},sg)
m("UIListLayout",{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Right},nf)
local function notify(ic,ms,co,du)task.spawn(function()pcall(function()local n=m("Frame",{Size=UDim2.new(1,0,0,0),BackgroundColor3=Color3.fromRGB(12,12,24),BackgroundTransparency=1,ClipsDescendants=true,ZIndex=201},nf)
cr(n,8);st(n,co or p1,1,.3);m("Frame",{Size=UDim2.new(0,3,1,-8),Position=UDim2.new(0,4,.5,0),AnchorPoint=Vector2.new(0,.5),BackgroundColor3=co or p1,BorderSizePixel=0,ZIndex=202},n)
m("TextLabel",{Size=UDim2.new(1,-18,1,0),Position=UDim2.new(0,14,0,0),BackgroundTransparency=1,Text=(ic or"⚡").." "..ms,TextColor3=tx,TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=203},n)
local pg=m("Frame",{Size=UDim2.new(1,0,0,2),Position=UDim2.new(0,0,1,-2),BackgroundColor3=co or p1,BorderSizePixel=0,ZIndex=204},n);gd(pg,co or p1,cy,0)
tw(n,.25,{Size=UDim2.new(1,0,0,36),BackgroundTransparency=.08});tw(pg,du or 3,{Size=UDim2.new(0,0,0,2)})
task.wait(du or 3);tw(n,.25,{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1});task.wait(.3);n:Destroy()end)end)end
local tb=m("TextButton",{Size=UDim2.new(0,50,0,50),Position=UDim2.new(1,-58,0,12),BackgroundColor3=Color3.fromRGB(10,10,20),Text="",AutoButtonColor=false,Visible=false},sg)
cr(tb,12);st(tb,p1,2,.2);dr(tb,tb);local tbI=m("Frame",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,ZIndex=3},tb)
for i=0,2 do local w=i==1 and 14 or 10;m("Frame",{Size=UDim2.new(0,w,0,2),Position=UDim2.new(.5,-w/2,.5,-4+i*4),BackgroundColor3=cy,BorderSizePixel=0,ZIndex=4},tbI)end
local tbG=m("Frame",{Size=UDim2.new(1,10,1,10),Position=UDim2.new(.5,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=p1,BackgroundTransparency=.85,ZIndex=-1},tb);cr(tbG,16)
task.spawn(function()while true do if tb.Visible then tw(tbG,.8,{BackgroundTransparency=.7,Size=UDim2.new(1,16,1,16)});task.wait(.8)
tw(tbG,.8,{BackgroundTransparency=.85,Size=UDim2.new(1,10,1,10)})end;task.wait(.8)end end)
local HD_H=48;local tabY=HD_H;local tabH2=26;local cntY=tabY+tabH2+2;local cntH=H-cntY-PAD
local mf=m("Frame",{Size=UDim2.new(0,W,0,H),Position=UDim2.new(1,-W-16,0,12),BackgroundColor3=bg,ClipsDescendants=true},sg);cr(mf,12);st(mf,p1,1,.4)
local bl=m("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=bg,ZIndex=0},mf);cr(bl,12);gd(bl,bg,Color3.fromRGB(16,8,32),170)
for i=0,52 do m("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,0,i*7),BackgroundColor3=Color3.new(1,1,1),BackgroundTransparency=.96,BorderSizePixel=0,ZIndex=1},mf)end
local gb=m("Frame",{Size=UDim2.new(1,0,0,2),BackgroundColor3=cy,BackgroundTransparency=1,BorderSizePixel=0,ZIndex=1},mf)
task.spawn(function()while task.wait(math.random()*3+.5)do gb.Position=UDim2.new(0,0,0,math.random(0,H));gb.BackgroundTransparency=.5
gb.BackgroundColor3=math.random()>.5 and cy or p2;task.wait(.04);gb.BackgroundTransparency=1 end end)
local hd=m("Frame",{Size=UDim2.new(1,0,0,HD_H),BackgroundColor3=Color3.fromRGB(12,0,30),BorderSizePixel=0,ZIndex=10},mf);cr(hd,12)
gd(hd,Color3.fromRGB(20,0,50),Color3.fromRGB(50,0,30),135)
m("Frame",{Size=UDim2.new(1,0,0,12),Position=UDim2.new(0,0,1,-12),BackgroundColor3=Color3.fromRGB(12,0,30),BorderSizePixel=0,ZIndex=10},hd)
local hl=m("Frame",{Size=UDim2.new(0,0,0,2),Position=UDim2.new(0,0,1,-2),BackgroundColor3=cy,BorderSizePixel=0,ZIndex=11},hd);gd(hl,cy,p1,0)
task.spawn(function()while true do tw(hl,1.5,{Size=UDim2.new(1,0,0,2)});task.wait(1.5);hl.Position=UDim2.new(1,0,1,-2)
tw(hl,1.5,{Size=UDim2.new(0,0,0,2)});task.wait(1.5);hl.Position=UDim2.new(0,0,1,-2)end end)
local dh=m("TextButton",{Size=UDim2.new(1,-76,1,0),BackgroundTransparency=1,Text="",ZIndex=12},hd);dr(mf,dh);local tB="⚡ FLING GUI"
m("TextLabel",{Size=UDim2.new(1,0,0,16),Position=UDim2.new(0,13,0,2),BackgroundTransparency=1,Text=tB,TextColor3=p2,TextTransparency=.5,TextSize=14,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=12},hd)
m("TextLabel",{Size=UDim2.new(1,0,0,16),Position=UDim2.new(0,10,0,4),BackgroundTransparency=1,Text=tB,TextColor3=cy,TextTransparency=.5,TextSize=14,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=12},hd)
local tM=m("TextLabel",{Size=UDim2.new(1,0,0,16),Position=UDim2.new(0,11,0,3),BackgroundTransparency=1,Text=tB,TextColor3=tx,TextSize=14,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=13},hd)
local gc="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()"
task.spawn(function()while true do task.wait(math.random()*4+1);local g=""for i=1,#tB do local r=math.random(1,#gc)
g=g..(math.random()>.6 and gc:sub(r,r)or tB:sub(i,i))end;tM.Text=g;tM.TextColor3=math.random()>.5 and cy or p2
task.wait(.06);tM.Text=tB;tM.TextColor3=tx end end)
local subT=m("TextLabel",{Size=UDim2.new(1,0,0,10),Position=UDim2.new(0,11,0,19),BackgroundTransparency=1,Text="By GG_gamerz002",TextSize=9,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=13},hd)
task.spawn(function()local h=0;while subT and subT.Parent do h=(h+1)%360;subT.TextColor3=Color3.fromHSV(h/360,1,1);task.wait(.02)end end)
local ct=m("TextLabel",{Size=UDim2.new(0,80,0,12),Position=UDim2.new(0,11,0,32),BackgroundTransparency=1,Text="[ 0 ONLINE ]",TextColor3=gn,TextSize=9,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=13},hd)
local xb=m("TextButton",{Size=UDim2.new(0,32,0,32),Position=UDim2.new(1,-38,.5,-16),BackgroundColor3=Color3.fromRGB(15,0,0),BackgroundTransparency=.3,Text="✕",TextColor3=fc,TextSize=14,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=14},hd);cr(xb,8);st(xb,fc,1.5,.4)
local isOwner=L.Name==OWNER;local banPanel,banSF,banInput,banBtn
if isOwner then local ob=m("TextButton",{Size=UDim2.new(0,32,0,32),Position=UDim2.new(1,-74,.5,-16),BackgroundColor3=Color3.fromRGB(30,20,0),BackgroundTransparency=.3,Text="👑",TextSize=14,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=14},hd);cr(ob,8);st(ob,ow_c,1.5,.4)
banPanel=m("Frame",{Size=UDim2.new(0,240,0,300),Position=UDim2.new(0,12,0,12),BackgroundColor3=Color3.fromRGB(10,10,20),ClipsDescendants=true,Visible=false,ZIndex=250},sg)
cr(banPanel,10);st(banPanel,ow_c,1.5,.3);dr(banPanel,banPanel)
local bph=m("Frame",{Size=UDim2.new(1,0,0,30),BackgroundColor3=Color3.fromRGB(30,20,0),BackgroundTransparency=.3,ZIndex=251},banPanel);cr(bph,10)
m("TextLabel",{Size=UDim2.new(1,-30,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,Text="👑 Ban Manager",TextColor3=ow_c,TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=252},bph)
local bc=m("TextButton",{Size=UDim2.new(0,24,0,24),Position=UDim2.new(1,-28,0,3),BackgroundColor3=Color3.fromRGB(40,0,0),Text="✕",TextColor3=fc,TextSize=10,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=253},bph);cr(bc,6)
local biF=m("Frame",{Size=UDim2.new(1,-8,0,30),Position=UDim2.new(0,4,0,34),BackgroundColor3=Color3.fromRGB(6,6,16),BorderSizePixel=0,ZIndex=252},banPanel);cr(biF,6);st(biF,fc,1,.5)
banInput=m("TextBox",{Size=UDim2.new(1,-65,1,-4),Position=UDim2.new(0,6,0,2),BackgroundTransparency=1,Text="",PlaceholderText="Username...",PlaceholderColor3=Color3.fromRGB(80,80,120),TextColor3=tx,TextSize=10,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=true,ZIndex=253},biF)
banBtn=m("TextButton",{Size=UDim2.new(0,55,0,22),Position=UDim2.new(1,-59,.5,-11),BackgroundColor3=Color3.fromRGB(50,0,0),Text="🚫 BAN",TextColor3=fc,TextSize=9,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=253},biF);cr(banBtn,5)
m("TextLabel",{Size=UDim2.new(1,-8,0,12),Position=UDim2.new(0,4,0,68),BackgroundTransparency=1,Text="Banned (tap UNBAN):",TextColor3=sb,TextSize=8,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=252},banPanel)
banSF=m("ScrollingFrame",{Size=UDim2.new(1,-8,1,-86),Position=UDim2.new(0,4,0,82),BackgroundTransparency=1,ScrollBarThickness=3,ScrollBarImageColor3=ow_c,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ZIndex=252},banPanel)
m("UIListLayout",{Padding=UDim.new(0,3),SortOrder=Enum.SortOrder.LayoutOrder},banSF)
ob.MouseButton1Click:Connect(function()banPanel.Visible=not banPanel.Visible end);bc.MouseButton1Click:Connect(function()banPanel.Visible=false end)end
local function refreshBanList()if not isOwner or not banSF then return end;for _,ch in banSF:GetChildren()do if ch:IsA"Frame"then ch:Destroy()end end
for name,_ in pairs(runtimeBans)do local row=m("Frame",{Size=UDim2.new(1,0,0,28),BackgroundColor3=Color3.fromRGB(20,5,5),BorderSizePixel=0,ZIndex=253},banSF);cr(row,5);st(row,fc,1,.5)
m("TextLabel",{Size=UDim2.new(1,-60,1,0),Position=UDim2.new(0,8,0,0),BackgroundTransparency=1,Text="🚫 "..name,TextColor3=fc,TextSize=9,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=254},row)
local ub=m("TextButton",{Size=UDim2.new(0,50,0,20),Position=UDim2.new(1,-54,.5,-10),BackgroundColor3=Color3.fromRGB(0,30,0),Text="✅UNBAN",TextColor3=gn,TextSize=8,Font=Enum.Font.Code,AutoButtonColor=false,ZIndex=255},row);cr(ub,4)
ub.MouseButton1Click:Connect(function()runtimeBans[name]=nil;saveBans();notify("✅","Unbanned: "..name,gn,2);refreshBanList()end)end
if not next(runtimeBans)then m("TextLabel",{Size=UDim2.new(1,0,0,20),BackgroundTransparency=1,Text="No banned users",TextColor3=sb,TextSize=9,Font=Enum.Font.Code,ZIndex=254},banSF)end end
if isOwner then banBtn.MouseButton1Click:Connect(function()local name=banInput.Text:gsub("%s+","")
if name==""then notify("⚠️","Enter username!",fc,2);return end;if name==OWNER then notify("⚠️","Can't ban yourself!",fc,2);return end
if runtimeBans[name]then notify("⚠️","Already banned!",fc,2);return end;runtimeBans[name]=true;banInput.Text=""
saveBans();notify("🚫","PERMA Banned: "..name,fc,3);refreshBanList()end);task.defer(refreshBanList)end
local tbar=m("Frame",{Size=UDim2.new(1,-PAD*2,0,tabH2),Position=UDim2.new(0,PAD,0,tabY),BackgroundColor3=Color3.fromRGB(8,8,20),BorderSizePixel=0,ZIndex=8},mf);cr(tbar,6);st(tbar,sb,1,.7)
local tabW=math.floor((W-PAD*2-10)/3);local activeTab="players"
local pTabBtn=m("TextButton",{Size=UDim2.new(0,tabW,0,22),Position=UDim2.new(0,3,.5,-11),BackgroundColor3=p1,Text="👥 Players",TextColor3=tx,TextSize=10,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=10},tbar);cr(pTabBtn,5);st(pTabBtn,p1,1,.5)
local fTabBtn=m("TextButton",{Size=UDim2.new(0,tabW,0,22),Position=UDim2.new(0,tabW+6,.5,-11),BackgroundColor3=Color3.fromRGB(20,20,40),Text="🎮 Fun",TextColor3=sb,TextSize=10,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=10},tbar);cr(fTabBtn,5);st(fTabBtn,sb,1,.5)
local tTabBtn=m("TextButton",{Size=UDim2.new(0,tabW,0,22),Position=UDim2.new(0,tabW*2+9,.5,-11),BackgroundColor3=Color3.fromRGB(20,20,40),Text="🔧 Tools",TextColor3=sb,TextSize=10,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=10},tbar);cr(tTabBtn,5);st(tTabBtn,sb,1,.5)
local pTab=m("Frame",{Size=UDim2.new(1,-PAD*2,0,cntH),Position=UDim2.new(0,PAD,0,cntY),BackgroundTransparency=1,Visible=true,ZIndex=5},mf)
local fTab=m("Frame",{Size=UDim2.new(1,-PAD*2,0,cntH),Position=UDim2.new(0,PAD,0,cntY),BackgroundTransparency=1,Visible=false,ZIndex=5},mf)
local tTab=m("Frame",{Size=UDim2.new(1,-PAD*2,0,cntH),Position=UDim2.new(0,PAD,0,cntY),BackgroundTransparency=1,Visible=false,ZIndex=5},mf)
local function switchTab(key)activeTab=key;pTab.Visible=key=="players";fTab.Visible=key=="fun";tTab.Visible=key=="tools"
local function st2(btn,a)tw(btn,.15,{BackgroundColor3=a and p1 or Color3.fromRGB(20,20,40)});btn.TextColor3=a and tx or sb
local s=btn:FindFirstChildOfClass"UIStroke";if s then tw(s,.15,{Color=a and p1 or sb})end end
st2(pTabBtn,key=="players");st2(fTabBtn,key=="fun");st2(tTabBtn,key=="tools")end
pTabBtn.MouseButton1Click:Connect(function()switchTab("players")end);fTabBtn.MouseButton1Click:Connect(function()switchTab("fun")end)
tTabBtn.MouseButton1Click:Connect(function()switchTab("tools")end)
local sb2=m("Frame",{Size=UDim2.new(1,0,0,28),BackgroundColor3=Color3.fromRGB(12,12,28),BorderSizePixel=0,ZIndex=8},pTab);cr(sb2,7);st(sb2,p1,1,.6)
m("TextLabel",{Size=UDim2.new(0,16,1,0),Position=UDim2.new(0,5,0,0),BackgroundTransparency=1,Text="🔍",TextSize=10,Font=Enum.Font.GothamBold,TextColor3=sb,ZIndex=9},sb2)
local searchBox=m("TextBox",{Size=UDim2.new(1,-26,1,0),Position=UDim2.new(0,22,0,0),BackgroundTransparency=1,Text="",PlaceholderText="Search...",PlaceholderColor3=Color3.fromRGB(80,80,120),TextColor3=tx,TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ZIndex=9},sb2)
local sf=m("ScrollingFrame",{Size=UDim2.new(1,0,1,-32),Position=UDim2.new(0,0,0,32),BackgroundTransparency=1,BorderSizePixel=0,ScrollBarThickness=4,ScrollBarImageColor3=p1,ScrollBarImageTransparency=.3,ScrollingDirection=Enum.ScrollingDirection.Y,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ElasticBehavior=Enum.ElasticBehavior.Always,TopImage="rbxasset://textures/ui/Scroll/scroll-middle.png",BottomImage="rbxasset://textures/ui/Scroll/scroll-middle.png",MidImage="rbxasset://textures/ui/Scroll/scroll-middle.png",ZIndex=5},pTab)
m("UIPadding",{PaddingTop=UDim.new(0,2),PaddingBottom=UDim.new(0,2),PaddingRight=UDim.new(0,6)},sf)
m("UIListLayout",{Padding=UDim.new(0,4),SortOrder=Enum.SortOrder.LayoutOrder},sf)
searchBox:GetPropertyChangedSignal("Text"):Connect(function()local q=searchBox.Text:lower();for _,card in sf:GetChildren()do if card:IsA"Frame"then
if q==""then card.Visible=true else local f=false;for _,plr in P:GetPlayers()do if plr.Name==card.Name then
if plr.Name:lower():find(q,1,true)or plr.DisplayName:lower():find(q,1,true)then f=true end;break end end;card.Visible=f end end end end)
local function mkValBox(parent,px,py,label,icon,col,def)local f=m("Frame",{Size=UDim2.new(0,95,0,28),Position=UDim2.new(0,px,0,py),BackgroundColor3=Color3.fromRGB(12,12,28),BorderSizePixel=0,ZIndex=9},parent);cr(f,7);st(f,col,1,.5)
m("TextLabel",{Size=UDim2.new(0,42,1,0),Position=UDim2.new(0,4,0,0),BackgroundTransparency=1,Text=icon.." "..label,TextColor3=col,TextSize=8,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,ZIndex=10},f)
local t2=m("TextBox",{Size=UDim2.new(0,40,0,20),Position=UDim2.new(1,-44,.5,-10),BackgroundColor3=Color3.fromRGB(6,6,16),Text=tostring(def),TextColor3=cy,TextSize=10,Font=Enum.Font.Code,ClearTextOnFocus=true,ZIndex=11},f);cr(t2,5);st(t2,cy,1,.6);return t2 end
local function mkTog(parent,px,py,w,h2,txt)local b=m("TextButton",{Size=UDim2.new(0,w,0,h2),Position=UDim2.new(0,px,0,py),BackgroundColor3=Color3.fromRGB(20,20,40),Text=txt,TextColor3=sb,TextSize=10,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=10},parent);cr(b,8);st(b,sb,1,.6)
local on=false;local function sv(v)on=v;tw(b,.15,{BackgroundColor3=v and Color3.fromRGB(0,40,20)or Color3.fromRGB(20,20,40)})
b.TextColor3=v and gn or sb;local s=b:FindFirstChildOfClass"UIStroke";if s then tw(s,.15,{Color=v and gn or sb})end end;return b,function()return on end,sv end
local function mkBtn(parent,px,py,w,h2,txt,col)local b=m("TextButton",{Size=UDim2.new(0,w,0,h2),Position=UDim2.new(0,px,0,py),BackgroundColor3=Color3.fromRGB(20,10,30),Text=txt,TextColor3=col,TextSize=10,Font=Enum.Font.GothamBold,AutoButtonColor=false,ZIndex=10},parent);cr(b,8);st(b,col,1,.5);return b end
local spdBox=mkValBox(fTab,4,4,"Spd","⚡",cy,spdVal);local jmpBox=mkValBox(fTab,103,4,"Jmp","🦘",gn,jmpVal)
local flyBox=mkValBox(fTab,202,4,"Fly","🕊",p1,flySpd);local szBox=mkValBox(fTab,301,4,"Size","📐",ow_c,charSize)
spdBox.FocusLost:Connect(function()local n=tonumber(spdBox.Text);if n and n>=0 then spdVal=n;notify("⚡","Speed: "..n,cy,2)else spdBox.Text=tostring(spdVal)end end)
jmpBox.FocusLost:Connect(function()local n=tonumber(jmpBox.Text);if n and n>=0 then jmpVal=n;notify("🦘","Jump: "..n,gn,2)else jmpBox.Text=tostring(jmpVal)end end)
flyBox.FocusLost:Connect(function()local n=tonumber(flyBox.Text);if n and n>=0 then flySpd=n;notify("🕊","Fly: "..n,p1,2)else flyBox.Text=tostring(flySpd)end end)
local function applySize(s)pcall(function()local c,_,hu=safeChar();if not c or not hu then return end
for _,sc in ipairs({{"BodyWidthScale",s},{"BodyHeightScale",s},{"BodyDepthScale",s},{"HeadScale",s}})do local name,val=sc[1],sc[2]
local obj=hu:FindFirstChild(name);if obj and obj:IsA"NumberValue"then obj.Value=val
else local nv=Instance.new("NumberValue");nv.Name=name;nv.Value=val;nv.Parent=hu end end end)end
szBox.FocusLost:Connect(function()local n=tonumber(szBox.Text);if n and n>0 then charSize=n;applySize(n);notify("📐","Size: "..n,ow_c,2)else szBox.Text=tostring(charSize)end end)
m("Frame",{Size=UDim2.new(1,-8,0,1),Position=UDim2.new(0,4,0,38),BackgroundColor3=sb,BackgroundTransparency=.85,BorderSizePixel=0,ZIndex=9},fTab)
local flyBtn,_,setFly=mkTog(fTab,4,44,79,28,"🕊 Fly");local ncBtn,_,setNc=mkTog(fTab,87,44,79,28,"👻 Noclip")
local ijBtn,_,setIj=mkTog(fTab,170,44,79,28,"⬆ InfJmp");local ivBtn,_,setIv=mkTog(fTab,253,44,79,28,"👤 Invis")
local gmBtn,_,setGm=mkTog(fTab,336,44,66,28,"🛡 God")
local afBtn,_,setAF=mkTog(tTab,4,4,130,30,"🛡 Anti-Fling");local ajBtn,_,setAJ=mkTog(tTab,138,4,130,30,"⚡ AutoJoin")
local kaBtn2,_,setKA=mkTog(tTab,272,4,130,30,"💀 KillAura")
m("Frame",{Size=UDim2.new(1,-8,0,1),Position=UDim2.new(0,4,0,40),BackgroundColor3=sb,BackgroundTransparency=.85,BorderSizePixel=0,ZIndex=9},tTab)
local fAllBtn=mkBtn(tTab,4,48,97,30,"⚡ FLING ALL",fc);local rejBtn=mkBtn(tTab,105,48,97,30,"🔄 REJOIN",cy)
local shBtn=mkBtn(tTab,206,48,97,30,"🌐 HOP",p1);local fsBtn=mkBtn(tTab,307,48,97,30,"🛑 STOP",Color3.fromRGB(255,60,60))
local afOn,afC1,afC2,afLCF=false,nil,nil,nil;local fg,autoFJ,kaOn,forceStop=false,false,false,false
local specTarget,specConn=nil,nil;local loopFlingTargets={};local flying,noclipOn,infJump2,invisOn,godOn=false,false,false,false,false
local flyBV,flyBG=nil,nil;local origTrans={};local invisConn=nil;local godConns={}
local function startGod()pcall(function()local c,h,hu=safeChar();if not hu then return end;hu.MaxHealth=math.huge;hu.Health=math.huge
for _,s in{Enum.HumanoidStateType.Dead,Enum.HumanoidStateType.FallingDown,Enum.HumanoidStateType.Ragdoll,Enum.HumanoidStateType.Physics}do pcall(function()hu:SetStateEnabled(s,false)end)end
local ff=c:FindFirstChild"GodFF";if not ff then ff=Instance.new("ForceField");ff.Visible=false;ff.Name="GodFF";ff.Parent=c end
godConns[1]=safeDC(godConns[1]);godConns[1]=hu.HealthChanged:Connect(function()if godOn and hu and hu.Parent then hu.Health=math.huge end end)
godConns[2]=safeDC(godConns[2]);godConns[2]=R.Heartbeat:Connect(function()if not godOn then return end;local c2,_,hu2=safeChar();if not hu2 then return end
pcall(function()hu2.MaxHealth=math.huge;hu2.Health=math.huge
for _,s in{Enum.HumanoidStateType.Dead,Enum.HumanoidStateType.FallingDown,Enum.HumanoidStateType.Ragdoll}do hu2:SetStateEnabled(s,false)end end)end)
godConns[3]=safeDC(godConns[3]);godConns[3]=hu.Died:Connect(function()if godOn then task.defer(function()pcall(function()hu.Health=math.huge end)end)end end)end)end
local function stopGod()for i=1,3 do godConns[i]=safeDC(godConns[i])end;pcall(function()local c,_,hu=safeChar()
if c then safeDestroy(c:FindFirstChild"GodFF")end;if hu then for _,s in{Enum.HumanoidStateType.Dead,Enum.HumanoidStateType.FallingDown,Enum.HumanoidStateType.Ragdoll,Enum.HumanoidStateType.Physics}do
hu:SetStateEnabled(s,true)end;hu.MaxHealth=100;hu.Health=100 end end)end
local function stopSpec()specConn=safeDC(specConn);specTarget=nil;task.defer(function()pcall(function()
local cam=workspace.CurrentCamera;cam.CameraType=Enum.CameraType.Custom;local _,_2,hu=safeChar();if hu then cam.CameraSubject=hu end end)end)end
local function stopInvis()invisConn=safeDC(invisConn);invisOn=false;pcall(function()setIv(false)end);origTrans={}end
local function stopFly()flying=false;pcall(function()setFly(false)end);flyBV=safeDestroy(flyBV);flyBG=safeDestroy(flyBG)end
local function afTick()if fg then return end;local c,h,hu=safeChar();if not h or not hu then return end
pcall(function()hu.PlatformStand=false;hu:SetStateEnabled(Enum.HumanoidStateType.Physics,false);hu:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)end)
for _,v in c:GetDescendants()do if v:IsA"BasePart"and v.AssemblyLinearVelocity.Magnitude>100 then v.AssemblyLinearVelocity=Vector3.zero;v.AssemblyAngularVelocity=Vector3.zero end end
if afLCF and(h.Position-afLCF.Position).Magnitude>50 then h.CFrame=afLCF end;afLCF=h.CFrame end
local function forceStopAll()forceStop=true;autoFJ=false;pcall(function()setAJ(false)end);kaOn=false;pcall(function()setKA(false)end);stopFly()
noclipOn=false;pcall(function()setNc(false)end);infJump2=false;pcall(function()setIj(false)end);stopInvis()
if godOn then godOn=false;pcall(function()setGm(false)end);stopGod()end;for k in loopFlingTargets do loopFlingTargets[k]=nil end;stopSpec()
if sf then for _,card in sf:GetChildren()do if card:IsA"Frame"then for _,ch in card:GetDescendants()do if ch:IsA"TextButton"then
if ch.Text=="👁STOP"then ch.Text="👁SPEC"end;if ch.Text=="🔁STOP"then ch.Text="🔁LOOP"end end end end end end
notify("🛑","Force stopped!",Color3.fromRGB(255,60,60),3);task.wait(.5);forceStop=false end;fsBtn.MouseButton1Click:Connect(forceStopAll)
afBtn.MouseButton1Click:Connect(function()afOn=not afOn;setAF(afOn);if afOn then afLCF=nil;afC1=safeDC(afC1);afC2=safeDC(afC2)
afC1=R.Heartbeat:Connect(afTick);afC2=R.Stepped:Connect(afTick);notify("🛡","Anti-Fling ON",gn,2)
else afC1=safeDC(afC1);afC2=safeDC(afC2);notify("🛡","Anti-Fling OFF",fc,2)end end)
ajBtn.MouseButton1Click:Connect(function()autoFJ=not autoFJ;setAJ(autoFJ);notify("⚡",autoFJ and"AutoFling ON"or"AutoFling OFF",autoFJ and gn or fc,2)end)
kaBtn2.MouseButton1Click:Connect(function()kaOn=not kaOn;setKA(kaOn);notify("💀",kaOn and"KillAura ON"or"KillAura OFF",kaOn and gn or fc,2)end)
flyBtn.MouseButton1Click:Connect(function()flying=not flying;setFly(flying);if flying then local c,h=safeChar();if not h then stopFly();return end
flyBV=safeDestroy(flyBV);flyBG=safeDestroy(flyBG);flyBV=Instance.new("BodyVelocity");flyBV.MaxForce=Vector3.new(1e6,1e6,1e6)
flyBV.Velocity=Vector3.zero;flyBV.Parent=h;flyBG=Instance.new("BodyGyro");flyBG.MaxTorque=Vector3.new(1e6,1e6,1e6);flyBG.D=200
flyBG.Parent=h;notify("🕊","Fly ON",gn,2)else stopFly();notify("🕊","Fly OFF",fc,2)end end)
ncBtn.MouseButton1Click:Connect(function()noclipOn=not noclipOn;setNc(noclipOn);notify("👻",noclipOn and"Noclip ON"or"Noclip OFF",noclipOn and gn or fc,2)end)
ijBtn.MouseButton1Click:Connect(function()infJump2=not infJump2;setIj(infJump2);notify("⬆",infJump2 and"InfJump ON"or"InfJump OFF",infJump2 and gn or fc,2)end)
gmBtn.MouseButton1Click:Connect(function()godOn=not godOn;setGm(godOn);if godOn then startGod();notify("🛡","Godmode ON",ow_c,2)else stopGod();notify("🛡","Godmode OFF",fc,2)end end)
ivBtn.MouseButton1Click:Connect(function()invisOn=not invisOn;setIv(invisOn);local c=L.Character;if not c then invisOn=false;setIv(false);return end
if invisOn then pcall(function()for _,v in c:GetDescendants()do if v:IsA"BasePart"then origTrans[v]=v.Transparency;v.Transparency=1
elseif v:IsA"Decal"or v:IsA"Texture"then origTrans[v]=v.Transparency;v.Transparency=1 end end
for _,v in c:GetChildren()do if v:IsA"Accessory"then local h2=v:FindFirstChild"Handle";if h2 then for _,ms in h2:GetChildren()do
if ms:IsA"SpecialMesh"or ms:IsA"FileMesh"then ms:Destroy()end end;h2.Transparency=1;h2.Size=Vector3.new(0,0,0)end
elseif v:IsA"Shirt"or v:IsA"Pants"or v:IsA"ShirtGraphic"then v:Destroy()end end
local head=c:FindFirstChild"Head";if head then for _,d in head:GetChildren()do if d:IsA"Decal"then d:Destroy()end end end end)
invisConn=safeDC(invisConn);invisConn=R.Heartbeat:Connect(function()if not invisOn then return end;pcall(function()local ch=L.Character
if not ch then return end;for _,v in ch:GetDescendants()do if v:IsA"BasePart"then v.Transparency=1 end end end)end)
notify("👤","Invisible ON",gn,2)else stopInvis();notify("👤","Invisible OFF",fc,2)end end)
U.JumpRequest:Connect(function()if infJump2 then pcall(function()local _,_2,hu=safeChar();if hu then hu:ChangeState(Enum.HumanoidStateType.Jumping)end end)end end)
R.Heartbeat:Connect(function()pcall(function()local c,h,hu=safeChar();if not hu or fg then return end;hu.WalkSpeed=spdVal;hu.UseJumpPower=true;hu.JumpPower=jmpVal
if flying and flyBV and flyBG and flyBV.Parent and flyBG.Parent then local cam=workspace.CurrentCamera;local mv=hu.MoveDirection
if mv.Magnitude>0.01 then local look=cam.CFrame.LookVector;local right=cam.CFrame.RightVector
local fL=Vector3.new(look.X,0,look.Z);if fL.Magnitude<.01 then fL=Vector3.new(0,0,-1)end;fL=fL.Unit
local fR=Vector3.new(right.X,0,right.Z);if fR.Magnitude<.01 then fR=Vector3.new(1,0,0)end;fR=fR.Unit
local fd=mv:Dot(fL);local rd=mv:Dot(fR);local dir=look*fd+right*rd
if dir.Magnitude>.01 then flyBV.Velocity=dir.Unit*flySpd else flyBV.Velocity=Vector3.zero end
else flyBV.Velocity=Vector3.zero end;flyBG.CFrame=cam.CFrame end end)end)
R.Stepped:Connect(function()if noclipOn then pcall(function()local c=L.Character
if c then for _,v in c:GetDescendants()do if v:IsA"BasePart"then v.CanCollide=false end end end end)end end)
local op=true;local function tg(v)op=v;if v then mf.Visible=true;tb.Visible=false;mf.Position=UDim2.new(1,40,0,12)
T:Create(mf,TweenInfo.new(.3,Enum.EasingStyle.Back),{Position=UDim2.new(1,-W-16,0,12)}):Play();notify("🟢","Opened",gn,2)
else local w=T:Create(mf,TweenInfo.new(.2),{Position=UDim2.new(1,40,0,12)});w:Play()
w.Completed:Connect(function()if not op then mf.Visible=false;tb.Visible=true end end);notify("🔴","Closed",fc,2)end end
xb.MouseButton1Click:Connect(function()tg(false)end);tb.MouseButton1Click:Connect(function()tg(true)end)
rejBtn.MouseButton1Click:Connect(function()notify("🔄","Rejoining...",cy,2);if queue_on_teleport and THE_SCRIPT then pcall(function()queue_on_teleport(THE_SCRIPT)end)end
task.wait(.5);pcall(function()TS:TeleportToPlaceInstance(game.PlaceId,game.JobId,L)end)end)
shBtn.MouseButton1Click:Connect(function()notify("🌐","Hopping...",p1,2);if queue_on_teleport and THE_SCRIPT then pcall(function()queue_on_teleport(THE_SCRIPT)end)end
task.wait(.5);pcall(function()TS:Teleport(game.PlaceId,L)end)end)
L.CharacterAdded:Connect(function()task.wait(.3);if flying then stopFly()end;if invisOn then stopInvis()end;afLCF=nil;origTrans={}
if godOn then task.wait(.5);startGod()end end)
local function fling(t)if fg or forceStop then return end;if not t then notify("⚠️","No target!",p2,2);return end
if t.Name==OWNER then notify("👑","Can't fling owner!",ow_c,2);return end;if runtimeBans[L.Name]then notify("🚫","You are banned!",fc,2);return end
local tc=t.Character;if not tc or not tc.Parent then notify("⚠️","No character!",p2,2);return end;fg=true;notify("💀","Flinging "..t.DisplayName,fc,2)
task.spawn(function()local ok=pcall(function()local c,h,hu=safeChar();if not h or not hu then fg=false;return end
local o,ow2,oj,omh,ohh=h.CFrame,hu.WalkSpeed,hu.JumpPower,hu.MaxHealth,hu.HipHeight;local pp,pts={},{}
for _,v in c:GetDescendants()do if v:IsA"BasePart"then table.insert(pts,v);pp[v]={v.CustomPhysicalProperties,v.Massless,v.CanCollide}
v.CustomPhysicalProperties=PhysicalProperties.new(9999,0,0,0,0);v.Massless=false
elseif v:IsA"BodyMover"or v:IsA"BodyVelocity"or v:IsA"BodyGyro"or v:IsA"BodyPosition"or v:IsA"BodyForce"or v:IsA"BodyAngularVelocity"or v:IsA"BodyThrust"or v:IsA"LinearVelocity"or v:IsA"AngularVelocity"or v:IsA"AlignPosition"or v:IsA"AlignOrientation"or v:IsA"VectorForce"then pcall(v.Destroy,v)end end
for _,s in{Enum.HumanoidStateType.Dead,Enum.HumanoidStateType.FallingDown,Enum.HumanoidStateType.Ragdoll,Enum.HumanoidStateType.Physics}do pcall(function()hu:SetStateEnabled(s,false)end)end
hu.MaxHealth=math.huge;hu.Health=math.huge;local hpC=hu.HealthChanged:Connect(function()if hu and hu.Parent then hu.Health=math.huge end end)
hu.WalkSpeed=0;hu.JumpPower=0;hu.PlatformStand=true;hu.HipHeight=0;hu.AutoRotate=false;local done,stT,cnt=false,tick(),0;local SPD=9e4
local function gt()local tc2=t.Character;if not tc2 or not tc2.Parent then return nil end
return tc2:FindFirstChild"HumanoidRootPart"or tc2:FindFirstChild"UpperTorso"or tc2:FindFirstChild"Torso"or tc2:FindFirstChild"Head"end
local function td()local tc2=t.Character;if not tc2 or not tc2.Parent then return true end;local th=tc2:FindFirstChildOfClass"Humanoid";return th and th.Health<=0 end
local function df()if done or forceStop or not c or not c.Parent or not h or not h.Parent then done=true;return end
local th=gt();if not th then done=true;return end;if td()then done=true;return end;cnt=cnt+1
local rz=(math.random()>.5 and 1 or-1)*(math.random()*3+.5);local rx=(math.random()-.5)*2;local ry=(math.random()-.5)*1.5
if cnt%3==0 then rz=0;rx=0;ry=0 end;h.CFrame=th.CFrame*CFrame.new(rx,ry,rz)
if math.abs(rz)<1.5 then for _,v in pts do if v and v.Parent then v.AssemblyLinearVelocity=Vector3.new(SPD,SPD,SPD)
v.AssemblyAngularVelocity=Vector3.new(SPD,SPD,SPD);v.CanCollide=(v==h)end end
else for _,v in pts do if v and v.Parent then v.AssemblyLinearVelocity=Vector3.zero;v.AssemblyAngularVelocity=Vector3.zero;v.CanCollide=false end end end end
local c1=R.Stepped:Connect(df);local c2=R.Heartbeat:Connect(df);local c3=R.RenderStepped:Connect(df)
repeat task.wait(.05)until done or forceStop or tick()-stT>=3;c1=safeDC(c1);c2=safeDC(c2);c3=safeDC(c3);hpC=safeDC(hpC)
pcall(function()hu.PlatformStand=false;hu.AutoRotate=true
for _,s in{Enum.HumanoidStateType.Dead,Enum.HumanoidStateType.FallingDown,Enum.HumanoidStateType.Ragdoll,Enum.HumanoidStateType.Physics}do hu:SetStateEnabled(s,true)end end)
for _,v in pts do pcall(function()if v and v.Parent then v.AssemblyAngularVelocity=Vector3.zero;v.AssemblyLinearVelocity=Vector3.zero end end)end
for pt,pr in pp do pcall(function()if pt and pt.Parent then pt.CustomPhysicalProperties=pr[1];pt.Massless=pr[2];pt.CanCollide=pr[3]end end)end;task.wait(.15)
pcall(function()if h and h.Parent then h.CFrame=o;h.AssemblyAngularVelocity=Vector3.zero;h.AssemblyLinearVelocity=Vector3.zero end
if hu and hu.Parent then if godOn then hu.MaxHealth=math.huge;hu.Health=math.huge else hu.MaxHealth=omh;hu.Health=omh end
hu.WalkSpeed=spdVal;hu.UseJumpPower=true;hu.JumpPower=jmpVal;hu.HipHeight=ohh;hu:ChangeState(Enum.HumanoidStateType.GettingUp)end end)
fg=false;if not forceStop then if td()then notify("☠️","Eliminated!",gn,2)else notify("✅","Flung!",gn,2)end end end)
if not ok then fg=false;notify("⚠️","Fling error",fc,2)end end)end
local function tpTo(t)pcall(function()if not t or not t.Character then return end;local _,h=safeChar();if not h then return end
local th=t.Character:FindFirstChild"HumanoidRootPart"or t.Character:FindFirstChild"Torso"or t.Character:FindFirstChild"UpperTorso"
if th then h.CFrame=th.CFrame*CFrame.new(0,0,3);notify("📍","TP → "..t.DisplayName,cy,2)end end)end
fAllBtn.MouseButton1Click:Connect(function()notify("⚡","Flinging all...",fc,2);task.spawn(function()for _,p in P:GetPlayers()do if forceStop then break end
if p~=L and p.Name~=OWNER and p.Character then fling(p);repeat task.wait(.1)until not fg;task.wait(.5)end end
if not forceStop then notify("✅","Fling All done!",gn,2)end end)end)
task.spawn(function()while true do task.wait(1);if kaOn and not fg and not forceStop then pcall(function()local _,h=safeChar()
if not h then return end;for _,p in P:GetPlayers()do if forceStop then break end;if p~=L and p.Name~=OWNER and p.Character then
local th=p.Character:FindFirstChild"HumanoidRootPart";if th and(h.Position-th.Position).Magnitude<20 then fling(p)
repeat task.wait(.1)until not fg;task.wait(.3)end end end end)end end end)
task.spawn(function()while true do task.wait(2);for plr,_ in loopFlingTargets do if forceStop then break end
if plr and plr.Parent and plr.Character and not fg then fling(plr);repeat task.wait(.1)until not fg;task.wait(1)end end end end)
local function uc()ct.Text="[ "..#P:GetPlayers().." ONLINE ]"end;local CARD_H=60
local function add(p)if not p or sf:FindFirstChild(p.Name)then return end
local c=m("Frame",{Name=p.Name,Size=UDim2.new(1,0,0,CARD_H),BackgroundColor3=cd,BorderSizePixel=0,ZIndex=6},sf);cr(c,8);st(c,Color3.fromRGB(40,0,80),1,.6)
m("Frame",{Size=UDim2.new(1,0,1,0),BackgroundColor3=p1,BackgroundTransparency=.97,ZIndex=5},c)
m("Frame",{Size=UDim2.new(0,3,0,30),Position=UDim2.new(0,0,.5,-15),BackgroundColor3=p==L and cy or(p.Name==OWNER and ow_c or cy),BorderSizePixel=0,ZIndex=8},c)
local rn=m("Frame",{Size=UDim2.new(0,36,0,36),Position=UDim2.new(0,7,0,4),BackgroundColor3=p1,BackgroundTransparency=.6,ZIndex=7},c);cr(rn,18);st(rn,p1,1,.4)
local ai=m("Frame",{Size=UDim2.new(0,30,0,30),Position=UDim2.new(.5,0,.5,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=Color3.fromRGB(20,20,40),ZIndex=8},rn);cr(ai,15)
local im=m("ImageLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Image="",ZIndex=9},ai);cr(im,15)
task.spawn(function()local ok,r=pcall(P.GetUserThumbnailAsync,P,p.UserId,Enum.ThumbnailType.HeadShot,Enum.ThumbnailSize.Size100x100);if ok then im.Image=r end end)
m("Frame",{Size=UDim2.new(0,8,0,8),Position=UDim2.new(1,0,1,0),AnchorPoint=Vector2.new(.5,.5),BackgroundColor3=gn,BorderSizePixel=0,ZIndex=11},rn)
m("TextLabel",{Size=UDim2.new(0,150,0,14),Position=UDim2.new(0,48,0,4),BackgroundTransparency=1,Text=p.DisplayName,TextColor3=tx,TextSize=11,Font=Enum.Font.GothamBold,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=9},c)
m("TextLabel",{Size=UDim2.new(0,150,0,12),Position=UDim2.new(0,48,0,18),BackgroundTransparency=1,Text="@"..p.Name,TextColor3=sb,TextSize=9,Font=Enum.Font.Code,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,ZIndex=9},c)
if p.Name==OWNER then local yb=m("Frame",{Size=UDim2.new(0,54,0,15),Position=UDim2.new(0,48,0,34),BackgroundColor3=Color3.fromRGB(30,20,0),ZIndex=10},c);cr(yb,5);st(yb,ow_c,1,.3)
m("TextLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="👑 OWNER",TextColor3=ow_c,TextSize=8,Font=Enum.Font.Code,ZIndex=11},yb)
elseif p==L then local yb=m("Frame",{Size=UDim2.new(0,36,0,15),Position=UDim2.new(0,48,0,34),BackgroundColor3=Color3.fromRGB(10,0,20),ZIndex=10},c);cr(yb,5);st(yb,cy,1,.3)
m("TextLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,Text="★ YOU",TextColor3=cy,TextSize=8,Font=Enum.Font.Code,ZIndex=11},yb)
else local bx=0;local function mkCB(txt,col,w)local b=m("TextButton",{Size=UDim2.new(0,w,0,18),Position=UDim2.new(0,48+bx,0,36),BackgroundColor3=Color3.fromRGB(20,10,30),Text=txt,TextColor3=col,TextSize=8,Font=Enum.Font.Code,AutoButtonColor=false,ZIndex=12},c)
cr(b,5);st(b,col,1,.5);bx=bx+w+3;return b end
local fb=mkCB("⚡FLING",fc,42);local tpb=mkCB("📍TP",cy,28);local spb=mkCB("👁SPEC",p1,36);local lpb=mkCB("🔁LOOP",p2,36);local cpb=mkCB("📋COPY",sb,36)
fb.MouseButton1Click:Connect(function()if fg then return end;fb.Text="💀..";fling(p);task.delay(3.5,function()if fb and fb.Parent then fb.Text="⚡FLING"end end)end)
tpb.MouseButton1Click:Connect(function()tpTo(p)end)
spb.MouseButton1Click:Connect(function()if specTarget==p then stopSpec();spb.Text="👁SPEC";notify("👁","Stopped",fc,2)
else stopSpec();specTarget=p;spb.Text="👁STOP";notify("👁","Spectating "..p.DisplayName,p1,2)
specConn=R.Heartbeat:Connect(function()if not specTarget or not specTarget.Character or not specTarget.Parent then stopSpec()
pcall(function()if spb and spb.Parent then spb.Text="👁SPEC"end end);return end
pcall(function()local hu=specTarget.Character:FindFirstChildOfClass"Humanoid";if hu then workspace.CurrentCamera.CameraSubject=hu end end)end)end end)
lpb.MouseButton1Click:Connect(function()if loopFlingTargets[p]then loopFlingTargets[p]=nil;lpb.Text="🔁LOOP";notify("🔁","Loop OFF",fc,2)
else loopFlingTargets[p]=true;lpb.Text="🔁STOP";notify("🔁","Loop ON: "..p.DisplayName,gn,2)end end)
cpb.MouseButton1Click:Connect(function()pcall(function()setclipboard(p.Name)end);notify("📋","Copied: "..p.Name,cy,2)end)end
c.BackgroundTransparency=1;c.Size=UDim2.new(1,0,0,0)
T:Create(c,TweenInfo.new(.25,Enum.EasingStyle.Back),{Size=UDim2.new(1,0,0,CARD_H),BackgroundTransparency=0}):Play();uc()end
local function rem(p)loopFlingTargets[p]=nil;if specTarget==p then stopSpec();for _,card in sf:GetChildren()do if card:IsA"Frame"then
for _,ch in card:GetDescendants()do if ch:IsA"TextButton"and ch.Text=="👁STOP"then ch.Text="👁SPEC"end end end end end
local c=sf:FindFirstChild(p.Name);if c then local w=T:Create(c,TweenInfo.new(.15),{Size=UDim2.new(1,0,0,0),BackgroundTransparency=1})
w:Play();w.Completed:Connect(function()c:Destroy();uc()end)end;notify("🔴",p.DisplayName.." left",fc,2);uc()end
P.PlayerAdded:Connect(function(p)add(p);notify("🟢",p.DisplayName.." joined",gn,2)
if autoFJ and not forceStop and p.Name~=OWNER then task.delay(3,function()if p and p.Parent and p.Character then fling(p)end end)end end)
P.PlayerRemoving:Connect(rem);local a=P:GetPlayers();table.sort(a,function(a,b)if a.Name==OWNER then return true end
if b.Name==OWNER then return false end;if a==L then return true end;if b==L then return false end;return a.Name<b.Name end)
for i,p in ipairs(a)do task.delay(i*.08,function()add(p)end)end;notify("⚡","FLING GUI loaded",cy,3)
