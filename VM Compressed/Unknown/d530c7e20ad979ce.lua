-- Made By RoProExp 
-- Last Updated: 7/13/2025 3:42 AM
-- Short Script Version: loadstring(game:HttpGet('https://raw.githubusercontent.com/RoProExp/NVZR-Gui2/refs/heads/main/source'))()

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Noobs vs Zombies Realish Gui 2",
    LoadingTitle = "Noobs vs Zombies Realish Gui 2",
    LoadingSubtitle = "by .sendsomehelp",
    Theme = "DarkBlue",
   



    ConfigurationSaving = {
       Enabled = true,
       FolderName = Simple, -- Create a custom folder for your hub/game
       FileName = "Big simple Hub"
    },
    Discord = {
       Enabled = false,
       Invite = "", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
       RememberJoins = false -- Set this to false to make them join the discord every time they load it up
    },
    KeySystem = false, -- Set this to true to use our key system
    KeySettings = {
       Title = "Hush Litle Piggy",
       Subtitle = "Wat",
       Note = "Ask RoPro",
       FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
       SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
       Key = {"Excuse me?!"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    }
 })


 
 ----------------------------------------------------------------------------------------------------------- Main Tab ---------------------------------------------------------------------------------------------------------



 local Tab = Window:CreateTab("Main", 4483362458) -- Title, Image


 
local Section = Tab:CreateSection("Main Stuff")

local Button = Tab:CreateButton({
    Name = "WRD ESP",
    Callback = function()
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/WRD%20ESP.txt"))()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Shift Lock",
    Callback = function()
        game:GetService('Players').LocalPlayer.DevEnableMouseLock = true
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Infinite Yeid",
    Callback = function()
        -- Place this script in a LocalScript within StarterPlayerScripts or StarterCharacterScripts

-- Load Infinite Yield
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()

-- Custom lighting settings
local Lighting = game:GetService("Lighting")

-- If there's an existing loop, disconnect it
if brightLoop then
    brightLoop:Disconnect()
end

-- Function to update the lighting settings
local function brightFunc()
    Lighting.Brightness = 2
    Lighting.ClockTime = 14
    Lighting.FogEnd = 100000
    Lighting.GlobalShadows = false
    Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end

-- Create a new loop to call the function periodically
brightLoop = game:GetService("RunService").RenderStepped:Connect(function()
    pcall(brightFunc)
end)
    end,
 })

local Button = Tab:CreateButton({
    Name = "Mod Notifier",
    Callback = function()
-- List of specific users you want to track
local specificUsers = {
    "CJKV", "bumrushers", "Tony4141", "LOGIOL", "NPCZOMBIE2", "whatareallyfunday",
    "whenafarmer", "TopikzR", "Sansek1252", "krawder", "106hum", "4lachlan4",
    "schneegeschoss", "AGoshDarnLad", "SeedGatherer", "EGGHEADLOLD", "bloodzillaaa"
}

-- Sound IDs for the notification sounds
local soundId1 = "rbxassetid://8379374771"
local soundId2 = "rbxassetid://8379374771"

-- Function to check if a specific user has joined
local function onPlayerAdded(player)
    for _, username in ipairs(specificUsers) do
        if player.Name == username then
            print("Specific user " .. username .. " has joined the game!")

            -- Play first notification sound
            local sound1 = Instance.new("Sound")
            sound1.SoundId = soundId1
            sound1.Volume = 0.4
            sound1.Parent = game.Workspace
            sound1:Play()

            local lighting = game:GetService("Lighting")

            -- Buzzer-style flash: white/black every 20ms, total duration 0.7s
            local function buzzerFlash()
                local flashes = math.floor(0.7 / 0.02) -- = 35 flashes (≈17 full cycles)
                for i = 1, flashes do
                    local isEven = i % 2 == 0
                    lighting.Brightness = isEven and 2 or 0
                    local color = isEven and Color3.new(1,1,1) or Color3.new(0,0,0)
                    lighting.OutdoorAmbient = color
                    lighting.Ambient = color
                    lighting.TimeOfDay = isEven and "12:00:00" or "00:00:00"
                    wait(0.02) -- 20 milliseconds
                end
            end

            buzzerFlash()

            -- Play second sound after first finishes
            sound1.Ended:Connect(function()
                local sound2 = Instance.new("Sound")
                sound2.SoundId = soundId2
                sound2.Volume = 0.4
                sound2.Parent = game.Workspace
                sound2:Play()
                sound2.Ended:Connect(function()
                    sound2:Destroy()
                end)
            end)

            sound1.Ended:Connect(function()
                sound1:Destroy()
            end)
        end
    end
end

-- Connect the function to the PlayerAdded event
game.Players.PlayerAdded:Connect(onPlayerAdded) 
    end,
 })

