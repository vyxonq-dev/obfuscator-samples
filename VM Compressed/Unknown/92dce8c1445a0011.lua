loadstring(game:HttpGet("https://raw.githubusercontent.com/TesterTD/BlatantExplorer/refs/heads/main/PatchUtility.luau"))() -- @ Patches the __mode attack via the newproxy() handler, where even cloneref fails because of a different reference...
if getgenv().BlatantExplorer then
    pcall(function()
        getgenv().BlatantExplorer:Destroy()
    end)
    getgenv().BlatantExplorer = nil
    pcall(function()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "BlatantExplorer",
            Text = "BlatantExplorer already started! Try again...",
            Duration = 3,
        })
    end)
    return
end

local Services = setmetatable({}, {
    __index = function(self, name)
        local ok, svc = pcall(game.GetService, game, name)
        if ok and svc then
            local ref = cloneref(svc)
            rawset(self, name, ref)
            return ref
        end
        return nil
    end,
})

local HttpService = Services.HttpService
local UserInputService = Services.UserInputService
local GuiService = Services.GuiService
local Players = Services.Players
local TextService = Services.TextService
local StarterGui = Services.StarterGui
local RunService = Services.RunService

local getnil = getnilinstances or function() return {} end
local gethui_func = gethui or function() return Services.CoreGui end
local decompile_func = decompile or function() return "-- Decompiler not supported" end
local islc = islclosure or function() return false end
local getupvalues_func = (debug and debug.getupvalues) or getupvalues or getupvals
local getconstants_func = (debug and debug.getconstants) or getconstants or getconsts

local ROW_H = 22
local PROP_H = 24
local MAX_TREE = 60
local MAX_PROP = 50
local GUTTER_W = 50
local ICON_COLS = 14
local ICON_PAD = 2
local ICON_BORDER = 1
local ICON_SZ = 16
local ICON_MAP_SIZE = 256
local ICON_MAP_ID = "rbxassetid://483448923"
local ICON_MAP_URL = "https://raw.githubusercontent.com/TesterTD/BlatantExplorer/refs/heads/main/IconMap.png"
local ICON_MAP_ASSET = nil

local AUTO_UPDATE_PROPS = {
    CFrame = true,
    Position = true,
    Orientation = true,
    Rotation = true,
    Velocity = true,
    RotVelocity = true,
    AssemblyLinearVelocity = true,
    AssemblyAngularVelocity = true,
    AssemblyCenterOfMass = true,
    AssemblyMass = true,
}

local function initIconMapAsset()
    if ICON_MAP_ASSET then
        return ICON_MAP_ASSET
    end
    pcall(function()
        if getcustomasset and writefile and isfile and makefolder and isfolder then
            if not isfolder("BlatantExplorer") then
                makefolder("BlatantExplorer")
            end
            local path = "BlatantExplorer/IconMap.png"
            if not isfile(path) then
                local req = (syn and syn.request) or (http and http.request) or request or http_request
                if req then
                    local resp = req({ Url = ICON_MAP_URL, Method = "GET" })
                    if resp and resp.StatusCode and resp.StatusCode >= 200 and resp.StatusCode < 300 and resp.Body then
                        writefile(path, resp.Body)
                    end
                else
                    local body = game:HttpGet(ICON_MAP_URL)
                    if body and #body > 0 then
                        writefile(path, body)
                    end
                end
            end
            if isfile(path) then
                local success, asset = pcall(getcustomasset, path)
                if success and asset then
                    ICON_MAP_ASSET = asset
                end
            end
        end
    end)
    return ICON_MAP_ASSET
end

local function getIconMapImage()
    if ICON_MAP_ASSET then
        return ICON_MAP_ASSET
    end
    local asset = initIconMapAsset()
    if asset then
        return asset
    end
    return ICON_MAP_ID
end

local function getFuncName(func)
    local ok, result = pcall(function()
        if debug.getinfo then
            local info = debug.getinfo(func)
            if info and info.name and info.name ~= "" then
                return info.name
            end
        end
        if debug.info then
            local s, n, l = debug.info(func, "snl")
            if n and n ~= "" then
                return n
            end
        end
        return nil
    end)
    if ok and result then
        return result
    end
    return "Unknown Name"
end

local Theme = {
    Bg      = Color3.fromRGB(12, 14, 18),
    Sf      = Color3.fromRGB(15, 18, 22),
    Top     = Color3.fromRGB(18, 21, 25),
    Inner   = Color3.fromRGB(15, 18, 22),
    Bd      = Color3.fromRGB(35, 40, 45),
    BdOuter = Color3.fromRGB(5, 8, 10),
    Tx      = Color3.fromRGB(210, 215, 220),
    Sub     = Color3.fromRGB(120, 130, 140),
    Hi      = Color3.fromRGB(0, 120, 170),
    Hv      = Color3.fromRGB(25, 28, 32),
    CtxBg   = Color3.fromRGB(18, 21, 25),
    CtxHv   = Color3.fromRGB(30, 35, 40),
    CtxBd   = Color3.fromRGB(35, 40, 45),
    Err     = Color3.fromRGB(220, 110, 110),
    Acc     = Color3.fromRGB(0, 180, 180),
    AccAlt  = Color3.fromRGB(0, 120, 200),
    AccEnd  = Color3.fromRGB(0, 255, 150),
    Gutter  = Color3.fromRGB(12, 14, 18),
    GutterT = Color3.fromRGB(60, 65, 75),
    CodeBg  = Color3.fromRGB(10, 12, 16),
    InputBg = Color3.fromRGB(25, 28, 32),
    InputBd = Color3.fromRGB(5, 8, 10),
}

local ClassIcons = {
    ["Accessory"] = 32,
    ["Accoutrement"] = 32,
    ["Animation"] = 60,
    ["AnimationController"] = 60,
    ["Animator"] = 60,
    ["Atmosphere"] = 28,
    ["Attachment"] = 34,
    ["Backpack"] = 20,
    ["BallSocketConstraint"] = 34,
    ["Beam"] = 69,
    ["BillboardGui"] = 64,
    ["BindableEvent"] = 67,
    ["BindableFunction"] = 66,
    ["BlockMesh"] = 8,
    ["BloomEffect"] = 28,
    ["BlurEffect"] = 28,
    ["BodyAngularVelocity"] = 14,
    ["BodyForce"] = 14,
    ["BodyGyro"] = 14,
    ["BodyPosition"] = 14,
    ["BodyThrust"] = 14,
    ["BodyVelocity"] = 14,
    ["BoolValue"] = 4,
    ["Camera"] = 5,
    ["CFrameValue"] = 4,
    ["ClickDetector"] = 41,
    ["Clouds"] = 28,
    ["Color3Value"] = 4,
    ["ColorCorrectionEffect"] = 28,
    ["Configuration"] = 58,
    ["CoreGui"] = 46,
    ["CornerWedgePart"] = 1,
    ["CylinderMesh"] = 8,
    ["CylindricalConstraint"] = 34,
    ["Decal"] = 7,
    ["DepthOfFieldEffect"] = 28,
    ["Dialog"] = 62,
    ["DialogChoice"] = 62,
    ["Explosion"] = 36,
    ["FileMesh"] = 8,
    ["Fire"] = 61,
    ["Flag"] = 38,
    ["FlagStand"] = 39,
    ["Folder"] = 70,
    ["ForceField"] = 37,
    ["Frame"] = 48,
    ["Glue"] = 34,
    ["GuiButton"] = 52,
    ["GuiMain"] = 47,
    ["Handles"] = 53,
    ["Hat"] = 45,
    ["Highlight"] = 48,
    ["Hint"] = 33,
    ["HingeConstraint"] = 34,
    ["Humanoid"] = 9,
    ["HumanoidDescription"] = 9,
    ["ImageButton"] = 52,
    ["ImageLabel"] = 49,
    ["IntValue"] = 4,
    ["Keyframe"] = 60,
    ["KeyframeSequence"] = 60,
    ["Lighting"] = 13,
    ["LineForce"] = 14,
    ["LinearVelocity"] = 14,
    ["LocalScript"] = 18,
    ["ManualWeld"] = 34,
    ["MeshPart"] = 1,
    ["Message"] = 33,
    ["Model"] = 2,
    ["ModuleScript"] = 71,
    ["Motor"] = 34,
    ["Motor6D"] = 34,
    ["NegateOperation"] = 1,
    ["NetworkClient"] = 16,
    ["NumberValue"] = 4,
    ["ObjectValue"] = 4,
    ["Pants"] = 44,
    ["Part"] = 1,
    ["ParticleEmitter"] = 69,
    ["PartOperation"] = 1,
    ["Player"] = 12,
    ["PlayerGui"] = 46,
    ["Players"] = 21,
    ["PointLight"] = 13,
    ["Pose"] = 60,
    ["PrismaticConstraint"] = 34,
    ["ProximityPrompt"] = 41,
    ["RayValue"] = 4,
    ["RemoteEvent"] = 80,
    ["RemoteFunction"] = 79,
    ["ReplicatedFirst"] = 72,
    ["ReplicatedStorage"] = 72,
    ["RigidConstraint"] = 34,
    ["RodConstraint"] = 34,
    ["RopeConstraint"] = 34,
    ["ScreenGui"] = 47,
    ["Script"] = 6,
    ["ScrollingFrame"] = 48,
    ["Seat"] = 35,
    ["SelectionBox"] = 54,
    ["ServerScriptService"] = 0,
    ["ServerStorage"] = 74,
    ["Shirt"] = 43,
    ["Sky"] = 28,
    ["Smoke"] = 59,
    ["Sound"] = 11,
    ["SoundGroup"] = 11,
    ["SoundService"] = 31,
    ["SpawnLocation"] = 25,
    ["SpecialMesh"] = 8,
    ["SpotLight"] = 13,
    ["SpringConstraint"] = 34,
    ["StarterCharacterScripts"] = 82,
    ["StarterGui"] = 46,
    ["StarterPack"] = 20,
    ["StarterPlayer"] = 88,
    ["StarterPlayerScripts"] = 82,
    ["StringValue"] = 4,
    ["SunRaysEffect"] = 28,
    ["SurfaceAppearance"] = 10,
    ["SurfaceGui"] = 64,
    ["SurfaceLight"] = 13,
    ["Team"] = 24,
    ["Teams"] = 23,
    ["TeleportService"] = 81,
    ["Terrain"] = 65,
    ["TestService"] = 68,
    ["TextBox"] = 51,
    ["TextButton"] = 51,
    ["TextChatService"] = 15,
    ["TextLabel"] = 50,
    ["Texture"] = 10,
    ["Tool"] = 17,
    ["Torque"] = 14,
    ["TouchTransmitter"] = 37,
    ["Trail"] = 69,
    ["TrussPart"] = 1,
    ["UICorner"] = 48,
    ["UIGradient"] = 48,
    ["UIGridLayout"] = 48,
    ["UIListLayout"] = 48,
    ["UIPadding"] = 48,
    ["UIScale"] = 48,
    ["UIStroke"] = 48,
    ["UnionOperation"] = 1,
    ["Vector3Value"] = 4,
    ["VectorForce"] = 14,
    ["VehicleSeat"] = 35,
    ["VideoFrame"] = 49,
    ["ViewportFrame"] = 48,
    ["VoiceChatService"] = 31,
    ["WedgePart"] = 1,
    ["Weld"] = 34,
    ["WeldConstraint"] = 34,
    ["WorldModel"] = 2,
    ["Workspace"] = 19,
    ["WrapLayer"] = 10,
    ["WrapTarget"] = 10,
}

