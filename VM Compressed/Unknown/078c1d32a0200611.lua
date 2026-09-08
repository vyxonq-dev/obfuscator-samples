repeat task.wait() until game:IsLoaded()

pcall(function()
    if isfolder("WindUI") then
        delfolder("WindUI")
    end
end)

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/refs/heads/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "YY HUB ð v1.1",
    Author = "by YY | Escape Tsunami",
    Folder = "YYHUB",
    Icon = "crown"
})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local upgradeBaseEnabled = false
local upgradeSpeedEnabled = false
local collectMoneyEnabled = false
local autoRebirthEnabled = false

local UpgradeBase = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeBase")
local UpgradeSpeed = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("UpgradeSpeed")
local CollectMoney = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("CollectMoney")
local Rebirth = ReplicatedStorage:WaitForChild("RemoteFunctions"):WaitForChild("Rebirth")

local MainTab = Window:Tab({Title = "MAIN / ÐÐÐÐÐÐÐ", Icon = "zap"})

local upgradeSec = MainTab:Section({Title = "UPGRADES / Ð£ÐÐ£Ð§Ð¨ÐÐÐÐ¯"})

upgradeSec:Toggle({
    Title = "â¡ UPGRADE BASE / Ð£ÐÐ£Ð§Ð¨ÐÐÐÐ ÐÐÐÐ«",
    Description = "ÐÐ²ÑÐ¾Ð¼Ð°ÑÐ¸ÑÐµÑÐºÐ¸ ÑÐ»ÑÑÑÐ°ÐµÑ Ð±Ð°Ð·Ñ ÐºÐ°Ð¶Ð´ÑÐµ 0.5 ÑÐµÐºÑÐ½Ð´",
    Default = false,
    Callback = function(state)
        upgradeBaseEnabled = state
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = state and "Ð£Ð»ÑÑÑÐµÐ½Ð¸Ðµ Ð±Ð°Ð·Ñ ÐÐÐ / Upgrade base ON" 
                    or "Ð£Ð»ÑÑÑÐµÐ½Ð¸Ðµ Ð±Ð°Ð·Ñ ÐÐ«ÐÐ / Upgrade base OFF", 
            Duration = 4
        })
    end
})

upgradeSec:Toggle({
    Title = "ð UPGRADE SPEED / Ð£ÐÐ£Ð§Ð¨ÐÐÐÐ Ð¡ÐÐÐ ÐÐ¡Ð¢Ð",
    Description = "ÐÐ²ÑÐ¾Ð¼Ð°ÑÐ¸ÑÐµÑÐºÐ¸ ÑÐ»ÑÑÑÐ°ÐµÑ ÑÐºÐ¾ÑÐ¾ÑÑÑ (ÑÑÐ¾Ð²ÐµÐ½Ñ 10) ÐºÐ°Ð¶Ð´ÑÐµ 0.5 ÑÐµÐºÑÐ½Ð´",
    Default = false,
    Callback = function(state)
        upgradeSpeedEnabled = state
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = state and "Ð£Ð»ÑÑÑÐµÐ½Ð¸Ðµ ÑÐºÐ¾ÑÐ¾ÑÑÐ¸ ÐÐÐ / Upgrade speed ON" 
                    or "Ð£Ð»ÑÑÑÐµÐ½Ð¸Ðµ ÑÐºÐ¾ÑÐ¾ÑÑÐ¸ ÐÐ«ÐÐ / Upgrade speed OFF", 
            Duration = 4
        })
    end
})

upgradeSec:Toggle({
    Title = "ð AUTO REBIRTH / ÐÐÐ¢Ð Ð ÐÐÐÐ¢",
    Description = "ÐÐ²ÑÐ¾Ð¼Ð°ÑÐ¸ÑÐµÑÐºÐ¸ Ð´ÐµÐ»Ð°ÐµÑ ÑÐµÐ±Ð¸Ñ ÐºÐ°Ð¶Ð´ÑÐµ 0.5 ÑÐµÐºÑÐ½Ð´",
    Default = false,
    Callback = function(state)
        autoRebirthEnabled = state
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = state and "ÐÐ²ÑÐ¾ ÑÐµÐ±Ð¸Ñ ÐÐÐ / Auto rebirth ON" 
                    or "ÐÐ²ÑÐ¾ ÑÐµÐ±Ð¸Ñ ÐÐ«ÐÐ / Auto rebirth OFF", 
            Duration = 4
        })
    end
})

