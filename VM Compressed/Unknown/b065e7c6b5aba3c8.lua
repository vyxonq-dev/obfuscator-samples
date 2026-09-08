game:GetService("StarterGui"):SetCore("SendNotification",{
    Title = "Fire X";
    Text = "Made by tyrel batutuy";
            })

wait(5)
local ScreenGui = Instance.new("ScreenGui")
local main = Instance.new("Frame")
local label = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Pageholder = Instance.new("Frame")
local Fe1 = Instance.new("TextButton")
local Fe2 = Instance.new("TextButton")
local Fe3 = Instance.new("TextButton")
local Net1 = Instance.new("TextButton")
local _2page = Instance.new("Frame")
local Creeper = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Smug = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Winged = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Car = Instance.new("TextButton")
local UICorner_4 = Instance.new("UICorner")
local Floppa = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local Parkour = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")
local Netpage = Instance.new("Frame")
local Net = Instance.new("TextButton")
local UICorner_7 = Instance.new("UICorner")
local _1page = Instance.new("Frame")
local Among = Instance.new("TextButton")
local UICorner_8 = Instance.new("UICorner")
local Neko = Instance.new("TextButton")
local UICorner_9 = Instance.new("UICorner")
local Son = Instance.new("TextButton")
local UICorner_10 = Instance.new("UICorner")
local Curse = Instance.new("TextButton")
local UICorner_11 = Instance.new("UICorner")
local Creep = Instance.new("TextButton")
local UICorner_12 = Instance.new("UICorner")
local Spider = Instance.new("TextButton")
local UICorner_13 = Instance.new("UICorner")
local _3page = Instance.new("Frame")
local Gale = Instance.new("TextButton")
local UICorner_14 = Instance.new("UICorner")
local Tall = Instance.new("TextButton")
local UICorner_15 = Instance.new("UICorner")
local Swim = Instance.new("TextButton")
local UICorner_16 = Instance.new("UICorner")
local Death = Instance.new("TextButton")
local UICorner_17 = Instance.new("UICorner")
local Walls = Instance.new("TextButton")
local UICorner_18 = Instance.new("UICorner")
local Mage = Instance.new("TextButton")
local UICorner_19 = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.Name = "main"
main.Parent = ScreenGui
main.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
main.Position = UDim2.new(0.0846354142, 0, 0.0711805373, 0)
main.Size = UDim2.new(0, 408, 0, 264)
main.Active = true
main.Draggable = true

label.Name = "label"
label.Parent = main
label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
label.BorderColor3 = Color3.fromRGB(0, 0, 0)
label.Size = UDim2.new(0, 408, 0, 24)

TextLabel.Parent = label
TextLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 24)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Fire X Hub (No Hat Version)"
TextLabel.TextColor3 = Color3.fromRGB(226, 147, 36)
TextLabel.TextSize = 15.000

Close.Name = "Close"
Close.Parent = label
Close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Close.BorderColor3 = Color3.fromRGB(0, 0, 0)
Close.Position = UDim2.new(0.941176474, 0, 0, 0)
Close.Size = UDim2.new(0, 24, 0, 24)
Close.Font = Enum.Font.SourceSans
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(226, 147, 36)
Close.TextSize = 28.000
Close.TextWrapped = true
Close.MouseButton1Click:Connect(function()
    main.Visible = false
end)

Pageholder.Name = "Pageholder"
Pageholder.Parent = main
Pageholder.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Pageholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
Pageholder.Position = UDim2.new(0, 0, 0.0909090936, 0)
Pageholder.Size = UDim2.new(0, 68, 0, 240)

Fe1.Name = "Fe1"
Fe1.Parent = Pageholder
Fe1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Fe1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fe1.Position = UDim2.new(0, 0, 0.0416666679, 0)
Fe1.Size = UDim2.new(0, 68, 0, 29)
Fe1.Font = Enum.Font.SourceSans
Fe1.Text = "Fe Scripts 1"
Fe1.TextColor3 = Color3.fromRGB(226, 147, 36)
Fe1.TextSize = 14.000
Fe1.MouseButton1Click:Connect(function()
    Netpage.Visible = false
    _2page.Visible = false
    _3page.Visible = false
    _1page.Visible = true
end)

