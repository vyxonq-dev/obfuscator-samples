local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Kaplumbag Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab1 = Window:MakeTab({
    Name = "Tab 1",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section1 = Tab1:AddSection({
    Name = "Section"
})
Tab1:AddTextbox({
	Name = "Teleport",
	Default = "Broken",
	TextDisappear = true,
	Callback = function(targetuser)
		local plr = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    plr = game:GetService("Players"):
WaitforChild(targetuser).Character.HumanoidRootPart.CFrame
	end	  
})

Tab1:AddButton({
    Name = "Mobile keyboard cracked by Ata",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Xxtan31/Ata/main/deltakeyboardcrack.txt"))()
end
}) 

Tab1:AddButton({
    Name = "Fly Gui v3",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-FLY-GUI-V3-18636"))()
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Fly Gui v3 is successfully executed",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end    
})

local Tab2 = Window:MakeTab({
    Name = "Military life",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section2 = Tab2:AddSection({
    Name = "Section"
})

Tab2:AddButton({
    Name = "Give XP",
    Callback = function()
        game:GetService("Players").LocalPlayer.PlayerGui.HelpInfo.ShopFrame.SeasonPass.ClaimReward:FireServer(unpack({"rbxassetid://16455735450", "XP", 3}))
    end    
})

local Tab3 = Window:MakeTab({
    Name = "Aura craft",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section3 = Tab3:AddSection({
    Name = "Section"
})

Tab3:AddButton({
    Name = "Give coins",
    Callback = function()
        while wait(0.1) do
            local args = {
                [1] = 199
            }
            game:GetService("ReplicatedStorage").Remotes.Duplicate:FireServer(unpack(args))
        end  
    end
})

local Tab4 = Window:MakeTab({
    Name = "Army simulator",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section4 = Tab4:AddSection({
    Name = "Section"
})

Tab4:AddButton({
    Name = "Name yourself ADMIN",
    Callback = function()
        local args = { [1] = "ADMIN" }
        game:GetService("ReplicatedStorage").namer:FireServer(unpack(args)) 
    end
})

Tab4:AddButton({
    Name = "Give XP",
    Callback = function()
        local args = { [1] = math.huge }
        game:GetService("ReplicatedStorage").addXP:FireServer(unpack(args)) 
    end
})

local Tab5 = Window:MakeTab({
    Name = "Troll people obby",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section5 = Tab5:AddSection({
    Name = "Section"
})

Tab5:AddButton({
    Name = "Get 1k each click",
    Callback = function()
        game:GetService("ReplicatedStorage").GR:FireServer() 
    end
})

local Tab6 = Window:MakeTab({
    Name = "Prison Life",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section6 = Tab6:AddSection({
    Name = "PrizzLife"
})
Tab6:AddButton({
    Name = "Prizzlife script",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
        OrionLib:MakeNotification({
            Name = "Successful",
            Content = "Prizzlife script successfully executed",
            Image = "rbxassetid://4483345998",
            Time = 5
        })
    end
})

local Tab7 = Window:MakeTab({
    Name = "Da hood aim lock",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section7 = Tab7:AddSection({
    Name = "Aim lock"
})
Tab7:AddButton({
    Name = "Da Hood Aim lock",
    Callback = function()
       loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/2c49f13d52789471d283583f05ee91df.lua"))()
    end
})

OrionLib:Init()