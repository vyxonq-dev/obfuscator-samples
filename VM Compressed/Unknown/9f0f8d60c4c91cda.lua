local project = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local clear = Instance.new("TextButton")
local outputContainer = Instance.new("ScrollingFrame")
local output = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local image = Instance.new("ImageLabel")
local TextBox = Instance.new("TextBox")
local project_2 = Instance.new("TextButton")
local view = Instance.new("TextButton")
local scriptlist = Instance.new("ScrollingFrame")
local blue = Instance.new("TextButton")
local infyield = Instance.new("TextButton")
local skid = Instance.new("TextButton")
local c00lgui = Instance.new("TextButton")
local Dex = Instance.new("TextButton")
local exser = Instance.new("TextButton")
local Topk3k = Instance.new("TextButton")
local Duck = Instance.new("TextButton")
local Disco = Instance.new("TextButton")
local Polaria = Instance.new("TextButton")
local BiPolaria = Instance.new("TextButton")
local Scythe = Instance.new("TextButton")
local Freddy = Instance.new("TextButton")
local Soul = Instance.new("TextButton")
local Goner = Instance.new("TextButton")
local Mr = Instance.new("TextButton")
local pex = Instance.new("TextButton")
local logo = Instance.new("TextButton")
local HeadName = Instance.new("TextButton")
local kick = Instance.new("TextButton")
local virus = Instance.new("TextButton")
local Decal = Instance.new("TextButton")
local execute = Instance.new("TextButton")
local Admin = Instance.new("TextButton")
local Car = Instance.new("TextButton")
local close = Instance.new("TextButton")
local ssp = Instance.new("TextButton")
local disco = Instance.new("TextButton")
local Dec = Instance.new("TextButton")
local jum = Instance.new("TextButton")

project.Name = "project"
project.Parent = game.CoreGui

Frame.Parent = project
Frame.Active = true
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Position = UDim2.new(0.236403197, 0, 0.1433869, 0)
Frame.Size = UDim2.new(0, 627, 0, 381)
Frame.Draggable = true

execute.Name = "execute"
execute.Parent = Frame
execute.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
execute.Position = UDim2.new(0.0159489624, 0, 0.685039341, 0)
execute.Size = UDim2.new(0, 137, 0, 27)
execute.Font = Enum.Font.SourceSans
execute.Text = "Execute"
execute.TextColor3 = Color3.fromRGB(0, 0, 0)
execute.TextSize = 19.000
execute.MouseButton1Click:Connect(function()
    local code = TextBox.Text
    if code and code ~= "" then
        local success, err = pcall(function()
            loadstring(code)()
        end)
        if not success then
            output.Text = "Error: " .. err
        else
            output.Text = "script executed successfully!"
        end
    else
        output.Text = "Please enter a script to execute."
    end
end)

clear.Name = "clear"
clear.Parent = Frame
clear.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
clear.Position = UDim2.new(0.0159489624, 0, 0.790026248, 0)
clear.Size = UDim2.new(0, 137, 0, 23)
clear.Font = Enum.Font.SourceSans
clear.Text = "Clear"
clear.TextColor3 = Color3.fromRGB(0, 0, 0)
clear.TextSize = 19.000
clear.MouseButton1Click:Connect(function()
    TextBox.Text = ""
    output.Text = "Output cleared."
end)

outputContainer.Parent = Frame
outputContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
outputContainer.Position = UDim2.new(0.248803824, 0, 0.669291317, 0)
outputContainer.Size = UDim2.new(0, 326, 0, 116)
outputContainer.ScrollBarThickness = 13
outputContainer.CanvasSize = UDim2.new(0, 0, 0, 200)
outputContainer.VerticalScrollBarInset = Enum.ScrollBarInset.Always

output.Parent = outputContainer
output.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
output.Size = UDim2.new(1, 0, 1, 0)
output.Font = Enum.Font.SourceSans
output.Text = "Script.."
output.TextColor3 = Color3.fromRGB(0, 0, 0)
output.TextSize = 14.000
output.TextWrapped = true
output.TextXAlignment = Enum.TextXAlignment.Left
output.TextYAlignment = Enum.TextYAlignment.Top

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.047846891, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 597, 0, 22)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Project Broken spawn"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 20.000
TextLabel.TextXAlignment = Enum.TextXAlignment.Left

image.Name = "image"
image.Parent = Frame
image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
image.BorderSizePixel = 0
image.Size = UDim2.new(0, 23, 0, 22)
image.Image = "rbxassetid://"

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Position = UDim2.new(0.0159489624, 0, 0.144356951, 0)
TextBox.Size = UDim2.new(0, 464, 0, 193)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.MultiLine = true
TextBox.Text = "Print(*hello-world*)"
TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextSize = 19.000
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top