Fe2.Name = "Fe2"
Fe2.Parent = Pageholder
Fe2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Fe2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fe2.Position = UDim2.new(0, 0, 0.1875, 0)
Fe2.Size = UDim2.new(0, 68, 0, 29)
Fe2.Font = Enum.Font.SourceSans
Fe2.Text = "Fe Scripts 2"
Fe2.TextColor3 = Color3.fromRGB(226, 147, 36)
Fe2.TextSize = 14.000
Fe2.MouseButton1Click:Connect(function()
    Netpage.Visible = false
    _2page.Visible = true
    _3page.Visible = false
    _1page.Visible = false
end)

Fe3.Name = "Fe3"
Fe3.Parent = Pageholder
Fe3.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Fe3.BorderColor3 = Color3.fromRGB(0, 0, 0)
Fe3.Position = UDim2.new(0, 0, 0.324999988, 0)
Fe3.Size = UDim2.new(0, 68, 0, 29)
Fe3.Font = Enum.Font.SourceSans
Fe3.Text = "Fe Scripts 3"
Fe3.TextColor3 = Color3.fromRGB(226, 147, 36)
Fe3.TextSize = 14.000
Fe3.MouseButton1Click:Connect(function()
    Netpage.Visible = false
    _2page.Visible = false
    _3page.Visible = true
    _1page.Visible = false
end)

Net1.Name = "Net1"
Net1.Parent = Pageholder
Net1.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Net1.BorderColor3 = Color3.fromRGB(0, 0, 0)
Net1.Position = UDim2.new(0, 0, 0.479166657, 0)
Net1.Size = UDim2.new(0, 68, 0, 29)
Net1.Font = Enum.Font.SourceSans
Net1.Text = "Netless Bypass"
Net1.TextColor3 = Color3.fromRGB(226, 147, 36)
Net1.TextSize = 12.000
Net1.MouseButton1Click:Connect(function()
    Netpage.Visible = true
    _2page.Visible = false
    _3page.Visible = false
    _1page.Visible = false
end)

_2page.Name = "2page"
_2page.Parent = main
_2page.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
_2page.BorderColor3 = Color3.fromRGB(0, 0, 0)
_2page.Position = UDim2.new(0.166666687, 0, 0.0909090936, 0)
_2page.Size = UDim2.new(0, 340, 0, 240)

Creeper.Name = "Creeper"
Creeper.Parent = _2page
Creeper.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Creeper.Position = UDim2.new(0.182352945, 0, 0.0416666679, 0)
Creeper.Size = UDim2.new(0, 206, 0, 29)
Creeper.Font = Enum.Font.SourceSans
Creeper.Text = "Fe Creeper"
Creeper.TextColor3 = Color3.fromRGB(226, 147, 36)
Creeper.TextSize = 20.000
Creeper.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/R7Hee4dW'))()
end)

UICorner.Parent = Creeper

Smug.Name = "Smug"
Smug.Parent = _2page
Smug.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Smug.Position = UDim2.new(0.182352945, 0, 0.187500015, 0)
Smug.Size = UDim2.new(0, 206, 0, 29)
Smug.Font = Enum.Font.SourceSans
Smug.Text = "Fe Smug"
Smug.TextColor3 = Color3.fromRGB(226, 147, 36)
Smug.TextSize = 20.000
Smug.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/ZuKy7HFF'))()
    end)

UICorner_2.Parent = Smug

Winged.Name = "Winged"
Winged.Parent = _2page
Winged.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Winged.Position = UDim2.new(0.182352945, 0, 0.333333343, 0)
Winged.Size = UDim2.new(0, 206, 0, 29)
Winged.Font = Enum.Font.SourceSans
Winged.Text = "Fe Winged Master"
Winged.TextColor3 = Color3.fromRGB(226, 147, 36)
Winged.TextSize = 20.000
Winged.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/G68Krc4Q'))()
    end)

UICorner_3.Parent = Winged

Car.Name = "Car"
Car.Parent = _2page
Car.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Car.Position = UDim2.new(0.182352945, 0, 0.479166687, 0)
Car.Size = UDim2.new(0, 206, 0, 29)
Car.Font = Enum.Font.SourceSans
Car.Text = "Fe Human Car"
Car.TextColor3 = Color3.fromRGB(226, 147, 36)
Car.TextSize = 20.000
Car.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/YbEir502'))()
    end)

UICorner_4.Parent = Car

