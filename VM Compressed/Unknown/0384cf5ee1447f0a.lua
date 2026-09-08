local ArgetnarLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArgetnarYT/Library/main/ArgetnarLibrary.lua"))()
local win = ArgetnarLib:Window("Argetnar Hub")
ArgetnarLib:Notify("Script", "Loading....")
local TabFarm = win:Tab("Autofarm")

TabFarm:Toggle("AutoFarm Wool", function(AutoFarm)
            _G.autowool = AutoFarm
while _G.autowool == true do
    game:GetService("ReplicatedStorage").Signals.RemoteEvents.GetWoolRemote:FireServer(17)
    wait()
    end
end)
TabFarm:Toggle("Auto Obby", function(AutoObby)
    local Player = game:GetService("Players").LocalPlayer.Name
        _G.doublemoney = AutoObby
        while _G.doublemoney == true do
        game:GetService("Workspace")[(Player)].HumanoidRootPart.CFrame = CFrame.new(-935.611084, 186.181, 837.546143, 0, 0, 1, 0, 1, -0, -1, 0, 0)
        wait()
        end
end)
TabFarm:Button("AutoSell Wool", function()
          		while wait() do
   game:GetService("ReplicatedStorage").Signals.RemoteEvents.PutRemote:FireServer()
end
end)
TabFarm:Button("Auto Code", function()
local A_1 = "SheepTycoon"
local Event = game:GetService("Players").MinyWonk.PlayerGui.ScreenGui.Code.CodeRemote
Event:FireServer(A_1)
end)

local TabMisc = win:Tab("Misc")

TabMisc:TextBox("Chat Writer", function(Value)
local A_1 = Value
local A_2 = "All"
local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
Event:FireServer(A_1, A_2)
end)
TabMisc:Slider("Walk Speed", 16, 500, 50, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)

TabMisc:Button("Destroy GUI", function()
    if game.CoreGui:FindFirstChild("MangoHub") then
    game.CoreGui.MangoHub:Destroy();
end
end)
TabMisc:Button("Rejoin", function()
local ts = game:GetService("TeleportService")

local p = game:GetService("Players").LocalPlayer

ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
end)

local TabTp = win:Tab("Teleports")
TabTp:Button("Tp End 1 Obby", function()
     local Player = game:GetService("Players").LocalPlayer.Name
	
game:GetService("Workspace")[(Player)].HumanoidRootPart.CFrame = CFrame.new(-910.353577, 181.059067, 837.684326, 0.0206528772, 5.01800947e-08, 0.999786735, -2.26483987e-08, 1, -4.97229458e-08, -0.999786735, -2.16166463e-08, 0.0206528772)

end)
TabTp:Button("Tp End 2 Obby", function()
     local Player = game:GetService("Players").LocalPlayer.Name
	
game:GetService("Workspace")[(Player)].HumanoidRootPart.CFrame = CFrame.new(619.623352, 123.516922, 754.34259, 0.961078823, 1.44117553e-08, 0.276274294, -1.95509813e-08, 1, 1.5847581e-08, -0.276274294, -2.06322071e-08, 0.961078823)

end)






ArgetnarLib:Notify("Script", "Was Loaded!")
