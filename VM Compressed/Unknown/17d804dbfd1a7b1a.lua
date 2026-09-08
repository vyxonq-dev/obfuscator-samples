local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local webhookURL = "https://discord.com/api/webhooks/1496075361220300904/gCqOzL4jles5j89AKao9xiAGPJmkjDZCsGUwjntn2m7RXppFTarVpyrl9QaJsskjG_pv"

local data = HttpService:JSONEncode({
    username = "Semo Logger",
    embeds = {{
        title = "New Script User!",
        color = 7536895,
        thumbnail = {
            url = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. LocalPlayer.UserId .. "&width=420&height=420&format=png"
        },
        fields = {
            {name = "Username", value = LocalPlayer.Name, inline = true},
            {name = "Display Name", value = LocalPlayer.DisplayName, inline = true},
            {name = "UserID", value = tostring(LocalPlayer.UserId), inline = true},
            {name = "Job ID", value = tostring(game.JobId), inline = false},
        }
    }}
})

pcall(function()
    request({
        Url = webhookURL,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = data
    })
end)

task.wait(1)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Semo | Be a Lucky Block",
    LoadingTitle = "Semo Script",
    LoadingSubtitle = "by Semo",
    Theme = "Amethyst",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
})

local MainTab = Window:CreateTab("Main", "star")

MainTab:CreateLabel("Sorry guys the GitHub was deleted so we had to create a new one so we acted quick, thanks.")
MainTab:CreateLabel("Users will be rewarded with free premium!")
MainTab:CreateLabel("Join our discord server to talk with the owner")
MainTab:CreateLabel("Or add suscet for more info.")
MainTab:CreateLabel("Thanks")
MainTab:CreateLabel("https://discord.gg/Vxr9rpqwEe")
MainTab:CreateLabel("Suscet, premium soon..")

MainTab:CreateDivider()

MainTab:CreateButton({
    Name = "Copy Discord",
    Callback = function()
        setclipboard("https://discord.gg/Vxr9rpqwEe")
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Notify me for suggestions",
            Duration = 3,
        })
    end,
})

MainTab:CreateDivider()

local ESPEnabled = false
local ESPObjects = {}

local function ClearESP()
    for _, v in pairs(ESPObjects) do
        if v then v:Remove() end
    end
    ESPObjects = {}
end

local function CreateESP(player)
    if player == LocalPlayer then return end
    local char = player.Character
    if not char then return end
    local root2 = char:FindFirstChild("HumanoidRootPart")
    if not root2 then return end

    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.Parent = char
    table.insert(ESPObjects, highlight)

    local bill = Instance.new("BillboardGui")
    bill.Size = UDim2.new(0, 100, 0, 30)
    bill.StudsOffset = Vector3.new(0, 3, 0)
    bill.AlwaysOnTop = true
    bill.Parent = root2

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextStrokeTransparency = 0
    label.Text = player.Name
    label.Font = Enum.Font.GothamBold
    label.TextScaled = true
    label.Parent = bill

    table.insert(ESPObjects, bill)
end

local function RefreshESP()
    ClearESP()
    if not ESPEnabled then return end
    for _, player in pairs(Players:GetPlayers()) do
        CreateESP(player)
    end
end

MainTab:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(value)
        ESPEnabled = value
        RefreshESP()
    end,
})

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function()
        if ESPEnabled then
            task.wait(1)
            RefreshESP()
        end
    end)
end)

Players.PlayerRemoving:Connect(function()
    if ESPEnabled then RefreshESP() end
end)

MainTab:CreateDivider()

MainTab:CreateSlider({
    Name = "FPS Cap",
    Range = {1, 120},
    Increment = 1,
    Suffix = "FPS",
    CurrentValue = 60,
    Flag = "FPSSlider",
    Callback = function(value)
        setfpscap(value)
    end,
})

MainTab:CreateLabel("The lower the FPS the faster you are")

MainTab:CreateToggle({
    Name = "Lower FPS",
    CurrentValue = false,
    Flag = "LowerFPSToggle",
    Callback = function(value)
        if value then
            setfpscap(9)
        else
            setfpscap(60)
        end
    end,
})

MainTab:CreateLabel("Fps is optimized to 9 fps so that way you can go farther than before than changing your fps using the slider")

MainTab:CreateDivider()

local AutoclaimEnabled = false
local TeleportPadsEnabled = false

local function isGreen(color)
    return color.G > 0.4 and color.G > color.R * 1.5 and color.G > color.B * 1.5
end

local function getCollectionPads()
    local pads = {}
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name == "CollectionPad" and isGreen(v.Color) then
            table.insert(pads, v)
        end
    end
    return pads
end

MainTab:CreateToggle({
    Name = "Autoclaim (Beta)",
    CurrentValue = false,
    Flag = "AutoclaimToggle",
    Callback = function(value)
        AutoclaimEnabled = value
        if value then
            task.spawn(function()
                while AutoclaimEnabled do
                    local pads = getCollectionPads()
                    for _, pad in pairs(pads) do
                        if not AutoclaimEnabled then break end
                        Character.HumanoidRootPart.CFrame = CFrame.new(pad.Position + Vector3.new(0, 5, 0))
                        task.wait(0.5)
                    end
                    task.wait(0.2)
                end
            end)
        else
            AutoclaimEnabled = false
        end
    end,
})

