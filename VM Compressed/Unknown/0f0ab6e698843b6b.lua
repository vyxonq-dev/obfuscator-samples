
local Claude = loadstring(game:HttpGet("https://www.superscriptguy.store/loader.lua"))()

Claude:StartLoad()

wait(2)

local Window = Claude:Window({
    SubTitle = "Example v1.0",
    Size = UDim2.new(0, 700, 0, 500),
    TabWidth = 150
})

local ShowcaseTab = Window:Tab("Showcase", "rbxassetid://10747373176")
local MainTab = Window:Tab("Main", "rbxassetid://10723407389")
local ComponentsTab = Window:Tab("Components", "rbxassetid://10723415335")
local SettingsTab = Window:Tab("Settings", "rbxassetid://10734950309")

ShowcaseTab:Seperator("🚀 Next-Gen UI Library")

ShowcaseTab:Label("✨ Claude UI - Modern interface for premium scripts")
ShowcaseTab:Label("🎯 Professional grade components & smooth animations")
ShowcaseTab:Label("⚡ Optimized performance for all script types")

ShowcaseTab:Line()

ShowcaseTab:Seperator("🔥 Premium Features")

ShowcaseTab:Toggle("Auto Execute", true, "Automatically execute scripts on game join", function(state)
    Claude:Notify(state and "Auto Execute enabled!" or "Auto Execute disabled")
end)

ShowcaseTab:Toggle("Premium Mode", true, "Unlock advanced features and settings", function(state)
    Claude:Notify("Premium mode " .. (state and "activated" or "deactivated"))
end)

ShowcaseTab:Dropdown("Script Category", {"Exploit Scripts", "Game Scripts", "Utility Scripts", "Premium Scripts"}, "Premium Scripts", function(category)
    Claude:Notify("Selected: " .. category)
end)

ShowcaseTab:Slider("Execution Speed", 1, 10, 8, function(speed)
end)

ShowcaseTab:Line()

ShowcaseTab:Seperator("⚙️ Advanced Controls")

ShowcaseTab:Button("🎮 Launch Script Hub", function()
    Claude:Notify("Script Hub launched successfully!")
end)

ShowcaseTab:Button("🔧 Open Developer Tools", function()
    Claude:Notify("Developer tools activated")
end)

ShowcaseTab:Button("💎 Unlock Premium", function()
    Claude:Notify("Premium features unlocked!")
end)

ShowcaseTab:Textbox("License Key", false, function(key)
    if key ~= "" then
        Claude:Notify("License key validated: " .. string.sub(key, 1, 8) .. "...")
    end
end)

ShowcaseTab:Line()

ShowcaseTab:Seperator("📊 Status Dashboard")

local statusLabel = ShowcaseTab:Label("🟢 System Status: Online")
local versionLabel = ShowcaseTab:Label("📦 Version: v2.4.1 Premium")
local usersLabel = ShowcaseTab:Label("👥 Active Users: 1,247")

