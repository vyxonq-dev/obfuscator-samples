-- S.F.S.S - Stage Finder & Skipper Script

-- By Pur6leTheTroly*

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({

    Name = "S.F.S.S",

    LoadingTitle = "Stage Finder and Skipper Script",

    LoadingSubtitle = "By Pur6leTheTroly*",

    ConfigurationSaving = {

        Enabled = false,

        FolderName = nil,

        FileName = "SFSS"

    }

})

local SetUpTab = Window:CreateTab("SetUp", 4483362458)

local StageSkipperTab = Window:CreateTab("Stage Skipper", 4483362458)

-- Variables

local selected_container = nil

local current_stage = nil

local target_stage = nil

local selected_speed = 1000  -- default: Slow

local running = false

local selection_enabled = false

local mouse = game.Players.LocalPlayer:GetMouse()

local highlights = {}

-- Clear old highlights

local function clearHighlights()

    for _, hl in ipairs(highlights) do

        if hl and hl.Parent then hl:Destroy() end

    end

    highlights = {}

end

-- Apply chams to all numbered stages

local function applyChams(container)

    clearHighlights()

    for _, child in ipairs(container:GetChildren()) do

        if child:IsA("BasePart") and tonumber(child.Name) then

            local hl = Instance.new("Highlight")

            hl.Parent = child

            hl.FillTransparency = 0.5

            hl.FillColor = Color3.fromRGB(0, 255, 0)

            hl.OutlineColor = Color3.fromRGB(255, 255, 0)

            hl.OutlineTransparency = 0

            table.insert(highlights, hl)

        end

    end

end

-- Find last stage number

local function findLastStage(container)

    local max = 0

    for _, child in ipairs(container:GetChildren()) do

        local num = tonumber(child.Name)

        if num and num > max then max = num end

    end

    return max

end

-- Mouse click detection for selecting container

mouse.Button1Down:Connect(function()

    if selection_enabled and mouse.Target then

        local target = mouse.Target

        if target:IsA("BasePart") and tonumber(target.Name) and target.Parent then

            selected_container = target.Parent

            applyChams(selected_container)

            selection_enabled = false

            Rayfield:Notify({

                Title = "Success",

                Content = "Container selected & all stages highlighted!",

                Duration = 5

            })

        end

    end

end)

------------------------------------------------------------------------------------------------

-- SetUp Tab

------------------------------------------------------------------------------------------------

SetUpTab:CreateButton({

    Name = "Click On The Stage Part",

    Callback = function()

        selection_enabled = true

        Rayfield:Notify({

            Title = "Selection Mode ON",

            Content = "Click any stage part to select the container",

            Duration = 6

        })

    end,

})

SetUpTab:CreateInput({

    Name = "Put Exact Stage (Your Current Stage)",

    PlaceholderText = "Example: 21",

    NumbersOnly = true,

    Callback = function(text)

        current_stage = tonumber(text)

        Rayfield:Notify({Title = "Current Stage Set", Content = "Current stage: " .. text})

    end

})

SetUpTab:CreateInput({

    Name = "Cham Specific Stage (Optional)",

    PlaceholderText = "Enter stage number to highlight",

    NumbersOnly = true,

    Callback = function(text)

        local num = tonumber(text)

        if selected_container and num then

            clearHighlights()

            local part = selected_container:FindFirstChild(tostring(num))

            if part then

                local hl = Instance.new("Highlight")

                hl.Parent = part

                hl.FillColor = Color3.fromRGB(255, 0, 255)

                hl.OutlineColor = Color3.fromRGB(255, 255, 255)

                hl.FillTransparency = 0.3

                table.insert(highlights, hl)

                Rayfield:Notify({Title = "Highlighted", Content = "Stage " .. num .. " is now glowing!"})

            end

        end

    end

})

------------------------------------------------------------------------------------------------

-- Stage Skipper Tab

------------------------------------------------------------------------------------------------

StageSkipperTab:CreateInput({

    Name = "Pick What Stage (Target Stage)",

    PlaceholderText = "Example: 187",

    NumbersOnly = true,

    Callback = function(text)

        target_stage = tonumber(text)

        Rayfield:Notify({Title = "Target Set", Content = "Will skip to stage " .. text})

    end

})

StageSkipperTab:CreateButton({

    Name = "Slow (Anti-Cheat Safe)",

    Callback = function() selected_speed = 1000 end

})

StageSkipperTab:CreateButton({

    Name = "Medium (Not Recommended)",

    Callback = function() selected_speed = 350 end

})

StageSkipperTab:CreateButton({

    Name = "Fast (Recommended)",

    Callback = function() selected_speed = 27 end

})

StageSkipperTab:CreateButton({

    Name = "Ultra Fast (Instant)",

    Callback = function() selected_speed = 0 end

})

StageSkipperTab:CreateButton({

    Name = "Notify Last Stage Number",

    Callback = function()

        if not selected_container then

            Rayfield:Notify({Title = "Error", Content = "No container selected yet!"})

            return

        end

        local last = findLastStage(selected_container)

        if last > 0 then

            Rayfield:Notify({

                Title = "Last Stage Detected",

                Content = "Last Stage Is " .. last,

                Duration = 8

            })

        else

            Rayfield:Notify({Title = "Not Found", Content = "No numbered stages in this container"})

        end

    end

})

StageSkipperTab:CreateButton({

    Name = "START",

    Callback = function()

        if running then return end

        if not selected_container or not current_stage or not target_stage or current_stage >= target_stage then

            Rayfield:Notify({Title = "Error", Content = "Invalid setup! Check container & stages"})

            return

        end

        running = true

        local player = game.Players.LocalPlayer

        local char = player.Character or player.CharacterAdded:Wait()

        local hrp = char:WaitForChild("HumanoidRootPart")

        Rayfield:Notify({Title = "Skipping Stages...", Content = "From " .. current_stage .. " → " .. target_stage})

        if selected_speed == 0 then

            -- Ultra Fast = Instant

            local part = selected_container:FindFirstChild(tostring(target_stage))

            if part then

                hrp.CFrame = part.CFrame * CFrame.new(0, 3, 0)

            end

        else

            -- Normal speeds

            for stage = current_stage + 1, target_stage do

                if not running then break end

                local part = selected_container:FindFirstChild(tostring(stage))

                if part then

                    hrp.CFrame = part.CFrame * CFrame.new(0, 3, 0)

                end

                task.wait(selected_speed / 1000)

            end

        end

        running = false

        Rayfield:Notify({Title = "Done!", Content = "Reached stage " .. target_stage})

    end

})

StageSkipperTab:CreateButton({

    Name = "STOP",

    Callback = function()

        running = false

        Rayfield:Notify({Title = "Stopped", Content = "Stage skipping cancelled"})

    end

})

Rayfield:Notify({

    Title = "S.F.S.S Loaded!",

    Content = "Script by Pur6leTheTroly* - Enjoy skipping stages!",

    Duration = 8

})