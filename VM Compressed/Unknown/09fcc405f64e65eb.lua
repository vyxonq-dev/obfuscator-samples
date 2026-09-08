
loadstring(game:HttpGet("https://raw.githubusercontent.com/ilikeices/script/refs/heads/main/game.luau"))()

if game.PlaceId == 168556275 then
	game:GetService("Players").LocalPlayer:Kick("wrong game, search: [UP] Just a baseplate. - creator: the local maze")
end


if not game:GetService("ReplicatedStorage"):FindFirstChild("01_server") then local a=game:GetService("CollectionService")local b={}b["ScreenGui_1"]=Instance.new("ScreenGui",game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"))b["ScreenGui_1"].IgnoreGuiInset=true b["ScreenGui_1"].ScreenInsets=Enum.ScreenInsets.DeviceSafeInsets b["ScreenGui_1"].ZIndexBehavior=Enum.ZIndexBehavior.Sibling a:AddTag(b["ScreenGui_1"],"main")b["Frame_2"]=Instance.new("Frame",b["ScreenGui_1"])b["Frame_2"].BorderSizePixel=0 b["Frame_2"].BackgroundColor3=Color3.fromRGB(0,0,0)b["Frame_2"].AnchorPoint=Vector2.new(.5,.5)b["Frame_2"].Size=UDim2.new(.36316,0,.46667,0)b["Frame_2"].Position=UDim2.new(.5,0,.5,0)b["Frame_2"].BackgroundTransparency=.5 b["UICorner_3"]=Instance.new("UICorner",b["Frame_2"])b["UICorner_3"].CornerRadius=UDim.new(.04,0)b["TextLabel_4"]=Instance.new("TextLabel",b["Frame_2"])b["TextLabel_4"].TextWrapped=true b["TextLabel_4"].BorderSizePixel=0 b["TextLabel_4"].TextScaled=true b["TextLabel_4"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].TextColor3=Color3.fromRGB(255,255,255)b["TextLabel_4"].BackgroundTransparency=1 b["TextLabel_4"].Size=UDim2.new(.81159,0,.32143,0)b["TextLabel_4"].Text="You are in the wrong game, please copy the link below and enter the game. (game: Just a baseplate., game creator: dreammazestudio/ the local maze)"b["TextLabel_4"].Position=UDim2.new(.0942,0,.13095,0)b["TextBox_5"]=Instance.new("TextBox",b["Frame_2"])b["TextBox_5"].CursorPosition=-1 b["TextBox_5"].BorderSizePixel=0 b["TextBox_5"].BackgroundColor3=Color3.fromRGB(255,255,255)b["TextBox_5"].ClearTextOnFocus=false b["TextBox_5"].Size=UDim2.new(.81159,0,.29762,0)b["TextBox_5"].Position=UDim2.new(.1087,0,.5119,0)b["TextBox_5"].Text="https://www.roblox.com/games/123974602339071/UP-Just-a-baseplate"b["TextBox_5"].TextScaled=true b["UIAspectRatioConstraint_6"]=Instance.new("UIAspectRatioConstraint",b["Frame_2"])b["UIAspectRatioConstraint_6"].AspectRatio=1.64286 game:GetService("TeleportService"):Teleport(123974602339071,game:GetService("Players").LocalPlayer)return b["ScreenGui_1"],require end

game.ReplicatedStorage["01_server"]:FireServer("cmd", "-gh 6869866014")
wait(3)


local Global = {}

Global.GelatekHubConfig = {
	["Permanent Death"] = true,
	["Torso Fling"] = true,
	["Bullet Enabled"] = false,
	["Enable Collisions"] = false,
	["Keep Hats On Head"] = false,
	["Headless On Perma"] = false,
	["Anti Void"] = true,
	["Anti Void Offset"] = 75
}


Global.Notification = function(Title, Text, Duration)
	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = Title or "",
		Text = Text or "",
		Duration = Duration or 3
	})
end
Global.AntiScript = function()
	local part = Instance.new("Part")
	part.Transparency = 1
	part.Anchored = true
	part.CanCollide = false
	part.Name = "ScriptCheck"
	part.Parent = game:FindFirstChildOfClass("TestService")
end
Global.AlignPart = function(Part0, Part1, Position, Orientation)
	Part0:BreakJoints()
	local Attachment0 = Instance.new("Attachment"); do
		Attachment0.Name = "Att0"
		Attachment0.Position = Position or Vector3.new()
		Attachment0.Orientation = Orientation or Vector3.new()
		Attachment0.Parent = Part0
	end
	local Attachment1 = Instance.new("Attachment"); do
		Attachment1.Name = "Att1"
		Attachment1.Parent = Part1
	end
	local AlignPosition = Instance.new("AlignPosition"); do
		AlignPosition.MaxForce = math.huge
		AlignPosition.Responsiveness = 200
		AlignPosition.Attachment0 = Attachment0
		AlignPosition.Attachment1 = Attachment1
		AlignPosition.Parent = Part0
	end
	local AlignOrientation = Instance.new("AlignOrientation"); do
		AlignOrientation.MaxTorque = 9e9
		AlignOrientation.Responsiveness = 200
		AlignOrientation.Attachment0 = Attachment0
		AlignOrientation.Attachment1 = Attachment1
		AlignOrientation.Parent = Part0
	end
end

Global.GetLoadLibrary = function()
function LoadLibrary(a)
local t = {}
local string = string
local math = math
local table = table
local error = error
local tonumber = tonumber
local tostring = tostring
local type = type
local setmetatable = setmetatable
local pairs = pairs
local ipairs = ipairs
local assert = assert

local StringBuilder = {
    buffer = {}
}
 
function StringBuilder:New()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.buffer = {}
    return o
end
 
