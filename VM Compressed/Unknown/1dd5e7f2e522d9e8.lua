UserInputService = game:GetService("UserInputService")   


local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

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


Rayfield:Notify({
	Title = "Ender Hub",
	Content = "Welcome! You have succesfuly executed this script. Feel free to join the Discord Server, invite is in the 'DISCORD' Tab. Huge creds and thanks to yofriendfromschool1",
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



local MainTab = Window:CreateTab("Main", 4483362458 ) -- Title, Image
local Section = MainTab:CreateSection("Main", true)
local gameids = {
	286090429, -- aresnal
	142823291, -- mm2
	2753915549, -- blox fruits
	4442272183, -- blox fruits tp
	7449423635, -- blox fruits tp 2
	6872265039, -- bedwars
	6872274481, -- bedwars tp
	8444591321, -- bedwars tp 2
	8560631822, -- bedwars tp 3
	6516141723, -- doors
	6839171747, -- doors main
	8737899170, -- pet sim 99
	16498369169, -- pet sim 99 tp
	155615604, -- prison life
	6403373529, -- slap battles
	301549746, -- counter blox
	13772394625, -- blade ball
	14732610803, -- blade ball tp
	14915220621, -- blade ball tp 2
	15144787112, -- blade ball tp 3
	15264892126, -- blade ball tp 4
	15509350986, -- blade ball tp 5
	16281300371, -- blade ball tp 6
	3956818381 -- ninja legends
}
local MiscTab
for i, v in pairs(gameids) do
	if table.find(gameids, game.PlaceId) then
		MiscTab = Window:CreateTab("Misc", nil ) -- Title, Image
		Section = MiscTab:CreateSection("Main", true)
		break
	else
		MiscTab = MainTab
	end
end
-- Arsenal
if game.PlaceId == 286090429 then
	
	local Button = MainTab:CreateButton({
		Name = "Thunder Client",
		Info = "OP Script.", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/AndrewDarkyy/ThunderClient/main/main.lua"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Owl Hub",
		Info = "Universal.", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Tbao Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/tobi437a/Scripts/main/958f8e21b7d85c61ef5456e6.lua'))()
		end,
	}) 



	 -- MM2
elseif game.PlaceId == 142823291 then  

	local Button = MainTab:CreateButton({
		Name = "Murder Mystery 2 ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet('https://scripts.luawl.com/Main/Scourge.lua'))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Lunar Hub ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/vwSaraa/LunarHub/main/mm2"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Byte Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			for i, v in game:GetService("CoreGui"):GetChildren() do
				if v.Name == 'Discord' then
					v:Destroy()
				end
				if v:FindFirstChild('MurdLabel') then
					v:Destroy()
				end
			end
			local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()
			local ImageLabel = Instance.new("ImageLabel", Instance.new("ScreenGui", gethui()))
			ImageLabel.Image = ''
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Position = UDim2.new(.5, 0, .1, 0)
			ImageLabel.AnchorPoint = Vector2.new(.5, .1)
			ImageLabel.Size = UDim2.new(.1, 0, .2, 0)
			ImageLabel.Name = 'MurdLabel'
			ImageLabel.Parent.ResetOnSpawn = false
			local Part = Instance.new("Part", game:GetService("Workspace"))
			Part.Name = "Running Part"
			Part.Position = Vector3.new(0, 1000, 0)
			Part.Anchored = true
			Part.CanCollide = true
			Part.Size = Vector3.new(5, 1, 5)
			local Plr = game:GetService("Players").LocalPlayer
			   
			local vim = game:GetService('VirtualInputManager');
			function GetMurderer()
				for i, v in game:GetService("Players"):GetChildren() do
					if v.Backpack:FindFirstChild"Knife" or v.Character and v.Character:FindFirstChild("Knife") then
						return v.Character
					end
				end
				return nil
			end
			local win = DiscordLib:Window("Murder Mystery 2")
			local serv = win:Server("ByteHub", "http://www.roblox.com/asset/?id=6031075938")
			function Notify(Title, Text, ButtonText)
				DiscordLib:Notification(Title, Text, ButtonText)
			end
			function Seperate(Tab)
				Tab:Seperator()
			end
			function Channel(Name)
				return serv:Channel(tostring(Name))
			end
			function Label(Tab, Text)
				returnTab:Label(tostring(Text))
			end
			function TextBox(Tab, Text, Placeholder, Callback)
				return Tab:Textbox(tostring(Text), tostring(Placeholder), true, Callback)
			end
			function DropDown(Tab, Text, Options, Callback)
				return Tab:Dropdown(tostring(Text), tostring(Options), Callback)
			end
			function Toggle(Tab, Text, Default, Callback)
				return Tab:Toggle(tostring(Text), Default, Callback)
			end
			function Button(Tab, Text, Callback)
				return Tab:Button(tostring(Text), Callback)
			end
			local Main = Channel("Main")
			local Main2 = Channel("Game")
			local SayMessageRequest = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
			local G = Channel("UI")
			Button(Main, "Murderer & Sherrif Finder", function()
				local a = game:GetService("Players"):GetChildren()
				table.remove(a, 1)
				for i, v in a do
					if v.Backpack:FindFirstChild("Gun") or v.Character:FindFirstChild("Gun") then
						if CMS then
							SayMessageRequest:FireServer(v.DisplayName .. " is sherrif.", "normalchat")
						else
							Notify("Sherrif Found!", v.DisplayName .. " is sherrif", "Okay")
						end
					elseif v.Backpack:FindFirstChild("Knife") or v.Character:FindFirstChild("Knife") then
						if not CMS then
							Notify("Murderer Found!" , v.DisplayName .. " is murderer.", "Okay")
						else
							SayMessageRequest:FireServer(v.DisplayName .. " is murderer.", "normalchat")
						end
					end
				end
			end)
			Button(Main, "Kill All (Murderer Only)", function()
				for i, v in game:GetService("Players"):GetChildren() do
					if Plr.Backpack:FindFirstChild("Knife") then
						Plr.Backpack.Knife.Parent = Plr.Character
					end
					Plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
					local args = {
						[1] = "Slash"
					}
					Plr.Character.Knife:WaitForChild("Stab"):FireServer(unpack(args))
					task.wait(.25)
				end
			end)
			Button(Main, "Teleport To Lobby", function()
				Plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Lobby.Spawns.Spawn.CFrame
			end)
			Button(G, "Center UI", function()
				game:GetService("CoreGui"):WaitForChild("Discord").MainFrame.Position = UDim2.new(.5, 0, .5, 0)
				game:GetService("CoreGui"):WaitForChild("Discord").MainFrame.AnchorPoint = Vector2.new(.5, 0.5)
			end)
			Button(Main, "Grab Gun", function()
				pcall(function()
					Plr.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").GunDrop.CFrame
				end)
			end)
			Button(Main, "Teleport to murderer", function()
				Plr.Character.HumanoidRootPart.CFrame = GetMurderer() ~= nil and GetMurderer().HumanoidRootPart.CFrame or Plr.Character.HumanoidRootPart.CFrame
			end)
			Button(Main2, "Rejoin", function()
				game:GetService('TeleportService'):Teleport(game.PlaceId, Plr)
			end)
			Button(Main2, "Serverhop", function()
				local module = loadstring(game:HttpGet"https://raw.githubusercontent.com/LeoKholYt/roblox/main/lk_serverhop.lua")()
			   
				module:Teleport(game.PlaceId)
			end)
			Button(Main2, 'Remove lights', function()
				game:GetService("Workspace").Normal.Map.Parts.Light:ClearAllChildren()
			end)
			Toggle(Main, "Auto Escape Murderer", false, function(state)
				AE = state
			end)
			Toggle(Main, "Auto Shoot Murderer", false, function(state)
				ASM = state
			end)
			Toggle(Main, "Auto Take Gun", false, function(state)
				ATG = state
			end)
			Toggle(Main, "Chat Murderer and Sherrif Finder's results", false, function(state)
				CMS = state
			end)
			game:GetService("Workspace").ChildAdded:Connect(function(child)
				if child.Name == "GunDrop" and ATG and GetMurderer() ~= Plr.Character then
					print("Gun dropped!")
					while child and task.wait() do
						if (GetMurderer().Head.Position - child.Position).magnitude < 10 then
							repeat
								task.wait()
							until (GetMurderer().Head.Position - child.Position).magnitude > 10
						end
						Grabbing = true
						Plr.Character.HumanoidRootPart.CFrame = child.CFrame + Vector3.new(0, .5, 0)
					end
					Grabbing = false
				end
			end)
			function GetMurd()
				return game:GetService("Players"):GetPlayerFromCharacter(GetMurderer())
			end
			function MurdererLoop()
				if ASM and Plr.Character and GetMurderer() and Plr.Character:FindFirstChild("Gun") or Plr.Backpack:FindFirstChild("Gun") then
					if Plr.Backpack:FindFirstChild("Gun") then
						Plr.Backpack.Gun.Parent = Plr.Character
					end
					local Murd = GetMurderer()
					Plr.Character.HumanoidRootPart.CFrame = Murd.HumanoidRootPart.CFrame - Murd.Head.CFrame.LookVector * 10
					Plr.Character.Gun.KnifeServer.ShootGun:InvokeServer(1, Murd.HumanoidRootPart.Position, "AH")
				end
				task.wait(.5)
			end
			function SecondLoop()
				if GetMurderer() == Plr.Character or GetMurderer() == nil or not AE then
					ImageLabel.Image = ''
					return
				end
				ImageLabel.Image = game:GetService('Players'):GetUserThumbnailAsync(GetMurd().UserId, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size150x150)
				if (GetMurderer().HumanoidRootPart.Position - Plr.Character.HumanoidRootPart.Position).magnitude < 15 and not tpedtoPos and not Grabbing then
					tpedtoPos = Plr.Character.HumanoidRootPart.CFrame
					Plr.Character.HumanoidRootPart.CFrame = Part.CFrame + Vector3.new(0, 3, 0)
				elseif tpedtoPos and (GetMurderer().HumanoidRootPart.Position - Vector3.new(tpedtoPos.X, tpedtoPos.Y, tpedtoPos.Z)).magnitude > 10 and not Grabbing then
					Plr.Character.HumanoidRootPart.CFrame = tpedtoPos
					tpedtoPos = nil
				end
			end
			Main2 = Channel("Freezers & Runners")
			Button(Main2, "Unfreeze All", function()
				for i, v in game:GetService("Players"):GetChildren() do
					if v ~= Plr and not v.Backpack:FindFirstChild("Knife") or v.Character and not v.Character:FindFirstChild("Knife") then
						Plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
						task.wait(.75)
					end
				end
			end)
			Button(Main2, "Freeze All", function()
				for i, v in game:GetService("Players"):GetChildren() do
					if v ~= Plr and not v.Backpack:FindFirstChild("Knife") or v.Character and not v.Character:FindFirstChild("Knife") then
						if Plr.Backpack:FindFirstChild("Knife") then
							Plr.Backpack.Knife.Parent = Plr.Character
						end
						Plr.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
						local args = {
							[1] = "Slash"
						}
						Plr.Character.Knife:WaitForChild("Stab"):FireServer(unpack(args))
						task.wait(.25)
					end
				end
			end)
			game:GetService("RunService").Heartbeat:Connect(MurdererLoop)
			game:GetService("RunService").Heartbeat:Connect(SecondLoop)
			game:GetService("CoreGui"):WaitForChild("Discord").DisplayOrder = -1
		end,
	})

	 -------------------------------------------------------------------END OF SCRIPT------------------------------------------------------------------------------------------

	 -- BloxFruits
elseif game.PlaceId == 2753915549 or game.PlaceId == 4442272183 or game.PlaceId == 7449423635 then
	
	local Button = MainTab:CreateButton({
		Name = "RedZ Hub (BEST) ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Loli Hub  ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Cyber-Nonename/LoliHubV2/main/V2LoliHub"))()  
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Hoho Hub (KEY) ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/REDzHUB/BloxFruits/main/redz9999"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Chifa Hub ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/KindIhave/ChibaHuB/main/Chiba-BF.txt'))()
		end,
	})
	 
  --Bedwars
