--[[
    Cobalt
    A runtime developer tool to monitor and intercept network traffic
    coming from the roblox game engine.
]]--


-- ++++++++ WAX BUNDLED DATA BELOW ++++++++ --

-- Will be used later for getting flattened globals
local ImportGlobals

-- Holds direct closure data (defining this before the DOM tree for line debugging etc)
local ClosureBindings = {
    function()local wax,script,require=ImportGlobals(1)local ImportGlobals return (function(...)wax.shared.CobaltStartTime = tick()

local FileLogger = require(script.Utils.FileLog)

-- Environment
for _, Service in pairs({
	"ContentProvider",
	"CoreGui",
	"TweenService",
	"Players",
	"RunService",
	"HttpService",
	"UserInputService",
	"TextService",
	"StarterGui",
}) do
	wax.shared[Service] = cloneref(game:GetService(Service))
end

wax.shared.CobaltVerificationToken = wax.shared.HttpService:GenerateGUID()
wax.shared.SaveManager = require(script.Utils.SaveManager)
wax.shared.Settings = {}

wax.shared.Hooks = {}

-- Executor Support
wax.shared.ExecutorName = identifyexecutor()
wax.shared.ExecutorSupport = require(script.ExecutorSupport)

-- Utils
require(script.Utils.Connect)
wax.shared.Hooking = require(script.Utils.Hooking)

-- UI
wax.shared.Sonner = require(script.Utils.UI.Sonner)

-- Code Generation
local LuaEncode = require(script.Utils.Serializer.LuaEncode)
wax.shared.LuaEncode = LuaEncode

local CodeGen = require(script.Utils.CodeGen.Generator)

-- Variables
if not wax.shared.Players.LocalPlayer then
	wax.shared.Players.PlayerAdded:Wait()
end
wax.shared.LocalPlayer = wax.shared.Players.LocalPlayer
local ContendingPlayerScripts = cloneref(wax.shared.LocalPlayer:QueryDescendants("PlayerScripts")[1] or wax.shared.LocalPlayer)
if ContendingPlayerScripts:IsA("PlayerScripts") then
	wax.shared.PlayerScripts = ContendingPlayerScripts
else
	wax.shared.PlayerScripts = nil

	local ChildAddedConnection
	ChildAddedConnection = wax.shared.Connect(wax.shared.LocalPlayer.ChildAdded:Connect(function(Child)
		if Child:IsA("PlayerScripts") then
			wax.shared.PlayerScripts = cloneref(Child)
			wax.shared.Disconnect(ChildAddedConnection)
		end
	end))
end

-- Functions
wax.shared.gethui = gethui or function()
	return wax.shared.CoreGui
end
wax.shared.checkcaller = checkcaller or function()
	return nil
end
wax.shared.restorefunction = function(Function: (...any) -> ...any, Silent: boolean?)
	local Original = wax.shared.Hooks[Function]

	if Silent and not Original then
		return
	end

	assert(Original, "Function not hooked")

	if restorefunction and isfunctionhooked(Function) then
		restorefunction(Function)
	else
		wax.shared.Hooking.HookFunction(Function, Original)
	end

	wax.shared.Hooks[Function] = nil
end
wax.shared.getrawmetatable = wax.shared.ExecutorSupport["getrawmetatable"].IsWorking
		and (getrawmetatable or debug.getmetatable)
	or function()
		return setmetatable({}, {
			__index = function()
				return function() end
			end,
		})
	end

wax.shared.newcclosure = wax.shared.ExecutorName == "AWP"
		and function(f, name)
			local env = getfenv(f)
			local x = setmetatable({
				__F = f,
			}, {
				__index = env,
				__newindex = env,
			})

			local nf = function(...)
				return __F(...)
			end

			setfenv(nf, x) -- set func env (env of nf gets deoptimized)
			return newcclosure(nf, name)
		end
	or newcclosure
wax.shared.queue_on_teleport = queue_on_teleport or queueonteleport or function(...) end

wax.shared.IsPlayerModule = function(Origin: LocalScript | ModuleScript, Instance: Instance): boolean
	if Instance and Instance.ClassName ~= "BindableEvent" then
		return false
	end

	if not Origin or typeof(Origin) ~= "Instance" or not Origin.IsA(Origin, "LuaSourceContainer") then
		return false
	end

	local PlayerModule = Origin and Origin.FindFirstAncestor(Origin, "PlayerModule") or nil
	if not PlayerModule then
		return false
	end

	if PlayerModule.Parent == nil then
		return true
	end

	if wax.shared.PlayerScripts then
		return compareinstances(PlayerModule.Parent, wax.shared.PlayerScripts)
	end

	return false
end
wax.shared.ShouldIgnore = function(Instance, Origin)
	return wax.shared.Settings.IgnoredRemotesDropdown.Value[Instance.ClassName] == true
		or (wax.shared.Settings.IgnorePlayerModule.Value and wax.shared.IsPlayerModule(Origin, Instance))
end

wax.shared.GetTableLength = function(Table)
	if Table["n"] then
		return Table.n
	end

	local Length = 0
	for _, _ in pairs(Table) do
		Length += 1
	end
	return Length
end
wax.shared.JoinTable = function(Table, Prefix, Suffix)
	local FinalString = ""
	for _, Value in pairs(Table) do
		FinalString ..= Prefix .. tostring(Value) .. Suffix
	end

	FinalString = string.sub(FinalString, 1, string.len(FinalString) - string.len(Suffix))

	return FinalString
end
wax.shared.GetTextBounds = function(Text: string, Font: Font, Size: number, Width: number?): (number, number)
	local Params = Instance.new("GetTextBoundsParams")
	Params.Text = Text
	Params.RichText = true
	Params.Font = Font
	Params.Size = Size
	Params.Width = Width or workspace.CurrentCamera.ViewportSize.X - 32

	local Bounds = wax.shared.TextService:GetTextBoundsAsync(Params)
	Params:Destroy()
	
	return Bounds.X, Bounds.Y
end

wax.shared.Unloaded = false
wax.shared.Unload = function()
	local PluginManager = wax.shared.CobaltPluginManager
	if PluginManager then
		for _, Plugin in PluginManager.Registry.Plugins do
			if not Plugin.UnloadCallbacks then
				continue
			end
			
			for _, Callback in Plugin.UnloadCallbacks or {} do
				task.spawn(pcall, Callback)
			end
		end
	end

	for _, Connection in pairs(wax.shared.Connections) do
		wax.shared.Disconnect(Connection)
	end

	local gameMetatable = wax.shared.getrawmetatable(game)

	if wax.shared.ExecutorSupport["oth"].IsWorking then
		pcall(oth.unhook, gameMetatable.__namecall)
		pcall(oth.unhook, gameMetatable.__newindex)
	else
		if wax.shared.ExecutorSupport["restorefunction"].IsWorking and not wax.shared.AlternativeEnabled then
			pcall(restorefunction, gameMetatable.__namecall)
			pcall(restorefunction, gameMetatable.__newindex)
		else
			wax.shared.Hooking.HookMetaMethod(game, "__namecall", wax.shared.NamecallHook)
			wax.shared.Hooking.HookMetaMethod(game, "__newindex", wax.shared.NewIndexHook)
		end
	end

	for Function, Original in pairs(wax.shared.Hooks) do
		if wax.shared.ExecutorSupport["oth"].IsWorking then
			task.spawn(pcall, oth.unhook, Function)
		elseif wax.shared.ExecutorSupport["restorefunction"].IsWorking then
			task.spawn(pcall, wax.shared.restorefunction, Function)
		else
			pcall(wax.shared.Hooking.HookFunction, Function, Original)
		end
	end

	if wax.shared.ActorCommunicator then
		pcall(function()
			wax.shared.ActorCommunicator:Fire("Unload")
		end)
	end

	getgenv().CobaltInitialized = false
	getgenv().Cobalt = nil

	wax.shared.Communicator:Destroy()
	wax.shared.ScreenGui:Destroy()

	wax.shared.Unloaded = true
end

local AnticheatData = require(script.Utils.Anticheats.Main)

-- Load Script
wax.shared.Communicator = Instance.new("BindableEvent")

wax.shared.SetupLoggingConnection = function()
	if wax.shared.LogConnection then
		wax.shared.LogConnection:Disconnect()
	end

	wax.shared.LogFileName = `Cobalt/Logs/{DateTime.now():ToIsoDate():gsub(":", "_")}.log`
	local FileLog = FileLogger.new(wax.shared.LogFileName, FileLogger.LOG_LEVELS.INFO, true)

	return function(RemoteInstance, Type, CallOrderInLog)
		local LogEntry = wax.shared.Logs[Type][RemoteInstance]
		if not LogEntry then
			return
		end

		local CallDataFromHook = LogEntry.Calls[CallOrderInLog]

		local success, err = pcall(function()
			local generatedCode = CodeGen:BuildCallCode(setmetatable({
				Instance = RemoteInstance,
				Type = Type,
			}, {
				__index = CallDataFromHook,
			}) :: any)

			local comprehensiveDataToSerialize = {
				RemoteInstanceInfo = {
					Name = RemoteInstance and RemoteInstance.Name,
					ClassName = RemoteInstance and RemoteInstance.ClassName,
					Path = RemoteInstance and CodeGen.GetFullPath(RemoteInstance, {
						DisableNilParentHandler = true,
					}),
				},
				EventType = Type,
				CallOrderInLog = CallOrderInLog,
				DataFromHook = CallDataFromHook,
			}

			local serializedEventData = LuaEncode(
				comprehensiveDataToSerialize,
				{ Prettify = true, InsertCycles = true, UseInstancePaths = true }
			)

			local instanceName = RemoteInstance and RemoteInstance.Name or "UnknownInstance"
			local instanceClassName = RemoteInstance and RemoteInstance.ClassName or "UnknownClass"
			local instancePath = RemoteInstance and CodeGen.GetFullPath(RemoteInstance, {
				DisableNilParentHandler = true
			}) or "UnknownPath"

			local logParts = {
				("Instance: %s (%s)"):format(instanceName, instanceClassName),
				("Path: %s"):format(instancePath),
				("Status: %s"):format(CallDataFromHook and CallDataFromHook.Blocked and "Blocked" or "Allowed"),
				("Call Order In Log: %s"):format(CallOrderInLog or "N/A"),
				"-------------------- Event Data --------------------",
				serializedEventData,
				"-------------------- Generated Code --------------------",
				generatedCode,
			}
			local logMessage = table.concat(logParts, "\n\t")
			local threadId = ("%s:%s"):format(Type or "S", instanceName)

			FileLog:Info(threadId, logMessage)
		end)

		if not success then
			local instanceNameForError = RemoteInstance and RemoteInstance.Name or "Unknown"
			FileLog:Error(
				"Logger",
				("Failed to log remote communication for %s:%s - %s"):format(
					Type or "UnknownType",
					instanceNameForError,
					tostring(err)
				)
			)

			warn(
				("Cobalt: Failed to log remote communication for %s:%s - %s"):format(
					Type or "UnknownType",
					instanceNameForError,
					tostring(err)
				)
			)
		end
	end
end

if wax.shared.SaveManager:GetState("EnableLogging", false) then
	local LogConnection = wax.shared.SetupLoggingConnection()
	wax.shared.LogConnection = wax.shared.Connect(wax.shared.Communicator.Event:Connect(LogConnection))
end

wax.shared.Log = require(script.Utils.Log)
wax.shared.Logs = {
	Outgoing = {},
	Incoming = {},
}

wax.shared.NewLog = function(Instance, Type, Method, CallingScript)
	local Log =
		wax.shared.Log.new(Instance, Type, Method, wax.shared.GetTableLength(wax.shared.Logs[Type]) + 1, CallingScript)
	wax.shared.Logs[Type][Instance] = Log
	return Log
end

require(script.Window)
require(script.Spy.Init)

local PluginManager = require(script.Utils.Plugins.Manager)
PluginManager.SetupPlugins()

wax.shared.CobaltPluginManager = PluginManager

wax.shared.Connect(wax.shared.LocalPlayer.OnTeleport:Connect(function()
	if not wax.shared.SaveManager:GetState("ExecuteOnTeleport", false) then
		return
	end

	-- getgenv().COBALT_LATEST_URL for dev environments
	local CobaltURL = getgenv().COBALT_LATEST_URL
		or "https://github.com/notpoiu/cobalt/releases/latest/download/Cobalt.luau"
	wax.shared.queue_on_teleport(string.format(
		[[
		if getgenv().CobaltAutoExecuted then
			return
		end

		getgenv().CobaltAutoExecuted = true
		loadstring(game:HttpGet("%s"))()
	]],
		CobaltURL
	))
end))

getgenv().Cobalt = wax

task.wait(1)
if AnticheatData.Disabled then
	wax.shared.Sonner.success(`Cobalt has bypassed {AnticheatData.Name} (anticheat detected)`)
end

end)() end,
    function()local wax,script,require=ImportGlobals(2)local ImportGlobals return (function(...)--[[

	Very lightweight checks for various executor functions and reports whether they are working or not.
	Some checks also verify that the function works as intended, not just that it exists.

]]

local ExecutorSupport = {
	FailedChecks = {
		Essential = {},
		NonEssential = {},
	},
}

local BrokenFeatures = {
	["Volcano"] = { "oth", "run_on_actor" },
	["Potassium"] = { "oth" } -- submit a pr to luau
}

local function CheckFFlagValue(Name: string, Value: any)
	local Success, Result = pcall(getfflag, Name)
	if not Success then
		return false
	end

	if typeof(Result) == "boolean" then
		return Result
	end

	if typeof(Result) == "string" then
		return Result == tostring(Value)
	end

	return false
end

local function test(name, Callback, CheckType, Essential)
	local TestFunction = not CheckType and Callback or function()
		assert(typeof(Callback) == "function", string.format("%s is not a function.", name))
		return "Passed nil check."
	end

	if Essential == nil then
		Essential = true
	end

	local Success, Result
	if BrokenFeatures[wax.shared.ExecutorName] and table.find(BrokenFeatures[wax.shared.ExecutorName], name) then
		Success = false
		Result = "This function/library is broken or can crash your game on this executor."
	else
		Success, Result = pcall(TestFunction)
	end

	ExecutorSupport[name] = {
		IsWorking = Success,
		Details = Result,
		Essential = Essential,
	}

	if not Success then
		if Essential then
			table.insert(ExecutorSupport.FailedChecks.Essential, name)
		else
			table.insert(ExecutorSupport.FailedChecks.NonEssential, name)
		end
	end
end

-- FFlag Library
test("getfflag", getfflag, true)
test("setfflag", setfflag, true)

-- Actor Library
test("getactors", getactors, true)
test("run_on_actor", run_on_actor, true)
test("create_comm_channel", create_comm_channel, true)

-- Closure Library
test("newcclosure", function()
	assert(typeof(newcclosure) == "function", "newcclosure is not a function")
	local CClosure = newcclosure(function()
		return true
	end)

	assert(typeof(CClosure) == "function", "newcclosure did not return a function")
	assert(CClosure() == true, "Failed to create a new closure")

	assert(debug.info(CClosure, "s") == "[C]", "newcclosure did not create a C closure")
end, true)

test("checkcaller", checkcaller, true)
test("getcallingscript", getcallingscript, true)

test("hookfunction", function()
	assert(typeof(hookfunction) == "function", "hookfunction is not a function")

	local function Original(a, b)
		return a + b
	end

	local ref = hookfunction(Original, function(a, b)
		return a * b
	end)

	assert(Original(2, 3) == 6, "Failed to hook a function and change the return value")
	assert(ref(2, 3) == 5, "Did not return the original function")
end)
test("isfunctionhooked", function()
	assert(typeof(isfunctionhooked) == "function", "isfunctionhooked is not a function")
	assert(typeof(hookfunction) == "function", "hookfunction is required for this test")

	local function Original(a, b)
		return a + b
	end

	assert(isfunctionhooked(Original) == false, "isfunctionhooked returned true for an unhooked function")

	hookfunction(Original, function(a, b)
		return a * b
	end)

	assert(isfunctionhooked(Original) == true, "isfunctionhooked returned false for a hooked function")
end)
test("restorefunction", function()
	assert(typeof(restorefunction) == "function", "restorefunction is not a function")
	assert(typeof(hookfunction) == "function", "hookfunction is required for this test")

	local function Original(a, b)
		return a + b
	end

	hookfunction(Original, function(a, b)
		return a * b
	end)

	assert(Original(2, 3) == 6, "Failed to hook a function and change the return value")

	restorefunction(Original)

	assert(Original(2, 3) == 5, "restorefunction did not restore the original function")
end)

test("setstackhidden", function()
	assert(typeof(setstackhidden) == "function", "setstackhidden is not a function")

	local StackCheck = {}

	local CallerFunctionSource = [[
		local StackCheck = ...
		local function CallerFunction()
			return StackCheck[1]()
		end
		return CallerFunction
	]]

	local CallerFunction = (loadstring(CallerFunctionSource, "=CallerFunction") :: (...any) -> ...any)(StackCheck)

	setstackhidden(CallerFunction, true)

	StackCheck[1] = function()
		return debug.info(2, "f") ~= CallerFunction
	end

	local IsHidden = CallerFunction()
	assert(IsHidden == true, "setstackhidden did not hide the function from the stack (debug.info)")

	StackCheck[1] = function()
		return not debug.traceback():find("CallerFunction")
	end

	IsHidden = CallerFunction()
	assert(IsHidden == true, "setstackhidden did not hide the function from the stack (debug.traceback)")

	local TestTable = { math.huge, 0 / 0, 123, 58913 } :: { any }
	setfenv(CallerFunction, TestTable)

	StackCheck[1] = function()
		return getfenv(2) ~= TestTable
	end

	IsHidden = CallerFunction()
	assert(IsHidden == true, "setstackhidden did not hide the function from the stack (getfenv)")

	StackCheck[1] = function()
		return not select(2, pcall(error, "", 3)):find("CallerFunction")
	end

	IsHidden = CallerFunction()
	assert(IsHidden == true, "setstackhidden did not hide the function from the stack (error with level traceback)")
end, false, false)

-- Oth Library
test("oth", function()
	assert(oth ~= nil, "oth library not found")

	assert(typeof(oth.hook) == "function", "oth.hook is not a function")
	assert(hookfunction ~= oth.hook, "oth.hook is an alias of hookfunction")

	assert(typeof(oth.unhook) == "function", "oth.unhook is not a function")
	assert(restorefunction ~= oth.unhook, "oth.unhook is an alias of restorefunction")

	assert(typeof(oth.is_hook_thread) == "function", "oth.is_hook_thread is not a function")
	assert(typeof(oth.get_original_thread) == "function", "oth.get_original_thread is not a function")

	local VIM = Instance.new("VirtualInputManager")
	local Origin = coroutine.running()

	local Working = nil

	local Old
	Old = oth.hook(VIM.SendGravityEvent, function(...)
		if Working == nil then
			Working = (Origin ~= coroutine.running() and oth.is_hook_thread() and oth.get_original_thread() == Origin)
			return
		end

		return Old(...)
	end)

	pcall(VIM.SendGravityEvent, VIM, 0, 0, 0)

	repeat
		task.wait()
	until Working ~= nil
	local Success, Error = pcall(oth.unhook, VIM.SendGravityEvent, Old)

	VIM:Destroy()

	assert(Working, "oth.hook is not running on a seperate thread")
	assert(Success, "oth.unhook failed: " .. tostring(Error))

	assert(typeof(getrawmetatable) == "function", "getrawmetatable is required to validate oth __namecall returns")
	assert(typeof(getnamecallmethod) == "function", "getnamecallmethod is required to validate oth __namecall returns")

	local function CheckInvokeResult(Result, Context)
		if Result.n ~= 4 then
			return false, `{Context}: returned {Result.n} values instead of 4`
		end
		if Result[1] ~= "expected" then
			return false, `{Context}: did not preserve the first return value`
		end
		if Result[2] ~= 123 then
			return false, `{Context}: did not preserve the second return value`
		end
		if Result[3] ~= nil then
			return false, `{Context}: did not preserve the nil return value`
		end
		if Result[4] ~= "tail" then
			return false, `{Context}: did not preserve the tail return value`
		end

		return true
	end

	local Bindable = Instance.new("BindableFunction")
	Bindable.OnInvoke = function() return "expected", 123, nil, "tail" end

	local SuccededInsideHook, InsideError = false, nil

	local OldNamecall
	OldNamecall = oth.hook(getrawmetatable(game).__namecall, function(...)
		local self = ...
		local Method = getnamecallmethod()

		if self == Bindable and Method == "Invoke" then
			pcall(function() end)
			
			local Result = table.pack(OldNamecall(...))

			SuccededInsideHook, InsideError = CheckInvokeResult(
				Result,
				"Result corruption in __namecall oth hook"
			)

			return table.unpack(Result, 1, Result.n)
		end

		return OldNamecall(...)
	end)

	local Result = table.pack(Bindable:Invoke())
	pcall(oth.unhook, getrawmetatable(game).__namecall)
	Bindable:Destroy()

	assert(SuccededInsideHook, InsideError)
	assert(CheckInvokeResult(
		Result,
		"Result corruption post oth hook and pcall"
	))
end, false, false)

-- Metamethod
test("hookmetamethod", function()
	assert(typeof(hookmetamethod) == "function", "hookmetamethod is not a function")

	local object = setmetatable({}, {
		__index = newcclosure(function()
			return false
		end),
		__metatable = "Locked!",
	})

	local ref = hookmetamethod(object, "__index", function()
		return true
	end)

	assert(object.test == true, "Failed to hook a metamethod and change the return value")
	assert(ref() == false, "Did not return the original function")
end)
test("getnamecallmethod", function()
	assert(typeof(getnamecallmethod) == "function", "getnamecallmethod is not a function")

	pcall(function()
		game:TEST_NAMECALL_METHOD()
	end)

	assert(getnamecallmethod() == "TEST_NAMECALL_METHOD", "getnamecallmethod did not return the real namecall method")
end)
test("getrawmetatable", function()
	assert(typeof(getrawmetatable) == "function", "getrawmetatable is not a function")

	local BaseLockedMetatable = {
		__index = function()
			return false
		end,
		__metatable = "Locked!",
	}

	local TestMetatable = setmetatable({}, BaseLockedMetatable)

	local FetchedMetatable = getrawmetatable(TestMetatable)
	assert(typeof(FetchedMetatable) == "table", "getrawmetatable did not return a table")

	assert(FetchedMetatable.__index() == false, "getrawmetatable did not return the correct metatable [__index()]")
	assert(
		FetchedMetatable.__metatable == "Locked!",
		"getrawmetatable did not return the correct metatable [locked mt check]"
	)

	assert(
		FetchedMetatable == BaseLockedMetatable,
		"getrawmetatable did not return the correct metatable [mt eq check]"
	)
end)

-- Instance Library
test("getcallbackvalue", function()
	assert(typeof(getcallbackvalue) == "function", "getcallbackvalue is not a function")

	local bindable = Instance.new("BindableFunction")
	local InvokeRan = false
	local InvokeFunction = function(value)
		InvokeRan = true
		return value * 2
	end
	bindable.OnInvoke = InvokeFunction

	local FetchedInvoke = getcallbackvalue(bindable, "OnInvoke")
	bindable:Destroy()

	assert(typeof(FetchedInvoke) == "function", "getcallbackvalue did not return a function")

	assert(FetchedInvoke(5) == 10, "getcallbackvalue's function return did not match expected value")
	assert(InvokeRan, "getcallbackvalue's function did not run")
end)
test("getnilinstances", function()
	assert(typeof(getnilinstances) == "function", "getnilinstances is not a function")

	local NilInstances = getnilinstances()
	assert(typeof(NilInstances) == "table", "getnilinstances did not return a table")
end)
test("getconnections", function()
	assert(typeof(getconnections) == "function", "getconnections is not a function")

	local Event = Instance.new("BindableEvent")
	local ConnectionFunction = function() end
	local OnceFunction = function() end

	Event.Event:Connect(ConnectionFunction)
	Event.Event:Once(OnceFunction)
	task.spawn(function()
		Event.Event:Wait()
	end)

	local Connections = getconnections(Event.Event)

	assert(typeof(Connections) == "table", "getconnections did not return a table")
	assert(#Connections == 3, "getconnections did not return the correct number of connections")

	local FoundFunctions = {}
	for _, Connection in Connections do
		local _, ConnFunc = pcall(function()
			return Connection.Function
		end)

		if typeof(ConnFunc) == "function" then
			table.insert(FoundFunctions, ConnFunc)
		end
	end

	assert(
		table.find(FoundFunctions, ConnectionFunction) ~= nil,
		"getconnections did not return the correct connection [:Connect()]"
	)
	assert(
		table.find(FoundFunctions, OnceFunction) ~= nil,
		"getconnections did not return the correct connection [:Once()]"
	)

	Event:Destroy()
end)
test("firesignal", function()
	assert(typeof(firesignal) == "function", "firesignal is not a function")

	local event = Instance.new("BindableEvent")
	local fired = false

	event.Event:Once(function(value)
		fired = value
	end)

	firesignal(event.Event, true)
	task.wait(0.1)
	event:Destroy()

	assert(fired, "Failed to fire a BindableEvent")
end)
test("cloneref", function()
	assert(typeof(cloneref) == "function", "cloneref is not a function")

	local ref = cloneref(game)
	assert(ref ~= game, "cloneref did not create a ref to instance")
	assert(typeof(ref) == "Instance", "cloneref did not return an instance")
end)
test("compareinstances", function()
	assert(typeof(compareinstances) == "function", "compareinstances is not a function")
	assert(typeof(cloneref) == "function", "cloneref is required for this test")

	assert(compareinstances(game, cloneref(game)) == true, "compareinstances did not return true for the same instance")
	assert(compareinstances(game, workspace) == false, "compareinstances did not return false for different instances")
end)

if CheckFFlagValue("DebugRunParallelLuaOnMainThread", false) and not ExecutorSupport["run_on_actor"].IsWorking then
	task.spawn(function()
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end

		local GameUsesActors = false

		local CategoryToSearch = { game:QueryDescendants("Actor") }
		if ExecutorSupport["getnilinstances"].IsWorking then
			table.insert(CategoryToSearch, getnilinstances())
		end

		for _, Category in CategoryToSearch do
			if GameUsesActors then
				break
			end

			for _, Instance in Category do
				if not Instance:IsA("Actor") then
					continue
				end

				GameUsesActors = true
				break
			end
		end

		if not GameUsesActors then
			return
		end

		local bindable = Instance.new("BindableFunction")

		function bindable.OnInvoke(response)
			if response == "Enable Fix" then
				setfflag("DebugRunParallelLuaOnMainThread", "true")
				wax.shared.StarterGui:SetCore("SendNotification", {
					Title = "Cobalt",
					Text = "Please rejoin for the fix to take effect!",
					Duration = math.huge,
				})
			end

			bindable:Destroy()
		end

		wax.shared.StarterGui:SetCore("SendNotification", {
			Title = "Cobalt",
			Text = "This game may use remotes in a way that your executor can't intercept. You can enable the fix and rejoin to detect them.",
			Duration = math.huge,
			Callback = bindable,
			Button1 = "Enable Fix",
			Button2 = "Dismiss",
		})
	end)
end

return ExecutorSupport

end)() end,
    [17] = function()local wax,script,require=ImportGlobals(17)local ImportGlobals return (function(...)--[[
    Bypasses for popular roblox anticheats
]]

local AnticheatData = {
	Disabled = false,
	Name = "N/A",
}

local BypassEnabled = wax.shared.SaveManager:GetState("AnticheatBypass", false)
if not BypassEnabled then
	return AnticheatData
end

type Bypass = {
	Name: string,
	Game: string | number | { number } | { string },
	Detect: () -> boolean,
	Bypass: () -> boolean,
}

local GeneralPurposeBypasses: { Bypass } = {}
local DedicatedPlaceACBypass: Bypass = nil

local AnticheatBypasses = script.Parent.impl
for _, Anticheat in AnticheatBypasses:GetChildren() do
	local Data = require(Anticheat) :: Bypass

	local IsDedicatedACBypass = (
		if typeof(Data.Game) == "table"
			then (table.find(Data.Game, game.PlaceId) or table.find(Data.Game, tostring(game.PlaceId)))
			else (tostring(Data.Game) == tostring(game.PlaceId))
	)

	if IsDedicatedACBypass then
		DedicatedPlaceACBypass = Data
		break
	end

	if Data.Game ~= "*" then
		continue
	end

	table.insert(GeneralPurposeBypasses, Data)
end

if DedicatedPlaceACBypass and DedicatedPlaceACBypass.Detect() then
	DedicatedPlaceACBypass.Bypass()

	AnticheatData.Name = DedicatedPlaceACBypass.Name
	AnticheatData.Disabled = true
	return AnticheatData
end

for _, Data in GeneralPurposeBypasses do
	if not Data.Detect() then
		continue
	end

	if Data.Bypass() then
		AnticheatData.Name = Data.Name
		AnticheatData.Disabled = true
		break
	end
end

return AnticheatData

end)() end,
    [40] = function()local wax,script,require=ImportGlobals(40)local ImportGlobals return (function(...)local UIHelper = {}

local CodeGen = require(script.Parent.Parent.CodeGen.Generator)

function UIHelper.IsMouseOverFrame(Frame: GuiObject, Position: Vector3): boolean
	local AbsPos, AbsSize = Frame.AbsolutePosition, Frame.AbsoluteSize
	return Position.X >= AbsPos.X
		and Position.X <= AbsPos.X + AbsSize.X
		and Position.Y >= AbsPos.Y
		and Position.Y <= AbsPos.Y + AbsSize.Y
end

function UIHelper.IsClickInput(Input: InputObject): boolean
	return Input.UserInputState == Enum.UserInputState.Begin
		and (Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch)
end

function UIHelper.IsMoveInput(Input: InputObject): boolean
	return Input.UserInputState == Enum.UserInputState.Change
		and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch)
end

function UIHelper.QuickSerializeNumber(Number: number)
	if Number % 1 ~= 0 then
		return string.format("%.3f", Number)
	elseif Number == 1 / 0 then
		return "math.huge"
	elseif Number == -1 / 0 then
		return "-math.huge"
	end

	return Number
end

function UIHelper.QuickSerializeArgument(Argument)
	if typeof(Argument) == "string" then
		return string.format('"%s"', Argument)
	elseif typeof(Argument) == "number" then
		return UIHelper.QuickSerializeNumber(Argument)
	elseif typeof(Argument) == "Vector2" then
		return string.format(
			"%s, %s",
			UIHelper.QuickSerializeNumber(Argument.X),
			UIHelper.QuickSerializeNumber(Argument.Y)
		)
	elseif typeof(Argument) == "Vector3" then
		return string.format(
			"%s, %s, %s",
			UIHelper.QuickSerializeNumber(Argument.X),
			UIHelper.QuickSerializeNumber(Argument.Y),
			UIHelper.QuickSerializeNumber(Argument.Z)
		)
	elseif typeof(Argument) == "CFrame" then
		local Components = { Argument:GetComponents() }
		for Index, Value in pairs(Components) do
			Components[Index] = UIHelper.QuickSerializeNumber(Value)
		end
		return table.concat(Components, ", ")
	elseif typeof(Argument) == "table" then
		return "{...}"
	elseif typeof(Argument) == "Instance" then
		return CodeGen.GetFullPath(Argument, { DisableNilParentHandler = true })
	elseif typeof(Argument) == "userdata" then
		return "newproxy(" .. getmetatable(Argument) and "true" or "false" .. ")"
	end

	return tostring(Argument)
end

return UIHelper

end)() end,
    [38] = function()local wax,script,require=ImportGlobals(38)local ImportGlobals return (function(...)local AssetManager = {
	FallbackMapping = {
		Logo = "rbxassetid://91685317120520",
	},
	SessionLoadedFonts = {},
}

if not isfolder("Cobalt/Assets") then
	makefolder("Cobalt/Assets")
end

function SafeFetchCustomContentID(Path: string)
	local Success, Result = pcall(function()
		return getcustomasset(Path)
	end)

	return Success and Result or nil
end

function SafeFetchCustomImgData(url)
	local Success, Response = pcall(request, {
		Url = url,
		Method = "GET",
	})

	if Success and Response.Success or Response.StatusCode >= 200 and Response.StatusCode < 300 then
		return Response.Body
	end

	return nil
end

function AssetManager.GetRemoteImages(Images: { [string]: string })
	if not getcustomasset then
		return Images
	end

	local NewImages = {}
	for ClassName, Image in Images do
		if isfile(`Cobalt/Assets/{ClassName}.png`) then
			NewImages[ClassName] = SafeFetchCustomContentID(`Cobalt/Assets/{ClassName}.png`) or Image
			continue
		end

		local IconRawData = SafeFetchCustomImgData(`https://robloxapi.github.io/ref/icons/dark/{ClassName}.png`)
		if not IconRawData then
			NewImages[ClassName] = Image
			continue
		end

		writefile(
			`Cobalt/Assets/{ClassName}.png`,
			IconRawData
		)

		NewImages[ClassName] = SafeFetchCustomContentID(`Cobalt/Assets/{ClassName}.png`) or Image
	end

	return NewImages
end

function AssetManager.GetImage(Image: string)
	if not getcustomasset then
		return AssetManager.FallbackMapping[Image] or Image
	end

	if isfile(`Cobalt/Assets/{Image}.png`) then
		return SafeFetchCustomContentID(`Cobalt/Assets/{Image}.png`) or AssetManager.FallbackMapping[Image] or Image
	end

	local IconRawData = SafeFetchCustomImgData(`https://raw.githubusercontent.com/notpoiu/cobalt/refs/heads/main/Assets/{Image}.png`)

	if not IconRawData then
		return AssetManager.FallbackMapping[Image] or Image
	end

	writefile(`Cobalt/Assets/{Image}.png`, IconRawData)
	return SafeFetchCustomContentID(`Cobalt/Assets/{Image}.png`) or AssetManager.FallbackMapping[Image] or Image
end

function AssetManager.GetCustomFont(FontData: {
	Name: string,
	Url: string,

	FallbackId: number,
})
	if not getcustomasset then
		return FontData.FallbackId
	end

	local TTFPath = `Cobalt/Assets/{FontData.Name}.ttf`
	if not isfile(TTFPath) then
		local FontRawData = SafeFetchCustomImgData(FontData.Url)
		if not FontRawData then return Font.fromId(FontData.FallbackId) end

		writefile(TTFPath, FontRawData)
	end

	if not AssetManager.SessionLoadedFonts[FontData.Name] then
		writefile(`Cobalt/Assets/{FontData.Name}.font`, wax.shared.HttpService:JSONEncode({
			name = FontData.Name,
			faces = {
				{
					name = "Regular",
					weight = 400,
					style = "normal",
					assetId = SafeFetchCustomContentID(TTFPath) or FontData.FallbackId
				}
			}
		}))

		AssetManager.SessionLoadedFonts[FontData.Name] = true
	end

	local CustomFontId = SafeFetchCustomContentID(`Cobalt/Assets/{FontData.Name}.font`)
	if CustomFontId then
		return Font.new(CustomFontId)
	end

	return Font.fromId(FontData.FallbackId)
end

return AssetManager

end)() end,
    [39] = function()local wax,script,require=ImportGlobals(39)local ImportGlobals return (function(...)local Drag = {
	Dragging = false,
	Frame = nil,
	FramePosition = nil,
	FrameSize = nil, -- Added to store initial frame size
	StartPosition = nil,
	ChangedConnection = nil,
	Callback = nil,
}

local Helper = require(script.Parent.Helper)

local function DefaultCallback(_, Input: InputObject)
	local Delta = Input.Position - Drag.StartPosition
	local FramePosition: UDim2 = Drag.FramePosition

	if wax.shared.GetDPIScale then
		Delta = Delta / wax.shared.GetDPIScale()
	end

	Drag.Frame.Position = UDim2.new(
		FramePosition.X.Scale,
		FramePosition.X.Offset + Delta.X,
		FramePosition.Y.Scale,
		FramePosition.Y.Offset + Delta.Y
	)
end

function Drag.Setup(Frame: GuiObject, DragFrame: GuiObject, Callback: (Info: {}, Input: InputObject) -> () | nil)
	Callback = Callback or DefaultCallback

	DragFrame.InputBegan:Connect(function(Input: InputObject)
		if not Helper.IsClickInput(Input) then
			return
		end

		Drag.Dragging = true
		Drag.Frame = Frame
		Drag.FramePosition = Frame.Position
		Drag.StartPosition = Input.Position
		Drag.FrameSize = Frame.Size
		Drag.Callback = Callback

		Drag.ChangedConnection = Input.Changed:Connect(function()
			if Input.UserInputState ~= Enum.UserInputState.End then
				return
			end

			Drag.Dragging = false
			Drag.Frame = nil
			Drag.Callback = nil

			if Drag.ChangedConnection and Drag.ChangedConnection.Connected then
				Drag.ChangedConnection:Disconnect()
				Drag.ChangedConnection = nil
			end
		end)
	end)
end

wax.shared.Connect(wax.shared.UserInputService.InputChanged:Connect(function(Input: InputObject)
	if Drag.Dragging and Drag.Callback and Helper.IsMoveInput(Input) then
		Drag.Callback(Drag, Input)
	end
end))

return Drag

end)() end,
    [43] = function()local wax,script,require=ImportGlobals(43)local ImportGlobals return (function(...)local Interface = {}
local Icons = require(script.Parent.Icons)
local AssetManager = require(script.Parent.AssetManager)

local DefaultFont = AssetManager.GetCustomFont({
	Name = "Inter",
	Url = "https://raw.githubusercontent.com/notpoiu/cobalt/refs/heads/main/Assets/Inter.ttf",

	FallbackId = 12187365364
})

local DefaultProperties = {
	["Frame"] = {
		BorderSizePixel = 0,
	},
	["ScrollingFrame"] = {
		BorderSizePixel = 0,
	},
	["ImageLabel"] = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	},
	["ImageButton"] = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
	},

	["TextLabel"] = {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		FontFace = DefaultFont,
		RichText = true,
		TextColor3 = Color3.new(1, 1, 1),
	},
	["TextButton"] = {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		FontFace = DefaultFont,
		RichText = true,
		TextColor3 = Color3.new(1, 1, 1),
	},
	["TextBox"] = {
		BorderSizePixel = 0,
		FontFace = DefaultFont,
		ClipsDescendants = true,
		RichText = false,
		TextColor3 = Color3.new(1, 1, 1),
	},

	["UIListLayout"] = {
		SortOrder = Enum.SortOrder.LayoutOrder,
	},
}

function Interface.New(ClassName: string, Properties: { [string | number]: any })
	local Object = Instance.new(ClassName)

	for Key, Value in pairs(DefaultProperties[ClassName] or {}) do
		if Properties and Properties[Key] ~= nil then
			continue
		end

		Object[Key] = Value
	end

	for Key, Value in pairs(Properties or {}) do
		if typeof(Value) == "table" then
			local SubObject = Interface.New(Key, Value)
			SubObject.Parent = Object

			continue
		elseif typeof(Key) ~= "string" and typeof(Value) == "Instance" then
			local SubObject = Value:Clone()
			SubObject.Parent = Object

			continue
		end

		Object[Key] = Value
	end

	return Object
end

function Interface.NewIcon(IconName: string, Properties: { [string]: any })
	local Image: ImageLabel = Interface.New("ImageLabel", Properties)
	Icons.SetIcon(Image, IconName)

	return Image
end

function Interface.HideCorner(Frame: GuiObject, Size: UDim2, Offset: Vector2): Frame
	local Hider = Interface.New("Frame", {
		AnchorPoint = Offset or Vector2.zero,
		BackgroundColor3 = Frame.BackgroundColor3,
		Position = UDim2.fromScale(Offset.X or 0, Offset.Y or 0),
		Size = Size,
		ZIndex = Frame.ZIndex,

		Parent = Frame,
	})

	return Hider
end

function Interface.GetScreenParent(): Instance
	local ScreenGui = Interface.New("ScreenGui", {})
	local HiddenUI = wax.shared.gethui()

	for _, Container in { HiddenUI, wax.shared.CoreGui } do
		if pcall(function()
			ScreenGui.Parent = Container
		end) then
			ScreenGui:Destroy()
			return Container
		end
	end

	return wax.shared.LocalPlayer:WaitForChild("PlayerGui")
end

return Interface

end)() end,
    [28] = function()local wax,script,require=ImportGlobals(28)local ImportGlobals return (function(...)local Log = {}
Log.__index = Log

--// Auto Ignore Constants \\--
local SpamCallCountThreshold = 15
local SpamTimeWindowSeconds = 1

function Log.new(Instance, Type, Method, Index, CallingScript)
	local NewLog = setmetatable({
		Instance = Instance,
		Type = Type,
		Method = Method,
		Index = Index,
		Calls = {},
		GameCalls = {},
		SpamHistory = {},
		Ignored = false,
		Blocked = false,
		Button = nil,
	}, Log)

	return NewLog
end

function DeepClone(orig, copies)
	copies = copies or {}

	if typeof(orig) == "Instance" then
		return cloneref(orig)
	elseif typeof(orig) == "userdata" then
		if getmetatable(orig) then
			return newproxy(true)
		else
			return newproxy()
		end
	elseif typeof(orig) == "function" then
		if clonefunction then
			return clonefunction(orig)
		end

		return orig
	elseif type(orig) ~= "table" then
		return orig
	elseif copies[orig] then
		return copies[orig]
	end

	local copy = {}
	copies[orig] = copy
	for k, v in next, orig do
		copy[DeepClone(k, copies)] = DeepClone(v, copies)
	end
	return copy
end

function Log:IsOverSpamThreshold()
	if not wax.shared.SaveManager:GetState("AutoIgnoreSpammyEvents", false) then
		return false
	end

	local Now = tick()
	table.insert(self.SpamHistory, Now)

	for i = #self.SpamHistory, 1, -1 do
		if Now - self.SpamHistory[i] > SpamTimeWindowSeconds then
			table.remove(self.SpamHistory, i)
		end
	end

	if #self.SpamHistory > SpamCallCountThreshold then
		if not self.Ignored then
			self:Ignore()
			wax.shared.Sonner.info(`Ignored {self.Instance.Name} ({self.Type}) due to event spam.`)
		end
		
		return true
	end

	return false
end

local function RunInterceptors(Interceptors: { (...any) -> (...any) }, Info: any, Log): boolean
	for _, Callback in Interceptors do
		local Ok, Result = pcall(Callback, Info, Log.Instance, Log.Type)
		if not Ok then
			warn(`[Cobalt Plugin Interceptor] Error: {Result}`)
		elseif Result == false then
			return true
		end
	end
	return false
end

function Log:Call(RawInfo)
	--// Instance Path Caching \\--
	if
		wax.shared.SaveManager:GetState("CacheInstancePaths", false)
		and self.Instance.IsDescendantOf(self.Instance, game)
	then
		RawInfo.Path = self.Instance.GetFullName(self.Instance)
	end

	--// Ratelimiting \\--
	local Success, Data = pcall(function()
		return self:IsOverSpamThreshold()
	end)

	if Success and Data then return end

	--// Info stuff \\--
	local Info = DeepClone(RawInfo)
	Info.CreationTime = tick()

	--// Plugin Interceptors \\--
	local PluginManager = wax.shared.CobaltPluginManager
	if PluginManager and PluginManager.HasInterceptors then
		-- Run Instance-specific interceptors (both exact type and "All")
		local InstanceIntercept = PluginManager.Registry.Interceptors.Instance[self.Instance]
		if InstanceIntercept then
			if InstanceIntercept[self.Type] and RunInterceptors(InstanceIntercept[self.Type], Info, self) then return end
			if InstanceIntercept["All"] and RunInterceptors(InstanceIntercept["All"], Info, self) then return end
		end

		-- Run Global interceptors (both exact type and "All")
		local GlobalByType = PluginManager.Registry.Interceptors.Global[self.Type]
		if GlobalByType and RunInterceptors(GlobalByType, Info, self) then return end

		local GlobalAll = PluginManager.Registry.Interceptors.Global["All"]
		if GlobalAll and RunInterceptors(GlobalAll, Info, self) then return end
	end
	
	--// Update Log \\--
	local Index = #self.Calls + 1
	self.Calls[Index] = Info
	if not Info.IsExecutor then
		table.insert(self.GameCalls, Index)
	end

	if wax.shared.Communicator then
		wax.shared.Communicator.Fire(wax.shared.Communicator, self.Instance, self.Type, #self.Calls)
	end
end

function Log:Ignore()
	if wax.shared.ActorCommunicator then
		pcall(function()
			wax.shared.ActorCommunicator:Fire("MainIgnore", self.Instance, self.Type)
		end)
	end

	self.Ignored = not self.Ignored

	local IgnoredRemoteList = wax.shared.Settings["IgnoredRemotes"]
	if IgnoredRemoteList then
		if self.Ignored then
			IgnoredRemoteList:AddToList(self)
		else
			IgnoredRemoteList:RemoveFromList(self)
		end
	end
end

local ClassesConnectionsToggle = {
	RemoteEvent = "OnClientEvent",
	UnreliableRemoteEvent = "OnClientEvent",
	BindableEvent = "Event",
}

function Log:SetConnectionsEnabled(enabled: boolean)
	if not self.Instance or not ClassesConnectionsToggle[self.Instance.ClassName] then
		return
	end

	local ConnectionName = ClassesConnectionsToggle[self.Instance.ClassName]
	if self.Type ~= "Incoming" or not ConnectionName then
		return
	end

	local LoggingFunctions = wax.shared.IncomingLogConnectionFunctions
	for _, Connection in pairs(getconnections(self.Instance[ConnectionName])) do
		if LoggingFunctions and LoggingFunctions[Connection.Function] then
			continue
		end

		if enabled then
			Connection:Enable()
		else
			Connection:Disable()
		end
	end
end

function Log:Block()
	if wax.shared.ActorCommunicator then
		pcall(function()
			wax.shared.ActorCommunicator:Fire("MainBlock", self.Instance, self.Type)
		end)
	end

	self.Blocked = not self.Blocked
	self:SetConnectionsEnabled(not self.Blocked)
end

function Log:SetButton(Instance, Name, Calls)
	self.Button = {
		Instance = Instance,
		Name = Name,
		Calls = Calls,
	}
end

return Log

end)() end,
    [35] = function()local wax,script,require=ImportGlobals(35)local ImportGlobals return (function(...)local SignalHandler = {
	Signals = {},
}

function SignalHandler.New(self)
	local Signal = {
		Connections = {},
		Disconnect = nil,
	}

	function Signal:Connect(callback)
		local connection = {
			Connected = true,
			Enabled = true,
			Callback = callback,
		}

		function connection:Disconnect()
			connection.Connected = false
		end

		function connection:Reconnect()
			if not connection.Enabled then
				return
			end

			connection.Connected = true
		end

		function connection:Enable()
			connection.Enabled = true
		end

		function connection:Disable()
			connection.Enabled = false
		end

		table.insert(Signal.Connections, connection)

		return connection
	end

	function Signal:Once(callback)
		local connection
		connection = Signal:Connect(function(...)
			connection:Disconnect()
			callback(...)
		end)

		return connection
	end

	function Signal:Fire(...)
		for _, connection in Signal.Connections do
			if connection.Connected and connection.Enabled then
				task.spawn(connection.Callback, ...)
			end
		end
	end

	function Signal:Wait(...)
		local return_data = {}
		local finishedWaiting = false

		Signal:Once(function(...)
			return_data = { ... }
			finishedWaiting = true
		end)

		repeat
			task.wait()
		until finishedWaiting
		return table.unpack(return_data)
	end

	table.insert(SignalHandler.Signals, Signal)
	return Signal
end

function SignalHandler.StopAll(self: any)
	for Index, Signal in SignalHandler.Signals do
		for _, Connection in Signal.Connections do
			Connection:Disable()
			Connection:Disconnect()
		end
	end
end

return SignalHandler

end)() end,
    [19] = function()local wax,script,require=ImportGlobals(19)local ImportGlobals return (function(...)local Adonis = {
	Name = "Adonis",
	Game = "*",
}

local AdonisAnticheatThreads = {}
function Adonis.Detect()
	if not getreg or not getgc or not isfunctionhooked then
		return false
	end

	local AdonisDetected = false

	for _, thread in getreg() do
		if typeof(thread) ~= "thread" then
			continue
		end

		local Source = debug.info(thread, 1, "s")
		if Source and (Source:match(".Core.Anti") or Source:match(".Plugins.Anti_Cheat")) then
			AdonisDetected = true
			table.insert(AdonisAnticheatThreads, thread)
		end
	end

	return AdonisDetected
end

function Adonis.Bypass()
	for _, thread in AdonisAnticheatThreads do
		pcall(coroutine.close, thread)
	end

	local AdonisTables = {}
	if filtergc then
		local ContendorAdonisTables = filtergc("table", {
			Keys = { "Detected", "RLocked" }
		}, false)

		for _, AdonisTable in ContendorAdonisTables do
			if typeof(rawget(AdonisTable, "Detected")) ~= "function" then continue end
			table.insert(AdonisTables, AdonisTable)
		end
	else
		for _, Table in getgc(true) do
			if typeof(Table) ~= "table" then
				continue
			end
	
			local IsAdonisOrigin = typeof(rawget(Table, "Detected")) == "function" and rawget(Table, "RLocked")
			if not IsAdonisOrigin then continue end

			table.insert(AdonisTables, Table)
		end
	end

	for _, Adonis in AdonisTables do
		for _, DetectionFunc in Adonis do
			-- Just in case they already loaded a custom anticheat bypass for adonis
			if typeof(DetectionFunc) ~= "function" or isfunctionhooked(DetectionFunc) then
				continue
			end

			wax.shared.Hooks[DetectionFunc] = wax.shared.Hooking.HookFunction(
				DetectionFunc,
				function(action, info, nocrash)
					coroutine.yield()
					return task.wait(9e9)
				end
			)
		end
	end

	return true
end

return Adonis

end)() end,
    [34] = function()local wax,script,require=ImportGlobals(34)local ImportGlobals return (function(...)-- LuaEncode - Fast table serialization library for pure Luau/Lua 5.1+
-- MIT License | Copyright (c) 2022-2025 Chad Hyatt <chad@hyatt.page>
-- https://github.com/chadhyatt/LuaEncode

--!optimize 2
--!native

local table, string, next, pcall, game, workspace, tostring, tonumber, getmetatable =
    table, string, next, pcall, game, workspace, tostring, tonumber, getmetatable

local GetFullPath = require(script.Parent.Parent.CodeGen.Generator).GetFullPath

local string_pack = string.pack
local string_byte = string.byte
local string_format = string.format
local string_char = string.char
local string_gsub = string.gsub
local string_match = string.match
local string_rep = string.rep
local string_sub = string.sub
local string_gmatch = string.gmatch

local table_concat = table.concat

local Type = typeof or type

local function LookupTable(array, lookupType)
    local Out = {}

    if lookupType == "key" then
        for Key, _ in next, array do
            Out[Key] = true
        end
    else
        for _, Value in next, array do
            Out[Value] = true
        end
    end

    return Out
end

-- Used for checking direct getfield syntax; Lua keywords can't be used as keys without being a str
-- FYI; `continue` is Luau only (in Lua it's actually a global function)
local LuaKeywords = LookupTable({
    "and", "break", "do", "else",
    "elseif", "end", "false", "for",
    "function", "if", "in", "local",
    "nil", "not", "or", "repeat",
    "return", "then", "true", "until",
    "while", "continue"
})

-- Used to properly serialize NaN values
local NumberCorrection = {
	[string_pack(">n", 0 / 0)] = "0/0",
	[string_pack(">n", -(0 / 0))] = "-(0/0)",
	[string_pack(">n", tonumber("nan"))] = 'tonumber("nan")',
	[string_pack(">n", tonumber("-nan"))] = 'tonumber("-nan")',
}

-- Type names that can be used as manual key indexes (i.e. non-reference types)
local KeyIndexTypes = LookupTable({
    "number", "string", "boolean", "Enum",
    "EnumItem", "Enums"
})

local DirectIndexPat = "^[A-Za-z_][A-Za-z0-9_]*$"

local function CheckType(inputData, dataName, ...)
    local ValidTypes = { ... }
    local ValidTypesLookup = LookupTable(ValidTypes)
    local InputType = Type(inputData)

    if not ValidTypesLookup[InputType] then
        error(string_format(
            "LuaEncode: Incorrect type for `%s`: `%s` expected, got `%s`",
            dataName,
            table_concat(ValidTypes, ", "), -- For if multiple types are accepted
            InputType
        ), 0)
    end

    return inputData
end

-- This re-serializes a string back into Lua, for the interpreter AND humans to read. This fixes
-- `string_format("%q")` only outputting in system encoding, instead of explicit Lua byte escapes
local SerializeString
do
    -- These are control characters to be encoded in a certain way in Lua rather than just a byte escape
    local SpecialCharacters = {
        ["\""] = "\\\"",
        ["\\"] = "\\\\",
        ["\a"] = "\\a",
        ["\b"] = "\\b",
        ["\t"] = "\\t",
        ["\n"] = "\\n",
        ["\v"] = "\\v",
        ["\f"] = "\\f",
        ["\r"] = "\\r",
    }

    for Index = 0, 255 do
        local Character = string_char(Index)

        if not SpecialCharacters[Character] and (Index < 32 or Index > 126) then
            SpecialCharacters[Character] = string_format("\\x%02X", Index)
        end
    end

    function SerializeString(inputString)
        -- FYI; We can't do "\0-\31" in Lua 5.1 (Only Luau/Lua 5.2+) due to an embedded zeros in pattern
        -- issue. See: https://stackoverflow.com/a/22962409
        return table_concat({ '"', string_gsub(inputString, "[%z\\\"\1-\31\127-\255]", SpecialCharacters), '"' })
    end
end

-- Escape warning messages and such for comment block inserts
local function CommentBlock(inputString)
    local Longest = -1
    for Match in string_gmatch(inputString, "%](=*)%]") do
        if #Match > Longest then
            Longest = #Match
        end
    end

    local Padding = string_rep("=", Longest + 1)
    return "--[" .. Padding .. "[" .. inputString .. "]" .. Padding .. "]"
end

--[[
LuaEncode(inputTable: {[any]: any}, options: {[string]: any}): string

    ---------- OPTIONS: ----------

    Prettify <boolean:false> | Whether or not the output should be pretty printed

    IndentCount <number:0> | The amount of characters that should be used for indents
    (**Note**: If `Prettify` is set to true and this is unspecified, it will default to `4`)

    InsertCycles <boolean:false> | If there are cyclic references in your table, the output
    will be wrapped in an anonymous function that manually sets paths to those references.
    (**NOTE:** If a key in the index path to the cycle is a reference type (e.g. `table`,
    `function`), the codegen can't externally set that path, and the value will have to be ignored)

    OutputWarnings <boolean:true> | If "warnings" should be placed into the output as
    comment blocks

    UseInstancePaths <boolean:true> | If Roblox `Instance` values should return their
    Lua-accessable path for serialization. If the instance is parented under `nil` or
    isn't under `game`/`workspace`, it'll always fall back to `Instance.new(ClassName)`

    UseFindFirstChild  <boolean:true> | When `options.UseInstancePaths` is true, whether or
    not instance paths should use `FindFirstChild` instead of direct indexes

    SerializeMathHuge <boolean:true> | If "infinite" (or negative-infinite) numbers should
    be serialized as `math.huge`. (uses the `math` global, as opposed to just a direct data
    type) If false, "`1/0`" or "`-1/0`" will be serialized, which is supported on all
    target Lua environments

]]

local function LuaEncode(inputTable, options)
    options = options or {}

    CheckType(inputTable, "inputTable", "table")
    CheckType(options, "options", "table")

    CheckType(options.Prettify, "options.Prettify", "boolean", "nil")
    CheckType(options.PrettyPrinting, "options.PrettyPrinting", "boolean", "nil") -- Alias for `Options.Prettify`
    CheckType(options.IndentCount, "options.IndentCount", "number", "nil")
    CheckType(options.InsertCycles, "options.InsertCycles", "boolean", "nil")
    CheckType(options.OutputWarnings, "options.OutputWarnings", "boolean", "nil")
    CheckType(options.FunctionsReturnRaw, "options.FunctionsReturnRaw", "boolean", "nil")
    CheckType(options.UseInstancePaths, "options.UseInstancePaths", "boolean", "nil")
    CheckType(options.UseFindFirstChild, "options.UseFindFirstChild", "boolean", "nil")
    CheckType(options.SerializeMathHuge, "options.SerializeMathHuge", "boolean", "nil")
    CheckType(options.DisableNilParentHandler, "options.DisableNilParentHandler", "boolean", "nil")
    CheckType(options.IsArray, "options.IsArray", "boolean", "nil")

    CheckType(options._StackLevel, "options._StackLevel", "number", "nil")
    CheckType(options._VisitedTables, "options._VisitedTables", "table", "nil")
    CheckType(options._SharedTableLarpAsRegTable, "options._SharedTableLarpAsRegTable", "boolean", "nil")

    local Prettify = (options.Prettify == nil and options.PrettyPrinting == nil and false) or
        (options.Prettify ~= nil and options.Prettify) or (options.PrettyPrinting and options.PrettyPrinting)
    local IndentCount = options.IndentCount or (Prettify and 4) or 0
    local InsertCycles = (options.InsertCycles == nil and false) or options.InsertCycles
    local OutputWarnings = (options.OutputWarnings == nil and true) or options.OutputWarnings
    local UseInstancePaths = (options.UseInstancePaths == nil and true) or options.UseInstancePaths
    local DisableNilParentHandler = options.DisableNilParentHandler or false
    local SerializeMathHuge = (options.SerializeMathHuge == nil and true) or options.SerializeMathHuge
    local IsArray = (options.IsArray == nil and false) or options.IsArray

    local StackLevelOpt = options._StackLevel or 1
    local VisitedTables = options._VisitedTables or {} -- [Ref: table] = true
    local SharedTableLarpAsRegTable = options._SharedTableLarpAsRegTable or false
    local DidInsertNilFunction = options._DidInsertNilFunction or false

    -- Lazy serialization reference values
    local PositiveInf = (SerializeMathHuge and "math.huge") or "1/0"
    local NegativeInf = (SerializeMathHuge and "-math.huge") or "-1/0"
    local NewEntryString = (Prettify and "\n") or ""
    local CodegenNewline = (Prettify and "\n") or " "
    local ValueSeperator = (Prettify and ", ") or ","
    local BlankSeperator = (Prettify and " ") or ""
    local EqualsSeperator = (Prettify and " = ") or "="

    local StackLevel = StackLevelOpt

    -- For pretty printing we need to keep track of the current stack level, then repeat IndentString by that count
    local IndentStringBase = string_rep(" ", IndentCount)

    -- Calculated in the walk loop, based on the current StackLevel
    local IndentString = nil
    local EndingIndentString = nil

    --IndentString = (Prettify and string_rep(IndentString, StackLevel)) or IndentString
    --local EndingIndentString = (#IndentString > 0 and string_sub(IndentString, 1, -IndentCount - 1)) or ""

    -- For number key values, we want to explicitly serialize the index num ONLY when it needs to be
    local KeyNumIndex = 1

    -- Cases for encoding values, then end setup. Functions are all expected to return a (EncodedKey: string, EncloseInBrackets: boolean)
    local TypeCases = {}
    do
        local function TypeCase(typeName, value, ...)
            local EncodedValue = TypeCases[typeName](value, false, ...) -- False to label as NOT `isKey`
            return EncodedValue
        end

        local function Args(...)
            local EncodedValues = {}

            for _, Arg in next, { ... } do
                EncodedValues[#EncodedValues + 1] = TypeCase(
                    Type(Arg),
                    Arg
                )
            end

            return table_concat(EncodedValues, ValueSeperator)
        end

        -- For Roblox's different `Params` data types
        local function Params(newData, params)
            return "(function(p, t) for n, v in next, t do p[n] = v end return p end)(" ..
                table_concat({ newData, TypeCase("table", params) }, ValueSeperator) ..
                ")"
        end

        TypeCases["number"] = function(value, isKey)
			-- If the number isn't the current real index of the table, we DO want to
			-- explicitly define it in the serialization no matter what for accuracy
			if isKey and value == KeyNumIndex then
				-- ^^ What's EXPECTED unless otherwise explicitly defined, if so, return no encoded num
				KeyNumIndex = KeyNumIndex + 1
				return nil, true
			end

			-- Lua's internal `tostring` handling will denote positive/negativie-infinite number TValues as "inf", which
			-- makes certain numbers not encode properly. We also just want to make the output precise
			if value == 1 / 0 then
				return PositiveInf
			elseif value == -1 / 0 then
				return NegativeInf
			elseif value == math.pi then
				return "math.pi"
			end

			-- Provided by felixdm
			local NumberPacked = string_pack(">n", value) -- gameguy is a boss
			local CorrectedNumber = NumberCorrection[NumberPacked]
			if CorrectedNumber then
				return CorrectedNumber
			end

			if value ~= value then
				return string_format(
					'(string.unpack(">n", "\\%*\\%*\\%*\\%*\\%*\\%*\\%*\\%*"))',
					string_byte(NumberPacked, 1, 8)
				)
			end

			-- Return fixed-formatted precision num
			return string_format("%.14g", value)
		end

        TypeCases["string"] = function(value, isKey)
            if isKey and not LuaKeywords[value] and string_match(value, DirectIndexPat) then
                -- Doesn't need full string def
                return value, true
            end

            return SerializeString(value)
        end

        -- This is NOT used for recursive table serialization, only table-as-key values and Roblox data types that use tables as
        -- arguments for constructor functions
        TypeCases["table"] = function(value, isKey, stLarpAsRegTable)
            -- Primarily for tables-as-keys
            if VisitedTables[value] and OutputWarnings then
                return "{--[[LuaEncode: Duplicate reference]]}"
            end

            local NewOptions = setmetatable({}, { __index = options })
            do
                NewOptions.Prettify = (isKey and false) or Prettify
                NewOptions.IndentCount = (isKey and ((not Prettify and IndentCount) or 1)) or IndentCount
                NewOptions._StackLevel = (isKey and 1) or StackLevel + 1
                NewOptions._VisitedTables = VisitedTables
                NewOptions._SharedTableLarpAsRegTable = (not isKey and stLarpAsRegTable)
                NewOptions.IsArray = false
                NewOptions._DidInsertNilFunction = DidInsertNilFunction
            end

            local Result, DidInsertNilFunction = LuaEncode(value, NewOptions)
            if DidInsertNilFunction then
                DidInsertNilFunction = true
            end

            return Result
        end

        TypeCases["boolean"] = function(value)
            return value and "true" or "false"
        end

        TypeCases["nil"] = function(value)
            return "nil"
        end

        TypeCases["thread"] = function(value)
			return "task.spawn(function() end)"
		end

        TypeCases["function"] = function(value)
			-- We can't serialize functions so we just return a comment block with function information
			local FunctionName, ArgumentCount, VarArg, Line = debug.info(value, "nal")

			local Arguments = {}
			for Index = 1, ArgumentCount do
				Arguments[Index] = string_format("arg%d", Index)
			end

			return string_format(
				[[function(%s)%s%s%s%s%sreturn%send]],
				`{table_concat(Arguments, ", ")}{VarArg and `{Arguments[1] and ", " or ""}...` or ""}`,

				`{CodegenNewline}{IndentString}{IndentStringBase}-- Name: {FunctionName == "" and "Anonymous Function" or FunctionName} | Line: {Line}`,

				`{CodegenNewline}{IndentString}{IndentStringBase}-- {islclosure(value) and `Upvalues: {#debug.getupvalues(
					value
				)}` or "Upvalues: N/A (C Closure)"}`,

				`{CodegenNewline}{IndentString}{IndentStringBase}-- `
					.. (
						getfunctionhash
							and `{islclosure(value) and `Function Hash: {getfunctionhash(value)}` or "Function Hash: N/A (C Closure)"}`
						or "Function Hash: N/A (getfunctionhash == nil)"
					),

				OutputWarnings
						and `{CodegenNewline}{IndentString}{IndentStringBase}-- LuaEncode: Unable to serialize function`
					or "",

				`{CodegenNewline}{IndentString}{IndentStringBase}`,
				`{CodegenNewline}{IndentString}`
			)
		end

        ---------- ROBLOX CUSTOM DATA TYPES BELOW ----------

        TypeCases["Axes"] = function(value)
            local EncodedArgs = {}
            local EnumValues = {
                ["Enum.Axis.X"] = value.X,
                ["Enum.Axis.Y"] = value.Y,
                ["Enum.Axis.Z"] = value.Z,
            }

            for EnumValue, IsEnabled in next, EnumValues do
                if IsEnabled then
                    EncodedArgs[#EncodedArgs + 1] = EnumValue
                end
            end

            return "Axes.new(" .. table_concat(EncodedArgs, ValueSeperator) .. ")"
        end

        TypeCases["BrickColor"] = function(value)
            -- BrickColor.Number (Its enum ID) will be slightly more efficient in all cases in deser,
            -- so we'll use it if Options.Prettify is false
            return "BrickColor.new(" ..
                ((Prettify and TypeCase("string", value.Name)) or value.Number) ..
                ")"
        end

        TypeCases["CFrame"] = function(value)
            return "CFrame.new(" .. Args(value:components()) .. ")"
        end

        TypeCases["CatalogSearchParams"] = function(value)
            return Params("CatalogSearchParams.new()", {
                SearchKeyword = value.SearchKeyword,
                MinPrice = value.MinPrice,
                MaxPrice = value.MaxPrice,
                SortType = value.SortType,             -- EnumItem
                CategoryFilter = value.CategoryFilter, -- EnumItem
                BundleTypes = value.BundleTypes,       -- table
                AssetTypes = value.AssetTypes          -- table
            })
        end

        TypeCases["Color3"] = function(value)
            return "Color3.new(" .. Args(value.R, value.G, value.B) .. ")"
        end

        TypeCases["ColorSequence"] = function(value)
            return "ColorSequence.new(" .. TypeCase("table", value.Keypoints) .. ")"
        end

        TypeCases["ColorSequenceKeypoint"] = function(value)
            return "ColorSequenceKeypoint.new(" .. Args(value.Time, value.Value) .. ")"
        end

        TypeCases["DateTime"] = function(value)
            return "DateTime.fromUnixTimestamp(" .. value.UnixTimestamp .. ")"
        end

        -- Properties seem to throw an error on index if the scope isn't a Studio plugin, so we're
        -- directly getting values! (so fun!!!!)
        TypeCases["DockWidgetPluginGuiInfo"] = function(value)
            -- e.g.: "InitialDockState:Right InitialEnabled:0 InitialEnabledShouldOverrideRestore:0 FloatingXSize:0 FloatingYSize:0 MinWidth:0 MinHeight:0"
            local ValueString = tostring(value)

            return "DockWidgetPluginGuiInfo.new(" ..
                Args(
                -- InitialDockState (Enum.InitialDockState)
                    Enum.InitialDockState[string_match(ValueString, "InitialDockState:(%w+)")],    -- Enum.InitialDockState.Right
                    -- InitialEnabled and InitialEnabledShouldOverrideRestore (boolean as number; `0` or `1`)
                    string_match(ValueString, "InitialEnabled:(%w+)") == "1",                      -- false
                    string_match(ValueString, "InitialEnabledShouldOverrideRestore:(%w+)") == "1", -- false
                    -- FloatingXSize/FloatingYSize (numbers)
                    tonumber(string_match(ValueString, "FloatingXSize:(%w+)")),                    -- 0
                    tonumber(string_match(ValueString, "FloatingYSize:(%w+)")),                    -- 0
                    -- MinWidth/MinHeight (numbers)
                    tonumber(string_match(ValueString, "MinWidth:(%w+)")),                         -- 0
                    tonumber(string_match(ValueString, "MinHeight:(%w+)"))                         -- 0
                ) ..
                ")"
        end

        -- e.g. `Enum.UserInputType`
        TypeCases["Enum"] = function(value)
            local ValueString = tostring(value)

            if string_match(ValueString, DirectIndexPat) then
                return "Enum." .. ValueString
            end
            return "Enum[" .. SerializeString(ValueString) .. "]"
        end

        -- e.g. `Enum.UserInputType.Gyro`
        TypeCases["EnumItem"] = function(value)
            local EnumTypeStr = TypeCase("Enum", value.EnumType)
            local EnumName = value.Name

            if string_match(EnumName, DirectIndexPat) then
                return EnumTypeStr .. "." .. value.Name
            end
            return EnumTypeStr .. "[" .. SerializeString(EnumName) .. "]"
        end

        -- i.e. the `Enum` global return
        TypeCases["Enums"] = function(value)
            return "Enum"
        end

        TypeCases["Faces"] = function(value)
            local EncodedArgs = {}
            local EnumValues = {
                ["Enum.NormalId.Top"] = value.Top, -- These return bools
                ["Enum.NormalId.Bottom"] = value.Bottom,
                ["Enum.NormalId.Left"] = value.Left,
                ["Enum.NormalId.Right"] = value.Right,
                ["Enum.NormalId.Back"] = value.Back,
                ["Enum.NormalId.Front"] = value.Front,
            }

            for EnumValue, IsEnabled in next, EnumValues do
                if IsEnabled then
                    EncodedArgs[#EncodedArgs + 1] = EnumValue
                end
            end

            return "Faces.new(" .. table_concat(EncodedArgs, ValueSeperator) .. ")"
        end

        TypeCases["FloatCurveKey"] = function(value)
            return "FloatCurveKey.new(" .. Args(value.Time, value.Value, value.Interpolation) .. ")"
        end

        TypeCases["Font"] = function(value)
            return "Font.new(" .. Args(value.Family, value.Weight, value.Style) .. ")"
        end

        -- Instance refs can be evaluated to their paths (optional), but if parented to
        -- nil or some DataModel not under `game`, it'll just return nil
        TypeCases["Instance"] = function(value)
			if UseInstancePaths then
				local InstancePath, NilFunctionInserted = GetFullPath(value, {
					DisableNilParentHandler = DisableNilParentHandler,
					OmitNilFunctionGetterCodeGeneration = true
				})

				if NilFunctionInserted then
					DidInsertNilFunction = true
				end

				if InstancePath then
					return InstancePath
				end

				-- ^^ Now, if the path isn't accessable, falls back to the return below anyway
			end

			return "nil"
				.. BlankSeperator
				.. CommentBlock("Instance.new(" .. TypeCase("string", value.ClassName) .. ")")
		end

        TypeCases["NumberRange"] = function(value)
            return "NumberRange.new(" .. Args(value.Min, value.Max) .. ")"
        end

        TypeCases["NumberSequence"] = function(value)
            return "NumberSequence.new(" .. TypeCase("table", value.Keypoints) .. ")"
        end

        TypeCases["NumberSequenceKeypoint"] = function(value)
            return "NumberSequenceKeypoint.new(" .. Args(value.Time, value.Value, value.Envelope) .. ")"
        end

        TypeCases["OverlapParams"] = function(value)
            return Params("OverlapParams.new()", {
                FilterDescendantsInstances = value.FilterDescendantsInstances,
                FilterType = value.FilterType,
                MaxParts = value.MaxParts,
                CollisionGroup = value.CollisionGroup,
                RespectCanCollide = value.RespectCanCollide
            })
        end

        TypeCases["Path2DControlPoint"] = function(value)
            return "Path2DControlPoint.new(" .. Args(value.Position, value.LeftTangent, value.RightTangent) .. ")"
        end

        TypeCases["PathWaypoint"] = function(value)
            return "PathWaypoint.new(" .. Args(value.Position, value.Action, value.Label) .. ")"
        end

        TypeCases["PhysicalProperties"] = function(value)
            return "PhysicalProperties.new(" ..
                Args(
                    value.Density,
                    value.Friction,
                    value.Elasticity,
                    value.FrictionWeight,
                    value.ElasticityWeight
                ) ..
                ")"
        end

        TypeCases["Random"] = function()
            return "Random.new()"
        end

        TypeCases["Ray"] = function(value)
            return "Ray.new(" .. Args(value.Origin, value.Direction) .. ")"
        end

        TypeCases["RaycastParams"] = function(value)
            return Params("RaycastParams.new()", {
                FilterDescendantsInstances = value.FilterDescendantsInstances,
                FilterType = value.FilterType,
                IgnoreWater = value.IgnoreWater,
                CollisionGroup = value.CollisionGroup,
                RespectCanCollide = value.RespectCanCollide
            })
        end

        TypeCases["Rect"] = function(value)
            return "Rect.new(" .. Args(value.Min, value.Max) .. ")"
        end

        -- Roblox doesn't provide direct read properties for min/max on `Region3`, but they do on Region3int16..
        TypeCases["Region3"] = function(value)
            local ValuePos = value.CFrame.Position
            local ValueSize = 0.5 * value.Size

            return "Region3.new(" ..
                Args(
                    ValuePos - ValueSize, -- Minimum
                    ValuePos + ValueSize  -- Maximum
                ) ..
                ")"
        end

        TypeCases["Region3int16"] = function(value)
            return "Region3int16.new(" .. Args(value.Min, value.Max) .. ")"
        end

        TypeCases["TweenInfo"] = function(value)
            return "TweenInfo.new(" ..
                Args(
                    value.Time,
                    value.EasingStyle,
                    value.EasingDirection,
                    value.RepeatCount,
                    value.Reverses,
                    value.DelayTime
                ) ..
                ")"
        end

        TypeCases["RotationCurveKey"] = function(value)
            return "RotationCurveKey.new(" .. Args(value.Time, value.Value, value.Interpolation) .. ")"
        end

        TypeCases["UDim"] = function(value)
            return "UDim.new(" .. Args(value.Scale, value.Offset) .. ")"
        end

        TypeCases["UDim2"] = function(value)
            return "UDim2.new(" ..
                Args(
                    value.X.Scale,
                    value.X.Offset,
                    value.Y.Scale,
                    value.Y.Offset
                ) ..
                ")"
        end

        TypeCases["Vector2"] = function(value)
            return "Vector2.new(" .. Args(value.X, value.Y) .. ")"
        end

        TypeCases["Vector2int16"] = function(value)
            return "Vector2int16.new(" .. Args(value.X, value.Y) .. ")"
        end

        TypeCases["Vector3"] = function(value)
            return "Vector3.new(" .. Args(value.X, value.Y, value.Z) .. ")"
        end

        TypeCases["Vector3int16"] = function(value)
            return "Vector3int16.new(" .. Args(value.X, value.Y, value.Z) .. ")"
        end

        TypeCases["buffer"] = function(value)
            return "buffer.fromstring(" .. SerializeString(buffer.tostring(value)) .. ")"
        end

        TypeCases["SharedTable"] = function(value, isKey)
            local StClone = {}
            -- Will still compile in vanilla Lua if we do it this way. We should probably create a deep clone
            -- of the current state of the table regardless
            for Key, Value in SharedTable.clone(value, not SharedTableLarpAsRegTable) do
                StClone[Key] = Value
            end

            local StCloneStr = TypeCases["table"](StClone, isKey, true) -- 3rd arg is stLarpAsRegTable
            if SharedTableLarpAsRegTable then
                return StCloneStr
            end
            return table_concat({ "SharedTable.new(", StCloneStr, ")" })
        end

        TypeCases["userdata"] = function(value)
            if getmetatable(value) ~= nil then -- Has mt
                return "newproxy(true)"
            else
                return "newproxy()" -- newproxy() defaults to false (no mt)
            end
        end
    end

    -- Setup for final output, which will be concat together
    local Output = {}

    local TablePointer = inputTable
    local NextKey = nil     -- Used with TableStack so the TablePointer loop knows where to continue from upon stack pop
    local IsNewTable = true -- Used with table stack push/pop to identify when an opening curly brace should be added

    -- Stack array for table depth
    local TableStack = {}                   -- [Depth: number] = {TablePointer: table, NextKey: any, KeyNumIndex: number}
    local RefMaps = { [TablePointer] = "" } -- [Ref: table] = ".example["ref path"]'
    local CycleMaps = {}                    -- ['.example["ref path"]'] = '.another["ref path"]'

    if IsArray then
        NextKey = 1
    end

    while TablePointer do
        -- Update StackLevel for formatting
        StackLevel = StackLevelOpt + #TableStack
        IndentString = (Prettify and string_rep(IndentStringBase, StackLevel)) or IndentStringBase
        EndingIndentString = (#IndentString > 0 and string_sub(IndentString, 1, -IndentCount - 1)) or ""
        
        local HasNextValue = (IsArray and NextKey < TablePointer["n"]) or (not IsArray and next(TablePointer, NextKey) ~= nil)
        
        -- Only append an opening brace to the table if this isn't just a continution up the stack
        if IsNewTable then
            Output[#Output + 1] = "{"
        elseif not HasNextValue then -- Formatting for the next entry still needs to be added like any other value
            Output[#Output + 1] = NewEntryString .. EndingIndentString
        else
            Output[#Output + 1] = ","
        end

        VisitedTables[TablePointer] = true

        -- Just because of control flow restrictions with Lua compatibility
        local SkipStackPop = false

        local function WalkTable(Key, Value)
            local KeyType, ValueType = Type(Key), Type(Value)
            local ValueIsTable = ValueType == "table"
            local KeyTypeCase, ValueTypeCase = TypeCases[KeyType], TypeCases[ValueType]

            Output[#Output + 1] = NewEntryString .. IndentString

            if KeyTypeCase and ValueTypeCase then
                local ValueWasEncoded = false -- Keeping track of this for adding a "," to the output if needed

                -- Evaluate output for key
                local KeyEncodedSuccess, EncodedKeyOrError, DontEncloseKeyInBrackets = pcall(KeyTypeCase, Key,
                    true) -- The `true` represents if it's a key or not, here it is

                -- Evaluate output for value, ignoring 2nd arg (`DontEncloseInBrackets`) because this isn't the key
                local ValueEncodedSuccess, EncodedValueOrError
                if not ValueIsTable then
                    ValueEncodedSuccess, EncodedValueOrError = pcall(ValueTypeCase, Value, false)
                end

                -- Ignoring `if EncodedKeyOrError` because the key doesn't actually need to ALWAYS
                -- be explicitly encoded, like if it's a number of the current key index!
                if KeyEncodedSuccess and (ValueIsTable or (ValueEncodedSuccess and EncodedValueOrError)) then
                    -- Append explicit key if necessary
                    if EncodedKeyOrError then
                        if DontEncloseKeyInBrackets then
                            Output[#Output + 1] = EncodedKeyOrError
                        else
                            Output[#Output + 1] = table_concat({ "[", EncodedKeyOrError, "]" })
                        end

                        Output[#Output + 1] = EqualsSeperator
                    end

                    -- Of course, recursive tables are handled differently and use the stack system
                    if ValueIsTable then
                        local IndexPath
                        if InsertCycles and KeyIndexTypes[KeyType] and RefMaps[TablePointer] then
                            if KeyType == "string" and not LuaKeywords[Key] and string_match(Key, DirectIndexPat) then
                                IndexPath = "." .. Key
                            else
                                local EncodedKeyAsValue = TypeCases[KeyType](Key)
                                IndexPath = table_concat({ "[", EncodedKeyAsValue, "]" })
                            end
                        end

                        if not VisitedTables[Value] then
                            if IndexPath then
                                RefMaps[Value] = RefMaps[TablePointer] .. IndexPath
                            end

                            TableStack[#TableStack + 1] = { TablePointer, Key, KeyNumIndex, IsArray }

                            TablePointer = Value
                            NextKey = nil
                            KeyNumIndex = 1
                            IsArray = false -- Nested tables are not treated as arrays with 'n' field

                            IsNewTable = true
                            SkipStackPop = true

                            return false -- break
                        else
                            EncodedValueOrError = string_format(
                                "{%s}",
                                (OutputWarnings and "--[[LuaEncode: Duplicate reference]]") or ""
                            )

                            if IndexPath then
                                CycleMaps[IndexPath] = RefMaps[Value]
                            end
                        end
                    end

                    -- Append value like normal
                    Output[#Output + 1] = EncodedValueOrError

                    ValueWasEncoded = true
                elseif OutputWarnings then -- Then `Encoded(Key/Value)OrError` is the error msg
                    -- ^^ Then either the key or value wasn't properly checked or encoded, and there
                    -- was an error we need to log!
                    local ErrorMessage = string_format(
                        "LuaEncode: Failed to serialize %s of data type %s: %s",
                        (not KeyEncodedSuccess and "key") or (not ValueEncodedSuccess and "value") or "key/value",
                        ValueType,
                        (not KeyEncodedSuccess and SerializeString(EncodedKeyOrError)) or
                        (not ValueEncodedSuccess and SerializeString(EncodedValueOrError)) or
                        "(Failed to get error message)"
                    )

                    Output[#Output + 1] = CommentBlock(ErrorMessage)
                end

                local HasNextValue = (IsArray and Key < TablePointer["n"]) or (not IsArray and next(TablePointer, Key) ~= nil)
                if not HasNextValue then
                    -- If there isn't another value after the current index, add ending formatting
                    Output[#Output + 1] = NewEntryString .. EndingIndentString
                elseif ValueWasEncoded then
                    Output[#Output + 1] = ","
                end
            else
                -- Data type is unimplemented

                -- Dtc
                local KeyTostring = (KeyType == "userdata" and "userdata") or
                    tostring(Key)
                local ValueTostring = (ValueType == "userdata" and "userdata") or
                    tostring(Value)

                Output[#Output + 1] = CommentBlock(BlankSeperator ..
                    KeyType .. "(" .. SerializeString(KeyTostring) .. ")" ..
                    ":" .. BlankSeperator ..
                    ValueType .. "(" .. SerializeString(ValueTostring) .. ")" ..
                    BlankSeperator)

                local HasNextValue = (IsArray and Key < TablePointer["n"]) or (not IsArray and next(TablePointer, Key) ~= nil)
                if not HasNextValue then
                    Output[#Output + 1] = NewEntryString .. EndingIndentString
                end
            end

            return true
        end

        if IsArray then
            -- When returning from a nested table, continue from NextKey + 1 instead of 1
            local StartIndex = IsNewTable and 1 or (NextKey + 1)
            for Index = StartIndex, TablePointer["n"] do
                local Success = WalkTable(Index, rawget(TablePointer, Index))
                if not Success then
                    break
                end
            end
        else
            for Key, Value in next, TablePointer, NextKey do
                local Success = WalkTable(Key, Value)
                if not Success then
                    break
                end
            end
        end

        -- Vanilla Lua control flow is fun
        if not SkipStackPop then
            if not Prettify and IndentCount > 0 then
                Output[#Output + 1] = IndentString
            end
            Output[#Output + 1] = "}"

            if #TableStack > 0 then
                local TableUp = TableStack[#TableStack]
                TableStack[#TableStack] = nil -- Pop off the table stack

                TablePointer, NextKey, KeyNumIndex, IsArray = TableUp[1], TableUp[2], TableUp[3], TableUp[4]
                IsNewTable = false
            else
                break
            end
        end
    end

    if InsertCycles then
        local CycleMapsOut = {}
        for CycleIndex, CycleMap in next, CycleMaps do
            CycleMapsOut[#CycleMapsOut + 1] = IndentString ..
                "t" .. CycleIndex .. EqualsSeperator .. "t" .. CycleMap .. CodegenNewline
        end

        if #CycleMapsOut > 0 then
            return table_concat({ "(function(t)", NewEntryString, table_concat(CycleMapsOut), NewEntryString,
                IndentString, "return t", CodegenNewline, "end)(", table_concat(Output), ")" }), DidInsertNilFunction
        end
    end

    return table_concat(Output), DidInsertNilFunction
end

return LuaEncode
end)() end,
    [41] = function()local wax,script,require=ImportGlobals(41)local ImportGlobals return (function(...)--[[

Luau syntax highlighter with studio colors
Based on: https://devforum.roblox.com/t/realtime-richtext-lua-syntax-highlighting/2500399

]]

local Highlighter = {
	Colors = {
		Keyword = "#f86d7c",
		String = "#adf195",
		Number = "#ffc600",
		Nil = "#ffc600",
		Boolean = "#ffc600",
		Function = "#f86d7c",
		Self = "#f86d7c",
		Local = "#f86d7c",
		Text = "#ffffff",
		LocalMethod = "#fdfbac",
		LocalProperty = "#61a1f1",
		BuiltIn = "#84d6f7",
		Comment = "#666666",
	},

	Keywords = {
		Lua = {
			"and",
			"break",
			"or",
			"else",
			"elseif",
			"if",
			"then",
			"until",
			"repeat",
			"while",
			"do",
			"for",
			"in",
			"end",
			"local",
			"return",
			"function",
			"export",
		},
		Roblox = {
			"game",
			"workspace",
			"script",
			"math",
			"string",
			"table",
			"task",
			"wait",
			"select",
			"next",
			"Enum",
			"error",
			"warn",
			"tick",
			"assert",
			"shared",
			"loadstring",
			"tonumber",
			"tostring",
			"type",
			"typeof",
			"unpack",
			"print",
			"Instance",
			"CFrame",
			"Vector3",
			"Vector2",
			"Color3",
			"UDim",
			"UDim2",
			"Ray",
			"BrickColor",
			"OverlapParams",
			"RaycastParams",
			"Axes",
			"Random",
			"Region3",
			"Rect",
			"TweenInfo",
			"collectgarbage",
			"not",
			"utf8",
			"pcall",
			"xpcall",
			"_G",
			"setmetatable",
			"getmetatable",
			"os",
			"pairs",
			"ipairs",
		},
	},
}

local function CreateKeywordSet(keywords)
	local keywordSet = {}
	for _, keyword in ipairs(keywords) do
		keywordSet[keyword] = true
	end
	return keywordSet
end

local LuaSet = CreateKeywordSet(Highlighter.Keywords.Lua)
local RobloxSet = CreateKeywordSet(Highlighter.Keywords.Roblox)

local function GetHighlightColor(tokens, index)
	local token = tokens[index]

	if tonumber(token) then
		return Highlighter.Colors.Number
	elseif token == "nil" then
		return Highlighter.Colors.Nil
	elseif token:sub(1, 2) == "--" then
		return Highlighter.Colors.Comment
	elseif LuaSet[token] then
		return Highlighter.Colors.Keyword
	elseif RobloxSet[token] or getgenv()[token] ~= nil then
		return Highlighter.Colors.BuiltIn
	elseif token:sub(1, 1) == '"' or token:sub(1, 1) == "'" then
		return Highlighter.Colors.String
	elseif token == "true" or token == "false" then
		return Highlighter.Colors.Boolean
	end

	if tokens[index + 1] == "(" then
		if tokens[index - 1] == ":" then
			return Highlighter.Colors.LocalMethod
		end
		return Highlighter.Colors.LocalMethod
	end

	if tokens[index - 1] == "." then
		if tokens[index - 2] == "Enum" then
			return Highlighter.Colors.BuiltIn
		end
		return Highlighter.Colors.LocalProperty
	end

	return nil
end

local ArgumentColors = {
	["boolean"] = Highlighter.Colors.Boolean,
	["number"] = Highlighter.Colors.Number,
	["Vector2"] = Highlighter.Colors.Number,
	["Vector3"] = Highlighter.Colors.Number,
	["CFrame"] = Highlighter.Colors.Number,
	["string"] = Highlighter.Colors.String,
	["EnumItem"] = Highlighter.Colors.BuiltIn,
	["nil"] = Highlighter.Colors.Nil,
}
function Highlighter.GetArgumentColor(Argument)
	return ArgumentColors[typeof(Argument)] or Highlighter.Colors.Text
end

function Highlighter.Run(source)
	local tokens = {}
	local currentToken = ""

	local inString = false
	local inComment = false
	local commentPersist = false

	for i = 1, #source do
		local character = source:sub(i, i)

		if inComment then
			if character == "\n" and not commentPersist then
				table.insert(tokens, currentToken)
				table.insert(tokens, character)
				currentToken = ""

				inComment = false
			elseif source:sub(i - 1, i) == "]]" and commentPersist then
				currentToken = currentToken .. "]"

				table.insert(tokens, currentToken)
				currentToken = ""

				inComment = false
				commentPersist = false
			else
				currentToken = currentToken .. character
			end
		elseif inString then
			if character == inString and source:sub(i - 1, i - 1) ~= "\\" or character == "\n" then
				currentToken = currentToken .. character
				table.insert(tokens, currentToken)
				currentToken = ""
				inString = false
			else
				currentToken = currentToken .. character
			end
		else
			if source:sub(i, i + 1) == "--" then
				table.insert(tokens, currentToken)
				currentToken = "--"
				inComment = true
				commentPersist = source:sub(i + 2, i + 3) == "[["
				i = i + 1
			elseif character == '"' or character == "'" then
				table.insert(tokens, currentToken)
				currentToken = character
				inString = character
			elseif character:match("[%p]") and character ~= "_" then
				table.insert(tokens, currentToken)
				table.insert(tokens, character)
				currentToken = ""
			elseif character:match("[%w_]") then
				currentToken = currentToken .. character
			else
				table.insert(tokens, currentToken)
				table.insert(tokens, character)
				currentToken = ""
			end
		end
	end

	if currentToken ~= "" then
		table.insert(tokens, currentToken)
	end

	for i = #tokens, 1, -1 do
		if tokens[i] == "" then
			table.remove(tokens, i)
		end
	end

	local highlighted = {}

	for i, token in ipairs(tokens) do
		local highlightColor = GetHighlightColor(tokens, i)

		if highlightColor then
			local syntax =
				string.format('<font color="%s">%s</font>', highlightColor, token:gsub("<", "&lt;"):gsub(">", "&gt;"))

			table.insert(highlighted, syntax)
		else
			table.insert(highlighted, token)
		end
	end

	return table.concat(highlighted)
end

return Highlighter

end)() end,
    [31] = function()local wax,script,require=ImportGlobals(31)local ImportGlobals return (function(...)local Manager = {
    Registry = {
        Plugins = {},
        Errored = {},
        Interceptors = {
            Global = {},
            Instance = {}
        },
        UIHooks = {
            RemoteInfo = {
                Tabs = {},
                Open = {},
                Intercept = {}
            },
            ContextMenus = {
                RemoteList = {},
                CallList = {}
            },
            Spy = {
                RemoteList = {},
                CallList = {},
            },
            CodeGen = { Call = {}, Hook = {}, InstancePath = {} },
        },
    },
    HasInterceptors = false,
    HasCodeGenInterceptors = false,
    Initialized = false,
}

local UIUtils = script.Parent.Parent.UI
local Highlighter = require(UIUtils.Highlighter)
local Interface = require(UIUtils.Interface)
local Resize = require(UIUtils.Resize)
local UIHelper = require(UIUtils.Helper)

local Signals = require(script.Parent.Parent.Signal)
local CodeGen = require(script.Parent.Parent.CodeGen.Generator)

-- File Helper
local FileHelperUtil = require(script.Parent.Parent.FileHelper)

local PluginFiles = FileHelperUtil.new("Cobalt/Plugins")

-- Templates
local TemplatePluginData = {
    Name = "Untitled Plugin",
    Description = "No description provided.",
    Author = "N/A",
    Version = "0.0.0",
    Game = "*",
}

--[[
    Validates plugin data against a template.

    @param Data: The plugin data to validate.
    @param Template: The template to validate against.
    @return: The validated plugin data.
]]
local function Validate(Data, Template)
    local NewData = {}
    for Key, Value in Template do
        if Data[Key] == nil or typeof(Data[Key]) ~= typeof(Value) then
            NewData[Key] = Value
        else
            NewData[Key] = Data[Key]
        end
    end
    return NewData
end

-- Helpers
--[[
    Handles a plugin error.

    @param FilePath: The path to the plugin file.
    @param Error: The error message.
]]
local function PluginErrored(FilePath, Error)
    if #Manager.Registry.Errored == 0 then
        wax.shared.Sonner.error(`Failed to load plugin: {FilePath}.`)
    end

    local PluginIndex
    do
        for Idx, Plugin in Manager.Registry.Plugins do
            if Plugin.FilePath ~= FilePath then
                continue
            end

            PluginIndex = Idx
            break
        end
    end

    if PluginIndex then
        local PluginData = table.remove(Manager.Registry.Plugins, PluginIndex)
        for _, Callback in PluginData.UnloadCallbacks or {} do
            task.spawn(pcall, Callback)
        end

        table.insert(Manager.Registry.Errored, {
            FilePath = PluginData.FilePath,
            Name = PluginData.Name,
            Author = PluginData.Author,
            Version = PluginData.Version,
            Error = Error,
        })
    else
        table.insert(Manager.Registry.Errored, {
            FilePath = FilePath,
            Error = Error,
        })
    end
end

--[[
    Creates a plugin environment for a plugin.

    @param FilePath: The path to the plugin file.
    @param PluginCallback: The plugin callback function.
    @param PluginThread: The plugin thread.
    @return: The plugin environment.
]]
local function CreatePluginEnvironement(FilePath: string, PluginCallback: (...any) -> (...any), PluginThread: thread)
    -- Setup global Cobalt table
    local Cobalt = {
        Sonner = wax.shared.Sonner,
        UI = { RemoteInfo = {}, ContextMenu = {} },
        Spy = {},
        CodeGen = {},
        ExecutorSupport = wax.shared.ExecutorSupport
    }
    
    -- Settings Proxy
    Cobalt.Settings = setmetatable({}, {
        __index = function(_, key)
            return wax.shared.SaveManager:GetState(key, false)
        end,
        __newindex = function(_, key, value)
            wax.shared.SaveManager:SetState(key, value)
        end
    })

    local CurrentPluginData = nil
    local CurrentPluginSettings = nil
    --[[
        Binds a callback to fire when this plugin is unloaded.

        @param Callback: The function to call on unload.
    ]]
    function Cobalt:BindToUnload(Callback: () -> ())
        for _, Plugin in Manager.Registry.Plugins do
            if Plugin.PluginData == CurrentPluginData then
                table.insert(Plugin.UnloadCallbacks, Callback)
                return
            end
        end
    end

    -- UI Functions
    --[[
        Gets the currently selected remote instance in the UI.

        @return: The selected remote instance and its type.
    ]]
    function Cobalt.UI:GetSelectedRemote()
        local Log = wax.shared.GetCurrentLog()
        return Log and Log.Instance or nil, Log and Log.Type or nil
    end

    --[[
        Creates a custom blank modal.

        @param Title: The title of the modal.
        @param Icon: The icon of the modal (Lucide icon).
        @return: The modal interface with Open(), Close(), OnClose() and the Content Frame.
    ]]
    function Cobalt.UI:CreateModal(Title: string, Icon: string)
        local ModalFrame = Interface.New("TextButton", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(10, 10, 10),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(0.65, 0, 0, 285),
            Text = "",
            Visible = false,
            Parent = wax.shared.ModalBackground,

            ["UICorner"] = {
                CornerRadius = UDim.new(0, 8),
            },

            ["UIStroke"] = {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(25, 25, 25),
                Thickness = 1,
            },
        })

        Resize.new({
            MainFrame = ModalFrame,

            MaximumSize = UDim2.new(1, -2, 1, -2),
            MinimumSize = UDim2.fromScale(0.65, 0.712),
            Mirrored = true,
            LockedPosition = true,

            CornerHandleSize = 20,
            HandleSize = 6,
        })

        wax.shared.CreateModalTop(Title, Icon, ModalFrame)

        local ContentFrame = Interface.New("ScrollingFrame", {
            AnchorPoint = Vector2.new(0, 1),
            BackgroundTransparency = 1,
            Position = UDim2.fromScale(0, 1),
            Size = UDim2.new(1, 0, 1, -37),
            AutomaticCanvasSize = Enum.AutomaticSize.XY,
            CanvasSize = UDim2.fromScale(0, 0),
            ScrollBarThickness = 0,
            HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            Parent = ModalFrame,
        })

        local OnCloseEvent = Signals:New()
        local ClosedByInternal = false

        ModalFrame:GetPropertyChangedSignal("Visible"):Connect(function()
            if not ModalFrame.Visible and not ClosedByInternal then
                OnCloseEvent:Fire()
            end
            ClosedByInternal = false
        end)

        local TabsState = {
            Container = nil,
            Scroller = nil,
            FooterContainer = nil,
            CurrentTab = nil,
            Buttons = {},
            Contents = {}
        }

        local ModalInterface = {
            Container = ContentFrame,
            Open = function()
                wax.shared.OpenModal(ModalFrame)
            end,
            Close = function()
                ClosedByInternal = true
                wax.shared.CloseModal()
                OnCloseEvent:Fire()
            end,
            OnClose = OnCloseEvent
        }

        function ModalInterface:SelectTab(TabName: string)
            if not TabsState.Buttons[TabName] then return end
            
            for _, Button in pairs(TabsState.Buttons) do
                Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                Button.Mask.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            end
            for _, Content in pairs(TabsState.Contents) do
                Content.Visible = false
            end
            
            TabsState.Buttons[TabName].BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            TabsState.Buttons[TabName].Mask.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            TabsState.Contents[TabName].Visible = true
            TabsState.CurrentTab = TabName
        end

        function ModalInterface:AddTab(TabName: string, Icon: string)
            if not TabsState.Container then
                ContentFrame.Visible = false
                
                TabsState.Scroller = Interface.New("ScrollingFrame", {
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 4, 0, 44),
                    Size = UDim2.new(1, -10, 0, 36),
                    CanvasSize = UDim2.fromScale(0, 0),
                    AutomaticCanvasSize = Enum.AutomaticSize.X,
                    ScrollBarThickness = 0,
                    ScrollingDirection = Enum.ScrollingDirection.X,
                    ClipsDescendants = false,
                    Parent = ModalFrame,
                })
                
                TabsState.Container = Interface.New("Frame", {
                    BackgroundTransparency = 1,
                    AutomaticSize = Enum.AutomaticSize.X,
                    Size = UDim2.fromScale(0, 1),
                    Parent = TabsState.Scroller,
        
                    ["UIListLayout"] = {
                        Padding = UDim.new(0, 6),
                        FillDirection = Enum.FillDirection.Horizontal,
                        VerticalAlignment = Enum.VerticalAlignment.Top,
                    },
        
                    ["UIPadding"] = {
                        PaddingRight = UDim.new(0, 20),
                        PaddingTop = UDim.new(0, 2),
                        PaddingLeft = UDim.new(0, 2),
                    },
                })
            end
            
            local TabUI, TabContent = wax.shared.CreateTabContent()
            
            if TabsState.FooterContainer then
                TabUI.Size = UDim2.new(1, -12, 1, -118)
            else
                TabUI.Size = UDim2.new(1, -12, 1, -79)
            end
            
            TabUI.Parent = ModalFrame
            TabUI.Visible = false
            
            local TextWrapper = Interface.New("Frame", {
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.X,
                Size = UDim2.fromOffset(0, 24),
                ZIndex = 2,
    
                ["UIListLayout"] = {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0, 5),
                },
    
                ["UIPadding"] = {
                    PaddingRight = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                },
    
                ["TextLabel"] = {
                    Text = TabName,
                    TextSize = 15,
                    Size = UDim2.fromScale(0, 1),
                    AutomaticSize = Enum.AutomaticSize.X,
                    LayoutOrder = 2,
                    ZIndex = 2,
                },
            })
    
            Interface.NewIcon(Icon, {
                Position = UDim2.fromOffset(8, 5),
                Size = UDim2.fromOffset(16, 16),
                LayoutOrder = 1,
                ZIndex = 2,
                Parent = TextWrapper,
            })
            
            local ButtonColor = TabsState.CurrentTab == TabName and Color3.fromRGB(25, 25, 25) or Color3.fromRGB(0, 0, 0)
            local TabButton = Interface.New("TextButton", {
                BackgroundColor3 = ButtonColor,
                Size = UDim2.fromScale(0, 1),
                AutomaticSize = Enum.AutomaticSize.X,
                Text = "",
                Parent = TabsState.Container,
    
                ["UICorner"] = {
                    CornerRadius = UDim.new(0, 8),
                },
    
                ["UIStroke"] = {
                    Color = Color3.fromRGB(25, 25, 25),
                    Thickness = 1,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                },
    
                ["Frame"] = {
                    AnchorPoint = Vector2.new(0, 1),
                    Position = UDim2.fromScale(0, 1),
                    Size = UDim2.fromScale(1, 0.6),
                    BackgroundColor3 = ButtonColor,
                    BorderSizePixel = 0,
                },
                
                TextWrapper
            })
            
            TabsState.Buttons[TabName] = TabButton
            TabsState.Contents[TabName] = TabUI
            
            TabButton.MouseButton1Click:Connect(function()
                ModalInterface:SelectTab(TabName)
            end)
            
            if not TabsState.CurrentTab then
                ModalInterface:SelectTab(TabName)
            end
            
            return TabContent
        end

        function ModalInterface:AddFooterButton(Icon: string, Title: string, Options: {})
            if not TabsState.FooterContainer then
                TabsState.FooterContainer = Interface.New("Frame", {
                    AnchorPoint = Vector2.new(0, 1),
                    BackgroundTransparency = 1,
                    Position = UDim2.new(0, 6, 1, -7),
                    Size = UDim2.new(1, -12, 0, 32),
                    Parent = ModalFrame,
                
                    ["UIListLayout"] = {
                        FillDirection = Enum.FillDirection.Horizontal,
                        HorizontalAlignment = Enum.HorizontalAlignment.Center,
                        Padding = UDim.new(0, 6),
                    },
                })
                
                ContentFrame.Size = UDim2.new(1, 0, 1, -69) 
                for _, Content in pairs(TabsState.Contents) do
                    Content.Size = UDim2.new(1, -12, 1, -118)
                end
            end

            local Button = wax.shared.CreateInfoDropdownButton(Icon, Title, Options)
            Button.Parent = TabsState.FooterContainer
            
            return Button
        end

        return ModalInterface
    end

    --[[
        Creates a plugin settings tab, (visible after clicking a plugin in the plugins list)

        @return: The plugin settings tab.
    ]]
    function Cobalt.UI:CreatePluginSettings()
        if not CurrentPluginSettings then
            CurrentPluginSettings = wax.shared.PluginSettings:CreateSection(CurrentPluginData.Name, `PluginSettings-{CurrentPluginData.Name}-`)
        end

        return CurrentPluginSettings
    end
    
    --[[
        Creates a remote info tab, (visible after clicking a remote)

        @param TabName: The name of the tab.
        @param Icon: The icon of the tab.
        @return: The tab content and tab UI.
    ]]
    function Cobalt.UI.RemoteInfo:CreateTab(TabName: string, Icon: string)
        local TabUI, TabContent = wax.shared.CreateTabContent()
        wax.shared.CreateRemoteInfoTab(Icon, TabName, TabUI)
        
        return TabContent, TabUI
    end

    --[[
        Disables the default footer buttons for a specific Remote Info tab.

        @param TabName: The name of the tab to disable default buttons for.
    ]]
    function Cobalt.UI.RemoteInfo:DisableDefaultButtons(TabName: string)
        local TabRegistry = Manager.Registry.UIHooks.RemoteInfo.Tabs[TabName]
        		if not TabRegistry then
			Manager.Registry.UIHooks.RemoteInfo.Tabs[TabName] = { DisableDefaults = true, Buttons = {} }
		else
			TabRegistry.DisableDefaults = true
		end
		
		if Cobalt.UI.RemoteInfo.UpdateFooterButtons then
			Cobalt.UI.RemoteInfo.UpdateFooterButtons()
		end
	end

    --[[
		Empty function that gets hooked by Window.luau.
		When called, it forces the RemoteInfo footer buttons to update.
	]]
	function Cobalt.UI.RemoteInfo.UpdateFooterButtons()
		-- Hooked by Window.luau
	end

	--[[
		Adds a custom footer button to a specific Remote Info tab.

		@param TabName: The name of the tab to add the button to.
		@param Icon: The icon of the button (Lucide icon name).
		@param Title: The title text of the button.
		@param Options: The dropdown menu options for the button.
		@return: A function to remove the button.
	]]
	function Cobalt.UI.RemoteInfo:AddFooterButton(TabName: string, Icon: string, Title: string, Options: {})
		local TabRegistry = Manager.Registry.UIHooks.RemoteInfo.Tabs[TabName]
		if not TabRegistry then
			TabRegistry = { DisableDefaults = false, Buttons = {} }
			Manager.Registry.UIHooks.RemoteInfo.Tabs[TabName] = TabRegistry
		end

		local ButtonDefinition: { [any]: any } = {
			Icon = Icon,
			Title = Title,
			Options = Options
		}

		table.insert(TabRegistry.Buttons, ButtonDefinition)
		
		if Cobalt.UI.RemoteInfo.UpdateFooterButtons then
			Cobalt.UI.RemoteInfo.UpdateFooterButtons()
		end

		return function()
			local Index = table.find(TabRegistry.Buttons, ButtonDefinition)
			if Index then
				table.remove(TabRegistry.Buttons, Index)
				
				if ButtonDefinition.Instance then
					ButtonDefinition.Instance.Parent = nil
				end
				
				if Cobalt.UI.RemoteInfo.UpdateFooterButtons then
					Cobalt.UI.RemoteInfo.UpdateFooterButtons()
				end
			end
		end
	end
    
    --[[
        Binds a function to be called when a remote is opened in the remote info tab.

        @param Callback: The function to be called.
        @return: A function to remove the binded callback.
    ]]
    function Cobalt.UI.RemoteInfo:BindToModalOpen(Callback: (CallInfo: CodeGen.CallInfo) -> (...any))
        table.insert(Manager.Registry.UIHooks.RemoteInfo.Open, Callback)

        return function()
            local Index = table.find(Manager.Registry.UIHooks.RemoteInfo.Open, Callback)
            if Index then
                table.remove(Manager.Registry.UIHooks.RemoteInfo.Open, Index)
            end
        end
    end

    --[[
        Adds an interceptor to conditionally prevent a remote info modal from opening.
        The callback should return `false` to block the modal from opening, or `true`/`nil` to allow it.

        @param Callback: The function to be called before opening the modal.
        @return: A function to remove the added interceptor.
    ]]
    function Cobalt.UI.RemoteInfo:InterceptModalOpen(Callback: (CallInfo: CodeGen.CallInfo) -> (boolean?))
        table.insert(Manager.Registry.UIHooks.RemoteInfo.Intercept, Callback)

        return function()
            local Index = table.find(Manager.Registry.UIHooks.RemoteInfo.Intercept, Callback)
            if Index then
                table.remove(Manager.Registry.UIHooks.RemoteInfo.Intercept, Index)
            end
        end
    end

    --[[
        Adds a custom context menu option to specific elements of the UI.
        
        @param MenuType: "RemoteList" | "CallList"
        @param Icon: The Lucide icon string
        @param Title: The string title
        @param Callback: The function to run when clicked. Passes either Log or CallInfo depending on MenuType.
        @return: A function that removes the registered option when called.
    ]]
    function Cobalt.UI.ContextMenu:AddOption(MenuType: "RemoteList" | "CallList", Icon: string, Title: string, Callback: (InteractionData: any) -> ())
        if not Manager.Registry.UIHooks.ContextMenus[MenuType] then
            warn(`[Cobalt] Invalid MenuType provided to ContextMenu:AddOption. Expected RemoteList | CallList, got {tostring(MenuType)}`)
            return function() end
        end

        local OptionDefinition = {
            Icon = Icon,
            Text = Title,
            Callback = Callback
        }

        table.insert(Manager.Registry.UIHooks.ContextMenus[MenuType], OptionDefinition)

        return function()
            local Index = table.find(Manager.Registry.UIHooks.ContextMenus[MenuType], OptionDefinition)
            if Index then
                table.remove(Manager.Registry.UIHooks.ContextMenus[MenuType], Index)
            end
        end
    end

    --[[
        Uses cobalt's built-in syntax highlighter to colorize Luau code in RichText.

        @param code: The Luau code to colorize.
        @return: The colorized Luau code.
    ]]
    function Cobalt.UI.ColorizeLuauCode(code: string)
        return Highlighter.Run(code)
    end

    -- Merge Interface functions
    for Idx, Value in Interface do
        Cobalt.UI[Idx] = Value
    end

    -- Spy Functions
    type InterceptorFunction = (Info: CodeGen.CallInfo, Instance: Instance, Type: "Incoming" | "Outgoing") -> (...any)
    --[[
        Intercepts executed calls.

        @param Type: The type of calls to intercept.
        @param Data: The data to intercept.
        @return: A function to remove the interceptor.
    ]]
    function Cobalt.Spy:InterceptExecutedCalls(Type: "Incoming" | "Outgoing" | "All", Data: {
        Callback: InterceptorFunction,
        Instance: Instance | nil,
    } | InterceptorFunction)
        Manager.HasInterceptors = true

        local Options = typeof(Data) == "table" and setmetatable(Data, { __mode = "v" }) or setmetatable({
            Callback = Data,
            Instance = nil,
        }, { __mode = "v" })

        local IsInstanceSpecific = Options.Instance ~= nil
        
        if IsInstanceSpecific then
            -- Ensure Instance specific
            local InstanceInterceptors = Manager.Registry.Interceptors.Instance[Options.Instance]
            if not InstanceInterceptors then
                Manager.Registry.Interceptors.Instance[Options.Instance] = {}
                InstanceInterceptors = Manager.Registry.Interceptors.Instance[Options.Instance]
            end

            -- Ensure Direction specific (Incoming, Outgoing, All)
            if not InstanceInterceptors[Type] then
                InstanceInterceptors[Type] = {}
            end

            table.insert(InstanceInterceptors[Type], Options.Callback)
        else
            -- Ensure Global Direction specific (Incoming, Outgoing, All)
            local GlobalInterceptors = Manager.Registry.Interceptors.Global[Type]
            if not GlobalInterceptors then
                Manager.Registry.Interceptors.Global[Type] = {}
                GlobalInterceptors = Manager.Registry.Interceptors.Global[Type]
            end

            table.insert(GlobalInterceptors, Options.Callback)
        end

        -- Cleanup function
        return function()
            if IsInstanceSpecific then
                if not Options.Instance then
                    return
                end

                local InstanceInterceptors = Manager.Registry.Interceptors.Instance[Options.Instance]
                if not InstanceInterceptors then
                    return
                end

                local Interceptors = InstanceInterceptors[Type]
                if not Interceptors then
                    return
                end

                local Index = table.find(Interceptors, Options.Callback)
                if Index then
                    table.remove(Interceptors, Index)
                end
            else
                local GlobalInterceptors = Manager.Registry.Interceptors.Global[Type]
                if not GlobalInterceptors then
                    return
                end

                local Index = table.find(GlobalInterceptors, Options.Callback)
                if Index then
                    table.remove(GlobalInterceptors, Index)
                end
            end
        end
    end

    --[[
        Clears the tracked logs, optionally filtering by instance or type.

        @param Instance: The optional instance to clear logs for.
        @param Type: The optional type to clear logs for (Incoming, Outgoing, All).
    ]]
    function Cobalt.Spy:ClearLogs(Instance: Instance?, Type: string?)
        wax.shared.ClearLogs(Instance, if Type == "All" then nil else Type)
    end

    --[[
        Appends mock execution data or external logs into the tracking system.

        @param Instance: The remote instance to append the log to.
        @param Type: The type of log (Incoming, Outgoing).
        @param Data: The execution data table payload.
    ]]
    function Cobalt.Spy:AppendLog(Instance: Instance, Type: "Incoming" | "Outgoing", Data: {})
        local Method = wax.shared.FunctionForClasses[Type][Instance.ClassName]
        local Log = wax.shared.Logs[Type][Instance] or wax.shared.NewLog(Instance, Type, Method, nil)

        if Log.Blocked or Log.Ignored then
            return
        end

        Log:Call(Data)
        wax.shared.Communicator.Fire(wax.shared.Communicator, Instance, Type, #Log.Calls)
    end

    --[[
        Gets the log for a specific instance and type.

        @param instance: The instance to get the log for.
        @param type: The type of log to get.
        @return: The log for the specific instance and type.
    ]]
    function Cobalt:GetLog(instance: Instance, type: "Incoming" | "Outgoing")
        return wax.shared.Logs[type][instance]
    end

    --[[
        Intercepts code generation.

        @param Type: The type of code generation to intercept.
        @param Callback: The callback to execute when code generation is intercepted. If callback returns a string, it will be used as the generated code instead of the default generated code. If callback returns nil, the default generated code will be used.
        @return: A function to remove the interceptor.
    ]]
    function Cobalt.CodeGen:InterceptGeneration(Type: "Call" | "Hook" | "InstancePath", Callback: (Info: any, ...any) -> (...any))
        Manager.HasCodeGenInterceptors = true
        
        local Interceptors = Manager.Registry.UIHooks.CodeGen[Type]
        assert(Interceptors, "Invalid Code Generation Type")

        table.insert(Interceptors, Callback)

        return function()
            local Index = table.find(Interceptors, Callback)
            if Index then
                table.remove(Interceptors, Index)
            end
        end
    end

    --[[
        Serializes data to a string.

        @param data: The data to serialize.
        @param options: The options to use for serialization.
        @return: The serialized data.
    ]]
    function Cobalt.CodeGen.Serialize(data, options)
        if typeof(data) == "table" then
            return wax.shared.LuaEncode(data, options)
        elseif typeof(data) == "Instance" then
            return CodeGen.GetFullPath(data, options)
        end

        return UIHelper.QuickSerializeArgument(data)      
    end

    --[[
        Indents code.

        @param str: The code to indent.
        @param indent: The amount of indentation to add.
        @return: The indented code.
    ]]
    function Cobalt.CodeGen.Indent(str: string, indent: number)
        return CodeGen:IndentCode(str, indent)
    end

    -- Handle Cobalt.PluginData assignment
    setmetatable(Cobalt, {
        __newindex = function(_, Key, Value)
            --[[
            Example:

            ```lua
            Cobalt.PluginData = {
		        Name = "ByteNet",
		        Description = "Adds ByteNet support to Cobalt.",
                Author = "upio",
                Version = "1.0.0",
		        Game = "*" -- Can be place id string or table of place ids
	        }
            ```

            Case insensitive to allow camelCase and PascalCase
            ]]
            if Key:lower() == "plugindata" then
                local PluginData = Validate(Value, TemplatePluginData)
                local IsSupported = true
                
                -- Check if plugin is supported in this game
                if type(PluginData.Game) == "string" then
                    if PluginData.Game ~= "*" and tostring(game.PlaceId) ~= PluginData.Game and tostring(game.GameId) ~= PluginData.Game then
                        IsSupported = false
                    end
                elseif type(PluginData.Game) == "number" then
                    if game.PlaceId ~= PluginData.Game and game.GameId ~= PluginData.Game then
                        IsSupported = false
                    end
                elseif type(PluginData.Game) == "table" then
                    local Match = false
                    for _, id in pairs(PluginData.Game) do
                        if tostring(game.PlaceId) == tostring(id) or tostring(game.GameId) == tostring(id) then
                            Match = true
                            break
                        end
                    end
                    if not Match then IsSupported = false end
                end

                if not IsSupported then
                    PluginErrored(FilePath, "Plugin is not supported in this game.")
                    
                    -- Cancel Plugin Thread
                    if coroutine.status(PluginThread) ~= "dead" then
                        pcall(task.cancel, PluginThread)
                    end
                    return
                end

                -- Register Plugin
                table.insert(Manager.Registry.Plugins, {
                    FilePath = FilePath,
                    PluginData = PluginData,
                    PluginThread = PluginThread,
                    UnloadCallbacks = {},
                })

                CurrentPluginData = PluginData
                return
            end

            return rawset(Cobalt, Key, Value)
        end,
    })
    
    return setmetatable({ Cobalt = Cobalt }, {
        __index = getfenv(PluginCallback)
    })
end

--[[
    Sets up all plugins.
]]
function Manager.SetupPlugins()
	for _, FilePath in PluginFiles:ListFiles() do
        -- Load Plugin
		local Plugin, CompileError = loadstring(
            PluginFiles:ReadFile(FilePath),
            `CobaltPlugin-{PluginFiles:GetFileName(FilePath)}`
        )
		if CompileError then
            PluginErrored(FilePath, CompileError)
			continue
		end

        -- Register Plugin
        local PluginThread = task.spawn(function()
            coroutine.yield()

            local Success, Error = pcall(Plugin)
            if not Success then
                PluginErrored(FilePath, Error)
            end
        end)

        -- Set Plugin Environement
        setfenv(Plugin, CreatePluginEnvironement(FilePath, Plugin, PluginThread))

        -- Start Plugin
        coroutine.resume(PluginThread)
	end

    Manager.Initialized = true
end

return Manager
end)() end,
    [12] = function()local wax,script,require=ImportGlobals(12)local ImportGlobals return (function(...)local ClassesToHook = {
	RemoteEvent = "OnClientEvent",
	RemoteFunction = "OnClientInvoke",
	UnreliableRemoteEvent = "OnClientEvent",
	BindableEvent = "Event",
	BindableFunction = "OnInvoke",
}

type InstancesToHook = RemoteEvent | UnreliableRemoteEvent | RemoteFunction | BindableEvent | BindableFunction
type MethodsToHook = "OnClientEvent" | "OnClientInvoke" | "Event" | "OnInvoke"

local LogConnectionFunctions = {}
local SignalMapping = setmetatable({}, { __mode = "kv" })
wax.shared.IncomingLogConnectionFunctions = LogConnectionFunctions

local function CreateLookupTable(table)
	local LookupTable = {}
	for _, Method in next, table do
		LookupTable[Method] = true
	end
	return LookupTable
end


local function GetLog(Instance: InstancesToHook, Method: MethodsToHook, Function: (...any) -> ...any)
	if wax.shared.ShouldIgnore(Instance, getcallingscript()) or LogConnectionFunctions[Function] then
		return nil
	end

	local Log = wax.shared.Logs.Incoming[Instance]
	if not Log then
		Log = wax.shared.NewLog(Instance, "Incoming", Method, getcallingscript())
	end

	return Log
end

--[[
	Individually logs an incoming remote call.

	@param Instance The instance that was called.
	@param Method The method that was called (e.g., "OnClientEvent").
	@param Function The function that was called, if applicable.
	@param Info The information about the call, including arguments and origin. Can be nil.
	@param ... The arguments passed from the server to the client.
	@return boolean, Log? Returns true if the call was blocked, plus the log when one was used.
]]
local function LogRemote(
	Instance: InstancesToHook,
	Method: MethodsToHook,
	Function: (...any) -> ...any,
	Info: {
		Arguments: { [number]: any, n: number },
		Origin: Instance,
		Function: (...any) -> ...any,
		Line: number,
		IsExecutor: boolean,
		Blocked: boolean?,
	}
)
	local Log = GetLog(Instance, Method, Function)
	if not Log then
		return false, nil
	end

	if Log.Blocked then
		if wax.shared.SaveManager:GetState("LogBlockedRemotes", false) then
			Info.Blocked = true
			Log:Call(Info)
		end

		return true, Log
	elseif not Log.Ignored then
		Log:Call(Info)
		return false, Log
	end

	return false, Log
end

--[[
	Creates a function that can be used to pass to `Connect` which will log all the incoming calls. It will additonally add the function to a ignore list (`LogConnectionFunctions`) to prevent unneccessary logging.
	
	@param Instance The instance to log.
	@param Method The method to log (e.g., "OnClientEvent").
	@return function Returns a function that logs all calls to the given instance and method.
]]
local function CreateConnectionFunction(Instance: InstancesToHook, Method: MethodsToHook)
	local ConnectionFunction = function(...)
		local HasLoggedRegular = false
		for _, Connection in getconnections((Instance :: any)[Method]) do
			if Connection.ForeignState then
				continue
			end

			local Function = typeof(Connection.Function) == "function" and Connection.Function or nil
			local Thread = Connection.Thread

			local Origin = nil

			if Thread and getscriptfromthread then
				Origin = getscriptfromthread(Thread)
			end

			if not Origin and Function then
				-- ts is unreliable because people could js set the script global to nil
				-- if only debug.getinfo(Function).source or debug.info(Function, "s") returned an Instance...

				local Script = rawget(getfenv(Function), "script")
				if typeof(Script) == "Instance" then
					Origin = Script
				end
			end

			if not HasLoggedRegular and not LogConnectionFunctions[Function] then
				HasLoggedRegular = true
			end

			LogRemote(Instance, Method, Function, {
				Arguments = table.pack(...),
				Origin = Origin,
				Function = Function,
				Line = nil,
				IsExecutor = Function and isexecutorclosure(Function) or false,
			})
		end

		if not HasLoggedRegular then
			LogRemote(Instance, Method, nil, {
				Arguments = table.pack(...),
				Origin = nil,
				Function = nil,
				Line = nil,
				IsExecutor = false,
			})
		end
	end

	LogConnectionFunctions[ConnectionFunction] = true
	return ConnectionFunction
end

--[[
	Creates a function that can be used to pass to callbacks (.OnInvoke & .OnClientInvoke) which will log all the incoming calls.
	
	@param Instance The instance to log.
	@param Method The method to log (e.g., "OnClientEvent").
	@param Function The original callback of the RemoteFunction
	@return function Returns a function that logs all function calls to the given instance and method.
]]
local function CreateCallbackDetour(Instance: InstancesToHook, Method: MethodsToHook, Callback: (...any) -> ...any)
	local Detour = function(...)
		local Origin = nil

		-- May not exist in all executors
		if getscriptfromthread then
			Origin = getscriptfromthread(coroutine.running())
		end

		-- Unreliable method to get script.
		if not Origin then
			local Script = rawget(getfenv(Callback), "script")
			if typeof(Script) == "Instance" then
				Origin = Script
			end
		end

		local FunctionCaller = debug.info(2, "f")
		local IsExecutor = if typeof(FunctionCaller) == "function"
			then isexecutorclosure(FunctionCaller)
			else isexecutorclosure(Callback)

		local OriginalInvokeArgs = table.pack(...)
		local Log = GetLog(Instance, Method, Callback)

		if Log and Log.Blocked then
			if wax.shared.SaveManager:GetState("LogBlockedRemotes", false) then
				Log:Call({
					Arguments = OriginalInvokeArgs,
					Origin = Origin,
					Function = Callback,
					Line = nil,
					IsExecutor = IsExecutor,
					Blocked = true,
				})
			end

			return
		end

		local old = getthreadidentity()
		setthreadidentity(2)
		local Result = table.pack(Callback(table.unpack(OriginalInvokeArgs, 1, OriginalInvokeArgs.n)))
		setthreadidentity(old)

		if Log and not Log.Ignored then
			Log:Call({
				Arguments = Result,
				Origin = Origin,
				Function = Callback,
				Line = nil,
				IsExecutor = IsExecutor,
				OriginalInvokeArgs = OriginalInvokeArgs,
				IsCallbackReturn = true,
			})
		end

		return table.unpack(Result, 1, Result.n)
	end

	if wax.shared.ExecutorSupport["setstackhidden"].IsWorking then
		setstackhidden(Detour, true)
	end

	return Detour
end

--[[
	Handles setting up logging for the appropriate instances.

	@param Instance The instance to handle.
]]
local function HandleInstance(Instance: any)
	if
		not ClassesToHook[Instance.ClassName]
		or Instance == wax.shared.Communicator
		or Instance == wax.shared.ActorCommunicator
	then
		return
	end

	local Method = ClassesToHook[Instance.ClassName]

	if Instance.ClassName == "RemoteEvent" or Instance.ClassName == "UnreliableRemoteEvent" then
		wax.shared.Connect(Instance.OnClientEvent:Connect(CreateConnectionFunction(Instance, Method)))

		SignalMapping[Instance.OnClientEvent] = Instance
	elseif Instance.ClassName == "BindableEvent" then
		wax.shared.Connect(Instance.Event:Connect(CreateConnectionFunction(Instance, Method)))

		SignalMapping[Instance.Event] = Instance
	elseif Instance.ClassName == "RemoteFunction" or Instance.ClassName == "BindableFunction" then
		local Success, Callback = pcall(getcallbackvalue, Instance, Method)
		local IsCallable = (
			typeof(Callback) == "function"
			or wax.shared.getrawmetatable(Callback) ~= nil and typeof(wax.shared.getrawmetatable(Callback)["__call"]) == "function"
			or false
		)

		if not Success or not IsCallable then
			return
		end

		Instance[Method] = CreateCallbackDetour(Instance, Method, Callback)
	end
end

wax.shared.Connect(game.DescendantAdded:Connect(HandleInstance))

local CategoryToSearch = { game:QueryDescendants("RemoteEvent, RemoteFunction, UnreliableRemoteEvent, BindableEvent, BindableFunction") }
if wax.shared.ExecutorSupport["getnilinstances"].IsWorking then
	table.insert(CategoryToSearch, getnilinstances())
end

for _, Category in CategoryToSearch do
	for _, Instance in next, Category do
		HandleInstance(Instance)
	end
end

wax.shared.NewIndexHook = wax.shared.Hooking.HookMetaMethod(game, "__newindex", function(...)
	local self, key, value = ...

	if typeof(self) ~= "Instance" or not ClassesToHook[self.ClassName] then
		return wax.shared.NewIndexHook(...)
	end

	if self.ClassName == "RemoteFunction" or self.ClassName == "BindableFunction" then
		local Method = ClassesToHook[self.ClassName]

		local IsCallable = (
			typeof(value) == "function"
			or wax.shared.getrawmetatable(value) ~= nil and typeof(wax.shared.getrawmetatable(value)["__call"]) == "function"
			or false
		)

		if key == Method and IsCallable then
			return wax.shared.NewIndexHook(self, key, CreateCallbackDetour(self :: InstancesToHook, Method, value))
		end
	end

	return wax.shared.NewIndexHook(...)
end)

local ConnectionKeys = CreateLookupTable({
	"Connect",
	"ConnectParallel",
	"connect",
	"connectParallel",
	"Once",
})

local SignalMetatable = wax.shared.getrawmetatable(Instance.new("Part").Touched)
wax.shared.Hooks[SignalMetatable.__index] = wax.shared.Hooking.HookFunction(SignalMetatable.__index, function(...)
	local self, key = ...

	if not wax.shared.Unloaded and ConnectionKeys[key] then
		local Instance = SignalMapping[self]
		local Connect = wax.shared.Hooks[SignalMetatable.__index](...)

		if not Instance then
			return Connect
		end

		local Method = ClassesToHook[Instance.ClassName]
		return wax.shared.newcclosure(function(...)
			local _self, callback = ...

			local Result = table.pack(Connect(...))
			local Log = wax.shared.Logs.Incoming[Instance]

			if Log and Log.Blocked then
				for _, Connection in getconnections(Instance[Method]) do
					if not Connection.ForeignState and Connection.Function ~= callback then
						continue
					end

					Connection:Disable()
				end
			end

			return table.unpack(Result, 1, Result.n)
		end, debug.info(Connect, "n"))
	end

	return wax.shared.Hooks[SignalMetatable.__index](...)
end)

end)() end,
    [32] = function()local wax,script,require=ImportGlobals(32)local ImportGlobals return (function(...)local FileHelperUtil = require(script.Parent.FileHelper)

local SaveManager = {
	State = {},
}

local FileHelper = FileHelperUtil.new("Cobalt")
FileHelper:EnsureFile("Settings.json", "{}")

local Success, Error = pcall(function()
	SaveManager.State = wax.shared.HttpService:JSONDecode(FileHelper:ReadFile("Settings.json"))
end)

if not Success then
	warn("Failed to load settings: " .. Error)
end

function SaveManager:SetState(Idx, Value)
	SaveManager.State[Idx] = Value
	pcall(FileHelper.WriteFile, FileHelper, "Settings.json", wax.shared.HttpService:JSONEncode(SaveManager.State))
end

function SaveManager:GetState(Idx, Default)
	if SaveManager.State[Idx] ~= nil then
		return SaveManager.State[Idx]
	end

	return Default
end

return SaveManager

end)() end,
    [29] = function()local wax,script,require=ImportGlobals(29)local ImportGlobals return (function(...)--[[

Pagination Module
made by deivid and turned into module by upio

]]

local Pagination = {}
Pagination.__index = Pagination

function Pagination.new(Options: {
	TotalItems: number,
	ItemsPerPage: number,
	CurrentPage: number?,
	SiblingCount: number?,
})
	return setmetatable({
		TotalItems = Options.TotalItems,
		ItemsPerPage = Options.ItemsPerPage,
		CurrentPage = Options.CurrentPage or 1,
		SiblingCount = Options.SiblingCount or 2,
	}, Pagination)
end

function Pagination:GetInfo()
	local TotalPages = math.ceil(self.TotalItems / self.ItemsPerPage)

	return {
		TotalItems = self.TotalItems,
		ItemsPerPage = self.ItemsPerPage,
		CurrentPage = self.CurrentPage,
		TotalPages = TotalPages,
	}
end

function Pagination:SetItemsPerPage(max: number)
	self.ItemsPerPage = max
end

function Pagination:GetIndexRanges(Page: number?)
	Page = Page or self.CurrentPage

	local TotalPages = math.ceil(self.TotalItems / self.ItemsPerPage)
	if TotalPages == 0 then
		return 1, 0
	end
	assert(
		Page <= TotalPages,
		"Attempted to get invalid page out of range, got " .. Page .. " but max is " .. TotalPages
	)

	local Start = (((Page or self.CurrentPage) - 1) * self.ItemsPerPage) + 1
	local End = Start + (self.ItemsPerPage - 1)

	return Start, End
end

function Pagination:SetPage(Page: number)
	local TotalPages = math.ceil(self.TotalItems / self.ItemsPerPage)
	if TotalPages == 0 then
		self.CurrentPage = 1
		return
	end
	assert(Page <= TotalPages, "Attempted to set page out of range, got " .. Page .. " but max is " .. TotalPages)

	self.CurrentPage = Page
end

function Pagination:Update(TotalItems: number?, ItemsPerPage: number?)
	self.TotalItems = TotalItems or self.TotalItems
	self.ItemsPerPage = ItemsPerPage or self.ItemsPerPage
end

function Pagination:GetVisualInfo(Page: number?)
	Page = Page or self.CurrentPage

	local TotalPages = math.ceil(self.TotalItems / self.ItemsPerPage)
	if TotalPages == 0 then
		return {}
	end

	assert(
		Page <= TotalPages,
		"Attempted to get invalid page out of range, got " .. Page .. " but max is " .. TotalPages
	)

	local MaxButtons = 5 + self.SiblingCount * 2
	local Result = table.create(MaxButtons, "none")
	if TotalPages <= MaxButtons then
		for i = 1, TotalPages do
			Result[i] = i
		end
		return Result
	end

	local LeftSibling = math.max(Page - self.SiblingCount, 1)
	local RightSibling = math.min(Page + self.SiblingCount, TotalPages)

	local FakeLeft = LeftSibling > 2
	local FakeRight = RightSibling < TotalPages - 1

	local TotalPageNumbers = math.min(2 * self.SiblingCount + 5, TotalPages)
	local ItemCount = TotalPageNumbers - 2

	if not FakeLeft and FakeRight then
		for i = 1, ItemCount do
			Result[i] = i
		end
		Result[ItemCount + 1] = "ellipsis"
		Result[ItemCount + 2] = TotalPages
		--return MergeTables(LeftRange, "ellipsis", TotalPages)
		return Result
	elseif FakeLeft and not FakeRight then
		--local RightRange = CreateArray(TotalPages - ItemCount + 1, TotalPages)
		Result[1] = 1
		Result[2] = "ellipsis"

		local Index = 3
		for i = TotalPages - ItemCount + 1, TotalPages do
			Result[Index] = i
			Index += 1
		end

		return Result
	elseif FakeLeft and FakeRight then
		--local MiddleRange = CreateArray(LeftSibling, RightSibling)
		Result[1] = 1
		Result[2] = "ellipsis"
		local Index = 3

		for i = LeftSibling, RightSibling do
			Result[Index] = i
			Index += 1
		end

		Result[Index] = "ellipsis"
		Result[Index + 1] = TotalPages

		return Result
		--return MergeTables(1, "ellipsis", MiddleRange, "ellipsis", TotalPages)
	end

	--return CreateArray(1, TotalPages)
	for i = 1, TotalPages do
		Result[i] = i
	end
	return Result
end

return Pagination

end)() end,
    [24] = function()local wax,script,require=ImportGlobals(24)local ImportGlobals return (function(...)wax.shared.Connections = {}

wax.shared.Connect = function(Connection)
	table.insert(wax.shared.Connections, Connection)
	return Connection
end

wax.shared.Disconnect = function(Connection)
	Connection:Disconnect()

	local Index = table.find(wax.shared.Connections, Connection)
	if Index then
		table.remove(wax.shared.Connections, Index)
	end

	return true
end

return {}
end)() end,
    [22] = function()local wax,script,require=ImportGlobals(22)local ImportGlobals return (function(...)local Utils = script.Parent.Parent

local LuaEncode = require(script.Parent.Parent.Serializer.LuaEncode)
local CodeGen = require(script.Parent.Generator)

local SessionExporter = {}
do
    local StringMapper = {}
    StringMapper.__index = StringMapper

    function StringMapper.New()
        return setmetatable({
            StringMap = {},
            StringList = {},
            NextStringId = 1,
        }, StringMapper)
    end

    function StringMapper:GetId(Str)
        if Str == nil then Str = "nil" end
        Str = tostring(Str)
        if not self.StringMap[Str] then
            self.StringMap[Str] = self.NextStringId
            self.StringList[tostring(self.NextStringId)] = Str
            self.NextStringId = self.NextStringId + 1
        end
        return self.StringMap[Str]
    end

    function StringMapper:GetString(Id)
        return self.StringList[Id]
    end

    SessionExporter.StringMapper = StringMapper
end

function SessionExporter:FetchAllLogs()
	local AllCalls = {}

	for _, LogCategory in next, wax.shared.Logs do
		for _, Log in next, LogCategory do
			for Idx, Call in next, Log.Calls do
				table.insert(AllCalls, setmetatable(Call, {
					__index = Log
				}))
			end
		end
	end

	return AllCalls
end

function SessionExporter:SortCalls(AllCalls)
	table.sort(AllCalls, function(a, b)
		local TimeA = a.CreationTime or 0
		local TimeB = b.CreationTime or 0
		return TimeA < TimeB
	end)
end

function SessionExporter:GetSessionData(AllCalls)
	local StartTime = wax.shared.CobaltStartTime or tick()
	local EndTime = AllCalls[#AllCalls] and AllCalls[#AllCalls].CreationTime or tick()
	local Duration = math.max(0.1, EndTime - StartTime)
	local SessionId = wax.shared.HttpService:GenerateGUID(false)

	return {
        StartTime = StartTime,
        EndTime = EndTime,
        Duration = Duration,
        SessionId = SessionId,
    }
end

function SessionExporter:EscapeHTML(Str)
	return Str:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;")
end

function SessionExporter:SerializeLuauTableForHTML(Table)
	local SerializedString = LuaEncode(Table, {
		Prettify = true,
		InsertCycles = true,
		DisableNilParentHandler = true,
	})
	
	return self:EscapeHTML(SerializedString)
end

function SessionExporter:ProcessCalls(AllCalls, SessionData, UpdateProgress)
	local StringMapper = self.StringMapper.New()

    local Events = {}
    local AllCallsNum = #AllCalls
    for Idx, Call in next, AllCalls do
        if Idx % 500 == 0 then
            if UpdateProgress then
                UpdateProgress(`Processing... ({Idx}/{AllCallsNum})`)
            end
            task.wait()
        end

        local ArgsString = self:SerializeLuauTableForHTML(
            { table.unpack(Call.Arguments, 1, Call.Arguments.n) }
        )

        local Method = "Unknown"
        if wax.shared.FunctionForClasses[Call.Type] then
            Method = wax.shared.FunctionForClasses[Call.Type][Call.Instance.ClassName] or Method
        end

        local FunctionName, FunctionLine, FunctionSource, FunctionHash = "Unknown", Call.Line or -1, Call.Source or "Unknown", "N/A"
        local FunctionUpvalues, FunctionProtos, FunctionConstants = "{}", "{}", "{}"
        do
            if type(Call.Function) == "table" and Call.Actor ~= nil then
                FunctionName = Call.Function.Name ~= "" and Call.Function.Name or "Anonymous"
                FunctionSource = Call.Function.Source or "N/A"
                FunctionLine = Call.Function.Line or -1
                
                if not Call.Function.IsC then
                    FunctionHash = Call.Function.FunctionHash or "N/A"
                    FunctionUpvalues = self:SerializeLuauTableForHTML(Call.Function.Upvalues)
                    FunctionProtos = self:SerializeLuauTableForHTML(Call.Function.Protos)
                    FunctionConstants = self:SerializeLuauTableForHTML(Call.Function.Constants)
                else
                    FunctionHash = "N/A (C Closure)"
                    FunctionUpvalues = "N/A (C Closure)"
                    FunctionProtos = "N/A (C Closure)"
                    FunctionConstants = "N/A (C Closure)"
                end
            elseif type(Call.Function) == "function" then
                FunctionName = debug.info(Call.Function, "n")
            
                if islclosure(Call.Function) then
                    FunctionHash = getfunctionhash and getfunctionhash(Call.Function) or "N/A"
                    FunctionUpvalues = self:SerializeLuauTableForHTML(debug.getupvalues(Call.Function))
                    FunctionProtos = self:SerializeLuauTableForHTML(debug.getprotos(Call.Function))
                    FunctionConstants = self:SerializeLuauTableForHTML(debug.getconstants(Call.Function))
                else
                    FunctionHash = "N/A (C Closure)"
                    FunctionUpvalues = "N/A (C Closure)"
                    FunctionProtos = "N/A (C Closure)"
                    FunctionConstants = "N/A (C Closure)"
                end
            else
                FunctionName = tostring(Call.Function or "Unknown")
            end

            if FunctionName == "" then FunctionName = "Anonymous" end
        end

        local OriginPath = Call.Origin and CodeGen.GetFullPath(Call.Origin, {
            DisableNilParentHandler = true,
        }) or "Unknown"

        table.insert(Events, {
            StringMapper:GetId(Call.Instance.Name),
            StringMapper:GetId(Call.Instance.ClassName),
            StringMapper:GetId(CodeGen.GetFullPath(Call.Instance, {
                DisableNilParentHandler = true,
            })),

            StringMapper:GetId(Method),
            (Call.CreationTime or SessionData.StartTime),
            StringMapper:GetId(OriginPath),

            StringMapper:GetId(ArgsString),
            StringMapper:GetId(Method),

            StringMapper:GetId(FunctionName),
            FunctionLine,
            StringMapper:GetId(FunctionSource),
            Call.IsExecutor and 1 or 0,
            Call.Actor ~= nil and 1 or 0,

            StringMapper:GetId(FunctionHash),
            StringMapper:GetId(FunctionUpvalues),
            StringMapper:GetId(FunctionProtos),
            StringMapper:GetId(FunctionConstants),
            Call.Blocked and 1 or 0
        })
    end

    return Events, StringMapper
end

function SessionExporter:ExportSessionToHTML(Events, StringMapper, SessionData)
    local Template = Utils.CodeGen.SessionHTMLView.Value
    local StartDateStr = os.date("%d %b %Y, %H:%M:%S", math.floor(SessionData.StartTime))
    local EndDateStr = os.date("%d %b %Y, %H:%M:%S", math.floor(SessionData.EndTime))

    local HTML = Template
        :gsub("{{EVENTS_JSON}}", function() return wax.shared.HttpService:JSONEncode(Events) end)
        :gsub("{{DICTIONARY_JSON}}", function() return wax.shared.HttpService:JSONEncode(StringMapper.StringList) end)
        :gsub("{{SESSION_ID}}", SessionData.SessionId)
        :gsub("{{START_TIME}}", tostring(SessionData.StartTime))
        :gsub("{{DURATION}}", tostring(SessionData.Duration))
        :gsub("{{EVENT_COUNT}}", tostring(#Events))
        :gsub("{{TOTAL_DURATION}}", string.format("%.2f", SessionData.Duration))
        :gsub("{{PLACE_ID}}", tostring(game.PlaceId))
        :gsub("{{JOB_ID}}", game.JobId)
        :gsub("{{DATE}}", StartDateStr)
        :gsub("{{END_DATE}}", EndDateStr)

    return HTML
end

return SessionExporter

end)() end,
    [21] = function()local wax,script,require=ImportGlobals(21)local ImportGlobals return (function(...)local CodeGen = {
	CleanTable = { ['"'] = '\\"', ["\\"] = "\\\\" },
	IndentTemplate = string.rep(" ", 4),
}

export type SupportedRemoteTypes = RemoteEvent | RemoteFunction | BindableEvent | BindableFunction | UnreliableRemoteEvent
export type CallInfo = {
	Arguments: { [number]: any, n: number },
	CreationTime: number,
	Origin: BaseScript?,
	Function: (
		...any
	) -> any | {
		Address: string,
		Name: string,
		Source: string?,
		IsC: boolean,
		Constants: { any }?,
		Upvalues: { any }?,
		Protos: { any }?,
		FunctionHash: string?,
	},
	Line: number?,
	Source: string?,
	Instance: SupportedRemoteTypes,
	Order: number,
	Type: "Incoming" | "Outgoing",
	OriginalInvokeArgs: { [number]: any, n: number }?,
	IsCallbackReturn: boolean?,
	IsExecutor: boolean?,
	Path: string?,
	Actor: Actor?,
}

wax.shared.FunctionForClasses = {
	Incoming = {
		RemoteEvent = "OnClientEvent",
		RemoteFunction = "OnClientInvoke",
		UnreliableRemoteEvent = "OnClientEvent",
		BindableEvent = "Event",
		BindableFunction = "OnInvoke",
	},

	Outgoing = {
		RemoteEvent = "FireServer",
		RemoteFunction = "InvokeServer",
		UnreliableRemoteEvent = "FireServer",
		BindableEvent = "Fire",
		BindableFunction = "Invoke",
	},
}

local GetNilCode = [[local function GetNil(Name, DebugId)
	for _, Object in getnilinstances() do
		if Object.Name == Name and Object:GetDebugId() == DebugId then
			return Object
		end
	end
end]]

local GetEventReferenceCode = [[local function GetEventReference(options)
	local Hash, Index, ExcludeExecutor, Path = options.Hash, options.Index, options.ExcludeExecutor, options.Path
	local Retrieved = nil

	if filtergc then
		Retrieved = filtergc("function", {
			Hash = Hash,
			IgnoreExecutor = ExcludeExecutor
		}, true)
	else
		for _, Func in getgc() do
			if typeof(Func) ~= "function" then
				continue
			end

			if ExcludeExecutor and isexecutorclosure(Func) then
				continue
			end
			
			if getfunctionhash(Func) == Hash then
				Retrieved = Func
				break
			end
		end
	end

	assert(Retrieved, "Could not find function with hash " .. tostring(Hash))
	local Value = debug.getupvalue(Retrieved, Index)

	if Path then
		for _, Key in next, Path do
			Value = Value[Key]
		end
	end

	return Value
end]]

--// Pasted from Dex (maximum detection)
for i = 0, 31 do
	CodeGen.CleanTable[string.char(i)] = "\\" .. string.format("%03d", i)
end
for i = 127, 255 do
	CodeGen.CleanTable[string.char(i)] = "\\" .. string.format("%03d", i)
end

function CodeGen.FormatLuaString(str)
	return string.gsub(str, '["\\\0-\31\127-\255]', CodeGen.CleanTable)
end

local function FormatLuaLiteral(Value): string?
	local ValueType = type(Value)
	if ValueType == "string" then
		return `"{CodeGen.FormatLuaString(Value)}"`
	elseif ValueType == "number" or ValueType == "boolean" then
		return tostring(Value)
	end

	return nil
end

local function FormatLuaArray(Values: { any }): string
	local Serialized = {}
	for _, Value in Values do
		local Literal = FormatLuaLiteral(Value)
		if not Literal then
			return "{}"
		end

		table.insert(Serialized, Literal)
	end

	return "{ " .. table.concat(Serialized, ", ") .. " }"
end

local function IsEqualToInstance(Object, ToCompareTo)
	if rawequal(Object, ToCompareTo) then
		return true
	end

	if wax.shared.ExecutorSupport["compareinstances"].IsWorking then
		return compareinstances(Object, ToCompareTo)
	end

	return false
end

function CodeGen.GetFullPath(Object, options: {
	DisableNilParentHandler: boolean?,
	VariableName: string?,
	OmitNilFunctionGetterCodeGeneration: boolean?,
	IgnorePlugins: boolean?,
	EventReference: {
		Hash: string,
		Index: number,
		ExcludeExecutor: boolean?,
		Path: { any }?,
	}?,
}?)
	local DisableNilParentHandler = options and options.DisableNilParentHandler
	local OmitNilFunctionGetterCodeGeneration = options and options.OmitNilFunctionGetterCodeGeneration
	local VariableName = options and options.VariableName
	local IgnorePlugins = options and options.IgnorePlugins
	local EventReference = options and options.EventReference
	do
		if DisableNilParentHandler == nil then
			DisableNilParentHandler = true
		end

		if OmitNilFunctionGetterCodeGeneration == nil then
			OmitNilFunctionGetterCodeGeneration = false
		end
	end

	if not IgnorePlugins then
		local PluginManager = wax.shared.CobaltPluginManager
		if PluginManager and PluginManager.HasCodeGenInterceptors then
			local Interceptors = PluginManager.Registry.UIHooks.CodeGen.InstancePath
			for _, Interceptor in Interceptors or {} do
				local Success, InterceptedCode = pcall(Interceptor, Object, options)
				if Success and type(InterceptedCode) == "string" then
					return InterceptedCode, false
				elseif not Success then
					warn("Error in CodeGen Interceptor (InstancePath):", InterceptedCode)
				end
			end
		end
	end

	local ChildLookupMode = wax.shared.SaveManager:GetState("InstancePathLookupChain", "Index")
	local NilEventReferenceStrategy = wax.shared.SaveManager:GetState("EventReferenceStrategy", "GetNil")
	
	local function BuildDynamicAccessor(Expression: string): string
		if ChildLookupMode == "WaitForChild" then
			return ":WaitForChild(" .. Expression .. ")"
		elseif ChildLookupMode == "FindFirstChild" then
			return ":FindFirstChild(" .. Expression .. ")"
		end

		return "[" .. Expression .. "]"
	end

	local function BuildStaticAccessor(Name: string): string
		local SanitizedName = CodeGen.FormatLuaString(Name)

		if ChildLookupMode == "WaitForChild" then
			return ':WaitForChild("' .. SanitizedName .. '")'
		elseif ChildLookupMode == "FindFirstChild" then
			return ':FindFirstChild("' .. SanitizedName .. '")'
		elseif string.match(Name, "^[%a_][%w_]*$") then
			return "." .. Name
		end

		return '["' .. SanitizedName .. '"]'
	end

	local CurrentObject = Object
	local DidInsertNilFunction = false
	local IsNil = false
	local Path = ""

	repeat
		if typeof(CurrentObject) ~= "Instance" then
			break
		end

		if IsEqualToInstance(CurrentObject, game) then
			Path = "game" .. Path
			break
		end

		local IndexName = ""

		if IsEqualToInstance(CurrentObject, wax.shared.LocalPlayer) then
			IndexName = ".LocalPlayer"
		elseif
			wax.shared.LocalPlayer.Character and IsEqualToInstance(CurrentObject, wax.shared.LocalPlayer.Character)
		then
			Path = 'game:GetService("Players").LocalPlayer.Character' .. Path
			break
		elseif CurrentObject.Name and CurrentObject.Name == wax.shared.LocalPlayer.Name then
			IndexName = BuildDynamicAccessor('game:GetService("Players").LocalPlayer.Name')
		elseif CurrentObject.Name and CurrentObject.Name == tostring(wax.shared.LocalPlayer.UserId) then
			IndexName = BuildDynamicAccessor('game:GetService("Players").LocalPlayer.UserId')
		elseif IsEqualToInstance(CurrentObject, workspace) then
			Path = "workspace" .. Path
			break
		elseif CurrentObject.ClassName and CurrentObject.Name then
			IndexName = BuildStaticAccessor(CurrentObject.Name)

			local Parent = CurrentObject.Parent
			if Parent then
				local DirectChildPtr = Parent:FindFirstChild(CurrentObject.Name)

				if
					IsEqualToInstance(Parent, game)
					and IsEqualToInstance(game:FindService(CurrentObject.ClassName), CurrentObject)
				then
					IndexName = ':GetService("' .. CurrentObject.ClassName .. '")'
				elseif DirectChildPtr then
					local Children = Parent:GetChildren()
					local FoundIndex = nil

					if
						wax.shared.ExecutorSupport["compareinstances"].IsWorking
						and not compareinstances(DirectChildPtr, CurrentObject)
					then
						for Index, Child in Children do
							if not compareinstances(Child, CurrentObject) then
								continue
							end

							FoundIndex = Index
							break
						end
					elseif DirectChildPtr ~= CurrentObject then
						FoundIndex = table.find(Children, CurrentObject)
					end

					if FoundIndex then
						IndexName = ":GetChildren()[" .. tostring(FoundIndex) .. "]"
					end
				end
			elseif Parent == nil then
				IsNil = true

				if DisableNilParentHandler then
					Path = Path .. " --[[Nil Parent]]"
				else
					local Base = `GetNil("{CodeGen.FormatLuaString(CurrentObject.Name)}", "{CodeGen.FormatLuaString(
						CurrentObject:GetDebugId()
					)}")`
					DidInsertNilFunction = true
					local GetterCode = GetNilCode

					if NilEventReferenceStrategy == "Upvalue Lookup" and EventReference then
						local EventReferenceCall = {
							"GetEventReference({",
							CodeGen:IndentCode(`Hash = "{CodeGen.FormatLuaString(EventReference.Hash)}",`, 1),
							CodeGen:IndentCode(`ExcludeExecutor = {EventReference.ExcludeExecutor == true and "true" or "false"},`, 1),
							CodeGen:IndentCode(`Index = {tostring(EventReference.Index)},`, 1),
						}

						if EventReference.Path and #EventReference.Path > 0 then
							table.insert(EventReferenceCall, CodeGen:IndentCode(`Path = {FormatLuaArray(EventReference.Path)},`, 1))
						end

						table.insert(EventReferenceCall, "})\n")
						Base = table.concat(EventReferenceCall, "\n")
						GetterCode = GetEventReferenceCode
						DidInsertNilFunction = false
					end
					
					if OmitNilFunctionGetterCodeGeneration then
						Path = Base
						break
					end

					Path = GetterCode .. `\n\n{VariableName and `local {VariableName} = ` or ""}` .. Base
					break
				end
			end
		end

		Path = IndexName .. Path

		CurrentObject = CurrentObject.Parent
	until CurrentObject == nil

	if IsNil then
		return Path, DidInsertNilFunction
	end

	return `{VariableName and `local {VariableName} = ` or ""}{Path}`, DidInsertNilFunction
end

local function DoesUseCallbackValue(Instance: Instance)
	return Instance.ClassName == "RemoteFunction" or Instance.ClassName == "BindableFunction"
end

local CodeGenHeaderTemplate = [[-- This code was generated by Cobalt
-- https://github.com/notpoiu/cobalt

]]

function CodeGen:IndentCode(Code: string, IndentLevel: number)
	local Indent = CodeGen.IndentTemplate:rep(IndentLevel)
	local IndentedCode = Code:gsub("\n", "\n" .. Indent)
	return Indent .. IndentedCode
end

local WrapperActorCode = table.concat({
	"-- Event originated from an Actor Environment",
	"for _, actor in getactors() do",
	"	run_on_actor(actor, [[\n%s\n]])",
	"end",
}, "\n")

local function WrapCodeInActor(Code: string, ShouldWrap: boolean)
	if not ShouldWrap then
		return Code
	end

	return string.format(WrapperActorCode, CodeGen:IndentCode(Code, 2))
end

local function FindEventReferenceInTable(Table: { [any]: any }, Instance: Instance, Visited: { [any]: boolean }?): { any }?
	local Seen = Visited or {}
	if Seen[Table] then
		return nil
	end

	Seen[Table] = true

	for Key, Value in next, Table do
		if typeof(Value) == "Instance" and IsEqualToInstance(Value, Instance) and FormatLuaLiteral(Key) then
			return { Key }
		end

		if type(Value) == "table" and FormatLuaLiteral(Key) then
			local ChildPath = FindEventReferenceInTable(Value, Instance, Seen)
			if ChildPath then
				table.insert(ChildPath, 1, Key)
				return ChildPath
			end
		end
	end

	return nil
end

local function ResolveEventReference(CallInfo: CallInfo): { Hash: string, Index: number, ExcludeExecutor: boolean?, Path: { any }? }?
	if wax.shared.SaveManager:GetState("EventReferenceStrategy", "GetNil") ~= "Upvalue Lookup" then
		return nil
	end

	if CallInfo.Actor and typeof(CallInfo.Function) == "table" then
		local FunctionHash = CallInfo.Function.FunctionHash
		local Upvalues = CallInfo.Function.Upvalues

		if FunctionHash and type(Upvalues) == "table" then
			local UpvaluePath = FindEventReferenceInTable(Upvalues, CallInfo.Instance)
			if not UpvaluePath then
				return nil
			end

			local UpvalueIndex = table.remove(UpvaluePath, 1)
			return {
				Hash = FunctionHash,
				Index = UpvalueIndex,
				Path = UpvaluePath,
				ExcludeExecutor = true,
			}
		end

		return nil
	end

	if typeof(CallInfo.Function) ~= "function" or not islclosure(CallInfo.Function) or not getfunctionhash then
		return nil
	end

	local UpvaluePath = FindEventReferenceInTable(debug.getupvalues(CallInfo.Function), CallInfo.Instance)
	if not UpvaluePath then
		return nil
	end

	local UpvalueIndex = table.remove(UpvaluePath, 1)
	return {
		Hash = getfunctionhash(CallInfo.Function),
		Index = UpvalueIndex,
		Path = UpvaluePath,
		ExcludeExecutor = CallInfo.IsExecutor ~= true,
	}
end

function CodeGen:BuildHookCode(CallInfo: CallInfo)
	local PluginManager = wax.shared.CobaltPluginManager
	if PluginManager and PluginManager.HasCodeGenInterceptors then
		local Interceptors = PluginManager.Registry.UIHooks.CodeGen.Hook
		
		for _, Interceptor in Interceptors or {} do
			local Success, InterceptedCode = pcall(Interceptor, CallInfo)
			if Success and type(InterceptedCode) == "string" then
				return InterceptedCode
			elseif not Success then
				warn("Error in Cobalt Plugin (CodeGen Interceptor (Hook)):", InterceptedCode)
			end
		end
	end

	local Type = CallInfo.Type
	local Path = self.GetFullPath(CallInfo.Instance, {
		VariableName = "Event",
		DisableNilParentHandler = false,
		EventReference = ResolveEventReference(CallInfo),
	})
	if wax.shared.SaveManager:GetState("CacheInstancePaths", false) then
		local Log = wax.shared.Logs[Type][CallInfo.Instance]
		if Log then
			Path = "-- Cached Event Path: " .. (CallInfo.Path or "N/A") .. "\n" .. Path
		end
	end

	local IsFromActor = CallInfo.Actor ~= nil
	local Method = wax.shared.FunctionForClasses[Type][CallInfo.Instance.ClassName]

	local CodeGenHeader = CodeGenHeaderTemplate
	if not wax.shared.SaveManager:GetState("ShowWatermark", true) then
		CodeGenHeader = ""
	end

	if Type == "Incoming" then
		if DoesUseCallbackValue(CallInfo.Instance) then
			-- Callback/Invoke returned value
			if CallInfo.OriginalInvokeArgs then
				if CallInfo.IsCallbackReturn then
					return CodeGenHeader
						.. WrapCodeInActor(
							string.format(
								[[%s
local Callback = getcallbackvalue(Event, "%s")
Event.%s = function(...)
	local Args = table.pack(...)

	local Result = table.pack(
		Callback(table.unpack(Args, 1, Args.n))
	)

	return table.unpack(Result, 1, Result.n)
end

local mtHook; mtHook = hookmetamethod(game, "__newindex", function(...)
	local self, key, value = ...
	
	if (
		rawequal(self, Event) and
		rawequal(key, "%s") and
		typeof(value) == "function" and
		not checkcaller()
	) then
		Callback = value
	end

	return mtHook(...)
end)]],
								Path,
								Method,
								Method,
								Method
							),
							IsFromActor
						)
				end

				Method = wax.shared.FunctionForClasses.Outgoing[CallInfo.Instance.ClassName]

				return CodeGenHeader
					.. WrapCodeInActor(
						string.format(
							[[%s
local mtHook; mtHook = hookmetamethod(game, "__namecall", function(...)
	local self = ...

	if rawequal(self, Event) and getnamecallmethod() == "%s" then
		local Args = table.pack(...)

		local Result = table.pack(
			mtHook(table.unpack(Args, 1, Args.n))
		)

		return table.unpack(Result, 1, Result.n)
	end

	return mtHook(self, ...)
end)

local Old%s; Old%s = hookfunction(Event.%s, function(...)
	local self = ...

	if rawequal(self, Event) then
		local Args = table.pack(...)

		local Result = table.pack(
			Old%s(table.unpack(Args, 1, Args.n))
		)

		return table.unpack(Result, 1, Result.n)
	end

	return Old%s(self, ...)
end)]],
							Path,
							Method,
							Method,
							Method,
							Method,
							Method,
							Method
						),
						IsFromActor
					)
			end

			-- Callback value
			return CodeGenHeader
				.. WrapCodeInActor(
					string.format(
						[[%s
local Callback = getcallbackvalue(Event, "%s")
Event.%s = function(...)
	print(`Intercepted (Callback) {Event.Name}.%s`, ...)
	return Callback(...)
end

local mtHook; mtHook = hookmetamethod(game, "__newindex", function(...)
	local self, key, value = ...
	
	if (
		rawequal(self, Event) and
		rawequal(key, "%s") and
		typeof(value) == "function" and
		not checkcaller()
	) then
		Callback = value
	end

	return mtHook(...)
end)]],
						Path,
						Method,
						Method,
						Method,
						Method
					),
					IsFromActor
				)
		end

		return CodeGenHeader
			.. WrapCodeInActor(
				string.format(
					[[%s
for _, Connection in getconnections(Event.%s) do
	local old; old = hookfunction(Connection.Function, function(...)
		print(`Intercepted (Connection) {Event.Name}.%s`, ...)
		return old(...)
	end)
end]],
					Path,
					Method,
					Method
				),
				IsFromActor
			)
	end

	return CodeGenHeader
		.. WrapCodeInActor(
			string.format(
				[[%s
local mtHook; mtHook = hookmetamethod(game, "__namecall", function(...)
	local self = ...

	if rawequal(self, Event) and getnamecallmethod() == "%s" then
		local Args = table.pack(...)
		
		local Result = table.pack(
			mtHook(self, table.unpack(Args, 1, Args.n))
		)

		print(`Intercepted (__namecall) {Event.Name}:%s()`, ...)

		return table.unpack(Result, 1, Result.n)
	end

	return mtHook(...)
end)

local Old%s; Old%s = hookfunction(Event.%s, function(...)
	local self = ...

	if rawequal(self, Event) then
		local Args = table.pack(...)

		local Result = table.pack(
			Old%s(table.unpack(Args, 1, Args.n))
		)

		print(`Intercepted (__index) {Event.Name}:%s()`, self, table.unpack(Result, 1, Result.n))

		return table.unpack(Result, 1, Result.n)
	end

	return Old%s(self, ...)
end)]],
				Path,
				Method,
				Method,
				Method,
				Method,
				Method,
				Method,
				Method,
				Method
			),
			IsFromActor
		)
end

function CreateArgsString(SerializedArgs: string, Args: { [number]: any, n: number }, Prefix: string?)
	if Args.n == 0 then
		return ""
	end

	--// Cyclic Table Handler \\--
	if string.sub(SerializedArgs, 1, 9) == "(function" then
		return `{Prefix == nil and "" or Prefix}table.unpack({SerializedArgs}, 1, {Args.n})`
	end

	--// Normal Table Handler \\--
	return `{Prefix == nil and "" or Prefix}{string.sub(SerializedArgs, 2, #SerializedArgs - 1)}`
end

function CodeGen:BuildCallCode(CallInfo: CallInfo)
	local PluginManager = wax.shared.CobaltPluginManager
	if PluginManager and PluginManager.HasCodeGenInterceptors then
		local Interceptors = PluginManager.Registry.UIHooks.CodeGen.Call
		if Interceptors then
			for _, Interceptor in Interceptors do
				local Success, InterceptedCode = pcall(Interceptor, CallInfo)
				if Success and type(InterceptedCode) == "string" then
					return InterceptedCode
				elseif not Success then
					warn("Error in CodeGen Interceptor (Call):", InterceptedCode)
				end
			end
		end
	end

	local Type = CallInfo.Type

	local Path = self.GetFullPath(CallInfo.Instance, {
		VariableName = "Event",
		DisableNilParentHandler = false,
		EventReference = ResolveEventReference(CallInfo),
	})
	if wax.shared.SaveManager:GetState("CacheInstancePaths", false) then
		local Log = wax.shared.Logs[Type][CallInfo.Instance]
		if Log then
			Path = "-- Cached Event Path: " .. (CallInfo.Path or "N/A") .. "\n" .. Path
		end
	end

	local Method = wax.shared.FunctionForClasses[Type][CallInfo.Instance.ClassName]
	local SerializedArgs, DidInsertNilFunction = wax.shared.LuaEncode(
		CallInfo.Arguments,
		{ Prettify = true, InsertCycles = true, IsArray = true }
	)

	local CodeGenHeader = CodeGenHeaderTemplate
	if not wax.shared.SaveManager:GetState("ShowWatermark", true) then
		CodeGenHeader = ""
	end

	if Type == "Incoming" then
		if DoesUseCallbackValue(CallInfo.Instance) then
			local PrettifiedExpectedResult, DidInsertNilFunctionInExpectation = wax.shared.LuaEncode(
				CallInfo.Arguments,
				{ Prettify = true, InsertCycles = true, IsArray = true }
			)

			if CallInfo.OriginalInvokeArgs then
				local PrettifiedOutput, InsertedNilFunction = wax.shared.LuaEncode(
					CallInfo.OriginalInvokeArgs,
					{ Prettify = true, InsertCycles = true, IsArray = true }
				)

				if CallInfo.IsCallbackReturn then
					return CodeGenHeader
						.. string.format(
							[[%s%s
local Callback = getcallbackvalue(Event, "%s")
local Result = table.pack(Callback(%s))

local ExpectedResult = table.unpack(%s)

]],
							(
								(InsertedNilFunction or DidInsertNilFunction or DidInsertNilFunctionInExpectation)
									and GetNilCode .. "\n\n"
								or ""
							),
							Path,
							Method,
							CreateArgsString(PrettifiedOutput, CallInfo.OriginalInvokeArgs),
							PrettifiedExpectedResult
						)
				end

				Method = wax.shared.FunctionForClasses.Outgoing[CallInfo.Instance.ClassName]

				return CodeGenHeader
					.. string.format(
						[[%s%s
local Result = Event:%s(%s)

local ExpectedResult = table.unpack(%s)

]],
						(
							(InsertedNilFunction or DidInsertNilFunction or DidInsertNilFunctionInExpectation)
								and GetNilCode .. "\n\n"
							or ""
						),
						Path,
						Method,
						CreateArgsString(PrettifiedOutput, CallInfo.OriginalInvokeArgs),
						PrettifiedExpectedResult
					)
			end

			return CodeGenHeader
				.. string.format(
					[[%s%s
local Callback = getcallbackvalue(Event, "%s")
Callback(%s)

local ExpectedResult = table.unpack(%s)

]],
					(DidInsertNilFunction or DidInsertNilFunctionInExpectation and GetNilCode .. "\n\n" or ""),
					Path,
					Method,
					CreateArgsString(SerializedArgs, CallInfo.Arguments),

					PrettifiedExpectedResult
				)
		end

		return CodeGenHeader
			.. string.format(
				[[%s%s
firesignal(Event.%s%s)]],
				(DidInsertNilFunction and GetNilCode .. "\n\n" or ""),
				Path,
				Method,
				CreateArgsString(SerializedArgs, CallInfo.Arguments, ", ")
			)
	end

	return CodeGenHeader
		.. string.format(
			[[%s%s
Event:%s(%s)]],
			(DidInsertNilFunction and GetNilCode .. "\n\n" or ""),
			Path,
			Method,
			CreateArgsString(SerializedArgs, CallInfo.Arguments)
		)
end

function CodeGen:BuildFunctionInfo(CallInfo: CallInfo)
	if CallInfo.Actor and typeof(CallInfo.Function) == "table" then
		return string.format(
			[[<b>Function Address:</b> %s
<b>Name:</b> %s
<b>Script Path:</b> %s
<b>Source:</b> %s
<b>Calling Line:</b> %s
<b>Origin Actor:</b> %s
%s]],
			CallInfo.Function.Address:match("0x%x+") or tostring(CallInfo.Function),
			CallInfo.Function.Name ~= "" and CallInfo.Function.Name or "Anonymous",
			CallInfo.Origin and self.GetFullPath(CallInfo.Origin, { DisableNilParentHandler = true }) or wax.shared.ExecutorName,
			CallInfo.Function.Source or "N/A",
			tostring(CallInfo.Line),
			self.GetFullPath(CallInfo.Actor, { DisableNilParentHandler = true }) or "N/A",
			CallInfo.Function.IsC and "<b>Closure Type</b>: C closure"
				or string.format(
					"<b>Closure Type</b>: Luau closure\n<b>Constants:</b> %s\n<b>Upvalues:</b> %s\n<b>Protos:</b> %s",
					debug.getconstants and tostring(#CallInfo.Function.Constants) or "N/A",
					debug.getupvalues and tostring(#CallInfo.Function.Upvalues) or "N/A",
					debug.getprotos and tostring(#CallInfo.Function.Protos) or "N/A"
				)
		)
	end

	local FunctionName = debug.info(CallInfo.Function, "n")

	return string.format(
		[[<b>Function Address:</b> %s
<b>Name:</b> %s
<b>Script Path:</b> %s
<b>Source:</b> %s
<b>Calling Line:</b> %s
%s]],
		tostring(CallInfo.Function):match("0x%x+") or tostring(CallInfo.Function),
		FunctionName ~= "" and FunctionName or "Anonymous",
		CallInfo.Origin and self.GetFullPath(CallInfo.Origin, { DisableNilParentHandler = true }) or wax.shared.ExecutorName,
		CallInfo.Source or debug.info(CallInfo.Function, "s"),
		tostring(CallInfo.Line),

		iscclosure(CallInfo.Function) and "<b>Closure Type</b>: C closure"
			or string.format(
				"<b>Closure Type</b>: Luau closure\n<b>Constants:</b> %s\n<b>Upvalues:</b> %s\n<b>Protos:</b> %s",
				debug.getconstants and tostring(#debug.getconstants(CallInfo.Function)) or "N/A",
				debug.getupvalues and tostring(#debug.getupvalues(CallInfo.Function)) or "N/A",
				debug.getprotos and tostring(#debug.getprotos(CallInfo.Function)) or "N/A"
			)
	)
end

wax.shared.ReplayCallInfo = function(CallInfo: CallInfo)
	local Type = CallInfo.Type
	local Method = wax.shared.FunctionForClasses[Type][CallInfo.Instance.ClassName]

	if Type == "Incoming" then
		if DoesUseCallbackValue(CallInfo.Instance) then
			if CallInfo.OriginalInvokeArgs then
				if CallInfo.IsCallbackReturn then
					local Callback = getcallbackvalue(CallInfo.Instance, Method)

					if not Callback then
						return
					end

					Callback(table.unpack(CallInfo.OriginalInvokeArgs, 1, CallInfo.OriginalInvokeArgs.n))
					return
				end

				Method = wax.shared.FunctionForClasses.Outgoing[CallInfo.Instance.ClassName]

				CallInfo.Instance[Method](
					CallInfo.Instance,
					table.unpack(CallInfo.OriginalInvokeArgs, 1, CallInfo.OriginalInvokeArgs.n)
				)
				return
			end

			local Callback = getcallbackvalue(CallInfo.Instance, Method)

			if not Callback then
				return
			end

			Callback(table.unpack(CallInfo.Arguments))
			return
		end

		assert(firesignal or getconnections, "No firesignal or getconnections found")

		if firesignal then
			firesignal(CallInfo.Instance[Method], table.unpack(CallInfo.Arguments, 1, CallInfo.Arguments.n))
		elseif getconnections then
			for _, conn in getconnections(CallInfo.Instance[Method]) do
				conn:Fire(table.unpack(CallInfo.Arguments, 1, CallInfo.Arguments.n))
			end
		end

		return
	end

	CallInfo.Instance[Method](CallInfo.Instance, table.unpack(CallInfo.Arguments, 1, CallInfo.Arguments.n))
end

return CodeGen

end)() end,
    [44] = function()local wax,script,require=ImportGlobals(44)local ImportGlobals return (function(...)local Resize = {}
Resize.__index = Resize

local Interface = require(script.Parent.Interface)
local Drag = require(script.Parent.Drag)

local HANDLE_SIZE = 6
local CORNER_HANDLE_SIZE = 20

function Resize.new(Options: {
	MainFrame: Frame,
	MinimumSize: Vector2? | UDim2?,
	MaximumSize: UDim2?,
	HandleSize: number?,
	CornerHandleSize: number?,
	Mirrored: boolean?,
	LockedPosition: boolean? | UDim2?,
})
	local MainFrame = Options.MainFrame
	local HandleSize = Options.HandleSize or HANDLE_SIZE
	local CornerHandleSize = Options.CornerHandleSize or CORNER_HANDLE_SIZE
	local Mirrored = Options.Mirrored or false
	local LockedPosition = Options.LockedPosition

	local MinimumSize
	if typeof(Options.MinimumSize) == "Vector2" then
		MinimumSize = UDim2.fromOffset(Options.MinimumSize.X, Options.MinimumSize.Y)
	elseif typeof(Options.MinimumSize) == "UDim2" then
		MinimumSize = Options.MinimumSize
	else
		MinimumSize = UDim2.fromOffset(100, 100)
	end

	local MaximumSize = Options.MaximumSize

	local self = setmetatable({
		MainFrame = MainFrame,
		ScreenGui = MainFrame:FindFirstAncestorOfClass("ScreenGui"),
		Parent = MainFrame.Parent,
	}, Resize)

	local function CalculateResizeProperties(
		initialFramePosition: UDim2,
		initialFrameSize: UDim2,
		mouseDelta: Vector2,
		resizeTypeX: string?,
		resizeTypeY: string?
	)
		if Mirrored then
			local parentAbsSize = self.Parent.AbsoluteSize

			local newSizeOffsetX = initialFrameSize.X.Offset
			local newSizeOffsetY = initialFrameSize.Y.Offset

			if resizeTypeX then
				local deltaX = 0
				if resizeTypeX == "Right" then
					deltaX = 2 * mouseDelta.X
				elseif resizeTypeX == "Left" then
					deltaX = -2 * mouseDelta.X
				end
				newSizeOffsetX = initialFrameSize.X.Offset + deltaX

				local minWidthAbs = MinimumSize.X.Scale * parentAbsSize.X + MinimumSize.X.Offset
				local maxWidthAbs = (MaximumSize and (MaximumSize.X.Scale * parentAbsSize.X + MaximumSize.X.Offset))
					or math.huge
				local scaleContributionX = initialFrameSize.X.Scale * parentAbsSize.X
				local minAllowedTotalOffsetX = minWidthAbs - scaleContributionX
				local maxAllowedTotalOffsetX = maxWidthAbs - scaleContributionX
				newSizeOffsetX = math.clamp(newSizeOffsetX, minAllowedTotalOffsetX, maxAllowedTotalOffsetX)
			end

			if resizeTypeY then
				local deltaY = 0
				if resizeTypeY == "Bottom" then
					deltaY = 2 * mouseDelta.Y
				elseif resizeTypeY == "Top" then
					deltaY = -2 * mouseDelta.Y
				end
				newSizeOffsetY = initialFrameSize.Y.Offset + deltaY

				local minHeightAbs = MinimumSize.Y.Scale * parentAbsSize.Y + MinimumSize.Y.Offset
				local maxHeightAbs = (MaximumSize and (MaximumSize.Y.Scale * parentAbsSize.Y + MaximumSize.Y.Offset))
					or math.huge
				local scaleContributionY = initialFrameSize.Y.Scale * parentAbsSize.Y
				local minAllowedTotalOffsetY = minHeightAbs - scaleContributionY
				local maxAllowedTotalOffsetY = maxHeightAbs - scaleContributionY
				newSizeOffsetY = math.clamp(newSizeOffsetY, minAllowedTotalOffsetY, maxAllowedTotalOffsetY)
			end

			local finalNewSize =
				UDim2.new(initialFrameSize.X.Scale, newSizeOffsetX, initialFrameSize.Y.Scale, newSizeOffsetY)
			local finalNewPosition = initialFramePosition
			if typeof(LockedPosition) == "UDim2" then
				finalNewPosition = LockedPosition
			end
			return finalNewSize, finalNewPosition
		else
			-- Non-mirrored logic
			local currentScreenGuiAbsSize = self.ScreenGui.AbsoluteSize
			local parentAbsSizeForMinMax = currentScreenGuiAbsSize -- As per original non-mirrored logic for min/max context

			-- These will store the final UDim offset values for position and the absolute pixel values for size calculation
			local finalPosOffsetX = initialFramePosition.X.Offset
			local finalPosOffsetY = initialFramePosition.Y.Offset

			-- Initial absolute pixel size of the frame
			local initialAbsWidthPx = initialFrameSize.X.Scale * self.Parent.AbsoluteSize.X + initialFrameSize.X.Offset
			local initialAbsHeightPx = initialFrameSize.Y.Scale * self.Parent.AbsoluteSize.Y + initialFrameSize.Y.Offset

			local newAbsWidthPx = initialAbsWidthPx
			local newAbsHeightPx = initialAbsHeightPx

			-- Min/max pixel dimensions
			local minWidthPx = MinimumSize.X.Scale * parentAbsSizeForMinMax.X + MinimumSize.X.Offset
			local minHeightPx = MinimumSize.Y.Scale * parentAbsSizeForMinMax.Y + MinimumSize.Y.Offset
			local maxWidthPx = MaximumSize and (MaximumSize.X.Scale * parentAbsSizeForMinMax.X + MaximumSize.X.Offset)
				or math.huge
			local maxHeightPx = MaximumSize and (MaximumSize.Y.Scale * parentAbsSizeForMinMax.Y + MaximumSize.Y.Offset)
				or math.huge

			-- Original edge calculation logic (assuming MainFrame.Position is center if AnchorPoint is 0.5,0.5 for these calcs)
			local initialAbsCenterX = currentScreenGuiAbsSize.X * initialFramePosition.X.Scale
				+ initialFramePosition.X.Offset
			local initialAbsSizeX_forEdgeCalc = initialFrameSize.X.Offset -- Original code used offset for this part of edge calculation
			local initialRightEdgeX = initialAbsCenterX + initialAbsSizeX_forEdgeCalc / 2
			local initialLeftEdgeX = initialAbsCenterX - initialAbsSizeX_forEdgeCalc / 2

			local initialAbsCenterY = currentScreenGuiAbsSize.Y * initialFramePosition.Y.Scale
				+ initialFramePosition.Y.Offset
			local initialAbsSizeY_forEdgeCalc = initialFrameSize.Y.Offset -- Original code used offset for this part of edge calculation
			local initialBottomEdgeY = initialAbsCenterY + initialAbsSizeY_forEdgeCalc / 2
			local initialTopEdgeY = initialAbsCenterY - initialAbsSizeY_forEdgeCalc / 2

			if resizeTypeX then
				if resizeTypeX == "Left" then
					local newLeftEdge = initialLeftEdgeX + mouseDelta.X
					newAbsWidthPx = math.clamp(initialRightEdgeX - newLeftEdge, minWidthPx, maxWidthPx)
					if newAbsWidthPx ~= (initialRightEdgeX - newLeftEdge) then -- Readjust edge if clamped
						newLeftEdge = initialRightEdgeX - newAbsWidthPx
					end
					if not LockedPosition then
						local newAbsCenterX = newLeftEdge + newAbsWidthPx / 2 -- Assuming center is halfway for position update
						finalPosOffsetX = newAbsCenterX - currentScreenGuiAbsSize.X * initialFramePosition.X.Scale
					end
				elseif resizeTypeX == "Right" then
					local newRightEdge = initialRightEdgeX + mouseDelta.X
					newAbsWidthPx = math.clamp(newRightEdge - initialLeftEdgeX, minWidthPx, maxWidthPx)
					if not LockedPosition then
						local newAbsCenterX = initialLeftEdgeX + newAbsWidthPx / 2 -- Assuming center is halfway
						finalPosOffsetX = newAbsCenterX - currentScreenGuiAbsSize.X * initialFramePosition.X.Scale
					end
				end
			end

			if resizeTypeY then
				if resizeTypeY == "Top" then
					local newTopEdge = initialTopEdgeY + mouseDelta.Y
					newAbsHeightPx = math.clamp(initialBottomEdgeY - newTopEdge, minHeightPx, maxHeightPx)
					if newAbsHeightPx ~= (initialBottomEdgeY - newTopEdge) then -- Readjust edge if clamped
						newTopEdge = initialBottomEdgeY - newAbsHeightPx
					end
					if not LockedPosition then
						local newAbsCenterY = newTopEdge + newAbsHeightPx / 2 -- Assuming center is halfway
						finalPosOffsetY = newAbsCenterY - currentScreenGuiAbsSize.Y * initialFramePosition.Y.Scale
					end
				elseif resizeTypeY == "Bottom" then
					local newBottomEdge = initialBottomEdgeY + mouseDelta.Y
					newAbsHeightPx = math.clamp(newBottomEdge - initialTopEdgeY, minHeightPx, maxHeightPx)
					if not LockedPosition then
						local newAbsCenterY = initialTopEdgeY + newAbsHeightPx / 2 -- Assuming center is halfway
						finalPosOffsetY = newAbsCenterY - currentScreenGuiAbsSize.Y * initialFramePosition.Y.Scale
					end
				end
			end

			-- Convert final absolute pixel dimensions back to UDim offsets for size
			local finalSizeOffsetX = newAbsWidthPx - (initialFrameSize.X.Scale * self.Parent.AbsoluteSize.X)
			local finalSizeOffsetY = newAbsHeightPx - (initialFrameSize.Y.Scale * self.Parent.AbsoluteSize.Y)

			local finalNewSize =
				UDim2.new(initialFrameSize.X.Scale, finalSizeOffsetX, initialFrameSize.Y.Scale, finalSizeOffsetY)
			local finalNewPosition = initialFramePosition -- Default if LockedPosition is true
			if typeof(LockedPosition) == "UDim2" then
				finalNewPosition = LockedPosition
			elseif not LockedPosition then -- Only update if not locked (boolean false)
				finalNewPosition = UDim2.new(
					initialFramePosition.X.Scale,
					finalPosOffsetX,
					initialFramePosition.Y.Scale,
					finalPosOffsetY
				)
			end
			return finalNewSize, finalNewPosition
		end
	end

	local function createDragHandler(resizeTypeX, resizeTypeY)
		return function(Info, Input: InputObject)
			local mouseDelta = Input.Position - Info.StartPosition
			if wax.shared.GetDPIScale then
				mouseDelta = mouseDelta / wax.shared.GetDPIScale()
			end
			
			local newSize, newPosition =
				CalculateResizeProperties(Info.FramePosition, Info.FrameSize, mouseDelta, resizeTypeX, resizeTypeY)

			MainFrame.Size = newSize
			MainFrame.Position = newPosition
		end
	end

	local LeftSide = Interface.New("Frame", {
		Size = UDim2.new(0, HandleSize, 1, -CornerHandleSize * 2),
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6,
	})
	Drag.Setup(MainFrame, LeftSide, createDragHandler("Left", nil))

	local RightSide = Interface.New("Frame", {
		Size = UDim2.new(0, HandleSize, 1, -CornerHandleSize * 2),
		AnchorPoint = Vector2.new(1, 0.5),
		Position = UDim2.fromScale(1, 0.5),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6,
	})
	Drag.Setup(MainFrame, RightSide, createDragHandler("Right", nil))

	local TopSide = Interface.New("Frame", {
		Size = UDim2.new(1, -CornerHandleSize * 2, 0, HandleSize),
		AnchorPoint = Vector2.new(0.5, 0),
		Position = UDim2.fromScale(0.5, 0),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6,
	})
	Drag.Setup(MainFrame, TopSide, createDragHandler(nil, "Top"))

	local BottomSide = Interface.New("Frame", {
		Size = UDim2.new(1, -CornerHandleSize * 2, 0, HandleSize),
		AnchorPoint = Vector2.new(0.5, 1),
		Position = UDim2.fromScale(0.5, 1),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6,
	})
	Drag.Setup(MainFrame, BottomSide, createDragHandler(nil, "Bottom"))

	local TopLeftCorner = Interface.New("Frame", {
		Size = UDim2.fromOffset(CornerHandleSize, CornerHandleSize),
		AnchorPoint = Vector2.new(0, 0),
		Position = UDim2.fromScale(0, 0),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6 + 1,
	})
	Drag.Setup(MainFrame, TopLeftCorner, createDragHandler("Left", "Top"))

	local TopRightCorner = Interface.New("Frame", {
		Size = UDim2.fromOffset(CornerHandleSize, CornerHandleSize),
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.fromScale(1, 0),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6 + 1,
	})
	Drag.Setup(MainFrame, TopRightCorner, createDragHandler("Right", "Top"))

	local BottomLeftCorner = Interface.New("Frame", {
		Size = UDim2.fromOffset(CornerHandleSize, CornerHandleSize),
		AnchorPoint = Vector2.new(0, 1),
		Position = UDim2.fromScale(0, 1),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6 + 1,
	})
	Drag.Setup(MainFrame, BottomLeftCorner, createDragHandler("Left", "Bottom"))

	local BottomRightCorner = Interface.New("Frame", {
		Size = UDim2.fromOffset(CornerHandleSize, CornerHandleSize),
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		Parent = MainFrame,
		ZIndex = 9e6 + 1,
	})
	Drag.Setup(MainFrame, BottomRightCorner, createDragHandler("Right", "Bottom"))

	return self
end

return Resize

end)() end,
    [37] = function()local wax,script,require=ImportGlobals(37)local ImportGlobals return (function(...)local Animations = {
	TweenInfo = TweenInfo.new(0.25, Enum.EasingStyle.Exponential),
	Exclusions = {},
	Expectations = { In = {}, Out = {} },
}

local function GetTransparencyProperty(object)
	if table.find(Animations.Exclusions, object) then
		return nil
	end

	if object:IsA("TextButton") or object:IsA("TextLabel") or object:IsA("TextBox") then
		return { "TextTransparency" }
	elseif object:IsA("CanvasGroup") then
		return { "GroupTransparency" }
	elseif object:IsA("Frame") then
		return { "BackgroundTransparency" }
	elseif object:IsA("ScrollingFrame") then
		return { "ScrollBarImageTransparency" }
	elseif object:IsA("ImageLabel") or object:IsA("ImageButton") then
		return { "ImageTransparency", "BackgroundTransparency" }
	elseif object:IsA("UIStroke") then
		return { "Transparency" }
	end

	return nil
end

local function BuildPropertyTable(properties, type, object)
	if Animations.Expectations[type][object] then
		return Animations.Expectations[type][object]
	end

	local propTable = {}
	for _, prop in properties do
		propTable[prop] = type == "In" and 0 or 1
	end
	return propTable
end

function Animations.FadeOut(object, time)
	local tweenInfo = time and TweenInfo.new(time, Enum.EasingStyle.Exponential) or Animations.TweenInfo
	local properties = GetTransparencyProperty(object)

	if not properties then
		return
	end

	wax.shared.TweenService:Create(object, tweenInfo, BuildPropertyTable(properties, "Out", object)):Play()

	if object:IsA("CanvasGroup") then
		return
	end

	for _, child in object:GetDescendants() do
		local prop = GetTransparencyProperty(child)
		if not prop then
			continue
		end

		wax.shared.TweenService:Create(child, tweenInfo, BuildPropertyTable(prop, "Out", child)):Play()
	end
end

function Animations.FadeIn(object, time)
	local tweenInfo = time and TweenInfo.new(time, Enum.EasingStyle.Exponential) or Animations.TweenInfo
	local property = GetTransparencyProperty(object)

	if property then
		wax.shared.TweenService:Create(object, tweenInfo, BuildPropertyTable(property, "In", object)):Play()
	end

	if object:IsA("CanvasGroup") then
		return
	end

	for _, child in object:GetDescendants() do
		local prop = GetTransparencyProperty(child)
		if not prop then
			continue
		end

		wax.shared.TweenService:Create(child, tweenInfo, BuildPropertyTable(prop, "In", child)):Play()
	end
end

function Animations.AddFadeExclusion(object)
	local prop = GetTransparencyProperty(object)
	if not prop then
		return
	end

	table.insert(Animations.Exclusions, object)
end

function Animations.AddFadeExclusions(objects)
	for _, object in objects do
		local prop = GetTransparencyProperty(object)
		if not prop then
			continue
		end

		table.insert(Animations.Exclusions, object)
	end
end

function Animations.SetFadeExpectation(type: "In" | "Out", object: GuiBase2d, properties: { [string]: any })
	if not Animations.Expectations[type] then
		return
	end

	Animations.Expectations[type][object] = properties
end

return Animations

end)() end,
    [45] = function()local wax,script,require=ImportGlobals(45)local ImportGlobals return (function(...)--[[[

Sonner Luau Port by upio
Original Sonner by Emil Kowalski (https://sonner.emilkowal.ski/)

TODO (which will almost probably never be done):
 - Add a way to view the previous notifications (hovering over the notifs but im lazy)
 - Handle too many notifications breaking the UI
 - Fix inconsistant notification positioning
]]

local Sonner = {
	Queue = {},
	TweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Exponential),
	Wrapper = nil,
	PendingQueue = {},
	Processing = false,
}

local Icons = require(script.Parent.Icons)
local Interface = require(script.Parent.Interface)
local Animations = require(script.Parent.Animations)

local function InternalCreateNotificationObject(zindex, image, text)
	local NotificationTemplate = Interface.New("CanvasGroup", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 1),
		Size = UDim2.new(0, 250, 0, 50),
		Position = UDim2.new(0.5, 0, 1, 50),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		ZIndex = zindex,

		["UICorner"] = {
			CornerRadius = UDim.new(0, 4),
		},

		["UIStroke"] = {
			Color = Color3.fromRGB(39, 42, 42),
		},

		["UIScale"] = {},
	})

	local ImageLabel = Interface.New("ImageLabel", {
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		ScaleType = Enum.ScaleType.Fit,
		Size = UDim2.new(0, 20, 0, 20),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0, 20, 0.5, 0),
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		ZIndex = zindex + 1,
		Parent = NotificationTemplate,
	})

	Animations.SetFadeExpectation("In", ImageLabel, {
		BackgroundTransparency = 1,
		ImageTransparency = 0,
	})

	if image then
		if image:find("rbxasset") then
			ImageLabel.Image = image
		else
			Icons.SetIcon(ImageLabel, image)
		end
	else
		ImageLabel.Visible = false
	end

	local Frame = Interface.New("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		Size = UDim2.new(1, -50, 1, 0),
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, -10, 0, 0),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BackgroundTransparency = 1,
		ZIndex = zindex + 1,
		Parent = NotificationTemplate,
	})

	Interface.New("TextLabel", {
		BorderSizePixel = 0,
		TextSize = 14,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		FontFace = Font.new("rbxassetid://12187365364", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
		TextColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		Size = UDim2.new(0, 200, 0, 50),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		Text = text,
		ZIndex = zindex + 1,
		Parent = Frame,
		TextWrapped = true,
	})

	return NotificationTemplate
end

local function InternalToast(image, text, internalTime, removeCallback)
	assert(Sonner.Wrapper, "Sonner has not been initialized")
	assert(typeof(image) == "string" or image == nil, "Image must be a string or nil")
	assert(typeof(text) == "string", "Text is required!")
	assert(typeof(internalTime) == "number" or internalTime == nil, "Time must be a number or nil")

	local time = internalTime or 4.5

	local Notif = InternalCreateNotificationObject(500, image, text)

	Notif.Position = UDim2.new(0.5, 0, 1, 30)
	Notif.Parent = Sonner.Wrapper

	table.insert(Sonner.Queue, Notif)

	local ScaleMultiplier = 0.9
	local RemovalQueue = {}

	for index, object in Sonner.Queue do
		if object == Notif then
			continue
		end

		object.ZIndex = 500 - (#Sonner.Queue - index)

		-- shift them down
		wax.shared.TweenService
			:Create(object.UIScale, Sonner.TweenInfo, {
				Scale = object.UIScale.Scale * ScaleMultiplier,
			})
			:Play()

		wax.shared.TweenService
			:Create(object, Sonner.TweenInfo, {
				Position = object.Position - UDim2.fromOffset(0, object.AbsoluteSize.Y * 0.35),
			})
			:Play()

		if ((#Sonner.Queue - index) + 1) >= 4 then
			Animations.FadeOut(object)
			task.delay(0.5, function()
				object:Destroy()
			end)
			table.insert(RemovalQueue, object)
		end
	end

	for _, obj in RemovalQueue do
		table.remove(Sonner.Queue, table.find(Sonner.Queue, obj))
	end

	wax.shared.TweenService
		:Create(Notif, Sonner.TweenInfo, {
			Position = UDim2.new(0.5, 0, 1, -20),
		})
		:Play()
	Animations.FadeIn(Notif)

	if removeCallback then
		task.spawn(removeCallback, Notif, time)
	else
		task.delay(time, function()
			if not table.find(Sonner.Queue, Notif) then
				return
			end
			table.remove(Sonner.Queue, table.find(Sonner.Queue, Notif))

			Animations.FadeOut(Notif, 0.35)
			wax.shared.TweenService
				:Create(Notif, Sonner.TweenInfo, {
					Position = UDim2.new(0.5, 0, 1, 50),
				})
				:Play()
			task.wait(0.5)
			Notif:Destroy()
		end)
	end
end

local function ProcessQueue()
	if Sonner.Processing then
		return
	end
	Sonner.Processing = true

	while #Sonner.PendingQueue > 0 do
		local Request = table.remove(Sonner.PendingQueue, 1)
		InternalToast(Request.image, Request.text, Request.internalTime, Request.removeCallback)
		task.wait(0.5)
	end

	Sonner.Processing = false
end

local function toast(image, text, internalTime, removeCallback)
	table.insert(Sonner.PendingQueue, {
		image = image,
		text = text,
		internalTime = internalTime,
		removeCallback = removeCallback,
	})

	task.spawn(ProcessQueue)
end

function Sonner.info(text, internalTime)
	toast("info", text, internalTime)
end

function Sonner.success(text, internalTime)
	toast("circle-check", text, internalTime)
end

function Sonner.warning(text, internalTime)
	toast("triangle-alert", text, internalTime)
end

function Sonner.error(text, internalTime)
	toast("circle-alert", text, internalTime)
end

function Sonner.toast(text, internalTime)
	toast(nil, text, internalTime)
end

function Sonner.promise(func, options)
	local loadingText = options.loadingText or "Loading..."
	local successText = options.successText or "Success!"
	local errorText = options.errorText or "Error!"
	local internalTime = options.time or 4.5

	toast("loader-circle", loadingText, internalTime, function(notif, time)
		local success, resultOrError = nil, nil

		local spinnerThread = task.spawn(function()
			repeat
				wax.shared.RunService.RenderStepped:Wait()

				local icon = notif:FindFirstChild("ImageLabel")
				if not icon then
					continue
				end
				icon.Rotation = (icon.Rotation + 1) % 360
			until success == false or resultOrError ~= nil
		end)

		success, resultOrError = pcall(func, function(text)
			notif.Frame.TextLabel.Text = text
		end)

		task.spawn(function()
			setthreadidentity(8)

			-- The thread identity is 8 when setting it on the parent thread (Sonner.promise), but it still lacks capabilities when running another child thread
			-- Capabilities here should pass from a thread to another... Could be an upstream (executor) issue ?

			Animations.FadeOut(notif.ImageLabel, 0.15)
			wax.shared.TweenService
				:Create(notif.ImageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {
					Size = UDim2.new(0, 0, 0, 0),
				})
				:Play()
			task.wait(0.15)

			if coroutine.status(spinnerThread) ~= "dead" then
				coroutine.close(spinnerThread)
			end
			notif.ImageLabel.Rotation = 0

			if success then
				Icons.SetIcon(notif.ImageLabel, "check")
				local message = (
					typeof(successText) == "string" and successText
					or typeof(successText) == "function" and successText(resultOrError)
					or "Success!"
				)

				if message:match("%s") then
					notif.Frame.TextLabel.Text = string.format(message, tostring(resultOrError))
				else
					notif.Frame.TextLabel.Text = message
				end
			else
				Icons.SetIcon(notif.ImageLabel, "circle-alert")
				notif.Frame.TextLabel.Text = (
					typeof(errorText) == "string" and errorText
					or typeof(errorText) == "function" and errorText(resultOrError)
					or "Error!"
				)
			end

			Animations.FadeIn(notif.ImageLabel)
			wax.shared.TweenService
				:Create(notif.ImageLabel, TweenInfo.new(0.25, Enum.EasingStyle.Exponential), {
					Size = UDim2.new(0, 20, 0, 20),
				})
				:Play()

			task.delay(time, function()
				if not table.find(Sonner.Queue, notif) then
					return
				end
				table.remove(Sonner.Queue, table.find(Sonner.Queue, notif))

				Animations.FadeOut(notif, 0.35)
				wax.shared.TweenService
					:Create(notif, Sonner.TweenInfo, {
						Position = UDim2.new(0.5, 0, 1, 50),
					})
					:Play()

				task.wait(0.5)
				notif:Destroy()
			end)
		end)
	end)
end

function Sonner.rawtoast(options)
	local image = options.image
	local text = options.text or "No Text Provided"
	local internalTime = options.time or 4.5

	toast(image, text, internalTime)
end

function Sonner.init(wrapper)
	Sonner.Wrapper = wrapper
end

return Sonner

end)() end,
    [42] = function()local wax,script,require=ImportGlobals(42)local ImportGlobals return (function(...)local Icons = {}

type Icon = {
	Url: string,
	Id: number,
	IconName: string,
	ImageRectOffset: Vector2,
	ImageRectSize: Vector2,
}

local Success, IconsModule = pcall(function()
	local IconFetchSuccess, IconModuleSource = pcall(request, {
		Url = "https://raw.githubusercontent.com/deividcomsono/lucide-roblox-direct/refs/heads/main/source.lua",
		Method = "GET",
	})

	assert(
		IconFetchSuccess and IconModuleSource.Success or IconModuleSource.StatusCode >= 200 and IconModuleSource.StatusCode < 300,
		"Failed to fetch lucide icons direct module source"
	)
	return (loadstring(IconModuleSource.Body) :: () -> { Icons: { string }, GetAsset: (Name: string) -> Icon? })()
end)

function Icons.GetIcon(iconName: string): Icon?
	if not Success then
		return
	end

	local Success, Icon = pcall(IconsModule.GetAsset, iconName)
	if not Success then
		return
	end

	return Icon
end

function Icons.SetIcon(imageInstance: ImageLabel, iconName: string)
	local Icon: Icon? = Icons.GetIcon(iconName)
	if not Icon then
		return
	end

	imageInstance.Image = Icon.Url
	imageInstance.ImageRectOffset = Icon.ImageRectOffset
	imageInstance.ImageRectSize = Icon.ImageRectSize
end

return Icons

end)() end,
    [13] = function()local wax,script,require=ImportGlobals(13)local ImportGlobals return (function(...)local function CreateLookupTable(table)
	local LookupTable = {}
	for _, Method in next, table do
		LookupTable[Method] = true
	end
	return LookupTable
end

local NamecallMethods = CreateLookupTable({
	"FireServer",
	"InvokeServer",
	"Fire",
	"Invoke",
	"fireServer",
	"invokeServer",
	"fire",
	"invoke",
})
local AllowedClassNames = CreateLookupTable({ "RemoteEvent", "RemoteFunction", "UnreliableRemoteEvent", "BindableEvent", "BindableFunction" })

--[[
	Returns the calling function via `debug.info`

	@return `function | nil` The calling function or nil if not found.
]]
local function getcallingfunction()
	local BaseLevel = if wax.shared.ExecutorSupport["oth"].IsWorking then 2 else 4

	for i = BaseLevel, 10 do
		local Function, Source = debug.info(i, "fs")
		if not Function or not Source then
			break
		end

		if Source == "[C]" then
			continue
		end

		return Function
	end

	return debug.info(BaseLevel, "f")
end

--[[
	Returns the calling line of the script that called the function via `debug.info`

	@return number Returns the line number of the calling script.
]]
local function getcallingline()
	local BaseLevel = if wax.shared.ExecutorSupport["oth"].IsWorking then 2 else 4

	for i = BaseLevel, 10 do
		local Source, Line = debug.info(i, "sl")
		if not Source then
			break
		end

		if Source == "[C]" then
			continue
		end

		return Line
	end

	return debug.info(BaseLevel, "l")
end

--[[
	Returns the calling source of the script that called the function via `debug.info`

	@return string Returns the source of the calling script.
]]
local function getcallingsource()
	local BaseLevel = if wax.shared.ExecutorSupport["oth"].IsWorking then 2 else 4

	for i = BaseLevel, 10 do
		local Source = debug.info(i, "s")
		if not Source then
			break
		end

		if Source == "[C]" then
			continue
		end

		return Source
	end

	return debug.info(BaseLevel, "s")
end

-- metamethod hooks
wax.shared.NamecallHook = wax.shared.Hooking.HookMetaMethod(game, "__namecall", function(...)
	local self = ...
	local Method = getnamecallmethod()

	if
		typeof(self) == "Instance"
		and AllowedClassNames[self.ClassName]
		and not rawequal(self, wax.shared.Communicator)
		and not rawequal(self, wax.shared.ActorCommunicator)
		and NamecallMethods[Method]
		and not wax.shared.ShouldIgnore(self, getcallingscript())
	then
		local Log = wax.shared.Logs.Outgoing[self]
		if not Log then
			Log = wax.shared.NewLog(self, "Outgoing", Method, getcallingscript())
		end

		local Info = {
			Arguments = table.pack(select(2, ...)),
			Origin = getcallingscript(),
			Function = getcallingfunction(),
			Line = getcallingline(),
			Source = getcallingsource(),
			IsExecutor = checkcaller(),
		}

		if Log.Blocked then
			if wax.shared.SaveManager:GetState("LogBlockedRemotes", false) then
				Info.Blocked = true
				Log:Call(Info)
			end

			return
		elseif not Log.Ignored then
			Log:Call(Info)
			-- For RemoteFunction return value (ex: local result = RemoteFunction:InvokeServer())
			if self.ClassName == "RemoteFunction" and (Method == "InvokeServer" or Method == "invokeServer") then
				Log = wax.shared.Logs.Incoming[self]
				if not Log then
					Log = wax.shared.NewLog(self, "Incoming", Method, getcallingscript())
				end

				if Log.Blocked then
					if wax.shared.SaveManager:GetState("LogBlockedRemotes", false) then
						Log:Call({
							Arguments = table.pack(),
							Origin = getcallingscript(),
							Function = getcallingfunction(),
							Line = getcallingline(),
							Source = getcallingsource(),
							IsExecutor = checkcaller(),
							OriginalInvokeArgs = table.pack(select(2, ...)),
							Blocked = true,
						})
					end

					return
				end

				local Result = table.pack(wax.shared.NamecallHook(...))
				if not Log.Ignored then
					local RFResultInfo = {
						Arguments = Result,
						Origin = getcallingscript(),
						Function = getcallingfunction(),
						Line = getcallingline(),
						Source = getcallingsource(),
						IsExecutor = checkcaller(),
						OriginalInvokeArgs = table.pack(select(2, ...)),
					}
					Log:Call(RFResultInfo)
				end

				return table.unpack(Result, 1, Result.n)
			end
		end
	end

	return wax.shared.NamecallHook(...)
end)

-- function hooks
local FunctionsToHook
do
	local BindableFunction = Instance.new("BindableFunction")
	local BindableEvent = Instance.new("BindableEvent")

	local RemoteFunction = Instance.new("RemoteFunction")
	local RemoteEvent = Instance.new("RemoteEvent")
	local UnreliableRemoteEvent = Instance.new("UnreliableRemoteEvent")

	FunctionsToHook = {
		BindableFunction.Invoke,
		BindableEvent.Fire,

		RemoteFunction.InvokeServer,
		RemoteEvent.FireServer,
		UnreliableRemoteEvent.FireServer,
	}

	BindableFunction:Destroy()
	BindableEvent:Destroy()

	RemoteFunction:Destroy()
	RemoteEvent:Destroy()
	UnreliableRemoteEvent:Destroy()
end

for _, Function in next, FunctionsToHook do
	local Method = debug.info(Function, "n")

	wax.shared.Hooks[Function] = wax.shared.Hooking.HookFunction(Function, function(...)
		local self = ...

		if
			typeof(self) == "Instance"
			and AllowedClassNames[self.ClassName]
			and not rawequal(self, wax.shared.Communicator)
			and not wax.shared.ShouldIgnore(self, getcallingscript())
		then
			local Log = wax.shared.Logs.Outgoing[self]
			if not Log then
				Log = wax.shared.NewLog(self, "Outgoing", Method, getcallingscript())
			end

			local Info = {
				Arguments = table.pack(select(2, ...)),
				Origin = getcallingscript(),
				Function = getcallingfunction(),
				Line = getcallingline(),
				Source = getcallingsource(),
				IsExecutor = checkcaller(),
			}

			if Log.Blocked then
				if wax.shared.SaveManager:GetState("LogBlockedRemotes", false) then
					Info.Blocked = true
					Log:Call(Info)
				end

				return
			elseif not Log.Ignored then
				Log:Call(Info)
				-- For RemoteFunction return value (ex: local result = RemoteFunction:InvokeServer())
				if self.ClassName == "RemoteFunction" and (Method == "InvokeServer" or Method == "invokeServer") then
					Log = wax.shared.Logs.Incoming[self]
					if not Log then
						Log = wax.shared.NewLog(self, "Incoming", Method, getcallingscript())
					end

					if Log.Blocked then
						if wax.shared.SaveManager:GetState("LogBlockedRemotes", false) then
							Log:Call({
								Arguments = table.pack(),
								Origin = getcallingscript(),
								Function = getcallingfunction(),
								Line = getcallingline(),
								Source = getcallingsource(),
								IsExecutor = checkcaller(),
								OriginalInvokeArgs = table.pack(select(2, ...)),
								Blocked = true,
							})
						end

						return
					end

					local Result = table.pack(wax.shared.Hooks[Function](...))
					if not Log.Ignored then
						local RFResultInfo = {
							Arguments = Result,
							Origin = getcallingscript(),
							Function = getcallingfunction(),
							Line = getcallingline(),
							Source = getcallingsource(),
							IsExecutor = checkcaller(),
							OriginalInvokeArgs = table.pack(select(2, ...)),
						}
						Log:Call(RFResultInfo)
					end

					return table.unpack(Result, 1, Result.n)
				end
			end
		end

		return wax.shared.Hooks[Function](...)
	end)
end

end)() end,
    [25] = function()local wax,script,require=ImportGlobals(25)local ImportGlobals return (function(...)local FileHelper = {}
FileHelper.__index = FileHelper

function FileHelper.new(basePath: string)
    local self = setmetatable({
        BasePath = FileHelper.NormalizePath(basePath),
    }, FileHelper)

    self:EnsureDirectory()
    return self
end

function FileHelper:EnsureDirectory()
    local paths = {}
    local parts = self.BasePath:split("/")

    for idx = 1, #parts do
        paths[#paths + 1] = table.concat(parts, "/", 1, idx)
    end

    for i = 1, #paths do
        local str = paths[i]
        if isfolder(str) then continue end
        makefolder(str)
    end
end

function FileHelper:GetPath(relativePath: string)
    local normalizedPath = self.NormalizePath(relativePath or "")
    
    if self.BasePath:sub(-1) == "/" then
        return self.BasePath .. normalizedPath
    end
    
    if normalizedPath == "" then
        return self.BasePath
    end
    
    return self.BasePath .. "/" .. normalizedPath
end

function FileHelper.NormalizePath(path: string)
    if type(path) ~= "string" then return "" end
    return path:gsub("\\", "/")
end

function FileHelper:GetRelativePath(path: string)
    path = self.NormalizePath(path)
    local basePath = self.NormalizePath(self.BasePath)
    if basePath:sub(-1) ~= "/" then
        basePath = basePath .. "/"
    end
    
    local Start, End = string.find(path, basePath, 1, true)
    if Start then
        return string.sub(path, End + 1)
    end
    
    return path
end

function FileHelper:EnsureFile(relativePath: string, default: string)
    relativePath = self.NormalizePath(relativePath or "")
    
    if not isfile(self:GetPath(relativePath)) then
        writefile(self:GetPath(relativePath), default)
    end
end

function FileHelper:ReadFile(relativePath: string)
    relativePath = self.NormalizePath(relativePath or "")
    return readfile(self:GetPath(relativePath))
end

function FileHelper:ReadRawFile(path: string)
    return readfile(path)
end

function FileHelper:WriteFile(relativePath: string, data: string)
    relativePath = self.NormalizePath(relativePath or "")
    
    writefile(self:GetPath(relativePath), data)
end

function FileHelper:DeleteFile(relativePath: string)
    relativePath = self.NormalizePath(relativePath or "")
    
    if isfile(self:GetPath(relativePath)) then
        delfile(self:GetPath(relativePath))
    end
end

function FileHelper:DeleteDirectory(relativePath: string)
    relativePath = self.NormalizePath(relativePath or "")
    
    if isfolder(self:GetPath(relativePath)) then
        delfolder(self:GetPath(relativePath))
    end
end

function FileHelper:ListFiles(relativePath: string?)
    relativePath = self.NormalizePath(relativePath or "")
    
    local files = {}
    for _, file in listfiles(self:GetPath(relativePath)) do
        table.insert(files, self:GetRelativePath(file))
    end

    return files
end

function FileHelper:GetFileName(relativePath: string)
    relativePath = self.NormalizePath(relativePath or "")
    
    return relativePath:match("[^/]+$")
end

function FileHelper:ListFileNames(relativePath: string?)
    relativePath = self.NormalizePath(relativePath or "")
    
    local names = {}
    for _, file in self:ListFiles(relativePath) do
        table.insert(names, self:GetFileName(file))
    end

    return names
end

return FileHelper
end)() end,
    [26] = function()local wax,script,require=ImportGlobals(26)local ImportGlobals return (function(...)-- Logger
-- ActualMasterOogway
-- December 8, 2024

--[=[
    A simple logging utility that writes messages to a file. Supports different log levels
    and can be configured to overwrite or append to the log file.

    Log Format:  2024-12-04T15:28:31.131Z,0.131060,MyThread,Warning [FLog::RobloxStarter] Roblox stage ReadyForFlagFetch completed
                 <timestamp>,<elapsed_time>,<thread_id>,<level> <message>
]=]

local Logger = {}
Logger.__index = Logger

Logger.LOG_LEVELS = {
	ERROR = 1,
	WARNING = 2,
	INFO = 3,
	DEBUG = 4,
}

local LOG_LEVEL_STRINGS = {
	[Logger.LOG_LEVELS.ERROR] = "ERROR",
	[Logger.LOG_LEVELS.WARNING] = "WARNING",
	[Logger.LOG_LEVELS.INFO] = "INFO",
	[Logger.LOG_LEVELS.DEBUG] = "DEBUG",
}

local startTime = tick()

local function createDirectoryRecursive(path)
	local currentPath = ""
	for part in path:gmatch("[^\\/]+") do
		currentPath = currentPath .. part
		if not isfolder(currentPath) then
			makefolder(currentPath)
		end
		currentPath = currentPath .. "/"
	end
end

--[=[
    Generates a unique file name for the log file. The file name is based on the current
    job ID, ensuring it is unique per server instance but consistent across multiple
    executions within the same server.

    @return string A unique file name for the log file.
]=]
function Logger:GenerateFileName()
	local JobIdNumber = game.JobId:gsub("%D", "")
	local timestamp = os.date("!%Y%m%d%H%M%S")

	return `{self.logFileDirectory}/{JobIdNumber * 1.7 // 1.8}_{timestamp}.log`
end

--[=[
    Creates a new Logger instance.

    @param logFilePath string The path to the log file.
    @param logLevel number The minimum log level to write to the file. Defaults to INFO.
    @param overwrite boolean Whether to overwrite the log file or append to it. Defaults to false (append).
    @return Logger A new Logger instance.
]=]
function Logger.new(logFilePath: string, logLevel: number?, overwrite: boolean?)
	local self = setmetatable({}, Logger)
	self.logFilePath = logFilePath
	self.logFileDirectory = logFilePath:match("(.+)/")
	self.logLevel = logLevel or Logger.LOG_LEVELS.INFO
	self.overwrite = overwrite or false

	local folderPath, fileName = logFilePath:match("(.*[\\/])(.*)")

	if folderPath and not isfolder(folderPath) then
		createDirectoryRecursive(folderPath)
	end

	if self.overwrite then
		local success, err = pcall(writefile, self.logFilePath, "")
		if not success then
			warn(debug.traceback(`Failed to clear log file: {self.logFilePath} - {err}`, 2))
		end
	end

	self:Info("Logger", "Logger initialized")

	return self
end

--[=[
    Logs a message to the file.

    @param level number The log level of the message.
    @param threadId string The ID of the thread or source of the log message.
    @param message string The message to log.
]=]
function Logger:Log(level: number, threadId: string, message: string)
	if level <= self.logLevel then
		local levelStr = LOG_LEVEL_STRINGS[level]

		local timestamp = `{os.date("!%Y-%m-%dT%H:%M:%S")}{("%.3f"):format(tick() % 1)}Z`
		local elapsedTime = ("%.6f"):format(tick() - startTime)

		local logMessage = `{timestamp},{elapsedTime},{threadId},{levelStr} {message}\n`

		local success, err = pcall(appendfile, self.logFilePath, logMessage)
		if not success then
			warn(debug.traceback(`Failed to write to log file: {self.logFilePath} - {err}`, 2))
		end
	end
end

--[=[
    Logs a debug message.

    @param threadId string The ID of the thread or source of the log message.
    @param message string The message to log.
]=]
function Logger:Debug(threadId: string, message: string)
	self:Log(Logger.LOG_LEVELS.DEBUG, threadId, message)
end

--[=[
    Logs an info message.

    @param threadId string The ID of the thread or source of the log message.
    @param message string The message to log.
]=]
function Logger:Info(threadId: string, message: string)
	self:Log(Logger.LOG_LEVELS.INFO, threadId, message)
end

--[=[
    Logs a warning message.

    @param threadId string The ID of the thread or source of the log message.
    @param message string The message to log.
]=]
function Logger:Warning(threadId: string, message: string)
	self:Log(Logger.LOG_LEVELS.WARNING, threadId, message)
end

--[=[
    Logs an error message.

    @param threadId string The ID of the thread or source of the log message.
    @param message string The message to log.
]=]
function Logger:Error(threadId: string, message: string)
	self:Log(Logger.LOG_LEVELS.ERROR, threadId, message)
end

return Logger
end)() end,
    [46] = function()local wax,script,require=ImportGlobals(46)local ImportGlobals return (function(...)--[[
	Main Window Logic for cobalt, all UI elements are created and managed here.
]]

local AnticheatData = require(script.Parent.Utils.Anticheats.Main)
local LuaEncode = require(script.Parent.Utils.Serializer.LuaEncode)

local Utils = script.Parent.Utils

local Pagination = require(Utils.Pagination)
local CodeGen = require(Utils.CodeGen.Generator)
local SessionExporter = require(Utils.CodeGen.SessionExporter)

local UIUtils = script.Parent.Utils.UI

local SyntaxHighlighter = require(UIUtils.Highlighter)

local AssetManager = require(UIUtils.AssetManager)
local Icons = require(UIUtils.Icons)

local Interface = require(UIUtils.Interface)
local Helper = require(UIUtils.Helper)

local Resize = require(UIUtils.Resize)
local Drag = require(UIUtils.Drag)

local PaginationHelper = Pagination.new({
	ItemsPerPage = wax.shared.SaveManager:GetState("MaxItemPerPages", 20),
	TotalItems = 0,
})

local Tabs = {}
local CurrentPage = {}
local CurrentInfo, CurrentTab, CurrentLog, InfoButtons

local LogsList
local ShowPagination, ShowCalls, CreateCallFrame, ShowLog, CreateLogButton, CleanLogsList, UpdateSearch, SelectResult, EnterResult, OpenSearch

local DefaultTweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Exponential)

type SupportedRemoteTypes = RemoteEvent | RemoteFunction | BindableEvent | BindableFunction | UnreliableRemoteEvent
local ClassOrder = {
	"RemoteEvent",
	"UnreliableRemoteEvent",
	"RemoteFunction",
	"BindableEvent",
	"BindableFunction",
}

local Images = {
	RemoteEvent = "rbxassetid://110803789420086",
	UnreliableRemoteEvent = "rbxassetid://126244162339059",
	RemoteFunction = "rbxassetid://108537517159060",
	BindableEvent = "rbxassetid://116839398727495",
	BindableFunction = "rbxassetid://112264959079193",
}

-- Functions
local function UpdateLogNameSize(Log)
	local TextSizeX, _TextSizeY =
		wax.shared.GetTextBounds("x" .. #Log.Calls, Log.Button.Calls.FontFace, Log.Button.Calls.TextSize)
	Log.Button.Name.Size = UDim2.new(1, -(TextSizeX + 24), 1, 0)
end

local function GetDPIScale()
	local Scale = wax.shared.SaveManager:GetState("WindowDPIScale", "100%")
	return (tonumber(Scale:sub(1, #Scale - 1)) or 100) / 100
end
wax.shared.GetDPIScale = GetDPIScale

-- ContentProvider PreloadAsync bypass
Images = AssetManager.GetRemoteImages(Images)

local CobaltLogo = AssetManager.GetImage("Logo")

local ScreenGui = Interface.New("ScreenGui", {
	Name = "Cobalt",
	ResetOnSpawn = false,
	Parent = Interface.GetScreenParent(),
	ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
})
wax.shared.ScreenGui = ScreenGui

local ScreenDPIScale = Interface.New("UIScale", {
	Parent = ScreenGui,
	Scale = GetDPIScale(),
})

local MainUICorner = Interface.New("UICorner", {
	CornerRadius = UDim.new(0, 6),
})

local MainFrame = Interface.New("Frame", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(15, 15, 15),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromOffset(640, 420),
	ZIndex = 0,

	MainUICorner,
	Parent = ScreenGui,
})

local ShowButton = Interface.New("TextButton", {
	AnchorPoint = Vector2.new(0.5, 0),
	BackgroundColor3 = Color3.fromRGB(15, 15, 15),
	Position = UDim2.new(0.5, 0, 0, 36),
	Size = UDim2.fromOffset(36, 36),
	Text = "",
	Visible = false,

	["ImageLabel"] = {
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
		Image = CobaltLogo,
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.new(1, -10, 1, -10),
	},

	["UIStroke"] = {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.new(1, 1, 1),
	},

	MainUICorner,
	Parent = ScreenGui,
})
do
	ShowButton.MouseButton1Click:Connect(function()
		ShowButton.Visible = false
		MainFrame.Visible = true
	end)
end

-- Resizing
Resize.new({
	MainFrame = MainFrame,

	MinimumSize = Vector2.new(585, 220),

	CornerHandleSize = 20,
	HandleSize = 6,
})

-- Context Menus
local CurrentContext
local ContextMenu = Interface.New("Frame", {
	AutomaticSize = Enum.AutomaticSize.XY,
	BackgroundColor3 = Color3.fromRGB(10, 10, 10),
	Size = UDim2.fromScale(0, 0),
	ZIndex = 10000,
	Visible = false,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 6),
	},

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 0),
	},

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 4),
		PaddingRight = UDim.new(0, 4),
		PaddingTop = UDim.new(0, 4),
		PaddingBottom = UDim.new(0, 4),
	},

	["UIStroke"] = {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(25, 25, 25),
		Thickness = 1,
	},

	Parent = ScreenGui,
})

local function CreateContextMenu(Parent: GuiObject, Options: {}, MouseOnCursorPosition: boolean?)
	local ContextData = {
		Parent = Parent,
		Options = {},
	}

	local function BuildContextMenu(Options: {})
		for Order, Data in pairs(Options) do
			local TextButton = Interface.New("TextButton", {
				BackgroundColor3 = Color3.fromRGB(25, 25, 25),
				BackgroundTransparency = 1,
				LayoutOrder = Order,
				Size = UDim2.new(1, 0, 0, 30),
				Text = "",

				["UICorner"] = {
					CornerRadius = UDim.new(0, 6),
				},

				["UIPadding"] = {
					PaddingBottom = UDim.new(0, 6),
					PaddingLeft = UDim.new(0, 6),
					PaddingRight = UDim.new(0, 6),
					PaddingTop = UDim.new(0, 6),
				},
			})

			local IconToSet = Data.Icon
			if typeof(IconToSet) == "function" then
				IconToSet = IconToSet()
			end

			local ItemIcon
			if tostring(IconToSet):match("rbxasset") then
				ItemIcon = Interface.New("ImageLabel", {
					Image = IconToSet,
					Size = UDim2.fromScale(1, 1),
					SizeConstraint = Enum.SizeConstraint.RelativeYY,

					Parent = TextButton,
				})
			else
				ItemIcon = Interface.NewIcon(IconToSet, {
					Size = UDim2.fromScale(1, 1),
					SizeConstraint = Enum.SizeConstraint.RelativeYY,

					Parent = TextButton,
				})
			end

			local TextToSet = Data.Text
			if typeof(TextToSet) == "function" then
				TextToSet = TextToSet()
			end

			local ItemText = Interface.New("TextLabel", {
				AutomaticSize = Enum.AutomaticSize.X,
				Position = UDim2.fromOffset(Data.Icon == nil and 0 or 26, 0),
				Size = UDim2.fromScale(0, 1),
				Text = TextToSet,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,

				Parent = TextButton,
			})

			if Data.TextProperties then
				local Properties = typeof(Data.TextProperties) == "function" and Data.TextProperties()
					or Data.TextProperties
				for Property, Value in pairs(Properties) do
					ItemText[Property] = Value
				end
			end

			TextButton.MouseEnter:Connect(function()
				wax.shared.TweenService
					:Create(TextButton, DefaultTweenInfo, {
						BackgroundTransparency = 0,
					})
					:Play()
			end)
			TextButton.MouseLeave:Connect(function()
				wax.shared.TweenService
					:Create(TextButton, DefaultTweenInfo, {
						BackgroundTransparency = 1,
					})
					:Play()
			end)
			TextButton.MouseButton1Click:Connect(function()
				TextButton.BackgroundTransparency = 1

				if Data.Callback then
					Data.Callback()
				end

				if Data.CloseOnClick ~= false then
					ContextData:Close()
				else
					for _, Option in pairs(ContextData.Options) do
						Option:Display()
					end
				end
			end)

			function Data:Display()
				if typeof(Data.Text) == "function" then
					ItemText.Text = Data.Text()
				end

				if typeof(Data.Icon) == "function" then
					IconToSet = Data.Icon()

					if tostring(IconToSet):match("rbxasset") then
						ItemIcon.ImageRectOffset = Vector2.new(0, 0)
						ItemIcon.ImageRectSize = Vector2.new(0, 0)
						ItemIcon.Image = IconToSet
					else
						Icons.SetIcon(ItemIcon, IconToSet)
					end
				end

				if Data.TextProperties then
					local Properties = typeof(Data.TextProperties) == "function" and Data.TextProperties()
						or Data.TextProperties
					for Property, Value in pairs(Properties) do
						ItemText[Property] = Value
					end
				end
			end

			ContextData.Options[TextButton] = Data
		end
	end

	function ContextData:Open()
		if CurrentContext == ContextData then
			return
		end

		if CurrentContext then
			CurrentContext:Close()
		end

		CurrentContext = ContextData
		for Object, Data in pairs(ContextData.Options) do
			if Data.Condition and not Data.Condition() then
				continue
			end
			Object.Parent = ContextMenu
			Data:Display()
		end

		if MouseOnCursorPosition then
			ContextMenu.Position = UDim2.fromOffset(
				wax.shared.UserInputService:GetMouseLocation().X,
				wax.shared.UserInputService:GetMouseLocation().Y - (45 / GetDPIScale())
			)
		else
			ContextMenu.Position =
				UDim2.fromOffset(
					Parent.AbsolutePosition.X / GetDPIScale(),
					(Parent.AbsolutePosition.Y + Parent.AbsoluteSize.Y) / GetDPIScale()
				)
		end
		ContextMenu.Visible = true
	end

	function ContextData:Toggle()
		if CurrentContext == ContextData then
			ContextData:Close()
			return
		end

		ContextData:Open()
	end

	function ContextData:Close()
		if CurrentContext ~= ContextData then
			return
		end

		ContextMenu.Visible = false
		for Object, _ in pairs(ContextData.Options) do
			Object.Parent = nil
		end
		CurrentContext = nil
	end

	function ContextData:SetContextMenu(Options: { any })
		for Object, Data in pairs(ContextData.Options) do
			Object:Destroy()
		end
		ContextData.Options = {}
		BuildContextMenu(Options)
	end

	BuildContextMenu(Options)
	return ContextData
end

-- Sonner toast
local SonnerUI = Interface.New("ScrollingFrame", {
	Name = "Sonner",
	BackgroundTransparency = 1,
	Size = UDim2.fromOffset(285, 115),
	Position = UDim2.fromScale(1, 1),
	AnchorPoint = Vector2.new(1, 1),
	ZIndex = 5000,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	ScrollingEnabled = false,
	ClipsDescendants = true,
	Parent = MainFrame,
})

wax.shared.Sonner.init(SonnerUI)

-- Modal
local OpenedModal
local ModalBackground = Interface.New("TextButton", {
	BackgroundColor3 = Color3.fromRGB(0, 0, 0),
	BackgroundTransparency = 0.5,
	Size = UDim2.fromScale(1, 1),
	Text = "",
	Visible = false,
	ZIndex = 2,

	MainUICorner,
	Parent = MainFrame,
})

local function OpenModal(Parent)
	OpenedModal = Parent

	OpenedModal.Visible = true
	ModalBackground.Visible = true
end

local function CloseModal()
	if OpenedModal then
		OpenedModal.Visible = false
		OpenedModal = nil
	end

	ModalBackground.Visible = false
end

ModalBackground.MouseButton1Click:Connect(CloseModal)

local function ConnectCloseButton(Button, Image, Parent)
	Button.MouseEnter:Connect(function()
		wax.shared.TweenService
			:Create(Image, DefaultTweenInfo, {
				ImageTransparency = 0.25,
			})
			:Play()
	end)
	Button.MouseLeave:Connect(function()
		wax.shared.TweenService
			:Create(Image, DefaultTweenInfo, {
				ImageTransparency = 0.5,
			})
			:Play()
	end)
	Button.MouseButton1Click:Connect(CloseModal)
end

local function CreateModalTop(Title: string, Icon: string, Parent: GuiObject)
	local ModalTop = Interface.New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 36),
		Parent = Parent,

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		},
	})

	local ModalTitle = Interface.New("TextLabel", {
		Text = Title,
		TextSize = 17,
		TextTruncate = Enum.TextTruncate.AtEnd,
		Size = UDim2.new(1, -60, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Parent = ModalTop,
	})

	local ModalIcon

	if Icon:match("rbxasset") then
		ModalIcon = Interface.New("ImageLabel", {
			Image = Icon,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(4, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,

			Parent = ModalTop,
		})
	else
		ModalIcon = Interface.NewIcon(Icon, {
			ImageTransparency = 0.5,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromOffset(4, 0),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,

			Parent = ModalTop,
		})
	end

	local CloseButton = Interface.New("ImageButton", {
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.fromScale(1, 0),
		Parent = ModalTop,
	})
	local CloseImage = Interface.NewIcon("x", {
		ImageTransparency = 0.5,
		Size = UDim2.fromOffset(22, 22),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,

		Parent = CloseButton,
	})

	ConnectCloseButton(CloseButton, CloseImage, Parent)

	Interface.New("Frame", {
		Parent = Parent,
		BackgroundColor3 = Color3.fromRGB(25, 25, 25),
		Size = UDim2.new(1, 0, 0, 1),
		Position = UDim2.fromOffset(0, 36),
	})

	return ModalTitle, ModalIcon
end

-- Settings
local SettingsFrame = Interface.New("TextButton", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(10, 10, 10),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.new(0.65, 0, 0, 285),
	Text = "",
	Visible = false,
	Parent = ModalBackground,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 8),
	},

	["UIStroke"] = {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(25, 25, 25),
		Thickness = 1,
	},
})

Resize.new({
	MainFrame = SettingsFrame,

	MaximumSize = UDim2.new(1, -2, 1, -2),
	MinimumSize = UDim2.fromScale(0.65, 0.712),
	Mirrored = true,
	LockedPosition = true,

	CornerHandleSize = 20,
	HandleSize = 6,
})

CreateModalTop("Settings", "settings", SettingsFrame)

local SettingsScrollingFrame = Interface.New("ScrollingFrame", {
	AnchorPoint = Vector2.new(0, 1),
	BackgroundTransparency = 1,
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 1, -37),
	ClipsDescendants = true,
	ScrollBarThickness = 2,
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(0, 0),
	Parent = SettingsFrame,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 15),
	},

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 8),
		PaddingRight = UDim.new(0, 8),
		PaddingTop = UDim.new(0, 8),
		PaddingBottom = UDim.new(0, 8),
	},
})

-- Plugins
local PluginsFrame = Interface.New("TextButton", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(10, 10, 10),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.new(0.65, 0, 0, 285),
	Text = "",
	Visible = false,
	Parent = ModalBackground,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 8),
	},

	["UIStroke"] = {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(25, 25, 25),
		Thickness = 1,
	},
})

Resize.new({
	MainFrame = PluginsFrame,

	MaximumSize = UDim2.new(1, -2, 1, -2),
	MinimumSize = UDim2.fromScale(0.65, 0.712),
	Mirrored = true,
	LockedPosition = true,

	CornerHandleSize = 20,
	HandleSize = 6,
})

CreateModalTop("Plugins", "blocks", PluginsFrame)

local PluginsScrollingFrame = Interface.New("ScrollingFrame", {
	AnchorPoint = Vector2.new(0, 1),
	BackgroundTransparency = 1,
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 1, -37),
	ClipsDescendants = true,
	ScrollBarThickness = 2,
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.fromScale(0, 0),
	Parent = PluginsFrame,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 15),
	},

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 8),
		PaddingRight = UDim.new(0, 8),
		PaddingTop = UDim.new(0, 8),
		PaddingBottom = UDim.new(0, 8),
	},
})

local SettingsBuilder = {}
local SectionBuilder = {}
do
	-- Builders
	SettingsBuilder.__index = SettingsBuilder
	SectionBuilder.__index = SectionBuilder

	function SettingsBuilder.new(Parent: Frame)
		return setmetatable({
			Parent = Parent,
		}, SettingsBuilder)
	end

	function SectionBuilder.new(Parent: Frame, DataSavePrefix: string?)
		return setmetatable({
			Parent = Parent,
			DataSavePrefix = DataSavePrefix or "",
		}, SectionBuilder)
	end

	-- Sections Constructor
	function SettingsBuilder:CreateSection(SectionName: string, DataSavePrefix: string?)
		local Section = Interface.New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			Parent = self.Parent,

			["UIListLayout"] = {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 6),
			},

			["TextLabel"] = {
				Text = SectionName,
				FontFace = Font.fromId(12187365364, Enum.FontWeight.Bold),
				TextSize = 18,
				Size = UDim2.new(1, 0, 0, 18),
				TextXAlignment = Enum.TextXAlignment.Left,
				LayoutOrder = -1,
			},
		})

		return SectionBuilder.new(Section, DataSavePrefix)
	end

	-- Creates a horizontal sub-row inside a section and returns a SectionBuilder for it.
	-- Use this when you want multiple elements side-by-side (e.g. two buttons in one row).
	function SectionBuilder:CreateRow(Padding: UDim?)
		local Row = Interface.New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Parent = self.Parent,

			["UIListLayout"] = {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = Padding or UDim.new(0, 8),
			},
		})
		return SectionBuilder.new(Row, self.DataSavePrefix)
	end

	function SectionBuilder:AddLabel(Text: string, TextSize: number?)
		return Interface.New("TextLabel", {
			Text = Text,
			TextSize = TextSize or 16,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			BackgroundTransparency = 1,
			Parent = self.Parent,
			TextWrapped = true,
		})
	end

	-- Section Element Constructors
	function SectionBuilder:CreateButton(Text: string, Callback: () -> (), TextSize: number?)
		local Button = Interface.New("TextButton", {
			BackgroundColor3 = Color3.fromRGB(15, 15, 15),
			Size = UDim2.new(1, 0, 0, 24),
			TextSize = 15,
			Text = "",
			Parent = self.Parent,

			["UICorner"] = {
				CornerRadius = UDim.new(0, 4),
			},

			["UIStroke"] = {
				Color = Color3.fromRGB(25, 25, 25),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			},

			["TextLabel"] = {
				Text = Text,
				TextSize = TextSize or 16,
				TextTransparency = 0.5,
				Size = UDim2.fromScale(1, 1),
				Position = UDim2.fromOffset(0, -1),
			},
		})

		Button.MouseButton1Click:Connect(function()
			if Callback then
				Callback()
			end
		end)

		return Button
	end

	function SectionBuilder:CreateCheckbox(
		Idx: string,
		Options: {
			Text: string,
			Callback: (boolean) -> () | nil,
			Default: boolean?,
		}
	)
		Idx = self.DataSavePrefix .. Idx
		local Checkbox = {
			Default = Options.Default or false,
			Value = wax.shared.SaveManager:GetState(Idx, Options.Default),
		}

		local CheckboxUI = Interface.New("TextButton", {
			Text = Options.Text,
			TextSize = 16,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 20),
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = self.Parent,
		})

		local ToggleOnColor = Color3.fromRGB(52, 199, 89)
		local ToggleOffColor = Color3.fromRGB(50, 50, 50)

		local ToggleKnobOffSize = UDim2.fromOffset(16, 16)
		local ToggleKnobOnSize = UDim2.fromOffset(18, 18)
		local ToggleKnobInset = 10

		local ToggleTrack = Interface.New("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(36, 20),
			BackgroundColor3 = ToggleOffColor,
			Parent = CheckboxUI,

			["UICorner"] = {
				CornerRadius = UDim.new(1, 0),
			},
		})

		local ToggleKnob = Interface.New("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.new(1, 1, 1),
			Size = ToggleKnobOffSize,
			Parent = ToggleTrack,

			["UICorner"] = {
				CornerRadius = UDim.new(1, 0),
			},
		})

		local function UpdateToggleVisual(instant: boolean?)
			local TargetTrackColor = if Checkbox.Value then ToggleOnColor else ToggleOffColor
			local TargetKnobPosition = if Checkbox.Value
				then UDim2.new(1, -ToggleKnobInset, 0.5, 0)
				else UDim2.new(0, ToggleKnobInset, 0.5, 0)
			local TargetKnobSize = if Checkbox.Value then ToggleKnobOnSize else ToggleKnobOffSize

			if instant then
				ToggleTrack.BackgroundColor3 = TargetTrackColor
				ToggleKnob.Position = TargetKnobPosition
				ToggleKnob.Size = TargetKnobSize
			else
				wax.shared.TweenService
					:Create(ToggleTrack, DefaultTweenInfo, {
						BackgroundColor3 = TargetTrackColor,
					})
					:Play()

				wax.shared.TweenService
					:Create(ToggleKnob, DefaultTweenInfo, {
						Position = TargetKnobPosition,
						Size = TargetKnobSize,
					})
					:Play()
			end
		end

		UpdateToggleVisual(true)

		local function Toggle()
			Checkbox:SetValue(not Checkbox.Value)
		end

		CheckboxUI.MouseButton1Click:Connect(Toggle)

		function Checkbox:Reset()
			Checkbox:SetValue(Checkbox.Default)
		end

		function Checkbox:SetValue(NewValue)
			if wax.shared.ActorCommunicator then
				pcall(function()
					wax.shared.ActorCommunicator:Fire("MainSettingsSync", Idx, NewValue)
				end)
			end

			wax.shared.SaveManager:SetState(Idx, NewValue)

			Checkbox.Value = NewValue
			UpdateToggleVisual()

			if Options.Callback then
				Options.Callback(Checkbox.Value)
			end
		end

		if wax.shared.ActorCommunicator then
			pcall(function()
				wax.shared.ActorCommunicator:Fire("MainSettingsSync", Idx, Checkbox.Value)
			end)
		end
		wax.shared.Settings[Idx] = Checkbox
		return Checkbox
	end

	function SectionBuilder:CreateTextBox(
		Idx: string,
		Options: {
			Text: string,
			Callback: (string) -> () | nil,
			Default: string?,
			Placeholder: string?,
			ClearTextOnFocus: boolean?,
			Width: number?,
			NumericOnly: boolean?,
		}
	)
		Idx = self.DataSavePrefix .. Idx
		local NumericOnly = Options.NumericOnly == true
		local TextBoxWidth = Options.Width or 160

		local function NormalizeValue(NewValue: any): string
			local Value = tostring(NewValue or "")

			if not NumericOnly then
				return Value
			end

			if Value == "" then
				return ""
			end

			local Characters = table.create(#Value)
			local HasDigits = false
			local HasDecimal = false
			local SignApplied = false

			for Index = 1, #Value do
				local Char = string.sub(Value, Index, Index)
				local Byte = string.byte(Char)

				if Char == "-" and not SignApplied and not HasDigits and not HasDecimal then
					table.insert(Characters, Char)
					SignApplied = true
				elseif Char == "." and not HasDecimal then
					table.insert(Characters, Char)
					HasDecimal = true
					SignApplied = true
				elseif Byte and Byte >= 48 and Byte <= 57 then
					table.insert(Characters, Char)
					HasDigits = true
					SignApplied = true
				end
			end

			local Sanitized = table.concat(Characters)

			if Sanitized == "-" or Sanitized == "." or Sanitized == "-." then
				return ""
			end

			return Sanitized
		end

		local DefaultValue = NormalizeValue(Options.Default)
		local SavedValue = wax.shared.SaveManager:GetState(Idx)
		local InitialValue = NormalizeValue(if SavedValue ~= nil then SavedValue else DefaultValue)

		local TextSetting = {
			Default = DefaultValue,
			Value = InitialValue,
		}

		local Container = Interface.New("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 26),
			Parent = self.Parent,

			["UIPadding"] = {
				PaddingLeft = UDim.new(0, 2),
				PaddingRight = UDim.new(0, 2),
			},
		})

		Interface.New("TextLabel", {
			BackgroundTransparency = 1,
			Position = UDim2.fromOffset(0, 0),
			Size = UDim2.new(1, -TextBoxWidth - 6, 1, 0),
			Text = Options.Text,
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			TextWrapped = true,
			Parent = Container,
		})

		local Input = Interface.New("TextBox", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundColor3 = Color3.fromRGB(5, 5, 5),
			ClearTextOnFocus = Options.ClearTextOnFocus or false,
			PlaceholderColor3 = Color3.fromRGB(128, 128, 128),
			PlaceholderText = Options.Placeholder or "",
			Position = UDim2.fromScale(1, 0),
			Size = UDim2.new(0, TextBoxWidth, 1, -2),
			Text = InitialValue,
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
			Parent = Container,

			["UICorner"] = {
				CornerRadius = UDim.new(0, 4),
			},

			["UIStroke"] = {
				Color = Color3.fromRGB(25, 25, 25),
				Thickness = 1,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			},

			["UIPadding"] = {
				PaddingLeft = UDim.new(0, 6),
				PaddingRight = UDim.new(0, 6),
			},
		})

		local function SyncValue(NewValue: string, FireCallback: boolean?)
			TextSetting.Value = NewValue
			Input.Text = NewValue

			if FireCallback ~= false and Options.Callback then
				local ArgumentToPass = NewValue
				if NumericOnly then
					ArgumentToPass = tonumber(ArgumentToPass)
				end

				Options.Callback(ArgumentToPass)
			end
		end

		function TextSetting:Reset()
			TextSetting:SetValue(TextSetting.Default)
		end

		function TextSetting:SetValue(NewValue)
			local PreparedValue = NormalizeValue(NewValue)

			if PreparedValue == TextSetting.Value then
				SyncValue(PreparedValue, false)
				return
			end

			if wax.shared.ActorCommunicator then
				pcall(function()
					wax.shared.ActorCommunicator:Fire("MainSettingsSync", Idx, PreparedValue)
				end)
			end

			wax.shared.SaveManager:SetState(Idx, PreparedValue)
			SyncValue(PreparedValue)
		end

		Input.FocusLost:Connect(function()
			TextSetting:SetValue(Input.Text)
		end)

		if wax.shared.ActorCommunicator then
			pcall(function()
				wax.shared.ActorCommunicator:Fire("MainSettingsSync", Idx, TextSetting.Value)
			end)
		end

		SyncValue(TextSetting.Value, false)

		wax.shared.Settings[Idx] = TextSetting
		return TextSetting
	end

	function SectionBuilder:CreateDropdown(
		Idx: string,
		Options: {
			Multi: boolean?,
			AllowNull: boolean?,
			Values: { [any]: any },
			Default: any | { [any]: any },
			Callback: (any) -> () | nil,
			Text: string,
		}
	)
		Idx = self.DataSavePrefix .. Idx
		local AllowNull = Options.AllowNull or false
		assert(AllowNull or Options.Default ~= nil, "Default value must be provided when AllowNull is false")

		local function CreateLookupTable(Values: { any } | any)
			if typeof(Values) ~= "table" then
				return Values
			end

			local LookupTable = {}
			for _, Value in Values do
				LookupTable[Value] = true
			end
			return LookupTable
		end

		local Dropdown = {
			Values = Options.Values or {},
			Default = Options.Default and CreateLookupTable(Options.Default)
				or Options.AllowNull and (Options.Multi and {} or Options.Values[1])
				or {},
			Value = wax.shared.SaveManager:GetState(
				Idx,
				Options.Default and CreateLookupTable(Options.Default)
					or Options.AllowNull and (Options.Multi and {} or Options.Values[1])
					or {}
			),
			Multi = Options.Multi or false,
			Callback = Options.Callback,
		}

		local DropdownUI = Interface.New("TextButton", {
			Text = Options.Text,
			TextSize = 16,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 24),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Parent = self.Parent,
		})

		DropdownUI.AutoButtonColor = false

		local DropdownDisplay = Interface.New("Frame", {
			AnchorPoint = Vector2.new(1, 0.5),
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(180, 24),
			Parent = DropdownUI,

			["UICorner"] = {
				CornerRadius = UDim.new(0, 4),
			},

			["UIStroke"] = {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(25, 25, 25),
				Thickness = 1,
			},

			["UIPadding"] = {
				PaddingLeft = UDim.new(0, 8),
				PaddingRight = UDim.new(0, 8),
			},
		})

		local ValueLabel = Interface.New("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, -16, 1, 0),
			Text = "Select...",
			TextSize = 16,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextTransparency = 0.45,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Parent = DropdownDisplay,
		})

		local DropdownIcon = Interface.NewIcon("chevron-down", {
			AnchorPoint = Vector2.new(1, 0.5),
			ImageTransparency = 0.2,
			Position = UDim2.new(1, 0, 0.5, 0),
			Size = UDim2.fromOffset(12, 12),
			Parent = DropdownDisplay,
		})

		local DisplayDefaultColor = DropdownDisplay.BackgroundColor3
		local DisplayHoverColor = Color3.fromRGB(12, 12, 12)

		local function TweenDisplayColor(TargetColor, TargetTransparency)
			wax.shared.TweenService
				:Create(DropdownDisplay, DefaultTweenInfo, {
					BackgroundColor3 = TargetColor,
				})
				:Play()

			if TargetTransparency then
				wax.shared.TweenService
					:Create(DropdownIcon, DefaultTweenInfo, {
						ImageTransparency = TargetTransparency,
					})
					:Play()
			end
		end

		DropdownUI.MouseEnter:Connect(function()
			TweenDisplayColor(DisplayHoverColor, 0.05)
		end)

		DropdownUI.MouseLeave:Connect(function()
			TweenDisplayColor(DisplayDefaultColor, 0.2)
		end)

		local function IterateValues(Callback: (any, string) -> ())
			for Index, Object in Dropdown.Values do
				local ActualValue = typeof(Index) == "number" and Object or Index
				local DisplayText = typeof(Index) == "number" and tostring(Object) or tostring(Index)
				Callback(ActualValue, DisplayText)
			end
		end

		local function ResolveValueText(Value)
			local Resolved
			IterateValues(function(ActualValue, DisplayText)
				if ActualValue == Value then
					Resolved = DisplayText
				end
			end)
			return Resolved or (Value ~= nil and tostring(Value) or "")
		end

		local function UpdateValueLabel()
			local DisplayText = "Select..."
			local Transparency = 0.45

			if Dropdown.Multi then
				local SelectedTexts = {}
				IterateValues(function(Value, Text)
					if Dropdown.Value[Value] then
						table.insert(SelectedTexts, Text)
					end
				end)

				if #SelectedTexts == 0 then
					DisplayText = "None"
					Transparency = 0.45
				else
					table.sort(SelectedTexts)
					if #SelectedTexts <= 2 then
						DisplayText = table.concat(SelectedTexts, ", ")
					else
						DisplayText = string.format("%s, +%d", SelectedTexts[1], #SelectedTexts - 1)
					end
					Transparency = 0
				end
			else
				local CurrentValue = Dropdown.Value
				if CurrentValue == nil or CurrentValue == "" then
					DisplayText = "None"
					Transparency = 0.45
				else
					local Resolved = ResolveValueText(CurrentValue)
					if Resolved == "" then
						DisplayText = tostring(CurrentValue)
					else
						DisplayText = Resolved
					end
					Transparency = 0
				end
			end

			ValueLabel.Text = DisplayText
			ValueLabel.TextTransparency = Transparency
		end

		local function BuildDropdownContext()
			local Options = {}
			for Index, Object in Dropdown.Values do
				local IsArray = typeof(Index) == "number"

				local ContextOption = {
					Text = tostring(Object),
					CloseOnClick = not Dropdown.Multi,
					Callback = function()
						local Value = IsArray and Object or Index

						if Dropdown.Multi then
							Dropdown.Value[Value] = not (Dropdown.Value[Value] or false)
						else
							Dropdown.Value = Value
						end

						if wax.shared.ActorCommunicator then
							pcall(function()
								wax.shared.ActorCommunicator:Fire("MainSettingsSync", Idx, Dropdown.Value)
							end)
						end

						wax.shared.SaveManager:SetState(Idx, Dropdown.Value)

						UpdateValueLabel()

						if Dropdown.Callback then
							Dropdown.Callback(Dropdown.Value)
						end
					end,
					TextProperties = function()
						local Value = IsArray and Object or Index

						if Dropdown.Multi and Dropdown.Value[Value] then
							return {
								TextTransparency = 0,
							}
						elseif not Dropdown.Multi and Dropdown.Value == Value then
							return {
								TextTransparency = 0,
							}
						end

						return {
							TextTransparency = 0.5,
						}
					end,
				}

				if not IsArray then
					ContextOption.Text = Index
					ContextOption.Icon = Object
				end

				table.insert(Options, ContextOption)
			end
			return Options
		end

		local ContextMenu = CreateContextMenu(DropdownDisplay, BuildDropdownContext())

		DropdownUI.MouseButton1Click:Connect(ContextMenu.Toggle)
		function Dropdown:Reset()
			if Dropdown.Multi then
				local Cloned = {}
				for Key, Value in pairs(Dropdown.Default) do
					Cloned[Key] = Value
				end
				Dropdown:SetValue(Cloned)
			else
				Dropdown:SetValue(Dropdown.Default)
			end

			UpdateValueLabel()
		end

		function Dropdown:SetValue(NewValue)
			if wax.shared.ActorCommunicator then
				pcall(function()
					wax.shared.ActorCommunicator:Fire("MainSettingsSync", Idx, NewValue)
				end)
			end

			wax.shared.SaveManager:SetState(Idx, NewValue)

			ContextMenu:Close()

			for Image, Object in pairs(Dropdown.Values) do
				local IsArray = typeof(Image) == "number"
				local Value = IsArray and Object or Image

				if Dropdown.Multi then
					Dropdown.Value[Value] = NewValue[Value]
				else
					Dropdown.Value = NewValue
				end
			end

			UpdateValueLabel()
		end

		if wax.shared.ActorCommunicator then
			pcall(function()
				wax.shared.ActorCommunicator:Fire("MainSettingsSync", Idx, Dropdown.Value)
			end)
		end

		UpdateValueLabel()

		wax.shared.Settings[Idx] = Dropdown
		return Dropdown
	end

	function SectionBuilder:CreateRemoteList(
		Idx: string,
		Options: {
			Text: string,
			Callback: (any) -> () | nil,
			NullMessage: string,
		}
	)
		Idx = self.DataSavePrefix .. Idx
		local RemoteList = {
			Value = {},
			InfoMapping = {},
		}

		local RemoveIgnored

		local RemoteListContainer = Interface.New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			Parent = self.Parent,

			["UICorner"] = {
				CornerRadius = UDim.new(0, 8),
			},

			["UIListLayout"] = {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 6),
			},

			["UIPadding"] = {
				PaddingLeft = UDim.new(0, 5),
				PaddingRight = UDim.new(0, 5),
				PaddingTop = UDim.new(0, 5),
				PaddingBottom = UDim.new(0, 5),
			},

			["UIStroke"] = {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(25, 25, 25),
				Thickness = 1,
			},
		})

		local NoRemotesText = Interface.New("TextLabel", {
			Size = UDim2.new(1, 0, 0, 100),
			TextTransparency = 0.5,
			Text = Options.NullMessage,
			TextSize = 14,
			Visible = true,
			Parent = RemoteListContainer,
		})

		function RemoteList:Display()
			for _, Object in pairs(RemoteListContainer:GetChildren()) do
				if not Object:IsA("Frame") then
					continue
				end
				Object:Destroy()
			end

			NoRemotesText.Visible = (#self.Value == 0)
			RemoveIgnored.Visible = (#self.Value > 0)

			for _, remoteData in self.Value do
				local remote = remoteData.Instance
				if not remote then
					continue
				end

				local ListElement = Interface.New("Frame", {
					BackgroundColor3 = Color3.fromRGB(0, 0, 0),
					Size = UDim2.new(1, 0, 0, 32),
					Parent = RemoteListContainer,

					["UICorner"] = {
						CornerRadius = UDim.new(0, 4),
					},

					["UIStroke"] = {
						Color = Color3.fromRGB(25, 25, 25),
						Thickness = 1,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
					},

					["Frame"] = {
						Size = UDim2.fromScale(1, 1),
						BackgroundTransparency = 1,

						["UIListLayout"] = {
							FillDirection = Enum.FillDirection.Horizontal,
							HorizontalAlignment = Enum.HorizontalAlignment.Left,
							VerticalAlignment = Enum.VerticalAlignment.Center,
							Padding = UDim.new(0, 4),
						},

						["UIPadding"] = {
							PaddingLeft = UDim.new(0, 5),
						},

						["ImageLabel"] = {
							Size = UDim2.new(1, -8, 1, -8),
							SizeConstraint = Enum.SizeConstraint.RelativeYY,
							Image = Images[remote.ClassName],
							AnchorPoint = Vector2.new(0, 0.5),
							BackgroundTransparency = 1,
							LayoutOrder = 1,
						},

						["TextLabel"] = {
							Text = `{remote.Name} ({remoteData.Type})`,
							Size = UDim2.fromScale(1, 1),
							AutomaticSize = Enum.AutomaticSize.X,
							TextSize = 16,
							TextXAlignment = Enum.TextXAlignment.Left,
							BackgroundTransparency = 1,
							LayoutOrder = 2,
						},
					},
				})

				local RemoveButton = Interface.New("ImageButton", {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(1, 0.5),
					Position = UDim2.new(1, -8, 0.5, 0),
					Size = UDim2.new(1, -12, 1, -12),
					SizeConstraint = Enum.SizeConstraint.RelativeYY,
					ImageTransparency = 0.5,
					Parent = ListElement,
				})

				Icons.SetIcon(RemoveButton, "trash")

				RemoveButton.MouseEnter:Connect(function()
					wax.shared.TweenService
						:Create(RemoveButton, DefaultTweenInfo, {
							ImageTransparency = 0,
						})
						:Play()
				end)

				RemoveButton.MouseLeave:Connect(function()
					wax.shared.TweenService
						:Create(RemoveButton, DefaultTweenInfo, {
							ImageTransparency = 0.5,
						})
						:Play()
				end)

				RemoveButton.MouseButton1Click:Connect(function()
					self:RemoveFromList(remoteData)
					if Options.Callback then
						Options.Callback(remoteData)
					end
				end)
			end
		end

		function RemoteList:AddToList(remote)
			table.insert(self.Value, remote)

			self:Display()
		end

		function RemoteList:RemoveFromList(remote)
			local index = table.find(self.Value, remote)
			if not index then
				return
			end

			table.remove(self.Value, index)

			self:Display()
		end

		function RemoteList:SetList(remotes: { SupportedRemoteTypes })
			self.Value = remotes

			self:Display()
		end

		RemoveIgnored = self:CreateButton("Remove All", function()
			if not Options.Callback then
				return
			end

			local ToRemove = {}
			for _, remote in RemoteList.Value do
				Options.Callback(remote)
				table.insert(ToRemove, remote)
			end

			for _, remote in ToRemove do
				RemoteList:RemoveFromList(remote)
			end
			wax.shared.Sonner.success("Removed all remotes")
		end)
		RemoveIgnored.Visible = false

		RemoteList:Display()

		wax.shared.Settings[Idx] = RemoteList
		return RemoteList
	end
end

local PluginSettings = SettingsBuilder.new(PluginsScrollingFrame)
wax.shared.PluginSettings = PluginSettings

local PluginsSection = PluginSettings:CreateSection("Plugins")
do
	local HeaderLabel = PluginsSection.Parent:FindFirstChildWhichIsA("TextLabel")
	local SummaryLabel = Interface.New("TextLabel", {
		Text = `<font transparency="0.5">Waiting for plugins...</font>`,
		RichText = true,
		TextSize = 13,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.new(0, 0, 1, 0),
		AnchorPoint = Vector2.new(1, 0),
		Position = UDim2.new(1, 0, 0, 0),
		TextXAlignment = Enum.TextXAlignment.Right,
		BackgroundTransparency = 1,
		Parent = HeaderLabel,
	})

	-- Container that holds all per-plugin cards
	local PluginCardsContainer = Interface.New("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(1, 0),
		Parent = PluginsSection.Parent,

		["UIListLayout"] = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, 5),
		},
	})

	local function CreatePluginCard(IsError: boolean, Title: string, Meta: string, Body: string)
		local AccentColor = IsError and Color3.fromRGB(220, 55, 55) or Color3.fromRGB(55, 185, 100)

		local Card = Interface.New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundColor3 = Color3.fromRGB(18, 18, 18),
			Size = UDim2.fromScale(1, 0),
			Parent = PluginCardsContainer,

			["UICorner"] = {
				CornerRadius = UDim.new(0, 6),
			},

			["UIStroke"] = {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = Color3.fromRGB(35, 35, 35),
				Thickness = 1,
			},
		})

		-- Left accent bar
		Interface.New("Frame", {
			AnchorPoint = Vector2.new(0, 0.5),
			BackgroundColor3 = AccentColor,
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(0, 3, 1, -8),
			BorderSizePixel = 0,
			Parent = Card,
		})


		local Content = Interface.New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			Parent = Card,

			["UIPadding"] = {
				PaddingLeft  = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				PaddingTop   = UDim.new(0, 7),
				PaddingBottom = UDim.new(0, 7),
			},

			["UIListLayout"] = {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, 2),
			},
		})

		-- Title row: name + badge
		local TitleRow = Interface.New("Frame", {
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 0),
			Parent = Content,

			["UIListLayout"] = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 6),
			},
		})

		Interface.New("TextLabel", {
			Text = Title,
			RichText = false,
			Font = Enum.Font.GothamBold,
			TextSize = 14,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Parent = TitleRow,
		})

		-- Status badge (only shown for errors)
		if IsError then
			local Badge = Interface.New("Frame", {
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundColor3 = AccentColor,
				BackgroundTransparency = 0.75,
				LayoutOrder = 2,
				Parent = TitleRow,

				["UICorner"] = {
					CornerRadius = UDim.new(1, 0),
				},

				["UIPadding"] = {
					PaddingLeft = UDim.new(0, 6),
					PaddingRight = UDim.new(0, 6),
					PaddingTop = UDim.new(0, 2),
					PaddingBottom = UDim.new(0, 2),
				},
			})

			Interface.New("TextLabel", {
				Text = "ERROR",
				Font = Enum.Font.GothamBold,
				TextColor3 = AccentColor,
				TextSize = 10,
				AutomaticSize = Enum.AutomaticSize.XY,
				BackgroundTransparency = 1,
				Parent = Badge,
			})
		end

		-- Meta line (version · author  OR  file path)
		if Meta ~= "" then
			Interface.New("TextLabel", {
				Text = Meta,
				RichText = false,
				Font = Enum.Font.Gotham,
				TextColor3 = Color3.fromRGB(160, 160, 160),
				TextSize = 12,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Parent = Content,
			})
		end

		-- Body (description or error message)
		if Body ~= "" then
			Interface.New("TextLabel", {
				Text = Body,
				RichText = false,
				Font = Enum.Font.Gotham,
				TextColor3 = IsError and Color3.fromRGB(210, 120, 120) or Color3.fromRGB(140, 140, 140),
				TextSize = 12,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				TextWrapped = true,
				Parent = Content,
			})
		end
	end

	task.spawn(function()
		while not wax.shared.CobaltPluginManager or not wax.shared.CobaltPluginManager.Initialized do
			task.wait()
		end

		local Registry = wax.shared.CobaltPluginManager.Registry
		local LoadedCount = #Registry.Plugins
		local ErrorCount  = #Registry.Errored

		-- Update summary label
		local SummaryParts = {}
		if LoadedCount > 0 then
			table.insert(SummaryParts, `<font color="#37b964"><b>{LoadedCount}</b></font> loaded`)
		end
		if ErrorCount > 0 then
			table.insert(SummaryParts, `<font color="#dc3737"><b>{ErrorCount}</b></font> errored`)
		end
		if #SummaryParts == 0 then
			table.insert(SummaryParts, `<font transparency="0.5">No plugins installed.</font>`)
		end
		SummaryLabel.RichText = true
		SummaryLabel.Text = table.concat(SummaryParts, `<font transparency="0.6"> · </font>`)

		-- Errored plugins first (most actionable)
		for _, ErrorInfo in Registry.Errored do
			local FileName = string.match(ErrorInfo.FilePath, "([^/]+)$") or ErrorInfo.FilePath
			local Title = ErrorInfo.Name or FileName
			local Meta = if ErrorInfo.Name
				then `v{ErrorInfo.Version or "1.0.0"}  ·  by {ErrorInfo.Author or "Unknown"}  ·  {FileName}`
				else ErrorInfo.FilePath
			CreatePluginCard(true, Title, Meta, ErrorInfo.Error)
		end

		-- Loaded plugins
		for _, PluginInfo in Registry.Plugins do
			local Data = PluginInfo.PluginData
			local Name = Data.Name or "Unknown"
			local Version = Data.Version or "1.0.0"
			local Author = Data.Author or "Unknown"
			local Desc = Data.Description or "No description."
			CreatePluginCard(false, Name, `v{Version}  ·  by {Author}`, Desc)
		end
	end)
end

-- Main Settings
-- God this warning box code is so ass 🥀
if #wax.shared.ExecutorSupport.FailedChecks.NonEssential > 0 then
	local WarningDisplay = Interface.New("Frame", {
		AnchorPoint = Vector2.new(1, 0.5),
		BackgroundColor3 = Color3.fromRGB(245, 60, 54),
		BackgroundTransparency = 0.75,
		Position = UDim2.new(1, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		Parent = SettingsScrollingFrame,

		["UICorner"] = {
			CornerRadius = UDim.new(0, 4),
		},

		["UIStroke"] = {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(245, 60, 54),
			Thickness = 1,
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 8),
		},

		["UIListLayout"] = {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		},
	})

	local function CreatePaddingText(size: number)
		return `<font size="{size}"> \n</font>`
	end

	local NoticeTitleInfoSeperator = CreatePaddingText(4)

	Interface.New("TextLabel", {
		Text = `<font size="16"><b>DETECTION NOTICE ⚠️</b></font>\n{NoticeTitleInfoSeperator}Cobalt can get detected because your executor does not support the following functions/libraries:`,
		TextSize = 15,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		BackgroundTransparency = 1,
		Parent = WarningDisplay,
		TextWrapped = true,
	})

	local NonEssentialFailures = wax.shared.ExecutorSupport.FailedChecks.NonEssential
	local DetectionDetails = CreatePaddingText(6)
	local DetectionSuffix = `\n{CreatePaddingText(7)}`
	for _, Name in NonEssentialFailures do
		DetectionDetails ..= `⚠️ <b><font color="#ff9900">{Name}</font></b>\n<i><font size="14" transparency="0.5">{wax.shared.ExecutorSupport[Name].Details}</font></i>{DetectionSuffix}`
	end

	DetectionDetails = DetectionDetails:sub(1, (#DetectionSuffix * -1) - 1)

	Interface.New("TextLabel", {
		Text = DetectionDetails,
		TextSize = 15,
		Size = UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Parent = WarningDisplay,
		TextWrapped = true,
	})
end

local MainSettings = SettingsBuilder.new(SettingsScrollingFrame)
local ExecSupportSection = MainSettings:CreateSection("Support Info")
do
	ExecSupportSection:AddLabel(table.concat({
		`Executor: <b>{wax.shared.ExecutorName}</b>`,
		`Support: {#wax.shared.ExecutorSupport.FailedChecks.Essential == 0 and "<b>Full</b>" or "<b>Partial</b> (" .. #wax.shared.ExecutorSupport.FailedChecks.Essential .. " check(s) failed)"}`,
	}, "\n"))

	local PartialSupportText = ""
	local SupportSuffix = "\n\n"
	for _, Name in wax.shared.ExecutorSupport.FailedChecks.Essential do
		PartialSupportText ..= `❌ <b><font color="#ff0000">{Name}</font></b>\n<i><font size="14" transparency="0.5">{wax.shared.ExecutorSupport[Name].Details}</font></i>{SupportSuffix}`
	end

	PartialSupportText = PartialSupportText:sub(1, (#SupportSuffix * -1) - 1)

	if #wax.shared.ExecutorSupport.FailedChecks.Essential > 0 then
		ExecSupportSection:AddLabel(PartialSupportText)
	end
end

local CodeGenSection = MainSettings:CreateSection("Code Generation")

CodeGenSection:CreateDropdown("InstancePathLookupChain", {
	Text = "Instance Path Lookup Chain",
	Values = {
		["Index"] = "file",
		["WaitForChild"] = "file-clock",
		["FindFirstChild"] = "file-search",
	},
	Default = "Index",
})

CodeGenSection:CreateDropdown("EventReferenceStrategy", {
	Text = "Fallback Event Ref Strategy",
	Values = {
		["GetNil"] = "bug",
		["Upvalue Lookup"] = "circle-fading-arrow-up",
	},
	Default = "GetNil",
})

CodeGenSection:CreateCheckbox("PreferBufferFromString", {
	Text = "Prefer buffer.fromstring",
	Default = false,
})

CodeGenSection:CreateCheckbox("CacheInstancePaths", {
	Text = "Cache Event Instance Paths",
	Default = false,
})

CodeGenSection:CreateCheckbox("ShowWatermark", {
	Text = "Show Cobalt Watermark",
	Default = true,
})

local MainSection = MainSettings:CreateSection("Main")

MainSection:CreateDropdown("WindowDPIScale", {
	Text = "DPI Scale",
	Values = {
		"50%",
		"75%",
		"100%",
		"125%",
		"150%"
	},
	Default = "100%",

	Callback = function(value)
		ScreenDPIScale.Scale = GetDPIScale()
	end
})

MainSection:CreateTextBox("MaxItemPerPages", {
	Text = "Logs Per Page",
	Default = 20,
	NumericOnly = true,

	Callback = function(max)
		PaginationHelper:SetItemsPerPage(max)

		if not CurrentLog then
			return
		end

		PaginationHelper:Update(#CurrentLog.Calls)
		PaginationHelper:SetPage(1)
		CurrentPage[CurrentLog] = 1

		ShowLog(CurrentLog)
	end,
})

MainSection:CreateCheckbox("ExecuteOnTeleport", {
	Text = "Execute On Teleport",
	Default = false,
})

MainSection:CreateCheckbox("UseAlternativeHooks", {
	Text = "Use alternative metamethod hook",
	Default = false,
})

MainSection:CreateCheckbox("AnticheatBypass", {
	Text = "Built-in Anticheat Bypass",
	Default = false,
})

if AnticheatData.Disabled then
	MainSection:AddLabel(`Anticheat Detected: <b>{AnticheatData.Name}</b>`)
end

wax.shared.ClearLogs = function(FilterInstance: Instance?, FilterType: string?)
	local ClearedAny = false
	for Type, LogCategory in pairs(wax.shared.Logs) do
		if FilterType and Type ~= FilterType then
			continue
		end

		for Index, Log in pairs(LogCategory) do
			if FilterInstance and Log.Instance ~= FilterInstance then
				continue
			end

			if Log.Button then
				Log.Button.Instance:Destroy()
				Log.Button = nil
			end

			CurrentPage[Log] = nil

			table.clear(Log.Calls)
			table.clear(Log.GameCalls)
			Log.Index = 0
			ClearedAny = true
		end
	end

	CleanLogsList()
	if not FilterInstance then
		CurrentLog = nil
	elseif CurrentLog and CurrentLog.Instance == FilterInstance then
		CurrentLog = nil
	end

	if ClearedAny then
		wax.shared.Sonner.success(`Successfully Cleared {FilterInstance and FilterInstance.Name .. " " or ""}{FilterType or "All"} Logs`)
	end
end

wax.shared.GetCurrentLog = function()
	return CurrentLog
end

MainSection:CreateButton("Clear All Logs", wax.shared.ClearLogs)

local FilterSection = MainSettings:CreateSection("Filter")

FilterSection:CreateDropdown("IgnoredRemotesDropdown", {
	Text = "Ignore Remotes",
	Values = Images,
	Default = { "BindableEvent", "BindableFunction" },
	AllowNull = true,
	Multi = true,
})

FilterSection:CreateCheckbox("AutoIgnoreSpammyEvents", {
	Text = "Auto Ignore Spammy Events",
	Default = false,
})

FilterSection:CreateCheckbox("LogActors", {
	Text = "Log Events from Actors",
	Default = true,
})

FilterSection:CreateCheckbox("IgnorePlayerModule", {
	Text = "Ignore Player Module Remotes",
	Default = true,
})
FilterSection:CreateCheckbox("ShowExecutorLogs", {
	Text = `Show {wax.shared.ExecutorName} Remote Logs`,
	Default = true,
	Callback = function()
		if not CurrentLog then
			return
		end

		PaginationHelper:Update(#CurrentLog.Calls)
		PaginationHelper:SetPage(1)
		CurrentPage[CurrentLog] = 1

		ShowLog(CurrentLog)
	end,
})
FilterSection:CreateCheckbox("LogBlockedRemotes", {
	Text = "Log Blocked Remotes",
	Default = true,
})
FilterSection:CreateButton("Reset Filtering to Default", function()
	wax.shared.Settings.IgnoredRemotesDropdown:Reset()
	wax.shared.Settings.IgnoreSpammyRemotes:Reset()
	wax.shared.Settings.IgnorePlayerModule:Reset()
	wax.shared.Settings.ShowExecutorLogs:Reset()
	wax.shared.Settings.LogBlockedRemotes:Reset()

	wax.shared.Sonner.success("Successfully reset remote filtering to default")
end)

local IgnoredSection = MainSettings:CreateSection("Ignored")

IgnoredSection:CreateRemoteList("IgnoredRemotes", {
	Text = "Ignored Remotes",
	NullMessage = "No remotes have been ignored yet.",
	Callback = function(Remote)
		Remote.Ignored = false
	end,
})

local BlockedSection = MainSettings:CreateSection("Blocked")

BlockedSection:CreateRemoteList("BlockedRemotes", {
	Text = "Blocked Remotes",
	NullMessage = "No remotes have been blocked yet.",
	Callback = function(Remote)
		Remote.Blocked = false
		Remote:SetConnectionsEnabled(true)
	end,
})

local LoggingSection = MainSettings:CreateSection("Logging")
local SessionLog

LoggingSection:CreateCheckbox("EnableLogging", {
	Text = `Enable File Logs`,
	Default = false,
	Callback = function(value)
		if not value then
			wax.shared.LogConnection:Disconnect()
			wax.shared.LogConnection = nil
			wax.shared.LogFileName = nil
			SessionLog.Text = `Current Session Log: <b>Not Logging</b>`
			wax.shared.Sonner.success("Successfully disabled file logging")
			return
		end

		local LogConnection = wax.shared.SetupLoggingConnection()
		SessionLog.Text = `Current Session Log: <b>{wax.shared.LogFileName:gsub("Cobalt/Logs/", "")}</b>`
		wax.shared.LogConnection = wax.shared.Connect(wax.shared.Communicator.Event:Connect(LogConnection))

		wax.shared.Sonner.success("Successfully enabled file logging")
	end,
})

SessionLog = LoggingSection:AddLabel(`Current Session Log: <b>{wax.shared.Settings.EnableLogging.Value and wax.shared.LogFileName:gsub(
	"Cobalt/Logs/",
	""
) or "Not Logging"}</b>`)

LoggingSection:AddLabel(`Logs Path: <b>Cobalt/Logs</b>`)

local SessionButtons = LoggingSection:CreateRow()

local CopySessionName = SessionButtons:CreateButton("Copy Session Name", function()
	if not wax.shared.Settings.EnableLogging.Value then
		wax.shared.Sonner.error("File logging is not enabled")
		return
	end

	local ActualLogFileName = wax.shared.LogFileName:gsub("Cobalt/Logs/", "")
	local Success, Error = pcall(setclipboard, ActualLogFileName)

	if not Success then
		warn(Error)
		wax.shared.Sonner.error("Failed to copy session name")
		return
	end

	wax.shared.Sonner.success("Successfully copied session name to clipboard")
end, 14)
CopySessionName.Size = UDim2.new(0.5, -4, 0, 24)

local CopyFullSessionPath = SessionButtons:CreateButton("Copy Full Path", function()
	if not wax.shared.Settings.EnableLogging.Value then
		wax.shared.Sonner.error("File logging is not enabled")
		return
	end

	local Success, Error = pcall(setclipboard, wax.shared.LogFileName)

	if not Success then
		warn(Error)
		wax.shared.Sonner.error("Failed to copy log path")
		return
	end

	wax.shared.Sonner.success("Successfully copied log path to clipboard")
end, 14)
CopyFullSessionPath.Size = UDim2.new(0.5, -4, 0, 24)

LoggingSection:CreateButton("Export Logs to HTML", function()
	wax.shared.Sonner.promise(function(UpdateProgress)
		assert(typeof(writefile) == "function", "Exploit does not support writefile")
		
		--// Collect all logs \\--
		local AllCalls = SessionExporter:FetchAllLogs()
		local SessionData = SessionExporter:GetSessionData(AllCalls)

		--// Data Processing \\--
		UpdateProgress("Sorting calls...")
		SessionExporter:SortCalls(AllCalls)
		local Events, StringMap = SessionExporter:ProcessCalls(
			AllCalls,
			SessionData,
			UpdateProgress
		)

		--// Export \\--
		local FileName = `Cobalt_Session_{os.time()}.html`
		writefile(
			FileName,
			SessionExporter:ExportSessionToHTML(Events, StringMap, SessionData)
		)
		return FileName
	end, {
		loadingText = "Starting Export...",
		successText = function(fileName) return `Successfully exported trace to {fileName}` end,
		errorText = function(err) return `Export Failed: {err}` end,
	})
end, 14)

local CreditsSection = MainSettings:CreateSection("Credits")

local Credits = {
	{
		Credit = "upio",
		Description = "Cobalt Developer",
	},
	{
		Credit = "deivid",
		Description = "Cobalt Developer",
	},
	{
		Credit = "shadcn",
		Description = 'UI Design Insipration (<font color="#3798ff">https://ui.shadcn.com/</font>)',
	},
	{
		Credit = "lucide",
		Description = 'Consistent and clean icons (<font color="#3798ff">https://lucide.dev/</font>)',
	},
	{
		Credit = "Emil Kowalski",
		Description = 'Creator of Sonner component (<font color="#3798ff">https://sonner.emilkowal.ski/</font>)',
	},
}

local CreditsWrapper = Interface.New("Frame", {
	BackgroundTransparency = 1,
	Size = UDim2.fromScale(1, 0),
	AutomaticSize = Enum.AutomaticSize.Y,
	Parent = CreditsSection.Parent,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 10),
	},
})

for Order, Data in pairs(Credits) do
	Interface.New("TextLabel", {
		Text = `<b>{Data.Credit}</b>\n{Data.Description}`,
		Size = UDim2.fromScale(1, 0),
		TextSize = 14,
		AutomaticSize = Enum.AutomaticSize.Y,
		TextXAlignment = Enum.TextXAlignment.Left,
		LayoutOrder = Order,
		Parent = CreditsWrapper,
	})
end

-- Info
local InfoFrame = Interface.New("TextButton", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(10, 10, 10),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.fromScale(0.65, 0.712),
	Text = "",
	Visible = false,
	Parent = ModalBackground,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 8),
	},

	["UIStroke"] = {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(25, 25, 25),
		Thickness = 1,
	},
})

Resize.new({
	MainFrame = InfoFrame,

	MaximumSize = UDim2.new(1, -2, 1, -2),
	MinimumSize = UDim2.fromScale(0.65, 0.712),
	Mirrored = true,
	LockedPosition = true,

	CornerHandleSize = 20,
	HandleSize = 6,
})

local InfoTitle, InfoIcon = CreateModalTop("...", Images["RemoteEvent"], InfoFrame)
local InfoModalTab = {}

local InfoTabsScroller = Interface.New("ScrollingFrame", {
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 4, 0, 44),
	Size = UDim2.new(1, -10, 0, 36),
	CanvasSize = UDim2.fromScale(0, 0),
	AutomaticCanvasSize = Enum.AutomaticSize.X,
	ScrollBarThickness = 0,
	ScrollingDirection = Enum.ScrollingDirection.X,
	ClipsDescendants = true,
	Parent = InfoFrame,
})

local InfoTabs = Interface.New("Frame", {
	BackgroundTransparency = 1,
	AutomaticSize = Enum.AutomaticSize.X,
	Size = UDim2.fromScale(0, 1),
	Parent = InfoTabsScroller,

	["UIListLayout"] = {
		Padding = UDim.new(0, 6),
		FillDirection = Enum.FillDirection.Horizontal,
		VerticalAlignment = Enum.VerticalAlignment.Top,
	},

	["UIPadding"] = {
		PaddingRight = UDim.new(0, 20),
		PaddingTop = UDim.new(0, 2),
		PaddingLeft = UDim.new(0, 2),
	},
})

-- Right gradient (always visible)
Interface.New("Frame", {
	AnchorPoint = Vector2.new(1, 0),
	Position = UDim2.new(1, -6, 0, 44),
	Size = UDim2.new(0, 30, 0, 36),
	BackgroundColor3 = Color3.fromRGB(10, 10, 10),
	BorderSizePixel = 0,
	ZIndex = 10,
	Parent = InfoFrame,

	["UIGradient"] = {
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 1),
			NumberSequenceKeypoint.new(1, 0),
		}),
	},
})

-- Left gradient (only visible after scrolling)
local LeftGradient = Interface.New("Frame", {
	Position = UDim2.new(0, 4, 0, 44),
	Size = UDim2.new(0, 30, 0, 36),
	BackgroundColor3 = Color3.fromRGB(10, 10, 10),
	BorderSizePixel = 0,
	ZIndex = 10,
	Visible = false,
	Parent = InfoFrame,

	["UIGradient"] = {
		Transparency = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0),
			NumberSequenceKeypoint.new(1, 1),
		}),
	},
})

InfoTabsScroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
	LeftGradient.Visible = InfoTabsScroller.CanvasPosition.X > 2
end)

local DefaultFooterButtons = {
	{
		Icon = "code",
		Title = "Code",
		Options = {
			{
				Text = "Calling Code",
				Icon = "forward",
				Callback = function()
					if not CurrentInfo then
						return
					end

					local Code = CodeGen:BuildCallCode(CurrentInfo)
					local Success, Error = pcall(setclipboard, Code)

					if Success then
						wax.shared.Sonner.success("Copied code to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy code to clipboard")
						warn("Failed to copy code to clipboard", Error)
					end
				end,
			},
			{
				Text = "Intercept Code",
				Icon = "shield-alert",
				Callback = function()
					if not CurrentInfo then
						return
					end

					local Code = CodeGen:BuildHookCode(CurrentInfo)
					local Success, Error = pcall(setclipboard, Code)

					if Success then
						wax.shared.Sonner.success("Copied code to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy code to clipboard")
						warn("Failed to copy code to clipboard", Error)
					end
				end,
			},
			{
				Text = "Function Info",
				Icon = "parentheses",
				Callback = function()
					if not CurrentInfo then
						return
					end

					local Info = {
						Function = typeof(CurrentInfo.Function) == "function" and {
							Name = CurrentInfo.Function and debug.info(CurrentInfo.Function, "n") or "Unknown",
							Source = CurrentInfo.Source
								or (CurrentInfo.Function and debug.info(CurrentInfo.Function, "s"))
								or "Unknown",
							Type = CurrentInfo.Function
									and (iscclosure(CurrentInfo.Function) and "C Closure" or "Luau function")
								or "N/A",
							Address = tostring(CurrentInfo.Function),
							Arguments = table.unpack(
								CurrentInfo.Arguments,
								1,
								wax.shared.GetTableLength(CurrentInfo.Arguments)
							),
						} or CurrentInfo.Function,
						Script = CurrentInfo.Origin,
						Line = CurrentInfo.Line,
					}

					if typeof(CurrentInfo.Function) == "function" and islclosure(CurrentInfo.Function) then
						local FunctionInfo = {
							Constants = debug.getconstants,
							Upvalues = debug.getupvalues,
							Protos = debug.getprotos,
						}

						for Type, Func in pairs(FunctionInfo) do
							if not Func then
								continue
							end

							Info.Function[Type] = Func(CurrentInfo.Function)
						end
					end

					local Success, Error = pcall(setclipboard, `local Info = {LuaEncode(Info, { Prettify = true, DisableNilParentHandler = true })}`)
					if Success then
						wax.shared.Sonner.success("Copied function info to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy function info to clipboard")
						warn("Failed to copy function info to clipboard", Error)
					end
				end,
			},
		}
	},
	{
		Icon = "scroll-text",
		Title = "Origin",
		Options = {
			{
				Text = "Remote Path",
				Icon = "package-search",
				Callback = function()
					if not CurrentInfo then
						return
					end

					local Success, Error = pcall(setclipboard, CodeGen.GetFullPath(CurrentInfo.Instance, {
						VariableName = "Event",
						DisableNilParentHandler = false
					}))
					if Success then
						wax.shared.Sonner.success("Copied remote path to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy remote path to clipboard")
						warn("Failed to copy remote path to clipboard", Error)
					end
				end,
			},
			{
				Text = "Script Path",
				Icon = "file-search",
				Condition = function()
					return CurrentInfo and typeof(CurrentInfo.Origin) == "Instance"
				end,
				Callback = function()
					if not (CurrentInfo and typeof(CurrentInfo.Origin) == "Instance") then
						return
					end

					local Success, Error = pcall(setclipboard, CodeGen.GetFullPath(CurrentInfo.Origin))
					if Success then
						wax.shared.Sonner.success("Copied script path to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy script path to clipboard")
						warn("Failed to copy script path to clipboard", Error)
					end
				end,
			},
			{
				Text = "Decompiled Script",
				Icon = "file-text",
				Condition = function()
					return CurrentInfo and typeof(CurrentInfo.Origin) == "Instance" and typeof(decompile) == "function"
				end,
				Callback = function()
					if not (CurrentInfo and typeof(CurrentInfo.Origin) == "Instance" and typeof(decompile) == "function") then
						return
					end

					local Decompiled, Result = pcall(decompile, CurrentInfo.Origin)
					if Decompiled then
						local Success, Error = pcall(setclipboard, Result)
						if Success then
							wax.shared.Sonner.success("Copied decompiled script to clipboard")
						else
							wax.shared.Sonner.error("Failed to copy decompiled script to clipboard")
							warn("Failed to copy decompield script to clipboard", Error)
						end
					else
						wax.shared.Sonner.error("Failed to decompile script")
						warn("Failed to decompile script", Result)
					end
				end,
			},
		}
	},
	{
		Icon = "network",
		Title = "Event",
		Options = {
			{
				Text = "Replay",
				Icon = "play",
				Callback = function()
					if not CurrentInfo then
						return
					end

					wax.shared.Sonner.promise(function()
						wax.shared.ReplayCallInfo(CurrentInfo, CurrentTab.Name)
					end, {
						loadingText = "Replaying event...",
						successText = "Replayed event successfully!",
						errorText = "Failed to replay event",
						time = 4.5,
					})
				end,
			},
			{
				Text = function()
					if not CurrentLog then
						return "Ignore"
					end

					return CurrentLog.Ignored and "Unignore" or "Ignore"
				end,
				Icon = function()
					if not CurrentLog then
						return "eye"
					end

					return CurrentLog.Ignored and "eye" or "eye-off"
				end,
				Callback = function()
					if not CurrentLog then
						return
					end

					CurrentLog:Ignore()
					wax.shared.Sonner.success(`{CurrentLog.Ignored and "Started" or "Stopped"} ignoring event`)
				end,
			},
			{
				Text = function()
					if not CurrentLog then
						return "Block"
					end

					return CurrentLog.Blocked and "Unblock" or "Block"
				end,
				Icon = function()
					if not CurrentLog then
						return "lock"
					end

					return CurrentLog.Blocked and "lock" or "lock-open"
				end,
				Callback = function()
					if not CurrentLog then
						return
					end

					CurrentLog:Block()

					local BlockedRemoteList = wax.shared.Settings["BlockedRemotes"]
					if BlockedRemoteList then
						if CurrentLog.Blocked then
							BlockedRemoteList:AddToList(CurrentLog)
						else
							BlockedRemoteList:RemoveFromList(CurrentLog)
						end
					end

					wax.shared.Sonner.success(`{CurrentLog.Blocked and "Started" or "Stopped"} blocking event`)
				end,
			},
			{
				Text = "Clear Logs",
				Icon = "trash",
				Callback = function()
					if not CurrentLog then
						return
					end

					CurrentLog.Calls = {}
					PaginationHelper:Update(#CurrentLog.Calls)
					PaginationHelper:SetPage(1)
					CurrentPage[CurrentLog] = 1

					CleanLogsList()

					CurrentLog.Button.Calls.Text = "x" .. #CurrentLog.Calls
					UpdateLogNameSize(CurrentLog)

					ShowPagination(CurrentLog)
					ShowCalls(CurrentLog, 1)

					CloseModal()

					wax.shared.Sonner.success("Cleared events for this remote")

					if #CurrentLog.Calls == 0 then
						CurrentLog.Button.Instance.Parent = nil
					end
				end,
			}
		}
	}
}

InfoButtons = Interface.New("Frame", {
	AnchorPoint = Vector2.new(0, 1),
	BackgroundTransparency = 1,
	Position = UDim2.new(0, 6, 1, -7),
	Size = UDim2.new(1, -12, 0, 32),
	Parent = InfoFrame,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, 6),
	},
})

local function CreateInfoDropdownButton(Icon: string, Title: string, Options: {})
	local Button = Interface.New("TextButton", {
		AutomaticSize = Enum.AutomaticSize.X,
		BackgroundColor3 = Color3.fromRGB(20, 20, 20),
		BackgroundTransparency = 1,
		Size = UDim2.fromScale(0, 1),
		Text = "",

		["UICorner"] = {
			CornerRadius = UDim.new(0, 6),
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		},

		["UIStroke"] = {
			Color = Color3.fromRGB(25, 25, 25),
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		},

		["TextLabel"] = {
			Text = Title,
			TextSize = 15,
			Size = UDim2.fromScale(0, 1),
			Position = UDim2.fromOffset(28, 0),
			AutomaticSize = Enum.AutomaticSize.X,
		},

		Parent = InfoButtons,
	})

	Interface.NewIcon(Icon, {
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,

		Parent = Button,
	})

	local Menu = CreateContextMenu(Button, Options)

	Button.MouseEnter:Connect(function()
		wax.shared.TweenService
			:Create(Button, DefaultTweenInfo, {
				BackgroundTransparency = 0,
			})
			:Play()
	end)
	Button.MouseLeave:Connect(function()
		wax.shared.TweenService
			:Create(Button, DefaultTweenInfo, {
				BackgroundTransparency = 1,
			})
			:Play()
	end)
	Button.MouseButton1Click:Connect(Menu.Toggle)
	return Button
end

local CurrentInfoTab = nil

local function UpdateFooterButtons()
	for _, Element in InfoButtons:GetChildren() do
		if Element:IsA("TextButton") then
			Element.Parent = nil
		end
	end

	local PluginManager = wax.shared.CobaltPluginManager
	local TabRegistry = PluginManager and PluginManager.Registry.UIHooks.RemoteInfo.Tabs[CurrentInfoTab] or nil

	if not (TabRegistry and TabRegistry.DisableDefaults) then
		for _, ButtonDef in DefaultFooterButtons do
			if not ButtonDef.Instance then
				ButtonDef.Instance = CreateInfoDropdownButton(ButtonDef.Icon, ButtonDef.Title, ButtonDef.Options)
			end
			ButtonDef.Instance.Parent = InfoButtons
		end
	end

	if TabRegistry and TabRegistry.Buttons then
		for _, ButtonDef in TabRegistry.Buttons do
			if not ButtonDef.Instance then
				ButtonDef.Instance = CreateInfoDropdownButton(ButtonDef.Icon, ButtonDef.Title, ButtonDef.Options)
			end
			ButtonDef.Instance.Parent = InfoButtons
		end
	end
end

if wax.shared.CobaltPluginManager then
	wax.shared.CobaltPluginManager.UI.RemoteInfo.UpdateFooterButtons = UpdateFooterButtons
end

local function CreateInfoTab(Icon: string, Title: string, TabContents: Frame?)
	if not CurrentInfoTab then
		CurrentInfoTab = Title
	end

	local IsTabSelected = CurrentInfoTab == Title

	if TabContents then
		TabContents.Parent = InfoFrame
		TabContents.Visible = IsTabSelected
	end

	local ButtonColor = IsTabSelected and Color3.fromRGB(25, 25, 25) or Color3.fromRGB(0, 0, 0)
	local TabButton = Interface.New("TextButton", {
		BackgroundColor3 = ButtonColor,
		Size = UDim2.fromScale(0, 1),
		AutomaticSize = Enum.AutomaticSize.X,
		Text = "",
		Parent = InfoTabs,

		["UICorner"] = {
			CornerRadius = UDim.new(0, 8),
		},

		["UIStroke"] = {
			Color = Color3.fromRGB(25, 25, 25),
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		},

		["Frame"] = {
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.fromScale(0, 1),
			Size = UDim2.fromScale(1, 0.5),
			BackgroundColor3 = ButtonColor,
		},
	})

	InfoModalTab[Title] = {
		TabButton = TabButton,
		TabContents = TabContents,
	}

	local TextWrapper = Interface.New("Frame", {
		BackgroundTransparency = 1,
		AutomaticSize = Enum.AutomaticSize.X,
		Size = UDim2.fromOffset(0, 24),
		Parent = TabButton,

		["UIListLayout"] = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 5),
		},

		["UIPadding"] = {
			PaddingRight = UDim.new(0, 8),
			PaddingLeft = UDim.new(0, 8),
		},

		["TextLabel"] = {
			Text = Title,
			TextSize = 15,
			Size = UDim2.fromScale(0, 1),
			AutomaticSize = Enum.AutomaticSize.X,
			LayoutOrder = 2,
			ZIndex = 2,
		},
	})

	Interface.NewIcon(Icon, {
		Position = UDim2.fromOffset(8, 5),
		Size = UDim2.fromOffset(16, 16),
		LayoutOrder = 1,
		ZIndex = 2,

		Parent = TextWrapper,
	})

	wax.shared.Connect(TabButton.MouseButton1Click:Connect(function()
		local OldTab = InfoModalTab[CurrentInfoTab]
		local OldTabButton = OldTab.TabButton
		local OldTabContents = OldTab.TabContents

		OldTabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		OldTabButton.Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		OldTabContents.Visible = false

		CurrentInfoTab = Title
		UpdateFooterButtons()

		TabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		TabButton.Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

		if TabContents then
			TabContents.Visible = true
		end
	end))
end

local function CreateTabContent()
	local Container = Interface.New("Frame", {
		Position = UDim2.fromOffset(6, 71),
		Size = UDim2.new(1, -12, 1, -118),
		BackgroundColor3 = Color3.fromRGB(0, 0, 0),

		["UICorner"] = {
			CornerRadius = UDim.new(0, 6),
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 8),
			PaddingRight = UDim.new(0, 8),
			PaddingTop = UDim.new(0, 8),
			PaddingBottom = UDim.new(0, 8),
		},

		["UIStroke"] = {
			Color = Color3.fromRGB(25, 25, 25),
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		},
	})

	return Container,
		Interface.New("ScrollingFrame", {
			Size = UDim2.fromScale(1, 1),
			BackgroundTransparency = 1,
			AutomaticCanvasSize = Enum.AutomaticSize.XY,
			CanvasSize = UDim2.fromScale(0, 0),
			ScrollBarThickness = 0,
			HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
			ScrollingDirection = Enum.ScrollingDirection.XY,
			Parent = Container,
		})
end

wax.shared.CreateRemoteInfoTab = CreateInfoTab
wax.shared.CreateTabContent = CreateTabContent
wax.shared.OpenModal = OpenModal
wax.shared.CloseModal = CloseModal
wax.shared.CreateModalTop = CreateModalTop
wax.shared.CreateInfoDropdownButton = CreateInfoDropdownButton
wax.shared.ModalBackground = ModalBackground

local ArgumentInfoUI, ArgumentScrollingFrame = CreateTabContent()
CreateInfoTab("ellipsis", "Arguments", ArgumentInfoUI)
ArgumentScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y

local ArgumentsInfoFrame = Interface.New("Frame", {
	AutomaticSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
	Size = UDim2.fromScale(1, 0),

	["UIListLayout"] = {
		Padding = UDim.new(0, 6),
	},

	MainUICorner,

	Parent = ArgumentScrollingFrame,
})

local CodeInfoUI, CodeScrollingFrame = CreateTabContent()
CreateInfoTab("code", "Code", CodeInfoUI)
CodeScrollingFrame.ScrollBarThickness = 3
CodeScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.None

local CodeTextLabels = {}
for i = 1, 5 do
	CodeTextLabels[i] = Interface.New("TextLabel", {
		AutomaticSize = Enum.AutomaticSize.XY,
		TextSize = 16,
		TextColor3 = Color3.fromRGB(255, 255, 255),
		FontFace = Font.fromId(16658246179),
		TextXAlignment = Enum.TextXAlignment.Left,
		BackgroundTransparency = 1,
		Text = "",
		Parent = CodeScrollingFrame,
	})
end

function SetCodeText(Code: string)
	for _, Label in CodeTextLabels do
		Label.Text = ""
	end

	local HighlightedCode = SyntaxHighlighter.Run(Code)
	local Lines = HighlightedCode:split("\n")
	local CurrentCharacterCount = 0
	local TextContents = {}
	local CurrentLabel = 1

	for _, Line in Lines do
		if CurrentCharacterCount + #Line > 200000 then
			CurrentLabel += 1
			CurrentCharacterCount = 0
			continue
		end

		CurrentCharacterCount += #Line
		if not TextContents[CurrentLabel] then
			TextContents[CurrentLabel] = {}
		end

		table.insert(TextContents[CurrentLabel], Line)
	end

	for Idx, Content in TextContents do
		if not CodeTextLabels[Idx] then
			CodeTextLabels[Idx] = Interface.New("TextLabel", {
				AutomaticSize = Enum.AutomaticSize.XY,
				TextSize = 16,
				TextColor3 = Color3.fromRGB(255, 255, 255),
				FontFace = Font.fromId(16658246179),
				TextXAlignment = Enum.TextXAlignment.Left,
				BackgroundTransparency = 1,
				Text = SyntaxHighlighter.Run("-- Loading..."),
				Parent = CodeScrollingFrame,
			})
		end

		CodeTextLabels[Idx].Text = table.concat(Content, "\n")
	end
end

local FunctionInfoUI, FunctionScrollingFrame = CreateTabContent()
CreateInfoTab("parentheses", "Function Info", FunctionInfoUI)

local FunctionInfoText = Interface.New("TextLabel", {
	AutomaticSize = Enum.AutomaticSize.XY,
	TextSize = 16,
	TextColor3 = Color3.fromRGB(255, 255, 255),
	FontFace = Font.fromId(16658246179),
	TextXAlignment = Enum.TextXAlignment.Left,
	BackgroundTransparency = 1,
	Text = "",
	Parent = FunctionScrollingFrame,
})

-- Search
local ResultInfo = {}
local CurrentResults = {}
local SelectedResult = -1

local SearchFrame = Interface.New("TextButton", {
	AnchorPoint = Vector2.new(0.5, 0.5),
	BackgroundColor3 = Color3.fromRGB(10, 10, 10),
	Position = UDim2.fromScale(0.5, 0.5),
	Size = UDim2.new(0.5, 0, 0.8, 0),
	Text = "",
	Visible = false,
	Parent = ModalBackground,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 6),
	},

	["UIStroke"] = {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = Color3.fromRGB(25, 25, 25),
		Thickness = 1,
	},
})

local SearchTop = Interface.New("Frame", {
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 0, 36),
	Parent = SearchFrame,

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 12),
		PaddingRight = UDim.new(0, 6),
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	},
})

local SearchBox = Interface.New("TextBox", {
	BackgroundTransparency = 1,
	Size = UDim2.new(1, -30, 1, 0),
	PlaceholderText = "Search for logs...",
	TextXAlignment = Enum.TextXAlignment.Left,
	PlaceholderColor3 = Color3.fromRGB(127, 127, 127),
	Text = "",
	TextSize = 17,
	Parent = SearchTop,
})

local SearchCloseButton = Interface.New("ImageButton", {
	Size = UDim2.fromScale(1, 1),
	Position = UDim2.fromScale(1, 0),
	AnchorPoint = Vector2.new(1, 0),
	SizeConstraint = Enum.SizeConstraint.RelativeYY,
	Parent = SearchTop,
})
local SearchCloseImage = Interface.NewIcon("x", {
	ImageTransparency = 0.5,
	Size = UDim2.fromOffset(22, 22),
	AnchorPoint = Vector2.new(0.5, 0.5),
	Position = UDim2.fromScale(0.5, 0.5),
	SizeConstraint = Enum.SizeConstraint.RelativeYY,

	Parent = SearchCloseButton,
})

ConnectCloseButton(SearchCloseButton, SearchCloseImage, SearchFrame)

Interface.New("Frame", {
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	Size = UDim2.new(1, 0, 0, 1),
	Position = UDim2.fromOffset(0, 36),
	Parent = SearchFrame,
})

local SearchFilterList = Interface.New("ScrollingFrame", {
	AutomaticCanvasSize = Enum.AutomaticSize.X,
	CanvasSize = UDim2.fromOffset(0, 0),
	ScrollBarThickness = 2,
	Position = UDim2.fromOffset(0, 37),
	Size = UDim2.new(1, 0, 0, 36),
	BackgroundTransparency = 1,
	Parent = SearchFrame,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 6),
	},

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	},
})

-- Search Filter
local ExcludeSearchClass = {}
local SearchFilterButtons = {}

local FilterAllButton = Interface.New("TextButton", {
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	Size = UDim2.fromScale(0, 1),
	AutomaticSize = Enum.AutomaticSize.X,
	TextSize = 15,
	Text = "All",
	Parent = SearchFilterList,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 4),
	},

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 10),
		PaddingRight = UDim.new(0, 10),
		PaddingTop = UDim.new(0, 0),
		PaddingBottom = UDim.new(0, 0),
	},
})

FilterAllButton.MouseButton1Click:Connect(function()
	ExcludeSearchClass = {}
	FilterAllButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	for _, Button in pairs(SearchFilterButtons) do
		Button.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
	UpdateSearch()
end)

for Order, ClassName in pairs(ClassOrder) do
	local ClassNameFilterButton = Interface.New("TextButton", {
		BackgroundColor3 = Color3.fromRGB(25, 25, 25),
		Size = UDim2.fromScale(0, 1),
		AutomaticSize = Enum.AutomaticSize.X,
		TextSize = 15,
		Text = "",
		LayoutOrder = Order,
		Parent = SearchFilterList,

		["UICorner"] = {
			CornerRadius = UDim.new(0, 4),
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 10),
			PaddingRight = UDim.new(0, 10),
			PaddingTop = UDim.new(0, 0),
			PaddingBottom = UDim.new(0, 0),
		},

		["UIListLayout"] = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 6),
		},

		["TextLabel"] = {
			LayoutOrder = 1,
			Text = ClassName,
			TextSize = 15,
			Size = UDim2.fromScale(0, 1),
			AutomaticSize = Enum.AutomaticSize.X,
		},
	})

	local ImageLabel = Interface.New("ImageLabel", {
		Image = Images[ClassName],
		Size = UDim2.new(1, -8, 1, -8),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		BackgroundTransparency = 1,
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.fromOffset(0.5, 0),
		Parent = ClassNameFilterButton,
	})

	ClassNameFilterButton.MouseButton1Click:Connect(function()
		local FoundIndex = table.find(ExcludeSearchClass, ClassName)
		if FoundIndex then
			table.remove(ExcludeSearchClass, FoundIndex)
			ClassNameFilterButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)

			if #ExcludeSearchClass == 0 then
				FilterAllButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
			end

			UpdateSearch()
			return
		end

		table.insert(ExcludeSearchClass, ClassName)
		ClassNameFilterButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		FilterAllButton.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		UpdateSearch()
	end)

	table.insert(SearchFilterButtons, ClassNameFilterButton)
end

Interface.New("Frame", {
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	Size = UDim2.new(1, 0, 0, 1),
	Position = UDim2.fromOffset(0, 72),
	Parent = SearchFrame,
})

local SearchResults = Interface.New("ScrollingFrame", {
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	BackgroundTransparency = 1,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	Position = UDim2.fromOffset(0, 73),
	ScrollBarThickness = 3,
	Size = UDim2.new(1, 0, 1, -73),

	Parent = SearchFrame,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 6),
		SortOrder = Enum.SortOrder.Name,
	},

	["UIPadding"] = {
		PaddingBottom = UDim.new(0, 6),
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
		PaddingTop = UDim.new(0, 6),
	},
})

local function CreateSearchResult(Instance: Instance, Type: string)
	local SearchResult = Interface.New("TextButton", {
		BackgroundColor3 = Color3.fromRGB(25, 25, 25),
		BackgroundTransparency = 1,
		Name = Instance.Name,
		Size = UDim2.new(1, 0, 0, 36),
		Text = "",

		["UICorner"] = {
			CornerRadius = UDim.new(0, 6),
		},

		["UIPadding"] = {
			PaddingBottom = UDim.new(0, 6),
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 6),
		},

		["TextLabel"] = {
			Position = UDim2.fromOffset(30, 0),
			Size = UDim2.new(1, -30, 1, 0),
			Text = Instance.Name,
			TextSize = 17,
			TextXAlignment = Enum.TextXAlignment.Left,
		},
	})
	do
		SearchResult.MouseEnter:Connect(function()
			local Index = table.find(CurrentResults, SearchResult)
			if Index then
				SelectResult(Index)
			end
		end)
		SearchResult.MouseButton1Click:Connect(function()
			local Index = table.find(CurrentResults, SearchResult)
			if Index then
				EnterResult(Index)
			end
		end)
	end

	local Image = Interface.New("ImageLabel", {
		BackgroundTransparency = 1,
		Image = Images[Instance.ClassName],
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		Parent = SearchResult,
	})

	local TypeLabel = Interface.New("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		Text = Type,
		TextSize = 15,
		TextTransparency = 0.5,
		TextXAlignment = Enum.TextXAlignment.Right,

		Parent = SearchResult,
	})

	return SearchResult
end

-- Topbar
local TopBar = Interface.New("Frame", {
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	Size = UDim2.new(1, 0, 0, 36),
	ZIndex = 0,
	MainUICorner,
	Parent = MainFrame,

	["TextLabel"] = {
		Text = "Cobalt",
		TextSize = 18,
		Position = UDim2.fromOffset(0, 1),
		Size = UDim2.new(1, 0, 1, -1),
	},

	["ImageLabel"] = {
		AnchorPoint = Vector2.new(0, 0.5),
		Position = UDim2.new(0, 6, 0.5, 0),
		Size = UDim2.new(1, -12, 1, -12),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		Image = CobaltLogo,
	},
})
Interface.HideCorner(TopBar, UDim2.fromScale(1, 0.5), Vector2.yAxis)

-- Topbar Buttons
local TopButtons = Interface.New("Frame", {
	BackgroundTransparency = 1,
	Size = UDim2.fromScale(1, 1),
	ZIndex = 2,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Right,
	},
	["UIPadding"] = {
		PaddingBottom = UDim.new(0, 4),
		PaddingLeft = UDim.new(0, 4),
		PaddingRight = UDim.new(0, 4),
		PaddingTop = UDim.new(0, 4),
	},

	Parent = TopBar,
})

local function CreateTopButton(IconName, Order: number, Callback: () -> ()?)
	local Button = Interface.New("ImageButton", {
		LayoutOrder = Order,
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,

		["UIPadding"] = {
			PaddingBottom = UDim.new(0, 3),
			PaddingLeft = UDim.new(0, 3),
			PaddingRight = UDim.new(0, 3),
			PaddingTop = UDim.new(0, 3),
		},

		Parent = TopButtons,
	})

	local Image = Interface.NewIcon(IconName, {
		ImageTransparency = 0.5,
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,

		Parent = Button,
	})

	Button.MouseEnter:Connect(function()
		wax.shared.TweenService
			:Create(Image, DefaultTweenInfo, {
				ImageTransparency = 0.25,
			})
			:Play()
	end)
	Button.MouseLeave:Connect(function()
		wax.shared.TweenService
			:Create(Image, DefaultTweenInfo, {
				ImageTransparency = 0.5,
			})
			:Play()
	end)
	if Callback then
		Button.MouseButton1Click:Connect(Callback)
	end

	return Button, Image
end

local function CreateTopSeperator(Order: number)
	Interface.New("ImageLabel", {
		LayoutOrder = Order,
		Size = UDim2.fromScale(1, 1),
		SizeConstraint = Enum.SizeConstraint.RelativeYY,
		BackgroundTransparency = 1,
		Parent = TopButtons,

		["Frame"] = {
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Color3.fromRGB(50, 50, 50),
			Size = UDim2.fromOffset(4, 4),
			Position = UDim2.fromScale(0.5, 0.5),

			["UICorner"] = {
				CornerRadius = UDim.new(1, 0),
			},
		},
	})
end

CreateTopButton("x", 5, wax.shared.Unload)
CreateTopButton("minus", 4, function()
	MainFrame.Visible = false
	ShowButton.Visible = true
end)
CreateTopSeperator(3)
CreateTopButton("settings", 2, function()
	OpenModal(SettingsFrame)
end)
CreateTopButton("blocks", 1, function()
	OpenModal(PluginsFrame)
end)
CreateTopButton("search", 0, function()
	OpenSearch()
end)

Drag.Setup(MainFrame, TopBar)
Drag.Setup(ShowButton, ShowButton)

-- Remote List
local LeftList = Interface.New("Frame", {
	BackgroundTransparency = 1,
	AnchorPoint = Vector2.yAxis,
	Size = UDim2.new(0, 240, 1, -36),
	Position = UDim2.fromScale(0, 1),
	Parent = MainFrame,

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	},
})

-- Tabs
local RemoteTabContainer = Interface.New("Frame", {
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	Size = UDim2.new(1, 0, 0, 30),
	Parent = LeftList,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 4),
	},

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
	},
})

-- Remote List
local RemoteListWrapper = Interface.New("Frame", {
	AnchorPoint = Vector2.yAxis,
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 1, -36),
	Parent = LeftList,

	["UICorner"] = {
		CornerRadius = UDim.new(0, 4),
	},

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalFlex = Enum.UIFlexAlignment.Fill,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
	},
})

local RemoteList = Interface.New("ScrollingFrame", {
	BackgroundTransparency = 1,
	Size = UDim2.fromScale(1, 1),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	ScrollBarThickness = 2,
	Parent = RemoteListWrapper,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 6),
	},

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 6),
		PaddingRight = UDim.new(0, 6),
		PaddingTop = UDim.new(0, 6),
		PaddingBottom = UDim.new(0, 6),
	},
})

local RemoteListLine = Interface.New("Frame", {
	AnchorPoint = Vector2.yAxis,
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	Position = UDim2.new(0, 240, 1, 0),
	Size = UDim2.new(0, 2, 1, -36),
	Parent = MainFrame,
})

local RemoteListResize = Interface.New("TextButton", {
	AnchorPoint = Vector2.new(0.5, 0),
	BackgroundTransparency = 1,
	Position = UDim2.fromScale(0.5, 0),
	Size = UDim2.new(1, 4, 1, 0),
	Text = "",

	Parent = RemoteListLine,
})
do
	RemoteListResize.MouseEnter:Connect(function()
		wax.shared.TweenService
			:Create(RemoteListLine, DefaultTweenInfo, {
				BackgroundColor3 = Color3.fromRGB(50, 50, 50),
			})
			:Play()
	end)
	RemoteListResize.MouseLeave:Connect(function()
		wax.shared.TweenService
			:Create(RemoteListLine, DefaultTweenInfo, {
				BackgroundColor3 = Color3.fromRGB(25, 25, 25),
			})
			:Play()
	end)
end

-- Main Remote thing
local LogsWrapper = Interface.New("Frame", {
	AnchorPoint = Vector2.one,
	BackgroundTransparency = 1,
	Position = UDim2.fromScale(1, 1),
	Size = UDim2.new(1, -242, 1, -36),
	Parent = MainFrame,

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 4),
		PaddingRight = UDim.new(0, 4),
		PaddingTop = UDim.new(0, 4),
		PaddingBottom = UDim.new(0, 6),
	},
})

LogsList = Interface.New("ScrollingFrame", {
	BackgroundTransparency = 1,
	Size = UDim2.new(1, 0, 1, -38),
	AutomaticCanvasSize = Enum.AutomaticSize.Y,
	CanvasSize = UDim2.new(0, 0, 0, 0),
	ScrollBarThickness = 2,
	Parent = LogsWrapper,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Padding = UDim.new(0, 6),
	},

	["UIPadding"] = {
		PaddingLeft = UDim.new(0, 2),
		PaddingRight = UDim.new(0, 6),
		PaddingTop = UDim.new(0, 2),
		PaddingBottom = UDim.new(0, 2),
	},
})

local LogsPagination = Interface.New("Frame", {
	AnchorPoint = Vector2.yAxis,
	BackgroundColor3 = Color3.fromRGB(25, 25, 25),
	BackgroundTransparency = 1,
	Position = UDim2.fromScale(0, 1),
	Size = UDim2.new(1, 0, 0, 32),
	Parent = LogsWrapper,

	["UIListLayout"] = {
		FillDirection = Enum.FillDirection.Horizontal,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		Padding = UDim.new(0, 6),
	},
})

-- Functions

function ShowTab(Tab)
	for _, Object in pairs(RemoteList:GetChildren()) do
		if Object.ClassName == "TextButton" then
			Object.Parent = nil
		end
	end

	if CurrentTab then
		wax.shared.TweenService
			:Create(CurrentTab.Instance, DefaultTweenInfo, {
				BackgroundTransparency = 1,
			})
			:Play()
	end

	CurrentTab = Tab
	wax.shared.TweenService
		:Create(CurrentTab.Instance, DefaultTweenInfo, {
			BackgroundTransparency = 0,
		})
		:Play()

	for _, Log in pairs(Tab.Logs) do
		if #Log.Calls == 0 then
			continue
		end

		if not Log.Button then
			local Button, Name, Calls = CreateLogButton(Log)
			Log:SetButton(Button, Name, Calls)
		end

		Log.Button.Name.Text = Log.Instance.Name
		Log.Button.Calls.Text = "x" .. #Log.Calls
		UpdateLogNameSize(Log)
		Log.Button.Instance.Parent = RemoteList
	end
end

function CleanLogsList()
	for _, Object in pairs(LogsList:GetChildren()) do
		if Object.ClassName == "TextButton" then
			Object:Destroy()
		end
	end
end

function ShowLog(Log)
	CleanLogsList()
	if not Log then
		return
	end

	if CurrentLog ~= Log then
		if CurrentLog then
			wax.shared.TweenService
				:Create(CurrentLog.Button.Instance, DefaultTweenInfo, {
					BackgroundTransparency = 1,
				})
				:Play()
		end

		CurrentLog = Log
		wax.shared.TweenService
			:Create(CurrentLog.Button.Instance, DefaultTweenInfo, {
				BackgroundTransparency = 0,
			})
			:Play()
	end

	local Page = CurrentPage[Log]
	if not Page then
		CurrentPage[Log] = 1
		Page = 1
	end

	PaginationHelper:Update(#Log.Calls)
	PaginationHelper:SetPage(Page)

	LogsList.CanvasPosition = Vector2.zero
	ShowPagination(Log)
	ShowCalls(Log, Page)
end

ShowCalls = function(Log, Page)
	local Start, End = PaginationHelper:GetIndexRanges(Page)

	for Index = Start, End do
		local Call
		if wax.shared.Settings.ShowExecutorLogs.Value then
			Call = Log.Calls[Index]
		else
			Call = Log.Calls[Log.GameCalls[Index]]
		end

		if not Call then
			break
		end

		local Data = setmetatable({
			Instance = Log.Instance,
			Type = Log.Type,
			Order = Index,
		}, {
			__index = Call,
		})

		CreateCallFrame(Data)
	end
end

function CreatePaginationEllipsis(Order: number, Visible: boolean)
	local Ellipsis = {
		Ellipsis = Interface.New("TextBox", {
			BackgroundColor3 = Color3.fromRGB(25, 25, 25),
			Size = UDim2.fromScale(1, 1),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			LayoutOrder = Order,
			PlaceholderText = "-",
			Text = "",
			TextSize = 15,
			RichText = false,
			Parent = Visible and LogsPagination or nil,

			["UICorner"] = {
				CornerRadius = UDim.new(0, 4),
			},
		}),
	}

	function Ellipsis:SetVisible(Visible: boolean)
		if not Visible then
			self.Ellipsis.Text = ""
		end
		self.Ellipsis.Parent = Visible and LogsPagination or nil
	end

	Ellipsis.Ellipsis.FocusLost:Connect(function(EnterPressed)
		if not EnterPressed then
			return
		end

		local Page = tonumber(Ellipsis.Ellipsis.Text)
		if not Page then
			wax.shared.Sonner.error("Invalid page number provided!")
			Ellipsis.Text = ""
			return
		end

		if math.floor(Page) ~= Page then
			wax.shared.Sonner.error("Invalid page number provided!")
			Ellipsis.Ellipsis.Text = ""
			return
		end

		if math.abs(Page) ~= Page or Page == 0 then
			wax.shared.Sonner.error("Invalid page number provided!")
			Ellipsis.Ellipsis.Text = ""
			return
		end

		local Success = pcall(function()
			PaginationHelper:SetPage(Page)
			CurrentPage[CurrentLog] = Page
			ShowLog(CurrentLog)
		end)

		if not Success then
			wax.shared.Sonner.error("Invalid page number provided!")
		end

		Ellipsis.Ellipsis.Text = ""
	end)

	return Ellipsis
end

function CreatePaginationButton(Order: number, Active: boolean, Visible: boolean)
	local ButtonData = {
		Button = Interface.New("TextButton", {
			BackgroundColor3 = Active and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(25, 25, 25),
			Size = UDim2.fromScale(1, 1),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
			Text = tostring(1),
			LayoutOrder = Order,
			TextSize = 15,
			Parent = Visible and LogsPagination or nil,

			["UICorner"] = {
				CornerRadius = UDim.new(0, 4),
			},
		}),
	}

	function ButtonData:SetActive(Active: boolean)
		self.Button.BackgroundColor3 = Active and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(25, 25, 25)
	end

	function ButtonData:SetText(Text: string)
		self.Button.Text = Text
	end

	function ButtonData:SetVisible(Visible: boolean)
		self.Button.Parent = Visible and LogsPagination or nil
	end

	ButtonData.Button.MouseButton1Click:Connect(function()
		local Page = tonumber(ButtonData.Button.Text)

		PaginationHelper:SetPage(Page)
		CurrentPage[CurrentLog] = Page
		ShowLog(CurrentLog)
	end)

	return ButtonData
end

local MaxButtons = (5 + PaginationHelper.SiblingCount * 2)
local PaginationElements = {
	Buttons = {},
	Ellipsis = {
		[2] = CreatePaginationEllipsis(1, false),
		[MaxButtons - 1] = CreatePaginationEllipsis(MaxButtons - 1, false),
	},
}

for i = 1, MaxButtons do
	table.insert(PaginationElements.Buttons, CreatePaginationButton(i, false, false))
end

ShowPagination = function(Log)
	local Pages = PaginationHelper:GetVisualInfo(nil, LogsList.AbsoluteSize.X)
	for Order, Info in pairs(Pages) do
		if Info == "none" then
			local Ellipsis = PaginationElements.Ellipsis[Order]
			if Ellipsis then
				Ellipsis:SetVisible(false)
			end

			local Button = PaginationElements.Buttons[Order]
			if Button then
				Button:SetVisible(false)
			end

			continue
		elseif Info == "ellipsis" then
			local Ellipsis = PaginationElements.Ellipsis[Order]
			if Ellipsis and Ellipsis.Parent == nil then
				Ellipsis:SetVisible(true)
			end

			local Button = PaginationElements.Buttons[Order]
			if Button then
				Button:SetVisible(false)
			end

			continue
		end

		local Ellipsis = PaginationElements.Ellipsis[Order]
		if Ellipsis then
			Ellipsis:SetVisible(false)
		end

		local Button = PaginationElements.Buttons[Order]
		if Button then
			Button:SetVisible(true)
			Button:SetText(tostring(Info))
			Button:SetActive(CurrentPage[Log] == Info)
		end
	end
end

function CreateRemoteTab(TabName: string, Active: boolean, Logs)
	local Button = Interface.New("TextButton", {
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BackgroundTransparency = Active and 0 or 1,
		Size = UDim2.fromScale(0, 1),
		TextSize = 15,
		Text = TabName,
		Parent = RemoteTabContainer,

		["UICorner"] = {
			CornerRadius = UDim.new(0, 4),
		},
	})

	local Tab = {
		Name = TabName,
		Logs = Logs,
		Instance = Button,
	}
	Tabs[TabName] = Tab

	if Active then
		CurrentTab = Tab
	end

	Button.MouseButton1Click:Connect(function()
		if CurrentTab == Tab then
			return
		end

		ShowTab(Tab)
	end)

	return Button
end

function CreateLogButton(Log): (TextButton, TextLabel, TextLabel)
	local Button = Interface.New("TextButton", {
		BackgroundColor3 = Color3.fromRGB(50, 50, 50),
		BackgroundTransparency = 1,
		LayoutOrder = Log.Index or 1,
		Size = UDim2.new(1, 0, 0, 30),
		Text = "",

		["ImageLabel"] = {
			Image = Images[Log.Instance.ClassName],
			Size = UDim2.fromScale(1, 1),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
		},

		["UICorner"] = {
			CornerRadius = UDim.new(0, 4),
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		},
	})

	local Text = Interface.New("TextLabel", {
		Position = UDim2.fromOffset(24, 0),
		Size = UDim2.new(1, -24, 1, 0),
		Text = "",
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextTruncate = Enum.TextTruncate.AtEnd,

		Parent = Button,
	})

	local Amount = Interface.New("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		Text = "",
		TextSize = 15,
		TextXAlignment = Enum.TextXAlignment.Right,

		Parent = Button,
	})

	Button.MouseButton1Click:Connect(function()
		if CurrentLog == Log then
			return
		end

		ShowLog(Log)
	end)

	local ContextMenuOptions = {
		{
			Text = function()
				if not Log then
					return "Ignore"
				end

				return Log.Ignored and "Unignore" or "Ignore"
			end,
			Icon = function()
				if not Log then
					return "eye"
				end

				return Log.Ignored and "eye" or "eye-off"
			end,
			Callback = function()
				Log:Ignore()

				wax.shared.Sonner.success(`{Log.Ignored and "Started" or "Stopped"} ignoring event`)
			end,
		},
		{
			Text = function()
				if not Log then
					return "Block"
				end

				return Log.Blocked and "Unblock" or "Block"
			end,
			Icon = function()
				if not Log then
					return "lock"
				end

				return Log.Blocked and "lock" or "lock-open"
			end,
			Callback = function()
				Log:Block()

				local BlockedRemoteList = wax.shared.Settings["BlockedRemotes"]
				if BlockedRemoteList then
					if Log.Blocked then
						BlockedRemoteList:AddToList(Log)
					else
						BlockedRemoteList:RemoveFromList(Log)
					end
				end

				wax.shared.Sonner.success(`{Log.Blocked and "Started" or "Stopped"} blocking event`)
			end,
		},
		{
			Text = "Clear Logs",
			Icon = "trash",
			Callback = function()
				if not Log then
					return
				end

				Log.Calls = {}
				CurrentPage[Log] = 1
				Log.Button.Calls.Text = "x" .. #Log.Calls
				UpdateLogNameSize(Log)

				if CurrentLog == Log then
					PaginationHelper:Update(#Log.Calls)
					PaginationHelper:SetPage(1)

					CleanLogsList()

					ShowPagination(Log)
					ShowCalls(Log, 1)
				end

				wax.shared.Sonner.success("Cleared events for this remote")

				if #Log.Calls == 0 then
					Log.Button.Instance.Parent = nil
				end
			end,
		},
	}

	local PluginManager = wax.shared.CobaltPluginManager
	if PluginManager and PluginManager.Registry.UIHooks.ContextMenus.RemoteList then
		for _, Option in PluginManager.Registry.UIHooks.ContextMenus.RemoteList do
			table.insert(ContextMenuOptions, {
				Text = Option.Text,
				Icon = Option.Icon,
				Callback = function()
					task.spawn(Option.Callback, Log)
				end
			})
		end
	end

	local LogContextMenu = CreateContextMenu(Button, ContextMenuOptions, true)

	Button.MouseButton2Click:Connect(LogContextMenu.Toggle)

	return Button, Text, Amount
end

function CreateArgHolder(Index: number, Value: any, Parent: GuiObject, IsBlockedCall: boolean?)
	local Holder = Interface.New("Frame", {
		BackgroundColor3 = if IsBlockedCall then Color3.fromRGB(58, 24, 24) else Color3.fromRGB(25, 25, 25),
		LayoutOrder = Index,
		Size = UDim2.new(1, 0, 0, 27),

		["UICorner"] = {
			CornerRadius = UDim.new(0, 4),
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		},

		Parent = Parent,
	})

	Interface.New("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		Text = Index,
		TextColor3 = if IsBlockedCall then Color3.fromRGB(255, 190, 190) else Color3.new(1, 1, 1),
		TextSize = 15,
		TextTransparency = 0.5,
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Top,

		Parent = Holder,
	})

	local TypeLabel = Interface.New("TextLabel", {
		Size = UDim2.fromScale(1, 1),
		Text = typeof(Value),
		TextColor3 = if IsBlockedCall then Color3.fromRGB(255, 190, 190) else Color3.new(1, 1, 1),
		TextSize = 15,
		TextTransparency = 0.5,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextYAlignment = Enum.TextYAlignment.Top,

		Parent = Holder,
	})
	local TypeX = wax.shared.GetTextBounds(TypeLabel.Text, TypeLabel.FontFace, TypeLabel.TextSize)

	local TextLabel = Interface.New("TextLabel", {
		Position = UDim2.fromOffset(18, 0),
		Size = UDim2.new(1, -(TypeX + 22), 1, 0),
		TextColor3 = if IsBlockedCall
			then Color3.fromRGB(255, 190, 190)
			else Color3.fromHex(SyntaxHighlighter.GetArgumentColor(Value)),
		Text = tostring(Helper.QuickSerializeArgument(Value)):gsub("<", "&lt;"):gsub(">", "&gt;"),
		RichText = true,
		TextSize = 15,
		TextWrapped = true,
		TextXAlignment = Enum.TextXAlignment.Left,

		Parent = Holder,
	})
	local _, TextY =
		wax.shared.GetTextBounds(TextLabel.Text, TextLabel.FontFace, TextLabel.TextSize, TextLabel.AbsoluteSize.X)
	Holder.Size = UDim2.new(1, 0, 0, TextY + 12)

	return Holder
end

function CreateCallFrame(CallInfo)
	if not wax.shared.Settings.ShowExecutorLogs.Value and not CallInfo.Origin then
		return
	end

	local IsBlockedCall = CallInfo.Blocked == true
	local CallFrame = Interface.New("TextButton", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = if IsBlockedCall then Color3.fromRGB(34, 18, 18) else Color3.fromRGB(25, 25, 25),
		LayoutOrder = CallInfo.Order,
		Size = UDim2.fromScale(1, 0),
		Text = "",

		["UIListLayout"] = {
			Padding = UDim.new(0, 6),
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		},

		MainUICorner,

		Parent = LogsList,
	})

	local HighlightStroke = Interface.New("UIStroke", {
		ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		Color = if IsBlockedCall then Color3.fromRGB(222, 82, 82) else Color3.fromRGB(75, 75, 75),
		Thickness = 2,
		Transparency = if IsBlockedCall then 0.5 else 1,

		Parent = CallFrame,
	})
	do
		local ContextMenuOptions = {
			{
				Text = "Copy Calling Code",
				Icon = "forward",
				Callback = function()
					local Code = CodeGen:BuildCallCode(CallInfo)
					local Success, Error = pcall(setclipboard, Code)

					if Success then
						wax.shared.Sonner.success("Copied code to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy code to clipboard", Error)
						warn("Failed to copy code to clipboard", Error)
					end
				end,
			},
			{
				Text = "Copy Intercept Code",
				Icon = "shield-alert",
				Callback = function()
					local Code = CodeGen:BuildHookCode(CallInfo, CurrentTab.Name)
					local Success, Error = pcall(setclipboard, Code)

					if Success then
						wax.shared.Sonner.success("Copied code to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy code to clipboard", Error)
						warn("Failed to copy code to clipboard", Error)
					end
				end,
			},
			{
				Text = "Copy Remote Path",
				Icon = "package-search",
				Callback = function()
					if not CallInfo then
						return
					end

					local Success, Error = pcall(setclipboard, CodeGen.GetFullPath(CallInfo.Instance, {
						VariableName = "Event",
						DisableNilParentHandler = false,
					}))

					if Success then
						wax.shared.Sonner.success("Copied remote path to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy remote path to clipboard")
						warn("Failed to copy remote path to clipboard", Error)
					end
				end,
			},
			{
				Text = "Copy Script Path",
				Icon = "file-search",
				Condition = function()
					return CallInfo and typeof(CallInfo.Origin) == "Instance"
				end,
				Callback = function()
					if not CallInfo then
						return
					end

					local Success, Error = pcall(setclipboard, CodeGen.GetFullPath(CallInfo.Origin))
					if Success then
						wax.shared.Sonner.success("Copied script path to clipboard")
					else
						wax.shared.Sonner.error("Failed to copy script path to clipboard")
						warn("Failed to copy script path to clipboard", Error)
					end
				end,
			},
			{
				Text = "Replay",
				Icon = "play",
				Callback = function()
					if not CallInfo then
						return
					end

					wax.shared.Sonner.promise(function()
						wax.shared.ReplayCallInfo(CallInfo, CurrentTab.Name)
					end, {
						loadingText = "Replaying event...",
						successText = "Replayed event successfully!",
						errorText = "Failed to replay event",
						time = 4.5,
					})
				end,
			},
		}

		local PluginManager = wax.shared.CobaltPluginManager
		if PluginManager and PluginManager.Registry.UIHooks.ContextMenus.CallList then
			for _, Option in PluginManager.Registry.UIHooks.ContextMenus.CallList do
				table.insert(ContextMenuOptions, {
					Text = Option.Text,
					Icon = Option.Icon,
					Callback = function()
						task.spawn(Option.Callback, CallInfo)
					end
				})
			end
		end

		local CallFrameContextMenu = CreateContextMenu(CallFrame, ContextMenuOptions, true)

		CallFrame.MouseEnter:Connect(function()
			wax.shared.TweenService
				:Create(HighlightStroke, DefaultTweenInfo, {
					Transparency = 0,
				})
				:Play()
		end)
		CallFrame.MouseLeave:Connect(function()
			wax.shared.TweenService
				:Create(HighlightStroke, DefaultTweenInfo, {
					Transparency = if IsBlockedCall then 0.5 else 1,
				})
				:Play()
		end)
		CallFrame.MouseButton1Click:Connect(function()
			OpenInfo(CallInfo)
		end)
		CallFrame.MouseButton2Click:Connect(CallFrameContextMenu.Open)
	end

	local ArgumentsFrame = Interface.New("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		BackgroundColor3 = if IsBlockedCall then Color3.fromRGB(24, 13, 13) else Color3.fromRGB(15, 15, 15),
		Size = UDim2.fromScale(1, 0),
		Visible = wax.shared.GetTableLength(CallInfo.Arguments) > 0,

		["UIListLayout"] = {
			Padding = UDim.new(0, 6),
		},

		["UIPadding"] = {
			PaddingLeft = UDim.new(0, 6),
			PaddingRight = UDim.new(0, 6),
			PaddingTop = UDim.new(0, 6),
			PaddingBottom = UDim.new(0, 6),
		},

		MainUICorner,

		Parent = CallFrame,
	})
	do
		for Index = 1, wax.shared.GetTableLength(CallInfo.Arguments) do
			if Index % 15 == 0 then
				task.wait()
			end

			local Value = CallInfo.Arguments[Index]
			CreateArgHolder(Index, Value, ArgumentsFrame, IsBlockedCall)
		end
	end

	local OriginText = CallInfo.IsExecutor and wax.shared.ExecutorName
		or CallInfo.Origin and CallInfo.Origin.Name
		or "Unknown"

	Interface.New("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 22),

		Interface.NewIcon(IsBlockedCall and "ban" or CallInfo.IsExecutor and "terminal" or "gamepad-2", {
			AnchorPoint = Vector2.yAxis,
			ImageColor3 = if IsBlockedCall then Color3.fromRGB(255, 151, 151) else Color3.new(1, 1, 1),
			ImageTransparency = 0.5,
			Position = UDim2.new(0, 2, 1, 0),
			Size = UDim2.fromOffset(22, 22),
			SizeConstraint = Enum.SizeConstraint.RelativeYY,
		}),

		Interface.New("TextLabel", {
			AnchorPoint = Vector2.yAxis,
			Position = UDim2.new(0, 30, 1, 0),
			Size = UDim2.new(0.5, -24, 0, 22),
			BackgroundTransparency = 1,
			Text = if IsBlockedCall then `{OriginText} (Blocked)` else OriginText,
			TextColor3 = if IsBlockedCall then Color3.fromRGB(255, 190, 190) else Color3.new(1, 1, 1),
			TextSize = 16,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextTransparency = 0.5,
		}),

		Interface.New("TextLabel", {
			AnchorPoint = Vector2.one,
			Position = UDim2.new(1, -2, 1, 0),
			Size = UDim2.new(0.5, -2, 0, 22),
			BackgroundTransparency = 1,
			Text = "Time: " .. os.date("%X", CallInfo.CreationTime),
			TextColor3 = if IsBlockedCall then Color3.fromRGB(255, 190, 190) else Color3.new(1, 1, 1),
			TextSize = 16,
			TextTransparency = 0.5,
			TextXAlignment = Enum.TextXAlignment.Right,
		}),

		Parent = CallFrame,
	})

	return CallFrame
end

-- UI Handling
CreateRemoteTab("Outgoing", true, wax.shared.Logs.Outgoing)
CreateRemoteTab("Incoming", false, wax.shared.Logs.Incoming)

-- Search Functions
function OpenSearch()
	OpenModal(SearchFrame)
	UpdateSearch()
	SearchBox:CaptureFocus()
end
function HandleSearch(Text, Type)
	for Instance, Log in pairs(wax.shared.Logs[Type]) do
		if not Log.SearchResult then
			local SearchResult = CreateSearchResult(Instance, Type)
			Log.SearchResult = SearchResult
			ResultInfo[SearchResult] = {
				Type = Type,
				Callback = function()
					ShowLog(Log)
				end,
			}
		end

		local LoweredName = string.lower(Instance.Name)
		if not LoweredName:match(Text) or table.find(ExcludeSearchClass, Instance.ClassName) then
			Log.SearchResult.Parent = nil
			continue
		end

		Log.SearchResult.BackgroundTransparency = 1
		Log.SearchResult.Parent = SearchResults
		table.insert(CurrentResults, Log.SearchResult)
	end
end

function SelectResult(NewResult, UpdateCanvasPosition)
	if SelectedResult > 0 and CurrentResults[SelectedResult] then
		CurrentResults[SelectedResult].BackgroundTransparency = 1
	end
	if NewResult == -1 or #CurrentResults == 0 then
		SelectedResult = -1
		return
	end

	SelectedResult = math.clamp(NewResult, 1, #CurrentResults)
	CurrentResults[SelectedResult].BackgroundTransparency = 0

	if UpdateCanvasPosition then
		local ScrollSize = SearchResults.AbsoluteSize.Y

		local SelectedMin = CurrentResults[SelectedResult].AbsolutePosition.Y - SearchResults.AbsolutePosition.Y
		local SelectedMax = SelectedMin + CurrentResults[SelectedResult].AbsoluteSize.Y

		if SelectedMin < 0 then
			SearchResults.CanvasPosition += Vector2.new(0, SelectedMin - 6)
		elseif SelectedMax > ScrollSize then
			SearchResults.CanvasPosition += Vector2.new(0, SelectedMax - ScrollSize + 6)
		end
	end
end
function EnterResult(ResultIndex)
	local Info = ResultInfo[CurrentResults[SelectedResult]]
	if not Info then
		CloseModal()
		return
	end

	pcall(ShowTab, Tabs[Info.Type])
	pcall(Info.Callback)

	CloseModal()
end
function HandleResults()
	if #CurrentResults == 0 then
		return
	end

	table.sort(CurrentResults, function(a, b)
		return a.AbsolutePosition.Y < b.AbsolutePosition.Y
	end)

	SelectResult(1, true)
end
function UpdateSearch()
	table.clear(CurrentResults)
	SelectResult(-1)

	local Text = string.lower(SearchBox.Text)
	HandleSearch(Text, "Outgoing")
	HandleSearch(Text, "Incoming")

	HandleResults()
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(UpdateSearch)

-- Call Functions
function OpenInfo(CallInfo)
	if wax.shared.CobaltPluginManager and wax.shared.CobaltPluginManager.Initialized then
		for _, Interceptor in wax.shared.CobaltPluginManager.Registry.UIHooks.RemoteInfo.Intercept do
			local Success, Result = pcall(Interceptor, CallInfo)
			
			if Success and Result == false then
				return
			end
		end
	end

	InfoTitle.Text = if CallInfo.Blocked then `{CallInfo.Instance.Name} (Blocked)` else CallInfo.Instance.Name
	InfoIcon.Image = Images[CallInfo.Instance.ClassName]

	CurrentInfo = CallInfo

	SetCodeText(CodeGen:BuildCallCode(CallInfo))

	xpcall(function()
		FunctionInfoText.Text = CodeGen:BuildFunctionInfo(CallInfo)
	end, function(Error)
		FunctionInfoText.Text =
			`Error while fetching function data.\nCalling Function: {CallInfo.Function} (type: {typeof(
				CallInfo.Function
			)})\n\nError: {Error}`
	end)
	do
		for _, Object in pairs(ArgumentsInfoFrame:GetChildren()) do
			if Object.ClassName ~= "Frame" then
				continue
			end
			Object:Destroy()
		end

		for Index = 1, wax.shared.GetTableLength(CallInfo.Arguments) do
			if Index % 25 == 0 then
				task.wait()
			end

			local Value = CallInfo.Arguments[Index]
			CreateArgHolder(Index, Value, ArgumentsInfoFrame)
		end
	end

	if wax.shared.CobaltPluginManager and wax.shared.CobaltPluginManager.Initialized then
		for _, Plugin in wax.shared.CobaltPluginManager.Registry.UIHooks.RemoteInfo.Open do
			task.spawn(Plugin, CallInfo)
		end
	end

	for TabName, Tab in InfoModalTab do
		if TabName == "Arguments" then
			continue
		end

		local OldTabButton = Tab.TabButton
		local OldTabContent = Tab.TabContents

		OldTabButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
		OldTabButton.Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)

		OldTabContent.Visible = false
	end

	CurrentInfoTab = "Arguments"
	UpdateFooterButtons()
	
	if InfoModalTab["Arguments"] then
		local TabButton = InfoModalTab["Arguments"].TabButton
		local TabContent = InfoModalTab["Arguments"].TabContents

		TabButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		TabButton.Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		TabContent.Visible = true
	end

	if CurrentContext then
		CurrentContext:Close()
	end

	OpenModal(InfoFrame)
end

Drag.Setup(RemoteListLine, RemoteListResize, function(Info, Input: InputObject)
	local Delta = (Input.Position - Info.StartPosition) / GetDPIScale() 
	local FramePosition: UDim2 = Info.FramePosition
	local Offset = math.clamp(FramePosition.X.Offset + Delta.X, 120, (MainFrame.AbsoluteSize.X - 2) / 2)

	Info.Frame.Position = UDim2.new(FramePosition.X.Scale, Offset, FramePosition.Y.Scale, FramePosition.Y.Offset)

	LeftList.Size = UDim2.new(0, Offset, 1, -36)
	LogsWrapper.Size = UDim2.new(1, -(Offset + 2), 1, -36)
end)

wax.shared.Connect(wax.shared.Communicator.Event:Connect(function(Instance, Type, CallIndex)
	if not (CurrentTab and CurrentTab.Name == Type) then
		return
	end

	local Log = wax.shared.Logs[Type][Instance]
	if not Log then
		return
	end

	if #Log.Calls == 0 then
		return
	end

	local CallInfo = Log.Calls[CallIndex]

	local Page = CurrentPage[Log]
	if not Page then
		Page = 1
		CurrentPage[Log] = Page
	end

	if not Log.Button then
		local Button, Name, Calls = CreateLogButton(Log)
		Log:SetButton(Button, Name, Calls)
	end

	Log.Button.Name.Text = Log.Instance.Name
	UpdateLogNameSize(Log)
	Log.Button.Calls.Text = "x" .. #Log.Calls
	Log.Button.Instance.Parent = RemoteList

	if CurrentLog == Log then
		PaginationHelper:Update(#Log.Calls)

		local Start, End = PaginationHelper:GetIndexRanges(Page)
		if not wax.shared.Settings.ShowExecutorLogs.Value then
			CallIndex = Log.GameCalls[CallIndex]
			if not CallIndex then
				return
			end
		end

		if CallIndex < Start or CallIndex > End then
			ShowPagination(Log)
			return
		end

		local Data = setmetatable({
			Instance = Instance,
			Type = Type,
			Order = CallIndex,
		}, {
			__index = CallInfo,
		})

		CreateCallFrame(Data)
	end
end))

wax.shared.Connect(wax.shared.UserInputService.InputBegan:Connect(function(Input: InputObject)
	if Helper.IsClickInput(Input) then
		if
			CurrentContext
			and not (
				Helper.IsMouseOverFrame(ContextMenu, Input.Position)
				or Helper.IsMouseOverFrame(CurrentContext.Parent, Input.Position)
			)
		then
			CurrentContext:Close()
		end
	elseif Input.KeyCode == Enum.KeyCode.K and wax.shared.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
		OpenSearch()
	elseif OpenedModal == SearchFrame then
		if Input.KeyCode == Enum.KeyCode.Escape then
			CloseModal()
		elseif Input.KeyCode == Enum.KeyCode.Return then
			EnterResult(SelectedResult)
		elseif Input.KeyCode == Enum.KeyCode.Up then
			SelectResult(SelectedResult - 1, true)
		elseif Input.KeyCode == Enum.KeyCode.Down then
			SelectResult(SelectedResult + 1, true)
		end
	end
end))

return {}

end)() end,
    [14] = function()local wax,script,require=ImportGlobals(14)local ImportGlobals return (function(...)local LuaEncode = require(script.Parent.Parent.Utils.Serializer.LuaEncode)
local CodeGen = require(script.Parent.Parent.Utils.CodeGen.Generator)

local Hooks = script.Parent.Hooks

-- Main Thread Hooks
for _, Hook in Hooks.Default:GetChildren() do
	task.spawn(require, Hook)
end

getgenv().CobaltInitialized = true

-- Actors use a different lua vm
-- This means that our main thread metatable hooks dont apply in the actor's vm
-- So we need to set up the hooks again in the actor lua vm in order to log everything
local ActorsUtils = script.Parent.Actors

wax.shared.ActorsEnabled = (
	wax.shared.ExecutorSupport["run_on_actor"].IsWorking
	and wax.shared.ExecutorSupport["getactors"].IsWorking
	and wax.shared.ExecutorSupport["create_comm_channel"].IsWorking
)

if wax.shared.ActorsEnabled then
	local ActorEnvironmentCode = ActorsUtils.Environment.Value

	local CommunicationChannelID, Channel = create_comm_channel()
	wax.shared.ActorCommunicator = Channel

	local AlternativeEnabled = wax.shared.SaveManager:GetState("UseAlternativeHooks", false)

	local IgnorePlayerModule = wax.shared.SaveManager:GetState("IgnorePlayerModule", true)
	local LogBlockedRemotes = wax.shared.SaveManager:GetState("LogBlockedRemotes", false)
	local IngoredRemotesDropdown = wax.shared.SaveManager:GetState("IgnoredRemotesDropdown", {
		["BindableEvent"] = true,
		["BindableFunction"] = true,
	})

	local ActorData = LuaEncode({
		Token = wax.shared.CobaltVerificationToken,

		IgnorePlayerModule = IgnorePlayerModule,
		LogBlockedRemotes = LogBlockedRemotes,
		IgnoredRemotesDropdown = IngoredRemotesDropdown,
		UseAlternativeHooks = AlternativeEnabled,

		ExecutorSupport = wax.shared.ExecutorSupport,
	})

	ActorEnvironmentCode = ActorEnvironmentCode:gsub("COBALT_ACTOR_DATA", ActorData)

	-- Actor Logs Sync Layer
	local function ReconstructTable(Info, CyclicRefs)
		local Reconstructed = {}

		for Key, Value in Info do
			if type(Value) == "table" then
				if Value["__Function"] and Value["Validation"] == wax.shared.CobaltVerificationToken then
					local FunctionData = table.clone(Value)
					FunctionData["__Function"] = nil
					FunctionData["Validation"] = nil

					Reconstructed[Key] = FunctionData
					continue
				end

				-- Check for Cobalt Created Object
				if not Value["__CyclicRef"] then
					Reconstructed[Key] = ReconstructTable(Value, CyclicRefs)
					continue
				end

				local CyclicId = Value["__Id"]

				if not CyclicRefs[CyclicId] then
					warn("CyclicRef not found: " .. CyclicId)
					continue
				end

				Reconstructed[Key] = CyclicRefs[CyclicId]
				continue
			end

			Reconstructed[Key] = Value
		end

		return Reconstructed
	end

	local function ReconstructPacked(Packed)
		if not Packed or not Packed.Data then
			return Packed
		end

		local PackedN, PackedData = Packed.n, Packed.Data
		PackedData.n = PackedN
		return PackedData
	end

	wax.shared.Connect(Channel.Event:Connect(function(EventType, ...)
		local ShouldLogActors = wax.shared.SaveManager:GetState("LogActors", true)

		if not ShouldLogActors then
			return
		end

		if EventType ~= "ActorCall" then
			return
		end

		local Instance, Type, RawInfo, CyclicRefs = ...
		if Instance == Channel or Instance == wax.shared.Communicator then
			return
		end

		local Method = wax.shared.FunctionForClasses[Type][Instance.ClassName]
		local Log = wax.shared.Logs[Type][Instance]

		if not Log then
			Log = wax.shared.NewLog(Instance, Type, Method, RawInfo.Origin)
		end

		if Log.Blocked then
			if not wax.shared.SaveManager:GetState("LogBlockedRemotes", false) then
				return
			end

			local ReconstructedInfo = ReconstructTable(RawInfo, CyclicRefs)
			ReconstructedInfo.Blocked = true

			--// Reconstruct Packed Arguments (BindableEvents omit ["n"] for unknown reason) \\--
			ReconstructedInfo.Arguments = ReconstructPacked(ReconstructedInfo.Arguments)
			ReconstructedInfo.OriginalInvokeArgs = ReconstructPacked(ReconstructedInfo.OriginalInvokeArgs)

			Log:Call(ReconstructedInfo)
			wax.shared.Communicator:Fire(Log.Instance, Type, #Log.Calls)
		elseif not Log.Ignored then
			local ReconstructedInfo = ReconstructTable(RawInfo, CyclicRefs)

			--// Reconstruct Packed Arguments (BindableEvents omit ["n"] for unknown reason) \\--
			ReconstructedInfo.Arguments = ReconstructPacked(ReconstructedInfo.Arguments)
			ReconstructedInfo.OriginalInvokeArgs = ReconstructPacked(ReconstructedInfo.OriginalInvokeArgs)

			Log:Call(ReconstructedInfo)
			wax.shared.Communicator:Fire(Log.Instance, Type, #Log.Calls)
		end
	end))

	-- Actor Hooking Code Generation
	local CodeToRun = ActorEnvironmentCode

	for _, ActorHook in Hooks.Actors:GetChildren() :: { StringValue } do
		CodeToRun ..= table.concat({
			"task.spawn(function()",
			CodeGen:IndentCode(ActorHook.Value, 1),
			"end)",
		}, "\n") .. "\n\n"
	end

	CodeToRun ..= table.concat({
		"task.spawn(function()",
		CodeGen:IndentCode(ActorsUtils.Unload.Value, 1),
		"end)",
	}, "\n")

	-- Actual Hooking Logic
	-- The hooking code wont run again if cobalt is already initialized in that Actor (to address deleted actors aka LuaStateProxy stuff)

	-- `HookActor` is to address Volcano returning non initialized actors inside their `getactors` function.
	-- God this code is so ass 🥹
	local function HookActor(TargetActor: Actor)
		local Hooked = false
		local Attempts = 0

		repeat
			Hooked, _ = pcall(run_on_actor,
				TargetActor,
				CodeToRun,
				CommunicationChannelID,
				TargetActor
			)

			Attempts += 1
			task.wait(0.25)
		until Hooked or Attempts > 10
	end

	for _, Category in {getactors(), getdeletedactors and getdeletedactors() or {} } do
		for _, TargetActor in Category do
			task.spawn(HookActor, TargetActor)
		end
	end

	local ActorHookConnection
	local function HandleInstance(Instance)
		if typeof(Instance) == "Instance" and not Instance:IsA("Actor") then
			return
		end

		HookActor(Instance)
	end

	if on_actor_state_created then
		ActorHookConnection = on_actor_state_created:Connect(HandleInstance)
	else
		ActorHookConnection = game.DescendantAdded:Connect(HandleInstance)
	end

	wax.shared.Connect(ActorHookConnection)
end

return {}

end)() end,
    [27] = function()local wax,script,require=ImportGlobals(27)local ImportGlobals return (function(...)local Hooking = {}

local AlternativeEnabled = wax.shared.SaveManager:GetState("UseAlternativeHooks", false)
wax.shared.AlternativeEnabled = AlternativeEnabled

Hooking.HookFunction = function(Original, Replacement)
	if wax.shared.ExecutorSupport["oth"].IsWorking and iscclosure(Original) and islclosure(Replacement) then
		return oth.hook(Original, Replacement)
	end

	if islclosure(Replacement) then
		Replacement = wax.shared.newcclosure(Replacement)
	end

	if not wax.shared.ExecutorSupport["hookfunction"].IsWorking then
		return Original
	end

	return hookfunction(Original, Replacement)
end
Hooking.HookMetaMethod = function(object, method, hook)
	local Metatable = wax.shared.getrawmetatable(object)
	local originalMethod = rawget(Metatable, method)

	assert(typeof(originalMethod) == "function", `{method} is not a function in the metatable of {object}`)

	if wax.shared.ExecutorSupport["oth"].IsWorking then
		return oth.hook(originalMethod, hook)
	end

	if islclosure(hook) then
		hook = wax.shared.newcclosure(hook)
	end

	if
		AlternativeEnabled
		or (
			not wax.shared.ExecutorSupport["hookmetamethod"].IsWorking
			and wax.shared.ExecutorSupport["getrawmetatable"].IsWorking
		)
	then
		setreadonly(Metatable, false)
		rawset(Metatable, method, hook)
		setreadonly(Metatable, true)

		return originalMethod
	end

	if not wax.shared.ExecutorSupport["hookmetamethod"].IsWorking then
		if method == "__index" then
			local _, Metamethod = xpcall(function()
				return object[tostring(math.random())]
			end, function(err)
				return debug.info(2, "f")
			end)

			return Metamethod
		elseif method == "__newindex" then
			local _, Metamethod = xpcall(function()
				object[tostring(math.random())] = true
			end, function(err)
				return debug.info(2, "f")
			end)

			return Metamethod
		elseif method == "__namecall" then
			local _, Metamethod = xpcall(function()
				object:Mustard()
			end, function(err)
				return debug.info(2, "f")
			end)

			return Metamethod
		end

		return nil
	end

	return hookmetamethod(object, method, hook)
end

return Hooking

end)() end
} -- [RefId] = Closure

-- Holds the actual DOM data
local ObjectTree = {
    {
        1,
        4,
        {
            "cobalt"
        },
        {
            {
                46,
                2,
                {
                    "Window"
                }
            },
            {
                2,
                2,
                {
                    "ExecutorSupport"
                }
            },
            {
                3,
                1,
                {
                    "Spy"
                },
                {
                    {
                        4,
                        1,
                        {
                            "Actors"
                        },
                        {
                            {
                                6,
                                5,
                                {
                                    "Unload",
                                    Value = "local getrawmetatable = getrawmetatable or debug.getmetatable\n\nwax.shared.Communicator.Event:Connect(function(Type, ...)\n\tif Type ~= \"Unload\" then\n\t\treturn\n\tend\n\n\tlocal gameMetatable = getrawmetatable(game)\n\n\tif wax.shared.ExecutorSupport[\"oth\"].IsWorking then\n\t\tpcall(oth.unhook, gameMetatable.__namecall)\n\t\tpcall(oth.unhook, gameMetatable.__newindex)\n\telse\n\t\tif wax.shared.ExecutorSupport[\"restorefunction\"].IsWorking and not wax.shared.AlternativeEnabled then\n\t\t\tpcall(restorefunction, gameMetatable.__namecall)\n\t\t\tpcall(restorefunction, gameMetatable.__newindex)\n\t\telse\n\t\t\twax.shared.Hooking.HookMetaMethod(game, \"__namecall\", wax.shared.NamecallHook)\n\t\t\twax.shared.Hooking.HookMetaMethod(game, \"__newindex\", wax.shared.NewIndexHook)\n\t\tend\n\tend\n\n\tfor Function, Original in pairs(wax.shared.Hooks) do\n\t\tif wax.shared.ExecutorSupport[\"oth\"].IsWorking then\n\t\t\ttask.spawn(pcall, oth.unhook, Function)\n\t\telseif wax.shared.ExecutorSupport[\"restorefunction\"].IsWorking then\n\t\t\ttask.spawn(pcall, wax.shared.restorefunction, Function)\n\t\telse\n\t\t\tpcall(wax.shared.Hooking.HookFunction, Function, Original)\n\t\tend\n\tend\n\n\ttask.defer(function()\n\t\tgetgenv().CobaltInitialized = false\n\tend)\nend)\n"
                                }
                            },
                            {
                                5,
                                5,
                                {
                                    "Environment",
                                    Value = "--[[\n\n    Wax Environment replicated for actor env\n\n]]\n\nif getgenv().CobaltInitialized == true then\n\treturn\nend\n\ngetgenv().CobaltInitialized = true\n\ntype ActorData = {\n\tToken: string,\n\n\tIgnorePlayerModule: boolean,\n\tLogBlockedRemotes: boolean,\n\tUseAlternativeHooks: boolean,\n\tIgnoredRemotesDropdown: { [string]: boolean },\n\n\tExecutorSupport: { [string]: { IsWorking: boolean } },\n}\n\nlocal Data: ActorData = COBALT_ACTOR_DATA\n\nlocal ChannelId, CurrentActor = ...\nlocal RelayChannel = get_comm_channel(ChannelId)\n\nlocal wax = { shared = {} }\n\nwax.shared.ExecutorSupport = Data.ExecutorSupport\n\nfor _, Service in pairs({\n\t\"Players\",\n\t\"HttpService\",\n}) do\n\twax.shared[Service] = cloneref(game:GetService(Service))\nend\n\nwax.shared.Connections = {}\n\nwax.shared.Connect = function(Connection)\n\ttable.insert(wax.shared.Connections, Connection)\n\treturn Connection\nend\n\nwax.shared.Disconnect = function(Connection)\n\tConnection:Disconnect()\n\n\tlocal Index = table.find(wax.shared.Connections, Connection)\n\tif Index then\n\t\ttable.remove(wax.shared.Connections, Index)\n\tend\n\n\treturn true\nend\n\nwax.shared.LocalPlayer = wax.shared.Players.LocalPlayer\nlocal ContendingPlayerScripts = cloneref(wax.shared.LocalPlayer:QueryDescendants(\"PlayerScripts\")[1] or wax.shared.LocalPlayer)\nif ContendingPlayerScripts:IsA(\"PlayerScripts\") then\n\twax.shared.PlayerScripts = ContendingPlayerScripts\nelse\n\twax.shared.PlayerScripts = nil\n\n\tlocal ChildAddedConnection\n\tChildAddedConnection = wax.shared.Connect(wax.shared.LocalPlayer.ChildAdded:Connect(function(Child)\n\t\tif Child:IsA(\"PlayerScripts\") then\n\t\t\twax.shared.PlayerScripts = cloneref(Child)\n\t\t\twax.shared.Disconnect(ChildAddedConnection)\n\t\tend\n\tend))\nend\n\nwax.shared.ExecutorName = string.split(identifyexecutor(), \" \")[1]\n\nwax.shared.newcclosure = wax.shared.ExecutorName == \"AWP\"\n\t\tand function(f)\n\t\t\tlocal env = getfenv(f)\n\t\t\tlocal x = setmetatable({\n\t\t\t\t__F = f,\n\t\t\t}, {\n\t\t\t\t__index = env,\n\t\t\t\t__newindex = env,\n\t\t\t})\n\n\t\t\tlocal nf = function(...)\n\t\t\t\treturn __F(...)\n\t\t\tend\n\t\t\tsetfenv(nf, x) -- set func env (env of nf gets deoptimized)\n\t\t\treturn newcclosure(nf)\n\t\tend\n\tor newcclosure\n\nwax.shared.getrawmetatable = wax.shared.ExecutorSupport[\"getrawmetatable\"].IsWorking\n\t\tand (getrawmetatable or debug.getmetatable)\n\tor function()\n\t\treturn setmetatable({}, {\n\t\t\t__index = function()\n\t\t\t\treturn function() end\n\t\t\tend,\n\t\t})\n\tend\n\nwax.shared.restorefunction = function(Function: (...any) -> ...any, Silent: boolean?)\n\tlocal Original = wax.shared.Hooks[Function]\n\n\tif Silent and not Original then\n\t\treturn\n\tend\n\n\tassert(Original, \"Function not hooked\")\n\n\tif restorefunction and isfunctionhooked(Function) then\n\t\trestorefunction(Function)\n\telse\n\t\twax.shared.Hooking.HookFunction(Function, Original)\n\tend\n\n\twax.shared.Hooks[Function] = nil\nend\n\nlocal Hooking = {}\n\nwax.shared.AlternativeEnabled = Data.UseAlternativeHooks\n\nHooking.HookFunction = function(Original, Replacement)\n\tif wax.shared.ExecutorSupport[\"oth\"].IsWorking and iscclosure(Original) and islclosure(Replacement) then\n\t\treturn oth.hook(Original, Replacement)\n\tend\n\n\tif islclosure(Replacement) then\n\t\tReplacement = wax.shared.newcclosure(Replacement)\n\tend\n\n\tif not wax.shared.ExecutorSupport[\"hookfunction\"].IsWorking then\n\t\treturn Original\n\tend\n\n\treturn hookfunction(Original, Replacement)\nend\n\nHooking.HookMetaMethod = function(object, method, hook)\n\tlocal Metatable = wax.shared.getrawmetatable(object)\n\tlocal originalMethod = rawget(Metatable, method)\n\n\tif wax.shared.ExecutorSupport[\"oth\"].IsWorking then\n\t\treturn oth.hook(originalMethod, hook)\n\tend\n\n\tif islclosure(hook) then\n\t\thook = wax.shared.newcclosure(hook)\n\tend\n\n\tif\n\t\tData.UseAlternativeHooks\n\t\tor (\n\t\t\tnot wax.shared.ExecutorSupport[\"hookmetamethod\"].IsWorking\n\t\t\tand wax.shared.ExecutorSupport[\"getrawmetatable\"].IsWorking\n\t\t)\n\tthen\n\t\tsetreadonly(Metatable, false)\n\t\trawset(Metatable, method, hook)\n\t\tsetreadonly(Metatable, true)\n\n\t\treturn originalMethod\n\tend\n\n\tif not wax.shared.ExecutorSupport[\"hookmetamethod\"].IsWorking then\n\t\tif method == \"__index\" then\n\t\t\tlocal _, Metamethod = xpcall(function()\n\t\t\t\treturn object[tostring(math.random())]\n\t\t\tend, function(err)\n\t\t\t\treturn debug.info(2, \"f\")\n\t\t\tend)\n\n\t\t\treturn Metamethod\n\t\telseif method == \"__newindex\" then\n\t\t\tlocal _, Metamethod = xpcall(function()\n\t\t\t\tobject[tostring(math.random())] = true\n\t\t\tend, function(err)\n\t\t\t\treturn debug.info(2, \"f\")\n\t\t\tend)\n\n\t\t\treturn Metamethod\n\t\telseif method == \"__namecall\" then\n\t\t\tlocal _, Metamethod = xpcall(function()\n\t\t\t\tobject:Mustard()\n\t\t\tend, function(err)\n\t\t\t\treturn debug.info(2, \"f\")\n\t\t\tend)\n\n\t\t\treturn Metamethod\n\t\tend\n\n\t\treturn nil\n\tend\n\n\treturn hookmetamethod(object, method, hook)\nend\n\nwax.shared.Hooking = Hooking\n\nwax.shared.Hooks = {}\nwax.shared.Settings = {\n\tIgnorePlayerModule = { Value = Data.IgnorePlayerModule },\n\tLogBlockedRemotes = { Value = Data.LogBlockedRemotes },\n\tIgnoredRemotesDropdown = { Value = Data.IgnoredRemotesDropdown },\n}\n\nwax.shared.IsPlayerModule = function(Origin: LocalScript | ModuleScript, Instance: Instance): boolean\n\tif Instance and Instance.ClassName ~= \"BindableEvent\" then\n\t\treturn false\n\tend\n\n\tif not Origin or typeof(Origin) ~= \"Instance\" or not Origin.IsA(Origin, \"LuaSourceContainer\") then\n\t\treturn false\n\tend\n\n\tlocal PlayerModule = Origin and Origin.FindFirstAncestor(Origin, \"PlayerModule\") or nil\n\tif not PlayerModule then\n\t\treturn false\n\tend\n\n\tif PlayerModule.Parent == nil then\n\t\treturn true\n\tend\n\n\tif wax.shared.PlayerScripts then\n\t\treturn compareinstances(PlayerModule.Parent, wax.shared.PlayerScripts)\n\tend\n\n\treturn false\nend\nwax.shared.ShouldIgnore = function(Instance, Origin)\n\treturn wax.shared.Settings.IgnoredRemotesDropdown.Value[Instance.ClassName] == true\n\t\tor (wax.shared.Settings.IgnorePlayerModule.Value and wax.shared.IsPlayerModule(Origin, Instance))\nend\n\nlocal OnUnload\n\nlocal RelayConnection\nRelayConnection = RelayChannel.Event:Connect(function(Type, ...)\n\tif Type == \"Unload\" then\n\t\tRelayConnection:Disconnect()\n\t\twax.shared.Unloaded = true\n\t\tfor _, Connection in wax.shared.Connections do\n\t\t\twax.shared.Disconnect(Connection)\n\t\tend\n\n\t\tif OnUnload then\n\t\t\tOnUnload()\n\t\tend\n\telseif Type == \"MainBlock\" then\n\t\tlocal Instance, EventType = ...\n\t\tlocal Log = wax.shared.Logs[EventType][Instance]\n\t\tif Log then\n\t\t\tLog:Block()\n\t\tend\n\telseif Type == \"MainIgnore\" then\n\t\tlocal Instance, EventType = ...\n\t\tlocal Log = wax.shared.Logs[EventType][Instance]\n\t\tif Log then\n\t\t\tLog:Ignore()\n\t\tend\n\telseif Type == \"MainSettingsSync\" then\n\t\tlocal Setting, Value = ...\n\t\tif wax.shared.Settings[Setting] then\n\t\t\twax.shared.Settings[Setting].Value = Value\n\t\tend\n\tend\nend)\n\nwax.shared.Unloaded = false\nwax.shared.Communicator = RelayChannel\n\nwax.shared.Log = {}\ndo\n\tlocal Log = wax.shared.Log\n\tLog.__index = Log\n\n\tfunction Log.new(Instance, Type, Method, Index, CallingScript)\n\t\tlocal NewLog = setmetatable({\n\t\t\tInstance = Instance,\n\t\t\tType = Type,\n\t\t\tMethod = Method,\n\t\t\tIndex = Index,\n\t\t\tCalls = {},\n\t\t\tIgnored = false,\n\t\t\tBlocked = false,\n\t\t}, Log)\n\n\t\treturn NewLog\n\tend\n\n\tlocal FunctionToMetatadata\n\n\tlocal GenerateUUID = wax.shared.HttpService.GenerateGUID\n\tlocal function GenerateId()\n\t\treturn GenerateUUID(wax.shared.HttpService, false)\n\tend\n\n\tlocal function CreateTraversalState(Refs)\n\t\treturn {\n\t\t\tCyclicRefs = Refs or {},\n\t\t\tTableIds = setmetatable({}, { __mode = \"k\" }),\n\t\t\tFunctions = setmetatable({}, { __mode = \"k\" }),\n\t\t}\n\tend\n\n\tlocal function FixTable(Table, State)\n\t\tif not Table then\n\t\t\treturn nil\n\t\tend\n\n\t\tif not State or not State.CyclicRefs then\n\t\t\tState = CreateTraversalState(State)\n\t\tend\n\n\t\tlocal CyclicRefs = State.CyclicRefs\n\t\tlocal TableId = State.TableIds[Table]\n\t\tif not TableId then\n\t\t\tTableId = GenerateId()\n\t\t\tState.TableIds[Table] = TableId\n\t\tend\n\n\t\tlocal OutputTable = {}\n\t\tCyclicRefs[TableId] = OutputTable\n\n\t\tlocal ContainsCyclicRef = false\n\n\t\tfor Key, Value in Table do\n\t\t\tif type(Value) == \"table\" then\n\t\t\t\tlocal ExistingId = State.TableIds[Value]\n\t\t\t\tif ExistingId then\n\t\t\t\t\tContainsCyclicRef = true\n\n\t\t\t\t\tOutputTable[Key] = {\n\t\t\t\t\t\t__CyclicRef = true,\n\t\t\t\t\t\t__Id = ExistingId,\n\t\t\t\t\t}\n\t\t\t\t\tcontinue\n\t\t\t\tend\n\n\t\t\t\tif getmetatable(Value) then\n\t\t\t\t\tOutputTable[Key] =\n\t\t\t\t\t\t\"Cobalt: Impossible to bridge table with metatable from actor Environment to main Environment\"\n\t\t\t\t\tcontinue\n\t\t\t\tend\n\n\t\t\t\tlocal Result, _, ContainsCyclic = FixTable(Value, State)\n\t\t\t\tif not Result then\n\t\t\t\t\tcontinue\n\t\t\t\tend\n\n\t\t\t\tOutputTable[Key] = Result\n\t\t\t\tContainsCyclicRef = ContainsCyclicRef or ContainsCyclic\n\t\t\telseif type(Value) == \"function\" then\n\t\t\t\tOutputTable[Key] = FunctionToMetatadata(Value, State)\n\t\t\telse\n\t\t\t\tOutputTable[Key] = Value\n\t\t\tend\n\t\tend\n\n\t\treturn OutputTable, CyclicRefs, ContainsCyclicRef\n\tend\n\n\tFunctionToMetatadata = function(Function, State)\n\t\tif not Function then\n\t\t\treturn nil\n\t\tend\n\n\t\tif not State or not State.CyclicRefs then\n\t\t\tState = CreateTraversalState()\n\t\tend\n\n\t\tlocal Metadata = {\n\t\t\tAddress = tostring(Function),\n\t\t\tName = debug.info(Function, \"n\"),\n\t\t\tSource = debug.info(Function, \"s\"),\n\t\t\tIsC = iscclosure(Function),\n\t\t}\n\n\t\tif State.Functions[Function] then\n\t\t\tMetadata[\"Recursive\"] = true\n\t\t\tMetadata[\"Validation\"] = Data.Token\n\t\t\tMetadata[\"__Function\"] = true\n\n\t\t\treturn Metadata\n\t\tend\n\n\t\tState.Functions[Function] = true\n\n\t\tif not iscclosure(Function) then\n\t\t\tMetadata[\"Upvalues\"] = FixTable(debug.getupvalues(Function), State)\n\t\t\tMetadata[\"Constants\"] = FixTable(debug.getconstants(Function), State)\n\t\t\tMetadata[\"Protos\"] = FixTable(debug.getprotos(Function), State)\n\t\t\t\n\t\t\tif getfunctionhash then\n\t\t\t\tMetadata[\"FunctionHash\"] = getfunctionhash(Function)\n\t\t\tend\n\t\tend\n\n\t\t-- to validate that this function was generated by FunctionToMetatadata\n\t\tMetadata[\"Validation\"] = Data.Token\n\t\tMetadata[\"__Function\"] = true\n\n\t\treturn Metadata\n\tend\n\n\tfunction DeepClone(orig, copies)\n\t\tcopies = copies or {}\n\t\tif typeof(orig) == \"Instance\" then\n\t\t\treturn cloneref(orig)\n\t\telseif typeof(orig) == \"userdata\" then\n\t\t\tif getmetatable(orig) then\n\t\t\t\treturn newproxy(true)\n\t\t\telse\n\t\t\t\treturn newproxy()\n\t\t\tend\n\t\telseif typeof(orig) == \"function\" then\n\t\t\tif clonefunction then\n\t\t\t\treturn clonefunction(orig)\n\t\t\tend\n\n\t\t\treturn orig\n\t\telseif type(orig) ~= \"table\" then\n\t\t\treturn orig\n\t\telseif copies[orig] then\n\t\t\treturn copies[orig]\n\t\tend\n\n\t\tlocal copy = {}\n\t\tcopies[orig] = copy\n\t\tfor k, v in next, orig do\n\t\t\tcopy[DeepClone(k, copies)] = DeepClone(v, copies)\n\t\tend\n\t\treturn copy\n\tend\n\n\tlocal ClassesConnectionsToggle = {\n\t\tRemoteEvent = \"OnClientEvent\",\n\t\tUnreliableRemoteEvent = \"OnClientEvent\",\n\t\tBindableEvent = \"Event\",\n\t}\n\n\tfunction Log:SetConnectionsEnabled(enabled: boolean)\n\t\tif not self.Instance or not ClassesConnectionsToggle[self.Instance.ClassName] then\n\t\t\treturn\n\t\tend\n\n\t\tlocal ConnectionName = ClassesConnectionsToggle[self.Instance.ClassName]\n\t\tif self.Type ~= \"Incoming\" or not ConnectionName then\n\t\t\treturn\n\t\tend\n\n\t\tlocal LoggingFunctions = wax.shared.IncomingLogConnectionFunctions\n\t\tfor _, Connection in getconnections(self.Instance[ConnectionName]) do\n\t\t\tif LoggingFunctions and LoggingFunctions[Connection.Function] then\n\t\t\t\tcontinue\n\t\t\tend\n\n\t\t\tif enabled then\n\t\t\t\tConnection:Enable()\n\t\t\telse\n\t\t\t\tConnection:Disable()\n\t\t\tend\n\t\tend\n\tend\n\n\tfunction Log:Call(RawInfo)\n\t\tif self.Instance == wax.shared.Communicator then\n\t\t\treturn\n\t\tend\n\n\t\tRawInfo[\"Actor\"] = CurrentActor\n\t\tlocal Info = DeepClone(RawInfo)\n\n\t\t--// Fix Arguments \\\\--\n\t\tlocal OldArguments = Info.Arguments\n\t\tInfo.Arguments = {\n\t\t\tData = OldArguments,\n\t\t\tn = OldArguments.n or rawlen(OldArguments),\n\t\t}\n\n\t\tif Info.OriginalInvokeArgs then\n\t\t\tlocal OldOriginalInvokeArgs = Info.OriginalInvokeArgs\n\t\t\tInfo.OriginalInvokeArgs = {\n\t\t\t\tData = OldOriginalInvokeArgs,\n\t\t\t\tn = OldOriginalInvokeArgs.n or rawlen(OldOriginalInvokeArgs),\n\t\t\t}\n\t\tend\n\n\t\t-- Seliware puts their actor BindableEvents in CoreGui\n\t\tlocal identity = getthreadidentity()\n\t\tsetthreadidentity(8)\n\t\twax.shared.Communicator.Fire(wax.shared.Communicator, \"ActorCall\", self.Instance, self.Type, FixTable(Info))\n\t\tsetthreadidentity(identity)\n\tend\n\n\tfunction Log:Ignore()\n\t\tself.Ignored = not self.Ignored\n\tend\n\n\tfunction Log:Block()\n\t\tself.Blocked = not self.Blocked\n\t\tself:SetConnectionsEnabled(not self.Blocked)\n\tend\nend\n\nwax.shared.Logs = {\n\tOutgoing = {},\n\tIncoming = {},\n}\n\nwax.shared.NewLog = function(Instance, Type, Method, Index, CallingScript)\n\tlocal NewLog = wax.shared.Log.new(Instance, Type, Method, Index, CallingScript)\n\twax.shared.Logs[Type][Instance] = NewLog\n\treturn NewLog\nend\n"
                                }
                            }
                        }
                    },
                    {
                        14,
                        2,
                        {
                            "Init"
                        }
                    },
                    {
                        7,
                        1,
                        {
                            "Hooks"
                        },
                        {
                            {
                                11,
                                1,
                                {
                                    "Default"
                                },
                                {
                                    {
                                        13,
                                        2,
                                        {
                                            "Outgoing"
                                        }
                                    },
                                    {
                                        12,
                                        2,
                                        {
                                            "Incoming"
                                        }
                                    }
                                }
                            },
                            {
                                8,
                                1,
                                {
                                    "Actors"
                                },
                                {
                                    {
                                        9,
                                        5,
                                        {
                                            "Incoming",
                                            Value = "local ClassesToHook = {\n\tRemoteEvent = \"OnClientEvent\",\n\tRemoteFunction = \"OnClientInvoke\",\n\tUnreliableRemoteEvent = \"OnClientEvent\",\n\tBindableEvent = \"Event\",\n\tBindableFunction = \"OnInvoke\",\n}\n\ntype InstancesToHook = RemoteEvent | UnreliableRemoteEvent | RemoteFunction | BindableEvent | BindableFunction\ntype MethodsToHook = \"OnClientEvent\" | \"OnClientInvoke\" | \"Event\" | \"OnInvoke\"\n\nlocal LogConnectionFunctions = {}\nlocal SignalMapping = setmetatable({}, { __mode = \"kv\" })\nwax.shared.IncomingLogConnectionFunctions = LogConnectionFunctions\n\nlocal function CreateLookupTable(table)\n\tlocal LookupTable = {}\n\tfor _, Method in next, table do\n\t\tLookupTable[Method] = true\n\tend\n\treturn LookupTable\nend\n\n\nlocal function GetLog(Instance: InstancesToHook, Method: MethodsToHook, Function: (...any) -> ...any)\n\tif wax.shared.ShouldIgnore(Instance, getcallingscript()) or LogConnectionFunctions[Function] then\n\t\treturn nil\n\tend\n\n\tlocal Log = wax.shared.Logs.Incoming[Instance]\n\tif not Log then\n\t\tLog = wax.shared.NewLog(Instance, \"Incoming\", Method, getcallingscript())\n\tend\n\n\treturn Log\nend\n\n--[[\n\tIndividually logs an incoming remote call.\n\n\t@param Instance The instance that was called.\n\t@param Method The method that was called (e.g., \"OnClientEvent\").\n\t@param Function The function that was called, if applicable.\n\t@param Info The information about the call, including arguments and origin. Can be nil.\n\t@param ... The arguments passed from the server to the client.\n\t@return boolean, Log? Returns true if the call was blocked, plus the log when one was used.\n]]\nlocal function LogRemote(\n\tInstance: InstancesToHook,\n\tMethod: MethodsToHook,\n\tFunction: (...any) -> ...any,\n\tInfo: {\n\t\tArguments: { [number]: any, n: number },\n\t\tOrigin: Instance,\n\t\tFunction: (...any) -> ...any,\n\t\tLine: number,\n\t\tIsExecutor: boolean,\n\t\tBlocked: boolean?,\n\t}\n)\n\tlocal Log = GetLog(Instance, Method, Function)\n\tif not Log then\n\t\treturn false, nil\n\tend\n\n\tif Log.Blocked then\n\t\tif wax.shared.SaveManager:GetState(\"LogBlockedRemotes\", false) then\n\t\t\tInfo.Blocked = true\n\t\t\tLog:Call(Info)\n\t\tend\n\n\t\treturn true, Log\n\telseif not Log.Ignored then\n\t\tLog:Call(Info)\n\t\treturn false, Log\n\tend\n\n\treturn false, Log\nend\n\n--[[\n\tCreates a function that can be used to pass to `Connect` which will log all the incoming calls. It will additonally add the function to a ignore list (`LogConnectionFunctions`) to prevent unneccessary logging.\n\t\n\t@param Instance The instance to log.\n\t@param Method The method to log (e.g., \"OnClientEvent\").\n\t@return function Returns a function that logs all calls to the given instance and method.\n]]\nlocal function CreateConnectionFunction(Instance: InstancesToHook, Method: MethodsToHook)\n\tlocal ConnectionFunction = function(...)\n\t\tlocal HasLoggedRegular = false\n\t\tfor _, Connection in getconnections((Instance :: any)[Method]) do\n\t\t\tif Connection.ForeignState then\n\t\t\t\tcontinue\n\t\t\tend\n\n\t\t\tlocal Function = typeof(Connection.Function) == \"function\" and Connection.Function or nil\n\t\t\tlocal Thread = Connection.Thread\n\n\t\t\tlocal Origin = nil\n\n\t\t\tif Thread and getscriptfromthread then\n\t\t\t\tOrigin = getscriptfromthread(Thread)\n\t\t\tend\n\n\t\t\tif not Origin and Function then\n\t\t\t\t-- ts is unreliable because people could js set the script global to nil\n\t\t\t\t-- if only debug.getinfo(Function).source or debug.info(Function, \"s\") returned an Instance...\n\n\t\t\t\tlocal Script = rawget(getfenv(Function), \"script\")\n\t\t\t\tif typeof(Script) == \"Instance\" then\n\t\t\t\t\tOrigin = Script\n\t\t\t\tend\n\t\t\tend\n\n\t\t\tif not HasLoggedRegular and not LogConnectionFunctions[Function] then\n\t\t\t\tHasLoggedRegular = true\n\t\t\tend\n\n\t\t\tLogRemote(Instance, Method, Function, {\n\t\t\t\tArguments = table.pack(...),\n\t\t\t\tOrigin = Origin,\n\t\t\t\tFunction = Function,\n\t\t\t\tLine = nil,\n\t\t\t\tIsExecutor = Function and isexecutorclosure(Function) or false,\n\t\t\t})\n\t\tend\n\n\t\tif not HasLoggedRegular then\n\t\t\tLogRemote(Instance, Method, nil, {\n\t\t\t\tArguments = table.pack(...),\n\t\t\t\tOrigin = nil,\n\t\t\t\tFunction = nil,\n\t\t\t\tLine = nil,\n\t\t\t\tIsExecutor = false,\n\t\t\t})\n\t\tend\n\tend\n\n\tLogConnectionFunctions[ConnectionFunction] = true\n\treturn ConnectionFunction\nend\n\n--[[\n\tCreates a function that can be used to pass to callbacks (.OnInvoke & .OnClientInvoke) which will log all the incoming calls.\n\t\n\t@param Instance The instance to log.\n\t@param Method The method to log (e.g., \"OnClientEvent\").\n\t@param Function The original callback of the RemoteFunction\n\t@return function Returns a function that logs all function calls to the given instance and method.\n]]\nlocal function CreateCallbackDetour(Instance: InstancesToHook, Method: MethodsToHook, Callback: (...any) -> ...any)\n\tlocal Detour = function(...)\n\t\tlocal Origin = nil\n\n\t\t-- May not exist in all executors\n\t\tif getscriptfromthread then\n\t\t\tOrigin = getscriptfromthread(coroutine.running())\n\t\tend\n\n\t\t-- Unreliable method to get script.\n\t\tif not Origin then\n\t\t\tlocal Script = rawget(getfenv(Callback), \"script\")\n\t\t\tif typeof(Script) == \"Instance\" then\n\t\t\t\tOrigin = Script\n\t\t\tend\n\t\tend\n\n\t\tlocal FunctionCaller = debug.info(2, \"f\")\n\t\tlocal IsExecutor = if typeof(FunctionCaller) == \"function\"\n\t\t\tthen isexecutorclosure(FunctionCaller)\n\t\t\telse isexecutorclosure(Callback)\n\n\t\tlocal OriginalInvokeArgs = table.pack(...)\n\t\tlocal Log = GetLog(Instance, Method, Callback)\n\n\t\tif Log and Log.Blocked then\n\t\t\tif wax.shared.SaveManager:GetState(\"LogBlockedRemotes\", false) then\n\t\t\t\tLog:Call({\n\t\t\t\t\tArguments = OriginalInvokeArgs,\n\t\t\t\t\tOrigin = Origin,\n\t\t\t\t\tFunction = Callback,\n\t\t\t\t\tLine = nil,\n\t\t\t\t\tIsExecutor = IsExecutor,\n\t\t\t\t\tBlocked = true,\n\t\t\t\t})\n\t\t\tend\n\n\t\t\treturn\n\t\tend\n\n\t\tlocal old = getthreadidentity()\n\t\tsetthreadidentity(2)\n\t\tlocal Result = table.pack(Callback(table.unpack(OriginalInvokeArgs, 1, OriginalInvokeArgs.n)))\n\t\tsetthreadidentity(old)\n\n\t\tif Log and not Log.Ignored then\n\t\t\tLog:Call({\n\t\t\t\tArguments = Result,\n\t\t\t\tOrigin = Origin,\n\t\t\t\tFunction = Callback,\n\t\t\t\tLine = nil,\n\t\t\t\tIsExecutor = IsExecutor,\n\t\t\t\tOriginalInvokeArgs = OriginalInvokeArgs,\n\t\t\t\tIsCallbackReturn = true,\n\t\t\t})\n\t\tend\n\n\t\treturn table.unpack(Result, 1, Result.n)\n\tend\n\n\tif wax.shared.ExecutorSupport[\"setstackhidden\"].IsWorking then\n\t\tsetstackhidden(Detour, true)\n\tend\n\n\treturn Detour\nend\n\n--[[\n\tHandles setting up logging for the appropriate instances.\n\n\t@param Instance The instance to handle.\n]]\nlocal function HandleInstance(Instance: any)\n\tif\n\t\tnot ClassesToHook[Instance.ClassName]\n\t\tor Instance == wax.shared.Communicator\n\t\tor Instance == wax.shared.ActorCommunicator\n\tthen\n\t\treturn\n\tend\n\n\tlocal Method = ClassesToHook[Instance.ClassName]\n\n\tif Instance.ClassName == \"RemoteEvent\" or Instance.ClassName == \"UnreliableRemoteEvent\" then\n\t\twax.shared.Connect(Instance.OnClientEvent:Connect(CreateConnectionFunction(Instance, Method)))\n\n\t\tSignalMapping[Instance.OnClientEvent] = Instance\n\telseif Instance.ClassName == \"BindableEvent\" then\n\t\twax.shared.Connect(Instance.Event:Connect(CreateConnectionFunction(Instance, Method)))\n\n\t\tSignalMapping[Instance.Event] = Instance\n\telseif Instance.ClassName == \"RemoteFunction\" or Instance.ClassName == \"BindableFunction\" then\n\t\tlocal Success, Callback = pcall(getcallbackvalue, Instance, Method)\n\t\tlocal IsCallable = (\n\t\t\ttypeof(Callback) == \"function\"\n\t\t\tor wax.shared.getrawmetatable(Callback) ~= nil and typeof(wax.shared.getrawmetatable(Callback)[\"__call\"]) == \"function\"\n\t\t\tor false\n\t\t)\n\n\t\tif not Success or not IsCallable then\n\t\t\treturn\n\t\tend\n\n\t\tInstance[Method] = CreateCallbackDetour(Instance, Method, Callback)\n\tend\nend\n\nwax.shared.Connect(game.DescendantAdded:Connect(HandleInstance))\n\nlocal CategoryToSearch = { game:QueryDescendants(\"RemoteEvent, RemoteFunction, UnreliableRemoteEvent, BindableEvent, BindableFunction\") }\nif wax.shared.ExecutorSupport[\"getnilinstances\"].IsWorking then\n\ttable.insert(CategoryToSearch, getnilinstances())\nend\n\nfor _, Category in CategoryToSearch do\n\tfor _, Instance in next, Category do\n\t\tHandleInstance(Instance)\n\tend\nend\n\nwax.shared.NewIndexHook = wax.shared.Hooking.HookMetaMethod(game, \"__newindex\", function(...)\n\tlocal self, key, value = ...\n\n\tif typeof(self) ~= \"Instance\" or not ClassesToHook[self.ClassName] then\n\t\treturn wax.shared.NewIndexHook(...)\n\tend\n\n\tif self.ClassName == \"RemoteFunction\" or self.ClassName == \"BindableFunction\" then\n\t\tlocal Method = ClassesToHook[self.ClassName]\n\n\t\tlocal IsCallable = (\n\t\t\ttypeof(value) == \"function\"\n\t\t\tor wax.shared.getrawmetatable(value) ~= nil and typeof(wax.shared.getrawmetatable(value)[\"__call\"]) == \"function\"\n\t\t\tor false\n\t\t)\n\n\t\tif key == Method and IsCallable then\n\t\t\treturn wax.shared.NewIndexHook(self, key, CreateCallbackDetour(self :: InstancesToHook, Method, value))\n\t\tend\n\tend\n\n\treturn wax.shared.NewIndexHook(...)\nend)\n\nlocal ConnectionKeys = CreateLookupTable({\n\t\"Connect\",\n\t\"ConnectParallel\",\n\t\"connect\",\n\t\"connectParallel\",\n\t\"Once\",\n})\n\nlocal SignalMetatable = wax.shared.getrawmetatable(Instance.new(\"Part\").Touched)\nwax.shared.Hooks[SignalMetatable.__index] = wax.shared.Hooking.HookFunction(SignalMetatable.__index, function(...)\n\tlocal self, key = ...\n\n\tif not wax.shared.Unloaded and ConnectionKeys[key] then\n\t\tlocal Instance = SignalMapping[self]\n\t\tlocal Connect = wax.shared.Hooks[SignalMetatable.__index](...)\n\n\t\tif not Instance then\n\t\t\treturn Connect\n\t\tend\n\n\t\tlocal Method = ClassesToHook[Instance.ClassName]\n\t\treturn wax.shared.newcclosure(function(...)\n\t\t\tlocal _self, callback = ...\n\n\t\t\tlocal Result = table.pack(Connect(...))\n\t\t\tlocal Log = wax.shared.Logs.Incoming[Instance]\n\n\t\t\tif Log and Log.Blocked then\n\t\t\t\tfor _, Connection in getconnections(Instance[Method]) do\n\t\t\t\t\tif not Connection.ForeignState and Connection.Function ~= callback then\n\t\t\t\t\t\tcontinue\n\t\t\t\t\tend\n\n\t\t\t\t\tConnection:Disable()\n\t\t\t\tend\n\t\t\tend\n\n\t\t\treturn table.unpack(Result, 1, Result.n)\n\t\tend, debug.info(Connect, \"n\"))\n\tend\n\n\treturn wax.shared.Hooks[SignalMetatable.__index](...)\nend)\n"
                                        }
                                    },
                                    {
                                        10,
                                        5,
                                        {
                                            "Outgoing",
                                            Value = "local function CreateLookupTable(table)\n\tlocal LookupTable = {}\n\tfor _, Method in next, table do\n\t\tLookupTable[Method] = true\n\tend\n\treturn LookupTable\nend\n\nlocal NamecallMethods = CreateLookupTable({\n\t\"FireServer\",\n\t\"InvokeServer\",\n\t\"Fire\",\n\t\"Invoke\",\n\t\"fireServer\",\n\t\"invokeServer\",\n\t\"fire\",\n\t\"invoke\",\n})\nlocal AllowedClassNames = CreateLookupTable({ \"RemoteEvent\", \"RemoteFunction\", \"UnreliableRemoteEvent\", \"BindableEvent\", \"BindableFunction\" })\n\n--[[\n\tReturns the calling function via `debug.info`\n\n\t@return `function | nil` The calling function or nil if not found.\n]]\nlocal function getcallingfunction()\n\tlocal BaseLevel = if wax.shared.ExecutorSupport[\"oth\"].IsWorking then 2 else 4\n\n\tfor i = BaseLevel, 10 do\n\t\tlocal Function, Source = debug.info(i, \"fs\")\n\t\tif not Function or not Source then\n\t\t\tbreak\n\t\tend\n\n\t\tif Source == \"[C]\" then\n\t\t\tcontinue\n\t\tend\n\n\t\treturn Function\n\tend\n\n\treturn debug.info(BaseLevel, \"f\")\nend\n\n--[[\n\tReturns the calling line of the script that called the function via `debug.info`\n\n\t@return number Returns the line number of the calling script.\n]]\nlocal function getcallingline()\n\tlocal BaseLevel = if wax.shared.ExecutorSupport[\"oth\"].IsWorking then 2 else 4\n\n\tfor i = BaseLevel, 10 do\n\t\tlocal Source, Line = debug.info(i, \"sl\")\n\t\tif not Source then\n\t\t\tbreak\n\t\tend\n\n\t\tif Source == \"[C]\" then\n\t\t\tcontinue\n\t\tend\n\n\t\treturn Line\n\tend\n\n\treturn debug.info(BaseLevel, \"l\")\nend\n\n--[[\n\tReturns the calling source of the script that called the function via `debug.info`\n\n\t@return string Returns the source of the calling script.\n]]\nlocal function getcallingsource()\n\tlocal BaseLevel = if wax.shared.ExecutorSupport[\"oth\"].IsWorking then 2 else 4\n\n\tfor i = BaseLevel, 10 do\n\t\tlocal Source = debug.info(i, \"s\")\n\t\tif not Source then\n\t\t\tbreak\n\t\tend\n\n\t\tif Source == \"[C]\" then\n\t\t\tcontinue\n\t\tend\n\n\t\treturn Source\n\tend\n\n\treturn debug.info(BaseLevel, \"s\")\nend\n\n-- metamethod hooks\nwax.shared.NamecallHook = wax.shared.Hooking.HookMetaMethod(game, \"__namecall\", function(...)\n\tlocal self = ...\n\tlocal Method = getnamecallmethod()\n\n\tif\n\t\ttypeof(self) == \"Instance\"\n\t\tand AllowedClassNames[self.ClassName]\n\t\tand not rawequal(self, wax.shared.Communicator)\n\t\tand not rawequal(self, wax.shared.ActorCommunicator)\n\t\tand NamecallMethods[Method]\n\t\tand not wax.shared.ShouldIgnore(self, getcallingscript())\n\tthen\n\t\tlocal Log = wax.shared.Logs.Outgoing[self]\n\t\tif not Log then\n\t\t\tLog = wax.shared.NewLog(self, \"Outgoing\", Method, getcallingscript())\n\t\tend\n\n\t\tlocal Info = {\n\t\t\tArguments = table.pack(select(2, ...)),\n\t\t\tOrigin = getcallingscript(),\n\t\t\tFunction = getcallingfunction(),\n\t\t\tLine = getcallingline(),\n\t\t\tSource = getcallingsource(),\n\t\t\tIsExecutor = checkcaller(),\n\t\t}\n\n\t\tif Log.Blocked then\n\t\t\tif wax.shared.SaveManager:GetState(\"LogBlockedRemotes\", false) then\n\t\t\t\tInfo.Blocked = true\n\t\t\t\tLog:Call(Info)\n\t\t\tend\n\n\t\t\treturn\n\t\telseif not Log.Ignored then\n\t\t\tLog:Call(Info)\n\t\t\t-- For RemoteFunction return value (ex: local result = RemoteFunction:InvokeServer())\n\t\t\tif self.ClassName == \"RemoteFunction\" and (Method == \"InvokeServer\" or Method == \"invokeServer\") then\n\t\t\t\tLog = wax.shared.Logs.Incoming[self]\n\t\t\t\tif not Log then\n\t\t\t\t\tLog = wax.shared.NewLog(self, \"Incoming\", Method, getcallingscript())\n\t\t\t\tend\n\n\t\t\t\tif Log.Blocked then\n\t\t\t\t\tif wax.shared.SaveManager:GetState(\"LogBlockedRemotes\", false) then\n\t\t\t\t\t\tLog:Call({\n\t\t\t\t\t\t\tArguments = table.pack(),\n\t\t\t\t\t\t\tOrigin = getcallingscript(),\n\t\t\t\t\t\t\tFunction = getcallingfunction(),\n\t\t\t\t\t\t\tLine = getcallingline(),\n\t\t\t\t\t\t\tSource = getcallingsource(),\n\t\t\t\t\t\t\tIsExecutor = checkcaller(),\n\t\t\t\t\t\t\tOriginalInvokeArgs = table.pack(select(2, ...)),\n\t\t\t\t\t\t\tBlocked = true,\n\t\t\t\t\t\t})\n\t\t\t\t\tend\n\n\t\t\t\t\treturn\n\t\t\t\tend\n\n\t\t\t\tlocal Result = table.pack(wax.shared.NamecallHook(...))\n\t\t\t\tif not Log.Ignored then\n\t\t\t\t\tlocal RFResultInfo = {\n\t\t\t\t\t\tArguments = Result,\n\t\t\t\t\t\tOrigin = getcallingscript(),\n\t\t\t\t\t\tFunction = getcallingfunction(),\n\t\t\t\t\t\tLine = getcallingline(),\n\t\t\t\t\t\tSource = getcallingsource(),\n\t\t\t\t\t\tIsExecutor = checkcaller(),\n\t\t\t\t\t\tOriginalInvokeArgs = table.pack(select(2, ...)),\n\t\t\t\t\t}\n\t\t\t\t\tLog:Call(RFResultInfo)\n\t\t\t\tend\n\n\t\t\t\treturn table.unpack(Result, 1, Result.n)\n\t\t\tend\n\t\tend\n\tend\n\n\treturn wax.shared.NamecallHook(...)\nend)\n\n-- function hooks\nlocal FunctionsToHook\ndo\n\tlocal BindableFunction = Instance.new(\"BindableFunction\")\n\tlocal BindableEvent = Instance.new(\"BindableEvent\")\n\n\tlocal RemoteFunction = Instance.new(\"RemoteFunction\")\n\tlocal RemoteEvent = Instance.new(\"RemoteEvent\")\n\tlocal UnreliableRemoteEvent = Instance.new(\"UnreliableRemoteEvent\")\n\n\tFunctionsToHook = {\n\t\tBindableFunction.Invoke,\n\t\tBindableEvent.Fire,\n\n\t\tRemoteFunction.InvokeServer,\n\t\tRemoteEvent.FireServer,\n\t\tUnreliableRemoteEvent.FireServer,\n\t}\n\n\tBindableFunction:Destroy()\n\tBindableEvent:Destroy()\n\n\tRemoteFunction:Destroy()\n\tRemoteEvent:Destroy()\n\tUnreliableRemoteEvent:Destroy()\nend\n\nfor _, Function in next, FunctionsToHook do\n\tlocal Method = debug.info(Function, \"n\")\n\n\twax.shared.Hooks[Function] = wax.shared.Hooking.HookFunction(Function, function(...)\n\t\tlocal self = ...\n\n\t\tif\n\t\t\ttypeof(self) == \"Instance\"\n\t\t\tand AllowedClassNames[self.ClassName]\n\t\t\tand not rawequal(self, wax.shared.Communicator)\n\t\t\tand not wax.shared.ShouldIgnore(self, getcallingscript())\n\t\tthen\n\t\t\tlocal Log = wax.shared.Logs.Outgoing[self]\n\t\t\tif not Log then\n\t\t\t\tLog = wax.shared.NewLog(self, \"Outgoing\", Method, getcallingscript())\n\t\t\tend\n\n\t\t\tlocal Info = {\n\t\t\t\tArguments = table.pack(select(2, ...)),\n\t\t\t\tOrigin = getcallingscript(),\n\t\t\t\tFunction = getcallingfunction(),\n\t\t\t\tLine = getcallingline(),\n\t\t\t\tSource = getcallingsource(),\n\t\t\t\tIsExecutor = checkcaller(),\n\t\t\t}\n\n\t\t\tif Log.Blocked then\n\t\t\t\tif wax.shared.SaveManager:GetState(\"LogBlockedRemotes\", false) then\n\t\t\t\t\tInfo.Blocked = true\n\t\t\t\t\tLog:Call(Info)\n\t\t\t\tend\n\n\t\t\t\treturn\n\t\t\telseif not Log.Ignored then\n\t\t\t\tLog:Call(Info)\n\t\t\t\t-- For RemoteFunction return value (ex: local result = RemoteFunction:InvokeServer())\n\t\t\t\tif self.ClassName == \"RemoteFunction\" and (Method == \"InvokeServer\" or Method == \"invokeServer\") then\n\t\t\t\t\tLog = wax.shared.Logs.Incoming[self]\n\t\t\t\t\tif not Log then\n\t\t\t\t\t\tLog = wax.shared.NewLog(self, \"Incoming\", Method, getcallingscript())\n\t\t\t\t\tend\n\n\t\t\t\t\tif Log.Blocked then\n\t\t\t\t\t\tif wax.shared.SaveManager:GetState(\"LogBlockedRemotes\", false) then\n\t\t\t\t\t\t\tLog:Call({\n\t\t\t\t\t\t\t\tArguments = table.pack(),\n\t\t\t\t\t\t\t\tOrigin = getcallingscript(),\n\t\t\t\t\t\t\t\tFunction = getcallingfunction(),\n\t\t\t\t\t\t\t\tLine = getcallingline(),\n\t\t\t\t\t\t\t\tSource = getcallingsource(),\n\t\t\t\t\t\t\t\tIsExecutor = checkcaller(),\n\t\t\t\t\t\t\t\tOriginalInvokeArgs = table.pack(select(2, ...)),\n\t\t\t\t\t\t\t\tBlocked = true,\n\t\t\t\t\t\t\t})\n\t\t\t\t\t\tend\n\n\t\t\t\t\t\treturn\n\t\t\t\t\tend\n\n\t\t\t\t\tlocal Result = table.pack(wax.shared.Hooks[Function](...))\n\t\t\t\t\tif not Log.Ignored then\n\t\t\t\t\t\tlocal RFResultInfo = {\n\t\t\t\t\t\t\tArguments = Result,\n\t\t\t\t\t\t\tOrigin = getcallingscript(),\n\t\t\t\t\t\t\tFunction = getcallingfunction(),\n\t\t\t\t\t\t\tLine = getcallingline(),\n\t\t\t\t\t\t\tSource = getcallingsource(),\n\t\t\t\t\t\t\tIsExecutor = checkcaller(),\n\t\t\t\t\t\t\tOriginalInvokeArgs = table.pack(select(2, ...)),\n\t\t\t\t\t\t}\n\t\t\t\t\t\tLog:Call(RFResultInfo)\n\t\t\t\t\tend\n\n\t\t\t\t\treturn table.unpack(Result, 1, Result.n)\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\n\t\treturn wax.shared.Hooks[Function](...)\n\tend)\nend\n"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            },
            {
                15,
                1,
                {
                    "Utils"
                },
                {
                    {
                        26,
                        2,
                        {
                            "FileLog"
                        }
                    },
                    {
                        24,
                        2,
                        {
                            "Connect"
                        }
                    },
                    {
                        32,
                        2,
                        {
                            "SaveManager"
                        }
                    },
                    {
                        36,
                        1,
                        {
                            "UI"
                        },
                        {
                            {
                                37,
                                2,
                                {
                                    "Animations"
                                }
                            },
                            {
                                43,
                                2,
                                {
                                    "Interface"
                                }
                            },
                            {
                                38,
                                2,
                                {
                                    "AssetManager"
                                }
                            },
                            {
                                41,
                                2,
                                {
                                    "Highlighter"
                                }
                            },
                            {
                                44,
                                2,
                                {
                                    "Resize"
                                }
                            },
                            {
                                42,
                                2,
                                {
                                    "Icons"
                                }
                            },
                            {
                                40,
                                2,
                                {
                                    "Helper"
                                }
                            },
                            {
                                45,
                                2,
                                {
                                    "Sonner"
                                }
                            },
                            {
                                39,
                                2,
                                {
                                    "Drag"
                                }
                            }
                        }
                    },
                    {
                        25,
                        2,
                        {
                            "FileHelper"
                        }
                    },
                    {
                        20,
                        1,
                        {
                            "CodeGen"
                        },
                        {
                            {
                                21,
                                2,
                                {
                                    "Generator"
                                }
                            },
                            {
                                22,
                                2,
                                {
                                    "SessionExporter"
                                }
                            },
                            {
                                23,
                                5,
                                {
                                    "SessionHTMLView",
                                    Value = "<!DOCTYPE html>\n<html lang=\"en\">\n  <head>\n    <meta charset=\"UTF-8\" />\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\n    <title>Cobalt - Session Viewer</title>\n    <link\n      rel=\"icon\"\n      type=\"image/png\"\n      href=\"https://cobalt-xil.pages.dev/Assets/Logo.png\"\n    />\n    <style>\n      :root {\n        --bg-color: #0b0b0b;\n        --surface-color: #161b22;\n        --border-color: #30363d;\n        --text-primary: #c9d1d9;\n        --text-secondary: #8b949e;\n        --accent-blue: #58a6ff;\n        --accent-green: #3fb950;\n        --accent-orange: #d29922;\n        --accent-red: #ff7b72;\n        --font-family: \"Inter\", -apple-system, BlinkMacSystemFont, \"Segoe UI\",\n          Helvetica, Arial, sans-serif;\n      }\n\n      body {\n        background-color: var(--bg-color);\n        color: var(--text-primary);\n        font-family: var(--font-family);\n        margin: 0;\n        padding: 0;\n        font-size: 13px;\n        height: 100vh;\n        display: flex;\n        flex-direction: column;\n        overflow: hidden;\n      }\n\n      /* Top Header */\n      .app-header {\n        height: 50px;\n        border-bottom: 1px solid var(--border-color);\n        display: flex;\n        align-items: center;\n        justify-content: space-between;\n        padding: 0 20px;\n        background-color: var(--bg-color);\n        flex-shrink: 0;\n        z-index: 10;\n      }\n\n      .brand {\n        display: flex;\n        align-items: center;\n        gap: 10px;\n        font-size: 16px;\n        font-weight: 600;\n        color: #fff;\n      }\n\n      .brand-icon {\n        width: 20px;\n        height: 20px;\n        background-image: url(\"https://cobalt-xil.pages.dev/Assets/Logo.png\");\n        background-size: contain;\n        background-repeat: no-repeat;\n        background-position: center;\n      }\n\n      .session-container {\n        position: relative;\n        display: flex;\n        flex-direction: column;\n        align-items: flex-end;\n      }\n\n      .session-info {\n        color: var(--text-secondary);\n        font-family: monospace;\n        font-size: 12px;\n        cursor: pointer;\n        padding: 2px 5px;\n        border-radius: 4px;\n        transition: background-color 0.2s ease;\n        user-select: none;\n      }\n\n      .session-info:hover {\n        background-color: #1c2128;\n      }\n\n      .session-id {\n        color: #fff;\n      }\n\n      .session-tooltip {\n        position: absolute;\n        top: 100%;\n        right: 0;\n        background-color: #1c2128;\n        border: 1px solid var(--border-color);\n        border-radius: 6px;\n        padding: 10px;\n        z-index: 100;\n        width: 250px;\n        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);\n        margin-top: 5px;\n        opacity: 0;\n        transform: translateY(-10px);\n        pointer-events: none;\n        visibility: hidden;\n        transition: opacity 0.2s ease, transform 0.2s ease, visibility 0.2s;\n      }\n\n      .session-tooltip::before {\n        content: \"\";\n        position: absolute;\n        top: -10px;\n        left: 0;\n        width: 100%;\n        height: 10px;\n        background: transparent;\n      }\n\n      .session-container:hover .session-tooltip,\n      .session-tooltip.visible {\n        opacity: 1;\n        transform: translateY(0);\n        pointer-events: auto;\n        visibility: visible;\n      }\n\n      .tooltip-row {\n        display: flex;\n        justify-content: space-between;\n        margin-bottom: 5px;\n        font-size: 11px;\n      }\n\n      .tooltip-label {\n        color: var(--text-secondary);\n      }\n\n      .tooltip-value {\n        color: var(--text-primary);\n        font-family: monospace;\n        user-select: text;\n      }\n\n      /* Mobile Responsiveness */\n      @media (max-width: 768px) {\n        .app-header {\n          height: auto;\n          flex-wrap: wrap;\n          padding: 10px;\n          gap: 10px;\n        }\n\n        .brand {\n          font-size: 14px;\n        }\n\n        .session-container {\n          align-items: flex-start;\n          display: none;\n          /* Hide session info on mobile to save space */\n        }\n\n        .trace-toolbar {\n          height: auto;\n          flex-wrap: wrap;\n          padding: 10px;\n          gap: 10px;\n          justify-content: space-between;\n        }\n\n        /* Hide non-essential info on mobile */\n        .trace-toolbar > div:first-child,\n        #statsLabel {\n          display: none;\n        }\n\n        .search-widget {\n          width: 100%;\n          order: 3;\n          margin-top: 5px;\n        }\n\n        .view-toggle {\n          width: 100%;\n          display: flex;\n        }\n\n        .view-btn {\n          flex: 1;\n          text-align: center;\n        }\n\n        .row-list {\n          width: 60vw;\n          /* Use viewport width to prevent runaway expansion */\n        }\n\n        .col-list {\n          width: 60vw;\n          flex: none;\n        }\n\n        .details-panel.visible {\n          position: fixed;\n          top: 0;\n          left: 0;\n          width: 100%;\n          height: 100%;\n          z-index: 1000;\n          border-left: none;\n        }\n\n        .details-header-top {\n          margin-top: 10px;\n        }\n\n        /* Fix Details Header Overflow */\n        .details-title-group {\n          min-width: 0;\n          flex: 1;\n          margin-right: 10px;\n        }\n\n        .details-name-large {\n          white-space: nowrap;\n          overflow: hidden;\n          text-overflow: ellipsis;\n        }\n\n        .details-actions {\n          flex-shrink: 0;\n        }\n\n        /* Allow wrapping for paths on mobile */\n        .details-path-row,\n        .origin-row,\n        .remote-path-copy {\n          white-space: normal !important;\n          word-break: break-all;\n        }\n      }\n\n      /* Scrollbars */\n      ::-webkit-scrollbar {\n        width: 10px;\n        height: 10px;\n      }\n\n      ::-webkit-scrollbar-track {\n        background: #0d1117;\n      }\n\n      ::-webkit-scrollbar-thumb {\n        background: #30363d;\n        border-radius: 5px;\n        border: 2px solid #0d1117;\n      }\n\n      ::-webkit-scrollbar-thumb:hover {\n        background: #8b949e;\n      }\n\n      ::-webkit-scrollbar-corner {\n        background: var(--bg-color);\n      }\n\n      /* Heatmap Styles */\n      .heatmap-container {\n        flex: 1;\n        display: none;\n        flex-direction: column;\n        overflow: hidden;\n        background-color: var(--bg-color);\n        position: relative;\n      }\n\n      .heatmap-container.visible {\n        display: flex;\n      }\n\n      .heatmap-canvas {\n        flex: 1;\n        width: 100%;\n        height: 100%;\n      }\n\n      .view-toggle {\n        display: flex;\n        background: #1c2128;\n        border: 1px solid var(--border-color);\n        border-radius: 4px;\n        overflow: hidden;\n      }\n\n      .view-btn {\n        padding: 4px 12px;\n        font-size: 12px;\n        cursor: pointer;\n        color: var(--text-secondary);\n        background: transparent;\n        border: none;\n        transition: all 0.2s;\n      }\n\n      .view-btn.active {\n        background: var(--accent-blue);\n        color: white;\n      }\n\n      .view-btn:hover:not(.active) {\n        background: #30363d;\n      }\n\n      /* Main Layout */\n      .main-container {\n        display: flex;\n        flex: 1;\n        overflow: hidden;\n      }\n\n      /* Left Panel: Trace View */\n      .trace-panel {\n        flex: 1;\n        display: flex;\n        flex-direction: column;\n        border-right: 1px solid var(--border-color);\n        min-width: 0;\n        overflow: hidden;\n      }\n\n      .trace-toolbar {\n        height: 40px;\n        border-bottom: 1px solid var(--border-color);\n        display: flex;\n        align-items: center;\n        padding: 0 10px;\n        gap: 10px;\n        background-color: var(--bg-color);\n        flex-shrink: 0;\n      }\n\n      .search-widget {\n        display: flex;\n        flex-direction: column;\n        background-color: var(--bg-color);\n        border: 1px solid var(--border-color);\n        border-radius: 6px;\n        width: 320px;\n        position: relative;\n        transition: border-color 0.2s ease, border-radius 0.2s ease;\n        box-sizing: border-box;\n      }\n\n      .search-widget:focus-within {\n        border-color: var(--accent-blue);\n      }\n\n      .search-widget:focus-within > .search-options {\n        border-color: var(--accent-blue);\n      }\n\n      .search-widget.expanded {\n        border-bottom-left-radius: 0;\n        border-bottom-right-radius: 0;\n        border-bottom-color: transparent;\n      }\n\n      .search-row {\n        display: flex;\n        align-items: center;\n        padding: 4px;\n      }\n\n      .search-chevron {\n        cursor: pointer;\n        padding: 2px;\n        color: var(--text-secondary);\n        display: flex;\n        align-items: center;\n        justify-content: center;\n        transition: transform 0.2s ease, color 0.2s ease;\n        width: 20px;\n        height: 20px;\n        border-radius: 4px;\n      }\n\n      .search-chevron:hover {\n        background-color: rgba(255, 255, 255, 0.1);\n        color: var(--text-primary);\n      }\n\n      .search-chevron.expanded {\n        transform: rotate(90deg);\n      }\n\n      .search-input-container {\n        flex: 1;\n        display: flex;\n        align-items: center;\n        margin-left: 4px;\n      }\n\n      .search-input {\n        background: transparent;\n        border: none;\n        color: var(--text-primary);\n        font-size: 12px;\n        width: 100%;\n        outline: none;\n        height: 20px;\n      }\n\n      .search-options {\n        transition: border-color 0.2s ease, border-radius 0.2s ease;\n        display: none;\n        padding: 10px;\n        border: 1px solid var(--border-color);\n        border-top: none;\n        background-color: var(--bg-color);\n        flex-direction: column;\n        gap: 12px;\n        position: absolute;\n        top: 100%;\n        left: -1px;\n        right: -1px;\n        z-index: 100;\n        border-bottom-left-radius: 6px;\n        border-bottom-right-radius: 6px;\n        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);\n        box-sizing: border-box;\n      }\n\n      .search-options.visible {\n        display: flex;\n      }\n\n      .time-range-row {\n        display: flex;\n        align-items: center;\n        gap: 8px;\n        font-size: 11px;\n        color: var(--text-secondary);\n      }\n\n      .filter-options-row {\n        display: flex;\n        flex-wrap: wrap;\n        gap: 8px;\n        padding-top: 8px;\n        border-top: 1px solid var(--border-color);\n      }\n\n      .filter-checkbox-label {\n        display: flex;\n        align-items: center;\n        gap: 4px;\n        font-size: 11px;\n        color: var(--text-secondary);\n        cursor: pointer;\n        user-select: none;\n      }\n\n      .filter-checkbox-label:hover {\n        color: var(--text-primary);\n      }\n\n      .filter-checkbox {\n        accent-color: var(--accent-blue);\n      }\n\n      .time-input-styled {\n        background-color: #161b22;\n        border: 1px solid var(--border-color);\n        color: var(--text-primary);\n        border-radius: 4px;\n        padding: 4px 8px;\n        width: 60px;\n        outline: none;\n        font-size: 11px;\n        transition: border-color 0.2s ease;\n        margin: 0 2px;\n      }\n\n      .time-input-styled:focus {\n        border-color: var(--accent-blue);\n      }\n\n      .unit-select {\n        background-color: #161b22;\n        border: 1px solid var(--border-color);\n        color: var(--text-primary);\n        border-radius: 4px;\n        outline: none;\n        font-size: 11px;\n        padding: 3px 6px;\n        cursor: pointer;\n        transition: border-color 0.2s ease;\n      }\n\n      .unit-select:focus {\n        border-color: var(--accent-blue);\n      }\n\n      .trace-header-row {\n        display: flex;\n        height: 30px;\n        border-bottom: 1px solid var(--border-color);\n        background-color: var(--surface-color);\n        font-size: 11px;\n        color: var(--text-secondary);\n        line-height: 30px;\n        flex-shrink: 0;\n      }\n\n      .col-list {\n        width: 300px;\n        padding-left: 15px;\n        border-right: 1px solid var(--border-color);\n        flex-shrink: 0;\n        z-index: 5;\n        background-color: var(--surface-color);\n        box-sizing: border-box;\n        /* Match row-list */\n      }\n\n      .col-timeline {\n        flex: 1;\n        position: relative;\n        overflow: hidden;\n        min-width: calc(100vw - 300px);\n      }\n\n      .timeline-ruler {\n        position: relative;\n        top: 0;\n        left: 0;\n        height: 100%;\n        pointer-events: none;\n      }\n\n      .tick {\n        position: absolute;\n        top: 0;\n        bottom: 0;\n        border-left: 1px solid #30363d;\n        font-size: 10px;\n        color: #484f58;\n        padding-left: 4px;\n      }\n\n      .trace-rows {\n        flex: 1;\n        overflow: auto;\n        /* Ensure both scrollbars appear */\n        position: relative;\n        contain: strict;\n      }\n\n      .virtual-spacer {\n        position: absolute;\n        top: 0;\n        left: 0;\n        width: 1px;\n      }\n\n      .virtual-content {\n        position: absolute;\n        top: 0;\n        left: 0;\n        width: 100%;\n      }\n\n      .trace-row {\n        display: flex;\n        height: 28px;\n        /* align-items: center;  Removed to allow children to stretch */\n        cursor: pointer;\n        /* border-bottom: 1px solid #1c2128; Moved to children */\n        width: fit-content;\n        min-width: 100%;\n        transition: background-color 0.1s ease;\n        box-sizing: border-box;\n      }\n\n      .trace-row:hover {\n        background-color: #1c2128;\n      }\n\n      .trace-row.selected {\n        background-color: rgba(88, 166, 255, 0.1);\n      }\n\n      .trace-row.hidden {\n        display: none;\n      }\n\n      .trace-row:hover * {\n        background-color: #1c2128;\n      }\n\n      .trace-row.selected * {\n        background-color: #1c2333;\n      }\n\n      .row-list {\n        width: 300px;\n        padding-left: 15px;\n        /* Use box-shadow for sticky border to prevent it from disappearing */\n        box-shadow: 1px 0 0 0 var(--border-color);\n        border-right: none;\n        border-bottom: 1px solid #1c2128;\n        /* Added border here */\n        display: flex;\n        align-items: center;\n        overflow: hidden;\n        flex-shrink: 0;\n        box-sizing: border-box;\n        position: sticky;\n        left: 0;\n        background-color: var(--bg-color);\n        z-index: 2;\n        transition: background-color 0.1s ease;\n        height: 100%;\n      }\n\n      .row-timeline {\n        flex: 1;\n        position: relative;\n        height: 100%;\n        overflow: hidden;\n        border-bottom: 1px solid #1c2128;\n        /* Added border here */\n        box-sizing: border-box;\n        /* Ensure border is inside height */\n      }\n\n      .type-icon {\n        width: 16px;\n        height: 16px;\n        margin-right: 8px;\n        flex-shrink: 0;\n        background-size: contain;\n        background-repeat: no-repeat;\n        background-position: center;\n      }\n\n      .remote-name {\n        white-space: nowrap;\n        overflow: hidden;\n        text-overflow: ellipsis;\n        color: var(--text-primary);\n        font-size: 12px;\n      }\n\n      .timeline-marker {\n        position: absolute;\n        top: 10px;\n        height: 8px;\n        min-width: 4px;\n        border-radius: 4px;\n        opacity: 0.9;\n      }\n\n      .timeline-marker.incoming {\n        background: linear-gradient(90deg, var(--accent-green), #2ea043);\n      }\n\n      .timeline-marker.outgoing {\n        background: linear-gradient(90deg, var(--accent-orange), #b08800);\n      }\n\n      /* Right Panel: Details */\n      .details-panel {\n        width: 0;\n        opacity: 0;\n        background-color: var(--bg-color);\n        border-left: 0 solid var(--border-color);\n        display: flex;\n        flex-direction: column;\n        padding: 0;\n        box-sizing: border-box;\n        overflow-y: auto;\n        overflow-x: hidden;\n        position: relative;\n        flex-shrink: 0;\n        transition: width 0.3s cubic-bezier(0.4, 0, 0.2, 1), opacity 0.2s ease,\n          padding 0.3s ease;\n      }\n\n      .details-panel.visible {\n        width: 450px;\n        opacity: 1;\n        padding: 20px;\n        border-left: 1px solid var(--border-color);\n      }\n\n      /* Header */\n      .details-header-top {\n        display: flex;\n        align-items: center;\n        justify-content: space-between;\n        margin-bottom: 10px;\n      }\n\n      .details-title-group {\n        display: flex;\n        align-items: center;\n        gap: 10px;\n      }\n\n      .details-icon-large {\n        width: 32px;\n        height: 32px;\n        background-size: contain;\n        background-repeat: no-repeat;\n        background-position: center;\n      }\n\n      .details-name-large {\n        font-size: 20px;\n        font-weight: 600;\n        color: #fff;\n      }\n\n      .details-actions {\n        display: flex;\n        align-items: center;\n        gap: 10px;\n      }\n\n      .close-btn {\n        cursor: pointer;\n        color: var(--text-secondary);\n        font-size: 20px;\n        transition: color 0.2s ease;\n        line-height: 1;\n      }\n\n      .close-btn:hover {\n        color: #fff;\n      }\n\n      /* Unified Badge Style */\n      .badge-pill {\n        padding: 4px 12px;\n        border-radius: 20px;\n        font-size: 11px;\n        font-weight: 600;\n        text-transform: uppercase;\n        border: 1px solid;\n        letter-spacing: 0.5px;\n        white-space: nowrap;\n      }\n\n      .badge-pill.incoming {\n        color: var(--accent-green);\n        border-color: var(--accent-green);\n      }\n\n      .badge-pill.outgoing {\n        color: var(--accent-orange);\n        border-color: var(--accent-orange);\n      }\n\n      .badge-pill.executor {\n        color: var(--accent-green);\n        border-color: var(--accent-green);\n      }\n\n      .badge-pill.actor {\n        color: var(--accent-red);\n        border-color: var(--accent-red);\n        background: repeating-linear-gradient(\n          45deg,\n          transparent,\n          transparent 2px,\n          rgba(255, 123, 114, 0.1) 2px,\n          rgba(255, 123, 114, 0.1) 4px\n        );\n      }\n\n      .badge-pill.blocked {\n        color: var(--accent-red);\n        border-color: var(--accent-red);\n      }\n\n      .details-path-row {\n        color: var(--text-secondary);\n        font-size: 12px;\n        margin-bottom: 20px;\n        font-family: monospace;\n        white-space: nowrap;\n        text-overflow: ellipsis;\n        overflow: hidden;\n        height: 1.2em;\n      }\n\n      .remote-path-copy {\n        cursor: pointer;\n        color: var(--text-secondary);\n        font-size: 12px;\n        font-weight: normal;\n        transition: color 0.2s ease;\n        white-space: nowrap;\n        overflow: hidden;\n        text-overflow: ellipsis;\n        display: block;\n        width: 25%;\n      }\n\n      .remote-path-copy:hover {\n        color: var(--accent-blue);\n      }\n\n      /* Info Grid 2 */\n      .info-grid-2 {\n        display: flex;\n        gap: 20px;\n        margin-bottom: 25px;\n      }\n\n      .info-item-2 h4 {\n        margin: 0 0 6px 0;\n        color: var(--text-secondary);\n        font-size: 12px;\n        font-weight: normal;\n      }\n\n      .info-item-2 div {\n        font-size: 11px;\n        color: var(--text-primary);\n        font-family: monospace;\n      }\n\n      /* Info Grid */\n      .info-grid {\n        display: grid;\n        grid-template-columns: 1fr 1fr;\n        gap: 20px;\n        margin-bottom: 25px;\n      }\n\n      .info-item h4 {\n        margin: 0 0 6px 0;\n        color: var(--text-secondary);\n        font-size: 12px;\n        font-weight: normal;\n      }\n\n      .info-item div {\n        font-size: 14px;\n        color: var(--text-primary);\n        font-family: monospace;\n      }\n\n      .clickable-path {\n        border-bottom: 1px dashed var(--text-secondary);\n        cursor: pointer;\n        transition: color 0.2s, border-color 0.2s;\n      }\n\n      .clickable-path:hover {\n        color: var(--accent-blue);\n        border-color: var(--accent-blue);\n      }\n\n      /* Content Boxes */\n      .content-box {\n        border: 1px solid var(--border-color);\n        border-radius: 8px;\n        padding: 15px;\n        margin-bottom: 20px;\n        position: relative;\n        background-color: rgba(22, 27, 34, 0.5);\n      }\n\n      .box-title {\n        position: absolute;\n        top: -10px;\n        left: 10px;\n        background-color: var(--bg-color);\n        padding: 0 5px;\n        font-size: 11px;\n        color: var(--text-secondary);\n      }\n\n      .caller-header {\n        display: flex;\n        align-items: center;\n        gap: 10px;\n        margin-bottom: 15px;\n      }\n\n      .caller-icon {\n        color: var(--text-secondary);\n        display: flex;\n        align-items: center;\n        justify-content: center;\n      }\n\n      .caller-icon svg {\n        width: 24px;\n        height: 24px;\n      }\n\n      .caller-info {\n        flex: 1;\n        min-width: 0;\n        /* Critical for flex child truncation */\n      }\n\n      .caller-name {\n        color: var(--accent-blue);\n        font-family: monospace;\n        font-size: 14px;\n        margin-bottom: 2px;\n      }\n\n      .caller-source {\n        color: var(--text-secondary);\n        font-size: 11px;\n        font-family: monospace;\n        height: 1.2em;\n        white-space: nowrap;\n        overflow: hidden;\n        text-overflow: ellipsis;\n        display: block;\n      }\n\n      .flags-row {\n        display: flex;\n        gap: 10px;\n        margin-bottom: 10px;\n        align-items: center;\n      }\n\n      .origin-row {\n        font-size: 12px;\n        color: var(--text-primary);\n        font-family: monospace;\n        display: block;\n        white-space: nowrap;\n        height: 1.2em;\n        overflow: hidden;\n        text-overflow: ellipsis;\n        width: 35%;\n      }\n\n      /* Arguments */\n      .args-content {\n        font-family: \"Consolas\", \"Monaco\", monospace;\n        font-size: 12px;\n        white-space: pre-wrap;\n        overflow-x: auto;\n        color: #e0e0e0;\n        max-height: 300px;\n        overflow-y: auto;\n        line-height: 1.5;\n      }\n\n      /* Copy Button with Animation */\n      .copy-icon-btn {\n        position: absolute;\n        top: 10px;\n        right: 10px;\n        background: transparent;\n        border: 1px solid var(--border-color);\n        border-radius: 4px;\n        color: var(--text-secondary);\n        cursor: pointer;\n        width: 28px;\n        height: 28px;\n        display: flex;\n        align-items: center;\n        justify-content: center;\n        transition: all 0.2s;\n        overflow: hidden;\n        /* Ensure check icon doesn't spill out */\n      }\n\n      .copy-icon-btn:hover {\n        border-color: var(--text-primary);\n        color: var(--text-primary);\n        background-color: var(--surface-color);\n      }\n\n      .copy-icon-btn svg {\n        width: 14px;\n        height: 14px;\n        position: absolute;\n        top: 50%;\n        left: 50%;\n        transform: translate(-50%, -50%) scale(1);\n        transition: transform 0.3s cubic-bezier(0.4, 0, 0.2, 1);\n      }\n\n      .copy-icon-btn .icon-check {\n        transform: translate(-50%, -50%) scale(0);\n        color: var(--accent-green);\n      }\n\n      .copy-icon-btn.copied .icon-copy {\n        transform: translate(-50%, -50%) scale(0);\n      }\n\n      .copy-icon-btn.copied .icon-check {\n        transform: translate(-50%, -50%) scale(1);\n      }\n\n      /* Dropdown */\n      .dropdown-menu {\n        position: absolute;\n        top: 42px;\n        /* Button height + spacing */\n        right: 10px;\n        background-color: #1c2128;\n        border: 1px solid var(--border-color);\n        border-radius: 6px;\n        width: 160px;\n        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);\n        z-index: 50;\n        display: none;\n        overflow: hidden;\n      }\n\n      .dropdown-menu.visible {\n        display: block;\n      }\n\n      .dropdown-item {\n        padding: 8px 12px;\n        font-size: 12px;\n        color: var(--text-primary);\n        cursor: pointer;\n        transition: background-color 0.2s;\n        display: flex;\n        align-items: center;\n        gap: 8px;\n      }\n\n      .dropdown-item:hover {\n        background-color: var(--accent-blue);\n        color: #fff;\n      }\n\n      .dropdown-item svg {\n        width: 14px;\n        height: 14px;\n        opacity: 0.7;\n      }\n\n      /* Toast Notification */\n      .toast-container {\n        position: fixed;\n        bottom: 30px;\n        left: 50%;\n        transform: translateX(-50%) translateY(20px);\n        background-color: #1c2128;\n        border: 1px solid var(--border-color);\n        border-radius: 6px;\n        padding: 8px 16px;\n        color: #fff;\n        font-size: 12px;\n        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.5);\n        opacity: 0;\n        transition: opacity 0.3s, transform 0.3s;\n        pointer-events: none;\n        z-index: 1000;\n        display: flex;\n        align-items: center;\n        gap: 8px;\n      }\n\n      .toast-container.visible {\n        opacity: 1;\n        transform: translateX(-50%) translateY(0);\n      }\n\n      .toast-container svg {\n        width: 16px;\n        height: 16px;\n        color: var(--accent-green);\n      }\n\n      /* Syntax Highlighting */\n      .hl-str {\n        color: #a5d6ff;\n      }\n\n      .hl-num {\n        color: #79c0ff;\n      }\n\n      .hl-bool {\n        color: #ff7b72;\n      }\n\n      .hl-key {\n        color: #7ee787;\n      }\n\n      .hl-nil {\n        color: #ff7b72;\n      }\n\n      .footer {\n        height: 25px;\n        border-top: 1px solid var(--border-color);\n        display: flex;\n        align-items: center;\n        justify-content: space-between;\n        padding: 0 20px;\n        background-color: var(--bg-color);\n        color: var(--text-secondary);\n        font-size: 11px;\n        flex-shrink: 0;\n      }\n    </style>\n  </head>\n\n  <body>\n    <div class=\"app-header\">\n      <a\n        href=\"https://github.com/notpoiu/cobalt/tree/main\"\n        target=\"_blank\"\n        style=\"text-decoration: none\"\n      >\n        <div class=\"brand\">\n          <div class=\"brand-icon\"></div>\n          Cobalt - Session Viewer\n        </div>\n      </a>\n      <div class=\"session-container\">\n        <div class=\"session-info\">\n          Session / <span class=\"session-id\">{{SESSION_ID}}</span>\n        </div>\n        <div class=\"session-tooltip\">\n          <div class=\"tooltip-row\">\n            <span class=\"tooltip-label\">Start Time (tick)</span>\n            <span class=\"tooltip-value\">{{START_TIME}}</span>\n          </div>\n          <div class=\"tooltip-row\">\n            <span class=\"tooltip-label\">Place ID</span>\n            <span class=\"tooltip-value\">{{PLACE_ID}}</span>\n          </div>\n          <div class=\"tooltip-row\">\n            <span class=\"tooltip-label\">Job ID</span>\n            <span class=\"tooltip-value\">{{JOB_ID}}</span>\n          </div>\n        </div>\n      </div>\n    </div>\n\n    <div class=\"main-container\">\n      <!-- LEFT PANEL WRAPPER -->\n      <div\n        class=\"left-panel-wrapper\"\n        style=\"\n          flex: 1;\n          display: flex;\n          flex-direction: column;\n          border-right: 1px solid var(--border-color);\n          min-width: 0;\n          overflow: hidden;\n        \"\n      >\n        <!-- SHARED TOOLBAR -->\n        <div class=\"trace-toolbar\">\n          <div\n            style=\"\n              font-size: 11px;\n              color: var(--text-secondary);\n              margin-right: 20px;\n            \"\n          >\n            Started: {{DATE}}\n          </div>\n          <div style=\"flex: 1\"></div>\n          <div class=\"view-toggle\">\n            <button class=\"view-btn active\" onclick=\"switchView('timeline')\">\n              Timeline\n            </button>\n            <button class=\"view-btn\" onclick=\"switchView('heatmap')\">\n              Heatmap\n            </button>\n          </div>\n          <div class=\"divider\"></div>\n          <div class=\"search-widget\">\n            <div class=\"search-row\">\n              <div\n                class=\"search-chevron\"\n                onclick=\"toggleSearchOptions()\"\n                id=\"searchChevron\"\n              >\n                <svg\n                  width=\"16\"\n                  height=\"16\"\n                  viewBox=\"0 0 16 16\"\n                  fill=\"currentColor\"\n                >\n                  <path\n                    d=\"M6 4l4 4-4 4\"\n                    stroke=\"currentColor\"\n                    stroke-width=\"1.5\"\n                    fill=\"none\"\n                  />\n                </svg>\n              </div>\n              <div class=\"search-input-container\">\n                <input\n                  type=\"text\"\n                  class=\"search-input\"\n                  id=\"filterInput\"\n                  placeholder=\"Filter events...\"\n                  oninput=\"handleFilterInput()\"\n                />\n              </div>\n            </div>\n            <div class=\"search-options\" id=\"searchOptions\">\n              <div class=\"time-range-row\">\n                <span>Time Range:</span>\n                <input\n                  type=\"number\"\n                  class=\"time-input-styled\"\n                  id=\"minTimeInput\"\n                  placeholder=\"Start\"\n                  oninput=\"handleTimeInput()\"\n                />\n                <span>-</span>\n                <input\n                  type=\"number\"\n                  class=\"time-input-styled\"\n                  id=\"maxTimeInput\"\n                  placeholder=\"End\"\n                  oninput=\"handleTimeInput()\"\n                />\n                <select\n                  class=\"unit-select\"\n                  id=\"timeUnitSelect\"\n                  onchange=\"handleTimeInput()\"\n                >\n                  <option value=\"1\">s</option>\n                  <option value=\"0.001\">ms</option>\n                </select>\n              </div>\n              <div class=\"filter-options-row\">\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterIncoming\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Incoming</label\n                >\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterOutgoing\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Outgoing</label\n                >\n                <div\n                  style=\"\n                    width: 1px;\n                    height: 14px;\n                    background: var(--border-color);\n                    margin: 0 4px;\n                  \"\n                ></div>\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterActor\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Actor</label\n                >\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterNonActor\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Non-Actor</label\n                >\n                <div\n                  style=\"\n                    width: 1px;\n                    height: 14px;\n                    background: var(--border-color);\n                    margin: 0 4px;\n                  \"\n                ></div>\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterArgs\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Args</label\n                >\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterProto\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Proto</label\n                >\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterConst\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Const</label\n                >\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterHash\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Hash</label\n                >\n                <label class=\"filter-checkbox-label\"\n                  ><input\n                    type=\"checkbox\"\n                    class=\"filter-checkbox\"\n                    id=\"filterSource\"\n                    onchange=\"handleFilterInput()\"\n                  />\n                  Source</label\n                >\n              </div>\n            </div>\n          </div>\n        </div>\n\n        <!-- TIMELINE VIEW -->\n        <div class=\"trace-panel\" id=\"timelinePanel\" style=\"border-right: none\">\n          <div class=\"trace-header-row\">\n            <div class=\"col-list\">Remote</div>\n            <div class=\"col-timeline\" id=\"timelineHeader\">\n              <div class=\"timeline-ruler\" id=\"ruler\"></div>\n            </div>\n          </div>\n\n          <div class=\"trace-rows\" id=\"rowsContainer\">\n            <div id=\"virtualSpacer\" class=\"virtual-spacer\"></div>\n            <div id=\"virtualContent\" class=\"virtual-content\"></div>\n          </div>\n        </div>\n\n        <!-- HEATMAP VIEW -->\n        <div class=\"heatmap-container\" id=\"heatmapPanel\">\n          <div\n            id=\"heatmapScroll\"\n            style=\"\n              width: 100%;\n              height: 100%;\n              overflow-x: auto;\n              overflow-y: hidden;\n              position: relative;\n            \"\n          >\n            <div\n              id=\"heatmapSpacer\"\n              style=\"\n                height: 1px;\n                width: 100%;\n                position: absolute;\n                top: 0;\n                left: 0;\n                pointer-events: none;\n              \"\n            ></div>\n            <canvas\n              id=\"heatmapCanvas\"\n              class=\"heatmap-canvas\"\n              style=\"\n                position: sticky;\n                left: 0;\n                top: 0;\n                width: 100%;\n                height: 100%;\n              \"\n            ></canvas>\n          </div>\n          <div\n            id=\"heatmapTooltip\"\n            class=\"heatmap-tooltip\"\n            style=\"\n              display: none;\n              position: absolute;\n              background: #1c2128;\n              border: 1px solid #30363d;\n              padding: 4px 8px;\n              border-radius: 4px;\n              font-size: 11px;\n              color: #c9d1d9;\n              pointer-events: none;\n              z-index: 100;\n            \"\n          ></div>\n        </div>\n      </div>\n\n      <!-- RIGHT PANEL -->\n      <div class=\"details-panel\" id=\"detailsPanel\">\n        <div id=\"detailsContent\"></div>\n      </div>\n    </div>\n\n    <div class=\"footer\">\n      <div>Ended: {{END_DATE}}</div>\n      <span\n        id=\"statsLabel\"\n        style=\"\n          color: var(--text-secondary);\n          font-size: 11px;\n          margin-right: 10px;\n        \"\n      >\n        {{EVENT_COUNT}} Events \226\128\162 {{TOTAL_DURATION}}s\n      </span>\n    </div>\n\n    <!-- Toast Notification -->\n    <div id=\"toast\" class=\"toast-container\">\n      <svg\n        xmlns=\"http://www.w3.org/2000/svg\"\n        width=\"24\"\n        height=\"24\"\n        viewBox=\"0 0 24 24\"\n        fill=\"none\"\n        stroke=\"currentColor\"\n        stroke-width=\"2\"\n        stroke-linecap=\"round\"\n        stroke-linejoin=\"round\"\n        class=\"lucide lucide-check\"\n      >\n        <path d=\"M20 6 9 17l-5-5\" />\n      </svg>\n      <span id=\"toastMessage\">Copied to clipboard</span>\n    </div>\n\n    <!-- Data Script -->\n    <script type=\"application/json\" id=\"dictionary-data\">\n      {{DICTIONARY_JSON}}\n    </script>\n    <script type=\"application/json\" id=\"event-data\">\n      {{EVENTS_JSON}}\n    </script>\n\n    <script>\n      // Data Parsing\n      let startTime = {{START_TIME}}; // Seconds\n      const totalDuration = {{DURATION}};\n      const dictionary = JSON.parse(document.getElementById('dictionary-data').textContent);\n      const rawEvents = JSON.parse(document.getElementById('event-data').textContent);\n\n      // Reconstruct Events\n      const allEvents = rawEvents.map(e => ({\n        name: dictionary[e[0]],\n        className: dictionary[e[1]],\n        path: dictionary[e[2]],\n        type: dictionary[e[3]],\n        timestamp: e[4],\n        origin: dictionary[e[5]],\n\n        args: dictionary[e[6]],\n        method: dictionary[e[7]],\n\n        funcName: dictionary[e[8]],\n        funcLine: e[9],\n        funcSource: dictionary[e[10]],\n        isExecutor: e[11] === 1,\n        isActor: e[12] === 1,\n\n        funcHash: dictionary[e[13]],\n        upvalues: dictionary[e[14]],\n        protos: dictionary[e[15]],\n        constants: dictionary[e[16]],\n        isBlocked: e[17] === 1\n      }));\n\n      if (allEvents.length > 0) {\n        const minTimestamp = Math.min(...allEvents.map(e => e.timestamp));\n        if (minTimestamp < startTime) {\n          startTime = minTimestamp;\n        }\n      }\n\n      // Preprocess events\n      allEvents.forEach(evt => {\n        evt.relTime = Math.max(0, evt.timestamp - startTime);\n\n        const typeLower = evt.type.toLowerCase();\n        const methodLower = evt.method ? evt.method.toLowerCase() : '';\n\n        if (methodLower.includes('client') || typeLower.includes('client')) {\n          evt.typeClass = 'incoming';\n        } else {\n          evt.typeClass = 'outgoing';\n        }\n      });\n\n      // State\n      let filteredEvents = allEvents;\n      let zoomLevel = 1;\n      let selectedEvent = null;\n      let filterTimeout = null;\n      let filterMinTime = 0;\n      let filterMaxTime = totalDuration;\n\n      // Initialize Time Inputs\n      document.getElementById('minTimeInput').value = \"0\";\n      document.getElementById('maxTimeInput').value = totalDuration.toFixed(2);\n\n      // Virtual Scroll State\n      let lastStartIndex = -1;\n      let lastEndIndex = -1;\n      let isScrolling = false;\n\n      // DOM Elements\n      const rowsContainer = document.getElementById('rowsContainer');\n      const virtualSpacer = document.getElementById('virtualSpacer');\n      const virtualContent = document.getElementById('virtualContent');\n      const rulerContainer = document.getElementById('ruler');\n      const detailsPanel = document.getElementById('detailsPanel');\n      const detailsContent = document.getElementById('detailsContent');\n      const timelineHeader = document.getElementById('timelineHeader');\n      const statsLabel = document.getElementById('statsLabel');\n\n\n      // Heatmap State\n      let currentView = 'timeline';\n      let heatmapZoom = 1;\n      let detailsWasVisible = false;\n      const heatmapCanvas = document.getElementById('heatmapCanvas');\n      const heatmapTooltip = document.getElementById('heatmapTooltip');\n\n      const timelinePanel = document.getElementById('timelinePanel');\n      const heatmapPanel = document.getElementById('heatmapPanel');\n\n      // Heatmap Interaction\n      heatmapCanvas.addEventListener('wheel', (e) => {\n        if (currentView !== 'heatmap') return;\n        e.preventDefault();\n\n        const delta = e.deltaY > 0 ? 1.1 : 0.9;\n        heatmapZoom = Math.max(1, Math.min(50, heatmapZoom * delta));\n        renderHeatmap();\n      }, { passive: false });\n\n      heatmapCanvas.addEventListener('mousemove', (e) => {\n        if (currentView !== 'heatmap') return;\n        const rect = heatmapCanvas.getBoundingClientRect();\n        const x = e.clientX - rect.left;\n        const y = e.clientY - rect.top;\n\n        if (!window.lastHeatmapData) return;\n\n        const { sortedRemotes, rowHeight, binWidth, remotes, maxBinCount, timeBins, binDuration, margin, scrollLeft } = window.lastHeatmapData;\n        const width = heatmapPanel.clientWidth;\n        const height = heatmapPanel.clientHeight;\n\n        if (x < margin.left || x > width - margin.right || y < margin.top || y > height - margin.bottom) {\n          heatmapTooltip.style.display = 'none';\n          return;\n        }\n\n        const rowIndex = Math.floor((y - margin.top) / rowHeight);\n\n        // Calculate colIndex based on virtual position (x + scrollLeft)\n        const colIndex = Math.floor((x - margin.left + scrollLeft) / binWidth);\n\n        if (rowIndex >= 0 && rowIndex < sortedRemotes.length && colIndex >= 0 && colIndex < timeBins) {\n          const remote = sortedRemotes[rowIndex];\n          // Calculate count for this bin\n          let count = 0;\n          remotes[remote].forEach(evt => {\n            const binIndex = Math.min(Math.floor(evt.relTime / binDuration), timeBins - 1);\n            if (binIndex === colIndex) count++;\n          });\n\n          heatmapTooltip.style.display = 'block';\n          heatmapTooltip.innerHTML = `<b>${remote}</b><br>Time: ${(colIndex * binDuration).toFixed(1)}s<br>Count: ${count}`;\n\n          const tooltipWidth = heatmapTooltip.offsetWidth;\n          const panelWidth = heatmapPanel.clientWidth;\n\n          let leftPos = x + 10;\n          if (leftPos + tooltipWidth > panelWidth - 10) {\n            leftPos = x - tooltipWidth - 10;\n          }\n\n          heatmapTooltip.style.left = leftPos + 'px';\n          heatmapTooltip.style.top = (y + 10) + 'px';\n        } else {\n          heatmapTooltip.style.display = 'none';\n        }\n      });\n\n      heatmapCanvas.addEventListener('mouseleave', () => {\n        heatmapTooltip.style.display = 'none';\n      });\n\n      document.getElementById('heatmapScroll').addEventListener('scroll', () => {\n        if (currentView === 'heatmap') {\n          renderHeatmap();\n        }\n      });\n\n      function switchView(view) {\n        currentView = view;\n        document.querySelectorAll('.view-btn').forEach(btn => {\n          btn.classList.toggle('active', btn.innerText.toLowerCase() === view);\n        });\n\n        if (view === 'timeline') {\n          timelinePanel.style.display = 'flex';\n          heatmapPanel.classList.remove('visible');\n\n          if (detailsWasVisible) {\n            detailsPanel.classList.add('visible');\n          }\n\n          renderVirtualRows(true);\n        } else {\n          if (detailsPanel.classList.contains('visible')) {\n            detailsWasVisible = true;\n            detailsPanel.classList.remove('visible');\n          } else {\n            detailsWasVisible = false;\n          }\n\n          timelinePanel.style.display = 'none';\n          heatmapPanel.classList.add('visible');\n          renderHeatmap();\n        }\n      }\n\n      function renderHeatmap() {\n        const ctx = heatmapCanvas.getContext('2d');\n        const containerWidth = heatmapPanel.clientWidth;\n        const height = heatmapPanel.clientHeight;\n        const scrollLeft = document.getElementById('heatmapScroll').scrollLeft;\n\n        // Calculate total virtual width\n        const totalWidth = containerWidth * heatmapZoom;\n\n        // Update Spacer\n        document.getElementById('heatmapSpacer').style.width = totalWidth + 'px';\n\n        const dpr = window.devicePixelRatio || 1;\n\n        // Canvas is always viewport size\n        heatmapCanvas.width = containerWidth * dpr;\n        heatmapCanvas.height = height * dpr;\n        ctx.scale(dpr, dpr);\n\n        ctx.fillStyle = '#0d1117';\n        ctx.fillRect(0, 0, containerWidth, height);\n\n        if (filteredEvents.length === 0) return;\n\n        const remotes = {};\n        filteredEvents.forEach(evt => {\n          if (!remotes[evt.name]) remotes[evt.name] = [];\n          remotes[evt.name].push(evt);\n        });\n\n        const sortedRemotes = Object.keys(remotes).sort((a, b) => remotes[b].length - remotes[a].length);\n\n        const margin = { top: 30, right: 20, bottom: 20, left: 150 };\n\n        // Virtual chart width\n        const chartWidth = totalWidth - margin.left - margin.right;\n        const chartHeight = height - margin.top - margin.bottom;\n\n        // Apply Zoom to time bins\n        const timeBins = Math.floor(100 * heatmapZoom);\n        const binWidth = chartWidth / timeBins;\n        const binDuration = totalDuration / timeBins;\n\n        // Adjust row height to fit\n        const rowHeight = Math.min(30, chartHeight / sortedRemotes.length);\n\n        // Store data for tooltip (adjusted for virtual scroll)\n        window.lastHeatmapData = { sortedRemotes, rowHeight, binWidth, remotes, timeBins, binDuration, margin, scrollLeft };\n\n        ctx.strokeStyle = '#30363d';\n        ctx.lineWidth = 1;\n\n        ctx.font = '11px -apple-system, BlinkMacSystemFont, \"Segoe UI\", Helvetica, Arial, sans-serif';\n        ctx.textAlign = 'right';\n        ctx.textBaseline = 'middle';\n\n        let maxBinCount = 0;\n        sortedRemotes.forEach(remote => {\n          const bins = new Array(timeBins).fill(0);\n          remotes[remote].forEach(evt => {\n            const binIndex = Math.min(Math.floor(evt.relTime / binDuration), timeBins - 1);\n            bins[binIndex]++;\n          });\n          maxBinCount = Math.max(maxBinCount, ...bins);\n        });\n\n        // Update Legend Labels\n        window.lastHeatmapData.maxBinCount = maxBinCount;\n        window.lastHeatmapData.maxBinCount = maxBinCount;\n\n        sortedRemotes.forEach((remote, i) => {\n          const y = margin.top + (i * rowHeight);\n\n          // Draw Label (Fixed position)\n          ctx.fillStyle = '#8b949e';\n          ctx.fillText(remote.length > 20 ? remote.slice(0, 18) + '...' : remote, margin.left - 10, y + rowHeight / 2);\n\n          // Draw Line\n          ctx.beginPath();\n          ctx.moveTo(margin.left, y);\n          ctx.lineTo(containerWidth - margin.right, y);\n          ctx.stroke();\n\n          const bins = new Array(timeBins).fill(0);\n          remotes[remote].forEach(evt => {\n            const binIndex = Math.min(Math.floor(evt.relTime / binDuration), timeBins - 1);\n            bins[binIndex]++;\n          });\n\n          bins.forEach((count, binIndex) => {\n            if (count === 0) return;\n\n            // Calculate virtual X\n            const virtualX = margin.left + (binIndex * binWidth);\n\n            // Apply scroll offset\n            const screenX = virtualX - scrollLeft;\n\n            // Only draw if visible\n            if (screenX + binWidth < margin.left || screenX > containerWidth - margin.right) return;\n\n            // Clamp to chart area\n            const drawX = Math.max(margin.left, screenX);\n            const drawWidth = Math.min(binWidth, (containerWidth - margin.right) - drawX);\n\n            const intensity = count / maxBinCount;\n            const hue = (1 - intensity) * 240;\n            ctx.fillStyle = `hsla(${hue}, 70%, 50%, 0.8)`;\n\n            ctx.fillRect(drawX, y + 2, drawWidth - 1, rowHeight - 4);\n          });\n        });\n\n        ctx.fillStyle = '#8b949e';\n        ctx.textAlign = 'center';\n        ctx.textBaseline = 'top';\n\n        const numTicks = 5 * Math.ceil(heatmapZoom);\n\n        for (let i = 0; i <= numTicks; i++) {\n          const virtualX = margin.left + (chartWidth * (i / numTicks));\n          const screenX = virtualX - scrollLeft;\n\n          if (screenX < margin.left || screenX > containerWidth - margin.right) continue;\n\n          const time = (totalDuration * (i / numTicks)).toFixed(1) + 's';\n          ctx.fillText(time, screenX, margin.top - 20);\n\n          ctx.beginPath();\n          ctx.moveTo(screenX, margin.top);\n          ctx.lineTo(screenX, height - margin.bottom);\n          ctx.stroke();\n        }\n      }\n\n      // Resize observer for heatmap\n      new ResizeObserver(() => {\n        if (currentView === 'heatmap' && heatmapPanel.classList.contains('visible')) {\n          renderHeatmap();\n        }\n      }).observe(heatmapPanel);\n\n      // Window resize handler for timeline\n      window.addEventListener('resize', () => {\n        if (currentView === 'timeline') {\n          renderVirtualRows(true);\n          renderRuler();\n        }\n      });\n\n      // Virtual Scroll Config\n      const ROW_HEIGHT = 29; // 28px + 1px border\n      const BUFFER_SIZE = 5;\n\n      function formatTime(seconds) {\n        if (seconds < 1) return (seconds * 1000).toFixed(1) + 'ms';\n        return seconds.toFixed(2) + 's';\n      }\n\n      function formatAbsTime(timestamp) {\n        const date = new Date(timestamp * 1000);\n        return date.toLocaleTimeString();\n      }\n\n      function getIconUrl(className) {\n        return `https://robloxapi.github.io/ref/icons/dark/${className}.png`;\n      }\n\n      function escapeHtml(text) {\n        if (!text) return '';\n        return text\n          .replace(/&/g, \"&amp;\")\n          .replace(/</g, \"&lt;\")\n          .replace(/>/g, \"&gt;\")\n          .replace(/\"/g, \"&quot;\")\n          .replace(/'/g, \"&#039;\");\n      }\n\n      function syntaxHighlight(text) {\n        if (!text) return '';\n\n        text = escapeHtml(text);\n        return text\n          .replace(/&quot;((?:[^&]|&(?!(quot;)))*)&quot;/g, '<span class=\"hl-str\">\"$1\"</span>')\n          .replace(/\\b(\\d+(\\.\\d+)?)\\b/g, '<span class=\"hl-num\">$1</span>')\n          .replace(/\\b(true|false)\\b/g, '<span class=\"hl-bool\">$1</span>')\n          .replace(/\\b(nil)\\b/g, '<span class=\"hl-nil\">$1</span>');\n      }\n\n      // Toast Logic\n      function showToast(message) {\n        const toast = document.getElementById('toast');\n        const msgSpan = document.getElementById('toastMessage');\n        msgSpan.innerText = message;\n        toast.classList.add('visible');\n        setTimeout(() => {\n          toast.classList.remove('visible');\n        }, 2000);\n      }\n\n      function copyText(text, message = \"Copied to clipboard\") {\n        navigator.clipboard.writeText(text).then(() => {\n          showToast(message);\n        });\n      }\n\n      function copyArgs(btn) {\n        if (selectedEvent) {\n          navigator.clipboard.writeText(selectedEvent.args).then(() => {\n            btn.classList.add('copied');\n            setTimeout(() => btn.classList.remove('copied'), 2000);\n          });\n        }\n      }\n\n      function toggleCallerDropdown(e) {\n        e.stopPropagation();\n        const menu = document.getElementById('callerDropdown');\n        if (menu) {\n          menu.classList.toggle('visible');\n        }\n      }\n\n      function copyCallerData(type) {\n        if (!selectedEvent) return;\n        let text = \"\";\n        let msg = \"Copied to clipboard\";\n        switch (type) {\n          case 'hash':\n            text = selectedEvent.funcHash || \"N/A\";\n            msg = \"Function Hash copied\";\n            break;\n          case 'upvalues':\n            text = selectedEvent.upvalues || \"{}\";\n            msg = \"Upvalues copied\";\n            break;\n          case 'protos':\n            text = selectedEvent.protos || \"[]\";\n            msg = \"Protos copied\";\n            break;\n          case 'path':\n            text = selectedEvent.origin || \"N/A\";\n            msg = \"Script Path copied\";\n            break;\n          case 'source':\n            text = selectedEvent.funcSource || \"N/A\";\n            msg = \"Source copied\";\n            break;\n        }\n        copyText(text, msg);\n        document.getElementById('callerDropdown').classList.remove('visible');\n      }\n\n      // Render Ruler\n      function renderRuler() {\n        rulerContainer.innerHTML = '';\n        const tickCount = Math.max(5, Math.floor(5 * zoomLevel));\n        for (let i = 0; i <= tickCount; i++) {\n          const pct = (i / tickCount) * 100;\n          const time = (totalDuration * (i / tickCount));\n          const tick = document.createElement('div');\n          tick.className = 'tick';\n          tick.style.left = pct + '%';\n          tick.innerText = formatTime(time);\n          rulerContainer.appendChild(tick);\n        }\n      }\n\n      // Scroll Sync\n      rowsContainer.addEventListener('scroll', () => {\n        timelineHeader.scrollLeft = rowsContainer.scrollLeft;\n      });\n\n      // Virtual Rendering\n      function renderVirtualRows(force = false) {\n        const scrollTop = rowsContainer.scrollTop;\n        const containerHeight = rowsContainer.clientHeight;\n\n        const totalHeight = filteredEvents.length * ROW_HEIGHT;\n        virtualSpacer.style.height = totalHeight + 'px';\n\n        const startIndex = Math.floor(scrollTop / ROW_HEIGHT);\n        const endIndex = Math.min(filteredEvents.length, Math.ceil((scrollTop + containerHeight) / ROW_HEIGHT) + BUFFER_SIZE);\n\n        if (!force && startIndex === lastStartIndex && endIndex === lastEndIndex) {\n          return;\n        }\n\n        lastStartIndex = startIndex;\n        lastEndIndex = endIndex;\n\n        const visibleEvents = filteredEvents.slice(Math.max(0, startIndex - BUFFER_SIZE), endIndex);\n        const startOffset = Math.max(0, startIndex - BUFFER_SIZE) * ROW_HEIGHT;\n\n        virtualContent.style.transform = `translateY(${startOffset}px)`;\n\n        const fragment = document.createDocumentFragment();\n        const zoomWidth = (100 * zoomLevel) + '%';\n\n        // Sync Ruler Width\n        document.getElementById('ruler').style.width = zoomWidth;\n\n        visibleEvents.forEach((evt) => {\n          const row = document.createElement('div');\n          row.className = 'trace-row';\n          if (selectedEvent === evt) row.classList.add('selected');\n\n          row.evtData = evt;\n          row.onclick = function () { selectRow(this, evt); };\n\n          const listCol = document.createElement('div');\n          listCol.className = 'row-list';\n          listCol.innerHTML = `\n                    <div class=\"type-icon\" style=\"background-image: url('${getIconUrl(evt.className)}')\"></div>\n                    <div class=\"remote-name\" title=\"${evt.name}\">${evt.name}</div>\n                `;\n\n          const timelineCol = document.createElement('div');\n          timelineCol.className = 'row-timeline';\n          timelineCol.style.width = zoomWidth;\n          timelineCol.style.flex = 'none';\n\n          const marker = document.createElement('div');\n          marker.className = `timeline-marker ${evt.typeClass}`;\n\n          let leftPct = ((evt.relTime) / totalDuration) * 100;\n          if (leftPct > 99) leftPct = 99;\n\n          let widthPct = (0.05 / totalDuration) * 100;\n          if (widthPct < 1) widthPct = 1;\n\n          marker.style.left = leftPct + '%';\n          marker.style.width = widthPct + '%';\n\n          timelineCol.appendChild(marker);\n          row.appendChild(listCol);\n          row.appendChild(timelineCol);\n          fragment.appendChild(row);\n        });\n\n        virtualContent.innerHTML = '';\n        virtualContent.appendChild(fragment);\n      }\n\n      // Ctrl+F Handler\n      document.addEventListener('keydown', function (e) {\n        if ((e.ctrlKey || e.metaKey) && e.key === 'f') {\n          e.preventDefault();\n          const filterInput = document.getElementById('filterInput');\n          filterInput.focus();\n          filterInput.select();\n        }\n      });\n\n      // Initial Render\n      renderVirtualRows();\n      renderRuler();\n\n      function selectRow(el, evt) {\n        const prev = virtualContent.querySelector('.trace-row.selected');\n        if (prev) prev.classList.remove('selected');\n\n        el.classList.add('selected');\n        selectedEvent = evt;\n\n        detailsPanel.classList.add('visible');\n\n        const isIncoming = evt.typeClass === 'incoming';\n        const badgeClass = isIncoming ? 'incoming' : 'outgoing';\n\n        // Flags with Unified Style\n        let flagsHtml = '';\n        if (evt.isExecutor) {\n          flagsHtml += `<div class=\"badge-pill executor\">Executor</div>`;\n        }\n        if (evt.isActor) {\n          flagsHtml += `<div class=\"badge-pill actor\">Actor</div>`;\n        }\n        if (evt.isBlocked) {\n          flagsHtml += `<div class=\"badge-pill blocked\">Blocked</div>`;\n        }\n        if (!flagsHtml) flagsHtml = '<span style=\"color:var(--text-secondary); font-size:11px;\">None</span>';\n\n        const highlightedArgs = syntaxHighlight(evt.args);\n\n        // Icons\n        const copyIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-copy icon-copy\"><rect width=\"14\" height=\"14\" x=\"8\" y=\"8\" rx=\"2\" ry=\"2\"/><path d=\"M4 16c-1.1 0-2-.9-2-2V4c0-1.1.9-2 2-2h10c1.1 0 2 .9 2 2\"/></svg>`;\n        const checkIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-check icon-check\"><path d=\"M20 6 9 17l-5-5\"/></svg>`;\n        const parenthesesIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-parentheses\"><path d=\"M8 21s-4-3-4-9 4-9 4-9\"/><path d=\"M16 3s4 3 4 9-4 9-4 9\"/></svg>`;\n\n        // Dropdown Icons\n        const hashIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-hash\"><line x1=\"4\" x2=\"20\" y1=\"9\" y2=\"9\"/><line x1=\"4\" x2=\"20\" y1=\"15\" y2=\"15\"/><line x1=\"10\" x2=\"8\" y1=\"3\" y2=\"21\"/><line x1=\"16\" x2=\"14\" y1=\"3\" y2=\"21\"/></svg>`;\n        const upvaluesIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-a-arrow-up\"><path d=\"m14 11 4-4 4 4\"/><path d=\"M18 16V7\"/><path d=\"m2 16 4.039-9.69a.5.5 0 0 1 .923 0L11 16\"/><path d=\"M3.304 13h6.392\"/></svg>`;\n        const protosIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-square-function\"><rect width=\"18\" height=\"18\" x=\"3\" y=\"3\" rx=\"2\" ry=\"2\"/><path d=\"M9 17c2 0 2.8-1 2.8-2.8V10c0-2 1-3.3 3.2-3\"/><path d=\"M9 11.2h5.7\"/></svg>`;\n        const pathIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-route\"><circle cx=\"6\" cy=\"19\" r=\"3\"/><path d=\"M9 19h8.5a3.5 3.5 0 0 0 0-7h-11a3.5 3.5 0 0 1 0-7H15\"/><circle cx=\"18\" cy=\"5\" r=\"3\"/></svg>`;\n        const sourceIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-code\"><path d=\"m16 18 6-6-6-6\"/><path d=\"m8 6-6 6 6 6\"/></svg>`;\n        const boxIcon = `<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"24\" height=\"24\" viewBox=\"0 0 24 24\" fill=\"none\" stroke=\"currentColor\" stroke-width=\"2\" stroke-linecap=\"round\" stroke-linejoin=\"round\" class=\"lucide lucide-box\"><path d=\"M21 8a2 2 0 0 0-1-1.73l-7-4a2 2 0 0 0-2 0l-7 4A2 2 0 0 0 3 8v8a2 2 0 0 0 1 1.73l7 4a2 2 0 0 0 2 0l7-4A2 2 0 0 0 21 16Z\"/><path d=\"m3.3 7 8.7 5 8.7-5\"/><path d=\"M12 22v-9\"/></svg>`;\n\n        detailsContent.innerHTML = `\n                <div class=\"details-header-top\">\n                    <div class=\"details-title-group\">\n                        <div class=\"details-icon-large\" style=\"background-image: url('${getIconUrl(evt.className)}')\"></div>\n                        <div class=\"details-name-large\">${escapeHtml(evt.name)}</div>\n                    </div>\n                    <div class=\"details-actions\">\n                        <div class=\"badge-pill ${badgeClass}\">${evt.typeClass.toUpperCase()}</div>\n                        <div class=\"close-btn\" onclick=\"closeDetails()\">\195\151</div>\n                    </div>\n                </div>\n\n                <div class=\"details-path-row\" onclick=\"copyText('${escapeHtml(evt.path).replace(/'/g, \"\\\\'\").replace(/\"/g, \"&quot;\")}', 'Remote Path copied')\" title=\"Click to copy path\"><span class=\"clickable-path\">${escapeHtml(evt.path)}</span></div>\n\n                <div class=\"info-grid\">\n                    <div class=\"info-item\">\n                        <h4>Method</h4>\n                        <div>${escapeHtml(evt.method)}</div>\n                    </div>\n                    <div class=\"info-item\">\n                        <h4>Timestamp</h4>\n                        <div>${formatAbsTime(evt.timestamp)} <span style=\"color:var(--text-secondary)\">(+${formatTime(evt.relTime)})</span></div>\n                    </div>\n                    <div class=\"info-item\">\n                        <h4>ClassName</h4>\n                        <div>${escapeHtml(evt.className)}</div>\n                    </div>\n                    <div class=\"info-item\">\n                        <h4>Remote Path</h4>\n                        <div class=\"remote-path-copy clickable-path\" onclick=\"copyText('${escapeHtml(evt.path).replace(/'/g, \"\\\\'\").replace(/\"/g, \"&quot;\")}', 'Remote Path copied')\" title=\"Click to copy path\">${escapeHtml(evt.path)}</div>\n                    </div>\n                </div>\n\n                <div class=\"content-box\">\n                    <div class=\"box-title\">Caller Data</div>\n                    <button class=\"copy-icon-btn\" onclick=\"toggleCallerDropdown(event)\" title=\"Copy Caller Info\">${copyIcon}</button>\n\n                    <div id=\"callerDropdown\" class=\"dropdown-menu\">\n                        <div class=\"dropdown-item\" onclick=\"copyCallerData('hash')\">${hashIcon} Function Hash</div>\n                        <div class=\"dropdown-item\" onclick=\"copyCallerData('upvalues')\">${upvaluesIcon} Upvalues</div>\n                        <div class=\"dropdown-item\" onclick=\"copyCallerData('protos')\">${protosIcon} Protos</div>\n                        <div class=\"dropdown-item\" onclick=\"copyCallerData('constants')\">${boxIcon} Constants</div>\n                        <div class=\"dropdown-item\" onclick=\"copyCallerData('path')\">${pathIcon} Script Path</div>\n                        <div class=\"dropdown-item\" onclick=\"copyCallerData('source')\">${sourceIcon} Func Source</div>\n                    </div>\n\n                    <div class=\"caller-header\">\n                        <div class=\"caller-icon\">${parenthesesIcon}</div>\n                        <div class=\"caller-info\">\n                            <div class=\"caller-name\">${escapeHtml(evt.funcName)} <span class=\"caller-source\">:${evt.funcLine}</span></div>\n                            <div class=\"caller-source\">${escapeHtml(evt.funcSource)}</div>\n                        </div>\n                    </div>\n\n                    <div class=\"info-grid-2\" style=\"margin-bottom:0; gap:10px;\">\n                         <div class=\"info-item-2\" style=\"margin-right: 100px;\">\n                            <h4>Flags</h4>\n                            <div class=\"flags-row\">${flagsHtml}</div>\n                         </div>\n                         <div class=\"info-item-2\">\n                            <h4>Origin</h4>\n                            <div class=\"origin-row clickable-path\" onclick=\"copyText('${escapeHtml(evt.origin).replace(/'/g, \"\\\\'\").replace(/\"/g, \"&quot;\")}', 'Origin copied')\" title=\"Click to copy origin\">${escapeHtml(evt.origin)}</div>\n                         </div>\n                    </div>\n                </div>\n\n                <div class=\"content-box\">\n                    <div class=\"box-title\">Arguments</div>\n                    <button class=\"copy-icon-btn\" onclick=\"copyArgs(this)\" title=\"Copy Arguments\">\n                        ${copyIcon}\n                        ${checkIcon}\n                    </button>\n                    <div class=\"args-content\">${highlightedArgs}</div>\n                </div>\n            `;\n      }\n\n      function closeDetails() {\n        detailsPanel.classList.remove('visible');\n        const prev = virtualContent.querySelector('.trace-row.selected');\n        if (prev) prev.classList.remove('selected');\n        selectedEvent = null;\n      }\n\n      function handleFilterInput() {\n        if (filterTimeout) clearTimeout(filterTimeout);\n        filterTimeout = setTimeout(applyFilters, 300);\n      }\n\n      function toggleSearchOptions() {\n        const widget = document.getElementById('searchChevron').closest('.search-widget');\n        const options = document.getElementById('searchOptions');\n        const chevron = document.getElementById('searchChevron');\n\n        options.classList.toggle('visible');\n        chevron.classList.toggle('expanded');\n        widget.classList.toggle('expanded');\n      }\n\n      function handleTimeInput() {\n        const minVal = parseFloat(document.getElementById('minTimeInput').value);\n        const maxVal = parseFloat(document.getElementById('maxTimeInput').value);\n        const unit = parseFloat(document.getElementById('timeUnitSelect').value);\n\n        filterMinTime = isNaN(minVal) ? 0 : minVal * unit;\n        filterMaxTime = isNaN(maxVal) ? totalDuration : maxVal * unit;\n\n        if (filterTimeout) clearTimeout(filterTimeout);\n        filterTimeout = setTimeout(applyFilters, 300);\n      }\n\n      function applyFilters() {\n        const query = document.getElementById('filterInput').value.toLowerCase();\n        const checkIncoming = document.getElementById('filterIncoming').checked;\n        const checkOutgoing = document.getElementById('filterOutgoing').checked;\n        const checkActor = document.getElementById('filterActor').checked;\n        const checkNonActor = document.getElementById('filterNonActor').checked;\n        const checkArgs = document.getElementById('filterArgs').checked;\n        const checkProto = document.getElementById('filterProto').checked;\n        const checkConst = document.getElementById('filterConst').checked;\n        const checkHash = document.getElementById('filterHash').checked;\n        const checkSource = document.getElementById('filterSource').checked;\n\n        filteredEvents = allEvents.filter(evt => {\n          // Filter by Type (Incoming/Outgoing)\n          if (checkIncoming || checkOutgoing) {\n            const isIncoming = evt.typeClass === 'incoming';\n            const isOutgoing = evt.typeClass === 'outgoing';\n            if (!((checkIncoming && isIncoming) || (checkOutgoing && isOutgoing))) {\n              return false;\n            }\n          }\n\n          // Filter by Actor Status\n          if (checkActor || checkNonActor) {\n            const isActor = evt.isActor;\n            const isNonActor = !evt.isActor;\n            if (!((checkActor && isActor) || (checkNonActor && isNonActor))) {\n              return false;\n            }\n          }\n\n          let matchesText = !query;\n\n          if (!matchesText) {\n            // Default search: Name and Type\n            if (evt.name.toLowerCase().includes(query) || evt.type.toLowerCase().includes(query)) {\n              matchesText = true;\n            }\n            // Advanced search options\n            else {\n              if (checkArgs && evt.args && evt.args.toLowerCase().includes(query)) matchesText = true;\n              else if (checkProto && evt.protos && evt.protos.toLowerCase().includes(query)) matchesText = true;\n              else if (checkConst && evt.constants && evt.constants.toLowerCase().includes(query)) matchesText = true;\n              else if (checkHash && evt.funcHash && evt.funcHash.toLowerCase().includes(query)) matchesText = true;\n              else if (checkSource && evt.funcSource && evt.funcSource.toLowerCase().includes(query)) matchesText = true;\n            }\n          }\n\n          const matchesTime = evt.relTime >= filterMinTime && evt.relTime <= filterMaxTime;\n\n          return matchesText && matchesTime;\n        });\n\n        // Update Stats\n        statsLabel.innerText = `${filteredEvents.length} Events \226\128\162 ${totalDuration.toFixed(2)}s`;\n\n        // Reset Scroll\n        rowsContainer.scrollTop = 0;\n        lastStartIndex = -1;\n        lastEndIndex = -1;\n\n        if (currentView === 'timeline') {\n          renderVirtualRows(true);\n        } else {\n          renderHeatmap();\n        }\n      } function updateZoom() {\n        const width = (100 * zoomLevel) + '%';\n        rulerContainer.style.width = width;\n        renderRuler();\n        lastStartIndex = -1;\n        renderVirtualRows(true);\n      }\n\n      rowsContainer.addEventListener('wheel', (e) => {\n        if (e.ctrlKey) {\n          e.preventDefault();\n          if (e.deltaY < 0) {\n            zoomLevel = Math.min(zoomLevel * 1.1, 20);\n          } else {\n            zoomLevel = Math.max(zoomLevel / 1.1, 1);\n          }\n          updateZoom();\n        }\n      });\n\n      rowsContainer.addEventListener('scroll', () => {\n        timelineHeader.scrollLeft = rowsContainer.scrollLeft;\n\n        if (!isScrolling) {\n          window.requestAnimationFrame(() => {\n            renderVirtualRows();\n            isScrolling = false;\n          });\n          isScrolling = true;\n        }\n      });\n\n      const sessionInfo = document.querySelector('.session-info');\n      const tooltip = document.querySelector('.session-tooltip');\n\n      sessionInfo.addEventListener('click', (e) => {\n        e.stopPropagation();\n        tooltip.classList.toggle('visible');\n      });\n\n      tooltip.addEventListener('click', (e) => {\n        e.stopPropagation();\n      });\n\n      document.addEventListener('click', () => {\n        tooltip.classList.remove('visible');\n        const dropdown = document.getElementById('callerDropdown');\n        if (dropdown) dropdown.classList.remove('visible');\n      });\n    </script>\n  </body>\n</html>\n"
                                }
                            }
                        }
                    },
                    {
                        35,
                        2,
                        {
                            "Signal"
                        }
                    },
                    {
                        33,
                        1,
                        {
                            "Serializer"
                        },
                        {
                            {
                                34,
                                2,
                                {
                                    "LuaEncode"
                                }
                            }
                        }
                    },
                    {
                        27,
                        2,
                        {
                            "Hooking"
                        }
                    },
                    {
                        30,
                        1,
                        {
                            "Plugins"
                        },
                        {
                            {
                                31,
                                2,
                                {
                                    "Manager"
                                }
                            }
                        }
                    },
                    {
                        29,
                        2,
                        {
                            "Pagination"
                        }
                    },
                    {
                        28,
                        2,
                        {
                            "Log"
                        }
                    },
                    {
                        16,
                        1,
                        {
                            "Anticheats"
                        },
                        {
                            {
                                17,
                                2,
                                {
                                    "Main"
                                }
                            },
                            {
                                18,
                                1,
                                {
                                    "impl"
                                },
                                {
                                    {
                                        19,
                                        2,
                                        {
                                            "Adonis"
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

-- Line offsets for debugging (only included when minifyTables is false)
local LineOffsets = {
    8,
    393,
    [17] = 897,
    [34] = 1740,
    [38] = 1038,
    [39] = 1163,
    [28] = 1356,
    [43] = 1232,
    [35] = 1570,
    [19] = 1661,
    [14] = 11468,
    [41] = 2647,
    [32] = 4135,
    [12] = 3796,
    [22] = 4340,
    [29] = 4168,
    [24] = 4320,
    [40] = 966,
    [21] = 4549,
    [44] = 5478,
    [37] = 5776,
    [45] = 5893,
    [42] = 6228,
    [13] = 6278,
    [25] = 6562,
    [26] = 6692,
    [46] = 6846,
    [31] = 2902,
    [27] = 11682
}

-- Misc AOT variable imports
local WaxVersion = "0.4.1"
local EnvName = "Cobalt"

-- ++++++++ RUNTIME IMPL BELOW ++++++++ --

-- Localizing certain libraries and built-ins for runtime efficiency
local string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION =
      string, task, setmetatable, error, next, table, unpack, coroutine, script, type, require, pcall, tostring, tonumber, _VERSION

local table_insert = table.insert
local table_remove = table.remove
local table_freeze = table.freeze or function(t) return t end -- lol

local coroutine_wrap = coroutine.wrap

local string_sub = string.sub
local string_match = string.match
local string_gmatch = string.gmatch

-- The Lune runtime has its own `task` impl, but it must be imported by its builtin
-- module path, "@lune/task"
if _VERSION and string_sub(_VERSION, 1, 4) == "Lune" then
    local RequireSuccess, LuneTaskLib = pcall(require, "@lune/task")
    if RequireSuccess and LuneTaskLib then
        task = LuneTaskLib
    end
end

local task_defer = task and task.defer

-- If we're not running on the Roblox engine, we won't have a `task` global
local Defer = task_defer or function(f, ...)
    coroutine_wrap(f)(...)
end

-- ClassName "IDs"
local ClassNameIdBindings = {
    [1] = "Folder",
    [2] = "ModuleScript",
    [3] = "Script",
    [4] = "LocalScript",
    [5] = "StringValue",
}

local RefBindings = {} -- [RefId] = RealObject

local ScriptClosures = {}
local ScriptClosureRefIds = {} -- [ScriptClosure] = RefId
local StoredModuleValues = {}
local ScriptsToRun = {}

-- wax.shared __index/__newindex
local SharedEnvironment = {}

-- We're creating 'fake' instance refs soley for traversal of the DOM for require() compatibility
-- It's meant to be as lazy as possible
local RefChildren = {} -- [Ref] = {ChildrenRef, ...}

-- Implemented instance methods
local InstanceMethods = {
    GetFullName = { {}, function(self)
        local Path = self.Name
        local ObjectPointer = self.Parent

        while ObjectPointer do
            Path = ObjectPointer.Name .. "." .. Path

            -- Move up the DOM (parent will be nil at the end, and this while loop will stop)
            ObjectPointer = ObjectPointer.Parent
        end

        return Path
    end},

    GetChildren = { {}, function(self)
        local ReturnArray = {}

        for Child in next, RefChildren[self] do
            table_insert(ReturnArray, Child)
        end

        return ReturnArray
    end},

    GetDescendants = { {}, function(self)
        local ReturnArray = {}

        for Child in next, RefChildren[self] do
            table_insert(ReturnArray, Child)

            for _, Descendant in next, Child:GetDescendants() do
                table_insert(ReturnArray, Descendant)
            end
        end

        return ReturnArray
    end},

    FindFirstChild = { {"string", "boolean?"}, function(self, name, recursive)
        local Children = RefChildren[self]

        for Child in next, Children do
            if Child.Name == name then
                return Child
            end
        end

        if recursive then
            for Child in next, Children do
                -- Yeah, Roblox follows this behavior- instead of searching the entire base of a
                -- ref first, the engine uses a direct recursive call
                return Child:FindFirstChild(name, true)
            end
        end
    end},

    FindFirstAncestor = { {"string"}, function(self, name)
        local RefPointer = self.Parent
        while RefPointer do
            if RefPointer.Name == name then
                return RefPointer
            end

            RefPointer = RefPointer.Parent
        end
    end},

    -- Just to implement for traversal usage
    WaitForChild = { {"string", "number?"}, function(self, name)
        return self:FindFirstChild(name)
    end},
}

-- "Proxies" to instance methods, with err checks etc
local InstanceMethodProxies = {}
for MethodName, MethodObject in next, InstanceMethods do
    local Types = MethodObject[1]
    local Method = MethodObject[2]

    local EvaluatedTypeInfo = {}
    for ArgIndex, TypeInfo in next, Types do
        local ExpectedType, IsOptional = string_match(TypeInfo, "^([^%?]+)(%??)")
        EvaluatedTypeInfo[ArgIndex] = {ExpectedType, IsOptional}
    end

    InstanceMethodProxies[MethodName] = function(self, ...)
        if not RefChildren[self] then
            error("Expected ':' not '.' calling member function " .. MethodName, 2)
        end

        local Args = {...}
        for ArgIndex, TypeInfo in next, EvaluatedTypeInfo do
            local RealArg = Args[ArgIndex]
            local RealArgType = type(RealArg)
            local ExpectedType, IsOptional = TypeInfo[1], TypeInfo[2]

            if RealArg == nil and not IsOptional then
                error("Argument " .. RealArg .. " missing or nil", 3)
            end

            if ExpectedType ~= "any" and RealArgType ~= ExpectedType and not (RealArgType == "nil" and IsOptional) then
                error("Argument " .. ArgIndex .. " expects type \"" .. ExpectedType .. "\", got \"" .. RealArgType .. "\"", 2)
            end
        end

        return Method(self, ...)
    end
end

local function CreateRef(className, name, parent)
    -- `name` and `parent` can also be set later by the init script if they're absent

    -- Extras
    local StringValue_Value

    -- Will be set to RefChildren later aswell
    local Children = setmetatable({}, {__mode = "k"})

    -- Err funcs
    local function InvalidMember(member)
        error(member .. " is not a valid (virtual) member of " .. className .. " \"" .. name .. "\"", 3)
    end
    local function ReadOnlyProperty(property)
        error("Unable to assign (virtual) property " .. property .. ". Property is read only", 3)
    end

    local Ref = {}
    local RefMetatable = {}

    RefMetatable.__metatable = false

    RefMetatable.__index = function(_, index)
        if index == "ClassName" then -- First check "properties"
            return className
        elseif index == "Name" then
            return name
        elseif index == "Parent" then
            return parent
        elseif className == "StringValue" and index == "Value" then
            -- Supporting StringValue.Value for Rojo .txt file conv
            return StringValue_Value
        else -- Lastly, check "methods"
            local InstanceMethod = InstanceMethodProxies[index]

            if InstanceMethod then
                return InstanceMethod
            end
        end

        -- Next we'll look thru child refs
        for Child in next, Children do
            if Child.Name == index then
                return Child
            end
        end

        -- At this point, no member was found; this is the same err format as Roblox
        InvalidMember(index)
    end

    RefMetatable.__newindex = function(_, index, value)
        -- __newindex is only for props fyi
        if index == "ClassName" then
            ReadOnlyProperty(index)
        elseif index == "Name" then
            name = value
        elseif index == "Parent" then
            -- We'll just ignore the process if it's trying to set itself
            if value == Ref then
                return
            end

            if parent ~= nil then
                -- Remove this ref from the CURRENT parent
                RefChildren[parent][Ref] = nil
            end

            parent = value

            if value ~= nil then
                -- And NOW we're setting the new parent
                RefChildren[value][Ref] = true
            end
        elseif className == "StringValue" and index == "Value" then
            -- Supporting StringValue.Value for Rojo .txt file conv
            StringValue_Value = value
        else
            -- Same err as __index when no member is found
            InvalidMember(index)
        end
    end

    RefMetatable.__tostring = function()
        return name
    end

    setmetatable(Ref, RefMetatable)

    RefChildren[Ref] = Children

    if parent ~= nil then
        RefChildren[parent][Ref] = true
    end

    return Ref
end

-- Create real ref DOM from object tree
local function CreateRefFromObject(object, parent)
    local RefId = object[1]
    local ClassNameId = object[2]
    local Properties = object[3] -- Optional
    local Children = object[4] -- Optional

    local ClassName = ClassNameIdBindings[ClassNameId]

    local Name = Properties and table_remove(Properties, 1) or ClassName

    local Ref = CreateRef(ClassName, Name, parent) -- 3rd arg may be nil if this is from root
    RefBindings[RefId] = Ref

    if Properties then
        for PropertyName, PropertyValue in next, Properties do
            Ref[PropertyName] = PropertyValue
        end
    end

    if Children then
        for _, ChildObject in next, Children do
            CreateRefFromObject(ChildObject, Ref)
        end
    end

    return Ref
end

local RealObjectRoot = CreateRef("Folder", "[" .. EnvName .. "]")
for _, Object in next, ObjectTree do
    CreateRefFromObject(Object, RealObjectRoot)
end

-- Now we'll set script closure refs and check if they should be ran as a BaseScript
for RefId, Closure in next, ClosureBindings do
    local Ref = RefBindings[RefId]

    ScriptClosures[Ref] = Closure
    ScriptClosureRefIds[Ref] = RefId

    local ClassName = Ref.ClassName
    if ClassName == "LocalScript" or ClassName == "Script" then
        table_insert(ScriptsToRun, Ref)
    end
end

local function LoadScript(scriptRef)
    local ScriptClassName = scriptRef.ClassName

    -- First we'll check for a cached module value (packed into a tbl)
    local StoredModuleValue = StoredModuleValues[scriptRef]
    if StoredModuleValue and ScriptClassName == "ModuleScript" then
        return unpack(StoredModuleValue)
    end

    local Closure = ScriptClosures[scriptRef]

    local function FormatError(originalErrorMessage)
        originalErrorMessage = tostring(originalErrorMessage)

        local VirtualFullName = scriptRef:GetFullName()

        -- Check for vanilla/Roblox format
        local OriginalErrorLine, BaseErrorMessage = string_match(originalErrorMessage, "[^:]+:(%d+): (.+)")

        if not OriginalErrorLine or not LineOffsets then
            return VirtualFullName .. ":*: " .. (BaseErrorMessage or originalErrorMessage)
        end

        OriginalErrorLine = tonumber(OriginalErrorLine)

        local RefId = ScriptClosureRefIds[scriptRef]
        local LineOffset = LineOffsets[RefId]

        local RealErrorLine = OriginalErrorLine - LineOffset + 1
        if RealErrorLine < 0 then
            RealErrorLine = "?"
        end

        return VirtualFullName .. ":" .. RealErrorLine .. ": " .. BaseErrorMessage
    end

    -- If it's a BaseScript, we'll just run it directly!
    if ScriptClassName == "LocalScript" or ScriptClassName == "Script" then
        local RunSuccess, ErrorMessage = xpcall(Closure, function(msg)
            return msg
        end)
        if not RunSuccess then
            error(FormatError(ErrorMessage), 0)
        end
    else
        local PCallReturn = {xpcall(Closure, function(msg)
            return msg
        end)}

        local RunSuccess = table_remove(PCallReturn, 1)
        if not RunSuccess then
            local ErrorMessage = table_remove(PCallReturn, 1)
            error(FormatError(ErrorMessage), 0)
        end

        StoredModuleValues[scriptRef] = PCallReturn
        return unpack(PCallReturn)
    end
end

-- We'll assign the actual func from the top of this output for flattening user globals at runtime
-- Returns (in a tuple order): wax, script, require
function ImportGlobals(refId)
    local ScriptRef = RefBindings[refId]

    local function RealCall(f, ...)
        local PCallReturn = {xpcall(f, function(msg)
            return debug.traceback(msg, 2)
        end, ...)}

        local CallSuccess = table_remove(PCallReturn, 1)
        if not CallSuccess then
            error(PCallReturn[1], 3)
        end

        return unpack(PCallReturn)
    end

    -- `wax.shared` index
    local WaxShared = table_freeze(setmetatable({}, {
        __index = SharedEnvironment,
        __newindex = function(_, index, value)
            SharedEnvironment[index] = value
        end,
        __len = function()
            return #SharedEnvironment
        end,
        __iter = function()
            return next, SharedEnvironment
        end,
    }))

    local Global_wax = table_freeze({
        -- From AOT variable imports
        version = WaxVersion,
        envname = EnvName,

        shared = WaxShared,

        -- "Real" globals instead of the env set ones
        script = script,
        require = require,
    })

    local Global_script = ScriptRef

    local function Global_require(module, ...)
        local ModuleArgType = type(module)

        local ErrorNonModuleScript = "Attempted to call require with a non-ModuleScript"
        local ErrorSelfRequire = "Attempted to call require with self"

        if ModuleArgType == "table" and RefChildren[module]  then
            if module.ClassName ~= "ModuleScript" then
                error(ErrorNonModuleScript, 2)
            elseif module == ScriptRef then
                error(ErrorSelfRequire, 2)
            end

            return LoadScript(module)
        elseif ModuleArgType == "string" and string_sub(module, 1, 1) ~= "@" then
            -- The control flow on this SUCKS

            if #module == 0 then
                error("Attempted to call require with empty string", 2)
            end

            local CurrentRefPointer = ScriptRef

            if string_sub(module, 1, 1) == "/" then
                CurrentRefPointer = RealObjectRoot
            elseif string_sub(module, 1, 2) == "./" then
                module = string_sub(module, 3)
            end

            local PreviousPathMatch
            for PathMatch in string_gmatch(module, "([^/]*)/?") do
                local RealIndex = PathMatch
                if PathMatch == ".." then
                    RealIndex = "Parent"
                end

                -- Don't advance dir if it's just another "/" either
                if RealIndex ~= "" then
                    local ResultRef = CurrentRefPointer:FindFirstChild(RealIndex)
                    if not ResultRef then
                        local CurrentRefParent = CurrentRefPointer.Parent
                        if CurrentRefParent then
                            ResultRef = CurrentRefParent:FindFirstChild(RealIndex)
                        end
                    end

                    if ResultRef then
                        CurrentRefPointer = ResultRef
                    elseif PathMatch ~= PreviousPathMatch and PathMatch ~= "init" and PathMatch ~= "init.server" and PathMatch ~= "init.client" then
                        error("Virtual script path \"" .. module .. "\" not found", 2)
                    end
                end

                -- For possible checks next cycle
                PreviousPathMatch = PathMatch
            end

            if CurrentRefPointer.ClassName ~= "ModuleScript" then
                error(ErrorNonModuleScript, 2)
            elseif CurrentRefPointer == ScriptRef then
                error(ErrorSelfRequire, 2)
            end

            return LoadScript(CurrentRefPointer)
        end

        return RealCall(require, module, ...)
    end

    -- Now, return flattened globals ready for direct runtime exec
    return Global_wax, Global_script, Global_require
end

for _, ScriptRef in next, ScriptsToRun do
    Defer(LoadScript, ScriptRef)
end
