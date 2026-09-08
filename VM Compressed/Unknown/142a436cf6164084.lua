local scripts = {
    [15837460390] = "https://raw.githubusercontent.com/xyzAtanas/starheart-loader-test/refs/heads/main/enginedemo.lua",
    [101133806907079] = "https://raw.githubusercontent.com/xyzAtanas/starheart-loader-test/refs/heads/main/ticktockgardens.lua",
    [126574530776259] = "https://raw.githubusercontent.com/xyzAtanas/starheart-loader-test/refs/heads/main/twilightterminal.lua",
    [110541442509291] = "https://raw.githubusercontent.com/xyzAtanas/starheart-loader-test/refs/heads/main/abj.lua",
    [126418248369553] = "https://raw.githubusercontent.com/xyzAtanas/starheart-loader-test/refs/heads/main/oneplusmaceescape.lua",
    [92700582787930] = "https://raw.githubusercontent.com/xyzAtanas/starheart-loader-test/refs/heads/main/Megarampforslime.lua"
}

local fallbackUrl = "https://raw.githubusercontent.com/xyzAtanas/starheart-loader-test/refs/heads/main/others.lua"

local currentScript = scripts[game.PlaceId]

if currentScript then
    loadstring(game:HttpGet(currentScript))()
else
    loadstring(game:HttpGet(fallbackUrl))()
end
