

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaXExecutor"

local openBtn = Instance.new("TextButton", gui)
openBtn.Size = UDim2.new(0, 120, 0, 35)
openBtn.Position = UDim2.new(0, 20, 0, 20)
openBtn.Text = "Open DeltaX"
openBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
openBtn.TextColor3 = Color3.new(1, 1, 1)
openBtn.Font = Enum.Font.SourceSansBold
openBtn.TextSize = 18


local page1 = Instance.new("Frame", gui)
page1.Size = UDim2.new(0, 550, 0, 450)
page1.Position = UDim2.new(0.5, -275, 0.5, -225)
page1.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
page1.Visible = false

local page2 = Instance.new("Frame", gui)
page2.Size = page1.Size
page2.Position = page1.Position
page2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
page2.Visible = false


local closeBtn = Instance.new("TextButton", page1)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 0)
closeBtn.Text = "X"
closeBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeBtn.TextColor3 = Color3.new(1, 1, 1)


local toPage2 = Instance.new("TextButton", page1)
toPage2.Size = UDim2.new(0, 60, 0, 30)
toPage2.Position = UDim2.new(0, 5, 0, 0)
toPage2.Text = "Page 2"
toPage2.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toPage2.TextColor3 = Color3.new(1, 1, 1)

local toPage1 = Instance.new("TextButton", page2)
toPage1.Size = toPage2.Size
toPage1.Position = toPage2.Position
toPage1.Text = "Page 1"
toPage1.BackgroundColor3 = toPage2.BackgroundColor3
toPage1.TextColor3 = toPage2.TextColor3

-- Input + Output
local input = Instance.new("TextBox", page1)
input.MultiLine = true
input.ClearTextOnFocus = false
input.Size = UDim2.new(1, -20, 0, 150)
input.Position = UDim2.new(0, 10, 0, 40)
input.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
input.TextColor3 = Color3.new(1, 1, 1)
input.Font = Enum.Font.Code
input.TextSize = 16
input.PlaceholderText = "Script hier einfügen..."

local output = Instance.new("TextBox", page1)
output.MultiLine = true
output.ClearTextOnFocus = false
output.Size = UDim2.new(1, -20, 0, 100)
output.Position = UDim2.new(0, 10, 0, 200)
output.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
output.TextColor3 = Color3.fromRGB(200, 200, 200)
output.Font = Enum.Font.Code
output.TextSize = 14
output.Text = ">>> Output <<<"


local function createButton(name, parent, pos, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(0, 150, 0, 35)
    btn.Position = pos
    btn.Text = name
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 16
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- Execute
createButton("Execute", page1, UDim2.new(0, 10, 1, -45), function()
    local success, err = pcall(function()
        loadstring(input.Text)()
    end)
    output.Text = success and "Script ausgeführt." or ("Fehler: " .. err)
end)


createButton("Clear", page1, UDim2.new(0, 170, 1, -45), function()
    input.Text = ""
    output.Text = ">>> Output <<<"
end)

-- Fly GUI

createButton("Fly GUI", page1, UDim2.new(0, 330, 1, -45), function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/FREE-ADMIN-FLY-GUI-30799"))()
end)

-- Infinite Yield
createButton("Infinite Yield", page1, UDim2.new(0, 10, 1, -85), function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Infinite-Yield_500"))()
end)

-- Nameless Admin
createButton("Nameless Admin", page1, UDim2.new(0, 170, 1, -85), function()
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Nameless-Admin-35212"))()
end)

-- Infinity Jump
createButton("Infinity Jump", page1, UDim2.new(0, 330, 1, -85), function()
    local UIS = game:GetService("UserInputService")
    local jumping = false
    UIS.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            jumping = true
            while jumping do
                wait()
                game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Space then
            jumping = false
        end
    end)
    output.Text = "Infinity Jump aktiviert!"
end)

-- Page 2 Konsole
local consoleInput = Instance.new("TextBox", page2)
consoleInput.MultiLine = true
consoleInput.ClearTextOnFocus = false
consoleInput.Size = UDim2.new(1, -20, 0, 330)
consoleInput.Position = UDim2.new(0, 10, 0, 40)
consoleInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
consoleInput.TextColor3 = Color3.new(1, 1, 1)
consoleInput.Font = Enum.Font.Code
consoleInput.TextSize = 16
consoleInput.PlaceholderText = "Console Code..."

createButton("Execute", page2, UDim2.new(0, 10, 1, -45), function()
    local success, err = pcall(function()
        loadstring(consoleInput.Text)()
    end)
    consoleInput.Text = success and "-- Executed!" or "-- Fehler: " .. err
end)

createButton("Clear", page2, UDim2.new(0, 170, 1, -45), function()
    consoleInput.Text = ""
end)

-- Open/Close Logic
openBtn.MouseButton1Click:Connect(function()
    page1.Visible = true
    openBtn.Visible = false
end)

closeBtn.MouseButton1Click:Connect(function()
    page1.Visible = false
    page2.Visible = false
    openBtn.Visible = true
end)

toPage2.MouseButton1Click:Connect(function()
    page1.Visible = false
    page2.Visible = true
end)

toPage1.MouseButton1Click:Connect(function()
    page2.Visible = false
    page1.Visible = true
end)