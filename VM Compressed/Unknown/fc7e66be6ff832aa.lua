local ScriptLibrary = {
    Catalog = {
        {
            Name = "Hiru Hub",
            Game = "Blox Fruits",
            RawCode = [[getgenv().Settings = {
    JoinTeam = true,
    Team = "Marines"
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/kiddohiru/Source/main/BloxFruits.lua"))()]],
            Execute = function()
                getgenv().Settings = {
                    JoinTeam = true,
                    Team = "Marines"
                }
                loadstring(game:HttpGet("https://raw.githubusercontent.com/kiddohiru/Source/main/BloxFruits.lua"))()
            end
        },
        {
            Name = "QuantumOnyx Project",
            Game = "Blox Fruits",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/flazhy/QuantumOnyx/refs/heads/main/QuantumOnyx.lua"))()
            end
        },
        {
            Name = "Ringta Scripts (Patched)",
            Game = "99 Nights in the Forest",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/99daysloader.github.io/refs/heads/main/ringta.lua"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/wefwef127382/99daysloader.github.io/refs/heads/main/ringta.lua"))()
            end
        },
        {
            Name = "Redz Hub (Beta)",
            Game = "Blox Fruits",
            RawCode = [[local Settings = {
  JoinTeam = "Pirates", -- Pirates/Marines
  Translator = true -- true/false
}
getgenv().BETA_VERSION = true
loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)]],
            Execute = function()
                local Settings = {
                    JoinTeam = "Pirates",
                    Translator = true
                }
                getgenv().BETA_VERSION = true
                loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))(Settings)
            end
        },
        {
            Name = "Zee Hub",
            Game = "Blox Fruits",
            RawCode = [[loadstring(game:HttpGet("https://link.trwxz.com/LS-Zee-Hub-VIP"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://link.trwxz.com/LS-Zee-Hub-VIP"))()
            end
        },
        {
            Name = "Dex Explorer",
            Game = "Universal",
            RawCode = [[loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Keyless-dex-working-new-25658"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Keyless-dex-working-new-25658"))()
            end
        },
        {
            Name = "ThanHub",
            Game = "Grow a Garden",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/thantzy/thanhub/refs/heads/main/thanv1"))()
            end
        },
        {
            Name = "NatHub",
            Game = "Grow a Garden",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/greywaterstill/GAG/refs/heads/main/nathub.lua"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/greywaterstill/GAG/refs/heads/main/nathub.lua"))()
            end
        },
        {
            Name = "H4X Hub",
            Game = "Grow a Garden",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader2.lua"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/H4xScripts/Loader/refs/heads/main/loader2.lua"))()
            end
        },
        {
            Name = "Infinite Yield FE",
            Game = "Universal",
            RawCode = [[loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()]],
            Execute = function()
                loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source', true))()
            end
        },
        {
            Name = "Gravity Hub",
            Game = "Blox Fruits",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Dev-GravityHub/BloxFruit/refs/heads/main/Main.lua"))()
            end
        },
        {
            Name = "Terminal V5.0",
            Game = "Universal",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/H4T0-debug/Terminal_V5/refs/heads/main/Terminal_V5"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/H4T0-debug/Terminal_V5/refs/heads/main/Terminal_V5"))()
            end
        },
        {
            Name = "FoxName",
            Game = "99 Nights in the Forest",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/99-Nights-in-the-Forest/main/99%20Nights%20in%20the%20Forest"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/99-Nights-in-the-Forest/main/99%20Nights%20in%20the%20Forest"))()
            end
        },
        {
            Name = "Ringta Hub V2",
            Game = "99 Nights in the Forest & 6 Games",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtahub/Ringta-hub/refs/heads/main/Ringta"))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/ringtahub/Ringta-hub/refs/heads/main/Ringta"))()
            end
        },
        {
            Name = "Vape Voidware",
            Game = "99 Nights in the Forest & 3 More Games",
            RawCode = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/loader.lua", true))()]],
            Execute = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/VapeVoidware/VW-Add/main/loader.lua", true))()
            end
        }
    }
}

return ScriptLibrary