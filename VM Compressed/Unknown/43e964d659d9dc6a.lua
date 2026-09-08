-- Regretevator Script
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Consistt/Ui/main/UnLeaked"))()
local search = game.Workspace:GetDescendants()
local Wm = library:Watermark("Regretevator OP Script | v 1.2 | " .. "Hi, " .. library:GetUsername())
local FpsWm = Wm:AddWatermark("FPS : Loading")
coroutine.wrap(function()
    while wait(.75) do
        FpsWm:Text("FPS : " .. library.fps)
    end
end)()
local Floors = Wm:AddWatermark("Floor : Loading")
coroutine.wrap(function()
    while wait(.75) do
        Floors:Text("Floor : " .. tostring(workspace.Values.Floors.Value))
    end
end)()
local Floor = Wm:AddWatermark("Current Floor : Loading")
coroutine.wrap(function()
    while wait(.75) do
        Floor:Text("Current Floor : " .. tostring(workspace.Values.CurrentRoom.Value))
    end
end)()

local Notif = library:InitNotifications()
local LoadingScript = Notif:Notify("Loading Regretevator Script. Please wait...", 3, "information")

library.title = "Regretevator OP Script v1.2"

library:Introduction()
wait(1)
local Init = library:Init()
local Main = Init:NewTab("Main")

   -- Tabs
local Tab1 = Init:NewTab("Basic Scripts")

local Floors = Init:NewTab("Floors")

local Troll = Init:NewTab("Troll")

local Label1 = Tab1:NewLabel("Player Modifers", "center")

    -- Credits
local Credits1 = Main:NewLabel("Script Creator : mythik_25 (Discord)", "center")
local Credits2 = Main:NewLabel("Send requests and bugs to creator discord", "center")
local Credits3 = Main:NewLabel("Coin Farm (MODIFIED BY ME) : MrXrer", "center")
local Credits4 = Main:NewLabel("Energize : illremember", "center")

   -- Some helpfull functions
function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end


