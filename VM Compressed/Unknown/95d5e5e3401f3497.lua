-- Place ID for Slap Battles
local slapBattlesPlaceId = 6403373529  -- This is the current PlaceId for Slap Battles

-- Check if the player is in the right game
if game.PlaceId ~= slapBattlesPlaceId then
    -- Kick the player if they are not in the right game
    game.Players.LocalPlayer:Kick("Go In The Right Game 'Slap Battles'!")
else
    -- Your code for executing the script when in Slap Battles
    -- Example: print a message in the output
    print("You are in the correct game! Executing script...")
    
    local Library = loadstring(game:HttpGet("https://pastebin.com/raw/Q69rcHsK"))()
local Window = Library.CreateLib("Slap Battles Hub", "DarkTheme")

local Tab = Window:NewTab("Home")

local Section = Tab:NewSection("Home!")

Section:NewLabel("Youtube: The Editer Man + Scripter")

Section:NewLabel("Thank For Using My Script!")

Section:NewLabel("By SHUTTHISDOWNORZLSE On Rbx")

local Tab = Window:NewTab("Cheats")

local Section = Tab:NewSection("Badges")

Section:NewLabel("Get Orange Badge")

Section:NewButton("Get The Orange Badge", "Free Badge", function()
fireclickdetector(game.Workspace.Arena.island5.Orange.ClickDetector)
end)

Section:NewLabel("Get Court Evidance Badge")

Section:NewButton("Get Court Evidance Badge", "Free Badge", function()
fireclickdetector(game.Workspace.Lobby.Scene.knofe.ClickDetector)
end)

Section:NewLabel("Get Rubber Ducky Badge")

Section:NewButton("Get Rubber Ducky Badge", "Free Badge", function()
fireclickdetector(game.Workspace.Arena["default island"]["Rubber Ducky"].ClickDetector)
end)

Section:NewLabel("Get Tycoon")

Section:NewButton("Get Tycoon", "Get Tycoon", function()
repeat task.wait()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,-2,0) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
until game.Players.LocalPlayer.PlayerGui.PlateIndicator.TextLabel.Text == "Plate Counter: 600"
end)

Section:NewLabel("Get Elude")

Section:NewButton("Get Elude", "Get Elude", function()
local teleportFunc = queueonteleport or queue_on_teleport
if teleportFunc then
    teleportFunc([[
        if not game:IsLoaded() then
            game.Loaded:Wait()
        end
        repeat wait() until game.Players.LocalPlayer
        game:GetService("RunService").RenderStepped:Connect(function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-502.336, 14.228, -179.597)
        end)
game:GetService("TeleportService"):Teleport(6403373529)
    ]])
end
game:GetService("TeleportService"):Teleport(11828384869)
end)

Section:NewLabel("Get Ice Skate")

Section:NewButton("Get Ice Skate", "Get Ice Skate", function()
local args = {
    [1] = "Freeze"
}

game:GetService("ReplicatedStorage"):WaitForChild("IceSkate"):FireServer(unpack(args))
end)

Section:NewLabel("Anti's")

Section:NewToggle("Anti Portal", "Anti Portals", function(Value)
AntiPortal = Value
if AntiPortal == true then
workspace.Lobby.Teleport2.CanTouch = false
workspace.Lobby.Teleport3.CanTouch = false
workspace.Lobby.Teleport4.CanTouch = false
workspace.Lobby.Teleport6.CanTouch = false
else
workspace.Lobby.Teleport2.CanTouch = true
workspace.Lobby.Teleport3.CanTouch = true
workspace.Lobby.Teleport4.CanTouch = true
workspace.Lobby.Teleport6.CanTouch = true
end

-- Create a notification on Roblox CoreGui

local CoreGui = game:GetService("CoreGui")

-- Function to show the notification
local function showNotification(title, text)
    -- Setting the notification properties
    CoreGui:SetCore("SendNotification", {
        Title = title; -- The title of the notification
        Text = text; -- The message/text of the notification
        Icon = ""; -- Optionally, you can add an icon, leave it empty for no icon
        Duration = 5; -- The notification will last for 5 seconds
    })
end

-- Example of calling the function
showNotification("Anti Portal", "Anti Portal Activated")
end)

