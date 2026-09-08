-- Services
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Configuration
local TARGET_SUNC_PLACE_ID = 133609342474444 -- << CHECK THIS ID!
local TARGET_SUNC_GAME_URL = "https://www.roblox.com/games/" .. TARGET_SUNC_PLACE_ID .. "/-/"
local SUNC_SCRIPT_URL = "https://script.sunc.su/"
local ANIMATION_DURATION = 0.3
local CONSOLE_MSG_DURATION = 2.5
local SUNC_TELEPORT_FAIL_DELAY = 5
local OUTPUT_DELAY = 3.5

-- Load Notification Library
local NotificationHolder, Notification
local successNotifLib, errorNotifLib = pcall(function()
    NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
    Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
end)

if not successNotifLib then
    warn("ETP: Failed to load notification library! Error:", errorNotifLib)
    Notification = { Notify = function(...) print("Notification Error (Library Failed to Load):", ...) end }
end

-- GUI Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ETPGUI"; ScreenGui.ResetOnSpawn = false; ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling; ScreenGui.Parent = CoreGui

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"; MainFrame.Size = UDim2.new(0.3, 0, 0.6, 0); MainFrame.Position = UDim2.new(0.35, 0, 0.2, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25); MainFrame.BackgroundTransparency = 0.1
MainFrame.BorderSizePixel = 0; MainFrame.ClipsDescendants = true; MainFrame.Parent = ScreenGui
MainFrame.Visible = false; MainFrame.ZIndex = 1; MainFrame.Active = true

local UICorner = Instance.new("UICorner"); UICorner.CornerRadius = UDim.new(0.05, 0); UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke"); UIStroke.Thickness = 3; UIStroke.Color = Color3.fromHSV(0, 1, 1)
UIStroke.Transparency = 0; UIStroke.Parent = MainFrame

-- Shared state for synchronized animations
local sharedRainbowHue = 0
local rainbowAnimationConnection = nil
local loadingRainbowConnection = nil

local function AnimateUIStroke(strokeInstance)
    if rainbowAnimationConnection then rainbowAnimationConnection:Disconnect() end
    rainbowAnimationConnection = RunService.Heartbeat:Connect(function(dt)
        if not strokeInstance or not strokeInstance.Parent then if rainbowAnimationConnection then rainbowAnimationConnection:Disconnect() end; return end
        sharedRainbowHue = (sharedRainbowHue + dt * 0.5) % 1
        pcall(function() strokeInstance.Color = Color3.fromHSV(sharedRainbowHue, 1, 1) end)
    end)
end

-- Top Bar Setup
local TopBar = Instance.new("Frame"); TopBar.Name = "TopBar"; TopBar.Size = UDim2.new(1, 0, 0.08, 0)
TopBar.Position = UDim2.new(0, 0, 0, 0); TopBar.BackgroundTransparency = 0.8; TopBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TopBar.Parent = MainFrame; TopBar.ZIndex = 2; TopBar.Active = true
local TopBarCorner = Instance.new("UICorner"); TopBarCorner.CornerRadius = UDim.new(0.2, 0); TopBarCorner.Parent = TopBar

local Title = Instance.new("TextLabel"); Title.Name = "Title"; Title.Text = "🔬 Executor Test Panel (ETP)";
Title.Size = UDim2.new(0.85, 0, 1, 0); Title.BackgroundTransparency = 1; Title.TextColor3 = Color3.fromRGB(255, 255, 255); Title.Font = Enum.Font.GothamBold; Title.TextSize = 16; Title.TextXAlignment = Enum.TextXAlignment.Left; Title.TextYAlignment = Enum.TextYAlignment.Center; Title.Position = UDim2.new(0.04, 0, 0, 0); Title.Parent = TopBar; Title.ZIndex = 3; Title.Visible = true

