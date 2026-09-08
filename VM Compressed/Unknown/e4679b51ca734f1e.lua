-- [[ SAKIN YIELD: CUSTOM ADMIN INTERFACE 2026 ]] --

local CorrectKey = "KIZARU_2026" 
local KeyLink = "https://direct-link.net/3415392/1MBygiojFGRP" 

local CoreGui = game:GetService("CoreGui")

-- === LAUNCH FUNCTION AFTER KEY VERIFICATION ===
local function LaunchSakinYield()
    -- Loading the Infinite Yield base
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end)

    if success then
        -- Wait for GUI to load then rebrand it
        task.wait(0.5)
        pcall(function()
            local iyGui = CoreGui:FindFirstChild("InfiniteYield") or CoreGui:FindFirstChild("Holder")
            if iyGui then
                -- Rebranding: Replacing names with Sakin Yield
                for _, v in pairs(iyGui:GetDescendants()) do
                    if v:IsA("TextLabel") and (v.Text:find("Infinite Yield") or v.Text:find("IY")) then
                        v.Text = v.Text:gsub("Infinite Yield", "Sakin Yield")
                        v.Text = v.Text:gsub("IY", "Sakin")
                    end
                end
            end
            
            -- Welcome Notification
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "Sakin Yield",
                Text = "Key Accepted! Enjoy your game, KIZARU.",
                Duration = 5
            })
        end)
    else
        warn("Base loading error: " .. tostring(err))
    end
end

-- === KEY SYSTEM INTERFACE ===
local keyGui = Instance.new("ScreenGui", CoreGui)
keyGui.Name = "SakinKeySystem"

local main = Instance.new("Frame", keyGui)
main.Size = UDim2.new(0, 350, 0, 200)
main.Position = UDim2.new(0.5, -175, 0.5, -100)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 15)

local t = Instance.new("TextLabel", main)
t.Size = UDim2.new(1, 0, 0, 50)
t.Text = "SAKIN YIELD ACCESS"
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Font = Enum.Font.Code
t.TextSize = 22
t.BackgroundTransparency = 1

local input = Instance.new("TextBox", main)
input.Size = UDim2.new(0, 280, 0, 45)
input.Position = UDim2.new(0.5, -140, 0.4, 0)
input.PlaceholderText = "Enter Key Here..."
input.Text = ""
input.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
input.TextColor3 = Color3.fromRGB(255, 255, 255)
input.Font = Enum.Font.SourceSans
input.TextSize = 18
Instance.new("UICorner", input)

local check = Instance.new("TextButton", main)
check.Size = UDim2.new(0, 130, 0, 40)
check.Position = UDim2.new(0.1, 0, 0.75, 0)
check.Text = "Verify"
check.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
check.TextColor3 = Color3.fromRGB(255, 255, 255)
check.Font = Enum.Font.SourceSansBold
check.TextSize = 18
Instance.new("UICorner", check)

local get = Instance.new("TextButton", main)
get.Size = UDim2.new(0, 130, 0, 40)
get.Position = UDim2.new(0.55, 0, 0.75, 0)
get.Text = "Get Key"
get.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
get.TextColor3 = Color3.fromRGB(255, 255, 255)
get.Font = Enum.Font.SourceSansBold
get.TextSize = 18
Instance.new("UICorner", get)

-- === LOGIC ===

check.MouseButton1Click:Connect(function()
    if input.Text == CorrectKey then
        check.Text = "Loading..."
        task.wait(0.5)
        keyGui:Destroy()
        LaunchSakinYield()
    else
        input.Text = ""
        input.PlaceholderText = "INVALID KEY!"
        task.wait(1.5)
        input.PlaceholderText = "Enter Key Here..."
    end
end)

get.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(KeyLink)
        get.Text = "Copied!"
    else
        get.Text = "Clipboard Error"
    end
    task.wait(2)
    get.Text = "Get Key"
end)