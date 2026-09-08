local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Neverlose | Gun Ball Best", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Best"
})

OrionLib:MakeNotification({
	Name = "Welcome Player!",
	Content = "Thanks for use my Script",
	Image = "rbxassetid://4483345998",
	Time = 5
})

Tab:AddParagraph("Auto Shoot","Yeah you can Use")

Tab:AddToggle({
	Name = "Auto Shoot!",
	Default = false,
	Callback = function(Value)
		getgenv().auto_block = Value
        local function auto()
            while true do
                if auto_block then
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer({
                        ["name"] = "defense",
                        ["origin"] = "balltargets"
                    },{})
                else break
                end
                wait()
            end
        end
        auto()
	end    
})

Tab:AddToggle({
	Name = "Auto Spam Shoot!",
	Default = false,
	Callback = function(Value)
getgenv().auto_spam = Value
        local function auto()
            while true do
                if auto_spamshooot then
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer({
                        ["name"] = "defense",
                        ["origin"] = "balltargets"
                    },{})
                else break
                end
                wait()
            end
        end
        auto()
	end    
})

Tab:AddParagraph("Inf","inf Gem Need All Quest")

Tab:AddToggle({
	Name = "INF GEM!",
	Default = false,
	Callback = function(Value)
		getgenv().inf_gems = Value
        local function auto()
            while true do
                if inf_gems then
                    local ohTable1 = {
                        ["name"] = "redeem",
                        ["origin"] = "quests"
                    }
                    local ohTable2 = {
                        [1] = getgenv().quest
                    }

                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1, ohTable2)
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1, ohTable2)
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1, ohTable2)
                else break
                end
                wait()
            end
        end
        auto()
	end    
})
