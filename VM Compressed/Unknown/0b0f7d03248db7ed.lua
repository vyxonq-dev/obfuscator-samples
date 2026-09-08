--// Instruction Text Before Orion
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("CoreGui")

local instructionText = Instance.new("TextLabel")
instructionText.Parent = screenGui
instructionText.Size = UDim2.new(0, 400, 0, 150)
instructionText.Position = UDim2.new(0.5, 0, 0.45, 0)
instructionText.AnchorPoint = Vector2.new(0.5, 0.5)
instructionText.Text = [[
1. Open your executor settings.
2. Find the option "Verify Teleports" or similar (sometimes called "Safe Teleport").
3. Disable it.
4. You will now be able to join the game you clicked and execute it.
]]
instructionText.Font = Enum.Font.SourceSansBold
instructionText.TextSize = 22
instructionText.TextColor3 = Color3.new(1,1,1)
instructionText.BackgroundTransparency = 1
instructionText.TextWrapped = true
instructionText.TextStrokeTransparency = 0.5
instructionText.TextYAlignment = Enum.TextYAlignment.Top
instructionText.TextXAlignment = Enum.TextXAlignment.Left

--// Continue Button
local continueButton = Instance.new("TextButton")
continueButton.Parent = screenGui
continueButton.Size = UDim2.new(0, 200, 0, 50)
continueButton.Position = UDim2.new(0.5, 0, 0.7, 0)
continueButton.AnchorPoint = Vector2.new(0.5, 0.5)
continueButton.Text = "Continue"
continueButton.Font = Enum.Font.SourceSansBold
continueButton.TextSize = 24
continueButton.BackgroundColor3 = Color3.new(0.2,0.2,0.2)
continueButton.TextColor3 = Color3.new(1,1,1)
continueButton.BorderSizePixel = 2

