print("------ Neow Hub Start ------ ")
print("------ AUTO-EMOJI ------ ")
warn("LOADING WindUI...")
warn("Pls ignore debug :)")
warn('NOTE (1/2): If you see error: ImageLabel is not a valid member of Frame "Flame", NOT tell it about me!')
warn('NOTE (2/2): Im think, it mistake by WindUI Library Developer/Scripter.')

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
print("loaded windui")

local title, Size, MinSize, MaxSize
local UserInputService = game:GetService("UserInputService")
local screenSize = workspace.CurrentCamera.ViewportSize
local passedverify = false
local mobile = false
local unknown = false
local laptop = false

local function ShowPopup(title, content)
    local proceedEvent = Instance.new("BindableEvent")
    WindUI:Popup({
        Title = title,
        Icon = "info",
        Content = content,
        Buttons = {
            {
                Title = "Continue",
                Icon = "arrow-right",
                Callback = function()
                    proceedEvent:Fire()
                end,
                Variant = "Tertiary",
            },
        }
    })
    proceedEvent.Event:Wait()
end

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    ShowPopup("Warning!","Are you playing on mobile.\nThis script is NOT tested for mobile.\nDo you want to continue?\n(If not, just close the script)")
    passedverify = true
	mobile = true
elseif UserInputService.KeyboardEnabled then
    if screenSize.X <= 1366 and screenSize.Y <= 768 then
        ShowPopup("Warning!","Are you probably using a laptop.\nThis script is tested for PC, but not laptop.\nDo you want to continue?\n(If not, just close the script)")
        passedverify = true
		laptop = true
    end
else
    ShowPopup("Warning!","Failed to detect your device.\nDo you want to continue?\n(If not, just close the script)")
    passedverify = true
	unknown = true
end

if passedverify then
    print("User confirmed, continuing script execution...")
end

local Players = game:GetService("Players")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

local AutoEmojiEnabled = false
local StripEmojisEnabled = false
local IgnoreLocalMessages = true
local AntiSpamEnabled = true
local CoolDownTimer = 0
local LastMessageTime = 0
local LastSentMessage = ""
local SelectedEmoji = "🤓"
local BlockedUsers = {}
local fixbugblockuser = true
local fixbugunblockuser = true
local fixbugcustomemoji = true

local function DebugPrint(text)
    warn("[DEBUG]: " .. tostring(text))
end

