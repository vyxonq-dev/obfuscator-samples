-- / ANTICHEAT BYPASS \ --
local OldNameCall = nil

OldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    local Args = {...}
    local NamecallMethod = getnamecallmethod()

    if not checkcaller() and Self == game.ReplicatedStorage.Remotes.Weapon and NamecallMethod == "FireServer" and Args[1] == "ValidateSize" then
        return
        --Args[3] = vector.one -- used to just spoof it, this didnt work and got me banned when hitbox expander was added lol
        --return OldNameCall(Self, unpack(Args))
    elseif not checkcaller() and Self == game.ReplicatedStorage.Remotes.Weapon and NamecallMethod == "FireServer" and (Args[1] == "FlyBan" or Args[1] == "WalkSpeedBan" or Args[1] == "Tp" or Args[1] == "FlyStrike") then
        return
    end

    return OldNameCall(Self, ...)
end)
-- \ ANTICHEAT BYPASS / --

-- / SHAMELESS DISCORD PLUG :) (pls join) \ --
local discordInvite = "https://discord.com/invite/PCVhAEPEsj"

local http_request = (syn and syn.request) or (http and http.request) or request
if http_request then
    http_request({
        Url = "http://127.0.0.1:6463/rpc?v=1",
        Method = "POST",
        Headers = {
            ["Content-Type"] = "application/json",
            ["Origin"] = "https://discord.com"
        },
        Body = game:GetService("HttpService"):JSONEncode({
            cmd = "INVITE_BROWSER",
            args = {code = string.match(discordInvite, "discord%.com/invite/(%w+)")},
            nonce = game:GetService("HttpService"):GenerateGUID(false)
        })
    })
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Executor Not Supported",
        Text = "Join manually: "..discordInvite,
        Duration = 5
    })
end--]]
-- \ SHAMELESS DISCORD PLUG :) (pls join) \ --


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

local Options = Library.Options

local Window = Library:CreateWindow({
    Title = "ttokenn.xyz",
    Footer = "Cold War | v1.0.0",
    ToggleKeybind = Enum.KeyCode.RightShift,
    Center = true,
    AutoShow = true
})

local CombatTab = Window:AddTab("Combat", "locate", "Combat Features")
local ModsTab = Window:AddTab("Mods", "hammer", "Player & Gun Mods")
local VisualsTab = Window:AddTab("Visuals", "eye", "ESP")

local UISettingsTab = Window:AddTab({
    Name = "UI Settings",
    Description = "UI Customization",
    Icon = "settings"
})

-- VARIABLES --
local Players = game.Players
local lp = Players.LocalPlayer
local mouse = lp:GetMouse()
local camera = workspace.CurrentCamera
local Y_Offset = game:GetService("GuiService"):GetGuiInset().Y
local runservice = game:GetService("RunService")
local target = nil
local targetplr = nil
local gc = getgc(true)
local boxes = {}
local healthbars = {}
local usernames = {}
local dists = {}
local config = {
    Enabled = false,
    TextPadding = 2,
    Box = {
        Enabled = false,
        BoxType = "Box",
        Color = Color3.new(1,1,1),
        Outlines = false,
        OutlinesColor = Color3.new(0,0,0),
        Thickness = 1,
        CornerLength = 0.5
    },
    Healthbar = {
        Enabled = false,
        Color = Color3.new(0,1,0),
        Background = true,
        BackgroundColor = Color3.new(0,0,0),
        Padding = 2,
        Thickness = 2,
        Size = 5
    },
    Name = {
        Enabled = false,
        Color = Color3.new(1,1,1),
        Outlines = false,
        OutlinesColor = Color3.new(0,0,0)
    },
    Distance = {
        Enabled = false,
        Color = Color3.new(1,1,1),
        Outlines = false,
        OutlinesColor = Color3.new(0,0,0)
    },
    Silent = {
        Enabled = false,
        HPCheck = false,
        TeamCheck = false,
        VisibleCheck = false,
        FOV = false,
        FOVSize = 150,
        TargetLine = false,
        FOVColor = Color3.new(1,1,1),
        TargetLineColor = Color3.new(1,1,1)
    },
    Hitbox = {
        Enabled = false,
        Multiplier = 10,
        Part = "Head"
    },
    GunMods = {
        InfiniteWallbang = false,
        InstantHit = false,
        Recoil = false,
        AutoRefill = false,
        AutoRefillPercent = false
    },
}
-- VARIABLES --


-- FUNCTIONS --

local function applyGunMods()
    for i,v in pairs(gc) do
        if typeof(v) == 'table' then
            if rawget(v, "MaxDistance") and rawget(v, "Spread") and rawget(v, "MaxAmmo") and rawget(v, "Ammo") and rawget(v, "BulletVelocity") then
                if config.GunMods.InstantHit then
                    print("INSTANT HIT")
                    rawset(v, "BulletVelocity", 99999)
                    rawset(v, "Drag", 0.0001)
                end
                if config.GunMods.InfiniteWallbang then
                    rawset(v, "Penetration", math.huge)
                    rawset(v, "ArmorPierce", 99999)
                end
            end
        end
    end
end

local gc = getgc()
local c = {"workspace", "Vehicles", "RocketLauncher", "GrenadeLauncher"}

local func
for _,v in pairs(gc) do
    if typeof(v) == 'function' and not iscclosure(v) then
        local consts = getconstants(v)
        local found = 0
        for _,const in pairs(c) do
            if table.find(consts, const) then
                found = found + 1
            end
        end
        if found == #c then
            func = v
        end
    end
end

if not func then print("func not found") end

local old; old = hookfunction(func, function(...)
    local args = {...}
    if args[2].Instance:IsDescendantOf(workspace.Vehicles) then
        return true
    end
    return old(...)
end)

