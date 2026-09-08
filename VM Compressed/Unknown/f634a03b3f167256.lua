local gui = loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/UI-Library/refs/heads/main/UI-Library.txt"))()

local Window = gui.CreateWindow("CursedHub - Main  ","",'590','v 1.0')

Window:SetSavePath("zxcursedsocute", "Trollge Incident Fights Reborn.json")

local Discord = Window:AddTab("Info/Discord","Quests")

Discord:AddParagraph("CursedHub","CursedHub is a free public script hub for Roblox")

Discord:AddButton({
    Name = "Copy Discord Link",
    Description = "for suggestions and bugs",
    Callback = function()
        setclipboard("https://discord.gg/N9CYA7ma")
        windows:Notification({
            Name = 'Notfication',
            Description = 'Text successfully copied to clipboard',
            Type = 'Notification',
            Duration = 10
        })
    end
})

local ChooseGameTab = Window:AddTab("Scripts","Misc")

ChooseGameTab:AddButton({
    Name = "Forsaken",
    Description = "",
    Callback = function()
		pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Forsaken-Script/refs/heads/main/lua"))()
		end)
        Window:Destroy()
    end
})

ChooseGameTab:AddButton({
    Name = "Fish it",
    Description = "",
    Callback = function()
		pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Fish-It/refs/heads/main/lua"))()
		end)
        Window:Destroy()
    end
})

ChooseGameTab:AddButton({
    Name = "Trollge Multiverse",
    Description = "",
    Callback = function()
		pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Trollge-Multiverse/refs/heads/main/lua"))()
		end)
        Window:Destroy()
    end
})

ChooseGameTab:AddButton({
    Name = "Trollge Incident Fights Reborn",
    Description = "",
    Callback = function()
		pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/Trollge-Incident-Fights-Reborn2-script/refs/heads/main/lua"))()
		end)
        Window:Destroy()
    end
})

ChooseGameTab:AddButton({
    Name = "World Of Trollge",
    Description = "",
    Callback = function()
		pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/zxcursedsocute/World-of-Trollge-script/refs/heads/main/lua"))()
		end)
        Window:Destroy()
    end
})

local Settings = Window:AddTab('UI settings','Settings')

Settings:AddSection('Interface')
--windows:Blur()
Settings:AddDropdown({
	Name = 'Theme',
	Description = 'Change the interface theme',
	Options = {'Darkness','Dark','White','Black','Forsaken',"Forest 2021",'Germany 1941','Spooky'},
	Default = 'Darkness',
	Callback = function(select)
		Window:SetTheme(select)
	end
})

SetBlur = Settings:AddToggle({
	Name = 'Blur',
	Description = 'Need graphics level of 8 and above',
	Callback = function(state)
		if state  then
			Window:BlurOff()
		else
			Window:Blur()
		end
	end
})

SetTrans = Settings:AddToggle({
	Name = 'Transparance',
	Description = 'Change The Background Transparance',
	Callback = function(state)
		Window:ChangeBackgroundTransparance()
	end
})

SetuserInfo = Settings:AddToggle({
	Name = 'User info',
	Description = 'Show info about your account',
	Callback = function(state)
		Window:UserInfo()
	end
})

Settings:AddToggle({
	Name = 'Search',
	Description = 'Show the search',
	Callback = function(state)
		Window:ShowSearch()
	end
})

Settings:AddSection('Window')

Settings:AddKeybind({
	Name = "Minimaze Window",
	Description = "Change the window to minimaze",
	Default = '',
	Callback = function()
		Window:Minimaze()
	end
})

Settings:AddKeybind({
	Name = "Column Window",
	Description = "Change the window to column",
	Default = '',
	Callback = function()
		Window:ColumnWindow()
	end
})

Settings:AddKeybind({
	Name = "Close Window",
	Description = "Close the Window",
	Default = Enum.KeyCode.LeftAlt,
	Callback = function()
		Window:Close()
	end
})

Settings:AddSection('Config')

Settings:AddToggle({
	Name = 'Load Config',
	Description = 'loads the saved script settings',
	Callback = function(state)
	if state then
		Window:LoadConfig("zxcursedsocute/Trollge Incident Fights Reborn.json")
	end
	end,
})

local SaveConfigCon = nil
Settings:AddToggle({
	Name = 'Save Config',
	Description = 'Saves the current script settings',
	Callback = function(state)
		if SaveConfigCon then 
            SaveConfigCon:Disconnect()
            SaveConfigCon = nil
		end
	    if state then
            Window:SaveConfig("zxcursedsocute","Trollge Incident Fights Reborn.json")
            SaveConfigCon = game.Players.PlayerRemoving:Connect(function(plr)
                if plr.DisplayName == game.Players.LocalPlayer.DisplayName then
                    Window:SaveConfig("zxcursedsocute","Trollge Incident Fights Reborn.json")
                end
	        end)
		end
	end
})

Settings:AddButton({
	Name = 'Get Config',
	Description = 'copies the current config to the clipboard',
	Callback = function()
		Window:GetConfig("zxcursedsocute/Trollge Incident Fights Reborn.json")
	end,
})

Settings:AddInput({
	Name = 'Input Config',
	Description = '',
	SaveConfig = true,
	Callback = function(text)
		Window:InputConfig("zxcursedsocute/Trollge Incident Fights Reborn.json",text)
	end,
})

Window:Notification({
	Name = 'Notfication',
	Description = 'Game not found in the hub, please select the required script',
	Type = 'Notification',
	Duration = 10
})
Window:IsLoadConfig("zxcursedsocute/Trollge Incident Fights Reborn.json")

Window:ScaleForMobileFixed()
