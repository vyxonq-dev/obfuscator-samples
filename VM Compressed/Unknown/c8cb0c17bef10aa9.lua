-- Dark Hub - Rayfield Edition (3 Abas: Avatar, Free Gamepass, Ban)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Dark Hub",
    LoadingTitle = "Dark Hub Rayfield",
    LoadingSubtitle = "by darkizinho9910",
    ConfigurationSaving = {Enabled = false}
})

local player = game.Players.LocalPlayer
local Workspace = game:GetService("Workspace")

-- ABA AVATAR
local AvatarTab = Window:CreateTab("Avatar")

AvatarTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 200},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "WalkSpeed",
    Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end,
})

AvatarTab:CreateSlider({
    Name = "JumpPower",
    Range = {50, 300},
    Increment = 1,
    Suffix = "Jump",
    CurrentValue = 50,
    Flag = "JumpPower",
    Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = Value
        end
    end,
})

AvatarTab:CreateButton({
    Name = "Reset Character",
    Callback = function()
        player.Character:BreakJoints()
    end,
})

-- ABA FREE GAMEPASS
local FreeGamepassTab = Window:CreateTab("Free Gamepass")

FreeGamepassTab:CreateParagraph({Title = "Gamepass", Content = "Ativa todos os gamepasses automaticamente"})

FreeGamepassTab:CreateButton({
    Name = "Get Premium (All Gamepass)",
    Callback = function()
        local passes = {
            "Premium", "SWAT", "Criminal", "Firefighter",
            "VIP", "Star", "Music", "Estate", "Horse", "Helicopter"
        }
        for _, pass in pairs(passes) do
            if player:FindFirstChild("Gamepasses") then
                local gp = player.Gamepasses:FindFirstChild(pass)
                if gp then gp.Value = true end
            end
        end
        print("Todos os gamepasses foram ativados com sucesso.")
    end,
})

FreeGamepassTab:CreateButton({
    Name = "Spawn Carro Premium",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        if ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Ca1r") then
            ReplicatedStorage.RE["1Ca1r"]:FireServer("PickingCar", "RollsRoyce")
            print("Carro Premium Spawnado com sucesso.")
        end
    end,
})

-- ABA BAN
local BanTab = Window:CreateTab("Ban")

BanTab:CreateParagraph({
    Title = "Funções para você usar em você",
    Content = ""
})

BanTab:CreateButton({
    Name = "Remover Ban de Todas as Casas",
    Callback = function()
        local successCount = 0
        local failCount = 0
        for i = 1, 37 do
            local bannedBlockName = "BannedBlock" .. i
            local bannedBlock = Workspace:FindFirstChild(bannedBlockName, true)
            if bannedBlock then
                local success = pcall(function()
                    bannedBlock:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        for _, house in pairs(Workspace:GetDescendants()) do
            if house.Name:match("BannedBlock") then
                local success = pcall(function()
                    house:Destroy()
                end)
                if success then
                    successCount = successCount + 1
                else
                    failCount = failCount + 1
                end
            end
        end
        local StarterGui = game:GetService("StarterGui")
        if successCount > 0 then
            StarterGui:SetCore("SendNotification", {
                Title = "Sucesso",
                Text = "Bans removidos de " .. successCount .. " casas!",
                Duration = 5
            })
        elseif failCount > 0 then
            StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Falha ao remover bans de " .. failCount .. " casas.",
                Duration = 5
            })
        else
            StarterGui:SetCore("SendNotification", {
                Title = "Aviso",
                Text = "Nenhum ban encontrado para remover.",
                Duration = 5
            })
        end
    end
})

BanTab:CreateParagraph({
    Title = "to sem ideias para colocar aqui._.",
    Content = ""
})

Rayfield:LoadConfiguration()