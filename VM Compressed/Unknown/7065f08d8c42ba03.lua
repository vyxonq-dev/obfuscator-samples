local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local plr = game:GetService("Players").LocalPlayer
local w
if game.GameId == 6215464786 then -- Chained
    if game.PlaceId == 134363685332033 then
        w = lib:Window("Chained | The Hunt")
        w:Label("The script requires a pair", Color3.fromRGB(127, 143, 166))
        w:Button("Instant checkpoints", function ()
            for i = 1, 31 do
                local a = {
                    [1] = i
                }
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimCheckpoint"):FireServer(unpack(a))
            end
        end)
    else
        game:GetService("TeleportService"):Teleport(134363685332033, plr.Character)
    end
elseif game.GameId == 65241 then -- Natural Disasters Survival
    local bb = game:GetService("VirtualUser")
    plr.Idled:connect(function()
        bb:CaptureController()
        bb:ClickButton2(Vector2.new())
    end)
    local lastPos
    w = lib:Window("NDS | The Hunt") 
    w:Toggle("Auto Win", false, function(bool)
        getgenv().win = bool
        if getgenv().win then
            lastPos = plr.Character.HumanoidRootPart.CFrame
        else
            plr.Character.HumanoidRootPart.CFrame = lastPos
        end
        while getgenv().win do
            plr.Character.HumanoidRootPart.CFrame = CFrame.new(-282, 157, 339)
            task.wait()
        end
    end)
elseif game.GameId == 4540138978 then -- Metro Life
    w = lib:Window("Metro Life | The Hunt")
    local hunt = game:GetService("Workspace"):FindFirstChild("Hunt")
    local points_table = {}

    for _, point in pairs(hunt:GetChildren()) do
        if point.Name:match("^Check in point%d+$") then
            local lastWord = point.Name:match("point%d+$")
            if lastWord then
                table.insert(points_table, lastWord)
            end
        end
    end

    w:Dropdown("Points", points_table, function(name)
        for _, point in pairs(hunt:GetChildren()) do
            if string.find(point.Name, name) then
                local cam = point:FindFirstChild("camera")
                if cam then
                    plr.Character:FindFirstChild("HumanoidRootPart").CFrame = cam.WorldPivot * CFrame.new(0,10,0)
                end
            end
        end
    end)
    w:Button("Teleport to Hunt NPC", function ()
        local birthPoint = hunt:FindFirstChild("Birth point")
        plr.Character:FindFirstChild("HumanoidRootPart").CFrame = birthPoint.WorldPivot * CFrame.new(0,10,0)
    end)
elseif game.GameId == 3876150506 then -- Drive World
    w = lib:Window("Obby | The Hunt")
    local checkpoints = {
        ["Checkpoint1"] = "3137de",
        ["Checkpoint2"] = "31378b",
        ["Checkpoint3"] = "313738",
        ["Checkpoint4"] = "3137e5",
        ["Checkpoint5"] = "313792",
        ["Checkpoint6"] = "31373f",
        ["Checkpoint7"] = "3137ec",
        ["Checkpoint8"] = "313799"
    }
    w:Dropdown("Corrupted Obby", {"Checkpoint1", "Checkpoint2", "Checkpoint3", "Checkpoint4", "Checkpoint5", "Checkpoint6", "Checkpoint7"}, function (name)
        local checkpointId = checkpoints[name]
        if checkpointId then
            plr.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("Races"):FindFirstChild("HuntObby1").Checkpoints[checkpointId].WorldPivot
        end
    end)
    w:Dropdown("Fractured Obby", {"Checkpoint1", "Checkpoint2", "Checkpoint3", "Checkpoint4", "Checkpoint5", "Checkpoint6"}, function (name)
        local checkpointId = checkpoints[name]
        if checkpointId then
            plr.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("Races"):FindFirstChild("HuntObby2").Checkpoints[checkpointId].WorldPivot
        end
    end)
    w:Dropdown("Rifted Obby", {"Checkpoint1", "Checkpoint2", "Checkpoint3", "Checkpoint4", "Checkpoint5"}, function (name)
        local checkpointId = checkpoints[name]
        if checkpointId then
            plr.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("Races"):FindFirstChild("HuntObby3").Checkpoints[checkpointId].WorldPivot
        end
    end)
    w:Dropdown("Splintered Obby", {"Checkpoint1", "Checkpoint2", "Checkpoint3", "Checkpoint4", "Checkpoint5", "Checkpoint6", "Checkpoint7", "Checkpoint8"}, function (name)
        local checkpointId = checkpoints[name]
        if checkpointId then
            plr.Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("Races"):FindFirstChild("HuntObby4").Checkpoints[checkpointId].WorldPivot
        end
    end)
    w:Label("I recommend waiting 1 minute", Color3.fromRGB(127, 143, 166))
    w:Label("before finishing the obby", Color3.fromRGB(127, 143, 166))
end
w:Label("By: t.me/arceusxscripts", Color3.fromRGB(127, 143, 166))
