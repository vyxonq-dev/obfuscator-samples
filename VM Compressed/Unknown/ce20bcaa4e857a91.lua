-- SirBacon Hub v2.5 (by Malek Islam)
local ThemeStorageKey = "sirbacon_theme"
local HttpService = game:GetService("HttpService")

local Theme = "Default"
pcall(function()
    if isfile and readfile and isfile(ThemeStorageKey .. ".json") then
        local data = HttpService:JSONDecode(readfile(ThemeStorageKey .. ".json"))
        Theme = data.theme or "Default"
    end
end)

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "sirbacon hub",
    Icon = 0,
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by sirbacon",
    ShowText = "Rayfield",
    Theme = Theme,
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "sirbacon"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = true
    },
    KeySystem = true,
    KeySettings = {
        Title = "sirbacon key",
        Subtitle = "Key System",
        Note = "Key is sirbacon",
        FileName = "Key",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = { "sirbacon" }
    }
})

local MainTab = Window:CreateTab("Main", 4483362458)

-- Fly Button
MainTab:CreateButton({
    Name = "Fly",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
    end
})

-- ESP Chams Button
MainTab:CreateButton({
    Name = "ESP (Chams + Color Picker)",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local RunService = game:GetService("RunService")

        local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
        ScreenGui.Name = "SirBaconChamsGUI"

        local Frame = Instance.new("Frame", ScreenGui)
        Frame.Size = UDim2.new(0, 220, 0, 180)
        Frame.Position = UDim2.new(0.05, 0, 0.2, 0)
        Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        Frame.Active = true
        Frame.Draggable = true

        local Title = Instance.new("TextLabel", Frame)
        Title.Text = "SirBacon ESP Chams"
        Title.Size = UDim2.new(1, 0, 0, 30)
        Title.BackgroundTransparency = 1
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.Font = Enum.Font.GothamBold
        Title.TextSize = 18

        local function createBox(y, placeholder)
            local box = Instance.new("TextBox", Frame)
            box.Position = UDim2.new(0, 10, 0, y)
            box.Size = UDim2.new(0, 200, 0, 30)
            box.PlaceholderText = placeholder
            box.Text = ""
            box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            box.TextColor3 = Color3.new(1, 1, 1)
            box.ClearTextOnFocus = false
            return box
        end

        local RBox = createBox(40, "Red (0-255)")
        local GBox = createBox(75, "Green (0-255)")
        local BBox = createBox(110, "Blue (0-255)")

        local Apply = Instance.new("TextButton", Frame)
        Apply.Position = UDim2.new(0, 10, 0, 145)
        Apply.Size = UDim2.new(0, 200, 0, 25)
        Apply.Text = "Apply Chams Color"
        Apply.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        Apply.TextColor3 = Color3.new(1, 1, 1)
        Apply.Font = Enum.Font.GothamBold
        Apply.TextSize = 14

        local ESPColor = Color3.new(1, 0, 0)
        local ESPParts = {}

        local function clearESP()
            for _, adorn in pairs(ESPParts) do
                adorn:Destroy()
            end
            table.clear(ESPParts)
        end

        local function addChamsToCharacter(char)
            for _, part in ipairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.Transparency < 1 then
                    local cham = Instance.new("BoxHandleAdornment")
                    cham.Adornee = part
                    cham.AlwaysOnTop = true
                    cham.ZIndex = 10
                    cham.Size = part.Size
                    cham.Color3 = ESPColor
                    cham.Transparency = 0.5
                    cham.Parent = part
                    table.insert(ESPParts, cham)
                end
            end
        end

        local function updateAllPlayers()
            clearESP()
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    addChamsToCharacter(player.Character)
                end
            end
        end

        RunService.RenderStepped:Connect(updateAllPlayers)

        Apply.MouseButton1Click:Connect(function()
            ESPColor = Color3.fromRGB(
                math.clamp(tonumber(RBox.Text) or 255, 0, 255),
                math.clamp(tonumber(GBox.Text) or 0, 0, 255),
                math.clamp(tonumber(BBox.Text) or 0, 0, 255)
            )
            updateAllPlayers()
        end)
    end
})

