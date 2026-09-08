--[[

]]



local Drawing = loadstring(game:HttpGet("https://raw.githubusercontent.com/linemaster2/storage/main/Drawing.lua"))();

local Library = {};
do
	Library = {
		Open = true;
		Accent = Color3.fromRGB(207, 227, 0);
		Pages = {};
		Sections = {};
		Flags = {};
		UnNamedFlags = 0;
		ThemeObjects = {};
		Instances = {};
		Holder = nil;
		OldSize = nil;
		ScreenGUI = nil;
		DropdownOpen = false,
		OptionListOpen = false,
		Keys = {
			[Enum.KeyCode.Space] = "Space",
			[Enum.KeyCode.Return] = "Return",
			[Enum.KeyCode.LeftShift] = "LShift",
			[Enum.KeyCode.RightShift] = "RShift",
			[Enum.KeyCode.LeftControl] = "LCtrl",
			[Enum.KeyCode.RightControl] = "RCtrl",
			[Enum.KeyCode.LeftAlt] = "LAlt",
			[Enum.KeyCode.RightAlt] = "RAlt",
			[Enum.KeyCode.CapsLock] = "CAPS",
			[Enum.KeyCode.One] = "1",
			[Enum.KeyCode.Two] = "2",
			[Enum.KeyCode.Three] = "3",
			[Enum.KeyCode.Four] = "4",
			[Enum.KeyCode.Five] = "5",
			[Enum.KeyCode.Six] = "6",
			[Enum.KeyCode.Seven] = "7",
			[Enum.KeyCode.Eight] = "8",
			[Enum.KeyCode.Nine] = "9",
			[Enum.KeyCode.Zero] = "0",
			[Enum.KeyCode.KeypadOne] = "Num1",
			[Enum.KeyCode.KeypadTwo] = "Num2",
			[Enum.KeyCode.KeypadThree] = "Num3",
			[Enum.KeyCode.KeypadFour] = "Num4",
			[Enum.KeyCode.KeypadFive] = "Num5",
			[Enum.KeyCode.KeypadSix] = "Num6",
			[Enum.KeyCode.KeypadSeven] = "Num7",
			[Enum.KeyCode.KeypadEight] = "Num8",
			[Enum.KeyCode.KeypadNine] = "Num9",
			[Enum.KeyCode.KeypadZero] = "Num0",
			[Enum.KeyCode.Minus] = "-",
			[Enum.KeyCode.Equals] = "=",
			[Enum.KeyCode.Tilde] = "~",
			[Enum.KeyCode.LeftBracket] = "[",
			[Enum.KeyCode.RightBracket] = "]",
			[Enum.KeyCode.RightParenthesis] = ")",
			[Enum.KeyCode.LeftParenthesis] = "(",
			[Enum.KeyCode.Semicolon] = ",",
			[Enum.KeyCode.Quote] = "'",
			[Enum.KeyCode.BackSlash] = "\\",
			[Enum.KeyCode.Comma] = ",",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Slash] = "/",
			[Enum.KeyCode.Asterisk] = "*",
			[Enum.KeyCode.Plus] = "+",
			[Enum.KeyCode.Period] = ".",
			[Enum.KeyCode.Backquote] = "`",
			[Enum.UserInputType.MouseButton1] = "MB1",
			[Enum.UserInputType.MouseButton2] = "MB2",
			[Enum.UserInputType.MouseButton3] = "MB3"
		};
		Connections = {};
		FontSize = 12;
		VisValues = {};
		UIKey = Enum.KeyCode.Insert;
		Notifs = {};
	}

	-- // Ignores
	local Flags = {} -- Ignore
	local ColorHolders = {}


	-- // Extension
	Library.__index = Library
	Library.Pages.__index = Library.Pages
	Library.Sections.__index = Library.Sections
	local LocalPlayer = game:GetService('Players').LocalPlayer;
	local Mouse = LocalPlayer:GetMouse();
	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")

	-- // Misc Functions
	do
		function Library:Connection(signal, Callback)
			local Con = signal:Connect(Callback)
			return Con
		end
		--
		function Library:Disconnect(Connection)
			Connection:Disconnect()
		end
		--
		function Library:Round(Number, Float)
			return Float * math.floor(Number / Float)
		end
		--
		function Library.NextFlag()
			Library.UnNamedFlags = Library.UnNamedFlags + 1
			return string.format("%.14g", Library.UnNamedFlags)
		end
		--
		function Library:GetConfig()
			local Config = ""
			for Index, Value in pairs(self.Flags) do
				if
					Index ~= "ConfigConfig_List"
					and Index ~= "ConfigConfig_Load"
					and Index ~= "ConfigConfig_Save"
				then
					local Value2 = Value
					local Final = ""
					--
					if typeof(Value2) == "Color3" then
						local hue, sat, val = Value2:ToHSV()
						--
						Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, 1)
					elseif typeof(Value2) == "table" and Value2.Color and Value2.Transparency then
						local hue, sat, val = Value2.Color:ToHSV()
						--
						Final = ("rgb(%s,%s,%s,%s)"):format(hue, sat, val, Value2.Transparency)
					elseif typeof(Value2) == "table" and Value.Mode then
						local Values = Value.current
						--
						Final = ("key(%s,%s,%s)"):format(Values[1] or "nil", Values[2] or "nil", Value.Mode)
					elseif Value2 ~= nil then
						if typeof(Value2) == "boolean" then
							Value2 = ("bool(%s)"):format(tostring(Value2))
						elseif typeof(Value2) == "table" then
							local New = "table("
							--
							for Index2, Value3 in pairs(Value2) do
								New = New .. Value3 .. ","
							end
							--
							if New:sub(#New) == "," then
								New = New:sub(0, #New - 1)
							end
							--
							Value2 = New .. ")"
						elseif typeof(Value2) == "string" then
							Value2 = ("string(%s)"):format(Value2)
						elseif typeof(Value2) == "number" then
							Value2 = ("number(%s)"):format(Value2)
						end
						--
						Final = Value2
					end
					--
					Config = Config .. Index .. ": " .. tostring(Final) .. "\n"
				end
			end
			--
			return Config
		end
		--
		function Library:LoadConfig(Config)
			local Table = string.split(Config, "\n")
			local Table2 = {}
			for Index, Value in pairs(Table) do
				local Table3 = string.split(Value, ":")
				--
				if Table3[1] ~= "ConfigConfig_List" and #Table3 >= 2 then
					local Value = Table3[2]:sub(2, #Table3[2])
					--
					if Value:sub(1, 3) == "rgb" then
						local Table4 = string.split(Value:sub(5, #Value - 1), ",")
						--
						Value = Table4
					elseif Value:sub(1, 3) == "key" then
						local Table4 = string.split(Value:sub(5, #Value - 1), ",")
						--
						if Table4[1] == "nil" and Table4[2] == "nil" then
							Table4[1] = nil
							Table4[2] = nil
						end
						--
						Value = Table4
					elseif Value:sub(1, 4) == "bool" then
						local Bool = Value:sub(6, #Value - 1)
						--
						Value = Bool == "true"
					elseif Value:sub(1, 5) == "table" then
						local Table4 = string.split(Value:sub(7, #Value - 1), ",")
						--
						Value = Table4
					elseif Value:sub(1, 6) == "string" then
						local String = Value:sub(8, #Value - 1)
						--
						Value = String
					elseif Value:sub(1, 6) == "number" then
						local Number = tonumber(Value:sub(8, #Value - 1))
						--
						Value = Number
					end
					--
					Table2[Table3[1]] = Value
				end
			end
			--
			for i, v in pairs(Table2) do
				if Flags[i] then
					if typeof(Flags[i]) == "table" then
						Flags[i]:Set(v)
					else
						Flags[i](v)
					end
				end
			end
		end
		--
		function Library:SetOpen(bool)
			if typeof(bool) == 'boolean' then
				Library.Open = bool;
				if Library.Open then
					Library.Holder.Visible = true
					--game:GetService("TweenService"):Create(Library.Holder, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Library.OldSize.X.Offset,0,40)}):Play()
					game:GetService("TweenService"):Create(Library.Holder, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Library.OldSize.X.Offset,0,Library.OldSize.Y.Offset)}):Play()
				else
					--game:GetService("TweenService"):Create(Library.Holder, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Library.OldSize.X.Offset,0,40)}):Play()
					game:GetService("TweenService"):Create(Library.Holder, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, 0,0,20)}):Play()
					task.wait(0.25)
					Library.Holder.Visible = false
				end
			end
		end;
		--
		function Library:ChangeAccent(Color)
			Library.Accent = Color

			for obj, theme in next, Library.ThemeObjects do
				if theme:IsA("Frame") or theme:IsA("TextButton") then
					theme.BackgroundColor3 = Color
				elseif theme:IsA("TextLabel") then
					theme.TextColor3 = Color
				elseif theme:IsA("ScrollingFrame") then
					theme.ScrollBarImageColor3 = Library.Accent
				end
			end
		end
		--
		function Library:IsMouseOverFrame(Frame)
			local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize;

			if Mouse.X >= AbsPos.X and Mouse.X <= AbsPos.X + AbsSize.X
				and Mouse.Y >= AbsPos.Y and Mouse.Y <= AbsPos.Y + AbsSize.Y then

				return true;
			end;

			return false;
		end;
	end

	-- // Colorpicker Element
	do
		function Library:NewPicker(name, default, parent, count, flag, callback)
			-- // Instances
			local ColorpickerFrame = Instance.new("TextButton")
			ColorpickerFrame.Name = "Colorpicker_frame"
			ColorpickerFrame.BackgroundColor3 = default
			ColorpickerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ColorpickerFrame.BorderSizePixel = 0
			if count == 1 then
				ColorpickerFrame.Position = UDim2.new(1, - (count * 20),0.5,0)
			else
				ColorpickerFrame.Position = UDim2.new(1, - (count * 20) - (count * 4),0.5,0)
			end
			ColorpickerFrame.Size = UDim2.new(0, 20, 0, 20)
			ColorpickerFrame.AnchorPoint = Vector2.new(0,0.5)
			ColorpickerFrame.Text = ""
			ColorpickerFrame.AutoButtonColor = false

			local UICorner = Instance.new("UICorner")
			UICorner.Name = "UICorner"
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = ColorpickerFrame

			local UIStroke = Instance.new("UIStroke")
			UIStroke.Name = "UIStroke"
			UIStroke.Color = Color3.fromRGB(40, 40, 40)
			UIStroke.Parent = ColorpickerFrame

			ColorpickerFrame.Parent = parent

			local Colorpicker = Instance.new("TextButton")
			Colorpicker.Name = "Colorpicker"
			Colorpicker.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
			Colorpicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Colorpicker.BorderSizePixel = 0
			Colorpicker.Position = UDim2.new(0, ColorpickerFrame.AbsolutePosition.X - 100, 0, ColorpickerFrame.AbsolutePosition.Y - 50)
			Colorpicker.Size = UDim2.new(0, 180, 0, 180)
			Colorpicker.Parent = Library.ScreenGUI
			Colorpicker.ZIndex = 100
			Colorpicker.Visible = false
			Colorpicker.Text = ""
			Colorpicker.AutoButtonColor = false
			local H,S,V = default:ToHSV()
			local ImageLabel = Instance.new("ImageLabel")
			ImageLabel.Name = "ImageLabel"
			ImageLabel.Image = "rbxassetid://11970108040"
			ImageLabel.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
			ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageLabel.BorderSizePixel = 0
			ImageLabel.Position = UDim2.new(0.0556, 0, 0.026, 0)
			ImageLabel.Size = UDim2.new(0, 160, 0, 154)
			ImageLabel.Parent = Colorpicker

			local UICorner = Instance.new("UICorner")
			UICorner.Name = "UICorner"
			UICorner.CornerRadius = UDim.new(0, 6)
			UICorner.Parent = Colorpicker

			local ImageButton = Instance.new("ImageButton")
			ImageButton.Name = "ImageButton"
			ImageButton.Image = "rbxassetid://14684562507"
			ImageButton.BackgroundColor3 = Color3.fromHSV(H, 1, 1)
			ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton.BorderSizePixel = 0
			ImageButton.Position = UDim2.new(0.056, 0, 0.026, 0)
			ImageButton.Size = UDim2.new(0, 160, 0, 154)
			ImageButton.AutoButtonColor = false

			local SVSlider = Instance.new("Frame")
			SVSlider.Name = "SV_slider"
			SVSlider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SVSlider.BackgroundTransparency = 1
			SVSlider.ClipsDescendants = true
			SVSlider.Position = UDim2.new(0.855, 0, 0.0966, 0)
			SVSlider.Size = UDim2.new(0,7,0,7)
			SVSlider.ZIndex = 3

			local Val = Instance.new("ImageLabel")
			Val.Name = "Val"
			Val.Image = "http://www.roblox.com/asset/?id=14684563800"
			Val.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Val.BackgroundTransparency = 1
			Val.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Val.BorderSizePixel = 0
			Val.Size = UDim2.new(1, 0, 1, 0)
			Val.Parent = ImageButton

			local UICorner1 = Instance.new("UICorner")
			UICorner1.Name = "UICorner"
			UICorner1.CornerRadius = UDim.new(0, 100)
			UICorner1.Parent = SVSlider

			local UIStroke = Instance.new("UIStroke")
			UIStroke.Name = "UIStroke"
			UIStroke.Color = Color3.fromRGB(255, 255, 255)
			UIStroke.Parent = SVSlider

			SVSlider.Parent = ImageButton

			ImageButton.Parent = Colorpicker

			local ImageButton1 = Instance.new("ImageButton")
			ImageButton1.Name = "ImageButton"
			ImageButton1.Image = "http://www.roblox.com/asset/?id=16789872274"
			ImageButton1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ImageButton1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ImageButton1.BorderSizePixel = 0
			ImageButton1.Position = UDim2.new(0.5, 0,0, 165)
			ImageButton1.Size = UDim2.new(0, 160,0, 8)
			ImageButton1.AutoButtonColor = false
			ImageButton1.AnchorPoint = Vector2.new(0.5,0)
			ImageButton1.BackgroundTransparency = 1

			local Frame = Instance.new("Frame")
			Frame.Name = "Frame"
			Frame.BackgroundColor3 = Color3.fromRGB(254, 254, 254)
			Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Frame.BorderSizePixel = 0
			Frame.Position = UDim2.new(0.926, 0,0.5, 0)
			Frame.Size = UDim2.new(0, 12,0, 12)
			Frame.AnchorPoint = Vector2.new(0,0.5)
			Frame.ZIndex = 45

			local UICorner2 = Instance.new("UICorner")
			UICorner2.Name = "UICorner"
			UICorner2.Parent = Frame
			UICorner2.CornerRadius = UDim.new(1,0)

			local UICorner3 = Instance.new("UICorner")
			UICorner3.Name = "UICorner"
			UICorner3.Parent = ImageButton1

			Frame.Parent = ImageButton1

			ImageButton1.Parent = Colorpicker

			-- // Connections
			local mouseover = false
			local hue, sat, val = default:ToHSV()
			local hsv = default:ToHSV()
			local oldcolor = hsv
			local slidingsaturation = false
			local slidinghue = false
			local slidingalpha = false

			local function update()
				local real_pos = game:GetService("UserInputService"):GetMouseLocation()
				local mouse_position = Vector2.new(real_pos.X, real_pos.Y - 30)
				local relative_palette = (mouse_position - ImageButton.AbsolutePosition)
				local relative_hue     = (mouse_position - ImageButton1.AbsolutePosition)
				--
				if slidingsaturation then
					sat = math.clamp(1 - relative_palette.X / ImageButton.AbsoluteSize.X, 0, 1)
					val = math.clamp(1 - relative_palette.Y / ImageButton.AbsoluteSize.Y, 0, 1)
				elseif slidinghue then
					hue = math.clamp(relative_hue.X / ImageButton.AbsoluteSize.X, 0, 1)
				end

				hsv = Color3.fromHSV(hue, sat, val)
				TweenService:Create(SVSlider, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(math.clamp(1 - sat, 0.000, 1 - 0.055), 0, math.clamp(1 - val, 0.000, 1 - 0.045), 0)}):Play()
				ImageButton.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
				ColorpickerFrame.BackgroundColor3 = hsv

				TweenService:Create(Frame, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(math.clamp(hue, 0.000, 0.982),-5,0.5,0)}):Play()

				if flag then
					Library.Flags[flag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
				end

				callback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
			end

			local function set(color)
				if type(color) == "table" then
					color = Color3.fromHSV(color[1], color[2], color[3])
				end
				if type(color) == "string" then
					color = Color3.fromHex(color)
				end

				local oldcolor = hsv

				hue, sat, val = color:ToHSV()
				hsv = Color3.fromHSV(hue, sat, val)

				if hsv ~= oldcolor then
					ColorpickerFrame.BackgroundColor3 = hsv
					TweenService:Create(SVSlider, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(math.clamp(1 - sat, 0.000, 1 - 0.055), 0, math.clamp(1 - val, 0.000, 1 - 0.045), 0)}):Play()
					ImageButton.BackgroundColor3 = Color3.fromHSV(hue, 1, 1)
					TweenService:Create(Frame, TweenInfo.new(0.05, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(math.clamp(hue, 0.000, 0.982),-5,0.5,0)}):Play()

					if flag then
						Library.Flags[flag] = Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255)
					end

					callback(Color3.fromRGB(hsv.r * 255, hsv.g * 255, hsv.b * 255))
				end
			end

			Flags[flag] = set

			set(default)

			ImageButton.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidingsaturation = true
					update()
				end
			end)

			ImageButton.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidingsaturation = false
					update()
				end
			end)

			ImageButton1.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidinghue = true
					update()
				end
			end)

			ImageButton1.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slidinghue = false
					update()
				end
			end)

			Library:Connection(game:GetService("UserInputService").InputChanged, function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if slidinghue then
						update()
					end

					if slidingsaturation then
						update()
					end
				end
			end)

			local colorpickertypes = {}

			function colorpickertypes:Set(color, newalpha)
				set(color, newalpha)
			end

			Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
				if Colorpicker.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not Library:IsMouseOverFrame(Colorpicker) and not Library:IsMouseOverFrame(ColorpickerFrame) then
						Colorpicker.Position = UDim2.new(0, ColorpickerFrame.AbsolutePosition.X - 100, 0, ColorpickerFrame.AbsolutePosition.Y + 25)
						TweenService:Create(Colorpicker, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
						TweenService:Create(Colorpicker, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Position = UDim2.new(0, ColorpickerFrame.AbsolutePosition.X - 100, 0, ColorpickerFrame.AbsolutePosition.Y)}):Play()
						task.spawn(function()
							task.wait(0.1)
							Colorpicker.Visible = false
							parent.ZIndex = 1
							Library.Cooldown = false
						end)
						for _,V in next, Colorpicker:GetDescendants() do
							if V:IsA("Frame") or V:IsA("TextButton") or V:IsA("ScrollingFrame") then
								TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
								Library.VisValues[V] = V.BackgroundTransparency
							elseif V:IsA("TextLabel") or V:IsA("TextBox") then
								TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
								Library.VisValues[V] = V.TextTransparency
							elseif V:IsA("ImageLabel") or V:IsA("ImageButton") then
								TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play();
								Library.VisValues[V] = V.ImageTransparency
							elseif V:IsA("UIStroke") then
								TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Transparency = 1}):Play()
								Library.VisValues[V] = V.Transparency
							end
						end
					end
				end
			end)

			ColorpickerFrame.MouseButton1Down:Connect(function()
				if Colorpicker.Visible == false then
					Colorpicker.Position = UDim2.new(0, ColorpickerFrame.AbsolutePosition.X - 100, 0, ColorpickerFrame.AbsolutePosition.Y)
					TweenService:Create(Colorpicker, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0, ColorpickerFrame.AbsolutePosition.X - 100, 0, ColorpickerFrame.AbsolutePosition.Y + 25)}):Play()
				end
				Colorpicker.Visible = true
				parent.ZIndex = 100
				Library.Cooldown = true
				TweenService:Create(Colorpicker, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				for _,V in next, Colorpicker:GetDescendants() do
					if V:IsA("Frame") or V:IsA("TextButton") or V:IsA("ScrollingFrame") then
						TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = Library.VisValues[V]}):Play()
					elseif V:IsA("TextLabel") or V:IsA("TextBox") then
						TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = Library.VisValues[V]}):Play()
					elseif V:IsA("ImageLabel") or V:IsA("ImageButton") then
						TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {ImageTransparency = Library.VisValues[V]}):Play();
					elseif V:IsA("UIStroke") then
						TweenService:Create(V, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Transparency = 0}):Play()
					end
				end

				if slidinghue then
					slidinghue = false
				end

				if slidingsaturation then
					slidingsaturation = false
				end
			end)

			return colorpickertypes, Colorpicker
		end
	end


	function Library:updateNotifsPositions(position)
		for i, v in pairs(Library.Notifs) do 
			local Position = Vector2.new(20, 20)
			game:GetService("TweenService"):Create(v.Container, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = UDim2.new(0,Position.X,0,Position.Y + (i * 25))}):Play()
		end 
	end

	function Library:Notification(message, duration)
		local notification = {Container = nil, Objects = {}}
		--
		local Position = Vector2.new(20, 20)
		--
		local NewInd = Instance.new("Frame")
		NewInd.Name = "NewInd"
		NewInd.AutomaticSize = Enum.AutomaticSize.X
		NewInd.Position = UDim2.new(0,20,0,20)
		NewInd.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		NewInd.BackgroundTransparency = 1
		NewInd.BorderColor3 = Color3.fromRGB(0, 0, 0)
		NewInd.Size = UDim2.fromOffset(0, 20)
		NewInd.Parent = Library.ScreenGUI
		notification.Container = NewInd

		local Outline = Instance.new("Frame")
		Outline.Name = "Outline"
		Outline.AnchorPoint = Vector2.new(0, 0)
		Outline.AutomaticSize = Enum.AutomaticSize.X
		Outline.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
		Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Outline.BorderSizePixel = 1
		Outline.Position = UDim2.new(0,0,0,0)
		Outline.Size = UDim2.fromOffset(0, 20)
		Outline.Visible = true
		Outline.ZIndex = 50
		Outline.Parent = NewInd
		Outline.BackgroundTransparency = 1

		local UICorner = Instance.new("UICorner")
		UICorner.Name = "UICorner"
		UICorner.CornerRadius = UDim.new(0, 4)
		UICorner.Parent = Outline

		local UIStroke = Instance.new("UIStroke")
		UIStroke.Name = "UIStroke"
		UIStroke.Parent = Outline
		UIStroke.Transparency = 1

		local Inline = Instance.new("Frame")
		Inline.Name = "Inline"
		Inline.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
		Inline.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Inline.BorderSizePixel = 0
		Inline.Position = UDim2.fromOffset(1, 1)
		Inline.Size = UDim2.new(1, -2, 1, -2)
		Inline.ZIndex = 51
		Inline.BackgroundTransparency = 1

		local UICorner2 = Instance.new("UICorner")
		UICorner2.Name = "UICorner_2"
		UICorner2.CornerRadius = UDim.new(0, 4)
		UICorner2.Parent = Inline

		local Title = Instance.new("TextLabel")
		Title.Name = "Title"
		Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
		Title.RichText = true
		Title.Text = message
		Title.TextColor3 = Color3.fromRGB(255, 255, 255)
		Title.TextSize = 13
		Title.TextXAlignment = Enum.TextXAlignment.Left
		Title.AutomaticSize = Enum.AutomaticSize.X
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1
		Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Title.BorderSizePixel = 0
		Title.Position = UDim2.fromOffset(5, 0)
		Title.Size = UDim2.fromScale(0, 1)
		Title.Parent = Inline
		Title.TextTransparency = 1

		local UIPadding = Instance.new("UIPadding")
		UIPadding.Name = "UIPadding"
		UIPadding.PaddingRight = UDim.new(0, 6)
		UIPadding.Parent = Inline

		Inline.Parent = Outline


		function notification:remove()
			table.remove(Library.Notifs, table.find(Library.Notifs, notification))
			Library:updateNotifsPositions(Position)
			task.wait(0.5)
			NewInd:Destroy()
		end

		task.spawn(function()
			Outline.AnchorPoint = Vector2.new(1,0)
			for i,v in next, NewInd:GetDescendants() do
				if v:IsA("Frame") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
				elseif v:IsA("UIStroke") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = 0}):Play()
				end
			end
			local Tween1 = game:GetService("TweenService"):Create(Outline, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {AnchorPoint = Vector2.new(0,0)}):Play()
			game:GetService("TweenService"):Create(Title, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
			task.wait(duration)
			--game:GetService("TweenService"):Create(ActualInd, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {AnchorPoint = Vector2.new(1,0)}):Play()
			for i,v in next, NewInd:GetDescendants() do
				if v:IsA("Frame") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
				elseif v:IsA("UIStroke") then
					game:GetService("TweenService"):Create(v, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Transparency = 1}):Play()
				end
			end
			game:GetService("TweenService"):Create(Title, TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
		end)

		task.delay(duration + 0.1, function()
			notification:remove()
		end)

		table.insert(Library.Notifs, notification)
		Library:updateNotifsPositions(Position)
		NewInd.Position = UDim2.new(0,Position.X,0,Position.Y + (table.find(Library.Notifs, notification) * 25))
		return notification
	end

	-- // Main
	do
		local Pages = Library.Pages;
		local Sections = Library.Sections;
		--
		function Library:New(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Window = {
				Size = Properties.Size or UDim2.new(0,600,0,450),
				Pages = {},
				PageAxis = 0,
				Dragging = { false, UDim2.new(0, 0, 0, 0) },
				Resized = nil,
				Elements = {},
			}
			--
			local ScreenGui = Instance.new('ScreenGui', game:GetService("RunService"):IsStudio() and game.Players.LocalPlayer.PlayerGui or game.CoreGui)
			local Outline = Instance.new('Frame', ScreenGui)
			local UICorner = Instance.new('UICorner', Outline)
			local UIStroke = Instance.new('UIStroke', Outline)
			local Inline = Instance.new('Frame', Outline)
			local UICorner_2 = Instance.new('UICorner', Inline)
			local Holder = Instance.new('Frame', Inline)
			local UICorner = Instance.new('UICorner', Holder)
			local Frame = Instance.new('Frame', Holder)
			local Tabs = Instance.new('Frame', Inline)
			local UIListLayout = Instance.new('UIListLayout', Tabs)
			local TextButton = Instance.new('TextButton', Inline)
			--
			ScreenGui.DisplayOrder = 100
			ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			Library.ScreenGUI = ScreenGui
			--
			Outline.Name = "Outline"
			Outline.Position = UDim2.new(0.5,0,0.5,0)
			Outline.Size = UDim2.new(0,0,0,40)
			Outline.BackgroundColor3 = Color3.new(0.1961,0.1961,0.1961)
			Outline.BorderColor3 = Color3.new(0,0,0)
			Outline.AnchorPoint = Vector2.new(0.5,0.5)
			Outline.ZIndex = 50
			Outline.ClipsDescendants = false
			Library.Holder = Outline
			Library.OldSize = Window.Size
			--
			local Logo = Instance.new("ImageLabel")
			Logo.Name = "Logo"
			Logo.Image = "http://www.roblox.com/asset/?id=17673929618"
			Logo.ScaleType = Enum.ScaleType.Fit
			Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Logo.BackgroundTransparency = 1
			Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Logo.BorderSizePixel = 0
			Logo.Position = UDim2.fromOffset(10, -20)
			Logo.Size = UDim2.fromOffset(90, 90)
			Logo.Parent = Holder
			--
			Inline.Name = "Inline"
			Inline.Position = UDim2.new(0,1,0,1)
			Inline.Size = UDim2.new(1,-2,1,-2)
			Inline.BackgroundColor3 = Color3.new(0.051,0.051,0.051)
			Inline.BorderSizePixel = 0
			Inline.BorderColor3 = Color3.new(0,0,0)
			Inline.ZIndex = 51
			--
			Holder.Name = "Holder"
			Holder.Position = UDim2.new(0,150,0,0)
			Holder.Size = UDim2.new(1,-150,1,0)
			Holder.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
			Holder.BorderSizePixel = 0
			Holder.BorderColor3 = Color3.new(0,0,0)
			Holder.ZIndex = 52
			--
			Frame.Size = UDim2.new(0,5,1,0)
			Frame.BackgroundColor3 = Color3.new(0.0588235, 0.0588235, 0.0588235)
			Frame.BorderSizePixel = 0
			Frame.BorderColor3 = Color3.new(0,0,0)
			--
			Tabs.Name = "Tabs"
			Tabs.Position = UDim2.new(0,5,0,10)
			Tabs.Size = UDim2.new(0,140,1,-20)
				Tabs.BackgroundColor3 = Color3.new(1,1,1)
			Tabs.BackgroundTransparency = 1.01
			Tabs.BorderSizePixel = 0
			Tabs.BorderColor3 = Color3.new(0,0,0)
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0,4)
			--
			TextButton.Size = UDim2.new(1,0,0,20)
			TextButton.BackgroundColor3 = Color3.new(1,1,1)
			TextButton.BackgroundTransparency = 1
			TextButton.BorderSizePixel = 0
			TextButton.BorderColor3 = Color3.new(0,0,0)
			TextButton.Text = ""
			TextButton.TextColor3 = Color3.new(0,0,0)
			TextButton.AutoButtonColor = false
			TextButton.Font = Enum.Font.SourceSans
			TextButton.TextSize = 14
			TextButton.ZIndex = 100

			local Line1 = Instance.new("Frame")
			Line1.Name = "Line1"
			Line1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			Line1.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line1.BorderSizePixel = 0
			Line1.Position = UDim2.fromOffset(0, 50)
			Line1.Size = UDim2.new(1, 0, 0, 1)
			Line1.Parent = Holder

			local Line2 = Instance.new("Frame")
			Line2.Name = "Line2"
			Line2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			Line2.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Line2.BorderSizePixel = 0
			Line2.Size = UDim2.new(0, 1, 1, 0)
			Line2.Parent = Holder

			local Logo = Instance.new("ImageLabel")
			Logo.Name = "Logo"
			Logo.Image = "http://www.roblox.com/asset/?id=17669613413"
			Logo.ScaleType = Enum.ScaleType.Fit
			Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Logo.BackgroundTransparency = 1
			Logo.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Logo.BorderSizePixel = 0
			Logo.Position = UDim2.fromOffset(10, -20)
			Logo.Size = UDim2.fromOffset(90, 90)
			Logo.Parent = Holder

			local FadeThing = Instance.new("Frame")
			FadeThing.Name = "FadeThing"
			FadeThing.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
			FadeThing.BorderColor3 = Color3.fromRGB(0, 0, 0)
			FadeThing.BorderSizePixel = 0
			FadeThing.Position = UDim2.fromOffset(9, 59)
			FadeThing.Size = UDim2.new(1, -18, 1, -63)
			FadeThing.ZIndex = 55
			FadeThing.Parent = Holder
			FadeThing.Visible = false

			-- // Elements
			Window.Elements = {
				TabHolder = Tabs,
				Holder = Holder,
				FadeThing = FadeThing
			}

			-- // Dragging
			Library:Connection(TextButton.MouseButton1Down, function()
				local Location = game:GetService("UserInputService"):GetMouseLocation()
				Window.Dragging[1] = true
				Window.Dragging[2] =
					UDim2.new(0, Location.X - Outline.AbsolutePosition.X, 0, Location.Y - Outline.AbsolutePosition.Y)
			end)
			Library:Connection(game:GetService("UserInputService").InputEnded, function(Input, IsTyping)
				if Input.UserInputType == Enum.UserInputType.MouseButton1 then
					Window.Dragging[1] = false
					Window.Dragging[2] = UDim2.new(0, 0, 0, 0)
				end
			end)
			Library:Connection(game:GetService("UserInputService").InputChanged, function(Input)
				local Location = game:GetService("UserInputService"):GetMouseLocation()
				local ActualLocation = nil

				-- Dragging
				if Window.Dragging[1] then

					game:GetService("TweenService"):Create(Outline, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,Location.X - Window.Dragging[2].X.Offset + (Outline.Size.X.Offset * Outline.AnchorPoint.X),0,Location.Y - Window.Dragging[2].Y.Offset + (Outline.Size.Y.Offset * Outline.AnchorPoint.Y))}):Play()
				end
			end)

			-- // Functions
			function Window:UpdateTabs()
				for Index, Page in pairs(Window.Pages) do
					Page:Turn(Page.Open)
				end
			end

			Library:Connection(game:GetService("UserInputService").InputBegan, function(Inp)
				if Inp.KeyCode == Library.UIKey then
					Library:SetOpen(not Library.Open)
				end
			end)

			game:GetService("TweenService"):Create(Library.Holder, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Window.Size.X.Offset,0,Window.Size.Y.Offset)}):Play()

			-- // Returns
			Library.Holder = Outline
			return setmetatable(Window, Library)
		end
		--
		function Library:Seperator(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Page = {
				Name = Properties.Name or "Page",
				Window = self,
				Elements = {},
			}
			--
			local TextSep = Instance.new('Frame', Page.Window.Elements.TabHolder)
			local TextLabel = Instance.new('TextLabel', TextSep)
			--
			TextSep.Name = "TextSep"
			TextSep.Size = UDim2.new(1,0,0,20)
			TextSep.BackgroundColor3 = Color3.new(1,1,1)
			TextSep.BackgroundTransparency = 1
			TextSep.BorderSizePixel = 0
			TextSep.BorderColor3 = Color3.new(0,0,0)
			--
			TextLabel.Position = UDim2.new(0,8,0,0)
			TextLabel.Size = UDim2.new(1,-10,1,0)
			TextLabel.BackgroundColor3 = Color3.new(1,1,1)
			TextLabel.BackgroundTransparency = 1
			TextLabel.BorderSizePixel = 0
			TextLabel.BorderColor3 = Color3.new(0,0,0)
			TextLabel.Text = Page.Name
			TextLabel.TextColor3 = Color3.new(0.7059,0.7059,0.7059)
			TextLabel.Font = Enum.Font.Gotham
			TextLabel.TextSize = Library.FontSize
			TextLabel.TextXAlignment = Enum.TextXAlignment.Left
		end
		--
		function Library:Page(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Page = {
				Name = Properties.Name or "Page",
				Icon = Properties.Icon or "http://www.roblox.com/asset/?id=6022668955",
				Window = self,
				Open = false,
				Sections = {},
				Elements = {},
			}
			--
			local TabButton = Instance.new('TextButton', Page.Window.Elements.TabHolder)
			local UICorner_3 = Instance.new('UICorner', TabButton)
			local Accent = Instance.new('Frame', TabButton)
			local UICorner = Instance.new('UICorner', Accent)
			local Title = Instance.new('TextLabel', TabButton)
			local Icon = Instance.new('ImageLabel', TabButton)
			local NewPage = Instance.new('Frame', Page.Window.Elements.Holder)
			local Left = Instance.new('Frame', NewPage)
			local LeftLayout = Instance.new('UIListLayout', Left)
			local Right = Instance.new('Frame', NewPage)
			local RightLayout = Instance.new('UIListLayout', Right)
			--
			TabButton.Name = "TabButton"
			TabButton.Size = UDim2.new(1,0,0,30)
			TabButton.BackgroundColor3 = Color3.new(0.0784,0.0784,0.0784)
			TabButton.BorderSizePixel = 0
			TabButton.BackgroundTransparency = 1
			TabButton.BorderColor3 = Color3.new(0,0,0)
			TabButton.Text = ""
			TabButton.TextColor3 = Color3.new(0,0,0)
			TabButton.AutoButtonColor = false
			TabButton.Font = Enum.Font.SourceSans
			TabButton.TextSize = 14
			TabButton.ClipsDescendants = true
			--
			Accent.Name = "Accent"
			Accent.Position = UDim2.new(0,-8,0,5)
			Accent.Size = UDim2.new(0,10,1,-10)
			Accent.BackgroundColor3 = Library.Accent
			Accent.BorderSizePixel = 0
			Accent.BorderColor3 = Color3.new(0,0,0)
			Accent.BackgroundTransparency = 0
			table.insert(Library.ThemeObjects, Accent)
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,35,0,0)
			Title.Size = UDim2.new(1,-10,1,0)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.Text = Page.Name
			Title.TextColor3 = Color3.fromRGB(120,120,120)
			Title.Font = Enum.Font.Gotham
			Title.TextSize = Library.FontSize
			Title.TextXAlignment = Enum.TextXAlignment.Left
			--
			Icon.Name = "Icon"
			Icon.Position = UDim2.new(0,11,0,8)
			Icon.Size = UDim2.new(0,15,0,15)
			Icon.BackgroundColor3 = Color3.new(1,1,1)
			Icon.BackgroundTransparency = 1
			Icon.BorderSizePixel = 0
			Icon.BorderColor3 = Color3.new(0,0,0)
			Icon.Image = Page.Icon
			Icon.ImageColor3 = Color3.fromRGB(120,120,120)
			--
			NewPage.Name = "NewPage"
			NewPage.Position = UDim2.new(0,10,0,60)
			NewPage.Size = UDim2.new(1,-20,1,-65)
			NewPage.BackgroundColor3 = Color3.new(1,1,1)
			NewPage.BackgroundTransparency = 1
			NewPage.BorderSizePixel = 0
			NewPage.BorderColor3 = Color3.new(0,0,0)
			NewPage.ZIndex = 53
			NewPage.Visible = false
			--
			Left.Name = "Left"
			Left.Size = UDim2.new(0.5,-4,1,0)
			Left.BackgroundColor3 = Color3.new(1,1,1)
			Left.BackgroundTransparency = 1
			Left.BorderSizePixel = 0
			--// Left.ScrollBarThickness = 0.1
			Left.BorderColor3 = Color3.new(0,0,0)
			Left.ZIndex = 54
			--
			LeftLayout.Name = "LeftLayout"
			LeftLayout.SortOrder = Enum.SortOrder.LayoutOrder
			LeftLayout.Padding = UDim.new(0,8)
			--
			Right.Name = "Right"
			Right.Position = UDim2.new(0.5,4,0,0)
			Right.Size = UDim2.new(0.5,-4,1,0)
			--// Right.ScrollBarThickness = 0.1
			Right.BackgroundColor3 = Color3.new(1,1,1)
			Right.BackgroundTransparency = 1
			Right.BorderSizePixel = 0
			Right.BorderColor3 = Color3.new(0,0,0)
			Right.ZIndex = 53
			--
			RightLayout.Name = "RightLayout"
			RightLayout.SortOrder = Enum.SortOrder.LayoutOrder
			RightLayout.Padding = UDim.new(0,8)

			-- // Functions
			function Page:Turn(bool)
				Page.Open = bool
				task.spawn(function()
					Page.Window.Elements.FadeThing.Visible = true
					TweenService:Create(Page.Window.Elements.FadeThing, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
					task.wait(0.1)
					NewPage.Visible = Page.Open
					TweenService:Create(Page.Window.Elements.FadeThing, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					task.wait(0.1)
					Page.Window.Elements.FadeThing.Visible = false
				end)
				game:GetService("TweenService"):Create(TabButton, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = Page.Open and 0 or 1}):Play()
				game:GetService("TweenService"):Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextColor3 = Page.Open and Color3.fromRGB(200,200,200) or Color3.fromRGB(120,120,120)}):Play()
				game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {ImageColor3 = Page.Open and Color3.fromRGB(200,200,200) or Color3.fromRGB(120,120,120)}):Play()
				game:GetService("TweenService"):Create(Accent, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = Page.Open and 0 or 1}):Play()
			end
			--
			Library:Connection(TabButton.MouseButton1Click, function()
				if not Page.Open then
					Page:Turn(true)
					for _, Pages in pairs(Page.Window.Pages) do
						if Pages.Open and Pages ~= Page then
							Pages:Turn(false)
						end
					end
				end
			end)
			--
			Library:Connection(TabButton.MouseEnter, function()
				if not Page.Open then
					game:GetService("TweenService"):Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(180,180,180)}):Play()
					game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(180,180,180)}):Play()
				end
			end)
			--
			Library:Connection(TabButton.MouseLeave, function()
				if not Page.Open then
					game:GetService("TweenService"):Create(Title, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(120,120,120)}):Play()
					game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(120,120,120)}):Play()
				end
			end)

			-- // Elements
			Page.Elements = {
				Left = Left,
				Right = Right,
				TabButton = TabButton
			}

			-- // Drawings
			if #Page.Window.Pages == 0 then
				Page:Turn(true)
			end
			Page.Window.Pages[#Page.Window.Pages + 1] = Page
			Page.Window:UpdateTabs()
			return setmetatable(Page, Library.Pages)
		end
		--
		function Pages:Section(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Section = {
				Name = Properties.Name or "Section",
				Page = self,
				Side = (Properties.side or Properties.Side or "left"):lower(),
				Size = Properties.size or Properties.Size or 200,
				Elements = {},
				Content = {},
			}
			--
			local NewSection = Instance.new('Frame', Section.Side == "left" and Section.Page.Elements.Left or Section.Side == "right" and Section.Page.Elements.Right)
			local UIStroke = Instance.new('UIStroke', NewSection)
			local UICorner = Instance.new('UICorner', NewSection)
			local Frame = Instance.new('Frame', NewSection)
			local Title = Instance.new('TextLabel', NewSection)
			local Content = Instance.new('Frame', NewSection)
			local UIListLayout = Instance.new('UIListLayout', Content)
			--
			NewSection.Name = "NewSection"
			NewSection.Size = Section.Size == "Fill" and UDim2.new(1,0,1,0) or UDim2.new(1,0,0,Section.Size)
			NewSection.BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
			NewSection.BorderSizePixel = 0
			NewSection.BorderColor3 = Color3.new(0,0,0)
			NewSection.ZIndex = 53
			--
			UIStroke.Color = Color3.new(0.137255, 0.137255, 0.137255)
			--
			Frame.Position = UDim2.new(0,0,0,20)
			Frame.Size = UDim2.new(1,0,0,1)
			Frame.BackgroundColor3 = Color3.new(0.1569,0.1569,0.1569)
			Frame.BorderSizePixel = 0
			Frame.BorderColor3 = Color3.new(0,0,0)
			--
			Title.Name = "Title"
			Title.Position = UDim2.new(0,8,0,1)
			Title.Size = UDim2.new(1,-10,0,20)
			Title.BackgroundColor3 = Color3.new(1,1,1)
			Title.BackgroundTransparency = 1
			Title.BorderSizePixel = 0
			Title.BorderColor3 = Color3.new(0,0,0)
			Title.Text = Section.Name
			Title.TextColor3 = Color3.new(0.7059,0.7059,0.7059)
			Title.Font = Enum.Font.Gotham
			Title.TextSize = Library.FontSize
			Title.TextXAlignment = Enum.TextXAlignment.Left
			--
			Content.Name = "Content"
			Content.Position = UDim2.new(0,10,0,30)
			Content.Size = UDim2.new(1,-20,1,-40)
			Content.BackgroundColor3 = Color3.new(1,1,1)
			Content.BackgroundTransparency = 1
			Content.BorderSizePixel = 0
			Content.BorderColor3 = Color3.new(0,0,0)
			Content.ZIndex = 53
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0,8)

			-- // Elements
			Section.Elements = {
				SectionContent = Content
			}

			-- // Returning
			Section.Page.Sections[#Section.Page.Sections + 1] = Section
			return setmetatable(Section, Library.Sections)
		end
		--
		function Sections:Toggle(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Toggle = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Risk = Properties.Risk or false,
				Name = Properties.Name or "Toggle",
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or false
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				Toggled = false,
			}
			--
			local NewToggle = Instance.new('TextButton', Toggle.Section.Elements.SectionContent)
			local ToggleTitle = Instance.new('TextLabel', NewToggle)
			local ToggleFrame = Instance.new('Frame', NewToggle)
			local UICorner_2 = Instance.new('UICorner', ToggleFrame)
			local ToggleAccent = Instance.new('Frame', ToggleFrame)
			local UICorner_3 = Instance.new('UICorner', ToggleAccent)
			local Circle = Instance.new('Frame', ToggleFrame)
			local UICorner_4 = Instance.new('UICorner', Circle)
			--
			NewToggle.Name = "NewToggle"
			NewToggle.Size = UDim2.new(1,0,0,17)
			NewToggle.BackgroundColor3 = Color3.new(1,1,1)
			NewToggle.BackgroundTransparency = 1
			NewToggle.BorderSizePixel = 0
			NewToggle.BorderColor3 = Color3.new(0,0,0)
			NewToggle.Text = ""
			NewToggle.TextColor3 = Color3.new(0,0,0)
			NewToggle.AutoButtonColor = false
			NewToggle.Font = Enum.Font.SourceSans
			NewToggle.TextSize = 14
			NewToggle.ZIndex = 53
			--
			ToggleTitle.Name = "ToggleTitle"
			ToggleTitle.Size = UDim2.new(1,-10,0,17)
			ToggleTitle.BackgroundColor3 = Color3.new(1,1,1)
			ToggleTitle.BackgroundTransparency = 1
			ToggleTitle.BorderSizePixel = 0
			ToggleTitle.BorderColor3 = Color3.new(0,0,0)
			ToggleTitle.Text = Toggle.Name
			ToggleTitle.TextColor3 = Color3.new(0.7843,0.7843,0.7843)
			ToggleTitle.Font = Enum.Font.Gotham
			ToggleTitle.TextSize = Library.FontSize
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
			--
			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Position = UDim2.new(1,-40,0,0)
			ToggleFrame.Size = UDim2.new(0,40,1,0)
			ToggleFrame.BackgroundColor3 = Color3.new(0.051,0.051,0.051)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.BorderColor3 = Color3.new(0,0,0)
			ToggleFrame.ZIndex = 53
			--
			ToggleAccent.Name = "ToggleAccent"
			ToggleAccent.Position = UDim2.new(0,1,0,1)
			ToggleAccent.Size = UDim2.new(1,-2,1,-2)
			ToggleAccent.BackgroundColor3 = Library.Accent
			ToggleAccent.BackgroundTransparency = 1
			ToggleAccent.BorderSizePixel = 0
			ToggleAccent.BorderColor3 = Color3.new(0,0,0)
			ToggleAccent.ZIndex = 53
			table.insert(Library.ThemeObjects, ToggleAccent)
			--
			Circle.Name = "Circle"
			Circle.Position = UDim2.new(0,5,0.5,-5)
			Circle.Size = UDim2.new(0,10,0,10)
			Circle.BackgroundColor3 = Color3.new(1,1,1)
			Circle.BorderSizePixel = 0
			Circle.BorderColor3 = Color3.new(0,0,0)
			Circle.ZIndex = 53
			--
			UICorner_4.CornerRadius = UDim.new(1,0)

			-- // Functions
			local function SetState()
				Toggle.Toggled = not Toggle.Toggled
				if Toggle.Toggled then
					game:GetService("TweenService"):Create(ToggleAccent, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
					game:GetService("TweenService"):Create(Circle, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(1,-15,0.5,-5)}):Play()
				else
					game:GetService("TweenService"):Create(ToggleAccent, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
					game:GetService("TweenService"):Create(Circle, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,5,0.5,-5)}):Play()
				end
				Library.Flags[Toggle.Flag] = Toggle.Toggled
				Toggle.Callback(Toggle.Toggled)
			end

			-- // Options List
			function Toggle:OptionList(Properties)
				if not Properties then
					Properties = {}
				end
				--
				local Section = {
					Elements = {},
					Content = {},
				}
				--
				local OptionButton = Instance.new('ImageButton', NewToggle)
				local OptionList = Instance.new('Frame', OptionButton)
				local UICorner = Instance.new('UICorner', OptionList)
				local UIStroke = Instance.new('UIStroke', OptionList)
				local OptionContent = Instance.new('Frame', OptionList)
				local UIListLayout = Instance.new('UIListLayout', OptionContent)
				--
				OptionButton.Name = "OptionButton"
				OptionButton.Position = UDim2.new(1,-65,0,1)
				OptionButton.Size = UDim2.new(0,15,0,15)
				OptionButton.BackgroundColor3 = Color3.new(1,1,1)
				OptionButton.BackgroundTransparency = 1
				OptionButton.BorderSizePixel = 0
				OptionButton.BorderColor3 = Color3.new(0,0,0)
				OptionButton.Image = "http://www.roblox.com/asset/?id=6031280882"
				OptionButton.ImageColor3 = Color3.new(0.7843,0.7843,0.7843)
				OptionButton.ZIndex = 54
				--
				OptionList.Name = "OptionList"
				OptionList.Position = UDim2.new(0,70,0,-10)
				OptionList.Size = UDim2.new(0,200,0,10)
				OptionList.BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
				OptionList.BorderSizePixel = 0
				OptionList.BorderColor3 = Color3.new(0,0,0)
				OptionList.AutomaticSize = Enum.AutomaticSize.Y
				OptionList.Visible = false
				OptionList.ZIndex = 54
				--
				UIStroke.Color = Color3.new(0.137255, 0.137255, 0.137255)
				--
				OptionContent.Name = "OptionContent"
				OptionContent.Position = UDim2.new(0,10,0,10)
				OptionContent.Size = UDim2.new(1,-20,1,-10)
				OptionContent.BackgroundColor3 = Color3.new(1,1,1)
				OptionContent.BackgroundTransparency = 1
				OptionContent.BorderSizePixel = 0
				OptionContent.BorderColor3 = Color3.new(0,0,0)
				OptionContent.AutomaticSize = Enum.AutomaticSize.Y
				OptionContent.ZIndex = 54
				--
				UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				UIListLayout.Padding = UDim.new(0,4)
				--
				Library:Connection(OptionButton.MouseButton1Click, function()
					local State = not OptionList.Visible
					--// local Position = OptionButton.AbsolutePosition
					--// OptionList.Position = UDim2.fromOffset(Position.X, Position.Y)
					OptionList.Visible = State
					Library.OptionListOpen = State
				end)
				--
				Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
					if (Library.DropdownOpen) then return end;
					
					if OptionList.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
						if not Library:IsMouseOverFrame(OptionList) and not Library:IsMouseOverFrame(OptionButton) then
							OptionList.Visible = false
						end
					end
				end)

				-- // Elements
				Section.Elements = {
					SectionContent = OptionContent
				}

				-- // Returning
				return setmetatable(Section, Library.Sections)
			end

			-- // Misc Functions
			function Toggle.Set(bool)
				bool = type(bool) == "boolean" and bool or false
				if Toggle.Toggled ~= bool then
					SetState()
				end
			end
			Toggle.Set(Toggle.State)
			Library.Flags[Toggle.Flag] = Toggle.State
			Flags[Toggle.Flag] = Toggle.Set

			-- // Returning
			Library:Connection(NewToggle.MouseButton1Click, SetState)
			return Toggle
		end
		--
		function Sections:Nest(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Section = {
				Name = Properties.Name or "Section",
				RealSection = self,
				Size = Properties.size or Properties.Size or 200,
				Elements = {},
				Content = {},
			}
			--
			local ScrollHolder = Instance.new("Frame", Section.RealSection.Elements.SectionContent)
			local NewScroll = Instance.new('ScrollingFrame', ScrollHolder)
			local UICorner2 = Instance.new('UICorner', ScrollHolder)
			local UIStroke = Instance.new('UIStroke', ScrollHolder)
			local ScrollContent = Instance.new('Frame', NewScroll)
			local UIListLayout = Instance.new('UIListLayout', ScrollContent)
			--
			ScrollHolder.Name = "ScrollHolder"
			ScrollHolder.Size = UDim2.new(1,0,0,Section.Size)
			ScrollHolder.BackgroundColor3 = Color3.new(0.0784314, 0.0784314, 0.0784314)
			ScrollHolder.BorderSizePixel = 0
			ScrollHolder.BorderColor3 = Color3.new(0,0,0)
			ScrollHolder.ClipsDescendants = true
			--
			NewScroll.Name = "NewScroll"
			NewScroll.Size = UDim2.new(1,0,1,0)
			NewScroll.BackgroundColor3 = Color3.new(0.098,0.098,0.098)
			NewScroll.BackgroundTransparency = 1
			NewScroll.BorderSizePixel = 0
			NewScroll.BorderColor3 = Color3.new(0,0,0)
			NewScroll.CanvasSize = UDim2.new(0,0,0,0)
			NewScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
			NewScroll.ScrollBarThickness = 2
			NewScroll.TopImage = ""
			NewScroll.BottomImage = ""
			NewScroll.VerticalScrollBarInset = Enum.ScrollBarInset.Always
			NewScroll.ScrollBarImageColor3 = Library.Accent
			NewScroll.ClipsDescendants = true
			table.insert(Library.ThemeObjects, NewScroll)
			--
			UIStroke.Color = Color3.new(0.137255, 0.137255, 0.137255)
			--
			ScrollContent.Name = "ScrollContent"
			ScrollContent.Position = UDim2.new(0,10,0,5)
			ScrollContent.Size = UDim2.new(1,-20,0,0)
			ScrollContent.BackgroundColor3 = Color3.new(1,1,1)
			ScrollContent.BackgroundTransparency = 1
			ScrollContent.BorderSizePixel = 0
			ScrollContent.BorderColor3 = Color3.new(0,0,0)
			ScrollContent.AutomaticSize = Enum.AutomaticSize.Y
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			UIListLayout.Padding = UDim.new(0,4)

			-- // Elements
			Section.Elements = {
				SectionContent = ScrollContent
			}

			-- // Returning
			return setmetatable(Section, Library.Sections)
		end
		--
		function Sections:Slider(Properties)
			if not Properties then
				Properties = {}
			end
			--
			local Slider = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = Properties.Name or "Slider",
				Min = (Properties.min or Properties.Min or Properties.minimum or Properties.Minimum or 0),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or 10
				),
				Max = (Properties.max or Properties.Max or Properties.maximum or Properties.Maximum or 100),
				Sub = (
					Properties.suffix
						or Properties.Suffix
						or Properties.ending
						or Properties.Ending
						or Properties.prefix
						or Properties.Prefix
						or Properties.measurement
						or Properties.Measurement
						or ""
				),
				Decimals = (Properties.decimals or Properties.Decimals or 1),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
			}
			local TextValue = ("[value]" .. Slider.Sub)
			--
			local NewSlider = Instance.new('TextButton', Slider.Section.Elements.SectionContent)
			local SliderTitle = Instance.new('TextLabel', NewSlider)
			local ToggleFrame = Instance.new('Frame', NewSlider)
			local UICorner_2 = Instance.new('UICorner', ToggleFrame)
			local FillHold = Instance.new('Frame', ToggleFrame)
			local UICorner_3 = Instance.new('UICorner', FillHold)
			local Fill = Instance.new('TextButton', FillHold)
			local UICorner_4 = Instance.new('UICorner', Fill)
			local Circle = Instance.new('Frame', Fill)
			local UICorner_4 = Instance.new('UICorner', Circle)
			local SliderValue = Instance.new('TextLabel', NewSlider)
			--
			NewSlider.Name = "NewSlider"
			NewSlider.Size = UDim2.new(1,0,0,32)
			NewSlider.BackgroundColor3 = Color3.new(1,1,1)
			NewSlider.BackgroundTransparency = 1
			NewSlider.BorderSizePixel = 0
			NewSlider.BorderColor3 = Color3.new(0,0,0)
			NewSlider.Text = ""
			NewSlider.TextColor3 = Color3.new(0,0,0)
			NewSlider.AutoButtonColor = false
			NewSlider.Font = Enum.Font.SourceSans
			NewSlider.TextSize = 14
			NewSlider.ZIndex = 53
			--
			SliderTitle.Name = "SliderTitle"
			SliderTitle.Size = UDim2.new(1,-10,0,17)
			SliderTitle.BackgroundColor3 = Color3.new(1,1,1)
			SliderTitle.BackgroundTransparency = 1
			SliderTitle.BorderSizePixel = 0
			SliderTitle.BorderColor3 = Color3.new(0,0,0)
			SliderTitle.Text = Slider.Name
			SliderTitle.TextColor3 = Color3.new(0.7843,0.7843,0.7843)
			SliderTitle.Font = Enum.Font.Gotham
			SliderTitle.TextSize = Library.FontSize
			SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
			--
			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Position = UDim2.new(0,0,1,-8)
			ToggleFrame.Size = UDim2.new(1,0,0,8)
			ToggleFrame.BackgroundColor3 = Color3.new(0.051,0.051,0.051)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.BorderColor3 = Color3.new(0,0,0)
			ToggleFrame.ZIndex = 53
			--
			FillHold.Name = "FillHold"
			FillHold.Position = UDim2.new(0,1,0,1)
			FillHold.Size = UDim2.new(1,-2,1,-2)
			FillHold.BackgroundColor3 = Color3.new(0.6667,0.6667,1)
			FillHold.BackgroundTransparency = 1
			FillHold.BorderSizePixel = 0
			FillHold.BorderColor3 = Color3.new(0,0,0)
			FillHold.ZIndex = 53
			--
			Fill.Name = "Fill"
			Fill.Size = UDim2.new(0,0,1,0)
			Fill.BackgroundColor3 = Library.Accent
			Fill.BorderSizePixel = 0
			Fill.BorderColor3 = Color3.new(0,0,0)
			Fill.Text = ""
			Fill.TextColor3 = Color3.new(0,0,0)
			Fill.AutoButtonColor = false
			Fill.Font = Enum.Font.SourceSans
			Fill.TextSize = 14
			Fill.ZIndex = 53
			table.insert(Library.ThemeObjects, Fill)
			--
			Circle.Name = "Circle"
			Circle.Position = UDim2.new(1,-6,0.5,-6)
			Circle.Size = UDim2.new(0,13,0,13)
			Circle.BackgroundColor3 = Color3.new(1,1,1)
			Circle.BorderSizePixel = 0
			Circle.BorderColor3 = Color3.new(0,0,0)
			Circle.ZIndex = 53
			--
			UICorner_4.CornerRadius = UDim.new(1,0)
			--
			SliderValue.Name = "SliderValue"
			SliderValue.Size = UDim2.new(1,0,0,17)
			SliderValue.BackgroundColor3 = Color3.new(1,1,1)
			SliderValue.BackgroundTransparency = 1
			SliderValue.BorderSizePixel = 0
			SliderValue.BorderColor3 = Color3.new(0,0,0)
			SliderValue.Text = ""
			SliderValue.TextColor3 = Color3.new(0.4706,0.4706,0.4706)
			SliderValue.Font = Enum.Font.Gotham
			SliderValue.TextSize = Library.FontSize
			SliderValue.TextXAlignment = Enum.TextXAlignment.Right

			-- // Functions
			local Sliding = false
			local Val = Slider.State
			local function Set(value)
				value = math.clamp(Library:Round(value, Slider.Decimals), Slider.Min, Slider.Max)

				local sizeX = ((value - Slider.Min) / (Slider.Max - Slider.Min))
				--Fill.Size = UDim2.new(sizeX, 0, 1, 0)
				game:GetService("TweenService"):Create(Fill, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(sizeX, 0, 1, 0)}):Play()
				SliderValue.Text = TextValue:gsub("%[value%]", string.format("%.14g", value))
				Val = value

				Library.Flags[Slider.Flag] = value
				Slider.Callback(value)
			end				
			--
			local function Slide(input)
				local sizeX = (input.Position.X - NewSlider.AbsolutePosition.X) / NewSlider.AbsoluteSize.X
				local value = ((Slider.Max - Slider.Min) * sizeX) + Slider.Min
				Set(value)
			end
			--
			Library:Connection(NewSlider.InputBegan, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = true
					Slide(input)
				end
			end)
			Library:Connection(NewSlider.InputEnded, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = false
				end
			end)
			Library:Connection(Fill.InputBegan, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = true
					Slide(input)
				end
			end)
			Library:Connection(Fill.InputEnded, function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					Sliding = false
				end
			end)
			Library:Connection(game:GetService("UserInputService").InputChanged, function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if Sliding then
						Slide(input)
					end
				end
			end)
			--
			function Slider:Set(Value)
				Set(Value)
			end
			--
			Flags[Slider.Flag] = Set
			Library.Flags[Slider.Flag] = Slider.State
			Set(Slider.State)

			-- // Returning
			return Slider
		end
		--
		function Sections:List(Properties)
			local Properties = Properties or {};
			local Dropdown = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Open = false,
				Name = Properties.Name or Properties.name or nil,
				Options = (Properties.options or Properties.Options or Properties.values or Properties.Values or {
					"1",
					"2",
					"3",
				}),
				Max = (Properties.Max or Properties.max or nil),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or nil
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				OptionInsts = {},
			}
			--
			local NewDropdown = Instance.new('Frame', Dropdown.Section.Elements.SectionContent)
			local DropdownTitle = Instance.new('TextLabel', NewDropdown)
			local ToggleFrame = Instance.new('TextButton', NewDropdown)
			local UICorner_2 = Instance.new('UICorner', ToggleFrame)
			local ToggleContent = Instance.new('Frame', ToggleFrame)
			local UICorner_3 = Instance.new('UICorner', ToggleContent)
			local UIListLayout = Instance.new('UIListLayout', ToggleContent)
			local DropdownTitle_2 = Instance.new('TextLabel', ToggleFrame)
			local Icon = Instance.new('ImageLabel', ToggleFrame)
			--
			NewDropdown.Name = "NewDropdown"
			NewDropdown.Size = UDim2.new(1,0,0,48)
			NewDropdown.BackgroundColor3 = Color3.new(1,1,1)
			NewDropdown.BackgroundTransparency = 1
			NewDropdown.BorderSizePixel = 0
			NewDropdown.BorderColor3 = Color3.new(0,0,0)
			NewDropdown.ZIndex = 54
			--
			DropdownTitle.Name = "DropdownTitle"
			DropdownTitle.Size = UDim2.new(1,-10,0,17)
			DropdownTitle.BackgroundColor3 = Color3.new(1,1,1)
			DropdownTitle.BackgroundTransparency = 1
			DropdownTitle.BorderSizePixel = 0
			DropdownTitle.BorderColor3 = Color3.new(0,0,0)
			DropdownTitle.Text = Dropdown.Name
			DropdownTitle.TextColor3 = Color3.new(0.7843,0.7843,0.7843)
			DropdownTitle.Font = Enum.Font.Gotham
			DropdownTitle.TextSize = Library.FontSize
			DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
			--
			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.Position = UDim2.new(0,0,1,-24)
			ToggleFrame.Size = UDim2.new(1,0,0,24)
			ToggleFrame.BackgroundColor3 = Color3.new(0.098,0.098,0.098)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.BorderColor3 = Color3.new(0,0,0)
			ToggleFrame.ZIndex = 54
			ToggleFrame.AutoButtonColor = false
			ToggleFrame.Text = ""
			--
			UICorner_2.CornerRadius = UDim.new(0,4)
			--
			ToggleContent.Name = "ToggleContent"
			ToggleContent.Position = UDim2.new(0,0,1,0)
			ToggleContent.Size = UDim2.new(1,0,0,0)
			ToggleContent.BackgroundColor3 = Color3.new(0.0706,0.0706,0.0706)
			ToggleContent.BorderSizePixel = 0
			ToggleContent.BorderColor3 = Color3.new(0,0,0)
			ToggleContent.ZIndex = 54
			ToggleContent.ClipsDescendants = true
			--
			UICorner_3.CornerRadius = UDim.new(0,4)
			--
			UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			--
			DropdownTitle_2.Name = "DropdownTitle"
			DropdownTitle_2.Position = UDim2.new(0,4,0,0)
			DropdownTitle_2.Size = UDim2.new(1,-10,1,0)
			DropdownTitle_2.BackgroundColor3 = Color3.new(1,1,1)
			DropdownTitle_2.BackgroundTransparency = 1
			DropdownTitle_2.BorderSizePixel = 0
			DropdownTitle_2.BorderColor3 = Color3.new(0,0,0)
			DropdownTitle_2.Text = ""
			DropdownTitle_2.TextColor3 = Color3.new(0.7843,0.7843,0.7843)
			DropdownTitle_2.Font = Enum.Font.Gotham
			DropdownTitle_2.TextSize = Library.FontSize
			DropdownTitle_2.TextXAlignment = Enum.TextXAlignment.Left
			--
			Icon.Name = "Icon"
			Icon.Position = UDim2.new(1,-25,0,5)
			Icon.Size = UDim2.new(0,20,0,15)
			Icon.BackgroundColor3 = Color3.new(1,1,1)
			Icon.BackgroundTransparency = 1
			Icon.BorderSizePixel = 0
			Icon.BorderColor3 = Color3.new(0,0,0)
			Icon.Image = "http://www.roblox.com/asset/?id=6034818372"
			Icon.ImageColor3 = Color3.new(0.4706,0.4706,0.4706)
			Icon.ZIndex = 54

			local Toggled = false
			local Count = 0

			Library:Connection(ToggleFrame.MouseButton1Click, function()
				Toggled = not Toggled
				Library.DropdownOpen = Toggled
				if Toggled then
					NewDropdown.ZIndex = 55
					game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play()
					game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(200,200,200)}):Play()
					game:GetService("TweenService"):Create(ToggleContent, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,0,Count * 22)}):Play()
				else
					game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
					game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(120,120,120)}):Play()
					game:GetService("TweenService"):Create(ToggleContent, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,0,0)}):Play()
					task.wait(0.20)
					NewDropdown.ZIndex = 54
				end
			end)
			--
			Library:Connection(game:GetService("UserInputService").InputBegan, function(Input)
				if ToggleContent.Visible and Input.UserInputType == Enum.UserInputType.MouseButton1 then
					if not Library:IsMouseOverFrame(ToggleContent) and not Library:IsMouseOverFrame(ToggleFrame) and not Library.OptionListOpen then
						Toggled = false
						Library.DropdownOpen = false
						game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageColor3 = Color3.fromRGB(120,120,120)}):Play()
						game:GetService("TweenService"):Create(Icon, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play()
						game:GetService("TweenService"):Create(ToggleContent, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,0,0)}):Play()
						task.wait(0.20)
						NewDropdown.ZIndex = 54
					end
				end
			end)
			--
			local Chosen = Dropdown.Max and {} or nil
			--
			local function handleoptionclick(option, button, text, dot)
				button.MouseButton1Click:Connect(function()
					if Dropdown.Max then
						if table.find(Chosen, option) then
							table.remove(Chosen, table.find(Chosen, option))

							local textchosen = {}
							local cutobject = false

							for _, opt in next, Chosen do
								table.insert(textchosen, opt)
							end

							DropdownTitle_2.Text = #Chosen == 0 and "" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")
							game:GetService("TweenService"):Create(text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(120,120,120)}):Play()
							game:GetService("TweenService"):Create(dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
							game:GetService("TweenService"):Create(text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,4,0,0)}):Play()

							Library.Flags[Dropdown.Flag] = Chosen
							Dropdown.Callback(Chosen)
						else
							if #Chosen == Dropdown.Max then
								Dropdown.OptionInsts[Chosen[1]].text.Visible = false
								table.remove(Chosen, 1)
							end

							table.insert(Chosen, option)

							local textchosen = {}
							local cutobject = false

							for _, opt in next, Chosen do
								table.insert(textchosen, opt)
							end

							DropdownTitle_2.Text = #Chosen == 0 and "" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")
							game:GetService("TweenService"):Create(text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200,200,200)}):Play()
							game:GetService("TweenService"):Create(dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
							game:GetService("TweenService"):Create(text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,20,0,0)}):Play()

							Library.Flags[Dropdown.Flag] = Chosen
							Dropdown.Callback(Chosen)
						end
					else
						for opt, tbl in next, Dropdown.OptionInsts do
							if opt ~= option then
								game:GetService("TweenService"):Create(tbl.text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(120,120,120)}):Play()
								game:GetService("TweenService"):Create(tbl.text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,4,0,0)}):Play()
								game:GetService("TweenService"):Create(tbl.dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
							end
						end
						Chosen = option
						DropdownTitle_2.Text = option
						game:GetService("TweenService"):Create(text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200,200,200)}):Play()
						game:GetService("TweenService"):Create(dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
						game:GetService("TweenService"):Create(text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,20,0,0)}):Play()
						Library.Flags[Dropdown.Flag] = option
						Dropdown.Callback(option)
					end
				end)
			end
			--
			local function createoptions(tbl)
				for _, option in next, tbl do
					Dropdown.OptionInsts[option] = {}
					local TextButton = Instance.new('TextButton', ToggleContent)
					local DropdownTitle3 = Instance.new('TextLabel', TextButton)
					local AccentDot = Instance.new('Frame', TextButton)
					local OptionCorner = Instance.new('UICorner', AccentDot)
					--
					TextButton.Size = UDim2.new(1,0,0,22)
					TextButton.BackgroundColor3 = Color3.new(1,1,1)
					TextButton.BackgroundTransparency = 1
					TextButton.BorderSizePixel = 0
					TextButton.BorderColor3 = Color3.new(0,0,0)
					TextButton.Text = ""
					TextButton.TextColor3 = Color3.new(0,0,0)
					TextButton.AutoButtonColor = false
					TextButton.Font = Enum.Font.SourceSans
					TextButton.TextSize = 14
					Dropdown.OptionInsts[option].button = TextButton
					--
					DropdownTitle3.Name = "DropdownTitle"
					DropdownTitle3.Position = UDim2.new(0,20,0,0)
					DropdownTitle3.Size = UDim2.new(1,-10,1,0)
					DropdownTitle3.BackgroundColor3 = Color3.new(1,1,1)
					DropdownTitle3.BackgroundTransparency = 1
					DropdownTitle3.BorderSizePixel = 0
					DropdownTitle3.BorderColor3 = Color3.new(0,0,0)
					DropdownTitle3.Text = option
					DropdownTitle3.TextColor3 = Color3.fromRGB(120,120,120)
					DropdownTitle3.Font = Enum.Font.Gotham
					DropdownTitle3.TextSize = Library.FontSize
					DropdownTitle3.TextXAlignment = Enum.TextXAlignment.Left
					Dropdown.OptionInsts[option].text = DropdownTitle3
					--
					AccentDot.Name = "AccentDot"
					AccentDot.Position = UDim2.new(0,8,0,8)
					AccentDot.Size = UDim2.new(0,6,0,6)
					AccentDot.BackgroundColor3 = Library.Accent
					AccentDot.BorderSizePixel = 0
					AccentDot.BorderColor3 = Color3.new(0,0,0)
					table.insert(Library.ThemeObjects, AccentDot)
					Dropdown.OptionInsts[option].dot = AccentDot
					--
					OptionCorner.CornerRadius = UDim.new(1,0)
					Count += 1

					handleoptionclick(option, TextButton, DropdownTitle3, AccentDot)
				end
			end
			createoptions(Dropdown.Options)
			--
			local set
			set = function(option)
				if Dropdown.Max then
					table.clear(Chosen)
					option = type(option) == "table" and option or {}

					for opt, tbl in next, Dropdown.OptionInsts do
						if not table.find(option, opt) then
							game:GetService("TweenService"):Create(tbl.text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(120,120,120)}):Play()
							game:GetService("TweenService"):Create(tbl.text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,4,0,0)}):Play()
							game:GetService("TweenService"):Create(tbl.dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
						end
					end

					for i, opt in next, option do
						if table.find(Dropdown.Options, opt) and #Chosen < Dropdown.Max then
							table.insert(Chosen, opt)
							game:GetService("TweenService"):Create(Dropdown.OptionInsts[opt].text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200,200,200)}):Play()
							game:GetService("TweenService"):Create(Dropdown.OptionInsts[opt].dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
							game:GetService("TweenService"):Create(Dropdown.OptionInsts[opt].text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,20,0,0)}):Play()
						end
					end

					local textchosen = {}
					local cutobject = false

					for _, opt in next, Chosen do
						table.insert(textchosen, opt)
					end

					DropdownTitle_2.Text = #Chosen == 0 and "" or table.concat(textchosen, ", ") .. (cutobject and ", ..." or "")

					Library.Flags[Dropdown.Flag] = Chosen
					Dropdown.Callback(Chosen)
				end
			end
			--
			function Dropdown:Set(option)
				if Dropdown.Max then
					set(option)
				else
					for opt, tbl in next, Dropdown.OptionInsts do
						if opt ~= option then
							game:GetService("TweenService"):Create(tbl.text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(120,120,120)}):Play()
							game:GetService("TweenService"):Create(tbl.text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,4,0,0)}):Play()
							game:GetService("TweenService"):Create(tbl.dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
						end
					end
					if table.find(Dropdown.Options, option) then
						Chosen = option
						DropdownTitle_2.Text = option
						game:GetService("TweenService"):Create(Dropdown.OptionInsts[option].text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200,200,200)}):Play()
						game:GetService("TweenService"):Create(Dropdown.OptionInsts[option].dot, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
						game:GetService("TweenService"):Create(Dropdown.OptionInsts[option].text, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0,20,0,0)}):Play()
						Library.Flags[Dropdown.Flag] = Chosen
						Dropdown.Callback(Chosen)
					else
						Chosen = nil
						DropdownTitle_2.Text = ""
						Library.Flags[Dropdown.Flag] = Chosen
						Dropdown.Callback(Chosen)
					end
				end
			end
			--
			function Dropdown:Refresh(tbl)
				Count = 0
				for _, opt in next, Dropdown.OptionInsts do
					coroutine.wrap(function()
						opt.button:Destroy()
					end)()
				end
				table.clear(Dropdown.OptionInsts)

				createoptions(tbl)
				Chosen = nil

				Library.Flags[Dropdown.Flag] = Chosen
				Dropdown.Callback(Chosen)
			end


			-- // Returning
			if Dropdown.Max then
				Flags[Dropdown.Flag] = set
			else
				Flags[Dropdown.Flag] = Dropdown
			end
			Dropdown:Set(Dropdown.State)
			return Dropdown
		end
		--
		function Sections:Colorpicker(Properties)
			local Properties = Properties or {}
			local Colorpicker = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = (Properties.Name or "Colorpicker"),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or Color3.fromRGB(255, 0, 0)
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				Colorpickers = 0,
			}
			--
			local NewColor = Instance.new("TextButton")
			NewColor.Name = "NewColor"
			NewColor.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
			NewColor.Text = ""
			NewColor.TextColor3 = Color3.fromRGB(0, 0, 0)
			NewColor.TextSize = 14
			NewColor.AutoButtonColor = false
			NewColor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NewColor.BackgroundTransparency = 1
			NewColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NewColor.BorderSizePixel = 0
			NewColor.Size = UDim2.new(1, 0, 0, 17)
			NewColor.ZIndex = 54
			NewColor.Parent = Colorpicker.Section.Elements.SectionContent

			local ToggleTitle = Instance.new("TextLabel")
			ToggleTitle.Name = "ToggleTitle"
			ToggleTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
			ToggleTitle.Text = Colorpicker.Name
			ToggleTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
			ToggleTitle.TextSize = 13
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
			ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.BackgroundTransparency = 1
			ToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleTitle.BorderSizePixel = 0
			ToggleTitle.Size = UDim2.new(1, -10, 0, 17)
			ToggleTitle.Parent = NewColor

			-- // Functions
			Colorpicker.Colorpickers = Colorpicker.Colorpickers + 1
			local colorpickertypes = Library:NewPicker(
				Colorpicker.Name,
				Colorpicker.State,
				NewColor,
				Colorpicker.Colorpickers,
				Colorpicker.Flag,
				Colorpicker.Callback
			)

			function Colorpicker:Set(color)
				colorpickertypes:Set(color, false, true)
			end

			function Colorpicker:Colorpicker(Properties)
				local Properties = Properties or {}
				local NewColorpicker = {
					State = (
						Properties.state
							or Properties.State
							or Properties.def
							or Properties.Def
							or Properties.default
							or Properties.Default
							or Color3.fromRGB(255, 0, 0)
					),
					Callback = (
						Properties.callback
							or Properties.Callback
							or Properties.callBack
							or Properties.CallBack
							or function() end
					),
					Flag = (
						Properties.flag
							or Properties.Flag
							or Properties.pointer
							or Properties.Pointer
							or Library.NextFlag()
					),
				}
				-- // Functions
				Colorpicker.Colorpickers = Colorpicker.Colorpickers + 1
				local Newcolorpickertypes = Library:NewPicker(
					"",
					NewColorpicker.State,
					NewColor,
					Colorpicker.Colorpickers,
					NewColorpicker.Flag,
					NewColorpicker.Callback
				)

				function NewColorpicker:Set(color)
					Newcolorpickertypes:Set(color)
				end

				-- // Returning
				return NewColorpicker
			end

			-- // Returning
			return Colorpicker
		end
		--
		function Sections:Keybind(Properties)
			local Properties = Properties or {}
			local Keybind = {
				Section = self,
				Name = Properties.name or Properties.Name or "Keybind",
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or Enum.KeyCode.E
				),
				Mode = (Properties.mode or Properties.Mode or "Toggle"),
				UseKey = (Properties.UseKey or false),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
				Binding = nil,
			}
			local Key
			local State = false
			--
			local NewKey = Instance.new("TextButton")
			NewKey.Name = "NewKey"
			NewKey.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
			NewKey.Text = ""
			NewKey.TextColor3 = Color3.fromRGB(0, 0, 0)
			NewKey.TextSize = 14
			NewKey.AutoButtonColor = false
			NewKey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NewKey.BackgroundTransparency = 1
			NewKey.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NewKey.BorderSizePixel = 0
			NewKey.Size = UDim2.new(1, 0, 0, 17)
			NewKey.ZIndex = 54
			NewKey.Parent = Keybind.Section.Elements.SectionContent

			local ToggleTitle = Instance.new("TextLabel")
			ToggleTitle.Name = "ToggleTitle"
			ToggleTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
			ToggleTitle.Text = Keybind.Name
			ToggleTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
			ToggleTitle.TextSize = 13
			ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
			ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleTitle.BackgroundTransparency = 1
			ToggleTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleTitle.BorderSizePixel = 0
			ToggleTitle.Size = UDim2.new(1, -10, 0, 17)
			ToggleTitle.Parent = NewKey

			local KeyText = Instance.new("TextLabel")
			KeyText.Name = "KeyText"
			KeyText.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
			KeyText.Text = "None"
			KeyText.TextColor3 = Color3.fromRGB(200, 200, 200)
			KeyText.TextSize = 13
			KeyText.TextXAlignment = Enum.TextXAlignment.Right
			KeyText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			KeyText.BackgroundTransparency = 1
			KeyText.BorderColor3 = Color3.fromRGB(0, 0, 0)
			KeyText.BorderSizePixel = 0
			KeyText.Position = UDim2.new(1, -180, 0, 0)
			KeyText.Size = UDim2.new(1, -10, 0, 17)
			KeyText.Parent = NewKey

			-- // Functions
			local function set(newkey)
				if string.find(tostring(newkey), "Enum") then
					if c then
						c:Disconnect()
						if Keybind.Flag then
							Library.Flags[Keybind.Flag] = false
						end
						Keybind.Callback(false)
					end
					if tostring(newkey):find("Enum.KeyCode.") then
						newkey = Enum.KeyCode[tostring(newkey):gsub("Enum.KeyCode.", "")]
					elseif tostring(newkey):find("Enum.UserInputType.") then
						newkey = Enum.UserInputType[tostring(newkey):gsub("Enum.UserInputType.", "")]
					end
					if newkey == Enum.KeyCode.Backspace then
						Key = nil
						if Keybind.UseKey then
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = Key
							end
							Keybind.Callback(Key)
						end
						local text = "None"

						KeyText.Text = text
					elseif newkey ~= nil then
						Key = newkey
						if Keybind.UseKey then
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = Key
							end
							Keybind.Callback(Key)
						end
						local text = (Library.Keys[newkey] or tostring(newkey):gsub("Enum.KeyCode.", ""))

						KeyText.Text = text
					end

					Library.Flags[Keybind.Flag .. "_KEY"] = newkey
				elseif table.find({ "Always", "Toggle", "Hold" }, newkey) then
					if not Keybind.UseKey then
						Library.Flags[Keybind.Flag .. "_KEY STATE"] = newkey
						Keybind.Mode = newkey
						if Keybind.Mode == "Always" then
							State = true
							if Keybind.Flag then
								Library.Flags[Keybind.Flag] = State
							end
							Keybind.Callback(true)
						end
					end
				else
					State = newkey
					if Keybind.Flag then
						Library.Flags[Keybind.Flag] = newkey
					end
					Keybind.Callback(newkey)
				end
			end
			--
			set(Keybind.State)
			set(Keybind.Mode)
			NewKey.MouseButton1Click:Connect(function()
				if not Keybind.Binding then

					KeyText.Text = "..."
					TweenService:Create(KeyText, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()


					Keybind.Binding = Library:Connection(
						game:GetService("UserInputService").InputBegan,
						function(input, gpe)
							if gpe then return end; 
							if input.UserInputType == Enum.UserInputType.Touch then return end;


							set(
								input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode
									or input.UserInputType
							)
							Library:Disconnect(Keybind.Binding)
							task.wait()
							Keybind.Binding = nil
							TweenService:Create(KeyText, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200)}):Play()
						end
					)
				end
			end)
			--
			Library:Connection(game:GetService("UserInputService").InputBegan, function(inp, gpe)
				if (gpe) then return end;

				if (inp.KeyCode == Key or inp.UserInputType == Key) and not Keybind.Binding and not Keybind.UseKey then
					if Keybind.Mode == "Hold" then
						if Keybind.Flag then
							Library.Flags[Keybind.Flag] = true
						end
						c = Library:Connection(game:GetService("RunService").RenderStepped, function()
							if Keybind.Callback then
								Keybind.Callback(true)
							end
						end)
					elseif Keybind.Mode == "Toggle" then
						State = not State
						if Keybind.Flag then
							Library.Flags[Keybind.Flag] = State
						end
						Keybind.Callback(State)
					end
				end
			end)
			--
			Library:Connection(game:GetService("UserInputService").InputEnded, function(inp, gpe)
				if gpe then return end;

				if Keybind.Mode == "Hold" and not Keybind.UseKey then
					if Key ~= "" or Key ~= nil then
						if inp.KeyCode == Key or inp.UserInputType == Key then
							if c then
								c:Disconnect()
								if Keybind.Flag then
									Library.Flags[Keybind.Flag] = false
								end
								if Keybind.Callback then
									Keybind.Callback(false)
								end
							end
						end
					end
				end
			end)
			--
			Library.Flags[Keybind.Flag .. "_KEY"] = Keybind.State
			Library.Flags[Keybind.Flag .. "_KEY STATE"] = Keybind.Mode
			Flags[Keybind.Flag] = set
			Flags[Keybind.Flag .. "_KEY"] = set
			Flags[Keybind.Flag .. "_KEY STATE"] = set
			--
			function Keybind:Set(key)
				set(key)
			end

			-- // Returning
			return Keybind
		end
		--
		function Sections:Textbox(Properties)
			local Properties = Properties or {}
			local Textbox = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Placeholder = (
					Properties.placeholder
						or Properties.Placeholder
						or Properties.holder
						or Properties.Holder
						or "Enter your text here"
				),
				State = (
					Properties.state
						or Properties.State
						or Properties.def
						or Properties.Def
						or Properties.default
						or Properties.Default
						or ""
				),
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
				Flag = (
					Properties.flag
						or Properties.Flag
						or Properties.pointer
						or Properties.Pointer
						or Library.NextFlag()
				),
			}
			--
			local NewBox = Instance.new("Frame")
			NewBox.Name = "NewBox"
			NewBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NewBox.BackgroundTransparency = 1
			NewBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NewBox.BorderSizePixel = 0
			NewBox.Size = UDim2.new(1, 0, 0, 24)
			NewBox.ZIndex = 54
			NewBox.Parent = Textbox.Section.Elements.SectionContent

			local ToggleFrame = Instance.new("Frame")
			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
			ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.Position = UDim2.new(0, 0, 1, -24)
			ToggleFrame.Size = UDim2.new(1, 0, 0, 24)
			ToggleFrame.ZIndex = 55

			local UICorner2 = Instance.new("UICorner")
			UICorner2.Name = "UICorner_2"
			UICorner2.CornerRadius = UDim.new(0, 4)
			UICorner2.Parent = ToggleFrame

			local DropdownTitle = Instance.new("TextBox")
			DropdownTitle.Name = "DropdownTitle"
			DropdownTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
			DropdownTitle.Text = Textbox.State
			DropdownTitle.PlaceholderText = Textbox.Placeholder
			DropdownTitle.PlaceholderColor3 = Color3.fromRGB(145,145,145)
			DropdownTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
			DropdownTitle.TextSize = 13
			DropdownTitle.ClearTextOnFocus = false
			DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
			DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.BackgroundTransparency = 1
			DropdownTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownTitle.BorderSizePixel = 0
			DropdownTitle.Position = UDim2.fromOffset(4, 0)
			DropdownTitle.Size = UDim2.new(1, -10, 1, 0)
			DropdownTitle.ZIndex = 53
			DropdownTitle.Parent = ToggleFrame
			DropdownTitle.TextTruncate = Enum.TextTruncate.SplitWord

			ToggleFrame.Parent = NewBox
			--
			DropdownTitle.FocusLost:Connect(function()
				Textbox.Callback(DropdownTitle.Text)
				Library.Flags[Textbox.Flag] = DropdownTitle.Text
			end)
			--
			local function set(str)
				DropdownTitle.Text = str
				Library.Flags[Textbox.Flag] = str
				Textbox.Callback(str)
			end
			-- // Return
			Flags[Textbox.Flag] = set
			Library.Flags[Textbox.Flag] = DropdownTitle.Text
			return Textbox
		end
		--
		function Sections:Button(Properties)
			local Properties = Properties or {}
			local Button = {
				Window = self.Window,
				Page = self.Page,
				Section = self,
				Name = Properties.Name or "button",
				Callback = (
					Properties.callback
						or Properties.Callback
						or Properties.callBack
						or Properties.CallBack
						or function() end
				),
			}
			--
			local NewButton = Instance.new("TextButton")
			NewButton.Name = "NewButton"
			NewButton.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
			NewButton.Text = ""
			NewButton.TextColor3 = Color3.fromRGB(0, 0, 0)
			NewButton.TextSize = 14
			NewButton.AutoButtonColor = false
			NewButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NewButton.BackgroundTransparency = 1
			NewButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
			NewButton.BorderSizePixel = 0
			NewButton.Size = UDim2.new(1, 0, 0, 24)
			NewButton.ZIndex = 54
			NewButton.Parent = Button.Section.Elements.SectionContent

			local ToggleFrame = Instance.new("Frame")
			ToggleFrame.Name = "ToggleFrame"
			ToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			ToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
			ToggleFrame.BorderSizePixel = 0
			ToggleFrame.Position = UDim2.new(0, 0, 1, -24)
			ToggleFrame.Size = UDim2.new(1, 0, 0, 24)
			ToggleFrame.ZIndex = 55

			local UICorner2 = Instance.new("UICorner")
			UICorner2.Name = "UICorner_2"
			UICorner2.CornerRadius = UDim.new(0, 4)
			UICorner2.Parent = ToggleFrame

			local DropdownTitle = Instance.new("TextLabel")
			DropdownTitle.Name = "DropdownTitle"
			DropdownTitle.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
			DropdownTitle.Text = Button.Name
			DropdownTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
			DropdownTitle.TextSize = 13
			DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			DropdownTitle.BackgroundTransparency = 1
			DropdownTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
			DropdownTitle.BorderSizePixel = 0
			DropdownTitle.Size = UDim2.fromScale(1, 1)
			DropdownTitle.ZIndex = 53
			DropdownTitle.Parent = ToggleFrame

			ToggleFrame.Parent = NewButton
			--
			Library:Connection(NewButton.MouseButton1Down, function()
				Button.Callback()
				TweenService:Create(DropdownTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255,255,255)}):Play()
				task.spawn(function()
					task.wait(0.1)
					TweenService:Create(DropdownTitle, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200,200,200)}):Play()
				end)
			end)
		end
		--
		function Library:Watermark(Properties)
			local Watermark = {
				Name = (Properties.Name or Properties.name or "Starhook.club | placeholder");
				AnimateText = nil;
			}
			--
			local Outline = Instance.new("Frame")
			Outline.Name = "Outline"
			Outline.AnchorPoint = Vector2.new(1, 0)
			Outline.AutomaticSize = Enum.AutomaticSize.X
			Outline.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
			Outline.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Outline.Position = UDim2.new(1, -10, 0, 10)
			Outline.Size = UDim2.fromOffset(100, 20)
			Outline.Visible = false
			Outline.ZIndex = 50
			Outline.Parent = Library.ScreenGUI

			local UICorner = Instance.new("UICorner")
			UICorner.Name = "UICorner"
			UICorner.CornerRadius = UDim.new(0, 4)
			UICorner.Parent = Outline

			local UIStroke = Instance.new("UIStroke")
			UIStroke.Name = "UIStroke"
			UIStroke.Parent = Outline

			local Inline = Instance.new("Frame")
			Inline.Name = "Inline"
			Inline.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
			Inline.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Inline.BorderSizePixel = 0
			Inline.Position = UDim2.fromOffset(1, 1)
			Inline.Size = UDim2.new(1, -2, 1, -2)
			Inline.ZIndex = 51

			local UICorner2 = Instance.new("UICorner")
			UICorner2.Name = "UICorner_2"
			UICorner2.CornerRadius = UDim.new(0, 4)
			UICorner2.Parent = Inline

			local Title = Instance.new("TextLabel")
			Title.Name = "Title"
			Title.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json")
			Title.RichText = true
			Title.Text = Watermark.Name
			Title.TextColor3 = Color3.fromRGB(255, 255, 255)
			Title.TextSize = 13
			Title.TextXAlignment = Enum.TextXAlignment.Left
			Title.AutomaticSize = Enum.AutomaticSize.X
			Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Title.BackgroundTransparency = 1
			Title.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Title.BorderSizePixel = 0
			Title.Position = UDim2.fromOffset(5, 0)
			Title.Size = UDim2.fromScale(0, 1)
			Title.Parent = Inline

			local UIPadding = Instance.new("UIPadding")
			UIPadding.Name = "UIPadding"
			UIPadding.PaddingRight = UDim.new(0, 6)
			UIPadding.Parent = Inline

			Inline.Parent = Outline


			task.spawn(function()
				while task.wait() do
					for i = 1, #"Starhook.club" do
						Watermark.AnimateText = string.sub("Starhook.club", 1, i) .. "";
						Title.Text = Watermark.AnimateText .. " " .. Watermark.Name;
						task.wait(0.4);
					end;

					for i = #"Starhook.club" - 1, 1, -1 do
						Watermark.AnimateText = string.sub("Starhook.club", 1, i) .. "";
						Title.Text = Watermark.AnimateText .. " " .. Watermark.Name;
						task.wait(0.4);
					end;
				end;
			end)
			-- // Functions
			function Watermark:UpdateText(NewText)
				Watermark.Name = NewText
				Title.Text = Watermark.AnimateText .. " " .. Watermark.Name;
			end;
			function Watermark:SetVisible(State)
				Outline.Visible = State;
			end;

			return Watermark
		end
		--
	end