local utilSec = MainTab:Section({Title = "UTILITIES / Ð£Ð¢ÐÐÐÐ¢Ð«"})

utilSec:Toggle({
    Title = "ð° AUTO COLLECT MONEY / ÐÐÐ¢Ð Ð¡ÐÐÐ  ÐÐÐÐÐ",
    Description = "ÐÐ²ÑÐ¾Ð¼Ð°ÑÐ¸ÑÐµÑÐºÐ¸ ÑÐ¾Ð±Ð¸ÑÐ°ÐµÑ Ð´ÐµÐ½ÑÐ³Ð¸ ÑÐ¾ ÑÐ»Ð¾ÑÐ¾Ð² 1-30 ÐºÐ°Ð¶Ð´ÑÐµ 0.1 ÑÐµÐºÑÐ½Ð´",
    Default = false,
    Callback = function(state)
        collectMoneyEnabled = state
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = state and "ÐÐ²ÑÐ¾ ÑÐ±Ð¾Ñ Ð´ÐµÐ½ÐµÐ³ ÐÐÐ / Auto collect money ON" 
                    or "ÐÐ²ÑÐ¾ ÑÐ±Ð¾Ñ Ð´ÐµÐ½ÐµÐ³ ÐÐ«ÐÐ / Auto collect money OFF", 
            Duration = 4
        })
    end
})

utilSec:Button({
    Title = "ð DELETE TSUNAMIS / Ð£ÐÐÐÐÐ¢Ð¬ Ð¦Ð£ÐÐÐÐ",
    Description = "ÐÐ°Ð¶Ð¼Ð¸ÑÐµ ÑÑÐ¾Ð±Ñ ÑÐ´Ð°Ð»Ð¸ÑÑ Ð²ÑÐµ ÑÑÐ½Ð°Ð¼Ð¸ (Ð±ÐµÐ· Ð²Ð¾Ð·Ð²ÑÐ°ÑÐ°)",
    Color = Color3.fromRGB(255, 50, 50),
    Callback = function()
        local tsunamis = Workspace:FindFirstChild("ActiveTsunamis")
        if tsunamis then
            for _, child in ipairs(tsunamis:GetChildren()) do
                child:Destroy()
            end
            tsunamis:Destroy()
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "ÐÑÐµ ÑÑÐ½Ð°Ð¼Ð¸ ÑÐ´Ð°Ð»ÐµÐ½Ñ / All tsunamis deleted", 
                Duration = 4
            })
        end
    end
})

utilSec:Button({
    Title = "ðª UNLOCK VIP DOORS / ÐÐ¢ÐÐ Ð«Ð¢Ð¬ VIP ÐÐÐÐ Ð",
    Description = "Ð£Ð´Ð°Ð»ÑÐµÑ VIP ÑÑÐµÐ½Ñ Ð¸ Ð¾ÑÐºÑÑÐ²Ð°ÐµÑ Ð´Ð¾ÑÑÑÐ¿",
    Color = Color3.fromRGB(0, 200, 100),
    Callback = function()
        local vipWalls = Workspace:FindFirstChild("VIPWalls")
        if vipWalls then
            vipWalls:Destroy()
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "VIP Ð´Ð²ÐµÑÐ¸ Ð¾ÑÐºÑÑÑÑ / VIP doors unlocked", 
                Duration = 4
            })
        end
    end
})

utilSec:Button({
    Title = "ð  TP BASE / Ð¢ÐÐÐÐÐÐ Ð¢ ÐÐÐÐ",
    Description = "Ð¢ÐµÐ»ÐµÐ¿Ð¾ÑÑÐ¸ÑÑÐµÑ Ð½Ð° ÐºÑÑÑÑ SpeedShop",
    Color = Color3.fromRGB(150, 100, 255),
    Callback = function()
        local speedShop = Workspace:FindFirstChild("SpeedShop")
        if speedShop then
            local roof = speedShop:FindFirstChild("Roof")
            if roof then
                local character = LocalPlayer.Character
                if character then
                    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                    if humanoidRootPart then
                        humanoidRootPart.CFrame = CFrame.new(roof.Position + Vector3.new(0, 5, 0))
                        WindUI:Notify({
                            Title = "YY HUB v1.1 ð", 
                            Content = "Ð¢ÐµÐ»ÐµÐ¿Ð¾ÑÑÐ¸ÑÐ¾Ð²Ð°Ð½ Ð½Ð° Ð±Ð°Ð·Ñ / Teleported to base", 
                            Duration = 4
                        })
                    end
                end
            end
        end
    end
})

