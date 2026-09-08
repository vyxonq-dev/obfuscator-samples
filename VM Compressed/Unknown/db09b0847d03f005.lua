-- [[ welcome to the NEW and IMPROVED fully global environmental initialization system ]] --
-- [[ it LITERALLY dumbs down everything for us so simply ]] --
if not game:IsLoaded() then game.Loaded:Wait() end

local g = getgenv()
local game_ref = game

g.wait_until = g.wait_until or function(condition, interval, max_tries)
    interval = tonumber(interval) or 0.05

    if typeof(max_tries) == "string" then
        local lower = max_tries:lower()
        -- [[ cannot be more obvious lol ]] --
        if lower == "inf" or lower == "infinite" or lower == "infinity" or lower == "∞" then
            max_tries = 999999999999
        else
            max_tries = tonumber(max_tries)
        end
    end

    max_tries = max_tries or 100

    if interval < 0.03 then
        interval = 0.05
    end

    if typeof(condition) ~= "function" then
        local target = condition
        condition = function()
            return (typeof(target) == "Instance" and target.Parent ~= nil) or target
        end
    end

    local tries = 0

    repeat
        task.wait(interval)
        tries += 1
    until condition() or tries >= max_tries

    return condition() and true or false
end

local Flames_API = loadstring(game:HttpGet("https://raw.githubusercontent.com/EnterpriseExperience/MicUpSource/refs/heads/main/Flame_Hubs_API.lua"))()

if not g.blank then
    g.blank = function(...)
        return ...
    end
end
if not g.blankfunction then
    g.blankfunction = function(...)
        return ...
    end
end

g.set_fps = g.set_fps or function(fps)
    if setfpscap then
        return setfpscap(fps)
    elseif setfps then
        return setfps(fps)
    else
        return nil
    end
end

