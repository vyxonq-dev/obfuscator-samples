-- by Chara_lua new -discord account- 
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "I.N.S", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

-- Function to create buttons for a tab
local function createButtons(tab, buttons)
    for _, data in ipairs(buttons) do
        local buttonName = data[1]
        local scriptUrl = data[2]
        tab:AddButton({
            Name = buttonName,
            Callback = function()
                loadstring(game:HttpGet(scriptUrl, true))()
            end
        })
    end
end

-- Function to create tabs
local function createTab(tabName, iconId, buttons)
    local tab = Window:MakeTab({Name = tabName, Icon = iconId, PremiumOnly = false})
    createButtons(tab, buttons)
end

-- Define button data for each tab
local mainButtons = {
    {"Expander 🔨", 'https://raw.githubusercontent.com/Vcsk/RobloxScripts/main/HitboxExpander.lua'},
    {"Aimbot 🎯", 'https://raw.githubusercontent.com/PABLOSleuth2/Scripts1/main/RobloxScripts/TEST/aimbot_v2.lua'},
    {"Fly Gui V3🚀", 'https://pastebin.com/raw/KujhfsHq'},
    {"ESP 👁️", 'https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/Scripts/Esp.lua'},
    {"Mobile Keyboard 📱", 'https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt'},
    {"Teleport Tool 🌐", 'https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Teleport%20Tool/Source.lua'}
}

local adminButtons = {
    {"Infinite Yield 🔄", 'https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'},
    {"CMD-X 💻", 'https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source'},
    {"Fates 🌌", 'https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua'},
    {"Proton 🚀", 'https://api.luarmor.net/files/v3/loaders/5e6e6cc1bb32fd926764d064e2c60a3b.lua'},
    {"Nameless Admin 👤", 'https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source'},
    {"Legs Admin 🦵", 'https://raw.githubusercontent.com/leg1337/legadmv2/main/legadminv2.lua'},
    {"Homebrew 🍺", 'https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main'}
}

local prisonLifeButtons = {
    {"Tiger Admin 🐅", 'https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/TigeradminREVAMP.txt'},
    {"Prison Life Admin 🚓", 'https://pastebin.com/raw/1RvgFtcx'},
    {"Super Punch 💥", 'https://pastebin.com/raw/KeCtc8B5'},
    {"Tool Giver 🛠️", 'https://pastebin.com/raw/A7timJWF'}
}

local thyHoodButtons = {
    {"Print People's Money 💰", 'https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/Scripts/Print_people_money_to_console.lua'},
    {"Get Fake Holy Sword ⚔️", 'https://raw.githubusercontent.com/Niviana1/It_not_skeleton-/main/Scripts/Get_thefakeholyswordthingy.lua'}
}

local miscButtons = {
    {"Anticheat Bypass 🛡️", 'https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua'}
}

-- Create tabs with corresponding buttons
createTab("🔧|Main", "rbxassetid://4483345998", mainButtons)
createTab("🛠️|Admin", "rbxassetid://4483345998", adminButtons)
createTab("🔒|Prison Life", "rbxassetid://4483345998", prisonLifeButtons)
createTab("🇬🇧|Thy Hood", "rbxassetid://4483345998", thyHoodButtons)
createTab("🔧|Misc", "rbxassetid://4483345998", miscButtons)

-- Finish script initialization
OrionLib:Init()
