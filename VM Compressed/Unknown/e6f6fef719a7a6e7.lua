--[[
    This is only example code, consider seeing documentation: https://github.com/azurelw/isotopia/blob/main/README.md
    And for reporting bugs, suggestions, modifications: https://discord.gg/XVC3B3GJ9g
]]
local Isotopia = loadstring(game:HttpGet("https://raw.githubusercontent.com/azurelw/isotopia/refs/heads/main/loader.lua"))()

local Window = Isotopia:Window({
    Title = "Isotopia",
    Icon = "rbxassetid://107819132007001", -- can be lucide icon too
    Transparent = false,
    Size = UDim2.fromOffset(698, 479),
    MainColor = Color3.fromRGB(180, 207, 229),
    Spinning = true, -- icon spinning?
    AnimatedTitle = {
        AnimationColor = Color3.fromRGB(220, 247, 255),
        AnimationSide = "Right", -- (Right, Left)
        AnimationSpeed = 3 -- higher = slower
    }
})
Window:SetToggleKey(Enum.KeyCode.K)

local currentSettings = Window:GetAnimationSettings()
print("Animation Color:", currentSettings.AnimationColor)
print("Animation Side:", currentSettings.AnimationSide)
print("Animation Speed:", currentSettings.AnimationSpeed)
print("Toggle Key:", Window:GetToggleKey())
print("Transparent:", Window:GetTransparent())

local Tab = Window:Tab({
    Title = "Main",
    Icon = "house"
})
local Tab2 = Window:Tab({
    Title = "Configuration",
    Icon = "settings"
})
local Section = Tab:Section({
    Side = "left"
})
local Section2 = Tab:Section({
    Side = "right"
})
local Section3 = Tab2:Section({
    Side = "left"
})

local Module = Section:Module({
    Title = "Test Button",
    Desc = "Example Module.",
    Flag = "module_example",
    Locked = false,
    Callback = function(state)
    end
})
Module:Dropdown({
    Title = "Test Dropdown",
    Values = {"Low", "Medium", "High", "Ultra", "Default"},
    Value = "Default",
    Flag = "dropdown_example",
    Locked = false,
    Callback = function(option)
        print("Quality set to:", option)
    end
})
Module:Dropdown({
    Title = "Dropdown Values",
    Values = {"Good", "Pizza", "Noob"},
    Value = "Pro",
    Flag = "dropdown_example2",
    Locked = false,
    Callback = function(option)
        print("DropdownValue set to:", option)
    end
})
Module:Slider({
    Title = "Volume",
    Value = { Min = 0, Max = 100, Default = 50 },
    Flag = "slider_example",
    Locked = false,
    Callback = function(value)
        print("Volume:", value)
    end
})
Module:Divider()
Module:Checkbox({
    Title = "Enable Feature",
    Flag = "checkbox_example",
    Locked = false,
    Callback = function(state)
        print("Feature enabled:", state)
    end
})
Module:Checkbox({
    Title = "Auto Pizza",
    Flag = "checkbox_example2",
    Locked = false,
    Callback = function(state)
        print("Auto Pizza enabled:", state)
    end
})
Module:Checkbox({
    Title = "Lock In",
    Flag = "checkbox_example3",
    Locked = false,
    Callback = function(state)
        print("Lock In enabled:", state)
    end
})
Module:Checkbox({
    Title = "Drawing",
    Flag = "checkbox_example4",
    Locked = false,
    Callback = function(state)
        print("Drawing enabled:", state)
    end
})

Section2:Button({
    Title = "Switch Transparency",
    Locked = false,
    Callback = function()
        Window:SetTransparent()
    end
})

Section3:Label({
    Text = "I said this is empty label.",
    Title = "Empty Label",
    Description = "Common description.",
    Default = false
})
Window:load()

--[[ input example:
:Input({
    Title = "Username",
    placeholder = "Enter your name...",
    Flag = "input_example",
    Locked = false,
    callback = function(text)
        print("Username:", text)
    end
})

button example:
:Button({
    Title = "Cucumber",
    Locked = false,
    Callback = function()
    end
})

checkbox example:
:Checkbox({
    Title = "Get Pizza",
    Flag = "get_pizza",
    Locked = false,
    Callback = function(state)
        print(state)
    end
})

label example:
:Label({
    Text = "This is Test Label. Why did you open this?",
    Title = "Test Label",
    Description = "Can't you see test label?",
    Default = true -- module expanded by default?
})
]]

--[[ All Possible Methods:
###Window Methods:
Isotopia:Window(settings)
Window:load()
Window:Toggle()
Window:saveCurrentConfig()
Window:change_visiblity(state)
Window:SetMainColor(color)
Window:_refreshThemeColors()
Window:SetSize(newSize)
Window:GetSize()
Window:_updateSectionsSize(newSize)
Window:SetTransparent(state)
Window:GetTransparent()
Window:_updateModulesTransparency(state)
Window:SetAnimationSettings(settings)
Window:GetAnimationSettings()
Window:EditOpenButton(settings)
Window:SetToggleKey(keyCode)
Window:GetToggleKey()
Window:ClearToggleKey()
Window:Tab(settings)
Window:update_tabs(tab)
Window:update_sections(left_section, right_section)
Window:flag_type(flag, flag_type)
Window:loadAllSavedFlags()

###Tab Methods:
Tab:Section(settings)

###Section Methods:
Section:Module(settings)
Section:Toggle(settings)
Section:Button(settings)
Section:Slider(settings)
Section:Dropdown(settings)
Section:Label(settings)
Section:Checkbox(settings)
Section:Input(settings)
Section:Divider(settings)

###Module Manager Methods:
ModuleManager:Toggle(value)
ModuleManager:Button(settings)
ModuleManager:Slider(settings)
ModuleManager:Dropdown(settings)
ModuleManager:Checkbox(settings)
ModuleManager:Input(settings)
ModuleManager:Label(settings)
ModuleManager:Divider(settings)

###Dropdown Manager Methods:
dropdown:Set(value, isToggle)
dropdown:Toggle()
dropdown:GetValue()
dropdown:SetValue(value)
dropdown:Clear()

###Slider Manager Methods:
slider:Set(value)

###Checkbox Manager Methods:
checkbox:change_state(state)
checkbox:scale_keybind(empty)
checkbox:connect_keybind()

###Input Manager Methods:
textbox:update_text(text)

###Global Isotopia Methods:
Isotopia:Notify(settings)

###Utility Functions:
Config:save(file_name, config)
Config:load(file_name)
Util:map(value, in_minimum, in_maximum, out_minimum, out_maximum)
Util:viewport_point_to_world(location, distance)
Util:get_offset()
]]
