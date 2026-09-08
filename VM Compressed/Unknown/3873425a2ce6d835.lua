--// ANONYMOUS USER'S PART \\--
if BIUGUI_LOADED or game.PlaceId ~= 18667984660 then return end
getgenv().BIUGUI_LOADED = true

--// LlamaScriptz Part \\--
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local localPlayer = Players.LocalPlayer
local localScript = localPlayer.PlayerScripts.System.Handler
local pingRemote = ReplicatedStorage:WaitForChild("PingRem")
local obbyRemote = ReplicatedStorage:WaitForChild("Obby")
local homeRemote = ReplicatedStorage:WaitForChild("Home")
local currentGlitchIndex = 1
local random = Random.new()
local fpsDropdown
local pingDropdown
local fakePing = false
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()
local w = library:CreateWindow("BiU GUI v2 - FYFAP")

--// Constants \\--
local INT_MAX = 2147483647
local OBBY_LIST = {"Easy", "Medium", "Hard", "Extreme", "Terrifying"}
local GLITCH_VALUES = {1, 21, 51, 101, 201}

--// Print extra info to the console \\--
print([[
    
- Minimum FPS = 1 (or 0 by toggling 0 FPS), Maximum FPS = 4500

- Minimum Ping = 1, Maximum Ping = inf

- "Realistic FPS/Ping Range" is the amount your FPS/Ping will flunctuate below the target FPS (when Realistic FPS/Ping is turned on)

- "Glitchy Ping" constantly changes your ping so that it always changes color, creating a glitch effect

- "Chaos Ping" constantly changes your ping to be a random value between your chosen minimum and maximum values (default: 1, 2^55)

- You can additionally set your ping to "inf", "nan" and numbers like "1e5" or "1e30"
]])

--// Notfication function \\--
local function notify(notification: {title: string, text: string, icon: string})
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = notification.title,
        Text = notification.text,
        Icon = notification.icon,
        Duration = 5
    })
end

--// Anonymous User's Part \\--
notify{title = "BiU GUI successful load!", text = "Created by BiU, LlamaScriptz and an anonymous user.", icon = "rbxassetid://18911834990"}

if not hookfunction then 
    notify{title = "FPS Cheats unsuccessful load!", text = "Your exploit does not support hookfunction", icon = "rbxassetid://18911855792"}
end

if not hookmetamethod then 
    notify{title = "Ping Cheats unsuccessful load!", text = "Your exploit does not support hookmetamethod", icon = "rbxassetid://18911855792"}
else
--// Adonis bypass - BiU's Part \\--
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixeluted/adoniscries/main/Source.lua"))()
end

notify{title = "Open console for extra info", text = "(Press F9)", icon = ""}

--// FPS & ping settings \\--
local settings = {
    fps = {
        value = 60,
        realisticRange = 10,
        realistic = false,
        constant = false,
        copy = false,
        copyTarget = localPlayer.Name,
        placeholder = false,
        min = 1,
        max = 4500,
        glitch = false,
        chaos = {
            on = false,
            absMin = 0,
            absMax = 0,
            min = 0,
            max = 0,
            noDecimals = false
        }
    },
    ping = {
        value = 40,
        realisticRange = 10,
        realistic = false,
        constant = false,
        copy = false,
        copyTarget = localPlayer.Name,
        placeholder = false,
        min = 1,
        max = math.huge,
        glitch = false,
        chaos = {
            on = false,
            absMin = 1,
            absMax = 2^55,
            min = 1,
            max = 2^55,
            noDecimals = false
        }
    }
}

