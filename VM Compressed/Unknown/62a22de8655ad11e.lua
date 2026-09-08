scriptname = "nigger hub v2.3.1"

if not game:IsLoaded() then game.Loaded:Wait() end
if Luna then Luna:Destroy() end

function missing(t, f, fallback)
    if type(f) == t then return f end
    return fallback
end

function loadAnimation(char, animid)
    local humanoid = char:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator") 
        animator.Parent = humanoid
    end
    local anim = Instance.new("Animation")
    anim.AnimationId = "rbxassetid://" .. tostring(animid)
    return animator:LoadAnimation(anim)
end

function r15(plr)
    return plr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15
end

local cloneref = missing("function", cloneref, function(...) return ... end)
local queueteleport = missing("function", queue_on_teleport or (syn and syn.queue_on_teleport) or (fluxus and fluxus.queue_on_teleport))

-- vars
local Players = cloneref(game:GetService("Players"))
local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local PlaceId, JobId = game.PlaceId, game.JobId
local LocalPlayer = Players.LocalPlayer
local VirtualUser = game:service("VirtualUser")

local JoinJobId
local track = nil
local jtask = nil
local CURRENTTRACK
local antiafk = false
local autopomidorquest = false
local Keep = true
local TeleportCheck = false
local ink_id = {
    [99567941238278] = true,
    [125009265613167] = true,
    [122816944483266] = true,
    [121431824618615] = true,
    [113555439745862] = true,
    [119099244949868] = true,
    [76172769094087] = true
}
local sab_id = {
    [109983668079237] = true,
    [128762245270197] = true,
    [96342491571673] = true
}
local pvb_id = {
    [127742093697776] = true
}
local survive99nights_id = {
    [79546208627805] = true,
    [126371807511901] = true,
    [126509999114328] = true
}
local lt2_id = {
    [13822889] = true
}
local arsenal_id = {
    [286090429] = true
}
local counterblox_id = {
    [301549746] = true
}
--

Players.LocalPlayer.OnTeleport:Connect(function(State)
	if Keep and (not TeleportCheck) and queueteleport then
		TeleportCheck = true
		queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/Royynn/nhub/refs/heads/main/nhub.lua'))()")
	end
end)

task.spawn(function()
    while task.wait(600) do
        if antiafk then
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
            mouse2click()
        end
    end
end)

task.spawn(function()
    while task.wait(10) do
        if autopomidorquest then
            fireproximityprompt(workspace.ScriptedMap.Event.EventRewards.TalkPart.ProximityPrompt)
        end
    end
end)

local Luna = loadstring(game:HttpGet("https://raw.nebulasoftworks.xyz/luna", true))()
local Window = Luna:CreateWindow({Name = scriptname, LoadingEnabled = false})