local function Chat(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
    else
        game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

local function NotifyFiltered(title, content)
    WindUI:Notify({
        Title = title or "Invalid Input!",
        Content = content or "Message was blocked.",
        Duration = 5,
        Icon = "circle-alert"
    })
end

local function isEmoji(char)
    local byte = utf8.codepoint(char)
    return (byte >= 0x1F300 and byte <= 0x1FAFF) or (byte >= 0x2600 and byte <= 0x27BF)
end

local function StripMessageKeepUnicode(msg)
    local result = ""
    for _, c in utf8.codes(msg) do
        local char = utf8.char(c)
        if not isEmoji(char) and char ~= "#" and char ~= "<" and char ~= ">" and char ~= "&" then
            result = result .. char
        end
    end
    msg = result:gsub("^%s+", ""):gsub("%s+$", "")
    if msg:match("^#+$") then
        NotifyFiltered("Hash (#) detected!", "Message contained only hashes (#).")
        DebugPrint("Blocked hash-only message: " .. msg)
        return nil
    end
    if msg == "" then return nil end
    return msg
end

local function AreMessagesSimilar(msg1, msg2)
    msg1 = msg1:lower():gsub("[%p%s]", "")
    msg2 = msg2:lower():gsub("[%p%s]", "")
    return msg1 == msg2
end

local function FormatMessage(msg)
    msg = msg or ""
    if msg:match("^#+$") then
        NotifyFiltered("Hash (#) detected!", "Message contained only hashes (#).")
        DebugPrint("Blocked hash-only message: " .. msg)
        return nil
    end
    msg = msg:gsub("#", "")
    msg = msg:gsub("[<>&]", "")
    if msg:match("^%s*$") then return nil end
    return '"' .. msg .. '" ' .. SelectedEmoji
end

local function IsUserBlocked(senderPlayer)
    if not senderPlayer then return false end
    local name = senderPlayer.Name:lower()
    local display = senderPlayer.DisplayName:lower()
    return BlockedUsers[name] or BlockedUsers[display] or false
end

local function OnMessage(msg, senderUserId, senderName)
    if not AutoEmojiEnabled then return end
    if not senderUserId then return end
    if senderUserId == LocalPlayer.UserId and IgnoreLocalMessages then return end
    local senderPlayer = Players:GetPlayerByUserId(senderUserId)
    if IsUserBlocked(senderPlayer) then
        DebugPrint("Ignored message from blocked user: " .. (senderPlayer and senderPlayer.Name or senderName))
        return
    end
    if tick() - LastMessageTime < CoolDownTimer then return end
    if msg:find("[<>&]") then
        NotifyFiltered("Blocked characters detected!", "Message contains invalid characters and was not sent.")
        DebugPrint("Blocked message due to special characters: " .. msg)
        return
    end
    if msg:lower():find("https://") or msg:lower():find("%.com") or msg:lower():find("%.tv") then
        NotifyFiltered("Blocked link detected!", "Messages containing links are blocked.")
        DebugPrint("Blocked message due to link: " .. msg)
        return
    end
    if StripEmojisEnabled then
        local stripped = StripMessageKeepUnicode(msg)
        if stripped then
            if AntiSpamEnabled and AreMessagesSimilar(stripped, LastSentMessage) then
                return
            end
            task.wait(0.2)
            Chat('"' .. stripped .. '" ' .. SelectedEmoji)
            LastMessageTime = tick()
            LastSentMessage = stripped
            DebugPrint("Sent stripped message: " .. stripped)
        end
        return
    end
    local formatted = FormatMessage(msg)
    if formatted then
        if AntiSpamEnabled and AreMessagesSimilar(formatted, LastSentMessage) then
            return
        end
        task.wait(0.2)
        Chat(formatted)
        LastMessageTime = tick()
        LastSentMessage = formatted
        DebugPrint("Sent formatted message: " .. formatted)
    end
end

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    title = "(📱) Neow Hub | FE Auto-Emoji"
    Size = UDim2.fromOffset(500, 400)
    MinSize = Vector2.new(450, 320)
    MaxSize = Vector2.new(600, 450)

elseif UserInputService.KeyboardEnabled and not UserInputService.TouchEnabled then
    if UserInputService.MouseEnabled then
        title = "(🖥) Neow Hub | FE Auto-Emoji"
    else
        title = "(💻) Neow Hub | FE Auto-Emoji"
    end
    Size = UDim2.fromOffset(580, 480)
    MinSize = Vector2.new(520, 350)
    MaxSize = Vector2.new(700, 500)
else
    title = "(❓) Neow Hub | FE Auto-Emoji"
    Size = UDim2.fromOffset(540, 440)
    MinSize = Vector2.new(480, 360)
    MaxSize = Vector2.new(680, 480)
end

local Window = WindUI:CreateWindow({
    Title = title,
    Icon = "cat",
    Author = "by BadScriptsMaker ",
    Folder = "NeowHubLol",
    Size = Size,
    MinSize = MinSize,
    MaxSize = MaxSize,
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false
    },
})

local HomeTab = Window:Tab({
    Title = "Home",
    Icon = "house",
    Desc = 'Can be called "Settings".',
    Locked = false,
})

local FunTab = Window:Tab({
    Title = "Auto-Emoji",
    Icon = "laugh",
    Desc = "Main Tab",
    Locked = false,
})

local ImLoveBobux = Window:Tab({
    Title = "---------------------",
    Locked = true,
})

local HowToUseTab = Window:Tab({
    Title = "How To Use",
    Icon = "circle-question-mark",
    Desc = "Useful for new users",
    Locked = false,
})

local ChangeLog = Window:Tab({
    Title = "Change Log",
    Icon = "circle-ellipsis",
    Desc = "Here new updates info",
    Locked = false,
})

local Section = HomeTab:Section({ 
    Title = "Home (Settings)",
})

local Section = FunTab:Section({ 
    Title = "Auto-Emoji",
})

local Section = HowToUseTab:Section({ 
    Title = "Tutorial (How To Use)",
})

local Section = ChangeLog:Section({ 
    Title = "Change Log",
})

HowToUseTab:Paragraph({
        Title = "How to enable?",
		Desc = '• Go to tab "Auto-Emoji"\n• Click "Enable/Disable" to enable.'
    })

HowToUseTab:Paragraph({
        Title = "How to use it?",
		Desc = '• Script will repeating messages by Players.\n• If found annoying player, can you block him in Home.\n• If player is uses emojis, use "Strip Emojis" if that annoying.'
    })

