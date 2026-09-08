if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")
local GuiService = game:GetService("GuiService")
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer or Players.PlayerAdded:Wait()

local LOBBY_PLACE_ID = 3260590327

local LOADING_TIMEOUT = 60
local GAMEOVER_STEP_TIMEOUT = 60
local NO_GAMEOVER_TIMEOUT = 20 * 60

local LoaderActive = true
local ReconnectCheckRunning = false

local RecoveryRunning = false
local SessionStartedAt = nil
local LastRep = nil

local SavedState = {
    Difficulty = nil,
    DisplayName = nil,
    Mode = "survival"
}

local function GetRep()
    local stateReplicators =
        ReplicatedStorage:FindFirstChild("StateReplicators")

    return stateReplicators
        and stateReplicators:FindFirstChild("GameStateReplicator")
end

local function IsInGame()
    return GetRep() ~= nil
end

local function CacheState(rep)
    if not rep then
        return
    end

    local difficulty =
        rep:GetAttribute("Difficulty")

    local displayName =
        rep:GetAttribute("DifficultyDisplayName")

    if difficulty ~= nil then
        SavedState.Difficulty =
            tostring(difficulty)
    end

    if displayName ~= nil then
        SavedState.DisplayName =
            tostring(displayName)
    end

    if tostring(SavedState.DisplayName or ""):lower() == "hardcore" then
        SavedState.Mode = "hardcore"
    else
        SavedState.Mode = "survival"
    end
end

local function IsGameOver()
    local rep = GetRep()

    return rep
        and rep:GetAttribute("GameOver") == true
end

local function BackToLobby()
    if not IsInGame() then
        return true
    end

    local network =
        ReplicatedStorage:FindFirstChild("Network")

    local teleport =
        network
        and network:FindFirstChild("Teleport")

    local remote =
        teleport
        and teleport:FindFirstChild("RE:backToLobby")

    if not remote then
        return false
    end

    return pcall(function()
        remote:FireServer()
    end)
end

local function Rematch()
    if not IsInGame() then
        return false
    end

    local network =
        ReplicatedStorage:FindFirstChild("Network")

    local gameManager =
        network
        and network:FindFirstChild("GameManager")

    local remote =
        gameManager
        and gameManager:FindFirstChild("RE:Rematch")

    if not remote then
        return false
    end

    return pcall(function()
        remote:FireServer()
    end)
end

local function Matchmake()
    if not IsInGame() then
        return false
    end

    local rep = GetRep()

    if rep then
        CacheState(rep)
    end

    if not SavedState.Difficulty then
        return false
    end

    local remote =
        ReplicatedStorage:FindFirstChild("RemoteFunction")

    if not remote then
        return false
    end

    return pcall(function()
        remote:InvokeServer(
            "Multiplayer",
            "v2:start",
            {
                difficulty = SavedState.Difficulty,
                mode = SavedState.Mode,
                count = 1
            }
        )
    end)
end

local function StartGameOverRecovery(rep)
    if RecoveryRunning or not IsInGame() then
        return
    end

    RecoveryRunning = true
    CacheState(rep)

    task.spawn(function()
        task.wait(GAMEOVER_STEP_TIMEOUT)

        if not IsInGame() then
            RecoveryRunning = false
            SessionStartedAt = nil
            return
        end

        if not IsGameOver() then
            RecoveryRunning = false
            SessionStartedAt = os.clock()
            return
        end

        BackToLobby()

        task.wait(GAMEOVER_STEP_TIMEOUT)

        if not IsInGame() then
            RecoveryRunning = false
            SessionStartedAt = nil
            return
        end

        if not IsGameOver() then
            RecoveryRunning = false
            SessionStartedAt = os.clock()
            return
        end

        Rematch()

        task.wait(GAMEOVER_STEP_TIMEOUT)

        if not IsInGame() then
            RecoveryRunning = false
            SessionStartedAt = nil
            return
        end

        if not IsGameOver() then
            RecoveryRunning = false
            SessionStartedAt = os.clock()
            return
        end

        Matchmake()

        RecoveryRunning = false
        SessionStartedAt = os.clock()
    end)
end

local function Reconnect()
    if not LoaderActive or ReconnectCheckRunning then
        return
    end

    ReconnectCheckRunning = true

    task.spawn(function()
        task.wait(2)

        if LoaderActive then
            pcall(function()
                TeleportService:TeleportReconnect()
            end)
        end

        ReconnectCheckRunning = false
    end)
end

local ErrorConnection =
    GuiService.ErrorMessageChanged:Connect(function()
        local code = GuiService:GetErrorCode()

        if code and code ~= Enum.ConnectionError.OK then
            Reconnect()
        end
    end)

local PromptConnection

pcall(function()
    local promptOverlay =
        CoreGui
            :WaitForChild("RobloxPromptGui")
            :WaitForChild("promptOverlay")

    PromptConnection =
        promptOverlay.ChildAdded:Connect(function(child)
            if child.Name == "ErrorPrompt" then
                Reconnect()
            end
        end)
end)

local existingCode = GuiService:GetErrorCode()

if existingCode and existingCode ~= Enum.ConnectionError.OK then
    Reconnect()
end

local function IsLoading()
    local playerGui =
        LocalPlayer:FindFirstChild("PlayerGui")

    local loadingScreen =
        playerGui
        and playerGui:FindFirstChild("LoadingScreen")

    local content =
        loadingScreen
        and loadingScreen:FindFirstChild("content")

    return
        LocalPlayer:GetAttribute("Loading") == true
        or LocalPlayer:GetAttribute("Teleporting") == true
        or (content and content.Visible == true)
end

if IsInGame() then
    local startedAt = os.clock()

    while IsLoading() do
        if not IsInGame() then
            break
        end

        if os.clock() - startedAt >= LOADING_TIMEOUT then
            Matchmake()
            return
        end

        task.wait(1)
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)

        local rep = GetRep()

        if not rep then
            SessionStartedAt = nil
            LastRep = nil
            RecoveryRunning = false

            SavedState.Difficulty = nil
            SavedState.DisplayName = nil
            SavedState.Mode = "survival"

            continue
        end

        if rep ~= LastRep then
            LastRep = rep
            SessionStartedAt = os.clock()
        end

        CacheState(rep)

        local gameOver =
            rep:GetAttribute("GameOver") == true

        if gameOver then
            StartGameOverRecovery(rep)

        elseif not RecoveryRunning
            and SessionStartedAt
            and os.clock() - SessionStartedAt >= NO_GAMEOVER_TIMEOUT then

            RecoveryRunning = true

            Matchmake()

            SessionStartedAt = os.clock()
            RecoveryRunning = false
        end
    end
end)

local ok, err = pcall(function()
    loadstring(
        game:HttpGet(
            "https://api.jnkie.com/api/v1/luascripts/public/7c7a4c329222a36ff1e2107aedb7ae0bc4d1335c1479b644061ff4fb056f5ce6/download"
        )
    )()
end)

LoaderActive = false

if ErrorConnection then
    ErrorConnection:Disconnect()
end

if PromptConnection then
    PromptConnection:Disconnect()
end

ReconnectCheckRunning = false

if not ok then
    warn(err)
end
