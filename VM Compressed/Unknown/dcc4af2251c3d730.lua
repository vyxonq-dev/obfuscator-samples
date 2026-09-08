local repo: string = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local showGUI = true

if not isfolder("SoraHub") then
    makefolder("SoraHub")
end

if isfile("SoraHub/key.txt") then
    local file = readfile("SoraHub/key.txt")
    if file == "nzea" then
        keysystem = true
        showGUI = false
    end
end

if showGUI then
    local Obsidian: any = loadstring(game:HttpGet(repo .. "Library.lua"))()

    local Window = Obsidian:CreateWindow({
        Title = "Sora Hub",
        Footer = "hi",
        ToggleKeybind = Enum.KeyCode.F8,
        SetMobileButtonSide = "Left",
        DisableSearch = true,
        ShowCustomCursor = false,
        Icon = "rbxassetid://140278037137417",
        IconSize = UDim2.fromOffset(40, 40),
        Size = UDim2.fromOffset(400, 300),
        Center = true,
        AutoShow = true
    })

    local Tabs = {
        KeyTab = Window:AddKeyTab("Key", "key"),
    }

    Tabs.KeyTab:AddLabel({
        Text = "Sora Hub Key System",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.KeyTab:AddLabel({
        Text = "Get key from discord.gg/szXxGCEJaD",
        DoesWrap = true,
        Size = 17,
    })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard("https://discord.gg/szXxGCEJaD")
            Obsidian:Notify("Copied to clipboard!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox("nzea", function(Success, ReceivedKey)
        if Success then
            writefile("SoraHub/key.txt", ReceivedKey)
			Obsidian:Unload()
            keysystem = true
        else
            Obsidian:Notify("Wrong key.", 5)
        end
    end)
end

repeat task.wait() until keysystem
getgenv().GamesTables = (function()
    local GameList = {
        [16991287194] = "https://raw.githubusercontent.com/Wic1k/Sora-Hub/refs/heads/main/S.E.W.H.lua.txt",
		[126650957495260] = "https://raw.githubusercontent.com/Wic1k/Sora-Hub/refs/heads/main/S.E.W.H.lua.txt",
        [107933350996709] = "https://raw.githubusercontent.com/Wic1k/Sora-Hub/refs/heads/main/S.E.W.H.lua.txt",
        [135880624242201] = "https://raw.githubusercontent.com/Wic1k/Sora-Hub/refs/heads/main/CutTrees.luau",
		[18794863104] = "https://raw.githubusercontent.com/Wic1k/Sora-Hub/refs/heads/main/Demonology.lua",	
    }
    local function ReverseTable(tbl)
        local proxy = {}
        for key, value in pairs(tbl) do
            proxy[key * 3 - 1] = value:reverse()
        end
        return proxy
    end
    return ReverseTable(GameList)
end)()
local Games = (function(tbl)
    local Lookup = {}
    for key, value in pairs(tbl) do
        Lookup[(key + 1) / 3] = value:reverse()
    end
    return Lookup
end)(getgenv().GamesTables)
local function FetchScript(url)
    local success, result = pcall(game.HttpGet, game, url)
    return success and result or nil
end
local function LoadGameScript(placeId)
    local URL = Games[placeId]
    if not URL then return end
    local Script = FetchScript(URL)
    if Script then
        local execute = loadstring(Script)
        if execute then
            execute()
        end
    end
end
pcall(LoadGameScript, game.PlaceId)
