local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hosvile/Refinement/main/InfinitiveUI",true))()

--Lib:CreateWindow(name,DefTab,WinSize,function)
local Win = Lib:CreateWindow("UTBB GUI",30,nil,nil)
local Tab,name = Win:CreateTab("UTBB GUI For Jake",function() end)

Tab:CreateButton("Kill Enemy1" ,function()
game.Workspace.Game.Mobs.Dummy.Enemy.Health = 0
end)

Tab:CreateButton("Kill Enemy2" ,function()
game.Workspace.Game.Mobs.Dummy2.Enemy.Health = 0
end)

Tab:CreateButton("Kill Enemy3" ,function()
game.Workspace.Game.Mobs.Dummy3.Enemy.Health = 0
end)
