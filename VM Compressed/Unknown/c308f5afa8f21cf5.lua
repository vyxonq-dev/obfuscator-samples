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

local plr = Players.LocalPlayer;
local cam = workspace.CurrentCamera;

local mouse = plr:GetMouse();

local s, cast = pcall(require, RS.Utility.Functional.Rays.castRays);
if not s then
    return warn(executor .. " returned an error while trying to require RS.Utility.Functional.Rays.castRays:\n" .. cast);
end;

local getTarget = function()
    local cPart, cDistance = nil, 200;

    for _, player: Model in next, Players:GetPlayers() do
        if player == plr then continue; end;

        local char = player.Character;
        if not char or char:FindFirstChild("ShieldHighlight") or (char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0) then continue; end;

        local tPart: BasePart = char:FindFirstChild("Head") or char.PrimaryPart or char:FindFirstChild("HumanoidRootPart");
        if not tPart then continue; end;

        local pos, onScreen = cam:WorldToViewportPoint(tPart.Position);
        if not onScreen then continue; end;

        local distance = (Vector2.new(pos.X, pos.Y) - Vector2.new(mouse.X, mouse.Y)).Magnitude;
        if distance < cDistance then
            cPart = tPart;
            cDistance = distance;
        end;
    end;

    return cPart;
end;

local old; old = clonefunction(hookfunction(cast, newcclosure(function(_, __, b, ...)
    local c = getTarget();
    if c then
        local h = c.Parent and c.Parent:FindFirstChildOfClass("Humanoid");
        if h then
            return {{
                ["position"] = c.Position,
                ["instance"] = c,
                ["taggedHumanoid"] = h;
            }};
        end;
    end;

    return old(_, __, b, ...);
end)));

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
