local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "XqzuaCheats [Beta]",
    LoadingTitle = "Enjoy",
    LoadingSubtitle = "by xqzua_ozai",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "Big Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "ScripHub",
       Subtitle = "Key System",
       Note = "Try to guess the key: ₲₵₲",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"GCG"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })

 local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image

 local Section = Tab:CreateSection("AnyGame")

 local Button = Tab:CreateButton({
    Name = "infiniteYield [OP]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() 
    end
 })

 local Button = Tab:CreateButton({
    Name = "Aimlock",
    Callback = function()
    -- The function that takes place when the button is pressed
    -- this script is so Powerful does not like other Aimbot Which this script Make you become God Being like aim
-- Script Aimbot Advanced v1 Developed by Mawin_CK and https://pastebin.com/u/SigmaBoy456 Writed by Mawin_CK and Fixed by Mawin_CK
-- this script make you Able to Automatically Aimlock Instantly at Player Head who nearest to you and not behind wall 
-- Press T to Target Teammate or not Teammate
-- Press Y To turn off and On Aimbot
-- Reccmond must have Good Device and WiFi or else sometime is can lag For only Mobile Player Except PC player
local player = game.Players.LocalPlayer
local Cam = workspace.CurrentCamera

-- Toggles setting set to False or True to toggle rejoin if you want to re settings 
local targetTeammates = true  -- Initially, target non-teammates or teammate
local aimbotActive = true  -- Initial state of the aimbot

-- Function to check if a player is a teammate
local function isTeammate(targetPlayer)
    return targetPlayer.Team == player.Team
end

-- Function to look at a specific position
local function lookAt(targetPosition)
    Cam.CFrame = CFrame.new(Cam.CFrame.Position, targetPosition)
end

-- Function to check if a target is visible (not behind walls)
local function isTargetVisible(targetPart)
    local origin = Cam.CFrame.Position
    local direction = (targetPart.Position - origin).Unit
    local ray = Ray.new(origin, direction * 5000)
    local part, position = workspace:FindPartOnRayWithIgnoreList(ray, {player.Character, Cam})
    
    return part and part:IsDescendantOf(targetPart.Parent)
end

-- Function to get the closest player to the local player
local function getClosestPlayer(trg_part)
    local nearest = nil
    local lastDistance = math.huge
    local localPlayerPos = player.Character.PrimaryPart.Position
    
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player and v.Character and v.Character:FindFirstChild(trg_part) and v.Character:FindFirstChild("Humanoid") then
            local head = v.Character[trg_part]
            local humanoid = v.Character.Humanoid
            if head and humanoid.Health > 0 then  -- Check if the target is alive
                local distance = (localPlayerPos - head.Position).Magnitude
                
                -- Check visibility, distance, and teammate status
                if distance < lastDistance and isTargetVisible(head) then
                    if (targetTeammates and isTeammate(v)) or (not targetTeammates and not isTeammate(v)) then
                        nearest = v
                        lastDistance = distance
                    end
                end
            end
        end
    end
    
    return nearest
end

-- Toggle function to switch between targeting teammates and non-teammates
local function toggleTargetMode()
    targetTeammates = not targetTeammates
    print("Targeting", targetTeammates and "teammates" or "non-teammates")
end

-- Function to toggle aimbot activation
local function toggleAimbot()
    aimbotActive = not aimbotActive
    print("Aimbot", aimbotActive and "enabled" or "disabled")
end

-- RenderStepped connection to perform aiming
game:GetService("RunService").RenderStepped:Connect(function()
    if aimbotActive then
        local closestPlayer = getClosestPlayer("Head")
        if closestPlayer and closestPlayer.Character and closestPlayer.Character:FindFirstChild("Head") then
            lookAt(closestPlayer.Character.Head.Position)
        end
    end
end)

-- Input binding for toggling targeting mode and aimbot (e.g., press 'T' to toggle targeting mode, press 'Y' to toggle aimbot)
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Keyboard then
        if input.KeyCode == Enum.KeyCode.T then
            toggleTargetMode()
        elseif input.KeyCode == Enum.KeyCode.Y then
            toggleAimbot()
        end
    end
end)

-- Mobile support for toggling aimbot and targeting mode
local UIS = game:GetService("UserInputService")

UIS.TouchTap:Connect(function(touchPositions, processed)
    if not processed then
        local touch = touchPositions[1]
        if touch.Position.Y < workspace.CurrentCamera.ViewportSize.Y / 2 then
            toggleAimbot()
        else
            toggleTargetMode()
        end
    end
end)
    end
 })

 local Button = Tab:CreateButton({
    Name = "ChatBypasser",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/shadow62x/catbypass/main/upfix"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Fling all",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://gist.githubusercontent.com/b00jkidd/56216989fe84ced1ffdd19339d5e8b6d/raw/af1d76a7f7c8f5dbacee9e9496e244aba888b5ff/fling%2520all"))()
    end
 })

 local Section = Tab:CreateSection("Da Hood")

 local Button = Tab:CreateButton({
    Name = "Fake Macro [Press Q]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://pastebin.com/raw/QW5Whap9"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "TBO",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/cool5013/TBO/main/TBOscript'))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Visoin Hub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/lqmc-da-hood/main/lqmc%20da%20hood"))();
    end
 })

 local Button = Tab:CreateButton({
    Name = "laeraz",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "7hbl",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7hbl/da-hood/main/da%20hood"))();
    end
 })

 local Button = Tab:CreateButton({
    Name = "Vortex",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineProUser/vortexdahood/main/vortex", true))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Polakaya [OP]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/pixelheadx/Polakya/main/Bestscript.md"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "AzureModded",
    Callback = function()
    -- The function that takes place when the button is pressed
    --[[
############################################################################
#     _     ______   _ ____  _____   __  __  ___  ____  ____  _____ ____   #
#    / \   |__  / | | |  _ \| ____| |  \/  |/ _ \|  _ \|  _ \| ____|  _ \  #
#   / _ \    / /| | | | |_) |  _|   | |\/| | | | | | | | | | |  _| | | | | #
#  / ___ \  / /_| |_| |  _ <| |___  | |  | | |_| | |_| | |_| | |___| |_| | #
# /_/   \_\/____|\___/|_| \_\_____| |_|  |_|\___/|____/|____/|_____|____/  #
#                                                                          #
#  _                   _        _                                          #
# | |__  _   _        / \   ___| |_ _   _ _ __ _ __                        #
# | '_ \| | | |      / _ \ / __| __| | | | '__| '_ \                       #
# | |_) | |_| |     / ___ \ (__| |_| |_| | |  | | | |                      #
# |_.__/ \__, |    /_/   \_\___|\__|\__, |_|  |_| |_|                      #
#        |___/                      |___/                                  #
############################################################################

Actyrn or discord.gg/azuremodded or discord.gg/hUvujCnGMb
Original script credits go to Elegant and Weda
--]]

loadstring(game:HttpGet("https://raw.githubusercontent.com/Actyrn/Scripts/main/AzureModded"))()
    end
 })

 local Section = Tab:CreateSection("Murder Mystery 2")

 local Button = Tab:CreateButton({
    Name = "SanpSanix",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Roman34296589/SnapSanix-GUI-MM2/main/SnapSanix%20GUI%20mm2.lua'))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "nexus",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/s-o-a-b/nexus/main/loadstring"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Ski Hub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet(("https://pastebin.com/raw/mT10xnt7"), true))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "R3th Priv",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/R3TH-PRIV/R3THPRIV/main/loader.lua'))()
    end
 })

 local Section = Tab:CreateSection("Counter Blox")

 local Button = Tab:CreateButton({
    Name = "pissblox",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua",true))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Happy-Hub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/uedan228/Happy-Hub/main/Counter%20Blox%3A%20Source%202"))()
    end
 })

 local Section = Tab:CreateSection("Blade ball")

 local Button = Tab:CreateButton({
    Name = "Nexam Hub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6af56c1753ac6679dee3acbd1fd952e5.lua"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "FFJ1",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
    end
 })

 local Button = Tab:CreateButton({
   Name = "EmixHub",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet("https://raw.githubusercontent.com/EminenceXLua/Blade-your-Balls/main/BladeBallLoader.lua"))()
   end
})

 local Section = Tab:CreateSection("Build a Boat")

 local Button = Tab:CreateButton({
    Name = "AutoFarm",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://scriptblox.com/raw/Build-A-Boat-For-Treasure-utoFrm-Gold-13684"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "AutoBuild",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/max2007killer/auto-build-not-limit/main/autobuild.txt"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Boo Hub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/zachisfunny/Build-a-Boat-OP-Script/main/Script'),true))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "ZeeroxHub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()
    end
 })

 local Section = Tab:CreateSection("Sols Rng")

 local Button = Tab:CreateButton({
    Name = "nameless[ERROR]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/MercyfulSmoked/Xeo/main/Main.lua'))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "EruditeHub[DISABLE]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ThacG/EruditeHub/main/Sol's%20RNG/V1.69"))()
    end
 })

 local Section = Tab:CreateSection("kat")

 local Button = Tab:CreateButton({
    Name = "BelugaWare",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/scripter1cursed1rade/BelugaWare-1.4/main/belugaware.lua"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "+Plus",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/NaikoScript/Kat-Plus/main/Script"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "AirHub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
    end
 })

 local Section = Tab:CreateSection("Prison Life")

 local Button = Tab:CreateButton({
    Name = "PrisonWare [TRASH]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "PrizzLife [GOOD]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "MercuryHub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/WinterDinder/56-Clubs-Prison-Life-REMASTERED-SCRIPT/main/Main", true))()
    end
 })

 local Section = Tab:CreateSection("Life in Prison")

 local Button = Tab:CreateButton({
    Name = "Hitbox (small)",
    Callback = function()
    -- The function that takes place when the button is pressed
    local players = game:GetService("Players")
local local_player = players.LocalPlayer
local run_service = game:GetService("RunService")
local starter_gui = game:GetService("StarterGui")

local function extend_hitboxes(delta_time)
    local character = local_player.Character

    if not character then
        return
    end

    local humanoid_root_part = character:FindFirstChild("HumanoidRootPart")

    if not humanoid_root_part then
        return
    end

    for _, player in pairs(players:GetPlayers()) do
        if player == local_player then
            continue
        end

        local player_character = player.Character
        
        if not player_character then
            continue
        end

        local player_humanoid_root_part = player_character:FindFirstChild("HumanoidRootPart")

        if not player_humanoid_root_part then
            continue
        end

        local are_touching = false

        for _, part in pairs(workspace:GetPartsInPart(player_humanoid_root_part)) do
            if part:IsDescendantOf(character) then
                are_touching = true
                break
            end
        end

        if player.Team == local_player.Team or are_touching then
            player_humanoid_root_part.Size = Vector3.new(8, 8, 8)
            player_humanoid_root_part.Transparency = 0.95
            player_humanoid_root_part.BrickColor = player.Team.TeamColor
            player_humanoid_root_part.Shape = Enum.PartType.Ball
            player_humanoid_root_part.CanCollide = false
            continue
        end

        player_humanoid_root_part.Size = Vector3.new(8, 8, 8)
        player_humanoid_root_part.Transparency = 0.7
        player_humanoid_root_part.BrickColor = player.Team.TeamColor
        player_humanoid_root_part.Shape = Enum.PartType.Ball
        player_humanoid_root_part.CanCollide = true
    end
end

run_service.Stepped:Connect(extend_hitboxes)

starter_gui:SetCore("SendNotification", {
    Title = "LOADING";
    Text = "BY: H4X";
    Icon = "rbxassetid://12794329333";
})
    end
 })

 local Button = Tab:CreateButton({
   Name = "Hitbox (Big)",
   Callback = function()
   -- The function that takes place when the button is pressed
   --[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
--[[
    WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- leave a like pls

_G.HeadSize = Vector3.new(12, 12, 12) -- Adjust this value as needed
_G.HumanoidRootPartSize = Vector3.new(5, 5, 5) -- Adjust this value as needed
_G.Disabled = false

local localPlayer = game:GetService('Players').LocalPlayer

local function scaleHitbox(character)
    if character then
        local head = character:FindFirstChild("Head")
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

        if head then
            local mesh = head:FindFirstChildOfClass("SpecialMesh")
            if mesh then
                mesh.Scale = Vector3.new(_G.HeadSize.X / head.Size.X, _G.HeadSize.Y / head.Size.Y, _G.HeadSize.Z / head.Size.Z)
            else
                -- If the head doesn't have a SpecialMesh, create one
                local newMesh = Instance.new("SpecialMesh", head)
                newMesh.Scale = Vector3.new(_G.HeadSize.X / head.Size.X, _G.HeadSize.Y / head.Size.Y, _G.HeadSize.Z / head.Size.Z)
            end
            head.Size = _G.HeadSize
            head.CanCollide = false -- Disable collision for the head
        end

        if humanoidRootPart then
            humanoidRootPart.Size = _G.HumanoidRootPartSize
            humanoidRootPart.Transparency = 0.7
            humanoidRootPart.BrickColor = BrickColor.new("Really blue")
            humanoidRootPart.Material = "Neon"
            humanoidRootPart.CanCollide = false
        end
    end
end

local function resizeParts(character)
    local head = character:FindFirstChild("Head")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if not head then
        -- Create a new head if it doesn't exist
        local newHead = Instance.new("Part")
        newHead.Name = "Head"
        newHead.Size = _G.HeadSize
        newHead.Parent = character
    else
        head.Size = _G.HeadSize
        head.CanCollide = false -- Disable collision for the head
    end

    if humanoidRootPart then
        humanoidRootPart.Size = _G.HumanoidRootPartSize
    end
end

local function onCharacterAdded(character)
    -- Wait for the character to load completely
    character:WaitForChild("Humanoid")

    -- Resize parts
    resizeParts(character)

    -- Connect to Humanoid's Died event to handle respawn
    character:WaitForChild("Humanoid").Died:Connect(function()
        -- Wait for the character to respawn
        character:WaitForChild("Humanoid").Died:Wait()

        -- Resize parts again after respawn
        resizeParts(character)
    end)
end

local function onPlayerAdded(player)
    -- Check if the player is not the local player
    if player ~= localPlayer then
        -- Connect to the CharacterAdded event
        player.CharacterAdded:Connect(onCharacterAdded)

        -- Apply resizing if the character already exists
        if player.Character then
            onCharacterAdded(player.Character)
        end
    end
end

-- Connect to the PlayerAdded event to handle players joining the game
game:GetService('Players').PlayerAdded:Connect(onPlayerAdded)

-- Apply resizing to all current players
for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
    onPlayerAdded(player)
end

-- Continuous loop to ensure hitboxes remain scaled
game:GetService('RunService').RenderStepped:Connect(function()
    if not _G.Disabled then
        for _, player in pairs(game:GetService('Players'):GetPlayers()) do
            if player ~= localPlayer then
                pcall(function() 
                    scaleHitbox(player.Character)
                    -- Ensure head size is maintained
                    if player.Character and player.Character:FindFirstChild("Head") then
                        player.Character.Head.Size = _G.HeadSize
                        player.Character.Head.CanCollide = false -- Disable collision for the head
                    end
                end)
            end
        end
    end
end)

-- Disable collision with the local player's character
localPlayer.CharacterAdded:Connect(disableCollision)

if localPlayer.Character then
    disableCollision(localPlayer.Character)
end

   end
})

 local Section = Tab:CreateSection("Brookheaven")

 local Button = Tab:CreateButton({
    Name = "CarFly",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xlykor/MikeBayraktarCarFly/main/CarFly"))()
    end
 })

 local Section = Tab:CreateSection("Arsenal")

 local Button = Tab:CreateButton({
    Name = "midnightcc",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/laeraz/midnightcc/main/public.lua"))()
    end
 })

 local Button = Tab:CreateButton({
    Name = "Leg Hub",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://pastebin.com/raw/G6Ubkkuv"))()
    end
 })

 local Section = Tab:CreateSection("Ninja Legends")

 local Button = Tab:CreateButton({
    Name = "Ninja Legnends [OP]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet(("https://raw.githubusercontent.com/AppleScript001/Ninjas_Legends/main/README.md"),true))()
    end
 })

 local Section = Tab:CreateSection("FE")

 local Button = Tab:CreateButton({
   Name = "Sad Boy [BUGGED]",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet("https://pastebin.com/raw/hgPJbwF0"))()
   end
})

local Button = Tab:CreateButton({
   Name = "Car",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexCr4sh/FeScripts/main/FeCarScript.lua", true))()
   end
})

local Button = Tab:CreateButton({
   Name = "Honored[NOT WORKING]",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cortzalno666/NectoVerse-Industries-Data/master/Scripts%20Folder/Honored.lua'),true))()
   end
})

local Button = Tab:CreateButton({
    Name = "Silly",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fe-Silly-animation-V4-16636"))()
    end
 })

local Section = Tab:CreateSection("The Strongest battle ground")

local Button = Tab:CreateButton({
    Name = "GoJo",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Doumaix/qqwrxxxx/main/gojo_v2.4.lua"))()
    end
 })

 local Section = Tab:CreateSection("Rivals")

 local Button = Tab:CreateButton({
    Name = "slientAim[TRASH]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cracklua/cracks/m/SilentRivals"))() 
    end
 })

 local Tab = Window:CreateTab("ChatGpt", 4483362458) -- Title, Image

 local Button = Tab:CreateButton({
   Name = "Aimlock[Press E]",
   Callback = function()
   -- The function that takes place when the button is pressed
   loadstring(game:HttpGet("https://pastebin.com/raw/g13WgXm7"))()
   end
})

