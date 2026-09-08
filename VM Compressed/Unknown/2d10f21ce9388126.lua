-- Polerinas Project 3.0 - Script Hub GUI (Küçük Boyut)
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PolerinasGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Ana Frame (Küçültülmüş)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 450, 0, 350)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

-- UICorner for MainFrame
local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 8)
MainCorner.Parent = MainFrame

-- Başlık Frame
local TitleFrame = Instance.new("Frame")
TitleFrame.Name = "TitleFrame"
TitleFrame.Size = UDim2.new(1, 0, 0, 35)
TitleFrame.Position = UDim2.new(0, 0, 0, 0)
TitleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleFrame.BorderSizePixel = 0
TitleFrame.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 8)
TitleCorner.Parent = TitleFrame

-- Resim (Sol tarafta)
local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Name = "Logo"
ImageLabel.Size = UDim2.new(0, 28, 0, 28)
ImageLabel.Position = UDim2.new(0, 4, 0, 3.5)
ImageLabel.BackgroundTransparency = 1
ImageLabel.Image = "rbxassetid://278201073"
ImageLabel.Parent = TitleFrame

-- Başlık Text
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Size = UDim2.new(1, -75, 1, 0)
TitleLabel.Position = UDim2.new(0, 36, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "Polerinas Project 3.0"
TitleLabel.TextSize = 15
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Parent = TitleFrame

-- Kapat Butonu
local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Size = UDim2.new(0, 35, 0, 35)
CloseButton.Position = UDim2.new(1, -35, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseButton.Text = "X"
CloseButton.TextSize = 16
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BorderSizePixel = 0
CloseButton.Parent = TitleFrame

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseButton

CloseButton.MouseButton1Click:Connect(function()
	ScreenGui:Destroy()
end)

-- Script Hub Frame (Siyah)
local ScriptHub = Instance.new("Frame")
ScriptHub.Name = "ScriptHub"
ScriptHub.Size = UDim2.new(1, -16, 1, -47)
ScriptHub.Position = UDim2.new(0, 8, 0, 39)
ScriptHub.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ScriptHub.BorderSizePixel = 1
ScriptHub.BorderColor3 = Color3.fromRGB(50, 50, 50)
ScriptHub.Parent = MainFrame

local HubCorner = Instance.new("UICorner")
HubCorner.CornerRadius = UDim.new(0, 6)
HubCorner.Parent = ScriptHub

-- ScrollingFrame
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, -8, 1, -8)
ScrollFrame.Position = UDim2.new(0, 4, 0, 4)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 4
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.Parent = ScriptHub

-- UIGridLayout
local GridLayout = Instance.new("UIGridLayout")
GridLayout.CellSize = UDim2.new(0, 100, 0, 30)
GridLayout.CellPadding = UDim2.new(0, 4, 0, 4)
GridLayout.SortOrder = Enum.SortOrder.LayoutOrder
GridLayout.Parent = ScrollFrame

-- Script listesi
local scripts = {
	{name = "M4", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/QSV8xVUA"))()'},
	{name = "Kazakistan", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/H7YP5yvt"))()'},
	{name = "Karambit", script = 'loadstring(game:HttpGet("https://pastebin.com/HNZuVF4F"))()'},
	{name = "Steve V2", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/c1nk9cHY"))()'},
	{name = "Aura Player", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/J2Y9MLki"))()'},
	{name = "Fnaf Map", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/gAmGDvcS"))()'},
	{name = "player ❌", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/9eHN54uD"))()'},
	{name = "T1ROS", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/s6PLKvLg"))()'},
	{name = "Bombx", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/xc4a6WLc"))()'},
	{name = "Gojo", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/aTPhjDg6"))()'},
	{name = "🛹", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/eAAFhgWQ"))()'},
	{name = "☀️", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/eEk5pDuq"))()'},
	{name = "Rain", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/TkK71r8S"))()'},
	{name = "G00BY Flag", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/AFqLf3ch"))()'},
	{name = "🔥", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/zMYkTvZ2"))()'},
	{name = "Jet", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/uJxmQvTu"))()'},
	{name = "Turkey Map", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/Q0UnaHWB"))()'},
	{name = "CarV2", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/fsdZn0jR"))()'},
	{name = "BombV3", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/S6cQSYvj"))()'},
	{name = "DOZER", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/xqBbuMQp"))()'},
	{name = "🔥🔥", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/tERrXPvD"))()'},
	{name = "Hammer", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/86SRccmJ"))()'},
}

-- PROJECT bölümü
local projectScripts = {
	{name = "Project Lua", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Project-lua-Beta-version-87357"))()'},
	{name = "Project Ligma", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Project-ligma-leaked-73729"))()'},
	{name = "Stigma", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ss-executor-46339"))()'},
	{name = "Hanif", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Private-gui-by-hanif-leak-40943"))()'},
	{name = "gg ss3", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gg-executor-79018"))()'},
	{name = "Klaus SS", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-KlausGui-SS-73938"))()'},
	{name = "SS PANEL", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Ss-panel-63554"))()'},
	{name = "Project Dominant", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Best-Dominant-Executor-Remake-ig-67991"))()'},
	{name = "Rc7", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-RC7-56874"))()'},
	{name = "Epik Guy V2", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Epikguy-gui-v2-op-87889"))()'},
	{name = "Elysian", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fe-bypass-By-Ex00kidlzt-87421"))()'},
	{name = "bipolaria", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Bipolaria-Lua-85632"))()'},
	{name = "Superz private", script = 'loadstring(game:HttpGet("https://pastefy.app/Ih9xevvS/raw",true))()'},
	{name = "Private gui", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-1x-1x-1x-1x-1xSuper-private-gui-V5dot40-leak-by-me-36518"))()'},
	{name = "SUPER PRİVATE", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Private-gui-by-duck-team-50561"))()'},
}

-- CHARACTER bölümü
local characterScripts = {
	{name = "Kill Bot", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/yraarJ7m"))()'},
	{name = "MLG GUN", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Client-Replication-the-ss-loadstring-script-27393"))()'},
	{name = "Steve", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Test4267/steve/refs/heads/main/rare"))()'},
	{name = "Primadon", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/pandora"))()'},
	{name = "Star", script = 'loadstring(game:HttpGet("https://pastebin.com/raw/j09BnGB3"))()'},
	{name = "Rainbow King", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ian49972/SCRIPTS/refs/heads/main/Rainbow%20Banisher"))()'},
	{name = "Server Admin", script = 'loadstring(game:HttpGet("https://pastefy.app/ur8n4dc6/raw"))()'},
	{name = "Sin Dragon", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/gitezgitgit/Sin-Dragon/refs/heads/main/Sin%20Dragon.lua.txt"))()'},
	{name = "grab knife v2", script = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/Grab%20Knife%20V2.lua"))()'},
	{name = "Shotgun", script = 'loadstring(game:HttpGet("https://pastefy.app/1RhJtgDi/raw"))()'},
	{name = "Glock", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-GLOCK-TXT-85411"))()'},
	{name = "Nyancat", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-TXT-NyancatSkybox-43395"))()'},
	{name = "ShotGunV2", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Barricade-Shotgun-Scrpit-82248"))()'},
	{name = "ShotGun v3", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-A-Shotgun-CLIENTSIDED-59040"))()'},
	{name = "Goner", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Goner-47954"))()'},
}

-- ADVANTAGE bölümü
local advantageScripts = {
	{name = "Shift lock", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Maxus-Shiftlock-55223"))()'},
	{name = "Esp", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-ESP-87796"))()'},
	{name = "Fps", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Fps-booster-18602"))()'},
	{name = "animation pack", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Animation-Pack-FE-88221"))()'},
	{name = "Audio Copy", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Roblox-Audio-Logger-1522"))()'},
	{name = "Auto Click", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Auto-click-made-by-grok-Ai-74334"))()'},
	{name = "Anime skybox", script = 'loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Anime-skybox-85058"))()'},
}

-- Buton oluşturma fonksiyonu
local function createButton(name, scriptCode, layoutOrder)
	local Button = Instance.new("TextButton")
	Button.Name = name
	Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Button.Text = name
	Button.TextSize = 11
	Button.Font = Enum.Font.GothamBold
	Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	Button.BorderSizePixel = 0
	Button.LayoutOrder = layoutOrder
	Button.Parent = ScrollFrame
	
	local ButtonCorner = Instance.new("UICorner")
	ButtonCorner.CornerRadius = UDim.new(0, 5)
	ButtonCorner.Parent = Button
	
	Button.MouseButton1Click:Connect(function()
		local success, err = pcall(function()
			loadstring(scriptCode)()
		end)
		if success then
			Button.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
			wait(0.3)
			Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		else
			warn("Script error:", err)
			Button.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
			wait(0.3)
			Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		end
	end)
	
	Button.MouseEnter:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
	end)
	
	Button.MouseLeave:Connect(function()
		Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	end)
	
	return Button
end

-- Ayırıcı oluşturma fonksiyonu
local function createDivider(text, layoutOrder)
	local Divider = Instance.new("Frame")
	Divider.Name = "Divider"
	Divider.Size = UDim2.new(1, -8, 0, 25)
	Divider.BackgroundTransparency = 1
	Divider.LayoutOrder = layoutOrder
	Divider.Parent = ScrollFrame
	
	local Line = Instance.new("Frame")
	Line.Size = UDim2.new(1, 0, 0, 2)
	Line.Position = UDim2.new(0, 0, 0.5, 0)
	Line.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	Line.BorderSizePixel = 0
	Line.Parent = Divider
	
	local Label = Instance.new("TextLabel")
	Label.Size = UDim2.new(0, 120, 1, 0)
	Label.Position = UDim2.new(0.5, -60, 0, 0)
	Label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	Label.Text = text
	Label.TextSize = 13
	Label.Font = Enum.Font.GothamBold
	Label.TextColor3 = Color3.fromRGB(255, 0, 0)
	Label.Parent = Divider
	
	return Divider
end

-- Butonları oluştur
local layoutOrder = 1

-- İlk scriptler
for _, data in ipairs(scripts) do
	createButton(data.name, data.script, layoutOrder)
	layoutOrder = layoutOrder + 1
end

-- PROJECT ayırıcı
createDivider("PROJECT", layoutOrder)
layoutOrder = layoutOrder + 1

for _, data in ipairs(projectScripts) do
	createButton(data.name, data.script, layoutOrder)
	layoutOrder = layoutOrder + 1
end

-- CHARACTER ayırıcı
createDivider("CHARACTER", layoutOrder)
layoutOrder = layoutOrder + 1

for _, data in ipairs(characterScripts) do
	createButton(data.name, data.script, layoutOrder)
	layoutOrder = layoutOrder + 1
end

-- ADVANTAGE ayırıcı
createDivider("ADVANTAGE", layoutOrder)
layoutOrder = layoutOrder + 1

for _, data in ipairs(advantageScripts) do
	createButton(data.name, data.script, layoutOrder)
	layoutOrder = layoutOrder + 1
end

-- Canvas boyutunu ayarla
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 8)
GridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, GridLayout.AbsoluteContentSize.Y + 8)
end)

print("Polerinas Project 3.0 yüklendi!")