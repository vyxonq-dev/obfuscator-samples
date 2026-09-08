local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/DummyUi-leak-by-x2zu/fetching-main/Tools/Framework.luau"))()

local Window = Library:Window({
    Title = "Ruóix [ +1 speed for brainrot ]",
    Desc = "By dugxyux7kd_",
    Icon = 89601882629746,
    Theme = "Dark",
    Config = {
        Keybind = Enum.KeyCode.LeftControl,
        Size = UDim2.new(0, 500, 0, 400)
    },
    CloseUIButton = {
        Enabled = true,
        Text = "Ruóix"
    }
})

local SidebarLine = Instance.new("Frame")
SidebarLine.Size = UDim2.new(0, 1, 1, 0)
SidebarLine.Position = UDim2.new(0, 140, 0, 0)
SidebarLine.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
SidebarLine.BorderSizePixel = 0
SidebarLine.ZIndex = 5
SidebarLine.Parent = game:GetService("CoreGui")

local ProximityPromptService = game:GetService("ProximityPromptService")
local instantInteractEnabled = false

ProximityPromptService.PromptButtonHoldBegan:Connect(function(prompt)
    if instantInteractEnabled then
        fireproximityprompt(prompt)
    end
end)

local InfiniteJumpEnabled = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local char = game:GetService("Players").LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)

local PlayerTab = Window:Tab({Title = "Player", Icon = "user"}) do
    PlayerTab:Section({Title = "Movement"})

    PlayerTab:Slider({
        Title = "WalkSpeed",
        Min = 16,
        Max = 450,
        Rounding = 0,
        Value = 16,
        Callback = function(val)
            local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.WalkSpeed = val end
        end
    })

    PlayerTab:Slider({
        Title = "JumpPower",
        Min = 50,
        Max = 2000,
        Rounding = 0,
        Value = 50,
        Callback = function(val)
            local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum.JumpPower = val end
        end
    })

    PlayerTab:Toggle({
        Title = "Infinite Jump",
        Value = false,
        Callback = function(v)
            InfiniteJumpEnabled = v
            Window:Notify({
                Title = "Infinite Jump",
                Desc = v and "Enabled" or "Disabled",
                Time = 2
            })
        end
    })
end

Window:Line()

local MainTab = Window:Tab({Title = "Main", Icon = "star"}) do
    MainTab:Section({Title = "Interact"})

    MainTab:Toggle({
        Title = "Instant Click",
        Value = false,
        Callback = function(v)
            instantInteractEnabled = v
            Window:Notify({
                Title = "Instant Click",
                Desc = v and "Enabled" or "Disabled",
                Time = 2
            })
        end
    })

    MainTab:Section({Title = "Teleport"})

    MainTab:Button({
        Title = "Teleport To End Zone",
        Callback = function()
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(-1113.57861, 58.9342117, 4287.80518)
            end
        end
    })

    MainTab:Button({
        Title = "Teleport To Safe Zone",
        Desc = "Six Seven",
        Callback = function()
            local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

            if hrp then
                hrp.CFrame = CFrame.new(
                    -1086.69873, 61.9259872, -1326.26465,
                    -0.999916315, -6.85957602e-09, 0.0129352408,
                    -6.51035093e-09, 1, 2.70400609e-08,
                    -0.0129352408, 2.6953586e-08, -0.999916315
                )

                Window:Notify({
                    Title = "Teleport",
                    Desc = "Teleport successful",
                    Time = 3
                })
            end
        end
    })
end

Window:Notify({
    Title = "Ruóix",
    Desc = "Loaded: Script",
    Time = 4
})
