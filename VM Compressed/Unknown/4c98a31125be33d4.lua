-- Check Game
if game.PlaceId == 2533391464 then
    local CurrentVersion = "V1 Sim Game"

    -- Call The Library
    local Mercury = loadstring(game:HttpGet("https://raw.githubusercontent.com/deeeity/mercury-lib/master/src.lua"))()

    -- Main Frame
    local GUI = Mercury:Create{
        Name = CurrentVersion,
        Size = UDim2.fromOffset(600, 400),
        Theme = Mercury.Themes.Dark,
        Link = "https://github.com/deeeity/mercury-lib"
    }

    -- Local Variables
    local isAutoSnow = false
    local isCollectingEggs = false
    local isCollectingCanes = false

    -- Auto Snow Tab
    local AutoSnow = GUI:Tab{
        Name = "Auto Snow"
    }

    AutoSnow:Toggle{
        Name = "Give Snow",
        StartingState = false,
        Description = "Instantly collects snow",
        Callback = function(state) 
            isAutoSnow = state
            if isAutoSnow then
                task.spawn(function()
                    while isAutoSnow do
                        local snow = workspace:FindFirstChild("gameSnow")
                        if snow then
                            local snowObj = snow:FindFirstChild("GAME_SNOW_COLLECTED")
                            if snowObj then
                                game:GetService("ReplicatedStorage")
                                    :WaitForChild("Signals")
                                    :WaitForChild("collectSnow")
                                    :FireServer(snowObj)
                            end
                        end
                        task.wait(0.2)
                    end
                end)
            end
        end
    }

    -- Collect Eggs Tab
    local CollectEggsTab = GUI:Tab{
        Name = "Collect Eggs"
    }

    CollectEggsTab:Toggle{
        Name = "Collect Eggs",
        StartingState = false,
        Description = "Collects all eggs for you",
        Callback = function(state)
            isCollectingEggs = state
            if isCollectingEggs then
                task.spawn(function()
                    local Players = game:GetService("Players")
                    local player = Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local hrp = character:WaitForChild("HumanoidRootPart")

                    local collected = 0
                    local attempted = 0

                    task.wait(2)

                    local eggs = {}
                    for _, obj in ipairs(workspace:GetDescendants()) do
                        if obj.Name == "eggLocation" and obj:IsA("BasePart") then
                            local prompt = obj:FindFirstChildWhichIsA("ProximityPrompt", true)
                            if prompt then
                                table.insert(eggs, {part = obj, prompt = prompt})
                            end
                        end
                    end

                    for _, eggData in ipairs(eggs) do
                        local part = eggData.part
                        local prompt = eggData.prompt

                        attempted += 1
                        hrp.CFrame = part.CFrame + Vector3.new(0, 3, 0)
                        task.wait(0.3)

                        for i = 1, 3 do
                            fireproximityprompt(prompt)
                            task.wait(0.3)
                            if not prompt:IsDescendantOf(game) then
                                collected += 1
                                break
                            end
                        end
                    end

                    print("✅ Attempted: " .. attempted)
                    print("🥚 Successfully collected: " .. collected)
                end)
            end
        end
    }

    -- Candy Canes Tab
    local CandyCanesTab = GUI:Tab{
        Name = "Candy Canes"
    }

    CandyCanesTab:Toggle{
        Name = "Collect Candy Canes",
        StartingState = false,
        Description = "Teleports to and collects all candy canes",
        Callback = function(state)
            isCollectingCanes = state
            if isCollectingCanes then
                task.spawn(function()
                    local Players = game:GetService("Players")
                    local player = Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    local hrp = character:WaitForChild("HumanoidRootPart")

                    task.wait(2) -- Wait for game to load

                    local caneFolder = workspace:WaitForChild("gameCandyCanes")
                    local total = 0

                    for _, group in ipairs(caneFolder:GetChildren()) do
                        if not isCollectingCanes then break end
                        local cane = group:FindFirstChild("cane")
                        if cane and cane:IsA("BasePart") then
                            hrp.CFrame = cane.CFrame + Vector3.new(0, 5, 0)
                            total += 1
                            task.wait(0.4)
                        end
                    end

                    print("🍬 Teleported to " .. total .. " candy canes.")
                end)
            end
        end
    }
end
