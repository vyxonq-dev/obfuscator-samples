local function performSecurityChecks()
    local executor_name, executor_version = identifyexecutor()
    
    if not executor_name then
        return false, "Unknown executor detected"
    end
    
    if not loadstring or not identifyexecutor or not writefile then
        return false, "Required functions not available"
    end
    
    return true, "Security checks passed"
end

local security_ok, security_msg = performSecurityChecks()
if not security_ok then
    game.Players.LocalPlayer:Kick("Security Check Failed: " .. security_msg)
    return
end

local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
local UI_CONFIG = {
    MainColor = Color3.fromRGB(22, 22, 24),
    SecondaryColor = Color3.fromRGB(30, 30, 34),
    AccentColor = Color3.fromRGB(35, 120, 180),
    ErrorColor = Color3.fromRGB(239, 68, 68),
    SuccessColor = Color3.fromRGB(25, 135, 65),
    WarningColor = Color3.fromRGB(251, 191, 36),
    OrangeColor = Color3.fromRGB(255, 165, 0),
    PurpleColor = Color3.fromRGB(147, 112, 219),
    TextColor = Color3.fromRGB(248, 250, 252),
    SubTextColor = Color3.fromRGB(148, 163, 184),
    BorderColor = Color3.fromRGB(51, 65, 85),
    HoverColor = Color3.fromRGB(40, 40, 46),
    Font = Enum.Font.GothamMedium,
    HeaderFont = Enum.Font.GothamBold,
    TextSize = 14,
    TitleSize = 18,
    SubTextSize = 12,
    CornerRadius = UDim.new(0, 8),
    WindowCornerRadius = UDim.new(0, 12),
    BorderSize = 1,
    Padding = 12,
}

local api
do
    local success, result = pcall(function()
        return loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
    end)
    
    if not success then
        game.Players.LocalPlayer:Kick("Failed to load Luarmor API: " .. tostring(result))
        return
    end
    
    api = result
    if not api or type(api) ~= "table" then
        game.Players.LocalPlayer:Kick("Invalid Luarmor API response")
        return
    end
end

api.script_id = "ccd243d0572844a3c22f20b233235d5c"

local folder = "SPremium"
local file = folder .. "/key.txt"
local saved_key = nil

if isfolder(folder) then
    if isfile(file) then
        saved_key = readfile(file)
    end
else
    makefolder(folder)
end

local function CreateInstance(className, properties)
    local instance = Instance.new(className)
    for property, value in pairs(properties) do
        instance[property] = value
    end
    return instance
end

local function ApplyCorner(instance, radius)
    local corner = CreateInstance("UICorner", {
        CornerRadius = radius or UI_CONFIG.CornerRadius
    })
    corner.Parent = instance
    return corner
end

local function ApplyStroke(instance, color, thickness)
    local stroke = CreateInstance("UIStroke", {
        Color = color or UI_CONFIG.BorderColor,
        Thickness = thickness or UI_CONFIG.BorderSize,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    })
    stroke.Parent = instance
    return stroke
end

local function try_load_with_key(key)
    local executor_name, executor_version = identifyexecutor()
    
    if not key or #key ~= 32 or key:match("[^%w]") then
        return false, "Invalid key format. Keys must be 32 characters (letters/numbers only)."
    end
    
    local success, status = pcall(function()
        return api.check_key(key)
    end)
    
    if not success then
        return false, "Failed to connect to key server. Check your internet connection."
    end
    
    if status.code == "KEY_VALID" then
        if not saved_key or saved_key ~= key then
            writefile(file, key)
        end
        script_key = key
        return true, "Key verified successfully! Welcome " .. (status.data.note ~= "" and status.data.note or "user") .. "!"
    else
        local error_messages = {
            ["KEY_EXPIRED"] = "Your key has expired. Please get a new key.",
            ["KEY_BANNED"] = "Your key has been banned/blacklisted. Contact support if you believe this is an error.",
            ["KEY_HWID_LOCKED"] = "Key is linked to a different device. Use the Discord bot to reset your HWID.",
            ["KEY_INCORRECT"] = "Key not found. Please check your key and try again.",
            ["KEY_INVALID"] = "Invalid key format. Please enter a valid 32-character key.",
            ["SCRIPT_ID_INCORRECT"] = "Script configuration error. Contact the developer.",
            ["SCRIPT_ID_INVALID"] = "Script configuration error. Contact the developer.", 
            ["INVALID_EXECUTOR"] = "Unsupported executor.",
            ["SECURITY_ERROR"] = "Security validation failed. Your executor may not be supported.",
            ["TIME_ERROR"] = "System time error. Please sync your computer's clock and try again.",
            ["UNKNOWN_ERROR"] = "Server error occurred. Please try again later or contact support."
        }
        
        local error_msg = error_messages[status.code] or ("Unknown error: " .. (status.message or "No details available"))
        return false, error_msg
    end
