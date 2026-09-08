if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> ...any) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = identifyexecutor and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/NOTIFICATION_LIBRARY/main.luau"))();

if not (hookfunction and require) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not require and "require" or "");
    SG["error"](err);
    return error(err);
end;

local Players: Players = cloneref(game:GetService("Players"));
local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local s, firearm = pcall(require, plr.PlayerScripts.Code.components.firearm.clientFirearmTool);
if not s then
    return warn(executor .. " returned an error while trying to require plr.PlayerScripts.Code.components.firearm.clientFirearmTool:\n" .. firearm);
end;

local s2, producer = pcall(require, plr.PlayerScripts.Code.producer);
if not s2 then
    return warn(executor .. " returned an error while trying to require plr.PlayerScripts.Code.producer:\n" .. producer);
end;

local s3, stamina = pcall(require, plr.PlayerScripts.Code.controllers.character.characterStaminaController);
if not s3 then
    return warn(executor .. " returned an error while trying to require plr.PlayerScripts.Code.controllers.character.characterStaminaController:\n" .. stamina);
end;

--local shoot: RemoteEvent = RS:FindFirstChild("EJw") and RS:FindFirstChild("EJw")["7c113b14-5efb-4b43-bf60-fbc75c83d778"];
local vehicles: Folder = workspace:FindFirstChild("Vehicles");
if not vehicles then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

local teams = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/Emergency_Hamburg/Teams.luau"))();

local gunlist: {[string]: boolean}, connections: {[string]: RBXScriptConnection | {added: RBXScriptConnection, removed: RBXScriptConnection}}, threads: {[string]: thread} = {}, {}, {};

local check = function(t: Tool) return t:IsA("Tool") and ((t:GetAttribute("AimDelay") and t:GetAttribute("Damage")) or t:GetAttribute("DamageType")) ~= nil; end;

local setup = function(char: Model, id: string)
    if char == plr.Character then return; end;

    if connections[id] then
        connections[id].added:Disconnect();
        connections[id].removed:Disconnect();
        table.clear(connections[id]);
    end;

    local t = char:FindFirstChildOfClass("Tool");
    if t and check(t) then
        gunlist[id] = true;
        if threads[id] then coroutine.close(threads[id]); threads[id] = nil; end;
    end;

    connections[id] = {
        ["added"] = char.ChildAdded:Connect(function(c)
            if check(c) then
                gunlist[id] = true;
                if threads[id] then coroutine.close(threads[id]); threads[id] = nil; end;
            end;
        end),
        ["removed"] = char.ChildRemoved:Connect(function(c)
            if check(c) then
                threads[id] = task.delay(30, function()
                    gunlist[id] = false;
                end);
            end;
        end)
    };
end;

for _, v: Player in next, Players:GetPlayers() do
    local char = v.Character;
    local id = tostring(v.UserId);
    if char then setup(char, id); end;

    connections[id.."_char"] = v.CharacterAdded:Connect(function(_char)
        setup(_char, id);
    end);
end;

Players.PlayerAdded:Connect(function(_plr)
    local id = tostring(_plr.UserId);
    connections[id.."_char"] = _plr.CharacterAdded:Connect(function(_char)
        setup(_char, id);
    end);
end);

Players.PlayerRemoving:Connect(function(_plr)
    local id = tostring(_plr.UserId);
    connections[id.."_char"]:Disconnect();
    connections[id.."_char"] = nil;
    if connections[id] then
        connections[id].added:Disconnect();
        connections[id].removed:Disconnect();
        table.clear(connections[id]);
        connections[id] = nil;
    end;
    if threads[id] then coroutine.close(threads[id]); threads[id] = nil; end;
    gunlist[id] = nil;
end);

local isWanted = function(player: Player)
    local _producer = rawget(producer, "producer");
    if _producer then
        local id = tostring(player.UserId);

        local data = rawget(rawget(rawget(_producer:getState(), "wantedData"), "data"), player.Name);
        if data then
            local wl = rawget(data, "wantedLevel");
            if wl and (wl >= 4 or gunlist[id]) then
                return true;
            end;
        end;
    end;

    return false;
end;

local isSameTeam = function(player: Player)
    local _1 = (plr.Team and teams[plr.Team.Name]) or 2;
    local _2 = (plr.Team and teams[player.Team.Name]) or 2;

    if _2 == 2 then return true; end;

    if (_1 == 1 and _2 == 0 and isWanted(player)) or (_1 == 0 and _2 == 1 or isWanted(player)) then return false; end;

    return true;
end;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    rp.FilterDescendantsInstances = {char, vehicles};

    local origin = origin or cam.CFrame.Position;

    local dir = part.Position - origin;
    local result: RaycastResult = workspace:Raycast(origin, dir, rp);
    if not result then return true, nil; end;

    if result.Instance:IsDescendantOf(part.Parent) then
        return true, result.Instance;
    end;

    return false, result.Instance;
end;

local getTarget = function(origin: Vector3)
    if not getgenv().sneeky_silent_aim then return nil; end;
    local cPart, cDistance = nil, getgenv().sneeky_fov_size or 350;

    for _, player: Player in next, Players:GetPlayers() do
        if player == plr or isSameTeam(player) then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) or char:GetAttribute("IsCuffed") or char:GetAttribute("IsHeld") then continue; end;

        local tPart: BasePart = char:FindFirstChild("Head") or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        if getgenv().wallcheck then
            local v, nTPart = isVisible(tPart, origin);
            if not v then
                v, nTPart = isVisible(char.PrimaryPart or char:FindFirstChild("HumanoidRootPart"), origin);
                if not v then continue; end;
            end;

            if nTPart then tPart = nTPart; end;
        end;

        local distance = (Vector2.new(pos.X, pos.Y) - (isMobile and Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2) or UIS:GetMouseLocation())).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;

    return cPart;
end;

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size or 350, getTarget, true);

rawset(rawget(stamina, "CharacterStaminaController"), "getStamina", function() return math.huge; end); -- Got annoyed having to walk, enjoy!

local et = debug.getupvalue and debug.getupvalue(rawget(rawget(firearm, "ClientFirearmTool"), "shoot"), 1);

local old; old = clonefunction(hookfunction(rawget(rawget(firearm, "ClientFirearmTool"), "shoot"), newcclosure(function(gun)
    local _gun = gun;
    local origin = _gun:getOrigin();
    local c = getTarget(origin);
    _gun.attributes.Recoil = 0;
    _gun.attributes.Spread = 0;
    _gun.attributes.Instability = 0;
    if c and _gun.instance and _gun.crosshairController and _gun.projectileController then
        _gun:playShootAnimation();
        _gun:playFireEffects();
        if _gun.enableCombatHaptics and et then
            et[_gun.attributes.HapticEffect]:Play();
        end;
        task.spawn(function()
            _gun.crosshairController:showCrosshairOpen();
        end);
        _gun.projectileController:fireProjectile(_gun.instance.Name, origin, (c.Position - origin).Unit);
        return;
    end;

    return old(_gun);
end)));

SG["success"]("Script successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
