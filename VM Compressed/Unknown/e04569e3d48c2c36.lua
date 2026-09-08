getgenv().Games = {
    ["https://cdn.authguard.org/virtual-file/aee96d5e4671470bac7d91a7702d1044"] = {107204273213508},

    ["https://cdn.authguard.org/virtual-file/2277b0a13b1d4ddf8d53055a304bccab"] = {7920018625},
    
    ["https://cdn.authguard.org/virtual-file/a6ba023a4895469097e6d81e8256319d"] = {12427619094},
    
    ["https://cdn.authguard.org/virtual-file/f2f52adea0ba4cd7a47a54a1959a21e2"] = {75948699874267},

    ["https://cdn.authguard.org/virtual-file/d36c954e546b4e3ead617369c4754a04"] = {123741668193208},

    ["https://cdn.authguard.org/virtual-file/9c517530afc34fa89c8c5c2767099fb2"] = {126849358937279},

    ["https://cdn.authguard.org/virtual-file/1cf7b115deaa443bbb7d9569ed186cae"] = {116605585218149},

    ["https://cdn.authguard.org/virtual-file/4953615b854e4eaeaaf1d8731adf9c27"] = {133781619558477},

    ["https://cdn.authguard.org/virtual-file/b375d93d71394568a58a6d48b84f0477"] = {98632918083844},

    ["https://cdn.authguard.org/virtual-file/7106af23b410401ca1dcd9d83e6e7b35"] = {84951580948333},

    ["https://cdn.authguard.org/virtual-file/173a47701d0046219475112c8304d853"] = {137925884276740},
}

local id = game.PlaceId

for url, ids in pairs(getgenv().Games) do
    for _, gameId in ipairs(ids) do
        if id == gameId then
            loadstring(game:HttpGet(url))()
            return
        end
    end
end
