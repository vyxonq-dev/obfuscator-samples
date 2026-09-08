-- USE THIS LIBRARY ONLY IN COMBINATION WITH AN OFFICIAL LOADSTRING AFTERWARDS
-- THIS LIBRARY IS NOT SECURED

local HttpService = game:GetService("HttpService")
local httpRequest = (syn and syn.request) or request or http_request

local Junkie = {}
Junkie.service = nil
Junkie.identifier = nil
Junkie.base_url = "https://api.jnkie.com/api/v1/whitelist"
Junkie.script_id = nil
Junkie.provider = nil

function Junkie.check_key(key)
	if not Junkie.service then error("service not set") end
	local resp = httpRequest({
			Method = "POST",
			Url = Junkie.base_url .. "/verifyOpen",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode({
				key = tostring(key or ""),
				service = Junkie.service,
				identifier = tostring(Junkie.identifier or "unknown")
			})
		})
	
	if not resp then
		return {valid = false, error = "ERROR"}
	end
	if resp.StatusCode ~= 200 then
		return {valid = false, error = "http " .. resp.StatusCode}
	end
	
    return HttpService:JSONDecode(resp.Body)
end

function Junkie.get_key_link(provider)
	if not Junkie.service then error("service not set") end
	if not Junkie.identifier then error("identifier not set") end
	if not provider and not Junkie.provider then error("provider not set") end
	
	local linkResp = httpRequest({
			Method = "POST",
			Url = Junkie.base_url .. "/getKeyOpen",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode({
				service = Junkie.service,
				provider = tostring(provider or Junkie.provider),
				identifier = tostring(Junkie.identifier)
			})
		})
	
	if not linkResp then return nil, "ERROR" end
	if linkResp.StatusCode == 429 then return nil, "RATE_LIMITTED" end
	if linkResp.StatusCode ~= 200 then return nil, linkResp.Body or "ERROR" end
	return linkResp.Body, nil
end

function Junkie.load_script()
	if not Junkie.script_id then error("script_id not set") end
	loadstring(game:HttpGet("https://api.jnkie.com/api/v1/luascripts/public/" .. tostring(Junkie.script_id) .. "/download"))()
	return
end

return Junkie