end

local function load_main_script()
    loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/ccd243d0572844a3c22f20b233235d5c.lua"))()
end

if saved_key then
    local success, message = try_load_with_key(saved_key)
    if success then
        load_main_script()
        return
    end
end

local player = game.Players.LocalPlayer

local gui_parent = player:WaitForChild("PlayerGui")
if gethui then
    gui_parent = gethui()
end

local gui = CreateInstance("ScreenGui", {
    Name = "KeySystemGui",
    ResetOnSpawn = false,
    ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    IgnoreGuiInset = true,
    Parent = gui_parent
})

local frame = CreateInstance("Frame", {
    Size = isMobile and UDim2.new(0, 320, 0, 280) or UDim2.new(0, 400, 0, 320),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = UI_CONFIG.MainColor,
    BorderSizePixel = 0,
    Parent = gui
})

ApplyCorner(frame, UI_CONFIG.WindowCornerRadius)
ApplyStroke(frame, UI_CONFIG.BorderColor, 2)

local header = CreateInstance("Frame", {
    Size = UDim2.new(1, 0, 0, 50),
    BackgroundColor3 = UI_CONFIG.SecondaryColor,
    BorderSizePixel = 0,
    Parent = frame
})

ApplyCorner(header, UI_CONFIG.WindowCornerRadius)

local bottomCover = CreateInstance("Frame", {
    Size = UDim2.new(1, 0, 0, 25),
    Position = UDim2.new(0, 0, 1, -25),
    BackgroundColor3 = UI_CONFIG.SecondaryColor,
    BorderSizePixel = 0,
    Parent = header
})

local title = CreateInstance("TextLabel", {
    Size = UDim2.new(1, -20, 1, 0),
    Position = UDim2.new(0, 20, 0, 0),
    BackgroundTransparency = 1,
    Text = " Stalkie Premium Key System",
    Font = UI_CONFIG.HeaderFont,
    TextSize = isMobile and 16 or UI_CONFIG.TitleSize,
    TextColor3 = UI_CONFIG.AccentColor,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = header
})

local subtitle = CreateInstance("TextLabel", {
    Size = UDim2.new(1, -40, 0, 20),
    Position = UDim2.new(0, 20, 0, 65),
    BackgroundTransparency = 1,
    Text = "Please enter your premium key to continue",
    Font = UI_CONFIG.Font,
    TextSize = UI_CONFIG.SubTextSize,
    TextColor3 = UI_CONFIG.SubTextColor,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = frame
})

local inputContainer = CreateInstance("Frame", {
    Size = UDim2.new(1, -40, 0, 40),
    Position = UDim2.new(0, 20, 0, 95),
    BackgroundColor3 = UI_CONFIG.SecondaryColor,
    BorderSizePixel = 0,
    Parent = frame
})

ApplyCorner(inputContainer, UI_CONFIG.CornerRadius)
ApplyStroke(inputContainer, UI_CONFIG.BorderColor, 1)

local keyInput = CreateInstance("TextBox", {
    Size = UDim2.new(1, -20, 1, 0),
    Position = UDim2.new(0, 10, 0, 0),
    BackgroundTransparency = 1,
    PlaceholderText = "Enter your key here...",
    PlaceholderColor3 = UI_CONFIG.SubTextColor,
    Text = "",
    Font = UI_CONFIG.Font,
    TextSize = UI_CONFIG.TextSize,
    TextColor3 = UI_CONFIG.TextColor,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = inputContainer
})

