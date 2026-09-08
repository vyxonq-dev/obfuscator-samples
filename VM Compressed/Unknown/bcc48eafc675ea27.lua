local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local CoreGui = game.CoreGui
local Workspace = workspace
local Character = LocalPlayer.Character
local HRP = Character.HumanoidRootPart

LocalPlayer.CharacterAdded:Connect(function(c)
    Character = c
    HRP = c:WaitForChild("HumanoidRootPart")
end)

local function getSize(char)
    if not char:IsDescendantOf(Workspace) then
        return nil
    end
    return char:GetAttribute("Size")
end

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/0x"))()
local w1 = library:Window("Cube Fucker 9000")
local flags = library.flags

local cubes = Workspace.CubeParticles
local orbList = {}

task.spawn(function()
    while true do
        orbList = cubes:GetChildren()
        task.wait(3)
    end
end)

w1:Toggle("Claim Orbs","Orbs",false,function()
    while flags.Orbs do
        task.wait()
        for _,v in ipairs(orbList) do
            firetouchinterest(HRP, v, 0)
            task.wait()
            firetouchinterest(HRP, v, 1)
        end
    end
end)

w1:Toggle("Kill All","KA",false,function()
    while flags.KA do
        task.wait()
        local mySize = getSize(Character)
        for _,plr in ipairs(Players:GetChildren()) do
            local model = Workspace:FindFirstChild(plr.Name)
            if model then
                local otherSize = getSize(model)
                if mySize and otherSize and mySize > otherSize then
                    local t = model:FindFirstChild("HumanoidRootPart")
                    if t then
                        firetouchinterest(HRP, t, 0)
                        task.wait()
                        firetouchinterest(HRP, t, 1)
                    end
                end
            end
        end
    end
end)

w1:Button("Destroy GUI",function()
    for _,v in ipairs(CoreGui:GetChildren()) do
        if v:FindFirstChild("Top") then
            v:Destroy()
        end
    end
end)

w1:Label("Kitten Koding")
