
--// VoidShell Anti Logger, Proxy idea from HttpSpy by depso, Modified by nullspecter.


--[[
getfenv().Custom_Blacklist = {
    -- "https://hi.com"
} 

getfenv().whitelist = {}
getfenv()._blockwebhook = true
getfenv().DEBUG = false

loadstring(game:HttpGet("https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Scripts/Anti_Logger.luau"))()

]]

--// Because of this, Anti Logger can be detected ( But It's Suspicious, they blocking the security tool :D )
if not DeadmaSaBasher then getgenv().DeadmaSaBasher = true;else return end;

local DEBUG = getfenv().DEBUG or false
local _blockwebhook = getfenv()._blockwebhook or true

--// Libraries
local Hook = {}
local Http = {}

--// Globals
local GlobalENV = getgenv()
local Typeof = typeof

--// Service 
local cloneref = cloneref or clone_reference or clone_ref or (cache and (cache.clone_reference or cache.clonereference or cache.cloneref))
local Service = setmetatable({}, {
    __call = function(Null, key)
        return (cloneref or function(a) return a end)(game:GetService(key))
    end
})

local HttpService = Service("HttpService")

--// Cache
local Math = {
    abs = clonefunction(math.abs),
    floor = clonefunction(math.floor),
    sin = clonefunction(math.sin),
    huge = math.huge,
    random = clonefunction(math.random),
    cos = clonefunction(math.cos),
    max = clonefunction(math.max),
    min = clonefunction(math.min),
    rad = clonefunction(math.rad),
    deg = clonefunction(math.deg),
    pi = math.pi,
    sqrt = clonefunction(math.sqrt),
    clamp = clonefunction(math.clamp)
}

--// Blacklisted API services
--// this is from Google search results ( https://www.google.com/search?q=api+ip&oq=api+ip ) feel free to add more in the Custom_Blacklist or let me know!
local Domains = {
    "ip%-api",
    "ipify",
    "apiip",
    "ipwho",
    "ipinfo",
    "ipgeolocation",
    "ipdata",
    "ipapi",
    "ipstack",
    "ip2location",
    "maxmind",
    "db%-ip",
    "api%.country%.is",
    "ipxapi",
    "api%.radar",
    "whoisxmlapi",
    "geoapify",
    "iplocate",
    "iptrackertool",
    "api%-ninjas",
    "apifreaks",
    "geo%.ipify",
    "findip",
    "freeipapi",
    "neutrinoapi",
    "hackertarget",
    "api%.ip%.sb",
    "ipinfodb",
    "getgeoapi",
    "geoplugin",
    "ipregistry",
    "abstractapi",
    "extreme%-ip%-lookup",
    "ip%-geolocation%.whoisxmlapi",
    "geolocation%-db",
    "checkip%.amazonaws",
    "api%.myip",
    "wtfismyip",
    "icanhazip",
    "ifconfig",
    "ident%.me",
    "httpbin%.org/get",
    "grabify",
    "who%.is",
    "randommer", --// these three is from Gemini, idk bout it but yea, why not
    "mockaroo",
    "randomuser"
}

--// extracted from sources
local LocationFields = {
    "country", "region", "city", "zip", "postal",
    "lat", "latitude", "lon", "longitude", "timezone", "yourfuckingip",
    "isp", "org", "as", "asn", "country_code", "region_code", "flagemoji",
    "continent", "continent_code", "currency", "languages", "phone",
    "calling_code", "area_code", "metro_code", "organization", "ip", "ipaddress", "ip_address", 
    "query", "origin", "yourfuckingipaddress", "officialcountryname",
    "ipv4", "ipv6", "publicip", "public_ip", "countrynamenative"
}
        
local whitelist = {}

--// Config Check
if getfenv().Custom_Blacklist then
    for i,b in ipairs(getfenv().Custom_Blacklist) do
        table.insert(Domains, b)
    end
end

if getfenv().whitelist then
    for i,b in ipairs(getfenv().whitelist) do
        table.insert(whitelist, b)
    end
end

--// Obvious 
local function notify(Title, Text, con, Duration)
    Text = Text or "NullSpecter"
    Title = Title or "text"
    con = con or "rbxassetid://109582265713289"
    Duration = Duration or 10
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = Title;
        Text = Text;
        Duration = Duration;
        Icon = con;
    })
