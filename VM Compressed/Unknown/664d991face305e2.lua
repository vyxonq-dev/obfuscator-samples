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

local s, fcr = pcall(require, RS.Client.FastCastRedux);
if not s then
    return warn(executor .. " returned an error while trying to require RS.Client.FastCastRedux:\n" .. fcr);
end;

local ri = workspace:FindFirstChild("RayIgnore");
local pv = workspace:FindFirstChild("PlayerVehicles");
if not (ri and pv) then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end

local exclusion = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/Anomic/Exclusions.luau"))();
local teams = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/Anomic/Teams.luau"))();

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.FilterDescendantsInstances = {ri, pv};
rp.IgnoreWater = true;

local isSameTeam = function(char: Model): boolean
    local pTeamVal = (plr.Character and plr.Character:FindFirstChild("Team"));
    local pTeamName = pTeamVal and pTeamVal.Value or "";
    
    local tTeamVal = char:FindFirstChild("Team");
    local tTeamName = tTeamVal and tTeamVal.Value or "";

    local pRole = teams[pTeamName];
    local tRole = teams[tTeamName];

    if tRole == 2 then return true; end;
    if pRole == 0 then return false; end;

    if pRole == 1 then
        if tRole == 0 then
            local wanted = char:FindFirstChild("Wanted");
            if wanted and wanted.Value == 3 then
                return false;
            end;
            return true;
        end;
        return true;
    end;

    return true;
end;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    if not part then return false, nil; end;

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
        if not char or isSameTeam(char) or char:FindFirstChildOfClass("ForceField") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

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

local down = false;

task.defer(function()
    while task.wait() do
        local char = plr.Character;
        if not char then continue; end;
        local h = char:FindFirstChildOfClass("Humanoid");
        if not h then continue; end;
        down = UIS:IsKeyDown(Enum.KeyCode.LeftShift);
        h.WalkSpeed = down and 23 or 13;
    end;
end);

local disable_stamina = function(char: Model)
    task.wait(1);
    for _, v: LocalScript in next, char:QueryDescendants("LocalScript") do
        if not table.find(exclusion, v.Name, 1) then
            v.Enabled = false;
            break;
        end;
    end;
    local h = char:FindFirstChildOfClass("Humanoid");
    if not h then return; end;
    h.WalkSpeed = down and 23 or 13;
end;

if plr.Character then
    disable_stamina(plr.Character);
end;

plr.CharacterAdded:Connect(disable_stamina);

local old; old = clonefunction(hookfunction(rawget(fcr, "Fire"), newcclosure(function(_, origin, __, vel, ...)
    local c = getTarget(origin);
    if c then
        local dir = c.Position - origin;
        return old(_, origin, dir.Unit * dir.Magnitude, dir.Unit * vel.Magnitude * 1.1, ...);
    end;
    return old(_, origin, __, vel, ...);
end)));

SG["success"]("Script successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
