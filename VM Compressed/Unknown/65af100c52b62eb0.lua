if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> ...any) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = identifyexecutor and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/NOTIFICATION_LIBRARY/main.luau"))();
local unpack = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UNPACK_LIBRARY/main.luau"))();

if not (hookfunction and getgc and require) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not getgc and "getgc " or "") .. (not require and "require" or "");
    SG["error"](err);
    return;
end;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3, gun: Tool): (boolean, Instance?, Vector3?)
    local char = plr.Character;
    if not (char and part) then return false, nil, nil; end;

    rp.FilterDescendantsInstances = {char, gun, workspace.Terrain, unpack((function()
        local out = {};
        for _, v in next, workspace:GetChildren() do
            if v.Name == "Arena" and v.ClassName == "Model" then
                out[#out+1] = v.walls;
            end;
        end;
        return out;
    end)())};

    local dir = part.Position - origin;
    local result: RaycastResult = workspace:Raycast(origin, dir, rp);
    if not result then return true, nil, nil; end;

    if result.Instance:IsDescendantOf(part.Parent) then
        return true, result.Instance, result.Position;
    end;

    return false, result.Instance, result.Position;
end;

local getTarget = function(origin: Vector3)
    if not getgenv().sneeky_silent_aim then return nil; end;
    local cPart, cDistance, cPos = nil, getgenv().sneeky_fov_size or 300, nil;

    for _, player: Player in next, Players:GetPlayers() do
        if player == plr then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) or char:FindFirstChild("tm") then continue; end;

        local tPart: BasePart = char:FindFirstChild("Head") or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        if not tPart then continue; end;

        local tPos = tPart.Position;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        local v, nTPart, nTPos = isVisible(tPart, origin);
        if not v then
            v, nTPart = isVisible(char.PrimaryPart or char:FindFirstChild("HumanoidRootPart"), origin);
            if not v then continue; end;
        end;

        if nTPart and nTPos then tPart = nTPart; tPos = nTPos; end;

        local distance = (Vector2.new(pos.X, pos.Y) - (isMobile and Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2) or UIS:GetMouseLocation())).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cPos = tPos;
            cDistance = distance;
        end;
    end;

    return cPart, cPos;
end;

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size or 300, getTarget, true);

local cache = {};

local hook = function(gsl: LocalScript, handle: BasePart)
    local f;
    do
        local i = 0;
        repeat
            task.spawn(function()
                for _, v in next, getgc() do
                    if type(v) == "function" then
                        local info = debug.getinfo(v);
                        if info.name == "CastRay" and info.short_src:lower():match("gunscript", 1) and not f then
                            f = v;
                            break;
                        end;
                    end;
                end;
            end);
            i+=1;
            task.wait();
        until f or i >= 50;
        if not f then
            SG["error"]("Failed to find function");
            return;
        end;
    end;

    local old; old = clonefunction(hookfunction(f, newcclosure(function(...)
        local c, pos = getTarget(handle:FindFirstChild("GunFirePoint").WorldPosition);
        if c and pos then
            return pos;
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

local c: RBXScriptConnection;
local setup = function(char)
    table.clear(cache);
    if c then c:Disconnect(); c = nil; end;

    c = char.ChildAdded:Connect(function(child)
        if not cache[child] and child:IsA("Tool") and child:FindFirstChild("Handle") and child:FindFirstChild("GunScript_Local") and child:FindFirstChild("Setting") then
            cache[child] = true;
            rawset(require(child.Setting), "JamChance", 0);
            hook(child.GunScript_Local, child.Handle)
        end;
    end);

    local gun = char:FindFirstChildOfClass("Tool");
    if gun and gun:FindFirstChild("Handle") and gun:FindFirstChild("GunScript_Local") and gun:FindFirstChild("Setting") then
        cache[gun] = true;
        rawset(require(gun.Setting), "JamChance", 0);
        hook(gun.GunScript_Local, gun.Handle);
    end;
end;

if plr.Character then setup(plr.Character); end;

plr.CharacterAdded:Connect(setup);

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