utilSec:Button({
    Title = "ð° MULTI JUMP / ÐÐ£ÐÐ¬Ð¢Ð-ÐÐ Ð«ÐÐÐ",
    Description = "ÐÐ°Ð³ÑÑÐ¶Ð°ÐµÑ Ð¼ÑÐ»ÑÑÐ¸-Ð¿ÑÑÐ¶Ð¾Ðº",
    Color = Color3.fromRGB(100, 200, 255),
    Callback = function()
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = "ÐÐ°Ð³ÑÑÐ·ÐºÐ° Multi Jump... / Loading Multi Jump...", 
            Duration = 3
        })
        
        local success, error = pcall(function()
            local UserInputService = game:GetService("UserInputService")
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            
            local maxJumps = 10
            local currentJumps = 0
            local canJump = true
            
            local function onJumpRequest()
                if canJump and currentJumps < maxJumps and LocalPlayer.Character then
                    local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                    if humanoid and humanoid:GetState() == Enum.HumanoidStateType.Freefall then
                        humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                        currentJumps = currentJumps + 1
                        canJump = false
                        task.wait(0.1)
                        canJump = true
                    end
                end
            end
            
            UserInputService.JumpRequest:Connect(onJumpRequest)
            
            if LocalPlayer.Character then
                LocalPlayer.Character:WaitForChild("Humanoid").StateChanged:Connect(function(oldState, newState)
                    if newState == Enum.HumanoidStateType.Landed then
                        currentJumps = 0
                    end
                end)
            end
            
            LocalPlayer.CharacterAdded:Connect(function(character)
                character:WaitForChild("Humanoid").StateChanged:Connect(function(oldState, newState)
                    if newState == Enum.HumanoidStateType.Landed then
                        currentJumps = 0
                    end
                end)
            end)
            
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "Multi Jump Ð°ÐºÑÐ¸Ð²Ð¸ÑÐ¾Ð²Ð°Ð½! / Multi Jump activated!", 
                Duration = 4
            })
        end)
        
        if success then
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "Multi Jump Ð·Ð°Ð³ÑÑÐ¶ÐµÐ½ ÑÑÐ¿ÐµÑÐ½Ð¾! / Multi Jump loaded successfully!", 
                Duration = 5
            })
        end
    end
})

utilSec:Button({
    Title = "ð® EASY MODE / ÐÐÐÐÐÐ Ð ÐÐÐÐ",
    Description = "Ð¡Ð¾Ð·Ð´Ð°ÐµÑ Ð±Ð¾Ð»ÑÑÑÑ Ð¿Ð»Ð°ÑÑÐ¾ÑÐ¼Ñ Ð¸ ÑÐ´Ð°Ð»ÑÐµÑ ÑÑÐ½Ð°Ð¼Ð¸",
    Color = Color3.fromRGB(100, 255, 100),
    Callback = function()
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = "ÐÐºÑÐ¸Ð²Ð°ÑÐ¸Ñ Easy Mode... / Activating Easy Mode...", 
            Duration = 3
        })
        
        local success, error = pcall(function()
            local floors = Workspace:FindFirstChild("Floors")
            if floors then
                local mythical = floors:FindFirstChild("Mythical")
                if mythical then
                    mythical.Size = Vector3.new(2048, 7, 694.20)
                end
            end
            
            local tsunamis = Workspace:FindFirstChild("ActiveTsunamis")
            if tsunamis then
                tsunamis:Destroy()
            end
            
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "Easy Mode Ð°ÐºÑÐ¸Ð²Ð¸ÑÐ¾Ð²Ð°Ð½! / Easy Mode activated!", 
                Duration = 5
            })
        end)
        
        if not success then
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "ÐÑÐ¸Ð±ÐºÐ° Ð°ÐºÑÐ¸Ð²Ð°ÑÐ¸Ð¸ Easy Mode / Error activating Easy Mode", 
                Duration = 5
            })
        end
    end
})

local AdminTab = Window:Tab({Title = "ADMIN PANEL / ÐÐÐÐÐ ÐÐÐÐÐÐ¬", Icon = "shield"})

local adminSec = AdminTab:Section({Title = "ADMIN COMMANDS / ÐÐÐÐÐ ÐÐÐÐÐÐÐ«"})