end

local library = Library;
local flags = Library.Flags;

--[[
    SOURCE FULLY MADE BY LINEMASTER
]]

--// Luraph Macros (https://lura.ph/dashboard/documents/macros)
getfenv().LPH_NO_VIRTUALIZE = function(...) return ... end;

--// window locals
local default_color = Color3.fromRGB(207, 227, 0);

--// services
local players = game:GetService("Players");
local workspace = game:GetService("Workspace");
local user_input_service = game:GetService("UserInputService");
local run_service = game:GetService("RunService");
local replicated_storage = game:GetService("ReplicatedStorage");
local http_service = game:GetService("HttpService");
local tween_service = game:GetService("TweenService");
local stats = game:GetService("Stats");
local lighting = game:GetService("Lighting");
local core_gui = cloneref(game:GetService("CoreGui"));

--// libraries
--// local library, flags = loadstring(game:HttpGet("https://gist.githubusercontent.com/linemaster2/c6ba71bcb486990e5ea34ba9b7be6db6/raw/c95ba2fcd4d2b3a3ce62bdb429c75c8e696579f8/sadiuohfgasduo9fhasdu8ihfgasd98u7asasdf.lua"))();
--- Lua-side duplication of the API of events on Roblox objects.
-- signals are needed for to ensure that for local events objects are passed by
-- reference rather than by value where possible, as the BindableEvent objects
-- always pass signal arguments by value, meaning tables will be deep copied.
-- Roblox's deep copy method parses to a non-lua table compatable format.
-- @classmod signal

