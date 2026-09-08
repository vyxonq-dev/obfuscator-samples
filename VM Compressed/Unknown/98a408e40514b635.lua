loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()


local p=game:GetService("Players").LocalPlayer
local uis=game:GetService("UserInputService")
local ts=game:GetService("TweenService")

local BASE="https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/"

local S={
"goner.luau","abysseye.luau","blight.luau","blockcar.luau","caducus.luau","burgerblood.luau","banhammer.luau","chara.luau","copv2.luau","eyozen.luau",
"galefighter.luau","losthope.luau","masterofelement.luau","nightmaresans.luau","pillow.luau","reaper.luau","sans.luau",
"sanslastbreath.luau","serveradmin.luau","warden.luau"
}

local g=Instance.new("ScreenGui",p.PlayerGui)
g.Name="JAB classical hub"
g.ResetOnSpawn=false
g.IgnoreGuiInset=true

local m=Instance.new("Frame",g)
m.AnchorPoint=Vector2.new(.5,.5)
m.Position=UDim2.fromScale(.5,.5)
m.Size=UDim2.fromScale(.3,.45)
m.BackgroundColor3=Color3.fromRGB(14,14,14)
m.BorderSizePixel=0
Instance.new("UICorner",m).CornerRadius=UDim.new(0,18)

local stroke=Instance.new("UIStroke",m)
stroke.Color=Color3.fromRGB(60,60,60)
stroke.Thickness=1

local glow=Instance.new("Frame",m)
glow.Size=UDim2.new(1,0,0,2)
glow.BackgroundColor3=Color3.fromRGB(120,120,255)
glow.BorderSizePixel=0

local top=Instance.new("Frame",m)
top.Size=UDim2.new(1,0,0,52)
top.BackgroundTransparency=1

local title=Instance.new("TextLabel",top)
title.Size=UDim2.new(1,-20,1,0)
title.Position=UDim2.new(0,20,0,0)
title.Text="Classical hub"
title.Font=Enum.Font.GothamBold
title.TextSize=20
title.TextXAlignment=Enum.TextXAlignment.Left
title.TextColor3=Color3.new(1,1,1)
title.BackgroundTransparency=1

local s=Instance.new("TextBox",m)
s.Position=UDim2.new(0,14,0,56)
s.Size=UDim2.new(1,-28,0,36)
s.PlaceholderText="Search scripts..."
s.Font=Enum.Font.Gotham
s.TextSize=14
s.Text=""
s.TextColor3=Color3.new(1,1,1)
s.BackgroundColor3=Color3.fromRGB(22,22,22)
s.BorderSizePixel=0
Instance.new("UICorner",s).CornerRadius=UDim.new(0,10)

local sc=Instance.new("ScrollingFrame",m)
sc.Position=UDim2.new(0,14,0,104)
sc.Size=UDim2.new(1,-28,1,-118)
sc.BackgroundTransparency=1
sc.BorderSizePixel=0
sc.AutomaticCanvasSize=Enum.AutomaticSize.Y
sc.ScrollBarThickness=2

local lay=Instance.new("UIListLayout",sc)
lay.Padding=UDim.new(0,8)

local btns={}

local function b(n)
local x=Instance.new("TextButton",sc)
x.Size=UDim2.new(1,0,0,38)
x.Text=n:gsub("%.luau","")
x.Font=Enum.Font.GothamMedium
x.TextSize=14
x.TextColor3=Color3.new(1,1,1)
x.BackgroundColor3=Color3.fromRGB(26,26,26)
x.BorderSizePixel=0
Instance.new("UICorner",x).CornerRadius=UDim.new(0,10)

local st=Instance.new("UIStroke",x)
st.Color=Color3.fromRGB(50,50,50)

x.MouseEnter:Connect(function()
ts:Create(x,TweenInfo.new(.12),{BackgroundColor3=Color3.fromRGB(36,36,36)}):Play()
ts:Create(st,TweenInfo.new(.12),{Color=Color3.fromRGB(120,120,255)}):Play()
end)

x.MouseLeave:Connect(function()
ts:Create(x,TweenInfo.new(.12),{BackgroundColor3=Color3.fromRGB(26,26,26)}):Play()
ts:Create(st,TweenInfo.new(.12),{Color=Color3.fromRGB(50,50,50)}):Play()
end)

x.MouseButton1Down:Connect(function()
ts:Create(x,TweenInfo.new(.08),{Size=UDim2.new(1,0,0,34)}):Play()
end)

x.MouseButton1Up:Connect(function()
ts:Create(x,TweenInfo.new(.08),{Size=UDim2.new(1,0,0,38)}):Play()
end)

x.MouseButton1Click:Connect(function()
loadstring(game:HttpGet(BASE..n))()
end)

return x
end

for _,v in ipairs(S) do
table.insert(btns,b(v))
end

s:GetPropertyChangedSignal("Text"):Connect(function()
local t=s.Text:lower()
for _,v in ipairs(btns) do
v.Visible=v.Text:lower():find(t,1,true)~=nil
end
end)

do
local drag=false
local startPos
local startInput

top.InputBegan:Connect(function(input)
if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
drag=true
startInput=input.Position
startPos=m.Position

input.Changed:Connect(function()
if input.UserInputState==Enum.UserInputState.End then
drag=false
end
end)
end
end)

uis.InputChanged:Connect(function(input)
if drag and (input.UserInputType==Enum.UserInputType.MouseMovement or input.UserInputType==Enum.UserInputType.Touch) then
local delta=input.Position-startInput
m.Position=startPos+UDim2.fromOffset(delta.X,delta.Y)
end
end)
end