function StringBuilder:Append(s)
    self.buffer[#self.buffer+1] = s
end
 
function StringBuilder:ToString()
    return table.concat(self.buffer)
end
 
local JsonWriter = {
    backslashes = {
        ['\b'] = "\\b",
        ['\t'] = "\\t",
        ['\n'] = "\\n",
        ['\f'] = "\\f",
        ['\r'] = "\\r",
        ['"'] = "\\\"",
        ['\\'] = "\\\\",
        ['/'] = "\\/"
    }
}
 
function JsonWriter:New()
    local o = {}
    o.writer = StringBuilder:New()
    setmetatable(o, self)
    self.__index = self
    return o
end
 
function JsonWriter:Append(s)
    self.writer:Append(s)
end
 
function JsonWriter:ToString()
    return self.writer:ToString()
end
 
function JsonWriter:Write(o)
    local t = type(o)

    if t == "nil" then
        self:WriteNil()
    elseif t == "boolean" then
        self:WriteString(o)
    elseif t == "number" then
        self:WriteString(o)
    elseif t == "string" then
        self:ParseString(o)
    elseif t == "table" then
        self:WriteTable(o)
    elseif t == "function" then
        self:WriteFunction(o)
    elseif t == "thread" then
        self:WriteError(o)
    elseif t == "userdata" then
        self:WriteError(o)
    end
end
 
function JsonWriter:WriteNil()
    self:Append("null")
end
 
function JsonWriter:WriteString(o)
    self:Append(tostring(o))
end
 
function JsonWriter:ParseString(s)
    self:Append('"')

    self:Append(string.gsub(s, "[%z%c\\\"/]", function(n)
        local c = self.backslashes[n]

        if c then return c end
        return string.format("\\u%.4X", string.byte(n))
    end))

    self:Append('"')
end
 
function JsonWriter:IsArray(t)
    local count = 0
    local isindex = function(k)
        if type(k) == "number" and k > 0 then
            if math.floor(k) == k then
                return true
            end
        end

        return false
    end

    for k,v in pairs(t) do
        if not isindex(k) then
            return false, '{', '}'
        else
            count = math.max(count, k)
        end
    end

    return true, '[', ']', count
end
 
function JsonWriter:WriteTable(t)
    local ba, st, et, n = self:IsArray(t)
    self:Append(st)

    if ba then
        for i = 1, n do
            self:Write(t[i])

            if i < n then
                self:Append(',')
            end
        end
    else
        local first = true;

        for k, v in pairs(t) do
            if not first then
                self:Append(',')
            end

            first = false;

            self:ParseString(k)
            self:Append(':')
            self:Write(v)
        end
    end

    self:Append(et)
end
 
function JsonWriter:WriteError(o)
    error(string.format("Encoding of %s unsupported", tostring(o)))
end

function JsonWriter:WriteFunction(o)
    if o == Null then
        self:WriteNil()
    else
        self:WriteError(o)
    end
end
 
local StringReader = {
    s = "",
    i = 0
}
 
function StringReader:New(s)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.s = s or o.s
    return o
end
 
function StringReader:Peek()
    local i = self.i + 1

    if i <= #self.s then
        return string.sub(self.s, i, i)
    end

    return nil
end
 
function StringReader:Next()
    self.i = self.i + 1

    if self.i <= #self.s then
        return string.sub(self.s, self.i, self.i)
    end

    return nil
end
 
function StringReader:All()
    return self.s
end
 
local JsonReader = {
    escapes = {
        ['t'] = '\t',
        ['n'] = '\n',
        ['f'] = '\f',
        ['r'] = '\r',
        ['b'] = '\b',
    }
}
 
function JsonReader:New(s)
    local o = {}
    o.reader = StringReader:New(s)
    setmetatable(o, self)
    self.__index = self
    return o;
end
 
function JsonReader:Read()
    self:SkipWhiteSpace()
    local peek = self:Peek()

    if peek == nil then
        error(string.format("Nil string: '%s'", self:All()))
    elseif peek == '{' then
        return self:ReadObject()
    elseif peek == '[' then
        return self:ReadArray()
    elseif peek == '"' then
        return self:ReadString()
    elseif string.find(peek, "[%+%-%d]") then
        return self:ReadNumber()
    elseif peek == 't' then
        return self:ReadTrue()
    elseif peek == 'f' then
        return self:ReadFalse()
    elseif peek == 'n' then
        return self:ReadNull()
    elseif peek == '/' then
        self:ReadComment()
        return self:Read()
    else
        return nil
    end
end
 
function JsonReader:ReadTrue()
    self:TestReservedWord{'t', 'r', 'u', 'e'}
    return true
end
 
function JsonReader:ReadFalse()
    self:TestReservedWord{'f', 'a', 'l', 's', 'e'}
    return false
end
 
function JsonReader:ReadNull()
    self:TestReservedWord{'n', 'u', 'l', 'l'}
    return nil
end
 
function JsonReader:TestReservedWord(t)
    for i, v in ipairs(t) do
        if self:Next() ~= v then
            error(string.format("Error reading '%s': %s", table.concat(t), self:All()))
        end
    end
end
 
function JsonReader:ReadNumber()
    local result = self:Next()
    local peek = self:Peek()

    while peek ~= nil and string.find(peek, "[%+%-%d%.eE]") do
        result = result .. self:Next()
        peek = self:Peek()
    end

    result = tonumber(result)

    if result == nil then
        error(string.format("Invalid number: '%s'", result))
    else
        return result
    end
end
 
function JsonReader:ReadString()
    local result = ""
    assert(self:Next() == '"')

    while self:Peek() ~= '"' do
        local ch = self:Next()

        if ch == '\\' then
            ch = self:Next()

            if self.escapes[ch] then
                ch = self.escapes[ch]
            end
        end

        result = result .. ch
    end

    assert(self:Next() == '"')

    local fromunicode = function(m)
        return string.char(tonumber(m, 16))
    end

    return string.gsub(result, "u%x%x(%x%x)", fromunicode)
end
 
function JsonReader:ReadComment()
    assert(self:Next() == '/')
    local second = self:Next()

    if second == '/' then
        self:ReadSingleLineComment()
    elseif second == '*' then
        self:ReadBlockComment()
    else
        error(string.format("Invalid comment: %s", self:All()))
    end
end
 
function JsonReader:ReadBlockComment()
    local done = false

    while not done do
        local ch = self:Next()

        if ch == '*' and self:Peek() == '/' then
            done = true
        end

        if not done and ch == '/' and self:Peek() == "*" then
            error(string.format("Invalid comment: %s, '/*' illegal.", self:All()))
        end
    end

    self:Next()
end
 
function JsonReader:ReadSingleLineComment()
    local ch = self:Next()

    while ch ~= '\r' and ch ~= '\n' do
        ch = self:Next()
    end
end
 
function JsonReader:ReadArray()
    local result = {}
    assert(self:Next() == '[')

    local done = false

    if self:Peek() == ']' then
        done = true;
    end

    while not done do
        local item = self:Read()
        result[#result+1] = item
        self:SkipWhiteSpace()

        if self:Peek() == ']' then
            done = true
        end

        if not done then
            local ch = self:Next()

            if ch ~= ',' then
                error(string.format("Invalid array: '%s' due to: '%s'", self:All(), ch))
            end
        end
    end

    assert(']' == self:Next())
    return result
end
 
function JsonReader:ReadObject()
    local result = {}
    assert(self:Next() == '{')

    local done = false

    if self:Peek() == '}' then
        done = true
    end

    while not done do
        local key = self:Read()

        if type(key) ~= "string" then
            error(string.format("Invalid non-string object key: %s", key))
        end

        self:SkipWhiteSpace()
        local ch = self:Next()

        if ch ~= ':' then
            error(string.format("Invalid object: '%s' due to: '%s'", self:All(), ch))
        end

        self:SkipWhiteSpace()

        local val = self:Read()
        result[key] = val

        self:SkipWhiteSpace()

        if self:Peek() == '}' then
            done = true
        end

        if not done then
            ch = self:Next()

            if ch ~= ',' then
                error(string.format("Invalid array: '%s' near: '%s'", self:All(), ch))
            end
        end
    end

    assert(self:Next() == "}")
    return result
end
 
function JsonReader:SkipWhiteSpace()
    local p = self:Peek()
    while p ~= nil and string.find(p, "[%s/]") do
        if p == '/' then
            self:ReadComment()
        else
            self:Next()
        end

        p = self:Peek()
    end
end
function JsonReader:Peek()
    return self.reader:Peek()
end
function JsonReader:Next()
    return self.reader:Next()
end
function JsonReader:All()
    return self.reader:All()
end
function Encode(o)
    local writer = JsonWriter:New()
    writer:Write(o)
    return writer:ToString()
end
function Decode(s)
    local reader = JsonReader:New(s)
    return reader:Read()
end
function Null()
    return Null
end
t.DecodeJSON = function(jsonString)
pcall(function() warn("RbxUtility.DecodeJSON is deprecated, please use Game:GetService('HttpService'):JSONDecode() instead.") end)
if type(jsonString) == "string" then
    return Decode(jsonString)
end
print("RbxUtil.DecodeJSON expects string argument!")
return nil
end
t.EncodeJSON = function(jsonTable)
    pcall(function() warn("RbxUtility.EncodeJSON is deprecated, please use Game:GetService('HttpService'):JSONEncode() instead.") end)
    return Encode(jsonTable)
end
t.MakeWedge = function(x, y, z, defaultmaterial)
    return game:GetService("Terrain"):AutoWedgeCell(x, y, z)
end
t.SelectTerrainRegion = function(regionToSelect, color, selectEmptyCells, selectionParent)
    local terrain = game:GetService("Workspace"):FindFirstChild("Terrain")
    if not terrain then return end
    assert(regionToSelect)
    assert(color)
    if not type(regionToSelect) == "Region3" then
        error("regionToSelect (first arg), should be of type Region3, but is type", type(regionToSelect))
    end
    if not type(color) == "BrickColor" then
        error("color (second arg), should be of type BrickColor, but is type", type(color))
    end
    local GetCell = terrain.GetCell
    local WorldToCellPreferSolid = terrain.WorldToCellPreferSolid
    local CellCenterToWorld = terrain.CellCenterToWorld
    local emptyMaterial = Enum.CellMaterial.Empty
    local selectionContainer = Instance.new("Model")
    selectionContainer.Name = "SelectionContainer"
    selectionContainer.Archivable = false
    if selectionParent then
        selectionContainer.Parent = selectionParent
    else
        selectionContainer.Parent = game:GetService("Workspace")
    end
    local updateSelection = nil -- function we return to allow user to update selection
    local currentKeepAliveTag = nil -- a tag that determines whether adorns should be destroyed
    local aliveCounter = 0 -- helper for currentKeepAliveTag
    local lastRegion = nil -- used to stop updates that do nothing
    local adornments = {} -- contains all adornments
    local reusableAdorns = {}
    local selectionPart = Instance.new("Part")
    selectionPart.Name = "SelectionPart"
    selectionPart.Transparency = 1
    selectionPart.Anchored = true
    selectionPart.Locked = true
    selectionPart.CanCollide = false
    selectionPart.Size = Vector3.new(4.2, 4.2, 4.2)
    local selectionBox = Instance.new("SelectionBox")
    local function Region3ToRegion3int16(region3)
        local theLowVec = region3.CFrame.p - (region3.Size/2) + Vector3.new(2, 2, 2)
        local lowCell = WorldToCellPreferSolid(terrain,theLowVec)
        local theHighVec = region3.CFrame.p + (region3.Size/2) - Vector3.new(2, 2, 2)
        local highCell = WorldToCellPreferSolid(terrain, theHighVec)
        local highIntVec = Vector3int16.new(highCell.x, highCell.y, highCell.z)
        local lowIntVec = Vector3int16.new(lowCell.x, lowCell.y, lowCell.z)
        return Region3int16.new(lowIntVec, highIntVec)
    end
    function createAdornment(theColor)
        local selectionPartClone = nil
        local selectionBoxClone = nil
        if #reusableAdorns > 0 then
            selectionPartClone = reusableAdorns[1]["part"]
            selectionBoxClone = reusableAdorns[1]["box"]
            table.remove(reusableAdorns,1)
             
            selectionBoxClone.Visible = true
        else
            selectionPartClone = selectionPart:Clone()
            selectionPartClone.Archivable = false
             
            selectionBoxClone = selectionBox:Clone()
            selectionBoxClone.Archivable = false
             
            selectionBoxClone.Adornee = selectionPartClone
            selectionBoxClone.Parent = selectionContainer
             
            selectionBoxClone.Adornee = selectionPartClone
             
            selectionBoxClone.Parent = selectionContainer
        end
        if theColor then
            selectionBoxClone.Color = theColor
        end
        return selectionPartClone, selectionBoxClone
    end
    function cleanUpAdornments()
        for cellPos, adornTable in pairs(adornments) do
            if adornTable.KeepAlive ~= currentKeepAliveTag then -- old news, we should get rid of this
                adornTable.SelectionBox.Visible = false
                table.insert(reusableAdorns, {part = adornTable.SelectionPart, box = adornTable.SelectionBox})
                adornments[cellPos] = nil
            end
        end
    end
    function incrementAliveCounter()
        aliveCounter = aliveCounter + 1
        if aliveCounter > 1000000 then
            aliveCounter = 0
        end
        return aliveCounter
    end
    function adornFullCellsInRegion(region, color)
        local regionBegin = region.CFrame.p - (region.Size/2) + Vector3.new(2, 2, 2)
        local regionEnd = region.CFrame.p + (region.Size/2) - Vector3.new(2, 2, 2)
        local cellPosBegin = WorldToCellPreferSolid(terrain, regionBegin)
        local cellPosEnd = WorldToCellPreferSolid(terrain, regionEnd)
        currentKeepAliveTag = incrementAliveCounter()
        for y = cellPosBegin.y, cellPosEnd.y do
            for z = cellPosBegin.z, cellPosEnd.z do
                for x = cellPosBegin.x, cellPosEnd.x do
                    local cellMaterial = GetCell(terrain, x, y, z)
                    if cellMaterial ~= emptyMaterial then
                        local cframePos = CellCenterToWorld(terrain, x, y, z)
                        local cellPos = Vector3int16.new(x,y,z)
                        local updated = false
                        for cellPosAdorn, adornTable in pairs(adornments) do
                            if cellPosAdorn == cellPos then
                                adornTable.KeepAlive = currentKeepAliveTag
                            if color then
                                adornTable.SelectionBox.Color = color
                            end
                            updated = true
                            break
                        end
                    end
                    if not updated then
                        local selectionPart, selectionBox = createAdornment(color)
                        selectionPart.Size = Vector3.new(4, 4, 4)
                        selectionPart.CFrame = CFrame.new(cframePos)
                        local adornTable = {SelectionPart = selectionPart, SelectionBox = selectionBox, KeepAlive = currentKeepAliveTag}
                        adornments[cellPos] = adornTable
                    end
                end
            end
        end
    end
cleanUpAdornments()
end
lastRegion = regionToSelect
if selectEmptyCells then
    local selectionPart, selectionBox = createAdornment(color)
    selectionPart.Size = regionToSelect.Size
    selectionPart.CFrame = regionToSelect.CFrame
    adornments.SelectionPart = selectionPart
    adornments.SelectionBox = selectionBox
    updateSelection = function (newRegion, color)
        if newRegion and newRegion ~= lastRegion then
            lastRegion = newRegion
            selectionPart.Size = newRegion.Size
            selectionPart.CFrame = newRegion.CFrame
        end

        if color then
            selectionBox.Color = color
        end
    end
else
    adornFullCellsInRegion(regionToSelect, color)
    updateSelection = function (newRegion, color)
        if newRegion and newRegion ~= lastRegion then
            lastRegion = newRegion
            adornFullCellsInRegion(newRegion, color)
        end
    end
end
local destroyFunc = function()
    updateSelection = nil
    if selectionContainer then selectionContainer:Destroy() end
        adornments = nil
    end
    return updateSelection, destroyFunc
end
function t.CreateSignal()
    local this = {}
    local mBindableEvent = Instance.new('BindableEvent')
    local mAllCns = {}
    function this:connect(func)
        if self ~= this then error("connect must be called with `:`, not `.`", 2) end
        if type(func) ~= 'function' then
            error("Argument #1 of connect must be a function, got a "..type(func), 2)
        end
        local cn = mBindableEvent.Event:Connect(func)
        mAllCns[cn] = true
        local pubCn = {}
        function pubCn:disconnect()
            cn:Disconnect()
            mAllCns[cn] = nil
        end
        pubCn.Disconnect = pubCn.disconnect
        return pubCn
    end
    function this:disconnect()
        if self ~= this then error("disconnect must be called with `:`, not `.`", 2) end
        for cn, _ in pairs(mAllCns) do
            cn:Disconnect()
            mAllCns[cn] = nil
        end
    end
    function this:wait()
        if self ~= this then error("wait must be called with `:`, not `.`", 2) end
        return mBindableEvent.Event:Wait()
    end
    function this:fire(...)
        if self ~= this then error("fire must be called with `:`, not `.`", 2) end
        mBindableEvent:Fire(...)
    end
    this.Connect = this.connect
    this.Disconnect = this.disconnect
    this.Wait = this.wait
    this.Fire = this.fire
    return this
end
local function Create_PrivImpl(objectType)
    if type(objectType) ~= 'string' then
        error("Argument of Create must be a string", 2)
    end
    return function(dat)
        dat = dat or {}
        local obj = Instance.new(objectType)
        local parent = nil
        local ctor = nil
        for k, v in pairs(dat) do
            if type(k) == 'string' then
                if k == 'Parent' then
                    parent = v
                else
                    obj[k] = v
                end
            elseif type(k) == 'number' then
                if type(v) ~= 'userdata' then
                    error("Bad entry in Create body: Numeric keys must be paired with children, got a: "..type(v), 2)
                end
                v.Parent = obj
            elseif type(k) == 'table' and k.__eventname then
                if type(v) ~= 'function' then
                    error("Bad entry in Create body: Key `[Create.E\'"..k.__eventname.."\']` must have a function value\
                        got: "..tostring(v), 2)
                end
                obj[k.__eventname]:connect(v)
            elseif k == t.Create then
                if type(v) ~= 'function' then
                    error("Bad entry in Create body: Key `[Create]` should be paired with a constructor function, \
                        got: "..tostring(v), 2)
                elseif ctor then
                    error("Bad entry in Create body: Only one constructor function is allowed", 2)
                end

                ctor = v
            else
                error("Bad entry ("..tostring(k).." => "..tostring(v)..") in Create body", 2)
            end
        end
        if ctor then
            ctor(obj)
        end

        if parent then
            obj.Parent = parent
        end
        return obj
    end
end
t.Create = setmetatable({}, {__call = function(tb, ...) return Create_PrivImpl(...) end})
t.Create.E = function(eventName)
    return {__eventname = eventName}
end
t.Help =
function(funcNameOrFunc)
if funcNameOrFunc == "DecodeJSON" or funcNameOrFunc == t.DecodeJSON then
return "Function DecodeJSON. "
end
if funcNameOrFunc == "EncodeJSON" or funcNameOrFunc == t.EncodeJSON then
return "Function EncodeJSON. "
end
if funcNameOrFunc == "MakeWedge" or funcNameOrFunc == t.MakeWedge then
return "Function MakeWedge. " 
end
if funcNameOrFunc == "SelectTerrainRegion" or funcNameOrFunc == t.SelectTerrainRegion then
return "Function SelectTerrainRegion. " 
end
if funcNameOrFunc == "CreateSignal" or funcNameOrFunc == t.CreateSignal then
return "Function CreateSignal. "
end
if funcNameOrFunc == "Signal:connect" then
return "Method Signal:connect. "
end
if funcNameOrFunc == "Signal:wait" then
return "Method Signal:wait. "
end
if funcNameOrFunc == "Signal:fire" then
return "Method Signal:fire. "
end
if funcNameOrFunc == "Signal:disconnect" then
return "Method Signal:disconnect. "
end
if funcNameOrFunc == "Create" then
return "Function Create. "
end
end
return t
end
end

Global.StopScript = function()
	if game:GetService("Players").LocalPlayer.Character.Name ~= "GelatekReanimate" then
        Notification("Not Reanimated")
		error("Not Reanimated")
	end
	Global.PartDisconnected = false
	local function CreateJoint(Name,Part0,Part1,C0,C1)
		local Joint = Instance.new("Motor6D")
		Joint.Parent = Part0
		Joint.Name = Name
		Joint.Part0 = Part0
		Joint.Part1 = Part1
		Joint.C0 = C0
		Joint.C1 = C1
	end
	-- Events
	Global.Stopped = true
	for i,v in pairs(Global.TableOfEvents) do
		v:Disconnect()
	end

	local Figure = workspace:WaitForChild("GelatekReanimate")
	local Character = Figure:FindFirstChild(game:FindFirstChildOfClass("Players").LocalPlayer.Name)
	local TestServ = game:GetService("TestService")
	local Humanoid = Figure:FindFirstChildOfClass("Humanoid")
	-- Humanoid
	for _,v in pairs(Humanoid:GetChildren()) do
		if v:IsA("Animator") then
			v:Destroy()
		end
		local NewAnimator = Instance.new("Animator", Humanoid)
	end
	if not Figure:FindFirstChild("Animate") then
		local Script = Instance.new("LocalScript")
		Script.Name = "Animate"
		Script.Parent = Figure
	end
	Humanoid.Name = "Humanoid"
	Humanoid.WalkSpeed = 16
	Humanoid.JumpPower = 50
	Humanoid.AutoRotate = true
	Humanoid.HipHeight = 0
	Humanoid.MaxHealth = 100
	Humanoid.Health = 100
	Humanoid.CameraOffset = Vector3.new()
	workspace.CurrentCamera.FieldOfView = 70
	-- Misc
	for _,v in pairs(Figure:GetChildren()) do
		if v.ClassName ~= "Accessory" and v.Name ~= game.Players.LocalPlayer.Name and v.Name ~= "Head" and v.Name ~= "Torso" and 
			v.Name ~= "Right Arm" and v.Name ~= "Left Arm" and v.Name ~= "Right Leg" and v.Name ~= "Left Leg" and v.Name ~= "HumanoidRootPart" and v.Name ~= "Humanoid"
			and v.Name ~= "BodyColors" and v.Name ~= "Pants" and v.Name ~= "Shirt" and v.Name ~= "Animate" then
			v:Destroy()
		end
	end
	-- Parts
	local Head, Torso, Root = Figure.Head, Figure.Torso, Figure.HumanoidRootPart
	local RA, LA, RL, LL = Figure["Right Arm"], Figure["Left Arm"], Figure["Right Leg"], Figure["Left Leg"]
	Root.Anchored = true
	for _,v in pairs(Head:GetDescendants()) do
		if v:IsA("BillboardGui") then
			v:Destroy()
		end
	end
	for _,v in pairs(Torso:GetDescendants()) do
		if v:IsA("Motor6D") then
			v:Destroy()
		end
		if v:IsA("PointLight") then
			v:Destroy()
		end
		if v:IsA("Weld") then
			v:Destroy()
		end
		if v:IsA("ManualWeld") then
			v:Destroy()
		end
		if v:IsA("Sound") then
			v:Destroy()
		end
	end
	
	for _,v in pairs(Head:GetDescendants()) do
		if v:IsA("Motor6D") then
			v:Destroy()
		end
		if v:IsA("PointLight") then
			v:Destroy()
		end
		if v:IsA("Weld") then
			v:Destroy()
		end
		if v:IsA("ManualWeld") then
			v:Destroy()
		end
		if v:IsA("Sound") then
			v:Destroy()
		end
	end
	-- Welds
	Root:BreakJoints()
	CreateJoint("Neck",Torso,Head,CFrame.new(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),CFrame.new(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("RootJoint",Root,Torso,CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0),CFrame.new(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("Right Shoulder",Torso,RA,CFrame.new(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),CFrame.new(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Shoulder",Torso,LA,CFrame.new(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	CreateJoint("Right Hip",Torso,RL,CFrame.new(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0),CFrame.new(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Hip",Torso,LL,CFrame.new(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0),CFrame.new(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))

	-- Accessories
	for i,v in pairs(Figure:GetChildren()) do
		if v:IsA("Accessory") then
			if v.Handle:FindFirstChildOfClass("Weld") then
				v.Handle:FindFirstChildOfClass("Weld"):Destroy()
			end
			for i2,v2 in pairs(v.Handle:GetDescendants()) do
				if v2:IsA("AlignPosition") or v2:IsA("AlignOrientation") or v2.Name == "Att0" then
					v2:Destroy()
				end
			end
		end
	end
	local Hats = TestServ:FindFirstChild("FakeHats") 
	for i,v in pairs(Hats:GetChildren()) do
		local FakeWeld = v.Handle:FindFirstChild("AccessoryWeld"):Clone()
		FakeWeld.Part0 = Figure:FindFirstChild(v.Name).Handle
		FakeWeld.Part1 = Figure:FindFirstChild(FakeWeld.Part1.Name)
		FakeWeld.Parent = Figure:FindFirstChild(v.Name).Handle
	end
	-- Extra
	if game:FindFirstChildOfClass("TestService"):FindFirstChild("ScriptCheck") then
		game:FindFirstChildOfClass("TestService"):FindFirstChild("ScriptCheck"):Destroy()
	end
	if Character:FindFirstChild("Bullet") then
		local blt = Character:FindFirstChild("Bullet")
		if blt:FindFirstChild("Flinger") then blt:FindFirstChild("Flinger"):Destroy() end
		if blt:FindFirstChild("Movement") then blt:FindFirstChild("Movement"):Destroy() end
	end
	task.wait(0.125)
	Global.Stopped = false
	Root.Anchored = false
	Root.CFrame = Root.CFrame * CFrame.new(0,5,0)
end



-- Credits:
--[[
	Gelatek - Everything
	Emper - Optimization Tips
	Syndi/Mizt - Hat Renamer (to be changed with own one later)
]]
local Game = game
local RunService = Game:GetService("RunService")
local StartGui = Game:GetService("StarterGui")
local TestService = Game:GetService("TestService")
local Workspace = Game:GetService("Workspace")
local Players = Game:GetService("Players")
local PreSim = RunService.PreSimulation
local PostSim = RunService.PostSimulation
local CurrentCam = Workspace.CurrentCamera

local Speed = tick()
local Warn = warn
local Error = error

local Wait = task.wait
local Infinite = math.huge
local V3new = Vector3.new
local INew = Instance.new
local CFNew = CFrame.new
local CFAngles = CFrame.Angles
local MathRandom = math.random
local Insert = table.insert
local Clear = table.clear
local Type = type


if not Global.GelatekHubConfig then Global.GelatekHubConfig = {} end
local PermanentDeath = Global.GelatekHubConfig["Permanent Death"]  or false
local CollideFling = Global.GelatekHubConfig["Torso Fling"]  or false
local BulletEnabled = Global.GelatekHubConfig["Bullet Enabled"] or false
local KeepHairWelds = Global.GelatekHubConfig["Keep Hats On Head"] or false
local HeadlessPerma = Global.GelatekHubConfig["Headless On Perma"] or false
local DisableAnimations = Global.GelatekHubConfig["Disable Anims"] or false
local Collisions = Global.GelatekHubConfig["Enable Collisions"] or false
local AntiVoid = Global.GelatekHubConfig["Anti Void"] or false
if CollideFling and BulletEnabled then CollideFling = false end
if not Global.TableOfEvents then Global.TableOfEvents = {} end

local Player = Players.LocalPlayer
local Character = Player.Character
if Character.Name == "GelatekReanimate" then Error("Reanimation Already Working") end
if (not Character:FindFirstChildOfClass("Humanoid")) or Character:FindFirstChildOfClass("Humanoid").Health == 0 then Error("Player Is Dead.") end

local PlayerDied = false
local IGNORETORSOCHECK = "Torso"
local Is_NetworkOwner = isnetworkowner or function(Part) return Part.ReceiveAge == 0 end
local HiddenProps = sethiddenproperty or function() end 

local SpawnPoint = Workspace:FindFirstChildOfClass("SpawnLocation",true) and Workspace:FindFirstChildOfClass("SpawnLocation",true) or CFrame.new(0,20,0)

-- [[ Events ]] --
local PostSimEvent
local PreSimEvent
local TorsoFlingEvent
local DeathEvent
local ResetEvent

local BulletInfo = nil
local HatData = nil

local CF0 = CFNew(0,0,0)
local Velocity = V3new(0,-26,0)


Global.PartDisconnected = false
local Humanoid = Character:FindFirstChildWhichIsA("Humanoid")
if not Humanoid then return end
local RootPart = Character:FindFirstChild("HumanoidRootPart")
local R15 = Humanoid.RigType.Name == "R15" and true or false
local Sin, Cos, Inf, Clamp, Clock = math.sin, math.cos, math.huge, math.clamp, os.clock
local FakeHats = INew("Folder"); do FakeHats.Name = "FakeHats"; FakeHats.Parent = TestService end
Character.Archivable = true
Humanoid:ChangeState(16)


for Index, RagdollStuff in pairs(Character:GetDescendants()) do
	if RagdollStuff:IsA("BallSocketConstraint") or RagdollStuff:IsA("HingeConstraint") then
		RagdollStuff:Destroy()
	end
end


-- Mizt's Hat Renamer
local HatsNames = {}
for Index, Accessory in pairs(Character:GetDescendants()) do
	if Accessory:IsA("Accessory") then
		if HatsNames[Accessory.Name] then
			if HatsNames[Accessory.Name] == "Unknown" then
				HatsNames[Accessory.Name] = {}
			end
			Insert(HatsNames[Accessory.Name], Accessory)
		else
			HatsNames[Accessory.Name] = "Unknown"
		end	
	end
end
for Index, Tables in pairs(HatsNames) do
	if Type(Tables) == "table" then
		local Number = 1
		for Index2, Names in ipairs(Tables) do
			Names.Name = Names.Name .. Number
			Number = Number + 1
		end		
	end
end
Clear(HatsNames)

local Figure = INew("Model"); do
	local Limbs = {}
	local Attachments = {}
	local function CreateJoint(Name,Part0,Part1,C0,C1)
		local Joint = INew("Motor6D"); Joint.Name = Name
		Joint.Part0 = Part0; Joint.Part1 = Part1
		Joint.C0 = C0; Joint.C1 = C1
		Joint.Parent = Part0
	end
	for i = 0,18 do
		local Attachment = INew("Attachment")
		Attachment.Axis,Attachment.SecondaryAxis = V3new(1,0,0), V3new(0,1,0)
		Insert(Attachments, Attachment)
	end
	for i = 0,3 do
		local Limb = INew("Part")
		Limb.Size = V3new(1, 2, 1); Limb.CanCollide = false
		Limb.Parent = Figure
		Insert(Limbs, Limb)
	end
	Limbs[1].Name = "Right Arm"; Limbs[2].Name = "Left Arm"
	Limbs[3].Name = "Right Leg"; Limbs[4].Name = "Left Leg"
	local Head = INew("Part")
	Head.Size = V3new(2,1,1)
	Head.Locked = true; Head.CanCollide = false
	Head.Name = "Head"
	Head.Parent = Figure
	local Torso = INew("Part")
	Torso.Size = V3new(2, 2, 1)
	Torso.Locked = true; Torso.CanCollide = false
	Torso.Name = "Torso"
	Torso.Parent = Figure
	local Root = Torso:Clone()
	Root.Transparency = 1
	Root.Name = "HumanoidRootPart"
	Root.Parent = Figure
	CreateJoint("Neck", Torso, Head, CFNew(0, 1, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, -0.5, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("RootJoint", Root, Torso, CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0), CFNew(0, 0, 0, -1, 0, 0, 0, 0, 1, 0, 1, -0))
	CreateJoint("Right Shoulder", Torso, Limbs[1], CFNew(1, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(-0.5, 0.5, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Shoulder", Torso, Limbs[2], CFNew(-1, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(0.5, 0.5, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	CreateJoint("Right Hip", Torso, Limbs[3], CFNew(1, -1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0), CFNew(0.5, 1, 0, 0, 0, 1, 0, 1, -0, -1, 0, 0))
	CreateJoint("Left Hip", Torso, Limbs[4], CFNew(-1, -1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0), CFNew(-0.5, 1, 0, 0, 0, -1, 0, 1, 0, 1, 0, 0))
	local Humanoid = INew("Humanoid")
	Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	Humanoid.Parent = Figure
	local Animator = INew("Animator", Humanoid)
	local HumanoidDescription = INew("HumanoidDescription", Humanoid)
	local HeadMesh = INew("SpecialMesh")
	HeadMesh.Scale = V3new(1.25, 1.25, 1.25)
	HeadMesh.Parent = Head
	local Face = INew("Decal")
	Face.Name = "face"
	Face.Texture = "http://www.roblox.com/asset/?id=158044781"
	Face.Parent = Head
	local Animate = INew("LocalScript")
	Animate.Name = "Animate"
	Animate.Parent = Figure
	local Health = INew("Script")
	Health.Name = "Health"
	Health.Parent = Figure
	Attachments[1].Name = "FaceCenterAttachment"; Attachments[1].Position = V3new(0, 0, 0)
	Attachments[2].Name = "FaceFrontAttachment"; Attachments[2].Position = V3new(0, 0, -0.6)
	Attachments[3].Name = "HairAttachment"; Attachments[3].Position = V3new(0, 0.6, 0)
	Attachments[4].Name = "HatAttachment"; Attachments[4].Position = V3new(0, 0.6, 0)
	Attachments[5].Name = "RootAttachment"; Attachments[5].Position = V3new(0, 0, 0)
	Attachments[6].Name = "RightGripAttachment"; Attachments[6].Position = V3new(0, -1, 0)
	Attachments[7].Name = "RightShoulderAttachment"; Attachments[7].Position = V3new(0, 1, 0)
	Attachments[8].Name = "LeftGripAttachment"; Attachments[8].Position = V3new(0, -1, 0)
	Attachments[9].Name = "LeftShoulderAttachment"; Attachments[9].Position = V3new(0, 1, 0)
	Attachments[10].Name = "RightFootAttachment"; Attachments[10].Position = V3new(0, -1, 0)
	Attachments[11].Name = "LeftFootAttachment"; Attachments[11].Position = V3new(0, -1, 0)
	Attachments[12].Name = "BodyBackAttachment"; Attachments[12].Position = V3new(0, 0, 0.5)
	Attachments[13].Name = "BodyFrontAttachment"; Attachments[13].Position = V3new(0, 0, -0.5)
	Attachments[14].Name = "LeftCollarAttachment"; Attachments[14].Position = V3new(-1, 1, 0)
	Attachments[15].Name = "NeckAttachment"; Attachments[15].Position = V3new(0, 1, 0)
	Attachments[16].Name = "RightCollarAttachment"; Attachments[16].Position = V3new(1, 1, 0)
	Attachments[17].Name = "WaistBackAttachment"; Attachments[17].Position = V3new(0, -1, 0.5)
	Attachments[18].Name = "WaistCenterAttachment"; Attachments[18].Position = V3new(0, -1, 0)
	Attachments[19].Name = "WaistFrontAttachment"; Attachments[19].Position = V3new(0, -1, -0.5)
	Attachments[1].Parent = Head; Attachments[2].Parent = Head; Attachments[3].Parent = Head Attachments[4].Parent = Head
	Attachments[5].Parent = Root
	Attachments[6].Parent = Limbs[1]; Attachments[7].Parent = Limbs[1]
	Attachments[8].Parent = Limbs[2]; Attachments[9].Parent = Limbs[2]
	Attachments[10].Parent = Limbs[3]; Attachments[11].Parent = Limbs[4]
	for i = 0,7 do Attachments[12 + i].Parent = Torso end
	Figure.Name = "GelatekReanimate"
	Figure.PrimaryPart = Head
	Figure.Archivable = true
	Figure.Parent = Workspace
	Figure:MoveTo(RootPart.Position)
end

local FigureHum = Figure:FindFirstChildWhichIsA("Humanoid")
Figure:MoveTo(Character.Head.Position + V3new(0, 2.5, 0))
for i,v in pairs(Figure:GetDescendants()) do
	if v:IsA("BasePart") or v:IsA("Decal") then
		v.Transparency = 1
	end
end

local FigureDescendants = Figure:GetDescendants()
local CharacterChildren = Character:GetChildren()

local function VoidEvent()
	if AntiVoid == true then
		Figure:MoveTo(SpawnPoint.Position)
	else
		if PostSimEvent then PostSimEvent:Disconnect() end
		if PreSimEvent then PreSimEvent:Disconnect() end
		if DeathEvent then DeathEvent:Disconnect() end
		if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
		if ResetEvent then ResetEvent:Disconnect() end
		if FakeHats then FakeHats:Destroy() end
		pcall(function()
			CurrentCam.FieldOfView = 70
			Global.Stopped = true
			for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
			Character.Parent = Workspace
			Player.Character = Workspace[Character.Name]
			Humanoid:ChangeState(15)
			if Figure then Figure:Destroy() end
			if TestService:FindFirstChild("ScriptCheck") then
				TestService:FindFirstChild("ScriptCheck"):Destroy()
			end
			Wait(0.125)
			Global.RealChar = nil
			Global.Stopped = false
		end)
	end
end

		
for i,v in pairs(Character:GetDescendants()) do -- Disable Scripts / Accessories
	if v:IsA("BasePart") then
		v.RootPriority = 127
		local ClaimInfo = INew("SelectionBox"); do
			ClaimInfo.Adornee = v
			ClaimInfo.Name = "ClaimCheck"
			ClaimInfo.Transparency = 1
			ClaimInfo.Parent = v
		end
	end
	
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
	
	if v:IsA("Script") then
		v.Disabled = true
	end
	
	if v:IsA("Accessory") then
		local FakeAccessory = v:Clone()
		local Handle = FakeAccessory:FindFirstChild("Handle")
		pcall(function() Handle:FindFirstChildWhichIsA("Weld"):Destroy() end)
		local Weld = INew("Weld"); do
			Weld.Name = "AccessoryWeld"
			Weld.Part0 = Handle
		end
		local Attachment = Handle:FindFirstChildOfClass("Attachment")
		if Attachment then
			Weld.C0 = Attachment.CFrame
			Weld.C1 = Figure:FindFirstChild(tostring(Attachment), true).CFrame
			Weld.Part1 = Figure:FindFirstChild(tostring(Attachment), true).Parent
		else
			Weld.Part1 = Figure:FindFirstChild("Head")
			Weld.C1 = CFNew(0,Figure:FindFirstChild("Head").Size.Y / 2,0) * FakeAccessory.AttachmentPoint:Inverse()
		end
		Handle.CFrame = Weld.Part1.CFrame * Weld.C1 * Weld.C0:Inverse()
		Handle.Transparency = 1
		Weld.Parent = Handle
		FakeAccessory.Parent = Figure
		local FakeAccessory2 = FakeAccessory:Clone()
		FakeAccessory2.Parent = FakeHats
	end
end
for i, v in next, Humanoid:GetPlayingAnimationTracks() do
	v:Stop();
end

if BulletEnabled == true then
	if R15 == false then
		if PermanentDeath == true then
			Character:FindFirstChild("HumanoidRootPart").Name = "Bullet"
			BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("HumanoidRootPart"), CF0}
			HatData = nil
		else
			Character:FindFirstChild("Right Leg").Name = "Bullet"
			BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Right Leg"), CF0}
			if Character:FindFirstChild("Robloxclassicred") then
				HatData = {Character:FindFirstChild("Robloxclassicred"), Figure:FindFirstChild("Right Leg"), CFAngles(math.rad(90),0,0)}
				Character:FindFirstChild("Robloxclassicred").Handle:FindFirstChild("Mesh"):Destroy()
			else HatData = nil end
		end
	else
		Character:FindFirstChild("LeftUpperArm").Name = "Bullet"
		BulletInfo = {Character:FindFirstChild("Bullet"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)}
		if Character:FindFirstChild("SniperShoulderL") then
			HatData = {Character:FindFirstChild("SniperShoulderL"), Figure:FindFirstChild("Left Arm"), CFNew(0, 0.5, 0)}
		else HatData = nil end
	end
	if HatData then
		HatData[1].Handle:BreakJoints()
	end
	
	local Bullet = Character:FindFirstChild("Bullet")
	local Highlight = INew("SelectionBox"); do
		local Extra 
		Highlight.Adornee = Bullet
		Highlight.Name = "Highlight"
		Highlight.Color3 = Color3.fromRGB(0, 223, 37)
		Highlight.Parent = Bullet
		Extra = PreSim:Connect(function()
			if not Figure and Figure.Parent then Extra:Disconnect() end
			if (not TestService:FindFirstChild("ScriptCheck")) or Figure:FindFirstChild("AnimPlayer") then
				Highlight.Transparency = 1
			else
				Highlight.Transparency = 0
			end
		end)
	end
end

-- Collide Fling
if CollideFling == true then
	if R15 == false then
		local Torso = Character:FindFirstChild("Torso")
		if PermanentDeath == true then
			IGNORETORSOCHECK = "adfasdkogpasdfjopghsfdjofipsdjghsfopgjospadgjsaj"
			task.spawn(function()
				Wait(1)
				local BodyAngularVelocity = INew("BodyAngularVelocity")
				BodyAngularVelocity.MaxTorque = V3new(1,1,1) * Infinite
				BodyAngularVelocity.P = math.huge
				BodyAngularVelocity.AngularVelocity = V3new(1950,1950,1950)
				BodyAngularVelocity.Name = "TorsoFlinger"
				BodyAngularVelocity.Parent = Character:FindFirstChild("HumanoidRootPart")
			end)
		else
			TorsoFlingEvent = PostSim:Connect(function()
				if FigureHum.MoveDirection.Magnitude < 0.1 then
					Torso.Velocity = Velocity
				elseif FigureHum.MoveDirection.Magnitude > 0.1 then
					Torso.Velocity = V3new(1250,1250,1250)+Velocity
				end
			end)
		end
	else
		local Torso = Character:FindFirstChild("UpperTorso")
		TorsoFlingEvent = PostSim:Connect(function()
			if FigureHum.MoveDirection.Magnitude < 0.1 then
				Torso.RotVelocity = V3new()
			elseif FigureHum.MoveDirection.Magnitude > 0.1 then
				Torso.RotVelocity = V3new(2500,2500,2500)
			end
		end)
	end
end

local FallHeight = Workspace.FallenPartsDestroyHeight
local function MiniRandom() return "0." .. MathRandom(6, 8) .. MathRandom(1, 9) .. MathRandom(1, 9) end
PreSimEvent = PreSim:Connect(function() -- Noclip
	local AntiVoidOffset = Global.GelatekHubConfig["Anti Void Offset"] or 75
	if Figure.HumanoidRootPart.Position.Y <= FallHeight + AntiVoidOffset then VoidEvent() end
	for _,v in pairs(CharacterChildren) do
		if v:IsA("BasePart") then
			v.CanCollide = false
		end
	end
	
	if not Collisions then
		for _,v in pairs(FigureDescendants) do
			if v:IsA("BasePart") then
				v.CanCollide = false
			end
		end
	end
end)

for i,v in pairs(Character:GetDescendants()) do -- Break Joints
	if v:IsA("Motor6D") and v.Name ~= "Neck" then
		v:Destroy()
	end
end

for i,v in pairs(Character:GetChildren()) do
	if v:IsA("Accessory") then
		local Attachment = v.Handle:FindFirstChildWhichIsA("Attachment")
		if KeepHairWelds == true and Attachment.Name ~= "HatAttachment" and Attachment.Name ~= "FaceFrontAttachment" and Attachment.Name ~= "HairAttachment" and Attachment.Name ~= "FaceCenterAttachment" then
			v.Handle:BreakJoints()
		end
		if KeepHairWelds == false or PermanentDeath == true then -- Overwrites the check if perma is on
			v.Handle:BreakJoints()
		end
	end
end

local function Align(Part0, Part1, Offset)
	local CFOffset = Offset or CF0
	local OwnerShip = Part0:FindFirstChild("ClaimCheck")
	if Is_NetworkOwner(Part0) == true then
		if OwnerShip then OwnerShip.Transparency = 1 end
		if (CollideFling and Part0.Name ~= IGNORETORSOCHECK) or not CollideFling then 
			Part0.AssemblyLinearVelocity = V3new(MathRandom(-2,2), -30 - MiniRandom(), MathRandom(-2,2)) + FigureHum.MoveDirection * (Part0.Mass * 10)
		end
		if (CollideFling and Part0.Name ~= "HumanoidRootPart") or not CollideFling then Part0.RotVelocity = Part1.RotVelocity end
		Part0.CFrame = Part1.CFrame * CFOffset * CFNew(0.0085 * Cos(Clock() * 10), 0.0085 * Sin(Clock() * 10), 0)
	else
		if OwnerShip then OwnerShip.Transparency = 0 end
	end
end

local Offsets;
if not R15 then 
	Offsets = {
		["HumanoidRootPart"] = {Figure:FindFirstChild("HumanoidRootPart"), CF0},
		["Torso"] = {Figure:FindFirstChild("Torso"), CF0},
		["Right Arm"] = {Figure:FindFirstChild("Right Arm"), CF0},
		["Left Arm"] = {Figure:FindFirstChild("Left Arm"), CF0},
		["Right Leg"] = {Figure:FindFirstChild("Right Leg"), CF0},
		["Left Leg"] = {Figure:FindFirstChild("Left Leg"), CF0},
	}
else 
	Offsets = {
		["UpperTorso"] = {Figure:FindFirstChild("Torso"), CFNew(0, 0.194, 0)},
		["LowerTorso"] = {Figure:FindFirstChild("Torso"), CFNew(0, -0.79, 0)},
		["HumanoidRootPart"] = {Character:FindFirstChild("UpperTorso"), CF0},
		
		["RightUpperArm"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, 0.4085, 0)},
		["RightLowerArm"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, -0.184, 0)},
		["RightHand"] = {Figure:FindFirstChild("Right Arm"), CFNew(0, -0.83, 0)},

		["LeftUpperArm"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, 0.4085, 0)},
		["LeftLowerArm"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, -0.184, 0)},
		["LeftHand"] = {Figure:FindFirstChild("Left Arm"), CFNew(0, -0.83, 0)},

		["RightUpperLeg"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, 0.575, 0)},
		["RightLowerLeg"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, -0.199, 0)},
		["RightFoot"] = {Figure:FindFirstChild("Right Leg"), CFNew(0, -0.849, 0)},

		["LeftUpperLeg"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, 0.575, 0)},
		["LeftLowerLeg"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, -0.199, 0)},
		["LeftFoot"] = {Figure:FindFirstChild("Left Leg"), CFNew(0, -0.849, 0)}
	}
end

local PostSimEvent = PostSim:Connect(function()
	for i,v in pairs(Offsets) do -- Body Align [2]
		if Character:FindFirstChild(i) then
			Align(Character:FindFirstChild(i), v[1], v[2])
		end
	end
	for i,v in pairs(CharacterChildren) do
		if v:IsA("Accessory") then
			if (HatData and v.Name ~= HatData[1].Name) or not HatData then
				Align(v.Handle, Figure[v.Name].Handle)
			end
		end
	end
	if HatData then
		Align(HatData[1].Handle, HatData[2], HatData[3])
	end
	if BulletInfo then
		BulletInfo[1].Velocity = Velocity
		if Global.PartDisconnected == false then
			Align(BulletInfo[1], BulletInfo[2], BulletInfo[3])
		end
	end
end)

-- Permanent Death
if PermanentDeath then
	task.spawn(function()
		Wait(game:FindFirstChildWhichIsA("Players").RespawnTime + 0.5)
		if HeadlessPerma == true then
			Character:FindFirstChild("Head"):Remove()
		else
			Character:FindFirstChild("Head"):BreakJoints()
			Offsets["Head"] = {Figure:FindFirstChild("Head"), CF0}
		end
	end)
end


-- Ending Process
Global.RealChar = Character	
Character.Parent = Figure
Player.Character = Figure
CurrentCam.CameraSubject = FigureHum

DeathEvent = FigureHum.Died:Connect(function()
	if PostSimEvent then PostSimEvent:Disconnect() end
	if PreSimEvent then PreSimEvent:Disconnect() end
	if DeathEvent then DeathEvent:Disconnect() end
	if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
	if ResetEvent then ResetEvent:Disconnect() end
	if FakeHats then FakeHats:Destroy() end
	for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
	pcall(function()
		CurrentCam.FieldOfView = 70
		Global.Stopped = true
		Character.Parent = Workspace
		Player.Character = Workspace[Character.Name]
		Humanoid:ChangeState(15)
		if Figure then Figure:Destroy() end
		if TestService:FindFirstChild("ScriptCheck") then
			TestService:FindFirstChild("ScriptCheck"):Destroy()
		end
		Wait(0.125)
		Global.RealChar = nil
		Global.Stopped = false
	end)
end)

ResetEvent = Character:GetPropertyChangedSignal("Parent"):Connect(function(Parent)
	if Parent == nil then
		if PostSimEvent then PostSimEvent:Disconnect() end
		if PreSimEvent then PreSimEvent:Disconnect() end
		if DeathEvent then DeathEvent:Disconnect() end
		if TorsoFlingEvent then TorsoFlingEvent:Disconnect() end
		if ResetEvent then ResetEvent:Disconnect() end
		if FakeHats then FakeHats:Destroy() end
		for i,v in pairs(Global.TableOfEvents) do v:Disconnect() end
		pcall(function()
			if Figure then Figure:Destroy() end
			CurrentCam.FieldOfView = 70
			Global.RealChar = nil
			Global.Stopped = true
			if TestService:FindFirstChild("ScriptCheck") then TestService:FindFirstChild("ScriptCheck"):Destroy() end
			Wait(0.125)
			Global.Stopped = false
		end)
	end
end)

Warn("Reanimated in " .. string.sub(tostring(tick()-Speed),1,string.find(tostring(tick()-Speed),".")+5))


local getsynasset = getsynasset or getcustomasset or function() warn("no getcustomasset/getsynasset") end
local Events = Global.TableOfEvents
--Global.AntiScript()
-- its funny how i turned a SS script with like 40 instances into 1 signle file
local PLAYER = game:GetService("Players").LocalPlayer
local CHARACTER = PLAYER.Character
local HUM = CHARACTER.Humanoid

local ROOT = CHARACTER.HumanoidRootPart
local HEAD = CHARACTER.Head
local TORSO = CHARACTER.Torso
local RIGHTARM = CHARACTER["Right Arm"]
local LEFTARM = CHARACTER["Left Arm"]
local RIGHTLEG = CHARACTER["Right Leg"]
local LEFTLEG = CHARACTER["Left Leg"]
local ROOTJOINT = ROOT["RootJoint"]
local NECK = TORSO["Neck"]
local RIGHTSHOULDER = TORSO["Right Shoulder"]
local LEFTSHOULDER = TORSO["Left Shoulder"]
local RIGHTHIP = TORSO["Right Hip"]
local LEFTHIP = TORSO["Left Hip"]
local MOUSEPOS = ROOT.Position

IT = Instance.new
CF = CFrame.new
VT = Vector3.new
RAD = math.rad
C3 = Color3.new
UD2 = UDim2.new
BRICKC = BrickColor.new
ANGLES = CFrame.Angles
EULER = CFrame.fromEulerAnglesXYZ
COS = math.cos
ACOS = math.acos
SIN = math.sin
ASIN = math.asin
ABS = math.abs
MRANDOM = math.random
FLOOR = math.floor

--//====================================================\\--
--||                       FE CODE
--\\====================================================//--
Mouse,mouse,UserInputService,ToolFunction,GuiWire,RenderStepped,Player=PLAYER:GetMouse(),PLAYER:GetMouse(),game:GetService("UserInputService"),nil,nil,game:GetService("RunService").RenderStepped,PLAYER
--------------------------------------------------------------
--//====================================================\\--
--||                  BACKGROUND VALUES
--\\====================================================//--

local ANIM_SPEED = 3
local MOUSE = Mouse
local FRAME_SPEED = 1 / 60 -- (1 / 30) OR (1 / 60)
local CHANGE = 2 / ANIM_SPEED
local DAMAGEMULTIPLIER = 1
local ANIM = "Idle"
local KEYHOLD = false
local MOUSEHOLD = false
local SINE = 0
local ATTACKING = false
local Debris = game:GetService("Debris")
local Effects = IT("Folder",CHARACTER)
Effects.Name = "FXFolder"
local ROOTC0 = CF(0, 0, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local NECKC0 = CF(0, 1, 0) * ANGLES(RAD(-90), RAD(0), RAD(180))
local RIGHTSHOULDERC0 = CF(-0.5, 0, 0) * ANGLES(RAD(0), RAD(90), RAD(0))
local LEFTSHOULDERC0 = CF(0.5, 0, 0) * ANGLES(RAD(0), RAD(-90), RAD(0))

--//====================================================\\--
--||                     HEARTBEAT
--\\====================================================//--

ArtificialHB = Instance.new("BindableEvent", script)
ArtificialHB.Name = "ArtificialHB"

script:WaitForChild("ArtificialHB")

frame = FRAME_SPEED
tf = 0
allowframeloss = false
tossremainder = false
lastframe = tick()
script.ArtificialHB:Fire()

table.insert(Events, game:GetService("RunService").Heartbeat:connect(function(s, p)
	tf = tf + s
	if tf >= frame then
		if allowframeloss then
			ArtificialHB:Fire()
			lastframe = tick()
		else
			for i = 1, math.floor(tf / frame) do
				ArtificialHB:Fire()
			end
			lastframe = tick()
		end
		if tossremainder then
			tf = 0
		else
			tf = tf - frame * math.floor(tf / frame)
		end
	end
end))

function PositiveAngle(NUMBER)
	if NUMBER >= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function NegativeAngle(NUMBER)
	if NUMBER <= 0 then
		NUMBER = 0
	end
	return NUMBER
end

function Swait(NUMBER)
	if NUMBER == 0 or NUMBER == nil then
		ArtificialHB.Event:wait()
	else
		for i = 1, NUMBER do
			ArtificialHB.Event:wait()
		end
	end
end

--//====================================================\\--
--||                       CLERP
--\\====================================================//--

function QuaternionFromCFrame(cf)
	local mx, my, mz, m00, m01, m02, m10, m11, m12, m20, m21, m22 = cf:components()
	local trace = m00 + m11 + m22
	if trace > 0 then 
		local s = math.sqrt(1 + trace)
		local recip = 0.5 / s
		return (m21 - m12) * recip, (m02 - m20) * recip, (m10 - m01) * recip, s * 0.5
	else
		local i = 0
		if m11 > m00 then
			i = 1
		end
		if m22 > (i == 0 and m00 or m11) then
			i = 2
		end
		if i == 0 then
			local s = math.sqrt(m00 - m11 - m22 + 1)
			local recip = 0.5 / s
			return 0.5 * s, (m10 + m01) * recip, (m20 + m02) * recip, (m21 - m12) * recip
		elseif i == 1 then
			local s = math.sqrt(m11 - m22 - m00 + 1)
			local recip = 0.5 / s
			return (m01 + m10) * recip, 0.5 * s, (m21 + m12) * recip, (m02 - m20) * recip
		elseif i == 2 then
			local s = math.sqrt(m22 - m00 - m11 + 1)
			local recip = 0.5 / s return (m02 + m20) * recip, (m12 + m21) * recip, 0.5 * s, (m10 - m01) * recip
		end
	end
end

function QuaternionToCFrame(px, py, pz, x, y, z, w)
	local xs, ys, zs = x + x, y + y, z + z
	local wx, wy, wz = w * xs, w * ys, w * zs
	local xx = x * xs
	local xy = x * ys
	local xz = x * zs
	local yy = y * ys
	local yz = y * zs
	local zz = z * zs
	return CFrame.new(px, py, pz, 1 - (yy + zz), xy - wz, xz + wy, xy + wz, 1 - (xx + zz), yz - wx, xz - wy, yz + wx, 1 - (xx + yy))
end

function QuaternionSlerp(a, b, t)
	local cosTheta = a[1] * b[1] + a[2] * b[2] + a[3] * b[3] + a[4] * b[4]
	local startInterp, finishInterp;
	if cosTheta >= 0.0001 then
		if (1 - cosTheta) > 0.0001 then
			local theta = ACOS(cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((1 - t) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = 1 - t
			finishInterp = t
		end
	else
		if (1 + cosTheta) > 0.0001 then
			local theta = ACOS(-cosTheta)
			local invSinTheta = 1 / SIN(theta)
			startInterp = SIN((t - 1) * theta) * invSinTheta
			finishInterp = SIN(t * theta) * invSinTheta
		else
			startInterp = t - 1
			finishInterp = t
		end
	end
	return a[1] * startInterp + b[1] * finishInterp, a[2] * startInterp + b[2] * finishInterp, a[3] * startInterp + b[3] * finishInterp, a[4] * startInterp + b[4] * finishInterp
end

function Clerp(a, b, t)
	local qa = {QuaternionFromCFrame(a)}
	local qb = {QuaternionFromCFrame(b)}
	local ax, ay, az = a.x, a.y, a.z
	local bx, by, bz = b.x, b.y, b.z
	local _t = 1 - t
	return QuaternionToCFrame(_t * ax + t * bx, _t * ay + t * by, _t * az + t * bz, QuaternionSlerp(qa, qb, t))
end

--//====================================================\\--
--||                     FUNCTIONS
--\\====================================================//--

function WeldParts(A,B)
	local WLD = IT("ManualWeld")
	WLD.Part0 = A
	WLD.Part1 = B
	WLD.C1 = B.CFrame:inverse() * A.CFrame
	WLD.Parent = A
	return WLD
end

--NewSound({ID = 0,PARENT = ROOT,VOLUME = 0.5,PITCH = 1,LOOP = false,MAXDISTANCE = 1000,EMITTERSIZE = 10,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
function NewSound(TABLE)
	local ID = "rbxassetid://"..(TABLE.ID or 0)
	local PARENT = (TABLE.PARENT or ROOT)
	local VOLUME = (TABLE.VOLUME or 0.5)
	local PITCH = (TABLE.PITCH or 1)
	local LOOP = (TABLE.LOOP or false)
	local MAXDISTANCE = (TABLE.MAXDISTANCE or 100)
	local EMITTERSIZE = (TABLE.EMITTERSIZE or 10)
	local PLAYING = (TABLE.PLAYING or true)
	local PLAYONREMOVE = (TABLE.PLAYONREMOVE or false)
	local DOESDEBRIS = (TABLE.DOESDEBRIS or true)
	if ID ~= "rbxassetid://0" then
		local SOUND = IT("Sound",PARENT)
		SOUND.SoundId = ID
		SOUND.Volume = VOLUME
		SOUND.Pitch = PITCH
		SOUND.Looped = LOOP
		SOUND.MaxDistance = MAXDISTANCE
		SOUND.EmitterSize = EMITTERSIZE
		SOUND.PlayOnRemove = PLAYONREMOVE
		if DOESDEBRIS == true and PLAYING == true and LOOP == false then
			Debris:AddItem(SOUND,SOUND.TimeLength+5)
		end
		if PLAYING == true then
			SOUND:Play()
		end
		return SOUND
	end
end

function OofOuchBlood(LOCATION,TO,AMOUNT)
	local P = CreatePart(3, Effects, "Granite", 0, 1, BRICKC("Pearl"), "Blood", VT(0,0,0), true)
	P.CFrame = CF(LOCATION,TO)
	local BLOOD = Instance.new("ParticleEmitter")
	BLOOD.Name = "Blood"
	BLOOD.Speed = NumberRange.new(10, 35)
	BLOOD.Rotation = NumberRange.new(0, 360)
	BLOOD.Color = ColorSequence.new(Color3.new(1, 0, 0),Color3.new(0.490196, 0.0156863, 0.0156863))
	BLOOD.Enabled = false
	BLOOD.LightEmission = 0.5
	BLOOD.Texture = "rbxassetid://387288028"
	BLOOD.Transparency = NumberSequence.new(0.4375,0.7472527027130127,0.8626373410224915,0.9450549483299255,1)
	BLOOD.Size = NumberSequence.new(0,1.187499761581421,1.3124996423721313,1.4375001192092896,2.249999523162842,3.125,4.625)
	BLOOD.Acceleration = Vector3.new(0, -35, 0)
	BLOOD.Drag = 5
	BLOOD.EmissionDirection = Enum.NormalId.Front
	BLOOD.Lifetime = NumberRange.new(1, 2)
	BLOOD.Rate = 999
	BLOOD.RotSpeed = NumberRange.new(-5, 5)
	BLOOD.SpreadAngle = Vector2.new(35, 35)
	BLOOD.VelocitySpread = 35
	BLOOD.Parent = P
	BLOOD:Emit(AMOUNT)
	Debris:AddItem(P,2)
end

function CreateMesh(MESH, PARENT, MESHTYPE, MESHID, TEXTUREID, SCALE, OFFSET)
	local NEWMESH = IT(MESH)
	if MESH == "SpecialMesh" then
		NEWMESH.MeshType = MESHTYPE
		if MESHID ~= "nil" and MESHID ~= "" then
			NEWMESH.MeshId = "http://www.roblox.com/asset/?id="..MESHID
		end
		if TEXTUREID ~= "nil" and TEXTUREID ~= "" then
			NEWMESH.TextureId = "http://www.roblox.com/asset/?id="..TEXTUREID
		end
	end
	NEWMESH.Offset = OFFSET or VT(0, 0, 0)
	NEWMESH.Scale = SCALE
	NEWMESH.Parent = PARENT
	return NEWMESH
end

function CreatePart(FORMFACTOR, PARENT, MATERIAL, REFLECTANCE, TRANSPARENCY, BRICKCOLOR, NAME, SIZE, ANCHOR)
	local NEWPART = IT("Part")
	NEWPART.formFactor = FORMFACTOR
	NEWPART.Reflectance = REFLECTANCE
	NEWPART.Transparency = TRANSPARENCY
	NEWPART.CanCollide = false
	NEWPART.Locked = true
	NEWPART.Anchored = true
	if ANCHOR == false then
		NEWPART.Anchored = false
	end
	NEWPART.BrickColor = BRICKC(tostring(BRICKCOLOR))
	NEWPART.Name = NAME
	NEWPART.Size = SIZE
	NEWPART.Position = ROOT.Position
	NEWPART.Material = MATERIAL
	NEWPART:BreakJoints()
	NEWPART.Parent = PARENT
	return NEWPART
end

function Raycast(POSITION, DIRECTION, RANGE, TABLE)
	local TABLE = ((type(TABLE) == "table" and TABLE) or {TABLE})
	return game:GetService("Workspace"):FindPartOnRayWithIgnoreList(Ray.new(POSITION, DIRECTION * RANGE), TABLE)
end

function CameraShake(AREA,RANGE,SHAKE,TIMER)
	for index, CHILD in pairs(workspace:GetChildren()) do
		if CHILD:FindFirstChildOfClass("Humanoid") then
			local HUMAN = CHILD:FindFirstChildOfClass("Humanoid")
			local ROOT = HUMAN.Torso
			if ROOT and game.Players:GetPlayerFromCharacter(CHILD) then
				if (ROOT.Position - AREA).Magnitude <= RANGE then
					if CHILD:FindFirstChild("CamShake") then
						Debris:AddItem(CHILD:FindFirstChild("CamShake"),0.05)
					end
					local CAMSHAKE = script.CamShake:Clone()
					CAMSHAKE.Parent = CHILD
					local TIMER_V = IT("NumberValue",CAMSHAKE)
					TIMER_V.Name = "Timer"
					TIMER_V.Value = TIMER
					local SHAKE_V = IT("NumberValue",CAMSHAKE)
					SHAKE_V.Name = "Shake"
					SHAKE_V.Value = SHAKE
					CAMSHAKE.Disabled = false
					Debris:AddItem(CAMSHAKE,15)
				end
			end
		end
	end
end

--Debree({Delay = 1.5,Variant = "",Location = ROOT.Position,Color = C3(1,1,1),Size = 1,Distance = 1,Material = "Slate",Scatter = 1,Amount = 1,DebreeCount = 1})
function Debree(Table)
	local KindOf = (Table.Variant or "Ring")
	local Position = (Table.Location or ROOT.Position)
	local Coloration = (Table.Color or C3(1,1,1))
	local Texture = (Table.Material or "Slate")
	local Fling = (Table.Scatter or 1)
	local Number = (Table.Amount or 1)
	local Rocks = (Table.DebreeCount or 1)
	local Range = (Table.Distance or 1)
	local Scale = (Table.Size or 1)
	local Timer = (Table.Delay or 1.5)
	coroutine.resume(coroutine.create(function()
		local ScaleVector = VT(Scale,Scale,Scale)
		local Boulders = {}
		Position = CF(Position)
		if KindOf == "Ring" or KindOf == "Both" then
			for RockValue = 1, Number do
				local LOCATION = Position * ANGLES(RAD(0), RAD((360/Number)*RockValue), RAD(0))*CF(0,MRANDOM(-math.ceil(Scale/4),math.ceil(Scale/4)),Range)
				local BOULDER = CreatePart(3, workspace, Texture, 0, 0, BRICKC("Pearl"), "Debree", ScaleVector, true)
				BOULDER.CanCollide = true
				BOULDER.CFrame = LOCATION*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				BOULDER.Color = Coloration
				table.insert(Boulders,BOULDER)
			end
		end
		if KindOf == "Loose" or KindOf == "Both" then
			for RockValue = 1, Rocks do
				local LOCATION = Position * ANGLES(RAD(0), RAD((360/Number)*RockValue), RAD(0))*CF(0,MRANDOM(-math.ceil(Scale-(Scale/2)),math.ceil(Scale-(Scale/2))),0.7)
				local BOULDER = CreatePart(3, workspace, Texture, 0, 0, BRICKC("Pearl"), "Debree", ScaleVector, false)
				BOULDER.CanCollide = true
				BOULDER.CFrame = LOCATION*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				BOULDER.Velocity = CF(BOULDER.Position-VT(0,4,0),BOULDER.CFrame*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))*CF(0,5,0).p).lookVector*MRANDOM(Fling-(Fling/1.5),Fling+(Fling/1.5))
				BOULDER.Color = Coloration
				table.insert(Boulders,BOULDER)
			end
		end
		if KindOf == "Random" then
			for RockValue = 1, Number do
				local LOCATION = Position * ANGLES(RAD(0), RAD((360/Number)*RockValue), RAD(0))*CF(0,MRANDOM(-math.ceil(Scale/4),math.ceil(Scale/4)),MRANDOM(0,Range))
				local BOULDER = CreatePart(3, workspace, Texture, 0, 0, BRICKC("Pearl"), "Debree", ScaleVector, true)
				BOULDER.CanCollide = true
				BOULDER.CFrame = LOCATION*ANGLES(RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)),RAD(MRANDOM(0,360)))
				BOULDER.Color = Coloration
				table.insert(Boulders,BOULDER)
			end
		end
		wait(Timer)
		for E = 1, 45 do
			Swait()
			for A = 1, #Boulders do
				Boulders[A].Transparency = Boulders[A].Transparency + 1/45
			end
		end
		for A = 1, #Boulders do
			Boulders[A]:Destroy()
		end
	end))
end

function Chatter(Text,Timer)
	local chat = coroutine.wrap(function()
		if CHARACTER:FindFirstChild("SpeechBoard")~= nil then
			CHARACTER:FindFirstChild("SpeechBoard"):destroy()
		end
		local naeeym2 = IT("BillboardGui",CHARACTER)
		naeeym2.Size = UD2(0,100,0,40)
		naeeym2.StudsOffset = Vector3.new(0,2,0)
		naeeym2.Adornee = HEAD
		naeeym2.Name = "SpeechBoard"
		naeeym2.AlwaysOnTop = true
		local tecks2 = IT("TextLabel",naeeym2)
		tecks2.BackgroundTransparency = 1
		tecks2.BorderSizePixel = 0
		tecks2.Text = ""
		tecks2.Font = "Legacy"
		tecks2.TextSize = 15
		tecks2.TextStrokeTransparency = 0
		tecks2.TextColor3 = Color3.new(1,1,1)
		tecks2.TextStrokeColor3 = Color3.new(0,0,0)
		tecks2.Size = UDim2.new(1,0,0.5,0)
		for i = 1,string.len(Text),1 do
			if naeeym2.Parent ~= CHARACTER then 
				break
			end
			NewSound({ID = 418252437,PARENT = HEAD,VOLUME = 1,PITCH = MRANDOM(8,12)/10,LOOP = false,MAXDISTANCE = 75,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			tecks2.Text = string.sub(Text,1,i)
			wait(Timer)
		end
		wait(1)
		naeeym2:Destroy()
	end)
	chat()
end

function SpawnPuddle(POSITION,IGNR,GOO)
	local HIT,POS,NOR = Raycast(POSITION, CFrame.new(POSITION,POSITION-Vector3.new(0,1,0)).lookVector, 12, {IGNR,CHARACTER})
	if HIT then
		coroutine.resume(coroutine.create(function()
			local GOREPART = CreatePart(3, Effects, "Slate", 0, 1, "Pearl", "Gore", VT(3,0,3), true)
			local SURFACE = script.PuddleSurface:Clone()
			SURFACE.Parent = GOREPART
			if GOO == true then
				SURFACE.Image.ImageColor3 = C3(0,0,0)
			end
			GOREPART.CFrame = CFrame.new(POS,POS+NOR)*CFrame.Angles(math.rad(-90),math.rad(math.random(0,360)),0)
			for i = 1, math.random(25,65) do
				Swait()
				GOREPART.Size = GOREPART.Size + Vector3.new(0.1,0,0.1)
			end
			wait(math.random(10,25)/50)
			for i = 1, 25 do
				Swait()
				SURFACE.Image.ImageTransparency = SURFACE.Image.ImageTransparency + 1/25
			end
			GOREPART:Remove()
		end))
	end
end

function Dismember(MAN,DOWHAT)
	if DOWHAT == "Ragdoll" then
		local HUM = MAN:FindFirstChildOfClass("Humanoid")
		if HUM then

		end
	else
		local TORSO = MAN:FindFirstChild("Torso") or MAN:FindFirstChild("UpperTorso")
		local HED = MAN:FindFirstChild("Head")
		if TORSO and HED then
			
		end
	end
end

function Speak(ID)
	local S = NewSound({ID = ID,PARENT = HEAD,VOLUME = 6,PITCH = 1,LOOP = false,MAXDISTANCE = 300,EMITTERSIZE = 35,PLAYING = false,PLAYONREMOVE = false,DOESDEBRIS = true})
	script.ChorusSoundEffect:Clone().Parent = S
	script.Pitch:Clone().Parent = S
	S:Play()
	Debris:AddItem(S,S.TimeLength+5)
end

--//====================================================\\--
--||                     CHARACTER
--\\====================================================//--

local ARMOR = IT("Model",CHARACTER)
ARMOR.Name = "Goner"
HEAD.Size = VT(1,1,1)
NECK.Parent = TORSO
local PARTS = {}
local BITSS = {}
for index, CHILD in pairs(CHARACTER:GetChildren()) do
	if CHILD:IsA("BasePart") then
		BITS = Instance.new("ParticleEmitter")
		BITS.Name = "Bits"
		BITS.Speed = NumberRange.new(0, 0)
		BITS.Rotation = NumberRange.new(0, 359)
		BITS.Color = ColorSequence.new(Color3.new(0.0901961, 0.0862745, 0.156863),Color3.new(0.0901961, 0.0862745, 0.156863))
		BITS.Texture = "rbxasset://textures/particles/fire_main.dds"
		BITS.Transparency = NumberSequence.new(1,0.6593406200408936,0.39560437202453613,0.2252746820449829,0.23076921701431274,0.43406593799591064,1)
		BITS.ZOffset = -1
		BITS.Size = NumberSequence.new(0.12499988079071045,0)
		BITS.Acceleration = Vector3.new(0, 5, 0)
		BITS.Lifetime = NumberRange.new(0.20000000298023224, 1)
		BITS.Rate = 65
		BITS.RotSpeed = NumberRange.new(-25, 25)
		BITS.Parent = CHILD
		BITS.Enabled = true
		table.insert(BITSS, BITS)
	end
end
for _, c in pairs(CHARACTER:GetDescendants()) do
	if c:IsA("BasePart") then
		c.Locked = false
	end
end
local SWORD = Instance.new("Part", CHARACTER); do
	pcall(function()
		SWORD.CastShadow = true
		SWORD.Color = Color3.fromRGB(0,0,0)
		SWORD.Material = Enum.Material.Slate
		SWORD.Size = Vector3.new(2, 5.925, 0.25)
		SWORD.CanCollide = false
		SWORD.CanQuery = true
		SWORD.CanTouch = true
		SWORD.Massless = true
	end)
	local Mesh = Instance.new("SpecialMesh", SWORD)
	Mesh.MeshId = "rbxassetid://500489601"
	Mesh.Scale = Vector3.new(0.01,0.01,0.01)
end

local Attachment1 = Instance.new("Attachment")
Attachment1.Position = Vector3.new(-0.2, 2.55, 0)
Attachment1.Parent = SWORD
local Attachment2 = Instance.new("Attachment")
Attachment2.Position = Vector3.new(-0.3, -0.65, 0)
Attachment2.Parent = SWORD

local GRIPC0 = CF(0,-0.9,0)*ANGLES(RAD(90),RAD(90),0)
local HOLD = IT("ManualWeld")
HOLD.Part0 = RIGHTARM
HOLD.Part1 = SWORD
HOLD.C0 = GRIPC0
HOLD.C1 = CF(0,-SWORD.Size.Y/3,0)
HOLD.Parent = RIGHTARM
HOLD.Name = "GripWeld"
local TRAIL = Instance.new("Trail"); do
	pcall(function()
		TRAIL.Attachment0 = Attachment1
		TRAIL.Attachment1 = Attachment2
		TRAIL.Color = ColorSequence.new(Color3.new(0.745098, 0, 0.0117647),Color3.new(0, 0, 0))
		TRAIL.Enabled = false
		TRAIL.Texture = "rbxassetid://1978704853"
		TRAIL.TextureLength = 0.625
		TRAIL.Transparency = NumberSequence.new(0,1)
		TRAIL.MinLength = 0
		TRAIL.Lifetime = 0.23000000417232513
		TRAIL.WidthScale = NumberSequence.new(2,2)
		TRAIL.Parent = SWORD
	end)
end
local Hat = CHARACTER:FindFirstChild("K2")
local Bullet = Global.RealChar:FindFirstChild("Bullet")
if Hat then
	SWORD.Transparency = 1
	Hat.Handle:BreakJoints()
	Global.AlignPart(Hat.Handle,SWORD, Vector3.new(0,-0.5,0), Vector3.new(-0, 0, -117))
end
if Bullet then
	if Bullet:FindFirstChild("AntiRotate") then
		Bullet:FindFirstChild("AntiRotate"):Destroy()
	end
	Global.PartDisconnected = true
	local Mouse = game:GetService("Players").LocalPlayer:GetMouse()
	local RootTo = SWORD
	if Hat then
		RootTo = Hat.Handle
	end
	local Pos = Instance.new("BodyPosition")
	Pos.MaxForce = Vector3.new(1,1,1)*math.huge
	Pos.P = 25000
	Pos.D = 125
	Pos.Name = "Movement"
	Pos.Position = Bullet.Position
	Pos.Parent = Bullet
	local Flinger = Instance.new("BodyAngularVelocity")
	Flinger.MaxTorque = Vector3.new(1,1,1)*math.huge
	Flinger.P = math.huge
	Flinger.AngularVelocity = Vector3.new(5000,5000,5000)
	Flinger.Name = "Flinger"
	Flinger.Parent = Bullet
	table.insert(Events, game:GetService("RunService").PostSimulation:Connect(function()
		Pos.Position = RootTo.Position
	end))
end
local SOUND_SNAP = 150315649
local SUBMERGED = false
table.insert(PARTS,SWORD)

--//====================================================\\--
--||                     ABILITIES
--\\====================================================//--

function Slash()
	ATTACKING = true
	for i=0, 0.2, 0.1 / ANIM_SPEED do
		Swait()
		ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-10)), 1.5 / ANIM_SPEED)
		NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
		RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(90)) * ANGLES(RAD(25), RAD(180), RAD(0)) * RIGHTSHOULDERC0, 2 / ANIM_SPEED)
		HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)), 2 / ANIM_SPEED)
		LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-5), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
		RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
		LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
	end
	TRAIL.Enabled = true
	NewSound({ID = 211059653,PARENT = SWORD,VOLUME = 2,PITCH = 0.7,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
	for i=0, 0.1, 0.1 / ANIM_SPEED do
		Swait()
		ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 1.5 / ANIM_SPEED)
		NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(-10)), 1.5 / ANIM_SPEED)
		RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.1, 0.5, -0.85) * ANGLES(RAD(0), RAD(0), RAD(-90)) * RIGHTSHOULDERC0, 0.65 / ANIM_SPEED)
		HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)), 0.75 / ANIM_SPEED)
		LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(-5), RAD(-10), RAD(20)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
		RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
		LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-60), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
	end
	for index, CHILD in pairs(workspace:GetChildren()) do
		if CHILD:FindFirstChildOfClass("Humanoid") and CHILD ~= CHARACTER then
			local HUMAN = CHILD:FindFirstChildOfClass("Humanoid")
			local ROOT2 = HUMAN.Torso
			if ROOT2 and HUMAN.Health > 0 then
				if (ROOT2.Position - ROOT.CFrame*CF(0,0,-2).p).Magnitude < 4.5 then
					local HEAD = CHILD:FindFirstChild("Head")
					if HEAD then
						local FACE = HEAD:FindFirstChild("face")
						if FACE then
							FACE.Texture = "http://www.roblox.com/asset/?id=145854465"
							FACE.Transparency = 0.5
						end
					end
					Dismember(CHILD,"Ragdoll")
					Dismember(CHILD,"Head")
					NewSound({ID = 264486467,PARENT = ROOT2,VOLUME = 2,PITCH = 0.7,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
					NewSound({ID = SOUND_SNAP,PARENT = ROOT2,VOLUME = 6,PITCH = 1,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
					for i = 1, 7 do
						OofOuchBlood(ROOT2.Position,CF(ROOT2.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,1,-1).p,45)
					end
					coroutine.resume(coroutine.create(function()
						for i = 1, 25 do
							SpawnPuddle(ROOT2.Position,CHILD,false)
							Swait()
						end
					end))
				end
			end
		end
	end
	for i=0, 0.3, 0.1 / ANIM_SPEED do
		Swait()
		ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 1.5 / ANIM_SPEED)
		NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(-10)), 1.5 / ANIM_SPEED)
		RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.1, 0.5, -0.85) * ANGLES(RAD(0), RAD(0), RAD(-90)) * RIGHTSHOULDERC0, 0.65 / ANIM_SPEED)
		HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)), 0.75 / ANIM_SPEED)
		LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(-5), RAD(-10), RAD(20)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
		RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
		LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-60), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
	end
	TRAIL.Enabled = false
	ATTACKING = false