--// Fetch FPS or ping value - BiU's Part \\--
local function getValue(valueType: string): number
    if settings[valueType].placeholder then 
        return -1
    end
    
    if not localPlayer.Character then 
        localPlayer.CharacterAdded:Wait()
    end
    
    local currentValue
    if valueType == "fps" then 
        currentValue = tonumber(localPlayer.Character.Head.fpsGui.FPS.Text:sub(6))
    else
        currentValue = tonumber(localPlayer.Character.Head.fpsGui.Ping.Text:sub(6))
    end
    currentValue = currentValue or 1
    
    if settings[valueType].chaos.on or settings[valueType].glitch then 
        return currentValue
    end
    
    if settings[valueType].copy then 
        if valueType == "fps" then
            return tonumber(Players[settings[valueType].copyTarget].Character.Head.fpsGui.FPS.Text:sub(6,-1))
        elseif valueType == "ping" then
            return tonumber(Players[settings[valueType].copyTarget].Character.Head.fpsGui.Ping.Text:sub(6,-1))
        end
    elseif settings[valueType].constant then 
        return math.clamp(settings[valueType].value, settings[valueType].min, settings[valueType].max)
    elseif settings[valueType].realistic then 
        local randomValue = math.random(0, math.abs(math.min(settings[valueType].realisticRange, INT_MAX)))
        return math.clamp(settings[valueType].value - randomValue, settings[valueType].min, settings[valueType].max)
    end

    return currentValue
end

--// Parse string to number \\--
local function parseNumber(value: string, valueType: string?): number
    if value == "inf" then 
        return settings.ping.chaos.on and settings.ping.chaos.absMax or math.huge
    elseif tonumber(value) and value ~= "nan" then 
        return tonumber(value) >= 1 and tonumber(value) or 1
    end

    if valueType == "chaosMin" then 
        return settings.ping.chaos.absMin
    elseif valueType == "chaosMax" then 
        return settings.ping.chaos.absMax
    end 
    
    return 0/0
end

--// Create FPS mod tab - BiU's last part \\--
local function loadFPSUI()
    local a = w:CreateFolder("FPS Modifier")
    local b = w:CreateFolder("FPS Copier")
    
    a:Toggle("Realistic FPS", function(bool)
        settings.fps.realistic = bool
    end)
    
    a:Toggle("Constant FPS", function(bool)
        settings.fps.constant = bool
    end)
    
    a:Toggle("0 FPS (will reset you)", function(bool)
        settings.fps.placeholder = bool
        if bool then
            localPlayer.Character.Humanoid.Health = 0
        end
    end)
    
    a:Box("FPS", "number", function(value)
        settings.fps.value = value
    end)
    
    a:Box("Realistic FPS Range", "number", function(value)
        settings.fps.realisticRange = value
    end)
    
    b:Toggle("Copy FPS", function(bool)
        settings.fps.copy = bool 
    end)
    
    fpsDropdown = b:Dropdown("Player List", Players:GetPlayers(), true, function(plrName)
        settings.fps.copyTarget = plrName
    end)
end

--// Create ping modifier tabs \\--
local function loadPingUI()
    local c = w:CreateFolder("Ping Modifier")
    local d = w:CreateFolder("Ping Copier")
    local e = w:CreateFolder("Ping Chaos")
    
    c:Toggle("Realistic Ping", function(bool)
        settings.ping.realistic = bool
    end)
    
    c:Toggle("Constant Ping", function(bool)
        settings.ping.constant = bool
    end)
    
    c:Toggle("Placeholder Ping (will reset you)", function(bool)
        settings.ping.placeholder = bool
        if bool then
            localPlayer.Character.Humanoid.Health = 0 
        end
    end)
    
    c:Toggle("Glitchy Ping", function(bool)
        settings.ping.glitch = bool 
    end)
    
    c:Box("Ping", "string", function(value)
        settings.ping.value = parseNumber(value)
    end)
    
    c:Box("Realistic Ping Range", "string", function(value)
        settings.ping.realisticRange = parseNumber(value)
    end)
    
    d:Toggle("Copy Ping", function(bool)
        settings.ping.copy = bool 
    end)
    
    pingDropdown = d:Dropdown("Player List", Players:GetPlayers(), true, function(plrName)
        settings.ping.copyTarget = plrName
    end)

    e:Toggle("Chaos Ping", function(bool)
        settings.ping.chaos.on = bool
    end)
    
    e:Toggle("No Decimals", function(bool)
        settings.ping.chaos.noDecimals = bool
    end)
    
    e:Box("Minimum Ping", "string", function(value)
        settings.ping.chaos.min = parseNumber(value, "chaosMin")
    end)

    e:Box("Maximum Ping", "string", function(value)
        settings.ping.chaos.max = parseNumber(value, "chaosMax")
    end)
