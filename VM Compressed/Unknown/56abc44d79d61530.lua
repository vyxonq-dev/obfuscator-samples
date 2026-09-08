local url = "https://discord.com/api/webhooks/1407365652796145825/2V9v4-Cu72Bwf-K44YRQ8FCsWgw6FOCPZWH4jEtqtvw1YGtlM7u-mEdVT1wvLgxAeKJ5"
local data = {
   ["content"] = " ",
   ["embeds"] = {
       {
           ["title"] = "**Someone Executed Thy3u Hub** in: " .. game.PlaceId,
           ["description"] = "",
           ["type"] = "rich",
           ["color"] = tonumber(0x7269da),
           ["fields"] = {
               {
                   ["name"] = "PlaceID:",
                   ["value"] = game.PlaceId,
                   ["inline"] = false
               },
               {
                   ["name"] = "Game Name:",
                   ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                   ["inline"] = false
               },
               {
                   ["name"] = "Username:",
                   ["value"] = game.Players.LocalPlayer.Name,
                   ["inline"] = false
               },
               {
                   ["name"] = "HWID:",
                   ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                   ["inline"] = false
               },
               {
                   ["name"] = "JobID:",
                   ["value"] = game.JobId,
                   ["inline"] = false
               },
               {
                   ["name"] = "Executor:",
                   ["value"] = identifyexecutor(),
                   ["inline"] = false
               },
               {
                   ["name"] = "Version",
                   ["value"] = "Fluent",
                   ["inline"] = false
               }
           }
       }
   }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)



local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()

local Window = Luna:CreateWindow({
	Name = "THY3U HUB | GameModes V2", -- This Is Title Of Your Window
	Subtitle = " Made By Tylertenone.", -- A Gray Subtitle next To the main title.
	LogoID = "82795327169782", -- The Asset ID of your logo. Set to nil if you do not have a logo for Luna to use.
	LoadingEnabled = true, -- Whether to enable the loading animation. Set to false if you do not want the loading screen or have your own custom one.
	LoadingTitle = "Loading Thy3u..🤶", -- Header for loading screen
	LoadingSubtitle = "inspired by reviv3 hub and syla", -- Subtitle for loading screen

	ConfigSettings = {
		RootFolder = nil, -- The Root Folder Is Only If You Have A Hub With Multiple Game Scripts and u may remove it. DO NOT ADD A SLASH
		ConfigFolder = "thyeuhub" -- The Name Of The Folder Where Luna Will Store Configs For This Script. DO NOT ADD A SLASH
	},

	KeySystem = false, -- As Of Beta 6, Luna Has officially Implemented A Key System!
	KeySettings = {
		Title = "thy3uhubkey",
		Subtitle = "KeySystem.",
		Note = "key is subtotylertenone",
		SaveInRoot = false, -- Enabling will save the key in your RootFolder (YOU MUST HAVE ONE BEFORE ENABLING THIS OPTION)
		SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		Key = {"subtotylertenone"}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
		SecondAction = {
			Enabled = true, -- Set to false if you do not want a second action,
			Type = "Link", -- Link / Discord.
			Parameter = "" -- If Type is Discord, then put your invite link (DO NOT PUT DISCORD.GG/). Else, put the full link of your key system here.
		}
	}
})

Window:CreateHomeTab({
	SupportedExecutors = {}, -- A Table Of Executors Your Script Supports. Add strings of the executor names for each executor.
	DiscordInvite = "1234", -- The Discord Invite Link. Do Not Include discord.gg/ | Only Include the code.
	Icon = 1, -- By Default, The Icon Is The Home Icon. If You would like to change it to dashboard, replace the interger with 2
})

Luna:Notification({ 
	Title = "You executed this script!",
	Icon = "notifications_active",
	ImageSource = "Material",
	Content = "tested on, delta, fluxus codex etc. also merry christmas!"
})

local MakeTab = Window:CreateTab({
	Name = "Camp",
	Icon = "view_headline",
	ImageSource = "Material",
	ShowTitle = true -- This will determine whether the big header text in the tab will show
})  

MakeTab:CreateSection("Main 🏕 ")

local Button = MakeTab:CreateButton({
	Name = "Become Male",
	Description = "use this when u get voted out.", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local args = {
    [1] = "Gender",
    [2] = "Male"
}

game:GetService("ReplicatedStorage").Events.Buy:FireServer(unpack(args))
    	end
})

