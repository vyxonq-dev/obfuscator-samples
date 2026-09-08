local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/NICKISBAD/Nick-s-Modded-KAVO-Lib/main/Nick'sModdedKavoLib.lua"))()


function Script()
    local Window = Library.CreateLib("Brookhaven Skin Gui 3.0 BETA", "DarkTheme")



    local Main = Window:NewTab("Skins")
    local MainSection = Main:NewSection("Skins BETA")


    -- Script

    MainSection:NewSlider("Walkspeed", "Escoge tu velocidad", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
    end)

    MainSection:NewSlider("JumpPower", "Escoge tu poder de salto", 250, 16, function(s) -- 500 (MaxValue) | 0 (MinValue)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
    end)

    MainSection:NewButton("Skin semi invisible", "Te vuelves una mosca", function()
        loadstring(game:HttpGet(('https://pastefy.app/694P0Wfx/raw'),true))()
    end)

    MainSection:NewButton("Headless", "Obtienes la headless", function()
        loadstring(game:HttpGet(('https://pastefy.app/NitTkga9/raw'),true))()
    end)

    MainSection:NewButton("Mini avatar", "Mini avatar", function()
        loadstring(game:HttpGet(('https://pastefy.app/5Yz3IIck/raw'),true))()
    end)

    MainSection:NewButton("Golem", "Te vuelves un golem", function()
        loadstring(game:HttpGet(('https://pastefy.app/fdmvPgmw/raw'),true))()
    end)
    
    -- Animaciones


    local Main = Window:NewTab("Animaciones")
    local MainSection = Main:NewSection("Animaciones BETA")


    -- Script

    MainSection:NewButton("Adidas Quieto", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/D07UsNDg/raw'),true))()
    end)

    MainSection:NewButton("Adidas Correr", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/XSVHeNMt/raw'),true))()
    end)

    MainSection:NewButton("Adidas Saltar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/CUNgAnXF/raw'),true))()
    end)

    MainSection:NewButton("Adidas Caer", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/PON2TqWX/raw'),true))()
    end)
    
    MainSection:NewButton("Adidas Nadar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/IEbHtEr0/raw'),true))()
    end)

    MainSection:NewButton("Adidas Caminar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/SUTjg2LU/raw'),true))()
    end)

    MainSection:NewButton("Adidas Escalar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/Q3hjFLOV/raw'),true))()
    end)

    MainSection:NewButton("NFL Quieto", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/nm5BkvS9/raw'),true))()
    end)

    MainSection:NewButton("NFL Correr", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/HzY1nblR/raw'),true))()
    end)

    MainSection:NewButton("NFL Saltar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/gy2xfOxe/raw'),true))()
    end)

    MainSection:NewButton("NFL Caer", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/kHaNKXY0/raw'),true))()
    end)
    
    MainSection:NewButton("NFL Nadar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/Nb44913l/raw'),true))()
    end)

    MainSection:NewButton("NFL Caminar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/a1CG1zbA/raw'),true))()
    end)

    MainSection:NewButton("NFL Escalar", "Una animacion", function()
        loadstring(game:HttpGet(('https://pastefy.app/Zm6T6Kx7/raw'),true))()
    end)



     local Main = Window:NewTab("R6")
    local MainSection = Main:NewSection("R6")



--Script

    MainSection:NewButton("Cuerpo R6", "Un Cuerpo R6", function()
        loadstring(game:HttpGet(('https://pastefy.app/dbxrFdrb/raw'),true))()
    end)

    

     local Main = Window:NewTab("Accesorios")
    local MainSection = Main:NewSection("Accesorios para el personaje semi invisible")


    
--Script

    MainSection:NewButton("Gato Gordito", "Un Gatito", function()
        loadstring(game:HttpGet(('https://pastefy.app/DFR5hKhx/raw'),true))()
    end)

    MainSection:NewButton("Perrito con un carrito de compras", "Un Perrito", function()
        loadstring(game:HttpGet(('https://pastefy.app/OXOb7lQW/raw'),true))()
    end)
    
    MainSection:NewButton("Carro de calabaza", "Un Auto Calabaza", function()
        loadstring(game:HttpGet(('https://pastefy.app/cbomerwG/raw'),true))()
    end)
    
    MainSection:NewButton("Cortadora de cesped", "Una cortadora de cesped", function()
        loadstring(game:HttpGet(('https://pastefy.app/LIplTOWH/raw'),true))()
    end)

    MainSection:NewButton("Toyota bus", "Un bus de Toyota", function()
        loadstring(game:HttpGet(('https://pastefy.app/MqXP7cZf/raw'),true))()
    end)
    
    MainSection:NewButton("Coche clasico", "The clasic", function()
        loadstring(game:HttpGet(('https://pastefy.app/IaDUeXKD/raw'),true))()
    end)

    
end

if game.PlaceId == 4924922222 then
    Script()
end