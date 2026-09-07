local _yFqfBSUJY="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local wwNkjw8=(93)
local _MrZkg=(170)
local function VVuuHn3(a,b)
 local r,p=0,1
 for _=1,8 do
  local x,y=a%2,b%2
  if x~=y then r=r+p end
  a=(a-x)/2 b=(b-y)/2 p=p*2
 end
 return r
end
local function sdmq7AbEw(s)
 local map={}
 for i=1,#_yFqfBSUJY do map[_yFqfBSUJY:sub(i,i)]=i-1 end
 local t={}
 local acc,bits=0,0
 for i=1,#s do
  local ch=s:sub(i,i)
  if ch=="=" then break end
  local v=map[ch]
  if v then
   acc=acc*64+v bits=bits+6
   while bits>=8 do bits=bits-8 local d=2^bits t[#t+1]=math.floor(acc/d)%256 acc=acc%d end
  end
 end
 return t
end
local scMunPT5Tw={}
do
 local raw=sdmq7AbEw("6fuXd3N7fCk4NHtWUURCVhlfWjVoKj86eC1uTAYeGxtXexf38/v8qbi0+9bRxMLWmd/ateiqv7r4re7MkoWDnJSQ6QNXeWZpXmhzQklPXHtCWWAIIjJhJy8vSGM3GQYJPggT4unv/Nvi+cDr8OLrncPDy8jHg7unp4i6kZGCjJb3++wDVWl3Unl6c1pTQkxAZF5NNS4oKlBXPyk8ZWtKAHF7DPf14uH0n5v51snI29rY1bvDl4Sch8fbvpOXh4aQlo+WbGkkZWB4dRojU0pNX1I6P3xGS2lSV2ZYYwkOGwQYCRTDh8rN0NPe2eTv4uX4+/bxjJeanYCDjom0v7K1kpWYm2ZhbGd6fXBzTklEX0JFSEs2MTw3Ki1rblFUX1pFQENGqKicj9D47vPHh8XAx5fJ2qKko++gsqmphpXF5PO+lYlia2JrM3x+Zj8nfkFAQktPLDU/Kjd3KDoREQ4dUwUeDPPo5fz2uZOf09XE29zU1NPOx56hv7i4tMOBioafkp/nA0Rken9zO3FMUwtLVlRUWyZnOCwhPisrTWFrCxYUFBvmnovUw+Xy5evSyfKT1NTSs66nqvOyqa2MldHP6vegr3FucUdmdUY/UVJFW1paXh8mNTkgIW17DmM8Ox0aDTMK4dqrwfy38Prah83AxtnfkeOUrrvzsL6rhIKFmdve1bRmfisyMzVCUHZ1BmR2bhkfISItICEyey0WCQUGHRBbC+viq+P89v/60Ym+r+jnyda5j76tjveQuprHjp2BmInFIw==")
 local key=VVuuHn3((wwNkjw8),(_MrZkg))
 local rot=4
 local pos=0
 local function nb() local b=raw[pos+1]; local kk=(key+((pos*rot)%256))%256; pos=pos+1; return VVuuHn3(b%256,kk) end
 while pos<#raw do
  local lo=nb() local hi=nb() local len=lo+hi*256
  local cs={}
  for i=1,len do cs[i]=string.char(nb()) end
  scMunPT5Tw[#scMunPT5Tw+1]=table.concat(cs)
 end
end
local _ooljQsve={}
_ooljQsve[1]=function()
if getfenv and getfenv().script==nil then
return
end
end
_ooljQsve[2]=function()
if hookmetamethod and hookmetamethod then
return
end
end
_ooljQsve[3]=function()
if debug and debug.getconstant then
return
end
end
_ooljQsve[4]=function()
if debug and debug.getupvalue then
return
end
end
_ooljQsve[5]=function()
if syn and syn.is_loaded then
return
end
end
for _KJ6CACJQ_=1,5 do
_ooljQsve[_KJ6CACJQ_]()
end
local _tHhlddwysc=scMunPT5Tw[1]
local kpDL1Y=scMunPT5Tw[2]
local _om3QDizn=scMunPT5Tw[3]
local EFHo9dG=scMunPT5Tw[4]
local q3vMXiV0=game:GetService(scMunPT5Tw[5])
local function _lB8QEjr()
local QfwZGTy6ZX=scMunPT5Tw[6]
pcall(function()
QfwZGTy6ZX=tostring(game:GetService(scMunPT5Tw[7]):GetClientId() or scMunPT5Tw[6])
end)
if QfwZGTy6ZX==scMunPT5Tw[6] then
pcall(function()
QfwZGTy6ZX=tostring(syn and syn.get_hwid and syn.get_hwid() or scMunPT5Tw[6])
end)
end
if QfwZGTy6ZX==scMunPT5Tw[6] then
pcall(function()
QfwZGTy6ZX=tostring(gethwid and gethwid() or scMunPT5Tw[6])
end)
end
if QfwZGTy6ZX==scMunPT5Tw[6] then
QfwZGTy6ZX=scMunPT5Tw[8]..tostring(math.random(1,999999999))..tostring(os.time())
end
return QfwZGTy6ZX:gsub(scMunPT5Tw[9],scMunPT5Tw[6])
end
local _DHbc0ywwn5=_lB8QEjr()
local function v90kWjo(Eyn7zAj_6D)
if not (isfile and readfile) then
return nil
end
local _RgG2GX,V2tuymIhL=pcall(readfile,Eyn7zAj_6D)
if not _RgG2GX or type(V2tuymIhL)~=scMunPT5Tw[10] then
return nil
end
return V2tuymIhL:gsub(scMunPT5Tw[9],scMunPT5Tw[6])
end
local function _fgl1hQ3(_fmvre1y4O7,_zfXBRHgpG)
if writefile then
pcall(writefile,_fmvre1y4O7,_zfXBRHgpG)
end
end
local function _YZMmcI(KZIgLWeqg)
if delfile and isfile then
local FznxVBu_lh,_rYlLJkk2R=pcall(isfile,KZIgLWeqg)
if FznxVBu_lh and _rYlLJkk2R then
pcall(delfile,KZIgLWeqg)
end
end
end
local m0ydXU=(syn and syn.request) or (http and http.request) or http_request or request
local function jgbzmj(_LuJ6t,_cdZ9HS6C_)
local _MU0UVS8EA
if type(m0ydXU)==scMunPT5Tw[11] then
local UJFw_vd,CQTjIx=pcall(function()
return m0ydXU({Url=_LuJ6t,Method=scMunPT5Tw[12],Headers={["Content-Type"]=scMunPT5Tw[13]},Body=q3vMXiV0:JSONEncode(_cdZ9HS6C_)})
end)
if UJFw_vd and type(CQTjIx)==scMunPT5Tw[14] then
_MU0UVS8EA=CQTjIx.Body or CQTjIx.body
end
end
if _MU0UVS8EA==nil then
local HZq0eAMy=scMunPT5Tw[6]
for MghAGRI8M,_kXIwGFJf in pairs(_cdZ9HS6C_) do
HZq0eAMy=HZq0eAMy..(HZq0eAMy==scMunPT5Tw[6] and scMunPT5Tw[15] or scMunPT5Tw[16])..MghAGRI8M..scMunPT5Tw[17]..q3vMXiV0:UrlEncode(tostring(_kXIwGFJf))
end
local _wVYtnV,_Yy8ji_L9c=pcall(function()
return game:HttpGet(_LuJ6t..HZq0eAMy)
end)
if not _wVYtnV then
return nil,scMunPT5Tw[18]
end
_MU0UVS8EA=_Yy8ji_L9c
end
if type(_MU0UVS8EA)~=scMunPT5Tw[10] then
return nil,scMunPT5Tw[18]
end
local zFcaACx9,iom6S=pcall(function()
return q3vMXiV0:JSONDecode(_MU0UVS8EA)
end)
if not zFcaACx9 or type(iom6S)~=scMunPT5Tw[14] then
return nil,scMunPT5Tw[18]
end
return iom6S,nil
end
local mhMe5=scMunPT5Tw[19]
local NKMqg={}
for _Ub2zugQZ=1,#mhMe5 do
NKMqg[mhMe5:sub(_Ub2zugQZ,_Ub2zugQZ)]=_Ub2zugQZ-1
end
local function kLdPvgJ5(aUScuF)
local nUpwV={}
local _oiLQE,_urNrdid7Q=0,0
for _IklTvGmhis=1,#aUScuF do
local vJfMv=aUScuF:sub(_IklTvGmhis,_IklTvGmhis)
if vJfMv==scMunPT5Tw[17] then
break
end
local EDTGjufRL=NKMqg[vJfMv]
if EDTGjufRL then
_oiLQE=_oiLQE*64+EDTGjufRL
_urNrdid7Q=_urNrdid7Q+6
while _urNrdid7Q>=8 do
_urNrdid7Q=_urNrdid7Q-8
local fDotqa=2^_urNrdid7Q
nUpwV[#nUpwV+1]=math.floor(_oiLQE/fDotqa)%256
_oiLQE=_oiLQE%fDotqa
end
end
end
return nUpwV
end
local function _iQe25Gt5oo(ZlKWzizep)
local QMpVl3={}
for _xXdpKi=1,#ZlKWzizep-1,2 do
QMpVl3[#QMpVl3+1]=tonumber(ZlKWzizep:sub(_xXdpKi,_xXdpKi+1),16) or 0
end
return QMpVl3
end
local HaatwYwcO
if bit32 and bit32.bxor then
HaatwYwcO=bit32.bxor
else
HaatwYwcO=function(_fTUpkt,_RemL4Sy0c)
local _BMgYjC8,ITiOHB=0,1
for _W2YXsuN=1,8 do
local _Myv7E7OIDu,gZbtH=_fTUpkt%2,_RemL4Sy0c%2
if _Myv7E7OIDu~=gZbtH then
_BMgYjC8=_BMgYjC8+ITiOHB
end
_fTUpkt=(_fTUpkt-_Myv7E7OIDu)/2
_RemL4Sy0c=(_RemL4Sy0c-gZbtH)/2
ITiOHB=ITiOHB*2
end
return _BMgYjC8
end
end
local function _TvIc1Vgs5o(w6dTjxA,WXvX9yG)
local _K7oySwhfzh={}
for _CtpaX_=0,255 do
_K7oySwhfzh[_CtpaX_]=_CtpaX_
end
local _tpA7XQW5ky=#w6dTjxA
if _tpA7XQW5ky==0 then
return nil
end
local n9Nn3=0
for _lpqdS86jL=0,255 do
n9Nn3=(n9Nn3+_K7oySwhfzh[_lpqdS86jL]+w6dTjxA[(_lpqdS86jL%_tpA7XQW5ky)+1])%256
_K7oySwhfzh[_lpqdS86jL],_K7oySwhfzh[n9Nn3]=_K7oySwhfzh[n9Nn3],_K7oySwhfzh[_lpqdS86jL]
end
local E427a0XkUG={}
local uTEtXY4,_QE8py=0,0
for Hnl8NqxY2=1,#WXvX9yG do
uTEtXY4=(uTEtXY4+1)%256
_QE8py=(_QE8py+_K7oySwhfzh[uTEtXY4])%256
_K7oySwhfzh[uTEtXY4],_K7oySwhfzh[_QE8py]=_K7oySwhfzh[_QE8py],_K7oySwhfzh[uTEtXY4]
E427a0XkUG[Hnl8NqxY2]=string.char(HaatwYwcO(WXvX9yG[Hnl8NqxY2],_K7oySwhfzh[(_K7oySwhfzh[uTEtXY4]+_K7oySwhfzh[_QE8py])%256]))
end
return table.concat(E427a0XkUG)
end
local function _Z_eOx(_hYSlyINOfE,PYVYbMhw)
local Qgg3OK0qt2,_XurTfY=jgbzmj(_tHhlddwysc,{key=_hYSlyINOfE,hwid=_DHbc0ywwn5,claim=PYVYbMhw and 1 or 0})
if not Qgg3OK0qt2 then
return false,scMunPT5Tw[20],_XurTfY
end
if not Qgg3OK0qt2.ok then
return false,Qgg3OK0qt2.reason or scMunPT5Tw[21],Qgg3OK0qt2.reason
end
if Qgg3OK0qt2.v~=2 or type(Qgg3OK0qt2.blob)~=scMunPT5Tw[10] or type(Qgg3OK0qt2.token)~=scMunPT5Tw[10] then
return false,scMunPT5Tw[22],scMunPT5Tw[23]
end
local b8LolMRGN,xBIFE=jgbzmj(kpDL1Y,{token=Qgg3OK0qt2.token,hwid=_DHbc0ywwn5})
if not b8LolMRGN then
return false,scMunPT5Tw[20],xBIFE
end
if not b8LolMRGN.ok or type(b8LolMRGN.k)~=scMunPT5Tw[10] then
return false,b8LolMRGN.reason or scMunPT5Tw[24],b8LolMRGN.reason
end
local gdiomeeMfy=_TvIc1Vgs5o(_iQe25Gt5oo(b8LolMRGN.k),kLdPvgJ5(Qgg3OK0qt2.blob))
if type(gdiomeeMfy)~=scMunPT5Tw[10] or gdiomeeMfy==scMunPT5Tw[6] then
return false,scMunPT5Tw[25],scMunPT5Tw[26]
end
return true,gdiomeeMfy,nil
end
local function wEfSl4F_IC(_nMYLHRjH)
local _hTcEhBtGv,oQQDYwOdxK=(loadstring or load)(_nMYLHRjH)
if not _hTcEhBtGv then
warn(scMunPT5Tw[27]..tostring(oQQDYwOdxK))
return false
end
local Ytvui,_THlvCopa=pcall(_hTcEhBtGv)
if not Ytvui then
warn(scMunPT5Tw[28]..tostring(_THlvCopa))
return false
end
return true
end
local _ekuOk30A
if getgenv then
_ekuOk30A=getgenv().Key
end
if (_ekuOk30A==nil or _ekuOk30A==scMunPT5Tw[6]) and _G then
_ekuOk30A=_G.Key
end
local _IsS8wJ
if type(_ekuOk30A)==scMunPT5Tw[10] and _ekuOk30A~=scMunPT5Tw[6] then
_IsS8wJ=_ekuOk30A:gsub(scMunPT5Tw[9],scMunPT5Tw[6]):upper()
else
_IsS8wJ=v90kWjo(_om3QDizn)
end
if _IsS8wJ and _IsS8wJ~=scMunPT5Tw[6] then
local _egmp0cV,ndWVlmwM,_Ihk3CRGD=_Z_eOx(_IsS8wJ,false)
if _egmp0cV then
_fgl1hQ3(_om3QDizn,_IsS8wJ)
return wEfSl4F_IC(ndWVlmwM)
end
local _c6Tkt4d_w1={invalid=true,banned=true,expired=true,wrong_hwid=true,exec_limit=true}
if _c6Tkt4d_w1[_Ihk3CRGD] then
_YZMmcI(_om3QDizn)
_IsS8wJ=nil
end
end
local uEAECBPUV=_IsS8wJ or v90kWjo(_om3QDizn) or scMunPT5Tw[6]
if type(_ekuOk30A)==scMunPT5Tw[10] and _ekuOk30A~=scMunPT5Tw[6] then
uEAECBPUV=_ekuOk30A
end
uEAECBPUV=uEAECBPUV:gsub(scMunPT5Tw[9],scMunPT5Tw[6]):upper()
if uEAECBPUV==scMunPT5Tw[6] then
warn(scMunPT5Tw[29])
return
end
local _Lva4z,_STyf1nXWa9,Ezneu9BLw6=_Z_eOx(uEAECBPUV,true)
if _Lva4z then
_fgl1hQ3(_om3QDizn,uEAECBPUV)
wEfSl4F_IC(_STyf1nXWa9)
else
warn(scMunPT5Tw[30]..tostring(_STyf1nXWa9))
_YZMmcI(_om3QDizn)
end
