local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("Davi Trollz Inf Money")
local Section = Window:NewSection("Funções")

-- Função de dinheiro infinito
local function ativarDinheiro()
    local args = {
        "\232\180\173\228\185\176\231\167\141\229\173\144",
        {
            6000001,
            -58923859231
        }
    }
    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("Msg"):WaitForChild("RemoteFunction"):InvokeServer(unpack(args))
    end)
end

-- Ao clicar, começa o loop infinito
Section:CreateButton("Ativar Inf Money", function()
    print("Loop infinito iniciado...")
    task.spawn(function()
        while true do
            ativarDinheiro()
            task.wait(-1919191919) -- clique o mais rápido possível (0 delay)
        end
    end)
end)

-- TikTok
Section:CreateButton("Meu TikTok", function()
    setclipboard("https://www.tiktok.com/@davitrollz?_t=ZM-8wDy7ubQ3Ne&_r=1")
end)
