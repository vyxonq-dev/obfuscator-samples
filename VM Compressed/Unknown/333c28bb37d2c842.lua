if not game:IsLoaded()then
game.Loaded:Wait()
end

local a=string.lower(tostring(identifyexecutor()))
if a=="xeno"or a=="solara"then
if not getgenv().allowpotatoexecutor then
game:GetService"Players".LocalPlayer:Kick("daydreamer doesnt work on "..a.." and you were kicked in order to prevent potential bans, as your executor lacks some functions necessary to bypass anticheats.\n    \n to bypass this warning and load daydreamer anyways, add this line of code before the script. it is NOT our fault if you get anticheat banned.\n    \n getgenv().allowpotatoexecutor = true \n(copied to clipboard)\n   ")
setclipboard"getgenv().allowpotatoexecutor = true"
error("incompatible executor ("..a..")")
elseif getgenv().allowpotatoexecutor then
warn("your executor ("..a..") is not supported and probably wont work with daydreamer. do NOT report any bugs, they won't be fixed.")
end
end

local b=cloneref(game:GetService'Players')
local c=b.LocalPlayer

while not c do
task.wait()

c=b.LocalPlayer
end

local d=game.GameId

while d==0 do
task.wait()

d=game.GameId
end



local e={

[9186719164]={
script_id='f4ed3e2c509c1afa907a0f0545ca3b18',
},


[7395930870]={
script_id='d92c078507b9006e9f194943f5fee191',
},


[9965411707]={
script_id='9aa013ea312ff05589f1050b7c1dbf52',
},


[10039338037]={
script_id='8dcaeb073a1d775ba880415322aec8c4',
},


[9272693470]={
script_id='c153f998000eeeaec6fa26f3dff8bcdb',
},


[6035872082]={
script_id='5c0fa57251c165aa484cab27a52aa424',
},


-- ISD is currently keyless. Remove key_required=false and uncomment the keyed settings to restore its key prompt.
[9910245722]={
script_id='1a8d82c87bd4c8405eaf98ddcbc89b08',
key_required=false,
-- key_required=true,
-- key_link='https://ads.luarmor.net/get_key?for=daydreamer_workink-kajGnoUvpPaj',
},
[117533937949084]={
script_id='1a8d82c87bd4c8405eaf98ddcbc89b08',
key_required=false,
-- key_required=true,
-- key_link='https://ads.luarmor.net/get_key?for=daydreamer_workink-kajGnoUvpPaj',
},
}

local f=e[d]or e[game.PlaceId]

if f and f.key_required==false then
local g,h=pcall(function()
local i='https://api.luarmor.net/files/v4/loaders/'..f.script_id..'.lua'
loadstring(game:HttpGet(i),'@daydreamer.'..f.script_id)()
end)

if not g then
warn('loader failed for some reason: '..tostring(h))
end

return
end

if f then
local g='key.daydreamer'
local h=f.script_id
local i='https://api.luarmor.net/files/v4/loaders/'..h..'.lua'

local function save_key(j)
if type(writefile)=='function'then
pcall(writefile,g,j)
end
end
local function clear_key()
if type(delfile)=='function'then
pcall(delfile,g)
elseif type(writefile)=='function'then
pcall(writefile,g,'')
end
end
local function load_key()
if type(isfile)=='function'and isfile(g)and type(readfile)=='function'then
local j,k=pcall(readfile,g)

if j and type(k)=='string'then
k=k:gsub('%s+','')

if#k>0 then
return k
end
end
end

return nil
end
local function clear_env_key()
_G.dd_key=nil
_G.script_key=nil

pcall(function()
getgenv().dd_key=nil
getgenv().script_key=nil
end)
end


local j={
KEY_EXPIRED='key expired, get a new one',
KEY_BANNED='key is blacklisted',
KEY_HWID_LOCKED='key locked to another hwid',
KEY_INCORRECT='key doesnt exist',
KEY_INVALID='bad key format',
}


local function check_key(k,l)
if type(k.check_key)~='function'then

return true
end

local m,n=pcall(k.check_key,l)

if not m or type(n)~='table'or type(n.code)~='string'then

return true
end

if n.code=='KEY_VALID'then
return true
end

local o=j[n.code]

if o then
return false,o,false
end


return false,string.lower(tostring(n.message or n.code)),true
end

local function run_loader(k)

_G.dd_key=k
getgenv().dd_key=k
_G.script_key=k
getgenv().script_key=k

local l,m=pcall(function()
return loadstring(game:HttpGet'https://sdkapi-public.luarmor.net/library.lua','@daydreamer.thread')()
end)

