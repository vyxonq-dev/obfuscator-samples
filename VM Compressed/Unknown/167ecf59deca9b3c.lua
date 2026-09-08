-- -- // STELLAR Loader tanpa suara ketik dan tombol skip

-- local Players = game:GetService("Players")
-- local TweenService = game:GetService("TweenService")
-- local Lighting = game:GetService("Lighting")
-- local player = Players.LocalPlayer

-- -- Efek Blur
-- local blur = Instance.new("BlurEffect", Lighting)
-- blur.Size = 0
-- TweenService:Create(blur, TweenInfo.new(0.5), {Size = 24}):Play()

-- -- Buat ScreenGui
-- local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
-- screenGui.Name = "StellarLoader"
-- screenGui.ResetOnSpawn = false
-- screenGui.IgnoreGuiInset = true

-- -- Frame utama
-- local frame = Instance.new("Frame", screenGui)
-- frame.Size = UDim2.new(1, 0, 1, 0)
-- frame.BackgroundTransparency = 1

-- -- Background gelap semi transparan
-- local bg = Instance.new("Frame", frame)
-- bg.Size = UDim2.new(1, 0, 1, 0)
-- bg.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
-- bg.BackgroundTransparency = 1
-- bg.ZIndex = 0
-- TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()

-- -- Kata "STELLAR"
-- local word = "STELLAR"
-- local letters = {}

-- -- Fungsi tween keluar dan bersihkan
-- local function tweenOutAndDestroy()
-- 	for _, label in ipairs(letters) do
-- 		TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 1, TextSize = 20}):Play()
-- 	end
-- 	TweenService:Create(bg, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
-- 	TweenService:Create(blur, TweenInfo.new(0.5), {Size = 0}):Play()
-- 	wait(0.6)
-- 	screenGui:Destroy()
-- 	blur:Destroy()
-- end

-- -- Loop munculkan huruf satu per satu dengan efek zoom tanpa suara
-- for i = 1, #word do
-- 	local char = word:sub(i, i)

-- 	local label = Instance.new("TextLabel")
-- 	label.Text = char
-- 	label.Font = Enum.Font.GothamBlack
-- 	label.TextColor3 = Color3.new(1, 1, 1)
-- 	label.TextStrokeTransparency = 1 -- tanpa outline
-- 	label.TextTransparency = 1
-- 	label.TextScaled = false
-- 	label.TextSize = 30 -- start kecil untuk zoom effect
-- 	label.Size = UDim2.new(0, 60, 0, 60)
-- 	label.AnchorPoint = Vector2.new(0.5, 0.5)
-- 	label.Position = UDim2.new(0.5, (i - (#word / 2 + 0.5)) * 65, 0.5, 0)
-- 	label.BackgroundTransparency = 1
-- 	label.Parent = frame

-- 	-- Gradient biru muda
-- 	local gradient = Instance.new("UIGradient")
-- 	gradient.Color = ColorSequence.new({
-- 		ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 170, 255)), -- biru muda cerah
-- 		ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 100, 160))   -- biru muda gelap
-- 	})
-- 	gradient.Rotation = 90
-- 	gradient.Parent = label

-- 	-- Tween muncul dan zoom in (tanpa suara)
-- 	local tweenIn = TweenService:Create(label, TweenInfo.new(0.3), {TextTransparency = 0, TextSize = 60})
-- 	tweenIn:Play()

-- 	table.insert(letters, label)
-- 	wait(0.25)
-- end

-- -- Tunggu sebentar sebelum tween keluar otomatis
-- wait(2)

-- tweenOutAndDestroy()

local StellarLibrary = (loadstring(Game:HttpGet("https://raw.githubusercontent.com/x2zu/OPEN-SOURCE-UI-ROBLOX/refs/heads/main/X2ZU%20UI%20ROBLOX%20OPEN%20SOURCE/NewUiStellar.lua")))();
if StellarLibrary:LoadAnimation() then
	StellarLibrary:StartLoad();
end;
if StellarLibrary:LoadAnimation() then
	StellarLibrary:Loaded();
