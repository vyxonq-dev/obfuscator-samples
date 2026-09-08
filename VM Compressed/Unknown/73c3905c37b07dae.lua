if not game:IsLoaded() then game.Loaded:Wait(); end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> (...any)) return f; end;
local newcclosure = newcclosure or clonefunction;
local executor = (identifyexecutor and select(2, pcall(identifyexecutor))) and identifyexecutor() or "Your executor";
local SG = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-notifications/refs/heads/main/main.luau"))();

if not (hookfunction and require and run_on_actor) then
    local err = executor .. " is missing " .. (not hookfunction and "hookfunction " or "") .. (not require and "require " or "") .. (not run_on_actor and "run_on_actor" or "");
    SG["error"](err);
    return error(err);
end;

if not (setthreadidentity and setidentity) then SG["info"]("You may experience issues because you do not have setthreadidentity/setidentity! If you do, it's best to switch executors."); end;

local Players: Players = cloneref(game:GetService("Players"));

local plr = Players.LocalPlayer;

local npc = workspace:FindFirstChild("NPCSFolder");
local bf = workspace:FindFirstChild("BloodFolder");
if not (npc and bf) then
    local err = "Script needs updating";
    SG["error"](err);
    return warn(err);
end;

local payload = [[
if setthreadidentity then
    setthreadidentity(8);
elseif setidentity then
    setidentity(8);
end;

local cloneref = cloneref or function(i: Instance) return i; end;
local clonefunction = clonefunction or function(f: (...any) -> (...any)) return f; end;
local newcclosure = newcclosure or clonefunction;

local RS: ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"));
local Players: Players = cloneref(game:GetService("Players"));

local plr = Players.LocalPlayer;

local getTarget = loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/Blood-Debt-Silent-Aim-Script/refs/heads/main/getTarget.luau"))()(true);

local s, rep = pcall(require, RS.gun_res.lib.replicator);
if not s then
    return warn(executor .. " returned an error while trying to require RS.gun_res.lib.replicator:\n" .. rep);
end;

print("Loaded", rawget(rep, "bullet"));

local old; old = clonefunction(hookfunction(rawget(rep, "bullet"), newcclosure(function(_, __, ___, ____, origin, endPoses, ...)
    local c = getTarget(origin);
    if c then
        return old(_, __, ___, ____, origin, table.create(#endPoses, (c.Position - origin).Unit), ...);
    end;
    return old(_, __, ___, ____, origin, endPoses, ...);
end)));

if restorefunction and isfunctionhooked then
    plr.CharacterRemoving:Once(function()
        if rep and rawget(rep, "bullet") and isfunctionhooked(rawget(rep, "bullet")) then restorefunction(rawget(rep, "bullet")); end;
    end);
end;
]];

loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/sneeky-s-fov-lib/refs/heads/main/main.luau"))()(300, loadstring(game:HttpGet("https://raw.githubusercontent.com/sneekygoober/Blood-Debt-Silent-Aim-Script/refs/heads/main/getTarget.luau"))()(false), true);

local cache = {};
local setup = function(char: Model)
    task.wait();
    local gun = char:FindFirstChildOfClass("Tool");
    if not gun then return warn("Failed to find gun"); end;
    local a: Actor = gun.Actor;
    if get_actors then
        local found = false;
        for _, v: Actor in next, get_actors() do
            if v == a then
                found = true;
                if not cache[a] then print("Active actor found via get_actors!"); end;
                break;
            end;
        end;
        if not found then return warn("Couldn't find active actor!"); end;
    else
        if not cache[a] then print("Active actor found via search index!"); end;
    end;
    if not a then return warn("Failed to find actor!"); end;
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

local c: RBXScriptConnection;
local _ = function(char: Model)
    table.clear(cache);
    if c then c:Disconnect(); c = nil; end;
    c = char.ChildAdded:Connect(function(child)
        if child.ClassName == "Tool" and child:FindFirstChild("Actor") and child.Actor:FindFirstChild("weap_cl") then
            setup(char);
        end;
    end);
    local g = char:FindFirstChildOfClass("Tool") and char:FindFirstChildOfClass("Tool"):FindFirstChild("Actor") and char:FindFirstChildOfClass("Tool").Actor:FindFirstChild("weap_cl");
    if g then setup(char); end;
end;

_(plr.Character);

plr.CharacterAdded:Connect(_);

SG["success"]("Silent aim successfully executed!\nIf you have any issues press F9 or type /console in chat and then send me a screenshot of the console.");
