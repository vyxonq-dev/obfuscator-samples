-- ui lib

-- https://cat-sus.gitbook.io/fatality
local Fatality = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/Fatality/refs/heads/main/src/source.luau"))();


if not Fatality then
    warn("Failed to load the ui library, executor is probably unsupported or the github link was deleted.")
    return
end

local thegetgenvissupportedomg = false

function checkgetgenv()
    if getgenv and type(getgenv) == "function" then
        thegetgenvissupportedomg = true
    else
        warn("getgenv is not supported. This script cant run without it.")
        return
    end
end

checkgetgenv()

if not thegetgenvissupportedomg then
    return
end

local Notification = Fatality:CreateNotifier();

-- https://www.roblox.com/games/120331934510435/Sultanisimus-HVH
if game.PlaceId ~= 120331934510435 then
    Notification:Notify({ Title = "bell", Content = "This script is for Sultanisimus HVH only!", Icon = "alert" })
    return
end

-- check if the executor is supported

-- print("Checking if the executor is supported, this might take 1-2 seconds")

local function checkifsupported()
    local missing = {}

    local requiredFunctions = {
        "identifyexecutor",
        "getthreadidentity",
        "hookfunction",
        "getgenv",
        "getconnections",
        "require",
        "getgc",
        "getfenv",
        "hookmetamethod",
        "getupvalue",
        "debug",
        "setreadonly",
        "getrawmetatable",
    }

    for _, funcName in ipairs(requiredFunctions) do
        if getfenv()[funcName] == nil and _G[funcName] == nil then
            table.insert(missing, funcName)
        end
    end

    if #missing == 0 then
        --print("Executor Fully Supported!")

        Notification:Notify({
            Title = "NeverHit",
            Content = "Executor fully supported! Loading UI...",
            Duration = 3,
            Icon = "check"
        })

        return true
    elseif #missing > 12 then

        Notification:Notify({
            Title = "Error",
            Content = "Your executor is ass",
            Icon = "bell"
        })

        return false
    else
        --warn("Script may not work or crash. Missing functions: " .. table.concat(missing, ", "))
        --print("If hookfunction is missing, then Ragebot(Event Hook) is not gonna work.")

        Notification:Notify({
            Title = "NeverHit",
            Content = "Executor is not supported! Some features might not work or crash.",
            Duration = 20,
            Icon = "bell"
        })

        return false
    end
end

checkifsupported()

function checkspecificfunction(funcName)
    if getfenv()[funcName] == nil and _G[funcName] == nil then
        return false
    end
    return true
end

-- check

if getgenv().NeverHitIsLoaded == true then

    Notification:Notify({
        Title = "Warning",
        Content = "Im already loaded!",
        Icon = "bell"
    })

    warn("NeverHit is already loaded!")
    return
end

-- Gloabls

getgenv().NeverHitIsLoaded = true
getgenv().KillAll = false
getgenv().AutoHeal = false

task.spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if getgenv().KillAll then
             for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
                if plr ~= game:GetService("Players").LocalPlayer and plr.Character then
                    local args = {
                        "Shoot",
                        plr.Character,
                        "Head",
                        true,
                        100
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Dmg"):FireServer(unpack(args))
                end
            end
        end
    end)
end)

task.spawn(function()
	workspace.ChildAdded:Connect(function(v)
		if getgenv().AutoHeal and v and v.Name == "ActiveHealingPart" and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart then
			v:PivotTo(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame)
		end
	end)
end)

Fatality:Loader({ Name = "NEVERHIT.LUA", Duration = 3 });

Notification:Notify({
    Title = "NEVERHIT",
    Content = "Welcome back, "..game.Players.LocalPlayer.DisplayName,
    Icon = "clipboard"
})

local Window = Fatality.new({ Name = "NEVERHIT", Expire = "never" });

local ExploitsMenu = Window:AddMenu({ Name = "Exploits", Icon = "settings" })

-- Exploit Section

do
    local MainExploits = ExploitsMenu:AddSection({ Position = 'left', Name = "Exploits" });

    MainExploits:AddToggle({ Name = "Kill All", Callback = function(value)
        getgenv().KillAll = value
    end })

    MainExploits:AddToggle({ Name = "Auto Heal", Callback = function(value)
        getgenv().AutoHeal = value
    end })
end


-- Info

local InfoMenu = Window:AddMenu({ Name = "Info", Icon = "info" })

do
    local InfoSect = InfoMenu:AddSection({ Position = 'left', Name = "Info" });

    InfoSect:AddButton({
        Name = "Discord Server",
        Callback = function()
            local s,f = pcall(function()
                setclipboard("https://discord.gg/sMv9YeXbYR")

                Notification:Notify({
                    Title = "NeverHit",
                    Content = "Discord server link copied to clipboard!",
                })
            end)

            if not s then
                Notification:Notify({
                    Title = "Error",
                    Content = "Failed to copy to clipboard, get it manually: https://discord.gg/sMv9YeXbYR",
                    Icon = "bell"
                })
            end
            
        end
    })
end
