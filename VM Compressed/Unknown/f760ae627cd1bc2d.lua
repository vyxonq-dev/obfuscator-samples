if game.GameId == 10563114921 then 
	if not game:IsLoaded() then game.Loaded:Wait() end 
	for _, Table in getgc(true) do
		if typeof(Table) ~= "table" then continue end
		if getrawmetatable(Table) then continue end

		local HasRecursiveTable = false

		for _, Value in Table do
			if typeof(Value) ~= "table" then continue end

			if Table == Value then
				HasRecursiveTable = true
				break
			end
		end

		if not HasRecursiveTable then
			continue
		end

		local BanIndex: number
		for _, Value in Table do
			if typeof(Value) ~= "number" then continue end

			for Index = 1, 3  do
				if Value == Index then
					BanIndex = Index
					break
				end
			end

			if BanIndex then
				break
			end
		end

		if BanIndex and Table[BanIndex] == nil then
			setmetatable(Table, {
				__newindex = function(self, Key, Value)
				--  rconsolewarn(`Blocked {Key} {Value}`)
				end
			})
		end
	end
end 
loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/2761203bdcc2236b517674e1f4808f90.lua"))()