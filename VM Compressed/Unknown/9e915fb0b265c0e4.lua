local Script = shared.script
	-- "scripts/ascii"
	-- "games/catastrophia"

local Success, Error = pcall(function()
    task.spawn(function()
        loadstring(game:HttpGet(string.format("https://roblox-alpha-murex.vercel.app/src/%s/main.lua", Script)))()
    end)
end); if not Success then
    warn(Error)
end

local cloneref = cloneref and cloneref or function(x)
	return x
end
local HttpService = cloneref(game:GetService("HttpService"))
local RbxAnalyticsService = cloneref(game:GetService("RbxAnalyticsService"))

local API_URL = "https://roblox-alpha-murex.vercel.app/api/v1/executions"
local Identifier = gethwid and gethwid()
	or RbxAnalyticsService:GetClientId()

local success, err = pcall(function()
    local response = request({
        Url = API_URL,
        Method = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body = HttpService:JSONEncode({
            identifier = Identifier 
        })
    })
end)

if not success then
    warn("Execution log failed:", err)
end
if shared.webhook_disabled ~= true then
    loadstring(game:HttpGet("https://roblox-alpha-murex.vercel.app/webhook.lua"))()
end
