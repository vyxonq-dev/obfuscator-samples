local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Semo | Be a Lucky Block",
    LoadingTitle = "Semo Script",
    LoadingSubtitle = "by Semo",
    Theme = "Amethyst",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
})

local ScriptTab = Window:CreateTab("Get Script", "download")

ScriptTab:CreateLabel("Make sure to paste it into your Executor!")

ScriptTab:CreateDivider()

ScriptTab:CreateButton({
    Name = "Copy Script",
    Callback = function()
        setclipboard('loadstring(game:HttpGet("https://raw.githubusercontent.com/newgams/Rawg/refs/heads/main/luckyshit"))()')
        Rayfield:Notify({
            Title = "Copied!",
            Content = "Paste it into your executor and run it!",
            Duration = 3,
        })
    end,
})

Rayfield:LoadConfiguration()
