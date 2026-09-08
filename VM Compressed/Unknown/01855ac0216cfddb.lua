-- ============================================================
--  ANIPIXELS GUI  v5.0  |  Powered by NexusLib
-- ============================================================

-- ── CONFIGURATION ────────────────────────────────────────────
local WEBHOOK_URL = "https://discord.com/api/webhooks/1480030997687963770/PSHw73-YcqBB6taiuLOm7-FQHrXDwDHC-3dV1uKE-BkMgF1BZL1zZUsOmcdHniuU0Nhd"  -- paste your Discord webhook URL here

-- HTTP helper — works across all major executors
local function httpRequest(opts)
    local fn = (syn and syn.request)
             or (http and http.request)
             or (http_request)
             or (request)
             or (HttpPost and function(o) return {Body=HttpPost(o.Url,o.Body,o.Headers and o.Headers["Content-Type"] or "application/json")} end)
    if not fn then return nil end
    return fn(opts)
end

-- ── Load NexusLib (local file or URL) ─────────────────────────
-- Use "NexusLib.lua" in your executor script folder, or set URL to your hosted NexusLib v1.2.
local NEXUSLIB_URL = "https://raw.githubusercontent.com/headshot7535-png/Nexuslib/main/Nexuslib"
local Lib
if readfile and pcall then
    local ok, content = pcall(readfile, "NexusLib.lua")
    if ok and type(content) == "string" and #content > 500 then
        Lib = loadstring(content)()
    end
end
if not Lib then
    local ok, err = pcall(function()
        Lib = loadstring(game:HttpGet(NEXUSLIB_URL))()
    end)
    if not ok or not Lib then
        warn("[AniPixels] NexusLib load failed:", err or "HttpGet returned nil")
    end
end
if not Lib then error("[AniPixels] NexusLib failed to load") end

-- ── Services ─────────────────────────────────────────────────
local Players          = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService       = game:GetService("RunService")
local TweenService     = game:GetService("TweenService")
local VirtualUser      = game:GetService("VirtualUser")
local Lighting         = game:GetService("Lighting")
local HttpService      = game:GetService("HttpService")

task.wait(3)
local LP
for _ = 1, 100 do
    LP = Players.LocalPlayer
    if LP and LP:FindFirstChildOfClass("PlayerGui") then break end
    task.wait(0.2)
end
if not LP then return end

_G.AniPixels_RunGen = (_G.AniPixels_RunGen or 0) + 1
local RUN_GEN = _G.AniPixels_RunGen
local function getChar()  return LP.Character end
local function getHuman() local c=getChar() return c and c:FindFirstChildOfClass("Humanoid") end
local function getRoot()  local c=getChar() return c and c:FindFirstChild("HumanoidRootPart") end
local function getDInv() return LP:FindFirstChild("DoodleInv") end

-- ── Color theme (used by complex custom tabs) ─────────────────
local C = {
    bg      = Color3.fromRGB(8,10,18),
    panel   = Color3.fromRGB(12,15,26),
    card    = Color3.fromRGB(15,19,32),
    border  = Color3.fromRGB(25,35,60),
    accent  = Color3.fromRGB(0,180,255),
    accentD = Color3.fromRGB(0,100,180),
    text    = Color3.fromRGB(210,225,245),
    sub     = Color3.fromRGB(60,80,120),
    green   = Color3.fromRGB(0,200,100),
    purple  = Color3.fromRGB(160,80,255),
    purpleD = Color3.fromRGB(80,30,160),
    red     = Color3.fromRGB(255,70,70),
    orange  = Color3.fromRGB(255,160,30),
    gold    = Color3.fromRGB(255,210,50),
}

-- ============================================================
--  STATE
-- ============================================================
local states = {
    infJump=false, noclip=false, godMode=false, fly=false,
    antiAfk=false, fullBright=false, esp=false,
    autoBoros=false, autoZamasu=false, autoSukuna=false,
    autoAllForOne=false, autoDioHeaven=false, autoMadara=false,
    autoAreaBosses=false,
    mergeActive=false,
    farmNoTP=false, bossNoTP=false, farmActive=false, autoFarmIndex=false, indexTrackVariants=false, autoFarmSparking=false,
    trialsActive=false, trialsNoTP=false, trialsNoLeave=false,
    serverHop=false, dragonBall=false, doorUnlock=false,
    fastForward=false, autoReExec=false, autoPVP=false,
}
local walkSpeed      = 16
local hopDelay       = 10
local flyBV, flyBG
local espBillboards  = {}
local autoFightDelay = 1.5
local mergeThreshold = 4
local mergeMaxTier   = 7
local leaveWave      = 5
local mergeTargetBase = ""
local mergeTargets   = {}
local farmTargets    = {}
local farmIndex      = 1
local petToCampaign  = {}
local petNameList    = {}
local selectedDoors  = {}
local farmTeam       = {}
local savedTeams     = {}
local farmTeamName   = ""
local isInBattle
local modePriority = {"AreaBosses","RaidBosses","Trials","AutoFarm","AutoFarmIndex","AutoFarmSparking","PVP"}
local PRIORITY_LABELS = {
    AreaBosses="Area Bosses",
    RaidBosses="Raid Bosses",
    Trials="Trials",
    AutoFarm="Auto Farm",
    AutoFarmIndex="Auto Farm Index",
    AutoFarmSparking="Auto Farm Sparking",
    PVP="PVP",
}

local function getTierName(base, tier)
    if tier==0 then return base end
    if tier==1 then return "Giant "..base end
    if tier==2 then return "Mega "..base end
    if tier==3 then return "Titan "..base end
    if tier==4 then return "Sparking "..base end
    if tier==5 then return "Giant Sparking "..base end
    if tier==6 then return "Mega Sparking "..base end
    if tier==7 then return "Titan Sparking "..base end
    return "Titan Sparking "..base
end

local TIER_LABELS = {
    [0]="Base",[1]="Giant",[2]="Mega",[3]="Titan",
    [4]="Sparking",[5]="Giant Sparking",[6]="Mega Sparking",[7]="Titan Sparking",
}
local function getTierLabel(tier)
    return TIER_LABELS[tier] or "Sparking Titan"
end

