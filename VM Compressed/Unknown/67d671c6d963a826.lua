-- [DOORS FLOOR 2 AMBIENT] --
-- note: this script is recoded. So if theres some bugs, please report me on Discord Server.

-- [KEY SAVE SYSTEM] --

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local SAVE_FOLDER = "MyKeySystem"
local SAVE_FILE = SAVE_FOLDER .. "/" .. player.UserId .. ".txt"

local function hasValidKey()
    if isfolder and isfile then
        if isfolder(SAVE_FOLDER) and isfile(SAVE_FILE) then
            return readfile(SAVE_FILE) == "true"
        end
    end
    return false
end

local function saveValidKey()
    if makefolder and writefile then
        if not isfolder(SAVE_FOLDER) then
            makefolder(SAVE_FOLDER)
        end
        writefile(SAVE_FILE, "true")
    end
end

-- Eğer key daha önce girildiyse direkt çalıştır
if hasValidKey() then
    loadstring(game:HttpGet(
        "https://gist.githubusercontent.com/Raddy-edits/c398ea860b422f201bf98ab2822d98a1/raw/3d53773ac81e0c902e2afa9d858db21b1c66ca0a/Floor-2-Ambient"
    ))()
    return
end


-- [Main Script] 


local CORRECT_KEY = "i am so sprunki"
local DISCORD_LINK = "https://discord.com/invite/fGbxFnhp"

-- [GUI]
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystemGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 280, 0, 150)
frame.Position = UDim2.new(0.5, -140, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BorderSizePixel = 0

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- [Title]
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "Key System"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)

-- [TextBox]
local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(1, -20, 0, 35)
textbox.Position = UDim2.new(0, 10, 0, 45)
textbox.PlaceholderText = "Enter Key"
textbox.Text = ""
textbox.Font = Enum.Font.Gotham
textbox.TextSize = 14
textbox.TextColor3 = Color3.new(1,1,1)
textbox.BackgroundColor3 = Color3.fromRGB(25,25,25)
textbox.ClearTextOnFocus = false

Instance.new("UICorner", textbox).CornerRadius = UDim.new(0, 8)

-- [Submit Button]
local submit = Instance.new("TextButton", frame)
submit.Size = UDim2.new(0.6, -15, 0, 35)
submit.Position = UDim2.new(0, 10, 0, 95)
submit.Text = "Submit"
submit.Font = Enum.Font.GothamBold
submit.TextSize = 14
submit.TextColor3 = Color3.new(1,1,1)
submit.BackgroundColor3 = Color3.fromRGB(0, 200, 0)

Instance.new("UICorner", submit).CornerRadius = UDim.new(0, 8)

-- [Discord Button]
local discord = Instance.new("TextButton", frame)
discord.Size = UDim2.new(0.4, -15, 0, 35)
discord.Position = UDim2.new(0.6, 5, 0, 95)
discord.Text = "Discord Server"
discord.Font = Enum.Font.GothamBold
discord.TextSize = 13
discord.TextColor3 = Color3.new(1,1,1)
discord.BackgroundColor3 = Color3.fromRGB(140, 0, 255)

Instance.new("UICorner", discord).CornerRadius = UDim.new(0, 8)

-- [BUTTON FUNCTIONS] --

-- [Discord Link Copy]
discord.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(DISCORD_LINK)
    end
    discord.Text = "Copied!! >:3"
    task.wait(1)
    discord.Text = "Discord Server"
end)

-- [Key Control]
submit.MouseButton1Click:Connect(function()
    if textbox.Text == CORRECT_KEY then
        saveValidKey()
        gui:Destroy()
        loadstring(game:HttpGet(
            "https://gist.githubusercontent.com/Raddy-edits/c398ea860b422f201bf98ab2822d98a1/raw/3d53773ac81e0c902e2afa9d858db21b1c66ca0a/Floor-2-Ambient"))()
    else
        submit.Text = "Wrong Key :("
        submit.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(1)
        submit.Text = "Submit!1!"
        submit.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
    end
end)