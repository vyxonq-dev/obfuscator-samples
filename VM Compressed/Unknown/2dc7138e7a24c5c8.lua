local Chronos = loadstring(game:HttpGet(
    "https://library.chronic817.workers.dev/"
))()

local Games = {
    [89469502395769] = {
        Name     = "Kick A Lucky Block",
        Script   = "https://scripts.chronic817.workers.dev/kickaluckyblock",
        Title    = "ChronosHUB",
        Subtitle = "Kick a Lucky Block",
        Welcome  = "Welcome, " .. game.Players.LocalPlayer.DisplayName .. "!",
        Debug    = false,

        -- Optional: 1 = default speed · 0.5 = twice as fast · 2 = half speed
        AnimSpeed   = 1,
        DiscordLink = "https://discord.com/invite/fu9fH2trGT",

        Junkie = {
            Service    = "ChronosHUB",
            Identifier = "11796",
            Provider   = "ChronosHUB Keys",
        },
        BannedExecutors = {"xeno", "solara"},
        BanMessage = {
            Title        = "ACCESS DENIED",
            Subtitle     = "Unsupported Executor",
            Body         = 'This script requires an executor with a higher UNC score.\n You can find a better executor at <font color="#FFD700">whatexpsare.online</font>.\n\nClick either to copy link & leave game',
            Redirect     = "https://whatexpsare.online/",
            RedirectText = "whatexpsare.online",
            Redirect2    = "https://discord.com/invite/fu9fH2trGT",
            RedirectText2 = "ChronosHUB Server",
            KickMessage  = "Unsupported executor detected.",
        },
        Theme = {
            Primary   = Color3.fromHex("#FFD700"),
            Secondary = Color3.fromHex("#C0A763"),
            Accent    = Color3.fromHex("#E3C56D"),
            GradStart = Color3.fromHex("#0A0A0F"),
            GradEnd   = Color3.fromHex("#1A0533"),
            GradAngle = 135,
        },
        Icons = {"moon", "key", "box", "dumbbell"},
    },

    [107646426076756] = {
        Name     = "Build A Ring Farm",
        Script   = "https://scripts.chronic817.workers.dev/buildaringfarm",
        Title    = "ChronosHUB",
        Subtitle = "Build A Ring Farm",
        Welcome  = "Welcome, " .. game.Players.LocalPlayer.DisplayName .. "!",
        Debug    = true,

        AnimSpeed   = 1,
        DiscordLink = "https://discord.com/invite/fu9fH2trGT",

        Junkie = {
            Service    = "ChronosHUB",
            Identifier = "11796",
            Provider   = "ChronosHUB Keys",
        },
        BannedExecutors = {"xeno", "solara"},
        BanMessage = {
            Title        = "ACCESS DENIED",
            Subtitle     = "Unsupported Executor",
            Body         = 'This script requires an executor with a higher UNC score.\n You can find a better executor at <font color="#FFD700">whatexpsare.online</font>.\n\nClick either to copy link & leave game',
            Redirect     = "https://whatexpsare.online/",
            RedirectText = "whatexpsare.online",
            Redirect2    = "https://discord.com/invite/fu9fH2trGT",
            RedirectText2 = "ChronosHUB Server",
            KickMessage  = "Unsupported executor detected.",
        },
        Theme = {
            Primary   = Color3.fromHex("#00D4B8"),
            Secondary = Color3.fromHex("#00A38A"),
            Accent    = Color3.fromHex("#33FFDB"),
            GradStart = Color3.fromHex("#0A0A0F"),
            GradEnd   = Color3.fromHex("#001A33"),
            GradAngle = 135,
        },
        Icons = {"moon", "key", "droplet", "sprout", "package", "store"},
    },

    [107095834793267] = {
        Name     = "Oil Empire",
        Script   = "https://scripts.chronic817.workers.dev/oil-empire",
        Title    = "ChronosHUB",
        Subtitle = "Oil Empire",
        Welcome  = "Welcome, " .. game.Players.LocalPlayer.DisplayName .. "!",
        Debug    = false,

        AnimSpeed   = 1,
        DiscordLink = "https://discord.com/invite/fu9fH2trGT",

        Junkie = {
            Service    = "ChronosHUB",
            Identifier = "11796",
            Provider   = "ChronosHUB Keys",
        },
        BannedExecutors = {"xeno", "solara"},
        BanMessage = {
            Title        = "ACCESS DENIED",
            Subtitle     = "Unsupported Executor",
            Body         = 'This script requires an executor with a higher UNC score.\n You can find a better executor at <font color="#FFD700">whatexpsare.online</font>.\n\nClick either to copy link & leave game',
            Redirect     = "https://whatexpsare.online/",
            RedirectText = "whatexpsare.online",
            Redirect2    = "https://discord.com/invite/fu9fH2trGT",
            RedirectText2 = "ChronosHUB Server",
            KickMessage  = "Unsupported executor detected.",
        },
        Theme = {
            Primary   = Color3.fromHex("#00BFFF"),
            Secondary = Color3.fromHex("#0088CC"),
            Accent    = Color3.fromHex("#33CCFF"),
            GradStart = Color3.fromHex("#0A0A0F"),
            GradEnd   = Color3.fromHex("#001A33"),
            GradAngle = 90,
        },
        Icons = {"moon", "key", "factory", "fuel"},
    },

    [92416421522960] = {
        Name     = "Slime RNG",
        Script   = "https://scripts.chronic817.workers.dev/slimerng",
        Title    = "ChronosHUB",
        Subtitle = "Slime RNG",
        Welcome  = "Welcome, " .. game.Players.LocalPlayer.DisplayName .. "!",
        Debug    = false,

        AnimSpeed   = 1,
        DiscordLink = "https://discord.com/invite/fu9fH2trGT",

        Junkie = {
            Service    = "ChronosHUB",
            Identifier = "11796",
            Provider   = "ChronosHUB Keys",
        },
        BannedExecutors = {"xeno", "solara"},
        BanMessage = {
            Title        = "ACCESS DENIED",
            Subtitle     = "Unsupported Executor",
            Body         = 'This script requires an executor with a higher UNC score.\n You can find a better executor at <font color="#FFD700">whatexpsare.online</font>.\n\nClick either to copy link & leave game',
            Redirect     = "https://whatexpsare.online/",
            RedirectText = "whatexpsare.online",
            Redirect2    = "https://discord.com/invite/fu9fH2trGT",
            RedirectText2 = "ChronosHUB Server",
            KickMessage  = "Unsupported executor detected.",
        },
        Theme = {
            Primary   = Color3.fromHex("#FF2222"),
            Secondary = Color3.fromHex("#FFEA00"),
            Accent    = Color3.fromHex("#FF6666"),
            GradStart = Color3.fromHex("#0A0A0F"),
            GradEnd   = Color3.fromHex("#001A33"),
            GradAngle = 90,
        },
        Icons = {"moon", "key", "shell", "hexagon", "dice-1", "dice-2", "dice-3", "dice-4", "dice-5", "dice-6", "clover"},
    },
}

Chronos:Init({
    Games = Games,
})