local WorkspacePlayers = game:GetService("Workspace").Game.Players;
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local Players = game:GetService('Players');
local localplayer = Players.LocalPlayer;
local character = localplayer.Character or localplayer.CharacterAdded:Wait()

local TeleportService = game:GetService("TeleportService")
local PlaceId = game.PlaceId
local JobId = game.JobId
-- semicolon but cool :sunglasses:

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/VanillaSourceCode/evade/refs/heads/main/lib.lua"))()
local Esp = loadstring(game:HttpGet("https://raw.githubusercontent.com/9Strew/roblox/main/proc/kiriotesp"))()
Esp.Enabled = false



local Window = Library:CreateWindow("☀️ Evade", Vector2.new(500, 300), Enum.KeyCode.RightShift)
local Evade = Window:CreateTab("General")
local AutoFarms = Window:CreateTab("Farms")
local Local = Window:CreateTab("Player")
local Gamee = Window:CreateTab("Game")
local Configs = Window:CreateTab("Settings")

local EvadeSector = Evade:CreateSector("Character", "left")
local Visuals = Evade:CreateSector("Visuals", "right")
local Credits = Evade:CreateSector("Credits", "left")
local Farms = AutoFarms:CreateSector("Farms", "left")
local FarmStats = AutoFarms:CreateSector("Stats", "right")

local Move = Local:CreateSector("Movement", "left")

local World = Gamee:CreateSector("World", "left")

getgenv().Settings = {
    moneyfarm = false,
    afkfarm = false,
    Downedplayeresp = false,
    AutoRespawn = false,
    TicketFarm = false,
    TSpeed = false,
    Speed = 2,
    DownedColor = Color3.fromRGB(255,0,0),
    PlayerColor = Color3.fromRGB(255,170,0),

    stats = {
        TicketFarm = {
            earned = nil,
            duration = 0
        },

        TokenFarm = {
            earned = nil,
            duration = 0
        }

    }
}

--// because silder does not detect dotted values 
World:AddButton('Full Bright', function()
   	Game.Lighting.Brightness = 4
	Game.Lighting.FogEnd = 100000
	Game.Lighting.GlobalShadows = false
    Game.Lighting.ClockTime = 12
end)

World:AddButton('Remove Barriers', function()
    workspace.Game.Map.InvisParts:ClearAllChildren()
end)

World:AddButton('Rejoin', function()
    if #Players:GetPlayers() <= 1 then
    	localplayer:Kick("\nRejoining...")
    	wait()
    	TeleportService:Teleport(PlaceId, localplayer)
	else
    	TeleportService:TeleportToPlaceInstance(PlaceId, JobId, localplayer)
	end
end)


EvadeSector:AddToggle('Auto Respawn', false, function(State)
    Settings.AutoRespawn = State
end)

EvadeSector:AddButton('Respawn',function()
    game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true) --new event respawn lol
end)

-- farm
Farms:AddToggle('Money Farm', false, function(State)
    Settings.moneyfarm = State
end)

Farms:AddToggle('Afk Farm', false, function(State)
    Settings.afkfarm = State
end)

Farms:AddToggle('Ticket Farm', false, function(State)
    Settings.TicketFarm = State
end)

--move
Move:AddToggle('Speed Boost', false, function(State)
    Settings.TSpeed = State
end)

local WalkSpeed = Move:AddSlider("Speed", 2, 2, 500, 1, function(Value)
    Settings.Speed = Value
end)

Move:AddToggle('Fly', false, function(State)
    if State then
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/random/main/bypassedfly.lua"))()
	else
		for i, v in next, workspace:GetChildren() do
			if v.IsA(v, "BasePart") and v.Name ~= "Terrain" then
				v:Destroy()
			end
		end
	end
end)

-- vis
Visuals:AddToggle('Enable Esp', false, function(State)
    Esp.Enabled = State
end)

Visuals:AddToggle('Bot Esp', false, function(State)
    Esp.NPCs = State
end)

Visuals:AddToggle('Ticket Esp', false, function(State)
    Esp.TicketEsp = State
end)

Visuals:AddToggle('Downed Player Esp', false, function(State)
    Settings.Downedplayeresp = State
end)