local Button = Tab:CreateButton({
    Name = "Remove FallDamage",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function removeFallDamageEvent()
    while true do
        local fallDamageEvent = ReplicatedStorage.Miscs.Events:FindFirstChild("FallDamageEvent")
        if fallDamageEvent then
            fallDamageEvent:Destroy()
            print("FallDamageEvent has been removed.")
        end
        wait(1) -- Check every 1 second
    end
end

-- Run the function to remove FallDamageEvent
removeFallDamageEvent()

    end,
 })

 
 
 local Button = Tab:CreateButton({
    Name = "Destroy Barriers",
    Callback = function()
        -- Check for Model and Parts in Workspace and destroy them
local function destroyIfExists(name)
    local item = Workspace:FindFirstChild(name)
    if item then
        item:Destroy()
        item.Parent = Workspace
    end
end

-- Destroy the SpawnKillSystem model
destroyIfExists("SpawnKillSystem")

-- Destroy the NoobCam part
destroyIfExists("NoobCam")

-- Destroy the ZombieCam part
destroyIfExists("ZombieCam")
    end,
 })


 local Button = Tab:CreateButton({
    Name = "Sirius Menu",
    Callback = function()
        loadstring(game:HttpGet('https://sirius.menu/sirius'))()
    end,
 })

local Button = Tab:CreateButton({
    Name = "Hitbox Expander",
    Callback = function()
 _G.HeadSize = 3
        _G.Disabled = true
        game:GetService('RunService').RenderStepped:connect(function()
        if _G.Disabled then
        for i,v in next, game:GetService('Players'):GetPlayers() do
        if v.Name ~= game:GetService('Players').LocalPlayer.Name then
        pcall(function()
        v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
        v.Character.HumanoidRootPart.Transparency = 0.75
        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")
        v.Character.HumanoidRootPart.Material = "Neon"
        v.Character.HumanoidRootPart.CanCollide = false
        end)
        end
        end
        end
        end)
end,
 })

 local Button = Tab:CreateButton({
    Name = "Lives Drainer (Toggle T)",
    Callback = function()
		local Players = game:GetService("Players")
		local Player = Players.LocalPlayer
		local UserInputService = game:GetService("UserInputService")
		
		local enabled = false -- Toggle state
		
		-- Function to toggle the script
		local function toggleScript()
			enabled = not enabled
			print("Script enabled: " .. tostring(enabled))
		end
		
		-- Connect the toggle function to the "T" key
		UserInputService.InputBegan:Connect(function(input, isProcessed)
			if isProcessed then return end
			if input.KeyCode == Enum.KeyCode.T then
				toggleScript()
			end
		end)
		
		while wait() do
			if enabled then
				pcall(function()
					workspace.SpawnKillSystem.ZombieSpawnGuard.CFrame = CFrame.new(Player.Character.HumanoidRootPart.Position)
					workspace.SpawnKillSystem.NoobSpawnGuard.CFrame = CFrame.new(Player.Character.HumanoidRootPart.Position)
		
					local args = {
						[1] = Player.PlayerGui.Respawn.GuiScript,
						[2] = "DeadRespawn"
					}
					Player.PlayerGui.Respawn.RagdollEvent:FireServer(unpack(args))
				end)
			end
		end
		
    end,
 })

 ----------------------------------------------------------------------------------------------------------- (2) Combat Tab ---------------------------------------------------------------------------------------------------------

 local Tab = Window:CreateTab("Combat") -- Title, Image'

 local Section = Tab:CreateSection("Combat scripts")

 local Button = Tab:CreateButton({
    Name = "Fast Respawn",
    Callback = function()
        game:GetService("ReplicatedStorage").Miscs.Events.DoneLoadingEvent:FireServer()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Inf Ammo (1 Life)",
    Callback = function()
NVZR_INF_AMMO_ALREADY_ON_THIS = 'NVZR_INF_AMMO_ALREADY_ON_THIS foreal lol books of books'

local player = game.Players.LocalPlayer

nvzr_number_key_for_inf_ammo_thing = player.Backpack.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then


local function findEquippedTool(character)
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") and item:FindFirstChild("Clip") then
            return item
        end
    end
    return nil
end

-- Monitor the Clip value
local function monitorClipValue(tool)
    local clip = tool:FindFirstChild("Clip")
    if clip then
        clip:GetPropertyChangedSignal("Value"):Connect(function()
            if clip.Value == 0 then
                clip.Value = clip.MaxValue
            end
        end)
    end
end

local player = game.Players.LocalPlayer



local tool = nil

local startTime = tick()
while tick() - startTime < 5 do -- give 5 seconds to load the load animation
    local character = player.Character or player.CharacterAdded:Wait()
    tool = findEquippedTool(character)
    if tool then
        break
    end
    wait(0.1) -- prevent freeze
end


if tool then
    local umm = tool:FindFirstChild(NVZR_INF_AMMO_ALREADY_ON_THIS)
    
    if not umm then
    game:GetService("StarterGui"):SetCore("SendNotification",{["Title"] = "Inf Clips",["Text"] = "The gun " .. tool.name,["Duration"] = 5})

    local already_have_inf_label = Instance.new("TextLabel")
    already_have_inf_label.Name = NVZR_INF_AMMO_ALREADY_ON_THIS
    already_have_inf_label.Parent = tool

    while true do
        local character = player.Character or player.CharacterAdded:Wait()
        local tool = nil

        -- Loop to keep monitoring if the tool is equipped
        while character do
            tool = findEquippedTool(character)
            if tool then
                monitorClipValue(tool)
            end

            -- Wait for character reset
            player.CharacterAdded:Wait()
            character = player.Character
        end

        wait(0.1) -- Adjust the wait time as needed
    end
end

end


    end
end)


    -- nvzr_number_key_for_inf_ammo_thing:Disconnect()
    -- nvzr_number_key_for_inf_ammo_thing = nil
 

    end,
 })

 local Button = Tab:CreateButton({
    Name = "Perk Values",
    Callback = function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerModel = player.Character or player.CharacterAdded:Wait()

local objectValues = {
   {Name = "SWEEP HANDS"},
    {Name = "IMMUNE"},
    {Name = "HEALTHY_BONES"},
    {Name = "SKIN_WALKER"},
   {Name = "SCOUT"},
    {Name = "NINJA"}
}

for _, valueInfo in ipairs(objectValues) do
    local newObjectValue = Instance.new("ObjectValue")
    newObjectValue.Name = valueInfo.Name
    newObjectValue.Parent = playerModel
end
    end,
 })

