-- GUI Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))() -- GUI Loader dont remove

-- Rayfield Window

local Window = Rayfield:CreateWindow({
   Name = "FScripts",
   Icon = 111948200153431, -- Icon for the window
   LoadingTitle = "FScripts",
   LoadingSubtitle = "by scot",
   ShowText = "FS", -- Mobile Menu TXT
   Theme = "AmberGlow", -- Custom Theme

   ToggleUIKeybind = "L",

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "FScripts", -- Config Folder
      FileName = "config"
   },

   KeySystem = false,
   KeySettings = {
      Title = "Key System",
      Subtitle = "FScript Key System",
      Note = "Isn't available",
      FileName = "keylock",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"robinho"}
   }
})

-- Notifier

Rayfield:Notify({
   Title = "Warning",
   Content = "Some scripts are dead, buggy or discontinued. Make a ticket in the discord if so.",
   Duration = 6.5,
   Image = 4483362458,
})

-- Tabs

local MiscTab = Window:CreateTab("Misc", 12120687742) -- Misc Tab

local MainTab = Window:CreateTab("PC Scripts", 12684119225) -- PC Scripts Tab

local MobileTab = Window:CreateTab("Mobile Scripts", 87055040141260) -- Mobile Tab

-- Labels

local Label = MainTab:CreateLabel("Menu Keybind: L")-- Label for menu

-- Buttons

local SelfFlingButton = MainTab:CreateButton({
   Name = "Self-Fling",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/sc0t6/FScripts/refs/heads/main/Scripts/Self-Fling.lua"))() -- Script for Self Fling
   end,
})

local WallBtn = MainTab:CreateButton({
   Name = "Walk On Walls", -- Walking on walls
   Callback = function(f)
   f = loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
   end,
})

local printBtn = MainTab:CreateButton({
   Name = "Zero Gravity",
   Callback = function(g)
   g = loadstring(game:HttpGet("https://raw.githubusercontent.com/Bac0nHck/Scripts/refs/heads/main/zerogravity"))()
   end,
})

local InfYButton = MiscTab:CreateButton({
   Name = "Infinite Yield (ADMIN)",
   Callback = function(y)
   y = loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() -- Script for Infinite yield
   end,
})

local SHButton = MiscTab:CreateButton({
   Name = "Server Hop",
   Callback = function(y)
   y = loadstring(game:HttpGet("https://github.com/sc0t6/FScripts/blob/main/Scripts/serverhop.lua"))() -- Script for server hop
   end,
})

local FlyButton = MobileTab:CreateButton({
   Name = "FLY",
   Callback = function(y)
   y = loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\39\104\116\116\112\115\58\47\47\103\105\115\116\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\109\101\111\122\111\110\101\89\84\47\98\102\48\51\55\100\102\102\57\102\48\97\55\48\48\49\55\51\48\52\100\100\100\54\55\102\100\99\100\51\55\48\47\114\97\119\47\101\49\52\101\55\52\102\52\50\53\98\48\54\48\100\102\53\50\51\51\52\51\99\102\51\48\98\55\56\55\48\55\52\101\98\51\99\53\100\50\47\97\114\99\101\117\115\37\50\53\50\48\120\37\50\53\50\48\102\108\121\37\50\53\50\48\50\37\50\53\50\48\111\98\102\108\117\99\97\116\111\114\39\41\44\116\114\117\101\41\41\40\41\10\10")()
   end,
})

local kbMButton = MobileTab:CreateButton({
   Name = "Keyboard Script",
   Callback = function(a)
   a = loadstring("https://raw.githubusercontent.com/AZYsGithub/Delta-Scripts/refs/heads/main/MobileKeyboard.txt")()
   end,
})

local owlButton = MainTab:CreateButton({
   Name = "Owl Hub",
   Callback = function(k)
   k = loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Owl%20Hub.lua"))()
   end,
})

local dexButton = MainTab:CreateButton({
   Name = "Dex Explorer",
   Callback = function(c)
   c = loadstring(game:HttpGet("https://obj.wearedevs.net/2/scripts/Dex%20Explorer.lua"))()
   end,
})

local flipButton = MainTab:CreateButton({
   Name = "Flip (E,R,T)",
   Callback = function(c)
   c = loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Backflip-Script-18595"))()
   end,
})

local flashButton = MainTab:CreateButton({
   Name = "Flashback",
   Callback = function(v)
   v = loadstring(game:HttpGet("https://raw.githubusercontent.com/sc0t6/FScripts/refs/heads/main/Scripts/flashback.lua"))() -- Script for flashback
   end,
})

local NightDayButton = MiscTab:CreateButton({
   Name = "Night and Day",
   Callback = function(v)
   v = tweenService:Create(lighting, TweenInfo.new(0.5), { ClockTime = value and 12 or 24 }):Play()
   end,
})

