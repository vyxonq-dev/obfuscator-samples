-- Esp + aimbot by Ghxst
if game.PlaceId == 3678761576 then
    local CurrentVersion = "V2 Sim Game"
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

    local GUI = Mercury:Create{
        Name = CurrentVersion,
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Dark,
        Link = "https://github.com/deeeity/mercury-lib"
    }

    local AimbotEspTab = GUI:Tab{Name = "Aimbot+esp"}
    local isAimbotEsp = false
    local teamCheckEnabled = false
    local cleanup = nil

    AimbotEspTab:Toggle{
        Name = "Team Check",
        StartingState = false,
        Description = "Only show enemies, not teammates.",
        Callback = function(state)
            teamCheckEnabled = state
        end
    }

    AimbotEspTab:Toggle{
        Name = "Aimbot + ESP",
        StartingState = false,
        Description = "Turns on Aimbot and ESP (Dot + Box).",
        Callback = function(state)
            isAimbotEsp = state

            if state then
                cleanup = (function()
                    local Players = game:GetService("Players")
                    local UserInputService = game:GetService("UserInputService")
                    local StarterGui = game:GetService("StarterGui")
                    local CoreGui = game:GetService("CoreGui")
                    local RunService = game:GetService("RunService")

                    local LocalPlayer = Players.LocalPlayer
                    local Camera = workspace.CurrentCamera

                    local ESPGui = Instance.new("ScreenGui", CoreGui)
                    ESPGui.Name = "ESP_Aimbot_GUI"
                    local Folder = Instance.new("Folder", CoreGui)
                    Folder.Name = "ESP_Dots"

                    local ESPEnabled = true
                    local AimbotEnabled = true
                    local AimbotFOV = 150
                    local DotSize = 5
                    local ActiveDots = {}
                    local Boxes = {}

                    local espConnection, aimConnection

                    local function CreateBox(player)
                        local box = Drawing.new("Square")
                        box.Thickness = 1
                        box.Color = Color3.fromRGB(255, 0, 0)
                        box.Filled = false
                        box.Visible = false
                        Boxes[player] = box
                    end

                    local function RemoveBox(player)
                        if Boxes[player] then
                            Boxes[player]:Remove()
                            Boxes[player] = nil
                        end
                    end

                    local function UpdateBox(player, character)
                        local box = Boxes[player]
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if not box or not hrp then return end

                        local pos, onscreen = Camera:WorldToViewportPoint(hrp.Position)
                        if onscreen then
                            local size = Vector2.new(20, 40) -- Smaller box size
                            local screenPos = Vector2.new(pos.X - size.X/2, pos.Y - size.Y/2)
                            box.Position = screenPos
                            box.Size = size
                            local isSameTeam = player.Team == LocalPlayer.Team
                            box.Visible = ESPEnabled and (not teamCheckEnabled or not isSameTeam)
                        else
                            box.Visible = false
                        end
                    end

                    local function UpdateDot(player, data)
                        if not data or not data.Dot or not data.Head then return end
                        local isSameTeam = player.Team == LocalPlayer.Team
                        data.Dot.Enabled = ESPEnabled and (not teamCheckEnabled or not isSameTeam)
                        data.Dot.Size = UDim2.new(0, DotSize, 0, DotSize)
                        if data.Head:IsA("BasePart") then
                            data.Dot.Adornee = data.Head
                        end
                    end

                    local function CreateDot(player)
                        if player == LocalPlayer then return end
                        CreateBox(player)

                        local function Setup(character)
                            local head = character:FindFirstChild("Head")
                            if not head then return end

                            local dot = Instance.new("BillboardGui", Folder)
                            dot.Name = "ESPDot_" .. player.UserId
                            dot.Adornee = head
                            dot.Size = UDim2.new(0, DotSize, 0, DotSize)
                            dot.AlwaysOnTop = true
                            dot.LightInfluence = 0

                            local frame = Instance.new("Frame", dot)
                            frame.Size = UDim2.new(1, 0, 1, 0)
                            frame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
                            frame.BackgroundTransparency = 0.2
                            frame.BorderSizePixel = 0

                            ActiveDots[player] = {Dot = dot, Head = head, Character = character}
                            UpdateDot(player, ActiveDots[player])
                        end

                        if player.Character then
                            Setup(player.Character)
                        end

                        player.CharacterAdded:Connect(function(char)
                            task.wait(1)
                            if ActiveDots[player] and ActiveDots[player].Dot then
                                ActiveDots[player].Dot:Destroy()
                            end
                            ActiveDots[player] = nil
                            Setup(char)
                        end)

                        player.CharacterRemoving:Connect(function(char)
                            if ActiveDots[player] and ActiveDots[player].Character == char then
                                if ActiveDots[player].Dot then ActiveDots[player].Dot:Destroy() end
                                ActiveDots[player] = nil
                            end
                        end)
                    end

                    for _, p in ipairs(Players:GetPlayers()) do CreateDot(p) end
                    Players.PlayerAdded:Connect(CreateDot)
                    Players.PlayerRemoving:Connect(function(p)
                        if ActiveDots[p] and ActiveDots[p].Dot then
                            ActiveDots[p].Dot:Destroy()
                        end
                        ActiveDots[p] = nil
                        RemoveBox(p)
                    end)

                    espConnection = RunService.RenderStepped:Connect(function()
                        for p, data in pairs(ActiveDots) do
                            if not data.Head or not data.Head:IsDescendantOf(workspace) then
                                if data.Dot then data.Dot:Destroy() end
                                ActiveDots[p] = nil
                                RemoveBox(p)
                            else
                                UpdateDot(p, data)
                                UpdateBox(p, data.Character)
                            end
                        end
                    end)

                    local function GetClosestTarget()
                        local closest, shortest = nil, AimbotFOV
                        for player, data in pairs(ActiveDots) do
                            local head = data.Head
                            if head then
                                local isSameTeam = player.Team == LocalPlayer.Team
                                if not teamCheckEnabled or not isSameTeam then
                                    local screen, onScreen = Camera:WorldToViewportPoint(head.Position)
                                    if onScreen then
                                        local dist = (Vector2.new(screen.X, screen.Y) - UserInputService:GetMouseLocation()).Magnitude
                                        if dist < shortest then
                                            closest = head
                                            shortest = dist
                                        end
                                    end
                                end
                            end
                        end
                        return closest
                    end

                    aimConnection = RunService.RenderStepped:Connect(function()
                        if AimbotEnabled and UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
                            local target = GetClosestTarget()
                            if target then
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
                            end
                        end
                    end)

                    StarterGui:SetCore("SendNotification", {
                        Title = "ESP + Aimbot",
                        Text = "Box + Dot ESP Enabled.",
                        Duration = 4
                    })

                    return function()
                        ESPGui:Destroy()
                        Folder:Destroy()
                        for _, box in pairs(Boxes) do box:Remove() end
                        Boxes = {}
                        if espConnection then espConnection:Disconnect() end
                        if aimConnection then aimConnection:Disconnect() end
                        ActiveDots = {}
                        StarterGui:SetCore("SendNotification", {
                            Title = "ESP + Aimbot",
                            Text = "Disabled.",
                            Duration = 4
                        })
                    end
                end)()
            elseif cleanup then
                cleanup()
                cleanup = nil
            end
        end
    }
end
