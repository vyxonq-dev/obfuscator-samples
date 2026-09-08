local StacyUI = loadstring(game:HttpGet(
    "https://raw.githubusercontent.com/x8lua/scripts/main/stacycmd/StacyUI.lua"
))()

local console = StacyUI.new({
    Name = "Stacy",
    Prefix = "user@StacyUI$ ",
    ToggleKey = Enum.KeyCode.F1,
    CommandKey = Enum.KeyCode.Semicolon,
    IntroSize = Vector2.new(480, 120),
    IntroTargetSize = Vector2.new(92, 26),
    IntroTargetOffset = Vector2.new(0, 0),
    IntroTweenDuration = 0.7,
    OnDestroy = function()
        print("Script resources destroyed")
    end,
})