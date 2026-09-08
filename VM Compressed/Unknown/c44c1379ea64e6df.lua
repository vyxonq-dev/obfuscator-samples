-- [ ----------------------------------------------------------------- ] 
-- ███╗░░██╗  ███████╗  ██████╗░  ██╗░░░██╗  ██╗░░░░░  ░█████╗░ 
-- ████╗░██║  ██╔════╝  ██╔══██╗  ██║░░░██║  ██║░░░░░  ██╔══██╗
-- ██╔██╗██║  █████╗░░  ██████╦╝  ██║░░░██║  ██║░░░░░  ███████║
-- ██║╚████║  ██╔══╝░░  ██╔══██╗  ██║░░░██║  ██║░░░░░  ██╔══██║
-- ██║░╚███║  ███████╗  ██████╦╝  ╚██████╔╝  ███████╗  ██║░░██║
-- ╚═╝░░╚══╝  ╚══════╝  ╚═════╝░  ░╚═════╝░  ╚══════╝  ╚═╝░░╚═╝
--                     I hope you enjoy our scripts.
-- Nebula Hub is developed by a passionate team of beginners who are 
-- studying and learning about exploits and script development. 
-- We appreciate your support as we continue to grow and improve! 
-- ~> https://discord.gg/nebulascripts
-- [ ----------------------------------------------------------------- ]

repeat
    task.wait()
until game:IsLoaded()

local fluentLoader = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))
local saveManagerLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))
local interfaceManagerLoader = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))

local Fluent = fluentLoader()
local SaveManager = saveManagerLoader()
local InterfaceManager = interfaceManagerLoader()
local Options = Fluent.Options

local ScriptData = {
    [7018190066] = "0374691aefd44c855f38a154fb427d27",
    [6931042565] = "c4db58baa788dfaafe935f3329ea6ff2",
    [4777817887] = "5a90e9f345f6b58f4a1be04e72e2a631",
    [2440500124] = "03d5597c92f13d5e8bc4ff96e6bf6623",
    [6325068386] = "56196b25747602d5b620715bd790d9e0",
    [7436755782] = "3c218bca99e2c555fd29820f9a6ac330",
    [6504986360] = "ff3d59d11d4df358c094f003723167d6"
}

local CurrentGameID = game.GameId
local CurrentScriptID = ScriptData[CurrentGameID]

makefolder("Nebula")
_G['script_key'] = script_key or _G['script_key']

local Cloneref = cloneref or _G['clonereference'] or function(instance)
    return instance
end
local Players, _ = Cloneref(game:GetService("Players")), Cloneref(game:GetService("HttpService"))

local apiLoader = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))
local API = apiLoader()