local buttonContainer = CreateInstance("Frame", {
    Size = UDim2.new(1, -40, 0, 40),
    Position = UDim2.new(0, 20, 0, 155),
    BackgroundTransparency = 1,
    Parent = frame
})

local getKeyButton = CreateInstance("TextButton", {
    Size = UDim2.new(0.48, 0, 1, 0),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = UI_CONFIG.AccentColor,
    BorderSizePixel = 0,
    Text = " Get Key",
    Font = UI_CONFIG.HeaderFont,
    TextSize = UI_CONFIG.TextSize,
    TextColor3 = UI_CONFIG.TextColor,
    AutoButtonColor = false,
    Parent = buttonContainer
})

ApplyCorner(getKeyButton, UI_CONFIG.CornerRadius)

local verifyButton = CreateInstance("TextButton", {
    Size = UDim2.new(0.48, 0, 1, 0),
    Position = UDim2.new(0.52, 0, 0, 0),
    BackgroundColor3 = UI_CONFIG.SuccessColor,
    BorderSizePixel = 0,
    Text = " Verify Key",
    Font = UI_CONFIG.HeaderFont,
    TextSize = UI_CONFIG.TextSize,
    TextColor3 = UI_CONFIG.TextColor,
    AutoButtonColor = false,
    Parent = buttonContainer
})

ApplyCorner(verifyButton, UI_CONFIG.CornerRadius)

local statusLabel = CreateInstance("TextLabel", {
    Size = UDim2.new(1, -40, 0, 60),
    Position = UDim2.new(0, 20, 0, 210),
    BackgroundTransparency = 1,
    Text = "Ready to verify your key",
    Font = UI_CONFIG.Font,
    TextSize = UI_CONFIG.SubTextSize,
    TextColor3 = UI_CONFIG.SubTextColor,
    TextXAlignment = Enum.TextXAlignment.Center,
    TextYAlignment = Enum.TextYAlignment.Top,
    TextWrapped = true,
    Parent = frame
})

getKeyButton.MouseEnter:Connect(function()
    TweenService:Create(getKeyButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(28, 95, 140)
    }):Play()
end)

getKeyButton.MouseLeave:Connect(function()
    TweenService:Create(getKeyButton, TweenInfo.new(0.2), {
        BackgroundColor3 = UI_CONFIG.AccentColor
    }):Play()
end)

verifyButton.MouseEnter:Connect(function()
    TweenService:Create(verifyButton, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(20, 110, 50)
    }):Play()
end)

verifyButton.MouseLeave:Connect(function()
    TweenService:Create(verifyButton, TweenInfo.new(0.2), {
        BackgroundColor3 = UI_CONFIG.SuccessColor
    }):Play()
end)

keyInput.Focused:Connect(function()
    ApplyStroke(inputContainer, UI_CONFIG.AccentColor, 2)
end)

keyInput.FocusLost:Connect(function()
    ApplyStroke(inputContainer, UI_CONFIG.BorderColor, 1)
end)

local linkvertise_link = "https://ads.luarmor.net/get_key?for=Stalkie_Premium_Key-tmDFuKXiJWOW"
local workink_link = "https://ads.luarmor.net/get_key?for=Premium_Workink-ZwXuREfbRLwQ"

