local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "Bluusaken",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "BluuSaken",
   LoadingSubtitle = "by LuauIsBluu",
   ShowText = "BluuSaken", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "B", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Forsaken = Window:CreateTab("Forsaken", 4483362458) -- Title, Image

local Section = Forsaken:CreateSection("Scripts (Keyless)")

local Button = Forsaken:CreateButton({
   Name = "Farsaken",
   Callback = function()

if getgenv then
    getgenv().DebugNotifications = "false"
    getgenv().TrackMePlease = "true"
end

loadstring(game:HttpGet("https://raw.githubusercontent.com/ivannetta/ShitScripts/main/forsaken.lua"))()

   end,
})

local Button = Forsaken:CreateButton({
   Name = "Nolsaken",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Syndromehsh/-/refs/heads/ISIS-%E8%A2%AB%E9%81%97%E5%BC%83/%E4%B8%8D%E8%A6%81%E5%91%8A%E8%AF%89%E4%BB%BB%E4%BD%95%E4%BA%BA%E5%93%9F%5B/%E5%B8%8C%E7%9A%AE%E7%AC%91%E8%84%B8%5D"))()
   end,
})

local Button = Forsaken:CreateButton({
   Name = "Kryonion",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ehrerlikesteto/KryOnionrep/refs/heads/main/OnionIsForsaken"))()
   end,
})

local Button = Forsaken:CreateButton({
   Name = "Nullsaken V8",
   Callback = function()
   
loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/forsakenloader.github.io/refs/heads/main/RINGTABUBLIK.lua"))()
   end,
})

local Button = Forsaken:CreateButton({
   Name = "SigmaSaken",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/sigmaboy-sigma-boy/Sigmasaken/refs/heads/main/sigmasakenmain"))()
   end,
})

local Button = Forsaken:CreateButton({
   Name = "Voidsaken",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/voidsaken-script/Voidsaken-Loader/refs/heads/main/main"))()
   end,
})

local Section = Forsaken:CreateSection("Random stuff dude")

local Button = Forsaken:CreateButton({
   Name = "FrontFlip",
   Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/SHRTRYScriptMANhere/stolenahhfrotflip/refs/heads/main/Flip",true))()
   end,
})

local Button = Forsaken:CreateButton({
   Name = "Fe mafioso old skin (Killer)",
   Callback = function()
            
   Rayfield:Notify({
   Title = "Old Mafioso",
   Content = "Running FE Mafioso old skin (execute before round starts!)",
   Duration = 4
})

loadstring(game:HttpGet("https://raw.githubusercontent.com/ImBluuSaken/MafiosoRework/main/script.lua"))()

   end,
})

local Button = Forsaken:CreateButton({
   Name = "Deleted emotes Gui",
   Callback = function()

            Rayfield:Notify({
   Title = "Deleted Emotes",
   Content = "FE Emote hub loaded!",
   Duration = 3
})

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Animations
local animations = {
   ["Breakdance"] = "rbxassetid://13817547409",
   ["Ninja Dance"] = "rbxassetid://13817555883",
   ["Lifelight"] = "rbxassetid://13817537342",
   ["Creepy"] = "rbxassetid://13817528591",
   ["Zombie"] = "rbxassetid://13817518794"
}

-- Sounds
local sounds = {
   ["Breakdance"] = "rbxassetid://9135834140",
   ["Ninja Dance"] = "rbxassetid://1837306447",
   ["Lifelight"] = "rbxassetid://9135834441",
   ["Creepy"] = "rbxassetid://9135834989",
   ["Zombie"] = "rbxassetid://9135835263"
}

-- GUI Setup
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "DeletedEmotesGUI"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 250, 0, 330)
frame.Position = UDim2.new(0.5, -125, 0.5, -165)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 0.15

local layout = Instance.new("UIListLayout", frame)
layout.Padding = UDim.new(0, 4)

for name, animId in pairs(animations) do
   local btn = Instance.new("TextButton", frame)
   btn.Text = "▶ " .. name
   btn.Size = UDim2.new(1, 0, 0, 30)
   btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
   btn.TextColor3 = Color3.fromRGB(255, 255, 255)
   btn.Font = Enum.Font.GothamBold
   btn.TextSize = 14
   btn.MouseButton1Click:Connect(function()
       local anim = Instance.new("Animation")
       anim.AnimationId = animId
       local track = humanoid:LoadAnimation(anim)
       track:Play()

       local sound = Instance.new("Sound", character)
       sound.SoundId = sounds[name]
       sound:Play()
   end)
end

-- Stop button
local stopBtn = Instance.new("TextButton", frame)
stopBtn.Text = "⛔ Stop All"
stopBtn.Size = UDim2.new(1, 0, 0, 30)
stopBtn.BackgroundColor3 = Color3.fromRGB(120, 40, 40)
stopBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
stopBtn.Font = Enum.Font.GothamBold
stopBtn.TextSize = 14
stopBtn.MouseButton1Click:Connect(function()
   for _, sound in pairs(character:GetChildren()) do
       if sound:IsA("Sound") then sound:Stop() end
   end
   for _, track in pairs(humanoid:GetPlayingAnimationTracks()) do
       track:Stop()
   end
end)

   end,
})