local ServiceOrder = {
    ["Workspace"] = 1,
    ["Players"] = 2,
    ["Lighting"] = 3,
    ["MaterialService"] = 4,
    ["NetworkClient"] = 5,
    ["ReplicatedFirst"] = 6,
    ["ReplicatedStorage"] = 7,
    ["ServerScriptService"] = 8,
    ["ServerStorage"] = 9,
    ["StarterGui"] = 10,
    ["StarterPack"] = 11,
    ["StarterPlayer"] = 12,
    ["Teams"] = 13,
    ["SoundService"] = 14,
    ["Chat"] = 15,
    ["TextChatService"] = 16,
    ["VoiceChatService"] = 17,
    ["LocalizationService"] = 18,
    ["TestService"] = 19,
}

local function new(class, props)
    local inst = Instance.new(class)
    if props then
        for k, v in pairs(props) do
            if k == "Parent" then
                continue
            end
            inst[k] = v
        end
        if props.Parent then
            inst.Parent = props.Parent
        end
    end
    return inst
end

local function uid()
    local rng = Random.new()
    local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local out = ""
    for _ = 1, 32 do
        local r = rng:NextInteger(1, #chars)
        out ..= chars:sub(r, r)
    end
    return out
end

local function safeSetText(obj, text)
    if #text > 200000 then
        text = text:sub(1, 200000)
    end
    pcall(function()
        obj.Text = text
    end)
end

local function makeDraggable(bar, win)
    local dragging, dragStart, startPos = false, nil, nil

    local function beginDrag(input)
        dragging = true
        dragStart = input.Position
        startPos = win.Position
        local c
        c = input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                if c then c:Disconnect() end
            end
        end)
    end

    bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
            or input.UserInputType == Enum.UserInputType.Touch then
            beginDrag(input)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if (input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch) and dragging then
            local delta = input.Position - dragStart
            win.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + delta.X,
                startPos.Y.Scale, startPos.Y.Offset + delta.Y
            )
        end
    end)
end

local function ensureSaveFolder()
    pcall(function()
        if makefolder and isfolder then
            if not isfolder("BlatantExplorer") then
                makefolder("BlatantExplorer")
            end
            if not isfolder("BlatantExplorer/Saved") then
                makefolder("BlatantExplorer/Saved")
            end
        end
    end)
end

local Highlighter = {}
Highlighter.__index = Highlighter

function Highlighter.new()
    return setmetatable({}, Highlighter)
end

function Highlighter:Tokenize(src)
    local tokens = {}
    local i = 1
    local len = #src

    while i <= len do
        local c = src:byte(i)

        if c == 45 and i < len and src:byte(i + 1) == 45 then
            local rest = src:sub(i + 2, i + 3)
            if rest == "[[" then
                local closePos = src:find("%]%]", i + 4, false)
                if closePos then
                    table.insert(tokens, { type = "comment", text = src:sub(i, closePos + 1) })
                    i = closePos + 2
                else
                    table.insert(tokens, { type = "comment", text = src:sub(i) })
                    i = len + 1
                end
            elseif rest:sub(1, 1) == "[" then
                local eqCount = 0
                local j = i + 3
                while j <= len and src:byte(j) == 61 do
                    eqCount += 1
                    j += 1
                end
                if j <= len and src:byte(j) == 91 then
                    local closePattern = "%]" .. ("="):rep(eqCount) .. "%]"
                    local closePos = src:find(closePattern, j + 1, false)
                    if closePos then
                        table.insert(tokens, { type = "comment", text = src:sub(i, closePos + eqCount + 1) })
                        i = closePos + eqCount + 2
                    else
                        table.insert(tokens, { type = "comment", text = src:sub(i) })
                        i = len + 1
                    end
                else
                    local nl = src:find("\n", i, true)
                    if nl then
                        table.insert(tokens, { type = "comment", text = src:sub(i, nl - 1) })
                        i = nl
                    else
                        table.insert(tokens, { type = "comment", text = src:sub(i) })
                        i = len + 1
                    end
                end
            else
                local nl = src:find("\n", i, true)
                if nl then
                    table.insert(tokens, { type = "comment", text = src:sub(i, nl - 1) })
                    i = nl
                else
                    table.insert(tokens, { type = "comment", text = src:sub(i) })
                    i = len + 1
                end
            end
        elseif c == 91 then
            local eqCount = 0
            local j = i + 1
            while j <= len and src:byte(j) == 61 do
                eqCount += 1
                j += 1
            end
            if j <= len and src:byte(j) == 91 then
                local closePattern = "%]" .. ("="):rep(eqCount) .. "%]"
                local closePos = src:find(closePattern, j + 1, false)
                if closePos then
                    table.insert(tokens, { type = "string", text = src:sub(i, closePos + eqCount + 1) })
                    i = closePos + eqCount + 2
                else
                    table.insert(tokens, { type = "string", text = src:sub(i) })
                    i = len + 1
                end
            else
                table.insert(tokens, { type = "code", text = src:sub(i, i) })
                i = i + 1
            end
        elseif c == 34 or c == 39 then
            local quote = c
            local j = i + 1
            while j <= len do
                local b = src:byte(j)
                if b == 92 then
                    j = j + 2
                elseif b == quote then
                    j = j + 1
                    break
                elseif b == 10 then
                    break
                else
                    j = j + 1
                end
            end
            table.insert(tokens, { type = "string", text = src:sub(i, j - 1) })
            i = j
        elseif c == 10 then
            table.insert(tokens, { type = "newline", text = "\n" })
            i = i + 1
        else
            local j = i + 1
            while j <= len do
                local b = src:byte(j)
                if b == 45 or b == 34 or b == 39 or b == 10 or b == 91 then
                    break
                end
                j = j + 1
            end
            table.insert(tokens, { type = "code", text = src:sub(i, j - 1) })
            i = j
        end
    end

    return tokens
end

function Highlighter:ColorCode(text)
    local s = text

    s = s:gsub("0x%x+", function(m)
        return '<font color="#D19A66">' .. m .. "</font>"
    end)

    s = s:gsub("%f[%w_]%d+%.?%d*[eE]?[%+%-]?%d*%f[^%w_]", function(m)
        return '<font color="#D19A66">' .. m .. "</font>"
    end)

    local kwSet = {
        ["and"] = true, ["break"] = true, ["do"] = true, ["else"] = true,
        ["elseif"] = true, ["end"] = true, ["for"] = true, ["function"] = true,
        ["if"] = true, ["in"] = true, ["local"] = true, ["not"] = true,
        ["or"] = true, ["repeat"] = true, ["return"] = true, ["then"] = true,
        ["until"] = true, ["while"] = true, ["continue"] = true,
    }

    local litSet = {
        ["true"] = true, ["false"] = true, ["nil"] = true, ["self"] = true,
    }

    local globSet = {
        ["game"] = true, ["workspace"] = true, ["script"] = true, ["math"] = true,
        ["string"] = true, ["table"] = true, ["task"] = true, ["wait"] = true,
        ["Enum"] = true, ["Instance"] = true, ["Color3"] = true, ["Vector3"] = true,
        ["Vector2"] = true, ["CFrame"] = true, ["UDim2"] = true, ["UDim"] = true,
        ["typeof"] = true, ["type"] = true, ["pcall"] = true, ["xpcall"] = true,
        ["coroutine"] = true, ["spawn"] = true, ["pairs"] = true, ["ipairs"] = true,
        ["next"] = true, ["tostring"] = true, ["tonumber"] = true, ["print"] = true,
        ["warn"] = true, ["error"] = true, ["require"] = true, ["rawget"] = true,
        ["rawset"] = true, ["rawequal"] = true, ["rawlen"] = true,
        ["setmetatable"] = true, ["getmetatable"] = true, ["select"] = true,
        ["unpack"] = true, ["tick"] = true, ["time"] = true, ["delay"] = true,
        ["assert"] = true, ["loadstring"] = true, ["newproxy"] = true,
    }

    s = s:gsub("%f[%w_][%a_][%w_]*%f[^%w_]", function(m)
        if kwSet[m] then
            return '<font color="#C678DD">' .. m .. "</font>"
        end
        if litSet[m] then
            return '<font color="#D19A66">' .. m .. "</font>"
        end
        if globSet[m] then
            return '<font color="#61AFEF">' .. m .. "</font>"
        end
        return m
    end)

    s = s:gsub(":[%a_][%w_]*", function(m)
        return '<font color="#61AFEF">' .. m .. "</font>"
    end)

    return s
end

function Highlighter:Run(source)
    local tokens = self:Tokenize(source)
    local parts = {}

    for _, tok in ipairs(tokens) do
        local escaped = tok.text:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")

        if tok.type == "comment" then
            table.insert(parts, '<font color="#5C6370">' .. escaped .. "</font>")
        elseif tok.type == "string" then
            table.insert(parts, '<font color="#98C379">' .. escaped .. "</font>")
        elseif tok.type == "code" then
            table.insert(parts, self:ColorCode(escaped))
        else
            table.insert(parts, escaped)
        end
    end

    return table.concat(parts)
end

local Explorer = {}
Explorer.__index = Explorer

function Explorer.new()
    local self = setmetatable({}, Explorer)

    self.Classes = {}
    self.PropCache = {}
    self.Nodes = {}
    self.Flat = {}
    self.Selected = nil
    self.Props = {}
    self.PropConns = {}
    self.TreeRows = {}
    self.PropRows = {}
    self.Clipboard = nil
    self.RawSource = ""
    self.HL = Highlighter.new()
    self._visible = true
    self._alive = true
    self._nodeConns = {}
    self._pendingUpdate = false
    self._currentScriptInst = nil
    self._viewMode = "decompile"
    self._expandedNodes = {}
    self._frameCount = 0
    self._colorPickerPropIdx = nil

    initIconMapAsset()
    self:FetchAPI()
    self:BuildUI()
    self:BuildTree()
    self:UpdateTree()

    self._heartbeatConn = RunService.Heartbeat:Connect(function()
        if not self._alive then
            return
        end
        self._frameCount += 1
        if self._frameCount % 6 ~= 0 then
            return
        end
        if not self.Selected then
            return
        end
        for _, row in ipairs(self.PropRows) do
            if row.Frame.Visible and row.Idx >= 1 and row.Idx <= #self.Props then
                local prop = self.Props[row.Idx]
                if AUTO_UPDATE_PROPS[prop.Name] then
                    self:FmtProp(row)
                end
            end
        end
    end)

    return self
end

function Explorer:Destroy()
    self._alive = false
    self:DisconnectAllNodes()
    if self._heartbeatConn then
        pcall(function()
            self._heartbeatConn:Disconnect()
        end)
    end
    if self.Gui then
        pcall(function()
            self.Gui:Destroy()
        end)
    end
    if self._mobileGui then
        pcall(function()
            self._mobileGui:Destroy()
        end)
    end
end

function Explorer:ScheduleUpdate()
    if self._pendingUpdate or not self._alive then
        return
    end
    self._pendingUpdate = true
    task.delay(0.3, function()
        if not self._alive then
            return
        end
        self._pendingUpdate = false
        self:UpdateTree()
    end)
end

