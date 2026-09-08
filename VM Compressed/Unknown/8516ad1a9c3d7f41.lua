--[[


██╗░░░██╗░██████╗░██╗░░██╗███╗░░░███╗░█████╗░██████╗░
██║░░░██║██╔════╝░╚██╗██╔╝████╗░████║██╔══██╗██╔══██╗
╚██╗░██╔╝██║░░██╗░░╚███╔╝░██╔████╔██║██║░░██║██║░░██║
░╚████╔╝░██║░░╚██╗░██╔██╗░██║╚██╔╝██║██║░░██║██║░░██║
░░╚██╔╝░░╚██████╔╝██╔╝╚██╗██║░╚═╝░██║╚█████╔╝██████╔╝
░░░╚═╝░░░░╚═════╝░╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚════╝░╚═════╝░
                          HAVE FUN DONT BE A GAY

]]

getgenv().PlaceId = game.PlaceId

getgenv().Games = {
    ["Among Us"] = {
        IDs = {6263431107, 12803588709},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Among%20Us.lua"
    },

    ["Violence District"] = {
        IDs = {93978595733734},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Violence%20District.lua"
    },

    ["Forsaken"] = {
        IDs = {18687417158},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Forsaken.lua"
    },

    ["Flee The Facility"] = {
        IDs = {893973440},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Flee%20The%20Facility.lua"
    },

    ["Dark Deception Hunted"] = {
        IDs = {
            102181577519757,
            125591428878906,
            95211388186571,
            136431686349723
        },
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Hunted.lua"
    },

    ["Purgatory"] = {
        IDs = {71184132329621, 111510466699934},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/purgatory.lua"
    },

    ["Deadly Delivery"] = {
        IDs = {93044798454681, 125810438250765},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Deadly%20delivery.lua"
    },

    ["Pass The Bomb"] = {
        IDs = {2961583129},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Pass%20the%20Bomb.lua"
    },

    ["Mines"] = {
        IDs = {112279762578792},
        Script = "https://raw.githubusercontent.com/VGXMODPLAYER68/Vgxmod-Hub/refs/heads/main/Mines.lua"
    }
}

getgenv().Supported = false

for _, g in next, getgenv().Games do
    for _, id in next, g.IDs do
        if id == getgenv().PlaceId then
            getgenv().Supported = true
            loadstring(game:HttpGet(g.Script))()
            break
        end
    end
    if getgenv().Supported then break end
end

if not getgenv().Supported then
    game.Players.LocalPlayer:Kick("This game is not supported by the Vgxmod Hub.")
end
