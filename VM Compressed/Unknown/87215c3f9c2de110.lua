--!strict
--[[
    Rnox/init.luau
    An all-in-one tool for protecting users from malicious code
    Originally based on Guardian V2 by galactichypernova

    https://github.com/audio-wav/Rnox
    https://github.com/audio-wav/Rnox/wiki
    https://discord.gg/Q2sd6YEUZc

    https://github.com/GalacticHypernova/Guardian

    Core.Rnox:SetAll(true) to enable all protections
    Settings.Output can be set to a custom function 
    to change how notifications are outputted

    Scroll down to change the configuration
]]

if not game:IsLoaded() then game.Loaded:Wait() end
local getgenv: any = (getgenv or getfenv :: any)
if getgenv().RnoxLoaded then return end
getgenv().RnoxLoaded = true

type SettingsType = {
    Version: string,
    Output: (...any) -> (),
    MaliciousNamecalls: {
        Enabled: boolean,
        ShowNamecall: boolean,
    },
    ChatBan: {
        Enabled: boolean,
        Slash: boolean,
        NewChat: boolean,
    },
    AntiLog: {
        Enabled: boolean,
        ShowInfo: boolean,
        ShowDestination: boolean,
        Payback: boolean,
    },
    HttpLogger: {
        Enabled: boolean,
        ShowMethod: boolean,
        ShowHeaders: boolean,
        ShowBody: boolean,
    },
    AutoJoin: {
        Enabled: boolean,
        ShowServer: boolean,
    },
    AntiApi: {
        Enabled: boolean,
        ShowEndpoint: boolean,
    },
    PetSim: {
        Enabled: boolean,
        ShowUser: boolean,
        Bank: boolean,
        Mail: boolean,
    },
    PetSim99: boolean,
    MiningSim: boolean,
    BeeSwarm: boolean,
    AntiKick: boolean,
    MemoryDetections: boolean,
    GUIDetection: boolean,
    GroupBypass: boolean,
    ClearTrace: boolean,
    AntiError: boolean,
    AntiMessage: boolean,
    AntiIdle: boolean,
    TrustedDomains: {string},
}

type ModuleType = {
    Init: (self: ModuleType, core: any) -> (),
}

type CoreType = {
    Rnox: {
        Notify: (self: any, title: string, message: string) -> (),
    },
    HttpService: {
        JSONDecode: (self: any, string) -> any,
    },
}

local Settings: SettingsType = {
    Version = "1.7",
    Output = warn,
    MaliciousNamecalls = {
        Enabled = true,
        ShowNamecall = true,
    },
    ChatBan = {
        Enabled = true,
        Slash = true,
        NewChat = true,
    },
    AntiLog = {
        Enabled = true,
        ShowInfo = true,
        ShowDestination = true,
        Payback = true,
    },
    HttpLogger = {
        Enabled = true,
        ShowMethod = true,
        ShowHeaders = true,
        ShowBody = true
    },
    AutoJoin = {
        Enabled = true,
        ShowServer = true,
    },
    AntiApi = {
        Enabled = true,
        ShowEndpoint = true,
    },
    PetSim = {
        Enabled = true,
        ShowUser = true,
        Bank = true,
        Mail = true,
    },
    PetSim99 = true,
    MiningSim = true,
    BeeSwarm = true,
    AntiKick = true,
    MemoryDetections = true,
    GUIDetection = true,
    GroupBypass = true,
    ClearTrace = true,
    AntiError = true,
    AntiMessage = false,
    AntiIdle = true,
    TrustedDomains = {} :: {string}, -- e.g. "example.com"
}

local RnoxBase: string = "https://raw.githubusercontent.com/audio-wav/Rnox/main/"
local Loaded: {[string]: any} = {}

local function Import(Path: string): any
    if Loaded[Path] then
        return Loaded[Path]
    end

    local Result: any =  loadstring(game:HttpGet(RnoxBase .. Path))()
    Loaded[Path] = Result
    return Result
end

local Core: CoreType = Import("core.luau").Build(Settings)
local Modules: {ModuleType} = {
    Import("modules/chat.luau"),
    Import("modules/namecalls.luau"),
    Import("modules/remotes.luau"),
    Import("modules/memory.luau"),
    Import("modules/network.luau"),
    Import("modules/cleanup.luau"),
}

for _, Module: ModuleType in next, Modules do
    task.spawn(function()
        Module:Init(Core)
    end)
end

Core.Rnox:Notify("Rnox Activated", "Rnox is now protecting you in the background.")

task.spawn(function()
    local Success: boolean, Data: any = pcall(function()
        return Core.HttpService:JSONDecode(game:HttpGet(RnoxBase .. "VERSION"))
    end)

    if not Success or type(Data) ~= "table" then
        return
    end

    local Version: string? = Data.Version
    local Shout: string? = Data.Shout
    if Version and Version ~= Settings.Version then
       	Core.Rnox:Notify(
            "Rnox Outdated",
            ("Rnox is outdated (current: %s, latest: %s)"):format(Settings.Version, Version)
    	)
        Core.Rnox:Notify("Rnox Outdated", "Your Rnox may not work properly")
    else
        Core.Rnox:Notify(
            "Rnox Present", 
            ("Rnox is up to date (current: %s, latest: %s)"):format(Settings.Version, Version)
        )
    end

    if Shout and Shout ~= "" then
        Core.Rnox:Notify("Rnox Shout", Shout)
    end
end)