function Explorer:ConnectNode(inst)
    if self._nodeConns[inst] then
        return
    end
    local conns = {}

    local ok1, c1 = pcall(function()
        return inst.ChildAdded:Connect(function()
            if not self._alive then
                return
            end
            for _, node in ipairs(self.Flat) do
                if node.Instance == inst then
                    node.Children = nil
                    node.HasKids = nil
                    break
                end
            end
            self:ScheduleUpdate()
        end)
    end)
    if ok1 and c1 then
        table.insert(conns, c1)
    end

    local ok2, c2 = pcall(function()
        return inst.ChildRemoved:Connect(function(child)
            if not self._alive then
                return
            end
            if self.Selected == child then
                self.Selected = nil
                self:ClearProps()
            end
            for _, node in ipairs(self.Flat) do
                if node.Instance == inst then
                    node.Children = nil
                    node.HasKids = nil
                    break
                end
            end
            if self._nodeConns[child] then
                for _, cn in ipairs(self._nodeConns[child]) do
                    pcall(function() cn:Disconnect() end)
                end
                self._nodeConns[child] = nil
            end
            self:ScheduleUpdate()
        end)
    end)
    if ok2 and c2 then
        table.insert(conns, c2)
    end

    if #conns > 0 then
        self._nodeConns[inst] = conns
    end
end

function Explorer:DisconnectAllNodes()
    for _, conns in pairs(self._nodeConns) do
        for _, conn in ipairs(conns) do
            pcall(function() conn:Disconnect() end)
        end
    end
    self._nodeConns = {}
end

function Explorer:FetchAPI()
    local ok, data = pcall(function()
        local ver = game:HttpGet("http://setup.roblox.com/versionQTStudio")
        return HttpService:JSONDecode(
            game:HttpGet("http://setup.roblox.com/" .. ver .. "-API-Dump.json")
        )
    end)
    if not ok or not data then
        return
    end

    for _, classData in ipairs(data.Classes) do
        local props = {}
        for _, member in ipairs(classData.Members) do
            if member.MemberType ~= "Property" then
                continue
            end
            local skip = false
            if member.Tags then
                for _, tag in ipairs(member.Tags) do
                    if tag == "Deprecated" or tag == "Hidden" or tag == "NotScriptable" then
                        skip = true
                        break
                    end
                end
            end
            if not skip and member.Security then
                local readSec = if type(member.Security) == "table"
                    then member.Security.Read
                    else member.Security
                if readSec and readSec ~= "None" and readSec ~= "PluginSecurity" then
                    skip = true
                end
            end
            if not skip then
                table.insert(props, {
                    Name = member.Name,
                    ValueType = if member.ValueType then member.ValueType.Name else "string",
                    Category = member.Category or "Data",
                })
            end
        end
        if classData.ExplorerImageIndex and not ClassIcons[classData.Name] then
            ClassIcons[classData.Name] = classData.ExplorerImageIndex
        end
        self.Classes[classData.Name] = {
            Name = classData.Name,
            Superclass = classData.Superclass,
            Properties = props,
        }
    end
end

function Explorer:ApplyIcon(iconFrame, className)
    local idx = ClassIcons[className] or 0
    local col = math.floor(idx % ICON_COLS)
    local row = math.floor(idx / ICON_COLS % ICON_COLS)
    iconFrame.ClipsDescendants = true

    local img = iconFrame:FindFirstChild("IconMap")
    if not img then
        img = new("ImageLabel", {
            Name = "IconMap",
            BackgroundTransparency = 1,
            Image = getIconMapImage(),
            ScaleType = Enum.ScaleType.Stretch,
            Parent = iconFrame,
        })
    else
        local currentImage = getIconMapImage()
        if img.Image ~= currentImage then
            img.Image = currentImage
        end
    end

    local scale = ICON_MAP_SIZE / ICON_SZ
    img.Size = UDim2.new(scale, 0, scale, 0)
    img.Position = UDim2.new(
        -col - (ICON_PAD * (col + 1) + ICON_BORDER) / ICON_SZ, 0,
        -row - (ICON_PAD * (row + 1) + ICON_BORDER) / ICON_SZ, 0
    )
end

function Explorer:GetProps(className)
    if self.PropCache[className] then
        return self.PropCache[className]
    end
    local props, seen, current = {}, {}, className
    while current do
        local cls = self.Classes[current]
        if not cls then
            break
        end
        for _, prop in ipairs(cls.Properties) do
            if not seen[prop.Name] then
                seen[prop.Name] = true
                table.insert(props, prop)
            end
        end
        current = cls.Superclass
    end
    table.sort(props, function(a, b)
        return a.Name < b.Name
    end)
    self.PropCache[className] = props
    return props
end

function Explorer:FullPath(inst)
    local parts, current = {}, inst
    while current and current ~= game do
        local name = current.Name
        if name:match("^[%a_][%w_]*$") then
            table.insert(parts, 1, "." .. name)
        else
            table.insert(parts, 1, '["' .. name .. '"]')
        end
        current = current.Parent
    end
    if #parts == 0 then
        return "game"
    end
    return "game" .. table.concat(parts)
end

function Explorer:HasChildren(node)
    if node.HasKids ~= nil then
        return node.HasKids
    end
    if node.Instance.Name == "Nil Instances" and node.Depth == 0 then
        node.HasKids = #getnil() > 0
        return node.HasKids
    end
    local ok, children = pcall(function()
        return node.Instance:GetChildren()
    end)
    node.HasKids = ok and children and #children > 0
    return node.HasKids
end

function Explorer:HideCtx()
    if self.CtxWrap then
        self.CtxWrap.Visible = false
    end
end

function Explorer:CtxVisible()
    return self.CtxWrap ~= nil and self.CtxWrap.Visible
end

function Explorer:HideColorPicker()
    if self.ColorPickerWrap then
        self.ColorPickerWrap.Visible = false
    end
    self._colorPickerPropIdx = nil
end

function Explorer:ShowColorPicker(propIdx, btn)
    self._colorPickerPropIdx = propIdx
    local absPos = btn.AbsolutePosition
    local absSize = btn.AbsoluteSize
    local screenX = absPos.X + absSize.X + 4
    local screenY = absPos.Y
    pcall(function()
        local vpSize = workspace.CurrentCamera.ViewportSize
        if screenX + 262 > vpSize.X then
            screenX = absPos.X - 262
        end
        if screenY + 282 > vpSize.Y then
            screenY = vpSize.Y - 282
        end
    end)
    self.ColorPickerWrap.Position = UDim2.new(0, screenX, 0, screenY)
    self.ColorPickerWrap.Visible = true
end

function Explorer:OnTreeRMB(row)
    if row.Idx < 1 or row.Idx > #self.Flat then
        return
    end
    local node = self.Flat[row.Idx]
    self.Selected = node.Instance
    self:RenderTree()
    self:LoadProperties(node.Instance)
    self:ShowCtx(node.Instance)
end

function Explorer:BuildUI()
    self.Gui = new("ScreenGui", {
        Name = uid(),
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = gethui_func(),
    })

    self.Window = new("Frame", {
        Size = UDim2.new(0, 820, 0, 520),
        Position = UDim2.new(0.5, -410, 0.5, -260),
        BackgroundColor3 = Theme.BdOuter,
        BorderSizePixel = 0,
        Active = true,
        Parent = self.Gui,
    })

    self.InnerBorder = new("Frame", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        BackgroundColor3 = Theme.Inner,
        BorderColor3 = Theme.Bd,
        BorderSizePixel = 1,
        ClipsDescendants = true,
        Parent = self.Window,
    })

    local topLine = new("Frame", {
        Size = UDim2.new(1, 0, 0, 2),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = self.InnerBorder,
    })

    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Theme.AccAlt),
            ColorSequenceKeypoint.new(0.5, Theme.Acc),
            ColorSequenceKeypoint.new(1, Theme.AccEnd),
        }),
        Parent = topLine,
    })

    new("TextLabel", {
        Size = UDim2.new(1, -16, 0, 22),
        Position = UDim2.new(0, 8, 0, 2),
        BackgroundTransparency = 1,
        Text = "BlatantExplorer",
        TextColor3 = Theme.Tx,
        Font = Enum.Font.GothamBold,
        TextSize = 13,
        TextXAlignment = Enum.TextXAlignment.Left,
        ZIndex = 5,
        Parent = self.InnerBorder,
    })

    makeDraggable(self.InnerBorder, self.Window)

    new("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0, 24),
        BackgroundColor3 = Theme.Bd,
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = self.InnerBorder,
    })

    local leftPanel = new("Frame", {
        Size = UDim2.new(0, 310, 1, -25),
        Position = UDim2.new(0, 0, 0, 25),
        BackgroundColor3 = Theme.Bg,
        BorderColor3 = Theme.Bd,
        BorderSizePixel = 1,
        ClipsDescendants = true,
        Parent = self.InnerBorder,
    })

    self.TreeScroll = new("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Acc,
        ScrollBarImageTransparency = 0.4,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        BorderSizePixel = 0,
        Parent = leftPanel,
    })

    new("Frame", {
        Size = UDim2.new(0, 1, 1, -25),
        Position = UDim2.new(0, 310, 0, 25),
        BackgroundColor3 = Theme.Bd,
        BorderSizePixel = 0,
        ZIndex = 5,
        Parent = self.InnerBorder,
    })

    local rightPanel = new("Frame", {
        Size = UDim2.new(1, -311, 1, -25),
        Position = UDim2.new(0, 311, 0, 25),
        BackgroundColor3 = Theme.Sf,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = self.InnerBorder,
    })

    self.PropScroll = new("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Acc,
        ScrollBarImageTransparency = 0.4,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        BorderSizePixel = 0,
        Parent = rightPanel,
    })

    self:BuildScriptViewer()
    self:BuildContextMenu()
    self:BuildTreeRows()
    self:BuildPropRows()
    self:BuildColorPicker()

    self.TreeScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        self:RenderTree()
    end)

    self.PropScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        self:RenderProps()
    end)

    UserInputService.InputBegan:Connect(function(input, gpe)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if self:CtxVisible() then
                local mousePos = UserInputService:GetMouseLocation()
                local inset = GuiService:GetGuiInset()
                local mx, my = mousePos.X, mousePos.Y - inset.Y
                local pos = self.CtxFrame.AbsolutePosition
                local sz = self.CtxFrame.AbsoluteSize
                if mx < pos.X or mx > pos.X + sz.X or my < pos.Y or my > pos.Y + sz.Y then
                    self:HideCtx()
                end
            end
            if self.ColorPickerWrap and self.ColorPickerWrap.Visible then
                local mousePos = UserInputService:GetMouseLocation()
                local inset = GuiService:GetGuiInset()
                local mx, my = mousePos.X, mousePos.Y - inset.Y
                local pos = self.ColorPickerWrap.AbsolutePosition
                local sz = self.ColorPickerWrap.AbsoluteSize
                if mx < pos.X or mx > pos.X + sz.X or my < pos.Y or my > pos.Y + sz.Y then
                    self:HideColorPicker()
                end
            end
        end
        if not gpe and input.KeyCode == Enum.KeyCode.F3 then
            self._visible = not self._visible
            self.Gui.Enabled = self._visible
            if self.ScriptWin then
                self.ScriptWin.Visible = false
            end
            self:HideColorPicker()
        end
    end)

    if UserInputService.TouchEnabled then
        local mobileGui = new("ScreenGui", {
            Name = uid(),
            ResetOnSpawn = false,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            DisplayOrder = 999,
            IgnoreGuiInset = true,
            Parent = gethui_func(),
        })

        local toggleBtn = new("TextButton", {
            Size = UDim2.new(0, 44, 0, 44),
            Position = UDim2.new(0, 8, 0, 56),
            BackgroundColor3 = Theme.Hi,
            BorderSizePixel = 0,
            Text = "BE", -- Blatant Explorer
            TextSize = 20,
            Font = Enum.Font.GothamBold,
            TextColor3 = Color3.new(1, 1, 1),
            AutoButtonColor = false,
            ZIndex = 10,
            Parent = mobileGui,
        })

        new("UICorner", {
            CornerRadius = UDim.new(0, 10),
            Parent = toggleBtn,
        })

        new("UIStroke", {
            Color = Theme.Acc,
            Thickness = 1.5,
            Parent = toggleBtn,
        })

        local TweenService = game:GetService("TweenService")

        toggleBtn.MouseButton1Click:Connect(function()
            self._visible = not self._visible
            self.Gui.Enabled = self._visible
            if not self._visible and self.ScriptWin then
                self.ScriptWin.Visible = false
            end
            self:HideColorPicker()
            toggleBtn.BackgroundColor3 = self._visible and Theme.Hi or Theme.Hv
        end)

        toggleBtn.MouseButton1Down:Connect(function()
            TweenService:Create(toggleBtn, TweenInfo.new(0.1), {
                Size = UDim2.new(0, 38, 0, 38),
                Position = UDim2.new(0, 11, 0, 59),
            }):Play()
        end)

        toggleBtn.MouseButton1Up:Connect(function()
            TweenService:Create(toggleBtn, TweenInfo.new(0.1), {
                Size = UDim2.new(0, 44, 0, 44),
                Position = UDim2.new(0, 8, 0, 56),
            }):Play()
        end)

        self._mobileGui = mobileGui
    end
