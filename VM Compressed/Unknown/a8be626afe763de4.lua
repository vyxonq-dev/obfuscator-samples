if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> (...any)) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = (identifyexecutor and select(2, pcall(identifyexecutor))) and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-notifications/refs/heads/main/main.luau"))();

if not (hookfunction and filtergc or (getgc and debug.getconstants)) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not (filtergc and (getgc and debug.getconstants)) and "filtergc getgc debug.getconstants" or "");
    SG["error"](err);
    return error(err);
end;

local filter: (script: (LocalScript|ModuleScript)?, strict: boolean, ...any) -> ((...any) -> (...any)) = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-filtergc/refs/heads/main/main.luau"))();

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local mouse: Mouse?;
if not UIS.TouchEnabled and UIS.MouseEnabled and UIS.KeyboardEnabled then
    mouse = plr:GetMouse();
end;

local enemies = workspace:FindFirstChild("Enemies");
if not enemies then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end

local isVisible = function(part: BasePart): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    local rp = RaycastParams.new();
    rp.FilterType = Enum.RaycastFilterType.Exclude;
    rp.FilterDescendantsInstances = {char};
    rp.IgnoreWater = true;

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
    local cPart, cDistance = nil, math.huge;

    for _, char: Model in next, enemies:GetChildren() do
        if char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

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

        local distance = mouse and (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude or Vector2.new(pos.X, pos.Y).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;
    return cPart;
end;

local hook = function(f: () -> () | boolean, shoot: RemoteEvent)
    if not f then return; end;
    local old; old = clonefunction(hookfunction(f, newcclosure(function()
        local c = getTarget();
        if c then
            local origin = cam.CFrame.Position;
            shoot:FireServer(Ray.new(origin, (c.Position - origin).Unit * ((c.Position - origin).Magnitude + 10)), "fire");
            return;
        end;
        return old();
    end)));
end;

local cache: {string: string} = {};
local connection: RBXScriptConnection;

local setup = function(char: Model)
    task.wait(1);

    if connection then connection:Disconnect(); end;
    table.clear(cache);

    local _ = function(gun: Tool)
        if cache[gun.Name] then return; end;

        local client: LocalScript?, shoot: RemoteEvent? = gun:FindFirstChild(gun.Name.."Client"), gun:FindFirstChildOfClass("RemoteEvent");
        if not (client and shoot) then return; end;

        local f = filter(client, false, "RaycastParams", "new", "Ray", "FireServer", "fire");
        if f then
            cache[gun.Name] = true;
            hook(f, shoot);
        end;
    end;

    connection = char.ChildAdded:Connect(function(gun)
        if gun.ClassName == "Tool" then
            _(gun);
        end;
    end);

    local gun = char:FindFirstChildOfClass("Tool");
    if not gun then return; end;

    _(gun);
end;

if plr.Character then task.defer(setup, plr.Character); end;
plr.CharacterAdded:Connect(setup);

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