elseif game.PlaceId == 6872265039 or game.PlaceId == 6872274481 or game.PlaceId == 8444591321 or game.PlaceId == 8560631822 then

	local Button = MainTab:CreateButton({
		Name = "Vape ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Artis Hub ",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/lightHubDev/Artis/main/MainScript"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Raven B4",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://pastebin.com/raw/DzAdmNq1"))()
		end,
	})

 --Doors 
elseif game.PlaceId == 6516141723 or game.PlaceId == 6839171747 then 

	local Button = MainTab:CreateButton({
		Name = "MSHub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "BlackKing X BobHub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGetAsync("https://pastebin.com/raw/R8QMbhzv"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Doors Script",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
			local Window = OrionLib:MakeWindow({
				IntroText = "Doors GUI ",
				Name = "Doors",
				HidePremium = false,
				SaveConfig = true,
				ConfigFolder = "DoorsSex"
			})
			if game.PlaceId == 6516141723 then
				OrionLib:MakeNotification({
					Name = "Error",
					Content = "Please execute when in game, not in lobby.",
					Time = 6
				})
			end
			local VisualsTab = Window:MakeTab({
				Name = "Visuals",
				Icon = "rbxassetid://4483345998",
				PremiumOnly = false
			})
			local CF = CFrame.new
			local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom
			local ChaseStart = game:GetService("ReplicatedStorage").GameData.ChaseStart
			local KeyChams = {}
			VisualsTab:AddToggle({
				Name = "Key Chams",
				Default = false,
				Flag = "KeyToggle",
				Save = true,
				Callback = function(Value)
					for i, v in pairs(KeyChams) do
						v.Enabled = Value
					end
				end
			})
			local function ApplyKeyChams(inst)
				wait()
				local Cham = Instance.new("Highlight")
				Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				Cham.FillColor = Color3.new(0.980392, 0.670588, 0)
				Cham.FillTransparency = 0.5
				Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
				Cham.Parent = game:GetService("CoreGui")
				Cham.Adornee = inst
				Cham.Enabled = OrionLib.Flags["KeyToggle"].Value
				Cham.RobloxLocked = true
				return Cham
			end
			local KeyCoroutine = coroutine.create(function()
				game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(inst)
					if inst.Name == "KeyObtain" then
						table.insert(KeyChams, ApplyKeyChams(inst))
					end
				end)
			end)
			for i, v in ipairs(game:GetService("Workspace"):GetDescendants()) do
				if v.Name == "KeyObtain" then
					table.insert(KeyChams, ApplyKeyChams(v))
				end
			end
			coroutine.resume(KeyCoroutine)
			local BookChams = {}
			VisualsTab:AddToggle({
				Name = "Book Chams",
				Default = false,
				Flag = "BookToggle",
				Save = true,
				Callback = function(Value)
					for i, v in pairs(BookChams) do
						v.Enabled = Value
					end
				end
			})
			local FigureChams = {}
			VisualsTab:AddToggle({
				Name = "Figure Chams",
				Default = false,
				Flag = "FigureToggle",
				Save = true,
				Callback = function(Value)
					for i, v in pairs(FigureChams) do
						v.Enabled = Value
					end
				end
			})
			local function ApplyBookChams(inst)
				if inst:IsDescendantOf(game:GetService("Workspace").CurrentRooms:FindFirstChild("50")) and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value == 50 then
					wait()
					local Cham = Instance.new("Highlight")
					Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					Cham.FillColor = Color3.new(0, 1, 0.749019)
					Cham.FillTransparency = 0.5
					Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
					Cham.Parent = game:GetService("CoreGui")
					Cham.Enabled = OrionLib.Flags["BookToggle"].Value
					Cham.Adornee = inst
					Cham.RobloxLocked = true
					return Cham
				end
			end
			local function ApplyEntityChams(inst)
				wait()
				local Cham = Instance.new("Highlight")
				Cham.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				Cham.FillColor = Color3.new(1, 0, 0)
				Cham.FillTransparency = 0.5
				Cham.OutlineColor = Color3.new(0.792156, 0.792156, 0.792156)
				Cham.Parent = game:GetService("CoreGui")
				Cham.Enabled = OrionLib.Flags["FigureToggle"].Value
				Cham.Adornee = inst
				Cham.RobloxLocked = true
				return Cham
			end
			local BookCoroutine = coroutine.create(function()
				task.wait(1)
				for i, v in pairs(game:GetService("Workspace").CurrentRooms["50"].Assets:GetDescendants()) do
					if v.Name == "LiveHintBook" then
						table.insert(BookChams, ApplyBookChams(v))
					end
				end
			end)
			local EntityCoroutine = coroutine.create(function()
				local Entity = game:GetService("Workspace").CurrentRooms["50"].FigureSetup:WaitForChild("FigureRagdoll", 5)
				Entity:WaitForChild("Torso", 2.5)
				table.insert(FigureChams, ApplyEntityChams(Entity))
			end)
			local GameTab = Window:MakeTab({
				Name = "Game",
				Icon = "rbxassetid://4483345998",
				PremiumOnly = false
			})
			local CharTab = Window:MakeTab({
				Name = "Character",
				Icon = "rbxassetid://4483345998",
				PremiumOnly = false
			})
			local TargetWalkspeed
			CharTab:AddSlider({
				Name = "Speed",
				Min = 0,
				Max = 50,
				Default = 5,
				Color = Color3.fromRGB(255, 255, 255),
				Increment = 1,
				Callback = function(Value)
					TargetWalkspeed = Value
				end
			})
			local pcl = Instance.new("SpotLight")
			pcl.Brightness = 1
			pcl.Face = Enum.NormalId.Front
			pcl.Range = 90
			pcl.Parent = game:GetService("Players").LocalPlayer.Character.Head
			pcl.Enabled = false
			CharTab:AddToggle({
				Name = "Headlight",
				Default = false,
				Callback = function(Value)
					pcl.Enabled = Value
				end
			})
			GameTab:AddToggle({
				Name = "No seek arms/obstructions",
				Default = false,
				Flag = "NoSeek",
				Save = true
			})
			GameTab:AddToggle({
				Name = "Instant Interact",
				Default = false,
				Flag = "InstantToggle",
				Save = true
			})
			GameTab:AddButton({
				Name = "Skip level",
				Callback = function()
					pcall(function()
						local HasKey = false
						local CurrentDoor = game:GetService("Workspace").CurrentRooms[tostring(game:GetService("ReplicatedStorage").GameData.LatestRoom.Value)]:WaitForChild("Door")
						for i, v in ipairs(CurrentDoor.Parent:GetDescendants()) do
							if v.Name == "KeyObtain" then
								HasKey = v
							end
						end
						if HasKey then
							game:GetService("Players").LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
							wait(0.3)
							fireproximityprompt(HasKey.ModulePrompt, 0)
							game:GetService("Players").LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
							wait(0.3)
							fireproximityprompt(CurrentDoor.Lock.UnlockPrompt, 0)
						end
						if LatestRoom == 50 then
							CurrentDoor = game:GetService("Workspace").CurrentRooms[tostring(LatestRoom + 1)]:WaitForChild("Door")
						end
						game:GetService("Players").LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
						wait(0.3)
						CurrentDoor.ClientOpen:FireServer()
					end)
				end
			})
			GameTab:AddToggle({
				Name = "Auto skip level",
				Default = false,
				Save = false,
				Flag = "AutoSkip"
			})
			local AutoSkipCoro = coroutine.create(function()
				while true do
					task.wait()
					pcall(function()
						if OrionLib.Flags["AutoSkip"].Value == true and game:GetService("ReplicatedStorage").GameData.LatestRoom.Value < 100 then
							local HasKey = false
							local LatestRoom = game:GetService("ReplicatedStorage").GameData.LatestRoom.Value
							local CurrentDoor = game:GetService("Workspace").CurrentRooms[tostring(LatestRoom)]:WaitForChild("Door")
							for i, v in ipairs(CurrentDoor.Parent:GetDescendants()) do
								if v.Name == "KeyObtain" then
									HasKey = v
								end
							end
							if HasKey then
								game:GetService("Players").LocalPlayer.Character:PivotTo(CF(HasKey.Hitbox.Position))
								task.wait(0.3)
								fireproximityprompt(HasKey.ModulePrompt, 0)
								game:GetService("Players").LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
								task.wait(0.3)
								fireproximityprompt(CurrentDoor.Lock.UnlockPrompt, 0)
							end
							if LatestRoom == 50 then
								CurrentDoor = game:GetService("Workspace").CurrentRooms[tostring(LatestRoom + 1)]:WaitForChild("Door")
							end
							game:GetService("Players").LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
							task.wait(0.3)
							CurrentDoor.ClientOpen:FireServer()
						end
					end)
				end
			end)
			coroutine.resume(AutoSkipCoro)
			GameTab:AddButton({
				Name = "No jumpscares",
				Callback = function()
					pcall(function()
						game:GetService("ReplicatedStorage").Bricks.Jumpscare:Destroy()
					end)
				end
			})
			GameTab:AddToggle({
				Name = "Avoid Rush/Ambush",
				Default = false,
				Flag = "AvoidRushToggle",
				Save = true
			})
			GameTab:AddToggle({
				Name = "No Screech",
				Default = false,
				Flag = "ScreechToggle",
				Save = true
			})
			GameTab:AddToggle({
				Name = "Always win heartbeat",
				Default = false,
				Flag = "HeartbeatWin",
				Save = true
			})
			GameTab:AddToggle({
				Name = "Predict chases",
				Default = false,
				Flag = "PredictToggle" ,
				Save = true
			})
			GameTab:AddToggle({
				Name = "Notify when mob spawns",
				Default = false,
				Flag = "MobToggle" ,
				Save = true
			})
			GameTab:AddButton({
				Name = "Complete breaker box minigame",
				Callback = function()
					game:GetService("ReplicatedStorage").Bricks.EBF:FireServer()
				end
			})
			GameTab:AddButton({
				Name = "Skip level 50",
				Callback = function()
					local CurrentDoor = game:GetService("Workspace").CurrentRooms[tostring(LatestRoom + 1)]:WaitForChild("Door")
					game:GetService("Players").LocalPlayer.Character:PivotTo(CF(CurrentDoor.Door.Position))
				end
			})
			GameTab:AddParagraph("Warning", "You may need to open/close the panel a few times for this to work, fixing soon.")

	--// ok actual code starts here
			game:GetService("RunService").RenderStepped:Connect(function()
				pcall(function()
					if game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
						game:GetService("Players").LocalPlayer.Character:TranslateBy(game:GetService("Players").LocalPlayer.Character.Humanoid.MoveDirection * TargetWalkspeed / 50)
					end
				end)
			end)
			game:GetService("Workspace").CurrentRooms.DescendantAdded:Connect(function(descendant)
				if OrionLib.Flags["NoSeek"].Value == true and descendant.Name == ("Seek_Arm" or "ChandelierObstruction") then
					task.spawn(function()
						wait()
						descendant:Destroy()
					end)
				end
			end)
			game:GetService("ProximityPromptService").PromptButtonHoldBegan:Connect(function(prompt)
				if OrionLib.Flags["InstantToggle"].Value == true then
					fireproximityprompt(prompt)
				end
			end)
			local old
			old = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
				local args = {
					...
				}
				local method = getnamecallmethod()
				if tostring(self) == 'Screech' and method == "FireServer" and OrionLib.Flags["ScreechToggle"].Value == true then
					args[1] = true
					return old(self, unpack(args))
				end
				if tostring(self) == 'ClutchHeartbeat' and method == "FireServer" and OrionLib.Flags["HeartbeatWin"].Value == true then
					args[2] = true
					return old(self, unpack(args))
				end
				return old(self, ...)
			end))
			game:GetService("Workspace").CurrentCamera.ChildAdded:Connect(function(child)
				if child.Name == "Screech" and OrionLib.Flags["ScreechToggle"].Value == true then
					child:Destroy()
				end
			end)
			local NotificationCoroutine = coroutine.create(function()
				LatestRoom.Changed:Connect(function()
					if OrionLib.Flags["PredictToggle"].Value == true then
						local n = ChaseStart.Value - LatestRoom.Value
						if 0 < n and n < 4 then
							OrionLib:MakeNotification({
								Name = "Warning!",
								Content = "Event in " .. tostring(n) .. " rooms.",
								Time = 5
							})
						end
					end
					if OrionLib.Flags["BookToggle"].Value == true then
						if LatestRoom.Value == 50 then
							coroutine.resume(BookCoroutine)
						end
					end
					if OrionLib.Flags["FigureToggle"].Value == true then
						if LatestRoom.Value == 50 then
							coroutine.resume(EntityCoroutine)
						end
					end
				end)
				game:GetService("Workspace").ChildAdded:Connect(function(inst)
					if inst.Name == "RushMoving" and OrionLib.Flags["MobToggle"].Value == true then
						if OrionLib.Flags["AvoidRushToggle"].Value == true then
							OrionLib:MakeNotification({
								Name = "Warning!",
								Content = "Avoiding Rush. Please wait.",
								Time = 5
							})
							local OldPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
							local con = game:GetService("RunService").Heartbeat:Connect(function()
								game:GetService("Players").LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0, 20, 0))
							end)
							inst.Destroying:Wait()
							con:Disconnect()
							game:GetService("Players").LocalPlayer.Character:MoveTo(OldPos)
						else
							OrionLib:MakeNotification({
								Name = "Warning!",
								Content = "Rush has spawned, hide!",
								Time = 5
							})
						end
					elseif inst.Name == "AmbushMoving" and OrionLib.Flags["MobToggle"].Value == true then
						if OrionLib.Flags["AvoidRushToggle"].Value == true then
							OrionLib:MakeNotification({
								Name = "Warning!",
								Content = "Avoiding Ambush. Please wait.",
								Time = 5
							})
							local OldPos = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position
							local con = game:GetService("RunService").Heartbeat:Connect(function()
								game:GetService("Players").LocalPlayer.Character:MoveTo(OldPos + Vector3.new(0, 20, 0))
							end)
							inst.Destroying:Wait()
							con:Disconnect()
							game:GetService("Players").LocalPlayer.Character:MoveTo(OldPos)
						else
							OrionLib:MakeNotification({
								Name = "Warning!",
								Content = "Ambush has spawned, hide!",
								Time = 5
							})
						end
					end
				end)
			end)

	--// ok actual code ends here
			coroutine.resume(NotificationCoroutine)
			OrionLib:Init()
			task.wait(2)
		end,
	})
		--------------------------------------------------------------------------------END OF SCRIPT---------------------------------------------------------------------
		--Pet Simulator 99