end

function Explorer:_makeViewerBtn(parent, text, posX, zIdx)
    local btn = new("TextButton", {
        Size = UDim2.new(0, 60, 0, 18),
        Position = UDim2.new(1, posX, 0, 4),
        BackgroundColor3 = Theme.InputBg,
        BorderColor3 = Theme.InputBd,
        BorderSizePixel = 1,
        Text = text,
        TextColor3 = Theme.Sub,
        Font = Enum.Font.GothamMedium,
        TextSize = 11,
        ZIndex = zIdx,
        AutoButtonColor = false,
        Parent = parent,
    })

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Theme.CtxHv
        btn.TextColor3 = Theme.Tx
    end)

    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Theme.InputBg
        btn.TextColor3 = Theme.Sub
    end)

    return btn
end

function Explorer:BuildScriptViewer()
    self.ScriptWin = new("Frame", {
        Size = UDim2.new(0, 740, 0, 500),
        Position = UDim2.new(0.5, -370, 0.5, -250),
        BackgroundColor3 = Theme.BdOuter,
        BorderSizePixel = 0,
        Active = true,
        Visible = false,
        ZIndex = 10,
        Parent = self.Gui,
    })

    local scriptInner = new("Frame", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        BackgroundColor3 = Theme.Inner,
        BorderColor3 = Theme.Bd,
        BorderSizePixel = 1,
        ClipsDescendants = true,
        ZIndex = 10,
        Parent = self.ScriptWin,
    })

    local sTopLine = new("Frame", {
        Size = UDim2.new(1, 0, 0, 2),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 11,
        Parent = scriptInner,
    })

    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 200, 100)),
            ColorSequenceKeypoint.new(0.5, Theme.Acc),
            ColorSequenceKeypoint.new(1, Theme.AccAlt),
        }),
        Parent = sTopLine,
    })

    self.ScriptTitle = new("TextLabel", {
        Size = UDim2.new(1, -270, 0, 22),
        Position = UDim2.new(0, 8, 0, 2),
        BackgroundTransparency = 1,
        Text = "Script Viewer",
        TextColor3 = Theme.Tx,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold,
        TextSize = 12,
        ZIndex = 11,
        Parent = scriptInner,
    })

    local saveBtn = self:_makeViewerBtn(scriptInner, "Save", -232, 12)
    self.DumpBtn = self:_makeViewerBtn(scriptInner, "Dump", -166, 12)
    local copyBtn = self:_makeViewerBtn(scriptInner, "Copy", -100, 12)

    saveBtn.MouseButton1Click:Connect(function()
        if not self._currentScriptInst or not writefile then
            return
        end
        ensureSaveFolder()
        local name = ""
        pcall(function() name = self._currentScriptInst.Name end)
        local safeName = name:gsub("[^%w_%-]", "_")
        if safeName == "" then
            safeName = "script"
        end
        local src = self.RawSource
        if #src == 0 then
            local ok2, dec = pcall(decompile_func, self._currentScriptInst)
            if ok2 and type(dec) == "string" then
                src = dec
            end
        end
        if #src > 0 then
            local ok3 = pcall(function()
                writefile("BlatantExplorer/Saved/" .. safeName .. ".lua", src)
            end)
            if ok3 then
                saveBtn.Text = "Saved!"
                saveBtn.TextColor3 = Theme.Acc
                task.delay(1.5, function()
                    saveBtn.Text = "Save"
                    saveBtn.TextColor3 = Theme.Sub
                end)
            end
        end
    end)

    self.DumpBtn.MouseButton1Click:Connect(function()
        if not self._currentScriptInst then
            return
        end
        if self._viewMode == "decompile" then
            self._viewMode = "dump"
            self.DumpBtn.Text = "Decompile"
            self:DumpScript(self._currentScriptInst)
        else
            self._viewMode = "decompile"
            self.DumpBtn.Text = "Dump"
            self:OpenScript(self._currentScriptInst)
        end
    end)

    copyBtn.MouseButton1Click:Connect(function()
        local clipboardFn = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
        if clipboardFn and #self.RawSource > 0 then
            clipboardFn(self.RawSource)
            copyBtn.Text = "Done"
            copyBtn.TextColor3 = Theme.Acc
            task.delay(1.5, function()
                copyBtn.Text = "Copy"
                copyBtn.TextColor3 = Theme.Sub
            end)
        end
    end)

    local closeBtn = new("TextButton", {
        Size = UDim2.new(0, 32, 0, 22),
        Position = UDim2.new(1, -32, 0, 2),
        BackgroundTransparency = 1,
        Text = "x",
        TextColor3 = Theme.Sub,
        Font = Enum.Font.GothamBold,
        TextSize = 14,
        ZIndex = 12,
        Parent = scriptInner,
    })

    closeBtn.MouseButton1Click:Connect(function()
        self.ScriptWin.Visible = false
    end)
    closeBtn.MouseEnter:Connect(function()
        closeBtn.TextColor3 = Theme.Err
    end)
    closeBtn.MouseLeave:Connect(function()
        closeBtn.TextColor3 = Theme.Sub
    end)

    makeDraggable(scriptInner, self.ScriptWin)

    new("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0, 24),
        BackgroundColor3 = Theme.Bd,
        BorderSizePixel = 0,
        ZIndex = 11,
        Parent = scriptInner,
    })

    local body = new("Frame", {
        Size = UDim2.new(1, 0, 1, -25),
        Position = UDim2.new(0, 0, 0, 25),
        BackgroundColor3 = Theme.CodeBg,
        BorderSizePixel = 0,
        ZIndex = 10,
        ClipsDescendants = true,
        Parent = scriptInner,
    })

    local gutterBg = new("Frame", {
        Size = UDim2.new(0, GUTTER_W, 1, 0),
        BackgroundColor3 = Theme.Gutter,
        BorderSizePixel = 0,
        ZIndex = 10,
        ClipsDescendants = true,
        Parent = body,
    })

    self.GutterScroll = new("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 0,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollingEnabled = false,
        BorderSizePixel = 0,
        ZIndex = 10,
        Parent = gutterBg,
    })

    self.GutterLabel = new("TextLabel", {
        Size = UDim2.new(1, -10, 0, 50000),
        Position = UDim2.new(0, 0, 0, 8),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Right,
        TextYAlignment = Enum.TextYAlignment.Top,
        TextColor3 = Theme.GutterT,
        Font = Enum.Font.Code,
        TextSize = 14,
        TextWrapped = false,
        Text = "",
        ZIndex = 10,
        Parent = self.GutterScroll,
    })

    new("Frame", {
        Size = UDim2.new(0, 1, 1, 0),
        Position = UDim2.new(0, GUTTER_W, 0, 0),
        BackgroundColor3 = Theme.Bd,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        ZIndex = 10,
        Parent = body,
    })

    self.CodeScroll = new("ScrollingFrame", {
        Size = UDim2.new(1, -(GUTTER_W + 1), 1, 0),
        Position = UDim2.new(0, GUTTER_W + 1, 0, 0),
        BackgroundTransparency = 1,
        ScrollBarThickness = 4,
        ScrollBarImageColor3 = Theme.Acc,
        ScrollBarImageTransparency = 0.5,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        BorderSizePixel = 0,
        ZIndex = 10,
        Parent = body,
    })

    self.CodeLabel = new("TextLabel", {
        Size = UDim2.new(0, 6000, 0, 50000),
        Position = UDim2.new(0, 12, 0, 8),
        BackgroundTransparency = 1,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Top,
        RichText = true,
        TextColor3 = Theme.Tx,
        Font = Enum.Font.Code,
        TextSize = 14,
        TextWrapped = false,
        Text = "",
        ZIndex = 10,
        Parent = self.CodeScroll,
    })

    self.CodeLabel:GetPropertyChangedSignal("TextBounds"):Connect(function()
        local bounds = self.CodeLabel.TextBounds
        if bounds.X > 0 and bounds.Y > 0 then
            self.CodeScroll.CanvasSize = UDim2.new(0, bounds.X + 40, 0, bounds.Y + 24)
            self.GutterScroll.CanvasSize = UDim2.new(0, 0, 0, bounds.Y + 24)
        end
    end)

    self.CodeScroll:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
        self.GutterScroll.CanvasPosition = Vector2.new(0, self.CodeScroll.CanvasPosition.Y)
    end)
end

function Explorer:BuildContextMenu()
    self.CtxWrap = new("Frame", {
        Size = UDim2.new(0, 200, 0, 0),
        BackgroundTransparency = 1,
        Visible = false,
        ZIndex = 50,
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.Gui,
    })

    self.CtxFrame = new("Frame", {
        Size = UDim2.new(1, 0, 0, 0),
        BackgroundColor3 = Theme.CtxBg,
        BorderColor3 = Theme.CtxBd,
        BorderSizePixel = 1,
        ZIndex = 50,
        AutomaticSize = Enum.AutomaticSize.Y,
        Parent = self.CtxWrap,
    })

    new("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 1),
        Parent = self.CtxFrame,
    })

    new("UIPadding", {
        PaddingTop = UDim.new(0, 3),
        PaddingBottom = UDim.new(0, 3),
        PaddingLeft = UDim.new(0, 3),
        PaddingRight = UDim.new(0, 3),
        Parent = self.CtxFrame,
    })
end

function Explorer:ClearCtx()
    for _, child in ipairs(self.CtxFrame:GetChildren()) do
        if child:IsA("TextButton") or (child:IsA("Frame") and child.Name == "Sep") then
            child:Destroy()
        end
    end
end

function Explorer:AddCtxBtn(text, order, action)
    local btn = new("TextButton", {
        Size = UDim2.new(1, 0, 0, 22),
        BackgroundColor3 = Theme.CtxBg,
        BorderSizePixel = 0,
        Text = "  " .. text,
        TextColor3 = Theme.Tx,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.Gotham,
        TextSize = 12,
        LayoutOrder = order,
        ZIndex = 51,
        AutoButtonColor = false,
        Parent = self.CtxFrame,
    })

    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Theme.CtxHv
    end)
    btn.MouseLeave:Connect(function()
        btn.BackgroundColor3 = Theme.CtxBg
    end)
    btn.MouseButton1Click:Connect(function()
        self:HideCtx()
        task.defer(action)
    end)
