local Version = "1.6.41"
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/download/" .. Version .. "/main.lua"))()

local Window = WindUI:CreateWindow({
    Title = "Brookhaven Rp🏡 | Alya Hub",
    Icon = "door-open",
    Author = "By xnm504 [Roblox User]",
    Folder = "AlyaHub",
})

local Tab = Window:Tab({
    Title = "Bundles [Full Body Without Head]",
    Icon = "bird",
    Locked = false,
})

local Button = Tab:Button({
    Title = "Zepeto [Boy]",
    Desc = "Indonesia 🇮🇩",
    Locked = false,
    Callback = function()
        local args = {
    [1] = {
        [1] = 123916977258376,
        [2] = 121397669380873,
        [3] = 116229930426772,
        [4] = 103224430842613,
        [5] = 92565592431265,
        [6] = 0
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end
})
local Button = Tab:Button({
    Title = "Zepeto [Girl]",
    Desc = "Philippines 🇵🇭",
    Locked = false,
    Callback = function()
        local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 80766960128463,
        [5] = 90734460351120,
        [6] = 0
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end
})
local Button = Tab:Button({
    Title = "Zepeto [Girl]",
    Desc = "Indonesia 🇮🇩",
    Locked = false,
    Callback = function()
        local args = {
    [1] = {
        [1] = 131748111436488,
        [2] = 135594569190015,
        [3] = 109067870029660,
        [4] = 123554824904996,
        [5] = 117665557381131,
        [6] = 0
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    end
})
