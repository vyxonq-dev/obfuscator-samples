local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Animal simülatör script by xxxHub 🇹🇷",
    LoadingTitle = "Yükleniyor...",
    LoadingSubtitle = "xxxHub GUI 🇹🇷",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "xxxHubConfig",
        FileName = "AnimalSimData"
    },
    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = false
    },
    KeySystem = false
})

local PlayerTab = Window:CreateTab("👤 PLAYER", 4483362458)
local ExpoTab = Window:CreateTab("✨ EXPO", 4483362458)
local FarmTab = Window:CreateTab("🌾 FARM", 4483362458)-- F4RM SEKME: Coin Farm Başlat/Durdur
local coinFarming = false
FarmTab:CreateToggle({
    Name = "Coin Farm 💰",
    CurrentValue = false,
    Flag = "CoinFarm",
    Callback = function(Value)
        coinFarming = Value
        while coinFarming do
            game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()
            task.wait(0.1)
        end
    end
})

-- FARM SEKME: NPC Kill Farm Başlat/Durdur
local npcFarming = false
FarmTab:CreateToggle({
    Name = "NPC KİLL FARM ☠️",
    CurrentValue = false,
    Flag = "NpcFarm",
    Callback = function(Value)
        npcFarming = Value
        while npcFarming do
            local event = game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli

            local targets = {
                workspace.NPC.DragonGiraffe.Humanoid,
                workspace.NPC.LavaGorilla.Humanoid,
                workspace.NPC.CENTAUR.Humanoid
            }

            for _, target in ipairs(targets) do
                local args = { [1] = target, [2] = 1 }
                event:FireServer(unpack(args))
            end

            task.wait(0.1)
        end
    end
})

-- FARM SEKME: Dummy Farm Teleport Butonu
FarmTab:CreateButton({
    Name = "Dummy farm 📦",
    Callback = function()
        local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            hrp.CFrame = CFrame.new(-77.65, 593.79, 809.60)
        end
    end
})-- PLAYER SEKME: NAME PLAYER SPAM Başlat/Durdur
local nameSpamActive = false
PlayerTab:CreateToggle({
    Name = "NAME PLAYER SPAM 🧠",
    CurrentValue = false,
    Flag = "NameSpam",
    Callback = function(Value)
        nameSpamActive = Value
        while nameSpamActive do
            local args1 = { [1] = "XXXHUB", [2] = "player" }
            game:GetService("ReplicatedStorage").Events.nameEvent:FireServer(unpack(args1))

            local args2 = { [1] = "XXXHUB BEST", [2] = "player" }
            game:GetService("ReplicatedStorage").Events.nameEvent:FireServer(unpack(args2))

            task.wait(0.1)
        end
    end
})

-- PLAYER SEKME: Pet Spam Başlat/Durdur
local petSpamActive = false
PlayerTab:CreateToggle({
    Name = "Pet spam 🐾",
    CurrentValue = false,
    Flag = "PetSpam",
    Callback = function(Value)
        petSpamActive = Value
        while petSpamActive do
            local args1 = { [1] = "baby_elephant", [2] = "elephant11" }
            game:GetService("ReplicatedStorage").Events.PetEvent:FireServer(unpack(args1))

            local args2 = { [1] = "baby_wolf", [2] = "baby_wolf14" }
            game:GetService("ReplicatedStorage").Events.PetEvent:FireServer(unpack(args2))

            task.wait(0.1)
        end
    end
})-- PLAYER SEKME: Kill Aura Başlat/Durdur
local killAuraActive = false
PlayerTab:CreateToggle({
    Name = "Kill Aura ⚔️",
    CurrentValue = false,
    Flag = "KillAura",
    Callback = function(Value)
        killAuraActive = Value
        while killAuraActive do
            local lp = game.Players.LocalPlayer
            local nearest = nil
            local shortest = math.huge

            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= lp and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                    local distance = (lp.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).Magnitude
                    if distance < shortest then
                        shortest = distance
                        nearest = plr
                    end
                end
            end

            if nearest and nearest.Character and nearest.Character:FindFirstChild("Humanoid") then
                local args = {
                    [1] = nearest.Character.Humanoid,
                    [2] = 5
                }
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args))
            end
            task.wait(0.1)
        end
    end
})

-- PLAYER SEKME: Clan Spam Nuke Başlat/Durdur
local clanSpamActive = false
PlayerTab:CreateToggle({
    Name = "CLAN SPAM NUKE 💣",
    CurrentValue = false,
    Flag = "ClanSpam",
    Callback = function(Value)
        clanSpamActive = Value

        while clanSpamActive do
            -- Clan oluştur
            local args = {
                [1] = {
                    ["clanToCreate"] = "XXXHUB 🗹🗷",
                    ["action"] = "create_clan",
                    ["ClanIcon"] = "107021325188504"
                }
            }
            game:GetService("ReplicatedStorage").Events.ClanEvent:FireServer(unpack(args))

            -- Tüm oyuncuları davet et
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= game.Players.LocalPlayer then
                    local inviteArgs = {
                        [1] = {
                            ["action"] = "invite_clan",
                            ["oplr"] = plr
                        }
                    }
                    game:GetService("ReplicatedStorage").invitationEvent:FireServer(unpack(inviteArgs))
                    task.wait(0.1)
                end
            end

            task.wait(0.1)
        end
    end
})-- PLAYER SEKME: KILL ALL Başlat/Durdur
local killAllActive = false
PlayerTab:CreateToggle({
    Name = "KILL ALL 🔪",
    CurrentValue = false,
    Flag = "KillAll",
    Callback = function(Value)
        killAllActive = Value

        local lp = game.Players.LocalPlayer
        local attacked = {}

        while killAllActive do
            for _, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= lp and plr.Character and plr.Character:FindFirstChild("Humanoid") and not attacked[plr.Name] then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        lp.Character:WaitForChild("HumanoidRootPart").CFrame = hrp.CFrame + Vector3.new(0, 2, 0)

                        local args = {
                            [1] = plr.Character.Humanoid,
                            [2] = 1
                        }
                        game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(unpack(args))

                        attacked[plr.Name] = true
                        task.wait(0.1)
                    end
                end
            end
            attacked = {} -- sıfırla ve yeniden sırayla dene
            task.wait(0.1)
        end
    end
})