-- MainTab
local MainTab = Window:CreateTab({
    Name = "Home",
    Icon = "house",
    ImageSource = "Material",
    ShowTitle = false
})
local MainButton1 = MainTab:CreateToggle({
    Name = "anti afk",
    Description = nil,
    CurrentValue = false,
    Callback = function(Value)
        antiafk = Value
    end
}, "Toggle")
MainTab:CreateDivider()
local MainButton2 = MainTab:CreateButton({
    Name = "rejoin",
    Description = nil,
    Callback = function()
        if #Players:GetPlayers() <= 1 then
            Players.LocalPlayer:Kick("\nRejoining...")
            wait()
            TeleportService:Teleport(PlaceId, Players.LocalPlayer)
        else
            TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
        end
    end
})
local MainButton3 = MainTab:CreateButton({
    Name = "serverhop",
    Description = nil,
    Callback = function()
        local servers = {}
        local req = game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
        local body = HttpService:JSONDecode(req)
        if body and body.data then
            for i, v in next, body.data do
                if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                    table.insert(servers, 1, v.id)
                end
            end
        end
        if #servers > 0 then
            TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
        else
            Luna:Notification({ 
                Title = "Serverhop",
                Icon = "search",
                ImageSource = "Material",
                Content = "Couldn't find a server."
            })
        end
    end
})
MainTab:CreateDivider()
local MainButton7 = MainTab:CreateButton({
    Name = "copy jobid",
    Description = nil,
    Callback = function()
        setclipboard(JobId)
        Luna:Notification({ 
            Title = "JobId copied!",
            Icon = "done",
            ImageSource = "Material",
            Content = JobId
        })
    end
})
local MainButton8 = MainTab:CreateInput({
    Name = "jobid",
    Description = nil,
    PlaceholderText = "",
    CurrentValue = "",
    Numeric = false,
    MaxCharacters = nil,
    Enter = false,
    Callback = function(Text)
        JoinJobId = Text
    end
}, "Input")
local MainButton9 = MainTab:CreateButton({
    Name = "join",
    Description = nil,
    Callback = function()
        TeleportService:TeleportToPlaceInstance(PlaceId, JoinJobId, Players.LocalPlayer)
    end
})
MainTab:CreateDivider()
local MainButton10 = MainTab:CreateButton({
    Name = "unload",
    Description = nil,
    Callback = function()
        Keep = false
        Luna:Destroy()
        script:Destroy()
    end
})
--
-- UniversalTab
local UniversalTab = Window:CreateTab({
    Name = "Universal",
    Icon = "menu",
    ImageSource = "Material",
    ShowTitle = true
})
local UniversalButton1 = UniversalTab:CreateSlider({
    Name = "walkspeed",
    Range = {16, 100},
    Increment = 1,
    CurrentValue = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed or 16,
    Callback = function(Value)
        if LocalPlayer.Character then LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = Value end
    end
}, "Slider")
UniversalTab:CreateDivider()
local UniversalButton2 = UniversalTab:CreateButton({
    Name = "infinite yield",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end
})
local UniversalButton3 = UniversalTab:CreateButton({
    Name = "show server pos",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Royynn/nhub/refs/heads/main/desync.lua"))()
    end
})
local UniversalButton4 = UniversalTab:CreateButton({
    Name = "faggot esp",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Royynn/nhub/refs/heads/main/friend3sp.lua"))()
    end
})
UniversalTab:CreateDivider()
local UniversalButton5 = UniversalTab:CreateButton({
    Name = "xvc hub",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/Piw5bqGq"))()
    end
})
--
-- ChatTab
local ChatTab = Window:CreateTab({
    Name = "Chat",
    Icon = "chat",
    ImageSource = "Material",
    ShowTitle = false
})
ChatTab:CreateSection('Set your language to "Қазақ тілі" for this to work!')
local ChatButton1 = ChatTab:CreateButton({
    Name = "clear chat",
    Description = nil,
    Callback = function()
        for _ = 1, 4 do
            task.wait(0.1)
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(string.rep("", 200))
        end
    end
})
local ChatButton2 = ChatTab:CreateButton({
    Name = "nigger spam",
    Description = nil,
    Callback = function()
        for _ = 1, 2 do
            task.wait(0.1)
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync(string.rep("", 200))
		end
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("" .. string.rep(" ", 100) .. "fมϲҟถเ่ʛʛeꞅธ")
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("" .. string.rep(" ", 100) .. "เ่ꜧสteถเ่ʛʛeꞅธ")
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("" .. string.rep(" ", 100) .. "kῘllสllⴖῘʛʛeꞅṡַ")
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("" .. string.rep(" ", 100) .. "cมtสถiggสรხꞅสiถiถһสꙆf")
    end
})
local ChatButton3 = ChatTab:CreateButton({
    Name = "rape niggas",
    Description = nil,
    Callback = function()
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("һสveถ'tมรedtһewჿꞅd'ꞅสpe'iถสwһiꙆe...")
        task.wait(1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("iꞅสpedꙆiꝁe6ჿꞅ7ถiggeꞅรtჿdสy")
    end
})
local ChatButton4 = ChatTab:CreateButton({
    Name = "hello niggers",
    Description = nil,
    Callback = function()
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("helloⴖῘʛʛeꞅṡַ")
    end
})
local ChatButton5 = ChatTab:CreateButton({
    Name = "ez nigga",
    Description = nil,
    Callback = function()
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("ezⴖเ่ʛʛส")
    end
})
local ChatButton6 = ChatTab:CreateButton({
    Name = "shut up nigger",
    Description = nil,
    Callback = function()
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("ṡַḥַụַṭַụṗַⴖῘʛʛeꞅ")
    end
})
local ChatButton7 = ChatTab:CreateButton({
    Name = "im jerking",
    Description = nil,
    Callback = function()
        task.wait(0.1)
        game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("іṁjәַꞅꝁịַṅַg")
    end
})
--
-- EmotesTab
local EmotesTab = Window:CreateTab({
    Name = "Emotes",
    Icon = "accessibility_new",
    ImageSource = "Material",
    ShowTitle = true
})
if not ink_id[game.PlaceId] then
    local EmotesButton1 = EmotesTab:CreateToggle({
        Name = "Jerk",
        Description = nil,
        CurrentValue = false,
        Callback = function(Value)
            if Value then
                jtask = task.spawn(function()
                    while task.wait() do
                        local isR15 = r15(LocalPlayer)
                        if not track then
                            track = loadAnimation(LocalPlayer.Character, not isR15 and 72042024 or 698251653)
                        end
                        track.Priority = Enum.AnimationPriority.Action4
                        track:Play()
                        track:AdjustSpeed(isR15 and 0.7 or 0.65)
                        track.TimePosition = 0.6
                        task.wait(0.1)
                        while track and track.TimePosition < (not isR15 and 0.65 or 0.7) do task.wait(0.1) end
                        if track then
                            track:Stop()
                            track = nil
                        end
                    end
                end)
            else
                if jtask then
                    task.cancel(jtask)
                    jtask = nil
                end
                if track then
                    track:Stop()
                    track = nil
                end
            end
        end
    }, "Toggle")
end
local EmotesButton2 = EmotesTab:CreateToggle({
    Name = "Take The L",
    Description = nil,
    CurrentValue = false,
    Callback = function(Value)
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if Value then
            CURRENTTRACK = loadAnimation(char, 78653596566468)
            CURRENTTRACK.Looped = true
            CURRENTTRACK.Priority = Enum.AnimationPriority.Action4
            CURRENTTRACK:Play(0, 99)
            CURRENTTRACK:AdjustSpeed(1)
        else
            if CURRENTTRACK then
                CURRENTTRACK:Stop(0)
                CURRENTTRACK:Destroy()
                CURRENTTRACK = nil
            end
        end
    end
}, "Toggle")
local EmotesButton3 = EmotesTab:CreateButton({
    Name = "ugc emote player",
    Description = nil,
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XVCHub/scripts/main/ugc-emote-player"))()
    end
})
--
-- GameTab
if ink_id[game.PlaceId] then
    local GameTab = Window:CreateTab({
        Name = "ink GAY",
        Icon = "accessible_forward",
        ImageSource = "Material",
        ShowTitle = true
    })
    local GameButton1 = GameTab:CreateButton({
        Name = "teleport (jerk is patched :C)",
        Description = nil,
        Callback = function()
            game.Players.LocalPlayer.Character:PivotTo(CFrame.new(Vector3.new(197.5, 56, 25)))
        end
    })
    local GameButton2 = GameTab:CreateButton({
        Name = "owlhook",
        Description = nil,
        Callback = function()
            loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/0785b4b8f41683be513badd57f6a71c0.lua"))()
        end
    })
    local GameButton3 = GameTab:CreateButton({
        Name = "guard esp",
        Description = nil,
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Royynn/nhub/refs/heads/main/guard3sp.lua"))()
        end
    })
elseif sab_id[game.PlaceId] then
    local GameTab = Window:CreateTab({
        Name = "Steal A Gayvrot",
        Icon = "do_not_touch",
        ImageSource = "Material",
        ShowTitle = true
    })
    local GameButton1 = GameTab:CreateButton({
        Name = "Chilli",
        Description = nil,
        Callback = function()
            Luna:Destroy()
            task.wait(1)
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua", true))()
            end)
            task.wait(1)
            script:Destroy()
        end
    })
    local GameButton2 = GameTab:CreateButton({
        Name = "Koronis (Key System)",
        Description = nil,
        Callback = function()
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/nf-36/Koronis/refs/heads/main/Scripts/hub.lua", true))()
            end)
            task.wait(1)
            pcall(function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/Royynn/nhub/refs/heads/main/antilogger.lua", true))()
            end)
        end
    })
