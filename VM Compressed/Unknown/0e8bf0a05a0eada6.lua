--[[
	XANE'S MODEL RECREATOR (SCRIPT/DECONSTRUCTOR PHASE) V4, WRITTEN IN 2024
	LAST UPDATED ON JANUARY 11TH, 2025
	
	A personal script of mine, released to the public to enable anyone to save models (and other supported instances)
	from any Roblox experience (as long as your Roblox app doesn't crash in the process of loading it)! Execute this
	script and a small button will appear at the top of your screen. Click/tap on it to open the GUI, then click on
	one of the four buttons at the top of the window to scan through that container, making a list of all of the
	supported Instances!
	
	Click on an instance's icon to include it in this save (and do that again to deselect it), and use the page
	buttons at the bottom of the window to switch between pages of 100 Instances. If you're unsure of which
	Instance you're selecting, a box will be drawn around them, and you can use the camera button to focus on that
	object, if it supports changing the camera's subject to it. To return to your character, right-click or long
	tap that button.
	
	Instances can be selected from one or all of the containers. Switch between them using the top row of buttons,
	select anything that you want, give a name to this export using the text box at the bottom-right corner, then
	with one click/tap of the save button, your selection will be transformed into JSON files in your executor's
	"workspace" folder.
	
	As of January 11th, 2025, this script can also save terrain, albeit in a rather small area around your avatar.
	You can save multiple blocks of terrain to files; Just make sure to enter a "filename" in the text box before
	tapping/clicking the terrain saving button!
]]--

if not game:IsLoaded() then game.Loaded:Wait() end
task.wait(0.975)
print("Xane's Model Recreator GUI is initializing... (Please work!)")

-- SERVICES
local Players			= game:GetService("Players")	-- These are the three locations that can be accessed using this script.
local Lighting			= game:GetService("Lighting")
local ReplicatedStorage	= game:GetService("ReplicatedStorage")
local ServerStorage		= game:GetService("ServerStorage")	-- This container stores the four "container imposter" Models for redirection.
local MaterialService	= game:GetService("MaterialService")

-- This script's GUI will be hidden by the executor.
local hiddenUI = get_hidden_gui or gethui
if not hiddenUI then error("Your executor doesn't support hiding GUI's, so it's too unsafe to use this script. Sorry!") end

-- REFERENCES (PARTIAL, NOT INCLUDING GUI)
local CoreGui			= hiddenUI()

-- STATIC DATA
local DefaultMessage	= "Welcome to Xane's Model Recreator v4, the ultimate instance capturer! Please choose a container above, select which instances you want, name it, then save!"

--- This script uses Xane's Recreator API! The boilerplate code below will load it from one of its locations online, trying each in order.
local RecreatorAPIMirrors = {
	'https://pastebin.com/raw/DL77J2LY',
	'https://raw.githubusercontent.com/Xane123/Roblox-Scripts/main/API_Recreation.luau'
}
-- Prepare our environment; If this executor supports it, use its getgenv() function, falling back on the detectable _G if it isn't available.
local env				= getgenv and getgenv() or _G

if env then
	if not env.XRecreator then
		for i,mirror in RecreatorAPIMirrors do
			-- Attempt to load Xane's Recreator API from Pastebin,
			local success, errormsg = pcall(function() loadstring(game:HttpGet(mirror))() end)
			if success then
				print("Loaded Recreator API from source", i, "of", #RecreatorAPIMirrors)
				break
			else
				warn("Recreator API couldn't load from " .. mirror .. ". It's either removed, or isn't available in your region.")
			end
		end
		
		if env.XRecreator and env.XRecreator.Save then
			print("Recreator API has been imported and setup successfully!")
		else
			game:GetService("Debris"):AddItem(script, 5)
			local VisibleError = Instance.new("Hint", game:GetService("CoreGui"))
			VisibleError.Text = "Error: Xane's Recreator API couldn't load/initialize! Please load a local copy of that script " ..
				"then execute this one again, or try again."
			game:GetService("Debris"):AddItem(VisibleError,7)
			error("The Recreator API couldn't load or initialize. This script depends on it, so execution cannot continue.")
		end
	else print("The recreator API is already set up! Its functions will be used by this script.")
	end
else
	game:GetService("Debris"):AddItem(script, 1)
	error("Couldn't find a destination for the recreation APIs! (Your executor is really bad if you see this!)")
end

-- XANE'S RECREATOR API TYPES
-- The format used by the API's internal Instance list. This is used by both the API and this GUI script.
type InternalListEntry		= {
	Instance			: Instance,	-- Instance which this entry represents. Its class and name are used when generating the visible list.
	Level				: number	-- Represents the depth this instance was placed at in the hierarchy during the scan. 0 is the container itself.
}

-- List item definition for the currently shown subset of the full list, generated as needed.
type VisibleListEntry		= {
	CheckboxClickEvent	: RBXScriptConnection,	-- Connection which lets the user (de)select this item. (This also updates its icon.)
	CameraFocusEvent	: RBXScriptConnection,	-- Click event for a button which makes the user's camera focus on this instance.
	CamRevertEvent1		: RBXScriptConnection,	-- Right-click event, which brings the camera back to the player.
	CamRevertEvent2		: RBXScriptConnection,	-- Alternative camera reverting event, for mobile devices (long tap).
	Instance			: Instance,				-- Reference to this instance, used to access its properties if needed.
	RowBase				: Frame,				-- A reference to this row's container Frame.
	Checkbox			: TextButton,			-- The toggle-box found at the left side of this row/entry.
	SelectBox			: SelectionBox,			-- This Instance's SelectionBox, which is created and destroyed as needed upon its selection.
	IsSelectAllRow		: boolean				-- If TRUE, selecting this row will deselect all instances within the selected container.
}

type SavedTerrainStruct		= {
	Data					: {string},	-- The occupancy/materials of each "Z slice/row" of this save, in ascending Z-Y-X order.
	Position				: {number},	-- Coordinates of the saved region's lower-left(?) corner.
	Size					: {number},
	Properties				: {			-- A dictionary entry full of miscellaneous Terrain properties.
		MaterialColors		: {},		-- The color of each terrain material, in ascending Enum.Material order.
		WaterColor			: {number},	-- Color of all water in this realm/place.
		WaterReflectance	: number,
		WaterTransparency	: number,
		WaterWaveSize		: number,
		WaterWaveSpeed		: number
	}
}

type ClassDefinition		= {
	ListView						: {		-- Properties that customize how this instance is displayed in the list (only used in the script).
		Icon						: string,
		CreateTest					: boolean,
		CanView						: string,
	},
	Props							: {string}		-- List of properties that should be saved or loaded to/from JSON for this instance.
}

-- Dictionary returned after successfully importing/loading serialized JSON data using Recreator.Load(). Each key is named after
-- and points to the Model that the function placed your imported Instances into, and will be nil if nothing was imported to a
-- location. If the third argument is true, all models will be put inside of another Model in CoreGui (hidden from LocalScripts).
type XRecreatorImportResult	= {
	Success				: boolean,
	Workspace			: Model?,
	Players				: Model?,
	Lighting			: Model?,
	ReplicatedStorage	: Model?,
	StarterGui			: Model?,
	SoundService		: Model?,
	StarterPack			: Model?
}

type XRecreatorLoadConfig				= {
	Destination							: Instance?,	-- If defined, all container Models will be placed inside this Instance.
	AddMaterials						: boolean,		-- Import MaterialVariants from this save to MaterialService? (Detectable)
	ApplyLighting						: boolean		-- Sets all standard Lighting properties to the origin place's. (Useless.)
}

-- The contents of getgenv().XRecreator after the Recreation API initializes. These functions send commands to the API, making
-- it very easy to automate actions like selecting Instances, saving them to JSON files, and loading stuff FROM those files.
type ModelRecreatorStruct	= {
	-- FUNCTIONS
	Select		: (_mode:"set"|"add"|"remove", _list:{Instance}) -> (),	-- Updates the API's selection.
	MakeList	: (_baseInst : Instance) -> (nil),						-- Generates a series of list entries, for GUI's that display one.
	Save		: (_name:string,_rescan:boolean) -> (boolean),			-- Saves selection to files. Will fail on invalid filenames.
	CustomizeProgressBox:(_message : string, _total : number) -> (),	-- Affects the text shown in "saving"/"indexing" GUI (may be unusable).
	ActivateAPI	: (_use : boolean) -> boolean,							-- Requests to use API functions. If in use, this returns FALSE.
	SetStatusGui: (_gui:TextLabel) -> (nil),							-- Changes GUI that save status is shown in. Set to nil to use default.
	OnSaveDone	: (_success : boolean) -> (),							-- External code ran upon finishing. Used for other scripts' cleanup.
	IsInstanceAllowed : (_instance : Instance) -> (boolean),			-- Checks if an Instance's type is safe to save. (Model Recreator v3)
	Load		: (_header:any,_pieces:{any},_cfg:XRecreatorLoadConfig) -> (XRecreatorImportResult?),	-- Import saved JSON instances.
	LoadFile	: (_saveName:string,_cfg:XRecreatorLoadConfig) -> (XRecreatorImportResult?),	-- Loads from a JSON capture set, using Load().
	EncodeValueForJSON : (_value : any, _type : string) -> (any),		-- Converts Roblox types to basic arrays compatible with JSON.
	DecodeValueFromJSON : (_value : any, _type : string) -> (any),		-- Attempts to turn a converted value back into a specific type.
	
	-- VARIABLES
	Reserved	: boolean,												-- Set to TRUE after a script calls ActivateAPI().
	IgnoreAttrib: string,												-- Instances with this attribute won't be scanned.
	Selection	: {Instance},											-- List of instances marked to be saved.
	FullList	: {InternalListEntry},									-- List generated by MakeList(), which can be used by scripts' GUIs.
	StatusGui	: TextLabel,											-- Reference to current label that save/index statuses are shown in.
	PageLength	: number,												-- How many instances SHOULD be shown on list pages. (Not used by API.)
	AntiLagInterval : number,											-- How many instances to parse before waiting, to reduce lag.
	ClassData	: {ClassDefinition}									-- This script's "Roblox class API" (read-only).
}
local Recreator : ModelRecreatorStruct = env.XRecreator	-- Let's simplify references to the API by just defining a new "shortcut" variable.
if not Recreator.ActivateAPI(true) then	-- Attempt to claim the API; If it's in use, the script will stop here.
	warn("Another script is using Xane's recreator API! Please close that script or rejoin (if it doesn't have a 'close' button).")
	script:Destroy()		
	return false
end

Recreator.IgnoreAttrib = { "XaneProtectedDoNotShowInRecreatorGui" }	-- This script's GUI and SelectionBox instances can't be saved.
if not Recreator.AntiLagInterval or type(Recreator.AntiLagInterval) ~= "number" or
	(type(Recreator.AntiLagInterval) == "number" and Recreator.AntiLagInterval <= 0)
then
	Recreator.AntiLagInterval = 25
end

--[[
	Roblox2Lua
	----------
	
	This code was generated using
	Deluct's Roblox2Lua plugin.
]]--

--// Instances

local xane_mdlrecreator_gui = Instance.new("ScreenGui")
xane_mdlrecreator_gui.IgnoreGuiInset = false
xane_mdlrecreator_gui.ResetOnSpawn = true
xane_mdlrecreator_gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
xane_mdlrecreator_gui.Name = "XaneMDLRecreatorGUI"
xane_mdlrecreator_gui:SetAttribute("XaneProtectedDoNotShowInRecreatorGui",true)	-- Hide this instance from the Recreator script itself.
xane_mdlrecreator_gui.Parent = CoreGui

-- TOP BUTTONS (HIDE & CANCEL BUTTONS)
local toggle_frame = Instance.new("Frame")
toggle_frame.AnchorPoint = Vector2.new(0.5, 0)
toggle_frame.BackgroundTransparency = 1
toggle_frame.BorderSizePixel = 0
toggle_frame.Position = UDim2.new(0.5, 0, 0.0625, 0)
toggle_frame.Size = UDim2.new(0.25, 0, 0.09375, 0)
toggle_frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
toggle_frame.Visible = true
toggle_frame.Name = "ToggleFrame"
toggle_frame.Parent = xane_mdlrecreator_gui

local toggle_list_layout = Instance.new("UIListLayout")
toggle_list_layout.Name = "ToggleBtnList"
toggle_list_layout.FillDirection = Enum.FillDirection.Horizontal
toggle_list_layout.Padding = UDim.new(0.001,0)
toggle_list_layout.Parent = toggle_frame

local toggle_button = Instance.new("TextButton")
toggle_button.Font = Enum.Font.RobotoCondensed
toggle_button.Text = "Save Instances!"
toggle_button.TextColor3 = Color3.new(1, 1, 1)
toggle_button.TextScaled = true
toggle_button.TextSize = 14
toggle_button.TextStrokeTransparency = 0
toggle_button.TextWrapped = true
-- toggle_button.AnchorPoint = Vector2.new(0.5, 0.5)
toggle_button.BackgroundColor3 = Color3.new(0.882353, 0.756863, 0.615686)
toggle_button.BorderSizePixel = 0
-- toggle_button.Position = UDim2.new(0.5, 0, 0.5, 0)
toggle_button.Size = UDim2.fromScale(0.5, 1)
toggle_button.LayoutOrder = 1
toggle_button.Visible = true
toggle_button.Name = "ToggleButton"
toggle_button.Parent = toggle_frame

local clear_button = Instance.new("TextButton")
clear_button.Font = Enum.Font.RobotoCondensed
clear_button.Text = "Clear Selection"
clear_button.TextColor3 = Color3.new(1, 1, 1)
clear_button.TextScaled = true
clear_button.TextSize = 14
clear_button.TextStrokeTransparency = 0
clear_button.TextWrapped = true
-- clear_button.AnchorPoint = Vector2.new(0.5, 0.5)
clear_button.BackgroundColor3 = Color3.new(0.882353, 0.623529, 0.686275)
clear_button.BorderSizePixel = 0
-- clear_button.Position = UDim2.new(0.5, 0, 0.5, 0)
clear_button.Size = UDim2.fromScale(0.5, 1)
clear_button.LayoutOrder = 2
clear_button.Visible = false
clear_button.Name = "ClearButton"
clear_button.Parent = toggle_frame

local close_button = Instance.new("TextButton")
close_button.Font = Enum.Font.RobotoCondensed
close_button.Text = "End Script..."
close_button.TextColor3 = Color3.new(1, 1, 1)
close_button.TextScaled = true
close_button.TextSize = 14
close_button.TextStrokeTransparency = 0
close_button.TextWrapped = true
close_button.BackgroundColor3 = Color3.new(0.75, 0.4, 0.625)
close_button.BorderSizePixel = 0
close_button.Size = UDim2.fromScale(0.5, 1)
close_button.LayoutOrder = 3
close_button.Visible = true	-- The close button is only visible when the main UI is hidden.
close_button.Name = "CloseButton"
close_button.Parent = toggle_frame

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0.125, 0)
uicorner.Parent = toggle_button

-- THE MAIN WINDOW
local main_frame = Instance.new("Frame")
main_frame.AnchorPoint = Vector2.one / 2
main_frame.BackgroundColor3 = Color3.new(0.219608, 0.321569, 0.627451)
main_frame.BackgroundTransparency = 0.25
main_frame.BorderColor3 = Color3.new(0, 0, 0)
main_frame.BorderSizePixel = 0
main_frame.Position = UDim2.fromScale(0.5, 1.75)	-- This Frame starts off-screen, revealed by clicking the toggle button at the top of the screen.
main_frame.Size = UDim2.fromScale(0.75, 0.725)
main_frame.Visible = true
main_frame.ZIndex = 2
main_frame.Name = "MainFrame"
main_frame.Parent = xane_mdlrecreator_gui

local uicorner_2 = Instance.new("UICorner")
uicorner_2.CornerRadius = UDim.new(0.025, 0)
uicorner_2.Parent = main_frame

--- STATUS MESSAGE
local message = Instance.new("TextLabel")
message.Font = Enum.Font.Gotham
message.Text = DefaultMessage
message.TextColor3 = Color3.new(1, 1, 1)
message.TextScaled = true
message.TextSize = 14
message.TextStrokeTransparency = 0
message.TextWrapped = true
message.AutomaticSize = Enum.AutomaticSize.Y
message.BackgroundColor3 = Color3.new(1, 1, 1)
message.BackgroundTransparency = 1
message.BorderColor3 = Color3.new(0, 0, 0)
message.BorderSizePixel = 0
message.LayoutOrder = 2
message.Size = UDim2.new(1, 0, 0.0625, 0)
message.Visible = true
message.Name = "Message"
message.Parent = main_frame

local uitext_size_constraint = Instance.new("UITextSizeConstraint")
uitext_size_constraint.MaxTextSize = 24
uitext_size_constraint.MinTextSize = 8
uitext_size_constraint.Parent = message

local top_bar = Instance.new("Frame")
top_bar.AnchorPoint = Vector2.xAxis / 2
top_bar.BackgroundTransparency = 1
top_bar.BorderSizePixel = 0
top_bar.LayoutOrder = 1
top_bar.Position = UDim2.new(0.5, 0, 0, 4)
top_bar.Size = UDim2.new(1,-8, 0.094,0)
top_bar.Visible = true
top_bar.Name = "TopBar"
top_bar.Parent = main_frame

local topbar_layout = Instance.new("UIListLayout")
topbar_layout.HorizontalFlex = Enum.UIFlexAlignment.None
topbar_layout.Padding = UDim.new(0, 4)
topbar_layout.FillDirection = Enum.FillDirection.Horizontal
topbar_layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
topbar_layout.SortOrder = Enum.SortOrder.LayoutOrder
topbar_layout.Parent = top_bar

-- CONTAINER BUTTONS
local container1 = Instance.new("TextButton")
container1.Font = Enum.Font.RobotoCondensed
container1.Text = "🌎Workspace"
container1.TextColor3 = Color3.new(1, 1, 1)
container1.TextScaled = true
container1.TextSize = 14
container1.TextStrokeTransparency = 0
container1.TextWrapped = true
container1.Modal = true
container1.AutomaticSize = Enum.AutomaticSize.X
container1.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
container1.BorderColor3 = Color3.new(0, 0, 0)
container1.BorderSizePixel = 0
container1.LayoutOrder = 1
container1.Size = UDim2.fromScale(0.125,1)
container1.SizeConstraint = Enum.SizeConstraint.RelativeXY
container1.Visible = true
container1.Name = "Container1"
container1.Parent = top_bar

local uitext_size_constraint_2 = Instance.new("UITextSizeConstraint")
uitext_size_constraint_2.MaxTextSize = 24
uitext_size_constraint_2.MinTextSize = 6
uitext_size_constraint_2.Parent = container1

local container4 = Instance.new("TextButton")
container4.Font = Enum.Font.RobotoCondensed
container4.Text = "📦ReplicatedStorage"
container4.TextColor3 = Color3.new(1, 1, 1)
container4.TextScaled = true
container4.TextSize = 14
container4.TextStrokeTransparency = 0
container4.TextWrapped = true
container4.Modal = true
container4.AutomaticSize = Enum.AutomaticSize.X
container4.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
container4.BorderColor3 = Color3.new(0, 0, 0)
container4.BorderSizePixel = 0
container4.LayoutOrder = 4
container4.Size = UDim2.fromScale(0.125,1)
container4.SizeConstraint = Enum.SizeConstraint.RelativeXY
container4.Visible = true
container4.Name = "Container4"
container4.Parent = top_bar

local uitext_size_constraint_3 = Instance.new("UITextSizeConstraint")
uitext_size_constraint_3.MaxTextSize = 24
uitext_size_constraint_3.MinTextSize = 6
uitext_size_constraint_3.Parent = container4

local container3 = Instance.new("TextButton")
container3.Font = Enum.Font.RobotoCondensed
container3.Text = "🌟Lighting"
container3.TextColor3 = Color3.new(1, 1, 1)
container3.TextScaled = true
container3.TextSize = 14
container3.TextStrokeTransparency = 0
container3.TextWrapped = true
container3.Modal = true
container3.AutomaticSize = Enum.AutomaticSize.X
container3.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
container3.BorderColor3 = Color3.new(0, 0, 0)
container3.BorderSizePixel = 0
container3.LayoutOrder = 3
container3.Size = UDim2.fromScale(0.125,1)
container3.SizeConstraint = Enum.SizeConstraint.RelativeXY
container3.Visible = true
container3.Name = "Container3"
container3.Parent = top_bar

local uitext_size_constraint_4 = Instance.new("UITextSizeConstraint")
uitext_size_constraint_4.MaxTextSize = 24
uitext_size_constraint_4.MinTextSize = 6
uitext_size_constraint_4.Parent = container3

local container2 = Instance.new("TextButton")
container2.Font = Enum.Font.RobotoCondensed
container2.Text = "👥Players"
container2.TextColor3 = Color3.new(1, 1, 1)
container2.TextScaled = true
container2.TextSize = 14
container2.TextStrokeTransparency = 0
container2.TextWrapped = true
container2.Modal = true
container2.AutomaticSize = Enum.AutomaticSize.X
container2.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
container2.BorderColor3 = Color3.new(0, 0, 0)
container2.BorderSizePixel = 0
container2.LayoutOrder = 2
container2.Size = UDim2.fromScale(0.125,1)
container2.SizeConstraint = Enum.SizeConstraint.RelativeXY
container2.Visible = true
container2.Name = "Container2"
container2.Parent = top_bar

local container5 = Instance.new("TextButton")
container5.Font = Enum.Font.RobotoCondensed
container5.Text = "🕺🏼Characters"
container5.TextColor3 = Color3.new(1, 1, 1)
container5.TextScaled = true
container5.TextSize = 14
container5.TextStrokeTransparency = 0
container5.TextWrapped = true
container5.Modal = true
container5.AutomaticSize = Enum.AutomaticSize.X
container5.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
container5.BorderColor3 = Color3.new(0, 0, 0)
container5.BorderSizePixel = 0
container5.LayoutOrder = 0
container5.Size = UDim2.fromScale(0.1,1)
container5.SizeConstraint = Enum.SizeConstraint.RelativeXY
container5.Visible = true
container5.Name = "Container5"
container5.Parent = top_bar

local uitext_size_constraint_5 = Instance.new("UITextSizeConstraint")
uitext_size_constraint_5.MaxTextSize = 24
uitext_size_constraint_5.MinTextSize = 6
uitext_size_constraint_5.Parent = container2

local uilist_layout_2 = Instance.new("UIListLayout")
uilist_layout_2.Padding = UDim.new(0, 4)
uilist_layout_2.VerticalFlex = Enum.UIFlexAlignment.Fill
uilist_layout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
uilist_layout_2.SortOrder = Enum.SortOrder.LayoutOrder
uilist_layout_2.Parent = main_frame

local instance_list = Instance.new("ScrollingFrame")
instance_list.AutomaticCanvasSize = Enum.AutomaticSize.Y
instance_list.CanvasSize = UDim2.new(0, 0, 0, 0)
instance_list.BackgroundColor3 = Color3.new(1, 1, 1)
instance_list.BackgroundTransparency = 1
instance_list.BorderColor3 = Color3.new(0, 0, 0)
instance_list.BorderSizePixel = 0
instance_list.LayoutOrder = 3
instance_list.Size = UDim2.new(1, 0, 0.675, 0)
instance_list.Visible = true
instance_list.Name = "InstanceList"
instance_list.Parent = main_frame

local uilist_layout_3 = Instance.new("UIListLayout")
uilist_layout_3.Padding = UDim.new(0, 8)
uilist_layout_3.HorizontalAlignment = Enum.HorizontalAlignment.Center
uilist_layout_3.SortOrder = Enum.SortOrder.LayoutOrder
uilist_layout_3.Parent = instance_list

-- "EXPLORER" ROW TEMPLATE
local template_entry = Instance.new("Frame")
template_entry.BackgroundColor3 = Color3.new(1, 1, 1)
template_entry.BackgroundTransparency = 0.875
template_entry.BorderColor3 = Color3.new(0, 0, 0)
template_entry.BorderSizePixel = 0
template_entry.Size = UDim2.new(1, 0, 0.0925, 0)
template_entry.Visible = false
template_entry.Name = "TemplateEntry"
template_entry.Parent = instance_list

local checkbox_button = Instance.new("TextButton")
checkbox_button.Font = Enum.Font.SourceSans
checkbox_button.Text = "❗"
checkbox_button.TextColor3 = Color3.new(0, 0, 0)
checkbox_button.TextScaled = true
checkbox_button.TextSize = 14
checkbox_button.TextWrapped = true
checkbox_button.Modal = true
checkbox_button.BackgroundColor3 = Color3.new(1, 1, 1)
checkbox_button.BackgroundTransparency = 1
checkbox_button.BorderColor3 = Color3.new(0, 0, 0)
checkbox_button.BorderSizePixel = 0
checkbox_button.LayoutOrder = 2
checkbox_button.Size = UDim2.new(1, 0, 1, 0)
checkbox_button.SizeConstraint = Enum.SizeConstraint.RelativeYY
checkbox_button.Visible = true
checkbox_button.Name = "SelectButton"
checkbox_button.Parent = template_entry

local uilist_layout_4 = Instance.new("UIListLayout")
uilist_layout_4.HorizontalFlex = Enum.UIFlexAlignment.None
uilist_layout_4.FillDirection = Enum.FillDirection.Horizontal
uilist_layout_4.SortOrder = Enum.SortOrder.LayoutOrder
uilist_layout_4.Parent = template_entry

local indent = Instance.new("Frame")
indent.BackgroundColor3 = Color3.new(1, 1, 1)
indent.BackgroundTransparency = 1
indent.BorderSizePixel = 0
indent.LayoutOrder = 1
indent.Size = UDim2.fromScale(0.01825, 1)
indent.Visible = false
indent.Name = "Indent"
indent.Parent = template_entry

local indent_outline = Instance.new("UIStroke")
indent_outline.Color = Color3.new(0.825,0.933,1)
indent_outline.Transparency = 0.725
indent_outline.Thickness = 1
indent_outline.Parent = indent

local inst_name = Instance.new("TextLabel")
inst_name.Font = Enum.Font.RobotoCondensed
inst_name.Text = "Template Row"
inst_name.TextColor3 = Color3.new(1, 1, 1)
inst_name.TextScaled = true
inst_name.TextSize = 14
inst_name.TextStrokeTransparency = 0
inst_name.TextWrapped = true
inst_name.TextXAlignment = Enum.TextXAlignment.Left
inst_name.BackgroundColor3 = Color3.new(1, 1, 1)
inst_name.BackgroundTransparency = 1
inst_name.BorderColor3 = Color3.new(0, 0, 0)
inst_name.BorderSizePixel = 0
inst_name.LayoutOrder = 3
inst_name.Size = UDim2.fromScale(0.75, 1)
inst_name.Visible = true
inst_name.Name = "InstName"
inst_name.Parent = template_entry

local uitext_size_constraint_6 = Instance.new("UITextSizeConstraint")
uitext_size_constraint_6.MaxTextSize = 28
uitext_size_constraint_6.MinTextSize = 6
uitext_size_constraint_6.Parent = inst_name

local cam_action_btn = Instance.new("TextButton")
cam_action_btn.Font = Enum.Font.SourceSans
cam_action_btn.Text = "📸"
cam_action_btn.TextColor3 = Color3.new(0, 0, 0)
cam_action_btn.TextScaled = true
cam_action_btn.TextSize = 14
cam_action_btn.TextWrapped = true
cam_action_btn.Modal = true
cam_action_btn.BackgroundColor3 = Color3.new(1, 1, 1)
cam_action_btn.BackgroundTransparency = 1
cam_action_btn.BorderColor3 = Color3.new(0, 0, 0)
cam_action_btn.BorderSizePixel = 0
cam_action_btn.LayoutOrder = 4
cam_action_btn.Size = UDim2.new(1, 0, 1, 0)
cam_action_btn.SizeConstraint = Enum.SizeConstraint.RelativeYY
cam_action_btn.Visible = true
cam_action_btn.Name = "CamActionButton"
cam_action_btn.Parent = template_entry

local cam_revert_btn = Instance.new("TextButton")
cam_revert_btn.Font = Enum.Font.SourceSans
cam_revert_btn.Text = "🔁"
cam_revert_btn.TextColor3 = Color3.new(0, 0, 0)
cam_revert_btn.TextTransparency = 1	-- This button was going to be used, but now its functions are handled by the "camera" button to its left.
cam_revert_btn.TextScaled = true
cam_revert_btn.TextSize = 14
cam_revert_btn.TextWrapped = true
cam_revert_btn.Modal = true
cam_revert_btn.BackgroundColor3 = Color3.new(1, 1, 1)
cam_revert_btn.BackgroundTransparency = 1
cam_revert_btn.BorderColor3 = Color3.new(0, 0, 0)
cam_revert_btn.BorderSizePixel = 0
cam_revert_btn.LayoutOrder = 5
cam_revert_btn.Size = UDim2.new(1, 0, 1, 0)
cam_revert_btn.SizeConstraint = Enum.SizeConstraint.RelativeYY
cam_revert_btn.Visible = true
cam_revert_btn.Name = "CamRevertButton"
cam_revert_btn.Parent = template_entry

-- BOTTOM BAR (PAGINATION BUTTONS, NAME ENTRY, AND SAVE BUTTON)
local bot_bar = Instance.new("Frame")
bot_bar.AnchorPoint = Vector2.new(0.5,1)
bot_bar.BackgroundTransparency = 1
bot_bar.BorderSizePixel = 0
bot_bar.LayoutOrder = 4
bot_bar.Position = UDim2.new(0.5, 0, 0, -4)
bot_bar.Size = UDim2.new(1,-8, 0.094,0)
bot_bar.Visible = true
bot_bar.Name = "BottomBar"
bot_bar.Parent = main_frame

local botbar_layout = Instance.new("UIListLayout")
botbar_layout.HorizontalFlex = Enum.UIFlexAlignment.None
botbar_layout.Padding = UDim.new(0, 4)
botbar_layout.FillDirection = Enum.FillDirection.Horizontal
botbar_layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
botbar_layout.SortOrder = Enum.SortOrder.LayoutOrder
botbar_layout.Parent = bot_bar

local prevPageButton = Instance.new("TextButton")
prevPageButton.Font = Enum.Font.RobotoCondensed
prevPageButton.Text = "◀ Prev"
prevPageButton.TextColor3 = Color3.new(1, 1, 1)
prevPageButton.TextScaled = true
prevPageButton.TextSize = 14
prevPageButton.TextStrokeTransparency = 0
prevPageButton.TextWrapped = true
prevPageButton.Modal = true
prevPageButton.AutomaticSize = Enum.AutomaticSize.X
prevPageButton.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
prevPageButton.BorderColor3 = Color3.new(0, 0, 0)
prevPageButton.BorderSizePixel = 0
prevPageButton.LayoutOrder = 1
prevPageButton.Size = UDim2.fromScale(0.1125,1)
prevPageButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
prevPageButton.Visible = true
prevPageButton.Name = "PrevPage"
prevPageButton.Parent = bot_bar

local prevPageBtnSizeConstraint = Instance.new("UITextSizeConstraint")
prevPageBtnSizeConstraint.MaxTextSize = 24
prevPageBtnSizeConstraint.MinTextSize = 6
prevPageBtnSizeConstraint.Parent = prevPageButton

local nextPageButton = Instance.new("TextButton")
nextPageButton.Font = Enum.Font.RobotoCondensed
nextPageButton.Text = "Next ▶"
nextPageButton.TextColor3 = Color3.new(1, 1, 1)
nextPageButton.TextScaled = true
nextPageButton.TextSize = 14
nextPageButton.TextStrokeTransparency = 0
nextPageButton.TextWrapped = true
nextPageButton.Modal = true
nextPageButton.AutomaticSize = Enum.AutomaticSize.X
nextPageButton.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
nextPageButton.BorderColor3 = Color3.new(0, 0, 0)
nextPageButton.BorderSizePixel = 0
nextPageButton.LayoutOrder = 2
nextPageButton.Size = UDim2.fromScale(0.1125,1)
nextPageButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
nextPageButton.Visible = true
nextPageButton.Name = "NextPage"
nextPageButton.Parent = bot_bar

local nextPageBtnSizeConstraint = Instance.new("UITextSizeConstraint")
nextPageBtnSizeConstraint.MaxTextSize = 24
nextPageBtnSizeConstraint.MinTextSize = 6
nextPageBtnSizeConstraint.Parent = nextPageButton

local terrainSaveButton = Instance.new("TextButton")
terrainSaveButton.Font = Enum.Font.RobotoCondensed
terrainSaveButton.Text = "🏔️ Capture Near Terrain…"
terrainSaveButton.TextColor3 = Color3.new(1, 1, 1)
terrainSaveButton.TextScaled = true
terrainSaveButton.TextSize = 14
terrainSaveButton.TextStrokeTransparency = 0
terrainSaveButton.TextWrapped = true
terrainSaveButton.Modal = true
terrainSaveButton.AutomaticSize = Enum.AutomaticSize.X
terrainSaveButton.BackgroundColor3 = Color3.new(0.596078, 0.921569, 0.921569)
terrainSaveButton.BorderColor3 = Color3.new(0, 0, 0)
terrainSaveButton.BorderSizePixel = 0
terrainSaveButton.LayoutOrder = 3
terrainSaveButton.Size = UDim2.fromScale(0.2,1)
terrainSaveButton.SizeConstraint = Enum.SizeConstraint.RelativeXY
terrainSaveButton.Visible = true
terrainSaveButton.Name = "SaveTerrain"
terrainSaveButton.Parent = bot_bar

local terrain_size_constraint = Instance.new("UITextSizeConstraint")
terrain_size_constraint.MaxTextSize = 24
terrain_size_constraint.MinTextSize = 6
terrain_size_constraint.Parent = terrainSaveButton

-- JSON MODEL NAME ENTRY FIELD/TEXTBOX
local filename_box = Instance.new("TextBox")
filename_box.Font = Enum.Font.Ubuntu
filename_box.PlaceholderColor3 = Color3.new(0.239216, 0.392157, 0.290196)
filename_box.PlaceholderText = "What should this be called?"
filename_box.Text = ""
filename_box.TextColor3 = Color3.new(0.317647, 0.231373, 0.490196)
filename_box.TextScaled = true
filename_box.TextSize = 14
filename_box.TextStrokeColor3 = Color3.new(0.317647, 0.231373, 0.490196)
filename_box.TextStrokeTransparency = 0.5
filename_box.TextWrapped = true
filename_box.BackgroundColor3 = Color3.new(0.654902, 0.788235, 0.980392)
filename_box.BorderColor3 = Color3.new(0, 0, 0)
filename_box.BorderSizePixel = 0
filename_box.LayoutOrder = 6
filename_box.Position = UDim2.new(0, 4, 0, 4)
filename_box.Size = UDim2.fromScale(0.175,1)
filename_box.SizeConstraint = Enum.SizeConstraint.RelativeXY
filename_box.Visible = true
filename_box.ZIndex = 2
filename_box.Name = "FilenameBox"
filename_box.Parent = bot_bar

local uicorner_3 = Instance.new("UICorner")
uicorner_3.CornerRadius = UDim.new(0.22499999403953552, 0)
uicorner_3.Parent = filename_box

local label = Instance.new("TextLabel")
label.Font = Enum.Font.FredokaOne
label.Text = "JSON filename:"
label.TextColor3 = Color3.new(0.811765, 1, 0.431373)
label.TextScaled = true
label.TextSize = 14
label.TextStrokeColor3 = Color3.new(0.266667, 0.364706, 0.411765)
label.TextStrokeTransparency = 0
label.TextWrapped = true
label.TextXAlignment = Enum.TextXAlignment.Left
label.AnchorPoint = Vector2.new(0.5, 0)
label.BackgroundColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.BorderColor3 = Color3.new(0, 0, 0)
label.BorderSizePixel = 0
label.Position = UDim2.new(0.5, 4, -0.300000012, 0)
label.Size = UDim2.new(1, 0, 0.532999992, 0)
label.Visible = true
label.ZIndex = 2
label.Name = "Label"
label.Parent = filename_box

-- THE RH-ESQUE "3D" SAVE BUTTON
local save_button = Instance.new("TextButton")
save_button.Font = Enum.Font.Cartoon
save_button.Text = ""
save_button.TextColor3 = Color3.new(1, 1, 1)
save_button.TextScaled = true
save_button.TextSize = 14
save_button.TextWrapped = true
save_button.AnchorPoint = Vector2.new(1, 0)
save_button.BorderSizePixel = 0
save_button.LayoutOrder = 7
save_button.Position = UDim2.fromScale(0.125,1)
save_button.Size = UDim2.fromScale(0.125,1)
save_button.SizeConstraint = Enum.SizeConstraint.RelativeXY
save_button.Visible = true
save_button.Name = "SaveButton"
save_button.Parent = bot_bar

local uicorner_4 = Instance.new("UICorner")
uicorner_4.CornerRadius = UDim.new(0.125, 0)
uicorner_4.Parent = save_button

local button_top = Instance.new("TextLabel")
button_top.Font = Enum.Font.Cartoon
button_top.Text = "Save"
button_top.TextColor3 = Color3.new(1, 1, 1)
button_top.TextScaled = true
button_top.TextSize = 14
button_top.TextStrokeTransparency = 0
button_top.TextWrapped = true
button_top.AnchorPoint = Vector2.new(0.5, 1)
button_top.BackgroundColor3 = Color3.new(0.647059, 1, 0.678431)
button_top.BorderColor3 = Color3.new(0, 0, 0)
button_top.BorderSizePixel = 0
button_top.Position = UDim2.new(0.5, 0, 0.875, 0)
button_top.Selectable = true
button_top.Size = UDim2.new(1, 0, 1, 0)
button_top.Visible = true
button_top.ZIndex = 2
button_top.Name = "FakeTop"
button_top.Parent = save_button

local uicorner_5 = Instance.new("UICorner")
uicorner_5.CornerRadius = UDim.new(0.125, 0)
uicorner_5.Parent = button_top

local button_outline = Instance.new("UIStroke")
button_outline.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
button_outline.Color = Color3.new(0.388235, 0.705882, 0.627451)
button_outline.Thickness = 2
button_outline.Parent = button_top

local uigradient = Instance.new("UIGradient")
uigradient.Color = ColorSequence.new({ColorSequenceKeypoint.new(0, Color3.new(0.752941, 0.752941, 0.752941)), ColorSequenceKeypoint.new(0.125, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(0.875, Color3.new(1, 1, 1)), ColorSequenceKeypoint.new(1, Color3.new(0.752941, 0.752941, 0.752941))})
uigradient.Parent = save_button

-- PROGRESS BOX (USED FOR INDEXING AND SAVING)
local progress_ui = Instance.new("TextLabel")
progress_ui.Font = Enum.Font.RobotoCondensed
progress_ui.Text = "Indexing instance\u{000D}\u{000A}56 / 203"
progress_ui.TextColor3 = Color3.new(1, 1, 1)
progress_ui.TextScaled = true
progress_ui.TextStrokeTransparency = 0
progress_ui.TextWrapped = true
progress_ui.AnchorPoint = Vector2.one / 2
progress_ui.BackgroundColor3 = Color3.new(0.161, 0.353, 0.224)
progress_ui.BackgroundTransparency = 0.25
progress_ui.BorderColor3 = Color3.new(0, 0, 0)
progress_ui.BorderSizePixel = 0
progress_ui.Position = UDim2.fromScale(0.5, 0.5)
progress_ui.Size = UDim2.fromScale(0.425, 0.225)
progress_ui.Visible = false
progress_ui.ZIndex = 3
progress_ui.Name = "ProgressUI"
progress_ui.Parent = xane_mdlrecreator_gui

local ui_aspectratio_progress = Instance.new("UIAspectRatioConstraint")
ui_aspectratio_progress.AspectRatio = 3.5
ui_aspectratio_progress.Parent = progress_ui

local uitextsize_progress = Instance.new("UITextSizeConstraint")
uitextsize_progress.MaxTextSize = 50
uitextsize_progress.MinTextSize = 10
uitextsize_progress.Parent = progress_ui

local uicorner_progress = Instance.new("UICorner")
uicorner_progress.CornerRadius = UDim.new(0.125, 0)
uicorner_progress.Parent = progress_ui

local template_selbox = Instance.new("SelectionBox")	-- A box that appears around any selected instances that support rendering it around them.
template_selbox.Name = "XaneSelBoxTemplate"
template_selbox.LineThickness = 0.03125
template_selbox.Transparency = 0.25
template_selbox.SurfaceTransparency = 0.925
template_selbox:SetAttribute("XaneProtectedDoNotShowInRecreatorGui",true)	-- Hide this instance from the Recreator script itself.
template_selbox.Parent = xane_mdlrecreator_gui

print("UI created!")

-- DATA FOR THE ANIMATED SAVE BUTTON
local Position_Raised		= UDim2.fromScale(0.5,0.875)
local Position_Pressed		= UDim2.fromScale(0.5,1)
local BtnColor_Ready		= Color3.fromRGB(160,255,224)	-- Save button colors.
local BtnColor_Caution		= Color3.fromRGB(212,255,204)	-- Used if the selected file already exists.
local BtnColor_Disabled		= Color3.fromRGB(126,128,130)	-- Used until a valid model and filename are entered.

local RowOpacityNormal		= 0.875
local RowOpacitySelected	= 0.75

local TerrainSaveSize		= Vector3.new(204,100,204)		-- Distance to one corner of a captured terrain region.

-- Create an invisible block with a SelectionBox around it. This will mark areas that terrain has been saved within.
local TerrainMarkerTemplate	= Instance.new("Part")
TerrainMarkerTemplate.Size	= TerrainSaveSize
TerrainMarkerTemplate.Transparency = 1
TerrainMarkerTemplate.Name	= "SavedTerrainRegion"
TerrainMarkerTemplate.Anchored = true
TerrainMarkerTemplate.CastShadow = false
TerrainMarkerTemplate.CanCollide = false
TerrainMarkerTemplate.CanQuery = false
TerrainMarkerTemplate.CanTouch = false
TerrainMarkerTemplate:SetAttribute("XaneProtectedDoNotShowInRecreatorGui",true)	-- Hide this instance from the Recreator itself.

local TerrainBox			= Instance.new("SelectionBox")
TerrainBox.Color3			= Color3.new(1,0.325,0.0625)
TerrainBox.Transparency		= 0.125
TerrainBox.SurfaceColor3	= Color3.new(1,0.425,0.125)
TerrainBox.SurfaceTransparency = 0.75
TerrainBox:SetAttribute("XaneProtectedDoNotShowInRecreatorGui",true)			-- Hide this instance from the Recreator itself.
TerrainBox.Parent			= TerrainMarkerTemplate

TerrainMarkerTemplate.Parent = script

-- A filtered list of terrain-specific materials that use terrain colors, used to index materials as numerical indices in saves.
local TerrainMaterialList	=  {
	"WoodPlanks",
	"Slate",
	"Concrete",
	"Brick",
	"Cobblestone",
	"Rock",
	"Sandstone",
	"Basalt",
	"CrackedLava",
	"Limestone",
	"Pavement",
	"Grass",
	"LeafyGrass",
	"Sand",
	"Snow",
	"Mud",
	"Ground",
	"Asphalt",
	"Salt",
	"Ice",
	"Glacier"
}
local SavedTerrainBoxes		= {}	-- List of spawned terrain box clones, removed when this script stops.

-- An array of dictionary entries which keeps all of the events and references needed by each instance shown in the main UI list.
-- As creating too many rows will lag the client when the list updates (scrolling, generating, etc), this array should be limited to
-- 100 or so entries at any time.

-- The full list (which has less data in each entry) is InternalList below.
local ListData : {VisibleListEntry} = {}

-- VARIABLES (SECOND SET)
local GUIShown				= true	-- This is set to TRUE when the main window is visible, used by the toggle button at the top of the screen.
local IsBusy				= false	-- Marks the main window as busy. This disables all buttons, so the script can execute code in peace.
local Offset				= 0		-- The current "page" of instances that are being shown to the user.
local CurrentContainer		= nil

local function ChangeButtonState(_release : boolean, _color : Color3, _text : string)
	if _text then button_top.Text = _text end
	if _color then
		button_top.BackgroundColor3 = _color
		local btnH, btnS, btnV = _color:ToHSV()

		button_outline.Color = Color3.fromHSV(btnH, btnS+(btnS/4), btnV-(btnV/6))
		save_button.BackgroundColor3 = Color3.fromHSV(btnH, btnS+(btnS/3), btnV-(btnV/4))
	end

	-- If the button is already in the same state as this command would change it to, stop the function here.
	if _release == save_button.Active then return nil
	else
		save_button.Active = _release	-- Immediately update whether the user can click on this button before playing the animation.
		button_top:TweenPosition(
			_release and Position_Raised or Position_Pressed,
			Enum.EasingDirection.InOut,
			Enum.EasingStyle.Quad,
			0.125,
			true
		)
		return nil
	end
end
-- Initially disable the save button.
ChangeButtonState(false, BtnColor_Disabled, "Can't save")

local function CheckSavePrerequisites()
	if filename_box.Text:len() > 0 and		-- Make sure the TextBox isn't empty and the filename doesn't contain invalid characters.
		not filename_box.Text:find("/") and
		not filename_box.Text:find("\"") and
		not filename_box.Text:find("\\") and
		not filename_box.Text:find(":") and
		not filename_box.Text:find("*") and
		not filename_box.Text:find("?") and
		#Recreator.Selection > 0	-- Ensure the player has at least one Instance selected before letting them export.
	then
		local FileStatus = nil
		pcall(function()
			FileStatus = readfile(filename_box.Text .. "_header.json")
		end)
		if FileStatus then ChangeButtonState(true, BtnColor_Caution, "Overwrite")
		else ChangeButtonState(true, BtnColor_Ready, "Save!")
		end
	else ChangeButtonState(false, BtnColor_Disabled, "Can't save")
	end

	clear_button.Visible = #Recreator.Selection > 0	-- A second button will appear at the top of the screen to deselect everything if anything's marked.
	message.Text = DefaultMessage
end

-- Disconnects all events within the list shown in the main window, then removes all of its rows.
local function ClearVisibleList()
	if #ListData > 0 then
		for i,entry in ListData do
			-- Disconnect all of the button events' connections before destroying this row.
			if entry.CheckboxClickEvent then
				entry.CheckboxClickEvent:Disconnect()
				ListData[i].CheckboxClickEvent = nil
			end
			if entry.CameraFocusEvent then
				entry.CameraFocusEvent:Disconnect()
				ListData[i].CameraFocusEvent = nil
			end
			if entry.CamRevertEvent1 then
				entry.CamRevertEvent1:Disconnect()
				ListData[i].CamRevertEvent1 = nil
			end
			if entry.CamRevertEvent2 then
				entry.CamRevertEvent2:Disconnect()
				ListData[i].CamRevertEvent2 = nil
			end

			if entry.SelectBox then
				entry.SelectBox:Destroy()
				entry.SelectBox = nil
			end

			entry.Checkbox:Destroy()
			entry.Checkbox = nil

			entry.RowBase:Destroy()
			entry.RowBase = nil
		end

		table.clear(ListData)	-- Remove all of the now-useless entries from the array.
	end
end

-- Visually updates a given row to make it apppear to be (de)selected.
local function UpdateRowVisualState(_entry : InstanceListEntry, _select : boolean)
	if _select then
		_entry.RowBase.BackgroundTransparency = RowOpacitySelected
		_entry.Checkbox.Text = "✅"
	else
		_entry.RowBase.BackgroundTransparency = RowOpacityNormal
		_entry.Checkbox.Text = Recreator.ClassData[_entry.Instance.ClassName].ListView.Icon	-- Revert this checkbox's icon to the class icon.
	end
end

-- An iffy function that does what ApplyChildAction()'s "list" mode used to do, only now in a for loop. It destroys the
-- current "visible list" then rebuilds it using data from the full, pre-generated internal instance list.
local function RedrawVisibleList()
	if #ListData > 0 then
		ClearVisibleList()
	end

	for i = (Recreator.PageLength*Offset)+1, (Recreator.PageLength*Offset)+Recreator.PageLength-1 do
		-- Make sure we haven't reached the end of the list yet. If we have, stop creating entries now.
		if Recreator.FullList[i] then
			-- Make sure this Instance isn't a "bad actor" which could cause a softlock or wouldn't assist this export.
			if not Recreator.IsInstanceAllowed(Recreator.FullList[i].Instance) then continue end
			
			-- If execution reaches this point, this Instance is supported, so let's add it to our temporary list!
			local NewEntry : InstanceListEntry = {
				Instance				= Recreator.FullList[i].Instance,
				RowBase					= template_entry:Clone(),
				Checkbox				= nil,
				CheckboxClickEvent		= nil,
				CameraFocusEvent		= nil,
				CamRevertEvent1			= nil,
				CamRevertEvent2			= nil
			}
			NewEntry.RowBase.Name		= "Listing_" .. i	-- Name each row's Frame after its ordering, just to make it easier for those sifting through UI instances.
			NewEntry.Checkbox			= NewEntry.RowBase:WaitForChild("SelectButton")
			
			local temp_instName			= NewEntry.RowBase:WaitForChild("InstName")
			
			-- Before continuing, determine how big a row should be in pixels rather than scale. Since executors are behind the times,
			-- they unfortyunately don't support Roblox's new CSS-esque flexible UI containers, so there isn't an easy way to make the
			-- "instance name" label fill the space the icon on the left side and camera button on the right side exactly. It's dumb!
			
			-- TODO: I just cannot get rows to be just long enough to squeeze the camera button onto the right edge of each row, regardless
			-- of indentation. For some reason, with or without a delay, AbsoluteSize is always 0, 0! I'm sorry for this awful alt. sizing...
			temp_instName.Size = UDim2.fromScale(1 - (indent.Size.X.Scale * Recreator.FullList[i].Level) - 0.0825,1)
			NewEntry.RowBase:WaitForChild("CamActionButton").AnchorPoint = Vector2.xAxis
			--[[
				task.wait()
				
				print("Row X scale was calculated as", 1 - (indent.Size.X.Scale * InternalList[i].Level))
				print("Just the subtracted value is", indent.Size.X.Scale * InternalList[i].Level)
				print("Absolute size is", temp_instName.AbsoluteSize)
				print("Final X size is somehow", temp_instName.AbsoluteSize.X-temp_instName.AbsoluteSize.Y)
				
				temp_instName.Size = UDim2.fromOffset(	-- Take the size determined above and subtract one square icon's size from it.
					temp_instName.AbsoluteSize.X-temp_instName.AbsoluteSize.Y,
					temp_instName.AbsoluteSize.Y
				)
			]]--
			
			temp_instName.Text = Recreator.FullList[i].Instance.Name
			local temp_newIndent = NewEntry.RowBase:WaitForChild("Indent")	-- Hold a reference to the original indent, which will be duplicated based on this instance's "level".
			temp_newIndent.Visible = Recreator.FullList[i].Level > 0
			if Recreator.FullList[i].Level > 1 then	-- If this Instance is at the second level or deeper, duplicate the indent as needed, forming a grid for clarity left of the list.
				for i = 2, Recreator.FullList[i].Level do
					local temp_additionalIndent = temp_newIndent:Clone()
					temp_additionalIndent.Parent = temp_newIndent.Parent
				end
			end
			
			NewEntry.Checkbox.Text = Recreator.ClassData[Recreator.FullList[i].Instance.ClassName].ListView.Icon
			
			-- If this object has been previously selected, highlight it now.
			if table.find(Recreator.Selection, Recreator.FullList[i].Instance) then
				UpdateRowVisualState(NewEntry, true)
			end
			
			NewEntry.RowBase.Visible = true
			
			-- Add functionality to the the two buttons found on the ends of this row.
			local temp_camButton : TextButton = NewEntry.RowBase:WaitForChild("CamActionButton")
			temp_camButton.Visible = Recreator.ClassData[Recreator.FullList[i].Instance.ClassName].ListView.CanView ~= "no"
			if temp_camButton.Visible then
				NewEntry.CameraFocusEvent = temp_camButton.MouseButton1Click:Connect(function()
					if Recreator.ClassData[Recreator.FullList[i].Instance.ClassName].ListView.CanView == "parent" then
						local temp_ancestor = Recreator.FullList[i].Instance:FindFirstAncestorWhichIsA("BasePart")
						if temp_ancestor then
							workspace.CurrentCamera.CameraSubject = temp_ancestor
						end
					elseif Recreator.ClassData[Recreator.FullList[i].Instance.ClassName].ListView.CanView == "child" then
						local temp_child = Recreator.FullList[i].Instance:FindFirstChildWhichIsA("BasePart")
						if temp_child then
							workspace.CurrentCamera.CameraSubject = Recreator.FullList[i].Instance.Parent
						else
							-- Hide the camera button if nothing camera-compatible is found within this instance.
							NewEntry.RowBase:FindFirstChild("CamActionButton").Visible = false
						end
					else
						workspace.CurrentCamera.CameraSubject = Recreator.FullList[i].Instance
					end
				end)
				NewEntry.CamRevertEvent1 = temp_camButton.MouseButton2Click:Connect(function()
					workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character:WaitForChild("Humanoid")
				end)
				NewEntry.CamRevertEvent2 = temp_camButton.TouchLongPress:Connect(function()
					workspace.CurrentCamera.CameraSubject = Players.LocalPlayer.Character:WaitForChild("Humanoid")
				end)
			end
			
			NewEntry.CheckboxClickEvent = NewEntry.Checkbox.MouseButton1Click:Connect(function()
				-- If this Instance is currently selected, remove it from the list and undo changes to this row on the list.
				local SelectionIndex	= table.find(Recreator.Selection, Recreator.FullList[i].Instance)
				if SelectionIndex then	-- TODO: This code block relies on the selection list using debug IDs instead of proper references!
					Recreator.Select("remove", {Recreator.FullList[i].Instance})
					-- table.remove(Recreator.Selection, SelectionIndex)
					UpdateRowVisualState(NewEntry, false)
					
					-- If this Instance is visually selected in-world, remove the box that's around it.
					if NewEntry.SelectBox then
						NewEntry.SelectBox:Destroy()
						NewEntry.SelectBox = nil	-- Make sure the other part of this mini-function knows that the box no longer exists.
					end
				else
					-- table.insert(Recreator.Selection, Recreator.FullList[i].Instance)
					Recreator.Select("add", {Recreator.FullList[i].Instance})
					
					UpdateRowVisualState(NewEntry, true)
					if Recreator.FullList[i].Level <= 0 then	-- If the container itself was just selected, deselect anything within it.
						local SelectionDelQueue = {}		-- Keep track of the array indices that'll be removed after this for loop.
						local Cleared = false				-- The selection array will be endlessly checked until this flag is set to TRUE.
						while not Cleared do
							for i1,_inst1 : Instance in Recreator.Selection do	-- For each selected Instance...
								if _inst1 and _inst1:IsDescendantOf(Recreator.FullList[i].Instance) then
									table.remove(Recreator.Selection, i1)	-- The table.remove() function messes up arrays' orders, so let's start over...
									break
								elseif i1 >= #Recreator.Selection and not Cleared then
									Cleared = true	-- Without this action, the while loop would force this for loop to completely restart.
								end
							end
						end
						Cleared = false
						RedrawVisibleList()	-- Update the list, in case the loop above deselected any Instances.
					end
					
					-- Also, create a SelectionBox for this instance, to make it easier to tell what has been selected in messy games (like Royale High).
					-- Only do this for child instances within the workspace, and obviously, don't draw a box around the workspace itself.
					if Recreator.FullList[i].Level > 0 and Recreator.FullList[i].Instance:IsDescendantOf(workspace) and not NewEntry.SelectBox then
						NewEntry.SelectBox					= template_selbox:Clone()
						NewEntry.SelectBox.Color3			= Color3.fromHSV(math.random(), 0.125+(math.random()/5), 1-(math.random()/16))	-- Use a random color.
						NewEntry.SelectBox.SurfaceColor3	= NewEntry.SelectBox.Color3
						NewEntry.SelectBox.Adornee			= Recreator.FullList[i].Instance
						NewEntry.SelectBox.Parent			= Recreator.FullList[i].Instance
					end
				end
				
				CheckSavePrerequisites()	-- If the user's entered a filename and has at least one instance selected, allow them to start exporting things!
			end)
			
			NewEntry.RowBase.Parent = instance_list
			table.insert(ListData, NewEntry)
		else break
		end
	end
end

-- Slides the main window on/off the screen. Normally, this is prevented when anything important is happening, but _force will bypass restrictions.
local function ToggleUI(_force : boolean)
	if not IsBusy or _force then
		local PreviouslyBusy = IsBusy	-- Keep in mind if the busy flag was set prior to this function running.
		IsBusy = true
		close_button.Visible = GUIShown	-- Show the close button when the user closes the main UI.
		
		if GUIShown then
			if #Recreator.Selection <= 0 then toggle_button.Text = "Open Save GUI..."
			else toggle_button.Text = "Select Instances... (" .. tostring(#Recreator.Selection) .. ")"
			end
			toggle_button.BackgroundColor3 = BtnColor_Ready
			main_frame:TweenPosition(UDim2.fromScale(0.5, 2.0), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.333, true)
			task.wait(0.125)
		else
			toggle_button.Text = "Hide GUI"
			toggle_button.BackgroundColor3 = BtnColor_Caution
			main_frame:TweenPosition(UDim2.fromScale(0.5, 0.55), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.35, true)
			task.wait(0.35)
		end
		
		IsBusy = PreviouslyBusy	-- Unset the flag, but only if it wasn't set by another function before this ran.
		GUIShown = not GUIShown
	end
end
toggle_button.MouseButton1Click:Connect(function() ToggleUI(false) end)
ToggleUI(false)

local function ChangeListSource(_base : Instance)
	if not IsBusy then
		IsBusy = true	-- Disable all interface buttons until the list has been updated. (Hopefully, no errors occur!)
		ToggleUI(false)

		if #ListData > 0 then ClearVisibleList() end
		if #Recreator.FullList > 0 then table.clear(Recreator.FullList) end

		-- Set up and show the "indexing progress" UI, which will be updated by ApplyChildAction(), so the user isn't left in the dark.
		progress_ui.Visible = true	-- For now, make the UI pop up rather than sliding in like the other frames would.
		
		Recreator.MakeList(_base)	-- Generate the full list of Instances within the new container.
		table.insert(Recreator.FullList, 1, {	-- Slip a fake entry for the container itself into the start of the list.
			Instance = _base,
			Level = 0
		})

		progress_ui.Visible = false	-- Hide the progress UI; We're about to display the list that was just generated.
		Offset = 0					-- Always start from the beginning of a container's Instance list.
		RedrawVisibleList()
		task.wait(0.425)

		ToggleUI(false)
		IsBusy = false
	end
end
container1.MouseButton1Click:Connect(function() ChangeListSource(workspace) end)
container2.MouseButton1Click:Connect(function() ChangeListSource(Players) end)
container3.MouseButton1Click:Connect(function() ChangeListSource(Lighting) end)
container4.MouseButton1Click:Connect(function() ChangeListSource(ReplicatedStorage) end)

-- "Container 5" is a special case; Rather than indexing every instance within a container, it specifically tries to find each player's
-- character model and indexes ITS contents. If playing Royale High, its EquippedStorage folder is checked for and also indexed.
local function IndexCharacters()
	if not IsBusy then
		IsBusy = true	-- Disable all interface buttons until the list has been updated. (Hopefully, no errors occur!)
		ToggleUI(false)
		
		-- Clear the full and visible lists if they're already occupied by another container button's instances.
		if #ListData > 0 then ClearVisibleList() end
		if #Recreator.FullList > 0 then table.clear(Recreator.FullList) end
		
		for _,player : Player in pairs(Players:GetPlayers()) do
			local PlayerChar			= player.Character	-- Try to access this player's character model.
			if not PlayerChar then							-- If it hasn't been created yet, retry a couple of times, then give up.
				local CharTries			= 10
				local success			= false
				while CharTries > 0 do
					success, _ = pcall(function()
						PlayerChar = player.Character
					end)
					if success then break end				-- Did we find it? Let's move on!
					task.wait(0.25)
					CharTries -= 1
				end
				
				if not PlayerChar then continue end			-- If their character is still inaccessible, just move on to the next player.
			end
			
			-- If execution reaches this point, we have a player character to index!
			
			-- Unlike every other "mode", we won't be listing every instance within character models to save time; A player could leave the
			-- server within a minute, after all! Just index the character models directly.
			table.insert(Recreator.FullList, {
				Instance = PlayerChar,
				Level = 1
			})
			
			-- progress_ui.Visible = false	-- Hide the progress UI; We're about to display the list that was just generated.
		end
		
		-- Check for a folder named "EquippedStorage", which Royale High places clothes that players are wearing inside. This folder should be
		-- listed first, as the user probably doesn't want to save characters with missing body parts or anything weird-looking.
		local RH_EquippedStorage = workspace:FindFirstChild("EquippedStorage")
		if RH_EquippedStorage then
			table.insert(Recreator.FullList, 1, {
				Instance = RH_EquippedStorage,
				Level = 1
			})
		end
		
		Offset = 0							-- Always start from the beginning of a container's Instance list.
		RedrawVisibleList()
		task.wait(0.425)
		
		ToggleUI(false)
		IsBusy = false
	end
end
container5.MouseButton1Click:Connect(function() IndexCharacters(false) end)

prevPageButton.MouseButton1Click:Connect(function()
	-- If advancing to the next page would go beyond the full Instance list's bounds, ignore this action. Otherwise, update the visible list.
	if  not IsBusy and Offset > 0 then
		IsBusy = true	-- Prevent other actions from occurring until the list has been finalized.
		Offset -= 1
		RedrawVisibleList()
		instance_list.CanvasPosition = Vector2.yAxis * instance_list.AbsoluteCanvasSize.Y	-- Jump to the end of the visible list.
		IsBusy = false	-- It is now safe to close the main window and export.
	end
end)
nextPageButton.MouseButton1Click:Connect(function()
	-- If advancing to the next page would go beyond the full Instance list's bounds, ignore this action. Otherwise, update the visible list.
	if not IsBusy and ((Offset*Recreator.PageLength)+1)+Recreator.PageLength <= #Recreator.FullList then
		IsBusy = true	-- Prevent other actions from occurring until the list has been finalized.
		Offset += 1
		RedrawVisibleList()
		instance_list.CanvasPosition = Vector2.zero	-- Jump to the top of the visible list.
		IsBusy = false	-- It is now safe to close the main window and export.
	end
end)

-- If the clear button is visible, tappping it will deselect everything then redraw whatever page the window was showing.
clear_button.MouseButton1Click:Connect(function()
	Recreator.Select("set", {})	-- Clear the current selection.
	ClearVisibleList()
	RedrawVisibleList()
	CheckSavePrerequisites()
end)

-- If the user just finished using the model name text box, validate their selection and name to determine if they're allowed to save it now.
local LastSafeName	= ""
filename_box.FocusLost:Connect(function()
	if not IsBusy then	-- As long as saving or something important isn't happening now, save the current file name to a variable. It's used below.
		LastSafeName = filename_box.Text
		CheckSavePrerequisites()
	else	-- If something is happening, don't let the user change the save's name!
		filename_box.Text = LastSafeName
	end
end)

local PendingTerrainFile : SavedTerrainStruct = nil
local SavePercents = table.create(4, 0.0)	-- Each terrain-saving thread's completion percentage, used to display progress.
-- Iterates through a specific range of X slices in a terrain scan and stores them in a table, to be written to a JSON file.
local function ProcessTerrainRows(_tOccupancy : any, _tMaterials : any, _startRow : number, _length : number, _threadId : number)
	local last_x = 1	-- The last XYZ/loop numbers this function reaches before erroring out, used for the "error" at the end.
	local last_y = 1
	local last_z = 1
	
	local success, errormsg = pcall(function()
		for x = _startRow, _startRow + _length do
			last_x = x
			for y = 1, 50 do	-- HARDCODED 🤮
				last_y = y
				local temp_zSlice = ""	-- At the start of each third-layer array, make a new string for this line's data.
				for z = 1, 102 do	-- HARDCODED 🤮
					last_z = z
					if z > 1 then temp_zSlice ..= "," end	-- Add a comma after every item after the first.
					temp_zSlice ..= tostring(_tOccupancy[x][y][z]) .. "!" .. _tMaterials[x][y][z].Name
				end
				if y % 5 == 0 then task.wait() end	-- Wait a split-second for every fifth height.
				-- Add this slice's contents to an item, then move on.
				table.insert(PendingTerrainFile.Data, x*y, temp_zSlice)
			end
			SavePercents[_threadId] = math.map(x-_startRow, 0, _length, 0, 100)
		end
	end)
	
	if not success then
		SavePercents[_threadId] = -1
		warn("Unable to finish converting terrain because" .. errormsg)
		warn("Last offset reached before failing: " .. last_x .. ", " .. last_y .. ", " .. last_z)
	end
end

print("🏔️About to process terrain button click function...")
terrainSaveButton.MouseButton1Click:Connect(function()
	if not IsBusy and LastSafeName:len() > 0 then
		IsBusy = true
		--[[
			Find the first open file to write this terrain data to. Terrain is written to files named
			[saveName]_Terrain[number].json, which can be imported into Xane's Asset Importer just like header JSON files.
			Due to Roblox's low limits for how much terrain can be scanned at a time, this lets the user capture multiple
			blocks full of terrain, which will be required for the average Roblox place/realm that uses terrain.
		]]--
		message.Text = 'Finding an open "slot" for this terrain capture. (If this never finishes, sorry... Please rejoin.)'
		local temp_tSaveId = 1
		local temp_tFilename : string? = nil
		while not temp_tFilename do
			local success, errormsg = pcall(function()
				readfile(LastSafeName .. "_Terrain" .. tostring(temp_tSaveId) .. ".json")
			end)
			if not success then	-- If an error occurred, the file didn't exist, so it's ours (hopefully)!
				temp_tFilename = LastSafeName .. "_Terrain" .. tostring(temp_tSaveId) .. ".json"
				break
			else
				temp_tSaveId += 1
				if temp_tSaveId % 10 == 0 then task.wait() end	-- Wait a bit every on every tenth check, to avoid freezing the app.
			end
		end
		
		PendingTerrainFile			= {
			Data					= table.create(102*50, ""),	-- HARDCODED 🤮
			Position				= table.create(3, 0),
			Size					= table.create(3, 0),
			Properties				= {	-- Annoyingly, the "decoration" and "grass length" properties are locked.
				MaterialColors		= {},
				WaterColor			= Recreator.EncodeValueForJSON(workspace.Terrain.WaterColor, "Color3"),
				WaterReflectance	= workspace.Terrain.WaterReflectance,
				WaterTransparency	= workspace.Terrain.WaterTransparency,
				WaterWaveSize		= workspace.Terrain.WaterWaveSize,
				WaterWaveSpeed		= workspace.Terrain.WaterWaveSpeed
			}
		}
		for _,material in TerrainMaterialList do	-- Grab all of the terrain material colors using the intended function.
			
			local success, errormsg = pcall(function()
				table.insert(
					PendingTerrainFile.Properties.MaterialColors,
					Recreator.EncodeValueForJSON(workspace.Terrain:GetMaterialColor(Enum.Material[material]), "Color3")
				)
			end)
			
			if not success then
				table.insert(PendingTerrainFile.Properties.MaterialColors, {0,0,0})	-- Save pure black as a placeholder.
				warn("Failed to get " .. material or "UNKNOWN" .. "'s terrain color!")
			end
		end
		
		-- Finally, before we begin to capture the terrain itself, let's set up its region and add that to our file.
		
		local temp_tCenter:Vector3 =
			workspace.Terrain:WorldToCell(Players.LocalPlayer.Character.Humanoid.RootPart.Position)
		temp_tCenter = workspace.Terrain:CellCornerToWorld(temp_tCenter.X, temp_tCenter.Y, temp_tCenter.Z)	-- Snap to voxel grid.
		temp_tCenter -= Vector3.one * 2	-- Shift it back to the middle of the cell.
		
		local temp_tR3 = Region3.new(temp_tCenter-TerrainSaveSize, temp_tCenter+TerrainSaveSize):ExpandToGrid(4)
		local temp_tGrabMaterials = nil	-- A 3D array of terrain cells' material EnumItems.
		local temp_tGrabOccupancy = nil	-- Another 3D array, which stores how much of each cell is occupied by terrain.
		PendingTerrainFile.Position = Recreator.EncodeValueForJSON(temp_tCenter-TerrainSaveSize, "Vector3")
		
		local success, errormsg = pcall(function()
			message.Text = "Attempting to capture terrain, please wait! Your app may freeze for a few seconds while this happens."
			wait()
			temp_tGrabMaterials, temp_tGrabOccupancy = workspace.Terrain:ReadVoxels(temp_tR3, 4)
		end)
		
		if success then
			message.Text = "Gotcha! Now squeezing terrain occupancy/material data into smaller arrays..."
			ToggleUI(true)
			progress_ui.Text = "Saving terrain to a file..."
			progress_ui.Visible = true
			PendingTerrainFile.Size = Recreator.EncodeValueForJSON(Vector3.new(102,50,102), "Vector3")	-- HARDCODED 🤮
			
			--[[
				This code block may seem confusing, but it's just iterating through each sub-array in order, concatenating each
				value pair ([occupancy]![material]) into a comma-separated string list, Each "slice" is checked in order, turned
				into a long string, which is added to a basic array, "Data", in the saved JSON file.
				
				To hopefully speed up this process, this processes four different rows at the same time, and only yields for the
				last fourth.
			]]--
			-- HARDCODED 🤮
			task.spawn(function() ProcessTerrainRows(temp_tGrabOccupancy, temp_tGrabMaterials, 1, 25, 1) end)
			task.spawn(function() ProcessTerrainRows(temp_tGrabOccupancy, temp_tGrabMaterials, 26, 24, 2) end)
			task.spawn(function() ProcessTerrainRows(temp_tGrabOccupancy, temp_tGrabMaterials, 51, 25, 3) end)
			task.spawn(function() ProcessTerrainRows(temp_tGrabOccupancy, temp_tGrabMaterials, 77, 25, 4) end)
			progress_ui.Text = "Beginning to save terrain!"
			
			--Wait until all 102 rows (X) have been written to the file. If any string is too short, wait another second.
			local saveStatus="running"	-- This becomes "done" if all rows are added to the array successfully, and "fail" on errors.
			while saveStatus == "running" do
				progress_ui.Text =
					"Saving terrain! " ..
					math.round(((SavePercents[1]+SavePercents[2]+SavePercents[3]+SavePercents[4])/4)*2)/2 .. "% done."
				wait(0.75)
				
				if SavePercents[1]<-0.01 or SavePercents[2]<-0.01 or SavePercents[3]<-0.01 or SavePercents[4]<-0.01 then
					saveStatus = "fail"
					break
				elseif SavePercents[1]>=100 and SavePercents[2]>=100 and SavePercents[3]>=100 and SavePercents[4]>=100 then
					saveStatus = "done"
					break	-- Although this whole block's hackish, skip the slow loop below if all threads report they're complete.
				end
				for num,str in PendingTerrainFile.Data do
					-- If any string is too short, break this nested loop and restart the outer one.
					if str:len() < 1 then
						saveStatus = "running_r"
						break
					end
					if num % 100 == 0 then task.wait() end
				end
				
				-- HACKISH: If saveStatus was set to "running_r", reset it to "running" then let the loop restart. Otherwise, done!
				if saveStatus == "running_r" then
					saveStatus = "running"
				else saveStatus = "done"
				end
			end
			progress_ui.Visible = false
			
			table.clear(temp_tGrabMaterials); table.clear(temp_tGrabOccupancy);
			
			if saveStatus == "done" then
				-- Everything should be in the dictionary entry now, so let's turn it into a JSON file!
				local temp_tJSONVer:string? = nil
				local success1, errormsg1 = pcall(function()
					temp_tJSONVer = game:GetService("HttpService"):JSONEncode(PendingTerrainFile)
				end)
				
				if success1 then
					local success2, errormsg2 = pcall(function()
						writefile(temp_tFilename, temp_tJSONVer)
					end)
					
					if success2 then
						message.Text =
							"Done! The terrain around you was saved to " .. temp_tFilename .. "! It's shown as a box around you now."
						
						local temp_newBox = TerrainMarkerTemplate:Clone()
						temp_newBox.Name ..= "_" .. temp_tSaveId
						temp_newBox.CFrame = temp_tR3.CFrame
						temp_newBox.Parent = workspace.CurrentCamera
						table.insert(SavedTerrainBoxes, temp_newBox)	-- Keep track of this box, so it can be removed later.
					end
				else
					message.Text = "For some reason, this terrain capture couldn't be converted to JSON! Reason: " .. errormsg1 or "None"
				end
			else
				message.Text =
					"Unfortunately, the terrain data couldn't be squeezed due to an error. Please check the Console (F9) for info."
			end
		else
			message.Text = "Unfortunately, terrain couldn't be saved here. Reason: " .. errormsg or "No error message given."
		end
		
		table.clear(PendingTerrainFile)
		PendingTerrainFile = nil
		IsBusy = false
		ToggleUI(false)
	end
end)

-- Unfreezes frozen char. parts, shows the GUI, and unsets the "busy" flag, restoring the ability to select instances again.
-- If _success is set, this function also deselects everything and redraws the list.
local function PostSaveCleanup(_success)
	if _success then
		RedrawVisibleList()
		Recreator.Select("set", {})
	end
	
	if not GUIShown then
		ToggleUI(false)
		task.wait(0.25)
		ChangeButtonState(true)
		
		message.Text = "Done! Transfer the new JSON files in your workspace folder to your PC, " ..
			"then paste each of them into the Studio plugin's text fields, adding more as needed." ..
			"Make sure the 'header' goes first, followed by each piece IN ORDER!"
		
		IsBusy = false
	end
end
Recreator.OnSaveDone = function(_success : boolean)
	PostSaveCleanup(_success)
end

save_button.MouseButton1Click:Connect(function()
	if not IsBusy and save_button.Active then
		if GUIShown then ToggleUI(false) end
		IsBusy = true
		progress_ui.Text	= "Preparing to save..."
		progress_ui.Visible	= true
		Recreator.Save(filename_box.Text)
		progress_ui.Visible = false
		IsBusy = false
	end
end)

close_button.MouseButton1Click:Connect(function()
	if not IsBusy then
		Recreator.ActivateAPI(false)
		table.clear(ListData)
		xane_mdlrecreator_gui:Destroy()
		for _,box : SelectionBox in SavedTerrainBoxes do box:Destroy() end
		table.clear(SavedTerrainBoxes)
		print("Xane's Model Recreator has been closed. Thank you for using this awesome script,", Players.LocalPlayer.DisplayName)
		script:Destroy()
	end
end)

Recreator.SetStatusGui(progress_ui)