Section:NewToggle("Anti Void", "Anti Void", function(Value)
game.Workspace.dedBarrier.CanCollide = Value
game.Workspace.TAntiVoid.CanCollide = Value

-- Create a notification on Roblox CoreGui

local CoreGui = game:GetService("CoreGui")

-- Function to show the notification
local function showNotification(title, text)
    -- Setting the notification properties
    CoreGui:SetCore("SendNotification", {
        Title = title; -- The title of the notification
        Text = text; -- The message/text of the notification
        Icon = ""; -- Optionally, you can add an icon, leave it empty for no icon
        Duration = 5; -- The notification will last for 5 seconds
    })
end

-- Example of calling the function
showNotification("Anti Void", "Anti Void Activated")

end)

Section:NewToggle("Anti Cube Of Death", "Anti Death Of Cube", function(Value)
if Value == true then
        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
        else
                workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
        end

-- Create a notification on Roblox CoreGui

local CoreGui = game:GetService("CoreGui")

-- Function to show the notification
local function showNotification(title, text)
    -- Setting the notification properties
    CoreGui:SetCore("SendNotification", {
        Title = title; -- The title of the notification
        Text = text; -- The message/text of the notification
        Icon = ""; -- Optionally, you can add an icon, leave it empty for no icon
        Duration = 5; -- The notification will last for 5 seconds
    })
end

-- Example of calling the function
showNotification("Anti Cube Of Death", "Anti Cube Of Death Activated")

end)

Section:NewToggle("Anti Ragdoll", "Anti Ragdoll", function(Value)
AntiRagdoll = Value
if AntiRagdoll then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
game.Players.LocalPlayer.CharacterAdded:Connect(function()
game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
game.Players.LocalPlayer.Character.Torso.Anchored = false
end
end)
end)
end

-- Create a notification on Roblox CoreGui

local CoreGui = game:GetService("CoreGui")

-- Function to show the notification
local function showNotification(title, text)
    -- Setting the notification properties
    CoreGui:SetCore("SendNotification", {
        Title = title; -- The title of the notification
        Text = text; -- The message/text of the notification
        Icon = ""; -- Optionally, you can add an icon, leave it empty for no icon
        Duration = 5; -- The notification will last for 5 seconds
    })
end

-- Example of calling the function
showNotification("Anti Ragdoll", "Anti Ragdoll Activated")
end)

Section:NewToggle("Anti Staff", "Will kick you if staff join", function(Value)
-- Anti-Staff Script
local AntiStaffEnabled = Value -- Change this to false to disable the Anti-Staff feature

-- List of known staff roles or usernames to kick
local staffList = {
    "Admin", -- Replace with specific staff roles or usernames
    "Moderator", -- Replace with specific staff roles or usernames
    "Developer" -- Replace with specific staff roles or usernames
}

-- Function to check if a player is staff
local function isStaff(player)
    -- You can add more logic to detect staff, such as checking their role or username
    -- Here we simply check if their user is in the staff list
    for _, role in pairs(staffList) do
        if player.Name == role then
            return true
        end
    end
    return false
end

-- Main loop that checks when a player joins
game.Players.PlayerAdded:Connect(function(player)
    if AntiStaffEnabled then
        if isStaff(player) then
            -- Kick the staff member and display the message
            player:Kick("STAFF DETECTED!")
        end
    end
end)

-- Create a notification on Roblox CoreGui

local CoreGui = game:GetService("CoreGui")

-- Function to show the notification
local function showNotification(title, text)
    -- Setting the notification properties
    CoreGui:SetCore("SendNotification", {
        Title = title; -- The title of the notification
        Text = text; -- The message/text of the notification
        Icon = ""; -- Optionally, you can add an icon, leave it empty for no icon
        Duration = 5; -- The notification will last for 5 seconds
    })
end

-- Example of calling the function
showNotification("Anti Staff", "Anti Staff Activated")
end)

Section:NewToggle("Anti Brazil", "Anti Brazil.", function(Value)
if Value == true then
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = false
                end
else
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = true
                end
end
end)

