local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.5, -100, 0.5, -50)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, -20)
title.Text = "Key System"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Parent = frame

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

title.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
        dragInput = nil
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local KeySystem = Instance.new("TextBox")
KeySystem.Size = UDim2.new(1, 0, 0.5, 0)
KeySystem.Position = UDim2.new(0, 0, 0, 0)
KeySystem.Text = "Enter the Key"
KeySystem.TextColor3 = Color3.new(0, 0, 0)
KeySystem.BackgroundTransparency = 0.5
KeySystem.BackgroundColor3 = Color3.new(1, 1, 1)
KeySystem.TextWrapped = true
KeySystem.Parent = frame

local SubmitButton = Instance.new("TextButton")
SubmitButton.Size = UDim2.new(0.5, 0, 0.5, 0)
SubmitButton.Position = UDim2.new(0, 0, 0.5, 0)
SubmitButton.Text = "Submit"
SubmitButton.Parent = frame

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Position = UDim2.new(1, -20, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.BackgroundColor3 = Color3.new(1, 0, 0)
CloseButton.Parent = frame

CloseButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local GetKeyButton = Instance.new("TextButton")
GetKeyButton.Size = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Position = UDim2.new(0.5, 0, 0.5, 0)
GetKeyButton.Text = "Get Key"
GetKeyButton.Parent = frame
--------------------------------------------------------------------------
SubmitButton.MouseButton1Click:Connect(function()
    local KeySystem = KeySystem.Text
    if KeySystem == "ZNV" then   
screenGui:Destroy()

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/memejames/elerium-v2-ui-library//main/Library", true))()

local window = library:AddWindow("Kavz V2 || mumenridersolos", {
    main_color = Color3.fromRGB(0, 0, 0), -- Color
    min_size = Vector2.new(470, 470), -- Size of the GUI
    can_resize = false,
})

-- Main Tab
local Main = window:AddTab("Main")
local folder = Main:AddFolder("Brawl")

-- God Mode Toggle
local godModeToggle = false
folder:AddSwitch("God Mode (Brawl)", function(State)
    godModeToggle = State
    if State then
        task.spawn(function()
            while godModeToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(0)
            end
        end)
    end
end)

-- Auto Join Brawl Toggle
local autoJoinToggle = false
folder:AddSwitch("Auto Join Brawl", function(State)
    autoJoinToggle = State
    if State then
        task.spawn(function()
            while autoJoinToggle do
                game:GetService("ReplicatedStorage").rEvents.brawlEvent:FireServer("joinBrawl")
                task.wait(2)
            end
        end)
    end
end)

-- Misc Tab
local folder2 = Main:AddFolder("Misc")

-- Destroy Ad Teleport Button
folder2:AddButton("Destroy Ad Teleport", function()
    local part = workspace:FindFirstChild("RobloxForwardPortals")
    if part then
        part:Destroy()
    end
end)

folder2:AddButton("Walk On Water", function()
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(11, -9, 78)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,1999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-1999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,2999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-3999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,4999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-5999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-6999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-7999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-8999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-9999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-10999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-11999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-12999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-13999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-14999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-15999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-16999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-17999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-18999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-19999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-20999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-21999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-22999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-110, -9,-23999)
    WalkPart.Size = Vector3.new(10000,0,10000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-8922.482421875, -9.848660469055176, -6233.65380859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1107.2977294921875, - 9.7848615646362305, -4127.03369140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2054.99365234375, -9.43027928471565247, -5135.06201171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3072.01806640625, -9.645418643951416, -6136.02392578125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4088.711181640625, -9.43027925491333, -5125.28076171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5100.0576171875, -9.215141296386719, -5128.03369140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6103.42626953125, -9.000000953674316, -5590.5859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7096.3935546875, -9.784859657287598, -6403.66015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-9882.7021484375, -9.633520126342773, -5228.537109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-8889.23046875, -9.418381690979004, -4767.06689453125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7888.4443359375, -9.203240394592285, -4648.048828125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6868.951171875, -9.988101005554199, -4124.4384765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5883.841796875, -9.7729620933532715, -4073.54736328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-9873.0966796875, -9.26787185668945, -6775.55859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-8453.767578125, -9.26786804199219, -7212.89013671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7482.234375, -9.84866714477539, -8082.72021484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6483.5791015625, -9.26786422729492, -9055.9033203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6561.2578125, -9.84867858886719, -10038.5146484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1009.69091796875, -9.11653518676758, 1046.963134765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2178.023681640625, -9.09156036376953, 287.1599426269531)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1023.4569091796875, -9.784860134124756, -478.5546569824219)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1416.96533203125, -9.901395559310913, 2066.506591796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1514.3587646484375, -9.686256408691406, 3077.935791015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1624.8602294921875, -9.47111701965332, 4074.02587890625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1687.230712890625, -9.255976676940918, 5069.81640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1655.4146728515625, -9.040838241577148, 6056.37451171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(650.4426879882812, -9.8256990909576416, 6532.1982421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-347.35028076171875, -9.61055850982666, 6912.1591796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(218.79769897460938, -9.395420074462891, 7934.68017578125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(251.1740264892578, -9.1802825927734375, 8951.5595703125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(360.1578369140625, -9.9651424884796143, 9967.0107421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(488.1932067871094, -9.750001907348633, 10972.189453125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(569.8875732421875, -9.5348615646362305, 11982.7353515625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(629.5374755859375, -9.319723129272461, 12985.849609375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1664.9771728515625, -9.610558986663818, 7491.61181640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1945.2432861328125, -9.395420551300049, 8507.6533203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(904.4902954101562, -9.7848610877990723, -2151.783447265625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1890.2633056640625, -9.569720268249512, -2413.07421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2895.560302734375, -9.354581356048584, -2546.12109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3881.858642578125, -9.1394429206848145, -2962.385986328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4874.54833984375, -9.9243016242980957, -3218.8798828125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5892.513671875, -9.709161758422852, -3338.171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6886.39990234375, -9.505979061126709, -3488.1533203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(7863.33056640625, -9.290840148925781, -3597.61279296875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(8840.2548828125, -9.075700759887695, -3711.208740234375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(9838.98046875, -9.8605616092681885, -3811.1064453125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(10812.9287109375, -9.645423412322998, -3987.937744140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(11798.421875, -9.4302849769592285, -4059.906494140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(12794.8408203125, -9.215145587921143, -4103.353515625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(13782.353515625, -9.000005722045898, -4253.642578125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(14800.7666015625, -9.7848663330078125, -4368.7177734375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(15813.6171875, -9.569726467132568, -4453.31591796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(16818.390625, -9.354587078094482, -4569.81396484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(17821.248046875, -9.139448642730713, -4737.97509765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18001.896484375, -9.9243087768554688, -3764.74609375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(17008.357421875, -9.709170341491699, -2794.70751953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(16014.57421875, -9.49403190612793, -2500.1083984375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18766.751953125, -9.709169387817383, -2759.8818359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(19039.708984375, -9.494030475616455, -3743.810546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18948.62890625, -9.494030475616455, -1756.02783203125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(17940.4921875, -9.2788920402526855, -755.4782104492188)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(18944.34375, -9.063753604888916, -543.2788696289062)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(16963.00390625, -9.063752174377441, -293.4074401855469)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(15998.7353515625, -9.8486130237579346, -1311.015869140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(15591.837890625, -9.633473873138428, -296.08660888671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(14579.58203125, -9.4183349609375, -991.3533935546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(14294.275390625, -9.203196048736572, -221.879150390625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(13372.7236328125, -9.9880566596984863, 73.62410736083984)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(12783.056640625, -9.093517303466797, -952.5441284179688)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2003.5675048828125, -9.569721221923828, -1103.451416015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2978.824951171875, -9.354583263397217, -1012.9195556640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3944.885986328125, -9.139444351196289, -958.9783935546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4917.93212890625, -9.9243054389953613, -1106.58837890625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5321.544921875, -9.709166526794434, -1851.941162109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2894.729736328125, -9.9243032932281494, -3897.88720703125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(1880.724609375, -9.709164142608643, -4258.2509765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1643.215576171875, -9.569722652435303, -3132.36572265625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1772.5018310546875, -9.354584217071533, -2139.459716796875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1665.8314208984375, -9.139444828033447, -1128.0208740234375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1673.664794921875, -9.9243054389953613, -176.67430114746094)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1895.2357177734375, -9.709166526794434, 789.939697265625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1991.6993408203125, -9.494027614593506, 1789.4617919921875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2148.386962890625, -9.278889179229736, 2777.50146484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2334.718505859375, -9.06374979019165, 3752.33056640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2430.8857421875, -9.8486104011535645, 4750.89208984375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2477.38427734375, -9.633471488952637, 5754.65625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1474.8240966796875, -9.418332576751709, 4993.744140625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1239.12744140625, -9.203193664550781, 4206.31005859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1682.2164306640625, -9.418331623077393, 6633.03125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1427.5582275390625, -9.203193187713623, 7548.80224609375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3823.29248046875, -9.063750267028809, 1757.0218505859375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4112.26171875, -9.848611354827881, 2757.71484375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4299.38330078125, -9.633472919464111, 3713.58056640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4433.6865234375, -9.4183349609375, 4715.2236328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4646.71728515625, -9.203195571899414, 5683.84765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3911.37353515625, -9.988056182861328, 6502.482421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3161.617431640625, -9.772918224334717, 6943.85986328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-2052.14599609375, -9.9880542755126953, 8546.2861328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1400.4658203125, -9.772915363311768, 9297.806640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-1190.1282958984375, -9.4422254264354706, 10259.5078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2187.53564453125, -9.180280685424805, 9414.32421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2896.7841796875, -9.180281639099121, 7566.1171875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3187.329345703125, -9.9651424884796143, 6555.640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3379.880615234375, -9.750005722045898, 5558.48876953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3961.218017578125, -9.754025459289551, 6907.60400390625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3976.142822265625, -9.538886547088623, 7871.6318359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3126.83544921875, -9.84867262840271, 802.1668090820312)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3662.20703125, -9.633533477783203, -80.66658020019531)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3609.484130859375, -9.418395519256592, -1017.3029174804688)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3753.300537109375, -9.2032551765441895, -1995.7613525390625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4743.466796875, -9.9881160259246826, -2393.3125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5736.89892578125, -9.772977828979492, -2010.5301513671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4006.782958984375, -9.772977352142334, -3332.644287109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-3065.00146484375, -9.557837963104248, -3415.263916015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-4635.92431640625, -9.418395519256592, -103.13423919677734)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5439.66796875, -9.203256607055664, 866.9227294921875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5770.49462890625, -9.9881179332733154, 1845.7347412109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5798.58203125, -9.772978782653809, 2813.786376953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6413.759765625, -9.9881181716918945, 45.978721618652344)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-7281.08837890625, -9.342700004577637, -2053.28173828125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-5939.85009765625, -9.557838439941406, -2980.478515625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3151.140380859375, -9.8764214515686035, 645.57568359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4175.984375, -9.661282062530518, 688.4006958007812)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3677.688232421875, -9.44614315032959, 1697.672607421875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(2702.431640625, -9.231003761291504, 2118.501953125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3402.743896484375, -9.015864849090576, 3122.62060546875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(3311.645263671875, -9.800727367401123, 4067.2041015625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4368.765625, -9.800727128982544, 3317.60009765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(4876.06005859375, -9.585587978363037, 4320.9013671875)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5258.15771484375, -9.370449542999268, 5299.39990234375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5620.71923828125, -9.155311584472656, 6254.36181640625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5176.56591796875, -9.585587978363037, 2400.698486328125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6081.796875, -9.370450019836426, 3295.412109375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5741.1318359375, -9.370449066162109, 1432.1351318359375)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(5813.77685546875, -9.155310153961182, 415.4798889160156)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6412.279296875, -9.9401707649230957, -563.8019409179688)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(6898.72900390625, -9.725030422210693, -1527.509765625)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
    
    
    
    
    local WalkPart = Instance.new("Part")
    WalkPart.Parent = Game.Workspace
    WalkPart.Anchored = true
    WalkPart.Position = Vector3.new(-6474.01318359375, -9.557838439941406, -1076.6319580078125)
    WalkPart.Size = Vector3.new(20000,0,20000)
end)

folder2:AddButton("Permanent Shift Lock", function()
    loadstring(game:HttpGet('https://pastebin.com/raw/CjNsnSDy'))()
end)

folder2:AddButton("Anti AFK", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()
end)

-- Unable Trade Toggle
folder2:AddSwitch("Disable Trade", function(State)
    if State then
        game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("disableTrading")
    else
        game:GetService("ReplicatedStorage").rEvents.tradingEvent:FireServer("enableTrading")
    end
end)

-- Hide Pets Toggle
folder2:AddSwitch("Hide Pets", function(State)
    if State then
        game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("hidePets")
    else
        game:GetService("ReplicatedStorage").rEvents.showPetsEvent:FireServer("showPets")
    end
end)

folder2:AddLabel("-------------")

local autoRepToggle = false
folder2:AddSwitch("Auto Lift", function(State)
    autoRepToggle = State
    if State then
        task.spawn(function()
            while autoRepToggle do
                game:GetService("Players").LocalPlayer:WaitForChild("muscleEvent"):FireServer("rep")
                task.wait(0.1)
            end
        end)
    end
end)

Main:AddLabel("---Auto Farm---")
local folder3 = Main:AddFolder("Auto Farm Jungle")

-- Auto Jungle Bench Toggle
local jungleBenchToggle = false
folder3:AddSwitch("Auto Jungle Bench", function(State)
    jungleBenchToggle = State
    if State then
        task.spawn(function()
            while jungleBenchToggle do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8629.88086, 64.8842468, 1855.03467))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bench"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Jungle Bar Lift Toggle
local jungleBarLiftToggle = false
folder3:AddSwitch("Auto Jungle Bar Lift", function(State)
    jungleBarLiftToggle = State
    if State then
        task.spawn(function()
            while jungleBarLiftToggle do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8678.05566, 14.5030098, 2089.25977))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Bar Lift"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Jungle Squat Toggle
local jungleSquatToggle = false
folder3:AddSwitch("Auto Jungle Squat", function(State)
    jungleSquatToggle = State
    if State then
        task.spawn(function()
            while jungleSquatToggle do
                game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-8374.25586, 34.5933418, 2932.44995))
                game:GetService("ReplicatedStorage").rEvents.machineInteractRemote:InvokeServer("useMachine", workspace.machinesFolder["Jungle Squat"].interactSeat)
                task.wait(0.1)
            end
        end)
    end
end)

local AutoEquip = Main:AddFolder("Auto Equip")

-- Auto Equip Weight Toggle
local equipWeightToggle = false
AutoEquip:AddSwitch("Auto Equip Weight", function(State)
    equipWeightToggle = State
    if State then
        task.spawn(function()
            while equipWeightToggle do
                local weightTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Weight")
                if weightTool then
                    weightTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Equip Pushups Toggle
local equipPushupsToggle = false
AutoEquip:AddSwitch("Auto Equip Pushups", function(State)
    equipPushupsToggle = State
    if State then
        task.spawn(function()
            while equipPushupsToggle do
                local pushupsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Pushups")
                if pushupsTool then
                    pushupsTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Equip Situps Toggle
local equipSitupsToggle = false
AutoEquip:AddSwitch("Auto Equip Situps", function(State)
    equipSitupsToggle = State
    if State then
        task.spawn(function()
            while equipSitupsToggle do
                local situpsTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Situps")
                if situpsTool then
                    situpsTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

-- Auto Equip Handstand Toggle
local equipHandstandToggle = false
AutoEquip:AddSwitch("Auto Equip Handstands", function(State)
    equipHandstandToggle = State
    if State then
        task.spawn(function()
            while equipHandstandToggle do
                local handstandTool = game.Players.LocalPlayer.Backpack:FindFirstChild("Handstand")
                if handstandTool then
                    handstandTool.Parent = game.Players.LocalPlayer.Character
                end
                task.wait(0.1)
            end
        end)
    end
end)

local Rebirth = Main:AddFolder("Auto Rebirths")

local autoRebirth = false

local switch = Rebirth:AddSwitch("Auto Rebirth (Normal)", function(state)
    autoRebirth = state
    while autoRebirth do
        game:GetService("ReplicatedStorage"):WaitForChild("rEvents"):WaitForChild("rebirthRemote"):InvokeServer("rebirthRequest")
        task.wait(0.1)
    end
end)

local autoSizeLoop = nil

local switch = Rebirth:AddSwitch("Auto Size 2", function(state)
    if state then
        autoSizeLoop = task.spawn(function()
            while task.wait(0) do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 2)
            end
        end)
    else
        if autoSizeLoop then
            task.cancel(autoSizeLoop)
            autoSizeLoop = nil
        end
    end
end)

local switch = Rebirth:AddSwitch("Hide All Frames", function(state)
    local rSto = game:GetService("ReplicatedStorage")
		for _, obj in pairs(rSto:GetChildren()) do
			if obj.Name:match("Frame$") then
				obj.Visible = not state
			end
		end
end)

Rebirth:AddLabel("---Op Stuff---")

local switch = Rebirth:AddSwitch("Fast Rebirths", function(state)
    if state then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0o0o0o0o0o0o0o0o0o0o0o0o/0o0o0o0o/refs/heads/main/Kk"))()
    end
end)

local switch = Rebirth:AddSwitch("Speed Grind (No Rebirth)", function(Value)
    local isGrinding = Value

    if not Value then
        return
    end

    for i = 1, 12 do
        task.spawn(function()
            while isGrinding do
                game:GetService("Players").LocalPlayer.muscleEvent:FireServer("rep")
                task.wait(0.083)
            end
        end)
    end
end)

local Rock = Main:AddFolder("Rock Farm")

local selectrock = ""

local switch = Rock:AddSwitch("Auto Punch Jungle Rock (10M)", function(state)
    selectrock = "Ancient Jungle Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 10000000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 10000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
end)

local switch = Rock:AddSwitch("Auto Punch King Rock (5M)", function(state)
    selectrock = "Muscle King Gym Rock"
		getgenv().autoFarm = state
		while getgenv().autoFarm do
			task.wait()
			if game:GetService("Players").LocalPlayer.Durability.Value >= 5000000 then
				for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
					if v.Name == "neededDurability" and v.Value == 5000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
						gettool()
					end
				end
			end
		end
end)

local switch = Rock:AddSwitch("Auto Punch Legend Rock (1M)", function(state)
    selectrock = "Legend Gym Rock"
		getgenv().autoFarm = state
		while getgenv().autoFarm do
			task.wait()
			if game:GetService("Players").LocalPlayer.Durability.Value >= 1000000 then
				for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
					if v.Name == "neededDurability" and v.Value == 1000000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
						firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
						gettool()
					end
				end
			end
		end
end)

local switch = Rock:AddSwitch("Auto Punch Inferno Rock (750K)", function(state)
    selectrock = "Eternal Gym Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 750000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 750000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
end)

local switch = Rock:AddSwitch("Auto Punch Mythical Rock (400K)", function(state)
    selectrock = "Mythical Gym Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 400000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 400000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
end)

local switch = Rock:AddSwitch("Auto Punch Frost Rock (150K)", function(state)
    selectrock = "Frost Gym Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 150000 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 150000 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
end)

local switch = Rock:AddSwitch("Auto Punch Tiny Rock (0)", function(state)
    selectrock = "Tiny Island Rock"
    getgenv().autoFarm = state
    while getgenv().autoFarm do
        task.wait()
        if game:GetService("Players").LocalPlayer.Durability.Value >= 0 then
            for i, v in pairs(game:GetService("Workspace").machinesFolder:GetDescendants()) do
                if v.Name == "neededDurability" and v.Value == 0 and game.Players.LocalPlayer.Character:FindFirstChild("LeftHand") and game.Players.LocalPlayer.Character:FindFirstChild("RightHand") then
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.RightHand, 1)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 0)
                    firetouchinterest(v.Parent.Rock, game:GetService("Players").LocalPlayer.Character.LeftHand, 1)
                    gettool()
                end
            end
        end
    end
end)

local Stats = window:AddTab("Stats")

local function abbreviateNumber(value)
    if value >= 1e15 then
        return string.format("%.1fQa", value / 1e15)
    elseif value >= 1e12 then
        return string.format("%.1fT", value / 1e12)
    elseif value >= 1e9 then
        return string.format("%.1fB", value / 1e9)
    elseif value >= 1e6 then
        return string.format("%.1fM", value / 1e6)
    elseif value >= 1e3 then
        return string.format("%.1fK", value / 1e3)
    else
        return tostring(value)
    end
end

local labels = {
    TimeSpentLabel = Stats:AddLabel("Time spent in this server: 00:00"),
    StrengthGainedLabel = Stats:AddLabel("Amount of strength gained in this server: 0"),
    DurabilityGainedLabel = Stats:AddLabel("Amount of durability gained in this server: 0"),
    AgilityGainedLabel = Stats:AddLabel("Amount of agility gained in this server: 0"),
    KillsGainedLabel = Stats:AddLabel("Amount of kills gained in this server: 0"),
    EvilKarmaGainedLabel = Stats:AddLabel("Amount of Evil Karma gained in this server: 0"),
    GoodKarmaGainedLabel = Stats:AddLabel("Amount of Good Karma gained in this server: 0")
}

local function createMyLabels()
    local player = game.Players.LocalPlayer
    if not player then return end

    local leaderstats = player:WaitForChild("leaderstats")
    if not leaderstats then return end

    local strengthStat = leaderstats:WaitForChild("Strength")
    local durabilityStat = player:WaitForChild("Durability")
    local agilityStat = player:WaitForChild("Agility")
    local killsStat = leaderstats:WaitForChild("Kills")
    local evilKarmaStat = player:WaitForChild("evilKarma")
    local goodKarmaStat = player:WaitForChild("goodKarma")

    local initialStrength = strengthStat.Value or 0
    local initialDurability = durabilityStat.Value or 0
    local initialAgility = agilityStat.Value or 0
    local initialKills = killsStat.Value or 0
    local initialEvilKarma = evilKarmaStat.Value or 0
    local initialGoodKarma = goodKarmaStat.Value or 0

    local startTime = tick()

    local function updateLabels()
        local strengthGained = strengthStat.Value - initialStrength
        local durabilityGained = durabilityStat.Value - initialDurability
        local agilityGained = agilityStat.Value - initialAgility
        local killsGained = killsStat.Value - initialKills
        local evilKarmaGained = evilKarmaStat.Value - initialEvilKarma
        local goodKarmaGained = goodKarmaStat.Value - initialGoodKarma

        labels.StrengthGainedLabel.Text = "Amount of strength gained in this server: " .. abbreviateNumber(strengthGained)
        labels.DurabilityGainedLabel.Text = "Amount of durability gained in this server: " .. abbreviateNumber(durabilityGained)
        labels.AgilityGainedLabel.Text = "Amount of agility gained in this server: " .. abbreviateNumber(agilityGained)
        labels.KillsGainedLabel.Text = "Amount of kills gained in this server: " .. abbreviateNumber(killsGained)
        labels.EvilKarmaGainedLabel.Text = "Amount of Evil Karma gained in this server: " .. abbreviateNumber(evilKarmaGained)
        labels.GoodKarmaGainedLabel.Text = "Amount of Good Karma gained in this server: " .. abbreviateNumber(goodKarmaGained)
    end

    local function updateTimeSpent()
        local timeSpent = tick() - startTime
        local minutes = math.floor(timeSpent / 60)
        local seconds = math.floor(timeSpent % 60)
        labels.TimeSpentLabel.Text = string.format("Time spent in this server: %02d:%02d", minutes, seconds)
    end

    strengthStat.Changed:Connect(updateLabels)
    durabilityStat.Changed:Connect(updateLabels)
    agilityStat.Changed:Connect(updateLabels)
    killsStat.Changed:Connect(updateLabels)
    evilKarmaStat.Changed:Connect(updateLabels)
    goodKarmaStat.Changed:Connect(updateLabels)

    game:GetService("RunService").Heartbeat:Connect(updateTimeSpent)

    updateLabels()
end

createMyLabels()

local Player = window:AddTab("Player")

-- WalkSpeed Textbox & Toggle
local walkSpeedValue = 16 -- Default speed
Player:AddTextBox("WalkSpeed", function(text)
    local speed = tonumber(text)
    if speed and speed >= 1 and speed <= 500 then
        walkSpeedValue = speed
    end
end)

local setSpeed = false
Player:AddSwitch("Set Speed", function(state)
    setSpeed = state
    while setSpeed do
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkSpeedValue
        task.wait(0.1)
    end
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16 -- Reset to default
end)

-- JumpPower Textbox & Toggle
local jumpPowerValue = 50 -- Default JumpPower
Player:AddTextBox("JumpPower", function(text)
    local jump = tonumber(text)
    if jump then
        jumpPowerValue = jump
    end
end)

local applyJumpPower = false
Player:AddSwitch("Apply JumpPower", function(state)
    applyJumpPower = state
    game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = true

    if applyJumpPower then
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumpPowerValue
    else
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50 -- Reset
    end
end)

-- Avatar Size Textbox & Toggle
local sizeValue = 1 -- Default size (normal)
Player:AddTextBox("Size", function(text)
    local size = tonumber(text)
    if size and size >= 1 and size <= 100 then
        sizeValue = size
    end
end)

local setSize = false
Player:AddSwitch("Set Sizes", function(state)
    setSize = state
    local char = game.Players.LocalPlayer.Character
    if char then
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if humanoid then
            if state then
                humanoid.BodyDepthScale.Value = sizeValue
                humanoid.BodyHeightScale.Value = sizeValue
                humanoid.BodyWidthScale.Value = sizeValue
                humanoid.HeadScale.Value = sizeValue
            else
                humanoid.BodyDepthScale.Value = 1
                humanoid.BodyHeightScale.Value = 1
                humanoid.BodyWidthScale.Value = 1
                humanoid.HeadScale.Value = 1
            end
        end
    end
end)

Player:AddLabel("-------------")

local switch = Player:AddSwitch("Lock Position", function(Value)
    if Value then
        -- Lock Position
        local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        getgenv().posLock = game:GetService("RunService").Heartbeat:Connect(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
            end
        end)
    else
        -- Unlock Position
        if getgenv().posLock then
            getgenv().posLock:Disconnect()
            getgenv().posLock = nil
        end
    end
end)

local Killing = window:AddTab("Killing")

-- Auto Punch [No Animation] Toggle
local autoPunchNoAnim = false
Killing:AddSwitch("Auto Punch", function(state)
    autoPunchNoAnim = state

    while autoPunchNoAnim do
        local player = game.Players.LocalPlayer
        local playerName = player.Name
        local punchTool =
            player.Backpack:FindFirstChild("Punch") or
            game.Workspace:FindFirstChild(playerName):FindFirstChild("Punch")

        if punchTool then
            if punchTool.Parent ~= game.Workspace:FindFirstChild(playerName) then
                punchTool.Parent = game.Workspace:FindFirstChild(playerName) -- Equip the tool
            end

            -- Fire the punch event for both hands
            player.muscleEvent:FireServer("punch", "rightHand")
            player.muscleEvent:FireServer("punch", "leftHand")
        else
            warn("Punch tool not found")
            autoPunchNoAnim = false -- Stop loop if tool is missing
        end

        wait() -- Adjust delay if needed
    end
end)

Killing:AddButton("Speed Punch", function()
    local player = game.Players.LocalPlayer
    local punch = player.Backpack:FindFirstChild("Punch")
    local character = game.Workspace:FindFirstChild(player.Name)
    local punch1

    if character then
        punch1 = character:FindFirstChild("Punch")
    end

    local attackTime = 0 -- Fast punch time

    if punch and punch:FindFirstChild("attackTime") then
        punch.attackTime.Value = attackTime
    elseif punch1 and punch1:FindFirstChild("attackTime") then
        punch1.attackTime.Value = attackTime
    end
end)

Killing:AddButton("Normal Punch", function()
    local player = game.Players.LocalPlayer
    local punch = player.Backpack:FindFirstChild("Punch")
    local character = game.Workspace:FindFirstChild(player.Name)
    local punch1

    if character then
        punch1 = character:FindFirstChild("Punch")
    end

    local attackTime = 0.35 -- Default punch time

    if punch and punch:FindFirstChild("attackTime") then
        punch.attackTime.Value = attackTime
    elseif punch1 and punch1:FindFirstChild("attackTime") then
        punch1.attackTime.Value = attackTime
    end
end)

local whitelist = {} -- Table to store whitelisted players

-- Create the Whitelist Textbox
Killing:AddTextBox("Whitelist Player", function(text)
    local targetPlayer = game.Players:FindFirstChild(text)
    if targetPlayer then
        whitelist[targetPlayer.Name] = true
    end
end)

-- Auto Kill Toggle
local autoKill = false
Killing:AddSwitch("Auto Kill", function(bool)
    autoKill = bool -- Control variable

    while autoKill do
        local player = game.Players.LocalPlayer

        for _, target in ipairs(game.Players:GetPlayers()) do
            if target ~= player and not whitelist[target.Name] then -- Exclude whitelisted players and the local player
                local targetChar = target.Character
                local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

                if rootPart then
                    local rightHand = player.Character and player.Character:FindFirstChild("RightHand")
                    local leftHand = player.Character and player.Character:FindFirstChild("LeftHand")

                    if rightHand and leftHand then
                        firetouchinterest(rightHand, rootPart, 1) -- Start touch event
                        firetouchinterest(leftHand, rootPart, 1)
                        firetouchinterest(rightHand, rootPart, 0) -- End touch event
                        firetouchinterest(leftHand, rootPart, 0)
                    end
                end
            end
        end

        wait(0.1) -- Adjust the delay for optimized performance
    end
end)

local targetPlayerName = nil -- Variable to store the target player name

-- Create the Target Name Textbox
Killing:AddTextBox("Player Username", function(text)
    targetPlayerName = text
end)

-- Kill Target Toggle
local killTarget = false
Killing:AddSwitch("Auto Kill Player", function(bool)
    killTarget = bool -- Control variable

    while killTarget do
        local player = game.Players.LocalPlayer
        local target = game.Players:FindFirstChild(targetPlayerName)

        if target and target ~= player then
            local targetChar = target.Character
            local rootPart = targetChar and targetChar:FindFirstChild("HumanoidRootPart")

            if rootPart then
                local rightHand = player.Character and player.Character:FindFirstChild("RightHand")
                local leftHand = player.Character and player.Character:FindFirstChild("LeftHand")

                if rightHand and leftHand then
                    firetouchinterest(rightHand, rootPart, 1) -- Start touch event
                    firetouchinterest(leftHand, rootPart, 1)
                    firetouchinterest(rightHand, rootPart, 0) -- End touch event
                    firetouchinterest(leftHand, rootPart, 0)
                end
            end
        end

        wait(0.1) -- Adjust the delay as needed
    end
end)

local switch = Killing:AddSwitch("View Player", function(Value)
end)

Killing:AddLabel("-------------")

Killing:AddTextBox("Ring Aura Size", function(text)
end)

Killing:AddTextBox("Whitelist Player", function(text)
end)

local switch = Killing:AddSwitch("Enable Ring Aura", function(Value)
end)

local TrackStats = window:AddTab("Track Stats")

local targetPlayer = nil

local textbox = TrackStats:AddTextBox("Player Username", function(text)
    local player = game.Players:FindFirstChild(text)
    if player then
        targetPlayer = player
    else
        targetPlayer = nil
        resetTargetStats()
    end
end)

local labels = {
    TargetStats = TrackStats:AddLabel("Target Stats:"),
    StrengthLabel = TrackStats:AddLabel("Strength: 0"),
    DurabilityLabel = TrackStats:AddLabel("Durability: 0"),
    AgilityLabel = TrackStats:AddLabel("Agility: 0"),
    RebirthsLabel = TrackStats:AddLabel("Rebirths: 0"),
    KillsLabel = TrackStats:AddLabel("Kills: 0"),
    EvilKarmaLabel = TrackStats:AddLabel("Evil Karma: 0"),
    GoodKarmaLabel = TrackStats:AddLabel("Good Karma: 0"),
    EquippedPetsLabel = TrackStats:AddLabel("Equipped Pets:"),
}

-- Create pet labels
for i = 1, 8 do
    labels["Pet" .. i .. "Label"] = TrackStats:AddLabel("Pet" .. i .. ": No pet Equipped")
end

local function updateTargetStats()
    if not targetPlayer then return end

    local leaderstats = targetPlayer:FindFirstChild("leaderstats")
    local goodKarma = targetPlayer:FindFirstChild("goodKarma")
    local evilKarma = targetPlayer:FindFirstChild("evilKarma")

    if leaderstats then
        labels.StrengthLabel.Text = "Strength: " .. abbreviateNumber(leaderstats:FindFirstChild("Strength") and leaderstats.Strength.Value or 0)
        labels.DurabilityLabel.Text = "Durability: " .. abbreviateNumber(targetPlayer:FindFirstChild("Durability") and targetPlayer.Durability.Value or 0)
        labels.AgilityLabel.Text = "Agility: " .. abbreviateNumber(targetPlayer:FindFirstChild("Agility") and targetPlayer.Agility.Value or 0)
        labels.RebirthsLabel.Text = "Rebirths: " .. abbreviateNumber(leaderstats:FindFirstChild("Rebirths") and leaderstats.Rebirths.Value or 0)
        labels.KillsLabel.Text = "Kills: " .. abbreviateNumber(leaderstats:FindFirstChild("Kills") and leaderstats.Kills.Value or 0)
    end

    labels.EvilKarmaLabel.Text = "Evil Karma: " .. abbreviateNumber(evilKarma and evilKarma.Value or 0)
    labels.GoodKarmaLabel.Text = "Good Karma: " .. abbreviateNumber(goodKarma and goodKarma.Value or 0)

    -- Update pet labels properly (reading the pet name from IntValue instances)
    for i = 1, 8 do
        local petValue = targetPlayer:FindFirstChild("pet" .. i)
        if petValue and petValue:IsA("IntValue") and petValue.Value ~= "" then
            labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": " .. petValue.Value
        else
            labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": No pet Equipped"
        end
    end
end

local function resetTargetStats()
    labels.StrengthLabel.Text = "Strength: 0"
    labels.DurabilityLabel.Text = "Durability: 0"
    labels.AgilityLabel.Text = "Agility: 0"
    labels.RebirthsLabel.Text = "Rebirths: 0"
    labels.KillsLabel.Text = "Kills: 0"
    labels.EvilKarmaLabel.Text = "Evil Karma: 0"
    labels.GoodKarmaLabel.Text = "Good Karma: 0"

    for i = 1, 8 do
        labels["Pet" .. i .. "Label"].Text = "Pet" .. i .. ": No pet Equipped"
    end
end

task.spawn(function()
    while task.wait(0.1) do
        if targetPlayer then
            updateTargetStats()
        end
    end
end)

local Teleport = window:AddTab("Teleport")

Teleport:AddButton("Tiny Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-31.8626194, 6.0588026, 2087.88672, -0.999396682, -9.72631931e-09, 0.034730725, -6.63278898e-09, 1, 8.91870684e-08, -0.034730725, 8.8902901e-08, -0.999396682)
end)

Teleport:AddButton("Starter Island", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(226.252472, 8.1526947, 219.366516, -0.00880406145, 3.58277887e-08, -0.999961257, -4.41204939e-08, 1, 3.62176351e-08, 0.999961257, 4.44376482e-08, -0.00880406145)
end)

Teleport:AddButton("Beach", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-365.798309, 44.5082932, -501.618591, 0.00878552441, -6.19950713e-09, 0.999961436, -4.37451603e-10, 1, 6.20358964e-09, -0.999961436, -4.91936492e-10, 0.00878552441)
end)

Teleport:AddButton("Frost Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2933.47998, 29.6399612, -579.946045, 0.0345239155, -1.03010173e-07, 0.999403894, 1.03015294e-08, 1, 1.02715752e-07, -0.999403894, 6.74923806e-09, 0.0345239155)
end)

Teleport:AddButton("Mythical Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2659.50635, 21.6095238, 934.690613, 0.999999881, 4.98906161e-08, 0.000502891606, -4.98585742e-08, 1, -6.37288338e-08, -0.000502891606, 6.37037516e-08, 0.999999881)
end)

Teleport:AddButton("Eternal Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-7176.19141, 45.394104, -1106.31421, 0.971191287, -2.38377185e-09, 0.238301158, 1.41694778e-09, 1, 4.22844915e-09, -0.238301158, -3.76897269e-09, 0.971191287)
end)

Teleport:AddButton("Legend Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4446.91699, 1004.46698, -3983.76074, -0.999961317, -1.97616366e-08, 0.00879266672, -1.93830077e-08, 1, 4.31365149e-08, -0.00879266672, 4.29661292e-08, -0.999961317)
end)

Teleport:AddButton("Muscle King", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8626, 15, -5730)
end)

Teleport:AddButton("Jungle Gym", function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-8137, 28, 2820)
end)

local Credits = window:AddTab("Credits")

Credits:AddLabel("Paid Version, 1,000 Robux")
Credits:AddLabel("Script Made By KavzIIIX")
Credits:AddLabel("Discord: 0deevv0.")

  end
end)
GetKeyButton.MouseButton1Click:Connect(function()
 setclipboard("https://discord.gg/AxJt8VcDQu") 
end) 
