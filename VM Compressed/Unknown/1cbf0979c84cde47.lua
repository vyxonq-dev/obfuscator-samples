--[[
    Credits to anyones code I used or looked at

    Removed the key system permamently.
]]

repeat task.wait() until game:IsLoaded()

if shared.Mana then
    local Mana = shared.Mana
    if shared.ManaDeveloper then
        Mana.GuiLibrary:Destruct()
        warn("[ManaV2ForRoblox]: Already loaded but developer mode is enabled, so reinjecting.")
    else
        warn("[ManaV2ForRoblox]: Already loaded.")
        Mana.GuiLibrary:playsound("rbxassetid://421058925", 1)
        return
    end
end

local startTick = tick()

local UserInputService = game:GetService("UserInputService")
local TextChatService = game:GetService("TextChatService")
local TeleportService = game:GetService("TeleportService")
local httpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local HumanoidRootPart = Character.HumanoidRootPart
local Humanoid = Character.Humanoid
local Camera = workspace.CurrentCamera
local RealCamera = workspace.Camera
local Mouse = LocalPlayer:GetMouse()
local PlayerGui = LocalPlayer.PlayerGui
local PlaceId = game.PlaceId
local JobId = game.JobId
local saveasuniversal = false
local loadasuniversal = false
local SliderScaleValue = 1
local Functions = {}
local LocalPlayerEvents = {}
local Mana = {Connections = {}, Friends = {}}

local httprequest = (request and http and http.request or http_request or fluxus and fluxus.request)
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
local function runFunction(func) func() end

local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or request or function(tab)
    if tab.Method == "GET" then
        return {
            Body = game:HttpGet(tab.Url, true),
            Headers = {},
            StatusCode = 200
        }
    else
        return {
            Body = "bad exploit",
            Headers = {},
            StatusCode = 404
        }
    end
end 

local betterisfile = function(file)
    local suc, res = pcall(function() return readfile(file) end)
    return suc and res ~= nil
end

local function isAlive(Player, headCheck)
    local Player = Player or LocalPlayer
    if Player and Player.Character and ((Player.Character:FindFirstChildOfClass("Humanoid")) and (Player.Character:FindFirstChild("HumanoidRootPart")) and (headCheck and Player.Character:FindFirstChild("Head") or not headCheck)) then
        return true
    else
        return false
    end
end

do
    function Functions:RunFile(filepath)
        local req = requestfunc({
            Url = "https://raw.githubusercontent.com/Maanaaaa/ManaV2ForRoblox/main/" .. filepath,
            Method = "GET"
        })
        if isfile("NewMana/"..filepath) and shared.ManaDeveloper then
            print("MEEEEEEE " .. filepath)
            return loadstring(readfile("NewMana/" .. filepath))()
        elseif not betterisfile(filepath) and not shared.ManaDeveloper then -- auto update workspace files
            local context = req.Body
            writefile("Mana/"..filepath, context)
            return loadstring(context)()
        else
            if isfile("Mana/" .. filepath) then
                return loadstring(readfile("Mana/" .. filepath))()
            else
                return loadstring(game:HttpGet("https://raw.githubusercontent.com/Maanaaaa/ManaV2ForRoblox/main/" .. filepath))()
            end
        end
    end
end

local RunLoops = {RenderStepTable = {}, StepTable = {}, HeartTable = {}}

do
	function RunLoops:BindToRenderStep(name, func)
		if RunLoops.RenderStepTable[name] == nil then
			RunLoops.RenderStepTable[name] = RunService.RenderStepped:Connect(func)
		end
	end

	function RunLoops:UnbindFromRenderStep(name)
		if RunLoops.RenderStepTable[name] then
			RunLoops.RenderStepTable[name]:Disconnect()
			RunLoops.RenderStepTable[name] = nil
		end
	end

	function RunLoops:BindToStepped(name, func)
		if RunLoops.StepTable[name] == nil then
			RunLoops.StepTable[name] = RunService.Stepped:Connect(func)
		end
	end

	function RunLoops:UnbindFromStepped(name)
		if RunLoops.StepTable[name] then
			RunLoops.StepTable[name]:Disconnect()
			RunLoops.StepTable[name] = nil
		end
	end

	function RunLoops:BindToHeartbeat(name, func) 
		if RunLoops.HeartTable[name] == nil then
			RunLoops.HeartTable[name] = RunService.Heartbeat:Connect(func)
		end
	end

	function RunLoops:UnbindFromHeartbeat(name)
		if RunLoops.HeartTable[name] then
			RunLoops.HeartTable[name]:Disconnect()
			RunLoops.HeartTable[name] = nil
		end
	end