local function wallcheck(target)
    local r = Ray.new(lp.Character.Head.Position, (target.Position - lp.Character.Head.Position).Unit * 3000)
    local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(r, {lp.Character}, false, true)
    if part then
        local humanoid = part.Parent:FindFirstChild("Humanoid")
        if not humanoid then
            humanoid = part.Parent.Parent:FindFirstChild("Humanoid")
        end
        if humanoid and target and humanoid.Parent == target.Parent then
            local pos, visible = camera:WorldToScreenPoint(target.Position)
            if visible then
                return true
            end
        end
    end
    return false
end

local function getnearestplr()
    local lowestDist = math.huge
    local nearest = nil
    local POS = nil

    for _,v in pairs(Players:GetChildren()) do
        if v.Team == lp.Team and config.Silent.TeamCheck then continue end -- could possibly add ESP team check?
		if v == lp then
            continue
        end
        local c = v.Character
        if c and c:FindFirstChild("Humanoid") and c:FindFirstChild("HumanoidRootPart") then -- could possibly add ESP dead check?
            if ((c.Humanoid.Health < 0) and config.Silent.HPCheck) then
                continue
            end
            local part = c:FindFirstChild("Head")
            if not part then
                part = c:FindFirstChild("HumanoidRootPart") -- not really sure why i do this lol
            end
            if not part then
                continue
            end
            if config.Silent.VisibleCheck then
                if not wallcheck(part) then
                    continue
                end
            end
            local pos, vis = camera:WorldToViewportPoint(part.Position) -- on screen check
            local dist = (Vector2.new(mouse.X, mouse.Y + Y_Offset) - Vector2.new(pos.X, pos.Y)).Magnitude
            if config.Silent.FOV and not (dist < config.Silent.FOVSize) then -- check for FOV enabled and within circle
                continue
            end
            if dist < lowestDist and vis then
                nearest = c.Head
                lowestDist = dist
                POS = Vector2.new(pos.X, pos.Y)
            end
        end
    end

    return nearest, POS
end

local function updateTarget() -- this makes my frmaes plummet when i respawn
    if lp.Character then
        local temp, pos = getnearestplr()
        if temp then target = temp.CFrame; targetplr = Players:FindFirstChild(temp.Parent.Name) else target = nil end
    end
end

local function drawFov()
    local circle = Drawing.new("Circle")
    circle.Visible = true
    circle.Thickness = 1
    circle.NumSides = 50
    circle.Filled = false
    circle.Position = Vector2.new(mouse.X, mouse.Y + Y_Offset)
    return circle
end

local function getCharMinMax(char)
    local minX, maxX = math.huge, -math.huge
    local minY, maxY = math.huge, -math.huge

    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") then
            local cf = part.CFrame
            local size = part.Size / 2

            -- Generate the 8 corners of the bounding box
            local corners = {
                Vector3.new(-size.X, -size.Y, -size.Z),
                Vector3.new(-size.X, -size.Y,  size.Z),
                Vector3.new(-size.X,  size.Y, -size.Z),
                Vector3.new(-size.X,  size.Y,  size.Z),
                Vector3.new( size.X, -size.Y, -size.Z),
                Vector3.new( size.X, -size.Y,  size.Z),
                Vector3.new( size.X,  size.Y, -size.Z),
                Vector3.new( size.X,  size.Y,  size.Z),
            }

            for _, offset in pairs(corners) do
                local worldPoint = cf:PointToWorldSpace(offset)
                local screenPos, onScreen = camera:WorldToViewportPoint(worldPoint)
                if onScreen then
                    minX = math.min(minX, screenPos.X)
                    maxX = math.max(maxX, screenPos.X)
                    minY = math.min(minY, screenPos.Y)
                    maxY = math.max(maxY, screenPos.Y)
                end
            end
        end
    end

    minX = math.clamp(minX, 0, 1920)
    maxX = math.clamp(maxX, 0, 1920)
    minY = math.clamp(minY, 0, 1080)
    maxY = math.clamp(maxY, 0, 1080)

    return maxX, maxY, minX, minY
end


local function drawHealthBar(char)
    local background = Drawing.new("Square")
    background.Filled = false
    background.Visible = false
    local foreground = Drawing.new("Square")
    foreground.Filled = true
    foreground.Visible = false

    return foreground, background
end

local function updateHealthBar(char, foreground, background)
    if not char then return end
    if Players:GetPlayerFromCharacter(char).Team == lp.team or Players:GetPlayerFromCharacter(char).Team.Name == "Neutral" then -- possible ESP team check option?
        foreground.Visible = false
        background.Visible = false
        return
    end
    local hum = char:FindFirstChild("Humanoid")
    if not hum then
        foreground.Visible = false
        background.Visible = false
        return
    end
    if not config.Healthbar.Enabled then
        foreground.Visible = false
        background.Visible = false
        return
    end

    local VIS = false
    if char:FindFirstChild("HumanoidRootPart") then
        local _, vis = camera:WorldToViewportPoint(char.HumanoidRootPart.Position)
        VIS = vis
    else
        foreground.Visible = false
        background.Visible = false
        return
    end

    foreground.Color = config.Healthbar.Color
    background.Color = config.Healthbar.BackgroundColor
    background.Thickness = config.Healthbar.Thickness
    
    local health = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
    local maxX, maxY, minX, minY = getCharMinMax(char)
    if not maxX or not maxY or not minX or not minY then
        foreground.Visible = false
        background.Visible = false
        return
    end

    if hum.Health <= 0 and char:FindFirstChild("isRagdolled") and char.isRagdolled.Value == true then
        foreground.Visible = false
        background.Visible = false
    else
        local rootPart = char:FindFirstChild("HumanoidRootPart")
        if not rootPart then return end

        local distance = (camera.CFrame.Position - rootPart.Position).Magnitude
        local baseSize = config.Healthbar.Size
        local scaleFactor = 25 -- need to change in the future to use a fake Vector3 pos to handle scaling for me
        local scaledSize = math.clamp(baseSize / (distance / scaleFactor), 1, baseSize)

        local height = maxY - minY
        local pos = Vector2.new(minX - config.Healthbar.Padding - scaledSize, minY)

        foreground.Position = Vector2.new(pos.X, pos.Y + (height * (1 - health)))
        foreground.Size = Vector2.new(scaledSize, height * health)
        background.Position = Vector2.new(pos.X, pos.Y + (height * (1 - health)))
        background.Size = Vector2.new(scaledSize, height * health)

        foreground.Visible = VIS
        background.Visible = VIS
    end