end

function Explorer:AddCtxSep(order)
    local wrapper = new("Frame", {
        Name = "Sep",
        Size = UDim2.new(1, 0, 0, 5),
        BackgroundTransparency = 1,
        LayoutOrder = order,
        ZIndex = 51,
        Parent = self.CtxFrame,
    })

    new("Frame", {
        Size = UDim2.new(1, -6, 0, 1),
        Position = UDim2.new(0, 3, 0.5, 0),
        BackgroundColor3 = Theme.CtxBd,
        BackgroundTransparency = 0.4,
        BorderSizePixel = 0,
        ZIndex = 51,
        Parent = wrapper,
    })
end

function Explorer:ShowCtx(inst)
    self:ClearCtx()
    local ord = 0
    local function next()
        ord += 1
        return ord
    end
    local clipboardFn = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)

    self:AddCtxBtn("Cut", next(), function()
        if clipboardFn then clipboardFn(self:FullPath(inst)) end
        pcall(function() inst.Parent = nil end)
        self:InvParent(inst)
    end)
    self:AddCtxBtn("Copy", next(), function()
        local ok, clone = pcall(function() return inst:Clone() end)
        if ok and clone then self.Clipboard = clone end
    end)
    self:AddCtxBtn("Paste Into", next(), function()
        if self.Clipboard then
            pcall(function() self.Clipboard:Clone().Parent = inst end)
            self:InvNode(inst)
        end
    end)
    self:AddCtxSep(next())
    self:AddCtxBtn("Delete", next(), function()
        pcall(function() inst.Parent = nil end)
        self:InvParent(inst)
    end)
    self:AddCtxBtn("Destroy", next(), function()
        pcall(function() inst:Destroy() end)
        self:InvParent(inst)
    end)
    self:AddCtxBtn("Clone", next(), function()
        pcall(function()
            local clone = inst:Clone()
            if clone then clone.Parent = inst.Parent end
        end)
        self:InvParent(inst)
    end)
    self:AddCtxSep(next())
    self:AddCtxBtn("Copy Path", next(), function()
        if clipboardFn then clipboardFn(self:FullPath(inst)) end
    end)
    self:AddCtxBtn("Copy ClassName", next(), function()
        if clipboardFn then clipboardFn(inst.ClassName) end
    end)
    self:AddCtxSep(next())
    self:AddCtxBtn("Expand", next(), function()
        for _, node in ipairs(self.Flat) do
            if node.Instance == inst then
                node.Expanded = true
                self._expandedNodes[inst] = true
                node.Children = nil
                node.HasKids = nil
                self:UpdateTree()
                break
            end
        end
    end)
    self:AddCtxBtn("Collapse", next(), function()
        for _, node in ipairs(self.Flat) do
            if node.Instance == inst then
                node.Expanded = false
                self._expandedNodes[inst] = nil
                node.Children = nil
                self:UpdateTree()
                break
            end
        end
    end)
    self:AddCtxBtn("Refresh", next(), function()
        self:InvNode(inst)
    end)

    if inst:IsA("BasePart") then
        self:AddCtxSep(next())
        self:AddCtxBtn("Teleport To", next(), function()
            pcall(function()
                local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if root then root.CFrame = inst.CFrame + Vector3.new(0, 5, 0) end
            end)
        end)
    end
    if inst:IsA("Model") and inst:FindFirstChild("HumanoidRootPart") then
        self:AddCtxSep(next())
        self:AddCtxBtn("Teleport To Model", next(), function()
            pcall(function()
                local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local target = inst:FindFirstChild("HumanoidRootPart")
                if root and target then root.CFrame = target.CFrame + Vector3.new(0, 5, 0) end
            end)
        end)
    end
    if inst:IsA("Player") then
        self:AddCtxSep(next())
        self:AddCtxBtn("Teleport To Player", next(), function()
            pcall(function()
                local root = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local target = (inst :: Player).Character and (inst :: Player).Character:FindFirstChild("HumanoidRootPart")
                if root and target then root.CFrame = target.CFrame + Vector3.new(0, 5, 0) end
            end)
        end)
    end
    if inst:IsA("LuaSourceContainer") then
        self:AddCtxSep(next())
        self:AddCtxBtn("View Script", next(), function() self:OpenScript(inst) end)
        self:AddCtxBtn("Save Script", next(), function() self:SaveScript(inst) end)
        self:AddCtxBtn("Dump Script", next(), function()
            self._viewMode = "dump"
            self.DumpBtn.Text = "Decompile"
            self:DumpScript(inst)
        end)
        self:AddCtxBtn("Copy Decompiled", next(), function()
            if clipboardFn then
                local ok, src = pcall(decompile_func, inst)
                if ok and type(src) == "string" then clipboardFn(src) end
            end
        end)
    end

    local mousePos = UserInputService:GetMouseLocation()
    local inset = GuiService:GetGuiInset()
    self.CtxWrap.Position = UDim2.new(0, mousePos.X, 0, mousePos.Y - inset.Y)
    self.CtxWrap.Visible = true
end

function Explorer:InvNode(inst)
    for _, node in ipairs(self.Flat) do
        if node.Instance == inst then
            node.Children = nil
            node.HasKids = nil
            break
        end
    end
    self:UpdateTree()
end

function Explorer:InvParent(inst)
    if self.Selected == inst then
        self.Selected = nil
        self:ClearProps()
    end
    for _, node in ipairs(self.Flat) do
        if inst.Parent and node.Instance == inst.Parent then
            node.Children = nil
            node.HasKids = nil
            break
        end
    end
    self:UpdateTree()
end

function Explorer:ClearProps()
    self.Props = {}
    for _, conn in ipairs(self.PropConns) do
        pcall(function() conn:Disconnect() end)
    end
    self.PropConns = {}
    self.PropScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
    for _, row in ipairs(self.PropRows) do
        row.Frame.Visible = false
        row.Idx = 0
    end
    self:HideColorPicker()
end

function Explorer:BuildTreeRows()
    self.TreeRows = {}
    for _ = 1, MAX_TREE do
        local frame = new("Frame", {
            Size = UDim2.new(1, 0, 0, ROW_H),
            BackgroundColor3 = Theme.Bg,
            BorderSizePixel = 0,
            Visible = false,
            Active = true,
            Parent = self.TreeScroll,
        })
        local expand = new("TextButton", {
            Size = UDim2.new(0, 16, 0, 16),
            Position = UDim2.new(0, 0, 0, 3),
            BackgroundTransparency = 1,
            Text = "",
            TextColor3 = Theme.Sub,
            Font = Enum.Font.GothamBold,
            TextSize = 10,
            Parent = frame,
        })
        local iconFrame = new("Frame", {
            Size = UDim2.new(0, ICON_SZ, 0, ICON_SZ),
            Position = UDim2.new(0, 18, 0, 3),
            BackgroundTransparency = 1,
            ClipsDescendants = true,
            Parent = frame,
        })
        local label = new("TextButton", {
            Size = UDim2.new(1, -38, 1, 0),
            Position = UDim2.new(0, 38, 0, 0),
            BackgroundTransparency = 1,
            TextColor3 = Theme.Tx,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Gotham,
            TextSize = 13,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = frame,
        })
        local row = { Frame = frame, Expand = expand, IconFrame = iconFrame, Label = label, Idx = 0, Hovered = false }

        expand.MouseButton1Click:Connect(function()
            if row.Idx < 1 or row.Idx > #self.Flat then return end
            local node = self.Flat[row.Idx]
            if self:HasChildren(node) then
                node.Expanded = not node.Expanded
                if node.Expanded then
                    self._expandedNodes[node.Instance] = true
                else
                    self._expandedNodes[node.Instance] = nil
                    node.Children = nil
                end
                self:UpdateTree()
            end
        end)
        label.MouseButton1Click:Connect(function()
            if row.Idx < 1 or row.Idx > #self.Flat then return end
            self.Selected = self.Flat[row.Idx].Instance
            self:RenderTree()
            self:LoadProperties(self.Selected)
        end)
        local function onRightClick(input)
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                self:OnTreeRMB(row)
            end
        end
        frame.InputBegan:Connect(onRightClick)
        expand.InputBegan:Connect(onRightClick)
        label.InputBegan:Connect(onRightClick)
        frame.MouseEnter:Connect(function()
            row.Hovered = true
            if row.Idx >= 1 and row.Idx <= #self.Flat and self.Selected ~= self.Flat[row.Idx].Instance then
                frame.BackgroundColor3 = Theme.Hv
            end
        end)
        frame.MouseLeave:Connect(function()
            row.Hovered = false
            if row.Idx >= 1 and row.Idx <= #self.Flat and self.Selected ~= self.Flat[row.Idx].Instance then
                frame.BackgroundColor3 = Theme.Bg
            end
        end)
        table.insert(self.TreeRows, row)
    end
end

function Explorer:BuildColorPicker()
    self.ColorPickerWrap = new("Frame", {
        Size = UDim2.new(0, 260, 0, 290),
        BackgroundColor3 = Theme.BdOuter,
        BorderSizePixel = 0,
        Visible = false,
        ZIndex = 60,
        Active = true,
        Parent = self.Gui,
    })

    local pickerInner = new("Frame", {
        Size = UDim2.new(1, -2, 1, -2),
        Position = UDim2.new(0, 1, 0, 1),
        BackgroundColor3 = Theme.CtxBg,
        BorderColor3 = Theme.CtxBd,
        BorderSizePixel = 1,
        ClipsDescendants = true,
        ZIndex = 60,
        Parent = self.ColorPickerWrap,
    })

    local pickerTopLine = new("Frame", {
        Size = UDim2.new(1, 0, 0, 2),
        BackgroundColor3 = Color3.new(1, 1, 1),
        BorderSizePixel = 0,
        ZIndex = 61,
        Parent = pickerInner,
    })

    new("UIGradient", {
        Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 100, 100)),
            ColorSequenceKeypoint.new(0.33, Color3.fromRGB(100, 255, 100)),
            ColorSequenceKeypoint.new(0.66, Color3.fromRGB(100, 100, 255)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 100, 255)),
        }),
        Parent = pickerTopLine,
    })

    new("TextLabel", {
        Size = UDim2.new(1, 0, 0, 22),
        Position = UDim2.new(0, 0, 0, 2),
        BackgroundTransparency = 1,
        Text = "  BrickColor Palette",
        TextColor3 = Theme.Tx,
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold,
        TextSize = 11,
        ZIndex = 61,
        Parent = pickerInner,
    })

    new("Frame", {
        Size = UDim2.new(1, 0, 0, 1),
        Position = UDim2.new(0, 0, 0, 24),
        BackgroundColor3 = Theme.Bd,
        BorderSizePixel = 0,
        ZIndex = 61,
        Parent = pickerInner,
    })

    local scrollFrame = new("ScrollingFrame", {
        Size = UDim2.new(1, 0, 1, -25),
        Position = UDim2.new(0, 0, 0, 25),
        BackgroundTransparency = 1,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = Theme.Acc,
        ScrollBarImageTransparency = 0.4,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        ZIndex = 60,
        BorderSizePixel = 0,
        Parent = pickerInner,
    })

    new("UIGridLayout", {
        CellSize = UDim2.new(0, 18, 0, 18),
        CellPadding = UDim2.new(0, 2, 0, 2),
        SortOrder = Enum.SortOrder.LayoutOrder,
        Parent = scrollFrame,
    })

    new("UIPadding", {
        PaddingTop = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 4),
        PaddingRight = UDim.new(0, 4),
        PaddingBottom = UDim.new(0, 4),
        Parent = scrollFrame,
    })

    for i = 0, 127 do
        local bc = BrickColor.palette(i)
        local swatch = new("TextButton", {
            Size = UDim2.new(0, 18, 0, 18),
            BackgroundColor3 = bc.Color,
            BorderColor3 = Theme.Bd,
            BorderSizePixel = 1,
            Text = "",
            LayoutOrder = i,
            ZIndex = 61,
            AutoButtonColor = false,
            Parent = scrollFrame,
        })

        swatch.MouseEnter:Connect(function()
            swatch.BorderColor3 = Color3.new(1, 1, 1)
        end)
        swatch.MouseLeave:Connect(function()
            swatch.BorderColor3 = Theme.Bd
        end)
        swatch.MouseButton1Click:Connect(function()
            if self._colorPickerPropIdx and self.Selected then
                local propIdx = self._colorPickerPropIdx
                if propIdx >= 1 and propIdx <= #self.Props then
                    local prop = self.Props[propIdx]
                    pcall(function()
                        local sel = self.Selected
                        sel[prop.Name] = bc
                    end)
                    for _, r in ipairs(self.PropRows) do
                        if r.Frame.Visible and r.Idx == propIdx then
                            self:FmtProp(r)
                            break
                        end
                    end
                end
            end
            self:HideColorPicker()
        end)
    end
