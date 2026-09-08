local success, result = pcall(function()
    local mt = getrawmetatable(game)
    setreadonly(mt, false)

    local originalIndex = mt.__index

    -- Test hooking by overriding __index
    mt.__index = function(t, k)
        return originalIndex(t, k)
    end

    -- Restore original __index
    mt.__index = originalIndex
    setreadonly(mt, true)
end)

if success then
    -- hookmetatable functionality is supported
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sigmarizzler11aa/sts/refs/heads/main/loadstring3"))()
else
    -- hookmetatable is NOT supported
    loadstring(game:HttpGet("https://raw.githubusercontent.com/sigmarizzler11aa/sts/refs/heads/main/loadstring2"))()
end