end

local function drawBoundingBox(char)
    local maxX, maxY, minX, minY = getCharMinMax(char)

    local bg = Drawing.new("Square")
    bg.Visible = true
    bg.Size = Vector2.new((maxX - minX), (maxY - minY))
    bg.Position = Vector2.new(minX, minY)
    bg.Filled = false
    bg.ZIndex = 2

    local box = Drawing.new("Square")
    box.Visible = true
    box.Size = Vector2.new((maxX - minX), (maxY - minY))
    box.Position = Vector2.new(minX, minY)
    box.Filled = false
    box.ZIndex = 2

    return box, bg
end

local function drawCornerBoundingBox(char)
    local maxX, maxY, minX, minY = getCharMinMax(char)
    local VIS = false
    if char:FindFirstChild("HumanoidRootPart") then
        local _, vis = camera:WorldToViewportPoint(char.HumanoidRootPart.Position)
        VIS = vis
    end

    local BGTopLeftA = Drawing.new("Line")
    local BGTopLeftB = Drawing.new("Line")
    local BGTopRightA = Drawing.new("Line")
    local BGTopRightB = Drawing.new("Line")
    local BGBottomLeftA = Drawing.new("Line")
    local BGBottomLeftB = Drawing.new("Line")
    local BGBottomRightA = Drawing.new("Line")
    local BGBottomRightB = Drawing.new("Line")

    local TopLeftA = Drawing.new("Line")
    local TopLeftB = Drawing.new("Line")
    local TopRightA = Drawing.new("Line")
    local TopRightB = Drawing.new("Line")
    local BottomLeftA = Drawing.new("Line")
    local BottomLeftB = Drawing.new("Line")
    local BottomRightA = Drawing.new("Line")
    local BottomRightB = Drawing.new("Line")

    for _,v in pairs({BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB}) do
        v.Thickness = config.Box.Thickness + 1
        v.Visible = VIS and config.Box.Outlines
        v.Color = config.Box.OutlinesColor
        v.ZIndex = 1
    end

    for _,v in pairs({TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB}) do
        v.Thickness = config.Box.Thickness
        v.Visible = VIS
        v.Color = config.Box.Color
        v.ZIndex = 1
    end

    return TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB
end

local function adjustCorners(plr, TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB)
    if plr.Team == lp.team or plr.Team.Name == "Neutral" then -- possible ESP team check?
        for _,v in pairs({TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB}) do
            v.Visible = false
        end
        return
    end
    if not config.Box.Enabled then
        for _,v in pairs(boxTable) do
            v.Visible = false
        end
        return
    end
    local char = plr.Character
    local boxTable = {TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB}

    if not char then
        for _,v in pairs(boxTable) do
            v.Visible = false
        end
        return
    end

    local maxX, maxY, minX, minY = getCharMinMax(char)
    local VIS = false
    if char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("isRagdolled") and char.isRagdolled.Value == false and char.Humanoid.Health > 0 then
        local _, vis = camera:WorldToViewportPoint(char.HumanoidRootPart.Position)
        VIS = vis
    else
        for _,v in pairs(boxTable) do
            v.Visible = false
        end
        return
    end

    for _,v in pairs({BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB}) do
        v.Thickness = config.Box.Thickness + 1
        v.Visible = VIS and config.Box.Outlines
        v.Color = config.Box.OutlinesColor
    end

    for _,v in pairs({TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB}) do
        v.Thickness = config.Box.Thickness
        v.Visible = VIS
        v.Color = config.Box.Color
    end

    TopLeftA.From = Vector2.new(minX, minY)
    TopLeftB.From = Vector2.new(minX, minY)
    TopRightA.From = Vector2.new(maxX, minY)
    TopRightB.From = Vector2.new(maxX, minY)
    BottomLeftA.From = Vector2.new(minX, maxY)
    BottomLeftB.From = Vector2.new(minX, maxY)
    BottomRightA.From = Vector2.new(maxX, maxY)
    BottomRightB.From = Vector2.new(maxX, maxY)

    BGTopLeftA.From = Vector2.new(minX - 1, minY) -- change 1 to thickness in future
    BGTopLeftB.From = Vector2.new(minX, minY)
    BGTopRightA.From = Vector2.new(maxX + 1, minY)
    BGTopRightB.From = Vector2.new(maxX, minY)
    BGBottomLeftA.From = Vector2.new(minX - 1, maxY)
    BGBottomLeftB.From = Vector2.new(minX, maxY)
    BGBottomRightA.From = Vector2.new(maxX + 1, maxY)
    BGBottomRightB.From = Vector2.new(maxX, maxY)

    TopLeftA.To = Vector2.new(minX + (maxX - minX)/2*config.Box.CornerLength, minY)
    TopLeftB.To = Vector2.new(minX, minY + (maxY - minY)/2*config.Box.CornerLength)
    TopRightA.To = Vector2.new(maxX - (maxX - minX)/2*config.Box.CornerLength, minY)
    TopRightB.To = Vector2.new(maxX, minY + (maxY - minY)/2*config.Box.CornerLength)
    BottomLeftA.To = Vector2.new(minX + (maxX - minX)/2*config.Box.CornerLength, maxY)
    BottomLeftB.To = Vector2.new(minX, maxY - (maxY - minY)/2*config.Box.CornerLength)
    BottomRightA.To = Vector2.new(maxX - (maxX - minX)/2*config.Box.CornerLength, maxY)
    BottomRightB.To = Vector2.new(maxX, maxY - (maxY - minY)/2*config.Box.CornerLength)

    BGTopLeftA.To = Vector2.new(minX + (maxX - minX)/2*config.Box.CornerLength, minY)
    BGTopLeftB.To = Vector2.new(minX, minY + (maxY - minY)/2*config.Box.CornerLength)
    BGTopRightA.To = Vector2.new(maxX - (maxX - minX)/2*config.Box.CornerLength, minY)
    BGTopRightB.To = Vector2.new(maxX, minY + (maxY - minY)/2*config.Box.CornerLength)
    BGBottomLeftA.To = Vector2.new(minX + (maxX - minX)/2*config.Box.CornerLength, maxY)
    BGBottomLeftB.To = Vector2.new(minX, maxY - (maxY - minY)/2*config.Box.CornerLength)
    BGBottomRightA.To = Vector2.new(maxX - (maxX - minX)/2*config.Box.CornerLength, maxY)
    BGBottomRightB.To = Vector2.new(maxX, maxY - (maxY - minY)/2*config.Box.CornerLength)
