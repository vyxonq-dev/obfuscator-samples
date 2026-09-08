if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> (...any)) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = (identifyexecutor and select(2, pcall(identifyexecutor))) and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-notifications/refs/heads/main/main.luau"))();

if not (hookfunction and (filtergc or (getgc and debug.getconstants)) and require) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not (filtergc and (getgc and debug.getconstants)) and "filtergc getgc debug.getconstants" or "") .. (not require and "require" or "");
    SG["error"](err);
    return error(err);
end;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local filter: (script: (LocalScript|ModuleScript)?, strict: boolean, ...any) -> ((...any) -> (...any)) = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-filtergc/refs/heads/main/main.luau"))();

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3, gun: Tool): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    rp.FilterDescendantsInstances = {char, gun, workspace.Terrain};

    local dir = part.Position - origin;
    local result: RaycastResult = workspace:Raycast(origin, dir, rp);
    if not result then return true, nil; end;

    if result.Instance:IsDescendantOf(part.Parent) then
        return true, result.Instance;
    end;

    return false, result.Instance;
end;

local getTarget = function(origin: Vector3, gun: Tool)
    local cPart, cDistance = nil, getgenv().fov or 300;

    for _, player: Player in next, Players:GetPlayers() do
        if player == plr then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) or char:FindFirstChild("tm") then continue; end;

        local tPart: BasePart = char:FindFirstChild("Head") or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        local v, nTPart = isVisible(tPart, origin);
        if not v then
            v, nTPart = isVisible(char.PrimaryPart or char:FindFirstChild("HumanoidRootPart"), origin);
            if not v then continue; end;
        end;

        if nTPart then tPart = nTPart; end;

        local distance = (Vector2.new(pos.X, pos.Y) - (isMobile and Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2) or UIS:GetMouseLocation())).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;

    return cPart;
end;

loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-fov-lib/refs/heads/main/main.luau"))()(getgenv().fov or 300, getTarget, true);

local cache = {};
local c: RBXScriptConnection;

local hook = function(gun, handle)
    local f = filter(nil, false, "RaycastParams", "new", "Enum", "RaycastFilterType", "Exclude", Enum.RaycastFilterType.Exclude, "Raycast", "CastRay");
    if not f then
        SG["error"]("Failed to find function");
        return;
    end;

    local old; old = clonefunction(hookfunction(f, newcclosure(function(...)
        local c = getTarget(handle:FindFirstChild("GunFirePoint").WorldPosition, gun);
        if c then
            return c.Position;
        end;
        return old(...);
    end)));

    if restorefunction and isfunctionhooked then
        plr.CharacterRemoving:Once(function()
            if f and isfunctionhooked(f) then
                restorefunction(f);
            end;
        end);
    end;
end;

local setup = function(char)
    table.clear(cache);
    if c then c:Disconnect(); c = nil; end;

    c = char.ChildAdded:Connect(function(child)
        if not cache[child] and child:IsA("Tool") and child:FindFirstChild("Handle") and child:FindFirstChild("GunScript_Local") and child:FindFirstChild("Setting") then
            cache[child] = true;
            rawset(require(child.Setting), "JamChance", 0);
            hook(child, child.Handle)
        end;
    end);

    local gun = char:FindFirstChildOfClass("Tool");
    if gun and gun:FindFirstChild("Handle") and gun:FindFirstChild("GunScript_Local") and gun:FindFirstChild("Setting") then
        cache[gun] = true;
        rawset(require(gun.Setting), "JamChance", 0);
        hook(gun, gun.Handle);
    end;
end;

if plr.Character then setup(plr.Character); end;

plr.CharacterAdded:Connect(setup);

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
