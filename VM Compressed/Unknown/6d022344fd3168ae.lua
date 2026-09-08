-- // Game: A Universal time

-- docs : https://detourious.gitbook.io/project-finity/docs


-- // proximity prompt by sowd
local function fireproximityprompt(Obj, Amount, Skip)
    if Obj.ClassName == "ProximityPrompt" then 
        Amount = Amount or 1
        local PromptTime = Obj.HoldDuration
        if Skip then 
            Obj.HoldDuration = 0
        end
        for i = 1, Amount do 
            Obj:InputHoldBegin()
            if not Skip then 
                wait(Obj.HoldDuration)
            end
            Obj:InputHoldEnd()
        end
        Obj.HoldDuration = PromptTime
    else 
        error("userdata<ProximityPrompt> expected")
    end
end

getgenv().Config = {

    itemFarms = {
        "Meteor Farm",
        "Chest Farm",
        "Sand Debris Farm",
        "Item Farm"
    },

    plr = {
        Speed = 16,
        Jump = 50
    },

    farmMethod = "Meteor Farm",
    OnFarm = false,
    GodMode = false,
    bossOn = false,
    KeyBind = "Comma",
    click = false,
    e = false,
    r = false,
    t = false,
    y = false,
    f = false,
    g = false,
    h = false,
    j = false,
    b = false,

    desc = [[
        
    A Universal time autofarm
    **USE AT YOUR OWN RISK**]]
}


-- // variables
local lp = game:GetService("Players").LocalPlayer
local char = lp.Character or lp.CharacterAdded:Wait()
local hum = char:WaitForChild("Humanoid")
local root = char:WaitForChild("HumanoidRootPart")

-- // getting the char when ded
lp.CharacterAdded:Connect(function(Character)
    char = Character
    hum = Character:WaitForChild("Humanoid")
    root = Character:WaitForChild("HumanoidRootPart")
end)

local EnumKeys = {'Semicolon','Tab','Equals','Comma','Minus','Period','F1',"F2","F3","F4",'F5',"F6","F7",
    "F8","F9","F10","F11","F12",'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 'S', 'D', 'F', 'G', 'H',
    'J', 'K', 'L', 'Z', 'X', 'C', 'V', 'B', 'N', 'M','Slash','One','Two','Three',"Four","Five","Six","Seven","Eight",
    "Nine","Zero",'BackSlash','RightBracket','LeftBracket'}

-- // anti afk
for i,v in pairs(getconnections(lp.Idled)) do 
    v:Disable()
end

-- delete previous after re execute
if game:GetService("CoreGui"):FindFirstChild("FinityUI") then
    game.CoreGui.FinityUI:Destroy()
end

-- kick if not aut
if game.PlaceId ~= 6846458508 then
    lp:Kick("Game is not AUT")
end

local Finity = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/UI-Librarys/main/Finity%20UI%20Lib"))()
local FinityWindow = Finity.new(true, "A Universal Time", UDim2.new(0, 500, 0, 400))
FinityWindow.ChangeToggleKey(Enum.KeyCode[Config.KeyBind])

-- // Credits and stuff
local CreditsCategory = FinityWindow:Category("Credits and stuff")
local uiCreator = CreditsCategory:Sector("Ui Creator:")
local scriptCreator = CreditsCategory:Sector("Script Creator:")
local description = CreditsCategory:Sector("Description:")
uiCreator:Cheat("Label", "Detourious @ v3rmillion.net") 
scriptCreator:Cheat("Label", "KayD @ v3rmillion.net")
description:Cheat("Label", Config.desc)

-- // main
local autofarm = FinityWindow:Category("Autofarm")
local farms = autofarm:Sector("Farms")
local other = autofarm:Sector("Other")
-- // Dropdown to select method
farms:Cheat("Dropdown", "Select Farm Method", 
function(s)
    Config.farmMethod = s
end,
{
options = Config.itemFarms
})

