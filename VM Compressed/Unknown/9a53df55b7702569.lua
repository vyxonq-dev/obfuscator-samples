local cloneref = cloneref or function(i: Instance) return i; end;
local SG: StarterGui = cloneref(game:GetService("StarterGui"));

local get_id = loadstring(game:HttpGet("https://sneekysscripts.uk/Scripts/FOV_LIBRARY/get_id.luau"))();

return {
    ["success"] = function(msg: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "SUCCESS - READ BELOW",
            ["Text"] = msg,
            ["Icon"] = get_id("logo");
            ["Duration"] = 60
        });
    end,
    ["info"] = function(info: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "INFO - READ BELOW",
            ["Text"] = info,
            ["Icon"] = get_id("logo");
            ["Duration"] = 20,
            ["Button1"] = "Close"
        });
    end,
    ["warning"] = function(w: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "WARNING - READ BELOW",
            ["Text"] = w,
            ["Icon"] = get_id("logo");
            ["Duration"] = 30,
            ["Button1"] = "Close"
        });
    end,
    ["error"] = function(err: string)
        SG:SetCore("SendNotification", {
            ["Title"] = "ERROR - READ BELOW",
            ["Text"] = err,
            ["Icon"] = get_id("logo");
            ["Duration"] = 60,
            ["Button1"] = "Close"
        });
    end
};
