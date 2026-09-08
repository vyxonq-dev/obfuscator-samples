local player = game.Players.LocalPlayer

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))

gui.Name = "0xnu51 page gui v1"

gui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame", gui)

local fullSize = UDim2.new(0, 500, 0, 350)

local minSize = UDim2.new(0, 500, 0, 40)

mainFrame.Size = fullSize

mainFrame.Position = UDim2.new(0.5, -250, 0.5, -175)

mainFrame.BackgroundColor3 = Color3.fromRGB(36, 36, 37)

mainFrame.Active = true

mainFrame.Draggable = true

local title = Instance.new("TextLabel", mainFrame)

title.Size = UDim2.new(1, 0, 0, 40)

title.Text = "0xNu51 gui pack v1"

title.TextColor3 = Color3.new(1, 1, 1)

title.BackgroundTransparency = 1

title.Font = Enum.Font.SourceSansBold

title.TextSize = 28

local tabButtons = {}

local tabNames = {"Welcome", "Executor", "Script Hub"}

for i, name in ipairs(tabNames) do

	local btn = Instance.new("TextButton", mainFrame)	btn.Size = UDim2.new(0, 150, 0, 30)

	btn.Position = UDim2.new(0, (i - 1) * 160, 0, 45)

	btn.Text = name

	btn.TextColor3 = Color3.new(1, 1, 1)

	btn.BackgroundTransparency = 1

	btn.Font = Enum.Font.SourceSansBold

	btn.TextSize = 20

	tabButtons[name] = btn

end

local pages = {}

local welcomePage = Instance.new("TextLabel", mainFrame)

welcomePage.Size = UDim2.new(1, -20, 1, -90)

welcomePage.Position = UDim2.new(0, 10, 0, 85)

welcomePage.Text = "TIKTOK= F3XYZ6'S.EXPLOITER"

welcomePage.TextColor3 = Color3.new(1, 1, 1)

welcomePage.BackgroundTransparency = 1

welcomePage.Font = Enum.Font.SourceSans

welcomePage.TextSize = 20

welcomePage.TextWrapped = true

pages["Welcome"] = welcomePage

local executorPage = Instance.new("Frame", mainFrame)

executorPage.Size = UDim2.new(1, -20, 1, -90)

executorPage.Position = UDim2.new(0, 10, 0, 85)

executorPage.BackgroundTransparency = 1

pages["Executor"] = executorPage

local execBox = Instance.new("TextBox", executorPage)

execBox.Size = UDim2.new(1, 0, 0, 180)

execBox.Position = UDim2.new(0, 0, 0, 0)

execBox.Text = "-- made by 0XNU51.lua"

execBox.TextColor3 = Color3.new(1, 1, 1)

execBox.BackgroundTransparency = 0

execBox.BackgroundColor3 = Color3.new(0, 0, 0)

execBox.Font = Enum.Font.SourceSans

execBox.TextSize = 18

execBox.ClearTextOnFocus = false

execBox.MultiLine = true

execBox.TextWrapped = true

execBox.TextXAlignment = Enum.TextXAlignment.Left

execBox.TextYAlignment = Enum.TextYAlignment.Top

execBox.BorderSizePixel = 0

local runBtn = Instance.new("TextButton", executorPage)

runBtn.Size = UDim2.new(0, 100, 0, 30)

runBtn.Position = UDim2.new(0, 0, 0, 190)

runBtn.Text = "Execute"

runBtn.TextColor3 = Color3.new(1, 1, 1)

runBtn.BackgroundTransparency = 1

runBtn.Font = Enum.Font.SourceSansBold

runBtn.TextSize = 20

local clearBtn = Instance.new("TextButton", executorPage)

clearBtn.Size = UDim2.new(0, 100, 0, 30)

clearBtn.Position = UDim2.new(0, 110, 0, 190)

clearBtn.Text = "Clear"

clearBtn.TextColor3 = Color3.new(1, 1, 1)

clearBtn.BackgroundTransparency = 1

clearBtn.Font = Enum.Font.SourceSansBold

clearBtn.TextSize = 20

runBtn.MouseButton1Click:Connect(function()

	local success, err = pcall(function()

		loadstring(execBox.Text)()

	end)

	if not success then

		warn("Script Error:", err)

	end

end)

clearBtn.MouseButton1Click:Connect(function()

	execBox.Text = ""

end)

local hubPage = Instance.new("ScrollingFrame", mainFrame)

hubPage.BorderSizePixel = 0

hubPage.Size = UDim2.new(1, -20, 1, -90)

hubPage.Position = UDim2.new(0, 10, 0, 85)

hubPage.BackgroundTransparency = 1

hubPage.ScrollBarThickness = 4

pages["Script Hub"] = hubPage

local function createManualButton(yPos, label, action)

	local btn = Instance.new("TextButton", hubPage)

	btn.Size = UDim2.new(1, -10, 0, 30)

	btn.Position = UDim2.new(0, 5, 0, yPos)

	btn.Text = label

	btn.TextColor3 = Color3.new(1, 1, 1)

	btn.BackgroundTransparency = 1

	btn.Font = Enum.Font.SourceSans

	btn.TextSize = 18

	btn.MouseButton1Click:Connect(action)

end

createManualButton(0, "Audio visualizer", function() loadstring(game:HttpGet("https://pastefy.app/ongq4c6T/raw?part=Autovisualizer%20Ring%20By%20Luaman", true))() end)

