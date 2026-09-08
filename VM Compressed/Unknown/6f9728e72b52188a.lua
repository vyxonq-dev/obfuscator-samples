local KHLib = {}

local UICreator = loadstring(game:HttpGet("https://raw.githubusercontent.com/KoalaGuy-100/Koala-Hacks/refs/heads/main/KHLib/CreateUI.luau"))()

-- # UI Version Checker
if not table.find(UICreator:GetSupportedVersions("Vmj1"), UICreator:GetVersion()) then
	warn("D: Something Went Wrong... This Version Is No Longer Supported By The UI. Use The Latest KHLib Version To Keep Your Script Running.")
	return KHLib
end

function KHLib.new(Location: Instance, ID: string)
	local LibUI = {}
	
	-- Functions & Variables
	LibUI.Instance = UICreator:Run(Location or game.Players.LocalPlayer.PlayerGui)
	LibUI.Title = LibUI.Instance.Main.InfoBar.Title
	LibUI.Theme = LibUI.Instance.Theme
	LibUI.DestroyOnClose = false
	
	function LibUI.newtab(Name: string, ID: string)
		local NewTab = {}
		
		-- Creation
		local TabSelector = LibUI.Instance.Main.TabSelectors.TemplateTab:Clone()
		TabSelector.Parent = LibUI.Instance.Main.TabSelectors
		TabSelector.Visible = true
		TabSelector.Text = Name
		TabSelector.Name = ID
		
		local Tab = LibUI.Instance.Main.Tabs.TemplateTab:Clone()
		Tab.Parent = LibUI.Instance.Main.Tabs
		Tab.Name = ID
		for i, v in pairs(Tab:GetChildren()) do
			if string.find(string.lower(v.Name), "template") then
				v:Destroy()
			end
		end
		
		TabSelector.MouseButton1Down:Connect(function()
			if NewTab.ButtonEnabled and Tab.Visible == false then
				for i, v in pairs(LibUI.Instance.Main.TabSelectors:GetChildren()) do
					if v:IsA("TextButton") and v ~= TabSelector then
						game:GetService("TweenService"):Create(v, TweenInfo.new(0.5), {BackgroundColor3 = LibUI.Theme["BG-MainColor"].Value}):Play()
						if v:FindFirstChild("#BG-BrightColor") then
							v["#BG-BrightColor"].Name = "#BG-MainColor"
						end
					end
				end
				for i, v in pairs(LibUI.Instance.Main.Tabs:GetChildren()) do
					if v:IsA("ScrollingFrame") then
						v.Visible = false
					end
				end
				Tab.Visible = true
				
				game:GetService("TweenService"):Create(TabSelector, TweenInfo.new(0.5), {BackgroundColor3 = LibUI.Theme["BG-BrightColor"].Value}):Play()
				if TabSelector:FindFirstChild("#BG-MainColor") then
					TabSelector["#BG-MainColor"].Name = "#BG-BrightColor"
				end
			end
		end)
		
		-- Functions & Variables
		NewTab.Instance = Tab
		NewTab.Button = TabSelector
		NewTab.ButtonEnabled = true
		
		function NewTab:CreateInput(InputType: string, Label: string, ID: string)
			local InputTypes = {
				["ActionTemplate_Activate"] = "Activate",
				["ActionTemplate_Toggle"] = "Toggle",
				["ActionTemplate_Input"] = "TextBox",
			}
			for i, v in pairs(InputTypes) do
				if InputType == v then
					InputType = i
				end
			end
			
			local NewInput = LibUI.Instance.Main.Tabs.TemplateTab:FindFirstChild(InputType):Clone()
			NewInput.Name = ID or "RNG-" .. tostring(math.random(0,99999))
			NewInput.Label.Text = Label or "No Label."
			NewInput.Parent = NewTab.Instance
			
			if InputType == "ActionTemplate_Toggle" then
				NewInput.View.BackgroundColor3 = LibUI.Theme["$ToggleColorOff"].Value
				NewInput.Activate.MouseButton1Down:Connect(function()
					if NewInput.Input.Value == true then
						NewInput.Input.Value = false
						game:GetService("TweenService"):Create(NewInput.View, TweenInfo.new(0.5), {BackgroundColor3 = LibUI.Theme["$ToggleColorOff"].Value}):Play()
					else
						NewInput.Input.Value = true
						game:GetService("TweenService"):Create(NewInput.View, TweenInfo.new(0.5), {BackgroundColor3 = LibUI.Theme["$ToggleColorOn"].Value}):Play()
					end
				end)
			end
			
			return NewInput
		end
		
		return NewTab
	end
	
	function LibUI:UpdateTheme()
		local BGColors = {
			"BG-BitDarkColor",
			"BG-BrightColor",
			"BG-DarkColor",
			"BG-MainColor",
		}
		local TXTColors = {
			"TXT-MainColor",
		}
		local PTXTColors = {
			"PTX-MainColor",
		}
		
		for i, v in pairs(LibUI.Instance:GetDescendants()) do
			if table.find(BGColors, string.sub(v.Name, 2)) then
				v.Parent.BackgroundColor3 = LibUI.Theme:FindFirstChild(string.sub(v.Name, 2)).Value
			elseif table.find(TXTColors, string.sub(v.Name, 2)) then
				v.Parent.TextColor3 = LibUI.Theme:FindFirstChild(string.sub(v.Name, 2)).Value
			elseif table.find(PTXTColors, string.sub(v.Name, 2)) then
				v.Parent.PlaceholderColor3 = LibUI.Theme:FindFirstChild(string.sub(v.Name, 2)).Value
			end
		end
	end
	
	-- UI Changes
	LibUI.Instance.Main.TabSelectors.TemplateTab.Visible = false
	LibUI.Instance.Main.Tabs.TemplateTab.Visible = false
	
	LibUI.Instance.Name = ID or "KHLibUI"
	
	LibUI.Instance.Open.MouseButton1Down:Connect(function()
		LibUI.Instance.Open.Visible = false
		LibUI.Instance.Main.Visible = true
	end)
	LibUI.Instance.Main.InfoBar.MinimizeButton.MouseButton1Down:Connect(function()
		LibUI.Instance.Open.Visible = true
		LibUI.Instance.Main.Visible = false
	end)
	LibUI.Instance.Main.InfoBar.CloseButton.MouseButton1Down:Connect(function()
		if LibUI.DestroyOnClose == true then
			LibUI.Instance:Destroy()
		else
			LibUI.Instance.Open.Visible = true
			LibUI.Instance.Main.Visible = false
		end
	end)
	
	return LibUI
end

return KHLib
