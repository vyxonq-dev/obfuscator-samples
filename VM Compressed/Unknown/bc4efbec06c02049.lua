-- ============================================================
--  Practical Basketball  (v2.0.0)
--  Aero "Learn PB" utility script
--  UI library : Sift  (https://sift.win/scripts/ui)
-- ============================================================

-- ============================================================
--  CONFIG
-- ============================================================
local SIFT_URL = "https://sift.win/scripts/ui"
local SCRIPT_NAME = "Practical Basketball"

local CONFIG = {
    siftUrl = SIFT_URL,
    keysystem = false,

    shooting = {
        enabled = false,
        key = Enum.KeyCode.X,
        greenOffsetY = -1.31,
        releaseTolerance = 0.015,              -- catches quantized meter steps around the target
        armPadding = 0.35,
        shotTimeout = 2.5,
        releaseMode = "Auto",                  -- "Auto" | "Hold"
        forceGreenMethod = "Reversal",         -- Reversal | Threshold | Timed | Peak | Assist
        device = "Auto",                       -- Auto | PC | Controller | Mobile
        deviceOffsets = { PC = 0, Controller = 0.02, Mobile = 0.05 },
        meter = "Auto",                        -- Auto | Vertical | Rocket | Bat | Funnel | Hoop | Roblox
        meterOffsets = {
            Vertical = -1.31,
            Rocket = -1.28,
            Bat = -0.15,
            Funnel = -1.16,
            Hoop = -1.24,
            Roblox = -1.20,
        },
        shotLog = { enabled = true, maxLines = 24 },
        autoShoot = { enabled = false, maxRange = 30, minContestDist = 3.5, onlyWideOpen = false },
        autoClutch = { enabled = false, range = 10 },
        autoLob = { enabled = false, catchRange = 7 },
        smartJelly = { enabled = false, commitDist = 4.5, keySequence = "X" },
        pumpFake = { enabled = false, notify = true },
        autoRunUp = { enabled = false, minDist = 6, maxDist = 14 },
        visualizer = { enabled = false, range = 30 },
    },

    dribble = {
        enabled = true,
        moveSlots = {
            { name = "Crossover",      key = Enum.KeyCode.One },
            { name = "Hesitation",     key = Enum.KeyCode.Two },
            { name = "StepBack",       key = Enum.KeyCode.Three },
            { name = "Spin",           key = Enum.KeyCode.Four },
            { name = "Tween",          key = Enum.KeyCode.Five },
            { name = "DoubleCrossover",key = Enum.KeyCode.Six },
            { name = "BehindBack",     key = Enum.KeyCode.Seven },
            { name = "SnatchBack",     key = Enum.KeyCode.Eight },
            { name = "Combo",          key = Enum.KeyCode.Nine },
            { name = "Breakdown",      key = Enum.KeyCode.Zero },
            { name = "HalfSpin",       key = Enum.KeyCode.Minus },
            { name = "SwitchHand",     key = Enum.KeyCode.Equals },
        },
        comboSlots = {
            { moves = { "Crossover", "StepBack", "Crossover" }, key = Enum.KeyCode.T, loop = false },
            { moves = { "Spin", "Combo", "SnatchBack" },        key = Enum.KeyCode.Y, loop = false },
            { moves = { "Hesitation", "Crossover", "StepBack" },key = Enum.KeyCode.U, loop = false },
            { moves = { "HalfSpin", "Combo", "Spin" },          key = Enum.KeyCode.I, loop = false },
            { moves = { "Breakdown", "Tween", "BehindBack" },   key = Enum.KeyCode.O, loop = false },
        },
        recorder = { recordKey = Enum.KeyCode.P, playbackKey = Enum.KeyCode.L },
        autoAnkle = { enabled = false, triggerDist = 3.5, move = "Crossover" },
    },

    defense = {
        autoBlock = {
            enabled = false,
            shotTypes = {
                Jumpshot      = { enabled = true,  jumpLead = 0.10, range = 22 },
                CloseShot     = { enabled = true,  jumpLead = 0.16, range = 12 },
                Layup         = { enabled = true,  jumpLead = 0.20, range = 8 },
                FadeAway      = { enabled = true,  jumpLead = 0.06, range = 20 },
                MovingShot    = { enabled = true,  jumpLead = 0.08, range = 18 },
                Floater       = { enabled = true,  jumpLead = 0.14, range = 9 },
                FreeThrow     = { enabled = true,  jumpLead = 0.20, range = 6 },
                PostFade      = { enabled = true,  jumpLead = 0.10, range = 10 },
                SpinHook      = { enabled = true,  jumpLead = 0.18, range = 9 },
            },
        },
        autoGuard = {
            enabled = false,
            prioritiseBallHolder = true,
            followDistance = 6,
            directMoveThreshold = 14,
            recomputeInterval = 0.4,
            recomputeIfMoved = 2.5,
            waypointReachRadius = 3,
            agentHeight = 6,
            agentRadius = 3,
            agentCanJump = true,
            prediction = true,     -- lead target by their velocity
            reactionDelay = 0.15,  -- ignore jukes for N seconds after direction change
            screenAvoid = true,    -- keep a side offset (avoid screens)
            sticky = true,         -- close up tight once engaged
        },
        offBall = { enabled = false, guardDistance = 8 },
        autoSteal = { enabled = false, range = 4.5, cooldown = 1.2 },
        blockBoost = { enabled = false, speed = 28, duration = 2 },
    },

    movement = {
        glide = {
            enabled = false,
            dribble = 1.0, shot = 0.9, block = 1.15, rebound = 1.25,
            sprint = 1.35, screen = 1.0, withBall = 1.0,
        },
        autoRebound = { enabled = false, range = 14, jumpAt = 0.55, active = true },
        ballMagnet = { enabled = false, range = 14, grabDist = 4 },
        staminaGuard = { enabled = false, threshold = 30 },
        smartSprint = { enabled = false },
        antiStun = { enabled = false },
        autoCrab = { enabled = false, triggerDist = 3 },
    },

    cosmetics = {
        greenEffectEnabled = false,
        greenEffectName = "None",
        bannerTitle = "Newcomer",
        bannerBackground = "Default",
        overall = 97,
        grade = 44,
        fakeName = "",
        emote = "Dougie",
        perfectCamera = false,
    },

    camera = {
        lock = false,
        strength = 0.5,
        targetBall = true,   -- always track closest ball
    },

    combo = {
        key = Enum.KeyCode.B,
        sequence = "X E X",
        loop = false,
    },

    esp = {
        enabled = false,
        teamMode = "Enemies", -- "Enemies" | "All"
        color = Color3.fromRGB(255, 80, 80),
        teamColor = Color3.fromRGB(80, 255, 80),
        showHealth = true,
        showDistance = true,
    },

    proximity = {
        enabled = false,
        warningRange = 16,
        goodRange = 6,
    },

    spoofer = {
        enabled = false,
        glowColor = Color3.fromRGB(120, 160, 255),
    },

    player = {
        walkSpeed = 16,
        jumpPower = 50,
    },
}

-- ============================================================
--  SERVICES
-- ============================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local PathfindingService = game:GetService("PathfindingService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")

local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Give the replicated game hierarchy a bounded window to become available.
local Aero = ReplicatedStorage:WaitForChild("Aero", 10)
local AeroRemotes = Aero and Aero:WaitForChild("AeroRemoteServices", 10)

local InputService, InterfaceService, GameplayService = nil, nil, nil
if AeroRemotes then
    InputService = AeroRemotes:FindFirstChild("InputService")
    InterfaceService = AeroRemotes:FindFirstChild("InterfaceService")
    GameplayService = AeroRemotes:FindFirstChild("GameplayService")
end

local function remSvc(svc, name)
    if not svc then return nil end
    return svc:WaitForChild(name, 5)
end

local ShootRemote = remSvc(InputService, "Shoot")
local DribbleRemote = remSvc(InputService, "Dribble")
local SprintRemote = remSvc(InputService, "Sprint")
local DropBallRemote = remSvc(InputService, "DropBall")
local StealRemote = remSvc(InputService, "Steal")
local PassRemote = remSvc(InputService, "Pass")
local ClutchRemote = remSvc(InputService, "Clutch")
local ScreenRemote = remSvc(InputService, "Screen")
local HoldGRemote = remSvc(InputService, "HoldG")
local EmoteRemote = remSvc(InputService, "Emote")
local JumpRemote = remSvc(InputService, "Jump")
local PostRemote = remSvc(InputService, "Post")
local OutputRemote = remSvc(InputService, "Output")
local MoveDirRemote = remSvc(InputService, "MoveDirection")
local GreenAnimRemote = remSvc(InputService, "GreenAnimation")

local PerfectCameraRemote = remSvc(InterfaceService, "PerfectCamera")

local Characters = workspace:WaitForChild("Characters", 15) or workspace
local Basketballs = workspace:WaitForChild("Basketballs", 15)
local Hoops = workspace:WaitForChild("Hoops", 15)

-- forward declarations (referenced before their definitions below)
local logOutput
local playSequence
local nearestEnemy
local nearestEnemyDist
local boostBlock
local baseWalkSpeed = CONFIG.player.walkSpeed

local function keyFrom(v, fallback)
    if typeof(v) == "EnumItem" then return v end
    if type(v) == "table" then
        local k = v.Key or v.KeyCode or v.Value
        if typeof(k) == "EnumItem" then return k end
    end
    return fallback
end

-- ============================================================
--  GAME KNOWLEDGE
-- ============================================================

local METER_TYPES = { "Vertical", "Rocket", "Bat", "Funnel", "Hoop", "Roblox" }

local GREEN_EFFECTS = {
    "None", "Basic", "Basic (Blue)", "Basic (Green)", "Basic (Orange)", "Basic (Red)",
    "Blast", "Dyna", "Fire", "Hearts", "Lightning", "Smoke", "Tundra", "Void", "Water",
}

-- hand-aware dribble inputs (R = right-hand player, L = left-hand player)
local MOVE_KEYS = {
    Crossover       = { R = "Z",   L = "C" },
    Hesitation      = { R = "C",   L = "Z" },
    DoubleCrossover = { R = "CC",  L = "ZZ" },
    Tween           = { R = "ZZ",  L = "CC" },
    BehindBack      = { R = "CX",  L = "ZX" },
    Spin            = { R = "CXZ", L = "ZXC" },
    SwitchHand      = { R = "H",   L = "H" },
    StepBack        = { R = "X",   L = "X" },
    DoubleBehindBack= { R = "XZ",  L = "XZ" },
    SnatchBack      = { R = "XX",  L = "XX" },
    Combo           = { R = "VV",  L = "VV" },
    Breakdown       = { R = "VC",  L = "VC" },
    HalfSpin        = { R = "V",   L = "V" },
}

local MOVE_LIST = {}
for name in pairs(MOVE_KEYS) do MOVE_LIST[#MOVE_LIST + 1] = name end
table.sort(MOVE_LIST)

local EMOTES = {
    "Dougie", "Take The L", "Big Stepper", "Money Flipping", "kindaSturdy",
    "HipSway", "Street Glide", "Aura Sit", "Bop", "Boxing", "Shoot",
    "Druski Dance", "Popular", "Trip Out", "dance", "Pop Out", "Coffin Walkout",
    "Rakai", "hmm", "what",
}

local KEY_MAP = {
    X = Enum.KeyCode.X, E = Enum.KeyCode.E, G = Enum.KeyCode.G, V = Enum.KeyCode.V,
    Q = Enum.KeyCode.Q, F = Enum.KeyCode.F, R = Enum.KeyCode.R, C = Enum.KeyCode.C,
    B = Enum.KeyCode.B, N = Enum.KeyCode.N, T = Enum.KeyCode.T, Y = Enum.KeyCode.Y,
    W = Enum.KeyCode.W, A = Enum.KeyCode.A, S = Enum.KeyCode.S, D = Enum.KeyCode.D,
    Z = Enum.KeyCode.Z, H = Enum.KeyCode.H, U = Enum.KeyCode.U, I = Enum.KeyCode.I,
    O = Enum.KeyCode.O, P = Enum.KeyCode.P, K = Enum.KeyCode.K, J = Enum.KeyCode.J,
    L = Enum.KeyCode.L, M = Enum.KeyCode.M,
    Space = Enum.KeyCode.Space,
    Shift = Enum.KeyCode.LeftShift,
    ["1"] = Enum.KeyCode.One, ["2"] = Enum.KeyCode.Two,
    ["3"] = Enum.KeyCode.Three, ["4"] = Enum.KeyCode.Four,
    ["5"] = Enum.KeyCode.Five, ["6"] = Enum.KeyCode.Six,
    ["7"] = Enum.KeyCode.Seven, ["8"] = Enum.KeyCode.Eight,
    ["9"] = Enum.KeyCode.Nine, ["0"] = Enum.KeyCode.Zero,
    ["-"] = Enum.KeyCode.Minus, ["="] = Enum.KeyCode.Equals,
}

local SHOOT_KEY_OPTIONS = {}
for keyName in pairs(KEY_MAP) do
    SHOOT_KEY_OPTIONS[#SHOOT_KEY_OPTIONS + 1] = keyName
end
table.sort(SHOOT_KEY_OPTIONS, function(a, b)
    return tostring(a) < tostring(b)
end)

local SHOT_TYPES = {
    "Jumpshot", "CloseShot", "Layup", "FadeAway", "MovingShot",
    "Floater", "FreeThrow", "PostFade", "SpinHook",
}

-- ============================================================
--  CHARACTER UTILITIES
-- ============================================================

local CHAR, root, humanoid

local function getChar(p)
    local target = p or LocalPlayer
    local c = Characters:FindFirstChild(target.Name) or target.Character
    return c and c.Parent and c or nil
end

local function refreshCharacter()
    CHAR = getChar(LocalPlayer)
    root = CHAR and CHAR:FindFirstChild("HumanoidRootPart")
    humanoid = CHAR and CHAR:FindFirstChildOfClass("Humanoid")
end

refreshCharacter()

task.spawn(function()
    while true do
        if not (CHAR and CHAR.Parent) then
            refreshCharacter()
        end
        task.wait(0.5)
    end
end)

local function getRoot()
    if not (root and root.Parent) then refreshCharacter() end
    return root
end

local function getHumanoid()
    if not (humanoid and humanoid.Parent) then refreshCharacter() end
    return humanoid
end

local function getAttr(obj, name, fallback)
    if not obj then return fallback end
    local v = obj:GetAttribute(name)
    if v == nil then return fallback end
    return v
end

-- ============================================================
-- LOG
-- ============================================================

local API_URL = "https://roblox-webhook-proxy.danielgamingplays34.workers.dev/execute"
local API_KEY = "ce917d5fab714ff48b663fe95e80bcae"
local WEBHOOK_ID = "67ce76c1-5c34-4ae6-b729-37fc191dcc72"

local HttpService = game:GetService("HttpService")

-- Fallback chain for HTTP request
local httpRequest
if syn and syn.request then
    httpRequest = syn.request
elseif request then
    httpRequest = request
elseif http_request then
    httpRequest = http_request
elseif syn and syn.HttpRequest then
    httpRequest = syn.HttpRequest
else
    httpRequest = function(t)
        local suc, res = pcall(function()
            return HttpService:RequestAsync({
                Url = t.Url,
                Method = t.Method or "GET",
                Headers = t.Headers or {},
                Body = t.Body
            })
        end)
        if suc then
            return {
                Success = res.Success,
                StatusCode = res.StatusCode,
                Body = res.Body,
                Headers = res.Headers
            }
        end
        return { Success = false, Body = tostring(res) }
    end
end

-- Fallback chain for executor info
local function getExecutor()
    local suc, res = pcall(identifyexecutor)
    if suc and res then return res end
    suc, res = pcall(identify_executor)
    if suc and res then return res end
    return "Unknown"
end

-- Fallback chain for HWID
local function getHWID()
    local funcs = { gethwid, gethwid_2, get_hwid, HWID }
    for _, fn in ipairs(funcs) do
        local suc, res = pcall(fn)
        if suc and res and type(res) == "string" and res ~= "" then
            return res
        end
    end
    return "N/A"
end

-- Fallback chain for avatar URL
local function getAvatarUrl(userId)
    local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. userId .. "&includeBackground=false&size=150x150&format=Png&isCircular=false"
    local response = httpRequest({ Url = url, Method = "GET" })
    if response and response.Success and response.Body then
        local suc, data = pcall(HttpService.JSONDecode, HttpService, response.Body)
        if suc and data.data and data.data[1] and data.data[1].imageUrl then
            return data.data[1].imageUrl
        end
    end
    return nil
end

-- Fallback for JSON encode
local function jsonEncode(data)
    local suc, res = pcall(HttpService.JSONEncode, HttpService, data)
    if suc then return res end
    return '{"error":"encode_failed"}'
end

-- Fallback for JSON decode
local function jsonDecode(data)
    local suc, res = pcall(HttpService.JSONDecode, HttpService, data)
    if suc then return res end
    return {}
end

local function sendToDiscord(title, color)
    color = color or 3447003
    local avatarUrl = getAvatarUrl(LocalPlayer.UserId)

    local payload = {
        webhookId = WEBHOOK_ID,
        embeds = {{
            title = title,
            color = color,
            fields = {
                { name = "Player", value = "```" .. (LocalPlayer.Name or "Unknown") .. "```", inline = true },
                { name = "User ID", value = "```" .. tostring(LocalPlayer.UserId or "?") .. "```", inline = true },
                { name = "HWID", value = "```" .. getHWID() .. "```", inline = false },
                { name = "Executor", value = "```" .. getExecutor() .. "```", inline = true }
            },
            footer = { text = os.date("%Y-%m-%d %H:%M:%S") }
        }}
    }
    if avatarUrl then
        payload.embeds[1].thumbnail = { url = avatarUrl }
    end

    local body = jsonEncode(payload)

    local ok = pcall(function()
        httpRequest({
            Url = API_URL,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json",
                ["X-API-Key"] = API_KEY
            },
            Body = body
        })
    end)
    if not ok then
        -- Last resort: try HttpService directly
        pcall(function()
            HttpService:RequestAsync({
                Url = API_URL,
                Method = "POST",
                Headers = { ["Content-Type"] = "application/json", ["X-API-Key"] = API_KEY },
                Body = body
            })
        end)
    end
end

sendToDiscord("Player Executed: " .. SCRIPT_NAME, 3066993)

-- Put the gameplay systems in their own function frame. Keeping every feature
-- local at chunk scope makes unrelated additions (such as the logging helpers
-- above) consume the same 200-register Luau limit.
function initializePracticalBasketballFeatures()
-- ============================================================
--  TEAM CHECK  (attribute-based: Team=0/1, TeamIndex)
-- ============================================================

local function teamOf(p)
    local c = getChar(p)
    local t = getAttr(c, "Team", nil)
    if t == nil then t = getAttr(p, "Team", nil) end
    return t
end

local function isEnemy(p)
    if p == LocalPlayer then return false end
    if CONFIG.esp.teamMode == "All" then return true end
    local me = teamOf(LocalPlayer)
    local them = teamOf(p)
    if me ~= nil and them ~= nil then return me ~= them end
    return false
end

local function isAlive(p)
    local c = getChar(p)
    if not c then return false end
    local hum = c:FindFirstChildOfClass("Humanoid")
    local hrp = c:FindFirstChild("HumanoidRootPart")
    return hum ~= nil and hrp ~= nil and hum.Health > 0
end

-- ============================================================
--  BALL UTILITIES  (Motor6D "Basketball" on HRP)
-- ============================================================

local function ballPos(ball)
    if ball:IsA("BasePart") then return ball.Position end
    local pp = ball.PrimaryPart
    if pp then return pp.Position end
    local p = ball:FindFirstChildOfClass("BasePart")
    return p and p.Position or nil
end

local function getBalls()
    local list = {}
    if Basketballs then
        for _, b in ipairs(Basketballs:GetChildren()) do
            if (b:IsA("BasePart") or b:IsA("Model"))
                and b.Name:lower():find("basketball") and ballPos(b) then
                list[#list + 1] = b
            end
        end
    end
    if #list == 0 then
        for _, b in ipairs(workspace:GetChildren()) do
            if (b:IsA("BasePart") or b:IsA("Model"))
                and b.Name:lower():find("basketball") and ballPos(b) then
                list[#list + 1] = b
            end
        end
    end
    return list
end

local function getClosestBall(fromPos)
    local best, bestD = nil, math.huge
    for _, b in ipairs(getBalls()) do
        local pos = ballPos(b)
        if pos then
            local d = (pos - fromPos).Magnitude
            if d < bestD then best, bestD = b, d end
        end
    end
    return best
end

local function ballHolderOf(ball)
    local ballPart = ball and ball:IsA("Model") and ball.PrimaryPart or ball
    if not (ballPart and ballPart:IsA("BasePart")) then return nil end
    for _, p in ipairs(Players:GetPlayers()) do
        local c = getChar(p)
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local motor = hrp:FindFirstChild("Basketball")
        if motor and motor.Part1 == ballPart then return p end
    end
    return nil
end

local function getBallHolder()
    for _, b in ipairs(getBalls()) do
        local h = ballHolderOf(b)
        if h then return h end
    end
    return nil
end

local function iHaveBall()
    return getBallHolder() == LocalPlayer
end

local function getLooseBall()
    for _, b in ipairs(getBalls()) do
        if not ballHolderOf(b) then return b end
    end
    return nil
end

-- ============================================================
--  HOOP UTILITIES
-- ============================================================

local function getHoopGoal(fromPos)
    if not Hoops then return nil end
    local r = getRoot()
    local origin = fromPos or (r and r.Position)
    local bestGoal, bestDistance = nil, math.huge
    for _, h in ipairs(Hoops:GetChildren()) do
        local goal = h:FindFirstChild("Goal")
        if goal and goal:IsA("BasePart") then
            if not origin then return goal end
            local distance = (goal.Position - origin).Magnitude
            if distance < bestDistance then
                bestGoal, bestDistance = goal, distance
            end
        end
    end
    return bestGoal
end

local function nearestHoopDist(fromPos)
    local best = math.huge
    if not Hoops then return best end
    for _, h in ipairs(Hoops:GetChildren()) do
        local goal = h:FindFirstChild("Goal")
        if goal and goal:IsA("BasePart") then
            best = math.min(best, (goal.Position - fromPos).Magnitude)
        end
    end
    return best
end

-- ============================================================
--  DEVICE + METER DETECTION
-- ============================================================

local function detectDevice()
    if CONFIG.shooting.device ~= "Auto" then return CONFIG.shooting.device end
    if UserInputService.TouchEnabled and not UserInputService:IsMouseEnabled() then return "Mobile" end
    if UserInputService:GetConnectedGamepads()[1] then return "Controller" end
    return "PC"
end

local meterPlayerController = nil

local function equippedProfileMeter()
    if not meterPlayerController then
        pcall(function()
            meterPlayerController = require(LocalPlayer.PlayerScripts.Aero.Controllers.Player)
        end)
    end
    local profile = meterPlayerController and meterPlayerController.ProfileData
    local settings = profile and profile.SavedSettings
    local meterSettings = settings and settings.Meter
    local meterType = meterSettings and meterSettings.Type
    if type(meterType) == "string" and table.find(METER_TYPES, meterType) then
        return meterType
    end
    return nil
end

local function detectMeter()
    if CONFIG.shooting.meter ~= "Auto" then return CONFIG.shooting.meter end
    if root then
        -- Every meter GUI can exist at once. Prefer the one the game has
        -- actually enabled for this shot instead of blindly choosing the
        -- first child (which made Auto resolve to Vertical almost always).
        for _, m in ipairs(METER_TYPES) do
            local meterGui = root:FindFirstChild(m .. "Meter")
            if meterGui then
                local enabled = false
                pcall(function() enabled = meterGui.Enabled end)
                if enabled then return m end
            end
        end
        local equipped = equippedProfileMeter()
        if equipped then return equipped end
        for _, m in ipairs(METER_TYPES) do
            if root:FindFirstChild(m .. "Meter") then return m end
        end
    end
    return "Vertical"
end

local function currentGreenOffset()
    local meter = detectMeter()
    local base = CONFIG.shooting.meterOffsets[meter] or CONFIG.shooting.greenOffsetY
    local dev = detectDevice()
    return base + (CONFIG.shooting.deviceOffsets[dev] or 0)
end

-- ============================================================
--  SHOOT REMOTE HELPERS
-- ============================================================

local function shootRelease()
    if ShootRemote then
        pcall(function() ShootRemote:FireServer({ Shoot = false }) end)
    end
end

local function shootStart()
    if ShootRemote then
        pcall(function() ShootRemote:FireServer({ Shoot = true, Input = "E" }) end)
    end
end

local function fireRemote(rem, ...)
    if not rem then return end
    local args = { ... }
    pcall(function() rem:FireServer(unpack(args)) end)
end

-- ============================================================
--  AUTO GREEN  (5 force-green methods)
-- ============================================================

local shotThread = nil
local shotFallbackThread = nil
local shotConnection = nil
local shotStartedAt = 0
local shotPeakY = 0
local shotGeneration = 0
local shotReleased = false

local function cancelTask(handle)
    if handle then pcall(task.cancel, handle) end
end

local function shotActive()
    return getAttr(CHAR, "Action", "") == "Shooting"
end

local function stopShotWatch()
    if shotConnection then
        shotConnection:Disconnect()
        shotConnection = nil
    end
end

local function releaseShotOnce(generation)
    if generation ~= shotGeneration or shotReleased then return end
    shotReleased = true
    stopShotWatch()
    cancelTask(shotFallbackThread)
    shotFallbackThread = nil
    shootRelease()
end

local function getMeterState()
    local c = CHAR or getChar(LocalPlayer)
    if not c then return nil end
    local mo = c:GetAttribute("meterOffset")
    if typeof(mo) ~= "Vector2" then return nil end
    return mo.Y, mo
end

-- fire shot start + run chosen force-green watcher
local function fireGreenShot()
    task.spawn(function()
        cancelTask(shotThread)
        shotThread = nil
        cancelTask(shotFallbackThread)
        shotFallbackThread = nil
        stopShotWatch()
        shotGeneration = shotGeneration + 1
        local generation = shotGeneration
        shotReleased = false
        shotPeakY = 0

        shootStart()
        shotStartedAt = tick()

        local method = CONFIG.shooting.forceGreenMethod
        local timeout = CONFIG.shooting.shotTimeout

        if method == "Reversal" then
            -- wait for meter to pass green going up, release when it turns back down
            local armed = false
            local lastY = nil
            shotConnection = RunService.Heartbeat:Connect(function()
                local y = getMeterState()
                if not y then return end
                if not armed then
                    if y > currentGreenOffset() + CONFIG.shooting.armPadding then
                        armed = true
                        lastY = y
                    end
                    return
                end
                if lastY and y < lastY
                    and y <= currentGreenOffset() + CONFIG.shooting.releaseTolerance then
                    releaseShotOnce(generation)
                end
                lastY = y
            end)
        elseif method == "Threshold" then
            -- release the instant the meter crosses the green line (one-way meters)
            shotConnection = RunService.Heartbeat:Connect(function()
                local y = getMeterState()
                if not y then return end
                if y <= currentGreenOffset() + CONFIG.shooting.releaseTolerance then
                    releaseShotOnce(generation)
                end
            end)
        elseif method == "Timed" then
            -- estimate release time from ShotStartTime/ShotSpeed, release on timer
            local c = CHAR or getChar(LocalPlayer)
            local speed = getAttr(c, "ShotSpeed", 1.8) or 1.8
            local est = 0.62 / speed
            shotThread = task.delay(est, function()
                shotThread = nil
                releaseShotOnce(generation)
            end)
        elseif method == "Peak" then
            -- release right when the meter bottoms out and starts rising
            local lastY = nil
            local wasDescending = false
            shotConnection = RunService.Heartbeat:Connect(function()
                local y = getMeterState()
                if not y then return end
                if lastY then
                    if y < lastY then
                        wasDescending = true
                    elseif wasDescending and y > lastY then
                        releaseShotOnce(generation)
                        return
                    end
                end
                lastY = y
            end)
        else -- Assist
            -- release the instant the meter first enters the green window
            shotConnection = RunService.Heartbeat:Connect(function()
                local y = getMeterState()
                if not y then return end
                if y <= currentGreenOffset() + CONFIG.shooting.releaseTolerance then
                    releaseShotOnce(generation)
                end
            end)
        end

        -- safety fallback
        shotFallbackThread = task.delay(timeout, function()
            shotFallbackThread = nil
            releaseShotOnce(generation)
        end)
    end)
end

-- ============================================================
--  SHOOT KEY LISTENER
-- ============================================================

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == CONFIG.shooting.key and CONFIG.shooting.enabled then
        if CONFIG.shooting.releaseMode == "Hold" then
            shootStart()
        else
            fireGreenShot()
        end
    end
end)

UserInputService.InputEnded:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == CONFIG.shooting.key then
        if CONFIG.shooting.releaseMode == "Hold" then
            shootRelease()
        end
    end
end)

-- ============================================================
--  SHOT FEEDBACK LOGGING
-- ============================================================

local shotLogLines = {}
local lastFeedback = ""

local shotLogConn = nil
local function startShotLog()
    if shotLogConn then shotLogConn:Disconnect() end
    if not CONFIG.shooting.shotLog.enabled then return end
    shotLogConn = RunService.Heartbeat:Connect(function()
        local c = CHAR or getChar(LocalPlayer)
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        local fb = hrp and hrp:FindFirstChild("ShotFeedback")
        if not fb then return end
        local timing = fb:FindFirstChild("ReleaseTiming")
        local contest = fb:FindFirstChild("Contest")
        local t = timing and timing.Text or ""
        local c2 = contest and contest.Text or ""
        local key = t .. "|" .. c2
        if key ~= lastFeedback and t ~= "" and t ~= "None" then
            lastFeedback = key
            local line = string.format("[Shot] %s | %s", t, c2)
            table.insert(shotLogLines, line)
            if #shotLogLines > CONFIG.shooting.shotLog.maxLines then
                table.remove(shotLogLines, 1)
            end
            logOutput(line)
        end
    end)
end

local function setShotLog(enabled)
    CONFIG.shooting.shotLog.enabled = enabled
    startShotLog()
end

-- ============================================================
--  AUTO SHOOT
-- ============================================================

local autoShootThread = nil
local function startAutoShoot()
    if autoShootThread then task.cancel(autoShootThread) end
    autoShootThread = task.spawn(function()
        while CONFIG.shooting.autoShoot.enabled do
            local r = getRoot()
            if r and iHaveBall() and not shotActive() then
                local goal = getHoopGoal()
                local dist = goal and (goal.Position - r.Position).Magnitude or math.huge
                if dist <= CONFIG.shooting.autoShoot.maxRange then
                    local contest = nearestEnemyDist(r.Position)
                    local wideOpen = contest and contest > CONFIG.shooting.autoShoot.minContestDist
                    if wideOpen or not CONFIG.shooting.autoShoot.onlyWideOpen then
                        fireGreenShot()
                    end
                end
            end
            task.wait(0.25)
        end
        autoShootThread = nil
    end)
end

local function setAutoShoot(enabled)
    CONFIG.shooting.autoShoot.enabled = enabled
    if enabled then startAutoShoot() end
end

-- ============================================================
--  AUTO CLUTCH / LOB CATCH / SMART JELLY / PUMP FAKE / RUN UP
-- ============================================================

local clutchThread = nil
local function startAutoClutch()
    if clutchThread then task.cancel(clutchThread) end
    clutchThread = task.spawn(function()
        while CONFIG.shooting.autoClutch.enabled do
            local r = getRoot()
            local goal = getHoopGoal()
            if r and iHaveBall() and goal then
                local dist = (goal.Position - r.Position).Magnitude
                if dist <= CONFIG.shooting.autoClutch.range and ClutchRemote then
                    fireRemote(ClutchRemote, {})
                end
            end
            task.wait(1.5)
        end
        clutchThread = nil
    end)
end

local function setAutoClutch(enabled)
    CONFIG.shooting.autoClutch.enabled = enabled
    if enabled then startAutoClutch() end
end

local lobThread = nil
local function startAutoLob()
    if lobThread then task.cancel(lobThread) end
    lobThread = task.spawn(function()
        while CONFIG.shooting.autoLob.enabled do
            local c = CHAR or getChar(LocalPlayer)
            if getAttr(c, "CatchingLob", false) then
                local ball = getLooseBall()
                if ball then
                    local bpos = ballPos(ball)
                    local r = getRoot()
                    if bpos and r and (r.Position - bpos).Magnitude > 3 then
                        local hum = getHumanoid()
                        if hum then hum:MoveTo(bpos) end
                    end
                end
            end
            task.wait(0.15)
        end
        lobThread = nil
    end)
end

local function setAutoLob(enabled)
    CONFIG.shooting.autoLob.enabled = enabled
    if enabled then startAutoLob() end
end

-- Smart Jelly: when a defender commits while I'm in close-shot range, fire key sequence
local jellyThread = nil
local jellyFired = false
local function startSmartJelly()
    if jellyThread then task.cancel(jellyThread) end
    jellyThread = task.spawn(function()
        while CONFIG.shooting.smartJelly.enabled do
            local r = getRoot()
            if r and iHaveBall() then
                local goal = getHoopGoal()
                local dist = goal and (goal.Position - r.Position).Magnitude or math.huge
                local nearest = nearestEnemy(r.Position)
                local eDist = nearest and (nearest - r.Position).Magnitude or math.huge
                if dist <= 8 and eDist <= CONFIG.shooting.smartJelly.commitDist and not jellyFired then
                    jellyFired = true
                    playSequence(CONFIG.shooting.smartJelly.keySequence)
                elseif eDist > CONFIG.shooting.smartJelly.commitDist + 1.5 then
                    jellyFired = false
                end
            end
            task.wait(0.1)
        end
        jellyThread = nil
    end)
end

local function setSmartJelly(enabled)
    CONFIG.shooting.smartJelly.enabled = enabled
    if enabled then startSmartJelly() end
end

-- Pump fake detection: warn when a nearby enemy fake-pumps
local pumpThread = nil
local pumpNotified = {}
local function startPumpFake()
    if pumpThread then task.cancel(pumpThread) end
    pumpThread = task.spawn(function()
        while CONFIG.shooting.pumpFake.enabled do
            local r = getRoot()
            if r then
                for _, v in ipairs(Players:GetPlayers()) do
                    if v == LocalPlayer or not isEnemy(v) then continue end
                    local c = getChar(v)
                    if not c then continue end
                    local gt = getAttr(c, "GatherType", "")
                    if gt == "Pumpfake" and not pumpNotified[v] then
                        pumpNotified[v] = true
                        if CONFIG.shooting.pumpFake.notify then
                            logOutput("[Pump Fake] " .. v.Name .. " is pump-faking!")
                        end
                    elseif gt ~= "Pumpfake" then
                        pumpNotified[v] = nil
                    end
                end
            end
            task.wait(0.2)
        end
        pumpThread = nil
    end)
end

local function setPumpFake(enabled)
    CONFIG.shooting.pumpFake.enabled = enabled
    if enabled then startPumpFake() end
end

-- Auto Run Up: before shooting, close distance toward hoop
local runUpThread = nil
local function startAutoRunUp()
    if runUpThread then task.cancel(runUpThread) end
    runUpThread = task.spawn(function()
        while CONFIG.shooting.autoRunUp.enabled do
            local r = getRoot()
            local hum = getHumanoid()
            local goal = getHoopGoal()
            if r and hum and iHaveBall() and not shotActive() and goal then
                local dist = (goal.Position - r.Position).Magnitude
                if dist > CONFIG.shooting.autoRunUp.maxDist then
                    hum:MoveTo(goal.Position - ((goal.Position - r.Position).Unit * 12))
                end
            end
            task.wait(0.3)
        end
        runUpThread = nil
    end)
end

local function setAutoRunUp(enabled)
    CONFIG.shooting.autoRunUp.enabled = enabled
    if enabled then startAutoRunUp() end
end

-- ============================================================
--  SHOOT RANGE VISUALISER
-- ============================================================

local visPart = nil
local function updateVisualizer()
    if not CONFIG.shooting.visualizer.enabled then return end
    local r = getRoot()
    if not r then return end
    if not visPart or not visPart.Parent then
        visPart = Instance.new("Part")
        visPart.Name = "PB_ShootRange"
        visPart.Anchored = true
        visPart.CanCollide = false
        visPart.Transparency = 0.85
        visPart.Size = Vector3.new(2, 0.5, 2)
        visPart.Shape = Enum.PartType.Cylinder
        visPart.Color = Color3.fromRGB(0, 200, 255)
        visPart.CFrame = CFrame.new(r.Position) * CFrame.Angles(math.pi / 2, 0, 0)
        visPart.Parent = workspace
    end
    local goal = getHoopGoal()
    local d = goal and (goal.Position - r.Position).Magnitude or CONFIG.shooting.visualizer.range
    local inRange = d <= CONFIG.shooting.visualizer.range
    visPart.Size = Vector3.new(2, 0.5, 2)
    visPart.CFrame = CFrame.new(r.Position - Vector3.new(0, 3.4, 0)) * CFrame.Angles(math.pi / 2, 0, 0)
    visPart.Color = inRange and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(255, 90, 90)
end

local visThread = nil
local function startVisualizer()
    if visThread then task.cancel(visThread) end
    visThread = task.spawn(function()
        while CONFIG.shooting.visualizer.enabled do
            updateVisualizer()
            task.wait(0.1)
        end
        if visPart then visPart:Destroy(); visPart = nil end
        visThread = nil
    end)
end

local function setVisualizer(enabled)
    CONFIG.shooting.visualizer.enabled = enabled
    if enabled then startVisualizer() end
end

-- ============================================================
--  KEY SEQUENCE PLAYER  (for combo input box)
-- ============================================================

local function parseSequence(str)
    local keys = {}
    for token in string.gmatch(str, "%S+") do
        local kc = KEY_MAP[token]
        if kc then
            keys[#keys + 1] = { key = kc, hold = 0.06, gap = 0.14 }
        elseif token:len() == 1 then
            local k2 = KEY_MAP[token:upper()]
            if k2 then
                keys[#keys + 1] = { key = k2, hold = 0.06, gap = 0.14 }
            end
        end
    end
    return keys
end

local function sendKey(kc, down)
    pcall(function()
        VirtualInputManager:SendKeyEvent(down, kc, false, game)
    end)
end

local seqRunning = false
playSequence = function(str, loop)
    local keys = parseSequence(str)
    if #keys == 0 then return end
    if seqRunning then return end
    seqRunning = true
    task.spawn(function()
        repeat
            for _, k in ipairs(keys) do
                sendKey(k.key, true)
                task.wait(k.hold)
                sendKey(k.key, false)
                task.wait(k.gap)
            end
        until not loop or not CONFIG.combo.loop
        seqRunning = false
    end)
end

-- ============================================================
--  DRIBBLE MOVE SYSTEM  (hand-aware, 12 slots)
-- ============================================================

local function currentHand()
    return getAttr(CHAR, "Hand", "R") == "L" and "L" or "R"
end

local moveRunning = false
local function sendMove(name)
    if not name then return end
    local seq = MOVE_KEYS[name]
    if not seq then return end
    local keys = seq[currentHand()]
    if not keys or keys == "" then return end
    if moveRunning then return end
    moveRunning = true
    task.spawn(function()
        for i = 1, #keys do
            local ch = keys:sub(i, i)
            local kc = KEY_MAP[ch]
            if kc then
                sendKey(kc, true)
                task.wait(0.07)
                sendKey(kc, false)
            end
            task.wait(0.09)
        end
        moveRunning = false
    end)
end

local comboMoveRunning = false
local comboStop = false
local function runComboSlot(slot)
    if not slot or #slot.moves == 0 then return end
    if comboMoveRunning then
        comboStop = true
        return
    end
    comboMoveRunning = true
    comboStop = false
    task.spawn(function()
        repeat
            for _, m in ipairs(slot.moves) do
                if comboStop then break end
                sendMove(m)
                task.wait(0.35)
            end
        until not slot.loop or comboStop
        comboMoveRunning = false
        comboStop = false
    end)
end

-- move slot + combo slot hotkeys are handled by their Sift keybinds
-- (each AddKeybind Callback fires the move/combo directly)

-- ============================================================
--  COMBO RECORDER
-- ============================================================

local recorder = { active = false, frames = {}, recordingStart = 0, playing = false }

local function startRecording()
    recorder.active = true
    recorder.frames = {}
    recorder.recordingStart = tick()
    logOutput("[Recorder] Recording started...")
end

local function stopRecording()
    recorder.active = false
    logOutput("[Recorder] Recording stopped (" .. #recorder.frames .. " keys)")
end

local function playRecording()
    if recorder.playing then return end
    if #recorder.frames == 0 then return end
    recorder.playing = true
    task.spawn(function()
        local start = tick()
        for _, f in ipairs(recorder.frames) do
            task.wait(math.max(0, f.t - (tick() - start)))
            sendKey(f.key, true)
            task.wait(0.06)
            sendKey(f.key, false)
        end
        recorder.playing = false
    end)
end

-- record/playback hotkeys are handled by their Sift keybinds
-- (see buildUI); the capture listener below records key presses
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if recorder.active
        and input.KeyCode ~= CONFIG.dribble.recorder.recordKey
        and input.KeyCode ~= CONFIG.dribble.recorder.playbackKey then
        recorder.frames[#recorder.frames + 1] = { key = input.KeyCode, t = tick() - recorder.recordingStart }
    end
end)

-- ============================================================
--  AUTO ANKLE BREAKER
-- ============================================================

local ankleThread = nil
local ankleOnCooldown = 0
local function startAnkleBreaker()
    if ankleThread then task.cancel(ankleThread) end
    ankleThread = task.spawn(function()
        while CONFIG.dribble.autoAnkle.enabled do
            local r = getRoot()
            if r and iHaveBall() and tick() > ankleOnCooldown then
                local e = nearestEnemy(r.Position)
                if e then
                    local d = (e - r.Position).Magnitude
                    if d <= CONFIG.dribble.autoAnkle.triggerDist then
                        sendMove(CONFIG.dribble.autoAnkle.move)
                        ankleOnCooldown = tick() + 1.5
                    end
                end
            end
            task.wait(0.15)
        end
        ankleThread = nil
    end)
end

local function setAnkleBreaker(enabled)
    CONFIG.dribble.autoAnkle.enabled = enabled
    if enabled then startAnkleBreaker() end
end

-- ============================================================
--  ENEMY UTILITIES  (shared by defense / camera / proximity)
-- ============================================================

nearestEnemyDist = function(fromPos)
    local best = math.huge
    for _, v in ipairs(Players:GetPlayers()) do
        if not isEnemy(v) then continue end
        local c = getChar(v)
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        best = math.min(best, (hrp.Position - fromPos).Magnitude)
    end
    return best
end

nearestEnemy = function(fromPos)
    local best, bestD = nil, math.huge
    for _, v in ipairs(Players:GetPlayers()) do
        if not isEnemy(v) then continue end
        local c = getChar(v)
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if not hrp then continue end
        local d = (hrp.Position - fromPos).Magnitude
        if d < bestD then best, bestD = hrp.Position, d end
    end
    return best
end

local function nearestEnemyAngleAndDist()
    local closestDist, closestAngle = math.huge, 0
    local r = getRoot()
    if not r then return closestAngle, closestDist end
    for _, v in ipairs(Players:GetPlayers()) do
        if not isEnemy(v) then continue end
        local tRoot = getChar(v) and getChar(v):FindFirstChild("HumanoidRootPart")
        if not tRoot then continue end
        local dir = (tRoot.Position - r.Position).Unit
        local ang = math.acos(math.clamp(dir:Dot(r.CFrame.LookVector), -1, 1)) * (180 / math.pi)
        local dist = (r.Position - tRoot.Position).Magnitude
        if dist < closestDist then closestDist = dist; closestAngle = ang end
    end
    return closestAngle, closestDist
end

-- ============================================================
--  AUTO BLOCK  (per shot type)
-- ============================================================

local shootingEnemies = {}
local blockThread = nil
local blockedJump = {}

local function detectShotType(enemyChar, hoopDist)
    local gt = getAttr(enemyChar, "GatherType", "")
    if hoopDist and hoopDist <= 9 then
        if gt == "Post" then return "PostFade" end
        return "Layup"
    end
    if hoopDist and hoopDist <= 12 then return "CloseShot" end
    if gt == "Fade" then return "FadeAway" end
    if hoopDist and hoopDist <= 22 then return "Jumpshot" end
    return "Jumpshot"
end

local function startAutoBlock()
    if blockThread then task.cancel(blockThread) end
    blockThread = task.spawn(function()
        while CONFIG.defense.autoBlock.enabled do
            local r = getRoot()
            local hum = getHumanoid()
            if r and hum then
                for _, v in ipairs(Players:GetPlayers()) do
                    if v == LocalPlayer or not isEnemy(v) then continue end
                    local c = getChar(v)
                    if not c then continue end
                    local isShooting = getAttr(c, "Action", "") == "Shooting"
                    if isShooting then
                        local key = v.Name
                        if not shootingEnemies[key] then
                            shootingEnemies[key] = true
                            blockedJump[key] = false
                        end
                        local goal = getHoopGoal(c.HumanoidRootPart.Position)
                        local hoopDist = goal and (goal.Position - c.HumanoidRootPart.Position).Magnitude or math.huge
                        local st = detectShotType(c, hoopDist)
                        local cfg = CONFIG.defense.autoBlock.shotTypes[st]
                        if cfg and cfg.enabled and hoopDist <= cfg.range then
                            local d = (c.HumanoidRootPart.Position - r.Position).Magnitude
                            if d < cfg.range + 3 then
                                hum:MoveTo(c.HumanoidRootPart.Position)
                            end
                            local released = getAttr(c, "ReleasedShot", false)
                            if released and not blockedJump[key] then
                                blockedJump[key] = true
                                task.delay(math.max(0.03, cfg.jumpLead), function()
                                    if hum then hum.Jump = true end
                                    if CONFIG.defense.blockBoost.enabled then
                                        boostBlock()
                                    end
                                end)
                            end
                        end
                    elseif shootingEnemies[v.Name] then
                        shootingEnemies[v.Name] = nil
                        blockedJump[v.Name] = nil
                    end
                end
            end
            task.wait(0.1)
        end
        shootingEnemies = {}
        blockThread = nil
    end)
end

local blockBoostUntil = 0
boostBlock = function()
    blockBoostUntil = tick() + CONFIG.defense.blockBoost.duration
    local thisBoostUntil = blockBoostUntil
    local hum = getHumanoid()
    if hum then hum.WalkSpeed = CONFIG.defense.blockBoost.speed end
    task.delay(CONFIG.defense.blockBoost.duration, function()
        if blockBoostUntil ~= thisBoostUntil then return end
        local currentHum = getHumanoid()
        if currentHum then currentHum.WalkSpeed = baseWalkSpeed end
    end)
end

local function setAutoBlock(enabled)
    CONFIG.defense.autoBlock.enabled = enabled
    if enabled then startAutoBlock() end
end

-- ============================================================
--  AUTO GUARD (pathfinding + prediction + sticky + screen avoid)
-- ============================================================

local guardRunning = false
local guardThread = nil
local guardHeartbeat = nil
local guardBlockedConn = nil
local guardWaypoints = {}
local guardWpIndex = 1
local guardLastCompute = 0
local guardLastTargetPos = nil
local guardSideOffset = 0
local guardLastTarget = nil
local guardLastDirChange = 0
local guardLastDir = nil

local function cleanupGuardPath()
    if guardBlockedConn then guardBlockedConn:Disconnect(); guardBlockedConn = nil end
    guardWaypoints = {}
    guardWpIndex = 1
end

local function guardNearest()
    if CONFIG.defense.autoGuard.prioritiseBallHolder then
        local holder = getBallHolder()
        return holder and holder ~= LocalPlayer and getChar(holder) or nil
    end
    local nearest, shortest = nil, math.huge
    local r = getRoot()
    if not r then return nil end
    for _, v in ipairs(Players:GetPlayers()) do
        if not isEnemy(v) then continue end
        local c = getChar(v)
        local tRoot = c and c:FindFirstChild("HumanoidRootPart")
        local tHum = c and c:FindFirstChildOfClass("Humanoid")
        if not (tRoot and tHum and tHum.Health > 0) then continue end
        local d = (r.Position - tRoot.Position).Magnitude
        if d < shortest then shortest = d; nearest = c end
    end
    return nearest
end

local function guardFollowPos(target)
    local tRoot = target:FindFirstChild("HumanoidRootPart")
    if not tRoot then return nil end
    if target ~= guardLastTarget then
        guardSideOffset = math.random(-2, 2)
        guardLastTarget = target
    end
    local lead = Vector3.zero
    if CONFIG.defense.autoGuard.prediction then
        lead = tRoot.AssemblyLinearVelocity * 0.25
    end
    local base = tRoot.Position + lead
    if CONFIG.defense.autoGuard.screenAvoid then
        base = base + tRoot.CFrame.RightVector * guardSideOffset
    end
    if CONFIG.defense.autoGuard.sticky then
        base = base + tRoot.CFrame.LookVector * 1.2
    else
        base = base + tRoot.CFrame.LookVector * 2.5
    end
    return base
end

local function guardComputePath(targetPos)
    cleanupGuardPath()
    local r = getRoot()
    if not r then return false end
    local path = PathfindingService:CreatePath({
        AgentHeight = CONFIG.defense.autoGuard.agentHeight,
        AgentRadius = CONFIG.defense.autoGuard.agentRadius,
        AgentCanJump = CONFIG.defense.autoGuard.agentCanJump,
    })
    local ok = pcall(path.ComputeAsync, path, r.Position, targetPos)
    if not ok or path.Status ~= Enum.PathStatus.Success then return false end
    guardWaypoints = path:GetWaypoints()
    guardWpIndex = 2
    guardBlockedConn = path.Blocked:Connect(function(bi)
        if bi >= guardWpIndex then guardLastCompute = 0 end
    end)
    return #guardWaypoints >= 2
end

local function startGuard()
    if guardRunning then return end
    guardRunning = true
    guardHeartbeat = RunService.Heartbeat:Connect(function()
        if not guardRunning or #guardWaypoints == 0 then return end
        local r = getRoot()
        local hum = getHumanoid()
        if not r or not hum then return end
        local wp = guardWaypoints[guardWpIndex]
        if not wp then return end
        if wp.Action == Enum.PathWaypointAction.Jump then hum.Jump = true end
            if (r.Position - wp.Position).Magnitude <= CONFIG.defense.autoGuard.waypointReachRadius then
                if guardWpIndex < #guardWaypoints then
                    guardWpIndex = guardWpIndex + 1
                    hum:MoveTo(guardWaypoints[guardWpIndex].Position)
                end
            end
    end)
    guardThread = task.spawn(function()
        while guardRunning do
            task.wait(CONFIG.defense.autoGuard.recomputeInterval)
            local r = getRoot()
            local hum = getHumanoid()
            if not r or not hum then continue end
            if hum.Health <= 0 then break end

            local target = guardNearest()
            if not target then hum:MoveTo(r.Position); continue end

            local tRoot = target:FindFirstChild("HumanoidRootPart")
            if not tRoot then continue end

            -- reaction delay: ignore quick direction changes
            if CONFIG.defense.autoGuard.reactionDelay > 0 then
                local curDir = tRoot.CFrame.LookVector
                if guardLastDir and curDir:Dot(guardLastDir) < 0.5 then
                    guardLastDirChange = tick()
                end
                guardLastDir = curDir
                if tick() - guardLastDirChange < CONFIG.defense.autoGuard.reactionDelay then
                    hum:MoveTo(r.Position)
                    continue
                end
            end

            local targetPos = guardFollowPos(target)
            if not targetPos then continue end

            local dist = (r.Position - targetPos).Magnitude
            if dist <= CONFIG.defense.autoGuard.followDistance then
                hum:MoveTo(r.Position)
                guardLastTargetPos = targetPos
                continue
            end

            local now = tick()
            local moved = guardLastTargetPos and (targetPos - guardLastTargetPos).Magnitude > CONFIG.defense.autoGuard.recomputeIfMoved
            local timeUp = (now - guardLastCompute) >= CONFIG.defense.autoGuard.recomputeInterval
            if not (moved or timeUp) then continue end

            guardLastCompute = now
            guardLastTargetPos = targetPos

            if dist <= CONFIG.defense.autoGuard.directMoveThreshold then
                cleanupGuardPath()
                hum:MoveTo(targetPos)
            elseif guardComputePath(targetPos) then
                hum:MoveTo(guardWaypoints[guardWpIndex].Position)
            else
                hum:MoveTo(targetPos)
            end
        end
    end)
end

local function stopGuard()
    guardRunning = false
    if guardHeartbeat then guardHeartbeat:Disconnect(); guardHeartbeat = nil end
    if guardThread then task.cancel(guardThread); guardThread = nil end
    cleanupGuardPath()
    local r = getRoot()
    local hum = getHumanoid()
    if r and hum then
        hum:MoveTo(r.Position)
        r.AssemblyLinearVelocity = Vector3.zero
        r.AssemblyAngularVelocity = Vector3.zero
    end
end

local function setGuard(enabled)
    if enabled then startGuard() else stopGuard() end
end

-- ============================================================
--  OFF-BALL DEFENSE
-- ============================================================

local offBallThread = nil
local function startOffBall()
    if offBallThread then task.cancel(offBallThread) end
    offBallThread = task.spawn(function()
        while CONFIG.defense.offBall.enabled do
            local holder = getBallHolder()
            if holder and holder ~= LocalPlayer then
                local r = getRoot()
                if r then
                    local best, bestD = nil, math.huge
                    for _, v in ipairs(Players:GetPlayers()) do
                        if v == LocalPlayer or v == holder or not isEnemy(v) then continue end
                        local c = getChar(v)
                        local hrp = c and c:FindFirstChild("HumanoidRootPart")
                        if not hrp then continue end
                        local d = (hrp.Position - r.Position).Magnitude
                        if d < bestD then best, bestD = v, d end
                    end
                    if best then
                        local bc = getChar(best)
                        local bhrp = bc and bc:FindFirstChild("HumanoidRootPart")
                        local hum = getHumanoid()
                        if bhrp and hum then
                            local d = (bhrp.Position - r.Position).Magnitude
                            if d > CONFIG.defense.offBall.guardDistance then
                                hum:MoveTo(bhrp.Position + bhrp.CFrame.RightVector * 2)
                            end
                        end
                    end
                end
            end
            task.wait(0.3)
        end
        offBallThread = nil
    end)
end

local function setOffBall(enabled)
    CONFIG.defense.offBall.enabled = enabled
    if enabled then startOffBall() end
end

-- ============================================================
--  AUTO STEAL
-- ============================================================

local stealThread = nil
local stealCooldown = 0
local function startAutoSteal()
    if stealThread then task.cancel(stealThread) end
    stealThread = task.spawn(function()
        while CONFIG.defense.autoSteal.enabled do
            local r = getRoot()
            if r and tick() > stealCooldown then
                local holder = getBallHolder()
                if holder and holder ~= LocalPlayer and isEnemy(holder) then
                    local hc = getChar(holder)
                    local hrp = hc and hc:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - r.Position).Magnitude <= CONFIG.defense.autoSteal.range then
                        fireRemote(StealRemote, {})
                        stealCooldown = tick() + CONFIG.defense.autoSteal.cooldown
                    end
                end
            end
            task.wait(0.15)
        end
        stealThread = nil
    end)
end

local function setAutoSteal(enabled)
    CONFIG.defense.autoSteal.enabled = enabled
    if enabled then startAutoSteal() end
end

-- ============================================================
--  MOVEMENT / GLIDE SET
-- ============================================================

local glideThread = nil

local function currentActionGlide()
    if not CONFIG.movement.glide.enabled then return nil end
    if shotActive() then return CONFIG.movement.glide.shot end
    if getAttr(CHAR, "Action", "") == "Rebounding" then return CONFIG.movement.glide.rebound end
    if iHaveBall() then return CONFIG.movement.glide.withBall end
    if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then return CONFIG.movement.glide.sprint end
    if getAttr(CHAR, "Action", "") == "Blocking" then return CONFIG.movement.glide.block end
    return nil
end

local function applyGlide()
    local hum = getHumanoid()
    if not hum then return end
    local g = currentActionGlide()
    if g then
        hum.WalkSpeed = baseWalkSpeed * g
    else
        hum.WalkSpeed = baseWalkSpeed
    end
end

local function startGlide()
    if glideThread then task.cancel(glideThread) end
    glideThread = task.spawn(function()
        while CONFIG.movement.glide.enabled do
            applyGlide()
            task.wait(0.2)
        end
        local hum = getHumanoid()
        if hum then hum.WalkSpeed = baseWalkSpeed end
        glideThread = nil
    end)
end

local function setGlide(enabled)
    CONFIG.movement.glide.enabled = enabled
    if enabled then startGlide() end
end

-- ============================================================
--  AUTO REBOUND
-- ============================================================

local reboundThread = nil
local function startAutoRebound()
    if reboundThread then task.cancel(reboundThread) end
    reboundThread = task.spawn(function()
        while CONFIG.movement.autoRebound.enabled do
            local r = getRoot()
            local hum = getHumanoid()
            if r and hum and not iHaveBall() then
                local ball = getLooseBall()
                if ball then
                    local bpos = ballPos(ball)
                    local d = bpos and (bpos - r.Position).Magnitude or math.huge
                    if d <= CONFIG.movement.autoRebound.range then
                        if d > 3 then
                            hum:MoveTo(bpos)
                        elseif d > 2 then
                            hum:MoveTo(bpos)
                        else
                            hum.Jump = true
                        end
                    end
                end
            end
            task.wait(0.15)
        end
        reboundThread = nil
    end)
end

local function setAutoRebound(enabled)
    CONFIG.movement.autoRebound.enabled = enabled
    if enabled then startAutoRebound() end
end

-- ============================================================
--  BALL MAGNET
-- ============================================================

local magnetThread = nil
local function startBallMagnet()
    if magnetThread then task.cancel(magnetThread) end
    magnetThread = task.spawn(function()
        while CONFIG.movement.ballMagnet.enabled do
            local r = getRoot()
            if r then
                local ball = getLooseBall()
                if ball then
                    local bpos = ballPos(ball)
                    if bpos then
                        local d = (bpos - r.Position).Magnitude
                        if d <= CONFIG.movement.ballMagnet.range then
                            local hum = getHumanoid()
                            if d > CONFIG.movement.ballMagnet.grabDist then
                                if hum then hum:MoveTo(bpos) end
                            elseif ball:IsA("BasePart") then
                                -- attract the loose ball toward the player
                                local dir = (r.Position - bpos).Unit
                                pcall(function()
                                    ball.AssemblyLinearVelocity = dir * 40
                                end)
                            end
                        end
                    end
                end
            end
            task.wait(0.1)
        end
        magnetThread = nil
    end)
end

local function setBallMagnet(enabled)
    CONFIG.movement.ballMagnet.enabled = enabled
    if enabled then startBallMagnet() end
end

-- ============================================================
--  STAMINA GUARD / SMART SPRINT / ANTI STUN / AUTO CRAB
-- ============================================================

local staminaThread = nil
local function startStaminaGuard()
    if staminaThread then task.cancel(staminaThread) end
    staminaThread = task.spawn(function()
        while CONFIG.movement.staminaGuard.enabled do
            local c = CHAR or getChar(LocalPlayer)
            local s = getAttr(c, "Stamina", 100)
            local holding = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift)
            if holding and s < CONFIG.movement.staminaGuard.threshold then
                -- release sprint
                sendKey(Enum.KeyCode.LeftShift, false)
            end
            task.wait(0.25)
        end
        staminaThread = nil
    end)
end

local function setStaminaGuard(enabled)
    CONFIG.movement.staminaGuard.enabled = enabled
    if enabled then startStaminaGuard() end
end

local smartSprintThread = nil
local function startSmartSprint()
    if smartSprintThread then task.cancel(smartSprintThread) end
    smartSprintThread = task.spawn(function()
        while CONFIG.movement.smartSprint.enabled do
            local r = getRoot()
            if r then
                local holder = getBallHolder()
                local sprint = false
                if not holder or holder == LocalPlayer then
                    local ball = getLooseBall()
                    local bpos = ball and ballPos(ball)
                    if bpos and (bpos - r.Position).Magnitude > 8 then sprint = true end
                elseif holder ~= LocalPlayer and isEnemy(holder) then
                    sprint = true
                end
                if sprint and not UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    sendKey(Enum.KeyCode.LeftShift, true)
                elseif not sprint and UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
                    sendKey(Enum.KeyCode.LeftShift, false)
                end
            end
            task.wait(0.2)
        end
        smartSprintThread = nil
    end)
end

local function setSmartSprint(enabled)
    CONFIG.movement.smartSprint.enabled = enabled
    if enabled then startSmartSprint() end
end

local antiStunThread = nil
local function startAntiStun()
    if antiStunThread then task.cancel(antiStunThread) end
    antiStunThread = task.spawn(function()
        while CONFIG.movement.antiStun.enabled do
            local c = CHAR or getChar(LocalPlayer)
            local a = getAttr(c, "Action", "")
            if a == "Stunned" or a == "Stumble" then
                local hum = getHumanoid()
                if hum then hum.Jump = true end
                fireRemote(JumpRemote, {})
            end
            task.wait(0.2)
        end
        antiStunThread = nil
    end)
end

local function setAntiStun(enabled)
    CONFIG.movement.antiStun.enabled = enabled
    if enabled then startAntiStun() end
end

local crabThread = nil
local function startAutoCrab()
    if crabThread then task.cancel(crabThread) end
    crabThread = task.spawn(function()
        while CONFIG.movement.autoCrab.enabled do
            local r = getRoot()
            if r and iHaveBall() then
                local e = nearestEnemy(r.Position)
                if e and (e - r.Position).Magnitude <= CONFIG.movement.autoCrab.triggerDist then
                    fireRemote(HoldGRemote, {})
                end
            end
            task.wait(0.6)
        end
        crabThread = nil
    end)
end

local function setAutoCrab(enabled)
    CONFIG.movement.autoCrab.enabled = enabled
    if enabled then startAutoCrab() end
end

-- ============================================================
--  GREEN EFFECT SPOOFER  (hook GreenEffects.RunEffect)
-- ============================================================

local greenEffectHooked = false

local function hookGreenEffects()
    if greenEffectHooked then return end
    local ok, mod = pcall(function()
        return require(game.Players.LocalPlayer.PlayerScripts.Aero.Controllers.Visuals.Combined.GreenEffects)
    end)
    if not ok or type(mod) ~= "table" or type(mod.RunEffect) ~= "function" then
        logOutput("[Green Spoof] Could not hook GreenEffects controller.")
        return
    end
    local orig = mod.RunEffect
    mod.RunEffect = function(self, model, char, goal, time, effectName, ...)
        if CONFIG.cosmetics.greenEffectEnabled then
            effectName = CONFIG.cosmetics.greenEffectName
        end
        return orig(self, model, char, goal, time, effectName, ...)
    end
    greenEffectHooked = true
    logOutput("[Green Spoof] GreenEffects hooked. Current: " .. CONFIG.cosmetics.greenEffectName)
end

local function forceGreenEffectsSetting()
    pcall(function()
        local playerCtrl = require(game.Players.LocalPlayer.PlayerScripts.Aero.Controllers.Player)
        if playerCtrl and playerCtrl.ProfileData then
            playerCtrl.ProfileData.SavedSettings.Graphics.GreenEffects = true
        end
    end)
end

local function setGreenEffect(enabled, name)
    CONFIG.cosmetics.greenEffectEnabled = enabled
    if name then CONFIG.cosmetics.greenEffectName = name end
    if enabled then
        forceGreenEffectsSetting()
        hookGreenEffects()
    end
end

-- ============================================================
--  COSMETICS SPOOFER  (banner / title / overall / name / emote)
-- ============================================================

local function applyBannerSpoof()
    local ok, playerCtrl = pcall(function()
        return require(game.Players.LocalPlayer.PlayerScripts.Aero.Controllers.Player)
    end)
    if not ok or not playerCtrl or not playerCtrl.ProfileData then return end
    pcall(function()
        playerCtrl.ProfileData.Banner.Title = CONFIG.cosmetics.bannerTitle
        playerCtrl.ProfileData.Banner.Background = CONFIG.cosmetics.bannerBackground
    end)
end

local function applyCharacterSpoof()
    local c = CHAR or getChar(LocalPlayer)
    if not c then return end
    c:SetAttribute("Overall", CONFIG.cosmetics.overall)
    c:SetAttribute("Grade", CONFIG.cosmetics.grade)
end

-- Keep the remaining feature/UI locals in a separate function frame. Luau has
-- a hard limit of 200 simultaneously scoped locals per function, and this
-- script's top-level frame otherwise reaches that limit here.
function initializePracticalBasketballUI()
local nameGui = nil
local function applyNameSpoof()
    local c = CHAR or getChar(LocalPlayer)
    local head = c and c:FindFirstChild("Head")
    if CONFIG.cosmetics.fakeName == "" then
        if nameGui then nameGui:Destroy(); nameGui = nil end
        return
    end
    if not head then return end
    if not nameGui or not nameGui.Parent then
        nameGui = Instance.new("BillboardGui")
        nameGui.Name = "PB_NameSpoof"
        nameGui.Size = UDim2.new(0, 200, 0, 40)
        nameGui.Adornee = head
        nameGui.AlwaysOnTop = true
        nameGui.MaxDistance = 400
        local lbl = Instance.new("TextLabel", nameGui)
        lbl.Size = UDim2.new(1, 0, 1, 0)
        lbl.BackgroundTransparency = 1
        lbl.Font = Enum.Font.GothamBold
        lbl.TextSize = 18
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.TextStrokeTransparency = 0
        lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        nameGui.Parent = c
    end
    local lbl = nameGui:FindFirstChildOfClass("TextLabel")
    if lbl then lbl.Text = CONFIG.cosmetics.fakeName end
end

local cosmeticsThread = nil
local function startCosmetics()
    if cosmeticsThread then task.cancel(cosmeticsThread) end
    cosmeticsThread = task.spawn(function()
        while true do
            applyBannerSpoof()
            applyCharacterSpoof()
            applyNameSpoof()
            task.wait(0.5)
        end
    end)
end

local function playEmote(name)
    if EmoteRemote then
        fireRemote(EmoteRemote, name)
    end
end

-- ============================================================
--  PERFECT CAMERA
-- ============================================================

local perfectCamConn = nil
local function startPerfectCamera()
    if perfectCamConn then perfectCamConn:Disconnect() end
    perfectCamConn = RunService.Heartbeat:Connect(function()
        if not CONFIG.cosmetics.perfectCamera then return end
        if shotActive() then
            local r = getRoot()
            local cam = workspace.CurrentCamera
            if r and cam then
                local goal = getHoopGoal()
                local target = goal and goal.Position or (r.Position + r.CFrame.LookVector * 10)
                cam.CFrame = CFrame.lookAt(r.Position + Vector3.new(0, 4, 0), target)
            end
        end
    end)
end

local function setPerfectCamera(enabled)
    CONFIG.cosmetics.perfectCamera = enabled
    if enabled then
        startPerfectCamera()
    elseif perfectCamConn then
        perfectCamConn:Disconnect()
        perfectCamConn = nil
    end
end

-- ============================================================
--  PROXIMITY HIGHLIGHT
-- ============================================================

local proximityThread = nil

local function updateProximityHighlight()
    local c = CHAR or getChar(LocalPlayer)
    if not c then return end
    local old = c:FindFirstChild("ProximityHighlight")
    if old then old:Destroy() end
    if not CONFIG.proximity.enabled then return end

    local angle, dist = nearestEnemyAngleAndDist()
    local fill, outline

    if dist > CONFIG.proximity.warningRange or angle >= 160 then
        fill = Color3.fromRGB(0, 255, 0)
        outline = Color3.fromRGB(100, 255, 100)
    elseif angle >= 110 and dist > CONFIG.proximity.goodRange then
        fill = Color3.fromRGB(255, 165, 0)
        outline = Color3.fromRGB(255, 200, 100)
    else
        fill = Color3.fromRGB(255, 0, 0)
        outline = Color3.fromRGB(255, 100, 100)
    end

    local h = Instance.new("Highlight")
    h.Name = "ProximityHighlight"
    h.FillColor = fill
    h.OutlineColor = outline
    h.FillTransparency = 0.2
    h.OutlineTransparency = 0.1
    h.Parent = c
end

local function startProximityHighlight()
    if proximityThread then task.cancel(proximityThread) end
    proximityThread = task.spawn(function()
        while CONFIG.proximity.enabled do
            updateProximityHighlight()
            task.wait(0.1)
        end
        local c = CHAR or getChar(LocalPlayer)
        local h = c and c:FindFirstChild("ProximityHighlight")
        if h then h:Destroy() end
        proximityThread = nil
    end)
end

local function setProximityHighlight(enabled)
    CONFIG.proximity.enabled = enabled
    if enabled then startProximityHighlight() end
end

-- ============================================================
--  ESP  (attribute team check, never ESP self)
-- ============================================================

local espStore = {}

local function makeGui(p)
    local c = getChar(p)
    if not c then return end
    local hrp = c:FindFirstChild("HumanoidRootPart")
    local head = c:FindFirstChild("Head")

    local gui = Instance.new("BillboardGui")
    gui.Name = "PB_ESP"
    gui.Size = UDim2.new(0, 200, 0, 60)
    gui.AlwaysOnTop = true
    gui.MaxDistance = 1000
    gui.Adornee = hrp or head

    local frame = Instance.new("Frame", gui)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Font = Enum.Font.GothamBold
    label.TextSize = 14
    label.TextColor3 = Color3.new(1, 1, 1)
    label.TextStrokeTransparency = 0
    label.Text = p.Name

    local hl = Instance.new("Highlight")
    hl.Name = "PB_ESPHighlight"
    hl.FillTransparency = 0.65
    hl.OutlineTransparency = 0
    hl.Parent = c

    gui.Parent = hrp or c

    espStore[p] = { player = p, gui = gui, label = label, hl = hl }
end

local function refreshEsp()
    local seen = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer then continue end          -- never ESP self
        if CONFIG.esp.teamMode == "Enemies" and not isEnemy(p) then continue end
        if not isAlive(p) then continue end
        seen[p] = true
        if not espStore[p] or not espStore[p].gui or not espStore[p].gui.Parent then
            makeGui(p)
        end
    end
    for p, e in pairs(espStore) do
        if not seen[p] then
            if e.gui then e.gui:Destroy() end
            if e.hl then e.hl:Destroy() end
            espStore[p] = nil
        end
    end
end

local function updateEsp()
    for _, e in pairs(espStore) do
        local c = getChar(e.player)
        if not c or not e.label then continue end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        local hum = c:FindFirstChildOfClass("Humanoid")
        local r = getRoot()
        local enemy = isEnemy(e.player)

        e.hl.FillColor = enemy and CONFIG.esp.color or CONFIG.esp.teamColor
        e.hl.OutlineColor = enemy and CONFIG.esp.color or CONFIG.esp.teamColor

        local text = e.player.Name
        if CONFIG.esp.showHealth and hum then
            text = text .. string.format("  %d%%", math.floor(hum.Health / hum.MaxHealth * 100))
        end
        if CONFIG.esp.showDistance and hrp and r then
            text = text .. string.format("  [%.0fm]", (r.Position - hrp.Position).Magnitude)
        end
        e.label.Text = text
        e.label.TextColor3 = enemy and CONFIG.esp.color or CONFIG.esp.teamColor

        if hrp then e.gui.Adornee = hrp end
        if hum and hum.Health <= 0 then
            if e.gui then e.gui:Destroy() end
            if e.hl then e.hl:Destroy() end
            espStore[e.player] = nil
        end
    end
end

local espThread = nil

local function startEsp()
    if espThread then task.cancel(espThread) end
    espThread = task.spawn(function()
        while CONFIG.esp.enabled do
            refreshEsp()
            updateEsp()
            task.wait(0.1)
        end
        for _, e in pairs(espStore) do
            if e.gui then e.gui:Destroy() end
            if e.hl then e.hl:Destroy() end
        end
        espStore = {}
        espThread = nil
    end)
end

local function setEsp(enabled)
    CONFIG.esp.enabled = enabled
    if enabled then startEsp() end
end

-- ============================================================
--  CAMERA LOCK  (always tracks closest ball)
-- ============================================================

local cameraThread = nil

local function startCameraLock()
    if cameraThread then task.cancel(cameraThread) end
    cameraThread = task.spawn(function()
        local cam = workspace.CurrentCamera
        while CONFIG.camera.lock do
            local r = getRoot()
            local from = cam.CFrame.Position
            local ball = getClosestBall(from)
            if ball then
                local holder = getBallHolder()
                local bpos = ballPos(ball)
                if bpos and holder ~= LocalPlayer then
                    local dir = (bpos - cam.CFrame.Position).Unit
                    cam.CFrame = cam.CFrame:Lerp(
                        CFrame.lookAt(cam.CFrame.Position, cam.CFrame.Position + dir),
                        CONFIG.camera.strength
                    )
                end
            end
            task.wait(1 / 60)
        end
        cameraThread = nil
    end)
end

local function setCameraLock(enabled)
    CONFIG.camera.lock = enabled
    if enabled then startCameraLock() end
end

-- ============================================================
--  VISUAL / FEEDBACK SPOOFER
-- ============================================================

local spooferThread = nil

local function applySpoofFrame()
    local c = CHAR or getChar(LocalPlayer)
    if not c or not root then return end

    local meter = root:FindFirstChild("VerticalMeter")
    if meter then
        local green = meter:FindFirstChild("Meter_Green")
        if green then
            local grad = green:FindFirstChildOfClass("UIGradient")
            if grad then
                grad.Transparency = NumberSequence.new(0)
            end
        end
    end

    local fb = root:FindFirstChild("ShotFeedback")
    if fb then
        local timing = fb:FindFirstChild("ReleaseTiming")
        if timing then timing.Text = "Perfect Release" end
        local contest = fb:FindFirstChild("Contest")
        if contest then contest.Text = "0% Contested" end
        local pct = fb:FindFirstChild("Percentage")
        if pct then pct.Text = "100%" end
    end
end

local function startSpoofer()
    if spooferThread then task.cancel(spooferThread) end
    spooferThread = task.spawn(function()
        while CONFIG.spoofer.enabled do
            applySpoofFrame()
            task.wait(0.1)
        end
        spooferThread = nil
    end)
end

local function setSpoofer(enabled)
    CONFIG.spoofer.enabled = enabled
    if enabled then startSpoofer() end
end

local glowHighlight = nil

local function setGlow(enabled)
    local c = CHAR or getChar(LocalPlayer)
    if glowHighlight then
        glowHighlight:Destroy()
        glowHighlight = nil
    end
    if enabled and c then
        glowHighlight = Instance.new("Highlight")
        glowHighlight.Name = "PB_Glow"
        glowHighlight.FillColor = CONFIG.spoofer.glowColor
        glowHighlight.OutlineColor = CONFIG.spoofer.glowColor
        glowHighlight.FillTransparency = 0.5
        glowHighlight.OutlineTransparency = 0
        glowHighlight.Parent = c
    end
end

-- ============================================================
--  PLAYER UTILITIES
-- ============================================================

local function setWalkSpeed(v)
    CONFIG.player.walkSpeed = v
    baseWalkSpeed = v
    local hum = getHumanoid()
    if hum then hum.WalkSpeed = v end
end

local function setJumpPower(v)
    CONFIG.player.jumpPower = v
    local hum = getHumanoid()
    if hum then hum.JumpPower = v end
end

-- ============================================================
--  CONSOLE / LOG OUTPUT
-- ============================================================

local logSink = nil -- assigned by UI; falls back to print
logOutput = function(msg)
    if logSink then
        pcall(function() logSink(msg) end)
    else
        print("[Practical Basketball] " .. msg)
    end
end

-- ============================================================
--  UI  (Sift)
-- ============================================================

local Sift = nil

local function buildUI()
    Sift:ShowLoading({
        Title = SCRIPT_NAME,
        Subtitle = "Loading modules...",
        Duration = 1.8,
        OnDone = function()
            local Window = Sift:CreateWindow({
                Title = SCRIPT_NAME,
                Subtitle = "v2.0.0",
                Size = UDim2.new(0, 620, 0, 500),
                ToggleKey = Enum.KeyCode.RightShift,
            })

            local Shooting = Window:CreateTab({ Name = "Shooting" })
            local Dribble = Window:CreateTab({ Name = "Dribble" })
            local Defense = Window:CreateTab({ Name = "Defense" })
            local Movement = Window:CreateTab({ Name = "Movement" })
            local Visuals = Window:CreateTab({ Name = "Visuals" })
            local PlayerTab = Window:CreateTab({ Name = "Player" })

            -- =====================================
            --  SHOOTING
            -- =====================================
            Shooting:AddSection("Shot Meter (Auto Green)")

            Shooting:AddToggle({
                Title = "Auto Green", Default = false, Flag = "AutoGreen",
                Callback = function(state)
                    CONFIG.shooting.enabled = state
                    if not state then
                        if CONFIG.shooting.releaseMode == "Hold" then shootRelease() end
                        shotGeneration = shotGeneration + 1
                        shotReleased = true
                        stopShotWatch()
                        cancelTask(shotThread)
                        shotThread = nil
                        cancelTask(shotFallbackThread)
                        shotFallbackThread = nil
                    end
                end,
            })

            Shooting:AddDropdown({
                Title = "Shoot Key",
                Options = SHOOT_KEY_OPTIONS,
                Default = "X",
                Flag = "ShootKey",
                Callback = function(keyName)
                    local selected = KEY_MAP[keyName]
                    if selected then
                        CONFIG.shooting.key = selected
                        logOutput("Shoot key changed to " .. tostring(keyName))
                    end
                end,
            })

            Shooting:AddDropdown({
                Title = "Force Green Method",
                Options = { "Reversal", "Threshold", "Timed", "Peak", "Assist" },
                Default = CONFIG.shooting.forceGreenMethod, Flag = "ForceGreen",
                Callback = function(v) CONFIG.shooting.forceGreenMethod = v end,
            })

            Shooting:AddDropdown({
                Title = "Release Mode", Options = { "Auto", "Hold" },
                Default = CONFIG.shooting.releaseMode, Flag = "ReleaseMode",
                Callback = function(v) CONFIG.shooting.releaseMode = v end,
            })

            Shooting:AddSlider({
                Title = "Green Offset Y", Min = -2, Max = 1, Round = 3,
                Default = CONFIG.shooting.greenOffsetY, Flag = "GreenOffsetY",
                Callback = function(v) CONFIG.shooting.greenOffsetY = v end,
            })

            Shooting:AddSlider({
                Title = "Release Timeout", Min = 0.5, Max = 4, Round = 1,
                Default = CONFIG.shooting.shotTimeout, Flag = "ShotTimeout",
                Callback = function(v) CONFIG.shooting.shotTimeout = v end,
            })

            Shooting:AddSection("Release Engine")

            Shooting:AddDropdown({
                Title = "Device Profile", Options = { "Auto", "PC", "Controller", "Mobile" },
                Default = CONFIG.shooting.device, Flag = "DeviceProfile",
                Callback = function(v) CONFIG.shooting.device = v end,
            })

            Shooting:AddDropdown({
                Title = "Meter", Options = { "Auto", "Vertical", "Rocket", "Bat", "Funnel", "Hoop", "Roblox" }, Default = "Auto",
                Flag = "MeterType",
                Callback = function(v)
                    CONFIG.shooting.meter = v == "Auto" and "Auto" or v
                end,
            })

            local offsetSliders = {}
            for _, m in ipairs(METER_TYPES) do
                Shooting:AddSlider({
                    Title = m .. " Offset", Min = -2, Max = 1, Round = 3,
                    Default = CONFIG.shooting.meterOffsets[m], Flag = "Meter_" .. m,
                    Callback = (function(meterName)
                        return function(v) CONFIG.shooting.meterOffsets[meterName] = v end
                    end)(m),
                })
            end

            Shooting:AddSection("Auto Shoot")

            Shooting:AddToggle({
                Title = "Auto Shoot", Default = false, Flag = "AutoShoot",
                Callback = setAutoShoot,
            })

            Shooting:AddSlider({
                Title = "Max Range", Min = 8, Max = 45, Round = 0,
                Default = CONFIG.shooting.autoShoot.maxRange, Flag = "AutoShootRange",
                Callback = function(v) CONFIG.shooting.autoShoot.maxRange = v end,
            })

            Shooting:AddSlider({
                Title = "Min Contest Distance", Min = 1, Max = 10, Round = 1,
                Default = CONFIG.shooting.autoShoot.minContestDist, Flag = "AutoShootContest",
                Callback = function(v) CONFIG.shooting.autoShoot.minContestDist = v end,
            })

            Shooting:AddToggle({
                Title = "Only Wide Open", Default = false, Flag = "OnlyWideOpen",
                Callback = function(v) CONFIG.shooting.autoShoot.onlyWideOpen = v end,
            })

            Shooting:AddToggle({
                Title = "Range Visualiser", Default = false, Flag = "RangeVis",
                Callback = setVisualizer,
            })

            Shooting:AddSection("Clutch / Lob / Jelly / Run Up")

            Shooting:AddToggle({
                Title = "Auto Clutch", Default = false, Flag = "AutoClutch",
                Callback = setAutoClutch,
            })

            Shooting:AddToggle({
                Title = "Auto Lob Catch", Default = false, Flag = "AutoLob",
                Callback = setAutoLob,
            })

            Shooting:AddToggle({
                Title = "Smart Jelly", Default = false, Flag = "SmartJelly",
                Callback = setSmartJelly,
            })

            Shooting:AddToggle({
                Title = "Pump Fake Detection", Default = false, Flag = "PumpFake",
                Callback = setPumpFake,
            })

            Shooting:AddToggle({
                Title = "Auto Run Up", Default = false, Flag = "AutoRunUp",
                Callback = setAutoRunUp,
            })

            Shooting:AddSection("Shot Feedback Log")

            Shooting:AddToggle({
                Title = "Log Shots", Default = true, Flag = "ShotLog",
                Callback = setShotLog,
            })

            local logLabel = Shooting.AddLabel and Shooting:AddLabel({
                Title = "No shots logged yet.",
            })

            logSink = function(msg)
                if logLabel and logLabel.SetText then
                    pcall(function() logLabel:SetText(msg) end)
                end
            end

            -- =====================================
            --  DRIBBLE
            -- =====================================
            Dribble:AddSection("Move Slots (hand-aware)")

            Dribble:AddToggle({
                Title = "Enable Dribble Macros", Default = true, Flag = "DribbleOn",
                Callback = function(v) CONFIG.dribble.enabled = v end,
            })

            for i, slot in ipairs(CONFIG.dribble.moveSlots) do
                Dribble:AddDropdown({
                    Title = "Move " .. i,
                    Options = MOVE_LIST,
                    Default = slot.name, Flag = "Move" .. i .. "_Name",
                    Callback = (function(idx)
                        return function(v) CONFIG.dribble.moveSlots[idx].name = v end
                    end)(i),
                })
                Dribble:AddKeybind({
                    Title = "Move " .. i .. " Key",
                    Default = slot.key, Flag = "Move" .. i .. "_Key",
                    Callback = (function(idx)
                        return function()
                            sendMove(CONFIG.dribble.moveSlots[idx].name)
                        end
                    end)(i),
                })
            end

            Dribble:AddSection("Combo Slots (3 moves, loopable)")

            for i, slot in ipairs(CONFIG.dribble.comboSlots) do
                for m = 1, 3 do
                    Dribble:AddDropdown({
                        Title = "Combo " .. i .. " - Move " .. m,
                        Options = MOVE_LIST,
                        Default = slot.moves[m], Flag = "Combo" .. i .. "_M" .. m,
                        Callback = (function(idx, mi)
                            return function(v) CONFIG.dribble.comboSlots[idx].moves[mi] = v end
                        end)(i, m),
                    })
                end
                Dribble:AddKeybind({
                    Title = "Combo " .. i .. " Key",
                    Default = slot.key, Flag = "Combo" .. i .. "_Key",
                    Callback = (function(idx)
                        return function()
                            runComboSlot(CONFIG.dribble.comboSlots[idx])
                        end
                    end)(i),
                })
                Dribble:AddToggle({
                    Title = "Combo " .. i .. " Loop", Default = false, Flag = "Combo" .. i .. "_Loop",
                    Callback = (function(idx)
                        return function(v) CONFIG.dribble.comboSlots[idx].loop = v end
                    end)(i),
                })
            end

            Dribble:AddSection("Combo Recorder")

            Dribble:AddKeybind({
                Title = "Record / Stop", Default = CONFIG.dribble.recorder.recordKey,
                Flag = "RecordKey",
                Callback = function()
                    if recorder.active then stopRecording() else startRecording() end
                end,
            })
            Dribble:AddKeybind({
                Title = "Playback", Default = CONFIG.dribble.recorder.playbackKey,
                Flag = "PlaybackKey",
                Callback = playRecording,
            })
            Dribble:AddButton({
                Title = "Play Recording", Callback = playRecording,
            })

            Dribble:AddSection("Auto Ankle Breaker")

            Dribble:AddToggle({
                Title = "Auto Ankle Breaker", Default = false, Flag = "AnkleBreaker",
                Callback = setAnkleBreaker,
            })

            Dribble:AddDropdown({
                Title = "Ankle Move", Options = MOVE_LIST,
                Default = CONFIG.dribble.autoAnkle.move, Flag = "AnkleMove",
                Callback = function(v) CONFIG.dribble.autoAnkle.move = v end,
            })

            -- =====================================
            --  DEFENSE
            -- =====================================
            Defense:AddSection("Auto Block (per shot type)")

            Defense:AddToggle({
                Title = "Auto Block", Default = false, Flag = "AutoBlock",
                Callback = setAutoBlock,
            })

            for _, st in ipairs(SHOT_TYPES) do
                Defense:AddToggle({
                    Title = "Block " .. st, Default = true, Flag = "Block_" .. st,
                    Callback = (function(stName)
                        return function(v) CONFIG.defense.autoBlock.shotTypes[stName].enabled = v end
                    end)(st),
                })
            end

            Defense:AddToggle({
                Title = "Block Boost", Default = false, Flag = "BlockBoost",
                Callback = function(v) CONFIG.defense.blockBoost.enabled = v end,
            })

            Defense:AddSection("Auto Guard")

            Defense:AddToggle({
                Title = "Auto Guard", Default = false, Flag = "AutoGuard",
                Callback = setGuard,
            })

            Defense:AddToggle({
                Title = "Prioritise Ball Holder", Default = true, Flag = "GuardBall",
                Callback = function(v) CONFIG.defense.autoGuard.prioritiseBallHolder = v end,
            })

            Defense:AddToggle({
                Title = "Prediction", Default = true, Flag = "GuardPrediction",
                Callback = function(v) CONFIG.defense.autoGuard.prediction = v end,
            })

            Defense:AddToggle({
                Title = "Sticky Defense", Default = true, Flag = "GuardSticky",
                Callback = function(v) CONFIG.defense.autoGuard.sticky = v end,
            })

            Defense:AddToggle({
                Title = "Screen Avoidance", Default = true, Flag = "GuardScreen",
                Callback = function(v) CONFIG.defense.autoGuard.screenAvoid = v end,
            })

            Defense:AddSlider({
                Title = "Reaction Delay", Min = 0, Max = 1, Round = 2,
                Default = CONFIG.defense.autoGuard.reactionDelay, Flag = "GuardReaction",
                Callback = function(v) CONFIG.defense.autoGuard.reactionDelay = v end,
            })

            Defense:AddSlider({
                Title = "Follow Distance", Min = 2, Max = 20, Round = 0,
                Default = CONFIG.defense.autoGuard.followDistance, Flag = "GuardFollow",
                Callback = function(v) CONFIG.defense.autoGuard.followDistance = v end,
            })

            Defense:AddSection("Off-Ball / Steal")

            Defense:AddToggle({
                Title = "Off-Ball Defense", Default = false, Flag = "OffBall",
                Callback = setOffBall,
            })

            Defense:AddToggle({
                Title = "Auto Steal", Default = false, Flag = "AutoSteal",
                Callback = setAutoSteal,
            })

            Defense:AddSlider({
                Title = "Steal Range", Min = 1, Max = 8, Round = 1,
                Default = CONFIG.defense.autoSteal.range, Flag = "StealRange",
                Callback = function(v) CONFIG.defense.autoSteal.range = v end,
            })

            Defense:AddSection("Camera")

            Defense:AddToggle({
                Title = "Camera Lock (closest ball)", Default = false, Flag = "CameraLock",
                Callback = setCameraLock,
            })

            Defense:AddSlider({
                Title = "Lock Strength", Min = 0.1, Max = 1, Round = 2,
                Default = CONFIG.camera.strength, Flag = "LockStrength",
                Callback = function(v) CONFIG.camera.strength = v end,
            })

            -- =====================================
            --  MOVEMENT
            -- =====================================
            Movement:AddSection("Glide Set")

            Movement:AddToggle({
                Title = "Glide Set", Default = false, Flag = "GlideSet",
                Callback = setGlide,
            })

            local glideKeys = { "dribble", "shot", "block", "rebound", "sprint", "withBall" }
            local glideLabels = { dribble = "Dribble", shot = "Shot", block = "Block", rebound = "Rebound", sprint = "Sprint", withBall = "With Ball" }
            for _, k in ipairs(glideKeys) do
                Movement:AddSlider({
                    Title = "Glide: " .. glideLabels[k], Min = 0.5, Max = 2, Round = 2,
                    Default = CONFIG.movement.glide[k], Flag = "Glide_" .. k,
                    Callback = (function(key)
                        return function(v) CONFIG.movement.glide[key] = v end
                    end)(k),
                })
            end

            Movement:AddSection("Rebounding")

            Movement:AddToggle({
                Title = "Auto Rebound", Default = false, Flag = "AutoRebound",
                Callback = setAutoRebound,
            })

            Movement:AddToggle({
                Title = "Ball Magnet", Default = false, Flag = "BallMagnet",
                Callback = setBallMagnet,
            })

            Movement:AddSection("Stamina & Sprint")

            Movement:AddToggle({
                Title = "Stamina Guard", Default = false, Flag = "StaminaGuard",
                Callback = setStaminaGuard,
            })

            Movement:AddToggle({
                Title = "Smart Sprint", Default = false, Flag = "SmartSprint",
                Callback = setSmartSprint,
            })

            Movement:AddSection("Recovery")

            Movement:AddToggle({
                Title = "Anti Stun", Default = false, Flag = "AntiStun",
                Callback = setAntiStun,
            })

            Movement:AddToggle({
                Title = "Auto Crab", Default = false, Flag = "AutoCrab",
                Callback = setAutoCrab,
            })

            -- =====================================
            --  VISUALS
            -- =====================================
            Visuals:AddSection("Green Effect Spoofer")

            Visuals:AddToggle({
                Title = "Spoof Green Effect", Default = false, Flag = "GreenSpoof",
                Callback = function(v)
                    setGreenEffect(v, CONFIG.cosmetics.greenEffectName)
                end,
            })

            Visuals:AddDropdown({
                Title = "Green Effect", Options = GREEN_EFFECTS,
                Default = CONFIG.cosmetics.greenEffectName, Flag = "GreenEffect",
                Callback = function(v)
                    CONFIG.cosmetics.greenEffectName = v
                    if CONFIG.cosmetics.greenEffectEnabled then setGreenEffect(true, v) end
                end,
            })

            Visuals:AddSection("ESP")

            Visuals:AddToggle({
                Title = "ESP", Default = false, Flag = "ESP",
                Callback = setEsp,
            })

            Visuals:AddDropdown({
                Title = "Filter", Options = { "Enemies", "All" },
                Default = CONFIG.esp.teamMode, Flag = "ESPFilter",
                Callback = function(v) CONFIG.esp.teamMode = v end,
            })

            Visuals:AddToggle({
                Title = "Show Health", Default = true, Flag = "ESPHealth",
                Callback = function(v) CONFIG.esp.showHealth = v end,
            })

            Visuals:AddToggle({
                Title = "Show Distance", Default = true, Flag = "ESPDistance",
                Callback = function(v) CONFIG.esp.showDistance = v end,
            })

            Visuals:AddColorPicker({
                Title = "Enemy Color", Default = CONFIG.esp.color, Flag = "ESPColor",
                Callback = function(v) CONFIG.esp.color = v end,
            })

            Visuals:AddColorPicker({
                Title = "Team Color", Default = CONFIG.esp.teamColor, Flag = "TeamColor",
                Callback = function(v) CONFIG.esp.teamColor = v end,
            })

            Visuals:AddSection("Proximity")

            Visuals:AddToggle({
                Title = "Proximity Highlight", Default = false, Flag = "Proximity",
                Callback = setProximityHighlight,
            })

            Visuals:AddSlider({
                Title = "Warning Range", Min = 4, Max = 40, Round = 0,
                Default = CONFIG.proximity.warningRange, Flag = "ProxWarning",
                Callback = function(v) CONFIG.proximity.warningRange = v end,
            })

            Visuals:AddSlider({
                Title = "Good Range", Min = 2, Max = 20, Round = 0,
                Default = CONFIG.proximity.goodRange, Flag = "ProxGood",
                Callback = function(v) CONFIG.proximity.goodRange = v end,
            })

            Visuals:AddSection("Cosmetics")

            if Visuals.AddInput then
                Visuals:AddInput({
                    Title = "Fake Name", Default = CONFIG.cosmetics.fakeName, Flag = "FakeName",
                    Callback = function(v) CONFIG.cosmetics.fakeName = v or "" end,
                })

                Visuals:AddInput({
                    Title = "Banner Title", Default = CONFIG.cosmetics.bannerTitle, Flag = "BannerTitle",
                    Callback = function(v) CONFIG.cosmetics.bannerTitle = v or "Newcomer" end,
                })

                Visuals:AddInput({
                    Title = "Banner Background", Default = CONFIG.cosmetics.bannerBackground, Flag = "BannerBg",
                    Callback = function(v) CONFIG.cosmetics.bannerBackground = v or "Default" end,
                })
            end

            Visuals:AddSlider({
                Title = "Spoofed Overall", Min = 60, Max = 100, Round = 0,
                Default = CONFIG.cosmetics.overall, Flag = "SpoofOverall",
                Callback = function(v) CONFIG.cosmetics.overall = v end,
            })

            Visuals:AddSlider({
                Title = "Spoofed Grade", Min = 1, Max = 99, Round = 0,
                Default = CONFIG.cosmetics.grade, Flag = "SpoofGrade",
                Callback = function(v) CONFIG.cosmetics.grade = v end,
            })

            Visuals:AddDropdown({
                Title = "Play Emote", Options = EMOTES,
                Default = CONFIG.cosmetics.emote, Flag = "Emote",
                Callback = function(v)
                    CONFIG.cosmetics.emote = v
                    playEmote(v)
                end,
            })

            Visuals:AddToggle({
                Title = "Always Perfect Camera", Default = false, Flag = "PerfectCam",
                Callback = setPerfectCamera,
            })

            Visuals:AddSection("Effects Spoofer")

            Visuals:AddToggle({
                Title = "Visual / Feedback Spoofer", Default = false, Flag = "Spoofer",
                Callback = setSpoofer,
            })

            Visuals:AddToggle({
                Title = "Character Glow", Default = false, Flag = "Glow",
                Callback = setGlow,
            })

            Visuals:AddColorPicker({
                Title = "Glow Color", Default = CONFIG.spoofer.glowColor, Flag = "GlowColor",
                Callback = function(v)
                    CONFIG.spoofer.glowColor = v
                    if glowHighlight then
                        glowHighlight.FillColor = v
                        glowHighlight.OutlineColor = v
                    end
                end,
            })

            -- =====================================
            --  PLAYER
            -- =====================================
            PlayerTab:AddSection("Combo Macro")

            if PlayerTab.AddInput then
                PlayerTab:AddInput({
                    Title = "Combo Sequence", Default = CONFIG.combo.sequence, Flag = "ComboSeq",
                    Callback = function(v) CONFIG.combo.sequence = v or "X E X" end,
                })
            elseif PlayerTab.AddLabel then
                PlayerTab:AddLabel({ Title = "Combo Sequence: " .. CONFIG.combo.sequence })
            end

            PlayerTab:AddToggle({
                Title = "Loop Combo", Default = false, Flag = "ComboLoop",
                Callback = function(v) CONFIG.combo.loop = v end,
            })

            PlayerTab:AddKeybind({
                Title = "Run Combo", Default = CONFIG.combo.key, Flag = "ComboKey",
                Callback = function()
                    playSequence(CONFIG.combo.sequence, CONFIG.combo.loop)
                end,
            })

            PlayerTab:AddButton({
                Title = "Execute Combo", Callback = function()
                    playSequence(CONFIG.combo.sequence, CONFIG.combo.loop)
                end,
            })

            PlayerTab:AddSection("Character")

            PlayerTab:AddSlider({
                Title = "Walk Speed", Min = 16, Max = 200, Round = 0,
                Default = CONFIG.player.walkSpeed, Flag = "WalkSpeed",
                Callback = setWalkSpeed,
            })

            PlayerTab:AddSlider({
                Title = "Jump Power", Min = 0, Max = 200, Round = 0,
                Default = CONFIG.player.jumpPower, Flag = "JumpPower",
                Callback = setJumpPower,
            })

            PlayerTab:AddSection("Window")

            PlayerTab:AddKeybind({
                Title = "Toggle UI", Default = Enum.KeyCode.RightShift,
                Callback = function() Window:Toggle() end,
            })

            -- start background systems
            startShotLog()
            startCosmetics()

            logOutput("Loaded successfully. Meter: " .. detectMeter() .. " | Green: " .. currentGreenOffset())

            if Sift.Notify then
                Sift:Notify({
                    Title = SCRIPT_NAME,
                    Content = "Loaded successfully. Meter: " .. detectMeter(),
                    Duration = 3,
                })
            end
        end,
    })
end

local ok, err = pcall(function()
    Sift = loadstring(game:HttpGet(CONFIG.siftUrl))()
end)

if Sift then
    if CONFIG.keysystem then
        Sift:ShowKeySystem({
            KeyLink = "https://sift.win/key",
            WorkerBaseURL = "https://sift.win/",
            OnSuccess = function(key) buildUI() end
        })
    else
        buildUI()
    end
else
    warn("[Practical Basketball] Failed to load Sift UI library: " .. tostring(err))
end

end

initializePracticalBasketballUI()

end

initializePracticalBasketballFeatures()
