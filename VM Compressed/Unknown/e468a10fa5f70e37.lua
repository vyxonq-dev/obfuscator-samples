-- Cargar la librería Faris
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/library",true))()

-- Crear la ventana
local tab = library:CreateWindow("FarisLegend")

-- Crear carpeta
local folder = tab:AddFolder("Main")

-- Agregar TextBox para Studs hacia arriba
folder:AddBox({
    text = "Studs 1-999",
    flag = "studs_up",
    callback = function(value)
        local studs = tonumber(value)
        if studs and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
            hrp.CFrame = hrp.CFrame + Vector3.new(0, studs, 0)
        end
    end
})

-- Inicializar la GUI
library:Init()
