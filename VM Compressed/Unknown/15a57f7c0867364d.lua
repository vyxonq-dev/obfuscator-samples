repeat task.wait() until game:IsLoaded()
local Scripts = {
    [8204913] = 'https://api.luarmor.net/files/v3/loaders/a14808b3e0f1fc95d6d12bcd1213db12.lua', -- UTD
    [14733518] = 'https://api.luarmor.net/files/v3/loaders/234aff7558979b30f95679b80652df00.lua', -- TDX
    [34990762] = 'https://api.luarmor.net/files/v3/loaders/453c91d69f95d4217cbdccd70fa6b2c8.lua', -- SBTD
    [35989084] = 'https://api.luarmor.net/files/v3/loaders/0fdf51b9ccac922f78d969ad91b797ee.lua', -- GARDEN TD

}   

loadstring(game:HttpGet(Scripts[game.CreatorId]))()
