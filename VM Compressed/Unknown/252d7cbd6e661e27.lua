loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Functions.lua"))()

local Root = "https://github.com/RegularVynixu/Discord-Inviter/raw/main"

-- \\ Services // --

local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

-- \\ Variables // --

local Assets = {
    DiscordInvitePrompt = LoadCustomInstance(`{Root}/Assets/DiscordInvitePrompt.rbxm`),
    NotificationSound = LoadCustomAsset(`{Root}/Assets/Notification.mp3`)
}

local httprequest = request or http_request or (http and http.request) or (syn and syn.request)

local function CopyToClipboard(text: string)
    local setclip = setclipboard or toclipboard or (Clipboard and Clipboard.set) or (syn and syn.write_clipboard)
    if setclip then
        setclip(text)
    end
end

local Module = {}

-- \\ Functions // --

local function GetInviteData(invite: string): (boolean?, any?)
    local success, result = pcall(function()
		return HttpService:JSONDecode(httprequest({
            Url = "https://ptb.discord.com/api/invites/" .. (invite:match("([^/]+)$") or invite),
            Method = "GET"
        }).Body)
	end)
    if not success then
        warn("Failed to get invite data:\n".. tostring(result))
        return
    end
    return success, result
end

local function ToggleShowPrompt(promptGui: ScreenGui, state: boolean)
    local frame = promptGui.Holder
    local serverIcon = frame.ServerIcon
    local serverInitials = serverIcon.ServerInitials
    local invited = frame.Invited
    local serverName = frame.ServerName
    local accept = frame.Accept
    local ignore = frame.Ignore
    
	if state then
		frame.Visible = true
		-- Frame size slightly expanded so the bigger message fits comfortably
		TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quint), { Size = UDim2.new(0.24, 0, 0.26, 0) }):Play()
		TweenService:Create(frame.UICorner, TweenInfo.new(1, Enum.EasingStyle.Quint), { CornerRadius = UDim.new(0, 8) }):Play()
		task.wait(1)
		TweenService:Create(serverIcon, TweenInfo.new(1, Enum.EasingStyle.Quint), { BackgroundTransparency = 0, ImageTransparency = 0 }):Play()
		TweenService:Create(serverInitials, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
		task.wait(0.1)
		TweenService:Create(invited, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
		task.wait(0.1)
		TweenService:Create(serverName, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
		task.wait(0.1)
		TweenService:Create(accept, TweenInfo.new(1, Enum.EasingStyle.Quint), { BackgroundTransparency = 0, TextTransparency = 0 }):Play()
		task.wait(0.1)
		TweenService:Create(ignore, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 0 }):Play()
		task.wait(1)
	else
		TweenService:Create(ignore, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
		task.wait(0.1)
		TweenService:Create(accept, TweenInfo.new(1, Enum.EasingStyle.Quint), { BackgroundTransparency = 1, TextTransparency = 1 }):Play()
		task.wait(0.1)
		TweenService:Create(serverName, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
		task.wait(0.1)
		TweenService:Create(invited, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
		task.wait(0.1)
		TweenService:Create(serverIcon, TweenInfo.new(1, Enum.EasingStyle.Quint), { BackgroundTransparency = 1, ImageTransparency = 1 }):Play()
		TweenService:Create(serverInitials, TweenInfo.new(1, Enum.EasingStyle.Quint), { TextTransparency = 1 }):Play()
		task.wait(1)
		TweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quint), { Size = UDim2.new() }):Play()
		TweenService:Create(frame.UICorner, TweenInfo.new(1, Enum.EasingStyle.Quint), { CornerRadius = UDim.new(1, 0) }):Play()
		task.wait(1)
		frame.Visible = false
	end
end

-- \\ Main // --

Module.Join = function(self, invite: string)
    assert(typeof(invite) == "string", "<string> Invalid invite provided")

    local success, result = GetInviteData(invite)
	if success and result then
        local code = result.code or (invite:match("([^/]+)$") or invite)
        
        -- Copy invite link to clipboard as fallback
        CopyToClipboard("https://discord.gg/" .. code)

        httprequest({
            Url = "http://127.0.0.1:6463/rpc?v=1",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["Origin"] = "https://discord.com"
            },
            Body = HttpService:JSONEncode({
                cmd = "INVITE_BROWSER",
                args = {
                    code = code
                },
                nonce = HttpService:GenerateGUID(false)
            })
        })
        
        -- Play notification sound
        local sound = Instance.new("Sound")
        sound.Volume = 1
        sound.PlayOnRemove = true
        sound.SoundId = Assets.NotificationSound
        sound.Parent = CoreGui
        sound:Destroy()
	end
end

Module.Prompt = function(self, data: { name: string?, invite: string })
    assert(typeof(data) == "table", "Data must be a table")
    assert(typeof(data.invite) == "string", "Invite must be a string")
    
    local invite = data.invite
    local success, result = GetInviteData(invite)

    if not (success and result) then return end
    
    local name = data.name or (result.guild and result.guild.name) or "Discord Server"
    local inviteCode = result.code or (invite:match("([^/]+)$") or invite)
    local fullInviteLink = "https://discord.gg/" .. inviteCode

    -- Invite prompt construction
    local promptGui = Assets.DiscordInvitePrompt:Clone()
    if not promptGui then return end

    local holder = promptGui.Holder
    local serverIcon = holder.ServerIcon
    local serverInitials = serverIcon.ServerInitials
    local serverName = holder.ServerName
    local accept = holder.Accept
    local ignore = holder.Ignore
    local invited = holder.Invited

    -- Setup
    holder.Size = UDim2.new()
    holder.UICorner.CornerRadius = UDim.new(1, 0)
    serverName.Text = name
    accept.Text = `Join <b>{name}</b>`
    
    -- === ONLY THE DEFAULT MESSAGE IS MADE BIGGER HERE ===
    for _, child in ipairs(invited:GetChildren()) do
        if child:IsA("UITextSizeConstraint") then
            child:Destroy() -- Removes default template size restriction
        end
    end

    local defaultMessage = `Join the Discord to get access to the script.\nIf you have the Discord app installed you will be auto redirected, if not <font color="#5865F2"><u>press here to copy link</u></font>`
    invited.RichText = true
    invited.TextWrapped = true
    invited.TextScaled = false
    invited.TextSize = 16
    invited.Size = UDim2.new(0.9, 0, 0.32, 0)
    invited.Position = invited.Position + UDim2.new(0, 0, 0, 10)
    invited.Text = defaultMessage
    invited.Active = true
    
    if result.guild and result.guild.icon ~= nil then
        serverIcon.Image = LoadCustomAsset(`https://cdn.discordapp.com/icons/{result.guild.id}/{result.guild.icon}.png`)
    else
        local initials = ""
        for word in name:gmatch("%S+") do
            initials ..= word:sub(1,1):upper()
            if #initials >= 3 then
                break
            end
        end
        
        serverInitials.Text = initials:upper()
        serverInitials.Visible = true
    end

    for _, c in holder:GetDescendants() do
        if c.ClassName == "TextLabel" or c.ClassName == "TextButton" then
            c.BackgroundTransparency = 1
            c.TextTransparency = 1
        elseif c.ClassName == "ImageLabel" then
            c.ImageTransparency = 1
        end
    end

    -- Display
    promptGui.Parent = CoreGui
    ToggleShowPrompt(promptGui, true)

    -- Connections
    local connections = {}

    -- Function to close the UI (Only triggered on 'Ignore')
    local function dismiss()
        for _, c in connections do
            c:Disconnect()
        end
        ToggleShowPrompt(promptGui, false)
        task.wait(2)
        promptGui:Destroy()
    end

    -- Copy link when clicking on the text
    connections.copyClick = invited.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            CopyToClipboard(fullInviteLink)
            invited.Text = `<font color="#57F287"><b>Invite link copied to clipboard!</b></font>`
            task.delay(2.5, function()
                if invited and invited.Parent then
                    invited.Text = defaultMessage
                end
            end)
        end
    end)

    connections.acceptEnter = accept.MouseEnter:Connect(function()
        TweenService:Create(accept, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(71, 82, 196) }):Play()
    end)
    connections.acceptLeave = accept.MouseLeave:Connect(function()
        TweenService:Create(accept, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(88, 101, 242) }):Play()
    end)
    
    -- Pressing Join triggers the redirect and copies link without closing UI
    connections.acceptActivated = accept.Activated:Connect(function()
        self:Join(invite)
        
        local oldText = accept.Text
        accept.Text = `<b>Joining / Copied!</b>`
        task.delay(2.5, function()
            if accept and accept.Parent then
                accept.Text = oldText
            end
        end)
    end)
    
    -- Pressing Ignore closes the UI
    do
        local text = ignore.Text
        connections.ignoreEnter = ignore.MouseEnter:Connect(function()
            ignore.Text = `<u>{text}</u>`
        end)
        connections.ignoreLeave = ignore.MouseLeave:Connect(function()
            ignore.Text = text
        end)
        connections.ignoreActivated = ignore.Activated:Connect(function()
            dismiss()
        end)
    end
end

-- \\ Prompt the UI with your invite // --
Module:Prompt({
    invite = "https://discord.gg/tGSf6JUn3u"
})

return Module