Floppa.Name = "Floppa"
Floppa.Parent = _2page
Floppa.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Floppa.Position = UDim2.new(0.182352945, 0, 0.633333325, 0)
Floppa.Size = UDim2.new(0, 206, 0, 29)
Floppa.Font = Enum.Font.SourceSans
Floppa.Text = "Fe Floppa"
Floppa.TextColor3 = Color3.fromRGB(226, 147, 36)
Floppa.TextSize = 20.000
Floppa.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/Floppa/main/Floppa'))()
    end)

UICorner_5.Parent = Floppa

Parkour.Name = "Parkour"
Parkour.Parent = _2page
Parkour.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Parkour.Position = UDim2.new(0.182352945, 0, 0.779166639, 0)
Parkour.Size = UDim2.new(0, 206, 0, 29)
Parkour.Font = Enum.Font.SourceSans
Parkour.Text = "Fe Parkour V2"
Parkour.TextColor3 = Color3.fromRGB(226, 147, 36)
Parkour.TextSize = 20.000
Parkour.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/Parkour/main/Fe%20Parkour'))()
    end)

UICorner_6.Parent = Parkour

Netpage.Name = "Netpage"
Netpage.Parent = main
Netpage.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Netpage.BorderColor3 = Color3.fromRGB(0, 0, 0)
Netpage.Position = UDim2.new(0.166666687, 0, 0.0909091383, 0)
Netpage.Size = UDim2.new(0, 340, 0, 240)

Net.Name = "Net"
Net.Parent = Netpage
Net.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Net.Position = UDim2.new(0.197058827, 0, 0.0458333492, 0)
Net.Size = UDim2.new(0, 206, 0, 29)
Net.Font = Enum.Font.SourceSans
Net.Text = "Netless Bypass"
Net.TextColor3 = Color3.fromRGB(226, 147, 36)
Net.TextSize = 20.000
Net.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/7Jtggrqx'))()
    end)

UICorner_7.Parent = Net

_1page.Name = "1page"
_1page.Parent = main
_1page.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
_1page.BorderColor3 = Color3.fromRGB(0, 0, 0)
_1page.Position = UDim2.new(0.164215714, 0, 0.0909090936, 0)
_1page.Size = UDim2.new(0, 340, 0, 240)

Among.Name = "Among"
Among.Parent = _1page
Among.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Among.Position = UDim2.new(0.182352945, 0, 0.0458333343, 0)
Among.Size = UDim2.new(0, 206, 0, 29)
Among.Font = Enum.Font.SourceSans
Among.Text = "Fe Among Us"
Among.TextColor3 = Color3.fromRGB(226, 147, 36)
Among.TextSize = 20.000
Among.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/Amogus/main/Among%20Us'))()
    end)

UICorner_8.Parent = Among

Neko.Name = "Neko"
Neko.Parent = _1page
Neko.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Neko.Position = UDim2.new(0.182352945, 0, 0.187500015, 0)
Neko.Size = UDim2.new(0, 206, 0, 29)
Neko.Font = Enum.Font.SourceSans
Neko.Text = "Fe Neko Maid"
Neko.TextColor3 = Color3.fromRGB(226, 147, 36)
Neko.TextSize = 20.000
Neko.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/Neko/main/NekoMaid'))()
    end)

UICorner_9.Parent = Neko

Son.Name = "Son"
Son.Parent = _1page
Son.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Son.Position = UDim2.new(0.182352945, 0, 0.333333343, 0)
Son.Size = UDim2.new(0, 206, 0, 29)
Son.Font = Enum.Font.SourceSans
Son.Text = "Fe Sonic"
Son.TextColor3 = Color3.fromRGB(226, 147, 36)
Son.TextSize = 20.000
Son.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/sonic/main/SOnic'))()
    end)

UICorner_10.Parent = Son

Curse.Name = "Curse"
Curse.Parent = _1page
Curse.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Curse.Position = UDim2.new(0.182352945, 0, 0.479166687, 0)
Curse.Size = UDim2.new(0, 206, 0, 29)
Curse.Font = Enum.Font.SourceSans
Curse.Text = "Fe Cursed Spider"
Curse.TextColor3 = Color3.fromRGB(226, 147, 36)
Curse.TextSize = 20.000
Curse.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/tyreltrijo/Cursed/main/Spider'))()
    end)

UICorner_11.Parent = Curse

