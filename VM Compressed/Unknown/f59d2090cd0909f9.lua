local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local GUI_WIDTH, GUI_HEIGHT = 400, 360
local TITLE_HEIGHT = 30
local BUTTON_HEIGHT, BUTTON_PADDING = 30, 5

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TeamDewSewGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, GUI_WIDTH, 0, GUI_HEIGHT)
mainFrame.Position = UDim2.new(0.5, -GUI_WIDTH / 2, 0.5, -GUI_HEIGHT / 2)
mainFrame.BackgroundColor3 = Color3.fromRGB(10, 30, 10)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local titleBar = Instance.new("Frame")
titleBar.Size = UDim2.new(1, 0, 0, TITLE_HEIGHT)
titleBar.BackgroundColor3 = Color3.fromRGB(0, 90, 0)
titleBar.BorderSizePixel = 0
titleBar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -30, 1, 0)
titleLabel.Position = UDim2.new(0, 4, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = " Team DewSew for life! "
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Parent = titleBar

local minBtn = Instance.new("TextButton")
minBtn.Size = UDim2.new(0, 30, 1, 0)
minBtn.Position = UDim2.new(1, -30, 0, 0)
minBtn.Text = "-"
minBtn.Font = Enum.Font.GothamBold
minBtn.TextSize = 18
minBtn.TextColor3 = Color3.new(1, 1, 1)
minBtn.BackgroundColor3 = Color3.fromRGB(0, 130, 0)
minBtn.BorderSizePixel = 0
minBtn.Parent = titleBar

local logo = Instance.new("ImageLabel")
logo.BackgroundTransparency = 1
logo.Size = UDim2.new(1, -20, 0, 80)
logo.Position = UDim2.new(0, 10, 0, TITLE_HEIGHT + 5)
logo.Image = "rbxassetid://87486058304609"
logo.ScaleType = Enum.ScaleType.Fit
logo.ImageColor3 = Color3.fromRGB(0, 255, 0)
logo.Parent = mainFrame

local buttonFrame = Instance.new("ScrollingFrame")
buttonFrame.Size = UDim2.new(1, -10, 0, GUI_HEIGHT - TITLE_HEIGHT - 90)
buttonFrame.Position = UDim2.new(0, 5, 0, TITLE_HEIGHT + 5)
buttonFrame.BackgroundTransparency = 1
buttonFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
buttonFrame.ScrollBarThickness = 6
buttonFrame.Parent = mainFrame

local UIGridLayout = Instance.new("UIGridLayout")
UIGridLayout.FillDirection = Enum.FillDirection.Horizontal
UIGridLayout.CellSize = UDim2.new(0, 120, 0, BUTTON_HEIGHT)
UIGridLayout.CellPadding = UDim2.new(0, BUTTON_PADDING, 0, BUTTON_PADDING)
UIGridLayout.Parent = buttonFrame

local pages = {
    {"Set Skybox", "SET_SKYBOX"},
    {"Decal Spam", "DECAL_SPAM"},
    {"Scary Laugh", "SCARY_LAUGH"},
    {"Scary Banger", "SCARY_BANGER"},
    {"Grab knife", "https://rawscripts.net/raw/Universal-Script-Grab-knife-53687"},
    {"JOHN DOE", "https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/John%20Doe.lua"},
    {"C00lclan ui", "https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua"},
    {"Infinity yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {"Fly", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"},
    {"Zero Gravity v3", "https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"},
    {"Spin R6", "localSpinR6"},
    {"Spin R15", "localSpinR15"},
    {"Keyboard", "https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"},
    {"Clown Guy", "https://raw.githubusercontent.com/KRNL2/3dx/main/VEREUS"},
    {"Sword God", "https://raw.githubusercontent.com/KRNL2/sword/main/Chaos%20Deus%20Sword"},
    {"The Glitch", "https://raw.githubusercontent.com/KRNL2/haker/main/The%20Glitch"},
    {"Revenge Hands", "https://raw.githubusercontent.com/KRNL2/asdasdasd/main/Revenge%20Hands"},
    {"Caducus", "https://rawscripts.net/raw/Universal-Script-FE-Caducus-The-fallen-god-REQUIRES-REANIMATION-TO-WORK-47600"},
    {"Giant Hand", "https://rawscripts.net/raw/Universal-Script-Universal-client-sided-all-seeing-hand-61843"},
    {"Guest 666", "https://rawscripts.net/raw/Universal-Script-Fe-Guest-666-Only-anims-are-fe-53309"},
    {"Get Banged", "https://pastebin.com/raw/zHbw7ND1"},
    {"Shlonga Bonga", "https://raw.githubusercontent.com/Avtor1zaTion/NO-FE-SNAKE/refs/heads/main/NO-FE-Snake.txt"}
}

for _, data in ipairs(pages) do
    local btn = Instance.new("TextButton")
    btn.Text = data[1]
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.BackgroundColor3 = Color3.fromRGB(0, 130, 0)
    btn.BorderSizePixel = 0
    btn.Parent = buttonFrame

    local glow = Instance.new("UIStroke")
    glow.Color = Color3.fromRGB(0, 255, 0)
    glow.Thickness = 1
    glow.Parent = btn

    btn.MouseButton1Click:Connect(function()
        if data[2] == "SET_SKYBOX" then
            local USER_ID = 9462631037
            local AVATAR = "https://www.roblox.com/headshot-thumbnail/image?userId="..USER_ID.."&width=420&height=420&format=png"
            local s = Instance.new("Sky")
            s.Parent = game.Lighting
            for _, v in ipairs({"Bk","Ft","Lf","Rt","Up","Dn"}) do
                s["Skybox"..v] = AVATAR
            end
            return
        end

        if data[2] == "DECAL_SPAM" then
            local USER_ID = 9462631037
            local AVATAR = "https://www.roblox.com/headshot-thumbnail/image?userId="..USER_ID.."&width=420&height=420&format=png"
            for _, v in workspace:GetDescendants() do
                if v:IsA("BasePart") then
                    for _, f in Enum.NormalId:GetEnumItems() do
                        local d = Instance.new("Decal")
                        d.Face = f
                        d.Texture = AVATAR
                        d.Parent = v
                    end
                end
            end
            return
        end

        if data[2] == "SCARY_LAUGH" then
            local s = Instance.new("Sound", workspace)
            s.SoundId = "rbxassetid://6821054463"
            s.Volume = 5
            s:Play()
            return
        end

        if data[2] == "SCARY_BANGER" then
            local s = Instance.new("Sound", workspace)
            s.SoundId = "rbxassetid://100750199822153"
            s.Volume = 6
            s:Play()

            local flash = Instance.new("Frame", screenGui)
            flash.Size = UDim2.new(1, 0, 1, 0)
            flash.BackgroundColor3 = Color3.new(1, 1, 1)
            flash.BackgroundTransparency = 1

            task.spawn(function()
                for i = 1, 25 do
                    flash.BackgroundTransparency = math.random()
                    task.wait(0.2)
                end
                flash:Destroy()
            end)
            return
        end

        local char = Player.Character or Player.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart") or char:WaitForChild("HumanoidRootPart")

        if data[2] == "localSpinR6" or data[2] == "localSpinR15" then
            local tag = (data[2] == "localSpinR6") and "SpinGyroR6" or "SpinGyroR15"
            local existing = hrp:FindFirstChild(tag)
            if existing then
                existing:Destroy()
            else
                local gyro = Instance.new("BodyGyro")
                gyro.Name = tag
                gyro.P = 100000
                gyro.D = 10
                gyro.MaxTorque = Vector3.new(0, math.huge, 0)
                gyro.CFrame = hrp.CFrame
                gyro.Parent = hrp
                local angle = 0
                local conn
                conn = RunService.RenderStepped:Connect(function(dt)
                    if not gyro.Parent then conn:Disconnect() return end
                    angle = angle + math.rad(10) * 60 * dt
                    pcall(function()
                        gyro.CFrame = hrp.CFrame * CFrame.Angles(0, angle, 0)
                    end)
                end)
            end
        else
            pcall(function()
                loadstring(game:HttpGet(data[2], true))()
            end)
        end
    end)
end

buttonFrame.CanvasSize = UDim2.new(0, 0, 0, math.ceil(#pages / 3) * (BUTTON_HEIGHT + BUTTON_PADDING))

local dragging = false
local dragStart, startPos
titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(move)
    if dragging then
        local delta = move.Position - dragStart
        mainFrame.Position = UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y)
    end
end)

local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    buttonFrame.Visible = not minimized
    logo.Visible = not minimized
    mainFrame.BackgroundTransparency = minimized and 0.9 or 0
    minBtn.Text = minimized and "◻" or "-"
end)

print("Im the best right?")
