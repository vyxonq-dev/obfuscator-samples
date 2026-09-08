-- SirBacon Hub with Theme Save + Restart
-- Replace the rehost link below with your Pastebin RAW link after uploading

local ThemeStorageKey = "sirbacon_theme"
local HttpService = game:GetService("HttpService")

-- Load saved theme
local Theme = "Default"
pcall(function()
    if isfile and readfile and isfile(ThemeStorageKey .. ".json") then
        local data = HttpService:JSONDecode(readfile(ThemeStorageKey .. ".json"))
        Theme = data.theme or "Default"
    end
end)

-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- Create GUI
local MainWindow = Rayfield:CreateWindow({
    Name = "sirbacon hub",
    Icon = 0,
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by sirbacon",
    ShowText = "Rayfield",
    Theme = Theme,
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "sirbacon"
    },

    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },

    KeySystem = true,
    KeySettings = {
        Title = "sirbacon key",
        Subtitle = "Key System",
        Note = "Key is sirbacon",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = { "sirbacon" }
    }
})

-- Main Tab
local MainTab = MainWindow:CreateTab("Main", 4483362458)

MainTab:CreateButton({
    Name = "Enable Godmode (Example)",
    Callback = function()
        local char = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
        if char:FindFirstChild("Humanoid") then
            char.Humanoid.Name = "GodHumanoid"
            print("Godmode enabled (example)")
        else
            warn("Humanoid not found")
        end
    end,
})

MainTab:CreateButton({
    Name = "Enable Fly (Example)",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Y5iXrK3r"))()
        print("Fly script loaded (example)")
    end,
})

-- Themes Tab
local ThemesTab = MainWindow:CreateTab("Themes", 4483362458)

local themes = {
    ["Default"] = "Default",
    ["Amber Glow"] = "AmberGlow",
    ["Amethyst"] = "Amethyst",
    ["Bloom"] = "Bloom",
    ["Dark Blue"] = "DarkBlue",
    ["Green"] = "Green",
    ["Light"] = "Light",
    ["Ocean"] = "Ocean",
    ["Serenity"] = "Serenity"
}

for name, id in pairs(themes) do
    ThemesTab:CreateButton({
        Name = "Switch to Theme: " .. name,
        Callback = function()
            if writefile then
                local saveData = HttpService:JSONEncode({ theme = id })
                writefile(ThemeStorageKey .. ".json", saveData)
                Rayfield:Notify({
                    Title = "Theme Changed",
                    Content = "Restarting hub with theme: " .. id,
                    Duration = 4
                })
                task.wait(1.5)
                -- ⬇️ Replace this with your actual Pastebin RAW link ⬇️
                loadstring(game:HttpGet("https://pastebin.com/raw/YOUR_PASTE_ID_HERE"))()
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Your executor doesn't support saving themes.",
                    Duration = 4
                })
            end
        end
    })
end