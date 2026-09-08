-- Configuration
local chatDelay = 1.25
local messages = {
    "-gh 14157137406 95290698984301 84451219120140  72292903231768 108186273151388 139904067056008 10971858125 5316479641 5316549755 5699795428 5316539421 126461620175785 4504231783 215718515 215718515",
    "MonK V2 Fe ",
    "NEW SCRIPT BY MONK WEEEEE ",
    "-net", -- Added right below -pd
    "SCriPt By SuperMonKxscripts V2 WrokiNg!"
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
       loadstring(game:HttpGet("https://raw.githubusercontent.com/BloxinStud10/24-Hours/refs/heads/main/Obfuscations/StarGlitcherV1.luau"))()
    end)
    
    if not success then
        warn("Failed to execute external script: " .. tostring(err))
    end
end)