local animbtn = MainTab:CreateButton({
      Name = "Animatrix",
      Callback = function(vx)
      vx = loadstring(game:HttpGet("https://raw.githubusercontent.com/ocfi/aqua-hub-is-a-skid-lol/refs/heads/main/animatrix"))()
      end,
   })

         
local SliderFOV = MiscTab:CreateSlider({
    Name = "Field of View",
    Range = {0, 120},
    Increment = 1,
    Suffix = "FOV",
    CurrentValue = 60,
    Flag = "FOVSlider",
    Callback = function(Value)
        workspace.CurrentCamera.FieldOfView = Value
    end,
})

local WSSlider = MiscTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {0, 100},
    Increment = 1,
    CurrentValue = 16,
    Flag = "WS",
    Callback = function(Value)
            local char = game.Players.LocalPlayer.Character
    local hum = char and char:FindFirstChild("Humanoid")
    if hum then
        hum.WalkSpeed = Value
    end
         print(Value)
    end,
})

local JPSlider = MiscTab:CreateSlider({
    Name = "JumpPower",
    Range = {0, 200},
    Increment = 1,
    CurrentValue = 50,
    Flag = "JP",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
    end,
})

local HipHeight = MiscTab:CreateSlider({
    Name = "HipHeight",
    Range = {0, 20},
    Increment = 0.5,
    CurrentValue = 2,
    Flag = "HipHeight",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        local hum = char and char:FindFirstChild("Humanoid")
        if hum then
            hum.HipHeight = Value
        end
    end,
})

local AntiAFKConnection

local AntiAFKToggle = MiscTab:CreateToggle({
   Name = "Anti-AFK",
   CurrentValue = false,
   Flag = "AntiAFKToggle",
   Callback = function(Value)
       if Value then
           local player = game:GetService("Players").LocalPlayer
           AntiAFKConnection = player.Idled:Connect(function()
               game:GetService("VirtualUser"):ClickButton2(Vector2.new())
           end)
       else
           if AntiAFKConnection then
               AntiAFKConnection:Disconnect()
               AntiAFKConnection = nil
           end
       end
   end,
})

local AutoJumpConnection
local JUMP_DEBOUNCE = false

local AUTO_EDGE_DISTANCE = 3
local CEILING_CHECK_DISTANCE = 4
local MIN_JUMP_DELAY = 0.08
local MAX_JUMP_DELAY = 0.15

local AutoJumpToggle = MobileTab:CreateToggle({
    Name = "Auto Jump",
    CurrentValue = false,
    Flag = "AutoJumpToggle",
    Callback = function(Value)
        if Value then
            AutoJumpConnection = game:GetService("RunService").RenderStepped:Connect(function()
                local player = game.Players.LocalPlayer
                local char = player.Character
                if not char then return end

                local hrp = char:FindFirstChild("HumanoidRootPart")
                local hum = char:FindFirstChild("Humanoid")
                if not hrp or not hum then return end

                if hum:GetState() ~= Enum.HumanoidStateType.Running and hum:GetState() ~= Enum.HumanoidStateType.Landed then return end
                if JUMP_DEBOUNCE then return end

                local downOrigin = hrp.Position
                local downDirection = Vector3.new(0, -AUTO_EDGE_DISTANCE, 0)
                local downParams = RaycastParams.new()
                downParams.FilterDescendantsInstances = {char}
                downParams.FilterType = Enum.RaycastFilterType.Blacklist
                local floorRay = workspace:Raycast(downOrigin, downDirection, downParams)

                if not floorRay then
                    local upOrigin = hrp.Position
                    local upDirection = Vector3.new(0, CEILING_CHECK_DISTANCE, 0)
                    local upParams = RaycastParams.new()
                    upParams.FilterDescendantsInstances = {char}
                    upParams.FilterType = Enum.RaycastFilterType.Blacklist
                    local ceilingRay = workspace:Raycast(upOrigin, upDirection, upParams)

                    if not ceilingRay then
                        JUMP_DEBOUNCE = true
                        hum.Jump = true
                        task.delay(math.random(MIN_JUMP_DELAY*100, MAX_JUMP_DELAY*100)/100, function()
                            JUMP_DEBOUNCE = false
                        end)
                    end
                end
            end)
        else
            if AutoJumpConnection then
                AutoJumpConnection:Disconnect()
                AutoJumpConnection = nil
            end
        end
    end,
})


-- Unloads the menu

local UnloadBtn = MiscTab:CreateButton({
    Name = "Unload",
    Callback = function()
        if AntiAFKConnection then
            AntiAFKConnection:Disconnect()
            AntiAFKConnection = nil
        end
        Rayfield:Destroy()
    end,
})

Rayfield:LoadConfiguration()