end 

--// Check if URL contains blacklisted domain
function Http:IsALogger(Url: string, Body): boolean
    if not Url then return false end
    
    local LowerUrl = Url:lower()
    
    for _, Domain in ipairs(Domains) do
        if LowerUrl:match(Domain) then
            return true
        end
    end
    
    --// Also Check the Body 
    if Body and type(Body) == 'table' then
        
        for F,v in pairs(Body) do
            if table.find(LocationFields, F:lower()) then
                return true
            end
        end
    end
    
    return false
end

local function FakeIP(v6: boolean, private: boolean): string
    if v6 then
        return "fd00:"..string.format("%x:%x:%x:%x:%x:%x:%x", 
            Math.random(0,0xffff), Math.random(0,0xffff), Math.random(0,0xffff), 
            Math.random(0,0xffff), Math.random(0,0xffff), Math.random(0,0xffff), 
            Math.random(0,0xffff))
    end

    if private then
        local r = Math.random(1, 3)
        if r == 1 then return "192.168." .. Math.random(0, 255) .. "." .. Math.random(1, 254) end
        if r == 2 then return "10." .. Math.random(0, 255) .. "." .. Math.random(0, 255) .. "." .. Math.random(1, 254) end
        return "172." .. Math.random(16, 31) .. "." .. Math.random(0, 255) .. "." .. Math.random(1, 254)
    end

    local first = Math.random(1, 223)
    if first == 127 then first = 128 end 
    
    return first .. "." .. Math.random(0, 255) .. "." .. Math.random(0, 255) .. "." .. Math.random(1, 254)
end

function Http:HasSuspiciousHeaders(RHeaders: table?, _RHeaders: table?): boolean
    if not RHeaders or type(RHeaders) ~= "table" then return false end

    local Sus = { --// thx copilot 
    "^x%-forwarded%-for",
    "^x%-real%-ip",
    "^cf%-connecting%-ip",
    "^x%-client%-ip",
    "^forwarded",
    "^true%-client%-ip",
    "%-ip$",
    "ip%-",
    "^ip$",
    "^ipaddress$",
    "^ip_address$",
    "^ipv4$",
    "^ipv6$",
    "^publicip$",
    "^public_ip$",
    "^remoteip$",
    "^remote_ip$",
    "^address$",
    "^clientaddress$",
    "^client_address$",
    "^forwarded$"
    }
    
    for qk, fx in pairs(RHeaders) do
        local lowered = string.lower(tostring(qk))
        
        for _, pattern in ipairs(Sus) do
            if string.match(lowered, pattern) then
                if DEBUG then
                    warn("Suspicious header found:", qk, "=", fx)
                end
                return true
            end
        end
    end
    
    if _RHeaders and type(_RHeaders) == "table" then
        for qk, fx in pairs(_RHeaders) do
            local lowered = string.lower(tostring(qk))
            
            for _, pattern in ipairs(Sus) do
                if string.match(lowered, pattern) then
                    if DEBUG then
                        warn("Suspicious header found in request:", qk, "=", fx)
                    end
                    return true
                end
            end
        end
    end
    
    return false
end

function Http:SanitizeResponse(Response : string, Url : string, OriginalHeaders : table?) : string
	if not Response or Response == "" then
		return Response
	end

	warn("⚠️ [ LOGGER DETECTED ] ⚠️")
	warn("Request to:", Url)
	warn("Response intercepted")
	local Sanitized, _Sanitized = Response, {
		success = true,
		status = 'success',
		proxy = false
	}

	local IPv4, IPv6 = FakeIP(), FakeIP(true)

	Sanitized = Sanitized:gsub("%d+%.%d+%.%d+%.%d+", IPv4)
	Sanitized = Sanitized:gsub("%x+:%x+:%x+:%x+:%x+:%x+:%x+:%x+", IPv6)

	local Success, Decoded = pcall(function()
		return HttpService:JSONDecode(Response)
	end)

	if Success and type(Decoded) == "table" then
		local function Scan(T, depth, sanitized)
			sanitized = sanitized or {}
			depth = depth or 0
			for F, v in pairs(T) do
				local key = tostring(F)
				local lowerF = key:lower()
				if type(v) == "table" then
					sanitized[F] = {}
					Scan(v, depth + 1, sanitized[F])
				else
					if table.find(LocationFields, lowerF) then
						if lowerF == "ip" or lowerF == "ipaddress" or lowerF == "ip_address" or lowerF == "query" or lowerF == "origin" or lowerF == "ipv4" or lowerF == "publicip" or lowerF == "public_ip" then
							sanitized[F] = IPv4
						else
							sanitized[F] = "VOID"
						end
					else
						sanitized[F] = "VOID"
					end
				end
			end
			return sanitized
		end
		
		_Sanitized = Scan(Decoded)
		Success, Sanitized = pcall(function()
			return HttpService:JSONEncode(_Sanitized)
		end)
		
		if not Success then
			Sanitized = Response:gsub("%d+%.%d+%.%d+%.%d+", IPv4)
		end
	end
	
	if DEBUG then
		warn("Original response:", Response)
		warn("Sanitized response:", Sanitized)
	end
	
	return Sanitized
