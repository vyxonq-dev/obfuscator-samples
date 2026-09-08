
    if getgenv().ran then
    warn("[MoonHub] Already loaded, skipping re-execution")
    return
end

getgenv().ran = true

    loadstring(game:HttpGet("https://api.nexar.to/scripts/v1/gTiHWxrHDQdWX0aLGC5wi0rzQUrFnQ1x.lua"))()