local HttpService = game:GetService("HttpService")

local ENABLE_TRACEBACK = false

local signal = {}
signal.__index = signal
signal.ClassName = "signal"

--- Constructs a new signal.
-- @constructor signal.new()
-- @treturn signal
function signal.new()
	local self = setmetatable({}, signal)

	self._bindableEvent = Instance.new("BindableEvent")
	self._argMap = {}
	self._source = ENABLE_TRACEBACK and debug.traceback() or ""

	-- Events in Roblox execute in reverse order as they are stored in a linked list and
	-- new connections are added at the head. This event will be at the tail of the list to
	-- clean up memory.
	self._bindableEvent.Event:Connect(function(key)
		self._argMap[key] = nil

		-- We've been destroyed here and there's nothing left in flight.
		-- Let's remove the argmap too.
		-- This code may be slower than leaving this table allocated.
		if (not self._bindableEvent) and (not next(self._argMap)) then
			self._argMap = nil
		end
	end)

	return self
end

--- Fire the event with the given arguments. All handlers will be invoked. Handlers follow
-- Roblox signal conventions.
-- @param ... Variable arguments to pass to handler
-- @treturn nil
function signal:Fire(...)
	if not self._bindableEvent then
		warn(("signal is already destroyed. %s"):format(self._source))
		return
	end

	local args = table.pack(...)

	-- TODO: Replace with a less memory/computationally expensive key generation scheme
	local key = HttpService:GenerateGUID(false)
	self._argMap[key] = args

	-- Queues each handler onto the queue.
	self._bindableEvent:Fire(key)
