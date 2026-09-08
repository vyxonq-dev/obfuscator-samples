-- =========================================================
-- PROJECTION SORCERY: STANDALONE LAUNCHER
-- =========================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local MAIN_SCRIPT_URL = "https://gist.githubusercontent.com/cathlynmayormasa77-bit/4231ae3f9ee5169f53eefca2dc91012a/raw/5fd80e72e10fd212f79bf281d5cef8e1c771aa5d/Jeje.lua"

-- Cleanup previous launcher instance if it exists
local oldLauncher = playerGui:FindFirstChild("ZeninLauncherUI") or CoreGui:FindFirstChild("ZeninLauncherUI")
if oldLauncher then oldLauncher:Destroy() end

-- ScreenGui Setup
local launcherGui = Instance.new("ScreenGui")
launcherGui.Name = "ZeninLauncherUI"
launcherGui.ResetOnSpawn = false

-- Use CoreGui if available to prevent GUI resets, fallback to PlayerGui
pcall(function()
	launcherGui.Parent = CoreGui
end)
if not launcherGui.Parent then
	launcherGui.Parent = playerGui
end

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 220, 0, 180)
MainFrame.Position = UDim2.new(0.05, 0, 0.35, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = launcherGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 10)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(0, 220, 255)
UIStroke.Thickness = 1.5
UIStroke.Transparency = 0.3
UIStroke.Parent = MainFrame

-- Title Bar
local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, 0, 0, 35)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold
Title.Text = "PROJECTION CONTROL"
Title.TextColor3 = Color3.fromRGB(0, 220, 255)
Title.TextSize = 13
Title.Parent = MainFrame

-- Button Container
local Container = Instance.new("Frame")
Container.Name = "Container"
Container.Size = UDim2.new(1, -20, 1, -45)
Container.Position = UDim2.new(0, 10, 0, 35)
Container.BackgroundTransparency = 1
Container.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.Parent = Container

-- Helper Function: Button Creator
local function CreateButton(text, layoutOrder, color)
	local btn = Instance.new("TextButton")
	btn.Size = UDim2.new(1, 0, 0, 36)
	btn.LayoutOrder = layoutOrder
	btn.BackgroundColor3 = color or Color3.fromRGB(32, 34, 40)
	btn.Font = Enum.Font.GothamSemibold
	btn.Text = text
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 12
	btn.AutoButtonColor = true
	btn.Parent = Container

	local corner = Instance.new("UICorner")
	corner.CornerRadius = UDim.new(0, 6)
	corner.Parent = btn

	return btn
end

-- Create Control Buttons
local LaunchBtn = CreateButton("EXECUTE MAIN SCRIPT", 1, Color3.fromRGB(0, 140, 180))
local RestartBtn = CreateButton("RESTART / RELOAD", 2, Color3.fromRGB(45, 48, 58))
local KillBtn = CreateButton("UNLOAD / CLEANUP", 3, Color3.fromRGB(150, 40, 40))

-- Execution Logic
local function executeScript()
	pcall(function()
		loadstring(game:HttpGet(MAIN_SCRIPT_URL))()
	end)
end

local function cleanupExisting()
	-- Clean up Ability GUI
	local abilityUI = playerGui:FindFirstChild("AbilityUI") or playerGui:FindFirstChild("MyGUI")
	if abilityUI then abilityUI:Destroy() end

	-- Clean up VFX folders created by the main script
	local fxFolder = workspace:FindFirstChild("ZeninFX")
	if fxFolder then fxFolder:Destroy() end

	local cyanFolder = workspace:FindFirstChild("CyanWindVFX")
	if cyanFolder then cyanFolder:Destroy() end
end

-- Button Listeners
LaunchBtn.MouseButton1Click:Connect(function()
	executeScript()
end)

RestartBtn.MouseButton1Click:Connect(function()
	cleanupExisting()
	task.wait(0.2)
	executeScript()
end)

KillBtn.MouseButton1Click:Connect(function()
	cleanupExisting()
end)