Section:NewToggle("Anti Time Stop", "Anti Time Stop", function(Value)
AntiTimestop = Value
while AntiTimestop do
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Part" then
                        v.Anchored = false
                    end
                end
task.wait()
end
end)

Section:NewToggle("Anti Squid", "Anti Squid.", function(Value)
AntiSquid = Value
if AntiSquid == false then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
        end
while AntiSquid do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
end
task.wait()
end
end)

Section:NewToggle("Anti Hollow Jack", "Anti Hollow jack.", function(Value)
game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
end)

Section:NewToggle("Anti Brick", "Anti Brick", function(Value)
AntiBrick = Value
while AntiBrick do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Union" then
                        v.CanTouch = false
                    end
                end
task.wait()
end
end)

Section:NewToggle("Anti Null", "Anti Null", function(Value)
AntiNull = Value
while AntiNull do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then
shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
end
end
task.wait()
end
end)

Section:NewToggle("Anti Conveyor", "Anti Conveyor.", function(Value)
game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
end)

Section:NewToggle("Anti [REDACTED]", "Anti [REDACTED]", function(Value)
game.Players.LocalPlayer.PlayerScripts.Well.Disabled = Value
end)

Section:NewToggle("Anti Reaper", "Anti Reaper.", function(state)
AntiReaper = Value
            while AntiReaper do
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == "DeathMark" then
                        game:GetService("ReplicatedStorage").ReaperGone:FireServer(v)
                    game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy() 
                    end
                end
task.wait()
end
end)

Section:NewToggle("Anti Mail", "Anti mail.", function(Value)
game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = Value
AntiMail = Value
while AntiMail do
if game.Players.LocalPlayer.Character:FindFirstChild("YouHaveGotMail") then
        game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = true
end
task.wait()
end 
end)

Section:NewToggle("Anti Stun", "Anti Stun.", function(Value)
AntiStun = Value
while AntiStun do
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") ~= nil and game.Workspace:FindFirstChild("Shockwave") and game.Players.LocalPlayer.Character.Ragdolled.Value == false then
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
end
task.wait()
end
end)

Section:NewToggle("Anti Megarock", "Anti Megarock", function(Value)
AntiRock = Value
while AntiRock do
for i,v in pairs(game.Workspace:GetDescendants()) do
                    if v.Name == "rock" then
                        v.CanTouch = false
                        v.CanQuery = false
                    end
                end
task.wait()
end
end)

local Section = Tab:NewSection("Cheat")

Section:NewToggle("Auto Enter Arena", "Auto Enter Arena", function(Value)
AutoEnterArena = Value
while AutoEnterArena do
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
    end
task.wait()
end
end)

Section:NewToggle("Rhythm Spam", "Rhythm spam", function(Value)
RhythmSpam = Value
while RhythmSpam do
game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
task.wait()
end
end)