elseif game.PlaceId == 8737899170 or game.PlaceId == 16498369169 then 


	local Button = MainTab:CreateButton({
		Name = "Zap Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet('https://zaphub.xyz/Exec'))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "ZER0 Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Discord0000/Zer0Hub/main/MainScript.lua"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Anti-Stealer",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			local genv = getgenv()
			local renv = getrenv()
			local clonefunction = genv and genv.clonefunction or function(...)
				return ...
			end
			local cloneref = genv and genv.cloneref or function(...)
				return ...
			end
			local hook = genv and genv.hookfunction or function(...)
				return ...
			end
			local realtype = clonefunction(renv.typeof)
			local rawget = clonefunction(renv.rawget)
			local game = cloneref(renv.game)
			local select = clonefunction(renv.select)
			local IsA = clonefunction(game.IsA)
			local getgc = clonefunction(genv.getgc or function()
				return {}
			end)
			local getmethod = clonefunction(genv.getnamecallmethod or function()
				return "InvokeServer"
			end)
			local Index = clonefunction(getrawmetatable(game).__index)
			local Players = cloneref(game:GetService("Players"))
			local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
			local Player = Players.LocalPlayer or Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
			local Mailbox = ReplicatedStorage:WaitForChild("Network"):WaitForChild("Mailbox: Send", 9e9)
			local Kick = clonefunction(Player.Kick)
			local Client = {}
			for _, v in getgc(true) do
				if realtype(v) == "table" and rawget(v, "PetCmds") and rawget(v, "BreakableCmds") then
					Client = v
				end
			end
			if not Client and Index(game, "PlaceId") == 8737899170 then
				Kick(Player, "Couldn't find the BIG GAMES Library!")
			end
			local SlaveFunc = cloneref(Instance.new("RemoteFunction"))
			local Invoke = SlaveFunc.InvokeServer
			local OldInvoke
			OldInvoke = hook(Invoke, newcclosure(function(...)
				local Self, Args = ..., {
					select(2, ...)
				}
				if realtype(Self) == "Instance" and IsA(Self, "RemoteFunction") then
					if Self == Mailbox or Index(Self, "Name") == "Mailbox: Send" then
						return "err"
					end
				end
				return OldInvoke(...)
			end))
			local OldNamecall
			OldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(...)
				local Self, Args = ..., {
					select(2, ...)
				}
				local Method = getmethod()
				if realtype(Self) == "Instance" and IsA(Self, "RemoteFunction") then
					if Self == Mailbox or Index(Self, "Name") == "Mailbox: Send" and (Method == "InvokeServer" or Method == "invokeServer") then
						return "err"
					end
				end
				return OldNamecall(...)
			end))
			loadstring(game:GetObjects("rbxassetid://15900013841")[1].Source)()
		end,
	})
   -----------------------------------------------------------------------END OF SCRIPT -----------------------------------------------------------
   --Da Hood
