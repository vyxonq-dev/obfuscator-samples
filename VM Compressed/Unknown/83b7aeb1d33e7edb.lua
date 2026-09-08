-- Cargar la librería Faris
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/liebertsx/Tora-Library/main/src/library", true))()

-- Utilidades
local char = string.char
local rs = game:GetService(char(82,101,112,108,105,99,97,116,101,100,83,116,111,114,97,103,101)) -- "ReplicatedStorage"
local task_wait = getfenv()[char(116,97,115,107)].wait -- task.wait

-- Crear ventana (tab)
local window = library:CreateWindow(char(70,97,114,105,115,108,101,103,101,110,100)) -- "Farislegend"
local folder = window:AddFolder(char(70,97,114,109)) -- "Farm"

-- Botón: Get Best Pet
folder:AddButton({
    text = char(71,101,116,32,66,101,115,116,32,80,101,116), -- "Get Best Pet"
    callback = function()
        local remote = rs:FindFirstChild(char(82,95,80,101,116,115)) -- "R_Pets"
        if remote then
            remote:FireServer(
                char(71,105,118,101,95,80,101,116), -- "Give_Pet"
                char(80,101,116,95,72,111,110,101,121,95,77,117,116,97,110,116) -- "Pet_Honey_Mutant"
            )
        end
    end
})

-- Dropdown: seleccionar mapa
local selectedMap = char(77,97,112,95,49) -- "Map_1"
folder:AddList({
    text = char(83,101,108,101,99,116,32,77,97,112), -- "Select Map"
    values = {
        char(77,97,112,95,49), -- "Map_1"
        char(77,97,112,95,50), -- "Map_2"
        char(77,97,112,95,51)  -- "Map_3"
    },
    callback = function(val)
        selectedMap = val
    end,
    flag = char(109,97,112,95,115,101,108,101,99,116,111,114) -- "map_selector"
})

-- Toggle: auto coins
folder:AddToggle({
    text = char(65,117,116,111,32,67,111,105,110,115), -- "Auto Coins"
    flag = char(97,117,116,111,95,115,108,105,100,101,114,95,116,111,103,103,108,101), -- "auto_slider_toggle"
    callback = function(state)
        _G.autoSlider = state
        while _G.autoSlider do
            local maps = workspace:FindFirstChild(char(77,97,112,115)) -- "Maps"
            if maps then
                local map = maps:FindFirstChild(selectedMap)
                local remote = rs:FindFirstChild(char(82,95,83,101,114,118,101,114)) -- "R_Server"
                if map and remote then
                    pcall(function()
                        remote:FireServer(char(83,108,105,100,101), map) -- "Slide"
                    end)
                end
            end
            task_wait(0.5)
        end
    end
})

-- Inicializar GUI
library:Init()
