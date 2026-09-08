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

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local s, ac = pcall(require, RS.BulletFireSystem.FastCastRedux.ActiveCast);
if not s then
    return warn(executor .. " returned an error while trying to require RS.BulletFireSystem.FastCastRedux.ActiveCast:\n" .. ac);
end;

local gs, lps = workspace:FindFirstChild("Game Systems"), workspace:FindFirstChild("LocalPartStorage");
if not (gs and lps) then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    rp.FilterDescendantsInstances = {char, lps, gs:FindFirstChild("ACS_WorkSpace"), gs:FindFirstChild("Boat Workspace"), gs:FindFirstChild("Tank Workspace"), gs:FindFirstChild("Vehicle Workspace"), gs:FindFirstChild("Helicopter Workspace"), gs:FindFirstChild("Hovercraft Workspace"), gs:FindFirstChild("Plane Workspace"), gs:FindFirstChild("Gunship Workspace"), gs:FindFirstChild("Submarine Workspace"), gs:FindFirstChild("FireDamage")};

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
    local cPart, cDistance = nil, getgenv().sneeky_fov_size or 300;

    for _, player: Player in next, Players:GetPlayers() do
        if player == plr then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

        local tPart: BasePart = char:FindFirstChild("Head") or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        if getgenv().sneeky_wallcheck then
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

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size or 300, getTarget, true);

local old; old = clonefunction(hookfunction(rawget(ac, "new"), newcclosure(function(_, origin, __, ___, ...)
    local c = getTarget(origin);
    if c then
        local dir = c.Position - origin;
        return old(_, origin, dir, dir.Unit * 9e9, ...);
    end;
    return old(_, origin, __, ___, ...);
end)));

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
