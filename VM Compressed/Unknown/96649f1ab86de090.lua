print("-----------------")
local Players = game:GetService("Players")

local username = "Failed to get nickname"
if Players.LocalPlayer then
    username = Players.LocalPlayer.Name
end

local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local age = localPlayer.AccountAge

local executor = "Failed to get executor name"

if syn then
    executor = "Synapse Z"
    print("SUCCESS | Executor detected: Synapse Z.")
elseif Krnl or KRNL then
    executor = "KRNL"
    print("SUCCESS | Executor detected: KRNL.")
elseif Fluxus then
    executor = "Fluxus"
    print("SUCCESS | Executor detected: Fluxus.")
elseif typeof(getexecutorname) == "function" then
    executor = getexecutorname()
elseif typeof(getexecutor) == "function" then
    executor = getexecutor()
elseif typeof(identifyexecutor) == "function" then
    executor = identifyexecutor()
else
    executor = "Cannot Detect Executor"
end

if executor == "Cannot Detect Executor" or executor == "Failed to get executor name" then
    warn("WARNING | Cannot detect executor.")
else
    print("SUCCESS | Executor detected: " .. executor .. ".")
end

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

print("INFO | Detected PlaceId: " .. game.PlaceId)

if game.PlaceId == 91699433325780 then
    print("SUCCESS | Correct game.")

    Rayfield:Notify({
        Title = "Success",
        Content = "Correct game.\nWait to load.",
        Duration = 5,
        Image = "circle-check",
    })

    local Window = Rayfield:CreateWindow({
        Name = "💎 Brainrot Clicker | OP Script",
        Icon = 0,
        LoadingTitle = "Loading...",
        LoadingSubtitle = "by BadScriptsMaker",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = nil,
            FileName = "BrainrotClickerSCRIPT"
        }
    })

    local Tab = Window:CreateTab("🖱️ Auto 'Upgrades'")
    local Tab4 = Window:CreateTab("🔁 Auto Rebirth")
    local Tab2 = Window:CreateTab("📄 Misc")
    local Tab3 = Window:CreateTab("ℹ️ Info")

    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local ClickedRemote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("ClickedRemote")
    local UpgradeRemote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("UpgradeBought")
    local MegaUpgradeRemote = ReplicatedStorage:WaitForChild("Events"):WaitForChild("BuyMegaUpgrade")

    local autoclicker = false
    local running = false
    local megarunning = false
    local selected = "Noob"
    local megaselected = "RebirthPower"
    local clickdelay = 0.01
    local upgradedelay = 0.01
    local megadelay = 1
    local lastClickPrint = 0
    local lastUpgradePrint = 0
    local lastMegaPrint = 0

    Tab:CreateToggle({
        Name = "Auto Clicker (OP)",
        CurrentValue = false,
        Flag = "auto clicker toggle",
        Callback = function(value)
            autoclicker = value
            print("----------")
            print("SUCCESS | Changed toggle to: " .. tostring(value) .. ". (Brainrot Clicker Script)")
            print("----------")
        end,
    })

    task.spawn(function()
        while true do
            if autoclicker then
                ClickedRemote:FireServer()
            end
            task.wait(clickdelay)
        end
    end)

    Tab:CreateSlider({
        Name = "Auto Clicker Delay",
        Range = {0.01, 5},
        Increment = 0.01,
        Suffix = "Seconds",
        CurrentValue = 0.01,
        Flag = "click delay",
        Callback = function(value)
            clickdelay = value
            if tick() - lastClickPrint > 2 then
                lastClickPrint = tick()
                print("----------")
                print("SUCCESS | Changed value to: " .. value .. ". (Brainrot Clicker Script)")
                print("----------")
            end
        end,
    })

    local Divider = Tab:CreateDivider()

    Tab:CreateSlider({
        Name = "Auto Upgrade Delay",
        Range = {0.01, 10},
        Increment = 1,
        Suffix = "Seconds",
        CurrentValue = 0.01,
        Flag = "upgrade delay",
        Callback = function(value)
            upgradedelay = value
            if tick() - lastUpgradePrint > 2 then
                lastUpgradePrint = tick()
                print("----------")
                print("SUCCESS | Changed value to: " .. value .. ". (Brainrot Clicker Script)")
                print("----------")
            end
        end,
    })

        Tab:CreateDropdown({
        Name = "Select Upgrade",
        Options = {"Noob", "Pro", "Master", "Legend", "God", "Sigma", "Trallero", "Bombardiro", "Assassino", "Cappuccino", "TrippiTroppi", "BrBrPatapim", "TungSahur"},
        CurrentOption = {"Noob"},
        MultipleOptions = false,
        Flag = "upgrade dropdown",
        Callback = function(options)
            selected = options[1]
            print("SUCCESS | Selected dropdown: " .. selected)
        end,
    })

        Tab:CreateButton({
        Name = "Start Auto Upgrade",
        Callback = function()
            if running then
                print("NOTICE | Already running.")
                return
            end
            running = true
            task.spawn(function()
                while running do
                    UpgradeRemote:FireServer(selected)
                    task.wait(upgradedelay)
                end
            end)
            print("SUCCESS | Started Auto Upgrade.")
        end,
    })

    Tab:CreateButton({
        Name = "Stop Auto Upgrade",
        Callback = function()
            if not running then
                print("NOTICE | Already stopped.")
                return
            end
            running = false
            print("SUCCESS | Stopped Auto Upgrade.")
        end,
    })

    local Divider = Tab:CreateDivider()

    Tab2:CreateLabel("Scripts")

    Tab2:CreateButton({
        Name = "Infinite Yield",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
            print("SUCCESS | Executed: Infinite Yield.")
        end,
    })

    Tab2:CreateButton({
        Name = "Sigma Spy",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/depthso/Sigma-Spy/refs/heads/main/Main.lua"))()
            print("SUCCESS | Executed: Sigma Spy.")
        end,
    })

    Tab2:CreateButton({
        Name = "Anti-AFK",
        Callback = function()
wait(0.5)
local ba = Instance.new("ScreenGui")
local ca = Instance.new("TextLabel")
local da = Instance.new("Frame")
local _b = Instance.new("TextLabel")
local ab = Instance.new("TextLabel")
local closeBtn = Instance.new("TextButton")

ba.Name = "AntiAFKGui"
ba.Parent = game.CoreGui
ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ca.Parent = ba
ca.Active = true
ca.BackgroundColor3 = Color3.new(0.176, 0.176, 0.176)
ca.Draggable = true
ca.Position = UDim2.new(0.6986, 0, 0.0981, 0)
ca.Size = UDim2.new(0, 370, 0, 52)
ca.Font = Enum.Font.SourceSansSemibold
ca.Text = "Anti AFK Script"
ca.TextColor3 = Color3.new(0, 1, 1)
ca.TextSize = 22

da.Parent = ca
da.BackgroundColor3 = Color3.new(0.196, 0.196, 0.196)
da.Position = UDim2.new(0, 0, 1.019, 0)
da.Size = UDim2.new(0, 370, 0, 107)

_b.Parent = da
_b.BackgroundColor3 = Color3.new(0.176, 0.176, 0.176)
_b.Position = UDim2.new(0, 0, 0.8, 0)
_b.Size = UDim2.new(0, 370, 0, 21)
_b.Font = Enum.Font.Arial
_b.Text = "im going save you, son."
_b.TextColor3 = Color3.new(0, 1, 1)
_b.TextSize = 20

ab.Parent = da
ab.BackgroundColor3 = Color3.new(0.176, 0.176, 0.176)
ab.Position = UDim2.new(0, 0, 0.158, 0)
ab.Size = UDim2.new(0, 370, 0, 44)
ab.Font = Enum.Font.ArialBold
ab.Text = "Status: Active"
ab.TextColor3 = Color3.new(0, 1, 1)
ab.TextSize = 20

closeBtn.Parent = da
closeBtn.Position = UDim2.new(0.84, 0, 0.04, 0)
closeBtn.Size = UDim2.new(0, 50, 0, 25)
closeBtn.BackgroundColor3 = Color3.new(0.2, 0, 0)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextColor3 = Color3.new(1, 1, 1)
closeBtn.TextSize = 18

local antiAFKConnection

local vu = game:service("VirtualUser")
antiAFKConnection = game:service("Players").LocalPlayer.Idled:Connect(function()
    vu:CaptureController()
    vu:ClickButton2(Vector2.new())
    ab.Text = "Roblox tried to kick you but im stopped it, son!"
    wait(5)
    ab.Text = "Status: Active"
end)

closeBtn.MouseButton1Click:Connect(function()
    if antiAFKConnection then
        antiAFKConnection:Disconnect()
        antiAFKConnection = nil
    end
    ba:Destroy()
    print("SUCCESS | Closed: Anti AFK.")
end)
            print("SUCCESS | Executed: Anti AFK.")
        end,
    })