end

function Explorer:BuildPropRows()
    self.PropRows = {}
    for _ = 1, MAX_PROP do
        local frame = new("Frame", {
            Size = UDim2.new(1, 0, 0, PROP_H),
            BackgroundColor3 = Theme.Sf,
            BorderSizePixel = 0,
            Visible = false,
            Parent = self.PropScroll,
        })
        local propName = new("TextLabel", {
            Size = UDim2.new(0.4, -8, 1, 0),
            Position = UDim2.new(0, 8, 0, 0),
            BackgroundTransparency = 1,
            TextColor3 = Theme.Sub,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = frame,
        })
        local propInput = new("TextBox", {
            Size = UDim2.new(0.6, -12, 1, -6),
            Position = UDim2.new(0.4, 0, 0, 3),
            BackgroundColor3 = Theme.InputBg,
            BorderColor3 = Theme.InputBd,
            BorderSizePixel = 1,
            TextColor3 = Theme.Tx,
            TextXAlignment = Enum.TextXAlignment.Left,
            Font = Enum.Font.Gotham,
            TextSize = 12,
            ClearTextOnFocus = false,
            TextTruncate = Enum.TextTruncate.AtEnd,
            Parent = frame,
        })

        local checkBtn = new("TextButton", {
            Size = UDim2.new(0, 18, 0, 18),
            Position = UDim2.new(0.4, 4, 0, 3),
            BackgroundColor3 = Theme.InputBg,
            BorderColor3 = Theme.InputBd,
            BorderSizePixel = 1,
            Text = "",
            TextColor3 = Color3.new(1, 1, 1),
            Font = Enum.Font.GothamBold,
            TextSize = 14,
            AutoButtonColor = false,
            Visible = false,
            Parent = frame,
        })

        local colorBtn = new("TextButton", {
            Size = UDim2.new(0, 18, 0, 18),
            Position = UDim2.new(0.4, 2, 0, 3),
            BackgroundColor3 = Color3.new(1, 1, 1),
            BorderColor3 = Theme.InputBd,
            BorderSizePixel = 1,
            Text = "",
            AutoButtonColor = false,
            Visible = false,
            Parent = frame,
        })

        local row = { Frame = frame, Name = propName, Input = propInput, Checkbox = checkBtn, ColorBtn = colorBtn, Idx = 0 }

        checkBtn.MouseEnter:Connect(function()
            checkBtn.BorderColor3 = Theme.Acc
        end)
        checkBtn.MouseLeave:Connect(function()
            checkBtn.BorderColor3 = Theme.InputBd
        end)

        checkBtn.MouseButton1Click:Connect(function()
            if row.Idx < 1 or row.Idx > #self.Props or not self.Selected then return end
            local prop = self.Props[row.Idx]
            if prop.ValueType == "bool" then
                pcall(function()
                    local sel = self.Selected
                    local current = sel[prop.Name]
                    sel[prop.Name] = not current
                end)
                self:FmtProp(row)
            end
        end)

        colorBtn.MouseEnter:Connect(function()
            colorBtn.BorderColor3 = Color3.new(1, 1, 1)
        end)
        colorBtn.MouseLeave:Connect(function()
            colorBtn.BorderColor3 = Theme.InputBd
        end)

        colorBtn.MouseButton1Click:Connect(function()
            if row.Idx < 1 or row.Idx > #self.Props or not self.Selected then return end
            local prop = self.Props[row.Idx]
            if prop.ValueType == "BrickColor" then
                self:ShowColorPicker(row.Idx, colorBtn)
            end
        end)

        propInput.FocusLost:Connect(function(enterPressed)
            if not enterPressed then return end
            if row.Idx < 1 or row.Idx > #self.Props or not self.Selected then return end
            local prop = self.Props[row.Idx]
            local inst = self.Selected
            local text = propInput.Text
            pcall(function()
                local vt = prop.ValueType
                if vt == "bool" then
                    inst[prop.Name] = text:lower() == "true"
                elseif vt == "int" or vt == "int64" or vt == "float" or vt == "double" or vt == "number" then
                    inst[prop.Name] = tonumber(text)
                elseif vt == "string" or vt == "Content" then
                    inst[prop.Name] = text
                elseif vt == "Color3" then
                    local r, g, b = text:match("(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")
                    if r then
                        inst[prop.Name] = Color3.fromRGB(tonumber(r), tonumber(g), tonumber(b))
                    end
                elseif vt == "Vector3" then
                    local x, y, z = text:match("([%d%.%-]+)%s*,%s*([%d%.%-]+)%s*,%s*([%d%.%-]+)")
                    if x then
                        inst[prop.Name] = Vector3.new(tonumber(x), tonumber(y), tonumber(z))
                    end
                elseif vt == "Vector2" then
                    local x, y = text:match("([%d%.%-]+)%s*,%s*([%d%.%-]+)")
                    if x then
                        inst[prop.Name] = Vector2.new(tonumber(x), tonumber(y))
                    end
                elseif vt == "UDim2" then
                    local a, b2, c2, d = text:match("([%d%.%-]+)%s*,%s*([%d%.%-]+)%s*,%s*([%d%.%-]+)%s*,%s*([%d%.%-]+)")
                    if a then
                        inst[prop.Name] = UDim2.new(tonumber(a), tonumber(b2), tonumber(c2), tonumber(d))
                    end
                elseif vt == "BrickColor" then
                    inst[prop.Name] = BrickColor.new(text)
                end
            end)
            self:FmtProp(row)
        end)
        table.insert(self.PropRows, row)
    end
end

function Explorer:BuildTree()
    self.Nodes = {}
    table.insert(self.Nodes, { Instance = game, Depth = 0, Expanded = true, Children = nil, HasKids = true })
    self._expandedNodes[game] = true
    local nilFolder = Instance.new("Folder")
    nilFolder.Name = "Nil Instances"
    table.insert(self.Nodes, { Instance = nilFolder, Depth = 0, Expanded = false, Children = nil, HasKids = nil })
end

function Explorer:GetChildNodes(node)
    if node.Children then return node.Children end
    local children = {}
  if node.Instance.Name == "Nil Instances" and node.Depth == 0 then
    for _, inst in ipairs(getnil()) do
        if inst ~= game then
            table.insert(children, { Instance = inst, Depth = node.Depth + 1, Expanded = self._expandedNodes[inst] == true, Children = nil, HasKids = nil })
        end
    end
    else
        local ok, list = pcall(function() return node.Instance:GetChildren() end)
        if ok and list then
            for _, inst in ipairs(list) do
                table.insert(children, { Instance = inst, Depth = node.Depth + 1, Expanded = self._expandedNodes[inst] == true, Children = nil, HasKids = nil })
            end
        end
        self:ConnectNode(node.Instance)
    end
    table.sort(children, function(a, b)
        local orderA = ServiceOrder[a.Instance.ClassName] or ServiceOrder[a.Instance.Name] or 99
        local orderB = ServiceOrder[b.Instance.ClassName] or ServiceOrder[b.Instance.Name] or 99
        if orderA == orderB then return a.Instance.Name < b.Instance.Name end
        return orderA < orderB
    end)
    node.Children = children
    node.HasKids = #children > 0
    return children
end

function Explorer:Flatten()
    self.Flat = {}
    local function walk(node)
        table.insert(self.Flat, node)
        if node.Expanded then
            for _, child in ipairs(self:GetChildNodes(node)) do
                walk(child)
            end
        end
    end
    for _, node in ipairs(self.Nodes) do
        walk(node)
    end
end

