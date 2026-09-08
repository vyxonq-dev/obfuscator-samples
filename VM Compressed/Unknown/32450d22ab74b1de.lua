local ScreenGui = Instance.new("ScreenGui", game.CoreGui)

ScreenGui.Name = "DariusHub"

-- Main GUI Frame

local MainFrame = Instance.new("Frame", ScreenGui)

MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

MainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)

MainFrame.Size = UDim2.new(0, 330, 0, 400)

MainFrame.Active = true

MainFrame.Draggable = true

local UICorner = Instance.new("UICorner", MainFrame)

UICorner.CornerRadius = UDim.new(0, 10)

local UIStroke = Instance.new("UIStroke", MainFrame)

UIStroke.Thickness = 1.5

UIStroke.Color = Color3.fromRGB(100, 100, 255)

-- Title

local Title = Instance.new("TextLabel", MainFrame)

Title.Text = "Darius's team"

Title.Size = UDim2.new(1, 0, 0, 40)

Title.BackgroundTransparency = 1

Title.TextColor3 = Color3.fromRGB(255, 255, 255)

Title.TextSize = 22

Title.Font = Enum.Font.GothamBold

-- Tabs: Hub / Lua

local HubFrame = Instance.new("Frame", MainFrame)

HubFrame.Size = UDim2.new(1, 0, 1, -40)

HubFrame.Position = UDim2.new(0, 0, 0, 40)

HubFrame.BackgroundTransparency = 1

local LuaFrame = Instance.new("Frame", MainFrame)

LuaFrame.Size = UDim2.new(1, 0, 1, -40)

LuaFrame.Position = UDim2.new(0, 0, 0, 40)

LuaFrame.BackgroundTransparency = 1

LuaFrame.Visible = false

-- Layout for buttons in Hub

local Layout = Instance.new("UIListLayout", HubFrame)

Layout.SortOrder = Enum.SortOrder.LayoutOrder

Layout.Padding = UDim.new(0, 8)

-- Function to create navigation button

local function createSwitchButton(text, parent, targetFrame)

	local btn = Instance.new("TextButton", parent) 	btn.Text = text

	btn.Size = UDim2.new(0.9, 0, 0, 40)

	btn.Position = UDim2.new(0.05, 0, 0, 0)

	btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

	btn.TextColor3 = Color3.fromRGB(255, 255, 255)

	btn.Font = Enum.Font.Gotham

	btn.TextSize = 18

	local corner = Instance.new("UICorner", btn)

	corner.CornerRadius = UDim.new(0, 8)

	btn.MouseButton1Click:Connect(function()

		HubFrame.Visible = false

		LuaFrame.Visible = false

		targetFrame.Visible = true

	end)

end

-- Buttons in Hub (excluding Dex)

createSwitchButton("Lua Section", HubFrame, LuaFrame)

local function createScriptButton(text, url)

	local button = Instance.new("TextButton", HubFrame)

	button.Text = text

	button.Size = UDim2.new(0.9, 0, 0, 40)

	button.Position = UDim2.new(0.05, 0, 0, 0)

	button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)

	button.TextColor3 = Color3.fromRGB(255, 255, 255)

	button.Font = Enum.Font.Gotham

	button.TextSize = 18

	local corner = Instance.new("UICorner", button)

	corner.CornerRadius = UDim.new(0, 8)

	button.MouseButton1Click:Connect(function()

		loadstring(game:HttpGet(url))()

	end)

end

-- Add working buttons (Dex removed)

createScriptButton("Delta Keyboards", "https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt")

createScriptButton("RC7", "https://raw.githubusercontent.com/CoreGui/Scripts/main/RC7")

createScriptButton("Lalol Hub", "https://raw.githubusercontent.com/IvanTheProtogen/BackdoorLegacy/main/main.lua")

createScriptButton("SystemBroken", "https://raw.githubusercontent.com/H20CalibreYT/SystemBroken/main/script")

-- Lua section:

local BackButton = Instance.new("TextButton", LuaFrame)

BackButton.Text = "Back to Hub"

BackButton.Size = UDim2.new(0.9, 0, 0, 35)

BackButton.Position = UDim2.new(0.05, 0, 0, 5)

BackButton.BackgroundColor3 = Color3.fromRGB(100, 30, 30)

BackButton.TextColor3 = Color3.fromRGB(255, 255, 255)

BackButton.Font = Enum.Font.GothamBold

BackButton.TextSize = 18

local bCorner = Instance.new("UICorner", BackButton)

bCorner.CornerRadius = UDim.new(0, 8)

BackButton.MouseButton1Click:Connect(function()

	HubFrame.Visible = true

	LuaFrame.Visible = false

end)

local LuaBox = Instance.new("TextBox", LuaFrame)

LuaBox.Size = UDim2.new(0.9, 0, 0, 140)

LuaBox.Position = UDim2.new(0.05, 0, 0, 50)

LuaBox.MultiLine = true

LuaBox.PlaceholderText = "-- Write Lua script here"

LuaBox.Text = ""

LuaBox.TextColor3 = Color3.fromRGB(255, 255, 255)

LuaBox.TextSize = 16

LuaBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)

LuaBox.ClearTextOnFocus = false

LuaBox.Font = Enum.Font.Code

local LuaBoxCorner = Instance.new("UICorner", LuaBox)

LuaBoxCorner.CornerRadius = UDim.new(0, 8)

-- Run Button

local RunButton = Instance.new("TextButton", LuaFrame)

RunButton.Size = UDim2.new(0.9, 0, 0, 35)

RunButton.Position = UDim2.new(0.05, 0, 0, 200)

RunButton.Text = "Execute Script"

RunButton.TextColor3 = Color3.fromRGB(255, 255, 255)

RunButton.TextSize = 18

RunButton.Font = Enum.Font.Gotham

RunButton.BackgroundColor3 = Color3.fromRGB(30, 120, 30)

local RunCorner = Instance.new("UICorner", RunButton)

RunCorner.CornerRadius = UDim.new(0, 8)

RunButton.MouseButton1Click:Connect(function()

	local code = LuaBox.Text

	if code ~= "" then

		loadstring(code)()

	end

end)