end;
local UserInputService = game:GetService("UserInputService")
local Window = StellarLibrary:Window({
	SubTitle = "x2zu Project",
	Size = game:GetService("UserInputService").TouchEnabled and UDim2.new(0, 380, 0, 260) or UDim2.new(0, 500, 0, 320),
	TabWidth = 140
})
local Information = Window:Tab("Information", "rbxassetid://128891143813807");
local General = Window:Tab("Main", "rbxassetid://10723407389");
local Tab3 = Window:Tab("Farming", "rbxassetid://10723415335");
local Tab4 = Window:Tab("Items", "rbxassetid://10709782497");
local Tab5 = Window:Tab("Setting", "rbxassetid://10734950309");
local Tab6 = Window:Tab("Local Player", "rbxassetid://10747373176");
local Tab7 = Window:Tab("Hold Skill", "rbxassetid://10734984606");
local Settings = Window:Tab("Setting", "rbxassetid://98216376967992");
-- local Information = Window:Tab("Information", "rbxassetid://128891143813807");
-- local General = Window:Tab("General", "rbxassetid://92150073897728");
-- local Tab3 = Window:Tab("Tab3", "rbxassetid://83493480205564");
-- local Tab4 = Window:Tab("Tab4", "rbxassetid://82733483462291");
-- local Tab5 = Window:Tab("Tab5", "rbxassetid://121264555493885");
-- local Tab6 = Window:Tab("Tab6", "rbxassetid://113316938807084");
-- local Tab7 = Window:Tab("Tab7", "rbxassetid://71040312165698"); 
-- local Tab8 = Window:Tab("Tab8", "rbxassetid://136162614128994");


Information:Seperator("Annoucements")
Info = Information:Label("Important")

General:Seperator("Main");
Time = General:Label("Executor Time");
function StellarLibraryTime()
	local GameTime = math.floor(workspace.DistributedGameTime + 0.5);
	local Hour = math.floor(GameTime / 60 ^ 2) % 24;
	local Minute = math.floor(GameTime / 60 ^ 1) % 60;
	local Second = math.floor(GameTime / 60 ^ 0) % 60;
	Time:Set("[Game Time] : Hours : " .. Hour .. " Min : " .. Minute .. " Sec : " .. Second);
end;
spawn(function()
	while task.wait() do
		pcall(function()
			StellarLibraryTime();
		end);
	end;
end);
Client = General:Label("Client");
function StellarLibraryClient()
	local Fps = workspace:GetRealPhysicsFPS();
	Client:Set("[Fps] : " .. Fps);
end;
spawn(function()
	while true do
		wait(0.1);
		StellarLibraryClient();
	end;
end);
Client1 = General:Label("Client");
function StellarLibraryClient1()
	local Ping = (game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValueString();
	Client1:Set("[Ping] : " .. Ping);
end;
spawn(function()
	while true do
		wait(0.1);
		StellarLibraryClient1();
	end;
end);
General:Button("Copy Discord Link", function()
	setclipboard("https://discord.gg/FmMuvkaWvG");
	StellarLibrary:Notify("Copied!", 3);
end);
General:Label("Status : label");
-- Dropdown
General:Seperator("Dropdown");
General:Dropdown("Type", {"Option 1", "Option 2", "Option 3"}, nil, function(selected)
    print("Selected number:", selected)
end)


-- Toggle
General:Seperator("Toggle");
General:Toggle("Type", {"Option 1", "Option 2", "Option 3"}, "Toggle with desc", function(selected)
    print("Selected number:", selected)
end)
General:Toggle("Type", {"Option 1", "Option 2", "Option 3"}, nil, function(selected)
    print("Selected number:", selected)
end)

-- Slider
General:Seperator("Slider");
General:Slider("Farm Distance", 0, 50, 25, function(value)
    print("Selected Farm Distance:", value)
end)

General:Line();
local JobLabel = General:Label("Server Job ID :")

General:Button("Copy Server Job ID", function()
	setclipboard("https://discord.gg/FmMuvkaWvG");
	StellarLibrary:Notify("Copied!", 3);
end)

General:Textbox("Enter Server Job ID", true, function(value)
    print("Entered Job ID:", value)
end)

General:Button("Join Server", function()
    print("Teleporting to Job ID...") -- Ganti dengan teleport logic jika diperlukan
end)
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/FOGOTY/FoggyObfuscator/refs/heads/main/script"))()