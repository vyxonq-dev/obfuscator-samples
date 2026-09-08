task.spawn(function()
	local http_request = (psm and psm.request) or (syn and syn.request) or (fluxus and fluxus.request) or request or http_request or (http and http.request);
	if not http_request then 
		warn("Executor does not support HTTP requests.")
		return; 
	end;
	local cloneref = cloneref or function(i: Instance) return i; end;
	local HTTP = cloneref(game:GetService("HttpService"));
	local discord_link = "ckbr3wqcms"
	discord_link = discord_link:gsub("https://discord.gg", ""):gsub("discord.gg/", ""):gsub("https://discord.com", "")
	for i = 6463, 6472, 1 do
		local s, r = pcall(http_request, {
			Url = "http://127.0.0.1:" .. tostring(i) .. "/rpc?v=1",
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json",
				["Origin"] = "https://discord.com"
			},
			Body = HTTP:JSONEncode({
				["cmd"] = "INVITE_BROWSER",
				["args"] = {
					["code"] = discord_link
				},
				["nonce"] = HTTP:GenerateGUID(true)
			})
		});
		if s and r and r.StatusCode == 200 then 
			break; 
		end;
	end;
end);

loadstring(game:HttpGet("https://raw.githubusercontent.com/noritery/msf-killall/refs/heads/main/main.lua"))()
