-- [[ VENTIX HUB | OFFICIAL RELEASE 2026 ]]
-- [[ OPTIMIZED FOR DELTA & MOBILE EXECUTORS ]]

if not game:IsLoaded() then game.Loaded:Wait() end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // CONFIGURATION
local CorrectKey = "VENTIX-2024" 
local DiscordLink = "https://discord.gg/6thzv6JvG" -- NOVO LINK ATUALIZADO

-- // KEY SYSTEM WINDOW
local Window = Rayfield:CreateWindow({
   Name = "VENTIX HUB | AUTHENTICATION",
   LoadingTitle = "Securing Connection...",
   LoadingSubtitle = "by Ventix Team",
   ConfigurationPadding = 2,
   KeySystem = false
})

local LoginTab = Window:CreateTab("Access", 4483362458)

LoginTab:CreateSection("Key Verification")

LoginTab:CreateButton({
   Name = "Copy NEW Discord Link",
   Callback = function()
      setclipboard(DiscordLink)
      Rayfield:Notify({Title = "Clipboard", Content = "New Discord link copied!", Duration = 3})
   end,
})

LoginTab:CreateInput({
   Name = "Enter Key",
   PlaceholderText = "Paste key here...",
   Callback = function(Text)
      if Text == CorrectKey then
          Rayfield:Notify({Title = "Access Granted", Content = "Welcome to Ventix Hub!", Duration = 2})
          task.wait(1)
          Rayfield:Destroy()
          load_main_hub() 
      else
          Rayfield:Notify({Title = "Access Denied", Content = "Invalid Key, check New Discord!", Duration = 3})
      end
   end,
})

