--============================--
-- SERVICES
--============================--
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

--============================--
-- WIND UI
--============================--
local WindUI = loadstring(game:HttpGet(
    "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"
))()

--============================--
-- THEME
--============================--
WindUI:AddTheme({
    Name = "Black",

    Background = Color3.fromRGB(5, 0, 0),
    WindowBackground = Color3.fromRGB(8, 0, 0),
    TabBackground = Color3.fromRGB(6, 0, 0),
    ElementBackground = Color3.fromRGB(12, 0, 0),

    Accent = Color3.fromRGB(180, 0, 0),
    Outline = Color3.fromRGB(40, 0, 0),
    Text = Color3.fromRGB(255, 255, 255),

    Button = Color3.fromRGB(25, 0, 0),
    Icon = Color3.fromRGB(220, 0, 0),

    DialogButtonHover = Color3.fromRGB(45, 0, 0),
})

--============================--
-- WINDOW
--============================--
local Window = WindUI:CreateWindow({
    Title = "ego simulator scripts",
    Icon = "computer",
    Author = "by the ghost",
    Folder = "GhostHub",
    Size = UDim2.fromOffset(520, 300),
    Transparent = true,
    Theme = "Black",
    Resizable = true,
    MinimizeKey = Enum.KeyCode.RightControl,
})

-- BOTÃO FLUTUANTE
Window:EditOpenButton({
    Title = "ego simulator scripts",
    Icon = "computer",
    Enabled = true,
    Draggable = true,
})

--============================--
-- TAB SELECT SCRIPTS
--============================--
local ScriptsTab = Window:Tab({
    Title = "Select Scripts",
    Icon = "menu"
})

ScriptsTab:Section({
    Title = "Hubs & Scripts"
})

--------------------------------------------------
-- QUANTUM HUB
--------------------------------------------------
ScriptsTab:Button({
    Title = "Quantum Hub",
    Desc = "Quantum Onyx Hub",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua",
                true
            ))()
        end)
    end
})

--------------------------------------------------
-- MURDER MYSTERY SCRIPT
--------------------------------------------------
ScriptsTab:Button({
    Title = "Murder Mystery | ESP / Auto Farm / Kill All",
    Desc = "MM2 Script",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://pastefy.app/8MCNOzgy/raw",
                true
            ))()
        end)
    end
})

--------------------------------------------------
-- NOTHUB LOADER
--------------------------------------------------
ScriptsTab:Button({
    Title = "NotHub Loader",
    Desc = "Universal Script Loader",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/Bruteforcelol/648278/refs/heads/main/NotHub.Loader",
                true
            ))()
        end)
    end
})

--------------------------------------------------
-- PM SCRIPT
--------------------------------------------------
ScriptsTab:Button({
    Title = "PM Script",
    Desc = "Universal / Misc",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://phtk.neocities.org/PM",
                true
            ))()
        end)
    end
})

--------------------------------------------------
-- SCRIPT FR
--------------------------------------------------
ScriptsTab:Button({
    Title = "Script FR",
    Desc = "French Universal Script",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet(
                "https://raw.githubusercontent.com/loldo-g/Scripts-FR/refs/heads/main/script1.lua",
                true
            ))()
        end)
    end
})

--============================--
-- FIM
--============================--