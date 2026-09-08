function DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc(code)res=''for i in ipairs(code)do res=res..string.char(code[i]/7000)end return res end 


local Players = game:GetService(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({560000,756000,679000,847000,707000,798000,805000}))
local Workspace = game:GetService(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({609000,777000,798000,749000,805000,784000,679000,693000,707000}))
local ReplicatedStorage = game:GetService(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({574000,707000,784000,756000,735000,693000,679000,812000,707000,700000,581000,812000,777000,798000,679000,721000,707000}))
local LP = Players.LocalPlayer

local AutoCollectMoney = false
local AutoBuild = false
local AutoRebirth = false
local RemoveAllDoorLaser = false
local AntiAFK = false
local InfJump = false
local selectedGear = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({})

local function getHRP()
    local char = LP.Character or LP.CharacterAdded:Wait()
    return char:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({504000,819000,763000,679000,770000,777000,735000,700000,574000,777000,777000,812000,560000,679000,798000,812000}))
end

local ReGui = loadstring(game:HttpGet(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({728000,812000,812000,784000,805000,406000,329000,329000,798000,679000,833000,322000,721000,735000,812000,728000,819000,686000,819000,805000,707000,798000,693000,777000,770000,812000,707000,770000,812000,322000,693000,777000,763000,329000,700000,707000,784000,812000,728000,805000,777000,329000,476000,707000,679000,798000,315000,574000,707000,497000,819000,735000,329000,763000,679000,735000,770000,329000,574000,707000,497000,819000,735000,322000,756000,819000,679000})))()
local UI = ReGui:TabsWindow({Title = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({497000,798000,777000,833000,224000,560000,777000,812000,679000,812000,777000,707000,805000,224000,588000,847000,693000,777000,777000,770000,224000,868000,224000,539000,679000,700000,707000,224000,686000,847000,224000,539000,742000,693000,777000,770000,812000,707000,721000,679000,854000,840000,693000}), Size = UDim2.fromOffset(300, 280)})

local TabMain = UI:CreateTab({Name = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({539000,679000,735000,770000})})
local TabGear = UI:CreateTab({Name = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({497000,707000,679000,798000})})
local TabMovement = UI:CreateTab({Name = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({539000,777000,826000,707000,763000,707000,770000,812000})})

local Main = TabMain:CollapsingHeader({Title = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({490000,707000,679000,812000,819000,798000,707000,805000})})
Main:Checkbox({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({455000,819000,812000,777000,224000,469000,777000,756000,756000,707000,693000,812000,224000,539000,777000,770000,707000,847000}),
    Value = false,
    Callback = function(_, v)
        AutoCollectMoney = v
    end
})
Main:Checkbox({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({455000,819000,812000,777000,224000,462000,819000,735000,756000,700000,224000,588000,847000,693000,777000,777000,770000}),
    Value = false,
    Callback = function(_, v)
        AutoBuild = v
    end
})
Main:Checkbox({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({455000,819000,812000,777000,224000,574000,707000,686000,735000,798000,812000,728000}),
    Value = false,
    Callback = function(_, v)
        AutoRebirth = v
    end
})
Main:Checkbox({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({574000,707000,763000,777000,826000,707000,224000,455000,756000,756000,224000,476000,777000,777000,798000,224000,532000,679000,805000,707000,798000}),
    Value = false,
    Callback = function(_, v)
        RemoveAllDoorLaser = v
    end
})

local Gear = TabGear:CollapsingHeader({Title = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({497000,707000,679000,798000,224000,553000,784000,812000,735000,777000,770000,805000})})
local gears = {}
for _, gear in pairs(ReplicatedStorage.Gears:GetChildren()) do
    table.insert(gears, gear.Name)
end
Gear:Combo({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({581000,707000,756000,707000,693000,812000,224000,497000,707000,679000,798000}),
    Selected = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({}),
    Items = gears,
    Callback = function(_, v)
        selectedGear = v
    end
})
Gear:Button({
    Text = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({497000,735000,826000,707000,224000,581000,707000,756000,707000,693000,812000,707000,700000,224000,497000,707000,679000,798000}),
    Callback = function()
        if selectedGear and ReplicatedStorage.Gears:FindFirstChild(selectedGear) then
            local gear = ReplicatedStorage.Gears[selectedGear]:Clone()
            gear.Parent = LP.Backpack
            game.StarterGui:SetCore(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({581000,707000,770000,700000,546000,777000,812000,735000,714000,735000,693000,679000,812000,735000,777000,770000}), {
                Title = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({497000,707000,679000,798000,224000,497000,735000,826000,707000,770000}),
                Text = selectedGear .. DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({224000,679000,700000,700000,707000,700000,224000,812000,777000,224000,847000,777000,819000,798000,224000,735000,770000,826000,707000,770000,812000,777000,798000,847000,231000}),
                Duration = 3
            })
        end
    end
})
Gear:Button({
    Text = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({455000,819000,812000,777000,224000,497000,735000,826000,707000,224000,490000,756000,847000,735000,770000,721000,224000,469000,756000,777000,819000,700000}),
    Callback = function()
        local gear = ReplicatedStorage.Gears[DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({490000,756000,847000,735000,770000,721000,224000,469000,756000,777000,819000,700000})]:Clone()
        gear.Parent = LP.Backpack
        game.StarterGui:SetCore(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({581000,707000,770000,700000,546000,777000,812000,735000,714000,735000,693000,679000,812000,735000,777000,770000}), {
            Title = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({497000,707000,679000,798000,224000,497000,735000,826000,707000,770000}),
            Text = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({490000,756000,847000,735000,770000,721000,224000,469000,756000,777000,819000,700000,224000,679000,700000,700000,707000,700000,224000,812000,777000,224000,847000,777000,819000,798000,224000,735000,770000,826000,707000,770000,812000,777000,798000,847000,231000}),
            Duration = 3
        })
    end
})

