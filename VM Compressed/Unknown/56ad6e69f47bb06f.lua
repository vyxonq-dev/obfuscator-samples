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
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));
local CS: CollectionService = cloneref(game:GetService("CollectionService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local s, wm = pcall(require, RS.WeaponModule);
if not s then
    return warn(executor .. " returned an error while trying to require RS.WeaponModule:\n" .. wm);
end;

local anon = debug.getupvalue(rawget(wm, "Shoot"), 3);
if not anon or typeof(anon) ~= "function" then
    for _, v in next, debug.getupvalues(rawget(wm, "Shoot")) do
        if type(v) == "function" then
            anon = v;
            break;
        end;
    end;
end;

if not anon then
    local err = "Failed to retrieve function";
    SG["error"](err);
    return warn(err);
end;

local cp = workspace:FindFirstChild("CosmeticProjectiles");
if not cp then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

local rp = RaycastParams.new();
rp.CollisionGroup = "Projectiles";
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    rp.FilterDescendantsInstances = CS:GetTagged("ShootThrough");
    rp.FilterDescendantsInstances[#rp.FilterDescendantsInstances+1] = char;
    rp.FilterDescendantsInstances[#rp.FilterDescendantsInstances+1] = cp;

    local origin = cam.CFrame.Position;

    local dir = part.Position - origin;
    local result: RaycastResult = workspace:Raycast(origin, dir, rp);
    if not result then return true, nil; end;

    if result.Instance:IsDescendantOf(part.Parent) then
        return true, result.Instance;
    end;

    return false, result.Instance;
end;

local getTarget = function()
    local cPart, cDistance = nil, getgenv().fov or 300;

    for _, player: Player in next, Players:GetPlayers() do
        if player == plr or player.Team == plr.Team then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

        local tPart: BasePart = char:FindFirstChild("Head") or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        local v, nTPart = isVisible(tPart);
        if not v then
            v, nTPart = isVisible(char.PrimaryPart or char:FindFirstChild("HumanoidRootPart"));
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

local vel: number;
local tool: Tool;

for k, v in next, getfenv(anon) do
    if type(v) == "function" then
        local n = debug.info(v, "n");
        if n == "Crosshair" then
            local old; old = clonefunction(hookfunction(rawget(getfenv(anon), k), newcclosure(function(...)
                local c = getTarget();
                if c and vel and tool and plr.Character and plr.Character:FindFirstChild("Head") then
                    local pos = c.Position;
                    local tVel = c.AssemblyLinearVelocity;

                    local r = pos - plr.Character.Head.Position;
                    local v = tVel - plr.Character.Head.AssemblyLinearVelocity;

                    local a = v:Dot(v) - vel * vel;
                    local b = 2 * r:Dot(v);
                    local c0 = r:Dot(r);

                    local disc = b * b - 4 * a * c0;
                    if disc < 0 then return pos; end;

                    local sqrtDisc = math.sqrt(disc);
                    local t1 = (-b - sqrtDisc) / (2 * a);
                    local t2 = (-b + sqrtDisc) / (2 * a);

                    local t;
                    if t1 > 0 and t2 > 0 then
                        t = math.min(t1, t2);
                    elseif t1 > 0 then
                        t = t1;
                    elseif t2 > 0 then
                        t = t2;
                    else
                        return pos;
                    end;

                    local prediction = pos + tVel * t;
                    return prediction + (prediction - plr.Character.Head.Position).Unit * (tool:GetAttribute("SpreadDefault") or 0) * 0.1;
                end;
                return old(...);
            end)));
        elseif n == "bulletMagnetism" then
            setfenv(anon, rawset(getfenv(anon), k, function() return nil; end));
        end;
    end;
end;

local t: thread;
local old; old = clonefunction(hookfunction(rawget(wm, "Equip"), newcclosure(function(data, _)
    if t then
        coroutine.close(t);
        t = nil;
    end;

    local _data = data;
    vel = _data.Tool:GetAttribute("Velocity");
    tool = _data.Tool;
    if _ == "Equip" then
        _data.Tool:SetAttribute("Recoil", 0);
        t = task.spawn(function()
            while task.wait() do
                if _data.RecoilPattern then
                    table.clear(_data.RecoilPattern);
                end;
            end;
        end);
    end;

    return old(_data, _);
end)));

plr.CharacterAdded:Connect(function()
    if t then
        coroutine.close(t);
        t = nil;
    end;
end);

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
