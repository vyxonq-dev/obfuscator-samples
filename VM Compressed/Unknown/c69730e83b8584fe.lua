-- // t.me/arceusxcommunity <3
local Players = game:GetService("Players")
local RS      = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("CoreGui") and game:GetService("StarterGui")

local LP  = Players.LocalPlayer
local Net = require(RS.Modules.Communication.Network)

local TOL     = 6
local OFFSET  = 0
local DEBOUNCE = 0.15

local autoDig   = false
local autoSell  = false
local sellPct   = 100
local busyDig   = false
local busySell  = false
local activeDig = nil

local function notify(msg, dur)
    pcall(function()
        StarterGui:SetCore("SendNotification", { Title = "Shells Auto", Text = msg, Duration = dur or 3 })
    end)
    print("[Shells Auto] " .. msg)
end

local VirtualUser = game:GetService("VirtualUser")
LP.Idled:Connect(function()
    pcall(function()
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
end)

local function nrm(a) return (a % 360 + 360) % 360 end
local function adiff(a, b) return math.abs(((a - b + 180) % 360) - 180) end

local digParams = RaycastParams.new()
digParams.FilterType = Enum.RaycastFilterType.Include
digParams.IgnoreWater = true
digParams.FilterDescendantsInstances = { workspace:WaitForChild("Map") }

local function onDiggable()
    local char = LP.Character
    if not char then return false end
    local hit = workspace:Raycast(char:GetPivot().Position, Vector3.new(0, -12, 0), digParams)
    if not hit then return false end
    return hit.Material == Enum.Material.Sand or (hit.Instance and hit.Instance:HasTag("Diggable"))
end

local function getEquip()
    local char = LP.Character
    if not char then return nil end
    local cur = char:FindFirstChildOfClass("Tool")
    if cur and cur:GetAttribute("Type") == "Equipment" then return cur end
    local hum = char:FindFirstChildOfClass("Humanoid")
    if not hum then return nil end
    for _, t in ipairs(LP.Backpack:GetChildren()) do
        if t:IsA("Tool") and t:GetAttribute("Type") == "Equipment" then
            hum:EquipTool(t)
            task.wait(0.25)
            return char:FindFirstChildOfClass("Tool")
        end
    end
    return nil
end

local function invInfo()
    local ok, info = pcall(function() return Net.Storage.queries.GetStorageInfo.invoke() end)
    if ok and info and info.Limit and info.Limit > 0 then
        return (info.Current / info.Limit) * 100, info.Current, info.Limit
    end
    return 0, 0, 0
end

local function nearestMerchant()
    local char = LP.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then return nil end
    local best, bestD
    for _, m in ipairs(workspace.Map:GetDescendants()) do
        if m.Name == "Merchant" and m:FindFirstChild("HumanoidRootPart") then
            local d = (m.HumanoidRootPart.Position - hrp.Position).Magnitude
            if not bestD or d < bestD then bestD, best = d, m end
        end
    end
    return best
end

local function sellAll()
    if busySell then return end
    busySell = true
    local char = LP.Character
    local hrp  = char and char:FindFirstChild("HumanoidRootPart")
    if not hrp then busySell = false return end

    local merchant = nearestMerchant()
    local saved = hrp.CFrame
    if merchant then
        hrp.CFrame = merchant.HumanoidRootPart.CFrame * CFrame.new(0, 0, 5)
        task.wait(0.4)
    end

    pcall(function() Net.Merchant.packets.SellAll.send() end)
    task.wait(0.55)

    if merchant then
        hrp.CFrame = saved
        task.wait(0.1)
    end
    notify("Inventory sold", 2)
    busySell = false
end

Net.QTE.packets.BarSwap.listen(function(p)
    local s = activeDig
    if not s then return end
    local now = workspace:GetServerTimeNow()
    if p.swapId == s.swapId then
        s.swapStartLine = p.swapStartLine
        s.swapTime = p.swapTime
    else
        local v = nrm(s.swapStartLine + s.barSpeed * (now - s.swapTime))
        s.swapId = p.swapId
        s.swapStartLine = v
        s.swapTime = now
    end
    s.barSpeed = p.barSpeed
    s.barRotation = p.barRotation
end)

Net.QTE.packets.FinishQTE.listen(function(_)
    local s = activeDig
    if s then s.finished = true end
end)

local function doDig()
    local r = Net.QTE.queries.StartQTE.invoke()
    if not r or r.fail then return false, r end

    local s = {
        swapId       = r.swapId,
        swapTime     = r.swapTime,
        swapStartLine= r.swapStartLine,
        barSpeed     = r.barSpeed,
        barRotation  = r.barRotation,
        finished     = false,
    }
    activeDig = s

    local lastClick = 0
    local deadline = os.clock() + 25
    while not s.finished and os.clock() < deadline and autoDig do
        local sp = s.barSpeed
        if sp and sp ~= 0 then
            local now  = workspace:GetServerTimeNow()
            local line = nrm(s.swapStartLine + sp * (now - s.swapTime))
            local target = nrm(s.barRotation - OFFSET)
            if adiff(line, target) <= TOL and (os.clock() - lastClick) >= DEBOUNCE then
                s.swapStartLine = line
                s.swapTime = now
                s.barSpeed = -sp
                Net.QTE.packets.Click.send({ swapId = s.swapId, clickTime = now })
                lastClick = os.clock()
            end
        end
        task.wait()
    end

    if not s.finished then
        pcall(function() Net.QTE.packets.CancelQTE.send() end)
    end
    activeDig = nil
    return s.finished
end

local function digLoop()
    if busyDig then return end
    busyDig = true
    while autoDig do
        local pct = select(1, invInfo())
        if pct >= 100 then
            if autoSell then
                sellAll()
            else
                notify("Inventory full — digging paused", 3)
                task.wait(3)
            end
        elseif not onDiggable() then
            task.wait(0.5)
        elseif not getEquip() then
            task.wait(0.5)
        else
            doDig()
            task.wait(0.05)
        end
        task.wait()
    end
    busyDig = false
end

local function sellWatcher()
    while autoSell do
        local pct = select(1, invInfo())
        if pct >= sellPct and not busySell then
            sellAll()
            task.wait(1)
        end
        task.wait(2)
    end
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local w = lib:Window("Shells [Farm]")

w:Toggle("Auto Dig", false, function(state)
    autoDig = state
    if state then
        task.spawn(digLoop)
        notify("Auto Dig enabled", 2)
    end
end)

w:Button("Sell All", function()
    task.spawn(sellAll)
end)

w:Toggle("Auto Sell", false, function(state)
    autoSell = state
    if state then
        task.spawn(sellWatcher)
        notify("Auto Sell enabled", 2)
    end
end)

w:Box("Sell at %", function(text, focuslost)
    if focuslost then
        local num = tonumber(text)
        if num and num >= 0 and num <= 100 then
            sellPct = num
        end
    end
end)

w:Label("Toggle GUI: P key", Color3.fromRGB(127, 143, 166))

lib:Keybind("P")
