-- [[ WORM HUB BROOKHAVEN V6.5 - GLOBAL EDITION ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Player = game.Players.LocalPlayer
local KeyFile = "WormHub_Brook_Key.txt"
local CorrectKey = "2005-WORM-BROK-HVEN"
local DiscordLink = "https://discord.gg/ExYXzKCp"

-- --- MAIN WINDOW ---
local Window = Rayfield:CreateWindow({
   Name = "🐍 WORM HUB | BROOKHAVEN V6.5",
   LoadingTitle = "Heist Loaded...",
   LoadingSubtitle = "by Worm Team",
   ConfigurationSaving = {Enabled = false}
})

-- --- SECURITY TAB (ENTRANCE) ---
local KeyTab = Window:CreateTab("🔑 Security", 4483345998)

-- --- FEATURES FUNCTION ---
local function LoadFeatures()
    -- 🚀 MOVEMENT TAB
    local MoveTab = Window:CreateTab("🚀 Movement", 4483362458)
    MoveTab:CreateSlider({
       Name = "WalkSpeed",
       Range = {16, 500},
       Increment = 1,
       CurrentValue = 16,
       Callback = function(v) Player.Character.Humanoid.WalkSpeed = v end,
    })
    MoveTab:CreateSlider({
       Name = "JumpPower",
       Range = {50, 500},
       Increment = 1,
       CurrentValue = 50,
       Callback = function(v) 
           Player.Character.Humanoid.UseJumpPower = true
           Player.Character.Humanoid.JumpPower = v 
       end,
    })

    -- 🎭 TROLL TAB
    local TrollTab = Window:CreateTab("🎭 Troll", 4483345998)
    TrollTab:CreateToggle({
        Name = "Noclip",
        CurrentValue = false,
        Callback = function(Value)
            _G.Noclip = Value
            game:GetService("RunService").Stepped:Connect(function()
                if _G.Noclip and Player.Character then
                    for _, v in pairs(Player.Character:GetDescendants()) do
                        if v:IsA("BasePart") then v.CanCollide = false end
                    end
                end
            end)
        end,
    })
    TrollTab:CreateButton({
        Name = "Become Invisible",
        Callback = function()
            for _, v in pairs(Player.Character:GetDescendants()) do
                if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 1 end
            end
        end,
    })

    -- 🛠️ ADMIN TAB
    local AdminTab = Window:CreateTab("🛠️ Admin", 4483345998)
    
    AdminTab:CreateButton({
        Name = "Infinite Yield (Admin) [450+ Commands]",
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
            Rayfield:Notify({Title = "IY Loaded", Content = "Admin Panel has been loaded!", Duration = 3})
        end,
    })

    AdminTab:CreateButton({
        Name = "FPS Booster",
        Callback = function()
            settings().Rendering.QualityLevel = 1
            for i,v in pairs(game:GetDescendants()) do
                if v:IsA("Part") or v:IsA("Decal") then
                    v.Material = "Plastic"
                    v.Reflectance = 0
                end
            end
        end,
    })

    AdminTab:CreateButton({
        Name = "Full Bright (Night Vision)",
        Callback = function()
            game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            game.Lighting.Brightness = 2
        end,
    })
    
    Rayfield:Notify({Title = "WORM HUB", Content = "All features unlocked!", Duration = 5})
end

-- --- KEY SYSTEM LOGIC ---
KeyTab:CreateInput({
    Name = "Enter Key",
    PlaceholderText = "Paste key here...",
    Callback = function(Text)
        if Text == CorrectKey then
            if not _G.KeyEntered then
                _G.KeyEntered = true
                writefile(KeyFile, Text)
                Rayfield:Notify({Title = "Approved!", Content = "Correct Key! Loading tabs...", Duration = 3})
                LoadFeatures()
            end
        else
            Rayfield:Notify({Title = "Error!", Content = "Wrong Key!", Duration = 3})
        end
    end,
})

KeyTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function() setclipboard(DiscordLink) end,
})

-- AUTO-LOGIN CHECK
if isfile(KeyFile) and readfile(KeyFile) == CorrectKey then
    _G.KeyEntered = true
    LoadFeatures()
end