if LocalPlayer.DisplayName == LocalPlayer.Name then
    HomeTab:Paragraph({
        Title = "Welcome, " .. LocalPlayer.DisplayName .. "!",
        Desc = 'Recommended to visit tab "How To Use".\nTo enable "Auto-Emoji", go to tab "Auto-Emoji".',
        Locked = false
    })
else -- Lua sees: if LocalPlayer.DisplayName ~= LocalPlayer.Name then (useful?)
    HomeTab:Paragraph({
        Title = "Welcome, " .. LocalPlayer.DisplayName .. "! (" .. LocalPlayer.Name .. ")",
        Desc = 'Recommended to visit tab "How To Use".\nTo enable "Auto-Emoji", go to tab "Auto-Emoji".',
        Locked = false
    })
end

HomeTab:Paragraph({
    Title = "-------------------"
})

local ToggleEmoji = FunTab:Toggle({
    Title = "Enable/Disable Auto Emoji",
    Desc = "Enable or disable automatic emoji responses.",
    Default = false,
    Callback = function(state)
        AutoEmojiEnabled = state
        if not AutoEmojiEnabled then
            StripEmojisEnabled = false
            IgnoreLocalMessages = true
        end
        DebugPrint("AutoEmojiEnabled set to: " .. tostring(AutoEmojiEnabled))
    end
})

local StripEmojiToggle = HomeTab:Toggle({
    Title = "Strip Emojis from Player Messages",
    Desc = "Removes emojis and blocked characters from player messages.",
    Default = true,
    Callback = function(state)
        StripEmojisEnabled = state
        IgnoreLocalMessages = true
        DebugPrint("StripEmojisEnabled set to: " .. tostring(StripEmojisEnabled))
    end
})

local ToggleAntiSpam = HomeTab:Toggle({
    Title = "Anti-Spam",
    Desc = "Prevents re-sending identical or slightly similar messages to avoid spam.",
    Default = true,
    Callback = function(state)
        AntiSpamEnabled = state
        DebugPrint("AntiSpamEnabled set to: " .. tostring(AntiSpamEnabled))
    end
})

local InputCooldown = HomeTab:Input({
    Title = "Cooldown (Seconds)",
    Desc = "Set the cooldown between Auto-Emoji messages.",
    Value = tostring(CoolDownTimer),
    Type = "Input",
    Placeholder = "Seconds...",
    Callback = function(input)
        local num = tonumber(input)
        if num and num >= 0 then
            CoolDownTimer = num
            DebugPrint("Cooldown timer set to: " .. tostring(CoolDownTimer))
        else
            NotifyFiltered("Invalid Input!", "Cooldown must be a number 0 or higher.")
            DebugPrint("Sent notify: Cooldown must be a number 0 or higher.")
        end
    end
})

local EmojiDropdown = FunTab:Dropdown({
    Title = "Emojis",
    Desc = "Select your emoji.",
    Values = { "😭🙏🥀", "🙏🥀", "🤓", "🥀" },
    Value = "🤓",
    Callback = function(option)
        SelectedEmoji = option
        DebugPrint("Dropdown selected emoji: " .. option)
    end
})

local InputEmoji = FunTab:Input({
    Title = "Custom Emoji",
    Desc = "Enter your own emoji or text.",
    Value = SelectedEmoji,
    Type = "Input",
    Placeholder = "Enter emoji...",
    Callback = function(input)
        if fixbugcustomemoji then
            fixbugcustomemoji = false
            return
        end
        if input == "" then
            NotifyFiltered("Invalid Emoji!", "Emoji cannot be empty.")
            DebugPrint("Sent notify: Emoji cannot be empty.")
        elseif input:find("[%w<>#]") then
            NotifyFiltered("Invalid Emoji!", "Please only use emoji characters.")
            DebugPrint("Sent notify: Please only use emoji characters.")
        else
            SelectedEmoji = input
            DebugPrint("Successfully changed Custom Emoji to: " .. input)
        end
    end
})

