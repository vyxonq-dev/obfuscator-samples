local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer

local function chat(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local channel = TextChatService.TextChannels.RBXGeneral
        if channel then
            channel:SendAsync(msg)
        end
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

task.spawn(function()
    local chatDelay = 2.12

    task.wait(2.57)
    chat("Axirian Glitcher Hats by 00_HappyM0d")
    task.wait(chatDelay)

    chat("-ch")
    task.wait(chatDelay)

    chat("-gh 12850191932")
    task.wait(chatDelay)

    chat("-gh 5918771427 102523984905681 132006952641112 5699795428 5316549755 5316539421 5316479641")
    task.wait(chatDelay)

    chat("-gh 139904067056008 108186273151388 72292903231768 84451219120140 95290698984301 6472661790 5270672491")
    task.wait(chatDelay)

    chat("-pd")
    task.wait(chatDelay)

    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Message from 00_HappyM0d",
            Text = "The hats kinda works with 24 Hour Star Glitcher",
            Icon = "rbxassetid://94507646687393",
            Duration = 5
        })
    end)

    local genv = getgenv and getgenv() or _G
    if genv.AxirianNotifyBindable then
        genv.AxirianNotifyBindable:Destroy()
    end

    local bindable = Instance.new("BindableFunction")
    genv.AxirianNotifyBindable = bindable

    bindable.OnInvoke = function(buttonText)
        if buttonText == "Execute" then
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Axirian-glitcher-by-theo-237832"))()
        end
    end

    pcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = "Axirian Glitcher",
            Text = "Would you like to execute Axirian Glitcher?",
            Duration = 10,
            Callback = bindable,
            Button1 = "Execute",
            Button2 = "Cancel"
        })
    end)
end)