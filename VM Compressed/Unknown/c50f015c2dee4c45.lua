-- F3X Scripts Coming Soon

local Library = loadstring(game:HttpGet("https://pastebin.com/raw/vff1bQ9F"))()

local Window = Library.CreateLib("AdminHaxx V0.1", "Ocean")

local Main = Window:NewTab("Players")

local MainSection = Main:NewSection("Players")

local Main2 = Window:NewTab("Destruction")

local MainSection2 = Main2:NewSection("Destruction")

MainSection:NewButton("Kill All","", function()

local args = {

    [1] = ";kill all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("LoopKill All","", function()

local args = {

    [1] = ";loopkill all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Stick All","", function()

local args = {

    [1] = ";width all 0 ;depth all 0.09"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Freefall All","", function()

last_pick_sin_mrazy = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 10000, 0) 

wait(0.5)

local args = {

    [1] = ";bring all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Launch All","", function()

local args = {

    [1] = ";jumppower all 10000 ;jump all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Naked All","", function()

local args = {

    [1] = ";shirt all 0 ;pants all 0"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Explode All","", function()

local args = {

    [1] = ";explode all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Fat All","", function()

local args = {

    [1] = ";fat all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Ragdoll All","", function()

local args = {

    [1] = ";sit all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("1337 Shirt All","", function()

local args = {

    [1] = ";shirt all 19262627"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Flatten All","", function()

local args = {

    [1] = ";depth all 0"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)



MainSection:NewButton("BigHead All","", function()

local args = {

    [1] = ";headsize all 20"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Headless All","", function()

local args = {

    [1] = ";headsize all 0"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Fire All","", function()

local args = {

    [1] = ";fire all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Spike All","", function()

local args = {

    [1] = ";height all 0.01 ;width all 0.01 ;depth all 99"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("SuperSlow All","", function()

local args = {

    [1] = ";speed all 1"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("God All","", function()

local args = {

    [1] = ";god all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Fast All","", function()

local args = {

    [1] = ";speed all 200"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)




MainSection:NewButton("Spin All","", function()

local args = {

    [1] = ";spin all 1200"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Remove Body All","", function()

local args = {

    [1] = ";height all 0"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Invisible All","", function()

local args = {

    [1] = ";invisible all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)



MainSection:NewButton("Bald All","", function()

local args = {

    [1] = ";clearhats all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Heaven Prison All","", function()

last_pick_sin_mrazy = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, 500000, 0) 

local args = {

    [1] = ";bring all ;jail all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Small All","", function()

local args = {

    [1] = ";size all 0.5"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Giant All","", function()

local args = {

    [1] = ";size all 10"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Talk All 1","", function()

local args = {

    [1] = ";talk all AdminHaxx Has Infected This Game"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Talk All 2","", function()

local args = {

    [1] = ";talk all R E K T E D"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Disable All","", function()

local args = {

    [1] = ";speed all 0 ;jumppower all 0 ;sit all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)



MainSection:NewButton("Freeze All","", function()

local args = {

    [1] = ";freeze all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Title All","", function()

local args = {

    [1] = ";titleb all AdminHaxx!!!!"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Shirtless All","", function()

local args = {

    [1] = ";shirt all 0"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)



MainSection:NewButton("Pantsless All","", function()

local args = {

    [1] = ";pants all 0"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Gear All 1","", function()

local args = {

    [1] = ";gear all 11999247"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Gear All 2","", function()

local args = {

    [1] = ";gear all 77443461"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("Punish All","", function()

local args = {

    [1] = ";punish all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)


MainSection:NewButton("R6 All","", function()

local args = {

    [1] = ";r6 all"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)

MainSection:NewButton("Green All","", function()

local args = {

    [1] = ";shirt all 0 ;pants all 0"

}

 

game:GetService("ReplicatedStorage").HDAdminClient.Signals.RequestCommand:InvokeServer(unpack(args))
end)