adminSec:Button({
    Title = "â¡ INFINITE YIELD / ÐÐÐ¤ÐÐÐÐ¢ ÐÐÐÐ",
    Description = "ÐÐ°Ð³ÑÑÐ¶Ð°ÐµÑ Infinite Yield Admin Commands",
    Color = Color3.fromRGB(255, 100, 100),
    Callback = function()
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = "ÐÐ°Ð³ÑÑÐ·ÐºÐ° Infinite Yield... / Loading Infinite Yield...", 
            Duration = 3
        })
        
        local success, error = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
        
        if success then
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "Infinite Yield ÑÑÐ¿ÐµÑÐ½Ð¾ Ð·Ð°Ð¿ÑÑÐµÐ½! / Infinite Yield launched successfully!", 
                Duration = 6
            })
        end
    end
})

adminSec:Button({
    Title = "ð DEX EXPLORER / ÐÐÐÐ¡ Ð­ÐÐ¡ÐÐÐÐ ÐÐ ",
    Description = "ÐÐ°Ð³ÑÑÐ¶Ð°ÐµÑ Dex Explorer Ð´Ð»Ñ Ð°Ð½Ð°Ð»Ð¸Ð·Ð° Ð¸Ð³ÑÑ",
    Color = Color3.fromRGB(255, 150, 50),
    Callback = function()
        WindUI:Notify({
            Title = "YY HUB v1.1 ð", 
            Content = "ÐÐ°Ð³ÑÑÐ·ÐºÐ° Dex Explorer... / Loading Dex Explorer...", 
            Duration = 3
        })
        
        local success, error = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
        end)
        
        if success then
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "Dex Explorer ÑÑÐ¿ÐµÑÐ½Ð¾ Ð·Ð°Ð¿ÑÑÐµÐ½! / Dex Explorer launched successfully!", 
                Duration = 5
            })
        end
    end
})

local SupportTab = Window:Tab({Title = "SUPPORT / ÐÐÐÐÐÐ ÐÐÐ", Icon = "message-square"})

local supSec = SupportTab:Section({Title = "CONTACT / Ð¡ÐÐ¯ÐÐÐ¢Ð¬Ð¡Ð¯"})

supSec:Button({
    Title = "ð± TELEGRAM @BOSSKlNG",
    Icon = "send",
    Color = Color3.fromRGB(0,150,255),
    Callback = function()
        if setclipboard then
            setclipboard("@BOSSKlNG")
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "Ð¢ÐµÐ»ÐµÐ³ÑÐ°Ð¼ ÑÐºÐ¾Ð¿Ð¸ÑÐ¾Ð²Ð°Ð½ / Telegram copied", 
                Duration = 4
            })
        end
    end
})

supSec:Button({
    Title = "ð SUPPORT THE AUTHOR / ÐÐÐÐÐÐ ÐÐÐ¢Ð¬ ÐÐÐ¢ÐÐ Ð",
    Icon = "heart",
    Color = Color3.fromRGB(255, 50, 150),
    Callback = function()
        if setclipboard then
            setclipboard("https://go.linkify.ru/2F7S")
            WindUI:Notify({
                Title = "YY HUB v1.1 ð", 
                Content = "Ð¡ÑÑÐ»ÐºÐ° Ð´Ð»Ñ Ð¿Ð¾Ð´Ð´ÐµÑÐ¶ÐºÐ¸ ÑÐºÐ¾Ð¿Ð¸ÑÐ¾Ð²Ð°Ð½Ð° / Support link copied", 
                Duration = 4
            })
        end
    end
})

spawn(function()
    while task.wait(0.5) do
        if upgradeBaseEnabled then
            pcall(function()
                UpgradeBase:InvokeServer()
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.5) do
        if upgradeSpeedEnabled then
            pcall(function()
                UpgradeSpeed:InvokeServer(10)
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.5) do
        if autoRebirthEnabled then
            pcall(function()
                Rebirth:InvokeServer()
            end)
        end
    end
end)

spawn(function()
    while task.wait(0.1) do
        if collectMoneyEnabled then
            pcall(function()
                for slot = 1, 30 do
                    CollectMoney:FireServer("Slot" .. slot)
                    task.wait(0.01)
                end
            end)
        end
    end
end)

WindUI:Notify({
    Title = "YY HUB v1.1 ð", 
    Content = "Ð¥Ð°Ð± Ð·Ð°Ð³ÑÑÐ¶ÐµÐ½ ÑÑÐ¿ÐµÑÐ½Ð¾! ÐÐµÑÑÐ¸Ñ 1.1 / Hub loaded successfully! Version 1.1", 
    Duration = 6
})