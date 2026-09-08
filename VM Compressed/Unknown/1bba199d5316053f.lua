-- IMPLEMENTATION GUIDE: https://docs.google.com/document/d/e/2PACX-1vRn-Kk2fFd_KLday7jbJmcRkNcHcyPDTz4oLlOvyLlMc_TMOKVGvTrBl4-xuYg68fc7Gd9zMJt5IvpE/pub

local C00lLib = loadstring(game:HttpGet("https://pastebin.com/raw/GgE62pUu"))()
print(
	"========================================"
)

print(
	"C00lLib Demo"
)

print(
	"Library Version:",
	C00lLib.Version
)

print(
	"========================================"
)

------------------------------------------------------------
-- CREATE WINDOW
------------------------------------------------------------

local Window =
	C00lLib:CreateWindow({
		Title =
		"C00lLib Showcase"
	})

------------------------------------------------------------
-- PAGE 1
-- BASIC CONTROLS
------------------------------------------------------------

local Main =
	Window:CreatePage(
		"Main"
	)

------------------------------------------------------------
-- LEFT SECTION
------------------------------------------------------------

Main.Left:Label(
	"C00lLib Feature Showcase",
	"WelcomeLabel"
)

Main.Left:Label(
	"Basic Controls",
	"BasicLabel"
)

------------------------------------------------------------
-- BUTTON
------------------------------------------------------------

Main.Left:Button(
	"Test Button",
	function()

		print(
			"[C00lLib] Test Button clicked!"
		)

	end,
	"TestButton"
)

------------------------------------------------------------
-- TOGGLE
------------------------------------------------------------

local DemoToggle =
	Main.Left:Toggle(
		"Demo Toggle",
		false,
		function(
			value
		)

			print(
				"[C00lLib] Demo Toggle:",
				value
			)

		end,
		"DemoToggle"
	)

------------------------------------------------------------
-- LABEL THAT SHOWS TOGGLE STATE
------------------------------------------------------------

Main.Left:Button(
	"Read Toggle",
	function()

		local value =
			Window:Get(
				"DemoToggle"
			):Get()

		print(
			"[C00lLib] Current toggle value:",
			value
		)

	end,
	"ReadToggle"
)

------------------------------------------------------------
-- RIGHT SECTION
------------------------------------------------------------

Main.Right:Label(
	"Text Input",
	"TextInputLabel"
)

------------------------------------------------------------
-- TEXTBOX
------------------------------------------------------------

local DemoTextBox =
	Main.Right:Textbox(
		"Username",
		"Enter your username...",
		function(
			text
		)

			print(
				"[C00lLib] TextBox changed:",
				text
			)

		end,
		"UsernameBox"
	)

------------------------------------------------------------
-- READ TEXTBOX
------------------------------------------------------------

Main.Right:Button(
	"Read TextBox",
	function()

		local text =
			Window:Get(
				"UsernameBox"
			):Get()

		print(
			"[C00lLib] Current TextBox value:",
			text
		)

	end,
	"ReadTextBox"
)

------------------------------------------------------------
-- PAGE 2
-- DROPDOWN / VALUES
------------------------------------------------------------

local Controls =
	Window:CreatePage(
		"Controls"
	)

------------------------------------------------------------
-- DROPDOWN
------------------------------------------------------------

Controls.Left:Label(
	"Dropdown",
	"DropdownLabel"
)

local DemoDropdown =
	Controls.Left:Dropdown(
		"Select Fruit",
		{
			"Apple",
			"Banana",
			"Orange",
			"Strawberry",
			"Watermelon"
		},
		function(
			value
		)

			print(
				"[C00lLib] Selected:",
				value
			)

		end,
		"FruitDropdown"
	)

------------------------------------------------------------
-- READ DROPDOWN
------------------------------------------------------------

Controls.Left:Button(
	"Read Dropdown",
	function()

		local value =
			Window:Get(
				"FruitDropdown"
			):Get()

		print(
			"[C00lLib] Current dropdown:",
			value
		)

	end,
	"ReadDropdown"
)

------------------------------------------------------------
-- DROPDOWN REFRESH DEMO
------------------------------------------------------------

Controls.Left:Button(
	"Refresh Dropdown",
	function()

		local dropdown =
			Window:Get(
				"FruitDropdown"
			)

		dropdown:Refresh(
			{
				"Red",
				"Green",
				"Blue",
				"Yellow",
				"Purple"
			}
		)

		print(
			"[C00lLib] Dropdown values refreshed!"
		)

	end,
	"RefreshDropdown"
)

