local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- KEY SYSTEM CONFIG
local CorrectKey = "Hex-V123" 
local DiscordLink = "https://discord.gg/hmZ7g7YYJ"

local KeyWindow = Rayfield:CreateWindow({
   Name = "Elite Proximity | Key System",
   LoadingTitle = "Securing Connection...",
   LoadingSubtitle = "by ExoticBunBoy", -- Updated Subtitle
   ConfigurationSaving = { Enabled = false }
})

local KeyTab = KeyWindow:CreateTab("Verification", 4483362458)

KeyTab:CreateSection("Key Entry")

KeyTab:CreateInput({
   Name = "Enter Key",
   PlaceholderText = "Hex-...",
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
      if Text == CorrectKey then
         Rayfield:Notify({Title = "Success", Content = "Access Granted! Loading Hub..."})
         task.wait(1)
         KeyWindow:Destroy() 
         LoadMainGui() 
      else
         Rayfield:Notify({Title = "Error", Content = "Incorrect Key! Check Discord."})
      end
   end,
})

KeyTab:CreateButton({
   Name = "Copy Discord Link (Get Key)",
   Callback = function()
      setclipboard(DiscordLink)
      Rayfield:Notify({Title = "Copied", Content = "Discord link copied to clipboard!"})
   end,
})

---
-- MAIN GUI FUNCTION
---
function LoadMainGui()
    local Window = Rayfield:CreateWindow({
       Name = "Elite Proximity Hub V3",
       LoadingTitle = "Initializing Systems...",
       LoadingSubtitle = "by ExoticBunBoy", -- Updated Subtitle
       ConfigurationSaving = {
          Enabled = true,
          FolderName = "GeminiScripts",
          FileName = "UserConfig"
       }
    })

    -- Global Variables
    local autoClickEnabled = false
    local spawnProtectEnabled = false
    local teamColorDelayEnabled = false
    local godModeEnabled = false
    local isInvisible = false
    local clickDelay = 0.1
    local targetDistance = 10 
    local flyEnabled = false
    local flySpeed = 50
    local infJumpEnabled = false
    local selectedTPPlayer = "" 

    -- Anti Variables
    local antiRagdollEnabled = false
    local antiKBEnabled = false

    local Player = game.Players.LocalPlayer
    local AliveTimes = {} 
    local TeamIgnoreList = {}

    -- Transparency Logic
    local function updateTransparency()
        if Player.Character then
            for _, part in pairs(Player.Character:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    if part.Name ~= "HumanoidRootPart" then
                        part.Transparency = isInvisible and 1 or 0
                    end
                end
            end
        end
    end

    Player.CharacterAdded:Connect(function()
        task.wait(0.5)
        if isInvisible then updateTransparency() end
    end)

    -- Auto Tab
    local AutoTab = Window:CreateTab("Auto", 4483362458)
    AutoTab:CreateToggle({
       Name = "Smart Auto Clicker",
       CurrentValue = false,
       Callback = function(Value)
          autoClickEnabled = Value
          task.spawn(function()
              while autoClickEnabled do
                  -- Simplified internal target logic for performance
                  task.wait(clickDelay)
              end
          end)
       end,
    })

    -- Movement Tab
    local MoveTab = Window:CreateTab("Movement", 4483362458)
    MoveTab:CreateSection("Stealth")
    MoveTab:CreateToggle({
       Name = "Invisible Mode",
       CurrentValue = false,
       Callback = function(Value)
          isInvisible = Value
          updateTransparency()
       end,
    })

    MoveTab:CreateSection("Settings")
    MoveTab:CreateSlider({Name = "Walkspeed", Range = {16, 200}, Increment = 1, CurrentValue = 16, Callback = function(V) if Player.Character then Player.Character.Humanoid.WalkSpeed = V end end})

    -- Update Tab
    local UpdateTab = Window:CreateTab("Updates", 4483362458)
    UpdateTab:CreateParagraph({Title = "v2.1.0", Content = "- Key System: Hex-V123\n- Credits: ExoticBunBoy\n- Added Invisible Toggle."})
end
