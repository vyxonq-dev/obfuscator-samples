local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local LocalPlayer = Players.LocalPlayer

-- Knit paths
local KnitPath = ReplicatedStorage:WaitForChild("Packages")
    :WaitForChild("_Index")
    :WaitForChild("sleitnick_knit@1.7.0")
    :WaitForChild("knit")
    :WaitForChild("Services")

local StartRunRF = KnitPath:WaitForChild("RunningService"):WaitForChild("RF"):WaitForChild("StartRun")
local ReloadCharRF = KnitPath:WaitForChild("PlayerService"):WaitForChild("RF"):WaitForChild("ReloadCharacter")
local OpenLuckyBlockRF = KnitPath:WaitForChild("RunningService"):WaitForChild("RF"):WaitForChild("OpenLuckyBlock")

-- Target part for character pivot during farm
local targetPath = workspace:WaitForChild("Plots")
    :WaitForChild("3")
    :WaitForChild("3")
    :WaitForChild("PlotSurface")
    :WaitForChild("Part")

local Window = WindUI:CreateWindow({
    Title = "BALBv1",
    Icon = "layout-dashboard",
    Author = "Dwine",
    Folder = "BALBv1",
    Size = UDim2.fromOffset(580, 460),
    ToggleKey = Enum.KeyCode.RightShift,
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
})

Window:EditOpenButton({
    Title = "Open BALBv1",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"),
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

Window:Tag({
    Title = "v1",
    Icon = "github",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 4,
})

-- ==================== AUTO FARM TAB ====================
local Tab = Window:Tab({
    Title = "Auto Farm",
    Icon = "zap",
})

local selectedBlock = "base14"

Tab:Dropdown({
    Title = "Target Block",
    Desc = "Select which lucky block to open",
    Values = { "base14", "base15" },
    Value = { "base14" },
    Multi = false,
    AllowNone = false,
    Callback = function(option)
        if type(option) == "table" then
            selectedBlock = option[1] or "base14"
        else
            selectedBlock = option or "base14"
        end
    end
})

Tab:Divider()

local autoFarmActive = false

Tab:Toggle({
    Title = "Auto Farm",
    Desc = "Opens lucky blocks and pivots character to target",
    Icon = "zap",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        autoFarmActive = state
        if state then
            task.spawn(function()
                pcall(function() StartRunRF:InvokeServer() end)
                pcall(function() ReloadCharRF:InvokeServer() end)
            end)

            task.spawn(function()
                while autoFarmActive do
                    task.wait()

                    task.spawn(function()
                        pcall(function()
                            OpenLuckyBlockRF:InvokeServer(selectedBlock)
                        end)
                    end)

                    pcall(function()
                        local character = LocalPlayer.Character
                        if character and targetPath then
                            character:PivotTo(targetPath.CFrame + Vector3.new(0, 10, 0))
                        end
                    end)
                end
            end)

            WindUI:Notify({
                Title = "Auto Farm",
                Content = "Farm started on " .. selectedBlock,
                Duration = 3,
                Icon = "zap",
            })
        else
            WindUI:Notify({
                Title = "Auto Farm",
                Content = "Farm stopped.",
                Duration = 2,
                Icon = "square",
            })
        end
    end
})

Tab:Divider()

-- ==================== PLAYER TAB ====================
local Tab = Window:Tab({
    Title = "Player",
    Icon = "user",
})

local infJumpConn
Tab:Toggle({
    Title = "Inf Jump",
    Desc = "Jump infinitely in the air",
    Icon = "chevrons-up",
    Type = "Checkbox",
    Value = false,
    Callback = function(state)
        if state then
            infJumpConn = UserInputService.JumpRequest:Connect(function()
                local char = LocalPlayer.Character
                if char then
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        hum:ChangeState(Enum.HumanoidStateType.Jumping)
                    end
                end
            end)
        else
            if infJumpConn then
                infJumpConn:Disconnect()
                infJumpConn = nil
            end
        end
    end
})

local currentSpeed = 16
Tab:Slider({
    Title = "Walk Speed",
    Desc = "Set your walk speed",
    Step = 1,
    Value = {
        Min = 16,
        Max = 250,
        Default = 16,
    },
    Callback = function(value)
        currentSpeed = value
        local char = LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                hum.WalkSpeed = value
            end
        end
    end
})

LocalPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    hum.WalkSpeed = currentSpeed
end)

Tab:Divider()

-- ==================== MISC TAB ====================
local Tab = Window:Tab({
    Title = "Misc",
    Icon = "settings",
})

-- Rejoin Server
Tab:Button({
    Title = "Rejoin Server",
    Desc = "Rejoins the current game server",
    Icon = "refresh-cw",
    Callback = function()
        WindUI:Notify({
            Title = "Rejoining",
            Content = "Rejoining server...",
            Duration = 2,
            Icon = "refresh-cw",
        })
        task.wait(1)
        pcall(function()
            TeleportService:TeleportToPlaceInstance(
                game.PlaceId,
                game.JobId,
                LocalPlayer
            )
        end)
    end
})

Tab:Divider()

-- Find Low Server
local isFindingServer = false

Tab:Button({
    Title = "Find Low Server",
    Desc = "Finds and joins the server with the least players",
    Icon = "wifi",
    Callback = function()
        if isFindingServer then
            WindUI:Notify({
                Title = "Find Low Server",
                Content = "Already searching for a server...",
                Duration = 2,
                Icon = "alert-triangle",
            })
            return
        end

        isFindingServer = true
        WindUI:Notify({
            Title = "Find Low Server",
            Content = "Searching for lowest population server...",
            Duration = 3,
            Icon = "wifi",
        })

        task.spawn(function()
            pcall(function()
                local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
                local lowestServer = nil
                local lowestCount = math.huge
                local cursor = ""

                repeat
                    local fullUrl = url
                    if cursor ~= "" then
                        fullUrl = url .. "&cursor=" .. cursor
                    end

                    local success, response = pcall(function()
                        return HttpService:JSONDecode(
                            game:HttpGet(fullUrl)
                        )
                    end)

                    if not success or not response or not response.data then
                        break
                    end

                    for _, server in ipairs(response.data) do
                        if server.id ~= game.JobId then
                            local playerCount = server.playing or 0
                            if playerCount < lowestCount then
                                lowestCount = playerCount
                                lowestServer = server
                            end
                        end
                    end

                    cursor = response.nextPageCursor or ""
                until cursor == "" or cursor == nil

                if lowestServer then
                    WindUI:Notify({
                        Title = "Server Found",
                        Content = "Joining server with " .. lowestCount .. " player(s)...",
                        Duration = 3,
                        Icon = "check",
                    })
                    task.wait(1.5)
                    TeleportService:TeleportToPlaceInstance(
                        game.PlaceId,
                        lowestServer.id,
                        LocalPlayer
                    )
                else
                    WindUI:Notify({
                        Title = "No Server Found",
                        Content = "Could not find a lower population server.",
                        Duration = 3,
                        Icon = "alert-triangle",
                    })
                end
            end)

            isFindingServer = false
        end)
    end
})

Tab:Divider()

Tab:Section({
    Title = "About",
    Box = false,
    Opened = true,
})

Tab:Paragraph({
    Title = "BALBv1",
    Desc = "Auto Farm | Player | Misc\nMade by Dwine.",
})