local Button = Tab:CreateButton({
    Name = "Esp[Press N]",
    Callback = function()
    -- The function that takes place when the button is pressed
    loadstring(game:HttpGet("https://pastebin.com/raw/kP7JuxZv"))()
    end
 })

 local Tab = Window:CreateTab("Info", 4483362458) -- Title, Image

 local Label = Tab:CreateLabel("Created By: xqzua_ozai")

 local Label = Tab:CreateLabel("YouTube: youtube.com/@XqzuaOzai")

 local Paragraph = Tab:CreateParagraph({Title = "Discord: xqzua_ozai", Content = "Dm me if something is wrong."})

-- // GUI TO LUA \\ --

-- // INSTANCES: 3 | SCRIPTS: 0 | MODULES: 0 \\ --

local UI = {}

-- // StarterGui.ScreenGui \\ --
UI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))
UI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling

-- // StarterGui.ScreenGui.Frame \\ --
UI["2"] = Instance.new("Frame", UI["1"])
UI["2"]["BorderSizePixel"] = 0
UI["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["2"]["Size"] = UDim2.new(0, 268, 0, 72)
UI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["2"]["BackgroundTransparency"] = 1

-- // StarterGui.ScreenGui.Frame.TextLabel \\ --
UI["3"] = Instance.new("TextLabel", UI["2"])
UI["3"]["BorderSizePixel"] = 0
UI["3"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255)
UI["3"]["TextSize"] = 57
UI["3"]["FontFace"] = Font.new([[rbxasset://fonts/families/DenkOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal)
UI["3"]["TextColor3"] = Color3.fromRGB(0, 0, 0)
UI["3"]["BackgroundTransparency"] = 1
UI["3"]["Size"] = UDim2.new(0, 268, 0, 72)
UI["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0)
UI["3"]["Text"] = [[XqzuaVX]]


return UI["1"], require;