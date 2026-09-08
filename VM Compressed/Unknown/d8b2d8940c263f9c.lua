local Baselined = loadstring(game:HttpGet("https://raw.githubusercontent.com/fiangg20/nox/refs/heads/main/baselined-assets/comp/source.luau"))()

local Window = Baselined:Create({
    Title = "Baselined Showcase",
    Icon = "bolt",
    SizeX = 480,
    SizeY = 600,
    Theme = "MonochromeDark",
    ToggleKey = Enum.KeyCode.K,
	UseIntegratedSettings = true,
    Search = true,
    SearchPlaceholder = "Search components...",
    ConfigurationSaving = {
        Enabled = true,
    }
})

local MainTab = Window:AddTab({
    Title = "Components",
    Icon = "widgets"
})

MainTab:AddSection({
    Text = "Interactive Controls"
})

MainTab:AddSwitch({
    Title = "Switch Example",
    Default = false,
    Icon = "toggle_on",
    Flag = "SwitchExampleFlag",
    Callback = function(State)
        print("Switch Example state changed to:", State)
    end
})

MainTab:AddSlider({
    Title = "Slider Example",
    Min = 0,
    Max = 100,
    Default = 50,
    Icon = "tune",
    Size = "m",
    Flag = "SliderExampleFlag",
    Callback = function(Value)
        print("Slider Example value changed to:", Value)
    end
})

MainTab:AddDropdown({
    Title = "Dropdown Example",
    Options = {"Option One", "Option Two", "Option Three"},
    Default = 1,
    Icon = "list",
    Flag = "DropdownExampleFlag",
    Callback = function(Option)
        print("Dropdown Example selected:", Option)
    end
})

MainTab:AddColorPicker({
    Title = "Color Picker Example",
    Default = Color3.fromRGB(255, 0, 0),
    Icon = "palette",
    Flag = "ColorPickerExampleFlag",
    Callback = function(Color)
        print("Color Picker Example selected:", Color)
    end
})

MainTab:AddTextBox({
    Title = "Textbox Example",
    Icon = "input",
    Flag = "TextboxExampleFlag",
    Callback = function(Text)
        print("Textbox Example input text:", Text)
    end
})

MainTab:AddDivider()

MainTab:AddSection({
    Text = "Actions & Feedback"
})

MainTab:AddButton({
    Text = "Button Example",
    Type = "filled",
    Icon = "smart_button",
    Callback = function()
        Window:Notify({
            Text = "Button Example was clicked successfully!",
            Duration = 3
        })
    end
})