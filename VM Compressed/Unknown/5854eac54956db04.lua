-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Executor = Instance.new("Frame")
local Execute = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local UICorner_2 = Instance.new("UICorner")
local Writescripts = Instance.new("TextBox")
local Clear = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Executorname = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local Welcome = Instance.new("Frame")
local Nameofplayer = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")
local Scripthub = Instance.new("Frame")
local UICorner_5 = Instance.new("UICorner")
local Scripthub_2 = Instance.new("TextLabel")
local UICorner_6 = Instance.new("UICorner")
local IY = Instance.new("TextButton")
local Dexforsolara = Instance.new("TextButton")
local Sirus = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Executor.Name = "Executor"
Executor.Parent = ScreenGui
Executor.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Executor.BorderColor3 = Color3.fromRGB(0, 0, 0)
Executor.BorderSizePixel = 0
Executor.Position = UDim2.new(0.305422097, 0, 0.24004975, 0)
Executor.Size = UDim2.new(0, 566, 0, 332)
Executor.Visible = false

Execute.Name = "Execute"
Execute.Parent = Executor
Execute.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Execute.BorderColor3 = Color3.fromRGB(0, 0, 0)
Execute.BorderSizePixel = 0
Execute.Position = UDim2.new(0.038869258, 0, 0.810240984, 0)
Execute.Size = UDim2.new(0, 200, 0, 50)
Execute.Font = Enum.Font.SourceSans
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 14.000

UICorner.Parent = Execute

UICorner_2.Parent = Executor

Writescripts.Name = "Write scripts"
Writescripts.Parent = Executor
Writescripts.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Writescripts.BorderColor3 = Color3.fromRGB(0, 0, 0)
Writescripts.BorderSizePixel = 0
Writescripts.Position = UDim2.new(0.077738516, 0, 0.262048185, 0)
Writescripts.Size = UDim2.new(0, 474, 0, 176)
Writescripts.Font = Enum.Font.SourceSans
Writescripts.MultiLine = true
Writescripts.Text = ""
Writescripts.TextColor3 = Color3.fromRGB(255, 255, 255)
Writescripts.TextSize = 20.000
Writescripts.TextXAlignment = Enum.TextXAlignment.Left
Writescripts.TextYAlignment = Enum.TextYAlignment.Top

Clear.Name = "Clear"
Clear.Parent = Executor
Clear.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Clear.BorderColor3 = Color3.fromRGB(0, 0, 0)
Clear.BorderSizePixel = 0
Clear.Position = UDim2.new(0.598939955, 0, 0.810240984, 0)
Clear.Size = UDim2.new(0, 200, 0, 50)
Clear.Font = Enum.Font.SourceSans
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 14.000

UICorner_3.Parent = Clear

Executorname.Name = "Executor name"
Executorname.Parent = Executor
Executorname.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Executorname.BorderColor3 = Color3.fromRGB(0, 0, 0)
Executorname.BorderSizePixel = 0
Executorname.Size = UDim2.new(0, 566, 0, 50)
Executorname.Font = Enum.Font.SourceSans
Executorname.TextColor3 = Color3.fromRGB(255, 255, 255)
Executorname.TextSize = 30.000

UICorner_4.Parent = Executorname

Welcome.Name = "Welcome"
Welcome.Parent = ScreenGui
Welcome.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Welcome.BorderColor3 = Color3.fromRGB(0, 0, 0)
Welcome.BorderSizePixel = 0
Welcome.Position = UDim2.new(0.305422097, 0, 0.24004975, 0)
Welcome.Size = UDim2.new(0, 566, 0, 332)

Nameofplayer.Name = "Name of player"
Nameofplayer.Parent = Welcome
Nameofplayer.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Nameofplayer.BorderColor3 = Color3.fromRGB(0, 0, 0)
Nameofplayer.BorderSizePixel = 0
Nameofplayer.Position = UDim2.new(0.19611308, 0, 0.493975908, 0)
Nameofplayer.Size = UDim2.new(0, 354, 0, 87)
Nameofplayer.Font = Enum.Font.SourceSans
Nameofplayer.TextColor3 = Color3.fromRGB(241, 241, 241)
Nameofplayer.TextSize = 70.000

TextLabel.Parent = Welcome
TextLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.249116614, 0, 0.198795184, 0)
TextLabel.Size = UDim2.new(0, 293, 0, 65)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Welcome"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 50.000

Scripthub.Name = "Script hub"
Scripthub.Parent = ScreenGui
Scripthub.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Scripthub.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scripthub.BorderSizePixel = 0
Scripthub.Position = UDim2.new(0.10408432, 0, 0.197761193, 0)
Scripthub.Size = UDim2.new(0, 244, 0, 419)
Scripthub.Visible = false

UICorner_5.Parent = Scripthub

Scripthub_2.Name = "Scripthub"
Scripthub_2.Parent = Scripthub
Scripthub_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Scripthub_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
Scripthub_2.BorderSizePixel = 0
Scripthub_2.Size = UDim2.new(0, 244, 0, 61)
Scripthub_2.Font = Enum.Font.SourceSans
Scripthub_2.Text = "Scripthub"
Scripthub_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Scripthub_2.TextSize = 35.000

UICorner_6.Parent = Scripthub_2

IY.Name = "IY"
IY.Parent = Scripthub
IY.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
IY.BorderColor3 = Color3.fromRGB(35, 35, 35)
IY.BorderSizePixel = 0
IY.Position = UDim2.new(0, 0, 0.200477332, 0)
IY.Size = UDim2.new(0, 244, 0, 50)
IY.Font = Enum.Font.SourceSans
IY.Text = "IY"
IY.TextColor3 = Color3.fromRGB(255, 255, 255)
IY.TextSize = 35.000

