--!nocheck
--!nolint

-- key system by fartsaken

local scripturl = "https://cdn.authguard.org/virtual-file/2f493e3be6f44ae18e2d390b93a2c83f"
local repo: string = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"
local showGUI = true

if not isfolder("Wicik") then
    makefolder("Wicik")
end

if isfile("Wicik/key.txt") then
    local file = readfile("Wicik/key.txt")
    if file == "wicked" then
        loadstring(game:HttpGet(scripturl))()
        showGUI = false
    end
end

if showGUI then
    local Obsidian: any = loadstring(game:HttpGet(repo .. "Library.lua"))()

    local Window = Obsidian:CreateWindow({
        Title = "Wicik",
        Footer = "Key System",
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
        Text = "Wicik Key System",
        DoesWrap = true,
        Size = 20,
    })

    Tabs.KeyTab:AddLabel({
        Text = "Get key from discord.gg/w7mpnRStv3",
        DoesWrap = true,
        Size = 17,
    })

    Tabs.KeyTab:AddButton({
        Text = "Copy Discord Link",
        Func = function()
            setclipboard("https://discord.gg/w7mpnRStv3")
            Obsidian:Notify("Copied to clipboard!", 10)
        end
    })

    Tabs.KeyTab:AddKeyBox("wicked", function(Success, ReceivedKey)
        if Success then
            writefile("Wicik/key.txt", ReceivedKey)
			Obsidian:Unload()
            loadstring(game:HttpGet(scripturl))()
        else
            Obsidian:Notify("Wrong key.", 5)
        end
    end)
end
