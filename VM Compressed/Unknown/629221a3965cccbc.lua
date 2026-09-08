local BreezeUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kaisorius/BreezeUI/refs/heads/main/BreezeUI.lua"))()

local Window = BreezeUI:CreateWindow({
    Name = "BreezeUI",
    Description = "My Hub"
})

local MainTab = Window:CreateTab("Main")

local Button =MainTab:Button({
    Name = "Test Button",
    Description = "Click me",
    Callback = function()
        print("Clicked!")
    end
})

local Toggle =MainTab:Toggle({
    Name = "Test Toggle",
    Description = "Enable something",
    Callback = function(Value)
        print("Enabled:", Value)
    end
}) 