Section:NewButton("free emote (type /e emotename)", "free emotes", function()
Floss = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Floss, game.Players.LocalPlayer.Character.Humanoid)
Groove = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Groove, game.Players.LocalPlayer.Character.Humanoid)
Headless = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Headless, game.Players.LocalPlayer.Character.Humanoid)
Helicopter = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Helicopter, game.Players.LocalPlayer.Character.Humanoid)
Kick = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Kick, game.Players.LocalPlayer.Character.Humanoid)
L = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.L, game.Players.LocalPlayer.Character.Humanoid)
Laugh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Laugh, game.Players.LocalPlayer.Character.Humanoid)
Parker = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Parker, game.Players.LocalPlayer.Character.Humanoid)
Spasm = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Spasm, game.Players.LocalPlayer.Character.Humanoid)
Thriller = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Thriller, game.Players.LocalPlayer.Character.Humanoid)
game.Players.LocalPlayer.Chatted:connect(function(msg)
if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
Floss = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Floss, game.Players.LocalPlayer.Character.Humanoid)
Groove = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Groove, game.Players.LocalPlayer.Character.Humanoid)
Headless = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Headless, game.Players.LocalPlayer.Character.Humanoid)
Helicopter = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Helicopter, game.Players.LocalPlayer.Character.Humanoid)
Kick = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Kick, game.Players.LocalPlayer.Character.Humanoid)
L = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.L, game.Players.LocalPlayer.Character.Humanoid)
Laugh = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Laugh, game.Players.LocalPlayer.Character.Humanoid)
Parker = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Parker, game.Players.LocalPlayer.Character.Humanoid)
Spasm = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Spasm, game.Players.LocalPlayer.Character.Humanoid)
Thriller = game.Players.LocalPlayer.Character.Humanoid:LoadAnimation(game.ReplicatedStorage.AnimationPack.Thriller, game.Players.LocalPlayer.Character.Humanoid)
if string.lower(msg) == "/e floss" then
Floss:Play()
elseif string.lower(msg) == "/e groove" then
Groove:Play()
elseif string.lower(msg) == "/e headless" then
Headless:Play()
elseif string.lower(msg) == "/e helicopter" then
Helicopter:Play()
elseif string.lower(msg) == "/e kick" then
Kick:Play()
elseif string.lower(msg) == "/e l" then
L:Play()
elseif string.lower(msg) == "/e laugh" then
Laugh:Play()
elseif string.lower(msg) == "/e parker" then
Parker:Play()
elseif string.lower(msg) == "/e spasm" then
Spasm:Play()
elseif string.lower(msg) == "/e thriller" then
Thriller:Play()
end
EP = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
end
end)
game:GetService("RunService").Heartbeat:Connect(function()
if EP ~= nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and Floss.IsPlaying or Groove.IsPlaying or Headless.IsPlaying or Helicopter.IsPlaying or Kick.IsPlaying or L.IsPlaying or Laugh.IsPlaying or Parker.IsPlaying or Spasm.IsPlaying or Thriller.IsPlaying then
Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - EP).Magnitude
if Magnitude > 1 then
Floss:Stop(); Groove:Stop(); Headless:Stop(); Helicopter:Stop(); Kick:Stop(); L:Stop(); Laugh:Stop(); Parker:Stop(); Spasm:Stop(); Thriller:Stop()
end
end
end)
end)

Section:NewButton("Bypass Anti Cheat", "Bypass Anti Cheat", function()
loadstring(game:HttpGet"https://raw.githubusercontent.com/OMOScripts/Share-Scripts/main/Sb%7C%20Bypass%20Anti%20cheat")()
end)

Section:NewButton("give reaper 20 (after they slap you)", "give reaper 20 kills", function()
for i = 1, 20 do
        game:GetService("ReplicatedStorage"):WaitForChild("HumanoidDied"):FireServer(x,false)
end
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.Name == "DeathMark" then
                    game.ReplicatedStorage.ReaperGone:FireServer(v)
                    game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy() 
                    end 
                end
end)

Section:NewButton("Destroy All Tycoon", "Destroy All Tycoon", function()
for i = 1, 110 do
 for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "Destruct" and v:FindFirstChild("ClickDetector") then
            fireclickdetector(v.ClickDetector)
        end
    end
task.wait()
end
end)
Section:NewLabel("Farm")

Section:NewToggle("Slap Aura", "Slap Aura", function(Value)
SlapAura = Value
                while SlapAura do
for i,v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and v.Character then
if v.Character:FindFirstChild("entered") and v.Character:FindFirstChild("HumanoidRootPart") then
Magnitude = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        if 25 >= Magnitude then
game.ReplicatedStorage.KSHit:FireServer(v.Character:WaitForChild("HumanoidRootPart"))
                    end
end
end
                end
task.wait()
end
end)

Section:NewButton("Godmode", "GodMode", function()
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
end
repeat task.wait() until game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") or game.Players.LocalPlayer.Backpack:FindFirstChildWhichIsA("Tool")
for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Tool" then
                        v.Parent = game.LogService
                    end
                end
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        v.Parent = game.LogService
                end
game:GetService("ReplicatedStorage"):WaitForChild("HumanoidDied"):FireServer(game.Players.LocalPlayer.Character,false)
wait(3.75)
for i,v in pairs(game.LogService:GetChildren()) do
                        v.Parent = game.Players.LocalPlayer.Backpack
                end
for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                end 
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
end) 