end

local function adjustBoundingBox(plr, box, bg)
    if plr.Team == lp.team or plr.Team.Name == "Neutral" then -- possible ESP team check?
        box.Visible = false
        bg.Visible = false
        return
    end
    local char = plr.Character
    if not char then
        box.Visible = false
        bg.Visible = false
        return
    end
    if not config.Box.Enabled then
        box.Visible = false
        bg.Visible = false
        return
    end

    local VIS = false

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then--and char:FindFirstChild("isRagdolled") and char.isRagdolled.Value == true then -- TODO: check this out!!
        local _, vis = camera:WorldToViewportPoint(hrp.Position)
        VIS = vis
        box.Visible = vis
        bg.Visible = vis and config.Box.Outlines
    else
        box.Visible = false
        bg.Visible = false
        return
    end

    if VIS then
        bg.Color = config.Box.OutlinesColor
        bg.Thickness = config.Box.Thickness + 1
        box.Thickness = config.Box.Thickness
        box.Color = config.Box.Color
        local maxX, maxY, minX, minY = getCharMinMax(char)
        box.Size = Vector2.new((maxX - minX), (maxY - minY))
        box.Position = Vector2.new(minX, minY)
        bg.Size = Vector2.new((maxX - minX), (maxY - minY))
        bg.Position = Vector2.new(minX, minY)
    end
end

local function drawUsername(char)
    local name = "Nil"
    if char then name = char.Name end
    local username = Drawing.new("Text")
    username.Text = name
    username.Center = true
    username.Size = 11

    return username
end

local function updateUsername(char, username)
    if not char then return end
    if Players:GetPlayerFromCharacter(char).Team == lp.team or Players:GetPlayerFromCharacter(char).Team.Name == "Neutral" then
        username.Visible = false
        return
    end
    if not config.Name.Enabled then
        username.Visible = false
        return
    end
    local maxX, maxY, minX, minY = getCharMinMax(char)

    local VIS = false

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local _, vis = camera:WorldToViewportPoint(hrp.Position)
        VIS = vis
        username.Visible = vis
    else
        username.Visible = false
        return
    end

    if VIS then
        username.Outline = config.Name.Outlines
        username.OutlineColor = config.Name.OutlinesColor
        username.Color = config.Name.Color
        username.Position = Vector2.new(maxX - ((maxX - minX)/2), minY - username.TextBounds.Y - config.TextPadding)
    end
end

local function drawDistance(char)
    local dist = Drawing.new("Text")
    dist.Text = ""
    dist.Center = true
    dist.Size = 9

    return dist
end

local function updateDistance(char, dist)
    if not char then print("aaa"); return end
    if Players:GetPlayerFromCharacter(char).Team == lp.team or Players:GetPlayerFromCharacter(char).Team.Name == "Neutral" then
        dist.Visible = false
        return
    end
    if not config.Distance.Enabled then
        dist.Visible = false
        return
    end
    
    local maxX, maxY, minX, minY = getCharMinMax(char)
    local text = ""

    local VIS = false

    local hrp = char:FindFirstChild("HumanoidRootPart")
    if hrp then
        local distance = (Players.LocalPlayer.Character.HumanoidRootPart.Position - hrp.Position).Magnitude
        distance = math.round(distance)
        text = "["..tostring(distance).." studs]"
        local _, vis = camera:WorldToViewportPoint(hrp.Position)
        VIS = vis
        dist.Visible = vis
    else
        dist.Visible = false
        return
    end

    if VIS then
        dist.Outline = config.Distance.Outlines
        dist.OutlineColor = config.Distance.OutlinesColor
        dist.Color = config.Distance.Color
        dist.Text = text
        dist.Position = Vector2.new(maxX - ((maxX - minX)/2), maxY + dist.TextBounds.Y/2 + config.TextPadding)
    end
end

local fovcircle = drawFov()
local line = Drawing.new("Line")
line.Thickness = 2
local whilecont

Players.PlayerRemoving:Connect(function(plr)
    if plr == Players.LocalPlayer then
        whilecont:Disconnect()
        if line then
            line:Remove()
        end

        if fovcircle then
            fovcircle:Remove()
        end
        
        for _,v in pairs(boxes) do
            if typeof(v[1]) == 'table' then -- corner esp {{espLines}, plr}
                for _,line in pairs(v) do
                    line:Remove()
                end
                continue
            end
        end
        table.clear(boxes)
    end

    for i,v in pairs(boxes) do
        if v[2] == plr then
            if typeof(v[1]) == 'table' then -- corner esp
                for _,line in pairs(v[1]) do
                    line:Remove()
                end
                continue
            end
            table.remove(boxes, i)
            break
        end
    end

    for i,v in pairs(healthbars) do
        if v[2] == plr then
            for _,barpart in pairs(v[1]) do
                barpart:Remove()
            end
            table.remove(healthbars, i)
            break
        end
    end
    for i,v in pairs(usernames) do
        if v[2] == plr then
            v[1]:Remove()
            table.remove(usernames, i)
            break
        end
    end
    for i,v in pairs(dists) do
        if v[2] == plr then
            v[1]:Remove()
            table.remove(dists, i)
            break
        end
    end
end)

