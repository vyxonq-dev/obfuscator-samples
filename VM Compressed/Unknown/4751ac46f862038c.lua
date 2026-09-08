
local function load(script)
    return loadstring(game:HttpGet(script))()
end

local scripts = {
    ["3804735158"] = "https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Scripts/The%20Tycoon%20Squad.luau",
    ["9791603388"] = "https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Scripts/SwordFightAura.luau",
    ["119564951960102"] = "https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Scripts/Pass_or_DIe.lua",
    ["123741668193208"] = "https://gist.githubusercontent.com/Bwhw827g29wh/84e8ba08f520682a4de508c19121ec34/raw/4e34921858e5fc5af1999e7650cb85d3db6d2f29/The%2520$1M%2520Jump%2520Rope.txt",
    ["6104994594"] = "https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Scripts/Pilfering%20Pirates.luau",
    ["89469502395769"] = "https://raw.githubusercontent.com/VoidShell-null/VoidShell-Hub/refs/heads/main/Scripts/Kick-A-Lucky-Block.lua",
}

local placeId = tostring(game.PlaceId)

if scripts[placeId] then
    load(scripts[placeId])
end
