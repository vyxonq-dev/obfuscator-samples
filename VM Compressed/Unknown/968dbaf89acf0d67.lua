local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")

local LP = Players.LocalPlayer

local AutoBuildButtonTycoon = false

local InfJump = false

local WalkSpeed60 = false

local AntiAFK = false

local function getHRP()

    local char = LP.Character or LP.CharacterAdded:Wait()

    return char:FindFirstChild("HumanoidRootPart")

end

local function getCash()

    return LP.leaderstats and LP.leaderstats:FindFirstChild("Cash") and LP.leaderstats.Cash.Value or 0

end

local ReGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Dear-ReGui/main/ReGui.lua"))()

local UI = ReGui:TabsWindow({Title = "Tycoon Builder | MjContega", Size = UDim2.fromOffset(300, 200)})

local TabMain = UI:CreateTab({Name = "Main"})

local Main = TabMain:CollapsingHeader({Title = "Features"})

Main:Checkbox({

    Label = "Auto Build Button Tycoon",

    Value = false,

    Callback = function(_, v)

        AutoBuildButtonTycoon = v

    end

})

Main:Checkbox({

    Label = "Inf Jump",

    Value = false,

    Callback = function(_, v)

        InfJump = v

    end

})

Main:Checkbox({

    Label = "Walk Speed 60",

    Value = false,

    Callback = function(_, v)

        WalkSpeed60 = v

    end

})

Main:Checkbox({

    Label = "Anti AFK",

    Value = false,

    Callback = function(_, v)

        AntiAFK = v

    end

})

Main:Button({

    Text = "Teleport to Empty Tycoon",

    Callback = function()

        local hrp = getHRP()

        if hrp then

            for _, tycoon in pairs(Workspace.Tycoons:GetChildren()) do

                local ownerBlock = tycoon:FindFirstChild("Objects") and tycoon.Objects:FindFirstChild("PermanentObjects") and tycoon.Objects.PermanentObjects:FindFirstChild("OwnerNameBlock")

                if ownerBlock then

                    local surfaceGui = ownerBlock:FindFirstChild("SurfaceGui")

                    if surfaceGui then

                        local textLabel = surfaceGui:FindFirstChild("Frame") and surfaceGui.Frame:FindFirstChild("TextLabel")

                        if textLabel and textLabel.Text == "Nobody's Factory" then

                            hrp.CFrame = ownerBlock.CFrame + Vector3.new(0, 3, 0)

                            break

                        end

                    end

                end

            end

        end

    end

})

task.spawn(function()

    while task.wait(0.3) do

        if AutoBuildButtonTycoon then

            local hrp = getHRP()

            if not hrp then continue end

            

            for _, tycoon in pairs(Workspace.Tycoons:GetChildren()) do

                if tycoon:FindFirstChild("OwnerName") and tycoon.OwnerName.Value == LP.Name then

                    local buttons = tycoon:FindFirstChild("Objects") and tycoon.Objects:FindFirstChild("Buttons")

                    if buttons then

                        local myCash = getCash()

                        for _, button in pairs(buttons:GetChildren()) do

                            local head = button:FindFirstChild("Head")

                            local price = button:FindFirstChild("Price")

                            

                            if head and price and myCash >= price.Value then

                                pcall(function()

                                    local original = hrp.CFrame

                                    hrp.CFrame = head.CFrame

                                    task.wait(0.1)

                                    hrp.CFrame = original

                                end)

                                task.wait(0.1)

                            end

                        end

                    end

                end

            end

        end

    end

end)

task.spawn(function()

    while task.wait() do

        local hrp = getHRP()

        if hrp then

            if WalkSpeed60 then

                local hum = LP.Character and LP.Character:FindFirstChild("Humanoid")

                if hum then hum.WalkSpeed = 60 end

            elseif LP.Character and LP.Character:FindFirstChild("Humanoid") then

                LP.Character.Humanoid.WalkSpeed = 16

            end

            if AntiAFK then

                hrp.CFrame = hrp.CFrame + Vector3.new(0, 0, 0.1)

            end

        end

    end

end)

local u = game:GetService("UserInputService")

u.JumpRequest:Connect(function()

    if InfJump and LP.Character and LP.Character:FindFirstChild("Humanoid") then

        LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

    end

end)

game.StarterGui:SetCore("SendNotification", {

    Title = "Tycoon Builder",

    Text = "Script Loaded!",

    Duration = 5

})