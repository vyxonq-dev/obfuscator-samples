print("█▀█ █░█ █░░ █ █▀▀ █░█ ▀█")
print("█▀▄ █▄█ █▄▄ █ █▄▄ ▀▄▀ █▄")
print("▀  ▀")

warn("a")

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Key Test", HidePremium = false, SaveConfig = true, ConfigFolder = "Key Test"})

local Tab0 = Window:MakeTab({
	Name = "Key",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "Loading Script",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})



Tab0:AddButton({
    Name = 'Getkey',
    Callback = function()
        setclipboard("ABC")
        OrionLib:MakeNotification({
	Name = "Key:",
	Content = "ABC",
	Image = "rbxassetid://4483345998",
	Time = 5
})
    end
})



OrionLib:MakeNotification({
	Name = "Loaded Script",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})


Tab0:AddTextbox({
	Name = "Key",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
        print (Value)
        if Value == "ABC" then
            
            warn ('frr')
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Rulic Hub 1.1", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Universal Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
OrionLib:MakeNotification({
	Name = "Loading Script",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})





Tab:AddButton({
    Name = 'Universal Tool giver(WIP)',
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/yofriendfromschool1/Sky-Hub-Backup/main/gametoolgiver.lua"))()
    end
})
Tab:AddButton({
    Name = 'Delete Mob Cheat Engine(Aimbot)',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Mick-gordon/Hyper-Escape/main/DeleteMobCheatEngine.lua'))()
    end
})
Tab:AddButton({
    Name = 'inf yield',
    Callback = function()
        warn('loading')
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
warn ("my name is tanako1234567")
    end
})

Tab:AddButton({
    Name = "Dex V5",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/dyyll/Dex-V5-leak/refs/heads/main/Dex%20V5.lua'))()
    end
})


local Tab2 = Window:MakeTab({
	Name = "Others Script Hub",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab2:AddButton({
	Name = "Script Hub V3",
	Callback = function()
        warn ('lmao')
        loadstring(game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3", true))()
        warn ('done')
    end
})

Tab2:AddButton({
    Name = "Solara Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/samuraa1/Solara-Hub/refs/heads/main/Solara%20Hub.lua"))()
    end
})

Tab:AddTextbox({
	Name = "Hitbox (not work on any game)",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
            
            _G.HeadSizeTest = Value
            local HeadSize = Value
local IsDisabled = true
local IsTeamCheckEnabled = false 

game:GetService('RunService').RenderStepped:Connect(function()
    if IsDisabled then
        local localPlayer = game:GetService('Players').LocalPlayer -- others
        if not localPlayer then return end
        
        local localPlayerTeam = localPlayer.Team
        
        for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
            if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Size = Vector3.new(HeadSize, HeadSize, HeadSize)
                    humanoidRootPart.Transparency = 0.9
                    humanoidRootPart.BrickColor = BrickColor.new("Really white")
                    humanoidRootPart.Material = Enum.Material.Neon
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)

    end
})


Tab:AddButton({
    Name = 'hitbox default',
    Callback = function()
        _G.HeadSizeTest = 3
        local HeadSize = 3
local IsDisabled = true
local IsTeamCheckEnabled = false 

game:GetService('RunService').RenderStepped:Connect(function()
    if IsDisabled then
        local localPlayer = game:GetService('Players').LocalPlayer -- others
        if not localPlayer then return end
        
        local localPlayerTeam = localPlayer.Team
        
        for _, player in ipairs(game:GetService('Players'):GetPlayers()) do
            if player ~= localPlayer and (not IsTeamCheckEnabled or player.Team ~= localPlayerTeam) then
                local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    humanoidRootPart.Size = Vector3.new(HeadSize, HeadSize, HeadSize)
                    humanoidRootPart.Transparency = 0.9
                    humanoidRootPart.BrickColor = BrickColor.new("Really white")
                    humanoidRootPart.Material = Enum.Material.Neon
                    humanoidRootPart.CanCollide = false
                end
            end
        end
    end
end)
    end
})





local Tab4 = Window:MakeTab({
	Name = "Elemental Powers Tycoon",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab4:AddButton({
    Name = 'Ouxi (All Executor)',
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/iiprixe/Ouxi/main/Elemental%20Powers%20Tycoon%20%5Bv1%5D"))()
    end
})





local Tab5 = Window:MakeTab({
	Name = "Fling Things And People",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab5:AddButton({
    Name = 'Killa Hub V1.1(WIP)',
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/BadnanaX/KillaHubV1.1/refs/heads/main/Script'))()
    end
})

Tab5:AddButton({
    Name = "SigmaHub",
    Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Fling-Things-and-People-ppl-20407"))()
    end
})

Tab5:AddButton({
    Name = "Versel Hub(OP)",
    Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/VerbalHubz/Verbal-Hub/main/Verbalhub.lua",true))()
            Player:SetAttribute("MouseLockEnabled", true)
    end
})


local Tab6 = Window:MakeTab({
	Name = "The Strongest Battleground",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab6:AddButton({
    Name = 'KadeHub',
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/The-Strongest-Battlegrounds-KadeHub-16735"))()
    end
})

Tab6:AddButton({
    Name = 'Volta(sonic) !Lag Warning!',
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/VOLTA.lua"))()
    end
})

Tab6:AddButton({
    Name = "Toji + 2",
    Callback = function()
        loadstring(game:HttpGet"https://raw.githubusercontent.com/Wi-sp/Limitless-legacy/refs/heads/main/GUI")()
    end
})

Tab6:AddButton({
    Name = "Arcaura(Garou)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/ARCAURA.lua"))()
    end
})

Tab6:AddButton({
    Name = "Floating Girl(Atomic)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Reapvitalized/TSB/refs/heads/main/FLOATING_GIRL.lua"))()
    end
})



local Tab7 = Window:MakeTab({
	Name = "Arsenal",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab7:AddButton({
    Name = 'QuotasHub (OP)',
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Insertl/QuotasHub/main/BETAv1.3"))()
    end
})

local Tab8 = Window:MakeTab({
	Name = "Destruction Sim",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab8:AddButton({
    Name = 'inf money',
    Callback = function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Destruction-Simulator-INF-MONEY-20330"))()
    end
})

local Tab9 = Window:MakeTab({
	Name = "Meme Sea",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})



OrionLib:MakeNotification({
	Name = "Loaded Script",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Tab10 = Window:MakeTab({
    Name = "Fortline",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab10:AddButton({
    Name = "Zen Hub (OP)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ZenHub103/Zen-Hub-/refs/heads/main/Fortline"))()
    end
})

Tab10:AddButton({
    Name = "ExploitFin (OP)",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/ExploiterGuy/4d95c83a854d6e7265a43094219d0b00/raw/8bc8d511803b2e5b2a1b6abe70c6e1c994601323/%255B%25F0%259F%2594%25AB%255D%2520Fortline"))()
    end
})

local Tab11 = Window:MakeTab({
	Name = "Admin RNG",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab11:AddButton({
    Name = "BaconScripter",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/thanhdat4461/Script/main/Admin%20RNG", true))()
    end
})


local Tab12 = Window:MakeTab({
	Name = "Grab Money Simulator",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab12:AddButton({
    Name = "ExploitFin",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploiterGuy/Aqua-Hub/refs/heads/main/Money%20Grab%20Simulator.txt"))()
    end
})

local Tab13 = Window:MakeTab({
	Name = "Pizzeria Tycoon Simulator",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab13:AddButton({
    Name = "Pizzeria Tycoon Simulator (OP)",
    Callback = function()
        loadstring(game:HttpGet("https://gist.githubusercontent.com/ServerSad/2b30ad46be33d8f3ce77b2f6be30eb57/raw/ab08566de086ee4849aa6750c1d005ac05829e3d/Inf%2520money%2520gui"))()
    end
})

local Tab14 = Window:MakeTab({
	Name = "Gun Ball",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab14:AddButton({
    Name = "Rocket Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Neverwinlol/Gunball/main/AutoSpamlol"))()
    end
})

local TabT = Window:MakeTab({
	Name = "Testing Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


TabT:AddButton({
    Name = "Mortem Metallum",
    Callback = function()     
            
local url = "https://raw.githubusercontent.com/jehheb12u11aaaaz/1z1rewgy4wer-tgerjfuwqehuofhweuifhegryhr4tyhr/main/mmtfwerhfugbr3gfbfbi3refgiergfberigfer"
local scriptcontent = game:HttpGet(url)

local scriptload = loadstring(scriptcontent)
scriptload()
    end
})

TabT:AddButton({
    Name = "Universal",
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.app/Oic24KzG/raw'),true))()
    end
})

TabT:AddButton({
    Name = "chaos",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/xWziD7Sp/raw"))()
    end
})

TabT:AddButton({
    Name = "chaos2",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/Dan41/Scripts/main/%5BCHAOS%5D%20CHAOTIC%20HUB.lua'),true))()
    end
})

TabT:AddButton({
    Callback = function()
        

loadstring(game:HttpGet(('https://raw.githubusercontent.com/uedan228/Happy-Hub/main/CHAOS'), true))()
    end
})

print(Value)
        end
    end
})
warn("abc")






print("█▀█ █░█ █░░ █ █▀▀ █░█ ▀█")
print("█▀▄ █▄█ █▄▄ █ █▄▄ ▀▄▀ █▄")
print("▀  ▀")