local Button = Tab:CreateButton({
    Name = "Speed (Hold CTRL)",
    Callback = function()
      local Players = game:service("Players")
        local Player = Players.LocalPlayer
        local userInput = game:service("UserInputService")
        local runService = game:service("RunService")
        repeat wait() until Player.Character
        local Character = Player.Character
        local pHum = Character:WaitForChild("Humanoid")
        local humRoot = Character:WaitForChild("HumanoidRootPart")
        local Multiplier = 0.5 -- adjust this for more or less speed
        userInput.InputBegan:connect(function(Key)
        if Key.KeyCode == Enum.KeyCode.LeftBracket then
        Multiplier = Multiplier + 0.1
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.LeftBracket) do
        wait()
        Multiplier = Multiplier + 0.1
        end
        end
        if Key.KeyCode == Enum.KeyCode.RightBracket then
        Multiplier = Multiplier - 0.1
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.RightBracket) do
        wait()
        Multiplier = Multiplier - 0.1
        end
        end
        end)
        runService.Stepped:connect(function()
        if userInput:IsKeyDown(Enum.KeyCode.LeftControl) then
        humRoot.CFrame = humRoot.CFrame + pHum.MoveDirection * Multiplier
        end
        end)
    end,
 })
 local Button = Tab:CreateButton({
    Name = "Support Stealer",
    Callback = function()
while true do
    local localPlayer = game:GetService("Players").LocalPlayer
    local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")

    local toolNames = {"Airstrike Radio", "Napalm Radio", "Gas Strike Radio", "Phantom Radio", "Gunship Laptop", "Nuclear Bomb Radio", "Sentry Wrench", "Helicopter Radio"} -- Add more tool names here if needed

    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= localPlayer then
            local enemyBackpack = player:FindFirstChild("Backpack")

            if enemyBackpack then
                for _, toolName in ipairs(toolNames) do
                    local foundTool = enemyBackpack:FindFirstChild(toolName)
                    if foundTool then
                        print("(DEBUG!) Found " .. toolName .. " in " .. player.Name .. "'s backpack")

                        -- Move tool to local player
                        foundTool.Parent = localPlayer.Backpack

                        -- Wait for it to appear in your backpack
                        local myTool = localPlayer.Backpack:FindFirstChild(toolName)
                        if myTool then
                            -- Equip instantly
                            humanoid:EquipTool(myTool)
                            print("(DEBUG!) Equipped " .. toolName)
                        end
                    end
                end
            end
        end
    end

    task.wait(0.2)
end

end,
})

 local Button = Tab:CreateButton({
    Name = "Barb Wire",
    Callback = function()
		local RunService = game:GetService("RunService")
		local Debris = workspace:FindFirstChild("Debris")
		
		-- Ensure Debris exists and has the necessary hierarchy
		if Debris then
			local BarbWire = Debris:FindFirstChild("Barb Wire")  -- Adjusted for the space in the name
			if BarbWire then
				local Wire = BarbWire:FindFirstChild("Wire")
				if Wire then
					-- Function to update the Wire's position
					local function updateWirePosition()
						local player = game.Players.LocalPlayer
						local character = player.Character
						if character and character:FindFirstChild("HumanoidRootPart") then
							Wire.CFrame = character.HumanoidRootPart.CFrame
						end
					end
		
					-- Connect updateWirePosition to the RenderStepped event
					RunService.RenderStepped:Connect(updateWirePosition)
				else
					warn("Wire part not found in Barb wire model.")
				end
			else
				warn("Barb wire model not found in Debris folder.")
			end
		else
			warn("Debris folder not found in workspace.")
		end
		
    end,
 })

