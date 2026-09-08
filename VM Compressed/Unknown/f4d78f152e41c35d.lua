local visible = true
local copymsg = "Copied to clipboard!"
local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "2450de615decd6aa6f8930ece4879d3b"

local function validateKey(key)
    local status = api.check_key(key)
    if status.code == "KEY_VALID" then
        return true, "Key is valid!"
    elseif status.code == "KEY_HWID_LOCKED" then
        return false, "Key is linked to a different device (HWID). Please reset it using our Discord's luarmor control panel."
    elseif status.code == "KEY_INCORRECT" or status.code == "KEY_INVALID" then
        return false, "Key is incorrect or deleted."
    else
        return false, "Failed to check key."
    end
    return false, "Unknown error, should never happen."
end

local function load(key)
    if key then
        script_key = key
    end
    api.load_script()
end

if not isfolder("Riddance") then
    makefolder("Riddance")
end

if isfile("Riddance/key.txt") then
    local file = readfile("Riddance/key.txt")
    if validateKey(file) then
        visible = false
        load(file)
    end
end

if script_key then
    if validateKey(script_key) then
        visible = false
        load()
    end
end

if visible then
    local lib = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

    local win = lib:CreateWindow({
        Name = "Riddance",
        LoadingTitle = "Riddance",
        ShowText = "Riddance",
        LoadingSubtitle = "",
        Theme = "Default",
        ToggleUIKeybind = (game.GameId == 6331902150 and "H") or "G",
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false
    })

    local function notify(content)
        lib:Notify({
            Title = "Notification",
            Content = content,
            Duration = 5,
            Image = "key"
        })
    end

    local tab = win:CreateTab("Key System", "key")

    tab:CreateSection("Key System")

    tab:CreateButton({
        Name = "Linkvertise",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Riddance_Premium_Linkvertise-IbUHRQbdLbnF")
            notify(copymsg)
        end
    })

    tab:CreateButton({
        Name = "Lootlabs",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Riddance_Premium_Lootlabs-uIsDXzXErYSY")
            notify(copymsg)
        end
    })

    tab:CreateButton({
        Name = "Work.ink",
        Callback = function()
            setclipboard("https://ads.luarmor.net/get_key?for=Riddance_Premium_Workink-vUfZJgriPsXO")
            notify(copymsg)
        end
    })

    tab:CreateSection("Discord")

    tab:CreateButton({
        Name = "Join Discord",
        Callback = function()
            setclipboard("https://discord.gg/hbHEv8QvE9")
            notify(copymsg)
        end
    })

    tab:CreateSection("Verification")

    local keybox = tab:CreateInput({
        Name = "Enter Key",
        CurrentValue = "",
        PlaceholderText = "Paste your key here",
        RemoveTextAfterFocusLost = false,
        Callback = function() end
    })

    tab:CreateButton({
        Name = "Verify Key",
        Callback = function()
            local key = keybox.CurrentValue
            local valid, msg = validateKey(key)
            if valid then
                writefile("Riddance/key.txt", key)
                notify(msg)
                lib:Destroy()
                load(key)
            else
                notify(msg)
            end
        end
    })
end
