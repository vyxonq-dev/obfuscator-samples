--[[
╭╮╱╱╭━━━┳━━━┳━━━╮╭╮╱╭┳╮╱╭┳━━╮
┃┃╱╱┃╭━━┫╭━╮┃╭━╮┃┃┃╱┃┃┃╱┃┃╭╮┃
┃┃╱╱┃╰━━┫┃╱┃┃╰━╯┃┃╰━╯┃┃╱┃┃╰╯╰╮
┃┃╱╭┫╭━━┫╰━╯┃╭╮╭╯┃╭━╮┃┃╱┃┃╭━╮┃
┃╰━╯┃╰━━┫╭━╮┃┃┃╰╮┃┃╱┃┃╰━╯┃╰━╯┃
╰━━━┻━━━┻╯╱╰┻╯╰━╯╰╯╱╰┻━━━┻━━━╯

>Made by Lear
>Credits Lear
>YouTube Lear
>Scirptblox Lear

]]





repeat wait() until game:IsLoaded() -- Oyun tam yüklenene kadar bekle

local TweenService = game:GetService("TweenService")

-- UI Animasyon modülünü yükle
local A = (loadstring(game:HttpGet("https://raw.githubusercontent.com/Emircxy/Lear/refs/heads/main/Ui%20Animation")))()

-- Kullanıcıya sözleşmeyi kabul ettiren pencere oluştur
A.create(
    "Welcome to Lear Hub",
    "By clicking Accept, I accept the contract, be careful.",
    "Accept",
    "Cancel",
    function(A)
        if A then
            -- UI bileşenlerini oluştur
            local ScreenGui = Instance.new("ScreenGui")
            local MainFrame = Instance.new("Frame")
            local UICorner = Instance.new("UICorner")
            local UIGradient = Instance.new("UIGradient")
            local Title = Instance.new("TextLabel")
            local Separator = Instance.new("Frame")
            local StatusText = Instance.new("TextLabel")
            local LoadingBarFrame = Instance.new("Frame")
            local LoadingBar = Instance.new("Frame")
            local LoadingText = Instance.new("TextLabel")

            -- Parent ayarları
            ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
            ScreenGui.ResetOnSpawn = false

            -- Ana çerçeve özellikleri
            MainFrame.Name = "MainFrame"
            MainFrame.Parent = ScreenGui
            MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0) -- Ortada başlat
            MainFrame.Size = UDim2.new(0, 350, 0, 200)
            MainFrame.BorderSizePixel = 0
            MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
            MainFrame.Visible = true -- GUI görünmez olma sorununu çözer

            -- UI köşe yuvarlama
            UICorner.CornerRadius = UDim.new(0, 15)
            UICorner.Parent = MainFrame

            -- Arka plan gradyanı
            UIGradient.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 50, 50)),
                ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 25, 25))
            })
            UIGradient.Rotation = 45
            UIGradient.Parent = MainFrame

            -- Başlık
            Title.Name = "Title"
            Title.Parent = MainFrame
            Title.BackgroundTransparency = 1
            Title.Position = UDim2.new(0, 0, 0, 30)
            Title.Size = UDim2.new(1, 0, 0, 40)
            Title.Font = Enum.Font.GothamBold
            Title.Text = "Lear Hub"
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 36

            -- Ayrım çizgisi
            Separator.Name = "Separator"
            Separator.Parent = MainFrame
            Separator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            Separator.Position = UDim2.new(0.25, 0, 0, 85)
            Separator.Size = UDim2.new(0.5, 0, 0, 2)
            Separator.BorderSizePixel = 0

            -- Yükleme çubuğu
            LoadingBarFrame.Name = "LoadingBarFrame"
            LoadingBarFrame.Parent = MainFrame
            LoadingBarFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            LoadingBarFrame.Position = UDim2.new(0.1, 0, 0.7, 0)
            LoadingBarFrame.Size = UDim2.new(0.8, 0, 0, 30)
            LoadingBarFrame.ClipsDescendants = true

            local UICornerLoading = Instance.new("UICorner")
            UICornerLoading.CornerRadius = UDim.new(0.4, 0)
            UICornerLoading.Parent = LoadingBarFrame

            LoadingBar.Name = "LoadingBar"
            LoadingBar.Parent = LoadingBarFrame
            LoadingBar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            LoadingBar.BorderSizePixel = 0
            LoadingBar.Size = UDim2.new(0, 0, 1, 0)

            local UICornerBar = Instance.new("UICorner")
            UICornerBar.CornerRadius = UDim.new(0.5, 0)
            UICornerBar.Parent = LoadingBar

            -- Yükleme metni
            LoadingText.Name = "LoadingText"
            LoadingText.Parent = LoadingBarFrame
            LoadingText.BackgroundTransparency = 1
            LoadingText.Size = UDim2.new(1, 0, 1, 0)
            LoadingText.Font = Enum.Font.GothamBold
            LoadingText.Text = "0%"
            LoadingText.TextColor3 = Color3.fromRGB(255, 255, 255)
            LoadingText.TextSize = 18

            -- Yükleme durumu metni
            StatusText.Name = "StatusText"
            StatusText.Parent = MainFrame
            StatusText.BackgroundTransparency = 1
            StatusText.Position = UDim2.new(0, 0, 0.85, 0)
            StatusText.Size = UDim2.new(1, 0, 0, 30)
            StatusText.Font = Enum.Font.GothamSemibold
            StatusText.Text = "Initializing..."
            StatusText.TextColor3 = Color3.fromRGB(200, 200, 200)
            StatusText.TextSize = 18

            -- Yükleme animasyonu
            local steps = {"Initializing system...", "Loading hub...", "main Dowland...", "update Modules...", "update Animations...", "finalizing..."}
            local function loadSequence()
                local startTime = tick()
                local totalTime = 12

                while true do
                    local elapsed = tick() - startTime
                    local progress = math.clamp(elapsed / totalTime, 0, 1)
                    local percentage = math.floor(progress * 100)

                    local tweenInfo = TweenInfo.new(0.03, Enum.EasingStyle.Linear)
                    local progressTween = TweenService:Create(LoadingBar, tweenInfo, {Size = UDim2.new(progress, 0, 1, 0)})
                    progressTween:Play()

                    LoadingText.Text = percentage .. "%"
                    StatusText.Text = steps[math.floor(progress * (#steps - 1)) + 1]

                    if progress >= 1 then
                        StatusText.Text = "Loading Complete!"
                        break
                    end
                    task.wait(0.05)
                end

                task.wait(1)

                local exitTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In)
                local exitTween = TweenService:Create(MainFrame, exitTweenInfo, {Position = UDim2.new(0.5, 0, -1.5, 0)})
                exitTween:Play()
            end

            -- UI giriş animasyonu
            local enterTweenInfo = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
            local enterTween = TweenService:Create(MainFrame, enterTweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0)})
            enterTween:Play()

            task.wait(1)
            loadSequence()
            task.wait(0.5)

            -- Sonraki scripti yükle
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Emircxy/Lear/refs/heads/main/KeySystem"))()
            
            -- GUI'yi temizle
            ScreenGui:Destroy()
        else
            game.Players.LocalPlayer:Kick("If you do not accept the terms, you cannot execute this script.")
        end
    end
)