local Button = Tab:CreateButton({
    Name = "Undetected Inf Jump",
    Callback = function()
          local infjump = true
        game:GetService("UserInputService").JumpRequest:connect(function()
        if infjump then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end
        end)
      		print("button pressed")
    end,
 })
 
 local Button = Tab:CreateButton({
    Name = "Find Activasional Menu (Check Console)",
    Callback = function()
        while true do
            for i,rr in pairs(game.Players:GetPlayers()) do
            if rr.name ~= game:GetService("Players").LocalPlayer.Name then
            local stuff = {game:GetService("Players"):FindFirstChild(rr.Name).Backpack:FindFirstChild("Activasional Menu")}
            if stuff[0] or stuff[1] then
            print("(DEBUG!) found something")
            keypress(120)
            keyrelease(120)
            table.foreach(stuff, function(i,v)
            v.Parent = game:GetService("Players").LocalPlayer.Backpack
            end)
            end
            end
            end
            task.wait(5)
            end
    end,
 })

----------------------------------------------------------------------------------------------------------- Misc Tab ---------------------------------------------------------------------------------------------------------

 local Tab = Window:CreateTab("Misc") -- Title, Image'

 local Section = Tab:CreateSection("Core")
 
 local Button = Tab:CreateButton({
    Name = "Destroy Script",
    Callback = function()
        Rayfield:Destroy()
    end,
 })

 local Section = Tab:CreateSection("Game Hub")


