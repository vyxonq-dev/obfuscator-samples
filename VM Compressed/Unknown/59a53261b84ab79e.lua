local ScreenGui = Instance.new("ScreenGui") local Frame = Instance.new("Frame") local UICorner = Instance.new("UICorner") local player = game.Players.LocalPlayer local playerName = player.Name

ScreenGui.Name = "TA SCRIPT" ScreenGui.Parent = player:WaitForChild("PlayerGui")

Frame.Parent = ScreenGui Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) Frame.Position = UDim2.new(0.2, 0, 0.2, 0) Frame.Size = UDim2.new(0, 400, 0, 400) Frame.Active = true Frame.Draggable = true

UICorner.CornerRadius = UDim.new(0, 8) UICorner.Parent = Frame

local function createButton(name, position, callback) local button = Instance.new("TextButton") button.Parent = Frame button.Size = UDim2.new(0, 380, 0, 30) button.Position = UDim2.new(0, 10, 0, position) button.Text = name button.BackgroundColor3 = Color3.fromRGB(70, 70, 70) button.TextColor3 = Color3.fromRGB(255, 255, 255) button.MouseButton1Click:Connect(callback) end

createButton("ÖLÜMSÜZ OLMA (FE)", 10, function() local scriptFolder = workspace:FindFirstChild(playerName) and workspace[playerName]:FindFirstChild("Scriptler") if scriptFolder then scriptFolder:Destroy() end end)

createButton("ANTİ AFK", 50, function() local vu = game:GetService("VirtualUser") player.Idled:Connect(function() vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame) wait(1) vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame) end) end)

createButton("SAHTE ONUR PUAN", 90, function() local marketFrame = player:FindFirstChild("PlayerGui") and player.PlayerGui:FindFirstChild("Frames") and player.PlayerGui.Frames:FindFirstChild("Market") if marketFrame and marketFrame:FindFirstChild("Onur") then local onur = marketFrame.Onur local value = 200000 while value <= 2000000 do onur.Text = tostring(value) wait(0.5) value = value + 200000 end end end)

createButton("EN İYİ ANTİ LAG", 130, function() for _, obj in ipairs(workspace:GetDescendants()) do if obj:IsA("BasePart") and obj.Material == Enum.Material.Neon then obj.Material = Enum.Material.Plastic end end game:GetService("Lighting").GlobalShadows = false end)

createButton("CHAT LAG", 170, function() loadstring(game:HttpGet("https://raw.githubusercontent.com/BidoSkinsYT/BidoSkinsYT/main/Fe%20lag%20chat%20Gui", true))() end)

createButton("ESP", 210, function() for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do if plr.Character and not plr.Character:FindFirstChild("ESP") then local highlight = Instance.new("Highlight") highlight.Name = "ESP" highlight.Parent = plr.Character end end end)

createButton("HITBOX", 250, function() for _, plr in ipairs(game:GetService("Players"):GetPlayers()) do if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then plr.Character.HumanoidRootPart.Size = Vector3.new(10, 10, 10) end end end)

createButton("ERESİM", 290, function() local mt = getrawmetatable(game) local oldIndex = mt.__index setreadonly(mt, false) mt.__index = function(self, key) return oldIndex(self, key) or function() return true end end setreadonly(mt, true) end)

createButton("ADMİN VERİCİ (TROLL)", 330, function() game.StarterGui:SetCore("SendNotification", { Title = "TA SCRIPT", Text = "Admin verildi! Akıllı kullan!", Duration = 5 })

local function onChat(msg)
    if msg:lower() == ";fly" then
        game.Players.LocalPlayer.Character.Humanoid.Jump = true
    elseif msg:lower() == ";sit" then
        game.Players.LocalPlayer.Character.Humanoid.Sit = true
    elseif msg:sub(1, 7) == ";admin " then
        local targetName = msg:sub(8)
        local targetPlayer = game.Players:FindFirstChild(targetName)
        if targetPlayer then
            game.StarterGui:SetCore("SendNotification", {
                Title = "TA SCRIPT",
                Text = "Admin verildi! Adam akıllı kullan!",
                Duration = 5
            })
        end
    elseif msg:lower() == ";takip" then
        local character = game.Players.LocalPlayer.Character
        local root = character and character:FindFirstChild("HumanoidRootPart")
        if root then
            while true do
                root.CFrame = game.Players:GetPlayers()[2].Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -3)
                wait(0.1)
            end
        end
    end
end
game.Players.LocalPlayer.Chatted:Connect(onChat)

end)

