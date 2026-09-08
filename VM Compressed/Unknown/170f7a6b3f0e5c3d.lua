local requests = request or http_request or syn.request
local Code = "9G8p7Ty3Ue"

if requests then
    local json = {
        ["cmd"] = "INVITE_BROWSER",
        ["args"] = {["code"] = Code},
        ["nonce"] = 'a'
    }
    task.spawn(function()
        requests({
            Url = 'http://127.0.0.1:6463/rpc?v=1',
            Method = 'POST',
            Headers = {
                ['Content-Type'] = 'application/json',
                ['Origin'] = 'https://discord.com'
            },
            Body = game:GetService('HttpService'):JSONEncode(json)
        })
    end)
end
if setclipboard then
    setclipboard("https://discord.gg/"..Code)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Discord",
        Text = "Copied Discord invite to clipboard!"
    })
end
local RealZzHub = Instance.new("ScreenGui")
RealZzHub.Name = "RealZzHub"
RealZzHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

if syn and syn.protect_gui then
    syn.protect_gui(RealZzHub)
    RealZzHub.Parent = game.CoreGui
elseif gethui then
    RealZzHub.Parent = gethui()
else
    RealZzHub.Parent = game.CoreGui
end

local MainBackground = Instance.new("ImageLabel")
local Logo = Instance.new("ImageButton")
local Name = Instance.new("TextLabel")
local InjectButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Version = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")

MainBackground.Name = "MainBackground"
MainBackground.Parent = RealZzHub
MainBackground.AnchorPoint = Vector2.new(0.5, 0.5)
MainBackground.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainBackground.BorderSizePixel = 0
MainBackground.Position = UDim2.new(0.5, 0, 0.5, 0)
MainBackground.Size = UDim2.new(0, 1, 0, 1)
MainBackground.Image = "rbxassetid://7877641241"
MainBackground.Visible = false

Logo.Name = "Logo"
Logo.Parent = MainBackground
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.BorderSizePixel = 0
Logo.Position = UDim2.new(0, 6, 0, 6)
Logo.Size = UDim2.new(0, 25, 0, 25)
Logo.Image = "rbxassetid://6771656595"
Logo.Visible = false

Name.Name = "Name"
Name.Parent = MainBackground
Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Name.BackgroundTransparency = 1.000
Name.BorderSizePixel = 0
Name.Position = UDim2.new(0.109999999, 0, 0.0399999991, 0)
Name.Size = UDim2.new(0, 78, 0, 25)
Name.Font = Enum.Font.Gotham
Name.Text = "RealZzHub V2"
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.TextSize = 15.000
Name.TextXAlignment = Enum.TextXAlignment.Left
Name.Visible = false

InjectButton.Name = "InjectButton"
InjectButton.Parent = MainBackground
InjectButton.BackgroundColor3 = Color3.fromRGB(38, 229, 255)
InjectButton.BorderColor3 = Color3.fromRGB(255, 255, 255)
InjectButton.Position = UDim2.new(0.10999994, 0, 0.336718529, 0)
InjectButton.Size = UDim2.new(0, 252, 0, 47)
InjectButton.Font = Enum.Font.Gotham
InjectButton.Text = "Waiting for game..."
InjectButton.TextColor3 = Color3.fromRGB(0, 0, 0)
InjectButton.TextScaled = true
InjectButton.TextSize = 1.000
InjectButton.TextWrapped = true
InjectButton.Visible = false

local Games = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/RealZzHub/MainV2/main/SupportedGames.json", true))
local isUniversal = false

if Games[tostring(game.GameId)] ~= nil then
    InjectButton.Text = Games[tostring(game.GameId)].Name
    path1 = Games[tostring(game.GameId)].Path
else
    InjectButton.Text = "Universal"
    isUniversal = true
end

UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = InjectButton

Version.Name = "Version"
Version.Parent = MainBackground
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.BorderSizePixel = 0
Version.Position = UDim2.new(0.26666683, 0, 0.860000014, 0)
Version.Size = UDim2.new(0, 227, 0, 21)
Version.Font = Enum.Font.Gotham
Version.Text = "Version: "..tostring(game:HttpGet("https://raw.githubusercontent.com/RealZzHub/MainV2/main/Misc/Version.txt"))
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextSize = 15.000
Version.TextXAlignment = Enum.TextXAlignment.Right
Version.Visible = false

CloseButton.Name = "CloseButton"
CloseButton.Parent = MainBackground
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1.000
CloseButton.Position = UDim2.new(0.927999973, 0, 0, -2)
CloseButton.Rotation = 45.000
CloseButton.Selectable = false
CloseButton.Size = UDim2.new(0, 25, 0, 25)
CloseButton.Font = Enum.Font.Gotham
CloseButton.Text = "+"
CloseButton.TextColor3 = Color3.fromRGB(30, 30, 30)
CloseButton.TextSize = 29.000
CloseButton.Visible = false

local ClickedNum = 0
local RenderStepped = game:GetService("RunService").RenderStepped:Connect(function()
    if RealZzHub and ClickedNum >= 5 then
        local Hue = tick() % 5 / 5
        local Color = Color3.fromHSV(Hue, 1, 1)
        Name.TextColor3 = Color
        Version.TextColor3 = Color
        InjectButton.TextColor3 = Color
    end
end)

function Close() 
    CloseButton.Visible = false
    InjectButton.Visible = false
    Name.Visible = false
    Logo.Visible = false
    Version.Visible = false
    RenderStepped:Disconnect()
    wait(0.2)
    MainBackground:TweenSize(UDim2.new(0, 1, 0, 1))	
    wait(0.8)
    MainBackground.Visible = false
    RealZzHub:Destroy()   
end

CloseButton.MouseButton1Down:Connect(Close)
Logo.MouseButton1Down:Connect(function()
    ClickedNum = ClickedNum + 1 -- Easter egg 😨
end)

InjectButton.MouseButton1Down:Connect(function()
	Close()
    if isUniversal then
        loadstring(game:HttpGet('https://raw.githubusercontent.com/RealZzHub/MainV2/main/Games/Universal.lua'))()
    else
        loadstring(game:HttpGet('https://raw.githubusercontent.com/RealZzHub/MainV2/main/Games/' .. path1))()
    end
end)

MainBackground.AnchorPoint = Vector2.new(0.5, 0.5)
MainBackground.Position = UDim2.new(0.5, 0, 0.5, 0)	
MainBackground.Visible = true	
wait(0.8)	
MainBackground:TweenSize(UDim2.new(0, 318, 0, 150))	
wait(1)	
CloseButton.Visible = true
InjectButton.Visible = true
Name.Visible = true
Logo.Visible = true
Version.Visible = true