Creep.Name = "Creep"
Creep.Parent = _1page
Creep.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Creep.Position = UDim2.new(0.182352945, 0, 0.633333325, 0)
Creep.Size = UDim2.new(0, 206, 0, 29)
Creep.Font = Enum.Font.SourceSans
Creep.Text = "Fe Creepy Crawler"
Creep.TextColor3 = Color3.fromRGB(226, 147, 36)
Creep.TextSize = 20.000
Creep.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/eMmgNCQV'))()
    end)

UICorner_12.Parent = Creep

Spider.Name = "Spider"
Spider.Parent = _1page
Spider.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Spider.Position = UDim2.new(0.182352945, 0, 0.779166639, 0)
Spider.Size = UDim2.new(0, 206, 0, 29)
Spider.Font = Enum.Font.SourceSans
Spider.Text = "Fe Spider"
Spider.TextColor3 = Color3.fromRGB(226, 147, 36)
Spider.TextSize = 20.000
Spider.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/txsk1LJg'))()
    end)

UICorner_13.Parent = Spider

_3page.Name = "3page"
_3page.Parent = main
_3page.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
_3page.BorderColor3 = Color3.fromRGB(0, 0, 0)
_3page.Position = UDim2.new(0.166666627, 0, 0.0909091234, 0)
_3page.Size = UDim2.new(0, 340, 0, 240)

Gale.Name = "Gale"
Gale.Parent = _3page
Gale.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Gale.Position = UDim2.new(0.182352945, 0, 0.0458333343, 0)
Gale.Size = UDim2.new(0, 206, 0, 29)
Gale.Font = Enum.Font.SourceSans
Gale.Text = "Fe Gale FIghter"
Gale.TextColor3 = Color3.fromRGB(226, 147, 36)
Gale.TextSize = 20.000
Gale.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/haBVC7bj'))()
    end)

UICorner_14.Parent = Gale

Tall.Name = "Tall"
Tall.Parent = _3page
Tall.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Tall.Position = UDim2.new(0.182352945, 0, 0.187500015, 0)
Tall.Size = UDim2.new(0, 206, 0, 29)
Tall.Font = Enum.Font.SourceSans
Tall.Text = "Fe Tall R15"
Tall.TextColor3 = Color3.fromRGB(226, 147, 36)
Tall.TextSize = 20.000
Tall.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/MXstG0Qd'))()
    end)

UICorner_15.Parent = Tall

Swim.Name = "Swim"
Swim.Parent = _3page
Swim.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Swim.Position = UDim2.new(0.182352945, 0, 0.333333343, 0)
Swim.Size = UDim2.new(0, 206, 0, 29)
Swim.Font = Enum.Font.SourceSans
Swim.Text = "Fe Swim"
Swim.TextColor3 = Color3.fromRGB(226, 147, 36)
Swim.TextSize = 20.000
Swim.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/9CK0qSgn'))()
    end)

UICorner_16.Parent = Swim

Death.Name = "Death"
Death.Parent = _3page
Death.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Death.Position = UDim2.new(0.182352945, 0, 0.479166687, 0)
Death.Size = UDim2.new(0, 206, 0, 29)
Death.Font = Enum.Font.SourceSans
Death.Text = "Fe Death Note"
Death.TextColor3 = Color3.fromRGB(226, 147, 36)
Death.TextSize = 20.000
Death.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/Y51KHiXb'))()
    end)

UICorner_17.Parent = Death

Walls.Name = "Walls"
Walls.Parent = _3page
Walls.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Walls.Position = UDim2.new(0.182352945, 0, 0.633333325, 0)
Walls.Size = UDim2.new(0, 206, 0, 29)
Walls.Font = Enum.Font.SourceSans
Walls.Text = "Fe Walk On Walls"
Walls.TextColor3 = Color3.fromRGB(226, 147, 36)
Walls.TextSize = 20.000
Walls.MouseButton1Down:connect(function()
    loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()
    end)

UICorner_18.Parent = Walls

Mage.Name = "Mage"
Mage.Parent = _3page
Mage.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Mage.Position = UDim2.new(0.182352945, 0, 0.779166639, 0)
Mage.Size = UDim2.new(0, 206, 0, 29)
Mage.Font = Enum.Font.SourceSans
Mage.Text = "Fe Mage"
Mage.TextColor3 = Color3.fromRGB(226, 147, 36)
Mage.TextSize = 20.000
Mage.MouseButton1Down:connect(function()
    loadstring(game:HttpGet('https://pastebin.com/raw/bWpFGdU7'))()
    end)

UICorner_19.Parent = Mage
