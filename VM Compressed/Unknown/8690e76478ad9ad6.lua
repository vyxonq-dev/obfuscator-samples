if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local executor = identifyexecutor and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/NOTIFICATION_LIBRARY/main.luau"))();

if not (hookfunction and run_on_actor and getsenv and debug.getupvalue and debug.setupvalue) then
    SG["error"](executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not run_on_actor and "run_on_actor " or "") .. (not getsenv and "getsenv " or "") .. (not debug.getupvalue and "debug.getupvalue " or "") .. (not debug.setupvalue and "debug.setupvalue" or ""));
    return;
end;

local Players: Players = cloneref(game:GetService("Players"));

local plr = Players.LocalPlayer;

local acs = workspace:FindFirstChild("ACS_WorkSpace");
if not acs then
    SG["error"]("Script needs updating");
    return;
end;

local client, server = acs:FindFirstChild("Client"), acs:FindFirstChild("Server");
if not (client and server) then
    SG["error"]("Script needs updating");
    return;
end;

local max = 100;
local payload = [[
local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> (...any)) return f; end;
local newcclosure = newcclosure or clonefunction;

local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local a: Actor, s: LocalScript, wallcheck: boolean, fov: number, silent_aim: boolean, SG, cli, ser = ...;
getgenv().sneeky_wallcheck = wallcheck;
getgenv().sneeky_fov_size = fov;
getgenv().sneeky_silent_aim = silent_aim;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    rp.FilterDescendantsInstances = {char, cli, ser};

    local origin = origin or cam.CFrame.Position;

    local dir = part.Position - origin;
    local result: RaycastResult = workspace:Raycast(origin, dir, rp);
    if not result then return true, nil; end;

    if result.Instance:IsDescendantOf(part.Parent) then
        return true, result.Instance;
    end;

    return false, result.Instance;
end;

local getTarget = function(origin: Vector3): BasePart
    if not getgenv().sneeky_silent_aim then return nil; end;
    local cPart, cDistance = nil, getgenv().sneeky_fov_size;

    for _, player: Player in next, Players:GetPlayers() do
        if player == plr then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

        local tPart: BasePart = char:FindFirstChild("Head") or char:FindFirstChild("UpperTorso") or char.PrimaryPart;
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        if getgenv().sneeky_wallcheck then
            local v, nTPart = isVisible(tPart, origin);
            if not v then
                v, nTPart = isVisible(char:FindFirstChild("UpperTorso") or char.PrimaryPart, origin);
                if not v then continue; end;
            end;

            if nTPart then tPart = nTPart; end;
        end;

        local distance = (Vector2.new(pos.X, pos.Y) - UIS:GetMouseLocation()).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;

    return cPart;
end;

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size, getTarget, true);

local inject = function()
    clonefunction(hookfunction(rawget(getsenv(s), "resetMods"), function() end));
    clonefunction(hookfunction(rawget(getsenv(s), "setMods"), function() end));
    clonefunction(hookfunction(rawget(getsenv(s), "Recoil"), function() return true; end));
    local trc = rawget(getsenv(s), "ThrowRayCast");
    local ids = debug.getupvalue(trc, 1);
    debug.setupvalue(trc, 17, {
        ZoomValue = 70,
        Zoom2Value = 70,
        AimRM = 1,
        SpreadRM = 0,
        DamageMod = 1,
        minDamageMod = 1,
        MinRecoilPower = 0,
        MaxRecoilPower = 0,
        RecoilPowerStepAmount = 1,
        MinSpread = 0,
        MaxSpread = 0,
        AimInaccuracyStepAmount = 1,
        AimInaccuracyDecrease = 1,
        WalkMult = 2,
        adsTime = 1,
        MuzzleVelocity = 1,
        camRecoilMod = {
            RecoilTilt = 0,
            RecoilUp = 0,
            RecoilLeft = 0,
            RecoilRight = 0
        },
        gunRecoilMod = {
            RecoilUp = 0,
            RecoilTilt = 0,
            RecoilLeft = 0,
            RecoilRight = 0
        }
    });
    local cache = {};
    local old; old = clonefunction(hookfunction(trc, newcclosure(function(_, bullet, origin)
        if cache[bullet] then
            task.cancel(cache[bullet]);
            cache[bullet] = nil;
        end;
        local c = getTarget(origin);
        if c then
            cache[bullet] = task.defer(function()
                while c and bullet and c.Parent and bullet.Parent do
                    bullet.Position = c.Position;
                    task.wait();
                end;
                cache[bullet] = nil;
            end);
        end;

        return old(_, bullet, origin);
    end)));
    if setstackhidden then setstackhidden(trc, true); end;
    setfenv(trc, rawset(getfenv(trc), "getfenv", newcclosure(function()
        return {
            [rawget(ids, "Var")] = rawget(ids, "Value")
        };
    end)));
end;

task.delay(1, inject);
plr.CharacterAdded:Connect(function()
    task.delay(1, inject);
end);
]];

SG["info"]("Injecting...");
task.delay(1, function()
    local a: Actor;
    if get_actors then
        for _, v in next, get_actors() do
            if v.Parent == plr.PlayerScripts then
                a = v;
                break;
            end;
        end;
    else
        a = plr.PlayerScripts:FindFirstChildOfClass("Actor");
    end;

    if not a then
        SG["error"]("Couldn't find active actor!");
        return;
    end;

    local s = a:FindFirstChildOfClass("LocalScript");
    if not s then
        SG["error"]("Couldn't get script!");
        return;
    end

    local retries = 0;
    local injected = false;

    while retries < max do
        local s, err = pcall(run_on_actor, a, payload, a, s, getgenv().sneeky_wallcheck or false, getgenv().sneeky_fov_size or 300, getgenv().sneeky_silent_aim or true, SG, client, server);
        if s then
            injected = true;
            break;
        --[[else
            SG["error"](err);]]
        end;

        retries += 1;
        task.wait(0.05);
    end;

    if not injected and retries >= max then
        SG["error"]("Failed to inject payload to " .. a:GetFullName());
        return;
    end;

    SG["success"]("Silent aim successfully injected and executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
end);