end

--- Connect a new handler to the event. Returns a connection object that can be disconnected.
-- @tparam function handler Function handler called with arguments passed when `:Fire(...)` is called
-- @treturn Connection Connection object that can be disconnected
function signal:Connect(handler)
	if not (type(handler) == "function") then
		error(("connect(%s)"):format(typeof(handler)), 2)
	end

	return self._bindableEvent.Event:Connect(function(key)
		-- note we could queue multiple events here, but we'll do this just as Roblox events expect
		-- to behave.

		local args = self._argMap[key]
		if args then
			handler(table.unpack(args, 1, args.n))
		else
			error("Missing arg data, probably due to reentrance.")
		end
	end)
end

--- Wait for fire to be called, and return the arguments it was given.
-- @treturn ... Variable arguments from connection
function signal:Wait()
	local key = self._bindableEvent.Event:Wait()
	local args = self._argMap[key]
	if args then
		return table.unpack(args, 1, args.n)
	else
		error("Missing arg data, probably due to reentrance.")
		return nil
	end
end

--- Disconnects all connected events to the signal. Voids the signal as unusable.
-- @treturn nil
function signal:Destroy()
	if self._bindableEvent then
		-- This should disconnect all events, but in-flight events should still be
		-- executed.

		self._bindableEvent:Destroy()
		self._bindableEvent = nil
	end

	-- Do not remove the argmap. It will be cleaned up by the cleanup connection.

	setmetatable(self, nil)
end

--// get the mouse arg
local real_dh_arg;

local dahood_ids = {2788229376, 16033173781, 7213786345}
local bullet_tp_connection;

--// hit sounds

local hitsounds = {
    ["RIFK7"] = "rbxassetid://9102080552",
    ["Bubble"] = "rbxassetid://9102092728",
    ["Minecraft"] = "rbxassetid://5869422451",
    ["Cod"] = "rbxassetid://160432334",
    ["Bameware"] = "rbxassetid://6565367558",
    ["Neverlose"] = "rbxassetid://6565370984",
    ["Gamesense"] = "rbxassetid://4817809188",
    ["Rust"] = "rbxassetid://6565371338"
};

if (not (isfolder("starhook"))) then
	makefolder("starhook");
end;

--// game support
local game_support = {
    [2788229376] = {
        Number = 1,
        Name = "Da Hood",
        Remote = "MainEvent",
        Argument = real_dh_arg or "UpdateMousePosI",
        BulletName = "BULLET_RAYS",
        BulletBeamName = "GunBeam",
        BulletPath = workspace:FindFirstChild("Ignored") and workspace.Ignored:FindFirstChild("Siren") and workspace.Ignored.Siren:FindFirstChild("Radius") or nil
    },
    [12238627497] = {
        Number = 2,
        Name = "Locker Hood",
        Remote = "MainEvent",
        Argument = "UpdateMousePos",
        BulletName = "BULLET_RAYS",
        BulletBeamName = "GunBeam",
        BulletPath = workspace:FindFirstChild("Ignored") or nil
    },
    [5602055394] = {
        Number = 3,
        Name = "Hood Modded",
        Remote = "MAINEVENT",
        Argument = "MousePos",
        BulletName = "BULLET_RAYS",
        BulletBeamName = "GunBeam",
        BulletPath = workspace:FindFirstChild("Ignored") or nil
    },
    [17403265390] = {
        Number = 4,
        Name = "Da Downhill",
        Remote = "MAINEVENT",
        Argument = "MOUSE",
        BulletName = "Part",
        BulletBeamName = "gb",
        BulletPath = workspace
    },
    [17403166075] = {
        Number = 5,
        Name = "Da Bank",
        Remote = "MAINEVENT",
        Argument = "MOUSE",
        BulletName = "Part",
        BulletBeamName = "gb",
        BulletPath = workspace
    },
    [18111448661] = {
        Number = 6,
        Name = "Da Uphill",
        Remote = "MAINEVENT",
        Argument = "MOUSE",
        BulletName = "Part",
        BulletBeamName = "gb",
        BulletPath = workspace
    },
    [15186202290] = {
        Number = 7,
        Name = "Da Strike",
        Remote = "MAINEVENT",
        Argument = "MOUSE",
        BulletName = "Part",
        BulletBeamName = "gb",
        BulletPath = workspace
    },
    [11143225577] = {
        Number = 8,
        Name = "1v1 Hood Aim Trainer",
        Remote = "MAINEVENT",
        Argument = "UpdateMousePos"
    },
    [15763494605] = {
        Number = 9,
        Name = "Hood Aim",
        Remote = "MAINEVENT",
        Argument = "MOUSE"
    },
    [15166543806] = {
        Number = 10,
        Name = "Moon Hood",
        Remote = "MAINEVENT",
        Argument = "MoonUpdateMousePos"
    },
    [17897702920] = {
        Number = 11,
        Name = "OG Da Hood",
        Remote = "MainEvent",
        Argument = "UpdateMousePos",
        Adonis = true
    },
    [16033173781] = {
        Number = 12,
        Name = "Da Hood Macro",
        Remote = "MainEvent",
        Argument = "UpdateMousePos1"
    },
    [7213786345] = {
        Number = 13,
        Name = "Da Hood VC",
        Remote = "MainEvent",
        Argument = real_dh_arg or "UpdateMousePosI",
        BulletName = "BULLET_RAYS",
        BulletBeamName = "GunBeam",
        BulletPath = workspace:FindFirstChild("Ignored") and workspace.Ignored:FindFirstChild("Siren") and workspace.Ignored.Siren:FindFirstChild("Radius") or nil
	},
	[16033173781] = {
		Number = 14,
        Name = "Da Hood Macro",
        Remote = "MainEvent",
        Argument = real_dh_arg or "UpdateMousePosI",
        BulletName = "BULLET_RAYS",
        BulletBeamName = "GunBeam",
        BulletPath = workspace:FindFirstChild("Ignored") and workspace.Ignored:FindFirstChild("Siren") and workspace.Ignored.Siren:FindFirstChild("Radius") or nil
	},
	[9825515356] = {
		Number = 15,
        Name = "Hood Customs",
        Remote = "MainEvent",
        Argument = real_dh_arg or "MousePosUpdate",
        BulletName = "BULLET_RAYS",
        BulletBeamName = "GunBeam",
        BulletPath = workspace:FindFirstChild("Ignored") or nil
	},
	[16859411452] = {
        Number = 16,
        Name = "Hood Z",
        Remote = "MainEvent",
        Argument = "UpdateMousePos",
        BulletName = "bulletray",
        BulletBeamName = "beam",
        BulletPath = workspace:FindFirstChild("Ignored") or nil
	},
	[14277620939] = {
        Number = 17,
        Name = "Custom FFA",
        Remote = "MainEvent",
        Argument = "UpdateMousePos",
        BulletName = "BULLET_RAYS",
        BulletBeamName = "GunBeam",
        BulletPath = workspace:FindFirstChild("Ignored") or nil
    },
}; --// Credits to farzad

--// custom game support
local remote_name = game_support[game.PlaceId] and game_support[game.PlaceId].Remote or nil;
local mouse_argument = game_support[game.PlaceId] and game_support[game.PlaceId].Argument or nil;
local bullet_beam_name = game_support[game.PlaceId] and game_support[game.PlaceId].BulletBeamName or nil;
local bullet_name = game_support[game.PlaceId] and game_support[game.PlaceId].BulletName or nil;
local bullet_path = game_support[game.PlaceId] and game_support[game.PlaceId].BulletPath or nil;

local remote = replicated_storage[remote_name];

local hood_customs = 9825515356;

--// world
local world = {
	FogColor = lighting.FogColor,
	FogStart = lighting.FogStart,
	FogEnd = lighting.FogEnd,
	Ambient = lighting.Ambient,
	Brightness = lighting.Brightness,
	ClockTime = lighting.ClockTime,
	ExposureCompensation = lighting.ExposureCompensation,
	ColorShift_Top = lighting.ColorShift_Top,
	ColorShift_Bottom = lighting.ColorShift_Bottom
};

--// instances
local local_player = players.LocalPlayer;
--// local chat_remote = replicated_storage:FindFirstChild("DefaultChatSystemChatEvents") and replicated_storage.DefaultChatSystemChatEvents.SayMessageRequest or nil;
local camera = workspace.CurrentCamera;

--// script table
local locals = {
	network_should_sleep = false,
	original_position = CFrame.new(1, 1, 1),
	should_starhook_destroy = false,
	old_ticks = {
		assist_stutter_tick = tick(),
		clone_chams_tick = tick(),
		auto_shoot_tick = tick(),
		network_desync_tick = tick()
	},
	assist = {
		is_targetting = false,
		target = nil,
	},
	target_aim = {
		predicted_position = Vector3.new(1, 1, 1),
		is_targetting = false,
		target = nil
	},
	silent_aim = {
		predicted_position = Vector3.new(1, 1, 1),
		is_targetting = false,
		target = nil
	},
	gun = {
		current_tool = nil,
		current_tool_bullet_tp = nil,
		recently_shot = false,
		recently_hit = false,
		previous_ammo = 0,
		previous_ammo_bullet_tp = 0
	}
};

local drawings = {};
local signals = {};
local instances = {
	target_ui = {}
};
local blood_splatters = {};
local ui = {
	window = nil,
	tabs = {}
}

local connections = {
	gun = {}
};

--// addon library
local script_addon = {
    events = {}
};

--// screengui
local screen_gui = Instance.new("ScreenGui");
screen_gui.Name = "https://starhook.club";
screen_gui.IgnoreGuiInset = true;
screen_gui.DisplayOrder = 99999;
screen_gui.ResetOnSpawn = false;
screen_gui.Enabled = false;
screen_gui.Parent = core_gui;

local screen_gui_2 = Instance.new("ScreenGui");
screen_gui_2.Name = "https://starhook.club";
screen_gui_2.IgnoreGuiInset = true;
screen_gui_2.DisplayOrder = 99999;
screen_gui_2.ResetOnSpawn = false;
screen_gui_2.Enabled = false;
screen_gui_2.Parent = core_gui;

--// old fflags
local old_psr;
local old_pssmbs;
--// "S2PhysicsSenderRate", "PhysicsSenderMaxBandwidthBps", "DataSenderMaxJoinBandwidthBps"

if (getfflag) then
	local old = getfflag;

	getfflag = function(fflag)
		local success, result = pcall(function()
			return old(fflag);
		end);

		return result;
	end;

	old_psr = getfflag("S2PhysicsSenderRate");
	old_pssmbs = getfflag("PhysicsSenderMaxBandwidthBps");
end;

--// utility
local utility = {}; do
	utility.get_xmr_price = LPH_NO_VIRTUALIZE(function()
		local data = game:HttpGet("https://api.coincap.io/v2/assets/monero");
		local table_data = http_service:JSONDecode(data);

		return math.floor(table_data.priceUsd) or 0;
	end);

	utility.world_to_screen = LPH_NO_VIRTUALIZE(function(position)
		local position, on_screen = camera:WorldToViewportPoint(position);

		return {position = Vector2.new(position.X, position.Y), on_screen = on_screen};
	end);

	utility.get_ping = LPH_NO_VIRTUALIZE(function()
		return stats.Network.ServerStatsItem["Data Ping"]:GetValue();
	end);

	utility.has_character = LPH_NO_VIRTUALIZE(function(player)
		return (player and player.Character and player.Character:FindFirstChild("Humanoid")) and true or false;
	end);

	utility.new_connection = function(type, callback) --// by all matters do NOT no virtualize this
		local connection = type:Connect(callback);

		table.insert(connections, connection);

		return connection;
	end;

	utility.create_connection = function(signal_name) --// by all matters do NOT no virtualize this
		local connection = signal.new(signal_name);
		return connection;
	end;

	utility.is_in_air = LPH_NO_VIRTUALIZE(function(player)
		if (not (utility.has_character(player))) then return false end;

		local root_part = player.Character.HumanoidRootPart;

		return root_part.Velocity.Y ~= 0; --// my old one was so fucking broken and weird so ill js use velocity check
	end);

	utility.is_friends_with = LPH_NO_VIRTUALIZE(function(player)
		return player:IsFriendsWith(local_player.UserId) and true or false;
	end);

	utility.is_player_behind_a_wall = LPH_NO_VIRTUALIZE(function(player)
		local amount = camera:GetPartsObscuringTarget({local_player.Character.HumanoidRootPart.Position, player.Character.HumanoidRootPart.Position}, {local_player.Character, player.Character});
		return #amount ~= 0;
	end);
	

	utility.drawing_new = function(type, properties)
		local drawing_object = Drawing.new(type);

		for property, value in properties do
			drawing_object[property] = value;
		end;

		return drawing_object;
	end;

	utility.instance_new = function(type, properties)
		local instance = Instance.new(type);

		for property, value in properties do
			instance[property] = value;
		end;

		return instance;
	end;

	utility.generate_random_string = function(length)
		local characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		local random_string = "";

		for i = 1, length do
			local random_index = math.random(1, #characters);
			random_string = random_string .. string.sub(characters, random_index, random_index);
		end;

		return random_string;
	end;

	utility.is_player_black = LPH_NO_VIRTUALIZE(function(player)
		if (not (utility.has_character(player))) then return false end;

		local head = player.Character.Head;
		local hue = Color3.toHSV(head.Color);

		return hue >= 0 and hue <= 0.1;
	end);

	utility.play_sound = LPH_NO_VIRTUALIZE(function(volume, sound_id)
		local sound = Instance.new("Sound");
		sound.Parent = workspace;
		sound.SoundId = sound_id;
		sound.Volume = volume;

		sound:Play();

		utility.new_connection(sound.Ended, function()
			sound:Destroy();
		end);
	end);

	utility.clone_character = function(player, transparency, color, material, delete_hrp)
		local delete_hrp = delete_hrp or true;

		player.Character.Archivable = true;
		local new_character = player.Character:Clone();
		new_character.Parent = workspace;
		player.Character.Archivable = false;
		
		local parts = new_character:GetChildren();
		
		for i = 1, #parts do
			local part = parts[i];
				
			if (part.ClassName == "MeshPart") then
				part.Anchored = true;
				part.CanCollide = false;
				part.Color = color;
				part.Material = Enum.Material[material];
				part.Transparency = transparency;
			else
				if part.Name ~= "HumanoidRootPart" and delete_hrp then
					part:Destroy();
				end;
			end;
			
			if part.Name == "Head" then
				local decal = part:FindFirstChild("face");
				
				if decal then decal:Destroy() end;
			end;
		end;

		return new_character;
	end;

	utility.create_beam = LPH_NO_VIRTUALIZE(function(from, to, color_1, color_2, duration, fade_enabled, fade_duration)
		local tween;
		local total_time = 0;

		local main_part = utility.instance_new("Part", {
			Parent = workspace,
			Size = Vector3.new(0, 0, 0),
			Massless = true,
			Transparency = 1,
			CanCollide = false,
			Position = from,
			Anchored = true
		});

		local part0 = utility.instance_new("Part", {
			Parent = main_part,
			Size = Vector3.new(0, 0, 0),
			Massless = true,
			Transparency = 1,
			CanCollide = false,
			Position = from,
			Anchored = true
		});

		local part1 = utility.instance_new("Part", {
			Parent = main_part,
			Size = Vector3.new(0, 0, 0),
			Massless = true,
			Transparency = 1,
			CanCollide = false,
			Position = to,
			Anchored = true
		});

		local attachment0 = utility.instance_new("Attachment", {
			Parent = part0
		});

		local attachment1 = utility.instance_new("Attachment", {
			Parent = part1
		});

		local beam = utility.instance_new("Beam", {
			Texture = "rbxassetid://446111271",
			TextureMode = Enum.TextureMode.Wrap,
			TextureLength = 10,
			LightEmission = 1,
			LightInfluence = 1,
			FaceCamera = true,
			ZOffset = -1,
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 0),
				NumberSequenceKeypoint.new(1, 1),
			}),
			Color = ColorSequence.new({
				ColorSequenceKeypoint.new(0, color_1),
				ColorSequenceKeypoint.new(1, color_2),
			}),
			Attachment0 = attachment0,
			Attachment1 = attachment1,
			Enabled = true,
			Parent = main_part
		});


		if fade_enabled then
			tween = utility.new_connection(run_service.Heartbeat, function(delta_time) --// credits to xander
				total_time += delta_time;
				beam.Transparency = NumberSequence.new(tween_service:GetValue((total_time / fade_duration), Enum.EasingStyle.Quad, Enum.EasingDirection.In));
			end)
		end;

		task.delay(duration, function()
			main_part:Destroy();

			if (tween) then
				tween:Disconnect();
			end;
		end);
	end);

	utility.create_impact = function(color, size, fade_enabled, fade_duration, duration, position)
		local impact = utility.instance_new("Part", {
			CanCollide = false;
			Material = Enum.Material.Neon;
			Size = Vector3.new(size, size, size);
			Color = color;
			Position = position;
			Anchored = true;
			Parent = workspace
		});

		local outline = utility.instance_new("SelectionBox", { --// credits to xander
			LineThickness = 0.01;
			Color3 = color;
			SurfaceTransparency = 1;
			Adornee = impact;
			Visible = true;
			Parent = impact
		});

		if (fade_enabled) then
			local tween_info = TweenInfo.new(duration);
			local tween = tween_service:Create(impact, tween_info, {Transparency = 1});
			local tween_outline = tween_service:Create(outline, tween_info, {Transparency = 1});

			tween:Play();
			tween_outline:Play();
		end;

		task.delay(duration, function()
			impact:Destroy()		
		end);
	end;
end;

--// math functions
local custom_math = {}; do
	custom_math.random_vector3 = LPH_NO_VIRTUALIZE(function(randomization)
		return Vector3.new(math.random(-randomization, randomization), math.random(-randomization, randomization), math.random(-randomization, randomization));
	end);

	custom_math.recalculate_velocity = LPH_NO_VIRTUALIZE(function(part, update_time) --// this is pasted
		local current_position = part.Position;
		local current_time = tick();
		task.wait(1 / update_time);
		local new_position = part.Position;
		local new_time = tick();
		local distance_traveled = (new_position - current_position);
		local time_interval = (new_time - current_time);
		local velocity = (distance_traveled / time_interval);
		current_position = new_position;
		current_time = new_time;
		return velocity;
	end);

	custom_math.cframe_to_offset = function(origin, target)
		local actual_origin = origin * CFrame.new(0, -1, 0, 1, 0, 0, 0, 0, 1, 0, -1, 0);
		return actual_origin:ToObjectSpace(target):inverse();
	end;

	custom_math.is_mouse_over_frame = function(frame)
		local mouse_pos = user_input_service:GetMouseLocation();
		local absolute_position = frame.AbsolutePosition;
		local absolute_size = frame.AbsoluteSize;

		local xBound = (mouse_pos.X >= absolute_position.X and mouse_pos.X < absolute_position.X + absolute_size.X);
		local yBound = (mouse_pos.Y >= absolute_position.Y and mouse_pos.Y < absolute_position.Y + absolute_size.Y);
		return (xBound and yBound);
	end;
end;

--// custom dahood functions
local dahood = {}; do
	dahood.has_blood_splatter = LPH_NO_VIRTUALIZE(function(player)
		if (not utility.has_character(player)) then return false end;
	
		local descendants = player.Character:GetDescendants();
		for i = 1, #descendants do
			local instance = descendants[i];
	
			if ((instance.Name == "BloodSplatter" or instance.Name == "BloodParticles" or instance.Name == "BloodParticle") and not table.find(blood_splatters, instance)) then
				table.insert(blood_splatters, instance);
				return true, instance.Parent;
			end;
		end;
	
		return false;
	end);	
	
	dahood.get_armor = LPH_NO_VIRTUALIZE(function(player)
		if (not utility.has_character(player)) then return 100 end;

		local body_effects = player.Character:FindFirstChild("BodyEffects");

		if not body_effects then
			return 100;
		end;

		return body_effects.Armor.Value;
	end);

	dahood.is_on_vehicle = LPH_NO_VIRTUALIZE(function(player)
		return player.Character:FindFirstChild("[CarHitBox]") ~= nil;
	end);

	dahood.is_knocked = LPH_NO_VIRTUALIZE(function(player) --// TODO: rewrite this
		local value;

		if game.GameId == 1958807588 then --// hood modded
			value = player.Information.KO.Value;
		else --// real dahood
			local bodyeffects = player.Character:FindFirstChild("BodyEffects");
			value = bodyeffects and bodyeffects["K.O"].Value or false;
		end;

		return value;
	end);

	dahood.get_gun = LPH_NO_VIRTUALIZE(function(player) --// TODO: ADD MORE SUPPORT FOR DIFFERENT HOOD GAMES
		local info;

		--// character check
		if (not (utility.has_character(player))) then return end;

		local tool = player.Character:FindFirstChildWhichIsA("Tool");

		--// tool check
		if (not (tool)) then return end;

		--// main code
		local descendants = tool:GetDescendants();

		for i = 1, #descendants do
			local object = descendants[i];

			if (object.Name:lower():find("ammo") and not object.Name:lower():find("max") and (object.ClassName == "IntValue" or object.ClassName == "NumberValue")) then
				info = {};
				info.ammo = object;
				info.tool = tool;
			end;
		end;

		return info;
	end);

	dahood.is_grabbed = LPH_NO_VIRTUALIZE(function(player)
		return player.Character:FindFirstChild("GRABBING_CONSTRAINT") ~= nil;
	end);
end;

