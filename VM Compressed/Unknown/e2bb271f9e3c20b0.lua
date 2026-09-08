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

local s, bfuncs = pcall(require, RS.shared.bFunctions);
if not s then
    return warn(executor .. " returned an error while trying to require RS.shared.bFunctions:\n" .. bfuncs);
end;

local stats = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/Grave_Digger/stats.luau"))();
local bodyparts = {
    "Right Arm",
    "Left Arm",
    "Right Leg",
    "Left Leg",
};

local cm, nation_team, empire_team, nt, b, obj, throw = workspace:FindFirstChild("serverStuff") and workspace.serverStuff:FindFirstChild("conscriptmode"), workspace:FindFirstChild("nation_team"), workspace:FindFirstChild("empire_team"), workspace:FindFirstChild("notarget"), workspace:FindFirstChild("bodies"), workspace:FindFirstChild("serverStuff") and workspace.serverStuff:FindFirstChild("objectives"), workspace:FindFirstChild("throwables");
if not (cm and nation_team and empire_team and nt and b and obj and throw) then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

local rp = RaycastParams.new();
rp.FilterType = Enum.RaycastFilterType.Exclude;
rp.IgnoreWater = true;

local isVisible = function(part: BasePart, origin: Vector3): (boolean, Instance?, boolean)
    local char = plr.Character;
    if not (char and part) then return false, nil, false; end;
    
    rp.FilterDescendantsInstances = {char, part.Parent:FindFirstChild("bullet_whizz"), char.Parent, nt, b, throw};
    for _, v in next, obj:GetChildren() do
        if v:FindFirstChild("capture") then
            rp.FilterDescendantsInstances[#rp.FilterDescendantsInstances+1] = v.capture;
        end;
    end;

    local dir = part.Position - origin;
    local result: RaycastResult = workspace:Raycast(origin, dir, rp);
    if not result then return true, nil, false; end;

    if result.Instance:IsDescendantOf(part.Parent) then
        if (result.Instance.Parent.Name == "vanguardshield1" and result.Instance.Parent:FindFirstChild("hitbox")) or (result.Instance.Parent.Parent.Name == "vanguardshield1" and result.Instance.Parent.Parent:FindFirstChild("hitbox")) then
            local ins = result.Instance.Parent.Name == "vanguardshield1" and result.Instance.Parent or result.Instance.Parent.Parent;
            local sh = ins:FindFirstChild("special") and ins.special:FindFirstChild("topshield");
            if sh and sh:FindFirstChild("health") and sh.health.Value > 0 then
                local dp = sh:FindFirstChild("damagepart");
                return true, dp, false;
            else
                return true, part.Parent:FindFirstChild("HeadHitbox"), true;
            end;
        end;
        return true, result.Instance, false;
    end;

    return false, result.Instance, false;
end;

local getTarget = function(origin: Vector3)
    if not getgenv().sneeky_silent_aim then return nil; end;
    local cPart, cDistance, offset = nil, getgenv().sneeky_fov_size or 300, false;

	local gun = plr.Character and plr.Character:FindFirstChildOfClass("Tool");
	if not gun then return; end;

    local eFolder: Folder = plr.Character.Parent == empire_team and nation_team or empire_team;

    for _, char: Model in next, eFolder:GetChildren() do
        if char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0 then continue; end;

        local tPart: BasePart?
		local root = char:FindFirstChild("Torso") or char.PrimaryPart;
		local head = char:FindFirstChild("HeadHitbox") or root;
		if cm.Value or not char:FindFirstChild("helmet") or char:FindFirstChild("helmetgone") then
			tPart = head;
		else
            local pl = stats[gun.Name] or 2;
            local class: string? = char:FindFirstChild("class") and char.class.Value;
            if not pl or not class then
                tPart = root;
            else
                if class == "lancer" then
                    tPart = (pl == 5) and head or root;
                elseif class == "vanguard" then
                    tPart = (pl >= 3) and head or root;
                else
                    tPart = (pl >= 2) and head or root;
                end;
            end;
		end;

        if not tPart then continue; end;
        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

		if getgenv().sneeky_wallcheck then
	        local v, nTPart, o = isVisible(tPart, origin);
	        if not v then
	            v, nTPart, o = isVisible(root, origin);
	            if not v then
	                for _, _v in ipairs(bodyparts) do
	                    v, nTPart, o = isVisible(char:FindFirstChild(_v), origin);
	                    if v then break; end;
	                end;
	                if not v then continue; end;
	            end;
	        end;
	
	        if nTPart then tPart = nTPart; end;
		end;

        local distance = (Vector2.new(pos.X, pos.Y) - UIS:GetMouseLocation()).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            offset = o;
            cDistance = distance;
        end;
    end;
    
    return cPart, offset;
end;

loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/UIs/silent_aim.luau"))()(getgenv().sneeky_fov_size or 300, getTarget);

local old; old = clonefunction(hookfunction(rawget(bfuncs, "raycastline"), newcclosure(function(_, args)
    if rawget(args, "bullet") and rawget(args, "point") and rawget(args, "destination") then
        local c, offset = getTarget(rawget(args, "point"));
        if c then
            local _args = args;
            local pos = c.CFrame;
            _args.destination = (offset and pos:PointToWorldSpace(Vector3.new(0, c.Size.Y/2, 0)) or pos.Position) - _args.point;
            return old(_, _args);
        end;
    end;
    return old(_, args);
end)));

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