Players.PlayerAdded:Connect(function(plr)
    local char = plr.Character or plr.CharacterAdded:Wait()
    if config.Box.BoxType == "Corner" then
        local TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB = drawCornerBoundingBox(char)
        adjustCorners(plr, TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB)
        table.insert(boxes, {{TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB}, plr})
    elseif config.Box.BoxType == "Box" then
        local box, bg = drawBoundingBox(char)
        adjustBoundingBox(plr, box, bg)
        table.insert(boxes, {{box, bg}, plr})
    end
    if config.Healthbar.Enabled then
        local foreground, background = drawHealthBar(char)
        updateHealthBar(char, foreground, background)
        table.insert(healthbars, {{foreground, background}, plr})
    end
    if config.Name.Enabled then
        local username = drawUsername(char)
        updateUsername(char, username)
        table.insert(usernames, {username, plr})
    end
    if config.Distance.Enabled then
        local dist = drawDistance(char)
        updateDistance(char, dist)
        table.insert(dists, {dist, plr})
    end
end)

--init boxes
for _,v in pairs(Players:GetChildren()) do
    if v == Players.LocalPlayer then continue end -- localplayer check
    local char = v.Character
    if char then
        if config.Box.BoxType == "Corner" then
            local TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB = drawCornerBoundingBox(char)
            adjustCorners(v, TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB)
            table.insert(boxes, {{TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB}, v})
        elseif config.Box.BoxType == "Box" then
            local box, bg = drawBoundingBox(char)
            adjustBoundingBox(v, box, bg)
            table.insert(boxes, {{box, bg}, v})
        end
        if config.Healthbar.Enabled then
            local foreground, background = drawHealthBar(char)
            updateHealthBar(char, foreground, background)
            table.insert(healthbars, {{foreground, background}, v})
        end
        if config.Name.Enabled then
            local username = drawUsername(char)
            updateUsername(char, username)
            table.insert(usernames, {username, v})
        end
        if config.Distance.Enabled then
            local dist = drawDistance(char)
            updateDistance(char, dist)
            table.insert(dists, {dist, v})
        end
    end
end

local partsizes = {
    ["Head"] = Vector3.new(1,1,1),
    ["Torso"] = Vector3.new(2,2,1),
    ["HumanoidRootPart"] = Vector3.new(2,2,1)
}

local function expand(char, plr)
    if plr and (plr == lp or plr.Team.Name == "Neutral" or plr.Team == lp.Team)then return end
    if not plr then return end
    if not char then warn("char could not be found"); return end
    local part = char:FindFirstChild(config.Hitbox.Part)
    print(config.Hitbox.Part, char:FindFirstChild(config.Hitbox.Part))
    if part == nil then warn("Failed to expand", char); return end

    if config.Hitbox.Enabled == false then
        char.Head.Size = partsizes["Head"]
        char.Torso.Size = partsizes["Torso"]
        char.HumanoidRootPart.Size = partsizes["HumanoidRootPart"]
        return
    end

    for _,v in pairs(char:GetChildren()) do
        if v:IsA("BasePart") and partsizes[v.Name] and v.Size ~= partsizes[v.Name] and config.Hitbox.Part ~= v.Name then
            v.Size = partsizes[v.Name]
        end
    end
    part.Size = partsizes[part.Name] * config.Hitbox.Multiplier
end

local charaddedconnections = {}

-- init hitbox expander
for _,plr in pairs(Players:GetChildren()) do
    local char = plr.Character
    expand(char, plr)
    charaddedconnections[plr] = plr.CharacterAdded:Connect(function(char)
        expand(char, plr)
    end)
end

if lp.Team.Name ~= "Neutral" and config.GunMods.InstantHit then
    applyGunMods()
end
lp.CharacterAdded:Connect(function(char)
    local applied = false
    char.ChildAdded:Connect(function(child)
        if child:IsA("Tool") and child:FindFirstChild("Shoot") and not applied then -- is it a gun?
            applied = true
            applyGunMods()
        end
    end)
end)

Players.PlayerAdded:Connect(function(plr)
    local char = plr.Character
    expand(char, plr)
    charaddedconnections[plr] = plr.CharacterAdded:Connect(function(char)
        expand(char, plr)
    end)
end)

Players.PlayerRemoving:Connect(function(plr)
    if charaddedconnections[plr] then
        charaddedconnections[plr]:Disconnect()
        charaddedconnections[plr] = nil
    end
end)

whilecont = runservice.RenderStepped:Connect(function()
    updateTarget()
    local plr, pos = getnearestplr()

    for _,v in pairs(Players:GetChildren()) do
        if v == lp then continue end
        local char = v.Character
        if char then
            for i,j in pairs(healthbars) do
                if j[2] == v then
                    updateHealthBar(char, j[1][1], j[1][2])
                end
            end
            for i,j in pairs(boxes) do
                if j[2] == v then
                    if config.Box.BoxType == "Corner" then -- corner
                        if #j[1] == 16 then -- box has been fully drawn
                            adjustCorners(v, table.unpack(j[1]))
                        end
                    else -- box
                        adjustBoundingBox(v, j[1][1], j[1][2])
                    end
                    break
                end
            end
            for i,j in pairs(usernames) do
                if j[2] == v then
                    updateUsername(char, j[1])
                end
            end
            for i,j in pairs(dists) do
                if j[2] == v then
                    updateDistance(char, j[1])
                end
            end
        end
    end

    if config.Silent.FOV then
        fovcircle.Visible = true
        fovcircle.Position = Vector2.new(mouse.X, mouse.Y + Y_Offset)
        fovcircle.Color = config.Silent.FOVColor
        fovcircle.Radius = config.Silent.FOVSize
    else
        fovcircle.Visible = false
    end
    if plr and pos and config.Silent.TargetLine then
        line.Visible = true
        line.Color = config.Silent.TargetLineColor
        line.From = Vector2.new(mouse.X, mouse.Y + Y_Offset)
        line.To = pos
    else
        line.Visible = false
    end
end)

