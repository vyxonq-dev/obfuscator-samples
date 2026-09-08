local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Bloxford DarkRP (Beta) GUI", HidePremium = false, SaveConfig = false, ConfigFolder = "Bloxford DarkRP GUI"})

OrionLib:MakeNotification({
	Name = "Credits:",
	Content = "Shag420#6729",
	Image = "rbxassetid://0",
	Time = 10
})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddButton({
	Name = "Steal All Printers : Stand on them to claim : Possible kick",
	Callback = function()
        for i,v in next, game:GetService("Workspace").Entities:GetDescendants() do
            if v:IsA("Part") and v.Name == 'Main' then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
            end
    end    
})

Tab:AddButton({
	Name = "Steal Nearest Car : Stand next to the car",
	Callback = function()
        for i,v in next, game.Workspace.Cars:GetDescendants() do
            if v:IsA("VehicleSeat") then
            if v:FindFirstChild("SeatWeld") then
            print("Car is taken")
            else
            if game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Position) <= 20 then
            v:Sit(game.Players.LocalPlayer.Character.Humanoid)
            end
            end
            end
            end
    end    
})

Tab:AddButton({
	Name = "Bring Grape Vines",
	Callback = function()
        for i,v in next, game:GetService("Workspace"):GetDescendants() do
            if v:IsA("MeshPart") and v.Name == 'BlueBerryPlantMesh' then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
            end
    end    
})

Tab:AddButton({
	Name = "Sell Grapes : $219 Each",
	Callback = function()
        local args = {
            [1] = "Grapes"
        }
        
        game:GetService("ReplicatedStorage").Events.Trader2:FireServer(unpack(args))        
    end    
})

Tab:AddButton({
	Name = "Bring Tomato Plants",
	Callback = function()
        for i,v in next, game:GetService("Workspace"):GetDescendants() do
            if v:IsA("MeshPart") and v.Name == 'TomatoPlantMesh' then
            v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
            end
    end    
})

Tab:AddButton({
	Name = "Sell Tomatos : $119 Each",
	Callback = function()
        local args = {
            [1] = "Tomato"
        }
        
        game:GetService("ReplicatedStorage").Events.Trader2:FireServer(unpack(args))        
    end    
})

local Tab = Window:MakeTab({
	Name = "Shop",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddButton({
	Name = "Storage Box : $50",
	Callback = function()
        local args = {
            [1] = "Storage Box"
        }
        
        game:GetService("ReplicatedStorage").Events.Shop:FireServer(unpack(args))          
    end    
})

Tab:AddButton({
	Name = "Pistol Ammo : $40",
	Callback = function()
        local args = {
            [1] = "Pistol"
        }
        
        game:GetService("ReplicatedStorage").Events.Shop:FireServer(unpack(args))                 
    end    
})

Tab:AddButton({
	Name = "Rifle Ammo : $60",
	Callback = function()
        local args = {
            [1] = "Rifle"
        }
        
        game:GetService("ReplicatedStorage").Events.Shop:FireServer(unpack(args))                 
    end    
})

Tab:AddButton({
	Name = "Rocket : $2500",
	Callback = function()
        local args = {
            [1] = "Rocket"
        }
        
        game:GetService("ReplicatedStorage").Events.Shop:FireServer(unpack(args))
                    
    end    
})

Tab:AddButton({
	Name = "Money Printer : $1000",
	Callback = function()
        local args = {
            [1] = "Money Printer"
        }
        
        game:GetService("ReplicatedStorage").Events.Shop:FireServer(unpack(args))        
    end    
})

Tab:AddButton({
	Name = "Upgraded Money Printer : $5000",
	Callback = function()
        local args = {
            [1] = "Upgraded Money Printer"
        }
        
        game:GetService("ReplicatedStorage").Events.Shop:FireServer(unpack(args))              
    end    
})

Tab:AddButton({
	Name = "OP Money Printer : $10000",
	Callback = function()
        local args = {
            [1] = "OP Money Printer"
        }
        
        game:GetService("ReplicatedStorage").Events.Shop:FireServer(unpack(args))                      
    end    
})

local Tab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
Tab:AddParagraph("Made By:","Shag420#6729")

Tab:AddTextbox({
	Name = "Change Username",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local args = {
            [1] = Value,
            [2] = "0x[3[1{v;w/"
        }
        
        game:GetService("ReplicatedStorage").Events.RpName1:FireServer(unpack(args))        
	end	  
})

Tab:AddTextbox({
	Name = "Drop Cash : Atleast $100",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local args = {
            [1] = Value
        }
        
        game:GetService("ReplicatedStorage").Events.DropCash:FireServer(unpack(args))               
	end	  
})