local get = (type(cloneref) == "function") and cloneref or function(x) return x end
local marketplace = get(game:GetService("MarketplaceService"))
local players = get(game:GetService("Players"))
local rep = get(game:GetService("ReplicatedStorage"))
local tweens = get(game:GetService("TweenService"))
local lighting = get(game:GetService("Lighting"))
local uis = get(game:GetService("UserInputService"))
local cas = get(game:GetService("ContextActionService"))
local runs = get(game:GetService("RunService"))

local player = players["LocalPlayer"]
local hrp = player["Character"]["HumanoidRootPart"]

local library = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local window = library:CreateWindow({
	Name = marketplace:GetProductInfo(game.PlaceId).Name,
	LoadingTitle = "fah you",
	LoadingSubtitle = "subtitle",
})

local main = window:CreateTab("Main")
main:CreateLabel("Animals")

local rank = {
    Secret = 7,
    Exclusive = 6,
    Mythic = 5,
    Legendary = 4,
    Epic = 3,
    Rare = 2,
    Common = 1
}

local function eval(pet) return pet:GetAttribute("Strength"), rank[pet:GetAttribute("Rarity")], pet:GetAttribute("Weight") end
local function rarest()
    local best, strongest, rarest, heaviest = nil, -1, -1, -1
    for _, pet in ipairs(workspace["RoamingPets"]["Pets"]:GetChildren()) do
        local strength, rarity, weight = eval(pet)
        if strength > strongest or (strength == strongest and rarity > rarest) or (strength == strongest and rarity == rarest and weight > heaviest) then
            best = pet
            strongest = strength
            rarity = rarity
            heaviest = weight
        end
    end

    return best
end

local handler = require(player["PlayerScripts"]["Controllers"]["Visuals"]["lassoController"]["lassoMinigameHandler"])

local oldStart = hookfunction(handler.Start, function(...)
    oldStart(...)
    task.spawn(function()
        task.wait(0.8)
        while handler.liveMinigame do
            rep["Remotes"]["UpdateProgress"]:FireServer(100)
            task.wait(0.5)
        end
    end)
end)

local lasso = require(player["PlayerScripts"]["Controllers"]["UI"]["lassoUI"]["throwLasso"])
local af, afr = nil, false
main:CreateToggle({
    Name = "AutoFarm",
    CurrentValue = false,
    Flag = "af",
    Callback = function(v)
        afr = v

        if v then
            af = task.spawn(function()
                while afr and task.wait(4 + math.random()) do
                    local item = rarest(); local ih = item:FindFirstChildWhichIsA("MeshPart")

                    local dir = (ih.Position - hrp.Position)
                    if dir.Magnitude < 0.1 then
                        dir = ih.CFrame.LookVector
                    else
                        dir = dir.Unit
                    end

                    hrp.CFrame = ih.CFrame * CFrame.new(0, 0, math.random(8, 12))

                    local newDir = (ih.Position - hrp.Position).Unit

                    lasso.throwLasso(0.9, newDir, player)
                    --completeMini()
                end
            end)
        else
            task.cancel(af); af = nil
        end
    end,
})

main:CreateButton({
	Name = "Teleport to best Animal",
	Callback = function()
        hrp.CFrame = rarest():FindFirstChildWhichIsA("MeshPart").CFrame
    end,
})

main:CreateDivider()

local event = window:CreateTab("Event")
event:CreateLabel("Dragon Island")

event:CreateButton({
	Name = "Teleport to Island",
	Callback = function()
        hrp.CFrame = workspace["Clouds"]["68"].CFrame + Vector3.new(-20, 60, 0)
    end,
})

event:CreateLabel("Forgotten Depths")

event:CreateButton({
	Name = "Teleport to Island",
	Callback = function()
        hrp.CFrame = workspace["UnderwaterWorld"]["DadsyDev"]["HumanoidRootPart"].CFrame + Vector3.new(0, 0, -20)
    end,
})

--[[
event:CreateLabel("Valentines")

if fireproximityprompt then
    local oc, ocr = nil, false
    event:CreateToggle({
        Name = "Open Chest",
        CurrentValue = false,
        Flag = "oc",
        Callback = function(v)
            ocr = v

            if v then
                oc = task.spawn(function()
                    while ocr and task.wait(2.4) do
                        local chest = workspace["IslandAssets"]["Island"]["Ice_Chest"]["Meshes/chest_2_Cube"]
                        if chest then hrp.CFrame = chest.CFrame; fireproximityprompt(chest["ProximityPrompt"]) else task.wait(1e2) end
                    end
                end)
            else
                task.cancel(oc); oc = nil
            end
        end,
    })
end

local function chearts()
    if fireproximityprompt then
        for _, item in ipairs(workspace.CurrentChocolates:GetChildren()) do
            hrp.CFrame = item:FindFirstChildWhichIsA("MeshPart").CFrame
            
            task.wait(.2)

            local pp = item:FindFirstChildWhichIsA("ProximityPrompt")
            fireproximityprompt(pp)
        end
    end
end

event:CreateDivider()

local ch, chr = nil, false
event:CreateToggle({
    Name = "Claim Hearts",
    CurrentValue = false,
    Flag = "ch",
    Callback = function(v)
        chr = v

        if chr then
            ch = task.spawn(function()
                while chr and task.wait(2.4) do
                    chearts()
                end
            end)
        else
            task.cancel(ch); ch = nil
        end
    end,
})

event:CreateButton({
	Name = "Claim Hearts",
	Callback = function()
        chearts()
    end,
})
--]]

event:CreateLabel("Eruption")

local function cvalc()
    if not fireproximityprompt then return end

    for _, item in ipairs(workspace.WeatherVisuals:GetChildren()) do
        local fruit = item:FindFirstChild("VolcanicFruit")
        if not fruit then
            continue
        end

        local handle = fruit:FindFirstChildWhichIsA("MeshPart")
        local prompt = fruit:FindFirstChildWhichIsA("ProximityPrompt")

        if handle and prompt then
            hrp.CFrame = handle.CFrame
            task.wait(0.2)
            fireproximityprompt(prompt)
        end
    end
end

event:CreateButton({
	Name = "Claim Volcanic",
	Callback = function()
        cvalc()
    end,
})

event:CreateLabel("Cosmic")

local function cosmic()
    if not fireproximityprompt then return end

    for _, item in ipairs(workspace.WeatherVisuals:GetChildren()) do
        local fruit = item:FindFirstChild("CosmicFruit")
        if not fruit then continue end

        local handle = fruit:FindFirstChildWhichIsA("MeshPart")
        local prompt = fruit:FindFirstChildWhichIsA("ProximityPrompt")

        if handle and prompt then
            hrp.CFrame = handle.CFrame
            task.wait(0.2)
            fireproximityprompt(prompt)
        end
    end
end


event:CreateButton({
	Name = "Claim Cosmic Fruit",
	Callback = function()
        cosmic()
    end,
})

local main = window:CreateTab("Visuals")
main:CreateLabel("Animals")