end

shared.Mana = Mana
local GuiLibrary = Functions:RunFile("GuiLibrary.lua")--loadstring(game:HttpGet("https://raw.githubusercontent.com/Maanaaaa/ManaV2ForRoblox/refs/heads/main/GuiLibrary.lua"))()
local playersHandler = Functions:RunFile("Libraries/playersHandler.lua") --loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/refs/heads/main/libraries/entity.lua"))()
local toolHandler = Functions:RunFile("Libraries/toolHandler.lua")
local espLibrary = Functions:RunFile("Libraries/espLibrary.lua") --loadstring(game:HttpGet("https://raw.githubusercontent.com/Maanaaaa/ManaV2ForRoblox/main/Libraries/espLibrary.lua"))()
--local whitelistHandler = Functions:RunFile("Libraries/whiltelistHandler.lua")
Mana.GuiLibrary = GuiLibrary
Mana.Functions = Functions
Mana.RunLoops = RunLoops
Mana.PlayersHandler = playersHandler
Mana.ToolHandler = toolHandler
Mana.EspLibrary = espLibrary
--Mana.WhitelistHandler = whitelistHandler
Mana.Activated = true
Mana.Whitelisted = false
Mana.Loaded = false

GuiLibrary:CreateWindow()

local Tabs = {
    Combat = GuiLibrary:CreateTab({
        Name = "Combat",
        Color = Color3.fromRGB(83, 214, 110), --252, 60, 68
        TabIcon = "CombatTabIcon.png"
    }),
    Movement = GuiLibrary:CreateTab({
        Name = "Movement",
        Color = Color3.fromRGB(83, 214, 110), --255, 148, 36
        TabIcon = "MovementTabIcon.png"
    }),
    Render = GuiLibrary:CreateTab({
        Name = "Render",
        Color = Color3.fromRGB(83, 214, 110), --59, 170, 222
        TabIcon = "RenderTabIcon.png"
    }),
    Utility = GuiLibrary:CreateTab({
        Name = "Utility",
        Color = Color3.fromRGB(83, 214, 110),
        TabIcon = "MiscTabIcon.png" --"UtilityTabIcon",
    }),
    World = GuiLibrary:CreateTab({
        Name = "World",
        Color = Color3.fromRGB(83, 214, 110), --52, 28, 228
        TabIcon = "WorldTabIcon.png"
    }),
    Settings = GuiLibrary:CreateOptionsTab({
        Name = "Settings",
        Color = Color3.fromRGB(83, 214, 110), --240, 157, 62
        TabIcon = "MiscTabIcon.png"
    }),
    Profiles = GuiLibrary:CreateOptionsTab({
        Name = "Profiles",
        Color = Color3.fromRGB(83, 214, 110), --255, 255, 255
        TabIcon = "MiscTabIcon.png"
    }),
    Friends = GuiLibrary:CreateOptionsTab({
        Name = "Friends",
        Color = Color3.fromRGB(83, 214, 110), --240, 157, 62
        TabIcon = "PlayerImage.png"
    }),
    --[[
    FE = GuiLibrary:CreateTab({
        Name = "FE + Trolling",
        Color = Color3.fromRGB(255, 0, 34),
        Visible = true,
        TabIcon = "Utility.png",
        Callback = function() end
    }),
    Plugins = GuiLibrary:CreateTab({
        Name = "Plugins",
        Color = Color3.fromRGB(49, 204, 90),
        Visible = true,
        TabIcon = "MiscTabIcon.png",
        Callback = function() end
    }),
    ]]
    --[[
    SessionInfo = GuiLibrary:CreateCustomTab({
        Name = "Session info",
        Color = Color3.fromRGB(240, 157, 62)
    })
    ]]
}
Mana.Tabs = Tabs