project_2.Name = "project_2"
project_2.Parent = Frame
project_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
project_2.BorderSizePixel = 0
project_2.Position = UDim2.new(0, 0, 0.076115489, 0)
project_2.Size = UDim2.new(0, 88, 0, 18)
project_2.Font = Enum.Font.SourceSans
project_2.Text = "Executor"
project_2.TextColor3 = Color3.fromRGB(0, 0, 0)
project_2.TextSize = 19.000

view.Name = "view"
view.Parent = Frame
view.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
view.BorderSizePixel = 0
view.Position = UDim2.new(0.140350878, 0, 0.076115489, 0)
view.Size = UDim2.new(0, 88, 0, 18)
view.Font = Enum.Font.SourceSans
view.Text = "Console"
view.TextColor3 = Color3.fromRGB(0, 0, 0)
view.TextSize = 19.000
view.MouseButton1Click:Connect(function() game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
end)

scriptlist.Name = "scriptlist"
scriptlist.Parent = Frame
scriptlist.Active = true
scriptlist.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scriptlist.Position = UDim2.new(0.768740058, 0, 0.144356951, 0)
scriptlist.Size = UDim2.new(0, 145, 0, 316)
scriptlist.HorizontalScrollBarInset = Enum.ScrollBarInset.Always
scriptlist.ScrollBarThickness = 13

infyield.Name = "infyield"
infyield.Parent = scriptlist
infyield.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
infyield.Position = UDim2.new(0, 0, -0.000480845018, 0)
infyield.Size = UDim2.new(0, 132, 0, 23)
infyield.Font = Enum.Font.SourceSans
infyield.Text = "R6.txt"
infyield.TextColor3 = Color3.fromRGB(0, 0, 0)
infyield.TextSize = 16.000
infyield.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/sunday102711-bit/E00KIDD-r6-by-me/refs/heads/main/R6%20Real"))()
end)

skid.Name = "skid"
skid.Parent = scriptlist
skid.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
skid.Position = UDim2.new(0, 0, 0.0297028814, 0)
skid.Size = UDim2.new(0, 132, 0, 23)
skid.Font = Enum.Font.SourceSans
skid.Text = "Re.txt"
skid.TextColor3 = Color3.fromRGB(0, 0, 0)
skid.TextSize = 16.000
skid.MouseButton1Click:Connect(function()
if game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
end)

c00lgui.Name = "c00lgui"
c00lgui.Parent = scriptlist
c00lgui.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
c00lgui.Position = UDim2.new(0, 0, 0.0598866083, 0)
c00lgui.Size = UDim2.new(0, 132, 0, 23)
c00lgui.Font = Enum.Font.SourceSans
c00lgui.Text = "Primadon.txt"
c00lgui.TextColor3 = Color3.fromRGB(0, 0, 0)
c00lgui.TextSize = 16.000
c00lgui.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://pastebin.com/raw/37iQzQp3"))()
end)

Dex.Name = "Dex"
Dex.Parent = scriptlist
Dex.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dex.Position = UDim2.new(0, 0, 0.0900703371, 0)
Dex.Size = UDim2.new(0, 132, 0, 23)
Dex.Font = Enum.Font.SourceSans
Dex.Text = "grandosla.txt"
Dex.TextColor3 = Color3.fromRGB(0, 0, 0)
Dex.TextSize = 16.000
Dex.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/Kql9VClT/raw"))()
end)

blue.Name = "blue"
blue.Parent = scriptlist
blue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
blue.Position = UDim2.new(0, 0, 0.120254062, 0)
blue.Size = UDim2.new(0, 132, 0, 23)
blue.Font = Enum.Font.SourceSans
blue.Text = "dababy-car.txt"
blue.TextColor3 = Color3.fromRGB(0, 0, 0)
blue.TextSize = 16.000
blue.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/xtIOQGPy/raw"))()
end)

exser.Name = "exser"
exser.Parent = scriptlist
exser.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
exser.Position = UDim2.new(0, 0, 0.0, 116)
exser.Size = UDim2.new(0, 132, 0, 23)
exser.Font = Enum.Font.SourceSans
exser.Text = "HD-admin.txt"
exser.TextColor3 = Color3.fromRGB(0, 0, 0)
exser.TextSize = 16.000
exser.MouseButton1Click:Connect(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/PHGS971/HDadmin/refs/heads/main/HDadmin.lua'))()
end)

