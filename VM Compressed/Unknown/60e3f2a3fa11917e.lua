-- BETTERPhantomFlux - Weak Legacy 2
-- Original Script: SudaisXCheats
-- UI Library: WindUI by Footagesus
-- Enhanced Version

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "BETTERPhantomFlux | Weak Legacy 2",
    Icon = "rbxassetid://79794145409508",
    IconThemed = true,
    Author = "Original by SudaisXCheats - Enhanced",
    Folder = "BETTERPhantomFlux",
    Size = UDim2.fromOffset(580, 460),
    Transparent = true,
    Theme = "Dark",
    User = {
        Enabled = false
    },
    SideBarWidth = 200,
    ScrollBarEnabled = true,
    KeySystem = false
})

-- Edit Open Button
Window:EditOpenButton({
    Title = "Open BETTERPhantomFlux",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(Color3.fromHex("FF0F7B"), Color3.fromHex("F89B29")),
    Draggable = true
})

-- TOGGLE CON TECLA G
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G then
        -- Buscar el WindUI ScreenGui
        for _, gui in pairs(CoreGui:GetDescendants()) do
            if gui:IsA("ScreenGui") and gui:FindFirstChild("WindUI") then
                gui.Enabled = not gui.Enabled
                break
            end
        end
    end
end)

-- Tabs
local Tabs = {
    AboutTab = Window:Tab({
        Title = "About",
        Icon = "info"
    }),
    GamePassTab = Window:Tab({
        Title = "Game Pass",
        Icon = "gift"
    }),
    UtilityTab = Window:Tab({
        Title = "Utility",
        Icon = "wrench"
    }),
    CombatTab = Window:Tab({
        Title = "Combat",
        Icon = "swords"
    }),
    BreathingTab = Window:Tab({
        Title = "Breathing",
        Icon = "wind"
    }),
    TrainingTab = Window:Tab({
        Title = "Training",
        Icon = "dumbbell"
    }),
    FarmTab = Window:Tab({
        Title = "Auto Farm",
        Icon = "leaf"
    }),
    BossTab = Window:Tab({
        Title = "Boss Farm",
        Icon = "skull"
    }),
    PlayerTab = Window:Tab({
        Title = "Player",
        Icon = "user"
    })
}

Window:SelectTab(1)

-- SERVICES
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local VirtualUser = game:GetService("VirtualUser")

local LocalPlayer = Players.LocalPlayer

-- ABOUT TAB
Tabs.AboutTab:Paragraph({
    Title = "BETTERPhantomFlux",
    Icon = "info",
    Desc = "Enhanced version for Weak Legacy 2\n\nOriginal Script: SudaisXCheats\nUI Library: WindUI by Footagesus\n\nPress G to toggle UI"
})

Tabs.AboutTab:Paragraph({
    Title = "Controls",
    Icon = "keyboard",
    Desc = "Press G key to show/hide the GUI"
})

Tabs.AboutTab:Button({
    Title = "Copy Official Discord",
    Icon = "link",
    Callback = function()
        setclipboard("https://discord.gg/eh9Zs8DbxF")
        WindUI:Notify({
            Title = "Copied!",
            Content = "Discord link copied to clipboard!",
            Duration = 3
        })
    end
})

Tabs.AboutTab:Button({
    Title = "Join Discord Server",
    Icon = "discord",
    Callback = function()
        setclipboard("https://discord.gg/eh9Zs8DbxF")
        WindUI:Notify({
            Title = "Discord",
            Content = "Link copied! Paste in browser to join.",
            Duration = 5
        })
    end
})

-- GAME PASS TAB
Tabs.GamePassTab:Toggle({
    Title = "Exp x2 + Skip Spin Animation",
    Default = false,
    Callback = function(Value)
        local connections = {}
        local running = Value
        local valuesToWatch = {"x2XP", "SkipSpinAnimation"}

        local function setGamepassState(state)
            local gamepasses = LocalPlayer:WaitForChild("Gamepasses")
            for _, valueName in ipairs(valuesToWatch) do
                local valueObject = gamepasses:FindFirstChild(valueName)
                if valueObject and valueObject:IsA("BoolValue") then
                    valueObject.Value = state
                end
            end
        end

        local function enableAutoReopen()
            local gamepasses = LocalPlayer:WaitForChild("Gamepasses")
            for _, valueName in ipairs(valuesToWatch) do
                local valueObject = gamepasses:FindFirstChild(valueName)
                if valueObject and valueObject:IsA("BoolValue") then
                    local connection = valueObject.Changed:Connect(function(newValue)
                        if running and newValue == false then
                            valueObject.Value = true
                        end
                    end)
                    table.insert(connections, connection)
                end
            end
        end

        if Value then
            running = true
            setGamepassState(true)
            enableAutoReopen()
            WindUI:Notify({
                Title = "Game Pass",
                Content = "Exp x2 + Skip Spin Enabled",
                Duration = 3
            })
        else
            running = false
            for _, connection in ipairs(connections) do
                connection:Disconnect()
            end
            setGamepassState(false)
            WindUI:Notify({
                Title = "Game Pass",
                Content = "Disabled",
                Duration = 3
            })
        end
    end
})

