getgenv().AutoExecute = false

local MainScript = "https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/MainLoader.lua"

-- GameList bây giờ KHÔNG chứa URL
-- mà chứa trực tiếp code loadstring(...)
local GameList = {
    ["2753915549"]    = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/LagCatBloxFruit.lua"))()]],
    ["4442272183"]    = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/LagCatBloxFruit.lua"))()]],
    ["7449423635"]    = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/LagCatBloxFruit.lua"))()]],

    ["79546208627805"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/LagCat99NightsInTheForest.lua"))()]],
    ["10260193230"]    = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/LagCatMemeSea.lua"))()]],
    ["18687417158"]    = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/LagCatForsaken.lua"))()]],

    ["127742093697776"] = [[loadstring(game:HttpGet("https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/LagCatPlantsVsBrainrots.lua"))()]],
}

local function Notify(msg)
    local N = loadstring(game:HttpGet(
        "https://raw.githubusercontent.com/TDDuym500/npmc_/refs/heads/main/Notification.lua"
    ))()
    N:Notify({
        Title = "Lag Cat Hub",
        Content = msg,
        Duration = 3
    })
end

local function LoadGameScript()
    local code = GameList[tostring(game.PlaceId)]
    if not code then
        Notify("Unsupported PlaceID: " .. tostring(game.PlaceId))
        return
    end

    local fn = loadstring(code)
    if fn then pcall(fn) end
end

LoadGameScript()

local function AutoQueue()
    if not getgenv().AutoExecute then return end

    local qtp = queue_on_teleport
        or (syn and syn.queue_on_teleport)
        or (fluxus and fluxus.queue_on_teleport)
        or (KRNL_LOADED and queue_on_teleport)

    if type(qtp) == "function" then
        qtp(('loadstring(game:HttpGet("%s"))()'):format(MainScript))
    end
end

AutoQueue()

game.Players.LocalPlayer.CharacterAdded:Connect(function()
    if getgenv().AutoExecute then
        task.wait(1)
        AutoQueue()
        LoadGameScript()
    end
end)
