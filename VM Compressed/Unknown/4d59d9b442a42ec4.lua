local LP = game:GetService("Players").LocalPlayer
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local UI_NAME = "H2K4R_V18_1_FIXED"

-- [[ 1. ОЧИСТКА ]] --
pcall(function()
    if LP.PlayerGui:FindFirstChild(UI_NAME) then LP.PlayerGui[UI_NAME]:Destroy() end
end)

local sg = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
sg.Name = UI_NAME
sg.ResetOnSpawn = false

-- [[ 2. ІНТРО (CREATOR) ]] --
local Intro = Instance.new("TextLabel", sg)
Intro.Size = UDim2.new(1, 0, 1, 0)
Intro.BackgroundTransparency = 1
Intro.Text = "Creator: maksum6863"
Intro.TextColor3 = Color3.fromRGB(200, 160, 255)
Intro.TextSize = 40
Intro.Font = Enum.Font.Code
Intro.TextTransparency = 0

task.spawn(function()
    task.wait(1.5)
    local tween = TS:Create(Intro, TweenInfo.new(2.5), {TextTransparency = 1})
    tween:Play()
    tween.Completed:Wait()
    Intro:Destroy()
end)

-- [[ 3. КРУГЛА КНОПКА (ПО ЦЕНТРУ) ]] --
local OpenBtn = Instance.new("TextButton", sg)
OpenBtn.Size = UDim2.new(0, 55, 0, 55)
OpenBtn.Position = UDim2.new(0.5, -27, 0.5, -27)
OpenBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
OpenBtn.Text = "H2K4R"
OpenBtn.TextColor3 = Color3.new(1, 1, 1)
OpenBtn.BackgroundTransparency = 0.5
OpenBtn.Font = Enum.Font.Code
OpenBtn.TextSize = 14

local BtnCorner = Instance.new("UICorner", OpenBtn); BtnCorner.CornerRadius = UDim.new(1, 0)
local BtnStroke = Instance.new("UIStroke", OpenBtn); BtnStroke.Color = Color3.fromRGB(255, 255, 255); BtnStroke.Thickness = 2; BtnStroke.Transparency = 0.5

-- [[ 4. ГОЛОВНЕ ВІКНО ]] --
local Frame = Instance.new("Frame", sg)
Frame.Size = UDim2.new(0, 340, 0, 420)
Frame.Position = UDim2.new(0.5, -170, 0.5, -210)
Frame.BackgroundColor3 = Color3.fromRGB(15, 0, 15)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(150, 0, 255)
Frame.Visible = false 
Frame.Active = true

local Title = Instance.new("TextButton", Frame)
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundColor3 = Color3.fromRGB(60, 0, 100)
Title.Text = "H2K4R HUB: V18.1 FIXED"
Title.TextColor3 = Color3.new(1, 1, 1)

-- [[ ТАБИ ]] --
local function CreateTabBtn(text, pos, width)
    local b = Instance.new("TextButton", Frame)
    b.Size = UDim2.new(width, -4, 0, 30)
    b.Position = UDim2.new(pos, 2, 0, 40)
    b.Text = text
    b.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.Code
    b.TextSize = 11
    return b
end

local MainBtn = CreateTabBtn("MAIN", 0, 0.25)
local PlayerBtn = CreateTabBtn("PLAYER", 0.25, 0.25)
local FeTabBtn = CreateTabBtn("FE", 0.50, 0.25)
local HubBtn = CreateTabBtn("HUBS", 0.75, 0.25)

local function CreateScroll()
    local s = Instance.new("ScrollingFrame", Frame)
    s.Size = UDim2.new(1, -10, 1, -85)
    s.Position = UDim2.new(0, 5, 0, 80)
    s.BackgroundTransparency = 1; s.Visible = false
    s.CanvasSize = UDim2.new(0, 0, 0, 950); s.ScrollBarThickness = 3
    local l = Instance.new("UIListLayout", s); l.Padding = UDim.new(0, 5)
    return s
end

local MainS = CreateScroll(); local PlayerS = CreateScroll(); local FeS = CreateScroll(); local HubS = CreateScroll()
MainS.Visible = true; MainBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)

local function Add(name, action, parent)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, -5, 0, 35); b.BackgroundColor3 = Color3.fromRGB(25, 0, 40)
    b.BorderSizePixel = 1; b.BorderColor3 = Color3.fromRGB(150, 0, 255)
    b.Text = " " .. name; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.Code
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.MouseButton1Down:Connect(function()
        if type(action) == "string" then pcall(function() loadstring(game:HttpGet(action))() end)
        elseif type(action) == "function" then pcall(action) end
    end)
end