elseif game.PlaceId ==  155615604   then


	local Button = MainTab:CreateButton({
		Name = "Zinc Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/Zinzs/luascripting/main/canyoutellitsadahoodscriptornot.lua'))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Pluto",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/Scrvpter/Pluto/Lua/Loader.Lua', true))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Artic",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://polarsblade.xyz/Arctic/Arctic.txt"))()
		end,
	})

--Prison Life
elseif game.PlaceId ==  155615604   then

	local Button = MainTab:CreateButton({
		Name = "Nexus Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/GwnStefano/NexusHub/main/Main", true))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Unamed",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://pastebin.com/raw/JS5SYqaU"))()
		end,
	})

  -- Big Paintball 2
elseif game.PlaceId == 9865958871 then 

	local Button = MainTab:CreateButton({
		Name = "Owl Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Wall Bang & ESP",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/BIGPaintball2.lua"))()
		end,
	})

 --Slap Battles
elseif game.PlaceId == 6403373529 then

	local Button = MainTab:CreateButton({
		Name = "dizzy hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/dizyhvh/slap_battles_gui/main/0.lua"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Whopper",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/qwertyui-cool/uhh-yes/main/whopper.lua"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "lolez",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/RandomScriptr3/gggggggg/main/lolez.txt", true))()
		end,
	})


 --Counter Blox
