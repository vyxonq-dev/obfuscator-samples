local Elastic = loadstring(game:HttpGet("https://raw.githubusercontent.com/53845052/roblox-uis/refs/heads/main/ElasticLib.lua"))(); Elastic:SetWindowKeybind(Enum.KeyCode.RightShift)
local Themes = game:GetService("HttpService"):JSONDecode(game:HttpGet("https://raw.githubusercontent.com/53845052/roblox-uis/refs/heads/main/themes/Elastic.json"))
local ThemeList, ThemeNames = {}, {"Default"} do
  ThemeList.Default = Elastic:GetTheme()
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
  local Files = listfiles("elastic/")
  for _, File in Files do
    List[#List+1] = File:gsub("elastic/", ""):gsub(".json", "")
  end
  return List
end

local function SerializeFlags()
  local Flags = {}
  for Flag, Component in Elastic.Flags do
    if Flag:find("Config_") then continue end
    local Type = Component:GetComponentType()
    if Type == "Keybind" then
      local IsKeyCode = Component:GetValue().EnumType == Enum.KeyCode
      Flags[Flag] = {"Keybind", Component:GetValue().Name, IsKeyCode}
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
    local Component = Elastic.Flags[Flag]
    if not Component then continue end
    local ComponentType = Data[1]
    if ComponentType ~= Component:GetComponentType() then continue end
    if ComponentType == "Keybind" then
      Component:SetValue(Data[3] and Enum.KeyCode[Data[2]] or Enum.UserInputType[Data[2]])
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

local Window = Elastic:Window() do
  local Watermark = Window:Watermark("Elastic - <font color='#6aa0f5'>Roblox UI Library</font> | King Xue (0)")
  Watermark:SetText("Elastic - <font color='#6aa0f5'>Roblox UI Library</font> | King Xue (1)")
  Watermark:SetPosition("TopLeft")
  Watermark:SetVisible(false)

  local AimbotTab = Window:Tab({Title = "Aimbot", Icon = "rbxassetid://11295279987"}) do
    AimbotTab:Toggle({Title = "Enable"})
    AimbotTab:Keybind({Title = "Aimbot keybind", Default = Enum.UserInputType.MouseButton1})
    AimbotTab:Toggle({Title = "Visible check"})
    AimbotTab:Toggle({Title = "Show field of view"}):Colorpicker()
    AimbotTab:Slider({Title = "Field of view", Min = 0, Max = 720, Suffix = "°"})
    AimbotTab:Dropdown({Title = "Hitboxes", Multi = true, Options = {"Head", "Torso", "Arms", "Pelvis", "legs"}})
    AimbotTab:Slider({Title = "Aimbot smoothing", Min = 0, Max = 100, Suffix = "%"})
  end

  local CombatTab = Window:Tab({Title = "Combat", Icon = "rbxassetid://16095745392"}) do
    CombatTab:Toggle({Title = "Kill aura"})
    CombatTab:Slider({Title = "Kill aura range", Min = 15, Max = 45, Suffix = "studs"})
    CombatTab:Slider({Title = "Kill aura delay", Min = 0, Max = 1, Decimal = 2, Suffix = "s"})
    CombatTab:Toggle({Title = "Visualize kill aura range"}):Colorpicker({Default = Elastic:GetTheme().Accent})
    CombatTab:Toggle({Title = "Auto parry"})
    CombatTab:Slider({Title = "Parry chance", Min = 0, Max = 100, Dual = true, Suffix = "%"})
    CombatTab:Slider({Title = "Parry range", Min = 15, Max = 45, Suffix = " studs"})
  end

  local VisualsTab = Window:Tab({Title = "Visuals", Icon = "rbxassetid://11963367322"}) do
    VisualsTab:Toggle({Title = "Name"}):Colorpicker()
    VisualsTab:Toggle({Title = "Box"}):Colorpicker()
    VisualsTab:Dropdown({Title = "Box type", Default = "Full", Options = {"Full", "Corner"}})
    VisualsTab:Toggle({Title = "Healthbar"}):Colorpicker()
    VisualsTab:Toggle({Title = "Tracers"}):Colorpicker()
    VisualsTab:Dropdown({Title = "Tracers origin", Default = "Center", Options = {"Center", "Bottom", "Top", "Mouse"}})
    VisualsTab:Toggle({Title = "Skeleton"}):Colorpicker()
    VisualsTab:Toggle({Title = "Head dot"}):Colorpicker()
    VisualsTab:Toggle({Title = "Chams"}):Colorpicker()
  end

  local MiscTab = Window:Tab({Title = "Misc", Icon = "rbxassetid://14202377484"}) do
    MiscTab:Toggle({Title = "Hitmarker (on screen)"}):Colorpicker()
    MiscTab:Toggle({Title = "Hitmarker (in world)"}):Colorpicker()
    MiscTab:Slider({Title = "Hitmarker lifetime", Min = 0, Max = 10, Decimal = 2, Suffix = "s"})
    MiscTab:Slider({Title = "Hitmarker volume", Default = 1, ZeroNumber = 1, Min = 0, Max = 2, Decimal = 2})
    MiscTab:Toggle({Title = "Crosshair"}):Colorpicker()
    MiscTab:Toggle({Title = "Hide scope"})
    MiscTab:Toggle({Title = "Hide crosshair when scoped"})
  end

  local WindowSettings = Window.ConfigTab do
    local SetTheme = Elastic.SetTheme do
      -- Only used for watermark "Roblox UI Library" text changing
      Elastic.SetTheme = function(s, Theme)
        Watermark:SetText(`Elastic - <font color='#{Theme.Accent:ToHex()}'><b>Roblox UI Library</b></font> | King Xue (1)`)
        return SetTheme(s, Theme)
      end
    end

    WindowSettings:Dropdown({Title = "Configs", Default = nil, Options = GetConfigList(), Flag = "Config_ConfigList"})
    WindowSettings:Button({Title = "Load Config", Action = "Load", Callback = function()
      local Config = Elastic.Flags.Config_ConfigList:GetValue()
      LoadFlags(readfile(`elastic/{Config}.json`))
    end})
    WindowSettings:Button({Title = "Refresh Config List", Action = "Refresh", Callback = function()
      warn(unpack(GetConfigList()))
      warn(Elastic.Flags.Config_ConfigList)
      Elastic.Flags.Config_ConfigList:SetOptions(GetConfigList())
    end})
    WindowSettings:Textbox({Title = "Config name", Placeholder = "myconfig", Flag = "Config_ConfigName"})
    WindowSettings:Button({Title = "Save config", Action = "Save", Callback = function()
      local ConfigName = Elastic.Flags.Config_ConfigName:GetValue()
      writefile(`elastic/{ConfigName}.json`, SerializeFlags())
      Elastic.Flags.Config_ConfigList:SetOptions(GetConfigList())
    end})

    WindowSettings:Toggle({Title = "Watermark", Callback = function(State)
      Watermark:SetVisible(State)
    end})
    WindowSettings:Dropdown({Title = "Watermark position", Default = "Top Left", Options = {
      "Top Left", "Top Right", "Bottom Left", "Bottom Right"
    }, Callback = function(State)
      Watermark:SetPosition(State:gsub(" ", ""))
    end})
    WindowSettings:Keybind({Title = "Toggle window", Default = Elastic.ToggleKey, Callback = function(State)
      Elastic:SetWindowKeybind(State)
    end})
    WindowSettings:Toggle({Title = "Rainbow accent", Callback = function(State)
      Elastic._rainbow = State
      local n = 0
      while Elastic._rainbow do
        local Theme = Elastic:GetTheme()
        local NewColor = Color3.fromHSV(n, 0.4, 1)
        n = (n + 0.01) % 1
        Theme.Accent = NewColor
        Elastic.Flags["Theme_Accent"]:SetValue(NewColor)
        task.wait(0.05)
      end
    end})
    WindowSettings:Dropdown({Title = "Premade Themes", Description = "Select a premade theme", Default = "Default", Options = ThemeNames, Callback = function(ThemeName)
      local SelectedTheme = ThemeList[ThemeName]
      for Property, Val in SelectedTheme do
        if Elastic.Flags[`Theme_{Property}`] then
          Elastic.Flags[`Theme_{Property}`]:SetValue(Val)
        end
      end
    end})
    local CTheme = Elastic:GetTheme()
    for Property, Value in CTheme do
      if typeof(Value) ~= "Color3" then continue end
      WindowSettings:Colorpicker({Title = `Theme - {Property} Color`, Flag = `Theme_{Property}`, Default = Value, Callback = function(State, Transparency)
        CTheme[Property] = State
        Elastic:SetTheme(CTheme)
      end})
    end
  end
end