-- Jump Slider
MainTab:CreateSlider({
    Name = "Jump Slider",
    Range = {50, 200},
    Increment = 10,
    Suffix = "Power",
    CurrentValue = 50,
    Flag = "JumpSlider",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildWhichIsA("Humanoid")
            if hum then
                hum.UseJumpPower = true
                hum.JumpPower = Value
            end
        end
    end
})

-- Speed Slider
MainTab:CreateSlider({
    Name = "Speed Slider",
    Range = {16, 200},
    Increment = 5,
    Suffix = "Speed",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        local char = game.Players.LocalPlayer.Character
        if char then
            local hum = char:FindFirstChildWhichIsA("Humanoid")
            if hum then
                hum.WalkSpeed = Value
            end
        end
    end
})

-- Fling GUI
MainTab:CreateButton({
    Name = "Fling (Enter Player Name)",
    Callback = function()
        local gui = Instance.new("ScreenGui", game.CoreGui)
        gui.Name = "FlingGUI"

        local frame = Instance.new("Frame", gui)
        frame.Size = UDim2.new(0, 250, 0, 100)
        frame.Position = UDim2.new(0.3, 0, 0.3, 0)
        frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        frame.Active = true
        frame.Draggable = true

        local box = Instance.new("TextBox", frame)
        box.Size = UDim2.new(0, 230, 0, 30)
        box.Position = UDim2.new(0, 10, 0, 10)
        box.PlaceholderText = "Enter player name..."
        box.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        box.TextColor3 = Color3.new(1, 1, 1)

        local button = Instance.new("TextButton", frame)
        button.Size = UDim2.new(0, 230, 0, 30)
        button.Position = UDim2.new(0, 10, 0, 50)
        button.Text = "FLING"
        button.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
        button.TextColor3 = Color3.new(1, 1, 1)

        button.MouseButton1Click:Connect(function()
            local name = box.Text
            local plr = game.Players:FindFirstChild(name)
            local me = game.Players.LocalPlayer
            if plr and plr.Character and me.Character then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                local myhrp = me.Character:FindFirstChild("HumanoidRootPart")
                if hrp and myhrp then
                    myhrp.CFrame = hrp.CFrame + Vector3.new(0, 5, 0)
                    task.wait(0.4)
                    local bv = Instance.new("BodyVelocity", myhrp)
                    bv.Velocity = Vector3.new(9999, 9999, 9999)
                    bv.MaxForce = Vector3.new(1e9, 1e9, 1e9)
                    task.wait(0.2)
                    bv:Destroy()
                end
            end
        end)
    end
})

-- Teleport Tool
MainTab:CreateButton({
    Name = "Teleport Tool",
    Callback = function()
        local tool = Instance.new("Tool")
        tool.Name = "TeleportTool"
        tool.RequiresHandle = false
        tool.CanBeDropped = false
        tool.Activated:Connect(function()
            local mouse = game.Players.LocalPlayer:GetMouse()
            local char = game.Players.LocalPlayer.Character
            if char then
                local root = char:FindFirstChild("HumanoidRootPart")
                if root then
                    root.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 5, 0))
                end
            end
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

-- Theme Tab
local ThemesTab = Window:CreateTab("Themes", 4483362458)

local themes = {
    ["Default"] = "Default",
    ["Amber Glow"] = "AmberGlow",
    ["Amethyst"] = "Amethyst",
    ["Bloom"] = "Bloom",
    ["Dark Blue"] = "DarkBlue",
    ["Green"] = "Green",
    ["Light"] = "Light",
    ["Ocean"] = "Ocean",
    ["Serenity"] = "Serenity"
}

for name, id in pairs(themes) do
    ThemesTab:CreateButton({
        Name = "Switch to Theme: " .. name,
        Callback = function()
            if writefile then
                local saveData = HttpService:JSONEncode({ theme = id })
                writefile(ThemeStorageKey .. ".json", saveData)
                Rayfield:Notify({
                    Title = "Theme Changed",
                    Content = "Restarting hub with theme: " .. id,
                    Duration = 3
                })
                task.wait(1.5)
                loadstring(game:HttpGet("https://pastebin.com/raw/f3QTeYPT"))()
            else
                Rayfield:Notify({
                    Title = "Executor Error",
                    Content = "Your executor doesn't support saving themes.",
                    Duration = 4
                })
            end
        end
    })
end