local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/lolpoppyus/Roblox-Lua/master/Pop%20UI%20Lib", true))()

local ui = library:Tab("Classic sword fight")

ui:Textbox("loop kill player", function(arg)
    local range = 1000
    local playerName = arg

    local player = game:GetService("Players").LocalPlayer
    game:GetService("RunService").RenderStepped:Connect(function()
        local p = game.Players:GetPlayers()
        for i = 1, #p do
            local v = p[i]
            if string.find(v.Name:lower(), playerName:lower()) or (v.DisplayName and string.find(v.DisplayName:lower(), playerName:lower())) then
                local character = v.Character
                if character and player.Character then
                    for _, tool in pairs(player.Character:GetChildren()) do
                        if tool:IsA("Tool") and tool:FindFirstChild("Handle") then
                            tool:Activate()
                            for _, part in pairs(character:GetChildren()) do
                                if part:IsA("BasePart") then
firetouchinterest(tool.Handle, part, 0)                                    
firetouchinterest(tool.Handle, part, 1)
                                end
                            end
                        end
                    end
                end
            end
        end
    end)
end)
