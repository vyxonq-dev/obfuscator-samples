function NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/105)end return res end 


local TweenService = game:GetService(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,12495,10605,10605,11550,8715,10605,11970,12390,11025,10395,10605}))
local UserInputService = game:GetService(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8925,12075,10605,11970,7665,11550,11760,12285,12180,8715,10605,11970,12390,11025,10395,10605}))
local ScreenGui = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8715,10395,11970,10605,10605,11550,7455,12285,11025}))
local MainFrame = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7350,11970,10185,11445,10605}))
local Title = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
local KeyInput = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,10605,12600,12180,6930,11655,12600}))
local GetKeyButton = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
local LoginButton = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
local DiscordContainer = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7350,11970,10185,11445,10605}))
local DiscordText = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,10605,12600,12180,7980,10185,10290,10605,11340}))
local CloseButton = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,10605,12600,12180,6930,12285,12180,12180,11655,11550}))
local UICorner = Instance.new(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8925,7665,7035,11655,11970,11550,10605,11970}))

ScreenGui.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8085,11655,10500,10605,11970,11550,7875,10605,12705,7455,8925,7665})
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8400,11340,10185,12705,10605,11970,7455,12285,11025}))
ScreenGui.ResetOnSpawn = false

MainFrame.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8085,10185,11025,11550,7350,11970,10185,11445,10605})
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true

UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 15)

Title.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({8820,11025,12180,11340,10605})
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Position = UDim2.new(0, 0, 0.05, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7980,11655,10815,11025,11550,3360,8715,12705,12075,12180,10605,11445})
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextScaled = true

KeyInput.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7875,10605,12705,7665,11550,11760,12285,12180})
KeyInput.Parent = MainFrame
KeyInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
KeyInput.Position = UDim2.new(0.1, 0, 0.35, 0)
KeyInput.Size = UDim2.new(0.8, 0, 0.15, 0)
KeyInput.Font = Enum.Font.Gotham
KeyInput.PlaceholderText = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7245,11550,12180,10605,11970,3360,7875,10605,12705,3360,7560,10605,11970,10605})
KeyInput.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({})
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.TextScaled = true

local KeyCorner = UICorner:Clone()
KeyCorner.Parent = KeyInput

GetKeyButton.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7455,10605,12180,7875,10605,12705,6930,12285,12180,12180,11655,11550})
GetKeyButton.Parent = MainFrame
GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
GetKeyButton.Position = UDim2.new(0.1, 0, 0.55, 0)
GetKeyButton.Size = UDim2.new(0.35, 0, 0.15, 0)
GetKeyButton.Font = Enum.Font.GothamBold
GetKeyButton.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7455,10605,12180,3360,7875,10605,12705})
GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
GetKeyButton.TextScaled = true

local GetKeyCorner = UICorner:Clone()
GetKeyCorner.Parent = GetKeyButton

LoginButton.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7980,11655,10815,11025,11550,6930,12285,12180,12180,11655,11550})
LoginButton.Parent = MainFrame
LoginButton.BackgroundColor3 = Color3.fromRGB(50, 255, 100)
LoginButton.Position = UDim2.new(0.55, 0, 0.55, 0)
LoginButton.Size = UDim2.new(0.35, 0, 0.15, 0)
LoginButton.Font = Enum.Font.GothamBold
LoginButton.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7980,11655,10815,11025,11550})
LoginButton.TextColor3 = Color3.fromRGB(255, 255, 255)
LoginButton.TextScaled = true

local LoginCorner = UICorner:Clone()
LoginCorner.Parent = LoginButton

DiscordContainer.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7140,11025,12075,10395,11655,11970,10500,7035,11655,11550,12180,10185,11025,11550,10605,11970})
DiscordContainer.Parent = MainFrame
DiscordContainer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
DiscordContainer.Position = UDim2.new(0.1, 0, 0.8, 0)
DiscordContainer.Size = UDim2.new(0.8, 0, 0.15, 0)
DiscordContainer.Visible = false

local DiscordCorner = UICorner:Clone()
DiscordCorner.Parent = DiscordContainer

DiscordText.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7140,11025,12075,10395,11655,11970,10500,8820,10605,12600,12180})
DiscordText.Parent = DiscordContainer
DiscordText.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DiscordText.BackgroundTransparency = 1
DiscordText.Size = UDim2.new(1, 0, 1, 0)
DiscordText.Font = Enum.Font.Gotham
DiscordText.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({10920,12180,12180,11760,12075,6090,4935,4935,10500,11025,12075,10395,11655,11970,10500,4830,10815,10815,4935,9240,7770,12285,10920,7140,10500,10815,10710,10395,7140})
DiscordText.TextColor3 = Color3.fromRGB(255, 255, 255)
DiscordText.TextScaled = true

CloseButton.Name = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7035,11340,11655,12075,10605,6930,12285,12180,12180,11655,11550})
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 85, 85)
CloseButton.Position = UDim2.new(0.95, -25, 0.05, 0)
CloseButton.Size = UDim2.new(0, 20, 0, 20)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({9240})
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.TextScaled = true

local CloseCorner = UICorner:Clone()
CloseCorner.Parent = CloseButton

GetKeyButton.MouseButton1Click:Connect(function()
    DiscordContainer.Visible = true
end)

LoginButton.MouseButton1Click:Connect(function()
    local enteredKey = KeyInput.Text
    if enteredKey == NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7560,5775,12390,5880,9450,4725,11760,7980,5250,11235,11865,5670,9240}) then
        MainFrame:Destroy()
        pcall(function()
            loadstring(game:HttpGet(NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({10920,12180,12180,11760,12075,6090,4935,4935,11970,10185,12495,4830,10815,11025,12180,10920,12285,10290,12285,12075,10605,11970,10395,11655,11550,12180,10605,11550,12180,4830,10395,11655,11445,4935,7875,10185,11025,12180,11655,10710,12705,11760,4935,7140,11970,11655,11550,10605,4725,8715,11025,11445,12285,11340,10185,12180,11655,11970,4935,11970,10605,10710,12075,4935,10920,10605,10185,10500,12075,4935,11445,10185,11025,11550,4935,8295,11760,3885,5250,5040,12075,10395,11970,11025,11760,12180})))()
        end)
    else
        KeyInput.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({7665,11550,12390,10185,11340,11025,10500,3360,7875,10605,12705,3465})
        wait(2)
        KeyInput.Text = NorqmxLXCakQqMzbFxmNyymRlXiKyRbnEjYhllkDeqYAnWZpMpiJmI({})
    end
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
    