continueButton.MouseButton1Click:Connect(function()
    -- Remove instructions
    screenGui:Destroy()

    --// Load Orion UI
    local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()
    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local HttpService = game:GetService("HttpService")

    --// Check TeleportData (for auto-exec after teleport)
    local TeleportData = TeleportService:GetLocalPlayerTeleportData()
    if TeleportData and TeleportData.ScriptURL then
        local success, err = pcall(function()
            loadstring(game:HttpGet(TeleportData.ScriptURL))()
        end)
        if not success then
            warn("Failed to load script:", err)
        end
    end

    --// Create Window
    local Window = OrionLib:MakeWindow({
        Name = "Pablo's Universal Hub v1",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "PablosHub"
    })

    --// Main Tab
    local MainTab = Window:MakeTab({
        Name = "Universal Scripts",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    -- Utility: show on-screen instruction panel (centered) with script info and Close button
    local function ShowExecutePanel(title, scriptUrl, previewText)
        local gui = Instance.new("ScreenGui")
        gui.Parent = game:GetService("CoreGui")

        local frame = Instance.new("Frame")
        frame.Parent = gui
        frame.Size = UDim2.new(0, 540, 0, 260)
        frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.BackgroundColor3 = Color3.fromRGB(24,24,24)
        frame.BorderSizePixel = 0
        frame.BackgroundTransparency = 0

        local titleLabel = Instance.new("TextLabel")
        titleLabel.Parent = frame
        titleLabel.Size = UDim2.new(1, -20, 0, 40)
        titleLabel.Position = UDim2.new(0, 10, 0, 10)
        titleLabel.BackgroundTransparency = 1
        titleLabel.Font = Enum.Font.SourceSansBold
        titleLabel.TextSize = 20
        titleLabel.TextColor3 = Color3.new(1,1,1)
        titleLabel.Text = title

        local infoLabel = Instance.new("TextLabel")
        infoLabel.Parent = frame
        infoLabel.Size = UDim2.new(1, -20, 0, 40)
        infoLabel.Position = UDim2.new(0, 10, 0, 50)
        infoLabel.BackgroundTransparency = 1
        infoLabel.Font = Enum.Font.SourceSans
        infoLabel.TextSize = 18
        infoLabel.TextColor3 = Color3.new(1,1,1)
        infoLabel.TextWrapped = true
        infoLabel.Text = "Join the game now. After you join, open your executor and execute the script below (it has been copied to your clipboard)."

        local urlLabel = Instance.new("TextBox")
        urlLabel.Parent = frame
        urlLabel.Size = UDim2.new(1, -20, 0, 90)
        urlLabel.Position = UDim2.new(0, 10, 0, 100)
        urlLabel.ClearTextOnFocus = false
        urlLabel.MultiLine = true
        urlLabel.TextWrapped = true
        urlLabel.Font = Enum.Font.Code
        urlLabel.TextSize = 15
        urlLabel.TextColor3 = Color3.new(1,1,1)
        urlLabel.Text = previewText or scriptUrl
        urlLabel.BackgroundColor3 = Color3.fromRGB(15,15,15)
        urlLabel.BorderSizePixel = 1

        local closeBtn = Instance.new("TextButton")
        closeBtn.Parent = frame
        closeBtn.Size = UDim2.new(0, 140, 0, 36)
        closeBtn.Position = UDim2.new(1, -150, 1, -46)
        closeBtn.AnchorPoint = Vector2.new(0, 0)
        closeBtn.Text = "Close"
        closeBtn.Font = Enum.Font.SourceSansBold
        closeBtn.TextSize = 18
        closeBtn.BackgroundColor3 = Color3.fromRGB(50,50,50)
        closeBtn.TextColor3 = Color3.new(1,1,1)
        closeBtn.BorderSizePixel = 0

        closeBtn.MouseButton1Click:Connect(function()
            gui:Destroy()
        end)
    end

    -- Helper: copy script source (or URL fallback) and show panel
    local function CopyScriptAndShow(placeId, scriptUrl, displayName)
        local copiedText = nil
        -- Try fetch script source
        local ok, result = pcall(function()
            return HttpService:GetAsync(scriptUrl)
        end)

        if ok and type(result) == "string" and #result > 0 then
            -- Try setclipboard to full script source
            local scOk, scErr = pcall(function()
                setclipboard(result)
            end)
            if scOk then
                copiedText = "Full script source copied to clipboard."
                OrionLib:MakeNotification({
                    Name = "Script Copied",
                    Content = "Full script source copied to clipboard. Join the game and execute it.",
                    Image = "rbxassetid://4483345998",
                    Time = 4
                })
                -- Show panel with preview (first 800 chars)
                local preview = ("-- %s\n\n%s"):format(displayName or "Script", string.sub(result,1,800))
                ShowExecutePanel(displayName or "Execute Script", scriptUrl, preview)
                return
            else
                warn("Could not copy full script to clipboard:", scErr)
            end
        end

        -- Fallback: copy the raw URL
        local copyUrlOk, copyUrlErr = pcall(function()
            setclipboard(scriptUrl)
        end)
        if copyUrlOk then
            OrionLib:MakeNotification({
                Name = "Script URL Copied",
                Content = "Script URL copied to clipboard. Join the game and paste it into your executor.",
                Image = "rbxassetid://4483345998",
                Time = 4
            })
            ShowExecutePanel(displayName or "Execute Script", scriptUrl, scriptUrl)
            return
        else
            warn("Failed to copy script URL:", copyUrlErr)
            OrionLib:MakeNotification({
                Name = "Copy Failed",
                Content = "Could not copy script. Check executor or permissions.",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
            ShowExecutePanel(displayName or "Execute Script", scriptUrl, "Unable to copy to clipboard. Script URL:\n"..scriptUrl)
            return
        end
    end

    --// Buttons now copy script and show instructions instead of auto-teleport
    MainTab:AddButton({
        Name = "Steal a Fish",
        Callback = function()
            CopyScriptAndShow(72212564918217, "https://pastebin.com/raw/eF5g1wPk", "Steal a Fish - Script")
        end
    })

    MainTab:AddButton({
        Name = "Arsenal",
        Callback = function()
            CopyScriptAndShow(286090429, "https://pastebin.com/raw/erMQcadg", "Arsenal - Script")
        end
    })

    MainTab:AddButton({
        Name = "Steal a Brainrot",
        Callback = function()
            CopyScriptAndShow(109983668079237, "https://pastebin.com/raw/c7ifCViV", "Steal a Brainrot - Script")
        end
    })

    --// Discord Button (unchanged)
    MainTab:AddButton({
        Name = "Join Discord Server",
        Callback = function()
            setclipboard("https://discord.gg/Kr9PBx83")
            OrionLib:MakeNotification({
                Name = "Discord",
                Content = "Invite link copied to clipboard!",
                Image = "rbxassetid://4483345998",
                Time = 5
            })
        end
    })

    --// Init Orion
    OrionLib:Init()
end)