local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "Script Hub Grouping",
    LoadingTitle = "Created by Mayan_legameur12 ",
    LoadingSubtitle = "Loading...",
    Theme = "Default",
    DisableRayfieldPrompts = true,
    DisableBuildWarnings = true,
})

-- ============ SCRIPTS TAB ============
local Tab = Window:CreateTab("Scripts", 4483362458)

Tab:CreateSection("Mes Scripts")

Tab:CreateButton({
    Name = "99 Night Script",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/3SqvjKVy'))()
    end,
})

Tab:CreateButton({
    Name = "Titan Training Script",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/6b1Bxrpq'))()
    end,
})

Tab:CreateButton({
    Name = "Build and Battle / Swordkill",
    Callback = function()
        loadstring(game:HttpGet('https://pastebin.com/raw/mGsAZ9eA'))()
    end,
})

-- ============ CREDITS TAB ============
local CreditsTab = Window:CreateTab("Crédit", 4483362458)

CreditsTab:CreateSection("À propos")

CreditsTab:CreateParagraph({
    Title = "Script Hub Grouping",
    Content = "Hi, thanks to myself for creating this script. Hello and a huge thank you to everyone who uses this script :). This script was entirely created by a 14-year-old who enjoys creating scripts as a hobby, and thanks to all of you who use my script, you bring me joy to see people using it ❤️. This script will be a hub with several games that will have free scripts without a key system, and I will add more when I have the time. Sincerely, the Swordkill team"
})

CreditsTab:CreateParagraph({
    Title = "Développeurs",
    Content = "Thanks to Mayan_legameur14, Mayan_legameur13 and Mayan_legameur11 for participating in the development of the script."
})

CreditsTab:CreateSection("Discord")

CreditsTab:CreateButton({
    Name = "Join the Discord ",
    Callback = function()
        local lien = "https://discord.gg/TONLIEN"
        local ok = pcall(function()
            setclipboard(lien)
        end)
        if ok then
            Rayfield:Notify({
                Title=  "https://discord.gg/vcsVGK2eU",
                Content = "Lien copié : " .. lien,
                Duration = 5,
            })
        else
            Rayfield:Notify({
                Title = "Discord",
                Content = lien,
                Duration = 8,
            })
        end
    end,
})