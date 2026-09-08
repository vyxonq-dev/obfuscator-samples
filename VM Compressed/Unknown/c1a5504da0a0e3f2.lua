if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> (...any)) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = (identifyexecutor and select(2, pcall(identifyexecutor))) and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-notifications/refs/heads/main/main.luau"))();

if not (hookfunction and require) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not require and "require" or "");
    SG["error"](err);
    return error(err);
end;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local mouse = plr:GetMouse();

local s, bfuncs = pcall(require, RS.shared.bFunctions);
if not s then
    return warn(executor .. " returned an error while trying to require RS.shared.bFunctions:\n" .. bfuncs);
end;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    local rp = RaycastParams.new();
    rp.FilterType = Enum.RaycastFilterType.Exclude;
    rp.FilterDescendantsInstances = {char};
    rp.IgnoreWater = true;

    local dir = part.Position - origin;
    local result: RaycastResult = workspace:Raycast(origin, dir, rp);
    if not result then return true, nil; end;

    if result.Instance:IsDescendantOf(part.Parent) then
        return true, result.Instance;
    end;

    return false, result.Instance;
end;

local getTarget = function(origin: Vector3)
    local cPart, cDistance = nil, math.huge;

    for _, player: Player in next, Players:GetChildren() do
        if player == plr or player.Team == plr.Team then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

        local tPart: BasePart?
		local _ = char:FindFirstChild("characterhitbox") or char.PrimaryPart;
        if char:FindFirstChild("helmet") then
            tPart = _;
        else
            tPart = char:FindFirstChild("HeadHitbox") or _;
        end;

        if not tPart then continue; end;
        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        local v, nTPart = isVisible(tPart, origin);
        if not v then
            v, nTPart = isVisible(_, origin);
            if not v then continue; end;
        end;

        if nTPart and nTPart.Name ~= "bullet_whizz" then tPart = nTPart; end;

        local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;
    
    return cPart;
end;

local old; old = clonefunction(hookfunction(rawget(bfuncs, "raycastline"), newcclosure(function(_, args)
    if rawget(args, "bullet") and rawget(args, "point") and rawget(args, "destination") then
        local c = getTarget(rawget(args, "point"));
        if c then
            local _args = args;
            _args.destination = c.Position - _args.point;
            return old(_, _args);
        end;
    end;
    return old(_, args);
end)));

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
