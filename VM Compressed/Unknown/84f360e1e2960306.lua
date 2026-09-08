
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Fe hub ",
    SubTitle = "listed fe script",
    TabWidth = 160,
    Size = UDim2.fromOffset(470, 250),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})

local Tabs = {
    Main = Window:AddTab({ Title = "fe scripts", Icon = "contact" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Loaded",
        Content = "old script revive loaded",
        SubContent = "",
        Duration = 5
    })



    Tabs.Main:AddParagraph({
        Title = "reset when swiching to others script (dont spam it)",
        Content = ""
    })



    Tabs.Main:AddButton({
        Title = "Fe Ravager",
        Description = "Fe Ravager convert from Im_patrick, date : Jun 18, 2022",
        Callback = function()
             loadstring(game:HttpGet('https://pastebin.com/raw/nVHcJ1df'))()
        end
    })
    
    
    Tabs.Main:AddButton({
        Title = "fe among us v2",
        Description = "amongus v2 created by myworld, date : May 2, 2022",
        Callback = function()
          loadstring(game:HttpGet('https://rawscripts.net/raw/Nothing-Fe-Among-Us-V2-(R6)-3224'))()
        end
    })
    
    Tabs.Main:AddButton({
        Title = "fe nameless animation v4",
        Description = "nameless animation created by myworld, date : Jun 28, 2022",
        Callback = function()
                      loadstring(game:HttpGet('https://rawscripts.net/raw/Universal-Script-FE-Nameless-Animations-V4-4249'))()
        end
    })

	Tabs.Main:AddButton({
        Title = "fe cop v2",
        Description = "fe cop , date : Jun 1st, 2022",
        Callback = function()
                      loadstring(game:HttpGet('https://pastebin.com/raw/vfdDh1eN'))()
        end
    })

    Tabs.Main:AddButton({
        Title = "fe grandmaster",
        Description = "date : Nov 18, 2022",
        Callback = function()
         loadstring(game:HttpGet('https://pastebin.com/raw/jnfLkZVR'))()
        end
    })
if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then return game:GetService("TeleportService"):Teleport(17574618959, game:GetService("Players").LocalPlayer) end
Tabs.Main:AddButton({
        Title = "fe chill",
        Description = "make ur character floating with a chill style",
        Callback = function()
                            loadstring(game:HttpGet('https://rawscripts.net/raw/Just-a-baseplate.-Fe-Chill-14103'))()
        end
    })
    Tabs.Main:AddButton({
        Title = "fe sonic",
        Description = "make ur body animating as sonic",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/RZrtcvh4'))()
        end
    })

Tabs.Main:AddButton({
        Title = "fe pandora",
        Description = "convert from Im_patrick , date : Jun 1, 2022",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/xLNc0bhU'))()
        end
    })

Tabs.Main:AddButton({
        Title = "fe elio blasio",
        Description = "date : Oct 14, 2020",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/W5iuLxJC'))()
        endg
    })

	Tabs.Main:AddButton({
        Title = "fe maxilito slasher",
        Description = "slasher script converted by maxilito, date : Mar 3rd, 2023",
        Callback = function()
            loadstring(game:HttpGet('https://pastebin.com/raw/kP0uNBek'))()
        end
    })
    
    Tabs.Main:AddButton({
        Title = "fe clovr",
        Description = "turn ur body into vr can be without vr",
        Callback = function()
                            loadstring(game:HttpGet('https://rawscripts.net/raw/Just-a-baseplate.-Fe-Clovr-14102'))()
        end
    })
    

end
    
Window:SelectTab(1)
   
