--// GUI do HUB Scary — Feito exatamente como as imagens

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false


---

-- FUNÇÃO UNIVERSAL DE ARRASTAR (PC + CELULAR)

local function makeDraggable(gui)
local dragging = false
local dragInput
local dragStart
local startPos

local function update(input)
local delta = input.Position - dragStart
gui.Position = UDim2.new(
startPos.X.Scale,
startPos.X.Offset + delta.X,
startPos.Y.Scale,
startPos.Y.Offset + delta.Y
)
end

gui.InputBegan:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseButton1
or input.UserInputType == Enum.UserInputType.Touch then
dragging = true
dragStart = input.Position
startPos = gui.Position

input.Changed:Connect(function()    
        if input.UserInputState == Enum.UserInputState.End then    
            dragging = false    
        end    
    end)    
end

end)

gui.InputChanged:Connect(function(input)
if input.UserInputType == Enum.UserInputType.MouseMovement
or input.UserInputType == Enum.UserInputType.Touch then
dragInput = input
end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
if input == dragInput and dragging then
update(input)
end
end)

end


---

-- [ PRIMEIRA INTERFACE — UM POUCO MENOR ]

local OpenButton = Instance.new("Frame")
OpenButton.Parent = ScreenGui
OpenButton.Size = UDim2.new(0, 340, 0, 45)
OpenButton.Position = UDim2.new(0.5, -170, 0.02, 0)
OpenButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
OpenButton.BorderSizePixel = 0
OpenButton.BackgroundTransparency = 0.15
OpenButton.Visible = true

makeDraggable(OpenButton)

local HubTitle = Instance.new("TextLabel")
HubTitle.Parent = OpenButton
HubTitle.Size = UDim2.new(1, -45, 1, 0)
HubTitle.Position = UDim2.new(0, 0, 0, 0)
HubTitle.Text = "Scary hub"
HubTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextSize = 28
HubTitle.BackgroundTransparency = 1

local PlusButton = Instance.new("TextButton")
PlusButton.Parent = OpenButton
PlusButton.Size = UDim2.new(0, 45, 1, 0)
PlusButton.Position = UDim2.new(1, -45, 0, 0)
PlusButton.Text = "+"
PlusButton.Font = Enum.Font.GothamBold
PlusButton.TextColor3 = Color3.fromRGB(255, 0, 0)
PlusButton.TextSize = 35
PlusButton.BackgroundTransparency = 1


---

-- [ HUB COMPLETO ]

local HubFrame = Instance.new("Frame")
HubFrame.Parent = ScreenGui
HubFrame.Size = UDim2.new(0, 600, 0, 300)
HubFrame.Position = UDim2.new(0.5, -300, 0.15, 0)
HubFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
HubFrame.BorderSizePixel = 0
HubFrame.Visible = false
HubFrame.ClipsDescendants = true
HubFrame.BackgroundTransparency = 0.05

makeDraggable(HubFrame)

local Title = Instance.new("TextLabel")
Title.Parent = HubFrame
Title.Size = UDim2.new(1, -60, 0, 60)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "Scary hub"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 45
Title.BackgroundTransparency = 1

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = HubFrame
CloseButton.Text = "-"
CloseButton.Size = UDim2.new(0, 60, 0, 60)
CloseButton.Position = UDim2.new(1, -60, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 55
CloseButton.BackgroundTransparency = 1


---

-- SIDE BAR

local SideBar = Instance.new("Frame")
SideBar.Parent = HubFrame
SideBar.Size = UDim2.new(0, 150, 1, -60)
SideBar.Position = UDim2.new(0, 0, 0, 60)
SideBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SideBar.BorderSizePixel = 0

local Tabs = Instance.new("Folder")
Tabs.Parent = HubFrame


---

-- FUNÇÕES DE ABA

local function createTabButton(name, order)
local btn = Instance.new("TextButton")
btn.Parent = SideBar
btn.Size = UDim2.new(1, 0, 0, 40)
btn.Position = UDim2.new(0, 0, 0, 40 * (order - 1))
btn.Text = name
btn.TextColor3 = Color3.fromRGB(255, 255, 255)
btn.BackgroundTransparency = 1
btn.Font = Enum.Font.GothamSemibold
btn.TextSize = 20
return btn
end

local function createTabPage(name)
local page = Instance.new("Frame")
page.Parent = Tabs
page.Name = name
page.Size = UDim2.new(1, -150, 1, -60)
page.Position = UDim2.new(0, 150, 0, 60)
page.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
page.BorderSizePixel = 0
page.Visible = false
return page
end


---

-- ABAS

local TabNames = {"lnfo", "Troll", "Script R6", "Admin"}
local TabButtons = {}
local TabPages = {}

for i, name in ipairs(TabNames) do

TabButtons[i] = createTabButton(name, i)
TabPages[i] = createTabPage(name)

if name == "lnfo" then
local txt = Instance.new("TextLabel")
txt.Parent = TabPages[i]
txt.Size = UDim2.new(1, 0, 1, 0)
txt.Text = "Made by HEITORGAME12237"
txt.Font = Enum.Font.Gotham
txt.TextSize = 30
txt.TextColor3 = Color3.new(1, 1, 1)
txt.BackgroundTransparency = 1
end

TabButtons[i].MouseButton1Click:Connect(function()
for _, page in pairs(Tabs:GetChildren()) do
page.Visible = false
end
TabPages[i].Visible = true
end)

end


---

-- ABA TROLL

local TrollPage = TabPages[2]

local PunchButton = Instance.new("TextButton")
PunchButton.Parent = TrollPage
PunchButton.Size = UDim2.new(0, 200, 0, 50)
PunchButton.Position = UDim2.new(0, 20, 0, 20)
PunchButton.Text = "Punch Fling"
PunchButton.Font = Enum.Font.GothamBold
PunchButton.TextSize = 25
PunchButton.TextColor3 = Color3.new(1, 1, 1)
PunchButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
PunchButton.BorderSizePixel = 0
PunchButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe/main/obf_rf6iQURzu1fqrytcnLBAvW34C9N55kS9g9G3CKz086rC47M6632sEd4ZZYB0AYgV.lua.txt"))()
end)

