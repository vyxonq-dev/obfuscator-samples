--========================================

-- Ã°Å¸Â§Â© GUI UTAMA (z00kiddl gui) MUNCUL DULU

--========================================

local player = game.Players.LocalPlayer

local runService = game:GetService("RunService")

local gui = Instance.new("ScreenGui")

gui.Name = "red7spooky gui"

gui.Parent = player:WaitForChild("PlayerGui")

gui.ResetOnSpawn = false

-- Frame utama

local mainFrame = Instance.new("Frame")

mainFrame.Size = UDim2.new(0, 375, 0, 650)

mainFrame.Position = UDim2.new(0.5, -200, 0.5, -325)

mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

mainFrame.BorderSizePixel = 2

mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 255) -- Ã°Å¸âÂµ ganti jadi biru

mainFrame.Active = true

mainFrame.Draggable = true

mainFrame.Parent = gui

-- Judul

local titleText = Instance.new("TextLabel")

titleText.Size = UDim2.new(1, 0, 0, 40)

titleText.BackgroundColor3 = Color3.fromRGB(20, 20, 20)

titleText.Text = "z00kiddl gui"

titleText.TextColor3 = Color3.fromRGB(255, 255, 255)

titleText.Font = Enum.Font.Code

titleText.TextSize = 25

titleText.Parent = mainFrame

-- Fungsi buat tombol (silent mode)

local function createButton(name, parent, posX, posY, url, rotation)

	local btn = Instance.new("TextButton")	btn.Size = UDim2.new(0, 160, 0, 35)

	btn.Position = UDim2.new(posX, 0, posY, 0)

	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

	btn.BorderSizePixel = 1

	btn.BorderColor3 = Color3.fromRGB(0, 0, 255) -- Ã°Å¸âÂµ sebelumnya hijau

	btn.Font = Enum.Font.SourceSans

	btn.Text = name

	btn.TextColor3 = Color3.fromRGB(255, 255, 255)

	btn.TextSize = 18

	btn.Rotation = rotation or 0

	btn.Parent = parent

	btn.MouseButton1Click:Connect(function()

		if url and url ~= "" then

			task.spawn(function()

				local ok, err = pcall(function()

					loadstring(game:HttpGet(url))()

				end)

			end)

		end

	end)

end

-- Posisi tombol dalam

local insideLeftY = {0.1,0.19,0.28,0.37,0.46,0.55,0.64,0.73,0.82,0.91}

local insideRightY = {0.1,0.19,0.28,0.37,0.46,0.55,0.64,0.73,0.82,0.91}

-- URL kiri & kanan

local leftInsideURLs = {

	"https://pastefy.app/HWbdevXf/raw",

	"https://pastefy.app/tX6LiRoT/raw",

	"https://pastefy.app/XDc6yxTO/raw",

	"https://pastefy.app/le7UXaTo/raw",

	"https://pastefy.app/4YJtCIq9/raw",

	"https://rawscripts.net/raw/Universal-Script-Better-toad-rain-32545",

	"https://pastefy.app/L9ehHB3W/raw",

	"https://pastefy.app/rJFrDWWI/raw",

	"https://pastefy.app/yTP36ixZ/raw",

	"https://pastebin.com/raw/WneFn7Wv"

}

local rightInsideURLs = {

	"https://pastefy.app/6hQPrW8e/raw",

	"https://pastefy.app/WAIOwr8A/raw",

	"https://pastefy.app/SZ0ttPdX/raw",

	"https://pastefy.app/cBoe6d9s/raw",

	"https://pastefy.app/ucHp8ddg/raw",

	"https://pastefy.app/F7kBPz0g/raw",

	"https://pastefy.app/e76pHc5b/raw",

	"https://pastefy.app/25Wo75JN/raw",

	"https://pastefy.app/S2dvTTS6/raw",

	"https://pastefy.app/4LEdMVEk/raw"

}

local leftInsideNames = {"decal","sky1","sky2","get btools","particle","toad rain","fire all","Avatar all","spooky","Thomas"}

local rightInsideNames = {"Rain troll","message1","message2","title all","audio1","audio2","audio3","audio4","decal scary2","sky3"}

for i=1,10 do

	createButton(leftInsideNames[i], mainFrame, 0.05, insideLeftY[i], leftInsideURLs[i])

	createButton(rightInsideNames[i], mainFrame, 0.5, insideRightY[i], rightInsideURLs[i])

end

-- Tombol luar kiri & kanan

