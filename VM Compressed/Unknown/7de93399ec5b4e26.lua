--Anti Crash Solara Script : loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Rulic-Hub-21620"))()

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
local Window = OrionLib:MakeWindow({Name = "Rulic Hub 1.0", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

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


Tab:AddTextbox({
	Name = "Hitbox (not work on any game)",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
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
--[[
Tab9:AddButton({
    Name = "error",
    Callback = function()
            loadstring(game:HttpGet(('https://raw.githubusercontent.com/FrostLua/Krakles/main/ElgatoHub/Loader.lua'),true))()
wait(0.1)
if not fireproximityprompt then
    getgenv().fireproximityprompt=function(pp)
        local oldenabled=pp.Enabled
        local oldhold=pp.HoldDuration
        local oldrlos=pp.RequiresLineOfSight
        local oldMaxActivationDistance=pp.MaxActivationDistance
        local oldCameraCFrame = workspace.CurrentCamera.CFrame
        pp.MaxActivationDistance=math.huge
        pp.Enabled=true
        pp.HoldDuration=0
        pp.RequiresLineOfSight=false
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, pp.Parent.Position)
        wait()
        pp:InputHoldBegin()
        task.wait()
        pp:InputHoldEnd()
        task.wait()
        pp.Enabled=pp.Enabled
        pp.HoldDuration=pp.HoldDuration
        pp.RequiresLineOfSight=pp.RequiresLineOfSight
        pp.MaxActivationDistance=oldMaxActivationDistance
        workspace.CurrentCamera.CFrame=oldCameraCFrame
    end
end
wait(0.1)


    end
})
]]


OrionLib:MakeNotification({
	Name = "Loaded Script",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})


warn ('loaded!')

--[[
    Tab:AddButton({
    Name = 'Name',
    Callback = function()
        --Script:

    end
})

local Tab = Window:MakeTab({
	Name = "name",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

]]

local Tab10 = Window:MakeTab({
	Name = "Testing Script",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})


Tab10:AddButton({
    Name = "Mortem Metallum",
    Callback = function()     
            
local url = "https://raw.githubusercontent.com/jehheb12u11aaaaz/1z1rewgy4wer-tgerjfuwqehuofhweuifhegryhr4tyhr/main/mmtfwerhfugbr3gfbfbi3refgiergfberigfer"
local scriptcontent = game:HttpGet(url)

local scriptload = loadstring(scriptcontent)
scriptload()
    end
})

Tab10:AddButton({
    Name = "Universal",
    Callback = function()
        loadstring(game:HttpGet(('https://pastefy.app/Oic24KzG/raw'),true))()
    end
})

Tab10:AddButton({
    Name = "chaos",
    Callback = function()
        loadstring(game:HttpGet("https://pastefy.app/xWziD7Sp/raw"))()
    end
})

Tab10:AddButton({
    Name = "chaos2",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/Dan41/Scripts/main/%5BCHAOS%5D%20CHAOTIC%20HUB.lua'),true))()
    end
})

Tab10:AddButton({
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/uedan228/Happy-Hub/main/CHAOS'), true))()
    end
})

print(Value)
        end
    end
})
warn("abc")