local windUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

local player = game.Players.LocalPlayer
local hmd = player.Character:WaitForChild("Humanoid")
local hrp = player.Character:WaitForChild("HumanoidRootPart")

local nc = game:GetService("ReplicatedStorage").Noclip:Clone()
local checkpoints = workspace:FindFirstChild("Checkpoints")
local buyRemote = game:GetService("ReplicatedStorage").ItemBuyEquip
local invList = player.PlayerGui.SideGuis.StoreFrame.ShopItems.InventoryList

local cfg = {
    jump = false,
    fly = false,
    speed = 16,
    jumpHeight = 10
}

player.CharacterAdded:Connect(function(chr)
    hmd = chr:WaitForChild("Humanoid")
    hrp = chr:WaitForChild("HumanoidRootPart")
    updateStats()
    giveFly()
end)

local window = windUI:CreateWindow({
    Title = "Назва",
    Icon = "cat",
    Author = "by k1llm3sixy",
    Folder = "tli",
})

window:OnDestroy(function()
    cfg.jump = false
    cfg.fly = false
    cfg.speed = 16
    cfg.jumpHeight = 10
    updateStats()
    giveFly()
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

function addToggle(tab, title, desc, def, cb)
    tab:Toggle({
        Title = title,
        Desc = desc,
        Icon = "check",
        Default = def,
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

local mainTab = window:Tab({ Title = "Main" })
local playerTab = window:Tab({ Title = "Player "})

addButton(mainTab, "Auto finish", nil, function()
    autoFinish()
end)
addButton(mainTab, "Get all cosmetics", "For free!", function()
    getCosmetics()
end)
addToggle(mainTab, "Give fly tool", nil, false, function(state)
    cfg.fly = state
    giveFly()
end)

addToggle(playerTab, "Enable jump", nil, false, function(state)
    cfg.jump = state
    updateStats()
end)
addSlider(playerTab, "Walk speed", nil, 1, 1, 100, hmd.WalkSpeed, function(val)
    cfg.speed = val
    updateStats()
end)
addSlider(playerTab, "Jump height", nil, 10, 10, 500, 10, function(val)
    cfg.jumpHeight = val
    updateStats()
end)

function giveFly()
    if cfg.fly then
        nc.Parent = player.Backpack
    end
end

function updateStats()
    hmd.UseJumpPower = not cfg.jump
    hmd.JumpHeight = cfg.jumpHeight
    hmd.WalkSpeed = cfg.speed
end

function autoFinish()
    local stage = player.leaderstats.Stage.Value
    for i = stage, 241 do
        local cp = checkpoints:FindFirstChild(tostring(i))
        if cp then
            hrp.CFrame = cp.CFrame + Vector3.new(0, 3, 0)
            firetouchinterest(hrp, cp, 0)
        end
        task.wait(0.1)
    end
end

function getCosmetics()
    for _, item in pairs(invList:GetChildren()) do
        if item.Name == "UIGridLayout" then continue end
        buyRemote:FireServer("Buy", item.Name, 0)
        task.wait(0.05)
    end
end