--// combat functions
local combat = {}; do
	combat.get_closest_body_part = LPH_NO_VIRTUALIZE(function(player)
		local closest_body_part;
		local mouse_position = user_input_service:GetMouseLocation();
		local radius = math.huge;

		local children = player.Character:GetChildren();

		for i = 1, #children do
			local part = children[i];
			if (part.ClassName ~= "MeshPart") then continue end;

			local part_position = utility.world_to_screen(part.Position);
			local distance = (mouse_position - part_position.position).Magnitude;

			if (distance <= radius) then
				radius = distance;
				closest_body_part = part;
			end;
		end;

		return closest_body_part;
	end);

	combat.get_closest_player = LPH_NO_VIRTUALIZE(function(fov_enabled, fov_radius, checks_enabled, check_values)
		--// locals
		local mouse_position = user_input_service:GetMouseLocation();
		local radius = fov_enabled and (fov_radius * 3) or math.huge;
		local closest_player;

		--// main loop
		local players = players:GetPlayers();
		for i = 1 , #players do
			local player = players[i];
			if (player == local_player) then continue end;

			if (not (utility.has_character(player))) then continue end;

			local root_part = player.Character:FindFirstChild("HumanoidRootPart");

			if (not (root_part)) then continue end;

			local root_position = utility.world_to_screen(root_part.Position);

			if (not (root_position.on_screen)) then continue end;

			if (checks_enabled and (
				table.find(check_values, "Vehicle") and dahood.is_on_vehicle(player) or
				table.find(check_values, "Knocked") and dahood.is_knocked(player) or
				table.find(check_values, "Grabbed") and dahood.is_grabbed(player) or
				table.find(check_values, "Friend") and utility.is_friends_with(player) or
				table.find(check_values, "Wall") and utility.is_player_behind_a_wall(player)
			)) then continue end;

			local distance = (mouse_position - root_position.position).Magnitude;

			if (distance <= radius) then
				radius = distance;
				closest_player = player;
			end;
		end;

		return closest_player;
	end);

	combat.resolve = function(player, method, update_time)
		if (not utility.has_character(player)) then return Vector3.new(0, 0, 0) end;

		local actual_update_time = update_time or 100;
		local velocity;

		if (method == "Recalculate") then
			velocity = custom_math.recalculate_velocity(player.Character.HumanoidRootPart, actual_update_time);
		elseif (method == "MoveDirection") then
			velocity = (player.Character.Humanoid.MoveDirection * player.Character.Humanoid.WalkSpeed);
		end;

		return velocity;
	end;
	
	combat.get_random_body_part = function(player)
		local children = player.Character:GetChildren();
		local mesh_parts = {};

		for i = 1, #children do
			local object = children[i];
			if (object.ClassName ~= "MeshPart") then continue end;

			table.insert(mesh_parts, object);
		end;

		return mesh_parts[math.random(1, #mesh_parts)];
	end;
end;

--// assist functions
local assist = {}; do
	assist.get_predicted_position = function()
		--// locals
		local target = locals.assist.target;

		--// settings
		local aim_part = flags["legit_assist_part"];
		local prediction = flags["legit_assist_prediction"];
		local shake_enabled = flags["legit_assist_shake_enabled"];
		local shake_amount = flags["legit_assist_shake_amount"];
		local anti_ground_shots_enabled = flags["legit_assist_anti_ground_shots"];
		local to_take_off = flags["legit_assist_anti_ground_shots_to_take_off"] / 10; --// will convert 2 to 0.2 as an example
		local use_air_aim_part = flags["legit_assist_use_air_hit_part"];
		local air_aim_part = flags["legit_assist_air_part"];
		local resolver_enabled = flags["legit_assist_resolver"];
		local resolver_method = flags["legit_assist_resolver_method"];
		local resolve_update_time = flags["legit_assist_resolver_update_time"];

		--// instances
		local root_part = target.Character.HumanoidRootPart;
		local aim_part_instance = target.Character:FindFirstChild(aim_part);

		--// vars
		local velocity = resolver_enabled and combat.resolve(target, resolver_method, resolve_update_time) or root_part.Velocity;

		--// velocity modifactions
		if (anti_ground_shots_enabled and (utility.is_in_air(target))) then
			velocity = Vector3.new(velocity.X, math.abs(velocity.Y * to_take_off), velocity.Z);
		end;

		--// aim part modifactions
		if (use_air_aim_part and (utility.is_in_air(target))) then
			aim_part_instance = target.Character:FindFirstChild(air_aim_part);
		end;

		--// main
		local predicted_position = (aim_part_instance.Position + velocity * prediction);

		--// position modifactions
		if (shake_enabled) then
			predicted_position = predicted_position + custom_math.random_vector3(shake_amount);
		end;

		--// end
		return predicted_position;
	end;

	assist.move_mouse = function(position, smoothing)
		local mouse_position = user_input_service:GetMouseLocation();

		mousemoverel((position.X - mouse_position.X) / smoothing, (position.Y - mouse_position.Y) / smoothing);
	end;
end;
--// silent aim functions
local silent_aim = {} do
	silent_aim.get_predicted_position = function()
		--// locals
		local target = locals.silent_aim.target;

		--// settings
		local aim_part = flags["legit_silent_aim_part"];
		local closest_body_part_enabled = flags["legit_silent_closest_body_part"];
		local prediction = flags["legit_silent_prediction"];
		local anti_ground_shots_enabled = flags["legit_silent_anti_ground_shots"];
		local to_take_off = flags["legit_silent_anti_ground_shots_to_take_off"] / 10;
		local use_air_aim_part = flags["legit_silent_use_air_hit_part"];
		local air_aim_part = flags["legit_silent_air_aim_part"];
		local resolver_enabled = flags["legit_silent_resolver"];
		local resolver_method = flags["legit_silent_resolver_method"];
		local update_time = flags["legit_silent_resolver_update_time"];

		--// instances
		local root_part = target.Character.HumanoidRootPart;
		local aim_part_instance = closest_body_part_enabled and combat.get_closest_body_part(target) or target.Character:FindFirstChild(aim_part);

		--// vars
		local velocity = resolver_enabled and combat.resolve(target, resolver_method, update_time) or root_part.Velocity;

		--// velocity modifactions
		if (anti_ground_shots_enabled and (utility.is_in_air(target))) then
			velocity = Vector3.new(velocity.X, math.abs(velocity.Y * to_take_off), velocity.Z);
		end;

		--// aim part modifactions
		if (use_air_aim_part and (utility.is_in_air(target))) then
			aim_part_instance = target.Character:FindFirstChild(air_aim_part);
		end;

		--// main
		local predicted_position = (aim_part_instance.Position + velocity * prediction);

		--// end
		return game.PlaceId == hood_customs and predicted_position + Vector3.new(25, 100, 25) or predicted_position
	end;
end;

--// target aim functions
local target_aim = {}; do
	target_aim.get_predicted_position = function()
		--// locals
		local target = locals.target_aim.target;

		--// settings
		local aim_part = flags["rage_target_aim_aim_part"];
		local closest_body_part_enabled = flags["rage_target_aim_closest_body_part"];
		local prediction = flags["rage_target_aim_prediction"];
		local resolver_enabled = flags["rage_target_aim_resolver_enabled"];
		local resolver_method = flags["rage_target_aim_resolver_method"];
		local anti_ground_shots_enabled = flags["rage_target_aim_anti_ground_shots"];
		local dampening_factor = flags["rage_target_aim_dampening_factor"];
		local use_air_aim_part = flags["rage_target_aim_use_air_hit_part"];
		local air_aim_part = flags["rage_target_aim_air_aim_part"];
		local use_air_offset = flags["rage_target_aim_use_air_offset"];
		local air_offset = flags["rage_target_aim_air_offset"] / 100; --// will convert 4 to 0.04 as am example
		local update_time = flags["rage_target_aim_update_time"];
		local random_body_part_enabled = flags["rage_target_aim_randomized_body_part"];
		--local movement_simulation = flags["rage_target_aim_movement_simulation"];

		--// instances
		local root_part = target.Character.HumanoidRootPart;
		local aim_part_instance = closest_body_part_enabled and combat.get_closest_body_part(target) or target.Character:FindFirstChild(aim_part);

		--// random body part
		if (random_body_part_enabled) then
			aim_part_instance = combat.get_random_body_part(target);
		end;

		--// vars
		local velocity = resolver_enabled and combat.resolve(target, resolver_method, update_time) or root_part.Velocity;
		local is_in_air = utility.is_in_air(target);


        if (anti_ground_shots_enabled and is_in_air) then
            local going_down = velocity:Dot(Vector3.new(0, -1, 0));
            if going_down > 0.05 then
                velocity *= Vector3.new(1, dampening_factor, 1);
            end;
        end;

		--// aim part modifactions
		if (use_air_aim_part and (is_in_air)) then
			aim_part_instance = target.Character:FindFirstChild(air_aim_part);
		end;

		--// main
		local predicted_position = (aim_part_instance.Position + velocity * prediction);
		
		--// offsets
		if (use_air_offset and (is_in_air)) then
			predicted_position = predicted_position + Vector3.new(0, air_offset, 0);
		end;
	
		--// end
		return game.PlaceId == hood_customs and predicted_position + Vector3.new(25, 100, 25) or predicted_position;
	end;
end;

--[[ if (utility.is_player_black(local_player)) then
    local_player:Kick("Script tampering detected");
    return;
end; --]]

--// hit effects
local hit_effects = {}; do
	hit_effects.confetti = function(position) --// credits to xander
		local part = utility.instance_new("Part", {
			Position = position,
			Anchored = true,
			Transparency = 1,
			CanCollide = false,
			Parent = workspace
		});

		for i = 1, 5 do
			local particle1 = utility.instance_new("ParticleEmitter", {
				Acceleration = Vector3.new(0,-10,0);
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(0,1,0.886275)),ColorSequenceKeypoint.new(1,Color3.new(0,1,0.886275))};
				Lifetime = NumberRange.new(1,2);
				Rate = 0;
				RotSpeed = NumberRange.new(260,260);
				Size = NumberSequence.new{NumberSequenceKeypoint.new(0,0.1,0),NumberSequenceKeypoint.new(1,0.1,0)};
				Speed = NumberRange.new(15,15);
				SpreadAngle = Vector2.new(360,360);
				Texture = "http://www.roblox.com/asset/?id=241685484";
				Parent = part
			});
			local particle2 = utility.instance_new("ParticleEmitter", {
				Acceleration = Vector3.new(0,-10,0);
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(0,0.0980392,1)),ColorSequenceKeypoint.new(1,Color3.new(0,0,1))};
				Lifetime = NumberRange.new(1,2);
				Rate = 0;
				RotSpeed = NumberRange.new(260,260);
				Size = NumberSequence.new{NumberSequenceKeypoint.new(0,0.1,0),NumberSequenceKeypoint.new(1,0.1,0)};
				Speed = NumberRange.new(15,15);
				SpreadAngle = Vector2.new(360,360);
				Texture = "http://www.roblox.com/asset/?id=241685484]";
				Parent = part
			});
			local particle3 = utility.instance_new("ParticleEmitter", {
				Acceleration = Vector3.new(0,-10,0);
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(0.901961,1,0)),ColorSequenceKeypoint.new(1,Color3.new(1,0.933333,0))};
				Lifetime = NumberRange.new(1,2);
				Rate = 0;
				RotSpeed = NumberRange.new(260,260);
				Size = NumberSequence.new{NumberSequenceKeypoint.new(0,0.1,0),NumberSequenceKeypoint.new(1,0.1,0)};
				Speed = NumberRange.new(15,15);
				SpreadAngle = Vector2.new(360,360);
				Texture = "http://www.roblox.com/asset/?id=24168548";
				Parent = part
			});
			local particle4 = utility.instance_new("ParticleEmitter", {
				Acceleration = Vector3.new(0,-10,0);
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(0.180392,1,0)),ColorSequenceKeypoint.new(1,Color3.new(0.180392,1,0))};
				Lifetime = NumberRange.new(1,2);
				Rate = 0;
				RotSpeed = NumberRange.new(260,260);
				Size = NumberSequence.new{NumberSequenceKeypoint.new(0,0.1,0),NumberSequenceKeypoint.new(1,0.1,0)};
				Speed = NumberRange.new(15,15);
				SpreadAngle = Vector2.new(360,360);
				Texture = "http://www.roblox.com/asset/?id=241685484";
				Parent = part
			});
			local particle5 = utility.instance_new("ParticleEmitter", {
				Acceleration = Vector3.new(0,-10,0);
				Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),ColorSequenceKeypoint.new(1,Color3.new(1,0,0))};
				Lifetime = NumberRange.new(1,2);
				Rate = 0;
				RotSpeed = NumberRange.new(260,260);
				Size = NumberSequence.new{NumberSequenceKeypoint.new(0,0.1,0),NumberSequenceKeypoint.new(1,0.1,0)};
				Speed = NumberRange.new(15,15);
				SpreadAngle = Vector2.new(360,360);
				Texture = "http://www.roblox.com/asset/?id=241685484";
				Parent = part
			});	
		end;

		local objects = part:GetChildren();

		for i = 1, #objects do
			local object = objects[i];

			if (object.ClassName ~= "ParticleEmitter") then continue end;

			object:Emit(1);
		end;

		task.delay(3, function()
			part:Destroy();
		end);
	end;
	
	hit_effects.bubble = function(position, color) --// credits to xander once again
		local part = utility.instance_new("Part", {
			Position = position,
			Anchored = true,
			Transparency = 1,
			CanCollide = false,
			Parent = workspace
		});
        
        local particle1 = utility.instance_new("ParticleEmitter", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0,color),ColorSequenceKeypoint.new(1,color)};
            Lifetime = NumberRange.new(0.5,0.5);
            LightEmission = 1;
            LockedToPart = true;
            Orientation = Enum.ParticleOrientation.VelocityPerpendicular;
            Rate = 0;
            Size = NumberSequence.new{NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,10,0)};
            Speed = NumberRange.new(1.5,1.5);
            Texture = "rbxassetid://1084991215";
            Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.0996047,0,0),NumberSequenceKeypoint.new(0.602372,0,0),NumberSequenceKeypoint.new(1,1,0)};
            ZOffset = 1;
            Parent = part
        });
        local particle2 = utility.instance_new("ParticleEmitter", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0,color),ColorSequenceKeypoint.new(1,color)};
            Lifetime = NumberRange.new(0.5,0.5);
            LightEmission = 1;
            LockedToPart = true;
            Rate = 0;
            Size = NumberSequence.new{NumberSequenceKeypoint.new(0,0,0),NumberSequenceKeypoint.new(1,10,0)};
            Speed = NumberRange.new(0,0);
            Texture = "rbxassetid://1084991215";
            Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.0996047,0,0),NumberSequenceKeypoint.new(0.601581,0,0),NumberSequenceKeypoint.new(1,1,0)};
            ZOffset = 1;
            Parent = part
        });
        local particle3 = utility.instance_new("ParticleEmitter", {
            Color = ColorSequence.new{ColorSequenceKeypoint.new(0,Color3.new(0,0,0)),ColorSequenceKeypoint.new(1,Color3.new(0,0,0))};
            Lifetime = NumberRange.new(0.2,0.5);
            LockedToPart = true;
            Orientation = Enum.ParticleOrientation.VelocityParallel;
            Rate = 0;
            Rotation = NumberRange.new(-90,90);
            Size = NumberSequence.new{NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(1,8.5,1.5)};
            Speed = NumberRange.new(0.1,0.1);
            SpreadAngle = Vector2.new(180,180);
            Texture = "http://www.roblox.com/asset/?id=6820680001";
            Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0,1,0),NumberSequenceKeypoint.new(0.200791,0,0),NumberSequenceKeypoint.new(0.699605,0,0),NumberSequenceKeypoint.new(1,1,0)};
            ZOffset = 1.5;
            Parent = part
        });

		particle1:Emit(1);
		particle2:Emit(1);
        particle3:Emit(1);

		task.delay(1, function()
			part:Destroy();
		end);
	end;
end;

local features = {}; do
	features.local_material = function(state, material)
		local children = local_player.Character:GetDescendants();
		for i = 1, #children do
			local child = children[i];
			if (child.ClassName == "MeshPart") then
				child.Material = Enum.Material[state and material or "Plastic"];
			end;
		end;
	end;

	features.get_text = function(original_text)
        local args = {
            ["display_name"] = local_player.DisplayName,
            ["name"] = local_player.Name,
			["target_name"] = locals.target_aim.is_targetting and locals.target_aim.target.Name or "None"
        };

        for arg, name in args do
            original_text = original_text:gsub("%${" .. arg .. "}", name);
        end;

        return original_text
    end;

	features.update_c_sync_char = function(desynced_pos, color)
		if not instances.c_sync_chams then return end;
		if not utility.has_character(local_player) then return end;
		
		local parts = instances.c_sync_chams:GetChildren();
		local hrp = local_player.Character:FindFirstChild("HumanoidRootPart");
		
		if not hrp then return end;
		
		for i = 1, #parts do
			local part = parts[i];
			local actual_part = local_player.Character:FindFirstChild(part.Name);
			
			if not actual_part then continue end;
			if part.Name == "HumanoidRootPart" then continue end;
			
			if part.ClassName == "MeshPart" then
				part.CFrame = actual_part.CFrame;
				part.Anchored = true;
				part.CanCollide = false;
				part.Color = color;
			end;
		end;

		instances.c_sync_chams:SetPrimaryPartCFrame(desynced_pos);
	end;
end;

--// drawing objects
do
    --// assist
    do
        --// assist fov
        drawings["assist_fov_outside"] = utility.drawing_new("Circle", {
            Visible = false,
            Color = default_color,
            ZIndex = 9e9
        });

        drawings["assist_fov_inside"] = utility.drawing_new("Circle", {
            Visible = false,
            Filled = true,
            Color = default_color,
            ZIndex = 9e9
        });
    end;

    --// silent aim
    do
        --// silent fov
        drawings["silent_fov_outside"] = utility.drawing_new("Circle", {
            Visible = false,
            Color = default_color,
            ZIndex = 9e9
        });

        drawings["silent_fov_inside"] = utility.drawing_new("Circle", {
            Visible = false,
            Filled = true,
            Color = default_color,
            ZIndex = 9e9
        });

        --// target tracer
        drawings["silent_tracer"] = utility.drawing_new("Line", {
            Visible = false,
            Color = default_color,
            Thickness = 2
        });
    end;

    --// target aim
    do
        drawings["target_fov_outside"] = utility.drawing_new("Circle", {
            Visible = false,
            Color = default_color,
            ZIndex = 9e9
        });

        drawings["target_fov_inside"] = utility.drawing_new("Circle", {
            Visible = false,
            Filled = true,
            Color = default_color,
            ZIndex = 9e9
        });

        drawings["target_tracer"] = utility.drawing_new("Line", {
            Visible = false,
            Color = default_color,
            Thickness = 2
        });

		drawings["target_dot"] = utility.drawing_new("Circle", {
			Filled = true
		});
    end;

	--// c sync
	do
		drawings["c_sync_dot"] = utility.drawing_new("Circle", {
			Visible = false,
			Filled = true
		});

		drawings["c_sync_tracer"] = utility.drawing_new("Line", {
			Visible = false,
			Color = default_color,
			Thickness = 2
		})
	end;
end;

--// signals
do
	signals["target_target_changed"] = utility.create_connection("target_target_changed");
end;

--// instances
do
    --// target aim
    do
        instances["target_chams"] = utility.instance_new("Highlight", {
            FillColor = default_color,
            OutlineColor = default_color,
            OutlineTransparency = 0.5,
            FillTransparency = 0.5
        });
	end;
	
	--// local shit
	do
		instances["local_chams"] = utility.instance_new("Highlight", {
            FillColor = default_color,
            OutlineColor = Color3.new(0, 0, 0),
            OutlineTransparency = 0.5,
            FillTransparency = 0.5
        });

		instances["local_text"] = utility.instance_new("TextLabel", { 
			Name = "https://starhook.club",
			Parent = screen_gui_2,
			Text = '<font color="rgb(207, 227, 0)">starhook</font><font color="rgb(255, 255, 255)">.club</font>',
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			TextStrokeTransparency = 0.5,
			Font = Enum.Font.SourceSans,
			TextSize = 20,
			RichText = true
		});
	end;

    do
        instances["target_ui"]["frame"] = utility.instance_new("Frame", {
            Parent = screen_gui;
            BackgroundColor3 = Color3.fromRGB(13, 13, 13);
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(0.405395985, 0, 0.644607842, 0);
            Size = UDim2.new(0, 337, 0, 132);
        });

        instances["target_ui"]["ui_corner"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["frame"];
        });

        instances["target_ui"]["ui_stroke"] = utility.instance_new("UIStroke", {
            Parent = instances["target_ui"]["frame"];
            Color = Color3.fromRGB(50, 50, 50);
        });

        instances["target_ui"]["image"] = utility.instance_new("Frame", {
            Name = "Image";
            Parent = instances["target_ui"]["frame"];
            BackgroundColor3 = Color3.fromRGB(20, 20, 20);
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(0.0326409489, 0, 0.121212125, 0);
            Size = UDim2.new(0, 100, 0, 100);
        });

        instances["target_ui"]["main_image"] = utility.instance_new("ImageLabel", {
            Name = "MainImage";
            Parent = instances["target_ui"]["image"];
            BackgroundColor3 = Color3.fromRGB(255, 255, 255);
            BackgroundTransparency = 1.0;
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Size = UDim2.new(0, 100, 0, 100);
            Image = "rbxthumb://type=AvatarHeadShot&id=5038007184&w=420&h=420";
        });

        instances["target_ui"]["ui_corner_2"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["main_image"];
        });

        instances["target_ui"]["ui_corner_3"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["image"];
        });

        instances["target_ui"]["ui_stroke_2"] = utility.instance_new("UIStroke", {
            Parent = instances["target_ui"]["image"];
            Color = Color3.fromRGB(35, 35, 35);
        });

        instances["target_ui"]["info"] = utility.instance_new("Frame", {
            Name = "Info";
            Parent = instances["target_ui"]["frame"];
            BackgroundColor3 = Color3.fromRGB(20, 20, 20);
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(0.370919883, 0, 0.121212125, 0);
            Size = UDim2.new(0, 202, 0, 100);
        });

        instances["target_ui"]["ui_corner_4"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["info"];
        });

        instances["target_ui"]["ui_stroke_3"] = utility.instance_new("UIStroke", {
            Parent = instances["target_ui"]["info"];
            Color = Color3.fromRGB(35, 35, 35);
        });

        instances["target_ui"]["logo"] = utility.instance_new("ImageLabel", {
            Name = "Logo";
            Parent = instances["target_ui"]["info"];
            BackgroundColor3 = Color3.fromRGB(207, 227, 0);
            BackgroundTransparency = 1.0;
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(0.801597357, 0, -0.00666687032, 0);
            Size = UDim2.new(0, 40, 0, 40);
            Image = "http://www.roblox.com/asset/?id=18305816180";
        });

        instances["target_ui"]["player_name"] = utility.instance_new("TextLabel", {
            Name = "PlayerName";
            Parent = instances["target_ui"]["info"];
            BackgroundColor3 = Color3.fromRGB(255, 255, 255);
            BackgroundTransparency = 1.0;
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(0.0597032607, 0, 0, 0);
            Size = UDim2.new(0, 115, 0, 39);
            Font = Enum.Font.Roboto;
            Text = "Linemaster";
            TextColor3 = Color3.fromRGB(255, 255, 255);
            TextScaled = true;
            TextSize = 27.0;
            TextStrokeTransparency = 0.0;
            TextWrapped = true;
        });

        instances["target_ui"]["health"] = utility.instance_new("Frame", {
            Name = "Health";
            Parent = instances["target_ui"]["info"];
            BackgroundColor3 = Color3.fromRGB(35, 35, 35);
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(0.0297029708, 0, 0.469999999, 0);
            Size = UDim2.new(0, 143, 0, 13);
        });

        instances["target_ui"]["ui_corner_5"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["health"];
        });

        instances["target_ui"]["health_inline"] = utility.instance_new("Frame", {
            Name = "HealthInline";
            Parent = instances["target_ui"]["health"];
            BackgroundColor3 = Color3.fromRGB(207, 227, 0);
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(-0.00526097417, 0, 0.0769230798, 0);
            Size = UDim2.new(0, 143, 0, 12);
        });

        instances["target_ui"]["ui_corner_6"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["health_inline"];
        });

        instances["target_ui"]["armor"] = utility.instance_new("Frame", {
            Name = "Armor";
            Parent = instances["target_ui"]["info"];
            BackgroundColor3 = Color3.fromRGB(35, 35, 35);
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(0.0299999993, 0, 0.699999988, 0);
            Size = UDim2.new(0, 143, 0, 13);
        });

        instances["target_ui"]["ui_corner_7"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["armor"];
        });

        instances["target_ui"]["armor_inline"] = utility.instance_new("Frame", {
            Name = "ArmorInline";
            Parent = instances["target_ui"]["armor"];
            BackgroundColor3 = Color3.fromRGB(0, 140, 227);
            BorderColor3 = Color3.fromRGB(0, 0, 0);
            BorderSizePixel = 0;
            Position = UDim2.new(-0.00526097417, 0, 0.0769230798, 0);
            Size = UDim2.new(0, 143, 0, 12);
        });

        instances["target_ui"]["ui_corner_8"] = utility.instance_new("UICorner", {
            Parent = instances["target_ui"]["armor_inline"];
        });
    end;

	--// c sync
	do
		local cloned_char = utility.clone_character(local_player, 0.7, default_color, "Neon", false);
		cloned_char.PrimaryPart = cloned_char.HumanoidRootPart;
		cloned_char.HumanoidRootPart.CanCollide = false;
		instances["c_sync_chams"] = cloned_char
	end;
end;

