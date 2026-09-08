local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "Safe C-Hub",
    LoadingTitle = "Welcome to Safe C-Hub!",
    LoadingSubtitle = "By afriendly_guest7",
    Discord = {
        Enabled = false,
    },
    KeySystem = false
})

-- Tabs
local mainTab = Window:CreateTab("Trending / Commonly Used", 4483345998)
local sillyTab = Window:CreateTab("Silly", 84348082102914)
local genderTab = Window:CreateTab("Gender", 6608845608)
local gameTab = Window:CreateTab("Game", 4728059072)

-- Welcome notification
Rayfield:Notify({
    Title = "Hello!",
    Content = "Hello " .. game.Players.LocalPlayer.DisplayName .. "! Thank you for using Safe C-Hub.",
    Duration = 5,
    Image = 20359303
})

-- Clipboard helper
local function copyText(text)
    setclipboard(text)
    Rayfield:Notify({
        Title = "Copied!",
        Content = "Paste the copied message into the chat.",
        Duration = 5,
        Image = 129353856287806
    })
end

-- =====================
-- Silly Tab (INTENTIONALLY MISSPELLED)
-- =====================
sillyTab:CreateButton({ Name = "ROFL", Callback = function() copyText("ROFL") end })
sillyTab:CreateButton({ Name = "Muahahahaha!", Callback = function() copyText("Muahahahaha!") end })
sillyTab:CreateButton({ Name = "z0mg h4x!", Callback = function() copyText("z0mg h4x!") end })
sillyTab:CreateButton({ Name = "GET OFF MAH LAWN", Callback = function() copyText("GET OFF MAH LAWN") end })
sillyTab:CreateButton({
    Name = "all your base are belong to me!",
    Callback = function()
        copyText("all your base are belong to me!")
    end
})
sillyTab:CreateButton({
    Name = "TEH EPIK DUCK IS COMING!!!",
    Callback = function()
        copyText("TEH EPIK DUCK IS COMING!!!")
    end
})
sillyTab:CreateButton({ Name = "1337", Callback = function() copyText("1337") end })
sillyTab:CreateButton({ Name = "w00t!", Callback = function() copyText("w00t!") end })
sillyTab:CreateButton({
    Name = "ub3rR0xXorzage!",
    Callback = function()
        copyText("ub3rR0xXorzage!")
    end
})
sillyTab:CreateButton({
    Name = "i r teh pwnz0r!",
    Callback = function()
        copyText("i r teh pwnz0r!")
    end
})

-- =====================
-- Gender Tab
-- =====================
genderTab:CreateButton({ Name = "Boy", Callback = function() copyText("Boy") end })
genderTab:CreateButton({ Name = "Girl", Callback = function() copyText("Girl") end })
genderTab:CreateButton({
    Name = "I don't want to say Boy or Girl, please don't ask.",
    Callback = function()
        copyText("I don't want to say Boy or Girl, please don't ask.")
    end
})

-- =====================
-- Game Tab
-- =====================
gameTab:CreateButton({ Name = "Let's build", Callback = function() copyText("Let's build") end })
gameTab:CreateButton({ Name = "Let's battle", Callback = function() copyText("Let's battle") end })
gameTab:CreateButton({ Name = "Nice one!", Callback = function() copyText("Nice one!") end })
gameTab:CreateButton({ Name = "So far so good!", Callback = function() copyText("So far so good!") end })
gameTab:CreateButton({ Name = "Lucky shot!", Callback = function() copyText("Lucky shot!") end })
gameTab:CreateButton({ Name = "Oh man!", Callback = function() copyText("Oh man!") end })
gameTab:CreateButton({
    Name = "I challenge you to a fight!",
    Callback = function()
        copyText("I challenge you to a fight!")
    end
})
gameTab:CreateButton({ Name = "Help me with this", Callback = function() copyText("Help me with this") end })
gameTab:CreateButton({ Name = "I'm on your side!", Callback = function() copyText("I'm on your side!") end })
gameTab:CreateButton({
    Name = "Can you show me how to do that?",
    Callback = function()
        copyText("Can you show me how to do that?")
    end
})
-- =====================
-- Main / Trending Tab
-- =====================
mainTab:CreateButton({ Name = "O_O", Callback = function() copyText("O_O") end })
mainTab:CreateButton({ Name = "Howdy", Callback = function() copyText("Howdy") end })
mainTab:CreateButton({
    Name = "You are doing something i don't like, please stop",
    Callback = function()
        copyText("You are doing something i don't like, please stop")
    end
})
mainTab:CreateButton({
    Name = "Who wants to be my friend?",
    Callback = function()
        copyText("Who wants to be my friend?")
    end
})
mainTab:CreateButton({ Name = "I like you", Callback = function() copyText("I like you") end })
mainTab:CreateButton({ Name = "LOLHOW?", Callback = function() copyText("LOLHOW?") end })
mainTab:CreateButton({ Name = "Waaaaaaaz up?!", Callback = function() copyText("Waaaaaaaz up?!") end })
mainTab:CreateButton({
    Name = "Greetings Robloxians!",
    Callback = function()
        copyText("Greetings Robloxians!")
    end
})
mainTab:CreateButton({
    Name = "Hasta la bye bye!",
    Callback = function()
        copyText("Hasta la bye bye!")
    end
})
mainTab:CreateButton({
    Name = "Stop breaking the rules (we're breaking the rules)",
    Callback = function()
        copyText("Stop breaking the rules")
    end
})
mainTab:CreateButton({ Name = "No problem", Callback = function() copyText("No problem") end })
mainTab:CreateButton({ Name = "I can't decide", Callback = function() copyText("I can't decide") end })
mainTab:CreateButton({
    Name = "I give it a 10 out of 10!",
    Callback = function()
        copyText("I give it a 10 out of 10!")
    end
})
mainTab:CreateButton({
    Name = "<(0_0<) <(0_0)> (>0_0)> KIRBY DANCE",
    Callback = function()
        copyText("<(0_0<) <(0_0)> (>0_0)> KIRBY DANCE")
    end
})
mainTab:CreateButton({
    Name = "Behold greatness, mortals!",
    Callback = function()
        copyText("Behold greatness, mortals!")
    end
})
mainTab:CreateButton({
    Name = "Destroy UI",
    Callback = function()
        Rayfield:Destroy()
    end
})