Section:NewButton("Be Invisible FE", "FE", function()
		SlapTime = 10 -- How many people you want to slap
		loadstring(game:HttpGet"https://pastefy.app/TuWoiYJ8/raw")()
end)

Section:NewToggle("Auto Click Tycoon", "Auto Click Tycoon", function(Value)
AutoTycoon = Value
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "End" and v.ClassName == "Part" then
            v.Size = Vector3.new(28, 0.3, 4)
        end
    end
while AutoTycoon do
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "Click" and v:FindFirstChild("ClickDetector") then
            fireclickdetector(v.ClickDetector)
        end
    end
    task.wait()
end
end)

Section:NewButton("Slap Farm", "Slap Farm", function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Slap%20Farm'))()
end)

Section:NewLabel("ESP")

Section:NewToggle("ESP Glove", "ESP", function(Value)
GloveESP = Value
if GloveESP == false then
for i, v in ipairs(game.Players:GetChildren()) do
                if v.Character and v.Character:FindFirstChild("Head") and v.Character.Head:FindFirstChild("GloveEsp") then
 v.Character.Head.GloveEsp:Destroy()
                end
            end
end
while GloveESP do
for i, v in ipairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("entered") and v.Character.IsInDefaultArena.Value == false and v.Character.Head:FindFirstChild("GloveEsp") == nil then
GloveEsp = Instance.new("BillboardGui", v.Character.Head)
GloveEsp.Adornee = v.Character.Head
GloveEsp.Name = "GloveEsp"
GloveEsp.Size = UDim2.new(0, 100, 0, 150)
GloveEsp.StudsOffset = Vector3.new(0, 1, 0)
GloveEsp.AlwaysOnTop = true
GloveEsp.StudsOffset = Vector3.new(0, 3, 0)
GloveEspText = Instance.new("TextLabel", GloveEsp)
GloveEspText.BackgroundTransparency = 1
GloveEspText.Size = UDim2.new(0, 100, 0, 100)
GloveEspText.TextSize = 25
GloveEspText.Font = Enum.Font.SourceSansSemibold
GloveEspText.TextColor3 = Color3.new(255, 255, 255)
GloveEspText.TextStrokeTransparency = 0
GloveEspText.Text = v.leaderstats.Glove.Value
                end
            end
task.wait()
end
end)

Section:NewLabel("Sliders")

Section:NewSlider("WalkSpeed", "WalkSpeed", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

Section:NewSlider("JumpPower", "JumpPower", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

Section:NewLabel("Troll Sounds")

Section:NewToggle("Zombie Sound Spam", "Zombie Sound Spam.", function(Value)
ZombieSoundSpam = Value
while ZombieSoundSpam do
game:GetService("ReplicatedStorage").b:FireServer("ReplicateSound_Zombie")
task.wait()
end
end)

Section:NewToggle("Error Sound Spam", "Error Sound Spam", function(Value)
ErrorSoundSpam = Value
while ErrorSoundSpam do
game.ReplicatedStorage.ErrorDeath:FireServer()
task.wait()
end
end)

-- Create the ScreenGui and Button
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Parent = screenGui
button.Size = UDim2.new(0, 200, 0, 50)  -- Button size (200x50 pixels)
button.Position = UDim2.new(0, 10, 0, game:GetService("Workspace").CurrentCamera.ViewportSize.Y - 120) -- Moved slightly up
button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Button background color
button.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Text color
button.TextSize = 20  -- Font size
button.Font = Enum.Font.GothamBold  -- Font style
button.Text = "Toggle Hub"  -- Button label
button.TextButtonStyle = Enum.ButtonStyle.RobloxButton -- Make the button have Roblox's default button style

-- Add Hover Effect
button.MouseEnter:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Change to dark gray when hovered
end)

button.MouseLeave:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)  -- Revert to black when not hovered
end)

-- Button click handler
button.MouseButton1Click:Connect(function()
    -- Execute the Library:ToggleUI() function when clicked
    -- Ensure the script that includes Library is available
    local Library = _G.Library  -- Assuming the Library is stored in the global _G table
    if Library then
        Library:ToggleUI()
    else
        warn("Library not found!")
    end
end)

end
