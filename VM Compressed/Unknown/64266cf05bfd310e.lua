-- Fixz Hub | Grow a Business 💼
-- Made By Fixz 64

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Backpack = LocalPlayer:WaitForChild("Backpack")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

-- Update character on respawn
LocalPlayer.CharacterAdded:Connect(function(char)
    Character = char
    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")
end)

-- State
local State = {
    AutoCollect = false,
    AutoPlace = false,
    AutoBuy = false
}

local selectedEmployees = {}

-- Employee list
local employees = {
    "Noob Employee",
    "Business Man",
    "Teacher",
    "Gardener",
    "Painter",
    "Chef",
    "Mine",
    "Fortune Magician",
    "Bank",
    "Skyscraper",
    "Stadium",
    "Waterpark",
    "Castle"
}

-- ===== Rayfield UI with Key System =====
local Window = Rayfield:CreateWindow({
    Name = "Fixz Hub | Grow a Business 💼",
    LoadingTitle = "Fixz Hub",
    LoadingSubtitle = "Made By Fixz 64",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = true,
        Invite = "CDyrbSY8Gx",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "Fixz Hub Key System",
        Subtitle = "Enter Key",
        Note = "Join Discord to get key: https://discord.gg/CDyrbSY8Gx",
        FileName = "FixzHubKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"Fixz2025"}
    }
})

-- Main Tab
local TabMain = Window:CreateTab("Main", 4483362458)

-- ===== Auto Collect Cash =====
TabMain:CreateToggle({
    Name = "Auto Collect Cash",
    CurrentValue = false,
    Flag = "AutoCollect",
    Callback = function(Value)
        State.AutoCollect = Value
    end,
})

RunService.RenderStepped:Connect(function()
    if not State.AutoCollect then return end
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end

    local rootPos = Character.HumanoidRootPart.Position

    for _, model in ipairs(workspace.PlacedEmployees:GetChildren()) do
        if model:IsA("Model") then
            for _, descendant in ipairs(model:GetDescendants()) do
                if descendant:IsA("ProximityPrompt") then
                    local part = descendant.Parent
                    if part and part:IsA("BasePart") then
                        local distance = (part.Position - rootPos).Magnitude
                        if distance <= 50 then
                            fireproximityprompt(descendant)
                        end
                    end
                end
            end
        end
    end
end)

-- ===== Auto Place Employees =====
TabMain:CreateToggle({
    Name = "Auto Place Employees",
    CurrentValue = false,
    Flag = "AutoPlace",
    Callback = function(Value)
        State.AutoPlace = Value
        if Value then
            -- Place all existing tools
            for _, tool in ipairs(Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    task.spawn(function()
                        placeToolUntilGone(tool)
                    end)
                end
            end
        end
    end,
})

local Remote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("PlaceEmployee")

function placeToolUntilGone(tool)
    if not tool or not tool.Parent then return end
    local toolName = tool.Name

    if toolName == "Pick Up" then
        return
    end

    while State.AutoPlace and tool.Parent == Backpack do
        if not HumanoidRootPart then break end
        for _, tier in {"Normal", "Inferno", "Rainbow", "Gold"} do
            local args = {toolName, tier, HumanoidRootPart.CFrame}
            Remote:FireServer(unpack(args))
        end
        task.wait(0.5)
    end
end

Backpack.ChildAdded:Connect(function(child)
    if child:IsA("Tool") then
        task.wait(0.5)
        if State.AutoPlace then
            placeToolUntilGone(child)
        end
    end
end)

-- ===== Auto Buy Employees =====
local BuyRemote = ReplicatedStorage:WaitForChild("RemoteEvents"):WaitForChild("BuyEmployee")
local buyingTask
local runBuying = false

TabMain:CreateToggle({
    Name = "Auto Buy Employees",
    CurrentValue = false,
    Flag = "AutoBuy",
    Callback = function(Value)
        State.AutoBuy = Value
        if Value then
            if #selectedEmployees == 0 then
                Rayfield:Notify({
                    Title = "Error",
                    Content = "Please select employees first!",
                    Duration = 3,
                    Image = 4483362458
                })
                State.AutoBuy = false
                return
            end

            runBuying = true
            buyingTask = task.spawn(function()
                while runBuying do
                    for _, employeeName in ipairs(selectedEmployees) do
                        if not runBuying then break end
                        BuyRemote:FireServer(employeeName)
                        task.wait(0.9)
                    end
                    task.wait(0.5)
                end
            end)
        else
            runBuying = false
        end
    end,
})

TabMain:CreateDropdown({
    Name = "Select Employees",
    Options = employees,
    CurrentOption = {},
    MultipleOptions = true,
    Flag = "EmployeeSelect",
    Callback = function(Value)
        selectedEmployees = {}
        if type(Value) == "table" then
            for _, emp in ipairs(Value) do
                table.insert(selectedEmployees, emp)
            end
        end
    end,
})

-- Info Section
TabMain:CreateSection("Info")

TabMain:CreateParagraph({Title = "How to Use", Content = "1. Auto Collect: Collects cash from nearby employees\n2. Auto Place: Places all employees in your backpack\n3. Auto Buy: Select employees from dropdown, then enable"})

Rayfield:LoadConfiguration()

print("Fixz Hub | Grow a Business loaded successfully!")