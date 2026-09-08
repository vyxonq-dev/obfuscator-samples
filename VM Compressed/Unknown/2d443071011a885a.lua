local NotionUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/okdude42/notionui-lib/main/NotionUI.lua"
))()

local Window = NotionUI.new({
    Title = "NotionUI",
    Subtitle = "ready",
    Width = 560,
    Height = 350,
    Loading = true,
    LoadingDuration = 2.35,
    SaveSettings = true,
    Settings = false,
    ToggleKey = Enum.KeyCode.RightShift,
})

local MainTab = Window:AddTab("Main")
local MainSection = MainTab:AddSection("NotionUI")

MainSection:AddLabel("NotionUI is a minimalistic UI lib with beautiful animations")

MainSection:AddToggle({
    Name = "Example Toggle",
    Default = true,
    Callback = function(Value)
        Window:Notify("Toggle", tostring(Value))
    end,
})

MainSection:AddSlider({
    Name = "Example Slider",
    Min = 0,
    Max = 100,
    Default = 50,
    Decimals = 2,
    DragStep = 1,
    Smoothing = 22,
    Callback = function(Value)
        Window:SetStatus("slider  Â·  " .. tostring(Value))
    end,
})

MainSection:AddButton({
    Name = "Open Color Mixer",
    Callback = function()
        Window:OpenColorMixer({
            Title = "Color Mixer",
            Default = Window.Theme.Accent,
            Callback = function(Color)
                Window:SetAccent(Color, true)
            end,
        })
    end,
})

MainSection:AddButton({
    Name = "Notification",
    Callback = function()
        Window:Notify("NotionUI", "animations are live")
    end,
})

MainSection:AddButton({
    Name = "Open Popup",
    Callback = function()
        Window:Popup({
            Title = "NotionUI",
            Text = "This popup uses the same solid color and expand/collapse motion as the main window.",
        })
    end,
})

Window:AddSettingsTab()
MainTab:Select()