local hooked = false
if lp.Team.Name ~= "Neutral" then
    for _, f in pairs(getgc(true)) do
        if typeof(f) == "function" and islclosure(f) and getinfo(f).name == "Registration" then
            hooked = true
            local original
            original = hookfunction(f, function(...)
                local args = table.pack(...)
                if target == nil or config.Silent.Enabled == false then
                    return original(unpack(args, 1, args.n))
                end
                args[1] = target

                return original(unpack(args, 1, args.n))
            end)
        end
    end
    local gc = getgc()
    local c = {"workspace", "Vehicles", "RocketLauncher", "GrenadeLauncher"}

    local func
    for _,v in pairs(gc) do
        if typeof(v) == 'function' and not iscclosure(v) then
            local consts = getconstants(v)
            local found = 0
            for _,const in pairs(c) do
                if table.find(consts, const) then
                    found = found + 1
                end
            end
            if found == #c then
                func = v
            end
        end
    end

    if not func then warn("car penetration func not found - cars not penatrable") end

    if func then
        local old; old = hookfunction(func, function(...)
            if not config.GunMods.InfiniteWallbang then
                return old(...)
            end
            local args = {...}
            if args[2].Instance:IsDescendantOf(workspace.Vehicles) then
                return true
            end
            return old(...)
        end)
    end
else
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Waiting for Team Join",
        Text = "Please join a team! The UI will not load until you do!",
        Duration = 20
    })
    repeat task.wait() until lp.Team.Name ~= "Neutral"
    repeat task.wait() until lp.Backpack:FindFirstChildWhichIsA("Tool")
    task.wait(0.5)
    for _, f in pairs(getgc(true)) do
        if typeof(f) == "function" and islclosure(f) and getinfo(f).name == "Registration" then
            hooked = true
            local original
            original = hookfunction(f, function(...)
                local args = table.pack(...)
                if target == nil or config.Silent.Enabled == false then
                    return original(unpack(args, 1, args.n))
                end
                args[1] = target

                return original(unpack(args, 1, args.n))
            end)
        end
    end
end
if not hooked then
    Players.LocalPlayer:Kick("Silent Aim Function not found, please rejoin!")
end


local function getWeapon()
    local weapon = nil
    local char = lp.Character

    if not char then return nil end

    for _,tool in pairs(char:GetChildren()) do
        if tool:IsA("Tool") and tool:FindFirstChild("IsWeapon") and tool.IsWeapon.Value then
            weapon = tool
            break
        end
    end

    return weapon
end

local function getAmmo(weapon)
    local ammo = {}
    local MaxAmmo = weapon:WaitForChild("MaxAmmo").Value
    local magFolder = weapon:WaitForChild("Magazines"):GetChildren()
    ammo.CurrentMag = weapon:WaitForChild("CurrentMagazine").Value.Value
    local magCount = #magFolder
    local emptiedMags = 0
    
    for _,mag in pairs(magFolder) do
        if mag.Value < MaxAmmo and mag ~= ammo.CurrentMag then
            emptiedMags += 1
        end
    end

    ammo.PercentageEmpty = emptiedMags/magCount * 100
    ammo.MaxAmmo = MaxAmmo
    return ammo
end

local function reload(weapon)
    local reloadTime = weapon.ReloadTime.Value
    weapon.Reloading.Value = true
    local weaponRemote = game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Weapon")
    weaponRemote:FireServer("Reload")
    task.wait(reloadTime)
    weaponRemote:FireServer("Reload")
    weapon.Reloading.Value = false
end

local function getAmmoBox()
    local closest = nil
    local char = lp.Character

    if not char then return nil end

    for _,box in pairs(game.Workspace.AmmoCrates:GetChildren()) do
        if closest == nil or (char.HumanoidRootPart.Position - closest.Position).Magnitude > (char.HumanoidRootPart.Position - box.Position).Magnitude then
            closest = box
        end
    end

    return closest
end

local function refill()
    local ammoBox = getAmmoBox()

    if ammoBox == nil then return end

    local weapon = getWeapon()

    if weapon == nil then return end

    local ammo = getAmmo(weapon) -- ammo.CurrentMag, ammo.PercentageEmpty, ammo.MaxAmmo

    if ammo.PercentageEmpty >= config.GunMods.AutoRefillPercent then
        table.foreach(ammo, print)
        if ammo.CurrentMag < ammo.MaxAmmo then
            reload(weapon) -- does this wait until its done first?
        end

        local tempCFrame = lp.Character.HumanoidRootPart.CFrame
        lp.Character:PivotTo(ammoBox.CFrame)
        task.wait(0.1)
        fireproximityprompt(ammoBox.ProximityPrompt)
        task.wait(0.1)
        lp.Character:PivotTo(tempCFrame)
    end
end

task.spawn(function()
    while task.wait(1) do
        if config.GunMods.AutoRefill then
            refill()
        end
    end
end)

-- FUNCTIONS --

local SilentAim = CombatTab:AddLeftGroupbox("Silent Aim", "locate-fixed")
local Hitboxes = CombatTab:AddRightGroupbox("Hitboxes", "expand")

-- SILENT AIM START
local ToggleSilent = SilentAim:AddCheckbox("ToggleSilent", {
    Text = "Toggle Silent Aim",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Silent.Enabled = Value
    end
})

local SilentHPCheck = SilentAim:AddCheckbox("SilentHPCheck", {
    Text = "Check Target HP",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Silent.HPCheck = Value
    end
})

local SilentTeamCheck = SilentAim:AddCheckbox("SilentTeamCheck", {
    Text = "Check Target Team",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Silent.TeamCheck = Value
    end
})

local SilentVisCheck = SilentAim:AddCheckbox("SilentVisCheck", {
    Text = "Check Target Visible",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Silent.VisibleCheck = Value
    end
})