local RebirthRemote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth")

local autorebirth = false
local rebirthdelay = 1
local lastrebirthprint = 0

Tab4:CreateToggle({
    Name = "Auto Rebirth",
    CurrentValue = false,
    Flag = "auto rebirth toggle",
    Callback = function(value)
        autorebirth = value
        print("----------")
        print("SUCCESS | Changed toggle to: " .. tostring(value) .. ". (Brainrot Clicker Script)")
        print("----------")
    end,
})

Tab4:CreateSlider({
    Name = "Auto Rebirth Delay",
    Range = {0.01, 10},
    Increment = 1,
    Suffix = "Seconds",
    CurrentValue = 1,
    Flag = "rebirth delay",
    Callback = function(value)
        rebirthdelay = value
        if tick() - lastrebirthprint > 2 then
            lastrebirthprint = tick()
            print("----------")
            print("SUCCESS | Changed value to: " .. value .. ". (Brainrot Clicker Script)")
            print("----------")
        end
    end,
})

task.spawn(function()
    while true do
        if autorebirth then
            RebirthRemote:FireServer()
        end
        task.wait(rebirthdelay)
    end
end)

local Divider = Tab4:CreateDivider()

Tab4:CreateButton({
    Name = "Rebirth",
    Callback = function()
        local RebirthRemote = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth")
        RebirthRemote:FireServer()
        print("SUCCESS | Executed: Rebirth.")
    end,
})



    Tab3:CreateLabel("Version: v1.0.3")
    Tab3:CreateLabel("Status: Working (🟢)")
    Tab3:CreateLabel("Executor: " .. executor)
    Tab3:CreateLabel("Username: " .. username)
    Tab3:CreateLabel("Age account: " .. age .. " days")
    Tab3:CreateLabel("Whats new: Fixed auto upgrade:\nTrippi Troppi, Br Br Patapim, Tung Sahur is not upgrading.")
    Tab3:CreateLabel("Next update: More scripts on 'Misc'\n(P.S: Auto mega upgrades is not impossible. sorry)")
    Tab3:CreateLabel("Script: Free")

    print("SUCCESS | Loaded script. (Brainrot Clicker Script)")
end

if not game.PlaceId == 91699433325780 then
    warn("WARNING | Wrong game. (Brainrot Clicker Script)")
end