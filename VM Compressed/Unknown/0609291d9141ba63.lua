local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Create main window
local Window = Rayfield:CreateWindow({
    Name = "Ziek Hub Loader",
    LoadingTitle = "Loading Ziek Hub...",
    LoadingSubtitle = "by Ziek",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "ZiekHubConfig",
        FileName = "Settings"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true, -- Enable key system
    KeySettings = {
        Title = "Ziek Hub - Key System",
        Subtitle = "Enter key to continue",
        Note = "Join the Discord to get key",
        FileName = "ZiekHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"ZKZXKKZXZX"} -- Special character key
    }
})

-- Variables for features
local FlyEnabled = false
local NoclipEnabled = false
local SpeedValue = 50
local InfiniteJumpEnabled = false
local TPJumpHeight = 100
local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- Safe function to load scripts
local function loadScriptSafe(url, scriptName)
    local success, errorMsg = pcall(function()
        local scriptContent = game:HttpGet(url, true)
        local loadedFunction = loadstring(scriptContent)
        
        if loadedFunction then
            loadedFunction()
            Rayfield:Notify({
                Title = scriptName,
                Content = "Script loaded successfully!",
                Duration = 3,
                Image = 4483362458,
            })
        else
            error("Could not load script: " .. scriptName)
        end
    end)
    
    if not success then
        Rayfield:Notify({
            Title = "Error in " .. scriptName,
            Content = "Error: " .. tostring(errorMsg),
            Duration = 6,
            Image = 4483362458,
            Actions = {
                Ignore = {
                    Name = "Ok",
                    Callback = function()
                    end
                },
            },
        })
    end
end

-- Function to copy to clipboard
local function copyToClipboard(text)
    setclipboard(tostring(text))
    Rayfield:Notify({
        Title = "Copied to Clipboard",
        Content = "Discord link has been copied to clipboard!",
        Duration = 3,
        Image = 4483362458,
    })
end

-- Fly function
local function toggleFly()
    FlyEnabled = not FlyEnabled
    if FlyEnabled then
        Rayfield:Notify({
            Title = "Fly",
            Content = "Fly enabled! Speed: " .. SpeedValue,
            Duration = 3,
        })
    else
        Rayfield:Notify({
            Title = "Fly",
            Content = "Fly disabled",
            Duration = 3,
        })
    end
end

-- Noclip function
local function toggleNoclip()
    NoclipEnabled = not NoclipEnabled
    if NoclipEnabled then
        Rayfield:Notify({
            Title = "Noclip",
            Content = "Noclip enabled!",
            Duration = 3,
        })
    else
        Rayfield:Notify({
            Title = "Noclip",
            Content = "Noclip disabled",
            Duration = 3,
        })
    end
end

-- Infinite Jump function
local function toggleInfiniteJump()
    InfiniteJumpEnabled = not InfiniteJumpEnabled
    if InfiniteJumpEnabled then
        Rayfield:Notify({
            Title = "Infinite Jump",
            Content = "Infinite Jump enabled!",
            Duration = 3,
        })
    else
        Rayfield:Notify({
            Title = "Infinite Jump",
            Content = "Infinite Jump disabled",
            Duration = 3,
        })
    end
end

-- TP Jump function
local function teleportJump()
    local humanoid = Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        Character:SetPrimaryPartCFrame(Character.PrimaryPart.CFrame + Vector3.new(0, TPJumpHeight, 0))
        Rayfield:Notify({
            Title = "TP Jump",
            Content = "Teleported " .. TPJumpHeight .. " studs up!",
            Duration = 3,
        })
    end
end

-- Give TP Tool
local function giveTPTool()
    local tool = Instance.new("Tool")
    tool.Name = "TP Tool"
    tool.RequiresHandle = false
    tool.Activated:Connect(function()
        if Character then
            Character:SetPrimaryPartCFrame(CFrame.new(game:GetService("Players").LocalPlayer:GetMouse().Hit.Position))
        end
    end)
    tool.Parent = Player.Backpack
    Rayfield:Notify({
        Title = "TP Tool",
        Content = "Teleport tool added to your backpack!",
        Duration = 3,
    })
end

-- Create tabs in order: Info first, then Main, then Misc
local InfoTab = Window:CreateTab("Information", 4483362458)
local MainTab = Window:CreateTab("Main", 4483362458)
local MiscTab = Window:CreateTab("Misc", 4483362458)

-- Info Tab Content
InfoTab:CreateSection("About the Menu")

InfoTab:CreateParagraph({
    Title = "Ziek Hub Loader",
    Content = "This menu allows you to load different Ziek Hub scripts with a single click. Select the script you want to run and click the corresponding button."
})

InfoTab:CreateSection("Instructions")