elseif game.PlaceId == 301549746 then




	local Button = MainTab:CreateButton({
		Name = "Unamed CounterBlox Script",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet('https://raw.githubusercontent.com/Pawel12d/hexagon/main/scripts/CounterBlox.lua', true))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "FelixWare V2",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/PuppyRoblox/FelixWareV2/main/loader.lua"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "cBro bot (buggy)",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()		
			loadstring(game:HttpGet("https://raw.githubusercontent.com/I2345/EX-Scripts/main/cbro%20bot.lua"))()
		end,
	})


 --Blade Ball
elseif game.PlaceId == 13772394625 or game.PlaceId == 14732610803 or game.PlaceId == 14915220621 or game.PlaceId == 15144787112 or game.PlaceId == 15264892126 or game.PlaceId == 15509350986 or game.PlaceId == 16281300371 then


	local Button = MainTab:CreateButton({
		Name = "RV Parry",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://code4zaa.xyz/script/script-loader.lua"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "R4MPAGE Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://pastebin.com/raw/rYVGw0cw"))();
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "FFJ Hub",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()		
			loadstring(game:HttpGet("https://raw.githubusercontent.com/FFJ1/Roblox-Exploits/main/scripts/Loader.lua"))()
		end,
	})


 --Ninja Legends
elseif game.PlaceId == 3956818381 then

	local Button = MainTab:CreateButton({
		Name = "BT Project",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGetAsync("https://lua-library.btteam.net/script-auth.txt"))()
		end,
	})
	local Button = MainTab:CreateButton({
		Name = "Auto Farm (KEY)",
		Info = ".", -- Speaks for itself, Remove if none.
		Interact = 'Changable',
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/03koios/Loader/main/Loader.lua"))()
		end,
	})