-- // MAIN HUB FUNCTION
function load_main_hub()
    local MainRayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    local MainWin = MainRayfield:CreateWindow({
       Name = "VENTIX HUB | MAIN MENU",
       LoadingTitle = "Executing Hub...",
       LoadingSubtitle = "v2.8 Stable",
       ConfigurationPadding = 2,
       KeySystem = false
    })

    local Players = game:GetService("Players")
    local LP = Players.LocalPlayer
    local RunService = game:GetService("RunService")
    local States = { Fly = false, FlySpeed = 50, Speed = false, WalkSpeed = 16, Noclip = false, Bright = false, AntiAFK = false, AntiFling = false, InfJump = false }

    -- // 1. PLAYER TAB (4 FUNCTIONS)
    local TabPlayer = MainWin:CreateTab("Player", 4483362458)
    TabPlayer:CreateSection("Account & Stats")
    TabPlayer:CreateParagraph({Title = "Username:", Content = LP.Name})
    TabPlayer:CreateParagraph({Title = "Account Age:", Content = LP.AccountAge .. " Days"})
    TabPlayer:CreateButton({Name = "Instant Rejoin", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId, LP) end})
    TabPlayer:CreateButton({Name = "Copy Game ID", Callback = function() setclipboard(tostring(game.PlaceId)) end})

    -- // 2. PROTECTION TAB (4 FUNCTIONS)
    local TabProt = MainWin:CreateTab("Protection", 4483362458)
    TabProt:CreateSection("Defenses")
    TabProt:CreateToggle({Name = "Anti-AFK", CurrentValue = false, Callback = function(v) States.AntiAFK = v end})
    TabProt:CreateToggle({Name = "Anti-Fling", CurrentValue = false, Callback = function(v) States.AntiFling = v end})
    TabProt:CreateButton({Name = "FPS Boost (Clear Lag)", Callback = function() for _,v in pairs(game:GetService("Lighting"):GetChildren()) do if v:IsA("PostProcessEffect") then v:Destroy() end end end})
    TabProt:CreateButton({Name = "Server Hop", Callback = function() game:GetService("TeleportService"):Teleport(game.PlaceId) end})

    -- // 3. TELEPORT TAB (4 FUNCTIONS)
    local TabTP = MainWin:CreateTab("Teleport", 4483362458)
    local TargetTP = ""
    TabTP:CreateSection("Navigation")
    TabTP:CreateInput({Name = "Target Name", PlaceholderText = "Search player...", Callback = function(t) TargetTP = t end})
    TabTP:CreateButton({Name = "Go to Player", Callback = function() 
        for _, v in pairs(Players:GetPlayers()) do 
            if v.Name:lower():sub(1,#TargetTP) == TargetTP:lower() or v.DisplayName:lower():sub(1,#TargetTP) == TargetTP:lower() then 
                LP.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,5,0)
                break
            end 
        end 
    end})
    TabTP:CreateButton({Name = "TP to Spawn", Callback = function() LP.Character.HumanoidRootPart.CFrame = CFrame.new(0, 100, 0) end})
    TabTP:CreateButton({Name = "Get TP Tool", Callback = function() 
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Ventix TP"
        tool.Activated:Connect(function() LP.Character.HumanoidRootPart.CFrame = CFrame.new(LP:GetMouse().Hit.p + Vector3.new(0, 3, 0)) end)
        tool.Parent = LP.Backpack
    end})

    -- // 4. MOVEMENT TAB (FLY & SPEED)
    local TabMods = MainWin:CreateTab("Movement", 4483362458)
    TabMods:CreateSection("Traversal")
    TabMods:CreateToggle({Name = "Fly Mode", CurrentValue = false, Callback = function(v) States.Fly = v end})
    TabMods:CreateSlider({Name = "Fly Speed", Range = {10, 500}, Increment = 5, CurrentValue = 50, Callback = function(v) States.FlySpeed = v end})
    TabMods:CreateToggle({Name = "Speed Hack", CurrentValue = false, Callback = function(v) States.Speed = v end})
    TabMods:CreateSlider({Name = "WalkSpeed", Range = {16, 300}, Increment = 2, CurrentValue = 16, Callback = function(v) States.WalkSpeed = v end})

    -- // 5. EXTRAS TAB (4 FUNCTIONS)
    local TabExtra = MainWin:CreateTab("Extras", 4483362458)
    TabExtra:CreateSection("Visuals & Phys")
    TabExtra:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = function(v) States.Noclip = v end})
    TabExtra:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(v) States.InfJump = v end})
    TabExtra:CreateSlider({Name = "Jump Power", Range = {50, 500}, Increment = 10, CurrentValue = 50, Callback = function(v) LP.Character.Humanoid.JumpPower = v end})
    TabExtra:CreateToggle({Name = "FullBright", CurrentValue = false, Callback = function(v) States.Bright = v end})

    -- // SYSTEM ENGINE
    game:GetService("UserInputService").JumpRequest:Connect(function() if States.InfJump then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end end)
    LP.Idled:Connect(function() if States.AntiAFK then game:GetService("VirtualUser"):CaptureController() game:GetService("VirtualUser"):ClickButton2(Vector2.new()) end end)

    RunService.Heartbeat:Connect(function()
        local char = LP.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local hrp, hum = char.HumanoidRootPart, char.Humanoid
            if States.Speed then hum.WalkSpeed = States.WalkSpeed end
            if States.Fly then
                hum.PlatformStand = true
                hrp.Velocity = hum.MoveDirection.Magnitude > 0 and workspace.CurrentCamera.CFrame.LookVector * States.FlySpeed or Vector3.new(0, 0.5, 0)
            else hum.PlatformStand = false end
            if States.Noclip then for _, p in pairs(char:GetDescendants()) do if p:IsA("BasePart") then p.CanCollide = false end end end
            if States.AntiFling then hrp.RotVelocity = Vector3.new(0,0,0) end
            if States.Bright then game:GetService("Lighting").Brightness = 2 game:GetService("Lighting").Ambient = Color3.fromRGB(255,255,255) end
        end
    end)
end
