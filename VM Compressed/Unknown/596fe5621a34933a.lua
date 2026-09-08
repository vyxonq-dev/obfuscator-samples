-- Configuration
local chatDelay = 1.25
local messages = {
    "-gh 17326800544 17326812233 17270225913 17270231731 17269998373 17269983359 17269952801 17270001635 17270178857 17375337078",
    "MonK LORD IS BY SUPERSIDE",
    "-pd",
    "-net", -- Added right below -pd
    "SCriPt By SuPerMonK "
}

-- Function to safely send chat messages across different Roblox chat systems
local function sendChat(message)
    -- Modern TextChatService (2023+)
    local textChatService = game:GetService("TextChatService")
    if textChatService and textChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        local textChannel = textChatService.TextChannels:FindFirstChild("RBXGeneral")
        if textChannel then
            textChannel:SendAsync(message)
            return
        end
    end
    
    -- Legacy ChatService fallback
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local defaultChatSystemChatEvents = replicatedStorage:FindFirstChild("DefaultChatSystemChatEvents")
    if defaultChatSystemChatEvents then
        local sayMessageRequest = defaultChatSystemChatEvents:FindFirstChild("SayMessageRequest")
        if sayMessageRequest and sayMessageRequest:IsA("RemoteEvent") then
            sayMessageRequest:FireServer(message, "All")
        end
    end
end

-- Main Execution Sequence
task.spawn(function()
    -- Loop through and send the configured messages with the specified delay
    for _, msg in ipairs(messages) do
        sendChat(msg)
        task.wait(chatDelay)
    end
    
    -- Execute the external Patchma Hub script after the final delay
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FE-patchma-hub-by-myworld-60137"))()
    end)
    
    if not success then
        warn("Failed to execute external script: " .. tostring(err))
    end
end)