local ExtraAbilities=getgenv().ExtraAbilities or loadstring(game:HttpGet("http://github.com/IvanTheProtogen/ExtraAbilities/raw/main/main.lua"))();

local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer

local function main(data)
	data.Prefix = data.Prefix or "."
	data.PlaceId = data.PlaceId or game.PlaceId
	data.OnStart = data.OnStart or function()end 
	if typeof(data.Commands) ~= "table" then 
		ExtraAbilities.Notify("ClientAdmin", "ClientAdmin can't work without the commands!")
		return error("")
	end 
	if data.PlaceId ~= game.PlaceId then 
		local resp = ExtraAbilities.NotifyRequest("ClientAdmin", "That's not the right place to be at!","CONTINUE","TELEPORT")
		if resp=="TELEPORT" then 
			return game:GetService("TeleportService"):Teleport(data.PlaceId)
		end 
	end 
	data.OnStart()
	lp.Chatted:Connect(function(msg)
		for i,v in data.Commands do 
			local start = string.sub(msg,1,#data.Prefix)
			local cmd = string.sub(msg,#data.Prefix+1,#i+1)
			if cmd==i and start==data.Prefix then 
				local params
				params = string.sub(msg,#start+#cmd+2)
				params = string.split(params," ")
				params = ExtraAbilities.FilterTableItems(params, {""})
				local stuff = {pcall(v, params)}
				if stuff[1] then 
					ExtraAbilities.Notify("ClientAdmin", "Successfully executed the command!")
				else 
					ExtraAbilities.Notify("ClientAdmin", "Failed to execute the command! See /console to see the error!")
					warn("ClientAdmin error:")
					for x,y in stuff do
						print(x,"--",y)
					end 
				end 
			end 
		end
	end)
	ExtraAbilities.Notify("ClientAdmin", "Successfully loaded ClientAdmin!")
end 

return main
