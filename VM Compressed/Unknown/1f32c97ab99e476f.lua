local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UIS = game:GetService("UserInputService")

local BASE_URL = "https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/"

local Scripts = {
    "achromatix.luau","acromatic.luau","anyhub.luau","banhammer.luau","blockcar.luau",
    "burgerblood.luau","caducus.luau","car.luau","chara.luau","chill.luau",
    "combine.luau","cop.luau","cursordog.luau","eyozen.luau","fakrvr.luau",
    "fgd.luau","flame.luau","friend.luau","galefighter.luau","game.luau",
    "giant.luau","goner.luau","grasshub.luau","hdf.luau","holiday.luau",
    "holihub.luau","hollidayhub.luau","hub.luau",
    "kvd.Luau","laser.luau","minions.luau","na.luau", "kdv3mod.luau", "nightmaresans.luau",
    "past.luau","pumkin.luau","rebel.luau","redhub.luau","ruinx.luau",
    "sanslastbreath.luau","vd.luau","voidboss.luau","vr.luau","warden.luau",
    "xester.luau","xr.luau","zero.luau","zerox.luau"
}



loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.PlaceId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game search: [UP] Just a baseplate. - creator: the local maze")
end

if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end

local gui = Instance.new("ScreenGui", LocalPlayer.PlayerGui)
gui.Name = "PrimeHub"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.fromScale(0.32, 0.45)
main.Position = UDim2.fromScale(0.34, 0.25)
main.BackgroundColor3 = Color3.fromRGB(18,18,18)
main.BorderSizePixel = 0

Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)

local shadow = Instance.new("ImageLabel", main)
shadow.AnchorPoint = Vector2.new(0.5,0.5)
shadow.Position = UDim2.fromScale(0.5,0.5)
shadow.Size = UDim2.fromScale(1.05,1.08)
shadow.BackgroundTransparency = 1
shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 0.85
shadow.ZIndex = 0

local aspect = Instance.new("UIAspectRatioConstraint", main)
aspect.AspectRatio = 1.35
aspect.DominantAxis = Enum.DominantAxis.Height

local header = Instance.new("Frame", main)
header.Size = UDim2.new(1,0,0,48)
header.BackgroundColor3 = Color3.fromRGB(22,22,22)
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", header)
title.Size = UDim2.new(1,-16,1,0)
title.Position = UDim2.new(0,16,0,0)
title.Text = "Prime Hub"
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.TextXAlignment = "Left"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local search = Instance.new("TextBox", main)
search.Position = UDim2.new(0,12,0,56)
search.Size = UDim2.new(1,-24,0,34)
search.PlaceholderText = "Search script..."
search.Font = Enum.Font.Gotham
search.TextSize = 14
search.Text = ""
search.TextColor3 = Color3.new(1,1,1)
search.BackgroundColor3 = Color3.fromRGB(28,28,28)
search.BorderSizePixel = 0
search.ClearTextOnFocus = true
Instance.new("UICorner", search).CornerRadius = UDim.new(0,10)

local scroll = Instance.new("ScrollingFrame", main)
scroll.Position = UDim2.new(0,12,0,98)
scroll.Size = UDim2.new(1,-24,1,-110)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.CanvasSize = UDim2.new()
scroll.ScrollBarImageTransparency = 0.4
scroll.BorderSizePixel = 0
scroll.BackgroundTransparency = 1

local layout = Instance.new("UIListLayout", scroll)
layout.Padding = UDim.new(0,8)

local buttons = {}

local function createButton(name)
    local btn = Instance.new("TextButton", scroll)
    btn.Size = UDim2.new(1,0,0,36)
    btn.Text = name:gsub("%.luau","")
    btn.Font = Enum.Font.GothamMedium
    btn.TextSize = 14
    btn.TextColor3 = Color3.new(1,1,1)
    btn.BackgroundColor3 = Color3.fromRGB(32,32,32)
    btn.BorderSizePixel = 0
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,10)

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(45,45,45)
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(32,32,32)
    end)

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(BASE_URL .. name))()
    end)

    return btn
end

for _,scriptName in ipairs(Scripts) do
    table.insert(buttons, createButton(scriptName))
end

search:GetPropertyChangedSignal("Text"):Connect(function()
    local t = search.Text:lower()
    for i,btn in ipairs(buttons) do
        btn.Visible = btn.Text:lower():find(t,1,true) ~= nil
    end
end)

do
    local dragging, dragStart, startPos
    header.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = i.Position
            startPos = main.Position
        end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UIS.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = i.Position - dragStart
            main.Position = startPos + UDim2.fromOffset(delta.X, delta.Y)
        end
    end)
end
