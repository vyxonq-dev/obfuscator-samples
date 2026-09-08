local GetGameScriptUrl = loadstring(game:HttpGet('https://raw.githubusercontent.com/henrick001/ROBLOX/main/IDtoURL'))()
local gameScriptUrl = GetGameScriptUrl()

if gameScriptUrl then
    local success, response = pcall(function()
        return game:HttpGet(gameScriptUrl, true)  
    end)

    if success then
        local loadedScript = loadstring(response)
        print("Executing the fetched game script...")
        loadedScript()  -- Run the script
    else
        warn("Failed to load the script. Error:", response)
    end
else
    local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
    Fluent:Notify({Title = "Hooked Hub", Content = "Unsupported Game", Duration = 3})
end
