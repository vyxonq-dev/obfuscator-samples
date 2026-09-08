local Stellar = loadstring(game:HttpGet("https://raw.githubusercontent.com/53845052/roblox-uis/refs/heads/main/StellarLib.lua"))(); Stellar:SetWindowKeybind(Enum.KeyCode.RightShift)
local Themes = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/53845052/roblox-uis/refs/heads/main/themes/Stellar.json"))
local ThemeList, ThemeNames = {}, {"Default"} do
  ThemeList.Default = Stellar:GetTheme()
  for Theme, Data in Themes do
    ThemeNames[#ThemeNames+1] = Theme
    ThemeList[Theme] = {}
    for Property, Color in Data do
      ThemeList[Theme][Property] = Color3.fromRGB(unpack(Color:split(",")))
    end
  end
end

if game:GetService("RunService"):IsStudio() then
  local files = {}
  writefile = function(path, content)
    files[path] = content
  end
  readfile = function(path)
    return files[path]
  end
  listfiles = function(path)
    local list = {}
    for filepath in files do
      if filepath:find(path) then
        list[#list+1] = filepath
      end
    end
    return list
  end
end

local function GetConfigList()
  local List = {}
  local Files = listfiles("stellar/")
  for _, File in Files do
    List[#List+1] = File:gsub("stellar/", ""):gsub(".json", "")
  end
  return List
end

local function SerializeFlags()
  local Flags = {}
  for Flag, Component in Stellar.Flags do
    if Flag:find("Config_") then continue end
    local Type = Component:GetComponentType()
    if Type == "Bind" then
      local IsKeyCode = Component:GetValue().EnumType == Enum.KeyCode
      Flags[Flag] = {"Bind", Component:GetMode(), Component:GetValue().Name, IsKeyCode}
    elseif Type == "Colorpicker" then
      local Value = Component:GetValue()
      Flags[Flag] = {"Colorpicker", {Value.R, Value.G, Value.B}, Component:GetTransparency()}
    elseif Type == "Toggle" then
      Flags[Flag] = {"Toggle", Component:GetValue()}
    elseif Type == "Slider" then
      Flags[Flag] = {"Slider", Component:GetValue()}
    elseif Type == "Dropdown" then
      Flags[Flag] = {"Dropdown", Component:GetValue()}
    elseif Type == "Textbox" then
      Flags[Flag] = {"Textbox", Component:GetValue()}
    end
  end
  return game:GetService("HttpService"):JSONEncode(Flags)
end

local function LoadFlags(Content)
  for Flag, Data in game:GetService("HttpService"):JSONDecode(Content) do
    local Component = Stellar.Flags[Flag]
    if not Component then continue end
    local ComponentType = Data[1]
    if ComponentType ~= Component:GetComponentType() then continue end
    if ComponentType == "Bind" then
      Component:SetValue(Data[4] and Enum.KeyCode[Data[3]] or Enum.UserInputType[Data[3]])
      Component:SetMode(Data[2])
    elseif ComponentType == "Colorpicker" then
      Component:SetValue(Color3.new(unpack(Data[2])))
      Component:SetTransparency(Data[3])
    elseif ComponentType == "Toggle" then
      Component:SetValue(Data[2])
    elseif ComponentType == "Slider" then
      Component:SetValue(Data[2])
    elseif ComponentType == "Dropdown" then
      Component:SetValue(Data[2])
    elseif ComponentType == "Textbox" then
      Component:SetValue(Data[2])
    end
  end
end

local Window = Stellar:Window({Title = "Stellar", SubTitle = "github.com/53845052", Status = "ui library made by @king xue / github.com/53845052/roblox-uis"}) do
  Window:Seperator({Title = "Tab Section"})
  local ExampleTab = Window:Tab({Title = "Tab with Tabs", Sections = {"Tab 1", "Tab 2", "and sooo on!"}}) do
    ExampleTab:GetSection("Tab 1"):Label({Title = "Label in tab 1", Description = "welcome to tab 1"})
    ExampleTab:GetSection("Tab 2"):Label({Title = "Label in tab 2", Description = "welcome to tab 2"})
    ExampleTab:GetSection("and sooo on!"):Label({Title = "Label in tab 3", Description = "welcome to tab 3 (and sooo on)"})
  end
  local TabWithoutTabs = Window:Tab({Title = "Tab without tabs"}) do
    TabWithoutTabs:Label({Title = "Label in a tab without tabs", Description = "welcome to a tab that has no other tabs!"})
  end
  Window:Seperator({Title = "Components"})
  local Toggles = Window:Tab({Title = "Toggles"}) do
    -- Flags are required for options to save
    Toggles:Toggle({Title = "Toggle", Description = "A simple toggle.", Flag = "SimpleToggle"})
    Toggles:Label({Title = "Info", Description = "Right click the Keybind to change it's mode, left click to change it."})
    Toggles:Toggle({Title = "Toggle", Description = "A simple bind toggle.", Flag = "BindToggle"}):Bind({Mode = "Hold", Default = Enum.UserInputType.MouseButton1, Flag = "Bind_BindToggle"})
    Toggles:Toggle({Title = "Toggle", Description = "A simple toggle with a color picker", Flag = "ColorPickerToggle"}):Colorpicker({Default = Stellar:GetTheme().Accent, Flag = "Color_ColorPickerToggle"})
    Toggles:Toggle({Title = "Toggle", Description = "A simple toggle with multiple color pickers", Flag = "ColorPickersToggle"})
      :Colorpicker({Default = Stellar:GetTheme().Accent, Flag = "Color_ColorPickerToggle1"})
      :Colorpicker({Default = Stellar:GetTheme().Accent, Flag = "Color_ColorPickerToggle2"})
      :Colorpicker({Default = Stellar:GetTheme().Accent, Flag = "Color_ColorPickerToggle3"})
    Toggles:Toggle({Title = "Toggle", Description = "A simple toggle with a color picker and a keybind", Flag = "KCToggle"}):Bind({Mode = "Toggle", Default = Enum.KeyCode.LeftShift, Flag = "Bind_KCToggle"})
      :Colorpicker({Default = Stellar:GetTheme().Accent, Flag = "Color_KCToggle"})
  end
  local Labels = Window:Tab({Title = "Labels"}) do
    Labels:Label({Title = "Info", Description = "Labels can do the same that Toggles can do."})
    Labels:Label({Title = "Label", Description = "Label with a keybind"}):Bind({Mode = "Hold", Default = Enum.KeyCode.B, Flag = "LB_Keybind"})
    Labels:Label({Title = "Label", Description = "Label with a color picker"}):Colorpicker({Default = Stellar:GetTheme().Accent, Flag = "LB_Color"})
  end
  local Sliders = Window:Tab({Title = "Sliders"}) do
    Sliders:Slider({Title = "Slider", Description = "A simple slider", Min = 0, Max = 100, Flag = "SliderSave1"})
    Sliders:Slider({Title = "Slider", Description = "A simple slider with a prefix", Min = 0, Max = 100, Prefix = "$", Flag = "SliderSave2"})
    Sliders:Slider({Title = "Slider", Description = "A simple slider with a suffix", Min = 0, Max = 100, Suffix = "%", Flag = "SliderSave3"})
    Sliders:Slider({Title = "Slider", Description = "A simple slider with both", Min = 0, Max = 100, Prefix = "$", Suffix = "%", Flag = "SliderSave4"})
    Sliders:Slider({Title = "Slider", Description = "A simple slider with a ZeroNumber", Min = 0, Max = 100, ZeroNumber = 50, Flag = "SliderSave5"})
    Sliders:Slider({Title = "Slider", Description = "A simple decimal slider", Min = 0, Max = 10, Decimal = 2, Flag = "SliderSave6"})
    Sliders:Slider({Title = "Slider", Description = "A simple dual slider", Default = {-10, 10}, Min = -100, Max = 100, Dual = true, Flag = "SliderSave7"})
  end
  local Dropdowns = Window:Tab({Title = "Dropdowns"}) do
    Dropdowns:Dropdown({Title = "Dropdown", Description = "A simple dropdown", Default = "Hello", Options = {"Hello", "world!"}, Flag = "DropSave1"})
    Dropdowns:Dropdown({Title = "Dropdown", Description = "A simple multi dropdown", Default = "Hello", Options = {"Hello", "world!"}, Multi = true, Flag = "DropSave2"})
    Dropdowns:Dropdown({Title = "Dropdown", Description = "A simple long dropdown", Default = "Hello", Options = {"Hello", "world!", "i am", "way tooo", "long", "for the drop dooooown", "right?"}, Multi = true, Flag = "DropSave3"})
  end
  local Textboxes = Window:Tab({Title = "Textboxes"}) do
    Textboxes:Textbox({Title = "Textbox", Description = "A simple textbox", Flag = "TextSave1"})
    Textboxes:Textbox({Title = "Textbox", Description = "A simple textbox that clears on focus", ClearOnFocus = true, Flag = "TextSave2"})
    Textboxes:Textbox({Title = "Textbox", Description = "A simple textbox with placeholder", Placeholder = "Hello world!", Flag = "TextSave3"})
    Textboxes:Textbox({Title = "Textbox", Description = "A simple textbox with default value", Default = "Hello world!", Placeholder = "Bye world!", Flag = "TextSave4"})
  end
  local Buttons = Window:Tab({Title = "Buttons"}) do
    Buttons:Button({Title = "Button", Description = "A simple button", Action = "Click me", Callback = function() warn("Clicked") end})
    Buttons:Button({Title = "Button", Description = "A simple button", Action = "Hello!", Callback = function() warn("Clicked") end})
    Buttons:Button({Title = "Button", Description = "A simple button", Action = "thats it...", Callback = function() warn("Clicked") end})
  end
  Window:Seperator({Title = "Misc"})
  local ConfigTab = Window:Tab({Title = "Config", Sections = {"Config", "Theme"}}) do
    local Config = ConfigTab:GetSection("Config") do
      Config:Dropdown({Title = "Configs", Description = "List of created configs.", Default = nil, Options = GetConfigList(), Flag = "Config_ConfigList"})
      Config:Button({Title = "Load Config", Description = "Loads selected config", Action = "Load", Callback = function()
        local Config = Stellar.Flags.Config_ConfigList:GetValue()
        LoadFlags(readfile(`stellar/{Config}.json`))
      end})
      Config:Button({Title = "Refresh Config List", Description = "Updates the config list", Action = "Refresh", Callback = function()
        Stellar.Flags.Config_ConfigList:SetOptions(GetConfigList())
      end})
      Config:Textbox({Title = "Config name", Description = "Name of the config that will be saved", Placeholder = "myconfig", Flag = "Config_ConfigName"})
      Config:Button({Title = "Save Config", Description = "Save config to file", Action = "Save", Callback = function()
        local ConfigName = Stellar.Flags.Config_ConfigName:GetValue()
        writefile(`stellar/{ConfigName}.json`, SerializeFlags())
        Stellar.Flags.Config_ConfigList:SetOptions(GetConfigList())
      end})
    end
    local Theme = ConfigTab:GetSection("Theme") do
      Theme:Dropdown({Title = "Premade Themes", Description = "Select a premade theme", Default = "Default", Options = ThemeNames, Callback = function(ThemeName)
        local SelectedTheme = ThemeList[ThemeName]
        for Property, Val in SelectedTheme do
          if Stellar.Flags[`Theme_{Property}`] then
            Stellar.Flags[`Theme_{Property}`]:SetValue(Val)
          end
        end
      end})
      Theme:Label({Title = "Interface Keybind", Description = "Key to toggle the UI on and off"}):Bind({Default = Stellar.WindowKeybind, Mode = "Toggle", Flag = "Theme_Toggle", Callback = function(Key)
        Stellar:SetWindowKeybind(Key)
      end})
      Theme:Slider({Title = "Animation Speed", Min = 0.25, Max = 2, ZeroNumber = 1, Decimal = 2, Default = Stellar.Theme.AnimationSpeed, Callback = function(NewSpeed)
        Stellar.Theme.AnimationSpeed = NewSpeed
      end})
      Theme:Label({Title = "Theme Colors", Description = "Change theme colors and see them reflect on the UI."})
			for Property, Value in Stellar:GetTheme() do
				if typeof(Value) ~= "Color3" then continue end
				Theme:Label({Title = Property, Description = `Color of {Property}`}):Colorpicker({Flag = `Theme_{Property}`, Default = Value, Callback = function(Color)
					local CTheme = Stellar:GetTheme()
					CTheme[Property] = Color
					Stellar:SetTheme(CTheme)
				end})
			end
    end
  end
end