function findAnyTouchInsertInPart(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("TouchInterest") then
            firetouchinterest(child, getRoot(game.Players.LocalPlayer.Character), 0)
            task.wait(.4)
            firetouchinterest(child, getRoot(game.Players.LocalPlayer.Character), 1)
        end
    end
end

function findAnyClickDetectorInPart(part)
    for _, child in ipairs(part:GetChildren()) do
        if child:IsA("ClickDetector") then
            fireclickdetector(child, 0, "MouseClick") 
        end
    end
end

-- Main
local Keybind = Main:NewKeybind("Close Menu", Enum.KeyCode.RightAlt, function(key)
    Init:UpdateKeybind(Enum.KeyCode[key])
end)
local discord = Main:NewButton("Join script discord server!", function(value)
    setclipboard("https://discord.gg/EDqHYvgX")
    Notif:Notify("Copied link (paste link into browser)", 3, "information")
end)

-- Basic Scripts
local Toggle = Tab1:NewToggle("Auto Press Proximity Prompt", false, function(value)
    shared.PPInsta = value
end)
local Toggle = Tab1:NewToggle("TP to the PP (Use it if PP is not works)", false, function(value)
    shared.PPTeleport = value
end)
local Toggle = Tab1:NewToggle("Full Bright", false, function(value)
    shared.light = value
end)

   -- Basic Scripts Tab
local Speed = Tab1:NewSlider("Player Speed", "", true, "/", {min = 12, max = 300, default = 16}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)
local Jump = Tab1:NewSlider("Player Jump Power", "", true, "/", {min = 1, max = 50, default = 30}, function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)
local Keybind = Tab1:NewKeybind("Sit (idk why)", Enum.KeyCode.Z, function(key)
    game.Players.LocalPlayer.Character.Humanoid.Sit=true
end)
local Kill = Tab1:NewButton("Kill Player", function(value)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    Notif:Notify("Killed player", 3, "information")
end)
local InfYield = Tab1:NewButton("Infinity Yield", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    Notif:Notify("Executed IY", 3, "information")
end)
local Reset = Tab1:NewButton("Respawn player", function()
    game:GetService("ReplicatedStorage").RE.Respawn:FireServer()
    Notif:Notify("Please wait...", 2, "information")
end)

    -- Floors Tab
local Button = Floors:NewButton("Auto Complete Floor (NOT ALL FLOORS CAN BE COMPLETED)", function()
    if workspace:FindFirstChild("IntenseObby") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.IntenseObby.ENDBLOCK.CFrame
	Notif:Notify("Detected Floor! IntenseObby", 3, "success")
    elseif workspace:FindFirstChild("SnowySlope") then 
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.SnowySlope.Build.FinishFlag.Part.CFrame
	Notif:Notify("Detected Floor! SnowySlope", 3, "success")
    elseif workspace:FindFirstChild("RandomMazeWindows") then
        Workspace.RandomMazeWindows.Build.Part:Destroy()
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.RandomMazeWindows.Build.Part.CFrame
        Notif:Notify("Detected Floor! RandomMazeWindows", 3, "success")
    elseif workspace:FindFirstChild("GumballMachine") then     
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.GumballMachine.Build.WinPart.CFrame
        Notif:Notify("Detected Floor! GumballMachine", 3, "success")
    elseif workspace:FindFirstChild("WHEEL_OF") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.HALL_OF.Build.YOU_WIN.CFrame
	    Notif:Notify("Teleported to the safe zone", 3, "success")
    elseif workspace:FindFirstChild("Obby") then     
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Obby.Build.EndPart.CFrame
        Notif:Notify("Detected Floor! Obby", 3, "success")
    elseif workspace:FindFirstChild("SuspiciouslyLongRoom") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace:FindFirstChild("SuspiciouslyLongRoom").Checkpoints.EndCheckpoint.CFrame
        Notif:Notify("Detected Floor! SuspiciouslyLongRoom", 3, "success")
    elseif workspace:FindFirstChild("Minefield") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Minefield.Build.Decor.etc.IceCreamTruck.Tube.IcecreamGiver.CFrame
        Notif:Notify("Detected Floor! Minefield", 3, "success")
    elseif workspace:FindFirstChild("FloodFillMine") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.FloodFillMine.Build.Shield.Neon.CFrame
        Notif:Notify("Detected Floor! FloodFillMine", 3, "success")
    elseif workspace:FindFirstChild("FindThePath") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.FindThePath.Build.Prototype.SpecPart.CFrame
        Notif:Notify("Detected Floor! FindThePath", 3, "success")
    elseif workspace:FindFirstChild("Jeremy") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Jeremy.Build.Button:GetPivot()
        Notif:Notify("Detected Floor! Jeremy, Teleported to the button", 3, "success")
    elseif workspace:FindFirstChild("RedBallTemple") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.RedBallTemple.Build.Ram.HumanoidRootPart.CFrame
        Notif:Notify("Detected Floor! RedBallTemple", 3, "success")
    elseif workspace:FindFirstChild("WALL_OF") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.WALL_OF.Build.YOU_WIN.CFrame
        Notif:Notify("Detected Floor! WALL_OF", 3, "success")
    elseif workspace:FindFirstChild("HALL_OF") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.HALL_OF.Build.YOU_WIN.CFrame
        Notif:Notify("Detected Floor! HALL_OF", 3, "success")
    elseif workspace:FindFirstChild("TheBackrooms") then 
        wait()
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Light.CFrame + Vector3.new(0, 20, 7)
        Notif:Notify("Detected Floor! TheBackrooms", 3, "success")
    elseif workspace:FindFirstChild("FourCorners") then 
        shared.corners = true
        Notif:Notify("Detected Floor! FourCorners", 3, "success")
    elseif workspace:FindFirstChild("TNTRun") then 
        if workspace:FindFirstChild("Elevator") then 
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
        end
        Notif:Notify("Detected Floor! TNTRun, Teleported to the safe zone", 3, "success")
    elseif workspace:FindFirstChild("TeapotDodgeball") then 
        shared.tea = true
        Notif:Notify("Detected Floor! TeapotDodgeball", 3, "success")
    elseif workspace:FindFirstChild("TeapotTraversal") then 
        shared.teaalt = true
        Notif:Notify("Detected Floor! TeapotTraversal", 3, "success")
    elseif workspace:FindFirstChild("Dance") then 
        shared.dance = true
        Notif:Notify("Detected Floor! Dance", 3, "success")
    elseif workspace:FindFirstChild("Superhighway") then
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Superhighway.WinPoint.CFrame
        Notif:Notify("Detected Floor! Superhighway", 3, "success")
    elseif workspace:FindFirstChild("DriveThru") then
	Notif:Notify("Are you seriosly...", 3, "alarm")
    elseif workspace:FindFirstChild("HotelFloor6") then
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.HotelFloor6.Build.EndPart.CFrame
	Notif:Notify("Teleported to the end part", 3, "success")
    elseif workspace:FindFirstChild("StanelyRoom") then
	workspace.StanelyRoom.Build.CementFloor:Destroy()
    Notif:Notify("Detected Floor! StanelyRoom", 3, "information")
        Notif:Notify("Detected Floor! StanelyRoom, Teleporting to the end...", 3, "success")
        getRoot(game.Players.LocalPlayer.Character).CFrame = workspace.StanelyRoom.Build.Generated.Ending.Jimmy:GetPivot()
         wait(0.2)
        Notif:Notify("Teleported!", 1, "success")
    else
	    Notif:Notify("No supported floor found. Teleported to the safe zone for safety", 3, "error")

    end
end)

local Button = Troll:NewButton("Energize (FE Animations)", function(value)
    loadstring(game:HttpGet('https://raw.githubusercontent.com/IlikeyocutgHAH12/FEEGGEG/refs/heads/main/%5BFE%5D%20Energize%20Animation%20Gui.txt'))()
end)
local Button = Troll:NewButton("Infinity Ragdoll", function(value)
    game:GetService("ReplicatedStorage").RE.RagdollPlayer:FireServer("Block_id675")
end)
local Toggle = Floors:NewToggle("Auto Win", false, function(value)
    shared.Win = value
end)
local Toggle = Floors:NewToggle("Auto Coins", false, function(value)
    shared.Farm = value
end)

local Toggle = Floors:NewToggle("Auto Win in Tea Bounce", false, function(value)
    shared.tea = value
end)
local Toggle = Floors:NewToggle("Auto Win in Tea Bounce (Alternate Floor)", false, function(value)
    shared.teaalt = value
end)
local Toggle = Floors:NewToggle("Auto Win for Four Corners", false, function(value)
    shared.corners = value
end)
local Toggle = Floors:NewToggle("Auto Generator for Area 51 (SOMETIMES NOT WORKS)", false, function(value)
    shared.Generator = value
end)
local Toggle = Floors:NewToggle("Auto Win on Dance Floor", false, function(value)
    shared.dance = value
end)
local Button = Floors:NewButton("Win in Backrooms", function(value)
    if workspace:FindFirstChild("Elevator") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
        Notif:Notify("Teleported to the safe zone", 3, "success")
    end
end)
local Button = Floors:NewButton("Destroy Cement in Stanely Room", function(value)
    if workspace:FindFirstChild("StanelyRoom") then
	workspace.StanelyRoom.Build.CementFloor:Destroy()
        Notif:Notify("Detected Floor! StanelyRoom, Deleting cement floor...", 3, "information")
	wait(0.2)
	if not workspace.StanelyRoom.Build:FindFirstChild("CementFloor") then
	    Notif:Notify("Successfully deleted!", 3, "success")
	else
	    Notif:Notify("Failed to delete cement floor, Make sure floor is fully loaded", 3, "error")
	end
    end
end)
local Button = Floors:NewButton("Win in Stanely Room", function(value)
    if workspace:FindFirstChild("StanelyRoom") then
        Notif:Notify("Detected Floor! StanelyRoom, Teleporting to the end...", 3, "success")
	getRoot(game.Players.LocalPlayer.Character).CFrame = workspace.StanelyRoom.Build.Generated.Ending.Jimmy:GetPivot()
	wait(0.2)
	Notif:Notify("Teleported!", 1, "success")
    end
end)
local Button = Floors:NewButton("Win in Superhighway", function(value)
    if workspace:FindFirstChild("Superhighway") then
        ggetRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Superhighway.WinPoint.CFrame
        Notif:Notify("Detected Floor! Superhighway, Teleporting to last checkpoint...", 3, "success")
	wait(0.2)
	Notif:Notify("Detected Floor! Superhighway, Teleported!", 1, "success")
    end
end)
local Button = Floors:NewButton("TP to Lampert", function(value)
    if workspace:FindFirstChild("3008_Room") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace["3008_Room"].Build.Lampert.Face.CFrame
        Notif:Notify("Teleported to Lampert", 3, "success")
    end
end)
local Button = Floors:NewButton("Win in Mine", function(value)
    if workspace:FindFirstChild("FloodFillMine") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.FloodFillMine.Build.Shield.Neon.CFrame
        Notif:Notify("Teleported to the end", 3, "success")
    end
end)
local Button = Floors:NewButton("Win in Find The Path", function(value)
    if workspace:FindFirstChild("FindThePath") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.FindThePath.Build.Prototype.SpecPart.CFrame
	Notif:Notify("Teleported to the end", 3, "success")
    end
end)
local Button = Floors:NewButton("Win in Jeremy", function(value)
    if workspace:FindFirstChild("Jeremy") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Jeremy.Build.Button:GetPivot()
        Notif:Notify("Detected Floor! Jeremy, Teleported to the button", 3, "success")
    end
end)
local Button = Floors:NewButton("TP to end in RedBallTemple", function(value)
    if workspace:FindFirstChild("RedBallTemple") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.RedBallTemple.Build.Ram.HumanoidRootPart.CFrame
	Notif:Notify("Teleported to the end", 3, "success")
    end
end)
local Button = Floors:NewButton("Win WALL OF", function(value)
    if workspace:FindFirstChild("WALL_OF") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.WALL_OF.Build.YOU_WIN.CFrame
	Notif:Notify("Teleported to the end", 3, "success")
    end
end)
local Button = Floors:NewButton("Win HALL OF", function(value)
    if workspace:FindFirstChild("HALL_OF") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.HALL_OF.Build.YOU_WIN.CFrame
	Notif:Notify("Teleported to the end", 3, "success")
    end
end)
local Button = Floors:NewButton("Win WHEEL OF", function(value)
    if workspace:FindFirstChild("WHEEL_OF") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.HALL_OF.Build.YOU_WIN.CFrame
	    Notif:Notify("Teleported to the safe zone", 3, "success")
    end
end)




local Button = Floors:NewButton("Win in SuspiciouslyLongRoom", function(value)
    if workspace:FindFirstChild("SuspiciouslyLongRoom") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace:FindFirstChild("SuspiciouslyLongRoom").Checkpoints.EndCheckpoint.CFrame
	Notif:Notify("Teleported to the end", 3, "success")
   end
end)
local Button = Floors:NewButton("Win in MineField", function(value)
    if workspace:FindFirstChild("SuspiciouslyLongRoom") then 
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Minefield.Build.Decor.etc.IceCreamTruck.Tube.IcecreamGiver.CFrame
	Notif:Notify("Teleported to the end", 3, "success")
   end
end)
local Button = Tab1:NewButton("Anti Buck Effect follower (monster will delete)", function(value)
    if workspace:FindFirstChild("follower") then 
        game.workspace.follower:Destroy()
	Notif:Notify("Deleted part : workspace.follower", 3, "success")
    end
end)

local Button = Floors:NewButton("Collect All Rocks (Collect the rocks)", function(value)
    Notif:Notify("Clicking on the rocks... (Don't click anything with buttons now!)", 10, "alert")
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "Rock" then
            task.wait(0.1)
            notif:Notify("Found rock.", 1, "success")
            findAnyClickDetectorInPart(v)
        end
    end
end)
local Button = Floors:NewButton("Click on all cardboxes (Find Jaoba)", function(value)
    Notif:Notify("Clicking on the boxes... (Don't click anything with buttons now!)", 10, "alert")
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "cardboard_box" then
            task.wait(0.1)
            notif:Notify("Found box.", 1, "success")
            findAnyClickDetectorInPart(v)
        end
    end
end)
local Button = Floors:NewButton("Click All Doors (cardboard rooms)", function(value)
    Notif:Notify("Clicking on the doors... (Don't click anything with buttons now!)", 10, "alert")
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "Door" then
            task.wait(0.1)
            notif:Notify("Found door.", 1, "success")
            findAnyClickDetectorInPart(v)
        end
    end
end)
local Button = Floors:NewButton("Collect All Pages (FunnyMaze)", function(value)
    Notif:Notify("Clicking on the pages... (Don't click anything with buttons now!)", 10, "alert")
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "Note" and v:IsA("BasePart") then
            task.wait(0.1)
            Notif:Notify("Found page", 1, "alert")
            findAnyClickDetectorInPart(v)
        end
    end
end)
local Button = Floors:NewButton("Close All Valves (Infected))", function(value)
    Notif:Notify("Firing proximity prompts... (Don't press anything with keys now!)", 10, "alert")
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Name == "ValvePrompt" and v.Parent:IsA("BasePart") then
            getRoot(game.Players.LocalPlayer.Character).CFrame = v.Parent.CFrame
            task.wait(0.2)
            fireproximityprompt(v)
        end
    end
end)
local Button = Floors:NewButton("Click on all emergency buttons (JeremboFabric)", function(value)
    Notif:Notify("Clicking on the buttons... (Don't click anything with buttons now!)", 10, "alert")
    for i,v in pairs(workspace:GetDescendants()) do
        if v.Parent.Name == "Prim" and v.Name == "Prompt" then
            fireproximityprompt(v)
            getRoot(game.Players.LocalPlayer.Character).CFrame = v.Parent.CFrame
            fireproximityprompt(v)
            task.wait(0.2)
            fireproximityprompt(v)
        end
    end
end)

local Button = Floors:NewButton("Win in Obby", function(value)
    if workspace:FindFirstChild("Obby") then     
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Obby.Build.EndPart.CFrame
	Notif:Notify("Teleported to the end", 3, "success")
    end
end)
local Button = Floors:NewButton("Win in GumballMachine", function(value)
    if workspace:FindFirstChild("GumballMachine") then     
	Notif:Notify("Teleported to the end", 3, "success")
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.GumballMachine.Build.WinPart.CFrame
    end
end)
local Button = Floors:NewButton("Win in Microsoft Maze", function(value)
    if workspace:FindFirstChild("RandomMazeWindows") then
        Workspace.RandomMazeWindows.Build.Part:Destroy()
	Notif:Notify("Teleported to the end part", 3, "success")
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.RandomMazeWindows.Build.Part.CFrame
    end
end)

local Button = Floors:NewButton("TP to Elevator (if you fall into void)", function(value)
    if workspace:FindFirstChild("Elevator") then 
	Notif:Notify("Teleported to the elevator", 3, "success")
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
    end
end)
local Button = Floors:NewButton("TP to Finish in Snow Slope", function(value)
    if workspace:FindFirstChild("SnowySlope") then 
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.SnowySlope.Build.FinishFlag.Part.CFrame
	Notif:Notify("Teleported to finish flag", 3, "success")
    end
end)

-- Actions
local Button = Floors:NewButton("TP to End in Intense Obby", function(value)
    if workspace:FindFirstChild("IntenseObby") then 
	Notif:Notify("Teleported to the end", 3, "success")
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.IntenseObby.ENDBLOCK.CFrame
    end
end)
local doeng = true
-- Show notification about script loaded
local FinishedLoading = Notif:Notify("Loaded Script", 4, "success")

-- Init floors functions
while true do
    wait(0.0002)
    if shared.Win == true then
	if workspace.Values.CurrentRoom.Value == nil then
        wait(7)
	    getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
	    doeng = true
	end
	if workspace.Values.CurrentRoom.Value ~= nil and doeng == true then
	   print("Floor ready")
	   wait(3.6)
	   print("Floor loaded, Beating the floor...")
	   doeng = false
	   if workspace:FindFirstChild("IntenseObby") then 
	      if workspace.IntenseObby:FindFirstChild("ENDBLOCK") then
                 getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.IntenseObby.ENDBLOCK.CFrame
	      end
        elseif workspace:FindFirstChild("SnowySlope") then 
	    if workspace.SnowySlope:FindFirstChild("Build") then
	    if workspace.SnowySlope.Build:FindFirstChild("FinishFlag") then
	    if workspace.SnowySlope.Build.FinishFlag:FindFirstChild("Part") then
	    Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	    Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	    Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
	    Workspace.SnowySlope.Build.FinishFlag.Part:Destroy()
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.SnowySlope.Build.FinishFlag.Part.CFrame
	    end
	    end
	    end
    elseif workspace:FindFirstChild("RandomMazeWindows") then
	if workspace.RandomMazeWindows:FindFirstChild("Build") then
	  if workspace.RandomMazeWindows:FindFirstChild("Part") then
           Workspace.RandomMazeWindows.Build.Part:Destroy()
           getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.RandomMazeWindows.Build.Part.CFrame
          end
	end
    elseif workspace:FindFirstChild("GumballMachine") then     
	if workspace.GumballMachine:FindFirstChild("Build") then
	if workspace.GumballMachine.Build:FindFirstChild("WinPart") then
         getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.GumballMachine.Build.WinPart.CFrame
	end
	end
    elseif workspace:FindFirstChild("Obby") then    
	if workspace.Obby:FindFirstChild("Build") then
	if workspace.Obby.Build:FindFirstChild("EndPart") then
         getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Obby.Build.EndPart.CFrame
	end
	end
    elseif workspace:FindFirstChild("SuspiciouslyLongRoom") then 
	if workspace.SuspiciouslyLongRoom:FindFirstChild("Checkpoints") then
	if workspace.SuspiciouslyLongRoom.Checkpoints:FindFirstChild("EndCheckpoint") then
         getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace:FindFirstChild("SuspiciouslyLongRoom").Checkpoints.EndCheckpoint.CFrame
	end
	end
    elseif workspace:FindFirstChild("Minefield") then 
	if workspace.Minefield:FindFirstChild("Build") then
	if workspace.Minefield.Build:FindFirstChild("Decor") then
	if workspace.Minefield.Build.Decor:FindFirstChild("etc") then
	if workspace.Minefield.Build.Decor.etc:FindFirstChild("IceCreamTruck") then
	if workspace.Minefield.Build.Decor.etc.IceCreamTruck:FindFirstChild("Tube") then
	if workspace.Minefield.Build.Decor.etc.IceCreamTruck.Tube:FindFirstChild("IcecreamGiver") then
         getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Minefield.Build.Decor.etc.IceCreamTruck.Tube.IcecreamGiver.CFrame
	end
	end
	end
	end
	end
	end
    elseif workspace:FindFirstChild("FloodFillMine") then 
	if workspace.FloodFillMine:FindFirstChild("Build") then
	if workspace.FloodFillMine.Build:FindFirstChild("Shield") then
	if workspace.FloodFillMine.Build.Shield:FindFirstChild("Neon") then
         getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.FloodFillMine.Build.Shield.Neon.CFrame
	end
	end
	end
    elseif workspace:FindFirstChild("FindThePath") then 
	if workspace.FindThePath:FindFirstChild("Build") then
	if workspace.FindThePath.Build:FindFirstChild("Prototype") then
	if workspace.FindThePath.Build.Prototype:FindFirstChild("SpecPart") then
          getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.FindThePath.Build.Prototype.SpecPart.CFrame
	end
	end
	end
    elseif workspace:FindFirstChild("Jeremy") then 
	if workspace.Jeremy:FindFirstChild("Build") then
	if workspace.Jeremy.Build:FindFirstChild("Button") then
           getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Jeremy.Build.Button:GetPivot()
	end
	end
    elseif workspace:FindFirstChild("RedBallTemple") then 
	if workspace.RedBallTemple:FindFirstChild("Build") then
	if workspace.RedBallTemple.Build:FindFirstChild("Ram") then
	if workspace.RedBallTemple.Build.Ram:FindFirstChild("HumanoidRootPart") then
          getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.RedBallTemple.Build.Ram.HumanoidRootPart.CFrame
	end
	end
	end
    elseif workspace:FindFirstChild("HotelFloor6") then
	if workspace.HotelFloor6:FindFirstChild("Build") then
	if workspace.HotelFloor6.Build:FindFirstChild("EndPart") then
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.HotelFloor6.Build.EndPart.CFrame
	    Notif:Notify("Teleported to the end part", 3, "success")
	end
	end
    elseif workspace:FindFirstChild("StanelyRoom") then
	if workspace.HotelFloor6:FindFirstChild("Build") then
	if workspace.HotelFloor6.Build:FindFirstChild("Generated") then
	if workspace.HotelFloor6.Build.Generated:FindFirstChild("Ending") then
	if workspace.HotelFloor6.Build.Generated.Ending:FindFirstChild("Jimmy") then
        getRoot(game.Players.LocalPlayer.Character).CFrame = workspace.StanelyRoom.Build.Generated.Ending.Jimmy:GetPivot()
	Notif:Notify("Teleported to the end part", 3, "success")
	end
	end
	end
    end
    elseif workspace:FindFirstChild("WALL_OF") then 
	if workspace.RandomMazeWindows:FindFirstChild("YOU_WIN") then
          getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.WALL_OF.Build.YOU_WIN.CFrame
	end
    elseif workspace:FindFirstChild("HALL_OF") then 
	if workspace.RandomMazeWindows:FindFirstChild("YOU_WIN") then
          getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.HALL_OF.Build.YOU_WIN.CFrame
	end
    elseif workspace:FindFirstChild("FourCorners") then 
        shared.corners = true
    elseif workspace:FindFirstChild("TheBackrooms") then 
        if workspace:FindFirstChild("Elevator") then 
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
        end
    elseif workspace:FindFirstChild("TNTRun") then 
        if workspace:FindFirstChild("Elevator") then 
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
        end
    elseif workspace:FindFirstChild("TeapotDodgeball") then 
        shared.tea = true
    elseif workspace:FindFirstChild("TeapotTraversal") then 
        shared.teaalt = true
    elseif workspace:FindFirstChild("Dance") then 
        shared.dance = true
    elseif workspace:FindFirstChild("FourCorners") then 
        shared.corners = true
    elseif workspace:FindFirstChild("Superhighway") then
	if workspace.Superhighway:FindFirstChild("WinPoint") then
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Superhighway.WinPoint.CFrame
	end
    elseif workspace:FindFirstChild("StanelyRoom") then
	if workspace.StanelyRoom:FindFirstChild("Build") then
	if workspace.StanelyRoom.Build:FindFirstChild("CementFloor") then
		workspace.StanelyRoom.Build.CementFloor:Destroy()
		if workspace.StanelyRoom.Build:FindFirstChild("CementFloor") then
	 	   Notif:Notify("Failed to delete cement floor, Make sure floor is fully loaded", 3, "error")
		end
	end
	end
    elseif workspace:FindFirstChild("3008_Room") then 
	if workspace["3008_Room"]:FindFirstChild("Build") then
	if workspace["3008_Room"].Build:FindFirstChild("Lampert") then
	if workspace["3008_Room"].Build:FindFirstChild("Face") then
        getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace["3008_Room"].Build.Lampert.Face.CFrame
        findAnyClickDetectorInPart(Workspace["3008_Room"].Build.Lampert)
	end
	end
	end
    end
    end
    end
    if shared.Farm == true then -- Thanks to MrXrer
        for i,v in pairs(workspace:GetDescendants()) do
            if not workspace:FindFirstChild("TNTRun") then
		if not workspace:FindFirstChild("OFFICE_OF") then
                if v.Name == "Coin" or v.Name == "Coins" and v:IsA("BasePart") and not v.Parent:IsA("Motor6D") then
                    getRoot(game.Players.LocalPlayer.Character).CFrame = v.CFrame
		    wait(0.05)
		    getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
                end
                if v.Name == "ThingButton" and v:IsA("ProximityPrompt") then
                    fireproximityprompt(v)
                end
                if v.Name == "Clicker" then
                    findAnyClickDetectorInPart(v)
                end
                if v.Name == "Objects" then
                    findAnyClickDetectorInPart(v)
                end
                if v.Name == "SillyGreenBall" then
                    findAnyTouchInsertInPart(v)
                end
		    end
            end
        end
	end
    if shared.PPInsta == true then  
        for i,v in ipairs(game:GetService("Workspace"):GetDescendants()) do
            if v:IsA("ProximityPrompt") and v.Name ~= "ItemStockProximityPrompt" then
                if shared.PPTeleport == true then
		    if v.Parent ~= nil then
                    if v.Parent:IsA("BasePart") then
                    	getRoot(game.Players.LocalPlayer.Character).CFrame = v.Parent.CFrame
			fireproximityprompt(v)
		    end
                    if v.Parent:IsA("Model") and not v:FindFirstChild("Humanoid") then
                    	getRoot(game.Players.LocalPlayer.Character).CFrame = v.Parent:GetPivot(v)
			fireproximityprompt(v)
		    end
		    end
                end
                v.HoldDuration = 0
                fireproximityprompt(v)
                if shared.PPTeleport == true then
		    fireproximityprompt(v)
		    wait(0.09)
		end
            end
        end
    end
    if shared.Generator == true and shared.Farm == false then
        for i,v in pairs(workspace:GetDescendants()) do
            if not workspace:FindFirstChild("TNTRun") then
                if v.Name == "Generator" then
                    shared.PPInsta = true
                    getRoot(game.Players.LocalPlayer.Character).CFrame = v.CFrame
                    wait(2)
                    v:Destroy()
               end
            end
        end
    end
    if shared.tea == true then
        if workspace:FindFirstChild("TeapotTraversal") then 
	if workspace.TeapotDodgeball:FindFirstChild("Build") then
	if workspace.TeapotDodgeball.Build:FindFirstChild("Finish") then
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.TeapotDodgeball.Build.Finish.CFrame
        end
	end
	end
        if not workspace:FindFirstChild("TeapotDodgeball") then 
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
	    shared.tea = false
        end
    end
    if shared.corners == true then
        if workspace:FindFirstChild("FourCorners") then 
	if workspace.FourCorners:FindFirstChild("Build") then
	if workspace.FourCorners.Build:FindFirstChild("InvisibleWalls") then
	if workspace.FourCorners.Build.InvisibleWalls:FindFirstChild("Ceiling") then
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace:FindFirstChild("FourCorners"):FindFirstChild("Build"):FindFirstChild("InvisibleWalls"):FindFirstChild("Ceiling").CFrame
        end
	end
	end
	end
        if not workspace:FindFirstChild("FourCorners") then 
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
	    shared.corners = false
        end
    end
    if shared.teaalt == true then
        if workspace:FindFirstChild("TeapotTraversal") then 
	if workspace.TeapotTraversal:FindFirstChild("Build") then
	if workspace.TeapotTraversal.Build:FindFirstChild("Finish") then
	if workspace.TeapotTraversal.Build.Finish:FindFirstChild("Stairs") then
	if workspace.TeapotTraversal.Build.Finish.Stairs:FindFirstChild("End") then
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.TeapotTraversal.Build.Finish.Stairs.End.CFrame + CFrame.new(0, 20, 0)
        end
	end
	end
	end
	end
        if not workspace:FindFirstChild("TeapotTraversal") then 
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
	    shared.teaalt = false
        end
    end
    if shared.dance == true then
        if workspace:FindFirstChild("Dance") then 
	if workspace.Dance:FindFirstChild("Build") then
	if workspace.Dance.Build:FindFirstChild("Decor") then
	if workspace.Dance.Build.Decor:FindFirstChild("Top") then
	if workspace.Dance.Build.Decor.Top:FindFirstChild("Truss") then
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Build.Decor.Top.Truss
        end
	end
	end
	end
	end
        if not workspace:FindFirstChild("Dance") then 
            getRoot(game.Players.LocalPlayer.Character).CFrame = Workspace.Elevator.Ceiling.Concrete.CFrame + Vector3.new(0, 20, 7)
	        shared.dance = false
        end
    end
    if shared.light == true then
       local Lighting = game:GetService("Lighting") 
	   Lighting.Brightness = 2
	   Lighting.ClockTime = 14
    end
end
-- That's all! Send requests and bugs about scripts to me (mythik_25) bugs about scripts to me (mythik_25)
