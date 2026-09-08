local HttpService = game:GetService("HttpService")

local FAKE = {
    ["api%.fastdex%.space/api/verify%-user"] = function()
        return HttpService:JSONEncode({
            valid = true,
            key = "78660c4847330e3b23a04894e92cb370",
            timeLeft = 999999999,
            userId = "1242767259244695682",
            expiresAt = os.time() * 1000 + 31536000000
        })
    end,
    ["api%.fastdex%.space/api/verify%-key"] = function()
        return HttpService:JSONEncode({
            valid = true,
            firstActivation = false,
            timeLeft = 999999999,
            userId = "1242767259244695682",
            expiresAt = os.time() * 1000 + 31536000000
        })
    end,
    ["/api/webhook"] = function() return "" end
}

local REPLACE = {["FastDex"] = "NiggerDex", ["FrannnDev"] = "FuckkkDev"}

local function getFake(url)
    if type(url) ~= "string" then return end
    for p, f in pairs(FAKE) do if url:match(p) then return f end end
end

local function replaceStr(s)
    if type(s) ~= "string" then return s end
    for og, rep in pairs(REPLACE) do s = s:gsub(og, rep) end
    return s
end

local mt = getrawmetatable(game)
setreadonly(mt, false)
local oldIndex, oldNamecall, oldNewIndex = mt.__index, mt.__namecall,
                                           mt.__newindex

mt.__index = newcclosure(function(self, k)
    if self == game and (k == "HttpGet" or k == "HttpGetAsync") then
        return newcclosure(function(_, url, ...)
            local fake = getFake(url)
            if fake then return replaceStr(fake()) end
            return replaceStr(oldIndex(self, k)(self, url, ...))
        end)
    end
    local r = oldIndex(self, k)
    return type(r) == "string" and replaceStr(r) or r
end)

mt.__namecall = newcclosure(function(self, ...)
    local m = getnamecallmethod()
    local args = {...}

    for i = 1, #args do
        if type(args[i]) == "string" then args[i] = replaceStr(args[i]) end
    end

    if self == game and (m == "HttpGet" or m == "HttpGetAsync") then
        local fake = getFake(args[1])
        if fake then return replaceStr(fake()) end
    end

    local results = {oldNamecall(self, unpack(args))}
    for i = 1, #results do
        if type(results[i]) == "string" then
            results[i] = replaceStr(results[i])
        end
    end
    return unpack(results)
end)

mt.__newindex = newcclosure(function(self, k, v)
    return oldNewIndex(self, k, type(v) == "string" and replaceStr(v) or v)
end)

setreadonly(mt, true)

local function hookReq(og)
    return newcclosure(function(req)
        req = type(req) == "table" and req or {Url = req}
        local fake = getFake(req.Url)
        if fake then
            return {
                Success = true,
                StatusCode = 200,
                StatusMessage = "OK",
                Headers = {},
                Body = replaceStr(fake())
            }
        end
        local res = og(req)
        if res.Body then res.Body = replaceStr(res.Body) end
        return res
    end)
end

local function safeHook(tbl, key, hookFn)
    if not tbl or not tbl[key] then return end
    local hooked = hookFn(tbl[key])
    local wasReadonly = isreadonly and isreadonly(tbl)
    if wasReadonly then pcall(function() setreadonly(tbl, false) end) end
    local ok = pcall(function() tbl[key] = hooked end)
    if not ok then pcall(function() rawset(tbl, key, hooked) end) end
    if wasReadonly then pcall(function() setreadonly(tbl, true) end) end
end

safeHook(syn, "request", hookReq)
safeHook(http, "request", hookReq)
if request then getgenv().request = hookReq(request) end
if http_request then getgenv().http_request = hookReq(http_request) end

loadstring(game:HttpGet(
               "https://raw.githubusercontent.com/decentholograms/Roblox-Scripts/refs/heads/main/Scripts/MvsS.lua",
               true))()
