-- Rayfield Gen2 v1.2.0
-- loadstring(game:HttpGet("https://sirius.menu/gen2"))()
--
-- Copyright (c) 2026 Corridon Capital
-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at https://mozilla.org/MPL/2.0/.
--
--
local a local aa,ab,ac,ad,ae,af,ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,i={function()local b,c,d=a(1)local e return(function(
...)local f,g,h,i,j=d(c.utility.variables),d(c.utility.image),d(c.utility.locale),d(c.utility.constants),d(c.types)
export type Theme=j.Theme export type Translator=j.Translator export type Translations=j.Translations export type
WindowConfiguration=j.WindowConfiguration export type WindowProps=j.WindowProps export type TabProps=j.TabProps export
type TagProps=j.TagProps export type SectionProps=j.SectionProps export type GroupProps=j.GroupProps export type
ButtonProps=j.ButtonProps export type ToggleProps=j.ToggleProps export type SliderProps=j.SliderProps export type
DropdownProps=j.DropdownProps export type InputProps=j.InputProps export type KeybindProps=j.KeybindProps export type
ColorPickerProps=j.ColorPickerProps export type StatProps=j.StatProps export type ProgressProps=j.ProgressProps export
type ConsoleProps=j.ConsoleProps export type TextProps=j.TextProps export type DividerProps=j.DividerProps export type
NotifyProps=j.NotifyProps export type ToastProps=j.ToastProps export type PopupBox=j.PopupBox export type PopupOption=j.
PopupOption export type PopupProps=j.PopupProps export type Moveable=j.Moveable export type Lockable=j.Lockable export
type Window=j.Window export type Tab=j.Tab export type Group=j.Group export type Button=j.Button export type Toggle=j.
Toggle export type Slider=j.Slider export type Dropdown=j.Dropdown export type Input=j.Input export type Keybind=j.
Keybind export type ColorPicker=j.ColorPicker export type Stat=j.Stat export type Progress=j.Progress export type
Console=j.Console export type Section=j.Section export type TabSection=j.TabSection export type Text=j.Text export type
Divider=j.Divider export type Tag=j.Tag export type Popup=j.Popup export type Rayfield=j.Rayfield type WindowModule={new
:(j.WindowProps)->j.Window}local k={}::Rayfield local function l()local m=Instance.new'ScreenGui'm.Name=f.httpService:
GenerateGUID(false)m.ClipToDeviceSafeArea=false m.DisplayOrder=i.displayOrder.banner m.IgnoreGuiInset=true m.
ResetOnSpawn=false m.Enabled=true m.SafeAreaCompatibility=Enum.SafeAreaCompatibility.None m.ScreenInsets=Enum.
ScreenInsets.DeviceSafeInsets m.ZIndexBehavior=Enum.ZIndexBehavior.Sibling m.Parent=f.guiContainer local n=Instance.new
'ImageLabel'n.Name='Banner'n.AnchorPoint=Vector2.new(0.5,0.5)n.BackgroundColor3=Color3.fromRGB(255,255,255)n.
BackgroundTransparency=1 n.BorderColor3=Color3.fromRGB(0,0,0)n.BorderSizePixel=0 n.Image=g.resolve(i.icons.banner)n.
Position=UDim2.fromScale(0.5,0.5)n.Size=UDim2.fromOffset(262,60)n.Parent=m return m end function k.CreateWindow(m,n:j.
WindowProps):j.Window local o,p:j.Window?,q:(()->())?=(l())if f.secureMode then g.preload(function(r)if r<=0 then return
end local function s()if not p or p.unloaded then return end p:Notify{title=h.resolve'Secure mode',content=if r==1 then
h.resolve"An asset couldn't be cached and won't appear."else h.resolve"Some assets couldn't be cached and won't appear."
}end if p then s()else q=s end end)end local r,s=pcall(function()return(d(c.components.window)::WindowModule).new(n)end)
if not r then o:Destroy()error(s,0)end local t=s::j.Window p=t if q then task.spawn(q)q=nil end if f.secureMode then
task.spawn(function()local u,v=f.fontManager:loadFont(i.fontAsset,Enum.FontWeight.Medium),f.fontManager:loadFont(i.
fontAsset,Enum.FontWeight.SemiBold)if not t.unloaded and u and v and u~=f.fallbackFont and v~=f.fallbackFont then t:
ChangeTheme{Font=u,TitleFont=v}end end)end task.spawn(function()task.wait(0.5)o:Destroy()task.wait(0.5)if not t.unloaded
then t:Show()end end)return t end return k end)()end,[3]=function()local b,c,d=a(3)local e return(function(...)local f={
}f.__index=f f.__type='Action'local g=c.Parent.Parent.utility local h,i,j=d(g.variables),d(g.log),d(g.HapticEngine)
function f.new(k,l)l=if typeof(l)=='table'then l else{}local m=setmetatable({window=assert(k,
'Missing argument #1 (Window expected)'),name=l.name or l.Name or'Action',icon=assert(l.icon or l.Icon,
'Missing argument (Icon expected)'),callback=assert(l.callback or l.Callback,'Missing argument (Function expected)'),
linkedTab=l.linkedTab or l.LinkedTab},f)m.action=m.window:Create('Frame',{Name=m.name,BorderSizePixel=0,LayoutOrder=-(l.
order or 0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Parent=m.window.actionContainer})m.iconLabel=m.window:
Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(20,20),BorderSizePixel=0,AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.fromScale(0.5,0.5),BackgroundTransparency=1,ImageTransparency=1,Parent=m.action},{ImageColor3=
'ActionColor'})m.interact=m.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),
BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=m.action}
)local function n()if not m.window:_settled()then return end if m.linkedTab and m.window.selectedTab==m.linkedTab then
return end if m.isLit and m:isLit()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle
.Quint,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end m.window:Connect(m.interact.MouseButton1Click,
function()j.click()task.spawn(function()local o,p=pcall(m.callback)if not o then i.warn(`Rayfield encountered an error, with the callback for a {
m.__type} component named '{m.name}':`)i.print(p)end n()end)end)m.window:Connect(m.interact.MouseEnter,function()if not
m.window:_interactive()then return end h.tweenService:Create(m.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.2}):Play()end)m.window:Connect(m.interact.MouseLeave,n)return m end return f
end)()end,[4]=function()local b,c,d=a(4)local e return(function(...)local f={}f.__index=f f.__type='Button'local g=c.
Parent.Parent.utility local h,i,j,k,l,m=d(g.variables),d(g.functions),d(g.moveable),d(g.lockable),d(g.locale),d(g.
HapticEngine)function f.new(n,o)o=if typeof(o)=='table'then o else{}local p=setmetatable({tab=assert(n,
'Missing argument #1 (Tab expected)'),window=n.window,name=o.name or o.Name or'Button',icon=o.icon or o.Icon,description
=o.description or o.Description,compact=n.compact or false,callback=o.callback or o.Callback or function()end},f)if p.
compact then p:_buildCompact()else p:_buildFull()end if p.description and not p.compact then p.descriptor=d(c.Parent.
descriptor).new(p.tab,{description=p.description})end return p end function f._runCallback(n)n.window:_runGuarded(n,n.
callback)end function f._buildFull(n)n.main=n.window:Create('Frame',{Size=UDim2.new(1,-20,0,43),BorderSizePixel=0,Name=n
.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=n.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})n.stroke=n.window:StyleElementBody(n.main)n.hoverOverlay=n.window:
CreateHoverOverlay(n.main)n.container=n.window:Create('Frame',{BorderSizePixel=0,Parent=n.main,Size=UDim2.new(0,170,0,16
),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})n.containerLayout=n.window:
Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=n.container})if n.icon then n.
iconLabel=n.window:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=n.container},{ImageColor3='ContentColor'})end n.title=n.window:
Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(250,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=
16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=n.container},{TextColor3='ContentColor',FontFace='Font'})n.interact=n.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Position=UDim2.fromScale(0.5,0.5),
AnchorPoint=Vector2.new(0.5,0.5),TextTransparency=1,Parent=n.main})n.window:_wireElementHover(n)n.window:ConnectFor(n,n.
interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:Create(n.main,TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-26,0,43)}):Play()n:_runCallback()task.wait(0.11)h.tweenService:
Create(n.main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,43)}):
Play()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=n
.window.theme.ElementStrokeTransparency}):Play()end)end function f._buildCompact(n)local o=n.window n.main,n.stroke,n.
interact=o:_buildCompactRow(n.tab,n.name)n.hoverOverlay=n.interact o:Create('UIPadding',{PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),Parent=n.interact})o:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,Padding=UDim.new(0,6
),Parent=n.interact})if n.icon then n.iconLabel=o:Create('ImageLabel',{Image=n.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=n.interact},{ImageColor3=
'ContentColor'})end n.title=o:Create('TextLabel',{Text=l.t(n.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=n.interact},{TextColor3='ContentColor',
FontFace='Font'})o:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=n.title})n.window:_wireElementHover(n)n.
window:ConnectFor(n,n.interact.MouseButton1Click,function()m.click()h.tweenService:Create(n.stroke,TweenInfo.new(0.25,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()n:_runCallback()task.wait(0.11)h.tweenService:
Create(n.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=n.window.theme.
ElementStrokeTransparency}):Play()end)end function f._setShown(n,o,p)if o then n.window:_revealCommon(n,p)else n.window:
_hideCommon(n,p)end end function f._minWidth(n)local o=32 if n.icon then o+=22 end o+=i.textWidth(n.window.theme.Font,16
,l.resolve(n.name))return o end j(f)k(f)return f end)()end,[5]=function()local b,c,d=a(5)local e return(function(...)
local f=c.Parent.Parent.utility local g,h,i,j,k,l,m=d(f.variables),d(f.filesystem),d(f.constants),d(f.locale),d(f.
HapticEngine),{},5 function l.buildCollapsedFace(n)local o=n.showIconOnly n.collapsedIcon=n:Create('ImageLabel',{Name=
'CollapsedIcon',AnchorPoint=if o then Vector2.new(0.5,0.5)else Vector2.new(0,0.5),Position=if o then UDim2.fromScale(0.5
,0.5)else UDim2.new(0,16,0.5,0),Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,Image=n.showIcon,ZIndex=i.zIndex.
restoreContent,ImageTransparency=1,Parent=n.main},{ImageColor3='TitlingColor'})n:Create('UICorner',{Parent=n.
collapsedIcon},{CornerRadius='PillCornerRadius'})local p=n:Create('Frame',{Name='CollapsedText',Visible=not o,
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,50,0.5,0),Size=UDim2.new(1,-60,0,32),BackgroundTransparency=1,ZIndex
=i.zIndex.restoreContent,Parent=n.main})n:Create('UIListLayout',{Padding=UDim.new(0,1),VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=p})n.collapsedTitle=n:Create('TextLabel',{Name=
'Title',Text=n.showName,Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,FontFace=g.brandFont(Enum.FontWeight.Medium),
RichText=true,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=i.zIndex.
restoreContent,TextTransparency=1,Parent=p},{TextColor3='TitlingColor'})n.collapsedSubtitle=n:Create('TextLabel',{Name=
'Subtitle',Text=j.t'Tap to show',Size=UDim2.new(1,0,0,14),BackgroundTransparency=1,FontFace=g.brandFont(Enum.FontWeight.
Medium),TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=2,ZIndex=i.zIndex.restoreContent,
TextTransparency=1,Parent=p},{TextColor3='TitlingColor'})n.collapsedInteract=n:Create('TextButton',{Name=
'CollapsedInteract',BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,Visible=false,ZIndex=i
.zIndex.restoreInteract,Parent=n.main})l.bindCollapsedDrag(n)end function l.bindCollapsedDrag(n)local o,p,q,r,s=g.
userInputService,false,false,Vector2.zero,Vector2.zero local function t()if n.screenGui and n.screenGui.IgnoreGuiInset
then return g.guiService:GetGuiInset()end return Vector2.zero end n:Connect(n.collapsedInteract.InputBegan,function(u,v)
if v or not n.hidden or n.animating then return end local w=u.UserInputType.Name if w~='MouseButton1'and w~='Touch'then
return end p,q=true,false s=o:GetMouseLocation()r=n.main.AbsolutePosition+n.main.AbsoluteSize*n.main.AnchorPoint-s end)n
:Connect(o.InputEnded,function(u)local v=u.UserInputType.Name if v~='MouseButton1'and v~='Touch'then return end if not p
then return end p=false if q then n._collapsedPosition=n.main.Position return end k.click()n:ToggleHide()end)n:Connect(o
.WindowFocusReleased,function()p=false end)n:Connect(g.runService.RenderStepped,function()if not p then return end if
not n.hidden or n.animating then p=false return end local u=o:GetMouseLocation()if not q and(u-s).Magnitude<m then
return end q=true local v=u+r+t()n.main.Position=UDim2.fromOffset(v.X,v.Y)end)end function l.isNewUser()local n=g.
localPlayer if not n then return false end if typeof(h.isfile)~='function'or typeof(h.writefile)~='function'then return
true end local o,p,q=g.fileSystemManager:getPath'lastuser.txt',tostring(n.UserId),true pcall(function()if h.isfile(o)
then q=h.readfile(o)~=p end end)pcall(function()h.writefile(o,p)end)return q end function l.setCollapsedShown(n,o,p)
local q={[n.collapsedIcon]={ImageTransparency=if o then 0 else 1}}if not n.showIconOnly then q[n.collapsedTitle]={
TextTransparency=if o then 0 else 1}q[n.collapsedSubtitle]={TextTransparency=if o then 0.5 else 1}end for r,s in q do if
p then g.tweenService:Create(r,p,s):Play()else for t,u in s do r[t]=u end end end end return l end)()end,[6]=function()
local b,c,d=a(6)local e return(function(...)local f={}f.__index=f f.__type='ColorPicker'local g=c.Parent.Parent.utility
local h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z=d(g.variables),d(g.functions),d(g.moveable),d(g.lockable),d(g.constants),d(g
.locale),d(g.HapticEngine),ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(255,0,0)),ColorSequenceKeypoint.
new(0.17,Color3.fromRGB(255,255,0)),ColorSequenceKeypoint.new(0.33,Color3.fromRGB(0,255,0)),ColorSequenceKeypoint.new(
0.5,Color3.fromRGB(0,255,255)),ColorSequenceKeypoint.new(0.67,Color3.fromRGB(0,0,255)),ColorSequenceKeypoint.new(0.83,
Color3.fromRGB(255,0,255)),ColorSequenceKeypoint.new(1,Color3.fromRGB(255,0,0))},41,52,Vector2.new(150,120),184,10,214,
10,240,62,8,400 local A,B,C,D,E,F,G,H={wide={height=190,previewPos=UDim2.new(1,-20,0,q+39),previewSize=UDim2.new(1,-(w+
20),0,78),hexPos=UDim2.new(0,w,0,q+90),hexSize=UDim2.new(1,-(w+20+x+y),0,30),alphaFieldPos=UDim2.new(1,-(20+x),0,q+90),
alphaFieldSize=UDim2.new(0,x,0,30)},narrow={height=296,previewPos=UDim2.new(1,-20,0,q+r.Y+40),previewSize=UDim2.new(1,-
40,0,56),hexPos=UDim2.new(0,20,0,q+r.Y+78),hexSize=UDim2.new(1,-(40+x+y),0,30),alphaFieldPos=UDim2.new(1,-(20+x),0,q+r.Y
+78),alphaFieldSize=UDim2.new(0,x,0,30)}},UDim2.new(1,-16,0,p/2),UDim2.fromOffset(40,22),TweenInfo.new(0.5,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),
TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.12,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function I(J)return math.
clamp(J,0,1)end local function J(K)return math.clamp(math.round(K),0,255)end local K={black=Color3.fromRGB(0,0,0),white=
Color3.fromRGB(255,255,255),red=Color3.fromRGB(255,0,0),green=Color3.fromRGB(0,255,0),blue=Color3.fromRGB(0,0,255),
yellow=Color3.fromRGB(255,255,0),cyan=Color3.fromRGB(0,255,255),magenta=Color3.fromRGB(255,0,255),orange=Color3.fromRGB(
255,165,0),purple=Color3.fromRGB(128,0,128),pink=Color3.fromRGB(255,105,180),brown=Color3.fromRGB(139,69,19),gray=Color3
.fromRGB(128,128,128),grey=Color3.fromRGB(128,128,128)}local function L(M,N,O)if N<=0 then return Color3.new(O,O,O)end
local function P(Q,R,S)S=S%1 if S<0.16666666666666666 then return Q+(R-Q)*6*S elseif S<0.5 then return R elseif S<
0.6666666666666666 then return Q+(R-Q)*(0.6666666666666666-S)*6 end return Q end local Q=if O<0.5 then O*(1+N)else O+N-O
*N local R=2*O-Q return Color3.new(P(R,Q,M+0.3333333333333333),P(R,Q,M),P(R,Q,M-0.3333333333333333))end local function M
(N)local O={}for P in N:gmatch'[%d%.]+'do table.insert(O,tonumber(P))end return O end local function N(O)if typeof(O)~=
'string'then return nil end local P=(O:lower():match'^%s*(.-)%s*$')or''if P==''then return nil end if K[P]then return K[
P]end local Q,R=P:match'^(%a+)',M(P)if(Q=='hsv'or Q=='hsb')and#R>=3 then local S,T,U=(R[1]%360)/360,if R[2]>1 then R[2]/
100 else R[2],if R[3]>1 then R[3]/100 else R[3]return Color3.fromHSV(S,I(T),I(U))end if Q=='hsl'and#R>=3 then local S,T,
U=(R[1]%360)/360,if R[2]>1 then R[2]/100 else R[2],if R[3]>1 then R[3]/100 else R[3]return L(S,I(T),I(U))end if(Q=='rgb'
or Q=='rgba')and#R>=3 then return Color3.fromRGB(J(R[1]),J(R[2]),J(R[3]))end local S=P:match'^#?(%x%x%x%x%x%x)$'or P:
match'^#?(%x%x%x)$'or P:match'^0x(%x%x%x%x%x%x)$'if S then local T,U=pcall(Color3.fromHex,S)if T then return U end end
if#R>=3 and not Q then if R[1]<=1 and R[2]<=1 and R[3]<=1 then return Color3.new(I(R[1]),I(R[2]),I(R[3]))end return
Color3.fromRGB(J(R[1]),J(R[2]),J(R[3]))end return nil end local function O(P,Q)if typeof(P)=='Color3'then return P end
if typeof(P)=='string'then return N(P)or Q end return Q end function f.new(P,Q)Q=if typeof(Q)=='table'then Q else{}local
R=setmetatable({tab=assert(P,'Missing argument #1 (Tab expected)'),window=P.window,name=Q.name or Q.Name or
'Color Picker',icon=Q.icon or Q.Icon,description=Q.description or Q.Description,forgetState=Q.forgetState or Q.
ForgetState or P.forgetState,callback=Q.callback or Q.Callback or function()end,_isOpen=false},f)R.value=O(Q.color or Q.
Color or Q.value or Q.Value or Q.default,Color3.fromRGB(255,255,255))R.hue,R.sat,R.val=R.value:ToHSV()local S=Q.alpha or
Q.Alpha R.alpha=if type(S)=='number'then I(S)else 1 R.flag=Q.flag or Q.Flag or(not R.forgetState and i.
deriveFlagFromName(R.name)or nil)R.window:_registerControl(R)R.main=R.window:Create('Frame',{Size=UDim2.new(1,-20,0,p),
BorderSizePixel=0,Name=R.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=R.tab.tabPage
},{BackgroundTransparency='ElementTransparency'})R.stroke=R.window:StyleElementBody(R.main)R.hoverOverlay=R.window:
CreateHoverOverlay(R.main)R:_buildHeader()R:_buildPicker()R.window:ConnectFor(R,R.interact.MouseButton1Click,function()n
.click()if R._isOpen then R:_close()else R:_open()end end)R.window:ConnectFor(R,R.main.MouseEnter,function()if R._isOpen
or not R.window:_interactive()then return end local T=R.window.theme h.tweenService:Create(R.stroke,E,{Transparency=T.
ElementStrokeHoverTransparency,Color=T.ElementStrokeHover}):Play()h.tweenService:Create(R.title,E,{TextColor3=T.
ElementTextHoverColor}):Play()h.tweenService:Create(R.hoverOverlay,E,{BackgroundTransparency=0.97}):Play()end)R.window:
ConnectFor(R,R.main.MouseLeave,function()local T=R.window.theme h.tweenService:Create(R.stroke,E,{Transparency=T.
ElementStrokeTransparency,Color=T.ElementStroke}):Play()h.tweenService:Create(R.title,E,{TextColor3=T.ContentColor}):
Play()h.tweenService:Create(R.hoverOverlay,E,{BackgroundTransparency=1}):Play()end)if R.description then R.descriptor=d(
c.Parent.descriptor).new(R.tab,{description=R.description})end R:_applyPickerVisibility(false,false)R:
_setControlsVisible(false)R.window:ConnectFor(R,R.main:GetPropertyChangedSignal'AbsoluteSize',function()if R.window.
animating or(R.window.hidden and R.window.hasShownOnce)then return end R:_applyLayout()end)R:_applyLayout()R:_render
'instant'return R end function f._buildHeader(P)P.container=P.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position
=UDim2.new(0,20,0,p/2),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=P.main}
)P.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=P.container})if P.icon then P.iconLabel=P.
window:Create('ImageLabel',{Image=P.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=
5,ImageTransparency=1,Parent=P.container},{ImageColor3='ContentColor'})end P.title=P.window:Create('TextLabel',{Text=m.
t(P.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=P.container},{
TextColor3='ContentColor',FontFace='Font'})P.preview=P.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=B,
Size=C,BackgroundColor3=P.value,BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=P.main})P.window:Create(
'UICorner',{CornerRadius=UDim.new(0,8),Parent=P.preview})P.previewShadow=P.window:CreateGlow(P.preview,P.value,20,1)P.
invisibleGroup=P.window:Create('Frame',{Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.
new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=P.preview})P.window:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=P.invisibleGroup})P.
invisibleIcon=P.window:Create('ImageLabel',{Image=l.icons.colorpicker,Size=UDim2.fromOffset(16,16),
BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,ImageTransparency=1,Parent=P.invisibleGroup},{ImageColor3=
'ContentColor'})P.invisibleText=P.window:Create('TextLabel',{Text=m.t'Invisible',Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=P.invisibleGroup},{TextColor3='ContentColor',FontFace='Font'})P.interact=P.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,p),Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',
TextTransparency=1,AutoButtonColor=false,ZIndex=10,Parent=P.main})end function f._buildMap(P)P.map=P.window:Create(
'Frame',{Position=UDim2.fromOffset(20,q),Size=UDim2.fromOffset(r.X,r.Y),BackgroundColor3=Color3.fromHSV(P.hue,1,1),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(0,8
),Parent=P.map})P.mapStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=P.map})P
.satOverlay=P.window:Create('Frame',{Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=3,BackgroundTransparency=1,Parent=P.map})P.window:Create('UICorner',{CornerRadius=UDim.new(0,8)
,Parent=P.satOverlay})P.window:Create('UIGradient',{Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1)},Parent=P.satOverlay})P.valOverlay=P.window:Create('Frame',{Size=UDim2.fromScale(1,1),
BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=P.map})P.window:
Create('UICorner',{CornerRadius=UDim.new(0,8),Parent=P.valOverlay})P.window:Create('UIGradient',{Rotation=90,
Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),NumberSequenceKeypoint.new(1,0)},Parent=P.valOverlay})
end function f._buildPicker(P)P:_buildMap()P.satCursor=P.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Size=
UDim2.fromOffset(12,12),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=6,BackgroundTransparency=1
,Parent=P.map})P.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=P.satCursor})P.satCursorStroke=P.window:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=P.satCursor})P.mapInteract=P.
window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,
AutoButtonColor=false,ZIndex=7,Parent=P.map})P.hueBar=P.window:Create('Frame',{Position=UDim2.fromOffset(s,q),Size=UDim2
.fromOffset(t,r.Y),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,
Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=P.hueBar})P.window:Create('UIGradient',{
Color=o,Rotation=90,Parent=P.hueBar})P.hueHandle=P.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(t+8,8),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=
4,BackgroundTransparency=1,Parent=P.hueBar})P.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=P.hueHandle})P
.hueHandleStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=P.
hueHandle})P.hueInteract=P.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=P.
hueBar})P.alphaBar=P.window:Create('Frame',{Position=UDim2.fromOffset(u,q),Size=UDim2.fromOffset(v,r.Y),BackgroundColor3
=P.value,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=
UDim.new(1,0),Parent=P.alphaBar})P.alphaGradient=P.window:Create('UIGradient',{Rotation=90,Transparency=NumberSequence.
new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(1,1)},Parent=P.alphaBar})P.alphaHandle=P.window:Create(
'Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0,0),Size=UDim2.fromOffset(v+8,8),BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=4,BackgroundTransparency=1,Parent=P.alphaBar})P.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=P.alphaHandle})P.alphaHandleStroke=P.window:Create('UIStroke',{Color=
Color3.fromRGB(255,255,255),Thickness=2,Transparency=1,Parent=P.alphaHandle})P.alphaInteract=P.window:Create(
'TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,16,1,8),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.
new(0.5,0.5),Text='',TextTransparency=1,AutoButtonColor=false,ZIndex=6,Parent=P.alphaBar})P.hexBox=P.window:Create(
'Frame',{Position=UDim2.new(0,w,0,q+90),Size=UDim2.new(1,-(w+20),0,30),BackgroundColor3=Color3.fromRGB(255,255,255),
BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(0,8
),Parent=P.hexBox})P.hexBoxStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=P.
hexBox})P.hexInput=P.window:Create('TextBox',{Text='#'..P.value:ToHex():upper(),PlaceholderText=m.t'Smart Input',Size=
UDim2.new(1,-14,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,ZIndex=3,TextTransparency
=1,Parent=P.hexBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})P.alphaBox=P.window
:Create('Frame',{Position=UDim2.new(0,w,0,q+90),Size=UDim2.fromOffset(x,30),BackgroundColor3=Color3.fromRGB(255,255,255)
,BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=P.main})P.window:Create('UICorner',{CornerRadius=UDim.new(0,
8),Parent=P.alphaBox})P.alphaBoxStroke=P.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,
Parent=P.alphaBox})P.alphaInput=P.window:Create('TextBox',{Text=tostring(math.round(P.alpha*100))..'%',PlaceholderText=
'100%',Size=UDim2.new(1,-10,1,0),Position=UDim2.fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.TextXAlignment.Center,ClearTextOnFocus=false,
ZIndex=3,TextTransparency=1,Parent=P.alphaBox},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3=
'PlaceholderColor'})P.window:ConnectFor(P,P.mapInteract.InputBegan,function(Q)if Q.UserInputType==Enum.UserInputType.
MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch then P:_beginDrag('sat',Q.UserInputType==Enum.UserInputType.
MouseButton1)end end)P.window:ConnectFor(P,P.hueInteract.InputBegan,function(Q)if Q.UserInputType==Enum.UserInputType.
MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch then P:_beginDrag('hue',Q.UserInputType==Enum.UserInputType.
MouseButton1)end end)P.window:ConnectFor(P,P.alphaInteract.InputBegan,function(Q)if Q.UserInputType==Enum.UserInputType.
MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch then P:_beginDrag('alpha',Q.UserInputType==Enum.UserInputType.
MouseButton1)end end)P.window:ConnectFor(P,h.userInputService.InputEnded,function(Q)if(Q.UserInputType==Enum.
UserInputType.MouseButton1 or Q.UserInputType==Enum.UserInputType.Touch)and P._drag then P:_endDrag()end end)P.window:
ConnectFor(P,P.hexInput.FocusLost,function()local Q=N(P.hexInput.Text)if Q then P:Set(Q)else P.hexInput.Text='#'..P.
value:ToHex():upper()end end)P.window:ConnectFor(P,P.alphaInput.FocusLost,function()local Q=tonumber((P.alphaInput.Text:
gsub('[^%d%.]','')))if Q then P:SetAlpha(I(Q/100))else P.alphaInput.Text=tostring(math.round(P.alpha*100))..'%'end end)
end function f._beginDrag(P,Q,R)if not P._isOpen then return end P._drag=Q P._dragIsMouse=R P:_setHeld(Q)P:_pump()if P.
_dragConnection then P._dragConnection:Disconnect()P._dragConnection=nil end P._dragConnection=h.runService.
RenderStepped:Connect(function()local S=P._dragIsMouse and not h.userInputService:IsMouseButtonPressed(Enum.
UserInputType.MouseButton1)if P.window.unloaded or not P._drag or S then if S then P:_endDrag()return end if P.
_dragConnection then P._dragConnection:Disconnect()P._dragConnection=nil end return end P:_pump()end)end function f.
_endDrag(P)P._drag=nil P:_setHeld(nil)if P._dragConnection then P._dragConnection:Disconnect()P._dragConnection=nil end
P.window:_persist(P)end function f._setHeld(P,Q)local R,S,T=if Q=='sat'then UDim2.fromOffset(16,16)else UDim2.
fromOffset(12,12),if Q=='hue'then UDim2.fromOffset(t+12,10)else UDim2.fromOffset(t+8,8),if Q=='alpha'then UDim2.
fromOffset(v+12,10)else UDim2.fromOffset(v+8,8)h.tweenService:Create(P.satCursor,H,{Size=R}):Play()h.tweenService:
Create(P.hueHandle,H,{Size=S}):Play()h.tweenService:Create(P.alphaHandle,H,{Size=T}):Play()end function f._mouseLocation
(P)local Q,R=h.userInputService:GetMouseLocation(),P.window.screenGui if R and R.IgnoreGuiInset then return Q-h.
guiService:GetGuiInset()end return Q end function f._pump(P)local Q,R,S,T=P.hue,P.sat,P.val,P.alpha if P._drag=='sat'
then local U=P.map.AbsoluteSize if U.X<=0 or U.Y<=0 then return end local V=P:_mouseLocation()P.sat=I((V.X-P.map.
AbsolutePosition.X)/U.X)P.val=1-I((V.Y-P.map.AbsolutePosition.Y)/U.Y)elseif P._drag=='hue'then local U=P.hueBar.
AbsoluteSize.Y if U<=0 then return end local V=P:_mouseLocation()P.hue=I((V.Y-P.hueBar.AbsolutePosition.Y)/U)elseif P.
_drag=='alpha'then local U=P.alphaBar.AbsoluteSize.Y if U<=0 then return end local V=P:_mouseLocation()P.alpha=1-I((V.Y-
P.alphaBar.AbsolutePosition.Y)/U)else return end if P.hue==Q and P.sat==R and P.val==S and P.alpha==T then return end P.
value=Color3.fromHSV(P.hue,P.sat,P.val)P:_render'drag'P:_fireCallback()end function f._render(P,Q)local R,S,T,U,V,W=
Color3.fromHSV(P.hue,1,1),UDim2.new(P.sat,0,1-P.val,0),UDim2.new(0.5,0,P.hue,0),UDim2.new(0.5,0,1-P.alpha,0),1-P.alpha,1
-0.4*P.alpha if Q=='instant'then P.map.BackgroundColor3=R P.satCursor.Position,P.satCursor.BackgroundColor3=S,P.value P.
hueHandle.Position,P.hueHandle.BackgroundColor3=T,R P.alphaBar.BackgroundColor3=P.value P.alphaHandle.Position,P.
alphaHandle.BackgroundColor3=U,P.value P.preview.BackgroundColor3=P.value P.previewShadow.Color=P.value if not P.window.
hidden then P.preview.BackgroundTransparency=V P.previewShadow.Transparency=W end else local X=if Q=='drag'then G else F
h.tweenService:Create(P.map,X,{BackgroundColor3=R}):Play()h.tweenService:Create(P.satCursor,X,{Position=S,
BackgroundColor3=P.value}):Play()h.tweenService:Create(P.hueHandle,X,{Position=T,BackgroundColor3=R}):Play()h.
tweenService:Create(P.alphaHandle,X,{Position=U,BackgroundColor3=P.value}):Play()h.tweenService:Create(P.alphaBar,F,{
BackgroundColor3=P.value}):Play()local Y,Z={BackgroundColor3=P.value},{Color=P.value}if not P.window.hidden then Y.
BackgroundTransparency=V Z.Transparency=W end h.tweenService:Create(P.preview,F,Y):Play()h.tweenService:Create(P.
previewShadow,F,Z):Play()end if not P.hexInput:IsFocused()then P.hexInput.Text='#'..P.value:ToHex():upper()end if not P.
alphaInput:IsFocused()then P.alphaInput.Text=tostring(math.round(P.alpha*100))..'%'end P:_renderInvisible(Q~='instant')
end function f._renderInvisible(P,Q)local R=0 if P._isOpen and not P.window.hidden then R=I((0.12-P.alpha)/0.12)end
local S=1-R if Q then h.tweenService:Create(P.invisibleIcon,E,{ImageTransparency=S}):Play()h.tweenService:Create(P.
invisibleText,E,{TextTransparency=S}):Play()else P.invisibleIcon.ImageTransparency=S P.invisibleText.TextTransparency=S
end end function f._fireCallback(P)P.window:_runGuarded(P,P.callback,P.value,P.alpha)end function f._open(P)if P._isOpen
then return end P._isOpen=true P:_setControlsVisible(true)if P._outsideClickConn then P.window:Disconnect(P.
_outsideClickConn)end P._outsideClickConn=P.window:Connect(h.userInputService.InputBegan,function(Q)if Q.UserInputType~=
Enum.UserInputType.MouseButton1 and Q.UserInputType~=Enum.UserInputType.Touch then return end local R,S,T=Q.Position,P.
main.AbsolutePosition,P.main.AbsoluteSize if R.X<S.X or R.X>S.X+T.X or R.Y<S.Y or R.Y>S.Y+T.Y then P:_close()end end)h.
tweenService:Create(P.main,D,{Size=UDim2.new(1,-20,0,P._openHeight)}):Play()h.tweenService:Create(P.preview,D,{Position=
P._previewOpenPos,Size=P._previewOpenSize}):Play()P:_applyPickerVisibility(true,true)P:_renderInvisible(true)end
function f._close(P)if not P._isOpen then return end P._isOpen=false if P._outsideClickConn then P.window:Disconnect(P.
_outsideClickConn)P._outsideClickConn=nil end if P._drag then P:_endDrag()end if P.hexInput:IsFocused()then P.hexInput:
ReleaseFocus()end if P.alphaInput:IsFocused()then P.alphaInput:ReleaseFocus()end P:_applyPickerVisibility(false,true)P:
_renderInvisible(true)h.tweenService:Create(P.preview,D,{Position=B,Size=C}):Play()h.tweenService:Create(P.main,D,{Size=
UDim2.new(1,-20,0,p)}):Play()task.delay(E.Time,function()if not P._isOpen then P:_setControlsVisible(false)end end)end
function f._applyPickerVisibility(P,Q,R)local S={[P.map]={BackgroundTransparency=if Q then 0 else 1},[P.satOverlay]={
BackgroundTransparency=if Q then 0 else 1},[P.valOverlay]={BackgroundTransparency=if Q then 0 else 1},[P.mapStroke]={
Transparency=if Q then 0.9 else 1},[P.satCursor]={BackgroundTransparency=if Q then 0 else 1},[P.satCursorStroke]={
Transparency=if Q then 0 else 1},[P.hueBar]={BackgroundTransparency=if Q then 0 else 1},[P.hueHandle]={
BackgroundTransparency=if Q then 0 else 1},[P.hueHandleStroke]={Transparency=if Q then 0 else 1},[P.alphaBar]={
BackgroundTransparency=if Q then 0 else 1},[P.alphaHandle]={BackgroundTransparency=if Q then 0 else 1},[P.
alphaHandleStroke]={Transparency=if Q then 0 else 1},[P.hexBox]={BackgroundTransparency=if Q then 0.9 else 1},[P.
hexBoxStroke]={Transparency=if Q then 0.85 else 1},[P.hexInput]={TextTransparency=if Q then 0.4 else 1},[P.alphaBox]={
BackgroundTransparency=if Q then 0.9 else 1},[P.alphaBoxStroke]={Transparency=if Q then 0.85 else 1},[P.alphaInput]={
TextTransparency=if Q then 0.4 else 1}}for T,U in S do if R then h.tweenService:Create(T,E,U):Play()else for V,W in U do
T[V]=W end end end end function f._setControlsVisible(P,Q)for R,S in{P.map,P.hueBar,P.alphaBar,P.hexBox,P.alphaBox}do S.
Visible=Q end end function f._applyLayout(P)local Q=P.main.AbsoluteSize.X local R=if Q>0 and Q<z then'narrow'else'wide'
if R==P._layoutMode then return end P._layoutMode=R local S=A[R]P._openHeight=S.height P._previewOpenPos=S.previewPos P.
_previewOpenSize=S.previewSize P.hexBox.Position=S.hexPos P.hexBox.Size=S.hexSize P.alphaBox.Position=S.alphaFieldPos P.
alphaBox.Size=S.alphaFieldSize if P._isOpen then h.tweenService:Create(P.main,D,{Size=UDim2.new(1,-20,0,P._openHeight)})
:Play()h.tweenService:Create(P.preview,D,{Position=P._previewOpenPos,Size=P._previewOpenSize}):Play()end end function f.
Set(P,Q,R)P.value=O(Q,P.value)P.hue,P.sat,P.val=P.value:ToHSV()P:_render(if P._isOpen then'animate'else'instant')if not
R then P:_fireCallback()P.window:_persist(P)end end function f.SetAlpha(P,Q,R)P.alpha=I(if type(Q)=='number'then Q else
P.alpha)P:_render(if P._isOpen then'animate'else'instant')if not R then P:_fireCallback()P.window:_persist(P)end end
function f._serialize(P)return P.value:ToHex()..string.format('%02x',math.clamp(math.round((P.alpha or 1)*255),0,255))
end function f._deserialize(P,Q)local R,S=(tostring(Q))if#R>=8 then S=(tonumber(R:sub(7,8),16)or 255)/255 R=R:sub(1,6)
end local T,U=pcall(Color3.fromHex,R)if not T then return end if S then P:SetAlpha(S,true)end P:Set(U)end function f.
_setShown(P,Q,R)local S=P.window if Q then S:_revealCommon(P,R)S:_reveal(P.preview,{BackgroundTransparency=1-P.alpha},R)
S:_reveal(P.previewShadow,{Transparency=1-0.4*P.alpha},R)else S:_hideCommon(P,R)S:_reveal(P.preview,{
BackgroundTransparency=1},R)S:_reveal(P.previewShadow,{Transparency=1},R)if P._isOpen then P:_close()end end end j(f)k(f
)return f end)()end,[7]=function()local b,c,d=a(7)local e return(function(...)local f={}f.__index=f f.__type='Console'
local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o,p,q,r=d(g.moveable),d(g.locale),120,48,24,17,12,12,1.25,200,Font.
fromEnum(Enum.Font.Code)function f.new(s,t)t=if typeof(t)=='table'then t else{}local u=setmetatable({tab=assert(s,
'Missing argument #1 (Tab expected)'),window=s.window,name=t.name or t.Name,description=t.description or t.Description,
height=math.max(tonumber(t.height or t.Height)or j,k),follow=t.follow or t.Follow or false,maxLines=math.max(tonumber(t.
maxLines or t.MaxLines)or q,1),lines={},lineLabels={},head=1,nextOrder=1,textDirty=true},f)u:_build()u:_setLines(t.text
or t.Text or'')if u.description then u.descriptor=d(c.Parent.descriptor).new(u.tab,{description=u.description})end
return u end function f.Get(s):string if s.textDirty then s.text=table.concat(s.lines,'\n')s.textDirty=false end return
s.text end function f._setLines(s,t)t=if type(t)=='string'then t else tostring(t)table.clear(s.lines)if t~=''then for u
in string.gmatch(t..'\n','([^\n]*)\n')do table.insert(s.lines,u)end end s:_trim()s:_flush()end function f._trim(s)local
t=#s.lines-s.maxLines if t<=0 then return end table.move(s.lines,t+1,#s.lines,1)for u=#s.lines,#s.lines-t+1,-1 do s.
lines[u]=nil end end function f._makeLabel(s)return s.window:Create('TextLabel',{Size=UDim2.new(1,0,0,0),AutomaticSize=
Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,FontFace=r,TextSize=o,TextXAlignment=Enum.TextXAlignment
.Left,TextYAlignment=Enum.TextYAlignment.Top,TextWrapped=true,LineHeight=p,RichText=false,TextTransparency=s.
_textTransparency or 1,Parent=s.scroll},{TextColor3='ContentColor'})end local function s(t:string):string return if t==
''then' 'else t end function f._flush(t)t.textDirty=true for u,v in t.lines do local w=t.lineLabels[u]if not w then w=t:
_makeLabel()t.lineLabels[u]=w end w.LayoutOrder=u w.Text=s(v)w.Visible=true end for u=#t.lines+1,#t.lineLabels do t.
lineLabels[u].Visible=false end t.head=1 t.nextOrder=#t.lines+1 t:_follow()end function f._pushLine(t,u:string)t.
textDirty=true if#t.lines<t.maxLines then table.insert(t.lines,u)local v=#t.lines local w=t.lineLabels[v]if not w then w
=t:_makeLabel()t.lineLabels[v]=w end w.LayoutOrder=t.nextOrder w.Text=s(u)w.Visible=true t.nextOrder+=1 return end table
.move(t.lines,2,#t.lines,1)t.lines[#t.lines]=u local v=t.lineLabels[t.head]v.LayoutOrder=t.nextOrder v.Text=s(u)v.
Visible=true t.nextOrder+=1 t.head=(t.head%#t.lineLabels)+1 end function f._build(t)local u=if t.name then l else 0 t.
main=t.window:Create('Frame',{Size=UDim2.new(1,-20,0,t.height+u+m*2),BorderSizePixel=0,Name=t.name or'Console',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=t.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})t.stroke=t.window:StyleElementBody(t.main)if t.name then t.container=t.window:Create('Frame',{
Size=UDim2.new(1,-m*2,0,16),Position=UDim2.new(0,m,0,m),BackgroundTransparency=1,BorderSizePixel=0,Parent=t.main})t.
title=t.window:Create('TextLabel',{Text=i.t(t.name),Size=UDim2.fromScale(1,1),BorderSizePixel=0,BackgroundTransparency=1
,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=t.container},{TextColor3='ContentColor',
FontFace='Font'})end t.panel=t.window:Create('Frame',{AnchorPoint=Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-m),Size
=UDim2.new(1,-m*2,0,t.height),BorderSizePixel=0,ClipsDescendants=true,BackgroundTransparency=1,Parent=t.main},{
BackgroundColor3='StatBackground'})t.window:Create('UICorner',{Parent=t.panel},{CornerRadius='ElementCornerRadius'})t.
panelStroke=t.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,Parent=t.panel},{
Color='SurfaceStroke'})t.scroll=t.window:Create('ScrollingFrame',{Size=UDim2.new(1,-n*2,1,-n*2),Position=UDim2.
fromScale(0.5,0.5),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,AutomaticCanvasSize=Enum.
AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.ScrollingDirection.Y,Parent=t
.panel})t.scrollLayout=t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=
Enum.HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,SortOrder=Enum.SortOrder.LayoutOrder,Parent=t
.scroll})t:_watchCanvas()end function f._pin(t)local u=t.scroll if not u or not u.Parent then return end u.
CanvasPosition=Vector2.new(0,u.AbsoluteCanvasSize.Y)end function f._follow(t)if not t.follow then return end t:_pin()
task.defer(function()t:_pin()end)end function f._watchCanvas(t)t.window:ConnectFor(t,t.scrollLayout:
GetPropertyChangedSignal'AbsoluteContentSize',function()if t.follow then t:_pin()end end)end function f.Set(t,u)t:
_setLines(u)end function f.Append(t,u)u=if type(u)=='string'then u else tostring(u)for v in string.gmatch(u..'\n',
'([^\n]*)\n')do t:_pushLine(v)end t:_follow()end function f.Clear(t)table.clear(t.lines)t:_flush()end function f.Copy(t)
:boolean local u=(getgenv and getgenv().setclipboard)or setclipboard if typeof(u)~='function'then return false end
return(pcall(u,t:Get()))end function f.SetHeight(t,u)t.height=math.max(tonumber(u)or j,k)local v=if t.name then l else 0
t.panel.Size=UDim2.new(1,-m*2,0,t.height)t.main.Size=UDim2.new(1,-20,0,t.height+v+m*2)end function f._setShown(t,u,v)
local w=t.window w:_reveal(t.main,{BackgroundTransparency=if u then w.theme.ElementTransparency or 0 else 1},v)w:
_reveal(t.stroke,{Transparency=if u then w.theme.ElementStrokeTransparency else 1},v)w:_reveal(t.panel,{
BackgroundTransparency=if u then 0 else 1},v)w:_reveal(t.panelStroke,{Transparency=if u then 0.9 else 1},v)t.
_textTransparency=if u then 0.15 else 1 for x,y in t.lineLabels do w:_reveal(y,{TextTransparency=t._textTransparency},v)
end if t.title then w:_reveal(t.title,{TextTransparency=if u then 0 else 1},v)end if t.descriptor then w:_reveal(t.
descriptor.titleLabel,{TextTransparency=if u then 0.7 else 1},v)end end function f.Remove(t)if t.descriptor then t.
descriptor:Remove()end t.main:Destroy()end h(f)return f end)()end,[8]=function()local b,c,d=a(8)local e return(function(
...)local f={}f.__index=f f.__type='Descriptor'local g=d(c.Parent.Parent.utility.locale)function f.new(h,i)i=if typeof(i
)=='table'then i else{}local j=setmetatable({tab=assert(h,'Missing argument #1 (Tab expected)'),window=h.window,
description=i.description or i.Description or''},f)j.main=j.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,Size=UDim2.new(1,-30,0,0),Parent=j.tab.tabPage})j.window:Create('UIListLayout',{SortOrder=Enum.
SortOrder.LayoutOrder,Parent=j.main})j.titleLabel=j.window:Create('TextLabel',{AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,RichText=true,Size=UDim2.new(1,-90,0,0),Text=g.t(j.description),TextSize=12,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=j.main},{TextColor3='ContentColor',FontFace='Font'})j.
window:Create('Frame',{BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,Size=UDim2.fromOffset(0,15),Parent=j.
main})return j end return f end)()end,[9]=function()local b,c,d=a(9)local e return(function(...)local f={}f.__index=f f.
__type='Divider'local g,h,i,j,k,l,m,n,o=d(c.Parent.Parent.utility.moveable),d(c.Parent.Parent.utility.locale),1,12,10,14
,12,0.88,0.55 function f.new(p,q)q=if typeof(q)=='table'then q else{}local r,s=q.spacing or q.Spacing,q.text or q.Text
local t=setmetatable({tab=assert(p,'Missing argument #1 (Tab expected)'),window=p.window,text=if s~=nil then tostring(s)
else'',spacing=if type(r)=='number'then math.max(r,0)else j,line=q.line~=false and q.Line~=false},f)t.main=t.window:
Create('Frame',{Size=UDim2.new(1,-40,0,0),BorderSizePixel=0,Name='Divider',BackgroundTransparency=1,Parent=t.tab.tabPage
})t.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,Padding=UDim.new(0,k),SortOrder=Enum.
SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Center,Parent=t.main})if t.line then t.left=t:_buildHalf(1)end if t.text~=''then t:_buildLabel()end t:_applyHeight()
return t end function f._buildHalf(p,q)local r=p.window:Create('Frame',{Size=UDim2.new(0,0,0,i),BorderSizePixel=0,
LayoutOrder=q,BackgroundTransparency=1,Parent=p.main},{BackgroundColor3='ContentColor'})p.window:Create('UIFlexItem',{
FlexMode=Enum.UIFlexMode.Fill,Parent=r})return r end function f._buildLabel(p)p.title=p.window:Create('TextLabel',{Text=
h.t(p.text),Size=UDim2.fromOffset(0,l),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,
TextSize=m,TextXAlignment=Enum.TextXAlignment.Center,LayoutOrder=2,TextTransparency=1,Parent=p.main},{TextColor3=
'ContentColor',FontFace='Font'})if p.line then p.right=p:_buildHalf(3)end end function f._applyHeight(p)local q=if p.
text~=''then l elseif p.line then i else 0 p.main.Size=UDim2.new(1,-40,0,p.spacing*2+q)end function f.Set(p,q)p.text=if
q~=nil then tostring(q)else''if p.text~=''and not p.title then p:_buildLabel()if not p.window.hidden then p:_setShown(
true,true)end end if p.title then p.window:_bindLocale(p.title,'Text',p.text)local r=p.text~=''p.title.Visible=r if p.
right then p.right.Visible=r end end p:_applyHeight()end function f._setShown(p,q,r)local s,t=p.window,if q then n else
1 s:_reveal(p.left,{BackgroundTransparency=t},r)s:_reveal(p.right,{BackgroundTransparency=t},r)s:_reveal(p.title,{
TextTransparency=if q then o else 1},r)end g(f)return f end)()end,[10]=function()local b,c,d=a(10)local e return(
function(...)local f={}f.__index=f f.__type='Drag'local g=c.Parent.Parent.utility local h,i=d(g.variables),d(g.constants
)function f.new(j,k)k=if typeof(k)=='table'then k else{}local l=setmetatable({window=assert(j,
'Missing argument #1 (Window expected)')},f)l.drag=l.window:Create('Frame',{BackgroundTransparency=1,Size=UDim2.
fromOffset(150,20),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,l.window.size.Y.Offset/2+15),ZIndex=i.
zIndex.drag,Visible=false,Parent=l.window.screenGui})l.dragCosmetic=l.window:Create('Frame',{BackgroundColor3=Color3.
fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.fromScale(0.5,0.3),ZIndex=i.zIndex.drag,
BackgroundTransparency=1,Size=UDim2.fromOffset(0,4),Parent=l.drag})l.window:Create('UICorner',{CornerRadius=UDim.new(0,
20),Parent=l.dragCosmetic})l.window:CreateGlow(l.dragCosmetic,Color3.fromRGB(255,255,255),10,0.5)l.dragInteract=l.window
:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),TextTransparency=1,ZIndex=i.zIndex.drag,Parent=
l.drag})local m,n,o,p=false,Vector2.zero,(l.window.screenGui)if o and o.IgnoreGuiInset then n=h.guiService:GetGuiInset()
end local function q()local r,s,t=h.userInputService and h.userInputService:GetMouseLocation()or Vector2.new(0,0),p or
Vector2.new(0,0),n or Vector2.new(0,0)return r+s+t end local function r()local s=q()local t,u=s.X,s.Y if l.window.
settings and l.window.settings.keepOnScreen then local v,w,x=l.window.main.AbsoluteSize,l.window.screenGui.AbsoluteSize,
8 local y,z=v.X/2,v.Y/2 t=math.clamp(t,y+x,math.max(y+x,w.X-y-x))u=math.clamp(u,z+x,math.max(z+x,w.Y-z-x))end local v,w=
UDim2.fromOffset(t,u),UDim2.fromOffset(t,u+(l.window.main.Size.Y.Offset/2+15))return v,w end l.window:Connect(l.drag.
MouseEnter,function()if not m and not l.window.hidden then h.tweenService:Create(l.dragCosmetic,TweenInfo.new(0.25,Enum.
EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.5,Size=UDim2.new(0,120,0,4)}):Play()end end)l.
window:Connect(l.drag.MouseLeave,function()if not m and not l.window.hidden then h.tweenService:Create(l.dragCosmetic,
TweenInfo.new(0.25,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{BackgroundTransparency=0.7,Size=UDim2.new(0,100,0,4)
}):Play()end end)local function s()if not m then return end m=false if not l.window:_interactive()then return end h.
tweenService:Create(l.dragCosmetic,TweenInfo.new(0.35,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,
100,0,4),BackgroundTransparency=0.7}):Play()local t,u,v=TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),r()h.tweenService:Create(l.window.main,t,{Position=u}):Play()h.tweenService:Create(l.drag,t,{Position=v}):Play()end
l.window:Connect(l.dragInteract.InputBegan,function(t,u)if u then return end local v=t.UserInputType.Name if v==
'MouseButton1'or v=='Touch'then if not l.window:_interactive()then return end m=true if o and o.IgnoreGuiInset then n=h.
guiService:GetGuiInset()end p=l.window.main.AbsolutePosition+l.window.main.AbsoluteSize*l.window.main.AnchorPoint-h.
userInputService:GetMouseLocation()if not l.window.hidden then h.tweenService:Create(l.dragCosmetic,TweenInfo.new(0.35,
Enum.EasingStyle.Back,Enum.EasingDirection.Out),{Size=UDim2.new(0,110,0,4),BackgroundTransparency=0}):Play()end end end)
l.window:Connect(h.userInputService.InputEnded,function(t)local u=t.UserInputType.Name if u=='MouseButton1'or u=='Touch'
then s()end end)l.window:Connect(h.userInputService.WindowFocusReleased,s)local t,u=1e-7,1e-60 l.window:Connect(h.
runService.RenderStepped,function(v)if not m then return end if not l.window:_interactive()then s()return end local w,x=
r()l.window.main.Position=l.window.main.Position:Lerp(w,1-t^v)l.drag.Position=l.drag.Position:Lerp(x,1-u^v)end)return l
end return f end)()end,[11]=function()local b,c,d=a(11)local e return(function(...)local f={}f.__index=f f.__type=
'Dropdown'local g=c.Parent.Parent.utility local h,i,j,k,l,m,n,o=d(g.variables),d(g.functions),d(g.image),d(g.constants),
d(g.locale),d(g.HapticEngine),d(g.windowSizing),d(g.lockable)local p,q,r,s,t,u,v,w,x,y,z,A,B,C,D=k.icons.chevron,k.icons
.check,k.icons.dot,k.icons.search,UDim.new(0,12),UDim.new(0,7),30,38,38,5,2,41,6,7,6 local E,F,G,H,I,J,K=C+D,4,22,
TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),0.4,TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)local function L(M)
local N,O={},{}for P,Q in M do if typeof(Q)=='string'and not N[Q]then N[Q]=true table.insert(O,Q)end end return O end
local function M(N,O)if N==nil then return{}end if typeof(N)=='string'then return{N}end if typeof(N)=='table'then local
P=L(N)if not O and#P>1 then return{P[1]}end return P end return{}end local function N(O,P)local Q={}for R,S in O do if
table.find(P,S)then table.insert(Q,S)end end return Q end local function O(P,Q)if#P~=#Q then return false end for R,S in
P do if not table.find(Q,S)then return false end end return true end function f.new(P,Q)Q=if typeof(Q)=='table'then Q
else{}local R,S=Q.options or Q.Options or{},Q.multiSelect or Q.MultiSelect or Q.MultipleOptions or false local T=
setmetatable({tab=assert(P,'Missing argument #1 (Tab expected)'),window=P.window,name=Q.name or Q.Name or'Dropdown',icon
=Q.icon or Q.Icon,description=Q.description or Q.Description,forgetState=Q.forgetState or Q.ForgetState or P.forgetState
,flag=Q.flag or Q.Flag or(not(Q.forgetState or Q.ForgetState or P.forgetState)and i.deriveFlagFromName(Q.name or Q.Name
or'Dropdown')or nil),callback=Q.callback or Q.Callback or function()end,options=L(R),multiSelect=S,placeholderText=l.
resolve(Q.placeholder or Q.Placeholder or'None'),value=M(Q.value or Q.Value or Q.currentOption or Q.CurrentOption,S),
_isOpen=false,_optionFrames={}},f)T._desiredValue=T.value T.value=N(T.value,T.options)T.window:_registerControl(T)T.main
=T.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=T.name,BackgroundTransparency=1,Parent=T.tab
.tabPage})T.top=T.window:Create('Frame',{Size=UDim2.new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,ZIndex=1,Parent=T.main},{BackgroundTransparency=
'ElementTransparency'})T.stroke=T.window:StyleElementBody(T.top)T.hoverOverlay=T.window:CreateHoverOverlay(T.top)T.
flashTarget=T.top T.container=T.window:Create('Frame',{BorderSizePixel=0,Parent=T.top,Size=UDim2.new(0,170,0,16),
Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,ZIndex=5})T.containerLayout=T.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=T.container})if T.icon then T.
iconLabel=T.window:Create('ImageLabel',{Image=T.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,ZIndex=5,Parent=T.container},{ImageColor3='ContentColor'})end T.title=T.
window:Create('TextLabel',{Text=l.t(T.name),Size=UDim2.fromOffset(150,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,ZIndex=5,Parent=T.container},{TextColor3='ContentColor',FontFace='Font'})T.selectedLabel=T.window:
Create('TextLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-41,0.5,0),Size=UDim2.fromOffset(168,15),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=15,TextXAlignment=Enum.TextXAlignment.Right,TextWrapped=true,
TextTransparency=1,ZIndex=5,Parent=T.top},{TextColor3='ContentColor',FontFace='Font'})T.chevron=T.window:Create(
'ImageLabel',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-18,0.5,0),Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,Image='rbxassetid://'..tostring(p),Rotation=180,ImageTransparency=1,ZIndex=5,
Parent=T.top},{ImageColor3='ContentColor'})T.interact=T.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.
new(1,0,0,41),Position=UDim2.fromScale(0,0),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=10,AutoButtonColor=false
,Parent=T.main})T.panel=T.window:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.new(1,0,1,0),Size=UDim2.
new(1,0,1,-(A+B)),BorderSizePixel=0,ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),ZIndex=1,
BackgroundTransparency=1,Parent=T.main})T.panelStroke=T.window:StyleElementPanel(T.panel)T.window:Create('UIListLayout',
{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,
HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=T.panel})T.window:
Create('UIPadding',{PaddingTop=UDim.new(0,C),PaddingBottom=UDim.new(0,D),Parent=T.panel})T:_buildSearch()T:
_buildActions()T.list=T.window:Create('ScrollingFrame',{Active=true,Size=UDim2.new(1,0,0,0),BorderSizePixel=0,
BackgroundTransparency=1,ClipsDescendants=true,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(),
ScrollBarImageColor3=Color3.fromRGB(240,240,240),ScrollBarThickness=3,ScrollBarImageTransparency=1,ScrollingDirection=
Enum.ScrollingDirection.Y,LayoutOrder=3,ZIndex=1,Parent=T.panel})T.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=T.list})T.window:ConnectFor(T,T.list:GetPropertyChangedSignal'CanvasPosition',function()T:_syncScrollHint()
end)T.window:ConnectFor(T,T.list:GetPropertyChangedSignal'AbsoluteCanvasSize',function()T:_syncScrollHint()end)T.window:
ConnectFor(T,T.list:GetPropertyChangedSignal'AbsoluteWindowSize',function()T:_syncScrollHint()end)T.listLayout=T.window:
Create('UIListLayout',{Padding=UDim.new(0,5),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Center,Parent=T.list})T.window:Create('UIPadding',{PaddingTop=UDim.new(0,z),PaddingBottom=UDim.new(0
,z),Parent=T.list})T.emptyLabel=T.window:Create('TextLabel',{Name='Empty',Size=UDim2.new(1,-12,0,x),
BackgroundTransparency=1,Text=l.t'No matches',TextSize=14,TextTransparency=0.55,Visible=false,LayoutOrder=1,Parent=T.
list},{TextColor3='ContentColor',FontFace='Font'})local function U(V)return table.find(T.value,V)~=nil end
local function V(W,X)local Y=U(W.name)local Z,_,aa,ab=if T._isOpen then(Y and 0.9 or 0.95)else 1,if T._isOpen then(Y and
0 or 0.3)else 1,if T._isOpen then(Y and 0 or 0.7)else 1,if T._isOpen then(Y and 0.85 or 0.93)else 1 j.assign(W.checkIcon
,'Image',if Y then q else r)if X then local ac=TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)h
.tweenService:Create(W.frame,ac,{BackgroundTransparency=Z}):Play()h.tweenService:Create(W.title,ac,{TextTransparency=_})
:Play()h.tweenService:Create(W.checkIcon,ac,{ImageTransparency=aa}):Play()h.tweenService:Create(W.stroke,ac,{
Transparency=ab}):Play()else W.frame.BackgroundTransparency=Z W.title.TextTransparency=_ W.checkIcon.ImageTransparency=
aa W.stroke.Transparency=ab end end local function aa()if T.multiSelect then local ab=#T.value if ab==0 then T.
selectedLabel.Text=T.placeholderText elseif ab==1 then T.selectedLabel.Text=T.value[1]else T.selectedLabel.Text=l.
resolve'Various'end else T.selectedLabel.Text=T.value[1]or T.placeholderText end end T._renderOptionState=V T.
_updateSelectedLabel=aa local function ab(ac)local W=T.window:Create('Frame',{Size=UDim2.new(1,-12,0,x),BorderSizePixel=
0,LayoutOrder=#T._optionFrames+1,BackgroundTransparency=1,Parent=T.list},{BackgroundColor3='DropdownHighlight'})local X,
Y,Z,_=T.window:Create('UICorner',{CornerRadius=u,Parent=W}),T.window:Create('UIStroke',{Color=Color3.fromRGB(255,255,255
),Transparency=1,Parent=W}),T.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',
TextTransparency=1,ZIndex=50,Parent=W}),T.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,14,
0.5,0),Size=UDim2.fromOffset(170,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,Parent=W})T.window:Create(
'UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=_})local ad,ae=T.window:Create('ImageLabel',{Image=
'rbxassetid://'..tostring(q),Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1
,ZIndex=5,Parent=_},{ImageColor3='ContentColor'}),T.window:Create('TextLabel',{Text=ac,Size=UDim2.fromOffset(170,16),
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,ZIndex=5,Parent=_},{TextColor3='ContentColor',FontFace='Font'})local af={name=ac,frame=
W,interact=Z,title=ae,checkIcon=ad,container=_,stroke=Y,corner=X,connections={}}table.insert(af.connections,T.window:
ConnectFor(T,W.MouseEnter,function()if not T._isOpen or not T.window:_interactive()then return end if U(af.name)then
return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
BackgroundTransparency=0.9}):Play()h.tweenService:Create(ae,TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{TextTransparency=0.15}):Play()end))table.insert(af.connections,T.window:ConnectFor(T,W.MouseLeave,
function()if not T._isOpen then return end if U(af.name)then return end h.tweenService:Create(W,TweenInfo.new(0.2,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=0.95}):Play()h.tweenService:Create(ae,TweenInfo.new(
0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{TextTransparency=0.3}):Play()end))table.insert(af.connections,T.
window:ConnectFor(T,Z.MouseButton1Click,function()if not T._isOpen then return end m.click()local ag=U(af.name)if not T.
multiSelect then if ag then T:_close()return end table.clear(T.value)table.insert(T.value,af.name)else if ag then local
ah=table.find(T.value,af.name)if ah then table.remove(T.value,ah)end else table.insert(T.value,af.name)end end T.
_desiredValue=table.clone(T.value)for ah,ai in T._optionFrames do V(ai,true)end aa()T.window:_runGuarded(T,T.callback,T:
_callbackValue())T.window:_persist(T)if not T.multiSelect then task.wait(0.1)T:_close()end end))return af end T.
_buildOption=ab for ac,ad in T.options do local ae=ab(ad)table.insert(T._optionFrames,ae)end aa()T:_updateCorners()T.
window:ConnectFor(T,T.interact.MouseButton1Click,function()m.click()if T._isOpen then T:_close()else T:_open()end end)T.
window:ConnectFor(T,T.main.MouseEnter,function()if T._isOpen or not T.window:_interactive()then return end h.
tweenService:Create(T.title,I,{TextColor3=T.window.theme.ElementTextHoverColor}):Play()h.tweenService:Create(T.
hoverOverlay,I,{BackgroundTransparency=0.97}):Play()h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.
ElementStrokeHoverTransparency,Color=T.window.theme.ElementStrokeHover}):Play()end)T.window:ConnectFor(T,T.main.
MouseLeave,function()h.tweenService:Create(T.title,I,{TextColor3=T.window.theme.ContentColor}):Play()h.tweenService:
Create(T.hoverOverlay,I,{BackgroundTransparency=1}):Play()h.tweenService:Create(T.stroke,I,{Transparency=T.window.theme.
ElementStrokeTransparency,Color=T.window.theme.ElementStroke}):Play()end)if T.description then T.descriptor=d(c.Parent.
descriptor).new(T.tab,{description=T.description})end return T end function f._callbackValue(aa)if aa.multiSelect then
return table.clone(aa.value)end return aa.value[1]end function f._buildSearch(aa)aa._searchOpen=false aa.searchbar=aa.
window:Create('Frame',{Name='Search',Size=UDim2.new(1,-12,0,v),BorderSizePixel=0,BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,LayoutOrder=1,ClipsDescendants=false,ZIndex=1,Parent=aa.panel})aa.window:Create(
'UICorner',{CornerRadius=UDim.new(0,12),Parent=aa.searchbar})aa.searchStroke=aa.window:Create('UIStroke',{Color=Color3.
fromRGB(255,255,255),Transparency=1,Parent=aa.searchbar})aa.searchShadow=aa.window:CreateGlow(aa.searchbar,Color3.
fromRGB(255,255,255),20,1)aa.searchToggle=aa.window:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1
,1),Text='',TextTransparency=1,ZIndex=51,Parent=aa.searchbar})aa.searchInput=aa.window:Create('TextBox',{Text='',
PlaceholderText=l.t'Search...',Size=UDim2.new(1,-58,0,16),Position=UDim2.new(0,44,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,TextEditable=false,
Interactable=false,ZIndex=52,TextTransparency=1,Parent=aa.searchbar},{TextColor3='ContentColor',FontFace='Font',
PlaceholderColor3='PlaceholderColor'})aa.searchIcon=aa.window:Create('ImageButton',{Image='rbxassetid://'..tostring(s),
Size=UDim2.fromOffset(20,20),Position=UDim2.new(0,24,0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,
ScaleType=Enum.ScaleType.Fit,AutoButtonColor=false,ZIndex=53,ImageTransparency=1,Parent=aa.searchbar},{ImageColor3=
'ContentColor'})aa.window:ConnectFor(aa,aa.searchToggle.MouseButton1Click,function()if not aa._searchOpen then aa:
_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchIcon.MouseButton1Click,function()if aa._searchOpen then aa:
_collapseSearch()else aa:_expandSearch()end end)aa.window:ConnectFor(aa,aa.searchInput:GetPropertyChangedSignal'Text',
function()aa:_applyFilter(aa.searchInput.Text)end)aa.window:ConnectFor(aa,aa.searchInput.FocusLost,function()if aa.
searchInput.Text==''then aa:_collapseSearch()end end)end function f._expandSearch(aa)if aa._searchOpen then return end
aa._searchOpen=true aa.searchInput.TextEditable=true aa.searchInput.Interactable=true h.tweenService:Create(aa.searchbar
,K,{Size=UDim2.new(1,-12,0,w),BackgroundTransparency=0.92}):Play()h.tweenService:Create(aa.searchStroke,K,{Transparency=
0.86}):Play()h.tweenService:Create(aa.searchShadow,K,{Transparency=0.92}):Play()h.tweenService:Create(aa.searchInput,K,{
TextTransparency=0.3}):Play()aa:_resizeToOptions()aa.searchInput:CaptureFocus()end function f._collapseSearch(aa)if not
aa._searchOpen then return end aa._searchOpen=false aa.searchInput.TextEditable=false aa.searchInput.Interactable=false
aa.searchInput:ReleaseFocus()aa.searchInput.Text=''h.tweenService:Create(aa.searchbar,K,{Size=UDim2.new(1,-12,0,v),
BackgroundTransparency=1}):Play()h.tweenService:Create(aa.searchStroke,K,{Transparency=1}):Play()h.tweenService:Create(
aa.searchShadow,K,{Transparency=1}):Play()h.tweenService:Create(aa.searchInput,K,{TextTransparency=1}):Play()aa:
_resizeToOptions()end function f._applyFilter(aa,ab)ab=string.lower(ab or'')local ac=0 for ad,ae in aa._optionFrames do
local af=ab==''or string.find(string.lower(ae.name),ab,1,true)~=nil ae.frame.Visible=af if af then ac+=1 end end aa.
emptyLabel.Visible=ac==0 and ab~=''aa:_updateCorners()aa:_resizeToOptions()aa:_syncScrollHint()end function f.
_syncScrollHint(aa)local ab,ac,ad=aa.list.AbsoluteCanvasSize,aa.list.AbsoluteWindowSize,aa.list.CanvasPosition if not ab
or not ac or not ad then return end local ae=aa._isOpen and ac.Y>0 and ab.Y-(ad.Y+ac.Y)>1 h.tweenService:Create(aa.list,
H,{ScrollBarImageTransparency=if ae then J else 1}):Play()end function f._visibleOptions(aa):{string}local ab={}for ac,
ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad.name)end end return ab end function f.
_buildActions(aa)if not aa.multiSelect then return end aa.actions=aa.window:Create('Frame',{Name='Actions',Size=UDim2.
new(1,-12,0,G),BackgroundTransparency=1,LayoutOrder=2,Parent=aa.panel})aa.window:Create('UIListLayout',{Padding=UDim.
new(0,12),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=aa.actions})local function ab(ac:string,ad:number,ae:()->())local af=aa.window:Create(
'TextButton',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,G),BackgroundTransparency=1,Text=l.t(ac),
TextSize=13,TextTransparency=0.45,LayoutOrder=ad,Parent=aa.actions},{TextColor3='ContentColor',FontFace='Font'})aa.
window:ConnectFor(aa,af.MouseEnter,function()h.tweenService:Create(af,H,{TextTransparency=0.15}):Play()end)aa.window:
ConnectFor(aa,af.MouseLeave,function()h.tweenService:Create(af,H,{TextTransparency=0.45}):Play()end)aa.window:
ConnectFor(aa,af.MouseButton1Click,function()ae()aa:_afterBulkChange()end)return af end ab('Select all',1,function()
local ac=aa:_visibleOptions()for ad,ae in ac do if not table.find(aa.value,ae)then table.insert(aa.value,ae)end end end)
ab('Clear',2,function()local ac=aa:_visibleOptions()for ad=#aa.value,1,-1 do if table.find(ac,aa.value[ad])then table.
remove(aa.value,ad)end end end)end function f._afterBulkChange(aa)aa._desiredValue=table.clone(aa.value)for ab,ac in aa.
_optionFrames do aa._renderOptionState(ac,true)end aa:_updateSelectedLabel()aa:_updateCorners()aa.window:_runGuarded(aa,
aa.callback,aa:_callbackValue())aa.window:_persist(aa)m.click()end function f._resizeToOptions(aa)if not aa._isOpen then
return end h.tweenService:Create(aa.main,K,{Size=UDim2.new(1,-20,0,aa:_openHeight())}):Play()end function f.
_updateCorners(aa)local ab={}for ac,ad in aa._optionFrames do if ad.frame.Visible then table.insert(ab,ad)end end for ac
,ad in ab do local ae,af=if ac==1 then t else u,if ac==#ab then t else u ad.corner.TopLeftRadius=ae ad.corner.
TopRightRadius=ae ad.corner.BottomLeftRadius=af ad.corner.BottomRightRadius=af end end local function aa(ab:number):
number return ab*x+math.max(0,ab-1)*y+z*2 end local function ab(ac:number):number return math.max(math.floor((ac-z*2+y)/
(x+y)),1)end function f._pageHeight(ac):number local ad=ac.window.size return n.pageHeight(ad and ad.Y.Offset,ac.window.
layout.mode)end function f._openHeight(ac)local ad=0 for ae,af in ac._optionFrames do if af.frame.Visible then ad+=1 end
end local ae=if ac._searchOpen then w else v local af,ag=A+B+E+ae+y+(if ac.actions then G+y else 0),ac:_pageHeight()
local ah=math.min(math.max(ad,1),F,ab(ag-af))return math.min(af+aa(ah),ag)end function f._open(ac)if ac._isOpen then
return end ac._isOpen=true if ac._outsideClickConn then ac.window:Disconnect(ac._outsideClickConn)end ac.
_outsideClickConn=ac.window:Connect(h.userInputService.InputBegan,function(ad)if ad.UserInputType~=Enum.UserInputType.
MouseButton1 and ad.UserInputType~=Enum.UserInputType.Touch then return end local ae,af,ag=ad.Position,ac.main.
AbsolutePosition,ac.main.AbsoluteSize if ae.X<af.X or ae.X>af.X+ag.X or ae.Y<af.Y or ae.Y>af.Y+ag.Y then ac:_close()end
end)h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.
new(1,-20,0,ac:_openHeight())}):Play()h.tweenService:Create(ac.chevron,TweenInfo.new(0.7,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),{Rotation=0}):Play()h.tweenService:Create(ac.panel,TweenInfo.new(0.4,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out),{BackgroundTransparency=ac.window.theme.ElementTransparency or 0}):Play()h.tweenService:
Create(ac.panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=ac.window.theme.
ElementStrokeTransparency}):Play()h.tweenService:Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{ImageTransparency=0.5}):Play()for ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end
ac:_syncScrollHint()ac:_bringIntoView()end function f._bringIntoView(ac)local ad=ac.tab and ac.tab.tabPage if not ad
then return end local ae,af,ag,ah=ad.AbsoluteWindowSize,ad.CanvasPosition,ad.AbsolutePosition,ac.main.AbsolutePosition
if not ae or not af or not ag or not ah or ae.Y<=0 then return end local ai=ah.Y-ag.Y+af.Y local P=ai+ac:_openHeight()
local Q=P-(af.Y+ae.Y)if Q<=0 then return end local R=math.min(af.Y+Q+8,ai)h.tweenService:Create(ad,TweenInfo.new(0.4,
Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{CanvasPosition=Vector2.new(af.X,R)}):Play()end function f._close(ac)if
not ac._isOpen then return end ac._isOpen=false if ac._outsideClickConn then ac.window:Disconnect(ac._outsideClickConn)
ac._outsideClickConn=nil end ac:_collapseSearch()ac:_syncScrollHint()h.tweenService:Create(ac.chevron,TweenInfo.new(0.7,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Rotation=180}):Play()h.tweenService:Create(ac.panel,TweenInfo.
new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{BackgroundTransparency=1}):Play()h.tweenService:Create(ac.
panelStroke,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=1}):Play()h.tweenService:
Create(ac.searchIcon,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=1}):Play()for
ad,ae in ac._optionFrames do ac._renderOptionState(ae,true)end h.tweenService:Create(ac.main,TweenInfo.new(0.5,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()end function f._destroyOption(ac,
ad)if ad.connections then for ae,af in ad.connections do local ag=table.find(ac.connections,af)if ag then table.remove(
ac.connections,ag)end ac.window:Disconnect(af)end ad.connections=nil end ac.window:DestroySubtree(ad.frame)end function
f._deriveSelection(ac)local ad=ac.value ac.value=N(ac._desiredValue or ac.value,ac.options)return not O(ac.value,ad)end
function f._reindexOptions(ac)for ad,ae in ac._optionFrames do ae.frame.LayoutOrder=ad end end function f._rebindOption(
ac,ad,ae,af)ad.name=ae ad.title.Text=ae ad.frame.LayoutOrder=af end function f._destroyOptionsFrom(ac,ad)local ae,af={},
{}for ag=#ac._optionFrames,ad,-1 do local ah=ac._optionFrames[ag]table.insert(ae,ah.frame)if ah.connections then table.
move(ah.connections,1,#ah.connections,#af+1,af)ah.connections=nil end ac._optionFrames[ag]=nil end ac.window:
DisconnectMany(ac,af)ac.window:DestroySubtrees(ae)end function f.Refresh(ac,ad)ac.options=L(ad or{})local ae,af,ag=ac:
_deriveSelection(),#ac._optionFrames,#ac.options for ah=1,math.min(af,ag)do ac:_rebindOption(ac._optionFrames[ah],ac.
options[ah],ah)end for ah=af+1,ag do local ai=ac._buildOption(ac.options[ah])ai.frame.LayoutOrder=ah table.insert(ac.
_optionFrames,ai)end if ag<af then ac:_destroyOptionsFrom(ag+1)end for ah,ai in ac._optionFrames do ac.
_renderOptionState(ai,false)end ac._updateSelectedLabel()ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else
'')if ae then ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end function f.Add(ac,
ad)if typeof(ad)~='string'or ad==''then return end if table.find(ac.options,ad)then return end table.insert(ac.options,
ad)local ae=ac._buildOption(ad)table.insert(ac._optionFrames,ae)local af=ac:_deriveSelection()if ac._isOpen then ac.
_renderOptionState(ae,true)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else'')if af then ac.
_updateSelectedLabel()ac.window:_runGuarded(ac,ac.callback,ac:_callbackValue())ac.window:_persist(ac)end end function f.
Remove(ac,ad)local ae=table.find(ac.options,ad)if not ae then return end table.remove(ac.options,ae)for af,ag in ac.
_optionFrames do if ag.name==ad then ac:_destroyOption(ag)table.remove(ac._optionFrames,af)ac:_reindexOptions()break end
end if ac._desiredValue then local af=table.find(ac._desiredValue,ad)if af then table.remove(ac._desiredValue,af)end end
local af=table.find(ac.value,ad)if af then table.remove(ac.value,af)ac._updateSelectedLabel()ac.window:_runGuarded(ac,ac
.callback,ac:_callbackValue())ac.window:_persist(ac)end ac:_applyFilter(if ac._searchOpen then ac.searchInput.Text else
'')end function f.Set(ac,ad,ae)local af=M(ad,ac.multiSelect)ac._desiredValue=af ac.value=N(af,ac.options)for ag,ah in ac
._optionFrames do ac._renderOptionState(ah,true)end ac._updateSelectedLabel()if not ae then ac.window:_runGuarded(ac,ac.
callback,ac:_callbackValue())ac.window:_persist(ac)end end function f._setShown(ac,ad,ae)local af=ac.window af:_reveal(
ac.stroke,{Transparency=if ad then af.theme.ElementStrokeTransparency else 1},ae)af:_reveal(ac.title,{TextTransparency=
if ad then 0 else 1},ae)af:_reveal(ac.top,{BackgroundTransparency=if ad then(af.theme.ElementTransparency or 0)else 1},
ae)if ac.iconLabel then af:_reveal(ac.iconLabel,{ImageTransparency=if ad then 0 else 1},ae)end if ac.descriptor then af:
_reveal(ac.descriptor.titleLabel,{TextTransparency=if ad then 0.7 else 1},ae)end af:_reveal(ac.selectedLabel,{
TextTransparency=if ad then 0.5 else 1},ae)af:_reveal(ac.chevron,{ImageTransparency=if ad then 0.5 else 1},ae)if not ad
and ac._isOpen then ac:_close()end end function f.MoveTo(ac,ad)ac.tab:_moveElement(ac,ad)end function f.MoveToTop(ac)ac.
tab:_moveElement(ac,1)end function f.MoveToBottom(ac)ac.tab:_moveElement(ac,#ac.tab.elements)end function f.MoveUp(ac)
local ad=table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad-1)end end function f.MoveDown(ac)local ad=
table.find(ac.tab.elements,ac)if ad then ac.tab:_moveElement(ac,ad+1)end end o(f)return f end)()end,[12]=function()local
aa,ab,ac=a(12)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Group'local af,ag,ah,ai,b=ac(ab.Parent.
Parent.utility.moveable),ac(ab.Parent.Parent.utility.log),ac(ab.Parent.Parent.utility.ordering),8,{button=true,toggle=
true,stat=true,slider=true}function ae.new(c,d)d=if typeof(d)=='table'then d else{}local e=string.lower(d.direction or d
.Direction or'row')local f=e=='column'or e=='vertical'local g=not f local h=if g then Enum.FillDirection.Horizontal else
Enum.FillDirection.Vertical local i,j=setmetatable({tab=assert(c,'Missing argument #1 (Tab expected)'),window=c.window,
direction=h,compact=g,forgetState=c.forgetState,elements={}},ae),c.direction==Enum.FillDirection.Horizontal i.main=i.
window:Create('Frame',{Name='Group',BackgroundTransparency=1,BorderSizePixel=0,AutomaticSize=Enum.AutomaticSize.Y,Size=
if g then UDim2.new(1,-20,0,0)else UDim2.new(1,0,0,0),Parent=i.tab.tabPage})if j then i.main.Size=UDim2.new(0,0,0,0)i.
window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,Parent=i.main})end i.tabPage=i.main i.layout=i.window:Create(
'UIListLayout',{FillDirection=h,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,ai),VerticalAlignment=if g then
Enum.VerticalAlignment.Center else Enum.VerticalAlignment.Top,HorizontalAlignment=if g then Enum.HorizontalAlignment.
Left else Enum.HorizontalAlignment.Center,Parent=i.main})return i end function ae._add(c,d,e)if c.compact and not b[d]
then ag.warn(`Rayfield: a row only holds compact elements (button/toggle/stat/slider), ignoring '{d}'. Use a column for it.`
)return nil end local f=ac(ab.Parent[d]).new(c,e)table.insert(c.elements,f)ah(f,#c.elements*10)c.window:_restoreLate(f)
if c.compact then c:_wrapChild(f)end c:_reflowRow()if not c.window.hidden then f:_setShown(true,true)end return f end
function ae._reflowRow(c)if c.direction~=Enum.FillDirection.Horizontal then return end local d=#c.elements>0 for e,f in
c.elements do if f.__type~='Group'then d=false break end end c.layout.Padding=if d then UDim.new(0,-10)else UDim.new(0,
ai)end function ae._wrapChild(c,d)c.layout.Wraps=true c.layout.HorizontalFlex=Enum.UIFlexAlignment.Fill d._widthManaged=
true local e=if d._minWidth then d:_minWidth()else 0 if e>0 then d.main.AutomaticSize=Enum.AutomaticSize.None d.main.
Size=UDim2.new(0,e,d.main.Size.Y.Scale,d.main.Size.Y.Offset)end end function ae.CreateButton(c,d)return c:_add('button',
d)end function ae.CreateToggle(c,d)return c:_add('toggle',d)end function ae.CreateSwitch(c,d)return c:_add('toggle',d)
end function ae.CreateStat(c,d)return c:_add('stat',d)end function ae.CreateSlider(c,d)return c:_add('slider',d)end
function ae.CreateDropdown(c,d)return c:_add('dropdown',d)end function ae.CreateSection(c,d)return c:_add('section',d)
end function ae.CreateText(c,d)return c:_add('text',d)end function ae.CreateDivider(c,d)return c:_add('divider',d)end
function ae._addGroup(c,d)d=if typeof(d)=='table'then table.clone(d)else{}if c.direction==Enum.FillDirection.Horizontal
then c.layout.VerticalAlignment=Enum.VerticalAlignment.Top if c.tab.direction~=Enum.FillDirection.Horizontal then c.main
.Size=UDim2.new(1,0,0,0)end end local e=ae.new(c,d)table.insert(c.elements,e)e.main.LayoutOrder=#c.elements*10 c:
_reflowRow()return e end function ae.CreateGroup(c,d)return c:_addGroup(d)end function ae._moveElement(c,d,e)local f=
table.find(c.elements,d)if not f then return end table.remove(c.elements,f)e=math.clamp(e,1,#c.elements+1)table.insert(c
.elements,e,d)for g,h in c.elements do ah(h,g*10)end end function ae._setShown(c,d,e)for f,g in c.elements do g:
_setShown(d,e)end end function ae._refreshTheme(c)for d,e in c.elements do if e._refreshTheme then e:_refreshTheme()end
end end af(ae)return ae end)()end,[13]=function()local aa,ab,ac=a(13)local ad return(function(...)local ae={}ae.__index=
ae ae.__type='Input'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e=ac(af.variables),ac(af.functions),ac(af.
moveable),ac(af.lockable),ac(af.locale),ac(af.constants),ac(af.HapticEngine)local f,g=d.pillResizeInfo,TweenInfo.new(
0.15,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)local function h(i)local j,k=i:match'^([%d%.%-]+)%^([%d%.%-]+)$'if
j and k then local l,m=tonumber(j),tonumber(k)if l and m then return l^m end end return tonumber(i)end function ae.new(i
,j)j=if typeof(j)=='table'then j else{}local k=setmetatable({tab=assert(i,'Missing argument #1 (Tab expected)'),window=i
.window,name=j.name or j.Name or'Input',icon=j.icon or j.Icon,description=j.description or j.Description,forgetState=j.
forgetState or j.ForgetState or i.forgetState,placeholder=j.placeholder or j.Placeholder or'',numeric=j.numeric or j.
Numeric or false,clearOnFocus=j.clearOnFocus or j.ClearOnFocus or false,callback=j.callback or j.Callback or function()
end},ae)k.value=tostring(j.value or j.Value or j.currentValue or j.CurrentValue or'')k.flag=j.flag or j.Flag or(not k.
forgetState and ah.deriveFlagFromName(k.name)or nil)k.window:_registerControl(k)k.main=k.window:Create('Frame',{Size=
UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=k.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=
1,Parent=k.tab.tabPage},{BackgroundTransparency='ElementTransparency'})k.stroke=k.window:StyleElementBody(k.main)k.
hoverOverlay=k.window:CreateHoverOverlay(k.main)k.container=k.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position
=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=k.main}
)k.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,Parent=k.container})if k.icon then k.iconLabel=k.window:Create('ImageLabel',{Image=k.icon,
Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=k.container}
,{ImageColor3='ContentColor'})end k.title=k.window:Create('TextLabel',{Text=c.t(k.name),Size=UDim2.fromOffset(150,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=k.container},{TextColor3='ContentColor',FontFace=
'Font'})k.box=k.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.
fromOffset(85,30),BorderSizePixel=0,BackgroundTransparency=1,Parent=k.main},{BackgroundColor3='FieldBackground'})k.
window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=k.box})k.boxStroke=k.window:Create('UIStroke',{Transparency=
1,Parent=k.box},{Color='SurfaceStroke'})k.glow=k.window:CreateGlow(k.box,'FieldGlow',20,1)k._glowIdle=1 k.input=k.window
:Create('TextBox',{Text=k.value,PlaceholderText=c.t(k.placeholder),Size=UDim2.new(1,-15,0,15),Position=UDim2.new(0.5,0,
0.5,0),AnchorPoint=Vector2.new(0.5,0.5),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,TextXAlignment=Enum.
TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,ClearTextOnFocus=k.clearOnFocus,TextTransparency=1,Parent=k.
box},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})k.window:ConnectFor(k,k.input:
GetPropertyChangedSignal'Text',function()if k.numeric then local l=(k.input.Text:gsub('[^%d%.%-eE%^]',''))if l~=k.input.
Text then k.input.Text=l return end end k:_sizeBox(true)end)k.window:ConnectFor(k,k.input.Focused,function()ag.
tweenService:Create(k.input,g,{TextTransparency=0}):Play()end)k.window:ConnectFor(k,k.input.FocusLost,function()ag.
tweenService:Create(k.input,g,{TextTransparency=0.6}):Play()if k.clearOnFocus and k.input.Text==''and k.value~=''then k.
input.Text=k.value return end if k.input.Text==k.value then return end k:_commit(k.input.Text)end)k.window:
_wireElementHover(k)if k.description then k.descriptor=ac(ab.Parent.descriptor).new(k.tab,{description=k.description})
end k:_sizeBox(false)return k end function ae._sizeBox(i,j)local k=i.input.Text~=''and i.input.Text or i.placeholder
local l=math.clamp(ah.textWidth(i.window.theme.Font,15,k)+30,70,220)if j then ag.tweenService:Create(i.box,f,{Size=UDim2
.fromOffset(l,30)}):Play()else i.box.Size=UDim2.fromOffset(l,30)end end function ae._commit(i,j,k)j=tostring(j)if i.
numeric then local l=h(j)if not l or l~=l or l==math.huge or l==-math.huge then if i.input.Text~=i.value then i.input.
Text=i.value end return end j=tostring(l)end local l=j~=i.value i.value=j if i.input.Text~=j then i.input.Text=j end if
not k then i.window:_runGuarded(i,i.callback,j)i.window:_persist(i)if l and not i.window._loading then e.click()i.window
:_flashResult(i,true)end end end function ae.Set(i,j,k)i:_commit(j,k)end function ae._setShown(i,j,k)local l=i.window if
j then l:_revealCommon(i,k)l:_reveal(i.box,{BackgroundTransparency=l.theme.FieldTransparency},k)l:_reveal(i.boxStroke,{
Transparency=0.85},k)l:_reveal(i.input,{TextTransparency=0.6},k)else l:_hideCommon(i,k)l:_reveal(i.box,{
BackgroundTransparency=1},k)l:_reveal(i.boxStroke,{Transparency=1},k)l:_reveal(i.input,{TextTransparency=1},k)end end
function ae._refreshTheme(i)ag.tweenService:Create(i.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=i.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[14]=function()
local aa,ab,ac=a(14)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Keybind'local af=ab.Parent.Parent.
utility local ag,ah,ai,b,c,d,e,f,g=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af
.constants),ac(af.HapticEngine),ac(af.enums),ac(af.log)local h,i,j=d.pillResizeInfo,TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out),{[Enum.UserInputType.MouseButton1]='MB1',[Enum.UserInputType.MouseButton2]='MB2',[Enum.
UserInputType.MouseButton3]='MB3'}local function k(l)if typeof(l)~='EnumItem'or l==Enum.KeyCode.Unknown then return
'None'end return j[l]or l.Name end local function l(m)if typeof(m)=='EnumItem'then return m end if type(m)=='string'then
local n,o=pcall(function()return Enum.KeyCode[m]end)if n and o then return o end local p,q=pcall(function()return Enum.
UserInputType[m]end)if p and q and j[q]then return q end end return Enum.KeyCode.Unknown end function ae.new(m,n)n=if
typeof(n)=='table'then n else{}local o=setmetatable({tab=assert(m,'Missing argument #1 (Tab expected)'),window=m.window,
name=n.name or n.Name or'Keybind',icon=n.icon or n.Icon,description=n.description or n.Description,forgetState=n.
forgetState or n.ForgetState or m.forgetState,isMenuToggle=n.isMenuToggle or n.IsMenuToggle or false,callback=n.callback
or n.Callback or function()end,onChanged=n.onChanged or n.OnChanged or function()end,hold=n.hold or n.Hold or false,
holdThreshold=n.holdThreshold or n.HoldThreshold or 0.2,recording=false},ae)o.value=l(n.value or n.Value or n.default or
n.Default)o.flag=n.flag or n.Flag or(not o.forgetState and ah.deriveFlagFromName(o.name)or nil)o.window:
_registerControl(o)o.main=o.window:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,Name=o.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=o.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})o.stroke=o.window:StyleElementBody(o.main)o.hoverOverlay=o.window:CreateHoverOverlay(o.main)o.
container=o.window:Create('Frame',{Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,20,0.5,0),AnchorPoint=Vector2.new(0,
0.5),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,Parent=o.main})o.window:Create('UIListLayout',{Padding=UDim.
new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,Parent=o.container}
)if o.icon then o.iconLabel=o.window:Create('ImageLabel',{Image=o.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=o.container},{ImageColor3='ContentColor'})end o.title=o.
window:Create('TextLabel',{Text=c.t(o.name),Size=UDim2.fromOffset(150,16),AutomaticSize=Enum.AutomaticSize.X,
BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=5,
TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='Font'})o.box=o.window:Create('TextButton',{
AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-7,0,20),Size=UDim2.fromOffset(40,30),AutoButtonColor=false,Text='',
BorderSizePixel=0,BackgroundTransparency=1,Parent=o.main},{BackgroundColor3='FieldBackground'})o.window:Create(
'UICorner',{CornerRadius=UDim.new(1,0),Parent=o.box})o.boxStroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.box
},{Color='SurfaceStroke'})o.glow=o.window:CreateGlow(o.box,'FieldGlow',20,1)o._glowIdle=0.9 o.keyLabel=o.window:Create(
'TextLabel',{Text=k(o.value),Size=UDim2.fromScale(1,1),BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Center,ZIndex=2,TextTransparency=1,Parent=o.box},{TextColor3='ContentColor',FontFace=
'Font'})o.window:ConnectFor(o,o.box.MouseButton1Click,function()e.click()if o.recording then o:_stopRecording()else o:
_startRecording()end end)o.window:ConnectFor(o,ag.userInputService.InputBegan,function(p,q)if q then return end if o.
recording then o:_capture(p)return end if o.window._recordingKeybind then return end if o:_matches(p)then if o.hold then
o:_beginHold(p)else o.window:_runGuarded(o,o.callback,o.value)end end end)o.window:_wireElementHover(o)if o.description
then o.descriptor=ac(ab.Parent.descriptor).new(o.tab,{description=o.description})end o:_sizeBox(false)return o end
function ae._sizeBox(m,n)local o=math.clamp(ah.textWidth(m.window.theme.Font,15,m.keyLabel.Text)+28,40,200)if n then ag.
tweenService:Create(m.box,h,{Size=UDim2.fromOffset(o,30)}):Play()else m.box.Size=UDim2.fromOffset(o,30)end end function
ae._startRecording(m)local n=m.window._recordingKeybind if n and n~=m then n:_stopRecording()end m.recording=true m.
window._recordingKeybind=m m.keyLabel.Text=c.resolve'Recording'm:_sizeBox(true)ag.tweenService:Create(m.glow,i,{
Transparency=0.7}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0}):Play()end function ae._stopRecording(
m)m.recording=false if m.window._recordingKeybind==m then local n=m.window task.defer(function()if n._recordingKeybind==
m then n._recordingKeybind=nil end end)end m.keyLabel.Text=k(m.value)m:_sizeBox(true)ag.tweenService:Create(m.glow,i,{
Transparency=0.9}):Play()ag.tweenService:Create(m.keyLabel,i,{TextTransparency=0.6}):Play()end function ae._capture(m,n)
local o if n.UserInputType==Enum.UserInputType.Keyboard then if n.KeyCode==Enum.KeyCode.Escape then m:_stopRecording()
return end if n.KeyCode==Enum.KeyCode.Backspace then m:_bind(Enum.KeyCode.Unknown)return end o=n.KeyCode elseif n.
UserInputType==Enum.UserInputType.MouseButton2 or n.UserInputType==Enum.UserInputType.MouseButton3 then o=n.
UserInputType end if not o then return end if m.isMenuToggle then local p=m.window:_keybindUsing(o,m)if p then m.window:
Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is bound to %s. Kept %s.',k(o),p.name,k(m
.value))}m:_stopRecording()m.window:_flashResult(m,false)return end elseif o==m.window.settings.toggleKeybind then m.
window:Notify{title=c.resolve'Keybind unavailable',content=string.format(c.resolve'%s is the menu toggle key. Kept %s.',
k(o),k(m.value))}m:_stopRecording()m.window:_flashResult(m,false)return end m:_bind(o)end function ae._bind(m,n)m.value=
n m:_stopRecording()m.window:_runGuarded(m,m.onChanged,n)m.window:_persist(m)m.window:_flashResult(m,true)end function
ae._matches(m,n)local o=m.value if typeof(o)~='EnumItem'or o==Enum.KeyCode.Unknown then return false end if o.EnumType==
Enum.KeyCode then return n.KeyCode==o elseif o.EnumType==Enum.UserInputType then return n.UserInputType==o end return
false end function ae._beginHold(m,n)if m._holding or m._holdPress then return end local o={}m._holdPress=o local p,q=n.
KeyCode,n.UserInputType task.delay(m.holdThreshold,function()if m._holdPress~=o then return end m._holding=true m.window
:_runGuarded(m,m.callback,true)end)local r r=m.window:ConnectFor(m,ag.userInputService.InputEnded,function(s)local t=if
p~=Enum.KeyCode.Unknown then s.KeyCode==p else s.UserInputType==q if not t then return end if m.connections then local u
=table.find(m.connections,r)if u then table.remove(m.connections,u)end end m.window:Disconnect(r)if m._holdPress==o then
m._holdPress=nil end if m._holding then m._holding=false m.window:_runGuarded(m,m.callback,false)end end)end function ae
.Set(m,n,o)local p=l(n)if p~=Enum.KeyCode.Unknown then if m.isMenuToggle then local q=m.window:_keybindUsing(p,m)if q
then g.warn('Rayfield: '..k(p).." is bound to '"..tostring(q.name).."'; kept "..k(m.value))return end elseif p==m.window
.settings.toggleKeybind then g.warn('Rayfield: '..k(p)..' is the menu toggle key; kept '..k(m.value))return end end m.
value=p if m.recording then m:_stopRecording()else m.keyLabel.Text=k(m.value)m:_sizeBox(true)end if not o then m.window:
_runGuarded(m,m.onChanged,m.value)m.window:_persist(m)end end function ae._serialize(m)return{tostring(m.value.EnumType)
,m.value.Value}end function ae._deserialize(m,n)local o=tostring(n[1]):gsub('^Enum%.','')local p,q=pcall(function()
return Enum[o]end)if not p or not q then return end local r=f.itemFromValue(q,n[2])if r then m:Set(r)end end function ae
._setShown(m,n,o)local p=m.window if n then p:_revealCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=p.theme.
FieldTransparency},o)p:_reveal(m.boxStroke,{Transparency=0.85},o)p:_reveal(m.keyLabel,{TextTransparency=0.6},o)p:
_reveal(m.glow,{Transparency=0.9},o)else p:_hideCommon(m,o)p:_reveal(m.box,{BackgroundTransparency=1},o)p:_reveal(m.
boxStroke,{Transparency=1},o)p:_reveal(m.keyLabel,{TextTransparency=1},o)p:_reveal(m.glow,{Transparency=1},o)end end
function ae._refreshTheme(m)ag.tweenService:Create(m.box,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.
Out),{BackgroundTransparency=m.window.theme.FieldTransparency}):Play()end ai(ae)b(ae)return ae end)()end,[15]=function()
local aa,ab,ac=a(15)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Notification'local af=ab.Parent.
Parent.utility local ag,ah,ai,b,c,d,e,f,g,h,i,j,k=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.HapticEngine)
,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential
,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.9,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),UDim2.new(0.5,360,0.5,0),UDim2.new(0.5,0,0.5,0),6,8 local function l(m)return math.clamp(#m*0.06+3,
3,9)end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({window=assert(m,
'Missing argument #1 (Window expected)'),title=n.title or n.Title or'Notification',content=n.content or n.Content or'',
icon=n.icon or n.Icon,_hovered=false,_dismissed=false},ae)o.duration=n.duration or n.Duration or l(o.content)local p=o.
icon~=nil and o.icon~=0 and o.icon~=''o.main=o.window:Create('Frame',{Name='Notification',BackgroundTransparency=1,Size=
UDim2.new(1,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.notification,Parent=o.window.notifications})o.window:Create(
'UIPadding',{PaddingTop=UDim.new(0,k),Parent=o.main})o.body=o.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255
,255,255),Size=UDim2.new(1,0,1,0),Position=h,AnchorPoint=Vector2.new(0.5,0.5),Active=true,BorderSizePixel=0,ZIndex=ai.
zIndex.notification,BackgroundTransparency=1,Parent=o.main})o.window:Create('UIGradient',{Rotation=270,Offset=Vector2.
new(0,-0.1),Parent=o.body},{Color={'WindowColor',ah.toColorSequence}})o.window:Create('UICorner',{Parent=o.body},{
CornerRadius='CornerRoundness'})o.stroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.body},{Color=
'SurfaceStroke'})o.shadow=o.window:CreateGlow(o.body,'ShadowColor',20,1)o.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,20),PaddingRight=UDim.new(0,20),Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=
Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,14),Parent=o.body})if p then o.iconLabel=o.window:Create('ImageLabel',{
Image=o.icon,Size=UDim2.fromOffset(24,24),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.
notification,ImageTransparency=1,Parent=o.body},{ImageColor3='ContentColor'})end o.container=o.window:Create('Frame',{
Size=UDim2.fromOffset(p and 222 or 260,0),AutomaticSize=Enum.AutomaticSize.Y,BackgroundTransparency=1,BorderSizePixel=0,
LayoutOrder=2,ZIndex=ai.zIndex.notification,Parent=o.body})o.window:Create('UIListLayout',{FillDirection=Enum.
FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,4),Parent=o.container})o.titleLabel=o.
window:Create('TextLabel',{Text=o.title,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,TextSize=16,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,ZIndex=ai.
zIndex.notification,TextTransparency=1,Parent=o.container},{TextColor3='ContentColor',FontFace='TitleFont'})if o.content
~=''then o.descriptionLabel=o.window:Create('TextLabel',{Text=o.content,Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BackgroundTransparency=1,TextSize=15,TextWrapped=true,TextXAlignment=Enum.TextXAlignment.Left,
TextYAlignment=Enum.TextYAlignment.Top,LayoutOrder=2,ZIndex=ai.zIndex.notification,TextTransparency=1,Parent=o.container
},{TextColor3='ContentColor',FontFace='Font'})end o.window._notificationCount=(o.window._notificationCount or 0)+1 o.
main.LayoutOrder=o.window._notificationCount local q=o.window._liveNotifications if not q then q={}o.window.
_liveNotifications=q end table.insert(q,o)while#q>j do local r=table.remove(q,1)if r and r~=o then task.spawn(r._dismiss
,r)end end o._connections={o.window:Connect(o.body.MouseEnter,function()o._hovered=true end),o.window:Connect(o.body.
MouseLeave,function()o._hovered=false end),o.window:Connect(o.body.InputBegan,function(r)if r.UserInputType==Enum.
UserInputType.MouseButton1 or r.UserInputType==Enum.UserInputType.Touch then o:_dismiss()end end)}task.spawn(function()o
:_show()end)return o end function ae._measure(m)local n=m.iconLabel and 222 or 260 local o=ah.textHeight(m.window.theme.
TitleFont,16,m.title,n)if m.descriptionLabel then o=o+4+ah.textHeight(m.window.theme.Font,15,m.content,n)end return math
.max(o,m.iconLabel and 24 or 0)+28 end function ae._show(m)local n=m:_measure()+k if m._dismissed or not m.main.Parent
then return end b.notify()ag.tweenService:Create(m.main,c,{Size=UDim2.new(1,0,0,n)}):Play()ag.tweenService:Create(m.body
,f,{Position=i}):Play()ag.tweenService:Create(m.body,d,{BackgroundTransparency=0}):Play()ag.tweenService:Create(m.
titleLabel,e,{TextTransparency=0}):Play()ag.tweenService:Create(m.stroke,d,{Transparency=0.95}):Play()ag.tweenService:
Create(m.shadow,e,{Transparency=0.6}):Play()task.wait(0.05)if m._dismissed or not m.main.Parent then return end if m.
iconLabel then ag.tweenService:Create(m.iconLabel,e,{ImageTransparency=0}):Play()end task.wait(0.05)if m._dismissed or
not m.main.Parent then return end if m.descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e,{
TextTransparency=0.35}):Play()end local o=0 while o<m.duration and not m._dismissed and m.main.Parent do local p=task.
wait()if not m._hovered then o+=p end end m:_dismiss()end function ae._dismiss(m)if m._dismissed then return end m.
_dismissed=true local n=m.window._liveNotifications local o=n and table.find(n,m)if n and o then table.remove(n,o)end if
not m.main.Parent then return end ag.tweenService:Create(m.body,d,{BackgroundTransparency=1}):Play()ag.tweenService:
Create(m.stroke,d,{Transparency=1}):Play()ag.tweenService:Create(m.shadow,e,{Transparency=1}):Play()ag.tweenService:
Create(m.titleLabel,e,{TextTransparency=1}):Play()if m.descriptionLabel then ag.tweenService:Create(m.descriptionLabel,e
,{TextTransparency=1}):Play()end if m.iconLabel then ag.tweenService:Create(m.iconLabel,e,{ImageTransparency=1}):Play()
end ag.tweenService:Create(m.body,g,{Size=UDim2.new(1,-90,1,0)}):Play()local p=ag.tweenService:Create(m.main,g,{Size=
UDim2.new(1,0,0,0)})p:Play()p.Completed:Wait()if not m.main.Parent then return end for q,r in m._connections do m.window
:Disconnect(r)end m.window:DestroySubtree(m.main)end return ae end)()end,[16]=function()local aa,ab,ac=a(16)local ad
return(function(...)local ae={}ae.__index=ae ae.__type='Popup'local af=ab.Parent.Parent.utility local ag,ah,ai,b,c,d,e,f
,g,h,i,j,k,l,m=ac(af.variables),ac(af.functions),ac(af.constants),ac(af.locale),ac(af.log),ac(af.HapticEngine),TweenInfo
.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),400,22,24,22,16 local n,o,p,q,r,s,t,u=i-j*2,18,14,15,16,12,300,4 local
v,w,x,y,z,A,B,C,D,E,F,G,H,I,J,K=n-u*2,16,13,20,10,15,14,8,10,40,8,UDim.new(1,0),16,0.5,{}local function L()for M=#J,1,-1
do local N=J[M]if N._closed or not N.screenGui.Parent then table.remove(J,M)end end end local function M(N)L()return J[#
J]==N end function ae.new(N,O)O=if typeof(O)=='table'then O else{}local P=setmetatable({window=assert(N,
'Missing argument #1 (Window expected)'),title=O.title or O.Title or'Popup',subtitle=O.subtitle or O.Subtitle,content=O.
content or O.Content,icon=O.icon or O.Icon,boxes=O.boxes or O.Boxes,options=O.options or O.Options,dismissable=if O.
dismissable~=nil then O.dismissable elseif O.Dismissable~=nil then O.Dismissable else true,_reveal={},_connections={},
_closed=false},ae)if not P.options or#P.options==0 then P.options={{text='Okay'}}end P:_build()L()table.insert(J,P)task.
spawn(function()P:_show()end)return P end function ae._fade(N,O,P,Q)table.insert(N._reveal,{instance=O,prop=P,to=Q})
return O end function ae._build(N)local O,P=N.window,N.icon~=nil and N.icon~=0 and N.icon~=''N.screenGui=O:Create(
'ScreenGui',{Name=ag.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,DisplayOrder=ai
.displayOrder.popup,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=ag.guiContainer})N.backdrop=O:Create('Frame',{Name=
'Backdrop',BackgroundColor3=Color3.fromRGB(0,0,0),BorderSizePixel=0,Size=UDim2.fromScale(1,1),Active=true,
BackgroundTransparency=1,Parent=N.screenGui})N:_fade(N.backdrop,'BackgroundTransparency',I)N.card=O:Create('Frame',{Name
='Card',BackgroundColor3=Color3.fromRGB(255,255,255),AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.5,14),
Size=UDim2.fromOffset(i,0),AutomaticSize=Enum.AutomaticSize.Y,Active=true,BorderSizePixel=0,BackgroundTransparency=1,
Parent=N.screenGui})N:_fade(N.card,'BackgroundTransparency',0)O:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-
0.1),Parent=N.card},{Color={'WindowColor',ah.toColorSequence}})O:Create('UICorner',{Parent=N.card},{CornerRadius=
'CornerRoundness'})N.cardStroke=O:Create('UIStroke',{Transparency=1,Parent=N.card},{Color='SurfaceStroke'})N:_fade(N.
cardStroke,'Transparency',0.95)N.cardShadow=O:CreateGlow(N.card,'ShadowColor',26,1)N:_fade(N.cardShadow,'Transparency',
0.55)O:Create('UIPadding',{PaddingLeft=UDim.new(0,j),PaddingRight=UDim.new(0,j),PaddingTop=UDim.new(0,k),PaddingBottom=
UDim.new(0,l),Parent=N.card})O:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum
.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,m),Parent=N.card})local Q=N:
_measureHeader(P)N:_buildHeader(P,Q)local R=N:_buildContent()N:_buildFooter()local S=2+(R>0 and 1 or 0)local T=k+Q+R+E+l
+m*(S-1)N.card.Size=UDim2.fromOffset(i,T)N.card.AutomaticSize=Enum.AutomaticSize.None if N.dismissable then table.
insert(N._connections,O:Connect(N.backdrop.InputBegan,function(U)if U.UserInputType==Enum.UserInputType.MouseButton1 or
U.UserInputType==Enum.UserInputType.Touch then N:Close()end end))table.insert(N._connections,O:Connect(ag.
userInputService.InputBegan,function(U,V)if not V and U.KeyCode==Enum.KeyCode.Escape and M(N)then if U==K then return
end K=U N:Close()end end))end end function ae._buildHeader(N,O,P)local Q=N.window local R=Q:Create('Frame',{Name=
'Header',BackgroundTransparency=1,Size=UDim2.new(1,0,0,P),LayoutOrder=1,Parent=N.card})Q:Create('UIListLayout',{
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,s),Parent=R})if O then N:_fade(Q:
Create('ImageLabel',{Image=N.icon,Size=UDim2.fromOffset(r,r),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,
ImageTransparency=1,Parent=R},{ImageColor3='TitlingColor'}),'ImageTransparency',0)end local S=Q:Create('Frame',{Name=
'Text',BackgroundTransparency=1,Size=UDim2.new(1,O and-(r+s)or 0,0,N._columnH),LayoutOrder=2,Parent=R})Q:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3),
Parent=S})N:_fade(Q:Create('TextLabel',{Text=b.t(N.title),Size=UDim2.new(1,0,0,N._titleH),BackgroundTransparency=1,
TextSize=o,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=S},{
TextColor3='TitlingColor',FontFace='Font'}),'TextTransparency',0)if N.subtitle and N.subtitle~=''then N:_fade(Q:Create(
'TextLabel',{Text=b.t(N.subtitle),Size=UDim2.new(1,0,0,N._subH),BackgroundTransparency=1,TextSize=p,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=S},{TextColor3='TitlingColor',FontFace=
'Font'}),'TextTransparency',0.55)end end function ae._buildContent(N)if(not N.content or N.content=='')and(not N.boxes
or#N.boxes==0)then return 0 end local O,P=N.window,if N.boxes and#N.boxes>0 then N:_measureBoxes()else N:_measureText()
local Q=math.min(P,t)+u*2 local R=O:Create('ScrollingFrame',{Name='Content',BackgroundTransparency=1,BorderSizePixel=0,
Size=UDim2.new(1,0,0,Q),CanvasSize=UDim2.new(0,0,0,0),AutomaticCanvasSize=Enum.AutomaticSize.Y,ScrollBarThickness=4,
ScrollBarImageColor3=Color3.fromRGB(255,255,255),ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2,
ScrollBarImageTransparency=1,Parent=N.card})N:_fade(R,'ScrollBarImageTransparency',0.8)O:Create('UIPadding',{PaddingLeft
=UDim.new(0,u),PaddingRight=UDim.new(0,u),PaddingTop=UDim.new(0,u),PaddingBottom=UDim.new(0,u),Parent=R})if N.boxes and#
N.boxes>0 then O:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,C),Parent=R})for S,T in N.boxes do N:
_buildBox(R,T,S)end else N:_fade(O:Create('TextLabel',{Text=b.t(N.content),Size=UDim2.new(1,0,0,P),
BackgroundTransparency=1,TextSize=q,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,TextTransparency=1,Parent=R},{TextColor3='ContentColor',FontFace='Font'}),'TextTransparency',0.5)end
return Q end function ae._buildBox(N,O,P,Q)local R=N.window P=if typeof(P)=='table'then P else{title=tostring(P)}local S
,T,U,V,W=P.icon~=nil and P.icon~=0 and P.icon~='',N:_measureBox(P)local X=R:Create('Frame',{Name='Box',BackgroundColor3=
Color3.fromRGB(255,255,255),BorderSizePixel=0,Size=UDim2.new(1,-D,0,T),LayoutOrder=Q,BackgroundTransparency=1,Parent=O})
N:_fade(X,'BackgroundTransparency',0)local Y=R:StyleElementPanel(X)N:_fade(Y,'Transparency',R.theme.
ElementStrokeTransparency)R:Create('UIPadding',{PaddingLeft=UDim.new(0,w),PaddingRight=UDim.new(0,w),PaddingTop=UDim.
new(0,x),PaddingBottom=UDim.new(0,x),Parent=X})R:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,z),Parent=X})if S then N:_fade(R:Create('ImageLabel',{Image=P.icon,Size=UDim2.
fromOffset(y,y),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ImageTransparency=1,Parent=X},{ImageColor3=
'ContentColor'}),'ImageTransparency',0)end local Z=R:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,S and-(y+
z)or 0,0,W),LayoutOrder=2,Parent=X})R:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,SortOrder=Enum.
SortOrder.LayoutOrder,Padding=UDim.new(0,3),Parent=Z})N:_fade(R:Create('TextLabel',{Text=b.t(P.title or P.Title or''),
Size=UDim2.new(1,0,0,U),BackgroundTransparency=1,TextSize=A,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,
LayoutOrder=1,TextTransparency=1,Parent=Z},{TextColor3='ContentColor',FontFace='TitleFont'}),'TextTransparency',0)local
_=P.description or P.Description if _ and _~=''then N:_fade(R:Create('TextLabel',{Text=b.t(_),Size=UDim2.new(1,0,0,V),
BackgroundTransparency=1,TextSize=B,TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Top,
TextWrapped=true,LayoutOrder=2,TextTransparency=1,Parent=Z},{TextColor3='ContentColor',FontFace='Font'}),
'TextTransparency',0.65)end end function ae._buildFooter(N)local O=N.window local P=O:Create('Frame',{Name='Footer',
BackgroundTransparency=1,Size=UDim2.new(1,0,0,E),LayoutOrder=3,Parent=N.card})O:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.
new(0,F),Parent=P})for Q,R in N.options do N:_buildButton(P,R,Q)end end function ae._buildButton(N,O,P,Q)local R=N.
window P=if typeof(P)=='table'then P else{text=tostring(P)}local S,T,U,V,W,X,Y=P.style or P.Style or'neutral',P.text or
P.Text or P.name or P.Name or'Okay',P.callback or P.Callback if S=='primary'then V,W,X,Y=R.theme.AccentColor,R.theme.
AccentStroke,R.theme.AccentStroke,0.1 elseif S=='danger'then V,W,X,Y=R.theme.ErrorColor,R.theme.ErrorStrokeColor,R.theme
.ErrorStrokeColor,0 else V,W,X,Y=R.theme.NeutralButton,R.theme.NeutralButtonHover,R.theme.NeutralButtonStroke,0.85 end
local Z=R:Create('Frame',{Name='Button',BackgroundColor3=V,BorderSizePixel=0,Size=UDim2.new(0,0,0,E),LayoutOrder=Q,
BackgroundTransparency=1,Parent=O})N:_fade(Z,'BackgroundTransparency',0)R:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.
Fill,Parent=Z})R:Create('UICorner',{CornerRadius=G,Parent=Z})local _=R:Create('UIStroke',{Color=X,Transparency=1,Parent=
Z})N:_fade(_,'Transparency',Y)N:_fade(R:Create('TextLabel',{Text=b.t(T),Size=UDim2.fromScale(1,1),BackgroundTransparency
=1,TextSize=H,TextXAlignment=Enum.TextXAlignment.Center,TextTruncate=Enum.TextTruncate.AtEnd,TextColor3=ah.contrastText(
V),TextTransparency=1,Parent=Z},{FontFace='Font'}),'TextTransparency',0)local aj,ak=R:Create('TextButton',{Text='',
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=2,Parent=Z}),TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)table.insert(N._connections,R:Connect(aj.MouseEnter,function()if N._closed
then return end ag.tweenService:Create(Z,ak,{BackgroundColor3=W}):Play()end))table.insert(N._connections,R:Connect(aj.
MouseLeave,function()ag.tweenService:Create(Z,ak,{BackgroundColor3=V}):Play()end))table.insert(N._connections,R:Connect(
aj.MouseButton1Click,function()if N._closed then return end d.click()ag.tweenService:Create(_,ak,{Transparency=1}):Play(
)if U then task.spawn(function()local al,am=pcall(U)if not al then c.warn("Rayfield: popup button '"..T..
"' callback errored:")c.print(am)end end)end N:Close()end))end function ae._measureHeader(aj,ak)local al=n-(if ak then r
+s else 0)aj._titleH=ah.textHeight(aj.window.theme.Font,o,b.resolve(aj.title),al)aj._subH=if aj.subtitle and aj.subtitle
~=''then ah.textHeight(aj.window.theme.Font,p,b.resolve(aj.subtitle),al)else 0 aj._columnH=aj._titleH+(if aj._subH>0
then 3+aj._subH else 0)return math.max(aj._columnH,if ak then r else 0)end function ae._measureText(aj)return ah.
textHeight(aj.window.theme.Font,q,b.resolve(aj.content),v)end function ae._measureBox(aj,ak)ak=if typeof(ak)=='table'
then ak else{title=tostring(ak)}local al=ak.icon~=nil and ak.icon~=0 and ak.icon~=''local am=v-D-w*2-(if al then y+z
else 0)local N,O,P=ah.textHeight(aj.window.theme.TitleFont,A,b.resolve(ak.title or ak.Title or''),am),0,ak.description
or ak.Description if P and P~=''then O=ah.textHeight(aj.window.theme.Font,B,b.resolve(P),am)end local Q=N+(if O>0 then 3
+O else 0)local R=math.max(Q,if al then y else 0)+x*2 return R,N,O,Q end function ae._measureBoxes(aj)local ak=0 for al,
am in aj.boxes do ak+=(aj:_measureBox(am))if al<#aj.boxes then ak+=C end end return ak end function ae._show(aj)if not
aj.screenGui.Parent then return end d.notify()ag.tweenService:Create(aj.card,e,{Position=UDim2.new(0.5,0,0.5,0)}):Play()
for ak,al in aj._reveal do local am=if al.instance==aj.backdrop then h else f ag.tweenService:Create(al.instance,am,{[al
.prop]=al.to}):Play()end end function ae.Close(aj)if aj._closed then return end aj._closed=true local ak=table.find(J,aj
)if ak then table.remove(J,ak)end for al,am in aj._connections do aj.window:Disconnect(am)end aj._connections={}if not
aj.screenGui.Parent then return end ag.tweenService:Create(aj.card,g,{Position=UDim2.new(0.5,0,0.5,10)}):Play()for al,am
in aj._reveal do ag.tweenService:Create(am.instance,g,{[am.prop]=1}):Play()end task.delay(g.Time,function()aj.window:
DestroySubtree(aj.screenGui)end)end return ae end)()end,[17]=function()local aa,ab,ac=a(17)local ad return(function(...)
local ae={}ae.__index=ae ae.__type='Progress'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,
i=ac(af.variables),ac(af.functions),ac(af.moveable),ac(af.locale),60,8,20,6,6,16,14,0.4,TweenInfo.new(0.45,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint
.new(1,0)},0.9 local j=TweenInfo.new(i,Enum.EasingStyle.Quint,Enum.EasingDirection.InOut,-1,true)local function k(l:
unknown):number?local m=tonumber(l)if m==nil or m~=m or math.abs(m)==math.huge then return nil end return m end function
ae.new(l,m)m=if typeof(m)=='table'then m else{}local n=k(m.steps or m.Steps)n=if n and n>=2 then math.floor(n)else nil
local o=m.range or m.Range local p,q=k(o and o[1])or 0,k(o and o[2])or n or 1 if p>q then p,q=q,p end local r=
setmetatable({tab=assert(l,'Missing argument #1 (Tab expected)'),window=l.window,name=m.name or m.Name or'Progress',icon
=m.icon or m.Icon,description=m.description or m.Description,min=p,max=q,steps=n,value=0,text=m.text or m.Text,format=m.
format or m.Format,showValue=if m.showValue==nil then true else m.showValue==true,indeterminate=m.indeterminate or m.
Indeterminate or false},ae)r.value=r:_clamp(k(m.value or m.Value)or p)r:_build()if r.description then r.descriptor=ac(ab
.Parent.descriptor).new(r.tab,{description=r.description})end return r end function ae._clamp(l,m:number):number return
math.clamp(k(m)or l.min,l.min,l.max)end function ae._ratio(l):number local m=l.max-l.min if m<=0 then return 1 end
return(l.value-l.min)/m end function ae._filledSteps(l):number local m=l.steps::number return math.clamp(math.round(l:
_ratio()*m),0,m)end function ae._readout(l):string if l.text then return aj.resolve(l.text)end if l.format then local m,
n=pcall(l.format,l.value,l.min,l.max)if m and type(n)=='string'then return n end end if l.steps then return string.
format('%d/%d',l:_filledSteps(),l.steps)end return string.format('%d%%',math.round(l:_ratio()*100))end function ae.
_build(l)l.main=l.window:Create('Frame',{Size=UDim2.new(1,-20,0,ak),BorderSizePixel=0,Name=l.name,BackgroundColor3=
Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=l.tab.tabPage},{BackgroundTransparency='ElementTransparency'
})l.stroke=l.window:StyleElementBody(l.main)l.container=l.window:Create('Frame',{Size=UDim2.new(0,170,0,d),Position=
UDim2.new(0,am,0,20),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,BorderSizePixel=0,Parent=l.main})l.window:
Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=l
.container})if l.icon then l.iconLabel=l.window:Create('ImageLabel',{Image=l.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=l.container},{ImageColor3='ContentColor'})end l.
title=l.window:Create('TextLabel',{Text=aj.t(l.name),Size=UDim2.fromOffset(250,d),BorderSizePixel=0,
BackgroundTransparency=1,TextSize=d,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,
TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=l.container},{TextColor3='ContentColor',FontFace='Font'})l.
readout=l.window:Create('TextLabel',{Text=l:_readout(),AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-am,0,20),
Size=UDim2.fromOffset(50,e),AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=e,
TextXAlignment=Enum.TextXAlignment.Right,Visible=l.showValue,TextTransparency=1,Parent=l.main},{TextColor3=
'ContentColor',FontFace='Font'})if l.steps then l:_buildSteps()return end l.track=l.window:Create('Frame',{AnchorPoint=
Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-16),Size=UDim2.new(1,-am*2,0,al),BorderSizePixel=0,BackgroundTransparency
=1,Parent=l.main},{BackgroundColor3='SliderBackground'})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=l.
track})l.fill=l.window:Create('Frame',{AnchorPoint=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.
fromScale(if l.indeterminate then 0 else l:_ratio(),1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
ZIndex=2,BackgroundTransparency=1,Parent=l.track})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=l.fill})
l.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=h,Parent=l.fill},{Color={
'SliderProgress',ah.toColorSequence}})l.fillGlow=l.window:CreateGlow(l.fill,'AccentColor',20,1)if l.indeterminate then l
:_startSweep()end end function ae._buildSteps(l)local m=l.steps::number l.track=l.window:Create('Frame',{AnchorPoint=
Vector2.new(0.5,1),Position=UDim2.new(0.5,0,1,-17),Size=UDim2.new(1,-am*2,0,b),BackgroundTransparency=1,BorderSizePixel=
0,Parent=l.main})l.window:Create('UIListLayout',{Padding=UDim.new(0,c),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=l.track})l.stepFrames={}for n=1,m do local o=l.window:Create('Frame',{Size=UDim2.new(1/m,-(
c*(m-1))/m,1,0),BorderSizePixel=0,LayoutOrder=n,BackgroundTransparency=1,Parent=l.track},{BackgroundColor3=
'SliderBackground'})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=o})local p=l.window:Create('Frame',{
Size=UDim2.fromScale(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency
=1,Parent=o})l.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=p})l.window:Create('UIGradient',{Rotation=90,
Parent=p},{Color={'SliderProgress',ah.toColorSequence}})table.insert(l.stepFrames,{segment=o,fill=p})end end function ae
._startSweep(l)if l._sweep or l.steps then return end l.fill.AnchorPoint=Vector2.new(0,0.5)l.fill.Position=UDim2.
fromScale(0,0.5)l.fill.Size=UDim2.fromScale(0,1)l._sweep=ag.tweenService:Create(l.fill,j,{Size=UDim2.fromScale(1,1)})l.
_sweep:Play()end function ae._stopSweep(l)if not l._sweep then return end l._sweep:Cancel()l._sweep=nil l.fill.
AnchorPoint=Vector2.new(0,0.5)l.fill.Position=UDim2.fromScale(0,0.5)end function ae._render(l,m:boolean?)l.readout.Text=
l:_readout()if l.steps then if not l._shown then return end local n=l:_filledSteps()for o,p in l.stepFrames do local q=
if o<=n then 0 else 1 if m==false then p.fill.BackgroundTransparency=q else ag.tweenService:Create(p.fill,g,{
BackgroundTransparency=q}):Play()end end return end local n=UDim2.fromScale(l:_ratio(),1)if m==false then l.fill.Size=n
else ag.tweenService:Create(l.fill,g,{Size=n}):Play()end end function ae.Set(l,m)l.value=l:_clamp(m)if l.indeterminate
then l.indeterminate=false l:_stopSweep()end l:_render()end function ae.Get(l):number return l.value end function ae.
GetPercentage(l):number return l:_ratio()end function ae.SetRange(l,m,n)m=k(m)or l.min n=k(n)or l.max if m>n then m,n=n,
m end l.min,l.max=m,n l.value=l:_clamp(l.value)l:_render()end function ae.SetText(l,m)l.text=m l.readout.Text=l:
_readout()end function ae.SetIndeterminate(l,m)m=m==true if m==l.indeterminate then return end l.indeterminate=m if m
then l:_startSweep()else l:_stopSweep()l:_render(false)end end function ae._setShown(l,m,n)local o=l.window l._shown=m o
:_reveal(l.readout,{TextTransparency=if m then f else 1},n)if m then o:_revealCommon(l,n)else o:_hideCommon(l,n)end if l
.steps then local p=l:_filledSteps()for q,r in l.stepFrames do o:_reveal(r.segment,{BackgroundTransparency=if m then 0
else 1},n)o:_reveal(r.fill,{BackgroundTransparency=if m and q<=p then 0 else 1},n)end return end o:_reveal(l.track,{
BackgroundTransparency=if m then 0 else 1},n)o:_reveal(l.fill,{BackgroundTransparency=if m then 0 else 1},n)o:_reveal(l.
fillGlow,{Transparency=if m then o.theme.AccentGlow else 1},n)end function ae.Remove(l)l:_stopSweep()if l.descriptor
then l.descriptor:Remove()end l.main:Destroy()end ai(ae)return ae end)()end,[18]=function()local aa,ab,ac=a(18)local ad
return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am=ac(ae.variables),ac(ae.constants),
ac(ae.locale),ac(ab.Parent.action),{},TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),0.6,0.2
local function b(c)if c.__type=='Group'then local d={}local function e(f)for g,h in f.elements do if h.__type=='Group'
then e(h)elseif h.name then table.insert(d,h.name)end end end e(c)return table.concat(d,'\n')end return c.name or''end
local function c(d)local e={}for f,g in d.tabs do if g.neglectSelector then continue end for h,i in g.elements do if i.
__type~='Section'then table.insert(e,i)end end end return e end local function d(e,f,g)af.tweenService:Create(e.
searchPill,g,{BackgroundTransparency=if f then 0.9 else 1}):Play()af.tweenService:Create(e.searchStroke,g,{Transparency=
if f then 0.85 else 1}):Play()af.tweenService:Create(e.searchShadow,g,{Transparency=if f then 0.92 else 1}):Play()af.
tweenService:Create(e.searchIcon,g,{ImageTransparency=if f then 0.65 else 1}):Play()af.tweenService:Create(e.searchInput
,g,{TextTransparency=if f then 0.2 else 1}):Play()end local function e(f,g,h)if f.layout.mode=='sidebar'then return end
for i,j in f.tabs do if not j.neglectSelector and j.topbarItem then j:_applyVisual(if g then(if f.selectedTab==j then
'selected'else'unselected')else'hidden',h)end end end local function f(g,h)h=string.lower(h or'')local i=false for j,k
in g._searchUnits do local l=h==''or string.find(k.text,h,1,true)~=nil k.unit.main.Visible=l if k.unit.descriptor then k
.unit.descriptor.main.Visible=l end i=i or l end g.searchEmpty.Visible=not i and h~=''end local function g(h)h.
_searchUnits={}local i=0 for j,k in c(h)do i+=1 local l=k.main table.insert(h._searchUnits,{unit=k,text=string.lower(b(k
)),homeParent=l.Parent,homeOrder=l.LayoutOrder,descOrder=k.descriptor and k.descriptor.main.LayoutOrder})l.LayoutOrder=i
*10 l.Parent=h.searchPage l.Visible=true if k.descriptor then k.descriptor.main.LayoutOrder=i*10+1 k.descriptor.main.
Parent=h.searchPage k.descriptor.main.Visible=true end end end local function h(i)for j,k in i._searchUnits do local l=k
.unit if l.main and l.main.Parent then l.main.LayoutOrder=k.homeOrder l.main.Parent=k.homeParent l.main.Visible=true end
if l.descriptor and l.descriptor.main and l.descriptor.main.Parent then l.descriptor.main.LayoutOrder=k.descOrder l.
descriptor.main.Parent=k.homeParent l.descriptor.main.Visible=true end end i._searchUnits={}end function aj.open(i)if i.
_searching or i.minimised or not i:_interactive()then return end i._searching=true g(i)f(i,'')i:_jumpTo(i.searchPage)e(i
,false,ak)task.delay(ak.Time,function()if i._searching and i.layout.mode~='sidebar'then i.tabList.Visible=false end end)
i.searchPill.Visible=true d(i,true,ak)i.searchInput:CaptureFocus()af.tweenService:Create(i.searchAction.iconLabel,ak,{
ImageTransparency=am}):Play()end function aj.close(i,j)if not i._searching then return end j=j or{}i._searching=false i.
searchInput.Text=''i.searchInput:ReleaseFocus()i.searchEmpty.Visible=false h(i)local k=if j.jumpTo==nil then i.
selectedTab and i.selectedTab.tabPage else j.jumpTo if k then i:_jumpTo(k)end d(i,false,ak)task.delay(ak.Time,function()
if not i._searching then i.searchPill.Visible=false end end)if j.showTabs then i.tabList.Visible=true e(i,true,ak)end af
.tweenService:Create(i.searchAction.iconLabel,ak,{ImageTransparency=al}):Play()end function aj.toggle(i)if i._searching
then aj.close(i,{showTabs=true})else aj.open(i)end end function aj.railWidth(i,j)if i.searchPill then i.searchPill.Size=
UDim2.new(1,-(j+30),0,35)end end function aj.build(i)i._searching=false i.searchPage=i:Create('ScrollingFrame',{Name=
'Search',Size=UDim2.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,
BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,
ScrollingDirection=Enum.ScrollingDirection.Y,LayoutOrder=2000,Parent=i.elements})i:Create('UIListLayout',{Padding=UDim.
new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Top,HorizontalAlignment=Enum
.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=i.searchPage})i:Create('UIPadding',{PaddingTop=
UDim.new(0,if i.layout.mode=='sidebar'then 53 else 10),PaddingBottom=UDim.new(0,33),Parent=i.searchPage})i.searchEmpty=i
:Create('TextLabel',{Name='NoResults',Text=ah.t'No results',FontFace=af.brandFont(Enum.FontWeight.Medium),TextSize=15,
TextTransparency=0.6,BackgroundTransparency=1,AnchorPoint=Vector2.new(0.5,0.5),Position=UDim2.new(0.5,0,0.55,0),Size=
UDim2.fromOffset(200,20),Visible=false,ZIndex=3,Parent=i.main},{TextColor3='ContentColor',FontFace='Font'})local j=i.
layout.mode=='sidebar'local k=if j then i.layout.chromeHeight+8 else i.layout.tabStripTop+1 i.searchPill=i:Create(
'Frame',{Name='SearchBar',AnchorPoint=Vector2.new(if j then 1 else 0.5,0),Position=UDim2.new(if j then 1 else 0.5,if j
then-15 else 0,0,k),Size=UDim2.new(1,if j then-(i.layout.railWidth+30)else-35,0,35),BackgroundColor3=Color3.fromRGB(255,
255,255),BorderSizePixel=0,ZIndex=10,BackgroundTransparency=1,Visible=false,Parent=i.main})i:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=i.searchPill})i.searchStroke=i:Create('UIStroke',{Color=Color3.fromRGB(255,255,255),
Thickness=1,Transparency=1,Parent=i.searchPill})i.searchShadow=i:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=
Color3.fromRGB(255,255,255),ZIndex=-1,Transparency=1,Parent=i.searchPill})i.searchIcon=i:Create('ImageLabel',{Image=
'rbxassetid://'..tostring(ag.icons.search),AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,15,0.5,1),Size=UDim2.
fromOffset(16,16),BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=i.searchPill},{ImageColor3=
'ContentColor'})i.searchInput=i:Create('TextBox',{Text='',PlaceholderText=ah.t'Search all pages',AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,40,0.5,0),Size=UDim2.new(1,-110,0,18),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,ClearTextOnFocus=false,ClipsDescendants=true,ZIndex=10,TextTransparency=1,Parent
=i.searchPill},{TextColor3='ContentColor',FontFace='Font',PlaceholderColor3='PlaceholderColor'})i:Connect(i.searchInput:
GetPropertyChangedSignal'Text',function()if i._searching then f(i,i.searchInput.Text)end end)i.searchAction=ai.new(i,{
name='Search',icon=ag.icons.search,order=4,callback=function()aj.toggle(i)end})i.searchAction.isLit=function()return i.
_searching end end return aj end)()end,[19]=function()local aa,ab,ac=a(19)local ad return(function(...)local ae={}ae.
__index=ae ae.__type='Section'local af,ag=ac(ab.Parent.Parent.utility.moveable),ac(ab.Parent.Parent.utility.locale)
function ae.new(ah,ai)ai=if typeof(ai)=='table'then ai else{}local aj=setmetatable({tab=assert(ah,
'Missing argument #1 (Tab expected)'),window=ah.window,name=ai.name or ai.Name or'Section',icon=ai.icon or ai.Icon},ae)
local ak=if#aj.tab.elements==0 then 0 else 13 aj.main=aj.window:Create('Frame',{Size=UDim2.new(1,-40,0,20+ak),
BorderSizePixel=0,Name=aj.name,BackgroundTransparency=1,Parent=aj.tab.tabPage})if ak>0 then aj.window:Create('UIPadding'
,{PaddingTop=UDim.new(0,ak),Parent=aj.main})end aj.window:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,
Parent=aj.main})if aj.icon then aj.iconLabel=aj.window:Create('ImageLabel',{Image=aj.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=aj.main},{ImageColor3='ContentColor'})end aj.title
=aj.window:Create('TextLabel',{Text=ag.t(aj.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1
,TextSize=15,AutomaticSize=Enum.AutomaticSize.X,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=aj.main},{TextColor3='ContentColor',FontFace='Font'})return aj end function ae._setShown(ah,ai
,aj)local ak=ah.window ak:_reveal(ah.title,{TextTransparency=if ai then 0.6 else 1},aj)if ah.iconLabel then ak:_reveal(
ah.iconLabel,{ImageTransparency=if ai then 0.65 else 1},aj)end end af(ae)return ae end)()end,[20]=function()local aa,ab,
ac=a(20)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,b,c=ac(ae.variables
),ac(ae.image),ac(ae.locale),ac(ab.Parent.tabSelector),ac(ab.Parent.search),{},0,0.7,0.95,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out)local function d(e)return e.layout.mode=='sidebar'and e.profile~=nil and e.
settings.showProfile and af.localPlayer~=nil end local function e(f,g)local h=af.localPlayer if not h then return end f.
profile=f:Create('Frame',{Name='Profile',AnchorPoint=Vector2.new(0.5,1),Position=UDim2.fromScale(0.5,1),Size=UDim2.new(1
,0,0,g.footerHeight),BackgroundTransparency=1,Parent=f.sidebar})f.profileContainer=f:Create('Frame',{AnchorPoint=Vector2
.new(0,0.5),Position=UDim2.new(0,g.rowInset,0.5,0),Size=UDim2.new(1,-g.rowInset,1,0),BackgroundTransparency=1,Parent=f.
profile})f.profileLayout=f:Create('UIListLayout',{Padding=UDim.new(0,10),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.
SortOrder.LayoutOrder,Parent=f.profileContainer})f.profileAvatar=f:Create('ImageLabel',{Name='Avatar',Image=ag.avatar(h.
UserId,function(i)if f.profileAvatar and not f.unloaded then ag.assign(f.profileAvatar,'Image',i)end end),Size=UDim2.
fromOffset(g.avatarSize,g.avatarSize),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,ImageTransparency=1,Parent=f.profileContainer})f:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=f.profileAvatar})f.profileLabels=f:Create('Frame',{Size=UDim2.fromOffset(50,g.avatarSize),AutomaticSize=Enum.
AutomaticSize.X,BackgroundTransparency=1,LayoutOrder=1,Parent=f.profileContainer})f:Create('UIListLayout',{Padding=UDim.
new(0,2),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=
Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f.profileLabels})f.profileName=f:Create(
'TextLabel',{Text=h.DisplayName,Size=UDim2.fromOffset(50,16),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1
,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTransparency=1,Parent=f.profileLabels},{TextColor3=
'TitlingColor',FontFace='Font'})f.profileSubtitle=f:Create('TextLabel',{Text='',Size=UDim2.fromOffset(50,14),
AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,
LayoutOrder=1,Visible=false,TextTransparency=1,Parent=f.profileLabels},{TextColor3='TitlingColor',FontFace='Font'})end
function ak.build(f,g)f.sidebar=f:Create('Frame',{Name='Sidebar',AnchorPoint=Vector2.new(0,1),Position=UDim2.fromScale(0
,1),Size=UDim2.new(0,g.railWidth,1,-g.chromeHeight),BackgroundTransparency=1,Visible=false,Parent=f.main})f.tabList=f:
Create('ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,BorderSizePixel=0,
AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1
,ScrollingDirection=Enum.ScrollingDirection.Y,ClipsDescendants=true,Parent=f.sidebar})f:Create('UIPadding',{PaddingTop=
UDim.new(0,g.railPadding),PaddingBottom=UDim.new(0,g.railPadding),Parent=f.tabList})f.tabListLayout=f:Create(
'UIListLayout',{Padding=UDim.new(0,g.rowSpacing),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.
VerticalAlignment.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=f.
tabList})e(f,g)ak.reflowProfile(f)end function ak.reflowProfile(f)local g,h=f.layout,d(f)if f.profile then f.profile.
Visible=h end f.tabList.Size=UDim2.new(1,0,1,if h then-g.footerHeight else 0)end function ak.applyWidth(f,g)local h=f.
layout f.sidebar.Size=UDim2.new(0,g,1,-h.chromeHeight)f.elements.Size=UDim2.new(1,-g,1,-h.chromeHeight)f.bottomFade.Size
=UDim2.new(1,-g,h.fadeSize.Y.Scale,h.fadeSize.Y.Offset)aj.railWidth(f,g)local i=g<(h.railWidth::number)for j,k in f.tabs
do if not k.neglectSelector then ai.setRowCollapsed(k,i,h)end end if f.profileContainer then f.profileContainer.Position
=UDim2.new(0,if i then 0 else h.rowInset,0.5,0)f.profileContainer.Size=UDim2.new(1,if i then 0 else-h.rowInset,1,0)f.
profileLayout.HorizontalAlignment=if i then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left f.
profileLabels.Visible=not i end end function ak.setProfileShown(f,g,h)if not f.profile or not f.profile.Visible then
return end local i={[f.profileAvatar]={ImageTransparency=if g then 0 else 1,BackgroundTransparency=if g then b else 1},[
f.profileName]={TextTransparency=if g then al else 1},[f.profileSubtitle]={TextTransparency=if g then am else 1}}for j,k
in i do if h then af.tweenService:Create(j,h,k):Play()else for l,m in k do j[l]=m end end end end function ak.
setProfileEnabled(f,g)if not f.profile then f.settings.showProfile=g return end if g then f.settings.showProfile=true ak
.reflowProfile(f)ak.setProfileShown(f,true,c)return end ak.setProfileShown(f,false,c)task.delay(c.Time,function()if f.
unloaded or f.settings.showProfile then return end ak.reflowProfile(f)end)f.settings.showProfile=false end function ak.
setSubtitle(f,g)if not f.profileSubtitle then return end local h=if type(g)=='string'and g~=''then ah.resolve(g)else nil
f.profileSubtitle.Text=h or''f.profileSubtitle.Visible=h~=nil end return ak end)()end,[21]=function()local aa,ab,ac=a(21
)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Slider'local af=ab.Parent.Parent.utility local ag,ah,
ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.lockable),ac(af.locale),ac(af.
HapticEngine)local function b(c)local d=0 while d<6 do local e=c*10^d if math.abs(e-math.round(e))<1e-9 then break end d
+=1 end return d end local function c(d,e,f)local g=d[1]+math.round((f-d[1])/e)*e return math.clamp(g,d[1],d[2])end
local d,e,f,g,h,i=TweenInfo.new(0.45,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),300
,Vector2.new(35,20),Vector2.new(41,22)local function j(k:number):UDim2 return UDim2.new(k,0,1,0)end local function k():
UDim2 return UDim2.new(1,0,0.5,0)end local function l(m:number,n:number,o:number):number return math.clamp((m-n)/o,0,1)
end function ae.new(m,n)n=if typeof(n)=='table'then n else{}local o=setmetatable({tab=assert(m,
'Missing argument #1 (Tab expected)'),window=m.window,name=n.name or n.Name or'Slider',icon=n.icon or n.Icon,description
=n.description or n.Description,forgetState=n.forgetState or n.ForgetState or m.forgetState,range=n.range or n.Range or{
0,100},increment=n.increment or n.Increment or 1,suffix=n.suffix or n.Suffix or'',callback=n.callback or n.Callback or
function()end,dragging=false,minimal=n.minimal or n.Minimal or false,_handleWidth=h.X},ae)assert(typeof(o.range)==
'table'and typeof(o.range[1])=='number'and typeof(o.range[2])=='number',
'A slider range needs two numbers, like { 0, 100 }.')if o.range[1]>o.range[2]then o.range={o.range[2],o.range[1]}end if
o.increment<=0 then o.increment=1 end o.value=if(n.value or n.Value)~=nil then(n.value or n.Value)elseif(n.currentValue
or n.CurrentValue)~=nil then(n.currentValue or n.CurrentValue)else o.range[1]o.value=c(o.range,o.increment,o.value)o.
_decimals=b(o.increment)o.flag=n.flag or n.Flag or(not o.forgetState and ah.deriveFlagFromName(o.name)or nil)o.window:
_registerControl(o)o.main=o.window:Create('Frame',{Size=UDim2.new(1,-20,0,65),BorderSizePixel=0,Name=o.name,
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=o.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})o.stroke=o.window:StyleElementBody(o.main)o._lastValue=o.value if not o.minimal then o:
_buildLabel()end o.track=o.window:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),Position=UDim2.new(1,-15,0.5,0),Size=
UDim2.fromOffset(222,14),BorderSizePixel=0,BackgroundTransparency=1,Parent=o.main},{BackgroundColor3='SliderBackground'}
)o.window:Create('UICorner',{CornerRadius=UDim.new(0,13),Parent=o.track})o.progress=o.window:Create('Frame',{AnchorPoint
=Vector2.new(0,0.5),Position=UDim2.fromScale(0,0.5),Size=UDim2.fromScale(0,1),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,ZIndex=2,BackgroundTransparency=1,Parent=o.track})o.window:Create('UICorner',{CornerRadius=UDim.
new(0,13),Parent=o.progress})o.window:Create('UIGradient',{Offset=Vector2.new(0,0.5),Rotation=2,Transparency=
NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),NumberSequenceKeypoint.new(1,0)},Parent=o.progress},{Color={
'SliderProgress',ah.toColorSequence}})o.progressGlow=o.window:CreateGlow(o.progress,'AccentColor',20,1)o.handle=o.window
:Create('Frame',{AnchorPoint=Vector2.new(0.5,0.5),Position=k(),Size=UDim2.fromOffset(h.X,h.Y),BorderSizePixel=0,ZIndex=
50,BackgroundTransparency=1,Parent=o.progress},{BackgroundColor3='SliderHandle'})o.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=o.handle})o.handleGlow=o.window:CreateGlow(o.handle,Color3.fromRGB(255,255,255),10,1)o
.handleStroke=o.window:Create('UIStroke',{Transparency=1,Parent=o.handle},{Color='SliderStroke'})o.interact=o.window:
Create('TextButton',{BackgroundTransparency=1,Size=UDim2.fromScale(1,1),Text='',TextTransparency=1,ZIndex=10,Parent=o.
track})o.window:ConnectFor(o,o.main.MouseEnter,function()if not o.window:_interactive()then return end ag.tweenService:
Create(o.track,d,{BackgroundColor3=o.window.theme.SliderBackgroundHover}):Play()end)o.window:ConnectFor(o,o.main.
MouseLeave,function()ag.tweenService:Create(o.track,d,{BackgroundColor3=o.window.theme.SliderBackground}):Play()end)o.
window:ConnectFor(o,o.interact.InputBegan,function(p)if p.UserInputType==Enum.UserInputType.MouseButton1 or p.
UserInputType==Enum.UserInputType.Touch then am.click()o.dragging=true o:_setHeld(true)o:_updateFromMouse()if o.
_dragConnection then o._dragConnection:Disconnect()o._dragConnection=nil end o._dragConnection=ag.runService.
RenderStepped:Connect(function()if o.window.unloaded or not o.dragging then if o._dragConnection then o._dragConnection:
Disconnect()o._dragConnection=nil end return end o:_updateFromMouse()end)end end)o.window:ConnectFor(o,ag.
userInputService.InputEnded,function(p)if p.UserInputType==Enum.UserInputType.MouseButton1 or p.UserInputType==Enum.
UserInputType.Touch then o:_endDrag()end end)o.window:ConnectFor(o,ag.userInputService.WindowFocusReleased,function()o:
_endDrag()end)if o.description and not o.minimal then o.descriptor=ac(ab.Parent.descriptor).new(o.tab,{description=o.
description})end o.window:ConnectFor(o,o.main:GetPropertyChangedSignal'AbsoluteSize',function()if o.window.animating or(
o.window.hidden and o.window.hasShownOnce)then return end o:_applyLayout()end)o:_applyLayout()if o.minimal then o.main.
Size=UDim2.new(1,-20,0,41)o.track.AnchorPoint=Vector2.new(0.5,0.5)o.track.Position=UDim2.new(0.5,0,0.5,0)o.track.Size=
UDim2.new(1,-30,0,14)end o:_renderProgress()return o end function ae._buildLabel(m)m.container=m.window:Create('Frame',{
AnchorPoint=Vector2.new(0,0.5),Position=UDim2.new(0,20,0.5,0),Size=UDim2.fromOffset(170,33),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=5,Parent=m.main})m.containerLayout=m.window:Create('UIListLayout',{Padding=UDim.new(0,2),
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.container})m.
titleContainer=m.window:Create('Frame',{Size=UDim2.new(1,0,0,16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=5,
Parent=m.container})m.window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,
VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=m.titleContainer})m.
titleFlex=m.window:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.None,Parent=m.titleContainer})if m.icon then m.
iconLabel=m.window:Create('ImageLabel',{Image=m.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,
BackgroundTransparency=1,ZIndex=5,ImageTransparency=1,Parent=m.titleContainer},{ImageColor3='ContentColor'})end m.title=
m.window:Create('TextLabel',{Text=al.t(m.name),Size=UDim2.new(1,0,0,16),BorderSizePixel=0,BackgroundTransparency=1,
TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,RichText=true,LayoutOrder=1,
ZIndex=5,TextTransparency=1,Parent=m.titleContainer},{TextColor3='ContentColor',FontFace='Font'})m.window:Create(
'UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=m.title})m.valueHost=m.window:Create('Frame',{Size=UDim2.new(1,0,0,
16),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=6,LayoutOrder=1,Parent=m.container})m.valueOdo=ai.new(m.window,m.
valueHost,{textSize=15,alignment=Enum.HorizontalAlignment.Left,transparency=1,duration=0.28})m.valueOdo:snap(m:_format(m
.value))end function ae._setMainHeight(m,n)if m._widthManaged then m.main.Size=UDim2.new(m.main.Size.X.Scale,m.main.Size
.X.Offset,0,n)else m.main.Size=UDim2.new(1,-20,0,n)end end function ae._applyLayout(m)if m.minimal then return end local
n=m.main.AbsoluteSize.X local o=if n>0 and n<g then'narrow'else'wide'if m._layoutMode==o then return end m._layoutMode=o
if o=='narrow'then m:_setMainHeight(70)m.container.AnchorPoint=Vector2.new(0,0)m.container.Position=UDim2.new(0,20,0,14)
m.container.Size=UDim2.new(1,-40,0,16)m.containerLayout.FillDirection=Enum.FillDirection.Horizontal m.titleFlex.FlexMode
=Enum.UIFlexMode.Fill m.valueHost.AutomaticSize=Enum.AutomaticSize.X m.valueHost.Size=UDim2.new(0,0,0,16)m.track.
AnchorPoint=Vector2.new(0.5,1)m.track.Position=UDim2.new(0.5,0,1,-14)m.track.Size=UDim2.new(1,-30,0,14)else m:
_setMainHeight(65)m.container.AnchorPoint=Vector2.new(0,0.5)m.container.Position=UDim2.new(0,20,0.5,0)m.container.Size=
UDim2.new(0,170,0,33)m.containerLayout.FillDirection=Enum.FillDirection.Vertical m.titleFlex.FlexMode=Enum.UIFlexMode.
None m.valueHost.AutomaticSize=Enum.AutomaticSize.None m.valueHost.Size=UDim2.new(1,0,0,16)m.track.AnchorPoint=Vector2.
new(1,0.5)m.track.Position=UDim2.new(1,-15,0.5,0)m.track.Size=UDim2.new(0,222,0,14)end end function ae._format(m,n)local
o=string.format('%.'..m._decimals..'f',n)if m.suffix~=''then return o..' '..m.suffix end return o end function ae.
_pillTravel(m)return math.max(m.track.AbsoluteSize.X,0)end function ae._renderProgress(m,n)local o=m.range[2]-m.range[1]
local p=if o~=0 then math.clamp((m.value-m.range[1])/o,0,1)else 0 local q=j(p)if n then ag.tweenService:Create(m.
progress,n,{Size=q}):Play()else m.progress.Size=q end end function ae._updateFromMouse(m)local n=m:_pillTravel()if n<=0
then return end local o=l(ag.userInputService:GetMouseLocation().X,m.track.AbsolutePosition.X,n)local p=c(m.range,m.
increment,m.range[1]+o*(m.range[2]-m.range[1]))if p~=m.value then m.value=p if m.valueOdo then m.valueOdo:snap(m:
_format(p))end m._lastValue=p m:_renderProgress(f)m:_fireCallback(p)end end function ae._endDrag(m)if not m.dragging
then return end m.dragging=false m:_setHeld(false)if m._dragConnection then m._dragConnection:Disconnect()m.
_dragConnection=nil end m.window:_persist(m)end function ae._setHeld(m,n)if not n then m:_fireCallback(m.value)end local
o=if n then i else h m._handleWidth=o.X ag.tweenService:Create(m.handle,e,{Size=UDim2.fromOffset(o.X,o.Y),
BackgroundTransparency=if n then 0.7 else 0}):Play()ag.tweenService:Create(m.handleStroke,e,{Transparency=if n then 0.6
else 1}):Play()m:_renderProgress(e)end function ae._fireCallback(m,n)m.window:_runGuarded(m,m.callback,n,m.dragging==
true)end function ae.Set(m,n,o)n=c(m.range,m.increment,n)m.value=n if m.valueOdo then m.valueOdo:to(m:_format(n),n>=(m.
_lastValue or n))end m._lastValue=n m:_renderProgress(d)if not o then m:_fireCallback(n)m.window:_persist(m)end end
local m=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(n,o,p
)local q=n.window if o then q:_revealCommon(n,p)q:_reveal(n.track,{BackgroundTransparency=0},p)q:_reveal(n.progress,{
BackgroundTransparency=0},p)q:_reveal(n.handle,{BackgroundTransparency=0},p)if n.valueOdo then n.valueOdo:reveal(0.3,p)
end q:_reveal(n.progressGlow,{Transparency=math.max(0.55,q.theme.AccentGlow)},p,m)q:_reveal(n.handleGlow,{Transparency=
0.8},p,m)else q:_hideCommon(n,p)q:_reveal(n.track,{BackgroundTransparency=1},p)q:_reveal(n.progress,{
BackgroundTransparency=1},p)q:_reveal(n.handle,{BackgroundTransparency=1},p)if n.valueOdo then n.valueOdo:reveal(1,p)end
q:_reveal(n.progressGlow,{Transparency=1},p,m)q:_reveal(n.handleGlow,{Transparency=1},p,m)end end function ae.
_refreshTheme(n)ag.tweenService:Create(n.progressGlow,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
,{Transparency=math.max(0.55,n.window.theme.AccentGlow)}):Play()end function ae._minWidth(n)if n.minimal then return 100
end local o=40 if n.icon then o+=22 end o+=ah.textWidth(n.window.theme.Font,16,al.resolve(n.name))o+=12 o+=ah.textWidth(
n.window.theme.Font,15,n:_format(n.value))return math.max(o,160)end aj(ae)ak(ae)return ae end)()end,[22]=function()local
aa,ab,ac=a(22)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Statistic'local af=ab.Parent.Parent.
utility local ag,ah,ai,aj,ak,al,am=ac(af.variables),ac(af.functions),ac(af.odometer),ac(af.moveable),ac(af.constants),
ac(af.locale),ac(af.log)local b,c,d,e=ak.statAccents,NumberSequence.new{NumberSequenceKeypoint.new(0,0.85),
NumberSequenceKeypoint.new(1,0)},41,TweenInfo.new(0.6,Enum.EasingStyle.Exponential)local function f(g)return g.fill.
Keypoints[1].Value end local function g(h)if h>0 then return string.format('+%.1f%%',h)elseif h<0 then return string.
format('%.1f%%',h)else return'0%'end end local function h(i)if typeof(i)~='number'then return tostring(i)end local j=
math.round(math.abs(i))local k=string.format('%.0f',j)local l=k:reverse():gsub('%d%d%d','%0,'):reverse()if l:sub(1,1)==
','then l=l:sub(2)end return if i<0 and j~=0 then'-'..l else l end local function i(j)local k=math.round(j)if k>0 then
return'+'..h(k)elseif k<0 then return h(k)else return'0'end end function ae.new(j,k)k=if typeof(k)=='table'then k else{}
local l=setmetatable({tab=assert(j,'Missing argument #1 (Tab expected)'),window=j.window,name=k.name or k.Name or
'Statistic',icon=k.icon or k.Icon,description=k.description or k.Description,value=if(k.value or k.Value)~=nil then(k.
value or k.Value)else 0,_hasValue=(k.value or k.Value)~=nil,numberEasing=if(k.numberEasing~=nil)then k.numberEasing
elseif k.NumberEasing~=nil then k.NumberEasing else true,changeMode=k.changeMode or k.ChangeMode or'percentage',
changeBaseline=k.changeBaseline or k.ChangeBaseline or'previous',prefix=k.prefix or k.Prefix or'',suffix=k.suffix or k.
Suffix or'',compact=k.compact or k.Compact or j.compact or false,display=(k.display or k.Display or'value'),
_initialValue=if(k.value or k.Value)~=nil then(k.value or k.Value)else nil,_lastChange=0},ae)if l.compact then l:
_buildCompact()else l:_buildFull()end if l.description then if l.compact then am.warn(`Rayfield: a compact stat has no room for a description, ignoring it on '{
l.name}'.`)else l.descriptor=ac(ab.Parent.descriptor).new(l.tab,{description=l.description})end end return l end
function ae._buildFull(j)local k=j.window j.main=k:Create('Frame',{Size=UDim2.new(1,-20,0,90),BorderSizePixel=0,Name=j.
name,ZIndex=5,BackgroundTransparency=1,Parent=j.tab.tabPage},{BackgroundColor3='StatBackground',BackgroundTransparency=
'ElementTransparency'})k:Create('UICorner',{Parent=j.main},{CornerRadius='ElementCornerRadius'})j.stroke=k:Create(
'UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=j.main},{Transparency='ElementStrokeTransparency'})j
.strokeGradient=k:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=b.neutral.stroke,Transparency=c,Parent
=j.stroke})j.titleContainer=k:Create('Frame',{Size=UDim2.new(1,-40,0,32),Position=UDim2.fromOffset(20,15),
BorderSizePixel=0,LayoutOrder=-1,BackgroundTransparency=1,ZIndex=5,Parent=j.main})j.gradientContainer=k:Create('Frame',{
Size=UDim2.fromScale(1,1),Position=UDim2.fromOffset(0,0),BorderSizePixel=0,BackgroundTransparency=1,BackgroundColor3=
Color3.fromRGB(255,255,255),ZIndex=5,Parent=j.main})j.glow=k:CreateGlow(j.main,f(b.neutral),13,1)j.title=k:Create(
'TextLabel',{Text=al.t(j.name),Size=UDim2.fromOffset(300,19),BorderSizePixel=0,BackgroundTransparency=1,TextSize=19,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,ZIndex=10,TextTransparency=1,Parent=j.
titleContainer},{TextColor3='ContentColor',FontFace='TitleFont'})j.mainGradient=k:Create('UIGradient',{Rotation=2,Offset
=Vector2.new(0,0.5),Color=b.neutral.fill,Transparency=c,Parent=j.gradientContainer})k:Create('UICorner',{Parent=j.
gradientContainer},{CornerRadius='ElementCornerRadius'})if j.icon then j.iconLabel=k:Create('ImageLabel',{Image=j.icon,
Size=UDim2.fromOffset(32,32),BorderSizePixel=0,BackgroundTransparency=1,ZIndex=10,ImageTransparency=1,Parent=j.
titleContainer},{ImageColor3='ContentColor'})end j.containerLayout=k:Create('UIListLayout',{Padding=UDim.new(0,8),
FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=j.titleContainer})j.valueHost=k:Create('Frame',{
AnchorPoint=Vector2.new(0,1),Position=UDim2.new(0,20,1,-15),Size=UDim2.fromOffset(200,20),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=10,Parent=j.main})j.changeHost=k:Create('Frame',{AnchorPoint=Vector2.new(1,1),Position=UDim2.
new(1,-20,1,-15),Size=UDim2.fromOffset(200,15),BackgroundTransparency=1,BorderSizePixel=0,ZIndex=10,Parent=j.main})j.
valueOdo=ai.new(k,j.valueHost,{textSize=20,alignment=Enum.HorizontalAlignment.Left,transparency=1})j.valueOdo:snap(j:
_formatValue(j.value))j.changeOdo=ai.new(k,j.changeHost,{textSize=15,alignment=Enum.HorizontalAlignment.Right,
transparency=1})j.changeOdo:snap(j:_formatChange(0))j._accentGradients={j.strokeGradient,j.mainGradient}end function ae.
_buildCompact(j)local k,l=j.window,j.tab.compact or false j.main=k:Create('Frame',{Name=j.name,Size=if l then UDim2.
fromOffset(0,d)else UDim2.new(1,-20,0,d),AutomaticSize=if l then Enum.AutomaticSize.X else Enum.AutomaticSize.None,
ClipsDescendants=true,BorderSizePixel=0,ZIndex=5,BackgroundTransparency=1,Parent=j.tab.tabPage},{BackgroundColor3=
'StatBackground',BackgroundTransparency='ElementTransparency'})k:Create('UICorner',{Parent=j.main},{CornerRadius=
'ElementCornerRadius'})j.stroke=k:Create('UIStroke',{Transparency=1,Color=Color3.fromRGB(255,255,255),Parent=j.main},{
Transparency='ElementStrokeTransparency'})j.strokeGradient=k:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),
Color=b.neutral.stroke,Transparency=c,Parent=j.stroke})if l then k:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Fill,
Parent=j.main})end k:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=j.main})j.card=k:Create('Frame',{AutomaticSize=
Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,d),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,ZIndex=5,
BackgroundTransparency=1,Parent=j.main})k:Create('UICorner',{Parent=j.card},{CornerRadius='ElementCornerRadius'})j.
mainGradient=k:Create('UIGradient',{Rotation=2,Offset=Vector2.new(0,0.5),Color=b.neutral.fill,Transparency=c,Parent=j.
card})k:Create('UIPadding',{PaddingLeft=UDim.new(0,15),PaddingRight=UDim.new(0,15),Parent=j.card})k:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim.new(0,10),Parent=j.card})j.titleContainer=k:Create('Frame'
,{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=
0,ZIndex=6,Parent=j.card})k:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=j.titleContainer})k:Create(
'UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=j
.titleContainer})if j.icon then j.iconLabel=k:Create('ImageLabel',{Image=j.icon,Size=UDim2.fromOffset(20,20),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ZIndex=6,ImageTransparency=1,Parent=j.titleContainer},{
ImageColor3='ContentColor'})end j.title=k:Create('TextLabel',{Text=al.t(j.name),Size=UDim2.fromOffset(0,16),
AutomaticSize=Enum.AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.
TextXAlignment.Left,TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,ZIndex=6,TextTransparency=1,Parent=j.
titleContainer},{TextColor3='ContentColor',FontFace='Font'})k:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,
Parent=j.title})j.readoutHost=k:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,18),
BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=1,ZIndex=6,Parent=j.card})j.readoutOdo=ai.new(k,j.readoutHost,{
textSize=17,alignment=Enum.HorizontalAlignment.Right,transparency=1})j.readoutOdo:snap(j.display=='change'and j:
_formatChange(0)or j:_formatValue(j.value))j._accentGradients={j.strokeGradient,j.mainGradient}end function ae.
_setAccent(j,k,l)local m=b[k]j.strokeGradient.Color=m.stroke j.mainGradient.Color=m.fill if j.glow then j.glow.Color=f(m
)end local n,o=if l==1 then 14 elseif l==-1 then-10 else 2,if l==1 then Vector2.new(0.04,0.5)elseif l==-1 then Vector2.
new(-4E-2,0.5)else Vector2.new(0,0.5)for p,q in j._accentGradients do ag.tweenService:Create(q,e,{Rotation=n,Offset=o}):
Play()end end function ae._formatValue(j,k)return j.prefix..h(k)..j.suffix end function ae._formatChange(j,k)if j.
changeMode=='absolute'then return i(k)else return g(k)end end function ae._showValue(j,k,l,m,n)if j.numberEasing and not
n then k:to(j:_formatValue(l),l>=m)else k:snap(j:_formatValue(l))end end function ae._updateFullReadouts(j,k,l,m,n,o,p)j
:_showValue(j.valueOdo,k,l,p)if o then j.changeOdo:snap(o)j._lastChange=0 elseif j.numberEasing and not n then j.
changeOdo:to(j:_formatChange(m),m>=j._lastChange)j._lastChange=m else j.changeOdo:snap(j:_formatChange(m or 0))j.
_lastChange=m or 0 end end function ae._updateCompactReadout(j,k,l,m,n,o,p)if j.display=='change'then if o then j.
readoutOdo:snap(o)j._lastChange=0 elseif j.numberEasing and not n then j.readoutOdo:to(j:_formatChange(m),m>=j.
_lastChange)j._lastChange=m else j.readoutOdo:snap(j:_formatChange(m or 0))j._lastChange=m or 0 end else j:_showValue(j.
readoutOdo,k,l,p)end end function ae.Set(j,k)assert(typeof(k)=='number','Statistic:Set() - value must be a number, got '
..typeof(k))local l,m=j.value,not j._hasValue j.value=k j._hasValue=true if m then j._initialValue=k end local n=if j.
changeBaseline=='initial'then j._initialValue else l local o,p,q,r,s=m or n==k if o then p=0 r='neutral's=0 elseif n==0
then local t,u=if k>0 then'+'else'-',if j.changeMode=='percentage'then'\u{221e}%'else'\u{221e}'q=t..u r=if k>0 then
'positive'else'negative's=if k>0 then 1 else-1 elseif j.changeMode=='percentage'then p=((k-n)/math.abs(n))*100 s=if p>0
then 1 elseif p<0 then-1 else 0 r=if s==1 then'positive'elseif s==-1 then'negative'else'neutral'else p=k-n s=if p>0 then
1 elseif p<0 then-1 else 0 r=if s==1 then'positive'elseif s==-1 then'negative'else'neutral'end j:_setAccent(r,s)if j.
compact then j:_updateCompactReadout(k,l,p,o,q,m)else j:_updateFullReadouts(k,l,p,o,q,m)end end function ae.
ResetBaseline(j,k)local l,m,n=j.value,not j._hasValue,if typeof(k)=='number'then k else j.value j._initialValue=n j.
value=n j._hasValue=true j._lastChange=0 if j.compact then if j.display=='change'then j.readoutOdo:snap(j:_formatChange(
0))else j:_showValue(j.readoutOdo,n,l,m)end else j.changeOdo:snap(j:_formatChange(0))j:_showValue(j.valueOdo,n,l,m)end j
:_setAccent('neutral',0)end function ae._setShown(j,k,l)local m=j.window if j.compact then m:_reveal(j.main,{
BackgroundTransparency=if k then(j.window.theme.ElementTransparency or 0)else 1},l)m:_reveal(j.stroke,{Transparency=if k
then j.window.theme.ElementStrokeTransparency else 1},l)m:_reveal(j.card,{BackgroundTransparency=if k then 0 else 1},l)m
:_reveal(j.title,{TextTransparency=if k then 0 else 1},l)if j.iconLabel then m:_reveal(j.iconLabel,{ImageTransparency=if
k then 0 else 1},l)end j.readoutOdo:reveal(if k then 0 else 1,l)return end if k then m:_revealCommon(j,l)m:_reveal(j.
gradientContainer,{BackgroundTransparency=0},l)m:_reveal(j.glow,{Transparency=0.82},l)j.valueOdo:reveal(0,l)j.changeOdo:
reveal(0,l)else m:_hideCommon(j,l)m:_reveal(j.gradientContainer,{BackgroundTransparency=1},l)m:_reveal(j.glow,{
Transparency=1},l)j.valueOdo:reveal(1,l)j.changeOdo:reveal(1,l)end end function ae._minWidth(j)local k=40 if j.icon then
k+=26 end k+=ah.textWidth(j.window.theme.Font,16,al.resolve(j.name))local l=if j.display=='change'then j:_formatChange(0
)else j:_formatValue(j.value)k+=ah.textWidth(j.window.theme.Font,17,l)return k end aj(ae)return ae end)()end,[23]=
function()local aa,ab,ac=a(23)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Tab'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak=ac(af.variables),ac(af.ordering),ac(af.HapticEngine),ac(ab.Parent.search),ac(ab.
Parent.tabSelector)local function al(am,b)for c,d in b do if d.__type=='Group'then al(am,d.elements)else am:
_unregisterControl(d)end if d.connections then for e,f in d.connections do am:Disconnect(f)end d.connections=nil end if
d._dragConnection then d._dragConnection:Disconnect()d._dragConnection=nil end if am._recordingKeybind==d then am.
_recordingKeybind=nil end if d._outsideClickConn then am:Disconnect(d._outsideClickConn)d._outsideClickConn=nil end end
end local am,b=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.25,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out)function ae.new(c,d)d=if typeof(d)=='table'then d else{}local e=setmetatable({window=
assert(c,'Missing argument #1 (Window expected)'),name=d.name or d.Name,icon=d.icon or d.Icon,neglectSelector=d.
neglectSelector or d.NeglectSelector or false,customOrder=d.customOrder or d.CustomOrder or 0,forgetState=d.forgetState
or d.ForgetState or false,elements={},connections={}},ae)assert(e.name or e.icon,'A tab needs a name or an icon.')if not
e.neglectSelector then ak.build(e,e.window.layout)end e.tabPage=e.window:Create('ScrollingFrame',{Name=e.name,Size=UDim2
.new(1,-20,1,0),Position=UDim2.new(0.5,0,0,68),AnchorPoint=Vector2.new(0.5,0.5),BorderSizePixel=0,BackgroundTransparency
=1,AutomaticCanvasSize=Enum.AutomaticSize.Y,CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollingDirection=Enum.
ScrollingDirection.Y,LayoutOrder=e.customOrder or 0,Parent=e.window.elements})e.tabPageLayout=e.window:Create(
'UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment
.Top,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=e.tabPage})e.window
:Create('UIPadding',{PaddingTop=UDim.new(0,10),PaddingBottom=UDim.new(0,33),Parent=e.tabPage})if not e.neglectSelector
then table.insert(e.connections,e.window:Connect(e.topbarItemInteract.MouseButton1Click,function()ai.click()e:Select()
end))table.insert(e.connections,e.window:Connect(e.topbarItemInteract.MouseEnter,function()if not e.window:_interactive(
)then return end if e.window.selectedTab~=e then e:_applyVisual('hover',b)e:_spinGradients()end end))table.insert(e.
connections,e.window:Connect(e.topbarItemInteract.MouseLeave,function()if e.window.selectedTab~=e then e:_applyVisual(
'unselected',b)end end))end return e end function ae._applyVisual(c,d,e)if c.neglectSelector or not c.topbarItem then
return end local f=ak.states[c.window.layout.mode][d]if not f then return end ak.applyVisual(c,f,e)end function ae.
_spinGradients(c)if c.neglectSelector then return end local d=TweenInfo.new(0.7,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out)for e,f in{c.topbarItemGradient,c.topbarItemStrokeGradient}do f.Rotation=-270 ag.tweenService:
Create(f,d,{Rotation=90}):Play()end end function ae.Select(c,d)if c.window._searching then aj.close(c.window,{showTabs=
true,jumpTo=false})end c.window.selectedTab=c c.window:_jumpTo(c.tabPage)local e=d or not c.window:_interactive()if not
c.neglectSelector and not e then c:_applyVisual('selected',am)end for f,g in c.window.tabs do if g~=c.window.selectedTab
then g:Deselect(e)end end if c~=c.window.rfSettings and c.window.settingsAction and not e then ag.tweenService:Create(c.
window.settingsAction.iconLabel,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{ImageTransparency=
0.6}):Play()end end function ae.Deselect(c,d)if not c.neglectSelector and not d then c:_applyVisual('unselected',am)end
end function ae._register(c,d)table.insert(c.elements,d)ah(d,#c.elements*10)c.window:_restoreLate(d)if not c.window.
hidden then d:_setShown(true,true)end return d end function ae.CreateButton(c,d)return c:_register(ac(ab.Parent.button).
new(c,d))end function ae.CreateToggle(c,d)return c:_register(ac(ab.Parent.toggle).new(c,d))end function ae.CreateSwitch(
c,d)return c:CreateToggle(d)end function ae.CreateSection(c,d)return c:_register(ac(ab.Parent.section).new(c,d))end
function ae.CreateText(c,d)return c:_register(ac(ab.Parent.text).new(c,d))end function ae.CreateDivider(c,d)return c:
_register(ac(ab.Parent.divider).new(c,d))end function ae.CreateProgress(c,d)return c:_register(ac(ab.Parent.progress).
new(c,d))end function ae.CreateConsole(c,d)return c:_register(ac(ab.Parent.console).new(c,d))end function ae.CreateStat(
c,d)return c:_register(ac(ab.Parent.stat).new(c,d))end function ae.CreateSlider(c,d)return c:_register(ac(ab.Parent.
slider).new(c,d))end function ae.CreateDropdown(c,d)return c:_register(ac(ab.Parent.dropdown).new(c,d))end function ae.
CreateInput(c,d)return c:_register(ac(ab.Parent.input).new(c,d))end function ae.CreateKeybind(c,d)return c:_register(ac(
ab.Parent.keybind).new(c,d))end function ae.CreateColorPicker(c,d)return c:_register(ac(ab.Parent.colorpicker).new(c,d))
end function ae.CreateGroup(c,d)return c:_register(ac(ab.Parent.group).new(c,d))end function ae._moveElement(c,d,e)local
f=table.find(c.elements,d)if not f then return end table.remove(c.elements,f)e=math.clamp(e,1,#c.elements+1)table.
insert(c.elements,e,d)for g,h in c.elements do ah(h,g*10)end end function ae.Remove(c)local d=c.window if d._searching
then aj.close(d,{showTabs=true,jumpTo=d.selectedTab and d.selectedTab.tabPage})end local e=table.find(d.tabs,c)if e then
table.remove(d.tabs,e)end if d.selectedTab==c then d.selectedTab=nil for f,g in ipairs(d.tabs)do if not g.
neglectSelector then g:Select()break end end end al(d,c.elements)for f,g in c.connections do d:Disconnect(g)end c.
connections={}if c.topbarItem then d:DestroySubtree(c.topbarItem)end if c.tabPage then d:DestroySubtree(c.tabPage)end c.
topbarItem=nil c.tabPage=nil c.elements={}end return ae end)()end,[24]=function()local aa,ab,ac=a(24)local ad return(
function(...)local ae={}ae.__index=ae ae.__type='TabSection'local af,ag,ah,ai,aj=ac(ab.Parent.Parent.utility.locale),ac(
ab.Parent.Parent.utility.log),20,6,3 local function ak(al)for am,b in al.tabs do if not b.neglectSelector then return
true end end return#al.tabSections>0 end function ae.new(al,am)am=if typeof(am)=='table'then am else{}local b=
setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),name=am.name or am.Name or'Section',icon=am.icon
or am.Icon},ae)if al.layout.mode~='sidebar'then if not al._warnedTabSection then al._warnedTabSection=true ag.warn
[[Rayfield: Window:CreateSection needs the sidebar layout; it does nothing on the top strip.]]end b.inert=true return b
end b.main=al:Create('Frame',{Name=b.name,Size=UDim2.new(1,-ah*2,0,0),AutomaticSize=Enum.AutomaticSize.Y,
BackgroundTransparency=1,BorderSizePixel=0,Visible=false,Parent=al.tabList})b.padding=al:Create('UIPadding',{PaddingTop=
UDim.new(0,if ak(al)then ai else 0),PaddingBottom=UDim.new(0,aj),Parent=b.main})al:Create('UIListLayout',{FillDirection=
Enum.FillDirection.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,HorizontalAlignment=Enum.
HorizontalAlignment.Left,VerticalAlignment=Enum.VerticalAlignment.Top,Parent=b.main})if b.icon then b.iconLabel=al:
Create('ImageLabel',{Image=b.icon,Size=UDim2.fromOffset(16,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,
ImageTransparency=1,Parent=b.main},{ImageColor3='ContentColor'})end b.title=al:Create('TextLabel',{Text=af.t(b.name),
Size=UDim2.fromOffset(0,15),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=15,
TextXAlignment=Enum.TextXAlignment.Left,TextYAlignment=Enum.TextYAlignment.Bottom,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=b.main},{TextColor3='ContentColor',FontFace='Font'})return b end function ae._setShown(al,am,b
)if not al.main then return end local c=al.window c:_reveal(al.title,{TextTransparency=if am then 0.6 else 1},b)if al.
iconLabel then c:_reveal(al.iconLabel,{ImageTransparency=if am then 0.65 else 1},b)end end function ae._setVisible(al,am
)if al.main then al.main.Visible=am end end function ae.Remove(al)local am=table.find(al.window.tabSections,al)if am
then table.remove(al.window.tabSections,am)end al.window:DestroySubtree(al.main)al.main=nil end return ae end)()end,[25]
=function()local aa,ab,ac=a(25)local ad return(function(...)local ae=ab.Parent.Parent.utility local af,ag,ah,ai=ac(ae.
variables),ac(ae.functions),ac(ae.locale),{}local function aj(ak:string?):string if type(ak)~='string'or ak==''then
return'?'end local al=utf8.offset(ak,2)local am=if al then string.sub(ak,1,al-1)else ak return string.upper(am)end ai.
states={top={selected={background=0,stroke=0,content=0},hover={background=0.4,stroke=0.3,content=0.3},unselected={
background=0.8,stroke=0.65,content=0.5},hidden={background=1,stroke=1,content=1}},sidebar={selected={background=0.4,
stroke=0.5,content=0,shadow=0.8},hover={background=0.7,stroke=0.8,content=0.3,shadow=1},unselected={background=1,stroke=
1,content=0.5,shadow=1},hidden={background=1,stroke=1,content=1,shadow=1}}}local function ak(al,am,b)al.
topbarItemGradient=al.window:Create('UIGradient',{Rotation=90,Parent=am},{Color={'TabBackground',ag.toColorSequence}})al
.topbarItemStrokeGradient=al.window:Create('UIGradient',{Rotation=90,Parent=b},{Color={'TabStroke',ag.toColorSequence}})
end local function al(am,b,c)if c and not am.icon then am.topbarItemInitial=am.window:Create('TextLabel',{Text=aj(am.
name),Size=UDim2.fromOffset(b,b),BorderSizePixel=0,BackgroundTransparency=1,TextSize=b-4,TextXAlignment=Enum.
TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Visible=false,TextTransparency=1,Parent=am.
topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end if am.icon then am.topbarItemIcon=am.window:Create(
'ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(b,b),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,
Parent=am.topbarItemContainer},{ImageColor3='TabColor'})end if am.name then am.topbarItemTitle=am.window:Create(
'TextLabel',{Text=ah.t(am.name),Size=UDim2.fromOffset(0,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,
AutomaticSize=Enum.AutomaticSize.XY,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,
TextTransparency=1,Parent=am.topbarItemContainer},{TextColor3='TabColor',FontFace='Font'})end end local function am(b)b.
topbarItem=b.window:Create('Frame',{Name=b.name,Size=UDim2.fromOffset(0,34),AutomaticSize=Enum.AutomaticSize.X,
BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Visible=false,LayoutOrder=b.
customOrder or 0,Parent=b.window.tabList})b.topbarItemInteract=b.window:Create('TextButton',{Active=false,
BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,Parent=b.topbarItem})b.
window:Create('UICorner',{Parent=b.topbarItem},{CornerRadius='PillCornerRadius'})b.topbarItemStroke=b.window:Create(
'UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=b.
topbarItem})ak(b,b.topbarItem,b.topbarItemStroke)b.topbarItemContainer=b.window:Create('Frame',{Size=UDim2.fromOffset(0,
34),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,Parent=b.topbarItem})b.window:Create(
'UIPadding',{PaddingLeft=UDim.new(0,13),PaddingRight=UDim.new(0,14),Parent=b.topbarItemContainer})b.topbarItemLayout=b.
window:Create('UIListLayout',{Padding=UDim.new(0,6),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent
=b.topbarItemContainer})al(b,16,false)end local function b(c,d)c.topbarItem=c.window:Create('Frame',{Name=c.name,Size=
UDim2.new(1,-d.rowInset*2,0,d.rowHeight),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
BackgroundTransparency=1,Visible=false,LayoutOrder=c.customOrder or 0,Parent=c.window.tabList})c.topbarItemInteract=c.
window:Create('TextButton',{Active=false,BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',
TextTransparency=1,Parent=c.topbarItem})c.window:Create('UICorner',{CornerRadius=UDim.new(0,d.rowCornerRadius),Parent=c.
topbarItem})c.topbarItemStroke=c.window:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Color=Color3.
fromRGB(255,255,255),Transparency=1,Parent=c.topbarItem})ak(c,c.topbarItem,c.topbarItemStroke)c.topbarItemShadow=c.
window:Create('UIShadow',{BlurRadius=UDim.new(0,20),Color=Color3.fromRGB(255,255,255),Offset=UDim2.new(0,0,0,-15),Spread
=UDim2.new(0,10,0,-30),ZIndex=-1,Transparency=1,Parent=c.topbarItem})c.topbarItemContainer=c.window:Create('Frame',{Size
=UDim2.new(1,-d.rowPadding,0,24),Position=UDim2.new(0,d.rowPadding,0.5,0),AnchorPoint=Vector2.new(0,0.5),
BackgroundTransparency=1,BorderSizePixel=0,Parent=c.topbarItem})c.topbarItemLayout=c.window:Create('UIListLayout',{
Padding=UDim.new(0,d.rowContentSpacing),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=c
.topbarItemContainer})al(c,d.rowIconSize,true)end function ai.build(c,d)if d.mode=='sidebar'then b(c,d)else am(c)end end
function ai.setRowCollapsed(c,d,e)if e.mode~='sidebar'or not c.topbarItem then return end if c.topbarItemTitle then c.
topbarItemTitle.Visible=not d end if c.topbarItemInitial then c.topbarItemInitial.Visible=d end local f=if d then 0 else
e.rowPadding c.topbarItemContainer.Size=UDim2.new(1,-f,0,24)c.topbarItemContainer.Position=UDim2.new(0,f,0.5,0)c.
topbarItemLayout.HorizontalAlignment=if d then Enum.HorizontalAlignment.Center else Enum.HorizontalAlignment.Left end
function ai.applyVisual(c,d,e)local f={[c.topbarItem]={BackgroundTransparency=d.background},[c.topbarItemStroke]={
Transparency=d.stroke}}if c.topbarItemIcon then f[c.topbarItemIcon]={ImageTransparency=d.content}end if c.
topbarItemTitle then f[c.topbarItemTitle]={TextTransparency=d.content}end if c.topbarItemInitial then f[c.
topbarItemInitial]={TextTransparency=d.content}end if c.topbarItemShadow and d.shadow then f[c.topbarItemShadow]={
Transparency=d.shadow}end for g,h in f do if e then af.tweenService:Create(g,e,h):Play()else for i,j in h do g[i]=j end
end end end return ai end)()end,[26]=function()local aa,ab,ac=a(26)local ad return(function(...)local ae={}ae.__index=ae
ae.__type='Tag'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak=ac(af.variables),ac(af.functions),ac(af.image),
Color3.fromRGB(255,175,15),TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)function ae.new(al,am)am=
if typeof(am)=='table'then am else{}local b=setmetatable({window=assert(al,'Missing argument #1 (Window expected)'),text
=am.text or am.Text or am.title or am.Title,icon=am.icon or am.Icon,color=am.color or am.Color or aj},ae)assert(b.icon
or(b.text and b.text~=''),'A Tag requires an icon, text, or both.')b.main=b.window:Create('Frame',{Name='Tag',Size=UDim2
.fromOffset(10,24),AutomaticSize=Enum.AutomaticSize.X,BackgroundColor3=b.color,BorderSizePixel=0,LayoutOrder=am.order or
am.Order or 0,BackgroundTransparency=1,Parent=b.window.tagContainer})b.window:Create('UICorner',{CornerRadius=UDim.new(1
,0),Parent=b.main})b.window:Create('UIPadding',{PaddingLeft=UDim.new(0,10),PaddingRight=UDim.new(0,10),Parent=b.main})b.
window:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=b.main})local c=ah.contrastColor(b.color)b.
iconLabel=b.window:Create('ImageLabel',{Name='Icon',Image=b.icon or'',ImageColor3=c,Size=UDim2.fromOffset(16,16),
BackgroundTransparency=1,Visible=b.icon~=nil,ZIndex=5,ImageTransparency=1,Parent=b.main})b.title=b.window:Create(
'TextLabel',{Name='Title',AnchorPoint=Vector2.new(0,0.5),Size=UDim2.fromOffset(10,15),AutomaticSize=Enum.AutomaticSize.X
,BackgroundTransparency=1,Text=b.text or'',TextColor3=c,TextSize=15,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=
true,RichText=true,Visible=b.text~=nil and b.text~='',LayoutOrder=1,ZIndex=5,TextTransparency=1,Parent=b.main},{FontFace
='Font'})b.window.tagContainer.Visible=true if not b.window.hidden then b:_setShown(true,ak)end return b end function ae
._setShown(al,am,b)local c,d=if am then 0 else 1,if typeof(b)=='TweenInfo'then b elseif b then ak else nil if d then ag.
tweenService:Create(al.main,d,{BackgroundTransparency=c}):Play()ag.tweenService:Create(al.iconLabel,d,{ImageTransparency
=c}):Play()ag.tweenService:Create(al.title,d,{TextTransparency=c}):Play()else al.main.BackgroundTransparency=c al.
iconLabel.ImageTransparency=c al.title.TextTransparency=c end end function ae.SetColor(al,am)al.color=am local b=ah.
contrastColor(am)ag.tweenService:Create(al.main,ak,{BackgroundColor3=am}):Play()ag.tweenService:Create(al.iconLabel,ak,{
ImageColor3=b}):Play()ag.tweenService:Create(al.title,ak,{TextColor3=b}):Play()end function ae.SetText(al,am)al.text=am
al.title.Text=am or''al.title.Visible=am~=nil and am~=''end function ae.SetIcon(al,am)al.icon=am ai.assign(al.iconLabel,
'Image',am)al.iconLabel.Visible=am~=nil end function ae.Set(al,am)if am.color or am.Color then al:SetColor(am.color or
am.Color)end if am.text or am.Text or am.title or am.Title then al:SetText(am.text or am.Text or am.title or am.Title)
end if am.icon~=nil or am.Icon~=nil then al:SetIcon(am.icon or am.Icon)end end function ae.Remove(al)al.window:
DestroySubtree(al.main)local am=table.find(al.window.tags,al)if am then table.remove(al.window.tags,am)end if#al.window.
tags==0 then al.window.tagContainer.Visible=false end end return ae end)()end,[27]=function()local aa,ab,ac=a(27)local
ad return(function(...)local ae={}ae.__index=ae ae.__type='Text'local af,ag,ah,ai,aj=ac(ab.Parent.Parent.utility.
moveable),ac(ab.Parent.Parent.utility.locale),16,14,0.45 function ae.new(ak,al)al=if typeof(al)=='table'then al else{}
local am=setmetatable({tab=assert(ak,'Missing argument #1 (Tab expected)'),window=ak.window,name=tostring(al.name or al.
Name or''),text=tostring(al.text or al.Text or''),icon=al.icon or al.Icon},ae)am.main=am.window:Create('Frame',{Size=
UDim2.new(1,-20,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,Name=if am.name~=''then am.name else'Text',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{BackgroundTransparency=
'ElementTransparency'})am.stroke=am.window:StyleElementBody(am.main)am.window:Create('UIPadding',{PaddingTop=UDim.new(0,
14),PaddingBottom=UDim.new(0,14),PaddingLeft=UDim.new(0,20),PaddingRight=UDim.new(0,20),Parent=am.main})am.window:
Create('UIListLayout',{Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,Parent=am.main})am.titleRow=am.window:
Create('Frame',{Name='Title',Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.AutomaticSize.Y,BorderSizePixel=0,
BackgroundTransparency=1,LayoutOrder=1,Parent=am.main})am.window:Create('UIListLayout',{FillDirection=Enum.FillDirection
.Horizontal,Padding=UDim.new(0,6),SortOrder=Enum.SortOrder.LayoutOrder,VerticalAlignment=Enum.VerticalAlignment.Top,
Parent=am.titleRow})if am.icon then am.iconLabel=am.window:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,
16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,Parent=am.titleRow},{ImageColor3='ContentColor'})end
am.title=am.window:Create('TextLabel',{Text=ag.t(am.name),Size=UDim2.new(1,if am.icon then-22 else 0,0,0),AutomaticSize=
Enum.AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ah,TextWrapped=true,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=1,TextTransparency=1,Parent=am.titleRow},{TextColor3='TitlingColor',
FontFace='Font'})am.body=am.window:Create('TextLabel',{Text=ag.t(am.text),Size=UDim2.new(1,0,0,0),AutomaticSize=Enum.
AutomaticSize.Y,BorderSizePixel=0,BackgroundTransparency=1,RichText=true,TextSize=ai,TextWrapped=true,TextXAlignment=
Enum.TextXAlignment.Left,LayoutOrder=2,TextTransparency=1,Parent=am.main},{TextColor3='ContentColor',FontFace='Font'})am
:_applyPresence()return am end function ae._applyPresence(ak)ak.titleRow.Visible=ak.name~=''or ak.icon~=nil ak.body.
Visible=ak.text~=''end function ae.Set(ak,al)ak.text=tostring(al)ak.window:_bindLocale(ak.body,'Text',ak.text)ak:
_applyPresence()end function ae.SetTitle(ak,al)ak.name=tostring(al)ak.window:_bindLocale(ak.title,'Text',ak.name)ak:
_applyPresence()end function ae._setShown(ak,al,am)if al then ak.window:_revealCommon(ak,am)else ak.window:_hideCommon(
ak,am)end ak.window:_reveal(ak.body,{TextTransparency=if al then aj else 1},am)end af(ae)return ae end)()end,[28]=
function()local aa,ab,ac=a(28)local ad return(function(...)local ae={}ae.__index=ae ae.__type='Toast'local af=ab.Parent.
Parent.utility local ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r=ac(af.variables),ac(af.functions),ac(af.
constants),ac(af.image),ac(af.HapticEngine),TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),
TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.3,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),24,32,18,18,10,28,12,8,140,320,6,UDim2.new(0.5,0,0.5,-180),UDim2.
new(0.5,0,0.5,180),UDim2.new(0.5,0,0.5,0)local function s(t)return math.clamp(#t*0.06+3,3,9)end local function t(u)if
type(u)=='number'then return'rbxassetid://'..tostring(u)end return u end function ae.new(u,v,w)v=if typeof(v)=='table'
then v else{}local x=setmetatable({window=assert(u,'Missing argument #1 (Window expected)'),title=v.title or v.Title or
'',subtitle=v.subtitle or v.Subtitle,icon=v.icon or v.Icon,avatar=v.avatar or v.Avatar,minWidth=v.minWidth or v.MinWidth
,subtitleAbove=v.subtitleAbove or v.SubtitleAbove or false,position=v.position or'Top',_hovered=false,_dismissed=false},
ae)x.duration=v.duration or v.Duration or s(x.title..(x.subtitle or''))local y=x.avatar~=nil and x.avatar~=0 local z=y
or(x.icon~=nil and x.icon~=0 and x.icon~='')x._iconImage=if y then aj.avatar(x.avatar,function(A)if x.iconLabel and not
x._dismissed and x.main.Parent then aj.assign(x.iconLabel,'Image',A)end end)elseif z then t(x.icon)else nil x._iconSize=
if y then f else e x._leftPad=if y then i else g x._rightPad=if y then j else h x._minWidth=math.clamp(x.minWidth or 0,m
,n)local A=x.subtitle~=nil and x.subtitle~=''x.main=x.window:Create('Frame',{Name='Toast',BackgroundTransparency=1,Size=
UDim2.new(0,0,0,0),BorderSizePixel=0,ZIndex=ai.zIndex.toast,Parent=w or x.window.toasts})x.window:Create('UIPadding',{
PaddingTop=UDim.new(0,l),Parent=x.main})x.body=x.window:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),
Size=UDim2.new(1,0,1,0),Position=if x.position=='Bottom'then q else p,AnchorPoint=Vector2.new(0.5,0.5),Active=true,
BorderSizePixel=0,ZIndex=ai.zIndex.toast,BackgroundTransparency=1,Parent=x.main})x.window:Create('UIGradient',{Rotation=
270,Offset=Vector2.new(0,-0.1),Parent=x.body},{Color={'WindowColor',ah.toColorSequence}})x.window:Create('UICorner',{
CornerRadius=UDim.new(1,0),Parent=x.body})x.stroke=x.window:Create('UIStroke',{Transparency=1,Parent=x.body},{Color=
'SurfaceStroke'})x.shadow=x.window:CreateGlow(x.body,'ShadowColor',20,1)x.window:Create('UIPadding',{PaddingLeft=UDim.
new(0,x._leftPad),PaddingRight=UDim.new(0,x._rightPad),Parent=x.body})x.window:Create('UIListLayout',{FillDirection=Enum
.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,k),Parent=x.body})if z then x.iconLabel=x.window:Create(
'ImageLabel',{Image=x._iconImage,Size=UDim2.fromOffset(x._iconSize,x._iconSize),BackgroundColor3=Color3.fromRGB(255,255,
255),BorderSizePixel=0,LayoutOrder=1,ZIndex=ai.zIndex.toastContent,BackgroundTransparency=1,ImageTransparency=1,Parent=x
.body},if y then nil else{ImageColor3='ContentColor'})x.window:Create('UICorner',{CornerRadius=UDim.new(1,0),Parent=x.
iconLabel})end x.container=x.window:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,A and 32
or 16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=2,ZIndex=ai.zIndex.toastContent,Parent=x.body})x.window:
Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,1),Parent=x.container})x.titleLabel=x.window:Create('TextLabel',
{Text=x.title,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,16),BackgroundTransparency=1,TextSize=16,
TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if x.subtitleAbove then 2 else 1,ZIndex=ai.zIndex.toastContent,
TextTransparency=1,Parent=x.container},{TextColor3='ContentColor',FontFace='TitleFont'})if A then x.subtitleLabel=x.
window:Create('TextLabel',{Text=x.subtitle,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,14),
BackgroundTransparency=1,TextSize=14,TextXAlignment=Enum.TextXAlignment.Left,LayoutOrder=if x.subtitleAbove then 1 else
2,ZIndex=ai.zIndex.toastContent,TextTransparency=1,Parent=x.container},{TextColor3='ContentColor',FontFace='Font'})end x
.window._toastCount=(x.window._toastCount or 0)+1 x.main.LayoutOrder=-x.window._toastCount local B=x.window._liveToasts
if not B then B={}x.window._liveToasts=B end local C=B[x.main.Parent]if not C then C={}B[x.main.Parent]=C end x._live=C
table.insert(C,x)while#C>o do local D=table.remove(C,1)if D and D~=x then task.spawn(D._dismiss,D)end end x._connections
={x.window:Connect(x.body.MouseEnter,function()x._hovered=true end),x.window:Connect(x.body.MouseLeave,function()x.
_hovered=false end),x.window:Connect(x.body.InputBegan,function(D)if D.UserInputType==Enum.UserInputType.MouseButton1 or
D.UserInputType==Enum.UserInputType.Touch then x:_dismiss()end end)}task.spawn(function()x:_show()end)return x end
function ae._measure(u)local v,w=ah.textWidth(u.window.theme.TitleFont,16,u.title),if u.subtitleLabel then ah.textWidth(
u.window.theme.Font,14,u.subtitle)else 0 local x,y=math.max(v,w),if u.iconLabel then u._leftPad+u._iconSize+k else u.
_leftPad local z=math.clamp(y+x+u._rightPad,u._minWidth,n)if y+x+u._rightPad>n then local A=n-y-u._rightPad for B,C in{u
.titleLabel,u.subtitleLabel}do if C then C.AutomaticSize=Enum.AutomaticSize.None C.TextTruncate=Enum.TextTruncate.AtEnd
C.Size=UDim2.fromOffset(A,C.Size.Y.Offset)end end end local A=if u.subtitleLabel then 31 else 16 local B=math.max(A,if u
.iconLabel then u._iconSize else 0)+18 return z,B end function ae._show(u)if not u.main.Parent then return end ak.
notify()local v,w=u:_measure()if u._dismissed or not u.main.Parent then return end u.main.Size=UDim2.new(0,v,0,0)ag.
tweenService:Create(u.main,am,{Size=UDim2.new(0,v,0,w+l)}):Play()ag.tweenService:Create(u.body,al,{Position=r}):Play()ag
.tweenService:Create(u.body,b,{BackgroundTransparency=0}):Play()ag.tweenService:Create(u.stroke,b,{Transparency=0.9}):
Play()ag.tweenService:Create(u.shadow,c,{Transparency=0.6}):Play()ag.tweenService:Create(u.titleLabel,c,{
TextTransparency=0}):Play()task.wait(0.05)if u._dismissed or not u.main.Parent then return end if u.iconLabel then ag.
tweenService:Create(u.iconLabel,c,{BackgroundTransparency=0.95}):Play()ag.tweenService:Create(u.iconLabel,c,{
ImageTransparency=0}):Play()end task.wait(0.05)if u._dismissed or not u.main.Parent then return end if u.subtitleLabel
then ag.tweenService:Create(u.subtitleLabel,c,{TextTransparency=0.5}):Play()end local x=0 while x<u.duration and not u.
_dismissed and u.main.Parent do local y=task.wait()if not u._hovered then x+=y end end u:_dismiss()end function ae.
_dismiss(u)if u._dismissed then return end u._dismissed=true local v=u._live local w=v and table.find(v,u)if v and w
then table.remove(v,w)end if not u.main.Parent then return end ag.tweenService:Create(u.body,b,{BackgroundTransparency=1
}):Play()ag.tweenService:Create(u.stroke,b,{Transparency=1}):Play()ag.tweenService:Create(u.shadow,c,{Transparency=1}):
Play()ag.tweenService:Create(u.titleLabel,c,{TextTransparency=1}):Play()if u.subtitleLabel then ag.tweenService:Create(u
.subtitleLabel,c,{TextTransparency=1}):Play()end if u.iconLabel then ag.tweenService:Create(u.iconLabel,c,{
ImageTransparency=1,BackgroundTransparency=1}):Play()end ag.tweenService:Create(u.body,d,{Size=UDim2.new(1,-60,1,0)}):
Play()local x=ag.tweenService:Create(u.main,d,{Size=UDim2.new(0,u.main.Size.X.Offset,0,0)})x:Play()x.Completed:Wait()if
not u.main.Parent then return end for y,z in u._connections do u.window:Disconnect(z)end u.window:DestroySubtree(u.main)
end return ae end)()end,[29]=function()local aa,ab,ac=a(29)local ad return(function(...)local ae={}ae.__index=ae ae.
__type='Toggle'local af=ab.Parent.Parent.utility local ag,ah,ai,aj,ak,al=ac(af.variables),ac(af.functions),ac(af.
moveable),ac(af.lockable),ac(af.locale),ac(af.HapticEngine)function ae.new(am,b)b=if typeof(b)=='table'then b else{}
local c=setmetatable({tab=assert(am,'Missing argument #1 (Tab expected)'),window=am.window,name=b.name or b.Name or
'Switch',icon=b.icon or b.Icon,description=b.description or b.Description,forgetState=b.forgetState or b.ForgetState or
am.forgetState,compact=am.compact or false,flag=b.flag or b.Flag or(not(b.forgetState or b.ForgetState or am.forgetState
)and ah.deriveFlagFromName(b.name or b.Name or'Switch')or nil),callback=b.callback or b.Callback or function()end,value=
if(b.value or b.Value)~=nil then(b.value or b.Value)else false},ae)c.window:_registerControl(c)if c.compact then c:
_buildCompact()else c:_buildFull()end if c.description and not c.compact then c.descriptor=ac(ab.Parent.descriptor).new(
c.tab,{description=c.description})end return c end function ae._buildSwitch(am,b)local c=am.window am.functionContainer=
c:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromOffset(50,21),BackgroundTransparency=1,Parent=b},{BackgroundColor3=
'ToggleTrack'})c:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=am.functionContainer})am.containerStroke=c:
Create('UIStroke',{Transparency=1,Parent=am.functionContainer},{Color='SurfaceStroke'})am.indicator=c:Create('Frame',{
BorderSizePixel=0,Size=UDim2.fromOffset(25,17),Position=am.value and UDim2.new(1,-28,0.5,0)or UDim2.new(1,-47,0.5,0),
AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=am.value and am.window.theme.AccentColor or am.window.theme.
ToggleKnobOff,BackgroundTransparency=1,Parent=am.functionContainer})c:Create('UICorner',{CornerRadius=UDim.new(1,0),
Parent=am.indicator})am.indicatorStroke=c:Create('UIStroke',{Color=am.value and am.window.theme.AccentStroke or Color3.
fromRGB(255,255,255),Transparency=1,Parent=am.indicator})am.indicatorGlow=c:CreateGlow(am.indicator,'AccentColor',20,1)
am.overlay=c:Create('Frame',{BorderSizePixel=0,Size=UDim2.fromScale(1,1),Position=UDim2.fromScale(0,0),AnchorPoint=
Vector2.new(0,0),BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.functionContainer},{
Visible='DarkToggleOverlay'})c:Create('UICorner',{CornerRadius=UDim.new(0,15),Parent=am.overlay})am.overlayGradient=c:
Create('UIGradient',{Rotation=90,Color=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,30,30)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(30,30,30))},Transparency=NumberSequence.new{NumberSequenceKeypoint.new(0,1),
NumberSequenceKeypoint.new(1,0.35)},Parent=am.overlay})return am.functionContainer end function ae._performToggle(am)al.
click()am.value=not am.value am:_animateIndicator()am.window:_runGuarded(am,am.callback,am.value)am.window:_persist(am)
end function ae._buildFull(am)local b=am.window am.main=b:Create('Frame',{Size=UDim2.new(1,-20,0,41),BorderSizePixel=0,
Name=am.name,BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,Parent=am.tab.tabPage},{
BackgroundTransparency='ElementTransparency'})am.stroke=b:StyleElementBody(am.main)am.hoverOverlay=b:CreateHoverOverlay(
am.main)am.container=b:Create('Frame',{BorderSizePixel=0,Parent=am.main,Size=UDim2.new(0,170,0,16),Position=UDim2.new(0,
20,0.5,0),AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1})am.containerLayout=b:Create('UIListLayout',{Padding=
UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=am.container})if am.icon then am.iconLabel=b:Create(
'ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),BorderSizePixel=0,BackgroundTransparency=1,ImageTransparency=1,
Parent=am.container},{ImageColor3='ContentColor'})end am.title=b:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.
fromOffset(250,16),BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,AutomaticSize=Enum.AutomaticSize.X,
TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,LayoutOrder=1,TextTransparency=1,Parent=am.container},{
TextColor3='ContentColor',FontFace='Font'})am.interact=b:Create('TextButton',{BackgroundTransparency=1,Size=UDim2.new(1,
0,1,0),BorderSizePixel=0,Position=UDim2.fromScale(1,0.5),AnchorPoint=Vector2.new(1,0.5),TextTransparency=1,ZIndex=10,
Parent=am.main})am:_buildSwitch(am.main)am.functionContainer.Position=UDim2.new(1,-15,0,20)am.functionContainer.
AnchorPoint=Vector2.new(1,0.5)am.window:_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,
function()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=1}):Play()ag.tweenService:Create(am.main,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Size=UDim2.new(1,-26,0,41)}):Play()am:_performToggle()task.wait(0.11)ag.tweenService:Create(am.
main,TweenInfo.new(0.25,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Size=UDim2.new(1,-20,0,41)}):Play()ag.
tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=am.
window.theme.ElementStrokeTransparency}):Play()end)end function ae._buildCompact(am)local b=am.window am.main,am.stroke,
am.interact=b:_buildCompactRow(am.tab,am.name,10)am.hoverOverlay=am.interact b:Create('UIPadding',{PaddingLeft=UDim.new(
0,15),PaddingRight=UDim.new(0,15),Parent=am.interact})b:Create('UIListLayout',{FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.SpaceBetween,Padding=UDim
.new(0,10),Parent=am.interact})am.container=b:Create('Frame',{AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0
,16),BackgroundTransparency=1,BorderSizePixel=0,LayoutOrder=0,Parent=am.interact})b:Create('UIFlexItem',{FlexMode=Enum.
UIFlexMode.Shrink,Parent=am.container})b:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,Parent=am.
container})if am.icon then am.iconLabel=b:Create('ImageLabel',{Image=am.icon,Size=UDim2.fromOffset(16,16),
BorderSizePixel=0,BackgroundTransparency=1,LayoutOrder=0,ImageTransparency=1,Parent=am.container},{ImageColor3=
'ContentColor'})end am.title=b:Create('TextLabel',{Text=ak.t(am.name),Size=UDim2.fromOffset(0,16),AutomaticSize=Enum.
AutomaticSize.X,BorderSizePixel=0,BackgroundTransparency=1,TextSize=16,TextXAlignment=Enum.TextXAlignment.Left,
TextTruncate=Enum.TextTruncate.AtEnd,LayoutOrder=1,TextTransparency=1,Parent=am.container},{TextColor3='ContentColor',
FontFace='Font'})b:Create('UIFlexItem',{FlexMode=Enum.UIFlexMode.Shrink,Parent=am.title})am:_buildSwitch(am.interact)am.
functionContainer.LayoutOrder=1 am.window:_wireElementHover(am)am.window:ConnectFor(am,am.interact.MouseButton1Click,
function()ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{
Transparency=1}):Play()am:_performToggle()task.wait(0.11)ag.tweenService:Create(am.stroke,TweenInfo.new(0.25,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),{Transparency=am.window.theme.ElementStrokeTransparency}):Play()end)end
function ae._animateIndicator(am)local b=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if am.
indicatorGlow then ag.tweenService:Create(am.indicatorGlow,b,{Transparency=am.value and am.window.theme.AccentGlow or 1}
):Play()end if am.value then ag.tweenService:Create(am.indicator,b,{Position=UDim2.new(1,-28,0.5,0),BackgroundColor3=am.
window.theme.AccentColor,BackgroundTransparency=0}):Play()ag.tweenService:Create(am.indicatorStroke,b,{Color=am.window.
theme.AccentStroke,Transparency=0}):Play()else ag.tweenService:Create(am.indicator,b,{Position=UDim2.new(1,-47,0.5,0),
BackgroundColor3=am.window.theme.ToggleKnobOff,BackgroundTransparency=am.window.theme.ToggleKnobOffTransparency}):Play()
ag.tweenService:Create(am.indicatorStroke,b,{Color=Color3.fromRGB(255,255,255),Transparency=0.7}):Play()end end local am
,b=TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),TweenInfo.new(0.6,Enum.EasingStyle.
Exponential,Enum.EasingDirection.Out,0,false,0.35)function ae._setShown(c,d,e)local f=c.window if d then f:
_revealCommon(c,e)f:_reveal(c.indicator,{BackgroundColor3=c.value and f.theme.AccentColor or f.theme.ToggleKnobOff,
BackgroundTransparency=c.value and 0 or f.theme.ToggleKnobOffTransparency},e,am)f:_reveal(c.indicatorStroke,{Color=c.
value and f.theme.AccentStroke or Color3.fromRGB(255,255,255),Transparency=c.value and 0 or 0.7},e,am)f:_reveal(c.
indicatorGlow,{Transparency=c.value and f.theme.AccentGlow or 1},e,b)f:_reveal(c.overlay,{BackgroundTransparency=0},e,am
)f:_reveal(c.containerStroke,{Transparency=0.85},e,am)f:_reveal(c.functionContainer,{BackgroundTransparency=f.theme.
ToggleTrackTransparency},e,am)else f:_hideCommon(c,e)f:_reveal(c.indicator,{BackgroundTransparency=1},e,am)f:_reveal(c.
indicatorStroke,{Transparency=1},e,am)f:_reveal(c.indicatorGlow,{Transparency=1},e,b)f:_reveal(c.overlay,{
BackgroundTransparency=1},e,am)f:_reveal(c.containerStroke,{Transparency=1},e,am)f:_reveal(c.functionContainer,{
BackgroundTransparency=1},e,am)end end function ae._refreshTheme(c)local d,e,f=c.window.theme,TweenInfo.new(0.5,Enum.
EasingStyle.Quint,Enum.EasingDirection.Out),ag.tweenService f:Create(c.functionContainer,e,{BackgroundTransparency=d.
ToggleTrackTransparency}):Play()f:Create(c.indicator,e,{BackgroundColor3=c.value and d.AccentColor or d.ToggleKnobOff,
BackgroundTransparency=c.value and 0 or d.ToggleKnobOffTransparency}):Play()f:Create(c.indicatorStroke,e,{Color=c.value
and d.AccentStroke or Color3.fromRGB(255,255,255)}):Play()if c.indicatorGlow then f:Create(c.indicatorGlow,e,{
Transparency=c.value and d.AccentGlow or 1}):Play()end end function ae._minWidth(c)local d=90 if c.icon then d+=21 end d
+=ah.textWidth(c.window.theme.Font,16,ak.resolve(c.name))return d end ai(ae)aj(ae)function ae.Set(c,d,e)local f=c.value
~=d c.value=d if f then c:_animateIndicator()end if not e then c.window:_runGuarded(c,c.callback,c.value)c.window:
_persist(c)end end return ae end)()end,[30]=function()local aa,ab,ac=a(30)local ad return(function(...)local ae=ab.
Parent.Parent.utility local af,ag,ah,ai,aj,ak,al,am,b,c,d,e,f,g,h=ac(ae.image),ac(ae.functions),ac(ae.persistence),ac(ae
.constants),ac(ae.locale),ac(ae.log),ac(ae.HapticEngine),ac(ae.windowSizing),ac(ae.layouts),ac(ab.Parent.chrome),ac(ab.
Parent.search),ac(ab.Parent.sidebar),ac(ae.variables),ab.Parent.Parent.themes,{}h.__index=h local i,j,k,l,m=TweenInfo.
new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),UDim2.fromOffset(185,50),UDim2.fromOffset(50,50),UDim2.
new(0.5,0,0,20),UDim2.new(0.5,0,0,12)local n,o,p,q,r,s,t,u,v=UDim2.new(0.5,0,0,l.Y.Offset+j.Y.Offset+12),TweenInfo.new(
0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),320,41,0.55,0.55,0.04,8,2 local function w(x):UDim2 local y=f.
workspace.CurrentCamera return am.fit(y and y.ViewportSize,x)end local x,y={'TopLeftRadius','TopRightRadius',
'BottomLeftRadius','BottomRightRadius'},(function()return(pcall(function()local x=Instance.new'UICorner'x.TopLeftRadius=
UDim.new(0,1)x:Destroy()end))end)()local function z(A)return if A then b.sidebar else b.top end local A={WindowColor=
true,ElementGradient=true,ElementStrokeGradient=true,TabBackground=true,TabStroke=true,SliderProgress=true}
local function B(C,D)if A[C]and typeof(D)=='Color3'then return ColorSequence.new(D)end return D end local function C(D)
return if typeof(D)=='ColorSequence'then D.Keypoints[1].Value else D end local function D(E,F)local G=E._toastsTop if
not G then return end local H=if E._collapsedShown then n else m if not F or G.Position==H then G.Position=H return end
f.tweenService:Create(G,o,{Position=H}):Play()end local function E(F,G)local H=0.299*F.R+0.587*F.G+0.114*F.B local I=if
H>0.5 then Color3.new(0,0,0)else Color3.new(1,1,1)return F:Lerp(I,G)end local function F(G,H)if H.ElementGradient then
local I=C(G.ElementGradient)if H.ElementStroke==nil then G.ElementStroke=E(I,0.28)end if H.ElementStrokeGradient==nil
then G.ElementStrokeGradient=ColorSequence.new(E(I,0.4))end if H.ElementStrokeHover==nil then G.ElementStrokeHover=E(I,
0.52)end end if H.TabBackground and H.TabStroke==nil then G.TabStroke=ColorSequence.new(E(C(G.TabBackground),0.4))end
end local function G(H)if typeof(H)=='table'then return H elseif typeof(H)=='string'then local I=g:FindFirstChild(string
.lower(H))if I then return ac(I)end ak.warn("Rayfield: unknown theme '"..H.."', using default")elseif H~=nil then ak.
warn[[Rayfield: invalid theme (expected a built-in name or a theme table), using default]]end return ac(g.default)end
local function H(I)local J,K=table.clone(ac(g.default)),G(I)for L,M in K do J[L]=B(L,M)end if typeof(I)=='table'then F(J
,K)end local L=if typeof(I)=='table'then I else nil if not(L and(L.Font or L.font))then J.Font=f.brandFont(Enum.
FontWeight.Medium)end if not(L and(L.TitleFont or L.titleFont))then J.TitleFont=f.brandFont(Enum.FontWeight.SemiBold)end
return J end function h.new(I)I=if typeof(I)=='table'then I else{}if I.translations or I.Translations then aj.register(I
.translations or I.Translations)end if I.translator or I.Translator then aj.translator=I.translator or I.Translator end
aj.setActive(I.locale or I.Locale or aj.detect())local J=I.fallbackFont or I.FallbackFont if J then f.setFallbackFont(J)
end local K=z(I.sidebarLayout or I.SidebarLayout)local L=setmetatable({name=I.name or I.Name or'Rayfield Window',
subheading=I.subtitle or I.Subtitle,layout=K,size=w(K.mode),instances={},connections={},icon=I.icon or I.Icon,showName=I
.showName or I.ShowName or'Rayfield',showIcon=I.showIcon or I.ShowIcon or ai.icons.rayfield,showIconOnly=I.showIconOnly
or I.ShowIconOnly or false,profileText=I.profile or I.Profile,themeProperties={},localeProperties={},tabs={},tabSections
={},tags={},selectedTab=nil,theme=H(I.theme or I.Theme),controls={},configuration=(function()local L=I.configuration or
I.Configuration if not L then return{}end return{autoSave=L.autoSave or L.AutoSave,autoLoad=L.autoLoad or L.AutoLoad,
fileName=L.fileName or L.FileName,customFolder=L.customFolder or L.CustomFolder}end)()},h)L.Flags=setmetatable({},{
__index=function(M,N)local O=L.controls[N]return O and O.value end,__newindex=function(M,N,O)local P=L.controls[N]if not
P then ak.warn("Rayfield: no flag '"..tostring(N).."' to set")return end P:Set(O)end,__iter=function()local M return
function()local N M,N=next(L.controls,M)if M then return M,N.value end return nil end end})L.settings={toggleKeybind=
Enum.KeyCode.K,mouseOverride=true,keepOnScreen=true,welcomeToast=true,haptics=true,showProfile=true}L.screenGui=L:
Create('ScreenGui',{Name=f.httpService:GenerateGUID(false),IgnoreGuiInset=true,ResetOnSpawn=false,Enabled=true,
DisplayOrder=ai.displayOrder.window,ZIndexBehavior=Enum.ZIndexBehavior.Global,Parent=f.guiContainer})L.main=L:Create(
'Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),Name=L.name,ZIndex=1,AnchorPoint=Vector2.new(0.5,0.5),Position=
UDim2.new(0.5,0,0.5,0),Size=UDim2.fromOffset((L.size.X.Offset-50),0),BackgroundTransparency=1,Visible=false,Parent=L.
screenGui})L.drag=ac(ab.Parent.drag).new(L)L.windowCorner=L:Create('UICorner',{Parent=L.main},{CornerRadius=
'CornerRoundness'})L.windowStroke=L:Create('UIStroke',{Transparency=1,Parent=L.main},{Color='SurfaceStroke'})L.
windowGradient=L:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,-0.1),Parent=L.main},{Color={'WindowColor',ag.
toColorSequence}})L.bottomFade=L:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,
AnchorPoint=Vector2.new(1,1),Position=UDim2.fromScale(1,1),Size=L.layout.fadeSize,ZIndex=ai.zIndex.bottomFade,
BackgroundTransparency=1,Parent=L.main})L.bottomFadeCorner=L:_roundCorners(L.bottomFade,L.layout.fadeCorners)L.
bottomFadeGradient=L:Create('UIGradient',{Rotation=270,Offset=Vector2.new(0,0.2),Transparency=L.layout.fadeTransparency,
Parent=L.bottomFade},{Color={'WindowColor',function(M)return ColorSequence.new(ag.toColorSequence(M).Keypoints[1].Value)
end}})L.topbar=L:Create('Frame',{BackgroundTransparency=1,Size=UDim2.new(1,0,0,L.layout.topbarHeight),Active=true,Parent
=L.main})L.topContainer=L:Create('Frame',{Size=UDim2.new(0,300,0,24),Position=UDim2.new(0,25,0.5,0),AutomaticSize=Enum.
AutomaticSize.Y,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,Parent=L.topbar})L.topContainerLayout=L:Create(
'UIListLayout',{Padding=UDim.new(0,8),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.
VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L
.topContainer})L.titleContainer=L:Create('Frame',{Size=UDim2.fromOffset(50,24),Position=UDim2.new(0,25,0.5,0),
AutomaticSize=Enum.AutomaticSize.XY,AnchorPoint=Vector2.new(0,0.5),BackgroundTransparency=1,LayoutOrder=1,Parent=L.
topContainer})L.titleContainerLayout=L:Create('UIListLayout',{Padding=UDim.new(0,3),FillDirection=Enum.FillDirection.
Vertical,VerticalAlignment=Enum.VerticalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.titleContainer})
if L.name then L.title=L:Create('TextLabel',{Text=aj.t(L.name),FontFace=f.brandFont(Enum.FontWeight.Medium),Size=UDim2.
fromOffset(50,20),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,TextSize=20,TextXAlignment=Enum.
TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=L.titleContainer},{FontFace='Font',TextColor3=
'TitlingColor'})end if L.icon then L.topbarIcon=L:Create('ImageLabel',{Image=L.icon,BackgroundTransparency=1,Size=UDim2.
fromOffset(32,32),ImageTransparency=1,Parent=L.topContainer},{ImageColor3='TitlingColor'})end if L.subheading then L.
subtitle=L:Create('TextLabel',{Text=aj.t(L.subheading),Size=UDim2.fromOffset(50,12),AutomaticSize=Enum.AutomaticSize.X,
BackgroundTransparency=1,TextSize=12,TextXAlignment=Enum.TextXAlignment.Left,TextWrapped=true,TextTransparency=1,Parent=
L.titleContainer},{TextColor3='TitlingColor',FontFace='Font'})end L.tagContainer=L:Create('Frame',{AnchorPoint=Vector2.
new(0,0.5),Position=UDim2.new(0,25,0.5,0),Size=UDim2.fromOffset(50,24),AutomaticSize=Enum.AutomaticSize.XY,
BackgroundTransparency=1,LayoutOrder=2,Visible=false,Parent=L.topContainer})L.tagContainerLayout=L:Create('UIListLayout'
,{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.tagContainer})L.windowShadow=L:CreateGlow(L.main,'ShadowColor',20,1)L.
elements=L:Create('Frame',{Size=UDim2.new(1,0,1,-L.layout.chromeHeight),Position=UDim2.fromScale(1,1),AnchorPoint=
Vector2.new(1,1),BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,
ClipsDescendants=true,Parent=L.main})if L.layout.mode=='sidebar'then L.elementsCorner=L:_roundCorners(L.elements,L.
layout.cardCorners)L.elementsStroke=L:Create('UIStroke',{ApplyStrokeMode=Enum.ApplyStrokeMode.Border,Transparency=1,
Parent=L.elements},{Color='SurfaceStroke'})L:Create('UIGradient',{Rotation=L.layout.cardStrokeRotation,Transparency=L.
layout.cardStrokeTransparency,Parent=L.elementsStroke})end L.elementsLayout=L:Create('UIPageLayout',{Padding=UDim.new(0,
0),FillDirection=L.layout.pageDirection,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.
HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,ScrollWheelInputEnabled=false,GamepadInputEnabled=false,
TouchInputEnabled=false,EasingStyle=Enum.EasingStyle.Exponential,TweenTime=0.4,Parent=L.elements})if L.layout.mode==
'sidebar'then e.build(L,L.layout)e.applyWidth(L,b.railWidthFor(L.layout,L.size.X.Offset))else L.tabList=L:Create(
'ScrollingFrame',{Name='Tabs',Active=true,Size=UDim2.new(1,0,0,L.layout.tabStripHeight),Position=UDim2.new(0.5,0,0,L.
layout.tabStripTop),AnchorPoint=Vector2.new(0.5,0),BackgroundTransparency=1,AutomaticCanvasSize=Enum.AutomaticSize.X,
CanvasSize=UDim2.new(0,0,0,0),ScrollBarThickness=0,ScrollBarImageTransparency=1,ScrollingDirection=Enum.
ScrollingDirection.X,Parent=L.main})L.tabListLayout=L:Create('UIListLayout',{Padding=UDim.new(0,7),FillDirection=Enum.
FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.
Left,SortOrder=Enum.SortOrder.LayoutOrder,Parent=L.tabList})L:Create('UIPadding',{PaddingLeft=UDim.new(0,22),
PaddingRight=UDim.new(0,10),Parent=L.tabList})end L.actionContainer=L:Create('Frame',{AnchorPoint=Vector2.new(1,0.5),
AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.fromOffset(0,24),Position=UDim2.new(1,-20,0.5,0),BackgroundTransparency=1,
Parent=L.topbar})L.actionsListLayout=L:Create('UIListLayout',{Padding=UDim.new(0,5),FillDirection=Enum.FillDirection.
Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,HorizontalAlignment=Enum.HorizontalAlignment.Right,SortOrder=
Enum.SortOrder.LayoutOrder,Parent=L.actionContainer})L.rfSettings=L:CreateTab{name='Rayfield Settings',customOrder=1000,
neglectSelector=true,forgetState=true}ac(ab.Parent.action).new(L,{name='Close',icon=ai.icons.close,order=1,callback=
function()L:ToggleHide()end})L.minimiseAction=ac(ab.Parent.action).new(L,{name='Minimise',icon=ai.icons.minimise,order=2
,callback=function()L:ToggleMinimise()end})L.settingsAction=ac(ab.Parent.action).new(L,{name='Settings',icon=ai.icons.
settings,order=3,linkedTab=L.rfSettings,callback=function()L.rfSettings:Select()end})d.build(L)L:_applyRailWidth()L.
unloaded=false L.minimised=false L.hidden=true L.animating=false L._revealing=false L.hasShownOnce=false L.
_collapsedShown=false L:LoadSettings()if L.layout.mode=='sidebar'then e.reflowProfile(L)e.setSubtitle(L,L.profileText)
end al.setContainer(L.screenGui)al.setEnabled(L.settings.haptics)c.buildCollapsedFace(L)L:_bindKeybind()L:
_bindMouseOverride()L:_bindTopbarDrag()L:_watchViewport()L:_buildSettingsUI()L:_syncLiveAnimation()return L end function
h._syncLiveAnimation(I)if not I.theme.LiveAnimation then I._liveAnimating=false return end if I._liveAnimating then
return end I._liveAnimating=true I._liveGeneration=(I._liveGeneration or 0)+1 local J=I._liveGeneration task.spawn(
function()local K,L=true,TweenInfo.new(10,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)while I._liveGeneration==J and
I._liveAnimating and not I.unloaded do local M=f.tweenService:Create(I.windowGradient,L,{Offset=Vector2.new(if K then
0.4 else-0.2,0),Rotation=(if K then 220 else 280)})I._liveTween=M M:Play()M.Completed:Wait()K=not K end if I.
_liveGeneration==J then I._liveAnimating=false I._liveTween=nil end end)end function h.ChangeTheme(I,J)local K=if
typeof(J)=='table'then J else H(J)for L,M in K do I.theme[L]=B(L,M)end if typeof(J)=='table'then F(I.theme,K)end for L,M
in I.themeProperties do for N,O in M do local P=if typeof(O)=='table'then O[2](I.theme[O[1] ])else I.theme[O]if typeof(P
)=='Color3'or typeof(P)=='number'then f.tweenService:Create(L,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.
EasingDirection.Out),{[N]=P}):Play()else L[N]=P end end end if I.hidden then I._themeRefreshPending=true else I:
_refreshElementThemes()end I:_syncLiveAnimation()end function h._refreshElementThemes(I)for J,K in I.tabs do for L,M in
K.elements do if M._refreshTheme then M:_refreshTheme()end end end end function h.CreateTab(I,J)assert(not I.unloaded,
'Cannot create a tab on an unloaded window.')local K=ac(ab.Parent.tab).new(I,J)table.insert(I.tabs,K)if not K.
neglectSelector then local L=true for M,N in I.tabs do if N~=K and not N.neglectSelector then L=false break end end if L
then K:Select(true)end if not I.hidden and not I.minimised then K.topbarItem.Visible=true K:_applyVisual(if I.
selectedTab==K then'selected'else'unselected',TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end end
return K end function h.CreateSection(I,J)assert(not I.unloaded,'Cannot create a section on an unloaded window.')local K
=ac(ab.Parent.tabSection).new(I,J)table.insert(I.tabSections,K)if not K.inert and not I.hidden and not I.minimised then
K:_setVisible(true)K:_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out))end return K end
function h._setTabSectionsShown(I,J,K)for L,M in I.tabSections do M:_setShown(J,K)end end function h.
_setTabSectionsVisible(I,J)for K,L in I.tabSections do L:_setVisible(J)end end function h.CreateTag(I,J)assert(not I.
unloaded,'Cannot create a tag on an unloaded window.')local K=ac(ab.Parent.tag).new(I,J)table.insert(I.tags,K)return K
end function h._registerControl(I,J)if not J.flag or J.flag==''or J.forgetState then return end local K=J.flag if I.
controls[K]then local L=2 while I.controls[K..L]do L+=1 end K=K..L ak.warn("Rayfield: duplicate config flag '"..J.flag..
"', saving this one as '"..K.."'. Set a unique flag to keep it stable across sessions.")end J.flag=K I.controls[K]=J
return K end function h._restoreLate(I,J)if not I._loadedConfig or not J.flag or J.forgetState then return end local K=I
._loading I._loading=true ah.applyTo(J,I._loadedConfig[J.flag])I._loading=K end function h._persist(I,J)if J.flag and
not J.forgetState and I.configuration.autoSave and not I._loading then task.spawn(I.Save,I)end end function h.
_unregisterControl(I,J)if J.flag and I.controls[J.flag]==J then I.controls[J.flag]=nil end end function h._keybindUsing(
I,J,K)if typeof(J)~='EnumItem'or J==Enum.KeyCode.Unknown then return nil end for L,M in I.tabs do for N,O in M.elements
do if O~=K and O.__type=='Keybind'and O.value==J then return O end end end return nil end function h.Notify(I,J)if I.
unloaded then return end if not I.notifications then I.notifications=I:Create('Frame',{Name='Notifications',Size=UDim2.
new(0,300,0,800),Position=UDim2.new(1,-20,1,-20),AnchorPoint=Vector2.new(1,1),BackgroundTransparency=1,Parent=I.
screenGui})I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=Enum.VerticalAlignment.
Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0),
Parent=I.notifications})end return ac(ab.Parent.notification).new(I,J)end function h.Toast(I,J)if I.unloaded then return
end J=if typeof(J)=='table'then J else{}local K=J.position or J.Position or'Top'local L=typeof(K)~='string'or K:lower()
~='bottom'J.position=if L then'Top'else'Bottom'local M=if L then'_toastsTop'else'_toastsBottom'local N=I[M]if not N then
N=I:Create('Frame',{Name='Toasts',Size=UDim2.new(0,p,1,-24),Position=if L then m else UDim2.new(0.5,0,1,-12),AnchorPoint
=if L then Vector2.new(0.5,0)else Vector2.new(0.5,1),BackgroundTransparency=1,ZIndex=ai.zIndex.toast,Parent=I.screenGui}
)I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Vertical,VerticalAlignment=if L then Enum.VerticalAlignment.
Top else Enum.VerticalAlignment.Bottom,HorizontalAlignment=Enum.HorizontalAlignment.Center,SortOrder=Enum.SortOrder.
LayoutOrder,Padding=UDim.new(0,0),Parent=N})I[M]=N if L then D(I,false)end end return ac(ab.Parent.toast).new(I,J,N)end
function h.Popup(I,J)if I.unloaded then return end return ac(ab.Parent.popup).new(I,J)end function h.Hide(I)if I.
animating or I.hidden then return end if I._searching then d.close(I,{showTabs=false,jumpTo=I.selectedTab and I.
selectedTab.tabPage})end if I._recordingKeybind then I._recordingKeybind:_stopRecording()end I.animating=true I.
_revealing=true I.hidden=true I.collapsedInteract.Visible=false if I.minimised then I.minimised=false af.assign(I.
minimiseAction.iconLabel,'Image',ai.icons.minimise)end I._restorePosition=I.main.Position local J,K=I:_collapsedRect()
local L,M,N,O=TweenInfo.new(0.18,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.35,Enum.EasingStyle.
Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),
TweenInfo.new(0.2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)f.tweenService:Create(I.drag.dragCosmetic,L,{Size=
UDim2.fromOffset(0,4),BackgroundTransparency=1}):Play()task.delay(0.18,function()if not I.hidden then return end I.drag.
drag.Visible=false end)I:_fadeSurfaces(false,L)if I.title then f.tweenService:Create(I.title,L,{TextTransparency=1}):
Play()end if I.subtitle then f.tweenService:Create(I.subtitle,L,{TextTransparency=1}):Play()end if I.topbarIcon then f.
tweenService:Create(I.topbarIcon,L,{ImageTransparency=1}):Play()end for P,Q in ipairs(I.actionContainer:GetChildren())do
if Q:IsA'Frame'then f.tweenService:Create(Q.ImageLabel,L,{ImageTransparency=1}):Play()end end for P,Q in I.tags do Q:
_setShown(false,L)end for P,Q in pairs(I.tabs)do if not Q.neglectSelector and Q.topbarItem then Q:_applyVisual('hidden',
L)end end I:_setTabSectionsShown(false,L)I:_fadeSelectedElementsOut()local P=f.tweenService:Create(I.main,M,{Size=K,
Position=J})P.Completed:Connect(function()if I.unloaded or not I.hidden then return end I._collapsedShown=true D(I,true)
I.collapsedInteract.Visible=true I.animating=false I._revealing=false end)P:Play()f.tweenService:Create(I.windowCorner,N
,{CornerRadius=UDim.new(1,0)}):Play()task.delay(0.18,function()if not I.hidden then return end I.topbar.Visible=false I:
_setContentVisible(false)c.setCollapsedShown(I,true,O)end)end function h.ToggleHide(I)if I.animating then return end if
I.hidden then I:Show()else I:Hide()end end function h.ToggleMinimise(I)if I.animating or I.hidden then return end if I.
_searching then d.close(I,{showTabs=true})end I.animating=true local J,K=TweenInfo.new(0.5,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out),TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)if I.minimised then I.
minimised=false af.assign(I.minimiseAction.iconLabel,'Image',ai.icons.minimise)f.tweenService:Create(I.main,J,{Size=I.
size}):Play()I:_fadeSurfaces(true,K)f.tweenService:Create(I.drag.drag,J,{Position=UDim2.new(I.main.Position.X.Scale,I.
main.Position.X.Offset,I.main.Position.Y.Scale,I.main.Position.Y.Offset+I.size.Y.Offset/2+15)}):Play()task.delay(0.2,
function()if I.minimised or I.hidden then return end I:_setContentVisible(true)for L,M in pairs(I.tabs)do if not M.
neglectSelector and M.topbarItem then M.topbarItem.Visible=true M:_applyVisual(if I.selectedTab==M then'selected'else
'unselected',K)end end I:_setTabSectionsVisible(true)I:_setTabSectionsShown(true,K)I:_revealElements(0.035,0.4)end)task.
delay(0.5,function()I.animating=false end)else I.minimised=true af.assign(I.minimiseAction.iconLabel,'Image',ai.icons.
maximise)I:_fadeSelectedElementsOut()for L,M in pairs(I.tabs)do if not M.neglectSelector and M.topbarItem then M:
_applyVisual('hidden',K)end end I:_setTabSectionsShown(false,K)task.delay(0.3,function()if not I.minimised then return
end I:_setContentVisible(false)for L,M in pairs(I.tabs)do if not M.neglectSelector and M.topbarItem then M.topbarItem.
Visible=false end end I:_setTabSectionsVisible(false)end)I:_fadeSurfaces(false,K)f.tweenService:Create(I.main,J,{Size=
UDim2.fromOffset(I.size.X.Offset,I.layout.topbarHeight)}):Play()f.tweenService:Create(I.drag.drag,J,{Position=UDim2.new(
I.main.Position.X.Scale,I.main.Position.X.Offset,I.main.Position.Y.Scale,I.main.Position.Y.Offset+I.layout.topbarHeight/
2+15)}):Play()task.delay(0.5,function()I.animating=false end)end end function h._syncDragBar(I)local J=I.drag and I.drag
.drag if not J then return end local K,L=I.main.Position,I.size.Y.Offset/2+15 J.Position=UDim2.new(K.X.Scale,K.X.Offset,
K.Y.Scale,K.Y.Offset+L)end function h._clampedPosition(I,J:UDim2):UDim2 if not I.settings or not I.settings.keepOnScreen
then return J end if J.X.Scale~=0 or J.Y.Scale~=0 then return J end local K,L,M,N=I.screenGui.AbsoluteSize,I.size.X.
Offset/2,I.size.Y.Offset/2,8 local O,P=math.clamp(J.X.Offset,L+N,math.max(L+N,K.X-L-N)),math.clamp(J.Y.Offset,M+N,math.
max(M+N,K.Y-M-N))if O==J.X.Offset and P==J.Y.Offset then return J end return UDim2.fromOffset(O,P)end function h.
_clampToScreen(I)I.main.Position=I:_clampedPosition(I.main.Position)end function h._applyWindowSize(I)if I.unloaded then
return end local J=w(I.layout.mode)local K=J~=I.size I.size=J I:_applyRailWidth()if I.hidden or I.minimised or I.
animating or I._revealing then I._pendingResize=I._pendingResize or K return end if not K and not I._pendingResize then
return end I._pendingResize=false I.main.Size=J I:_clampToScreen()I:_syncDragBar()end function h._applyRailWidth(I)if I.
layout.mode~='sidebar'then return end e.applyWidth(I,b.railWidthFor(I.layout,I.size.X.Offset))end function h.
_watchViewport(I)local J,K:RBXScriptConnection?=false local function L()if J then return end J=true task.defer(function(
)J=false I:_applyWindowSize()end)end local function M()if K then I:Disconnect(K)K=nil end local N=f.workspace.
CurrentCamera if N then K=I:Connect(N:GetPropertyChangedSignal'ViewportSize',L)end L()end I:Connect(f.workspace:
GetPropertyChangedSignal'CurrentCamera',M)M()local N=0 I:Connect(f.runService.Heartbeat,function(O:number)N+=O if N<v
then return end N=0 I:_applyWindowSize()end)end function h._bindKeybind(I)I:Connect(f.userInputService.InputBegan,
function(J,K)if K or I._recordingKeybind then return end if J.KeyCode==I.settings.toggleKeybind or J.UserInputType==I.
settings.toggleKeybind then I:ToggleHide()end end)end function h._bindMouseOverride(I)local J=f.userInputService
local function K()return I.settings.mouseOverride and not I.hidden and not I.minimised end local function L()if not K()
then return end if J:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)then return end if J.MouseBehavior~=Enum.
MouseBehavior.Default then J.MouseBehavior=Enum.MouseBehavior.Default end if not J.MouseIconEnabled then J.
MouseIconEnabled=true end end I:Connect(J:GetPropertyChangedSignal'MouseBehavior',L)I:Connect(J:GetPropertyChangedSignal
'MouseIconEnabled',L)I:Connect(J.InputEnded,function(M)if M.UserInputType==Enum.UserInputType.MouseButton2 then L()end
end)I._freeMouse=L end function h._bindTopbarDrag(I)local J,K,L,M=f.userInputService,false,Vector2.zero,Vector2.zero if
I.screenGui and I.screenGui.IgnoreGuiInset then M=f.guiService:GetGuiInset()end local function N()local O=J:
GetMouseLocation()+L+M local P,Q=O.X,O.Y if I.settings and I.settings.keepOnScreen then local R,S,T=I.main.AbsoluteSize,
I.screenGui.AbsoluteSize,8 local U,V=R.X/2,R.Y/2 P=math.clamp(P,U+T,math.max(U+T,S.X-U-T))Q=math.clamp(Q,V+T,math.max(V+
T,S.Y-V-T))end return UDim2.fromOffset(P,Q)end local function O(P,Q)for R,S in{I.tabList,I.actionContainer}do local T,U=
S.AbsolutePosition,S.AbsoluteSize if P>=T.X and P<=T.X+U.X and Q>=T.Y and Q<=T.Y+U.Y then return true end end return
false end I:Connect(I.topbar.InputBegan,function(P,Q)if Q then return end local R=P.UserInputType.Name if R~=
'MouseButton1'and R~='Touch'then return end if O(P.Position.X,P.Position.Y)then return end if not I:_interactive()then
return end K=true if I.screenGui and I.screenGui.IgnoreGuiInset then M=f.guiService:GetGuiInset()end L=I.main.
AbsolutePosition+I.main.AbsoluteSize*I.main.AnchorPoint-J:GetMouseLocation()end)I:Connect(J.InputEnded,function(P)local
Q=P.UserInputType.Name if Q=='MouseButton1'or Q=='Touch'then K=false end end)I:Connect(J.WindowFocusReleased,function()K
=false end)I:Connect(f.runService.RenderStepped,function()if not K then return end if not I:_interactive()then K=false
return end I.main.Position=N()if I.drag and I.drag.drag then local P=I.main.Position I.drag.drag.Position=UDim2.new(P.X.
Scale,P.X.Offset,P.Y.Scale,P.Y.Offset+(I.main.Size.Y.Offset/2+15))end end)end function h._buildSettingsUI(I)I.rfSettings
:CreateSection{name='General'}I.rfSettings:CreateKeybind{name='Toggle Keybind',icon=ai.icons.search,value=I.settings.
toggleKeybind,isMenuToggle=true,onChanged=function(J)I.settings.toggleKeybind=J I:SaveSettings()end}I.rfSettings:
CreateToggle{name='Unlock cursor while open',description=
[[Unlocks the cursor while the menu is open so you can configure in FPS games that lock it.]],value=I.settings.
mouseOverride,callback=function(J)I.settings.mouseOverride=J I:SaveSettings()end}I.rfSettings:CreateToggle{name=
'Welcome toast',description=[[Shows a 'Signed in as' toast the first time you open the menu on a new account.]],value=I.
settings.welcomeToast,callback=function(J)I.settings.welcomeToast=J I:SaveSettings()end}I.rfSettings:CreateToggle{name=
'Haptics',description=[[A subtle tap as you interact, on devices that support haptics.]],value=I.settings.haptics,
callback=function(J)I.settings.haptics=J al.setEnabled(J)I:SaveSettings()end}I.rfSettings:CreateSection{name='Window'}if
I.layout.mode=='sidebar'and I.profile then I.rfSettings:CreateToggle{name='Show profile',description=
[[Shows your avatar and name at the base of the sidebar. Turn it off to keep them out of a stream or a screenshot.]],
value=I.settings.showProfile,callback=function(J)e.setProfileEnabled(I,J)I:SaveSettings()end}end I.rfSettings:
CreateToggle{name='Keep window on screen',description=
[[Stops the window being dragged off the edge of the screen and lost.]],value=I.settings.keepOnScreen,callback=function(
J)I.settings.keepOnScreen=J I:SaveSettings()end}I.rfSettings:CreateButton{name='Reset Window Position',callback=function
()f.tweenService:Create(I.main,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{Position=UDim2.
new(0.5,0,0.5,0)}):Play()f.tweenService:Create(I.drag.drag,TweenInfo.new(0.5,Enum.EasingStyle.Exponential,Enum.
EasingDirection.Out),{Position=UDim2.new(0.5,0,0.5,I.size.Y.Offset/2+15)}):Play()end}if next(I.configuration)~=nil then
I.rfSettings:CreateSection{name='Configurations'}local J,K,L=(I:ListConfigs()[1])local function M()local N=I:
ListConfigs()K:Refresh(N)if J and not table.find(N,J)then J=N[1]end if J then K:Set(J,true)end end K=I.rfSettings:
CreateDropdown{name='Saved Configurations',icon=ai.icons.config,options=I:ListConfigs(),value=J,placeholder=
'No saved configurations',callback=function(N)J=N end}L=I.rfSettings:CreateInput{name='Configuration Name',description=
[[Name a new configuration, or leave blank to overwrite the selected one.]],placeholder='e.g. PvP Loadout',clearOnFocus=
false}local N=I.rfSettings:CreateGroup()N:CreateButton{name='Save',icon=ai.icons.config,callback=function()local O=L.
value if O==''then O=J end if not O or O==''then I:Toast{title=aj.resolve'Name your configuration first'}return end if I
:Save(O)then L:Set''J=O M()I:Toast{title=aj.resolve'Saved configuration',subtitle=O,icon=ai.icons.config}else I:Toast{
title=aj.resolve"Couldn't save configuration",subtitle=O}end end}N:CreateButton{name='Load',callback=function()if not J
or J==''then I:Toast{title=aj.resolve'Pick a configuration to load'}return end if I:_applyNamedConfig(J)then I:Toast{
title=aj.resolve'Loaded configuration',subtitle=J}else I:Toast{title=aj.resolve"Couldn't load configuration",subtitle=J}
end end}N:CreateButton{name='Delete',callback=function()local O=J if not O or O==''then I:Toast{title=aj.resolve
'Pick a configuration to delete'}return end if I:DeleteConfig(O)then M()I:Toast{title=aj.resolve'Deleted configuration',
subtitle=O}else I:Toast{title=aj.resolve"Couldn't delete configuration",subtitle=O}end end}end end function h.SetProfile
(I,J)I.profileText=J e.setSubtitle(I,J)end function h.SaveSettings(I)return ah.saveSettings(I)end function h.
LoadSettings(I)return ah.loadSettings(I)end function h._roundCorners(I,J,K)if not K or not y then return I:Create(
'UICorner',{Parent=J},{CornerRadius='CornerRoundness'})end local L,M={Parent=J},{}for N,O in x do L[O]=UDim.new(0,0)end
for N,O in K do L[O]=nil M[O]='CornerRoundness'end return I:Create('UICorner',L,M)end function h._setElementLocked(I,J,K
,L)K=K==true local M=J.locked==true if M==K and not(K and L)then return end J.locked=K if not J.lockScrim then I:
_buildLockScrim(J)end local N=TweenInfo.new(0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)if K then J.lockScrim.
Visible=true end f.tweenService:Create(J.lockScrim,N,{BackgroundTransparency=if K then r else 1}):Play()if not K then
task.delay(N.Time,function()if not J.locked and J.lockScrim then J.lockScrim.Visible=false end end)end local O=J.
descriptor if not O then return end if K then J._descriptionBefore=J._descriptionBefore or O.titleLabel.Text O.
titleLabel.Text=aj.resolve(L or'This element is locked.')elseif J._descriptionBefore then O.titleLabel.Text=J.
_descriptionBefore J._descriptionBefore=nil end f.tweenService:Create(O.titleLabel,N,{TextTransparency=if K then s else
0.7}):Play()end function h._buildLockScrim(I,J)J.lockScrim=I:Create('TextButton',{Name='ElementLock',Active=true,
AutoButtonColor=false,Size=UDim2.fromScale(1,1),BorderSizePixel=0,Text='',TextTransparency=1,ZIndex=ai.zIndex.
elementLock,Visible=false,BackgroundTransparency=1,Parent=J.main},{BackgroundColor3={'WindowColor',C}})I:Create(
'UICorner',{Parent=J.lockScrim},{CornerRadius='ElementCornerRadius'})end function h._setContentVisible(I,J)I.elements.
Visible=J I.tabList.Visible=J if I.sidebar then I.sidebar.Visible=J end end function h._fadeSurfaces(I,J,K)local L={[I.
windowShadow]={Transparency=if J then 0.6 else 1},[I.windowStroke]={Transparency=if J then 0.95 else 1},[I.bottomFade]={
BackgroundTransparency=if J then 0 else 1}}if I.elementsStroke then L[I.elements]={BackgroundTransparency=if J then I.
layout.cardTransparency else 1}L[I.elementsStroke]={Transparency=if J then 0 else 1}end for M,N in L do if K then f.
tweenService:Create(M,K,N):Play()else for O,P in N do M[O]=P end end end e.setProfileShown(I,J,K)end function h.
_fadeSelectedElementsOut(I)if I.selectedTab then for J,K in ipairs(I.selectedTab.elements)do K:_setShown(false,true)end
end end function h._revealElements(I,J,K)for L,M in pairs(I.tabs)do if M~=I.selectedTab then for N,O in ipairs(M.
elements)do O:_setShown(true,false)end end end local L=I.selectedTab if not L then return end local M=L.tabPage local N=
M.AbsolutePosition.Y local O,P,Q=N+M.AbsoluteWindowSize.Y,math.floor(K/J),0 for R,S in ipairs(L.elements)do local T=S.
main.AbsolutePosition.Y local U=(T+S.main.AbsoluteSize.Y)>N and T<O if U then S:_setShown(true,true)Q+=1 if Q<=P then
task.wait(J)end else S:_setShown(true,false)end end end function h.Show(I)if I.animating or not I.hidden then return end
I.animating=true I._revealing=true if I.configuration.autoLoad and not I._autoLoaded then I._autoLoaded=true local J,K=
pcall(I.Load,I)if not J then ak.warn('Rayfield: Failed to load configuration - '..tostring(K))end end I.hidden=false I.
minimised=false if I._themeRefreshPending then I._themeRefreshPending=false I:_refreshElementThemes()end I.
collapsedInteract.Visible=false if I._freeMouse then I._freeMouse()end if I.hasShownOnce then I:_quickRestore()else I.
hasShownOnce=true I:_firstShow()end end function h._quickRestore(I)local J=I:_clampedPosition(I._restorePosition or
UDim2.new(0.5,0,0.5,0))I._restorePosition=J local K,L,M=TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.
EasingDirection.InOut),TweenInfo.new(0.35,Enum.EasingStyle.Exponential,Enum.EasingDirection.InOut),TweenInfo.new(0.28,
Enum.EasingStyle.Exponential,Enum.EasingDirection.Out)c.setCollapsedShown(I,false,TweenInfo.new(0.15,Enum.EasingStyle.
Quint,Enum.EasingDirection.Out))local N=f.tweenService:Create(I.main,K,{Size=I.size,Position=J})N.Completed:Connect(
function()if I.hidden or I.unloaded then return end I._collapsedShown=false D(I,true)end)N:Play()f.tweenService:Create(I
.windowCorner,L,{CornerRadius=I.theme.CornerRoundness}):Play()task.delay(0.22,function()I.topbar.Visible=true I:
_setContentVisible(true)I:_fadeSurfaces(true,M)if I.topbarIcon then f.tweenService:Create(I.topbarIcon,M,{
ImageTransparency=0}):Play()end if I.title then f.tweenService:Create(I.title,M,{TextTransparency=0}):Play()end if I.
subtitle then f.tweenService:Create(I.subtitle,M,{TextTransparency=0.7}):Play()end for O,P in ipairs(I.actionContainer:
GetChildren())do if P:IsA'Frame'then f.tweenService:Create(P.ImageLabel,M,{ImageTransparency=0.6}):Play()end end if I.
settingsAction and I.selectedTab==I.rfSettings then f.tweenService:Create(I.settingsAction.iconLabel,M,{
ImageTransparency=0.2}):Play()end for O,P in I.tags do P:_setShown(true,M)end for O,P in pairs(I.tabs)do if not P.
neglectSelector and P.topbarItem then P.topbarItem.Visible=true P:_applyVisual(if I.selectedTab==P then'selected'else
'unselected',M)end end I:_setTabSectionsVisible(true)I:_setTabSectionsShown(true,M)I:_revealElements(0.035,0.4)end)task.
delay(0.22,function()I.drag.drag.Position=UDim2.new(J.X.Scale,J.X.Offset,J.Y.Scale,J.Y.Offset+I.size.Y.Offset/2+15)I.
drag.dragCosmetic.Size=UDim2.fromOffset(0,4)I.drag.dragCosmetic.BackgroundTransparency=1 I.drag.drag.Visible=true f.
tweenService:Create(I.drag.dragCosmetic,K,{Size=UDim2.fromOffset(100,4),BackgroundTransparency=0.7}):Play()end)task.
delay(0.6,function()I.animating=false I._revealing=false end)end function h._firstShow(I)I:_setContentVisible(true)I.
drag.drag.Visible=false I.main.Visible=true f.tweenService:Create(I.main,TweenInfo.new(1,Enum.EasingStyle.Exponential,
Enum.EasingDirection.InOut),{BackgroundTransparency=0,Size=I.size}):Play()task.wait(0.85)I:_fadeSurfaces(true,TweenInfo.
new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))task.wait(0.3)if I.icon then f.tweenService:Create(I.
topbarIcon,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0}):Play()end if
I.title then f.tweenService:Create(I.title,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
TextTransparency=0}):Play()end task.wait(0.1)if I.subtitle then f.tweenService:Create(I.subtitle,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{TextTransparency=0.7}):Play()end for J,K in ipairs(I.actionContainer:
GetChildren())do if K:IsA'Frame'then task.wait(0.02)f.tweenService:Create(K.ImageLabel,TweenInfo.new(0.4,Enum.
EasingStyle.Exponential,Enum.EasingDirection.Out),{ImageTransparency=0.6}):Play()end end for J,K in I.tags do K:
_setShown(true,TweenInfo.new(0.4,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out))end task.wait(0.2)task.spawn(
function()local J=TweenInfo.new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)I:_setTabSectionsVisible(true)I:
_setTabSectionsShown(true,J)local K=0 for L,M in pairs(I.tabs)do if not M.neglectSelector then M.topbarItem.Visible=true
M:_applyVisual(if I.selectedTab==M then'selected'else'unselected',J)M:_spinGradients()K+=1 if K<=u then task.wait(t)end
end end end)I:_revealElements(0.03,2)task.wait(1)I:_syncDragBar()I.drag.drag.Visible=true f.tweenService:Create(I.drag.
dragCosmetic,TweenInfo.new(0.6,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{BackgroundTransparency=0.7}):
Play()f.tweenService:Create(I.drag.dragCosmetic,TweenInfo.new(1,Enum.EasingStyle.Exponential,Enum.EasingDirection.Out),{
Size=UDim2.fromOffset(100,4)}):Play()I.animating=false I._revealing=false local J=f.localPlayer if J and I.settings.
welcomeToast and c.isNewUser()then I:Toast{title=J.DisplayName,subtitle=aj.resolve'Signed in as',subtitleAbove=true,
avatar=J.UserId,minWidth=220}end end function h.GetPath(I)return ah.getPath(I)end function h.Save(I,J)if J~=nil and(
type(J)~='string'or J=='')then return false end return ah.save(I,J)end function h.Load(I,J)if J~=nil and(type(J)~=
'string'or J=='')then return false end return ah.load(I,J)end function h._applyNamedConfig(I,J)if not I:Load(J)then
return false end local K,L=ah.getPath(I)I._loadedConfigPath=L I:Save()return true end function h.ListConfigs(I)return ah
.list(I)end function h.DeleteConfig(I,J)return ah.delete(I,J)end function h.Get(I,J)local K=I.controls[J]return K and K.
value end function h.Set(I,J,K)local L=I.controls[J]if not L then return false end L:Set(K)return true end function h.
_jumpTo(I,J)if J then I.elementsLayout:JumpTo(J)end end function h.Navigate(I,J)if J==nil then return end local K for L,
M in I.tabs do if M==J or M.name==J or M.tabPage==J then K=M break end end if not K then return end K:Select()end
function h.Create(I,J,K,L)assert(typeof(J)=='string','Invalid argument #1 (string expected)')local M=Instance.new(J)if L
and I.theme then for N,O in L do M[N]=(if typeof(O)=='table'then O[2](I.theme[O[1] ])else I.theme[O])end I.
themeProperties[M]=L end if K then for N,O in K do if aj.isToken(O)then I:_bindLocale(M,N,aj.sourceOf(O))else af.assign(
M,N,O)end end end table.insert(I.instances,M)return M end function h._bindLocale(I,J,K,L)J[K]=aj.resolve(L)local M=I.
localeProperties[J]if not M then M={}I.localeProperties[J]=M end M[K]=L end function h.SetLocale(I,J)aj.setActive(J)for
K,L in I.localeProperties do for M,N in L do K[M]=aj.resolve(N)end end end function h.SetTranslator(I,J)aj.translator=J
end function h.RegisterTranslations(I,J)aj.register(J)I:SetLocale(aj.current)end function h.CreateGlow(I,J,K,L,M)local N
={BlurRadius=UDim.new(0,L),Transparency=M,ZIndex=-1,Parent=J}if typeof(K)=='string'then return I:Create('UIShadow',N,{
Color={K,function(O)return if typeof(O)=='ColorSequence'then O.Keypoints[1].Value else O end}})end N.Color=K return I:
Create('UIShadow',N)end function h._flashResult(I,J,K)local L=J.box if not L then return end local M,N,O,P,Q,R=J.glow,J.
boxStroke,K and ai.accent.on or I.theme.ErrorColor,K and ai.accent.onStroke or I.theme.ErrorStrokeColor,TweenInfo.new(
0.1,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),TweenInfo.new(0.45,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)
f.tweenService:Create(L,Q,{BackgroundColor3=O}):Play()if N then f.tweenService:Create(N,Q,{Color=P,Transparency=0.4}):
Play()end if M then f.tweenService:Create(M,Q,{Color=P,Transparency=0.6}):Play()end J._flashToken=(J._flashToken or 0)+1
local S=J._flashToken task.delay(0.22,function()if J._flashToken~=S then return end f.tweenService:Create(L,R,{
BackgroundColor3=I.theme.FieldBackground}):Play()if N then f.tweenService:Create(N,R,{Color=I.theme.SurfaceStroke,
Transparency=0.85}):Play()end if M then f.tweenService:Create(M,R,{Color=I.theme.FieldGlow,Transparency=J._glowIdle or 1
}):Play()end end)end function h.CreateHoverOverlay(I,J)local K=I:Create('Frame',{BackgroundColor3=Color3.fromRGB(255,255
,255),BackgroundTransparency=1,Size=UDim2.fromScale(1,1),BorderSizePixel=0,ZIndex=1,Parent=J})I:Create('UICorner',{
Parent=K},{CornerRadius='ElementCornerRadius'})return K end function h._wireElementHover(I,J)local K,L=TweenInfo.new(
0.25,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),I.theme I:ConnectFor(J,J.main.MouseEnter,function()if not I:
_interactive()then return end f.tweenService:Create(J.stroke,K,{Transparency=L.ElementStrokeHoverTransparency,Color=L.
ElementStrokeHover}):Play()f.tweenService:Create(J.title,K,{TextColor3=L.ElementTextHoverColor}):Play()if J.hoverOverlay
then f.tweenService:Create(J.hoverOverlay,K,{BackgroundTransparency=0.97}):Play()end end)I:ConnectFor(J,J.main.
MouseLeave,function()f.tweenService:Create(J.stroke,K,{Transparency=L.ElementStrokeTransparency,Color=L.ElementStroke}):
Play()f.tweenService:Create(J.title,K,{TextColor3=L.ContentColor}):Play()if J.hoverOverlay then f.tweenService:Create(J.
hoverOverlay,K,{BackgroundTransparency=1}):Play()end end)end function h._runGuarded(I,J,K,...)if J.locked then return
end local L=table.pack(...)task.spawn(function()local M,N=pcall(function()return K(table.unpack(L,1,L.n))end)if M or J.
_errored then return end J._errored=true local O,P=J.flashTarget or J.main,TweenInfo.new(0.25,Enum.EasingStyle.Quint,
Enum.EasingDirection.Out)f.tweenService:Create(O,P,{BackgroundColor3=I.theme.ErrorColor}):Play()f.tweenService:Create(J.
stroke,P,{Color=I.theme.ErrorStrokeColor}):Play()if J.title then J.title.Text=aj.resolve
'Error, log recorded in console.'end ak.warn(`Rayfield encountered an error, with the callback for a {J.__type} component named '{
J.name}':`)ak.print(N)task.wait(1)if J.title then J.title.Text=aj.resolve(J.name)end f.tweenService:Create(O,TweenInfo.
new(0.4,Enum.EasingStyle.Quint,Enum.EasingDirection.In),{BackgroundColor3=Color3.fromRGB(255,255,255)}):Play()f.
tweenService:Create(J.stroke,TweenInfo.new(0.6,Enum.EasingStyle.Quint,Enum.EasingDirection.Out),{Color=I.theme.
ElementStroke}):Play()J._errored=false end)end function h.StyleElementBody(I,J)I:Create('UIGradient',{Rotation=270,
Parent=J},{Color='ElementGradient'})I:Create('UICorner',{Parent=J},{CornerRadius='ElementCornerRadius'})return I:Create(
'UIStroke',{Transparency=1,Parent=J},{Color='ElementStroke',Transparency='ElementStrokeTransparency'})end function h.
_buildCompactRow(I,J,K,L)local M=I:Create('Frame',{Name=K,Size=UDim2.fromOffset(0,q),AutomaticSize=Enum.AutomaticSize.X,
ClipsDescendants=true,BackgroundColor3=Color3.fromRGB(255,255,255),BorderSizePixel=0,BackgroundTransparency=1,Parent=J.
tabPage},{BackgroundTransparency='ElementTransparency'})local N=I:StyleElementBody(M)I:Create('UIFlexItem',{FlexMode=
Enum.UIFlexMode.Fill,Parent=M})I:Create('UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=
Enum.VerticalAlignment.Center,HorizontalFlex=Enum.UIFlexAlignment.Fill,Parent=M})local O=I:Create('TextButton',{Text='',
BackgroundColor3=Color3.fromRGB(255,255,255),BackgroundTransparency=1,AutomaticSize=Enum.AutomaticSize.X,Size=UDim2.
fromOffset(0,q),BorderSizePixel=0,TextTransparency=1,ZIndex=L or 1,Parent=M})I:Create('UICorner',{Parent=O},{
CornerRadius='ElementCornerRadius'})return M,N,O end function h.StyleElementPanel(I,J)I:Create('UIGradient',{Rotation=
270,Parent=J},{Color='ElementGradient'})I:Create('UICorner',{Parent=J},{CornerRadius='ElementCornerRadius'})local K=I:
Create('UIStroke',{Color=Color3.fromRGB(255,255,255),Transparency=1,Parent=J})I:Create('UIGradient',{Rotation=270,Parent
=K},{Color='ElementStrokeGradient'})return K end function h._reveal(I,J,K,L,M)if not J then return end if L then f.
tweenService:Create(J,M or i,K):Play()else for N,O in K do J[N]=O end end end function h._revealCommon(I,J,K)I:_reveal(J
.stroke,{Transparency=I.theme.ElementStrokeTransparency},K)I:_reveal(J.title,{TextTransparency=0},K)I:_reveal(J.main,{
BackgroundTransparency=I.theme.ElementTransparency or 0},K)if J.iconLabel then I:_reveal(J.iconLabel,{ImageTransparency=
0},K)end if J.descriptor then I:_reveal(J.descriptor.titleLabel,{TextTransparency=0.7},K)end end function h._hideCommon(
I,J,K)I:_reveal(J.stroke,{Transparency=1},K)I:_reveal(J.title,{TextTransparency=1},K)I:_reveal(J.main,{
BackgroundTransparency=1},K)if J.iconLabel then I:_reveal(J.iconLabel,{ImageTransparency=1},K)end if J.descriptor then I
:_reveal(J.descriptor.titleLabel,{TextTransparency=1},K)end end function h._collapsedRect(I)local J=if I.showIconOnly
then k else j if I._collapsedPosition then return I._collapsedPosition,J end local K=UDim2.new(l.X.Scale,l.X.Offset,l.Y.
Scale,l.Y.Offset+J.Y.Offset/2)return K,J end function h._interactive(I)return not I.animating and not I.hidden end
function h._settled(I)return not I.hidden and not I._revealing end function h.Connect(I,J,K)local L=J:Connect(K)table.
insert(I.connections,L)return L end function h.ConnectFor(I,J,K,L)local M=I:Connect(K,L)J.connections=J.connections or{}
table.insert(J.connections,M)return M end function h.Disconnect(I,J)if not J then return end local K=table.find(I.
connections,J)if K then table.remove(I.connections,K)end J:Disconnect()end function h.DestroySubtree(I,J)if not J then
return end local K={[J]=true}for L,M in J:GetDescendants()do K[M]=true end for L=#I.instances,1,-1 do local M=I.
instances[L]if K[M]then table.remove(I.instances,L)I.themeProperties[M]=nil I.localeProperties[M]=nil end end J:Destroy(
)end function h.DisconnectMany(I,J,K)if not K or#K==0 then return end local L={}for M,N in K do L[N]=true N:Disconnect()
end local function M(N)if not N then return end local O=0 for P=1,#N do local Q=N[P]if not L[Q]then O+=1 N[O]=Q end end
for P=#N,O+1,-1 do N[P]=nil end end M(I.connections)if J and J~=I then M(J.connections)end end function h.
DestroySubtrees(I,J)if not J or#J==0 then return end local K={}for L,M in J do K[M]=true for N,O in M:GetDescendants()do
K[O]=true end end local L=0 for M=1,#I.instances do local N=I.instances[M]if K[N]then I.themeProperties[N]=nil I.
localeProperties[N]=nil else L+=1 I.instances[L]=N end end for M=#I.instances,L+1,-1 do I.instances[M]=nil end for M,N
in J do N:Destroy()end end function h.Unload(I)I.unloaded=true al.teardown()al.releaseContainer(I.screenGui)if I.
_liveTween then I._liveTween:Cancel()I._liveTween=nil end for J=#I.connections,1,-1 do I.connections[J]:Disconnect()end
for J=#I.instances,1,-1 do I.instances[J]:Destroy()end table.clear(I.connections)table.clear(I.instances)table.clear(I.
themeProperties)table.clear(I.localeProperties)table.clear(I.controls)table.clear(I.tabs)end return h end)()end,[32]=
function()local aa,ab,ac=a(32)local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.
new(0,Color3.fromRGB(22,16,32)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(30,22,46)),ColorSequenceKeypoint.new(1,
Color3.fromRGB(38,28,56))},ShadowColor=Color3.fromRGB(12,6,22),ElementStroke=Color3.fromRGB(54,42,74),ElementGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,24,48)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
36,28,54)),ColorSequenceKeypoint.new(1,Color3.fromRGB(36,28,54))},ElementStrokeGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(72,58,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(88,72,124)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(72,58,104))},ElementStrokeHover=Color3.fromRGB(84,68,118),TabBackground=
ColorSequence.new(Color3.fromRGB(54,42,80),Color3.fromRGB(34,26,52)),TabStroke=ColorSequence.new(Color3.fromRGB(88,70,
128),Color3.fromRGB(54,42,80)),SliderBackground=Color3.fromRGB(46,36,68),SliderBackgroundHover=Color3.fromRGB(60,48,90),
SliderProgress=ColorSequence.new(Color3.fromRGB(170,112,248),Color3.fromRGB(138,80,224)),AccentColor=Color3.fromRGB(168,
110,246),AccentStroke=Color3.fromRGB(200,154,255),ToggleKnobOff=Color3.fromRGB(224,214,236),StatBackground=Color3.
fromRGB(24,18,38),DropdownHighlight=Color3.fromRGB(168,110,246),NeutralButton=Color3.fromRGB(46,36,68),
NeutralButtonHover=Color3.fromRGB(60,48,90),NeutralButtonStroke=Color3.fromRGB(140,116,190)}end)()end,[33]=function()
local aa,ab,ac=a(33)local ad return(function(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3
.fromRGB(12,16,34)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(20,26,50)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(28,36,66))},ShadowColor=Color3.fromRGB(6,8,20),ElementStroke=Color3.fromRGB(44,52,82),ElementGradient=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,32,58)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
30,38,66)),ColorSequenceKeypoint.new(1,Color3.fromRGB(30,38,66))},ElementStrokeGradient=ColorSequence.new{
ColorSequenceKeypoint.new(0,Color3.fromRGB(56,66,104)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(70,82,124)),
ColorSequenceKeypoint.new(1,Color3.fromRGB(56,66,104))},ElementStrokeHover=Color3.fromRGB(64,76,116),TabBackground=
ColorSequence.new(Color3.fromRGB(48,58,92),Color3.fromRGB(30,38,64)),TabStroke=ColorSequence.new(Color3.fromRGB(78,92,
140),Color3.fromRGB(48,58,92)),SliderBackground=Color3.fromRGB(40,48,78),SliderBackgroundHover=Color3.fromRGB(54,64,100)
,SliderProgress=ColorSequence.new(Color3.fromRGB(64,132,248),Color3.fromRGB(42,104,224)),AccentColor=Color3.fromRGB(48,
120,240),AccentStroke=Color3.fromRGB(96,164,255),ToggleKnobOff=Color3.fromRGB(196,206,232),StatBackground=Color3.
fromRGB(20,26,48),DropdownHighlight=Color3.fromRGB(48,120,240),NeutralButton=Color3.fromRGB(40,48,78),NeutralButtonHover
=Color3.fromRGB(54,64,100),NeutralButtonStroke=Color3.fromRGB(120,138,195)}end)()end,[34]=function()local aa,ab,ac=a(34)
local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables)return{CornerRoundness=UDim.new(0,20),
WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(10,10,10)),ColorSequenceKeypoint.new(0.9999,
Color3.fromRGB(25,25,25)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))},ShadowColor=Color3.fromRGB(20,20,20),
ElementStroke=Color3.fromRGB(35,35,35),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(30,
30,30)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(35,35,35)),ColorSequenceKeypoint.new(1,Color3.fromRGB(35,35,35))
},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(48,48,48)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(58,58,58)),ColorSequenceKeypoint.new(1,Color3.fromRGB(48,48,48))},TabColor=Color3.fromRGB(255,
255,255),TabBackground=ColorSequence.new(Color3.fromRGB(50,50,50),Color3.fromRGB(35,35,35)),TabStroke=ColorSequence.new(
Color3.fromRGB(95,95,95),Color3.fromRGB(50,50,50)),SliderBackground=Color3.fromRGB(47,47,47),SliderBackgroundHover=
Color3.fromRGB(60,60,60),SliderProgress=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),
SliderStroke=Color3.fromRGB(255,255,255),ActionColor=Color3.fromRGB(255,255,255),TitleFont=ae.brandFont(Enum.FontWeight.
SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(255,255,255),LiveAnimation=false,
DarkToggleOverlay=true,ElementTransparency=0,ElementStrokeTransparency=0,ElementStrokeHoverTransparency=0,
ElementStrokeHover=Color3.fromRGB(50,50,50),ElementCornerRadius=UDim.new(0,12),ElementTextHoverColor=Color3.fromRGB(255,
255,255),TitlingColor=Color3.fromRGB(255,255,255),DropdownHighlight=Color3.fromRGB(255,255,255),AccentColor=Color3.
fromRGB(23,153,110),AccentStroke=Color3.fromRGB(32,201,144),AccentGlow=0.4,StatBackground=Color3.fromRGB(25,25,25),
SliderHandle=Color3.fromRGB(255,255,255),PillCornerRadius=UDim.new(1,0),ToggleTrack=Color3.fromRGB(0,0,0),
ToggleTrackTransparency=0.9,ToggleKnobOff=Color3.fromRGB(255,255,255),ToggleKnobOffTransparency=0.8,FieldBackground=
Color3.fromRGB(255,255,255),FieldTransparency=0.9,FieldGlow=Color3.fromRGB(255,255,255),PlaceholderColor=Color3.fromRGB(
178,178,178),SurfaceStroke=Color3.fromRGB(255,255,255),NeutralButton=Color3.fromRGB(38,38,38),NeutralButtonHover=Color3.
fromRGB(54,54,54),NeutralButtonStroke=Color3.fromRGB(255,255,255),ErrorColor=Color3.fromRGB(185,50,50),ErrorStrokeColor=
Color3.fromRGB(240,75,75)}end)()end,[35]=function()local aa,ab,ac=a(35)local ad return(function(...)return{WindowColor=
ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(22,18,16)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(
32,27,23)),ColorSequenceKeypoint.new(1,Color3.fromRGB(40,33,28))},ShadowColor=Color3.fromRGB(16,12,8),ElementStroke=
Color3.fromRGB(54,46,40),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(32,27,23)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(38,32,27)),ColorSequenceKeypoint.new(1,Color3.fromRGB(38,32,27))},
ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(72,62,52)),ColorSequenceKeypoint.new(
0.9999,Color3.fromRGB(88,76,64)),ColorSequenceKeypoint.new(1,Color3.fromRGB(72,62,52))},ElementStrokeHover=Color3.
fromRGB(84,72,60),TabBackground=ColorSequence.new(Color3.fromRGB(56,47,40),Color3.fromRGB(36,30,26)),TabStroke=
ColorSequence.new(Color3.fromRGB(92,78,66),Color3.fromRGB(56,47,40)),SliderBackground=Color3.fromRGB(48,40,34),
SliderBackgroundHover=Color3.fromRGB(62,52,44),SliderProgress=ColorSequence.new(Color3.fromRGB(244,152,44),Color3.
fromRGB(220,110,24)),AccentColor=Color3.fromRGB(240,142,40),AccentStroke=Color3.fromRGB(255,182,92),ToggleKnobOff=Color3
.fromRGB(232,224,214),StatBackground=Color3.fromRGB(26,21,18),DropdownHighlight=Color3.fromRGB(240,142,40),NeutralButton
=Color3.fromRGB(48,40,34),NeutralButtonHover=Color3.fromRGB(64,54,46),NeutralButtonStroke=Color3.fromRGB(150,128,104)}
end)()end,[36]=function()local aa,ab,ac=a(36)local ad return(function(...)local ae=ac(ab.Parent.Parent.utility.variables
)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(246,249,251)),ColorSequenceKeypoint.
new(1,Color3.fromRGB(236,241,245))},ShadowColor=Color3.fromRGB(116,124,132),LiveAnimation=false,ElementTransparency=0,
ElementStroke=Color3.fromRGB(218,224,228),ElementGradient=ColorSequence.new(Color3.fromRGB(255,255,255)),
ElementStrokeGradient=ColorSequence.new(Color3.fromRGB(224,230,234),Color3.fromRGB(232,238,242)),
ElementStrokeTransparency=0.1,ElementStrokeHoverTransparency=0,ElementStrokeHover=Color3.fromRGB(0,176,208),
DarkToggleOverlay=false,TabColor=Color3.fromRGB(38,42,46),TabBackground=ColorSequence.new(Color3.fromRGB(0,176,208),
Color3.fromRGB(0,150,184)),TabStroke=ColorSequence.new(Color3.fromRGB(80,206,230),Color3.fromRGB(0,160,196)),
SliderBackground=Color3.fromRGB(224,230,234),SliderBackgroundHover=Color3.fromRGB(212,220,224),SliderProgress=
ColorSequence.new(Color3.fromRGB(0,182,214),Color3.fromRGB(0,146,182)),SliderStroke=Color3.fromRGB(200,206,210),
AccentColor=Color3.fromRGB(0,176,208),AccentStroke=Color3.fromRGB(96,210,232),AccentGlow=0.85,StatBackground=Color3.
fromRGB(255,255,255),SliderHandle=Color3.fromRGB(60,66,72),ToggleTrack=Color3.fromRGB(198,204,210),
ToggleTrackTransparency=0,ToggleKnobOffTransparency=0.05,FieldBackground=Color3.fromRGB(224,230,234),FieldTransparency=0
,FieldGlow=Color3.fromRGB(148,154,160),PlaceholderColor=Color3.fromRGB(138,144,150),SurfaceStroke=Color3.fromRGB(204,210
,214),NeutralButton=Color3.fromRGB(224,230,234),NeutralButtonHover=Color3.fromRGB(212,220,224),NeutralButtonStroke=
Color3.fromRGB(242,246,248),ActionColor=Color3.fromRGB(68,74,80),TitlingColor=Color3.fromRGB(26,30,34),TitleFont=ae.
brandFont(Enum.FontWeight.SemiBold),Font=ae.brandFont(Enum.FontWeight.Medium),ContentColor=Color3.fromRGB(42,46,52),
ElementTextHoverColor=Color3.fromRGB(18,22,26),DropdownHighlight=Color3.fromRGB(0,176,208),ErrorColor=Color3.fromRGB(200
,60,55),ErrorStrokeColor=Color3.fromRGB(240,80,70)}end)()end,[37]=function()local aa,ab,ac=a(37)local ad return(function
(...)return{WindowColor=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(26,18,22)),ColorSequenceKeypoint.
new(0.9999,Color3.fromRGB(36,26,31)),ColorSequenceKeypoint.new(1,Color3.fromRGB(44,32,38))},ShadowColor=Color3.fromRGB(
18,10,14),ElementStroke=Color3.fromRGB(58,44,50),ElementGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.
fromRGB(34,25,29)),ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(40,30,34)),ColorSequenceKeypoint.new(1,Color3.
fromRGB(40,30,34))},ElementStrokeGradient=ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.fromRGB(76,58,66)),
ColorSequenceKeypoint.new(0.9999,Color3.fromRGB(92,70,80)),ColorSequenceKeypoint.new(1,Color3.fromRGB(76,58,66))},
ElementStrokeHover=Color3.fromRGB(88,66,74),TabBackground=ColorSequence.new(Color3.fromRGB(62,46,53),Color3.fromRGB(38,
29,33)),TabStroke=ColorSequence.new(Color3.fromRGB(102,78,88),Color3.fromRGB(62,46,53)),SliderBackground=Color3.fromRGB(
50,38,44),SliderBackgroundHover=Color3.fromRGB(64,50,56),SliderProgress=ColorSequence.new(Color3.fromRGB(244,88,140),
Color3.fromRGB(220,60,116)),AccentColor=Color3.fromRGB(240,82,138),AccentStroke=Color3.fromRGB(255,134,178),
ToggleKnobOff=Color3.fromRGB(236,220,226),StatBackground=Color3.fromRGB(28,20,24),DropdownHighlight=Color3.fromRGB(240,
82,138),NeutralButton=Color3.fromRGB(50,38,44),NeutralButtonHover=Color3.fromRGB(64,50,56),NeutralButtonStroke=Color3.
fromRGB(170,122,140)}end)()end,[38]=function()local aa,ab,ac=a(38)local ad return(function(...)export type Theme=string|
{[string]:any}export type Translator=(source:string,localeId:string)->string?export type Translations={[string]:{[string
]:string}}export type WindowConfiguration={autoSave:boolean?,autoLoad:boolean?,fileName:string?,customFolder:string?}
export type WindowProps={name:string?,subtitle:string?,theme:Theme?,icon:(string|number)?,showName:string?,showIcon:(
string|number)?,showIconOnly:boolean?,sidebarLayout:boolean?,profile:string?,configuration:WindowConfiguration?,
fallbackFont:(Font|Enum.Font)?,locale:string?,translations:Translations?,translator:Translator?}export type TabProps={
name:string?,icon:(string|number)?}export type TagProps={text:string?,title:string?,icon:(string|number)?,color:Color3?,
order:number?}export type SectionProps={name:string?,icon:(string|number)?}export type TextProps={name:string?,text:
string?,icon:(string|number)?}export type DividerProps={text:string?,spacing:number?,line:boolean?}export type
GroupProps={direction:string?}export type ButtonProps={name:string?,description:string?,icon:(string|number)?,callback:(
()->())?}export type ToggleProps={name:string?,description:string?,icon:(string|number)?,flag:string?,value:boolean?,
forgetState:boolean?,callback:((value:boolean)->())?}export type SliderProps={name:string?,description:string?,icon:(
string|number)?,flag:string?,range:{number}?,increment:number?,value:number?,suffix:string?,minimal:boolean?,forgetState
:boolean?,callback:((value:number,dragging:boolean)->())?}export type DropdownProps={name:string?,description:string?,
icon:(string|number)?,flag:string?,options:{string}?,value:(string|{string})?,multiSelect:boolean?,placeholder:string?,
forgetState:boolean?,callback:((value:any)->())?}export type InputProps={name:string?,description:string?,icon:(string|
number)?,flag:string?,value:string?,placeholder:string?,numeric:boolean?,clearOnFocus:boolean?,forgetState:boolean?,
callback:((value:string)->())?}export type KeybindProps={name:string?,description:string?,icon:(string|number)?,flag:
string?,value:(EnumItem|string)?,forgetState:boolean?,isMenuToggle:boolean?,hold:boolean?,holdThreshold:number?,callback
:((value:EnumItem|boolean)->())?,onChanged:((key:EnumItem)->())?}export type ColorPickerProps={name:string?,description:
string?,icon:(string|number)?,flag:string?,color:Color3?,alpha:number?,forgetState:boolean?,callback:((value:Color3,
alpha:number)->())?}export type StatProps={name:string?,description:string?,icon:(string|number)?,prefix:string?,suffix:
string?,value:number?,display:string?,compact:boolean?,changeMode:string?,changeBaseline:string?,numberEasing:boolean?}
export type ProgressProps={name:string?,description:string?,icon:(string|number)?,range:{number}?,value:number?,steps:
number?,text:string?,format:((value:number,min:number,max:number)->string)?,showValue:boolean?,indeterminate:boolean?}
export type ConsoleProps={name:string?,description:string?,text:string?,height:number?,follow:boolean?,maxLines:number?}
export type NotifyProps={title:string?,content:string?,icon:(string|number)?,duration:number?}export type ToastProps={
title:string?,subtitle:string?,subtitleAbove:boolean?,icon:(string|number)?,avatar:number?,minWidth:number?,duration:
number?,position:'Top'|'Bottom'?}export type PopupBox={title:string?,description:string?,icon:(string|number)?}export
type PopupOption={text:string?,style:string?,callback:(()->())?}export type PopupProps={title:string?,subtitle:string?,
icon:(string|number)?,content:string?,boxes:{PopupBox}?,options:{PopupOption}?,dismissable:boolean?}export type Moveable
={MoveTo:(self:any,index:number)->(),MoveToTop:(self:any)->(),MoveToBottom:(self:any)->(),MoveUp:(self:any)->(),MoveDown
:(self:any)->()}export type Lockable={Lock:(self:any,reason:string?)->(),Unlock:(self:any)->(),IsLocked:(self:any)->
boolean}export type Button=Moveable&Lockable&{}export type Toggle=Moveable&Lockable&{value:boolean,Set:(self:Toggle,
value:boolean,skipCallback:boolean?)->()}export type Slider=Moveable&Lockable&{value:number,Set:(self:Slider,value:
number,skipCallback:boolean?)->()}export type Dropdown=Moveable&Lockable&{value:{string},Set:(self:Dropdown,value:string
|{string},skipCallback:boolean?)->(),Refresh:(self:Dropdown,options:{string})->(),Add:(self:Dropdown,option:string)->(),
Remove:(self:Dropdown,option:string)->()}export type Input=Moveable&Lockable&{value:string,Set:(self:Input,value:string,
skipCallback:boolean?)->()}export type Keybind=Moveable&Lockable&{value:EnumItem,Set:(self:Keybind,value:EnumItem|string
,skipChanged:boolean?)->()}export type ColorPicker=Moveable&Lockable&{value:Color3,alpha:number,Set:(self:ColorPicker,
value:Color3|string,skipCallback:boolean?)->(),SetAlpha:(self:ColorPicker,alpha:number,skipCallback:boolean?)->()}export
type Stat=Moveable&{value:number,Set:(self:Stat,value:number)->(),ResetBaseline:(self:Stat,value:number?)->()}export
type Progress=Moveable&{value:number,Set:(self:Progress,value:number)->(),Get:(self:Progress)->number,GetPercentage:(
self:Progress)->number,SetRange:(self:Progress,min:number,max:number)->(),SetText:(self:Progress,text:string?)->(),
SetIndeterminate:(self:Progress,state:boolean)->(),Remove:(self:Progress)->()}export type Console=Moveable&{Set:(self:
Console,text:string)->(),Append:(self:Console,line:string)->(),Clear:(self:Console)->(),Get:(self:Console)->string,Copy:
(self:Console)->boolean,SetHeight:(self:Console,height:number)->(),Remove:(self:Console)->()}export type Section=
Moveable&{}export type TabSection={Remove:(self:TabSection)->()}export type Text=Moveable&{name:string,text:string,Set:(
self:Text,text:string)->(),SetTitle:(self:Text,title:string)->()}export type Divider=Moveable&{text:string,Set:(self:
Divider,text:string?)->()}export type Tag={Set:(self:Tag,props:TagProps)->(),SetColor:(self:Tag,color:Color3)->(),
SetText:(self:Tag,text:string?)->(),SetIcon:(self:Tag,icon:(string|number)?)->(),Remove:(self:Tag)->()}export type Popup
={Close:(self:Popup)->()}export type Group=Moveable&{CreateButton:(self:Group,props:ButtonProps)->Button,CreateToggle:(
self:Group,props:ToggleProps)->Toggle,CreateSwitch:(self:Group,props:ToggleProps)->Toggle,CreateStat:(self:Group,props:
StatProps)->Stat,CreateSlider:(self:Group,props:SliderProps)->Slider,CreateDropdown:(self:Group,props:DropdownProps)->
Dropdown?,CreateSection:(self:Group,props:SectionProps)->Section?,CreateText:(self:Group,props:TextProps)->Text?,
CreateDivider:(self:Group,props:DividerProps?)->Divider?,CreateGroup:(self:Group,props:GroupProps?)->Group}export type
Tab={Select:(self:Tab,noAnimation:boolean?)->(),Deselect:(self:Tab,noAnimation:boolean?)->(),Remove:(self:Tab)->(),
CreateButton:(self:Tab,props:ButtonProps)->Button,CreateToggle:(self:Tab,props:ToggleProps)->Toggle,CreateSwitch:(self:
Tab,props:ToggleProps)->Toggle,CreateSlider:(self:Tab,props:SliderProps)->Slider,CreateDropdown:(self:Tab,props:
DropdownProps)->Dropdown,CreateInput:(self:Tab,props:InputProps)->Input,CreateKeybind:(self:Tab,props:KeybindProps)->
Keybind,CreateColorPicker:(self:Tab,props:ColorPickerProps)->ColorPicker,CreateStat:(self:Tab,props:StatProps)->Stat,
CreateProgress:(self:Tab,props:ProgressProps)->Progress,CreateConsole:(self:Tab,props:ConsoleProps)->Console,
CreateSection:(self:Tab,props:SectionProps)->Section,CreateText:(self:Tab,props:TextProps)->Text,CreateDivider:(self:Tab
,props:DividerProps?)->Divider,CreateGroup:(self:Tab,props:GroupProps?)->Group}export type Window={unloaded:boolean,
Flags:{[string]:any},CreateTab:(self:Window,props:TabProps)->Tab,CreateSection:(self:Window,props:SectionProps)->
TabSection,CreateTag:(self:Window,props:TagProps)->Tag,Notify:(self:Window,props:NotifyProps)->(),Toast:(self:Window,
props:ToastProps)->(),Popup:(self:Window,props:PopupProps)->Popup?,Show:(self:Window)->(),Hide:(self:Window)->(),
ToggleHide:(self:Window)->(),ToggleMinimise:(self:Window)->(),Navigate:(self:Window,tab:string|Tab)->(),ChangeTheme:(
self:Window,theme:Theme)->(),SetLocale:(self:Window,localeId:string)->(),SetTranslator:(self:Window,translator:
Translator?)->(),RegisterTranslations:(self:Window,translations:Translations)->(),Save:(self:Window,name:string?)->
boolean,Load:(self:Window,name:string?)->boolean,ListConfigs:(self:Window)->{string},DeleteConfig:(self:Window,name:
string)->boolean,GetPath:(self:Window)->(string,string),Get:(self:Window,flag:string)->any,Set:(self:Window,flag:string,
value:any)->boolean,Unload:(self:Window)->()}export type Rayfield={CreateWindow:(self:Rayfield,props:WindowProps)->
Window}return{}end)()end,[40]=function()local aa,ab,ac=a(40)local ad return(function(...)local ae,af=ac(ab.Parent.
variables),{}af.enabled=false type HapticTypes={click:Enum.HapticEffectType?,notify:Enum.HapticEffectType?}local ag:
HapticTypes,ah,ai={},pcall(function()Instance.new'HapticEffect':Destroy()return{click=Enum.HapticEffectType.UIHover,
notify=Enum.HapticEffectType.UIClick}end)if ah then ag=ai end local aj:{[Enum.HapticEffectType]:Instance},ak:Instance?={
}function af.setContainer(al:Instance?)ak=al end function af.releaseContainer(al:Instance?)if al==nil or ak==al then ak=
nil end end local function al():Instance if ak and ak.Parent then return ak end return ae.guiContainer end
local function am(b:Enum.HapticEffectType):Instance?local c=aj[b]if c and c.Parent then return c end local d,e=pcall(
Instance.new,'HapticEffect')if not d then return nil end local f=e::any f.Type=b local g=pcall(function()e.Parent=al()
end)if not g then e:Destroy()return nil end aj[b]=e return e end local function b(c:Enum.HapticEffectType?)if not c or
not af.enabled then return end local d=am(c)if d then local e=d::any pcall(e.Play,d)end end function af.click()b(ag.
click)end function af.notify()b(ag.notify)end function af.setEnabled(c:boolean?)af.enabled=c and true or false if not af
.enabled then af.teardown()end end function af.teardown()for c,d in aj do pcall(d.Destroy,d)aj[c]=nil end end return af
end)()end,[41]=function()local aa,ab,ac=a(41)local ad return(function(...)local ae,af=ac(ab.Parent.network),ac(ab.Parent
.log)export type AssetId=number|string export type AssetDownloadUrl=string export type CacheKey=AssetId export type
ResolvedAsset=AssetId export type AssetRequestPayload={Url:string,Method:string}local ag={Enum={AssetDownloadUrl={
RobloxDownloadUrl='https://assetdelivery.roblox.com/v1/asset/?id=%d'::AssetDownloadUrl,RoProxyDownloadUrl=
'https://assetdelivery.roproxy.com/v1/asset?id=%d'::AssetDownloadUrl}}}ag.__index=ag ag.__type='assetResolver'type
AssetResolverState={contentCache:{[CacheKey]:string}?,contentCacheOrder:{CacheKey}?,contentDownloadUrl:AssetDownloadUrl,
pendingRequests:{[CacheKey]:{thread}}}export type AssetResolver=AssetResolverState&{resolve:(self:AssetResolver,value:
unknown)->ResolvedAsset?,getAssetContentFromUrl:(self:AssetResolver,url:string,cacheKey:CacheKey?,forced:boolean?)->
string?,getAssetContentFromId:(self:AssetResolver,id:AssetId,forced:boolean?)->string?}local ah=8 function ag.new(ai:
boolean?,aj:AssetDownloadUrl?):AssetResolver local ak:{[CacheKey]:string}?=if ai then{}else nil local al=setmetatable({
contentCache=ak,contentCacheOrder=if ai then{}::{CacheKey}else nil,contentDownloadUrl=aj or ag.Enum.AssetDownloadUrl.
RobloxDownloadUrl,pendingRequests={}}::AssetResolverState,ag)::any return al end function ag.resolve(ai:AssetResolver,aj
:unknown):ResolvedAsset?if type(aj)=='number'then return aj end if type(aj)~='string'then return nil end if string.sub(
aj,1,11)=='rbxasset://'or string.sub(aj,1,11)=='rbxthumb://'then return aj end local ak=tonumber(string.match(aj,
'^rbxassetid://(%d+)$'))if ak then return ak end return nil end local function ai(aj:unknown):boolean if type(aj)~=
'table'then return false end local ak=aj::{Body:unknown,StatusCode:unknown,Success:unknown}local al=ak.Body if type(al)
~='string'or#al==0 then return false end if type(ak.StatusCode)=='number'then local am=ak.StatusCode::number return am>=
200 and am<300 end if type(ak.Success)=='boolean'then return ak.Success::boolean end return false end function ag.
getAssetContentFromUrl(aj:AssetResolver,ak:string,al:CacheKey?,am:boolean?):string?local b=aj.contentCache if al~=nil
and b and not am then local c=b[al]if c then return c end end local c=aj.pendingRequests if al~=nil then local d=c[al]if
d then table.insert(d,coroutine.running())return coroutine.yield()end c[al]={}end local d,e:string?=(ae.getRequestFn())
if not d then af.warn'No request function available to download asset content.'else local f,g=pcall(d,{Url=ak,Method=
'GET'}::AssetRequestPayload)if f and ai(g)then local h=(g::{Body:string}).Body e=h if al~=nil and b then local i=aj.
contentCacheOrder if i and b[al]==nil then table.insert(i,al)local j=if#i>ah then table.remove(i,1)else nil if j~=nil
then b[j]=nil end end b[al]=h end elseif not am then af.warn('Failed to download asset content for url: '..tostring(ak))
end end if al~=nil then local f=c[al]c[al]=nil if f then for g,h in f do coroutine.resume(h,e)end end end return e end
function ag.getAssetContentFromId(aj:AssetResolver,ak:AssetId,al:boolean?):string?local am=aj:resolve(ak)if not am or
type(am)~='number'then af.warn('Invalid asset id: '..tostring(am))return nil end local b=string.format(aj.
contentDownloadUrl,am)return aj:getAssetContentFromUrl(b,am,al)end return ag end)()end,[42]=function()local aa,ab,ac=a(
42)local ad return(function(...)local ae={}function ae.contrastColor(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+
0.114*af.B return if ag>0.5 then Color3.fromRGB(0,0,0)else Color3.fromRGB(255,255,255)end function ae.toColorSequence(af
:Color3|ColorSequence):ColorSequence return if typeof(af)=='ColorSequence'then af else ColorSequence.new(af)end function
ae.contrastText(af:Color3):Color3 local ag=0.299*af.R+0.587*af.G+0.114*af.B return if ag>0.6 then Color3.fromRGB(20,20,
20)else Color3.fromRGB(255,255,255)end return ae end)()end,[43]=function()local aa,ab,ac=a(43)local ad return(function(
...)local ae={}ae.fontAsset='rbxassetid://12187365364'ae.pillResizeInfo=TweenInfo.new(0.4,Enum.EasingStyle.Exponential,
Enum.EasingDirection.Out)ae.icons={close=83277910885129,minimise=108115485663409,maximise=88738500661569,settings=
129180860773723,search=100604009889706,chevron=88479147175134,check=125626312718314,dot=91452555903853,colorpicker=
91452555903853,banner=111263549366178,config=125823673784681,rayfield=80387863064905}ae.accent={on=Color3.fromRGB(23,153
,110),onStroke=Color3.fromRGB(32,201,144)}ae.statAccents={positive={fill=ColorSequence.new(Color3.fromRGB(0,170,127),
Color3.fromRGB(0,134,98)),stroke=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))},negative={fill=
ColorSequence.new(Color3.fromRGB(172,47,47),Color3.fromRGB(135,37,37)),stroke=ColorSequence.new(Color3.fromRGB(255,75,75
),Color3.fromRGB(244,67,67))},neutral={fill=ColorSequence.new(Color3.fromRGB(0,170,127),Color3.fromRGB(0,134,98)),stroke
=ColorSequence.new(Color3.fromRGB(0,213,156),Color3.fromRGB(0,189,135))}}ae.zIndex={elementLock=60,elementLockContent=65
,bottomFade=100,notification=1500,drag=1000,toast=2000,toastContent=2001,restoreContent=100001,restoreInteract=100002}ae
.displayOrder={window=99999,banner=100000,popup=100001}return ae end)()end,[44]=function()local aa,ab,ac=a(44)local ad
return(function(...)local ae={}function ae.itemFromValue(af,ag)local ah,ai=pcall(function()return af:FromValue(ag)end)if
ah and ai then return ai end local aj,ak=pcall(function()return af:GetEnumItems()end)if not aj then return nil end for
al,am in ak do if am.Value==ag then return am end end return nil end return ae end)()end,[45]=function()local aa,ab,ac=
a(45)local ad return(function(...)local ae,af=ac(ab.Parent.services),{}local ag=ae.getService'RunService':IsStudio()
local ah=not ag and typeof(writefile)=='function'and typeof(readfile)=='function'and typeof(isfile)=='function'and
typeof(isfolder)=='function'and typeof(makefolder)=='function'and typeof(listfiles)=='function'and typeof(delfile)==
'function'and typeof(delfolder)=='function'if ah then function af.writefile(ai:string,aj:string)writefile(ai,aj)end
function af.readfile(ai:string):string return readfile(ai)end if typeof(appendfile)=='function'then function af.
appendfile(ai:string,aj:string)appendfile(ai,aj)end end function af.isfile(ai:string):boolean return isfile(ai)end
function af.delfile(ai:string)delfile(ai)end function af.listfiles(ai:string):{string}return listfiles(ai)end function
af.makefolder(ai:string)makefolder(ai)end function af.isfolder(ai:string):boolean return isfolder(ai)end function af.
delfolder(ai:string)delfolder(ai)end elseif ag then local ai=Instance.new'Folder'ai.Name='Filesystem'ai.Parent=ae.
getService'ReplicatedStorage'local function aj(ak:string):{string}local al={}for am in string.gmatch(ak,'[^/]+')do table
.insert(al,am)end return al end local function ak(al:{string},am:boolean):Instance?local b:Instance=ai for c=1,#al-1 do
local d=b:FindFirstChild(al[c])if not d then if not am then return nil end local e=Instance.new'Folder'e.Name=al[c]e.
Parent=b d=e end b=d::Instance end return b end local function al(am:Instance?):StringValue?if am and am:IsA
'StringValue'then return am end return nil end function af.writefile(am:string,b:string)local c=aj(am)assert(#c>0,
'Invalid path')local d=ak(c,true)assert(d,'Invalid path')local e=c[#c]local f=d:FindFirstChild(e)local g=al(f)if g then
g.Value=b else if f then f:Destroy()end local h=Instance.new'StringValue'h.Name=e h.Value=b h.Parent=d end end function
af.readfile(am:string):string local b=aj(am)assert(#b>0,'Invalid path')local c=ak(b,false)assert(c,'File not found: '..
am)local d=c:FindFirstChild(b[#b])local e=al(d)assert(e,'File not found: '..am)return e.Value end function af.isfile(am:
string):boolean local b=aj(am)if#b==0 then return false end local c=ak(b,false)if not c then return false end return al(
c:FindFirstChild(b[#b]))~=nil end function af.listfiles(am:string):{string}local b,c:Instance=aj(am),ai for d,e in b do
local f=c:FindFirstChild(e)if not f or not f:IsA'Folder'then error('Folder not found: '..am)end c=f end local d:{string}
={}for e,f in c:GetChildren()do table.insert(d,am..'/'..f.Name)end return d end function af.delfile(am:string)local b=
aj(am)assert(#b>0,'Invalid path')local c=ak(b,false)assert(c,'File not found: '..am)local d=c:FindFirstChild(b[#b])local
e=al(d)assert(e,'File not found: '..am)e:Destroy()end function af.makefolder(am:string)local b=aj(am)if#b==0 then return
end local c:Instance=ai for d,e in b do local f=c:FindFirstChild(e)if not f then local g=Instance.new'Folder'g.Name=e g.
Parent=c f=g end c=f::Instance end end function af.isfolder(am:string):boolean local b=aj(am)if#b==0 then return false
end local c:Instance=ai for d,e in b do local f=c:FindFirstChild(e)if not f or not f:IsA'Folder'then return false end c=
f end return true end function af.delfolder(am:string)local b=aj(am)assert(#b>0,'Invalid path')local c=ak(b,false)
assert(c,'Folder not found: '..am)local d=c:FindFirstChild(b[#b])assert(d and d:IsA'Folder','Folder not found: '..am)d:
Destroy()end end if af.writefile and not af.appendfile then function af.appendfile(ai:string,aj:string)local ak=if af.
isfile(ai)then af.readfile(ai)else nil af.writefile(ai,if ak then ak..aj else aj)end end function af.ensureFolder(ai:
string)if not af.isfolder(ai)then af.makefolder(ai)end end function af.ensureDir(ai:string)local aj=''for ak in string.
gmatch(ai,'[^/]+')do aj=if aj==''then ak else aj..'/'..ak if not af.isfolder(aj)then af.makefolder(aj)end end end return
af end)()end,[46]=function()local aa,ab,ac=a(46)local ad return(function(...)local ae,af,ag,ah=ac(ab.Parent.filesystem),
ac(ab.Parent.path),'Rayfield',{}ah.__index=ah export type FileSystemManager={root:string,assets:string,getPath:(self:
FileSystemManager,subpath:string?)->string,getAssetsFolder:(self:FileSystemManager,subfolder:string?)->string,
getRootFolder:(self:FileSystemManager)->string}function ah.new(ai:string?):FileSystemManager local aj=ai or ag local ak=
setmetatable({root=aj,assets=aj..'/Assets'},ah)::any pcall(ae.ensureFolder,ak.root)pcall(ae.ensureFolder,ak.assets)
return ak end function ah.getPath(ai,aj:string?):string return af.join(ai.root,aj)end function ah.getAssetsFolder(ai,aj:
string?):string if aj then local ak=af.join(ai.assets,aj)pcall(ae.ensureFolder,ak)return ak end return ai.assets end
function ah.getRootFolder(ai):string return ai.root end return ah end)()end,[47]=function()local aa,ab,ac=a(47)local ad
return(function(...)local ae,af,ag={},2166136261,16777619 local function ah(ai:string):number local aj=af for ak=1,#ai
do aj=bit32.bxor(aj,string.byte(ai,ak))local al=aj%65536 local am=(aj-al)/65536 aj=(((am*ag)%65536)*65536+al*ag)%
4294967296 end return aj end function ae.deriveFlagFromName(ai:string):string local aj=ai:gsub('(%S+)',function(aj:
string):string return aj:sub(1,1):upper()..aj:sub(2,-1)end):gsub('[^%w]','')if aj==''and ai~=''then return string.
format('Flag%08x',ah(ai))end return aj end return ae end)()end,[48]=function()local aa,ab,ac=a(48)local ad return(
function(...)local ae=ac(ab.Parent.services)local af,ag,ah,ai,aj,ak=ae.getService'HttpService',ae.getService'RunService'
,ac(ab.Parent.filesystem),ac(ab.Parent.assetResolver),ac(ab.Parent.log),ac(ab.Parent.path)local function al(am:unknown):
string?local b,c=pcall(function()return af:JSONEncode(am)end)if b and type(c)=='string'then return c else aj.warn(
'Failed to encode JSON:',c)return nil end end local function am(b:string):unknown?local c,d=pcall(function()return af:
JSONDecode(b)end)if c then return d else aj.warn('Failed to decode JSON:',d)return nil end end local b={}b.__type=
'fontManager'export type FontFace={name:string,family:string,weight:number,style:string,assetId:string}export type
FontManifest={name:string,faces:{FontFace}}export type CachedFont={customId:number|string,manifest:FontManifest,
loadedFromDisk:boolean,variants:{[string]:Font}}export type FontCache={[number]:CachedFont}export type
FontResolverOptions={fallbackFont:Font?,saveToDisk:boolean?,skipCache:boolean?}type FontManagerState={_debug:boolean,
_pendingLoads:{[string]:{thread}},rootFolder:string,assetResolver:ai.AssetResolver,defaultOptions:FontResolverOptions,
fontCache:FontCache?}export type FontManager=FontManagerState&{resolve:(self:FontManager,id:number|string)->Font?,
loadFont:(self:FontManager,id:(number|string)?,fontWeight:Enum.FontWeight?,fontStyle:Enum.FontStyle?,saveToDisk:boolean?
,skipCache:boolean?)->Font?,getFontFromId:(self:FontManager,id:number|string)->Font?}export type fontManager=FontManager
local function c(d:unknown):FontManifest?local e=d::any if type(e)~='table'or type(e.name)~='string'or type(e.faces)~=
'table'then return nil end e.name=ak.sanitizeFile(e.name)if#e.name==0 or#e.faces==0 then return nil end for f,g in e.
faces do if type(g)~='table'or type(g.name)~='string'or type(g.assetId)~='string'then return nil end g.name=ak.
sanitizeFile(g.name)if#g.name==0 then return nil end end return e::FontManifest end local d={'\0\1\0\0','OTTO','true',
'ttcf','wOFF','wOF2'}local function e(f:string):boolean for g,h in d do if string.sub(f,1,#h)==h then return true end
end return false end local f=getfenv()local function g(h:Enum.FontWeight,i:Enum.FontStyle):string return tostring(h)..
'|'..tostring(i)end local function h(i:unknown):number?if type(i)=='number'then return i end if type(i)=='string'then
return tonumber(i)end return nil end function b.__index(i:FontManagerState,j:unknown):unknown local k=(b::any)[j]if k~=
nil then return k end local l=h(j)if not l then return nil end local m=i.fontCache if m then local n=m[l]if n then local
o=g(Enum.FontWeight.Regular,Enum.FontStyle.Normal)local p=n.variants and n.variants[o]if p then return p end for q,r in
pairs(n.variants or{})do return r end end end return nil end function b.new(i:string,j:boolean?,k:boolean?,l:ai.
AssetDownloadUrl?,m:FontResolverOptions?):FontManager local n=m or{saveToDisk=true,skipCache=not k or false,fallbackFont
=Font.fromEnum(Enum.Font.SourceSans)}local o=setmetatable({rootFolder=i,fontCache=if k then{}::FontCache else nil,
assetResolver=ai.new(k,l),defaultOptions=n,_debug=j or ag:IsStudio()or false,_pendingLoads={}}::FontManagerState,b)::any
pcall(ah.ensureFolder,i)return o end local function i(j:FontManager,k:number,l:Enum.FontWeight,m:Enum.FontStyle,n:string
):Font?local o=j.rootFolder..'/'..k..'.json'if typeof(ah.isfile)~='function'then return j.defaultOptions.fallbackFont
end local p,q:string?=false if ag:IsStudio()and j._debug then aj.warn
[[Font manifest loading is not supported in Studio. Using default font manifest for testing.]]q=
[[{"name":"Inter","faces":[{"name":"Thin","weight":100,"style":"normal","assetId":"rbxassetid://12187277209"},{"name":"Extra Light","weight":200,"style":"normal","assetId":"rbxassetid://12187293441"},{"name":"Light","weight":300,"style":"normal","assetId":"rbxassetid://12187268450"},{"name":"Regular","weight":400,"style":"normal","assetId":"rbxassetid://12187266066"},{"name":"Medium","weight":500,"style":"normal","assetId":"rbxassetid://12187336822"},{"name":"Semi Bold","weight":600,"style":"normal","assetId":"rbxassetid://12187254443"},{"name":"Bold","weight":700,"style":"normal","assetId":"rbxassetid://12187275575"},{"name":"Extra Bold","weight":800,"style":"normal","assetId":"rbxassetid://12187267750"},{"name":"Black","weight":900,"style":"normal","assetId":"rbxassetid://12187359223"}]}]]
elseif ah.isfile(o)then local r,s=pcall(ah.readfile,o)q=r and s or nil else q=j.assetResolver:getAssetContentFromId(k,
false)p=q~=nil end local r:FontManifest?if q then local s,t=pcall(am,q)if s and t then r=c(t)else if j._debug then aj.
warn('Failed to parse font manifest for font id: '..tostring(k)..'. Error: '..tostring(t))end end else return j.
defaultOptions.fallbackFont end if not r then if j._debug then aj.warn('Font manifest is nil for font id: '..tostring(k)
)end pcall(ah.delfile,o)return j.defaultOptions.fallbackFont end if p and q then pcall(ah.writefile,o,q)end local s,t=j.
rootFolder..'/'..r.name,true if not pcall(ah.ensureFolder,s)then return j.defaultOptions.fallbackFont end for u,v in
ipairs(r.faces)do local w=s..'/'..v.name:gsub(' ','-')..'.ttf'if ah.isfile(w)then local x,y=pcall(ah.readfile,w)if not x
or type(y)~='string'or not e(y)then pcall(ah.delfile,w)end end if not ah.isfile(w)then local x=j.assetResolver:resolve(v
.assetId)local y=if x~=nil then j.assetResolver:getAssetContentFromId(x,false)else nil if not y or not e(y)then t=false
if j._debug then aj.warn('Font face content is missing or not a font for font id: '..tostring(k)..', face: '..v.name)end
continue end pcall(ah.writefile,w,y)end local x,y=pcall(f.getcustomasset,w)if x and type(y)=='string'then r.faces[u].
assetId=y if j._debug then aj.print('Loaded font face for id: '..tostring(k)..', face: '..v.name)end else t=false if j.
_debug then aj.warn('Failed to load font face for id: '..tostring(k)..', face: '..v.name)end end end if not t then
return j.defaultOptions.fallbackFont end local u=al(r)if not u or not pcall(ah.writefile,s..'/manifest.json',u)then
return j.defaultOptions.fallbackFont end local v,w=pcall(f.getcustomasset,s..'/manifest.json')if not v or not w then if
j._debug then aj.warn('Failed to load font manifest for id: '..tostring(k))end return j.defaultOptions.fallbackFont end
local x,y=pcall(Font.new,w::any,l,m)if not x or not y then if j._debug then aj.warn('Failed to load font for id: '..
tostring(k))end return j.defaultOptions.fallbackFont end local z=j.fontCache if z then z[k]={customId=w,manifest=r,
loadedFromDisk=true,variants={[n]=y}}if j._debug then aj.print('Cached font for id: '..tostring(k))end end return y end
function b.loadFont(j:FontManager,k:(number|string)?,l:Enum.FontWeight?,m:Enum.FontStyle?,n:boolean?,o:boolean?):Font?if
n==nil then n=j.defaultOptions.saveToDisk end if o==nil then o=j.defaultOptions.skipCache end local p,q=l or Enum.
FontWeight.Regular,m or Enum.FontStyle.Normal local r,s=g(p,q),j.assetResolver:resolve(k)local t=h(s)if not t then aj.
warn('Invalid font id: '..tostring(k))return j.defaultOptions.fallbackFont end local u=j.fontCache if u and not o then
local v=u[t]if v then local w=v.variants and v.variants[r]if w then if j._debug then aj.print(
'Loaded font from cache for id: '..tostring(t))end return w end local x,y=pcall(Font.new,v.customId::any,p,q)if x and y
then v.variants=v.variants or{}v.variants[r]=y if j._debug then aj.print('Loaded font variant from cache for id: '..
tostring(t))end return y else if j._debug then aj.warn('Failed to load font from cache for id: '..tostring(t))end u[t]=
nil return j.defaultOptions.fallbackFont end end end if not n then if j._debug then aj.warn
[[Font loading without saving to disk can be detected by Anti-cheats.]]end return j.defaultOptions.fallbackFont end
local v,w=j._pendingLoads,tostring(t)..'|'..r local x=v[w]if x then table.insert(x,coroutine.running())return coroutine.
yield()end v[w]={}local y,z=pcall(i,j,t,p,q,r)local A=if y then z else j.defaultOptions.fallbackFont x=v[w]v[w]=nil if x
then for B,C in x do coroutine.resume(C,A)end end return A end function b.resolve(j:FontManager,k:number|string):Font?
local l=h(k)if not l then return nil end local m=j.fontCache if m then local n=m[l]if n then if j._debug then aj.print(
'Resolved font for id: '..tostring(l))end for o,p in pairs(n.variants or{})do return p end end end return nil end
function b.getFontFromId(j:FontManager,k:number|string):Font?return j:resolve(k)end return b end)()end,[49]=function()
local aa,ab,ac=a(49)local ad return(function(...)local ae,af,ag,ah={},ac(ab.Parent.textMetrics),ac(ab.Parent.colors),ac(
ab.Parent.flagNames)ae.textWidth=af.textWidth ae.textHeight=af.textHeight ae.deriveFlagFromName=ah.deriveFlagFromName ae
.contrastColor=ag.contrastColor ae.toColorSequence=ag.toColorSequence ae.contrastText=ag.contrastText return ae end)()
end,[50]=function()local aa,ab,ac=a(50)local ad return(function(...)local ae,af=ac(ab.Parent.imageCache),ac(ab.Parent.
variables)type AvatarCallback=ae.AvatarCallback type PreloadCallback=ae.PreloadCallback local ag={}ag.rewrites=ae.
rewrites ag.onBlock=nil::((unknown)->())?type PendingProperties={[string]:boolean}ag.pending={}::{[number]:{[Instance]:
PendingProperties}}local ah,ai:{[string]:boolean}=false,{Image=true,HoverImage=true,PressedImage=true}local function aj(
ak:unknown):number?if type(ak)=='number'then return ak elseif type(ak)=='string'then return tonumber(string.match(ak,
'^rbxassetid://(%d+)$'))end return nil end local function ak(al:unknown):string if ag.onBlock then ag.onBlock(al)end
return''end function ag.preload(al:PreloadCallback?):(boolean,number)ah=false return ae.preload(function(am)ah=true
table.clear(ag.pending)if al then al(am)end end)end function ag.avatar(al:number,am:AvatarCallback?):string if not af.
secureMode then return`rbxthumb://type=AvatarHeadShot&id={al}&w=48&h=48`end return ae.avatar(al,am)end function ag.
assign(al:Instance,am:string,b:unknown)local c=al::any if not ai[am]then c[am]=b return end c[am]=ag.resolve(b)if af.
secureMode and not ah then local d=aj(b)if d and not ag.rewrites[d]then local e=ag.pending[d]if not e then e=
setmetatable({},{__mode='k'})::any ag.pending[d]=e end local f=e[al]if not f then f={}e[al]=f end f[am]=true end end end
ae.onCached=function(al:number)local am=ag.pending[al]if not am then return end local b=ag.rewrites[al]if b then for c,d
in am do if c.Parent then local e=c::any for f in d do e[f]=b end end end end ag.pending[al]=nil end function ag.resolve
(al:unknown):string if al==nil or al==0 or al==''then return''end if type(al)=='string'then if string.sub(al,1,11)==
'rbxasset://'then return al end if string.sub(al,1,11)=='rbxthumb://'then return if af.secureMode then ak(al)else al end
end local am:number?if type(al)=='number'then am=al elseif type(al)=='string'then am=tonumber(string.match(al,
'^rbxassetid://(%d+)$'))end local b=if am then ag.rewrites[am]else nil if b then return b end if af.secureMode then
return ak(al)end if type(al)=='number'then return'rbxassetid://'..al end if type(al)=='string'then return al end return
ak(al)end return ag end)()end,[51]=function()local aa,ab,ac=a(51)local ad return(function(...)local ae,af,ag,ah=ac(ab.
Parent.filesystem),ac(ab.Parent.path),ac(ab.Parent.variables),ac(ab.Parent.constants)export type RewriteMap={[number]:
string}export type CacheSettledCallback=(failed:number)->()export type PreloadCallback=CacheSettledCallback export type
AvatarCallback=(uri:string)->()export type OnCachedCallback=(id:number)->()export type ThumbnailEntry={state:string?,
imageUrl:string?}export type ThumbnailResponse={data:{ThumbnailEntry}?}local ai,aj,ak,al,am,b,c,d:{[number]:string}={},
ag.fileSystemManager:getRootFolder(),ag.fileSystemManager:getAssetsFolder(),ag.assetResolver,
[[https://raw.githubusercontent.com/SiriusSoftwareLtd/rayfield-gen2/main/assets/]],48,
[[https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%d&size=%dx%d&format=Png&isCircular=false]],{}for e,f
in ah.icons do local g=f::number d[g]=am..tostring(g)..'.png'end local e=0 for f in d do e+=1 end ai.rewrites={}::
RewriteMap ai.onCached=nil::OnCachedCallback?local f='\137PNG\r\n\26\n'local function g(h:string,i:string):string?if
type(getfenv().getcustomasset)~='function'or typeof(ae.isfile)~='function'then return nil end if not ae.isfile(h)then
pcall(ae.ensureFolder,aj)pcall(ae.ensureFolder,ak)local j=al:getAssetContentFromUrl(i,h,false)if not j or string.sub(j,1
,8)~=f then return nil end if not pcall(ae.writefile,h,j)then return nil end end local j,k=pcall(getfenv().
getcustomasset,h)return if j and type(k)=='string'then k else nil end local function h(i:number):string return af.join(
ak,'avatar_'..tostring(i)..'.png')end local function i(j:string):string?local k,l=pcall(function()return ag.httpService:
JSONDecode(j)end)if not k or type(l)~='table'then return nil end local m=(l::ThumbnailResponse).data if type(m)~='table'
then return nil end local n=m[1]if type(n)~='table'then return nil end local o=n::ThumbnailEntry if o.state=='Completed'
and type(o.imageUrl)=='string'then return o.imageUrl end return nil end local function j(k:number):string?local l:string
?for m=1,4 do local n=al:getAssetContentFromUrl(string.format(c,k,b,b),'avatar:'..tostring(k),m>1)if n then local o=i(n)
if o then l=o break end end if m<4 then task.wait(0.3)end end if not l then return nil end return g(h(k),l)end local k:{
[number]:{AvatarCallback}},l:{[number]:boolean}={},{}function ai.preload(m:PreloadCallback?):(boolean,number)local n=
getfenv()if type(n.getcustomasset)~='function'or typeof(ae.isfile)~='function'then if m then task.defer(m,e)end return
false,e end local o=ai.rewrites table.clear(o)local function p()if not m then return end local q=0 for r in d do if not
o[r]then q+=1 end end m(q)end local q,r,s=0,0,true for t,u in d do local v,w:string?=(af.join(ak,tostring(t)..'.png'))if
ae.isfile(v)then local x,y=pcall(n.getcustomasset,v)w=if x and type(y)=='string'then y else nil end if w then o[t]=w
else r+=1 q+=1 task.spawn(function()local x=g(v,u)if x then o[t]=x if ai.onCached then pcall(ai.onCached,t)end end q-=1
if q==0 and not s then p()end end)end end s=false if q==0 then p()end return r==0,r end function ai.avatar(m:unknown,n:
AvatarCallback?):string if type(m)~='number'then return''end if typeof(ae.isfile)~='function'then return''end local o=h(
m)if ae.isfile(o)then local p,q=pcall(getfenv().getcustomasset,o)if p and type(q)=='string'then return q end end if l[m]
then return''end local p=k[m]if p then if n then table.insert(p,n)end return''end if n then k[m]={n}task.spawn(function(
)local q,r=j(m),k[m]k[m]=nil if not q then l[m]=true return end if r then for s,t in r do pcall(t,q)end end end)end
return''end return ai end)()end,[52]=function()local aa,ab,ac=a(52)local ad return(function(...)local ae,af={},64 local
ag,ah,ai=af-1,38,3 export type Mode='top'|'sidebar'export type Layout={mode:Mode,topbarHeight:number,chromeHeight:number
,pageDirection:Enum.FillDirection,fadeSize:UDim2,fadeTransparency:NumberSequence,fadeCorners:{string}?,tabStripTop:
number?,tabStripHeight:number?,railWidth:number?,railCollapsedWidth:number?,railCollapseBelow:number?,rowHeight:number?,
rowCornerRadius:number?,rowSpacing:number?,railPadding:number?,rowInset:number?,rowPadding:number?,rowContentSpacing:
number?,rowIconSize:number?,footerHeight:number?,avatarSize:number?,cardTransparency:number?,cardStrokeRotation:number?,
cardStrokeTransparency:NumberSequence?,cardCorners:{string}?}ae.top={mode='top'::Mode,topbarHeight=af,chromeHeight=ag+ah
+ai,tabStripTop=ag,tabStripHeight=ah,pageDirection=Enum.FillDirection.Horizontal,fadeSize=UDim2.new(1,0,-9.3E-2,100),
fadeTransparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.4414,0),
NumberSequenceKeypoint.new(0.7007,0.631),NumberSequenceKeypoint.new(1,1)}}::Layout ae.sidebar={mode='sidebar'::Mode,
topbarHeight=af,chromeHeight=af,railWidth=219,railCollapsedWidth=64,railCollapseBelow=589,rowHeight=38,rowCornerRadius=
14,rowSpacing=4,railPadding=17,rowInset=15,rowPadding=10,rowContentSpacing=6,rowIconSize=20,footerHeight=60,avatarSize=
34,pageDirection=Enum.FillDirection.Vertical,cardTransparency=0.98,cardStrokeRotation=55,cardCorners={'TopLeftRadius',
'BottomRightRadius'},cardStrokeTransparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0.9),NumberSequenceKeypoint.
new(0.128,0.95),NumberSequenceKeypoint.new(0.414,0.985),NumberSequenceKeypoint.new(1,1)},fadeSize=UDim2.new(1,0,0,55),
fadeTransparency=NumberSequence.new{NumberSequenceKeypoint.new(0,0),NumberSequenceKeypoint.new(0.377,0),
NumberSequenceKeypoint.new(1,1)},fadeCorners={'BottomRightRadius'}}::Layout function ae.get(aj:unknown):Layout?if aj==
'sidebar'then return ae.sidebar elseif aj=='top'then return ae.top end return nil end function ae.railWidthFor(aj:Layout
,ak:number):number if aj.mode~='sidebar'then return 0 end local al=aj.railWidth::number if ak<(aj.railCollapseBelow::
number)then return aj.railCollapsedWidth::number end return al end return ae end)()end,[53]=function()local aa,ab,ac=a(
53)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.Parent.log),{}export type LocaleToken={[any
]:string}export type Translator=(source:string,localeId:string)->string?export type TranslationTables={[string]:{[string
]:string}}ag.strings={}::TranslationTables ag.current='en'ag.translator=nil::Translator?local ah={}local function ai(aj:
string):string return string.match(aj,'^(%a+)')or aj end function ag.t(aj:unknown):unknown if type(aj)~='string'or aj==
''then return aj end return{[ah]=aj}end function ag.isToken(aj:unknown):boolean return type(aj)=='table'and type((aj::{[
any]:unknown})[ah])=='string'end function ag.sourceOf(aj:LocaleToken):string return aj[ah]end function ag.resolve(aj:
unknown):any if type(aj)~='string'then return aj end if ag.translator then local ak,al=pcall(ag.translator,aj,ag.current
)if ak and type(al)=='string'and al~=''then return al end end local ak=ag.strings[ag.current]if ak and ak[aj]then return
ak[aj]end local al=ag.strings[ai(ag.current)]if al and al[aj]then return al[aj]end return aj end function ag.register(aj
:TranslationTables?)if type(aj)~='table'then return end for ak,al in aj do if type(ak)=='string'and type(al)=='table'
then ak=string.lower(ak)local am=ag.strings[ak]if not am then am={}ag.strings[ak]=am end for b,c in al do if type(b)==
'string'and type(c)=='string'then am[b]=c else af.warn(`Rayfield: skipping a '{ak}' translation, entries must be string to string.`
)end end end end end function ag.setActive(aj:string?):string ag.current=if type(aj)=='string'and aj~=''then string.
lower(aj)else'en'return ag.current end function ag.detect():string local aj=ae.localizationService.RobloxLocaleId if
type(aj)=='string'and aj~=''then return string.lower(aj)end return'en'end return ag end)()end,[54]=function()local aa,ab
,ac=a(54)local ad return(function(...)local function ae<T>(af:T):T local ag=af::any function ag.Lock(ah,ai:string?)ah.
window:_setElementLocked(ah,true,ai)end function ag.Unlock(ah)ah.window:_setElementLocked(ah,false)end function ag.
IsLocked(ah):boolean return ah.locked==true end return af end return ae end)()end,[55]=function()local aa,ab,ac=a(55)
local ad return(function(...)local ae,af=ac(ab.Parent.runtime),{}type SuppressPredicate=()->boolean local function ag():
boolean return ae.secureMode end local ah:SuppressPredicate,ai:SuppressPredicate?=ag function af.setSecureModeSource(aj:
SuppressPredicate?)ah=if type(aj)=='function'then aj else ag end function af.setSuppressPredicate(aj:SuppressPredicate?)
ai=if type(aj)=='function'then aj else nil end local function aj():boolean if ai and ai()then return true end return ah(
)end function af.warn(...)if aj()then return end warn(...)end function af.print(...)if aj()then return end print(...)end
return af end)()end,[56]=function()local aa,ab,ac=a(56)local ad return(function(...)local function ae<T>(af:T):T local
ag=af::any function ag.MoveTo(ah,ai:number)ah.tab:_moveElement(ah,ai)end function ag.MoveToTop(ah)ah.tab:_moveElement(ah
,1)end function ag.MoveToBottom(ah)ah.tab:_moveElement(ah,#ah.tab.elements)end function ag.MoveUp(ah)local ai=table.
find(ah.tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai-1)end end function ag.MoveDown(ah)local ai=table.find(ah.
tab.elements,ah)if ai then ah.tab:_moveElement(ah,ai+1)end end return af end return ae end)()end,[57]=function()local aa
,ab,ac=a(57)local ad return(function(...)local ae={}ae.__index=ae export type RequestFn=(...any)->any function ae.
getRequestFn(af:any?):RequestFn?af=af or getfenv()return af.request or af.http_request or(af.http and af.http.request)or
(af.syn and af.syn.request)or(af.fluxus and af.fluxus.request)end return ae end)()end,[58]=function()local aa,ab,ac=a(58
)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag=ae.textService,{}ag.__index=ag local ah=20
local function ai(aj,ak,al)local am=Instance.new'GetTextBoundsParams'am.Text=al am.Font=aj am.Size=ak am.Width=math.huge
local b,c=pcall(af.GetTextBoundsAsync,af,am)return if b then c else Vector2.new(ak*0.6,ak)end local aj={}local function
ak(al,am)local b=tostring(al.Family)..'|'..tostring(al.Weight)..'|'..tostring(al.Style)..'|'..tostring(am)local c=aj[b]
if c then return c end local d,e={},0 for f=0,9 do local g=math.ceil(ai(al,am,tostring(f)).X)d[f]=g if g>e then e=g end
end c={advance=d,maxWidth=e}aj[b]=c return c end function ag.new(al,am,b)b=b or{}local c=setmetatable({window=al,
container=am,textSize=b.textSize or 16,transparency=b.transparency or 1,duration=b.duration or 0.55,slots={},length=0},
ag)c.roll=TweenInfo.new(c.duration,Enum.EasingStyle.Quint,Enum.EasingDirection.Out)c.zIndex=math.max(am.ZIndex+1,6)c.
height=math.ceil(c.textSize)local d=ak(al.theme.Font,c.textSize)c.advance=d.advance c.maxWidth=d.maxWidth al:Create(
'UIListLayout',{FillDirection=Enum.FillDirection.Horizontal,VerticalAlignment=Enum.VerticalAlignment.Center,
HorizontalAlignment=b.alignment or Enum.HorizontalAlignment.Left,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0
,0),Parent=am})return c end function ag._reel(al,am)local b=al.slots[am]if b.reel then return b.reel end local c=al.
window:Create('Frame',{Name='Reel',Size=UDim2.fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel
=0,ClipsDescendants=true,ZIndex=al.zIndex,Parent=al.container})local d=al.window:Create('Frame',{Size=UDim2.fromOffset(
al.maxWidth,al.height),AnchorPoint=Vector2.new(0.5,0),Position=UDim2.new(0.5,0,0,0),BackgroundTransparency=1,
BorderSizePixel=0,ZIndex=al.zIndex,Parent=c})for e=0,ah-1 do al.window:Create('TextLabel',{Text=tostring(e%10),Position=
UDim2.fromOffset(0,e*al.height),Size=UDim2.fromOffset(al.maxWidth,al.height),BackgroundTransparency=1,BorderSizePixel=0,
TextSize=al.textSize,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,
TextTransparency=al.transparency,ZIndex=al.zIndex,Parent=d},{TextColor3='ContentColor',FontFace='Font'})end local e={
cell=c,strip=d,digit=0,target=0,stripTween=nil,sizeTween=nil}b.reel=e return e end function ag._static(al,am)local b=al.
slots[am]if b.static then return b.static end local c=al.window:Create('TextLabel',{Name='Static',Size=UDim2.fromOffset(
0,al.height),AutomaticSize=Enum.AutomaticSize.X,BackgroundTransparency=1,BorderSizePixel=0,TextSize=al.textSize,
TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,TextTransparency=al.transparency,
ZIndex=al.zIndex,Parent=al.container},{TextColor3='ContentColor',FontFace='Font'})b.static=c return c end local function
al(am)if am.stripTween then am.stripTween:Cancel()am.stripTween=nil end if am.sizeTween then am.sizeTween:Cancel()am.
sizeTween=nil end end function ag._reelSnap(am,b,c)al(b)b.cell.Size=UDim2.fromOffset(am.advance[c],am.height)b.strip.
Position=UDim2.new(0.5,0,0,-c*am.height)b.digit=c b.target=c end function ag._reelRoll(am,b,c,d)if b.stripTween or b.
sizeTween then am:_reelSnap(b,b.target)end local e=b.digit if e==c then return end local f,g if d then f=e g=e+(c-e)%10
else f=e+10 g=f-(e-c)%10 end b.strip.Position=UDim2.new(0.5,0,0,-f*am.height)b.target=c local h,i=ae.tweenService:
Create(b.strip,am.roll,{Position=UDim2.new(0.5,0,0,-g*am.height)}),ae.tweenService:Create(b.cell,am.roll,{Size=UDim2.
fromOffset(am.advance[c],am.height)})b.stripTween=h b.sizeTween=i h.Completed:Connect(function(j)if j==Enum.
PlaybackState.Completed and b.stripTween==h then am:_reelSnap(b,c)end end)h:Play()i:Play()b.digit=c end function ag.
_putDigit(am,b,c,d,e)local f=am:_reel(b)local g=not f.cell.Visible f.cell.Visible=true f.cell.LayoutOrder=-b if am.slots
[b].static then am.slots[b].static.Visible=false end if e and not g then am:_reelRoll(f,c,d)else am:_reelSnap(f,c)end
end function ag._putStatic(am,b,c)local d=am:_static(b)if not d.Visible then d.TextTransparency=am.transparency end d.
Text=c d.Visible=true d.LayoutOrder=-b if am.slots[b].reel then am.slots[b].reel.cell.Visible=false end end function ag.
_hide(am,b)local c=am.slots[b]if not c then return end if c.reel then c.reel.cell.Visible=false end if c.static then c.
static.Visible=false end end function ag._render(am,b,c,d)b=tostring(b)if b==am._lastText then return end am._lastText=b
local e={}for f,g in utf8.codes(b)do table.insert(e,utf8.char(g))end local f=#e for g=0,math.max(f,am.length)-1 do am.
slots[g]=am.slots[g]or{}if g<f then local h=e[f-g]if h:match'%d'then am:_putDigit(g,tonumber(h),d,c)else am:_putStatic(g
,h)end else am:_hide(g)end end am.length=f end function ag.to(am,b,c)am:_render(b,true,c)end function ag.snap(am,b)am:
_render(b,false,true)end function ag.reveal(am,b,c,d)am.transparency=b for e,f in am.slots do if f.static and f.static.
Visible then am.window:_reveal(f.static,{TextTransparency=b},c,d)end if f.reel then for g,h in f.reel.strip:GetChildren(
)do if h:IsA'TextLabel'then am.window:_reveal(h,{TextTransparency=b},c,d)end end end end end return ag end)()end,[59]=
function()local aa,ab,ac=a(59)local ad return(function(...)type OrderedElement={main:GuiObject,descriptor:{main:
GuiObject}?}local function ae(af:OrderedElement,ag:number)af.main.LayoutOrder=ag if af.descriptor then af.descriptor.
main.LayoutOrder=ag+1 end end return ae end)()end,[60]=function()local aa,ab,ac=a(60)local ad return(function(...)local
ae={}function ae.join(af:string,ag:string?):string if not ag or ag==''then return af end return af..'/'..ag end
local function af(ag:string):string local ah repeat ah=ag ag=ag:gsub('%.%.','')until ag==ah return ag end function ae.
sanitizeFolder(ag:unknown):string local ah=tostring(ag):gsub('\\','/'):gsub('[:<>"|?*%c]','')ah=af(ah):gsub('/+','/')
return(ah:gsub('^/+',''))end function ae.sanitizeFile(ag:unknown):string local ah=tostring(ag):gsub('[/\\]',''):gsub(
'[:<>"|?*%c]','')return af(ah)end function ae.basename(ag:unknown):string return tostring(ag):match'[^/\\]+$'or
tostring(ag)end function ae.stripExtension(ag:unknown,ah:string?):string if ah and ah~=''then local ai=tostring(ag)if ai
:sub(-#ah)==ah then return ai:sub(1,-#ah-1)end return ai end local ai=tostring(ag):match'^(.+)%.%w+$'return ai or
tostring(ag)end return ae end)()end,[61]=function()local aa,ab,ac=a(61)local ad return(function(...)local ae,af,ag={},
ac(ab.Parent.persistenceConfig),ac(ab.Parent.persistenceSettings)ae.getPath=af.getPath ae.save=af.save ae.load=af.load
ae.applyTo=af.applyTo ae.list=af.list ae.delete=af.delete ae.getSettingsPath=ag.getSettingsPath ae.saveSettings=ag.
saveSettings ae.loadSettings=ag.loadSettings return ae end)()end,[62]=function()local aa,ab,ac=a(62)local ad return(
function(...)local ae,af,ag,ah,ai,aj,ak=ac(ab.Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.log),ac(ab.Parent.
path),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),{}type PersistedControl={value:unknown,flag:string?,
_canBeNil:boolean?,_serialize:((PersistedControl)->unknown)?,_deserialize:((PersistedControl,unknown)->())?,Set:(
PersistedControl,unknown)->()}type ConfigWindow={controls:{[string]:PersistedControl},configuration:{fileName:string?,
customFolder:string?},name:string,_loading:boolean?,_loadedConfig:{[string]:unknown}?,_loadedConfigPath:string?}function
ak.getPath(al:ConfigWindow,am:unknown?):(string?,string?)return ai.getConfigPath(al,am)end function ak.save(al:
ConfigWindow,am:unknown?):boolean local b,c=ak.getPath(al,am)if not b or not c then ag.warn(
"Rayfield: configuration name '"..tostring(am).."' has no usable characters")return false end if typeof(af.writefile)~=
'function'then return false end local d:{[string]:unknown}={}for e,f in al.controls do local g,h=pcall(function()local g
=f._serialize if g then return g(f)end return f.value end)if g then d[e]=h else ag.warn(
"Rayfield: Failed to serialize flag '"..tostring(e).."' - "..tostring(h))end end local e=al._loadedConfig if e and al.
_loadedConfigPath==c then for f,g in e do if al.controls[f]==nil then d[f]=g end end end local f,g=pcall(ae.httpService.
JSONEncode,ae.httpService,d)if not f then ag.warn('Rayfield: Failed to encode configuration - '..tostring(g))return
false end local h,i=pcall(function()aj.write(b,c,g)end)if not h then ag.warn('Rayfield: Failed to save configuration - '
..tostring(i))return false end if al._loadedConfigPath==nil or al._loadedConfigPath==c then al._loadedConfig=d al.
_loadedConfigPath=c end return true end local function al(am:string):({[string]:unknown}?,string?)if not af.isfile(am)
then return nil,nil end local b,c=pcall(af.readfile,am)if not b or type(c)~='string'then ag.warn
'Rayfield: Failed to read configuration file'return nil,nil end local d,e=pcall(ae.httpService.JSONDecode,ae.httpService
,c)if not d or type(e)~='table'then return nil,c end return e::{[string]:unknown},c end local function am(b:string):
string local c=ah.stripExtension(b,'.rfld')local d,e=c..' (Incorrect Format).rfld',2 while e<=100 and af.isfile(d)do d=c
..' (Incorrect Format '..e..').rfld'e+=1 end return d end function ak.load(b:ConfigWindow,c:unknown?):boolean local d,e=
ak.getPath(b,c)if not d or not e then ag.warn("Rayfield: configuration name '"..tostring(c)..
"' has no usable characters")return false end if typeof(af.isfile)~='function'then return false end local f,g=al(e)if
not f and af.isfile(e)then local h,i=al(aj.tempPathFor(e))if h and i then f=h pcall(aj.write,d,e,i)end end if not f then
if g then ag.warn[[Rayfield: Configuration file has an invalid format, backing up and resetting]]local h=am(e)pcall(
function()af.ensureDir(d)af.writefile(h,g)af.delfile(e)end)end return false end local h,i=f::{[string]:unknown},b.
_loading b._loading=true local j,k=pcall(function()for j,k in b.controls do ak.applyTo(k,h[j])end end)b._loading=i if
not j then ag.warn('Rayfield: Failed to apply configuration - '..tostring(k))end b._loadedConfig=h b._loadedConfigPath=e
return true end function ak.applyTo(b:PersistedControl,c:unknown)if c==nil and not b._canBeNil then return end local d,e
=pcall(function()local d=b._deserialize if d then d(b,c)else b:Set(c)end end)if not d then ag.warn(
"Rayfield: Failed to restore flag '"..tostring(b.flag).."' - "..tostring(e))end end function ak.list(b:ConfigWindow):{
string}local c,d:{string}=ak.getPath(b),{}if not c then return d end local e,f=pcall(af.listfiles,c)if not e or type(f)
~='table'then return d end for g,h in f do local i=ah.basename(h)if i:sub(-5)=='.rfld'then local j=ah.stripExtension(i,
'.rfld')if j and j~=''and not j:find' %(Incorrect Format[^%)]*%)$'then table.insert(d,j)end end end table.sort(d)return
d end function ak.delete(b:ConfigWindow,c:unknown):boolean if type(c)~='string'or c==''then return false end local d,e=
ak.getPath(b,c)if not e then return false end if typeof(af.isfile)~='function'or not af.isfile(e)then return false end
pcall(af.delfile,aj.tempPathFor(e))return(pcall(af.delfile,e))end return ak end)()end,[63]=function()local aa,ab,ac=a(63
)local ad return(function(...)local ae,af,ag=ac(ab.Parent.variables),ac(ab.Parent.path),{}type ConfigWindow={
configuration:{fileName:string?,customFolder:string?},name:string}function ag.getConfigPath(ah:ConfigWindow,ai:unknown?)
:(string?,string?)local aj=ae.fileSystemManager:getPath'Configurations'if ah.configuration.customFolder then aj=af.join(
aj,af.sanitizeFolder(ah.configuration.customFolder))end if ai~=nil then local ak=af.sanitizeFile(ai)if ak==''then return
nil,nil end return aj,af.join(aj,ak..'.rfld')end local ak=af.sanitizeFile(ah.configuration.fileName or ah.name)if ak==''
then ak=af.sanitizeFile(ah.name)end if ak==''then ak='Configuration'end return aj,af.join(aj,ak..'.rfld')end function ag
.getSettingsPath():(string,string)local ah=ae.fileSystemManager:getPath'Settings'return ah,af.join(ah,'rayfield.rfld')
end return ag end)()end,[64]=function()local aa,ab,ac=a(64)local ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.
Parent.variables),ac(ab.Parent.filesystem),ac(ab.Parent.persistencePaths),ac(ab.Parent.persistenceWrite),ac(ab.Parent.
enums),{}type SettingsWindow={settings:{toggleKeybind:EnumItem,mouseOverride:boolean,keepOnScreen:boolean,welcomeToast:
boolean,haptics:boolean,showProfile:boolean}}type DecodedSettings={toggleKeybind:{[number]:unknown}?,mouseOverride:
unknown?,keepOnScreen:unknown?,welcomeToast:unknown?,haptics:unknown?,showProfile:unknown?}function aj.getSettingsPath()
:(string,string)return ag.getSettingsPath()end function aj.saveSettings(ak:SettingsWindow):boolean local al,am=aj.
getSettingsPath()local b:{[string]:unknown}={toggleKeybind={tostring(ak.settings.toggleKeybind.EnumType),ak.settings.
toggleKeybind.Value}::{unknown},mouseOverride=ak.settings.mouseOverride,keepOnScreen=ak.settings.keepOnScreen,
welcomeToast=ak.settings.welcomeToast,haptics=ak.settings.haptics,showProfile=ak.settings.showProfile}local c,d=pcall(ae
.httpService.JSONEncode,ae.httpService,b)if not c then return false end local e=pcall(ah.write,al,am,d)if not e then
return false end return true end local function ak(al:string):(DecodedSettings?,string?)local am=false pcall(function()
am=af.isfile(al)end)if not am then return nil,nil end local b,c=pcall(af.readfile,al)if not b or type(c)~='string'then
return nil,nil end local d,e=pcall(ae.httpService.JSONDecode,ae.httpService,c)if not d or type(e)~='table'then return
nil,c end return e::DecodedSettings,c end function aj.loadSettings(al:SettingsWindow):boolean local am,b=aj.
getSettingsPath()local c=ak(b)if not c then local d,e=ak(ah.tempPathFor(b))if d and e then c=d pcall(ah.write,am,b,e)end
end if not c then return false end if c.toggleKeybind then pcall(function()local d=tostring(c.toggleKeybind[1]):gsub(
'^Enum%.','')local e=(Enum::any)[d]if e then local f=ai.itemFromValue(e,c.toggleKeybind[2])if f then al.settings.
toggleKeybind=f end end end)end if type(c.mouseOverride)=='boolean'then al.settings.mouseOverride=c.mouseOverride end if
type(c.keepOnScreen)=='boolean'then al.settings.keepOnScreen=c.keepOnScreen end if type(c.welcomeToast)=='boolean'then
al.settings.welcomeToast=c.welcomeToast end if type(c.haptics)=='boolean'then al.settings.haptics=c.haptics end if type(
c.showProfile)=='boolean'then al.settings.showProfile=c.showProfile end return true end return aj end)()end,[65]=
function()local aa,ab,ac=a(65)local ad return(function(...)local ae,af,ag=ac(ab.Parent.filesystem),{},'.saving'function
af.tempPathFor(ah:string):string return ah..ag end function af.write(ah:string,ai:string,aj:string)local ak=af.
tempPathFor(ai)ae.ensureDir(ah)ae.writefile(ak,aj)if ae.readfile(ak)~=aj then error'parked copy did not write cleanly'
end ae.writefile(ai,aj)pcall(ae.delfile,ak)end return af end)()end,[66]=function()local aa,ab,ac=a(66)local ad return(
function(...)local ae=ac(ab.Parent.services)export type RuntimeState={secureMode:boolean,coreGui:CoreGui,workspace:
Workspace,runService:RunService,userInputService:UserInputService,guiService:GuiService,localPlayer:Player?,tweenService
:TweenService,httpService:HttpService,textService:TextService,replicatedStorage:ReplicatedStorage,localizationService:
LocalizationService,guiContainer:Instance}local af={}::RuntimeState af.secureMode=(function()if typeof(getgenv)~=
'function'then return false end local ag,ah=pcall(function()return getgenv().RAYFIELD_SECURE end)return ag and ah==true
end)()af.coreGui=ae.getService'CoreGui'::CoreGui af.workspace=ae.getService'Workspace'::Workspace af.runService=ae.
getService'RunService'::RunService af.userInputService=ae.getService'UserInputService'::UserInputService af.guiService=
ae.getService'GuiService'::GuiService af.localPlayer=(ae.getService'Players'::Players).LocalPlayer af.tweenService=ae.
getService'TweenService'::TweenService af.httpService=ae.getService'HttpService'::HttpService af.textService=ae.
getService'TextService'::TextService af.replicatedStorage=ae.getService'ReplicatedStorage'::ReplicatedStorage af.
localizationService=ae.getService'LocalizationService'::LocalizationService af.guiContainer=(function():Instance if af.
runService:IsStudio()then local ag=af.localPlayer if ag then return ag.PlayerGui end return af.coreGui end if typeof(
gethui)=='function'then local ag,ah=pcall(gethui)if ag and ah then return ah end end return af.coreGui end)()return af
end)()end,[67]=function()local aa,ab,ac=a(67)local ad return(function(...)local ae={}function ae.getService(af)local ag=
game:GetService(af)return if cloneref then cloneref(ag)else ag end return ae end)()end,[68]=function()local aa,ab,ac=a(
68)local ad return(function(...)local ae=ac(ab.Parent.variables)local af,ag,ah:{[string]:number},ai,aj=ae.textService,{}
,{},0,1024 local function ak(al:GetTextBoundsParams):unknown local am,b=pcall(function()return af:GetTextBoundsAsync(al)
end)return if am then b else nil end local function al(am:unknown,b:'X'|'Y'):number?if typeof(am)=='Vector2'then return
if b=='X'then am.X else am.Y end if type(am)=='table'and type((am::any)[b])=='number'then return(am::any)[b]end return
nil end function ag.textWidth(am:Font,b:number,c:any):number c=tostring(c)local d=tostring(am.Family)..'|'..tostring(am.
Weight)..'|'..tostring(am.Style)..'|'..tostring(b)..'|'..c local e=ah[d]if e then return e end local f=Instance.new
'GetTextBoundsParams'f.Text=c f.Font=am f.Size=b f.Width=math.huge local g=al(ak(f),'X')if not g then local h=utf8.len(c
)or#c return math.ceil(b*0.55*h)end local h=math.ceil(g)if ai>=aj then ah={}ai=0 end ah[d]=h ai+=1 return h end function
ag.textHeight(am:Font,b:number,c:any,d:number):number local e=Instance.new'GetTextBoundsParams'e.Text=tostring(c)e.Font=
am e.Size=b e.Width=d local f=al(ak(e),'Y')return if f then math.ceil(f)else b end return ag end)()end,[69]=function()
local aa,ab,ac=a(69)local ad return(function(...)local ae,af,ag,ah,ai,aj=ac(ab.Parent.runtime),ac(ab.Parent.constants),
ac(ab.Parent.log),ac(ab.Parent.filesystemManager),ac(ab.Parent.assetResolver),ac(ab.Parent.fontManager)type RuntimeState
=ae.RuntimeState type FileSystemManager=ah.FileSystemManager type AssetResolver=ai.AssetResolver type FontManager=aj.
FontManager export type VariablesState=RuntimeState&{fallbackFont:Font,fileSystemManager:FileSystemManager,assetResolver
:AssetResolver,fontManager:FontManager,setFallbackFont:(font:Enum.Font|Font)->(),brandFont:(weight:Enum.FontWeight?)->
Font}local ak=table.clone(ae)::VariablesState ag.setSecureModeSource(function()return ak.secureMode end)ak.fallbackFont=
Font.fromEnum(Enum.Font.BuilderSans)ak.fileSystemManager=ah.new()ak.assetResolver=ai.new(true,ai.Enum.AssetDownloadUrl.
RoProxyDownloadUrl)::AssetResolver ak.fontManager=aj.new(ak.fileSystemManager:getAssetsFolder'fonts',false,true,ai.Enum.
AssetDownloadUrl.RoProxyDownloadUrl,{saveToDisk=true,skipCache=false,fallbackFont=ak.fallbackFont})::FontManager
function ak.setFallbackFont(al:Enum.Font|Font)if typeof(al)=='EnumItem'then al=Font.fromEnum(al)end if typeof(al)==
'Font'then ak.fallbackFont=al ak.fontManager.defaultOptions.fallbackFont=al end end function ak.brandFont(al:Enum.
FontWeight?):Font if ak.secureMode then return Font.new(ak.fallbackFont.Family,al)end return Font.new(af.fontAsset,al)
end return ak end)()end,[70]=function()local aa,ab,ac=a(70)local ad return(function(...)local ae,af=ac(ab.Parent.layouts
),{}export type Profile={defaultSize:Vector2,minSize:Vector2,maxOccupancyX:number,maxOccupancyY:number?,marginFloorX:
number,marginFloorY:number,topbarClearance:number?,maxAspectRatio:number,minAspectRatio:number?,widthCompensation:number
?,chromeHeight:number}local ag,ah=200,{top={defaultSize=Vector2.new(475,500),minSize=Vector2.new(300,285),maxOccupancyX=
0.86,topbarClearance=36,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.3,widthCompensation=130,chromeHeight=ae.top.
chromeHeight}::Profile,sidebar={defaultSize=Vector2.new(685,450),minSize=Vector2.new(560,350),maxOccupancyX=0.92,
maxOccupancyY=0.8,marginFloorX=24,marginFloorY=28,maxAspectRatio=2.6,minAspectRatio=1.2,chromeHeight=ae.sidebar.
chromeHeight}::Profile}function af.profile(ai:ae.Mode?):Profile if ai=='sidebar'then return ah.sidebar end return ah.top
end function af.pageHeight(ai:number?,aj:ae.Mode?):number local ak=af.profile(aj)local al=if ai and ai>0 then ai else ak
.minSize.Y return math.max(al-ak.chromeHeight,0)end local function ai(aj:Profile,ak:number):number local al=ak-aj.
marginFloorY if aj.topbarClearance then al=math.min(al,ak-aj.topbarClearance*2)end if aj.maxOccupancyY then al=math.min(
al,ak*aj.maxOccupancyY)end return al end local function aj(ak:number,al:number,am:number):number return math.clamp((al-
ak)/(al-am),0,1)end local function ak(al:Profile,am:number,b:number):UDim2 local c=math.floor(math.min(math.clamp(b,al.
minSize.Y,al.defaultSize.Y),b))local d=aj(c,al.defaultSize.Y,al.minSize.Y)local e=math.max(al.defaultSize.X+(al.
widthCompensation::number)*d,al.minSize.X)return UDim2.fromOffset(math.floor(math.min(e,am,c*al.maxAspectRatio)),c)end
local function al(am:Profile,b:number,c:number):UDim2 local d,e=math.min(math.clamp(b,am.minSize.X,am.defaultSize.X),b),
math.min(math.clamp(c,am.minSize.Y,am.defaultSize.Y),c)e=math.floor(math.min(e,d/(am.minAspectRatio::number)))d=math.
floor(math.min(d,e*am.maxAspectRatio))return UDim2.fromOffset(d,e)end function af.fit(am:Vector2?,b:ae.Mode?):UDim2
local c=af.profile(b)if not am or am.X<ag or am.Y<ag then return UDim2.fromOffset(c.defaultSize.X,c.defaultSize.Y)end
local d,e=math.min(am.X*c.maxOccupancyX,am.X-c.marginFloorX),ai(c,am.Y)if c.minAspectRatio then return al(c,d,e)end
return ak(c,d,e)end return af end)()end},{{1,2,{'Rayfield'},{{31,1,{'themes'},{{37,2,{'rose'}},{35,2,{'ember'}},{36,2,{
'frost'}},{34,2,{'default'}},{32,2,{'amethyst'}},{33,2,{'cobalt'}}}},{39,1,{'utility'},{{56,2,{'moveable'}},{44,2,{
'enums'}},{70,2,{'windowSizing'}},{69,2,{'variables'}},{68,2,{'textMetrics'}},{53,2,{'locale'}},{61,2,{'persistence'}},{
58,2,{'odometer'}},{42,2,{'colors'}},{54,2,{'lockable'}},{47,2,{'flagNames'}},{67,2,{'services'}},{66,2,{'runtime'}},{46
,2,{'filesystemManager'}},{50,2,{'image'}},{49,2,{'functions'}},{65,2,{'persistenceWrite'}},{62,2,{'persistenceConfig'}}
,{64,2,{'persistenceSettings'}},{41,2,{'assetResolver'}},{48,2,{'fontManager'}},{45,2,{'filesystem'}},{60,2,{'path'}},{
59,2,{'ordering'}},{43,2,{'constants'}},{40,2,{'HapticEngine'}},{57,2,{'network'}},{51,2,{'imageCache'}},{63,2,{
'persistencePaths'}},{55,2,{'log'}},{52,2,{'layouts'}}}},{38,2,{'types'}},{2,1,{'components'},{{17,2,{'progress'}},{25,2
,{'tabSelector'}},{6,2,{'colorpicker'}},{15,2,{'notification'}},{26,2,{'tag'}},{20,2,{'sidebar'}},{9,2,{'divider'}},{16,
2,{'popup'}},{30,2,{'window'}},{11,2,{'dropdown'}},{23,2,{'tab'}},{29,2,{'toggle'}},{4,2,{'button'}},{28,2,{'toast'}},{7
,2,{'console'}},{19,2,{'section'}},{3,2,{'action'}},{18,2,{'search'}},{27,2,{'text'}},{13,2,{'input'}},{12,2,{'group'}},
{10,2,{'drag'}},{21,2,{'slider'}},{8,2,{'descriptor'}},{24,2,{'tabSection'}},{5,2,{'chrome'}},{14,2,{'keybind'}},{22,2,{
'stat'}}}}}}},'0.4.1','Rayfield',string,task,setmetatable,error,next,table,unpack,coroutine,script,type,require,pcall,
xpcall,tostring,tonumber,_VERSION local j,k,l,m,n,o,p=aj.insert,aj.remove,aj.freeze or function(j)return j end,al.wrap,
ae.sub,ae.match,ae.gmatch if h and n(h,1,4)=='Lune'then local q,r=d(c,'@lune/task')if q and r then af=r end end local q=
af and af.defer local r,s,t,u,v,w,x,y,z=q or function(r,...)m(r)(...)end,{[1]='Folder',[2]='ModuleScript',[3]='Script',[
4]='LocalScript',[5]='StringValue'},{},{},{},{},{},{},{}local A,B={GetFullName={{},function(A)local B,C=A.Name,A.Parent
while C do B=C.Name..'.'..B C=C.Parent end return B end},GetChildren={{},function(A)local B={}for C in ai,z[A]do j(B,C)
end return B end},GetDescendants={{},function(A)local B={}for C in ai,z[A]do j(B,C)for D,E in ai,C:GetDescendants()do j(
B,E)end end return B end},FindFirstChild={{'string','boolean?'},function(A,B,C)local D=z[A]for E in ai,D do if E.Name==B
then return E end end if C then for E in ai,D do return E:FindFirstChild(B,true)end end end},FindFirstAncestor={{
'string'},function(A,B)local C=A.Parent while C do if C.Name==B then return C end C=C.Parent end end},WaitForChild={{
'string','number?'},function(A,B)return A:FindFirstChild(B)end}},{}for C,D in ai,A do local E,F,G=D[1],D[2],{}for H,I in
ai,E do local J,K=o(I,'^([^%?]+)(%??)')G[H]={J,K}end B[C]=function(H,...)if not z[H]then ah(
"Expected ':' not '.' calling member function "..C,2)end local I={...}for J,K in ai,G do local L=I[J]local M,N,O=b(L),K[
1],K[2]if L==nil and not O then ah('Argument '..L..' missing or nil',3)end if N~='any'and M~=N and not(M=='nil'and O)
then ah('Argument '..J..' expects type "'..N..'", got "'..M..'"',2)end end return F(H,...)end end local function C(D,E,F
)local G,H=(ag({},{__mode='k'}))local function I(J)ah(J..' is not a valid (virtual) member of '..D..' "'..E..'"',3)end
local function J(K)ah('Unable to assign (virtual) property '..K..'. Property is read only',3)end local K,L={},{}L.
__metatable=false L.__index=function(M,N)if N=='ClassName'then return D elseif N=='Name'then return E elseif N=='Parent'
then return F elseif D=='StringValue'and N=='Value'then return H else local O=B[N]if O then return O end end for O in ai
,G do if O.Name==N then return O end end I(N)end L.__newindex=function(M,N,O)if N=='ClassName'then J(N)elseif N=='Name'
then E=O elseif N=='Parent'then if O==K then return end if F~=nil then z[F][K]=nil end F=O if O~=nil then z[O][K]=true
end elseif D=='StringValue'and N=='Value'then H=O else I(N)end end L.__tostring=function()return E end ag(K,L)z[K]=G if
F~=nil then z[F][K]=true end return K end local function D(E,F)local G,H,I,J=E[1],E[2],E[3],E[4]local K=s[H]local L=I
and k(I,1)or K local M=C(K,L,F)t[G]=M if I then for N,O in ai,I do M[N]=O end end if J then for N,O in ai,J do D(O,M)end
end return M end local E=C('Folder','['..ad..']')for F,G in ai,ab do D(G,E)end for F,G in ai,aa do local H=t[F]u[H]=G v[
H]=F local I=H.ClassName if I=='LocalScript'or I=='Script'then j(x,H)end end local function F(G)local H,I=G.ClassName,w[
G]if I and H=='ModuleScript'then return ak(I)end local J=u[G]local function K(L)local M,N,O=nil,d(function()return debug
.traceback(nil,2)end)if N then M=O end return{Message=L,Traceback=M}end local function L(M)local N,O=f(M.Message),G:
GetFullName()local P,Q=o(N,'[^:]+:(%d+): (.+)')local R if not P or not i then R=O..':*: '..(Q or N)else P=g(P)local S=v[
G]local T=i[S]local U=P-T+1 if U<0 then U='?'end R=O..':'..U..': '..Q end local S=M.Traceback if S and S~=''then R=R..
'\n'..S end return R end if H=='LocalScript'or H=='Script'then local M,N=e(J,K)if not M then ah(L(N),0)end else local M=
{e(J,K)}local N=k(M,1)if not N then local O=k(M,1)ah(L(O),0)end w[G]=M return ak(M)end end function a(G)local H=t[G]
local function I(J,...)local K={d(J,...)}local L=k(K,1)if not L then ah(K[1],3)end return ak(K)end local J=l(ag({},{
__index=y,__newindex=function(J,K,L)y[K]=L end,__len=function()return#y end,__iter=function()return ai,y end}))local K,L
=l{version=ac,envname=ad,shared=J,script=am,require=c},H local function M(N,...)local O,P,Q=b(N),
'Attempted to call require with a non-ModuleScript','Attempted to call require with self'if O=='table'and z[N]then if N.
ClassName~='ModuleScript'then ah(P,2)elseif N==H then ah(Q,2)end return F(N)elseif O=='string'and n(N,1,1)~='@'then if#N
==0 then ah('Attempted to call require with empty string',2)end local R=H if n(N,1,1)=='/'then R=E elseif n(N,1,2)=='./'
then N=n(N,3)end local S for T in p(N,'([^/]*)/?')do local U=T if T=='..'then U='Parent'end if U~=''then local V=R:
FindFirstChild(U)if not V then local W=R.Parent if W then V=W:FindFirstChild(U)end end if V then R=V elseif T~=S and T~=
'init'and T~='init.server'and T~='init.client'then ah('Virtual script path "'..N..'" not found',2)end end S=T end if R.
ClassName~='ModuleScript'then ah(P,2)elseif R==H then ah(Q,2)end return F(R)end return I(c,N,...)end return K,L,M end
for G,H in ai,x do r(F,H)end return F(E:GetChildren()[1])