if GuiLibrary.Device == "Mobile" then
    SliderScaleValue = 0.5
end

-- // key strokes
local keyStrokes = GuiLibrary:CreateKeyStrokes()
Mana.KeyStrokes = keyStrokes
keyStrokes:toggle()

--[[ // text list (soon)
local textList = GuiLibrary:CreateTextList()
Mana.TextList = textList
Tabs.TextList = textList.tab
]]

-- // Settings tab
runFunction(function()
    local mode = {Value = "Built-in"}
    local volume = {Value = 1}

    local divider = Tabs.Settings:CreateDivider("UI")

    local notifications = Tabs.Settings:CreateToggle({
        Name = "Notifications",
        Callback = function(v)
            GuiLibrary.Notifications = v
            if mode.Container1 then mode.Container1.Visible = v end
        end
    })

    mode = Tabs.Settings:CreateDropdown({
        Name = "Mode",
        List = {"Built-in", "Roblox' core"},
        Default = "Built-in",
        Callback = function(v)
            GuiLibrary.NotificationsMode = v
        end
    })
    mode.Container1.Visible = false

    local sounds = Tabs.Settings:CreateToggle({
        Name = "Sounds",
        Callback = function(callback)
            GuiLibrary.Sounds = callback
            if volume.MainObject then
                volume.MainObject.Visible = callback
            end
        end
    })

    volume = Tabs.Settings:CreateSlider({
        Name = "Volume",
        Function = function(v)
            GuiLibrary.SoundVolume = v
        end,
        Min = 0,
        Max = 1,
        Default = 1,
        Round = 2
    })

    local uiscale = Tabs.Settings:CreateSlider({
        Name = "UI scale",
        Function = function(v)
            GuiLibrary.UIScale.Scale = v
        end,
        Min = 0.5,
        Max = 2,
        Default = 1,
        Round = 2
    })

    local uicornersradius = Tabs.Settings:CreateSlider({
        Name = "Corners radius",
        Function = function(v)
            GuiLibrary.uiCornersRadius = v
            GuiLibrary:updateUICorners(v)
        end,
        Min = 0,
        Max = 10,
        Default = 4,
        Round = 0
    })
end)

--[[ soon
runFunction(function()
    local textListEnabled = {Value = false}
    local divider = Tabs.Settings:CreateSecondDivider("Text List")
    textListEnabled = Tabs.Settings:CreateToggle({
        Name = "Text List",
        Callback = function(callback)
            Tabs.TextList:Toggle(callback, callback)
        end
    })
end)
]]

runFunction(function()
    local divider = Tabs.Settings:CreateDivider("Slider")

    local sliderdrightclick = Tabs.Settings:CreateToggle({
        Name = "RMB to edit",
        Callback = function(callback)
            GuiLibrary.SliderRightClick = callback
        end
    })

    local slidercanoverride = Tabs.Settings:CreateToggle({
        Name = "Value override",
        Callback = function(callback)
            GuiLibrary.SliderCanOverride = callback
        end
    })
end)

runFunction(function()
    local divider = Tabs.Settings:CreateDivider("Hover text")

    local hovertextenabled = Tabs.Settings:CreateToggle({
        Name = "Hover text",
        Default = true,
        Callback = function(v)
            GuiLibrary.hoverText.Enabled = v
        end
    })

    local hovertextposition = Tabs.Settings:CreateDropdown({
        Name = "Pos.",
        List = {"Above mouse", "Below mouse"},
        Default = "Above mouse",
        Callback = function(v)
            GuiLibrary.hoverText.Position = v
        end
    })
end)

