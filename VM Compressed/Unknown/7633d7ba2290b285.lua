local Seraph = loadstring(game:HttpGet("https://raw.githubusercontent.com/53845052/roblox-uis/refs/heads/main/SeraphLib.lua"))(); Seraph:SetWindowKeybind(Enum.KeyCode.RightShift)
local Themes = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/53845052/roblox-uis/refs/heads/main/themes/Seraph.json"))
local ThemeList, ThemeNames = {}, {"Default"} do
  ThemeList.Default = Seraph:GetTheme()
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


-- or Seraph:Window("rbxassetid://10723407389")
local Window = Seraph:Window("Seraph") do
  local MainTab = Window:AddTab({"rbxassetid://10723407389"}) do
    local Components = MainTab:AddCategory("Components") do
      local Labels = Components:AddSubCategory("Labels") do
        local Main = Labels:AddSection("Main") do
          Main:Label({Title = "Label Example"})
          Main:Label({Title = "Label with Bind"}):Bind({Flag = "0", Default = Enum.KeyCode.Equals})
          Main:Label({Title = "Label with Color"}):Colorpicker({Flag = "1", Default = Color3.fromRGB(123,123,123)})
          Main:Label({Title = "label with Bind + Color"}):Bind({Flag = "2", Default = Enum.KeyCode.Equals}):Colorpicker({Flag = "3", Default = Color3.fromRGB(123,123,123)})
          Main:Label({Title = "label with lots of colors"}):Colorpicker({Flag = "4", Default = Color3.fromRGB(123,123,123)}):Colorpicker({Flag = "5", Default = Color3.fromRGB(123,123,123)}):Colorpicker({Flag = "6", Default = Color3.fromRGB(123,123,123)})
        end
      end
      local Toggles = Components:AddSubCategory("Toggles") do
        local Main = Toggles:AddSection("Main") do
          Main:Toggle({Title = "Toggle", Flag = "7"})
          Main:Toggle({Title = "Toggle with bind", Flag = "8"}):Bind({Mode = "Hold", Default = Enum.UserInputType.MouseButton2, Flag = "9"})
          Main:Toggle({Title = "Toggle with color", Flag = "10"}):Colorpicker({Flag = "11", Default = Color3.fromRGB(123,123,123)})
          Main:Toggle({Title = "Toggle with color + bind", Flag = "11"}):Bind({Mode = "Hold", Default = Enum.UserInputType.MouseButton2, Flag = "12"}):Colorpicker({Flag = "13", Default = Color3.fromRGB(123,123,123)})
          Main:Toggle({Title = "Toggle with colors", Flag = "14"}):Colorpicker({Flag = "15", Default = Color3.fromRGB(123,123,123)}):Colorpicker({Flag = "16", Default = Color3.fromRGB(123,123,123)}):Colorpicker({Flag = "17", Default = Color3.fromRGB(123,123,123)}):Colorpicker({Flag = "18", Default = Color3.fromRGB(123,123,123)})
        end
      end
      local Sliders = Components:AddSubCategory("Sliders") do
        local Main = Sliders:AddSection("Main") do
          Main:Slider({Title = "Slider", Min = 0, Max = 100, Flag = "19"})
          Main:Slider({Title = "Slider (Zero Value)", ZeroValue = 0, Min = -100, Max = 100, Flag = "20"})
          Main:Slider({Title = "Slider (Zero Value = 25)", ZeroValue = 25, Min = 0, Max = 100, Flag = "21"})
          Main:Slider({Title = "Slider (Decimal)", Min = 0, Max = 10, Decimal = 2, Flag = "22"})
          Main:Slider({Title = "Slider (Decimal + Zero Value)", ZeroValue = 0, Min = -10, Max = 10, Decimal = 2, Flag = "23"})
          Main:Slider({Title = "Slider (Dual)", Dual = true, Default = {-5, 2}, Min = -10, Max = 10, Flag = "24"})
          Main:Slider({Title = "Slider (Dual + Decimal)", Dual = true, Default = {-5.5, 2.5}, Min = -10, Max = 10, Decimal = 2, Flag = "25"})
        end
        local Dynamic = Sliders:AddSection("Dynamic") do
          Dynamic:Slider({Title = "Anti Aim Angle", ZeroValue = 0, Default = 0, Min = -180, Max = 180, Flag = "AntiAimAngle"})
          Dynamic:Toggle({Title = "Jitter", Flag = "AntiAimJitter", Callback = function()
            if not Seraph.Flags.AntiAimJitter then return end
            while Seraph.Flags.AntiAimJitter:GetValue() do
              local NewAngle = math.random(unpack(Seraph.Flags.AntiAimJitterRange:GetValue()))
              Seraph.Flags.AntiAimAngle:SetValue(NewAngle)
              task.wait()
            end
          end})
          Dynamic:Slider({Title = "Jitter Range", Dual = true, Default = {-10, 10}, Min = -180, Max = 180, Flag = "AntiAimJitterRange"})
        end
      end
      local Dropdowns = Components:AddSubCategory("Dropdowns") do
        local Main = Dropdowns:AddSection("Main") do
          Main:Dropdown({Title = "Dropdown", Options = {"Hello", "World!"}})
          Main:Dropdown({Title = "Dropdown (Default)", Default = "Hello", Options = {"Hello", "World!"}})
          Main:Dropdown({Title = "Dropdown Multi", Options = {"Hello", "World!"}, Multi = true})
          Main:Dropdown({Title = "Dropdown Multi (Default)", Default = {"Hello"}, Options = {"Hello", "World!"}, Multi = true})
          Main:Dropdown({Title = "Dropdown Multi (Too Long)", Options = {"Hello", "World!", "How", "are", "you?", "I am", "fine", "AAAAAAAAAAAAAAAAAAAAAAAAAAA"}, Multi = true})
        end
        local Dynamic = Dropdowns:AddSection("Dynamic") do
          Dynamic:Dropdown({Title = "Dynamic Dropdown", Options = {"Hello", "world!"}, Flag = "DynamicDropdown"})
          Dynamic:Button({Title = "Update options", Callback = function()
            local RandomOptions = {} do
              for i = 1, math.random(1, 50) do
                RandomOptions[#RandomOptions+1] = `Random option: {i}`
              end
            end
            Seraph.Flags.DynamicDropdown:SetOptions(RandomOptions)
          end})
        end
      end
      local Textboxes = Components:AddSubCategory("Textboxes") do
        local Main = Textboxes:AddSection("Textboxes") do
          Main:Textbox({Title = "Textbox"})
          Main:Textbox({Title = "Textbox (Default)", Default = "Hello!"})
          Main:Textbox({Title = "Textbox (Placeholder)", Placeholder = "Type here!"})
          Main:Textbox({Title = "Textbox (Default + Placeholder)", Default = "I wrote something!", Placeholder = "Type here!"})
          Main:Textbox({Title = "Textbox (Clear text on focus)", ClearText = true, Default = "I wrote something!", Placeholder = "Type here!"})
        end
      end
      local Buttons = Components:AddSubCategory("Buttons") do
        local Main = Buttons:AddSection("Main") do
          Main:Button({Title = "Button"})
          Main:Button({Title = "Button Group"}):Button({Title = "Button Group"})
          Main:Button({Title = "1"}):Button({Title = "2"}):Button({Title = "3"}):Button({Title = "4"})
          Main:Button({Title = "1"}):Button({Title = "2"}):Button({Title = "3"}):Button({Title = "4"}):Button({Title = "1"}):Button({Title = "2"}):Button({Title = "3"}):Button({Title = "4"})
        end
      end
    end
  end
  local ConfigTab = Window:AddTab({"rbxassetid://10734941499"}) do
    local Saves = ConfigTab:AddCategory("Saves") do
      -- For the config system to work a flag needs to be added to a component (Two or more components cannot have the same flag or it will not save.)
      local Config = Saves:AddSubCategory("Config") do
        local Main = Config:AddSection("Main") do
          Main:Textbox({Title = "Config Name", Placeholder = "coolconfig", Flag = "Config_TextBox"})
          Main:Button({Title = "Save Config", Callback = function()
            local ConfigName = Seraph.Flags.Config_TextBox:GetValue()
            if not ConfigName then return end

            local Serialized = {}
            for Flag, Component in Seraph.Flags do
              if Flag:find("Config_") or Flag:find("Theme_") then continue end
              local Value = Component:GetValue()

              if typeof(Value) == "EnumItem" then
                Value = Value.Name
              end
              if typeof(Value) == "Color3" then
                Value = `{Value.R},{Value.G},{Value.B}`
              end
              Serialized[Flag] = Value
            end
            writefile(`seraph/{ConfigName}.json`, game:GetService("HttpService"):JSONEncode(Serialized))
          end})
          Main:Dropdown({Title = "Configs", Options = {}, Flag = "Config_ConfigList"})
          Main:Button({Title = "Load Config", Callback = function()
            local ConfigName = Seraph.Flags.Config_ConfigList:GetValue()
            if not ConfigName then return end

            local function GetEnum(Name)
              for i,v in Enum.KeyCode:GetEnumItems() do
                if v.Name == Name then
                  return Enum.KeyCode[Name]
                end
              end
              for i,v in Enum.UserInputType:GetEnumItems() do
                if v.Name == Name then
                  return Enum.UserInputType[Name]
                end
              end
            end

            local Content = game:GetService("HttpService"):JSONDecode(readfile(`seraph/{ConfigName}.json`))
            for Flag, Value in Content do
              if typeof(Value) == "string" then
                if GetEnum(Value) then
                  Value = GetEnum(Value)
                elseif #Value:split(",") == 3 then
                  Value = Color3.new(unpack(Value:split(",")))
                end
              end
              if Seraph.Flags[Flag] then
                Seraph.Flags[Flag]:SetValue(Value)
              end
            end
          end})
          Main:Button({Title = "Refresh Configs", Callback = function()
            local ConfigDropdown = Seraph.Flags.Config_ConfigList
            local PrettyNames = {}
            local Files = listfiles("seraph/")
            for _, File in Files do
              PrettyNames[#PrettyNames+1] = File:gsub("seraph/", ""):gsub(".json", "")
            end
            ConfigDropdown:SetOptions(PrettyNames)
          end})
        end
      end
      local Interface = Saves:AddSubCategory("Interface") do
        local Window = Interface:AddSection("Window") do
          Window:Label({Title = "Interface Toggle"}):Bind({
            Default = Seraph.WindowKeybind,
            Flag = "WindowBind",
            Callback = function(Bind)
              Seraph:SetWindowKeybind(Bind)
            end
          })
        end
        local Colors = Interface:AddSection("Colors") do
          for i,v in Seraph:GetTheme() do
            Colors:Label({Title = i}):Colorpicker({Default = v, Flag = `Theme_{i}`, Callback = function(NewColor)
                local NTheme = Seraph:GetTheme()
                NTheme[i] = NewColor
                Seraph:SetTheme(NTheme)
            end})
          end
          Colors:Dropdown({Title = "Themes", Options = ThemeNames, Default = "Default", Callback = function(Option)
            for Property, Val in ThemeList[Option] do
              if Seraph.Flags[`Theme_{Property}`] then
                Seraph.Flags[`Theme_{Property}`]:SetValue(Val)
              end
            end
            Seraph:SetTheme(ThemeList[Option])
          end})
          Colors:Slider({Title = "Animation Speed", ZeroValue = 1, Default = 1, Min = 0.25, Max = 2, Decimal = 2, Callback = function(Val)
            Seraph:SetAnimationSpeed(Val)
          end})
        end
      end
    end
  end
end