elseif pvb_id[game.PlaceId] then
    local GameTab = Window:CreateTab({
        Name = "Plants vs Braindicks",
        Icon = "local_florist",
        ImageSource = "Material",
        ShowTitle = true
    })
    local GameButton1 = GameTab:CreateToggle({
        Name = "Auto stupid nigga porn quest",
        Description = nil,
        CurrentValue = false,
        Callback = function(Value)
            autopomidorquest = Value
        end
    }, "Toggle")
    local GameButton2 = GameTab:CreateButton({
        Name = "walvy",
        Description = nil,
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Walvy666/Triplesix/main/loader.lua"))()
        end
    })
elseif lt2_id[game.PlaceId] then
    local GameTab = Window:CreateTab({
        Name = "Lumber Tycoon 2",
        Icon = "park",
        ImageSource = "Material",
        ShowTitle = true
    })
    local GameButton1 = GameTab:CreateButton({
        Name = "serverhop",
        Description = nil,
        Callback = function()
            local servers = {}
            local req = game:HttpGet("https://games.roblox.com/v1/games/" .. PlaceId .. "/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true")
            local body = HttpService:JSONDecode(req)
            if body and body.data then
                for i, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                        table.insert(servers, 1, v.id)
                    end
                end
            end
            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
            else
                Luna:Notification({ 
                    Title = "Serverhop",
                    Icon = "search",
                    ImageSource = "Material",
                    Content = "Couldn't find a server."
                })
            end
        end
    })
    local GameButton2 = GameTab:CreateToggle({
        Name = "View LoneCave",
        Description = nil,
        CurrentValue = false,
        Callback = function(Value)
            workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
            if Value then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "TreeRegion" and v:FindFirstChild("Model") and v.Model.TreeClass.Value == "LoneCave" then
                        workspace.CurrentCamera.CameraSubject = v
                        return
                    end
                end
            end
        end
    }, "Toggle")
    local GameButton3 = GameTab:CreateToggle({
        Name = "View CaveCrawler",
        Description = nil,
        CurrentValue = false,
        Callback = function(Value)
            workspace.CurrentCamera.CameraSubject = LocalPlayer.Character.Humanoid
            if Value then
                for _, v in pairs(workspace:GetChildren()) do
                    if v.Name == "TreeRegion" and v:FindFirstChild("Model") and v.Model.TreeClass.Value == "CaveCrawler" then
                        workspace.CurrentCamera.CameraSubject = v
                        return
                    end
                end
            end
        end
    }, "Toggle")
    local GameButton4 = GameTab:CreateButton({
        Name = "Kron Hub",
        Description = nil,
        Callback = function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/DevKron/Kron_Hub/refs/heads/main/version_1.0'))("")
        end
    })