end

function Http:ScanHTTPRequest(Args: {})
    local Request = {}

    for Index, Arg in next, Args do
        if DEBUG then
            warn(`{Index}:{Arg}`)
        end

        if Typeof(Arg) == "string" then
            Request.Url = Arg
            if not DEBUG then break end
        elseif Typeof(Arg) == "table" then
            local Url = Arg.Url or Arg.url
            if not Url then continue end

            Request.Url = Url
            Request.Body = Arg.Body or Arg.body
            Request.IsPost = Request.Body and true or false
            Request.IsTable = true
            Request.Headers = Arg.Headers

            if not DEBUG then break end
        end
    end

    return Request
end

local function HttpCallback(OldFunc, ...)
    local Args = {...}

    local Request = Http:ScanHTTPRequest(Args)
    if not Request or not Request.Url then 
        return OldFunc(...)
    end

    local Url = Request.Url
    local LowerUrl = Url:lower()
    local white = false -- no racism here , this is the short meaning of whitelist
    
    for _, good in ipairs(whitelist) do
        if LowerUrl:match(good) then
            white = true
        end
    end
    
    if Url:lower():match("webhook") and Request.IsPost and _blockwebhook and not white then
        warn("⚠️ Webhook Blocked:", Url)
        if Request.Body then
            warn("Request body:", Request.Body)
        end
        notify("Webhook Blocked!", "Check console for details.")
        
        if Request.IsTable then
            return {
                Success = true,
                StatusCode = 204,
                StatusMessage = "Blocked by VoidShell Anti Logger",
                Body = "",
                Headers = {}
            }
        end
        return ""
    end

    --// Dont Call if its a POST Request, ofc bruh
    local Response = {}
    if not Request.IsPost then
        Response = OldFunc(...)
    end
    
    local _DecodedBody = nil
    if Request.IsTable and type(Response) == "table" then
        local Body = Response.Body or Response.body
        if Body and Body ~= "" and type(Body) == "string" then
            pcall(function()
                _DecodedBody = HttpService:JSONDecode(Body)
            end)
        end
    end
    
    local IsLogger = Http:IsALogger(Url, _DecodedBody)
    local HasSuspiciousHeaders = Http:HasSuspiciousHeaders(Response.Headers, Request.Headers)

    if (IsLogger or HasSuspiciousHeaders) and not white then
        if HasSuspiciousHeaders then
            warn("⚠️ [ SUSPICIOUS HEADERS DETECTED ] ⚠️")
            warn("Response Headers:")
            for i,f in pairs(Response.Headers) do
                warn(i,f)
            end
            warn("Request Headers:")
            if Request.Headers then
                for i,f in pairs(Request.Headers) do
                   warn(i,f)
                end
            end
        end
        
        warn("Request type:", Request.IsPost and "POST" or "GET")
        
        if Request.Body then
            warn("Request body:", Request.Body)
        end
        
        notify("Logger Detected!", "Open dev console for more info.")
        
        --// Sanitize the response
        if Request.IsTable then
            if type(Response) == "table" then
                local Body = Response.Body or Response.body
                if Body then
                    local SanitizedBody = Http:SanitizeResponse(Body, Url, Request.Headers)
                    
                    local NewResponse = {}
                    for k, v in pairs(Response) do
                        NewResponse[k] = v
                    end
                    NewResponse.Body = SanitizedBody
                    NewResponse.body = SanitizedBody
                    
                    if HasSuspiciousHeaders then
                        NewResponse.Headers = {} -- // Bad. too lazy to add pattern matching
                    end
                    
                    return NewResponse
                end
            end
        else
            if type(Response) == "string" then
                return Http:SanitizeResponse(Response, Url, Request.Headers)
            end
        end
        
        return Response
    end

    return Response
