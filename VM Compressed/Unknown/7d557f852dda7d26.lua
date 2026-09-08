local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/Library.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/addons/SaveManager.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/refs/heads/main/addons/ThemeManager.lua'))()

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Lighting = game:GetService("Lighting")
local Teams = game:GetService("Teams")
local HttpService = game:GetService("HttpService")
local GuiService = game:GetService("GuiService")
local TextChatService = game:GetService("TextChatService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local cloneref = cloneref or function(inst) return inst end
local gethui = gethui or function()
    return (syn and syn.protect_gui and game:GetService("CoreGui")) or game:GetService("CoreGui")
end
local getsynasset = getcustomasset or getsynasset or function() return "" end
local protect_gui = (syn and syn.protect_gui) or function() end

if not getgenv then
    getgenv = function() return _G end
end

if getgenv().UE_LOADED then
    return
end

if not getgenv().Toggles then
    getgenv().Toggles = {}
end
if not getgenv().Options then
    getgenv().Options = {}
end
local Toggles = getgenv().Toggles
local Options = getgenv().Options

local State = {
    lua = {
        listen_for_command = {},
    },
    events = {
        gradient_option_changed = Instance.new("BindableEvent"),
        esp_color_changed = Instance.new("BindableEvent"),
        esp_fill_changed = Instance.new("BindableEvent"),
        esp_effects_changed = Instance.new("BindableEvent"),
        esp_effects_color_changed = Instance.new("BindableEvent"),
    },
    characters = {},
    customization = {
        self = {
            _data = {},
            new = function(self, tag)
                return {
                    create = function(self2, char, val, kind) end,
                    destroy = function(self2, kind) end,
                    update = function(self2, kind) end,
                }
            end,
            change = function(self, char, fn) end,
            restore = function(self, char) end,
            get = function(self, char) return nil end,
        },
    },
    effects = {
        self_effects = {
            new = function(tag)
                return {
                    create = function(self, char, val, kind) end,
                    destroy = function(self, kind) end,
                    update = function(self, kind) end,
                }
            end,
        },
    },
    gradients = {
        healthbar = {},
        fill = {},
        box = {},
        name = {},
        weapon = {},
        distance = {},
        skeleton = {},
    },
    running = {},
}

local BloomEffect = Instance.new("BloomEffect")
BloomEffect.Parent = Lighting
BloomEffect.Enabled = false

local BloomDefaults = {
    Enabled = BloomEffect.Enabled,
    Size = BloomEffect.Size,
    Intensity = BloomEffect.Intensity,
    Threshold = BloomEffect.Threshold,
}

local ColorCorrectionEffect = Instance.new("ColorCorrectionEffect")
ColorCorrectionEffect.Parent = Lighting
ColorCorrectionEffect.Enabled = false

local AtmosphereEffect = Instance.new("Atmosphere")

local SunRaysEffect = Instance.new("SunRaysEffect")
SunRaysEffect.Parent = Lighting
SunRaysEffect.Enabled = false

local SunRaysDefaults = {
    Enabled = SunRaysEffect.Enabled,
    Spread = SunRaysEffect.Spread,
    Intensity = SunRaysEffect.Intensity,
}

local function make_proxy(initial_value)
    local storage = { [1] = initial_value }
    return { [2] = 1, [3] = storage }
end

local proxy_outline_color = make_proxy("OutlineColor")
local proxy_visibility = make_proxy(false)
local proxy_target = make_proxy(nil)
local proxy_world_to_viewport = make_proxy(function(pos)
    return Camera:WorldToViewportPoint(pos)
end)
local proxy_font_info = make_proxy({
    font = Font.fromEnum(Enum.Font.Code),
    size = 13,
})
local proxy_healthbar_color = make_proxy(ColorSequence.new(Color3.new(0, 1, 0)))
local proxy_frame_type = make_proxy(nil) -- RenderStepped reference
local proxy_esp_enabled = make_proxy(false)

local function world_to_viewport_wrapped(position)
    local screenPos, onScreen = Camera:WorldToViewportPoint(position)
    return Vector2.new(screenPos.X, screenPos.Y), onScreen
end
proxy_world_to_viewport[3][proxy_world_to_viewport[2]] = world_to_viewport_wrapped

local x = function(R)
		local T = R[5]
		local q = R[2]
		local g = R[4]
		local l = R[9]
		local m = R[10]
		local d = R[0]
		local Z = R[7]
		local F = R[8]
		local A = R[1]
		local _ = R[3]
		local n = R[6]
		return function()
			local R = _.Modes or { "Always", "Toggle", "Hold" }
			local v = A:AddContextMenu(T)
			local J = {}
			for s, s in R do
				local R
				R = v:AddOption(s, function()
					d.Mode = s
					R.TextColor3 = A.AccentColor
					for G, a in J do
						if (a ~= R) then
							a.TextColor3 = G == d.Mode and A.AccentColor or A.FontColor
						end
					end
					A:AttemptSave()
				end)
				R:GetPropertyChangedSignal("TextColor3"):Connect(function()
					if (s == d.Mode) then
						R.TextColor3 = A.AccentColor
					else
						R.TextColor3 = A.FontColor
					end
				end)
				J[s] = R
			end
			if A.FlagCopying then
				v:AddOption("Copy Flag", function()
					pcall(setclipboard, d.Idx)
					task.wait()
					A:Notify("Copied flag to clipboard!", 2)
					v:Hide()
				end)
			end
			for R, v in J do
				v.TextColor3 = R == d.Mode and A.AccentColor or A.FontColor
			end
			local R = function(v)
				local s = d.Mode
				s = s ~= "Always" and d.Override and "Override" or s
				g.Text = string.format("[%s] %s (%s)", d.Value, _.Text, s)
				g.Visible = true
				g.TextColor3 = v and A.AccentColor or A.FontColor
				A.RegistryMap[g].Properties.TextColor3 = v and "AccentColor" or "FontColor"
			end
			function d:Update()
				if not d.NoUI then
					local _ = A.KeypickerListMode
					local v = d:GetState()
					if (_ == "Active" and d.Parent.Type == "Toggle" and (not v or not d.Parent.Value)) then
						g.Visible = false
					elseif (_ == "Toggled" and d.Parent.Type == "Toggle" and not d.Parent.Value) then
						g.Visible = false
					else
						R(v)
					end
				else
					g.Visible = false
				end
				local R = 0
				local _ = 0
				for v, v in next, A.KeybindContainer:GetChildren() do
					if v:IsA("TextLabel") and v.Visible then
						R = R + 18
						if (v.TextBounds.X > _) then
							_ = v.TextBounds.X
						end
					end
				end
				A.KeybindFrame.Size = UDim2.new(0, math.max(_ + 10, 210), 0, R + 23)
				A.KeybindFrame.Visible = A.KeypickerListVisible and (R ~= 0)
			end
			function d:OverrideState(R)
				if (self.Override == R) then
					return
				end
				self.Override = R
				d.Toggled = false
				d:Update()
			end
			local R, _ = n.IsMouseButtonPressed, n.IsKeyDown
			local v, s = Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2
			local G = Enum.KeyCode
			function d:GetState()
				local a = d.Mode
				if a == "Always" then
					return true
				end
				local H = d.Value
				if (H == "...") then
					return true
				end
				local Y = nil
				if (a == "Hold") then
					if (H == "MB1" or H == "MB2") then
						Y = H == "MB1" and R(n, v) or H == "MB2" and R(n, s)
					else
						Y = _(n, G[H])
					end
				else
					Y = d.Toggled
				end
				if (Y and self.Override) then
					d:OverrideState(false)
				end
				return Y or self.Override
			end
			function d:SetValue(R)
				local _, v = R[1], R[2]
				q.Text = _
				d.Value, d.Mode = _, v
				for R, _ in J do
					_.TextColor3 = R == d.Mode and A.AccentColor or A.FontColor
				end
				d:Update()
			end
			function d:OnClick(R)
				d.Clicked = R
			end
			function d:OnChanged(R)
				d.Changed = R
				R(d.Value)
			end
			if m.Addons then
				table.insert(m.Addons, d)
			end
			function d:DoClick()
				if d.Override then
					d.Override = false
					d.Toggled = false
				end
				if m.Type == "Toggle" and d.SyncToggleState then
					m:SetValue(not m.Value)
				end
				A:SafeCallback(d.Callback, d.Toggled)
				A:SafeCallback(d.Clicked, d.Toggled)
			end
			function d:SetupConnection(R)
				table.insert(self.Connections, R)
				A:GiveSignal(R)
			end
			function d:Remove()
				l[F] = nil
				for R, R in d.Connections do
					R:Disconnect()
				end
				table.clear(d)
				T:Destroy()
				g:Destroy()
			end
			function d:SetModePickerVisibility(R)
				Z.Visible = R
			end
			function d:GetModePickerVisibility()
				return Z.Visible
			end
			local R = false
			local g = { [Enum.KeyCode.Escape] = true, [Enum.KeyCode.Backspace] = true }
			T.InputBegan:Connect(function(T)
				if not R and T.UserInputType == Enum.UserInputType.MouseButton1 and not A:MouseIsOverOpenedFrame() then
					R = true
					q.Text = ""
					local T
					local m = ""
					task.spawn(function()
						while not T do
							if m == "..." then
								m = ""
							end
							m = m .. "."
							q.Text = m
							wait(0.4)
						end
					end)
					wait(0.2)
					local m
					m = n.InputBegan:Connect(function(Z)
						local _
						if Z.UserInputType == Enum.UserInputType.Keyboard then
							_ = g[Z.KeyCode] and "..." or Z.KeyCode.Name
						elseif Z.UserInputType == Enum.UserInputType.MouseButton1 then
							_ = "MB1"
						elseif Z.UserInputType == Enum.UserInputType.MouseButton2 then
							_ = "MB2"
						end
						T = true
						R = false
						q.Text = _
						d.Value = _
						A:SafeCallback(d.ChangedCallback, Z.KeyCode or Z.UserInputType)
						A:SafeCallback(d.Changed, Z.KeyCode or Z.UserInputType)
						A:AttemptSave()
						m:Disconnect()
					end)
				end
			end)
			d:SetupConnection(n.InputBegan:Connect(function(T, q)
				if (not R and not q) then
					if d.Mode == "Toggle" then
						local q = d.Value
						if q == "MB1" or q == "MB2" then
							if
								q == "MB1" and T.UserInputType == Enum.UserInputType.MouseButton1
								or q == "MB2" and T.UserInputType == Enum.UserInputType.MouseButton2
							then
								d.Toggled = not d.Toggled
								d:DoClick()
							end
						elseif T.UserInputType == Enum.UserInputType.Keyboard then
							if T.KeyCode.Name == q then
								d.Toggled = not d.Toggled
								d:DoClick()
							end
						end
					end
					d:Update()
				end
			end))
			d:SetupConnection(n.InputEnded:Connect(function(T)
				if not R then
					d:Update()
				end
			end))
			d:Update()
			l[F] = d
		end
	end

local t = function(R)
		local T = R[4]
		local q = R[0]
		local g = R[2]
		local l = R[5]
		local m = R[1]
		local d = R[3]
		return function()
			function q:Resize()
				local R = 0
				for Z, Z in next, q.Container:GetChildren() do
					if (not Z:IsA("UIListLayout")) and Z.Visible then
						R = R + Z.Size.Y.Offset
					end
				end
				m.Size = UDim2.new(1, 0, 0, 20 + R + 2 + 2)
			end
			local R = g.Groupboxes
			function q:Remove()
				table.clear(self)
				m:Destroy()
				R[d.Name] = nil
			end
			q.Container = T
			setmetatable(q, l)
			q:AddBlank(3)
			q:Resize()
			R[d.Name] = q
		end
	end

local y = function(R)
		local T = R[4]
		local q = R[1]
		local g = R[3]
		local l = R[2]
		local m = R[0]
		return function(R, d)
			local Z = l
			local l, F
			for A, _ in d do
				if (T[A] or q[3][q[2]][A]) then
					continue
				elseif (m(_) ~= "Instance" or _.ClassName ~= "MeshPart") then
					continue
				end
				local T = g[3][g[2]](_.Position)
				local q = (T - R).Magnitude
				if (q < Z) then
					Z, l = q, _
					F = T
				end
			end
			return l, F
		end
	end

local q = function(R)
		local T = R[1]
		local q = R[0]
		return function()
			local R = Toggles.bloom_enabled.Value
			if R then
				q.Enabled = true
				q.Size = Options.bloom_size.Value
				q.Intensity = Options.bloom_intensity.Value
				q.Threshold = Options.bloom_threshold.Value
			else
				for R, g in T do
					q[R] = g
				end
			end
		end
	end

local z = function(R)
		local T = R[3]
		local q = R[0]
		local g = R[2]
		local l = R[4]
		local m = R[1]
		return function()
			local R = ColorSequence.new
			local d = ColorSequenceKeypoint.new
			local Z = Color3.fromHSV
			local F = 3
			local A, _ = {}, {}
			local n = 0
			local v, J = 0, 0.25
			local s, G, a = Options.esp_healthbar_type, Toggles.esp_healthbar_moving, Options.esp_healthbar_speed
			local H, Y, N = s.Value, G.Value, a.Value
			local U = T.gradients.healthbar
			local T = function(i, L, c)
				local y = {}
				if (c == "rainbow") then
					for O = 0, 19 do
						local t = O / 19
						local O = t
						if L then
							O = O + n
							if (O > 1) then
								O = O - 1
							end
						end
						y[#y + 1] = d(t, Z(O, 0.5, 1))
					end
				elseif (c == "gradient") then
					local Z = F - 1
					local c = v / J
					for O = 0, Z do
						local t = #y + 1
						local B = _[t]
						local f = i[B]
						if L then
							local L = _[t - 1] or _[F]
							f = f:Lerp(i[L], c)
						end
						y[t] = d(O / Z, f)
					end
				else
					y = i[1]
				end
				return y
			end
			local d = function()
				m[3][m[2]] = R(T(A, Y, H))
				for Z, Z in U do
					Z.Color = m[3][m[2]]
				end
			end
			g.events.gradient_option_changed.Event:Connect(function(Z)
				table.clear(_)
				F = Z * 3
				for i, L in
					{
						[A] = {
							Options.esp_healthbar_color_start,
							Options.esp_healthbar_color_middle,
							Options.esp_healthbar_color_end,
						},
					}
				do
					table.clear(i)
					for c, c in L do
						for L = 1, Z do
							table.insert(i, c.Value)
						end
					end
				end
				for Z = 1, F do
					table.insert(_, Z)
				end
				d()
			end)
			s:OnChanged(function(d)
				H = d
				g.events.gradient_option_changed:Fire(Options.esp_healthbar_slices.Value)
			end)
			G:OnChanged(function(d)
				Y = d
				g.events.gradient_option_changed:Fire(Options.esp_healthbar_slices.Value)
			end)
			a:OnChanged(function(d)
				N = d
				g.events.gradient_option_changed:Fire(Options.esp_healthbar_slices.Value)
			end)
			g.events.gradient_option_changed:Fire(Options.esp_healthbar_slices.Value)
			l.RenderStepped:Connect(function(g)
				if (not Y or not q[3][q[2]]) then
					return
				end
				g = g * F / 3 * N
				n = n + g
				v = v + g
				if (n > 1) then
					n = 0
				end
				if (v > J) then
					v = 0
					local g = table.clone(_)
					if Y then
						_[1] = g[F]
						for l = 2, F do
							_[l] = g[l - 1]
						end
					else
						for g = 1, F do
							_[g] = g
						end
					end
				end
				if q[3][q[2]] then
					local q = R(T(A, N, H))
					m[3][m[2]] = q
					for R, R in U do
						R.Color = q
					end
				end
			end)
		end
	end

local J = function(R)
		local T = R[0]
		local q = R[1]
		return function()
			if T[3][T[2]] then
				local R = q.Humanoid
				return R and R.Health > 0
			end
		end
	end

local V = function(R)
		local T = R[0]
		return function()
			T.Enabled = Toggles.color_correction_enabled.Value
			if not T.Enabled then
				return
			end
			T.TintColor = Options.color_correction_tint.Value
			T.Saturation = Options.color_correction_saturation.Value
			T.Contrast = Options.color_correction_contrast.Value
			T.Brightness = Options.color_correction_brightness.Value
		end
	end

local B = function(R)
		local T = R[0]
		local q = R[1]
		return function()
			do
				local R = T.lua.listen_for_command
				local T = function(g, l)
					local m = R[l] or R[l:split(" ")[1]]
					if m then
						for R, R in m do
							local m = l:split(" ")
							task.spawn(R, g, unpack(m, 2, #m))
						end
					end
				end
				game:GetService("TextChatService").MessageReceived:Connect(function(R)
					local g = R.TextSource
					if not g then
						return
					end
					local l = q:GetPlayerByUserId(g.UserId)
					if not l then
						return
					end
					T(l, R.Text)
				end)
			end
		end
	end

local P = function(R)
		local T = R[13]
		local q = R[5]
		local g = R[7]
		local l = R[3]
		local m = R[4]
		local d = R[2]
		local Z = R[15]
		local F = R[14]
		local A = R[9]
		local _ = R[0]
		local n = R[10]
		local v = R[1]
		local J = R[12]
		local s = R[6]
		local G = R[11]
		local a = R[8]
		return function(R, H)
			if not s[3][s[2]] then
				return
			end
			local s = g.Value
			local g, Y = F.Value, G.Value
			local F = Z.Value
			local Z = J(a(H * d.Value) * l.Value)
			local l
			if (s > 0) then
				l = _((H * 360 * s) % 360)
			else
				l = _(F)
			end
			v[3][v[2]] = v[3][v[2]]:Lerp(R, A.Value)
			for R, d in m do
				local m, F = d[1], d[2]
				local d = l + q * (R - 1)
				local R = n(a(d), T(d))
				local T = Y + Z
				local q = g
				m.To = v[3][v[2]] + (R * T)
				m.From = v[3][v[2]] + (R * T) + (R * q)
				if F then
					T, q = T - 1, q + 2
					F.To = v[3][v[2]] + (R * T)
					F.From = v[3][v[2]] + (R * T) + (R * q)
				end
			end
		end
	end

local b = function(R)
		local T = R[7]
		local q = R[1]
		local g = R[10]
		local l = R[13]
		local m = R[4]
		local d = R[8]
		local Z = R[5]
		local F = R[2]
		local A = R[15]
		local _ = R[9]
		local n = R[0]
		local v = R[6]
		local J = R[12]
		local s = R[14]
		local G = R[3]
		local a = R[11]
		return function()
			if not l[3][l[2]][T] then
				d.Enabled = false
				return
			end
			d.Enabled = true
			d.Size = a[3][a[2]]
			if _[3][_[2]] then
				F.Visible = true
				F.Text = v((s.CFrame.Position - A:GetPivot().Position).Magnitude) .. "s"
				F.TextColor3 = g[3][g[2]]
				F.FontFace, F.TextSize = n[3][n[2]].font, n[3][n[2]].size
			else
				F.Visible = false
			end
			if J[3][J[2]] then
				q.Visible = true
				q.TextColor3 = m[3][m[2]]
				q.FontFace, q.TextSize = n[3][n[2]].font, n[3][n[2]].size
			else
				q.Visible = false
			end
			if G[3][G[2]] then
				Z.Visible = true
			else
				Z.Visible = false
			end
		end
	end

local M = function(R)
		local T = R[0]
		return function()
			T.Parent = Toggles.atmosphere_enabled.Value and game:GetService("Lighting") or nil
			if not T.Parent then
				return
			end
			T.Color = Options.atmosphere_color.Value
			T.Decay = Options.atmosphere_decay.Value
			T.Glare = Options.atmosphere_glare.Value
			T.Haze = Options.atmosphere_haze.Value
			T.Density = Options.atmosphere_density.Value
			T.Offset = Options.atmosphere_offset.Value
		end
	end

local K = function(R)
		local T = R[1]
		local q = R[8]
		local g = R[4]
		local l = R[5]
		local m = R[10]
		local d = R[3]
		local Z = R[7]
		local F = R[2]
		local A = R[0]
		local _ = R[6]
		local n = R[9]
		return function()
			function F:SetValue(R)
				if Z.MaxLength and #R > Z.MaxLength then
					R = R:sub(1, Z.MaxLength)
				end
				if F.Numeric then
					if (not tonumber(R)) and R:len() > 0 then
						R = F.Value
					end
				end
				F.Value = R
				A.Text = R
				l:SafeCallback(F.Callback, F.Value)
				l:SafeCallback(F.Changed, F.Value)
			end
			function F:Remove()
				for R, R in g do
					R:Destroy()
				end
				d[T] = nil
				n:Destroy()
				table.clear(F)
				_:Resize()
			end
			if F.Finished then
				A.FocusLost:Connect(function(R)
					if not R then
						return
					end
					F:SetValue(A.Text)
					l:AttemptSave()
				end)
			else
				A:GetPropertyChangedSignal("Text"):Connect(function()
					F:SetValue(A.Text)
					l:AttemptSave()
				end)
			end
			local function R()
				local Z = 2
				local v = q.AbsoluteSize.X
				if not A:IsFocused() or A.TextBounds.X <= v - 2 * Z then
					A.Position = UDim2.new(0, Z, 0, 0)
				else
					local q = A.CursorPosition
					if q ~= -1 then
						local J = string.sub(A.Text, 1, q - 1)
						local q = m:GetTextSize(J, A.TextSize, A.Font, Vector2.new(math.huge, math.huge)).X
						local m = A.Position.X.Offset + q
						if m < Z then
							A.Position = UDim2.fromOffset(Z - q, 0)
						elseif m > v - Z - 1 then
							A.Position = UDim2.fromOffset(v - q - Z - 1, 0)
						end
					end
				end
			end
			task.spawn(R)
			A:GetPropertyChangedSignal("Text"):Connect(R)
			A:GetPropertyChangedSignal("CursorPosition"):Connect(R)
			A.FocusLost:Connect(R)
			A.Focused:Connect(R)
			if l.FlagCopying then
				local R = l:AddContextMenu(n)
				R:AddOption("Copy Flag", function()
					pcall(setclipboard, F.Idx)
					task.wait()
					l:Notify("Copied flag to clipboard!", 2)
					R:Hide()
				end)
			end
			l:AddToRegistry(A, { TextColor3 = "FontColor" })
			function F:OnChanged(R)
				F.Changed = R
				R(F.Value)
			end
			table.insert(g, _:AddBlank(5))
			_:Resize()
			d[T] = F
		end
	end

local U = function(R)
		local T = R[1]
		local q = R[2]
		local g = R[0]
		local l = R[3]
		return function()
			function T:SetSize(R)
				g.Size = UDim2.new(1, -4, 0, R)
			end
			function T:GetOuter()
				return g
			end
			function T:GetInner()
				return l
			end
			function T:GetSize()
				return l.AbsoluteSize
			end
			local R = {}
			table.insert(R, q:AddBlank(5))
			q:Resize()
		end
	end

local I = function(R)
		local T = R[3]
		local q = R[4]
		local g = R[8]
		local l = R[2]
		local m = R[10]
		local d = R[0]
		local Z = R[11]
		local F = R[1]
		local A = R[9]
		local _ = R[7]
		local n = R[6]
		local v = R[5]
		return function()
			local R = {}
			local R = false
			local J = false
			function q:Toggle()
				if J then
					return
				end
				R = not R
				q.Toggled = R
				l[3][l[2]] = R
				q:FireEvent("VisibilityChanged", l[3][l[2]])
				F.Modal = R
				if R then
					_.Visible = true
					local l = game:GetService("GuiService")
					task.spawn(function()
						local F = v.MouseIconEnabled
						local J = Instance.new("ImageLabel", A)
						J.Image = "http://www.roblox.com/asset/?id=4292970642"
						J.BackgroundTransparency = 1
						J.ZIndex = 125
						local s = Instance.new("ImageLabel", A)
						s.Image = "http://www.roblox.com/asset/?id=4292970642"
						s.ImageColor3 = Color3.new()
						s.BackgroundTransparency = 1
						s.ZIndex = 124
						J.Size, s.Size = UDim2.fromOffset(17, 17), UDim2.fromOffset(19, 19)
						J.Rotation, s.Rotation = -45, -45
						while R and A.Parent do
							v.MouseIconEnabled = false
							local A = v:GetMouseLocation()
							local G = UDim2.fromOffset(A.X, A.Y - l:GetGuiInset().Y - 1)
							J.ImageColor3 = q.AccentColor
							J.Position, s.Position = G, G - UDim2.fromOffset(1, 1)
							Z:Wait()
						end
						v.MouseIconEnabled = F
						J:Destroy()
						s:Destroy()
					end)
				end
				for l, l in d do
					task.spawn(function()
						if l.Type == "Dropdown" then
							l:CloseDropdown()
						elseif l.Type == "KeyPicker" then
							l:SetModePickerVisibility(false)
						elseif l.Type == "ColorPicker" then
							l:Hide()
						end
					end)
				end
				if R and q.BlockInput then
					n:BindAction("Freeze", function()
						return Enum.ContextActionResult.Sink
					end, false, table.unpack(Enum.PlayerActions:GetEnumItems()))
				else
					n:UnbindAction("Freeze")
				end
				g.Enabled = R
				T.Enabled = R
				m.Enabled = R
				_.Visible = R
			end
			q:GiveSignal(v.InputBegan:Connect(function(R, T)
				if typeof(q.ToggleKeybind) == "table" and q.ToggleKeybind.Type == "KeyPicker" then
					if R.UserInputType == Enum.UserInputType.Keyboard and R.KeyCode.Name == q.ToggleKeybind.Value then
						task.spawn(q.Toggle)
					end
				elseif R.KeyCode == Enum.KeyCode.RightControl or (R.KeyCode == Enum.KeyCode.Insert and not T) then
					task.spawn(q.Toggle)
				end
			end))
		end
	end

local S = function(R)
		local T = R[1]
		local q = R[0]
		return function()
			local R = Toggles.sunrays_enabled.Value
			if R then
				q.Enabled = true
				q.Spread = Options.sunrays_spread.Value
				q.Intensity = Options.sunrays_intensity.Value
			else
				for R, g in T do
					q[R] = g
				end
			end
		end
	end

local G = function(R)
		local T = R[10]
		local q = R[9]
		local g = R[15]
		local l = R[12]
		local m = R[20]
		local d = R[13]
		local Z = R[5]
		local F = R[14]
		local A = R[0]
		local _ = R[2]
		local n = R[11]
		local v = R[19]
		local J = R[8]
		local s = R[21]
		local G = R[18]
		local a = R[6]
		local H = R[16]
		local Y = R[17]
		local N = R[4]
		local U = R[3]
		local i = R[1]
		local L = R[7]
		return function()
			local R, c = Toggles.esp_name.Value, Toggles.esp_distance.Value
			local y = Toggles.esp_weapon.Value
			local O, t = Toggles.esp_box.Value, Toggles.esp_fill.Value
			local B = Toggles.esp_skeleton.Value
			local f, Q = Toggles.esp_skeleton_outline.Value, Options.esp_skeleton_thickness.Value
			local z, j = Toggles.esp_healthbar_resize.Value, Options.esp_healthbar_health_lerp.Value
			local S = Options.esp_bounds_type.Value == "dynamic"
			local u = Options.esp_bounds_width_scale.Value / 100
			local w = Toggles.esp_show_team.Value
			local x = false
			local o = function()
				x = (L[3][L[2]] or R or c or y or O or t or B)
			end
			o()
			do
				Toggles.esp_healthbar:OnChanged(function(V)
					L[3][L[2]] = V
					o()
				end)
				Toggles.esp_name:OnChanged(function(V)
					R = V
					o()
				end)
				Toggles.esp_distance:OnChanged(function(V)
					c = V
					o()
				end)
				Toggles.esp_weapon:OnChanged(function(V)
					y = V
					o()
				end)
				Toggles.esp_box:OnChanged(function(V)
					O = V
					o()
				end)
				Toggles.esp_fill:OnChanged(function(V)
					t = V
					o()
				end)
				Toggles.esp_skeleton:OnChanged(function(V)
					B = V
					o()
				end)
				Toggles.esp_show_team:OnChanged(function(o)
					w = o
					J.events.esp_color_changed:Fire()
					J.events.esp_effects_changed:Fire()
				end)
				Options.esp_bounds_width_scale:OnChanged(function(o)
					u = o / 100
				end)
				Options.esp_bounds_type:OnChanged(function(o)
					S = o == "dynamic"
				end)
				Options.esp_skeleton_thickness:OnChanged(function(o)
					Q = o
				end)
				Toggles.esp_skeleton_outline:OnChanged(function(o)
					f = o
				end)
				Toggles.esp_healthbar_resize:OnChanged(function(o)
					z = o
				end)
				Options.esp_healthbar_health_lerp:OnChanged(function(o)
					j = o
				end)
			end
			local o, V = Z.CFrame.UpVector, Z.CFrame.Position
			local X = tick
			do
				local I = {}
				local r = function(b, C, M)
					if (not C or not M) then
						return
					end
					local E, W = C.Value, M.Value
					C:OnChanged(function(C)
						E = C
					end)
					M:OnChanged(function(C)
						W = C
					end)
					local C = _.gradients[b]
					table.insert(I, function(b)
						if E then
							local M = (b * 360 * W) % 360
							for b, b in pairs(C) do
								b.Rotation = M
							end
						end
					end)
				end
				for b in _.gradients do
					if (b ~= "healthbar") then
						r(b, Toggles["esp_" .. b .. "_moving"], Options["esp_" .. b .. "_rotation_speed"])
					end
				end
				local r, r = _.gradients.fill, _.gradients.box
				local r = pairs
				Y.RenderStepped:Connect(function()
					local b = Z.CFrame
					V, o = b.Position, b.UpVector
					local Z = X()
					for X, X in r(I) do
						X(Z)
					end
				end)
			end
			local Z = {
				"RightHand",
				"LeftLowerArm",
				"RightLowerArm",
				"LeftUpperArm",
				"RightUpperArm",
				"LowerTorso",
				"LeftLowerLeg",
				"LeftUpperLeg",
				"LeftFoot",
				"RightFoot",
				"RightLowerLeg",
				"RightUpperLeg",
				"UpperTorso",
				"LeftHand",
				"Head",
			}
			local X = {}
			return function(I, r)
				local b =
					{ connections = {}, gradients = {}, functions = {}, drawings = {}, squares = {}, text = {}, lines = {} }
				if _.running[I] then
					return H(I, "attempted to initialize twice")
				end
				local H = I.Character
				local C = H and H:FindFirstChild("Humanoid")
				local M = H and H:FindFirstChild("HumanoidRootPart")
				if not I.Parent then
					return
				end
				local E = J.effects.self_effects.new("esp")
				local W, W = U(0, 2.5, 0), U(0, 3.5, 0)
				local W = A(5, q[Options.esp_font.Value].size - 2)
				local e = Vector2.zero.Floor
				local k, P = pairs, {}
				local D = function()
					local p, p = g[3][g[2]](M.Position)
					if not p then
						return
					end
					local p, h = i, i
					local K, RT = -i, -i
					local TT = false
					for qT, qT in k(P) do
						local gT, lT = qT.CFrame, qT.Size * 0.5
						local qT, mT, dT = lT.X, lT.Y, lT.Z
						for lT, lT in
							{
								gT * a(-qT, -mT, -dT),
								gT * a(-qT, -mT, dT),
								gT * a(-qT, mT, -dT),
								gT * a(-qT, mT, dT),
								gT * a(qT, -mT, -dT),
								gT * a(qT, -mT, dT),
								gT * a(qT, mT, -dT),
								gT * a(qT, mT, dT),
							}
						do
							local a, qT = g[3][g[2]](lT.Position)
							if not qT then
								continue
							end
							TT = true
							local qT, gT = a.X, a.Y
							p, h = v(p, qT), v(h, gT)
							K, RT = T(K, qT), T(RT, gT)
						end
					end
					if not TT then
						return
					end
					local v = T(10, K - p)
					local a = T(10, RT - h)
					local K = e(A(v, a))
					local v = e(A(p + K.X / 2, h))
					return K, v, M.Position
				end
				local v = function()
					if S then
						return D()
					end
					local a = M.Position
					local S = a + o * 2.5
					local D, p = g[3][g[2]](S)
					if not p then
						return
					end
					if ((a - V).Magnitude > 600) then
						return W, e(D), a
					end
					local S = a - o * 3.5
					local o, p = g[3][g[2]](S)
					if not p then
						return
					end
					local S = T(10, n(o.Y - D.Y))
					return e(A(S * u, S)), e(D), a
				end
				local n, a = C and C.Health or 0, C and C.MaxHealth or 100
				local S = function(u)
					H = u
					M = u:WaitForChild("HumanoidRootPart", math.huge)
					C = u:WaitForChild("Humanoid", math.huge)
					table.insert(
						b.connections,
						C:GetPropertyChangedSignal("Health"):Connect(function()
							n = C.Health
						end)
					)
					table.insert(
						b.connections,
						C:GetPropertyChangedSignal("MaxHealth"):Connect(function()
							a = C.MaxHealth
						end)
					)
					n, a = C.Health, C.MaxHealth
					for o, o in Z do
						P[o] = u:WaitForChild(o, i)
					end
					if (not w and r._is_ally) then
						return
					end
					local i = function()
						local o = u.Parent
						if (o ~= d) then
							task.wait()
							if (u.Parent ~= nil) then
								u.Parent = d
							end
						end
					end
					task.wait()
					pcall(i)
					local i = P.Head
					while (task.wait(1) and i.Parent and i.Transparency > 0.5) do
					end
					if ((not w and r._is_ally) or not i.Parent) then
						return
					end
					if (H and Toggles.esp_override_appearance.Value) then
						J.customization.self:change(H, function()
							local i = Options.esp_body_disables.Value
							return Toggles.esp_body_color.Value and Options.esp_body_color_value.Value,
								1 - (Options.esp_body_transparency.Value / 100),
								Toggles.esp_material.Value and Enum.Material[Options.esp_material_value.Value],
								i["decals"],
								i["clothing"]
						end)
					end
					for i, i in { "aura", "particle" } do
						if (H and Toggles["esp_effects_" .. i].Value) then
							E:create(H, Options["esp_effects_" .. i .. "_value"].Value, i)
						else
							E:destroy(i)
						end
					end
				end
				local i = function(u, o)
					local e = X[u]
					local D, p
					if not e then
						D, p = {}, 0
						while true do
							local h = (Options[u .. (p + 1)] or Options[u])
							if not h then
								break
							end
							p = p + 1
							table.insert(D, h)
						end
						X[u] = { D, p }
					else
						D, p = unpack(e)
					end
					local u = {}
					local X, e =
						(o and NumberSequenceKeypoint or ColorSequenceKeypoint).new, o and "Transparency" or "Value"
					for h, K in D do
						table.insert(u, X((h - 1) / (p - 1), K[e] or 0))
					end
					return (o and NumberSequence or ColorSequence).new(u)
				end
				local u = function(o, X)
					table.insert(_.gradients[o], X)
					b.gradients[o] = X
					return X
				end
				do
					for o = 1, 7 do
						b.squares[o] = l("Square", { Visible = false, Outline = true }, b.drawings)
					end
					do
						for o = 1, 26 do
							local X = (o > 13)
							table.insert(
								b.lines,
								l(
									"Line",
									{
										Visible = false,
										ZIndex = not X and 2 or nil,
										Thickness = Q + (X and 2 or 0),
										Color = X and Color3.new() or Color3.new(1, 1, 1),
									},
									b.drawings
								)
							)
						end
						do
							local o = {
								ColorSequence.new(Options.esp_skeleton_color2.Value, Options.esp_skeleton_color3.Value),
								ColorSequence.new(Options.esp_skeleton_color1.Value, Options.esp_skeleton_color2.Value),
								ColorSequence.new(Options.esp_skeleton_color1.Value),
							}
							for X = 1, 13 do
								local e = Instance.new("UIGradient", b.lines[X]._frame)
								local D = ((X - 1) % 3) + 1
								if (X == 13) then
									e.Color = ColorSequence.new(Options.esp_skeleton_color3.Value)
								else
									e.Color = o[D]
								end
							end
						end
					end
					local o = q[Options.esp_font.Value]
					for X = 1, 3 do
						local e = l(
							"Text",
							{ Outline = true, Visible = false, Color = Color3.new(1, 1, 1), Middle = true, Center = true, Size = 12 },
							b.drawings
						)
						e._frame.FontFace, e.Size = o.font, o.size
						b.text[X] = e
					end
					b.squares[1].Thickness = 3
					b.squares[2].ZIndex = 2
					b.squares[2].Color = Color3.new(1, 1, 1)
					b.squares[3].ZIndex = 2
					b.squares[3].Color = Color3.new(1, 1, 1)
					b.squares[4].Color = Color3.new(0, 0, 0)
					b.squares[3].Filled = true
					b.squares[4].Filled = true
					b.squares[3].Color = Color3.new(1, 1, 1)
					b.squares[5].ZIndex = 2
					b.squares[5].Color = Color3.new(1, 1, 1)
					b.squares[6].Color = Color3.new(0, 0, 0)
					b.squares[5].Filled = true
					b.squares[6].Filled = true
					b.squares[5].Color = Color3.new(1, 1, 1)
					local l = rawget(r, "ClientFighter")
					l = l and rawget(l, "EquippedItem")
					b.text[2].Text = l and l.Name or "none"
					b.text[1].Text = Options.esp_name_type.Value == "Name" and I.Name or I.DisplayName
					b.text[1]._frame.RichText = true
					for l, o in { "esp_name_", "esp_weapon_", "esp_distance_" } do
						local X = b.text[l]._frame
						local l = Instance.new("UIGradient", X)
						X.AnchorPoint, X.AutomaticSize = A(0.5, 0), Enum.AutomaticSize.XY
						l.Color, l.Rotation = i(o .. "color"), Options[o .. "rotation"].Value
						u(o:split("_")[2], l)
					end
					do
						local l = u("box", Instance.new("UIGradient", b.squares[2]._frame._stroke))
						l.Rotation = Options.esp_box_rotation.Value
						b.squares[2]._frame._stroke.UIGradient.Color = i("esp_box_color")
					end
					b.squares[7].Color = Color3.new(1, 1, 1)
					b.squares[7].Filled = true
				end
				local l = N[Options.esp_font.Value] or A(2, -1)
				do
					local o, X = b.squares[1], b.squares[2]
					local e, D = A(2, 2), A(1, 1)
					b.functions.box = function(p, h)
						if O then
							local O = h - A(p.X / 2, 0)
							X.Size = p
							o.Size = p + e
							X.Position = O
							o.Position = O - D
							X.Visible = true
							o.Visible = true
						else
							X.Visible = false
							o.Visible = false
						end
					end
				end
				do
					local O = b.squares[7]
					local o = u("fill", Instance.new("UIGradient", O._frame))
					do
						o.Color, o.Transparency, o.Rotation =
							i("esp_fill_color"), i("esp_fill_color", true), Options.esp_fill_rotation.Value
						O._frame._stroke:Destroy()
					end
					local X = A(2, 2)
					b.functions.fill = function(e, D, p)
						if t then
							local t = D - A(e.X / 2 - 1, -1)
							O.Size = e - X
							O.Position = t
							O.Visible = true
						else
							O.Visible = false
						end
					end
					table.insert(
						b.connections,
						J.events.esp_fill_changed.Event:Connect(function(...)
							o.Color, o.Transparency, o.Rotation =
								i("esp_fill_color"), i("esp_fill_color", true), Options.esp_fill_rotation.Value
						end)
					)
				end
				do
					local O = b.text[1]
					O._frame.AnchorPoint = A(0.5, 1)
					local t = A(0, 2)
					b.functions.name = function(o, o)
						if R then
							O.Position = o - t
							O.Visible = true
						else
							O.Visible = false
						end
					end
				end
				do
					local R = b.text[2]
					b.functions.weapon = function(O, t)
						if y then
							R.Position = t + A(0, O.Y + 1)
							R.Visible = true
						else
							R.Visible = false
						end
					end
					m(R, r)
				end
				do
					local R, m = b.text[3], b.text[2]
					b.functions.distance = function(y, O, t)
						if c then
							R.Position = O + A(0, (m.Visible and (y.Y + R.TextBounds.Y) or y.Y) + 2)
							R.Visible = true
							R.Text = "[" .. G((V - t).Magnitude) .. "]"
						else
							R.Visible = false
						end
					end
				end
				do
					local R = {
						{ "LeftUpperArm", "UpperTorso" },
						{ "LeftLowerArm", "LeftUpperArm" },
						{ "LeftLowerArm", "LeftHand" },
						{ "RightUpperArm", "UpperTorso" },
						{ "RightLowerArm", "RightUpperArm" },
						{ "RightHand", "RightLowerArm" },
						{ "LeftUpperLeg", "LowerTorso" },
						{ "LeftLowerLeg", "LeftUpperLeg" },
						{ "LeftFoot", "LeftLowerLeg" },
						{ "RightUpperLeg", "LowerTorso" },
						{ "RightLowerLeg", "RightUpperLeg" },
						{ "RightFoot", "RightLowerLeg" },
						{ "LowerTorso", "UpperTorso" },
					}
					local m = b.lines
					local G = m[1]
					local G = false
					local c = function()
						if G then
							return
						end
						G = true
						for y, y in m do
							y.Visible = false
						end
					end
					local y = #Z
					local Z = function()
						local O = {}
						local t = 0
						for o, V in k(P) do
							t = t + 1
							O[o] = g[3][g[2]](o ~= "UpperTorso" and V.Position or (V.Position + U(0, V.Size.Y / 3, 0)))
						end
						if (t ~= y) then
							return
						end
						return O
					end
					b.functions.skeleton = function()
						if not B then
							return c()
						end
						local g = Z()
						if not g then
							return c()
						end
						G = false
						for Z, G in R do
							local R, U = m[Z], m[Z + 13]
							local m, Z = g[G[1]], g[G[2]]
							local g = (m - Z).Unit
							R.From, R.To = m + g, Z - g
							if f then
								local G = g * 2
								U.From, U.To = m + G, Z - G
								U.Visible = true
							else
								U.Visible = false
							end
							R.Visible = true
						end
					end
				end
				do
					local R = u("healthbar", Instance.new("UIGradient", b.squares[3]._frame._stroke))
					R.Color = s[3][s[2]]
					R.Rotation = 90
					local g, m = b.squares[3], b.squares[4]
					g._frame.AnchorPoint = A(0, 1)
					m._frame.AnchorPoint = A(0, 1)
					local Z, Z = 0, 0
					local s = math.lerp
					local G = Options.esp_healthbar_health_lerp
					local G, U = A(0, 1), A(0, 2)
					local c = A(5, 0)
					local c = A(-1, 2)
					local y = A(1, -1)
					local y = A(1, -1)
					table.insert(
						b.connections,
						I.CharacterAdded:Connect(function()
							Z = 0
						end)
					)
					b.functions.healthbar = function(O, t, B)
						if L[3][L[2]] then
							t = t - G
							O = O + U
							local G = t - A(O.X / 2 + 6, -O.Y + 1) - c
							if L[3][L[2]] then
								local U = n / a
								Z = s(Z, U, j)
								local s = A(2, T(2, (O.Y - 2) * Z))
								g.Size = s
								g.Position = G
								R.Offset = A(0, (Z - 1))
								if z then
									m.Size = A(4, s.Y + 2)
									m.Position = G - y
								else
									m.Size = A(4, O.Y)
									m.Position = G - y
								end
								m.Visible = true
								g.Visible = true
							else
								m.Visible, g.Visible = false, false
							end
						else
							m.Visible, g.Visible = false, false
						end
					end
				end
				local R = false
				local T = function()
					if R then
						return
					end
					R = true
					for g, g in b.drawings do
						g.Visible = false
					end
				end
				table.insert(b.connections, I.CharacterAdded:Connect(S))
				table.insert(
					b.connections,
					I.CharacterRemoving:Connect(function(g)
						if (H == g) then
							H = nil
							M = nil
							C = nil
							n = 0
							b.text[2].Text = "none"
							table.clear(P)
						end
					end)
				)
				local g
				table.insert(
					b.connections,
					J.events.esp_color_changed.Event:Connect(function()
						for m, Z in { "esp_name_", "esp_weapon_", "esp_distance_" } do
							local s = b.text[m]._frame.UIGradient
							s.Color, s.Rotation = i(Z .. "color"), Options[Z .. "rotation"].Value
						end
						local m = b.squares[2]._frame._stroke.UIGradient
						m.Color = i("esp_box_color")
						m.Rotation = Options.esp_box_rotation.Value
						b.text[1].Text = I[Options.esp_name_type.Value]
						local m = q[Options.esp_font.Value]
						for Z, Z in b.text do
							Z._frame.FontFace, Z.Size = m.font, _G.A or m.size
						end
						do
							local m = {
								ColorSequence.new(Options.esp_skeleton_color2.Value, Options.esp_skeleton_color3.Value),
								ColorSequence.new(Options.esp_skeleton_color1.Value, Options.esp_skeleton_color2.Value),
								ColorSequence.new(Options.esp_skeleton_color1.Value),
							}
							for Z, s in b.lines do
								local G = (Z > 13)
								s.Thickness = Q + (G and 2 or 0)
								if not G then
									local G = s._frame.UIGradient
									local s = ((Z - 1) % 3) + 1
									if (Z == 13) then
										G.Color = ColorSequence.new(Options.esp_skeleton_color3.Value)
									else
										G.Color = m[s]
									end
								end
							end
						end
						local m = function()
							if ((w or not r._is_ally) and H and Toggles.esp_override_appearance.Value) then
								J.customization.self:change(H, function()
									local Z = Options.esp_body_disables.Value
									return Toggles.esp_body_color.Value and Options.esp_body_color_value.Value,
										1 - (Options.esp_body_transparency.Value / 100),
										Toggles.esp_material.Value and Enum.Material[Options.esp_material_value.Value],
										Z["decals"],
										Toggles.esp_material.Value and Options.esp_material_value.Value ~= "ForceField"
											or Z["clothing"]
								end)
							else
								J.customization.self:restore(H)
							end
						end
						local Z = P.Head
						if (H and (J.customization.self:get(H) or (Z and Z.Transparency < 0.5))) then
							m()
						elseif (H and Z and Toggles.esp_override_appearance.Value) then
							pcall(task.cancel, g)
							g = task.spawn(function()
								while (task.wait(1) and Z.Parent and Z.Transparency > 0.5) do
								end
								if Z.Parent then
									m()
								end
							end)
						end
						l = N[Options.esp_font.Value] or A(2, -1)
						W = A(5, q[Options.esp_font.Value].size - 2)
						if (H and H.Parent) then
							local q = H.Parent
							if (not w and r._is_ally) then
								pcall(F, H, "Parent", workspace)
							else
								pcall(F, H, "Parent", d)
							end
						end
					end)
				)
				table.insert(
					b.connections,
					J.events.esp_effects_changed.Event:Connect(function()
						for q, q in { "aura", "particle" } do
							if (not w and r._is_ally) then
								E:destroy(q)
								continue
							end
							if (H and Toggles["esp_effects_" .. q].Value) then
								E:create(H, Options["esp_effects_" .. q .. "_value"].Value, q)
							else
								E:destroy(q)
							end
						end
					end)
				)
				table.insert(
					b.connections,
					J.events.esp_effects_color_changed.Event:Connect(function()
						for q, q in { "aura", "particle" } do
							E:update(q)
						end
					end)
				)
				local q, g, l, m, d, d, Z =
					b.functions.box,
					b.functions.fill,
					b.functions.name,
					b.functions.weapon,
					b.functions.accuracy,
					b.functions.distance,
					b.functions.healthbar
				local F = b.functions.skeleton
				table.insert(
					b.connections,
					Y.RenderStepped:Connect(function(A)
						if (not x or not M or (not w and r._is_ally)) then
							return T()
						end
						if (n <= 0) then
							return T()
						end
						local n, J, s = v()
						if not n then
							return T()
						end
						R = false
						F()
						q(n, J)
						l(n, J)
						g(n, J, A)
						m(n, J)
						d(n, J, s)
						Z(n, J, A)
					end)
				)
				if H then
					task.spawn(S, H)
				end
				table.clear(b.functions)
				_.running[I] = b
			end
		end
	end

local A_func = function(R)
		local T = R[2]
		local q = R[1]
		local g = R[0]
		local l = R[3]
		return function()
			if g.Value then
				local R = l.CFrame
				q._current.Position = R.Position + T
			end
		end
	end

local Y = function(R)
		local T = R[4]
		local q = R[0]
		local g = R[8]
		local l = R[3]
		local m = R[9]
		local d = R[7]
		local Z = R[2]
		local F = R[6]
		local A = R[1]
		local _ = R[5]
		return function()
			local R = A.Tabboxes
			function l:Remove()
				d:Destroy()
				table.clear(l)
				R[_.Name or ""] = nil
			end
			function l:AddTab(R, n)
				local v = {}
				local J = q:Create(
					T[3][T[2]],
					{
						BackgroundColor3 = q.MainColor,
						BorderSizePixel = 1,
						BorderColor3 = Color3.fromRGB(0, 0, 0),
						Size = UDim2.new(0.5, 0, 1, 0),
						ZIndex = 6,
						Parent = Z,
					}
				)
				local s = q:Create(
					T[3][T[2]],
					{
						BackgroundColor3 = q.AccentColor,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(1, 0, 0, 1),
						ZIndex = 8,
						Visible = n or false,
						Parent = J,
					}
				)
				q:AddToRegistry(s, { BackgroundColor3 = "AccentColor" })
				local G = n and UDim2.new(1, -1, 1, 0) or UDim2.new(1, 0, 1, 0)
				local n = q:Create(
					T[3][T[2]],
					{
						BackgroundTransparency = 0,
						BackgroundColor3 = q.MainColor,
						BorderSizePixel = 1,
						BorderColor3 = q.OutlineColor,
						BorderMode = Enum.BorderMode.Inset,
						Size = G,
						ZIndex = 7,
						Parent = J,
					}
				)
				q:AddToRegistry(J, { BackgroundColor3 = "MainColor" })
				q:AddToRegistry(n, { BackgroundColor3 = "MainColor", BorderColor3 = m[3][m[2]] })
				local m = q:CreateLabel({
					Size = UDim2.new(1, 0, 1, 0),
					TextSize = 14,
					Text = R,
					TextXAlignment = Enum.TextXAlignment.Center,
					ZIndex = 7,
					Parent = J,
				})
				local m = q:Create(
					T[3][T[2]],
					{
						BackgroundColor3 = q.BackgroundColor,
						BorderSizePixel = 0,
						Position = UDim2.new(0, 0, 1, 0),
						Size = UDim2.new(1, 0, 0, 1),
						Visible = false,
						ZIndex = 9,
						Parent = J,
					}
				)
				q:AddToRegistry(m, { BackgroundColor3 = "BackgroundColor" })
				local G = q:Create(
					T[3][T[2]],
					{
						BackgroundTransparency = 1,
						Position = UDim2.new(0, 4, 0, 20),
						Size = UDim2.new(1, -4, 1, -20),
						ZIndex = 1,
						Visible = false,
						Parent = g,
					}
				)
				q:Create(
					"UIListLayout",
					{ FillDirection = Enum.FillDirection.Vertical, SortOrder = Enum.SortOrder.LayoutOrder, Parent = G }
				)
				function v:Show()
					for T, T in next, l.Tabs do
						T:Hide()
					end
					G.Visible = true
					m.Visible = true
					n.Visible = false
					s.Visible = true
					J.BackgroundColor3 = q.BackgroundColor
					q.RegistryMap[J].Properties.BackgroundColor3 = "BackgroundColor"
					v:Resize()
				end
				function v:Hide()
					G.Visible = false
					m.Visible = false
					n.Visible = true
					s.Visible = false
					J.BackgroundColor3 = q.MainColor
					q.RegistryMap[J].Properties.BackgroundColor3 = "MainColor"
				end
				function v:Resize()
					local T = 0
					for g, g in next, l.Tabs do
						T = T + 1
					end
					for g, g in next, Z:GetChildren() do
						if not g:IsA("UIListLayout") then
							g.Size = UDim2.new(1 / T, 0, 1, 0)
						end
					end
					if not G.Visible then
						return
					end
					local T = 0
					for g, g in next, v.Container:GetChildren() do
						if (not g:IsA("UIListLayout")) and g.Visible then
							T = T + g.Size.Y.Offset
						end
					end
					d.Size = UDim2.new(1, 0, 0, 20 + T + 2 + 2)
				end
				J.InputBegan:Connect(function(T)
					if
						(T.UserInputType == Enum.UserInputType.MouseButton1 and not q:MouseIsOverOpenedFrame())
						or T.UserInputType == Enum.UserInputType.Touch
					then
						v:Show()
						v:Resize()
					end
				end)
				v.Container = G
				l.Tabs[R] = v
				setmetatable(v, F)
				v:AddBlank(3)
				v:Resize()
				if #Z:GetChildren() == 2 then
					v:Show()
				end
				return v
			end
			A.Tabboxes[_.Name or ""] = l
		end
	end

local r = function(R)
		local T = R[2]
		local q = R[1]
		local g = R[0]
		return function()
			local R = cloneref or function(l)
				return l
			end
			local l = R(game:GetService("HttpService"))
			local R = (syn and syn.request)
				or (http and http.request)
				or http_request
				or (fluxus and fluxus.request)
				or request
			local R = getcustomasset or getsynasset
			do
				g.Folder = ""
				g.Library = nil
				g.BuiltInThemes = {
					["Default"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"131313",\n\t\t\t\t"AccentColor":"a2cdff",\n\t\t\t\t"BackgroundColor":"151515",\n\t\t\t\t"OutlineColor":"212121",\n\t\t\t\t"RiskColor":"ff7425",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Tokyo Night"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"191925",\n\t\t\t\t"AccentColor":"6956cb",\n\t\t\t\t"BackgroundColor":"15151e",\n\t\t\t\t"OutlineColor":"272727",\n\t\t\t\t"RiskColor":"fb5f5f",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Nord"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"1c1e20",\n\t\t\t\t"AccentColor":"9effc8",\n\t\t\t\t"BackgroundColor":"1c1e20",\n\t\t\t\t"OutlineColor":"24282d",\n\t\t\t\t"RiskColor":"ff7a00",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Skeet"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"131313",\n\t\t\t\t"AccentColor":"81ff54",\n\t\t\t\t"BackgroundColor":"151515",\n\t\t\t\t"OutlineColor":"2a2a2a",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Fatality"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"181537",\n\t\t\t\t"AccentColor":"ca0756",\n\t\t\t\t"BackgroundColor":"201c46",\n\t\t\t\t"OutlineColor":"39335a",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Neverlose"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"0c1014",\n\t\t\t\t"AccentColor":"01a3f1",\n\t\t\t\t"BackgroundColor":"0c0f14",\n\t\t\t\t"OutlineColor":"191919",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Onetap"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"1e1d22",\n\t\t\t\t"AccentColor":"faa614",\n\t\t\t\t"BackgroundColor":"18181c",\n\t\t\t\t"OutlineColor":"313033",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Imgui"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"151617",\n\t\t\t\t"AccentColor":"406ba8",\n\t\t\t\t"BackgroundColor":"151617",\n\t\t\t\t"OutlineColor":"242424",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Iniuria"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"1e1d1e",\n\t\t\t\t"AccentColor":"c41275",\n\t\t\t\t"BackgroundColor":"1e1d1e",\n\t\t\t\t"OutlineColor":"33252b",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Primordial"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"181818",\n\t\t\t\t"AccentColor":"d7a6b0",\n\t\t\t\t"BackgroundColor":"1f1f1f",\n\t\t\t\t"OutlineColor":"2a2a2a",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Monolith"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"141115",\n\t\t\t\t"AccentColor":"c707bd",\n\t\t\t\t"BackgroundColor":"171417",\n\t\t\t\t"OutlineColor":"272427",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["V3rmillion"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"202020",\n\t\t\t\t"AccentColor":"cd1818",\n\t\t\t\t"BackgroundColor":"202020",\n\t\t\t\t"OutlineColor":"2a2a2a",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
					["Dark"] = {
						1,
						l:JSONDecode(
							'{\n\t\t\t\t"FontColor":"ffffff",\n\t\t\t\t"MainColor":"0a0a0a",\n\t\t\t\t"AccentColor":"5945ff",\n\t\t\t\t"BackgroundColor":"0a0a0a",\n\t\t\t\t"OutlineColor":"171717",\n\t\t\t\t"RiskColor":"e50000",\n\n\t\t\t\t"ItemType":"Unnamed Enhancements",\n\t\t\t\t"SwordColor":"ffffff",\n\t\t\t\t"SwordTransparency":"0",\n\t\t\t\t"SwordReflectance":"0",\n\t\t\t\t"SwordSpeed":"0.15",\n\t\t\t\t"SwordMaterial":"Neon",\n\n\t\t\t\t"Contrast":"0",\n\t\t\t\t"Saturation":"0",\n\t\t\t\t"Brightness":"0",\n\n\n\t\t\t\t"BackColor":"000000",\n\t\t\t\t"BlurSize":"15",\n\t\t\t\t"BackTransparency":"0.7"\n\t\t\t}'
						),
					},
				}
				function g:ApplyTheme(R)
					if not R then
						return
					end
					local m = self:GetCustomTheme(R)
					local d = m or self.BuiltInThemes[R]
					if not d then
						return
					end
					if self.Library.InnerVideoBackground ~= nil then
						self.Library.InnerVideoBackground.Visible = false
					end
					local R = d[2]
					for d, Z in next, m or R do
						if d:find("Color") then
							self.Library[d] = Color3.fromHex(Z)
							if q[d] then
								q[d]:SetValueRGB(Color3.fromHex(Z))
							end
						else
							self.Library[d] = Z
							if q[d] then
								q[d]:SetValue(Z)
							end
						end
					end
					self:ThemeUpdate()
				end
				function g:ThemeUpdate()
					if self.Library.InnerVideoBackground ~= nil then
						self.Library.InnerVideoBackground.Visible = false
					end
					local R = {
						"Contrast",
						"Saturation",
						"Brightness",
						"BlurSize",
						"FontColor",
						"RiskColor",
						"MainColor",
						"AccentColor",
						"BackgroundColor",
						T[3][T[2]],
						"SwordColor",
						"ItemType",
						"BackTransparency",
						"BackColor",
						"SwordTransparency",
						"SwordReflectance",
						"SwordMaterial",
						"SwordSpeed",
					}
					for m, m in next, R do
						if q and q[m] then
							self.Library[m] = q[m].Value
						end
					end
					self.Library.AccentColorDark = self.Library:GetDarkerColor(self.Library.AccentColor)
					self.Library:UpdateColorsUsingRegistry()
				end
				function g:LoadDefault()
					local R = "Default"
					local m = isfile(self.Folder .. "/themes/default.txt")
						and readfile(self.Folder .. "/themes/default.txt")
					local d = true
					if m then
						if self.BuiltInThemes[m] then
							R = m
						elseif self:GetCustomTheme(m) then
							R = m
							d = false
						end
					elseif self.BuiltInThemes[self.DefaultTheme] then
						R = self.DefaultTheme
					end
					if d then
						q.ThemeManager_ThemeList:SetValue(R)
					else
						self:ApplyTheme(R)
					end
				end
				function g:SaveDefault(R)
					writefile(self.Folder .. "/themes/default.txt", R)
				end
				function g:Delete(R)
					if not R then
						return false, "no config file is selected"
					end
					local m = self.Folder .. "/themes/" .. R
					if not isfile(m) then
						return false, "invalid file"
					end
					local R, d = pcall(delfile, m)
					if not R then
						return false, "delete file error"
					end
					return true
				end
				function g:GetCustomTheme(R)
					if not R then
						return
					end
					local m = self.Folder .. "/themes/" .. R
					if not isfile(m) then
						return nil
					end
					local R = readfile(m)
					local m, d = pcall(l.JSONDecode, l, R)
					if not m then
						return nil
					end
					return d
				end
				function g:SaveCustomTheme(R)
					if not R or R:gsub(" ", "") == "" then
						return self.Library:Notify("Invalid file name for theme (empty)", 3)
					end
					local m = {}
					local d = {
						"Contrast",
						"Saturation",
						"Brightness",
						"BlurSize",
						"FontColor",
						"RiskColor",
						"MainColor",
						"AccentColor",
						"BackgroundColor",
						T[3][T[2]],
						"ItemType",
						"SwordColor",
						"BackTransparency",
						"BackColor",
						"SwordTransparency",
						"SwordReflectance",
						"SwordMaterial",
						"SwordSpeed",
					}
					for T, T in next, d do
						if q[T] then
							if not T:find("Color") then
								m[T] = q[T].Value
							else
								m[T] = q[T].Value:ToHex()
							end
						end
					end
					writefile(self.Folder .. "/themes/" .. R, l:JSONEncode(m))
				end
				function g:ReloadCustomThemes()
					local R = listfiles(self.Folder .. "/themes")
					local T = {}
					for q = 1, #R do
						local l = R[q]
						if l:sub(-5) == ".json" then
							local R = l:find(".json", 1, true)
							local q = l:sub(R, R)
							while q ~= "/" and q ~= "\\" and q ~= "" do
								R = R - 1
								q = l:sub(R, R)
							end
							if q == "/" or q == "\\" then
								table.insert(T, l:sub(R + 1))
							end
						end
					end
					return T
				end
				function g:SetLibrary(R)
					self.Library = R
				end
				function g:BuildFolderTree()
					local R = {}
					local T = self.Folder:split("/")
					for q = 1, #T do
						R[#R + 1] = table.concat(T, "/", 1, q)
					end
					table.insert(R, self.Folder .. "/themes")
					for T = 1, #R do
						local q = R[T]
						if not isfolder(q) then
							makefolder(q)
						end
					end
				end
				function g:SetFolder(R)
					self.Folder = R
					self:BuildFolderTree()
				end
				function g:CreateGroupBox(R)
					assert(self.Library, "Must set ThemeManager.Library first!")
					return R:AddLeftTabbox()
				end
				function g:ApplyToTab(R)
					assert(self.Library, "Must set ThemeManager.Library first!")
					local T = self:CreateGroupBox(R)
					self:CreateThemeManager(T)
				end
				function g:ApplyToGroupbox(R)
					assert(self.Library, "Must set ThemeManager.Library first!")
					self:CreateThemeManager(R)
				end
			end
			getgenv().ThemeManager = g
		end
	end

local o = function(R)
		local T = R[33]
		local q = R[22]
		local g = R[21]
		local l = R[13]
		local m = R[30]
		local d = R[2]
		local Z = R[20]
		local F = R[16]
		local A = R[7]
		local _ = R[29]
		local n = R[17]
		local v = R[28]
		local J = R[27]
		local s = R[15]
		local G = R[6]
		local a = R[8]
		local H = R[10]
		local Y = R[3]
		local N = R[11]
		local U = R[19]
		local i = R[9]
		local L = R[14]
		local c = R[25]
		local y = R[5]
		local O = R[24]
		local t = R[0]
		local B = R[1]
		local f = R[32]
		local Q = R[12]
		local z = R[23]
		local j = R[4]
		local S = R[18]
		local u = R[26]
		local w = R[31]
		return function(R, x, o, V, X, I)
			q(8)
			I = O[3][O[2]](I)
			local O, r = f.Value, J.Value
			local J = F.Value
			local F = d.Value
			local d, f
			local b, C = nil, nil
			if o then
				local M, E = O["position on target"], r["position on target"]
				if (M or E or J["position on target"] or F["position on target"]) then
					local W, e
					if X then
						W, e = V, X
					else
						W, e = G[3][G[2]](o.Position)
					end
					if e then
						V, b, X = W, W, e
						if M then
							f = B.Position:Lerp(V, y.Value)
						end
						if E then
							d = U.Position:Lerp(V, a.Value)
						end
					end
				end
			end
			local M = u[3][u[2]].EquippedItem
			if (M and M.ViewModel and M.Info.Type == "Gun") then
				local u, E = not f and O["position on barrel"], not d and r["position on barrel"]
				if (u or E or J["position on barrel"] or F["position on barrel"]) then
					local O = M.ViewModel
					if (O and (#O._muzzle_attachments > 0 or (O._body_model and O._body_model.PrimaryPart))) then
						local r, W, e = pcall(function()
							return G[3][G[2]](O:GetMuzzlePosition())
						end)
						q(8)
						if (r and e) then
							C = W
							if u then
								f = B.Position:Lerp(W, y.Value)
							end
							if E then
								d = U.Position:Lerp(W, a.Value)
							end
						end
					end
				end
				if l[3][l[2]] then
					local q, l = _[3][_[2]], ""
					local _, O, u = M.Info.MaxAmmo, M.Data.AmmoReserve, M.Data.Ammo
					if ((_ and _ ~= i) and (O and O ~= i) and (u and u ~= i)) then
						if q.ammo then
							I = I .. Z("ammo", u)
							l = Z("ammo divider", "/")
						end
						if q["max ammo"] then
							I = I .. l .. Z("max ammo", _)
							l = Z("ammo divider", "/")
						end
						if q["reserve"] then
							I = I .. l .. Z("reserve", O)
						end
						if (I ~= "") then
							I = I .. "\n"
						end
					end
				end
			end
			if not d then
				d = U.Position:Lerp(R, a.Value)
			end
			if not f then
				f = B.Position:Lerp(R, y.Value)
			end
			local q = (F["position on target"] and b) or (F["position on barrel"] and C) or R
			c[3][c[2]] = c[3][c[2]]:Lerp(q, z.Value)
			s.Position = c[3][c[2]] + m[3][m[2]]
			s.Text = I
			local q = Q()
			L[3][L[2]]((J["position on target"] and b) or (J["position on barrel"] and C) or R, q)
			B.Position, U.Position = f, d
			Y.Position, n.Position = f, d
			if v.Value then
				local R = (q * 360 * H.Value) % 360
				for l, l in N do
					l.Rotation = R
				end
			end
			if w.Value then
				local R = (q * 360 * A.Value) % 360
				for q, q in T do
					q.Rotation = R
				end
			end
			if (o and X) then
				if j.Value then
					t.Adornee = x
					t.Enabled = true
				else
					t.Adornee = nil
					t.Enabled = false
				end
				if S.Value then
					g.Visible = true
					g.To = V or G[3][G[2]](o.Position)
					g.From = f
				else
					g.Visible = false
				end
			else
				g.Visible = false
				t.Adornee = nil
				t.Enabled = false
			end
		end
	end

local N = function(R)
		local T = R[10]
		local q = R[21]
		local g = R[16]
		local l = R[6]
		local m = R[7]
		local d = R[9]
		local Z = R[23]
		local F = R[18]
		local A = R[2]
		local _ = R[8]
		local n = R[19]
		local v = R[24]
		local J = R[22]
		local s = R[5]
		local G = R[3]
		local a = R[14]
		local H = R[0]
		local Y = R[4]
		local N = R[13]
		local U = R[17]
		local i = R[15]
		local L = R[1]
		local c = R[20]
		local y = R[12]
		local O = R[11]
		return function()
			local R = L:AddContextMenu(a)
			R:AddOption("Make gradient", function()
				local t = {}
				for B, B in J.Addons do
					if (B.Type == "ColorPicker") then
						table.insert(t, B)
					end
				end
				if (#t < 3) then
					R:Hide()
					return L:Notify("not enough colors for a gradient.", 2)
				end
				local B, f = t[1].Value, t[#t].Value
				for Q = 2, #t - 1 do
					local z = t[Q]
					z:SetValueRGB(B:Lerp(f, Q / #t), z.Transparency)
				end
				L:Notify("created gradient!", 2)
				R:Hide()
			end)
			R:AddOption("Match color", function()
				local t = {}
				for B, B in J.Addons do
					if (B.Type == "ColorPicker") then
						table.insert(t, B)
					end
				end
				for J, J in t do
					J:SetValueRGB(H.Value, J.Transparency)
				end
				L:Notify("matched all colors!", 2)
				R:Hide()
			end)
			R:AddOption("Copy color", function()
				L.ColorClipboard = H
				L:Notify("Copied color!", 2)
				R:Hide()
			end)
			R:AddOption("Paste color", function()
				if not L.ColorClipboard then
					return L:Notify("You have not copied a color!", 2)
				end
				H:SetValueRGB(L.ColorClipboard.Value, L.ColorClipboard.Transparency)
				R:Hide()
			end)
			if L.FlagCopying then
				R:AddOption("Copy Flag", function()
					pcall(setclipboard, H.Idx)
					task.wait()
					L:Notify("Copied flag to clipboard!", 2)
					R:Hide()
				end)
			end
			L:AddToRegistry(Z, { BackgroundColor3 = "BackgroundColor", BorderColor3 = O[3][O[2]] })
			L:AddToRegistry(i, { BackgroundColor3 = "AccentColor" })
			L:AddToRegistry(n, { BackgroundColor3 = "BackgroundColor", BorderColor3 = O[3][O[2]] })
			L:AddToRegistry(q, { BackgroundColor3 = "MainColor", BorderColor3 = O[3][O[2]] })
			L:AddToRegistry(v.Frame, { BackgroundColor3 = "MainColor", BorderColor3 = O[3][O[2]] })
			L:AddToRegistry(_, { TextColor3 = "FontColor" })
			L:AddToRegistry(l, { TextColor3 = "FontColor" })
			local R = {}
			for q = 0, 1, 0.1 do
				table.insert(R, ColorSequenceKeypoint.new(q, Color3.fromHSV(q, 1, 1)))
			end
			local q = L:Create("UIGradient", { Color = ColorSequence.new(R), Rotation = 90, Parent = N })
			l.FocusLost:Connect(function(R)
				if R then
					local R, q = pcall(Color3.fromHex, l.Text)
					if R and typeof(q) == "Color3" then
						H.Hue, H.Sat, H.Vib = Color3.toHSV(q)
					end
				end
				H:Display()
			end)
			_.FocusLost:Connect(function(R)
				if R then
					local R, q, Z = _.Text:match("(%d+),%s*(%d+),%s*(%d+)")
					if R and q and Z then
						H.Hue, H.Sat, H.Vib = Color3.toHSV(Color3.fromRGB(R, q, Z))
					end
				end
				H:Display()
			end)
			function H:Display()
				H.Value = Color3.fromHSV(H.Hue, H.Sat, H.Vib)
				d.BackgroundColor3 = Color3.fromHSV(H.Hue, 1, 1)
				L:Create(
					a,
					{
						BackgroundColor3 = H.Value,
						BackgroundTransparency = H.Transparency,
						BorderColor3 = L:GetDarkerColor(H.Value),
					}
				)
				if s[3][s[2]] then
					s[3][s[2]].BackgroundColor3 = H.Value
					g[3][g[2]].Position = UDim2.new(1 - H.Transparency, 0, 0, 0)
				end
				U.Position = UDim2.new(H.Sat, 0, 1 - H.Vib, 0)
				F.Position = UDim2.new(0, 0, H.Hue, 0)
				l.Text = "#" .. H.Value:ToHex()
				_.Text = table.concat(
					{ math.floor(H.Value.R * 255), math.floor(H.Value.G * 255), math.floor(H.Value.B * 255) },
					", "
				)
				L:SafeCallback(H.Callback, H.Value)
				L:SafeCallback(H.Changed, H.Value)
			end
			function H:OnChanged(R)
				H.Changed = R
				R(H.Value)
			end
			local R = false
			function H:Show()
				R = true
				for q, g in next, L.OpenedFrames do
					if q.Name == "Color" then
						q.Visible = false
						L.OpenedFrames[q] = nil
					end
				end
				A.Visible = true
				L.OpenedFrames[A] = true
			end
			function H:Hide()
				R = false
				A.Visible = false
				L.OpenedFrames[A] = nil
			end
			function H:SetValue(q, g)
				local l = Color3.fromHSV(q[1], q[2], q[3])
				H.Transparency = g or 0
				H:SetHSVFromRGB(l)
				H:Display()
			end
			function H:Remove()
				c[y] = nil
				table.clear(H)
			end
			function H:SetValueRGB(q, g)
				H.Transparency = g or 0
				H:SetHSVFromRGB(q)
				H:Display()
			end
			d.InputBegan:Connect(function(q)
				if q.UserInputType == Enum.UserInputType.MouseButton1 then
					while T:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local q = d.AbsolutePosition.X
						local g = q + d.AbsoluteSize.X
						local l = math.clamp(m.X, q, g)
						local Z = d.AbsolutePosition.Y
						local F = Z + d.AbsoluteSize.Y
						local d = math.clamp(m.Y, Z, F)
						H.Sat = (l - q) / (g - q)
						H.Vib = 1 - ((d - Z) / (F - Z))
						H:Display()
						Y:Wait()
					end
					L:AttemptSave()
				end
			end)
			N.InputBegan:Connect(function(q)
				if q.UserInputType == Enum.UserInputType.MouseButton1 then
					while T:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local q = N.AbsolutePosition.Y
						local g = q + N.AbsoluteSize.Y
						local l = math.clamp(m.Y, q, g)
						H.Hue = ((l - q) / (g - q))
						H:Display()
						Y:Wait()
					end
					L:AttemptSave()
				end
			end)
			a.InputBegan:Connect(function(q)
				if q.UserInputType == Enum.UserInputType.MouseButton1 and not L:MouseIsOverOpenedFrame() then
					if A.Visible then
						H:Hide()
					else
						H:Show()
					end
				elseif q.UserInputType == Enum.UserInputType.MouseButton2 and not L:MouseIsOverOpenedFrame() then
					H:Hide()
				end
			end)
			if s[3][s[2]] then
				s[3][s[2]].InputBegan:Connect(function(q)
					if q.UserInputType == Enum.UserInputType.MouseButton1 then
						while T:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							local T = s[3][s[2]].AbsolutePosition.X
							local q = T + s[3][s[2]].AbsoluteSize.X
							local g = math.clamp(m.X, T, q)
							H.Transparency = 1 - ((g - T) / (q - T))
							H:Display()
							Y:Wait()
						end
						L:AttemptSave()
					end
				end)
			end
			local T = function()
				if not R then
					return
				end
				local R, q = A.AbsolutePosition, A.AbsoluteSize
				if (m.X < R.X or m.X > R.X + q.X or m.Y < (R.Y - 20 - 1) or m.Y > R.Y + q.Y) then
					H:Hide()
				end
			end
			for R, R in { Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2 } do
				L:BindToInput(R, T)
			end
			H:Display()
			H.DisplayFrame = a
			c[y] = H
			G.Addons = G.Addons or {}
			table.insert(G.Addons, H)
			if G.ToggleRegion then
				G.ColorPickerCount = G.ColorPickerCount + 1
				if (G.ColorPickerCount > 2) then
					G.ToggleRegion.Size = G.ToggleRegion.Size - UDim2.new(0, 32, 0, 0)
				end
			end
		end
	end

local D = function(R)
		local T = R[2]
		local q = R[0]
		local g = R[4]
		local l = R[1]
		local m = R[3]
		return function()
			function l:AddButton(...)
				local R = typeof(select(1, ...)) == "table" and select(1, ...)
					or { Text = select(1, ...), Func = select(2, ...) }
				assert(typeof(R.Func) == "function", "AddButton: `Func` callback is missing.")
				self.Outer.Size = UDim2.new(0.5, -2, 0, 20)
				R.Outer, R.Inner, R.Label = g(R)
				R.Outer.Position = UDim2.new(1, 3, 0, 0)
				R.Outer.Size = UDim2.new(1, -3, 1, 0)
				R.Outer.Parent = self.Outer
				function R:AddTooltip(g)
					if typeof(g) == "string" then
						m:AddToolTip(g, self.Outer)
					end
					return R
				end
				if typeof(R.Tooltip) == "string" then
					R:AddTooltip(R.Tooltip)
				end
				T(R)
				return R
			end
			local R = {}
			function l:Remove()
				for T, T in R do
					T:Destroy()
				end
				l.Outer:Destroy()
				table.clear(l)
				q:Resize()
			end
			if typeof(l.Tooltip) == "string" then
				l:AddTooltip(l.Tooltip)
			end
			table.insert(R, q:AddBlank(5))
			q:Resize()
		end
	end

local u = function(R)
		local T = R[1]
		local q = R[3]
		local g = R[0]
		local l = R[4]
		local m = R[5]
		local d = R[2]
		return function()
			function T:SetText(R)
				l.Text = R
				if q then
					local Z = select(2, g:GetTextBounds(R, g.Font, 14, Vector2.new(l.AbsoluteSize.X, math.huge)))
					l.Size = UDim2.new(1, -4, 0, Z)
				end
				d:Resize()
			end
			local R = {}
			function T:Remove()
				for g, g in R do
					g:Destroy()
				end
				l:Destroy()
				table.clear(T)
				d:Resize()
			end
			if not q then
				setmetatable(T, m)
			end
			table.insert(R, d:AddBlank(5))
			d:Resize()
		end
	end

local H = function(R)
		local T = R[2]
		local q = R[0]
		local g = R[5]
		local l = R[1]
		local m = R[3]
		local d = R[4]
		local Z = R[6]
		return function()
			function l:Resize()
				m.Size = UDim2.new(1, 0, 0, q.AbsoluteContentSize.Y)
				T:Resize()
			end
			q:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				l:Resize()
			end)
			m:GetPropertyChangedSignal("Visible"):Connect(function()
				l:Resize()
			end)
			function l:Update()
				local R = false
				for q, q in next, l.Dependencies do
					if (q[1].Value == q[2]) then
						R = true
						break
					end
				end
				m.Visible = R
				l:Resize()
			end
			function l:SetupDependencies(R)
				for q, q in next, R do
					assert(type(q) == "table", "SetupDependencies: Dependency is not of type `table`.")
					assert(q[1], "SetupDependencies: Dependency is missing element argument.")
					assert(q[2] ~= nil, "SetupDependencies: Dependency is missing value argument.")
				end
				l.Dependencies = R
				l:Update()
			end
			function l:Remove()
				table.remove(d.DependencyBoxes, table.find(d.DependencyBoxes, l))
				table.clear(l)
				m:Destroy()
				T:Resize()
			end
			l.Container = g
			setmetatable(l, Z)
			table.insert(d.DependencyBoxes, l)
		end
	end

local g = function(R)
		local T = R[5]
		local q = R[2]
		local g = R[6]
		local l = R[12]
		local m = R[11]
		local d = R[8]
		local Z = R[9]
		local F = R[10]
		local A = R[4]
		local _ = R[7]
		local n = R[0]
		local v = R[3]
		local J = R[1]
		return function(R, s, G)
			local a, H = n("Attachment", v), n("Attachment", v)
			a.WorldPosition, H.WorldPosition = R, R
			local R = _:Clone()
			local _ = F.Value
			R.Width0, R.Width1 = _, _
			R.LightEmission = d.Value
			R.TextureSpeed = A.Value
			R.TextureLength = m.Value
			R.Parent = a
			R.Color = G
			R.Attachment0 = a
			R.Attachment1 = H
			local m = { R }
			for d = 1, (q.Value - 1) do
				local q = R:Clone()
				q.Parent = R.Parent
				table.insert(m, q)
			end
			T:Create(H, g(Z.Value), { WorldPosition = s }):Play()
			task.delay(l.Value, function()
				local R
				for q, q in m do
					R = T:Create(q, g(J.Value), { Width0 = 0, Width1 = 0 })
					R:Play()
				end
				R.Completed:Wait()
				a:Destroy()
				H:Destroy()
			end)
		end
	end

local v = function(R)
		local T = R[4]
		local q = R[2]
		local g = R[3]
		local l = R[8]
		local m = R[0]
		local d = R[5]
		local Z = R[13]
		local F = R[10]
		local A = R[6]
		local _ = R[7]
		local n = R[1]
		local v = R[9]
		local J = R[14]
		local s = R[12]
		local G = R[11]
		return function()
			function m:Display()
				A.BackgroundColor3 = m.Value and g.AccentColor or g.MainColor
				A.BorderColor3 = m.Value and g.AccentColorDark or g.OutlineColor
				g.RegistryMap[A].Properties.BackgroundColor3 = m.Value and "AccentColor" or "MainColor"
				g.RegistryMap[A].Properties.BorderColor3 = m.Value and "AccentColorDark" or s[3][s[2]]
			end
			m.UpdateColors = m.Display
			function m:OnChanged(R)
				table.insert(m.ChangedFuncs, R)
				R(m.Value)
			end
			function m:SetValue(R)
				if m.SettingValue then
					return
				end
				m.SettingValue = true
				R = not not R
				m.Value = R
				m:Display()
				for A, A in next, m.Addons do
					if A.Type == "KeyPicker" and A.SyncToggleState then
						A.Toggled = R
						A:Update()
					end
				end
				g:SafeCallback(m.Callback, R)
				for A, A in m.ChangedFuncs do
					g:SafeCallback(A, R)
				end
				g:UpdateDependencyBoxes()
				m.SettingValue = false
			end
			function m:SetVisible(R)
				m.Visible = R
				T.Visible = m.Visible
				if Blank then
					Blank.Visible = m.Visible
				end
				d:Resize()
			end
			function m:Remove()
				for R, R in q do
					R:Destroy()
				end
				v[n] = nil
				J:Destroy()
				table.clear(m)
				d:Resize()
			end
			_.InputBegan:Connect(function(R)
				if
					(R.UserInputType == Enum.UserInputType.MouseButton1 and not g:MouseIsOverOpenedFrame())
					or R.UserInputType == Enum.UserInputType.Touch
				then
					m:SetValue(not m.Value)
					g:AttemptSave()
				end
			end)
			if g.FlagCopying then
				local R = g:AddContextMenu(T, _)
				R:AddOption("Copy Flag", function()
					pcall(setclipboard, m.Idx)
					task.wait()
					g:Notify("Copied flag to clipboard!", 2)
					R:Hide()
				end)
			end
			if m.Risky then
				g:RemoveFromRegistry(l)
				l.TextColor3 = g.RiskColor
				g:AddToRegistry(l, { TextColor3 = "RiskColor" })
			end
			m:Display()
			table.insert(q, d:AddBlank(G.BlankSize or 7))
			d:Resize()
			m.ColorPickerCount = 0
			m.ToggleRegion = _
			m.TextLabel = l
			m.Container = F
			setmetatable(m, Z)
			v[n] = m
			g:UpdateDependencyBoxes()
		end
	end

local l = function(R)
		local T = R[15]
		local q = R[5]
		local g = R[9]
		local l = R[14]
		local m = R[13]
		local d = R[3]
		local Z = R[16]
		local F = R[0]
		local A = R[17]
		local _ = R[1]
		local n = R[2]
		local v = R[8]
		local J = R[11]
		local s = R[4]
		local G = R[6]
		local a = R[12]
		local H = R[7]
		local Y = R[10]
		return function()
			function s:UpdateColors()
				q.BackgroundColor3 = _.AccentColor
				q.BorderColor3 = _.AccentColorDark
			end
			function s:Display()
				local R = J.Suffix or ""
				if J.Compact then
					Y.Text = J.Text .. ": " .. s.Value .. R
				elseif J.HideMax then
					Y.Text = string.format("%s", s.Value .. R)
				else
					Y.Text = string.format("%s/%s", s.Value .. R, s.Max .. R)
				end
				local R = _:MapValue(s.Value, s.Min, s.Max, 0, 1)
				if d[3][d[2]] then
					d[3][d[2]]:Cancel()
				end
				d[3][d[2]] = A:Create(
					q,
					TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
					{ Size = UDim2.new(R, 0, 1, 0) }
				)
				d[3][d[2]]:Play()
				F.Visible = not (R == 1 or R == 0)
			end
			function s:OnChanged(R)
				s.Changed = R
				R(s.Value)
			end
			local function R(d)
				if s.Increment then
					return math.round(d / s.Increment) * s.Increment
				elseif s.Rounding == 0 then
					return math.floor(d)
				end
				return tonumber(string.format("%." .. s.Rounding .. "f", d))
			end
			function s:GetValueFromXOffset(d)
				return R(_:MapValue(d, 0, s.MaxSize, s.Min, s.Max))
			end
			function s:Remove()
				for R, R in Z do
					R:Destroy()
				end
				n[T] = nil
				s.HolderFrame:Destroy()
				table.clear(s)
				H:Resize()
			end
			function s:SetValue(R)
				local d = tonumber(R)
				if not d then
					return
				end
				d = math.clamp(d, s.Min, s.Max)
				s.Value = d
				s:Display()
				_:SafeCallback(s.Callback, s.Value)
				_:SafeCallback(s.Changed, s.Value)
			end
			function s:AddSlider(R, d)
				return G.AddSlider(H, R, d, s)
			end
			l.InputBegan:Connect(function(R)
				if R.UserInputType == Enum.UserInputType.MouseButton1 and not _:MouseIsOverOpenedFrame() then
					local R = v.X
					local d = q.Size.X.Offset
					local F = R - (q.AbsolutePosition.X + d)
					while a:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
						local q = v.X
						local A = math.clamp(d + (q - R) + F, 0, s.MaxSize)
						local R = s:GetValueFromXOffset(A)
						local q = s.Value
						s.Value = R
						s:Display()
						if R ~= q then
							_:SafeCallback(s.Callback, s.Value)
							_:SafeCallback(s.Changed, s.Value)
						end
						m:Wait()
					end
					_:AttemptSave()
				end
			end)
			if _.FlagCopying then
				local R = _:AddContextMenu(l)
				R:AddOption("Copy Flag", function()
					pcall(setclipboard, s.Idx)
					task.wait()
					_:Notify("Copied flag to clipboard!", 2)
					R:Hide()
				end)
			end
			s:Display()
			if not g then
				table.insert(Z, H:AddBlank(J.BlankSize or 6))
				H:Resize()
			end
			n[T] = s
		end
	end

local j = function(R)
		local T = R[1]
		local q = R[10]
		local g = R[11]
		local l = R[7]
		local m = R[6]
		local d = R[5]
		local Z = R[2]
		local F = R[8]
		local A = R[13]
		local _ = R[12]
		local n = R[4]
		local v = R[0]
		local J = R[15]
		local s = R[14]
		local G = R[9]
		local a = R[3]
		return function()
			local function R()
				g.Position = UDim2.fromOffset(a.AbsolutePosition.X, a.AbsolutePosition.Y + a.Size.Y.Offset + 1)
			end
			local function H(Y)
				local N = Y or math.clamp(#Z.Values * 20, 0, T * 20) + 1
				g.Size = UDim2.fromOffset(a.AbsoluteSize.X + 0.5, N)
			end
			R()
			H()
			a:GetPropertyChangedSignal("AbsolutePosition"):Connect(R)
			local R = v:Create(
				q[3][q[2]],
				{
					BackgroundColor3 = v.MainColor,
					BorderColor3 = v.OutlineColor,
					BorderMode = Enum.BorderMode.Inset,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 21,
					Parent = g,
				}
			)
			v:AddToRegistry(R, { BackgroundColor3 = "MainColor", BorderColor3 = A[3][A[2]] })
			local Y = v:Create(
				"ScrollingFrame",
				{
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					CanvasSize = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 1, 0),
					ZIndex = 21,
					Parent = R,
					TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
					BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
					ScrollBarThickness = 3,
					ScrollBarImageColor3 = v.AccentColor,
				}
			)
			v:AddToRegistry(Y, { ScrollBarImageColor3 = "AccentColor" })
			v:Create(
				"UIListLayout",
				{
					Padding = UDim.new(0, 0),
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Parent = Y,
				}
			)
			function Z:Display()
				local R = Z.Values
				local N = ""
				if d.Multi then
					for U, U in next, R do
						if Z.Value[U] then
							N = N .. U .. ", "
						end
					end
					N = N:sub(1, #N - 2)
				else
					N = Z.Value or ""
				end
				s.Text = (N == "" and "..." or N)
			end
			function Z:GetActiveValues()
				if d.Multi then
					local R = {}
					for s, N in next, Z.Value do
						table.insert(R, s)
					end
					return R
				else
					return Z.Value and 1 or 0
				end
			end
			function Z:BuildDropdownList()
				local R = Z.Values
				local s = {}
				for N, N in next, Y:GetChildren() do
					if not N:IsA("UIListLayout") then
						N:Destroy()
					end
				end
				local N = 0
				for U, U in next, R do
					local R = {}
					N = N + 1
					local i = v:Create(
						q[3][q[2]],
						{
							BackgroundColor3 = v.MainColor,
							BorderColor3 = v.OutlineColor,
							BorderMode = Enum.BorderMode.Middle,
							Size = UDim2.new(1, -1, 0, 20),
							ZIndex = 23,
							Active = true,
							Parent = Y,
						}
					)
					v:AddToRegistry(i, { BackgroundColor3 = "MainColor", BorderColor3 = A[3][A[2]] })
					local q = v:CreateLabel({
						Active = false,
						Size = UDim2.new(1, -6, 1, 0),
						Position = UDim2.new(0, 6, 0, 0),
						TextSize = 14,
						Text = U,
						TextXAlignment = Enum.TextXAlignment.Left,
						ZIndex = 25,
						Parent = i,
					})
					v:OnHighlight(
						i,
						i,
						{ BorderColor3 = A[3][A[2]], ZIndex = 24 },
						{ BorderColor3 = A[3][A[2]], ZIndex = 23 }
					)
					local A
					if d.Multi then
						A = Z.Value[U]
					else
						A = Z.Value == U
					end
					function R:UpdateButton()
						if d.Multi then
							A = Z.Value[U]
						else
							A = Z.Value == U
						end
						q.TextColor3 = A and v.AccentColor or v.FontColor
						v.RegistryMap[q].Properties.TextColor3 = A and "AccentColor" or "FontColor"
					end
					q.InputBegan:Connect(function(q)
						if
							q.UserInputType == Enum.UserInputType.MouseButton1
							or q.UserInputType == Enum.UserInputType.Touch
						then
							local q = not A
							if Z:GetActiveValues() == 1 and not q and not d.AllowNull then
							else
								if d.Multi then
									A = q
									if A then
										Z.Value[U] = true
									else
										Z.Value[U] = nil
									end
								else
									A = q
									if A then
										Z.Value = U
									else
										Z.Value = nil
									end
									for q, q in next, s do
										q:UpdateButton()
									end
								end
								R:UpdateButton()
								Z:Display()
								v:UpdateDependencyBoxes()
								v:SafeCallback(Z.Callback, Z.Value)
								v:SafeCallback(Z.Changed, Z.Value)
								v:AttemptSave()
							end
						end
					end)
					R:UpdateButton()
					s[i] = R
				end
				Z:Display()
				Y.CanvasSize = UDim2.fromOffset(0, (N * 20) + 1)
				Y.Visible = false
				Y.Visible = true
				local R = math.clamp(N * 20, 0, T * 20) + 1
				H(R)
			end
			function Z:SetValues(R)
				if R then
					Z.Values = R
				end
				Z:BuildDropdownList()
			end
			function Z:OpenDropdown()
				if v.IsMobile then
					v.CanDrag = false
				end
				g.Visible = true
				v.OpenedFrames[g] = true
				J.Rotation = 90
				H()
			end
			function Z:CloseDropdown()
				if v.IsMobile then
					v.CanDrag = true
				end
				g.Visible = false
				v.OpenedFrames[g] = nil
				J.Rotation = 0
			end
			function Z:OnChanged(R)
				Z.Changed = R
				R(Z.Value)
			end
			function Z:SetValue(R)
				if Z.Multi then
					local T = {}
					for q, A in next, R do
						if Z.Illegal or table.find(Z.Values, q) then
							T[q] = true
						end
					end
					Z.Value = T
				else
					if not R then
						Z.Value = nil
					elseif Z.Illegal or table.find(Z.Values, R) then
						Z.Value = R
					end
				end
				Z:BuildDropdownList()
				v:SafeCallback(Z.Callback, Z.Value)
				v:SafeCallback(Z.Changed, Z.Value)
			end
			function Z:Remove()
				for R, R in F do
					R:Destroy()
				end
				_[n] = nil
				a:Destroy()
				table.clear(Z)
			end
			a.InputBegan:Connect(function(R)
				if
					(R.UserInputType == Enum.UserInputType.MouseButton1 and not v:MouseIsOverOpenedFrame())
					or R.UserInputType == Enum.UserInputType.Touch
				then
					if g.Visible then
						Z:CloseDropdown()
					else
						Z:OpenDropdown()
					end
				end
			end)
			G.InputBegan:Connect(function(R)
				if
					R.UserInputType == Enum.UserInputType.MouseButton1
					or R.UserInputType == Enum.UserInputType.Touch
				then
					local R, T = g.AbsolutePosition, g.AbsoluteSize
					if m.X < R.X or m.X > R.X + T.X or m.Y < (R.Y - 20 - 1) or m.Y > R.Y + T.Y then
						Z:CloseDropdown()
					end
				end
			end)
			if v.FlagCopying then
				local R = v:AddContextMenu(a)
				R:AddOption("Copy Flag", function()
					pcall(setclipboard, Z.Idx)
					task.wait()
					v:Notify("Copied flag to clipboard!", 2)
					R:Hide()
				end)
			end
			Z:BuildDropdownList()
			Z:Display()
			local R = {}
			if typeof(d.Default) == "string" then
				local T = table.find(Z.Values, d.Default)
				if T then
					table.insert(R, T)
				end
			elseif typeof(d.Default) == "table" then
				for T, T in next, d.Default do
					local q = table.find(Z.Values, T)
					if q then
						table.insert(R, q)
					end
				end
			elseif typeof(d.Default) == "number" and Z.Values[d.Default] ~= nil then
				table.insert(R, d.Default)
			end
			if next(R) then
				for T = 1, #R do
					local q = R[T]
					if d.Multi then
						Z.Value[Z.Values[q]] = true
					else
						Z.Value = Z.Values[q]
					end
					if not d.Multi then
						break
					end
				end
				Z:BuildDropdownList()
				Z:Display()
			end
			table.insert(F, l:AddBlank(d.BlankSize or 5))
			l:Resize()
			_[n] = Z
		end
	end

local R = function(R)
		local T = R[17]
		local q = R[10]
		local g = R[13]
		local l = R[2]
		local m = R[6]
		local d = R[5]
		local Z = R[1]
		local F = R[23]
		local A = R[8]
		local _ = R[11]
		local n = R[16]
		local v = R[22]
		local J = R[7]
		local s = R[14]
		local G = R[9]
		local a = R[15]
		local H = R[18]
		local Y = R[0]
		local N = R[21]
		local U = R[20]
		local i = R[12]
		local L = R[19]
		local c = R[3]
		local y = R[4]
		return function()
			_[3][_[2]] = function()
				local R = H:GetPlayers()
				for _ = 1, #R do
					R[_] = R[_].Name
				end
				table.sort(R, function(_, H)
					return _ < H
				end)
				return R
			end
			N[3][N[2]] = function()
				local R = n:GetTeams()
				for _ = 1, #R do
					R[_] = R[_].Name
				end
				table.sort(R, function(_, n)
					return _ < n
				end)
				return R
			end
			function Y:SafeCallback(R, ...)
				if not R then
					return
				end
				if not Y.NotifyOnError then
					return R(...)
				end
				local _, n = pcall(R, ...)
				if not _ then
					local R, R = n:find(":%d+: ")
					if not R then
						return Y:Notify(n)
					end
					return Y:Notify(n:sub(R + 1), 3)
				end
			end
			function Y:AttemptSave()
				if Y.SaveManager then
					Y.SaveManager:Save()
				end
			end
			function Y:Create(R, _)
				local n = R
				if typeof(R) == "string" then
					n = Instance.new(R)
				end
				for R, H in next, _ do
					local _, N = pcall(function()
						n[R] = H
					end)
					if not _ then
						y(N)
					end
				end
				return n
			end
			function Y:EnableFlagCopying(R)
				Y.FlagCopying = R
			end
			function Y:ApplyTextStroke(R)
				R.TextStrokeTransparency = 1
				return Y:Create(
					"UIStroke",
					{ Color = Color3.new(0, 0, 0), Thickness = 1, LineJoinMode = Enum.LineJoinMode.Miter, Parent = R }
				)
			end
			function Y:CreateLabel(R, _)
				local n = Y:Create(
					"TextLabel",
					{ BackgroundTransparency = 1, Font = Y.Font, TextColor3 = Y.FontColor, TextSize = 16, TextStrokeTransparency = 0 }
				)
				Y:ApplyTextStroke(n)
				Y:AddToRegistry(n, { TextColor3 = "FontColor" }, _)
				return Y:Create(n, R)
			end
			function Y:MakeDraggable(R, _, n)
				R.Active = true
				R.InputBegan:Connect(function(H)
					if
						H.UserInputType == Enum.UserInputType.MouseButton1
						or H.UserInputType == Enum.UserInputType.Touch
					then
						if n == true and Y.CantDragForced == true then
							return
						end
						local n = Vector2.new(m.X - R.AbsolutePosition.X, m.Y - R.AbsolutePosition.Y)
						if n.Y > (_ or 40) then
							return
						end
						while T:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							R.Position = UDim2.new(
								0,
								m.X - n.X + (R.Size.X.Offset * R.AnchorPoint.X),
								0,
								m.Y - n.Y + (R.Size.Y.Offset * R.AnchorPoint.Y)
							)
							G:Wait()
						end
					end
				end)
			end
			local R = Instance.new("ScreenGui", gethui())
			function Y:MakeDraggableOutline(_, n)
				_.Active = true
				_.InputBegan:Connect(function(H)
					if H.UserInputType == Enum.UserInputType.MouseButton1 then
						local H = Vector2.new(m.X - _.AbsolutePosition.X, m.Y - _.AbsolutePosition.Y)
						if H.Y > (n or 40) then
							return
						end
						local n = Y:Create(
							l[3][l[2]],
							{
								Parent = R,
								AnchorPoint = _.AnchorPoint,
								BackgroundTransparency = 1,
								Size = _.Size,
								Position = _.Position,
							}
						)
						local N = Y:Create("UIStroke", { Parent = n, Color = Y.AccentColor or Color3.new(0, 0, 0) })
						while T:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
							n.Position = UDim2.new(
								0,
								m.X - H.X + (_.Size.X.Offset * _.AnchorPoint.X),
								0,
								m.Y - H.Y + (_.Size.Y.Offset * _.AnchorPoint.Y)
							)
							N.Color = Y.AccentColor or Color3.new(0, 0, 0)
							G:Wait()
						end
						_.Position = UDim2.new(
							0,
							m.X - H.X + (_.Size.X.Offset * _.AnchorPoint.X),
							0,
							m.Y - H.Y + (_.Size.Y.Offset * _.AnchorPoint.Y)
						)
						n:Destroy()
					end
				end)
			end
			function Y:MakeDraggableUsingParent(_, n, H, N)
				_.Active = true
				if Y.IsMobile == false then
					_.InputBegan:Connect(function(_)
						if _.UserInputType == Enum.UserInputType.MouseButton1 then
							if N == true and Y.CantDragForced == true then
								return
							end
							local _ = Vector2.new(m.X - n.AbsolutePosition.X, m.Y - n.AbsolutePosition.Y)
							if _.Y > (H or 40) then
								return
							end
							while T:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
								n.Position = UDim2.new(
									0,
									m.X - _.X + (n.Size.X.Offset * n.AnchorPoint.X),
									0,
									m.Y - _.Y + (n.Size.Y.Offset * n.AnchorPoint.Y)
								)
								G:Wait()
							end
						end
					end)
				else
					Y:MakeDraggable(n, H, N)
				end
			end
			function Y:MakeResizable(_, n)
				if Y.IsMobile then
					return
				end
				_.Active = true
				local G = 25
				local H = 0.5
				local N = Y:Create(
					l[3][l[2]],
					{
						SizeConstraint = Enum.SizeConstraint.RelativeXX,
						BackgroundColor3 = Color3.new(0, 0, 0),
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(0, 30, 0, 30),
						Position = UDim2.new(1, -30, 1, -30),
						Visible = true,
						ClipsDescendants = true,
						ZIndex = 1,
						Parent = _,
					}
				)
				local y = Y:Create(
					"ImageButton",
					{
						BackgroundColor3 = Y.AccentColor,
						BackgroundTransparency = 1,
						BorderSizePixel = 0,
						Size = UDim2.new(2, 0, 2, 0),
						Position = UDim2.new(1, -30, 1, -30),
						ZIndex = 2,
						Parent = N,
					}
				)
				local O = Y:Create("UICorner", { CornerRadius = UDim.new(0.5, 0), Parent = y })
				Y:AddToRegistry(y, { BackgroundColor3 = "AccentColor" })
				N.Size = UDim2.fromOffset(G, G)
				N.Position = UDim2.new(1, -G, 1, -G)
				n = n or Y.MinSize
				local G
				N.Parent = _
				local t, B = nil, Y:Create("UIStroke", { Color = Y.AccentColor or Color3.new(0, 0, 0) })
				B.Color = Y.AccentColor or Color3.new(0, 0, 0)
				local function f(Q)
					y.Position = UDim2.new()
					y.Size = UDim2.new(2, 0, 2, 0)
					y.Parent = N
					y.BackgroundTransparency = Q
					O.Parent = y
					G = nil
					if t then
						B.Parent = nil
						t:Destroy()
						_.Size = t.Size
					end
				end
				y.MouseButton1Down:Connect(function()
					if not G then
						G = Vector2.new(
							m.X - (_.AbsolutePosition.X + _.AbsoluteSize.X),
							m.Y - (_.AbsolutePosition.Y + _.AbsoluteSize.Y)
						)
						t = Y:Create(
							l[3][l[2]],
							{
								Parent = R,
								AnchorPoint = _.AnchorPoint,
								BackgroundTransparency = 1,
								Size = _.Size,
								Position = _.Position,
							}
						)
						t.Size = _.Size
						B.Color = Y.AccentColor or Color3.new(0, 0, 0)
						B.Parent = t
						y.BackgroundTransparency = 1
						y.Size = UDim2.fromOffset(Y.ScreenGui.AbsoluteSize.X, Y.ScreenGui.AbsoluteSize.Y)
						y.Position = UDim2.new()
						O.Parent = nil
						y.Parent = Y.ScreenGui
					end
				end)
				y.MouseMoved:Connect(function()
					if G then
						local R = Vector2.new(m.X - G.X, m.Y - G.Y)
						local G = Vector2.new(
							math.clamp(R.X - _.AbsolutePosition.X, n.X, math.huge),
							math.clamp(R.Y - _.AbsolutePosition.Y, n.Y, math.huge)
						)
						t.Size = UDim2.fromOffset(G.X, G.Y)
					end
				end)
				y.MouseEnter:Connect(function()
					f(H)
				end)
				y.MouseLeave:Connect(function()
					f(1)
				end)
				y.MouseButton1Up:Connect(function()
					f(H)
				end)
			end
			function Y:AddToolTip(R, _)
				local n, G = Y:GetTextBounds(R, Y.Font, 14)
				local H = Y:Create(
					l[3][l[2]],
					{
						BackgroundColor3 = Y.MainColor,
						BorderColor3 = Y.OutlineColor,
						Size = UDim2.fromOffset(n + 5, G + 4),
						ZIndex = 100,
						Parent = Y.ScreenGui,
						Visible = false,
					}
				)
				local N = Y:CreateLabel({
					Position = UDim2.fromOffset(3, 1),
					Size = UDim2.fromOffset(n, G),
					TextSize = 14,
					Text = R,
					TextColor3 = Y.FontColor,
					TextXAlignment = Enum.TextXAlignment.Left,
					ZIndex = H.ZIndex + 1,
					Parent = H,
				})
				Y:AddToRegistry(H, { BackgroundColor3 = "MainColor", BorderColor3 = A[3][A[2]] })
				Y:AddToRegistry(N, { TextColor3 = "FontColor" })
				local R = false
				_.MouseEnter:Connect(function()
					if Y:MouseIsOverOpenedFrame() then
						return
					end
					R = true
					H.Position = UDim2.fromOffset(m.X + 15, m.Y + 12)
					H.Visible = true
					while R do
						U.Heartbeat:Wait()
						H.Position = UDim2.fromOffset(m.X + 15, m.Y + 12)
					end
				end)
				_.MouseLeave:Connect(function()
					R = false
					H.Visible = false
				end)
				if i[3][i[2]] then
					i[3][i[2]]:GetPropertyChangedSignal("Visible"):Connect(function()
						if i[3][i[2]].Visible == false then
							R = false
							H.Visible = false
						end
					end)
				end
			end
			function Y:OnHighlight(R, _, n, G, H)
				local function N()
					local U = Y.RegistryMap[_]
					for i, y in next, G do
						_[i] = Y[y] or y
						if U and U.Properties[i] then
							U.Properties[i] = y
						end
					end
				end
				local function G()
					if H and not H() then
						N()
						return
					end
					local H = Y.RegistryMap[_]
					for U, i in next, n do
						_[U] = Y[i] or i
						if H and H.Properties[U] then
							H.Properties[U] = i
						end
					end
				end
				R.MouseEnter:Connect(function()
					G()
				end)
				R.MouseMoved:Connect(function()
					G()
				end)
				R.MouseLeave:Connect(function()
					N()
				end)
			end
			function Y:MouseIsOverOpenedFrame()
				for R, _ in next, Y.OpenedFrames do
					local _, n = R.AbsolutePosition, R.AbsoluteSize
					if m.X >= _.X and m.X <= _.X + n.X and m.Y >= _.Y and m.Y <= _.Y + n.Y then
						return true
					end
				end
			end
			function Y:IsMouseOverFrame(R)
				local _, n = R.AbsolutePosition, R.AbsoluteSize
				if m.X >= _.X and m.X <= _.X + n.X and m.Y >= _.Y and m.Y <= _.Y + n.Y then
					return true
				end
			end
			function Y:UpdateDependencyBoxes()
				for R, R in next, Y.DependencyBoxes do
					R:Update()
				end
			end
			function Y:MapValue(R, m, _, n, G)
				return (1 - ((R - m) / (_ - m))) * n + ((R - m) / (_ - m)) * G
			end
			function Y:GetTextBounds(R, m, _, n)
				local G = v:GetTextSize(R, _, m, n or Vector2.new(1920, 1080))
				return G.X, G.Y
			end
			function Y:GetDarkerColor(R)
				local m, _, n = Color3.toHSV(R)
				return Color3.fromHSV(m, _, n / 1.5)
			end
			Y.AccentColorDark = Y:GetDarkerColor(Y.AccentColor)
			function Y:AddToRegistry(R, m, _)
				local n = #Y.Registry + 1
				local v = { Instance = R, Properties = m, Idx = n }
				table.insert(Y.Registry, v)
				Y.RegistryMap[R] = v
				if _ then
					table.insert(Y.HudRegistry, v)
				end
			end
			function Y:RemoveFromRegistry(R)
				local m = Y.RegistryMap[R]
				if m then
					for _ = #Y.Registry, 1, -1 do
						if Y.Registry[_] == m then
							table.remove(Y.Registry, _)
						end
					end
					for _ = #Y.HudRegistry, 1, -1 do
						if Y.HudRegistry[_] == m then
							table.remove(Y.HudRegistry, _)
						end
					end
					Y.RegistryMap[R] = nil
				end
			end
			function Y:UpdateColorsUsingRegistry()
				for R, R in next, Y.Registry do
					for m, _ in next, R.Properties do
						if typeof(_) == "string" then
							R.Instance[m] = Y[_]
						elseif typeof(_) == "function" then
							R.Instance[m] = _()
						end
					end
				end
			end
			function Y:GiveSignal(R)
				table.insert(Y.Signals, R)
			end
			function Y:Unload()
				for R = #Y.Signals, 1, -1 do
					local m = table.remove(Y.Signals, R)
					m:Disconnect()
				end
				if Y.OnUnload then
					Y.OnUnload()
				end
				F:UnbindAction("Freeze")
				q:Destroy()
				J:Destroy()
				g:Destroy()
				d:Destroy()
			end
			function Y:CreateEvent(R)
				self.Events[R] = Instance.new(a[3][a[2]])
			end
			function Y:FireEvent(R, ...)
				self.Events[R]:Fire(...)
			end
			function Y:OnEvent(R)
				return self.Events[R].Event
			end
			function Y:OnUnload(R)
				Y.OnUnload = R
			end
			local R = {}
			function Y:BindToInput(q, g)
				R[q] = R[q] or {}
				table.insert(R[q], g)
			end
			Y:GiveSignal(T.InputBegan:Connect(function(T, ...)
				if not c[3][c[2]] then
					return
				end
				local q = R[T.KeyCode] or R[T.UserInputType]
				if q then
					for R, R in pairs(q) do
						task.spawn(R, T, ...)
					end
				end
			end))
			function Y:AddContextMenu(R, T)
				local q = { Visible = false }
				q.Options = {}
				q.Container = Y:Create(
					l[3][l[2]],
					{ BorderColor3 = Color3.new(), ZIndex = 14, Active = true, Visible = false, Parent = d }
				)
				q.Inner = Y:Create(
					l[3][l[2]],
					{
						BackgroundColor3 = Y.BackgroundColor,
						BorderColor3 = Y.OutlineColor,
						BorderMode = Enum.BorderMode.Inset,
						Size = UDim2.fromScale(1, 1),
						ZIndex = 15,
						Parent = q.Container,
					}
				)
				Y:Create(
					"UIListLayout",
					{
						Name = "Layout",
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Parent = q.Inner,
					}
				)
				Y:Create("UIPadding", { Name = "Padding", PaddingLeft = UDim.new(0, 0), Parent = q.Inner })
				local function g()
					q.Container.Position =
						UDim2.fromOffset((R.AbsolutePosition.X + R.AbsoluteSize.X) + 4, R.AbsolutePosition.Y + 1)
				end
				local function m()
					local F = 60
					for _, _ in next, q.Inner:GetChildren() do
						if _:IsA("TextLabel") then
							F = math.max(F, _.TextBounds.X)
						end
					end
					q.Container.Size = UDim2.fromOffset(F + 8, q.Inner.Layout.AbsoluteContentSize.Y + 4)
				end
				local F = false
				(T or R).InputBegan:Connect(function(T)
					if T.UserInputType == Enum.UserInputType.MouseButton1 and not Y:MouseIsOverOpenedFrame() then
						return q:Hide()
					elseif T.UserInputType == Enum.UserInputType.MouseButton2 and not Y:MouseIsOverOpenedFrame() then
						return q:Show()
					end
				end)
				Y:BindToInput(Enum.UserInputType.MouseButton1, function()
					if F and not Y:IsMouseOverFrame(q.Container) then
						q:Hide()
					end
				end)
				Y:BindToInput(Enum.UserInputType.MouseButton2, function()
					if F and not Y:IsMouseOverFrame(q.Container) and not Y:IsMouseOverFrame(R) then
						q:Hide()
					end
				end)
				task.spawn(g)
				task.spawn(m)
				Y:AddToRegistry(q.Inner, { BackgroundColor3 = "BackgroundColor", BorderColor3 = A[3][A[2]] })
				function q:Show()
					g()
					m()
					F = true
					for R, T in next, Y.OpenedFrames do
						if R.Name == "Color" then
							R.Visible = false
							Y.OpenedFrames[R] = nil
						end
					end
					self.Container.Visible = true
					Y.OpenedFrames[q.Container] = true
				end
				function q:Hide()
					F = false
					self.Container.Visible = false
					task.wait()
					Y.OpenedFrames[q.Container] = nil
				end
				function q:AddOption(R, T)
					if type(T) ~= "function" then
						T = function() end
					end
					local g = Y:CreateLabel({
						Active = false,
						Size = UDim2.new(1, 0, 0, 15),
						TextSize = 13,
						Text = R,
						ZIndex = 16,
						Parent = self.Inner,
						TextXAlignment = Enum.TextXAlignment.Center,
					})
					Y:OnHighlight(g, g, { TextColor3 = "AccentColor" }, { TextColor3 = "FontColor" })
					g.InputBegan:Connect(function(R)
						if R.UserInputType ~= Enum.UserInputType.MouseButton1 then
							return
						end
						T()
					end)
					return g
				end
				return q
			end
			Y:GiveSignal(d.DescendantRemoving:Connect(function(R)
				if c[3][c[2]] and Y.RegistryMap[R] then
					Y:RemoveFromRegistry(R)
				end
			end))
			function Y:SetWatermarkVisibility(R)
				Y.Watermark.Visible = R
			end
			function Y:SetWatermark(R)
				local T, q = Y:GetTextBounds(R, Y.Font, 14)
				Y.Watermark.Size = UDim2.new(0, T + 15, 0, (q * 1.5) + 3)
				Y.WatermarkText.Text = R
			end
			local R = {
				BarPosition = {
					["Top"] = UDim2.new(0, -1, 0, 0),
					["Left"] = UDim2.new(0, -1, 0, -1),
					["Right"] = UDim2.new(1, -2, 0, -1),
					["Bottom"] = UDim2.new(0, -1, 1, -2),
				},
				BarSize = {
					["Top"] = UDim2.new(1, 3, 0, 2),
					["Left"] = UDim2.new(0, 3, 1, 2),
					["Right"] = UDim2.new(0, 3, 1, 2),
					["Bottom"] = UDim2.new(1, 3, 0, 2),
				},
			}
			local T = Y.NotificationStyle
			local q, g = string.char, math.max
			local m = function()
				local d = T.OverrideColor
				if d then
					return d()
				end
				return Y.MainColor, Y.AccentColor, Y.OutlineColor, Y.FontColor
			end
			local d
			do
				local F = Y:Create(
					l[3][l[2]],
					{ BorderColor3 = Color3.new(0, 0, 0), Position = UDim2.new(0, 100, 0, 10), ClipsDescendants = true, ZIndex = 100 }
				)
				local _ = Y:Create(
					l[3][l[2]],
					{ BorderMode = Enum.BorderMode.Inset, Size = UDim2.new(1, 0, 1, 0), ZIndex = 101, Parent = F, Name = "inner" }
				)
				local n = Y:Create(
					l[3][l[2]],
					{
						BackgroundColor3 = Color3.new(1, 1, 1),
						BorderSizePixel = 0,
						Position = UDim2.new(0, 1, 0, 1),
						Size = UDim2.new(1, -2, 1, -2),
						ZIndex = 102,
						Parent = _,
						Name = "inner",
					}
				)
				local _ = Y:Create("UIGradient", { Rotation = -90, Parent = n })
				local _ = Y:CreateLabel({
					Position = UDim2.new(0, 4, 0, 0),
					Size = UDim2.new(1, -4, 1, 0),
					TextXAlignment = Enum.TextXAlignment.Left,
					TextSize = 14,
					ZIndex = 103,
					Name = "label",
					Parent = n,
				})
				local _ = Y:Create(l[3][l[2]], { BorderSizePixel = 0, ZIndex = 104, Name = "bar", Parent = F })
				d = F
			end
			function Y:CreatePopout(F)
				if type(F.Title) ~= "string" then
					F.Title = "No title"
				end
				if typeof(F.Position) ~= "UDim2" then
					F.Position = UDim2.fromOffset(175, 50)
				end
				local _ = Instance.new("ScreenGui")
				s(_)
				_.ZIndexBehavior = Enum.ZIndexBehavior.Global
				_.Parent = Z
				_.DisplayOrder = (F.ZIndex or 0) + 19
				if F.Center then
					F.AnchorPoint = Vector2.new(0.5, 0.5)
					F.Position = UDim2.fromScale(0.5, 0.5)
				end
				local Z = {}
				local n = Y:Create(
					l[3][l[2]],
					{
						AnchorPoint = F.AnchorPoint,
						BackgroundColor3 = Color3.new(0, 0, 0),
						BorderSizePixel = 0,
						Position = F.Position,
						Size = UDim2.fromOffset(F.Size.X, F.Size.Y),
						Visible = F.AutoShow,
						ZIndex = 1,
						Parent = _,
					}
				)
				Y:MakeDraggableOutline(n, 25)
				local _ = Y:Create(
					l[3][l[2]],
					{
						BackgroundColor3 = Y.MainColor,
						BorderColor3 = Y.OutlineColor,
						BorderMode = Enum.BorderMode.Inset,
						Position = UDim2.new(0, 1, 0, 0),
						Size = UDim2.new(1, -2, 1, -2),
						ZIndex = 1,
						Parent = n,
					}
				)
				Y:AddToRegistry(_, { BackgroundColor3 = "MainColor", BorderColor3 = A[3][A[2]] })
				local v = Y:CreateLabel({
					Position = UDim2.new(0, 0, 0, 0),
					Size = UDim2.new(1, 0, 0, 25),
					Text = F.Title or "",
					TextXAlignment = Enum.TextXAlignment.Center,
					ZIndex = 1,
					Font = Y.Font,
					Parent = _,
				})
				local v = Y:Create(
					"TextLabel",
					{
						BackgroundTransparency = 1,
						Font = Y.Font,
						TextColor3 = Y.AccentColor,
						TextSize = 16,
						TextStrokeTransparency = 0,
						Position = UDim2.new(0, -8, 0, 0),
						Size = UDim2.new(1, 0, 0, 25),
						Text = F.Version or "",
						RichText = true,
						TextXAlignment = Enum.TextXAlignment.Right,
						ZIndex = 1,
						Parent = _,
					}
				)
				Y:AddToRegistry(v, { TextColor3 = "AccentColor" })
				local v = Y:Create(
					l[3][l[2]],
					{
						BackgroundColor3 = Y.BackgroundColor,
						BorderColor3 = Y.OutlineColor,
						Position = UDim2.new(0, 8, 0, 25),
						Size = UDim2.new(1, -16, 1, -33),
						ZIndex = 1,
						Parent = _,
					}
				)
				Y:AddToRegistry(v, { BackgroundColor3 = "BackgroundColor", BorderColor3 = A[3][A[2]] })
				local _ = Y:Create(
					l[3][l[2]],
					{
						BackgroundColor3 = Y.BackgroundColor,
						BorderColor3 = Color3.new(0, 0, 0),
						BorderMode = Enum.BorderMode.Inset,
						Position = UDim2.new(0, 0, 0, 0),
						Size = UDim2.new(1, 0, 1, 0),
						ZIndex = 1,
						Parent = v,
					}
				)
				Y:AddToRegistry(_, { BackgroundColor3 = "BackgroundColor" })
				local v = Y:Create(
					l[3][l[2]],
					{
						BackgroundColor3 = Y.BackgroundColor,
						BorderColor3 = Y.OutlineColor,
						Position = UDim2.new(0, 8, 0, 8),
						Size = UDim2.new(1, -16, 1, -16),
						ZIndex = 2,
						Visible = true,
						Parent = _,
					}
				)
				local _ = Y:Create(
					l[3][l[2]],
					{ BackgroundTransparency = 1, Parent = v, Size = UDim2.fromScale(1, 1), Position = UDim2.fromOffset(
						2,
						2
					) }
				)
				Y:Create(
					"UIListLayout",
					{
						Padding = UDim.new(0, 0),
						FillDirection = Enum.FillDirection.Vertical,
						SortOrder = Enum.SortOrder.LayoutOrder,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						Parent = _,
					}
				)
				Y:AddToRegistry(v, { BackgroundColor3 = "BackgroundColor", BorderColor3 = A[3][A[2]] })
				Y:AddToRegistry(_, { BackgroundColor3 = "MainColor", BorderColor3 = A[3][A[2]] })
				Z.Holder = n
				Z.Container = _
				function Z:Resize()
					local l = 0
					for A, A in next, _:GetChildren() do
						if (not A:IsA("UIListLayout")) and A.Visible then
							l = l + A.AbsoluteSize.Y
						end
					end
					n.Size = UDim2.fromOffset(F.Size.X, 16 + l + (_.AbsolutePosition.Y - n.AbsolutePosition.Y))
				end
				function Z:Toggle()
					n.Visible = not n.Visible
				end
				function Z:GetSize()
					return _.AbsoluteSize
				end
				_:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					task.wait()
					Z:Resize()
				end)
				Z:Resize()
				setmetatable(Z, L)
				return Z
			end
			local l, Z, F = UDim2.new, ColorSequence.new, ColorSequenceKeypoint.new
			function Y:Notify(A, _)
				local n, v = Y:GetTextBounds(A, Y.Font, 14)
				v = v + 7
				local J = T.Transparency
				local s, G, a, H = m()
				local m = d:Clone()
				m.BackgroundColor3 = s
				m.Name = q(256 - g(1, #A % 256))
				m.Size = l(0, 0, 0, v)
				m.Transparency = J
				local q = m.inner
				q.BackgroundColor3 = s
				q.BorderColor3 = a
				q.Transparency = J
				local g = q.inner
				g.Transparency = J
				local q = g.UIGradient
				q.Color = Z({ F(0, Y:GetDarkerColor(s)), F(1, s) })
				local q = g.label
				q.Text = A
				q.TextColor3 = H
				local q = m.bar
				q.BackgroundColor3 = G
				q.Size = R.BarSize[T.BarSide] or l(0, 3, 1, 2)
				q.Position = R.BarPosition[T.BarSide]
				m.Parent = Y.NotificationArea
				pcall(m.TweenSize, m, UDim2.new(0, n + 8 + 4, 0, v), "Out", "Quad", 0.4, true)
				task.spawn(function()
					wait(_ or 5)
					pcall(m.TweenSize, m, UDim2.new(0, 0, 0, v), "Out", "Quad", 0.4, true)
					wait(0.4)
					m:Destroy()
				end)
			end
			function Y:IsVisible()
				return c[3][c[2]]
			end
			Y:CreateEvent("VisibilityChanged")
		end
	end

local F = function(R)
		local T = R[0]
		local q = R[5]
		local g = R[15]
		local l = R[17]
		local m = R[8]
		local d = R[6]
		local Z = R[14]
		local F = R[16]
		local A = R[4]
		local _ = R[13]
		local n = R[10]
		local v = R[11]
		local J = R[3]
		local s = R[7]
		local G = R[1]
		local a = R[2]
		local H = R[9]
		local Y = R[12]
		return function(R, N, U)
			local i, L = n("Line"), n("Line")
			local n = a(1, H(A.Value))
			i.Thickness, L.Thickness = n + 2, n
			i.Color = Color3.new()
			local A = Instance.new("UIGradient", L._frame)
			A.Color = U
			A.Rotation = 0
			local n = Instance.new("UIGradient", i._frame)
			n.Color = F
			n.Rotation = 0
			n.Transparency, A.Transparency = T[3][T[2]], T[3][T[2]]
			L.Color = Color3.new(1, 1, 1)
			L.ZIndex = 2
			local T, F = nil, 0
			local a, H = J.Value, _.Value
			local _ = v.Value
			local v = Y.Value
			local J = N
			local Y = s.CFrame.Position
			T = q.RenderStepped:Connect(function(q)
				F = F + q
				if (F > (a + H)) then
					i:Remove()
					L:Remove()
					return T:Disconnect()
				end
				if (_ ~= 0) then
					local T = Z(l(F / _, 1))
					J = R:Lerp(N, T)
				end
				local T, q = G[3][G[2]](R)
				if not q then
					i.Visible, L.Visible = false, false
					return
				end
				local R, q = G[3][G[2]](J)
				if not q then
					i.Visible, L.Visible = false, false
					return
				end
				if (F > a) then
					local q = (F - a) / H
					local l = {}
					for Z = 0, 9 do
						local F = Z / 9
						d(l, g(F, q + ((1 - F) / 2)))
					end
					l = m(l)
					A.Transparency = l
					if v then
						n.Transparency = l
					end
				end
				if v then
					local q = (R - T).Unit
					i.To, i.From = R + q, T - q
					i.Visible = true
				else
					i.Visible = false
				end
				L.To, L.From = R, T
				L.Visible = true
			end)
		end
	end

local f = function(R)
		local T = R[11]
		local q = R[3]
		local g = R[15]
		local l = R[8]
		local m = R[7]
		local d = R[5]
		local Z = R[10]
		local F = R[12]
		local A = R[1]
		local _ = R[13]
		local n = R[2]
		local v = R[0]
		local J = R[14]
		local s = R[6]
		local G = R[9]
		local a = R[4]
		return function()
			if q.IsMobile then
				local R = { ["Left"] = tick(), ["Right"] = tick() }
				A:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					q.CanDrag = false
					local H = tick()
					R.Left = H
					task.wait(0.15)
					if R.Left == H then
						q.CanDrag = true
					end
				end)
				d:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
					q.CanDrag = false
					local H = tick()
					R.Right = H
					task.wait(0.15)
					if R.Right == H then
						q.CanDrag = true
					end
				end)
			end
			for R, R in next, { A, d } do
				R:WaitForChild("UIListLayout"):GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
					R.CanvasSize = UDim2.fromOffset(0, R.UIListLayout.AbsoluteContentSize.Y)
				end)
			end
			function v:Resize()
				if a[3][a[2]].Visible == true then
					local R = 10
					for H, H in next, g[3][g[2]]:GetChildren() do
						if (not H:IsA("UIListLayout")) and H.Visible then
							R = R + H.Size.Y.Offset
						end
					end
					a[3][a[2]].Size = UDim2.new(1, -10, 0, R)
					R = R + 10
					A.Position = UDim2.new(0, 7, 0, 7 + R)
					A.Size = UDim2.new(0.5, -10, 1, -14 - R)
					d.Position = UDim2.new(0.5, 5, 0, 7 + R)
					d.Size = UDim2.new(0.5, -10, 1, -14 - R)
				else
					A.Position = UDim2.new(0, 7, 0, 7)
					A.Size = UDim2.new(0.5, -10, 1, -14)
					d.Position = UDim2.new(0.5, 5, 0, 7)
					d.Size = UDim2.new(0.5, -10, 1, -14)
				end
			end
			function v:UpdateWarningBox(R)
				if typeof(R.Visible) == "boolean" then
					a[3][a[2]].Visible = R.Visible
					v:Resize()
				end
				if typeof(R.Title) == "string" then
					J[3][J[2]].Text = R.Title
				end
				if typeof(R.Text) == "string" then
					s[3][s[2]].Text = R.Text
					local g = select(
						2,
						q:GetTextBounds(R.Text, q.Font, 14, Vector2.new(s[3][s[2]].AbsoluteSize.X, math.huge))
					)
					s[3][s[2]].Size = UDim2.new(1, -4, 0, g)
					v:Resize()
				end
			end
			function v:ShowTab()
				q.ActiveTab = Z
				for R, R in next, n.Tabs do
					R:HideTab()
				end
				q.RegistryMap[m].Properties.BackgroundColor3 = "BackgroundColor"
				m.BackgroundColor3 = q.MainColor
				l.Visible = true
				G.Color = Color3.fromRGB(0, 0, 0)
				F.TextColor3 = q.FontColor
				_.Visible = true
				v:Resize()
			end
			function v:HideTab()
				m.BackgroundColor3 = q.BackgroundColor
				q.RegistryMap[m].Properties.BackgroundColor3 = "MainColor"
				G.Color = Color3.fromRGB(25, 25, 25)
				F.TextColor3 = q:GetDarkerColor(q.FontColor)
				_.Visible = false
				l.Visible = false
			end
			function v:SetLayoutOrder(R)
				m.LayoutOrder = R
				T:ApplyLayout()
			end
			function v:GetSides()
				return { ["Left"] = A, ["Right"] = d }
			end
			function v:AddLeftGroupbox(R)
				return self:AddGroupbox({ Side = 1, Name = R })
			end
			function v:AddRightGroupbox(R)
				return self:AddGroupbox({ Side = 2, Name = R })
			end
			function v:AddLeftTabbox(R)
				return v:AddTabbox({ Name = R, Side = 1 })
			end
			function v:AddRightTabbox(R)
				return v:AddTabbox({ Name = R, Side = 2 })
			end
			function v:Remove()
				table.clear(v)
				l:Destroy()
				m:Destroy()
				n.Tabs[Z] = nil
			end
			m.InputBegan:Connect(function(R)
				if
					R.UserInputType == Enum.UserInputType.MouseButton1
					or R.UserInputType == Enum.UserInputType.Touch
				then
					v:ShowTab()
				end
			end)
			a[3][a[2]]:GetPropertyChangedSignal("Visible"):Connect(function()
				v:Resize()
			end)
			q.TotalTabs = q.TotalTabs + 1
			if q.TotalTabs == 1 then
				v:ShowTab()
			end
			n.Tabs[Z] = v
		end
	end

local k = function(R)
		local T = R[0]
		local q = R[1]
		local g = R[2]
		local l = R[3]
		return function()
			local R = cloneref or function(m)
				return m
			end
			local m = R(game:GetService("HttpService"))
			local R, d, Z = isfolder, isfile, listfiles
			do
				T.Folder = ""
				T.Ignore = {}
				T.Parser = {
					Toggle = {
						Save = function(F, A)
							return { type = "Toggle", idx = F, value = A.Value }
						end,
						Load = function(F, A)
							if g[F] then
								g[F]:SetValue(A.value)
							end
						end,
					},
					Slider = {
						Save = function(F, A)
							return { type = "Slider", idx = F, value = tostring(A.Value) }
						end,
						Load = function(F, A)
							if q[F] then
								q[F]:SetValue(A.value)
							end
						end,
					},
					Dropdown = {
						Save = function(F, A)
							return { type = "Dropdown", idx = F, value = A.Value, mutli = A.Multi }
						end,
						Load = function(F, A)
							if q[F] then
								q[F]:SetValue(A.value)
							end
						end,
					},
					ColorPicker = {
						Save = function(F, A)
							return { type = "ColorPicker", idx = F, value = A.Value:ToHex(), transparency = A.Transparency }
						end,
						Load = function(F, A)
							if q[F] then
								q[F]:SetValueRGB(Color3.fromHex(A.value), A.transparency)
							end
						end,
					},
					KeyPicker = {
						Save = function(F, A)
							return { type = "KeyPicker", idx = F, mode = A.Mode, key = A.Value }
						end,
						Load = function(F, A)
							if q[F] then
								q[F]:SetValue({ A.key, A.mode })
							end
						end,
					},
					Input = {
						Save = function(F, A)
							return { type = "Input", idx = F, text = A.Value }
						end,
						Load = function(F, A)
							if q[F] and type(A.text) == "string" then
								q[F]:SetValue(A.text)
							end
						end,
					},
				}
				function T:BuildFolderTree()
					local F =
						{ self.Folder, self.Folder .. "/settings", self.Folder .. "/themes", self.Folder .. "/configs" }
					for A = 1, #F do
						local _ = F[A]
						if not R(_) then
							makefolder(_)
						end
					end
				end
				function T:CheckFolderTree()
					if not R(self.Folder) then
						T:BuildFolderTree()
						task.wait()
					end
				end
				function T:SetIgnoreIndexes(R)
					for F, F in next, R do
						self.Ignore[F] = true
					end
				end
				function T:SetFolder(R)
					self.Folder = R
					self:BuildFolderTree()
				end
				function T:Save(R)
					if not R then
						return false, "no config file is selected"
					end
					T:CheckFolderTree()
					local F = self.Folder .. "/settings/" .. R .. ".json"
					local R = { objects = {} }
					for A, _ in next, g do
						if self.Ignore[A] then
							continue
						end
						table.insert(R.objects, self.Parser[_.Type].Save(A, _))
					end
					for g, A in next, q do
						if not self.Parser[A.Type] then
							continue
						end
						if self.Ignore[g] then
							continue
						end
						table.insert(R.objects, self.Parser[A.Type].Save(g, A))
					end
					local q, g = pcall(m.JSONEncode, m, R)
					if not q then
						return false, "failed to encode data"
					end
					writefile(F, g)
					return true
				end
				function T:Load(R)
					if not R then
						return false, "no config file is selected"
					end
					if (type(R) == "table") then
						for q, q in next, R.objects do
							if self.Parser[q.type] then
								task.spawn(function()
									self.Parser[q.type].Load(q.idx, q)
								end)
							end
						end
						return true
					end
					T:CheckFolderTree()
					local q = self.Folder .. "/settings/" .. R .. ".json"
					if not d(q) then
						return false, "invalid file"
					end
					local R, g = pcall(m.JSONDecode, m, readfile(q))
					if not R then
						return false, "decode error"
					end
					for R, R in next, g.objects do
						if self.Parser[R.type] then
							task.spawn(function()
								self.Parser[R.type].Load(R.idx, R)
							end)
						end
					end
					return true
				end
				function T:Delete(R)
					if not R then
						return false, "no config file is selected"
					end
					local q = self.Folder .. "/settings/" .. R .. ".json"
					if not d(q) then
						return false, "invalid file"
					end
					local R, g = pcall(delfile, q)
					if not R then
						return false, "delete file error"
					end
					return true
				end
				function T:IgnoreThemeSettings()
					self:SetIgnoreIndexes({
						"ThemeManager_ThemeList",
						"ThemeManager_CustomThemeList",
						"ThemeManager_CustomThemeName",
						"VideoLink",
						"Brightness",
						"Contrast",
						"Saturation",
						"Brightness",
						"BlurSize",
						"FontColor",
						"RiskColor",
						"MainColor",
						"AccentColor",
						"BackgroundColor",
						l[3][l[2]],
						"SwordColor",
						"ItemType",
						"BackTransparency",
						"BackColor",
						"SwordTransparency",
						"SwordReflectance",
						"SwordMaterial",
						"SwordSpeed",
					})
				end
				function T:RefreshConfigList()
					local R = Z(self.Folder .. "/settings")
					local q = {}
					for g = 1, #R do
						local l = R[g]
						if l:sub(-5) == ".json" then
							local R = l:find(".json", 1, true)
							local g = R
							local m = l:sub(R, R)
							while m ~= "/" and m ~= "\\" and m ~= "" do
								R = R - 1
								m = l:sub(R, R)
							end
							if m == "/" or m == "\\" then
								table.insert(q, l:sub(R + 1, g - 1))
							end
						end
					end
					return q
				end
				function T:SetLibrary(R)
					self.Library = R
				end
				function T:LoadAutoloadConfig()
					T:CheckFolderTree()
					if d(self.Folder .. "/settings/autoload.txt") then
						local R = readfile(self.Folder .. "/settings/autoload.txt")
						local q, g = self:Load(R)
						if not q then
							return self.Library:Notify("Failed to load autoload config: " .. g)
						end
						if not SILENT then
							self.Library:Notify(string.format("Auto loaded config %q", R))
						end
					end
				end
			end
			getgenv().SaveManager = T
		end
	end

local n = function(R)
		local T = R[0]
		local q = R[1]
		local g = R[2]
		return function(R, l, l, l)
			local l = T:Clone()
			for T, T in l:GetDescendants() do
				if (T.Name == "MainEmitter") then
					T.Color = q[3][q[2]]
				end
				if (T.ClassName == "ParticleEmitter") then
					T:Emit(5)
				end
			end
			l.Parent = workspace
			l.Position = R.Position
			if g[3][g[2]] then
				l.Anchored = false
				local T = Instance.new("WeldConstraint", l)
				T.Part0 = R
				T.Part1 = l
			end
			task.delay(1, l.Destroy, l)
		end
	end

local SILENT = false

local function initialize(Library)
    if not Library then return end
    
    -- Fix: Pre-create the missing tables so lines 5052 and 5068 don't crash
    if not State.drawings then
        State.drawings = {
            silent = {},
            aimbot = {},
            triggerbot = {},
            esp = {}
        }
    end


    local Window = Library:CreateWindow("Unnamed Enhancements")

    local CombatTab = Window:AddTab("Combat")
    local VisualsTab = Window:AddTab("Visuals")
    local WorldTab = Window:AddTab("World")
    local MiscTab = Window:AddTab("Misc")
    local SettingsTab = Window:AddTab("Settings")

    local TargetingGroupbox = CombatTab:AddLeftGroupbox("Targeting")
    TargetingGroupbox:AddToggle("aimbot_toggle", { Text = "enabled", Default = false })
        :AddKeyPicker("aimbot_keybind", { Default = "MB2", Mode = "Hold", Text = "aimbot" })
    TargetingGroupbox:AddToggle("targeting_visibleonly", { Text = "visible only", Default = true })
    TargetingGroupbox:AddToggle("exploits_no_spread", { Text = "no spread", Default = true })
    TargetingGroupbox:AddToggle("exploits_full_auto", { Text = "full auto", Default = false })
    TargetingGroupbox:AddToggle("aimbot_fov_outline", { Text = "show fov", Default = false })
        :AddColorPicker("aimbot_outline_color1", { Default = Color3.new(1, 1, 1) })
    TargetingGroupbox:AddToggle("aimbot_fov_moving", { Text = "fov rotation", Default = false })
    TargetingGroupbox:AddSlider("aimbot_fov_rotation_speed", { Text = "rotation speed", Min = 0, Max = 5, Default = 1, Rounding = 2 })
    TargetingGroupbox:AddSlider("silent_radius", { Text = "radius", Min = 0, Max = 500, Default = 100, Suffix = "px", Rounding = 0 })
    TargetingGroupbox:AddSlider("silent_hitchance", { Text = "hit chance", Min = 0, Max = 100, Default = 100, Suffix = "%", Rounding = 0 })
    TargetingGroupbox:AddToggle("silent_visualize", { Text = "visualize", Default = false })
        :AddColorPicker("silent_fill_color1", { Default = Color3.new(1, 1, 1) })
        :AddColorPicker("silent_fill_color2", { Default = Color3.new(0, 0, 0) })
    TargetingGroupbox:AddToggle("silent_manipulation", { Text = "manipulation", Default = false })
    TargetingGroupbox:AddToggle("target_highlight_fill", { Text = "target highlight", Default = false })
        :AddColorPicker("target_highlight_color", { Default = Color3.new(1, 0, 0), Transparency = 0.5 })
    TargetingGroupbox:AddToggle("selected_player_view", { Text = "selected player view", Default = false })

    local RagebotGroupbox = CombatTab:AddLeftGroupbox("Ragebot")
    RagebotGroupbox:AddDropdown("ragebot_priority_targets", { Text = "priority", Values = {"Head", "Body", "Closest"}, Default = "Head" })
    RagebotGroupbox:AddSlider("ragebot_void_spam_hide", { Text = "void spam delay", Min = 0, Max = 1, Default = 0.25, Rounding = 2, Suffix = "s" })
    RagebotGroupbox:AddToggle("indicator_ragebot", { Text = "ragebot indicator", Default = false })
        :AddColorPicker("indicator_ragebot_status_color", { Default = Color3.fromRGB(255, 100, 100) })
        :AddColorPicker("indicator_ragebot_text_color", { Default = Color3.fromRGB(255, 255, 255) })

    local TriggerGroupbox = CombatTab:AddRightGroupbox("Triggerbot")
    TriggerGroupbox:AddToggle("triggerbot_enabled", { Text = "enabled", Default = false })
    TriggerGroupbox:AddDropdown("triggerbot_scoped", { Text = "mode", Values = {"always", "scoped only"}, Default = "always" })

    local AntiAimGroupbox = CombatTab:AddRightGroupbox("Anti Aim")
    AntiAimGroupbox:AddToggle("anti_aim_enabled", { Text = "enabled", Default = false })
    AntiAimGroupbox:AddSlider("anti_aim_custom_yaw", { Text = "yaw angle", Min = -180, Max = 180, Default = 0, Rounding = 0 })
    AntiAimGroupbox:AddDropdown("anti_aim_pitch_mode", { Text = "pitch mode", Values = {"none", "look down", "custom", "offset"}, Default = "none" })

    local ESPGroupbox = VisualsTab:AddLeftGroupbox("ESP")
    ESPGroupbox:AddToggle("esp_name", { Text = "name", Default = false })
    ESPGroupbox:AddToggle("esp_distance", { Text = "distance", Default = false })
    ESPGroupbox:AddToggle("esp_weapon", { Text = "weapon", Default = false })
    ESPGroupbox:AddToggle("esp_box", { Text = "box", Default = false })
    ESPGroupbox:AddToggle("esp_fill", { Text = "fill", Default = false })
    ESPGroupbox:AddToggle("esp_skeleton", { Text = "skeleton", Default = false })
    ESPGroupbox:AddToggle("esp_healthbar", { Text = "healthbar", Default = false })
    ESPGroupbox:AddToggle("esp_show_team", { Text = "show team", Default = false })
    ESPGroupbox:AddToggle("esp_chams", { Text = "chams", Default = false })
    ESPGroupbox:AddToggle("esp_skeleton_outline", { Text = "skeleton outline", Default = false })
    ESPGroupbox:AddToggle("esp_healthbar_resize", { Text = "healthbar resize", Default = false })
    ESPGroupbox:AddToggle("esp_override_appearance", { Text = "override appearance", Default = false })
    ESPGroupbox:AddToggle("esp_body_color", { Text = "body color", Default = false })
    ESPGroupbox:AddToggle("esp_material", { Text = "material", Default = false })
    ESPGroupbox:AddDropdown("esp_bounds_type", { Text = "bounds type", Values = {"dynamic", "static"}, Default = "dynamic" })
    ESPGroupbox:AddDropdown("esp_world_font", { Text = "font", Values = {"Code", "Gotham", "GothamBold"}, Default = "Code" })
    ESPGroupbox:AddSlider("esp_bounds_width_scale", { Text = "width scale", Min = 0, Max = 200, Default = 100, Suffix = "%", Rounding = 0 })
    ESPGroupbox:AddSlider("esp_skeleton_thickness", { Text = "skeleton thickness", Min = 1, Max = 5, Default = 1, Rounding = 0 })
    ESPGroupbox:AddSlider("esp_healthbar_health_lerp", { Text = "health lerp", Min = 0, Max = 1, Default = 0.1, Rounding = 2 })
    ESPGroupbox:AddSlider("esp_world_object_scale", { Text = "object scale", Min = 0.5, Max = 3, Default = 1, Rounding = 1 })

    local CrosshairGroupbox = VisualsTab:AddRightGroupbox("Crosshair")
    CrosshairGroupbox:AddDropdown("crosshair_settings", { Text = "settings", Values = {"default", "custom"}, Default = "default" })

    local IndicatorsGroupbox = VisualsTab:AddRightGroupbox("Indicators")
    IndicatorsGroupbox:AddSlider("indicator_lerp", { Text = "lerp", Min = 0, Max = 1, Default = 0.1, Rounding = 2 })

    local TracerGroupbox = VisualsTab:AddRightGroupbox("Custom Tracers")
    TracerGroupbox:AddSlider("custom_tracer_lifetime", { Text = "lifetime", Min = 0.1, Max = 5, Default = 1, Rounding = 1 })

    local BloomGroupbox = WorldTab:AddLeftGroupbox("Bloom")
    BloomGroupbox:AddToggle("bloom_enabled", { Text = "enable", Default = false })
    BloomGroupbox:AddSlider("bloom_intensity", { Text = "intensity", Min = 0, Max = 3, Default = 0.4, Rounding = 2 })
    BloomGroupbox:AddSlider("bloom_size", { Text = "size", Min = 0, Max = 56, Default = 24, Rounding = 0 })
    BloomGroupbox:AddSlider("bloom_threshold", { Text = "threshold", Min = 0, Max = 2, Default = 0.95, Rounding = 2 })

    local CCGroupbox = WorldTab:AddLeftGroupbox("Color Correction")
    CCGroupbox:AddToggle("color_correction_enabled", { Text = "enable", Default = false })
        :AddColorPicker("color_correction_tint", { Default = Color3.new(1, 1, 1) })
    CCGroupbox:AddSlider("color_correction_saturation", { Text = "saturation", Min = -1, Max = 1, Default = 0, Rounding = 2 })
    CCGroupbox:AddSlider("color_correction_contrast", { Text = "contrast", Min = -1, Max = 1, Default = 0, Rounding = 2 })
    CCGroupbox:AddSlider("color_correction_brightness", { Text = "brightness", Min = -1, Max = 1, Default = 0, Rounding = 2 })

    local AtmoGroupbox = WorldTab:AddRightGroupbox("Atmosphere")
    AtmoGroupbox:AddToggle("atmosphere_enabled", { Text = "enable", Default = false })
    AtmoGroupbox:AddSlider("atmosphere_decay", { Text = "decay", Min = 0, Max = 1, Default = 0, Rounding = 2 })
    AtmoGroupbox:AddSlider("atmosphere_glare", { Text = "glare", Min = 0, Max = 1, Default = 0, Rounding = 2 })
    AtmoGroupbox:AddSlider("atmosphere_haze", { Text = "haze", Min = 0, Max = 10, Default = 0, Rounding = 1 })
    AtmoGroupbox:AddSlider("atmosphere_density", { Text = "density", Min = 0, Max = 1, Default = 0.3, Rounding = 2 })
    AtmoGroupbox:AddSlider("atmosphere_offset", { Text = "offset", Min = 0, Max = 1, Default = 0, Rounding = 2 })

    local SunGroupbox = WorldTab:AddRightGroupbox("Sun Rays")
    SunGroupbox:AddToggle("sunrays_enabled", { Text = "enable", Default = false })
    SunGroupbox:AddSlider("sunrays_spread", { Text = "spread", Min = 0, Max = 1, Default = 0.5, Rounding = 2 })
    SunGroupbox:AddSlider("sunrays_intensity", { Text = "intensity", Min = 0, Max = 1, Default = 0.25, Rounding = 2 })

    local LightingGroupbox = WorldTab:AddRightGroupbox("Lighting")
    LightingGroupbox:AddDropdown("lighting_technology", { Text = "technology", Values = {"ShadowMap", "Future", "Legacy"}, Default = "ShadowMap" })

    local CameraGroupbox = MiscTab:AddLeftGroupbox("Camera")
    CameraGroupbox:AddToggle("camera_fov_changer", { Text = "fov changer", Default = false })
    CameraGroupbox:AddSlider("camera_aspect_ratio_y", { Text = "ratio y", Min = 0.1, Max = 3, Default = 1, Rounding = 2 })

    local AnimGroupbox = MiscTab:AddLeftGroupbox("Animations")
    AnimGroupbox:AddDropdown("animation_player_value", { Text = "animation", Values = {"default"}, Default = "default" })

    local ViewmodelGroupbox = MiscTab:AddLeftGroupbox("Viewmodel")
    ViewmodelGroupbox:AddToggle("viewmodel_offset", { Text = "offset", Default = false })
    ViewmodelGroupbox:AddToggle("viewmodel_chams", { Text = "chams", Default = false })

    local ChatGroupbox = MiscTab:AddRightGroupbox("Chat")
    ChatGroupbox:AddToggle("chat_spam_enabled", { Text = "chat spam", Default = false })

    local ArcadeGroupbox = MiscTab:AddRightGroupbox("Arcade")
    ArcadeGroupbox:AddToggle("arcade_auto_ammo", { Text = "automatically grab drops", Default = false })

    local CosmeticsGroupbox = MiscTab:AddRightGroupbox("Cosmetics")
    CosmeticsGroupbox:AddToggle("cosmetics_changer_show", { Text = "show", Default = false })

    local SoundGroupbox = MiscTab:AddRightGroupbox("Sound")
    SoundGroupbox:AddSlider("shoot_sound_speed", { Text = "speed", Min = 0.1, Max = 5, Default = 1, Suffix = "x", Rounding = 2 })

    local SettingsGroupbox = SettingsTab:AddLeftGroupbox("Menu")
    SettingsGroupbox:AddDropdown("Keybind Menu Mode", { Text = "keybind mode", Values = {"Always", "Toggle", "Hold"}, Default = "Always" })

    SaveManager:SetLibrary(Library)
    SaveManager:SetFolder("unnamed/rivals")
    SaveManager:IgnoreThemeSettings()
    SaveManager:BuildConfigSection(SettingsTab)

    ThemeManager:SetLibrary(Library)
    ThemeManager:SetFolder("unnamed/themes")
    ThemeManager:ApplyToTab(SettingsTab)

    B({ [0] = State, [1] = Players })()

    local bloom_update = q({ [0] = BloomEffect, [1] = BloomDefaults })
    local cc_update = V({ [0] = ColorCorrectionEffect })
    local atmo_update = M({ [0] = AtmosphereEffect })
    local sun_update = S({ [0] = SunRaysEffect, [1] = SunRaysDefaults })

    Toggles.bloom_enabled:OnChanged(bloom_update)
    Options.bloom_intensity:OnChanged(bloom_update)
    Options.bloom_size:OnChanged(bloom_update)
    Options.bloom_threshold:OnChanged(bloom_update)

    Toggles.color_correction_enabled:OnChanged(cc_update)
    Options.color_correction_saturation:OnChanged(cc_update)
    Options.color_correction_contrast:OnChanged(cc_update)
    Options.color_correction_brightness:OnChanged(cc_update)
    Options.color_correction_tint:OnChanged(cc_update)

    Toggles.atmosphere_enabled:OnChanged(atmo_update)
    Options.atmosphere_decay:OnChanged(atmo_update)
    Options.atmosphere_glare:OnChanged(atmo_update)
    Options.atmosphere_haze:OnChanged(atmo_update)
    Options.atmosphere_density:OnChanged(atmo_update)
    Options.atmosphere_offset:OnChanged(atmo_update)
    --options.atmosphere_color:OnChanged(atmo_update)

    Toggles.sunrays_enabled:OnChanged(sun_update)
    Options.sunrays_spread:OnChanged(sun_update)
    Options.sunrays_intensity:OnChanged(sun_update)

    Options.lighting_technology:OnChanged(function()
        pcall(function()
            local tech = Options.lighting_technology.Value
            if tech == "ShadowMap" then
                Lighting.Technology = Enum.Technology.ShadowMap
            elseif tech == "Future" then
                Lighting.Technology = Enum.Technology.Future
            elseif tech == "Legacy" then
                Lighting.Technology = Enum.Technology.Legacy
            end
        end)
    end)

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
    local RivalsModules = {}

    local origGetRawMetatable = clonefunction and clonefunction(getrawmetatable) or getrawmetatable
    local origSetThreadIdentity = clonefunction and clonefunction(setthreadidentity or setidentity or function() end) or function() end
    local origNewCClosure = newcclosure or function(f) return f end

    local localFighter = nil
    local localPlayerData = nil

    pcall(function()
        for _, v in pairs(getgc(true)) do
            if type(v) == "table" and rawget(v, "ClientFighter") and rawget(v, "IsLocalPlayer") then
                localFighter = v
                break
            end
        end
    end)
    State.localFighter = localFighter

    pcall(function()
        local viewmodelsModule = ReplicatedStorage:FindFirstChild("ViewModels", true)
            or ReplicatedStorage:FindFirstChild("Shared", true)
        if viewmodelsModule then
            RivalsModules.ViewModels = cloneref(require(viewmodelsModule))
        end
    end)

    pcall(function()
        local camModule = ReplicatedStorage:FindFirstChild("CameraController", true)
        if camModule then
            RivalsModules.CameraController = require(camModule)
        end
    end)

    if Remotes then
        State.Remotes = Remotes
    end

    local function installMetatableHook()
        local origMt = origGetRawMetatable(game)
        if not origMt then return end

        local origNamecall = origMt.__namecall
        local origIndex = origMt.__index
        local origNewIndex = origMt.__newindex

        local proxyMt = {}
        proxyMt.__index = origIndex

        proxyMt.__namecall = origNewCClosure(function(self, ...)
            local method = getnamecallmethod()
            local args = {...}

            if method == "FireServer" and self.Name and Remotes and self:IsDescendantOf(Remotes) then
                local remoteName = self.Name

                if remoteName == "ReplicateFromServer" or remoteName == "Shoot" or remoteName == "Fire" then
                    if Toggles.exploits_no_spread and Toggles.exploits_no_spread.Value then
                        pcall(function()
                            for _, arg in args do
                                if type(arg) == "table" then
                                    if arg._ProjectileEffect then
                                        arg._ProjectileEffect.Spread = Vector3.zero
                                        arg._ProjectileEffect.SpreadAngle = 0
                                    end
                                    if arg.Spread then
                                        arg.Spread = Vector3.zero
                                    end
                                    if arg.SpreadAngle then
                                        arg.SpreadAngle = 0
                                    end
                                end
                            end
                        end)
                    end

                    if Toggles.silent_manipulation and Toggles.silent_manipulation.Value then
                        pcall(function()
                            if State.manipulation.targetPosition then
                                for _, arg in args do
                                    if type(arg) == "table" then
                                        if arg.Direction then
                                            local cam = workspace.CurrentCamera
                                            arg.Direction = (State.manipulation.targetPosition - cam.CFrame.Position).Unit
                                        end
                                        if arg.Origin then
                                            arg.Origin = workspace.CurrentCamera.CFrame.Position
                                        end
                                    end
                                end
                            end
                        end)
                    end
                end
            end

            return origNamecall(self, ...)
        end)

        proxyMt.__newindex = origNewCClosure(function(self, key, value)
            return
        end)

        local setRawMt = setrawmetatable or (debug and debug.setmetatable)
        if setRawMt then
            setRawMt(game, proxyMt)
        end
    end

    pcall(installMetatableHook)

    if localFighter and RivalsModules.CameraController then
        pcall(function()
            local origEncode = RivalsModules.CameraController.EncodeCameraRotation
            if origEncode then
                RivalsModules.CameraController.EncodeCameraRotation = function(self, ...)
                    if Toggles.anti_aim_enabled and Toggles.anti_aim_enabled.Value then
                        local yaw = Options.anti_aim_custom_yaw and Options.anti_aim_custom_yaw.Value or 0
                        local pitchMode = Options.anti_aim_pitch_mode and Options.anti_aim_pitch_mode.Value or "none"
                        local cam = workspace.CurrentCamera
                        local cf = cam.CFrame

                        cf = cf * CFrame.Angles(0, math.rad(yaw), 0)

                        if pitchMode == "look down" then
                            cf = cf * CFrame.Angles(math.rad(89), 0, 0)
                        elseif pitchMode == "custom" then
                            local pitch = Options.anti_aim_custom_pitch and Options.anti_aim_custom_pitch.Value or 0
                            cf = cf * CFrame.Angles(math.rad(pitch), 0, 0)
                        end

                        return origEncode(self, cf)
                    end
                    return origEncode(self, ...)
                end
            end
        end)
    end

    local silentCircle = Drawing.new("Circle")
    silentCircle.Visible = false
    silentCircle.Radius = 100
    silentCircle.Color = Color3.new(1, 1, 1)
    silentCircle.Thickness = 1
    silentCircle.Filled = false
    silentCircle.Transparency = 1
    
    State.drawings.silent.circle = silentCircle

    local aimbotCircle = Drawing.new("Circle")
    aimbotCircle.Visible = false
    aimbotCircle.Radius = 100
    aimbotCircle.Color = Color3.new(1, 1, 1)
    aimbotCircle.Thickness = 1
    aimbotCircle.Filled = false
    aimbotCircle.Transparency = 1
    State.drawings.aimbot.circle = aimbotCircle

    Toggles.silent_visualize:OnChanged(function()
        silentCircle.Visible = Toggles.silent_visualize.Value and Toggles.aimbot_toggle.Value
    end)
    Options.silent_radius:OnChanged(function()
        silentCircle.Radius = Options.silent_radius.Value
    end)
    Options.silent_fill_color1:OnChanged(function()
        silentCircle.Color = Options.silent_fill_color1.Value
    end)
    Toggles.aimbot_fov_outline:OnChanged(function()
        aimbotCircle.Visible = Toggles.aimbot_fov_outline.Value
    end)
    Options.aimbot_outline_color1:OnChanged(function()
        aimbotCircle.Color = Options.aimbot_outline_color1.Value
    end)
    Options.aimbot_fov_rotation_speed:OnChanged(function() end)

    Toggles.aimbot_toggle:OnChanged(function()
        if not Toggles.aimbot_toggle.Value then
           if silentCircle then
    silentCircle.Visible = false
else
    warn("Warning: silentCircle was not found or failed to load!")
end
        if State and State.manipulation then
            State.manipulation.targetPosition = nil
        else
            -- If manipulation is missing, dynamically create it to prevent crashes
            if State then
                State.manipulation = {}
                State.manipulation.targetPosition = nil
            end
        end
    end
end)


    RunService.RenderStepped:Connect(function()
        local screenCenter = workspace.CurrentCamera.ViewportSize / 2
        silentCircle.Position = screenCenter
        aimbotCircle.Position = screenCenter

        if Toggles.aimbot_fov_moving.Value then
            local speed = Options.aimbot_fov_rotation_speed.Value
            aimbotCircle.NumSides = 60
        end

        if Toggles.aimbot_toggle.Value and Options.aimbot_keybind:GetState() then
            local closestPlayer = nil
            local closestDist = Options.silent_radius.Value
            local cam = workspace.CurrentCamera

            for _, player in Players:GetPlayers() do
                if player == LocalPlayer then continue end
                local char = player.Character
                if not char then continue end
                local root = char:FindFirstChild("HumanoidRootPart")
                local humanoid = char:FindFirstChild("Humanoid")
                if not root or not humanoid or humanoid.Health <= 0 then continue end

                if Toggles.targeting_visibleonly.Value then
                    local ray = workspace:Raycast(
                        cam.CFrame.Position,
                        (root.Position - cam.CFrame.Position).Unit * 1000,
                        State.raycastParams
                    )
                    if ray and ray.Instance and not ray.Instance:IsDescendantOf(char) then
                        continue
                    end
                end

                local screenPos, onScreen = cam:WorldToViewportPoint(root.Position)
                if not onScreen then continue end
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                if dist < closestDist then
                    closestDist = dist
                    closestPlayer = { player = player, character = char, root = root, screenPos = screenPos }
                end
            end

            if closestPlayer then
                local hitchance = Options.silent_hitchance.Value
                if math.random(1, 100) <= hitchance then
                    State.manipulation.targetPosition = closestPlayer.root.Position
                else
                    State.manipulation.targetPosition = nil
                end
            else
                State.manipulation.targetPosition = nil
            end
        else
            State.manipulation.targetPosition = nil
        end
    end)

    local triggerConn = nil
    Toggles.triggerbot_enabled:OnChanged(function()
        if triggerConn then triggerConn:Disconnect(); triggerConn = nil end
        if not Toggles.triggerbot_enabled.Value then return end

        triggerConn = RunService.Heartbeat:Connect(function()
            if not localFighter then return end
            local equipped = pcall(function() return localFighter.EquippedItem end) and localFighter.EquippedItem
            if not equipped then return end

            local scopedMode = Options.triggerbot_scoped.Value
            if scopedMode == "scoped only" then
                local isAiming = pcall(function() return localFighter.IsAiming end) and localFighter.IsAiming
                if not isAiming then return end
            end

            local mouseTarget = LocalPlayer:GetMouse().Target
            if not mouseTarget then return end
            local model = mouseTarget:FindFirstAncestorOfClass("Model")
            if not model then return end
            local humanoid = model:FindFirstChildOfClass("Humanoid")
            if not humanoid or humanoid.Health <= 0 then return end
            local player = Players:GetPlayerFromCharacter(model)
            if not player or player == LocalPlayer then return end

            pcall(function()
                if equipped.shoot then equipped:shoot() end
            end)
        end)
    end)

    Toggles.exploits_full_auto:OnChanged(function()
        pcall(function()
            if not localFighter or not localFighter.EquippedItem then return end
            local weapon = localFighter.EquippedItem
            if weapon.Info and weapon.Info.Type == "Gun" then
                if Toggles.exploits_full_auto.Value then
                    weapon.Info.FireMode = "Auto"
                end
            end
        end)
    end)

    State.manipulation = State.manipulation or {}
    State.manipulation.active = false
    State.manipulation.targetPosition = nil

    State.raycastParams = RaycastParams.new()
    State.raycastParams.FilterType = Enum.RaycastFilterType.Exclude
    State.raycastParams.FilterDescendantsInstances = {LocalPlayer.Character}
    LocalPlayer.CharacterAdded:Connect(function(char)
        State.raycastParams.FilterDescendantsInstances = {char}
    end)

    Toggles.silent_manipulation:OnChanged(function()
        State.manipulation.active = Toggles.silent_manipulation.Value
    end)

    SaveManager:LoadAutoloadConfig()

    Library:Toggle()
    return Library
end

initialize(Library)
getgenv().UE_LOADED = true