local ToggleFOV = SilentAim:AddCheckbox("ToggleFOV", {
    Text = "Toggle Field of View",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Silent.FOV = Value
    end
})

local FOVSlider = SilentAim:AddSlider("FOVSlider", {
    Text = "Field of View",
    Default = 150,
    Min = 1,
    Max = 400,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.Silent.FOVSize = Value
    end
})

local FOVColorPicker = ToggleFOV:AddColorPicker("FOVColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "FOV Circle Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Silent.FOVColor = Value
    end
})

local DrawTargetLine = SilentAim:AddCheckbox("DrawTargetLine", {
    Text = "Draw Target Line",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Silent.TargetLine = Value
    end
})

local TargetLineColorPicker = DrawTargetLine:AddColorPicker("TargetLineColorPicker", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Target Line Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Silent.TargetLineColor = Value
    end
})
-- SILENT AIM END

-- HITBOXES START
local ToggleHitboxExpand = Hitboxes:AddCheckbox("ToggleHitboxExpand", {
    Text = "Toggle Hitbox Expander",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Hitbox.Enabled = Value
        for _,plr in pairs(Players:GetChildren()) do
            local char = plr.Character
            expand(char)
        end
    end
})

local HitboxMultiplierSlider = Hitboxes:AddSlider("HitboxMultiplierSlider", {
    Text = "Hitbox Size Multiplier",
    Default = 10,
    Min = 1,
    Max = 1000,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.Hitbox.Multiplier = Value
        for _,plr in pairs(Players:GetChildren()) do
            local char = plr.Character
            expand(char)
        end
    end
})

local HitboxTargetPart = Hitboxes:AddDropdown("HitboxTargetPart", {
    Values = {"Head", "Torso", "HumanoidRootPart"},
    Default = 1, -- Index of the default option
    Multi = false, -- Whether to allow multiple selections
    Text = "Hitbox Expander Target",
    Tooltip = "The hitbox part that will be expanded",
    Callback = function(Value)
        config.Hitbox.Part = Value -- IMPORTANT
        for _,plr in pairs(Players:GetChildren()) do
            local char = plr.Character
            expand(char)
        end
    end
})
-- HITBOXES END

local GunMods = ModsTab:AddLeftGroupbox("Gun Mods", "bow-arrow")

-- GUN MODS START
local ToggleInfiniteWallbang = GunMods:AddCheckbox("ToggleInfiniteWallbang", {
    Text = "Toggle Infinite Wallbang",
    Default = false,
    Tooltip = "Permanent until respawn (if you toggled off before dying)!",
    Callback = function(Value) -- IMPORTANT
        config.GunMods.InfiniteWallbang = Value
    end
})

local ToggleInstantHit = GunMods:AddCheckbox("ToggleInstantHit", {
    Text = "Toggle Instant Hit",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.GunMods.InstantHit = Value
        applyGunMods()
    end
})

local ToggleRecoil = GunMods:AddCheckbox("ToggleRecoil", {
    Text = "Toggle No Recoil",
    Default = false,
    Tooltip = "Permanent",
    Callback = function(Value) -- IMPORTANT
        config.GunMods.RecoilEnabled = Value
        game:GetService("RunService"):UnbindFromRenderStep("recoil")

        local bind = game:GetService("RunService").BindToRenderStep
        hookfunction(bind, function(name, ...)
            if name == "recoil" then return end
            return bind(name, ...)
        end)
    end
})

local ToggleAutoRefill = GunMods:AddCheckbox("ToggleAutoRefill", {
    Text = "Toggle Auto Refill",
    Default = false,
    Tooltip = "Automatically refills your ammo from ammo boxes when below a certain percentage of ammo",
    Callback = function(Value) -- IMPORTANT
        config.GunMods.AutoRefill = Value
    end
})

local AutoRefillPercent = GunMods:AddSlider("AutoRefillPercent", {
    Text = "Auto Refill Minimum Empty %",
    Default = 50,
    Min = 0,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.GunMods.AutoRefillPercent = Value
    end
})


-- GUN MODS END

local ESP = VisualsTab:AddLeftGroupbox("ESP", "square-dashed")
local Flags = VisualsTab:AddRightGroupbox("Flags", "flag")

-- ESP START

local DrawBoxes = ESP:AddCheckbox("DrawBoxes", {
    Text = "Draw Boxes",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Box.Enabled = Value
    end
})

local BoxesType = ESP:AddDropdown("BoxesType", {
    Values = {"Box", "Corner"},
    Default = 1, -- Index of the default option
    Multi = false, -- Whether to allow multiple selections
    Text = "ESP Box Type",
    Tooltip = "The type of Box ESP to be drawn",
    Callback = function(Value)
        config.Box.BoxType = Value -- IMPORTANT
        for _,v in pairs(boxes) do
            if typeof(v[1]) == 'table' then -- corner esp {{espLines}, plr}
                for _,line in pairs(v[1]) do
                    line:Remove()
                end
                continue
            end
        end
        table.clear(boxes)
        for _,v in pairs(Players:GetChildren()) do
            if v == lp then continue end
            local char = v.Character
            if not char then print("continued"); continue end
            if config.Box.BoxType == "Corner" then
                local TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB = drawCornerBoundingBox(char)
                adjustCorners(v, TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB)
                table.insert(boxes, {{TopLeftA, TopLeftB, TopRightA, TopRightB, BottomLeftA, BottomLeftB, BottomRightA, BottomRightB, BGTopLeftA, BGTopLeftB, BGTopRightA, BGTopRightB, BGBottomLeftA, BGBottomLeftB, BGBottomRightA, BGBottomRightB}, v})
            elseif config.Box.BoxType == "Box" then
                local box, bg = drawBoundingBox(char)
                adjustBoundingBox(v, box, bg)
                table.insert(boxes, {{box, bg}, v})
            end
        end
    end
})

