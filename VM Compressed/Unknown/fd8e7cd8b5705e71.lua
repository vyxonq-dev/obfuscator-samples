-- // Made by Mommy Flames
if not game:IsLoaded() then
    game.Loaded:Wait();
end

local VirtualUser = game:GetService("VirtualUser");
local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer

LocalPlayer.Idled:connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame);
    task.wait(1);
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame);
end)

local Scripts = {
    [1240123653] = "https://raw.githubusercontent.com/FlamesW/Femboi/home/Scripts/ZombieAttack.lua",
}

local function LoadFile(File)
    if File then
        local Success, Err = pcall(function()
            loadstring(game:HttpGet(File))();
        end)
    
        if not Success then
            warn("Error at:", File, Err)
        end
    end
end

local __Selected = Scripts[game.PlaceId];
if __Selected then
    LoadFile(__Selected) else warn("Unsupported Game");
end
