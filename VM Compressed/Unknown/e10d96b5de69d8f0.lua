-- Load Rayfield UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local setclipboard = setclipboard or toclipboard
local roastLines = {
    "You're not stupid; you just have bad luck thinking.",
    "You bring everyone so much joy... when you leave.",
    "You're the reason shampoo has instructions.",
    "You're like a cloud. When you disappear, it's a beautiful day.",
    "You're proof anyone can be anything—just not good at it.",
    "You're a masterpiece—of awkward moments.",
    "You're like a software update—always annoying and unnecessary.",
    "You're the reason they put directions on Pop-Tarts.",
    "You have something on your chin... no, the third one down.",
    "You're the kind of person who would trip over a wireless connection.",
    "You're so fake, Barbie is jealous.",
    "You bring everyone down like airplane mode.",
    "You have something on your face: stupidity.",
    "You're so dense, black holes are jealous.",
    "Your secrets are always safe with me. I never even listen when you tell me them.",
    "You're the human version of a participation trophy.",
    "You couldn't pour water out of a boot with instructions on the heel.",
    "You have something between your ears. Oh wait—nothing.",
    "You're like a 404 error. Not found.",
    "You're the reason the gene pool needs a lifeguard.",
    "You have something rare... bad taste in everything.",
    "You're like a broken pencil — pointless.",
    "You're the human version of lag.",
    "You bring cringe to a whole new level.",
    "You're why doors have push and pull signs.",
    "You're like a math problem — too complex and still wrong.",
    "You're the boss level of awkward.",
    "You're more disappointing than an unsalted fry.",
    "You're like a mystery with no payoff.",
    "You're the definition of background character.",
    "You're slower than dial-up internet.",
    "You're the kind of person who claps when the plane lands.",
    "You're the lag in my life.",
    "You're like a popup ad — always in the way.",
    "You're the plot twist nobody wanted.",
    "You're the loading screen of conversations.",
    "You're not ugly, just allergic to style.",
    "You're the scratch on my favorite disc.",
    "You're so boring, even your shadow left you.",
    "You're like a song stuck in my head — annoying and repetitive.",
    "You're so irrelevant, autocorrect doesn't recognize your name.",
    "You're the clown at a funeral — wrong in every way.",
    "You're the 'Skip Intro' button of friendships.",
    "You're the result of pressing random buttons.",
    "You're like a coffee with no caffeine.",
    "You're not just a joke — you're the whole stand-up show.",
    "You're the expired milk of the friend group.",
    "You're the bug in every update.",
    "You're like a rerun — nothing new, still not funny.",
    "You're so random, even RNG avoids you.",
    "You're the patch note nobody reads."
}

-- Fill to 100 roasts
for i = #roastLines + 1, 100 do
    table.insert(roastLines, "Roast Line #" .. i .. " 🔥")
end

-- Create Rayfield Window
local Window = Rayfield:CreateWindow({
    Name = "🔥 NUH ROAST HUB",
    LoadingTitle = "Loading Roast Hub...",
    LoadingSubtitle = "Copy roasts with one click!",
    ConfigurationSaving = {
        Enabled = false
    },
    Discord = {
        Enabled = false
    },
    KeySystem = false
})

local MainTab = Window:CreateTab("Roasts", 4483362458)

-- Copy & Notify function
local function copyRoast(roast)
    if setclipboard then
        setclipboard(roast)
    end

    Rayfield:Notify({
        Title = "Copied!",
        Content = "Roast copied to clipboard.",
        Duration = 2,
        Image = 4483362458,
    })
end

-- Create buttons for each roast
for _, roast in ipairs(roastLines) do
    MainTab:CreateButton({
        Name = roast,
        Callback = function()
            copyRoast(roast)
        end
    })
end