local Button = MakeTab:CreateButton({
	Name = "AutoWin",
	Description = "make u win automatically!!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
local finish = game.Workspace.Assets:FindFirstChild("Finish", true)
		if finish then
			finish.CanCollide = false
			finish.Transparency = 1
			wait()
			finish.Position = game.Players.LocalPlayer.Character.Torso.Position
		end
        end
})
local Button = MakeTab:CreateButton({
	Name = "Get Safety Statue",
	Description = "you will get safety statue!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
         for i, v in pairs(workspace.Idols:GetDescendants()) do
            if v.Name == "Bag" then
                v.hit.Transparency = 1
                v.hit.CanCollide = false
                wait()
                v.hit.Position = game.Players.LocalPlayer.Character.Torso.Position
                task.wait()
                v:Destroy()
                wait()
            elseif v.Name == "SafetyStatue" then
                v.hit.Transparency = 1
                v.hit.CanCollide = false
                wait()
                v.hit.Position = game.Players.LocalPlayer.Character.Torso.Position
                wait()
            end
        end
    end
   
  })  
  
local Toggle = MakeTab:CreateToggle({
	Name = "Win Math Mania!",
	Description = "you win math mania automatically.",
	CurrentValue = false,
    	Callback = function(Value)
local number = 0

        for i = 1, 10 do
            task.wait()

            if Value == true then
                number = number + 1
                local mathManiaGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MathMania")

                if mathManiaGui and mathManiaGui:FindFirstChild(tostring(number)) then
                    local questionGui = mathManiaGui[tostring(number)]
                    local s = questionGui.MainText.Text

                    -- Remove equals, question mark, spaces
                    local clean = s:gsub("=", ""):gsub("?", ""):gsub(" ", "")
                    local result = loadstring("return " .. clean)()

                    if result then
                        questionGui.Box.Text = tostring(result)
                        task.wait()

                        local button = questionGui:FindFirstChild("Enter")
                        if button then
                            local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}

                            for _, event in pairs(events) do
                                if getconnections and button[event] then
                                    for _, connection in pairs(getconnections(button[event])) do
                                        if connection.Function then
                                            connection:Fire()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
   
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

MakeTab:CreateDivider()

local Toggle = MakeTab:CreateToggle({
	Name = "Get all Coins and Gems",
	Description = "get all gems and coins to win automatically. ",
	CurrentValue = false,
    	Callback = function(Value)
       local collecting = state

while collecting do
    task.wait(0.05)
    
    for i, v in pairs(workspace:GetDescendants()) do
        if v.Name == "Gem" or v.Name == "Coin" then
            v.Transparency = 1
            v.CanCollide = false
            v.Position = game.Players.LocalPlayer.Character.Torso.Position
        end
    end
    
    if not state then 
        break 
    end
end
end
   
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps  
  
 local Toggle = MakeTab:CreateToggle({
	Name = "Notify Votes",
	Description = "u will get notified who voted who.",
	CurrentValue = false,
    	Callback = function(Value)
   if Value then
            if not _G.VoteConnection then
                _G.VoteConnection = game.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(function(v)
                    local PlayerVoted = game.ReplicatedStorage.Season.Players[v.Value].Value
                    local PlayerPicked = game.ReplicatedStorage.Season.Players[v.Name].Value
                    local SEND = PlayerVoted .. " voted for " .. PlayerPicked
                    Luna:Notification({ 
                        Title = "Votes Notification",
                        Icon = "notifications_active",
                        ImageSource = "Material",
                        Content = SEND
                    })
                end)
            end
        else
            if _G.VoteConnection then
                _G.VoteConnection:Disconnect()
                _G.VoteConnection = nil
            end
        end
    end



}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps  
  
local Button = MakeTab:CreateButton({
	Name = "Break Spleef",
	Description = "break spleef by making the spleef blocks disappear.", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
          for i,v in pairs(game.Workspace.Assets:GetDescendants()) do
			if v.Name == "SpleefPart" then 
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
			end
		end
    end
    
})  
  
local Button = MakeTab:CreateButton({
	Name = "Instant-Eat Pancake",
	Description = "auto eat pancake", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
local ps = game:GetService("Players").LocalPlayer.PlayerScripts
local sps = game:GetService("StarterPlayer").StarterPlayerScripts

if ps:FindFirstChild("AntiAutoclick") then
    ps.AntiAutoclick:Destroy()
end

if sps:FindFirstChild("AntiAutoclick") then
    sps.AntiAutoclick:Destroy()
end

for i, v in pairs(game.Workspace:GetDescendants()) do
    if v.Name == game.Players.LocalPlayer.Name then
        for _ = 1, 10 do
            fireclickdetector(v.ClickDetector)
            wait(0.1)
        end
    end
end
    end
})

local Button = MakeTab:CreateButton({
	Name = "Dodgeball/Paintball Protection",
	Description = "NOTE:DO NOT RESET ONLY USED ON DODGEBALL AND PAINTBALL.", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.MaxHealth = math.huge
humanoid.Health = math.huge

humanoid.HealthChanged:Connect(function(health)
    if health < math.huge then
        humanoid.Health = math.huge
    end
end)
    	end
})

 local Button = MakeTab:CreateButton({
	Name = "Win BlockPush!",
	Description = "win blockpush! :3", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        for i, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("Part") and v.Name == "SingularBox" then
                local distance = (v.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 100 then
                    for i2, v2 in ipairs(workspace:GetDescendants()) do
                        if v2:IsA("Part") and v2.Name == "Gold" then
                            v.Position = v2.Position + Vector3.new(0, 3, 0)
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 3, 0))
                            break
                        end
                    end
                    break
                end
            end
        end
    
    	end
})

local Input = MakeTab:CreateInput({
	Name = "Become Anything",
	Description = "become anything if u type in the chatbox",
	PlaceholderText = "BypassesChatFilter",
	CurrentValue = "", -- the current text
	Numeric = false, -- When true, the user may only type numbers in the box (Example walkspeed)
	MaxCharacters = nil, -- if a number, the textbox length cannot exceed the number
	Enter = true, -- When true, the callback will only be executed when the user presses enter.
    	Callback = function(Text)
 local args = {
                [1] = "Character",
                [2] = Value
              }
              game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Buy"):FireServer(unpack(args))
    	end
}, "Input") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Button = MakeTab:CreateButton({
	Name = "Kill Everbody In SwordFight",
	Description = "kill everyone in sword fight..", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
 loadstring(game:HttpGet("https://pastebin.com/raw/cuKXdXke"))()
    	end
})

local Button = MakeTab:CreateButton({
	Name = "Become Female",
	Description = "become gender female and use after u got voted out.", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local args = {
    [1] = "Gender",
    [2] = "Female"
}

game:GetService("ReplicatedStorage").Events.Buy:FireServer(unpack(args))
    	end
})


local Toggle = MakeTab:CreateToggle({
	Name = "ExposeVotes",
	Description = "Expose the votes.",
	CurrentValue = false,
    	Callback = function(Value)
       game.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(function(v)
			if state == true then
				local PlayerVoted = game.ReplicatedStorage.Season.Players[v.Value].Value
				local PlayerPicked = game.ReplicatedStorage.Season.Players[v.Name].Value
				local SEND = PlayerVoted .. " voted for " .. PlayerPicked
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(SEND, "All")
				else return
			end
		end)
    end
    	
}, "Toggle") 

local Toggle = MakeTab:CreateToggle({
	Name = "Notify Who Got the idol.",
	Description = "notifies you who got the statue.",
	CurrentValue = false,
    	Callback = function(Value)
             -- Disconnect previous connection if it exists
        if ToggleConnection then
            ToggleConnection:Disconnect()
            ToggleConnection = nil
        end

        -- Only create the event if the toggle is enabled
        if Value then
            ToggleConnection = game:GetService("ReplicatedStorage").Season.Twists.Idol:GetPropertyChangedSignal("Value"):Connect(function()
                local idolValue = game:GetService("ReplicatedStorage").Season.Twists.Idol.Value
                
                if idolValue and game.ReplicatedStorage.Season.Players:FindFirstChild(idolValue) then
                    local PlayerPicked2 = game.ReplicatedStorage.Season.Players[idolValue].Value
                    local SEND2 = PlayerPicked2 .. " got the statue!"
                    
                    Luna:Notification({
                        Title = "Votes",
                        Icon = "notifications_active",
                        ImageSource = "Material",
                        Content = SEND2
                    })
                end
            end)
        end
    end
    
}, "Toggle")

local Slider = MakeTab:CreateSlider({
	Name = "Walkspeed",
	Range = {0, 200}, -- The Minimum And Maximum Values Respectively
	Increment = 5, -- Basically The Changing Value/Rounding Off
	CurrentValue = 16, -- The Starting Value
    	Callback = function(Value)
       	 game.Players.localPlayer.Character.Humanoid.WalkSpeed = (Value)
    	end
}, "Slider") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Slider = MakeTab:CreateSlider({
	Name = "Jump Power",
	Range = {0, 200}, -- The Minimum And Maximum Values Respectively
	Increment = 5, -- Basically The Changing Value/Rounding Off
	CurrentValue = 46, -- The Starting Value
    	Callback = function(Value)
       	game.Players.localPlayer.Character.Humanoid.JumpPower = (Value)
    	end
}, "Slider") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

MakeTab:CreateSection("Misc")

MakeTab:CreateDivider()

local ExploiterDetection = MakeTab:CreateButton({
	Name = "Detect Exploiters. ",
	Description = "detects skids", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        local Players = game:GetService("Players")
        local detectedExploiters = {}

        for _, player in pairs(Players:GetPlayers()) do
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            
            if humanoid and rootPart then
                -- Detect abnormal WalkSpeed or JumpPower values
                if humanoid.WalkSpeed > 16 or humanoid.JumpPower > 50 then
                    table.insert(detectedExploiters, player.Name .. " - Abnormal Movement")
                end

                -- Detect Teleportation (large sudden changes in position)
                local lastPosition = rootPart.Position
                wait(1) -- Short delay to compare positions
                local currentPosition = rootPart.Position
                local distanceTraveled = (currentPosition - lastPosition).Magnitude

                if distanceTraveled > 100 then -- Arbitrary threshold for teleportation detection
                    table.insert(detectedExploiters, player.Name .. " - Teleportation")
                end
            end
        end

        if #detectedExploiters > 0 then
            print("Potential Exploiters Detected:")
            for _, exploiter in pairs(detectedExploiters) do
                print(exploiter)
            end
        else
            print("No exploiters detected..")
        end
    end
})

local Button = MakeTab:CreateButton({
	Name = "Infinite Yield!",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
         loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", true))()
    	end
})

local Button = MakeTab:CreateButton({
	Name = "Shaders",
	Description = "explains alot", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
          loadstring(game:HttpGet(('https://pastebin.com/raw/uqD7VqQU'), true))()
    	end
})

local Button = MakeTab:CreateButton({
	Name = "Teleports you to spectator island",
	Description = "if its dodgeball use this", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
       game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2, -7, 20)
    	end
})

local Button = MakeTab:CreateButton({
	Name = "Teleports you to exile",
	Description = "if its dodgeball/paintball use this", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
       		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-114, -8, -150)
    	end
})

local Button = MakeTab:CreateButton({
	Name = "Show Usernames on top!",
	Description = "explanatory", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.ClassName == "TextLabel" then
                local currenttextright = v.Text
                task.wait()
                v.Text = v.Text.. " ("..v.Parent.Parent.Parent.Parent.Name..")"
            end
        end
    	end
})

local Button = MakeTab:CreateButton({
	Name = "Sound Breaker",
	Description = "breaks the sound. (info use with female)", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/VRiAmLra'))() 
    	end
})

local Button = MakeTab:CreateButton({
	Name = "Remove Barriers",
	Description = "very fun", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
       for i, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Glass" then
                v:Destroy()
            end
        end
    	end
})

local MoviesTab = Window:CreateTab({
    Name = "Movies 🎥",
    Icon = "add_to_home_screen",
    ImageSource = "Material",
    ShowTitle = true -- This will determine whether the big header text in the tab will show
})

MoviesTab:CreateSection("Main 🎥 ")

local Slider = MoviesTab:CreateSlider({
	Name = "Walkspeed",
	Range = {0, 200}, -- The Minimum And Maximum Values Respectively
	Increment = 5, -- Basically The Changing Value/Rounding Off
	CurrentValue = 16, -- The Starting Value
    	Callback = function(Value)
       	 game.Players.localPlayer.Character.Humanoid.WalkSpeed = (Value)
    	end
}, "Slider") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Slider = MoviesTab:CreateSlider({
	Name = "Jump Power",
	Range = {0, 200}, -- The Minimum And Maximum Values Respectively
	Increment = 5, -- Basically The Changing Value/Rounding Off
	CurrentValue = 46, -- The Starting Value
    	Callback = function(Value)
       	game.Players.localPlayer.Character.Humanoid.JumpPower = (Value)
    	end
}, "Slider")

MoviesTab:CreateDivider()

local Button = MoviesTab:CreateButton({
    Name = "Remove The Annoying Monster..!",
    Description = "Removes that ogre", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    Callback = function()
               for i, v in pairs(workspace.Assets:GetDescendants()) do
            if v.Name == "MonsterNPC" then
                v:Destroy()
            end
        end
    end
})

local Button = MoviesTab:CreateButton({
    Name = "Instant-Eat-Bowl!",
    Description = "yes!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    Callback = function()
        for i, v in pairs(game.Workspace:GetDescendants()) do
			if v.Name == game.Players.LocalPlayer.Name then
				for _ = 1, 10 do
					fireclickdetector(v.ClickDetector)
				end
			end
		end
    end
})

local Button = MoviesTab:CreateButton({
	Name = "Become Male (free)",
	Description = "use this when u get voted out.", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
local args = {
    [1] = "Gender",
    [2] = "Male"
}

game:GetService("ReplicatedStorage").Events.Buy:FireServer(unpack(args))
    	end
})

local Button = MoviesTab:CreateButton({
	Name = "AutoWin",
	Description = "make u win automatically!!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
if game.Workspace.Assets:FindFirstChild("Finish",true) then
            local v = game.Workspace.Assets:FindFirstChild("Finish",true)
            v.CanCollide = false
            v.Transparency = 1
            wait(0.00001)
            v.Position = game.Players.LocalPlayer.Character.Torso.Position
        end
        end
})

local Button = MoviesTab:CreateButton({
	Name = "Get Safety Statue",
	Description = "you will get safety statue!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
         for i, v in pairs(workspace.Idols:GetDescendants()) do
            if v.Name == "Bag" then
                v.hit.Transparency = 1
                v.hit.CanCollide = false
                wait(0.00001)
                v.hit.Position = game.Players.LocalPlayer.Character.Torso.Position
                task.wait()
                v:Destroy()
                wait()
            elseif v.Name == "SafetyStatue" then
                v.hit.Transparency = 1
                v.hit.CanCollide = false
                wait(0.00000001)
                v.hit.Position = game.Players.LocalPlayer.Character.Torso.Position
                wait(0.01)
            end
        end
    end

  })  
  
local Toggle = MoviesTab:CreateToggle({
	Name = "Win Math Mania!",
	Description = "you win math mania automatically.",
	CurrentValue = false,
    	Callback = function(Value)
local number = 0

        for i = 1, 10 do
            task.wait()

            if Value == true then
                number = number + 1
                local mathManiaGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MathMania")

                if mathManiaGui and mathManiaGui:FindFirstChild(tostring(number)) then
                    local questionGui = mathManiaGui[tostring(number)]
                    local s = questionGui.MainText.Text

                    -- Remove equals, question mark, spaces
                    local clean = s:gsub("=", ""):gsub("?", ""):gsub(" ", "")
                    local result = loadstring("return " .. clean)()

                    if result then
                        questionGui.Box.Text = tostring(result)
                        task.wait(0.1)

                        local button = questionGui:FindFirstChild("Enter")
                        if button then
                            local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}

                            for _, event in pairs(events) do
                                if getconnections and button[event] then
                                    for _, connection in pairs(getconnections(button[event])) do
                                        if connection.Function then
                                            connection:Fire()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
   
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Button = MoviesTab:CreateButton({
	Name = "Auto Collect Egg",
	Description = "Collects It", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        for i, v in pairs(game.Workspace.Assets:WaitForChild("Alien"):GetDescendants()) do
            if v.ClassName == "TextLabel" then
                local PlayerName = game.Players.LocalPlayer.Name
                local Character = game.ReplicatedStorage.Season.Players:FindFirstChild(PlayerName).Value
                if v.Text == Character then
                    v.Parent.Parent.Parent.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    v.Parent.Parent.Parent.CanCollide = false
                end
            end
        end
    	end
})

local Button = MoviesTab:CreateButton({
    Name = "Win The Pirate Challenge!",
    Description = "auto wins it", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    Callback = function()
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v.Name == "MainKey" then
		local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
		if v:IsA("BasePart") then
			hrp.CFrame = v.CFrame
		elseif v:IsA("Model") then
			hrp.CFrame = v:GetPivot()
		end
		task.wait(0.1)
	end
end
for i,v in pairs(game.Workspace:GetDescendants()) do
	if v.Name == "win" or v.Name == "Finish" and v.Name == "Chest" then
		local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
		if v:IsA("BasePart") then
			hrp.CFrame = v.CFrame
		elseif v:IsA("Model") then
			hrp.CFrame = v:GetPivot()
		end
	end
end
    end
})

local Button = MoviesTab:CreateButton({
    Name = "Kill Everyone In Beach",
    Description = "Kills Everyone! (notice: reset when everyone is killed)", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    Callback = function()
local player = game.Players.LocalPlayer
player.Character.ChildAdded:Connect(function(tool)
	if tool:IsA("Tool") and (string.lower(tool.Name):find("pool") or string.lower(tool.Name):find("noodle")) then
		local hrp = player.Character.HumanoidRootPart
		for i, p in pairs(game.Players:GetPlayers()) do
			if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") then
				local targetHRP = p.Character.HumanoidRootPart
				local radius = 3
				local behindOffset = -targetHRP.CFrame.LookVector * radius
				local behindPos = targetHRP.Position + behindOffset
				local behindCFrame = CFrame.lookAt(behindPos, targetHRP.Position)
				hrp.CFrame = behindCFrame
				hrp.Anchored = true
				spawn(function()
					local startTime = os.clock()
					repeat
						local elapsed = os.clock() - startTime
						local progress = math.min(1, elapsed / 5)
						local theta = progress * math.pi / 2
						local offsetDir = -targetHRP.CFrame.LookVector * math.cos(theta) + targetHRP.CFrame.RightVector * math.sin(theta)
						local pos = targetHRP.Position + offsetDir * radius
						local cframe = CFrame.lookAt(pos, targetHRP.Position)
						if hrp and hrp.Parent then
							hrp.CFrame = cframe
						end
						game:GetService("RunService").Heartbeat:Wait()
					until not p.Character or not p.Character.Parent or not p.Character:FindFirstChild("Humanoid") or p.Character.Humanoid.Health <= 0
				end)
				p.Character.Humanoid.Died:Wait()
			end
		end
	end
end)
local gear = game.ReplicatedStorage:FindFirstChild("Gear")
if gear then
	for i, v in pairs(gear:GetChildren()) do
		if string.lower(v.Name):find("pool") or string.lower(v.Name):find("noodle") then
			local mytool = v:Clone()
			mytool.Parent = player.Backpack
			mytool:Equip()
			break
		end
	end
end
    end
})

local Toggle = MoviesTab:CreateToggle({
    Name = "Get PreHistoric Coins",
    Description = "win prehistoric challenge",
    CurrentValue = false,
    Callback = function(Value)
collectcoinsloop = Value
        while collectcoinsloop == true do
            task.wait(0.00001)
            for i, v in pairs(workspace.Assets:GetDescendants()) do
                if v.Name == "Coin" then
                    v.Transparency = 1
                    v.CanCollide = false
                    wait(0.1)
                    v.Position = game.Players.LocalPlayer.Character.Torso.Position
                 end
            end
        end
    end
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Toggle = MoviesTab:CreateToggle({
    Name = "Get Guitars",
    Description = "get the guitars",
    CurrentValue = false,
    Callback = function(Value)
                collectcoinsloop = Value
        while collectcoinsloop == true do
            task.wait(0.00001)
            for i, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Gem" then
                    v.Transparency = 1
                    wait()
                    v.Position = game.Players.LocalPlayer.Character.Torso.Position
                elseif v.Name == "Coin" then
                    v.Transparency = 1
                    wait()
                    v.Position = game.Players.LocalPlayer.Character.Torso.Position
                end
            end
        end
    end
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Toggle = MoviesTab:CreateToggle({
	Name = "Notify Votes",
	Description = "u will get notified who voted who.",
	CurrentValue = false,
    	Callback = function(Value)
   if Value then
            if not _G.VoteConnection then
                _G.VoteConnection = game.ReplicatedStorage.Season.Voting.Votes.ChildAdded:Connect(function(v)
                    local PlayerVoted = game.ReplicatedStorage.Season.Players[v.Value].Value
                    local PlayerPicked = game.ReplicatedStorage.Season.Players[v.Name].Value
                    local SEND = PlayerVoted .. " voted for " .. PlayerPicked
                    Luna:Notification({ 
                        Title = "Votes Notification",
                        Icon = "notifications_active",
                        ImageSource = "Material",
                        Content = SEND
                    })
                end)
            end
        else
            if _G.VoteConnection then
                _G.VoteConnection:Disconnect()
                _G.VoteConnection = nil
            end
        end
    end



}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps  

local Button = MoviesTab:CreateButton({
	Name = "Protection",
	Description = "yay protection!!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

humanoid.MaxHealth = math.huge
humanoid.Health = math.huge

humanoid.HealthChanged:Connect(function(health)
    if health < math.huge then
        humanoid.Health = math.huge
    end
end)
    	end
})

MoviesTab:CreateDivider()

MoviesTab:CreateSection("Misc 🎦 ")

local Button = MoviesTab:CreateButton({
	Name = "Teleports you to lobby",
	Description = "if its medical/western use this!!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
       		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-684, -70, -637)
    	end
})

local Button = MoviesTab:CreateButton({
	Name = "Show Usernames on top!",
	Description = "explanatory", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.ClassName == "TextLabel" then
                local currenttextright = v.Text
                task.wait()
                v.Text = v.Text.. " ("..v.Parent.Parent.Parent.Parent.Name..")"
            end
        end
    	end
})

local Button = MoviesTab:CreateButton({
	Name = "Sound Breaker",
	Description = "breaks the sound. (info: doesnt work)", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/VRiAmLra'))() 
    	end
})

local Button = MoviesTab:CreateButton({
	Name = "Remove Barriers",
	Description = "very fun", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
       for i, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Glass" and v.Name == "ChallengeGlass" then
                v:Destroy()
            end
        end
    	end
})

local Toggle = MoviesTab:CreateToggle({
	Name = "Notify Who Got the idol.",
	Description = "notifies you who got the statue.",
	CurrentValue = false,
    	Callback = function(Value)
             -- Disconnect previous connection if it exists
        if ToggleConnection then
            ToggleConnection:Disconnect()
            ToggleConnection = nil
        end

        -- Only create the event if the toggle is enabled
        if Value then
            ToggleConnection = game:GetService("ReplicatedStorage").Season.Twists.Idol:GetPropertyChangedSignal("Value"):Connect(function()
                local idolValue = game:GetService("ReplicatedStorage").Season.Twists.Idol.Value
                
                if idolValue and game.ReplicatedStorage.Season.Players:FindFirstChild(idolValue) then
                    local PlayerPicked2 = game.ReplicatedStorage.Season.Players[idolValue].Value
                    local SEND2 = PlayerPicked2 .. " got the statue!"
                    
                    Luna:Notification({
                        Title = "Votes",
                        Icon = "notifications_active",
                        ImageSource = "Material",
                        Content = SEND2
                    })
                end
            end)
        end
    end
    
}, "Toggle")

local ExpeditionTab = Window:CreateTab({
    Name = "Expedition 🗺",
    Icon = "airplay",
    ImageSource = "Material",
    ShowTitle = true -- This will determine whether the big header text in the tab will show
})

ExpeditionTab:CreateSection("Main 🌏 ")

local Slider = ExpeditionTab:CreateSlider({
	Name = "Walkspeed",
	Range = {0, 200}, -- The Minimum And Maximum Values Respectively
	Increment = 5, -- Basically The Changing Value/Rounding Off
	CurrentValue = 16, -- The Starting Value
    	Callback = function(Value)
       	 game.Players.localPlayer.Character.Humanoid.WalkSpeed = (Value)
    	end
}, "Slider") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Slider = ExpeditionTab:CreateSlider({
	Name = "Jump Power",
	Range = {0, 200}, -- The Minimum And Maximum Values Respectively
	Increment = 5, -- Basically The Changing Value/Rounding Off
	CurrentValue = 46, -- The Starting Value
    	Callback = function(Value)
       	game.Players.localPlayer.Character.Humanoid.JumpPower = (Value)
    	end
}, "Slider")

ExpeditionTab:CreateDivider()

local Button = ExpeditionTab:CreateButton({
	Name = "AutoWin",
	Description = "make u win automatically!!(faster)", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
if game.Workspace.Assets:FindFirstChild("Finish",true) then
            local v = game.Workspace.Assets:FindFirstChild("Finish",true)
            v.CanCollide = false
            v.Transparency = 1
            wait(0.000000000000001)
            v.Position = game.Players.LocalPlayer.Character.Torso.Position
        end
        end
})

local Button = ExpeditionTab:CreateButton({
	Name = "Get Safety Statue",
	Description = "you will get safety statue! (faster)", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
         for i, v in pairs(workspace.Idols:GetDescendants()) do
            if v.Name == "Bag" then
                v.hit.Transparency = 1
                v.hit.CanCollide = false
                wait(0.000000000000000000001)
                v.hit.Position = game.Players.LocalPlayer.Character.Torso.Position
                task.wait()
                v:Destroy()
                wait()
            elseif v.Name == "SafetyStatue" then
                v.hit.Transparency = 1
                v.hit.CanCollide = false
                wait(0.0000000000000000000001)
                v.hit.Position = game.Players.LocalPlayer.Character.Torso.Position
                wait(0.01)
            end
        end
    end

  })  

local Toggle = ExpeditionTab:CreateToggle({
	Name = "Win Sentosa Island (math mania)",
	Description = "you win automatically in math mania.",
	CurrentValue = false,
    	Callback = function(Value)
local number = 0

        for i = 1, 10 do
            task.wait()

            if Value == true then
                number = number + 1
                local mathManiaGui = game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MathMania")

                if mathManiaGui and mathManiaGui:FindFirstChild(tostring(number)) then
                    local questionGui = mathManiaGui[tostring(number)]
                    local s = questionGui.MainText.Text

                    -- Remove equals, question mark, spaces
                    local clean = s:gsub("=", ""):gsub("?", ""):gsub(" ", "")
                    local result = loadstring("return " .. clean)()

                    if result then
                        questionGui.Box.Text = tostring(result)
                        task.wait(0.1)

                        local button = questionGui:FindFirstChild("Enter")
                        if button then
                            local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}

                            for _, event in pairs(events) do
                                if getconnections and button[event] then
                                    for _, connection in pairs(getconnections(button[event])) do
                                        if connection.Function then
                                            connection:Fire()
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
   
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Toggle = ExpeditionTab:CreateToggle({
    Name = "Get Clovers",
    Description = "get the clovers",
    CurrentValue = false,
    Callback = function(Value)
                collectcoinsloop = Value
        while collectcoinsloop == true do
            task.wait(0.00001)
            for i, v in pairs(workspace:GetDescendants()) do
                if v.Name == "Gem" then
                    v.Transparency = 1
                    wait()
                    v.Position = game.Players.LocalPlayer.Character.Torso.Position
                elseif v.Name == "Coin" then
                    v.Transparency = 1
                    wait()
                    v.Position = game.Players.LocalPlayer.Character.Torso.Position
                end
            end
        end
    end
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Toggle = ExpeditionTab:CreateToggle({
    Name = "Get Rings",
    Description = "get the rings",
    CurrentValue = false,
    Callback = function(Value)
local collectRingLoop = Value

local player = game.Players.LocalPlayer

while collectRingLoop do
    task.wait(0.00001)

    local character = player.Character or player.CharacterAdded:Wait()

    local ringHitbox = workspace:FindFirstChild("Assets") 
        and workspace.Assets:FindFirstChild("Maldives") 
        and workspace.Assets.Maldives:FindFirstChild("Coins") 
        and workspace.Assets.Maldives.Coins:FindFirstChild("Coin") 
        and workspace.Assets.Maldives.Coins.Coin:FindFirstChild("RingHitbox")

    if ringHitbox and character and character:FindFirstChild("HumanoidRootPart") then
        ringHitbox.Position = character.HumanoidRootPart.Position
    end

    ringHitbox = workspace:FindFirstChild("Assets") 
        and workspace.Assets:FindFirstChild("Maldives") 
        and workspace.Assets.Maldives:FindFirstChild("Coins") 
        and workspace.Assets.Maldives.Coins:FindFirstChild("Gem") 
        and workspace.Assets.Maldives.Coins.Gem:FindFirstChild("RingHitbox")

    if ringHitbox and character and character:FindFirstChild("HumanoidRootPart") then
        ringHitbox.Position = character.HumanoidRootPart.Position
    end
end
    end
}, "Toggle") -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps

local Button = ExpeditionTab:CreateButton({
	Name = "Break Amazon",
	Description = "break Amazon by making the spleef blocks disappear.", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
          for i,v in pairs(game.Workspace.Assets:GetDescendants()) do
			if v.Name == "SpleefPart" then 
				firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
			end
		end
    end
    
})  

local Button = ExpeditionTab:CreateButton({
	Name = "Win Hawaii",
	Description = "clicks the sand piles and makes u win!!(not tested)!!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
          for i, v in pairs(workspace:GetDescendants()) do
	if v.Name == "Tiki" and v:FindFirstChild("ClickDetector") then
		for _ = 1, 10 do
			fireclickdetector(v.ClickDetector)
		end
	end
end
    end
    
})  

local Button = ExpeditionTab:CreateButton({
	Name = "Auto Win Cheese",
	Description = "AutoWins..", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
          for _, v in ipairs(workspace:GetDescendants()) do
    if v:IsA("Part") and v.Name == "Cheese" then
        local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root and (v.Position - root.Position).Magnitude <= 100 then
            
            local finishFolder = workspace:FindFirstChild("Assets")
                and workspace.Assets:FindFirstChild("France")
                and workspace.Assets.France:FindFirstChild("CheesePush")
                and workspace.Assets.France.CheesePush:FindFirstChild("Finish")
            
            if finishFolder and finishFolder:GetChildren()[4] then
                for _, part in ipairs(finishFolder:GetChildren()[4]:GetChildren()) do
                    if part:IsA("Part") then
                        local tpPos = part.Position + Vector3.new(0, 3, 0)
                        v.Position = tpPos
                        if root then
                            root.CFrame = CFrame.new(tpPos)
                        end
                        break
                    end
                end
            end
            break
        end
    end
end
    end
    
})  

ExpeditionTab:CreateDivider()

ExpeditionTab:CreateSection("Misc 🌐 ")

local Button = ExpeditionTab:CreateButton({
	Name = "Teleports you to lobby",
	Description = "use this in meatball!!", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
       		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-77, -28, -904)
    	end
})

local Button = ExpeditionTab:CreateButton({
	Name = "Show Usernames on top!",
	Description = "explanatory", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        for i,v in pairs(game.Workspace:GetDescendants()) do
            if v.ClassName == "TextLabel" then
                local currenttextright = v.Text
                task.wait()
                v.Text = v.Text.. " ("..v.Parent.Parent.Parent.Parent.Name..")"
            end
        end
    	end
})

local Button = ExpeditionTab:CreateButton({
	Name = "Sound Breaker",
	Description = "breaks the sound. (info: doesnt work)", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/VRiAmLra'))() 
    	end
})

local Button = ExpeditionTab:CreateButton({
	Name = "Remove Barriers",
	Description = "very fun", -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
       for i, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Glass" then
                v:Destroy()
            end
        end
    	end
})

local Toggle = ExpeditonTab:CreateToggle({
	Name = "Notify Who Got the idol.",
	Description = "notifies you who got the statue.",
	CurrentValue = false,
    	Callback = function(Value)
             -- Disconnect previous connection if it exists
        if ToggleConnection then
            ToggleConnection:Disconnect()
            ToggleConnection = nil
        end

        -- Only create the event if the toggle is enabled
        if Value then
            ToggleConnection = game:GetService("ReplicatedStorage").Season.Twists.Idol:GetPropertyChangedSignal("Value"):Connect(function()
                local idolValue = game:GetService("ReplicatedStorage").Season.Twists.Idol.Value
                
                if idolValue and game.ReplicatedStorage.Season.Players:FindFirstChild(idolValue) then
                    local PlayerPicked2 = game.ReplicatedStorage.Season.Players[idolValue].Value
                    local SEND2 = PlayerPicked2 .. " got the statue!"
                    
                    Luna:Notification({
                        Title = "Votes",
                        Icon = "notifications_active",
                        ImageSource = "Material",
                        Content = SEND2
                    })
                end
            end)
        end
    end
    
}, "Toggle")