-- [[ TAB 1: MAIN (ВСЕ ПОВЕРНУТО) ]] --
Add("SUPER RING V6", "https://raw.githubusercontent.com/chesslovers69/Super-ring-parts-v6/refs/heads/main/Bylukaslol", MainS)
Add("X-RAY TOOL", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ECCSco/ECCS-V3/refs/heads/main/X-Ray%20Tool.lua"))("Copyright SHON ECCS Co") end, MainS)
Add("INFINITE YIELD", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source", MainS)
Add("FLY GUI V3", "https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt", MainS)
Add("RICE ANTI-AFK", "https://raw.githubusercontent.com/KazeOnTop/Rice-Anti-Afk/main/Wind", MainS)
Add("INFINITE JUMP", function()
    UIS.JumpRequest:Connect(function() if LP.Character then LP.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end end)
end, MainS)
Add("ESP PLAYERS", function()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= LP and v.Character and not v.Character:FindFirstChild("Highlight") then 
            Instance.new("Highlight", v.Character).FillColor = Color3.fromRGB(255, 0, 0) 
        end
    end
end, MainS)
Add("TP TOOL (CLICK)", function()
    local t = Instance.new("Tool")
    t.RequiresHandle = false; t.Name = "TP Tool"; t.Parent = LP.Backpack
    t.Activated:Connect(function() if LP.Character then LP.Character:MoveTo(LP:GetMouse().Hit.Position) end end)
end, MainS)

-- [[ TAB 2: PLAYER ]] --
local noclip = false
Add("NOCLIP (Toggle)", function() noclip = not noclip end, PlayerS)
RS.Stepped:Connect(function()
    if noclip and LP.Character then
        for _, v in pairs(LP.Character:GetDescendants()) do if v:IsA("BasePart") then v.CanCollide = false end end
    end
end)

local function AddSlider(name, min, max, default, parent, callback)
    local bg = Instance.new("Frame", parent); bg.Size = UDim2.new(1, -5, 0, 45); bg.BackgroundColor3 = Color3.fromRGB(25, 0, 40); bg.BorderSizePixel = 0
    local title = Instance.new("TextLabel", bg); title.Size = UDim2.new(1, 0, 0, 15); title.Text = name .. ": " .. default; title.TextColor3 = Color3.new(1,1,1); title.BackgroundTransparency = 1
    local bar = Instance.new("TextButton", bg); bar.Size = UDim2.new(0.8, 0, 0, 10); bar.Position = UDim2.new(0.1, 0, 0.6, 0); bar.Text = ""
    local fill = Instance.new("Frame", bar); fill.Size = UDim2.new((default-min)/(max-min), 0, 1, 0); fill.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
    bar.MouseButton1Down:Connect(function()
        local move; move = UIS.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                local rel = math.clamp((input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
                local val = math.floor(min + (max - min) * rel)
                fill.Size = UDim2.new(rel, 0, 1, 0); title.Text = name .. ": " .. val; callback(val)
            end
        end)
        UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then move:Disconnect() end end)
    end)
end
AddSlider("Speed", 16, 250, 16, PlayerS, function(v) if LP.Character then LP.Character.Humanoid.WalkSpeed = v end end)
AddSlider("Jump", 50, 500, 50, PlayerS, function(v) if LP.Character then LP.Character.Humanoid.JumpPower = v end end)

Add("ANIMATION R6 (Fix)", function()
    local Animate = LP.Character:FindFirstChild("Animate")
    if Animate then
        Animate.Disabled = true; task.wait(0.1)
        Animate.walk.WalkAnim.AnimationId = "rbxassetid://89310187408798"
        Animate.run.RunAnim.AnimationId = "rbxassetid://102389851866823"
        Animate.idle.Animation1.AnimationId = "rbxassetid://74254113937732"
        Animate.jump.JumpAnim.AnimationId = "rbxassetid://96093759377465"
        Animate.Disabled = false
    end
end, PlayerS)

-- [[ TAB 3: FE ]] --
Add("GALE FIGHTER", "https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/gale", FeS)
Add("FE SCRIPT (New)", "https://pastefy.app/59mJGQGe/raw", FeS)

-- [[ TAB 4: HUBS ]] --
Add("ZEPHYR HUB (MVS)", "https://rawscripts.net/raw/Murderers-VS-Sheriffs-DUELS-Zephyr-Hub-76088", HubS)
Add("PROJECT POLERINAS", "https://raw.githubusercontent.com/jkkkkkkjjjjjjjj/Hhhh/refs/heads/main/PROJECT.27POLERİNAD", HubS)
Add("LOLGUI V1", "https://raw.githubusercontent.com/L0OLKIDD0/Me-is-k1ng-v1/refs/heads/main/LOL%20guiv1", HubS)
Add("XVC HUB", "https://pastebin.com/raw/Piw5bqGq", HubS)
Add("COOLCLAN HUB", "https://raw.githubusercontent.com/cfsmi2/c00lguiv1/refs/heads/main/Main.lua", HubS)

-- [[ ЛОГІКА ТАБІВ ]] --
local function ShowTab(tab, btn)
    MainS.Visible = false; PlayerS.Visible = false; FeS.Visible = false; HubS.Visible = false
    MainBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 50); PlayerBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    FeTabBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 50); HubBtn.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    tab.Visible = true; btn.BackgroundColor3 = Color3.fromRGB(150, 0, 255)
end
MainBtn.MouseButton1Down:Connect(function() ShowTab(MainS, MainBtn) end)
PlayerBtn.MouseButton1Down:Connect(function() ShowTab(PlayerS, PlayerBtn) end)
FeTabBtn.MouseButton1Down:Connect(function() ShowTab(FeS, FeTabBtn) end)
HubBtn.MouseButton1Down:Connect(function() ShowTab(HubS, HubBtn) end)

-- [[ DRAG & CLICK ]] --
local function MakeDraggable(obj, target)
    local drag, start, sPos
    obj.InputBegan:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = true start = i.Position sPos = target.Position end end)
    UIS.InputChanged:Connect(function(i) if drag and i.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = i.Position - start
        target.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + delta.X, sPos.Y.Scale, sPos.Y.Offset + delta.Y)
    end end)
    UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then drag = false end end)
end

MakeDraggable(Title, Frame)
MakeDraggable(OpenBtn, OpenBtn)
OpenBtn.MouseButton1Click:Connect(function() Frame.Visible = not Frame.Visible end)
