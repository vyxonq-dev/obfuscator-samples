local TextChatService = game:GetService("TextChatService")

local function chat(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
    else
        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

chat("-gh 105900284766105 89011214394076 80591929991021 74841586768030 79723296413410 71673828053110 18626055142 18625377030 17314457081 17606680159")
task.wait(1)

chat("-pd")
task.wait(1)

chat("-sh")
task.wait(8)

loadstring(game:HttpGet("https://rscripts.net/raw/locust-fe-by-melon-scripter-check-the-description-for-hats_1785097445636_zsYvWCHw2Z.txt", true))()