Dexforsolara.Name = "Dex for solara"
Dexforsolara.Parent = Scripthub
Dexforsolara.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Dexforsolara.BorderColor3 = Color3.fromRGB(40, 40, 40)
Dexforsolara.BorderSizePixel = 0
Dexforsolara.Position = UDim2.new(0, 0, 0.319809079, 0)
Dexforsolara.Size = UDim2.new(0, 244, 0, 50)
Dexforsolara.Font = Enum.Font.SourceSans
Dexforsolara.Text = "Dex For Solara"
Dexforsolara.TextColor3 = Color3.fromRGB(255, 255, 255)
Dexforsolara.TextSize = 14.000

Sirus.Name = "Sirus"
Sirus.Parent = Scripthub
Sirus.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Sirus.BorderColor3 = Color3.fromRGB(0, 0, 0)
Sirus.BorderSizePixel = 0
Sirus.Position = UDim2.new(0, 0, 0.439140797, 0)
Sirus.Size = UDim2.new(0, 244, 0, 50)
Sirus.Font = Enum.Font.SourceSans
Sirus.Text = "Sirus script"
Sirus.TextColor3 = Color3.fromRGB(255, 255, 255)
Sirus.TextSize = 14.000

-- Scripts:

local function NPUE_fake_script() -- Executor.LocalScript 
	local script = Instance.new('LocalScript', Executor)

	script.Parent.Draggable = true
	script.Parent.Active = true
end
coroutine.wrap(NPUE_fake_script)()
local function CXIHJJK_fake_script() -- Executor.LocalScript 
	local script = Instance.new('LocalScript', Executor)

	local UserInputService = game:GetService("UserInputService")
	local toggleState = false
	
	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.Insert then
			toggleState = not toggleState
			if toggleState then
				script.Parent.Visible = true
			else
				script.Parent.Visible = false
			end
		end
	end)
end
coroutine.wrap(CXIHJJK_fake_script)()
local function VPJEDL_fake_script() -- Executor.LocalScript 
	local script = Instance.new('LocalScript', Executor)

	local Executor = script.Parent
	wait(2)
	Executor.Visible = true
end
coroutine.wrap(VPJEDL_fake_script)()
local function OKTAM_fake_script() -- Execute.LocalScript 
	local script = Instance.new('LocalScript', Execute)

	local button = script.Parent
	local textbox = script.Parent.Parent["Write scripts"]
	button.MouseButton1Click:Connect(function()
		loadstring(textbox.Text)()
	end)
end
coroutine.wrap(OKTAM_fake_script)()
local function BRIN_fake_script() -- Clear.LocalScript 
	local script = Instance.new('LocalScript', Clear)

	local button = script.Parent
	local textbox = script.Parent.Parent["Write scripts"]
	button.MouseButton1Click:Connect(function()
		textbox.Text = ""
	end)
end
coroutine.wrap(BRIN_fake_script)()
local function NLMYPDF_fake_script() -- Executorname.LocalScript 
	local script = Instance.new('LocalScript', Executorname)

	local Label = script.Parent
	local Player = game.Players.LocalPlayer
	
	Label.Text = Player.Name.." executor"
end
coroutine.wrap(NLMYPDF_fake_script)()
local function WBMNE_fake_script() -- Nameofplayer.LocalScript 
	local script = Instance.new('LocalScript', Nameofplayer)

	local Label = script.Parent
	local Player = game.Players.LocalPlayer
	
	Label.Text = Player.Name
	
	wait(2)
	Label.Parent.Visible = false
end
coroutine.wrap(WBMNE_fake_script)()
local function FQWREP_fake_script() -- Scripthub.LocalScript 
	local script = Instance.new('LocalScript', Scripthub)

	script.Parent.Draggable = true
	script.Parent.Active = true
end
coroutine.wrap(FQWREP_fake_script)()
local function IGCQRHY_fake_script() -- Scripthub.LocalScript 
	local script = Instance.new('LocalScript', Scripthub)

	local Hub = script.Parent
	
	wait(2)
	Hub.Visible = true
end
coroutine.wrap(IGCQRHY_fake_script)()
local function XPSAXR_fake_script() -- Scripthub.LocalScript 
	local script = Instance.new('LocalScript', Scripthub)

	local UserInputService = game:GetService("UserInputService")
	local toggleState = false
	
	UserInputService.InputBegan:Connect(function(input)
		if input.KeyCode == Enum.KeyCode.Insert then
			toggleState = not toggleState
			if toggleState then
				script.Parent.Visible = true
			else
				script.Parent.Visible = false
			end
		end
	end)
end
coroutine.wrap(XPSAXR_fake_script)()
local function DAKZS_fake_script() -- IY.LocalScript 
	local script = Instance.new('LocalScript', IY)

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end)
end
coroutine.wrap(DAKZS_fake_script)()
local function YJHO_fake_script() -- Dexforsolara.LocalScript 
	local script = Instance.new('LocalScript', Dexforsolara)

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/ghxst1s/DarkDexSolara/main/Dark%20Dex%20Solara.txt"))()
	end)
end
coroutine.wrap(YJHO_fake_script)()
local function ZCZLI_fake_script() -- Sirus.LocalScript 
	local script = Instance.new('LocalScript', Sirus)

	local button = script.Parent
	
	button.MouseButton1Click:Connect(function()
		loadstring(game:HttpGet('https://sirius.menu/sirius'))()
	end)
end
coroutine.wrap(ZCZLI_fake_script)()