local Button = Forsaken:CreateButton({
   Name = "Device Spoofer",
   Callback = function()

local UserInputService = game:GetService("UserInputService")
local Network = require(game.ReplicatedStorage.Modules.Network)

local DeviceSpoof = {}
local ForcedDevice = "Console" -- change to "Mobile", "Console" or "PC"

DeviceSpoof.Changed = Instance.new("BindableEvent").Event
DeviceSpoof.Value = ForcedDevice

local function ApplySpoof()
    DeviceSpoof.Value = ForcedDevice
    Network:FireServerConnection("SetDevice", "REMOTE_EVENT", ForcedDevice)
end

ApplySpoof()

UserInputService.LastInputTypeChanged:Connect(ApplySpoof)

while wait() do
    ApplySpoof()
end

return DeviceSpoof
   end,
})

local Button = Forsaken:CreateButton({
   Name = "Fake block",
   Callback = function()
   
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local currentKey = nil

local function setupCharacter(character)
    local humanoid = character:WaitForChild("Humanoid")
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://72722244508749"
    local animator = humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid)
    local animTrack = animator:LoadAnimation(animation)

    screenGui:ClearAllChildren()

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 100)
    frame.Position = UDim2.new(0.5, -100, 0.5, -50)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = screenGui
    frame.Active = true
    frame.Draggable = true

    local playBtn = Instance.new("TextButton")
    playBtn.Size = UDim2.new(0, 180, 0, 40)
    playBtn.Position = UDim2.new(0, 10, 0, 10)
    playBtn.Text = "Play Animation"
    playBtn.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
    playBtn.TextColor3 = Color3.new(1, 1, 1)
    playBtn.Parent = frame

    playBtn.MouseButton1Click:Connect(function()
        animTrack:Play()
    end)

    local keybindBtn = Instance.new("TextButton")
    keybindBtn.Size = UDim2.new(0, 180, 0, 40)
    keybindBtn.Position = UDim2.new(0, 10, 0, 50)
    keybindBtn.Text = currentKey and ("Set Keybind (Current: " .. tostring(currentKey) .. ")") or "Set Keybind (Current: none)"
    keybindBtn.BackgroundColor3 = Color3.fromRGB(100, 50, 150)
    keybindBtn.TextColor3 = Color3.new(1, 1, 1)
    keybindBtn.TextScaled = true
    keybindBtn.Parent = frame

    local waitingForKey = false

    keybindBtn.MouseButton1Click:Connect(function()
        keybindBtn.Text = "Press a key..."
        waitingForKey = true
    end)

    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if waitingForKey and input.UserInputType == Enum.UserInputType.Keyboard then
            currentKey = input.KeyCode
            keybindBtn.Text = "Set Keybind (Current: " .. tostring(currentKey) .. ")"
            waitingForKey = false
        elseif currentKey and input.KeyCode == currentKey and not gameProcessed then
            animTrack:Play()
        end
    end)
end

if player.Character then
    setupCharacter(player.Character)
end

player.CharacterAdded:Connect(function(char)
    setupCharacter(char)
end)

   end,
})

local Section = Forsaken:CreateSection("tp tool")

--// TP Tool with Input Example
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Find survivors folder (workspace.Players.Survivors)
local survivorsFolder = workspace:FindFirstChild("Players")
    and workspace.Players:FindFirstChild("Survivors")