spawn(function()
    local statuses = {
        "🟢 System Status: Online",
        "🟡 System Status: High Load",
        "🟢 System Status: Optimal",
        "🔵 System Status: Maintenance"
    }
    local users = {1247, 1251, 1256, 1260, 1243}

    while wait(4) do
        statusLabel:Set(statuses[math.random(1, #statuses)])
        usersLabel:Set("👥 Active Users: " .. users[math.random(1, #users)])
    end
end)

MainTab:Seperator("Basic Functions")

MainTab:Button("Send Notification", function()
    Claude:Notify("Hello from Claude UI Library!")
end)

MainTab:Button("Test Alert", function()
    Claude:Notify("This is a test notification with a longer message to show how it wraps.")
end)

MainTab:Line()

local autoEnabled = false
MainTab:Toggle("Auto Mode", false, "Enable automatic operations", function(state)
    autoEnabled = state
    Claude:Notify("Auto mode " .. (state and "enabled" or "disabled"))
end)

MainTab:Toggle("Silent Mode", true, "Reduce notifications and sounds", function(state)
    print("Silent mode:", state)
end)

ComponentsTab:Seperator("Selection Components")

local weaponList = {"Sword", "Bow", "Staff", "Dagger", "Hammer"}
local selectedWeapon = "Sword"
ComponentsTab:Dropdown("Choose Weapon", weaponList, selectedWeapon, function(weapon)
    selectedWeapon = weapon
    Claude:Notify("Selected weapon: " .. weapon)
end)

local modeList = {"Easy", "Normal", "Hard", "Expert"}
ComponentsTab:Dropdown("Difficulty", modeList, "Normal", function(mode)
    Claude:Notify("Difficulty set to: " .. mode)
end)

ComponentsTab:Line()

ComponentsTab:Seperator("Value Components")

ComponentsTab:Slider("Volume", 0, 100, 75, function(value)
    print("Volume:", value)
end)

ComponentsTab:Slider("Speed Multiplier", 0.1, 5.0, 1.0, function(value)
    print("Speed multiplier:", value)
end)

ComponentsTab:Textbox("Player Name", false, function(text)
    Claude:Notify("Name set to: " .. text)
end)

ComponentsTab:Textbox("Custom Command", false, function(text)
    print("Custom command:", text)
end)

ComponentsTab:Line()

ComponentsTab:Seperator("Information")

local statusLabel = ComponentsTab:Label("Status: Ready")
local counterLabel = ComponentsTab:Label("Counter: 0")

local counter = 0
spawn(function()
    while wait(3) do
        counter = counter + 1
        counterLabel:Set("Counter: " .. counter)

        local statuses = {"Ready", "Working", "Processing", "Idle"}
        local randomStatus = statuses[math.random(1, #statuses)]
        statusLabel:Set("Status: " .. randomStatus)
    end
end)

SettingsTab:Seperator("User Configuration")

SettingsTab:Textbox("API Key", false, function(key)
    print("API Key updated:", key)
end)

SettingsTab:Toggle("Save Settings", true, "Automatically save configuration", function(state)
    print("Save settings:", state)
end)

SettingsTab:Toggle("Auto Updates", false, "Check for updates automatically", function(state)
    print("Auto updates:", state)
end)

SettingsTab:Line()

SettingsTab:Seperator("Performance")

SettingsTab:Slider("Refresh Rate", 10, 60, 30, function(rate)
    print("Refresh rate:", rate, "Hz")
end)

SettingsTab:Slider("Max Connections", 1, 20, 5, function(connections)
    print("Max connections:", connections)
end)

SettingsTab:Line()

SettingsTab:Seperator("Advanced")

local themeOptions = {"Dark", "Light", "Blue", "Red", "Green"}
SettingsTab:Dropdown("Theme", themeOptions, "Dark", function(theme)
    Claude:Notify("Theme changed to: " .. theme)
    if theme == "Blue" then
        _G.Third = Color3.fromRGB(0, 100, 255)
    elseif theme == "Green" then
        _G.Third = Color3.fromRGB(0, 255, 100)
    elseif theme == "Red" then
        _G.Third = Color3.fromRGB(255, 0, 0)
    end
end)

SettingsTab:Button("Reset to Defaults", function()
    Claude:Notify("Settings reset to default values")
    print("All settings have been reset")
end)

SettingsTab:Button("Export Config", function()
    Claude:Notify("Configuration exported successfully")
    print("Config exported")
end)

Claude:Loaded()

wait(1)
Claude:Notify("Claude UI Library loaded successfully!")

spawn(function()
    wait(5)
    local dropdown = ComponentsTab:Dropdown("Dynamic List", {"Item 1"}, "Item 1", function(item)
        print("Selected dynamic item:", item)
    end)

    wait(2)
    dropdown:Add("Item 2")
    wait(2)
    dropdown:Add("Item 3")
    wait(3)
    dropdown:Clear()
    dropdown:Add("New Item 1")
    dropdown:Add("New Item 2")
end)