runFunction(function()
    local divider = Tabs.Settings:CreateDivider("Other")

    local sorttabs = Tabs.Settings:CreateButton({
        Name = "Sort tabs",
        Callback = function()
            local xoffset = 40
            local yoffset = 40
            local rowWidth = 7
            local totalyoffset = 247
            local tabs = {}
            for _, v in pairs(GuiLibrary.ObjectsToSave.Tabs) do
                if v.Type == "Tab" or v.Type == "OptionTab" then
                    table.insert(tabs, v)
                end
            end
            table.sort(tabs, function(a, b) return a.API.Order < b.API.Order end)
            for index, tabTable in ipairs(tabs) do
                local container = tabTable.API.Container
                local row = math.floor((index - 1) / rowWidth)
                local col = (index - 1) % rowWidth
                container.Position = UDim2.new(0, xoffset + (col * totalyoffset), 0, yoffset + (row * 50))
            end
        end
    })
    
    --[[
    local unpinall = Tabs.Settings:CreateButton({
        Name = "Pin/Un pin all tabs",
        Callback = function()
            for i, v in next, GuiLibrary.ObjectsThatCanBeSaved do
                if v.Type == "Tab" then
                    v.Table:Pin(false)
                end
            end
        end
    })
    ]]

    local uninject = Tabs.Settings:CreateButton({
        Name = "Uninject",
        Callback = function()
            GuiLibrary:SaveConfig()
            Mana = nil
            GuiLibrary:Destruct()
        end
    })

    local reinject = Tabs.Settings:CreateButton({
        Name = "Reinject",
        Callback = function()
            GuiLibrary:SaveConfig()
            Mana = nil
            GuiLibrary:Destruct()
            Functions:RunFile("MainScript.lua")
        end
    })

    local copydiscordinvite = Tabs.Settings:CreateButton({
        Name = "Copy Discord invite",
        Callback = function()
            toclipboard("https://discord.gg/gPkD8BdbMA")
        end
    })
end)

-- Profiles tab
runFunction(function()
    local delay = {Value = 15}
    local resetprofile = {}
    local profilesList = {}
    --local profiles = isfile("Mana/ProfilesList.json") and httpService:JSONDecode(readfile("Mana/ProfilesList.json")) or {"Default"}

    local divider = Tabs.Profiles:CreateDivider("Config")

    delay = Tabs.Profiles:CreateSlider({
        Name = "AutoSave Delay",
        Function = function(v)
            GuiLibrary.autoSaveDelay = v
        end,
        Min = 1,
        Max = 60,
        Default = 5,
        Round = 0
    })

    resetprofile = Tabs.Profiles:CreateButton({
        Name = "Reset current profile",
        Callback = function()
            Mana = nil
            GuiLibrary:Destruct()
            --if isfile("Mana/Config/"..game.PlaceId..GuiLibrary.CurrentProfile..".json") then delfile("Mana/Config/"..game.PlaceId..GuiLibrary.CurrentProfile..".json") end
            if isfile("Mana/Config/"..game.PlaceId..".json") then delfile("Mana/Config/"..game.PlaceId..".json"); print('shit deleted') end
            Functions:RunFile("MainScript.lua")
        end
    })

    --[[this shit is broken and unstable and i dont have time to fix this shit
    profilesList = Tabs.Profiles:CreateTextList({
        Name = "Profiles",
        DefaultList = profiles,
        PlaceholderText = "Profile name",
        Choose = true,
        MultiChoose = false,
        Default = "Default",
        Callback = function(v, bool)
            print(profilesList.List or profiles)
            writefile("Mana/ProfilesList.json", httpService:JSONEncode(profilesList.List or profiles))
            if bool then
                GuiLibrary:switchProfile(v)
            end
        end
    })
    ]]
end)

-- Friends tab
runFunction(function()
    local Friends = {List = {}}
    local list = {}
    Mana.Friends = list

    Friends = Tabs.Friends:CreateTextList({
        Name = "Friends",
        List = {},
        PlaceholderText = "Friend Name",
        Callback = function(v)
            if list[v] then
                table.remove(Friends.List, list[v])
                list[v] = nil
            else
                table.insert(Friends.List, v)
            end
        end
    })
end)