end

function Execute(INPUT)
	local TARGET = nil
	local DIST = 6
	for index, CHILD in pairs(workspace:GetChildren()) do
		if CHILD:FindFirstChildOfClass("Humanoid") and CHILD ~= CHARACTER then
			local HUMAN = CHILD:FindFirstChildOfClass("Humanoid")
			local ROOT2 = HUMAN.Torso
			if ROOT2 and HUMAN.Health > 0 then
				if (ROOT2.Position - ROOT.Position).Magnitude < DIST then
					TARGET = CHILD
					DIST = (ROOT2.Position - ROOT.Position).Magnitude
				end
			end
		end
	end
	if TARGET and (SUBMERGED == false or ((INPUT == "x" or INPUT == "z" or INPUT == "c") and SUBMERGED == true)) then
		local DedFace = function()
			local HEAD = TARGET:FindFirstChild("Head")
			if HEAD then
				local FACE = HEAD:FindFirstChild("face")
				if FACE then
					FACE.Texture = "http://www.roblox.com/asset/?id=145854465"
					FACE.Transparency = 0.5
				end
			end
		end
		local TARGETSTATIC = nil
		if game:GetService("Players"):GetPlayerFromCharacter(TARGET) then
			TARGETSTATIC = script.GonerStatic:Clone()
			TARGETSTATIC.Parent = game:GetService("Players"):GetPlayerFromCharacter(TARGET).PlayerGui
			local SOUND = NewSound({ID = 2737898305,PARENT = TARGETSTATIC.Script,VOLUME = 3,PITCH = 1,LOOP = true,MAXDISTANCE = 125,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = false})
			SOUND.Name = "Static"
			Swait()
			TARGETSTATIC.Script.Disabled = false
		end
		local STATIC = script.GonerStatic:Clone()
		STATIC.Parent = PLAYER.PlayerGui
		local SOUND = NewSound({ID = 2737898305,PARENT = STATIC.Script,VOLUME = 3,PITCH = 1,LOOP = true,MAXDISTANCE = 125,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = false})
		SOUND.Name = "Static"
		Swait()
		STATIC.Script.Disabled = false
		local TARGETTORSO = TARGET:FindFirstChild("Torso") or TARGET:FindFirstChild("UpperTorso")
		local GRABA = IT("Attachment",LEFTARM)
		GRABA.Position = VT(0,-1.5,0)
		local GRABB = IT("Attachment",TARGETTORSO)
		local GRAB = IT("BallSocketConstraint",GRABA)
		GRAB.Attachment0 = GRABA
		GRAB.Attachment1 = GRABB
		local GYRO = IT("BodyGyro")
		GYRO.D = 20
		GYRO.P = 5000
		GYRO.MaxTorque = VT(0,4000000,0)
		GYRO.CFrame = CF(TARGETTORSO.Position,ROOT.Position)
		GYRO.Parent = TARGETTORSO
		ATTACKING = true
		ROOT.Anchored = true
		if INPUT == "z" then
			for i=0, 1, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-10)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-5), RAD(0), RAD(90)) * ANGLES(RAD(25), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)) * ANGLES(RAD(0),RAD(90),RAD(0)), 0.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(85), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
			end
			TRAIL.Enabled = true
			NewSound({ID = 211059653,PARENT = SWORD,VOLUME = 2,PITCH = 0.7,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			for i=0, 0.1, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(-10)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.1, 0.5, -0.85) * ANGLES(RAD(35), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)) * ANGLES(RAD(0),RAD(90),RAD(0)), 1.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(85), RAD(-10), RAD(20)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-60), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
			end
			CameraShake(ROOT.Position,4.6,15,25)
			Dismember(TARGET,"Ragdoll")
			Dismember(TARGET,"Head")
			DedFace()
			GYRO:Remove()
			NewSound({ID = 264486467,PARENT = TARGETTORSO,VOLUME = 2,PITCH = 0.7,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			NewSound({ID = SOUND_SNAP,PARENT = TARGETTORSO,VOLUME = 6,PITCH = 1,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			for i = 1, 7 do
				OofOuchBlood(TARGETTORSO.Position,CF(TARGETTORSO.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,1,-1).p,45)
			end
			coroutine.resume(coroutine.create(function()
				for i = 1, 25 do
					SpawnPuddle(TARGETTORSO.Position,TARGET,false)
					Swait()
				end
			end))
			for i=0, 0.9, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(-1)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.1, 0.5, -0.85) * ANGLES(RAD(35), RAD(0), RAD(-90)) * ANGLES(RAD(25), RAD(-90), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)) * ANGLES(RAD(0),RAD(90),RAD(0)), 1.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(85), RAD(-10), RAD(20)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-60), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
			end
			TRAIL.Enabled = false
		elseif INPUT == "x" then
			for i=0, 1, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(-10)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(15), RAD(0), RAD(90)) * ANGLES(RAD(25), RAD(90), RAD(0)) * RIGHTSHOULDERC0, 0.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)) * ANGLES(RAD(0),RAD(90),RAD(0)), 0.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(125), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
			end
			TRAIL.Enabled = true
			NewSound({ID = 536642316,PARENT = SWORD,VOLUME = 2,PITCH = 0.7,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			for i=0, 0.1, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(-10)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.1, 0.35, -0.85) * ANGLES(RAD(-25), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)) * ANGLES(RAD(0),RAD(90),RAD(0)), 1.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(125), RAD(-10), RAD(20)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-60), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
			end
			CameraShake(ROOT.Position,4.6,15,25)
			Dismember(TARGET,"Ragdoll")
			Dismember(TARGET,"Legs")
			DedFace()
			GYRO:Remove()
			NewSound({ID = 264486467,PARENT = TARGETTORSO,VOLUME = 2,PITCH = 0.7,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			NewSound({ID = SOUND_SNAP,PARENT = TARGETTORSO,VOLUME = 6,PITCH = 1,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
			for i = 1, 7 do
				OofOuchBlood(TARGETTORSO.Position,CF(TARGETTORSO.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,1,-1).p,45)
			end
			coroutine.resume(coroutine.create(function()
				for i = 1, 25 do
					SpawnPuddle(TARGETTORSO.Position,TARGET,false)
					Swait()
				end
			end))
			for i=0, 0.9, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(-1)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.1, 0.35, -0.85) * ANGLES(RAD(-25), RAD(0), RAD(-90)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(85)) * ANGLES(RAD(0),RAD(90),RAD(0)), 1.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(125), RAD(-10), RAD(20)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-60), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
			end
			TRAIL.Enabled = false
		elseif INPUT == "c" then
			if SUBMERGED == false then
				GRABA:Remove()
				GRABB:Remove()
				TARGETTORSO.Anchored = true
				local DEAD = false
				Dismember(TARGET,"Ragdoll")
				coroutine.resume(coroutine.create(function()
					repeat
						Swait()
						TARGETTORSO.CFrame = Clerp(TARGETTORSO.CFrame,ROOT.CFrame*CF(0,-3,-1.5) * ANGLES(RAD(-90), RAD(0), RAD(0)),0.3)
					until DEAD == true
					coroutine.resume(coroutine.create(function()
						for i = 1, 25 do
							SpawnPuddle(TARGETTORSO.Position+VT(0,1,0),TARGET,false)
							Swait()
						end
					end))
					DedFace()
				end))
				for i=0, 1.5, 0.1 / ANIM_SPEED do
					Swait()
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -1) * ANGLES(RAD(30), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-5), RAD(0), RAD(-10)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(70)), 1.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(90), RAD(0), RAD(-5)) * CF(0,-0.75,0) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, 0, -0.5) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, -0.2) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(25)), 1.5 / ANIM_SPEED)
				end
				for i = 1, 7 do
					OofOuchBlood(TARGETTORSO.Position,CF(TARGETTORSO.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,1,-1).p,15)
				end
				CameraShake(ROOT.Position,4.6,15,25)
				Dismember(TARGET,"LeftArm")
				local ARM = TARGET:FindFirstChild("Left Arm") or TARGET:FindFirstChild("LeftUpperArm")
				if ARM then
					local BV = IT("BodyVelocity")
					BV.MaxForce = BV.MaxForce * 500
					BV.Velocity = CF(ARM.Position,ROOT.Position+VT(0,2,0)).lookVector*65
					BV.Parent = ARM
					Debris:AddItem(BV,0.05)
				end
				NewSound({ID = SOUND_SNAP,PARENT = TARGETTORSO,VOLUME = 6,PITCH = 1.1,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
				for i=0, 0.3, 0.1 / ANIM_SPEED do
					Swait()
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -1) * ANGLES(RAD(30), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-5), RAD(0), RAD(-10)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(70)), 1.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 1) * ANGLES(RAD(90), RAD(0), RAD(-5)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, 0, -0.5) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, -0.2) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(25)), 1.5 / ANIM_SPEED)
				end
				for i=0, 0.3, 0.1 / ANIM_SPEED do
					Swait()
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -1) * ANGLES(RAD(30), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-5), RAD(0), RAD(-10)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(70)), 1.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.5) * ANGLES(RAD(90), RAD(0), RAD(85)) * CF(0,-1.25,0) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, 0, -0.5) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, -0.2) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(25)), 1.5 / ANIM_SPEED)
				end
				for i = 1, 7 do
					OofOuchBlood(TARGETTORSO.Position,CF(TARGETTORSO.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,1,-1).p,15)
				end
				CameraShake(ROOT.Position,4.6,15,25)
				Dismember(TARGET,"RightArm")
				local ARM = TARGET:FindFirstChild("Right Arm") or TARGET:FindFirstChild("RightUpperArm")
				if ARM then
					local BV = IT("BodyVelocity")
					BV.MaxForce = BV.MaxForce * 500
					BV.Velocity = CF(ARM.Position,ROOT.Position+VT(0,2,0)).lookVector*65
					BV.Parent = ARM
					Debris:AddItem(BV,0.05)
				end
				NewSound({ID = SOUND_SNAP,PARENT = TARGETTORSO,VOLUME = 6,PITCH = 1.1,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
				DEAD = true
				for i=0, 0.3, 0.1 / ANIM_SPEED do
					Swait()
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -1) * ANGLES(RAD(30), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-5), RAD(0), RAD(-10)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(70)), 1.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 1) * ANGLES(RAD(90), RAD(0), RAD(85)) * CF(0,0.75,0) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, 0, -0.5) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, -0.2) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(25)), 1.5 / ANIM_SPEED)
				end
			else
				TARGETTORSO.Anchored = true
				local POS = ROOT.Position
				Dismember(TARGET,"Ragdoll")
				TARGET.Parent = Effects
				for i = 1, 60 do
					Swait()
					SpawnPuddle(TARGETTORSO.Position,TARGET,true)
					TARGETTORSO.CFrame = TARGETTORSO.CFrame*CF(0,-0.1,0)
				end
				for i = 1, 7 do
					OofOuchBlood(TARGETTORSO.Position,CF(TARGETTORSO.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,50,-1).p,3)
				end
				TARGET:Remove()
			end
		elseif INPUT == "v" then
			GRABA:Remove()
			GRABB:Remove()
			TARGETTORSO.Anchored = true
			local DEAD = false
			coroutine.resume(coroutine.create(function()
				repeat
					Swait()
					TARGETTORSO.CFrame = Clerp(TARGETTORSO.CFrame,ROOT.CFrame*CF(0,-3,-1.2) * ANGLES(RAD(-90), RAD(0), RAD(0)),0.3)
				until DEAD == true
				DedFace()
				Dismember(TARGET,"Ragdoll")
				coroutine.resume(coroutine.create(function()
					for i = 1, 25 do
						SpawnPuddle(TARGETTORSO.Position+VT(0,1,0),TARGET,false)
						Swait()
					end
				end))
			end))
			for i=0, 0.5, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.025) * ANGLES(RAD(-10), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(15), RAD(5), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 1.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-10), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, 0.3, -1) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(20)), 1.5 / ANIM_SPEED)
			end
			for i = 1, MRANDOM(6,12) do
				for i=0, 0.5, 0.1 / ANIM_SPEED do
					Swait()
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.025) * ANGLES(RAD(-10), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(15), RAD(5), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 1.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-10), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, 0.3, -1) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(20)), 1.5 / ANIM_SPEED)
				end
				for i=0, 0.1, 0.1 / ANIM_SPEED do
					Swait()
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.025) * ANGLES(RAD(10), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35), RAD(5), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 1.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-10), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, -1) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(-20)), 1.5 / ANIM_SPEED)
				end
				CameraShake(ROOT.Position,4.6,15,25)
				NewSound({ID = SOUND_SNAP,PARENT = TARGETTORSO,VOLUME = 1,PITCH = 1.25,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
				for i = 1, 7 do
					OofOuchBlood(TARGETTORSO.Position,CF(TARGETTORSO.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,1,-1).p,15)
				end
				for i=0, 0.2, 0.1 / ANIM_SPEED do
					Swait()
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.025) * ANGLES(RAD(10), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35), RAD(5), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 1.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-10), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, -1) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(-20)), 1.5 / ANIM_SPEED)
				end
			end
			DEAD = true
			for i=0, 0.6, 0.1 / ANIM_SPEED do
				Swait()
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.025) * ANGLES(RAD(10), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 1.5 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(35), RAD(5), RAD(0)) * RIGHTSHOULDERC0, 1.5 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 1.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-10), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 1.5 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, -1) * ANGLES(RAD(0), RAD(85), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 1.5 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-3), RAD(0), RAD(-20)), 1.5 / ANIM_SPEED)
			end
		end
		GYRO:Remove()
		if (INPUT ~= "c" or SUBMERGED == false) then
			Speak(2291326656)
		end
		STATIC:Remove()
		if TARGETSTATIC then
			TARGETSTATIC:Remove()
		end
		GRABA:Remove()
		GRABB:Remove()
		ROOT.Anchored = false
		ATTACKING = false
	end
