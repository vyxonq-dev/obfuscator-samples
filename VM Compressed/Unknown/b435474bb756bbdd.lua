if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local executor = (identifyexecutor and select(2, pcall(identifyexecutor))) and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-notifications/refs/heads/main/main.luau"))();

if not (hookfunction and (filtergc or (getgc and debug.getconstants)) and require and run_on_actor and (setthreadidentity or setidentity)) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not (filtergc and (getgc and debug.getconstants)) and "filtergc getgc debug.getconstants " or "") .. (not require and "require " or "") .. (not run_on_actor and "run_on_actor " or "") .. (not (setthreadidentity or setidentity) and "setthreadidentity" or "");
    SG["error"](err);
    return error(err);
end;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));

local plr = Players.LocalPlayer;
local mouse = plr:GetMouse();

local payload = [[
if setthreadidentity then
    setthreadidentity(8);
elseif setidentity then
    setidentity(8);
end;

print("Injected");

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> (...any)) return f; end;
local newcclosure = newcclosure or clonefunction;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players = game:GetService("Players");

local plr: Player = cloneref(Players).LocalPlayer;
local cam = workspace.CurrentCamera;

local mouse = plr:GetMouse();

local teams = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/Valley-Prison-Silent-Aim-Script/refs/heads/main/Teams.luau"))();

local isSameTeam = function(player: Player): boolean
    if teams[player.Team.Name] == 2 then return false; end;
    if teams[plr.Team.Name] == 0 and teams[plr.Team.Name] ~= teams[player.Team.Name] then
        if player.Character and player.Character:FindFirstChildOfClass("Tool") then return false; end;
        return player.ServerVariables.Innocent.Value;
    end;
    return teams[plr.Team.Name] == teams[player.Team.Name];
end;

local isVisible = function(part: BasePart): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil; end;

    local rp = RaycastParams.new();
    rp.FilterType = Enum.RaycastFilterType.Exclude;
    rp.FilterDescendantsInstances = {char, workspace.Map.Functional.Invisible};
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

local getTarget = function(Muzzle: BasePart): BasePart
    local cPart, cDistance = nil, math.huge;

    for _, player: Model in next, Players:GetPlayers() do
        if player == plr or isSameTeam(player) then continue; end;

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

        local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;

    return cPart;
end;

local f = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-filtergc/refs/heads/main/main.luau"))()(nil, false, "BulletTracer", "WeaponResources", "CreateEvent_Client");
if not f then return warn("Failed to load, reset to try load again"); end;

print("Loaded", f);

local old; old = clonefunction(hookfunction(f, newcclosure(function(Muzzle: BasePart, _, __, ___, ...)
    local c = getTarget();
    if c then
        local npos = c.Position;
        return {
            ["Position"] = npos,
            ["Instance"] = c,
            ["Material"] = c.Material,
            ["Normal"] = Vector3.new(0, 1, 0),
            ["Distance"] = (npos - Muzzle.WorldPosition).Magnitude
        };
    end;

    return old(Muzzle, _, __, ___, ...);
end)));

if restorefunction and isfunctionhooked then
    plr.CharacterAdded:Once(function()
        if f and isfunctionhooked(f) then restorefunction(f); end;
    end);
end;
]];

local cache = {};
local setup = function(char: Model)
    task.wait();
    for _, a in next, char:QueryDescendants("Actor[Name = \"Fireact\"]") do
        if not cache[a] then
            print("Injecting");
            task.spawn(function()
                local retries = 0;
                local max = 100;
                
                while retries < max do
                    if not a.Parent or not a:IsDescendantOf(char) then
                        return warn("Payload injection interrupted", a:GetFullName());
                    end;

                    local s, err = pcall(run_on_actor, a, payload);
                    
                    if s then
                        cache[a] = true;
                        break;
                    end;

                    retries += 1;
                    task.wait(0.05);
                end;
                
                if not cache[a] and retries >= max then
                    warn("Failed to inject payload to", a:GetFullName());
                end;
            end);
        end
    end;
end;

local c: RBXScriptConnection;
plr.CharacterAdded:Connect(function(character)
    if c then c:Disconnect(); c = nil; end;
    c = character.ChildAdded:Connect(function(child)
        if child.ClassName == "Tool" and child:FindFirstChild("Fireact") then
            setup(character);
        end;
    end);
end);

if plr.Team.Name ~= "Menu" then
    local h = plr.Character and plr.Character:FindFirstChild("Humanoid"); if h then h.Health = 0; end;
end;

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
