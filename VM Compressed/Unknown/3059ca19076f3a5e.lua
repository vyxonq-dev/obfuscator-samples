local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
 
local Window = Rayfield:CreateWindow({
   Name = "Supercool Universal Gui",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Have fun! (dont abuse plz)",
   LoadingSubtitle = "DISCORD -> gg/mpZH7rhG6G",
   Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes
 
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface
 
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "TSBTPGUI"
   },
 
   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
 
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key system",
      Subtitle = "Key System",
      Note = "Get the key from the dev of this script @verycoolprofile --discord", -- Use this to tell the user how to get a key
      FileName = "TSBGUIKey", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = true, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"https://pastebin.com/raw/vmbHT2qC"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})
 
local MainTab = Window:CreateTab("Universal", 4483362458) -- Title, Image
 
 
Rayfield:Notify({
   Title = "Script",
   Content = "Executed Succesfully!",
   Duration = 6.5,
   Image = 4483362458,
})
 
local Button = MainTab:CreateButton({
   Name = "Teleport (r to go back t to go further)",
   Callback = function()
   -- LocalScript (Place this in StarterPlayer -> StarterPlayerScripts)
 
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
-- Function to move the player
local function movePlayer(offset)
    humanoidRootPart.CFrame = humanoidRootPart.CFrame * CFrame.new(offset)
end
 
-- Listen for the key press events
local userInputService = game:GetService("UserInputService")
 
userInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end  -- Ignore if the game is processing the input already
 
    if input.KeyCode == Enum.KeyCode.R then
        -- Move the player back 34 studs (negative Z direction)
        movePlayer(Vector3.new(0, 0, 34)) -- Moving back means negative Z axis in Roblox
    elseif input.KeyCode == Enum.KeyCode.T then
        -- Move the player forward 48.5 studs (positive Z direction)
        movePlayer(Vector3.new(0, 0, -48.5)) -- Moving forward means positive Z axis in Roblox
    end
end)
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "inf yield",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Fix velocity (USE THIS BEFORE EXECUTING SCRIPTS)",
   Callback = function()
   getgenv().gethui = function() return game.CoreGui end
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "fly",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "A-Train (tsb garou script)",
   Callback = function()
   loadstring(game:HttpGet("https://paste.ee/r/AnZ5j"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "slap battles (op)",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/decryp1/slap-battles-script/refs/heads/main/Herkle%20Hub%20Private'))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "slap battles anti cheat bypasser",
   Callback = function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/BypassAntiCheat/main/main.lua'))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "mm2 (speedX)",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Au0yX/Community/main/XhubMM2"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "fisch (zenith hub)",
   Callback = function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Efe0626/RaitoHub/refs/heads/main/Script"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "babft (ather hub)",
   Callback = function()
   loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2529a5f9dfddd5523ca4e22f21cceffa.lua"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "tsb venox hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/DiosDi/VexonHub/main/TSB-VexonHub"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "tsb phantasm rewrite",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/ATrainz/Phantasm/refs/heads/main/Phantasm.lua"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "fling things and people (blitz cracked)",
   Callback = function()
   loadstring(game:HttpGet("https://you.whimper.xyz/blitz"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "unfair hub",
   Callback = function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/rbIxscriptsnet/unfair/main/rblxhub.lua'),true))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "luckyblocks battlegrounds",
   Callback = function()
   pcall(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/n0raxd/lucky-block-stuff/refs/heads/main/this-shit-so-old.lua",true))()
end)
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Black hole script (unanchored parts bring)",
   Callback = function()
   local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
 
local angle = 1
local radius = 10
local blackHoleActive = false
 
local function setupPlayer()
    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
 
    local Folder = Instance.new("Folder", Workspace)
    local Part = Instance.new("Part", Folder)
    local Attachment1 = Instance.new("Attachment", Part)
    Part.Anchored = true
    Part.CanCollide = false
    Part.Transparency = 1
 
    return humanoidRootPart, Attachment1
end
 
local humanoidRootPart, Attachment1 = setupPlayer()
 
if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(14.46262424, 14.46262424, 14.46262424)
    }
 
    Network.RetainPart = function(part)
        if typeof(part) == "Instance" and part:IsA("BasePart") and part:IsDescendantOf(Workspace) then
            table.insert(Network.BaseParts, part)
            part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
            part.CanCollide = false
        end
    end
 
    local function EnablePartControl()
        LocalPlayer.ReplicationFocus = Workspace
        RunService.Heartbeat:Connect(function()
            sethiddenproperty(LocalPlayer, "SimulationRadius", math.huge)
            for _, part in pairs(Network.BaseParts) do
                if part:IsDescendantOf(Workspace) then
                    part.Velocity = Network.Velocity
                end
            end
        end)
    end
 
    EnablePartControl()
end
 
local function ForcePart(v)
    if v:IsA("Part") and not v.Anchored and not v.Parent:FindFirstChild("Humanoid") and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then
        for _, x in next, v:GetChildren() do
            if x:IsA("BodyAngularVelocity") or x:IsA("BodyForce") or x:IsA("BodyGyro") or x:IsA("BodyPosition") or x:IsA("BodyThrust") or x:IsA("BodyVelocity") or x:IsA("RocketPropulsion") then
                x:Destroy()
            end
        end
        if v:FindFirstChild("Attachment") then
            v:FindFirstChild("Attachment"):Destroy()
        end
        if v:FindFirstChild("AlignPosition") then
            v:FindFirstChild("AlignPosition"):Destroy()
        end
        if v:FindFirstChild("Torque") then
            v:FindFirstChild("Torque"):Destroy()
        end
        v.CanCollide = false
 
        local Torque = Instance.new("Torque", v)
        Torque.Torque = Vector3.new(1000000, 1000000, 1000000)
        local AlignPosition = Instance.new("AlignPosition", v)
        local Attachment2 = Instance.new("Attachment", v)
        Torque.Attachment0 = Attachment2
        AlignPosition.MaxForce = math.huge
        AlignPosition.MaxVelocity = math.huge
        AlignPosition.Responsiveness = 500
        AlignPosition.Attachment0 = Attachment2
        AlignPosition.Attachment1 = Attachment1
    end
end
 
local function toggleBlackHole()
    blackHoleActive = not blackHoleActive
    if blackHoleActive then
        for _, v in next, Workspace:GetDescendants() do
            ForcePart(v)
        end
 
        Workspace.DescendantAdded:Connect(function(v)
            if blackHoleActive then
                ForcePart(v)
            end
        end)
 
        spawn(function()
            while blackHoleActive and RunService.RenderStepped:Wait() do
                angle = angle + math.rad(2)
 
                local offsetX = math.cos(angle) * radius
                local offsetZ = math.sin(angle) * radius
 
                Attachment1.WorldCFrame = humanoidRootPart.CFrame * CFrame.new(offsetX, 0, offsetZ)
            end
        end)
    else
        Attachment1.WorldCFrame = CFrame.new(0, -1000, 0)
    end
end
 
LocalPlayer.CharacterAdded:Connect(function()
    humanoidRootPart, Attachment1 = setupPlayer()
    if blackHoleActive then
        toggleBlackHole()
    end
end)
 
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local window = library:Window("Projeto LKB")
 
window:Slider("Radius Blackhole",1,100,10, function(Value)
   radius = Value
end)
 
window:Toggle("Blackhole", true, function(Value)
       if Value then
            toggleBlackHole()
        else
            blackHoleActive = false
        end
end)
 
spawn(function()
    while true do
        RunService.RenderStepped:Wait()
        if blackHoleActive then
            angle = angle + math.rad(angleSpeed)
        end
    end
end)
 
toggleBlackHole()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "bloxfruits (redz hub)",
   Callback = function()
   local Settings = {
  JoinTeam = "Pirates"; -- Pirates/Marines
  Translator = true; -- true/false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/newredz/BloxFruits/refs/heads/main/Source.luau"))(Settings)
   end,
})
 
local MainTab = Window:CreateTab("Carry people simulator 3", 4483362458) -- Title, Image
 
local Button = MainTab:CreateButton({
   Name = "Full anti cheat bypass (use this before exploting)",
   Callback = function()
   local old
old = hookmetamethod(game,  "__namecall", function(self, ...)
    local method = getnamecallmethod()
 
    if method == "Kick" and self == game.Players.LocalPlayer then
        print("thanks @henrickiscool for bypasser (game tried to kick you)")
        return
    end
    return old(self, ...)
 
end)
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "warp hub",
   Callback = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Forkion2dev/Warp-hub-3/refs/heads/main/Warp%20hub(main)"))()
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Teleport to a secret map :0",
   Callback = function()
   -- Define the target position
local targetPosition = Vector3.new(-5012, 129, 343)
 
-- Get the player's character
local player = game.Players.LocalPlayer
local character = player.Character
 
-- Check if the character exists
if character then
    -- Teleport the player's character to the target position
    character:SetPrimaryPartCFrame(CFrame.new(targetPosition))
else
    warn("Character not found!")
end
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "cage1 (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Cage1"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "cage2 (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Cage2"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "cage3 (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Cage3"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "cage4 (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Cage4"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "shark kill (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Shark"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "kill or bug the player (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Guillotine"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Catapult kill (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Catapult"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})

local Button = MainTab:CreateButton({
   Name = "Machine (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Machine"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})

local Button = MainTab:CreateButton({
   Name = "Machine 2 (grab a person first)",
   Callback = function()
   local args = {
    [1] = "Machine2"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})

local Button = MainTab:CreateButton({
   Name = "Vending Machine (grab a person first)",
   Callback = function()
   local args = {
    [1] = "VendingMachine"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})

local Button = MainTab:CreateButton({
   Name = "Vending Machine 2 (grab a person first)",
   Callback = function()
   local args = {
    [1] = "VendingMachine2"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})

local Button = MainTab:CreateButton({
   Name = "Vending Machine 3 (grab a person first)",
   Callback = function()
   local args = {
    [1] = "VendingMachine3"
}
 
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ActivateButton"):FireServer(unpack(args))
 
   end,
})
 
local MainTab = Window:CreateTab("Theme", 4483362458) -- Title, Image
 
local Button = MainTab:CreateButton({
   Name = "Default",
   Callback = function()
   Window.ModifyTheme('Default')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Amber Glow",
   Callback = function()
   Window.ModifyTheme('AmberGlow')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Amethyst",
   Callback = function()
   Window.ModifyTheme('Amethyst')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Dark Blue",
   Callback = function()
   Window.ModifyTheme('DarkBlue')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Bloom",
   Callback = function()
   Window.ModifyTheme('Bloom')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Green",
   Callback = function()
   Window.ModifyTheme('Green')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Light",
   Callback = function()
   Window.ModifyTheme('Light')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Ocean",
   Callback = function()
   Window.ModifyTheme('Ocean')
   end,
})
 
local Button = MainTab:CreateButton({
   Name = "Serenity",
   Callback = function()
   Window.ModifyTheme('Serenity')
   end,
})