HomeTab:Input({
    Title = "Block User",
    Desc = "Enter username to block.",
    Type = "Input",
    Placeholder = "Name...",
    Callback = function(input)
        if fixbugblockuser then
            fixbugblockuser = false
            return
        end

        if input == "" then
            NotifyFiltered("Invalid Input", "You must type a name.")
            return
        end

        local lowerInput = input:lower()
        local me = LocalPlayer.Name:lower()

        if lowerInput == me or lowerInput == LocalPlayer.DisplayName:lower() then
            NotifyFiltered("Action Denied", "You cannot block yourself.")
            return
        end

        if lowerInput == "all" then
            local count = 0
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    BlockedUsers[player.Name:lower()] = true
                    BlockedUsers[player.DisplayName:lower()] = true
                    count += 1
                end
            end
            if count > 0 then
                NotifyFiltered("All Users Blocked!", "Successfully blocked " .. count .. " players.")
            else
                NotifyFiltered("No Players Found", "There were no other players to block.")
            end
            return
        end

        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and (player.Name:lower():find(lowerInput, 1, true) or player.DisplayName:lower():find(lowerInput, 1, true)) then
                BlockedUsers[player.Name:lower()] = true
                BlockedUsers[player.DisplayName:lower()] = true
                local display = player.DisplayName ~= player.Name and (player.DisplayName .. " (" .. player.Name .. ")") or player.DisplayName
                NotifyFiltered("User Blocked!", display)
                return
            end
        end

        NotifyFiltered("Not Found", input .. " was not found.")
    end
})

HomeTab:Input({
    Title = "Unblock User",
    Desc = "Enter username to unblock.",
    Type = "Input",
    Placeholder = "Name...",
    Callback = function(input)
        if fixbugunblockuser then
            fixbugunblockuser = false
            return
        end

        if input == "" then
            NotifyFiltered("Invalid Input", "You must type a name.")
            return
        end

        local lowerInput = input:lower()
        local me = LocalPlayer.Name:lower()

        if lowerInput == me or lowerInput == LocalPlayer.DisplayName:lower() then
            NotifyFiltered("Action Denied", "You cannot unblock yourself.")
            return
        end

        if lowerInput == "all" then
            local count = 0
            for k in pairs(BlockedUsers) do
                BlockedUsers[k] = nil
                count += 1
            end
            if count > 0 then
                NotifyFiltered("All Users Unblocked!", "Successfully unblocked " .. count .. " players.")
            else
                NotifyFiltered("No Users Blocked", "There were no users to unblock.")
            end
            return
        end

        local found = false
        for k in pairs(BlockedUsers) do
            if k:find(lowerInput, 1, true) then
                BlockedUsers[k] = nil
                found = true
            end
        end

        if found then
            for _, player in ipairs(Players:GetPlayers()) do
                if player.Name:lower():find(lowerInput, 1, true) or player.DisplayName:lower():find(lowerInput, 1, true) then
                    local display = player.DisplayName ~= player.Name and (player.DisplayName .. " (" .. player.Name .. ")") or player.DisplayName
                    NotifyFiltered("User Unblocked!", display)
                    return
                end
            end
            NotifyFiltered("User Unblocked!", input)
        else
            NotifyFiltered("Not Found", input .. " was not blocked.")
        end
    end
})

if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
    TextChatService.MessageReceived:Connect(function(message)
        local senderUserId = message.TextSource and message.TextSource.UserId
        local senderName = message.TextSource and message.TextSource.Name
        if senderUserId ~= LocalPlayer.UserId then
            local success, result = pcall(function()
                return message:FilterStringAsync(LocalPlayer.UserId)
            end)
            if success and result then
                local filteredText = result:GetNonChatStringForBroadcastAsync()
                if filteredText:match("#") then
                    NotifyFiltered("Filtered Message!", "A message was partially or fully filtered by Roblox.")
                    DebugPrint("Blocked filtered message: " .. message.Text)
                    return
                end
            end
        end
        OnMessage(message.Text or "", senderUserId, senderName)
    end)
else
    game.ReplicatedStorage.DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
        local sender = Players:FindFirstChild(messageData.FromSpeaker)
        local senderUserId = sender and sender.UserId
        local senderName = sender and sender.Name
        local msg = messageData.Message or ""
        if senderUserId ~= LocalPlayer.UserId and msg:match("#") then
            NotifyFiltered("Filtered Message!", "A message was partially or fully filtered by Roblox.")
            DebugPrint("Blocked filtered message: " .. msg)
            return
        end
        OnMessage(msg, senderUserId, senderName)
    end)
end

local Paragraph = ChangeLog:Paragraph({
    Title = "Current version: v1.0.0 BETA",
    Desc = nil,
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

local Paragraph = ChangeLog:Paragraph({
    Title = "v1.0.0 BETA",
    Desc = '• Released a beta version\n(Yea, auto-emoji is small and im going update it rare or not.)',
    Color = nil,
    Image = nil,
    ImageSize = nil,
    Thumbnail = nil,
    ThumbnailSize = nil,
    Locked = false,
})

print("------ Neow Hub End ------ ")