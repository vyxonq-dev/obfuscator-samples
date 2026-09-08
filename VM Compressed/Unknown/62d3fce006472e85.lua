-- // Made by @Flames9925 | Edited by @NyxaSylph
local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)

local HttpService: HttpService = cloneref(game:GetService("HttpService"));
local Players: Players = cloneref(game:GetService("Players"));
local LPlayer = Players.LocalPlayer;

repeat task.wait() until game:IsLoaded() and (LPlayer and LPlayer.Character)

if typeof(getconnections) == "function" then
    for _, Conn in ipairs(getconnections(LPlayer.Idled)) do
        Conn:Disable()
    end
else
    warn("❌ Anti AFK Failed")
end

local Loader = {}

Loader.Repositories = {["NyxaSylph"] = "https://raw.githubusercontent.com/NyxaSylph/Vellure/main/",
	["FlamesW"]   = "https://raw.githubusercontent.com/FlamesW/Vellure/main/",
}

Loader.Files = {
    ["A Universal Time"] = { Author = "NyxaSylph", File = "AUT/Main.lua", CreatorId = 6556072 },
    ["Vox Seas"] = { Author = "NyxaSylph", File = "VS/Main.lua", CreatorId = 35566755 },
    ["99nigt"] = { Author = "NyxaSylph", File = "99nigt/Main.lua", CreatorId = 6042520 },
	["Hunty Zombie"] = { Author = "NyxaSylph", File = "HuntyZ/main.lua", CreatorId = 36015593 },
    
	["Blade X Zombies"] = { Author = "FlamesW", File = "BXZ/Main.lua", CreatorId = 883342755 },
    ["Weak Legacy 2"] = { Author = "FlamesW", File = "WL2/Main.lua", CreatorId = 34970628 },
    ["Murim Cultivation"] = { Author = "FlamesW", File = "MC/Main.lua", CreatorId = 32416851 },
}

function Loader:LoadByCreatorId(CreatorId)
    for GameName, Data in pairs(self.Files) do
        if Data.CreatorId == CreatorId then
            local Url = ("%s%s"):format(self.Repositories[Data.Author], Data.File)
            local Ok, Err = pcall(function()
                return loadstring(game:HttpGet(Url))()
            end)
            if Ok then
                print("✅ Loaded:", GameName, "by @" .. Data.Author)
            else
                warn("❌ Everything went south:", GameName, Err)
            end
            return
        end
    end

    warn([[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⠀⠀⠀
⠀⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡀⠀⠀
⠀⠀⠀⢠⣿⣿⣿⣿⣿⡿⠛⠉⠉⠉⠉⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀
⠀⠀⠀⣾⣿⣿⣿⣿⣿⣷⣤⣀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀
⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀
⠀⠀⣿⣿⣿⠛⢿⣿⣿⡿⠟⠋⠉⠉⠙⠻⢿⣿⣿⡿⠛⣿⣿⣿⣿⣿⣿⡇
⠀⢸⣿⣿⣿⠀⠀⠈⠁⠀⢀⣴⣿⣿⣦⡀⠀⠈⠁⠀⠀⣿⣿⣿⣿⣿⣿⣿
⠀⣸⣿⣿⣿⣄⠀⠀⠀⢠⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⣠⣿⣿⣿⣿⣿⣿⣿
⠀⣿⣿⣿⣿⣿⣷⣤⣴⣿⣿⣿⣿⣿⣿⣿⣿⣦⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿
⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿

    UNSUPPORTED GAME - CLOWN DETECTED 🤡
    ]])
end

Loader:LoadByCreatorId(game.CreatorId)
return Loader