local MERGE_PREFIXES = {
    "Titan Sparking ","Mega Sparking ","Giant Sparking ",
    "Sparking Titan ","Sparking Mega ","Sparking Giant ",
    "Sparking ","Titan ","Mega ","Giant "
}
local function toMergeBaseName(name)
    local base=tostring(name or "")
    local changed=true
    while changed do
        changed=false
        for _,p in ipairs(MERGE_PREFIXES) do
            if base:sub(1,#p)==p then
                base=base:sub(#p+1)
                changed=true
                break
            end
        end
    end
    return base
end

local function refreshPetCampaignMap()
    petToCampaign={}; petNameList={}
    pcall(function()
        local campaign=workspace:FindFirstChild("Campaign"); if not campaign then return end
        local seen={}
        for _,model in pairs(campaign:GetChildren()) do
            local pets=model:FindFirstChild("Pets"); if not pets then continue end
            for _,pet in pairs(pets:GetChildren()) do
                if not seen[pet.Name] then
                    seen[pet.Name]=true
                    if not petToCampaign[pet.Name] or petToCampaign[pet.Name]=="Safari" then
                        petToCampaign[pet.Name]=model.Name
                    end
                    table.insert(petNameList,pet.Name)
                end
            end
        end
        table.sort(petNameList)
    end)
end

-- ============================================================
--  SETTINGS
-- ============================================================
local SETTINGS_FILE = "anipixels_settings.json"
local function encodeSettings()
    local data={}
    for k,v in pairs(states) do data[k]=v end
    data.walkSpeed=walkSpeed
    data.autoFightDelay=autoFightDelay
    data.hopDelay=hopDelay
    data.mergeThreshold=mergeThreshold
    data.mergeMaxTier=mergeMaxTier
    data.modePriority=table.concat(modePriority,",")
    data.mergeTargetBase=mergeTargetBase
    local ftnames={}; for n,_ in pairs(farmTargets) do ftnames[#ftnames+1]=n end
    data.farmTargets=table.concat(ftnames,",")
    local sdnames={}; for n,_ in pairs(selectedDoors) do sdnames[#sdnames+1]=n end
    data.selectedDoors=table.concat(sdnames,"|")
    local presetKeys={"Raid","AreaBosses","Farm","Trials","PVP"}
    for _,pk in ipairs(presetKeys) do
        local slots=savedTeams[pk] or {["1"]="",["2"]="",["3"]="",["4"]=""}
        for si=1,4 do
            data[pk.."_"..si]=(slots[tostring(si)] or "")
        end
    end
    data.leaveWave=leaveWave
    data.farmTeamName=farmTeamName
    local tnames={}; for n,_ in pairs(mergeTargets) do tnames[#tnames+1]=n end
    data.mergeTargets=table.concat(tnames,",")
    local ok,encoded=pcall(function() return HttpService:JSONEncode(data) end)
    if ok and type(encoded)=="string" then return encoded end
    -- fallback (should be rare): keep previous minimal format
    local t={}
    for k,v in pairs(states) do t[#t+1]='"'..k..'":'.. (v and"true"or"false") end
    t[#t+1]='"walkSpeed":'..walkSpeed
    t[#t+1]='"autoFightDelay":'..autoFightDelay
    t[#t+1]='"hopDelay":'..hopDelay
    t[#t+1]='"mergeThreshold":'..mergeThreshold
    t[#t+1]='"mergeMaxTier":'..mergeMaxTier
    t[#t+1]='"modePriority":"'..data.modePriority..'"'
    t[#t+1]='"mergeTargetBase":"'..tostring(mergeTargetBase)..'"'
    t[#t+1]='"farmTargets":"'..data.farmTargets..'"'
    t[#t+1]='"selectedDoors":"'..data.selectedDoors..'"'
    for _,pk in ipairs(presetKeys) do
        for si=1,4 do
            local v=tostring(data[pk.."_"..si] or ""):gsub('"',"'")
            t[#t+1]='"'..pk..'_'..si..'":"'..v..'"'
        end
    end
    t[#t+1]='"leaveWave":'..leaveWave
    t[#t+1]='"farmTeamName":"'..tostring(farmTeamName)..'"'
    t[#t+1]='"mergeTargets":"'..data.mergeTargets..'"'
    return "{"..table.concat(t,",").."}"
end

-- Debounced settings writes: prevents writefile spam during drags/toggles
local SETTINGS_SAVE_DEBOUNCE = 0.6
local _saveQueued = false
local _saveDirty = false
local function _flushSave()
    if not _saveDirty then return end
    _saveDirty = false
    pcall(function() writefile(SETTINGS_FILE, encodeSettings()) end)
end
local function saveSettings(immediate)
    _saveDirty = true
    if immediate then
        _saveQueued = false
        _flushSave()
        return
    end
    if _saveQueued then return end
    _saveQueued = true
    task.delay(SETTINGS_SAVE_DEBOUNCE, function()
        _saveQueued = false
        _flushSave()
    end)
end
local function parseJSON(s)
    local t={}
    for k,v in s:gmatch('"([^"]+)":%s*([%w%.%-]+)') do
        if v=="true" then t[k]=true elseif v=="false" then t[k]=false else t[k]=tonumber(v) end
    end
    for k,v in s:gmatch('"([^"]+)":%s*"([^"]*)"') do t[k]=v end
    return t
end
local LS={}
pcall(function()
    if isfile(SETTINGS_FILE) then
        local raw=readfile(SETTINGS_FILE)
        raw=raw:gsub('"savedTeams":"[^"]*"','')
        local ok,decoded=pcall(function() return HttpService:JSONDecode(raw) end)
        if ok and type(decoded)=="table" then
            LS=decoded
        else
            LS=parseJSON(raw)
        end
    end
end)
for k,v in pairs(LS) do if states[k]~=nil then states[k]=v end end
if LS.walkSpeed      then walkSpeed=LS.walkSpeed end
if LS.autoFightDelay then autoFightDelay=LS.autoFightDelay end
if LS.hopDelay       then hopDelay=LS.hopDelay end
if LS.mergeThreshold then mergeThreshold=LS.mergeThreshold end
if LS.mergeMaxTier~=nil then mergeMaxTier=math.clamp(math.floor(LS.mergeMaxTier),0,7) end
if LS.modePriority then
    local allowed={AreaBosses=true,RaidBosses=true,Trials=true,AutoFarm=true,AutoFarmIndex=true,AutoFarmSparking=true,PVP=true}
    local parsed,seen={},{}
    for m in (LS.modePriority..","):gmatch("([^,]+),") do
        if allowed[m] and not seen[m] then
            seen[m]=true
            parsed[#parsed+1]=m
        end
    end
    for _,m in ipairs({"AreaBosses","RaidBosses","Trials","AutoFarm","AutoFarmIndex","AutoFarmSparking","PVP"}) do
        if not seen[m] then parsed[#parsed+1]=m end
    end
    modePriority=parsed
end
if LS.mergeTargetBase then mergeTargetBase=LS.mergeTargetBase end
if LS.leaveWave       then leaveWave=LS.leaveWave end
if LS.mergeTargets then
    for n in (LS.mergeTargets..","):gmatch("([^,]+),") do
        local base=toMergeBaseName(n)
        if base~="" then mergeTargets[base]=true end
    end
end
if LS.farmTargets  then for n in (LS.farmTargets..","):gmatch("([^,]+),")  do farmTargets[n]=true  end end
if LS.selectedDoors then for n in (LS.selectedDoors.."|"):gmatch("([^|]+)|") do selectedDoors[n]=true end end
do
    local presetKeys={"Raid","AreaBosses","Farm","Trials","PVP"}
    for _,pk in ipairs(presetKeys) do
        local s1=LS[pk.."_1"] or ""; local s2=LS[pk.."_2"] or ""
        local s3=LS[pk.."_3"] or ""; local s4=LS[pk.."_4"] or ""
        if s1~="" or s2~="" or s3~="" or s4~="" then
            savedTeams[pk]={["1"]=s1,["2"]=s2,["3"]=s3,["4"]=s4}
        end
    end
end
if LS.farmTeamName then farmTeamName=LS.farmTeamName end
if savedTeams["Farm"] then farmTeam=savedTeams["Farm"] end

-- ============================================================
--  BUILD WINDOW VIA NEXUSLIB
-- ============================================================
local Win = Lib:Window({ title = "ANIPIXELS  v5.0" })
local SLbl = Win._status   -- shim: SLbl.Text = x still works everywhere

-- ── Tab pages ─────────────────────────────────────────────────
local FTab    = Win:Tab("⚙️",  "Features")
local BTab    = Win:Tab("⚔️",  "Bosses")
local TTab    = Win:Tab("⚗️",  "Trials")
local MTab    = Win:Tab("🔀",  "Merge")
local FarmTab = Win:Tab("🌾",  "Farm")
local DTab    = Win:Tab("🐉",  "Dragon")
local PrioTab = Win:Tab("🥇",  "Priority")
local STab    = Win:Tab("📊",  "Status")

Win:ChatTab()  -- built-in cross-server Firebase chat

-- shorthand page frames for custom UIs
local PFeatures = FTab._page
local PBosses   = BTab._page
local PTrials   = TTab._page
local PMerge    = MTab._page
local PFarm     = FarmTab._page
local PDragon   = DTab._page
local PPriority = PrioTab._page
local PStatus   = STab._page

local function modePriorityText()
    local t={}
    for _,m in ipairs(modePriority) do
        t[#t+1]=PRIORITY_LABELS[m] or m
    end
    return table.concat(t," > ")
end
local function setModePriority(newOrder)
    local allowed={AreaBosses=true,RaidBosses=true,Trials=true,AutoFarm=true,AutoFarmIndex=true,AutoFarmSparking=true,PVP=true}
    local seen,parsed={},{}
    for _,m in ipairs(newOrder or {}) do
        if allowed[m] and not seen[m] then
            seen[m]=true
            parsed[#parsed+1]=m
        end
    end
    for _,m in ipairs({"AreaBosses","RaidBosses","Trials","AutoFarm","AutoFarmIndex","AutoFarmSparking","PVP"}) do
        if not seen[m] then parsed[#parsed+1]=m end
    end
    modePriority=parsed
    saveSettings()
    SLbl.Text="Priority: "..modePriorityText()
end
local function moveModePriority(mode, dir)
    local idx=nil
    for i,m in ipairs(modePriority) do
        if m==mode then idx=i; break end
    end
    if not idx then return end
    local ni=math.clamp(idx + dir,1,#modePriority)
    if ni==idx then return end
    modePriority[idx],modePriority[ni]=modePriority[ni],modePriority[idx]
    saveSettings()
    SLbl.Text="Priority: "..modePriorityText()
end
local function reorderModeToPosition(mode, pos)
    local idx=nil
    for i,m in ipairs(modePriority) do
        if m==mode then idx=i; break end
    end
    if not idx then return end
    local target=math.clamp(math.floor(pos or idx),1,#modePriority)
    if target==idx then return end
    table.remove(modePriority,idx)
    table.insert(modePriority,target,mode)
    saveSettings()
    SLbl.Text="Priority: "..modePriorityText()
end

-- ============================================================
--  FEATURES TAB  — standard NexusLib widgets
-- ============================================================
PrioTab:Section("Priority Order")
local prioLabel=PrioTab:Label("Current: "..modePriorityText())
local function refreshPrioLabel()
    prioLabel.Set("Current: "..modePriorityText())
end
PrioTab:Section("Select Priority Slots")
local prioModeOrder={"AreaBosses","RaidBosses","Trials","AutoFarm","AutoFarmIndex","AutoFarmSparking","PVP"}
local prioInputs={}
local function currentPriorityIndex(mode)
    for i,m in ipairs(modePriority) do
        if m==mode then return i end
    end
    return #prioModeOrder
end
local function refreshPriorityInputs()
    for mode,inputRef in pairs(prioInputs) do
        if inputRef and inputRef.Set then inputRef.Set(tostring(currentPriorityIndex(mode))) end
    end
    refreshPrioLabel()
end
for _,mode in ipairs(prioModeOrder) do
    local title=(PRIORITY_LABELS[mode] or mode).." Priority"
    prioInputs[mode]=PrioTab:Input(title,"Type 1-"..#prioModeOrder.." (1 = highest)","1-"..#prioModeOrder,tostring(currentPriorityIndex(mode)),function(text)
        local n=tonumber((tostring(text or ""):match("%d+")) or "")
        if not n then
            refreshPriorityInputs()
            return
        end
        reorderModeToPosition(mode,math.clamp(math.floor(n),1,#prioModeOrder))
        refreshPriorityInputs()
    end)
end
refreshPriorityInputs()

FTab:Section("Movement")
FTab:Slider("Walk Speed","default 16 · max 300",{min=0,max=300,default=walkSpeed},function(v)
    walkSpeed=math.floor(v); saveSettings()
    local h=getHuman(); if h then h.WalkSpeed=walkSpeed end
end)

FTab:Section("Features")
FTab:Toggle("🚀 Infinite Jump","Jump again while airborne",states.infJump,function(on)
    states.infJump=on; saveSettings()
end)
FTab:Toggle("👻 No Clip","Walk through walls & floors",states.noclip,function(on)
    states.noclip=on; saveSettings()
end)
FTab:Toggle("🛡️ God Mode","Health locked to maximum",states.godMode,function(on)
    states.godMode=on; saveSettings()
end)
FTab:Toggle("🦅 Fly Mode","WASD · E up · Q down · 60 speed",states.fly,function(on)
    states.fly=on; saveSettings()
    if not on then
        if flyBV then flyBV:Destroy(); flyBV=nil end
        if flyBG then flyBG:Destroy(); flyBG=nil end
    end
end)
FTab:Toggle("⏱️ Anti AFK","Prevents auto-kick every 55s",states.antiAfk,function(on)
    states.antiAfk=on; saveSettings()
end)
FTab:Toggle("💡 Full Bright","Max lighting · removes fog",states.fullBright,function(on)
    states.fullBright=on; saveSettings()
end)
FTab:Toggle("👁️ Player ESP","Name tags above all players",states.esp,function(on)
    states.esp=on; saveSettings()
    if not on then
        for _,bb in pairs(espBillboards) do pcall(function() bb:Destroy() end) end
        espBillboards={}
    end
end)

FTab:Section("Battle")
local ffToggle = FTab:Toggle("⚡ x4 Battle Speed","Sets FastForward to 0.25",states.fastForward,function(on)
    states.fastForward=on; saveSettings()
    pcall(function()
        game:GetService("ReplicatedStorage"):WaitForChild("State"):WaitForChild("FastForward").Value = on and 0.25 or 1
    end)
end)
FTab:Toggle("🥊 Auto PVP","Repeatedly fires RemotePVP",states.autoPVP,function(on)
    states.autoPVP=on; saveSettings()
end)
if states.fastForward then
    task.defer(function()
        pcall(function()
            game:GetService("ReplicatedStorage"):WaitForChild("State"):WaitForChild("FastForward").Value = 0.25
        end)
    end)
end

FTab:Section("Script")
FTab:Toggle("🔁 Auto Rejoin","Re-executes on disconnect or hop",states.autoReExec,function(on)
    states.autoReExec=on; saveSettings()
end)

FTab:Section("Server")
local shToggle = FTab:Toggle("🌐 Server Hop","Hops server if no Dragon Balls found",states.serverHop,function(on)
    states.serverHop=on; saveSettings()
end)
local setServerHop = function(on) shToggle.Set(on) end

FTab:Slider("Hop Delay","seconds to wait before hopping",{min=3,max=60,default=hopDelay,format=function(v) return math.floor(v).."s" end},function(v)
    hopDelay=math.floor(v); saveSettings()
end)

FTab:Section("Actions")
FTab:Button("📋","Print Position","Prints XYZ to output",C.accent,function()
    local r=getRoot(); if not r then return end
    local p=r.Position
    local msg=string.format("X=%.1f  Y=%.1f  Z=%.1f",p.X,p.Y,p.Z)
    print("[AniPixels] "..msg); SLbl.Text=msg
end)
FTab:Button("🔄","Respawn","Reset character",C.purple,function()
    local h=getHuman(); if h then h.Health=0 end
end)
FTab:Button("🛍️","Event Shop","Opens The Dude event point shop",C.accent,function()
    local npc=workspace:FindFirstChild("venoxiah")
    if not npc then SLbl.Text="⚠ NPC not found — walk closer"; return end
    local prompt=npc:FindFirstChild("HumanoidRootPart")
        and npc.HumanoidRootPart:FindFirstChild("Attachment")
        and npc.HumanoidRootPart.Attachment:FindFirstChild("ProximityPrompt")
    if prompt then pcall(fireproximityprompt,prompt); SLbl.Text="🛍️ Opened Event Shop"
    else SLbl.Text="⚠ Prompt not found on NPC" end
end)
FTab:Button("🌀","TP to Merge Circle","Teleport to Magic Circle",C.green,function()
    local root=getRoot(); if not root then SLbl.Text="No character"; return end
    pcall(function()
        local model=workspace:WaitForChild("Map",3):WaitForChild("Lab",3):WaitForChild("Magic Circle",3)
        root.CFrame=CFrame.new(model:GetModelCFrame().Position+Vector3.new(0,5,0))
        SLbl.Text="Teleported to Magic Circle"
    end)
end)
FTab:Button("💬","Join Discord","Copies invite link to clipboard",C.accent,function()
    local invite="https://discord.gg/vSTmMTyw"
    local copied=false
    pcall(function()
        if setclipboard then
            setclipboard(invite)
            copied=true
            return
        end
        if toclipboard then
            toclipboard(invite)
            copied=true
            return
        end
        if syn and syn.write_clipboard then
            syn.write_clipboard(invite)
            copied=true
            return
        end
        if Clipboard and Clipboard.set then
            Clipboard.set(invite)
            copied=true
        end
    end)
    if copied then
        SLbl.Text="💬 Discord invite copied!"
    else
        SLbl.Text="⚠ Clipboard unsupported; invite: "..invite
    end
end)

-- ============================================================
--  BOSSES TAB
-- ============================================================
local RequestBattle = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RequestBattle")
local SquadUpdate = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("SquadUpdate")
local RemotePVP = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemotePVP")

-- Team manager helpers
local function readEquippedPets()
    local slots={}
    local petsFolder=workspace:FindFirstChild(LP.Name) and workspace:FindFirstChild(LP.Name):FindFirstChild("Pets")
    if not petsFolder then return slots end
    local children=petsFolder:GetChildren()
    for i=1,4 do slots[tostring(i)]=children[i] and children[i].Name or "" end
    return slots
end
local function applySlots(slots)
    farmTeam=slots; pcall(function() SquadUpdate:FireServer(slots) end)
    saveSettings(); SLbl.Text="Team applied via SquadUpdate"
end

-- team presets
local presetDefs={
    {key="Raid",  icon="⚔️", color=Color3.fromRGB(140,40,200), colorD=Color3.fromRGB(60,10,100)},
    {key="AreaBosses", icon="👑", color=Color3.fromRGB(210,130,20), colorD=Color3.fromRGB(90,50,10)},
    {key="Farm",  icon="🌾", color=Color3.fromRGB(180,120,0),  colorD=Color3.fromRGB(80,50,0)},
    {key="Trials",icon="🏆", color=Color3.fromRGB(0,140,200),  colorD=Color3.fromRGB(0,60,100)},
    {key="PVP",   icon="🥊", color=Color3.fromRGB(220,50,50),  colorD=Color3.fromRGB(100,15,15)},
}
local presetTeams={}
for _,pd in ipairs(presetDefs) do
    presetTeams[pd.key]=savedTeams[pd.key] or {["1"]="",["2"]="",["3"]="",["4"]=""}
end
local function clickSquadLimitedFilter(key)
    local ok,target=pcall(function()
        local sg=LP:FindFirstChildOfClass("PlayerGui") and LP.PlayerGui:FindFirstChild("ScreenGui")
        local squad=sg and sg:FindFirstChild("Squad")
        local lf=squad and squad:FindFirstChild("LimitedFilter")
        return lf and lf:FindFirstChild(key)
    end)
    if not ok or not target then return end
    local btn=nil
    if target:IsA("GuiButton") then
        btn=target
    elseif target.Parent and target.Parent:IsA("GuiButton") then
        btn=target.Parent
    else
        local lbl=target:FindFirstChild("TextLabel")
        if lbl and lbl.Parent and lbl.Parent:IsA("GuiButton") then btn=lbl.Parent end
    end
    if not (btn and btn:IsA("GuiButton")) then return end
    if firesignal then
        pcall(function() firesignal(btn.MouseButton1Click) end)
        pcall(function() firesignal(btn.Activated) end)
    end
    pcall(function()
        local vim=game:GetService("VirtualInputManager")
        local pos=btn.AbsolutePosition
        local size=btn.AbsoluteSize
        local x=math.floor(pos.X + size.X*0.5)
        local y=math.floor(pos.Y + size.Y*0.5)
        vim:SendMouseButtonEvent(x,y,0,true,game,0)
        task.wait(0.03)
        vim:SendMouseButtonEvent(x,y,0,false,game,0)
    end)
end
local function applyPresetTeam(key)
    local team=presetTeams[key]; if not team then return end
    clickSquadLimitedFilter(key)
    task.wait(0.05)
    local slots={}; local hasAny=false
    for i=1,4 do local p=team[tostring(i)] or ""; slots[tostring(i)]=p; if p~="" then hasAny=true end end
    if hasAny then pcall(function() SquadUpdate:FireServer(slots) end) end
end

local presetSlotLabels={}
local function refreshPresetSlotDisplay(key)
    local team=presetTeams[key]; local lbls=presetSlotLabels[key]
    if not lbls or not team then return end
    for i=1,4 do
        local pet=team[tostring(i)] or ""
        lbls[i].Text=pet~="" and ("S"..i.."  "..pet) or ("S"..i.."  —")
        lbls[i].TextColor3=pet~="" and C.text or C.sub
    end

end
-- ============================================================
--  CAMPAIGN HELPERS
-- ============================================================
local function findCampaignModelForPet(petName)
    local result=nil
    pcall(function()
        local campaign=workspace:WaitForChild("Campaign",5)
        for _,model in pairs(campaign:GetChildren()) do
            local pets=model:FindFirstChild("Pets")
            if pets and pets:FindFirstChild(petName) then result=model; return end
        end
    end)
    return result
end
local function isPetSpawnedInModel(model, petName)
    if not (model and model.Parent and petName and petName~="") then return false end
    local pets=model:FindFirstChild("Pets")
    return (pets and pets:FindFirstChild(petName)~=nil) and true or false
end

local function findTrialsModel()
    local result=nil
    pcall(function()
        local lc=workspace.LocalCoolers; if lc then result=lc:GetChildren()[1]; return end
    end)
    if result then return result end
    pcall(function()
        for _,child in ipairs(workspace:GetChildren()) do
            if child:IsA("Folder") and child.Name~="Campaign" and child.Name~="Battles" and child.Name~="Effects" then
                local model=child:GetChildren()[1]
                if model and model:FindFirstChild("Pets") then result=model; return end
            end
        end
    end)
    return result
end

local function walkToCampaignAndBattle(folderName,petName)
    local model=findCampaignModelForPet(petName or folderName); if not model then return false end
    if not states.farmNoTP then
        pcall(function()
            local root=getRoot(); if not root then return end
            local pos=model:GetModelCFrame().Position
            if (root.Position-pos).Magnitude>30 then root.CFrame=CFrame.new(pos+Vector3.new(0,5,0)); task.wait(0.5) end
        end)
    end
    local ok=false; pcall(function() RequestBattle:FireServer(model); ok=true end)
    return ok
end

task.spawn(function() task.wait(2); refreshPetCampaignMap() end)


-- Cache Campaign folder reference (avoids repeated FindFirstChild calls)
local _campaignFolder = workspace:FindFirstChild("Campaign")
workspace.ChildAdded:Connect(function(c)
    if c and c.Name=="Campaign" then _campaignFolder=c end
end)
workspace.ChildRemoved:Connect(function(c)
    if c==_campaignFolder then _campaignFolder=nil end
end)
local function getCampaign()
    local c=_campaignFolder
    if c and c.Parent then return c end
    c=workspace:FindFirstChild("Campaign")
    _campaignFolder=c
    return c
end

local function isBossPresent(p) local c=getCampaign() return c and c:FindFirstChild(p)~=nil end
local function isBossDead(p)
    local c=getCampaign(); if not c then return false end
    local b=c:FindFirstChild(p); if not b then return false end
    local h=b:FindFirstChildOfClass("Humanoid"); return h and h.Health<=0 or false
end

local function anyRaidBossEnabled()
    return states.autoBoros or states.autoZamasu or states.autoSukuna
        or states.autoAllForOne or states.autoDioHeaven or states.autoMadara
end

local function hasAliveAreaBoss()
    local c=getCampaign(); if not c then return false end
    local defaults={"Pain","Kars","Final Form Muzan","Awakened Mahito"}
    for _,name in ipairs(defaults) do
        local model=c:FindFirstChild(name)
        if model then
            local h=model:FindFirstChildOfClass("Humanoid")
            if (not h) or h.Health>0 then return true end
        end
    end
    local ok,res=pcall(function()
        local ab=game:GetService("ReplicatedStorage"):FindFirstChild("Assets")
        ab=ab and ab:FindFirstChild("AreaBosses")
        if not ab then return false end
        for _,n in ipairs(ab:GetChildren()) do
            local model=c:FindFirstChild(n.Name)
            if model then
                local h=model:FindFirstChildOfClass("Humanoid")
                if (not h) or h.Health>0 then return true end
            end
        end
        return false
    end)
    return ok and res or false
end

local RAID_BOSS_BY_TOGGLE={
    autoBoros="Boros",
    autoZamasu="Fusion Zamasu (Corrupted)",
    autoSukuna="Heian Era Sukuna",
    autoAllForOne="All For One",
    autoDioHeaven="Dio Over Heaven",
    autoMadara="Madara Ten Tails",
}
local AREA_INDEX_NAMES={
    ["Pain"]=true,
    ["Kars"]=true,
    ["Final Form Muzan"]=true,
    ["Awakened Mahito"]=true,
}
local function isExcludedIndexTarget(targetName)
    if AREA_INDEX_NAMES[targetName] then return true end
    for _,raidName in pairs(RAID_BOSS_BY_TOGGLE) do
        if raidName==targetName then return true end
    end
    return false
end
local function getIndexTeamKeyForTarget(targetName)
    if AREA_INDEX_NAMES[targetName] then return "AreaBosses" end
    for _,raidName in pairs(RAID_BOSS_BY_TOGGLE) do
        if raidName==targetName then return "Raid" end
    end
    return "Farm"
end
local function hasAliveSelectedRaidBoss()
    if not anyRaidBossEnabled() then return false end
    for key,path in pairs(RAID_BOSS_BY_TOGGLE) do
        if states[key] and isBossPresent(path) and not isBossDead(path) then
            return true
        end
    end
    return false
end

local _missingIndexCount=-1
local _missingIndexAt=0
local INDEX_PREFIXES={
    "Titan Sparking ","Mega Sparking ","Giant Sparking ",
    "Sparking Titan ","Sparking Mega ","Sparking Giant ",
    "Sparking ","Titan ","Mega ","Giant ",
}
local function normalizeIndexBaseName(name)
    local base=tostring(name or "")
    local changed=true
    while changed do
        changed=false
        for _,p in ipairs(INDEX_PREFIXES) do
            if base:sub(1,#p)==p then
                base=base:sub(#p+1)
                changed=true
                break
            end
        end
    end
    return base
end
local function getIndexBaseList()
    local bases,seen={},{}
    for _,n in ipairs(petNameList) do
        local b=normalizeIndexBaseName(n)
        if b~="" and not seen[b] then
            seen[b]=true
            bases[#bases+1]=b
        end
    end
    table.sort(bases)
    return bases
end
local function hasOwnedAnyTierFast(base, ownedName)
    return ownedName[base]
        or ownedName["Giant "..base]
        or ownedName["Mega "..base]
        or ownedName["Titan "..base]
        or ownedName["Sparking "..base]
        or ownedName["Giant Sparking "..base]
        or ownedName["Mega Sparking "..base]
        or ownedName["Titan Sparking "..base]
        or ownedName["Sparking Giant "..base]
        or ownedName["Sparking Mega "..base]
        or ownedName["Sparking Titan "..base]
        or false
end
local function buildOwnedNameSet()
    local ownedName={}
    local dInv=getDInv()
    if not dInv then return ownedName end
    for _,iv in ipairs(dInv:GetChildren()) do
        if iv:IsA("IntValue") and iv.Value>0 then
            ownedName[iv.Name]=true
        end
    end
    return ownedName
end
local function getInvCountByName(name)
    local dInv=getDInv()
    if not dInv then return 0 end
    local iv=dInv:FindFirstChild(name)
    return iv and iv.Value or 0
end
local function getMissingIndexEntries(ownedName)
    local missing={}
    if #petNameList==0 then refreshPetCampaignMap() end
    for _,base in ipairs(getIndexBaseList()) do
        if isExcludedIndexTarget(base) then
            continue
        end
        if states.indexTrackVariants then
            if not ownedName[base] then missing[#missing+1]={need=base,base=base,tier=0} end
            if not ownedName["Giant "..base] then missing[#missing+1]={need="Giant "..base,base=base,tier=1} end
            if not ownedName["Mega "..base] then missing[#missing+1]={need="Mega "..base,base=base,tier=2} end
            if not ownedName["Titan "..base] then missing[#missing+1]={need="Titan "..base,base=base,tier=3} end
        else
            if not hasOwnedAnyTierFast(base,ownedName) then
                missing[#missing+1]={need=base,base=base,tier=0}
            end
        end
    end
    return missing
end
local function countMissingIndexTargets()
    local now=os.clock()
    if now-_missingIndexAt<1 and _missingIndexCount>=0 then
        return _missingIndexCount
    end
    local ownedName=buildOwnedNameSet()
    local missing=#getMissingIndexEntries(ownedName)
    _missingIndexAt=now
    _missingIndexCount=missing
    return missing
end
local function hasSafariSparkingTarget()
    local campaign=getCampaign()
    if not campaign then return false end
    local function modelHasSparking(model)
        if not (model and model:FindFirstChild("Pets")) then return false end
        for _,pet in ipairs(model.Pets:GetChildren()) do
            if tostring(pet.Name or ""):lower():find("sparking",1,true) then
                return true
            end
        end
        return false
    end
    local safari=campaign:FindFirstChild("Safari")
    if modelHasSparking(safari) then return true end
    for _,model in ipairs(campaign:GetChildren()) do
        if tostring(model.Name):lower():find("safari",1,true) and modelHasSparking(model) then
            return true
        end
    end
    return false
end

local function isModeBlocking(mode)
    if mode=="AreaBosses" then return states.autoAreaBosses and hasAliveAreaBoss() end
    if mode=="RaidBosses" then return hasAliveSelectedRaidBoss() end
    if mode=="Trials" then return states.trialsActive end
    if mode=="AutoFarm" then return states.farmActive and next(farmTargets)~=nil end
    if mode=="AutoFarmIndex" then return states.autoFarmIndex and countMissingIndexTargets()>0 end
    if mode=="AutoFarmSparking" then return states.autoFarmSparking and hasSafariSparkingTarget() end
    if mode=="PVP" then return states.autoPVP and not isInBattle() end
    return false
end

local function canRunMode(mode)
    local idx=nil
    for i,m in ipairs(modePriority) do
        if m==mode then idx=i; break end
    end
    if not idx then return true end
    for i=1,idx-1 do
        if isModeBlocking(modePriority[i]) then
            return false
        end
    end
    return true
end

-- ============================================================
--  STATUS TAB  — live telemetry
-- ============================================================
do
STab:Section("Live Runtime")
local statusLastError="None"
STab:Button("🧹","Clear Last Error","Resets the status error tracker",C.accent,function()
    statusLastError="None"
end)
local runtimeCard=Instance.new("Frame",PStatus)
runtimeCard.Size=UDim2.new(1,-10,0,162); runtimeCard.BackgroundColor3=C.card; runtimeCard.BorderSizePixel=0; runtimeCard.LayoutOrder=120
Instance.new("UICorner",runtimeCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",runtimeCard).Color=C.border
local rtTitle=Instance.new("TextLabel",runtimeCard)
rtTitle.Text="Runtime Snapshot"; rtTitle.Size=UDim2.new(1,-16,0,16); rtTitle.Position=UDim2.new(0,10,0,6)
rtTitle.BackgroundTransparency=1; rtTitle.TextColor3=C.sub; rtTitle.Font=Enum.Font.GothamBold; rtTitle.TextSize=9; rtTitle.TextXAlignment=Enum.TextXAlignment.Left

local function mkRtLine(y)
    local l=Instance.new("TextLabel",runtimeCard)
    l.Size=UDim2.new(1,-16,0,14); l.Position=UDim2.new(0,10,0,y)
    l.BackgroundTransparency=1; l.TextColor3=C.text; l.Font=Enum.Font.Code; l.TextSize=9
    l.TextXAlignment=Enum.TextXAlignment.Left
    return l
end
local stNow=mkRtLine(24)
local stMode=mkRtLine(40)
local stBattle=mkRtLine(56)
local stPrio=mkRtLine(72)
local stTargets=mkRtLine(88)
local stIndex=mkRtLine(104)
local stSparking=mkRtLine(120)
local stPerf=mkRtLine(136)

local logCard=Instance.new("Frame",PStatus)
logCard.Size=UDim2.new(1,-10,0,118); logCard.BackgroundColor3=C.card; logCard.BorderSizePixel=0; logCard.LayoutOrder=200
Instance.new("UICorner",logCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",logCard).Color=C.border
local logTitle=Instance.new("TextLabel",logCard)
logTitle.Text="Recent Actions"; logTitle.Size=UDim2.new(1,-16,0,16); logTitle.Position=UDim2.new(0,10,0,6)
logTitle.BackgroundTransparency=1; logTitle.TextColor3=C.sub; logTitle.Font=Enum.Font.GothamBold; logTitle.TextSize=9; logTitle.TextXAlignment=Enum.TextXAlignment.Left
local logLbl=Instance.new("TextLabel",logCard)
logLbl.Size=UDim2.new(1,-16,1,-26); logLbl.Position=UDim2.new(0,10,0,22)
logLbl.BackgroundTransparency=1; logLbl.TextColor3=C.text; logLbl.Font=Enum.Font.Code; logLbl.TextSize=9
logLbl.TextXAlignment=Enum.TextXAlignment.Left; logLbl.TextYAlignment=Enum.TextYAlignment.Top
logLbl.TextWrapped=true; logLbl.Text="(waiting for actions...)"

local startedAt=os.clock()
local lastNow=""
local recent={}
local function pushRecent(s)
    if not s or s=="" then return end
    if s==lastNow then return end
    lastNow=s
    if s:find("❌",1,true) or s:find("⚠",1,true) then
        statusLastError=s
    end
    recent[#recent+1]=os.date("%H:%M:%S").."  "..s
    if #recent>7 then table.remove(recent,1) end
    logLbl.Text=table.concat(recent,"\n")
end

task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        local current=tostring(SLbl and SLbl.Text or "Idle")
        local activeMode="Idle"
        for _,m in ipairs(modePriority) do
            if isModeBlocking(m) then
                activeMode=PRIORITY_LABELS[m] or m
                break
            end
        end
        local mergeCount=0; for _ in pairs(mergeTargets) do mergeCount=mergeCount+1 end
        local farmCount=0; for _ in pairs(farmTargets) do farmCount=farmCount+1 end
        local doorCount=0; for _ in pairs(selectedDoors) do doorCount=doorCount+1 end
        local miss=countMissingIndexTargets()
        local sparkState=(not states.autoFarmSparking and "OFF") or (hasSafariSparkingTarget() and "FOUND") or "WAITING"

        stNow.Text="Now: "..current
        stNow.TextColor3=(current:find("❌",1,true) and C.red) or (current:find("⚠",1,true) and C.orange) or (current:find("⏸",1,true) and C.gold) or C.text
        stMode.Text="Active Priority Mode: "..activeMode
        stMode.TextColor3=(activeMode=="Idle") and C.sub or C.accent
        local inBattle=(isInBattle and isInBattle()) and true or false
        stBattle.Text="Battle: "..(inBattle and "Yes" or "No")
        stBattle.TextColor3=inBattle and C.green or C.sub
        stPrio.Text="Priority: "..modePriorityText()
        stPrio.TextColor3=C.text
        stTargets.Text=string.format("Targets: Merge %d | Farm %d | Doors %d",mergeCount,farmCount,doorCount)
        stTargets.TextColor3=C.text
        stIndex.Text=string.format("Index: Missing %d%s | Last Error: %s",miss,states.indexTrackVariants and " (variants on)" or "",statusLastError)
        stIndex.TextColor3=(statusLastError~="None") and C.red or C.text
        stSparking.Text="Sparking: "..sparkState
        stSparking.TextColor3=(sparkState=="FOUND" and C.green) or (sparkState=="WAITING" and C.gold) or C.sub
        stPerf.Text=string.format("Uptime: %ds",math.floor(os.clock()-startedAt))
        stPerf.TextColor3=C.sub
        pushRecent(current)
        task.wait(0.5)
    end
end)
end

BTab:Toggle("🚫 Disable Boss TP","Don't teleport to boss before firing",states.bossNoTP,function(on)
    states.bossNoTP=on; saveSettings()
end)

BTab:Section("Area Bosses")
BTab:Toggle("👑 Auto Area Bosses","Auto battle AreaBosses when they spawn",states.autoAreaBosses,function(on)
    states.autoAreaBosses=on; saveSettings()
end)

BTab:Section("Boss Cards")

local function MakeBossCard(icon,name,path,key,order,assetName)
    local Card=Instance.new("Frame",PBosses)
    Card.Size=UDim2.new(1,-10,0,54); Card.BackgroundColor3=C.card
    Card.BorderSizePixel=0; Card.LayoutOrder=order
    Instance.new("UICorner",Card).CornerRadius=UDim.new(0,10)
    local cs=Instance.new("UIStroke",Card); cs.Color=C.border; cs.Thickness=1

    local iL=Instance.new("TextLabel",Card)
    iL.Text=icon; iL.Size=UDim2.new(0,36,1,0); iL.Position=UDim2.new(0,6,0,0)
    iL.BackgroundTransparency=1; iL.TextSize=19; iL.Font=Enum.Font.GothamBold
    iL.TextXAlignment=Enum.TextXAlignment.Center

    local nL=Instance.new("TextLabel",Card)
    nL.Text=name; nL.Size=UDim2.new(1,-190,0,18); nL.Position=UDim2.new(0,46,0,8)
    nL.BackgroundTransparency=1; nL.TextColor3=Color3.fromRGB(210,180,255)
    nL.Font=Enum.Font.GothamBold; nL.TextSize=11; nL.TextXAlignment=Enum.TextXAlignment.Left

    local pL=Instance.new("TextLabel",Card)
    pL.Text=path; pL.Size=UDim2.new(1,-190,0,13); pL.Position=UDim2.new(0,46,0,28)
    pL.BackgroundTransparency=1; pL.TextColor3=Color3.fromRGB(50,30,80)
    pL.Font=Enum.Font.Code; pL.TextSize=8; pL.TextXAlignment=Enum.TextXAlignment.Left

    local fBtn=Instance.new("TextButton",Card)
    fBtn.Text="▶"; fBtn.Size=UDim2.new(0,32,0,32); fBtn.Position=UDim2.new(1,-138,0.5,-16)
    fBtn.BackgroundColor3=Color3.fromRGB(55,20,85); fBtn.TextColor3=Color3.fromRGB(190,130,255)
    fBtn.Font=Enum.Font.GothamBold; fBtn.TextSize=13; fBtn.BorderSizePixel=0
    Instance.new("UICorner",fBtn).CornerRadius=UDim.new(0,8)
    fBtn.MouseButton1Click:Connect(function()
        pcall(function()
            local t=workspace:WaitForChild("Campaign",3):WaitForChild(path,3)
            RequestBattle:FireServer(t)
        end)
        fBtn.Text="✓"; fBtn.BackgroundColor3=Color3.fromRGB(20,70,30)
        task.delay(1.5,function() fBtn.Text="▶"; fBtn.BackgroundColor3=Color3.fromRGB(55,20,85) end)
        SLbl.Text="Fired: "..name
    end)

    local tpBtn=Instance.new("TextButton",Card)
    tpBtn.Text="📍"; tpBtn.Size=UDim2.new(0,32,0,32); tpBtn.Position=UDim2.new(1,-174,0.5,-16)
    tpBtn.BackgroundColor3=Color3.fromRGB(0,60,40); tpBtn.TextColor3=Color3.fromRGB(0,220,120)
    tpBtn.Font=Enum.Font.GothamBold; tpBtn.TextSize=14; tpBtn.BorderSizePixel=0
    Instance.new("UICorner",tpBtn).CornerRadius=UDim.new(0,8)
    tpBtn.MouseButton1Click:Connect(function()
        local root=getRoot(); if not root then SLbl.Text="No character"; return end
        pcall(function()
            local bosses=game:GetService("ReplicatedStorage"):WaitForChild("Assets",3):WaitForChild("Bosses",3)
            local model=bosses:WaitForChild(assetName or name,3)
            root.CFrame=CFrame.new(model:GetModelCFrame().Position+Vector3.new(0,5,0))
            SLbl.Text="TP → "..name; tpBtn.Text="✓"
            task.delay(1.5,function() tpBtn.Text="📍" end)
        end)
    end)

    local aLbl=Instance.new("TextLabel",Card)
    aLbl.Text="AUTO"; aLbl.Size=UDim2.new(0,34,0,12); aLbl.Position=UDim2.new(1,-138+36,0,6)
    aLbl.BackgroundTransparency=1; aLbl.TextColor3=Color3.fromRGB(70,40,100)
    aLbl.Font=Enum.Font.GothamBold; aLbl.TextSize=8; aLbl.TextXAlignment=Enum.TextXAlignment.Center

    local Pill=Instance.new("Frame",Card)
    Pill.Size=UDim2.new(0,44,0,24); Pill.Position=UDim2.new(1,-50,0.5,-12)
    Pill.BackgroundColor3=C.border; Pill.BorderSizePixel=0
    Instance.new("UICorner",Pill).CornerRadius=UDim.new(1,0)
    local Thumb=Instance.new("Frame",Pill)
    Thumb.Size=UDim2.new(0,18,0,18); Thumb.Position=UDim2.new(0,3,0.5,-9)
    Thumb.BackgroundColor3=C.sub; Thumb.BorderSizePixel=0
    Instance.new("UICorner",Thumb).CornerRadius=UDim.new(1,0)

    local ti=TweenInfo.new(0.18,Enum.EasingStyle.Quad)
    local function setAuto(on)
        states[key]=on; saveSettings()
        if on then
            TweenService:Create(Pill,ti,{BackgroundColor3=C.purpleD}):Play()
            TweenService:Create(Thumb,ti,{Position=UDim2.new(0,23,0.5,-9),BackgroundColor3=C.purple}):Play()
            cs.Color=C.purpleD; aLbl.TextColor3=C.purple
        else
            TweenService:Create(Pill,ti,{BackgroundColor3=C.border}):Play()
            TweenService:Create(Thumb,ti,{Position=UDim2.new(0,3,0.5,-9),BackgroundColor3=C.sub}):Play()
            cs.Color=C.border; aLbl.TextColor3=Color3.fromRGB(70,40,100)
        end
    end
    local pBtn=Instance.new("TextButton",Pill)
    pBtn.Size=UDim2.new(1,0,1,0); pBtn.BackgroundTransparency=1; pBtn.Text=""; pBtn.ZIndex=3
    pBtn.MouseButton1Click:Connect(function() setAuto(not states[key]) end)
    if states[key] then
        Pill.BackgroundColor3=C.purpleD; Thumb.Position=UDim2.new(0,23,0.5,-9)
        Thumb.BackgroundColor3=C.purple; cs.Color=C.purpleD; aLbl.TextColor3=C.purple
    end
end

local bossConfig={
    {"👹","Boros","Boros","autoBoros",10,"Boros"},
    {"💀","Fusion Zamasu","Fusion Zamasu (Corrupted)","autoZamasu",11,"Fusion Zamasu (Corrupted)"},
    {"🩸","Heian Era Sukuna","Heian Era Sukuna","autoSukuna",12,"Heian Era Sukuna"},
    {"🖤","All For One","All For One","autoAllForOne",13,"All For One"},
    {"🌙","Dio Over Heaven","Dio Over Heaven","autoDioHeaven",14,"Dio Over Heaven"},
    {"🔴","Madara Ten Tails","Madara Ten Tails","autoMadara",15,"Madara Ten Tails"},
}
for _,cfg in ipairs(bossConfig) do MakeBossCard(cfg[1],cfg[2],cfg[3],cfg[4],cfg[5],cfg[6]) end

BTab:Section("Fight Interval")
BTab:Slider("Fight Interval","seconds between auto fight attempts",{min=0.3,max=10,default=autoFightDelay,format=function(v) return string.format("%.1fs",v) end},function(v)
    autoFightDelay=v; saveSettings()
end)

-- ============================================================
--  TRIALS TAB  — custom status card + NexusLib toggles/slider
-- ============================================================
local trialsDelay = 0
local trialsRetryDelay = 0.5
local TSLbl

do
local TStatusCard=Instance.new("Frame",PTrials)
TStatusCard.Size=UDim2.new(1,-10,0,72); TStatusCard.BackgroundColor3=C.card
TStatusCard.BorderSizePixel=0; TStatusCard.LayoutOrder=1
Instance.new("UICorner",TStatusCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",TStatusCard).Color=C.border

local TStatusTitle=Instance.new("TextLabel",TStatusCard)
TStatusTitle.Position=UDim2.new(0,10,0,6); TStatusTitle.Size=UDim2.new(0.5,0,0,18)
TStatusTitle.BackgroundTransparency=1; TStatusTitle.Text="⚗️ Trials Mode"
TStatusTitle.TextColor3=C.text; TStatusTitle.Font=Enum.Font.GothamBold; TStatusTitle.TextSize=12
TStatusTitle.TextXAlignment=Enum.TextXAlignment.Left

TSLbl=Instance.new("TextLabel",TStatusCard)
TSLbl.Position=UDim2.new(0,10,0,26); TSLbl.Size=UDim2.new(1,-20,0,16)
TSLbl.BackgroundTransparency=1; TSLbl.Text="Idle"
TSLbl.TextColor3=C.sub; TSLbl.Font=Enum.Font.Gotham; TSLbl.TextSize=10
TSLbl.TextXAlignment=Enum.TextXAlignment.Left

local TPillBtn=Instance.new("TextButton",TStatusCard)
TPillBtn.Size=UDim2.new(0,60,0,22); TPillBtn.Position=UDim2.new(1,-70,0.5,-11)
TPillBtn.Text="START"; TPillBtn.Font=Enum.Font.GothamBold; TPillBtn.TextSize=10
TPillBtn.BackgroundColor3=Color3.fromRGB(60,180,80); TPillBtn.TextColor3=Color3.fromRGB(255,255,255)
TPillBtn.BorderSizePixel=0
Instance.new("UICorner",TPillBtn).CornerRadius=UDim.new(0,8)

local function setTrials(on)
    states.trialsActive=on; saveSettings()
    if on then
        TPillBtn.Text="STOP"; TPillBtn.BackgroundColor3=Color3.fromRGB(180,60,60)
        TSLbl.Text="Running..."
    else
        TPillBtn.Text="START"; TPillBtn.BackgroundColor3=Color3.fromRGB(60,180,80)
        TSLbl.Text="Idle"
    end
end
if states.trialsActive then setTrials(true) end
TPillBtn.MouseButton1Click:Connect(function() setTrials(not states.trialsActive) end)
end

TTab:Section("Options")
TTab:Toggle("🚫 No TP","Don't teleport to trial model",states.trialsNoTP,function(on)
    states.trialsNoTP=on; saveSettings()
end)
TTab:Toggle("♾️ No Leave","Run waves indefinitely",states.trialsNoLeave,function(on)
    states.trialsNoLeave=on; saveSettings()
end)
TTab:Section("Leave at Wave")
TTab:Slider("Leave at Wave","exits and restarts trial at this wave",{min=1,max=100,default=leaveWave,format=function(v) return "Wave "..math.floor(v) end},function(v)
    leaveWave=math.floor(v); saveSettings()
end)

-- ============================================================
--  MERGE TAB  — custom UI (complex pet picker)
-- ============================================================
local updateChainPreview
local MSStatus, SearchBox, buildPetList, updateChainPreview

do
local MergeStatusCard=Instance.new("Frame",PMerge)
MergeStatusCard.Size=UDim2.new(1,-10,0,70); MergeStatusCard.BackgroundColor3=C.card
MergeStatusCard.BorderSizePixel=0; MergeStatusCard.LayoutOrder=1
Instance.new("UICorner",MergeStatusCard).CornerRadius=UDim.new(0,10)
local msc=Instance.new("UIStroke",MergeStatusCard); msc.Color=C.border; msc.Thickness=1

local MSTitle=Instance.new("TextLabel",MergeStatusCard)
MSTitle.Text="Auto Merge"; MSTitle.Size=UDim2.new(1,-100,0,18); MSTitle.Position=UDim2.new(0,14,0,8)
MSTitle.BackgroundTransparency=1; MSTitle.TextColor3=C.text
MSTitle.Font=Enum.Font.GothamBold; MSTitle.TextSize=13; MSTitle.TextXAlignment=Enum.TextXAlignment.Left

MSStatus=Instance.new("TextLabel",MergeStatusCard)
MSStatus.Text="OFF · No targets selected"; MSStatus.Size=UDim2.new(1,-100,0,13); MSStatus.Position=UDim2.new(0,14,0,28)
MSStatus.BackgroundTransparency=1; MSStatus.TextColor3=C.sub
MSStatus.Font=Enum.Font.Code; MSStatus.TextSize=9; MSStatus.TextXAlignment=Enum.TextXAlignment.Left

local MSChain=Instance.new("TextLabel",MergeStatusCard)
MSChain.Text="Chain: —"; MSChain.Size=UDim2.new(1,-100,0,12); MSChain.Position=UDim2.new(0,14,0,44)
MSChain.BackgroundTransparency=1; MSChain.TextColor3=Color3.fromRGB(80,130,80)
MSChain.Font=Enum.Font.Code; MSChain.TextSize=9; MSChain.TextXAlignment=Enum.TextXAlignment.Left

local MPill=Instance.new("Frame",MergeStatusCard)
MPill.Size=UDim2.new(0,44,0,24); MPill.Position=UDim2.new(1,-50,0.5,-12)
MPill.BackgroundColor3=C.border; MPill.BorderSizePixel=0
Instance.new("UICorner",MPill).CornerRadius=UDim.new(1,0)
local MThumb=Instance.new("Frame",MPill)
MThumb.Size=UDim2.new(0,18,0,18); MThumb.Position=UDim2.new(0,3,0.5,-9)
MThumb.BackgroundColor3=C.sub; MThumb.BorderSizePixel=0
Instance.new("UICorner",MThumb).CornerRadius=UDim.new(1,0)

local mti=TweenInfo.new(0.18,Enum.EasingStyle.Quad)
local function setMerge(on)
    states.mergeActive=on; saveSettings()
    if on then
        TweenService:Create(MPill,mti,{BackgroundColor3=Color3.fromRGB(0,120,50)}):Play()
        TweenService:Create(MThumb,mti,{Position=UDim2.new(0,23,0.5,-9),BackgroundColor3=C.green}):Play()
        msc.Color=Color3.fromRGB(0,120,50); MSTitle.TextColor3=C.green
    else
        TweenService:Create(MPill,mti,{BackgroundColor3=C.border}):Play()
        TweenService:Create(MThumb,mti,{Position=UDim2.new(0,3,0.5,-9),BackgroundColor3=C.sub}):Play()
        msc.Color=C.border; MSTitle.TextColor3=C.text
        MSStatus.Text="OFF · "..(mergeTargetBase~="" and mergeTargetBase or "No target set")
    end
end
if states.mergeActive then
    MPill.BackgroundColor3=Color3.fromRGB(0,120,50); MThumb.Position=UDim2.new(0,23,0.5,-9)
    MThumb.BackgroundColor3=C.green; msc.Color=Color3.fromRGB(0,120,50); MSTitle.TextColor3=C.green
end
local MPillBtn=Instance.new("TextButton",MPill)
MPillBtn.Size=UDim2.new(1,0,1,0); MPillBtn.BackgroundTransparency=1; MPillBtn.Text=""; MPillBtn.ZIndex=3
MPillBtn.MouseButton1Click:Connect(function() setMerge(not states.mergeActive) end)

-- Threshold slider card
local ThreshCard=Instance.new("Frame",PMerge)
ThreshCard.Size=UDim2.new(1,-10,0,58); ThreshCard.BackgroundColor3=C.card
ThreshCard.BorderSizePixel=0; ThreshCard.LayoutOrder=2
Instance.new("UICorner",ThreshCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",ThreshCard).Color=C.border
local thn=Instance.new("TextLabel",ThreshCard)
thn.Text="Merge Threshold"; thn.Size=UDim2.new(1,-80,0,18); thn.Position=UDim2.new(0,14,0,6)
thn.BackgroundTransparency=1; thn.TextColor3=C.text; thn.Font=Enum.Font.GothamBold; thn.TextSize=12
thn.TextXAlignment=Enum.TextXAlignment.Left
local thv=Instance.new("TextLabel",ThreshCard)
thv.Text="x"..mergeThreshold; thv.Size=UDim2.new(0,60,0,18); thv.Position=UDim2.new(1,-68,0,6)
thv.BackgroundTransparency=1; thv.TextColor3=C.accent; thv.Font=Enum.Font.Code; thv.TextSize=13
thv.TextXAlignment=Enum.TextXAlignment.Right
local ths=Instance.new("TextLabel",ThreshCard)
ths.Text="Starts merging once you have this many"; ths.Size=UDim2.new(1,-80,0,12); ths.Position=UDim2.new(0,14,0,24)
ths.BackgroundTransparency=1; ths.TextColor3=C.sub; ths.Font=Enum.Font.Gotham; ths.TextSize=9
ths.TextXAlignment=Enum.TextXAlignment.Left
local thTrack=Instance.new("Frame",ThreshCard)
thTrack.Size=UDim2.new(1,-28,0,6); thTrack.Position=UDim2.new(0,14,0,42)
thTrack.BackgroundColor3=C.panel; thTrack.BorderSizePixel=0
Instance.new("UICorner",thTrack).CornerRadius=UDim.new(1,0)
local thPct=(mergeThreshold-4)/(40-4)
local thFill=Instance.new("Frame",thTrack); thFill.Size=UDim2.new(thPct,0,1,0)
thFill.BackgroundColor3=C.accent; thFill.BorderSizePixel=0
Instance.new("UICorner",thFill).CornerRadius=UDim.new(1,0)
local thKnob=Instance.new("TextButton",thTrack)
thKnob.Text=""; thKnob.Size=UDim2.new(0,16,0,16); thKnob.AnchorPoint=Vector2.new(0.5,0.5)
thKnob.Position=UDim2.new(thPct,0,0.5,0)
thKnob.BackgroundColor3=Color3.fromRGB(255,255,255); thKnob.BorderSizePixel=0; thKnob.ZIndex=4
Instance.new("UICorner",thKnob).CornerRadius=UDim.new(1,0)
local thDrag=false
local function thApply(ix)
    local rel=math.clamp(ix-thTrack.AbsolutePosition.X,0,thTrack.AbsoluteSize.X)
    local p=rel/thTrack.AbsoluteSize.X
    local v=4+math.round((40-4)*p)
    mergeThreshold=v; thFill.Size=UDim2.new(p,0,1,0); thKnob.Position=UDim2.new(p,0,0.5,0)
    thv.Text="x"..v; saveSettings()
end
thKnob.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then thDrag=true end end)
UserInputService.InputChanged:Connect(function(i) if thDrag and i.UserInputType==Enum.UserInputType.MouseMovement then thApply(i.Position.X) end end)
UserInputService.InputEnded:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then thDrag=false end end)
thTrack.InputBegan:Connect(function(i) if i.UserInputType==Enum.UserInputType.MouseButton1 then thApply(i.Position.X) end end)

-- Merge cap card
local CapCard=Instance.new("Frame",PMerge)
CapCard.Size=UDim2.new(1,-10,0,60); CapCard.BackgroundColor3=C.card
CapCard.BorderSizePixel=0; CapCard.LayoutOrder=3
Instance.new("UICorner",CapCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",CapCard).Color=C.border
local capTitle=Instance.new("TextLabel",CapCard)
capTitle.Text="Merge Up To Tier"; capTitle.Size=UDim2.new(1,-190,0,20); capTitle.Position=UDim2.new(0,14,0,6)
capTitle.BackgroundTransparency=1; capTitle.TextColor3=C.text; capTitle.Font=Enum.Font.GothamBold; capTitle.TextSize=13
capTitle.TextXAlignment=Enum.TextXAlignment.Left
local capSub=Instance.new("TextLabel",CapCard)
capSub.Text="Applies to all selected pets"; capSub.Size=UDim2.new(1,-190,0,14); capSub.Position=UDim2.new(0,14,0,29)
capSub.BackgroundTransparency=1; capSub.TextColor3=C.sub; capSub.Font=Enum.Font.Gotham; capSub.TextSize=10
capSub.TextXAlignment=Enum.TextXAlignment.Left
local capMinus=Instance.new("TextButton",CapCard)
capMinus.Text="−"; capMinus.Size=UDim2.new(0,30,0,30); capMinus.Position=UDim2.new(1,-176,0.5,-15)
capMinus.BackgroundColor3=Color3.fromRGB(35,60,95); capMinus.TextColor3=Color3.fromRGB(240,248,255)
capMinus.Font=Enum.Font.GothamBold; capMinus.TextSize=20; capMinus.BorderSizePixel=0
Instance.new("UICorner",capMinus).CornerRadius=UDim.new(0,8)
local capMinusStroke=Instance.new("UIStroke",capMinus)
capMinusStroke.Color=Color3.fromRGB(95,145,220); capMinusStroke.Thickness=1
local capValue=Instance.new("TextLabel",CapCard)
capValue.Size=UDim2.new(0,108,0,30); capValue.Position=UDim2.new(1,-142,0.5,-15)
capValue.BackgroundColor3=Color3.fromRGB(18,32,54); capValue.TextColor3=Color3.fromRGB(175,230,255)
capValue.Font=Enum.Font.GothamBold; capValue.TextSize=12
capValue.BorderSizePixel=0
capValue.TextTruncate=Enum.TextTruncate.AtEnd
Instance.new("UICorner",capValue).CornerRadius=UDim.new(0,8)
local capValueStroke=Instance.new("UIStroke",capValue)
capValueStroke.Color=Color3.fromRGB(85,140,220); capValueStroke.Thickness=1
local capPlus=Instance.new("TextButton",CapCard)
capPlus.Text="+"; capPlus.Size=UDim2.new(0,30,0,30); capPlus.Position=UDim2.new(1,-34,0.5,-15)
capPlus.BackgroundColor3=Color3.fromRGB(35,60,95); capPlus.TextColor3=Color3.fromRGB(240,248,255)
capPlus.Font=Enum.Font.GothamBold; capPlus.TextSize=18; capPlus.BorderSizePixel=0
Instance.new("UICorner",capPlus).CornerRadius=UDim.new(0,8)
local capPlusStroke=Instance.new("UIStroke",capPlus)
capPlusStroke.Color=Color3.fromRGB(95,145,220); capPlusStroke.Thickness=1

local function capDisplayText()
    return getTierLabel(mergeMaxTier)
end
local function setMergeMaxTierValue(v)
    mergeMaxTier=math.clamp(math.floor(v),0,7)
    capValue.Text=capDisplayText()
    saveSettings()
    if updateChainPreview then
        local firstSel=""; for n,_ in pairs(mergeTargets) do firstSel=n; break end
        updateChainPreview(firstSel)
    end
end
setMergeMaxTierValue(mergeMaxTier)
capMinus.MouseButton1Click:Connect(function() setMergeMaxTierValue(mergeMaxTier-1) end)
capPlus.MouseButton1Click:Connect(function() setMergeMaxTierValue(mergeMaxTier+1) end)

-- Pet search + list
local SearchCard=Instance.new("Frame",PMerge)
SearchCard.Size=UDim2.new(1,-10,0,38); SearchCard.BackgroundColor3=C.card
SearchCard.BorderSizePixel=0; SearchCard.LayoutOrder=4
Instance.new("UICorner",SearchCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",SearchCard).Color=C.border
local SearchIcon=Instance.new("TextLabel",SearchCard)
SearchIcon.Text="🔍"; SearchIcon.Size=UDim2.new(0,30,1,0); SearchIcon.Position=UDim2.new(0,4,0,0)
SearchIcon.BackgroundTransparency=1; SearchIcon.TextSize=14; SearchIcon.Font=Enum.Font.GothamBold
SearchIcon.TextXAlignment=Enum.TextXAlignment.Center
SearchBox=Instance.new("TextBox",SearchCard)
SearchBox.Size=UDim2.new(1,-70,1,-10); SearchBox.Position=UDim2.new(0,34,0,5)
SearchBox.BackgroundTransparency=1; SearchBox.TextColor3=C.text
SearchBox.PlaceholderText="Search pets..."; SearchBox.PlaceholderColor3=C.sub
SearchBox.Font=Enum.Font.Gotham; SearchBox.TextSize=11; SearchBox.BorderSizePixel=0
SearchBox.TextXAlignment=Enum.TextXAlignment.Left; SearchBox.ClearTextOnFocus=false
local RefreshBtn2=Instance.new("TextButton",SearchCard)
RefreshBtn2.Text="↻"; RefreshBtn2.Size=UDim2.new(0,28,0,22); RefreshBtn2.Position=UDim2.new(1,-32,0.5,-11)
RefreshBtn2.BackgroundColor3=Color3.fromRGB(0,70,35); RefreshBtn2.TextColor3=C.green
RefreshBtn2.Font=Enum.Font.GothamBold; RefreshBtn2.TextSize=13; RefreshBtn2.BorderSizePixel=0
Instance.new("UICorner",RefreshBtn2).CornerRadius=UDim.new(0,6)

local PetListCard=Instance.new("Frame",PMerge)
PetListCard.Size=UDim2.new(1,-10,0,200); PetListCard.BackgroundColor3=C.card
PetListCard.BorderSizePixel=0; PetListCard.LayoutOrder=5; PetListCard.ClipsDescendants=true
Instance.new("UICorner",PetListCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",PetListCard).Color=C.border

local PetHeader=Instance.new("Frame",PetListCard)
PetHeader.Size=UDim2.new(1,0,0,24); PetHeader.BackgroundColor3=Color3.fromRGB(10,13,22); PetHeader.BorderSizePixel=0
Instance.new("UICorner",PetHeader).CornerRadius=UDim.new(0,10)
local PHFix=Instance.new("Frame",PetHeader); PHFix.Size=UDim2.new(1,0,0,10); PHFix.Position=UDim2.new(0,0,1,-10); PHFix.BackgroundColor3=Color3.fromRGB(10,13,22); PHFix.BorderSizePixel=0
local PHLbl=Instance.new("TextLabel",PetHeader)
PHLbl.Text="SELECT PETS  ·  tap to toggle  ·  multi-select"; PHLbl.Size=UDim2.new(1,-10,1,0); PHLbl.Position=UDim2.new(0,10,0,0)
PHLbl.BackgroundTransparency=1; PHLbl.TextColor3=C.sub; PHLbl.Font=Enum.Font.GothamBold; PHLbl.TextSize=9; PHLbl.TextXAlignment=Enum.TextXAlignment.Left

local PetScroll=Instance.new("ScrollingFrame",PetListCard)
PetScroll.Size=UDim2.new(1,-6,1,-28); PetScroll.Position=UDim2.new(0,3,0,26)
PetScroll.BackgroundTransparency=1; PetScroll.BorderSizePixel=0
PetScroll.ScrollBarThickness=3; PetScroll.ScrollBarImageColor3=C.green
PetScroll.AutomaticCanvasSize=Enum.AutomaticSize.Y; PetScroll.CanvasSize=UDim2.new(0,0,0,0)
local PetLayout=Instance.new("UIListLayout",PetScroll)
PetLayout.Padding=UDim.new(0,3); PetLayout.SortOrder=Enum.SortOrder.LayoutOrder

-- Chain preview card
local ChainCard=Instance.new("Frame",PMerge)
ChainCard.Size=UDim2.new(1,-10,0,290); ChainCard.BackgroundColor3=C.card
ChainCard.BorderSizePixel=0; ChainCard.LayoutOrder=6
Instance.new("UICorner",ChainCard).CornerRadius=UDim.new(0,10)
Instance.new("UIStroke",ChainCard).Color=C.border
local ChainTitle=Instance.new("TextLabel",ChainCard)
ChainTitle.Text="MERGE CHAIN  (last selected)"; ChainTitle.Size=UDim2.new(1,-10,0,14); ChainTitle.Position=UDim2.new(0,10,0,5)
ChainTitle.BackgroundTransparency=1; ChainTitle.TextColor3=C.sub
ChainTitle.Font=Enum.Font.GothamBold; ChainTitle.TextSize=8; ChainTitle.TextXAlignment=Enum.TextXAlignment.Left

local tierColors={C.text,C.green,C.accent,C.gold,C.purple,C.green,C.accent,C.gold}
local tierBg={
    Color3.fromRGB(18,22,32), Color3.fromRGB(8,28,16),  Color3.fromRGB(6,22,38),  Color3.fromRGB(30,24,8),
    Color3.fromRGB(24,12,32), Color3.fromRGB(10,30,18), Color3.fromRGB(8,24,42),  Color3.fromRGB(34,28,10)
}
local tierLabels={"Base","Giant","Mega","Titan","Sparking","S. Giant","S. Mega","S. Titan"}
local tierRows={}
for i=0,7 do
    local row=Instance.new("Frame",ChainCard)
    row.Size=UDim2.new(1,-20,0,26); row.Position=UDim2.new(0,10,0,22+i*30)
    row.BackgroundColor3=tierBg[i+1]; row.BorderSizePixel=0
    Instance.new("UICorner",row).CornerRadius=UDim.new(0,7)
    local badge=Instance.new("TextLabel",row)
    badge.Text=tierLabels[i+1]; badge.Size=UDim2.new(0,40,1,0); badge.Position=UDim2.new(0,6,0,0)
    badge.BackgroundTransparency=1; badge.TextColor3=tierColors[i+1]
    badge.Font=Enum.Font.GothamBold; badge.TextSize=9; badge.TextXAlignment=Enum.TextXAlignment.Left
    local sep=Instance.new("Frame",row); sep.Size=UDim2.new(0,1,0,14); sep.Position=UDim2.new(0,48,0.5,-7)
    sep.BackgroundColor3=tierColors[i+1]; sep.BackgroundTransparency=0.7; sep.BorderSizePixel=0
    local nameLbl=Instance.new("TextLabel",row)
    nameLbl.Text="—"; nameLbl.Size=UDim2.new(1,-110,1,0); nameLbl.Position=UDim2.new(0,54,0,0)
    nameLbl.BackgroundTransparency=1; nameLbl.TextColor3=Color3.fromRGB(200,215,235)
    nameLbl.Font=Enum.Font.Gotham; nameLbl.TextSize=10; nameLbl.TextXAlignment=Enum.TextXAlignment.Left
    nameLbl.TextTruncate=Enum.TextTruncate.AtEnd
    local countPill=Instance.new("Frame",row)
    countPill.Size=UDim2.new(0,46,0,18); countPill.Position=UDim2.new(1,-50,0.5,-9)
    countPill.BackgroundColor3=tierColors[i+1]; countPill.BackgroundTransparency=0.75; countPill.BorderSizePixel=0
    Instance.new("UICorner",countPill).CornerRadius=UDim.new(0,5)
    local countLbl=Instance.new("TextLabel",countPill)
    countLbl.Text="x0"; countLbl.Size=UDim2.new(1,0,1,0)
    countLbl.BackgroundTransparency=1; countLbl.TextColor3=tierColors[i+1]
    countLbl.Font=Enum.Font.Code; countLbl.TextSize=11; countLbl.TextXAlignment=Enum.TextXAlignment.Center
    tierRows[i]={name=nameLbl,count=countLbl}
end

updateChainPreview=function(base)
    if base=="" then
        for i=0,7 do tierRows[i].name.Text="—"; tierRows[i].count.Text="x0" end
        MSChain.Text="Chain: —"; return
    end
    local dInv=getDInv()
    for i=0,7 do
        local name=getTierName(base,i)
        local cnt=0
        if dInv then local iv=dInv:FindFirstChild(name) if iv then cnt=iv.Value end end
        tierRows[i].name.Text=name; tierRows[i].count.Text="x"..cnt
    end
    MSChain.Text="Chain: "..base.." → Giant → Mega → Titan → Sparking → Giant Sparking → Mega Sparking → Titan Sparking  (cap: "..getTierLabel(mergeMaxTier)..")"
end

local petBtns={}
local function getPetCount(name)
    local d=getDInv(); if not d then return 0 end
    local iv=d:FindFirstChild(name); return iv and iv.Value or 0
end
local function refreshPetHighlights()
    local count=0; for _,_ in pairs(mergeTargets) do count=count+1 end
    for n,pb in pairs(petBtns) do
        local sel=mergeTargets[n]==true
        pb.BackgroundColor3=sel and Color3.fromRGB(0,55,28) or Color3.fromRGB(10,15,22)
        for _,child in pairs(pb:GetChildren()) do
            if child:IsA("TextLabel") and child.Name=="nameLbl" then child.TextColor3=sel and C.green or C.text end
            if child:IsA("Frame") and child.Name=="checkBox" then
                child.BackgroundColor3=sel and C.green or C.border
                local tick=child:FindFirstChild("tick"); if tick then tick.Visible=sel end
            end
        end
    end
    local names={}; for n,_ in pairs(mergeTargets) do names[#names+1]=n end
    MSStatus.Text=(states.mergeActive and "ON" or "OFF").." · "..(count==0 and "No targets" or count.." selected: "..table.concat(names,", ")).." · Up to "..getTierLabel(mergeMaxTier)
    SLbl.Text=count.." merge target(s) selected · up to "..getTierLabel(mergeMaxTier); saveSettings()
end
local function toggleBasePet(base)
    local b=toMergeBaseName(base)
    if b=="" then return end
    if mergeTargets[b] then mergeTargets[b]=nil else mergeTargets[b]=true end
    updateChainPreview(b); refreshPetHighlights()
end
buildPetList=function(filter)
    for _,c in pairs(PetScroll:GetChildren()) do if c:IsA("TextButton") or c:IsA("Frame") then c:Destroy() end end
    petBtns={}
    local dInv=getDInv(); if not dInv then PHLbl.Text="DoodleInv not found"; return end
    local baseSet={}
    local f=(filter or "")
    local fLower=(f~="" and f:lower() or "")
    for _,iv in pairs(dInv:GetChildren()) do
        if iv:IsA("IntValue") and iv.Value>0 then
            local n=iv.Name; local base=toMergeBaseName(n)
            local passFilter=(fLower=="" or base:lower():find(fLower,1,true))
            if passFilter then
                if not baseSet[base] then baseSet[base]=0 end
                baseSet[base]=baseSet[base]+iv.Value
            end
        end
    end
    local sorted={}
    for n,cnt in pairs(baseSet) do table.insert(sorted,{name=n,count=cnt}) end
    table.sort(sorted,function(a,b) return a.count>b.count end)
    PHLbl.Text="SELECT BASE PET  ·  "..#sorted.." found"
    for i,entry in ipairs(sorted) do
        local base=entry.name
        local t0=getPetCount(base); local t1=getPetCount("Giant "..base)
        local t2=getPetCount("Mega "..base); local t3=getPetCount("Titan "..base)
        local btn=Instance.new("TextButton",PetScroll)
        btn.Size=UDim2.new(1,-4,0,28); btn.LayoutOrder=i
        btn.BackgroundColor3=Color3.fromRGB(10,15,22); btn.TextColor3=C.text
        btn.BorderSizePixel=0; btn.Font=Enum.Font.GothamBold; btn.TextSize=0
        Instance.new("UICorner",btn).CornerRadius=UDim.new(0,6)
        local nLbl=Instance.new("TextLabel",btn); nLbl.Name="nameLbl"
        nLbl.Text=base; nLbl.Size=UDim2.new(0.5,-4,1,0); nLbl.Position=UDim2.new(0,8,0,0)
        nLbl.BackgroundTransparency=1; nLbl.TextColor3=C.text
        nLbl.Font=Enum.Font.GothamBold; nLbl.TextSize=10; nLbl.TextXAlignment=Enum.TextXAlignment.Left
        local cLbl=Instance.new("TextLabel",btn)
        cLbl.Text=string.format("①x%d  ②x%d  ③x%d  ④x%d",t0,t1,t2,t3)
        cLbl.Size=UDim2.new(0.5,-8,1,0); cLbl.Position=UDim2.new(0.5,0,0,0)
        cLbl.BackgroundTransparency=1; cLbl.TextColor3=C.sub
        cLbl.Font=Enum.Font.Code; cLbl.TextSize=8; cLbl.TextXAlignment=Enum.TextXAlignment.Right
        local checkBox=Instance.new("Frame",btn); checkBox.Name="checkBox"
        checkBox.Size=UDim2.new(0,14,0,14); checkBox.Position=UDim2.new(1,-18,0.5,-7)
        checkBox.BackgroundColor3=mergeTargets[base] and C.green or C.border; checkBox.BorderSizePixel=0
        Instance.new("UICorner",checkBox).CornerRadius=UDim.new(0,3)
        local tick=Instance.new("TextLabel",checkBox); tick.Name="tick"; tick.Text="✓"
        tick.Size=UDim2.new(1,0,1,0); tick.BackgroundTransparency=1; tick.TextColor3=Color3.fromRGB(255,255,255)
        tick.Font=Enum.Font.GothamBold; tick.TextSize=9; tick.Visible=mergeTargets[base]==true
        petBtns[base]=btn
        local bname=base; btn.MouseButton1Click:Connect(function() toggleBasePet(bname) end)
    end
    refreshPetHighlights()
    local firstSel=""; for n,_ in pairs(mergeTargets) do firstSel=n; break end
    updateChainPreview(firstSel)
end
SearchBox:GetPropertyChangedSignal("Text"):Connect(function() buildPetList(SearchBox.Text) end)
RefreshBtn2.MouseButton1Click:Connect(function() buildPetList(SearchBox.Text) end)
task.delay(1.2,function() buildPetList("") end)
end -- merge do

-- ============================================================
--  MERGE LOOP LOGIC
-- ============================================================
local RemoteMerge = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteMerge")

local function makeMergePayload(petName)
    return {["1"]=petName,["2"]=petName,["3"]=petName,["4"]=petName}
end

local function tryConfirmSparkingMerge()
    local ok, confirm = pcall(function()
        return LP.PlayerGui.ScreenGui.MergeSparkingConfirmation.Confirm
    end)
    if not ok or not confirm then return false end
    if not confirm.Visible then return false end
    if confirm.AbsoluteSize.X <= 0 or confirm.AbsoluteSize.Y <= 0 then return false end

    local clicked = false

    -- Method 1: firesignal
    if firesignal then
        pcall(function() firesignal(confirm.MouseButton1Click); clicked = true end)
        pcall(function() firesignal(confirm.Activated); clicked = true end)
    end

    -- Method 2: VirtualInputManager pixel click (fallback)
    if not clicked then
        pcall(function()
            local vim  = game:GetService("VirtualInputManager")
            local pos  = confirm.AbsolutePosition
            local size = confirm.AbsoluteSize
            local x    = math.floor(pos.X + size.X * 0.5)
            local y    = math.floor(pos.Y + size.Y * 0.5)
            vim:SendMouseButtonEvent(x, y, 0, true,  game, 0)
            task.wait(0.05)
            vim:SendMouseButtonEvent(x, y, 0, false, game, 0)
            clicked = true
        end)
    end

    return clicked
end

local function getActiveMergeTier()
    local dInv=getDInv(); if not dInv then return nil,nil end
    if mergeMaxTier<=0 then return nil,nil,nil end
    local topTier=math.min(mergeMaxTier-1,6)
    if topTier<0 then return nil,nil,nil end
    for base,_ in pairs(mergeTargets) do
        for tier=topTier,0,-1 do
            local name=getTierName(base,tier)
            local iv=dInv:FindFirstChild(name); local cnt=iv and iv.Value or 0
            if cnt>=mergeThreshold then return name,tier,base end
        end
    end
    return nil,nil,nil
end

task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        local loopOk,loopErr=pcall(function()
            local anyTarget=next(mergeTargets)~=nil
            if states.mergeActive and anyTarget then
                local petName,tier,activeBase=getActiveMergeTier()
                if petName then
                    local dInv=getDInv()
                    local iv=dInv and dInv:FindFirstChild(petName)
                    local cnt=iv and iv.Value or 0
                    MSStatus.Text="🔀 Merging T"..tier.." "..petName.." (x"..cnt..")"
                    SLbl.Text="Merging: "..petName.." x"..cnt
                    local squad=makeMergePayload(petName)
                    local ok,err=pcall(function() RemoteMerge:InvokeServer(squad) end)
                    if not ok then MSStatus.Text="❌ RemoteMerge: "..tostring(err) end
                    if ok and tier==3 and mergeMaxTier>=4 then
                        for _=1,25 do
                            if tryConfirmSparkingMerge() then break end
                            task.wait(0.1)
                        end
                    end
                    task.wait(0.4)
                    buildPetList(SearchBox.Text)
                else
                    local names={}; for n,_ in pairs(mergeTargets) do names[#names+1]=n end
                    MSStatus.Text="⏳ Waiting · "..table.concat(names,", ").." (need x"..mergeThreshold.." up to "..getTierLabel(mergeMaxTier)..")"
                    task.wait(2)
                end
            else task.wait(0.5) end
        end)
        if not loopOk then
            statusLastError="MergeLoop: "..tostring(loopErr):sub(1,80)
            pcall(function() SLbl.Text="⚠ Merge error (recovering): "..tostring(loopErr):sub(1,50) end)
            task.wait(2)
        end
    end
end)

-- Keep watching for the Sparking confirmation popup while merge is active.
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        if states.mergeActive and mergeMaxTier>=4 then
            local clicked=tryConfirmSparkingMerge()
            task.wait(clicked and 0.25 or 0.08)
        else
            task.wait(0.2)
        end
    end
end)

-- ============================================================
--  FARM TAB
-- ============================================================
local playerGui = LP:FindFirstChildOfClass("PlayerGui") or LP:WaitForChild("PlayerGui")

-- Battle UI tracking: avoid scanning PlayerGui every time.
local battleFrame=nil
local function setBattleFrameIfMatch(inst)
    if inst and inst.Name=="BattleFrame" and inst:IsA("GuiObject") then
        battleFrame=inst
    end
end

-- initial scan (once)
for _,d in ipairs(playerGui:GetDescendants()) do
    setBattleFrameIfMatch(d)
    if battleFrame then break end
end

playerGui.DescendantAdded:Connect(function(d)
    if not battleFrame then
        setBattleFrameIfMatch(d)
    end
end)

playerGui.DescendantRemoving:Connect(function(d)
    if d==battleFrame then
        battleFrame=nil
    end
end)

isInBattle=function()
    local bf=battleFrame
    return bf and bf.Parent and bf.Visible or false
end

do
local FarmStatusCard=Instance.new("Frame",PFarm)
FarmStatusCard.Size=UDim2.new(1,-10,0,60); FarmStatusCard.BackgroundColor3=C.card
FarmStatusCard.BorderSizePixel=0; FarmStatusCard.LayoutOrder=1
Instance.new("UICorner",FarmStatusCard).CornerRadius=UDim.new(0,10)
local fsc=Instance.new("UIStroke",FarmStatusCard); fsc.Color=C.border; fsc.Thickness=1

local FSTitle=Instance.new("TextLabel",FarmStatusCard)
FSTitle.Text="Auto Farm"; FSTitle.Size=UDim2.new(1,-100,0,18); FSTitle.Position=UDim2.new(0,14,0,8)
FSTitle.BackgroundTransparency=1; FSTitle.TextColor3=C.text; FSTitle.Font=Enum.Font.GothamBold; FSTitle.TextSize=13; FSTitle.TextXAlignment=Enum.TextXAlignment.Left

local FSStatus=Instance.new("TextLabel",FarmStatusCard)
FSStatus.Text="OFF · No targets"; FSStatus.Size=UDim2.new(1,-100,0,13); FSStatus.Position=UDim2.new(0,14,0,28)
FSStatus.BackgroundTransparency=1; FSStatus.TextColor3=C.sub; FSStatus.Font=Enum.Font.Code; FSStatus.TextSize=9; FSStatus.TextXAlignment=Enum.TextXAlignment.Left

local FSBattle=Instance.new("TextLabel",FarmStatusCard)
FSBattle.Text="● Not in battle"; FSBattle.Size=UDim2.new(1,-100,0,12); FSBattle.Position=UDim2.new(0,14,0,44)
FSBattle.BackgroundTransparency=1; FSBattle.TextColor3=C.sub; FSBattle.Font=Enum.Font.Code; FSBattle.TextSize=9; FSBattle.TextXAlignment=Enum.TextXAlignment.Left

local FPill=Instance.new("Frame",FarmStatusCard)
FPill.Size=UDim2.new(0,44,0,24); FPill.Position=UDim2.new(1,-50,0.5,-12)
FPill.BackgroundColor3=C.border; FPill.BorderSizePixel=0
Instance.new("UICorner",FPill).CornerRadius=UDim.new(1,0)
local FThumb=Instance.new("Frame",FPill)
FThumb.Size=UDim2.new(0,18,0,18); FThumb.Position=UDim2.new(0,3,0.5,-9)
FThumb.BackgroundColor3=C.sub; FThumb.BorderSizePixel=0
Instance.new("UICorner",FThumb).CornerRadius=UDim.new(1,0)
local fti=TweenInfo.new(0.18,Enum.EasingStyle.Quad)
local function setFarm(on)
    states.farmActive=on; saveSettings()
    if on then
        TweenService:Create(FPill,fti,{BackgroundColor3=Color3.fromRGB(160,100,0)}):Play()
        TweenService:Create(FThumb,fti,{Position=UDim2.new(0,23,0.5,-9),BackgroundColor3=C.orange}):Play()
        fsc.Color=Color3.fromRGB(160,100,0); FSTitle.TextColor3=C.orange
    else
        TweenService:Create(FPill,fti,{BackgroundColor3=C.border}):Play()
        TweenService:Create(FThumb,fti,{Position=UDim2.new(0,3,0.5,-9),BackgroundColor3=C.sub}):Play()
        fsc.Color=C.border; FSTitle.TextColor3=C.text; FSStatus.Text="OFF · No targets"
    end
end
if states.farmActive then
    FPill.BackgroundColor3=Color3.fromRGB(160,100,0); FThumb.Position=UDim2.new(0,23,0.5,-9)
    FThumb.BackgroundColor3=C.orange; fsc.Color=Color3.fromRGB(160,100,0); FSTitle.TextColor3=C.orange
end
local FPillBtn=Instance.new("TextButton",FPill)
FPillBtn.Size=UDim2.new(1,0,1,0); FPillBtn.BackgroundTransparency=1; FPillBtn.Text=""; FPillBtn.ZIndex=3
FPillBtn.MouseButton1Click:Connect(function() setFarm(not states.farmActive) end)


-- Team preset cards label
local TeamSectionFrame=Instance.new("Frame",PFarm)
TeamSectionFrame.Size=UDim2.new(1,-10,0,16); TeamSectionFrame.BackgroundTransparency=1; TeamSectionFrame.LayoutOrder=2
local tsLine=Instance.new("Frame",TeamSectionFrame); tsLine.Size=UDim2.new(1,0,0,1); tsLine.Position=UDim2.new(0,0,0.5,0); tsLine.BackgroundColor3=C.border; tsLine.BorderSizePixel=0
local tsBg=Instance.new("Frame",TeamSectionFrame); tsBg.Size=UDim2.new(0,0,1,0); tsBg.AutomaticSize=Enum.AutomaticSize.X; tsBg.Position=UDim2.new(0,8,0,0); tsBg.BackgroundColor3=C.bg; tsBg.BorderSizePixel=0
Instance.new("UIPadding",tsBg).PaddingLeft=UDim.new(0,6)
local tsLbl=Instance.new("TextLabel",tsBg); tsLbl.Text="TEAM MANAGER"; tsLbl.Size=UDim2.new(0,0,1,0); tsLbl.AutomaticSize=Enum.AutomaticSize.X
tsLbl.BackgroundTransparency=1; tsLbl.TextColor3=C.sub; tsLbl.Font=Enum.Font.GothamBold; tsLbl.TextSize=9

local GridOuter=Instance.new("Frame",PFarm)
local presetRows=math.ceil(#presetDefs/2)
local gridHeight=(presetRows*144)-6
GridOuter.Size=UDim2.new(1,-10,0,gridHeight); GridOuter.BackgroundTransparency=1; GridOuter.BorderSizePixel=0; GridOuter.LayoutOrder=3

local function buildPresetCard(gi,pd)
    local col=(gi-1)%2; local row=math.floor((gi-1)/2)
    local card=Instance.new("Frame",GridOuter)
    card.Size=UDim2.new(0.5,-6,0,138); card.Position=UDim2.new(col*0.5,col==0 and 0 or 6,0,row*144)
    card.BackgroundColor3=C.card; card.BorderSizePixel=0
    Instance.new("UICorner",card).CornerRadius=UDim.new(0,10)
    local stroke=Instance.new("UIStroke",card); stroke.Color=pd.colorD; stroke.Thickness=1
    local hdr=Instance.new("Frame",card); hdr.Size=UDim2.new(1,0,0,26); hdr.BackgroundColor3=pd.colorD; hdr.BorderSizePixel=0
    Instance.new("UICorner",hdr).CornerRadius=UDim.new(0,10)
    local hfix=Instance.new("Frame",hdr); hfix.Size=UDim2.new(1,0,0,10); hfix.Position=UDim2.new(0,0,1,-10); hfix.BackgroundColor3=pd.colorD; hfix.BorderSizePixel=0
    local hIcon=Instance.new("TextLabel",hdr); hIcon.Text=pd.icon; hIcon.Size=UDim2.new(0,22,1,0); hIcon.Position=UDim2.new(0,6,0,0); hIcon.BackgroundTransparency=1; hIcon.TextSize=13; hIcon.Font=Enum.Font.GothamBold
    local hLbl=Instance.new("TextLabel",hdr); hLbl.Text=pd.key.." Team"; hLbl.Size=UDim2.new(1,-70,1,0); hLbl.Position=UDim2.new(0,28,0,0); hLbl.BackgroundTransparency=1; hLbl.TextColor3=pd.color; hLbl.Font=Enum.Font.GothamBold; hLbl.TextSize=11; hLbl.TextXAlignment=Enum.TextXAlignment.Left
    local slotLbls={}; presetSlotLabels[pd.key]=slotLbls
    local team=presetTeams[pd.key]
    for si=1,4 do
        local sl=Instance.new("TextLabel",card); sl.Size=UDim2.new(1,-10,0,16); sl.Position=UDim2.new(0,8,0,28+(si-1)*16); sl.BackgroundTransparency=1
        local pet=team[tostring(si)] or ""
        sl.Text=pet~="" and ("S"..si.."  "..pet) or ("S"..si.."  —"); sl.TextColor3=pet~="" and C.text or C.sub
        sl.Font=Enum.Font.Code; sl.TextSize=10; sl.TextXAlignment=Enum.TextXAlignment.Left; sl.TextTruncate=Enum.TextTruncate.AtEnd
        slotLbls[si]=sl
    end
    local captureBtn=Instance.new("TextButton",card); captureBtn.Text="📸 Capture"; captureBtn.Size=UDim2.new(0.5,-4,0,20); captureBtn.Position=UDim2.new(0,4,1,-24); captureBtn.BackgroundColor3=pd.colorD; captureBtn.TextColor3=pd.color; captureBtn.Font=Enum.Font.GothamBold; captureBtn.TextSize=8; captureBtn.BorderSizePixel=0; Instance.new("UICorner",captureBtn).CornerRadius=UDim.new(0,6)
    local useBtn=Instance.new("TextButton",card); useBtn.Text="▶ Use"; useBtn.Size=UDim2.new(0.5,-4,0,20); useBtn.Position=UDim2.new(0.5,0,1,-24); useBtn.BackgroundColor3=Color3.fromRGB(0,70,30); useBtn.TextColor3=C.green; useBtn.Font=Enum.Font.GothamBold; useBtn.TextSize=8; useBtn.BorderSizePixel=0; Instance.new("UICorner",useBtn).CornerRadius=UDim.new(0,6)
    local pkey=pd.key
    captureBtn.MouseButton1Click:Connect(function()
        local slots=readEquippedPets(); presetTeams[pkey]=slots; savedTeams[pkey]=slots; saveSettings()
        refreshPresetSlotDisplay(pkey); stroke.Color=pd.color
        captureBtn.Text="✓ Saved!"; task.delay(1.5,function() captureBtn.Text="📸 Capture"; stroke.Color=pd.colorD end)
        SLbl.Text=pkey.." team captured & saved"
    end)
    useBtn.MouseButton1Click:Connect(function()
        local slots=presetTeams[pkey]; local hasAny=false
        for _,v in pairs(slots) do if v~="" then hasAny=true; break end end
        if not hasAny then SLbl.Text=pkey.." team is empty — capture first"; return end
        applySlots(slots); SLbl.Text=pkey.." team applied"
        useBtn.Text="✓ Applied"; task.delay(1.5,function() useBtn.Text="▶ Use" end)
    end)
end
for gi,pd in ipairs(presetDefs) do buildPresetCard(gi,pd) end
task.delay(0.5,function() for _,pd in ipairs(presetDefs) do refreshPresetSlotDisplay(pd.key) end end)

-- Farm Options
FarmTab:Toggle("🚫 Disable Teleport","Farm in-place · no auto TP",states.farmNoTP,function(on)
    states.farmNoTP=on; saveSettings()
end)
FarmTab:Toggle("✨ Auto Farm Sparking","Farm Safari pets with 'Sparking' in their name",states.autoFarmSparking,function(on)
    states.autoFarmSparking=on; saveSettings()
end)
do
local idxRow=Instance.new("Frame",PFarm)
idxRow.Size=UDim2.new(1,-10,0,54); idxRow.BackgroundTransparency=1; idxRow.LayoutOrder=4

local idxCard=Instance.new("TextButton",idxRow)
idxCard.Size=UDim2.new(0.5,-4,1,0); idxCard.Position=UDim2.new(0,0,0,0)
idxCard.BackgroundColor3=C.card; idxCard.BorderSizePixel=0; idxCard.Text=""
Instance.new("UICorner",idxCard).CornerRadius=UDim.new(0,10)
local idxStroke=Instance.new("UIStroke",idxCard); idxStroke.Color=C.border
local idxTitle=Instance.new("TextLabel",idxCard)
idxTitle.Size=UDim2.new(1,-10,0,18); idxTitle.Position=UDim2.new(0,10,0,8)
idxTitle.BackgroundTransparency=1; idxTitle.TextXAlignment=Enum.TextXAlignment.Left
idxTitle.TextColor3=C.text; idxTitle.Font=Enum.Font.GothamBold; idxTitle.TextSize=10
local idxSub=Instance.new("TextLabel",idxCard)
idxSub.Size=UDim2.new(1,-10,0,12); idxSub.Position=UDim2.new(0,10,0,28)
idxSub.BackgroundTransparency=1; idxSub.TextXAlignment=Enum.TextXAlignment.Left
idxSub.TextColor3=C.sub; idxSub.Font=Enum.Font.Gotham; idxSub.TextSize=8

local varCard=Instance.new("TextButton",idxRow)
varCard.Size=UDim2.new(0.5,-4,1,0); varCard.Position=UDim2.new(0.5,4,0,0)
varCard.BackgroundColor3=C.card; varCard.BorderSizePixel=0; varCard.Text=""
Instance.new("UICorner",varCard).CornerRadius=UDim.new(0,10)
local varStroke=Instance.new("UIStroke",varCard); varStroke.Color=C.border
local varTitle=Instance.new("TextLabel",varCard)
varTitle.Size=UDim2.new(1,-10,0,18); varTitle.Position=UDim2.new(0,10,0,8)
varTitle.BackgroundTransparency=1; varTitle.TextXAlignment=Enum.TextXAlignment.Left
varTitle.TextColor3=C.text; varTitle.Font=Enum.Font.GothamBold; varTitle.TextSize=10
local varSub=Instance.new("TextLabel",varCard)
varSub.Size=UDim2.new(1,-10,0,12); varSub.Position=UDim2.new(0,10,0,28)
varSub.BackgroundTransparency=1; varSub.TextXAlignment=Enum.TextXAlignment.Left
varSub.TextColor3=C.sub; varSub.Font=Enum.Font.Gotham; varSub.TextSize=8

local function refreshIndexCards()
    idxTitle.Text=(states.autoFarmIndex and "📚 Auto Farm Index  ON" or "📚 Auto Farm Index  OFF")
    idxSub.Text="Farm missing DoodleInv index pets"
    idxStroke.Color=states.autoFarmIndex and C.orange or C.border
    idxCard.BackgroundColor3=states.autoFarmIndex and Color3.fromRGB(45,26,0) or C.card

    varTitle.Text=(states.indexTrackVariants and "🧬 Variants  ON" or "🧬 Variants  OFF")
    varSub.Text="Track Base + Giant + Mega + Titan"
    varStroke.Color=states.indexTrackVariants and C.accent or C.border
    varCard.BackgroundColor3=states.indexTrackVariants and Color3.fromRGB(0,22,36) or C.card
end

idxCard.MouseButton1Click:Connect(function()
    states.autoFarmIndex=not states.autoFarmIndex
    saveSettings()
    refreshIndexCards()
end)
varCard.MouseButton1Click:Connect(function()
    states.indexTrackVariants=not states.indexTrackVariants
    _missingIndexAt=0
    saveSettings()
    refreshIndexCards()
end)
refreshIndexCards()
end

-- Door unlock
local DOOR_CONFIG={}
pcall(function()
    local doors=workspace:WaitForChild("Map",5):WaitForChild("Doors",5)
    for _,door in ipairs(doors:GetChildren()) do
        local required=door:FindFirstChild("Required"); if not required then continue end
        local pets={}
        for _,pet in ipairs(required:GetChildren()) do table.insert(pets,{pet=pet.Name,campaign=""}) end
        if #pets>0 then DOOR_CONFIG[door.Name]=pets end
    end
end)

local DoorStatusLbl
local checkOwned
do
local DoorSearchCard=Instance.new("Frame",PFarm); DoorSearchCard.Size=UDim2.new(1,-10,0,32); DoorSearchCard.BackgroundColor3=C.card; DoorSearchCard.BorderSizePixel=0; DoorSearchCard.LayoutOrder=5; Instance.new("UICorner",DoorSearchCard).CornerRadius=UDim.new(0,10); Instance.new("UIStroke",DoorSearchCard).Color=C.border
local DoorSearchBox=Instance.new("TextBox",DoorSearchCard); DoorSearchBox.Size=UDim2.new(1,-10,1,0); DoorSearchBox.Position=UDim2.new(0,8,0,0); DoorSearchBox.BackgroundTransparency=1; DoorSearchBox.TextColor3=C.text; DoorSearchBox.Font=Enum.Font.Code; DoorSearchBox.TextSize=10; DoorSearchBox.PlaceholderText="🔍 Search doors..."; DoorSearchBox.Text=""; DoorSearchBox.TextXAlignment=Enum.TextXAlignment.Left
local DoorListFrame=Instance.new("Frame",PFarm); DoorListFrame.Size=UDim2.new(1,-10,0,180); DoorListFrame.BackgroundColor3=C.card; DoorListFrame.BorderSizePixel=0; DoorListFrame.LayoutOrder=6; DoorListFrame.ClipsDescendants=true; Instance.new("UICorner",DoorListFrame).CornerRadius=UDim.new(0,10); Instance.new("UIStroke",DoorListFrame).Color=C.border
local DoorScroll=Instance.new("ScrollingFrame",DoorListFrame); DoorScroll.Size=UDim2.new(1,0,1,0); DoorScroll.BackgroundTransparency=1; DoorScroll.BorderSizePixel=0; DoorScroll.ScrollBarThickness=3; DoorScroll.ScrollBarImageColor3=C.accent; DoorScroll.CanvasSize=UDim2.new(0,0,0,0)
local DoorLayout=Instance.new("UIListLayout",DoorScroll); DoorLayout.SortOrder=Enum.SortOrder.LayoutOrder; DoorLayout.Padding=UDim.new(0,2); Instance.new("UIPadding",DoorScroll).PaddingTop=UDim.new(0,4)
DoorStatusLbl=Instance.new("TextLabel",PFarm); DoorStatusLbl.Size=UDim2.new(1,-10,0,18); DoorStatusLbl.BackgroundTransparency=1; DoorStatusLbl.TextColor3=C.sub; DoorStatusLbl.Font=Enum.Font.Code; DoorStatusLbl.TextSize=9; DoorStatusLbl.TextXAlignment=Enum.TextXAlignment.Left; DoorStatusLbl.LayoutOrder=7; DoorStatusLbl.Text="  Select doors to unlock"
checkOwned=function(petName)
    local dInv=getDInv()
    if not dInv then return false end
    local iv=dInv:FindFirstChild(petName)
    if iv and iv.Value>0 then return true end
    iv=dInv:FindFirstChild("Giant "..petName)
    if iv and iv.Value>0 then return true end
    iv=dInv:FindFirstChild("Mega "..petName)
    if iv and iv.Value>0 then return true end
    iv=dInv:FindFirstChild("Titan "..petName)
    if iv and iv.Value>0 then return true end
    iv=dInv:FindFirstChild("Sparking "..petName)
    if iv and iv.Value>0 then return true end
    return false
end
local function buildDoorList(filter)
    if next(DOOR_CONFIG)==nil then
        pcall(function()
            local doors=workspace:WaitForChild("Map",3):WaitForChild("Doors",3)
            for _,door in ipairs(doors:GetChildren()) do
                local required=door:FindFirstChild("Required"); if not required then continue end
                local pets={}
                for _,pet in ipairs(required:GetChildren()) do table.insert(pets,{pet=pet.Name,campaign=""}) end
                if #pets>0 then DOOR_CONFIG[door.Name]=pets end
            end
        end)
    end
    local doorNames={}; for k,_ in pairs(DOOR_CONFIG) do table.insert(doorNames,k) end; table.sort(doorNames)
    for _,c in pairs(DoorScroll:GetChildren()) do if c:IsA("TextButton") or c:IsA("Frame") then c:Destroy() end end

    local f=(filter or "")
    local fLower=(f~="" and f:lower() or "")

    -- Build a quick lookup of owned pets (all variants) for this refresh
    local ownedName={}
    local dInv=getDInv()
    if dInv then
        for _,iv in ipairs(dInv:GetChildren()) do
            if iv:IsA("IntValue") and iv.Value>0 then
                ownedName[iv.Name]=true
            end
        end
    end
    local function checkOwnedFast(petName)
        return ownedName[petName]
            or ownedName["Giant "..petName]
            or ownedName["Mega "..petName]
            or ownedName["Titan "..petName]
            or ownedName["Sparking "..petName]
            or false
    end

    for i,dname in ipairs(doorNames) do
        if fLower=="" or dname:lower():find(fLower,1,true) then
            local needs=DOOR_CONFIG[dname] or {}; local owned=0
            for _,n in ipairs(needs) do if checkOwnedFast(n.pet) then owned=owned+1 end end
            local allDone=owned==#needs
            local Row=Instance.new("TextButton",DoorScroll); Row.Size=UDim2.new(1,-6,0,44); Row.BackgroundColor3=C.card; Row.BorderSizePixel=0; Row.Text=""; Row.LayoutOrder=i; Instance.new("UICorner",Row).CornerRadius=UDim.new(0,8)
            local rStroke=Instance.new("UIStroke",Row); rStroke.Color=C.border; rStroke.Thickness=1
            local dLbl=Instance.new("TextLabel",Row); dLbl.Text=(selectedDoors[dname] and "✓ " or "")..dname; dLbl.Size=UDim2.new(1,-80,0,20); dLbl.Position=UDim2.new(0,10,0,4); dLbl.BackgroundTransparency=1; dLbl.TextColor3=allDone and C.green or C.text; dLbl.Font=Enum.Font.GothamBold; dLbl.TextSize=10; dLbl.TextXAlignment=Enum.TextXAlignment.Left
            local pLbl=Instance.new("TextLabel",Row); pLbl.Text=owned.."/"..#needs.." pets"; pLbl.Size=UDim2.new(1,-80,0,14); pLbl.Position=UDim2.new(0,10,0,24); pLbl.BackgroundTransparency=1; pLbl.TextColor3=C.sub; pLbl.Font=Enum.Font.Code; pLbl.TextSize=9; pLbl.TextXAlignment=Enum.TextXAlignment.Left
            local chk=Instance.new("TextLabel",Row); chk.Text=selectedDoors[dname] and "✓" or ""; chk.Size=UDim2.new(0,30,1,0); chk.Position=UDim2.new(1,-36,0,0); chk.BackgroundTransparency=1; chk.TextColor3=C.accent; chk.Font=Enum.Font.GothamBold; chk.TextSize=16
            Row.MouseButton1Click:Connect(function()
                if selectedDoors[dname] then selectedDoors[dname]=nil; chk.Text=""; dLbl.Text=dname; rStroke.Color=C.border; Row.BackgroundColor3=C.card
                else selectedDoors[dname]=true; chk.Text="✓"; dLbl.Text="✓ "..dname; rStroke.Color=C.accent; Row.BackgroundColor3=Color3.fromRGB(0,20,40) end
                local count=0; for _ in pairs(selectedDoors) do count=count+1 end
                DoorStatusLbl.Text="  "..count.." door(s) selected"; saveSettings()
            end)
            if selectedDoors[dname] then rStroke.Color=C.accent; Row.BackgroundColor3=Color3.fromRGB(0,20,40) end
        end
    end
    DoorLayout:ApplyLayout(); DoorScroll.CanvasSize=UDim2.new(0,0,0,DoorLayout.AbsoluteContentSize.Y+8)
end
buildDoorList(""); DoorSearchBox:GetPropertyChangedSignal("Text"):Connect(function() buildDoorList(DoorSearchBox.Text) end)
end -- door do

FarmTab:Toggle("🔓 Auto Door Unlock","Farms required pets for selected doors",states.doorUnlock,function(on)
    states.doorUnlock=on; saveSettings()
end)

-- Campaign pet list
FarmTab:Section("Campaign Targets")
refreshPetCampaignMap()
local FSearchBox, FRefreshBtn, FClearBtn, buildFarmPetList
do
local FSearchCard=Instance.new("Frame",PFarm); FSearchCard.Size=UDim2.new(1,-10,0,38); FSearchCard.BackgroundColor3=C.card; FSearchCard.BorderSizePixel=0; FSearchCard.LayoutOrder=8; Instance.new("UICorner",FSearchCard).CornerRadius=UDim.new(0,10); Instance.new("UIStroke",FSearchCard).Color=C.border
local FSearchIcon=Instance.new("TextLabel",FSearchCard); FSearchIcon.Text="🔍"; FSearchIcon.Size=UDim2.new(0,30,1,0); FSearchIcon.Position=UDim2.new(0,4,0,0); FSearchIcon.BackgroundTransparency=1; FSearchIcon.TextSize=14; FSearchIcon.Font=Enum.Font.GothamBold
FSearchBox=Instance.new("TextBox",FSearchCard); FSearchBox.Size=UDim2.new(1,-124,1,0); FSearchBox.Position=UDim2.new(0,32,0,0); FSearchBox.BackgroundTransparency=1; FSearchBox.TextColor3=C.text; FSearchBox.Font=Enum.Font.Code; FSearchBox.TextSize=11; FSearchBox.PlaceholderText="search pets..."; FSearchBox.Text=""; FSearchBox.TextXAlignment=Enum.TextXAlignment.Left
FClearBtn=Instance.new("TextButton",FSearchCard); FClearBtn.Text="Clear"; FClearBtn.Size=UDim2.new(0,50,0,26); FClearBtn.Position=UDim2.new(1,-88,0.5,-13); FClearBtn.BackgroundColor3=Color3.fromRGB(75,25,25); FClearBtn.TextColor3=Color3.fromRGB(255,210,210); FClearBtn.Font=Enum.Font.GothamBold; FClearBtn.TextSize=10; FClearBtn.BorderSizePixel=0; Instance.new("UICorner",FClearBtn).CornerRadius=UDim.new(0,6)
FRefreshBtn=Instance.new("TextButton",FSearchCard); FRefreshBtn.Text="↻"; FRefreshBtn.Size=UDim2.new(0,30,0,26); FRefreshBtn.Position=UDim2.new(1,-34,0.5,-13); FRefreshBtn.BackgroundColor3=C.border; FRefreshBtn.TextColor3=C.text; FRefreshBtn.Font=Enum.Font.GothamBold; FRefreshBtn.TextSize=16; FRefreshBtn.BorderSizePixel=0; Instance.new("UICorner",FRefreshBtn).CornerRadius=UDim.new(0,6)
local FListFrame=Instance.new("Frame",PFarm); FListFrame.Size=UDim2.new(1,-10,0,180); FListFrame.BackgroundColor3=C.card; FListFrame.BorderSizePixel=0; FListFrame.LayoutOrder=9; FListFrame.ClipsDescendants=true; Instance.new("UICorner",FListFrame).CornerRadius=UDim.new(0,10); Instance.new("UIStroke",FListFrame).Color=C.border
local FScroll=Instance.new("ScrollingFrame",FListFrame); FScroll.Size=UDim2.new(1,0,1,0); FScroll.BackgroundTransparency=1; FScroll.BorderSizePixel=0; FScroll.ScrollBarThickness=3; FScroll.ScrollBarImageColor3=C.accent; FScroll.CanvasSize=UDim2.new(0,0,0,0)
local FLayout=Instance.new("UIListLayout",FScroll); FLayout.SortOrder=Enum.SortOrder.LayoutOrder; FLayout.Padding=UDim.new(0,2); Instance.new("UIPadding",FScroll).PaddingTop=UDim.new(0,4)
local FSCount=Instance.new("TextLabel",PFarm); FSCount.Size=UDim2.new(1,-10,0,16); FSCount.BackgroundTransparency=1; FSCount.LayoutOrder=10; FSCount.TextColor3=C.sub; FSCount.Font=Enum.Font.Code; FSCount.TextSize=9; FSCount.TextXAlignment=Enum.TextXAlignment.Left; FSCount.Text="  0 selected"
buildFarmPetList=function(filter)
    for _,c in pairs(FScroll:GetChildren()) do if c:IsA("TextButton") or c:IsA("Frame") then c:Destroy() end end
    local f=(filter or "")
    local fLower=(f~="" and f:lower() or "")
    local count=0
    for i,pname in ipairs(petNameList) do
        if fLower=="" or pname:lower():find(fLower,1,true) then
            count=count+1; local camp=petToCampaign[pname] or "?"
            local Row=Instance.new("TextButton",FScroll); Row.Size=UDim2.new(1,-6,0,40); Row.BackgroundColor3=farmTargets[pname] and Color3.fromRGB(35,20,0) or C.card; Row.BorderSizePixel=0; Row.Text=""; Row.LayoutOrder=i; Instance.new("UICorner",Row).CornerRadius=UDim.new(0,8)
            local rStroke=Instance.new("UIStroke",Row); rStroke.Color=farmTargets[pname] and C.orange or C.border; rStroke.Thickness=1
            local pLbl=Instance.new("TextLabel",Row); pLbl.Text=pname; pLbl.Size=UDim2.new(1,-50,0,18); pLbl.Position=UDim2.new(0,10,0,4); pLbl.BackgroundTransparency=1; pLbl.TextColor3=farmTargets[pname] and C.orange or C.text; pLbl.Font=Enum.Font.GothamBold; pLbl.TextSize=11; pLbl.TextXAlignment=Enum.TextXAlignment.Left
            local cLbl=Instance.new("TextLabel",Row); cLbl.Text=camp; cLbl.Size=UDim2.new(1,-50,0,13); cLbl.Position=UDim2.new(0,10,0,23); cLbl.BackgroundTransparency=1; cLbl.TextColor3=C.sub; cLbl.Font=Enum.Font.Code; cLbl.TextSize=8; cLbl.TextXAlignment=Enum.TextXAlignment.Left
            local chk=Instance.new("TextLabel",Row); chk.Text=farmTargets[pname] and "✓" or ""; chk.Size=UDim2.new(0,30,1,0); chk.Position=UDim2.new(1,-36,0,0); chk.BackgroundTransparency=1; chk.TextColor3=C.orange; chk.Font=Enum.Font.GothamBold; chk.TextSize=16
            Row.MouseButton1Click:Connect(function()
                if farmTargets[pname] then farmTargets[pname]=nil; chk.Text=""; pLbl.TextColor3=C.text; rStroke.Color=C.border; Row.BackgroundColor3=C.card
                else farmTargets[pname]=true; chk.Text="✓"; pLbl.TextColor3=C.orange; rStroke.Color=C.orange; Row.BackgroundColor3=Color3.fromRGB(35,20,0) end
                saveSettings(); local sel=0; for _ in pairs(farmTargets) do sel=sel+1 end
                FSCount.Text="  "..sel.." selected"
            end)
        end
    end
    FLayout:ApplyLayout(); FScroll.CanvasSize=UDim2.new(0,0,0,FLayout.AbsoluteContentSize.Y+8)
    local sel=0; for _ in pairs(farmTargets) do sel=sel+1 end; FSCount.Text="  "..sel.." selected · "..count.." shown"
end
end -- farm search do

buildFarmPetList(""); FSearchBox:GetPropertyChangedSignal("Text"):Connect(function() buildFarmPetList(FSearchBox.Text) end)
FRefreshBtn.MouseButton1Click:Connect(function() refreshPetCampaignMap(); buildFarmPetList(FSearchBox.Text) end)
if FClearBtn and FClearBtn:IsA("TextButton") then
    FClearBtn.MouseButton1Click:Connect(function()
        for n,_ in pairs(farmTargets) do farmTargets[n]=nil end
        saveSettings()
        buildFarmPetList(FSearchBox.Text)
        FSStatus.Text=(states.farmActive and "ON" or "OFF").." · No targets selected"
    end)
end

-- Farm loop
local farmTargetList={}
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        if not FSBattle or not FSBattle.Parent then break end
        local loopOk,loopErr=pcall(function()
            if states.farmActive then
                if not canRunMode("AutoFarm") then
                    FSStatus.Text="⏸ Paused by priority"
                    task.wait(0.6)
                    return
                end
                local inBattle=isInBattle()
                if inBattle then pcall(function() FSBattle.Text="● In battle"; FSBattle.TextColor3=C.green end); task.wait(2)
                else
                    FSBattle.Text="● Not in battle"; FSBattle.TextColor3=C.sub
                    farmTargetList={}; for n,_ in pairs(farmTargets) do table.insert(farmTargetList,n) end
                    if #farmTargetList==0 then FSStatus.Text="ON · No targets selected"; task.wait(2)
                    else
                        if farmIndex>#farmTargetList then farmIndex=1 end
                        local target=farmTargetList[farmIndex]; farmIndex=farmIndex+1
                        local campFolder=petToCampaign[target]
                        if not campFolder or campFolder=="" then FSStatus.Text="⚠ No campaign found for: "..target; task.wait(2); return end
                        FSStatus.Text="⚔ "..target.." ("..campFolder..")"; SLbl.Text="Farm: "..target
                        applyPresetTeam("Farm"); task.wait(0.2)
                        local battleModel=findCampaignModelForPet(target)
                        if battleModel then
                            if not isPetSpawnedInModel(battleModel,target) then
                                FSStatus.Text="⏭ Despawned: "..target
                                task.wait(0.6)
                                return
                            end
                            FSStatus.Text="⚔ "..target.." ("..battleModel.Name..")"; SLbl.Text="Farm: "..target
                            if not states.farmNoTP then
                                pcall(function()
                                    local root=getRoot(); if not root then return end
                                    local pos=battleModel:GetModelCFrame().Position
                                    if (root.Position-pos).Magnitude>30 then root.CFrame=CFrame.new(pos+Vector3.new(0,5,0)); task.wait(0.5) end
                                end)
                            end
                            if not isPetSpawnedInModel(battleModel,target) then
                                FSStatus.Text="⏭ Despawned mid-move: "..target
                                task.wait(0.6)
                                return
                            end
                            pcall(function() RequestBattle:FireServer(battleModel) end)
                        else FSStatus.Text="⚠ No model found for: "..target; task.wait(2) end
                        task.wait(1)
                    end
                end
            else FSBattle.Text="● Not in battle"; FSBattle.TextColor3=C.sub; task.wait(0.5) end
        end)
        if not loopOk then
            statusLastError="FarmLoop: "..tostring(loopErr):sub(1,80)
            pcall(function() SLbl.Text="⚠ Farm error (recovering): "..tostring(loopErr):sub(1,50) end)
            task.wait(2)
        end
    end
end)

-- Auto Farm Index loop (farms pets you do not own yet)
local farmIndexMissingPos=1
local farmIndexFocusBase=nil
local indexRetryCount={}
local indexSkipUntil={}
local function findSafariSparkingModel()
    local campaign=getCampaign()
    if not campaign then return nil,nil end
    local function checkModel(model)
        if not (model and model:FindFirstChild("Pets")) then return nil,nil end
        for _,pet in ipairs(model.Pets:GetChildren()) do
            local n=tostring(pet.Name or "")
            if n:lower():find("sparking",1,true) then
                return model,n
            end
        end
        return nil,nil
    end
    local safari=campaign:FindFirstChild("Safari")
    local m,p=checkModel(safari)
    if m then return m,p end
    for _,model in ipairs(campaign:GetChildren()) do
        if tostring(model.Name):lower():find("safari",1,true) then
            m,p=checkModel(model)
            if m then return m,p end
        end
    end
    return nil,nil
end
local function markIndexNoBattleFail(failKey, showKey, needObj)
    local c=(indexRetryCount[failKey] or 0)+1
    indexRetryCount[failKey]=c
    if c>=3 then
        indexRetryCount[failKey]=0
        indexSkipUntil[failKey]=os.clock()+12
        if states.indexTrackVariants and farmIndexFocusBase==needObj.base then
            farmIndexFocusBase=nil
        end
        SLbl.Text="⏭ Skipping "..showKey.." for 12s (3 no-battle fails)"
    else
        SLbl.Text="📚 No battle for "..showKey.." ("..c.."/3)"
    end
end
local function tryAutoMergeIndexVariants(ownedName)
    if not states.indexTrackVariants then return false end
    for _,base in ipairs(getIndexBaseList()) do
        if isExcludedIndexTarget(base) then
            continue
        end
        local hasG=ownedName["Giant "..base]
        local hasM=ownedName["Mega "..base]
        local hasT=ownedName["Titan "..base]
        if hasG and hasM and hasT then
            continue
        end
        local baseCount=getInvCountByName(base)
        local giantCount=getInvCountByName("Giant "..base)
        local megaCount=getInvCountByName("Mega "..base)
        local mergeName=nil
        -- Build toward the highest missing variant, keeping 1 copy via x5 threshold.
        if not hasT then
            if megaCount>=5 then
                mergeName="Mega "..base
            elseif giantCount>=5 then
                mergeName="Giant "..base
            elseif baseCount>=5 then
                mergeName=base
            end
        elseif not hasM then
            if giantCount>=5 then
                mergeName="Giant "..base
            elseif baseCount>=5 then
                mergeName=base
            end
        elseif not hasG and baseCount>=5 then
            mergeName=base
        end
        if mergeName then
            if mergeName:sub(1,6)=="Titan " then
                continue
            end
            local squad=makeMergePayload(mergeName)
            local ok=pcall(function() RemoteMerge:InvokeServer(squad) end)
            if ok then
                SLbl.Text="🔀 Index merge x5: "..mergeName
                task.wait(0.35)
                return true
            end
        end
    end
    return false
end
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        local loopOk,loopErr=pcall(function()
            if states.autoFarmIndex then
                if not canRunMode("AutoFarmIndex") then
                    task.wait(0.6)
                    return
                end
                if isInBattle() then
                    task.wait(0.8)
                    return
                end
                local ownedName=buildOwnedNameSet()
                local merged=tryAutoMergeIndexVariants(ownedName)
                if merged then
                    _missingIndexAt=0
                    ownedName=buildOwnedNameSet()
                end
                local missing=getMissingIndexEntries(ownedName)
                _missingIndexAt=os.clock()
                _missingIndexCount=#missing
                if #missing==0 then
                    farmIndexFocusBase=nil
                    SLbl.Text="📚 Index complete: all discovered pets owned"
                    task.wait(2)
                else
                    local now=os.clock()
                    local function isSkipped(needObj)
                        local keyVariant=(needObj.need or needObj.base or "")
                        local keyBase=(needObj.base or "")
                        local untilVariant=indexSkipUntil[keyVariant]
                        if untilVariant and untilVariant<=now then
                            indexSkipUntil[keyVariant]=nil
                            untilVariant=nil
                        end
                        local untilBase=indexSkipUntil[keyBase]
                        if untilBase and untilBase<=now then
                            indexSkipUntil[keyBase]=nil
                            untilBase=nil
                        end
                        return untilVariant~=nil or untilBase~=nil
                    end
                    local need=nil
                    if states.indexTrackVariants then
                        if farmIndexFocusBase then
                            for _,m in ipairs(missing) do
                                if m.base==farmIndexFocusBase and not isSkipped(m) then need=m break end
                            end
                        end
                        if not need then
                            for _,m in ipairs(missing) do
                                if not isSkipped(m) then need=m break end
                            end
                        end
                        if not need then
                            task.wait(0.4)
                            return
                        end
                        if not farmIndexFocusBase or farmIndexFocusBase~=need.base then
                            farmIndexFocusBase=need and need.base or nil
                        end
                    else
                        if farmIndexMissingPos>#missing then farmIndexMissingPos=1 end
                        local tries=0
                        while tries<#missing do
                            local cand=missing[farmIndexMissingPos]
                            farmIndexMissingPos=farmIndexMissingPos+1
                            if farmIndexMissingPos>#missing then farmIndexMissingPos=1 end
                            if cand and not isSkipped(cand) then
                                need=cand
                                break
                            end
                            tries=tries+1
                        end
                        if not need then
                            task.wait(0.4)
                            return
                        end
                    end
                    local target=need.base
                    local needPos=1
                    for i,m in ipairs(missing) do
                        if m==need then needPos=i break end
                    end
                    local needKey=(need.need or target)
                    local failKey=target -- battle request is always on base target
                    local attempts=(indexRetryCount[failKey] or 0)
                    local campFolder=petToCampaign[target]
                    if campFolder and campFolder~="" then
                        SLbl.Text="📚 Index Farm "..needPos.."/"..#missing..": "..needKey.."  (try "..(attempts+1).."/3)"
                        applyPresetTeam(getIndexTeamKeyForTarget(target)); task.wait(0.2)
                        local battleModel=findCampaignModelForPet(target)
                        if battleModel then
                            if not isPetSpawnedInModel(battleModel,target) then
                                indexSkipUntil[failKey]=os.clock()+4
                                if states.indexTrackVariants and farmIndexFocusBase==target then
                                    farmIndexFocusBase=nil
                                end
                                SLbl.Text="⏭ Despawned: "..needKey.." (skip 4s)"
                                task.wait(0.4)
                                return
                            end
                            if isInBattle() then
                                task.wait(0.8)
                                return
                            end
                            if not states.farmNoTP then
                                pcall(function()
                                    local root=getRoot(); if not root then return end
                                    local pos=battleModel:GetModelCFrame().Position
                                    if (root.Position-pos).Magnitude>30 then root.CFrame=CFrame.new(pos+Vector3.new(0,5,0)); task.wait(0.5) end
                                end)
                            end
                            if not isPetSpawnedInModel(battleModel,target) then
                                indexSkipUntil[failKey]=os.clock()+4
                                if states.indexTrackVariants and farmIndexFocusBase==target then
                                    farmIndexFocusBase=nil
                                end
                                SLbl.Text="⏭ Despawned mid-move: "..needKey.." (skip 4s)"
                                task.wait(0.4)
                                return
                            end
                            if not isInBattle() then
                                pcall(function() RequestBattle:FireServer(battleModel) end)
                                local appeared=false
                                for _=1,8 do
                                    if isInBattle() then appeared=true break end
                                    task.wait(0.25)
                                end
                                if appeared then
                                    indexRetryCount[failKey]=0
                                    while isInBattle() and states.autoFarmIndex do
                                        task.wait(0.35)
                                    end
                                else
                                    markIndexNoBattleFail(failKey, needKey, need)
                                end
                            end
                        else
                            task.wait(0.5)
                        end
                    else
                        if states.indexTrackVariants then
                            farmIndexFocusBase=nil
                        end
                        task.wait(0.4)
                    end
                    task.wait(1)
                end
            else
                task.wait(0.4)
            end
        end)
        if not loopOk then
            statusLastError="IndexLoop: "..tostring(loopErr):sub(1,80)
            pcall(function() SLbl.Text="⚠ Index error (recovering): "..tostring(loopErr):sub(1,50) end)
            task.wait(2)
        end
    end
end)

-- Auto Farm Sparking loop (Safari random Sparking spawns)
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        local loopOk,loopErr=pcall(function()
            if states.autoFarmSparking then
                if not canRunMode("AutoFarmSparking") then
                    task.wait(0.6)
                    return
                end
                if isInBattle() then
                    task.wait(0.8)
                    return
                end
                local model,petName=findSafariSparkingModel()
                if not model then
                    task.wait(1.0)
                    return
                end
                SLbl.Text="✨ Safari Sparking found: "..petName
                applyPresetTeam("Farm"); task.wait(0.2)
                if not states.farmNoTP then
                    pcall(function()
                        local root=getRoot(); if not root then return end
                        local pos=model:GetModelCFrame().Position
                        if (root.Position-pos).Magnitude>30 then
                            root.CFrame=CFrame.new(pos+Vector3.new(0,5,0))
                            task.wait(0.45)
                        end
                    end)
                end
                if not isInBattle() then
                    pcall(function() RequestBattle:FireServer(model) end)
                    local appeared=false
                    for _=1,8 do
                        if isInBattle() then appeared=true break end
                        task.wait(0.25)
                    end
                    if appeared then
                        while isInBattle() and states.autoFarmSparking do
                            task.wait(0.35)
                        end
                    else
                        task.wait(0.6)
                    end
                end
            else
                task.wait(0.4)
            end
        end)
        if not loopOk then
            statusLastError="SparkLoop: "..tostring(loopErr):sub(1,80)
            pcall(function() SLbl.Text="⚠ Sparking error (recovering): "..tostring(loopErr):sub(1,50) end)
            task.wait(2)
        end
    end
end)

-- Farm status dot updater
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        task.wait(1)
        if not FSBattle or not FSBattle.Parent then break end
        local inBattle=isInBattle()
        if states.farmActive then
            pcall(function()
                FSBattle.Text=inBattle and "● In battle" or "● Not in battle"
                FSBattle.TextColor3=inBattle and C.green or C.sub
            end)
            local cnt=0; for _ in pairs(farmTargets) do cnt=cnt+1 end
            if canRunMode("AutoFarm") then
                pcall(function() FSStatus.Text="ON · "..cnt.." target(s)" end)
            else
                pcall(function() FSStatus.Text="⏸ Paused by priority" end)
            end
        end
    end
end)

end -- farm do block

-- ============================================================
--  DRAGON BALL TAB  — full custom UI
-- ============================================================
local DBStatus, DBFound, dbDots, DBLog, setDragon
do
local DBStatusCard=Instance.new("Frame",PDragon)
DBStatusCard.Size=UDim2.new(1,-10,0,72); DBStatusCard.BackgroundColor3=C.card; DBStatusCard.BorderSizePixel=0; DBStatusCard.LayoutOrder=1; Instance.new("UICorner",DBStatusCard).CornerRadius=UDim.new(0,10)
local dbsc=Instance.new("UIStroke",DBStatusCard); dbsc.Color=C.border; dbsc.Thickness=1
local DBTitle=Instance.new("TextLabel",DBStatusCard); DBTitle.Text="Dragon Ball Collector"; DBTitle.Size=UDim2.new(1,-100,0,18); DBTitle.Position=UDim2.new(0,14,0,8); DBTitle.BackgroundTransparency=1; DBTitle.TextColor3=C.text; DBTitle.Font=Enum.Font.GothamBold; DBTitle.TextSize=13; DBTitle.TextXAlignment=Enum.TextXAlignment.Left
DBStatus=Instance.new("TextLabel",DBStatusCard); DBStatus.Text="OFF · Waiting for balls to spawn"; DBStatus.Size=UDim2.new(1,-100,0,13); DBStatus.Position=UDim2.new(0,14,0,28); DBStatus.BackgroundTransparency=1; DBStatus.TextColor3=C.sub; DBStatus.Font=Enum.Font.Code; DBStatus.TextSize=9; DBStatus.TextXAlignment=Enum.TextXAlignment.Left
DBFound=Instance.new("TextLabel",DBStatusCard); DBFound.Text="Found: 0/7"; DBFound.Size=UDim2.new(1,-100,0,12); DBFound.Position=UDim2.new(0,14,0,44); DBFound.BackgroundTransparency=1; DBFound.TextColor3=Color3.fromRGB(255,210,50); DBFound.Font=Enum.Font.Code; DBFound.TextSize=9; DBFound.TextXAlignment=Enum.TextXAlignment.Left
local DBPill=Instance.new("Frame",DBStatusCard); DBPill.Size=UDim2.new(0,44,0,24); DBPill.Position=UDim2.new(1,-50,0.5,-12); DBPill.BackgroundColor3=C.border; DBPill.BorderSizePixel=0; Instance.new("UICorner",DBPill).CornerRadius=UDim.new(1,0)
local DBThumb=Instance.new("Frame",DBPill); DBThumb.Size=UDim2.new(0,18,0,18); DBThumb.Position=UDim2.new(0,3,0.5,-9); DBThumb.BackgroundColor3=C.sub; DBThumb.BorderSizePixel=0; Instance.new("UICorner",DBThumb).CornerRadius=UDim.new(1,0)
local dbti=TweenInfo.new(0.18,Enum.EasingStyle.Quad)
setDragon=function(on)
    states.dragonBall=on; saveSettings()
    if on then
        TweenService:Create(DBPill,dbti,{BackgroundColor3=Color3.fromRGB(160,120,0)}):Play()
        TweenService:Create(DBThumb,dbti,{Position=UDim2.new(0,23,0.5,-9),BackgroundColor3=C.gold}):Play()
        dbsc.Color=Color3.fromRGB(160,120,0); DBTitle.TextColor3=C.gold
        DBStatus.Text="ON · Scanning for Dragon Balls..."
    else
        TweenService:Create(DBPill,dbti,{BackgroundColor3=C.border}):Play()
        TweenService:Create(DBThumb,dbti,{Position=UDim2.new(0,3,0.5,-9),BackgroundColor3=C.sub}):Play()
        dbsc.Color=C.border; DBTitle.TextColor3=C.text
        DBStatus.Text="OFF · Waiting for balls to spawn"
    end
end
task.defer(function() if states.dragonBall then setDragon(true) end end)
local DBPillBtn=Instance.new("TextButton",DBPill); DBPillBtn.Size=UDim2.new(1,0,1,0); DBPillBtn.BackgroundTransparency=1; DBPillBtn.Text=""; DBPillBtn.ZIndex=3; DBPillBtn.MouseButton1Click:Connect(function() setDragon(not states.dragonBall) end)

local DBGrid=Instance.new("Frame",PDragon); DBGrid.Size=UDim2.new(1,-10,0,38); DBGrid.BackgroundColor3=C.card; DBGrid.BorderSizePixel=0; DBGrid.LayoutOrder=2; Instance.new("UICorner",DBGrid).CornerRadius=UDim.new(0,10); Instance.new("UIStroke",DBGrid).Color=C.border
local dbGridLayout=Instance.new("UIListLayout",DBGrid); dbGridLayout.FillDirection=Enum.FillDirection.Horizontal; dbGridLayout.HorizontalAlignment=Enum.HorizontalAlignment.Center; dbGridLayout.VerticalAlignment=Enum.VerticalAlignment.Center; dbGridLayout.Padding=UDim.new(0,6)
dbDots={}
for i=1,7 do
    local dot=Instance.new("Frame",DBGrid); dot.Size=UDim2.new(0,28,0,28); dot.BackgroundColor3=Color3.fromRGB(30,25,5); dot.BorderSizePixel=0; Instance.new("UICorner",dot).CornerRadius=UDim.new(1,0)
    local num=Instance.new("TextLabel",dot); num.Text=tostring(i); num.Size=UDim2.new(1,0,1,0); num.BackgroundTransparency=1; num.TextColor3=Color3.fromRGB(100,80,20); num.Font=Enum.Font.GothamBold; num.TextSize=11
    dbDots[i]=dot
end
DBLog=Instance.new("TextLabel",PDragon); DBLog.Size=UDim2.new(1,-10,0,20); DBLog.BackgroundTransparency=1; DBLog.LayoutOrder=3; DBLog.TextColor3=C.sub; DBLog.Font=Enum.Font.Code; DBLog.TextSize=9; DBLog.TextXAlignment=Enum.TextXAlignment.Left; DBLog.Text="  Waiting..."
end -- dragon tab UI


-- ============================================================
--  WEBHOOK
-- ============================================================
local function sendWebhook()
    if WEBHOOK_URL=="" then return end
    pcall(function()
        local HS=game:GetService("HttpService")
        local plr=LP.Name
        local uid=tostring(LP.UserId)
        local placeId=tostring(game.PlaceId)
        local server=game.JobId~="" and game.JobId:sub(1,8).."…" or "Studio"
        local isRe=_G.AniPixelsRunning and true or false

        local active={}
        for k,v in pairs(states) do if v==true then active[#active+1]=k end end
        table.sort(active)
        local toggleStr=#active>0 and ("`"..table.concat(active,"` `").."`") or "*none*"

        local mergeCount=0; for _ in pairs(mergeTargets) do mergeCount=mergeCount+1 end
        local farmCount=0; for _ in pairs(farmTargets) do farmCount=farmCount+1 end
        local doorCount=0; for _ in pairs(selectedDoors) do doorCount=doorCount+1 end
        local missingIndex=countMissingIndexTargets()
        local prioText=modePriorityText()

        local fields={
            {name="👤  Player",value="`"..plr.."`",inline=true},
            {name="🆔  User ID",value="`"..uid.."`",inline=true},
            {name="🌐  Place ID",value="`"..placeId.."`",inline=true},
            {name="🖥️  Server",value="`"..server.."`",inline=true},
            {name="⚙️  Active Features",value=toggleStr,inline=false},
            {name="🥇 Priority Order",value="`"..prioText.."`",inline=false},
            {name="🎯 Target Counts",value=string.format("Merge `%d` • Farm `%d` • Doors `%d`",mergeCount,farmCount,doorCount),inline=false},
            {name="📚 Index Progress",value=string.format("Missing `%d` from discovered list",missingIndex),inline=false},
            {name="🔧 Merge Config",value=string.format("Threshold `x%d` • Cap `%s`",mergeThreshold,getTierLabel(mergeMaxTier)),inline=false},
        }

        httpRequest({
            Url=WEBHOOK_URL,
            Method="POST",
            Headers={["Content-Type"]="application/json"},
            Body=HS:JSONEncode({
                username="AniPixels",
                avatar_url="https://tr.rbxcdn.com/30DAY-AvatarHeadshot/"..uid.."/150/150/png/noFilter",
                embeds={{
                    author={name=plr.."  •  "..uid,icon_url="https://tr.rbxcdn.com/30DAY-AvatarHeadshot/"..uid.."/150/150/png/noFilter"},
                    title=isRe and "♻️  Script Re-Executed" or "🚀  Script Executed",
                    color=isRe and 0xFF8C00 or 0x5865F2,
                    fields=fields,
                    thumbnail={url="https://tr.rbxcdn.com/30DAY-AvatarHeadshot/"..uid.."/150/150/png/noFilter"},
                    footer={text="AniPixels v5.0  •  Place "..placeId,icon_url="https://www.roblox.com/favicon.ico"}
                }}
            })
        })
    end)
end
_G.AniPixelsRunning=true
task.spawn(sendWebhook)

-- ============================================================
--  FEATURE LOGIC LOOPS
-- ============================================================
UserInputService.JumpRequest:Connect(function()
    if RUN_GEN~=_G.AniPixels_RunGen then return end
    if states.infJump then local h=getHuman(); if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end end
end)

-- noclip: cache character parts (avoids per-frame GetDescendants)
local noclipParts={}
local noclipConns={}
local function clearNoclipConns()
    for i=1,#noclipConns do pcall(function() noclipConns[i]:Disconnect() end) end
    noclipConns={}
end
local function rebuildNoclipParts(char)
    table.clear(noclipParts)
    clearNoclipConns()
    if not char then return end
    for _,d in ipairs(char:GetDescendants()) do
        if d:IsA("BasePart") then noclipParts[#noclipParts+1]=d end
    end
    noclipConns[#noclipConns+1]=char.DescendantAdded:Connect(function(d)
        if d:IsA("BasePart") then noclipParts[#noclipParts+1]=d end
    end)
    noclipConns[#noclipConns+1]=char.DescendantRemoving:Connect(function(d)
        if not d:IsA("BasePart") then return end
        for i=#noclipParts,1,-1 do
            if noclipParts[i]==d then
                table.remove(noclipParts,i)
            end
        end
    end)
end
rebuildNoclipParts(getChar())

local _lastNoclipPrune=0
RunService.Stepped:Connect(function()
    if RUN_GEN~=_G.AniPixels_RunGen then return end
    if not states.noclip then return end
    local now=os.clock()
    if now-_lastNoclipPrune>5 then
        _lastNoclipPrune=now
        for i=#noclipParts,1,-1 do
            local p=noclipParts[i]
            if not (p and p.Parent) then table.remove(noclipParts,i) end
        end
    end
    for i=1,#noclipParts do
        local p=noclipParts[i]
        if p and p.Parent then p.CanCollide=false end
    end
end)

-- god mode: throttle to reduce heartbeat work
local _lastGod=0
RunService.Heartbeat:Connect(function()
    if RUN_GEN~=_G.AniPixels_RunGen then return end
    if not states.godMode then return end
    local now=os.clock()
    if now-_lastGod < 0.5 then return end
    _lastGod=now
    local h=getHuman()
    if h then
        if h.MaxHealth~=math.huge then h.MaxHealth=math.huge end
        if h.Health~=math.huge then h.Health=math.huge end
    end
end)
RunService.Heartbeat:Connect(function()
    if RUN_GEN~=_G.AniPixels_RunGen then return end
    if states.fly then
        local root=getRoot(); if not root then return end
        if not flyBV then flyBV=Instance.new("BodyVelocity",root); flyBV.MaxForce=Vector3.new(1e5,1e5,1e5); flyBV.Velocity=Vector3.zero end
        if not flyBG then flyBG=Instance.new("BodyGyro",root); flyBG.MaxTorque=Vector3.new(1e5,1e5,1e5); flyBG.D=100 end
        local cam=workspace.CurrentCamera; local spd=60; local mv=Vector3.zero
        if UserInputService:IsKeyDown(Enum.KeyCode.W) then mv=mv+cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.S) then mv=mv-cam.CFrame.LookVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.A) then mv=mv-cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.D) then mv=mv+cam.CFrame.RightVector end
        if UserInputService:IsKeyDown(Enum.KeyCode.E) then mv=mv+Vector3.new(0,1,0) end
        if UserInputService:IsKeyDown(Enum.KeyCode.Q) then mv=mv-Vector3.new(0,1,0) end
        if mv.Magnitude>0 then mv=mv.Unit end
        flyBV.Velocity=mv*spd; flyBG.CFrame=cam.CFrame
        local h=getHuman(); if h then h:ChangeState(Enum.HumanoidStateType.Physics) end
    else if flyBV then flyBV:Destroy(); flyBV=nil end; if flyBG then flyBG:Destroy(); flyBG=nil end end
end)

-- full bright: apply once on enable, restore on disable
local _fullBrightApplied=false
local _origLighting={
    Ambient=Lighting.Ambient,
    OutdoorAmbient=Lighting.OutdoorAmbient,
    Brightness=Lighting.Brightness,
    FogEnd=Lighting.FogEnd,
    FogStart=Lighting.FogStart,
}
RunService.Heartbeat:Connect(function()
    if RUN_GEN~=_G.AniPixels_RunGen then return end
    if states.fullBright then
        if _fullBrightApplied then return end
        _fullBrightApplied=true
        Lighting.Ambient=Color3.fromRGB(255,255,255)
        Lighting.OutdoorAmbient=Color3.fromRGB(255,255,255)
        Lighting.Brightness=10
        Lighting.FogEnd=1e6
        Lighting.FogStart=1e6
    elseif _fullBrightApplied then
        _fullBrightApplied=false
        Lighting.Ambient=_origLighting.Ambient
        Lighting.OutdoorAmbient=_origLighting.OutdoorAmbient
        Lighting.Brightness=_origLighting.Brightness
        Lighting.FogEnd=_origLighting.FogEnd
        Lighting.FogStart=_origLighting.FogStart
    end
end)
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        task.wait(55)
        if states.antiAfk then
            pcall(function() VirtualUser:CaptureController(); VirtualUser:ClickButton2(Vector2.new()) end)
            local r=getRoot(); if r then r.CFrame=r.CFrame*CFrame.new(0,0,0.001) end
        end
    end
end)

task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        local loopOk,loopErr=pcall(function()
            if states.autoPVP and canRunMode("PVP") and not isInBattle() then
                applyPresetTeam("PVP")
                task.wait(0.15)
                local ok,err=pcall(function() RemotePVP:FireServer() end)
                if not ok then
                    SLbl.Text="❌ RemotePVP: "..tostring(err)
                    task.wait(1.2)
                else
                    task.wait(0.8)
                end
            else
                task.wait(0.3)
            end
        end)
        if not loopOk then
            statusLastError="PVPLoop: "..tostring(loopErr):sub(1,80)
            pcall(function() SLbl.Text="⚠ PVP error (recovering): "..tostring(loopErr):sub(1,50) end)
            task.wait(2)
        end
    end
end)

local function buildESP(p)
    if p==LP then return end
    local char=p.Character; if not char then return end
    local human=char:FindFirstChildOfClass("Humanoid"); if not human then return end
    local head=char:FindFirstChild("Head"); if not head or not head:IsA("BasePart") then return end
    if espBillboards[p.Name] then pcall(function() espBillboards[p.Name]:Destroy() end); espBillboards[p.Name]=nil end
    local ok,bb=pcall(function()
        local b=Instance.new("BillboardGui",head); b.Size=UDim2.new(0,100,0,26); b.StudsOffset=Vector3.new(0,2.8,0); b.AlwaysOnTop=true
        local lbl=Instance.new("TextLabel",b); lbl.Size=UDim2.new(1,0,1,0); lbl.BackgroundTransparency=1; lbl.Text=p.Name; lbl.TextColor3=C.accent; lbl.Font=Enum.Font.GothamBold; lbl.TextSize=13; lbl.TextStrokeTransparency=0.3
        return b
    end)
    if ok then espBillboards[p.Name]=bb end
end

-- ESP: poll at a lower rate than Heartbeat
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        if states.esp then
            for _,p in ipairs(Players:GetPlayers()) do
                if p~=LP then
                    local head=p.Character and p.Character:FindFirstChild("Head")
                    if head and not espBillboards[p.Name] then
                        buildESP(p)
                    elseif (not head) and espBillboards[p.Name] then
                        pcall(function() espBillboards[p.Name]:Destroy() end)
                        espBillboards[p.Name]=nil
                    end
                end
            end
        end
        task.wait(0.5)
    end
end)
-- Apply saved walk speed immediately on load
do local h=getHuman(); if h then h.WalkSpeed=walkSpeed end end

LP.CharacterAdded:Connect(function(c)
    if RUN_GEN~=_G.AniPixels_RunGen then return end
    task.wait(1); local h=c:WaitForChild("Humanoid"); h.WalkSpeed=walkSpeed
    if flyBV then flyBV:Destroy(); flyBV=nil end
    if flyBG then flyBG:Destroy(); flyBG=nil end
    rebuildNoclipParts(c)
end)

-- ── Boss loops ─────────────────────────────────────────────────
local function getAreaBossNames()
    local names,seen={},{}
    local defaults={"Pain","Kars","Final Form Muzan","Awakened Mahito"}
    for _,n in ipairs(defaults) do
        names[#names+1]=n
        seen[n]=true
    end
    pcall(function()
        local rs=game:GetService("ReplicatedStorage")
        local assets=rs:FindFirstChild("Assets")
        local ab=assets and assets:FindFirstChild("AreaBosses")
        if not ab then return end
        for _,c in ipairs(ab:GetChildren()) do
            if not seen[c.Name] then
                seen[c.Name]=true
                names[#names+1]=c.Name
            end
        end
    end)
    return names
end
local function getActiveAreaBossModel()
    local campaign=getCampaign(); if not campaign then return nil,nil end
    for _,name in ipairs(getAreaBossNames()) do
        local model=campaign:FindFirstChild(name)
        if model then
            local hum=model:FindFirstChildOfClass("Humanoid")
            local alive=(not hum) or hum.Health>0
            if alive then return model,name end
        end
    end
    return nil,nil
end

task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        local loopOk,loopErr=pcall(function()
            if states.autoAreaBosses then
                if not canRunMode("AreaBosses") then
                    SLbl.Text="⏸ Area Bosses paused by priority: "..modePriorityText()
                    task.wait(0.6)
                elseif isInBattle() then
                    SLbl.Text="⏳ In battle, waiting (Area Bosses)"
                    task.wait(1.2)
                else
                    local model,name=getActiveAreaBossModel()
                    if not model then
                        SLbl.Text="⏳ Waiting for Area Boss spawn..."
                        task.wait(1)
                    else
                        applyPresetTeam("AreaBosses"); task.wait(0.2)
                        if not states.bossNoTP then
                            pcall(function()
                                local root=getRoot(); if root then
                                    local pos=model:GetModelCFrame().Position
                                    if (root.Position-pos).Magnitude>50 then root.CFrame=CFrame.new(pos+Vector3.new(0,5,0)); task.wait(0.5) end
                                end
                            end)
                        end
                        pcall(function() RequestBattle:FireServer(model) end)
                        SLbl.Text="👑 Area Boss: "..name
                        task.wait(2)
                    end
                end
            else
                task.wait(0.25)
            end
        end)
        if not loopOk then
            statusLastError="AreaBossLoop: "..tostring(loopErr):sub(1,80)
            pcall(function() SLbl.Text="⚠ Area Boss error (recovering): "..tostring(loopErr):sub(1,50) end)
            task.wait(2)
        end
    end
end)

local function bossLoop(key,path)
    task.spawn(function()
        local myGen=RUN_GEN
        while true do
            if myGen~=_G.AniPixels_RunGen then break end
            local loopOk,loopErr=pcall(function()
                if states[key] then
                    if not canRunMode("RaidBosses") then SLbl.Text="⏸ Raid Bosses paused by priority: "..modePriorityText(); task.wait(0.6)
                    elseif isInBattle() then SLbl.Text="⏳ In battle, waiting: "..path; task.wait(2)
                    elseif not isBossPresent(path) then SLbl.Text="⏳ Boss not found: "..path; task.wait(1)
                    else
                        applyPresetTeam("Raid"); task.wait(0.2)
                        local bossModel=nil
                        pcall(function()
                            local campaign=workspace:WaitForChild("Campaign",3)
                            bossModel=campaign and campaign:FindFirstChild(path)
                        end)
                        if bossModel then
                            if not states.bossNoTP then
                                pcall(function()
                                    local root=getRoot(); if root then
                                        local pos=bossModel:GetModelCFrame().Position
                                        if (root.Position-pos).Magnitude>50 then root.CFrame=CFrame.new(pos+Vector3.new(0,5,0)); task.wait(0.5) end
                                    end
                                end)
                            end
                            pcall(function() RequestBattle:FireServer(bossModel) end); SLbl.Text="⚔ Fired: "..path
                            task.wait(8)
                            if states[key] and not isInBattle() and isBossPresent(path) and not isBossDead(path) then
                                pcall(function() RequestBattle:FireServer(bossModel) end); SLbl.Text="🔁 Re-fired: "..path
                            end
                        else SLbl.Text="⚠ Boss model not found: "..path end
                        task.wait(autoFightDelay)
                    end
                else task.wait(0.2) end
            end)
            if not loopOk then
                statusLastError="RaidLoop("..path.."): "..tostring(loopErr):sub(1,60)
                pcall(function() SLbl.Text="⚠ Raid error (recovering): "..tostring(loopErr):sub(1,50) end)
                task.wait(2)
            end
        end
    end)
end
bossLoop("autoBoros","Boros"); bossLoop("autoZamasu","Fusion Zamasu (Corrupted)")
bossLoop("autoSukuna","Heian Era Sukuna"); bossLoop("autoAllForOne","All For One")
bossLoop("autoDioHeaven","Dio Over Heaven"); bossLoop("autoMadara","Madara Ten Tails")

-- ── Trials loop ────────────────────────────────────────────────
local TrialsMode=game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("TrialsMode")
local BattleResult=game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("BattleResult")

task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        local loopOk,loopErr=pcall(function()
            if not states.trialsActive then task.wait(0.3); return end
            if not canRunMode("Trials") then
                TSLbl.Text="⏸ Paused by priority"
                task.wait(0.6)
                return
            end
            TSLbl.Text="▶ Starting trial session..."
            local startOk,startErr=pcall(function() TrialsMode:FireServer({Start=true}) end)
            if not startOk then TSLbl.Text="❌ TrialsMode: "..tostring(startErr); task.wait(2); return end
            local battleModel=nil
            for _=1,6 do battleModel=findTrialsModel(); if battleModel then break end; task.wait(0.5) end
            if not battleModel then TSLbl.Text="⚠ No cooler model found after 3s"; task.wait(2); return end
            local coolerIndex=1; pcall(function() coolerIndex=battleModel:GetAttribute("CoolerIndex") or 1 end)
            applyPresetTeam("Trials"); task.wait(0.2)
            if not states.trialsNoTP then
                pcall(function()
                    local root=getRoot(); if not root then return end
                    local hrp=battleModel:FindFirstChild("HumanoidRootPart")
                    local pos=hrp and hrp.Position or battleModel:GetModelCFrame().Position
                    root.CFrame=CFrame.new(pos+Vector3.new(0,5,0))
                end); task.wait(0.3)
            end
            local waveLabel=nil
            do
                local sg=playerGui:FindFirstChild("ScreenGui")
                local tf=sg and sg:FindFirstChild("Trials")
                waveLabel=tf and tf:FindFirstChild("WaveLabel")
            end
            local function getWave()
                local wl=waveLabel
                if not (wl and wl.Parent) then return 0 end
                local n=tonumber((wl.ContentText or ""):match("%d+"))
                return n or 0
            end
            local currentWave=getWave(); local sessionAlive=true
            local lastTp=0
            while states.trialsActive and sessionAlive do
                if RUN_GEN~=_G.AniPixels_RunGen then break end
                if not states.trialsNoTP then
                    local now=os.clock()
                    if now-lastTp>2 then
                        lastTp=now
                        pcall(function()
                            local root=getRoot(); if not root then return end
                            local hrp=battleModel:FindFirstChild("HumanoidRootPart")
                            local pos=hrp and hrp.Position or battleModel:GetModelCFrame().Position
                            if (root.Position-pos).Magnitude>25 then
                                root.CFrame=CFrame.new(pos+Vector3.new(0,5,0))
                            end
                        end)
                    end
                end
                currentWave=getWave()
                TSLbl.Text="⚔ Wave "..currentWave.."/"..(states.trialsNoLeave and "∞" or tostring(leaveWave))
                if not states.trialsNoLeave and currentWave>=leaveWave then
                    TSLbl.Text="🚪 Leaving at Wave "..currentWave.."..."
                    pcall(function() TrialsMode:FireServer({Exit=true}) end); task.wait(1.5); sessionAlive=false; break
                end
                pcall(function() RequestBattle:FireServer(nil,coolerIndex) end)
                local appeared=false
                for _=1,10 do task.wait(0.5); if isInBattle() then appeared=true; break end end
                if appeared then
                    local t=0
                    while isInBattle() and states.trialsActive do
                        if RUN_GEN~=_G.AniPixels_RunGen then break end
                        task.wait(0.3); t=t+0.3; if t>300 then sessionAlive=false; break end
                    end
                    if trialsDelay>0 then TSLbl.Text="⏳ Spawning... ("..trialsDelay.."s)"; task.wait(trialsDelay) end
                else TSLbl.Text="⚠ Battle didn't appear, retrying..."; task.wait(trialsRetryDelay) end
            end
            task.wait(1)
        end)
        if not loopOk then
            statusLastError="TrialsLoop: "..tostring(loopErr):sub(1,80)
            pcall(function() SLbl.Text="⚠ Trials error (recovering): "..tostring(loopErr):sub(1,50) end)
            task.wait(2)
        end
    end
end)

-- ── Door unlock loop ───────────────────────────────────────────
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        if states.doorUnlock then
            local allMissing={}
            local missingSet={}
            for doorName,_ in pairs(selectedDoors) do
                local needs=DOOR_CONFIG[doorName] or {}
                for _,n in ipairs(needs) do
                    local have=checkOwned(n.pet)
                    if not have then
                        if not missingSet[n.pet] then
                            missingSet[n.pet]=true
                            table.insert(allMissing,{pet=n.pet,door=doorName})
                        end
                    end
                end
            end
            if next(selectedDoors)==nil then DoorStatusLbl.Text="  Select doors to unlock"; task.wait(1); continue end
            if #allMissing==0 then
                DoorStatusLbl.Text="✨ All doors unlocked!"; SLbl.Text="🔓 All doors done!"
                states.doorUnlock=false; saveSettings(); task.wait(3)
            else
                local target=allMissing[1]; DoorStatusLbl.Text="⚔ "..target.door..": farming "..target.pet; SLbl.Text="🔓 Need: "..target.pet
                if isInBattle() then task.wait(2); continue end
                local root=getRoot(); if not root then task.wait(1); continue end
                local battleModel=findCampaignModelForPet(target.pet)
                if battleModel then
                    if not states.farmNoTP then
                        pcall(function()
                            local pos=battleModel:GetModelCFrame().Position
                            if (root.Position-pos).Magnitude>30 then root.CFrame=CFrame.new(pos+Vector3.new(0,5,0)); task.wait(0.5) end
                        end)
                    end
                    pcall(function() RequestBattle:FireServer(battleModel) end)
                else DoorStatusLbl.Text="⚠ Can't find model for: "..target.pet; task.wait(2) end
                task.wait(autoFightDelay+1)
            end
        else task.wait(0.3) end
    end
end)

-- ── Dragon Ball loop ───────────────────────────────────────────
local VIM_DB=game:GetService("VirtualInputManager")
local ws=workspace

-- Track world dragon balls without repeated FindFirstChild scans.
local worldBalls={}        -- [idx]=Instance
local worldBallCount=0
local function trackBall(inst)
    if not inst then return end
    local idx=tonumber(tostring(inst.Name):match("^DragonBall(%d)$"))
    if idx and idx>=1 and idx<=7 then
        if not worldBalls[idx] then worldBallCount=worldBallCount+1 end
        worldBalls[idx]=inst
    end
end
local function untrackBall(inst)
    if not inst then return end
    local idx=tonumber(tostring(inst.Name):match("^DragonBall(%d)$"))
    if idx and worldBalls[idx]==inst then
        worldBalls[idx]=nil
        worldBallCount=math.max(0,worldBallCount-1)
    end
end
for _,c in ipairs(ws:GetChildren()) do trackBall(c) end
ws.ChildAdded:Connect(trackBall)
ws.ChildRemoved:Connect(untrackBall)

-- Cache backpack UI + slots (UI can respawn).
local backpackGui=nil
local backpackSlots=nil
local function bindBackpack()
    backpackGui=nil
    backpackSlots=nil
    local sg=playerGui:FindFirstChild("ScreenGui")
    local bp=sg and sg:FindFirstChild("DragonBallBackpack")
    if not bp then return end
    local slots={}
    for i=1,7 do
        slots[i]=bp:FindFirstChild(tostring(i))
    end
    backpackGui=bp
    backpackSlots=slots
end
bindBackpack()
playerGui.DescendantAdded:Connect(function(d)
    if backpackGui then return end
    if d and d.Name=="DragonBallBackpack" then
        task.defer(bindBackpack)
    end
end)
playerGui.DescendantRemoving:Connect(function(d)
    if d==backpackGui then
        backpackGui=nil
        backpackSlots=nil
    end
end)

local function countBackpackBalls()
    local slots=backpackSlots
    if not slots then
        bindBackpack()
        slots=backpackSlots
        if not slots then return 0 end
    end
    local count=0
    for i=1,7 do
        local slot=slots[i]
        if slot and slot.Parent and slot.Visible then count=count+1 end
    end
    return count
end
task.spawn(function()
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        if states.dragonBall then
            local root=getRoot(); if not root then task.wait(1); continue end
            local owned=countBackpackBalls()
            if owned>=7 then
                DBStatus.Text="✨ You have all 7! Make a wish!"; DBFound.Text="Owned: 7/7"; SLbl.Text="All 7 Dragon Balls owned!"
                for i=1,7 do if dbDots[i] then dbDots[i].BackgroundColor3=Color3.fromRGB(255,210,50); local n=dbDots[i]:FindFirstChildOfClass("TextLabel"); if n then n.TextColor3=Color3.fromRGB(0,0,0) end end end
                task.wait(3)
            else
                local found={}
                for i=1,7 do
                    local ball=worldBalls[i]
                    if ball and ball.Parent then
                        found[#found+1]={idx=i,model=ball}
                    end
                end
                for i=1,7 do
                    if dbDots[i] then
                        local inWorld=worldBalls[i]~=nil
                        dbDots[i].BackgroundColor3=inWorld and Color3.fromRGB(220,160,0) or Color3.fromRGB(30,25,5)
                        local numLbl=dbDots[i]:FindFirstChildOfClass("TextLabel"); if numLbl then numLbl.TextColor3=inWorld and Color3.fromRGB(255,255,255) or Color3.fromRGB(100,80,20) end
                    end
                end
                DBFound.Text="Owned: "..owned.."/7 · World: "..#found
                if #found==0 then DBStatus.Text="⏳ Waiting for Dragon Balls to spawn..."; SLbl.Text="Dragon Balls: none spawned"; task.wait(3)
                else
                    for _,entry in ipairs(found) do
                        if not states.dragonBall then break end
                        owned=countBackpackBalls(); if owned>=7 then break end
                        local ball=entry.model; local pos
                        pcall(function()
                            pos=ball:IsA("Model") and ball:GetModelCFrame().Position
                                or ball:IsA("BasePart") and ball.Position
                                or ball:FindFirstChildOfClass("BasePart") and ball:FindFirstChildOfClass("BasePart").Position
                        end)
                        if pos then
                            DBStatus.Text="🟡 Going to Ball "..entry.idx.." (have "..owned..")"
                            SLbl.Text="Dragon Ball "..entry.idx.." → TP"
                            DBLog.Text="  Ball "..entry.idx.." at "..string.format("%.0f, %.0f, %.0f",pos.X,pos.Y,pos.Z)
                            root.CFrame=CFrame.new(pos+Vector3.new(0,4,0)); task.wait(0.5)
                            VIM_DB:SendKeyEvent(true,Enum.KeyCode.E,false,game); task.wait(0.15)
                            VIM_DB:SendKeyEvent(false,Enum.KeyCode.E,false,game); task.wait(0.8)
                            DBStatus.Text="✓ Collected Ball "..entry.idx
                        end
                    end
                    task.wait(2)
                end
            end
        else task.wait(0.3) end
    end
end)

-- ── Auto re-exec + server hop ──────────────────────────────────
do
local REEXEC_URL="https://raw.githubusercontent.com/headshot7535-png/AniPixels/main/AniPixels%20V4.0"
if _G.AniPixels_AutoRejoin and not states.autoReExec then states.autoReExec=true; saveSettings() end
local function syncRejoinFlag() _G.AniPixels_AutoRejoin=states.autoReExec end
syncRejoinFlag()
pcall(function()
    game:GetService("Players").LocalPlayer.OnTeleport:Connect(function(teleportState)
        if teleportState==Enum.TeleportState.RequestedByServer then
            syncRejoinFlag()
            if queue_on_teleport and states.autoReExec then
                pcall(function() queue_on_teleport('loadstring(game:HttpGet("'..REEXEC_URL..'",true))()') end)
            end
        end
    end)
end)
local function armQueue() pcall(function() if queue_on_teleport and states.autoReExec then queue_on_teleport('loadstring(game:HttpGet("'..REEXEC_URL..'",true))()') end end) end
armQueue()
task.spawn(function()
    local wasOn=false
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        task.wait(2); syncRejoinFlag()
        if states.autoReExec and not wasOn then pcall(armQueue) end
        wasOn=states.autoReExec
    end
end)

-- Server hop
task.spawn(function()
    local TeleportService=game:GetService("TeleportService")
    local HttpService=game:GetService("HttpService")
    local placeId=game.PlaceId; local currentJobId=game.JobId; local isHopping=false
    local function countDragonBalls() return worldBallCount end
    local function hopToNext()
        if isHopping then return end; isHopping=true
        SLbl.Text="🌐 Finding next server..."
        local nextServerId=nil
        pcall(function()
            local url="https://games.roblox.com/v1/games/"..placeId.."/servers/Public?sortOrder=Asc&limit=100"
            local res=HttpService:JSONDecode(game:HttpGet(url))
            if res and res.data then
                for _,srv in ipairs(res.data) do
                    if srv.id~=currentJobId and srv.playing<srv.maxPlayers then nextServerId=srv.id; break end
                end
            end
        end)
        pcall(armQueue)
        _G.AniPixels_ServerHop=true; task.wait(0.3)
        if nextServerId then SLbl.Text="🌐 Hopping..."; pcall(function() TeleportService:TeleportToPlaceInstance(placeId,nextServerId) end)
        else SLbl.Text="🌐 No server found, rejoining..."; pcall(function() TeleportService:Teleport(placeId) end) end
        task.wait(15); isHopping=false
    end
    if _G.AniPixels_ServerHop then
        _G.AniPixels_ServerHop=nil
        task.defer(function() if setServerHop then setServerHop(true) end end)
    end
    while true do
        if RUN_GEN~=_G.AniPixels_RunGen then break end
        if states.serverHop and not isHopping then
            SLbl.Text="🌐 Waiting "..hopDelay.."s for balls to spawn..."; task.wait(hopDelay)
            local ballCount=countDragonBalls(); SLbl.Text="🌐 Server check: "..ballCount.."/7 Dragon Balls"
            if ballCount>0 then
                SLbl.Text="🟡 "..ballCount.." ball(s) found! Collecting..."
                if not states.dragonBall then states.dragonBall=true; setDragon(true) end
                -- wait until all collected or dragonBall turned off
                local timeout=0
                while states.dragonBall and timeout<120 do
                    if RUN_GEN~=_G.AniPixels_RunGen then break end
                    task.wait(3); timeout=timeout+3
                    if countBackpackBalls()>=7 then break end
                end
            else hopToNext() end
        else task.wait(1) end
    end
end)
end -- auto re-exec do