------------------------------------------------------------
-- RIGHT SIDE
------------------------------------------------------------

Controls.Right:Label(
	"Programmatic Controls",
	"ProgrammaticLabel"
)

------------------------------------------------------------
-- PROGRAMMATIC TOGGLE
------------------------------------------------------------

Controls.Right:Button(
	"Turn Toggle ON",
	function()

		Window:Get(
			"DemoToggle"
		):Set(true)

		print(
			"[C00lLib] DemoToggle set to TRUE"
		)

	end,
	"ToggleOn"
)

Controls.Right:Button(
	"Turn Toggle OFF",
	function()

		Window:Get(
			"DemoToggle"
		):Set(false)

		print(
			"[C00lLib] DemoToggle set to FALSE"
		)

	end,
	"ToggleOff"
)

------------------------------------------------------------
-- PROGRAMMATIC TEXTBOX
------------------------------------------------------------

Controls.Right:Button(
	"Set TextBox",
	function()

		Window:Get(
			"UsernameBox"
		):Set(
			"C00lLib User"
		)

		print(
			"[C00lLib] TextBox updated programmatically."
		)

	end,
	"SetTextBox"
)

------------------------------------------------------------
-- PAGE 3
-- CALLBACK / STATE TESTING
------------------------------------------------------------

local State =
	Window:CreatePage(
		"State"
	)

------------------------------------------------------------
-- LEFT
------------------------------------------------------------

State.Left:Label(
	"State & Callbacks",
	"StateHeader"
)

local CallbackToggle =
	State.Left:Toggle(
		"Callback Toggle",
		true,
		function(
			enabled
		)

			print(
				"[C00lLib] Callback Toggle:",
				enabled
			)

		end,
		"CallbackToggle"
	)

------------------------------------------------------------
-- ONCHANGED DEMO
------------------------------------------------------------

Window:Get(
	"CallbackToggle"
):OnChanged(
	function(
		value
	)

		print(
			"[C00lLib] OnChanged fired:",
			value
		)

	end
)

------------------------------------------------------------
-- FORCE TOGGLE
------------------------------------------------------------

State.Left:Button(
	"Toggle State",
	function()

		local toggle =
			Window:Get(
				"CallbackToggle"
			)

		toggle:Set(
			not toggle:Get()
		)

	end,
	"FlipToggle"
)

------------------------------------------------------------
-- RIGHT
------------------------------------------------------------

State.Right:Label(
	"Current Values",
	"ValuesHeader"
)

State.Right:Button(
	"Print All Values",
	function()

		print(
			"========== C00lLib STATE =========="
		)

		print(
			"Demo Toggle:",
			Window:Get(
				"DemoToggle"
			):Get()
		)

		print(
			"Username:",
			Window:Get(
				"UsernameBox"
			):Get()
		)

		print(
			"Fruit:",
			Window:Get(
				"FruitDropdown"
			):Get()
		)

		print(
			"Callback Toggle:",
			Window:Get(
				"CallbackToggle"
			):Get()
		)

		print(
			"==================================="
		)

	end,
	"PrintState"
)

------------------------------------------------------------
-- PAGE 4
-- WINDOW FUNCTIONS
------------------------------------------------------------

local WindowPage =
	Window:CreatePage(
		"Window"
	)

------------------------------------------------------------
-- LEFT
------------------------------------------------------------

WindowPage.Left:Label(
	"Window Controls",
	"WindowHeader"
)

------------------------------------------------------------
-- HIDE
------------------------------------------------------------

WindowPage.Left:Button(
	"Hide Window",
	function()

		print(
			"[C00lLib] Hiding window..."
		)

		Window:Hide()

	end,
	"HideWindow"
)

------------------------------------------------------------
-- SHOW
------------------------------------------------------------

WindowPage.Left:Button(
	"Show Window",
	function()

		Window:Show()

	end,
	"ShowWindow"
)

------------------------------------------------------------
-- TITLE
------------------------------------------------------------

WindowPage.Right:Label(
	"Title",
	"TitleHeader"
)

WindowPage.Right:Button(
	"Change Title",
	function()

		Window:SetTitle(
			"C00lLib Demo - Updated!"
		)

		print(
			"[C00lLib] Window title changed."
		)

	end,
	"ChangeTitle"
)

------------------------------------------------------------
-- RESTORE TITLE
------------------------------------------------------------