Visuals:AddToggle('Players', false, function(State)
    Esp.Players = State
end)

Visuals:AddToggle('Distance', false, function(State)
    Esp.Distance = State
end)

Visuals:AddColorpicker("Player Color", Color3.fromRGB(255,170,0), function(Color)
    Settings.PlayerColor = Color
end)

Visuals:AddColorpicker("Downed Player Color", Color3.fromRGB(255,255,255), function(Color)
    Settings.DownedColor = Color
end)

Credits:AddLabel("Update By VanillaCode")
Credits:AddLabel("Developed By xCLY And batusd")
Credits:AddLabel("UI Lib: Jans Lib")
Credits:AddLabel("ESP Lib: Kiriot")
Configs:CreateConfigSystem()

local TypeLabelC5 = FarmStats:AddLabel('Auto Farm Stats')
local DurationLabelC5 = FarmStats:AddLabel('Duration: 0')

local function lolkekspeed(Player)
    local humanoid = Player.character:FindFirstChildOfClass("Humanoid")
    local rootPart = Player.character:FindFirstChild("HumanoidRootPart")
    local moveDirection = humanoid.MoveDirection
    if moveDirection.Magnitude > 0 then
        local newPosition = rootPart.Position + moveDirection * Settings.Speed
        rootPart.CFrame = CFrame.new(newPosition, newPosition + moveDirection)
    end
end

game:GetService("RunService").Stepped:Connect(function(_, deltaTime)
    if Settings.TSpeed then
        lolkekspeed(game.Players.LocalPlayer)
    end
end)


local FindAI = function()
    for _,v in pairs(WorkspacePlayers:GetChildren()) do
        if not Players:FindFirstChild(v.Name) then
            return v
        end
    end
end


local GetDownedPlr = function()
    for i,v in pairs(WorkspacePlayers:GetChildren()) do
        if v:GetAttribute("Downed") then
            return v
        end
    end
end

--Shitty Auto farm 🥶💀🤡💀🤡💀🤡
local revive = function()
    local downedplr = GetDownedPlr()
    if downedplr ~= nil and downedplr:FindFirstChild('HumanoidRootPart') then
        task.spawn(function()
            while task.wait() do
                if localplayer.Character then
                    workspace.Game.Settings:SetAttribute("ReviveTime", 2.2)
                    localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(downedplr:FindFirstChild('HumanoidRootPart').Position.X, downedplr:FindFirstChild('HumanoidRootPart').Position.Y + 3, downedplr:FindFirstChild('HumanoidRootPart').Position.Z)
                    task.wait()
                    --game:GetService("ReplicatedStorage").Events.Revive.RevivePlayer:FireServer(tostring(downedplr), false)
                    game:GetService("ReplicatedStorage").Events.Character.Interact:FireServer("Revive", nil, tostring(downedplr))
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Character"):WaitForChild("Interact"):FireServer("Revive",true,tostring(downedplr))
                    break
                end
            end
        end)
    end
end

--Kiriot
Esp:AddObjectListener(WorkspacePlayers, {
    Color =  Color3.fromRGB(255,0,0),
    Type = "Model",
    PrimaryPart = function(obj)
        local hrp = obj:FindFirstChild('HumanoidRootPart')
        while not hrp do
            wait()
            hrp = obj:FindFirstChild('HumanoidRootPart')
        end
        return hrp
    end,
    Validator = function(obj)
        return not game.Players:GetPlayerFromCharacter(obj)
    end,
    CustomName = function(obj)
        return '[AI] '..obj.Name
    end,
    IsEnabled = "NPCs",
})

Esp:AddObjectListener(game:GetService("Workspace").Game.Effects.Tickets, {
    CustomName = "Ticket",
    Color = Color3.fromRGB(41,180,255),
    IsEnabled = "TicketEsp"
})

--Tysm CJStylesOrg
Esp.Overrides.GetColor = function(char)
   local GetPlrFromChar = Esp:GetPlrFromChar(char)
   if GetPlrFromChar then
       if Settings.Downedplayeresp and GetPlrFromChar.Character:GetAttribute("Downed") then
           return Settings.DownedColor
       end
   end
   return Settings.PlayerColor