Topk3k.Name = "Topk3k"
Topk3k.Parent = scriptlist
Topk3k.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Topk3k.Position = UDim2.new(0, 0, 0.0, 139)
Topk3k.Size = UDim2.new(0, 132, 0, 23)
Topk3k.Font = Enum.Font.SourceSans
Topk3k.Text = "Goner.txt"
Topk3k.TextColor3 = Color3.fromRGB(0, 0, 0)
Topk3k.TextSize = 16.000
Topk3k.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Goner.lua"))()
end)

Duck.Name = "Duck"
Duck.Parent = scriptlist
Duck.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Duck.Position = UDim2.new(0, 0, 0.0, 163)
Duck.Size = UDim2.new(0, 132, 0, 23)
Duck.Font = Enum.Font.SourceSans
Duck.Text = "Soul-Reaper.txt"
Duck.TextColor3 = Color3.fromRGB(0, 0, 0)
Duck.TextSize = 16.000
Duck.MouseButton1Click:Connect(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Soul%20Reaper.lua"))()
end)

Disco.Name = "Disco"
Disco.Parent = scriptlist
Disco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Disco.Position = UDim2.new(0, 0, 0.0, 187)
Disco.Size = UDim2.new(0, 132, 0, 23)
Disco.Font = Enum.Font.SourceSans
Disco.Text = "DoggyArmy.txt"
Disco.TextColor3 = Color3.fromRGB(0, 0, 0)
Disco.TextSize = 16.000
Disco.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/LVk3eQwM"))()
end)

Polaria.Name = "Polaria"
Polaria.Parent = scriptlist
Polaria.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Polaria.Position = UDim2.new(0, 0, 0.0, 211)
Polaria.Size = UDim2.new(0, 132, 0, 23)
Polaria.Font = Enum.Font.SourceSans
Polaria.Text = "Polaria.txt"
Polaria.TextColor3 = Color3.fromRGB(0, 0, 0)
Polaria.TextSize = 16.000
Polaria.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/agqEB2qs/raw",true))()
end)

BiPolaria.Name = "BiPolaria"
BiPolaria.Parent = scriptlist
BiPolaria.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BiPolaria.Position = UDim2.new(0, 0, 0.0, 235)
BiPolaria.Size = UDim2.new(0, 132, 0, 23)
BiPolaria.Font = Enum.Font.SourceSans
BiPolaria.Text = "Bipolaria.txt"
BiPolaria.TextColor3 = Color3.fromRGB(0, 0, 0)
BiPolaria.TextSize = 16.000
BiPolaria.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/8qFWEtWY"))()
end)

Scythe.Name = "Scythe"
Scythe.Parent = scriptlist
Scythe.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Scythe.Position = UDim2.new(0, 0, 0.0, 258)
Scythe.Size = UDim2.new(0, 132, 0, 23)
Scythe.Font = Enum.Font.SourceSans
Scythe.Text = "MrByeBye.txt"
Scythe.TextColor3 = Color3.fromRGB(0, 0, 0)
Scythe.TextSize = 16.000
Scythe.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/gObl00x/My-Converts/refs/heads/main/Mr.Bye%20Bye.lua"))()
end)

Freddy.Name = "Freddy"
Freddy.Parent = scriptlist
Freddy.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Freddy.Position = UDim2.new(0, 0, 0.0, 282)
Freddy.Size = UDim2.new(0, 132, 0, 23)
Freddy.Font = Enum.Font.SourceSans
Freddy.Text = "ExSeR.txt"
Freddy.TextColor3 = Color3.fromRGB(0, 0, 0)
Freddy.TextSize = 16.000
Freddy.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/7sO8ckTL/raw",true))()
end)

Soul.Name = "Soul"
Soul.Parent = scriptlist
Soul.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Soul.Position = UDim2.new(0, 0, 0.0, 306)
Soul.Size = UDim2.new(0, 132, 0, 23)
Soul.Font = Enum.Font.SourceSans
Soul.Text = "Keyboard.txt"
Soul.TextColor3 = Color3.fromRGB(0, 0, 0)
Soul.TextSize = 16.000
Soul.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt", true))()
end)

Goner.Name = "Goner"
Goner.Parent = scriptlist
Goner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Goner.Position = UDim2.new(0, 0, 0.0, 330)
Goner.Size = UDim2.new(0, 132, 0, 23)
Goner.Font = Enum.Font.SourceSans
Goner.Text = "Fire-all.txt"
Goner.TextColor3 = Color3.fromRGB(0, 0, 0)
Goner.TextSize = 16.000
Goner.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/L2dS9fgx/raw"))()
end)

