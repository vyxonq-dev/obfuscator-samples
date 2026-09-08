-- Config(THIS IS WHERE YOU CHANGE SOME STUFF, including text messages, and the hats)
local chatDelay = 1.25
local messages = {
    "-ch",
    "-gh 86048616617650, 135282887473939, 99573021784110, 116580506166118, 6472661790, 115946086901617, 138364679836274, 102599402682100, 82942681251131, 140395948277978, 90960046381276, 75869582622966",
    "-gh 18989526470, 12798859142, 109162000933426",
    "Rig Hats by Tehpwnzorofded10",
    "-pd",
    "-net", -- Added right below -pd
    "Use any of the reanimates(except lc and il) in here to start."
}

local function sendChat(message)
    local textChatService = game:GetService("TextChatService")
    if textChatService and textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = textChatService.TextChannels:FindFirstChild("RBXGeneral")
        if textChannel then
            textChannel:SendAsync(message)
            return
        end
    end
    
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if defaultChatSystemChatEvents then
        local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
        if sayMessageRequest and sayMessageRequest:IsA("RemoteEvent") then
            sayMessageRequest:FireServer(message, "All")
        end
    end
end

task.spawn(function()
    for _, msg in ipairs(messages) do
        sendChat(msg)
        task.wait(chatDelay)
    end
    
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-patchma-hub-by-myworld-60137"))()
    end)
    
    if not success then
        warn("failed to load lol | " .. tostring(err))
    end
end)