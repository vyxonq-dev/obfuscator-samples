local ReflectionService = game:GetService("ReflectionService")

local function QuerySignals(Object)
	local Class = Object.ClassName
	
	local success, events = pcall(function()
		return ReflectionService:GetEventsOfClass(Class)
	end)
	
	if not success or not events then
		return
	end
	
	local eventOutput = {}
	
	for _, event in events do
		local Signal = event.Name
		
		local ParamsStr = "()"
		if #event.Parameters > 0 then
			local Params = {}
			for _, param in event.Parameters do
				local typeString = param.Type.InstanceType or param.Type.EngineType
				table.insert(Params, param.Name .. ": " .. typeString)
			end
			ParamsStr = "(" .. table.concat(Params, ", ") .. ")"
		end
		
		local isDeprecated = false
		local depMessage = nil
		
		if event.Display and event.Display.DeprecationMessage then
			isDeprecated = true
			depMessage = event.Display.DeprecationMessage
		end
		
		local CanReplicate = "<unknown?>"
		if cansignalreplicate then
			local bool, RealSignal = pcall(function()
				return Object[Signal]
			end)
			
			if bool and typeof(RealSignal) == "RBXScriptSignal" then
				local RepBool, RepResult = pcall(function()
					return cansignalreplicate(RealSignal)
				end)
				
				if RepBool then
					CanReplicate = tostring(RepResult)
				end
			end
		end
		
		local SignalDetails = string.format("Signal: %s\nParams: %s\nIsDeprecated: %s", Signal, ParamsStr, tostring(isDeprecated))
		
		if isDeprecated then
			SignalDetails ..= "\nDeprecatedMessage: " .. tostring(depMessage)
		end
		
		SignalDetails ..= "\nCanReplicate: " .. CanReplicate
		table.insert(eventOutput, SignalDetails)
	end
	print("Class: " .. Class .. "\n\n" .. table.concat(eventOutput, "\n- - -\n"))
end

return QuerySignals
--[[
	HOW TO USE:
	
	:1: FETCH SCRIPT
	local QuerySignals = loadstring(game:HttpGet("https://raw.githubusercontent.com/Roblox-HttpSpy/Random-Silly-stuff/refs/heads/main/Utils/QuerySignals.lua"))()
	
	:2: USE IT DIRECTLY
	QuerySignals(workspace)
	
	:3: OR PUT IT IN GENV (Recommended)
	
	getgenv().QuerySignals = QuerySignals
]]--