-- PLAYER SEKME: Glich Dance Başlat/Durdur
local danceLoop = false
PlayerTab:CreateToggle({
    Name = "Glich Dance 💃",
    CurrentValue = false,
    Flag = "GlichDance",
    Callback = function(Value)
        danceLoop = Value
        while danceLoop do
            local args = {
                [1] = "play",
                [2] = "rbxassetid://11951224867"
            }
            game:GetService("ReplicatedStorage").Events.DanceEvent:FireServer(unpack(args))
            task.wait(0.1)
        end
    end
})-- EXPO SEKME: Sword Menü açan buton
ExpoTab:CreateButton({
    Name = "Sword Menü ⚔️",
    Callback = function()
        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "SwordMenu"
        gui.ResetOnSpawn = false

        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0, 250, 0, 240)
        frame.Position = UDim2.new(0.5, -125, 0.5, -120)
        frame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true

        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 2

        local function createSwordButton(name, posY, id)
            local button = Instance.new("TextButton", frame)
            button.Size = UDim2.new(0, 200, 0, 40)
            button.Position = UDim2.new(0, 25, 0, posY)
            button.Text = name
            button.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.Font = Enum.Font.GothamBold
            button.TextSize = 20

            button.MouseButton1Click:Connect(function()
                local args = { [1] = id }
                game:GetService("ReplicatedStorage").Events.WeaponEvent:FireServer(unpack(args))
            end)
        end

        createSwordButton("Sword 1", 10, "SSSS1")
        createSwordButton("Sword 2", 60, "SSSS2")
        createSwordButton("Sword 3", 110, "SSSSSSS4")
        createSwordButton("Sword 4", 160, "SSSSSSS2")
    end
})-- EXPO SEKME: FE Lightning Ball Tool Butonu
ExpoTab:CreateButton({
    Name = "Fe Lightning Ball ⚡",
    Callback = function()
        local tool = Instance.new("Tool")
        tool.Name = "Lightning ball"
        tool.RequiresHandle = false
        tool.Parent = game.Players.LocalPlayer.Backpack

        tool.Activated:Connect(function()
            local mouse = game.Players.LocalPlayer:GetMouse()
            local pos = mouse.Hit.Position
            local args = {
                [1] = pos,
                [2] = "NewLightningball"
            }
            game:GetService("ReplicatedStorage").SkillsInRS.RemoteEvent:FireServer(unpack(args))
        end)
    end
})

-- EXPO SEKME: Audio Menü Açan Buton
ExpoTab:CreateButton({
    Name = "Audio Menü 🎵",
    Callback = function()
        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "AudioBypass"
        gui.ResetOnSpawn = false

        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0, 300, 0, 260)
        frame.Position = UDim2.new(0.75, -150, 0.5, -130)
        frame.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.Draggable = true

        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 2

        local function createAudioButton(name, posY, id)
            local button = Instance.new("TextButton", frame)
            button.Size = UDim2.new(0, 260, 0, 40)
            button.Position = UDim2.new(0, 20, 0, posY)
            button.Text = name
            button.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
            button.TextColor3 = Color3.fromRGB(0, 0, 0)
            button.Font = Enum.Font.GothamBold
            button.TextSize = 18

            button.MouseButton1Click:Connect(function()
                local args = {
                    [1] = id
                }
                game:GetService("ReplicatedStorage").Events.PLAYEvent:FireServer(unpack(args))
            end)
        end

        createAudioButton("Turkish Küfür 🤬", 10, "3019767298")
        createAudioButton("BAKAA PLAY 🔊", 60, "6470733039")
        createAudioButton("Play Funk 🎷", 110, "103522488156551")

        -- Input ve Buton
        local textBox = Instance.new("TextBox", frame)
        textBox.Size = UDim2.new(0, 200, 0, 35)
        textBox.Position = UDim2.new(0, 20, 0, 170)
        textBox.PlaceholderText = "Audio ID yaz..."
        textBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        textBox.TextColor3 = Color3.fromRGB(0, 0, 0)
        textBox.Font = Enum.Font.Gotham
        textBox.TextSize = 18

        local playBtn = Instance.new("TextButton", frame)
        playBtn.Size = UDim2.new(0, 60, 0, 35)
        playBtn.Position = UDim2.new(0, 230, 0, 170)
        playBtn.Text = "PLAY"
        playBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 0)
        playBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        playBtn.Font = Enum.Font.GothamBold
        playBtn.TextSize = 16

        playBtn.MouseButton1Click:Connect(function()
            local id = textBox.Text
            if id and id ~= "" then
                local args = {
                    [1] = id
                }
                game:GetService("ReplicatedStorage").Events.PLAYEvent:FireServer(unpack(args))
            end
        end)
    end
})