end

function Shriek()
	ROOT.Anchored = true
	ATTACKING = true
	for i=0, 0.15, 0.1 / ANIM_SPEED do
		Swait()
		ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.2) * ANGLES(RAD(0), RAD(0), RAD(10)), 2 / ANIM_SPEED)
		NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(25), RAD(5), RAD(0)), 2 / ANIM_SPEED)
		RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.7, 0) * ANGLES(RAD(25), RAD(15), RAD(0)) * RIGHTSHOULDERC0, 2 / ANIM_SPEED)
		HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 2 / ANIM_SPEED)
		LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(45), RAD(-10), RAD(25)) * LEFTSHOULDERC0, 2 / ANIM_SPEED)
		RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -0.8, -0.4) * ANGLES(RAD(0), RAD(65), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(-20)), 2 / ANIM_SPEED)
		LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -0.8, -0.4) * ANGLES(RAD(0), RAD(-100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(20)), 2 / ANIM_SPEED)
	end
	local FACE = IT("Attachment",HEAD)
	Speak(2466752906)
	CameraShake(ROOT.Position,65,8,150)
	for i=0, 1.75, 0.1 / ANIM_SPEED do
		Swait()
		for index, CHILD in pairs(workspace:GetChildren()) do
			if CHILD:FindFirstChildOfClass("Humanoid") and CHILD ~= CHARACTER then
				local HUMAN = CHILD:FindFirstChildOfClass("Humanoid")
				local ROOT2 = CHILD:FindFirstChild("Torso") or CHILD:FindFirstChild("UpperTorso")
				if ROOT2 and HUMAN.Health > 0 and CHILD:FindFirstChild("Head") then
					if (ROOT2.Position - ROOT.Position).Magnitude < 45 then
						local HED = CHILD:FindFirstChild("Head")
						Dismember(CHILD,"Ragdoll")
						for i = 1, 7 do
							OofOuchBlood(HED.Position,CF(HED.Position)*ANGLES(0,RAD(MRANDOM(0,359)),0)*CF(0,1,-1).p,45)
						end
						NewSound({ID = 264486467,PARENT = ROOT2,VOLUME = 2,PITCH = 0.7,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
						NewSound({ID = SOUND_SNAP,PARENT = ROOT2,VOLUME = 6,PITCH = 1,LOOP = false,MAXDISTANCE = 100,EMITTERSIZE = 15,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
						coroutine.resume(coroutine.create(function()
							for i = 1, 8 do
								SpawnPuddle(ROOT2.Position+VT(0,1,0),CHILD,false)
								Swait()
							end
						end))
						HED:Remove()
					end
				end
			end
		end
		ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 0.5 / ANIM_SPEED)
		NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-25+MRANDOM(-5,5)), RAD(5+MRANDOM(-5,5)), RAD(MRANDOM(-5,5))), 0.5 / ANIM_SPEED)
		RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(25), RAD(15), RAD(0)) * RIGHTSHOULDERC0, 0.5 / ANIM_SPEED)
		HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 0.5 / ANIM_SPEED)
		LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, -0.3) * ANGLES(RAD(45+MRANDOM(-5,5)), RAD(-10+MRANDOM(-5,5)), RAD(-25+MRANDOM(-5,5))) * ANGLES(RAD(-75), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.5 / ANIM_SPEED)
		RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(65), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.5 / ANIM_SPEED)
		LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 0.5 / ANIM_SPEED)
	end
	Debris:AddItem(FACE,1)
	ATTACKING = false
	ROOT.Anchored = false
