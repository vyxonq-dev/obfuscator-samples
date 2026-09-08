--// SETTINGS --
local HubScriptURL = "https://pastebin.com/raw/WFRbTpuN"
local URL = "https://pastebin.com/raw/9WHdB0CH"

--// UI Setup
local Script = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local KeyBox = Instance.new("TextBox")
local ConfirmButton = Instance.new("TextButton")
local Status = Instance.new("TextLabel")

--// Parent Script
Script.Name = "Script"
Script.Parent = game.CoreGui

--// Frame Setup
Frame.Parent = Script
Frame.Size = UDim2.new(0, 300, 0, 200)  -- Adjusted frame height
Frame.Position = UDim2.new(0.5, -150, 0.5, -100)  -- Adjusted position
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

--// Key Box Setup
KeyBox.Parent = Frame
KeyBox.Size = UDim2.new(0, 200, 0, 40)
KeyBox.Position = UDim2.new(0.5, -100, 0.3, -20)
KeyBox.PlaceholderText = "Enter Your Key"
KeyBox.Text = ""

--// Confirm Button Setup
ConfirmButton.Parent = Frame
ConfirmButton.Size = UDim2.new(0, 200, 0, 30)
ConfirmButton.Position = UDim2.new(0.5, -100, 0.5, 0)
ConfirmButton.Text = "Unlock Script"

--// Status Label Setup
Status.Parent = Frame
Status.Size = UDim2.new(0, 200, 0, 20)
Status.Position = UDim2.new(0.5, -100, 0.7, 0)
Status.Text = ""

--// Fetch Key from URL
local function fetchKey()
    local success, response = pcall(function()
        return game:HttpGet(URL)  -- Fetch the key from the URL
    end)
    if success then
        return response:gsub("\r\n", "")  -- Clean up any extra newlines or carriage returns
    else
        return nil
    end
end

local YourKey = fetchKey()

if not YourKey then
    warn("Failed to fetch the key from the URL.")
end

--// Key Check
ConfirmButton.MouseButton1Click:Connect(function()
    if KeyBox.Text == YourKey then
        Status.Text = "Correct Key! Loading..."
        wait(1)
        Frame:Destroy()
        -- Run the script from the HubScriptURL
        local success, err = pcall(function()
            loadstring(game:HttpGet(HubScriptURL))()  
        end)
        if not success then
            Status.Text = "Error loading script: " .. err
        end
    else
        Status.Text = "Invalid Key!"

    end
end)