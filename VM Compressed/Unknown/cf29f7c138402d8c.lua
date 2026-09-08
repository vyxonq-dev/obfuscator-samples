
print("🔄 Loading Claude UI Library...")

local success, err = pcall(function()
    loadstring(game:HttpGet("https://www.superscriptguy.store/init.lua"))()
    print("✅ Core library loaded")

    loadstring(game:HttpGet("https://www.superscriptguy.store/window.lua"))()
    print("✅ Complete UI system loaded")
end)

if success then
    print("🎉 Claude UI Library loaded successfully!")
    print("📖 Usage: local Window = Claude:Window({SubTitle = 'v1.0'})")
    return getgenv().Claude
else
    warn("❌ Failed to load Claude UI Library: " .. tostring(err))
    return nil
end