local Window = Fluent:CreateWindow({
    Title = "Nebula Hub",
    SubTitle = "by Nebula Team",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false, 
    Theme = "Amethyst",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    KeySystem = Window:AddTab({ Title = "Key System", Icon = "key" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local TabLoader = {
    queue = {},
    isLoading = false
}

function TabLoader:AddTab(loadFunction, tabName, priority)
    table.insert(self.queue, {
        func = loadFunction,
        name = tabName,
        priority = priority or 5
    })

    table.sort(self.queue, function(a, b)
        return a.priority < b.priority
    end)
    
    if not self.isLoading then
        self:ProcessQueue()
    end
end

function TabLoader:ProcessQueue()
    if #self.queue == 0 then
        self.isLoading = false
        return
    end
    
    self.isLoading = true
    local tab = table.remove(self.queue, 1)
    
    task.spawn(function()
        local startTime = os.clock()
        
        local _, _ = pcall(function()
            tab.func()
        end)
        
        local loadTime = os.clock() - startTime
        local waitTime = math.max(0.3, math.min(1.0, loadTime * 0.5))
        
        gcinfo() 
        
        task.wait(waitTime)
        self:ProcessQueue()
    end)
end

local function checkKey(input_key)
    if not CurrentScriptID then
        Fluent:Notify({
            Title = "Unsupported Game",
            Content = "Nebula Hub does not currently support this game.",
            Duration = 5
        })
        return
    end
    
    API.script_id = CurrentScriptID
    local status = API.check_key(input_key or _G['script_key'])
    
    if status.code == "KEY_VALID" then
        script_key = input_key or _G['script_key']
        Fluent:Notify({
            Title = "Verification Complete",
            Content = "Valid key! Loading script...",
            Duration = 3
        })
        task.wait(1)
        Fluent:Destroy()
        API.load_script()
    elseif status.code:find("KEY_") then
        local messages = {
            KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
            KEY_INCORRECT = "Incorrect key",
            KEY_INVALID = "Invalid key format",
            KEY_EXPIRED = "Your key has expired",
            KEY_BANNED = "This key has been banned"
        }
        Fluent:Notify({
            Title = "Verification Failed",
            Content = messages[status.code] or "Unknown error",
            Duration = 8
        })
    else
        Players.LocalPlayer:Kick("Verification failed: " .. status.message .. " Code: " .. status.code)
    end
end

if not CurrentScriptID then
    task.spawn(function()
        task.wait(1)
        Fluent:Notify({
            Title = "Unsupported Game",
            Content = "Nebula Hub does not currently support this game.",
            Duration = 5
        })
    end)
else
    task.spawn(function()
        Fluent:Notify({
            Title = "Key System",
            Content = "Checking global loaded key...",
            Duration = 5
        })
        task.wait(1)
        if script_key then
            checkKey()
        end
    end)
end

Fluent:Notify({
    Title = "Nebula Hub",
    Content = "Welcome to Nebula Hub!",
    Duration = 5
})

TabLoader:AddTab(function()
    if CurrentScriptID then
        local KeySection = Tabs.KeySystem:AddSection("Key System")
        
        KeySection:AddParagraph({
            Title = "Key Instructions",
            Content = "Enter your key below to access Nebula Hub.\nIf you don't have a key, use the button to get one."
        })

        KeySection:AddInput("KeyInput", {
            Title = "Enter Your Key",
            Default = script_key or "",
            Placeholder = "Example: JnX84B...",
            Callback = function(Value)
                script_key = Value
            end
        })

        KeySection:AddButton({
            Title = "Verify Key",
            Callback = function()
                checkKey(Options.KeyInput.Value)
            end
        })

        KeySection:AddButton({
            Title = "Get Key ~> Linkvertise",
            Callback = function()
                setclipboard("https://ads.luarmor.net/get_key?for=Nebula_Hub_Free_Access-LMgKfCJvLDMH")
                Fluent:Notify({
                    Title = "Copied to Clipboard",
                    Content = "Link to get your key has been copied to your clipboard",
                    Duration = 16
                })
            end
        })

        KeySection:AddButton({
            Title = "Get Key ~> Lootlabs / Workink",
            Callback = function()
                setclipboard("https://ads.luarmor.net/get_key?for=Nebula_Hub__Lootlabs-cgoAGWoLWaWS")
                Fluent:Notify({
                    Title = "Copied to Clipboard",
                    Content = "Link to get your key has been copied to your clipboard",
                    Duration = 16
                })
            end
        })

        KeySection:AddButton({
            Title = "Join Discord",
            Callback = function()
                setclipboard("https://discord.gg/nebulascripts")
                Fluent:Notify({
                    Title = "Copied to Clipboard",
                    Content = "Discord server link has been copied to your clipboard",
                    Duration = 16
                })
            end
        })

        local InfoSection = Tabs.KeySystem:AddSection("Information")
        
        InfoSection:AddParagraph({
            Title = "Common Issues",
            Content = "• HWID LOCKED: Your key is linked to another device\n• KEY INCORRECT: The provided key doesn't exist\n• KEY INVALID: Invalid key format\n• KEY EXPIRED: Your key has expired\n• KEY BANNED: Key banned from the system"
        })
    else
        local UnsupportedSection = Tabs.KeySystem:AddSection("Unsupported Game")
        
        UnsupportedSection:AddParagraph({
            Title = "Game Not Supported",
            Content = "Nebula Hub does not currently support this game.\nYou can close this loader manually."
        })
    end
    
    local InfoSection = Tabs.Settings:AddSection("Information")
    local ConfigSection = Tabs.Settings:AddSection("Configuration")
    
    local gameInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
    
    InfoSection:AddParagraph({
        Title = "Script Information",
        Content = "Current Game: " .. gameInfo.Name .. 
                 "\nGame ID: " .. game.GameId .. 
                 "\nVersion: 1.0.0\nDeveloped by Nebula Team"
    })
    
    InfoSection:AddButton({
        Title = "Copy Game ID",
        Callback = function()
            setclipboard(tostring(game.GameId))
            Fluent:Notify({
                Title = "Game ID Copied",
                Content = "Game ID: " .. game.GameId .. " has been copied to clipboard",
                Duration = 5
            })
        end
    })
    
    ConfigSection:AddToggle("AutoSaveKey", {
        Title = "Automatically Save Key",
        Default = true
    })

    gcinfo()
end, "Main Interface", 1)

SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)
SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({})
InterfaceManager:SetFolder("NebulaHub")
SaveManager:SetFolder("NebulaHub/KeySystem")
InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)
Window:SelectTab(1)