Mr.Name = "Mr"
Mr.Parent = scriptlist
Mr.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Mr.Position = UDim2.new(0, 0, 0.0, 353)
Mr.Size = UDim2.new(0, 132, 0, 23)
Mr.Font = Enum.Font.SourceSans
Mr.Text = "BLUUDUUD.txt"
Mr.TextColor3 = Color3.fromRGB(0, 0, 0)
Mr.TextSize = 16.000
Mr.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/CcHxT0Gj"))()
end)

pex.Name = "pex"
pex.Parent = scriptlist
pex.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pex.Position = UDim2.new(0, 0, 0.0, 374)
pex.Size = UDim2.new(0, 132, 0, 23)
pex.Font = Enum.Font.SourceSans
pex.Text = "Neko.txt"
pex.TextColor3 = Color3.fromRGB(0, 0, 0)
pex.TextSize = 16.000
pex.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/neko"))()
end)

logo.Name = "logo"
logo.Parent = Frame
logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
logo.Position = UDim2.new(0.0159489624, 0, 0.685039341, 80)
logo.Size = UDim2.new(0, 137, 0, 27)
logo.Font = Enum.Font.SourceSans
logo.Text = "Logo"
logo.TextColor3 = Color3.fromRGB(0, 0, 0)
logo.TextSize = 19.000
logo.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/ag3eykh3/raw"))()
end)

HeadName.Name = "HeadName"
HeadName.Parent = scriptlist
HeadName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HeadName.Position = UDim2.new(0, 0, 0.0, 398)
HeadName.Size = UDim2.new(0, 132, 0, 23)
HeadName.Font = Enum.Font.SourceSans
HeadName.Text = "Topk3k-v5.0.txt"
HeadName.TextColor3 = Color3.fromRGB(0, 0, 0)
HeadName.TextSize = 16.000
HeadName.MouseButton1Click:Connect(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/radiuscool/topkek/refs/heads/main/adsdsaadsdassad'))()
end)

Decal.Name = "Decal"
Decal.Parent = scriptlist
Decal.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Decal.Position = UDim2.new(0, 0, 0.0, 422)
Decal.Size = UDim2.new(0, 132, 0, 23)
Decal.Font = Enum.Font.SourceSans
Decal.Text = "Exvator.txt"
Decal.TextColor3 = Color3.fromRGB(0, 0, 0)
Decal.TextSize = 16.000
Decal.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/q74DFYYz/raw", true))()
end)

kick.Name = "kick"
kick.Parent = scriptlist
kick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
kick.Position = UDim2.new(0, 0, 0.0, 446)
kick.Size = UDim2.new(0, 132, 0, 23)
kick.Font = Enum.Font.SourceSans
kick.Text = "Sledge-Hammer.txt"
kick.TextColor3 = Color3.fromRGB(0, 0, 0)
kick.TextSize = 16.000
kick.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/jmJgSbvV/raw?part=Sledgehammer", true))()
end)

virus.Name = "virus"
virus.Parent = scriptlist
virus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
virus.Position = UDim2.new(0, 0, 0.0, 469)
virus.Size = UDim2.new(0, 132, 0, 23)
virus.Font = Enum.Font.SourceSans
virus.Text = "M41451.txt"
virus.TextColor3 = Color3.fromRGB(0, 0, 0)
virus.TextSize = 16.000
virus.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/M41451"))()
end)

Admin.Name = "Admin"
Admin.Parent = scriptlist
Admin.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Admin.Position = UDim2.new(0, 0, 0.0, 493)
Admin.Size = UDim2.new(0, 132, 0, 23)
Admin.Font = Enum.Font.SourceSans
Admin.Text = "Anonymas-decal.txt"
Admin.TextColor3 = Color3.fromRGB(0, 0, 0)
Admin.TextSize = 16.000
Admin.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/uiwcplCF/raw"))()
end)

Car.Name = "Car"
Car.Parent = scriptlist
Car.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Car.Position = UDim2.new(0, 0, 0.0, 517)
Car.Size = UDim2.new(0, 132, 0, 23)
Car.Font = Enum.Font.SourceSans
Car.Text = "Synarx-v2.0.txt"
Car.TextColor3 = Color3.fromRGB(0, 0, 0)
Car.TextSize = 16.000
Car.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/Qwt2l6zc/raw"))()
end)

