local Junkie = loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
Junkie.service = "Key"
Junkie.identifier = "1161164"
Junkie.provider = "Fishy"

local result = (function()
    getgenv().UI_CLOSED = false
    local Players = game:GetService("Players")
    local TweenService = game:GetService("TweenService")
    local UserInputService = game:GetService("UserInputService")
    local RunService = game:GetService("RunService")
    local SoundService = game:GetService("SoundService")
    local LocalPlayer = Players.LocalPlayer
    
    local function hasFileSystemSupport()
        local hasWritefile = pcall(function() return type(writefile) == "function" end)
        local hasReadfile = pcall(function() return type(readfile) == "function" end)
        local hasIsfile = pcall(function() return type(isfile) == "function" end)
        return hasWritefile and hasReadfile and hasIsfile
    end
    
    local fileSystemSupported = hasFileSystemSupport()
    
    local function saveVerifiedKey(key)
        if not fileSystemSupported then return false end
        local ok = pcall(function()
            writefile("verified_key.txt", key)
        end)
        return ok
    end
    
    local function loadVerifiedKey()
        if not fileSystemSupported then return nil end
        local ok, content = pcall(function()
            return readfile("verified_key.txt")
        end)
        if not ok or not content then return nil end
        return content
    end
    
    local function clearSavedKey()
        if not fileSystemSupported then return false end
        local ok = pcall(function() delfile("verified_key.txt") end)
        return ok
    end

    local savedKey = loadVerifiedKey()
    local keyToCheck = savedKey
    if not keyToCheck then
        keyToCheck = getgenv().SCRIPT_KEY
    end
    
    local initialResult = Junkie.check_key(keyToCheck)
    if initialResult and initialResult.valid then
        if initialResult.message == "KEYLESS" then
            getgenv().SCRIPT_KEY = "KEYLESS"
            return "KEYLESS"
        end
        if initialResult.message == "KEY_VALID" then
            if not savedKey and keyToCheck then
                saveVerifiedKey(keyToCheck)
            end
            getgenv().SCRIPT_KEY = keyToCheck
            return keyToCheck
        end
        if savedKey and not initialResult.key_valid then
            clearSavedKey()
        end
    end

    local function create(class, props, parent)
        local obj = Instance.new(class)
        for k, v in pairs(props) do
            obj[k] = v
        end
        if parent then obj.Parent = parent end
        return obj
    end

    local function MakeDraggable(gui)
        local dragging = false
        local dragInput, dragStart, startPos
        local lastTrailTime = 0
        local originalSize = gui.Size
        local lastInputPos

        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = gui.Position
                lastInputPos = input.Position

                local inputEnded
                inputEnded = input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                        inputEnded:Disconnect()
                        
                        local finalDelta = input.Position - dragStart
                        TweenService:Create(gui, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                            Size = originalSize,
                            Position = UDim2.new(
                                startPos.X.Scale, startPos.X.Offset + finalDelta.X,
                                startPos.Y.Scale, startPos.Y.Offset + finalDelta.Y
                            ),
                            Rotation = 0
                        }):Play()
                    end
                end)
            end
        end)

        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                local delta = input.Position - dragStart
                local velocity = input.Position - lastInputPos
                lastInputPos = input.Position

                local targetPos = UDim2.new(
                    startPos.X.Scale, startPos.X.Offset + delta.X,
                    startPos.Y.Scale, startPos.Y.Offset + delta.Y
                )

                local velX = math.abs(velocity.X)
                local velY = math.abs(velocity.Y)
                
                local stretchX = 1 + math.clamp(velX / 50, 0, 0.15) - math.clamp(velY / 75, 0, 0.05)
                local stretchY = 1 + math.clamp(velY / 50, 0, 0.15) - math.clamp(velX / 75, 0, 0.05)
                
                local targetSize = UDim2.new(
                    originalSize.X.Scale, originalSize.X.Offset * stretchX,
                    originalSize.Y.Scale, originalSize.Y.Offset * stretchY
                )
                
                local diffX = targetSize.X.Offset - originalSize.X.Offset
                local diffY = targetSize.Y.Offset - originalSize.Y.Offset
                
                local adjustedPos = UDim2.new(
                    targetPos.X.Scale, targetPos.X.Offset - diffX / 2,
                    targetPos.Y.Scale, targetPos.Y.Offset - diffY / 2
                )
                
                local targetRotation = math.clamp(velocity.X * 0.5, -12, 12)

                TweenService:Create(gui, TweenInfo.new(0.15, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = adjustedPos,
                    Size = targetSize,
                    Rotation = targetRotation
                }):Play()

                if tick() - lastTrailTime > 0.04 then
                    lastTrailTime = tick()
                    
                    local trail = Instance.new("Frame")
                    trail.Size = targetSize
                    trail.Position = adjustedPos
                    trail.Rotation = targetRotation
                    trail.BackgroundColor3 = gui.BackgroundColor3
                    trail.BackgroundTransparency = 0.5
                    trail.BorderSizePixel = 0
                    trail.ZIndex = gui.ZIndex - 1
                    trail.Parent = gui.Parent

                    local existingCorner = gui:FindFirstChildOfClass("UICorner")
                    if existingCorner then
                        existingCorner:Clone().Parent = trail
                    else
                        local corner = Instance.new("UICorner")
                        corner.CornerRadius = UDim.new(0, 10)
                        corner.Parent = trail
                    end

                    local shrink = 6
                    local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
                    local tween = TweenService:Create(trail, tweenInfo, {
                        BackgroundTransparency = 1,
                        Size = UDim2.new(trail.Size.X.Scale, trail.Size.X.Offset - shrink*2, trail.Size.Y.Scale, trail.Size.Y.Offset - shrink*2),
                        Position = UDim2.new(trail.Position.X.Scale, trail.Position.X.Offset + shrink, trail.Position.Y.Scale, trail.Position.Y.Offset + shrink),
                        Rotation = 0
                    })
                    
                    tween:Play()
                    tween.Completed:Connect(function()
                        trail:Destroy()
                    end)
                end
            end
        end)
    end

    local function playClickSound()
        pcall(function()
            local sound = Instance.new("Sound", SoundService)
            sound.SoundId = "rbxassetid://6042053629"
            sound.Volume = 0.5
            sound.PlayOnRemove = true
            sound:Destroy()
        end)
    end

    local KeyScreenGui = create("ScreenGui", {Name = "FishyHubKeySystem", ResetOnSpawn = false, ZIndexBehavior = Enum.ZIndexBehavior.Sibling})
    local guiParent = nil
    pcall(function()
        if RunService:IsStudio() then
            guiParent = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        else
            guiParent = game:GetService("CoreGui") or LocalPlayer:FindFirstChildOfClass("PlayerGui")
        end
    end)
    if not guiParent then guiParent = LocalPlayer:WaitForChild("PlayerGui", 8) end
    KeyScreenGui.Parent = guiParent

    local KeyMainFrame = create("Frame", {Size = UDim2.new(0, 380, 0, 210), Position = UDim2.new(0.5, -190, 0.5, -105), BackgroundColor3 = Color3.fromRGB(12, 12, 12), BackgroundTransparency = 0.15, BorderSizePixel = 0, Active = true}, KeyScreenGui)
    create("UICorner", {CornerRadius = UDim.new(0, 10)}, KeyMainFrame)
    create("UIStroke", {Color = Color3.fromRGB(255, 255, 255), Thickness = 1.2, ApplyStrokeMode = Enum.ApplyStrokeMode.Border}, KeyMainFrame)
    MakeDraggable(KeyMainFrame)

    create("TextLabel", {Size = UDim2.new(1, 0, 0, 45), Position = UDim2.new(0, 0, 0, 10), BackgroundTransparency = 1, Text = "FISHY HUB KEY SYSTEM", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 13}, KeyMainFrame)

    local KeyCloseBtn = create("TextButton", {Size = UDim2.new(0, 24, 0, 24), Position = UDim2.new(1, -34, 0, 10), BackgroundColor3 = Color3.fromRGB(16, 16, 16), Text = "X", TextColor3 = Color3.fromRGB(180, 180, 180), Font = Enum.Font.GothamBold, TextSize = 10}, KeyMainFrame)
    create("UICorner", {CornerRadius = UDim.new(0, 4)}, KeyCloseBtn)
    local KeyCloseStroke = create("UIStroke", {Color = Color3.fromRGB(30, 30, 30), Thickness = 1}, KeyCloseBtn)
    KeyCloseBtn.MouseButton1Click:Connect(function() 
        playClickSound() 
        KeyScreenGui:Destroy() 
        getgenv().UI_CLOSED = true 
    end)

    local TextBox = create("TextBox", {Size = UDim2.new(0, 320, 0, 38), Position = UDim2.new(0.5, -160, 0, 65), BackgroundColor3 = Color3.fromRGB(16, 16, 16), Text = "", PlaceholderText = "Key Input", TextColor3 = Color3.fromRGB(255, 255, 255), PlaceholderColor3 = Color3.fromRGB(100, 100, 100), Font = Enum.Font.GothamMedium, TextSize = 12, BorderSizePixel = 0}, KeyMainFrame)
    create("UICorner", {CornerRadius = UDim.new(0, 6)}, TextBox)
    create("UIStroke", {Color = Color3.fromRGB(28, 28, 28), Thickness = 1}, TextBox)

    local VerifyBtn = create("TextButton", {Size = UDim2.new(0, 140, 0, 36), Position = UDim2.new(0, 30, 0, 125), BackgroundColor3 = Color3.fromRGB(16, 16, 16), Text = "Verify", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 12}, KeyMainFrame)
    create("UICorner", {CornerRadius = UDim.new(0, 6)}, VerifyBtn)
    local VerifyStroke = create("UIStroke", {Color = Color3.fromRGB(30, 30, 30), Thickness = 1}, VerifyBtn)

    local GetBtn = create("TextButton", {Size = UDim2.new(0, 140, 0, 36), Position = UDim2.new(1, -170, 0, 125), BackgroundColor3 = Color3.fromRGB(16, 16, 16), Text = "Get Key", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 12}, KeyMainFrame)
    create("UICorner", {CornerRadius = UDim.new(0, 6)}, GetBtn)
    local GetStroke = create("UIStroke", {Color = Color3.fromRGB(30, 30, 30), Thickness = 1}, GetBtn)

    local StatusLabel = create("TextLabel", {Size = UDim2.new(1, 0, 0, 25), Position = UDim2.new(0, 0, 1, -32), BackgroundTransparency = 1, Text = "Waiting for key verification...", TextColor3 = Color3.fromRGB(150, 150, 150), Font = Enum.Font.Gotham, TextSize = 11}, KeyMainFrame)

    GetBtn.MouseButton1Click:Connect(function()
        playClickSound()
        local discordLink = "https://discord.gg/rajeZXgYdT"
        if setclipboard then
            setclipboard(discordLink)
            StatusLabel.Text = "Discord link copied to clipboard!"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        else
            StatusLabel.Text = "Join: " .. discordLink
            StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
    end)

    VerifyBtn.MouseButton1Click:Connect(function()
        playClickSound()
        local key = TextBox.Text:gsub("%s+", "")
        if key == "" then
            StatusLabel.Text = "Please enter a key"
            StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
            return
        end
        
        StatusLabel.Text = "Verifying..."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        
        local res = Junkie.check_key(key)
        if res and res.valid then
            saveVerifiedKey(key)
            StatusLabel.Text = "Key Approved! Loading..."
            StatusLabel.TextColor3 = Color3.fromRGB(100, 255, 100)
            task.wait(1.5)
            getgenv().SCRIPT_KEY = key
            getgenv().UI_CLOSED = true
            KeyScreenGui:Destroy()
        else
            StatusLabel.Text = "Incorrect key. Please try again."
            StatusLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        end
    end)

    while not getgenv().UI_CLOSED do
        task.wait(0.1)
    end
    return getgenv().SCRIPT_KEY
