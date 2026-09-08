loadstring(game:HttpGet("https://raw.githubusercontent.com/woromates-dotcom/Project-PP-loading-/refs/heads/main/%E0%B8%94%E0%B8%B2%E0%B8%A7%E0%B8%99%E0%B9%8C%E0%B9%82%E0%B8%AB%E0%B8%A5%E0%B8%94%20(2).txt"))()

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local Window = WindUI:CreateWindow({

    Title = "Project PP",

    Icon = "door-open",

    Author = "by pun_pun",

    Folder = "project pun pun",

    

    Size = UDim2.fromOffset(580, 460),

    MinSize = Vector2.new(560, 350),

    MaxSize = Vector2.new(850, 560),

    Transparent = true,

    Theme = "Dark",

    Resizable = true,

    SideBarWidth = 200,

    BackgroundImageTransparency = 0.42,

    HideSearchBar = true,

    ScrollBarEnabled = false,

    User = {

        Enabled = true,

        Anonymous = true,

        Callback = function()      loadstring(game:HttpGet("https://pastefy.app/2OWyTovg/raw"))()

        end,

    },

})

Window:EditOpenButton({

    Title = "Open PP",

    Icon = "cpu",

    CornerRadius = UDim.new(0,20),

    StrokeThickness = 2,

    Color = ColorSequence.new( -- gradient

        Color3.fromHex("000000"), 

        Color3.fromHex("000000")

    ),

    OnlyMobile = false,

    Enabled = true,

    Draggable = true,

})

Window:Tag({

    Title = "v0.0.1",

    Icon = "",

    Color = Color3.fromHex("#000000"),

    Radius = 13,

})

local p1Tab = Window:Tab({

    Title = "project / ss",

    Icon = "terminal",

    Locked = false,

})

local scripts = {

    {Title = "project broken spawn", URL = "https://pastebin.com/raw/NyJfL0ey"},

    {Title = "ssp", URL = "https://pastefy.app/XHqVeb0d/raw"},

    {Title = "BiPolaria", URL = "https://pastebin.com/raw/8qFWEtWY"},

    {Title = "Polaria", URL = "https://pastefy.app/agqEB2qs/raw"},

    {Title = "Rc7", URL = "https://pastebin.com/raw/E11VV0G8"},

    {Title = "KlausGui ss", URL = "https://pastebin.com/raw/Y0CYLJ6z"},

    {Title = "luau x ss v3", URL = "https://raw.githubusercontent.com/gojohdkaisenkt2/Gojohdkaisenkt-/refs/heads/main/L"},

    {Title = "luau x ss v5", URL = "https://rawscripts.net/raw/Universal-Script-Luau-X-SS-V5-rework-50365"},

    {Title = "c00lgui", URL = "https://raw.githubusercontent.com/MiRw3b/c00lgui-v3rx/main/c00lguiv3rx.lua"},

    {Title = "stigma ultimate", URL = "https://raw.githubusercontent.com/C-Dr1ve/Executor-Remakes-In-Lua/refs/heads/main/Remakes/Stigma_Revision_0.lua"},

}

for _, v in pairs(scripts) do

    p1Tab:Button({

        Title = v.Title,

        Callback = function()

            loadstring(game:HttpGet(v.URL, true))()

        end

    })

end

local p2Tab = Window:Tab({

    Title = "hack map",

    Icon = "play",

    Locked = false,

})

p2Tab:Button({

    Title = "lumber tycoon",

    Callback = function()

        local player = game.Players.LocalPlayer

local TeleportService = game:GetService("TeleportService")

local gameId = 10451500531 -- Lumber Tycoon

-- Teleport ทันที

TeleportService:Teleport(gameId, player)

        WindUI:Notify({

            Title = "TP!",

            Content = "tp to map ✅",

            Duration = 3

        })

    end

})

local MiscTab = Window:Section({

    Title = "misc",

})

local player = game.Players.LocalPlayer

local Misc = MiscTab:Tab({

    Title = "Player Control",

    Icon = "settings"

})

Misc:Slider({

    Title = "WalkSpeed",

    Flag = "WalkSpeed",

    Step = 1,

    Value = { Min = 16, Max = 200, Default = 16 },

    Callback = function(Value)

        if player.Character and player.Character:FindFirstChild("Humanoid") then

            player.Character.Humanoid.WalkSpeed = Value

        end

    end

})

Misc:Slider({

    Title = "JumpPower",

    Flag = "JumpPower",

    Step = 1,

    Value = { Min = 50, Max = 300, Default = 50 },

    Callback = function(Value)

        if player.Character and player.Character:FindFirstChild("Humanoid") then

            player.Character.Humanoid.JumpPower = Value

        end

    end

})

Misc:Button({

    Title = "Reset to Default (16 / 50)",

    Color = Color3.fromHex("#ff6363"),

    Callback = function()

        if player.Character and player.Character:FindFirstChild("Humanoid") then

            player.Character.Humanoid.WalkSpeed = 16

            player.Character.Humanoid.JumpPower = 50

        end

        WindUI:Notify({

            Title = "Reset Complete",

            Content = "ค่า WalkSpeed / JumpPower ถูกรีเซ็ตแล้ว!"

        })

    end

})

Misc:Button({

    Title = "🕊️ Fly",

    Color = Color3.fromHex("#77ffb5"),

    Callback = function()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/Alfan-commits/Fly-V3-/refs/heads/main/Fly%20V3"))()

    end

})

Misc:Button({

    Title = "rejoin",

    Color = Color3.fromHex("#0000FF"),

    Callback = function()

local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)

    end

})

loadstring(game:HttpGet("https://raw.githubusercontent.com/woromates-dotcom/Project-PP-logo-/refs/heads/main/README.md"))()