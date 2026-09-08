local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bxnks Hub (Key System)", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Player = game.Players.LocalPlayer

OrionLib:MakeNotification({
    Name = "Logged in!",
    Content = "You are logged in as "..Player.Name..".",
    Image = "rbxassetid://4483345998",
    Time = 5
})


function Correctkey()
OrionLib:MakeNotification({
    Name = "Correct Key",
    Content = "You Have Entered The Correct Key",
    Image = "rbxassetid://4483345998",
    Time = 5
})
end

function InCorrectkey()
OrionLib:MakeNotification({
    Name = "Incorrect Key",
    Content = "You Have Entered The Incorrect Key",
    Image = "rbxassetid://4483345998",
    Time = 5
})
end


function GetKey()
OrionLib:MakeNotification({
    Name = "Get Key",
    Content = "Copied Link",
    Image = "rbxassetid://4483345998",
    Time = 5
})
end

_G.Key = "BxnksOnTop342"
_G.KeyInput = "string"

function Blxs()
    loadstring(game:HttpGet("https://pastebin.com/raw/4qRTuvrK"))()
end

local Tab = Window:MakeTab({
    Name = "Key System",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab:AddTextbox({
    Name = "Enter Key",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        _G.KeyInput = Value -- Set the global variable to the entered value
        print("Entered Key:", Value)
    end
})

Tab:AddButton({
    Name = "Check Key",
    Callback = function()
        if _G.KeyInput == _G.Key then
            Correctkey()
            Blxs()
        else
            InCorrectkey()
        end
      end
})


Tab:AddButton({
    Name = "Get Key",
    Callback = function()
              setclipboard("https://social-unlock.com/zvEWw")
            GetKey()
      end
})