-- Loading Label Setup
local LoadingLabel = Instance.new("TextLabel"); LoadingLabel.Name = "LoadingLabel"; LoadingLabel.Size = UDim2.new(0, 200, 0, 30); LoadingLabel.Position = UDim2.new(0.35+(0.3/2),-100,0.2,-40); LoadingLabel.BackgroundTransparency = 1; LoadingLabel.Font = Enum.Font.GothamBold; LoadingLabel.Text = "Loading..."; LoadingLabel.TextColor3 = Color3.fromRGB(255,255,0); LoadingLabel.TextSize = 18; LoadingLabel.TextWrapped = false; LoadingLabel.TextXAlignment = Enum.TextXAlignment.Center; LoadingLabel.TextYAlignment = Enum.TextYAlignment.Center; LoadingLabel.Visible = false; LoadingLabel.ZIndex = 10; LoadingLabel.Parent = ScreenGui

local function AnimateLoadingLabel(labelInstance)
    if loadingRainbowConnection then loadingRainbowConnection:Disconnect() end
    loadingRainbowConnection = RunService.Heartbeat:Connect(function(dt)
         if not labelInstance or not labelInstance.Parent or not labelInstance.Visible then return end
         pcall(function() labelInstance.TextColor3 = Color3.fromHSV(sharedRainbowHue, 1, 1) end)
    end)
end

local CloseButton = Instance.new("TextButton"); CloseButton.Name = "CloseButton"; CloseButton.Text = "❌"; CloseButton.Size = UDim2.new(0.08, 0, 0.8, 0); CloseButton.Position = UDim2.new(0.9, 0, 0.1, 0); CloseButton.BackgroundColor3 = Color3.fromRGB(180,0,0); CloseButton.TextColor3 = Color3.fromRGB(255,255,255); CloseButton.Font = Enum.Font.GothamBold; CloseButton.TextSize = 14; CloseButton.Parent = TopBar; CloseButton.ZIndex = 3; CloseButton.Interactable = false
local UICorner_Close = Instance.new("UICorner"); UICorner_Close.CornerRadius = UDim.new(0.3, 0); UICorner_Close.Parent = CloseButton

local ScrollingFrame = Instance.new("ScrollingFrame"); ScrollingFrame.Name = "ContentScroller"; ScrollingFrame.Size = UDim2.new(1,0,0.92,0); ScrollingFrame.Position = UDim2.new(0,0,0.08,0); ScrollingFrame.BackgroundTransparency = 1; ScrollingFrame.ScrollBarThickness = 6; ScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255,255,255); ScrollingFrame.ScrollBarImageTransparency = 0.7; ScrollingFrame.CanvasSize = UDim2.new(0,0,0,0); ScrollingFrame.Parent = MainFrame; ScrollingFrame.BorderSizePixel = 0; ScrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y; ScrollingFrame.ZIndex = 2; ScrollingFrame.Visible = true

-- Add Padding to Scrolling Frame for bottom spacing
local ScrollPadding = Instance.new("UIPadding"); ScrollPadding.PaddingBottom = UDim.new(0, 15); ScrollPadding.Parent = ScrollingFrame

-- Version Label Setup
local VersionHolder = Instance.new("Frame"); VersionHolder.Name = "VersionHolder"; VersionHolder.Size = UDim2.new(0.9, 0, 0.05, 0); VersionHolder.Position = UDim2.new(0.5, 0, 0.95, 0); VersionHolder.AnchorPoint = Vector2.new(0.5, 0); VersionHolder.BackgroundColor3 = MainFrame.BackgroundColor3; VersionHolder.BackgroundTransparency = 0; VersionHolder.BorderSizePixel = 0; VersionHolder.ZIndex = 3; VersionHolder.Parent = MainFrame
local VersionCorner = Instance.new("UICorner"); VersionCorner.CornerRadius = UDim.new(0.3, 0); VersionCorner.Parent = VersionHolder
local Version = Instance.new("TextLabel"); Version.Name = "VersionLabel"; Version.Text = "Version 4.0 (UI Improvements)" -- Branding Update
Version.Size = UDim2.new(1, -10, 1, 0); Version.Position = UDim2.new(0, 5, 0, 0); Version.BackgroundTransparency = 1; Version.TextColor3 = Color3.fromRGB(160, 160, 160); Version.Font = Enum.Font.Gotham; Version.TextSize = 12; Version.TextXAlignment = Enum.TextXAlignment.Right; Version.TextYAlignment = Enum.TextYAlignment.Center; Version.Parent = VersionHolder; Version.ZIndex = 4