getKeyButton.MouseButton1Click:Connect(function()
    TweenService:Create(getKeyButton, TweenInfo.new(0.1), {
        Size = UDim2.new(0.46, 0, 0.9, 0)
    }):Play()
    
    task.wait(0.1)
    
    TweenService:Create(getKeyButton, TweenInfo.new(0.1), {
        Size = UDim2.new(0.48, 0, 1, 0)
    }):Play()
    
    local overlay = CreateInstance("Frame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.5,
        Parent = frame,
        ZIndex = 9,
    })
    
    local popup = CreateInstance("Frame", {
        Size = UDim2.new(0.8, 0, 0.8, 0), 
        Position = UDim2.new(0.1, 0, 0.1, 0), 
        BackgroundColor3 = UI_CONFIG.SecondaryColor,
        BorderSizePixel = 0,
        Parent = frame,
        ZIndex = 10,
    })
    ApplyCorner(popup, UI_CONFIG.CornerRadius)
    ApplyStroke(popup, UI_CONFIG.BorderColor, 1)
    
    local warningContainer = CreateInstance("Frame", {
        Size = UDim2.new(1, -20, 0, 160), 
        Position = UDim2.new(0, 10, 0, 10),
        BackgroundColor3 = UI_CONFIG.MainColor,
        BorderSizePixel = 0,
        Parent = popup,
        ZIndex = 10,
    })
    ApplyCorner(warningContainer, UI_CONFIG.CornerRadius)
    ApplyStroke(warningContainer, UI_CONFIG.WarningColor, 1)
    
    local warningTitle = CreateInstance("TextLabel", {
        Size = UDim2.new(1, -20, 0, 20),
        Position = UDim2.new(0, 10, 0, 5),
        BackgroundTransparency = 1,
        Text = "Important Notice",
        Font = UI_CONFIG.HeaderFont,
        TextSize = UI_CONFIG.TextSize + 2,
        TextColor3 = UI_CONFIG.WarningColor,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true,
        Parent = warningContainer
    })
    
    local warning = CreateInstance("TextLabel", {
        Size = UDim2.new(1, -20, 0, 60), 
        Position = UDim2.new(0, 10, 0, 25),
        BackgroundTransparency = 1,
        Text = "Close pop-up ads and complete the process.",
        TextWrapped = true,
        Font = UI_CONFIG.Font,
        TextSize = UI_CONFIG.TextSize,
        TextColor3 = UI_CONFIG.TextColor,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = warningContainer
    })
    
    local avgWarning = CreateInstance("TextLabel", {
        Size = UDim2.new(1, -20, 0, 60), 
        Position = UDim2.new(0, 10, 0, 85),
        BackgroundTransparency = 1,
        Text = "I fixed linkvertise and removed the one hour cooldown.",
        TextWrapped = true,
        Font = UI_CONFIG.Font,
        TextSize = UI_CONFIG.TextSize,
        TextColor3 = UI_CONFIG.WarningColor, 
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        Parent = warningContainer
    })
    
    local popupButtons = CreateInstance("Frame", {
        Size = UDim2.new(1, -20, 0, 40),
        Position = UDim2.new(0, 10, 0, 180), 
        BackgroundTransparency = 1,
        Parent = popup
    })
    
    local linkvertiseButton = CreateInstance("TextButton", {
        Size = UDim2.new(0.48, 0, 1, 0),
        Position = UDim2.new(0, 0, 0, 0),
        BackgroundColor3 = UI_CONFIG.OrangeColor,
        BorderSizePixel = 0,
        Text = "Linkvertise",
        Font = UI_CONFIG.HeaderFont,
        TextSize = UI_CONFIG.TextSize,
        TextColor3 = UI_CONFIG.TextColor,
        AutoButtonColor = false,
        Parent = popupButtons
    })
    ApplyCorner(linkvertiseButton, UI_CONFIG.CornerRadius)
    
    linkvertiseButton.MouseEnter:Connect(function()
        TweenService:Create(linkvertiseButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(200, 130, 0)
        }):Play()
    end)
    
    linkvertiseButton.MouseLeave:Connect(function()
        TweenService:Create(linkvertiseButton, TweenInfo.new(0.2), {
            BackgroundColor3 = UI_CONFIG.OrangeColor
        }):Play()
    end)
    
    linkvertiseButton.MouseButton1Click:Connect(function()
        TweenService:Create(linkvertiseButton, TweenInfo.new(0.1), {
            Size = UDim2.new(0.46, 0, 0.9, 0)
        }):Play()
        
        task.wait(0.1)
        
        TweenService:Create(linkvertiseButton, TweenInfo.new(0.1), {
            Size = UDim2.new(0.48, 0, 1, 0)
        }):Play()
        
        setclipboard(linkvertise_link)
        statusLabel.Text = "Linkvertise link copied! Complete the key process and paste your key above."
        statusLabel.TextColor3 = UI_CONFIG.AccentColor
        overlay:Destroy()
        popup:Destroy()
    end)
    
    local workinkButton = CreateInstance("TextButton", {
        Size = UDim2.new(0.48, 0, 1, 0),
        Position = UDim2.new(0.52, 0, 0, 0),
        BackgroundColor3 = UI_CONFIG.SuccessColor,
        BorderSizePixel = 0,
        Text = "Workink",
        Font = UI_CONFIG.HeaderFont,
        TextSize = UI_CONFIG.TextSize,
        TextColor3 = UI_CONFIG.TextColor,
        AutoButtonColor = false,
        Parent = popupButtons
    })
    ApplyCorner(workinkButton, UI_CONFIG.CornerRadius)
    
    workinkButton.MouseEnter:Connect(function()
        TweenService:Create(workinkButton, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(20, 110, 50)
        }):Play()
    end)
    
    workinkButton.MouseLeave:Connect(function()
        TweenService:Create(workinkButton, TweenInfo.new(0.2), {
            BackgroundColor3 = UI_CONFIG.SuccessColor
        }):Play()
    end)
    
    workinkButton.MouseButton1Click:Connect(function()
        TweenService:Create(workinkButton, TweenInfo.new(0.1), {
            Size = UDim2.new(0.46, 0, 0.9, 0)
        }):Play()
        
        task.wait(0.1)
        
        TweenService:Create(workinkButton, TweenInfo.new(0.1), {
            Size = UDim2.new(0.48, 0, 1, 0)
        }):Play()
        
        setclipboard(workink_link)
        statusLabel.Text = "Workink link copied! Complete the key process and paste your key above."
        statusLabel.TextColor3 = UI_CONFIG.AccentColor
        overlay:Destroy()
        popup:Destroy()
    end)
    
    local keyInfoLabel = CreateInstance("TextLabel", {
        Size = UDim2.new(1, -20, 0, 30),
        Position = UDim2.new(0, 10, 0, 230), 
        BackgroundTransparency = 1,
        Text = "Linkvertise: 6-hour key | Workink: 12-hour key",
        Font = UI_CONFIG.Font,
        TextSize = UI_CONFIG.SubTextSize,
        TextColor3 = UI_CONFIG.SubTextColor,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextWrapped = true,
        Parent = popup
    })