ssp.Name = "ssp"
ssp.Parent = scriptlist
ssp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ssp.Position = UDim2.new(0, 0, 0.0, 541)
ssp.Size = UDim2.new(0, 132, 0, 23)
ssp.Font = Enum.Font.SourceSans
ssp.Text = "Secret service panel.txt"
ssp.TextColor3 = Color3.fromRGB(0, 0, 0)
ssp.TextSize = 16.000
ssp.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastefy.app/XHqVeb0d/raw"))()
end)

disco.Name = "disco"
disco.Parent = scriptlist
disco.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
disco.Position = UDim2.new(0, 0, 0.0, 565)
disco.Size = UDim2.new(0, 132, 0, 23)
disco.Font = Enum.Font.SourceSans
disco.Text = "Disco.txt"
disco.TextColor3 = Color3.fromRGB(0, 0, 0)
disco.TextSize = 16.000
disco.MouseButton1Click:Connect(function()
local Lighting = game:GetService("Lighting")
local ColorCorrection = Instance.new("ColorCorrectionEffect")
ColorCorrection.Parent = Lighting

local function zigzag(X)
	return math.acos(math.cos(X * math.pi)) / math.pi
end

local Counter = 0
Lighting.TimeOfDay = "12:00"

while task.wait(0.1) do
	local color = Color3.fromHSV(zigzag(Counter), 1, 1)
	ColorCorrection.TintColor = color
	Lighting.Ambient = color
	Counter += 0.01
end
end)

Dec.Name = "Dec"
Dec.Parent = scriptlist
Dec.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Dec.Position = UDim2.new(0, 0, 0.0, 589)
Dec.Size = UDim2.new(0, 132, 0, 23)
Dec.Font = Enum.Font.SourceSans
Dec.Text = "Decal.txt"
Dec.TextColor3 = Color3.fromRGB(0, 0, 0)
Dec.TextSize = 16.000
Dec.MouseButton1Click:Connect(function()
local id = "138282527595386" --decal id here

for _, ssederx33p in pairs(game:GetDescendants()) do
	if ssederx33p:IsA("Part") or ssederx33p:IsA("MeshPart") then
		local decal = Instance.new("Decal")
		decal.Parent = ssederx33p
		decal.Texture = "rbxassetid://"..id
		decal.Face = Enum.NormalId.Back
		decal.Name = "1"
		
		local decal = Instance.new("Decal")
		decal.Parent = ssederx33p
		decal.Texture = "rbxassetid://"..id
		decal.Face = Enum.NormalId.Top
		decal.Name = "2"
		
		local decal = Instance.new("Decal")
		decal.Parent = ssederx33p
		decal.Texture = "rbxassetid://"..id
		decal.Face = Enum.NormalId.Left
		decal.Name = "3"
		
		local decal = Instance.new("Decal")
		decal.Parent = ssederx33p
		decal.Texture = "rbxassetid://"..id
		decal.Face = Enum.NormalId.Front
		decal.Name = "4"
		
		local decal = Instance.new("Decal")
		decal.Parent = ssederx33p
		decal.Texture = "rbxassetid://"..id
		decal.Face = Enum.NormalId.Right
		decal.Name = "5"
		
		local decal = Instance.new("Decal")
		decal.Parent = ssederx33p
		decal.Texture = "rbxassetid://"..id
		decal.Face = Enum.NormalId.Bottom
		decal.Name = "6"
	end
end
end)

jum.Name = "jum"
jum.Parent = scriptlist
jum.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
jum.Position = UDim2.new(0, 0, 0.0, 613)
jum.Size = UDim2.new(0, 132, 0, 23)
jum.Font = Enum.Font.SourceSans
jum.Text = "Jumscare.txt"
jum.TextColor3 = Color3.fromRGB(0, 0, 0)
jum.TextSize = 16.000
jum.MouseButton1Click:Connect(function()
for i,v in pairs(game.Players:GetPlayers()) do
   if v.Name ~= me and not v.PlayerGui:FindFirstChild("Screamer") and v:FindFirstChild("PlayerGui") then
    spawn(function()
     local newgui = Instance.new("ScreenGui",v.PlayerGui)
     newgui.Name = "Screamer"
     local newimage = Instance.new("ImageLabel",newgui)
     newimage.Image = "http://www.roblox.com/asset/?id=123116429020517"
     newimage.Size = UDim2.new(1,1,1,1)
     local s = Instance.new("Sound",newgui)
     s.SoundId = "rbxassetid://6018028320"
     s.Volume = 9999999999999999999999999999999999999
     s.Looped = true
     s:Play()
     print("Screamed "..v.Name)
     while wait(9.4) do
 
      newimage.Parent:Destroy()
 
     end
    end)
   end
  end
end)