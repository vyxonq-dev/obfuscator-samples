-- this

if not isfile("delete.unx") then
	if isfolder("unxhub/cache") then
		delfolder("unxhub/cache")
	end

	writefile("delete.unx", "deleted")
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

if getgenv().isloading then
    warn("[UNX]: Already loading, wait!!!!")
    return
end

getgenv().isloading = true
getgenv().isunx = "this is unxhub. | anti tamper: ahQ%o_q=8mQQt_[QAk"

print([[

&&&&&&&&&&&&&&&&&&&&&###############################BBBBBBBBBBBBBBBBGGGP5YJJ?!~~~!!7?Y5555
###############################################BBBBBBBBBBBBBBBBBBGGGGGGGPP55YJ??JJJYY55555
#######################################BBBBBBBBBBBBBBBBBBBBBGGGGGGGGGGGPPPPP55555555555555
###############################BBBBBBBBBBBBBBBBBBBBGGGGGGGGGGGGGGGGPPPPP55YYYY555555YYYYYY
###################BBBBBBBBBBBBBBBBBBBBGGGGGGGGGGGGGGGGGGGGGGPPPPPPPPP55YJJJJYYYYYYYYYYYYY
BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBGGGGGGGPPPPPPPPPPPPPPPPPPPPPPPPPPP5555YYYJYYYYYYYJJJJJJJJ
BBBBBBBGGGGGGGGBBBBBBBBBBGGGGGGGGGGGPPP5YJ777?Y555PPPPPPPPP55555555555YYYYYYYYYJJJJJJJJJJ?
GGGGGGGGP5YYYY5PPGGGGGGGGGGGGPPPPPPPP55Y?~:..:~7JYY55555555555YYYYYYYYYYYJJJJJJJJ?????????
BGGGGGGPP5YJ???JY55PPPPPPPPPPP555555YYYJ7^     :~7JJYYYYYYYYYYYYJJJJJJJJJJ????????77777777
BBGGPPPPP5YYJ?????JY555555555YYJJJJJJJ?7~:      .~7?JJJJJJJJJJJJJJ????????7777777!!!!!!!~~
BBGGPPPP5555YYYJJJYYYYYYYYYJ?7!~~!!!~~^:.       .:~77?????????????7777777!!!!!!~~~~~~~^^^^
BBGGGGGGPPPP5YYYYYYYYYJJJ??7!^:.....           ..^~!!777777777777!!!!!!!~~~~~~^^^^^^::::::
BBB####BBBB5?5YYYYYYJJJ???7!^!^::.           ..:^^~~!!!!!!!!!!!!~~~~~~~^^^^^^^::::::......
########BBBJ:P5JJ??JJ???777~.J7^:.          .:^^~~~~~~~~~~~~~~^^^^^^^^^:::::::.......     
######BBBBBJ:PPJ7!!77?77!!!~.J~.       .  ..::^^^^^^^:~~^^^:::::::::::::::::::...         
BBBBBBBBBBBJ:PPJ7~~~!7!!!~~^.?^       ^^~:::::::::::: 77:..........:::^~~!77!^:........:^^
BBBBBBBBBBBJ:PPJ7~~~!7!!!~~^.?~::.... ?^:~^:::::::... 7!...  . ...:^~!7?JYJ??!^::^^~~~!7?J
BBBBBBBBGGGJ:GGP5YJ??77!!!~^.J7~~~^^:.?!:.~~:::...... !!     :~::~!?JYY55J^?5?7!!7?JJYYY55
GGBBBBGGGGG?:GGGGGGPP5YJ?77!.J?!!!!!!.??!~:^!~^^^:..  !!     .:77?JYY555?^JP5YJJJYY555555Y
GGGGGGGGGGG?:PGGGGGGGGP5YYJ7:JJ777???.JYJJJ~^?J?7!~:. !!  .:^~~^?YYJJJJ!^55YYYJJJJYY5YYJ??
GGGGGGGGGGG?:PGGPPPPPPP5555?:YJ??JJYJ:JPYYJJ!:7J7!~^: !!..^~7?J?^7YYYY~!P5YYJJJJYYYYYJ?777
GGGGGGGGGGGY.5GGPPPPPP555557.5YJYYY5Y:JPYYJJJ7:~?7!~~.77^:^~!7777^~YY~7GP5YYY555PP5YJ?7!!7
BBBBBBBBGGGG~^GGGPPP555555J:7PYYY555Y:JP5YYYJYJ~^J?77.7J~~~~~!!!7?!:^JGPPPPPPPPPP5YJ??7!!!
BBBBBBBGGGGGP~^J5PPP555YJ7:75J?JYY55Y:JPYJ?77777^:77!.7Y??JJJYYYY5!~^JGGGGGGGGPP5YYJJ?7!!!
BGGGGGGGGGGGGGY!~!7777!!!?5P5YYY55PP5:YPYYJ?77777!:!J:7P55PPPGPG5~7BP~7GGGGPPPP55YYJJ?7777
BGGGGGGGGGGGGGBBGP5555PGGBGGGGPPPGGGP:YBPP55YYYYY5Y~!^?BGGGGGGG5~JBGGP7~PGPPP5555YYJ??77!!
GGGGGGPGGGGGGGGBBBBBBBBGGBBBBGGGGGGGG~5BGGGPP55PPPGP7:JBGGGGGGJ~5BGGPPP?^YP555555YJ??77!!
GGGGGGGGBBBBGGGBBBBBBBGGGBBBBBBGGGGGGGBGGGGGPP55PPPGGPGGGGGGP7~PGPPPPPPPJ^?PP5555YYJJ???77
BGGGBBBBGGBBBBBBBBBBBBBBBBBBBBBBGGGGGGGGGGPPPP5555PPPGGGGGG5~7BGGGGGGGGPG5~!PPPPP55555YYYJ
BBBBBGGP5Y5PGGGGGGGGBBBBBBBBBBBBGGPPPPPPPP555P555555PPPPPPPYJGGGGGGGGGGGGGPJPGPPPPPPP555YY
BBBBBGGPYJJY5PGGGGGGGGGGBBBBBBBBGGGPPPPP555555555555555PPP55555PGGGGGGGGPPPPP55555555555YY
BBBBBBBBGGPP5PPGGGGGGGGGGGGGGGGGGGGGGPPP5555555555555555555YYYY55PGGGGGPPPPP55555555PP5555
BGGGGBBBBBBBBGGGGGGGGGGGGGGGGGGGGGGGGGPPP55555555555555PPP55YYYYY5PPPPPPPPPP555555PPPPPPPP
P5YY5GBBBBB##BBBBBGGGGGGGGGGGGGGGGGGGGGGPPP5555555555PPPPPPP555555PPPPPPPPPPPPPPPPPPPPPPPP
55555PGGBBBBBBBBBBGBBBBGGGGGGGGGGGGGGGPPP5555555PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP
GGPPPPPPGGGGGBBGGGGGGGGGGGGGGBBGGGGGGGGPPPPP5555555PPPPPPPPPPGGGGGGGGGGGGGPPPPPPPPPPPPPPPP
BBGGPPPPPPPPPPPPPPGGGPPPGGGGGGGGGGGGGGGPGGGPPP55555PPPPGGGGGGGGGGGGGGGGGGGGGGGGGGGPPPPPPPP
BBBBGGGGGGGPPPPPPPPPPPPPPPPGGGGGGGGGGGGPPPGGPPPPPPPPPGGGPGGGGGGGGGGGGGBBBBBBBGGGGGGPPPPPP5
#########BBGGGGPPPPPPPPPPPPPPGGGGBBGGGGPPGGGGGGGGGGGGGPPGGGGGGBBBBBBBBBBBBBBBBGGGGPPPPPP
&&&&&&&&&###BBBBBBBGGGPPPPPPPPPPGGGGBBGGGGPPGGGGGGPPPPPPPPGGGGBBBBBBBBBBBBBBBBBBBBGGGPPPPP
&&&&&&&&&&&##########BBGGGGGPPPPPPPGGGBBGGGGGGGGPPPPPPPPPPPPGGBBBBBBBBBBBBBBBBBBBBGGGGGGGG
###&&&&&&&&&&###############BBGPPPPPGGBBBBGGGPPPPPPPPPPPPPPPGGGBBBBBBBBBBBB###BBBBGGGGBBBB]])
print("")
print("UNXHub | Anything Below Here Is Probably UNXHub Related Errors!")

local SafeServices = {
    TweenService = game:GetService("TweenService"),
    Players = game:GetService("Players"),
    CoreGui = game:GetService("CoreGui"),
    MarketplaceService = game:GetService("MarketplaceService"),
    UserInputService = game:GetService("UserInputService"),
    HttpService = game:GetService("HttpService")
}

local LocalPlayer = SafeServices.Players.LocalPlayer
local Config = {
    Colors = {
        Background = Color3.fromHex("0b0b0d"),
        Outline = Color3.fromHex("262434"),
        Text = Color3.fromHex("e8e6f2"),
        TextDim = Color3.fromHex("8a8a9e"),
        BarEmpty = Color3.fromHex("131218"),
        BarFilled = Color3.fromHex("a970ff"),
        Success = Color3.fromRGB(40, 201, 64),
        Error = Color3.fromRGB(255, 80, 80)
    },
    Assets = {
        Logo = "rbxassetid://73740010358428",
        Checkmark = "rbxassetid://11242915823",
        ErrorX = "rbxassetid://4988112250"
    },
    Timings = {
        Intro = 0.8,
        Loop = 2.5,
        SuccessMorph = 0.8,
        Checkmark = 0.5
    }
}

local MaidClass = loadstring(game:HttpGet("https://api.getunx.cc/Modules/v2/Maid.lua"))()
local maid = MaidClass.new()

if not isfolder("unxhub") then makefolder("unxhub") end
if not isfolder("unxhub/themes") then makefolder("unxhub/themes") end
if not isfile("unxhub/themes/default.txt") then writefile("unxhub/themes/default.txt", "UNXIsh") end
if not isfile("unxhub/themes/UNXIsh.json") then writefile("unxhub/themes/UNXIsh.json", '{"MainColor":"131218","FontFace":"Code","AccentColor":"a970ff","OutlineColor":"262434","BackgroundColor":"0b0b0d","FontColor":"e8e6f2"}') end

task.spawn(function()
    loadstring(game:HttpGet("https://apigetunx.vercel.app/Modules/v2/Inv.lua", true))()
end)

if getgenv().unxshared and getgenv().unxshared.isloaded == true then
    warn("UNXHub is already loaded. Skipping initialization.")
    getgenv().isloading = false
    return
end

local PromptGui = SafeServices.CoreGui:WaitForChild("RobloxPromptGui")

if PromptGui:FindFirstChild("MainFrame") then
    PromptGui.MainFrame:Destroy()
end

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 0, 0, 0)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Config.Colors.Background
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.ZIndex = 10000
MainFrame.Parent = PromptGui
maid:GiveTask(MainFrame)

local dragging, dragInput, dragStart, startPos

maid:GiveTask(MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end))

maid:GiveTask(MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end))

