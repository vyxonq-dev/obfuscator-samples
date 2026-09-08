-- made by locality 
-- found this method - 19.12.2025 (dd mm yyyy)
-- supported exploits: xeno

local AkaliNotif = loadstring(game:HttpGet("https://raw.githubusercontent.com/ultraskidding/luau/refs/heads/main/AkaliNotif.lua"))();
local Notify = AkaliNotif.Notify;

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer

local Config = {
    Toggle = Enum.KeyCode.Seven,
    Unload = Enum.KeyCode.Eight,
    Working = false
}

local Cooldown = false
local ScriptNotify = ReplicatedStorage.GamepassEvents.FurtherReachBoughtNotifier
local Activator = ReplicatedStorage.MenuToys.LimitedTimeToyEvent
local DiedHandle
local function ReloadScript()
    game.Players.LocalPlayer.Character.GrabbingScript.Enabled = false
    game.Players.LocalPlayer.Character.GrabbingScript.Enabled = true
end

local function Toggle(notify)
    Config.Working = not Config.Working
    local isEnabled = Config.Working

    if notify then
        Notify({
            Title = "Further Reach",
            Description = isEnabled and "Activated!" or "Disabled!",
            Duration = 5
        })
    end

    if isEnabled then
        local LineTexture = LocalPlayer:FindFirstChild("FartherReach")
        if LineTexture then
            LineTexture:Destroy()
        end
        local LineTexture = Instance.new("BoolValue")
        LineTexture.Name = "FartherReach"
        LineTexture.Value = true
        LineTexture.Parent = LocalPlayer

        hookinstance(ScriptNotify, Activator)
        ReloadScript()
        task.delay(0.1, function()
            Activator:FireServer()
        end)
        DiedHandle = LocalPlayer.CharacterAdded:Connect(function(Character)
            Character:WaitForChild("GrabbingScript")
            Toggle(false);task.wait(0.1)
            Toggle(false)
        end)
    else
        local LineTexture = LocalPlayer:FindFirstChild("FartherReach")
        if LineTexture then
            LineTexture:Destroy()
        end
        hookinstance(ScriptNotify, ScriptNotify)
        ReloadScript()
        DiedHandle:Disconnect()
        DiedHandle = nil
    end
end

Toggle(true)

BindHandle = UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end

    if input.KeyCode == Config.Toggle then
        if Cooldown then return end

        Cooldown = true
        Toggle(true)

        task.delay(0.2, function()
            Cooldown = false
        end)

    elseif input.KeyCode == Config.Unload then
        Notify({
            Title = "Further Reach",
            Description = "Unloading...",
            Duration = 5
        })

        if Config.Working then
            Toggle(false)
        end

        BindHandle:Disconnect()
    end
end)
