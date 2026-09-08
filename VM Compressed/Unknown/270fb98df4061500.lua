local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local window = library:Window("Fish Training")

local v1 = require(game.ReplicatedStorage.Modules.Common);
local l_UIHandle_0 = require(game:GetService("ReplicatedStorage").Modules.Client.Hatch.UIHandle);
local path = game:GetService("Players").LocalPlayer.PlayerGui.HatchGuis
local Hatch = require(game:GetService("ReplicatedStorage").Modules.Client.Hatch)

local Cache = {
    ["Egg"] = "Draw001";
    ["Amount"] = "1";
    ["AutoEggOpen"] = false;
    ["AutoRace"] = false;
    ["Train"] = 1;
    ["AutoTrain"] = false;
}

window:Button("Disable Egg Animation", function()
   if not _G.Hooked then
        hookfunction(require(game:GetService("ReplicatedStorage").Modules.Client.Hatch).HatchResult, function(...)
            return
        end)
        _G.Hooked = true
    end
end)

window:Button("Free Gold Fuse", function()
    for i,v in workspace.WorldMain.Pets:GetChildren() do
        if v:GetAttribute("UserId") ~= game.Players.LocalPlayer.UserId then continue end
        v1.Events.PetEvent:Fire(true, "Fuse", {
            ["Data"] = {
                [1] = v.Name;
                [2] = v.Name;
                [3] = v.Name;
                [4] = v.Name;
                [5] = v.Name;
                [6] = v.Name;
            };
            ["Type"] = "Golden";
        });
    end
end)
window:Button("Free Rainbow Fuse", function()
    for i,v in workspace.WorldMain.Pets:GetChildren() do
        if v:GetAttribute("UserId") ~= game.Players.LocalPlayer.UserId then continue end
        v1.Events.PetEvent:Fire(true, "Fuse", {
            ["Data"] = {
                [1] = v.Name;
                [2] = v.Name;
                [3] = v.Name;
                [4] = v.Name;
                [5] = v.Name;
                [6] = v.Name;
            };
            ["Type"] = "Rainbow";
        });
    end
end)

local EggDropDown = {}

for i,v in game:GetService("ReplicatedStorage").Assets.Eggs:GetChildren() do
    table.insert(EggDropDown, v.Name)
end

local dropdown = window:Dropdown("Select Egg", EggDropDown, function(name)
   Cache.Egg = name
end)
local dropdown = window:Dropdown("Select Amount", {"1", "3"}, function(name)
   Cache.Amount = name
end)

window:Toggle("Auto Open", false, function(bool)
    Cache.AutoEggOpen = bool
end)

window:Toggle("Auto Fast Race", false, function(bool)
    Cache.AutoRace = bool
end)

local TrainDropDown = {}

for i,v in workspace["\229\156\186\230\153\175\231\180\160\230\157\144"]["\232\174\173\231\187\131"]:GetChildren() do
    if not v:IsA("Model") then continue end
    table.insert(TrainDropDown, v.Name)
end

local dropdown = window:Dropdown("Select Training", TrainDropDown, function(name)
   Cache.Train = tonumber(name) or name
end)
window:Toggle("Auto Fast Train", false, function(bool)
    Cache.AutoTrain = bool
end)

window:Label("Credits to Pryxo", Color3.fromRGB(160, 32, 240))

task.spawn(function()
    while task.wait() do
        if not Cache.AutoEggOpen then continue end
        v1.Events.Hatch:Fire(true, "Hatch"..Cache.Amount, Cache.Egg, l_UIHandle_0.GetDeletePets(game:GetService("Players").LocalPlayer.PlayerGui.HatchGuis[Cache.Egg]));
    end
end)

task.spawn(function()
    while task.wait() do
        if not Cache.AutoRace then continue end
        for i = 1,16 do
            local Number = i
            if Number < 10 then 
                Number = "0"..tostring(Number)
            end
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Track["Stage"..Number].Sign ,0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Track["Stage"..Number].Sign ,1)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not Cache.AutoTrain then continue end
        for i = 1, 100 do
            v1.Events.Train:Fire(true, "Power", Cache.Train)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not Cache.AutoRace then continue end
        for i = 1,16 do
            local Number = i
            if Number < 10 then 
                Number = "0"..tostring(Number)
            end
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Track["Stage"..Number].Sign ,0)
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, workspace.Track["Stage"..Number].Sign ,1)
        end
    end
end)