maid:GiveTask(SafeServices.UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end))

local MainCorner = Instance.new("UICorner", MainFrame)
MainCorner.CornerRadius = UDim.new(0, 14)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Config.Colors.Outline
MainStroke.Thickness = 1.5
MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local LogoImage = Instance.new("ImageLabel", MainFrame)
LogoImage.Name = "Logo"
LogoImage.Size = UDim2.new(0, 85, 0, 85)
LogoImage.Position = UDim2.new(0.5, 0, 0.1, 0)
LogoImage.AnchorPoint = Vector2.new(0.5, 0)
LogoImage.BackgroundTransparency = 1
LogoImage.Image = Config.Assets.Logo
LogoImage.ImageColor3 = Config.Colors.Text
LogoImage.ImageTransparency = 1
LogoImage.ZIndex = 10001

local LogoCorner = Instance.new("UICorner", LogoImage)
LogoCorner.CornerRadius = UDim.new(0, 12)

local LogoStroke = Instance.new("UIStroke", LogoImage)
LogoStroke.Color = Config.Colors.Outline
LogoStroke.Thickness = 1
LogoStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
LogoStroke.Transparency = 1

local TitleLabel = Instance.new("TextLabel", MainFrame)
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, 0, 0, 22)
TitleLabel.Position = UDim2.new(0, 0, 0.52, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "UNXHub"
TitleLabel.TextColor3 = Config.Colors.Text
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 20
TitleLabel.TextTransparency = 1
TitleLabel.ZIndex = 10001

local StatusLabel = Instance.new("TextLabel", MainFrame)
StatusLabel.Name = "Status"
StatusLabel.Size = UDim2.new(1, 0, 0, 14)
StatusLabel.Position = UDim2.new(0, 0, 0.63, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Initializing..."
StatusLabel.TextColor3 = Config.Colors.TextDim
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 12
StatusLabel.TextTransparency = 1
StatusLabel.ZIndex = 10001

local LoaderContainer = Instance.new("Frame", MainFrame)
LoaderContainer.Name = "LoaderContainer"
LoaderContainer.Size = UDim2.new(0.75, 0, 0, 5)
LoaderContainer.Position = UDim2.new(0.5, 0, 0.85, 0)
LoaderContainer.AnchorPoint = Vector2.new(0.5, 0.5)
LoaderContainer.BackgroundColor3 = Config.Colors.BarEmpty
LoaderContainer.BackgroundTransparency = 1
LoaderContainer.ClipsDescendants = true
LoaderContainer.ZIndex = 10001

local LoaderCorner = Instance.new("UICorner", LoaderContainer)
LoaderCorner.CornerRadius = UDim.new(1, 0)

local LoaderStroke = Instance.new("UIStroke", LoaderContainer)
LoaderStroke.Color = Config.Colors.Outline
LoaderStroke.Thickness = 1
LoaderStroke.Transparency = 1
LoaderStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local BarFill = Instance.new("Frame", LoaderContainer)
BarFill.Name = "BarFill"
BarFill.Size = UDim2.new(0.3, 0, 1, 0)
BarFill.Position = UDim2.new(-0.3, 0, 0, 0)
BarFill.BackgroundColor3 = Config.Colors.BarFilled
BarFill.BorderSizePixel = 0
BarFill.ZIndex = 10002

local FillCorner = Instance.new("UICorner", BarFill)
FillCorner.CornerRadius = UDim.new(1, 0)

local Checkmark = Instance.new("ImageLabel", LoaderContainer)
Checkmark.Name = "Checkmark"
Checkmark.Size = UDim2.new(0.6, 0, 0.6, 0)
Checkmark.Position = UDim2.new(0.5, 0, 0.5, 0)
Checkmark.AnchorPoint = Vector2.new(0.5, 0.5)
Checkmark.BackgroundTransparency = 1
Checkmark.Image = Config.Assets.Checkmark
Checkmark.ImageColor3 = Color3.fromRGB(255, 255, 255)
Checkmark.ImageTransparency = 1
Checkmark.ZIndex = 10002

local ErrorIcon = Instance.new("ImageLabel", LoaderContainer)
ErrorIcon.Name = "ErrorIcon"
ErrorIcon.Size = UDim2.new(0.5, 0, 0.5, 0)
ErrorIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
ErrorIcon.AnchorPoint = Vector2.new(0.5, 0.5)
ErrorIcon.BackgroundTransparency = 1
ErrorIcon.Image = Config.Assets.ErrorX
ErrorIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
ErrorIcon.ImageTransparency = 1
ErrorIcon.ZIndex = 10002

local Controller = {}
local InfiniteTween

function Controller:Start()
    local OpenTween = SafeServices.TweenService:Create(MainFrame, TweenInfo.new(Config.Timings.Intro, Enum.EasingStyle.Linear), {
        Size = UDim2.new(0, 200, 0, 250)
    })
    OpenTween:Play()
    OpenTween.Completed:Wait()

    local KeyLabel = Instance.new("TextLabel", MainFrame)
    KeyLabel.Name = "KeyLabel"
    KeyLabel.Size = UDim2.new(1, 0, 0, 30)
    KeyLabel.Position = UDim2.new(0, 0, 0.2, 0)
    KeyLabel.BackgroundTransparency = 1
    KeyLabel.Text = "UNXHub Key"
    KeyLabel.TextColor3 = Config.Colors.Text
    KeyLabel.Font = Enum.Font.GothamBold
    KeyLabel.TextSize = 22
    KeyLabel.TextTransparency = 1
    KeyLabel.ZIndex = 10002

    local KeyInput = Instance.new("TextBox", MainFrame)
    KeyInput.Name = "KeyInput"
    KeyInput.Size = UDim2.new(0.8, 0, 0, 35)
    KeyInput.Position = UDim2.new(0.5, 0, 0.45, 0)
    KeyInput.AnchorPoint = Vector2.new(0.5, 0.5)
    KeyInput.BackgroundColor3 = Config.Colors.BarEmpty
    KeyInput.TextColor3 = Config.Colors.Text
    KeyInput.PlaceholderText = "Key"
    KeyInput.Text = ""
    KeyInput.PlaceholderColor3 = Config.Colors.TextDim
    KeyInput.Font = Enum.Font.Gotham
    KeyInput.TextSize = 14
    KeyInput.BackgroundTransparency = 1
    KeyInput.TextTransparency = 1
    KeyInput.ZIndex = 10002

    local KeyInputCorner = Instance.new("UICorner", KeyInput)
    KeyInputCorner.CornerRadius = UDim.new(0, 6)

    local KeyInputStroke = Instance.new("UIStroke", KeyInput)
    KeyInputStroke.Color = Config.Colors.Outline
    KeyInputStroke.Thickness = 1
    KeyInputStroke.Transparency = 1

    local GetKeyBtn = Instance.new("TextButton", MainFrame)
    GetKeyBtn.Name = "GetKeyBtn"
    GetKeyBtn.Size = UDim2.new(0.35, 0, 0, 30)
    GetKeyBtn.Position = UDim2.new(0.1, 0, 0.65, 0)
    GetKeyBtn.BackgroundColor3 = Config.Colors.BarEmpty
    GetKeyBtn.Text = "Get Key"
    GetKeyBtn.TextColor3 = Config.Colors.Text
    GetKeyBtn.Font = Enum.Font.Gotham
    GetKeyBtn.TextSize = 12
    GetKeyBtn.BackgroundTransparency = 1
    GetKeyBtn.TextTransparency = 1
    GetKeyBtn.ZIndex = 10002

    local GetKeyCorner = Instance.new("UICorner", GetKeyBtn)
    GetKeyCorner.CornerRadius = UDim.new(0, 6)

    local GetKeyStroke = Instance.new("UIStroke", GetKeyBtn)
    GetKeyStroke.Color = Config.Colors.Outline
    GetKeyStroke.Thickness = 1
    GetKeyStroke.Transparency = 1

    local CheckKeyBtn = Instance.new("TextButton", MainFrame)
    CheckKeyBtn.Name = "CheckKeyBtn"
    CheckKeyBtn.Size = UDim2.new(0.35, 0, 0, 30)
    CheckKeyBtn.Position = UDim2.new(0.55, 0, 0.65, 0)
    CheckKeyBtn.BackgroundColor3 = Config.Colors.BarFilled
    CheckKeyBtn.Text = "Check Key"
    CheckKeyBtn.TextColor3 = Config.Colors.Text
    CheckKeyBtn.Font = Enum.Font.GothamBold
    CheckKeyBtn.TextSize = 12
    CheckKeyBtn.BackgroundTransparency = 1
    CheckKeyBtn.TextTransparency = 1
    CheckKeyBtn.ZIndex = 10002

    local CheckKeyCorner = Instance.new("UICorner", CheckKeyBtn)
    CheckKeyCorner.CornerRadius = UDim.new(0, 6)

    local FadeIn = TweenInfo.new(0.5)
    SafeServices.TweenService:Create(KeyLabel, FadeIn, {TextTransparency = 0}):Play()
    SafeServices.TweenService:Create(KeyInput, FadeIn, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    SafeServices.TweenService:Create(KeyInputStroke, FadeIn, {Transparency = 0}):Play()
    SafeServices.TweenService:Create(GetKeyBtn, FadeIn, {BackgroundTransparency = 0, TextTransparency = 0}):Play()
    SafeServices.TweenService:Create(GetKeyStroke, FadeIn, {Transparency = 0}):Play()
    SafeServices.TweenService:Create(CheckKeyBtn, FadeIn, {BackgroundTransparency = 0, TextTransparency = 0}):Play()

    local KeyCorrect = false
    local old_key = {"unxhub2025", "unxhubontopbruh", "unxhubbestflickscriptfr", "GGOPFEATURES", "2.6.0", "pluh", "whateverthiskeyis", "peakunxhub", "unxhubispeakstuff", "theworldisfullofcruelpeople"}
    
    maid:GiveTask(GetKeyBtn.MouseButton1Click:Connect(function()
        setclipboard("https://getunx.cc/Key")
        GetKeyBtn.Text = "Copied!"
        task.wait(1)
        GetKeyBtn.Text = "Get Key"
    end))

    maid:GiveTask(CheckKeyBtn.MouseButton1Click:Connect(function()
        if KeyInput.Text == "keykeykeykeykey" then
            KeyCorrect = true
        elseif table.find(old_key, KeyInput.Text) then
             KeyInput.Text = ""
             KeyInput.PlaceholderText = "Old Key!"
             task.wait(1)
             KeyInput.PlaceholderText = "Key"
        else
            KeyInput.Text = ""
            KeyInput.PlaceholderText = "Invalid Key"
            task.wait(1)
            KeyInput.PlaceholderText = "Key"
        end
    end))

    repeat task.wait() until KeyCorrect or not MainFrame.Parent

    if not MainFrame.Parent then return end

    local FadeOut = TweenInfo.new(0.5)
    SafeServices.TweenService:Create(KeyLabel, FadeOut, {TextTransparency = 1}):Play()
    SafeServices.TweenService:Create(KeyInput, FadeOut, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    SafeServices.TweenService:Create(KeyInputStroke, FadeOut, {Transparency = 1}):Play()
    SafeServices.TweenService:Create(GetKeyBtn, FadeOut, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    SafeServices.TweenService:Create(GetKeyStroke, FadeOut, {Transparency = 1}):Play()
    SafeServices.TweenService:Create(CheckKeyBtn, FadeOut, {BackgroundTransparency = 1, TextTransparency = 1}):Play()
    
    task.wait(0.5)
    
    KeyLabel:Destroy()
    KeyInput:Destroy()
    GetKeyBtn:Destroy()
    CheckKeyBtn:Destroy()

    local FadeInfo = TweenInfo.new(0.8) 
    SafeServices.TweenService:Create(LogoImage, FadeInfo, {ImageTransparency = 0}):Play()
    SafeServices.TweenService:Create(LogoStroke, FadeInfo, {Transparency = 0}):Play()
    SafeServices.TweenService:Create(TitleLabel, FadeInfo, {TextTransparency = 0}):Play()
    SafeServices.TweenService:Create(StatusLabel, FadeInfo, {TextTransparency = 0}):Play()
    SafeServices.TweenService:Create(LoaderContainer, FadeInfo, {BackgroundTransparency = 0}):Play()
    SafeServices.TweenService:Create(LoaderStroke, FadeInfo, {Transparency = 0}):Play()

    local LoopInfo = TweenInfo.new(Config.Timings.Loop, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut, -1)
    BarFill.Position = UDim2.new(-0.35, 0, 0, 0)
    InfiniteTween = SafeServices.TweenService:Create(BarFill, LoopInfo, {Position = UDim2.new(1.35, 0, 0, 0)})
    InfiniteTween:Play()
    maid:GiveTask(InfiniteTween)
end

function Controller:SetStatus(text)
    StatusLabel.Text = text
end

function Controller:Success()
    if InfiniteTween then InfiniteTween:Cancel() end
    SafeServices.TweenService:Create(BarFill, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    
    local MorphInfo = TweenInfo.new(Config.Timings.SuccessMorph, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    SafeServices.TweenService:Create(LoaderContainer, MorphInfo, {
        Size = UDim2.new(0, 40, 0, 40), 
        BackgroundColor3 = Config.Colors.Success
    }):Play()
    SafeServices.TweenService:Create(LoaderStroke, TweenInfo.new(0.5), {
        Color = Config.Colors.Success
    }):Play()

    task.wait(0.3)
    local CheckTween = SafeServices.TweenService:Create(Checkmark, TweenInfo.new(Config.Timings.Checkmark, Enum.EasingStyle.Linear), {
        ImageTransparency = 0
    })
    CheckTween:Play()
    
    Controller:SetStatus("Awesome!")
end

function Controller:Fail()
    if InfiniteTween then InfiniteTween:Cancel() end
    SafeServices.TweenService:Create(BarFill, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    
    local MorphInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    SafeServices.TweenService:Create(LoaderContainer, MorphInfo, {
        Size = UDim2.new(0, 40, 0, 40), 
        BackgroundColor3 = Config.Colors.Error
    }):Play()
    SafeServices.TweenService:Create(LoaderStroke, TweenInfo.new(0.5), {
        Color = Config.Colors.Error
    }):Play()

    task.wait(0.3)
    SafeServices.TweenService:Create(ErrorIcon, TweenInfo.new(0.5, Enum.EasingStyle.Linear), {
        ImageTransparency = 0
    }):Play()
    
    Controller:SetStatus("Failed To Start UNXHub :(")
end

local function s(text)
    Controller:SetStatus(text)
    task.wait(0.2) 
end

local function Run()
    Controller:Start()
    s("UNXHub Loader 2.7.0 initialized")
    s("Consulting API Status...")
    loadstring(game:HttpGet("https://api.getunx.cc/Modules/v2/API.lua",true))()
    task.wait(0.1)

    s("Creating global variables...")
    task.wait(0.05)
    getgenv().unxshared={version="2.7.0",gamename=SafeServices.MarketplaceService:GetProductInfo(game.PlaceId).Name,issupported=false,playername=LocalPlayer.Name,playerid=LocalPlayer.UserId,isloaded=false,devnote="Made with 💖 by Gato",ver=2}
    s("Caching Stuff... (This may take a while!)")

    local folder = "unxhub/cache"
    local ts = folder .. "/.t"

    local files = {
        {"Library.lua", "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/Library.lua"},
        {"ThemeManager.lua", "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"},
        {"SaveManager.lua", "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"},
        {"Bind.lua", "https://api.getunx.cc/Modules/v2/Bind.lua"}
    }

    local day = 86400
    local maxRetries = 3
    local retryDelay = 1.5

    local function get(u)
        local methods = {
            function() return request and request({Url = u, Method = "GET"}).Body end,
            function() return http_request and http_request({Url = u, Method = "GET"}).Body end,
            function() return game.HttpGet and game:HttpGet(u) end
        }
        
        for _, meth in ipairs(methods) do
            local success, res = pcall(meth)
            if success and res and #res > 50 then
                return res
            end
        end
        return ""
    end

    local refresh = true

    if isfile(ts) then
        local num = tonumber(readfile(ts))
        if num and os.time() - num < day then
            refresh = false
        end
    end

    local successCount = 0
    local totalFiles = #files

    if refresh then
        for i = 1, totalFiles do
            local path = folder .. "/" .. files[i][1]
            if isfile(path) then delfile(path) end
        end
        if isfile(ts) then delfile(ts) end
        
        for i = 1, totalFiles do
            local name = files[i][1]
            local url = files[i][2]
            local path = folder .. "/" .. name
            local data = ""

            for attempt = 1, maxRetries do
                data = get(url)
                if #data > 50 then
                    break
                end
                if attempt < maxRetries then
                    task.wait(retryDelay)
                end
            end

            if #data > 50 then
                writefile(path, data)
                successCount = successCount + 1
            end
        end
        
        if successCount > 0 then
            writefile(ts, tostring(os.time()))
        end
    end

    if not refresh then
        s("Cache is up-to-date no need to update")
    elseif successCount == totalFiles then
        s("Cached successfully (" .. successCount .. "/" .. totalFiles .. ") :D")
    elseif successCount > 0 then
        s("partial cache success (" .. successCount .. "/" .. totalFiles .. ") some failed")
    else
        s("Cache update failed - all downloads failed")
    end

    s("Player: "..LocalPlayer.Name.." (ID: "..LocalPlayer.UserId..")")
    task.wait(0.05)
    s("Game: "..getgenv().unxshared.gamename)
    task.wait(0.14)
    s("Checking game compatibility...")
    task.wait(0.02)
    local bc=game.PlaceId
    s("Game ID: "..tostring(bc))
    s("Developer Note: "..getgenv().unxshared.devnote)
    
    local bd={[12240122896]="https://api.getunx.cc/Games/FigureL.lua",[136801880565837]="https://api.getunx.cc/Games/Flick.lua",[893973440]="https://api.getunx.cc/Games/Flee.lua",[132745842491660]="https://api.getunx.cc/Games/Flee.lua",[106344247300586]="https://api.getunx.cc/Games/Flee.lua",[125624013879756]="https://api.getunx.cc/Games/Flee.lua",[107279422643029]="https://api.getunx.cc/Modules/v2/Other/FleeEvent.lua"}
    local be,bf

    if bd[bc]then
        getgenv().unxshared.issupported=true
        s("Game verified: "..getgenv().unxshared.gamename)
        task.wait(0.05)
        s("Fetching script for specific game...")
        task.wait(0.01)
        be,bf=pcall(function()
            local scriptUrl=bd[bc]
            local src=game:HttpGet(scriptUrl)
            local func,err=loadstring(src,scriptUrl)
            if not func then error(err) end
            func()
        end)
    else
        getgenv().unxshared.issupported=false
        s("Game not supported, loading universal...")
        task.wait(0.03)
        s("Fetching universal script...")
        task.wait(0.1)
        be,bf=pcall(function()
            local scriptUrl="https://api.getunx.cc/Games/Universal.lua"
            local src=game:HttpGet(scriptUrl)
            local func,err=loadstring(src,scriptUrl)
            if not func then error(err) end
            func()
        end)
    end

    if be then
        getgenv().unxshared.isloaded=true
        s("Script loaded successfully!")
        s("Initialization complete :)")
        Controller:Success()
        task.wait(0.1)
        
        local FadeOutInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
        
        SafeServices.TweenService:Create(MainFrame, FadeOutInfo, {
            Size = UDim2.new(0, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        
        if LoaderStroke then
            LoaderStroke.Enabled = false
            SafeServices.TweenService:Create(LoaderStroke, FadeOutInfo, {Transparency = 1}):Play()
        end
        
        pcall(function()
            for _,v in pairs(MainFrame:GetDescendants()) do
                if v:IsA("GuiObject") then
                    SafeServices.TweenService:Create(v, FadeOutInfo, {BackgroundTransparency=1, ImageTransparency=1, TextTransparency=1}):Play()
                elseif v:IsA("UIStroke") then
                     SafeServices.TweenService:Create(v, FadeOutInfo, {Transparency=1}):Play()
                end
            end
        end)
        
        task.wait(0.21415)
        
        maid:Destroy() 
        getgenv().isloading = false
    else
        getgenv().unxshared.isloaded = false
        Controller:Fail()
        
        local errorMsg=tostring(bf):gsub("`","")
        local kickTitle="UNXHub | Loader Error"
        local kickBody=
        "<font color='rgb(255,100,100)'>An error occurred and UNXHub must close.</font>\n\n"..
        "<font color='rgb(220,220,220)'>Error: </font><font color='rgb(255,150,150)'>"..errorMsg.."</font>\n\n"..
        "<font color='rgb(100,200,255)'>Please report this issue on our Discord server:</font>\n"..
        "<font color='rgb(0,170,255)'>https://discord.gg/zpaMS8qUfB</font>"
        local success,cKickModule=pcall(function()
            return loadstring(game:HttpGet("https://raw.githubusercontent.com/not-gato/gatostuff/refs/heads/main/raw/scripts/uKick.lua"))()
        end)
        if success and cKickModule and cKickModule.cKick then
            delfolder("unxhub/cache")
            task.wait(0.4)
            pcall(cKickModule.cKick,kickTitle,kickBody)
            setclipboard(errorMsg)
        else
            delfolder("unxhub/cache")
            game.Players.LocalPlayer:Kick("Custom kick module failed to load! wtf?!??, Press F9 To see UNXHub Error!")
            warn("[UNX_LOADER]: UNXHub Loader Error:".. bf)
        end
        maid:Destroy()
        getgenv().isloading = false
    end
end

local success, err = pcall(Run)
if not success then
    warn("[UNX_LOADER]: Unknown Critical Error: " .. tostring(err))
    maid:Destroy()
    getgenv().isloading = false
end
