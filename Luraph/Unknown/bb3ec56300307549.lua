--[[

    ~ New Discord Server ~

    [ https://discord.gg/tUEJZYvF9d ]

    ~ Index ~

    [ Drawing Library ] - [ Line 111 ]
    [ UI Library ] - [ Line 1117 ]
    [ Cham Library ] - [ Line 2710 ]
    [ Main Cheat ] - [ Line 2766 ]
    [ Make UI ] - [ Line 5778 ]

    ~ Credits ~

    [ iRay ] - [ @896378803868295178 ] | Lead developer
    [ ipufo ] - [ @819756897543389184 ] | Took over development since 5/19/2025
    [ Mickey ] - [ @953720095811719208 ] | Developed perfect trajectory function and ESP library
    [ Redpoint ] - [ @418013390024474624 ] | Contributed to triangles in the custom drawing api

    ~ Special Thanks ~

    [ BBot ] - [ Inspiration to make such a nice UI and high quality/quantity feature list ]
    [ Legacy ] - [ Best and only beta tester ]

]]

function LPH_NO_VIRTUALIZE(fuction) -- unnecessary now
    return fuction
end
LPH_JIT_MAX = LPH_NO_VIRTUALIZE

local devMode = true
local defaultUIName = "Wapus" -- $$$
local folderName = "Phantom Forces Cheat"
local connectionList = {}
local callbackList = {}
local playerStatus = {}
local chatSpamLists = {}
local customAudios = {}
local cham = {}
local unloadMain
local wapus

-- anti votekick bot code
local userName = game:GetService("Players").LocalPlayer.Name
local fileName = tostring(game.JobId) .. ".txt"
if isfolder(folderName) and isfolder(folderName .. "/cache") and isfolder(folderName .. "/cache/votekick data") and isfile(folderName .. "/cache/votekick data/" .. fileName) and readfile(folderName .. "/cache/votekick data/" .. fileName) ~= userName then
    local hostName = readfile("Phantom Forces Cheat/cache/votekick data/" .. tostring(game.JobId) .. ".txt")
    local modules, require_module

    for _, func in getgc(false) do
        if type(func) == "function" and islclosure(func) and debug.getinfo(func).name == "require" and string.find(debug.getinfo(func).source, "ClientLoader") then
            require_module = func
            modules = {}

            for moduleName, moduleCache in debug.getupvalue(func, 1)._cache do
                modules[moduleName] = moduleCache.module
            end

            break
        end
    end

    local network = modules.NetworkClient
    local votekick = modules.VoteKickInterface
    local charInterface = modules.CharacterInterface
    local roundSystem = modules.RoundSystemClientInterface

    local clientEvents = debug.getupvalue(debug.getupvalue(network._init, 2), 2)

    game:GetService("RunService"):Set3dRenderingEnabled(false) -- increase performance              bruh why this doesnt work on nihon idk if it works on other executors

    local function isKickInProgress()
        return debug.getupvalue(votekick.vote, 1) -- fuck you guy
    end

    local console = clientEvents.console
    function clientEvents.console(message)
        task.spawn(function()
            if string.find(message, "has initiated a votekick on") then
                local initiator = string.split(message, " has initiated")[1]
                local victim = string.split(string.split(message, "initiated a votekick on ")[2], " for ")[1]

                repeat task.wait() until isKickInProgress()

                if victim == hostName then -- meanie tried to votekick u
                    votekick.vote("no")
                elseif initiator == hostName then
                    votekick.vote("yes") -- troll
                end
            end
        end)

        return console(message)
    end

    repeat
        repeat task.wait() until not roundSystem.roundLock
        charInterface.spawn()
        repeat task.wait() until charInterface.isAlive() and charInterface.getCharacterObject() and charInterface.getCharacterObject():canJump()
        charInterface.getCharacterObject():jump(4)
        task.wait(5)
        network:send("forcereset")
        task.wait(3.1)
    until nil
end

if LPH_OBFUSCATED then
	while true do
	end
	return
end

LPH_NO_VIRTUALIZE(function()
workspace:FindFirstChild("nigga stop deobfuscating my script you black monkey nigger - iray") -- theres this bitch nigga named isse (@723741691583922209)
do -- Drawing Library
    local drawing = {}
    local cache = {
        updates = {},
        instances = {},
        shapes = {}
    }

    local leftTriangleId = "http://www.roblox.com/asset/?id=18975909718" -- "http://www.roblox.com/asset/?id=17661400876" 2
    local rightTriangleId = "http://www.roblox.com/asset/?id=18975907988" -- "http://www.roblox.com/asset/?id=17661399529" 1

    local folder = Instance.new("ScreenGui")
    local black = Color3.new(0, 0, 0)
    local v2 = Vector2
    local nv = v2.zero

    folder.Name = "Drawing API By iRay"
    folder.IgnoreGuiInset = true
    folder.Parent = game:GetService("CoreGui")

    local universal = {
        Visible = false,
        Transparency = 1,
        Color = black,
        ZIndex = 1
    }

    local defaults = { -- benefit of remaking it is to have a uniform drawing api across all executors because the wapus ui was originally made with krampus' drawing api
        Square = {
            Position = nv,
            Size = nv,
            Thickness = 1,
            Filled = false
        },
        Circle = {
            Position = nv,
            NumSides = 8,
            Radius = 200,
            Thickness = 1,
            Filled = false
        },
        Line = {
            From = nv,
            To = nv,
            Thickness = 1
        },
        Text = {
            Text = "",
            Size = 14,
            Center = false,
            Outline = false,
            OutlineColor = black,
            Position = nv,
            TextBounds = nv,
            Font = 0
        },
        Triangle = {
            Thickness = 1,
            PointA = nv,
            PointB = nv,
            PointC = nv,
            Filled = false
        },
        Image = {
            Position = nv,
            Size = nv,
            Data = ""
        },
        Quad = { -- why did i even do this
            Thickness = 1,
            PointA = nv,
            PointB = nv,
            PointC = nv,
            PointD = nv,
            Filled = false
        }
    }

    drawing.Fonts = {
        UI = 0,
        System = 1,
        Plex = 2,
        Monospace = 3
    }

    local fontIndexes = {
        [0] = Enum.Font.Legacy,
        [1] = Enum.Font.Ubuntu,
        [2] = Enum.Font.Code,
        [3] = Enum.Font.Jura
    }

    local newMetatable = {
        __index = function(self, index)
            if index == "TextBounds" and self._data.shape == "Text" then
                return self._data.drawings.label.TextBounds
            end

            return self._data[index]
        end,
        __newindex = function(self, index, value)
            if self._data[index] == nil then
                --warn("invalid shape property: '" .. tostring(index) .. "'")
            elseif self._data[index] ~= value then
                local shapeIndex = self._data.index

                if self._data.shape == "Text" then -- only putting this here to make TextBounds work better
                    if index == "Text" then
                        self._data.drawings.label.Text = value
                        self._data[index] = value
                        return
                    elseif index == "Font" then
                        self._data.drawings.label.Font = fontIndexes[value]
                        self._data[index] = value
                        return
                    elseif index == "Size" then
                        self._data.drawings.label.TextSize = value * 0.66
                        self._data[index] = value
                        return
                    end
                end

                if not cache.updates[shapeIndex] then
                    cache.updates[shapeIndex] = {}
                end

                if index == "Thickness" or index == "NumSides" then
                    value = math.max(math.abs(value), 1)
                end

                if index == "NumSides" then
                    value = math.min(value, 64)
                end

                cache.updates[shapeIndex][index] = value
                self._data[index] = value
            end
        end
    }

    local function destroyEntity(entity)
        if entity._data.shape == "Circle" or entity._data.shape == "Quad" then
            for _, object in entity._data.drawings.lines do
                object:Destroy()
            end

            for _, objects in entity._data.drawings.triangles do
                objects[1]:Destroy()
                objects[2]:Destroy()
            end
        else
            for _, object in entity._data.drawings do
                object:Destroy()
            end
        end
    end

    local function createEntity(shape)
        local entity = {}

        for ind, val in universal do
            entity[ind] = val
        end

        for ind, val in defaults[shape] do
            entity[ind] = val
        end

        return entity
    end

    local function newFrame()
        local frame = Instance.new("Frame", folder)
        frame.Visible = false
        frame.BorderSizePixel = 0
        frame.BackgroundColor3 = black
        return frame
    end

    local function newTriangle()
        local right = Instance.new("ImageLabel", folder)
        right.Image = rightTriangleId
        right.Visible = false
        right.BackgroundTransparency = 1
        right.AnchorPoint = v2.new(0.5, 0.5)
        right.ImageColor3 = black
        local left = Instance.new("ImageLabel", folder)
        left.Image = leftTriangleId
        left.Visible = false
        left.BackgroundTransparency = 1
        left.AnchorPoint = v2.new(0.5, 0.5)
        left.ImageColor3 = black
        return right, left
    end

    function drawing.new(shape)
        if shape == "Square" then
            local data = createEntity(shape)
            local square = {_data = data, Remove = destroyEntity, Destroy = destroyEntity}
            data.drawings = {box = newFrame(), line1 = newFrame(), line2 = newFrame(), line3 = newFrame(), line4 = newFrame()}
            data._data = data
            data.index = #cache.shapes + 1
            data.shape = shape
            cache.shapes[data.index] = square
            table.insert(cache.instances, data.drawings)
            return setmetatable(square, newMetatable)
        elseif shape == "Circle" then
            local data = createEntity(shape)
            local circle = {_data = data, Remove = destroyEntity, Destroy = destroyEntity}
            data.drawings = {lines = {}, triangles = {}}
            data._data = data
            data.index = #cache.shapes + 1
            data.shape = shape
            cache.shapes[data.index] = circle

            for i = 1, 8 do
                local newLine = newFrame()
                newLine.AnchorPoint = v2.new(0.5, 0.5)
                table.insert(data.drawings.lines, newLine)
            end

            for i = 1, 8 do
                table.insert(data.drawings.triangles, {newTriangle()})
            end

            table.insert(cache.instances, data.drawings)
            return setmetatable(circle, newMetatable)
        elseif shape == "Image" then
            local data = createEntity(shape)
            local image = {_data = data, Remove = destroyEntity, Destroy = destroyEntity}
            data.drawings = {image = Instance.new("ImageLabel", folder)}
            data._data = data
            data.index = #cache.shapes + 1
            data.shape = shape
            data.drawings.image.Image = ""
            data.drawings.image.Visible = false
            data.drawings.image.BackgroundTransparency = 1
            data.drawings.image.Size = UDim2.new(0, 0, 0, 0)
            cache.shapes[data.index] = image
            table.insert(cache.instances, data.drawings)
            return setmetatable(image, newMetatable)
        elseif shape == "Line" then
            local data = createEntity(shape)
            local line = {_data = data, Remove = destroyEntity, Destroy = destroyEntity}
            data.drawings = {line = newFrame()}
            data.drawings.line.AnchorPoint = v2.new(0.5, 0.5)
            data._data = data
            data.index = #cache.shapes + 1
            data.shape = shape
            cache.shapes[data.index] = line
            table.insert(cache.instances, data.drawings)
            return setmetatable(line, newMetatable)
        elseif shape == "Text" then
            local data = createEntity(shape)
            local text = {_data = data, Remove = destroyEntity, Destroy = destroyEntity}
            local label = Instance.new("TextLabel", folder)
            label.Text = ""
            label.TextColor3 = black
            label.BackgroundTransparency = 1
            label.AutomaticSize = Enum.AutomaticSize.XY
            label.Size = UDim2.new(0, 0, 0, 0)
            label.Font = fontIndexes[0]
            label.Visible = false
            data.drawings = {label = label}
            data._data = data
            data.index = #cache.shapes + 1
            data.shape = shape
            cache.shapes[data.index] = text
            table.insert(cache.instances, data.drawings)
            return setmetatable(text, newMetatable)
        elseif shape == "Triangle" then
            local data = createEntity(shape)
            local triangle = {_data = data, Remove = destroyEntity, Destroy = destroyEntity}
            local left, right = newTriangle()
            data.drawings = {left = left, right = right, a = newFrame(), b = newFrame(), c = newFrame()}
            data.drawings.a.AnchorPoint = v2.new(0.5, 0.5)
            data.drawings.b.AnchorPoint = v2.new(0.5, 0.5)
            data.drawings.c.AnchorPoint = v2.new(0.5, 0.5)
            data._data = data
            data.index = #cache.shapes + 1
            data.shape = shape
            cache.shapes[data.index] = triangle
            table.insert(cache.instances, data.drawings)
            return setmetatable(triangle, newMetatable)
        elseif shape == "Quad" then
            local data = createEntity(shape)
            local triangle = {_data = data, Remove = destroyEntity, Destroy = destroyEntity}
            local left, right = newTriangle()
            data.drawings = {lines = {}, triangles = {}}
            data._data = data
            data.index = #cache.shapes + 1
            data.shape = shape
            cache.shapes[data.index] = triangle

            for i = 1, 4 do
                local newLine = newFrame()
                newLine.AnchorPoint = v2.new(0.5, 0.5)
                table.insert(data.drawings.lines, newLine)
            end

            for i = 1, 2 do
                table.insert(data.drawings.triangles, {newTriangle()})
            end

            table.insert(cache.instances, data.drawings)
            return setmetatable(triangle, newMetatable)
        else
            --warn("invalid drawing shape: '" .. tostring(shape) .. "'")
        end
    end

    local function round(num)
        return math.floor(num + 0.5)
    end

    local function fixvec(vec)
        return v2.new(round(vec.X), round(vec.Y))
    end

    local function getPointOrder(a, b, c)
        local p0, p1, p2
        local d1, d2, d3 = (a - b).Magnitude, (c - b).Magnitude, (a - c).Magnitude
        local h1, h2, c0, h1d, h2d

        if d1 > d2 and d1 > d3 then
            h1 = a
            h2 = b
            c0 = c
            h1d = d3
            h2d = d2
        elseif d2 > d3 and d2 > d1 then
            h1 = c
            h2 = b
            c0 = a
            h1d = d3
            h2d = d1
        else
            h1 = c
            h2 = a
            c0 = b
            h1d = d2
            h2d = d1
        end

        if h1d < h2d then
            p0 = h1
            p1 = h2
            p2 = c0
        else
            p0 = h2
            p1 = h1
            p2 = c0
        end

        return p0, p1, p2
    end

    local function renderTriangle(leftSide, rightSide, p0, p1, p2) -- creates any triangle image by turning random triangles into 2 right triangles and using right triangle images
        local hmxo = p1.x - p0.x
        local hmyo = p1.y - p0.y
        local hm = (hmyo == 0 and 1 or hmyo) / (hmxo == 0 and 1 or hmxo)
        local hb = p0.y - hm * p0.x
        local lm = -1 / hm
        local lb = p2.y - lm * p2.x
        local sxo = (hm - lm)
        local sx = (lb - hb) / (sxo == 0 and 1 or sxo)
        local s = v2.new(sx, lm * sx + lb) -- point with right angle

        local ho = p2 - s
        local height = ho.Magnitude
        local b1o = p1 - s
        local base1 = b1o.Magnitude
        local b2o = p0 - s
        local base2 = b2o.Magnitude

        local m1 = s + ho * 0.5 + b1o * 0.5
        local m2 = s + ho * 0.5 + b2o * 0.5

        local d1 = p1 - p0
        local left, right = leftSide, rightSide
        local rotation = math.deg(math.atan2(d1.Y, d1.X))

        -- ty redpoint for these 12 lines (@418013390024474624)
        local horizontal_dot = b1o:Dot(v2.new(1, 0))
        local vertical_dot = ho:Dot(v2.new(0, -1))
        if horizontal_dot > 0 and vertical_dot < 0 or horizontal_dot < 0 and vertical_dot > 0 then
            if d1.X ~= 0 then
                left = rightSide
                right = leftSide
                rotation += math.deg(math.pi)
            end
        elseif d1.X == 0 then
            left = rightSide
            right = leftSide
            rotation += math.deg(math.pi)
        end

        left.Position = UDim2.new(0, m1.X, 0, m1.Y)
        left.Size = UDim2.new(0, base1, 0, height)
        left.Rotation = rotation
        right.Position = UDim2.new(0, m2.X, 0, m2.Y)
        right.Size = UDim2.new(0, base2, 0, height)
        right.Rotation = rotation
    end

    local lastRender = tick();
    local function render()
        if tick() - lastRender < 1/30 then return end;

        lastRender = tick();
        for shapeIndex, updateList in cache.updates do
            local shape = cache.shapes[shapeIndex]._data

            if shape.shape == "Line" then
                local line = shape.drawings.line

                if updateList.From or updateList.To then
                    local a = shape.From
                    local b = shape.To
                    local offset = b - a
                    local middle = a + offset * 0.5
                    local distance = offset.Magnitude
                    line.Position = UDim2.new(0, middle.X, 0, middle.Y) -- middle
                    line.Rotation = math.deg(math.atan(offset.Y / offset.X))
                    line.Size = UDim2.new(0, math.floor(distance + 0.5), 0, math.abs(shape.Thickness))
                end

                if updateList.Thickness then
                    local distance = (shape.From - shape.To).Magnitude
                    line.Size = UDim2.new(0, math.floor(distance + 0.5), 0, math.abs(updateList.Thickness))
                end

                if updateList.Color then
                    line.BackgroundColor3 = updateList.Color
                end

                if updateList.Visible ~= nil then
                    line.Visible = updateList.Visible
                end

                if updateList.Transparency then
                    line.Transparency = 1 - updateList.Transparency
                end

                if updateList.ZIndex then
                    line.ZIndex = updateList.ZIndex
                end
            elseif shape.shape == "Text" then
                local label = shape.drawings.label

                if updateList.Position then
                    label.Position = UDim2.new(0, updateList.Position.X, 0, updateList.Position.Y + 2)
                end

                if updateList.Center ~= nil then
                    label.AutomaticSize = updateList.Center and Enum.AutomaticSize.Y or Enum.AutomaticSize.XY
                end

                if updateList.Outline ~= nil then
                    label.TextStrokeTransparency = updateList.Outline and 0 or 1
                end

                if updateList.OutlineColor then
                    label.TextStrokeColor3 = updateList.OutlineColor
                end

                if updateList.Color then
                    label.TextColor3 = updateList.Color
                end

                if updateList.Visible ~= nil then
                    label.Visible = updateList.Visible
                end

                if updateList.Transparency then
                    label.TextTransparency = 1 - updateList.Transparency
                end

                if updateList.ZIndex then
                    label.ZIndex = updateList.ZIndex
                end
            elseif shape.shape == "Square" then
                local drawings = shape.drawings

                if updateList.Position or updateList.Thickness or updateList.Size then
                    local size = fixvec(shape.Size)
                    local position = shape.Position

                    if size.X < 0 then
                        size = v2.new(math.abs(size.X), size.Y)
                        position = v2.new(position.X - size.X, position.Y)
                    end

                    if size.Y < 0 then
                        size = v2.new(size.X, math.abs(size.Y))
                        position = v2.new(position.X, position.Y - size.Y)
                    end

                    local realThick = shape.Thickness
                    local thick = realThick - 1
                    local thicknessOffset = math.floor(thick * 0.5 + 0.5)
                    local boxPos = fixvec(v2.new(position.X - thicknessOffset, position.Y - thicknessOffset))
                    drawings.box.Position = UDim2.new(0, boxPos.X, 0, boxPos.Y)
                    drawings.box.Size = UDim2.new(0, size.X + thick, 0, size.Y + thick)
                    drawings.line1.Position = drawings.box.Position
                    drawings.line2.Position = UDim2.new(0, boxPos.X + size.X - 1, 0, boxPos.Y + realThick)
                    drawings.line3.Position = UDim2.new(0, boxPos.X, 0, boxPos.Y + size.Y - 1)
                    drawings.line4.Position = UDim2.new(0, boxPos.X, 0, boxPos.Y + realThick)
                    drawings.line2.Size = UDim2.new(0, realThick, 0, size.Y - realThick - 1)
                    drawings.line1.Size = UDim2.new(0, size.X + thick, 0, realThick)
                    drawings.line4.Size = UDim2.new(0, realThick, 0, size.Y - realThick - 1)
                    drawings.line3.Size = UDim2.new(0, size.X + thick, 0, realThick)
                end

                if updateList.Filled ~= nil then
                    if shape.Visible then
                        drawings.box.Visible = updateList.Filled
                        drawings.line1.Visible = not updateList.Filled
                        drawings.line2.Visible = not updateList.Filled
                        drawings.line3.Visible = not updateList.Filled
                        drawings.line4.Visible = not updateList.Filled
                    end
                end

                if updateList.Visible ~= nil then
                    if shape.Filled then
                        drawings.box.Visible = updateList.Visible
                    else
                        drawings.line1.Visible = updateList.Visible
                        drawings.line2.Visible = updateList.Visible
                        drawings.line3.Visible = updateList.Visible
                        drawings.line4.Visible = updateList.Visible
                    end
                end

                if updateList.Transparency then
                    drawings.box.Transparency = 1 - updateList.Transparency
                    drawings.line1.Transparency = 1 - updateList.Transparency
                    drawings.line2.Transparency = 1 - updateList.Transparency
                    drawings.line3.Transparency = 1 - updateList.Transparency
                    drawings.line4.Transparency = 1 - updateList.Transparency
                end

                if updateList.Color then
                    for _, drawing in drawings do
                        drawing.BackgroundColor3 = updateList.Color
                    end
                end

                if updateList.ZIndex then
                    for _, drawing in drawings do
                        drawing.ZIndex = updateList.ZIndex
                    end
                end
            elseif shape.shape == "Image" then
                local image = shape.drawings.image

                if updateList.Position then
                    image.Position = UDim2.new(0, updateList.Position.X, 0, updateList.Position.Y)
                end

                if updateList.Size then
                    image.Size = UDim2.new(0, updateList.Size.X, 0, updateList.Size.Y)
                end

                if updateList.Data then
                    image.Image = updateList.Data
                end

                if updateList.Visible ~= nil then
                    image.Visible = updateList.Visible
                end

                if updateList.Transparency then
                    image.ImageTransparency = 1 - updateList.Transparency
                end

                if updateList.ZIndex then
                    image.ZIndex = updateList.ZIndex
                end
            elseif shape.shape == "Circle" then
                local drawings = shape.drawings

                if updateList.NumSides then
                    for _, triangle in drawings.triangles do
                        for _, drawing in triangle do
                            drawing:Destroy()
                        end
                    end

                    for _, drawing in drawings.lines do
                        drawing:Destroy()
                    end

                    drawings.lines = {}
                    drawings.triangles = {}

                    for _ = 1, updateList.NumSides do
                        local newLine = newFrame()
                        newLine.AnchorPoint = v2.new(0.5, 0.5)
                        table.insert(drawings.lines, newLine)
                        table.insert(drawings.triangles, {newTriangle()})
                    end

                    updateList.Filled = shape.Filled
                    updateList.Visible = shape.Visible
                    updateList.Transparency = shape.Transparency
                    updateList.Color = shape.Color
                    updateList.ZIndex = shape.ZIndex
                end

                if updateList.Position or updateList.Thickness or updateList.Radius or updateList.NumSides then
                    local position = shape.Position
                    local size = shape.Radius
                    local num = shape.NumSides
                    local interval = 2 * math.pi / num

                    for lineIndex = 1, num do
                        local origin = (lineIndex - 1) * interval
                        local target = lineIndex * interval
                        local o0 = v2.new(math.cos(origin), math.sin(origin))
                        local o1 = v2.new(math.cos(target), math.sin(target))
                        local p0 = position + o0 * size
                        local p1 = position + o1 * size
                        local offset = p1 - p0
                        local middle = p0 + offset * 0.5
                        local distance = offset.Magnitude
                        local newSize = (middle - position).Magnitude
                        local line = drawings.lines[lineIndex]
                        local left = drawings.triangles[lineIndex][1]
                        local right = drawings.triangles[lineIndex][2]

                        line.Position = UDim2.new(0, middle.X, 0, middle.Y) -- middle
                        line.Rotation = math.deg(math.atan(offset.Y / offset.X))
                        line.Size = UDim2.new(0, math.floor(distance + 0.5), 0, math.abs(shape.Thickness))

                        local rotation = math.deg((lineIndex - 0.5) * interval - (math.pi * 0.5))
                        local leftPosition = (lineIndex - 1) * interval
                        leftPosition = position + v2.new(math.cos(leftPosition), math.sin(leftPosition)) * size * 0.5
                        left.Position = UDim2.new(0, leftPosition.X, 0, leftPosition.Y)
                        left.Size = UDim2.new(0, distance * 0.5, 0, newSize)
                        left.Rotation = rotation
                        local rightPosition = (lineIndex - 0) * interval
                        rightPosition = position + v2.new(math.cos(rightPosition), math.sin(rightPosition)) * size * 0.5
                        right.Position = UDim2.new(0, rightPosition.X, 0, rightPosition.Y)
                        right.Size = UDim2.new(0, distance * 0.5, 0, newSize)
                        right.Rotation = rotation
                    end
                end

                if updateList.Filled ~= nil then
                    if shape.Visible then
                        for _, triangle in drawings.triangles do
                            for _, drawing in triangle do
                                drawing.Visible = updateList.Filled
                            end
                        end

                        for _, drawing in drawings.lines do
                            drawing.Visible = not updateList.Filled
                        end
                    end
                end

                if updateList.Visible ~= nil then
                    if shape.Filled then
                        for _, triangle in drawings.triangles do
                            for _, drawing in triangle do
                                drawing.Visible = updateList.Visible
                            end
                        end
                    else
                        for _, drawing in drawings.lines do
                            drawing.Visible = updateList.Visible
                        end
                    end
                end

                if updateList.Transparency then
                    for _, drawing in drawings.lines do
                        drawing.Transparency = 1 - updateList.Transparency
                    end

                    for _, triangle in drawings.triangles do
                        for _, drawing in triangle do
                            drawing.ImageTransparency = 1 - updateList.Transparency
                        end
                    end
                end

                if updateList.Color then
                    for _, drawing in drawings.lines do
                        drawing.BackgroundColor3 = updateList.Color
                    end

                    for _, triangle in drawings.triangles do
                        for _, drawing in triangle do
                            drawing.ImageColor3 = updateList.Color
                        end
                    end
                end

                if updateList.ZIndex then
                    for _, drawing in drawings.lines do
                        drawing.ZIndex = updateList.ZIndex
                    end

                    for _, triangle in drawings.triangles do
                        for _, drawing in triangle do
                            drawing.ZIndex = updateList.ZIndex
                        end
                    end
                end
            elseif shape.shape == "Triangle" then
                local drawings = shape.drawings

                if updateList.PointA or updateList.PointB or updateList.PointC or updateList.Thickness then
                    local a, b, c = shape.PointA, shape.PointB, shape.PointC

                    if a and b and c and a ~= b and a ~= c and b ~= c then
                        local p0, p1, p2 = getPointOrder(a, b, c)

                        local line1, line2, line3 = drawings.a, drawings.b, drawings.c
                        local d1 = p1 - p0
                        local mp1 = p0 + d1 * 0.5
                        line1.Position = UDim2.new(0, mp1.X, 0, mp1.Y)
                        line1.Rotation = math.deg(math.atan(d1.Y / d1.X))
                        line1.Size = UDim2.new(0, math.floor(d1.Magnitude + 0.5), 0, math.abs(shape.Thickness))

                        local d2 = p2 - p1
                        local mp2 = p1 + d2 * 0.5
                        line2.Position = UDim2.new(0, mp2.X, 0, mp2.Y)
                        line2.Rotation = math.deg(math.atan(d2.Y / d2.X))
                        line2.Size = UDim2.new(0, math.floor(d2.Magnitude + 0.5), 0, math.abs(shape.Thickness))

                        local d3 = p0 - p2
                        local mp3 = p2 + d3 * 0.5
                        line3.Position = UDim2.new(0, mp3.X, 0, mp3.Y)
                        line3.Rotation = math.deg(math.atan(d3.Y / d3.X))
                        line3.Size = UDim2.new(0, math.floor(d3.Magnitude + 0.5), 0, math.abs(shape.Thickness))

                        renderTriangle(drawings.left, drawings.right, p0, p1, p2)
                    end
                end

                if updateList.Filled ~= nil then
                    if shape.Visible then
                        drawings.left.Visible = updateList.Filled
                        drawings.right.Visible = updateList.Filled
                        drawings.a.Visible = not updateList.Filled
                        drawings.b.Visible = not updateList.Filled
                        drawings.c.Visible = not updateList.Filled
                    end
                end

                if updateList.Visible ~= nil then
                    if shape.Filled then
                        drawings.left.Visible = updateList.Visible
                        drawings.right.Visible = updateList.Visible
                    else
                        drawings.a.Visible = updateList.Visible
                        drawings.b.Visible = updateList.Visible
                        drawings.c.Visible = updateList.Visible
                    end
                end

                if updateList.Color then
                    drawings.left.ImageColor3 = updateList.Color
                    drawings.right.ImageColor3 = updateList.Color
                    drawings.a.BackgroundColor3 = updateList.Color
                    drawings.b.BackgroundColor3 = updateList.Color
                    drawings.c.BackgroundColor3 = updateList.Color
                end

                if updateList.Transparency then
                    drawings.left.ImageTransparency = 1 - updateList.Transparency
                    drawings.right.ImageTransparency = 1 - updateList.Transparency
                    drawings.a.Transparency = 1 - updateList.Transparency
                    drawings.b.Transparency = 1 - updateList.Transparency
                    drawings.c.Transparency = 1 - updateList.Transparency
                end

                if updateList.ZIndex then
                    for _, drawing in drawings do
                        drawing.ZIndex = updateList.ZIndex
                    end
                end
            elseif shape.shape == "Quad" then
                local drawings = shape.drawings

                if updateList.PointA or updateList.PointB or updateList.PointC or updateList.PointD or updateList.Thickness then
                    local p0 = shape.PointA
                    local p1 = shape.PointB
                    local p2 = shape.PointC
                    local p3 = shape.PointD

                    if p0 and p1 and p2 and p3 and p0 ~= p1 and p0 ~= p2 and p0 ~= p3 and p1 ~= p2 and p1 ~= p3 and p2 ~= p3 then
                        local intersects = false
                        local intersection

                        local m1 = (p1.Y - p0.Y) / (p1.X - p0.X)
                        local m2 = (p2.Y - p1.Y) / (p2.X - p1.X)
                        local m3 = (p3.Y - p2.Y) / (p3.X - p2.X)
                        local m4 = (p0.Y - p3.Y) / (p0.X - p3.X)
                        local lines = {
                            {p0, p1, m1, p0.Y - m1 * p0.X},
                            {p1, p2, m2, p1.Y - m2 * p1.X},
                            {p2, p3, m3, p2.Y - m3 * p2.X},
                            {p3, p0, m4, p3.Y - m4 * p3.X}
                        }

                        for lineIndex = 1, 2 do -- checking if lines in quad intersect
                            local lineData = lines[lineIndex]
                            local o1, t1, s1, b1 = table.unpack(lineData)

                            if not intersects then
                                local opposite = lineIndex + 2
                                local o2, t2, s2, b2 = table.unpack(lines[opposite])
                                local ix = (b2 - b1) / (s1 - s2)

                                local x11, x12 = o1.X, t1.X
                                if x11 > x12 then
                                    local temp = x11
                                    x11 = x12
                                    x12 = temp
                                end

                                local x21, x22 = o2.X, t2.X
                                if x21 > x22 then
                                    local temp = x21
                                    x21 = x22
                                    x22 = temp
                                end

                                if ix > x11 + 1 and ix < x12 - 1 and ix > x21 + 1 and ix < x22 - 1 then
                                    intersects = lineIndex + 1
                                    intersection = v2.new(ix, s2 * ix + b2)
                                end
                            end
                        end

                        local obtuse
                        if not intersects then -- if not intersecting then gets the point with the biggest angle, 2 scalene triangles will share that point and the opposite point
                            local biggestAngle = 0
                            local biggestLine
                            local total = 0

                            for lineIndex = 1, 4 do
                                local o0 = lines[(lineIndex == 1 and 4) or lineIndex - 1][1]
                                local o1, t1 = table.unpack(lines[lineIndex])
                                local supangle = (o0 - o1).Unit:Dot((t1 - o1).Unit)
                                local angle

                                if supangle < 0 then
                                    angle = 2 + supangle
                                else
                                    angle = 1 - math.abs(supangle)
                                end

                                total = total + angle

                                if angle >= biggestAngle then
                                    biggestLine = lineIndex
                                    biggestAngle = angle
                                end
                            end

                            obtuse = biggestLine
                        end

                        for sideIndex = 1, 4 do
                            local line = drawings.lines[sideIndex]
                            local h1, h2, m, b = table.unpack(lines[sideIndex])

                            local d = h2 - h1
                            local mp = h1 + d * 0.5
                            line.Position = UDim2.new(0, mp.X, 0, mp.Y) -- middle
                            line.Rotation = math.deg(math.atan(d.Y / d.X))
                            line.Size = UDim2.new(0, math.floor(d.Magnitude + 0.5), 0, math.abs(shape.Thickness))
                        end

                        if intersects then
                            local l1 = lines[intersects]
                            local l2 = lines[intersects == 3 and 1 or 4]
                            local lt1, rt1 = table.unpack(drawings.triangles[1])
                            local lt2, rt2 = table.unpack(drawings.triangles[2])
                            local a1, b1, c1 = getPointOrder(intersection, l1[1], l1[2])
                            local a2, b2, c2 = getPointOrder(intersection, l2[1], l2[2])
                            renderTriangle(lt1, rt1, a1, b1, c1)
                            renderTriangle(lt2, rt2, a2, b2, c2)
                        else
                            local l0 = lines[(obtuse < 3 and obtuse + 2) or obtuse - 2]
                            local l1 = lines[obtuse]
                            local lt1, rt1 = table.unpack(drawings.triangles[1])
                            local lt2, rt2 = table.unpack(drawings.triangles[2])
                            local a1, b1, c1 = getPointOrder(l1[1], l1[2], l0[1])
                            local a2, b2, c2 = getPointOrder(l1[1], l0[2], l0[1])
                            renderTriangle(lt1, rt1, a1, b1, c1)
                            renderTriangle(lt2, rt2, a2, b2, c2)
                        end
                    end
                end

                if updateList.Filled ~= nil then
                    if shape.Visible then
                        for _, triangle in drawings.triangles do
                            for _, drawing in triangle do
                                drawing.Visible = updateList.Filled
                            end
                        end

                        for _, drawing in drawings.lines do
                            drawing.Visible = not updateList.Filled
                        end
                    end
                end

                if updateList.Visible ~= nil then
                    if shape.Filled then
                        for _, triangle in drawings.triangles do
                            for _, drawing in triangle do
                                drawing.Visible = updateList.Visible
                            end
                        end
                    else
                        for _, drawing in drawings.lines do
                            drawing.Visible = updateList.Visible
                        end
                    end
                end

                if updateList.Transparency then
                    for _, drawing in drawings.lines do
                        drawing.Transparency = 1 - updateList.Transparency
                    end

                    for _, triangle in drawings.triangles do
                        for _, drawing in triangle do
                            drawing.ImageTransparency = 1 - updateList.Transparency
                        end
                    end
                end

                if updateList.Color then
                    for _, drawing in drawings.lines do
                        drawing.BackgroundColor3 = updateList.Color
                    end

                    for _, triangle in drawings.triangles do
                        for _, drawing in triangle do
                            drawing.ImageColor3 = updateList.Color
                        end
                    end
                end

                if updateList.ZIndex then
                    for _, drawing in drawings.lines do
                        drawing.ZIndex = updateList.ZIndex
                    end

                    for _, triangle in drawings.triangles do
                        for _, drawing in triangle do
                            drawing.ZIndex = updateList.ZIndex
                        end
                    end
                end
            end
        end

        cache.updates = {}
    end

    local function cleardrawcache()
        for _, instanceList in cache.instances do
            for _, instance in instanceList do
                instance:Destroy()
            end
        end

        return
    end

    local function isrenderobj(obj)
        return table.find(cache.shapes, obj) ~= nil
    end

    local function getrenderproperty(obj, idx)
        return obj[idx]
    end

    local function setrenderproperty(obj, idx, val)
        obj[idx] = val
        return
    end

    local function getgui()
        return folder
    end

    --getgenv().Drawing = drawing -- this shit was actually causing the esp lag sorry throit for blaming u i didnt know until i switched the esp fr
    getgenv().drawing = drawing
    --getgenv().cleardrawcache = cleardrawcache
    --getgenv().isrenderobj = isrenderobj
    --getgenv().getrenderproperty = getrenderproperty
    --getgenv().setrenderproperty = setrenderproperty
    getgenv().getgui = getgui

    game:GetService("RunService").RenderStepped:Connect(render)
end

do -- UI Library
    local COLOR = 1
    local COLOR1 = 2
    local COLOR2 = 3
    local COMBOBOX = 4
    local TOGGLE = 5
    local KEYBIND = 6
    local DROPBOX = 7
    local COLORPICKER = 8
    local DOUBLE_COLORPICKERS = 9
    local SLIDER = 10
    local BUTTON = 11
    local LIST = 12
    local IMAGE = 13
    local TEXTBOX = 14
    --real

    wapus = {
        toggleKeybind = "RightShift",
        theme = {
            accent = Color3.fromRGB(127, 72, 163), -- Color3.fromRGB(23, 122, 179)
            text = Color3.fromRGB(255, 255, 255),
            background = Color3.fromRGB(35, 35, 35),
            lightbackground = Color3.fromRGB(50, 50, 50),
            hidden = Color3.fromRGB(26, 26, 26),
            hiddenText = Color3.fromRGB(200, 200, 200),
            outline = Color3.fromRGB(0, 0, 0),
            --fontData = game:HttpGet("https://get.fontspace.co/download/font/g0P4/YzVlMTg1YTgwOGNhNGQyYjljZDFiNmI0NjMxNGY0YzgudHRm/EpilepsySans-g0P4.ttf") -- miss krampus
        },
        menus = {},
        useCustomFont = false,
        open = true,
        GetValue = function() end
    }

    local hueData = "rbxassetid://18403604225"
    local valueData = "rbxassetid://18403602548"
    local blankData = "rbxassetid://18403600629"

    if unloadUI then unloadUI() end

    local runService = game:GetService("RunService")
    local userInputService = game:GetService("UserInputService")
    local middle = workspace.CurrentCamera.ViewportSize * 0.5
    local v2 = Vector2.new

    local insert = table.insert

    --local customFont = Drawing.new("Font", "EpilepsySans") -- cant find a free SpaceMace ttf file but thats what bbot v2 used origionally
    --customFont.Data = wapus.theme.fontData
    local defaultProperties = {
        Filled = true,
        Outline = true,
        Transparency = 1,
        NumSides = 64,
        Visible = false,
        Font = wapus.useCustomFont and customFont or nil
    }
    local themed = {
        accent = {},
        text = {},
        background = {},
        hidden = {},
        outline = {}
    }

    local black = Color3.new(0, 0, 0)
    local function darken(color, factor)
        return color:Lerp(black, factor)
    end

    local function modifyDrawing(drawing, properties)
        for property, value in properties do
            drawing[property] = value
        end

        return drawing
    end

    local allDrawCache = {}
    local function draw(self, shape, properties, theme)
        local drawing = drawing.new(shape)

        for property, value in defaultProperties do
            if value ~= nil then
                pcall(function()
                    drawing[property] = value
                end)
            end
        end

        modifyDrawing(drawing, properties)

        if theme and themed[theme] then
            insert(themed[theme], drawing)
        end

        insert(allDrawCache, drawing)

        if self.drawCache then
            insert(self.drawCache, drawing)
        end
        return drawing
    end

    local function gradient(self, colorList, breaks) -- now this is pro
        local pos = Vector2.zero
        local size = 0
        local squares = {}
        local colors = {}
        local new = {}
        local top, bottom

        if #colorList == 2 then
            top, bottom = table.unpack(colorList)
        end

        breaks = math.max(breaks, 2)
        local offsetAmount = 1 / (breaks - 1)
        for drawIdx = 1, breaks do
            local square = drawing.new("Square")
            square.Color = top and top:Lerp(bottom, (drawIdx - 1) * offsetAmount) or colorList[drawIdx]
            square.Filled = true
            colors[drawIdx] = square.Color
            squares[drawIdx] = square
            insert(allDrawCache, square)
            insert(self.drawCache, square)
        end

        return setmetatable({
            Remove = function(self0)
                for drawIdx = 1, breaks do
                    squares[drawIdx]:Remove()
                end
            end,
            SetColor = function(self0, newcolor)
                if type(newcolor) == "table" then
                    local newtop, newbottom

                    if #newcolor == 2 then
                        newtop, newbottom = table.unpack(newcolor)
                    end

                    for drawIdx = 1, breaks do
                        squares[drawIdx].Color = newtop and newtop:Lerp(newbottom, (drawIdx - 1) * offsetAmount) or newcolor[drawIdx]
                    end
                else
                    for drawIdx = 1, breaks do
                        squares[drawIdx].Color = newcolor or colors[drawIdx]
                    end
                end
            end
        }, {
            __index = function(self0, index)
                return squares[1][index]
            end,
            __newindex = function(self0, index, value)
                for drawIdx = 1, breaks do
                    if index == "Size" then
                        size = value.Y
                        local boxSize = size / breaks
                        squares[drawIdx][index] = v2(value.X, boxSize)
                        squares[drawIdx].Position = v2(pos.X, pos.Y + (drawIdx - 1) * boxSize)
                    elseif index == "Position" then
                        pos = value
                        squares[drawIdx].Position = v2(value.X, value.Y + (drawIdx - 1) * (size / breaks))
                    elseif index ~= "Color" then
                        squares[drawIdx][index] = value
                    end
                end
            end,
        })
    end

    local function updateTheme(self)
    end

    local function getValue(self, section, index)
        section = self.sectionIndexes[section]
        index = section and section.flags[index]
        return index and index.value
    end

    local function setValue(self, section, index, value)
        section = self.sectionIndexes[section]
        index = section and section.flags[index]
        return index and index:SetValue(value)
    end

    local function setTextValue(self, value)
        self.value = value
        self.valuetext.Text = value

        if self.callback then
            self.callback(value)
        end
    end

    local function addTextbox(self, text, default, callback, unsafe)
        local textbox = {}
        local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex and self.index == 1
        local container = self.background.Position + self.bgOffset
        self.flags[text] = textbox
        textbox.type = "textbox"
        textbox.value = default or "jews"
        textbox.callback = callback
        textbox.SetValue = setTextValue
        textbox.height = 34
        textbox.buttonoutline = self.menu:draw("Square", {Position = container + v2(0, 15), Size = v2(213, 18), Color = wapus.theme.outline, Visible = visible}, "outline")
        textbox.button = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 6), {Position = textbox.buttonoutline.Position + v2(1, 1), Size = v2(211, 16), Color = wapus.theme.background, Visible = visible})
        textbox.text = self.menu:draw("Text", {Position = textbox.buttonoutline.Position + v2(2, -16), Size = 14, Color = wapus.theme.text, Text = text, Visible = visible}, "text")
        textbox.valuetext = self.menu:draw("Text", {Position = textbox.button.Position + v2(6, 0), Size = 14, Color = wapus.theme.text, Text = textbox.value, Visible = visible}, "text")
        self.bgOffset += v2(0, textbox.height)
        insert(self.elements, textbox)
        return textbox
    end

    local function addButton(self, text, callback, unsafe)
        local button = {}
        local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex and self.index == 1
        local container = self.background.Position + self.bgOffset
        button.type = "button"
        button.callback = callback
        button.height = 23
        button.buttonoutline = self.menu:draw("Square", {Position = container + v2(0, 3), Size = v2(213, 18), Color = wapus.theme.outline, Visible = visible}, "outline")
        button.button = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 6), {Position = button.buttonoutline.Position + v2(1, 1), Size = v2(211, 16), Color = wapus.theme.background, Visible = visible})
        button.text = self.menu:draw("Text", {Position = button.button.Position + v2(106, 0), Center = true, Size = 14, Color = wapus.theme.text, Text = text, Visible = visible}, "text")
        self.bgOffset += v2(0, button.height)
        insert(self.elements, button)
        return button
    end

    local function setDropValue(self, value)
        self.value = value
        self.valuetext.Text = value

        if self.callback then
            self.callback(value)
        end
    end

    local function addDropdown(self, text, default, defaultoptions, callback, unsafe)
        local dropdown = {}
        local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex and self.index == 1
        local container = self.background.Position + self.bgOffset
        self.flags[text] = dropdown
        dropdown.type = "dropdown"
        dropdown.value = default or "jews"
        dropdown.options = defaultoptions or {}
        dropdown.callback = callback
        dropdown.SetValue = setDropValue
        dropdown.height = 34
        dropdown.buttonoutline = self.menu:draw("Square", {Position = container + v2(0, 15), Size = v2(213, 18), Color = wapus.theme.outline, Visible = visible}, "outline")
        dropdown.button = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 6), {Position = dropdown.buttonoutline.Position + v2(1, 1), Size = v2(211, 16), Color = wapus.theme.background, Visible = visible})
        dropdown.text = self.menu:draw("Text", {Position = dropdown.buttonoutline.Position + v2(2, -16), Size = 14, Color = wapus.theme.text, Text = text, Visible = visible}, "text")
        dropdown.valuetext = self.menu:draw("Text", {Position = dropdown.button.Position + v2(6, 0), Size = 14, Color = wapus.theme.text, Text = dropdown.value, Visible = visible}, "text")
        dropdown.droptext = self.menu:draw("Text", {Position = dropdown.button.Position + v2(200, 2), Size = 14, Color = wapus.theme.text, Text = "-", Visible = visible}, "text")
        self.bgOffset += v2(0, dropdown.height)
        insert(self.elements, dropdown)
        return dropdown
    end

    local function setSliderValue(self, value)
        self.valuetext.Text = tostring(value) .. self.suffix
        local ratio = (value - self.min) / (self.max - self.min)
        self.highlight.Size = Vector2.new(math.clamp(ratio * 211, 0, 211), 9)
        self.highlight.Position = self.buttonoutline.Position + v2(1, 1)

        if self.callback and value ~= self.value then
            self.callback(value)
        end

        self.value = value
    end

    local function addSlider(self, text, default, min, max, step, suffix, callback, unsafe)
        local slider = {}
        local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex and self.index == 1
        local container = self.background.Position + self.bgOffset
        self.flags[text] = slider
        slider.default = default or 50
        slider.min = min or 0
        slider.max = max or 100
        slider.step = step or 1
        slider.suffix = suffix or ""
        slider.type = "slider"
        slider.height = 27
        slider.value = slider.default
        local ratio = (slider.default - slider.min) / (slider.max - slider.min)
        slider.buttonoutline = self.menu:draw("Square", {Position = container + v2(0, 16), Size = v2(213, 11), Color = wapus.theme.outline, Visible = visible}, "outline")
        slider.button = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 3), {Position = slider.buttonoutline.Position + v2(1, 1), Size = v2(211, 9), Color = wapus.theme.background, Visible = visible})
        slider.highlight = modifyDrawing(self.menu:gradient({wapus.theme.accent, darken(wapus.theme.accent, 0.25)}, 3), {Position = slider.button.Position, Size = v2(math.clamp(ratio * 211, 0, 211), 9), Color = wapus.theme.accent, Visible = visible})
        slider.text = self.menu:draw("Text", {Position = slider.buttonoutline.Position + v2(2, -15), Size = 14, Color = wapus.theme.text, Text = text, Visible = visible}, "text")
        slider.valuetext = self.menu:draw("Text", {Position = slider.button.Position + v2(106, -3), Size = 14, Center = true, Color = wapus.theme.text, Text = tostring(default) .. slider.suffix, Visible = visible}, "text")
        slider.callback = callback
        slider.SetValue = setSliderValue
        self.bgOffset += v2(0, slider.height)
        insert(self.elements, slider)
        return slider
    end

    local function setColorValue(self, value)
        self.value = value
        self.button.Color = value
        self.buttonbackground.Color = darken(value, 0.4)

        if self.callback then
            self.callback(value)
        end
    end

    local function addKeybindToColor(self, default, name)
        self.toggle:AddKeyBind(default, name)
    end

    local function addColorToToggle(self, name, default, callback)
        self = self.type ~= "toggle" and self.toggle or self
        local color = {}
        local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex and self.sectionIndex == 1
        if name then
            self.section.flags[name] = color
        end
        default = default or wapus.theme.accent
        color.name = name or "Color"
        color.callback = callback
        color.toggle = self
        color.value = default
        color.AddColorPicker = addColorToToggle
        color.buttonoutline = self.menu:draw("Square", {Position = self.buttonoutline.Position + v2(187 - self.additions, 1), Size = v2(26, 12), Color = wapus.theme.outline, Visible = visible}, "outline")
        color.buttonbackground = self.menu:draw("Square", {Position = color.buttonoutline.Position + v2(1, 1), Size = v2(24, 10), Color = darken(default, 0.4), Visible = visible}, "accent")
        color.button = self.menu:draw("Square", {Position = color.buttonoutline.Position + v2(3, 3), Size = v2(20, 6), Color = default, Visible = visible}, "accent")
        color.SetValue = setColorValue
        color.AddKeyBind = addKeybindToColor
        self.additions += 33
        insert(self.colors, color)
        return color
    end

    local function setKeybindValue(self, value)
        if value and value ~= "None" then
            self.text.Size = 14
            self.text.Text = value

            task.spawn(function()
                while self.text.TextBounds.X > self.button.Size.X do
                    self.text.Size = self.text.Size - 1
                    runService.RenderStepped:Wait()
                end
            end)

            if self.keyIndex then
                self.menu.keybinds[self.keyIndex][1] = value
            else
                self.keyIndex = #self.menu.keybinds + 1
                insert(self.menu.keybinds, self.keyIndex, {value, self})
            end
        else
            self.text.Size = 14
            self.text.Text = "None"

            if self.keyIndex then
                self.menu.keybinds[self.keyIndex] = nil
                self.keyIndex = nil
            end
        end

        if self.menu.UpdateKeyList then
            self.menu.UpdateKeyList()
        end
    end

    local function addKeybindToToggle(self, default, name)
        if not self.keybind then
            local keybind = {}
            local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex and self.sectionIndex == 1
            if name then
                self.section.flags[name] = keybind
            end

            default = default ~= "" and default or "None"
            keybind.toggle = self
            keybind.value = default
            keybind.menu = self.menu
            keybind.AddColorPicker = addColorToToggle
            keybind.buttonoutline = self.menu:draw("Square", {Position = self.buttonoutline.Position + v2(171 - self.additions, 0), Size = v2(42, 14), Color = wapus.theme.outline, Visible = visible}, "outline")
            keybind.button = self.menu:draw("Square", {Position = keybind.buttonoutline.Position + v2(1, 1), Size = v2(40, 12), Color = wapus.theme.hidden, Visible = visible}, "hidden")
            keybind.text = self.menu:draw("Text", {Position = keybind.button.Position + v2(21, -2), Size = 14, Color = wapus.theme.text, Text = default, Center = true, Visible = visible}, "text")
            keybind.SetValue = setKeybindValue
            self.keybind = keybind
            self.additions += 49

            if default ~= "None" then
                keybind.keyIndex = #self.menu.keybinds + 1
                insert(self.menu.keybinds, keybind.keyIndex, {default, keybind})
            end

            return keybind
        end
    end

    local function setToggleValue(self, value)
        self.value = value
        self.button:SetColor(value and {wapus.theme.accent, darken(wapus.theme.accent, 0.25)} or {wapus.theme.lightbackground, wapus.theme.background})

        if self.callback then
            self.callback(value)
        end

        if self.menu.keys and self.menu.keys.updateList then
            self.menu.keys.updateList()
        end
    end

    local function addToggle(self, text, default, callback, unsafe)
        local toggle = {}
        local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex and self.index == 1
        local container = self.background.Position + self.bgOffset
        self.flags[text] = toggle
        toggle.type = "toggle"
        toggle.name = text
        toggle.colors = {}
        toggle.tab = self.tab
        toggle.menu = self.menu
        toggle.sectionIndex = self.index
        toggle.section = self
        toggle.height = 15
        toggle.additions = 0
        toggle.value = default == true
        toggle.buttonoutline = self.menu:draw("Square", {Position = container + v2(0, 3), Size = v2(11, 11), Color = wapus.theme.outline, Visible = visible}, "outline")
        --toggle.button = self.menu:draw("Square", {Position = toggle.buttonoutline.Position + v2(1, 1), Size = v2(9, 9), Color = default and wapus.theme.accent or wapus.theme.background, Visible = visible}, "background")
        toggle.button = modifyDrawing(self.menu:gradient({wapus.theme.accent, darken(wapus.theme.accent, 0.25)}, 3), {Position = toggle.buttonoutline.Position + v2(1, 1), Size = v2(9, 9), Color = default and wapus.theme.accent or wapus.theme.background, Visible = visible})
        toggle.text = self.menu:draw("Text", {Position = toggle.buttonoutline.Position + v2(16, -2), Size = 14, Color = wapus.theme.text, Text = text, Visible = visible}, "text")
        toggle.AddKeyBind = addKeybindToToggle
        toggle.AddColorPicker = addColorToToggle
        toggle.callback = callback
        toggle.SetValue = setToggleValue
        self.bgOffset += v2(0, toggle.height)
        insert(self.elements, toggle)
        toggle.button:SetColor(not default and {wapus.theme.lightbackground, wapus.theme.background})
        return toggle
    end

    local function addSection(self, text)
        local section = {}
        local visible = self.menu.open and self.tab.tabIndex == self.menu.tabIndex
        local mainSection = self.sections[#self.sections]
        local lastButton = mainSection.button
        self.menu.sectionIndexes[text] = section
        section.background = mainSection.background
        section.index = #self.sections + 1
        section.buttonoutline = self.menu:draw("Square", {Position = lastButton.Position + v2(lastButton.Size.X + 1, 0), Color = wapus.theme.outline, Visible = visible}, "outline")
        section.button = self.menu:draw("Square", {Position = section.buttonoutline.Position + v2(0, 0), Color = wapus.theme.hidden, Visible = visible}, "hidden")
        section.text = self.menu:draw("Text", {Size = 14, Color = wapus.theme.hiddenText, Center = true, Text = text, Visible = visible}, "text")
        section.button.Size = v2(10 + section.text.TextBounds.X, 20)
        section.buttonoutline.Size = v2(11 + section.text.TextBounds.X, 21)
        section.text.Position = section.button.Position + v2(5 + section.text.TextBounds.X * 0.5, 4)
        section.text.ZIndex = 3
        section.tab = self.tab
        section.menu = self.menu
        section.name = text
        section.elements = {}
        section.flags = {}
        section.AddToggle = addToggle
        section.AddSlider = addSlider
        section.AddDropdown = addDropdown
        section.AddButton = addButton
        section.AddTextBox = addTextbox
        section.bgOffset = v2(8, 4)
        insert(self.sections, section)
        return section
    end

    local function createSection(self, text, right, height)
        local section = {}
        local visible = self.menu.open and self.tabIndex == self.menu.tabIndex
        local side = right and "right" or "left"
        self.menu.sectionIndexes[text] = section
        height = height == "half" and 257 or height == "whole" and 518 or height == "third" and 170 or height
        section.outline = self.menu:draw("Square", {Size = v2(231, height), Position = self.menu.sectionbg.Position + v2(7 + (right and 235 or 0), 3 + self[side]), Color = wapus.theme.outline, Visible = visible}, "outline")
        section.highlightoutline = self.menu:draw("Square", {Size = v2(229, 4), Position = section.outline.Position + v2(1, 1), Color = wapus.theme.outline, Visible = visible}, "outline")
        section.highlight = modifyDrawing(self.menu:gradient({wapus.theme.accent:Lerp(Color3.new(1, 1, 1), 0.1), wapus.theme.accent, darken(wapus.theme.accent, 0.4)}, 3), {Size = v2(229, 3), Position = section.highlightoutline.Position, Color = wapus.theme.accent, Visible = visible})
        section.buttons = self.menu:draw("Square", {Size = v2(229, 20), Position = section.highlightoutline.Position + v2(0, 4), Color = wapus.theme.hidden, Visible = visible}, "hidden")
        section.buttonoutline = self.menu:draw("Square", {Position = section.highlightoutline.Position + v2(0, 4), Color = wapus.theme.outline, Visible = visible}, "outline")
        section.button = self.menu:draw("Square", {Position = section.highlightoutline.Position + v2(0, 4), Color = wapus.theme.background, Visible = visible}, "background")
        section.buttonbackground = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 8), {Position = section.highlightoutline.Position + v2(0, 4), Color = wapus.theme.background, Visible = visible})
        section.text = self.menu:draw("Text", {Size = 14, Color = wapus.theme.text, Center = true, Text = text, Visible = visible}, "text")
        section.button.Size = v2(10 + section.text.TextBounds.X, 21)
        section.buttonbackground.Size = section.button.Size
        section.buttonbackground.ZIndex = 2
        section.buttonoutline.Size = v2(11 + section.text.TextBounds.X, 21)
        section.text.Position = section.buttons.Position + v2(5 + section.text.TextBounds.X * 0.5, 4)
        section.text.ZIndex = 3
        section.background = self.menu:draw("Square", {Size = v2(229, height - 27), Position = section.outline.Position + v2(1, 26), Color = wapus.theme.background, Visible = visible}, "background")
        section.menu = self.menu
        section.tab = self
        section.name = text
        section.sections = {section}
        section.sectionIndex = 1
        section.index = 1
        section.AddSection = addSection
        section.elements = {}
        section.flags = {}
        section.AddToggle = addToggle
        section.AddSlider = addSlider
        section.AddDropdown = addDropdown
        section.AddButton = addButton
        section.AddTextBox = addTextbox
        section.bgOffset = v2(8, 4)
        self[side] += height + 4
        insert(self.mainSections, section)
        return section
    end

    local players = game:GetService("Players")
    local localplayer = players.LocalPlayer
    local function initPlayerList(list)
        local data = list.playerdata
        local status = list.playerstatus
        local drawings = list.playerdrawings

        local function updateListText()
            for _, drawingData in drawings do
                drawingData.name.Text = ""
                drawingData.team.Text = ""
                drawingData.status.Text = ""
            end

            local scrollmax = math.max(#data - 9, 0)
            local scrollcount = math.min(list.scrollcount, scrollmax)
            list.scrollcount = scrollcount

            for playerIndex = 1, 9 do
                local player = data[playerIndex - scrollcount]

                if player then
                    local islocal = player == localplayer
                    local isteamed = player.Team ~= nil
                    local playerdrawings = drawings[playerIndex]
                    playerdrawings.name.Text = player.Name
                    playerdrawings.team.Text = isteamed and player.Team.Name or "None"
                    playerdrawings.team.Color = isteamed and player.TeamColor.Color or wapus.theme.text
                    playerdrawings.status.Text = islocal and "Local Player" or status[player] or "None"
                    playerdrawings.status.Color = islocal and Color3.new(0.407843, 0, 0.87451) or wapus.theme.text
                end
            end
        end

        local function setTeam(player, team)
            for playerIndex = 1, #data do
                if data[playerIndex].Team == team then
                    insert(data, playerIndex, player)
                    break
                end
            end
        end

        local function updateTeam(player)
            player:GetPropertyChangedSignal("Team", function(team)
                table.remove(data, table.find(data, player))
                setTeam(player, team)
            end)
        end

        local teams = {}
        for _, player in players:GetPlayers() do
            local team = player.Team or "Nil"

            if not teams[team] then
                teams[team] = {}
            end

            insert(teams[team], player)
        end

        for _, team in teams do
            for _, player in team do
                insert(data, player)
                updateTeam(player)
            end
        end

        updateListText()

        table.insert(connectionList, players.PlayerAdded:Connect(function(player)
            if player.Team then
                setTeam(player, player.Team)
            end

            updateTeam(player)
            updateListText()
        end))

        table.insert(connectionList, players.PlayerRemoving:Connect(function(player)
            table.remove(data, table.find(data, player))

            if table.find(status, player) then
                status[player] = nil
            end

            if list.selected == player then
                list.playerPFP.Data = blankData
                list.playertext.Text = "No Player Selected"
                list.selected = nil
            end

            updateListText()
        end))

        return updateListText
    end

    local playerlists = {}
    local function createPlayerList(self, statuslist, callbacks)
        local playerlist = {playerdata = {}, listdata = {}, playerstatus = {}, scrollcount = 0} -- , selected = nil
        local visible = self.menu.open and self.tabIndex == self.menu.tabIndex
        local height = 344
        playerlist.type = "playerlist"
        playerlist.statuslist = statuslist
        playerlist.status = callbacks.status
        playerlist.votekick = callbacks.votekick
        playerlist.spectate = callbacks.spectate
        playerlist.outline = self.menu:draw("Square", {Size = v2(231 + 235, height), Position = self.menu.sectionbg.Position + v2(7, 3), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.highlightoutline = self.menu:draw("Square", {Size = v2(229 + 235, 4), Position = playerlist.outline.Position + v2(1, 1), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.highlight = modifyDrawing(self.menu:gradient({wapus.theme.accent:Lerp(Color3.new(1, 1, 1), 0.1), wapus.theme.accent, darken(wapus.theme.accent, 0.4)}, 3), {Size = v2(229 + 235, 3), Position = playerlist.highlightoutline.Position, Color = wapus.theme.accent, Visible = visible})
        playerlist.buttons = self.menu:draw("Square", {Size = v2(229 + 235, 20), Position = playerlist.highlightoutline.Position + v2(0, 4), Color = wapus.theme.hidden, Visible = visible}, "hidden")
        playerlist.buttonoutline = self.menu:draw("Square", {Position = playerlist.highlightoutline.Position + v2(0, 4), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.button = self.menu:draw("Square", {Position = playerlist.highlightoutline.Position + v2(0, 4), Color = wapus.theme.background, Visible = visible}, "background")
        playerlist.buttonbackground = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 8), {Position = playerlist.highlightoutline.Position + v2(0, 4), Color = wapus.theme.background, Visible = visible})
        playerlist.text = self.menu:draw("Text", {Size = 14, Color = wapus.theme.text, Center = true, Text = "Player List", Visible = visible}, "text")
        playerlist.button.Size = v2(10 + playerlist.text.TextBounds.X, 21)
        playerlist.buttonbackground.Size = playerlist.button.Size
        playerlist.buttonbackground.ZIndex = 2
        playerlist.buttonoutline.Size = v2(11 + playerlist.text.TextBounds.X, 21)
        playerlist.text.Position = playerlist.buttons.Position + v2(5 + playerlist.text.TextBounds.X * 0.5, 4)
        playerlist.text.ZIndex = 3
        playerlist.background = self.menu:draw("Square", {Size = v2(229 + 235, height - 27), Position = playerlist.outline.Position + v2(1, 26), Color = wapus.theme.background, Visible = visible}, "background")
        playerlist.playerBoxOutline = self.menu:draw("Square", {Size = v2(229 + 235 - 16, 210), Position = playerlist.outline.Position + v2(9, 26 + 18), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.playerBoxBackground = self.menu:draw("Square", {Size = v2(229 + 235 - 16 - 2, 208), Position = playerlist.outline.Position + v2(10, 26 + 19), Color = wapus.theme.background, Visible = visible}, "background")
        playerlist.playerPFPOutline = self.menu:draw("Square", {Size = v2(74, 74), Position = playerlist.outline.Position + v2(9, 26 + 18 + 8 + 210), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.playerPFP = self.menu:draw("Image", {Size = v2(72, 72), Position = playerlist.outline.Position + v2(10, 26 + 18 + 8 + 211), Data = blankData, Visible = visible}, "outline")
        --playerlist.playerPFP = self.menu:draw("Square", {Size = v2(72, 72), Position = playerlist.outline.Position + v2(10, 26 + 18 + 8 + 211), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.statusbuttonoutline = self.menu:draw("Square", {Size = v2(149, 20), Position = playerlist.outline.Position + v2(308, 26 + 18 + 210 + 22), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.statusbutton = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 6), {Size = v2(147, 18), Position = playerlist.outline.Position + v2(309, 26 + 18 + 210 + 23), Visible = visible})
        playerlist.votekickbuttonoutline = self.menu:draw("Square", {Size = v2(69, 20), Position = playerlist.outline.Position + v2(308, 26 + 18 + 210 + 53), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.votekickbutton = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 6), {Size = v2(67, 18), Position = playerlist.outline.Position + v2(309, 26 + 18 + 210 + 54), Visible = visible})
        playerlist.spectatebuttonoutline = self.menu:draw("Square", {Size = v2(69, 20), Position = playerlist.outline.Position + v2(308 + 80, 26 + 18 + 210 + 53), Color = wapus.theme.outline, Visible = visible}, "outline")
        playerlist.spectatebutton = modifyDrawing(self.menu:gradient({wapus.theme.lightbackground, wapus.theme.background}, 6), {Size = v2(67, 18), Position = playerlist.outline.Position + v2(308 + 81, 26 + 18 + 210 + 54), Visible = visible})

        playerlist.nametext = self.menu:draw("Text", {Position = playerlist.playerBoxOutline.Position + v2(4, -17), Size = 14, Color = wapus.theme.text, Text = "Name", Visible = visible}, "text")
        playerlist.teamtext = self.menu:draw("Text", {Position = playerlist.playerBoxOutline.Position + v2(4 + 148, -17), Size = 14, Color = wapus.theme.text, Text = "Team", Visible = visible}, "text")
        playerlist.statuslabeltext = self.menu:draw("Text", {Position = playerlist.playerBoxOutline.Position + v2(4 + 298, -17), Size = 14, Color = wapus.theme.text, Text = "Status", Visible = visible}, "text")
        playerlist.playertext = self.menu:draw("Text", {Position = playerlist.playerPFP.Position + v2(78, -2), Size = 14, Color = wapus.theme.text, Text = "No Player Selected", Visible = visible}, "text")
        playerlist.playerstatustext = self.menu:draw("Text", {Position = playerlist.statusbuttonoutline.Position + v2(-1, -17), Size = 14, Color = wapus.theme.text, Text = "Player Status", Visible = visible}, "text")
        playerlist.statustext = self.menu:draw("Text", {Position = playerlist.playerstatustext.Position + v2(6, 19), Size = 14, Color = wapus.theme.text, Text = "None", Visible = visible}, "text")
        playerlist.droptext = self.menu:draw("Text", {Position = playerlist.playerstatustext.Position + v2(137, 20), Size = 14, Color = wapus.theme.text, Text = "-", Visible = visible}, "text")
        playerlist.votekicktext = self.menu:draw("Text", {Position = playerlist.votekickbutton.Position + v2(33, 1), Size = 14, Center = true, Color = wapus.theme.text, Text = "Votekick", Visible = visible}, "text")
        playerlist.spectatetext = self.menu:draw("Text", {Position = playerlist.spectatebutton.Position + v2(33, 1), Size = 14, Center = true, Color = wapus.theme.text, Text = "Spectate", Visible = visible}, "text")

        playerlist.carrot = self.menu:draw("Text", {Position = playerlist.playerBoxBackground.Position + v2(437, -1), Size = 14, Outline = false, Color = wapus.theme.accent, Text = "^", Visible = visible}, "accent")
        playerlist.tinyv = self.menu:draw("Text", {Position = playerlist.playerBoxBackground.Position + v2(437, 195), Size = 11, Outline = false, Color = wapus.theme.accent, Text = "v", Visible = visible}, "accent")

        playerlist.playerdrawings = {}
        for playerIndex = 1, 9 do
            local drawinglist = {}

            if playerIndex ~= 9 then
                drawinglist.sectionline = self.menu:draw("Square", {Size = v2(438, 1), Position = playerlist.playerBoxBackground.Position + v2(4, 23 * playerIndex), Color = wapus.theme.outline, Visible = visible}, "outline")
            end

            drawinglist.teamline = self.menu:draw("Square", {Size = v2(1, playerIndex ~= 9 and 16 or 17), Position = playerlist.playerBoxBackground.Position + v2(148, 23 * (playerIndex - 1) + 4), Color = wapus.theme.outline, Visible = visible}, "outline")
            drawinglist.statusline = self.menu:draw("Square", {Size = v2(1, playerIndex ~= 9 and 16 or 17), Position = playerlist.playerBoxBackground.Position + v2(298, 23 * (playerIndex - 1) + 4), Color = wapus.theme.outline, Visible = visible}, "outline")
            drawinglist.name = self.menu:draw("Text", {Position = playerlist.playerBoxBackground.Position + v2(4, 23 * (playerIndex - 1) + 5), Size = 14, Color = wapus.theme.text, Text = "", Visible = visible}, "text")
            drawinglist.team = self.menu:draw("Text", {Position = playerlist.playerBoxBackground.Position + v2(152, 23 * (playerIndex - 1) + 5), Size = 14, Color = wapus.theme.text, Text = "", Visible = visible}, "text")
            drawinglist.status = self.menu:draw("Text", {Position = playerlist.playerBoxBackground.Position + v2(302, 23 * (playerIndex - 1) + 5), Size = 14, Color = wapus.theme.text, Text = "", Visible = visible}, "text")

            playerlist.playerdrawings[playerIndex] = drawinglist
        end

        self.left += height + 4
        self.right += height + 4
        playerlist.updatelist = initPlayerList(playerlist)
        insert(self.mainSections, playerlist)
        insert(playerlists, playerlist)
        return playerlist
    end

    local function createTab(self, text)
        local tab = {}
        tab.tabIndex = #self.tabs + 1
        tab.button = self["tab" .. tostring(tab.tabIndex)]
        tab.title = self:draw("Text", {Size = 15, Position = tab.button.Position + v2(48, 11), Color = wapus.theme[tab.tabIndex == self.tabIndex and "text" or "hiddenText"], Text = text, Center = true, Visible = self.open}, "text")
        tab.CreateSection = createSection
        tab.CreatePlayerList = createPlayerList
        tab.menu = self
        tab.left = 0
        tab.right = 0
        tab.mainSections = {}
        insert(self.tabs, tab)
        return tab
    end

    local function destroyKeyList(self) -- idec if it lags prolly wont be much
        for _, drawing in self.keys.drawCache do
            pcall(function()
                drawing:Remove()
            end)
        end

        self.keys = nil
        self.DestroyKeyList = nil
        self.UpdateKeyList = nil
    end

    local white = Color3.new(1, 1, 1)
    local darker = Color3.new(0.65, 0.65, 0.65)

    local function createKeyList(self, includeKeyName)
        local keys = {}
        keys.include = includeKeyName
        keys.drawCache = {}
        keys.draw = draw
        keys.gradient = gradient
        keys.outline = keys:draw("Square", {Color = wapus.theme.outline, Visible = true}, "outline")
        keys.background = keys:draw("Square", {Color = wapus.theme.background, Visible = true}, "background")
        keys.titlebackground = modifyDrawing(keys:gradient({wapus.theme.lightbackground, wapus.theme.background}, 7), {Color = wapus.theme.accent, Visible = true})
        keys.highlightoutline = keys:draw("Square", {Color = wapus.theme.outline, Visible = true}, "outline")
        keys.highlight = modifyDrawing(keys:gradient({wapus.theme.accent:Lerp(Color3.new(1, 1, 1), 0.1), wapus.theme.accent, darken(wapus.theme.accent, 0.4)}, 3), {Color = wapus.theme.accent, Visible = true})
        keys.title = keys:draw("Text", {Size = 16, Color = wapus.theme.text, Text = "Keybinds", Visible = true}, "text")

        local function updateKeybinds()
            if keys.keybinds then
                for _, keyData in keys.keybinds do
                    keyData[1]:Remove()
                end
            end

            local newkeybinds = {}

            for _, keyData in self.keybinds do
                local keyName, keybind = table.unpack(keyData)
                local text = keybind.toggle.section.text.Text .. ": " .. keybind.toggle.text.Text

                if keys.include then
                    text = text .. " [ " .. keyName .. " ]"
                end

                insert(newkeybinds, {keys:draw("Text", {Size = 16, Color = wapus.theme.text, Text = text, Visible = true}, "text"), keybind})
            end

            keys.keybinds = newkeybinds
        end

        local function updateList()
            local keycount = #keys.keybinds
            local height = 23 + 16 * keycount
            local width = 150

            for _, bindData in keys.keybinds do
                local text, keybind = table.unpack(bindData)
                local bounds = text.TextBounds.X + 4

                if bounds > width then
                    width = bounds
                end
            end

            local size = v2(width, height)
            keys.outline.Position = v2(9, workspace.CurrentCamera.ViewportSize.Y * 0.5 - height * 0.5 - 1)
            keys.outline.Size = size + v2(2, 2)
            keys.background.Position = keys.outline.Position + v2(1, 1)
            keys.background.Size = size
            keys.titlebackground.Position = keys.background.Position + v2(0, 5)
            keys.titlebackground.Size = v2(width, 14)
            keys.highlightoutline.Position = keys.outline.Position
            keys.highlightoutline.Size = v2(width + 2, 5)
            keys.highlight.Position = keys.background.Position
            keys.highlight.Size = v2(width, 3)
            keys.title.Position = keys.background.Position + v2(2, 3)

            for keyIndex = 1, keycount do
                local text, keybind = table.unpack(keys.keybinds[keyIndex])
                text.Color = keybind.toggle.value and white or darker
                text.Position = keys.title.Position + v2(0, keyIndex * 16 + 1)
            end
        end

        local function updateKeyList()
            updateKeybinds()
            runService.RenderStepped:Wait()
            updateList()
        end

        keys.updateKeybinds = updateKeybinds
        keys.updateList = updateList
        self.keys = keys
        self.DestroyKeyList = destroyKeyList
        self.UpdateKeyList = updateKeyList
        updateKeyList()
    end

    function wapus:CreateMenu(title, visible, index)
        if visible == nil then
            visible = true
        end

        local menu = {}
        menu.drawCache = {}
        menu.draw = draw
        menu.gradient = gradient
        local bgSize = v2(500, 600)
        menu.open = visible
        self.open = visible
        menu.tabIndex = index and math.clamp(index, 1, 5) or 1
        menu.outline = menu:draw("Square", {Size = bgSize + v2(2, 2), Position = middle - bgSize * 0.5 - v2(1, 1), Color = self.theme.outline, Visible = visible}, "outline")
        menu.background = menu:draw("Square", {Size = bgSize, Position = middle - bgSize * 0.5, Color = self.theme.background, Visible = visible}, "background")
        menu.outline2 = menu:draw("Square", {Size = v2(502, 4), Position = menu.outline.Position, Color = self.theme.outline, Visible = visible}, "outline")
        menu.highlightoutline = menu:draw("Square", {Size = v2(500, 4), Position = menu.background.Position, Color = self.theme.outline, Visible = visible}, "outline")
        menu.highlight = modifyDrawing(menu:gradient({self.theme.accent:Lerp(Color3.new(1, 1, 1), 0.1), self.theme.accent, darken(self.theme.accent, 0.4)}, 3), {Size = v2(500, 3), Position = menu.background.Position, Color = self.theme.accent, Visible = visible})
        menu.titlebackground = modifyDrawing(menu:gradient({self.theme.lightbackground, self.theme.background}, 7), {Size = v2(500, 21), Position = menu.background.Position + v2(0, 4), Color = self.theme.accent, Visible = visible})
        menu.title = menu:draw("Text", {Size = 16, Position = menu.background.Position + v2(5, 5), Color = self.theme.text, Text = title, Visible = visible}, "text")
        menu.inline = menu:draw("Square", {Size = bgSize + v2(2 - 20, 2 - 35), Position = menu.outline.Position + v2(10, 25), Color = self.theme.outline, Visible = visible}, "outline")
        menu.tab1 = menu:draw("Square", {Size = v2(95, 35), Position = menu.inline.Position + v2(1, 3), Color = self.theme.hidden, Visible = visible}, "hidden")
        menu.tab2 = menu:draw("Square", {Size = v2(95, 35), Position = menu.tab1.Position + v2(96, 0), Color = self.theme.hidden, Visible = visible}, "hidden")
        menu.tab3 = menu:draw("Square", {Size = v2(96, 35), Position = menu.tab2.Position + v2(96, 0), Color = self.theme.hidden, Visible = visible}, "hidden")
        menu.tab4 = menu:draw("Square", {Size = v2(95, 35), Position = menu.tab3.Position + v2(97, 0), Color = self.theme.hidden, Visible = visible}, "hidden")
        menu.tab5 = menu:draw("Square", {Size = v2(95, 35), Position = menu.tab4.Position + v2(96, 0), Color = self.theme.hidden, Visible = visible}, "hidden")
        menu.tabbackground = modifyDrawing(menu:gradient({self.theme.lightbackground, self.theme.background}, 14), {Visible = visible})
        menu.inlightoutline = menu:draw("Square", {Size = v2(480, 4), Position = menu.inline.Position + v2(1, 1), Color = self.theme.outline, Visible = visible}, "outline")
        --menu.inlight = menu:draw("Square", {Size = v2(480, 2), Position = menu.inlightoutline.Position, Color = self.theme.accent, Visible = visible}, "accent")
        menu.inlight = modifyDrawing(menu:gradient({self.theme.accent:Lerp(Color3.new(1, 1, 1), 0.20), self.theme.accent, darken(self.theme.accent, 0.4)}, 3), {Size = v2(480, 3), Position = menu.inlightoutline.Position, Color = self.theme.accent, Visible = visible})
        menu.sectionbg = menu:draw("Square", {Size = v2(480, 527), Position = menu.inlight.Position + v2(0, 38), Color = self.theme.background, Visible = visible}, "background")
        menu.sectionIndexes = {}
        menu.tabs = {}
        menu.keybinds = {}
        menu.UpdateTheme = updateTheme
        menu.GetValue = getValue
        menu.SetValue = setValue
        menu.CreateTab = createTab
        local selectedTab = menu["tab" .. tostring(menu.tabIndex)]
        selectedTab.Color = self.theme.background
        selectedTab.Size += v2(0, 1)
        menu.tabbackground.Position = selectedTab.Position
        menu.tabbackground.Size = selectedTab.Size
        menu.CreateKeyList = createKeyList

        insert(self.menus, menu)
        return menu
    end

    local function checkBounds(rel, size)
        local x0, y0 = rel.X, rel.Y
        local x1, y1 = size.X, size.Y
        return x0 >= 0 and x0 <= x1 and y0 >= 0 and y0 <= y1
    end

    local function checkDrawing(mouse, drawing)
        return checkBounds(mouse - drawing.Position, drawing.Size)
    end

    local function getSectionDrawings(section)
        local drawings = {}

        for _, elementData in section.elements do
            if elementData.type == "toggle" then
                insert(drawings, elementData.buttonoutline)
                insert(drawings, elementData.button)
                insert(drawings, elementData.text)

                if elementData.keybind then
                    insert(drawings, elementData.keybind.buttonoutline)
                    insert(drawings, elementData.keybind.button)
                    insert(drawings, elementData.keybind.text)
                end

                for colorIndex = 1, #elementData.colors do
                    local colorData = elementData.colors[colorIndex]
                    insert(drawings, colorData.buttonoutline)
                    insert(drawings, colorData.buttonbackground)
                    insert(drawings, colorData.button)
                end
            elseif elementData.type == "slider" then
                insert(drawings, elementData.buttonoutline)
                insert(drawings, elementData.button)
                insert(drawings, elementData.highlight)
                insert(drawings, elementData.text)
                insert(drawings, elementData.valuetext)
            elseif elementData.type == "dropdown" then
                insert(drawings, elementData.buttonoutline)
                insert(drawings, elementData.button)
                insert(drawings, elementData.text)
                insert(drawings, elementData.valuetext)
                insert(drawings, elementData.droptext)
            elseif elementData.type == "button" then
                insert(drawings, elementData.buttonoutline)
                insert(drawings, elementData.button)
                insert(drawings, elementData.text)
            elseif elementData.type == "textbox" then
                insert(drawings, elementData.buttonoutline)
                insert(drawings, elementData.button)
                insert(drawings, elementData.text)
                insert(drawings, elementData.valuetext)
            end
        end

        return drawings
    end

    local function getTabDrawings(tab)
        local drawings = {}

        for _, sectionData in tab.mainSections do
            if sectionData.type == "playerlist" then
                insert(drawings, sectionData.outline)
                insert(drawings, sectionData.highlightoutline)
                insert(drawings, sectionData.highlight)
                insert(drawings, sectionData.buttons)
                insert(drawings, sectionData.buttonoutline)
                insert(drawings, sectionData.button)
                insert(drawings, sectionData.buttonbackground)
                insert(drawings, sectionData.text)
                insert(drawings, sectionData.background)
                insert(drawings, sectionData.playerBoxOutline)
                insert(drawings, sectionData.playerBoxBackground)
                insert(drawings, sectionData.playerPFPOutline)
                insert(drawings, sectionData.playerPFP)
                insert(drawings, sectionData.statusbuttonoutline)
                insert(drawings, sectionData.statusbutton)
                insert(drawings, sectionData.votekickbuttonoutline)
                insert(drawings, sectionData.votekickbutton)
                insert(drawings, sectionData.spectatebuttonoutline)
                insert(drawings, sectionData.spectatebutton)
                insert(drawings, sectionData.nametext)
                insert(drawings, sectionData.teamtext)
                insert(drawings, sectionData.statuslabeltext)
                insert(drawings, sectionData.playertext)
                insert(drawings, sectionData.playerstatustext)
                insert(drawings, sectionData.statustext)
                insert(drawings, sectionData.droptext)
                insert(drawings, sectionData.votekicktext)
                insert(drawings, sectionData.spectatetext)
                insert(drawings, sectionData.carrot)
                insert(drawings, sectionData.tinyv)

                for _, playerDrawingData in sectionData.playerdrawings do
                    if playerDrawingData.sectionline then
                        insert(drawings, playerDrawingData.sectionline)
                    end

                    insert(drawings, playerDrawingData.teamline)
                    insert(drawings, playerDrawingData.statusline)
                    insert(drawings, playerDrawingData.name)
                    insert(drawings, playerDrawingData.team)
                    insert(drawings, playerDrawingData.status)
                end
            else
                insert(drawings, sectionData.outline)
                insert(drawings, sectionData.highlightoutline)
                insert(drawings, sectionData.buttons)
                insert(drawings, sectionData.highlight)
                insert(drawings, sectionData.background)

                for sectionIndex, section in sectionData.sections do
                    insert(drawings, section.buttonoutline)
                    insert(drawings, section.buttonbackground)
                    insert(drawings, section.button)
                    insert(drawings, section.text)

                    if sectionIndex == sectionData.sectionIndex then
                        for _, drawing in getSectionDrawings(section) do
                            insert(drawings, drawing)
                        end
                    end
                end
            end
        end

        return drawings
    end

    local lastPos, dragging, sliding, dropping, statusdropping, typing, waiting, picking -- cotton
    local fadeDuration = 0.125
    local fadeSteps = 15
    local lastToggle = 0
    local keyboard = "QWERTYUIOPASDFGHJKLZXCVBNM"
    local shiftkeys = {Backquote = "~", One = "!", Two = "@", Three = "#", Four = "$", Five = "%", Six = "^", Seven = "&", Eight = "*", Nine = "(", Zero = ")", Minus = "_", Equals = "+", LeftBracket = "{", RightBracket = "]", BackSlash = "|", Semicolon = ":", Quote = '"', Comma = "<", Period = ">", Slash = "?"}
    local keynames = {Space = " ", QuotedDouble = '"', Hash = "#", Dollar = "$", Percent = "%", Ampersand = "&", Quote = "'", LeftParenthesis = "(", RightParenthesis = ")", Asterisk = "*", Plus = "+", Comma = ",", Minus = "-", Period = ".", Slash = "/", Zero = "0", One = "1", Two = "2", Three = "3", Four = "4", Five = "5", Six = "6", Seven = "7", Eight = "8", Nine = "9", Colon = ":", Semicolon = ";", LessThan = "<", Equals = "=", GreaterThan = ">", Question = "?", At = "@", LeftBracket = "[", BackSlash = "\\", RightBracket = "]", Caret = "^", Underscore = "_", Backquote = "`", LeftCurly = "{", Pipe = "|", RightCurly = "}", Tilde = "~"}
    table.insert(connectionList, userInputService.InputBegan:Connect(function(input)
        if input.KeyCode ~= Enum.KeyCode.Unknown then
            local key = input.KeyCode.Name

            if typing then
                local text = typing.valuetext.Text

                if key == "Backspace" or key == "Delete" then
                    text = string.sub(text, 1, string.len(text) - 1)
                elseif key == "Return" or key == "Escape" then
                    typing:SetValue(text)
                    typing = false
                    return
                elseif key == "V" and (userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or userInputService:IsKeyDown(Enum.KeyCode.RightControl)) and keypress and keyrelease then
                    task.spawn(function()
                        local screenGui = Instance.new("ScreenGui", game.CoreGui) -- erm is this iray code?
                        local textBox = Instance.new("TextBox", screenGui) -- first person to tell iray where this is pasted from with proof gets a free nihon key
                        textBox.TextTransparency = 1
                        textBox:CaptureFocus()
                        keypress(0x11)
                        keypress(0x56)
                        task.wait(1/60)
                        keyrelease(0x11)
                        keyrelease(0x56)
                        textBox:ReleaseFocus()
                        text = text .. textBox.Text
                        textBox:Destroy()
                        screenGui:Destroy()
                    end)
                else
                    local lower = not userInputService:IsKeyDown(Enum.KeyCode.LeftShift) and not userInputService:IsKeyDown(Enum.KeyCode.RightShift)

                    if string.find(keyboard, key) then
                        if lower then
                            key = string.lower(key)
                        end

                        text = text .. key
                    elseif not lower and shiftkeys[key] then
                        text = text .. shiftkeys[key]
                    elseif keynames[key] then
                        text = text .. keynames[key]
                    end
                end

                typing.valuetext.Text = text
                return
            end

            if waiting then
                if key == "Escape" then
                    waiting:SetValue()
                    waiting = false
                else
                    waiting:SetValue(key)
                    waiting = false
                end

                return
            end

            for _, menuData in wapus.menus do
                for _, keyData in menuData.keybinds do
                    if key == keyData[1] then
                        keyData[2].toggle:SetValue(not keyData[2].toggle.value)

                        if menuData.keys and menuData.keys.updateList then
                            menuData.keys.updateList()
                        end
                    end
                end
            end

            local clockTime = os.clock()
            if input.KeyCode == Enum.KeyCode[wapus.toggleKeybind] and clockTime - lastToggle > fadeDuration * 2 and not dragging and not sliding and not dropping and not picking then
                wapus.open = not wapus.open
                lastToggle = clockTime

                for _, menu in wapus.menus do
                    local trans = (wapus.open and 0 or 1) --menu.background.Transparency
                    local stepFactor = 1 / fadeSteps
                    local step = stepFactor * (wapus.open and 1 or -1)
                    local stepDur = stepFactor * fadeDuration
                    local drawings = {
                        menu.outline,
                        menu.background,
                        menu.outline2,
                        menu.highlightoutline,
                        menu.highlight,
                        menu.title,
                        menu.inline,
                        menu.tab1,
                        menu.tab2,
                        menu.tab3,
                        menu.tab4,
                        menu.tab5,
                        menu.inlightoutline,
                        menu.inlight,
                        menu.sectionbg,
                        menu.titlebackground,
                        menu.tabbackground
                    }
                    menu.open = wapus.open

                    if menu.updateCache then
                        menu.updateCache()
                    end

                    for _, drawing in getTabDrawings(menu.tabs[menu.tabIndex]) do
                        insert(drawings, drawing)
                    end

                    for _, tabData in menu.tabs do
                        insert(drawings, tabData.title)
                    end

                    task.spawn(function()
                        if wapus.open then
                            for _, drawing in drawings do
                                drawing.Visible = true
                            end
                        end

                        for _ = 1, fadeSteps do
                            trans = trans + step

                            for _, drawing in drawings do
                                drawing.Transparency = trans
                            end

                            task.wait(stepDur)
                        end

                        if not wapus.open then
                            for _, drawing in drawings do
                                drawing.Visible = false
                            end
                        end
                    end)
                end
            end
        end
    end))

    table.insert(connectionList, userInputService.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseWheel then
            for _, list in playerlists do
                if list.playerBoxBackground.Visible and checkDrawing(userInputService:GetMouseLocation(), list.playerBoxBackground) then
                    list.scrollcount = math.max(math.min(list.scrollcount + ((input.Position.Z > 0) and 1 or -1), 0), -#list.playerdata + 9)
                    list.updatelist()
                end
            end
        end
    end))

    local pickerUpdateFPS = 60 -- limiting update speed to reduce lag
    local pickerUpdateRate = 1 / pickerUpdateFPS
    local wasDown = false

    local lastMenuRefresh = tick();
    table.insert(connectionList, runService.RenderStepped:Connect(function(delta)
        if tick() - lastMenuRefresh < 1/30 then return end;
        lastMenuRefresh = tick();
        local down = userInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
        local clicked = down and not wasDown
        wasDown = down

        if wapus.open then
            if sliding then
                if down then
                    local relpos = userInputService:GetMouseLocation().X - sliding.button.Position.X
                    local fraction = math.clamp(relpos, 0, 211) / 211
                    local range = sliding.max - sliding.min
                    local factor = math.floor(range * fraction / sliding.step + 0.5)
                    sliding:SetValue(sliding.min + factor * sliding.step)
                    return
                else
                    sliding = false
                end
            end

            if dropping then
                if clicked then
                    local mouse = userInputService:GetMouseLocation()
                    local newoption = dropping.value

                    for optionIndex, option in dropping.optionDrawings do
                        if checkDrawing(mouse, option.button) then
                            newoption = option.valuetext.Text
                        end

                        for _, drawing in option do
                            drawing:Remove()
                        end
                    end

                    dropping:SetValue(newoption)
                    dropping.optionDrawings = nil
                    dropping = false
                end

                return
            end

            if statusdropping then
                if clicked then
                    local mouse = userInputService:GetMouseLocation()
                    local selectedstatus

                    for _, buttonData in statusdropping.buttons do
                        if checkDrawing(mouse, buttonData.button) then
                            selectedstatus = buttonData.status
                            break
                        end
                    end

                    for _, drawing in statusdropping.drawCache do
                        drawing:Remove()
                    end

                    if selectedstatus then
                        local player = statusdropping.list.selected
                        statusdropping.list.playerstatus[player] = selectedstatus
                        statusdropping.list.status(player, selectedstatus)
                        statusdropping.list.updatelist()
                    end

                    statusdropping = nil
                end

                return
            end

            if typing then
                if clicked then
                    typing:SetValue(typing.valuetext.Text)
                    typing = false
                end

                return
            end

            if waiting then
                if clicked then
                    waiting:SetValue()
                    waiting = false
                end

                return
            end

            if picking then
                local mouse = userInputService:GetMouseLocation()
                local picker = picking.picker

                if clicked then -- i wanna kmsssss
                    if checkDrawing(mouse, picker.outline) then
                        local clock = os.clock()

                        if mouse.Y < picker.outline.Position.Y + 18 then
                            picker.dragging = {mouse, clock}
                        elseif checkDrawing(mouse, picker.hsvOutline) then
                            picker.clicked = {"hsv", clock, Vector2.zero}
                        elseif checkDrawing(mouse, picker.hue) then
                            picker.clicked = {"hue", clock, Vector2.zero}
                        elseif checkDrawing(mouse, picker.valuebar) then
                            picker.clicked = {"val", clock, Vector2.zero}
                        elseif checkBounds(mouse - (picker.background.Position + v2(193, 135)), v2(80, 80)) then
                            for _, drawing in picker.drawCache do
                                drawing:Remove()
                            end

                            picking:SetValue(Color3.fromHSV(table.unpack(picker.current)))
                            picking.picker = nil
                            picking = nil
                        end
                    else
                        for _, drawing in picker.drawCache do
                            drawing:Remove()
                        end

                        picking:SetValue(picking.value)
                        picking.picker = nil
                        picking = nil
                    end
                elseif down then
                    local clock = os.clock()

                    if picker.dragging then
                        local oldPos, oldTime = table.unpack(picker.dragging)

                        if clock > oldTime + pickerUpdateRate then
                            local offset = mouse - oldPos

                            if offset.Magnitude > 0 then
                                for _, drawing in picker.drawCache do
                                    drawing.Position = drawing.Position + offset
                                end

                                picker.dragging = {mouse, clock}
                            end
                        end
                    end

                    if picker.clicked then
                        local clicktype, oldTime, oldMouse = table.unpack(picker.clicked)

                        if clock > oldTime + pickerUpdateRate and (mouse - oldMouse).Magnitude > 0 then
                            if clicktype == "hsv" then
                                local bgpos = picker.hsvOutline.Position + v2(1, 1)
                                local rel = mouse - bgpos
                                local x, y = math.clamp(rel.X, 0, 166), math.clamp(rel.Y, 0, 166)
                                local sat = x / 166
                                local val = 1 - (y / 166)
                                picker.newColor.Color = Color3.fromHSV(picker.current[1], sat, val)
                                picker.current[2] = sat
                                picker.current[3] = val
                                picker.hsvButtonOutline.Position = bgpos + v2(x - 3, y - 3)
                                picker.hsvButton.Position = bgpos + v2(x - 2, y - 2)
                                picker.valueButtonOutline.Position = v2(picker.valuebar.Position.X + 166 - y - 3, picker.valueButtonOutline.Position.Y)
                                picker.valueButton.Position = picker.valueButtonOutline.Position + v2(1, 1)
                            elseif clicktype == "val" then
                                local x = math.clamp(mouse.X - picker.valuebar.Position.X, 0, 166)
                                local val = x / 166
                                picker.newColor.Color = Color3.fromHSV(picker.current[1], picker.current[2], val)
                                picker.current[3] = val
                                picker.valueButtonOutline.Position = v2(picker.valuebar.Position.X + x - 3, picker.valueButtonOutline.Position.Y)
                                picker.valueButton.Position = picker.valueButtonOutline.Position + v2(1, 1)
                                picker.hsvButtonOutline.Position = v2(picker.hsvButtonOutline.Position.X, picker.hsvOutline.Position.Y + 166 - x - 2)
                                picker.hsvButton.Position = picker.hsvButtonOutline.Position + v2(1, 1)
                            elseif clicktype == "hue" then
                                local y = math.clamp(mouse.Y - picker.hue.Position.Y, 0, 166)
                                local hue = (166 - y) / 166
                                picker.newColor.Color = Color3.fromHSV(hue, picker.current[2], picker.current[3])
                                picker.current[1] = hue
                                picker.hueButtonOutline.Position = v2(picker.hueButtonOutline.Position.X, picker.hue.Position.Y + y - 3)
                                picker.hueButton.Position = picker.hueButtonOutline.Position + v2(1, 1)
                                picker.clicked[2] = clock
                                picker.hueSquare.Color = Color3.fromHSV(hue, 1, 1)
                                --local xMax = #picker.colordrawings
                                --local yMax = picker.colordrawings[1]; yMax = #yMax
                                --for x = 0, xMax do -- more lag
                                --	local sat = x / xMax
                                --
                                --	for y = 0, yMax do
                                --		local value = 1 - (y / yMax)
                                --		picker.colordrawings[x][y].Color = Color3.fromHSV(hue, sat, value)
                                --	end
                                --end
                            end
                        end
                    end
                elseif picker.dragging then
                    picker.dragging = false
                elseif picker.clicked then
                    picker.clicked = false
                end

                return
            end

            for _, menuData in wapus.menus do
                if menuData.open then
                    local mouse = userInputService:GetMouseLocation()
                    local onMenu = checkDrawing(mouse, menuData.outline)
                    local onInside = onMenu and checkDrawing(mouse, menuData.inline)

                    if clicked and not dragging and onMenu and not onInside then
                        dragging = true
                        lastPos = mouse
                    end

                    if dragging and down then
                        local offset = mouse - lastPos

                        if offset.Magnitude > 0 then
                            for _, drawing in menuData.drawCache do
                                drawing.Position = drawing.Position + offset
                            end

                            lastPos = mouse
                        end
                    else
                        dragging = false
                    end

                    if onInside then
                        local sectionbg = menuData.sectionbg.Position

                        if mouse.Y < sectionbg.Y then
                            if clicked then
                                local newIndex = math.clamp(math.ceil((mouse.X - sectionbg.X) / 96), 1, 5)
                                local oldTab = menuData.tabs[menuData.tabIndex]
                                local newTab = menuData.tabs[newIndex]
                                oldTab.title.Color = wapus.theme.hiddenText
                                newTab.title.Color = wapus.theme.text
                                local oldButton = menuData["tab" .. tostring(menuData.tabIndex)]
                                local newButton = menuData["tab" .. tostring(newIndex)]
                                oldButton.Size = oldButton.Size - v2(0, 1)
                                newButton.Size = newButton.Size + v2(0, 1)
                                oldButton.Color = wapus.theme.hidden
                                newButton.Color = wapus.theme.background
                                menuData.tabbackground.Position = newButton.Position
                                menuData.tabbackground.Size = newButton.Size

                                for _, drawing in getTabDrawings(oldTab) do
                                    drawing.Visible = false
                                end

                                for _, drawing in getTabDrawings(newTab) do
                                    drawing.Visible = true
                                end

                                menuData.tabIndex = newIndex

                                if menuData.updateCache then
                                    menuData.updateCache()
                                end
                            end
                        else
                            for _, sectionData in menuData.tabs[menuData.tabIndex].mainSections do
                                if sectionData.type == "playerlist" then
                                    if clicked and checkDrawing(mouse, sectionData.outline) then
                                        if checkDrawing(mouse, sectionData.playerBoxBackground) then
                                            local index = math.min(math.ceil((mouse.Y - sectionData.playerBoxBackground.Position.Y) / 23), 9)
                                            local player = sectionData.playerdata[index - sectionData.scrollcount]

                                            if player and player ~= localplayer then
                                                sectionData.selected = player
                                                sectionData.playerPFP.Data = players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) or blankData
                                                sectionData.playertext.Text = player.Name
                                            end
                                        end

                                        if sectionData.selected then
                                            if checkDrawing(mouse, sectionData.votekickbuttonoutline) then
                                                sectionData.votekick(sectionData.selected)
                                            end

                                            if checkDrawing(mouse, sectionData.spectatebuttonoutline) then
                                                sectionData.votekick(sectionData.selected)
                                            end

                                            local statusButton = sectionData.statusbuttonoutline
                                            if checkDrawing(mouse, statusButton) then
                                                statusdropping = {list = sectionData, buttons = {}, drawCache = {}, draw = draw}

                                                for statusIndex = 1, #sectionData.statuslist + 1 do
                                                    local statusName = statusIndex == 1 and "None" or sectionData.statuslist[statusIndex - 1]
                                                    local buttonData = {}
                                                    buttonData.status = statusName
                                                    buttonData.outline = statusdropping:draw("Square", {Size = v2(149, 20), Position = statusButton.Position + v2(0, 19 * statusIndex), Color = wapus.theme.outline, Visible = true, ZIndex = 4}, "outline")
                                                    buttonData.button = statusdropping:draw("Square", {Size = v2(147, 18), Position = buttonData.outline.Position + v2(1, 1), Color = wapus.theme.background, Visible = true, ZIndex = 4}, "outline")
                                                    buttonData.text = statusdropping:draw("Text", {Position = buttonData.button.Position + v2(4, 1), Size = 14, Color = wapus.theme.text, Text = statusName, Visible = true, ZIndex = 4}, "text")
                                                    statusdropping.buttons[statusIndex] = buttonData
                                                end
                                            end
                                        end
                                    end
                                elseif checkDrawing(mouse, sectionData.outline) then
                                    if mouse.Y < sectionData.background.Position.Y then
                                        if clicked then
                                            for sectionIndex, section in sectionData.sections do
                                                if checkDrawing(mouse, section.button) then
                                                    local oldSec = sectionData.sections[sectionData.sectionIndex]
                                                    oldSec.text.Color = wapus.theme.hiddenText
                                                    section.text.Color = wapus.theme.text
                                                    oldSec.button.Size = oldSec.button.Size - v2(0, 1)
                                                    section.button.Size = section.button.Size + v2(0, 1)
                                                    oldSec.button.Color = wapus.theme.hidden
                                                    section.button.Color = wapus.theme.background
                                                    sectionData.buttonbackground.Position = section.button.Position
                                                    sectionData.buttonbackground.Size = section.button.Size

                                                    for _, drawing in getSectionDrawings(oldSec) do
                                                        drawing.Visible = false
                                                    end

                                                    for _, drawing in getSectionDrawings(section) do
                                                        drawing.Visible = true
                                                    end

                                                    sectionData.sectionIndex = sectionIndex
                                                end
                                            end
                                        end
                                    else
                                        if clicked then
                                            local section = sectionData.sections[sectionData.sectionIndex]
                                            local relPos = mouse - (sectionData.background.Position + v2(8, 4))
                                            local height = 0

                                            for elementIndex = 1, #section.elements do
                                                local element = section.elements[elementIndex]

                                                if checkBounds(relPos - v2(0, height), v2(230, element.height)) then
                                                    if element.type == "toggle" then
                                                        if element.keybind and checkDrawing(mouse, element.keybind.buttonoutline) then
                                                            element.keybind:SetValue()
                                                            element.keybind.text.Text = "..."
                                                            waiting = element.keybind
                                                            return
                                                        end

                                                        for _, color in element.colors do
                                                            if checkDrawing(mouse, color.buttonoutline) then
                                                                local picker = {
                                                                    drawCache = {},
                                                                    draw = draw,
                                                                    gradient = gradient
                                                                } -- i wanna kms
                                                                picker.outline = picker:draw("Square", {Position = color.toggle.buttonoutline.Position + v2(-57, -8), Size = v2(275, 217), Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.background = picker:draw("Square", {Position = picker.outline.Position + v2(1, 1), Size = v2(273, 215), Color = wapus.theme.background, Visible = true, ZIndex = 4})
                                                                picker.highlightbackground = picker:draw("Square", {Position = picker.outline.Position + v2(1, 1), Size = v2(273, 4), Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.highlight = modifyDrawing(picker:gradient({wapus.theme.accent:Lerp(Color3.new(1, 1, 1), 0.1), wapus.theme.accent, darken(wapus.theme.accent, 0.4)}, 3), {Position = picker.highlightbackground.Position, Size = v2(273, 3), Visible = true, ZIndex = 4})
                                                                picker.titlebackground = modifyDrawing(picker:gradient({wapus.theme.lightbackground, wapus.theme.background}, 6), {Size = v2(273, 17), Position = picker.background.Position + v2(0, 4), Visible = true, ZIndex = 4})
                                                                picker.title = picker:draw("Text", {Position = picker.background.Position + v2(3, 3), Size = 14, Color = wapus.theme.text, Text = color.name, Visible = true, ZIndex = 4})
                                                                picker.hsvOutline = picker:draw("Square", {Position = picker.background.Position + v2(7, 19), Size = v2(202 - 18 - 16, 168), Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.hueOutline = picker:draw("Square", {Position = picker.hsvOutline.Position + v2(7 + picker.hsvOutline.Size.X, 0), Size = v2(12, 168), Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.hue = picker:draw("Image", {Position = picker.hsvOutline.Position + v2(8 + picker.hsvOutline.Size.X, 1), Size = v2(10, 166), Data = hueData, Visible = true, ZIndex = 4})
                                                                picker.valueOutline = picker:draw("Square", {Position = picker.background.Position + v2(7, 195), Size = v2(202 - 18 - 16, 12), Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.valuebar = picker:draw("Image", {Position = picker.background.Position + v2(8, 196), Size = v2(200 - 18 - 16, 10), Data = valueData, Visible = true, ZIndex = 4})
                                                                picker.newtext = picker:draw("Text", {Position = picker.hueOutline.Position + v2(19, -2), Size = 14, Color = wapus.theme.text, Text = "New Color", Visible = true, ZIndex = 4})
                                                                picker.newOutline = picker:draw("Square", {Position = picker.newtext.Position + v2(0, 17), Size = v2(65, 35), Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.newColor = picker:draw("Square", {Position = picker.newtext.Position + v2(1, 18), Size = v2(63, 33), Color = color.value, Visible = true, ZIndex = 4})
                                                                picker.oldtext = picker:draw("Text", {Position = picker.hueOutline.Position + v2(19, 52), Size = 14, Color = wapus.theme.text, Text = "Old Color", Visible = true, ZIndex = 4})
                                                                picker.oldOutline = picker:draw("Square", {Position = picker.oldtext.Position + v2(0, 17), Size = v2(65, 35), Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.oldColor = picker:draw("Square", {Position = picker.oldtext.Position + v2(1, 18), Size = v2(63, 33), Color = color.value, Visible = true, ZIndex = 4})
                                                                picker.applytext = picker:draw("Text", {Position = picker.hueOutline.Position + v2(27, 175), Size = 14, Color = wapus.theme.text, Text = "[  Apply  ]", Visible = true, ZIndex = 4})
                                                                picker.colordrawings = {}

                                                                local h, s, v = color.value:ToHSV()
                                                                picker.current = {h, s, v}
                                                                local startPos = picker.hsvOutline.Position + v2(1, 1)

                                                                -- lol
                                                                --for x = 0, xMax do -- lags cuz almost 7k drawings created here
                                                                --	picker.colordrawings[x] = {}
                                                                --	local sat = x / xMax
                                                                --
                                                                --	for y = 0, yMax do
                                                                --		local value = 1 - (y / yMax)
                                                                --		picker.colordrawings[x][y] = picker:draw("Square", {Position = startPos + v2(x * xStepPX, y * yStepPX), Size = v2(xStepPX, yStepPX), Color = Color3.fromHSV(h, sat, value), Visible = true})
                                                                --	end
                                                                --end

                                                                picker.hueSquare = picker:draw("Square", {Position = picker.hsvOutline.Position + v2(1, 1), Size = v2(166, 166), Color = Color3.fromHSV(h, 1, 1), Visible = true, ZIndex = 4})
                                                                picker.satSquare = picker:draw("Square", {Position = picker.hsvOutline.Position + v2(1, 1), Size = v2(166, 166), Color = Color3.fromHSV(0, 0, 1), Visible = true, ZIndex = 4})
                                                                picker.valSquare = picker:draw("Square", {Position = picker.hsvOutline.Position + v2(1, 1), Size = v2(166, 166), Color = Color3.fromHSV(0, 1, 0), Visible = true, ZIndex = 4})

                                                                for i = 1, 2 do
                                                                    local parent = i == 1 and "satSquare" or "valSquare"
                                                                    local uiGradient = Instance.new("UIGradient", picker[i == 1 and "satSquare" or "valSquare"]._data.drawings.box)
                                                                    uiGradient.Transparency = NumberSequence.new(0, 1)

                                                                    if i == 2 then
                                                                        uiGradient.Rotation = 270
                                                                    end
                                                                end


                                                                picker.hsvButtonOutline = picker:draw("Square", {Position = startPos + v2(s * 166 - 2, (1 - v) * 166 - 2), Size = v2(5, 5), Filled = false, Thickness = 1, Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.hsvButton = picker:draw("Square", {Position = picker.hsvButtonOutline.Position + v2(1, 1), Size = v2(3, 3), Filled = false, Thickness = 1, Color = Color3.new(1, 1, 1), Visible = true, ZIndex = 4})
                                                                picker.hueButtonOutline = picker:draw("Square", {Position = picker.hue.Position + v2(-3, (1 - h) * 166 - 3), Size = v2(16, 5), Filled = false, Thickness = 1, Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.hueButton = picker:draw("Square", {Position = picker.hueButtonOutline.Position + v2(1, 1), Size = v2(14, 3), Filled = false, Thickness = 1, Color = Color3.new(1, 1, 1), Visible = true, ZIndex = 4})
                                                                picker.valueButtonOutline = picker:draw("Square", {Position = picker.valuebar.Position + v2(v * 166 - 3, -3), Size = v2(5, 16), Filled = false, Thickness = 1, Color = wapus.theme.outline, Visible = true, ZIndex = 4})
                                                                picker.valueButton = picker:draw("Square", {Position = picker.valueButtonOutline.Position + v2(1, 1), Size = v2(3, 14), Filled = false, Thickness = 1, Color = Color3.new(1, 1, 1), Visible = true, ZIndex = 4})
                                                                color.picker = picker
                                                                picking = color
                                                                return
                                                            end
                                                        end

                                                        element:SetValue(not element.value)
                                                    elseif element.type == "slider" then
                                                        sliding = element
                                                    elseif element.type == "dropdown" then
                                                        dropping = element
                                                        element.optionDrawings = {}

                                                        for optionIndex = 1, #element.options do
                                                            local newDrawings = {}
                                                            newDrawings.outline = menuData:draw("Square", {Position = element.buttonoutline.Position + v2(0, optionIndex * 17), Size = v2(213, 18), Color = wapus.theme.outline, Visible = true, ZIndex = 4}, "outline")
                                                            newDrawings.button = menuData:draw("Square", {Position = newDrawings.outline.Position + v2(1, 1), Size = v2(211, 16), Color = wapus.theme.background, Visible = true, ZIndex = 4}, "background")
                                                            newDrawings.valuetext = menuData:draw("Text", {Position = newDrawings.button.Position + v2(6, 0), Size = 14, Color = wapus.theme.text, Text = element.options[optionIndex], Visible = true, ZIndex = 4}, "text")
                                                            element.optionDrawings[optionIndex] = newDrawings
                                                        end
                                                    elseif element.type == "button" then
                                                        if element.callback then
                                                            element.callback()
                                                        end
                                                    elseif element.type == "textbox" then
                                                        typing = element
                                                        element.valuetext.Text = ""
                                                    end
                                                end

                                                height = height + element.height
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end))
end

do -- Cham Library
    local cache = {}

    function cham.new(model, properties, hideParts, deleteImages, ignoreTransparency)
        if model then
            properties = properties or {}
            local controlled = {}
            local data = {model = model, parts = controlled, properties = properties, ignore = ignoreTransparency, hide = (type(hideParts) == "table" and hideParts)}
            local parts = model:GetDescendants()
            table.insert(parts, model)
            table.insert(cache, data)

            local function uncache()
                table.remove(cache, table.find(cache, data))
            end

            local function classify(part)
                if part:IsA("BasePart") then
                    table.insert(controlled, part)
                elseif deleteImages and (part.ClassName == "Decal" or part.ClassName == "Texture") then
                    part:Destroy()
                end
            end

            for _, part in parts do
                classify(part)
            end

            table.insert(connectionList, model.DescendantAdded:Connect(classify))

            return properties, uncache
        end
    end

    local lastChamCheck = tick();
    table.insert(connectionList, game:GetService("RunService").RenderStepped:Connect(function()
        if tick() - lastChamCheck < 1/60 then return end;
        lastChamCheck = tick();

        for _, data in cache do
            if data.model:IsDescendantOf(workspace) then
                for _, part in data.parts do
                    if data.hide and table.find(data.hide, part) then
                        part.Transparency = 1
                    end;

                    if part.Transparency == 1 then continue end;
                    for i, v in data.properties do
                        if i == "Color" and part:IsA("SpecialMesh") then
                            part.VertexColor = Vector3.new(v.R * 1.2, v.G * 1.2, v.B * 1.2)
                        end

                        part[i] = v
                    end
                end
            end
        end
    end))
end
end)()

LPH_JIT_MAX(function() -- Main Cheat
    local moduleCache
    for i, v in getgc(true) do
        if type(v) == "table" and rawget(v, "ScreenCull") and rawget(v, "NetworkClient") then
            moduleCache = v
            break
        end
    end

    local modules = {}
    for name, data in moduleCache do
        if data then
			if type(data) == "table" then
            	modules[name] = data.module
			else
            	modules[name] = data
			end
        end
    end

    --now aint this sexy
    local effects = modules.Effects
    local vector = modules.VectorLib
    local physics = modules.PhysicsLib
    local raycastLib = modules.Raycast
    local cframeLib = modules.CFrameLib
    local recoil = modules.RecoilSprings
    local network = modules.NetworkClient
    local screenCull = modules.ScreenCull
    --local modifyData = modules.ModifyData
    local bulletcheck = modules.BulletCheck
    local audioSystem = modules.AudioSystem
    local bulletObject = modules.BulletObject
    local charObject = modules.CharacterObject
    local skinCaseUtils = modules.SkinCaseUtils
    local firearmObject = modules.FirearmObject
    local desktopHitBox = modules.DesktopHitBox
    local cameraObject = modules.MainCameraObject
    local playerRegistry = modules.PlayerRegistry
    local publicSettings = modules.PublicSettings
    local playerDataUtils = modules.PlayerDataUtils
    local cameraInterface = modules.CameraInterface
    local hudnotify = modules.HudNotificationConfig
    local charInterface = modules.CharacterInterface
    local contentInterface = modules.ContentInterface
    local hudScopeInterface = modules.HudScopeInterface
    local unscaledScreenGui = modules.UnscaledScreenGui
    local replicationObject = modules.ReplicationObject
    local thirdPersonObject = modules.ThirdPersonObject
    local weaponObject = modules.WeaponControllerObject
    local playerClient = modules.PlayerDataClientInterface
    local roundSystem = modules.RoundSystemClientInterface
    local weaponInterface = modules.WeaponControllerInterface
    local replicationInterface = modules.ReplicationInterface
    local crosshairsInterface = modules.HudCrosshairsInterface

    --local networkConnections = debug.getupvalue(debug.getupvalue(network._init, 2), 2)
    local networkConnections
    for i, v in getgc(true) do
        if type(v) == "table" and rawget(v, "died") and rawget(v, "smallaward") then
            networkConnections = v
            break
        end
    end

    getfenv(cameraInterface.setCameraType).print = function() end -- fix third person console spam
    getfenv(cameraInterface.setCameraType).warn = function() end

    local players = game:GetService("Players")
    local lighting = game:GetService("Lighting")
    local workspace = game:GetService("Workspace")
    local runService = game:GetService("RunService")
    local httpService = game:GetService("HttpService")
    local teleportService = game:GetService("TeleportService")
    local userInputService = game:GetService("UserInputService")
    local camera = workspace.CurrentCamera
    local ignore = workspace.Ignore
    local misc = ignore.Misc
    local localplayer = players.LocalPlayer
    local currentObj, started, fakeRepObject, aimbotting
    local movementCache = {time = {}, position = {}}
    local ticketCache = {}

    local backtrackObjects = Instance.new("Folder", workspace)
    local hitboxObjects = Instance.new("Folder", workspace)
    local aimbotfov = drawing.new("Circle")
    local aimbotdeadfov = drawing.new("Circle")
    local silentaimfov = drawing.new("Circle")
    local silentaimdeadfov = drawing.new("Circle")
    local crossdot = drawing.new("Square")
    local cross1 = drawing.new("Line")
    local cross2 = drawing.new("Line")
    local cross3 = drawing.new("Line")
    local cross4 = drawing.new("Line")
    --niggas say this script has too many index calls
    --they niggas fr

    -- firerate time offsets
    local timeLag = 0.1 -- max the network time can fall behind
    local timeSkip = 0.4 -- max the network time can skip ahead

    local timeRange = timeLag + timeSkip -- 0.5 max stable :(

    -- this causes a really weird error sometimes when u try to spawn
    --debug.setupvalue(replicationObject.new, 3, Instance.new("Part"))
    --fakeRepObject = replicationObject.new(localplayer)
    --debug.setupvalue(replicationObject.new, 3, localplayer)

    fakeRepObject = replicationObject.new(setmetatable({}, {
        __index = function(self, index)
            if index == "GetPropertyChangedSignal" then
                return function(_, property)
                    return localplayer:GetPropertyChangedSignal(property)
                end
            end

            return localplayer[index]
        end,
        __newindex = function(self, index, value)
            localplayer[index] = value
            return
        end
    }))

    --local astar = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Sirius/request/library/Pathfinding"))() -- fucking flies so it despawns now. ill make pathfinding that stays on the ground
    --astar.maxtime = 0.33
    --astar.interval = 12  --  8 to 16 is good
    --astar.ignorelist = {workspace.Players, camera, ignore, hitboxObjects, backtrackObjects}

    local pathfinding = loadstring(game:HttpGet("https://raw.githubusercontent.com/iRay888/wapus/refs/heads/main/pathfinding.lua"))() -- i didnt make this, i did fix it tho cuz pro

    local physicsignore = {workspace.Terrain, ignore, workspace.Players, camera, hitboxObjects, backtrackObjects}
    local raycastparameters = RaycastParams.new()
    local function raycast(origin, direction, filterlist, whitelist)
        raycastparameters.IgnoreWater = true
        raycastparameters.FilterDescendantsInstances = filterlist or physicsignore
        raycastparameters.FilterType = Enum.RaycastFilterType[whitelist and "Whitelist" or "Blacklist"]

        local result = workspace:Raycast(origin, direction, raycastparameters)
        return result and result.Instance, result and result.Position, result and result.Normal
    end

    local function getClosest(origin, fov, deadfov, visibleCheck, partName)
        local distance = fov or math.huge
        local position, closestPlayer, part

        replicationInterface.operateOnAllEntries(function(player, entry)
            local character = entry._thirdPersonObject and entry._thirdPersonObject._characterModelHash

            if character and entry._isEnemy then
                local localposition = camera.CFrame.Position
                local target = character[partName].Position

                if not visibleCheck or not raycast(localposition, target - localposition, physicsignore) then
                    local screenPosition, onscreen = camera:WorldToViewportPoint(target)
                    local screenDistance = (Vector2.new(screenPosition.X, screenPosition.Y) - origin).Magnitude

                    if screenPosition.Z > 0 and screenDistance < distance and (not deadfov or screenDirection >= deadfov) then
                        part = character[partName]
                        position = target
                        distance = screenDistance
                        closestPlayer = entry
                    end
                end
            end
        end)

        return position, closestPlayer, part
    end

    local killedPlayers = {}
    local ignoredPlayers = {}
    local function getClosestPlayers(position, ignoreCheck, onlyTargets, useWhitelist)
        local closestCharacters
        local characterData

        replicationInterface.operateOnAllEntries(function(player, entry)
            local character = entry._thirdPersonObject and entry._thirdPersonObject._characterModelHash

            if entry._receivedPosition and entry._velspring.t and character and entry._isEnemy and character.Head and (not ignoreCheck or (not killedPlayers[player] and not ignoredPlayers[player])) then
                if (not useWhitelist or playerStatus[player] ~= "Friendly") and (not onlyTargets or playerStatus[player] == "Target") then
                    local playerDistance = (character.Head.Position - position).Magnitude
                    local playerData = {character, playerDistance}

                    if not characterData then
                        characterData = {playerData}
                        closestCharacters = {entry}
                    else
                        for charIndex = #characterData, 1, -1 do
                            if playerDistance > characterData[charIndex][2] then
                                table.insert(characterData, charIndex + 1, playerData)
                                table.insert(closestCharacters, charIndex + 1, entry)
                                break
                            end
                        end

                        if not table.find(characterData, playerData) then
                            table.insert(characterData, 1, playerData)
                            table.insert(closestCharacters, 1, entry)
                        end
                    end
                end
            end
        end)

        return closestCharacters
    end

    local function trajectory(o, a, t, s)
        local f = -a
        local ld = t - o
        local a = f:Dot(f)
        local b = 4 * ld:Dot(ld)
        local k = (4 * (f:Dot(ld) + s * s)) / (2 * a)
        local v = (k * k - b / a) ^ 0.5
        local t, t0 = k - v, k + v

        t = t < 0 and t0 or t; t = t ^ 0.5
        return f * t / 2 + ld / t, t
    end

    --local solve = debug.getupvalue(physics.timehit, 2)
    local function solve(v44, v45, v46, v47, v48) -- i did not write this
        if not v44 then
            return
        elseif v44 > -1.0E-10 and v44 < 1.0E-10 then
            return solve(v45, v46, v47, v48)
        else
            if v48 then
                local v49 = -v45 / (4 * v44)
                local v50 = (v46 + v49 * (3 * v45 + 6 * v44 * v49)) / v44
                local v51 = (v47 + v49 * (2 * v46 + v49 * (3 * v45 + 4 * v44 * v49))) / v44
                local v52 = (v48 + v49 * (v47 + v49 * (v46 + v49 * (v45 + v44 * v49)))) / v44
                if v51 > -1.0E-10 and v51 < 1.0E-10 then
                    local v53, v54 = solve(1, v50, v52)
                    if not v54 or v54 < 0 then
                        return
                    else
                        local v55 = math.sqrt(v53)
                        local v56 = math.sqrt(v54)
                        return v49 - v56, v49 - v55, v49 + v55, v49 + v56
                    end
                else
                    local v57, _, v59 = solve(1, 2 * v50, v50 * v50 - 4 * v52, -v51 * v51)
                    local v60 = v59 or v57
                    local v61 = math.sqrt(v60)
                    local v62, v63 = solve(1, v61, (v60 + v50 - v51 / v61) / 2)
                    local v64, v65 = solve(1, -v61, (v60 + v50 + v51 / v61) / 2)
                    if v62 and v64 then
                        return v49 + v62, v49 + v63, v49 + v64, v49 + v65
                    elseif v62 then
                        return v49 + v62, v49 + v63
                    elseif v64 then
                        return v49 + v64, v49 + v65
                    end
                end
            elseif v47 then
                local v66 = -v45 / (3 * v44);
                local v67 = -(v46 + v66 * (2 * v45 + 3 * v44 * v66)) / (3 * v44)
                local v68 = -(v47 + v66 * (v46 + v66 * (v45 + v44 * v66))) / (2 * v44)
                local v69 = v68 * v68 - v67 * v67 * v67
                local v70 = math.sqrt((math.abs(v69)))
                if v69 > 0 then
                    local v71 = v68 + v70
                    local v72 = v68 - v70
                    v71 = v71 < 0 and -(-v71) ^ 0.3333333333333333 or v71 ^ 0.3333333333333333
                    local v73 = v72 < 0 and -(-v72) ^ 0.3333333333333333 or v72 ^ 0.3333333333333333
                    return v66 + v71 + v73
                else
                    local v74 = math.atan2(v70, v68) / 3
                    local v75 = 2 * math.sqrt(v67)
                    return v66 - v75 * math.sin(v74 + 0.5235987755982988), v66 + v75 * math.sin(v74 - 0.5235987755982988), v66 + v75 * math.cos(v74)
                end;
            elseif v46 then
                local v76 = -v45 / (2 * v44)
                local v77 = v76 * v76 - v46 / v44
                if v77 < 0 then
                    return
                else
                    local v78 = math.sqrt(v77)
                    return v76 - v78, v76 + v78
                end
            elseif v45 then
                return -v45 / v44
            end
            return
        end
    end

    local function complexTrajectory(o, a, t, s, e) -- thank you mickey
        local ld = t - o
        a = -a
        e = e or Vector3.zero

        local r1, r2, r3, r4 = solve(
            a:Dot(a) * 0.25,
            a:Dot(e),
            a:Dot(ld) + e:Dot(e) - s^2,
            ld:Dot(e) * 2,
            ld:Dot(ld)
        )

        local x = (r1>0 and r1) or (r2>0 and r2) or (r3>0 and r3) or r4
        local v = (ld + e*x + 0.5*a*x^2) / x
        return v, x
    end

    local function toanglesyx(v)
        local x, y, z = v.x, v.y, v.z
        return math.asin(y / (x * x + y * y + z * z) ^ 0.5), math.atan2(-x, -z), 0
    end

    local newFrameTime = 1 / 200--1 / 60
    local frameAcceleration = Vector3.new(0, -workspace.Gravity, 0)
    local function simulateBullet(origin, velocity, penetration)
        local frames = {}
        local wallHits = {}
        local newTime = 0
        local newOrigin = origin
        local newVelocity = velocity
        local newPenetration = penetration
        local ignoreList = {table.unpack(physicsignore)}

        while (newTime < 1) do
            local frameTime = newFrameTime
            local motion = (frameTime * newVelocity) + (((frameTime * frameTime) / 2) * frameAcceleration)
            local hit, enter = raycast(newOrigin, motion, ignoreList)

            if hit and hit.CanCollide and hit.Transparency ~= 1 and hit.Name ~= "Window" then
                local canShoot = false
                local normal = motion.unit
                local maxExtent = hit.Size.magnitude * normal
                local _, exit = raycast(enter + maxExtent, -maxExtent, {hit}, true)

                if exit then
                    canShoot = true
                    newPenetration = newPenetration - normal:Dot(exit - enter)

                    if (newPenetration < 0) then
                        table.insert(frames, {newOrigin, enter})
                        table.insert(wallHits, enter)
                        return frames, wallHits
                    end
                else
                    canShoot = true
                end

                if canShoot then
                    table.insert(wallHits, exit)
                    table.insert(wallHits, enter)
                    table.insert(ignoreList, hit)
                    table.insert(frames, {newOrigin, exit})
                    local timePassed = (motion:Dot(enter - newOrigin) / motion:Dot(motion)) * frameTime
                    newOrigin = enter + (0.01 * (newOrigin - enter).unit)
                    newVelocity = newVelocity + (timePassed * frameAcceleration)
                    newTime = newTime + timePassed
                end
            else
                table.insert(frames, {newOrigin, newOrigin + motion})
                newOrigin = newOrigin + motion
                newVelocity = newVelocity + (frameTime * frameAcceleration)
                newTime = newTime + frameTime
            end
        end

        return frames, wallHits
    end

    local scanVerticies = {
        Vector3.new(0, 0, -1),
        Vector3.new(0, -1, 0),
        Vector3.new(-1, 0, 0),
        Vector3.new(0, 1, 0),
        Vector3.new(1, 0, 0)
    }
    local function getPositionOffsets(origin, target, offset)
        if offset then
            local cframe = CFrame.new(origin, target) * CFrame.Angles(0, 0, math.rad(math.random(1, 90)))
            local offsets = {}

            for vertexIndex = 1, #scanVerticies do
                table.insert(offsets, cframe * (scanVerticies[vertexIndex] * offset))
            end

            return offsets
        end

        return {origin}
    end

    --local bulletIgnoreList = debug.getupvalue(bulletcheck, 4)--cant fucking use this method anymore cuz im getting rid of getupvalue
    --table.insert(bulletIgnoreList, hitboxObjects) -- only adding this fix cuz sirmeme ran into this bug on stream lmao
    --table.insert(bulletIgnoreList, backtrackObjects) -- robloxscripts.com WWWWWW

    local raycastFunc = raycastLib.raycast
    function raycastLib.raycast(origin, direction, ignoreList, ignoreFunc, a5) -- idk wtf this last parameter is maybe resetIgnoreCache?
        if getfenv(ignoreFunc).script == getfenv(bulletcheck).script then
            ignoreFunc = function(part)
                if not part.CanCollide then
                    return true
                elseif part.Transparency == 1 then
                    return true
                elseif part:IsDescendantOf(hitboxObjects) or part:IsDescendantOf(backtrackObjects) then
                    return true
                else
                    return
                end
            end
        end

        return raycastFunc(origin, direction, ignoreList, ignoreFunc, a5)
    end

    local raycastStep = 1 / 30 -- 60 for more accuracy
    local function scanPositions(origin, target, accel, speed, penetration)
        local origins = getPositionOffsets(origin, target, wapus:GetValue("Rage Bot", "Fire Position Scanning") and wapus:GetValue("Rage Bot", "Fire Position Offset"))
        local targets = getPositionOffsets(target, origin, wapus:GetValue("Rage Bot", "Hit Position Scanning") and wapus:GetValue("Rage Bot", "Hit Position Offset"))

        for originIndex = 1, #origins do
            local newOrigin = origins[originIndex]

            for targetIndex = 1, #targets do
                local newTarget = targets[targetIndex]
                local velocity, hitTime = trajectory(newOrigin, accel, newTarget, speed)

                if bulletcheck(newOrigin, newTarget, velocity, accel, penetration, raycastStep) then
                    return newOrigin, newTarget, velocity, hitTime
                end
            end
        end

        return false
    end

    local function getBarrelLocation()
        local controller = weaponInterface.getActiveWeaponController()
        local weapon = controller and controller:getActiveWeapon()
        --return weapon and not weapon._aiming and weapon._barrelPart and camera:WorldToViewportPoint(weapon._barrelPart.Position + weapon._barrelPart.CFrame.LookVector * (weapon._barrelPart.Size.Z / 2 + 15)) -- FrontMan
        return weapon and not weapon._aiming and weapon._barrelPart and camera:WorldToViewportPoint(weapon._barrelPart.CFrame * Vector3.new(0, 0, -100))
    end

    local teleportData
    local function initTeleport(origin, target)
        local interval = astar.interval -- broken idc to fix it cuz its not even used anymore
        astar.interval = 5
        local path = astar:findpath(origin, target, 9.9, 0)
        astar.interval = interval

        if not path then
            return false
        end

        table.insert(path, 1, origin)
        table.insert(path, target)
        teleporting = true
        teleportData = {
            length = #path,
            path = path,
            index = 1,
            time = nil
        }
    end

    local startTime = os.clock()
    local pi = math.pi
    local tau = 2 * pi
    local quarter = pi * 0.5
    local rad = math.rad
    local clamp = math.clamp
    local function applyAAAngles(angles)
        local x, y, z = angles.X, angles.Y, angles.Z

        if wapus:GetValue("Anti Aim", "Pitch") then
            local addition = rad(wapus:GetValue("Anti Aim", "Pitch Amount")) - quarter

            if string.find(string.lower(wapus:GetValue("Anti Aim", "Pitch Mode")), "abs") then
                x = addition
            else
                x += addition
            end

            x = clamp(x, -quarter, quarter)
        end

        if wapus:GetValue("Anti Aim", "Yaw") then
            local addition = rad(wapus:GetValue("Anti Aim", "Yaw Amount"))

            if string.find(string.lower(wapus:GetValue("Anti Aim", "Yaw Mode")), "rel") then
                y += addition
            else
                y = addition
            end
        end

        if wapus:GetValue("Anti Aim", "Spin Bot") then
            y += (os.clock() - startTime) * math.rad(wapus:GetValue("Anti Aim", "Spin Speed")) * ((wapus:GetValue("Anti Aim", "Spin Direction") == "Left" and 1) or -1)
        end

        return Vector3.new(x, y, z)
    end

    local ticket = 0
    local ticketAddition = 0
    local flyUpdateDelay = 1 / 16 -- used in fly and firerate bypass
    local timeUpdates = { -- used in firerate bypass
        equip = 2,
        newbullets = 3,
        bullethit = 6,
        knifehit = 4,
        newgrenade = 3,
        spotplayers = 2,
        updatesight = 3,
    }
    local newSpawnCache = {
        currentAddition = 0,
        updateDebt = 0,
        spawnTime = 0,
        latency = 0
    }
    local unlockCamos = false
    local unlockKnives = false
    local unlockAttachments = false
    local unlockAll = false
    local realWeapons = {}
    local fakeWeapons = {}
    local chanceOne, chanceTwo
    local send = network.send
    local fakelag = {
        lastRefreshPosition = nil;
    };
    function network:send(name, ...)
        if wapus:GetValue("Third Person", "Enabled") and wapus:GetValue("Third Person", "Show Character") then
            if name == "spawn" then
                if not started then
                    started = true
                end
            end

            if currentObj then
                if name == "equip" then
                    local slot = ...

                    fakeRepObject:setActiveIndex(slot)
                    if slot ~= 3 then
                        currentObj:equip(slot)
                    else
                        currentObj:equipMelee()
                    end
                    --currentObj.canRenderWeapon = true--:renderWeapon()
                elseif name == "stab" then
                    currentObj:stab()
                elseif name == "aim" then
                    local aiming = ...
                    currentObj:setAim(aiming)
                elseif name == "sprint" then
                    local sprinting = ...
                    currentObj:setSprint(sprinting)
                elseif name == "stance" then
                    local stance = ...

                    if (not wapus:GetValue("Anti Aim", "Enabled (May Cause Despawning)") or not wapus:GetValue("Anti Aim", "Force Stance") or not wapus:GetValue("Third Person", "Apply Anti Aim To Character")) and currentObj then
                        currentObj:setStance(stance)
                    end
                elseif name == "newbullets" then
                    currentObj:kickWeapon(nil, nil, nil, 0)
                end
            end
        end

        if name == "spawn" then
            teleporting = false
            hitboxObjects:ClearAllChildren()
            newSpawnCache = {
                currentAddition = newSpawnCache.currentAddition or 0,
                latency = newSpawnCache.latency or 0,
                updateDebt = 0,
                spawnTime = os.clock(),
                spawned = true
            }
            --timeRange = timeSkip
        elseif name == "repupdate" then
            local position, angles, angles2, time = ...
            local clockTime = os.clock()

            if teleporting then -- pf devs noooooo
                if not teleportData.time then -- fucking nigger leaked my source so i had to go open source yk
                    local index = teleportData.index

                    teleportData.time = time
                    send(self, name, teleportData.path[index], angles, angles2, time + newSpawnCache.latency + newSpawnCache.currentAddition)

                    index += 1
                    teleportData.index = index

                    if index > teleportData.length then
                        newSpawnCache.lastUpdate = position
                        send(self, name, position, angles, angles2, time + newSpawnCache.latency + newSpawnCache.currentAddition)
                    else
                        send(self, name, teleportData.path[index], angles, angles2, time + newSpawnCache.latency + newSpawnCache.currentAddition)
                    end

                    return
                else
                    if teleportData.index > teleportData.length then
                        if teleportData.teleportPosition then
                            local root = charInterface.getCharacterObject()
                            root = root and root:getRealRootPart()

                            if root then
                                root.Position = teleportData.teleportPosition
                            end
                        end

                        teleporting = false
                    end

                    teleportData.time = nil
                    return
                end
            end

            if newSpawnCache.noclipping then -- this is fried and i broke it somehow
                if clockTime > newSpawnCache.noclipstart then
                    local rootPart = charInterface.getCharacterObject():getRealRootPart()
                    local partList = workspace:GetPartsInPart(rootPart, OverlapParams.new())
                    local touching = {}

                    for _, part in partList do
                        local ignore = false

                        for _, ignoring in physicsignore do
                            if part:IsDescendantOf(ignoring) or not part.CanCollide then
                                ignore = true
                                continue
                            end
                        end

                        if not ignore then
                        table.insert(touching, part)
                        end
                    end

                    if #touching == 0 then
                        if initTeleport(newSpawnCache.lastUpdate, position) ~= false then
                            newSpawnCache.noclipping = false
                        end
                    end
                end

                return
            elseif wapus:GetValue("Movement", "Noclip") and newSpawnCache.lastUpdate then
                local hit = raycast(newSpawnCache.lastUpdate, position - newSpawnCache.lastUpdate, physicsignore)

                if hit then
                    newSpawnCache.noclipping = true
                    newSpawnCache.noclipstart = clockTime + 0.1
                    position = newSpawnCache.lastUpdate
                end
            end

            if newSpawnCache.updateDebt > 0 then -- does this do anything? idfk
                newSpawnCache.updateDebt -= 1
                return
            end

            if wapus:GetValue('Anti Aim', 'Fake Lag') then
                if not fakelag.lastRefreshPosition or not fakelag.lastRefreshTime then
                    fakelag.lastRefreshPosition = position;
                    fakelag.lastRefreshTime = tick();
                end;


                if ((position - fakelag.lastRefreshPosition).Magnitude > wapus:GetValue('Anti Aim', 'Refresh Distance')) or tick() - fakelag.lastRefreshTime > wapus:GetValue('Anti Aim', 'Refresh Rate') then
                    fakelag.lastRefreshPosition = position;
                    fakelag.lastRefreshTime = tick();

                    if wapus:GetValue('Anti Aim', 'Randomize Position') then
                        local xaxis, yaxis, zaxis = wapus:GetValue('Anti Aim', 'X-Axis Factor'), 0, wapus:GetValue('Anti Aim', 'Z-Axis Factor');
                        local xoff, yoff, zoff = math.random(-xaxis, xaxis), math.random(-yaxis, yaxis), math.random(-zaxis, zaxis);

                        position += Vector3.new(xoff, yoff, zoff);
                    end;
                else
                    return;
                end;
            else
                fakelag.lastRefreshPosition = nil;
                fakelag.lastRefreshTime = tick();
            end;

            if wapus:GetValue("Anti Aim", "Enabled (May Cause Despawning)") then
                angles = applyAAAngles(angles)
                angles2 = angles * 0.99
            end

            --if wapus:GetValue("Rage Bot", "Enabled") and wapus:GetValue("Rage Bot", "Firerate (May Cause Kicking)") then
            --    newSpawnCache.lastOffsetUpdate = newSpawnCache.lastOffsetUpdate or time
            --
            --    if timeLag > 0 and newSpawnCache.latency ~= -timeLag then
            --        if newSpawnCache.latency > -timeLag then
            --            newSpawnCache.latency -= (time - newSpawnCache.lastOffsetUpdate) * 0.45
            --        end
            --
            --        if newSpawnCache.latency < -timeLag then
            --            newSpawnCache.latency = -timeLag
            --        end
            --
            --        timeRange = timeSkip - newSpawnCache.latency
            --    elseif newSpawnCache.currentAddition > 0 then
            --        newSpawnCache.currentAddition -= math.min((time - newSpawnCache.lastOffsetUpdate) * 0.45, newSpawnCache.currentAddition)
            --    end
            --
            --    newSpawnCache.lastOffsetUpdate = time
            --end

            --local fly = false --wapus:GetValue("Movement", "Fly") or (wapus:GetValue("Rage Bot", "Enabled") and wapus:GetValue("Rage Bot", "Firerate (May Cause Kicking)"))
            --if fly and newSpawnCache.lastUpdate then
            --    if not newSpawnCache.lastFlyUpdate or ((clockTime - newSpawnCache.lastFlyUpdate) > flyUpdateDelay) then
            --        newSpawnCache.lastFlyUpdate = clockTime
            --        send(self, name, newSpawnCache.lastUpdate, angles, angles2, time + newSpawnCache.latency + newSpawnCache.currentAddition)
            --        send(self, name, position, angles, time + newSpawnCache.latency + newSpawnCache.currentAddition)
            --        newSpawnCache.lastUpdateTime = time
            --        newSpawnCache.lastUpdate = position
            --    end
            --
            --    return
            --end

            if wapus:GetValue("Movement", "Walk Speed") and newSpawnCache.lastUpdate then -- no patch pls :(
                send(self, name, newSpawnCache.lastUpdate, angles, angles2, time + newSpawnCache.latency + newSpawnCache.currentAddition)
                newSpawnCache.updateDebt += 1
            end;

            newSpawnCache.lastUpdateTime = time
            newSpawnCache.lastUpdate = position
            return send(self, name, position, angles, angles2, time + newSpawnCache.latency + newSpawnCache.currentAddition)
        elseif name == "newbullets" then
            local uniqueId, bulletData, time = ...

            ticket = ticket + #bulletData.bullets

            for _, bullet in bulletData.bullets do
                bullet[2] = bullet[2] + ticketAddition
            end

            if wapus:GetValue("Rage Bot", "Enabled") then
                return
            end

            if wapus:GetValue("Silent Aim", "Enabled") and (wapus:GetValue("Silent Aim", "Hit Chance") >= chanceOne) then
                local target, entry, part = getClosest(silentaimfov.Position, wapus:GetValue("Silent Aim", "Use FOV") and silentaimfov.Radius, wapus:GetValue("Silent Aim", "Use Dead FOV") and silentaimdeadfov.Radius, wapus:GetValue("Silent Aim", "Visible Check"), (wapus:GetValue("Silent Aim", "Head Shot Chance") >= chanceTwo) and "Head" or "Torso")

                if target then
                    local player = entry._player
                    local velocity = complexTrajectory(bulletData.firepos, publicSettings.bulletAcceleration, target, weaponInterface.getActiveWeaponController():getActiveWeapon()._weaponData.bulletspeed, (movementCache.position[player][15] - movementCache.position[player][1]) / (movementCache.time[15] - movementCache.time[1])).Unit

                    for _, bullet in bulletData.bullets do
                        bullet[1] = velocity
                    end
                end
            end

            return send(self, name, uniqueId, bulletData, time + newSpawnCache.latency + newSpawnCache.currentAddition)
        elseif name == "bullethit" then
            local uniqueId, player, position, partName, theTicket, time = ...
            theTicket = theTicket + ticketAddition

            if wapus:GetValue("Rage Bot", "Enabled") then
                return
            end

            if ticketCache[theTicket] then
                return
            end

            ticketCache[theTicket] = true
            return send(self, name, uniqueId, player, position, partName, theTicket, time + newSpawnCache.latency + newSpawnCache.currentAddition)
        elseif name == "falldamage" and wapus:GetValue("Movement", "No Fall Damage") then
            return
        elseif name == "stance" then
            newSpawnCache.stance = ...
        elseif timeUpdates[name] then
            local args = table.pack(...)

            if name == "equip" then
                local slot = args[1]
                newSpawnCache.slot = slot

                if wapus:GetValue("Knife Bot", "Kill All (May Despawn)") and not wapus:GetValue("Knife Bot", "Only When Holding Knife") then
                    args[1] = 3
                end
            end

            args[timeUpdates[name]] += newSpawnCache.latency + newSpawnCache.currentAddition
            return send(self, name, table.unpack(args))
        elseif name == "ping" then
            local a, b, c = ...
            newSpawnCache.hasPinged = true

            --if wapus:GetValue("Rage Bot", "Enabled") and wapus:GetValue("Rage Bot", "Firerate (May Cause Kicking)") then -- idk if this needs to be here i think it helps a little
            --    if newSpawnCache.lastUpdate and newSpawnCache.lastOffsetUpdate then
            --        local time = network.getTime()
            --        if timeLag > 0 and newSpawnCache.latency ~= -timeLag then
            --            if newSpawnCache.latency > -timeLag then
            --                newSpawnCache.latency -= (time - newSpawnCache.lastOffsetUpdate) * 0.25
            --            end
            --
            --            if newSpawnCache.latency < -timeLag then
            --                newSpawnCache.latency = -timeLag
            --            end
            --
            --            timeRange = timeSkip - newSpawnCache.latency
            --        elseif newSpawnCache.currentAddition > 0 then
            --            newSpawnCache.currentAddition -= math.min((time - newSpawnCache.lastOffsetUpdate) * 0.25, newSpawnCache.currentAddition)
            --        end
            --        newSpawnCache.lastOffsetUpdate = time
            --    end
            --end

            local add = newSpawnCache.latency + newSpawnCache.currentAddition
            return send(self, name, a, b + add, c + add)
        elseif name == "changeCamo" and unlockCamos then -- ok so why is unlock all camos server side? -- ok i tested it for myself and it is NOT server side
            local wepClass, slot, camoName = ...
            return
        elseif name == "changeAttachment" and unlockAttachments then
            local wepClass, attClass, attName = ...
            return
        elseif name == "changeWeapon" then
            local slot, weapon = ...

            if unlockKnives and slot == "Knife" then
                return
            end

            if unlockAll then
                local playerData = playerClient.getPlayerData()
                local class = playerDataUtils.getClassData(playerData).curclass
                local newPlayerData = table.clone(playerData)
                newPlayerData.unlockAll = false

                if slot == "Primary" then
                    fakeWeapons[class][1] = weapon

                    if playerDataUtils.ownsWeapon(newPlayerData, weapon) then
                        realWeapons[class][1] = weapon
                    end
                elseif slot == "Secondary" then
                    fakeWeapons[class][2] = weapon

                    if playerDataUtils.ownsWeapon(newPlayerData, weapon) then
                        realWeapons[class][2] = weapon
                    end
                end
            end
        elseif name == "flaguser" or name == "debug" or name == "logmessage" then -- undetected p
            return
        end

        if wapus:GetValue("Anti Aim", "Enabled (May Cause Despawning)") then
            if name == "stance" and wapus:GetValue("Anti Aim", "Force Stance") then
                local stance = ...
                stance = string.lower(wapus:GetValue("Anti Aim", "Set Stance"))

                if wapus:GetValue("Third Person", "Apply Anti Aim To Character") and currentObj then
                    currentObj:setStance(stance)
                end

                return send(self, name, stance)
            end
        end

        return send(self, name, ...)
    end

    local preparePickUpFirearm = weaponObject.preparePickUpFirearm
    function weaponObject:preparePickUpFirearm(slot, name, attachments, attData, camoData, magAmmo, spareAmmo, newId, wasClient, ...)
        local wepData = {
            weaponName = name,
            weaponAttachments = attachments,
            weaponAttData = addData,
            weaponCamo = camoData
        }

        fakeRepObject:setActiveIndex(slot)
        fakeRepObject:swapWeapon(slot, wepData)
        if currentObj then
            currentObj:buildWeapon(slot) -- does this func even do anything? im not gonna try removing it
        end

        return preparePickUpFirearm(self, slot, name, attachments, attData, camoData, magAmmo, spareAmmo, newId, wasClient, ...)
    end

    local preparePickUpMelee = weaponObject.preparePickUpMelee
    function weaponObject:preparePickUpMelee(name, camoData, newId, wasClient, ...)
        local wepData = {
            weaponName = name,
            weaponCamo = camoData
        }

        fakeRepObject:setActiveIndex(3)
        fakeRepObject:swapWeapon(3, wepData)
        if currentObj then
            currentObj:buildWeapon(3)
        end

        return preparePickUpMelee(self, name, camoData, newId, wasClient, ...)
    end

    local step = screenCull.step
    --function screenCull.step(...)
    screenCull.step = LPH_NO_VIRTUALIZE(function(...)
        step(...)

        if wapus:GetValue("Third Person", "Enabled") then
            local controller = weaponInterface.getActiveWeaponController()

            if controller and (wapus:GetValue("Third Person", "Show Character While Aiming") or not controller:getActiveWeapon()._aiming) then
                local cameraOffset = Vector3.new(wapus:GetValue("Third Person", "Camera Offset X"), wapus:GetValue("Third Person", "Camera Offset Y"), wapus:GetValue("Third Person", "Camera Offset Z"))
                local didHit = false

                if wapus:GetValue("Third Person", "Camera Offset Always Visible") then
                    local oldPosition = camera.CFrame.Position
                    local newPosition = camera.CFrame * cameraOffset
                    local dir = newPosition - oldPosition
                    local hit, position = raycast(oldPosition, dir)

                    if hit then
                        camera.CFrame *= CFrame.new(cameraOffset * ((position - oldPosition).Magnitude / cameraOffset.Magnitude) * 0.99)
                        didHit = true
                    end
                end

                if not didHit then
                    camera.CFrame *= CFrame.new(cameraOffset)
                end
            end
        end
    end)

    local setCharacterRender = thirdPersonObject.setCharacterRender
    function thirdPersonObject:setCharacterRender(render) -- may cause lag but fixes people not rendering with third person
        if wapus:GetValue("Third Person", "Enabled") then
            return setCharacterRender(self, render or (self._player ~= localplayer and camera:WorldToViewportPoint(self._replicationObject._receivedPosition or self:getRootPart().Position).Z > 0))
        end

        return setCharacterRender(self, render)
    end

    local newbullet = bulletObject.new
    function bulletObject.new(bulletData)
        if bulletData.onplayerhit then
            if unlockAll then
                local controller = weaponInterface.getActiveWeaponController()
                local data = controller:getActiveWeapon():getWeaponData()
                local displayname = data.displayname or data.name
                local name = fakeWeapons[playerDataUtils.getClassData(playerClient.getPlayerData()).curclass][controller:getActiveWeaponIndex()]

                if displayname == name then
                    local serverSpeed = contentInterface.getWeaponData(name).bulletspeed
                    bulletData.velocity = bulletData.velocity.Unit * serverSpeed
                end
            end

            if wapus:GetValue("Rage Bot", "Enabled") then
                return
            end

            if wapus:GetValue("Silent Aim", "Enabled") and (wapus:GetValue("Silent Aim", "Hit Chance") >= chanceOne) then
                local target, entry, part = getClosest(silentaimfov.Position, wapus:GetValue("Silent Aim", "Use FOV") and silentaimfov.Radius, wapus:GetValue("Silent Aim", "Use Dead FOV") and silentaimdeadfov.Radius, wapus:GetValue("Silent Aim", "Visible Check"), (wapus:GetValue("Silent Aim", "Head Shot Chance") >= chanceTwo) and "Head" or "Torso")

                if target then
                    local player = entry._player

                    if target and movementCache.position[player] then
                        local origin = bulletData.position
                        local velocity = complexTrajectory(origin, bulletData.acceleration, target, bulletData.velocity.Magnitude, movementCache.position[player][15] and (movementCache.position[player][15] - movementCache.position[player][1]) / (movementCache.time[15] - movementCache.time[1]) or Vector3.zero)
                        bulletData.velocity = velocity
                    end
                end
            end

            if wapus:GetValue("World Visuals", "Bullet Tracers") or wapus:GetValue("World Visuals", "Impact Points") then
                local frames, hits = simulateBullet(bulletData.position, bulletData.velocity, bulletData.penetrationdepth)

                if wapus:GetValue("World Visuals", "Bullet Tracers") then
                    local endColor = wapus:GetValue("World Visuals", "Color One")
                    local startColor = wapus:GetValue("World Visuals", "Color Two")
                    local diameter = wapus:GetValue("World Visuals", "Tracers Size")
                    local frameCount = #frames

                    for frame = 1, frameCount do -- god damn perfect bullet tracers
                        local origin, target = table.unpack(frames[frame])
                        local distance = (origin - target).Magnitude
                        local tracer = Instance.new("Part")
                        tracer.Material = Enum.Material[wapus:GetValue("World Visuals", "Tracers Material")]
                        tracer.Transparency = wapus:GetValue("World Visuals", "Tracers Transparency") * 0.01
                        tracer.Anchored = true
                        tracer.CanCollide = false
                        tracer.Color = startColor:lerp(endColor, (frame - 1) / math.max(frameCount - 1, 1))
                        tracer.Size = Vector3.new(distance, diameter, diameter)
                        tracer.Shape = Enum.PartType.Cylinder
                        tracer.CFrame = (CFrame.new(origin, target) * CFrame.Angles(0, math.rad(90), 0)) * CFrame.new(Vector3.new(distance * 0.5, 0, 0))
                        tracer.Parent = ignore

                        task.delay(wapus:GetValue("World Visuals", "Duration"), function()
                            local step = (1 - tracer.Transparency) / 10

                            for i = 1, 10 do
                                tracer.Transparency = tracer.Transparency + step
                                task.wait(0.05)
                            end

                            tracer:Destroy()
                        end)
                    end
                end

                if wapus:GetValue("World Visuals", "Impact Points") then
                    for wall = 1, #hits do
                        local point = Instance.new("Part")
                        point.Material = Enum.Material[wapus:GetValue("World Visuals", "Points Material")]
                        point.Transparency = wapus:GetValue("World Visuals", "Points Transparency") * 0.01
                        point.Anchored = true
                        point.CanCollide = false
                        point.Color = wapus:GetValue("World Visuals", "Points Color")
                        point.Size = Vector3.new(0.25, 0.25, 0.25)
                        point.Shape = Enum.PartType.Ball
                        point.Position = hits[wall]
                        point.Parent = ignore

                        task.delay(wapus:GetValue("World Visuals", "Duration"), function()
                            local step = (1 - point.Transparency) / 10

                            for i = 1, 10 do
                                point.Transparency = point.Transparency + step
                                task.wait(0.05)
                            end

                            point:Destroy()
                        end)
                    end
                end
            end

            if wapus:GetValue("Backtracking", "Enabled") or wapus:GetValue("Hit Boxes", "Enabled") then
                local ontouch = bulletData.ontouch
                local extra = bulletData.extra

                bulletData.ontouch = function(self, part, position, normal, exit, exitnorm) -- goated hitbox method
                    if not ticketCache[extra.bulletTicket] then
                        if wapus:GetValue("Hit Boxes", "Enabled") and part:IsDescendantOf(hitboxObjects) then
                            ticketCache[extra.bulletTicket] = true
                            send(network, "bullethit", extra.uniqueId, players[part.Name], position, wapus:GetValue("Hit Boxes", "Hit Part"), extra.bulletTicket + ticketAddition, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
                        elseif wapus:GetValue("Backtracking", "Enabled") and part:IsDescendantOf(backtrackObjects) then
                            local model = part

                            while (model.ClassName ~= "Model" or model.Parent.ClassName ~= "Folder") do
                                model = model.Parent
                            end

                            local player = players[model.Name]
                            local entry = replicationInterface.getEntry(player)
                            local head = entry._thirdPersonObject and entry._thirdPersonObject._characterModelHash and entry._thirdPersonObject._characterModelHash.Head

                            ticketCache[extra.bulletTicket] = true
                            send(network, "bullethit", extra.uniqueId, player, position, (part == head) and "Head" or "Torso", extra.bulletTicket + ticketAddition, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
                        end
                    end

                    return ontouch(self, part, position, normal, exit, exitnorm)
                end
            end
        end

        return newbullet(bulletData)
    end

    local screenGui = unscaledScreenGui.getScreenGui()
    local frontLayer = screenGui.DisplayScope.ImageFrontLayer
    local rearLayer = screenGui.DisplayScope.ImageRearLayer
    local updateScope = hudScopeInterface.updateScope
    function hudScopeInterface.updateScope(...)
        if wapus:GetValue("Gun Mods", "No Sniper Scope") then -- more scripts need this
            frontLayer.ImageTransparency = 1
            rearLayer.ImageTransparency = 1

            for layerIndex = 1, 2 do
                local layer = layerIndex == 1 and frontLayer or rearLayer

                for _, frame in layer:GetChildren() do
                    if frame.ClassName == "Frame" then
                        frame.Visible = false
                    end
                end
            end
        else
            frontLayer.ImageTransparency = 0
            rearLayer.ImageTransparency = 0

            for layerIndex = 1, 2 do
                local layer = layerIndex == 1 and frontLayer or rearLayer

                for _, frame in layer:GetChildren() do
                    if frame.ClassName == "Frame" then
                        frame.Visible = true
                    end
                end
            end
        end

        return updateScope(...)
    end

    local applyImpulse = recoil.applyImpulse
    function recoil.applyImpulse(...)
        if aimbotting or wapus:GetValue("Gun Mods", "No Recoil") then
            return
        end

        return applyImpulse(...)
    end

    local reload = firearmObject.reload
    function firearmObject:reload()
        if wapus:GetValue("Gun Mods", "Instant Reload") and self._spareCount > 0 then
            if self._spareCount >= self._weaponData.magsize then
                self._spareCount = self._spareCount - (self._weaponData.magsize - self._magCount)
                self._magCount = self._weaponData.magsize
            else
                self._magCount = self._spareCount
                self._spareCount = 0
            end

            send(network, "reload")

            return
        end

        return reload(self)
    end

    local computeWalkSway = firearmObject.computeWalkSway
    function firearmObject:computeWalkSway(dy, dx)
        if wapus:GetValue("Gun Mods", "No Walk Sway") or aimbotting then
            dy = 0
            dx = 0
        end

        return computeWalkSway(self, dy, dx)
    end

    local computeGunSway = firearmObject.computeGunSway
    function firearmObject.computeGunSway(...)
        if wapus:GetValue("Gun Mods", "No Gun Sway") or aimbotting then
            return CFrame.identity
        end

        return computeGunSway(...)
    end

    local fromAxisAngle = cframeLib.fromAxisAngle
    function cframeLib.fromAxisAngle(x, y, z) -- luh freak
        if aimbotting then -- or wapus:GetValue("Gun Mods", "No Camera Sway") then
            local controller = weaponInterface.getActiveWeaponController()
            local weapon = controller and controller:getActiveWeapon()

            return (weapon and weapon._blackScoped and CFrame.identity) or fromAxisAngle(x, y, z)
        end

        return fromAxisAngle(x, y, z)
    end

    --[[local getModifiedData = modifyData.getModifiedData
    function modifyData.getModifiedData(data, ...)
        setreadonly(data, false)

        if wapus:GetValue("Gun Mods", "No Spread") then
            data.hipfirespread = 0
            data.hipfirestability = 99999
            data.hipfirespreadrecover = 99999
        end

        if wapus:GetValue("Gun Mods", "Small Crosshair") then
            data.crosssize = 10
            data.crossexpansion = 0
            data.crossspeed = 100
            data.crossdamper = 1
        end

        if wapus:GetValue("Gun Mods", "No Crosshair") then
            data.crosssize = 1000000000
            data.crossexpansion = 0
            data.crossspeed = 100
            data.crossdamper = 1
        end

        if unlockAll then -- i think this undetected c:
            for class, weapons in fakeWeapons do
                if class == playerDataUtils.getClassData(playerClient.getPlayerData()).curclass then
                    for slot, name in weapons do
                        local displayname = data.displayname or data.name

                        if name == displayname then
                            local realData = contentDatabase.getWeaponData(realWeapons[class][slot])
                            local firecap = realData.firecap or ((realData.variablefirerate and math.max(table.unpack(realData.firerate))) or realData.firerate)

                            if data.variablefirerate then
                                local newFireRates = {}

                                for firerateIndex, firerate in data.firerate do
                                    newFireRates[firerateIndex] = math.min(firerate, firecap)
                                end

                                data.firerate = newFireRates
                            elseif data.firerate > firecap then
                                data.firerate = firecap
                            end

                            if data.firecap and data.firecap > firecap then
                                data.firecap = firecap
                            end

                            if data.magsize > realData.magsize then
                                data.magsize = realData.magsize
                                data.sparerounds = realData.sparerounds
                            else
                                data.sparerounds = (realData.magsize + realData.sparerounds) - data.magsize
                            end

                            if data.pelletcount ~= realData.pelletcount then
                                data.pelletcount = realData.pelletcount
                            end

                            if data.penetrationdepth > realData.penetrationdepth then
                                data.penetrationdepth = realData.penetrationdepth
                            end

                            data.bulletspeed = realData.bulletspeed

                            break
                        end
                    end
                end
            end
        end

        return getModifiedData(data, ...)
    end]]

    local getWeaponData = contentInterface.getWeaponData   -- more synz instability
    function contentInterface.getWeaponData(weaponName, makeClone)
        local data = getWeaponData(weaponName, makeClone)

        if makeClone then
            setreadonly(data, false)

            if wapus:GetValue("Gun Mods", "No Spread") then
                data.hipfirespread = 0
                data.hipfirestability = 99999
                data.hipfirespreadrecover = 99999
            end

            if wapus:GetValue("Gun Mods", "Small Crosshair") then
                data.crosssize = 10
                data.crossexpansion = 0
                data.crossspeed = 100
                data.crossdamper = 1
            end

            if wapus:GetValue("Gun Mods", "No Crosshair") then
                data.crosssize = 1000000000
                data.crossexpansion = 0
                data.crossspeed = 100
                data.crossdamper = 1
            end

            if unlockAll then -- i think this undetected c:
                for class, weapons in fakeWeapons do
                    if class == playerDataUtils.getClassData(playerClient.getPlayerData()).curclass then
                        for slot, name in weapons do
                            local displayname = data.displayname or data.name

                            if name == displayname then
                                local realData = contentInterface.getWeaponData(realWeapons[class][slot])
                                local firecap = realData.firecap or ((realData.variablefirerate and math.max(table.unpack(realData.firerate))) or realData.firerate)

                                if data.variablefirerate then
                                    local newFireRates = {}

                                    for firerateIndex, firerate in data.firerate do
                                        newFireRates[firerateIndex] = math.min(firerate, firecap)
                                    end

                                    data.firerate = newFireRates
                                elseif data.firerate > firecap then
                                    data.firerate = firecap
                                end

                                if data.firecap and data.firecap > firecap then
                                    data.firecap = firecap
                                end

                                if data.magsize > realData.magsize then
                                    data.magsize = realData.magsize
                                    data.sparerounds = realData.sparerounds
                                else
                                    data.sparerounds = (realData.magsize + realData.sparerounds) - data.magsize
                                end

                                if data.pelletcount ~= realData.pelletcount then
                                    data.pelletcount = realData.pelletcount
                                end

                                if data.penetrationdepth > realData.penetrationdepth then
                                    data.penetrationdepth = realData.penetrationdepth
                                end

                                data.bulletspeed = realData.bulletspeed

                                break
                            end
                        end
                    end
                end
            end
        end

        return data
    end

    local mainStep = cameraObject.step
    --function cameraObject.step(self, dt)
    cameraObject.step = LPH_NO_VIRTUALIZE(function(self, dt)
        if aimbotting or wapus:GetValue("Gun Mods", "No Camera Sway") then
            mainStep(self, 0)
            self._lookDt = dt
        end

        if wapus:GetValue('Gun Mods', 'No Camera Bob') then
            local characterObject = charInterface.getCharacterObject();
            local oldSpeed = characterObject._speed;

            characterObject._speed = 0;
            mainStep(self, dt);
            characterObject._speed = oldSpeed;
        end;

        if aimbotting or wapus:GetValue("Gun Mods", "No Camera Sway") or wapus:GetValue('Gun Mods', 'No Camera Bob') then
            return;
        end;

        return mainStep(self, dt)
    end)
--[[ synz has upval instability
    debug.setupvalue(firearmObject.computeGunSway, 1, {getTime = function()
        if wapus:GetValue("Gun Mods", "No Gun Sway") or aimbotting then
            return 0
        end

        return network.getTime()
    end, __index = network})

    debug.setupvalue(firearmObject.new, 5, {getWeaponData = function(weaponName, makeClone)
        local data = contentDatabase.getWeaponData(weaponName, makeClone)

        if makeClone then
            setreadonly(data, false) -- prolly dont still need this but its here

            if wapus:GetValue("Gun Mods", "No Spread") then
                data.hipfirespread = 0
                data.hipfirestability = 99999
                data.hipfirespreadrecover = 99999
            end

            if wapus:GetValue("Gun Mods", "Small Crosshair") then
                data.crosssize = 10
                data.crossexpansion = 0
                data.crossspeed = 100
                data.crossdamper = 1
            end

            if wapus:GetValue("Gun Mods", "No Crosshair") then
                data.crosssize = 1000000000
                data.crossexpansion = 0
                data.crossspeed = 100
                data.crossdamper = 1
            end
        end

        return data
    end, getWeaponModule = contentDatabase.getWeaponModule, __index = contentDatabase})

    debug.setupvalue(cameraObject.step, 2, {fromAxisAngle = function(...)
        return (aimbotting or wapus:GetValue("Gun Mods", "No Camera Sway")) and CFrame.identity or cframeLib.fromAxisAngle(...)
    end, __index = cframeLib})]]

    local getUnlocksData = playerDataUtils.getUnlocksData
    function playerDataUtils.getUnlocksData(player)
        local unlocks = getUnlocksData(player)

        if player == playerClient.getPlayerData() and unlockAttachments then
            local oldUnlocks = unlocks
            unlocks = setmetatable({}, {
                __index = function(self, index)
                    if not oldUnlocks[index] then
                        oldUnlocks[index] = {}
                    end

                    oldUnlocks[index].kills = 1000000000
                    return oldUnlocks[index]
                end,
                __newindex = function(self, index, value)
                    oldUnlocks[index] = value
                    return
                end
            })
        end

        return unlocks
    end

    local weaponFolder = game:GetService("ReplicatedStorage").Content.ProductionContent.WeaponDatabase
    local ownsWeapon = playerDataUtils.ownsWeapon
    function playerDataUtils.ownsWeapon(player, wepName)
        --[[local data = contentDatabase.getWeaponData(wepName) -- more god damn synz instability

        if data.type == "KNIFE" and unlockKnives then
            return true
        end]]

        if unlockKnives then
            for i = 1, 4 do
                local index = (i == 1 and "ONE HAND BLUNT") or (i == 2 and "ONE HAND BLADE") or (i == 3 and "TWO HAND BLUNT") or "TWO HAND BLADE"

                if weaponFolder[index]:FindFirstChild(string.upper(wepName)) then
                    return true
                end
            end
        end

        return ownsWeapon(player, wepName)
    end

    local playSoundId = audioSystem.playSoundId
    function audioSystem.playSoundId(assetId, priority, volume, pitch, part, maxPartDist, pitchRange, randomPitch, emitterSize, rollOffMode, playOnRemove, looped)
        if wapus:GetValue("Sounds", "Shoot Sound") ~= "None" then
            local controller = weaponInterface.getActiveWeaponController()
            local weapon = controller and controller:getActiveWeapon()

            if weapon and assetId == weapon:getWeaponStat("firesoundid") then
                return playSoundId(customAudios[wapus:GetValue("Sounds", "Shoot Sound")], priority, volume)
            end
        end

        return playSoundId(assetId, priority, volume, pitch, part, maxPartDist, pitchRange, randomPitch, emitterSize, rollOffMode, playOnRemove, looped)
    end

    local playSound = audioSystem.playSound
    function audioSystem.playSound(soundName, ...)
        local args = table.pack(...)

        if wapus:GetValue("Sounds", "Hit Sound") ~= "None" and soundName == "hitmarker" then
            return playSoundId(customAudios[wapus:GetValue("Sounds", "Hit Sound")], 1, args[3])
        elseif wapus:GetValue("Sounds", "Footstep Sound") ~= "None" and (args[1] == "SelfFoley") then
            return playSoundId(customAudios[wapus:GetValue("Sounds", "Footstep Sound")], args[2], args[3])
        elseif wapus:GetValue("Sounds", "Kill Sound") ~= "None" and (soundName == "killshot" or soundName == "headshotkill") then
            return playSoundId(customAudios[wapus:GetValue("Sounds", "Kill Sound")], 1, args[3])
        elseif wapus:GetValue("Sounds", "Got Hit Sound") ~= "None" and (soundName == "crackSmall" or soundName == "crackBig") then
            return playSoundId(customAudios[wapus:GetValue("Sounds", "Got Hit Sound")], 1, args[3])
        end

        return playSound(soundName, ...)
    end

    --local oldGlassSounds = debug.getupvalue(effects.breakwindow, 3) -- i dont know how the fuck im gonna find a new method for this one
    --callbackList["Sounds%%Glass Breaking Sound"] = function(state)
    --    debug.setupvalue(effects.breakwindow, 3, (not state or state == "None") and oldGlassSounds or {
    --        customAudios[state],
    --        customAudios[state],
    --        customAudios[state]
    --    })
    --end

    local breakwindow = effects.breakwindow
    function effects.breakwindow(part, receiveWindow, netTime)
        if part.Name ~= "Window" then
            return
        elseif wapus:GetValue("Sounds", "Glass Breaking Sound") ~= "None" then
            misc.ChildAdded:Connect(function(child)
                if child.ClassName == "Part" and child.CFrame == part.CFrame then
                    child.ChildAdded:Connect(function(sound)
                        if sound.ClassName == "Sound" then
                            sound.SoundId = customAudios[wapus:GetValue("Sounds", "Glass Breaking Sound")] or ""
                        end
                    end)
                end
            end)
        end

        return breakwindow(part, receiveWindow, netTime)
    end

    local setBaseWalkSpeed = charObject.setBaseWalkSpeed
    function charObject:setBaseWalkSpeed(speed)
        newSpawnCache.walkSpeed = newSpawnCache.walkSpeed or speed
        return setBaseWalkSpeed(self, wapus:GetValue("Movement", "Walk Speed") and wapus:GetValue("Movement", "Set Speed") or speed)
    end

    local jump = charObject.jump
    function charObject:jump(height, vaulting)
        return jump(self, 4 + (wapus:GetValue("Movement", "Jump Power") and wapus:GetValue("Movement", "Height Addition") or 0), vaulting)
    end

    callbackList["Movement%%Walk Speed"] = function(state)
        if charInterface.isAlive() then
            local object = charInterface.getCharacterObject()

            if state then
                setBaseWalkSpeed(object, wapus:GetValue("Movement", "Set Speed"))
            else
                setBaseWalkSpeed(object, newSpawnCache.walkSpeed)
            end

            object:updateWalkSpeed()
        end
    end

    callbackList["Movement%%Set Speed"] = function(state)
        if charInterface.isAlive() then
            local object = charInterface.getCharacterObject()
            setBaseWalkSpeed(object, state)
            object:updateWalkSpeed()
        end
    end

    --callbackList["Movement%%Fly"] = function(state)
    --    if not state and charInterface.isAlive() then
    --        local object = charInterface.getCharacterObject()
    --        local rootPart = object and object:getRealRootPart()
    --
    --        if rootPart and rootPart.Anchored then
    --            rootPart.Anchored = false
    --        end
    --    end
    --end

    callbackList["Tweaks%%Custom Kill Notification"] = function(state)
        hudnotify.typeList.kill[1] = state and wapus:GetValue("Tweaks", "Notification Text") or "Enemy Killed!"
    end

    callbackList["Tweaks%%Notification Text"] = function(state)
        if wapus:GetValue("Tweaks", "Custom Kill Notification") then
            hudnotify.typeList.kill[1] = state
        end
    end

    callbackList["Tweaks%%Unlock All Attachments"] = function()
        unlockAttachments = true
    end

    callbackList["Tweaks%%Unlock All Knives"] = function()
        unlockKnives = true
    end

    --local camoDatabase = debug.getupvalue(skinCaseUtils.getSkinDataset, 1)
    --local camoDatabase = require(game:GetService("ReplicatedStorage").Content.ProductionContent.CamoDatabase)
    local camoDatabase
    for i, v in getgc(true) do
        if type(v) == "table" and rawget(v, "Mentha Spicata") and rawget(v, "Dove blue") then
            camoDatabase = v
            break
        end
    end

    callbackList["Tweaks%%Unlock All Camos"] = function()
        unlockCamos = true

        for camoName, camoData in camoDatabase do
            if camoData.Case then
                playerDataUtils.getCasePacketData(playerClient.getPlayerData(), camoData.Case, true).Skins[camoName] = { -- this also unlocks a bunch of knives as camos if u scroll through all the camos knives will come up
                    ALL = true
                }
            end
        end
    end

    callbackList["Tweaks%%Unlock All"] = function() -- this a mf perfected client side unlock all
        local classData = playerDataUtils.getClassData(playerClient.getPlayerData())

        for _, class in {"Assault", "Scout", "Support", "Recon"} do
            local primary = classData[class].Primary.Name
            local secondary = classData[class].Secondary.Name

            fakeWeapons[class] = {primary, secondary}
            realWeapons[class] = {primary, secondary}
        end

        playerClient.getPlayerData().unlockAll = true
        unlockAll = true
    end

    callbackList["Anti Aim%%Spin Bot"] = function()
        startTime = os.clock()
    end

    callbackList["Anti Aim%%Enabled (May Cause Despawning)"] = function(state)
        callbackList["Anti Aim%%Spin Bot"]()

        if charInterface.isAlive() then
            if wapus:GetValue("Third Person", "Show Character") and wapus:GetValue("Third Person", "Apply Anti Aim To Character") and currentObj then
                if wapus:GetValue("Anti Aim", "Force Stance") then
                    local stance = state and wapus:GetValue("Anti Aim", "Set Stance") or newSpawnCache.stance or "stand"
                    currentObj:setStance(stance)
                end

                if wapus:GetValue("Anti Aim", "Jitter") then
                    currentObj:setAim(false)
                end
            end

            if wapus:GetValue("Anti Aim", "Force Stance") then
                local stance = state and wapus:GetValue("Anti Aim", "Set Stance") or newSpawnCache.stance or "stand"
                send(network, "stance", stance)
            end

            if wapus:GetValue("Anti Aim", "Jitter") and not state then
                send(network, "aim", false)
            end
        end
    end

    local lastPos
    callbackList["Third Person%%Enabled"] = function(state)
        if charInterface.isAlive() and wapus:GetValue("Third Person", "Show Character") then
            if state then
                started = true
            else
                fakeRepObject:despawn()
                currentObj:Destroy()
                currentObj = nil
                lastPos = nil
            end
        end
    end

    callbackList["Movement%%Noclip"] = function(state) -- yeah im not fixing this
        if charInterface.isAlive() and not state then
            charInterface.getCharacterObject():getRealRootPart().CanCollide = true
        end
    end

    aimbotfov.Color = Color3.new(1, 1, 1)
    aimbotfov.Radius = 300
    aimbotfov.NumSides = 48
    aimbotfov.Visible = false

    callbackList["Aim Bot%%Show FOV Circle"] = function(state)
        aimbotfov.Visible = state
    end

    callbackList["Aim Bot%%FOV Circle Color"] = function(state)
        aimbotfov.Color = state
    end

    callbackList["Aim Bot%%FOV Radius"] = function(state)
        aimbotfov.Radius = state
    end

    aimbotdeadfov.Color = Color3.new(1, 1, 1)
    aimbotdeadfov.Radius = 200
    aimbotdeadfov.NumSides = 48
    aimbotdeadfov.Visible = false

    callbackList["Aim Bot%%Show Dead FOV Circle"] = function(state)
        aimbotdeadfov.Visible = state
    end

    callbackList["Aim Bot%%Dead FOV Circle Color"] = function(state)
        aimbotdeadfov.Color = state
    end

    callbackList["Aim Bot%%Dead FOV Radius"] = function(state)
        aimbotdeadfov.Radius = state
    end

    silentaimfov.Color = Color3.new(1, 1, 1)
    silentaimfov.Radius = 300
    silentaimfov.NumSides = 48
    silentaimfov.Visible = false

    callbackList["Silent Aim%%Show FOV Circle"] = function(state)
        silentaimfov.Visible = state
    end

    callbackList["Silent Aim%%FOV Circle Color"] = function(state)
        silentaimfov.Color = state
    end

    callbackList["Silent Aim%%FOV Radius"] = function(state)
        silentaimfov.Radius = state
    end

    silentaimdeadfov.Color = Color3.new(1, 1, 1)
    silentaimdeadfov.Radius = 200
    silentaimdeadfov.NumSides = 48
    silentaimdeadfov.Visible = false

    callbackList["Silent Aim%%Show Dead FOV Circle"] = function(state)
        silentaimdeadfov.Visible = state
    end

    callbackList["Silent Aim%%Dead FOV Circle Color"] = function(state)
        silentaimdeadfov.Color = state
    end

    callbackList["Silent Aim%%Dead FOV Radius"] = function(state)
        silentaimdeadfov.Radius = state
    end

    callbackList["FOV Settings%%Circle Side Number"] = function(state)
        aimbotfov.NumSides = state
        aimbotdeadfov.NumSides = state
        silentaimfov.NumSides = state
        silentaimdeadfov.NumSides = state
    end

    callbackList["FOV Settings%%Circle Opacity"] = function(state)
        state *= 0.01
        aimbotfov.Transparency = state
        aimbotdeadfov.Transparency = state
        silentaimfov.Transparency = state
        silentaimdeadfov.Transparency = state
    end

    callbackList["FOV Settings%%Fill Circles"] = function(state)
        aimbotfov.Filled = state
        aimbotdeadfov.Filled = state
        silentaimfov.Filled = state
        silentaimdeadfov.Filled = state
    end

    callbackList["Hit Boxes%%Enabled"] = function(state)
        hitboxObjects:ClearAllChildren()
    end

    callbackList["Hit Boxes%%Size"] = callbackList["Hit Boxes%%Enabled"]

    callbackList["World Visuals%%Ambient"] = function(state)
        if not state then
            if charInterface.isAlive() then
                local ambient = lighting.MapLighting:FindFirstChild("Ambient")
                local outdoorAmbient = lighting.MapLighting:FindFirstChild("OutdoorAmbient")

                if ambient and outdoorAmbient then
                    lighting.Ambient = ambient.Value
                    lighting.OutdoorAmbient = outdoorAmbient.Value
                end
            else
                lighting.Ambient = Color3.new(0, 0, 0)
                lighting.OutdoorAmbient = Color3.new(0.5, 0.5, 0.5)
            end
        end
    end

    --table.insert(connectionList, ignore.ChildAdded:Connect(function(ref)
    --    if wapus:GetValue("Movement", "Noclip") and ref.ClassName == "Model" then
    --        task.delay(0.5, function()
    --            for _, part in ref:GetDescendants() do
    --                if part.ClassName:find("Part") then
    --                    part.CanCollide = false
    --                end
    --            end
    --        end)
    --    end
    --end))

    crossdot.Filled = true
    crossdot.Size = Vector2.new(1, 1)
    local function updateCrosshair()
        local enabled = wapus:GetValue("Crosshair", "Enabled")
        crossdot.Visible = enabled and wapus:GetValue("Crosshair", "Show Dot")

        if cross1.Visible ~= enabled then
            cross1.Visible = enabled
            cross2.Visible = enabled
            cross3.Visible = enabled
            cross4.Visible = enabled
        end

        if not wapus:GetValue("Crosshair", "Rainbow Crosshair") then
            local color = wapus:GetValue("Crosshair", "Crosshair Color")
            crossdot.Color = color
            cross1.Color = color
            cross2.Color = color
            cross3.Color = color
            cross4.Color = color
        end
    end

    local function updateCrosshairPos(force) -- i didnt want to make this
        local barrel = wapus:GetValue("Crosshair", "Follow Recoil") and getBarrelLocation()
        if barrel then barrel = (barrel.Z > 0 and Vector2.new(barrel.X, barrel.Y)); end
        local middle = barrel or (camera.ViewportSize * 0.5)
        local x, y = middle.X, middle.Y
        local sx = wapus:GetValue("Crosshair", "X Space") * 0.5
        local sy = wapus:GetValue("Crosshair", "Y Space") * 0.5
        local w = wapus:GetValue("Crosshair", "X Size")
        local h = wapus:GetValue("Crosshair", "Y Size")
        local speed = wapus:GetValue("Crosshair", "Spin Speed")
        crossdot.Position = middle

        if speed == 0 or force then
            cross1.From = Vector2.new(x + sx, y)
            cross1.To = Vector2.new(x + sx + w, y)
            cross2.From = Vector2.new(x, y + sy)
            cross2.To = Vector2.new(x, y + sy + h)
            cross3.From = Vector2.new(x - sx, y)
            cross3.To = Vector2.new(x - sx - w, y)
            cross4.From = Vector2.new(x, y - sy)
            cross4.To = Vector2.new(x, y - sy - h)
        else
            local delta = (os.clock() * speed) % 1
            local baseangle = delta * tau
            local a1 = Vector2.new(math.cos(baseangle), math.sin(baseangle))
            baseangle += quarter
            local a2 = Vector2.new(math.cos(baseangle), math.sin(baseangle))
            baseangle += quarter
            local a3 = Vector2.new(math.cos(baseangle), math.sin(baseangle))
            baseangle += quarter
            local a4 = Vector2.new(math.cos(baseangle), math.sin(baseangle))
            baseangle += quarter
            cross1.From = a1 * sx + middle
            cross1.To = a1 * (sx + w) + middle
            cross2.From = a2 * sy + middle
            cross2.To = a2 * (sy + h) + middle
            cross3.From = a3 * sx + middle
            cross3.To = a3 * (sx + w) + middle
            cross4.From = a4 * sy + middle
            cross4.To = a4 * (sy + h) + middle
        end
    end

    callbackList["Crosshair%%Enabled"] = function(state)
        updateCrosshair()
        updateCrosshairPos()
    end

    callbackList["Crosshair%%Rainbow Crosshair"] = updateCrosshair
    callbackList["Crosshair%%Crosshair Color"] = updateCrosshair
    callbackList["Crosshair%%Show Dot"] = updateCrosshair
    callbackList["Crosshair%%Spin Speed"] = function(state) updateCrosshairPos(state == 0); end
    callbackList["Crosshair%%X Size"] = updateCrosshairPos
    callbackList["Crosshair%%Y Size"] = updateCrosshairPos
    callbackList["Crosshair%%X Space"] = updateCrosshairPos
    callbackList["Crosshair%%Y Space"] = updateCrosshairPos

    local arms = {}
    local weapons = {}

    table.insert(connectionList, camera.ChildAdded:Connect(function(model)
        if model.ClassName == "Model" then
            local arm = model:FindFirstChild("Arm")
            local prefix = arm and "Arm " or "Gun "

            if wapus:GetValue("Chams", prefix .. "Chams") then
                local properties, uncache = cham.new(model, {
                    Material = Enum.Material[wapus:GetValue("Chams", prefix .. "Material")],
                    Transparency = wapus:GetValue("Chams", prefix .. "Transparency") * 0.01,
                    Color = wapus:GetValue("Chams", prefix .. "Color")
                }, false, true, false)

                if properties then
                    local storage = arm and arms or weapons
                    table.insert(storage, properties)

                    local parentConnection; parentConnection = model:GetPropertyChangedSignal("Parent"):Connect(function()
                        if model.Parent ~= camera then
                            uncache()
                            parentConnection:Disconnect()
                            table.remove(storage, table.find(storage, properties))
                        end
                    end)
                end
            end
        end
    end))

    callbackList["Chams%%Arm Color"] = function(state)
        for _, properties in arms do
            properties.Color = state
        end
    end

    callbackList["Chams%%Arm Transparency"] = function(state)
        for _, properties in arms do
            properties.Transparency = state * 0.01
        end
    end

    callbackList["Chams%%Arm Material"] = function(state)
        for _, properties in arms do
            properties.Material = Enum.Material[state]
        end
    end

    callbackList["Chams%%Gun Color"] = function(state)
        for _, properties in weapons do
            properties.Color = state
        end
    end

    callbackList["Chams%%Gun Transparency"] = function(state)
        for _, properties in weapons do
            properties.Transparency = state * 0.01
        end
    end

    callbackList["Chams%%Gun Material"] = function(state)
        for _, properties in weapons do
            properties.Material = Enum.Material[state]
        end
    end

    callbackList["Server Hopper%%Copy Join Script"] = function()
        setclipboard('game:GetService("TeleportService"):TeleportToPlaceInstance(' .. tostring(game.PlaceId) .. ', "' .. tostring(game.JobId) .. '")')
    end

    callbackList["Server Hopper%%Rejoin"] = function()
        teleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end

    callbackList["Server Hopper%%Clear Cached Servers"] = function()
        writefile(folderName .. "/cache/servers.json", httpService:JSONEncode({}))
    end

    local function hopServers()
        local cachedServers = httpService:JSONDecode(readfile(folderName .. "/cache/servers.json"))

		for _, v in game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data do
			if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId and not table.find(cachedServers, v.id) then
				table.insert(cachedServers, v.id)
                writefile(folderName .. "/cache/servers.json", httpService:JSONEncode(cachedServers))

                task.delay(0.15, function()
                    teleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
                end)

                break
			end
		end
    end

    callbackList["Server Hopper%%Server Hop"] = function()
        hopServers()
    end

    local startvotekick = networkConnections.startvotekick
    function networkConnections.startvotekick(username, delay, votes)
        if wapus:GetValue("Server Hopper", "Server Hop On Votekick") and username == localPlayer.Name then -- this should work mf
            hopServers()
        end

        return startvotekick(username, delay, votes)
    end

    local lastSpamIndex;
    local globalChannel = game:GetService("TextChatService").TextChannels.Global;
    local function chatSpam() -- idk why this doesnt work on some exploits
        -- 05/18/25
        -- hello pf uses shitty chat now

        if wapus:GetValue("Chat Spam", "Enabled") then
            local list = chatSpamLists[wapus:GetValue("Chat Spam", "Spam List")]
            local newSpamIndex = 1

            if #list ~= 1 then
                repeat newSpamIndex = math.random(1, #list) until newSpamIndex ~= lastSpamIndex
            end

            --network:send("sendChatMessage", list[newSpamIndex], wapus:GetValue("Chat Spam", "Team Chat"))
            globalChannel:SendAsync(list[newSpamIndex]);
            lastSpamIndex = newSpamIndex
        end

        task.delay(wapus:GetValue("Chat Spam", "Spam Delay"), chatSpam)
    end
    task.delay(1, chatSpam)

    -- goated knife bot settings
    local rageScanDelayMS = 200
    local killCooldownMS = rageScanDelayMS * 2
    local failCooldownMS = 750

    local correctposition = networkConnections.correctposition
    function networkConnections.correctposition(position)
        newSpawnCache.lastUpdate = position
        TPfailed = true
        teleporting = false

        if teleportData and teleportData.player then
            local plr = teleportData.player
            ignoredPlayers[plr] = true
            task.delay(failCooldownMS * 0.001, function()
                ignoredPlayers[plr] = false
            end)
        end

        return correctposition(position)
    end

    local pathfindingParams = {
        step = 3,
        trials = 1/0,
        weighting = 400,
        mindist = 23,
        maxtime = 1,
    }
    local raging = false
    local function initKnifeBot()
        local nextScan = 0
        raging = true

        while raging do -- i ran out of amphetamines
            local clock = os.clock()
            local root = charInterface.getCharacterObject()
            root = root and root:getRealRootPart()

            if root then
                newSpawnCache.init = true

                if newSpawnCache.spawned and newSpawnCache.lastUpdate and (clock - newSpawnCache.spawnTime) > 1 and (nextScan - clock) <= 0 and not roundSystem.roundLock and ((not wapus:GetValue("Knife Bot", "Only When Holding Knife")) or (newSpawnCache.slot == 3)) then
                    local closestCharacters = getClosestPlayers(newSpawnCache.lastUpdate, true, wapus:GetValue("Knife Bot", "Only Kill Target Status"), wapus:GetValue("Knife Bot", "Whitelist Friendly Status"))

                    if closestCharacters then
                        for entryIndex = 1, #closestCharacters do
                            local position = closestCharacters[entryIndex]._receivedPosition
                            local targetPlayer = closestCharacters[entryIndex]._player

                            if position then
                                --local path = astar:findpath(newSpawnCache.lastUpdate, position, 9.9, 15)
                                local result, data = pathfinding.floorAStar({
                                    start = newSpawnCache.lastUpdate,
                                    goal = position,
                                    parameters = pathfindingParams
                                })
                                runService.RenderStepped:Wait()

                                if result == true then
                                    local path = pathfinding.optimizePath(data.waypoints, 9.9)
                                    local origin = newSpawnCache.lastUpdate

                                    local lastPosition = path[#path]
                                    --table.insert(path, 1, origin)
                                    teleporting = true -- raspy PLEASE
                                    teleportData = {
                                        teleportPosition = lastPosition,
                                        player = targetPlayer,
                                        length = #path,
                                        path = path,
                                        index = 1,
                                        time = nil
                                    }

                                    repeat runService.Heartbeat:Wait() until not teleporting

                                    if not TPfailed then
                                        for _ = 1, 2 do
                                            send(network, "stab")
                                            send(network, "knifehit", targetPlayer, "Head", position, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
                                        end

                                        killedPlayers[targetPlayer] = true
                                        task.delay(killCooldownMS * 0.001, function()
                                            killedPlayers[targetPlayer] = false
                                        end)
                                    end

                                    nextScan = clock + rageScanDelayMS * 0.001
                                    TPfailed = false

                                    break
                                end
                            end
                        end
                    end
                end
            elseif newSpawnCache.spawned and newSpawnCache.init then
                newSpawnCache.spawned = false
                newSpawnCache.init = false
            end

            runService.Heartbeat:Wait()
        end
    end

    callbackList["Knife Bot%%Kill All (May Despawn)"] = function(state)
        if state then
            if not raging then
                task.spawn(initKnifeBot)
            end
        else
            raging = state
        end

        if charInterface.isAlive() then
            if not wapus:GetValue("Knife Bot", "Only When Holding Knife") and newSpawnCache.slot ~= 3 then
                if state then
                    send(network, "equip", 3, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
                else
                    send(network, "equip", newSpawnCache.slot, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
                end
            end
        end
    end

    callbackList["Knife Bot%%Only When Holding Knife"] = function(state)
        if wapus:GetValue("Knife Bot", "Kill All (May Despawn)") and charInterface.isAlive() and newSpawnCache.slot ~= 3 then
            if state then
                send(network, "equip", newSpawnCache.slot, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
            else
                send(network, "equip", 3, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
            end
        end
    end

    --            --Box handles
    --            local hasCham = character.Head:FindFirstChild("Box")
    --            if settings.boxHandleChams then
    --                for partName, part in character do
    --                    if hasCham == nil then
    --                        local newCham = Instance.new("BoxHandleAdornment")
    --                        newCham.Adornee = part
    --                        newCham.Size = desktopHitBox[partName].size
    --                        newCham.ZIndex = 0
    --                        newCham.AlwaysOnTop = true
    --                        newCham.Name = "Box"
    --                        newCham.Parent = part
    --                        newCham.Visible = true
    --                    end
    --                    local chamPart = part.Box
    --                    chamPart.Transparency = settings.boxHandleChamsTransparency
    --                    chamPart.Color3 = settings.boxHandleChamsColor
    --                end
    --            elseif hasCham then
    --                for partName, part in character do
    --                    part.Box:Destroy()
    --                end
    --            end

    local newThirdPerson = thirdPersonObject.new
    function thirdPersonObject.new(player, a, playerReplicationObject)
        local thirdPerson = newThirdPerson(player, a, playerReplicationObject)
        thirdPerson._rootPart.Name = "HumanoidRootPart"

        for partName, part in thirdPerson._characterModelHash do
            part.Name = partName
            part.Size = desktopHitBox[partName].size
        end

        return thirdPerson
    end

    replicationInterface.operateOnAllEntries(function(player, entry)
        local thirdPerson = entry:getThirdPersonObject()

        if thirdPerson then
            thirdPerson._rootPart.Name = "HumanoidRootPart"

            for partName, part in thirdPerson:getCharacterHash() do
                part.Name = partName
                part.Size = desktopHitBox[partName].size
            end
        end
    end)

    local espInterface = loadstring(game:HttpGet("https://raw.githubusercontent.com/jensonhirst/Sirius/refs/heads/request/library/sense/source.lua"))()
    espInterface.teamSettings = {
        enemy = {
            enabled = true,
            box = false,
            boxColor = { Color3.new(1,0,0), 1 },
            boxOutline = true,
            boxOutlineColor = { Color3.new(), 1 },
            boxFill = false,
            boxFillColor = { Color3.new(1,0,0), 0.5 },
            healthBar = false,
            healthyColor = Color3.new(0,1,0),
            dyingColor = Color3.new(1,0,0),
            healthBarOutline = true,
            healthBarOutlineColor = { Color3.new(), 0.5 },
            healthText = false,
            healthTextColor = { Color3.new(1,1,1), 1 },
            healthTextOutline = true,
            healthTextOutlineColor = Color3.new(),
            box3d = false,
            box3dColor = { Color3.new(1,0,0), 1 },
            name = false,
            nameColor = { Color3.new(1,1,1), 1 },
            nameOutline = true,
            nameOutlineColor = Color3.new(),
            weapon = false,
            weaponColor = { Color3.new(1,1,1), 1 },
            weaponOutline = true,
            weaponOutlineColor = Color3.new(),
            distance = false,
            distanceColor = { Color3.new(1,1,1), 1 },
            distanceOutline = true,
            distanceOutlineColor = Color3.new(),
            tracer = false,
            tracerOrigin = "Bottom",
            tracerColor = { Color3.new(1,0,0), 1 },
            tracerOutline = true,
            tracerOutlineColor = { Color3.new(), 1 },
            offScreenArrow = false,
            offScreenArrowColor = { Color3.new(1,1,1), 1 },
            offScreenArrowSize = 15,
            offScreenArrowRadius = 150,
            offScreenArrowOutline = true,
            offScreenArrowOutlineColor = { Color3.new(), 1 },
            chams = false,
            chamsVisibleOnly = false,
            chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
            chamsOutlineColor = { Color3.new(1,0,0), 0 },
        },
        friendly = {
            enabled = false,
            box = false,
            boxColor = { Color3.new(0,1,0), 1 },
            boxOutline = true,
            boxOutlineColor = { Color3.new(), 1 },
            boxFill = false,
            boxFillColor = { Color3.new(0,1,0), 0.5 },
            healthBar = false,
            healthyColor = Color3.new(0,1,0),
            dyingColor = Color3.new(1,0,0),
            healthBarOutline = true,
            healthBarOutlineColor = { Color3.new(), 0.5 },
            healthText = false,
            healthTextColor = { Color3.new(1,1,1), 1 },
            healthTextOutline = true,
            healthTextOutlineColor = Color3.new(),
            box3d = false,
            box3dColor = { Color3.new(0,1,0), 1 },
            name = false,
            nameColor = { Color3.new(1,1,1), 1 },
            nameOutline = true,
            nameOutlineColor = Color3.new(),
            weapon = false,
            weaponColor = { Color3.new(1,1,1), 1 },
            weaponOutline = true,
            weaponOutlineColor = Color3.new(),
            distance = false,
            distanceColor = { Color3.new(1,1,1), 1 },
            distanceOutline = true,
            distanceOutlineColor = Color3.new(),
            tracer = false,
            tracerOrigin = "Bottom",
            tracerColor = { Color3.new(0,1,0), 1 },
            tracerOutline = true,
            tracerOutlineColor = { Color3.new(), 1 },
            offScreenArrow = false,
            offScreenArrowColor = { Color3.new(1,1,1), 1 },
            offScreenArrowSize = 15,
            offScreenArrowRadius = 150,
            offScreenArrowOutline = true,
            offScreenArrowOutlineColor = { Color3.new(), 1 },
            chams = false,
            chamsVisibleOnly = false,
            chamsFillColor = { Color3.new(0.2, 0.2, 0.2), 0.5 },
            chamsOutlineColor = { Color3.new(0,1,0), 0 }
        }
    }

    espInterface.getCharacter = LPH_NO_VIRTUALIZE(function(player)
        local playerReplicationObject = replicationInterface.getEntry(player)
        local thirdPerson = playerReplicationObject:isReady() and playerReplicationObject._smoothReplication._prevFrameTime and playerReplicationObject and playerReplicationObject:getThirdPersonObject()
        return thirdPerson and thirdPerson:getCharacterModel(), thirdPerson and thirdPerson:getRootPart()
    end)

    espInterface.getHealth = LPH_NO_VIRTUALIZE(function(player, character)
        local playerReplicationObject = replicationInterface.getEntry(player)
        return playerReplicationObject:getHealth(), 100
    end)

    espInterface.getWeapon = LPH_NO_VIRTUALIZE(function(player)
        local playerReplicationObject = replicationInterface.getEntry(player)
        local playerWeaponObject = playerReplicationObject:getWeaponObject()

        if playerReplicationObject:isAlive() and playerWeaponObject then
            return playerWeaponObject.weaponName
        end

        return "Unknown"
    end)

    espInterface.isFriendly = function(player)
        local playerReplicationObject = replicationInterface.getEntry(player)
        return not playerReplicationObject._isEnemy
    end

    espInterface.Load()

    callbackList["Enemy ESP%%Enabled"] = function(state)
        espInterface.teamSettings.enemy.enabled = state
    end

    callbackList["Enemy ESP%%Boxes"] = function(state)
        espInterface.teamSettings.enemy.box = state
    end

    callbackList["Enemy ESP%%Box Color"] = function(state)
        espInterface.teamSettings.enemy.boxColor[1] = state
    end

    callbackList["Enemy ESP%%Box Opacity"] = function(state)
        espInterface.teamSettings.enemy.boxColor[2] = state * 0.01
    end

    callbackList["Enemy ESP%%Box Outlines"] = function(state)
        espInterface.teamSettings.enemy.boxOutline = state
    end

    callbackList["Enemy ESP%%Box Outline Color"] = function(state)
        espInterface.teamSettings.enemy.boxOutlineColor[1] = state
    end

    callbackList["Enemy ESP%%Box Outline Opacity"] = function(state)
        espInterface.teamSettings.enemy.boxOutlineColor[2] = state * 0.01
    end

    callbackList["Enemy ESP%%Fill Boxes"] = function(state)
        espInterface.teamSettings.enemy.boxFill = state
    end

    callbackList["Enemy ESP%%Box Inside Color"] = function(state)
        espInterface.teamSettings.enemy.boxFillColor[1] = state
    end

    callbackList["Enemy ESP%%Box Inside Opacity"] = function(state)
        espInterface.teamSettings.enemy.boxFillColor[2] = state * 0.01
    end

    callbackList["Enemy ESP%%Health Bar"] = function(state)
        espInterface.teamSettings.enemy.healthBar = state
    end

    callbackList["Enemy ESP%%Damage Color"] = function(state)
        espInterface.teamSettings.enemy.dyingColor = state
    end

    callbackList["Enemy ESP%%Health Color"] = function(state)
        espInterface.teamSettings.enemy.healthyColor = state
    end

    callbackList["Enemy ESP%%Health Bar Outline"] = function(state)
        espInterface.teamSettings.enemy.healthBarOutline = state
    end

    callbackList["Enemy ESP%%Health Outline Color"] = function(state)
        espInterface.teamSettings.enemy.healthBarOutlineColor[1] = state
    end

    callbackList["Enemy ESP%%Tracers"] = function(state)
        espInterface.teamSettings.enemy.tracer = state
    end

    callbackList["Enemy ESP%%Tracer Color"] = function(state)
        espInterface.teamSettings.enemy.tracerColor[1] = state
    end

    callbackList["Enemy ESP%%Tracer Opacity"] = function(state)
        espInterface.teamSettings.enemy.tracerColor[2] = state * 0.01
    end

    callbackList["Enemy ESP%%Tracer Outlines"] = function(state)
        espInterface.teamSettings.enemy.tracerOutline = state
    end

    callbackList["Enemy ESP%%Tracer Outline Color"] = function(state)
        espInterface.teamSettings.enemy.tracerOutlineColor[1] = state
    end

    callbackList["Enemy ESP%%Tracer Outlines Opacity"] = function(state)
        espInterface.teamSettings.enemy.tracerOutlineColor[2] = state * 0.01
    end

    callbackList["Enemy ESP%%Tracer Origin"] = function(state)
        if state == "Top" or state == "Middle" then
            espInterface.teamSettings.enemy.tracerOrigin = state
        else
            espInterface.teamSettings.enemy.tracerOrigin = "Bottom"
        end
    end

    callbackList["Enemy ESP%%Names"] = function(state)
        espInterface.teamSettings.enemy.name = state
    end

    callbackList["Enemy ESP%%Names Color"] = function(state)
        espInterface.teamSettings.enemy.nameColor[1] = state
    end

    callbackList["Enemy ESP%%Weapons"] = function(state)
        espInterface.teamSettings.enemy.weapon = state
    end

    callbackList["Enemy ESP%%Weapons Color"] = function(state)
        espInterface.teamSettings.enemy.weaponColor[1] = state
    end

    callbackList["Enemy ESP%%Distances"] = function(state)
        espInterface.teamSettings.enemy.distance = state
    end

    callbackList["Enemy ESP%%Distances Color"] = function(state)
        espInterface.teamSettings.enemy.distanceColor[1] = state
    end

    callbackList["Enemy ESP%%Health Percents"] = function(state)
        espInterface.teamSettings.enemy.healthText = state
    end

    callbackList["Enemy ESP%%Health Number Color"] = function(state)
        espInterface.teamSettings.enemy.healthTextColor[1] = state
    end

    callbackList["Enemy ESP%%Text Outlines"] = function(state)
        espInterface.teamSettings.enemy.nameOutline = state
        espInterface.teamSettings.enemy.weaponOutline = state
        espInterface.teamSettings.enemy.distanceOutline = state
        espInterface.teamSettings.enemy.healthTextOutline = state
    end

    callbackList["Enemy ESP%%Highlight Chams"] = function(state)
        espInterface.teamSettings.enemy.chams = state
    end

    callbackList["Enemy ESP%%Highlight Outline Color"] = function(state)
        espInterface.teamSettings.enemy.chamsOutlineColor[1] = state
    end

    callbackList["Enemy ESP%%Highlight Outline Opacity"] = function(state)
        espInterface.teamSettings.enemy.chamsOutlineColor[2] = state * 0.01
    end

    callbackList["Enemy ESP%%Highlight Fill Color"] = function(state)
        espInterface.teamSettings.enemy.chamsOutlineColor[1] = state
    end

    callbackList["Enemy ESP%%Highlight Fill Opacity"] = function(state)
        espInterface.teamSettings.enemy.chamsOutlineColor[2] = state * 0.01
    end

    callbackList["Enemy ESP%%Highlight Visible Check"] = function(state)
        espInterface.teamSettings.enemy.chamsVisibleOnly = state
    end





    callbackList["Team ESP%%Enabled"] = function(state) -- why doesnt this workkk nigga
        espInterface.teamSettings.friendly.enabled = state
    end

    callbackList["Team ESP%%Boxes"] = function(state)
        espInterface.teamSettings.friendly.box = state
    end

    callbackList["Team ESP%%Box Color"] = function(state)
        espInterface.teamSettings.friendly.boxColor[1] = state
    end

    callbackList["Team ESP%%Box Opacity"] = function(state)
        espInterface.teamSettings.friendly.boxColor[2] = state * 0.01
    end

    callbackList["Team ESP%%Box Outlines"] = function(state)
        espInterface.teamSettings.friendly.boxOutline = state
    end

    callbackList["Team ESP%%Box Outline Color"] = function(state)
        espInterface.teamSettings.friendly.boxOutlineColor[1] = state
    end

    callbackList["Team ESP%%Box Outline Opacity"] = function(state)
        espInterface.teamSettings.friendly.boxOutlineColor[2] = state * 0.01
    end

    callbackList["Team ESP%%Fill Boxes"] = function(state)
        espInterface.teamSettings.friendly.boxFill = state
    end

    callbackList["Team ESP%%Box Inside Color"] = function(state)
        espInterface.teamSettings.friendly.boxFillColor[1] = state
    end

    callbackList["Team ESP%%Box Inside Opacity"] = function(state)
        espInterface.teamSettings.friendly.boxFillColor[2] = state * 0.01
    end

    callbackList["Team ESP%%Health Bar"] = function(state)
        espInterface.teamSettings.friendly.healthBar = state
    end

    callbackList["Team ESP%%Damage Color"] = function(state)
        espInterface.teamSettings.friendly.dyingColor = state
    end

    callbackList["Team ESP%%Health Color"] = function(state)
        espInterface.teamSettings.friendly.healthyColor = state
    end

    callbackList["Team ESP%%Health Bar Outline"] = function(state)
        espInterface.teamSettings.friendly.healthBarOutline = state
    end

    callbackList["Team ESP%%Health Outline Color"] = function(state)
        espInterface.teamSettings.friendly.healthBarOutlineColor[1] = state
    end

    callbackList["Team ESP%%Tracers"] = function(state)
        espInterface.teamSettings.friendly.tracer = state
    end

    callbackList["Team ESP%%Tracer Color"] = function(state)
        espInterface.teamSettings.friendly.tracerColor[1] = state
    end

    callbackList["Team ESP%%Tracer Opacity"] = function(state)
        espInterface.teamSettings.friendly.tracerColor[2] = state * 0.01
    end

    callbackList["Team ESP%%Tracer Outlines"] = function(state)
        espInterface.teamSettings.friendly.tracerOutline = state
    end

    callbackList["Team ESP%%Tracer Outline Color"] = function(state)
        espInterface.teamSettings.friendly.tracerOutlineColor[1] = state
    end

    callbackList["Team ESP%%Tracer Outlines Opacity"] = function(state)
        espInterface.teamSettings.friendly.tracerOutlineColor[2] = state * 0.01
    end

    callbackList["Team ESP%%Tracer Origin"] = function(state)
        if state == "Top" or state == "Middle" then
            espInterface.teamSettings.friendly.tracerOrigin = state
        else
            espInterface.teamSettings.friendly.tracerOrigin = "Bottom"
        end
    end

    callbackList["Team ESP%%Names"] = function(state)
        espInterface.teamSettings.friendly.name = state
    end

    callbackList["Team ESP%%Names Color"] = function(state)
        espInterface.teamSettings.friendly.nameColor[1] = state
    end

    callbackList["Team ESP%%Weapons"] = function(state)
        espInterface.teamSettings.friendly.weapon = state
    end

    callbackList["Team ESP%%Weapons Color"] = function(state)
        espInterface.teamSettings.friendly.weaponColor[1] = state
    end

    callbackList["Team ESP%%Distances"] = function(state)
        espInterface.teamSettings.friendly.distance = state
    end

    callbackList["Team ESP%%Distances Color"] = function(state)
        espInterface.teamSettings.friendly.distanceColor[1] = state
    end

    callbackList["Team ESP%%Health Percents"] = function(state)
        espInterface.teamSettings.friendly.healthText = state
    end

    callbackList["Team ESP%%Health Number Color"] = function(state)
        espInterface.teamSettings.friendly.healthTextColor[1] = state
    end

    callbackList["Team ESP%%Text Outlines"] = function(state)
        espInterface.teamSettings.friendly.nameOutline = state
        espInterface.teamSettings.friendly.weaponOutline = state
        espInterface.teamSettings.friendly.distanceOutline = state
        espInterface.teamSettings.friendly.healthTextOutline = state
    end

    callbackList["Team ESP%%Highlight Chams"] = function(state)
        espInterface.teamSettings.friendly.chams = state
    end

    callbackList["Team ESP%%Highlight Outline Color"] = function(state)
        espInterface.teamSettings.friendly.chamsOutlineColor[1] = state
    end

    callbackList["Team ESP%%Highlight Outline Opacity"] = function(state)
        espInterface.teamSettings.friendly.chamsOutlineColor[2] = state * 0.01
    end

    callbackList["Team ESP%%Highlight Fill Color"] = function(state)
        espInterface.teamSettings.friendly.chamsOutlineColor[1] = state
    end

    callbackList["Team ESP%%Highlight Fill Opacity"] = function(state)
        espInterface.teamSettings.friendly.chamsOutlineColor[2] = state * 0.01
    end

    callbackList["Team ESP%%Highlight Visible Check"] = function(state)
        espInterface.teamSettings.friendly.chamsVisibleOnly = state
    end

    local customModel
    callbackList["Custom Model%%Asset ID"] = function(state)
        if wapus:GetValue("Custom Model", "Custom Character Model") then
            if customModel then
                customModel.Parent = nil
            end

            if state then
                local modelId = "rbxassetid://" .. string.gsub(state, "rbxassetid://", "")
                customModel = game:GetObjects(modelId)

                if (not customModel) or (not customModel[1]) or (type(customModel[1]) ~= "userdata") then
                    customModel = nil
                else
                    customModel = customModel[1]
                    local part = customModel.ClassName == "Model" and customModel.PrimaryPart or customModel
                    part.Anchored = true
                    part.CanCollide = false
                    customModel.Parent = ignore
                end
            end
        end
    end
    callbackList["Custom Model%%Asset ID"](wapus:GetValue("Custom Model", "Asset ID"))

    callbackList["Custom Model%%Custom Character Model"] = function(state)
        if not state then
            if customModel then
                customModel.Parent = nil
            end
        else
            callbackList["Custom Model%%Asset ID"](wapus:GetValue("Custom Model", "Asset ID"))
        end
    end

    local objectChamUncache
    local backtrackTime = 0
    local lastRandom = 0
    local lastJitter = 0
    local lastJitterStarted = false
    local deltaTime = 0
    local lastTime = 0
    local nextShot = 0
    table.insert(connectionList, runService.Heartbeat:Connect(LPH_NO_VIRTUALIZE(function(ndt)
        local currentCharObject = charInterface.getCharacterObject()
        local rootPart = currentCharObject and currentCharObject:getRealRootPart()
        local clockTime = os.clock()

        local controller = weaponInterface.getActiveWeaponController()
        local weapon = controller and controller:getActiveWeapon()
        local aiming = weapon and weapon._aiming

        if clockTime > lastRandom + 1 then
            chanceOne = math.random(1, 100)
            chanceTwo = math.random(1, 100)
            lastRandom = clockTime
        end;

        if controller and weapon then
            local isHidden = (hidden or weapon._blackScoped or ((wapus:GetValue("Third Person", "Enabled") and wapus:GetValue("Third Person", "Show Character")) and (wapus:GetValue("Third Person", "Show Character While Aiming") or not aiming)))
            if isHidden then
                weapon._isHidden = false -- shit fix lmao
                weapon:hideModel()
                --characterobject:getArmModels()
            else
                weapon:showModel()
            end
        end

        if customModel and rootPart then
            local part = customModel.ClassName == "Model" and customModel.PrimaryPart or customModel
            part.CFrame = rootPart.CFrame * CFrame.new(wapus:GetValue("Custom Model", "Asset Offset X"), wapus:GetValue("Custom Model", "Asset Offset Y"), wapus:GetValue("Custom Model", "Asset Offset Z"))
        end

        if wapus:GetValue("Third Person", "Enabled") and wapus:GetValue("Third Person", "Show Character") then
            deltaTime = deltaTime + ndt

            if rootPart then
                local position = rootPart.Position;
                if wapus:GetValue('Anti Aim', 'Fake Lag') then
                    position = newSpawnCache.lastUpdate;
                end;
                lastPos = lastPos or position
                local velocity = (position - lastPos) / deltaTime
                deltaTime = 0

                if currentObj or started then
                    if started then
                        local classData = playerClient.getPlayerData().settings.classdata

                        -- 05/19/25
                        fakeRepObject._player = localplayer;
                        fakeRepObject:spawn(nil, classData[classData.curclass])

                        currentObj = fakeRepObject._thirdPersonObject
                        fakeRepObject:setActiveIndex(1)
                        for i = 1, 3 do
                            if fakeRepObject:getWeaponObjects()[i] then
                                currentObj:buildWeapon(i)
                            end;
                        end;

                        if wapus:GetValue("More Chams", "Third Person Character Chams") then
                            local _, uncache = cham.new(currentObj._character, {
                                Transparency = wapus:GetValue("More Chams", "Character Transparency") * 0.01,
                                Material = Enum.Material[wapus:GetValue("More Chams", "Character Material")],
                                Color = wapus:GetValue("More Chams", "Character Color")
                            }, false, true, false)
                            objectChamUncache = uncache;
                        end

                        if wapus:GetValue("Anti Aim", "Enabled (May Cause Despawning)") and wapus:GetValue("Anti Aim", "Force Stance") and wapus:GetValue("Third Person", "Apply Anti Aim To Character") and currentObj then
                            currentObj:setStance(string.lower(wapus:GetValue("Anti Aim", "Set Stance")))
                        end
                    end

                    local angles = cameraInterface:getActiveCamera():getAngles()
                    if wapus:GetValue("Anti Aim", "Enabled (May Cause Despawning)") and wapus:GetValue("Third Person", "Apply Anti Aim To Character") then
                        angles = applyAAAngles(angles)
                    end

                    local tickTime = tick()

                    fakeRepObject._posspring.t = position; -- tp... tpbb?? alextpb????? if you see this.. message tpbb on discord "you suck at deepwoken"
                    fakeRepObject._posspring.p = position;

                    fakeRepObject._lookangles.t = angles; -- incase interpolation breaks on smooth replication we will still have our third person not get fucked
                    fakeRepObject._lookangles.p = angles;

                    fakeRepObject._smoothReplication:receive(clockTime, tickTime, {
                        t = tickTime,
                        position = position,
                        velocity = velocity,
                        angles = angles,
                        barrelAngles = Vector3.zero,
                        breakcount = 0
                    }, true);

                    fakeRepObject._updaterecieved = true
                    fakeRepObject._receivedPosition = position
                    fakeRepObject._receivedFrameTime = network.getTime()
                    fakeRepObject._lastPacketTime = clockTime
                    fakeRepObject._lastBarrelAngles = Vector3.zero;
                    fakeRepObject:step(3, true)
                    if currentObj then
                        currentObj.canRenderWeapon = true
                    end
                    lastTime = clockTime
                    started = false

                    if not wapus:GetValue("Third Person", "Show Character While Aiming") and controller and aiming then
                        --currentObj:setCharacterRender(false)
                        setCharacterRender(currentObj, false)
                    end
                end
            elseif not started and currentObj then
                fakeRepObject:despawn()
                currentObj:Destroy()
                currentObj = nil
                lastPos = nil

                if objectChamUncache then
                    objectChamUncache()
                    objectChamUncache = nil
                end
            end
        end

        if wapus:GetValue("Rage Bot", "Enabled") and clockTime > nextShot and not roundSystem.roundLock and not wapus:GetValue("Knife Bot", "Kill All (May Despawn)") then --  and newSpawnCache.hasPinged
            --[[if weapon and weapon._weaponData then
                weapon:shoot(true)
            end]]

            if weapon and weapon._weaponData and newSpawnCache.lastUpdate and not teleporting then
                local origin = newSpawnCache.lastUpdate
                local closestPlayers = getClosestPlayers(origin, false, wapus:GetValue("Rage Bot", "Only Shoot Target Status"), wapus:GetValue("Rage Bot", "Whitelist Friendly Status"))
                local data = weapon._weaponData
                local penetration = data.penetrationdepth
                local speed = data.bulletspeed

                if closestPlayers and penetration and speed and (weapon._magCount > 0 or weapon._spareCount > 0) then
                    for playerIndex = 1, #closestPlayers do
                        local entry = closestPlayers[playerIndex]
                        local newOrigin, newTarget, velocity, hitTime = scanPositions(origin, entry._receivedPosition, publicSettings.bulletAcceleration, speed, penetration)

                        if newOrigin then
                            if weapon._magCount < 1 then
                                if weapon._spareCount >= data.magsize then
                                    weapon._magCount = data.magsize
                                    weapon._spareCount = weapon._spareCount - weapon._magCount
                                else
                                    weapon._magCount = weapon._spareCount
                                    weapon._spareCount = 0
                                end

                                send(network, "reload")
                            end

                            local bullets = {}
                            local bulletData = {
                                camerapos = origin,
                                firepos = newOrigin,
                                bullets = bullets
                            }

                            for _ = 1, (data.pelletcount or 1) do
                                --local ticket = debug.getupvalue(firearmObject.fireRound, 11) + 1
                                table.insert(bullets, {velocity.Unit, ticket + ticketAddition})
                                --debug.setupvalue(firearmObject.fireRound, 11, ticket)
                                ticketAddition = ticketAddition + 1
                            end

                            send(network, "newbullets", weapon.uniqueId, bulletData, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)

                            for bulletIndex = 1, #bullets do
                                local theTicket = bullets[bulletIndex][2]
                                send(network, "bullethit", weapon.uniqueId, entry._player, newTarget, "Head", theTicket, network.getTime() + newSpawnCache.latency + newSpawnCache.currentAddition)
                                --ticketCache[ticket] = true
                            end

                            if wapus:GetValue("Rage Bot", "Shoot Effects") and weapon._barrelPart then
                                local barrel = weapon._barrelPart

                                effects.muzzleflash(barrel, data.hideflash, 0.9)

                                if data.type == "SNIPER" then
                                    audioSystem.play("metalshell", 0.1)
                                elseif data.type == "SHOTGUN" then
                                    audioSystem.play("shotWeaponshell", 0.2)
                                elseif data.type == "REVOLVER" and not data.caselessammo then
                                    audioSystem.play("metalshell", 0.15, 0.8)
                                end

                                if not weapon._aiming then
                                    crosshairsInterface.fireImpulse(data.crossexpansion)
                                end

                                if data.sniperbass then
                                    audioSystem.play("1PsniperBass", 0.75)
                                    audioSystem.play("1PsniperEcho", 1)
                                end

                                audioSystem.playSoundId(data.firesoundid, 2, data.firevolume, data.firepitch, barrel, nil, 0, 0.05)
                            end

                            local fireDelay = 60 / (data.variablefirerate and data.firerate[weapon._firemodeIndex] or data.firerate)

                            --if wapus:GetValue("Rage Bot", "Firerate (May Cause Kicking)") then
                            --    if (newSpawnCache.currentAddition + fireDelay) <= timeRange then
                            --        newSpawnCache.currentAddition += fireDelay
                            --        newSpawnCache.lastOffsetUpdate = network.getTime()
                            --        fireDelay = 0
                            --        newSpawnCache.hasPinged = false
                            --    end
                            --end

                            nextShot = clockTime + fireDelay
                            weapon._magCount = weapon._magCount - 1
                            break
                        end
                    end
                end
            end
        end
    end)))

    table.insert(connectionList, runService.Stepped:Connect(function(time, ndt)
        local currentCharObject = charInterface.getCharacterObject()
        local rootPart = currentCharObject and currentCharObject:getRealRootPart()
        local clockTime = os.clock()

        local controller = weaponInterface.getActiveWeaponController()
        local weapon = controller and controller:getActiveWeapon()
        local aiming = weapon and weapon._aiming

        if clockTime > lastRandom + 1 then
            chanceOne = math.random(1, 100)
            chanceTwo = math.random(1, 100)
            lastRandom = clockTime
        end

        if controller and weapon then
            local isHidden = (hidden or weapon._blackScoped or ((wapus:GetValue("Third Person", "Enabled") and wapus:GetValue("Third Person", "Show Character")) and (wapus:GetValue("Third Person", "Show Character While Aiming") or not aiming)))
            if isHidden then
                weapon._isHidden = false -- shit fix lmao
                weapon:hideModel()
                --characterobject:getArmModels()
            else
                weapon:showModel()
            end
        end

        if customModel and rootPart then
            local part = customModel.ClassName == "Model" and customModel.PrimaryPart or customModel
            customModel.CFrame = rootPart.CFrame * CFrame.new(wapus:GetValue("Custom Model", "Asset Offset X"), wapus:GetValue("Custom Model", "Asset Offset Y"), wapus:GetValue("Custom Model", "Asset Offset Z"))
        end

        replicationInterface.operateOnAllEntries(function(player, entry)
            if entry._isEnemy then
                local character = entry._thirdPersonObject and entry._thirdPersonObject._characterModelHash
                movementCache.position[player] = movementCache.position[player] or {}

                if character then
                    table.insert(movementCache.position[player], 1, character.Head.Position)
                    table.remove(movementCache.position[player], 16)
                end
            end
        end)

        table.insert(movementCache.time, 1, clockTime)
        table.remove(movementCache.time, 16)

        if wapus:GetValue("Anti Aim", "Enabled (May Cause Despawning)") and wapus:GetValue("Anti Aim", "Jitter") and rootPart and (clockTime - lastJitter) > (1 / wapus:GetValue("Anti Aim", "Jitter Speed") / 2) then
            lastJitterStarted = not lastJitterStarted
            send(network, "aim", lastJitterStarted)
            lastJitter = clockTime

            if wapus:GetValue("Third Person", "Apply Anti Aim To Character") and currentObj then
                currentObj:setAim(lastJitterStarted)
            end
        end

        if wapus:GetValue("Movement", "Bunny Hop") and rootPart and (not wapus:GetValue("Movement", "Only While Jumping") or userInputService:IsKeyDown(Enum.KeyCode.Space)) then
            currentCharObject._lastJumpTime = 0
            currentCharObject:jump(4 + (wapus:GetValue("Movement", "Jump Power") and wapus:GetValue("Movement", "Height Addition") or 0))
        end

        if wapus:GetValue("Movement", "Noclip") and rootPart then
            local ref = ignore:FindFirstChildOfClass("Model")

            if ref then
                for _, part in ref:GetDescendants() do
                    if part.ClassName:find("Part") then
                        part.CanCollide = false
                    end
                end
            end
        end

        --[[
        if false then --wapus:GetValue("Movement", "Fly") and rootPart then
            local cframe = camera.CFrame
            local direction = Vector3.zero
            local forward = cframe.LookVector
            local right = cframe.RightVector

            if userInputService:IsKeyDown(Enum.KeyCode.W) then
                direction += forward
            end

            if userInputService:IsKeyDown(Enum.KeyCode.S) then
                direction -= forward
            end

            if userInputService:IsKeyDown(Enum.KeyCode.D) then
                direction += right
            end

            if userInputService:IsKeyDown(Enum.KeyCode.A) then
                direction -= right
            end

            if userInputService:IsKeyDown(Enum.KeyCode.Space) then
                direction += Vector3.yAxis
            end

            if userInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
                direction -= Vector3.yAxis
            end

            if direction == Vector3.zero then
                rootPart.Anchored = true
            else
                rootPart.Anchored = false
                rootPart.Velocity = direction.Unit * wapus:GetValue("Movement", "Fly Speed")
            end
        end
        ]]

        if wapus:GetValue("Hit Boxes", "Enabled") then
            replicationInterface.operateOnAllEntries(function(player, entry)
                if entry._isEnemy then
                    local sphere = hitboxObjects:FindFirstChild(player.Name)

                    if entry._receivedPosition then
                        if not sphere then
                            local size = wapus:GetValue("Hit Boxes", "Size")
                            sphere = Instance.new("Part")
                            sphere.Name = player.Name
                            sphere.CanCollide = true
                            sphere.Shape = Enum.PartType.Ball
                            sphere.Size = Vector3.new(size, size, size)
                            sphere.Material = Enum.Material[wapus:GetValue("Hit Boxes", "Material")]
                            sphere.Transparency = wapus:GetValue("Hit Boxes", "Transparency") * 0.01
                            sphere.Color = wapus:GetValue("Hit Boxes", "Color")
                            sphere.Parent = hitboxObjects
                        end

                        sphere.Position = entry._receivedPosition
                    elseif sphere then
                        sphere:Destroy()
                    end
                end
            end)
        end

        if wapus:GetValue("Backtracking", "Enabled") then
            local delay = 1 / wapus:GetValue("Backtracking", "Refresh Rate")

            if clockTime > backtrackTime + delay then
                replicationInterface.operateOnAllEntries(function(player, entry)
                    local entryThirdPersonObject = entry._thirdPersonObject
                    local character = entryThirdPersonObject and entryThirdPersonObject._character

                    if entry._isEnemy and character then
                        local clone

                        if wapus:GetValue("Backtracking", "Clone Character") then
                            clone = character:Clone()
                        else
                            clone = Instance.new("Model")
                            local part = Instance.new("Part")
                            part.CFrame = entryThirdPersonObject._rootPart.CFrame
                            part.Size = Vector3.new(4, 5, 1)
                            part.CanCollide = false
                            part.Anchored = true
                            part.Parent = clone
                        end

                        clone.Name = player.Name
                        local properties = {
                            Material = Enum.Material[wapus:GetValue("Backtracking", "Character Material")],
                            Transparency = wapus:GetValue("Backtracking", "Character Transparency") * 0.01,
                            Color = wapus:GetValue("Backtracking", "Character Color"),
                            CanCollide = true
                        }

                        local _, uncache = cham.new(clone, properties, false, true, false)
                        clone.Parent = backtrackObjects

                        task.delay(wapus:GetValue("Backtracking", "Character Duration"), function()
                            local transparency = (1 - properties.Transparency) / 5

                            for transparencyIndex = 1, 5 do
                                properties.Transparency += transparency
                                task.wait(0.05)
                            end

                            clone:Destroy()
                            if uncache then
                                uncache() -- you would not believe the lag
                            end
                        end)
                    end
                end)

                backtrackTime = clockTime
            end
        end
    end));

    local aimTime;

    local lastUpdate = tick();
    table.insert(connectionList, runService.RenderStepped:Connect(LPH_NO_VIRTUALIZE(function(deltaTime)
        if tick() - lastUpdate < 1/30 then return end;
        lastUpdate = tick();

        local controller = weaponInterface.getActiveWeaponController()
        local weapon = controller and controller:getActiveWeapon()
        local aiming = weapon and weapon._aiming
        local clockTime = os.clock()

        aimbotting = false
        if wapus:GetValue("Aim Bot", "Enabled") and aiming then
            local target, entry, part = getClosest(aimbotfov.Position, wapus:GetValue("Aim Bot", "Use FOV") and aimbotfov.Radius, wapus:GetValue("Aim Bot", "Use Dead FOV") and aimbotdeadfov.Radius, wapus:GetValue("Aim Bot", "Visible Check"), wapus:GetValue("Aim Bot", "Target Part"))

            if target and movementCache.position[entry._player][15] then
                aimbotting = true
                aimTime = aimTime or clockTime

                local player = entry._player
                local cameraObj = cameraInterface.getActiveCamera()
                local velocity = complexTrajectory(camera.CFrame * Vector3.new(0, 0, 0.5), publicSettings.bulletAcceleration, target, weapon._weaponData.bulletspeed or 10000, (movementCache.position[player][15] - movementCache.position[player][1]) / (movementCache.time[15] - movementCache.time[1]))
                local vx, vy = toanglesyx(velocity)
                local cy = cameraObj._angles.y
                local x = vx > cameraObj._maxAngle and cameraObj._maxAngle or vx < cameraObj._minAngle and cameraObj._minAngle or vx
                local y = (vy + pi - cy) % tau - pi + cy
                local newangles = Vector3.new(x, y, 0)
                local smoothing = wapus:GetValue("Aim Bot", "Smoothness")

                if smoothing ~= 0 then
                    newangles = cameraObj._angles:lerp(newangles, math.clamp(1 - smoothing + (clockTime - aimTime)^2, 0, 1))
                end

                cameraObj._delta = (newangles - cameraObj._angles) / deltaTime
                cameraObj._angles = newangles
            end
        end
        aimTime = aimbotting and aimTime

        local circlePos
        if wapus:GetValue("FOV Settings", "FOV Follows Recoil") then
            local barrel = getBarrelLocation()

            if barrel and barrel.Z > 0 then
                circlePos = Vector2.new(barrel.X, barrel.Y)
            end
        end

        circlePos = circlePos or camera.ViewportSize * 0.5
        aimbotfov.Position = circlePos
        aimbotdeadfov.Position = circlePos
        silentaimfov.Position = circlePos
        silentaimdeadfov.Position = circlePos

        if wapus:GetValue("FOV Settings", "Dynamic FOV") then
            local factor = not charInterface.isAlive() and 1 or (cameraInterface.getActiveCamera():getBaseFov() / camera.FieldOfView)
            aimbotfov.Radius = wapus:GetValue("Aim Bot", "FOV Radius") * factor
            aimbotdeadfov.Radius = wapus:GetValue("Aim Bot", "Dead FOV Radius") * factor
            silentaimfov.Radius = wapus:GetValue("Silent Aim", "FOV Radius") * factor
            silentaimdeadfov.Radius = wapus:GetValue("Silent Aim", "Dead FOV Radius") * factor
        end

        if wapus:GetValue("World Visuals", "Ambient") then
            local color = wapus:GetValue("World Visuals", "Ambient Color")
            lighting.Ambient = color
            lighting.OutdoorAmbient = color
        end

        if wapus:GetValue("Crosshair", "Enabled") then
            if (wapus:GetValue("Crosshair", "Spin Speed") > 0) or wapus:GetValue("Crosshair", "Follow Recoil") then
                updateCrosshairPos()
            end

            if wapus:GetValue("Crosshair", "Rainbow Crosshair") then
                local rainbow = Color3.fromHSV((clockTime * wapus:GetValue("Crosshair", "Rainbow Speed")) % 1, 1, 1)
                crossdot.Color = rainbow
                cross1.Color = rainbow
                cross2.Color = rainbow
                cross3.Color = rainbow
                cross4.Color = rainbow
            end
        end
    end)))

    unloadMain = function() -- this is not finished lol
        network.send = send
        weaponObject.preparePickUpFirearm = preparePickUpFirearm
        weaponObject.preparePickUpMelee = preparePickUpMelee
        screenCull.step = step
        thirdPersonObject.setCharacterRender = setCharacterRender
        charObject.setBaseWalkSpeed = setBaseWalkSpeed
        charObject.jump = jump

        backtrackObjects:Destroy()
        hitboxObjects:Destroy()
    end
    -- now was that so bad?
end)()

LPH_NO_VIRTUALIZE(function() -- Make UI
    local httpService = game:GetService("HttpService")

    if not isfolder(folderName) then -- theme.json, lastconfig.json, configs
        makefolder(folderName)
    end

    if not isfolder(folderName .. "/configs") then
        makefolder(folderName .. "/configs")
    end

    if not isfolder(folderName .. "/cache") then
        makefolder(folderName .. "/cache")
    end

    if not isfolder(folderName .. "/cache/votekick data") then
        makefolder(folderName .. "/cache/votekick data")
    end

    --writefile(folderName .. "/cache/votekick data/" .. fileName, userName)

    if not isfile(folderName .. "/cache/servers.json") then
        writefile(folderName .. "/cache/servers.json", httpService:JSONEncode({}))
    end

    if not isfolder(folderName .. "/sounds") then
        makefolder(folderName .. "/sounds")

        task.delay(1, function()
            for name, link in {
                ["roblox hit"] = "https://www.myinstants.com/media/sounds/roblox-death-sound_ytkBL7X.mp3",
                ["minecraft hit"] = "https://www.myinstants.com/media/sounds/steve-old-hurt-sound_XKZxUk4.mp3",
                ["discord"] = "https://www.myinstants.com/media/sounds/discord-notification.mp3",
                ["taco bell"] = "https://www.myinstants.com/media/sounds/taco-bell-bong-sfx.mp3",
                ["bye bye"] = "https://www.myinstants.com/media/sounds/bye-bye-see-ya-later-audiotrimmer.mp3",
                ["hit marker"] = "https://www.myinstants.com/media/sounds/hitmarker_2.mp3",
                ["punch"] = "https://www.myinstants.com/media/sounds/punch-gaming-sound-effect-hd_RzlG1GE.mp3",
                ["minecraft bow"] = "https://www.myinstants.com/media/sounds/bow_shoot.mp3",
                ["fart"] = "https://www.myinstants.com/media/sounds/fart-moan3.mp3",
                ["cum"] = "https://www.myinstants.com/media/sounds/splooge-sound.mp3",
                ["moan"] = "https://www.myinstants.com/media/sounds/anime-ahh.mp3",
                ["goofy"] = "https://www.myinstants.com/media/sounds/goofy-ahh-sounds.mp3"
            } do -- why so mean
                writefile(folderName .. "/sounds/" .. name .. ".mp3", game:HttpGet(link, true))
                task.wait(1) -- some executors limit httpget
            end
        end)
    end

    local chatListsFiles = {}
    local soundFileList = {"None"}
    local stillGoing = true
    task.spawn(function()
        while stillGoing do
            for i = 1, #soundFileList do
                soundFileList[i] = nil
            end

            table.insert(soundFileList, "None")

            for _, name in listfiles(folderName .. "/sounds") do
                --name = string.gsub(string.gsub(string.gsub(name, folderName .. "/sounds", ""), folderName .. [[\\]], ""), folderName .. "/", "") -- this so gay niggeret
                local fileNames = string.split(name, "sounds")
                name = string.sub(fileNames[2], 2, string.len(name))
                table.insert(soundFileList, name)

                if not customAudios[name] and pcall(getcustomasset, folderName .. "/sounds/" .. name) then
                    customAudios[name] = getcustomasset(folderName .. "/sounds/" .. name)
                end
            end

            for i = 1, #chatListsFiles do
                chatListsFiles[i] = nil
            end

            for _, name in listfiles(folderName .. "/chat spam lists") do
                name = string.gsub(string.gsub(name, folderName .. "/chat spam lists/", ""), folderName .. "\\chat spam lists\\", "")
                table.insert(chatListsFiles, name)

                if not chatSpamLists[name] then
                    chatSpamLists[name] = httpService:JSONDecode(readfile(folderName .. "/chat spam lists/" .. name))
                end
            end

            task.wait(3)
        end
    end)

    if not isfolder(folderName .. "/chat spam lists") then
        makefolder(folderName .. "/chat spam lists")
    end

    if not isfile(folderName .. "/chat spam lists/default.txt") then
        writefile(folderName .. "/chat spam lists/default.txt", httpService:JSONEncode({
            "but doctor prognosis: OWNED", -- legacy a pro for this list
            "but doctor results: 🔥",
            "looks like you need to talk to your doctor",
            "speak to your doctor about this one",
            "but analysis: PWNED",
            "but diagnosis: OWND"
        }))
    end

    local configExists = isfile(folderName .. "/cache/lastfile.json")
    if not configExists then
        writefile(folderName .. "/cache/lastfile.json", httpService:JSONEncode({}))
    end

    local uiCache
    local cacheExists = isfile(folderName .. "/cache/settings.json")
    if not cacheExists then
        writefile(folderName .. "/cache/settings.json", httpService:JSONEncode({}))
    else
        uiCache = httpService:JSONDecode(readfile(folderName .. "/cache/settings.json"))
    end

    local title
    if isfile(folderName .. "/theme.json") then
        local userThemeData = httpService:JSONDecode(readfile(folderName .. "/theme.json"))
        title = (userThemeData.Title == "Wapus" and "Wapus.Shop") or userThemeData.Title
        wapus.theme = {
            accent = Color3.fromRGB(table.unpack(userThemeData["Accent Color"])),
            text = Color3.fromRGB(table.unpack(userThemeData["Text Color"])),
            background = Color3.fromRGB(table.unpack(userThemeData["Background Color"])),
            lightbackground = Color3.fromRGB(table.unpack(userThemeData["Light Background Color"])),
            hidden = Color3.fromRGB(table.unpack(userThemeData["Hidden Color"])),
            hiddenText = Color3.fromRGB(table.unpack(userThemeData["Hidden Text Color"])),
            outline = Color3.fromRGB(table.unpack(userThemeData["Outline Color"]))
        }
    else
        local themeData = {
            ["Title"] = defaultUIName,
            ["Accent Color"] = {127, 72, 163},
            ["Text Color"] = {255, 255, 255},
            ["Background Color"] = {35, 35, 35},
            ["Light Background Color"] = {50, 50, 50},
            ["Hidden Color"] = {26, 26, 26},
            ["Hidden Text Color"] = {200, 200, 200},
            ["Outline Color"] = {0, 0, 0}
        }

        writefile(folderName .. "/theme.json", httpService:JSONEncode(themeData))
    end

    local menu = wapus:CreateMenu(title or defaultUIName, (not cacheExists) or devMode or uiCache.open, cacheExists and uiCache.index or 1)
    wapus.GetValue = menu.GetValue
    wapus.sectionIndexes = menu.sectionIndexes

    local function getConfigNames()
        local names = {}

        for _, name in listfiles(folderName .. "/configs") do
            table.insert(names, table.pack(string.gsub(string.gsub(string.gsub(name, ".json", ""), folderName .. "/configs/", ""), folderName .. "\\configs\\", ""))[1])
        end

        return names
    end

    local function loadConfig(config)
        for indexes, value in config do
            local section, name = table.unpack(string.split(indexes, "%%"))

            if type(value) == "table" then
                value = Color3.new(table.unpack(value))
            end

            menu:SetValue(section, name, value)
        end
    end

    local function saveConfig(name, config)
        writefile(name, httpService:JSONEncode(config))
    end

    local function getConfig()
        local config = {}

        for sectionName, section in menu.sectionIndexes do
            sectionName = sectionName .. "%%"

            for featureName, uiElement in section.flags do
                local value = uiElement.value

                if typeof(value) == "Color3" then
                    value = {value.R, value.G, value.B}
                end

                config[sectionName .. featureName] = value
            end
        end

        return config
    end

    local function getCallback(name)
        return function(value)
            if value ~= nil then
                local oldConfig = httpService:JSONDecode(readfile(folderName .. "/cache/lastfile.json"))
                local keybinds = {}
                oldConfig[name] = value

                for _, keybind in menu.keybinds do
                    local keyName, data = table.unpack(keybind)
                    table.insert(keybinds, {data.toggle.section.name .. "%%" .. data.toggle.name, keyName})
                end

                oldConfig["Keybinds"] = keybinds
                saveConfig(folderName .. "/cache/lastfile.json", oldConfig)
            end

            local callback = callbackList[name]
            if callback then
                callback(value)
            end
        end
    end

    menu.updateCache = function()
        saveConfig(folderName .. "/cache/settings.json", {open = menu.open, index = menu.tabIndex})
    end

    local legit = menu:CreateTab("Legit")
    local rage = menu:CreateTab("Rage")
    local visuals = menu:CreateTab("Visuals")
    local misc = menu:CreateTab("Misc")
    local settings = menu:CreateTab("Settings")

    local aimbot = legit:CreateSection("Aim Bot", false, "half")
    local fovsettings = aimbot:AddSection("FOV Settings", false, "half")
    local silentaim = legit:CreateSection("Silent Aim", true, "half")
    local backtrack = legit:CreateSection("Backtracking", false, "half")
    local hitboxes = backtrack:AddSection("Hit Boxes")
    local gunmods = legit:CreateSection("Gun Mods", true, "half")

    local ragebot = rage:CreateSection("Rage Bot", false, "half")
    local knifebot = rage:CreateSection("Knife Bot", false, "half");
    local antiaim = rage:CreateSection("Anti Aim", true, "whole");
    local fakelag = antiaim

    local enemyesp = visuals:CreateSection("Enemy ESP", false, "whole")
    --local teamesp = enemyesp:AddSection("Team ESP")
    local chams = visuals:CreateSection("Chams", true, "half")
    local morechams = chams:AddSection("More Chams")
    local worldvisuals = chams:AddSection("World Visuals")
    local thirdperson = visuals:CreateSection("Third Person", true, "half")
    local customChar = thirdperson:AddSection("Custom Model")
    local crosshair = thirdperson:AddSection("Crosshair")

    local movement = misc:CreateSection("Movement", false, "half")
    local sounds = misc:CreateSection("Sounds", false, "half")
    local tweaks = misc:CreateSection("Tweaks", true, "third")
    local antivotekick = tweaks:AddSection("Anti Votekick")
    local chatspam = misc:CreateSection("Chat Spam", true, "third")
    local hopper = misc:CreateSection("Server Hopper", true, "third")
    --local votekick = hopper:AddSection("Votekick")

    aimbot:AddToggle("Enabled", false, getCallback("Aim Bot%%Enabled")):AddKeyBind(nil, "Key Bind")
    aimbot:AddToggle("Visible Check", false, getCallback("Aim Bot%%Visible Check"))
    aimbot:AddSlider("Smoothness", 0, 0, 0.99, 0.01, "x", getCallback("Aim Bot%%Smoothness"))
    aimbot:AddDropdown("Target Part", "Head", {"Head", "Torso"}, getCallback("Aim Bot%%Target Part"))
    aimbot:AddToggle("Use FOV", false, getCallback("Aim Bot%%Use FOV"))
    aimbot:AddSlider("FOV Radius", 300, 2, 1000, 1, "px", getCallback("Aim Bot%%FOV Radius"))
    aimbot:AddToggle("Show FOV Circle", false, getCallback("Aim Bot%%Show FOV Circle")):AddKeyBind(nil, "FOV Key Bind"):AddColorPicker("FOV Circle Color", Color3.new(1, 1, 1), getCallback("Aim Bot%%FOV Circle Color"))
    aimbot:AddToggle("Use Dead FOV", false, getCallback("Aim Bot%%Use Dead FOV"))
    aimbot:AddSlider("Dead FOV Radius", 100, 1, 1000, 1, "px", getCallback("Aim Bot%%Dead FOV Radius"))
    aimbot:AddToggle("Show Dead FOV Circle", false, getCallback("Aim Bot%%Show Dead FOV Circle")):AddKeyBind(nil, "Dead FOV Key Bind"):AddColorPicker("Dead FOV Circle Color", Color3.new(1, 1, 1), getCallback("Aim Bot%%Dead FOV Circle Color"))

    fovsettings:AddToggle("FOV Follows Recoil", false, getCallback("FOV Settings%%FOV Follows Recoil"))
    fovsettings:AddToggle("Dynamic FOV", false, getCallback("FOV Settings%%Dynamic FOV"))
    --fovsettings:AddSlider("Circle Side Number", 48, 3, 64, 1, "", getCallback("FOV Settings%%Circle Side Number"))
    fovsettings:AddSlider("Circle Opacity", 100, 1, 100, 1, "%", getCallback("FOV Settings%%Circle Opacity"))
    fovsettings:AddToggle("Fill Circles", false, getCallback("FOV Settings%%Fill Circles"))

    silentaim:AddToggle("Enabled", false, getCallback("Silent Aim%%Enabled")):AddKeyBind(nil, "Key Bind")
    silentaim:AddToggle("Visible Check", false, getCallback("Silent Aim%%Visible Check"))
    --silentaim:AddToggle("Undetected", true, getCallback("Silent Aim%%Undetected"))
    silentaim:AddSlider("Hit Chance", 100, 1, 100, 1, "%", getCallback("Silent Aim%%Hit Chance"))
    silentaim:AddSlider("Head Shot Chance", 100, 0, 100, 1, "%", getCallback("Silent Aim%%Head Shot Chance"))
    silentaim:AddToggle("Use FOV", false, getCallback("Silent Aim%%Use FOV"))
    silentaim:AddSlider("FOV Radius", 300, 2, 1000, 1, "px", getCallback("Silent Aim%%FOV Radius"))
    silentaim:AddToggle("Show FOV Circle", false, getCallback("Silent Aim%%Show FOV Circle")):AddKeyBind(nil, "FOV Key Bind"):AddColorPicker("FOV Circle Color", Color3.new(1, 1, 1), getCallback("Silent Aim%%FOV Circle Color"))
    silentaim:AddToggle("Use Dead FOV", false, getCallback("Silent Aim%%Use Dead FOV"))
    silentaim:AddSlider("Dead FOV Radius", 100, 1, 1000, 1, "px", getCallback("Silent Aim%%Dead FOV Radius"))
    silentaim:AddToggle("Show Dead FOV Circle", false, getCallback("Silent Aim%%Show Dead FOV Circle")):AddKeyBind(nil, "Dead FOV Key Bind"):AddColorPicker("Dead FOV Circle Color", Color3.new(1, 1, 1), getCallback("Silent Aim%%Dead FOV Circle Color"))

    hitboxes:AddToggle("Enabled", false, getCallback("Hit Boxes%%Enabled")):AddKeyBind(nil, "Key Bind"):AddColorPicker("Color", Color3.new(0.1, 0.1, 1), getCallback("Hit Boxes%%Color"))
    hitboxes:AddDropdown("Hit Part", "Head", {"Head", "Torso"}, getCallback("Hit Boxes%%Hit Part"))
    hitboxes:AddSlider("Size", 20, 1, 20, 1, " Studs", getCallback("Hit Boxes%%Size"))
    hitboxes:AddSlider("Transparency", 50, 0, 100, 1, "%", getCallback("Hit Boxes%%Transparency"))
    hitboxes:AddDropdown("Material", "SmoothPlastic", {"ForceField", "SmoothPlastic", "Glass"}, getCallback("Hit Boxes%%Material"))

    backtrack:AddToggle("Enabled", false, getCallback("Backtracking%%Enabled")):AddKeyBind(nil, "Key Bind"):AddColorPicker("Character Color", Color3.new(0.1, 0.1, 1), getCallback("Backtracking%%Characters Color"))
    backtrack:AddSlider("Refresh Rate", 2, 1, 10, 1, " Characters/Second", getCallback("Backtracking%%Refresh Rate"))
    backtrack:AddSlider("Character Duration", 1, 0.1, 1, 0.1, " Seconds", getCallback("Backtracking%%Character Duration"))
    backtrack:AddSlider("Character Transparency", 50, 0, 100, 1, "%", getCallback("Backtracking%%Character Transparency"))
    backtrack:AddDropdown("Character Material", "ForceField", {"ForceField", "SmoothPlastic", "Glass"}, getCallback("Backtracking%%Character Material"))
    backtrack:AddToggle("Clone Character", true, getCallback("Backtracking%%Clone Character"))

    gunmods:AddToggle("No Recoil", false, getCallback("Gun Mods%%No Recoil"))
    gunmods:AddToggle("No Spread", false, getCallback("Gun Mods%%No Spread"))
    gunmods:AddToggle("Small Crosshair", false, getCallback("Gun Mods%%Small Crosshair"))
    gunmods:AddToggle("No Crosshair", false, getCallback("Gun Mods%%No Crosshair"))
    gunmods:AddToggle("No Sniper Scope", false, getCallback("Gun Mods%%No Sniper Scope"))
    gunmods:AddToggle("No Camera Sway", false, getCallback("Gun Mods%%No Camera Sway"))
    gunmods:AddToggle("No Camera Bob", false, getCallback("Gun Mods%%No Camera Bob"))
    gunmods:AddToggle("No Walk Sway", false, getCallback("Gun Mods%%No Walk Sway"))
    gunmods:AddToggle("No Gun Sway", false, getCallback("Gun Mods%%No Gun Sway"))
    gunmods:AddToggle("Instant Reload", false, getCallback("Gun Mods%%Instant Reload"))

    ragebot:AddToggle("Enabled", false, getCallback("Rage Bot%%Enabled")):AddKeyBind(nil, "Key Bind")
    ragebot:AddToggle("Shoot Effects", false, getCallback("Rage Bot%%Shoot Effects"))
    ragebot:AddToggle("Fire Position Scanning", false, getCallback("Rage Bot%%Fire Position Scanning"))
    ragebot:AddSlider("Fire Position Offset", 9, 1, 15.9, 0.1, " Studs", getCallback("Rage Bot%%Fire Position Offset"))
    ragebot:AddToggle("Hit Position Scanning", false, getCallback("Rage Bot%%Hit Position Scanning"))
    ragebot:AddSlider("Hit Position Offset", 6, 1, 10, 0.1, " Studs", getCallback("Rage Bot%%Hit Position Offset"))
    --ragebot:AddToggle("Firerate (May Cause Kicking)", false, getCallback("Rage Bot%%Firerate (May Cause Kicking)"))
    ragebot:AddToggle("Only Shoot Target Status", false, getCallback("Rage Bot%%Only Shoot Target Status")):AddKeyBind(nil, "Target Key Bind")
    ragebot:AddToggle("Whitelist Friendly Status", true, getCallback("Rage Bot%%Whitelist Friendly Status")):AddKeyBind(nil, "Friendly Key Bind")

    knifebot:AddToggle("Kill All (May Despawn)", false, getCallback("Knife Bot%%Kill All (May Despawn)")):AddKeyBind(nil, "Key Bind")
    knifebot:AddToggle("Only When Holding Knife", false, getCallback("Knife Bot%%Only When Holding Knife"))
    knifebot:AddToggle("Only Kill Target Status", false, getCallback("Knife Bot%%Only Kill Target Status")):AddKeyBind(nil, "Terget Key Bind")
    knifebot:AddToggle("Whitelist Friendly Status", true, getCallback("Knife Bot%%Whitelist Friendly Status")):AddKeyBind(nil, "Friendly Key Bind")

    antiaim:AddToggle("Enabled (May Cause Despawning)", false, getCallback("Anti Aim%%Enabled (May Cause Despawning)"))-- :AddKeyBind(nil, "Key Bind") broken
    antiaim:AddToggle("Yaw", false, getCallback("Anti Aim%%Yaw"))
    antiaim:AddSlider("Yaw Amount", 180, 0, 360, 1, " Degrees", getCallback("Anti Aim%%Yaw Amount"))
    antiaim:AddDropdown("Yaw Mode", "Relative", {"Relative", "Absolute"}, getCallback("Anti Aim%%Yaw Mode"))
    antiaim:AddToggle("Pitch", false, getCallback("Anti Aim%%Pitch"))
    antiaim:AddSlider("Pitch Amount", 0, 0, 180, 1, " Degrees", getCallback("Anti Aim%%Pitch Amount"))
    antiaim:AddDropdown("Pitch Mode", "Relative", {"Relative", "Absolute"}, getCallback("Anti Aim%%Pitch Mode"))
    antiaim:AddToggle("Spin Bot", false, getCallback("Anti Aim%%Spin Bot"))
    antiaim:AddSlider("Spin Speed", 180, 0, 1800, 1, " Degrees/Second", getCallback("Anti Aim%%Spin Speed"))
    antiaim:AddDropdown("Spin Direction", "Right", {"Left", "Right"}, getCallback("Anti Aim%%Spin Direction"))
    antiaim:AddToggle("Jitter", false, getCallback("Anti Aim%%Jitter"))
    antiaim:AddSlider("Jitter Speed", 6, 0, 12, 1, " Shakes/Second", getCallback("Anti Aim%%Jitter Speed"))
    antiaim:AddToggle("Force Stance", false, getCallback("Anti Aim%%Force Stance"))
    antiaim:AddDropdown("Set Stance", "Prone", {"Stand", "Crouch", "Prone"}, getCallback("Anti Aim%%Set Stance"));

    fakelag:AddToggle('Fake Lag', false, getCallback('Fake Lag%%Enabled')):AddKeyBind(nil, 'Key Bind');
    fakelag:AddToggle('Randomize Position', false, getCallback('Fake Lag%%Randomize Position'));
    fakelag:AddSlider('X-Axis Factor', 0, 0, 8.9, 1, ' Studs', getCallback('Fake Lag%%X-Axis Factor'));
    fakelag:AddSlider('Z-Axis Factor', 0, 0, 8.9, 1, ' Studs', getCallback('Fake Lag%%Z-Axis Factor'));
    fakelag:AddSlider('Refresh Distance', 5, 0, 8.9, 0.1, ' Studs', getCallback('Fake Lag%%Refresh Distance'));
    fakelag:AddSlider('Refresh Rate', 1, 0, 10, 1, ' Seconds', getCallback('Fake Lag%%Refresh Rate'))

    enemyesp:AddToggle("Enabled", true, getCallback("Enemy ESP%%Enabled"))
    enemyesp:AddToggle("Boxes", false, getCallback("Enemy ESP%%Boxes")):AddColorPicker("Box Color", Color3.fromRGB(0,255,255), getCallback("Enemy ESP%%Box Color"))
    enemyesp:AddSlider("Box Opacity", 100, 1, 100, 1, "%", getCallback("Enemy ESP%%Box Opacity"))
    --enemyesp:AddSlider("Box Thickness", 1, 1, 10, 1, " px", getCallback("Enemy ESP%%Box Thickness"))
    enemyesp:AddToggle("Box Outlines", false, getCallback("Enemy ESP%%Box Outlines")):AddColorPicker("Box Outline Color", Color3.fromRGB(0,0,0), getCallback("Enemy ESP%%Box Outline Color"))
    enemyesp:AddSlider("Box Outline Opacity", 100, 1, 100, 1, "%", getCallback("Enemy ESP%%Box Outline Opacity"))
    --enemyesp:AddSlider("Box Outline Thickness", 5, 2, 10, 1, " px", getCallback("Enemy ESP%%Box Outline Thickness"))
    enemyesp:AddToggle("Fill Boxes", false, getCallback("Enemy ESP%%Fill Boxes")):AddColorPicker("Box Inside Color", Color3.fromRGB(0,255,255), getCallback("Enemy ESP%%Box Inside Color"))
    enemyesp:AddSlider("Box Inside Opacity", 100, 1, 100, 1, "%", getCallback("Enemy ESP%%Box Inside Opacity"))
    --enemyesp:AddDropdown("Box Type", "Square", {"Square", "Cube"}, getCallback("Enemy ESP%%Box Type"))
    enemyesp:AddToggle("Health Bar", false, getCallback("Enemy ESP%%Health Bar")):AddColorPicker("Damage Color", Color3.fromRGB(255,0,0), getCallback("Enemy ESP%%Damage Color")):AddColorPicker("Health Color", Color3.fromRGB(0,255,0), getCallback("Enemy ESP%%Health Color"))
    enemyesp:AddToggle("Health Bar Outline", false, getCallback("Enemy ESP%%Health Bar Outline")):AddColorPicker("Health Outline Color", Color3.fromRGB(0,0,0), getCallback("Enemy ESP%%Health Outline Color"))
    enemyesp:AddToggle("Tracers", false, getCallback("Enemy ESP%%Tracers")):AddColorPicker("Tracer Color", Color3.fromRGB(0,255,255), getCallback("Enemy ESP%%Tracer Color"))
    enemyesp:AddSlider("Tracer Opacity", 100, 1, 100, 1, "%", getCallback("Enemy ESP%%Tracer Opacity"))
    --enemyesp:AddSlider("Tracers Thickness", 2, 1, 10, 1, " px", getCallback("Enemy ESP%%Tracers Thickness"))
    enemyesp:AddToggle("Tracer Outlines", false, getCallback("Enemy ESP%%Tracer Outlines")):AddColorPicker("Tracer Outline Color", Color3.fromRGB(0,0,0), getCallback("Enemy ESP%%Tracer Outline Color"))
    --enemyesp:AddSlider("Tracer Outlines Thickness", 4, 2, 10, 1, " px", getCallback("Enemy ESP%%Tracer Outlines Thickness"))
    enemyesp:AddSlider("Tracer Outlines Opacity", 100, 1, 100, 1, "%", getCallback("Enemy ESP%%Tracer Outlines Opacity"))
    enemyesp:AddDropdown("Tracer Origin", "Bottom", {"Middle", "Top", "Bottom"}, getCallback("Enemy ESP%%Tracer Origin"))
    --enemyesp:AddDropdown("Tracer Destination", "Bottom", {"Top", "Bottom"}, getCallback("Enemy ESP%%Tracer Destination"))
    enemyesp:AddToggle("Names", false, getCallback("Enemy ESP%%Names")):AddColorPicker("Names Color", Color3.fromRGB(255,255,255), getCallback("Enemy ESP%%Names Color"))
    enemyesp:AddToggle("Weapons", false, getCallback("Enemy ESP%%Weapons")):AddColorPicker("Weapons Color", Color3.fromRGB(255,255,255), getCallback("Enemy ESP%%Weapons Color"))
    enemyesp:AddToggle("Distances", false, getCallback("Enemy ESP%%Distances")):AddColorPicker("Distances Color", Color3.fromRGB(255,255,255), getCallback("Enemy ESP%%Distances Color"))
    enemyesp:AddToggle("Health Percents", false, getCallback("Enemy ESP%%Health Percents")):AddColorPicker("Health Number Color", Color3.fromRGB(255,255,255), getCallback("Enemy ESP%%Health Number Color"))
    --enemyesp:AddSlider("Text Size", 20, 5, 40, 1, " px", getCallback("Enemy ESP%%Text Size"))
    enemyesp:AddToggle("Text Outlines", true, getCallback("Enemy ESP%%Text Outlines")):AddColorPicker("Text Outline Color", Color3.fromRGB(0,0,0), getCallback("Enemy ESP%%Text Outline Color"))
    enemyesp:AddToggle("Highlight Chams", false, getCallback("Enemy ESP%%Highlight Chams")):AddColorPicker("Highlight Outline Color", Color3.fromRGB(0,0,0), getCallback("Enemy ESP%%Highlight Outline Color")):AddColorPicker("Highlight Fill Color", Color3.fromRGB(0,0,255), getCallback("Enemy ESP%%Highlight Fill Color"))
    enemyesp:AddSlider("Highlight Fill Transparency", 50, 0, 100, 1, "%", getCallback("Enemy ESP%%Highlight Fill Opacity"))
    enemyesp:AddSlider("Highlight Outline Transparency", 0, 0, 100, 1, "%", getCallback("Enemy ESP%%Highlight Outline Opacity"))
    enemyesp:AddToggle("Highlight Visible Check", false, getCallback("Enemy ESP%%Highlight Visible Check"))

    --[[teamesp:AddToggle("Enabled", true, getCallback("Team ESP%%Enabled")):AddKeyBind(nil, "Key Bind")
    teamesp:AddToggle("Boxes", false, getCallback("Team ESP%%Boxes")):AddColorPicker("Box Color", Color3.fromRGB(0,255,255), getCallback("Team ESP%%Box Color"))
    teamesp:AddSlider("Box Opacity", 100, 1, 100, 1, "%", getCallback("Team ESP%%Box Opacity"))
    --enemyesp:AddSlider("Box Thickness", 1, 1, 10, 1, " px", getCallback("Team ESP%%Box Thickness"))
    teamesp:AddToggle("Box Outlines", false, getCallback("Team ESP%%Box Outlines")):AddColorPicker("Box Outline Color", Color3.fromRGB(0,0,0), getCallback("Team ESP%%Box Outline Color"))
    teamesp:AddSlider("Box Outline Opacity", 100, 1, 100, 1, "%", getCallback("Team ESP%%Box Outline Opacity"))
    --enemyesp:AddSlider("Box Outline Thickness", 5, 2, 10, 1, " px", getCallback("Team ESP%%Box Outline Thickness"))
    teamesp:AddToggle("Fill Boxes", false, getCallback("Team ESP%%Fill Boxes")):AddColorPicker("Box Inside Color", Color3.fromRGB(0,255,255), getCallback("Team ESP%%Box Color"))
    teamesp:AddSlider("Box Inside Opacity", 100, 1, 100, 1, "%", getCallback("Team ESP%%Box Inside Opacity"))
    --enemyesp:AddDropdown("Box Type", "Square", {"Square", "Cube"}, getCallback("Team ESP%%Box Type"))
    teamesp:AddToggle("Health Bar", false, getCallback("Team ESP%%Health Bar")):AddColorPicker("Damage Color", Color3.fromRGB(255,0,0), getCallback("Team ESP%%Damage Color")):AddColorPicker("Health Color", Color3.fromRGB(0,255,0), getCallback("Team ESP%%Health Color"))
    teamesp:AddToggle("Health Bar Outline", false, getCallback("Team ESP%%Health Bar Outline")):AddColorPicker("Health Outline Color", Color3.fromRGB(0,0,0), getCallback("Team ESP%%Health Outline Color"))
    teamesp:AddToggle("Tracers", false, getCallback("Team ESP%%Tracers")):AddColorPicker("Tracer Color", Color3.fromRGB(0,255,255), getCallback("Team ESP%%Tracer Color"))
    teamesp:AddSlider("Tracer Opacity", 100, 1, 100, 1, "%", getCallback("Team ESP%%Tracer Opacity"))
    --enemyesp:AddSlider("Tracers Thickness", 2, 1, 10, 1, " px", getCallback("Team ESP%%Tracers Thickness"))
    teamesp:AddToggle("Tracer Outlines", false, getCallback("Team ESP%%Tracer Outlines")):AddColorPicker("Tracer Outline Color", Color3.fromRGB(0,0,0), getCallback("Team ESP%%Tracer Outline Color"))
    --enemyesp:AddSlider("Tracer Outlines Thickness", 4, 2, 10, 1, " px", getCallback("Team ESP%%Tracer Outlines Thickness"))
    teamesp:AddSlider("Tracer Outlines Opacity", 100, 1, 100, 1, "%", getCallback("Team ESP%%Tracer Outlines Opacity"))
    teamesp:AddDropdown("Tracer Origin", "Bottom", {"Middle", "Top", "Bottom"}, getCallback("Team ESP%%Tracer Origin"))
    --enemyesp:AddDropdown("Tracer Destination", "Bottom", {"Top", "Bottom"}, getCallback("Team ESP%%Tracer Destination"))
    teamesp:AddToggle("Names", false, getCallback("Team ESP%%Names")):AddColorPicker("Names Color", Color3.fromRGB(255,255,255), getCallback("Team ESP%%Names Color"))
    teamesp:AddToggle("Weapons", false, getCallback("Team ESP%%Weapons")):AddColorPicker("Weapons Color", Color3.fromRGB(255,255,255), getCallback("Team ESP%%Weapons Color"))
    teamesp:AddToggle("Distances", false, getCallback("Team ESP%%Distances")):AddColorPicker("Distances Color", Color3.fromRGB(255,255,255), getCallback("Team ESP%%Distances Color"))
    teamesp:AddToggle("Health Percents", false, getCallback("Team ESP%%Health Percents")):AddColorPicker("Health Number Color", Color3.fromRGB(255,255,255), getCallback("Team ESP%%Health Number Color"))
    --enemyesp:AddSlider("Text Size", 20, 5, 40, 1, " px", getCallback("Team ESP%%Text Size"))
    teamesp:AddToggle("Text Outlines", true, getCallback("Team ESP%%Text Outlines")):AddColorPicker("Text Outline Color", Color3.fromRGB(0,0,0), getCallback("Team ESP%%Text Outline Color"))
    teamesp:AddToggle("Highlight Chams", false, getCallback("Team ESP%%Highlight Chams")):AddColorPicker("Highlight Outline Color", Color3.fromRGB(0,0,0), getCallback("Team ESP%%Highlight Outline Color")):AddColorPicker("Highlight Fill Color", Color3.fromRGB(0,0,255), getCallback("Team ESP%%Highlight Fill Color"))
    teamesp:AddToggle("Highlight Visible Check", false, getCallback("Team ESP%%Highlight Visible Check"))
    teamesp:AddSlider("Highlight Fill Transparency", 50, 0, 100, 1, "%", getCallback("Team ESP%%Highlight Fill Transparency"))
    teamesp:AddSlider("Highlight Outline Transparency", 0, 0, 100, 1, "%", getCallback("Team ESP%%Highlight Outline Transparency"))]]

    chams:AddToggle("Arm Chams", false, getCallback("Chams%%Arm Chams")):AddColorPicker("Arm Color", Color3.new(0.1, 0.1, 1), getCallback("Chams%%Arm Color"))
    chams:AddSlider("Arm Transparency", 50, 0, 100, 1, "%", getCallback("Chams%%Arm Transparency"))
    chams:AddDropdown("Arm Material", "ForceField", {"ForceField", "SmoothPlastic", "Glass"}, getCallback("Chams%%Arm Material"))
    chams:AddToggle("Gun Chams", false, getCallback("Chams%%Gun Chams")):AddColorPicker("Gun Color", Color3.new(0.1, 0.1, 1), getCallback("Chams%%Gun Color"))
    chams:AddSlider("Gun Transparency", 50, 0, 100, 1, "%", getCallback("Chams%%Gun Transparency"))
    chams:AddDropdown("Gun Material", "ForceField", {"ForceField", "SmoothPlastic", "Glass"}, getCallback("Chams%%Gun Material"))

    morechams:AddToggle("Third Person Character Chams", false, getCallback("More Chams%%Third Person Character Chams")):AddColorPicker("Character Color", Color3.new(0.1, 0.1, 1), getCallback("More Chams%%Character Color"))
    morechams:AddSlider("Character Transparency", 50, 0, 100, 1, "%", getCallback("More Chams%%Character Transparency"))
    morechams:AddDropdown("Character Material", "ForceField", {"ForceField", "SmoothPlastic", "Glass"}, getCallback("More Chams%%Character Material"))

    worldvisuals:AddToggle("Ambient", false, getCallback("World Visuals%%Ambient")):AddKeyBind(nil, "Ambient Key Bind"):AddColorPicker("Ambient Color", Color3.new(0.1, 0.1, 1), getCallback("World Visuals%%Ambient Color"))
    worldvisuals:AddToggle("Bullet Tracers", false, getCallback("World Visuals%%Bullet Tracers")):AddKeyBind(nil, "Tracers Key Bind"):AddColorPicker("Color One", Color3.new(0.1, 0.1, 1), getCallback("World Visuals%%Color One")):AddColorPicker("Color Two", Color3.new(1, 0.9, 0.9), getCallback("World Visuals%%Color Two"))
    worldvisuals:AddSlider("Tracers Size", 0.1, 0.05, 3, 0.05, " Studs", getCallback("World Visuals%%Tracers Size"))
    worldvisuals:AddSlider("Tracers Transparency", 50, 0, 100, 1, "%", getCallback("World Visuals%%Tracers Transparency"))
    worldvisuals:AddDropdown("Tracers Material", "ForceField", {"ForceField", "SmoothPlastic", "Glass"}, getCallback("World Visuals%%Tracers Material"))
    worldvisuals:AddToggle("Impact Points", false, getCallback("World Visuals%%Impact Points")):AddKeyBind(nil, "Points Key Bind"):AddColorPicker("Points Color", Color3.new(0.1, 0.1, 1), getCallback("World Visuals%%Points Color"))
    worldvisuals:AddSlider("Points Transparency", 50, 0, 100, 1, "%", getCallback("World Visuals%%Points Transparency"))
    worldvisuals:AddDropdown("Points Material", "ForceField", {"ForceField", "SmoothPlastic", "Glass"}, getCallback("World Visuals%%Points Material"))
    worldvisuals:AddSlider("Duration", 4, 1, 5, 0.5, " Seconds", getCallback("World Visuals%%Duration"))

    thirdperson:AddToggle("Enabled", false, getCallback("Third Person%%Enabled")):AddKeyBind(nil, "Key Bind")
    thirdperson:AddToggle("Show Character", false, getCallback("Third Person%%Show Character"))
    thirdperson:AddToggle("Show Character While Aiming", false, getCallback("Third Person%%Show Character While Aiming"))
    thirdperson:AddSlider("Camera Offset X", 0, -20, 20, 1, " Studs", getCallback("Third Person%%Camera Offset X"))
    thirdperson:AddSlider("Camera Offset Y", 0, -20, 20, 1, " Studs", getCallback("Third Person%%Camera Offset Y"))
    thirdperson:AddSlider("Camera Offset Z", 7, -20, 20, 1, " Studs", getCallback("Third Person%%Camera Offset Z"))
    thirdperson:AddToggle("Camera Offset Always Visible", true, getCallback("Third Person%%Camera Offset Always Visible"))
    thirdperson:AddToggle("Apply Anti Aim To Character", true, getCallback("Third Person%%Apply Anti Aim To Character"))

    customChar:AddToggle("Custom Character Model", false, getCallback("Custom Model%%Custom Character Model")):AddKeyBind(nil, "Key Bind")
    customChar:AddTextBox("Asset ID", "ID", getCallback("Custom Model%%Asset ID"))
    customChar:AddSlider("Asset Offset X", 0, -10, 10, 0.2, " Studs", getCallback("Custom Model%%Asset Offset X"))
    customChar:AddSlider("Asset Offset Y", 0, -10, 10, 0.2, " Studs", getCallback("Custom Model%%Asset Offset Y"))
    customChar:AddSlider("Asset Offset Z", 0, -10, 10, 0.2, " Studs", getCallback("Custom Model%%Asset Offset Z"))

    crosshair:AddToggle("Enabled", false, getCallback("Crosshair%%Enabled")):AddKeyBind(nil, "Key Bind"):AddColorPicker("Crosshair Color", Color3.new(0.1, 0.1, 1), getCallback("Crosshair%%Crosshair Color"))
    crosshair:AddToggle("Show Dot", false, getCallback("Crosshair%%Show Dot"))
    crosshair:AddToggle("Follow Recoil", false, getCallback("Crosshair%%Follow Recoil"))
    crosshair:AddSlider("X Size", 10, 1, 50, 1, " px", getCallback("Crosshair%%X Size"))
    crosshair:AddSlider("Y Size", 10, 1, 50, 1, " px", getCallback("Crosshair%%Y Size"))
    crosshair:AddSlider("X Space", 10, 1, 50, 1, " px", getCallback("Crosshair%%X Space"))
    crosshair:AddSlider("Y Space", 10, 1, 50, 1, " px", getCallback("Crosshair%%Y Space"))
    crosshair:AddSlider("Spin Speed", 0, 0, 3, 0.05, " Spins/Second", getCallback("Crosshair%%Spin Speed"))
    crosshair:AddToggle("Rainbow Crosshair", false, getCallback("Crosshair%%Rainbow Crosshair"))
    crosshair:AddSlider("Rainbow Speed", 0.5, 0, 3, 0.05, " Rainbows/Second", getCallback("Crosshair%%Rainbow Speed"))

    movement:AddToggle("Walk Speed", false, getCallback("Movement%%Walk Speed")):AddKeyBind(nil, "Walk Bind")
    movement:AddSlider("Set Speed", 50, 10, 250, 1, " Studs/Second", getCallback("Movement%%Set Speed"))
    movement:AddToggle("Jump Power", false, getCallback("Movement%%Jump Power")):AddKeyBind(nil, "Jump Bind")
    movement:AddSlider("Height Addition", 10, 1, 15, 1, " Studs", getCallback("Movement%%Height Addition"))
    movement:AddToggle("No Fall Damage", false, getCallback("Movement%%No Fall Damage"))
    movement:AddToggle("Bunny Hop", false, getCallback("Movement%%Bunny Hop")):AddKeyBind(nil, "BHop Bind")
    movement:AddToggle("Only While Jumping", true, getCallback("Movement%%Only While Jumping"))
    --movement:AddToggle("Fly", false, getCallback("Movement%%Fly")):AddKeyBind(nil, "Fly Bind")
    --movement:AddSlider("Fly Speed", 50, 10, 250, 1, " Studs/Second", getCallback("Movement%%Fly Speed"))
    --movement:AddToggle("Noclip", false, getCallback("Movement%%Noclip")):AddKeyBind(nil, "Noclip Bind")

    sounds:AddDropdown("Shoot Sound", "None", soundFileList, getCallback("Sounds%%Shoot Sound"))
    sounds:AddDropdown("Hit Sound", "None", soundFileList, getCallback("Sounds%%Hit Sound"))
    sounds:AddDropdown("Kill Sound", "None", soundFileList, getCallback("Sounds%%Kill Sound"))
    sounds:AddDropdown("Got Hit Sound", "None", soundFileList, getCallback("Sounds%%Got Hit Sound"))
    sounds:AddDropdown("Glass Breaking Sound", "None", soundFileList, getCallback("Sounds%%Glass Breaking Sound"))
    sounds:AddDropdown("Footstep Sound", "None", soundFileList, getCallback("Sounds%%Footstep Sound"))

    tweaks:AddToggle("Custom Kill Notification", false, getCallback("Tweaks%%Custom Kill Notification"))
    tweaks:AddTextBox("Notification Text", "Furry Killed!", getCallback("Tweaks%%Notification Text"))
    tweaks:AddButton("Unlock All Attachments", getCallback("Tweaks%%Unlock All Attachments"))
    tweaks:AddButton("Unlock All Knives", getCallback("Tweaks%%Unlock All Knives"))
    tweaks:AddButton("Unlock All Camos", getCallback("Tweaks%%Unlock All Camos"))
    tweaks:AddButton("Unlock All", getCallback("Tweaks%%Unlock All"))

    antivotekick:AddButton("Initiate Multi-Instance Anti Votekick", function()
        writefile(folderName .. "/cache/votekick data/" .. fileName, userName)
    end)

    antivotekick:AddButton("Copy YouTube Tutorial Link", function()
        setclipboard("https://youtu.be/dvyiz8iVe5g")
    end)

    chatspam:AddToggle("Enabled", false, getCallback("Chat Spam%%Enabled")):AddKeyBind(nil, "Key Bind")
    chatspam:AddDropdown("Spam List", "default.txt", chatListsFiles, getCallback("Chat Spam%%Spam List"))
    chatspam:AddSlider("Spam Delay", 2.51, 2.51, 5, 0.01, " Seconds", getCallback("Chat Spam%%Spam Delay"))
    --chatspam:AddToggle("Team Chat", false, getCallback("Chat Spam%%Team Chat"))

    --hopper:AddToggle("Server Hop On Votekick", false, getCallback("Server Hopper%%Server Hop On Votekick"))
    hopper:AddButton("Server Hop", getCallback("Server Hopper%%Server Hop"))
    hopper:AddButton("Rejoin", getCallback("Server Hopper%%Rejoin"))
    hopper:AddButton("Copy Join Script", getCallback("Server Hopper%%Copy Join Script"))
    hopper:AddButton("Clear Cached Servers", getCallback("Server Hopper%%Clear Cached Servers"))

    settings:CreatePlayerList({"Friendly", "Target"}, {
        status = function(player, status)
            playerStatus[player] = status
        end,
        votekick = function(player)
        end,
        spectate = function(player)
        end
    })

    local cheatSettings = settings:CreateSection("Cheat Settings", false, "third")
    local configuration = settings:CreateSection("Configuration", true, "third")

    cheatSettings:AddToggle("Save Last Config", true, getCallback("Cheat Settings%%Save Last Config"))
    cheatSettings:AddToggle("Show Keybind List", false, getCallback("Cheat Settings%%Show Keybind List"))
    cheatSettings:AddToggle("Show Key Name", false, getCallback("Cheat Settings%%Show Key Name"))
    cheatSettings:AddButton("Copy Discord Invite", function()
        setclipboard("https://discord.gg/tUEJZYvF9d") -- pro
    end)
    cheatSettings:AddButton("Unload", function()
        unloadMain()
        stillGoing = false

        for _, drawingFolder in game:GetService("CoreGui"):GetChildren() do
            if drawingFolder.Name == "Drawing API By iRay" then
                drawingFolder:Destroy()
            end
        end

        for _, connection in connectionList do
            pcall(function()
                connection:Disconnect()
            end)
        end
    end)

    local configList = configuration:AddDropdown("Config List", "Config", getConfigNames(), getCallback("Configuration%%Config List"))
    configuration:AddButton("Load Config", getCallback("Configuration%%Load Config"))
    configuration:AddButton("Update Config List", getCallback("Configuration%%Update Config List"))
    configuration:AddTextBox("Config Name", "New Config", getCallback("Configuration%%Config Name"))
    configuration:AddButton("Save Config", getCallback("Configuration%%Save Config"))

    callbackList["Cheat Settings%%Show Keybind List"] = function(bool)
        if bool then
            task.delay(0.05, function()
                menu:CreateKeyList(menu:GetValue("Cheat Settings", "Show Key Name"))
            end)
        elseif menu.DestroyKeyList then
            menu:DestroyKeyList()
        end
    end

    callbackList["Cheat Settings%%Show Key Name"] = function(bool)
        if menu:GetValue("Cheat Settings", "Show Keybind List") then
            callbackList["Cheat Settings%%Show Keybind List"](false)
            callbackList["Cheat Settings%%Show Keybind List"](true)
        end
    end

    callbackList["Configuration%%Load Config"] = function()
        local fileName = menu:GetValue("Configuration", "Config List")

        if fileName and isfile(folderName .. "/configs/" .. fileName .. ".json") then
            loadConfig(httpService:JSONDecode(readfile(folderName .. "/configs/" .. fileName .. ".json")))
            menu:SetValue("Configuration", "Config Name", fileName)
        end
    end

    callbackList["Configuration%%Update Config List"] = function()
        configList.options = getConfigNames()
    end

    callbackList["Configuration%%Save Config"] = function()
        saveConfig(folderName .. "/configs/" .. menu:GetValue("Configuration", "Config Name") .. ".json", getConfig())
    end

    if configExists then
        local config = httpService:JSONDecode(readfile(folderName .. "/cache/lastfile.json"))

        if config["Cheat Settings%%Save Last Config"] ~= false then
            loadConfig(config)
        end

        local keybinds = config["Keybinds"]

        if keybinds then
            for _, data in keybinds do
                local name, key = table.unpack(data)
                local section, element = table.unpack(string.split(name, "%%"))
                menu.sectionIndexes[section].flags[element].keybind:SetValue(key)
            end
        end
    end
end)()