local Movement = TabMovement:CollapsingHeader({Title = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({539000,777000,826000,707000,763000,707000,770000,812000})})
Movement:SliderFloat({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({609000,679000,756000,749000,581000,784000,707000,707000,700000}),
    Minimum = 16,
    Maximum = 200,
    Value = 16,
    Callback = function(_, v)
        local char = LP.Character
        if char and char:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({504000,819000,763000,679000,770000,777000,735000,700000})) then
            char.Humanoid.WalkSpeed = v
        end
    end
})
Movement:Checkbox({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({511000,770000,714000,735000,770000,735000,812000,707000,224000,518000,819000,763000,784000}),
    Value = false,
    Callback = function(_, v)
        InfJump = v
    end
})
Movement:Checkbox({
    Label = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({455000,770000,812000,735000,224000,455000,490000,525000}),
    Value = false,
    Callback = function(_, v)
        AntiAFK = v
    end
})

task.spawn(function()
    while task.wait(1) do
        local hrp = getHRP()
        if not hrp then continue end
        local original = hrp.CFrame

        for _, plot in ipairs(Workspace.Plots:GetChildren()) do
            if RemoveAllDoorLaser then
                local lasers = plot:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({462000,819000,735000,756000,700000,805000})) and plot.Builds:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({553000,833000,770000,707000,798000,553000,770000,756000,847000,476000,777000,777000,798000})) and plot.Builds.OwnerOnlyDoor:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({532000,679000,805000,707000,798000,805000}))
                if lasers then
                    lasers:Destroy()
                end
            end

            if AutoCollectMoney then
                local collector = plot:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({539000,777000,770000,707000,847000,469000,777000,756000,756000,707000,693000,812000,777000,798000}))
                if collector then
                    local part = collector:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({469000,777000,756000,756000,707000,693000,812000,560000,679000,798000,812000}))
                    if part and part:IsA(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({462000,679000,805000,707000,560000,679000,798000,812000})) then
                        pcall(function()
                            hrp.CFrame = part.CFrame + Vector3.new(0, 2, 0)
                            task.wait(0.05)
                            hrp.CFrame = original
                        end)
                    end
                end
            end

            if AutoBuild then
                local buttons = plot:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({462000,819000,847000,462000,819000,812000,812000,777000,770000,805000}))
                local cash = LP:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({756000,707000,679000,700000,707000,798000,805000,812000,679000,812000,805000})) and LP.leaderstats:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({469000,679000,805000,728000}))
                local myCash = cash and cash.Value or 0

                if buttons and myCash > 0 then
                    for _, buy in pairs(buttons:GetChildren()) do
                        local button = buy:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({462000,819000,812000,812000,777000,770000}))
                        local price = buy:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({560000,798000,735000,693000,707000}))
                        local pass = buy:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({560000,679000,805000,805000,511000,700000}))

                        if button and button:IsA(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({462000,679000,805000,707000,560000,679000,798000,812000})) and price and price:IsA(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({546000,819000,763000,686000,707000,798000,602000,679000,756000,819000,707000})) and not pass then
                            if myCash >= price.Value then
                                pcall(function()
                                    hrp.CFrame = button.CFrame + Vector3.new(0, 2, 0)
                                    task.wait(0.05)
                                    hrp.CFrame = original
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(5) do
        if AutoRebirth then
            pcall(function()
                ReplicatedStorage.Remotes.RebirthRequest:InvokeServer()
            end)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if AntiAFK and hrp then
            hrp.CFrame = hrp.CFrame + Vector3.new(0, 0, 0.1)
        end
    end
end)

local u = game:GetService(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({595000,805000,707000,798000,511000,770000,784000,819000,812000,581000,707000,798000,826000,735000,693000,707000}))
u.JumpRequest:Connect(function()
    if InfJump and LP.Character and LP.Character:FindFirstChild(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({504000,819000,763000,679000,770000,777000,735000,700000})) then
        LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

game.StarterGui:SetCore(DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({581000,707000,770000,700000,546000,777000,812000,735000,714000,735000,693000,679000,812000,735000,777000,770000}), {
    Title = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({497000,798000,777000,833000,224000,560000,777000,812000,679000,812000,777000,707000,805000,224000,588000,847000,693000,777000,777000,770000,224000,868000,224000,539000,679000,700000,707000,224000,686000,847000,224000,539000,742000,693000,777000,770000,812000,707000,721000,679000,854000,840000,693000}),
    Text = DJokGAYIFkRhiRyIGJHOsvRjkwxlIbrMkVjjwAEStqRSvSVxpGCFtIyQxiWYIc({581000,693000,798000,735000,784000,812000,224000,532000,777000,679000,700000,707000,700000,231000}),
    Duration = 5
})    