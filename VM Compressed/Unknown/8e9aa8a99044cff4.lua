-- Load Rayfield

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({

    Name = "Awakened Hub",

    LoadingTitle = "Loading Awakened...",

    LoadingSubtitle = "by eyrydyeyeegee",

    ConfigurationSaving = {Enabled = false}

})

-- ========== TAB AWAKENED ==========

local AwakenTab = Window:CreateTab("Awaken", 4483362470)

AwakenTab:CreateButton({

    Name = "Receber Awaken (Setar Awakened = true)",

    Callback = function()

        local player = game:GetService("Players").LocalPlayer

        local awakened = player:FindFirstChild("Awakened")

        if awakened and awakened:IsA("BoolValue") then

            awakened.Value = true

            Rayfield:Notify({Title="Awakened", Content="Você recebeu Awaken!", Duration=3})

        else

            Rayfield:Notify({Title="Erro", Content="Awakened não encontrado!", Duration=3})

        end

    end

})

AwakenTab:CreateButton({

    Name = "Remover Awaken (Setar Awakened = false)",

    Callback = function()

        local player = game:GetService("Players").LocalPlayer

        local awakened = player:FindFirstChild("Awakened")

        if awakened and awakened:IsA("BoolValue") then

            awakened.Value = false

            Rayfield:Notify({Title="Awakened", Content="Awaken removido!", Duration=3})

        else

            Rayfield:Notify({Title="Erro", Content="Awakened não encontrado!", Duration=3})

        end

    end

})

AwakenTab:CreateToggle({

    Name = "Awaken Sempre Ativo (Loop)",

    CurrentValue = false,

    Callback = function(state)

        getgenv().AwakenLoop = state

        if state then

            Rayfield:Notify({Title="Awakened", Content="Awaken Sempre Ativo!", Duration=3})

            spawn(function()

                while getgenv().AwakenLoop do

                    local player = game:GetService("Players").LocalPlayer

                    local awakened = player:FindFirstChild("Awakened")

                    if awakened and awakened:IsA("BoolValue") then

                        awakened.Value = true

                    end

                    task.wait(0.2)

                end

            end)

        else

            Rayfield:Notify({Title="Awakened", Content="Loop desativado!", Duration=3})

        end

    end

})

AwakenTab:CreateParagraph({

    Title = "Sobre",

    Content = "Pressione para receber Awaken, remover Awaken ou manter sempre ativo! Use apenas em jogos onde game:GetService('Players').LocalPlayer.Awakened existe e permite edição client-side."

})