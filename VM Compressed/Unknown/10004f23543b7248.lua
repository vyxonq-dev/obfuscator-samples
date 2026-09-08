local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

local Window = Rayfield:CreateWindow({
    Name = "DEV | Farm Factory Tycoon",
    LoadingTitle = "Farm Factory Tycoon",
    LoadingSubtitle = "By [REDACTED]",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "DEV",
        FileName = "DevSave"
    },

})

Rayfield:Notify("Loaded", "loaded in ", 4483362458) -- Notfication -- Title, Content, Image

local Tab = Window:CreateTab("Main ", 4483362458)        -- Title, Image
local Section = Tab:CreateSection("Main")

local Button = Tab:CreateButton({
    Name = "Infinite Money",
    Callback = function()
        game.Players.LocalPlayer.PlayerGui.Hud.Main.Cash.Effect.Visible = false
        game.Players.LocalPlayer.PlayerGui.Hud.Main.Diamond.Effect.Visible = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.RootRigAttachment:Destroy()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/CreatorProfessional/fft/main/generateinfinitemoney'))()
    end,
})

local Button = Tab:CreateButton({
    Name = "Auto Upgrade",
    Callback = function()
        getgenv().yourTycoon = nil
local descendants = game.Workspace.Tycoon:GetDescendants()

for index, descendant in pairs(descendants) do
if descendant.Name == "Onwer" then
if descendant.Value == game.Players.LocalPlayer then
  getgenv().yourTycoon = descendant.Parent
end
end
end
    end,
})

local Button = Tab:CreateButton({
    Name = "Auto Obby",
    Callback = function()
        getgenv().autoObbying = true

while getgenv().autoObbying do
  task.wait()
  local hrpCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
  local end3 = game:GetService("Workspace").Obby.Obby3.End
  local end2 = game:GetService("Workspace").Obby.Obby2.End
  local end1 = game:GetService("Workspace").Obby.Obby1.End
  end3.Transparency = 1
  end2.Transparency = 1
  end1.Transparency = 1
  end3.CFrame = hrpCFrame
  end2.CFrame = hrpCFrame
  end1.CFrame = hrpCFrame
  end3.CanCollide = false
  end2.CanCollide = false
  end1.CanCollide = false
end
    end,
})

local Button = Tab:CreateButton({
    Name = "Claim Gifts Every Second",
    Callback = function()
        while wait(1) do
            local args = {
            [1] = 1
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 2
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 3
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 4
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 5
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 6
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 7
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 8
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 9
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 10
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 11
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        local args = {
            [1] = 12
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Function"):WaitForChild("FreeGifts"):WaitForChild("ClaimGift"):InvokeServer(unpack(args))
        end
    end,
})

local Button = Tab:CreateButton({
    Name = "Auto Upgrade+Rebirth Animals",
    Callback = function()
        while wait(0.01) do

            local args = {
                [1] = "Chicken10"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken10"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken9"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken9"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken8"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken8"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken7"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken7"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken6"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken6"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken5"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken5"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken4"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken4"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken3"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken3"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken2"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken2"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken1"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Chicken1"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            
            
            local args = {
                [1] = "Cow10"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow10"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow9"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow9"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow8"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow8"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow7"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow7"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow6"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow6"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow5"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow5"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow4"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow4"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow3"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow3"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow2"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow2"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Cow1"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Cow1"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            
            
            local args = {
                [1] = "Sheep10"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep10"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep9"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep9"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep8"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep8"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep7"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep7"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep6"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep6"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep5"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep5"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep4"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep4"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep3"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep3"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep2"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep2"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep1"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryUpgrade"):FireServer(unpack(args))
            local args = {
                [1] = "Sheep1"
            }
            
            game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Event"):WaitForChild("Spawn"):WaitForChild("[C-S]TryRebirth"):FireServer(unpack(args))
        end
    end,
})
local Label = Tab:CreateLabel("BE AWARE YOUR SCREEN WILL GET FLOODED WITH NOTIFICATIONS SUCH AS 'did not reach the level'.")
local Label = Tab:CreateLabel("If you know where the notification comes from please contact me.")
local Tab = Window:CreateTab("Misc ", 4483362458)        -- Title, Image
local Section = Tab:CreateSection("Player Settings")

local Slider = Tab:CreateSlider({
    Name = "Speed",
    Range = { 0, 250 },
    Increment = 1,
    Suffix = "Walkspeed",
    CurrentValue = 16,
    Flag = "Slider2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        while Value do
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed =  Value
        end
    end,
})

local Slider = Tab:CreateSlider({
    Name = "JumpPower",
    Range = { 0, 250 },
    Increment = 1,
    Suffix = "JumpPower",
    CurrentValue = 50,
    Flag = "Slider3", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
        while Value do
            wait(0.1)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower =  Value
        end
    end,
})



local Section = Tab:CreateSection("Misc")
local Button = Tab:CreateButton({
    Name = "Ctrl+Click TP",
    Callback = function()
        local Plr = game:GetService("Players").LocalPlayer
local Mouse = Plr:GetMouse()
Mouse.Button1Down:connect(function()
if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then return end
if not Mouse.Target then return end
Plr.Character:MoveTo(Mouse.Hit.p)
end)
    end,
})
local Button = Tab:CreateButton({
    Name = "Remote Spy - Simply Spy",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/z3CJvrXt"))()
    end,
})
local Button = Tab:CreateButton({
    Name = "DarkDex",
    Callback = function()
        getfenv(1).currentTheme = "Graphite"
        loadstring(game:HttpGet("https://raw.githubusercontent.com/loglizzy/dex-custom-icons/main/main.lua"))()
    end,
})
local Button = Tab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
        
    end,
})
local Label = Tab:CreateLabel("ANTI AFK ALREADY APPLIED ON EXECUTION")

-- local Button = Tab:CreateButton({
    --Name = "Stand In Place",
    --Callback = function()
        --game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true
    --end,
--})

--local Button = Tab:CreateButton({
    --Name = "Sit",
    --Callback = function()
        --game.Players.LocalPlayer.Character.Humanoid.Sit = true
    --end,
--})

--local Button = Tab:CreateButton({
    --Name = "Get up",
    --Callback = function()
        --game.Players.LocalPlayer.Character.Humanoid.Sit = false
        --game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
    --end,
--})

-- AntiAfk

if game.Players.LocalPlayer then
    local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end


-- Extras

-- getgenv().SecureMode = true -- Only Set To True If Games Are Detecting/Crashing The UI

-- Rayfield:Destroy() -- Destroys UI

-- Rayfield:LoadConfiguration() -- Enables Configuration Saving

-- Section:Set("Section Example") -- Use To Update Section Text

-- Button:Set("Button Example") -- Use To Update Button Text

-- Toggle:Set(false) -- Use To Update Toggle

-- Slider:Set(10) -- Use To Update Slider Value

-- Label:Set("Label Example") -- Use To Update Label Text

-- Paragraph:Set({Title = "Paragraph Example", Content = "Paragraph Example"}) -- Use To Update Paragraph Text

-- Keybind:Set("RightCtrl") -- Keybind (string) -- Use To Update Keybind

-- Dropdown:Set("Option 2") -- The new option value -- Use To Update/Set New Dropdowns