--[[
Piece RNG RPG Simulator
GAME LINK https://www.roblox.com/games/16819526070/PIECE-RNG-RPG-SIMULATOR
Discord: reav#2966 (i wont accept u anyway)
Usage:
loadstring(game:HttpGet("https://pastebin.com/raw/PrCpDRqp"))()
]]

repeat wait() until game:IsLoaded()

--virtual input manager
local vim = game:GetService('VirtualInputManager')
local function m1click() 
    vim:SendMouseButtonEvent(0,0,0,true,game,0)
    wait()
    vim:SendMouseButtonEvent(0,0,0,false,game,0)
end
local function pressKey(key)
    vim:SendKeyEvent(true, key, false, game)
end
local function releaseKey(key)
    vim:SendKeyEvent(false, key, false, game)
end

-- Variables
local player = game.Players.LocalPlayer
local Players = game:GetService("Players")
local SPAWNS = workspace["__Extra"]["__SpawnPoint"]
local ENEMYS = workspace["__Main"]["__Enemys"]
local PLAYERS = workspace["__Main"]["__Players"]
local CHESTS = workspace["__Extra"]["__Chests"]
local FRUITS = workspace["__Extra"]["__Fruits"]
local UIS = game:GetService("UserInputService")
local gamename = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Ausicius/WallyUIV3/main/library.lua')))()

--remove gamepaused
game:GetService("CoreGui").RobloxNetworkPauseNotification.Enabled = false

-- Mouse location
local mouse = player:GetMouse() 

--antiafk
local VirtualUser=game:service'VirtualUser'
	game:service'Players'.LocalPlayer.Idled:connect(function()
	print("reav anti-afk")
	VirtualUser:CaptureController()
	VirtualUser:ClickButton2(Vector2.new())
end)

local w = library:CreateWindow(gamename.Name)
local b = w:CreateFolder("Better Farm")

local autospin = true
spawn(function()
    while task.wait() do
        if autospin and player.PlayerGui.Menus.Trade.Visible == false then
            local args = {
                [1] = {
                    [1] = {
                        ["Type"] = "Fruit",
                        ["Event"] = "Spin",
                        ["Action"] = "Spin"
                    },
                    [2] = "\11"
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
        end
    end
end)

local lastquest
local function QUESTNAME()
    for i,v in pairs(player.leaderstats.Quests:GetChildren()) do
        if v.ClassName == "Folder" then
            lastquest = v.Name
        end
    end
end

local function QUEST()
local args = {
    [1] = {
        [1] = {
            ["ID"] = lastquest,
            ["Event"] = "ChangeQuest",
            ["Action"] = "Accept"
        },
        [2] = "\11"
    }
}

game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end

local  autoquest
b:Toggle("Auto LastQuest",function(bool)
    autoquest = bool
end)

spawn(function()
    while task.wait() do
        if autoquest then
			QUESTNAME()
            pcall(function()
				for i,v in pairs(player.PlayerGui.Hud:GetChildren()) do
					if v.Name == "QuestFrame" and v.Visible == false then
						QUEST()
					end
				end
            end)
        end
    end
end)



local aoe
b:Toggle("Auto [B] ",function(bool)
    aoe = bool
end)

local grabchests
b:Toggle("Grab Chests",function(bool)
    grabchests = bool
end)

local cycle
b:Toggle("Auto cycle 5m",function(bool)
    cycle = bool
end)

local power
local function POWER()
	for i,v in pairs(player.Character:GetChildren()) do
		if v.ClassName == "Tool" then
			power = v.Name
		end
	end
end
spawn(function()
	while task.wait(1) do
		POWER()
	end
end)


local function B()
	pcall(function()
	local args = {
			[1] = {
			[1] = {
			["Action"] = "Hold",
			["Power"] = power,
			["PowerID"] = "SKILL5",
			["Mouse"] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position),
			["Event"] = "PowerControl"
			},
			[2] = "\6"
			}
			}
			
			game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
			
			local args = {
			[1] = {
			[1] = {
			["Action"] = "Release",
			["Power"] = power,
			["PowerID"] = "SKILL5",
			["Mouse"] = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position),
			["Event"] = "PowerControl"
			},
			[2] = "\6"
			}
			}

		game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
	end)
end


spawn(function()
	while task.wait(4) do
		if aoe then
			B()
		end
	end
end)