-- // farm
farms:Cheat("Checkbox", "Farm Selected", 
function(v)
    Config.OnFarm = v

    while Config.OnFarm do
        if Config.farmMethod == "Meteor Farm" then
            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns.Meteors:GetDescendants()) do
                    if v.Name == "Meteor" then
                        root.CFrame = v.CFrame + Vector3.new(0,7,0)
                    end
                end
            end

                -- // collection
            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns.Meteors:GetDescendants()) do
                    if v:FindFirstChild("Interaction") then
                        fireproximityprompt(v.Interaction, 1, true)
                    end
                end
            end

                repeat task.wait() until Config.OnFarm

        -- // chest farm
        elseif Config.farmMethod == "Chest Farm" then
            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns.Chests:GetDescendants()) do
                    if v.Name == "RootPart" then
                        root.CFrame = v.CFrame + Vector3.new(0,7,0)
                    end
                end
            end

                -- // collection
            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns.Chests:GetDescendants()) do
                    if v:FindFirstChild("Interaction") then
                        fireproximityprompt(v.Interaction, 1, true)
                    end
                end
            end

                repeat task.wait() until Config.OnFarm

        elseif Config.farmMethod == "Sand Debris Farm" then
            
            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns["Sand Debris"]:GetDescendants()) do
                    if v.Name == "SandDebris" then
                        root.CFrame = v.CFrame + Vector3.new(0,0,5)
                    end
                end
            end

            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns["Sand Debris"]:GetDescendants()) do
                    if v:FindFirstChild("Interaction") then
                        fireproximityprompt(v.Interaction, 1, true)
                    end
                end
            end

                repeat task.wait() until Config.OnFarm
                
        elseif Config.farmMethod == "Item Farm" then
            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns.StandardItems:GetDescendants()) do
                    if v.Name == "SpawnLocation" then
                        if #v:GetChildren() > 0 then
                            root.CFrame = v:GetChildren()[1].CFrame
                        end
                    end
                end
            end
                    
            if char then
                for i,v in pairs(game:GetService("Workspace").ItemSpawns.StandardItems:GetDescendants()) do
                    if v:FindFirstChild("Interaction") then
                        fireproximityprompt(v.Interaction, 1, true)
                    end
                end
            end
                repeat task.wait() until Config.OnFarm
                
        end
    end
end)


-- // dio farm
other:Cheat("Checkbox", "Boa Farm", 
function(v)
    Config.bossOn = v
    local boat = game:GetService("Workspace").NPCS["Mysterious Boat"]

    root.CFrame = CFrame.new(10921.3223, 934.140991, 15258.9893, 0.681162894, 1.71684289e-09, -0.732131898, -2.48914702e-08, 1, -2.08136033e-08, 0.732131898, 3.24012923e-08, 0.681162894)

    while Config.bossOn do
        if char then
            if game:GetService("Workspace").Living["Boa H"] then
                root.CFrame = game:GetService("Workspace").Living["Boa H"].HumanoidRootPart.CFrame + Vector3.new(5, 0, 0)
            end
        end

        repeat task.wait() until Config.bossOn
    end
end)

other:Cheat("Label", "", "")

other:Cheat("Checkbox", "Auto Click", function(v)
    Config.click = v

    while Config.click do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("END-LMB")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key E", function(v)
    Config.e = v

    while Config.e do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("E")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key R", function(v)
    Config.r = v

    while Config.r do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("R")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key T", function(v)
    Config.t = v

    while Config.t do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("T")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key Y", function(v)
    Config.y = v

    while Config.y do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("Y")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key F", function(v)
    Config.f = v

    while Config.f do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("F")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key G", function(v)
    Config.g = v

    while Config.g do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("G")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key H", function(v)
    Config.h = v

    while Config.h do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("H")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key J", function(v)
    Config.j = v

    while Config.j do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("J")
        end
    end
end)

other:Cheat("Checkbox", "Auto Key B", function(v)
    Config.b = v

    while Config.b do
        if char then
            game:GetService("ReplicatedStorage").Remotes.InputFunc:InvokeServer("B")
        end
    end
end)

-- // god mode
other:Cheat("Checkbox", "God Mode", function(v)
    Config.GodMode = v

    while Config.GodMode do
        if char then
            if Config.GodMode then
                game:GetService("Players").LocalPlayer.Character.Values.Block:Destroy()
            end
        end
    end
end)

-- // Misc
local misc = FinityWindow:Category("Misc")
local SpeednJump = misc:Sector("Speed & Jump")


-- // Walk speed and Jump power changer
SpeednJump:Cheat("Slider", "Walk Speed", function(s)
    Config.plr.Speed = s
end, {min = 16, max = 250, suffix = " Walk Speed"})
SpeednJump:Cheat("Slider", "Jump Power", function(s)
    Config.plr.Jump = s
end, {min = 50, max = 250, suffix = " Jump Power"})
SpeednJump:Cheat("Checkbox", "Start Walk/jump power", function(s)
yes = s
    while yes do task.wait()
        if lp.Character then
            hum.WalkSpeed = Config.plr.Speed
            hum.JumpPower = Config.plr.Jump
        end   
    end
end)




-- // Settings
local Settings = FinityWindow:Category("Settings")
local ChangeToggleKey = Settings:Sector("Change Toggle")
ChangeToggleKey:Cheat("Dropdown", "Change Toggle Key", 
function(s)
    Config.KeyBind = s
    FinityWindow.ChangeToggleKey(Enum.KeyCode[Config.KeyBind])
end,
{
options = EnumKeys
})

-- // delete gui button
local deletegui = Settings:Sector("Deletegui")
deletegui:Cheat("Button", "Delete GUI", function()
    game.CoreGui.FinityUI:Destroy()
end)
