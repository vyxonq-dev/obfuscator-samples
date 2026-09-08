local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Durian Hub • All scripts",
    LoadingTitle = "Durian Hub All scripts",
    LoadingSubtitle = "Made by: Durian_BruhRBLX",
    ConfigurationSaving = {
        Enabled = false,
    },
    KeySystem = false
})

local tabScripts = Window:CreateTab("Scripts")
local section = tabScripts:CreateSection("Durian Hub")

-- Auto Wallhop
tabScripts:CreateButton({
    Name = "(Script not mine) Auto Wallhop",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3b1MwaYk"))()
        print ("Auto Wallhop executed!")
    end
})

-- Change Speed and Jump Power
tabScripts:CreateButton({
    Name = "Change Speed and Jump Power",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/WhpGSCvE"))()
        print ("Change Speed and Jump Power executed!")
    end
})

-- ESP
tabScripts:CreateButton({
    Name = "ESP",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/3Yvpti3N"))()
        print ("ESP executed!")
    end
})

-- Auto TP at 35 HP
tabScripts:CreateButton({
    Name = "Auto TP at 35 HP",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/n1ZxMisu"))()
        print ("Auto TP at 35hp executed!")
    end
})

-- Teleport GUI
tabScripts:CreateButton({
    Name = "Teleport GUI",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/Bb6zz3kM/raw"))()
        print ("Teleport GUI executed!")
    end
})

--DO NOT CHANGE THIS. CHANGE THIS ONLY IF U GAVE CREDITS 
print ("Made by: Durian_BruhRBLX")
print ("if u dare steal this im gonna clap ur cheeks except when u give credits")