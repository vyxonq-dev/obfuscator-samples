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

local RF: ReplicatedFirst = cloneref(game:GetService("ReplicatedFirst"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local s, dmg = pcall(require, RF.src.Util.Damage);
if not s then
    return warn(executor .. " returned an error while trying to require RF.src.Util.Damage:\n" .. dmg);
end;

local rp = RaycastParams.new();
rp.CollisionGroup = "shoot";
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    rp.FilterDescendantsInstances = {char};

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
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) or (char:FindFirstChild("UI_AlwaysVisible") and char.UI_AlwaysVisible:FindFirstChild("IconTeamMate", true) and char.UI_AlwaysVisible:FindFirstChild("IconTeamMate", true).Visible) then continue; end;

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

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size or 300, getTarget, true);

rawset(dmg, "GetYaw", function() return 0; end);
rawset(dmg, "GetPitch", function() return 0; end);

local old; old = clonefunction(hookfunction(rawget(dmg, "CheckShoot"), newcclosure(function(origin, player, ...)
    if player and player == plr then
        local origin = origin.Position;
        local c = getTarget(origin);
        if c and c.Parent and c.Parent:FindFirstChild("Humanoid") then
            local dir = c.Position - origin;
            return {
                ["instance"] = c,
                ["finalPosition"] = origin + dir * dir.Magnitude,
                ["normal"] = dir.Unit,
                ["bulletDirection"] = dir,
                ["headshot"] = c.Name == "Head",
                ["victimCha"] = c.Parent,
                ["victimHum"] = c.Parent.Humanoid
            };
        end;
    end;
    return old(origin, player, ...);
end)));

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