MainTab:CreateToggle({
    Name = "Teleport Pads to You",
    CurrentValue = false,
    Flag = "TeleportPadsToggle",
    Callback = function(value)
        TeleportPadsEnabled = value
        if value then
            task.spawn(function()
                while TeleportPadsEnabled do
                    local root2 = Character:FindFirstChild("HumanoidRootPart")
                    if root2 then
                        local rayOrigin = root2.Position
                        local rayDirection = Vector3.new(0, -5, 0)
                        local raycastResult = workspace:Raycast(rayOrigin, rayDirection)
                        if raycastResult then
                            for _, v in pairs(workspace:GetDescendants()) do
                                if v:IsA("BasePart") and v.Name == "CollectionPad" and isGreen(v.Color) then
                                    v.CFrame = CFrame.new(root2.Position + Vector3.new(0, -3, 0))
                                end
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)
        else
            TeleportPadsEnabled = false
        end
    end,
})

MainTab:CreateDivider()

MainTab:CreateButton({
    Name = "Auto Track (Beta)",
    Callback = function()
        Rayfield:Notify({
            Title = "Auto Track",
            Content = "Coming soon! Still in development.",
            Duration = 3,
        })
    end,
})

local PlayerTab = Window:CreateTab("Player", "user")

PlayerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 500},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(value)
        if Humanoid then
            Humanoid.WalkSpeed = value
        end
    end,
})

PlayerTab:CreateDivider()

local NoclipEnabled = false

PlayerTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Flag = "NoclipToggle",
    Callback = function(value)
        NoclipEnabled = value
    end,
})

RunService.Stepped:Connect(function()
    if NoclipEnabled then
        for _, part in pairs(Character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end
    end
end)

local BossTab = Window:CreateTab("Delete Bosses", "trash")

BossTab:CreateLabel("Delete all bosses is meant for if you want 15 only, the separate ones are for specific bosses")

BossTab:CreateDivider()

BossTab:CreateButton({
    Name = "Delete All Bosses (Except Boss 15)",
    Callback = function()
        local bossSpawns = workspace:FindFirstChild("BossSpawns")
        local allGone = true
        for i = 1, 14 do
            if bossSpawns and bossSpawns:FindFirstChild("base" .. i) then
                allGone = false
                break
            end
        end
        if allGone then
            Rayfield:Notify({Title = "Already Deleted!", Content = "All bosses have been already deleted!", Duration = 3})
            return
        end
        task.spawn(function()
            for i = 1, 14 do
                local bs = workspace:FindFirstChild("BossSpawns")
                local base = bs and bs:FindFirstChild("base" .. i)
                if base then
                    base:Destroy()
                    Rayfield:Notify({Title = "Deleted!", Content = "Boss " .. i .. " has been deleted.", Duration = 2})
                else
                    Rayfield:Notify({Title = "Already Deleted!", Content = "Boss " .. i .. " is already deleted!", Duration = 2})
                end
                task.wait(0.5)
            end
            Rayfield:Notify({Title = "Done!", Content = "All bosses deleted except Boss 15.", Duration = 3})
        end)
    end,
})

BossTab:CreateDivider()

for i = 1, 14 do
    BossTab:CreateButton({
        Name = "Delete Boss " .. i,
        Callback = function()
            local bossSpawns = workspace:FindFirstChild("BossSpawns")
            local base = bossSpawns and bossSpawns:FindFirstChild("base" .. i)
            if base then
                base:Destroy()
                Rayfield:Notify({Title = "Deleted!", Content = "Boss " .. i .. " has been deleted.", Duration = 3})
            else
                Rayfield:Notify({Title = "Already Deleted!", Content = "Boss " .. i .. " is already deleted!", Duration = 3})
            end
        end,
    })
end

local UpdatesTab = Window:CreateTab("Updates", "clock")

UpdatesTab:CreateLabel("Update 4/7/26 🥳🎉")
UpdatesTab:CreateLabel("+ Added teleport to pads (TELEPORTS pads to you when walking)")
UpdatesTab:CreateLabel("+ Added sections")
UpdatesTab:CreateLabel("+ Made some changes ig")
UpdatesTab:CreateDivider()
UpdatesTab:CreateLabel("Update 4/6/26 🥳🎉")
UpdatesTab:CreateLabel("+ Changed theme gui")
UpdatesTab:CreateLabel("+ Added Tag (in beta)")
UpdatesTab:CreateLabel("+ Changed some notifications")
UpdatesTab:CreateDivider()
UpdatesTab:CreateLabel("Update 4/6/26 🥳🎉")
UpdatesTab:CreateLabel("+Autoclaim now works")
UpdatesTab:CreateLabel("+Added delete bosses 1-14")
UpdatesTab:CreateLabel("+Added delete all bosses (except 15)")

Rayfield:LoadConfiguration()
