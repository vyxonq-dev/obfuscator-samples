local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "discord.gg/esYJzYnsfC",
    LoadingTitle = "Cumming...",
    LoadingSubtitle = "By TGMANKASKE",
    ConfigurationSaving = {
        Enabled = false
    }
})

local Tab = Window:CreateTab("Main", 4483362458)
local Amount = 0

Tab:CreateInput({
    Name = "Cash Amount",
    PlaceholderText = "Example: 5000",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        local number = tonumber(text)
        if number and number > 0 then
            Amount = number
            print("Amount set to:", Amount)
        else
            Amount = 0
            warn("Invalid amount")
        end
    end
})

Tab:CreateButton({
    Name = "Give Cash",
    Callback = function()
        if Amount > 0 then
            local rewardType = "Cash"
            local remote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):FindFirstChild("giveRewards")
            if remote and remote:IsA("RemoteEvent") then
                remote:FireServer(rewardType, Amount)
                print("Sent:", Amount)
            else
                warn("RemoteEvent 'giveRewards' not found!")
            end
        else
            warn("Invalid or zero amount.")
        end
    end
})