-- UTILITY TAB
Tabs.UtilityTab:Toggle({
    Title = "Anti AFK",
    Default = false,
    Callback = function(Value)
        local running = false
        local connection

        if Value then
            running = true
            connection = LocalPlayer.Idled:Connect(function()
                VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
            WindUI:Notify({
                Title = "Anti-AFK",
                Content = "Enabled",
                Duration = 3
            })
        else
            running = false
            if connection then
                connection:Disconnect()
            end
            WindUI:Notify({
                Title = "Anti-AFK",
                Content = "Disabled",
                Duration = 3
            })
        end
    end
})

-- COMBAT TAB
Tabs.CombatTab:Toggle({
    Title = "Auto M1 Combat",
    Default = false,
    Callback = function(Value)
        _G.AutoCombat = Value
        
        if Value then
            task.spawn(function()
                local AttackRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Attack")
                while _G.AutoCombat do
                    local startTime = tick()
                    while _G.AutoCombat and tick() - startTime < 1 do
                        pcall(function()
                            AttackRemote:FireServer("M1", "Combat", false)
                        end)
                        task.wait(0.03)
                    end
                    task.wait(2)
                end
            end)
            WindUI:Notify({
                Title = "Combat",
                Content = "Auto M1 Enabled",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Combat",
                Content = "Auto M1 Disabled",
                Duration = 3
            })
        end
    end
})

Tabs.CombatTab:Toggle({
    Title = "Auto Sound Breathing Skills",
    Default = false,
    Callback = function(Value)
        _G.AutoSoundBreathingSkills = Value
        
        if Value then
            task.spawn(function()
                local Attack = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Attack")
                
                local argsFirstMove = {
                    "Skill", "Roar", "Release", "FirstMove",
                    [6] = CFrame.new(375.18, 9.32, 475.15)
                }
                
                local argsSecondMove = {
                    "Skill", "Constant Resounding Slashes", "Release", "SecondMove",
                    [6] = CFrame.new(723.21, 9.32, -322.32)
                }
                
                local argsThirdMove = {
                    "Skill", "String Performance", "Release", "ThirdMove",
                    [6] = CFrame.new(747.98, 9.32, -313.62)
                }
                
                while _G.AutoSoundBreathingSkills do
                    Attack:FireServer(unpack(argsFirstMove))
                    wait(0.5)
                    Attack:FireServer(unpack(argsSecondMove))
                    wait(0.5)
                    Attack:FireServer(unpack(argsThirdMove))
                    wait(0.5)
                end
            end)
            WindUI:Notify({
                Title = "Skills",
                Content = "Sound Breathing Skills Enabled",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Skills",
                Content = "Sound Breathing Skills Disabled",
                Duration = 3
            })
        end
    end
})

-- BREATHING TAB
Tabs.BreathingTab:Toggle({
    Title = "Auto Breathing",
    Default = false,
    Callback = function(Value)
        _G.AutoBreathing = Value
        
        if Value then
            task.spawn(function()
                local Breathing = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Breathing")
                while _G.AutoBreathing do
                    Breathing:FireServer("BeginHamonBreathing")
                    wait(2)
                end
            end)
            WindUI:Notify({
                Title = "Breathing",
                Content = "Auto Breathing Enabled",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Breathing",
                Content = "Auto Breathing Disabled",
                Duration = 3
            })
        end
    end
})

-- TRAINING TAB
Tabs.TrainingTab:Toggle({
    Title = "Sound Breathing Training Quest",
    Default = false,
    Callback = function(Value)
        _G.SoundBreathingQuest = Value
        
        if Value then
            task.spawn(function()
                local QuestTake = ReplicatedStorage:WaitForChild("Events"):WaitForChild("QuestTake")
                while _G.SoundBreathingQuest do
                    QuestTake:FireServer("Sound Breathing")
                    wait(2)
                end
            end)
            WindUI:Notify({
                Title = "Training",
                Content = "Sound Breathing Quest Enabled",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Training",
                Content = "Sound Breathing Quest Disabled",
                Duration = 3
            })
        end
    end
})

-- AUTO FARM TAB (Levels 1-850)
local farmConfigs = {
    {name = "Level 1-10", mob = "Weak Demon", quest = "Quest Dummy 1", cframe = CFrame.new(133.52, 9.32, 431.63) * CFrame.Angles(0, 0.80, 0)},
    {name = "Level 10-30", mob = "Demon", quest = "Quest Dummy 2", cframe = CFrame.new(519.82, 9.32, 404.89) * CFrame.Angles(3.14, 1.18, -3.14)},
    {name = "Level 30-50", mob = "Winter Demon", quest = "Quest Dummy 3", cframe = CFrame.new(487.19, 9.24, -1732.89) * CFrame.Angles(3.14, -0.67, 3.14)},
    {name = "Level 50-70", mob = "Strong Demon", quest = "Quest Dummy 4", cframe = CFrame.new(-515.86, 53.92, 60.79) * CFrame.Angles(-0.00, 0.06, 0.00)},
    {name = "Level 70-100", mob = "Lower Moon Demon 6", quest = "Quest Dummy 5", cframe = CFrame.new(-648.39, 9.32, -130.36) * CFrame.Angles(0.00, -0.37, -0.00)},
    {name = "Level 100-130", mob = "Lower Moon Demon 5", quest = "Quest Dummy 6", cframe = CFrame.new(-190.01, 9.32, 108.18) * CFrame.Angles(3.14, -1.56, 3.14)},
    {name = "Level 130-150", mob = "Lower Moon Demon 4", quest = "Quest Dummy 7", cframe = CFrame.new(-398.08, 9.32, -100.94) * CFrame.Angles(0.00, 0.90, -0.00)},
    {name = "Level 700-750", mob = "Mutated Demon", quest = "Quest Dummy 8", cframe = CFrame.new(-159.29, 9.60, 822.37) * CFrame.Angles(3.14, -0.93, 3.14)},
    {name = "Level 750-800", mob = "Half Speed Art User", quest = "Quest Dummy 9", cframe = CFrame.new(800.61, 73.82, 792.09) * CFrame.Angles(-0.00, 1.34, -0.00)},
    {name = "Level 800-850", mob = "Speed Art User", quest = "Quest Dummy 10", cframe = CFrame.new(163.31, 112.88, 1047.27) * CFrame.Angles(3.14, 0.04, 3.14)}
}

-- Function to bring mob
local function bringMob(mob, hrp)
    if not mob or not mob:FindFirstChild("HumanoidRootPart") then return end
    local mobHRP = mob.HumanoidRootPart
    local targetPos = hrp.Position + hrp.CFrame.LookVector * 5
    local newCFrame = CFrame.lookAt(targetPos, hrp.Position) * CFrame.Angles(0, math.rad(180), 0)
    mobHRP.CFrame = newCFrame
end

-- Create farm toggles
for _, config in ipairs(farmConfigs) do
    Tabs.FarmTab:Toggle({
        Title = config.name,
        Default = false,
        Callback = function(Value)
            local loopConnection
            
            if Value then
                loopConnection = RunService.RenderStepped:Connect(function()
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    
                    hrp.CFrame = config.cframe
                    
                    -- Auto take quest
                    local questFolder = LocalPlayer:FindFirstChild("Quest")
                    local questName = questFolder and questFolder:FindFirstChild("QuestName")
                    if questName and questName.Value == "None" then
                        ReplicatedStorage:WaitForChild("Events"):WaitForChild("QuestTake"):FireServer(config.quest)
                    end
                    
                    -- Bring mobs
                    local charactersFolder = Workspace:FindFirstChild("CharactersAndNPCs")
                    if charactersFolder then
                        for _, mob in ipairs(charactersFolder:GetChildren()) do
                            if mob:IsA("Model") and mob.Name == config.mob then
                                bringMob(mob, hrp)
                            end
                        end
                    end
                end)
                
                WindUI:Notify({
                    Title = "Auto Farm",
                    Content = config.name .. " Enabled",
                    Duration = 3
                })
            else
                if loopConnection then
                    loopConnection:Disconnect()
                end
                WindUI:Notify({
                    Title = "Auto Farm",
                    Content = config.name .. " Disabled",
                    Duration = 3
                })
            end
        end
    })
end

-- BOSS FARM TAB
local bossConfigs = {
    {name = "Tanjiro (Water)", quest = "Quest Boss Dummy 1", cframe = CFrame.new(-276.25, 71.67, 153.92)},
    {name = "Rengoku", quest = "Quest Boss Dummy 2", cframe = CFrame.new(-279.67, 9.32, 614.44)},
    {name = "Nezuko", quest = "Quest Boss Dummy 3", cframe = CFrame.new(778.26, 9.32, -196.47)},
    {name = "Zenitsu", quest = "Quest Boss Dummy 4", cframe = CFrame.new(-114.59, 9.32, 310.04)},
    {name = "Tokito", quest = "Quest Boss Dummy 5", cframe = CFrame.new(-145.07, 9.32, -401.57)},
    {name = "Akaza", quest = "Quest Boss Dummy 6", cframe = CFrame.new(325.31, 9.32, 201.10)},
    {name = "Kaigaku", quest = "Quest Boss Dummy 7", cframe = CFrame.new(258.37, 122.53, -220.97)},
    {name = "Tengen", quest = "Quest Boss Dummy 8", cframe = CFrame.new(417.64, 9.32, -9.94)},
    {name = "Gyutaro", quest = "Quest Boss Dummy 9", cframe = CFrame.new(15.57, 9.32, -82.56)},
    {name = "Hantengu", quest = "Quest Boss Dummy 10", cframe = CFrame.new(467.28, 9.24, -1465.00)},
    {name = "Shinobu", quest = "Quest Boss Dummy 11", cframe = CFrame.new(-1212.92, 9.32, -498.65)},
    {name = "Mitsuri", quest = "Quest Boss Dummy 12", cframe = CFrame.new(-380.08, 9.32, -484.34)},
    {name = "Rui", quest = "Quest Boss Dummy 13", cframe = CFrame.new(404.08, 9.31, -934.34)},
    {name = "Sanemi", quest = "Quest Boss Dummy 14", cframe = CFrame.new(652.17, 9.32, 62.72)},
    {name = "Obanai", quest = "Quest Boss Dummy 15", cframe = CFrame.new(688.42, 9.32, -496.67)}
}

for _, boss in ipairs(bossConfigs) do
    Tabs.BossTab:Toggle({
        Title = "Farm " .. boss.name,
        Default = false,
        Callback = function(Value)
            local connection
            
            if Value then
                connection = RunService.RenderStepped:Connect(function()
                    local char = LocalPlayer.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then return end
                    
                    hrp.CFrame = boss.cframe
                    
                    local questFolder = LocalPlayer:FindFirstChild("Quest")
                    local questName = questFolder and questFolder:FindFirstChild("QuestName")
                    if questName and questName.Value == "None" then
                        ReplicatedStorage:WaitForChild("Events"):WaitForChild("QuestTake"):FireServer(boss.quest)
                    end
                    
                    local charactersFolder = Workspace:FindFirstChild("CharactersAndNPCs")
                    if charactersFolder then
                        for _, mob in ipairs(charactersFolder:GetChildren()) do
                            if mob:IsA("Model") and mob.Name == boss.name then
                                bringMob(mob, hrp)
                            end
                        end
                    end
                end)
                
                WindUI:Notify({
                    Title = "Boss Farm",
                    Content = boss.name .. " Enabled",
                    Duration = 3
                })
            else
                if connection then
                    connection:Disconnect()
                end
                WindUI:Notify({
                    Title = "Boss Farm",
                    Content = boss.name .. " Disabled",
                    Duration = 3
                })
            end
        end
    })
end

-- PLAYER TAB
Tabs.PlayerTab:Slider({
    Title = "WalkSpeed",
    Value = {
        Min = 1,
        Max = 1000,
        Default = 16
    },
    Step = 1,
    Callback = function(value)
        local humanoid = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end
})

Tabs.PlayerTab:Slider({
    Title = "Jump Height",
    Value = {
        Min = 1,
        Max = 1000,
        Default = 50
    },
    Step = 1,
    Callback = function(value)
        local humanoid = (LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()):FindFirstChildWhichIsA("Humanoid")
        if humanoid then
            if humanoid.UseJumpPower then
                humanoid.JumpPower = value
            else
                humanoid.JumpHeight = value
            end
        end
    end
})

Tabs.PlayerTab:Toggle({
    Title = "Noclip",
    Default = false,
    Callback = function(Value)
        local noclipConnection
        if Value then
            noclipConnection = RunService.Stepped:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    for _, part in ipairs(char:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        else
            if noclipConnection then
                noclipConnection:Disconnect()
            end
        end
    end
})

-- FINAL MESSAGE
WindUI:Notify({
    Title = "BETTERPhantomFlux Loaded!",
    Content = "Original: SudaisXCheats | Press G to toggle UI",
    Duration = 5
})

print("========================================")
print("   BETTERPhantomFlux - Weak Legacy 2   ")
print("========================================")
print("Original Script: SudaisXCheats")
print("Discord: discord.gg/eh9Zs8DbxF")
print("Press G to show/hide GUI")
print("========================================")
