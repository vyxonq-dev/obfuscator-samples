repeat wait() until game:IsLoaded()

-- Load Fluent UI and Addons
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({ Title = "Omega Hub | TSB", 
SubTitle = "By Zenx",
TabWidth = 120, 
Size = UDim2.fromOffset(490, 400), 
Acrylic = true, Theme = "Darker", MinimizeKey = Enum.KeyCode.RightControl })

Fluent:Notify({
Title = "Omega Hub Loaded",
Content = "Enjoy TSB Script!",
Duration = 6
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "home"}),
}


Tabs.Main:AddButton({
    Title = "Join Discord",
    Description = "Copies Discord link to clipboard Join Discord For The Rivals Script.",
    Callback = function()
        setclipboard("https://discord.com/invite/sFhyP4nJw9")
        Fluent:Notify({
            Title = "Discord Link Copied",
            Content = "Paste it into Chrome to join: discord.gg/sFhyP4nJw9",
            Duration = 6
        })
    end
})