end

function Speech(INPUT)
	ATTACKING = true
	if INPUT == "t" then
		--Speak(2316600989)
	elseif INPUT == "y" then
		--Speak(2290634374)
	elseif INPUT == "u" then
		--Speak(2291325961)
	end
	ATTACKING = false
end

--//====================================================\\--
--||                       WRAP
--\\====================================================//--

local clicked
table.insert(Events, MOUSE.Button1Down:Connect(function(Mouse)
	if ATTACKING == false then
		if SUBMERGED == false then
			MOUSEHOLD = true
			Slash()
		end
	end
end))
table.insert(Events, MOUSE.Button1Up:Connect(function(Mouse)
	MOUSEHOLD = false
end))
table.insert(Events, MOUSE.KeyUp:Connect(function(V1)
	clicked = false
	KEYHOLD = false
end))
table.insert(Events, MOUSE.KeyDown:Connect(function(V2)
	clicked = true
	if ANIM ~= "Sit" then
		if ATTACKING == false then
			if clicked then
				KEYHOLD = true
				if V2 == "e" then

				elseif V2 == "z" or V2 == "x" or V2 == "c" or V2 == "v" then
					Execute(V2)
				elseif V2 == "g" and SUBMERGED == false then
					Shriek()
				elseif V2 == "q" then
					if SUBMERGED == false then
						SUBMERGED = true
					else
						ROOT.Anchored = false
						SUBMERGED = false
						ROOT.CFrame = ROOT.CFrame*CF(0,3,0)
					end
				elseif V2 == "w" and SUBMERGED == true and ATTACKING == false then
					repeat
						ROOT.CFrame = CF(ROOT.Position,VT(MOUSEPOS.X,ROOT.Position.Y,MOUSEPOS.Z))*CF(0,0,-0.5)
						Swait()
					until KEYHOLD == false or SUBMERGED == false or ATTACKING == true
				elseif V2 == "s" and SUBMERGED == true and ATTACKING == false then
					repeat
						ROOT.CFrame = CF(ROOT.Position,VT(MOUSEPOS.X,ROOT.Position.Y,MOUSEPOS.Z))*CF(0,0,0.25)
						Swait()
					until KEYHOLD == false or SUBMERGED == false or ATTACKING == true
				elseif V2 == "a" and SUBMERGED == true and ATTACKING == false then
					repeat
						ROOT.CFrame = CF(ROOT.Position,VT(MOUSEPOS.X,ROOT.Position.Y,MOUSEPOS.Z))*CF(-0.1,0,0)
						Swait()
					until KEYHOLD == false or SUBMERGED == false or ATTACKING == true
				elseif V2 == "d" and SUBMERGED == true and ATTACKING == false then
					repeat
						ROOT.CFrame = CF(ROOT.Position,VT(MOUSEPOS.X,ROOT.Position.Y,MOUSEPOS.Z))*CF(0.1,0,0)
						Swait()
					until KEYHOLD == false or SUBMERGED == false or ATTACKING == true
				elseif V2 == "t" or V2 == "y" or V2 == "u" then

				end
			end
		end
	end
end))
local M = NewSound({ID = 2598782592,PARENT = ROOT,VOLUME = 1.5,PITCH = 0.4,LOOP = true,MAXDISTANCE = 300,EMITTERSIZE = 300,PLAYING = true,PLAYONREMOVE = false,DOESDEBRIS = true})
M.Name = "BGM_MUSIC"