-- [[ not sure if it works correctly, but this is a BETA function checker I've implemented for now I plan to use later. ]] --
g._function_cache = g._function_cache or {}

g.check_function = function(func)
    if typeof(func) == "function" then
        return func
    end

    if typeof(func) ~= "string" then
        return false
    end

    local name = func:lower()
    local cached = g._function_cache[name]
    if cached ~= nil then
        return cached or false
    end

    local env = getfenv(0)
    for k, v in pairs(env) do
        if typeof(v) == "function" and tostring(k):lower() == name then
            g._function_cache[name] = v
            return v
        end
    end

    g._function_cache[name] = false
    return false
end

getgenv().low_level_executor = getgenv().low_level_executor or function()
    if executor_Name == "Solara" or string.find(executor_Name, "JJSploit") or executor_Name == "Xeno" then
        return true
    else
        return false
    end
end

g.Game = game_ref
g.JobID = game_ref.JobId
g.PlaceID = game_ref.PlaceId

if setfpscap or setfps then
    set_fps(999)
end

g.AllClipboards = g.AllClipboards or
    setclipboard or toclipboard or set_clipboard or
    (Clipboard and Clipboard.set) or blank

g.httprequest_Init = g.httprequest_Init or
    (syn and syn.request) or
    (http and http.request) or
    http_request or
    (fluxus and fluxus.request) or
    request or blank

get_http = g.httprequest_Init

g.queueteleport = g.queueteleport or
    (syn and syn.queue_on_teleport) or
    queue_on_teleport or
    (fluxus and fluxus.queue_on_teleport) or
    blank

queueteleport = g.queueteleport

g.get_or_set = g.get_or_set or function(name, value)
    if rawget and rawset then
        local existing = rawget(g, name)
        if existing == nil then
            rawset(g, name, value)
            return value
        end
        return existing
    end

    local existing = g[name]

    if existing == nil then
        g[name] = value
        return value
    end

    return existing
end

local fps = setfpscap or setfps or blank
SetFPSCap = get_or_set("SetFPSCap", fps)

local NotifyLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/EnterpriseExperience/MicUpSource/refs/heads/main/Notification_Lib.lua"))()
local valid_titles = {success="Success",info="Info",warning="Warning",error="Error",succes="Success",sucess="Success",eror="Error",erorr="Error",warnin="Warning"}
local function format_title(str)
   if typeof(str)~="string" then return "Info" end
   local key=str:lower()
   return valid_titles[key] or "Info"
end
getgenv().notify=getgenv().notify or function(title,msg,dur)
   local fixed_title=format_title(title)
   NotifyLib:External_Notification(fixed_title,tostring(msg),tonumber(dur))
end

local function retrieve_executor()
    local f = identifyexecutor
    if type(f) == "function" then
        return { Name = f() }
    end
    return { Name = tostring(f or "Unknown Executor") }
end

local function identify_executor_clean()
    return tostring(retrieve_executor().Name)
end

local executor_string = identify_executor_clean()

local function executor_contains(substr)
    if type(executor_string) ~= "string" then return false end
    return string.find(executor_string:lower(), substr:lower(), 1, true) ~= nil
end

executor_contains = g.get_or_set("executor_contains", executor_contains)

local function wait_for_datamodel(inst)
    if not inst then return false end

    local attempts = 0
    local maximum_attempts = 300

    while attempts < maximum_attempts do
        if inst.Parent and inst:IsDescendantOf(workspace) then
            return true
        end
        task.wait(0.1)
        attempts += 1
    end

    return false
end
wait(0.1)
get_or_set("wait_for_datamodel", wait_for_datamodel)

local function wait_for_child(parent, name)
    if not parent then return nil end

    local existing = parent:FindFirstChild(name)
    if existing then return existing end

    local ok, obj = pcall(function()
        return parent:WaitForChild(name, math.huge)
    end)

    return ok and obj or nil
end
wait(0.1)
get_or_set("wait_for_child", wait_for_child)

local function wait_for_descendant(parent, name)
    if not parent then return nil end

    local found = parent:FindFirstChild(name, true)
    if found then return found end

    local conn
    local result = nil

    conn = parent.DescendantAdded:Connect(function(d)
        if d.Name == name then
            result = d
            conn:Disconnect()
        end
    end)

    while not result do
        local check = parent:FindFirstChild(name, true)
        if check then
            result = check
            conn:Disconnect()
            break
        end
        task.wait()
    end

    return result
end
wait(0.1)
get_or_set("wait_for_descendant", wait_for_descendant)

local function wait_for_child_safe(parent, name)
    if not parent then return nil end

    local ok, obj = pcall(function()
        return parent:WaitForChild(name, 9e9)
    end)

    if ok and obj then
        return obj
    end

    return nil
end
wait(0.1)
get_or_set("wait_for_child_safe", wait_for_child_safe)

local function retry_find(func, retries, delay)
    for _ = 1, retries do
        local ok, result = pcall(func)
        if ok and result then
            return result
        end
        task.wait(delay)
    end
    return nil
end
wait(0.1)
get_or_set("retry_find", retry_find)

g.get_char = g.get_char or function(Player)
    if not Player or not Player:IsA("Player") then return nil end

    local current_char
    local diedconn
    local added_conn

    local function hookchar(char)
        current_char = char

        if diedconn then diedconn:Disconnect() end

        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            diedconn = hum.Died:Once(function()
                current_char = nil
            end)
        end
    end

    if Player.Character and Player.Character.Parent then
        hookchar(Player.Character)
    end

    added_conn = Player.CharacterAdded:Connect(hookchar)

    while not current_char do
        task.wait()
        local char = Player.Character
        if char and char.Parent then
            hookchar(char)
        end
    end

    return current_char
end
wait(0.5)
if not g.get_human then
    g.get_human = function(Player, timeout)
        timeout = timeout or 15

        local char = g.get_char(Player)
        if not char then return nil end

        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then return hum end

        local died = false
        local h = char:FindFirstChildOfClass("Humanoid")
        if h then
            h.Died:Connect(function()
                died = true
            end)
        end

        local hum_conn
        hum_conn = char.ChildAdded:Connect(function(c)
            if c:IsA("Humanoid") then
                hum = c
                hum_conn:Disconnect()
            end
        end)

        local start = os.clock()
        while not hum and not died and (os.clock() - start) < timeout do
            task.wait()
        end

        if hum_conn then hum_conn:Disconnect() end

        return (not died and hum) or nil
    end
end

if not g.get_root then
    g.get_root = function(Player, timeout)
        timeout = timeout or 15

        local char = g.get_char(Player)
        if not char then return nil end

        local root = char:FindFirstChild("HumanoidRootPart")
                or char:FindFirstChild("UpperTorso")
                or char:FindFirstChild("Torso")
        if root then return root end

        local targets = {
            HumanoidRootPart = true,
            UpperTorso = true,
            Torso = true
        }

        local died = false
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Died:Connect(function()
                died = true
            end)
        end

        local added_conn
        added_conn = char.ChildAdded:Connect(function(c)
            if targets[c.Name] then
                root = c
                added_conn:Disconnect()
            end
        end)

        local start = os.clock()
        while not root and not died and (os.clock() - start) < timeout do
            task.wait()
        end

        if added_conn then added_conn:Disconnect() end

        return (not died and root) or nil
    end
end

if not g.get_head then
    g.get_head = function(Player, timeout)
        timeout = timeout or 15

        local char = g.get_char(Player)
        if not char then return nil end

        local head = char:FindFirstChild("Head")
        if head then return head end

        local died = false
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            hum.Died:Connect(function()
                died = true
            end)
        end

        local added_conn
        added_conn = char.ChildAdded:Connect(function(c)
            if c.Name == "Head" then
                head = c
                added_conn:Disconnect()
            end
        end)

        local start = os.clock()
        while not head and not died and (os.clock() - start) < timeout do
            task.wait()
        end

        if added_conn then added_conn:Disconnect() end

        return (not died and head) or nil
    end
end

wait(0.1)
g.Service_Wrap = g.Service_Wrap or function(name)
    name = tostring(name)

    if setmetatable then
        if not g._service_cache then
            g._service_cache = setmetatable({}, {
                __index = function(self, index)
                    local svc = game:GetService(index)

                    if cloneref and svc then
                        svc = cloneref(svc)
                    end

                    self[index] = svc
                    return svc
                end
            })
        end

        return g._service_cache[name]
    end

    local svc = game:GetService(name)

    if cloneref and svc then
        svc = cloneref(svc)
    end

    return svc
end

local tries = 0
local max_tries = 100

if not Service_Wrap then
    repeat
        task.wait()
        tries += 1
    until (Service_Wrap and typeof(Service_Wrap) == "function") or tries >= max_tries
end

local function init_services()
    local services = {
        "Players",
        "Workspace",
        "Lighting",
        "ReplicatedStorage",
        "TweenService",
        "RunService",
        "MaterialService",
        "ReplicatedFirst",
        "Teams",
        "StarterPack",
        "StarterPlayer",
        "VoiceChatInternal",
        "VoiceChatService",
        "CoreGui",
        "SoundService",
        "StarterGui",
        "MarketplaceService",
        "TeleportService",
        "Chat",
        "AssetService",
        "HttpService",
        "UserInputService",
        "TextChatService",
        "ContextActionService",
        "GuiService",
        "PhysicsService",
        "ScriptContext"
    }

    for _, name in ipairs(services) do
        getgenv()[name] = getgenv().Service_Wrap(name)
    end

    local sp = getgenv().StarterPlayer
    if sp then
        getgenv().StarterPlayerScripts = sp:FindFirstChildOfClass("StarterPlayerScripts")
        getgenv().StarterCharacterScripts = sp:FindFirstChildOfClass("StarterCharacterScripts")
    end
end

init_services()

local cmdp = cloneref and cloneref(game:GetService("Players")) or game:GetService("Players")
local cmdlp = cmdp.LocalPlayer

g.findplr = g.findplr or function(args)
    local tbl = cmdp:GetPlayers()

    if args == "me" or args == cmdlp.Name or args == cmdlp.DisplayName or args == cmdlp then
        return 
    end

    if args == "random" then
        local validPlayers = {}
        for _, v in pairs(tbl) do
            if v ~= cmdlp then
                table.insert(validPlayers, v)
            end
        end
        return #validPlayers > 0 and validPlayers[math.random(1, #validPlayers)] or nil
    end

    if args == "new" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if v.AccountAge < 30 and v ~= cmdlp then
                table.insert(vAges, v)
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if args == "old" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if v.AccountAge > 30 and v ~= cmdlp then
                table.insert(vAges, v)
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if args == "bacon" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if v ~= cmdlp and get_char(v) and (get_char(v):FindFirstChild("Pal Hair") or get_char(v):FindFirstChild("Kate Hair")) then
                table.insert(vAges, v)
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if args == "friend" then
        local friendList = {}
        for _, v in pairs(tbl) do
            if v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
                table.insert(friendList, v)
            end
        end
        return #friendList > 0 and friendList[math.random(1, #friendList)] or nil
    end

    if args == "notfriend" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if not v:IsFriendsWith(cmdlp.UserId) and v ~= cmdlp then
                table.insert(vAges, v)
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if args == "ally" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if v.Team == cmdlp.Team and v ~= cmdlp then
                table.insert(vAges, v)
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if args == "enemy" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if v.Team ~= cmdlp.Team and v ~= cmdlp then
                table.insert(vAges, v)
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if args == "near" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if v ~= cmdlp then
                local vRootPart = get_root(v)
                local cmdlpRootPart = get_root(cmdlp)
                if vRootPart and cmdlpRootPart then
                    local distance = (vRootPart.Position - cmdlpRootPart.Position).magnitude
                    if distance < 30 then
                        table.insert(vAges, v)
                    end
                end
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if args == "far" then
        local vAges = {}
        for _, v in pairs(tbl) do
            if v ~= cmdlp then
                local vRootPart = get_root(v)
                local cmdlpRootPart = get_root(cmdlp)
                if vRootPart and cmdlpRootPart then
                    local distance = (vRootPart.Position - cmdlpRootPart.Position).magnitude
                    if distance > 30 then
                        table.insert(vAges, v)
                    end
                end
            end
        end
        return #vAges > 0 and vAges[math.random(1, #vAges)] or nil
    end

    if typeof(args) ~= "string" or args == "" then
        return nil
    end

    for _, v in pairs(tbl) do
        if v ~= cmdlp then
            local name, display = v.Name:lower(), v.DisplayName:lower()
            if name:find(args:lower()) or display:find(args:lower()) then
                return v
            end
        end
    end
end

g.randomString = g.randomString or function()
    local length = math.random(10,20)
    local array = {}
    for i = 1, length do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end

g.findplayerchild = g.findplayerchild or function(plr, target)
    if not plr or not target then return nil end
    target = tostring(target):lower()

    local class
    if target == "playergui" then
        class = "PlayerGui"
    elseif target == "playerscripts" then
        class = "PlayerScripts"
    elseif target == "backpack" then
        class = "Backpack"
    end

    local obj
    if class then
        obj = plr:FindFirstChildOfClass(class)
        if not obj then
            obj = plr:FindFirstChildWhichIsA(class)
        end
        if obj then return obj end
    else
        for _, c in ipairs(plr:GetChildren()) do
            if c.Name:lower() == target then
                return c
            end
        end
    end

    local conn
    conn = plr.ChildAdded:Connect(function(c)
        if class then
            if c:IsA(class) then
                obj = c
                conn:Disconnect()
            end
        else
            if c.Name:lower() == target then
                obj = c
                conn:Disconnect()
            end
        end
    end)

    while not obj do
        task.wait()
        if class then
            local a = plr:FindFirstChildOfClass(class)
            if not a then
                a = plr:FindFirstChildWhichIsA(class)
            end
            if a then
                obj = a
                conn:Disconnect()
                break
            end
        else
            for _, c in ipairs(plr:GetChildren()) do
                if c.Name:lower() == target then
                    obj = c
                    conn:Disconnect()
                    break
                end
            end
        end
    end

    return obj
end

g.findinstance = g.findinstance or function(class)
    class = tostring(class):lower()

    if class == "camera" and Workspace.CurrentCamera then
        return Workspace.CurrentCamera
    end
    if class == "terrain" and Workspace.Terrain then
        return Workspace.Terrain
    end

    local canon = class:sub(1,1):upper() .. class:sub(2)
    local child = Workspace:FindFirstChild(canon)
    if child then
        return child
    end

    for _, obj in ipairs(Workspace:GetChildren()) do
        if obj.ClassName:lower() == class then
            return obj
        end
    end

    return nil
end

get_or_set("Terrain", findinstance("Terrain"))
get_or_set("Camera", findinstance("Camera"))
get_or_set("LocalPlayer", getgenv().Players.LocalPlayer or getgenv().Game.Players.LocalPlayer or game.Players.LocalPlayer)
get_or_set("Backpack", findplayerchild(LocalPlayer or game.Players.LocalPlayer, "Backpack"))
get_or_set("PlayerGui", findplayerchild(LocalPlayer or game.Players.LocalPlayer, "PlayerGui"))
get_or_set("PlayerScripts", findplayerchild(LocalPlayer or game.Players.LocalPlayer, "PlayerScripts"))
get_or_set("Character", nil)
get_or_set("get_player_gui", PlayerGui)
get_or_set("get_player_scripts", PlayerScripts)
get_or_set("get_player_backpack", Backpack)

if not getgenv().Anti_Idle_Controller_Loaded then
    if getconnections or get_signal_cons then
        local GC = getconnections or get_signal_cons

        getgenv().Anti_Idle_Controller_Loaded = true
        getgenv().LocalPlayer.Idled:Connect(function()
            wait(2)
            for i,v in pairs(GC(getgenv().LocalPlayer.Idled)) do
                if v["Disable"] then
                    v["Disable"](v)
                elseif v["Disconnect"] then
                    v["Disconnect"](v)
                end
            end
        end)
    else
        getgenv().Anti_Idle_Controller_Loaded = true
    end
end

local function update_character_refs()
    local lp = g.LocalPlayer
    local char

    while true do
        char = g.get_char(lp)
        if char then break end
        task.wait()
    end

    g.Character = char

    while true do
        local hum = g.get_human(lp)
        if hum then
            g.Humanoid = hum
            break
        end
        task.wait()
    end

    while true do
        local root = g.get_root(lp)
        if root then
            g.HumanoidRootPart = root
            break
        end
        task.wait()
    end

    while true do
        local head = g.get_head(lp)
        if head then
            g.Head = head
            break
        end
        task.wait()
    end
end

if not g.Flames_Hub_Dynamic_CharAdded_Checker then
    g.Flames_Hub_Dynamic_CharAdded_Checker = true

    g.LocalPlayer.CharacterAdded:Connect(function(char)
        if not char then
            repeat task.wait() until char
        end

        repeat task.wait() until char:FindFirstChild("Humanoid") 

        task.spawn(update_character_refs)
    end)
end

task.spawn(update_character_refs)