-- State Variables
local originalMainFrameSize = MainFrame.Size
local isClosing = false; local isAnimating = false; local isDragging = false
local dragStartPos = Vector2.zero; local frameStartPos = UDim2.new()

-- Animation TweenInfos
local introOutroTweenInfo = TweenInfo.new(ANIMATION_DURATION, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local popOutTweenInfo = TweenInfo.new(ANIMATION_DURATION, Enum.EasingStyle.Back, Enum.EasingDirection.In)

-- Dragging Logic (Unchanged)
TopBar.InputBegan:Connect(function(input) if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then local mousePos=input.Position; local closeButtonAbsPos=CloseButton.AbsolutePosition; local closeButtonAbsSize=CloseButton.AbsoluteSize; local onCloseOperation=(mousePos.X>=closeButtonAbsPos.X and mousePos.X<=closeButtonAbsPos.X+closeButtonAbsSize.X and mousePos.Y>=closeButtonAbsPos.Y and mousePos.Y<=closeButtonAbsPos.Y+closeButtonAbsSize.Y); if not onCloseOperation and not isAnimating and not isClosing then isDragging=true; dragStartPos=UserInputService:GetMouseLocation(); frameStartPos=MainFrame.Position end end end)
UserInputService.InputChanged:Connect(function(input) if isDragging and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then local currentMousePos=UserInputService:GetMouseLocation(); local delta=currentMousePos-dragStartPos; local newPos=UDim2.new(frameStartPos.X.Scale, frameStartPos.X.Offset+delta.X, frameStartPos.Y.Scale, frameStartPos.Y.Offset+delta.Y); MainFrame.Position=newPos end end)
UserInputService.InputEnded:Connect(function(input) if isDragging and (input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch) then isDragging=false end end)

-- Close Button Logic (Removed Interrupted Print)
CloseButton.MouseButton1Click:Connect(function() if isClosing or isAnimating or isDragging then return end; isClosing=true; isAnimating=true; CloseButton.Interactable=false; if loadingRainbowConnection then loadingRainbowConnection:Disconnect() end; if rainbowAnimationConnection then rainbowAnimationConnection:Disconnect() end; LoadingLabel.Visible=false; print("ETP: Closing UI..."); local centerPosX=MainFrame.Position.X.Scale+MainFrame.Size.X.Scale/2; local centerPosY=MainFrame.Position.Y.Scale+MainFrame.Size.Y.Scale/2; local posGoal=UDim2.new(centerPosX,MainFrame.Position.X.Offset+MainFrame.Size.X.Offset/2,centerPosY,MainFrame.Position.Y.Offset+MainFrame.Size.Y.Offset/2); local sizeGoal=UDim2.new(0,0,0,0); local sizeTween=TweenService:Create(MainFrame,popOutTweenInfo,{Size=sizeGoal,Position=posGoal,BackgroundTransparency=1}); local strokeTween=TweenService:Create(UIStroke,popOutTweenInfo,{Transparency=1}); sizeTween:Play(); strokeTween:Play(); sizeTween.Completed:Connect(function(state) if state ~= Enum.TweenStatus.Completed then --[[ REMOVED: print("ETP: Close animation interrupted.") ]] end; if ScreenGui and ScreenGui.Parent then ScreenGui:Destroy() end end) end)

-- Intro Animation Logic (Unchanged)
local function PlayIntroAnimation() MainFrame.Visible=true; MainFrame.BackgroundTransparency=1; UIStroke.Transparency=1; MainFrame.Size=UDim2.new(0,0,0,0); local centerPosX=0.5; local centerPosY=0.5; MainFrame.Position=UDim2.new(centerPosX,0,centerPosY,0); local finalSize=originalMainFrameSize; local finalPos=UDim2.new(0.35,0,0.2,0); local sizeTween=TweenService:Create(MainFrame,introOutroTweenInfo,{Size=finalSize,Position=finalPos,BackgroundTransparency=0.1}); local strokeTween=TweenService:Create(UIStroke,introOutroTweenInfo,{Transparency=0}); isAnimating=true; sizeTween:Play(); strokeTween:Play(); sizeTween.Completed:Connect(function(state) if state~=Enum.TweenStatus.Completed then end; if MainFrame and MainFrame.Parent then if state~=Enum.TweenStatus.Completed then MainFrame.Size=finalSize; MainFrame.Position=finalPos; MainFrame.BackgroundTransparency=0.1; UIStroke.Transparency=0 end; CloseButton.Interactable=true; AnimateUIStroke(UIStroke); AnimateLoadingLabel(LoadingLabel); isAnimating=false; MainFrame.ClipsDescendants=false end end) end

-- Notification Functions (Unchanged)
local function ShowDelayedTeleportFailureNotification() if Notification and Notification.Notify then local desc="Would you like to copy the game's link?"; Notification:Notify({Title="Teleport Failed?",Description=desc},{OutlineColor=Color3.fromRGB(200,100,50),Time=15,Type="option"},{Image="rbxassetid://6023426923",Callback=function(State) if State==true then local s,e=pcall(function()setclipboard(TARGET_SUNC_GAME_URL)end); if s then print("ETP: Link Copied.");Notification:Notify({Title="Link Copied!",Description="Game URL copied."},{Time=3}) else print("ETP: Copy Failed:",e);Notification:Notify({Title="Copy Failed",Description="Error: "..tostring(e)},{Time=5,OutlineColor=Color3.fromRGB(180,50,50)}) end else print("ETP: Declined copy.") end end}) else warn("ETP: Cannot show delayed fail, no notif lib.") end end
local function AttemptTeleport() local p=Players.LocalPlayer; if not p then warn("ETP: No LocalPlayer"); return false end; print("ETP: Attempting TP to "..TARGET_SUNC_PLACE_ID); local s,e=pcall(function() TeleportService:Teleport(TARGET_SUNC_PLACE_ID,p) end); if not s then warn("ETP: TP init failed:",e); return false else print("ETP: TP initiated."); if Notification and Notification.Notify then Notification:Notify({Title="Teleporting...",Description="Please wait..."},{OutlineColor=Color3.fromRGB(80,80,180),Time=3,Type="default"}) end; return true end end

-- Description Style Constants & Button Creation (Unchanged)
local DESC_COLOR=Color3.fromRGB(170,170,170); local DESC_TEXT_SIZE=10; local TITLE_DESC_SEPARATOR="<font size=\"5\"><br/></font>";
local BUTTON_NORMAL_COLOR=Color3.fromRGB(30,30,30)
local BUTTON_DIMMED_COLOR = BUTTON_NORMAL_COLOR:Lerp(Color3.new(0, 0, 0), 0.4)

local function CreateButton(text, description, scriptUrl)
    local Button = Instance.new("TextButton"); Button.Name=text:gsub("[^%w]",""); Button.RichText=true;
    Button.Text = "<font size=\"1\"><br/></font>".. text .. TITLE_DESC_SEPARATOR .. "<font size=\""..DESC_TEXT_SIZE.."\" color=\"rgb("..math.floor(DESC_COLOR.R*255)..","..math.floor(DESC_COLOR.G*255)..","..math.floor(DESC_COLOR.B*255)..")\">"..description.."</font><font size=\"1\"><br/></font>";
    Button.Size=UDim2.new(0.9,0,0,0); Button.BackgroundColor3=BUTTON_NORMAL_COLOR; Button.TextColor3=Color3.fromRGB(255,255,255); Button.Font=Enum.Font.GothamBold; Button.TextSize=14; Button.TextWrapped=true; Button.TextXAlignment=Enum.TextXAlignment.Center; Button.TextYAlignment=Enum.TextYAlignment.Center; Button.Parent=ScrollingFrame; Button.AutoButtonColor=false; Button.Interactable=false; Button.AutomaticSize=Enum.AutomaticSize.Y;
    Button.MouseEnter:Connect(function() if Button.Interactable then TweenService:Create(Button,TweenInfo.new(0.15),{BackgroundColor3=BUTTON_NORMAL_COLOR:Lerp(Color3.fromRGB(255,255,255),0.1)}):Play() end end)
    Button.MouseLeave:Connect(function() if Button.Interactable then TweenService:Create(Button,TweenInfo.new(0.15),{BackgroundColor3=BUTTON_NORMAL_COLOR}):Play() end end)
    local UICorner_Button = Instance.new("UICorner"); UICorner_Button.CornerRadius=UDim.new(0.15,0); UICorner_Button.Parent=Button;

    local isDisabled = false

    -- Enable button after intro animation
    local connection; connection = RunService.RenderStepped:Connect(function() if not isAnimating and CloseButton.Interactable then if not isDisabled then Button.Interactable = true; Button.BackgroundColor3 = BUTTON_NORMAL_COLOR end if connection then connection:Disconnect() end end end)

    Button.MouseButton1Click:Connect(function()
        if isDisabled or isClosing or isAnimating or not Button.Interactable then return end

        local isRequireSupportTest = (text == "⚙️ Require Support")
        local isSUNCTest = (text == "📌 sUNC Test")
        local isSpeedTest = (text == "🚄 Execution Speed Test")
        local isCETTest = (text == "🍒 CET Test")
        local isIdentityTest = (text == "🆔 Identity Test")
        local isUNCTest = (text == "📌 UNC Test Official")

        -- Handle disabling and dimming *only* for non-Require tests
        if not isRequireSupportTest then
            isDisabled = true; Button.Interactable = false
            Button.BackgroundColor3 = BUTTON_DIMMED_COLOR
            LoadingLabel.Text = "Loading..."; LoadingLabel.Visible = true;
        else
            print("ETP: Running Require Support script...")
            task.spawn(function()
                local startTime = tick()
                local success, err = pcall(function() loadstring(game:HttpGet(scriptUrl))() end)
                local endTime = tick()
                print(string.format("ETP: Script '%s' finished attempt. Success: %s. Time: %.3fms",text,tostring(success),(endTime-startTime)*1000));
                if not success then warn("ETP: Script failed:",text,"-",err); if Notification and Notification.Notify then Notification:Notify({Title="Script Error", Description="Failed '"..text.."'. Check console (F9). Error: "..tostring(e)},{OutlineColor=Color3.fromRGB(180,50,50),Time=7,Type="default"}) end end
            end)
            return -- Exit early for require test
        end

        -- Normal script execution flow (non-Require)
        task.spawn(function()
             local success, err
             local startTime = tick()
             local consoleMsgShown = false

             local function ShowConsoleAndUndim()
                 if consoleMsgShown then return end
                 consoleMsgShown = true

                 LoadingLabel.Text = "Check Console!"
                 if not LoadingLabel.Visible then LoadingLabel.Visible = true end

                 if Button and Button.Parent and not isClosing then
                     Button.BackgroundColor3 = BUTTON_NORMAL_COLOR
                     Button.Interactable = true
                 end

                 task.delay(CONSOLE_MSG_DURATION, function()
                      if LoadingLabel then LoadingLabel.Visible = false end
                      isDisabled = false -- Allow clicking again after cooldown
                 end)
             end

             if isSUNCTest then
                 print("ETP: Checking game...");
                 if game.PlaceId == TARGET_SUNC_PLACE_ID then
                     print("ETP: Correct game. Running sUNC...");
                     success,err=pcall(function() getgenv().sUNCDebug={["printcheckpoints"]=false,["delaybetweentests"]=0}; loadstring(game:HttpGet(SUNC_SCRIPT_URL))() end)
                 else
                     print("ETP: Wrong game."); LoadingLabel.Visible = false
                     Button.BackgroundColor3 = BUTTON_NORMAL_COLOR; Button.Interactable = true; isDisabled = false
                     if Notification and Notification.Notify then Notification:Notify({Title="Wrong Game!", Description="Teleport to the necessary game?"},{OutlineColor=Color3.fromRGB(200,150,50),Time=8,Type="option"},{Image="rbxassetid://6023426923", Callback=function(St) if St==true then AttemptTeleport(); task.delay(SUNC_TELEPORT_FAIL_DELAY, ShowDelayedTeleportFailureNotification) else print("ETP: Declined teleport.") end end}) else warn("ETP: No notif lib.") end
                     return -- Exit this thread
                 end
             else -- All other normal tests
                 print("ETP: Running script: "..text);
                 success,err=pcall(function() loadstring(game:HttpGet(scriptUrl))() end)
             end

             -- Completion for sUNC (if successful) or other tests
             local endTime = tick()

             -- <<< Add delay for UNC, CET and Identity tests BEFORE printing finish message >>>
             if isUNCTest or isCETTest or isIdentityTest then
                task.wait(OUTPUT_DELAY)
             end

             -- The reported time is still accurate as delay is added *after* timing
             print(string.format("ETP: Script '%s' finished. Success: %s. Time: %.3fms",text,tostring(success),(endTime-startTime)*1000));

             -- Show error notification *unless* it's the specific speed test error
             if not success then
                 local isSpeedTestCollectGarbageError = isSpeedTest and type(err) == "string" and err:find("collectgarbage must be called with 'count'", 1, true)

                 if not isSpeedTestCollectGarbageError then
                     warn("ETP: Script failed:", text, "-", err)
                     if Notification and Notification.Notify then
                         Notification:Notify({Title="Script Error", Description="Failed '"..text.."'. Check console (F9). Error: "..tostring(err)},{OutlineColor=Color3.fromRGB(180,50,50),Time=7,Type="default"})
                     end
                 end
             end

             ShowConsoleAndUndim() -- Show console message and undim/re-enable button
        end)
    end)
    return Button
end

-- Function to Create Category Header (Unchanged)
local function CreateCategoryHeader(text) local H=Instance.new("Frame"); H.Name=text:gsub("[^%w]","").."Header"; H.Size=UDim2.new(0.9,0,0.04,0); H.BackgroundTransparency=1; H.Parent=ScrollingFrame; H.ZIndex=3; local L=Instance.new("Frame"); L.Size=UDim2.new(1,0,0,1); L.Position=UDim2.new(0,0,0.5,0); L.BackgroundColor3=Color3.fromRGB(80,80,80); L.BorderSizePixel=0; L.Parent=H; L.ZIndex=4; local T=Instance.new("TextLabel"); T.Size=UDim2.new(0,200,1,0); T.Position=UDim2.new(0.5,-100,0,0); T.BackgroundTransparency=0; T.BackgroundColor3=MainFrame.BackgroundColor3; T.Font=Enum.Font.GothamBold; T.Text=" "..text.." "; T.TextColor3=Color3.fromRGB(200,200,200); T.TextSize=12; T.ZIndex=5; T.TextXAlignment=Enum.TextXAlignment.Center; T.TextYAlignment=Enum.TextYAlignment.Center; T.Parent=H; return H end

-- Create UI Elements using UIListLayout (Descriptions already updated)
local uiElements={}; local sUNCButtonInstance=nil; local ElementListLayout=Instance.new("UIListLayout"); ElementListLayout.Padding=UDim.new(0,12); ElementListLayout.SortOrder=Enum.SortOrder.LayoutOrder; ElementListLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center; ElementListLayout.Parent=ScrollingFrame;
local elementDefs={{type="header",title="--- Main Tests ---"},{type="button",title="📌 UNC Test Official",description="Checks the amount of functions (more = more script support) the executor supports (usually faked)",url="https://rawscripts.net/raw/Universal-Script-UNC-Test-13114"},{type="button",title="📌 sUNC Test",description="Checks if the executor is lying about the functions they have and shows their true script support.",url=SUNC_SCRIPT_URL},{type="button",title="🍒 CET Test",description="Another test to show the functions the executor is missing or supports",url="https://raw.githubusercontent.com/InfernusScripts/Executor-Tests/refs/heads/main/Environment/Test.lua"},{type="button",title="🛡 Vulnerability Test",description="Tests how safe the executor is from harmful scripts.",url="https://raw.githubusercontent.com/zryr/Vulnerability-Check/refs/heads/main/Script"},{type="header",title="--- Extra Tests ---"},{type="button",title="⚙️ Require Support",description="Checks if require scripts can be executed using the executor",url="https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/RequireChecker.lua"},{type="button",title="🆔 Identity Test",description="Shows the level of the executor and if it's faking it (1-8) - higher = better",url="https://raw.githubusercontent.com/InfernusScripts/Executor-Tests/main/Identity/Test.lua"},{type="button",title="🧊 3D Visualization Test",description="Checks if the executor supports drawing 3D shapes and lines",url="https://raw.githubusercontent.com/1Softworks/3D-Visualization-Test/refs/heads/main/3dtest.lua"},{type="button",title="🚄 Execution Speed Test",description="Measures how quickly the executor can execute a script",url="https://raw.githubusercontent.com/realdefinity/tests/main/executiontest"}};
local layoutOrderCounter=1; for i,def in ipairs(elementDefs) do local elT=def.type; local el; if elT=="header" then el=CreateCategoryHeader(def.title) elseif elT=="button" then el=CreateButton(def.title,def.description,def.url); if def.title=="📌 sUNC Test" then sUNCButtonInstance=el end end; if el then el.LayoutOrder=layoutOrderCounter; table.insert(uiElements,el); layoutOrderCounter=layoutOrderCounter+1 end end

-- Add sUNC Status Indicator (Final Position Tweak)
local sUNCIndicator=nil;
if sUNCButtonInstance then
    sUNCIndicator=Instance.new("Frame"); sUNCIndicator.Name="sUNCStatusIndicator"; sUNCIndicator.Size=UDim2.new(0,10,0,10);
    sUNCIndicator.AnchorPoint = Vector2.new(1, 0); sUNCIndicator.Position=UDim2.new(1, -8, 0, 3);
    sUNCIndicator.BackgroundColor3=Color3.fromRGB(200,200,200); sUNCIndicator.BorderSizePixel=0; sUNCIndicator.ZIndex=sUNCButtonInstance.ZIndex+1; sUNCIndicator.Parent=sUNCButtonInstance;
    local indC=Instance.new("UICorner"); indC.CornerRadius=UDim.new(1,0); indC.Parent=sUNCIndicator;
    local indT=Instance.new("TextLabel"); indT.Name="Tooltip"; indT.Visible=false; indT.Size=UDim2.new(0,150,0,20);
    indT.AnchorPoint = Vector2.new(1, 0.5); indT.Position=UDim2.new(0,-15,0.5,0);
    indT.BackgroundColor3=Color3.fromRGB(10,10,10); indT.BackgroundTransparency=0.1; indT.BorderSizePixel=1; indT.BorderColor3=Color3.fromRGB(150,150,150); indT.TextColor3=Color3.fromRGB(220,220,220); indT.Font=Enum.Font.Gotham; indT.TextSize=10; indT.TextWrapped=true; indT.Text="Status Unknown"; indT.ZIndex=sUNCIndicator.ZIndex+1; indT.Parent=sUNCIndicator;
    local function UpdInd() if not sUNCIndicator or not sUNCIndicator.Parent then return end; if game.PlaceId==TARGET_SUNC_PLACE_ID then sUNCIndicator.BackgroundColor3=Color3.fromRGB(80,200,80); indT.Text="Correct game." else sUNCIndicator.BackgroundColor3=Color3.fromRGB(200,80,80); indT.Text="Wrong game. Teleport needed." end end;
    sUNCIndicator.MouseEnter:Connect(function()indT.Visible=true end); sUNCIndicator.MouseLeave:Connect(function()indT.Visible=false end);
    task.wait(0.5); UpdInd()
else warn("ETP: Could not find sUNC button instance.") end

-- Update ScrollingFrame CanvasSize (Unchanged)
local function UpdateCanvasSize() if ScrollingFrame and ScrollingFrame.Parent and ElementListLayout then ScrollingFrame.CanvasSize = UDim2.new(0,0,0,ElementListLayout.AbsoluteContentSize.Y + ElementListLayout.Padding.Offset + ScrollPadding.PaddingBottom.Offset) end end; ElementListLayout.Changed:Connect(UpdateCanvasSize); ScrollPadding.Changed:Connect(UpdateCanvasSize); task.wait(0.1); UpdateCanvasSize()

-- Start Intro Animation
PlayIntroAnimation()
print("ETP UI Loaded.")

-- Cleanup function (Unchanged)
ScreenGui.Destroying:Connect(function() if rainbowAnimationConnection then rainbowAnimationConnection:Disconnect() end; if loadingRainbowConnection then loadingRainbowConnection:Disconnect() end; isClosing=true end)