local DFWARN = b:Label("- DF & BOSS -",{
    TextSize = 16;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
    
}) 

 

local dfmsg
local counter = 0
spawn(function()
    while task.wait(1) do
        for i,v in pairs(player.PlayerGui.Warn.WarnFrame:GetChildren()) do
            pcall(function()
                if v.ClassName == "TextLabel" and not string.find(v.Text, "stroke") then
                    if string.find(v.Text, "spawned") then
						dfmsg = v.Text
                        DFWARN:Refresh(dfmsg)
						counter = counter + 1
						if counter == 1 then
							warn(dfmsg)
							wait(60)
							counter = 0
						end
                    end
				end
            end)
        end
    end
end)


local BOSSWARN = b:Label("- CHECK F9 -",{
    TextSize = 16;
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
    
}) 



local bossmsg
spawn(function()
    while task.wait(1) do
        for i,v in pairs(player.PlayerGui.Warn.WarnFrame:GetChildren()) do
            pcall(function()
                if v.ClassName == "TextLabel" and not string.find(v.Text, "stroke") then
                    if string.find(v.Text, "appeared") then
						bossmsg = v.Text
                        BOSSWARN:Refresh(bossmsg)
						counter = counter + 1
						if counter == 1 then
							warn(bossmsg)
							wait(60)
							counter = 0
						end
                    end
				end
            end)
        end
    end
end)
				
--ESP
local esp = w:CreateFolder("Better ESP")
esp:Button("CREATE ESP",function()
	pcall(function() 
		loadstring(game:HttpGet('https://pastebin.com/raw/Crgv0w6e'))() 
	end)
end)

