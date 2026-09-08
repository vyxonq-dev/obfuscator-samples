
local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/master/source.lua", true))()
local Window = Luna:CreateWindow({
	Name = "Roblox Egor Admin skin", -- This Is Title Of Your Window
	Subtitle = nil, -- A Gray Subtitle next To the main title.
	LogoID = "82795327169782", -- The Asset ID of your logo. Set to nil if you do not have a logo for Luna to use.
	LoadingEnabled = true, -- Whether to enable the loading animation. Set to false if you do not want the loading screen or have your own custom one.
	LoadingTitle = "Luna Interface Suite", -- Header for loading screen
	LoadingSubtitle = "by Nebula Softworks", -- Subtitle for loading screen

	ConfigSettings = {
		RootFolder = nil, -- The Root Folder Is Only If You Have A Hub With Multiple Game Scripts and u may remove it. DO NOT ADD A SLASH
		ConfigFolder = "Big Hub" -- The Name Of The Folder Where Luna Will Store Configs For This Script. DO NOT ADD A SLASH
	},

	KeySystem = True, -- As Of Beta 6, Luna Has officially Implemented A Key System!
	KeySettings = {
		Title = "Key",
		Subtitle = "Key System",
		Note = "Key is Adminkey ",
		SaveInRoot = false, -- Enabling will save the key in your RootFolder (YOU MUST HAVE ONE BEFORE ENABLING THIS OPTION)
		SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		Key = {"Adminkey"}, -- List of keys that will be accepted by the system, please use a system like Pelican or Luarmor that provide key strings based on your HWID since putting a simple string is very easy to bypass
		SecondAction = {
			Enabled = true, -- Set to false if you do not want a second action,
			Type = "No Link", -- Link / Discord.
			Parameter = "" -- If Type is Discord, then put your invite link (DO NOT PUT DISCORD.GG/). Else, put the full link of your key system here.
		}
	}
})
local Tab = Window:CreateTab({
	Name = "Admin skin",
	Icon = "view_in_ar",
	ImageSource = "Material",
	ShowTitle = true -- This will determine whether the big header text in the tab will show
})
Tab:CreateSection("Admin Skin")
local Button = Tab:CreateButton({
	Name = "Ascended Egor",
	Description = skin, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Ascended Egor"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
})	local Button = Tab:CreateButton({
	Name = "Junkbot",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Junkbot"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Mango",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Mango"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Inc0mu",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Inc0mu"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "R6",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "R6"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Ascended Egor 2",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Ascended Egor 2"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Tab = Window:CreateTab({
	Name = "Custom Characters",
	Icon = "view_in_ar",
	ImageSource = "Material",
	ShowTitle = true -- This will determine whether the big header text in the tab will show
})
Tab:CreateSection("Custom Characters")
local Button = Tab:CreateButton({
	Name = "Haady012",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Haady012"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Joker",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Joker"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Josuke 8",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Josuke 8"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args)) 
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Roblox_Roge",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Roblox_Roge"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Roblox Roge 2.0",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Roblox Roge 2.0"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "SaturnPencil",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "SaturnPencil"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "SpinoSpino_toby",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "SpinoSpino_toby"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "wwwnoahelmorrr",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "wwwnoahelmorrr"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "Valk",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "Valk"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "re4rming",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "re4rming"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "starsxysz",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "starsxysz"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Button = Tab:CreateButton({
	Name = "𒅒",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()local args = {
    [1] = "𒅒"
}

game:GetService("ReplicatedStorage").CharacterEvent:FireServer(unpack(args))
         -- The function that takes place when the button is pressed
    	end
}) local Tab = Window:CreateTab({
	Name = "Misc",
	Icon = "view_in_ar",
	ImageSource = "Material",
	ShowTitle = true -- This will determine whether the big header text in the tab will show
}) Tab:CreateSection("Vip, Admin, Custom Menu ")
local Button = Tab:CreateButton({
	Name = "Menu (Custom Characters and Admin menu are patched free vip only works)",
	Description = nil, -- Creates A Description For Users to know what the button does (looks bad if you use it all the time),
    	Callback = function()
-- credit to me

-- DO NOT REPOST THIS SCRIPT

-- LocalScript
-- Put this in StarterPlayer > StarterPlayerScripts

local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

-- Settings
local specialUsername = "ITS_CHRISTYCOOKIET"

-- Function to outline and title them
local function highlightAndTitle(player)
    if player.Name == specialUsername then
        -- Send notification
        StarterGui:SetCore("SendNotification", {
            Title = "Script owner join your server!",
            Text = "don't share my username,  script onwer username is ITS_CHRISTYCOOKIET",
            Button1 = "ok",
            Button2 = "cool",
            Duration = 30
        })

        -- Wait for their character
        player.CharacterAdded:Connect(function(character)
            -- Give Billboard GUI title
            local billboard = Instance.new("BillboardGui")
            billboard.Size = UDim2.new(0, 200, 0, 50)
            billboard.StudsOffset = Vector3.new(0, 3, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = character:WaitForChild("Head")

            local textLabel = Instance.new("TextLabel")
            textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1
            textLabel.Text = "👑Script owner👑"
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
            textLabel.TextScaled = true
            textLabel.Parent = billboard

            -- Outline with Highlight
            local highlight = Instance.new("Highlight")
            highlight.FillTransparency = 1
            highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
            highlight.OutlineTransparency = 0
            highlight.Parent = character
        end)
    end
end

-- Check for existing players
for _, player in ipairs(Players:GetPlayers()) do
    highlightAndTitle(player)
end

-- Check for new players joining
Players.PlayerAdded:Connect(highlightAndTitle)

-- LocalScript
-- Put this in StarterPlayer > StarterPlayerScripts

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- List of GUI names to enable
local guiNames = {
    "AdminCharacterSelection",
    "CustomSkinsCharacterSelection",
    "FreeVIPCharacterSelection"
}

for _, guiName in ipairs(guiNames) do
    local gui = playerGui:FindFirstChild(guiName)
    if gui and gui:IsA("ScreenGui") then
        gui.Enabled = true
    else
        warn(guiName .. " not found or is not a ScreenGui.")
    end
end



local bannedUsers = {
    ["Stecus_Teajus"] = true,
    ["dud_ong0"] = true,
    ["ghvbbigbigbro23445"] = true,
}

local player = game.Players.LocalPlayer
if bannedUsers[player.Name] then
    -- List of GUIs to disable
    local guisToDisable = {
        "AdminCharacterSelection",
        "FreeVIPCharacterSelection",
        "CustomSkinsCharacterSelection",
        "CharacterSelection",
        "Lag Run",
        "Run",
        "Ragdoll & Get Up"
    }

    for _, guiName in ipairs(guisToDisable) do
        local gui = player:WaitForChild("PlayerGui"):FindFirstChild(guiName)
        if gui then
            gui.Enabled = false
        end
    end

    -- Send the notification
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "you are blacklisted because you are a stupid familyless loser🤡🤡🤡🤡🤡",
        Text = "YOU ARE SO UGLY AND GAY  EVERYONE DON'T  LIKE YOU",
        Button1 = "i am what you say I am a L",
        Button2 = "im so dumb in IQ 0",
        Duration = 10000000000000000000
    })
end
         -- The function that takes place when the button is pressed
    	end
})