end

local formatNumber = (function(value) -- //Credits: https://devforum.roblox.com/t/formatting-a-currency-label-to-include-commas/413670/3
	value = tostring(value)
	return value:reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end)

function Format(Int) -- // Credits: https://devforum.roblox.com/t/converting-secs-to-hsec/146352
	return string.format("%02i", Int)
end

function convertToHMS(Seconds)
	local Minutes = (Seconds - Seconds%60)/60
	Seconds = Seconds - Minutes*60
	local Hours = (Minutes - Minutes%60)/60
	Minutes = Minutes - Hours*60
	return Format(Hours).."H "..Format(Minutes).."M "..Format(Seconds)..'S'
end

task.spawn(function()
    while task.wait(1) do
        if Settings.TicketFarm then
            Settings.stats.TicketFarm.duration += 1
        end
        if Settings.moneyfarm then
            Settings.stats.TokenFarm.duration += 1
        end 
    end
end)

--local gettickets = localplayer:GetAttribute('Tickets')
local GetTokens = localplayer:GetAttribute('Tokens')

localplayer:GetAttributeChangedSignal('Tokens'):Connect(function()
    local tokens = tostring(GetTokens - localplayer:GetAttribute('Tokens'))
    local cleanvalue = string.split(tokens, "-")
    print(cleanvalue[2])
    Settings.stats.TokenFarm.earned = cleanvalue[2]
end)

localplayer:GetAttributeChangedSignal('Tokens'):Connect(function()
    local tokens = tostring(GetTokens - localplayer:GetAttribute('Tokens'))
    local cleanvalue = string.split(tokens, "-")
    print(cleanvalue[2])
    Settings.stats.TokenFarm.earned = cleanvalue[2]
end)

task.spawn(function()
    while task.wait() do
        if Settings.TicketFarm then
            TypeLabelC5:Set('Ticket Farm')
            DurationLabelC5:Set('Duration:'..convertToHMS(Settings.stats.TicketFarm.duration))
            --TicketsLabelC5:Set('Total Tickets: '..localplayer:GetAttribute('Tickets'))

            if game.Players.LocalPlayer:GetAttribute('InMenu') ~= true and localplayer:GetAttribute('Dead') ~= true then
                for i,v in pairs(game:GetService("Workspace"):FindFirstChild("Game") and game:GetService("Workspace").Game:FindFirstChild("Effects") and game:GetService("Workspace").Game.Effects:FindFirstChild("Tickets"):GetChildren()) do
                    localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(v:WaitForChild('HumanoidRootPart').Position)
                --else
                --    localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(6007, 7005, 8005)
                end
            else
                task.wait(2)
                game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true) -- respawn event
            end
            if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true) -- respawn event
                task.wait(2)
            end
        end
    end
end)


task.spawn(function()
    while task.wait() do
        if Settings.AutoRespawn then
             if localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true) -- respawn event
             end
        end

        if Settings.moneyfarm then
            TypeLabelC5:Set('Money Farm')
            DurationLabelC5:Set('Duration:'..convertToHMS(Settings.stats.TokenFarm.duration))
            --TicketsLabelC5:Set('Total Tokens: '..formatNumber(localplayer:GetAttribute('Tokens')))
            
            if localplayer:GetAttribute("InMenu") and localplayer:GetAttribute("Dead") ~= true then
                game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true) -- respawn event
            end
            if localplayer.Character and localplayer.Character:GetAttribute("Downed") then
                game:GetService("ReplicatedStorage").Events.Player.ChangePlayerMode:FireServer(true) -- respawn event
                task.wait(3)
            else
                revive()
                task.wait(1)
            end

        end
        if Settings.moneyfarm == false and Settings.afkfarm and localplayer.Character:FindFirstChild('HumanoidRootPart') ~= nil then
            localplayer.Character:FindFirstChild('HumanoidRootPart').CFrame = CFrame.new(6007, 7005, 8005)
        end
    end
end)

--Infinite yield's Anti afk
local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(localplayer.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		localplayer.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
