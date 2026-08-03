
local string_find = string.find
local string_sub = string.sub
local string_len = string.len
local string_lower = string.lower
local table_insert = table.insert
local next = next
local typeof = typeof
local tick = tick
local error = error
local warn = warn
getgenv().getfenv = nil
getgenv().setfenv = nil
local pcall = pcall   
local xpcall = xpcall   
local tostring = tostring   
local tonumber = tonumber   
local type = type   
local typeof = typeof   
local string_char = string.char   
local string_lower = string.lower   
local string_gsub = string.gsub   
local string_match = string.match   
local string_reverse = string.reverse   
local table_freeze = table.freeze or function(t) return t end   
local debug_traceback = debug and debug.traceback or function(err) return err end   

getgenv().DEBUG = true   

local function GlobalErrorHandler(err)   
    warn("Security Matrix Error:\n" .. tostring(debug_traceback(err)))   
    return err   
end   

local success, err = xpcall(function()   
    local StarterGui = game:GetService("StarterGui")   
    local function notify(title, text)   
        xpcall(function()   
            StarterGui:SetCore("SendNotification", {   
                Title = title,   
                Text = text,   
                Duration = 5   
            })   
        end, GlobalErrorHandler)   
    end   
    notify("Security Matrix v5.1", "Hyper-Polymorphic heuristic protection initialized.")   

    local CoreGui = game:GetService("CoreGui")   
    local UniqueStorageTag = "Protected_Matrix_Storage_System"   

    if CoreGui:FindFirstChild(UniqueStorageTag) then   
        notify("Security Notification", "Engine optimization updated successfully.")   
        return nil   
    end   

    local ProtectionMarker = Instance.new("Folder")   
    ProtectionMarker.Name = UniqueStorageTag   
    ProtectionMarker.Parent = CoreGui   

    local Http = {}   

    local Blacklist = {   
        "stealer", "stolen", "tobi's", "trade", "cmd.exe", "linkingservice", "messagebusservice", "gift", "ratt", "all your items", "getdiscuser", "geoip",   
        "canihazip", "ipify", "grabify", "ipinfo", "ipconfig", "myip", "externalip", "checkip", "mailbox", "stopify", "blasze", "leancoding", "ip-api", "ipaddress", "ifconfig", "browserleaks", "whoer", "rawscriptserver", "hookdeck", "ngrok", "snyk", "ipwho", "ipgeolocation", "ipdata", "ipstack", "maxmind", "db-ip", "country.is", "ipapi", "radar", "whoisxmlapi", "geoapify", "iplocate", "iptrackertool", "api-ninjas", "apifreaks", "findip", "freeipapi", "neutrinoapi", "hackertarget", "ip.sb", "ipinfodb", "getgeoapi", "geoplugin", "ipregistry", "abstractapi", "extreme-ip-lookup", "geolocation-db", "amazonaws", "api.myip", "wtfismyip", "icanhazip", "ident.me", "httpbin.org", "who.is", "randommer", "mockaroo", "randomuser",   
        "ipleak", "guilded.gg/api/webhooks", "webhook.lewisakura", "hooks.hyra", "kaname.imayaho", "webhook.guilded", "hooks.guilded", "webhook.site", "beeceptor", "pipedream", "requestcatcher", "toptal.com", "run.mocky.io", "iplogger", "adclick", "clickmeter", "yandex.ru", "leak.sx",   
        ".ROBLOSECURITY", "GetCookiesAsync", "RobloxCookies", "cookie", "ipinfo", "://slack.com", "GetSecret",   
        "abuseipdb", "canarytokens", "roproxy", "vscodetunnel", "discord.yeesen", "yeesen.dev", "vercel.app", "mrhooks", "sentanos", "simulhost", "newstargeted",   
        "webhookrouter", "PromptPurchase", "PromptGamePassPurchase", "LinkedSource", "getrenv", "getreg", "hooks.osyr.is", "PromptBulkPurchase", "saveinstance", "bit.tohex", "discordiet", "rapidapi", "writefile", "appendfile"   
    }   

    local HeuristicKeywords = {   
        "cookie", "trade", "gift", "ratt", "stealer", "stolen", "tobi's", "all your items", "getdiscuser"   
    }   
        
    local ExfiltrationVectors = {   
        "httpget", "httppost", "request", "http_request", "syn.request", "fetch", "postmessage", "webhook"   
    }   

    table_freeze(Blacklist)   
    table_freeze(HeuristicKeywords)   
    table_freeze(ExfiltrationVectors)   

local MAX_OPS = 100 
local currentOps = 0
local CleanCache = {} 

local function BudgetYield()
    currentOps = currentOps + 1
    if currentOps >= MAX_OPS then
        currentOps = 0
        task.wait() 
    end
end

local function DeepClean(str)
    if type(str) ~= "string" then return "" end
    if CleanCache[str] then return CleanCache[str] end

    local originalStr = str
    local globalLastState
    
    repeat
        globalLastState = str
        BudgetYield()

        -- [Group 1: Basic Encodings]
        str = string_gsub(string_lower(str), "\\x(%x%x)", function(h) return string_char(tonumber(h, 16)) end)
        str = string_gsub(str, "\\(%d%d%d)", function(d) return string_char(tonumber(d)) end)
        str = string_gsub(str, "\\(%d+)", function(d) 
            local v = tonumber(d) 
            return (v and v <= 255 and #d <= 3) and string_char(v) or "\\"..d 
        end)
        
        -- [Group 2: String Methods]
        str = string_gsub(str, "%((['\"])(.-)%1%s*:%s*reverse%s*%(%s*%)", function(q, s) return q..string_reverse(s)..q end)
        str = string_gsub(str, "%((['\"])(.-)%1%s*:%s*lower%s*%(%s*%)", function(q, s) return q..string_lower(s)..q end)

        -- [Group 3: Arithmetic Resolution]
        str = string_gsub(str, "(%-?%d+)%s*%-%s*%((%-?%d+)%)", function(a, b) return tostring(tonumber(a) - tonumber(b)) end)
        str = string_gsub(str, "(%-?%d+)%s*%+%-%s*(%d+)", function(a, b) return tostring(tonumber(a) - tonumber(b)) end)
        str = string_gsub(str, "(%-?%d+)%s*([%+%-%*/%^%%])%s*(%-?%d+)", function(a, op, b)
            local nA, nB = tonumber(a), tonumber(b)
            if not nA or not nB then return end
            if op == "+" then return tostring(nA + nB) elseif op == "-" then return tostring(nA - nB)
            elseif op == "*" then return tostring(nA * nB) elseif op == "/" and nB ~= 0 then return tostring(nA / nB)
            elseif op == "^" then return tostring(nA ^ nB) elseif op == "%" and nB ~= 0 then return tostring(nA % nB) end
        end)
        str = string_gsub(str, "%((%-?%d+)%)", "%1")

        -- [Group 4: API & VM Signatures]
        str = string_gsub(str, "math%.([a-z]+)%s*%(%s*(%-?%d+%.?%d*)%s*%)", function(f, n) return math[f] and tostring(math[f](tonumber(n))) or nil end)
        str = string_gsub(str, "bit32%.([a-z]+)%s*%(%s*(%d+)%s*,%s*(%d+)%s*%)", function(o, a, b) return bit32[o] and tostring(bit32[o](a,b)) or nil end)
        str = string_gsub(str, "%(%s*function%s*%(%s*%)%s*return%s*(['\"]?)(.-)%1%s*end%s*%)%s*%(%s*%)", "'%2'")
        str = string_gsub(str, "table%.concat%s*%(%s*%{([%d%s%,]+)%}%s*%)", function(b) 
            local res = "" for n in string.gmatch(b, "%d+") do res = res..string_char(tonumber(n)) end return "'"..res.."'" 
        end)

        -- [Group 5: Binary/Hex/B64 Chains]
        str = string_gsub(str, "([01]{8})", function(b) local v = tonumber(b, 2) return (v > 31 and v < 127) and string_char(v) or b end)
        str = string_gsub(str, "%%(%x%x)", function(h) return string_char(tonumber(h, 16)) end)
        str = string_gsub(str, "\\u(%x%x%x%x)", function(h) local c = tonumber(h, 16) return (c <= 255) and string_char(c) or "" end)
        str = string_gsub(str, "(\\[xX]%x%x)+", function(chain) 
            local res = "" for h in string.gmatch(chain, "\\[xX](%x%x)") do res = res..string_char(tonumber(h, 16)) end return "'"..res.."'" 
        end)

        -- [Group 6: Cleanup & Polymorphic Tags]
        str = string_gsub(str, "\\z%s*", "")
        str = string_gsub(str, "[\226\128\139\239\187\191]", "")
        str = string_gsub(str, "LPH_STRENC%s*%(%s*(['\"])(.-)%1%s*%)", "'%2'")
        str = string_gsub(str, "LPH_CRASH%s*%(%s*%)", "nil")

    until str == globalLastState

    local result = string_gsub(str, "[%s%p%c]", "")
    CleanCache[originalStr] = result
    return result
end

    local function IsSuspicious(url, body, isScriptScan)   
        local rawCombined = tostring(url) .. tostring(body)   
        
        local concatResolved = rawCombined   
        local lastState   
        repeat   
            lastState = concatResolved   
            concatResolved = string_gsub(concatResolved, '(["\'])(.-)%1%s*%.%.%s*(["\'])(.-)%3', '%1%2%4%1')   
        until concatResolved == lastState   

        local lastStateLong   
        repeat   
            lastStateLong = concatResolved   
            concatResolved = string_gsub(concatResolved, '%[%[(.-)%]%]%s*%.%.%s*%[%[(.-)%]%]', '[[%1%2]]')   
        until concatResolved == lastStateLong   

        local lastStateMixed   
        repeat   
            lastStateMixed = concatResolved   
            concatResolved = string_gsub(concatResolved, '(["\'])(.-)%1%s*%.%.%s*(["\'])(.-)%3', function(q1, text1, q2, text2)   
                return q1 .. text1 .. text2 .. q1   
            end)   
        until concatResolved == lastStateMixed   
        
        local cleanUrl = DeepClean(url)   
        local cleanBody = DeepClean(concatResolved)   
        local revBody = string_reverse(cleanBody)   
        local combined = cleanUrl .. cleanBody .. revBody   
        local rawLower = string_lower(rawCombined)   

        for _, item in ipairs(Blacklist) do   
            local cleanItem = DeepClean(item)   
            if string.find(combined, cleanItem, 1, true) then   
                
                if isScriptScan then   
                    local isHeuristic = false   
                    for _, hk in ipairs(HeuristicKeywords) do   
                        if string_lower(item) == hk then   
                            isHeuristic = true   
                            break   
                        end   
                    end   

                    if isHeuristic then   
                        local hasVector = false   
                        for _, vector in ipairs(ExfiltrationVectors) do   
                            if string.find(rawLower, vector, 1, true) then   
                                hasVector = true   
                                break   
                            end   
                        end   
                        if not hasVector then   
                            continue   
                        end   
                    end   
                end   

                return true, item   
            end   
        end   
        return false, nil   
    end   

    function Http:HasSuspiciousHeaders(Headers)   
        if type(Headers) ~= "table" then return false end   
        local Sus = {"user-agent", "x-discord-webhook", "x-api-key", "authorization"}   
        
        for qk, _ in pairs(Headers) do   
            local lowered = string_lower(tostring(qk))   
            for _, pattern in ipairs(Sus) do   
                if string_match(lowered, pattern) then return true end   
            end   
        end   
        return false   
    end   

    function Http:SanitizeResponse(Response)   
        if type(Response) ~= "string" then return Response end   
        local safeIp = string_gsub(Response, "%d+%.%d+%.%d+%.%d+", "127.0.0.1")   
        return string_gsub(safeIp, "([%da-fA-F]*:%d*:[%da-fA-F:]+)", "::1")   
    end   

    function Http:ScanHTTPRequest(Args)   
        local R = {Url="", Body="", IsPost=false, IsTable=false, Headers={}}   
        for _, Arg in next, Args do   
            if typeof(Arg) == "string" then   
                R.Url = Arg   
            elseif typeof(Arg) == "table" then   
                R.Url = Arg.Url or Arg.url or ""   
                R.Body = Arg.Body or Arg.body or ""   
                R.IsPost = (R.Body ~= "")   
                R.IsTable = true   
                R.Headers = Arg.Headers or {}   
            end   
        end   
        return R   
    end   

    local function HasHighEntropy(codeStr)   
        local length = #codeStr   
        if length < 50 then return false end   
        
        local stringCharMatches = select(2, string_gsub(codeStr, "string%.char", ""))   
        local nonAlphaMatches = select(2, string_gsub(codeStr, "[^%w%s%p]", ""))   
        
        if (stringCharMatches / length) > 0.03 or (nonAlphaMatches / length) > 0.25 then   
            return true   
        end   
        return false   
    end   

    local function HasCorrelatedExfiltration(codeStr)   
        local hasHighRiskFunc = string_match(codeStr, "request%s*%(") or string_match(codeStr, "http_request%s*%(") or string_match(codeStr, "HttpPost")   
        local hasSensitiveVars = string_match(codeStr, "LocalPlayer") or string_match(codeStr, "%.ROBLOSECURITY") or string_match(codeStr, "GetSecret")   
        return hasHighRiskFunc and hasSensitiveVars   
    end   

    local oldLoadstring   
    if hookfunction then   
        oldLoadstring = hookfunction(loadstring, newcclosure(function(code, ...)   
            local codeStr = tostring(code)   
            
            codeStr = DeepClean(codeStr)   

            local isWeaponizedEnv = false   
            local EnvPatterns = {"debug.getregistry", "debug.getupvalue", "getinfo", "WebSocket"}   
            local SuspiciousIndicators = {"\\x%x%x", "\\[0-9]+", "require%s*%(%s*%d+%s*%)", "loadstring%s*%("}   
            
            local SafePatterns = {   
                "getgenv%(%)%.[%w_]+%s*=",   
                "getgenv%(%)%s*%.",   
                "require%s*%(%s*script%.",   
                "require%s*%(%s*game%.",   
                "shared%.[%w_]+%s*=",   
                "shared%s*%.",   
                "_G%.[%w_]+%s*=",   
                "_G%s*%.",   
                "local%s+[%w_,%s]+%s*=%s*getgenv%(%)",   
                "local%s+[%w_,%s]+%s*=%s*game",   
                "script%s*:%s*FindFirstChild",   
                "script%s*:%s*WaitForChild",   
                "game%s*:%s*GetService",   
                "game%s*:%s*getService",   
                "local%s+[%w_,%s]+%s*=%s*require"   
            }   

            local originalCodeStr = codeStr   
            for _, safePat in ipairs(SafePatterns) do   
                codeStr = string_gsub(codeStr, safePat, "")   
            end   

            if not HasHighEntropy(originalCodeStr) then   
                codeStr = string_gsub(codeStr, "require%s*%(%s*%d+%s*%)", "")   
            end   
            
            local AdvancedThreats = {   
                "getfenv%s*%(%s*0%s*%)",   
                "setfenv%s*%(%s*0",   
                "%\\[xX]%x%x%\\[xX]%x%x",   
                "string%.reverse%s*%(%s*['\"]%w+"   
            }   
            for _, threat in ipairs(AdvancedThreats) do   
                table.insert(SuspiciousIndicators, threat)   
            end   

            local VMSignatures = {   
                "LPH_OBFUSCATED", "MoonSec", "WeAreDevs_API", "IronBrew",   
                "bit32%.bnot", "table%.concat%({[0-9%s,]+}"   
            }   
            for _, threat in ipairs(VMSignatures) do   
                table.insert(SuspiciousIndicators, threat)   
            end   
            
            for _, envPat in ipairs(EnvPatterns) do   
                if string_match(codeStr, envPat) then   
                    for _, indicator in ipairs(SuspiciousIndicators) do   
                        if string_match(codeStr, indicator) then   
                            isWeaponizedEnv = true   
                            break   
                        end   
                    end   
                end   
            end   

            if isWeaponizedEnv then   
                notify("Security Matrix", "Blocked weaponized environment manipulation attempt.")   
                return newcclosure(function()    
                    return setmetatable({}, {   
                        __index = function() return function() end end,   
                        __call = function() end   
                    })   
                end)   
            end   

            if HasHighEntropy(codeStr) then   
                notify("Security Matrix", "Neutralized Threat: High Entropy Obfuscation Detected.")   
                return newcclosure(function() end)   
            end   

            if HasCorrelatedExfiltration(codeStr) then   
                local isSus, reason = IsSuspicious("", codeStr, true)   
                if isSus then   
                    notify("Security Matrix", "Neutralized Contextual Threat Payload: " .. tostring(reason))   
                    return newcclosure(function() end)   
                end   
            else   
                local isSus, reason = IsSuspicious("", codeStr, true)   
                if isSus then   
                    notify("Security Matrix", "Neutralized Threat Payload: " .. tostring(reason))   
                    return newcclosure(function() end)   
                end   
            end   
            
            return oldLoadstring(code, ...)   
        end))   
    end   

    local function HttpCallback(OldFunc, ...)   
        local Args = {...}   
        local ReqData = Http:ScanHTTPRequest(Args)   
        
        if IsSuspicious(ReqData.Url, ReqData.Body, false) then   
            notify("Security Shield", "Dropped Outbound Exfiltration: " .. ReqData.Url)   
            return ReqData.IsTable and {Success=false, StatusCode=403, Body="Dropped by security layer", Headers={}} or "Blocked"   
        end   

        local Response = OldFunc(...)   
        if type(Response) == "table" and Response.Body then   
            if Http:HasSuspiciousHeaders(Response.Headers) or Http:HasSuspiciousHeaders(ReqData.Headers) then   
                Response.Body = Http:SanitizeResponse(Response.Body)   
            end   
        elseif type(Response) == "string" and Http:HasSuspiciousHeaders(ReqData.Headers) then   
            Response = Http:SanitizeResponse(Response)   
        end   
        return Response   
    end   

    xpcall(function()   
        if getrawmetatable and setreadonly then   
            local rawMT = getrawmetatable(game)   
            setreadonly(rawMT, false)   

            local oldNamecall = rawMT.__namecall   
            local oldIndex = rawMT.__index   

            rawMT.__namecall = newcclosure(function(Self, ...)   
                local method = getnamecallmethod()   
                if (method == "HttpGet" or method == "HttpPost" or method == "http_request") and Self == game then   
                    return HttpCallback(oldNamecall, Self, ...)   
                end   
                return oldNamecall(Self, ...)   
            end)   

            rawMT.__index = newcclosure(function(Self, Key)   
                if (Key == "HttpGet" or Key == "HttpPost") and Self == game then   
                    return newcclosure(function(_, ...) return HttpCallback(oldIndex(game, Key), ...) end)   
                end   
                return oldIndex(Self, Key)   
            end)   
        end  
    end, GlobalErrorHandler)   
end, GlobalErrorHandler)