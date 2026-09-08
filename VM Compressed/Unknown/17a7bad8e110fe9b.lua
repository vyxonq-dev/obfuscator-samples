local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "S* Hub",
    LoadingTitle = "S* Hub, Completely Free.",
    LoadingSubtitle = "Update v1.0",
    Theme = "Ocean",
    ConfigurationSaving = {
        Enabled = false
    }
})

local MainTab = Window:CreateTab("Script Hubs", "badge-check")
local GamesTab = Window:CreateTab("Games", 125094830280177)
local UniversalTab = Window:CreateTab("Universal", 10740274875)
local SettingsTab = Window:CreateTab("Settings", "cog") 

local WarningSection = MainTab:CreateSection("All of this and others, is not in any order of best to worst.")
    

local ForgeButton = MainTab:CreateButton({
    Name = "Forge Hub",
    Callback = function(v)
        v = loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/d5ed1fbd4301b1d18d75153c5b47181d.lua"))()
    end
})

local MoonButton = MainTab:CreateButton({
    Name = "Moondiety",
    Callback = function(v)
        v = loadstring(game:HttpGet("https://raw.githubusercontent.com/m00ndiety/Moondiety/refs/heads/main/Loader"))()
    end
})

local LuminButton = MainTab:CreateButton({
    Name = "Lumin Hub",
    Callback = function(v)
        v = loadstring(game:HttpGet("http://luminon.top/loader.lua"))()
    end
})

local AxonButton = MainTab:CreateButton({
    Name = "Axon Hub",
    Callback = function(v)
        v = loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/97c3f6db55a2cf72141537a85458e5a7.lua"))()
    end
})

local AtherButton = MainTab:CreateButton({
    Name = "Ather Hub",
    Callback = function(v)
        v = loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
    end
})

local RiftButton = MainTab:CreateButton({
    Name = "Rift Hub",
    Callback = function(v)
        v = loadstring(game:HttpGet("https://rifton.top/loader.lua"))()
    end
})

local AdminSection = UniversalTab:CreateSection("Admin")

local INFYButton = UniversalTab:CreateButton({
    Name = "Infinite Yield",
    Callback = function(v)
        v = loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

local NamelessButton = UniversalTab:CreateButton({
    Name = "Nameless Admin V1 (original)",
    Callback = function(a)
      a = loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()
    end
})

local NMVButton = UniversalTab:CreateButton({
    Name = "Nameless Admin V2",
    Callback = function(a)
      a = loadstring(game:HttpGet("https://raw.githubusercontent.com/ltseverydayyou/Nameless-Admin/main/Source.lua"))()
    end
})

local MoreScriptsSection = UniversalTab:CreateSection("More Scripts")

local FSButton = UniversalTab:CreateButton({
    Name = "FScripts (Fun Scripts)",
    Callback = function(f)
      f = loadstring(game:HttpGet("https://raw.githubusercontent.com/sc0t6/FScripts/refs/heads/main/Source/sourcecode.lua"))()
    end
})

local GTAButton = UniversalTab:CreateButton({
    Name = "GTA Mod Menu",
    Callback = function(f)
      f = loadstring(game:HttpGet("https://vt-now.github.io/VIOLENT/vt.lua"))()
    end
})

local GameSection = GamesTab:CreateSection("Game Scripts")

local NightsButton = GamesTab:CreateButton({
    Name = "99 Nights In The Forest Script",
    Callback = function(f)
        f = loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/nightsintheforest.lua", true))()
    end
})

local BrookButton = GamesTab:CreateButton({
    Name = "Brookhaven",
    Callback = function(b)
        b = loadstring(game:HttpGet("https://raw.githubusercontent.com/nxvap/Hexagon/refs/heads/main/brookhaven"))()
    end
})

local InfoSection = SettingsTab:CreateSection("Hub Info")

SettingsTab:CreateLabel("Game ID: " .. game.GameId)
SettingsTab:CreateLabel("User ID: " .. game:GetService("Players").LocalPlayer.UserId)
SettingsTab:CreateLabel("Username: " .. game:GetService("Players").LocalPlayer.Name)

SettingsTab:CreateButton({
    Name = "Unload Menu",
    Callback = function()
        Rayfield:Destroy()
    end
})

SettingsTab:CreateSection("Executor Info")

local identity = "Unknown"
if getidentity then
    identity = "Level " .. tostring(getidentity())
elseif syn and syn.get_thread_identity then
    identity = "Level " .. tostring(syn.get_thread_identity())
end
SettingsTab:CreateLabel("Executor Level: " .. identity)
SettingsTab:CreateLabel("Executor: " .. (getexecutorname and getexecutorname() or "Unknown"))

Rayfield:Notify({
    Title = "Loaded S* Hub.",
    Content = "Every script should work.",
    Duration = 5
})

Rayfield:LoadConfiguration()