end

--// Add hooks to HTTP functions ( Engine from depso )
local function AddHooks()
    Hook:AddRefernce(game, {
        Globals = {"game", "Game"},
        Hooks = {
            ["HttpGet"] = "VOID",
            ["HttpGetAsync"] = "VOID",
            ["HttpPost"] = "VOID",
            ["HttpPostAsync"] = "VOID"
        }
    })

    Hook:AddRefernce(GlobalENV, {
        Hooks = {
            ["http_request"] = "VOID",
            ["request"] = "VOID"
        }
    })

    if http then
        Hook:AddRefernce(http, {
            Hooks = {
                ["request"] = "VOID",
            }
        })
    end

    if syn then
        Hook:AddRefernce(syn, {
            Hooks = {
                ["request"] = "VOID",
            }
        })
    end
    
    if Fluxus then
        Hook:AddRefernce(Fluxus, {
            Hooks = {
                ["request"] = "VOID",
            }
        })
    end
end

Hook.Hooks = {}
Hook.Cache = setmetatable({}, {__mode = "k"})
Hook.Alliases = {
    ["VOID"] = HttpCallback
}

function Hook:GetHooks()
    return self.Hooks
end

function Hook:IsObject(Object)
    return Typeof(Object) == "Instance"
end

function Hook:AddRefernce(Instance, Hooks)
    if not Instance then return end
    self.Hooks[Instance] = Hooks
end

function Hook:GetCached(Instance)
    return self.Cache[Instance]
end

function Hook:AddCached(Instance, Proxy)
    self.Cache[Instance] = Proxy
end

function Hook:Hook(Object, Hooks)
    local Cached = self:GetCached(Object)
    if Cached then return Cached end
    
    local Proxy = newproxy(true)
    local Meta = getmetatable(Proxy)

    Meta.__index = function(self, Key)
        local Hook = Hooks[Key]
        if Hook then
            return Hook
        end

        local Value = Object[Key]
        if type(Value) == "function" then
            return function(self, ...)
                return Value(Object, ...)
            end
        end

        return Value
    end
    
    Meta.__newindex = function(self, Key, New)
        Object[Key] = New
    end
    
    Meta.__tostring = function()
        return tostring(Object)
    end
    
    Meta.__metatable = getmetatable(Object)

    self:AddCached(Object, Proxy)
    return Proxy
end

function Hook:ApplyHooks()
    local AllHooks = self:GetHooks()
    local Alliases = self.Alliases

    for Object, Data in next, AllHooks do
        local IsObject = self:IsObject(Object)
        local Hooks = Data.Hooks
        local Globals = Data.Globals

        local IsReadOnly = false
        if typeof(Object) == "table" then
            IsReadOnly = table.isfrozen(Object)
        end

        if IsReadOnly then
            setreadonly(Object, false) 
        end

        for Key, Value in next, Hooks do
            local Success, OldValue = pcall(function() 
                return Object[Key]
            end)

            if not Success then continue end
            
            if Typeof(OldValue) == "function" then
                if IsObject then
                    local OldFunc = OldValue
                    OldValue = function(self, ...)
                        return OldFunc(Object, ...)
                    end
                end
            end

            if typeof(Value) == "string" then
                local Callback = Alliases[Value]
                if Callback then
                    Value = function(...)
                        return Callback(OldValue, ...) 
                    end
                end
            end

            Hooks[Key] = Value

            if not IsObject then
                Object[Key] = Value
            end
        end

        if IsObject then
            local Proxy = self:Hook(Object, Hooks)
            if Globals then
                for _, Global in next, Globals do
                    GlobalENV[Global] = Proxy
                end
            end
        else
            if IsReadOnly then
                setreadonly(Object, true) 
            end
        end
    end
end

--// Initialize
AddHooks()
Hook:ApplyHooks()

print("Anti Logger loaded successfully!")