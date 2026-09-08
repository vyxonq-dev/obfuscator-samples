if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> ...any) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = identifyexecutor and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/NOTIFICATION_LIBRARY/main.luau"))();

if not require then
    local err = executor .. " is missing " .. (not require and "require" or "");
    SG["error"](err);
    return error(err);
end;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));
local UIS: UserInputService = cloneref(game:GetService("UserInputService"));

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local isMobile = UIS.TouchEnabled and not UIS.KeyboardEnabled and not UIS.MouseEnabled;

local s, proj = pcall(require, RS.Modules.Client.Behaviours.BehaviourGunClient.ProjectileEnvConstructors.Projectile);
if not s then
    return warn(executor .. " returned an error while trying to require RS.Modules.Client.Behaviours.BehaviourGunClient.ProjectileEnvConstructors.Projectile:\n" .. proj);
end;

local s2, projh = pcall(require, RS.Modules.Client.Behaviours.BehaviourGunClient.ProjectileEnvConstructors.ProjectileHoming);
if not s2 then
    return warn(executor .. " returned an error while trying to require RS.Modules.Client.Behaviours.BehaviourGunClient.ProjectileEnvConstructors.ProjectileHoming:\n" .. projh);
end;

local s3, hs = pcall(require, RS.Modules.Client.Behaviours.BehaviourGunClient.ProjectileEnvConstructors.Hitscan);
if not s3 then
    return warn(executor .. " returned an error while trying to require RS.Modules.Client.Behaviours.BehaviourGunClient.ProjectileEnvConstructors.Hitscan:\n" .. hs);
end;

local spawned = workspace:FindFirstChild("Spawned");
if not spawned then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

local Chars, Enemies, Wildlife, mif, ic, as, cps = (plr.Character or plr.CharacterAdded:Wait()).Parent, spawned:FindFirstChild("Enemies"), spawned:FindFirstChild("Wildlife"), spawned:FindFirstChild("MouseIgnoreFolder"), RS:FindFirstChild("Modules")
    and RS.Modules:FindFirstChild("Shared")
    and RS.Modules.Shared:FindFirstChild("GameConfiguration")
    and RS.Modules.Shared.GameConfiguration:FindFirstChild("ItemConfigs"), workspace:FindFirstChild("AI SPAWNERS"), workspace:FindFirstChild("CameraPositions");
while Chars == workspace do
    Chars = (plr.Character or plr.CharacterAdded:Wait()).Parent;
    task.wait();
end;
plr.Character.Humanoid.Health = 0;
if not (Chars and Wildlife and Enemies and mif and ic and as and cps) then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

for _, v: ModuleScript in next, ic:GetChildren() do local old; old = clonefunction(hookfunction(require(v), function(...) return table.freeze(rawset(table.clone(old(...)), "ProjectileSpread", 0)); end)); end;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?)
    local char = plr.Character;
    if not (char and part) then return false, nil, nil; end;

    rp.FilterDescendantsInstances = {char, mif, as, cps};

    local origin = origin or cam.CFrame.Position;

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

    local tmp = table.create(#Chars:GetChildren() + #Enemies:GetChildren() + #Wildlife:GetChildren());

    local i = 0;
    for _, v in next, Chars:GetChildren() do i += 1; tmp[i] = v; end;
    for _, v in next, Enemies:GetChildren() do i += 1; tmp[i] = v; end;
    for _, v in next, Wildlife:GetChildren() do i += 1; tmp[i] = v; end;

    for _, char: Model in next, tmp do
        if char == plr.Character or (char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("ForceField1", true)) or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

        local tPart: BasePart = char:QueryDescendants("Part#Head, UnionOperation#Head")[1] or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        local v, nTPart, nTPos = isVisible(tPart, origin);
        if not v then
            v, nTPart, nTPos = isVisible(char.PrimaryPart or char:FindFirstChild("HumanoidRootPart"), origin);
            if not v then continue; end;
        end;

        if nTPart then tPart = nTPart; end;

        local distance = (Vector2.new(pos.X, pos.Y) - (isMobile and Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2) or UIS:GetMouseLocation())).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cPos = nTPos;
            cDistance = distance;
        end;
    end;

    return cPart, cPos;
end;

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size or 300, getTarget, true);

local hook = function(m: () -> ())
	local old; old = clonefunction(hookfunction(m, newcclosure(function(_, info, ...)
		local r = old(_, info, ...);
		local old2 = rawget(r, "Fire");
		rawset(r, "Fire", newcclosure(function(_, endPos, ...)
			local c, pos = getTarget(((rawget(info, "HumanoidRootPart") or plr.Character:FindFirstChild("HumanoidRootPart")).CFrame * CFrame.new(0, 1, 0)).Position);
			if c then
				return old2(_, pos, ...);
			end;
			return old2(_, endPos, ...);
		end));
		return r;
	end)));
end;

hook(proj);
hook(projh);
hook(hs);

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