if not survivorsFolder then
    Rayfield:Notify({
        Title = "Error",
        Content = "Couldn't find workspace.Players.Survivors!",
        Duration = 4
    })
    return
end

-- Store typed survivor name
local survivorName = nil
local survivor = nil

--// Input Box
local Input = Forsaken:CreateInput({
    Name = "Enter Survivor Name",
    CurrentValue = "",
    PlaceholderText = "Example: Guest1337, Noob, 007n7",
    RemoveTextAfterFocusLost = false,
    Flag = "SurvivorInput",
    Callback = function(Text)
        survivorName = Text
        survivor = survivorsFolder:FindFirstChild(Text)

        if survivor then
            Rayfield:Notify({
                Title = "✅ Survivor Found",
                Content = "Found survivor: " .. Text,
                Duration = 3
            })
        else
            Rayfield:Notify({
                Title = "❌ Not Found",
                Content = "No survivor named '" .. Text .. "' found.",
                Duration = 3
            })
        end
    end,
})

--// Button to give TP Tool
local GiveToolButton = Forsaken:CreateButton({
    Name = "Give tp Tool",
    Callback = function()
        if not survivor or not survivorName then
            Rayfield:Notify({
                Title = "Error",
                Content = "Enter a valid survivor name first!",
                Duration = 3
            })
            return
        end

        -- Create tp Tool
        local tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "[click 2 tp]"

        -- Teleport the survivor when tool is activated
        tool.Activated:connect(function()  -- <-- use connect like old version
            if survivor and survivor:FindFirstChild("HumanoidRootPart") then
                local pos = mouse.Hit.Position + Vector3.new(0, 2.5, 0)
                survivor.HumanoidRootPart.CFrame = CFrame.new(pos)
            else
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Survivor not valid anymore.",
                    Duration = 3
                })
            end
        end)

        -- Parent the tool directly to the survivor
        tool.Parent = survivor

        Rayfield:Notify({
            Title = "Success",
            Content = "TP Tool attached to survivor: " .. survivorName,
            Duration = 3
        })
    end,
})

local Section = Forsaken:CreateSection("tp gui")

local Button = Forsaken:CreateButton({
   Name = "tp gui",
   Callback = function()
   local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

-- Colors
local bluuColor = Color3.fromRGB(121,156,208) -- #799cd0
local blackColor = Color3.fromRGB(0,0,0)

-- Create mini GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MiniTPGUI"
screenGui.Parent = game.CoreGui

-- Notification function
local function notify(title, text, duration)
    local notif = Instance.new("TextLabel")
    notif.Size = UDim2.new(0,250,0,50)
    notif.Position = UDim2.new(0.5,-125,0.05,0)
    notif.BackgroundColor3 = blackColor
    notif.TextColor3 = bluuColor
    notif.TextScaled = true
    notif.Text = title.."\n"..text
    notif.Parent = screenGui

    delay(duration, function()
        notif:Destroy()
    end)
end

notify("Mini TP", "Loaded! Drag and click TP ON/OFF", 3)

-- Main frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,160,0,80)
frame.Position = UDim2.new(0.85,0,0.05,0) -- corner
frame.BackgroundColor3 = blackColor
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

-- TP toggle button
local tpToggle = Instance.new("TextButton")
tpToggle.Size = UDim2.new(1, -10, 0, 50)
tpToggle.Position = UDim2.new(0,5,0,15)
tpToggle.Text = "TP: OFF"
tpToggle.BackgroundColor3 = blackColor
tpToggle.TextColor3 = bluuColor
tpToggle.TextScaled = true
tpToggle.Parent = frame

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0,25,0,25)
closeBtn.Position = UDim2.new(1,-30,0,5)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = blackColor
closeBtn.TextColor3 = bluuColor
closeBtn.TextScaled = true
closeBtn.Parent = frame

local tpOn = false

tpToggle.MouseButton1Click:Connect(function()
    tpOn = not tpOn
    tpToggle.Text = tpOn and "TP: ON" or "TP: OFF"
end)

closeBtn.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Teleport logic
mouse.Button1Down:Connect(function()
    if tpOn and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
        local pos = mouse.Hit.Position + Vector3.new(0,2.5,0)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end)

   end,
})