createManualButton(35, "R15 convert to R6", function() loadstring(game:HttpGet("https://pastefy.app/SOkx4F3z/raw?part=R6%20Real%20fe", true))() end)

createManualButton(70, "k00pgui v11", function() loadstring(game:HttpGet("https://pastefy.app/rI7DmyrJ/raw"))() end)

createManualButton(105, "Project Euphoria", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/TEST19983/Realrhejrj/refs/heads/main/Refjf",true))()

     end)

createManualButton(140, "Vann script", function() loadstring(game:HttpGet("https://pastebin.com/raw/8XMXfDGi"))() end)

createManualButton(175, "Evacator", function() loadstring(game:HttpGet('https://pastefy.app/ug6v3dyk/raw'))() end)

createManualButton(210, "Fe Hax 20101", function() loadstring(game:HttpGet("https://pastefy.app/jZyy2c1p/raw",true))() end)

createManualButton(245, "Grab Knife V1 Client", function() loadstring(game:HttpGet("https://pastebin.com/raw/P8DHBWeq"))() end)

createManualButton(280, "NOOT NOOT(pls dont)", function() loadstring(game:HttpGet("https://pastebin.com/raw/SgZBe9Ha"))() end)

createManualButton(315, "Rocky2U Admin", function() str_srce = "14682300022" loadstring(game:GetObjects("rbxassetid://"..str_srce)[1].Source)() end)

createManualButton(350, "Minecraft", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Steve-script-24707"))() end)

createManualButton(385, "c00lgui", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-c00lkidd-35087"))() end)

createManualButton(420, "Polaria Obunga", function() loadstring(game:HttpGet("https://pastebin.com/raw/qZMzJr4W"))() end)

createManualButton(455, "Nebula Star", function() loadstring(game:HttpGet("https://pastebin.com/raw/ieJZauwd"))() end)

createManualButton(490, "MML Admin", function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/rusello25/scripts/main/mml%20admin'),true))() end)

createManualButton(525, "Infinite Yield FD Patched FE Now", function() loadstring(game:HttpGet(('https://raw.githubusercontent.com/retpirato/Roblox-Scripts/refs/heads/master/INFINITE%20YIELD%20FD.lua'),true))() end)

createManualButton(560, "Dex V5 Most Game Doesn't Detected", function() loadstring(game:HttpGet("https://raw.githubusercontent.com/dyyll/Dex-V5-leak/refs/heads/main/Dex%20V5.lua"))() end)

createManualButton(595, "Project SonicElijahMania", function() loadstring(game:HttpGet('https://pastebin.com/raw/HyvCrTyw'))() end)

createManualButton(630, "Lua Hammer PSL", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-Lua-Hammer-18934"))() end)

createManualButton(665, "KYS Gun For No Reason", function() loadstring(game:HttpGet('https://pastebin.com/raw/LsTUAMEs'))() end)

createManualButton(700, "McDonalds Clown", function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Spooky-Scary-MCDonalds-Script-28270"))() end)

createManualButton(735, "Cannon Blaster", function() loadstring(game:HttpGet('https://pastebin.com/raw/rTYcpH2z'))() end)

createManualButton(770, "Original Public Gui File", function() loadstring(game:HttpGet('https://pastebin.com/raw/5N9fwzXP'))() end)

createManualButton(805, "SOON", function() print("hiii 24") end)

createManualButton(840, "SOON", function() print("hiii 25") end)

createManualButton(875, "SOON", function() print("hiii 26") end)

createManualButton(910, "SOON", function() print("hiii 27") end)

createManualButton(945, "SOON", function() print("hiii 28") end)

createManualButton(980, "SOON", function() print("hiii 29") end)

createManualButton(1015, "SOON", function() print("hiii 30") end)

hubPage.CanvasSize = UDim2.new(0, 0, 0, 1050)

local function showPage(name)

	for n, p in pairs(pages) do

		p.Visible = (n == name)

	end

end

showPage("Welcome")

for name, btn in pairs(tabButtons) do

	btn.MouseButton1Click:Connect(function()

		showPage(name)

	end)

end

local minimize = Instance.new("TextButton", mainFrame)

minimize.Size = UDim2.new(0, 30, 0, 30)

minimize.Position = UDim2.new(1, -70, 0, 5)

minimize.Text = "-"

minimize.TextColor3 = Color3.new(1, 1, 1)

minimize.BackgroundTransparency = 1

minimize.Font = Enum.Font.SourceSansBold

minimize.TextSize = 24

local close = Instance.new("TextButton", mainFrame)

close.Size = UDim2.new(0, 30, 0, 30)

close.Position = UDim2.new(1, -35, 0, 5)

close.Text = "X"

close.TextColor3 = Color3.new(1, 1, 1)

close.BackgroundTransparency = 1

close.Font = Enum.Font.SourceSansBold

close.TextSize = 24

local minimized = false

minimize.MouseButton1Click:Connect(function()

	minimized = not minimized

	if minimized then

		mainFrame.Size = minSize

		for _, v in pairs(mainFrame:GetChildren()) do

			if v ~= title and v ~= minimize and v ~= close then

				v.Visible = false

			end

		end

	else

		mainFrame.Size = fullSize

		for _, v in pairs(mainFrame:GetChildren()) do

			if v == title or v == minimize or v == close or (v:IsA("TextButton") and (tabButtons["Welcome"] == v or tabButtons["Executor"] == v or tabButtons["Script Hub"] == v)) then

				v.Visible = true

			end

		end

		showPage("Welcome")

	end

end)

close.MouseButton1Click:Connect(function()

	gui:Destroy()

end)