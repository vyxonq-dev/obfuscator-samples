repeat
	task.wait()
until game:IsLoaded()

local FOLDER_PATH = "ScyllaV2"
local KEY_PATH = FOLDER_PATH.."/Key.txt"

if not isfolder(FOLDER_PATH) then 
    makefolder(FOLDER_PATH)
end

script_key = script_key or (isfile(KEY_PATH) and readfile(KEY_PATH) or nil)

local Cloneref = cloneref or clonereference or function(instance) return instance end
local Players = Cloneref(game:GetService("Players"))
local HttpService = Cloneref(game:GetService("HttpService"))
local Request = http_request or request or syn.request or http

local UI = loadstring(game:HttpGet("https://raw.githubusercontent.com/acezqqq/moddedfluent/refs/heads/main/main.lua"))()
local API = loadstring(game:HttpGet("https://sdkAPI-public.luarmor.net/library.lua"))()

local games = {
	TypeSoul = 4871329703,
	DIG = 7218065222,
	BLR = 6325068386,
	GhoulRe = 6490954291,
	GAG = 7436755782,
	NinjaTime = 3110388936
}

local GAME_SCRIPTS = {
	TypeSoul = "111690f677f4dd398f04d54e0e8085b7",
    DIG = "052639790b8ed3e45be3b42d34068bc0",
    BLR = "ff5cdf86ffe96e84228656716cf17fb2",
    GhoulRe = "710ce19e67b940f222204ab442ec469f",
    GAG = "c9cc5279f88a2f8fbdb7a3091c3a07be",
	NinjaTime = "ef9455c5229388090b6d981daf114ff8"
}

local OVERRIDES = {
    [8075399143] = "38bc18fab08ad4249ddfb77f69dbff8d",
}

local function n()
    if OVERRIDES[game.PlaceId] then
        return OVERRIDES[game.PlaceId]
    end
    for name, universeId in pairs(games) do
        if game.GameId == tonumber(universeId) then
            return GAME_SCRIPTS[name]
        end
    end
    return nil
end

local scriptId = n()


if not scriptId then
    Players.LocalPlayer:Kick("Scylla doesn't support this game | Join our discord for more information")
    return
end

API.script_id = scriptId

local function notify(title, content, duration)
	UI:Notify({ Title = title, Content = content, Duration = duration or 8 })
end

local function openDiscord()
    setclipboard("https://discord.gg/ScyllaHub")
    notify("Copied To Clipboard", "Discord Server Link has been copied to your clipboard", 16)
    local discordInviter = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
    discordInviter.Join("https://discord.com/invite/ScyllaHub")
end

local function checkKey(input_key)
    local key = input_key or script_key
    if not key then return notify("Key Error", "No key provided") end
    
	local status = API.check_key(key)
	
	if status.code == "KEY_VALID" then
		script_key = key
		writefile(KEY_PATH, script_key)
		API.load_script()
        UI:Destroy()
        return true
	elseif status.code:find("KEY_") then
		local messages = {
			KEY_HWID_LOCKED = "Key linked to a different HWID. Please reset it using our bot",
			KEY_INCORRECT = "Key is incorrect",
			KEY_INVALID = "Key is invalid"
		}
		notify("Key Check Failed", messages[status.code] or "Unknown error")
	else
		Players.LocalPlayer:Kick("Key check failed: " .. status.message .. " Code: " .. status.code)
	end
	return false
end

local function createUI()
    local Window = UI:CreateWindow({
        Title = "Scylla",
        SubTitle = "Loader",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 320),
        Acrylic = false,
        Theme = "Dark",
        MinimizeKey = Enum.KeyCode.End
    })

    local Tabs = { Main = Window:AddTab({ Title = "Key", Icon = "" }) }

    local Input = Tabs.Main:AddInput("Key", {
        Title = "Enter Key:",
        Default = script_key or "",
        Placeholder = "Example: agKhRikQP..",
        Numeric = false,
        Finished = false
    })

    Tabs.Main:AddButton({
        Title = "Get Key (Linkvertise)",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Scylla_Scripthub_Linkvertise-PDevdGuoyxIP")
            notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
        end
    })

    Tabs.Main:AddButton({
        Title = "Get Key (Lootlabs)",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Scylla_Scripthub_Lootlabs-ZqdQzOWDhpSs")
            notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
        end
    })

    Tabs.Main:AddButton({
        Title = "Get Key (Workink)",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Scylla_Scripthub_Workink-qsCyYutvqNcX")
            notify("Copied To Clipboard", "Ad Reward Link has been copied to your clipboard", 16)
        end
    })

    Tabs.Main:AddButton({
        Title = "Check Key",
        Callback = function()
            checkKey(Input.Value)
        end
    })

    Tabs.Main:AddButton({
        Title = "Join Discord",
        Callback = openDiscord
    })

    Window:SelectTab(1)
    notify("Scylla", "Loader Has Loaded Successfully")
    
    return Window
end

if script_key then
	if not checkKey() then
        createUI()
    end
else
    createUI()
end

repeat
	task.wait()
until getgenv().ScyllaKey
