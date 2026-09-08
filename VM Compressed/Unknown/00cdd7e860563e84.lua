local Games = {
    [96601927506261] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Dux%20Bee%20Script", -- Bee Rich
    [123900106804415] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Dux%20Hub%20mart%20simulator", -- Mart Simulator
    [81440632616906] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/%E2%9B%8F%EF%B8%8F%20Dig%20to%20Earth's%20CORE!%20Dux%20Hub", -- Dig to Earth's CORE!
    [96151237893653] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Dux%20Hub%20Brainrot%20Royale", -- Brainrot Royale
    [128811184] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Dam%20Tyccon%20Dux%20Hub", -- Dam Tycoon
    [96780658634427] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/BrainrotRestuarant%20Dux%20Hub", -- Brainrot Restaurant
    [115285389424252] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Rob%20The%20Mother%20Dux%20Hub", -- Rob The Mother
    [74971517386226] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Make%20a%20Brainrot%20Army%E2%9A%94%EF%B8%8F%5BHalloween%5D%20Dux%20Hub", -- Make a Brainrot Army [Halloween]
    [19002485340] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Mega%20Luxury%20Dux%20Hub", -- Mega Luxury Dux Hub
    [16632764973] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/chicken%20Gun%20Dux%20Hub", -- Chicken Gun Dux Hub
    [74465441576768] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Tower%20for%20Free%20Admin%20Dux%20Hub", -- Tower for Free Admin Dux Hub
    [118611268319028] = "https://raw.githubusercontent.com/xddejavu734-eng/DuxScript/main/Marge%20for%20speed%20Dux" -- Marge for Speed Dux Hub
}

-- Ejecutar automáticamente el script si existe
local currentGameId = game.PlaceId
local scriptUrl = Games[currentGameId]

if scriptUrl then
    print("Cargando script para PlaceId:", currentGameId)
    loadstring(game:HttpGet(scriptUrl))()
else
    print("No hay script disponible para este juego:", currentGameId)
end