local Button = Tab:CreateButton({
    Name = "Instant Respawner Gui",
    Callback = function()
       loadstring(game:HttpGet("https://pastebin.com/raw/t7YrWQ2n", true))()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Dex",
    Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"))()
    end,
 })
 
 local Button = Tab:CreateButton({
    Name = "Lives Drainer",
    Callback = function()
        local Players = game:GetService('Players')
        local Player = Players.LocalPlayer
        while wait() do
        
            pcall(function()
                workspace.SpawnKillSystem.ZombieSpawnGuard.CFrame = CFrame.new(Player.Character.HumanoidRootPart.Position)
                workspace.SpawnKillSystem.NoobSpawnGuard.CFrame = CFrame.new(Player.Character.HumanoidRootPart.Position)
        
                local args = {
                  [1] = game:GetService("Players").LocalPlayer.PlayerGui.Respawn.GuiScript,
                  [2] = "DeadRespawn"
                }
                game:GetService("Players").LocalPlayer.PlayerGui.Respawn.RagdollEvent:FireServer(unpack(args))
            end)
        end 
    end,
 })

local Button = Tab:CreateButton({
    Name = "Boosts Giver",
    Callback = function()
        local args = {
            [1] = "FallDamage",
            [2] = -1,
            [3] = false
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("Miscs"):WaitForChild("Events"):WaitForChild("FallDamageEvent"):FireServer(unpack(args))        
    end,
 })

 local Section = Tab:CreateSection("Script Hub")

 local Button = Tab:CreateButton({
    Name = "Infinite Yeid",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
 })

----------------------------------------------------------------------------------------------------------- Fourth Tab ---------------------------------------------------------------------------------------------------------

local Tab = Window:CreateTab("Steal Supports") -- Title, Image'

local Button = Tab:CreateButton({
	Name = "Airstrike Radio",
	Callback = function()
		while true do
			for i,rr in pairs(game.Players:GetPlayers()) do
						if rr.name ~= game:GetService("Players").LocalPlayer.Name then
						local stuff = {game:GetService("Players"):FindFirstChild(rr.Name).Backpack:FindFirstChild("Airstrike Radio")}
						if stuff[0] or stuff[1] then
						print("(DEBUG!) found something")
						keypress(120)
						keyrelease(120)
						table.foreach(stuff, function(i,v)
						v.Parent = game:GetService("Players").LocalPlayer.Backpack
						end)
						end
						end
						end
						task.wait(5)
						end
						  print("button pressed")
	end,
 })


local Button = Tab:CreateButton({
	Name = "Napalm Radio",
	Callback = function()
		while true do
			for i,rr in pairs(game.Players:GetPlayers()) do
						if rr.name ~= game:GetService("Players").LocalPlayer.Name then
						local stuff = {game:GetService("Players"):FindFirstChild(rr.Name).Backpack:FindFirstChild("Napalm Radio")}
						if stuff[0] or stuff[1] then
						print("(DEBUG!) found something")
						keypress(120)
						keyrelease(120)
						table.foreach(stuff, function(i,v)
						v.Parent = game:GetService("Players").LocalPlayer.Backpack
						end)
						end
						end
						end
						task.wait(5)
						end
						  print("button pressed")
	end,
 })

local Button = Tab:CreateButton({
	Name = "Gas Strike Radio",
	Callback = function()
		while true do
			for i,rr in pairs(game.Players:GetPlayers()) do
						if rr.name ~= game:GetService("Players").LocalPlayer.Name then
						local stuff = {game:GetService("Players"):FindFirstChild(rr.Name).Backpack:FindFirstChild("Gas Strike Radio")}
						if stuff[0] or stuff[1] then
						print("(DEBUG!) found something")
						keypress(120)
						keyrelease(120)
						table.foreach(stuff, function(i,v)
						v.Parent = game:GetService("Players").LocalPlayer.Backpack
						end)
						end
						end
						end
						task.wait(5)
						end
						  print("button pressed")
	end,
 })

 local Button = Tab:CreateButton({
	Name = "Phantom Radio",
	Callback = function()
		while true do
			for i,rr in pairs(game.Players:GetPlayers()) do
						if rr.name ~= game:GetService("Players").LocalPlayer.Name then
						local stuff = {game:GetService("Players"):FindFirstChild(rr.Name).Backpack:FindFirstChild("Phantom Radio")}
						if stuff[0] or stuff[1] then
						print("(DEBUG!) found something")
						keypress(120)
						keyrelease(120)
						table.foreach(stuff, function(i,v)
						v.Parent = game:GetService("Players").LocalPlayer.Backpack
						end)
						end
						end
						end
						task.wait(5)
						end
						  print("button pressed")
	end,
 })

 local Button = Tab:CreateButton({
	Name = "Gunship Laptop",
	Callback = function()
		while true do
			for i,rr in pairs(game.Players:GetPlayers()) do
						if rr.name ~= game:GetService("Players").LocalPlayer.Name then
						local stuff = {game:GetService("Players"):FindFirstChild(rr.Name).Backpack:FindFirstChild("Gunship Laptop")}
						if stuff[0] or stuff[1] then
						print("(DEBUG!) found something")
						keypress(120)
						keyrelease(120)
						table.foreach(stuff, function(i,v)
						v.Parent = game:GetService("Players").LocalPlayer.Backpack
						end)
						end
						end
						end
						task.wait(5)
						end
						  print("button pressed")
	end,
 })


 local Button = Tab:CreateButton({
	Name = "Nuclear Bomb Radio",
	Callback = function()
		while true do
			for i,rr in pairs(game.Players:GetPlayers()) do
						if rr.name ~= game:GetService("Players").LocalPlayer.Name then
						local stuff = {game:GetService("Players"):FindFirstChild(rr.Name).Backpack:FindFirstChild("Nuclear Bomb Radio")}
						if stuff[0] or stuff[1] then
						print("(DEBUG!) found something")
						keypress(120)
						keyrelease(120)
						table.foreach(stuff, function(i,v)
						v.Parent = game:GetService("Players").LocalPlayer.Backpack
						end)
						end
						end
						end
						task.wait(5)
						end
						  print("button pressed")
	end,
 })

----------------------------------------------------------------------------------------------------------- 0 Lives Tab ---------------------------------------------------------------------------------------------------------

local Tab = Window:CreateTab("0 Lives Emergency") -- Title, Image'

 local Button = Tab:CreateButton({
    Name = "Fast Respawn",
    Callback = function()
        game:GetService("ReplicatedStorage").Miscs.Events.DoneLoadingEvent:FireServer()
    end,
 })

local Button = Tab:CreateButton({
    Name = "Undetected Speed 0.5 (Can Hold Speed)",
    Callback = function()
      local Players = game:service("Players")
        local Player = Players.LocalPlayer
        local userInput = game:service("UserInputService")
        local runService = game:service("RunService")
        repeat wait() until Player.Character
        local Character = Player.Character
        local pHum = Character:WaitForChild("Humanoid")
        local humRoot = Character:WaitForChild("HumanoidRootPart")
        local Multiplier = 0.5 -- adjust this for more or less speed
        userInput.InputBegan:connect(function(Key)
        if Key.KeyCode == Enum.KeyCode.LeftBracket then
        Multiplier = Multiplier + 0.1
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.LeftBracket) do
        wait()
        Multiplier = Multiplier + 0.1
        end
        end
        if Key.KeyCode == Enum.KeyCode.RightBracket then
        Multiplier = Multiplier - 0.1
        wait(0.2)
        while userInput:IsKeyDown(Enum.KeyCode.RightBracket) do
        wait()
        Multiplier = Multiplier - 0.1
        end
        end
        end)
        runService.Stepped:connect(function()
        if userInput:IsKeyDown(Enum.KeyCode.LeftControl) then
        humRoot.CFrame = humRoot.CFrame + pHum.MoveDirection * Multiplier
        end
        end)
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Perk Values",
    Callback = function()
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerModel = player.Character or player.CharacterAdded:Wait()

local objectValues = {
    {Name = "SWEEP HANDS"},
    {Name = "IMMUNE"},
    {Name = "HEALTHY_BONES"},
    {Name = "SKIN_WALKER"},
      {Name = "SCOUT"},
    {Name = "NINJA"}
}

for _, valueInfo in ipairs(objectValues) do
    local newObjectValue = Instance.new("ObjectValue")
    newObjectValue.Name = valueInfo.Name
    newObjectValue.Parent = playerModel
end
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Custom Radio (Noob Medic)",
    Callback = function()
        local args = {
		[1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.CustomizeClassFrame.HandleClassCus,
		[2] = "UpdateClassCus",
		[3] = "Noob",
		[4] = "Medic",
		[5] = "Fun Gadget",
		[6] = "Custom Radio"
		}
		game:GetService("ReplicatedStorage").Miscs.Events.ChangeCustomizationEvent:FireServer(unpack(args))

    end,
 })

 local Button = Tab:CreateButton({
    Name = "Custom Radio (Zombie Medic)",
    Callback = function()
        local args = {
		[1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.CustomizeClassFrame.HandleClassCus,
		[2] = "UpdateClassCus",
		[3] = "Zombie",
		[4] = "Medic",
		[5] = "Fun Gadget",
		[6] = "Custom Radio"
		}
		game:GetService("ReplicatedStorage").Miscs.Events.ChangeCustomizationEvent:FireServer(unpack(args))

    end,
 })

local Divider = Tab:CreateDivider()

local Section = Tab:CreateSection("Heavy (Gives -500 Coins)")

 local Button = Tab:CreateButton({
    Name = "Heavy",
    Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.ClassFrame.HandleClass,
            [2] = "Heavy",
            [3] = "CharacterSlot1",
            [4] = "None"
        }
        
        game:GetService("ReplicatedStorage").Miscs.Events.DeployPlayerToBattleEvent:InvokeServer(unpack(args))
    end,
 })
 
 local Button = Tab:CreateButton({
    Name = "Medic",
    Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.ClassFrame.HandleClass,
            [2] = "Medic",
            [3] = "CharacterSlot1",
            [4] = "None"
        }
        
        game:GetService("ReplicatedStorage").Miscs.Events.DeployPlayerToBattleEvent:InvokeServer(unpack(args))
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Recon",
    Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.ClassFrame.HandleClass,
            [2] = "Recon",
            [3] = "CharacterSlot1",
            [4] = "None"
        }
        
        game:GetService("ReplicatedStorage").Miscs.Events.DeployPlayerToBattleEvent:InvokeServer(unpack(args))
    end,
 })


 local Button = Tab:CreateButton({
    Name = "Supplier",
    Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.ClassFrame.HandleClass,
            [2] = "Supplier",
            [3] = "CharacterSlot1",
            [4] = "None"
        }
        
        game:GetService("ReplicatedStorage").Miscs.Events.DeployPlayerToBattleEvent:InvokeServer(unpack(args))
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Demolition",
    Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.ClassFrame.HandleClass,
            [2] = "Demolition",
            [3] = "CharacterSlot1",
            [4] = "None"
        }
        
        game:GetService("ReplicatedStorage").Miscs.Events.DeployPlayerToBattleEvent:InvokeServer(unpack(args))
    end,
 })
 
 local Button = Tab:CreateButton({
    Name = "Survivor",
    Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.ClassFrame.HandleClass,
            [2] = "Survivor",
            [3] = "CharacterSlot1",
            [4] = "None"
        }
        
        game:GetService("ReplicatedStorage").Miscs.Events.DeployPlayerToBattleEvent:InvokeServer(unpack(args))
    end,
 })

 
 local Button = Tab:CreateButton({
    Name = "Arena Fighter",
    Callback = function()
        local args = {
            [1] = game:GetService("Players").LocalPlayer.PlayerGui.ClassGui.ClassFrame.HandleClass,
            [2] = "Arena Fighter",
            [3] = "CharacterSlot1",
            [4] = "None"
        }
        
        game:GetService("ReplicatedStorage").Miscs.Events.DeployPlayerToBattleEvent:InvokeServer(unpack(args))
    end,
 })

 