if not l or not m then
return false,'api load error'
end

m.script_id=h

local n,o,p=check_key(m,k)

if not n then

if not p then
clear_key()
end

clear_env_key()

return false,o or'invalid key'
end

if k and#k>0 then
save_key(k)
end


local q,r=pcall(function()
loadstring(game:HttpGet(i),'@daydreamer.'..h)()
end)

if not q then
return false,'api load error: '..tostring(r)
end

return true
end
local function get_env_key()
local function validate(k)
if typeof(k)=='string'and#k:gsub('%s+','')>0 then
return k:gsub('%s+','')
end

return nil
end

local k=_G.script_key or getgenv().script_key

if validate(k)then
return validate(k)
end
if typeof(shared)=='table'and shared.script_key then
if validate(shared.script_key)then
return validate(shared.script_key)
end
end

for l=1,10 do
local m,n=pcall(getfenv,l)

if m and typeof(n)=='table'and n.script_key then
if validate(n.script_key)then
return validate(n.script_key)
end
end
end

local l,m=pcall(function()
return key
end)

if l and validate(m)then
return validate(m)
end

k=_G.dd_key or getgenv().dd_key

if validate(k)then
return validate(k)
end
if typeof(shared)=='table'and shared.dd_key then
if validate(shared.dd_key)then
return validate(shared.dd_key)
end
end

for n=1,10 do
local o,p=pcall(getfenv,n)

if o and typeof(p)=='table'and p.dd_key then
if validate(p.dd_key)then
return validate(p.dd_key)
end
end
end

local n,o=pcall(function()
return key
end)

if n and validate(o)then
return validate(o)
end

return nil
end


local function prompt_key(k)
local l=(pcall(function()
return Enum.Font.Inter
end)and Enum.Font.Inter or Enum.Font.Gotham)
local m=type(gethui)=='function'and gethui()or game:GetService'CoreGui'


local n=(getgenv and getgenv())or _G
if n.dd_loader_prompt_gui then
pcall(function()n.dd_loader_prompt_gui:Destroy()end)
end

local o=Instance.new('ScreenGui',m)
n.dd_loader_prompt_gui=o

o.Name='daydreamer loader (if ur seeing this dont skid my ui pls) @ ['..os.time()..']'
o.ResetOnSpawn=false

local p=Instance.new'Frame'

p.AnchorPoint=Vector2.new(0.5,0.5)
p.Position=UDim2.new(0.5,0,0.5,0)
p.Size=UDim2.new(0,0,0,40)
p.AutomaticSize=Enum.AutomaticSize.X
p.BackgroundColor3=Color3.fromRGB(0,0,0)
p.BorderSizePixel=0
p.Active=true
p.Parent=o

local q=Instance.new'UICorner'

q.CornerRadius=UDim.new(1,0)
q.Parent=p

local r=Instance.new'UIListLayout'

r.FillDirection=Enum.FillDirection.Horizontal
r.VerticalAlignment=Enum.VerticalAlignment.Center
r.SortOrder=Enum.SortOrder.LayoutOrder
r.Padding=UDim.new(0,8)
r.Parent=p

local s=Instance.new'UIPadding'

s.PaddingLeft=UDim.new(0,18)
s.PaddingRight=UDim.new(0,8)
s.Parent=p

local t,u,v,w,x=(cloneref(game:GetService'UserInputService'))

p.InputBegan:Connect(function(y)
if y.UserInputType==Enum.UserInputType.MouseButton1 or y.UserInputType==Enum.UserInputType.Touch then
u=true
w=y.Position
x=p.Position

y.Changed:Connect(function()
if y.UserInputState==Enum.UserInputState.End then
u=false
end
end)
end
end)
p.InputChanged:Connect(function(y)
if y.UserInputType==Enum.UserInputType.MouseMovement or y.UserInputType==Enum.UserInputType.Touch then
v=y
end
end)
t.InputChanged:Connect(function(y)
if y==v and u then
local z=y.Position-w

p.Position=UDim2.new(x.X.Scale,x.X.Offset+z.X,x.Y.Scale,x.Y.Offset+z.Y)
end
end)

local y=Instance.new'TextLabel'

y.LayoutOrder=1
y.Size=UDim2.new(0,0,1,0)
y.AutomaticSize=Enum.AutomaticSize.X
y.BackgroundTransparency=1
y.RichText=true
y.Text='<font color="#fbeee6">daydreamer.</font>'
y.TextSize=14
y.Font=l
y.Parent=p

local z=Instance.new'TextBox'