end

local AdminTab = Window:CreateTab("Admin", nil ) -- Title, Image
local Section = AdminTab:CreateSection("Main", true)

local Button = AdminTab:CreateButton({
	Name = "Infinite Yield",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end
})

local Button = AdminTab:CreateButton({
	Name = "Dex Explorer V2",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/dex2.0", true))()
	end
})

local Button = AdminTab:CreateButton({
	Name = "Ultimate Admin Script",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/KMp8Jvsa", true))() ----------- Intro GUI
		local Player = game:GetService("Players").LocalPlayer ------------- START OF SCRIPT
		Player.Chatted:connect(function(cht)         ----------- CMD SMART
			if cht:match(":cmd") then
				loadstring(game:HttpGet("https://pastebin.com/raw/M3tZZAqa", true))()
			elseif cht:match(":toolgui") then                                -------------------- TOOL GUI PART / END OF CMD
				loadstring(game:HttpGet("https://pastebin.com/raw/txadLpTy", true))()
			elseif cht:match(":savetool") then
				for _, v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
					if (v:IsA("Tool")) then
						v.Parent = game:GetService("Players").LocalPlayer
					end
				end
			elseif cht:match(":loadtool") then
				for _, v in pairs(game:GetService("Players").LocalPlayer:GetChildren()) do
					if (v:IsA("Tool")) then
						v.Parent = game:GetService("Players").LocalPlayer.Backpack
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
				game:GetService("Players").LocalPlayer.Character.Head.Mesh:destroy()
			elseif cht:match(":creeper6") then
				game:GetService("Players").LocalPlayer.Character.Head.Mesh:destroy()
				function doo(limb, pos)
					limb:BreakJoints()
					local velocity = Instance.new("RocketPropulsion", limb)
					velocity.CartoonFactor = 0
					velocity.MaxSpeed = 30
					velocity.MaxThrust = 9999
					velocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					velocity.Target = game:GetService("Players").LocalPlayer.Character.Torso
					velocity.TargetOffset = pos
					velocity:fire()
					local b = Instance.new("BodyGyro", limb)
				end
				while wait() do
					doo(game:GetService("Players").LocalPlayer.Character["Left Arm"], Vector3.new(-0.5, -2, -1))
					doo(game:GetService("Players").LocalPlayer.Character["Right Arm"], Vector3.new(0.5, -2, -1))
					doo(game:GetService("Players").LocalPlayer.Character["Left Leg"], Vector3.new(-0.5, -2, 1))
					doo(game:GetService("Players").LocalPlayer.Character["Right Leg"], Vector3.new(0.5, -2, 1))
				end
			elseif cht:match(":creeper15") then
				game:GetService("Players").LocalPlayer.Character.Head.Mesh:destroy()
				function doo(limb, pos)
					limb:BreakJoints()
					local velocity = Instance.new("RocketPropulsion", limb)
					velocity.CartoonFactor = 0
					velocity.MaxSpeed = 30
					velocity.MaxThrust = 9999
					velocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					velocity.Target = game:GetService("Players").LocalPlayer.Character.UpperTorso
					velocity.TargetOffset = pos
					velocity:fire()
					local b = Instance.new("BodyGyro", limb)
				end
				while wait() do
					doo(game:GetService("Players").LocalPlayer.Character["LeftUpperArm"], Vector3.new(-0.5, -2, -1))
					doo(game:GetService("Players").LocalPlayer.Character["RightUpperArm"], Vector3.new(0.5, -2, -1))
					doo(game:GetService("Players").LocalPlayer.Character["LeftUpperLeg"], Vector3.new(-0.5, -2, 1))
					doo(game:GetService("Players").LocalPlayer.Character["RightUpperLeg"], Vector3.new(0.5, -2, 1))
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

local Button = AdminTab:CreateButton({
	Name = "Fates Admin V2",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))();
	end
})
local infJump
infJumpDebounce = false
local Toggle = MiscTab:CreateToggle({
	Name = "Infinite Jump",
	Info = "Makes you jump infinitely.", -- Speaks for itself, Remove if none.
	Interact = 'Changable',
	CurrentValue = false,
	Flag = "toggle45", --dskjhfgbisdhgf
	Callback = function(a)
		if infJump then
			infJump:Disconnect()
		end
		infJumpDebounce = false
		infJump = UserInputService.JumpRequest:Connect(function()
			if not infJumpDebounce then
				infJumpDebounce = true
				game:GetService("Players").LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
				wait()
				infJumpDebounce = false
			end
		end)
		if not a then
			if infJump then
				infJump:Disconnect()
			end
			infJumpDebounce = false
		end
	end
})
local Noclipping = nil
local Toggle = MiscTab:CreateToggle({
	Name = "Noclip",
	Info = "Makes you have no collision with walls and ceilings.", -- Speaks for itself, Remove if none.
	Interact = 'Changable',
	CurrentValue = false,
	Flag = "toggle45", --dskjhfgbisdhgf
	Callback = function(a)
		getgenv().looping = a
		task.spawn(function()
			while true do 
				if not getgenv().looping then
					for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == false then
							v.CanCollide = true
						end
					end
					break
				end
				task.wait()
				if getgenv().looping and game:GetService("Players").LocalPlayer.Character ~= nil then
					for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
						if v:IsA("BasePart") and v.CanCollide == true then
							v.CanCollide = false
						end
					end
				end
			end
		end)
	end
})


local Toggle = MiscTab:CreateToggle({
	Name = "Fly",
	Info = "Press F to fly and unfly.", -- Speaks for itself, Remove if none.
	CurrentValue = false,
	Flag = "Toggle69", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		local player = game:GetService("Players").LocalPlayer
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


local Slider = MiscTab:CreateSlider({
	Name = "Walk Speed",
	Range = {
		16,
		300
	},
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "Slider133", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
	end
})

local Slider = MiscTab:CreateSlider({
	Name = "Jump Power",
	Range = {
		50,
		500
	},
	Increment = 1,
	Suffix = "Jump",
	CurrentValue = 50,
	Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = (Value)
	end
})





local FETab = Window:CreateTab("FE Scripts", nil ) -- Title, Image
local Section = FETab:CreateSection("Scripts", true)

local Button = FETab:CreateButton({
	Name = "Big D*ck Script",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/minecrafttotem/fe-pp-roblix-script/main/Fe%20pp%20script%20(with%20netless)"))()
	end
})

local Button = FETab:CreateButton({
	Name = "FE Troll GUI",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/M1ZZ001/BrookhavenR4D/main/Brookhaven%20R4D%20Script'))()
	end
})

local Button = FETab:CreateButton({
	Name = "Universal FE ",
	Interact = 'Changable',
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script'))()
	end
})

local DiscordTab = Window:CreateTab("Discord", nil ) -- Title, Image
local Section = DiscordTab:CreateSection("Invite", true)

local Button = DiscordTab:CreateButton({
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
							code = 'VGqhtctC5b'
						}
					})
				})
			end
		end
	end
})