local GonerButton = Instance.new("TextButton")
GonerButton.Parent = TrollPage
GonerButton.Size = UDim2.new(0, 200, 0, 50)
GonerButton.Position = UDim2.new(0, 230, 0, 20)
GonerButton.Text = "FE GONER"
GonerButton.Font = Enum.Font.GothamBold
GonerButton.TextSize = 25
GonerButton.TextColor3 = Color3.new(1, 1, 1)
GonerButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
GonerButton.BorderSizePixel = 0
GonerButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/GenesisFE/Genesis/main/Obfuscations/Goner"))()
end)


---

-- ABA SCRIPT R6

local ScriptR6Page = TabPages[3]

local SeraphicButton = Instance.new("TextButton")
SeraphicButton.Parent = ScriptR6Page
SeraphicButton.Size = UDim2.new(0, 220, 0, 50)
SeraphicButton.Position = UDim2.new(0, 20, 0, 20)
SeraphicButton.Text = "Seraphic"
SeraphicButton.Font = Enum.Font.GothamBold
SeraphicButton.TextSize = 25
SeraphicButton.TextColor3 = Color3.new(1, 1, 1)
SeraphicButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
SeraphicButton.BorderSizePixel = 0
SeraphicButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/59mJGQGe/raw"))()
end)

local JohnButton = Instance.new("TextButton")
JohnButton.Parent = ScriptR6Page
JohnButton.Size = UDim2.new(0, 220, 0, 50)
JohnButton.Position = UDim2.new(0, 260, 0, 20)
JohnButton.Text = "John doe (visual)"
JohnButton.Font = Enum.Font.GothamBold
JohnButton.TextSize = 22
JohnButton.TextColor3 = Color3.new(1, 1, 1)
JohnButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
JohnButton.BorderSizePixel = 0
JohnButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-John-Doe-67329"))()
end)

local ZumbiButton = Instance.new("TextButton")
ZumbiButton.Parent = ScriptR6Page
ZumbiButton.Size = UDim2.new(0, 220, 0, 50)
ZumbiButton.Position = UDim2.new(0, 20, 0, 80)
ZumbiButton.Text = "FE Zumbi"
ZumbiButton.Font = Enum.Font.GothamBold
ZumbiButton.TextSize = 25
ZumbiButton.TextColor3 = Color3.new(1, 1, 1)
ZumbiButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
ZumbiButton.BorderSizePixel = 0
ZumbiButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/JOWniO6o/raw"))()
end)

local KnifeButton = Instance.new("TextButton")
KnifeButton.Parent = ScriptR6Page
KnifeButton.Size = UDim2.new(0, 220, 0, 50)
KnifeButton.Position = UDim2.new(0, 260, 0, 80)
KnifeButton.Text = "Knife Grab"
KnifeButton.Font = Enum.Font.GothamBold
KnifeButton.TextSize = 25
KnifeButton.TextColor3 = Color3.new(1, 1, 1)
KnifeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
KnifeButton.BorderSizePixel = 0
KnifeButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Knife-Grab-V4-script-29265"))()
end)


---

-- ABA ADMIN

local AdminPage = TabPages[4]

local IYButton = Instance.new("TextButton")
IYButton.Parent = AdminPage
IYButton.Size = UDim2.new(0, 250, 0, 50)
IYButton.Position = UDim2.new(0, 20, 0, 20)
IYButton.Text = "Infinite Yield"
IYButton.Font = Enum.Font.GothamBold
IYButton.TextSize = 25
IYButton.TextColor3 = Color3.new(1, 1, 1)
IYButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
IYButton.BorderSizePixel = 0
IYButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

-- MORFOS EMBAIXO DO INFINITE YIELD
local MorfOSButton = Instance.new("TextButton")
MorfOSButton.Parent = AdminPage
MorfOSButton.Size = UDim2.new(0, 250, 0, 50)
MorfOSButton.Position = UDim2.new(0, 20, 0, 80)
MorfOSButton.Text = "morfOS"
MorfOSButton.Font = Enum.Font.GothamBold
MorfOSButton.TextSize = 25
MorfOSButton.TextColor3 = Color3.new(1, 1, 1)
MorfOSButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
MorfOSButton.BorderSizePixel = 0
MorfOSButton.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-morfOS-Universal-46903"))()
end)


---

-- BOTÕES + E -

PlusButton.MouseButton1Click:Connect(function()
HubFrame.Visible = true
OpenButton.Visible = false
end)

CloseButton.MouseButton1Click:Connect(function()
HubFrame.Visible = false
OpenButton.Visible = true
end)