local BoxesOutline = ESP:AddCheckbox("BoxesOutline", {
    Text = "Draw Box Outlines",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Box.Outlines = Value
    end
})

local BoxesOutlineColor = BoxesOutline:AddColorPicker("BoxesOutlineColor", {
    Default = Color3.fromRGB(0, 0, 0),
    Title = "Box Outline Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Box.OutlinesColor = Value
    end
})

local BoxesThickness = ESP:AddSlider("BoxesThickness", {
    Text = "Box Thickness",
    Default = 1,
    Min = 1,
    Max = 5,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.Box.Thickness = Value
    end
})

local CornerLength = ESP:AddSlider("CornerLength", {
    Text = "Corner Length [%]",
    Default = 50,
    Min = 1,
    Max = 100,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.Box.CornerLength = Value/100
    end
})

local BoxesColor = DrawBoxes:AddColorPicker("BoxesColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Box Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Box.Color = Value
    end
})

-- healthbars

ESP:AddDivider()

local DrawHealthbar = ESP:AddCheckbox("DrawHealthbar", {
    Text = "Draw Healthbars",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Healthbar.Enabled = Value
        for _, plr in pairs(Players:GetChildren()) do
            local char = plr.Character
            local drawnew = true
            for _,v in pairs(healthbars) do
                if v[2] == plr then
                    drawnew = false
                end
            end
            if config.Healthbar.Enabled and drawnew then
                local foreground, background = drawHealthBar(char)
                updateHealthBar(char, foreground, background)
                table.insert(healthbars, {{foreground, background}, plr})
            end
        end
    end
})

local DrawHealthbarBackground = ESP:AddCheckbox("DrawHealthbarBackground", {
    Text = "Draw Healthbar Background",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Healthbar.Background = Value
    end
})

local HealthbarColor = DrawHealthbar:AddColorPicker("HealthbarColor", {
    Default = Color3.fromRGB(0, 255, 0),
    Title = "Healthbar Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Healthbar.Color = Value
    end
})

local HealthbarBackgroundColor = DrawHealthbarBackground:AddColorPicker("HealthbarBackgroundColor", {
    Default = Color3.fromRGB(0, 0, 0),
    Title = "Healthbar Background Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Healthbar.BackgroundColor = Value
    end
})

local HealthbarPadding = ESP:AddSlider("HealthbarPadding", {
    Text = "Healthbar Padding",
    Default = 2,
    Min = 0,
    Max = 10,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.Healthbar.Padding = Value
    end
})

local HealthbarThickness = ESP:AddSlider("HealthbarThickness", {
    Text = "Healthbar Thickness",
    Default = 2,
    Min = 1,
    Max = 10,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.Healthbar.Thickness = Value
    end
})

local HealthbarSize = ESP:AddSlider("HealthbarSize", {
    Text = "Healthbar Size",
    Default = 5,
    Min = 0,
    Max = 10,
    Rounding = 0,
    Compact = false,
    Callback = function(Value) -- IMPORTANT
        config.Healthbar.Size = Value
    end
})

-- ESP END

-- FLAGS START

local ToggleNames = Flags:AddCheckbox("ToggleNames", {
    Text = "Toggle Name",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Name.Enabled = Value
        for _, plr in pairs(Players:GetChildren()) do
            local char = plr.Character
            local drawnew = true
            for _,v in pairs(usernames) do
                if v[2] == plr then
                    drawnew = false
                end
            end
            if config.Name.Enabled and drawnew then
                local username = drawUsername(char)
                updateUsername(char, username)
                table.insert(usernames, {username, plr})
            end
        end
    end
})

local ToggleDistance = Flags:AddCheckbox("ToggleDistance", {
    Text = "Toggle Distance",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Distance.Enabled = Value
        for _, plr in pairs(Players:GetChildren()) do
            local char = plr.Character
            local drawnew = true
            for _,v in pairs(dists) do
                if v[2] == plr then
                    drawnew = false
                end
            end
            if config.Distance.Enabled and drawnew then
                local Distance = drawDistance(char)
                updateDistance(char, Distance)
                table.insert(dists, {Distance, plr})
            end
        end
    end
})

local ToggleNamesOutlines = Flags:AddCheckbox("ToggleNamesOutlines", {
    Text = "Toggle Name Outlines",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Name.Outlines = Value
    end
})

local ToggleDistanceOutlines = Flags:AddCheckbox("ToggleDistanceOutlines", {
    Text = "Toggle Distance Outlines",
    Default = false,
    Callback = function(Value) -- IMPORTANT
        config.Distance.Outlines = Value
    end
})

local NameColor = ToggleNames:AddColorPicker("NameColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Name Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Name.Color = Value
    end
})

local DistanceColor = ToggleDistance:AddColorPicker("DistanceColor", {
    Default = Color3.fromRGB(255, 255, 255),
    Title = "Distance Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Distance.Color = Value
    end
})

local NameOutlineColor = ToggleNamesOutlines:AddColorPicker("NameOutlineColor", {
    Default = Color3.fromRGB(0, 0, 0),
    Title = "Name Outline Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Name.OutlinesColor = Value
    end
})

local DistanceOutlineColor = ToggleDistanceOutlines:AddColorPicker("DistanceOutlineColor", {
    Default = Color3.fromRGB(0, 0, 0),
    Title = "Distance Outline Color",
    Transparency = 0, -- 0 to 1

    Callback = function(Value) -- IMPORTANT
        config.Distance.OutlinesColor = Value
    end
})

-- FLAGS END

-- SETTINGS START
local SaveBox = UISettingsTab:AddLeftGroupbox("Menu Configuration", "wrench")

SaveBox:AddLabel("Menu bind")
	:AddKeyPicker("MenuKeybind", { Default = "RightShift", NoUI = true, Text = "Menu keybind" })

SaveBox:AddToggle("ShowCustomCursor", {
	Text = "Custom Cursor",
	Default = true,
	Callback = function(Value)
		Library.ShowCustomCursor = Value
	end,
})

Library.ToggleKeybind = Options.MenuKeybind