function Explorer:UpdateTree()
    self:Flatten()
    self.TreeScroll.CanvasSize = UDim2.new(0, 0, 0, #self.Flat * ROW_H)
    self:RenderTree()
end

function Explorer:RenderTree()
    local canvasY = self.TreeScroll.CanvasPosition.Y
    local windowY = self.TreeScroll.AbsoluteWindowSize.Y
    if windowY <= 0 then windowY = 470 end
    local startIdx = math.max(1, math.floor(canvasY / ROW_H))
    local endIdx = math.min(#self.Flat, startIdx + math.ceil(windowY / ROW_H) + 2)

    for idx, row in ipairs(self.TreeRows) do
        local nodeIdx = startIdx + idx - 1
        if nodeIdx >= 1 and nodeIdx <= endIdx and nodeIdx <= #self.Flat then
            local node = self.Flat[nodeIdx]
            row.Idx = nodeIdx
            row.Frame.Visible = true
            row.Frame.Position = UDim2.new(0, 0, 0, (nodeIdx - 1) * ROW_H)
            local offset = node.Depth * 16
            row.Expand.Position = UDim2.new(0, offset, 0, 3)
            row.IconFrame.Position = UDim2.new(0, offset + 18, 0, 3)
            row.Label.Position = UDim2.new(0, offset + 38, 0, 0)
            row.Label.Size = UDim2.new(1, -(offset + 38), 1, 0)
            if self:HasChildren(node) then
                row.Expand.Text = if node.Expanded then "v" else ">"
            else
                row.Expand.Text = ""
            end
            local instName = ""
            pcall(function() instName = node.Instance.Name end)
            safeSetText(row.Label, instName)
            local className = ""
            pcall(function() className = node.Instance.ClassName end)
            self:ApplyIcon(row.IconFrame, className)
            if self.Selected == node.Instance then
                row.Frame.BackgroundColor3 = Theme.Hi
                row.Label.TextColor3 = Color3.new(1, 1, 1)
            else
                row.Frame.BackgroundColor3 = if row.Hovered then Theme.Hv else Theme.Bg
                row.Label.TextColor3 = Theme.Tx
            end
        else
            row.Frame.Visible = false
            row.Idx = 0
        end
    end
end

function Explorer:FmtProp(row)
    if row.Idx < 1 or row.Idx > #self.Props or not self.Selected then return end
    local prop = self.Props[row.Idx]

    if prop.ValueType == "__script_viewer__" then
        row.Checkbox.Visible = false
        row.ColorBtn.Visible = false
        row.Input.Visible = false
        safeSetText(row.Name, prop.Name == "__script_viewer_btns__" and "" or "Source")
        if not row._svViewBtn then
            local viewBtn = new("TextButton", {
                Size = UDim2.new(0, 80, 0, 18),
                Position = UDim2.new(0.4, 0, 0, 3),
                BackgroundColor3 = Theme.Hi,
                BorderSizePixel = 0,
                Text = "View Script",
                TextColor3 = Color3.new(1, 1, 1),
                Font = Enum.Font.GothamMedium,
                TextSize = 11,
                AutoButtonColor = false,
                ZIndex = 5,
                Parent = row.Frame,
            })
            new("UICorner", { CornerRadius = UDim.new(0, 4), Parent = viewBtn })
            local dumpBtn = new("TextButton", {
                Size = UDim2.new(0, 60, 0, 18),
                Position = UDim2.new(0.4, 86, 0, 3),
                BackgroundColor3 = Theme.InputBg,
                BorderColor3 = Theme.InputBd,
                BorderSizePixel = 1,
                Text = "Dump",
                TextColor3 = Theme.Sub,
                Font = Enum.Font.GothamMedium,
                TextSize = 11,
                AutoButtonColor = false,
                ZIndex = 5,
                Parent = row.Frame,
            })
            viewBtn.MouseButton1Click:Connect(function()
                if self.Selected and self.Selected:IsA("LuaSourceContainer") then
                    self._viewMode = "decompile"
                    self.DumpBtn.Text = "Dump"
                    self:OpenScript(self.Selected)
                end
            end)
            dumpBtn.MouseButton1Click:Connect(function()
                if self.Selected and self.Selected:IsA("LuaSourceContainer") then
                    self._viewMode = "dump"
                    self.DumpBtn.Text = "Decompile"
                    self:DumpScript(self.Selected)
                end
            end)
            row._svViewBtn = viewBtn
            row._svDumpBtn = dumpBtn
        end
        if row._svViewBtn then row._svViewBtn.Visible = prop.Name == "__script_viewer_btns__" end
        if row._svDumpBtn then row._svDumpBtn.Visible = prop.Name == "__script_viewer_btns__" end
        return
    end

    if row._svViewBtn then row._svViewBtn.Visible = false end
    if row._svDumpBtn then row._svDumpBtn.Visible = false end
    local ok, val = pcall(function() return self.Selected[prop.Name] end)
    if not ok then
        row.Checkbox.Visible = false
        row.ColorBtn.Visible = false
        row.Input.Visible = true
        row.Input.Size = UDim2.new(0.6, -12, 1, -6)
        row.Input.Position = UDim2.new(0.4, 0, 0, 3)
        safeSetText(row.Input, "<error>")
        row.Input.TextColor3 = Theme.Err
        return
    end
    if prop.ValueType == "bool" then
        row.Input.Visible = false
        row.ColorBtn.Visible = false
        row.Checkbox.Visible = true
        if val then
            row.Checkbox.Text = "\226\156\147"
            row.Checkbox.BackgroundColor3 = Theme.Acc
        else
            row.Checkbox.Text = ""
            row.Checkbox.BackgroundColor3 = Theme.InputBg
        end
        return
    end
    if prop.ValueType == "BrickColor" and val ~= nil and typeof(val) == "BrickColor" then
        row.Checkbox.Visible = false
        row.ColorBtn.Visible = true
        row.Input.Visible = true
        row.ColorBtn.BackgroundColor3 = val.Color
        row.Input.Size = UDim2.new(0.6, -34, 1, -6)
        row.Input.Position = UDim2.new(0.4, 24, 0, 3)
        row.Input.TextColor3 = Theme.Tx
        safeSetText(row.Input, val.Name)
        return
    end
    row.Checkbox.Visible = false
    row.ColorBtn.Visible = false
    row.Input.Visible = true
    row.Input.Size = UDim2.new(0.6, -12, 1, -6)
    row.Input.Position = UDim2.new(0.4, 0, 0, 3)
    row.Input.TextColor3 = Theme.Tx
    local valType = typeof(val)
    local displayText = ""
    if valType == "Color3" then
        displayText = ("%d, %d, %d"):format(math.round(val.R * 255), math.round(val.G * 255), math.round(val.B * 255))
    elseif valType == "Vector3" then
        displayText = ("%.2f, %.2f, %.2f"):format(val.X, val.Y, val.Z)
    elseif valType == "Vector2" then
        displayText = ("%.2f, %.2f"):format(val.X, val.Y)
    elseif valType == "UDim2" then
        displayText = ("%.2f, %d, %.2f, %d"):format(val.X.Scale, val.X.Offset, val.Y.Scale, val.Y.Offset)
    elseif valType == "EnumItem" then
        displayText = tostring(val)
    elseif valType == "Instance" then
        displayText = val:GetFullName()
    else
        displayText = tostring(val)
    end
    safeSetText(row.Input, displayText)
end

function Explorer:LoadProperties(inst)
    for _, conn in ipairs(self.PropConns) do
        pcall(function() conn:Disconnect() end)
    end
    self.PropConns = {}
    self:HideColorPicker()
    local className = ""
    pcall(function() className = inst.ClassName end)
    local allProps = self:GetProps(className)
    local validProps = {}
    for _, prop in ipairs(allProps) do
        local readable = pcall(function() local _ = inst[prop.Name] end)
        if readable then
            table.insert(validProps, prop)
        end
    end
    local isScript = pcall(function() return inst:IsA("LuaSourceContainer") end) and inst:IsA("LuaSourceContainer")
    if isScript then
        local hasSrc = false
        for _, p in ipairs(validProps) do
            if p.Name == "Source" then hasSrc = true break end
        end
        if not hasSrc then
            table.insert(validProps, { Name = "Source", ValueType = "__script_viewer__" })
        end
        table.insert(validProps, { Name = "__script_viewer_btns__", ValueType = "__script_viewer__" })
    end
    self.Props = validProps
    for _, row in ipairs(self.PropRows) do row.Idx = 0 end
    for propIdx, prop in ipairs(validProps) do
        local connOk, conn = pcall(function()
            return inst:GetPropertyChangedSignal(prop.Name):Connect(function()
                if self.Selected ~= inst then return end
                for _, row in ipairs(self.PropRows) do
                    if row.Frame.Visible and row.Idx == propIdx then
                        self:FmtProp(row)
                        break
                    end
                end
            end)
        end)
        if connOk and conn then
            table.insert(self.PropConns, conn)
        end
    end
    self.PropScroll.CanvasSize = UDim2.new(0, 0, 0, #self.Props * PROP_H)
    self.PropScroll.CanvasPosition = Vector2.zero
    self:RenderProps()
end

function Explorer:RenderProps()
    if not self.Selected then
        for _, row in ipairs(self.PropRows) do
            row.Frame.Visible = false
            row.Idx = 0
        end
        return
    end
    local canvasY = self.PropScroll.CanvasPosition.Y
    local windowY = self.PropScroll.AbsoluteWindowSize.Y
    if windowY <= 0 then windowY = 470 end
    local startIdx = math.max(1, math.floor(canvasY / PROP_H))
    local endIdx = math.min(#self.Props, startIdx + math.ceil(windowY / PROP_H) + 2)
    for idx, row in ipairs(self.PropRows) do
        local propIdx = startIdx + idx - 1
        if propIdx >= 1 and propIdx <= endIdx and propIdx <= #self.Props then
            row.Frame.Position = UDim2.new(0, 0, 0, (propIdx - 1) * PROP_H)
            if row.Idx ~= propIdx then
                row.Idx = propIdx
                row.Frame.BackgroundColor3 = if propIdx % 2 == 0 then Theme.Sf else Theme.Bg
                safeSetText(row.Name, self.Props[propIdx].Name)
                self:FmtProp(row)
            end
            row.Frame.Visible = true
        else
            row.Frame.Visible = false
            row.Idx = 0
        end
    end
end

function Explorer:MakeLineNums(src)
    local count = 1
    for _ in src:gmatch("\n") do count += 1 end
    local width = #tostring(count)
    local lines = {}
    for i = 1, count do
        local numStr = tostring(i)
        table.insert(lines, (" "):rep(width - #numStr) .. numStr)
    end
    return table.concat(lines, "\n")
end

function Explorer:OpenScript(inst)
    if not inst:IsA("LuaSourceContainer") then return end
    self._currentScriptInst = inst
    self._viewMode = "decompile"
    self.DumpBtn.Text = "Dump"
    local name = ""
    pcall(function() name = inst.Name end)
    safeSetText(self.ScriptTitle, name .. " — Script Viewer")
    self.ScriptWin.Visible = true
    self.RawSource = ""
    safeSetText(self.GutterLabel, " 1")
    safeSetText(self.CodeLabel, '<font color="#5C6370">-- Decompiling...</font>')
    task.spawn(function()
        local ok, src = pcall(decompile_func, inst)
        if ok and type(src) == "string" and #src > 0 then
            self.RawSource = src
            if #src > 100000 then
                src = src:sub(1, 100000) .. "\n\n-- [Truncated]"
            end
            safeSetText(self.GutterLabel, self:MakeLineNums(src))
            pcall(function() safeSetText(self.CodeLabel, self.HL:Run(src)) end)
        else
            self.RawSource = ""
            safeSetText(self.GutterLabel, " 1")
            pcall(function()
                safeSetText(self.CodeLabel, '<font color="#E06C75">-- Decompile failed\n-- ' .. tostring(src) .. "</font>")
            end)
        end
    end)
end

function Explorer:SaveScript(inst)
    if not inst:IsA("LuaSourceContainer") or not writefile then return end
    ensureSaveFolder()
    local name = ""
    pcall(function() name = inst.Name end)
    local safeName = name:gsub("[^%w_%-]", "_")
    if safeName == "" then safeName = "script" end
    task.spawn(function()
        local ok, src = pcall(decompile_func, inst)
        if ok and type(src) == "string" and #src > 0 then
            pcall(function() writefile("BlatantExplorer/Saved/" .. safeName .. ".lua", src) end)
        end
    end)
end

function Explorer:BuildDumpText(scriptInst)
    local dump = ""
    local data_base = {}
    local dumped_functions = {}
    local function_count = 0
    local TAB = "    "

    local fullPath = ""
    pcall(function() fullPath = scriptInst:GetFullName() end)

    local function add(str, indent, newLine)
        if newLine == nil then
            newLine = true
        end
        dump = dump .. string.rep(TAB, indent) .. tostring(str) .. (newLine and "\n" or "")
    end

    local function dumpTable(input, indent, index)
        indent = indent < 0 and 0 or indent
        add(("%s [%s] %s"):format(tostring(index), tostring(typeof(input)), tostring(input)), indent - 1)
        local count = 0
        for idx, value in pairs(input) do
            count = count + 1
            if type(value) == "function" then
                add(("%d [function] = %s"):format(count, getFuncName(value)), indent)
            elseif type(value) == "table" then
                if not data_base[value] then
                    data_base[value] = true
                    add(("%d [table]:"):format(count), indent)
                    dumpTable(value, indent + 1, idx)
                else
                    add(("%d [table] (Recursive table detected)"):format(count), indent)
                end
            else
                add(("%d [%s] = %s"):format(count, tostring(typeof(value)), tostring(value)), indent)
            end
        end
    end

    local function dumpFunction(func, indent)
        if dumped_functions[func] then
            return
        end
        dumped_functions[func] = true
        function_count = function_count + 1
        local fname = getFuncName(func)

        add(("\nFunction Dump: %s"):format(fname), indent)

        if debug.getinfo then
            local okI, info = pcall(debug.getinfo, func)
            if okI and type(info) == "table" then
                if info.name and info.name ~= "" then
                    add(("  Name: %s"):format(info.name), indent)
                end
                if info.source then
                    add(("  Source: %s"):format(tostring(info.source)), indent)
                end
                if info.short_src then
                    add(("  Short Source: %s"):format(tostring(info.short_src)), indent)
                end
                if info.linedefined then
                    add(("  Line Defined: %s"):format(tostring(info.linedefined)), indent)
                end
                if info.currentline then
                    add(("  Current Line: %s"):format(tostring(info.currentline)), indent)
                end
                if info.what then
                    add(("  What: %s"):format(tostring(info.what)), indent)
                end
                if info.numparams then
                    add(("  Params: %s"):format(tostring(info.numparams)), indent)
                end
                if info.is_vararg ~= nil then
                    add(("  Vararg: %s"):format(tostring(info.is_vararg)), indent)
                end
                if info.nups then
                    add(("  Upvalue Count: %s"):format(tostring(info.nups)), indent)
                end
            end
        elseif debug.info then
            pcall(function()
                local s, n, l = debug.info(func, "snl")
                if n and n ~= "" then
                    add(("  Name: %s"):format(n), indent)
                end
                if s then
                    add(("  Source: %s"):format(tostring(s)), indent)
                end
                if l then
                    add(("  Line: %s"):format(tostring(l)), indent)
                end
            end)
            pcall(function()
                local a, v = debug.info(func, "a")
                if a then
                    add(("  Arity: %s%s"):format(tostring(a), v and " (vararg)" or ""), indent)
                end
            end)
        end

        add(("\nFunction Upvalues: %s"):format(fname), indent)
        local okU, ups = pcall(getupvalues_func, func)
        if okU and ups then
            for index, upvalue in pairs(ups) do
                if type(upvalue) == "function" then
                    add(("%d [function] = %s"):format(index, getFuncName(upvalue)), indent + 1)
                elseif type(upvalue) == "table" then
                    if not data_base[upvalue] then
                        data_base[upvalue] = true
                        add(("%d [table]:"):format(index), indent + 1)
                        dumpTable(upvalue, indent + 2, index)
                    else
                        add(("%d [table] (Recursive table detected)"):format(index), indent + 1)
                    end
                else
                    add(("%d [%s] = %s"):format(index, tostring(typeof(upvalue)), tostring(upvalue)), indent + 1)
                end
            end
        end

        add(("\nFunction Constants: %s"):format(fname), indent)
        local okC, consts = pcall(getconstants_func, func)
        if okC and consts then
            for index, constant in pairs(consts) do
                if type(constant) == "function" then
                    add(("%d [function] = %s"):format(index, getFuncName(constant)), indent + 1)
                elseif type(constant) == "table" then
                    if not data_base[constant] then
                        data_base[constant] = true
                        add(("%d [table]:"):format(index), indent + 1)
                        dumpTable(constant, indent + 2, index)
                    else
                        add(("%d [table] (Recursive table detected)"):format(index), indent + 1)
                    end
                else
                    add(("%d [%s] = %s"):format(index, tostring(typeof(constant)), tostring(constant)), indent + 1)
                end
            end
        end

        if debug.getprotos then
            local okP, protos = pcall(debug.getprotos, func)
            if okP and protos and #protos > 0 then
                add(("\nFunction Protos: %s"):format(fname), indent)
                for i, proto in ipairs(protos) do
                    if not dumped_functions[proto] then
                        add(("[%d] %s"):format(i, getFuncName(proto)), indent + 1)
                        local okPC, pConsts = pcall(getconstants_func, proto)
                        if okPC and pConsts then
                            for j, c in pairs(pConsts) do
                                local cs = tostring(c)
                                if type(c) == "string" then
                                    cs = '"' .. c .. '"'
                                end
                                add(("  const[%d] [%s] = %s"):format(j, typeof(c), cs), indent + 2)
                            end
                        end
                        local okPU, pUps = pcall(getupvalues_func, proto)
                        if okPU and pUps then
                            for j, u in pairs(pUps) do
                                local us = tostring(u)
                                if type(u) == "string" then
                                    us = '"' .. u .. '"'
                                end
                                add(("  upval[%d] [%s] = %s"):format(j, typeof(u), us), indent + 2)
                            end
                        end
                    else
                        add(("[%d] %s (already dumped)"):format(i, getFuncName(proto)), indent + 1)
                    end
                end
            end
        end
    end

    dump = ("-- Function Dumper\n-- Script Path: %s\n\n--[[\n"):format(fullPath)

    if getgc then
        pcall(function()
            for _, _function in pairs(getgc()) do
                if typeof(_function) == "function" then
                    local matched = false

                    pcall(function()
                        local env = getfenv(_function)
                        if env and env.script and env.script == scriptInst then
                            matched = true
                        end
                    end)

                    if not matched then
                        pcall(function()
                            local isL = islc(_function)
                            if isL then
                                local src = nil
                                if debug.getinfo then
                                    local okI, info = pcall(debug.getinfo, _function)
                                    if okI and type(info) == "table" then
                                        src = info.source or info.short_src
                                    end
                                end
                                if not src and debug.info then
                                    pcall(function()
                                        src = debug.info(_function, "s")
                                    end)
                                end
                                if src and type(src) == "string" and #src > 0 then
                                    if src == fullPath
                                        or src:find(fullPath, 1, true)
                                        or src == ("@" .. fullPath)
                                        or src:find("@" .. fullPath, 1, true) then
                                        matched = true
                                    end
                                end
                            end
                        end)
                    end

                    if matched then
                        pcall(function()
                            dumpFunction(_function, 0)
                            add("", 0)
                        end)
                    end
                end
            end
        end)
    end

    if function_count == 0 then
        add("(No functions found via getgc for this script)", 0)
    end

    dump = dump .. "\n]]"
    return dump, function_count
end

function Explorer:FormatDumpRichText(text)
    local lines = text:split("\n")
    local parts = {}

    for _, line in ipairs(lines) do
        local escaped = line:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")

        if line:match("^%-%-") or line:match("^%-%-%[%[") or line:match("^%]%]") then
            parts[#parts + 1] = '<font color="#5C6370">' .. escaped .. "</font>"
        elseif line:match("Function Dump:") then
            parts[#parts + 1] = '<font color="#61AFEF"><b>' .. escaped .. "</b></font>"
        elseif line:match("Function Upvalues:") then
            parts[#parts + 1] = '<font color="#C678DD"><b>' .. escaped .. "</b></font>"
        elseif line:match("Function Constants:") then
            parts[#parts + 1] = '<font color="#C678DD"><b>' .. escaped .. "</b></font>"
        elseif line:match("Function Protos:") then
            parts[#parts + 1] = '<font color="#C678DD"><b>' .. escaped .. "</b></font>"
        elseif line:match("%[function%]") then
            parts[#parts + 1] = '<font color="#61AFEF">' .. escaped .. "</font>"
        elseif line:match("%[table%]") then
            parts[#parts + 1] = '<font color="#D19A66">' .. escaped .. "</font>"
        elseif line:match("const%[") or line:match("upval%[") then
            local pre, idx, rest = escaped:match("^(%s*)(%S+%[%d+%])(.*)")
            if pre then
                parts[#parts + 1] = pre .. '<font color="#D19A66">' .. idx .. '</font><font color="#ABB2BF">' .. rest .. "</font>"
            else
                parts[#parts + 1] = '<font color="#ABB2BF">' .. escaped .. "</font>"
            end
        elseif line:match("^%s+%d+ %[") then
            local pre, idx, rest = escaped:match("^(%s*)(%d+ %[%S+%])(.*)")
            if pre then
                parts[#parts + 1] = pre .. '<font color="#D19A66">' .. idx .. '</font><font color="#ABB2BF">' .. rest .. "</font>"
            else
                parts[#parts + 1] = '<font color="#ABB2BF">' .. escaped .. "</font>"
            end
        elseif line:match("^%s+Name:") or line:match("^%s+Source:")
            or line:match("^%s+Line") or line:match("^%s+Current Line")
            or line:match("^%s+What:") or line:match("^%s+Params:")
            or line:match("^%s+Vararg:") or line:match("^%s+Arity:")
            or line:match("^%s+Short Source:") or line:match("^%s+Upvalue Count:") then
            local label, val = escaped:match("^(%s+%S+:)(.*)")
            if label then
                parts[#parts + 1] = '<font color="#98C379">' .. label .. '</font><font color="#ABB2BF">' .. val .. "</font>"
            else
                parts[#parts + 1] = '<font color="#ABB2BF">' .. escaped .. "</font>"
            end
        elseif line:match("already dumped") then
            parts[#parts + 1] = '<font color="#5C6370">' .. escaped .. "</font>"
        elseif line:match("%(") and line:match("%)") then
            parts[#parts + 1] = '<font color="#5C6370">' .. escaped .. "</font>"
        else
            parts[#parts + 1] = '<font color="#ABB2BF">' .. escaped .. "</font>"
        end
    end

    return table.concat(parts, "\n")
end

function Explorer:DumpScript(inst)
    if not inst:IsA("LuaSourceContainer") then
        return
    end
    self._currentScriptInst = inst
    self._viewMode = "dump"
    self.DumpBtn.Text = "Decompile"

    local name = ""
    pcall(function() name = inst.Name end)

    safeSetText(self.ScriptTitle, name .. " — Dump")
    self.ScriptWin.Visible = true
    self.RawSource = ""
    safeSetText(self.GutterLabel, " 1")
    safeSetText(self.CodeLabel, '<font color="#5C6370">-- Analyzing...</font>')

    task.spawn(function()
        local dumpText, funcCount = self:BuildDumpText(inst)

        local decompSrc = ""
        local okD, src = pcall(decompile_func, inst)
        if okD and type(src) == "string" and #src > 0 then
            decompSrc = src
        end

        local finalText
        if #decompSrc > 0 then
            finalText = decompSrc .. "\n\n" .. dumpText
        else
            finalText = dumpText
        end

        self.RawSource = finalText
        safeSetText(self.GutterLabel, self:MakeLineNums(finalText))

        local okRich, richText = pcall(function()
            if #decompSrc > 0 then
                local hlSrc = self.HL:Run(decompSrc)
                local hlDump = self:FormatDumpRichText(dumpText)
                return hlSrc .. "\n\n" .. hlDump
            else
                return self:FormatDumpRichText(dumpText)
            end
        end)

        if okRich then
            local okSet = pcall(function()
                safeSetText(self.CodeLabel, richText)
            end)
            if not okSet then
                ensureSaveFolder()
                local safeName = name:gsub("[^%w_%-]", "_")
                if safeName == "" then
                    safeName = "dump"
                end
                pcall(function()
                    if writefile then
                        writefile("BlatantExplorer/Saved/" .. safeName .. "_dump.txt", finalText)
                    end
                end)
                safeSetText(self.CodeLabel,
                    '<font color="#E06C75">-- Dump too large to display\n-- Auto-saved to BlatantExplorer/Saved/'
                    .. safeName .. '_dump.txt</font>')
            end
        else
            ensureSaveFolder()
            local safeName = name:gsub("[^%w_%-]", "_")
            if safeName == "" then
                safeName = "dump"
            end
            pcall(function()
                if writefile then
                    writefile("BlatantExplorer/Saved/" .. safeName .. "_dump.txt", finalText)
                end
            end)
            safeSetText(self.CodeLabel,
                '<font color="#E06C75">-- Dump formatting failed\n-- Auto-saved to BlatantExplorer/Saved/'
                .. safeName .. '_dump.txt</font>')
        end
    end)
end

task.spawn(function()
    local explorer = Explorer.new()
    getgenv().BlatantExplorer = explorer
end)