--[[ // TextList tab (soon)
runFunction(function()
    local sorting = {Value = "Alphabetical"}
    local backgroundTransparency = {Value = 0.7}
    local texSize = {Value = 15}
    local customTextEnabled = {Value = false}
    local customText = {Value = ""}
    local customTextSize = {Value = 18}
    local autoXAllignment = {Value = true}

    sorting = Tabs.TextList:CreateDropDown({
        Name = "Sorting",
        List = {"Alphabetical", "Length"},
        Default = "Alphabetical",
        Callback = function(v)
            textList:updateSortingMode(v)
        end
    })

    backgroundTransparency = Tabs.TextList:CreateSlider({
        Name = "Transparency",
        Function = function(v)
            textList:updateBackgroundTransparency(v)
        end,
        Min = 0,
        Max = 1,
        Default = 0.7,
        Round = 2
    })

    texSize = Tabs.TextList:CreateSlider({
        Name = "Text size",
        Function = function(v)
            textList:updateTextSize(v)
        end,
        Min = 10,
        Max = 30,
        Default = 15,
        Round = 0
    })

    customTextEnabled = Tabs.TextList:CreateToggle({
        Name = "Custom text",
        Default = true,
        Callback = function(callback)
            if customText.MainObject then customText.MainObject.Visible = callback end
            if customTextSize.MainObject then customTextSize.MainObject.Visible = callback end
            textList:addCustomText()
        end
    })

    customText = Tabs.TextList:CreateTextBox({
        Name = "Custom text",
        PlaceholderText = "Custom text text",
        Default = "Hello world!",
        Callback = function(v)
            textList:updateCustomText(v)
        end
    })
    customText.MainObject.Visible = false

    customTextSize = Tabs.TextList:CreateSlider({
        Name = "Custom text size",
        Function = function(v)
            textList:updateCustomTextSize(v)
        end,
        Min = 10,
        Max = 30,
        Default = 18,
        Round = 0
    })
    customTextSize.MainObject.Visible = false

    autoXAllignment = Tabs.TextList:CreateToggle({
        Name = "Auto text X align.",
        Default = false,
        Callback = function(callback)
            textList:updateAutoTextXAlignment(callback)
        end
    })
end)
]]

-- // cool gui button
local Button = Instance.new("TextButton")
local Corner = Instance.new("UICorner")
Button.Name = "GuiButton"
Button.Position = UDim2.new(0.12, 0, 0, -41)
Button.Text = "Mana"
Button.BackgroundColor3 = Color3.fromRGB(26, 25, 26)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Size = UDim2.new(0, 32, 0, 32)
Button.BorderSizePixel = 0
Button.BackgroundTransparency = 0.5
Button.Parent = GuiLibrary.ScreenGui
Corner.Parent = Button
Corner.CornerRadius = UDim.new(0, 8)

Button.MouseButton1Click:Connect(function()
    GuiLibrary:Toggle()
end)

UserInputService.InputBegan:Connect(function(Input)
    if Input.KeyCode == Enum.KeyCode.RightShift then
        GuiLibrary:Toggle()
    end
end)

print("[ManaV2ForRoblox/MainScript.lua]: Loaded in " .. tostring(tick() - startTick) .. ".")

Functions:RunFile("Universal.lua")

local suc, res = pcall(function()
    Functions:RunFile("Scripts/" .. PlaceId .. ".lua")
end)

if not suc then
    warn("[ManaV2ForRoblox/MainScript.lua]: an error occured while attempting to load game script: " .. res)
    GuiLibrary.CanLoadConfig = true
end

LocalPlayer.OnTeleport:Connect(function(State)
    if State == Enum.TeleportState.Started then
        local QueueTeleportFunction = [[
            if shared.ManaDeveloper then 
                loadstring(readfile("NewMana/MainScript.lua"))()
            else 
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Maanaaaa/ManaV2ForRoblox/main/MainScript.lua"))()
            end
        ]]
        queueteleport(QueueTeleportFunction)
    end
end)

repeat task.wait() until GuiLibrary.CanLoadConfig -- // so da game module will load before config will load
GuiLibrary.Loaded = true
Mana.Loaded = true
--GuiLibrary:Toggle()
GuiLibrary:LoadConfig()