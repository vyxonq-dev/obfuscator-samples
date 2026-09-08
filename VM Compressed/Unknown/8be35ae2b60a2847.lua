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
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local ctea: BindableFunction = plr.PlayerGui:FindFirstChild("GameUI") and plr.PlayerGui.GameUI:FindFirstChild("ClientMaster") and plr.PlayerGui.GameUI.ClientMaster:FindFirstChild("ClientTriggers") and plr.PlayerGui.GameUI.ClientMaster.ClientTriggers:FindFirstChild("CreateThrowEffectAsync");
if not ctea then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

local s, cf = pcall(require, plr.PlayerGui.GameUI.ClientMaster.CommonFunctions);
if not s then
    return warn(executor .. " returned an error while trying to require plr.PlayerGui.GameUI.ClientMaster.CommonFunctions:\n" .. cf);
end;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    rp.FilterDescendantsInstances = {char, workspace:FindFirstChild("WorldIgnore")};

    local origin = origin or (char:FindFirstChild("Head") and char.Head.Position) or cam.CFrame.Position;

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
        if not char or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) or (char:FindFirstChild("TeamHL") and char.TeamHL.OutlineColor == ((plr.Character and plr.Character:FindFirstChild("TeamHL") and plr.Character.TeamHL.OutlineColor) or Color3.new())) then continue; end;

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

        local distance = (Vector2.new(pos.X, pos.Y) - UIS:GetMouseLocation()).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;

    return cPart;
end;

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size or 300, getTarget);

local old; old = clonefunction(hookfunction(rawget(cf, "RayCast"), newcclosure(function(origin, _, ...)
    local c = getTarget(origin);
    if c then
        return old(origin, c.Position, ...);
    end;
    return old(origin, _, ...);
end)));

ctea.OnInvoke = function(_, data, __, ___)
    if data and rawget(data, "Start") and rawget(data, "Target") then
        local s = rawget(data, "Start");
        local c = getTarget(s);
        if c then
            local pos = c.Position;
            local r = rawset(_(rawset(data, "Target", pos), __, ___), "attackID", rawget(data, "attackID")) or {};
            (getrenv and getrenv() or _G).BUFFER_THROW_EFF_REPL_VALS = r;
            local ce = plr.Character:FindFirstChild("ClientEvent", true);
            if ce then
                ce:FireServer("ChargeRelease", {
                    0.1,
                    false,
                    s,
                    pos,
                    r,
                    rawget(data, "attackID")
                });
                coroutine.yield();
            end;
        end;
    end;
    local r = rawset(_(data, __, ___), "attackID", rawget(data, "attackID")) or {};
    (getrenv and getrenv() or _G).BUFFER_THROW_EFF_REPL_VALS = r;
    return r;
end;

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