z.LayoutOrder=2
z.Size=UDim2.new(0,140,0,26)
z.BackgroundColor3=Color3.fromRGB(30,30,30)
z.BorderSizePixel=0
z.Text=''
z.PlaceholderText='enter key...'
z.TextColor3=Color3.fromRGB(255,255,255)
z.PlaceholderColor3=Color3.fromRGB(150,150,150)
z.TextSize=12
z.Font=l
z.ClearTextOnFocus=false
z.ClipsDescendants=true
z.Parent=p

local A=Instance.new'UICorner'

A.CornerRadius=UDim.new(1,0)
A.Parent=z

local B=Instance.new'UIPadding'

B.PaddingLeft=UDim.new(0,8)
B.PaddingRight=UDim.new(0,8)
B.Parent=z

if k then
z.PlaceholderText=k
z.PlaceholderColor3=Color3.fromRGB(255,100,100)
end

local C=Instance.new'TextButton'

C.LayoutOrder=3
C.Size=UDim2.new(0,90,0,22)
C.BackgroundColor3=Color3.fromRGB(30,30,30)
C.BorderSizePixel=0
C.Text='load'
C.TextColor3=Color3.fromRGB(255,255,255)
C.TextSize=12
C.Font=l
C.Parent=p

local D=Instance.new'UICorner'

D.CornerRadius=UDim.new(1,0)
D.Parent=C

local E=4
local F=type(f.key_link)=='string'and f.key_link or nil
local G


if F and#F>0 then
G=Instance.new'TextButton'
G.LayoutOrder=E
E=E+1
G.Size=UDim2.new(0,90,0,22)
G.BackgroundColor3=Color3.fromRGB(30,30,30)
G.BorderSizePixel=0
G.Text='direct link'
G.TextColor3=Color3.fromRGB(255,255,255)
G.TextSize=12
G.Font=l
G.Parent=p

local H=Instance.new'UICorner'
H.CornerRadius=UDim.new(1,0)
H.Parent=G
end

local H=Instance.new'TextButton'

H.LayoutOrder=E
H.Size=UDim2.new(0,F and 100 or 160,0,22)
H.BackgroundColor3=Color3.fromRGB(30,30,30)
H.BorderSizePixel=0
H.Text=F and'join discord'or'join discord (for key link)'
H.TextColor3=Color3.fromRGB(255,255,255)
H.TextSize=12
H.Font=l
H.Parent=p

local I=Instance.new'UICorner'

I.CornerRadius=UDim.new(1,0)
I.Parent=H

local function attach_hover(J)
J.MouseEnter:Connect(function()
J.BackgroundColor3=Color3.fromRGB(45,45,45)
end)
J.MouseLeave:Connect(function()
J.BackgroundColor3=Color3.fromRGB(30,30,30)
end)
end

attach_hover(C)
if G then attach_hover(G)end
attach_hover(H)

local function copy_url(J,K)
if type(setclipboard)=='function'then
pcall(setclipboard,K)

local L=J.Text

J.Text='copied to clipboard'

task.delay(1.5,function()
if J.Parent then
J.Text=L
end
end)
else
local L=J.Text

J.Text='copied to box'
z.Text=K

task.delay(1.5,function()
if J.Parent then
J.Text=L
end
end)
end
end

local J=false

C.MouseButton1Click:Connect(function()
if J then
return
end

local K=z.Text:gsub('%s+','')

if K and#K>0 then
J=true
C.Text='loading...'

task.spawn(function()
local L,M=run_loader(K)
if L then
o:Destroy()
else
J=false
C.Text='load'
z.Text=''
z.PlaceholderText=M or'invalid key'
z.PlaceholderColor3=Color3.fromRGB(255,100,100)
end
end)
else
z.PlaceholderText='key cant be empty'
z.PlaceholderColor3=Color3.fromRGB(255,100,100)
end
end)
if G then
G.MouseButton1Click:Connect(function()
copy_url(G,F)
end)
end
H.MouseButton1Click:Connect(function()
copy_url(H,'https://discord.gg/vrvNMmgZ4d')
end)
end


local k=get_env_key()or load_key()
if k then
task.spawn(function()
local l,m=run_loader(k)
if not l then
prompt_key(m)
end
end)
else
prompt_key()
end
else
local g='this game is not supported (GameId '
..tostring(d)..', PlaceId '..tostring(game.PlaceId)..')'
warn(g)
pcall(function()
cloneref(game:GetService'StarterGui'):SetCore('SendNotification',{
Title='daydreamer',
Text='this game is not supported.',
Duration=8,
})
end)
end