end)

verifyButton.MouseButton1Click:Connect(function()
    local input_key = keyInput.Text:gsub("%s+", "")
    
    if input_key == "" then
        statusLabel.Text = "Please enter your key in the field above."
        statusLabel.TextColor3 = UI_CONFIG.WarningColor
        return
    end
    
    TweenService:Create(verifyButton, TweenInfo.new(0.1), {
        Size = UDim2.new(0.46, 0, 0.9, 0)
    }):Play()
    
    task.wait(0.1)
    
    TweenService:Create(verifyButton, TweenInfo.new(0.1), {
        Size = UDim2.new(0.48, 0, 1, 0)
    }):Play()
    
    statusLabel.Text = "Verifying key... Please wait."
    statusLabel.TextColor3 = UI_CONFIG.AccentColor
    verifyButton.Text = " Verifying..."
    
    task.spawn(function()
        local success, message = try_load_with_key(input_key)
        if success then
            statusLabel.Text = message
            statusLabel.TextColor3 = UI_CONFIG.SuccessColor
            
            task.wait(1.5)
            
            if gui and gui.Parent then
                gui:Destroy()
            end
            
            task.wait(0.1) 
            load_main_script()
        else
            verifyButton.Text = " Verify Key"
            statusLabel.Text = message
            statusLabel.TextColor3 = UI_CONFIG.ErrorColor
        end
    end)
end)

local dragging = false
local dragStart = nil
local startPos = nil

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                  startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

frame.Size = UDim2.new(0, 0, 0, 0)
local entrance = TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
    Size = isMobile and UDim2.new(0, 320, 0, 280) or UDim2.new(0, 400, 0, 320)
})
entrance:Play()