HUM.PlatformStand = false
HUM.MaxHealth = 3000
HUM.Health = 3000
local TWITCH = 0
local Eventussy
Eventussy = game:GetService("RunService").Stepped:Connect(function()
	if Global.Stopped == true then for _,v in pairs(BITSS) do v:Destroy() end M:Destroy() Eventussy:Disconnect() end
	Swait()
	SINE = SINE + CHANGE
	if CHARACTER:FindFirstChild("Animate") then
		CHARACTER:FindFirstChild("Animate"):Destroy()
	end
	if CHARACTER:FindFirstChild("Sound") then
		CHARACTER:FindFirstChild("Sound"):Destroy()
	end
	for _,v in next, HUM:GetPlayingAnimationTracks() do
		v:Stop();
	end
	local TORSOVELOCITY = (ROOT.Velocity * VT(1, 0, 1)).magnitude
	local TORSOVERTICALVELOCITY = ROOT.Velocity.y
	local HITFLOOR,HITPOS = Raycast(ROOT.Position, (CF(ROOT.Position, ROOT.Position + VT(0, -1, 0))).lookVector, 4+HUM.HipHeight, CHARACTER)
	local WALKSPEEDVALUE = 10
	local SITTING = HUM.Sit
	if ANIM == "Walk" and TORSOVELOCITY > 1 and ATTACKING == false and SITTING == false then
		ROOTJOINT.C1 = Clerp(ROOTJOINT.C1, ROOTC0 * CF(0, 0, -0.015 * COS(SINE / (WALKSPEEDVALUE / 2))) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 * (HUM.WalkSpeed / 16) / ANIM_SPEED)
		NECK.C1 = Clerp(NECK.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(2.5 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0) - HEAD.RotVelocity.Y / 30), 0.2 * (HUM.WalkSpeed / 16) / ANIM_SPEED)
		RIGHTHIP.C1 = Clerp(RIGHTHIP.C1, CF(0.5, 0.875 - 0.3 * SIN(SINE / WALKSPEEDVALUE), -0.5 * COS(SINE / WALKSPEEDVALUE) +0.2+ 0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(35 * COS(SINE / WALKSPEEDVALUE))), 0.6 / ANIM_SPEED)
		LEFTHIP.C1 = Clerp(LEFTHIP.C1, CF(-0.5, 0.875 + 0.3 * SIN(SINE / WALKSPEEDVALUE), 0.5 * COS(SINE / WALKSPEEDVALUE) +0.2+ -0.2 * COS(SINE / WALKSPEEDVALUE)) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(35 * COS(SINE / WALKSPEEDVALUE))), 0.6 / ANIM_SPEED)
	elseif (ANIM ~= "Walk") or (TORSOVELOCITY < 1) or ATTACKING == true or SITTING == true then
		ROOTJOINT.C1 = Clerp(ROOTJOINT.C1, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / ANIM_SPEED)
		NECK.C1 = Clerp(NECK.C1, CF(0, -0.5, 0) * ANGLES(RAD(-90), RAD(0), RAD(180)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / ANIM_SPEED)
		RIGHTHIP.C1 = Clerp(RIGHTHIP.C1, CF(0.5, 1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / ANIM_SPEED)
		LEFTHIP.C1 = Clerp(LEFTHIP.C1, CF(-0.5, 1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 0.2 / ANIM_SPEED)
	end
	if SITTING == false then
		if HITFLOOR then
			if SUBMERGED == false then
				HUM.JumpPower = 50
				HUM.WalkSpeed = 8
				if TORSOVELOCITY < 1 and HITFLOOR ~= nil then
					ANIM = "Idle"
					if MRANDOM(1,15) == 1 and ATTACKING == false then
						SpawnPuddle(HITPOS+VT(0,0.5,0),CHARACTER,true)
					end
					if ATTACKING == false then
						ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(0), RAD(0), RAD(10)), 0.5 / ANIM_SPEED)
						NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(-10), RAD(5), RAD(0)), 0.5 / ANIM_SPEED)
						RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(25), RAD(15), RAD(0)) * RIGHTSHOULDERC0, 0.5 / ANIM_SPEED)
						HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(-5),RAD(0),RAD(0)), 0.5 / ANIM_SPEED)
						LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-10), RAD(-10), RAD(0)) * LEFTSHOULDERC0, 0.5 / ANIM_SPEED)
						RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(65), RAD(0)) * ANGLES(RAD(-5), RAD(0), RAD(0)), 0.5 / ANIM_SPEED)
						LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-100), RAD(0)) * ANGLES(RAD(-1), RAD(0), RAD(0)), 0.5 / ANIM_SPEED)
					end
				elseif TORSOVELOCITY > 1 and HITFLOOR ~= nil then
					ANIM = "Walk"
					if MRANDOM(1,5) == 1 and ATTACKING == false then
						SpawnPuddle(HITPOS+VT(0,0.5,0),CHARACTER,true)
					end
					if ATTACKING == false then
						ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.05) * ANGLES(RAD(5), RAD(0), RAD(0)), 0.25 / ANIM_SPEED)
						NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5 - 1 * SIN(SINE / (WALKSPEEDVALUE / 2))), RAD(0), RAD(0)), 0.25 / ANIM_SPEED)
						RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5-0.015 * COS(SINE / (WALKSPEEDVALUE / 2)), 0) * ANGLES(RAD(25), RAD(20), RAD(5)) * RIGHTSHOULDERC0, 0.75 / ANIM_SPEED)
						HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(5)), 0.5 / ANIM_SPEED)
						LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.45, 0.5-0.015 * SIN(SINE / (WALKSPEEDVALUE / 2)), -0.5) * ANGLES(RAD(95), RAD(-5), RAD(-5)) * LEFTSHOULDERC0, 0.75 / ANIM_SPEED)
						RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(80), RAD(0)) * ANGLES(RAD(-2), RAD(0), RAD(-15)), 2 / ANIM_SPEED)
						LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-80), RAD(0)) * ANGLES(RAD(-2), RAD(0), RAD(15)), 2 / ANIM_SPEED)
					end
				end
			elseif SUBMERGED == true then
				HUM.JumpPower = 0
				HUM.WalkSpeed = 0
				MOUSEPOS = Mouse.Hit.Position
				if MRANDOM(1,2) == 1 then
					SpawnPuddle(HITPOS+VT(0,0.5,0),CHARACTER,true)
				end
				ANIM = "Submerged"
				ROOT.Anchored = true
				if ATTACKING == false then
					ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -1.5) * ANGLES(RAD(90), RAD(0), RAD(0)), 0.25 / ANIM_SPEED)
					NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(5), RAD(0), RAD(0)), 0.25 / ANIM_SPEED)
					RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * RIGHTSHOULDERC0, 0.75 / ANIM_SPEED)
					HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(90)), 0.5 / ANIM_SPEED)
					LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(0), RAD(0), RAD(0)) * LEFTSHOULDERC0, 0.75 / ANIM_SPEED)
					RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1 , -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / ANIM_SPEED)
					LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(0)), 2 / ANIM_SPEED)
				end
				ROOT.CFrame = CF(HITPOS+VT(0,0.05,0))*ANGLES(0,RAD(ROOT.Orientation.Y),0)
			end
		else
			SUBMERGED = false
			ANIM = "Midair"
			if ATTACKING == false then
				ROOT.Anchored = false
				ROOTJOINT.C0 = Clerp(ROOTJOINT.C0, ROOTC0 * CF(0, 0, 0) * ANGLES(RAD(-10), RAD(0), RAD(0)), 1 / ANIM_SPEED)
				NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0 , 0 + ((1) - 1)) * ANGLES(RAD(20), RAD(0), RAD(0)), 1 / ANIM_SPEED)
				RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.5, 0) * ANGLES(RAD(-25), RAD(0), RAD(15)) * RIGHTSHOULDERC0, 1 / ANIM_SPEED)
				HOLD.C0 = Clerp(HOLD.C0, GRIPC0 * CF(0,0,0) * ANGLES(RAD(0),RAD(0),RAD(0)), 0.5 / ANIM_SPEED)
				LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.5, 0) * ANGLES(RAD(-25), RAD(0), RAD(-15)) * LEFTSHOULDERC0, 1 / ANIM_SPEED)
				RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -1, 0) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(20)), 1 / ANIM_SPEED)
				LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -1, 0) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 1 / ANIM_SPEED)
			end
		end
	else
		SUBMERGED = false
		ANIM = "Sit"
		if ATTACKING == false then
			ROOTJOINT.C0 = Clerp(ROOTJOINT.C0,ROOTC0 * CF(0, 0, -0.5) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.25 / ANIM_SPEED)
			NECK.C0 = Clerp(NECK.C0, NECKC0 * CF(0, 0, 0 + ((1) - 1)) * ANGLES(RAD(0), RAD(0), RAD(0)), 1.25 / ANIM_SPEED)
			RIGHTSHOULDER.C0 = Clerp(RIGHTSHOULDER.C0, CF(1.5, 0.65, 0) * ANGLES(RAD(50), RAD(10), RAD(-45))*CF(0,-0.25,0) * RIGHTSHOULDERC0, 1.25 / ANIM_SPEED)
			LEFTSHOULDER.C0 = Clerp(LEFTSHOULDER.C0, CF(-1.5, 0.65, 0) * ANGLES(RAD(50), RAD(-10), RAD(45))*CF(0,-0.25,0) * LEFTSHOULDERC0, 1.25 / ANIM_SPEED)
			RIGHTHIP.C0 = Clerp(RIGHTHIP.C0, CF(1, -0.25, -1) * ANGLES(RAD(0), RAD(90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(10)), 1.25 / ANIM_SPEED)
			LEFTHIP.C0 = Clerp(LEFTHIP.C0, CF(-1, -0.25, -1) * ANGLES(RAD(0), RAD(-90), RAD(0)) * ANGLES(RAD(0), RAD(0), RAD(-10)), 1.25 / ANIM_SPEED)
		end
	end
	if TWITCH > 0 then
		TWITCH = TWITCH - 1
		NECK.C0 = NECK.C0 * ANGLES(RAD(MRANDOM(-5,5)), RAD(MRANDOM(-5,5)), RAD(MRANDOM(-5,5)))
	else
		if MRANDOM(1,25) == 1 then
			TWITCH = MRANDOM(2,12)
		end
	end
end)