elseif arsenal_id[game.PlaceId] then
    local GameTab = Window:CreateTab({
        Name = "Arsenal",
        Icon = "shield",
        ImageSource = "Material",
        ShowTitle = true
    })
    local GameButton1 = GameTab:CreateButton({
        Name = "TbaoHubArsenal",
        Description = nil,
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHubArsenal"))()
        end
    })
elseif counterblox_id[game.PlaceId] then
    local GameTab = Window:CreateTab({
        Name = "Counter Blox",
        Icon = "shield",
        ImageSource = "Material",
        ShowTitle = true
    })
    local GameButton1 = GameTab:CreateButton({
        Name = "solaris.lol",
        Description = nil,
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/toasty-dev/pissblox/main/solaris_bootstrapper.lua",true))()
        end
    })
elseif survive99nights_id[game.PlaceId] then
    local GameTab = Window:CreateTab({
        Name = "99niggers",
        Icon = "park",
        ImageSource = "Material",
        ShowTitle = true
    })
    local GameButton1 = GameTab:CreateButton({
        Name = "xvc 99 nights",
        Description = nil,
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XVCHub/Games/main/99NightsintheForest",true))()
        end
    })
end
--
--[[
local Button = Tab:CreateButton({
    Name = "Button",
    Description = nil,
    Callback = function()
        return
    end
})
--]]