--// connections
do
    --// addon library
    do
        script_addon.events["gun_activated"] = utility.create_connection("gun_activated");
    end;

	local dragging = false;

	--// target ui dragging
	utility.new_connection(user_input_service.InputBegan, function(input, is_typing)
		if (not (input.UserInputType == Enum.UserInputType.MouseButton1)) then return end;
		if (not (custom_math.is_mouse_over_frame(instances["target_ui"]["frame"]))) then return end;
		if ((flags["rage_target_aim_ui_mode"] ~= "Static")) then return end;

		dragging = true;
	end);

	utility.new_connection(user_input_service.InputEnded, function(input, is_typing)
		if (not (input.UserInputType == Enum.UserInputType.MouseButton1)) then return end;
		
		dragging = false;
	end);

	utility.new_connection(user_input_service.InputChanged, function(input)
		if (not (input.UserInputType == Enum.UserInputType.MouseMovement)) then return end;
		if (not (dragging)) then return end;

		local mouse_pos = user_input_service:GetMouseLocation();

		local tween_info = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
		local frame = instances["target_ui"]["frame"];

		local tween = tween_service:Create(frame, tween_info, {Position = UDim2.fromOffset(mouse_pos.X, mouse_pos.Y)});

		tween:Play();
	end);

    do
        --// assist connections
        utility.new_connection(run_service.RenderStepped, function()
            local assist_enabled = flags["legit_assist_enabled"];
            local stutter_enabled = flags["legit_assist_stutter_enabled"];
            local stutter_amount = flags["legit_assist_stutter_amount"];
            local actual_stutter_amount = (stutter_amount / 15);
            local fov_enabled = flags["legit_assist_settings_use_field_of_view"];
			
            if (assist_enabled and (locals.assist.is_targetting and locals.assist.target) and ((not stutter_enabled) or stutter_enabled and (tick() - locals.old_ticks.assist_stutter_tick >= actual_stutter_amount))) then
                local assist_type = flags["legit_assist_type"];
                local smoothing = flags["legit_assist_smoothing_amount"];
                local actual_smoothing = (1 / smoothing);
                local smoothing_enabled = flags["legit_assist_smoothing_enabled"];

                local position = assist.get_predicted_position();

                if (assist_type) == "Camera" then
                    camera.CFrame = smoothing_enabled and camera.CFrame:Lerp(CFrame.new(camera.CFrame.Position, position), actual_smoothing) or CFrame.new(camera.CFrame.Position, position); --// also please note that i wanted to use tweenservice but i hate tweenservice
                elseif (assist_type) == "Mouse" then
                    local screen_position = utility.world_to_screen(position);
                    local actual_smoothing_mouse = smoothing_enabled and smoothing or 7;
                    assist.move_mouse(screen_position.position, actual_smoothing_mouse);
                end;

                locals.old_ticks.assist_stutter_tick = tick();
            end;

            if (assist_enabled and fov_enabled) then
                local fov_radius = (flags["legit_assist_settings_field_of_view_radius"] * 3);
                local fov_color = flags["legit_assist_settings_field_of_view_color"];
                local fov_transparency = flags["legit_assist_settings_field_of_view_transparency"];

                --// outside fov
                drawings.assist_fov_outside.Visible = true;
                drawings.assist_fov_outside.Radius = fov_radius;
                drawings.assist_fov_outside.Color = fov_color;
                drawings.assist_fov_outside.Position = user_input_service:GetMouseLocation();

                --// inside
                drawings.assist_fov_inside.Visible = true;
                drawings.assist_fov_inside.Radius = fov_radius;
                drawings.assist_fov_inside.Color = fov_color;
                drawings.assist_fov_inside.Transparency = fov_transparency;
                drawings.assist_fov_inside.Position = user_input_service:GetMouseLocation();
            else
                if drawings.assist_fov_inside then
                    drawings.assist_fov_outside.Visible = false;
                    drawings.assist_fov_inside.Visible = false;
                end;
            end;
        end);
    end;

    --// silent aim connections
    do
        utility.new_connection(run_service.RenderStepped, function()
            --// settings
            local silent_enabled = flags["legit_silent_enabled"];
            local tracer_enabled = flags["legit_silent_aim_tracer_enabled"];
            local fov_enabled = flags["legit_silent_use_field_of_view"];
            local fov_visualize_enabled = flags["legit_silent_visualize_field_of_view"];
            local fov_radius = flags["legit_silent_field_of_view_radius"];
            local checks_enabled = flags["legit_silent_use_checks"];
            local check_values = flags["legit_silent_checks"];

            if (silent_enabled) then
                local new_target = combat.get_closest_player(fov_enabled, fov_radius, checks_enabled, check_values);

                if new_target ~= locals.silent_aim.target then
                    locals.silent_aim.target = new_target or nil;
                end;

                locals.silent_aim.is_targetting = new_target and true or false;
            end;

            if (silent_enabled and (locals.silent_aim.is_targetting and locals.silent_aim.target)) then
                locals.silent_aim.predicted_position = silent_aim.get_predicted_position();
            end;

            if (silent_enabled and (fov_enabled and fov_visualize_enabled)) then
                --// settings
                local fov_color = flags["legit_silent_field_of_view_color"];
				local fov_transparency = flags["legit_silent_field_of_view_transparency"];

                --// outside
                drawings.silent_fov_outside.Visible = true;
                drawings.silent_fov_outside.Radius = fov_radius * 3;
                drawings.silent_fov_outside.Color = fov_color;
                drawings.silent_fov_outside.Position = user_input_service:GetMouseLocation();

                --// inside
                drawings.silent_fov_inside.Visible = true;
                drawings.silent_fov_inside.Radius = fov_radius * 3;
                drawings.silent_fov_inside.Color = fov_color;
                drawings.silent_fov_inside.Transparency = fov_transparency;
                drawings.silent_fov_inside.Position = user_input_service:GetMouseLocation();
            else
                if drawings.silent_fov_inside.Visible then
                    drawings.silent_fov_outside.Visible = false;
                    drawings.silent_fov_inside.Visible = false;
                end;
            end;

            if (silent_enabled and (tracer_enabled) and (locals.silent_aim.is_targetting and locals.silent_aim.target)) then
                local mouse_position = user_input_service:GetMouseLocation();
                local predicted_position = utility.world_to_screen(game.PlaceId == hood_customs and locals.silent_aim.predicted_position - Vector3.new(25, 100, 25) or locals.silent_aim.predicted_position);
                local tracer_color = flags["legit_silent_aim_tracer_color"];
                local tracer_thickness = flags["legit_silent_aim_tracer_thickness"];
				local tracer_transparency = flags["legit_silent_aim_tracer_transparency"];

                drawings.silent_tracer.Visible = predicted_position.on_screen;
                drawings.silent_tracer.From = mouse_position;
                drawings.silent_tracer.To = predicted_position.position;
                drawings.silent_tracer.Color = tracer_color;
                drawings.silent_tracer.Transparency = tracer_transparency;
                drawings.silent_tracer.Thickness = tracer_thickness;
            else
                if drawings.silent_tracer.Visible then
                    drawings.silent_tracer.Visible = false;
                end;
            end;
        end);
    end;

    --// rage connections
    do
        --// target aim connections
        do
            utility.new_connection(run_service.Heartbeat, function()
                local target_aim_enabled = flags["rage_target_aim_enabled"];
                local fov_enabled = flags["rage_target_aim_use_field_of_view"];
                local fov_radius = flags["rage_target_aim_field_of_view_radius"];
                local visualize_fov = flags["rage_target_aim_visualize_field_of_view"];
                local visuals_enabled = flags["rage_target_aim_visuals_enabled"];
                local tracer_enabled = flags["rage_target_aim_tracer_enabled"];
                local chams_enabled = flags["rage_target_aim_chams_enabled"];
				local fov_transparency = flags["rage_target_aim_field_of_view_transparency"];
				local dot_enabled = flags["rage_target_aim_dot_enabled"];
				local auto_shoot_enabled = flags["rage_target_aim_auto_shoot"];		
				local look_at_enabled = flags["rage_target_aim_look_at"];
				local ui_enabled = flags["rage_target_aim_visuals_ui_enabled"];
				local ui_type = flags["rage_target_aim_ui_mode"];

				local target = locals.target_aim.target;
				local is_targetting = locals.target_aim.is_targetting;

                if (target_aim_enabled and (is_targetting and target)) then
                    locals.target_aim.predicted_position = target_aim.get_predicted_position();
                end;
				
                if (target_aim_enabled and (fov_enabled and visualize_fov)) then
                    --// settings
                    local fov_color = flags["rage_target_aim_field_of_view_color"];

                    --// outside
                    drawings.target_fov_outside.Visible = true;
                    drawings.target_fov_outside.Radius = fov_radius * 3;
                    drawings.target_fov_outside.Color = fov_color;
                    drawings.target_fov_outside.Position = user_input_service:GetMouseLocation();

                    --// inside
                    drawings.target_fov_inside.Visible = true;
                    drawings.target_fov_inside.Radius = fov_radius * 3;
                    drawings.target_fov_inside.Color = fov_color;
                    drawings.target_fov_inside.Transparency = fov_transparency;
                    drawings.target_fov_inside.Position = user_input_service:GetMouseLocation();
                else
                    if drawings.target_fov_outside.Visible then
                        drawings.target_fov_outside.Visible = false;
                        drawings.target_fov_inside.Visible = false;
                    end;
                end;

				if (target_aim_enabled and (visuals_enabled and ui_enabled) and (is_targetting and target and utility.has_character(target))) then
					local screen_pos = utility.world_to_screen(target.Character.HumanoidRootPart.Position);
					
					if (ui_type == "Follow") then
						local tween_info = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0);
						local tween = tween_service:Create(instances["target_ui"]["frame"], tween_info, {Position = UDim2.fromOffset(screen_pos.position.X, screen_pos.position.Y)});
						tween:Play();
					end;
				
					local health_inline = instances["target_ui"]["health_inline"];
					local armor_inline = instances["target_ui"]["armor_inline"];

					local health_percent = target.Character.Humanoid.Health / target.Character.Humanoid.MaxHealth;
					health_inline.Size = UDim2.new(health_percent, 0, 1, 0);

					local armor_percent = dahood.get_armor(target) / 100;
					armor_inline.Size = UDim2.new(armor_percent, 0, 1, 0);
				end;

				if (target_aim_enabled and (visuals_enabled and dot_enabled) and (is_targetting and target) and utility.has_character(target)) then
                    local predicted_position = utility.world_to_screen(game.PlaceId == hood_customs and locals.target_aim.predicted_position - Vector3.new(25, 100, 25) or locals.target_aim.predicted_position);
                    local dot_color = flags["rage_target_aim_dot_color"];
					local dot_size = flags["rage_target_aim_dot_size"];

                    drawings.target_dot.Visible = predicted_position.on_screen;
                    drawings.target_dot.Position = predicted_position.position;
                    drawings.target_dot.Color = dot_color;
                    drawings.target_dot.Radius = dot_size;
                else
                    if drawings.target_dot.Visible then
                        drawings.target_dot.Visible = false;
                    end;
                end;

                if (target_aim_enabled and (visuals_enabled and tracer_enabled) and (is_targetting and target) and utility.has_character(target)) then
                    local mouse_position = user_input_service:GetMouseLocation();
                    local predicted_position = utility.world_to_screen(game.PlaceId == hood_customs and locals.target_aim.predicted_position - Vector3.new(25, 100, 25) or locals.target_aim.predicted_position);
                    local tracer_color = flags["rage_target_aim_tracer_color"];
                    local tracer_thickness = flags["rage_target_aim_tracer_thickness"];

                    drawings.target_tracer.Visible = predicted_position.on_screen;
                    drawings.target_tracer.From = mouse_position;
                    drawings.target_tracer.To = predicted_position.position;
                    drawings.target_tracer.Color = tracer_color;
                    drawings.target_tracer.Thickness = tracer_thickness;
                else
                    if drawings.target_tracer.Visible then
                        drawings.target_tracer.Visible = false;
                    end;
                end;

                if (target_aim_enabled and (visuals_enabled and chams_enabled) and (is_targetting and target) and utility.has_character(target)) then
                    local fill_color = flags["rage_target_aim_chams_fill_color"];
                    local outline_color = flags["rage_target_aim_chams_outline_color"];

                    instances.target_chams.Parent = target.Character;
                    instances.target_chams.OutlineColor = outline_color;
                    instances.target_chams.FillColor = fill_color;
                else
                    instances.target_chams.Parent = nil;
                end;

				if ((target_aim_enabled and look_at_enabled) and (is_targetting and target and utility.has_character(target))) then
                    local_player.Character.HumanoidRootPart.CFrame = CFrame.new(local_player.Character.HumanoidRootPart.CFrame.Position, Vector3.new(target.Character.HumanoidRootPart.CFrame.X, local_player.Character.HumanoidRootPart.CFrame.Position.Y, target.Character.HumanoidRootPart.CFrame.Z));
                end;

				if (target_aim_enabled and auto_shoot_enabled and (is_targetting and target) and utility.has_character(target) and locals.gun.current_tool and (tick() - locals.old_ticks.auto_shoot_tick >= 0.1)) then
					local is_behind_wall = utility.is_player_behind_a_wall(target);
					local is_knocked = dahood.is_knocked(target);

					if (not is_behind_wall or is_knocked) then
						locals.gun.current_tool:Activate();
					end;

					locals.old_ticks.auto_shoot_tick = tick();
				end;
			end);

            utility.new_connection(run_service.Heartbeat, function()
                local target_aim_enabled = flags["rage_target_aim_enabled"];
                local target_aim_teleport_enabled = flags["rage_target_aim_teleport_enabled"];
                local target_aim_teleport_keybind_active = flags["rage_target_aim_teleport_keybind"];
                local target_aim_teleport_destroy_cheaters_bypass = flags["rage_target_aim_bypass_destroy_cheaters"];
				local target = locals.target_aim.target;
				local is_targetting = locals.target_aim.is_targetting;

                if ((target_aim_enabled and target_aim_teleport_enabled and target_aim_teleport_keybind_active) and (is_targetting and target and utility.has_character(target)) and (not target_aim_teleport_destroy_cheaters_bypass or target_aim_teleport_destroy_cheaters_bypass and target.Character.HumanoidRootPart.CFrame.Position.Y >= -10000)) then
                    local target_aim_teleport_type = flags["rage_target_aim_teleport_type"];
                    local target_aim_teleport_randomization = flags["rage_target_aim_teleport_randomization"];
                    local target_aim_teleport_strafe_speed = flags["rage_target_aim_teleport_strafe_speed"];
                    local target_aim_teleport_strafe_distance = flags["rage_target_aim_teleport_strafe_distance"];
                    local target_aim_teleport_strafe_height = flags["rage_target_aim_teleport_strafe_height"];

                    local cframe;

                    if (target_aim_teleport_type == "Random") then
                        cframe = target.Character.HumanoidRootPart.CFrame + custom_math.random_vector3(target_aim_teleport_randomization);
                    elseif (target_aim_teleport_type == "Strafe") then
                        local current_time = tick();
                        cframe = CFrame.new(target.Character.HumanoidRootPart.Position) * CFrame.Angles(0, 2 * math.pi * current_time * target_aim_teleport_strafe_speed % (2 * math.pi), 0) * CFrame.new(0, target_aim_teleport_strafe_height, target_aim_teleport_strafe_distance);
                    end;

                    local_player.Character.HumanoidRootPart.CFrame = cframe;
                end;
            end);

			--// target changed connection
			utility.new_connection(signals.target_target_changed, function(target, is_targetting)
				local spectate_enabled = flags["rage_target_aim_spectate"];
				local notify_enabled = flags["rage_target_aim_notify"];
				local notify_duration = flags["rage_target_aim_notify_duration"];
				local ui_enabled = flags["rage_target_aim_visuals_ui_enabled"];

				if (spectate_enabled and (target and is_targetting)) then
					camera.CameraSubject = target.Character.Humanoid;
				else
					camera.CameraSubject = local_player.Character.Humanoid;
				end;

				if (notify_enabled) then
					local message = is_targetting and string.format("Targeting %s", target.DisplayName) or "Untargeting";
					library:Notification(message, notify_duration);
				end;

				if (ui_enabled) then
					screen_gui.Enabled = is_targetting;
					instances["target_ui"]["player_name"].Text = is_targetting and target.DisplayName or "None";
					instances["target_ui"]["main_image"].Image = is_targetting and players:GetUserThumbnailAsync(target.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100) or "rbxassetid://111122112";
				end;
			end);
        end;

        --// misc rage
        do
            utility.new_connection(run_service.Heartbeat, function(delta_time)
                local cframe_speed_enabled = flags["rage_cframe_speed_enabled"];
                local cframe_speed_keybind = flags["rage_cframe_speed_keybind"];
                local no_jump_cooldown = flags["rage_misc_movement_no_jump_cooldown"];
				local cframe_fly_enabled = flags["rage_cframe_fly_enabled"];
				local cframe_fly_keybind = flags["rage_cframe_fly_keybind"];
				local cframe_fly_speed = flags["rage_cframe_fly_amount"];

                if ((cframe_speed_enabled and cframe_speed_keybind) and utility.has_character(local_player)) then
                    local speed = flags["rage_cframe_speed_amount"];
                    local root_part = local_player.Character.HumanoidRootPart;
                    local humanoid = local_player.Character.Humanoid;

                    root_part.CFrame = root_part.CFrame + humanoid.MoveDirection * speed;
                end;

				if (cframe_fly_enabled and cframe_fly_keybind and utility.has_character(local_player)) then --// credits to xander
					local move_direction = local_player.Character.Humanoid.MoveDirection;
					local hrp = local_player.Character.HumanoidRootPart;

					local add = Vector3.new(0, (user_input_service:IsKeyDown(Enum.KeyCode.Space) and cframe_fly_speed /  8 or user_input_service:IsKeyDown(Enum.KeyCode.LeftShift) and -cframe_fly_speed / 8) or 0, 0);

					hrp.CFrame = hrp.CFrame + (move_direction * delta_time) * cframe_fly_speed * 10;
					hrp.CFrame = hrp.CFrame + add;
					hrp.Velocity = (hrp.Velocity * Vector3.new(1, 0, 1)) + Vector3.new(0, 1.9, 0);
				end;

                if (no_jump_cooldown and utility.has_character(local_player)) then
                    local_player.Character.Humanoid.UseJumpPower = false;
                end;
            end);
        end;

		--// visuals
		do
			utility.new_connection(run_service.Heartbeat, function()
				local clone_chams_enabled = flags["visuals_clone_chams_enabled"];
				local clone_chams_duration = flags["visuals_clone_chams_duration"]
				local local_player_chams_enabled = flags["visuals_player_chams_enabled"];
				local local_player_chams_fill_color = flags["visuals_player_chams_fill_color"];
				local local_player_chams_outline_color = flags["visuals_player_chams_outline_color"];

				if (clone_chams_enabled and (tick() - locals.old_ticks.clone_chams_tick >= clone_chams_duration)) then
					locals.old_ticks.clone_chams_tick = tick();

					local players_apply = {
						["Local Player"] = local_player,
						["Target Aim Target"] = locals.target_aim.target
					};
				
					local to_apply_table = flags["visuals_clone_chams_to_apply"]

					for i = 1, #to_apply_table do
						local to_apply = to_apply_table[i];
						local player = players_apply[to_apply];
						if (player) then
							local color = flags["visuals_clone_chams_color"];
							local transparency = flags["visuals_clone_chams_transparency"];

							local model = utility.clone_character(player, transparency, color, "ForceField", true);
							
							task.delay(clone_chams_duration, function()
								model:Destroy();
							end);
						end;
					end;
				end;

				if (local_player_chams_enabled and utility.has_character(local_player)) then
					instances.local_chams.Parent = local_player.Character
					instances.local_chams.FillColor = local_player_chams_fill_color;
					instances.local_chams.OutlineColor = local_player_chams_outline_color;
				else
					instances.local_chams.Parent = nil
				end;
			end);

			utility.new_connection(run_service.Heartbeat, function()
				local enabled = flags["visuals_text_enabled"];
				local color = flags["visuals_text_color"]:ToHex();
				local cursor_offset_y = flags["visuals_text_cursor_offset"];
				local custom_text = flags["visuals_cursor_custom_text_text"];
				local custom_text_enabled = flags["visuals_text_custom_text"];

				if (enabled) then
					screen_gui_2.Enabled = true;
					local text_label = instances["local_text"];
					local mouse_position = user_input_service:GetMouseLocation();
					local actual_color = `#{color}`;
					local text_color = actual_color ~= "#nil" and actual_color or "#cfe300";

					local text = custom_text_enabled and '<font color="' .. text_color .. '">' .. features.get_text(custom_text) .. '</font>' or '<font color="' .. text_color .. '">starhook</font><font color="rgb(255, 255, 255)">.club</font>';
					text_label.Text = text;
					text_label.Position = UDim2.new(0, mouse_position.X, 0, mouse_position.Y + cursor_offset_y);
				else
					screen_gui_2.Enabled = false;
				end;
			end);
		end;

		--// anti aim
		do
			--// velocity spoofer
			utility.new_connection(run_service.Heartbeat, function()
				local enabled = flags["anti_aim_velocity_spoofer_enabled"];
				local keybind = flags["anti_aim_velocity_spoofer_keybind"];

				if (enabled and keybind and utility.has_character(local_player)) then
					local type = flags["anti_aim_velocity_spoofer_type"];

					local hrp = local_player.Character.HumanoidRootPart
					local old_velocity = hrp.Velocity;
					
					local new_velocity;

					if (type == "Local Strafe") then
						local strafe_speed = flags["anti_aim_velocity_spoofer_strafe_speed"];
						local strafe_distance = flags["anti_aim_velocity_spoofer_strafe_distance"] * 10;
                        local current_time = tick();

						new_velocity = Vector3.new(math.cos(2 * math.pi * current_time * strafe_speed % (2 * math.pi)) * strafe_distance, 0, math.sin(2 * math.pi * current_time * strafe_speed % (2 * math.pi)) * strafe_distance)
					elseif (type == "Static") then
						local x = flags["anti_aim_velocity_spoofer_static_x"];
						local y = flags["anti_aim_velocity_spoofer_static_y"];
						local z = flags["anti_aim_velocity_spoofer_static_z"];
						
						new_velocity = Vector3.new(x, y, z);
					elseif (type == "Random") then
						local randomization = flags["anti_aim_velocity_spoofer_randomization"];

						new_velocity = custom_math.random_vector3(randomization * 1000); 
					end;

					hrp.Velocity = new_velocity;
					run_service.RenderStepped:Wait();
					hrp.Velocity = old_velocity;
				end;
			end);

			--// network desync
			utility.new_connection(run_service.Heartbeat, function()
				local enabled = flags["anti_aim_network_desync_enabled"];
				local amount = flags["anti_aim_network_desync_amount"];

				if (enabled and ((tick() - locals.old_ticks.network_desync_tick) >= (amount / 1000))) then
					locals.network_should_sleep = not locals.network_should_sleep;
					sethiddenproperty(local_player.Character.HumanoidRootPart, "NetworkIsSleeping", locals.network_should_sleep);
					locals.old_ticks.network_desync_tick = tick();
				end;
			end);

			--// csynchoronioastions 🔥
			utility.new_connection(run_service.Heartbeat, function()
				local enabled = flags["anti_aim_c_sync_enabled"];
				local keybind = flags["anti_aim_c_sync_keybind"];
				local c_sync_type = flags["anti_aim_c_sync_type"];
				local static_x = flags["anti_aim_c_sync_static_x"];
				local static_y = flags["anti_aim_c_sync_static_y"];
				local static_z = flags["anti_aim_c_sync_static_z"];
				local randomization = flags["anti_aim_c_sync_randomization"];
				local visualize_enabled = flags["anti_aim_c_sync_visualize_enabled"];
				local visualize_types = flags["anti_aim_c_sync_visualize_types"];
				local visualize_color = flags["anti_aim_c_sync_visualize_color"];
				local visualize_dot_size = flags["anti_aim_c_sync_dot_size"];

				--// starhook classics
				local classics_enabled = flags["anti_aim_starhook_classics_enabled"];
				local classics_keybind = flags["anti_aim_starhook_classics_keybind"];
				local classics_types = flags["anti_aim_starhook_classics"];

				if ((enabled or classics_enabled) and (keybind or classics_keybind) and (not (classics_keybind and classics_enabled and classics_types == "supercoolboi34 Destroyer") or (classics_keybind and classics_enabled and classics_types == "supercoolboi34 Destroyer"))) then
					local hrp = local_player.Character.HumanoidRootPart;

					local spoofed_cframe = hrp.CFrame;

					local is_targetting = (locals.target_aim.is_targetting and locals.target_aim.target);

					local types = {
						["Static Local"] = hrp.CFrame + Vector3.new(static_x, static_y, static_z),
						["Static Target"] = is_targetting and locals.target_aim.target.Character.HumanoidRootPart.CFrame + Vector3.new(static_x, static_y, static_z) or hrp.CFrame,
						["Local Random"] = hrp.CFrame + custom_math.random_vector3(randomization),
						["Target Random"] = is_targetting and locals.target_aim.target.Character.HumanoidRootPart.CFrame + custom_math.random_vector3(randomization) or hrp.CFrame,
						["Destroy Cheaters"] = hrp.CFrame + Vector3.new(0 / 0, 1, math.huge),
						["supercoolboi34 Destroyer"] = locals.should_starhook_destroy and hrp.CFrame + Vector3.new(0 / 0, 1, math.huge) or hrp.CFrame
					};
					
					local desync_type = (classics_enabled and classics_keybind and (classics_types == "Destroy Cheaters" and types["Destroy Cheaters"] or classics_types == "supercoolboi34 Destroyer" and types["supercoolboi34 Destroyer"] or types[classics_types])) or (enabled and keybind and types[c_sync_type]);
					

					locals.original_position = hrp.CFrame;

					if (visualize_enabled and table.find(visualize_types, "Tracer") and typeof(desync_type) == "CFrame") then
						local hrp_pos = utility.world_to_screen(hrp.Position);
						local desynced_pos = utility.world_to_screen(desync_type.Position);

						drawings.c_sync_tracer.Visible = true;
						drawings.c_sync_tracer.From = Vector2.new(hrp_pos.position.X, hrp_pos.position.Y);
						drawings.c_sync_tracer.To = Vector2.new(desynced_pos.position.X, desynced_pos.position.Y);
						drawings.c_sync_tracer.Color = visualize_color;
					else
						drawings.c_sync_tracer.Visible = false;
					end;

					if (visualize_enabled and table.find(visualize_types, "Dot") and typeof(desync_type) == "CFrame") then
						local desynced_pos = utility.world_to_screen(desync_type.Position);

						drawings.c_sync_dot.Visible = true;
						drawings.c_sync_dot.Color = visualize_color;
						drawings.c_sync_dot.Position = desynced_pos.position;
						drawings.c_sync_dot.Radius = visualize_dot_size;
					else
						drawings.c_sync_dot.Visible = false;
					end;

					if (visualize_enabled and table.find(visualize_types, "Character") and typeof(desync_type) == "CFrame") then
						instances.c_sync_chams.Parent = workspace;
						features.update_c_sync_char(desync_type, visualize_color);
					else
						if instances.c_sync_chams.Parent ~= nil then
							instances.c_sync_chams.Parent = nil;
						end;
					end;
					
					hrp.CFrame = desync_type;

					run_service.RenderStepped:Wait();
					hrp.CFrame = locals.original_position;
				else
					if instances.c_sync_chams.Parent ~= nil then
						instances.c_sync_chams.Parent = nil;
					end;
					drawings.c_sync_tracer.Visible = false;
					drawings.c_sync_dot.Visible = false;
				end;
			end);

			task.spawn(function()
				while task.wait(0.1) do
					locals.should_starhook_destroy = not locals.should_starhook_destroy;
				end;
			end);

			--// invis desync
			--[[utility.new_connection(run_service.Heartbeat, function()
				local classics_enabled = flags["anti_aim_starhook_classics_enabled"];
				local classics_keybind = flags["anti_aim_starhook_classics_keybind"];
				local classics_types = flags["anti_aim_starhook_classics"];

				if ((classics_enabled and classics_keybind) and classics_types == "Revert Desync") then

				end;
			end);--]]
		end;
    end;

	--// rocket tp

	if (table.find(dahood_ids, game.PlaceId)) then
		utility.new_connection(workspace.Ignored.ChildAdded, function(object)
			if (flags["rage_target_aim_enabled"] and flags["rage_target_aim_rocket_tp_enabled"] and (locals.target_aim.is_targetting and locals.target_aim.target) and utility.has_character(locals.target_aim.target) and (object.Name == "Model" or object.Name == "GrenadeLauncherAmmo")) then
				local is_grenade_launcher = object.Name == "GrenadeLauncherAmmo";
				local target = locals.target_aim.target;

				local part = is_grenade_launcher and object:WaitForChild("Main") or object:WaitForChild("Launcher");
		
				part.CFrame = CFrame.new(1, 1, 1);

				if (not is_grenade_launcher) then
					part.BodyVelocity:Destroy();
					part.TouchInterest:Destroy();
				end;
		
				local connection = utility.new_connection(run_service.Heartbeat, function()
					if ((locals.target_aim.is_targetting and target) and utility.has_character(target)) then
						part.CFrame = target.Character.HumanoidRootPart.CFrame;
						part.Velocity = Vector3.new(0, 0.001, 0);
					end;
				end);

				utility.new_connection(object.Destroying, function()
					connection:Disconnect();
				end);
			end;
		end);
	end;

    --// gun connections
    do
		local get_closest_player = function(radius, position)
			local actual_radius = radius;
			local closest_player;

			local all_players = players:GetPlayers();

			for i = 1, #all_players do
				local player = all_players[i];

				if (player == local_player) then continue end;

				if (not (utility.has_character(player))) then continue end;

				local hrp = player.Character.HumanoidRootPart;
				local distance = (hrp.Position - position).Magnitude;

				if (distance <= actual_radius) then
					actual_radius = distance;
					closest_player = player;
				end;
			end;

			return closest_player;
		end;

        local add_character = function(character)
            --// main child added connection
            utility.new_connection(character.ChildAdded, function(object)
                local gun = dahood.get_gun(local_player);

                if (not (gun)) then return end;

                if object == gun.tool then
					connections.gun["activated"] = utility.new_connection(gun.tool.Activated, function()
                        script_addon.events["gun_activated"]:Fire();

                        if (flags["legit_silent_enabled"] and flags["legit_silent_anti_aim_viewer"] and (locals.silent_aim.is_targetting and locals.silent_aim.target)) then
                            remote:FireServer(mouse_argument, locals.silent_aim.predicted_position);
                        end;

						if (flags["legit_silent_enabled"] and not flags["legit_silent_anti_aim_viewer"] and (locals.silent_aim.is_targetting and locals.silent_aim.target)) then
                            remote:FireServer(mouse_argument, locals.silent_aim.predicted_position);
						end;
			
						if (flags["rage_target_aim_enabled"] and (locals.target_aim.is_targetting and locals.target_aim.target)) then
							remote:FireServer(mouse_argument, locals.target_aim.predicted_position);
						end;
                    end);


                    connections.gun["shot"] = utility.new_connection(gun.ammo.Changed, function()
                        local new_ammo = gun.ammo.Value;
                        if (new_ammo < locals.gun.previous_ammo) then
                            locals.gun.recently_shot = true;
                            task.wait();
                            locals.gun.recently_shot = false;
                        end;

                        locals.gun.previous_ammo = gun.ammo.Value;
                    end);
                end;

                locals.gun.current_tool = gun.tool;
            end);

            --// main child removed connection
            utility.new_connection(character.ChildRemoved, function(object)
                if object == locals.gun.current_tool then

					local gun_connections = connections.gun;
                    for i = 1, #gun_connections do
						local connection = gun_connections[i];
                        connection:Disconnect();
                    end;

					connections.gun = {};
					locals.gun.previous_ammo = 999;
					locals.gun.current_tool = nil;
                end;
            end);
        end;

        utility.new_connection(local_player.CharacterAdded, function(character)
            add_character(character);

			character:WaitForChild("Humanoid");
			
			local material = flags["visuals_player_material_type"];
			local material_enabled = flags["visuals_player_material_enabled"];

			features.local_material(material_enabled, material);
        end);

        add_character(local_player.Character);

        --// main bullets
        if (bullet_path) then
            child_added = utility.new_connection(bullet_path.ChildAdded, function(object)
                if object.name == bullet_name and locals.gun.recently_shot then
                    local gun_beam = object:WaitForChild(bullet_beam_name);
                    local start_pos, end_pos = object.Position, gun_beam.Attachment1.WorldPosition;

                    local bullet_tracers_enabled = flags["visuals_bullet_tracers_enabled"];
                    local bullet_impacts_enabled = flags["visuals_bullet_impacts_enabled"];
                    local hit_detection_enabled = flags["visuals_hit_detection_enabled"];

                    if (bullet_tracers_enabled) then
                        gun_beam:Destroy();
                        local gradient_color_1 = flags["visuals_bullet_tracers_color_gradient_1"];
                        local gradient_color_2 = flags["visuals_bullet_tracers_color_gradient_2"];
                        local duration = flags["visuals_bullet_tracers_duration"];
                        local fade_enabled = flags["visuals_bullet_tracers_fade_enabled"];
                        local fade_duration = flags["visuals_bullet_tracers_fade_duration"];
                        
                        utility.create_beam(start_pos, end_pos, gradient_color_1, gradient_color_2, duration, fade_enabled, fade_duration);
                    end;

                    if (bullet_impacts_enabled) then
                        local color_picker = flags["visuals_bullet_impacts_color"];
                        local size = flags["visuals_bullet_impacts_size"];
                        local duration = flags["visuals_bullet_impacts_duration"];
                        local fade_enabled = flags["visuals_bullet_impacts_fade_enabled"];
                        local fade_duration = flags["visuals_bullet_impacts_fade_duration"];
                        local color = color_picker;

                        utility.create_impact(color, size, fade_enabled, fade_duration, duration, end_pos);
                    end;

                    if (hit_detection_enabled) then
                        local player = get_closest_player(10, end_pos);
						
                        task.wait();

						local has_blood_splatter, part = dahood.has_blood_splatter(player);

                        if (not (has_blood_splatter)) then return end;

						local hit_sounds_enabled = flags["visuals_hit_detection_sounds_enabled"];
						local sound_to_play = flags["visuals_hit_detection_sounds_which_sound"];
						local sound_volume = flags["visuals_hit_detection_sounds_volume"];
						local chams_enabled = flags["visuals_hit_detection_chams_enabled"];
						local chams_color = flags["visuals_hit_detection_chams_color"];
						local chams_transparency = flags["visuals_hit_detection_chams_transparency"];
						local chams_duration = flags["visuals_hit_detection_chams_duration"];
						local effects_enabled = flags["visuals_hit_detection_effects_enabled"];
						local effects_color = flags["visuals_hit_detection_effects_color"];
						local effects_which = flags["visuals_hit_detection_effects_which_effect"];
						local notifications_enabled = flags["visuals_hit_detection_notification"];
						local notifications_duration = flags["visuals_hit_detection_notification_duration"];

						if (hit_sounds_enabled) then
							local sound = hitsounds[sound_to_play];
							utility.play_sound(sound_volume, sound);
						end;

						if (chams_enabled) then
							local new_character = utility.clone_character(player, chams_transparency, chams_color, "Neon");

							task.delay(chams_duration, function()
								new_character:Destroy();
							end);
						end;

						if (effects_enabled) then

							if (effects_which == "Bubble") then
								hit_effects.bubble(player.Character.HumanoidRootPart.Position, effects_color);
							elseif (effects_which == "Confetti") then
								hit_effects.confetti(player.Character.HumanoidRootPart.Position)
							end;

						end;

						if (notifications_enabled) then
							library:Notification(string.format("Hit %s in %s", player.DisplayName, part.Name), notifications_duration);
						end;
					end;
                end;
            end);
        end;
    end;
end;

