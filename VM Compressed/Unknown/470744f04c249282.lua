pcall(function()
    repeat wait() until game:IsLoaded()
    local TeleportService = cloneref(game:GetService("TeleportService"))
    local Players = game:GetService("Players")
    local GuiService = cloneref(game:GetService("GuiService"))
    local placeId = game.PlaceId
    local plr = Players.LocalPlayer
    local GC = getconnections or get_signal_cons
    if GC then
        for _, v in pairs(GC(plr.Idled)) do
            if v.Disable then
                v:Disable()
            elseif v.Disconnect then
                v:Disconnect()
            end
        end
    else
        local vu = cloneref(game:GetService("VirtualUser"))
        plr.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    end
    GuiService.ErrorMessageChanged:Connect(function()
        while true do 
            local suc, err = pcall(function ()
                TeleportService:TeleportToPlaceInstance(placeId, plr)
            end)
            if suc then
                break
            else
                task.wait(2)
            end
        end
    end)
    plr.CharacterAdded:Connect(function(newChar)
        char = newChar
    end)
    local map = nil
    game.Workspace.DescendantAdded:Connect(function(m)
        if m:IsA("Model") and m:GetAttribute("MapID") then
            map = m
        end
    end)
    game.Workspace.DescendantRemoving:Connect(function(m)
        if m == map then
            map = nil
        end
    end)
    while true do
        if not char or not char:FindFirstChild("HumanoidRootPart") then
            repeat
                char = plr.Character
                task.wait(0.5)
            until char and char:FindFirstChild("HumanoidRootPart")
        end
        while not map or not map:FindFirstChild("CoinContainer") do
            if char and char:FindFirstChild("HumanoidRootPart") then
                char.HumanoidRootPart.CFrame = CFrame.new(132, 140, 60)
            end
            task.wait(1)
        end
        local coinToCollect = nil
        for _, coin in ipairs(map:FindFirstChild("CoinContainer"):GetChildren()) do
            if coin:IsA("Part") and coin.Name == "Coin_Server" and coin:GetAttribute("CoinID") == "BeachBall" then
                local cv = coin:FindFirstChild("CoinVisual")
                if cv and cv.Transparency ~= 1 then
                    coinToCollect = coin
                    break
                end
            end
        end
        if coinToCollect and char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = coinToCollect.CFrame
            task.wait(1)
            char.HumanoidRootPart.CFrame = CFrame.new(132, 140, 60)
            task.wait(2)
        else
            char.HumanoidRootPart.CFrame = CFrame.new(132, 140, 60)
            task.wait(1)
        end
    end
    task.spawn(function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Linux6699/DaHubRevival/main/AntiFling.lua'))()
    end)
end)