end)()

do ("JNKIE Loader - Unauthorized tampering or debugging of protected scripts is strictly prohibited and may result in a global blacklist from JNKIE protected scripts."):sub(1,1);local k=getgenv().SCRIPT_KEY or SCRIPT_KEY;local m="Failed to load script, please try later again!";local function v(h)warn(h);task.spawn(function()pcall(function()game:GetService("Players").LocalPlayer:Kick(h)end);task.wait();pcall(function()local p=game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ErrorPrompt;p.TitleFrame.ErrorTitle.Text="JNKIE";p.MessageArea.ErrorFrame.ErrorMessage.Text=h end)end)end;local r=(type(syn)=="table" and type(syn.request)=="function" and syn.request)or(type(request)=="function" and request)or(type(http_request)=="function" and http_request)or(type(http)=="table" and type(http.request)=="function" and http.request);if type(k)~="string" then v("Key verification failed");return end;if type(r)~="function" then warn(m);return end;local function q(o)local d,a,x;task.spawn(function()a,x=pcall(r,o);d=true end);local s=os.clock();repeat task.wait()until d or os.clock()-s>15;if not d then return false,nil end;return a,x end;local a,x=q({Url="https://api.jnkie.com/api/v1/luascripts/delivery/d05eced11c68e3a6e32b029c856bb77dc77747902b6edf06992e72e424ec9b41?v=2",Method="POST",Headers={["Content-Type"]="text/plain"},Body=k});local h=a and type(x)=="table" and type(x.Body)=="string" and(x.StatusCode==400 or x.StatusCode==401 or x.StatusCode==403)and x.Body;if h and(h=="LDR-DENIED" or h:match("^LDR%-DENIED:[A-Z_]+$"))then v("Key verification failed ("..h..")");return end;if a and type(x)=="table" and x.StatusCode==200 and type(x.Body)=="string" and string.sub(x.Body,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=x.Body,Method="GET"})end;if a and type(x)=="table" and(x.StatusCode==302 or x.StatusCode==303)then local h=x.Headers or x.headers;local l=type(h)=="table" and(h.Location or h.location);if type(l)=="string" and string.sub(l,1,22)=="https://cdn.jnkie.com/" then a,x=q({Url=l,Method="GET"})end end;if not a or type(x)~="table" or x.StatusCode~=200 or type(x.Body)~="string" or#x.Body==0 then warn(m);return end;local b=x.Body;x=nil;local f=loadstring(b);b=nil;if type(f)~="function" then warn(m);return end;f()end