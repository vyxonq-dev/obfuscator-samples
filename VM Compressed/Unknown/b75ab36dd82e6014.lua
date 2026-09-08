local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()
local CloseBind=Enum.KeyCode.RightControl
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end
if UserInputService.TouchEnabled==true then
	local CloseBtn=Instance.new("TextButton", Instance.new("ScreenGui", game.CoreGui))
	CloseBtn.Size=UDim2.new(0.1,0,0.1,0)
	MakeDraggable(CloseBtn, CloseBtn)
	CloseBtn.BackgroundTransparency=0
	CloseBtn.TextScaled=true
	CloseBtn.Text="MOBILE: Toggle Doors Hub (Aedaniss7's Doors Hub)"
	CloseBtn.MouseButton1Click:Connect(function()
		local VIM=game:GetService("VirtualInputManager")
		VIM:SendKeyEvent(true, CloseBind, false, nil)
		wait()
		VIM:SendKeyEvent(false, CloseBind, false, nil)
	end)
end
local win = Flux:Window("Aedaniss7's Doors Hub", "for DOORS", Color3.fromRGB(255, 110, 48), CloseBind)
local tab = win:Tab("Doors: Scripts", "http://www.roblox.com/asset/?id=6023426915")
--[[tab:Button("Kill all", "This function may not work sometimes and you can get banned.", function()
Flux:Notification("Killed all players successfully!", "Alright")
end)
tab:Label("This is just a label.")
tab:Line()
tab:Toggle("Auto-Farm Coins", "Automatically collects coins for you!", function(t)
print(t)
end)
tab:Slider("Walkspeed", "Makes your faster.", 0, 100,16,function(t)
print(t)
end)
tab:Dropdown("Part to aim at", {"Torso","Head","Penis"}, function(t)
print(t)
end)
tab:Colorpicker("ESP Color", Color3.fromRGB(255,1,1), function(t)
print(t)
end)
tab:Textbox("Gun Power", "This textbox changes your gun power, so you can kill everyone faster and easier.", true, function(t)
print(t)
end)
tab:Bind("Kill Bind", Enum.KeyCode.Q, function()
print("Killed a random person!")
end)
win:Tab("Tab 2", "http://www.roblox.com/asset/?id=6022668888")]]

--[[
Name = <string> - The name of the section.
]]
--tab:Button("MSPaint", "Activates MSPaint", function() loadstring(game: HttpGet("https://raw.githubusercontent.com/notpoiu/mspaint/main/main.lua"))() flux:Notification("Activated MSPaint!", "You can now exit out of this notification.") end)
tab:Label("Doors Scripts: Mine (includes my modes)")
tab:Button("THE TRIALS MODE", "",
	 function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Trials-mode/refs/heads/main/Main.luau"))()
	end)
tab:Button("HARDCORE (CRAFTER VARIENT) MODE (By me and Greysoniss5 so it's here)","",
	function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SoftieGrey/Hardcore-mode/refs/heads/main/Main.luau"))()
	end)
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
local tab2 = win:Tab("Doors: Modes", "http://www.roblox.com/asset/?id=6022668888")
tab2:Button("Hardcore V5 Beta", "",
function()
loadstring(game: HttpGet("https://raw.githubusercontent.com/jsienkiewicz13/Doors-Modes-Scripts/refs/heads/main/HardcoreV5Beta.lua"))()
  	end   )
tab2:Button("Mayhem", "",
	 function()
		loadstring(game:HttpGet("https://github.com/HollowedOutMods/MayhemMode/blob/main/loader.lua?raw=true"))()
	end)
tab2:Button( "Nightmare", "",
	function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/jsienkiewicz13/Doors-Modes-Scripts/refs/heads/main/NightmareModeObfuscatedMyVersion.lua"))()
	end)
tab2:Button("Impossible Mode", "",
	 function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/Ukazix/impossible-mode/main/Protected_79.lua.txt'))()
	end)
tab2:Button("Pure Nightmare", "",
	 function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/jsienkiewicz13/Doors-Modes-Scripts/refs/heads/main/Pure_Nightmare_Mode_Fixed.lua'))()
	end)
tab2:Label("My Modes")
tab2:Button("THE TRIALS MODE", "",
	 function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/softbf395/Trials-mode/refs/heads/main/Main.luau"))()
	end)
tab2:Button(
	"HARDCORE (CRAFTER VARIENT) MODE (By me and Greysoniss5 so it's here)", "",
	function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/SoftieGrey/Hardcore-mode/refs/heads/main/Main.luau"))()
	end)