end

--// Hook OnClientInvoke callback function to modify FPS - LlamaScriptz Part \\--
if hookfunction then 
    loadFPSUI()
    for i,v in pairs(getgc()) do
        if type(v) == "function" and getfenv(v).script == localScript and debug.getinfo(v).numparams == 3 then
            hookfunction(v, function() 
                local fpsValue = getValue("fps")
                if fpsValue then 
                    return fpsValue 
                end
                task.wait(9e9)
            end)
            break
        end
    end
end

--// Hook ping remote to modify ping - anonymous user \\--
if hookmetamethod then
    loadPingUI()
    local namecall
    namecall = hookmetamethod(game, "__namecall", function(self, ...)
        if not checkcaller() and getnamecallmethod() == "FireServer" and self == pingRemote then
            local pingValue = getValue("ping")
            if pingValue ~= -1 then 
                return namecall(self, pingValue)
            end
            fakePing = true
            return namecall(self, task.wait(9e9))
        end
        return namecall(self, ...)
    end)
end

--// Get obby badges \\-
local f = w:CreateFolder("Obby Badges")

f:Button("Get Badges", function()
    for i,v in pairs(OBBY_LIST) do 
        obbyRemote:FireServer(v)
        firetouchinterest(workspace.Obbies[v]:WaitForChild("badge"), localPlayer.Character.HumanoidRootPart, 0)
    end
    homeRemote:FireServer()
end)

--// Refresh dropdowns \\--
Players.PlayerAdded:Connect(function()
    if hookfunction then
        fpsDropdown:Refresh(Players:GetPlayers())
    end
    if hookmetamethod then
        pingDropdown:Refresh(Players:GetPlayers())
    end
end)

Players.PlayerRemoving:Connect(function()
    if hookfunction then
        fpsDropdown:Refresh(Players:GetPlayers())
    end
    if hookmetamethod then
        pingDropdown:Refresh(Players:GetPlayers())
    end
end)

--// Loop update ping based on current settings \\--
task.spawn(function()
    local chaosMin
    local chaosMax
    while task.wait() do
        if not settings.ping.placeholder then
            if settings.ping.chaos.on then 
                chaosMin = settings.ping.chaos.min
                chaosMax = settings.ping.chaos.max
                if settings.ping.chaos.noDecimals then
                    pingRemote:FireServer(random:NextInteger(chaosMin, chaosMax))
                else 
                    pingRemote:FireServer(random:NextNumber(chaosMin, chaosMax))
                end
            elseif settings.ping.copy then
                if workspace:FindFirstChild(settings.ping.copyTarget) and workspace[settings.ping.copyTarget]:FindFirstChild("Head") then
                    pingRemote:FireServer(getValue("ping"))
                end
            elseif settings.ping.glitch then 
                pingRemote:FireServer(GLITCH_VALUES[currentGlitchIndex])
                currentGlitchIndex += 1 
                if currentGlitchIndex == #GLITCH_VALUES + 1 then 
                    currentGlitchIndex = 1 
                end
            end 
        end
    end 
end)

--// Emulate fake ping if placeholder ping has been used \\--
task.spawn(function()
    while task.wait(1) do 
        if fakePing and not settings.ping.placeholder then 
            pingRemote:FireServer(getValue("ping"))
        end
    end
end)