WindowPage.Right:Button(
	"Restore Title",
	function()

		Window:SetTitle(
			"C00lLib Showcase"
		)

	end,
	"RestoreTitle"
)

------------------------------------------------------------
-- PAGE 5
-- EXPLORER
------------------------------------------------------------

local ExplorerPage =
	Window:CreatePage(
		"Explorer"
	)

------------------------------------------------------------
-- EXPLORER INFORMATION
------------------------------------------------------------

ExplorerPage.Left:Label(
	"C00lLib Explorer",
	"ExplorerHeader"
)

ExplorerPage.Left:Label(
	"Browse the client-visible",
	"ExplorerInfo1"
)

ExplorerPage.Left:Label(
	"DataModel and edit properties.",
	"ExplorerInfo2"
)

------------------------------------------------------------
-- OPEN EXPLORER
------------------------------------------------------------

ExplorerPage.Left:Button(
	"Open Explorer",
	function()

		print(
			"[C00lLib] Opening Explorer..."
		)

		Window:Explorer()

	end,
	"OpenExplorer"
)

------------------------------------------------------------
-- EXPLORER NOTE
------------------------------------------------------------

ExplorerPage.Right:Label(
	"Explorer Features",
	"ExplorerFeatures"
)

ExplorerPage.Right:Label(
	"â¢ Browse Instances",
	"ExplorerFeature1"
)

ExplorerPage.Right:Label(
	"â¢ Expand / Collapse",
	"ExplorerFeature2"
)

ExplorerPage.Right:Label(
	"â¢ Search Instances",
	"ExplorerFeature3"
)

ExplorerPage.Right:Label(
	"â¢ View Properties",
	"ExplorerFeature4"
)

ExplorerPage.Right:Label(
	"â¢ Edit Properties",
	"ExplorerFeature5"
)

ExplorerPage.Right:Label(
	"â¢ Edit Attributes",
	"ExplorerFeature6"
)

------------------------------------------------------------
-- PAGE 6
-- FINAL DEMONSTRATION
------------------------------------------------------------

local Final =
	Window:CreatePage(
		"Demo"
	)

------------------------------------------------------------
-- LEFT
------------------------------------------------------------

Final.Left:Label(
	"Interactive Demo",
	"DemoHeader"
)

Final.Left:Button(
	"Run Demo",
	function()

		print(
			"========================================"
		)

		print(
			"C00lLib Demo Started"
		)

		------------------------------------------------
		-- TOGGLE
		------------------------------------------------

		local toggle =
			Window:Get(
				"DemoToggle"
			)

		toggle:Set(
			true
		)

		task.wait(
			0.5
		)

		toggle:Set(
			false
		)

		------------------------------------------------
		-- TEXTBOX
		------------------------------------------------

		local textbox =
			Window:Get(
				"UsernameBox"
			)

		textbox:Set(
			"Demo User"
		)

		task.wait(
			0.5
		)

		------------------------------------------------
		-- DROPDOWN
		------------------------------------------------

		local dropdown =
			Window:Get(
				"FruitDropdown"
			)

		dropdown:Set(
			"Strawberry"
		)

		------------------------------------------------
		-- PRINT VALUES
		------------------------------------------------

		print(
			"Toggle:",
			toggle:Get()
		)

		print(
			"TextBox:",
			textbox:Get()
		)

		print(
			"Dropdown:",
			dropdown:Get()
		)

		print(
			"C00lLib Demo Complete!"
		)

		print(
			"========================================"
		)

	end,
	"RunDemo"
)

------------------------------------------------------------
-- RIGHT
------------------------------------------------------------

Final.Right:Label(
	"Library Information",
	"LibraryInfo"
)

Final.Right:Label(
	"Version: "
		.. tostring(
			C00lLib.Version
		),
	"VersionLabel"
)

Final.Right:Label(
	"Pages: 6",
	"PagesLabel"
)

Final.Right:Label(
	"Controls: Buttons / Labels /",
	"ControlsLabel1"
)

Final.Right:Label(
	"Toggles / TextBoxes / Dropdowns",
	"ControlsLabel2"
)

Final.Right:Label(
	"Explorer + property editing",
	"ControlsLabel3"
)

------------------------------------------------------------
-- FINISHED
------------------------------------------------------------

print(
	"[C00lLib] Showcase loaded successfully!"
)

print(
	"[C00lLib] Version:",
	C00lLib.Version
)