esp:Button("Hide ESP",function()
	spawn(function()
		for i,v in pairs(PLAYERS:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Totally NOT Esp") then
				v["Totally NOT Esp"].Enabled = false
			end
		end
	end)
	spawn(function()
		for i,v in pairs(PLAYERS:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Icon") and v.Icon:FindFirstChild("ESP Text") then
				v.Icon["ESP Text"].Visible = false
			end
		end
	end)
end)
esp:Button("Show ESP",function()
	spawn(function()
		for i,v in pairs(PLAYERS:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Totally NOT Esp") then
				v["Totally NOT Esp"].Enabled = true
			end
		end
	end)
	spawn(function()
		for i,v in pairs(PLAYERS:GetChildren()) do
			if v.ClassName == "Model" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Icon") and v.Icon:FindFirstChild("ESP Text") then
				v.Icon["ESP Text"].Visible = true
			end
		end
	end)
end)


local oldposition
local function TP()
oldposition = player.Character.HumanoidRootPart.Position
    for i,v in pairs(SPAWNS:GetChildren()) do
		player.Character.HumanoidRootPart.CFrame=v.CFrame+Vector3.new(0,350,0)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)   		
		task.wait(.75)
    end
	player.Character.HumanoidRootPart.CFrame=CFrame.new(oldposition)
end
local function CHEST()
    for u,z in pairs(CHESTS:GetChildren()) do
		if z.ClassName == "Model" and z:FindFirstChildOfClass("Part") then
			z.Collision.CFrame=player.Character.HumanoidRootPart.CFrame
		   	task.wait()
		end
	end
end
local function DF()
	for u,z in pairs(FRUITS:GetChildren()) do
		if z.ClassName == "Model" and z:FindFirstChild("PrimaryPart") or z:FindFirstChild("Handle") and z:FindFirstChild("Eat") then
			player.Character.HumanoidRootPart.CFrame=z.PrimaryPart.CFrame+Vector3.new(0,5,0)
			repeat wait() 
				fireproximityprompt(z.Eat, 99999)
			until not z
		end
	end
end

UIS.InputBegan:Connect(function(Input, GPE)
	if UIS:IsKeyDown(Enum.KeyCode.G) then
		DF()
	end
end)

spawn(function()
	while task.wait() do
		if cycle then
			TP()
			wait(300)
		end
	end
end)

local autosafe
b:Toggle("Auto SafeZone",function(bool)
	autosafe = bool
end)

local escape = false
local function CHECKLEVEL()
	for i,v in pairs(Players:GetChildren()) do
		if v:IsA("Player") then
			if v ~= player then
				if (v.Character.HumanoidRootPart.Position-player.Character.HumanoidRootPart.Position).Magnitude < 250 then
					local playerlev = player.Character:FindFirstChild("HumanoidRootPart").PlayerTag.Level.Text
					local lev = v.Character:FindFirstChild("HumanoidRootPart").PlayerTag.Level.Text
					print("PLAYERLEV"..playerlev)
					print("LEV"..lev)
					if lev >= playerlev then
						escape = true
					else
						escape = false
					end
				end
			end
		end
	end
end

spawn(function()
	while task.wait() do
		if autosafe then
			CHECKLEVEL()
			if escape then
				local oldposs = player.Character.HumanoidRootPart.Position
				player.Character.HumanoidRootPart.CFrame=CFrame.new(-6631.6, 128.676, 4170.68)		
				wait(10)
				player.Character.HumanoidRootPart.CFrame=CFrame.new(oldposs)
			end
		end
	end
end)

spawn(function()
	while task.wait() do
		if grabchests then
			CHEST()
		end
	end
end)

local function EXPPOT()
local args = {
    [1] = {
        [1] = {
            ["Event"] = "UseItem",
            ["Item"] = "ExpPotion"
        },
        [2] = "\11"
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end

local function SCROLL()
local args = {
    [1] = {
        [1] = {
            ["Event"] = "UseItem",
            ["Item"] = "TitleChanger"
        },
        [2] = "\11"
    }
}

game:GetService("ReplicatedStorage").BridgeNet2.dataRemoteEvent:FireServer(unpack(args))
end

local function MINILUCK()
local args = {
    [1] = {
        [1] = {
            ["Event"] = "UseItem",
            ["Item"] = "MiniLuckPotion"
        },
        [2] = "\11"
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end

local function MEGALUCK()
local args = {
    [1] = {
        [1] = {
            ["Event"] = "UseItem",
            ["Item"] = "MegaLuckPotion"
        },
        [2] = "\11"
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end

local function LUCKPOT()
local args = {
    [1] = {
        [1] = {
            ["Event"] = "UseItem",
            ["Item"] = "LuckPotion"
        },
        [2] = "\11"
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end

local function FASTSPIN()
local args = {
    [1] = {
        [1] = {
            ["Event"] = "UseItem",
            ["Item"] = "FastSpinPotion"
        },
        [2] = "\11"
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end

local function MINICOIN()
local args = {
    [1] = {
        [1] = {
            ["Event"] = "UseItem",
            ["Item"] = "MiniCoinsPotion"
        },
        [2] = "\11"
    }
}
game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
end



local j = library:CreateWindow("Better Potion Shop")
local h = j:CreateFolder("BUY")

h:Button("LuckPot x10 25k",function()
	for i = 1,10 do
		local args = {
			[1] = {
				[1] = {
					["Action"] = "Buy",
					["Shop"] = "PotionsShop2",
					["Item"] = "LuckPotion",
					["Event"] = "ItemShop"
				},
				[2] = "\11"
			}
		}
		game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
		wait(.33)
	end
end)

h:Button("CoinPot x10 100k",function()
	for i = 1,10 do
		local args = {
			[1] = {
				[1] = {
					["Action"] = "Buy",
					["Shop"] = "PotionsShop2",
					["Item"] = "CoinsPotion",
					["Event"] = "ItemShop"
				},
				[2] = "\11"
			}
		}
		game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
		wait(.33)
	end
end)

h:Button("ExpPot x10 100k",function()
	for i = 1,10 do
		local args = {
			[1] = {
				[1] = {
					["Action"] = "Buy",
					["Shop"] = "PotionsShop2",
					["Item"] = "ExpPotion",
					["Event"] = "ItemShop"
				},
				[2] = "\11"
			}
		}
		game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
		wait(.33)
	end
end)
h:Button("FastSpinPot x10 250k",function()
	for i = 1,10 do
		local args = {
			[1] = {
				[1] = {
					["Action"] = "Buy",
					["Shop"] = "PotionsShop2",
					["Item"] = "FastSpinPotion",
					["Event"] = "ItemShop"
				},
				[2] = "\11"
			}
		}
		game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
		wait(.33)
	end
end)

local i = j:CreateFolder("USE")

local fastspinpot 
i:Toggle("Fast Spin",function(bool)
    fastspinpot = bool
end)
local luckpot 
i:Toggle("Luck Pot",function(bool)
    luckpot = bool
end)
local miniluck 
i:Toggle("Mini Luck",function(bool)
    miniluck = bool
end)
local megaluck 
i:Toggle("Mega Luck",function(bool)
    megaluck = bool
end)
local minicoin 
i:Toggle("Mini Coin",function(bool)
    minicoin = bool
end)
local scroll
i:Toggle("Title Scroll",function(bool)
	scroll = bool
end)
local exppot
i:Toggle("Exp Potions",function(bool)
	exppot = bool
end)

spawn(function()
    while task.wait(.3) do
        if exppot then
            EXPPOT()
        end
        if scroll then
            SCROLL()
        end
        if fastspinpot then
            FASTSPIN()
        end
        if luckpot then
            LUCKPOT()
        end
        if miniluck then
            MINILUCK()
        end
        if megaluck then
            MEGALUCK()
        end
        if minicoin then
            MINICOIN()
        end
    end
end)


local m = j:CreateFolder("HAKI")

m:Label("HAKI 10K/ROLL",{
    TextSize = 25; 
    TextColor = Color3.fromRGB(255,255,255); 
    BgColor = Color3.fromRGB(69,69,69); 
    
}) 

local autohaki
m:Toggle("Start/Stop",function(bool)
    autohaki = bool
end)

spawn(function()
	while task.wait() do
		if autohaki then
			local args = {
				[1] = {
					[1] = {
						["Event"] = "Interaction",
						["ID"] = "BusoShop"
					},
					[2] = "\11"
				}
			}
			game:GetService("ReplicatedStorage"):WaitForChild("BridgeNet2"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))			
			task.wait(0.05)
		end
    end
end)

local title = library:CreateWindow("Better Mirror")
local subtitle = title:CreateFolder("Islands")

local islands = {
"Red Giant",
"Colosseum",
"Windmill Island",
"Alvida Hideout",
"Shells Base",
"Banana Town",
"Point Town",
"Syrup Town",
"Restaurant",
"Longo Park",
"Cactus Peak",
"Big Garden",
"Snow Mountain",
"Desert",
"Ahabasta",
"Baya Island",
"Sky Island",
"G88 Base",
"Long Island",
"Water 8",
"Denies Lobby",
"Shadow Bark",
"Bubble Island"
}


subtitle:Dropdown("Select Island:  --------->",islands,true,function(selected) --true/false, replaces the current title "Dropdown" with the option that t
    if selected == "Windmill Island" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-279.195953, 425, 390.288116)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)   
	end
  	if selected == "Alvida Hideout" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-1763.02795, 430, 34.4681702)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Shells Base" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(710.060669, 430, 2168.39014)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Banana Town" then
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Point Town" then
 		player.Character.HumanoidRootPart.CFrame=CFrame.new(-1960.75415, 428.27507, 2078.0332)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "Syrup Town" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-485.585815, 429.064758, -1444.82227)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "Restaurant" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(2454,510,824)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "Longo Park" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-905, 450,4124)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Cactus Peak" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-7277.26953, 504.640854, 539.10791)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "Big Garden" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-8454.10938, 531.55072, 2905.85938)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Snow Mountain" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-9024.39844, 531.642197, 1159.3949)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "Desert" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-9976.58301, 528.687294, 2671.23438)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Ahabasta" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-8363.4873, 535.180237, -708.611511)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "Baya Island" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-6632.46729, 530, 4167.06348)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Sky Island" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-8437.96, 1000, 6792.27)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "G88 Base" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-12607, 500, 768)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)   
	end
  	if selected == "Long Island" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-12607, 500, 3797)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)   
	end
  	if selected == "Water 8" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-11153, 500, -3636)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0) 
	end
  	if selected == "Denies Lobby" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-11375, 500, 6250)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)    
	end
  	if selected == "Shadow Bark" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-7496, 500, 10193)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)   
	end
  	if selected == "Bubble Island" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-14748, 500, -2980)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)  
	end
  	if selected == "Bubble Island" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-14748, 500, -2980)
		local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)  
	end
  	if selected == "Colosseum" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-226.881958, 425, 1089.94043)
        local  Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
  	if selected == "Red Giant" then
		player.Character.HumanoidRootPart.CFrame=CFrame.new(-5035.37695, 425, 903.227051)
        local Part = Instance.new("Part", workspace)
		Part.Anchored = true
		Part.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,-5,0)
	end
end)