if (ESP) then
	local esp = {}; do
		esp.players = {};
	
		esp.add_player = function(player)
			local new_esp = {
				box_outline = utility.drawing_new("Square", {
					Thickness = 3,
					Filled = false,
					Visible = false
				}),
				box_inline = utility.drawing_new("Square", {
					Thickness = 1,
					Filled = false,
					Visible = false
				}),
				name = utility.drawing_new("Text", {
					Outline = true,
					Center = true,
					Size = 13,
					Visible = false
				}),
				head_dot_outline = utility.drawing_new("Circle", {
					Radius = 10,
					Thickness = 3,
					Visible = false,
					Color = Color3.new(0, 0, 0)
				}),
				head_dot_inline = utility.drawing_new("Circle", {
					Radius = 10,
					Thickness = 1,
					Visible = false
				}),
				health_bar_outline = utility.drawing_new("Line", {
					Thickness = 3,
					Visible = false,
					Color = Color3.new(0, 0, 0)
				}),
				health_bar_inline = utility.drawing_new("Line", {
					Thickness = 1,
					Visible = false
				}),
				health_text = utility.drawing_new("Text", {
					Color = Color3.new(1, 1, 1),
					Size = 12,
					Outline = true,
					Center = true
				}),
				armor_bar_outline = utility.drawing_new("Line", {
					Thickness = 3,
					Visible = false,
					Color = Color3.new(0, 0, 0)
				}),
				armor_bar_inline = utility.drawing_new("Line", {
					Thickness = 1,
					Visible = false
				})
			};
			
			esp.players[player] = new_esp;
		end;
		
		esp.remove_player = function(player)			
			for _, drawing in esp.players[player] do
				drawing:Remove();
			end;

			esp.players[player] = nil;
		end;
		
		utility.new_connection(players.PlayerAdded, function(player)
			esp.add_player(player);
		end);
		
		utility.new_connection(players.PlayerRemoving, function(player)
			esp.remove_player(player);
		end);
		
		local all_players = players:GetPlayers();
		
		for i = 1, #all_players do
			local player = all_players[i];
			
			if (player == local_player) then continue end;
			
			esp.add_player(player);
		end;
		
		utility.new_connection(run_service.Heartbeat, function()
			--// Settings
			local esp_enabled = flags["visuals_esp_enabled"];
			local boxes_enabled = flags["visuals_esp_boxes_enabled"];
			local boxes_color = flags["visuals_esp_boxes_color"];
			local names_enabled = flags["visuals_esp_names_enabled"];
			local names_color = flags["visuals_esp_names_color"];
			local head_dots_enabled = flags["visuals_esp_head_dots_enabled"];
			local head_dots_color = flags["visuals_esp_head_dots_color"];
			local head_dots_sides = flags["visuals_esp_head_dots_sides"];
			local head_dots_size = flags["visuals_esp_head_dots_size"];
			local health_bar_enabled = flags["visuals_esp_health_bar_enabled"];
			local health_bar_health_based_color = flags["visuals_esp_health_bar_health_based_color"];
			local health_bar_color = flags["visuals_esp_health_bar_color"]
			local health_text_enabled = flags["visuals_esp_health_text_enabled"];
			local health_text_color = flags["visuals_esp_health_text_color"];
			local health_text_health_based_color = flags["visuals_esp_health_text_health_based_color"];
			local armor_bar_enabled = flags["visuals_esp_armor_bar_enabled"];
			local armor_bar_color = flags["visuals_esp_armor_bar_color"];
			local boxes_target_color_enabled = flags["visuals_esp_boxes_target_color_enabled"];
			local boxes_target_color = flags["visuals_esp_boxes_target_color"];

			local players = esp.players;
	
			for player, esp in players do
				if (not (utility.has_character(player))) then continue end;
				
				local character = player.Character;
				local hrp = character:FindFirstChild("HumanoidRootPart");
				local head = character:FindFirstChild("Head");
	
				if (not (hrp)) then continue end;
				if (not (head)) then continue end;
	
				local screen_pos = utility.world_to_screen(hrp.Position);
				local screen_pos_head = utility.world_to_screen(head.Position);
	
				local adjust_x = screen_pos.position.X - (esp.box_inline.Size.X / 2);
				local adjust_y = screen_pos.position.Y - (esp.box_inline.Size.Y / 2);
	
				local scale = 1000 / (camera.CFrame.Position - hrp.Position).Magnitude;
				
				local box_position = Vector2.new(adjust_x, adjust_y);
				local box_size = Vector2.new(3 * scale, 4.5 * scale);
				
				local outline_offset = -2;
				local box_outline_size = Vector2.new(box_size.X + outline_offset, box_size.Y + outline_offset);
				local box_outline_position = Vector2.new(adjust_x - (outline_offset / 2), adjust_y - (outline_offset / 2));
				
				local target = locals.target_aim.target;
				local is_targetting = locals.target_aim.is_targetting;

				if (esp_enabled and boxes_enabled and screen_pos.on_screen) then
					esp.box_outline.Size = box_outline_size;
					esp.box_outline.Position = box_outline_position;
					esp.box_inline.Size = box_size;
					esp.box_inline.Position = box_position;
					esp.box_inline.Color = (boxes_target_color_enabled and is_targetting and target == player) and boxes_target_color or boxes_color;
					esp.box_inline.Visible = true;
					esp.box_outline.Visible = true;
				else
					esp.box_inline.Visible = false;
					esp.box_outline.Visible = false;
				end;
				
				if (esp_enabled and names_enabled and screen_pos.on_screen) then
					esp.name.Visible = true;
					esp.name.Text = player.DisplayName;
					esp.name.Position = Vector2.new(box_size.X / 2 + box_position.X, box_position.Y - 16);
					esp.name.Color = names_color;
				else
					esp.name.Visible = false;
				end;
	
				local head_dot_size = head_dots_size;
				local head_dot_outline_size = head_dot_size + -1;
				
				if (esp_enabled and head_dots_enabled and screen_pos_head.on_screen) then
					esp.head_dot_inline.Position = screen_pos_head.position;
					esp.head_dot_inline.Radius = head_dot_size;
					esp.head_dot_inline.NumSides = head_dots_sides;
					esp.head_dot_inline.Color = head_dots_color;
					esp.head_dot_inline.Visible = true;
				
					esp.head_dot_outline.Position = screen_pos_head.position;
					esp.head_dot_outline.Radius = head_dot_outline_size;
					esp.head_dot_outline.NumSides = head_dots_sides;
					esp.head_dot_outline.Visible = true;
				else
					esp.head_dot_outline.Visible = false;
					esp.head_dot_inline.Visible = false;
				end;

				local health_percentage = player.Character.Humanoid.Health / player.Character.Humanoid.MaxHealth;
				local health_bar_height = health_percentage * box_size.Y + 1;
				
				if (esp_enabled and health_bar_enabled and screen_pos.on_screen) then
					esp.health_bar_outline.Visible = true;
					esp.health_bar_inline.Visible = true;
				
					esp.health_bar_outline.From = Vector2.new(box_position.X - 5, box_position.Y + box_size.Y + 1);
					esp.health_bar_outline.To = Vector2.new(esp.health_bar_outline.From.X, esp.health_bar_outline.From.Y - box_size.Y - 2);
					esp.health_bar_inline.From = Vector2.new(box_position.X - 5, box_position.Y + box_size.Y) ;
					esp.health_bar_inline.To = Vector2.new(box_position.X - 5, box_position.Y + box_size.Y - health_bar_height);

					if (health_bar_health_based_color) then
						esp.health_bar_inline.Color = Color3.new(1, 0, 0):Lerp(Color3.new(0, 1, 0), health_percentage);
					else
						esp.health_bar_inline.Color = health_bar_color;
					end;
				else
					esp.health_bar_outline.Visible = false;
					esp.health_bar_inline.Visible = false;
				end;
				
				if (esp_enabled and health_text_enabled and screen_pos.on_screen) then
					esp.health_text.Visible = true;
					esp.health_text.Text = tostring(math.floor(player.Character.Humanoid.Health));
					esp.health_text.Position = Vector2.new(box_position.X - 5 - esp.health_text.TextBounds.X, box_position.Y + box_size.Y - health_bar_height)

					if (health_text_health_based_color) then
						esp.health_text.Color = Color3.new(1, 0, 0):Lerp(Color3.new(0, 1, 0), health_percentage);
					else
						esp.health_text.Color = health_text_color;
					end;
				else
					esp.health_text.Visible = false;
				end;

				if (esp_enabled and armor_bar_enabled and screen_pos.on_screen) then
					local armor_percentage = dahood.get_armor(player) / 100;
					local max_bar_width = box_size.X - 2;
					local armor_bar_width = math.clamp(armor_percentage * max_bar_width, 0, max_bar_width);
				
					esp.armor_bar_outline.Visible = true;
					esp.armor_bar_inline.Visible = true;
					
					esp.armor_bar_outline.From = Vector2.new(box_position.X, box_position.Y + box_size.Y + 4);
					esp.armor_bar_outline.To = Vector2.new(box_position.X + max_bar_width, box_position.Y + box_size.Y + 4);
				
					esp.armor_bar_inline.From = Vector2.new(box_position.X + 1, box_position.Y + box_size.Y + 4);
					esp.armor_bar_inline.To = Vector2.new(box_position.X + 1 + armor_bar_width, box_position.Y + box_size.Y + 4);
				
					esp.armor_bar_inline.Color = armor_bar_color;
				else
					esp.armor_bar_outline.Visible = false;
					esp.armor_bar_inline.Visible = false;
				end;
			end;
		end);
	end;
end;

--// hooks
do
	if (hookmetamethod) then
		local __namecall; __namecall = hookmetamethod(game, "__namecall", LPH_NO_VIRTUALIZE(function(self, ...)
			local method, args = tostring(getnamecallmethod()), {...};
	
			if (not checkcaller() and method == "FireServer" and (typeof(args[1]) == "string" and typeof(args[2]) == "Vector3")) then
				if (flags["legit_silent_enabled"] and not flags["legit_silent_anti_aim_viewer"] and (locals.silent_aim.is_targetting and locals.silent_aim.target)) then
					args[2] = locals.silent_aim.predicted_position;
				end;
	
				if (flags["rage_target_aim_enabled"] and (locals.target_aim.is_targetting and locals.target_aim.target)) then
					args[2] = locals.target_aim.predicted_position;
				end;
	
				return __namecall(self, unpack(args));
			end;
	
			return __namecall(self, ...);
		end));
	
		local __newindex; __newindex = hookmetamethod(game, "__newindex", LPH_NO_VIRTUALIZE(function(self, property, value)
			local calling_script = getcallingscript();
	
			if (not (checkcaller()) and (flags["rage_exploits_enabled"] and flags["rage_exploits_no_recoil"]) and (calling_script == "Framework" or calling_script == "F") and (self == camera and property == "CFrame")) then
				return;
			end;
	
			return __newindex(self, property, value);
		end));

		local __index; __index = hookmetamethod(game, "__index", LPH_NO_VIRTUALIZE(function(self, property)
			if (not checkcaller() and ((((flags["anti_aim_c_sync_enabled"] or (flags["anti_aim_starhook_classics_enabled"] and (flags["anti_aim_starhook_classics"] == "Destroy Cheaters" or flags["anti_aim_starhook_classics"] == "supercoolboi34 Destroyer"))) and (flags["anti_aim_c_sync_keybind"] or flags["anti_aim_starhook_classics_keybind"]))) and property == "CFrame" and self == local_player.Character.HumanoidRootPart)) then
				return locals.original_position;
			end;

			return __index(self, property);
		end));
	end;
end;