local leftOuterFrame = Instance.new("Frame")

leftOuterFrame.Size = UDim2.new(0, 170, 0, 650)

leftOuterFrame.BackgroundTransparency = 1

leftOuterFrame.Parent = gui

local rightOuterFrame = Instance.new("Frame")

rightOuterFrame.Size = UDim2.new(0, 170, 0, 650)

rightOuterFrame.BackgroundTransparency = 1

rightOuterFrame.Parent = gui

local outerButtonsY = {0.05,0.14,0.23,0.32,0.41,0.50,0.59,0.68,0.77,0.86}

local leftOuterURLs = {

	"https://pastefy.app/lPmNDqMr/raw",

	"https://pastefy.app/iSqI5fkA/raw",

	"https://pastefy.app/NBvbap6c/raw",

	"https://pastefy.app/BZpkrEZG/raw",

	"https://pastebin.com/raw/wpLgGV9C",

	"https://pastebin.com/raw/Ef7pWRxW",

	"https://pastebin.com/raw/jizrcbd4",

	"https://pastebin.com/raw/CbcJNcrM",

	"https://pastebin.com/raw/VH7HiHej",

	"https://pastebin.com/raw/4RVkHQQi"

}

local rightOuterURLs = {

	"https://pastefy.app/IR7s8Jul/raw",

	"https://pastefy.app/8qAIeDay/raw",

	"https://pastefy.app/8qAIeDay/raw",

	"https://pastefy.app/oNougxys/raw",

	"https://pastefy.app/p6mT2mzG/raw",

	"https://pastefy.app/38YPGxkw/raw",

	"https://pastefy.app/5zVghWhf/raw",

	"https://pastefy.app/Bo74L7xR/raw",

	"https://pastebin.com/raw/qJhYhABq",

	"https://pastefy.app/Lbjknyle/raw"

}

local leftOuterNames = {"gun1","gun2","r6","crash all","rain rc7","rontingsky","skybox shedletsky","no animation","Cloud rc7","Obama rain"}

local rightOuterNames = {"Indonesia","decal","skybox","particle","decal","decal scary","sky scary","partic scary","smile sky","baseplate"}

for i=1,10 do

	createButton(leftOuterNames[i], leftOuterFrame, 0, outerButtonsY[i], leftOuterURLs[i], -15)

	createButton(rightOuterNames[i], rightOuterFrame, 0, outerButtonsY[i], rightOuterURLs[i], 15)

end

runService.RenderStepped:Connect(function()

	leftOuterFrame.Position = mainFrame.Position - UDim2.new(0, 175, 0, 0)

	rightOuterFrame.Position = mainFrame.Position + UDim2.new(0, 380, 0, 0)

end)

--========================================

-- Ã°Å¸ÅË GUI RING (RainbowRingUI) MUNCUL KEDUA

--========================================

task.delay(1, function()

	local ringGui = Instance.new("ScreenGui")

	ringGui.Name = "RainbowRingUI"

	ringGui.Parent = player:WaitForChild("PlayerGui")

	ringGui.ResetOnSpawn = false

	local ring = Instance.new("ImageLabel")

	ring.Size = UDim2.new(0, 135, 0, 135)

	ring.AnchorPoint = Vector2.new(0.5, 0.5)

	ring.Position = UDim2.new(0.5, 0, 0.5, 0)

	ring.BackgroundTransparency = 1

	ring.Image = "rbxassetid://80607924147749"

	ring.ImageTransparency = 0

	ring.Parent = ringGui

	ring:TweenPosition(UDim2.new(0.04, 0, 0.82, 0), "Out", "Sine", 0.7, false)

	local gradient = Instance.new("UIGradient")

	gradient.Color = ColorSequence.new({

		ColorSequenceKeypoint.new(0.0, Color3.fromRGB(255, 0, 0)),

		ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 165, 0)),

		ColorSequenceKeypoint.new(0.33, Color3.fromRGB(255, 255, 0)),

		ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 255, 0)),

		ColorSequenceKeypoint.new(0.67, Color3.fromRGB(0, 127, 255)),

		ColorSequenceKeypoint.new(0.83, Color3.fromRGB(139, 0, 255)),

		ColorSequenceKeypoint.new(1.0, Color3.fromRGB(255, 0, 0))

	})

	gradient.Parent = ring

	while task.wait(0.03) do

		ring.Rotation = (ring.Rotation + 2) % 360

		gradient.Rotation = (gradient.Rotation + 5) % 360

	end

end)