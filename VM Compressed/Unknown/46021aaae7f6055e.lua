local windUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local vim = game:GetService("VirtualInputManager")

local duckFolder = workspace:FindFirstChild("Ducks")
local hatFolder = workspace:FindFirstChild("EventMap"):FindFirstChild("Hats")
local slapsFolder = workspace:FindFirstChild("Slaps")
local codeDoor = workspace:FindFirstChild("CodeDoor"):FindFirstChild("Code")
local damageEvent = game:GetService("ReplicatedStorage").DamageEvent
local giveItemEvent = game:GetService("ReplicatedStorage").Remotes.GiveItem

local player = game.Players.LocalPlayer
local hmd = player.Character:WaitForChild("Humanoid")
local hmdRoot = player.Character:WaitForChild("HumanoidRootPart")

local isAutoWin = false
local isAutoNexus = false
local requiredWins = 10

local locations = {
    ["Win pad"] = workspace:FindFirstChild("WinPad").CFrame,
    ["Win pad spawn teleport"] = workspace:FindFirstChild("SpawnPad").CFrame,
    ["Main spawn"] = workspace:FindFirstChild("SpawnLocation").CFrame,
    ["Secret Teleport 1"] = CFrame.new(-72.1029587, 15.9999981, -387.35144, 0.99994725, -7.4522708e-09, 0.0102725271, 7.50700746e-09, 1, -5.28986632e-09, -0.0102725271, 5.36670308e-09, 0.99994725),
    ["Secret Teleport 2"] = CFrame.new(1740.85583, 122.878571, -1222.40833, 4.58473153e-08, 7.29714316e-08, 1, -3.06086569e-08, 1, -7.29714316e-08, -1, -3.06086534e-08, 4.58473153e-08),
    ["Secret Teleport 3"] = CFrame.new(-76.7436829, 319.000031, -399.857635, 0.0611650608, 3.19898241e-08, -0.998127639, 3.46372246e-08, 1, 3.41723947e-08, 0.998127639, -3.66625272e-08, 0.0611650608),
    ["Secret Teleport 4"] = CFrame.new(-84.0539017, 366.201019, -194.727051, 0, 0, 1, 0, 1, -0, -1, 0, 0),
    ["Troll button 1"] = workspace:FindFirstChild("TrollButton1"):FindFirstChild("Part").CFrame,
    ["Troll button 2"] = workspace:FindFirstChild("TrollButton2"):FindFirstChild("Part").CFrame,
    ["Disable Troll button"] = workspace:FindFirstChild("DisableTroll"):FindFirstChild("Part").CFrame,
    ["Slap shop 1"] = workspace:GetChildren()[485].CFrame,
    ["Slap shop 2"] = CFrame.new(-59.3957825, 11.0049982, -341.01886, 0.0303920247, 1.59331908e-08, -0.999538064, 1.67314234e-08, 1, 1.64492917e-08, 0.999538064, -1.72236216e-08, 0.0303920247),
    ["NEXUS Slap"] = workspace:FindFirstChild("Slaps"):FindFirstChild("NEXUS Slap").Hitbox.CFrame,
    ["Tower of Easy jumps"] = CFrame.new(-209.059265, 4.0000124, -322.284088, -0.0458256789, 7.41499235e-08, 0.998949468, -5.97685457e-08, 1, -7.69697195e-08, -0.998949468, -6.3232946e-08, -0.0458256789),
    ["Tower of Medium jumps"] = CFrame.new(-208.448242, 4.0000124, -333.342194, -0.0684956685, -3.85939147e-09, 0.997651398, -2.19928307e-08, 1, 2.35851694e-09, -0.997651398, -2.17796305e-08, -0.0684956685)
}

local locationsOrder = {
    "Secret Teleport 1",
    "Secret Teleport 2",
    "Secret Teleport 3",
    "Secret Teleport 4",
    "Troll button 1",
    "Troll button 2",
    "Disable Troll button",
    "Slap shop 1",
    "Slap shop 2",
    "Win pad",
    "Win pad spawn teleport",
    "Main spawn",
    "NEXUS Slap",
    "Tower of Easy jumps",
    "Tower of Medium jumps"
}

local collectableSlaps = {
    "Amber Slap",
    "Blue Slap",
    "Emerald Slap",
    "Green Slap",
    "Neon Slap",
    "Purple Slap",
    "Ruby Slap",
    "Victorious Slap"
}

local rewardItems = {
    "Banana Peel",
    "Fire Slap",
    "Grapple Hook"
}

player.CharacterAdded:Connect(function(character)
    hmd = character:WaitForChild("Humanoid")
    hmdRoot = character:WaitForChild("HumanoidRootPart")
end)

local window = windUI:CreateWindow({
    Title = "Troll Tower INFINITY script",
    Icon = "cat",
    Author = "by k1llm3sixy",
    Folder = "tli",
})

window:OnDestroy(function()
    isAutoWin = false
    isAutoNexus = false
end)