InfoTab:CreateParagraph({
    Title = "How to use",
    Content = "1. Get key from Discord \n2. Navigate to the 'Main' tab\n3. Select the script you want to load\n4. Click the corresponding button\n5. Wait for the confirmation notification\n6. Enjoy the script!"
})

InfoTab:CreateSection("Troubleshooting")

InfoTab:CreateParagraph({
    Title = "If a script doesn't work",
    Content = "Some scripts may require additional permissions or may not be compatible with the current game. If you encounter problems, try:\n\n1. Running the script in a different game\n2. Making sure your executor has the necessary permissions\n3. Checking the F9 console for more error details"
})

-- Main Tab Content (ZiekHub Scripts)
MainTab:CreateSection("Discord - Get Key")

MainTab:CreateButton({
    Name = "⚙️ Copy Discord Link",
    Callback = function()
        copyToClipboard("https://discord.gg/cVWG52FYUb")
    end,
})

MainTab:CreateParagraph({
    Title = "Key Instructions",
    Content = "1. Click the button above to copy Discord link\n2. Join the Discord server\n3. Get your key from the #key channel\n4. Enter the key: 92ZK73!\"JL&"
})

MainTab:CreateSection("ZiekHub Scripts")

MainTab:CreateButton({
    Name = "⚙️ ZiekHub 99 Nights",
    Callback = function()
        loadScriptSafe("https://pastebin.com/raw/PTPzFbG5", "ZiekHub 99 Nights")
    end,
})

MainTab:CreateButton({
    Name = "⚙️ ZiekHub Hunty Zombies",
    Callback = function()
        loadScriptSafe("https://pastebin.com/raw/feT81Cb0", "ZiekHub Hunty Zombies")
    end,
})

-- Misc Tab Content
MiscTab:CreateSection("Movement")

MiscTab:CreateToggle({
    Name = "Fly",
    CurrentValue = FlyEnabled,
    Callback = function(Value)
        FlyEnabled = Value
        toggleFly()
    end,
})

MiscTab:CreateSlider({
    Name = "Fly Speed",
    Range = {1, 500},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = SpeedValue,
    Callback = function(Value)
        SpeedValue = Value
    end,
})

MiscTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = NoclipEnabled,
    Callback = function(Value)
        NoclipEnabled = Value
        toggleNoclip()
    end,
})

MiscTab:CreateSlider({
    Name = "Walk Speed",
    Range = {1, 500},
    Increment = 1,
    Suffix = "studs",
    CurrentValue = 16,
    Callback = function(Value)
        local humanoid = Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
        end
    end,
})

MiscTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = InfiniteJumpEnabled,
    Callback = function(Value)
        InfiniteJumpEnabled = Value
        toggleInfiniteJump()
    end,
})

MiscTab:CreateSection("Teleport")

MiscTab:CreateSlider({
    Name = "TP Jump Height",
    Range = {1, 1000},
    Increment = 10,
    Suffix = "studs",
    CurrentValue = TPJumpHeight,
    Callback = function(Value)
        TPJumpHeight = Value
    end,
})

MiscTab:CreateButton({
    Name = "⚙️ Execute TP Jump",
    Callback = teleportJump,
})

MiscTab:CreateSection("Tools")

MiscTab:CreateButton({
    Name = "⚙️ Get TP Tool",
    Callback = giveTPTool,
})

MiscTab:CreateSection("Extra Features")

MiscTab:CreateButton({
    Name = "⚙️ Reset Character",
    Callback = function()
        Player:LoadCharacter()
        Rayfield:Notify({
            Title = "Character Reset",
            Content = "Character has been reset!",
            Duration = 3,
        })
    end,
})

MiscTab:CreateButton({
    Name = "⚙️ God Mode (R15)",
    Callback = function()
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
        Rayfield:Notify({
            Title = "God Mode",
            Content = "Collision disabled for all parts!",
            Duration = 3,
        })
    end,
})

-- Initialize UI
Rayfield:LoadConfiguration()

Rayfield:Notify({
    Title = "Menu Loaded",
    Content = "Join Discord for key: 92ZK73!\"JL&",
    Duration = 5,
    Image = 4483362458,
})

-- Fly and Noclip loops
game:GetService("RunService").RenderStepped:Connect(function()
    if FlyEnabled and Character and Character.PrimaryPart then
        Character.PrimaryPart.Velocity = Vector3.new(0, 0, 0)
        Character.PrimaryPart.CFrame = Character.PrimaryPart.CFrame + (game:GetService("Players").LocalPlayer:GetMouse().Hit.LookVector * (SpeedValue / 10))
    end
    
    if NoclipEnabled and Character then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

-- Infinite Jump functionality
game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled and Character:FindFirstChildOfClass("Humanoid") then
        Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)