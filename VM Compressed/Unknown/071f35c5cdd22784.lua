if (not game:IsLoaded()) then game.Loaded:Wait() end;

local players = cloneref(game:GetService("Players"));
local localplayer = cloneref(players.LocalPlayer);

local executor = string.reverse(identifyexecutor and identifyexecutor()) or "what are you useing????";

if (run_on_actor and getactors and getactors()[1] ~= nil and not table.find({"Delta", "Codex", "Wave", "Seliware"}, string.reverse(executor))) then
    run_on_actor(getactors()[1], [[task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/voltara-the-terrible/AquaHook/refs/heads/main/Games/OperationOne/Main.luau"))() end)]]);
elseif (getfflag and setfflag) then
    if (string.lower(tostring(getfflag("DebugRunParallelLuaOnMainThread"))) ~= "true") then
        setfflag("DebugRunParallelLuaOnMainThread", "True");
        return localplayer:Kick("Aqua.Hook - [ " .. executor .. " ]\nrejoin and run Aqua.Hook again");
    else
       task.spawn(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/voltara-the-terrible/AquaHook/refs/heads/main/Games/OperationOne/Main.luau"))() end);
    end;
else
    return localplayer:Kick("Aqua.Hook - [ " .. executor .. " ]\nmissing [ setfflag & run_on_actor ] - unsupported executor");
end;