window:EditOpenButton({
    Title = "Open",
    Icon = "chevrons-left-right-ellipsis",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("FF0F7B"),
        Color3.fromHex("F89B29")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

function addButton(tab, title, desc, cb)
    tab:Button({
        Title = title,
        Desc = desc,
        Locked = false,
        Callback = cb
    })
end

function addSlider(tab, title, desc, step, min, max, def, cb)
    tab:Slider({
        Title = title,
        Desc = desc,
        Step = step,
        Value = {
            Min = min,
            Max = max,
            Default = def
        },
        Callback = cb
    })
end

function addToggle(tab, title, desc, def, cb)
    tab:Toggle({
        Title = title,
        Desc = desc,
        Icon = "check",
        Default = def,
        Callback = cb
    })
end

function addInput(tab, title, desc, val, ph, cb)
    tab:Input({
        Title = title,
        Desc = desc,
        Value = val,
        InputIcon = "bird",
        Type = "Input",
        Placeholder = ph,
        Callback = cb
    })
end

local mainTab = window:Tab({ Title = "Main", Locked = false })
local gameTab = window:Tab({ Title = "Game", Locked = false })
local teleportTab = window:Tab({ Title = "Teleports", Locked = false })
local playerTab = window:Tab({ Title = "Player", Locked = false })

addButton(mainTab, "Get all ducks", "Almost all (26/30 ducks)", function() task.spawn(getDucks()) end)
addButton(mainTab, "Get all slaps", "Almost all (not including shop slaps)", function() task.spawn(getSlaps()) end)
addButton(mainTab, "Get all reward tools", nil, function() task.spawn(getRewardTools()) end)
addToggle(mainTab, "Auto win", "1 minute - 1 win. Game restriction :(", false, function(state)
    isAutoWin = state
    autoWin()
end)

addButton(gameTab, "Get spawn door code", nil, function() getDoorCode() end)
addToggle(gameTab, "Auto NEXUS Slap", "Automatically attempts to obtain NEXUS Slap", false, function(state)
    isAutoNexus = state
    autoNexus()
end)
addInput(gameTab, "Required wins", "Minimum wins needed to use the auto-NEXUS feature", 10, "Enter number...", function(input)
    requiredWins = tonumber(input)
end)

addSlider(playerTab, "Walk speed", nil, 1, 1, 100, hmd.WalkSpeed, function(speed) hmd.WalkSpeed = speed end)
addSlider(playerTab, "Jump power", nil, 10, 10, 500, hmd.JumpPower, function(power) hmd.JumpPower = power end)
addButton(playerTab, "Disable damage", "Disables all damage from kill parts", function() disableDamage() end)

for _, name in ipairs(locationsOrder) do addButton(teleportTab, name, nil, function() teleport(locations[name]) end) end

function createNotify(title, content, dur)
    windUI:Notify({
    Title = title,
    Content = content,
    Duration = dur,
    Icon = "bell",
})
end

function teleport(pos) hmdRoot.CFrame = pos end

function pressKey(key)
    vim:SendKeyEvent(true, key, false, nil)
    vim:SendKeyEvent(false, key, false, nil)
end

function getDucks()
    local function firePrompt(objs, regex)
        if not objs then
            createNotify("Get duck error", "Objects not found!", 2.2)
            return
        end

        for _, obj in ipairs(objs:GetChildren()) do
            if regex and not obj.Name:match(regex) then continue end
            local prompt = obj:FindFirstChild("ProximityPrompt")
            if prompt and prompt:IsA("ProximityPrompt") then
                prompt.HoldDuration = 0
                prompt.RequiresLineOfSight = false
                hmdRoot.CFrame = obj.CFrame
                task.wait(0.3)
                pressKey(Enum.KeyCode.E)
            end
            task.wait(0.5)
        end
    end

    if hatFolder then firePrompt(hatFolder, "Hat") end
    if duckFolder then firePrompt(duckFolder, ".*duck") end
end

function getDoorCode()
    if codeDoor then
        createNotify("Spawn door code", "Code: " .. codeDoor.Value, 3)
        else
            createNotify("Spawn door code", "Code not found!", 2.5)
    end
end

function disableDamage()
    if damageEvent then
        damageEvent:Destroy()
        createNotify("Damage event", "Damage event successfuly removed!", 2)
        else
            createNotify("Damage event", "Damage event not found!", 2.5)
    end
end

function autoWin()
    while isAutoWin do
        hmdRoot.CFrame = locations["Win pad"]
        task.wait(0.2)
        hmdRoot.CFrame = locations["Win pad spawn teleport"]
        task.wait(61)
    end
end

function getSlaps()
    if not slapsFolder then
        createNotify("Slap collector", "Slaps folder not found!", 2.5)
        return
    end

    for _, slap in ipairs(slapsFolder:GetChildren()) do
        if not table.find(collectableSlaps, slap.Name) then continue end
        local part = slap:FindFirstChild("Build"):FindFirstChild("Part")
        if not part then
            createNotify("Slap collector", "Slaps part not found!", 2.5)
            break
        end

        hmdRoot.CFrame = part.CFrame
        task.wait(0.3)
        pressKey(Enum.KeyCode.E)

        task.wait(0.5)
    end
    hmdRoot.CFrame = locations["Main spawn"]
end

function getRewardTools()
    if not giveItemEvent then
        createNotify("Give item event", "Give item event not found!", 2.5)
        return
    end

    for _, item in ipairs(rewardItems) do
        giveItemEvent:FireServer(item)
        task.wait(1)
    end
end

function autoNexus()
    local hb = workspace.Slaps["NEXUS Slap"].Hitbox
    local prompt = hb:FindFirstChild("ProximityPrompt")
    prompt.HoldDuration = 0
    if isAutoNexus then hmdRoot.CFrame = hb.CFrame end

    while isAutoNexus do
        local wins = player.leaderstats["\240\159\143\134 Wins"].Value

        if wins >= requiredWins then
            task.wait(0.3)
            pressKey(Enum.KeyCode.E)
        end
        task.wait(0.5)
    end
end
