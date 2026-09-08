local __DARKLUA_BUNDLE_MODULES = {cache = {}}

do
    do
        local __modImpl = function()
            local Players = cloneref(game:GetService('Players'))
            local games = {
                [6701277882] = {
                    FFA = false,
                    Freemium = false,
                    Unloadable = false,
                    Url = 
[[https://api.luarmor.net/files/v3/loaders/b51589a899a693b4da98f86bbfb79c23.lua]],
                },
            }
            local gameData = games[game.GameId]

            if gameData == nil then
                Players.LocalPlayer:Kick('This game is not supported!')
            end

            return gameData
        end

        function __DARKLUA_BUNDLE_MODULES.a()
            local v = __DARKLUA_BUNDLE_MODULES.cache.a

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.a = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local gameData = __DARKLUA_BUNDLE_MODULES.a()
            local lrmApi = ((loadstring(game:HttpGet('https://sdkapi-public.luarmor.net/library.lua'))))()

            lrmApi.script_id = gameData.Url:split('/')[7]:sub(1, -5)

            local ERROR_MAP = {
                ['KEY_VALID'] = 'Valid key!',
                ['KEY_EXPIRED'] = 'Key expired!',
                ['KEY_BANNED'] = 'Key is banned!',
                ['KEY_HWID_LOCKED'] = 'Reset your HWID in our server!',
                ['KEY_INCORRECT'] = 'Key is wrong or deleted!',
                ['KEY_INVALID'] = 'Key is in an invalid format!',
                ['SCRIPT_ID_INCORRECT'] = 'Incorrect script id!',
                ['SCRIPT_ID_INVALID'] = 'Invalid script id!',
                ['INVALID_EXECUTOR'] = 'Executor not supported!',
                ['SECURITY_ERROR'] = 'Cloudflare error!',
                ['TIME_ERROR'] = 'Request took too long!',
                ['UNKNOWN_ERROR'] = 'Unknown server error!',
            }
            local GetApiError = function(code)
                return ERROR_MAP[code] or 'Key check failed: ' .. code
            end
            local SetScriptId = function(scriptId)
                lrmApi.script_id = scriptId
            end

            return {
                GetApiError = GetApiError,
                SetScriptId = SetScriptId,
                CheckKey = function(key)
                    return (lrmApi.check_key(key))
                end,
                LoadScript = function()
                    return lrmApi.load_script()
                end,
                PurgeCache = function()
                    return lrmApi.purge_cache()
                end,
            }
        end

        function __DARKLUA_BUNDLE_MODULES.b()
            local v = __DARKLUA_BUNDLE_MODULES.cache.b

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.b = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local RunService = game:GetService('RunService')
            local FN_MARKER = newproxy()
            local THREAD_MARKER = newproxy()
            local GENERIC_OBJECT_CLEANUP_METHODS = table.freeze({
                'Destroy',
                'Disconnect',
                'destroy',
                'disconnect',
            })
            local getObjectCleanupFunction = function(object, cleanupMethod)
                local t = typeof(object)

                if t == 'function' then
                    return FN_MARKER
                elseif t == 'thread' then
                    return THREAD_MARKER
                end
                if cleanupMethod then
                    return cleanupMethod
                end
                if t == 'Instance' then
                    return 'Destroy'
                elseif t == 'RBXScriptConnection' then
                    return 'Disconnect'
                elseif t == 'table' then
                    for _, genericCleanupMethod in GENERIC_OBJECT_CLEANUP_METHODS do
                        if typeof(object[genericCleanupMethod]) == 'function' then
                            return genericCleanupMethod
                        end
                    end
                end

                error(string.format('failed to get cleanup function for object %s: %s', tostring(t), tostring(object)), 3)
            end
            local assertPromiseLike = function(object)
                if typeof(object) ~= 'table' or typeof(object.getStatus) ~= 'function' or typeof(object.finally) ~= 'function' or typeof(object.cancel) ~= 'function' then
                    error('did not receive a promise as an argument', 3)
                end
            end
            local assertSignalLike = function(object)
                if typeof(object) ~= 'RBXScriptSignal' and (typeof(object) ~= 'table' or typeof(object.Connect) ~= 'function' or typeof(object.Once) ~= 'function') then
                    error('did not receive a signal as an argument', 3)
                end
            end
            local Trove = {}

            Trove.__index = Trove

            function Trove.new()
                local self = setmetatable({}, Trove)

                self._objects = {}
                self._cleaning = false

                return (self)
            end
            function Trove.Add(self, object, cleanupMethod)
                if self._cleaning then
                    error('cannot call trove:Add() while cleaning', 2)
                end

                local cleanup = getObjectCleanupFunction(object, cleanupMethod)

                table.insert(self._objects, {object, cleanup})

                return object
            end
            function Trove.Clone(self, instance)
                if self._cleaning then
                    error('cannot call trove:Clone() while cleaning', 2)
                end

                return self:Add(instance:Clone())
            end
            function Trove.Construct(self, class, ...)
                if self._cleaning then
                    error('Cannot call trove:Construct() while cleaning', 2)
                end

                local object = nil
                local t = type(class)

                if t == 'table' then
                    object = (class).new(...)
                elseif t == 'function' then
                    object = (class)(...)
                end

                return self:Add(object)
            end
            function Trove.Connect(self, signal, fn)
                if self._cleaning then
                    error('Cannot call trove:Connect() while cleaning', 2)
                end

                assertSignalLike(signal)

                local confirmedSignal = signal

                return self:Add(confirmedSignal:Connect(fn))
            end
            function Trove.Once(self, signal, fn)
                if self._cleaning then
                    error('Cannot call trove:Connect() while cleaning', 2)
                end

                assertSignalLike(signal)

                local confirmedSignal = signal
                local conn

                conn = confirmedSignal:Once(function(...)
                    fn(...)
                    self:Pop(conn)
                end)

                return self:Add(conn)
            end
            function Trove.BindToRenderStep(self, name, priority, fn)
                if self._cleaning then
                    error('cannot call trove:BindToRenderStep() while cleaning', 2)
                end

                RunService:BindToRenderStep(name, priority, fn)
                self:Add(function()
                    RunService:UnbindFromRenderStep(name)
                end)
            end
            function Trove.AddPromise(self, promise)
                if self._cleaning then
                    error('cannot call trove:AddPromise() while cleaning', 2)
                end

                assertPromiseLike(promise)

                local confirmedPromise = promise

                if confirmedPromise:getStatus() == 'Started' then
                    confirmedPromise:finally(function()
                        if self._cleaning then
                            return
                        end

                        self:_findAndRemoveFromObjects(confirmedPromise, false)
                    end)
                    self:Add(confirmedPromise, 'cancel')
                end

                return confirmedPromise
            end
            function Trove.Remove(self, object)
                if self._cleaning then
                    error('cannot call trove:Remove() while cleaning', 2)
                end

                return self:_findAndRemoveFromObjects(object, true)
            end
            function Trove.Pop(self, object)
                if self._cleaning then
                    error('cannot call trove:Pop() while cleaning', 2)
                end

                return self:_findAndRemoveFromObjects(object, false)
            end
            function Trove.Extend(self)
                if self._cleaning then
                    error('cannot call trove:Extend() while cleaning', 2)
                end

                return self:Construct(Trove)
            end
            function Trove.Clean(self)
                if self._cleaning then
                    return
                end

                self._cleaning = true

                for _, obj in self._objects do
                    self:_cleanupObject(obj[1], obj[2])
                end

                table.clear(self._objects)

                self._cleaning = false
            end
            function Trove.WrapClean(self)
                return function()
                    self:Clean()
                end
            end
            function Trove._findAndRemoveFromObjects(self, object, cleanup)
                local objects = self._objects

                for i, obj in objects do
                    if obj[1] == object then
                        local n = #objects

                        objects[i] = objects[n]
                        objects[n] = nil

                        if cleanup then
                            self:_cleanupObject(obj[1], obj[2])
                        end

                        return true
                    end
                end

                return false
            end
            function Trove._cleanupObject(_self, object, cleanupMethod)
                if cleanupMethod == FN_MARKER then
                    task.spawn(object)
                elseif cleanupMethod == THREAD_MARKER then
                    pcall(task.cancel, object)
                else
                    object[cleanupMethod](object)
                end
            end
            function Trove.AttachToInstance(self, instance)
                if self._cleaning then
                    error('cannot call trove:AttachToInstance() while cleaning', 2)
                elseif not instance:IsDescendantOf(game) then
                    error('instance is not a descendant of the game hierarchy', 2)
                end

                return self:Connect(instance.Destroying, function()
                    self:Destroy()
                end)
            end
            function Trove.Destroy(self)
                self:Clean()
            end

            return {
                new = Trove.new,
            }
        end

        function __DARKLUA_BUNDLE_MODULES.c()
            local v = __DARKLUA_BUNDLE_MODULES.cache.c

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.c = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local module = __DARKLUA_BUNDLE_MODULES.c()

            return module
        end

        function __DARKLUA_BUNDLE_MODULES.d()
            local v = __DARKLUA_BUNDLE_MODULES.cache.d

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.d = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local UserInputService = cloneref(game:GetService('UserInputService'))
            local Draggable = {}

            Draggable.__index = Draggable

            function Draggable.new(draggableObject, container)
                local self = {
                    _trove = Trove.new(),
                    _draggable = draggableObject,
                    _container = container,
                }

                self = setmetatable(self, Draggable)

                self:Initialise()

                return self
            end
            function Draggable.Destroy(self)
                self._trove:Destroy()
            end
            function Draggable.Initialise(self)
                local dragging = false
                local dragInput
                local mousePos
                local framePos

                self._trove:Connect(self._draggable.InputBegan, function(input)
                    if input.UserInputType ~= Enum.UserInputType.MouseButton1 then
                        return
                    end

                    dragging = true
                    mousePos = input.Position
                    framePos = self._container.Position

                    self._trove:Connect(input.Changed, function()
                        if input.UserInputState == Enum.UserInputState.End then
                            dragging = false
                        end
                    end)
                end)
                self._trove:Connect(self._draggable.InputChanged, function(
                    input
                )
                    if input.UserInputType == Enum.UserInputType.MouseMovement then
                        dragInput = input
                    end
                end)
                self._trove:Connect(UserInputService.InputChanged, function(
                    input
                )
                    if input == dragInput and dragging then
                        local delta = input.Position - mousePos

                        self._container.Position = framePos + UDim2.fromOffset(delta.X, delta.Y)
                    end
                end)
            end

            return Draggable
        end

        function __DARKLUA_BUNDLE_MODULES.e()
            local v = __DARKLUA_BUNDLE_MODULES.cache.e

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.e = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local LibraryData = {
                ACCENT_COLOUR = Color3.fromRGB(128, 213, 247),
            }

            return LibraryData
        end

        function __DARKLUA_BUNDLE_MODULES.f()
            local v = __DARKLUA_BUNDLE_MODULES.cache.f

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.f = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local LibraryData = __DARKLUA_BUNDLE_MODULES.f()
            local Button = {}

            Button.__index = Button

            function Button.new(container, text, callback)
                local ButtonElement = Button.InitialiseElements(container, text)
                local self = {
                    _trove = Trove.new(),
                    _callback = callback,
                    button = ButtonElement,
                }

                self = setmetatable(self, Button)

                self:InitialiseConnections(ButtonElement)

                return self
            end
            function Button.Destroy(self)
                self._trove:Destroy()
            end
            function Button.InitialiseElements(container, text)
                local ButtonElement = Instance.new('TextButton')
                local ButtonOutline1 = Instance.new('ImageLabel')
                local ButtonOutline2 = Instance.new('ImageLabel')

                ButtonElement.Name = 'Button'
                ButtonElement.Parent = container
                ButtonElement.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                ButtonElement.BorderColor3 = LibraryData.ACCENT_COLOUR
                ButtonElement.BorderSizePixel = 0
                ButtonElement.Size = UDim2.new(1, 0, 0, 20)
                ButtonElement.AutoButtonColor = false
                ButtonElement.Font = Enum.Font.Code
                ButtonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
                ButtonElement.TextSize = 14
                ButtonElement.Text = text
                ButtonOutline1.Name = 'ButtonOutline1'
                ButtonOutline1.Parent = ButtonElement
                ButtonOutline1.BackgroundTransparency = 1
                ButtonOutline1.Size = UDim2.fromScale(1, 1)
                ButtonOutline1.Image = 'rbxassetid://2592362371'
                ButtonOutline1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                ButtonOutline1.ScaleType = Enum.ScaleType.Slice
                ButtonOutline1.SliceCenter = Rect.new(2, 2, 62, 62)
                ButtonOutline2.Name = 'ButtonOutline2'
                ButtonOutline2.Parent = ButtonElement
                ButtonOutline2.BackgroundTransparency = 1
                ButtonOutline2.Position = UDim2.fromOffset(1, 1)
                ButtonOutline2.Size = UDim2.new(1, -2, 1, -2)
                ButtonOutline2.Image = 'rbxassetid://2592362371'
                ButtonOutline2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                ButtonOutline2.ScaleType = Enum.ScaleType.Slice
                ButtonOutline2.SliceCenter = Rect.new(2, 2, 62, 62)

                return ButtonElement
            end
            function Button.InitialiseConnections(self, ButtonElement)
                self._trove:Connect(ButtonElement.MouseButton1Click, function()
                    pcall(self._callback)
                end)
                self._trove:Connect(ButtonElement.MouseLeave, function()
                    Button.BorderSizePixel = 0
                end)
                self._trove:Connect(ButtonElement.MouseEnter, function()
                    Button.BorderSizePixel = 1
                end)
            end

            return Button
        end

        function __DARKLUA_BUNDLE_MODULES.g()
            local v = __DARKLUA_BUNDLE_MODULES.cache.g

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.g = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local LibraryData = __DARKLUA_BUNDLE_MODULES.f()
            local Toggle = {}

            Toggle.__index = Toggle

            function Toggle.new(container, text, def, callback)
                local root, frame, title = Toggle.InitialiseElements(container, text)
                local self = {
                    _trove = Trove.new(),
                    _callback = callback,
                    _toggled = def == true,
                    root = root,
                    frame = frame,
                    title = title,
                }

                self = setmetatable(self, Toggle)

                self:InitialiseConnections()
                self:Set(self._toggled)

                return self
            end
            function Toggle.Destroy(self)
                self._trove:Destroy()
            end
            function Toggle.InitialiseElements(container, text)
                local ToggleElement = Instance.new('TextButton')
                local ToggleFrame = Instance.new('Frame')
                local ToggleOutline1 = Instance.new('ImageLabel')
                local ToggleOutline2 = Instance.new('ImageLabel')
                local ToggleTitle = Instance.new('TextLabel')

                ToggleElement.Name = text
                ToggleElement.Parent = container
                ToggleElement.BackgroundTransparency = 1
                ToggleElement.Size = UDim2.new(1, 0, 0, 22)
                ToggleElement.AutoButtonColor = false
                ToggleElement.Text = ''
                ToggleFrame.Name = 'ToggleFrame'
                ToggleFrame.Parent = ToggleElement
                ToggleFrame.AnchorPoint = Vector2.new(0, 0.5)
                ToggleFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                ToggleFrame.BorderColor3 = LibraryData.ACCENT_COLOUR
                ToggleFrame.BorderSizePixel = 0
                ToggleFrame.Position = UDim2.fromScale(0, 0.5)
                ToggleFrame.Size = UDim2.fromOffset(14, 14)
                ToggleOutline1.Name = 'ToggleOutline1'
                ToggleOutline1.Parent = ToggleFrame
                ToggleOutline1.BackgroundTransparency = 1
                ToggleOutline1.Size = UDim2.fromScale(1, 1)
                ToggleOutline1.Image = 'rbxassetid://2592362371'
                ToggleOutline1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                ToggleOutline1.ScaleType = Enum.ScaleType.Slice
                ToggleOutline1.SliceCenter = Rect.new(2, 2, 62, 62)
                ToggleOutline2.Name = 'ToggleOutline2'
                ToggleOutline2.Parent = ToggleFrame
                ToggleOutline2.BackgroundTransparency = 1
                ToggleOutline2.Position = UDim2.fromOffset(1, 1)
                ToggleOutline2.Size = UDim2.new(1, -2, 1, -2)
                ToggleOutline2.Image = 'rbxassetid://2592362371'
                ToggleOutline2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                ToggleOutline2.ScaleType = Enum.ScaleType.Slice
                ToggleOutline2.SliceCenter = Rect.new(2, 2, 62, 62)
                ToggleTitle.Name = 'ToggleTitle'
                ToggleTitle.Parent = ToggleElement
                ToggleTitle.BackgroundTransparency = 1
                ToggleTitle.Position = UDim2.fromOffset(19, 0)
                ToggleTitle.Size = UDim2.fromScale(0, 1)
                ToggleTitle.Font = Enum.Font.Code
                ToggleTitle.Text = text
                ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                ToggleTitle.TextSize = 14
                ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
                ToggleTitle.TextTransparency = 0.4

                return ToggleElement, ToggleFrame, ToggleTitle
            end
            function Toggle.InitialiseConnections(self)
                self._trove:Connect(self.root.MouseEnter, function()
                    self.frame.BorderSizePixel = 1
                end)
                self._trove:Connect(self.root.MouseLeave, function()
                    self.frame.BorderSizePixel = 0
                end)
                self._trove:Connect(self.root.MouseButton1Click, function()
                    self:Set(not self._toggled)
                    pcall(self._callback, self._toggled)
                end)
            end
            function Toggle.Set(self, on)
                self._toggled = on == true

                if self._toggled then
                    self.frame.BackgroundColor3 = LibraryData.ACCENT_COLOUR
                    self.title.TextTransparency = 0
                else
                    self.frame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                    self.title.TextTransparency = 0.4
                end
            end
            function Toggle.Get(self)
                return self._toggled
            end

            return Toggle
        end

        function __DARKLUA_BUNDLE_MODULES.h()
            local v = __DARKLUA_BUNDLE_MODULES.cache.h

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.h = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local LibraryData = __DARKLUA_BUNDLE_MODULES.f()
            local UserInputService = cloneref(game:GetService('UserInputService'))
            local Slider = {}

            Slider.__index = Slider

            function Slider.new(container, text, settings, callback)
                local bar, fill, valueLabel = Slider.InitialiseElements(container, text, settings)
                local default = settings.default or settings.min
                local self = {
                    _trove = Trove.new(),
                    _callback = callback,
                    _dragging = false,
                    _settings = settings,
                    _value = default,
                    bar = bar,
                    fill = fill,
                    valueLabel = valueLabel,
                }

                self = setmetatable(self, Slider)

                self:InitialiseConnections()
                self:Set(default)

                return self
            end
            function Slider.Destroy(self)
                self._trove:Destroy()
            end
            function Slider.InitialiseElements(container, text, settings)
                local SliderElement = Instance.new('Frame')
                local SliderTitle = Instance.new('TextLabel')
                local SliderFrame = Instance.new('Frame')
                local SliderCurrentFrame = Instance.new('Frame')
                local SliderOutline1 = Instance.new('ImageLabel')
                local SliderOutline2 = Instance.new('ImageLabel')
                local SliderVal = Instance.new('TextLabel')

                SliderElement.Name = 'Slider'
                SliderElement.Parent = container
                SliderElement.BackgroundTransparency = 1
                SliderElement.Size = UDim2.new(1, 0, 0, 37)
                SliderTitle.Name = 'SliderTitle'
                SliderTitle.Parent = SliderElement
                SliderTitle.BackgroundTransparency = 1
                SliderTitle.Size = UDim2.fromOffset(0, 13)
                SliderTitle.Font = Enum.Font.Code
                SliderTitle.Text = text
                SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SliderTitle.TextSize = 14
                SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
                SliderFrame.Name = 'SliderFrame'
                SliderFrame.Parent = SliderElement
                SliderFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                SliderFrame.BorderSizePixel = 0
                SliderFrame.Position = UDim2.new(0, 0, 1, -20)
                SliderFrame.Size = UDim2.new(1, 0, 0, 20)
                SliderCurrentFrame.Name = 'SliderCurrentFrame'
                SliderCurrentFrame.Parent = SliderFrame
                SliderCurrentFrame.BackgroundColor3 = LibraryData.ACCENT_COLOUR
                SliderCurrentFrame.BorderSizePixel = 0
                SliderCurrentFrame.Size = UDim2.fromScale(0, 1)
                SliderOutline1.Name = 'SliderOutline1'
                SliderOutline1.Parent = SliderFrame
                SliderOutline1.BackgroundTransparency = 1
                SliderOutline1.Size = UDim2.fromScale(1, 1)
                SliderOutline1.Image = 'rbxassetid://2592362371'
                SliderOutline1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                SliderOutline1.ScaleType = Enum.ScaleType.Slice
                SliderOutline1.SliceCenter = Rect.new(2, 2, 62, 62)
                SliderOutline2.Name = 'SliderOutline2'
                SliderOutline2.Parent = SliderFrame
                SliderOutline2.BackgroundTransparency = 1
                SliderOutline2.Position = UDim2.fromOffset(1, 1)
                SliderOutline2.Size = UDim2.new(1, -2, 1, -2)
                SliderOutline2.Image = 'rbxassetid://2592362371'
                SliderOutline2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                SliderOutline2.ScaleType = Enum.ScaleType.Slice
                SliderOutline2.SliceCenter = Rect.new(2, 2, 62, 62)
                SliderVal.Name = 'SliderVal'
                SliderVal.Parent = SliderElement
                SliderVal.BackgroundTransparency = 1
                SliderVal.Position = UDim2.new(1, -40, 0, 0)
                SliderVal.Size = UDim2.fromOffset(40, 13)
                SliderVal.Font = Enum.Font.Code
                SliderVal.TextColor3 = Color3.fromRGB(200, 200, 200)
                SliderVal.TextSize = 14
                SliderVal.TextXAlignment = Enum.TextXAlignment.Right

                return SliderFrame, SliderCurrentFrame, SliderVal
            end

            local clampToStep = function(value, step)
                if not step or step <= 0 then
                    return value
                end

                return math.floor(value / step + 0.5) * step
            end

            function Slider.InitialiseConnections(self)
                self._trove:Connect(self.bar.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        self._dragging = true
                    end
                end)
                self._trove:Connect(self.bar.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        self._dragging = false
                    end
                end)
                self._trove:Connect(UserInputService.InputChanged, function(
                    input
                )
                    if self._dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local absPos = self.bar.AbsolutePosition
                        local absSize = self.bar.AbsoluteSize
                        local mouseX = input.Position.X
                        local rel = math.clamp((mouseX - absPos.X) / absSize.X, 0, 1)
                        local min, max = self._settings.min, self._settings.max
                        local raw = min + rel * (max - min)
                        local stepped = clampToStep(raw, self._settings.step)

                        self:Set(stepped)
                        pcall(self._callback, self._value)
                    end
                end)
            end
            function Slider.Set(self, value)
                local min, max = self._settings.min, self._settings.max
                local v = math.clamp(value, min, max)

                self._value = v

                local rel = (v - min) / (max - min)

                self.fill.Size = UDim2.fromScale(rel, 1)
                self.valueLabel.Text = tostring(math.floor(v + 0.5))
            end
            function Slider.Get(self)
                return self._value
            end

            return Slider
        end

        function __DARKLUA_BUNDLE_MODULES.i()
            local v = __DARKLUA_BUNDLE_MODULES.cache.i

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.i = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local Dropdown = {}

            Dropdown.__index = Dropdown

            function Dropdown.new(container, text, items, selected, callback)
                local header, selectedLabel, listFrame = Dropdown.InitialiseElements(container, text)
                local self = {
                    _trove = Trove.new(),
                    _callback = callback,
                    _open = false,
                    _items = table.clone(items or {}),
                    _selected = selected,
                    header = header,
                    selectedLabel = selectedLabel,
                    listFrame = listFrame,
                }

                self = setmetatable(self, Dropdown)

                self:InitialiseConnections()
                self:SetItems(self._items)

                if selected then
                    self:Select(selected)
                end

                return self
            end
            function Dropdown.Destroy(self)
                self._trove:Destroy()
            end
            function Dropdown.InitialiseElements(container, text)
                local Root = Instance.new('Frame')

                Root.Name = 'Dropdown'
                Root.Parent = container
                Root.BackgroundTransparency = 1
                Root.Size = UDim2.new(1, 0, 0, 24)

                local Header = Instance.new('TextButton')

                Header.Name = 'Header'
                Header.Parent = Root
                Header.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                Header.Size = UDim2.new(1, 0, 0, 20)
                Header.AutoButtonColor = false
                Header.Font = Enum.Font.Code
                Header.Text = ''

                local Outline1 = Instance.new('ImageLabel')

                Outline1.Parent = Header
                Outline1.BackgroundTransparency = 1
                Outline1.Size = UDim2.fromScale(1, 1)
                Outline1.Image = 'rbxassetid://2592362371'
                Outline1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                Outline1.ScaleType = Enum.ScaleType.Slice
                Outline1.SliceCenter = Rect.new(2, 2, 62, 62)

                local Outline2 = Instance.new('ImageLabel')

                Outline2.Parent = Header
                Outline2.BackgroundTransparency = 1
                Outline2.Position = UDim2.fromOffset(1, 1)
                Outline2.Size = UDim2.new(1, -2, 1, -2)
                Outline2.Image = 'rbxassetid://2592362371'
                Outline2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                Outline2.ScaleType = Enum.ScaleType.Slice
                Outline2.SliceCenter = Rect.new(2, 2, 62, 62)

                local Title = Instance.new('TextLabel')

                Title.Name = 'Title'
                Title.Parent = Header
                Title.BackgroundTransparency = 1
                Title.Position = UDim2.fromOffset(6, 0)
                Title.Size = UDim2.fromScale(0, 1)
                Title.Font = Enum.Font.Code
                Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title.TextSize = 14
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.Text = text

                local Selected = Instance.new('TextLabel')

                Selected.Name = 'Selected'
                Selected.Parent = Header
                Selected.BackgroundTransparency = 1
                Selected.Position = UDim2.new(1, -6, 0, 0)
                Selected.Size = UDim2.fromScale(0, 1)
                Selected.Font = Enum.Font.Code
                Selected.TextColor3 = Color3.fromRGB(200, 200, 200)
                Selected.TextSize = 14
                Selected.TextXAlignment = Enum.TextXAlignment.Right

                local ListFrame = Instance.new('Frame')

                ListFrame.Name = 'List'
                ListFrame.Parent = Root
                ListFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                ListFrame.BorderSizePixel = 0
                ListFrame.Position = UDim2.fromOffset(0, 24)
                ListFrame.Size = UDim2.fromScale(1, 0)
                ListFrame.Visible = false

                local UIL = Instance.new('UIListLayout')

                UIL.Parent = ListFrame
                UIL.FillDirection = Enum.FillDirection.Vertical
                UIL.SortOrder = Enum.SortOrder.LayoutOrder
                UIL.Padding = UDim.new(0, 2)

                return Header, Selected, ListFrame
            end

            local createItem = function(self, text)
                local Item = Instance.new('TextButton')

                Item.Name = text
                Item.Parent = self.listFrame
                Item.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Item.AutoButtonColor = false
                Item.Size = UDim2.new(1, 0, 0, 20)
                Item.Font = Enum.Font.Code
                Item.TextColor3 = Color3.fromRGB(255, 255, 255)
                Item.TextSize = 14
                Item.TextXAlignment = Enum.TextXAlignment.Left
                Item.Text = text

                self._trove:Connect(Item.MouseButton1Click, function()
                    self:Select(text)
                    pcall(self._callback, text)
                    self:Close()
                end)
            end

            function Dropdown.InitialiseConnections(self)
                self._trove:Connect(self.header.MouseButton1Click, function()
                    if self._open then
                        self:Close()
                    else
                        self:Open()
                    end
                end)
            end
            function Dropdown.SetItems(self, items)
                self._items = table.clone(items or {})

                for _, child in self.listFrame:GetChildren()do
                    if child:IsA('TextButton') then
                        child:Destroy()
                    end
                end
                for _, v in self._items do
                    createItem(self, v)
                end

                self.listFrame.Size = UDim2.new(1, 0, 0, #self._items * 22)
            end
            function Dropdown.Open(self)
                self._open = true
                self.listFrame.Visible = true
            end
            function Dropdown.Close(self)
                self._open = false
                self.listFrame.Visible = false
            end
            function Dropdown.Select(self, value)
                self._selected = value
                self.selectedLabel.Text = value or ''
            end
            function Dropdown.Get(self)
                return self._selected
            end

            return Dropdown
        end

        function __DARKLUA_BUNDLE_MODULES.j()
            local v = __DARKLUA_BUNDLE_MODULES.cache.j

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.j = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local LibraryData = __DARKLUA_BUNDLE_MODULES.f()
            local UserInputService = cloneref(game:GetService('UserInputService'))
            local Colorpicker = {}

            Colorpicker.__index = Colorpicker

            function Colorpicker.new(container, text, preset, callback)
                local header, swatch, panel, hueBar, hueFill = Colorpicker.InitialiseElements(container, text)
                local self = {
                    _trove = Trove.new(),
                    _callback = callback,
                    _open = false,
                    _color = preset or LibraryData.ACCENT_COLOUR,
                    header = header,
                    swatch = swatch,
                    panel = panel,
                    hueBar = hueBar,
                    hueFill = hueFill,
                }

                self = setmetatable(self, Colorpicker)

                self:InitialiseConnections()
                self:Set(self._color)

                return self
            end
            function Colorpicker.Destroy(self)
                self._trove:Destroy()
            end
            function Colorpicker.InitialiseElements(container, text)
                local Root = Instance.new('Frame')

                Root.Name = 'Colorpicker'
                Root.Parent = container
                Root.BackgroundTransparency = 1
                Root.Size = UDim2.new(1, 0, 0, 42)

                local Header = Instance.new('TextButton')

                Header.Parent = Root
                Header.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                Header.Size = UDim2.new(1, 0, 0, 20)
                Header.AutoButtonColor = false
                Header.Text = ''

                local Outline1 = Instance.new('ImageLabel')

                Outline1.Parent = Header
                Outline1.BackgroundTransparency = 1
                Outline1.Size = UDim2.fromScale(1, 1)
                Outline1.Image = 'rbxassetid://2592362371'
                Outline1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                Outline1.ScaleType = Enum.ScaleType.Slice
                Outline1.SliceCenter = Rect.new(2, 2, 62, 62)

                local Outline2 = Instance.new('ImageLabel')

                Outline2.Parent = Header
                Outline2.BackgroundTransparency = 1
                Outline2.Position = UDim2.fromOffset(1, 1)
                Outline2.Size = UDim2.new(1, -2, 1, -2)
                Outline2.Image = 'rbxassetid://2592362371'
                Outline2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                Outline2.ScaleType = Enum.ScaleType.Slice
                Outline2.SliceCenter = Rect.new(2, 2, 62, 62)

                local Title = Instance.new('TextLabel')

                Title.Parent = Header
                Title.BackgroundTransparency = 1
                Title.Position = UDim2.fromOffset(6, 0)
                Title.Size = UDim2.fromScale(0, 1)
                Title.Font = Enum.Font.Code
                Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title.TextSize = 14
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.Text = text

                local Swatch = Instance.new('Frame')

                Swatch.Parent = Header
                Swatch.AnchorPoint = Vector2.new(1, 0.5)
                Swatch.Position = UDim2.new(1, -6, 0.5, 0)
                Swatch.Size = UDim2.fromOffset(20, 12)
                Swatch.BorderSizePixel = 1
                Swatch.BorderColor3 = LibraryData.ACCENT_COLOUR

                local Panel = Instance.new('Frame')

                Panel.Parent = Root
                Panel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                Panel.BorderSizePixel = 0
                Panel.Position = UDim2.fromOffset(0, 22)
                Panel.Size = UDim2.new(1, 0, 0, 20)
                Panel.Visible = false

                local HueBar = Instance.new('Frame')

                HueBar.Parent = Panel
                HueBar.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                HueBar.BorderSizePixel = 0
                HueBar.Size = UDim2.new(1, 0, 0, 20)

                local HueFill = Instance.new('Frame')

                HueFill.Parent = HueBar
                HueFill.BackgroundColor3 = LibraryData.ACCENT_COLOUR
                HueFill.BorderSizePixel = 0
                HueFill.Size = UDim2.fromScale(0, 1)

                return Header, Swatch, Panel, HueBar, HueFill
            end
            function Colorpicker.InitialiseConnections(self)
                self._trove:Connect(self.header.MouseButton1Click, function()
                    if self._open then
                        self:Close()
                    else
                        self:Open()
                    end
                end)

                local dragging = false

                self._trove:Connect(self.hueBar.InputBegan, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = true
                    end
                end)
                self._trove:Connect(self.hueBar.InputEnded, function(input)
                    if input.UserInputType == Enum.UserInputType.MouseButton1 then
                        dragging = false
                    end
                end)
                self._trove:Connect(UserInputService.InputChanged, function(
                    input
                )
                    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                        local absPos = self.hueBar.AbsolutePosition
                        local absSize = self.hueBar.AbsoluteSize
                        local rel = math.clamp((input.Position.X - absPos.X) / absSize.X, 0, 1)

                        self.hueFill.Size = UDim2.fromScale(rel, 1)

                        local color = Color3.fromHSV(rel, 1, 1)

                        self:Set(color)
                        pcall(self._callback, self._color)
                    end
                end)
            end
            function Colorpicker.Open(self)
                self._open = true
                self.panel.Visible = true
            end
            function Colorpicker.Close(self)
                self._open = false
                self.panel.Visible = false
            end
            function Colorpicker.Set(self, color)
                self._color = color
                self.swatch.BackgroundColor3 = color
            end
            function Colorpicker.Get(self)
                return self._color
            end

            return Colorpicker
        end

        function __DARKLUA_BUNDLE_MODULES.k()
            local v = __DARKLUA_BUNDLE_MODULES.cache.k

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.k = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local UserInputService = cloneref(game:GetService('UserInputService'))
            local Bind = {}

            Bind.__index = Bind

            local WhitelistedMouse = {
                [Enum.UserInputType.MouseButton1] = 'M1',
                [Enum.UserInputType.MouseButton2] = 'M2',
                [Enum.UserInputType.MouseButton3] = 'M3',
            }
            local BlacklistedKeys = {
                Enum.KeyCode.Unknown,
                Enum.KeyCode.W,
                Enum.KeyCode.A,
                Enum.KeyCode.S,
                Enum.KeyCode.D,
                Enum.KeyCode.Up,
                Enum.KeyCode.Left,
                Enum.KeyCode.Down,
                Enum.KeyCode.Right,
                Enum.KeyCode.Slash,
                Enum.KeyCode.Tab,
                Enum.KeyCode.Backspace,
                Enum.KeyCode.Escape,
                Enum.KeyCode.RightShift,
            }
            local isBlacklisted = function(code)
                for _, v in BlacklistedKeys do
                    if v == code then
                        return true
                    end
                end

                return false
            end

            function Bind.new(container, text, preset, callback)
                local root, title, valueLabel = Bind.InitialiseElements(container, text)
                local self = {
                    _trove = Trove.new(),
                    _callback = callback,
                    _capturing = false,
                    _bind = preset,
                    root = root,
                    title = title,
                    valueLabel = valueLabel,
                }

                self = setmetatable(self, Bind)

                self:InitialiseConnections()

                if preset then
                    self:Set(preset)
                end

                return self
            end
            function Bind.Destroy(self)
                self._trove:Destroy()
            end
            function Bind.InitialiseElements(container, text)
                local Root = Instance.new('TextButton')

                Root.Name = 'Bind'
                Root.Parent = container
                Root.BackgroundTransparency = 1
                Root.Size = UDim2.new(1, 0, 0, 22)
                Root.AutoButtonColor = false
                Root.Text = ''

                local Title = Instance.new('TextLabel')

                Title.Parent = Root
                Title.BackgroundTransparency = 1
                Title.Position = UDim2.fromOffset(6, 0)
                Title.Size = UDim2.fromScale(0, 1)
                Title.Font = Enum.Font.Code
                Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title.TextSize = 14
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextTransparency = 0.4
                Title.Text = text

                local Value = Instance.new('TextLabel')

                Value.Parent = Root
                Value.BackgroundTransparency = 1
                Value.Position = UDim2.new(1, -6, 0, 0)
                Value.Size = UDim2.fromScale(0, 1)
                Value.Font = Enum.Font.Code
                Value.TextColor3 = Color3.fromRGB(200, 200, 200)
                Value.TextSize = 14
                Value.TextXAlignment = Enum.TextXAlignment.Right

                return Root, Title, Value
            end
            function Bind.InitialiseConnections(self)
                self._trove:Connect(self.root.MouseButton1Click, function()
                    self._capturing = true
                    self.valueLabel.Text = '...'
                end)
                self._trove:Connect(UserInputService.InputBegan, function(
                    inputObject
                )
                    if not self._capturing then
                        return
                    end

                    self._capturing = false

                    if inputObject.UserInputType == Enum.UserInputType.Keyboard then
                        local code = inputObject.KeyCode

                        if not isBlacklisted(code) then
                            self:Set(code)
                            pcall(self._callback, code)
                        end
                    elseif WhitelistedMouse[(inputObject.UserInputType)] then
                        local mouseBind = WhitelistedMouse[(inputObject.UserInputType)]

                        self:Set(mouseBind)
                        pcall(self._callback, mouseBind)
                    end
                end)
            end
            function Bind.Set(self, b)
                self._bind = b

                if typeof(b) == 'EnumItem' then
                    self.valueLabel.Text = tostring(b.Name)
                else
                    self.valueLabel.Text = tostring(b)
                end

                self.title.TextTransparency = 0
            end
            function Bind.Get(self)
                return self._bind
            end

            return Bind
        end

        function __DARKLUA_BUNDLE_MODULES.l()
            local v = __DARKLUA_BUNDLE_MODULES.cache.l

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.l = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local LibraryData = __DARKLUA_BUNDLE_MODULES.f()
            local Textbox = {}

            Textbox.__index = Textbox

            function Textbox.new(
                container,
                text,
                numberOnly,
                disappear,
                callback
            )
                local title, input = Textbox.InitialiseElements(container, text)
                local self = {
                    _trove = Trove.new(),
                    _callback = callback,
                    _numberOnly = numberOnly == true,
                    _disappear = disappear == true,
                    title = title,
                    input = input,
                }

                self = setmetatable(self, Textbox)

                self:InitialiseConnections()

                return self
            end
            function Textbox.Destroy(self)
                self._trove:Destroy()
            end
            function Textbox.InitialiseElements(container, text)
                local Root = Instance.new('Frame')

                Root.Name = 'Textbox'
                Root.Parent = container
                Root.BackgroundTransparency = 1
                Root.Size = UDim2.new(1, 0, 0, 22)

                local Title = Instance.new('TextLabel')

                Title.Parent = Root
                Title.BackgroundTransparency = 1
                Title.Position = UDim2.fromOffset(6, 0)
                Title.Size = UDim2.fromScale(0, 1)
                Title.Font = Enum.Font.Code
                Title.TextColor3 = Color3.fromRGB(255, 255, 255)
                Title.TextSize = 14
                Title.TextXAlignment = Enum.TextXAlignment.Left
                Title.TextTransparency = 0.4
                Title.Text = text

                local InputFrame = Instance.new('Frame')

                InputFrame.Parent = Root
                InputFrame.AnchorPoint = Vector2.new(1, 0.5)
                InputFrame.Position = UDim2.fromScale(1, 0.5)
                InputFrame.Size = UDim2.fromOffset(120, 18)
                InputFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
                InputFrame.BorderColor3 = LibraryData.ACCENT_COLOUR
                InputFrame.BorderSizePixel = 0

                local InputOutline1 = Instance.new('ImageLabel')

                InputOutline1.Parent = InputFrame
                InputOutline1.BackgroundTransparency = 1
                InputOutline1.Size = UDim2.fromScale(1, 1)
                InputOutline1.Image = 'rbxassetid://2592362371'
                InputOutline1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                InputOutline1.ScaleType = Enum.ScaleType.Slice
                InputOutline1.SliceCenter = Rect.new(2, 2, 62, 62)

                local InputOutline2 = Instance.new('ImageLabel')

                InputOutline2.Parent = InputFrame
                InputOutline2.BackgroundTransparency = 1
                InputOutline2.Position = UDim2.fromOffset(1, 1)
                InputOutline2.Size = UDim2.new(1, -2, 1, -2)
                InputOutline2.Image = 'rbxassetid://2592362371'
                InputOutline2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                InputOutline2.ScaleType = Enum.ScaleType.Slice
                InputOutline2.SliceCenter = Rect.new(2, 2, 62, 62)

                local Input = Instance.new('TextBox')

                Input.Parent = InputFrame
                Input.BackgroundTransparency = 1
                Input.Size = UDim2.new(1, -6, 1, 0)
                Input.PlaceholderText = 'Type here'
                Input.Text = ''
                Input.Position = UDim2.fromOffset(3, 0)
                Input.ClearTextOnFocus = false
                Input.Font = Enum.Font.Code
                Input.TextColor3 = Color3.fromRGB(255, 255, 255)
                Input.TextSize = 14
                Input.TextXAlignment = Enum.TextXAlignment.Left

                return Title, Input
            end
            function Textbox.InitialiseConnections(self)
                self._trove:Connect(self.input.Focused, function()
                    self.title.TextTransparency = 0
                end)
                self._trove:Connect(self.input.FocusLost, function()
                    local text = self.input.Text or ''

                    if self._numberOnly then
                        text = string.gsub(text, '[^0-9.-]', '')
                        self.input.Text = text
                    end

                    pcall(self._callback, text)

                    if self._disappear then
                        self.input.Text = ''
                    end
                end)
            end
            function Textbox.Set(self, text)
                self.input.Text = text
                self.title.TextTransparency = 0
            end
            function Textbox.Get(self)
                return self.input.Text
            end

            return Textbox
        end

        function __DARKLUA_BUNDLE_MODULES.m()
            local v = __DARKLUA_BUNDLE_MODULES.cache.m

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.m = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local Label = {}

            Label.__index = Label

            function Label.new(container, text)
                local label = Label.InitialiseElements(container, text)
                local self = {
                    _trove = Trove.new(),
                    label = label,
                }

                self = setmetatable(self, Label)

                return self
            end
            function Label.Destroy(self)
                self._trove:Destroy()
            end
            function Label.InitialiseElements(container, text)
                local LabelElement = Instance.new('TextLabel')

                LabelElement.Name = 'Label'
                LabelElement.Parent = container
                LabelElement.BackgroundTransparency = 1
                LabelElement.Size = UDim2.new(1, 0, 0, 18)
                LabelElement.Font = Enum.Font.Code
                LabelElement.TextColor3 = Color3.fromRGB(255, 255, 255)
                LabelElement.TextSize = 14
                LabelElement.TextXAlignment = Enum.TextXAlignment.Left
                LabelElement.Text = text

                return LabelElement
            end
            function Label.SetText(self, text)
                self.label.Text = text
            end
            function Label.GetText(self)
                return self.label.Text
            end

            return Label
        end

        function __DARKLUA_BUNDLE_MODULES.n()
            local v = __DARKLUA_BUNDLE_MODULES.cache.n

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.n = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local Button = __DARKLUA_BUNDLE_MODULES.g()
            local Toggle = __DARKLUA_BUNDLE_MODULES.h()
            local Slider = __DARKLUA_BUNDLE_MODULES.i()
            local Dropdown = __DARKLUA_BUNDLE_MODULES.j()
            local Colorpicker = __DARKLUA_BUNDLE_MODULES.k()
            local Bind = __DARKLUA_BUNDLE_MODULES.l()
            local Textbox = __DARKLUA_BUNDLE_MODULES.m()
            local Label = __DARKLUA_BUNDLE_MODULES.n()
            local Section = {}

            Section.__index = Section

            function Section.new(container, zIndex, text)
                local SectionFrame, SectionItemHolderFrame, SectionItemHolderLayout = Section.InitialiseElements(container, zIndex, text)
                local self = {
                    _trove = Trove.new(),
                    _container = SectionFrame,
                    _itemHolderFrame = SectionItemHolderFrame,
                    _itemHolderLayout = SectionItemHolderLayout,
                }

                self = setmetatable(self, Section)

                return self
            end
            function Section.Destroy(self)
                self._trove:Destroy()
            end
            function Section.InitialiseElements(container, zIndex, text)
                local SectionFrame = Instance.new('Frame')
                local SectionOutline2 = Instance.new('ImageLabel')
                local SectionOutline1 = Instance.new('ImageLabel')
                local SectionTitleFrame = Instance.new('Frame')
                local SectionTitle = Instance.new('TextLabel')
                local SectionItemHolderFrame = Instance.new('Frame')
                local SectionItemHolderLayout = Instance.new('UIListLayout')

                SectionFrame.Name = 'Section'
                SectionFrame.Parent = container
                SectionFrame.AnchorPoint = Vector2.new(0.5, 0)
                SectionFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                SectionFrame.BorderColor3 = Color3.fromRGB(40, 40, 40)
                SectionFrame.BorderSizePixel = 0
                SectionFrame.Position = UDim2.fromScale(0.49559471, 0.0111856824)
                SectionFrame.Size = UDim2.new(1, -2, 0, 24)
                SectionFrame.ZIndex = zIndex
                SectionOutline2.Name = 'SectionOutline2'
                SectionOutline2.Parent = SectionFrame
                SectionOutline2.BackgroundTransparency = 1
                SectionOutline2.Size = UDim2.fromScale(1, 1)
                SectionOutline2.Image = 'rbxassetid://2592362371'
                SectionOutline2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                SectionOutline2.ScaleType = Enum.ScaleType.Slice
                SectionOutline2.SliceCenter = Rect.new(2, 2, 62, 62)
                SectionOutline1.Name = 'SectionOutline1'
                SectionOutline1.Parent = SectionFrame
                SectionOutline1.BackgroundTransparency = 1
                SectionOutline1.Position = UDim2.fromOffset(1, 1)
                SectionOutline1.Size = UDim2.new(1, -2, 1, -2)
                SectionOutline1.Image = 'rbxassetid://2592362371'
                SectionOutline1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                SectionOutline1.ScaleType = Enum.ScaleType.Slice
                SectionOutline1.SliceCenter = Rect.new(2, 2, 62, 62)
                SectionTitleFrame.Name = 'SectionTitleFrame'
                SectionTitleFrame.Parent = SectionFrame
                SectionTitleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
                SectionTitleFrame.BorderSizePixel = 0
                SectionTitleFrame.Position = UDim2.fromOffset(10, 0)
                SectionTitleFrame.Size = UDim2.fromOffset(65, 7)
                SectionTitle.Name = 'SectionTitle'
                SectionTitle.Parent = SectionTitleFrame
                SectionTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionTitle.BackgroundTransparency = 1
                SectionTitle.Position = UDim2.fromOffset(0, -3)
                SectionTitle.Size = UDim2.new(1, 0, 0, 7)
                SectionTitle.Font = Enum.Font.Code
                SectionTitle.Text = text
                SectionTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                SectionTitle.TextSize = 14
                SectionItemHolderFrame.Name = 'SectionItemHolderFrame'
                SectionItemHolderFrame.Parent = SectionFrame
                SectionItemHolderFrame.AnchorPoint = Vector2.new(0.5, 0)
                SectionItemHolderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionItemHolderFrame.BackgroundTransparency = 1
                SectionItemHolderFrame.Position = UDim2.new(0.5, 0, 0, 15)
                SectionItemHolderFrame.Size = UDim2.new(1, -16, 0, 0)
                SectionItemHolderLayout.Name = 'SectionItemHolderLayout'
                SectionItemHolderLayout.Parent = SectionItemHolderFrame
                SectionItemHolderLayout.SortOrder = Enum.SortOrder.LayoutOrder
                SectionItemHolderLayout.Padding = UDim.new(0, 5)
                SectionTitleFrame.Size = UDim2.fromOffset(SectionTitle.TextBounds.X + 6, 7)

                return SectionFrame, SectionItemHolderFrame, SectionItemHolderLayout
            end
            function Section.Button(self, text, callback)
                local button = self._trove:Add(Button.new(self._itemHolderFrame, text, callback))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return button
            end
            function Section.Toggle(self, text, def, callback)
                local toggle = self._trove:Add(Toggle.new(self._itemHolderFrame, text, def, callback))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return toggle
            end
            function Section.Slider(self, text, settings, callback)
                local slider = self._trove:Add(Slider.new(self._itemHolderFrame, text, settings, callback))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return slider
            end
            function Section.Dropdown(self, text, items, selected, callback)
                local dropdown = self._trove:Add(Dropdown.new(self._itemHolderFrame, text, items, selected, callback))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return dropdown
            end
            function Section.Colorpicker(self, text, preset, callback)
                local colorpicker = self._trove:Add(Colorpicker.new(self._itemHolderFrame, text, preset, callback))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return colorpicker
            end
            function Section.Bind(self, text, preset, callback)
                local bind = self._trove:Add(Bind.new(self._itemHolderFrame, text, preset, callback))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return bind
            end
            function Section.Textbox(
                self,
                text,
                numberOnly,
                disappear,
                callback
            )
                local textbox = self._trove:Add(Textbox.new(self._itemHolderFrame, text, numberOnly, disappear, callback))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return textbox
            end
            function Section.Label(self, text)
                local label = self._trove:Add(Label.new(self._itemHolderFrame, text))

                self._container.Size = UDim2.new(1, -2, 0, self._itemHolderLayout.AbsoluteContentSize.Y + 24)

                return label
            end

            return Section
        end

        function __DARKLUA_BUNDLE_MODULES.o()
            local v = __DARKLUA_BUNDLE_MODULES.cache.o

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.o = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local Section = __DARKLUA_BUNDLE_MODULES.o()
            local TweenService = cloneref(game:GetService('TweenService'))
            local Tab = {}

            Tab.__index = Tab

            function Tab.new(text, show, TabHolderFrame, ContainerHolderFrame)
                local TabBtn, SectionHolder1, SectionHolder2 = Tab.InitialiseElements(text, show, TabHolderFrame, ContainerHolderFrame)
                local self = {
                    _trove = Trove.new(),
                    _sectionCounter = 50,
                    _sectionA = SectionHolder1,
                    _sectionB = SectionHolder2,
                }

                self = setmetatable(self, Tab)

                self:InitialiseConnections(TabBtn, TabHolderFrame, ContainerHolderFrame, SectionHolder1, SectionHolder2)

                return self
            end
            function Tab.Destroy(self)
                self._trove:Destroy()
            end
            function Tab.InitialiseElements(
                text,
                show,
                TabHolderFrame,
                ContainerHolderFrame
            )
                local TabBtn = Instance.new('TextButton')

                TabBtn.Name = 'TabBtn'
                TabBtn.Parent = TabHolderFrame
                TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TabBtn.BackgroundTransparency = 1
                TabBtn.Font = Enum.Font.Code
                TabBtn.Text = text
                TabBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                TabBtn.TextSize = 15
                TabBtn.TextTransparency = show and 0 or 0.4
                TabBtn.Size = UDim2.new(0, TabBtn.TextBounds.X, 1, 0)

                local SectionHolder1 = Instance.new('ScrollingFrame')
                local SectionHolder1Padding = Instance.new('UIPadding')
                local SectionHolder1Layout = Instance.new('UIListLayout')
                local SectionHolder2 = Instance.new('ScrollingFrame')
                local SectionHolder2Padding = Instance.new('UIPadding')
                local SectionHolder2Layout = Instance.new('UIListLayout')

                SectionHolder1.Name = 'SectionHolder1'
                SectionHolder1.Parent = ContainerHolderFrame
                SectionHolder1.Active = true
                SectionHolder1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionHolder1.BackgroundTransparency = 1
                SectionHolder1.BorderSizePixel = 0
                SectionHolder1.Position = UDim2.fromOffset(1, 20)
                SectionHolder1.Size = UDim2.new(0, 281, 1, -40)
                SectionHolder1.Visible = show
                SectionHolder1.CanvasSize = UDim2.new(0, 0, 0, 0)
                SectionHolder1.ScrollBarThickness = 0
                SectionHolder1.ZIndex = 1
                SectionHolder1Padding.Name = 'SectionHolder1Padding'
                SectionHolder1Padding.Parent = SectionHolder1
                SectionHolder1Padding.PaddingTop = UDim.new(0, 5)
                SectionHolder1Layout.Name = 'SectionHolder1Layout'
                SectionHolder1Layout.Parent = SectionHolder1
                SectionHolder1Layout.SortOrder = Enum.SortOrder.LayoutOrder
                SectionHolder1Layout.Padding = UDim.new(0, 10)
                SectionHolder2.Name = 'SectionHolder2'
                SectionHolder2.Parent = ContainerHolderFrame
                SectionHolder2.Active = true
                SectionHolder2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                SectionHolder2.BackgroundTransparency = 1
                SectionHolder2.BorderSizePixel = 0
                SectionHolder2.Position = UDim2.fromOffset(243, 32)
                SectionHolder2.Size = UDim2.new(0, 227, 1, -40)
                SectionHolder2.Visible = show
                SectionHolder2.CanvasSize = UDim2.new(0, 0, 0, 0)
                SectionHolder2.ScrollBarThickness = 0
                SectionHolder1.ZIndex = 2
                SectionHolder2Padding.Name = 'SectionHolder2Padding'
                SectionHolder2Padding.Parent = SectionHolder2
                SectionHolder2Padding.PaddingTop = UDim.new(0, 5)
                SectionHolder2Layout.Name = 'SectionHolder2Layout'
                SectionHolder2Layout.Parent = SectionHolder2
                SectionHolder2Layout.SortOrder = Enum.SortOrder.LayoutOrder
                SectionHolder2Layout.Padding = UDim.new(0, 10)

                return TabBtn, SectionHolder1, SectionHolder2
            end
            function Tab.InitialiseConnections(
                self,
                TabBtn,
                TabHolderFrame,
                ContainerHolderFrame,
                SectionHolder1,
                SectionHolder2
            )
                self._trove:Connect(TabBtn.MouseButton1Click, function()
                    for _, v in TabHolderFrame:GetChildren()do
                        if v.Name == 'TabBtn' then
                            TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.4}):Play()
                        end
                    end
                    for _, v in ContainerHolderFrame:GetChildren()do
                        v = v

                        if v.Name == 'SectionHolder1' or v.Name == 'SectionHolder2' then
                            v.Visible = false
                        end
                    end

                    SectionHolder1.Visible = true
                    SectionHolder2.Visible = true

                    TweenService:Create(TabBtn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
                end)
            end
            function Tab.Section(self, text)
                self._sectionCounter = self._sectionCounter - 1

                local sectionA = #self._sectionA:GetChildren()
                local sectionB = #self._sectionB:GetChildren()
                local parent = (sectionA == sectionB and {
                    (self._sectionA),
                } or {
                    (self._sectionB),
                })[1]

                return self._trove:Add(Section.new(parent, self._sectionCounter, text))
            end

            return Tab
        end

        function __DARKLUA_BUNDLE_MODULES.p()
            local v = __DARKLUA_BUNDLE_MODULES.cache.p

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.p = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local Draggable = __DARKLUA_BUNDLE_MODULES.e()
            local gameData = __DARKLUA_BUNDLE_MODULES.a()
            local Tab = __DARKLUA_BUNDLE_MODULES.p()
            local LibraryData = __DARKLUA_BUNDLE_MODULES.f()
            local UserInputService = cloneref(game:GetService('UserInputService'))
            local Window = {}

            Window.__index = Window

            function Window.new(parent, text)
                local trove = Trove.new()
                local TopBar, TopBarLine, MainFrame, TabHolderFrame, ContainerHolderFrame = Window.InitialiseElements(parent, text)
                local self = {
                    _trove = trove,
                    _toggled = false,
                    _tabHolderFrame = TabHolderFrame,
                    _containerHolderFrame = ContainerHolderFrame,
                    topBarLine = TopBarLine,
                }

                self = setmetatable(self, Window)

                self:InitialiseConnections(TopBar, MainFrame)

                return self
            end
            function Window.Destroy(self)
                self._trove:Destroy()
            end
            function Window.InitialiseElements(parent, text)
                local MainFrame = Instance.new('Frame')
                local OutlineMainFrame1 = Instance.new('ImageLabel')
                local OutlineMainFrame2 = Instance.new('ImageLabel')
                local ContainerHolderFrame = Instance.new('Frame')
                local TabHolderFrame = Instance.new('Frame')
                local TabHolderFrameLayout = Instance.new('UIListLayout')
                local TabHolderFramePadding = Instance.new('UIPadding')
                local TopBar = Instance.new('Frame')
                local TopBarTitle = Instance.new('TextLabel')
                local TopBarLine = Instance.new('Frame')

                MainFrame.Name = 'MainFrame'
                MainFrame.Parent = parent
                MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
                MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                MainFrame.BorderColor3 = Color3.fromRGB(60, 60, 60)
                MainFrame.BorderSizePixel = 0
                MainFrame.Position = UDim2.fromScale(0.5, 0.5)
                MainFrame.Size = UDim2.fromOffset(300, gameData.FFA and 250 or 235)
                MainFrame.Visible = true
                OutlineMainFrame1.Name = 'OutlineMainFrame1'
                OutlineMainFrame1.Parent = MainFrame
                OutlineMainFrame1.BackgroundTransparency = 1
                OutlineMainFrame1.Position = UDim2.fromOffset(1, 1)
                OutlineMainFrame1.Size = UDim2.new(1, -2, 1, -2)
                OutlineMainFrame1.Image = 'rbxassetid://2592362371'
                OutlineMainFrame1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                OutlineMainFrame1.ScaleType = Enum.ScaleType.Slice
                OutlineMainFrame1.SliceCenter = Rect.new(2, 2, 62, 62)
                OutlineMainFrame2.Name = 'OutlineMainFrame2'
                OutlineMainFrame2.Parent = MainFrame
                OutlineMainFrame2.BackgroundTransparency = 1
                OutlineMainFrame2.Size = UDim2.fromScale(1, 1)
                OutlineMainFrame2.Image = 'rbxassetid://2592362371'
                OutlineMainFrame2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                OutlineMainFrame2.ScaleType = Enum.ScaleType.Slice
                OutlineMainFrame2.SliceCenter = Rect.new(2, 2, 62, 62)
                ContainerHolderFrame.Name = 'ContainerHolderFrame'
                ContainerHolderFrame.Parent = MainFrame
                ContainerHolderFrame.AnchorPoint = Vector2.new(0.5, 0)
                ContainerHolderFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                ContainerHolderFrame.BorderColor3 = Color3.fromRGB(30, 30, 30)
                ContainerHolderFrame.Position = UDim2.fromScale(0.5, 0.071)
                ContainerHolderFrame.Size = UDim2.new(1, -18, 0, 487)
                ContainerHolderFrame.BackgroundTransparency = 1
                TabHolderFrame.Name = 'TabHolderFrame'
                TabHolderFrame.Parent = ContainerHolderFrame
                TabHolderFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TabHolderFrame.BackgroundTransparency = 1
                TabHolderFrame.Size = UDim2.new(1, 0, 0, 28)
                TabHolderFrame.Visible = false
                TabHolderFrameLayout.Name = 'TabHolderFrameLayout'
                TabHolderFrameLayout.Parent = TabHolderFrame
                TabHolderFrameLayout.FillDirection = Enum.FillDirection.Horizontal
                TabHolderFrameLayout.SortOrder = Enum.SortOrder.LayoutOrder
                TabHolderFrameLayout.Padding = UDim.new(0, 8)
                TabHolderFramePadding.Name = 'TabHolderFramePadding'
                TabHolderFramePadding.Parent = TabHolderFrame
                TabHolderFramePadding.PaddingLeft = UDim.new(0, 7)
                TopBar.Name = 'TopBar'
                TopBar.Parent = MainFrame
                TopBar.AnchorPoint = Vector2.new(0.5, 0)
                TopBar.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
                TopBar.BorderSizePixel = 0
                TopBar.Position = UDim2.new(0.5, 0, 0, 2)
                TopBar.Size = UDim2.new(1, -5, 0, 28)
                TopBarTitle.Name = 'TopBarTitle'
                TopBarTitle.Parent = TopBar
                TopBarTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                TopBarTitle.BackgroundTransparency = 1
                TopBarTitle.Position = UDim2.fromOffset(7, 5)
                TopBarTitle.Size = UDim2.fromOffset(0, 16)
                TopBarTitle.Font = Enum.Font.Code
                TopBarTitle.Text = text
                TopBarTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                TopBarTitle.TextSize = 16
                TopBarTitle.TextXAlignment = Enum.TextXAlignment.Left
                TopBarLine.Name = 'TopBarLine'
                TopBarLine.Parent = TopBar
                TopBarLine.BackgroundColor3 = Color3.fromRGB(255, 55, 55)
                TopBarLine.BorderColor3 = LibraryData.ACCENT_COLOUR
                TopBarLine.BorderSizePixel = 0
                TopBarLine.Position = UDim2.fromOffset(0, 27)
                TopBarLine.Size = UDim2.new(1, 0, 0, 1)

                return TopBar, TopBarLine, MainFrame, TabHolderFrame, ContainerHolderFrame
            end
            function Window.InitialiseConnections(self, TopBar, MainFrame)
                self._trove:Add(Draggable.new(TopBar, MainFrame))
                self._trove:Connect(UserInputService.InputBegan, function(
                    inputObject
                )
                    if inputObject.KeyCode == Enum.KeyCode.RightShift then
                        self._toggled = not self._toggled
                        MainFrame.Visible = self._toggled
                    end
                end)
                self._trove:Add(MainFrame)
            end
            function Window.Tab(self, title, show)
                return self._trove:Add(Tab.new(title, show, self._tabHolderFrame, self._containerHolderFrame))
            end

            return Window
        end

        function __DARKLUA_BUNDLE_MODULES.q()
            local v = __DARKLUA_BUNDLE_MODULES.cache.q

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.q = v
            end

            return v.c
        end
    end
    do
        local __modImpl = function()
            local Trove = __DARKLUA_BUNDLE_MODULES.d()
            local Window = __DARKLUA_BUNDLE_MODULES.q()
            local CoreGui = cloneref(game:GetService('CoreGui'))
            local Library = {}

            Library.__index = Library

            function Library.new()
                local trove = Trove.new()
                local container = trove:Add(Instance.new('ScreenGui'))

                container.Name = 'rocult'

                setthreadidentity(8)

                container.Parent = (gethui and {
                    (gethui()),
                } or {CoreGui})[1]
                container.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

                local notifications = trove:Add(Instance.new('Folder'))

                notifications.Name = 'NotificationFolder'
                notifications.Parent = container

                local self = {
                    _trove = trove,
                    _container = container,
                    _notifications = notifications,
                    _accentColor = Color3.fromRGB(128, 213, 247),
                    _dropdownFrames = {},
                    _colorPickerFrames = {},
                }

                return setmetatable(self, Library)
            end
            function Library.Destroy(self)
                self._trove:Destroy()
            end
            function Library.Notify(self, title, text, duration)
                for _, notification in self._notifications:GetChildren()do
                    notification = notification

                    notification:TweenPosition(UDim2.fromScale(0.5, notification.Position.Y.Scale - 0.05), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                end

                local Notification = Instance.new('Frame')
                local OutlineNotification1 = Instance.new('ImageLabel')
                local OutlineNotification2 = Instance.new('ImageLabel')
                local NotificationIco = Instance.new('ImageLabel')
                local NotificationTitle = Instance.new('TextLabel')
                local NotificationDesc = Instance.new('TextLabel')

                Notification.Name = 'Notification'
                Notification.Parent = self._notifications
                Notification.AnchorPoint = Vector2.new(0.5, 0.5)
                Notification.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                Notification.BorderColor3 = Color3.fromRGB(60, 60, 60)
                Notification.BorderSizePixel = 0
                Notification.Position = UDim2.fromScale(1.5, 0.5)
                Notification.Size = UDim2.fromOffset(328, 45)
                OutlineNotification1.Name = 'OutlineNotification1'
                OutlineNotification1.Parent = Notification
                OutlineNotification1.BackgroundTransparency = 1
                OutlineNotification1.Position = UDim2.fromOffset(1, 1)
                OutlineNotification1.Size = UDim2.new(1, -2, 1, -2)
                OutlineNotification1.Image = 'rbxassetid://2592362371'
                OutlineNotification1.ImageColor3 = Color3.fromRGB(60, 60, 60)
                OutlineNotification1.ScaleType = Enum.ScaleType.Slice
                OutlineNotification1.SliceCenter = Rect.new(2, 2, 62, 62)
                OutlineNotification2.Name = 'OutlineNotification2'
                OutlineNotification2.Parent = Notification
                OutlineNotification2.BackgroundTransparency = 1
                OutlineNotification2.Size = UDim2.fromScale(1, 1)
                OutlineNotification2.Image = 'rbxassetid://2592362371'
                OutlineNotification2.ImageColor3 = Color3.fromRGB(0, 0, 0)
                OutlineNotification2.ScaleType = Enum.ScaleType.Slice
                OutlineNotification2.SliceCenter = Rect.new(2, 2, 62, 62)
                NotificationIco.Name = 'NotificationIco'
                NotificationIco.Parent = Notification
                NotificationIco.AnchorPoint = Vector2.new(0, 0.5)
                NotificationIco.BackgroundColor3 = Color3.fromRGB(0, 184, 113)
                NotificationIco.BackgroundTransparency = 1
                NotificationIco.Position = UDim2.new(0, 7, 0.5, 0)
                NotificationIco.Size = UDim2.fromOffset(25, 25)
                NotificationIco.Image = 'http://www.roblox.com/asset/?id=6026568210'
                NotificationIco.ImageColor3 = self._accentColor
                NotificationTitle.Name = 'NotificationTitle'
                NotificationTitle.Parent = Notification
                NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NotificationTitle.BackgroundTransparency = 1
                NotificationTitle.Position = UDim2.fromOffset(39, 6)
                NotificationTitle.Size = UDim2.fromOffset(200, 19)
                NotificationTitle.Font = Enum.Font.Code
                NotificationTitle.Text = title
                NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
                NotificationTitle.TextSize = 16
                NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left
                NotificationDesc.Name = 'NotificationDesc'
                NotificationDesc.Parent = Notification
                NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                NotificationDesc.BackgroundTransparency = 1
                NotificationDesc.Position = UDim2.new(0.0143884895, 35, 1, -25)
                NotificationDesc.Size = UDim2.fromOffset(200, 19)
                NotificationDesc.Font = Enum.Font.Code
                NotificationDesc.Text = text
                NotificationDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
                NotificationDesc.TextSize = 15
                NotificationDesc.TextXAlignment = Enum.TextXAlignment.Left
                Notification.Size = UDim2.fromOffset(NotificationDesc.TextBounds.X + 45, 45)

                if #NotificationTitle.Text >= #NotificationDesc.Text then
                    Notification.Size = UDim2.fromOffset(NotificationTitle.TextBounds.X + 45, 45)
                end

                Notification:TweenPosition(UDim2.fromScale(0.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, 0.3, true)
                self._trove:Add(task.delay(duration, function()
                    Notification:TweenPosition(UDim2.fromScale(1.5, Notification.Position.Y.Scale), Enum.EasingDirection.InOut, Enum.EasingStyle.Linear, 0.2, true, function(
                    )
                        if Notification.Parent then
                            Notification:Destroy()
                        end
                    end)
                end))
            end
            function Library.Window(self, title)
                return self._trove:Add(Window.new(self._container, title))
            end

            return Library
        end

        function __DARKLUA_BUNDLE_MODULES.r()
            local v = __DARKLUA_BUNDLE_MODULES.cache.r

            if not v then
                v = {
                    c = __modImpl(),
                }
                __DARKLUA_BUNDLE_MODULES.cache.r = v
            end

            return v.c
        end
    end
end

local gameData = __DARKLUA_BUNDLE_MODULES.a()
local lrmApi = __DARKLUA_BUNDLE_MODULES.b()
local Library = __DARKLUA_BUNDLE_MODULES.r()

__DARKLUA_BUNDLE_MODULES.n()
lrmApi.SetScriptId(gameData.Url:split('/')[7]:sub(1, -5))

local DISCORD_INVITE = 'https://discord.gg/3FaZ3wx2wV'
local LINKVERTISE_REWARDS_URL = 'https://ads.luarmor.net/get_key?for=Rocult-OYCBxRfuZPAJ'
local KEY_PATH = 'rocult_key.txt'

if not game:IsLoaded() then
    game.Loaded:Wait()
end

getgenv().setthreadidentity = getgenv().setthreadidentity or function() end

local library = Library.new()
local defaultKeyStatus
local loadScript = function()
    library:Destroy()
    lrmApi.LoadScript()
end

script_key = script_key

if isfile(KEY_PATH) then
    local savedKey = readfile(KEY_PATH)
    local keyStatus = lrmApi.CheckKey(savedKey)

    if keyStatus.code == 'KEY_VALID' then
        script_key = savedKey

        loadScript()

        return
    else
        delfile(KEY_PATH)

        defaultKeyStatus = lrmApi.GetApiError(keyStatus.code)
    end
end
if gameData.FFA then
    if not gameData.Freemium then
        script_key = nil

        loadScript()

        return
    end
    if not script_key then
        loadScript()

        return
    end
    if type(script_key) == 'string' then
        script_key = script_key:gsub('%s+', '')

        local keyStatus = lrmApi.CheckKey(script_key)

        if keyStatus.code == 'KEY_VALID' then
            loadScript()

            return
        end

        defaultKeyStatus = lrmApi.GetApiError(keyStatus.code)
    end
end
if type(script_key) == 'string' then
    script_key = script_key:gsub('%s+', '')

    local keyStatus = lrmApi.CheckKey(script_key)

    if keyStatus.code == 'KEY_VALID' then
        loadScript()

        return
    end
end

local main = library:Window('rocult')
local home = main:Tab('', true)
local loginTab = home:Section('Login')
local enteredKey = ''

loginTab:Textbox('Enter Key:', false, false, function(t)
    enteredKey = t
end)

if gameData.FFA then
    loginTab:Label('Script is currently keyless!')
end

local keyUrlLabel

loginTab:Button('Confirm', function()
    enteredKey = enteredKey:gsub('%s+', '')

    if enteredKey == '' then
        if gameData.FFA then
            loadScript()
        end
    end

    local keyStatus = lrmApi.CheckKey(enteredKey)

    if keyStatus.code == 'KEY_VALID' then
        writefile(KEY_PATH, enteredKey)

        script_key = enteredKey

        loadScript()
    else
        keyUrlLabel:SetText(lrmApi.GetApiError(keyStatus.code))
        task.wait(5)
        keyUrlLabel:SetText(string.format('Discord: %s', tostring(DISCORD_INVITE)))
    end
end)
loginTab:Button('Get Key (Linkvertise)', function()
    if setclipboard then
        setclipboard(LINKVERTISE_REWARDS_URL)
        keyUrlLabel:SetText('URL copied to your clipboard')
    else
        keyUrlLabel:SetText("Couldn't copy the URL to your clipboard")
    end

    task.wait(3)
    keyUrlLabel:SetText(string.format('Discord: %s', tostring(DISCORD_INVITE)))
end)
loginTab:Button('Copy Discord Invite', function()
    if setclipboard == nil then
        return
    end

    setclipboard(DISCORD_INVITE)
    keyUrlLabel:SetText('URL copied to your clipboard')
    task.wait(3)
    keyUrlLabel:SetText(string.format('Discord: %s', tostring(DISCORD_INVITE)))
end)

keyUrlLabel = loginTab:Label(defaultKeyStatus or string.format('Discord: %s', tostring(DISCORD_INVITE)))
