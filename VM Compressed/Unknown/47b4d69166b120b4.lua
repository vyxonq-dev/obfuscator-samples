local repo = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local Library = loadstring(game:HttpGet(repo .. "Library.lua"))()
local ThemeManager = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local SaveManager = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local Options = Library.Options
local Toggles = Library.Toggles

local Window = Library:CreateWindow({
    Title = "Wimply Scripts",
    Footer = "Item Giver",
    NotifySide = "Right",
    ShowCustomCursor = false,
    Mobile = {
        Enabled = true,
        Title = "Wimply Scripts",
        Icon = "rbxassetid://10723434711"
    }
})

local Tabs = {
    Main = Window:AddTab("Item Giver", "package"),
    Settings = Window:AddTab("UI Settings", "monitor"),
}

local selectedItem = nil
local ItemGroup = Tabs.Main:AddLeftGroupbox("Tools")
local MenuGroup = Tabs.Settings:AddLeftGroupbox("Menu")

local function createNotif(title, text, icon, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Icon = icon,
        Duration = duration,
    })
end

local function getTools()
    local tools = {}
    for _, item in pairs(game.Workspace:GetDescendants()) do
        if item:IsA("Tool") then
            table.insert(tools, item.Name)
        end
    end
    return tools
end

local function giveTool(toolName)
    local tool = game.Workspace:FindFirstChild(toolName, true)
    
    if tool and tool:IsA("Tool") then
        local toolClone = tool:Clone()
        toolClone.Parent = game:GetService("Players").LocalPlayer.Backpack
        createNotif("Wimply Scripts", "✅ " .. toolName .. " successfully given!", nil, "5")
    else
        createNotif("Wimply Scripts", "❌ Tool not found: " .. toolName, nil, "5")
    end
end

local toolDropdown

ItemGroup:AddButton({
    Text = "Refresh Tools",
    Func = function()
        local tools = getTools()
        if toolDropdown then
            Options.ToolSelect:SetValues(tools)
        end
        createNotif("Wimply Scripts", "🔄 Found " .. #tools .. " tools", nil, "3")
    end
})

toolDropdown = ItemGroup:AddDropdown("ToolSelect", {
    Values = getTools(),
    Default = "",
    Multi = false,
    Text = "Select Tool",
    Callback = function(value)
        selectedItem = value
    end
})

ItemGroup:AddButton({
    Text = "Give Selected Tool",
    Func = function()
        if selectedItem and selectedItem ~= "" then
            giveTool(selectedItem)
        else
            createNotif("Wimply Scripts", "⚠️ Select a tool first", nil, "3")
        end
    end
})

MenuGroup:AddToggle("KeybindMenuOpen", {
    Default = Library.KeybindFrame.Visible,
    Text = "Open Keybind Menu",
    Callback = function(value)
        Library.KeybindFrame.Visible = value
    end,
})

MenuGroup:AddToggle("ShowCustomCursor", {
    Text = "Custom Cursor",
    Default = false,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})

MenuGroup:AddDropdown("NotificationSide", {
    Values = { "Left", "Right" },
    Default = "Right",
    Text = "Notification Side",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})

MenuGroup:AddDivider()
MenuGroup:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", { 
    Default = "LeftControl", 
    NoUI = true, 
    Text = "Menu keybind" 
})

MenuGroup:AddButton({
    Text = "Unload",
    Func = function()
        Library:Unload()
    end
})

Library.ToggleKeybind = Options.MenuKeybind

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })
ThemeManager:SetFolder("Wimply Scripts")
SaveManager:SetFolder("WimplyScripts/Config")

SaveManager:BuildConfigSection(Tabs.Settings)
ThemeManager:ApplyToTab(Tabs.Settings)

createNotif("Wimply Scripts", "✅ Script loaded successfully", nil, "5")