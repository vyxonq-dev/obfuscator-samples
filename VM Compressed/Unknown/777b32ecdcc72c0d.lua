local get = cloneref or function(x) return x end
local players = get(game:GetService("Players")); local lp = players.LocalPlayer
local rs = get(game:GetService("RunService"))
local vim = get(game:GetService("VirtualInputManager"))
local rep = get(game:GetService("ReplicatedStorage"))
local marketplace = get(game:GetService("MarketplaceService"))
local tweens = get(game:GetService("TweenService"))

local Handler = require(rep.Modules.HandlerLoader.GameHandler)

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
	Name = marketplace:GetProductInfo(game.PlaceId).Name,
	LoadingTitle = "something or another",
	LoadingSubtitle = "fuhh you",
})

local Network = rep["Shared"]["Packages"]["Network"]

local area = workspace.Areas.KickReady
local waves = workspace.Waves

local function _kick(strength)
    Network["rev_KickEvent"]:FireServer(strength or 1)
end

local following
local function FollowWave()
    if following then following:Disconnect() end
    local hrp = lp.Character.HumanoidRootPart

    following = rs.RenderStepped:Connect(function()
        if Handler.Status ~= "Tsunami" then
            following:Disconnect(); following = nil
            return
        end
        local wave = waves:FindFirstChildWhichIsA("Model") and waves:FindFirstChildWhichIsA("Model"):FindFirstChildWhichIsA("Part")
        if not wave then return end
        hrp.CFrame = CFrame.new(wave.Position + Vector3.new(80, 0, 0), wave.Position)
    end)
end

local main = Window:CreateTab("Main")
main:CreateLabel("Kicking")

main:CreateButton({
    Name = "Kick with max power",
    Callback = function()
        _kick()
    end,
})

local autoKick = false
main:CreateToggle({
    Name = "Auto Kick",
    CurrentValue = false,
    Flag = "",
    Callback = function(v)
        autoKick = v
        if not v then return end
        task.spawn(function()
            while task.wait(0.4) and autoKick do
                if Handler.InGame then continue end
                lp.Character.HumanoidRootPart.CFrame = area.CFrame
                
                _kick(1)
            end
        end)
    end,
})

main:CreateDivider()

main:CreateButton({
    Name = "Collect",
    Callback = function()
        FollowWave()
    end,
})

local collecting = false
Handler.StatusChanged:Connect(function()
    if Handler.Status == "Tsunami" and collecting then
        FollowWave()
    end
end)

main:CreateToggle({
    Name = "Auto Collect",
    CurrentValue = false,
    Flag = "",
    Callback = function(v)
        collecting = v
        if not v and following then following:Disconnect(); following = nil end
    end,
})

main:CreateDivider()

local gui = lp:WaitForChild("PlayerGui")
local kupg = gui:WaitForChild("KickUpgrades")
local function find()
    for _, item in ipairs(kupg:GetChildren()) do
        if item:IsA("ImageButton") and item.Name == "Bonus" and item.Visible then
            local pos = item.AbsolutePosition + (item.AbsoluteSize / 2)
            vim:SendMouseButtonEvent(pos.X, pos.Y, 0, true, game, 0)
            vim:SendMouseButtonEvent(pos.X, pos.Y, 0, false, game, 0)
            break
        end
    end
end

local WeightBonus
main:CreateToggle({
    Name = "Auto extra bonus from weight (hide the ui)",
    CurrentValue = false,
    Flag = "",
    Callback = function(v)
        if v then
            if not WeightBonus then
                WeightBonus = kupg.DescendantAdded:Connect(find)
            end
            find()
        else
            if WeightBonus then WeightBonus:Disconnect(); WeightBonus = nil end
        end
    end,
})

local misc = Window:CreateTab("Misc")

misc:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "",
    Callback = function(v)
        task.spawn(function()
            while task.wait(6) do
                if not v then continue end
                Network["rev_RebirthRequest"]:FireServer()
            end
        end)
    end,
})

misc:CreateToggle({
    Name = "Speed",
    CurrentValue = false,
    Flag = "",
    Callback = function(v)
        local humanoid = lp.Character.Humanoid
        humanoid.WalkSpeed = v and humanoid.WalkSpeed * 2 or humanoid.WalkSpeed / 2
    end,
})

misc:CreateDivider()

local plot
for _, item in ipairs(workspace.Plots:GetChildren()) do
    if item:GetAttribute("Owner") == lp.Name then
        plot = item; break
    end
end

local function claim()
    local hrp = lp.Character.HumanoidRootPart
    for _, slot in ipairs(plot.Buttons:GetChildren()) do
        firetouchinterest(hrp, slot, true)
        firetouchinterest(hrp, slot, false)
    end
end

misc:CreateButton({
    Name = "Claim money",
    Callback = claim,
})

misc:CreateToggle({
    Name = "Auto claim money",
    CurrentValue = false,
    Flag = "",
    Callback = function(v)
        task.spawn(function()
            while task.wait(6) do
                if not v then continue end
                claim()
            end
        end)
    end,
})
