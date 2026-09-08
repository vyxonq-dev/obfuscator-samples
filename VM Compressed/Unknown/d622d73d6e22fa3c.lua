local Library = loadstring(game:HttpGet("https://github.com/1dontgiveaf/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/1dontgiveaf/Fluent/main/Addons/SaveManager.lua"))()

local InterfaceManager = {}
do
    local httpService = game:GetService("HttpService")
    
    InterfaceManager.Folder = "FluentSettings"
    InterfaceManager.Settings = {
        Theme = "Dark",
        Acrylic = false,
        Transparency = false,
        MenuKeybind = "LeftControl"
    }

    function InterfaceManager:SetFolder(folder)
        self.Folder = folder;
        self:BuildFolderTree()
    end

    function InterfaceManager:SetLibrary(library)
        self.Library = library
    end

    function InterfaceManager:BuildFolderTree()
        local paths = {}

        local parts = self.Folder:split("/")
        for idx = 1, #parts do
            paths[#paths + 1] = table.concat(parts, "/", 1, idx)
        end

        table.insert(paths, self.Folder)
        table.insert(paths, self.Folder .. "/settings")

        for i = 1, #paths do
            local str = paths[i]
            if not isfolder(str) then
                makefolder(str)
            end
        end
    end

    function InterfaceManager:SaveSettings()
        writefile(self.Folder .. "/options.json", httpService:JSONEncode(InterfaceManager.Settings))
    end

    function InterfaceManager:LoadSettings()
        local path = self.Folder .. "/options.json"
        if isfile(path) then
            local data = readfile(path)
            local success, decoded = pcall(httpService.JSONDecode, httpService, data)

            if success then
                for i, v in next, decoded do
                    InterfaceManager.Settings[i] = v
                end
            end
        end
    end

    function InterfaceManager:BuildInterfaceSection(tab)
        assert(self.Library, "Must set InterfaceManager.Library")
        local Library = self.Library
        local Settings = InterfaceManager.Settings

        InterfaceManager:LoadSettings()

        local section = tab:AddSection("Interface")

        local InterfaceTheme = section:AddDropdown("InterfaceTheme", {
            Title = "Theme",
            Description = "Changes the interface theme.",
            Values = Library.Themes,
            Default = Settings.Theme,
            Callback = function(Value)
                Library:SetTheme(Value)
                Settings.Theme = Value
                InterfaceManager:SaveSettings()
            end
        })

        InterfaceTheme:SetValue(Settings.Theme)
    
        if Library.UseAcrylic then
            section:AddToggle("AcrylicToggle", {
                Title = "Acrylic",
                Description = "The blurred background requires graphic quality 8+",
                Default = Settings.Acrylic,
                Callback = function(Value)
                    Library:ToggleAcrylic(Value)
                    Settings.Acrylic = Value
                    InterfaceManager:SaveSettings()
                end
            })
        end
    
        section:AddToggle("TransparentToggle", {
            Title = "Transparency",
            Description = "Makes the interface transparent.",
            Default = Settings.Transparency,
            Callback = function(Value)
                Library:ToggleTransparency(Value)
                Settings.Transparency = Value
                InterfaceManager:SaveSettings()
            end
        })
    
        local MenuKeybind = section:AddKeybind("MenuKeybind", { Title = "Minimize Bind", Default = Settings.MenuKeybind })
        MenuKeybind:OnChanged(function()
            Settings.MenuKeybind = MenuKeybind.Value
            InterfaceManager:SaveSettings()
        end)
        Library.MinimizeKeybind = MenuKeybind
    end
end

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()

local supportedGames = {
    [85896571713843] = "9b7ce54eac35b4ca100ecc3b88db76d3",
    [87039211657390] = "e70646d86d22b75862077fbfc5d78da3",
    [128336380114944] = "e70646d86d22b75862077fbfc5d78da3",
    [116614712661486] = "224cb25bc779da52fa187f40a5b33f28"
}

local function isGameSupported()
    return supportedGames[game.PlaceId] ~= nil
end

if isGameSupported() then
    api.script_id = supportedGames[game.PlaceId]
end

local UserInputService = game:GetService("UserInputService")
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

local windowSize = isMobile and UDim2.fromOffset(450, 300) or UDim2.fromOffset(525, 375)

local deviceType = isMobile and "Mobile" or "Computer"

local Window = Fluent:CreateWindow({
    Title = "Perfectus Key System",
    SubTitle = "by Perfectus",
    TabWidth = 135,
    Size = windowSize,
    Acrylic = false,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl,
    Transparency = false
})

local Tabs = {
    KeySystem = Window:AddTab({ Title = "Key System", Icon = "key" })
}

local Options = Fluent.Options

local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local secs = seconds % 60
    return string.format("%02d Hours, %02d Minutes, %02d Seconds", hours, minutes, secs)
end

local function saveKeyToFile(key)
    local file = writefile or function() return false end
    local success, err = pcall(function()
        file("LuarmorKey.txt", key)
    end)
    return success
end

local function loadKeyFromFile()
    local file = readfile or function() return nil end
    local success, content = pcall(function()
        return file("LuarmorKey.txt")
    end)
    if success and content and #content >= 5 then
        return content
    end
    return nil
end

    local KeyInput = Tabs.KeySystem:AddInput("KeyInput", {
        Title = "Key",
        Default = "",
        Placeholder = "Enter your key here...",
        Numeric = false,
        Finished = false,
        Callback = function(Value)
        end
    })
    
    Tabs.KeySystem:AddButton({
        Title = "Verify Key",
        Description = "Check if your key is valid",
        Callback = function()
            if not isGameSupported() then
                Fluent:Notify({
                    Title = "Key System",
                    Content = "Game not supported!",
                    Duration = 5
                })
                return
            end
            
            local key = Options.KeyInput.Value
            if key == "" or #key < 5 then
                Fluent:Notify({
                    Title = "Key System",
                    Content = "Please enter a valid key.",
                    Duration = 5
                })
                return
            end

            local status = api.check_key(key)
            
            if status.code == "KEY_VALID" then
                local saved = saveKeyToFile(key)
                local saveMsg = saved and " Key saved for future use!" or ""

                local timeLeft = status.data.auth_expire - os.time()
                local formattedTime = formatTime(timeLeft)
                
                Fluent:Notify({
                    Title = "Key System",
                    Content = "Key is valid! Time Left: " .. formattedTime .. saveMsg,
                    Duration = 5
                })

                script_key = key

                Fluent:Notify({
                    Title = "Key System",
                    Content = "Loading script...",
                    Duration = 2
                })

                task.delay(2, function()
                    Window:Destroy()
                    api.load_script()
                end)
            
            elseif status.code == "KEY_HWID_LOCKED" then
                Fluent:Notify({
                    Title = "Key System",
                    Content = "This key is being used on another device.",
                    Duration = 5
                })
            
            elseif status.code == "KEY_INCORRECT" then
                Fluent:Notify({
                    Title = "Key System",
                    Content = "The entered key is invalid or has been deleted.",
                    Duration = 5
                })
            
            elseif status.code == "KEY_EXPIRED" then
                Fluent:Notify({
                    Title = "Key System",
                    Content = "The key has expired. Please obtain a new key.",
                    Duration = 5
                })
            
            elseif status.code == "KEY_BANNED" then
                Fluent:Notify({
                    Title = "Key System",
                    Content = "This key has been deactivated.",
                    Duration = 5
                })
            
            else
                Fluent:Notify({
                    Title = "Key System",
                    Content = "Key verification failed: " .. tostring(status.message),
                    Duration = 5
                })
            end
        end
    })

    Tabs.KeySystem:AddParagraph({
        Title = "Status",
        Content = isGameSupported() and "Game supported! Ready to verify key." or "Warning: This game is not supported."
    })

    local savedKey = loadKeyFromFile()
    if savedKey then
        KeyInput:SetValue(savedKey)
    end

    local KeyProviders = Tabs.KeySystem:AddSection("Get Key")

    KeyProviders:AddButton({
        Title = "Linkversite",
        Description = "Get a key from Linkversite",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Linkversite-cxaCDNvkHWzp")
            Fluent:Notify({
                Title = "Key System",
                Content = "Linkversite link copied to clipboard!",
                Duration = 3
            })
        end
    })

    KeyProviders:AddButton({
        Title = "LootLabs",
        Description = "Get a key from LootLabs",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=LootLabs-dqEmRhddeYwj")
            Fluent:Notify({
                Title = "Key System",
                Content = "LootLabs link copied to clipboard!",
                Duration = 3
            })
        end
    })

    KeyProviders:AddButton({
        Title = "Linkversite + LootLabs",
        Description = "Get a key from Linkversite + LootLabs",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Linkverste__LootLabs-JcgFNAcdlAta")
            Fluent:Notify({
                Title = "Key System",
                Content = "Linkversite + LootLabs link copied to clipboard!",
                Duration = 3
            })
        end
    })

    KeyProviders:AddButton({
        Title = "ShrinkEarn",
        Description = "Get a key from ShrinkEarn",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Shrink-hcQIHlWKYWrk")
            Fluent:Notify({
                Title = "Key System",
                Content = "ShrinkEarn link copied to clipboard!",
                Duration = 3
            })
        end
    })

    if savedKey and isGameSupported() then
        task.spawn(function()
            Fluent:Notify({
                Title = "Key System",
                Content = "Found saved key, attempting verification...",
                Duration = 2
            })
            
            local status = api.check_key(savedKey)
            if status.code == "KEY_VALID" then
                local timeLeft = status.data.auth_expire - os.time()
                local formattedTime = formatTime(timeLeft)
                
                Fluent:Notify({
                    Title = "Key System",
                    Content = "Auto login successful! Time Left: " .. formattedTime,
                    Duration = 3
                })
                
                script_key = savedKey

                Fluent:Notify({
                    Title = "Key System",
                    Content = "Loading script...",
                    Duration = 2
                })

                task.delay(2, function()
                    Window:Destroy()
                    api.load_script()
                end)
            else
                Fluent:Notify({
                    Title = "Key System",
                    Content = "Saved key is no longer valid. Please get a new key.",
                    Duration = 5
                })
            end
        end)
    end

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

InterfaceManager:SetFolder("PerfectusHubKeySystem")
SaveManager:SetFolder("PerfectusHubKeySystem/KeySystem")

Fluent:ToggleTransparency(false)

Window:SelectTab(1)

if script_key and api.check_key(script_key).code == "KEY_VALID" then
    SaveManager:LoadAutoloadConfig()
end
