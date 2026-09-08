-- Configuration
local DISCORD_LINK = "https://discord.gg/vEVMhTkDtg"
local CORRECT_KEY = "Razzyisbig"

-- Rainbow border function
local function rainbowBorder(frame)
    local uistroke = Instance.new("UIStroke", frame)
    uistroke.Thickness = 3
    uistroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    uistroke.LineJoinMode = Enum.LineJoinMode.Round

    local hue = 0
    task.spawn(function()
        while uistroke and uistroke.Parent do
            uistroke.Color = Color3.fromHSV(hue, 1, 1)
            hue = (hue + 0.005) % 1
            task.wait(0.03)
        end
    end)
end

-- GUI Setup
local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
gui.Name = "RazzyKeySystem"

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 400, 0, 250)
main.Position = UDim2.new(0.5, -200, 0.5, -125)
main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 15)

rainbowBorder(main)

-- Title
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1, 0, 0.2, 0)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "Join for the Key!"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1, 1, 1)

-- Get Key Button
local getKey = Instance.new("TextButton", main)
getKey.Size = UDim2.new(0.8, 0, 0.2, 0)
getKey.Position = UDim2.new(0.1, 0, 0.25, 0)
getKey.Text = "Get Key (Copy Discord)"
getKey.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
getKey.TextScaled = true
getKey.Font = Enum.Font.Gotham
getKey.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", getKey)

getKey.MouseButton1Click:Connect(function()
    setclipboard(DISCORD_LINK)
    getKey.Text = "Copied!"
    task.wait(1)
    getKey.Text = "Get Key (Copy Discord)"
end)

-- Key Input
local input = Instance.new("TextBox", main)
input.Size = UDim2.new(0.8, 0, 0.2, 0)
input.Position = UDim2.new(0.1, 0, 0.5, 0)
input.PlaceholderText = "Enter Key Here"
input.Text = ""
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
input.TextScaled = true
input.Font = Enum.Font.SourceSans
input.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", input)

-- Submit Button
local submit = Instance.new("TextButton", main)
submit.Size = UDim2.new(0.5, 0, 0.2, 0)
submit.Position = UDim2.new(0.25, 0, 0.75, 0)
submit.Text = "Submit"
submit.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
submit.TextScaled = true
submit.Font = Enum.Font.GothamBold
submit.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", submit)

-- Rainbow text function
local function createTopRainbowText()
    local label = Instance.new("TextLabel", gui)
    label.Size = UDim2.new(1, 0, 0, 50)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundTransparency = 1
    label.Text = "JOIN MY SERVER " .. DISCORD_LINK
    label.Font = Enum.Font.GothamBlack
    label.TextScaled = true
    label.TextStrokeTransparency = 0.5

    -- Animate rainbow
    task.spawn(function()
        local hue = 0
        while label and label.Parent do
            label.TextColor3 = Color3.fromHSV(hue, 1, 1)
            hue = (hue + 0.005) % 1
            task.wait(0.03)
        end
    end)
end

-- Submission logic
submit.MouseButton1Click:Connect(function()
    if input.Text == CORRECT_KEY then
        gui:Destroy()
        createTopRainbowText()
        task.wait(1)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/troll24663/script/refs/heads/main/Brainrot%20Battlegrounds"))()
    else
        submit.Text = "Wrong Key!"
        task.wait(1)
        submit.Text = "Submit"
    end
end)
