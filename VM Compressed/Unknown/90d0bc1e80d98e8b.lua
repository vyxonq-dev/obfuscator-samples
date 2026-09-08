
repeat
    print("loading")
until game:IsLoaded()

local p = game:GetService("Players")

local reps = game:GetService("ReplicatedStorage")

local rf = reps.RemoteFunctions

local lp = p.LocalPlayer

local function godmode()
    local at = workspace.ActiveTsunamis

    if not at then
        return
    end

    for i, v in pairs(at:GetDescendants()) do
        if v:IsA("BasePart") and v.Name == "Hitbox" then
            v:Destroy()
        end
    end
end

local function notsu()
    local at = workspace.ActiveTsunamis

    if not at then
        return
    end

    for i, v in pairs(at:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Transparency = 1
        end
    end
end

local function upgradespeed()
    local remote = rf.UpgradeSpeed

    remote:InvokeServer(5)
end

local function rebirth()
    local remote = rf.Rebirth

    remote:InvokeServer()
end

local function upgrade()
    local remote = rf.UpgradeBase

    remote:InvokeServer()
end

local function upgradec()
    local remote = rf.UpgradeCarry

    remote:InvokeServer()
end

local function sellall()
    local remote = rf.SellAll

    remote:InvokeServer()
end

local function upgradeb(slot)
    local remote = rf.UpgradeBrainrot

    remote:InvokeServer(slot)
end

local function getbase()
    local bases = workspace.Bases

    for i, v in pairs(bases:GetChildren()) do
        if v:IsA("Model") and v:GetAttribute("Holder") == lp.UserId then
            return v
        end
    end

    return nil
end

local function upgradeallb()
    local base = getbase()

    if not base then
        print("nobase")
        return
    end

    for i, v in pairs(base.Slots:GetChildren()) do
        if v:IsA("Model") and v.Name:lower():find("slot") and v:FindFirstChildWhichIsA("Tool") then
            upgradeb(v.Name)
        end
    end
end

local function home()
    local base = getbase()

    if not base then
        return
    end

    local part = base.Home

    if not part then
        return
    end

    pcall(
        function()
            lp.Character.HumanoidRootPart.CFrame = part.CFrame
        end
    )
end

local function speedchanger()
    local speed = getgenv().Scv or 16

    lp:SetAttribute("CurrentSpeed", speed)
end

local function collectmoney()
    local remote = reps.RemoteEvents:FindFirstChild("CollectMoney")

    if not remote then
        return
    end

    for slot = 1, 30 do
        pcall(
            function()
                remote:FireServer("Slot" .. slot)
            end
        )

        task.wait(0.05)
    end
end

-- GUI Rayfield

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window =
    Rayfield:CreateWindow(
    {
        Name = "Escape Tsunami For Brainrots!",
        LoadingTitle = "TUMBLR",
        LoadingSubtitle = "Idk who am i",
        ConfigurationSaving = {
            Enabled = false
        },
        KeySystem = false
    }
)

local MainTab = Window:CreateTab("Main", 4483362458)

_G.MainTab = MainTab

Rayfield:LoadConfiguration()

-- MAIN TAB

MainTab:CreateSection("Brainrots Menu")

MainTab:CreateButton(
    {
        Name = "Tp to home",
        Callback = function()
            pcall(home)
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Auto collect money",
        CurrentValue = false,
        Flag = "Acm",
        Callback = function(state)
            getgenv().Acm = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Godmode",
        CurrentValue = false,
        Flag = "Gm",
        Callback = function(state)
            getgenv().Gm = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "No Tsunami [visual only]",
        CurrentValue = false,
        Flag = "Nt",
        Callback = function(state)
            getgenv().Nt = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Auto upgrade speed",
        CurrentValue = false,
        Flag = "Aus",
        Callback = function(state)
            getgenv().Aus = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Auto upgrade carry",
        CurrentValue = false,
        Flag = "Auc",
        Callback = function(state)
            getgenv().Auc = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Auto sell all",
        CurrentValue = false,
        Flag = "Asa",
        Callback = function(state)
            getgenv().Asa = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Auto rebirth",
        CurrentValue = false,
        Flag = "Ar",
        Callback = function(state)
            getgenv().Ar = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Auto upgrade base",
        CurrentValue = false,
        Flag = "Aub",
        Callback = function(state)
            getgenv().Aub = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Auto upgrade brainrots",
        CurrentValue = false,
        Flag = "Aub2",
        Callback = function(state)
            getgenv().Aub2 = state
        end
    }
)

MainTab:CreateToggle(
    {
        Name = "Speed changer",
        CurrentValue = false,
        Flag = "Sc",
        Callback = function(state)
            getgenv().Sc = state
        end
    }
)

MainTab:CreateSlider(
    {
        Name = "Speed Value",
        Range = {16, 300},
        Increment = 1,
        CurrentValue = 16,
        Flag = "Scv",
        Callback = function(value)
            getgenv().Scv = tonumber(value) or 16
        end
    }
)

-- LOOP

task.spawn(
    function()
        while task.wait(0.2) do
            if getgenv().Gm then
                pcall(godmode)
            end

            if getgenv().Nt then
                pcall(notsu)
            end

            if getgenv().Sc then
                pcall(speedchanger)
            end
        end
    end
)

task.spawn(
    function()
        while task.wait(1) do
            if getgenv().Aus then
                pcall(upgradespeed)
            end

            if getgenv().Auc then
                pcall(upgradec)
            end

            if getgenv().Asa then
                pcall(sellall)
            end

            if getgenv().Ar then
                pcall(rebirth)
            end

            if getgenv().Aub then
                pcall(upgrade)
            end

            if getgenv().Aub2 then
                pcall(upgradeallb)
            end
        end
    end
)

task.spawn(
    function()
        while task.wait(2) do
            if getgenv().Acm then
                pcall(collectmoney)
            end
        end
    end
)

-- Universal Framework

local Universal =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BIANTCA/Script/refs/heads/main/universal.lua"))()

Universal.CreateUniversalTab(Window, Rayfield, game:GetService("Players"), game:GetService("RunService"))