do
	--// Example
	local window = library:New({
		Size = UDim2.new(0, 600, 0, 500)
	});

	local watermark = library:Watermark({Name = ""});

	window:Seperator({Name = "Combat"});
	ui.tabs["legit"] = window:Page({Name = "Legit", Icon = "http://www.roblox.com/asset/?id=6023426921"});
	ui.tabs["rage"] = window:Page({Name = "Rage", "http://www.roblox.com/asset/?id=6023426921"});
	window:Seperator({Name = "Visuals"});
	ui.tabs["world"] = window:Page({Name = "World", Icon = "http://www.roblox.com/asset/?id=6034684930"});
	ui.tabs["view"] = window:Page({Name = "View", Icon = "http://www.roblox.com/asset/?id=6031075931"});
	window:Seperator({Name = "Player"});
	ui.tabs["movement"] = window:Page({Name = "Movement", Icon = "http://www.roblox.com/asset/?id=6034754445"});
	ui.tabs["anti_aim"] = window:Page({Name = "Anti Aim", Icon = "http://www.roblox.com/asset/?id=14760676189"});
	window:Seperator({Name = "Settings"});
	ui.tabs["settings"] = window:Page({Name = "Settings", Icon = "http://www.roblox.com/asset/?id=6031280882"});

	--// legit
	do
		--// sections
		local legit_main_assist = ui.tabs["legit"]:Section({Name = "Assist", Side = "Left", Size = 420});
		local legit_silent_aim = ui.tabs["legit"]:Section({Name = "Silent Aim", Side = "Right", Size = 420});

		--// main assist
		do
			--// main assist section
			do
				local main_toggle = legit_main_assist:Toggle({Name = "Enabled", Flag = "legit_assist_enabled"});
				local main_toggle_option_list = main_toggle:OptionList({});
				main_toggle_option_list:List({Name = "Type", Flag = "legit_assist_type", Options = {"Camera", "Mouse"}, Default = "Camera"});
				main_toggle_option_list:List({Name = "Aim Part", Flag = "legit_assist_part", Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, Default = "HumanoidRootPart"});

				legit_main_assist:Keybind({Flag = "legit_assist_key", Name = "Target Bind", Default = Enum.KeyCode.E, Mode = "Toggle", Callback = function()
					local assist_enabled = flags["legit_assist_enabled"];
					local fov_enabled = flags["legit_assist_settings_use_field_of_view"];
					local fov_radius = flags["legit_assist_settings_field_of_view_radius"];
					local checks_enabled = flags["legit_assist_checks_enabled"];
					local check_values = flags["legit_assist_checks"];
					local auto_switch_enabled = flags["legit_assist_auto_switch"];

					if (not (assist_enabled)) then return end;

					local new_target = combat.get_closest_player(fov_enabled, fov_radius, checks_enabled, check_values);

					locals.assist.is_targetting = (new_target and not locals.assist.is_targetting or false);

					if (auto_switch_enabled and new_target and not locals.assist.is_targetting) then
						locals.assist.is_targetting = true;
					end;

					locals.assist.target = (locals.assist.is_targetting and new_target or nil);
				end});

				local mouse_tp_toggle = legit_main_assist:Toggle({Name = "Mouse TP", Flag = "legit_assist_mouse_tp_enabled"});


				local option_list_mouse_tp = mouse_tp_toggle:OptionList({});

				option_list_mouse_tp:Keybind({Flag = "legit_assist_mouse_tp_key", Name = "Keybind", Default = Enum.KeyCode.C, Mode = "Toggle", Callback = function()
					local assist_enabled = flags["legit_assist_enabled"];
					local mouse_tp_enabled = flags["legit_assist_mouse_tp_enabled"];
		
					if (not (assist_enabled or mouse_tp_enabled or (locals.assist.is_targetting and locals.assist.target))) then return end;

					local predicted_position = assist.get_predicted_position();
					local screen_predicted_position = utility.world_to_screen(predicted_position);
					assist.move_mouse(screen_predicted_position.position, 5);
				end});

				local smoothing_toggle = legit_main_assist:Toggle({Name = "Smoothing", Flag = "legit_assist_smoothing_enabled"});
				local smoothing_option_list = smoothing_toggle:OptionList({});
				smoothing_option_list:Slider({Name = "Smoothing Amount", Flag = "legit_assist_smoothing_amount", Default = 1, Minimum = 1, Maximum = 100, Decimals = 0.01, Ending = "%"});


				legit_main_assist:Toggle({Name = "Auto Switch", Flag = "legit_assist_auto_switch"});

				local air_aimpart_toggle = legit_main_assist:Toggle({Name = "Air Aim Part", Flag = "legit_assist_use_air_hit_part"});
				local air_aimpart_option_list = air_aimpart_toggle:OptionList({});
				air_aimpart_option_list:List({Name = "Air Aim Part", Flag = "legit_assist_air_part", Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, Default = "LowerTorso"});

				local resolver_toggle = legit_main_assist:Toggle({Name = "Resolver", Flag = "legit_assist_resolver"});
				local resolve_option_list = resolver_toggle:OptionList({});
				resolve_option_list:List({Name = "Method", Flag = "legit_assist_resolver_method", Options = {"Recalculate", "MoveDirection"}, Default = "Recalculate"});
				resolve_option_list:Slider({Name = "Update Time", Flag = "legit_assist_resolver_update_time", Default = 100, Minimum = 1, Maximum = 200, Decimals = 0.001, Ending = "ms"});

				local anti_ground_toggle = legit_main_assist:Toggle({Name = "Anti Ground Shots", Flag = "legit_assist_anti_ground_shots"});
				local anti_ground_option_list = anti_ground_toggle:OptionList({});
				anti_ground_option_list:Slider({Name = "To Take Off", Flag = "legit_assist_anti_ground_shots_to_take_off", Default = 2, Minimum = 0.1, Maximum = 10, Decimals = 0.01, Ending = "'"});

				local stutter_toggle = legit_main_assist:Toggle({Name = "Stutter", Flag = "legit_assist_stutter_enabled"});
				local stutter_option_list = stutter_toggle:OptionList({});
				stutter_option_list:Slider({Name = "Amount", Flag = "legit_assist_stutter_amount", Default = 1, Minimum = 1, Maximum = 10, Decimals = 0.01, Ending = "s"});

				local shake_toggle = legit_main_assist:Toggle({Name = "Shake", Flag = "legit_assist_shake_enabled"});
				local shake_option_list = shake_toggle:OptionList({});
				shake_option_list:Slider({Name = "Amount", Flag = "legit_assist_shake_amount", Default = 0.01, Minimum = 0.01, Maximum = 10, Decimals = 0.001, Ending = "'"});

				local checks_toggle = legit_main_assist:Toggle({Name = "Checks", Flag = "legit_assist_checks_enabled"});
				local checks_option_list = checks_toggle:OptionList({});
				checks_option_list:List({Name = "Checks", Flag = "legit_assist_checks", Options = {"Knocked", "Grabbed", "Friend", "Wall", "Vehicle"}, Default = {"Knocked"}, Max = 5});

				local fov_toggle = legit_main_assist:Toggle({Name = "Use Field Of View", Flag = "legit_assist_settings_use_field_of_view"});
				local fov_option_list = fov_toggle:OptionList({});

				fov_option_list:Colorpicker({Name = "Color", Flag = "legit_assist_settings_field_of_view_color", Default = default_color});
				fov_option_list:Slider({Name = "Radius", Flag = "legit_assist_settings_field_of_view_radius", Default = 1, Minimum = 1, Maximum = 200, Decimals = 0.01, Ending = "%"});
				fov_option_list:Slider({Name = "Transparency", Flag = "legit_assist_settings_field_of_view_transparency", Default = 0, Minimum = 0, Maximum = 1, Decimals = 0.01, Ending = "%"});

				legit_main_assist:Textbox({Name = "Prediction", Flag = "legit_assist_prediction", Default = "0.134", PlaceHolder = "Prediction"});
			end;

			--// silent aim section
			do
				legit_silent_aim:Toggle({Name = "Enabled", Flag = "legit_silent_enabled"});
				legit_silent_aim:Toggle({Name = "Closest Body Part", Flag = "legit_silent_closest_body_part"});
				legit_silent_aim:Toggle({Name = "Anti Aim Viewer", Flag = "legit_silent_anti_aim_viewer"});
				
				local resolver_toggle = legit_silent_aim:Toggle({Name = "Resolver", Flag = "legit_silent_resolver"});
				local resolver_option_list = resolver_toggle:OptionList({});
				resolver_option_list:List({Name = "Method", Flag = "legit_silent_resolver_method", Options = {"Recalculate", "MoveDirection"}, Default = "Recalculate"});
				resolver_option_list:Slider({Name = "Update Time", Flag = "legit_silent_resolver_update_time", Default = 100, Minimum = 1, Maximum = 200, Decimals = 0.001, Ending = "ms"});
				
				local fov_toggle = legit_silent_aim:Toggle({Name = "Field Of View", Flag = "legit_silent_use_field_of_view"});
				local fov_option_list = fov_toggle:OptionList({});
				fov_option_list:Toggle({Name = "Visualize", Flag = "legit_silent_visualize_field_of_view"});
				fov_option_list:Colorpicker({Name = "Color", Flag = "legit_silent_field_of_view_color", Default = default_color});
				fov_option_list:Slider({Name = "Transparency", Flag = "legit_silent_field_of_view_transparency", Default = 0, Minimum = 0, Maximum = 1, Decimals = 0.01, Ending = "%"});
				fov_option_list:Slider({Name = "Radius", Flag = "legit_silent_field_of_view_radius", Default = 1, Minimum = 1, Maximum = 200, Decimals = 0.01, Ending = "%"});
				
				local line_toggle = legit_silent_aim:Toggle({Name = "Line", Flag = "legit_silent_aim_tracer_enabled"});
				local line_option_list = line_toggle:OptionList({});
				line_option_list:Colorpicker({Name = "Color", Flag = "legit_silent_aim_tracer_color", Default = default_color});
				line_option_list:Slider({Name = "Line Thickness", Flag = "legit_silent_aim_tracer_thickness", Default = 2, Minimum = 1, Maximum = 5, Decimals = 0.01, Ending = "%"});
				line_option_list:Slider({Name = "Transparency", Flag = "legit_silent_aim_tracer_transparency", Default = 1, Minimum = 0, Maximum = 1, Decimals = 0.01, Ending = "%"});

				local checks_toggle = legit_silent_aim:Toggle({Name = "Checks", Flag = "legit_silent_use_checks"});
				local checks_option_list = checks_toggle:OptionList({});
				checks_option_list:List({Name = "Values", Flag = "legit_silent_checks", Options = {"Knocked", "Grabbed", "Friend", "Wall", "Vehicle"}, Default = {"Knocked"}, Max = 5});

				local airpart_toggle = legit_silent_aim:Toggle({Name = "Use Air Aim Part", Flag = "legit_silent_use_air_hit_part"});
				local airpart_option_list = airpart_toggle:OptionList({});
				airpart_option_list:List({Name = "Air Aim Part", Flag = "legit_silent_air_aim_part", Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, Default = "HumanoidRootPart"});

				
				local antiground_toggle = legit_silent_aim:Toggle({Name = "Anti Ground Shots", Flag = "legit_silent_anti_ground_shots"});
				local antiground_option_list = antiground_toggle:OptionList({});
				antiground_option_list:Slider({Name = "To Take Off", Flag = "legit_silent_anti_ground_shots_to_take_off", Default = 2, Minimum = 0.1, Maximum = 10, Decimals = 0.01, Ending = "'"});
				
				legit_silent_aim:List({Name = "Aim Part", Flag = "legit_silent_aim_part", Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, Default = "HumanoidRootPart"});
				legit_silent_aim:Textbox({Name = "Prediction", Flag = "legit_silent_prediction", Default = "0.134", PlaceHolder = "Prediction"});
			end;
		end;
	end;

	--// rage 
	do
		--// sections
		local rage_main_target_aim = ui.tabs["rage"]:Section({Name = "Target Aim", Side = "Left", Size = 427});
		local rage_target_aim_visuals = ui.tabs["rage"]:Section({Name = "Target Aim Visuals", Side = "Right", Size = 245});
		local rage_target_aim_teleport = ui.tabs["rage"]:Section({Name = "Target Aim Teleport", Side = "Right",  Size = 175});

		do
			local main_toggle = rage_main_target_aim:Toggle({Name = "Enabled", Flag = "rage_target_aim_enabled", Callback = function(state)
				if state then return end;

				screen_gui.Enabled = false;
			end});
			local main_toggle_option_list = main_toggle:OptionList({});
			main_toggle_option_list:Toggle({Name = "Notify", Flag = "rage_target_aim_notify"});
			main_toggle_option_list:Slider({Name = "Notify Duration", Flag = "rage_target_aim_notify_duration", Default = 2, Minimum = 1, Maximum = 10, Decimals = 0.01, Ending = "s"});
			main_toggle_option_list:Toggle({Name = "Auto Shoot", Flag = "rage_target_aim_auto_shoot"});
			main_toggle_option_list:Toggle({Name = "Look At", Flag = "rage_target_aim_look_at"});
			main_toggle_option_list:Toggle({Name = "Randomized BodyPart", Flag = "rage_target_aim_randomized_body_part"});
			--main_toggle_option_list:Toggle({Name = "Movement Simulation", Flag = "rage_target_aim_movement_simulation"});
			
			rage_main_target_aim:Keybind({Flag = "rage_target_aim_key", Default = Enum.KeyCode.E, Mode = "Toggle", Callback = function(key)
				local target_aim_enabled = flags["rage_target_aim_enabled"];
				local checks_enabled = flags["rage_target_aim_use_checks"];
				local check_values = flags["rage_target_aim_checks"];
				local fov_enabled = flags["rage_target_aim_use_field_of_view"];
				local fov_radius = flags["rage_target_aim_field_of_view_radius"];
				local auto_switch = flags["rage_target_aim_auto_switch"];

				if (not (target_aim_enabled)) then return end;

				local new_target = combat.get_closest_player(fov_enabled, fov_radius, checks_enabled, check_values);

				locals.target_aim.is_targetting = (new_target and not locals.target_aim.is_targetting or false);

				if (auto_switch and new_target and not locals.target_aim.is_targetting and locals.target_aim.target ~= new_target) then
					locals.target_aim.is_targetting = true;
				end;

				locals.target_aim.target = (locals.target_aim.is_targetting and new_target or nil);

				signals.target_target_changed:Fire(locals.target_aim.target, locals.target_aim.is_targetting);
			end});

			if (not table.find(dahood_ids, game.PlaceId)) then
				rage_main_target_aim:Toggle({Name = "Bullet Tp", Flag = "rage_target_aim_bullet_tp_enabled"});
			else
				rage_main_target_aim:Toggle({Name = "Rocket Tp", Flag = "rage_target_aim_rocket_tp_enabled"});
			end;
			
			rage_main_target_aim:Toggle({Name = "Spectate", Flag = "rage_target_aim_spectate"});
			rage_main_target_aim:Toggle({Name = "Auto Switch", Flag = "rage_target_aim_auto_switch"});
			rage_main_target_aim:Toggle({Name = "Closest Body Part", Flag = "rage_target_aim_closest_body_part"});

			local air_part_toggle = rage_main_target_aim:Toggle({Name = "Use Air Aim Part", Flag = "rage_target_aim_use_air_hit_part"});
			local air_part_option_list = air_part_toggle:OptionList({});
			air_part_option_list:List({Name = "Aim Part", Flag = "rage_target_aim_air_aim_part", Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, Default = "HumanoidRootPart"});
			local air_offset_toggle = rage_main_target_aim:Toggle({Name = "Air Offset", Flag = "rage_target_aim_use_air_offset"});
			local air_offset_option_list = air_offset_toggle:OptionList({});
			air_offset_option_list:Slider({Name = "Offset", Flag = "rage_target_aim_air_offset", Default = 4, Minimum = -10, Maximum = 10, Decimals = 0.001, Ending = "'"});
			local resolver_toggle = rage_main_target_aim:Toggle({Name = "Resolver", Flag = "rage_target_aim_resolver_enabled"});
			local resolver_option_list = resolver_toggle:OptionList({});
			resolver_option_list:List({Name = "Method", Flag = "rage_target_aim_resolver_method", Options = {"Recalculate", "MoveDirection"}, Default = "Recalculate"});
			resolver_option_list:Slider({Name = "Update Time", Flag = "rage_target_aim_update_time", Default = 100, Minimum = 1, Maximum = 200, Decimals = 0.001, Ending = "ms"});
			local checks_toggle = rage_main_target_aim:Toggle({Name = "Checks", Flag = "rage_target_aim_use_checks"});
			local checks_option_list = checks_toggle:OptionList({});
			checks_option_list:List({Name = "Checks", Flag = "rage_target_aim_checks", Options = {"Knocked", "Grabbed", "Friend", "Wall", "Vehicle"}, Default = {"Knocked"}, Max = 5});
			local anti_ground_toggle = rage_main_target_aim:Toggle({Name = "Anti Ground Shots", Flag = "rage_target_aim_anti_ground_shots"});
			local anti_ground_option_list = anti_ground_toggle:OptionList({});
			--// anti_ground_option_list:Slider({Name = "To Take Off", Flag = "rage_target_aim_anti_ground_shots_to_take_off", Default = 2, Minimum = 0.1, Maximum = 20, Decimals = 0.01, Ending = "'"});
			anti_ground_option_list:Slider({Name = "Dampening Factor", Flag = "rage_target_aim_dampening_factor", Default = 0.7, Minimum = 0, Maximum = 1, Decimals = 0.01, Ending = ""});
			local fov_toggle = rage_main_target_aim:Toggle({Name = "Field Of View", Flag = "rage_target_aim_use_field_of_view"});
			local fov_option_list = fov_toggle:OptionList({});
			fov_option_list:Toggle({Name = "Visualize", Flag = "rage_target_aim_visualize_field_of_view"});
			fov_option_list:Colorpicker({Name = "Color", Flag = "rage_target_aim_field_of_view_color", Default = default_color, Transparency = 0});
			fov_option_list:Slider({Name = "Transparency", Flag = "rage_target_aim_field_of_view_transparency", Default = 0, Minimum = 0, Maximum = 1, Decimals = 0.01, Ending = "%"});
			fov_option_list:Slider({Name = "Radius", Flag = "rage_target_aim_field_of_view_radius", Default = 1, Minimum = 1, Maximum = 200, Decimals = 0.01, Ending = "%"});

			rage_main_target_aim:Textbox({Name = "Prediction", Flag = "rage_target_aim_prediction", Default = "0.134", PlaceHolder = "Prediction"});
			rage_main_target_aim:List({Name = "Aim Part", Flag = "rage_target_aim_aim_part", Options = {"Head", "HumanoidRootPart", "UpperTorso", "LowerTorso"}, Default = "HumanoidRootPart"});
		end;

		--// target aim visuals
		do
			local main_toggle = rage_target_aim_visuals:Toggle({Name = "Enabled", Flag = "rage_target_aim_visuals_enabled"});
			local option_list_toggle = main_toggle:OptionList({});

			option_list_toggle:Toggle({Name = "UI", Flag = "rage_target_aim_visuals_ui_enabled", Callback = function(state)
				if state then return end;

				screen_gui.Enabled = false;
			end});

			option_list_toggle:List({Name = "UI Mode", Flag = "rage_target_aim_ui_mode", Options = {"Follow", "Static"}, Default = "Static"});

			rage_target_aim_visuals:Toggle({Name = "Line", Flag = "rage_target_aim_tracer_enabled"});
			local dot = rage_target_aim_visuals:Toggle({Name = "Dot", Flag = "rage_target_aim_dot_enabled"});
			local dot_option_list = dot:OptionList({});
			dot_option_list:Colorpicker({Name = "Color", Flag = "rage_target_aim_dot_color", Default = default_color, Transparency = 0});
			dot_option_list:Slider({Name = "Size", Flag = "rage_target_aim_dot_size", Default = 6, Minimum = 1, Maximum = 20, Decimals = 0.01, Ending = "%"});

			rage_target_aim_visuals:Toggle({Name = "Chams", Flag = "rage_target_aim_chams_enabled"});
			
			rage_target_aim_visuals:Colorpicker({Name = "Line Color", Info = "Target Aim Line Color", Flag = "rage_target_aim_tracer_color", Default = default_color, Transparency = 1});				

			rage_target_aim_visuals:Colorpicker({Name = "Chams Fill Color", Info = "Target Aim Chams Fill Color", Flag = "rage_target_aim_chams_fill_color", Default = default_color, Transparency = 0.5});
			rage_target_aim_visuals:Colorpicker({Name = "Chams Outline Color", Info = "Target Aim Chams Outline Color", Flag = "rage_target_aim_chams_outline_color", Default = Color3.fromRGB(0, 0, 0), Transparency = 0});


			rage_target_aim_visuals:Slider({Name = "Line Thickness", Flag = "rage_target_aim_tracer_thickness", Default = 2, Minimum = 1, Maximum = 5, Decimals = 0.01, Ending = "%"});
		end;

		--// target aim teleport
		do
			local main_toggle = rage_target_aim_teleport:Toggle({Name = "Enabled", Flag = "rage_target_aim_teleport_enabled"});
			rage_target_aim_teleport:Toggle({Name = "Bypass Destroy Cheaters", Flag = "rage_target_aim_bypass_destroy_cheaters"})	
		
			local main_toggle_optionlist = main_toggle:OptionList({});
			rage_target_aim_teleport:Keybind({Flag = "rage_target_aim_teleport_keybind", Default = Enum.KeyCode.B, KeybindName = "Target Aim Teleport", Mode = "Toggle"});
			
			rage_target_aim_teleport:List({Name = "Type", Flag = "rage_target_aim_teleport_type", Options = {"Random", "Strafe"}, Default = "Random"});
			main_toggle_optionlist:Slider({Name = "Randomization", Flag = "rage_target_aim_teleport_randomization", Default = 1, Minimum = 1, Maximum = 20, Decimals = 0.01, Ending = "%"});
			main_toggle_optionlist:Slider({Name = "Strafe Distance", Flag = "rage_target_aim_teleport_strafe_distance", Default = 1, Minimum = 1, Maximum = 20, Decimals = 0.01, Ending = "%"});
			main_toggle_optionlist:Slider({Name = "Strafe Speed", Flag = "rage_target_aim_teleport_strafe_speed", Default = 1, Minimum = 1, Maximum = 10, Decimals = 0.01, Ending = "%"});
			main_toggle_optionlist:Slider({Name = "Strafe", Flag = "rage_target_aim_teleport_strafe_height", Default = 1, Minimum = 1, Maximum = 20, Decimals = 0.01, Ending = "%"});

		end;
	end;
	
	--// movement
	do
		local cframe_speed = ui.tabs["movement"]:Section({Name = "CFrame speed", Side = "Left", Size = 125});
		local cframe_fly = ui.tabs["movement"]:Section({Name = "Fly", Side = "Left", Size = 125});
		local misc = ui.tabs["movement"]:Section({Name = "Misc", Side = "Right", Size = 100});
		
		--// speed
		do
			local main_toggle = cframe_speed:Toggle({Name = "Enabled", Flag = "rage_cframe_speed_enabled"});
			cframe_speed:Keybind({Flag = "rage_cframe_speed_keybind", Name = "Keybind", Default = Enum.KeyCode.X, Mode = "Toggle"});
			cframe_speed:Slider({Name = "Amount", Flag = "rage_cframe_speed_amount", Default = 0.3, Minimum = 0.1, Maximum = 10, Decimals = 0.01, Ending = "%"});
		end;

		--// fly
		do
			local main_toggle = cframe_fly:Toggle({Name = "Enabled", Flag = "rage_cframe_fly_enabled"});
			cframe_fly:Keybind({Flag = "rage_cframe_fly_keybind", Name = "Keybind", Default = Enum.KeyCode.C, Mode = "Toggle"});
			cframe_fly:Slider({Name = "Speed", Flag = "rage_cframe_fly_amount", Default = 1, Minimum = 1, Maximum = 30, Decimals = 0.01, Ending = "%"});
		end;

		--// misc
		do
			misc:Toggle({Name = "No Jump Cooldown", Flag = "rage_misc_movement_no_jump_cooldown", Callback = function(state)
				if (not (utility.has_character(local_player))) then return end;

                local_player.Character.Humanoid.UseJumpPower = true;
			end});

			misc:Toggle({Name = "No Seats", Callback = function(state)
				local descendants = game:GetDescendants();

				for i = 1, #descendants do
					local object = descendants[i];

					if (object.ClassName ~= "Seat") then continue end;

					object.CanTouch = not state and true or false;
				end;
			end});
		end;
	end;

	--// visuals
	do
		--// world
		do
			local visuals_bullet_tracers = ui.tabs["world"]:Section({Name = "Bullet Tracers", Side = "Left", Size = 210});
			local visuals_bullet_impacts = ui.tabs["world"]:Section({Name = "Bullet Impacts", Side = "Right", Size = 210});
			local visuals_hit_detection = ui.tabs["world"]:Section({Name = "Hit Detection", Side = "Left"});
			local visuals_clone_chams = ui.tabs["world"]:Section({Name = "Clone Chams", Side = "Right"});

			--// bullet tracers
			do
				local main_toggle = visuals_bullet_tracers:Toggle({Name = "Enabled", Flag = "visuals_bullet_tracers_enabled"});
				visuals_bullet_tracers:Toggle({Name = "Fade", Flag = "visuals_bullet_tracers_fade_enabled"});

				visuals_bullet_tracers:Colorpicker({Name = "Bullet Tracers Gradient Start", Flag = "visuals_bullet_tracers_color_gradient_1", Default = default_color, Transparency = 0});
				visuals_bullet_tracers:Colorpicker({Name = "Bullet Tracers Gradient End", Flag = "visuals_bullet_tracers_color_gradient_2", Default = default_color, Transparency = 0});

				visuals_bullet_tracers:Slider({Name = "Fade Duration", Flag = "visuals_bullet_tracers_fade_duration", Default = 2, Minimum = 0.5, Maximum = 5, Decimals = 0.001, Ending = "s"});
				visuals_bullet_tracers:Slider({Name = "Duration", Flag = "visuals_bullet_tracers_duration", Default = 2, Minimum = 0.5, Maximum = 5, Decimals = 0.001, Ending = "s"});
			end;

			--// bullet impact
			do
				local main_toggle = visuals_bullet_impacts:Toggle({Name = "Enabled", Flag = "visuals_bullet_impacts_enabled"});

				local main_toggle_option_list = main_toggle:OptionList({});
				main_toggle_option_list:Colorpicker({Name = "Bullet Impacts Color", Flag = "visuals_bullet_impacts_color", Default = default_color, Transparency = 0});	


				visuals_bullet_impacts:Toggle({Name = "Fade", Flag = "visuals_bullet_impacts_fade_enabled"});
				visuals_bullet_impacts:Slider({Name = "Size", Flag = "visuals_bullet_impacts_size", Default = 0.5, Minimum = 0.1, Maximum = 10, Decimals = 0.001, Ending = "'"});
				visuals_bullet_impacts:Slider({Name = "Fade Duration", Flag = "visuals_bullet_impacts_fade_duration", Default = 2, Minimum = 0.5, Maximum = 5, Decimals = 0.001, Ending = "s"});
				visuals_bullet_impacts:Slider({Name = "Duration", Flag = "visuals_bullet_impacts_duration", Default = 2, Minimum = 0.5, Maximum = 5, Decimals = 0.001, Ending = "s"});
			end;

			--// hit detection
			do
				local sounds = {};

				for i,v in hitsounds do
					table.insert(sounds, i);
				end;

				visuals_hit_detection:Toggle({Name = "Enabled", Flag = "visuals_hit_detection_enabled"});
				local sounds_toggle = visuals_hit_detection:Toggle({Name = "Sounds", Flag = "visuals_hit_detection_sounds_enabled"});
	
				local sounds_toggle_option_list = sounds_toggle:OptionList({});
				sounds_toggle_option_list:List({Name = "Sound", Flag = "visuals_hit_detection_sounds_which_sound", Options = sounds, Default = sounds[1]});
				sounds_toggle_option_list:Slider({Name = "Volume", Flag = "visuals_hit_detection_sounds_volume", Default = 5, Minimum = 0.1, Maximum = 10, Decimals = 0.01, Ending = "%"});

				local chams_toggle = visuals_hit_detection:Toggle({Name = "Chams", Flag = "visuals_hit_detection_chams_enabled"});
				
				local chams_option_list = chams_toggle:OptionList({});
				chams_option_list:Colorpicker({Name = "Color", Flag = "visuals_hit_detection_chams_color", Default = default_color});
				chams_option_list:Slider({Name = "Transparency", Flag = "visuals_hit_detection_chams_transparency", Default = 0.7, Minimum = 0, Maximum = 1, Decimals = 0.001, Ending = "%"});
				chams_option_list:Slider({Name = "Duration", Flag = "visuals_hit_detection_chams_duration", Default = 2, Minimum = 0, Maximum = 10, Decimals = 0.001, Ending = "s"});
				
				local effect = visuals_hit_detection:Toggle({Name = "Effects", Flag = "visuals_hit_detection_effects_enabled"});
				
				local effect_option_list = effect:OptionList({});
				effect_option_list:Colorpicker({Name = "Color", Flag = "visuals_hit_detection_effects_color", Default = default_color});
				effect_option_list:List({Name = "Which Effect", Flag = "visuals_hit_detection_effects_which_effect", Options = {"Bubble", "Confetti"}, Default = "Bubble"});

				visuals_hit_detection:Toggle({Name = "Notification", Flag = "visuals_hit_detection_notification"});
				visuals_hit_detection:Slider({Name = "Notification Duration", Flag = "visuals_hit_detection_notification_duration", Default = 2, Minimum = 0, Maximum = 10, Decimals = 0.001, Ending = "s"});
			end;
			
			--// clons chams
			do
				visuals_clone_chams:Toggle({Name = "Enabled", Flag = "visuals_clone_chams_enabled"});
				visuals_clone_chams:Colorpicker({Name = "Color", Flag = "visuals_clone_chams_color", Default = default_color});
				visuals_clone_chams:Slider({Name = "Duration", Flag = "visuals_clone_chams_duration", Default = 0.1, Minimum = 0.1, Maximum = 10, Decimals = 0.001, Ending = "s"});
				visuals_clone_chams:List({Name = "To Apply", Flag = "visuals_clone_chams_to_apply", Options = {"Local Player", "Target Aim Target"}, Default = {"Local Player"}, Max = 2});
			end;
		end;

		--// misc
		do
			local world_section = ui.tabs["view"]:Section({Name = "World", Side = "Left", Size = 210});
			local lplr_section = ui.tabs["view"]:Section({Name = "Local Player", Side = "Left", Size = 210});
			local cursor_text = ui.tabs["view"]:Section({Name = "Text", Side = "Right", Size = 210});

			--// world
			do
				local fog = world_section:Toggle({Name = "Fog", Flag = "visuals_world_fog", Callback = function(state)
					if state then
						lighting.FogColor = flags["visuals_world_fog_color"];
						lighting.FogStart = flags["visuals_world_fog_start"];
						lighting.FogEnd = flags["visuals_world_fog_end"];
					else
						lighting.FogColor = world.FogColor;
						lighting.FogStart = world.FogStart;
						lighting.FogEnd = world.FogEnd;
					end;
				end});
				
				local fog_option_list = fog:OptionList({});
				fog_option_list:Colorpicker({Name = "Color", Flag = "visuals_world_fog_color", Default = default_color, Callback = function(color)
					if flags["visuals_world_fog"] then
						lighting.FogColor = color;
					end;
				end});
				fog_option_list:Slider({Name = "Start", Flag = "visuals_world_fog_start", Default = 150, Minimum = 100, Maximum = 10000, Decimals = 1, Ending = "%", Callback = function(number)
					if flags["visuals_world_fog"] then
						lighting.FogStart = number;
					end;
				end});
				fog_option_list:Slider({Name = "End", Flag = "visuals_world_fog_end", Default = 550, Minimum = 100, Maximum = 10000, Decimals = 1, Ending = "%", Callback = function(number)
					if flags["visuals_world_fog"] then
						lighting.FogEnd = number;
					end;
				end});

				local ambient = world_section:Toggle({Name = "Ambient", Flag = "visuals_world_ambient", Callback = function(state)
					if state then
						lighting.Ambient = flags["visuals_world_ambient_color"];
					else
						lighting.Ambient = world.Ambient;
					end;
				end});
				
				local ambient_option_list = ambient:OptionList({});
				ambient_option_list:Colorpicker({Name = "Color", Flag = "visuals_world_ambient_color", Default = default_color, Callback = function(color)
					if flags["visuals_world_ambient"] then
						lighting.Ambient = color;
					end;
				end});

				local clock_time_toggle = world_section:Toggle({Name = "Clock Time", Flag = "visuals_world_clock_time", Callback = function(state)
					if state then
						lighting.ClockTime = flags["visuals_world_clock_time_time"];
					else
						lighting.ClockTime = world.ClockTime;
					end;
				end});
				local clock_time_option_list = clock_time_toggle:OptionList({});
				clock_time_option_list:Slider({Name = "Time", Flag = "visuals_world_clock_time_time", Default = 14, Minimum = 0, Maximum = 24, Decimals = 1, Callback = function(number)
					if flags["visuals_world_clock_time"] then
						lighting.ClockTime = number;
					end;
				end});

				local brightness_toggle = world_section:Toggle({Name = "Brightness", Flag = "visuals_world_brightness", Callback = function(state)
					if state then
						lighting.Brightness = flags["visuals_world_brightness_level"];
					else
						lighting.Brightness = world.Brightness;
					end;
				end});
				local brightness_option_list = brightness_toggle:OptionList({});
				brightness_option_list:Slider({Name = "Level", Flag = "visuals_world_brightness_level", Default = 0.1, Minimum = 0, Maximum = 10, Decimals = 1, Callback = function(number)
					if flags["visuals_world_brightness"] then
						lighting.Brightness = number;
					end;
				end});

				local exposure = world_section:Toggle({Name = "Exposure", Flag = "visuals_world_exposure", Callback = function(state)
					if state then
						lighting.ExposureCompensation = flags["visuals_world_exposure_compensation"];
					else
						lighting.ExposureCompensation = world.ExposureCompensation;
					end;
				end});
				local exposure_option_list = exposure:OptionList({});
				exposure_option_list:Slider({Name = "Compensation", Flag = "visuals_world_exposure_compensation", Default = 0, Minimum = -10, Maximum = 10, Decimals = 1, Callback = function(number)
					if flags["visuals_world_exposure"] then
						lighting.ExposureCompensation = number;
					end;
				end});

				local color_shift_top = world_section:Toggle({Name = "Color Shift Top", Flag = "visuals_world_color_shift_top", Callback = function(state)
					if state then
						lighting.ColorShift_Top = flags["visuals_world_color_shift_top_color"];
					else
						lighting.ColorShift_Top = world.ColorShift_Top;
					end;
				end});
				local color_shift_top_option_list = color_shift_top:OptionList({});
				color_shift_top_option_list:Colorpicker({Name = "Color", Flag = "visuals_world_color_shift_top_color", Default = default_color, Callback = function(color)
					if flags["visuals_world_color_shift_top"] then
						lighting.ColorShift_Top = color;
					end;
				end});

				local collor_shift_bottom = world_section:Toggle({Name = "Color Shift Bottom", Flag = "visuals_world_color_shift_bottom", Callback = function(state)
					if state then
						lighting.ColorShift_Bottom = flags["visuals_world_color_shift_bottom_color"];
					else
						lighting.ColorShift_Bottom = world.ColorShift_Bottom;
					end;
				end});
				local color_shift_bottom_option_list = collor_shift_bottom:OptionList({});
				color_shift_bottom_option_list:Colorpicker({Name = "Color", Flag = "visuals_world_color_shift_bottom_color", Default = default_color, Callback = function(color)
					if flags["visuals_world_color_shift_bottom"] then
						lighting.ColorShift_Bottom = color;
					end;
				end});
			end;

			--// local player section
			do
				lplr_section:Toggle({Name = "Chams", Flag = "visuals_player_chams_enabled"});
				lplr_section:Toggle({Name = "Material", Flag = "visuals_player_material_enabled", Callback = function(state)
					local material = flags["visuals_player_material_type"];
					features.local_material(state, material);
				end});
				lplr_section:Colorpicker({Name = "Outline Color", Flag = "visuals_player_chams_outline_color", Default = Color3.new(0, 0, 0)});
				lplr_section:Colorpicker({Name = "Fill Color", Flag = "visuals_player_chams_fill_color", Default = default_color});
				lplr_section:List({Name = "Material", Flag = "visuals_player_material_type", Options = {"ForceField", "Neon"}, Default = "ForceField", Callback = function(material)
					local state = flags["visuals_player_material_enabled"];
					features.local_material(state, material);
				end});
			end;

			if (ESP) then
				local esp_section = ui.tabs["view"]:Section({Name = "ESP", Side = "Right", Size = 210});
				--// esp section
				do
					esp_section:Toggle({Name = "Enabled", Flag = "visuals_esp_enabled"});
					local boxes_toggle = esp_section:Toggle({Name = "Boxes", Flag = "visuals_esp_boxes_enabled"});
					local boxes_option_list = boxes_toggle:OptionList({});
					boxes_option_list:Colorpicker({Name = "Color", Flag = "visuals_esp_boxes_color", Default = Color3.new(1, 1, 1)});
					boxes_option_list:Toggle({Name = "Target Color", Flag = "visuals_esp_boxes_target_color_enabled"});
					boxes_option_list:Colorpicker({Name = "Target Color", Flag = "visuals_esp_boxes_target_color", Default = Color3.new(1, 0, 0)});
		
					local names_toggle = esp_section:Toggle({Name = "Names", Flag = "visuals_esp_names_enabled"});
					local names_option_list = names_toggle:OptionList({});
					names_option_list:Colorpicker({Name = "Color", Flag = "visuals_esp_names_color", Default = Color3.new(1, 1, 1)});
		
					local head_dots_toggle = esp_section:Toggle({Name = "Head Dots", Flag = "visuals_esp_head_dots_enabled"});
					local head_dots_option_list = head_dots_toggle:OptionList({});
					head_dots_option_list:Colorpicker({Name = "Color", Flag = "visuals_esp_head_dots_color", Default = Color3.new(1, 1, 1)});
					head_dots_option_list:Slider({Name = "Sides", Flag = "visuals_esp_head_dots_sides", Default = 6, Minimum = 1, Maximum = 100, Decimals = 1, Ending = "'"});
					head_dots_option_list:Slider({Name = "Size", Flag = "visuals_esp_head_dots_size", Default = 10, Minimum = 1, Maximum = 20, Decimals = 0.0001, Ending = "'"});
					local health_bar_toggle = esp_section:Toggle({Name = "Health Bar", Flag = "visuals_esp_health_bar_enabled"});
					local health_bar_option_list = health_bar_toggle:OptionList({});
					health_bar_option_list:Toggle({Name = "Health Based Color", Flag = "visuals_esp_health_bar_health_based_color"});
					health_bar_option_list:Colorpicker({Name = "Health Color", Flag = "visuals_esp_health_bar_color", Default = Color3.new(1, 1, 1)});
					local health_text_toggle = esp_section:Toggle({Name = "Health Text", Flag = "visuals_esp_health_text_enabled"});
					local health_text_option_list = health_text_toggle:OptionList({});
					health_text_option_list:Toggle({Name = "Health Based Color", Flag = "visuals_esp_health_text_health_based_color"});
					health_text_option_list:Colorpicker({Name = "Color", Flag = "visuals_esp_health_text_color", Default = Color3.new(1, 1, 1)});
					local armor_bar_toggle = esp_section:Toggle({Name = "Armor Bar", Flag = "visuals_esp_armor_bar_enabled"});
					local armor_bar_option_list = armor_bar_toggle:OptionList({});
					armor_bar_option_list:Colorpicker({Name = "Armor Color", Flag = "visuals_esp_armor_bar_color", Default = Color3.new(1, 1, 1)});
				end;
			end;
	
			--// cursor text
			do
				cursor_text:Toggle({Name = "Enabled", Flag = "visuals_text_enabled"});
				cursor_text:Toggle({Name = "Custom Text", Flag = "visuals_text_custom_text"});
				cursor_text:Colorpicker({Name = "Text Color", Flag = "visuals_text_color", Default = default_color});
				cursor_text:Slider({Name = "Cursor Offset", Flag = "visuals_text_cursor_offset", Default = 49, Minimum = 1, Maximum = 100, Decimals = 0.0001, Ending = "%"});
				cursor_text:Textbox({Flag = "visuals_cursor_custom_text_text", Placeholder = "[${target_name}]"});
			end;
		end;
	end;

	--// anti aim
	do
		local velocity_spoofer = ui.tabs["anti_aim"]:Section({Name = "Velocity Spoofer", Side = "Left", Size = 160});
		local network_desync = ui.tabs["anti_aim"]:Section({Name = "Network Desync", Side = "Right", Size = 110});
		local c_sync = ui.tabs["anti_aim"]:Section({Name = "C-Sync", Side = "Right", Size = 300});
		local fflag = ui.tabs["anti_aim"]:Section({Name = "FFlag Desync", Side = "Left", Size = 95});
		local starhook_classics = ui.tabs["anti_aim"]:Section({Name = "Starhook Classics", Side = "Left", Size = 150});

		--// velocity spoofer
		do
			local nest = velocity_spoofer:Nest({Size = 120});
			nest:Toggle({Name = "Enabled", Flag = "anti_aim_velocity_spoofer_enabled"});
			nest:Keybind({Flag = "anti_aim_velocity_spoofer_keybind", Name = "Keybind", Default = Enum.KeyCode.C, Mode = "Toggle"});
			nest:List({Name = "Type", Flag = "anti_aim_velocity_spoofer_type", Options = {"Local Strafe", "Random", "Static"}, Default = {"Local Strafe"}});
			nest:Slider({Name = "Strafe Distance", Flag = "anti_aim_velocity_spoofer_strafe_distance", Default = 1, Minimum = 1, Maximum = 20, Decimals = 0.01, Ending = "%"});
			nest:Slider({Name = "Strafe Speed", Flag = "anti_aim_velocity_spoofer_strafe_speed", Default = 1, Minimum = 1, Maximum = 10, Decimals = 0.01, Ending = "%"});
			nest:Slider({Name = "Static X", Flag = "anti_aim_velocity_spoofer_static_x", Default = 1, Minimum = 1, Maximum = 100, Decimals = 0.01, Ending = "'"});
			nest:Slider({Name = "Static Y", Flag = "anti_aim_velocity_spoofer_static_y", Default = 1, Minimum = 1, Maximum = 100, Decimals = 0.01, Ending = "'"});
			nest:Slider({Name = "Static Z", Flag = "anti_aim_velocity_spoofer_static_z", Default = 1, Minimum = 1, Maximum = 100, Decimals = 0.01, Ending = "'"});
			nest:Slider({Name = "Randomization", Flag = "anti_aim_velocity_spoofer_randomization", Default = 1, Minimum = 1, Maximum = 100, Decimals = 0.01, Ending = "%"});
		end;

		--// network desync
		do
			network_desync:Toggle({Name = "Enabled", Flag = "anti_aim_network_desync_enabled"});
			network_desync:Slider({Name = "Amount", Flag = "anti_aim_network_desync_amount", Default = 7.5, Minimum = 0, Maximum = 10, Decimals = 0.01, Ending = "%"});
		end;

		--// c sync
		do
			local main_toggle = c_sync:Toggle({Name = "Enabled", Flag = "anti_aim_c_sync_enabled"});
			local main_toggle_option_list = main_toggle:OptionList({});

			main_toggle_option_list:Toggle({Name = "Visualize", Flag = "anti_aim_c_sync_visualize_enabled"});
			main_toggle_option_list:List({Name = "Visualize Types", Flag = "anti_aim_c_sync_visualize_types", Options = {"Tracer", "Dot", "Character"}, Default = {"Tracer"}, Max = 3});
			main_toggle_option_list:Colorpicker({Name = "Visualize Color", Flag = "anti_aim_c_sync_visualize_color", Default = default_color});
			main_toggle_option_list:Slider({Name = "Visualize Dot Size", Flag = "anti_aim_c_sync_dot_size", Default = 16, Minimum = 1, Maximum = 20, Decimals = 0.01, Ending = "%"});

			c_sync:Keybind({Flag = "anti_aim_c_sync_keybind", Name = "Keybind", Default = Enum.KeyCode.N, Mode = "Toggle"});
			c_sync:List({Name = "Type", Flag = "anti_aim_c_sync_type", Options = {"Static Local", "Static Target", "Local Random", "Target Random"}, Default = "Local Offset"});
			c_sync:Slider({Name = "Randomization", Flag = "anti_aim_c_sync_randomization", Default = 1, Minimum = 1, Maximum = 100, Decimals = 0.01, Ending = "%"});
			c_sync:Slider({Name = "Static X", Flag = "anti_aim_c_sync_static_x", Default = 1, Minimum = 0, Maximum = 100, Decimals = 0.01, Ending = "'"});
			c_sync:Slider({Name = "Static Y", Flag = "anti_aim_c_sync_static_y", Default = 1, Minimum = 0, Maximum = 100, Decimals = 0.01, Ending = "'"});
			c_sync:Slider({Name = "Static Z", Flag = "anti_aim_c_sync_static_z", Default = 1, Minimum = 0, Maximum = 100, Decimals = 0.01, Ending = "'"});
		end;

		--// fflags desync
		do
			fflag:Toggle({Name = "Enabled", Flag = "anti_aim_fflag_desync_enabled", Callback = function(state)
				if (state) then
					setfflag("S2PhysicsSenderRate", tostring(flags["anti_aim_fflag_amount"]));
				else
					setfflag("S2PhysicsSenderRate", tostring(old_psr));
				end;
			end});
			fflag:Slider({Name = "Amount", Flag = "anti_aim_fflag_amount", Default = 2, Minimum = 0, Maximum = 15, Decimals = 0.01, Ending = "%", Callback = function(value)
				if (flags["anti_aim_fflag_desync_enabled"]) then
					setfflag("S2PhysicsSenderRate", tostring(value));
				end;
			end});
		end;

		--// destroy cheaters
		do
			starhook_classics:Toggle({Name = "Enabled", Flag = "anti_aim_starhook_classics_enabled"});
			starhook_classics:Keybind({Flag = "anti_aim_starhook_classics_keybind", Name = "Keybind", Default = Enum.KeyCode.Y, Mode = "Toggle"});
			starhook_classics:List({Name = "Classics", Flag = "anti_aim_starhook_classics", Options = {"Destroy Cheaters", "supercoolboi34 Destroyer"}, Default = "Destroy Cheaters"});
		end;
	end;

	--// settings
	do --// credits to finobe wtv im way too lazy
		local cfgs = ui.tabs["settings"]:Section({Name = "Config", Side = "Left", Size = 427});
		local window = ui.tabs["settings"]:Section({Name = "Window", Side = "Right", Size = 427});

		local cfg_list = cfgs:List({Name = "Config List", Flag = "setting_configuration_list", Options = {}});
		cfgs:Textbox({Flag = "settings_configuration_name", Placeholder = "Config name"});

		local current_list = {};

		if not isfolder("starhook") then 
		    makefolder("starhook");
		end;

		if not isfolder("starhook/configs") then 
		    makefolder("starhook/configs");
		end;

		local function update_config_list()
		    local list = {};
		
		    for idx, file in listfiles("starhook/configs") do
		        local file_name = file:gsub("starhook/configs\\", ""):gsub(".cfg", ""):gsub("starhook/configs/", "");
		        list[#list + 1] = file_name;
		    end;
		
		    local is_new = #list ~= #current_list;
		
		    if not is_new then
		        for idx = 1, #list do
		            if list[idx] ~= current_list[idx] then
		                is_new = true;
		                break;
		            end;
		        end;
		    end;
		
		    if is_new then
		        current_list = list;
		        cfg_list:Refresh(current_list);
		    end;
		end;

		cfgs:Button({Name = "Create", Callback = function()
		    local config_name = flags.settings_configuration_name;
		    if config_name == "" or isfile("starhook/configs/" .. config_name .. ".cfg") then
		        return;
		    end;
		    writefile("starhook/configs/" .. config_name .. ".cfg", Library:GetConfig());
		    update_config_list();
		end});

		cfgs:Button({Name = "Save", Callback = function()
		    local selected_config = flags.setting_configuration_list;
		    if selected_config then
		        writefile("starhook/configs/" .. selected_config .. ".cfg", Library:GetConfig());
		    end;
		end});

		cfgs:Button({Name = "Load", Callback = function()
		    local selected_config = flags.setting_configuration_list;
		    if selected_config then
		        Library:LoadConfig(readfile("starhook/configs/" .. selected_config .. ".cfg"));
		    end;
		end});

		cfgs:Button({Name = "Delete", Callback = function()
		    local selected_config = flags.setting_configuration_list;
		    if selected_config then
		        delfile("starhook/configs/" .. selected_config .. ".cfg");
		    end;
		    update_config_list();
		end});

		cfgs:Button({Name = "Refresh", Callback = function()
		    update_config_list();
		end});

		update_config_list();

		--// ui settings
		window:Keybind({Name = "UI Toggle", Flag = "ui_toggle", Default = Enum.KeyCode.Insert, UseKey = true, Callback = function(key)
			Library.UIKey = key;
		end});

		window:Toggle({Name = "Watermark", Flag = "ui_watermark", Callback = function(state)
			watermark:SetVisible(state);
		end});

		window:Colorpicker({Name = "Menu Accent", Flag = "MenuAccent", Default = default_color, Callback = function(state)
			library:ChangeAccent(state);
		end});
	end;
end;
